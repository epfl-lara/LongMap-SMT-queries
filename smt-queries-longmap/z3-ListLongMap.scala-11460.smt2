; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133970 () Bool)

(assert start!133970)

(declare-fun b_free!31975 () Bool)

(declare-fun b_next!31975 () Bool)

(assert (=> start!133970 (= b_free!31975 (not b_next!31975))))

(declare-fun tp!113049 () Bool)

(declare-fun b_and!51463 () Bool)

(assert (=> start!133970 (= tp!113049 b_and!51463)))

(declare-fun b!1563849 () Bool)

(declare-fun res!1068471 () Bool)

(declare-fun e!871647 () Bool)

(assert (=> b!1563849 (=> (not res!1068471) (not e!871647))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104116 0))(
  ( (array!104117 (arr!50243 (Array (_ BitVec 32) (_ BitVec 64))) (size!50794 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104116)

(declare-datatypes ((V!59729 0))(
  ( (V!59730 (val!19404 Int)) )
))
(declare-datatypes ((ValueCell!18290 0))(
  ( (ValueCellFull!18290 (v!22148 V!59729)) (EmptyCell!18290) )
))
(declare-datatypes ((array!104118 0))(
  ( (array!104119 (arr!50244 (Array (_ BitVec 32) ValueCell!18290)) (size!50795 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104118)

(assert (=> b!1563849 (= res!1068471 (and (= (size!50795 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50794 _keys!637) (size!50795 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59337 () Bool)

(declare-fun mapRes!59337 () Bool)

(assert (=> mapIsEmpty!59337 mapRes!59337))

(declare-fun b!1563850 () Bool)

(declare-fun e!871648 () Bool)

(declare-fun tp_is_empty!38641 () Bool)

(assert (=> b!1563850 (= e!871648 tp_is_empty!38641)))

(declare-fun b!1563851 () Bool)

(declare-fun res!1068470 () Bool)

(assert (=> b!1563851 (=> (not res!1068470) (not e!871647))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563851 (= res!1068470 (validKeyInArray!0 (select (arr!50243 _keys!637) from!782)))))

(declare-fun res!1068472 () Bool)

(assert (=> start!133970 (=> (not res!1068472) (not e!871647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133970 (= res!1068472 (validMask!0 mask!947))))

(assert (=> start!133970 e!871647))

(assert (=> start!133970 tp!113049))

(assert (=> start!133970 tp_is_empty!38641))

(assert (=> start!133970 true))

(declare-fun array_inv!39301 (array!104116) Bool)

(assert (=> start!133970 (array_inv!39301 _keys!637)))

(declare-fun e!871646 () Bool)

(declare-fun array_inv!39302 (array!104118) Bool)

(assert (=> start!133970 (and (array_inv!39302 _values!487) e!871646)))

(declare-fun b!1563852 () Bool)

(declare-fun e!871645 () Bool)

(assert (=> b!1563852 (= e!871645 tp_is_empty!38641)))

(declare-fun b!1563853 () Bool)

(declare-fun res!1068468 () Bool)

(assert (=> b!1563853 (=> (not res!1068468) (not e!871647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104116 (_ BitVec 32)) Bool)

(assert (=> b!1563853 (= res!1068468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563854 () Bool)

(assert (=> b!1563854 (= e!871647 (not true))))

(declare-fun lt!672113 () V!59729)

(declare-datatypes ((tuple2!25124 0))(
  ( (tuple2!25125 (_1!12573 (_ BitVec 64)) (_2!12573 V!59729)) )
))
(declare-datatypes ((List!36464 0))(
  ( (Nil!36461) (Cons!36460 (h!37924 tuple2!25124) (t!51221 List!36464)) )
))
(declare-datatypes ((ListLongMap!22567 0))(
  ( (ListLongMap!22568 (toList!11299 List!36464)) )
))
(declare-fun lt!672111 () ListLongMap!22567)

(declare-fun contains!10300 (ListLongMap!22567 (_ BitVec 64)) Bool)

(declare-fun +!5075 (ListLongMap!22567 tuple2!25124) ListLongMap!22567)

(assert (=> b!1563854 (not (contains!10300 (+!5075 lt!672111 (tuple2!25125 (select (arr!50243 _keys!637) from!782) lt!672113)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51835 0))(
  ( (Unit!51836) )
))
(declare-fun lt!672112 () Unit!51835)

(declare-fun addStillNotContains!526 (ListLongMap!22567 (_ BitVec 64) V!59729 (_ BitVec 64)) Unit!51835)

(assert (=> b!1563854 (= lt!672112 (addStillNotContains!526 lt!672111 (select (arr!50243 _keys!637) from!782) lt!672113 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26245 (ValueCell!18290 V!59729) V!59729)

(declare-fun dynLambda!3873 (Int (_ BitVec 64)) V!59729)

(assert (=> b!1563854 (= lt!672113 (get!26245 (select (arr!50244 _values!487) from!782) (dynLambda!3873 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59729)

(declare-fun minValue!453 () V!59729)

(declare-fun getCurrentListMapNoExtraKeys!6698 (array!104116 array!104118 (_ BitVec 32) (_ BitVec 32) V!59729 V!59729 (_ BitVec 32) Int) ListLongMap!22567)

(assert (=> b!1563854 (= lt!672111 (getCurrentListMapNoExtraKeys!6698 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563855 () Bool)

(declare-fun res!1068469 () Bool)

(assert (=> b!1563855 (=> (not res!1068469) (not e!871647))))

(assert (=> b!1563855 (= res!1068469 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50794 _keys!637)) (bvslt from!782 (size!50794 _keys!637))))))

(declare-fun b!1563856 () Bool)

(assert (=> b!1563856 (= e!871646 (and e!871645 mapRes!59337))))

(declare-fun condMapEmpty!59337 () Bool)

(declare-fun mapDefault!59337 () ValueCell!18290)

(assert (=> b!1563856 (= condMapEmpty!59337 (= (arr!50244 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18290)) mapDefault!59337)))))

(declare-fun mapNonEmpty!59337 () Bool)

(declare-fun tp!113048 () Bool)

(assert (=> mapNonEmpty!59337 (= mapRes!59337 (and tp!113048 e!871648))))

(declare-fun mapKey!59337 () (_ BitVec 32))

(declare-fun mapValue!59337 () ValueCell!18290)

(declare-fun mapRest!59337 () (Array (_ BitVec 32) ValueCell!18290))

(assert (=> mapNonEmpty!59337 (= (arr!50244 _values!487) (store mapRest!59337 mapKey!59337 mapValue!59337))))

(declare-fun b!1563857 () Bool)

(declare-fun res!1068473 () Bool)

(assert (=> b!1563857 (=> (not res!1068473) (not e!871647))))

(declare-datatypes ((List!36465 0))(
  ( (Nil!36462) (Cons!36461 (h!37925 (_ BitVec 64)) (t!51222 List!36465)) )
))
(declare-fun arrayNoDuplicates!0 (array!104116 (_ BitVec 32) List!36465) Bool)

(assert (=> b!1563857 (= res!1068473 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36462))))

(assert (= (and start!133970 res!1068472) b!1563849))

(assert (= (and b!1563849 res!1068471) b!1563853))

(assert (= (and b!1563853 res!1068468) b!1563857))

(assert (= (and b!1563857 res!1068473) b!1563855))

(assert (= (and b!1563855 res!1068469) b!1563851))

(assert (= (and b!1563851 res!1068470) b!1563854))

(assert (= (and b!1563856 condMapEmpty!59337) mapIsEmpty!59337))

(assert (= (and b!1563856 (not condMapEmpty!59337)) mapNonEmpty!59337))

(get-info :version)

(assert (= (and mapNonEmpty!59337 ((_ is ValueCellFull!18290) mapValue!59337)) b!1563850))

(assert (= (and b!1563856 ((_ is ValueCellFull!18290) mapDefault!59337)) b!1563852))

(assert (= start!133970 b!1563856))

(declare-fun b_lambda!24843 () Bool)

(assert (=> (not b_lambda!24843) (not b!1563854)))

(declare-fun t!51220 () Bool)

(declare-fun tb!12511 () Bool)

(assert (=> (and start!133970 (= defaultEntry!495 defaultEntry!495) t!51220) tb!12511))

(declare-fun result!26311 () Bool)

(assert (=> tb!12511 (= result!26311 tp_is_empty!38641)))

(assert (=> b!1563854 t!51220))

(declare-fun b_and!51465 () Bool)

(assert (= b_and!51463 (and (=> t!51220 result!26311) b_and!51465)))

(declare-fun m!1439349 () Bool)

(assert (=> mapNonEmpty!59337 m!1439349))

(declare-fun m!1439351 () Bool)

(assert (=> b!1563857 m!1439351))

(declare-fun m!1439353 () Bool)

(assert (=> b!1563853 m!1439353))

(declare-fun m!1439355 () Bool)

(assert (=> start!133970 m!1439355))

(declare-fun m!1439357 () Bool)

(assert (=> start!133970 m!1439357))

(declare-fun m!1439359 () Bool)

(assert (=> start!133970 m!1439359))

(declare-fun m!1439361 () Bool)

(assert (=> b!1563854 m!1439361))

(declare-fun m!1439363 () Bool)

(assert (=> b!1563854 m!1439363))

(declare-fun m!1439365 () Bool)

(assert (=> b!1563854 m!1439365))

(declare-fun m!1439367 () Bool)

(assert (=> b!1563854 m!1439367))

(declare-fun m!1439369 () Bool)

(assert (=> b!1563854 m!1439369))

(declare-fun m!1439371 () Bool)

(assert (=> b!1563854 m!1439371))

(declare-fun m!1439373 () Bool)

(assert (=> b!1563854 m!1439373))

(assert (=> b!1563854 m!1439367))

(assert (=> b!1563854 m!1439363))

(declare-fun m!1439375 () Bool)

(assert (=> b!1563854 m!1439375))

(assert (=> b!1563854 m!1439361))

(assert (=> b!1563854 m!1439371))

(assert (=> b!1563851 m!1439367))

(assert (=> b!1563851 m!1439367))

(declare-fun m!1439377 () Bool)

(assert (=> b!1563851 m!1439377))

(check-sat (not b!1563851) (not b!1563857) (not start!133970) (not mapNonEmpty!59337) b_and!51465 (not b_next!31975) (not b!1563853) (not b!1563854) (not b_lambda!24843) tp_is_empty!38641)
(check-sat b_and!51465 (not b_next!31975))
