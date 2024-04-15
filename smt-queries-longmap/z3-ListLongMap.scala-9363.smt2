; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111614 () Bool)

(assert start!111614)

(declare-fun b_free!30271 () Bool)

(declare-fun b_next!30271 () Bool)

(assert (=> start!111614 (= b_free!30271 (not b_next!30271))))

(declare-fun tp!106289 () Bool)

(declare-fun b_and!48683 () Bool)

(assert (=> start!111614 (= tp!106289 b_and!48683)))

(declare-fun mapIsEmpty!55784 () Bool)

(declare-fun mapRes!55784 () Bool)

(assert (=> mapIsEmpty!55784 mapRes!55784))

(declare-fun b!1321890 () Bool)

(declare-fun res!877401 () Bool)

(declare-fun e!753839 () Bool)

(assert (=> b!1321890 (=> (not res!877401) (not e!753839))))

(declare-datatypes ((array!89035 0))(
  ( (array!89036 (arr!42992 (Array (_ BitVec 32) (_ BitVec 64))) (size!43544 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89035)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321890 (= res!877401 (validKeyInArray!0 (select (arr!42992 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55784 () Bool)

(declare-fun tp!106290 () Bool)

(declare-fun e!753841 () Bool)

(assert (=> mapNonEmpty!55784 (= mapRes!55784 (and tp!106290 e!753841))))

(declare-datatypes ((V!53225 0))(
  ( (V!53226 (val!18120 Int)) )
))
(declare-datatypes ((ValueCell!17147 0))(
  ( (ValueCellFull!17147 (v!20749 V!53225)) (EmptyCell!17147) )
))
(declare-fun mapValue!55784 () ValueCell!17147)

(declare-fun mapKey!55784 () (_ BitVec 32))

(declare-fun mapRest!55784 () (Array (_ BitVec 32) ValueCell!17147))

(declare-datatypes ((array!89037 0))(
  ( (array!89038 (arr!42993 (Array (_ BitVec 32) ValueCell!17147)) (size!43545 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89037)

(assert (=> mapNonEmpty!55784 (= (arr!42993 _values!1337) (store mapRest!55784 mapKey!55784 mapValue!55784))))

(declare-fun b!1321892 () Bool)

(declare-fun res!877400 () Bool)

(assert (=> b!1321892 (=> (not res!877400) (not e!753839))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89035 (_ BitVec 32)) Bool)

(assert (=> b!1321892 (= res!877400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321893 () Bool)

(declare-fun e!753840 () Bool)

(declare-fun tp_is_empty!36091 () Bool)

(assert (=> b!1321893 (= e!753840 tp_is_empty!36091)))

(declare-fun b!1321894 () Bool)

(declare-fun res!877403 () Bool)

(assert (=> b!1321894 (=> (not res!877403) (not e!753839))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1321894 (= res!877403 (and (= (size!43545 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43544 _keys!1609) (size!43545 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321895 () Bool)

(assert (=> b!1321895 (= e!753839 (not true))))

(declare-datatypes ((tuple2!23418 0))(
  ( (tuple2!23419 (_1!11720 (_ BitVec 64)) (_2!11720 V!53225)) )
))
(declare-datatypes ((List!30552 0))(
  ( (Nil!30549) (Cons!30548 (h!31757 tuple2!23418) (t!44364 List!30552)) )
))
(declare-datatypes ((ListLongMap!21075 0))(
  ( (ListLongMap!21076 (toList!10553 List!30552)) )
))
(declare-fun lt!587616 () ListLongMap!21075)

(declare-fun lt!587614 () tuple2!23418)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8636 (ListLongMap!21075 (_ BitVec 64)) Bool)

(declare-fun +!4595 (ListLongMap!21075 tuple2!23418) ListLongMap!21075)

(assert (=> b!1321895 (contains!8636 (+!4595 lt!587616 lt!587614) k0!1164)))

(declare-fun zeroValue!1279 () V!53225)

(declare-datatypes ((Unit!43373 0))(
  ( (Unit!43374) )
))
(declare-fun lt!587619 () Unit!43373)

(declare-fun addStillContains!1119 (ListLongMap!21075 (_ BitVec 64) V!53225 (_ BitVec 64)) Unit!43373)

(assert (=> b!1321895 (= lt!587619 (addStillContains!1119 lt!587616 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1321895 (contains!8636 lt!587616 k0!1164)))

(declare-fun lt!587611 () Unit!43373)

(declare-fun lt!587612 () V!53225)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!160 ((_ BitVec 64) (_ BitVec 64) V!53225 ListLongMap!21075) Unit!43373)

(assert (=> b!1321895 (= lt!587611 (lemmaInListMapAfterAddingDiffThenInBefore!160 k0!1164 (select (arr!42992 _keys!1609) from!2000) lt!587612 lt!587616))))

(declare-fun lt!587615 () ListLongMap!21075)

(assert (=> b!1321895 (contains!8636 lt!587615 k0!1164)))

(declare-fun lt!587617 () Unit!43373)

(assert (=> b!1321895 (= lt!587617 (lemmaInListMapAfterAddingDiffThenInBefore!160 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587615))))

(declare-fun lt!587618 () ListLongMap!21075)

(assert (=> b!1321895 (contains!8636 lt!587618 k0!1164)))

(declare-fun lt!587613 () Unit!43373)

(declare-fun minValue!1279 () V!53225)

(assert (=> b!1321895 (= lt!587613 (lemmaInListMapAfterAddingDiffThenInBefore!160 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587618))))

(assert (=> b!1321895 (= lt!587618 (+!4595 lt!587615 lt!587614))))

(assert (=> b!1321895 (= lt!587614 (tuple2!23419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1321895 (= lt!587615 (+!4595 lt!587616 (tuple2!23419 (select (arr!42992 _keys!1609) from!2000) lt!587612)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21644 (ValueCell!17147 V!53225) V!53225)

(declare-fun dynLambda!3525 (Int (_ BitVec 64)) V!53225)

(assert (=> b!1321895 (= lt!587612 (get!21644 (select (arr!42993 _values!1337) from!2000) (dynLambda!3525 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6228 (array!89035 array!89037 (_ BitVec 32) (_ BitVec 32) V!53225 V!53225 (_ BitVec 32) Int) ListLongMap!21075)

(assert (=> b!1321895 (= lt!587616 (getCurrentListMapNoExtraKeys!6228 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321896 () Bool)

(declare-fun res!877405 () Bool)

(assert (=> b!1321896 (=> (not res!877405) (not e!753839))))

(assert (=> b!1321896 (= res!877405 (not (= (select (arr!42992 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321897 () Bool)

(declare-fun res!877407 () Bool)

(assert (=> b!1321897 (=> (not res!877407) (not e!753839))))

(declare-fun getCurrentListMap!5438 (array!89035 array!89037 (_ BitVec 32) (_ BitVec 32) V!53225 V!53225 (_ BitVec 32) Int) ListLongMap!21075)

(assert (=> b!1321897 (= res!877407 (contains!8636 (getCurrentListMap!5438 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321898 () Bool)

(declare-fun e!753838 () Bool)

(assert (=> b!1321898 (= e!753838 (and e!753840 mapRes!55784))))

(declare-fun condMapEmpty!55784 () Bool)

(declare-fun mapDefault!55784 () ValueCell!17147)

(assert (=> b!1321898 (= condMapEmpty!55784 (= (arr!42993 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17147)) mapDefault!55784)))))

(declare-fun res!877402 () Bool)

(assert (=> start!111614 (=> (not res!877402) (not e!753839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111614 (= res!877402 (validMask!0 mask!2019))))

(assert (=> start!111614 e!753839))

(declare-fun array_inv!32641 (array!89035) Bool)

(assert (=> start!111614 (array_inv!32641 _keys!1609)))

(assert (=> start!111614 true))

(assert (=> start!111614 tp_is_empty!36091))

(declare-fun array_inv!32642 (array!89037) Bool)

(assert (=> start!111614 (and (array_inv!32642 _values!1337) e!753838)))

(assert (=> start!111614 tp!106289))

(declare-fun b!1321891 () Bool)

(declare-fun res!877406 () Bool)

(assert (=> b!1321891 (=> (not res!877406) (not e!753839))))

(declare-datatypes ((List!30553 0))(
  ( (Nil!30550) (Cons!30549 (h!31758 (_ BitVec 64)) (t!44365 List!30553)) )
))
(declare-fun arrayNoDuplicates!0 (array!89035 (_ BitVec 32) List!30553) Bool)

(assert (=> b!1321891 (= res!877406 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30550))))

(declare-fun b!1321899 () Bool)

(assert (=> b!1321899 (= e!753841 tp_is_empty!36091)))

(declare-fun b!1321900 () Bool)

(declare-fun res!877404 () Bool)

(assert (=> b!1321900 (=> (not res!877404) (not e!753839))))

(assert (=> b!1321900 (= res!877404 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43544 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111614 res!877402) b!1321894))

(assert (= (and b!1321894 res!877403) b!1321892))

(assert (= (and b!1321892 res!877400) b!1321891))

(assert (= (and b!1321891 res!877406) b!1321900))

(assert (= (and b!1321900 res!877404) b!1321897))

(assert (= (and b!1321897 res!877407) b!1321896))

(assert (= (and b!1321896 res!877405) b!1321890))

(assert (= (and b!1321890 res!877401) b!1321895))

(assert (= (and b!1321898 condMapEmpty!55784) mapIsEmpty!55784))

(assert (= (and b!1321898 (not condMapEmpty!55784)) mapNonEmpty!55784))

(get-info :version)

(assert (= (and mapNonEmpty!55784 ((_ is ValueCellFull!17147) mapValue!55784)) b!1321899))

(assert (= (and b!1321898 ((_ is ValueCellFull!17147) mapDefault!55784)) b!1321893))

(assert (= start!111614 b!1321898))

(declare-fun b_lambda!23587 () Bool)

(assert (=> (not b_lambda!23587) (not b!1321895)))

(declare-fun t!44363 () Bool)

(declare-fun tb!11615 () Bool)

(assert (=> (and start!111614 (= defaultEntry!1340 defaultEntry!1340) t!44363) tb!11615))

(declare-fun result!24293 () Bool)

(assert (=> tb!11615 (= result!24293 tp_is_empty!36091)))

(assert (=> b!1321895 t!44363))

(declare-fun b_and!48685 () Bool)

(assert (= b_and!48683 (and (=> t!44363 result!24293) b_and!48685)))

(declare-fun m!1209525 () Bool)

(assert (=> b!1321892 m!1209525))

(declare-fun m!1209527 () Bool)

(assert (=> b!1321896 m!1209527))

(assert (=> b!1321890 m!1209527))

(assert (=> b!1321890 m!1209527))

(declare-fun m!1209529 () Bool)

(assert (=> b!1321890 m!1209529))

(declare-fun m!1209531 () Bool)

(assert (=> b!1321895 m!1209531))

(declare-fun m!1209533 () Bool)

(assert (=> b!1321895 m!1209533))

(assert (=> b!1321895 m!1209527))

(declare-fun m!1209535 () Bool)

(assert (=> b!1321895 m!1209535))

(declare-fun m!1209537 () Bool)

(assert (=> b!1321895 m!1209537))

(declare-fun m!1209539 () Bool)

(assert (=> b!1321895 m!1209539))

(declare-fun m!1209541 () Bool)

(assert (=> b!1321895 m!1209541))

(declare-fun m!1209543 () Bool)

(assert (=> b!1321895 m!1209543))

(declare-fun m!1209545 () Bool)

(assert (=> b!1321895 m!1209545))

(declare-fun m!1209547 () Bool)

(assert (=> b!1321895 m!1209547))

(declare-fun m!1209549 () Bool)

(assert (=> b!1321895 m!1209549))

(declare-fun m!1209551 () Bool)

(assert (=> b!1321895 m!1209551))

(assert (=> b!1321895 m!1209547))

(declare-fun m!1209553 () Bool)

(assert (=> b!1321895 m!1209553))

(declare-fun m!1209555 () Bool)

(assert (=> b!1321895 m!1209555))

(assert (=> b!1321895 m!1209553))

(assert (=> b!1321895 m!1209533))

(declare-fun m!1209557 () Bool)

(assert (=> b!1321895 m!1209557))

(declare-fun m!1209559 () Bool)

(assert (=> b!1321895 m!1209559))

(assert (=> b!1321895 m!1209527))

(declare-fun m!1209561 () Bool)

(assert (=> b!1321897 m!1209561))

(assert (=> b!1321897 m!1209561))

(declare-fun m!1209563 () Bool)

(assert (=> b!1321897 m!1209563))

(declare-fun m!1209565 () Bool)

(assert (=> mapNonEmpty!55784 m!1209565))

(declare-fun m!1209567 () Bool)

(assert (=> start!111614 m!1209567))

(declare-fun m!1209569 () Bool)

(assert (=> start!111614 m!1209569))

(declare-fun m!1209571 () Bool)

(assert (=> start!111614 m!1209571))

(declare-fun m!1209573 () Bool)

(assert (=> b!1321891 m!1209573))

(check-sat (not start!111614) tp_is_empty!36091 (not b_next!30271) (not b!1321891) (not b!1321895) (not b_lambda!23587) (not b!1321897) (not mapNonEmpty!55784) b_and!48685 (not b!1321892) (not b!1321890))
(check-sat b_and!48685 (not b_next!30271))
