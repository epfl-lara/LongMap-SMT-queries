; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111870 () Bool)

(assert start!111870)

(declare-fun b_free!30469 () Bool)

(declare-fun b_next!30469 () Bool)

(assert (=> start!111870 (= b_free!30469 (not b_next!30469))))

(declare-fun tp!106888 () Bool)

(declare-fun b_and!49015 () Bool)

(assert (=> start!111870 (= tp!106888 b_and!49015)))

(declare-fun b!1325418 () Bool)

(declare-fun res!879681 () Bool)

(declare-fun e!755582 () Bool)

(assert (=> b!1325418 (=> (not res!879681) (not e!755582))))

(declare-datatypes ((array!89419 0))(
  ( (array!89420 (arr!43183 (Array (_ BitVec 32) (_ BitVec 64))) (size!43735 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89419)

(declare-datatypes ((List!30691 0))(
  ( (Nil!30688) (Cons!30687 (h!31896 (_ BitVec 64)) (t!44623 List!30691)) )
))
(declare-fun arrayNoDuplicates!0 (array!89419 (_ BitVec 32) List!30691) Bool)

(assert (=> b!1325418 (= res!879681 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30688))))

(declare-fun b!1325419 () Bool)

(declare-fun e!755584 () Bool)

(declare-fun tp_is_empty!36289 () Bool)

(assert (=> b!1325419 (= e!755584 tp_is_empty!36289)))

(declare-fun b!1325420 () Bool)

(declare-fun res!879679 () Bool)

(assert (=> b!1325420 (=> (not res!879679) (not e!755582))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325420 (= res!879679 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43735 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325421 () Bool)

(declare-fun e!755583 () Bool)

(assert (=> b!1325421 (= e!755583 tp_is_empty!36289)))

(declare-fun res!879680 () Bool)

(assert (=> start!111870 (=> (not res!879680) (not e!755582))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111870 (= res!879680 (validMask!0 mask!2019))))

(assert (=> start!111870 e!755582))

(declare-fun array_inv!32781 (array!89419) Bool)

(assert (=> start!111870 (array_inv!32781 _keys!1609)))

(assert (=> start!111870 true))

(assert (=> start!111870 tp_is_empty!36289))

(declare-datatypes ((V!53489 0))(
  ( (V!53490 (val!18219 Int)) )
))
(declare-datatypes ((ValueCell!17246 0))(
  ( (ValueCellFull!17246 (v!20851 V!53489)) (EmptyCell!17246) )
))
(declare-datatypes ((array!89421 0))(
  ( (array!89422 (arr!43184 (Array (_ BitVec 32) ValueCell!17246)) (size!43736 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89421)

(declare-fun e!755581 () Bool)

(declare-fun array_inv!32782 (array!89421) Bool)

(assert (=> start!111870 (and (array_inv!32782 _values!1337) e!755581)))

(assert (=> start!111870 tp!106888))

(declare-fun b!1325422 () Bool)

(assert (=> b!1325422 (= e!755582 (not true))))

(declare-datatypes ((tuple2!23562 0))(
  ( (tuple2!23563 (_1!11792 (_ BitVec 64)) (_2!11792 V!53489)) )
))
(declare-datatypes ((List!30692 0))(
  ( (Nil!30689) (Cons!30688 (h!31897 tuple2!23562) (t!44624 List!30692)) )
))
(declare-datatypes ((ListLongMap!21219 0))(
  ( (ListLongMap!21220 (toList!10625 List!30692)) )
))
(declare-fun lt!589604 () ListLongMap!21219)

(declare-fun contains!8709 (ListLongMap!21219 (_ BitVec 64)) Bool)

(assert (=> b!1325422 (contains!8709 lt!589604 k0!1164)))

(declare-datatypes ((Unit!43459 0))(
  ( (Unit!43460) )
))
(declare-fun lt!589605 () Unit!43459)

(declare-fun minValue!1279 () V!53489)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!195 ((_ BitVec 64) (_ BitVec 64) V!53489 ListLongMap!21219) Unit!43459)

(assert (=> b!1325422 (= lt!589605 (lemmaInListMapAfterAddingDiffThenInBefore!195 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589604))))

(declare-fun zeroValue!1279 () V!53489)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4633 (ListLongMap!21219 tuple2!23562) ListLongMap!21219)

(declare-fun getCurrentListMapNoExtraKeys!6271 (array!89419 array!89421 (_ BitVec 32) (_ BitVec 32) V!53489 V!53489 (_ BitVec 32) Int) ListLongMap!21219)

(declare-fun get!21751 (ValueCell!17246 V!53489) V!53489)

(declare-fun dynLambda!3563 (Int (_ BitVec 64)) V!53489)

(assert (=> b!1325422 (= lt!589604 (+!4633 (+!4633 (getCurrentListMapNoExtraKeys!6271 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23563 (select (arr!43183 _keys!1609) from!2000) (get!21751 (select (arr!43184 _values!1337) from!2000) (dynLambda!3563 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325423 () Bool)

(declare-fun res!879683 () Bool)

(assert (=> b!1325423 (=> (not res!879683) (not e!755582))))

(assert (=> b!1325423 (= res!879683 (not (= (select (arr!43183 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325424 () Bool)

(declare-fun res!879676 () Bool)

(assert (=> b!1325424 (=> (not res!879676) (not e!755582))))

(declare-fun getCurrentListMap!5503 (array!89419 array!89421 (_ BitVec 32) (_ BitVec 32) V!53489 V!53489 (_ BitVec 32) Int) ListLongMap!21219)

(assert (=> b!1325424 (= res!879676 (contains!8709 (getCurrentListMap!5503 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325425 () Bool)

(declare-fun res!879682 () Bool)

(assert (=> b!1325425 (=> (not res!879682) (not e!755582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325425 (= res!879682 (validKeyInArray!0 (select (arr!43183 _keys!1609) from!2000)))))

(declare-fun b!1325426 () Bool)

(declare-fun res!879678 () Bool)

(assert (=> b!1325426 (=> (not res!879678) (not e!755582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89419 (_ BitVec 32)) Bool)

(assert (=> b!1325426 (= res!879678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325427 () Bool)

(declare-fun res!879677 () Bool)

(assert (=> b!1325427 (=> (not res!879677) (not e!755582))))

(assert (=> b!1325427 (= res!879677 (and (= (size!43736 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43735 _keys!1609) (size!43736 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325428 () Bool)

(declare-fun mapRes!56085 () Bool)

(assert (=> b!1325428 (= e!755581 (and e!755584 mapRes!56085))))

(declare-fun condMapEmpty!56085 () Bool)

(declare-fun mapDefault!56085 () ValueCell!17246)

(assert (=> b!1325428 (= condMapEmpty!56085 (= (arr!43184 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17246)) mapDefault!56085)))))

(declare-fun mapIsEmpty!56085 () Bool)

(assert (=> mapIsEmpty!56085 mapRes!56085))

(declare-fun mapNonEmpty!56085 () Bool)

(declare-fun tp!106887 () Bool)

(assert (=> mapNonEmpty!56085 (= mapRes!56085 (and tp!106887 e!755583))))

(declare-fun mapKey!56085 () (_ BitVec 32))

(declare-fun mapValue!56085 () ValueCell!17246)

(declare-fun mapRest!56085 () (Array (_ BitVec 32) ValueCell!17246))

(assert (=> mapNonEmpty!56085 (= (arr!43184 _values!1337) (store mapRest!56085 mapKey!56085 mapValue!56085))))

(assert (= (and start!111870 res!879680) b!1325427))

(assert (= (and b!1325427 res!879677) b!1325426))

(assert (= (and b!1325426 res!879678) b!1325418))

(assert (= (and b!1325418 res!879681) b!1325420))

(assert (= (and b!1325420 res!879679) b!1325424))

(assert (= (and b!1325424 res!879676) b!1325423))

(assert (= (and b!1325423 res!879683) b!1325425))

(assert (= (and b!1325425 res!879682) b!1325422))

(assert (= (and b!1325428 condMapEmpty!56085) mapIsEmpty!56085))

(assert (= (and b!1325428 (not condMapEmpty!56085)) mapNonEmpty!56085))

(get-info :version)

(assert (= (and mapNonEmpty!56085 ((_ is ValueCellFull!17246) mapValue!56085)) b!1325421))

(assert (= (and b!1325428 ((_ is ValueCellFull!17246) mapDefault!56085)) b!1325419))

(assert (= start!111870 b!1325428))

(declare-fun b_lambda!23737 () Bool)

(assert (=> (not b_lambda!23737) (not b!1325422)))

(declare-fun t!44622 () Bool)

(declare-fun tb!11735 () Bool)

(assert (=> (and start!111870 (= defaultEntry!1340 defaultEntry!1340) t!44622) tb!11735))

(declare-fun result!24535 () Bool)

(assert (=> tb!11735 (= result!24535 tp_is_empty!36289)))

(assert (=> b!1325422 t!44622))

(declare-fun b_and!49017 () Bool)

(assert (= b_and!49015 (and (=> t!44622 result!24535) b_and!49017)))

(declare-fun m!1213861 () Bool)

(assert (=> b!1325423 m!1213861))

(assert (=> b!1325425 m!1213861))

(assert (=> b!1325425 m!1213861))

(declare-fun m!1213863 () Bool)

(assert (=> b!1325425 m!1213863))

(declare-fun m!1213865 () Bool)

(assert (=> b!1325424 m!1213865))

(assert (=> b!1325424 m!1213865))

(declare-fun m!1213867 () Bool)

(assert (=> b!1325424 m!1213867))

(declare-fun m!1213869 () Bool)

(assert (=> b!1325426 m!1213869))

(declare-fun m!1213871 () Bool)

(assert (=> start!111870 m!1213871))

(declare-fun m!1213873 () Bool)

(assert (=> start!111870 m!1213873))

(declare-fun m!1213875 () Bool)

(assert (=> start!111870 m!1213875))

(declare-fun m!1213877 () Bool)

(assert (=> b!1325418 m!1213877))

(declare-fun m!1213879 () Bool)

(assert (=> mapNonEmpty!56085 m!1213879))

(declare-fun m!1213881 () Bool)

(assert (=> b!1325422 m!1213881))

(declare-fun m!1213883 () Bool)

(assert (=> b!1325422 m!1213883))

(assert (=> b!1325422 m!1213881))

(declare-fun m!1213885 () Bool)

(assert (=> b!1325422 m!1213885))

(declare-fun m!1213887 () Bool)

(assert (=> b!1325422 m!1213887))

(declare-fun m!1213889 () Bool)

(assert (=> b!1325422 m!1213889))

(assert (=> b!1325422 m!1213885))

(declare-fun m!1213891 () Bool)

(assert (=> b!1325422 m!1213891))

(declare-fun m!1213893 () Bool)

(assert (=> b!1325422 m!1213893))

(assert (=> b!1325422 m!1213889))

(assert (=> b!1325422 m!1213883))

(declare-fun m!1213895 () Bool)

(assert (=> b!1325422 m!1213895))

(assert (=> b!1325422 m!1213861))

(check-sat (not mapNonEmpty!56085) (not b_next!30469) (not b!1325422) (not b_lambda!23737) b_and!49017 (not b!1325425) tp_is_empty!36289 (not b!1325424) (not b!1325418) (not start!111870) (not b!1325426))
(check-sat b_and!49017 (not b_next!30469))
