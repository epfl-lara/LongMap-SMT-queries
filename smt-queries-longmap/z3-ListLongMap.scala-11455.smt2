; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133940 () Bool)

(assert start!133940)

(declare-fun b_free!31945 () Bool)

(declare-fun b_next!31945 () Bool)

(assert (=> start!133940 (= b_free!31945 (not b_next!31945))))

(declare-fun tp!112958 () Bool)

(declare-fun b_and!51403 () Bool)

(assert (=> start!133940 (= tp!112958 b_and!51403)))

(declare-fun mapIsEmpty!59292 () Bool)

(declare-fun mapRes!59292 () Bool)

(assert (=> mapIsEmpty!59292 mapRes!59292))

(declare-fun b!1563414 () Bool)

(declare-fun res!1068202 () Bool)

(declare-fun e!871421 () Bool)

(assert (=> b!1563414 (=> (not res!1068202) (not e!871421))))

(declare-datatypes ((array!104058 0))(
  ( (array!104059 (arr!50214 (Array (_ BitVec 32) (_ BitVec 64))) (size!50765 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104058)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563414 (= res!1068202 (validKeyInArray!0 (select (arr!50214 _keys!637) from!782)))))

(declare-fun b!1563415 () Bool)

(declare-fun e!871419 () Bool)

(declare-fun e!871422 () Bool)

(assert (=> b!1563415 (= e!871419 (and e!871422 mapRes!59292))))

(declare-fun condMapEmpty!59292 () Bool)

(declare-datatypes ((V!59689 0))(
  ( (V!59690 (val!19389 Int)) )
))
(declare-datatypes ((ValueCell!18275 0))(
  ( (ValueCellFull!18275 (v!22133 V!59689)) (EmptyCell!18275) )
))
(declare-datatypes ((array!104060 0))(
  ( (array!104061 (arr!50215 (Array (_ BitVec 32) ValueCell!18275)) (size!50766 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104060)

(declare-fun mapDefault!59292 () ValueCell!18275)

(assert (=> b!1563415 (= condMapEmpty!59292 (= (arr!50215 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18275)) mapDefault!59292)))))

(declare-fun b!1563416 () Bool)

(declare-fun res!1068198 () Bool)

(assert (=> b!1563416 (=> (not res!1068198) (not e!871421))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104058 (_ BitVec 32)) Bool)

(assert (=> b!1563416 (= res!1068198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563417 () Bool)

(declare-fun res!1068200 () Bool)

(assert (=> b!1563417 (=> (not res!1068200) (not e!871421))))

(assert (=> b!1563417 (= res!1068200 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50765 _keys!637)) (bvslt from!782 (size!50765 _keys!637))))))

(declare-fun b!1563418 () Bool)

(assert (=> b!1563418 (= e!871421 (not true))))

(declare-datatypes ((tuple2!25102 0))(
  ( (tuple2!25103 (_1!12562 (_ BitVec 64)) (_2!12562 V!59689)) )
))
(declare-datatypes ((List!36443 0))(
  ( (Nil!36440) (Cons!36439 (h!37903 tuple2!25102) (t!51170 List!36443)) )
))
(declare-datatypes ((ListLongMap!22545 0))(
  ( (ListLongMap!22546 (toList!11288 List!36443)) )
))
(declare-fun lt!671978 () ListLongMap!22545)

(declare-fun lt!671977 () V!59689)

(declare-fun contains!10289 (ListLongMap!22545 (_ BitVec 64)) Bool)

(declare-fun +!5064 (ListLongMap!22545 tuple2!25102) ListLongMap!22545)

(assert (=> b!1563418 (not (contains!10289 (+!5064 lt!671978 (tuple2!25103 (select (arr!50214 _keys!637) from!782) lt!671977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51813 0))(
  ( (Unit!51814) )
))
(declare-fun lt!671976 () Unit!51813)

(declare-fun addStillNotContains!515 (ListLongMap!22545 (_ BitVec 64) V!59689 (_ BitVec 64)) Unit!51813)

(assert (=> b!1563418 (= lt!671976 (addStillNotContains!515 lt!671978 (select (arr!50214 _keys!637) from!782) lt!671977 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26224 (ValueCell!18275 V!59689) V!59689)

(declare-fun dynLambda!3862 (Int (_ BitVec 64)) V!59689)

(assert (=> b!1563418 (= lt!671977 (get!26224 (select (arr!50215 _values!487) from!782) (dynLambda!3862 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59689)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59689)

(declare-fun getCurrentListMapNoExtraKeys!6687 (array!104058 array!104060 (_ BitVec 32) (_ BitVec 32) V!59689 V!59689 (_ BitVec 32) Int) ListLongMap!22545)

(assert (=> b!1563418 (= lt!671978 (getCurrentListMapNoExtraKeys!6687 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59292 () Bool)

(declare-fun tp!112959 () Bool)

(declare-fun e!871423 () Bool)

(assert (=> mapNonEmpty!59292 (= mapRes!59292 (and tp!112959 e!871423))))

(declare-fun mapKey!59292 () (_ BitVec 32))

(declare-fun mapValue!59292 () ValueCell!18275)

(declare-fun mapRest!59292 () (Array (_ BitVec 32) ValueCell!18275))

(assert (=> mapNonEmpty!59292 (= (arr!50215 _values!487) (store mapRest!59292 mapKey!59292 mapValue!59292))))

(declare-fun b!1563419 () Bool)

(declare-fun tp_is_empty!38611 () Bool)

(assert (=> b!1563419 (= e!871422 tp_is_empty!38611)))

(declare-fun b!1563420 () Bool)

(declare-fun res!1068201 () Bool)

(assert (=> b!1563420 (=> (not res!1068201) (not e!871421))))

(declare-datatypes ((List!36444 0))(
  ( (Nil!36441) (Cons!36440 (h!37904 (_ BitVec 64)) (t!51171 List!36444)) )
))
(declare-fun arrayNoDuplicates!0 (array!104058 (_ BitVec 32) List!36444) Bool)

(assert (=> b!1563420 (= res!1068201 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36441))))

(declare-fun res!1068203 () Bool)

(assert (=> start!133940 (=> (not res!1068203) (not e!871421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133940 (= res!1068203 (validMask!0 mask!947))))

(assert (=> start!133940 e!871421))

(assert (=> start!133940 tp!112958))

(assert (=> start!133940 tp_is_empty!38611))

(assert (=> start!133940 true))

(declare-fun array_inv!39279 (array!104058) Bool)

(assert (=> start!133940 (array_inv!39279 _keys!637)))

(declare-fun array_inv!39280 (array!104060) Bool)

(assert (=> start!133940 (and (array_inv!39280 _values!487) e!871419)))

(declare-fun b!1563421 () Bool)

(assert (=> b!1563421 (= e!871423 tp_is_empty!38611)))

(declare-fun b!1563422 () Bool)

(declare-fun res!1068199 () Bool)

(assert (=> b!1563422 (=> (not res!1068199) (not e!871421))))

(assert (=> b!1563422 (= res!1068199 (and (= (size!50766 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50765 _keys!637) (size!50766 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133940 res!1068203) b!1563422))

(assert (= (and b!1563422 res!1068199) b!1563416))

(assert (= (and b!1563416 res!1068198) b!1563420))

(assert (= (and b!1563420 res!1068201) b!1563417))

(assert (= (and b!1563417 res!1068200) b!1563414))

(assert (= (and b!1563414 res!1068202) b!1563418))

(assert (= (and b!1563415 condMapEmpty!59292) mapIsEmpty!59292))

(assert (= (and b!1563415 (not condMapEmpty!59292)) mapNonEmpty!59292))

(get-info :version)

(assert (= (and mapNonEmpty!59292 ((_ is ValueCellFull!18275) mapValue!59292)) b!1563421))

(assert (= (and b!1563415 ((_ is ValueCellFull!18275) mapDefault!59292)) b!1563419))

(assert (= start!133940 b!1563415))

(declare-fun b_lambda!24813 () Bool)

(assert (=> (not b_lambda!24813) (not b!1563418)))

(declare-fun t!51169 () Bool)

(declare-fun tb!12481 () Bool)

(assert (=> (and start!133940 (= defaultEntry!495 defaultEntry!495) t!51169) tb!12481))

(declare-fun result!26251 () Bool)

(assert (=> tb!12481 (= result!26251 tp_is_empty!38611)))

(assert (=> b!1563418 t!51169))

(declare-fun b_and!51405 () Bool)

(assert (= b_and!51403 (and (=> t!51169 result!26251) b_and!51405)))

(declare-fun m!1438899 () Bool)

(assert (=> b!1563420 m!1438899))

(declare-fun m!1438901 () Bool)

(assert (=> start!133940 m!1438901))

(declare-fun m!1438903 () Bool)

(assert (=> start!133940 m!1438903))

(declare-fun m!1438905 () Bool)

(assert (=> start!133940 m!1438905))

(declare-fun m!1438907 () Bool)

(assert (=> b!1563416 m!1438907))

(declare-fun m!1438909 () Bool)

(assert (=> b!1563418 m!1438909))

(declare-fun m!1438911 () Bool)

(assert (=> b!1563418 m!1438911))

(declare-fun m!1438913 () Bool)

(assert (=> b!1563418 m!1438913))

(assert (=> b!1563418 m!1438909))

(declare-fun m!1438915 () Bool)

(assert (=> b!1563418 m!1438915))

(assert (=> b!1563418 m!1438915))

(declare-fun m!1438917 () Bool)

(assert (=> b!1563418 m!1438917))

(declare-fun m!1438919 () Bool)

(assert (=> b!1563418 m!1438919))

(assert (=> b!1563418 m!1438911))

(declare-fun m!1438921 () Bool)

(assert (=> b!1563418 m!1438921))

(assert (=> b!1563418 m!1438919))

(declare-fun m!1438923 () Bool)

(assert (=> b!1563418 m!1438923))

(assert (=> b!1563414 m!1438915))

(assert (=> b!1563414 m!1438915))

(declare-fun m!1438925 () Bool)

(assert (=> b!1563414 m!1438925))

(declare-fun m!1438927 () Bool)

(assert (=> mapNonEmpty!59292 m!1438927))

(check-sat (not b_next!31945) b_and!51405 (not b!1563416) (not start!133940) (not b!1563414) (not b_lambda!24813) tp_is_empty!38611 (not b!1563418) (not mapNonEmpty!59292) (not b!1563420))
(check-sat b_and!51405 (not b_next!31945))
