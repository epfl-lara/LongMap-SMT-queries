; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111814 () Bool)

(assert start!111814)

(declare-fun b_free!30247 () Bool)

(declare-fun b_next!30247 () Bool)

(assert (=> start!111814 (= b_free!30247 (not b_next!30247))))

(declare-fun tp!106217 () Bool)

(declare-fun b_and!48655 () Bool)

(assert (=> start!111814 (= tp!106217 b_and!48655)))

(declare-fun mapIsEmpty!55748 () Bool)

(declare-fun mapRes!55748 () Bool)

(assert (=> mapIsEmpty!55748 mapRes!55748))

(declare-fun b!1322839 () Bool)

(declare-fun res!877661 () Bool)

(declare-fun e!754537 () Bool)

(assert (=> b!1322839 (=> (not res!877661) (not e!754537))))

(declare-datatypes ((array!89141 0))(
  ( (array!89142 (arr!43040 (Array (_ BitVec 32) (_ BitVec 64))) (size!43591 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89141)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322839 (= res!877661 (validKeyInArray!0 (select (arr!43040 _keys!1609) from!2000)))))

(declare-fun b!1322840 () Bool)

(declare-fun res!877659 () Bool)

(assert (=> b!1322840 (=> (not res!877659) (not e!754537))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89141 (_ BitVec 32)) Bool)

(assert (=> b!1322840 (= res!877659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322841 () Bool)

(declare-fun res!877662 () Bool)

(assert (=> b!1322841 (=> (not res!877662) (not e!754537))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53193 0))(
  ( (V!53194 (val!18108 Int)) )
))
(declare-fun zeroValue!1279 () V!53193)

(declare-datatypes ((ValueCell!17135 0))(
  ( (ValueCellFull!17135 (v!20733 V!53193)) (EmptyCell!17135) )
))
(declare-datatypes ((array!89143 0))(
  ( (array!89144 (arr!43041 (Array (_ BitVec 32) ValueCell!17135)) (size!43592 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89143)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun minValue!1279 () V!53193)

(declare-datatypes ((tuple2!23366 0))(
  ( (tuple2!23367 (_1!11694 (_ BitVec 64)) (_2!11694 V!53193)) )
))
(declare-datatypes ((List!30518 0))(
  ( (Nil!30515) (Cons!30514 (h!31732 tuple2!23366) (t!44306 List!30518)) )
))
(declare-datatypes ((ListLongMap!21031 0))(
  ( (ListLongMap!21032 (toList!10531 List!30518)) )
))
(declare-fun contains!8698 (ListLongMap!21031 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5524 (array!89141 array!89143 (_ BitVec 32) (_ BitVec 32) V!53193 V!53193 (_ BitVec 32) Int) ListLongMap!21031)

(assert (=> b!1322841 (= res!877662 (contains!8698 (getCurrentListMap!5524 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322842 () Bool)

(declare-fun res!877666 () Bool)

(assert (=> b!1322842 (=> (not res!877666) (not e!754537))))

(declare-datatypes ((List!30519 0))(
  ( (Nil!30516) (Cons!30515 (h!31733 (_ BitVec 64)) (t!44307 List!30519)) )
))
(declare-fun arrayNoDuplicates!0 (array!89141 (_ BitVec 32) List!30519) Bool)

(assert (=> b!1322842 (= res!877666 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30516))))

(declare-fun res!877665 () Bool)

(assert (=> start!111814 (=> (not res!877665) (not e!754537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111814 (= res!877665 (validMask!0 mask!2019))))

(assert (=> start!111814 e!754537))

(declare-fun array_inv!32771 (array!89141) Bool)

(assert (=> start!111814 (array_inv!32771 _keys!1609)))

(assert (=> start!111814 true))

(declare-fun tp_is_empty!36067 () Bool)

(assert (=> start!111814 tp_is_empty!36067))

(declare-fun e!754534 () Bool)

(declare-fun array_inv!32772 (array!89143) Bool)

(assert (=> start!111814 (and (array_inv!32772 _values!1337) e!754534)))

(assert (=> start!111814 tp!106217))

(declare-fun b!1322843 () Bool)

(declare-fun e!754533 () Bool)

(assert (=> b!1322843 (= e!754534 (and e!754533 mapRes!55748))))

(declare-fun condMapEmpty!55748 () Bool)

(declare-fun mapDefault!55748 () ValueCell!17135)

(assert (=> b!1322843 (= condMapEmpty!55748 (= (arr!43041 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17135)) mapDefault!55748)))))

(declare-fun b!1322844 () Bool)

(declare-fun res!877664 () Bool)

(assert (=> b!1322844 (=> (not res!877664) (not e!754537))))

(assert (=> b!1322844 (= res!877664 (not (= (select (arr!43040 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322845 () Bool)

(assert (=> b!1322845 (= e!754537 (not true))))

(declare-fun lt!588000 () ListLongMap!21031)

(assert (=> b!1322845 (contains!8698 lt!588000 k0!1164)))

(declare-fun lt!588001 () V!53193)

(declare-datatypes ((Unit!43503 0))(
  ( (Unit!43504) )
))
(declare-fun lt!588003 () Unit!43503)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!163 ((_ BitVec 64) (_ BitVec 64) V!53193 ListLongMap!21031) Unit!43503)

(assert (=> b!1322845 (= lt!588003 (lemmaInListMapAfterAddingDiffThenInBefore!163 k0!1164 (select (arr!43040 _keys!1609) from!2000) lt!588001 lt!588000))))

(declare-fun lt!588005 () ListLongMap!21031)

(assert (=> b!1322845 (contains!8698 lt!588005 k0!1164)))

(declare-fun lt!587999 () Unit!43503)

(assert (=> b!1322845 (= lt!587999 (lemmaInListMapAfterAddingDiffThenInBefore!163 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588005))))

(declare-fun lt!588002 () ListLongMap!21031)

(assert (=> b!1322845 (contains!8698 lt!588002 k0!1164)))

(declare-fun lt!588004 () Unit!43503)

(assert (=> b!1322845 (= lt!588004 (lemmaInListMapAfterAddingDiffThenInBefore!163 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588002))))

(declare-fun +!4608 (ListLongMap!21031 tuple2!23366) ListLongMap!21031)

(assert (=> b!1322845 (= lt!588002 (+!4608 lt!588005 (tuple2!23367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1322845 (= lt!588005 (+!4608 lt!588000 (tuple2!23367 (select (arr!43040 _keys!1609) from!2000) lt!588001)))))

(declare-fun get!21685 (ValueCell!17135 V!53193) V!53193)

(declare-fun dynLambda!3562 (Int (_ BitVec 64)) V!53193)

(assert (=> b!1322845 (= lt!588001 (get!21685 (select (arr!43041 _values!1337) from!2000) (dynLambda!3562 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6247 (array!89141 array!89143 (_ BitVec 32) (_ BitVec 32) V!53193 V!53193 (_ BitVec 32) Int) ListLongMap!21031)

(assert (=> b!1322845 (= lt!588000 (getCurrentListMapNoExtraKeys!6247 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322846 () Bool)

(declare-fun e!754536 () Bool)

(assert (=> b!1322846 (= e!754536 tp_is_empty!36067)))

(declare-fun b!1322847 () Bool)

(declare-fun res!877663 () Bool)

(assert (=> b!1322847 (=> (not res!877663) (not e!754537))))

(assert (=> b!1322847 (= res!877663 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43591 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55748 () Bool)

(declare-fun tp!106216 () Bool)

(assert (=> mapNonEmpty!55748 (= mapRes!55748 (and tp!106216 e!754536))))

(declare-fun mapKey!55748 () (_ BitVec 32))

(declare-fun mapValue!55748 () ValueCell!17135)

(declare-fun mapRest!55748 () (Array (_ BitVec 32) ValueCell!17135))

(assert (=> mapNonEmpty!55748 (= (arr!43041 _values!1337) (store mapRest!55748 mapKey!55748 mapValue!55748))))

(declare-fun b!1322848 () Bool)

(assert (=> b!1322848 (= e!754533 tp_is_empty!36067)))

(declare-fun b!1322849 () Bool)

(declare-fun res!877660 () Bool)

(assert (=> b!1322849 (=> (not res!877660) (not e!754537))))

(assert (=> b!1322849 (= res!877660 (and (= (size!43592 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43591 _keys!1609) (size!43592 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111814 res!877665) b!1322849))

(assert (= (and b!1322849 res!877660) b!1322840))

(assert (= (and b!1322840 res!877659) b!1322842))

(assert (= (and b!1322842 res!877666) b!1322847))

(assert (= (and b!1322847 res!877663) b!1322841))

(assert (= (and b!1322841 res!877662) b!1322844))

(assert (= (and b!1322844 res!877664) b!1322839))

(assert (= (and b!1322839 res!877661) b!1322845))

(assert (= (and b!1322843 condMapEmpty!55748) mapIsEmpty!55748))

(assert (= (and b!1322843 (not condMapEmpty!55748)) mapNonEmpty!55748))

(get-info :version)

(assert (= (and mapNonEmpty!55748 ((_ is ValueCellFull!17135) mapValue!55748)) b!1322846))

(assert (= (and b!1322843 ((_ is ValueCellFull!17135) mapDefault!55748)) b!1322848))

(assert (= start!111814 b!1322843))

(declare-fun b_lambda!23567 () Bool)

(assert (=> (not b_lambda!23567) (not b!1322845)))

(declare-fun t!44305 () Bool)

(declare-fun tb!11591 () Bool)

(assert (=> (and start!111814 (= defaultEntry!1340 defaultEntry!1340) t!44305) tb!11591))

(declare-fun result!24245 () Bool)

(assert (=> tb!11591 (= result!24245 tp_is_empty!36067)))

(assert (=> b!1322845 t!44305))

(declare-fun b_and!48657 () Bool)

(assert (= b_and!48655 (and (=> t!44305 result!24245) b_and!48657)))

(declare-fun m!1211093 () Bool)

(assert (=> b!1322839 m!1211093))

(assert (=> b!1322839 m!1211093))

(declare-fun m!1211095 () Bool)

(assert (=> b!1322839 m!1211095))

(declare-fun m!1211097 () Bool)

(assert (=> b!1322841 m!1211097))

(assert (=> b!1322841 m!1211097))

(declare-fun m!1211099 () Bool)

(assert (=> b!1322841 m!1211099))

(declare-fun m!1211101 () Bool)

(assert (=> start!111814 m!1211101))

(declare-fun m!1211103 () Bool)

(assert (=> start!111814 m!1211103))

(declare-fun m!1211105 () Bool)

(assert (=> start!111814 m!1211105))

(declare-fun m!1211107 () Bool)

(assert (=> mapNonEmpty!55748 m!1211107))

(declare-fun m!1211109 () Bool)

(assert (=> b!1322845 m!1211109))

(declare-fun m!1211111 () Bool)

(assert (=> b!1322845 m!1211111))

(declare-fun m!1211113 () Bool)

(assert (=> b!1322845 m!1211113))

(declare-fun m!1211115 () Bool)

(assert (=> b!1322845 m!1211115))

(declare-fun m!1211117 () Bool)

(assert (=> b!1322845 m!1211117))

(declare-fun m!1211119 () Bool)

(assert (=> b!1322845 m!1211119))

(assert (=> b!1322845 m!1211117))

(assert (=> b!1322845 m!1211113))

(declare-fun m!1211121 () Bool)

(assert (=> b!1322845 m!1211121))

(declare-fun m!1211123 () Bool)

(assert (=> b!1322845 m!1211123))

(assert (=> b!1322845 m!1211093))

(declare-fun m!1211125 () Bool)

(assert (=> b!1322845 m!1211125))

(declare-fun m!1211127 () Bool)

(assert (=> b!1322845 m!1211127))

(assert (=> b!1322845 m!1211093))

(declare-fun m!1211129 () Bool)

(assert (=> b!1322845 m!1211129))

(declare-fun m!1211131 () Bool)

(assert (=> b!1322845 m!1211131))

(declare-fun m!1211133 () Bool)

(assert (=> b!1322840 m!1211133))

(assert (=> b!1322844 m!1211093))

(declare-fun m!1211135 () Bool)

(assert (=> b!1322842 m!1211135))

(check-sat (not b!1322842) (not b!1322845) tp_is_empty!36067 (not b!1322841) (not b_lambda!23567) (not b_next!30247) (not start!111814) b_and!48657 (not mapNonEmpty!55748) (not b!1322839) (not b!1322840))
(check-sat b_and!48657 (not b_next!30247))
