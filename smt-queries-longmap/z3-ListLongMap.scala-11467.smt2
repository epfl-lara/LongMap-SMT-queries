; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133602 () Bool)

(assert start!133602)

(declare-fun b_free!32019 () Bool)

(declare-fun b_next!32019 () Bool)

(assert (=> start!133602 (= b_free!32019 (not b_next!32019))))

(declare-fun tp!113181 () Bool)

(declare-fun b_and!51549 () Bool)

(assert (=> start!133602 (= tp!113181 b_and!51549)))

(declare-fun b!1562060 () Bool)

(declare-fun e!870478 () Bool)

(assert (=> b!1562060 (= e!870478 (not true))))

(declare-fun lt!671465 () Bool)

(declare-datatypes ((V!59787 0))(
  ( (V!59788 (val!19426 Int)) )
))
(declare-datatypes ((tuple2!25096 0))(
  ( (tuple2!25097 (_1!12559 (_ BitVec 64)) (_2!12559 V!59787)) )
))
(declare-datatypes ((List!36467 0))(
  ( (Nil!36464) (Cons!36463 (h!37909 tuple2!25096) (t!51276 List!36467)) )
))
(declare-datatypes ((ListLongMap!22531 0))(
  ( (ListLongMap!22532 (toList!11281 List!36467)) )
))
(declare-fun lt!671466 () ListLongMap!22531)

(declare-fun contains!10271 (ListLongMap!22531 (_ BitVec 64)) Bool)

(assert (=> b!1562060 (= lt!671465 (contains!10271 lt!671466 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1562060 (not (contains!10271 lt!671466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671468 () ListLongMap!22531)

(declare-datatypes ((array!104088 0))(
  ( (array!104089 (arr!50236 (Array (_ BitVec 32) (_ BitVec 64))) (size!50786 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104088)

(declare-fun lt!671467 () V!59787)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun +!5051 (ListLongMap!22531 tuple2!25096) ListLongMap!22531)

(assert (=> b!1562060 (= lt!671466 (+!5051 lt!671468 (tuple2!25097 (select (arr!50236 _keys!637) from!782) lt!671467)))))

(declare-datatypes ((Unit!51956 0))(
  ( (Unit!51957) )
))
(declare-fun lt!671469 () Unit!51956)

(declare-fun addStillNotContains!541 (ListLongMap!22531 (_ BitVec 64) V!59787 (_ BitVec 64)) Unit!51956)

(assert (=> b!1562060 (= lt!671469 (addStillNotContains!541 lt!671468 (select (arr!50236 _keys!637) from!782) lt!671467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18312 0))(
  ( (ValueCellFull!18312 (v!22178 V!59787)) (EmptyCell!18312) )
))
(declare-datatypes ((array!104090 0))(
  ( (array!104091 (arr!50237 (Array (_ BitVec 32) ValueCell!18312)) (size!50787 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104090)

(declare-fun get!26234 (ValueCell!18312 V!59787) V!59787)

(declare-fun dynLambda!3835 (Int (_ BitVec 64)) V!59787)

(assert (=> b!1562060 (= lt!671467 (get!26234 (select (arr!50237 _values!487) from!782) (dynLambda!3835 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59787)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59787)

(declare-fun getCurrentListMapNoExtraKeys!6665 (array!104088 array!104090 (_ BitVec 32) (_ BitVec 32) V!59787 V!59787 (_ BitVec 32) Int) ListLongMap!22531)

(assert (=> b!1562060 (= lt!671468 (getCurrentListMapNoExtraKeys!6665 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1562061 () Bool)

(declare-fun e!870477 () Bool)

(declare-fun tp_is_empty!38685 () Bool)

(assert (=> b!1562061 (= e!870477 tp_is_empty!38685)))

(declare-fun mapNonEmpty!59403 () Bool)

(declare-fun mapRes!59403 () Bool)

(declare-fun tp!113180 () Bool)

(declare-fun e!870474 () Bool)

(assert (=> mapNonEmpty!59403 (= mapRes!59403 (and tp!113180 e!870474))))

(declare-fun mapRest!59403 () (Array (_ BitVec 32) ValueCell!18312))

(declare-fun mapValue!59403 () ValueCell!18312)

(declare-fun mapKey!59403 () (_ BitVec 32))

(assert (=> mapNonEmpty!59403 (= (arr!50237 _values!487) (store mapRest!59403 mapKey!59403 mapValue!59403))))

(declare-fun b!1562062 () Bool)

(declare-fun res!1068017 () Bool)

(assert (=> b!1562062 (=> (not res!1068017) (not e!870478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1562062 (= res!1068017 (validKeyInArray!0 (select (arr!50236 _keys!637) from!782)))))

(declare-fun b!1562063 () Bool)

(declare-fun e!870476 () Bool)

(assert (=> b!1562063 (= e!870476 (and e!870477 mapRes!59403))))

(declare-fun condMapEmpty!59403 () Bool)

(declare-fun mapDefault!59403 () ValueCell!18312)

(assert (=> b!1562063 (= condMapEmpty!59403 (= (arr!50237 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18312)) mapDefault!59403)))))

(declare-fun b!1562064 () Bool)

(declare-fun res!1068013 () Bool)

(assert (=> b!1562064 (=> (not res!1068013) (not e!870478))))

(assert (=> b!1562064 (= res!1068013 (and (= (size!50787 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50786 _keys!637) (size!50787 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562065 () Bool)

(assert (=> b!1562065 (= e!870474 tp_is_empty!38685)))

(declare-fun b!1562066 () Bool)

(declare-fun res!1068018 () Bool)

(assert (=> b!1562066 (=> (not res!1068018) (not e!870478))))

(declare-datatypes ((List!36468 0))(
  ( (Nil!36465) (Cons!36464 (h!37910 (_ BitVec 64)) (t!51277 List!36468)) )
))
(declare-fun arrayNoDuplicates!0 (array!104088 (_ BitVec 32) List!36468) Bool)

(assert (=> b!1562066 (= res!1068018 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36465))))

(declare-fun b!1562067 () Bool)

(declare-fun res!1068014 () Bool)

(assert (=> b!1562067 (=> (not res!1068014) (not e!870478))))

(assert (=> b!1562067 (= res!1068014 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50786 _keys!637)) (bvslt from!782 (size!50786 _keys!637))))))

(declare-fun res!1068015 () Bool)

(assert (=> start!133602 (=> (not res!1068015) (not e!870478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133602 (= res!1068015 (validMask!0 mask!947))))

(assert (=> start!133602 e!870478))

(assert (=> start!133602 tp!113181))

(assert (=> start!133602 tp_is_empty!38685))

(assert (=> start!133602 true))

(declare-fun array_inv!39047 (array!104088) Bool)

(assert (=> start!133602 (array_inv!39047 _keys!637)))

(declare-fun array_inv!39048 (array!104090) Bool)

(assert (=> start!133602 (and (array_inv!39048 _values!487) e!870476)))

(declare-fun mapIsEmpty!59403 () Bool)

(assert (=> mapIsEmpty!59403 mapRes!59403))

(declare-fun b!1562068 () Bool)

(declare-fun res!1068016 () Bool)

(assert (=> b!1562068 (=> (not res!1068016) (not e!870478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104088 (_ BitVec 32)) Bool)

(assert (=> b!1562068 (= res!1068016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133602 res!1068015) b!1562064))

(assert (= (and b!1562064 res!1068013) b!1562068))

(assert (= (and b!1562068 res!1068016) b!1562066))

(assert (= (and b!1562066 res!1068018) b!1562067))

(assert (= (and b!1562067 res!1068014) b!1562062))

(assert (= (and b!1562062 res!1068017) b!1562060))

(assert (= (and b!1562063 condMapEmpty!59403) mapIsEmpty!59403))

(assert (= (and b!1562063 (not condMapEmpty!59403)) mapNonEmpty!59403))

(get-info :version)

(assert (= (and mapNonEmpty!59403 ((_ is ValueCellFull!18312) mapValue!59403)) b!1562065))

(assert (= (and b!1562063 ((_ is ValueCellFull!18312) mapDefault!59403)) b!1562061))

(assert (= start!133602 b!1562063))

(declare-fun b_lambda!24893 () Bool)

(assert (=> (not b_lambda!24893) (not b!1562060)))

(declare-fun t!51275 () Bool)

(declare-fun tb!12563 () Bool)

(assert (=> (and start!133602 (= defaultEntry!495 defaultEntry!495) t!51275) tb!12563))

(declare-fun result!26407 () Bool)

(assert (=> tb!12563 (= result!26407 tp_is_empty!38685)))

(assert (=> b!1562060 t!51275))

(declare-fun b_and!51551 () Bool)

(assert (= b_and!51549 (and (=> t!51275 result!26407) b_and!51551)))

(declare-fun m!1437777 () Bool)

(assert (=> b!1562062 m!1437777))

(assert (=> b!1562062 m!1437777))

(declare-fun m!1437779 () Bool)

(assert (=> b!1562062 m!1437779))

(declare-fun m!1437781 () Bool)

(assert (=> mapNonEmpty!59403 m!1437781))

(declare-fun m!1437783 () Bool)

(assert (=> start!133602 m!1437783))

(declare-fun m!1437785 () Bool)

(assert (=> start!133602 m!1437785))

(declare-fun m!1437787 () Bool)

(assert (=> start!133602 m!1437787))

(declare-fun m!1437789 () Bool)

(assert (=> b!1562066 m!1437789))

(declare-fun m!1437791 () Bool)

(assert (=> b!1562060 m!1437791))

(declare-fun m!1437793 () Bool)

(assert (=> b!1562060 m!1437793))

(declare-fun m!1437795 () Bool)

(assert (=> b!1562060 m!1437795))

(declare-fun m!1437797 () Bool)

(assert (=> b!1562060 m!1437797))

(declare-fun m!1437799 () Bool)

(assert (=> b!1562060 m!1437799))

(assert (=> b!1562060 m!1437791))

(assert (=> b!1562060 m!1437777))

(declare-fun m!1437801 () Bool)

(assert (=> b!1562060 m!1437801))

(assert (=> b!1562060 m!1437777))

(declare-fun m!1437803 () Bool)

(assert (=> b!1562060 m!1437803))

(assert (=> b!1562060 m!1437793))

(declare-fun m!1437805 () Bool)

(assert (=> b!1562060 m!1437805))

(declare-fun m!1437807 () Bool)

(assert (=> b!1562068 m!1437807))

(check-sat (not b!1562062) (not b!1562066) (not b_next!32019) (not b_lambda!24893) (not b!1562060) (not start!133602) (not mapNonEmpty!59403) tp_is_empty!38685 (not b!1562068) b_and!51551)
(check-sat b_and!51551 (not b_next!32019))
