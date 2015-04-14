<?php

namespace Home\Model;
use Think\Model;


class ArticleModel extends Model{
	
	//获取文章内容
	public function GetArticle($articleId)
	{
		return $article = $this->where('article_id = '.$articleId)->find();
	}

	//获取文章列表
	public function GetArticleList($type,$groupTag,$order,$start,$count)
	{
		$conds['is_delete'] = 0;
		if (!empty($type)) $conds['type'] = $type;
		if (!empty($groupTag)) $conds['group_tag'] = $groupTag;

		if (empty($order)) $order = 'article_id';

		$limit = '';
		if (isset($start)) {
			$limit = "$start";
		}
		if (!empty($count)) {
			if (!empty($limit)) $limit .= ',';
			$limit .= $count;
		}

		return $this->where($conds)->order($order)->limit($limit)->select();
	}

	public function GetArticlesByType($groupTag,$page,$count)
	{
		$result = array();

		//获取总数量
		$conds['is_delete'] = 0;
		if (!empty($type)) $conds['type'] = 'article';
		if (!empty($groupTag)) $conds['group_tag'] = $groupTag;
		$count = $this->where($conds)->count();
		if ($count === false)  return false;
		$result['count'] = $count;


		if ($page <= 0) $page = 1;
		if ($count <=0) $count = 1;

		//获取列表
		$list = $this->GetArticleList('article',$groupTag,($page - 1)*$count,$count);
		if ($list === false) return false;
		$result['data'] = $list;

		return $result;
	}



}

?>