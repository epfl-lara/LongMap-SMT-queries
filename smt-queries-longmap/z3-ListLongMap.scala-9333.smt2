; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111658 () Bool)

(assert start!111658)

(declare-fun b_free!30091 () Bool)

(declare-fun b_next!30091 () Bool)

(assert (=> start!111658 (= b_free!30091 (not b_next!30091))))

(declare-fun tp!105749 () Bool)

(declare-fun b_and!48343 () Bool)

(assert (=> start!111658 (= tp!105749 b_and!48343)))

(declare-fun b!1320109 () Bool)

(declare-fun res!875792 () Bool)

(declare-fun e!753364 () Bool)

(assert (=> b!1320109 (=> (not res!875792) (not e!753364))))

(declare-datatypes ((array!88839 0))(
  ( (array!88840 (arr!42889 (Array (_ BitVec 32) (_ BitVec 64))) (size!43440 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88839)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88839 (_ BitVec 32)) Bool)

(assert (=> b!1320109 (= res!875792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320111 () Bool)

(declare-fun res!875791 () Bool)

(assert (=> b!1320111 (=> (not res!875791) (not e!753364))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1320111 (= res!875791 (not (= (select (arr!42889 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55514 () Bool)

(declare-fun mapRes!55514 () Bool)

(declare-fun tp!105748 () Bool)

(declare-fun e!753367 () Bool)

(assert (=> mapNonEmpty!55514 (= mapRes!55514 (and tp!105748 e!753367))))

(declare-datatypes ((V!52985 0))(
  ( (V!52986 (val!18030 Int)) )
))
(declare-datatypes ((ValueCell!17057 0))(
  ( (ValueCellFull!17057 (v!20655 V!52985)) (EmptyCell!17057) )
))
(declare-datatypes ((array!88841 0))(
  ( (array!88842 (arr!42890 (Array (_ BitVec 32) ValueCell!17057)) (size!43441 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88841)

(declare-fun mapValue!55514 () ValueCell!17057)

(declare-fun mapRest!55514 () (Array (_ BitVec 32) ValueCell!17057))

(declare-fun mapKey!55514 () (_ BitVec 32))

(assert (=> mapNonEmpty!55514 (= (arr!42890 _values!1337) (store mapRest!55514 mapKey!55514 mapValue!55514))))

(declare-fun b!1320112 () Bool)

(declare-fun res!875789 () Bool)

(assert (=> b!1320112 (=> (not res!875789) (not e!753364))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320112 (= res!875789 (and (= (size!43441 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43440 _keys!1609) (size!43441 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320113 () Bool)

(declare-fun e!753365 () Bool)

(declare-fun tp_is_empty!35911 () Bool)

(assert (=> b!1320113 (= e!753365 tp_is_empty!35911)))

(declare-fun b!1320114 () Bool)

(assert (=> b!1320114 (= e!753367 tp_is_empty!35911)))

(declare-fun b!1320115 () Bool)

(assert (=> b!1320115 (= e!753364 (not true))))

(declare-datatypes ((tuple2!23236 0))(
  ( (tuple2!23237 (_1!11629 (_ BitVec 64)) (_2!11629 V!52985)) )
))
(declare-datatypes ((List!30398 0))(
  ( (Nil!30395) (Cons!30394 (h!31612 tuple2!23236) (t!44030 List!30398)) )
))
(declare-datatypes ((ListLongMap!20901 0))(
  ( (ListLongMap!20902 (toList!10466 List!30398)) )
))
(declare-fun lt!587008 () ListLongMap!20901)

(declare-fun contains!8633 (ListLongMap!20901 (_ BitVec 64)) Bool)

(assert (=> b!1320115 (contains!8633 lt!587008 k0!1164)))

(declare-datatypes ((Unit!43397 0))(
  ( (Unit!43398) )
))
(declare-fun lt!587009 () Unit!43397)

(declare-fun minValue!1279 () V!52985)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!110 ((_ BitVec 64) (_ BitVec 64) V!52985 ListLongMap!20901) Unit!43397)

(assert (=> b!1320115 (= lt!587009 (lemmaInListMapAfterAddingDiffThenInBefore!110 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587008))))

(declare-fun zeroValue!1279 () V!52985)

(declare-fun defaultEntry!1340 () Int)

(declare-fun +!4555 (ListLongMap!20901 tuple2!23236) ListLongMap!20901)

(declare-fun getCurrentListMapNoExtraKeys!6194 (array!88839 array!88841 (_ BitVec 32) (_ BitVec 32) V!52985 V!52985 (_ BitVec 32) Int) ListLongMap!20901)

(declare-fun get!21580 (ValueCell!17057 V!52985) V!52985)

(declare-fun dynLambda!3509 (Int (_ BitVec 64)) V!52985)

(assert (=> b!1320115 (= lt!587008 (+!4555 (+!4555 (getCurrentListMapNoExtraKeys!6194 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23237 (select (arr!42889 _keys!1609) from!2000) (get!21580 (select (arr!42890 _values!1337) from!2000) (dynLambda!3509 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1320116 () Bool)

(declare-fun res!875793 () Bool)

(assert (=> b!1320116 (=> (not res!875793) (not e!753364))))

(declare-datatypes ((List!30399 0))(
  ( (Nil!30396) (Cons!30395 (h!31613 (_ BitVec 64)) (t!44031 List!30399)) )
))
(declare-fun arrayNoDuplicates!0 (array!88839 (_ BitVec 32) List!30399) Bool)

(assert (=> b!1320116 (= res!875793 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30396))))

(declare-fun b!1320117 () Bool)

(declare-fun res!875788 () Bool)

(assert (=> b!1320117 (=> (not res!875788) (not e!753364))))

(declare-fun getCurrentListMap!5467 (array!88839 array!88841 (_ BitVec 32) (_ BitVec 32) V!52985 V!52985 (_ BitVec 32) Int) ListLongMap!20901)

(assert (=> b!1320117 (= res!875788 (contains!8633 (getCurrentListMap!5467 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320118 () Bool)

(declare-fun res!875794 () Bool)

(assert (=> b!1320118 (=> (not res!875794) (not e!753364))))

(assert (=> b!1320118 (= res!875794 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43440 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55514 () Bool)

(assert (=> mapIsEmpty!55514 mapRes!55514))

(declare-fun b!1320119 () Bool)

(declare-fun e!753363 () Bool)

(assert (=> b!1320119 (= e!753363 (and e!753365 mapRes!55514))))

(declare-fun condMapEmpty!55514 () Bool)

(declare-fun mapDefault!55514 () ValueCell!17057)

(assert (=> b!1320119 (= condMapEmpty!55514 (= (arr!42890 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17057)) mapDefault!55514)))))

(declare-fun b!1320110 () Bool)

(declare-fun res!875790 () Bool)

(assert (=> b!1320110 (=> (not res!875790) (not e!753364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320110 (= res!875790 (validKeyInArray!0 (select (arr!42889 _keys!1609) from!2000)))))

(declare-fun res!875787 () Bool)

(assert (=> start!111658 (=> (not res!875787) (not e!753364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111658 (= res!875787 (validMask!0 mask!2019))))

(assert (=> start!111658 e!753364))

(declare-fun array_inv!32653 (array!88839) Bool)

(assert (=> start!111658 (array_inv!32653 _keys!1609)))

(assert (=> start!111658 true))

(assert (=> start!111658 tp_is_empty!35911))

(declare-fun array_inv!32654 (array!88841) Bool)

(assert (=> start!111658 (and (array_inv!32654 _values!1337) e!753363)))

(assert (=> start!111658 tp!105749))

(assert (= (and start!111658 res!875787) b!1320112))

(assert (= (and b!1320112 res!875789) b!1320109))

(assert (= (and b!1320109 res!875792) b!1320116))

(assert (= (and b!1320116 res!875793) b!1320118))

(assert (= (and b!1320118 res!875794) b!1320117))

(assert (= (and b!1320117 res!875788) b!1320111))

(assert (= (and b!1320111 res!875791) b!1320110))

(assert (= (and b!1320110 res!875790) b!1320115))

(assert (= (and b!1320119 condMapEmpty!55514) mapIsEmpty!55514))

(assert (= (and b!1320119 (not condMapEmpty!55514)) mapNonEmpty!55514))

(get-info :version)

(assert (= (and mapNonEmpty!55514 ((_ is ValueCellFull!17057) mapValue!55514)) b!1320114))

(assert (= (and b!1320119 ((_ is ValueCellFull!17057) mapDefault!55514)) b!1320113))

(assert (= start!111658 b!1320119))

(declare-fun b_lambda!23411 () Bool)

(assert (=> (not b_lambda!23411) (not b!1320115)))

(declare-fun t!44029 () Bool)

(declare-fun tb!11435 () Bool)

(assert (=> (and start!111658 (= defaultEntry!1340 defaultEntry!1340) t!44029) tb!11435))

(declare-fun result!23933 () Bool)

(assert (=> tb!11435 (= result!23933 tp_is_empty!35911)))

(assert (=> b!1320115 t!44029))

(declare-fun b_and!48345 () Bool)

(assert (= b_and!48343 (and (=> t!44029 result!23933) b_and!48345)))

(declare-fun m!1207985 () Bool)

(assert (=> start!111658 m!1207985))

(declare-fun m!1207987 () Bool)

(assert (=> start!111658 m!1207987))

(declare-fun m!1207989 () Bool)

(assert (=> start!111658 m!1207989))

(declare-fun m!1207991 () Bool)

(assert (=> mapNonEmpty!55514 m!1207991))

(declare-fun m!1207993 () Bool)

(assert (=> b!1320109 m!1207993))

(declare-fun m!1207995 () Bool)

(assert (=> b!1320111 m!1207995))

(declare-fun m!1207997 () Bool)

(assert (=> b!1320117 m!1207997))

(assert (=> b!1320117 m!1207997))

(declare-fun m!1207999 () Bool)

(assert (=> b!1320117 m!1207999))

(declare-fun m!1208001 () Bool)

(assert (=> b!1320116 m!1208001))

(declare-fun m!1208003 () Bool)

(assert (=> b!1320115 m!1208003))

(declare-fun m!1208005 () Bool)

(assert (=> b!1320115 m!1208005))

(declare-fun m!1208007 () Bool)

(assert (=> b!1320115 m!1208007))

(assert (=> b!1320115 m!1208005))

(declare-fun m!1208009 () Bool)

(assert (=> b!1320115 m!1208009))

(declare-fun m!1208011 () Bool)

(assert (=> b!1320115 m!1208011))

(assert (=> b!1320115 m!1208011))

(assert (=> b!1320115 m!1208007))

(declare-fun m!1208013 () Bool)

(assert (=> b!1320115 m!1208013))

(assert (=> b!1320115 m!1207995))

(assert (=> b!1320115 m!1208009))

(declare-fun m!1208015 () Bool)

(assert (=> b!1320115 m!1208015))

(declare-fun m!1208017 () Bool)

(assert (=> b!1320115 m!1208017))

(assert (=> b!1320110 m!1207995))

(assert (=> b!1320110 m!1207995))

(declare-fun m!1208019 () Bool)

(assert (=> b!1320110 m!1208019))

(check-sat (not b!1320109) (not b_lambda!23411) (not b!1320115) (not b!1320116) (not b_next!30091) (not mapNonEmpty!55514) b_and!48345 (not b!1320110) (not start!111658) (not b!1320117) tp_is_empty!35911)
(check-sat b_and!48345 (not b_next!30091))
