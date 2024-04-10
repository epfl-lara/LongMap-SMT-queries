; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111508 () Bool)

(assert start!111508)

(declare-fun b_free!30165 () Bool)

(declare-fun b_next!30165 () Bool)

(assert (=> start!111508 (= b_free!30165 (not b_next!30165))))

(declare-fun tp!105971 () Bool)

(declare-fun b_and!48489 () Bool)

(assert (=> start!111508 (= tp!105971 b_and!48489)))

(declare-fun b!1320105 () Bool)

(declare-fun e!753077 () Bool)

(declare-fun tp_is_empty!35985 () Bool)

(assert (=> b!1320105 (= e!753077 tp_is_empty!35985)))

(declare-fun b!1320106 () Bool)

(declare-fun res!876159 () Bool)

(declare-fun e!753078 () Bool)

(assert (=> b!1320106 (=> (not res!876159) (not e!753078))))

(declare-datatypes ((array!88900 0))(
  ( (array!88901 (arr!42924 (Array (_ BitVec 32) (_ BitVec 64))) (size!43474 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88900)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53083 0))(
  ( (V!53084 (val!18067 Int)) )
))
(declare-datatypes ((ValueCell!17094 0))(
  ( (ValueCellFull!17094 (v!20697 V!53083)) (EmptyCell!17094) )
))
(declare-datatypes ((array!88902 0))(
  ( (array!88903 (arr!42925 (Array (_ BitVec 32) ValueCell!17094)) (size!43475 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88902)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1320106 (= res!876159 (and (= (size!43475 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43474 _keys!1609) (size!43475 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320107 () Bool)

(assert (=> b!1320107 (= e!753078 (not true))))

(declare-datatypes ((tuple2!23258 0))(
  ( (tuple2!23259 (_1!11640 (_ BitVec 64)) (_2!11640 V!53083)) )
))
(declare-datatypes ((List!30410 0))(
  ( (Nil!30407) (Cons!30406 (h!31615 tuple2!23258) (t!44124 List!30410)) )
))
(declare-datatypes ((ListLongMap!20915 0))(
  ( (ListLongMap!20916 (toList!10473 List!30410)) )
))
(declare-fun lt!586839 () ListLongMap!20915)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8628 (ListLongMap!20915 (_ BitVec 64)) Bool)

(assert (=> b!1320107 (contains!8628 lt!586839 k0!1164)))

(declare-fun zeroValue!1279 () V!53083)

(declare-datatypes ((Unit!43484 0))(
  ( (Unit!43485) )
))
(declare-fun lt!586837 () Unit!43484)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!128 ((_ BitVec 64) (_ BitVec 64) V!53083 ListLongMap!20915) Unit!43484)

(assert (=> b!1320107 (= lt!586837 (lemmaInListMapAfterAddingDiffThenInBefore!128 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586839))))

(declare-fun lt!586836 () ListLongMap!20915)

(assert (=> b!1320107 (contains!8628 lt!586836 k0!1164)))

(declare-fun lt!586838 () Unit!43484)

(declare-fun minValue!1279 () V!53083)

(assert (=> b!1320107 (= lt!586838 (lemmaInListMapAfterAddingDiffThenInBefore!128 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586836))))

(declare-fun +!4532 (ListLongMap!20915 tuple2!23258) ListLongMap!20915)

(assert (=> b!1320107 (= lt!586836 (+!4532 lt!586839 (tuple2!23259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6167 (array!88900 array!88902 (_ BitVec 32) (_ BitVec 32) V!53083 V!53083 (_ BitVec 32) Int) ListLongMap!20915)

(declare-fun get!21578 (ValueCell!17094 V!53083) V!53083)

(declare-fun dynLambda!3471 (Int (_ BitVec 64)) V!53083)

(assert (=> b!1320107 (= lt!586839 (+!4532 (getCurrentListMapNoExtraKeys!6167 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23259 (select (arr!42924 _keys!1609) from!2000) (get!21578 (select (arr!42925 _values!1337) from!2000) (dynLambda!3471 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320108 () Bool)

(declare-fun res!876164 () Bool)

(assert (=> b!1320108 (=> (not res!876164) (not e!753078))))

(declare-fun getCurrentListMap!5481 (array!88900 array!88902 (_ BitVec 32) (_ BitVec 32) V!53083 V!53083 (_ BitVec 32) Int) ListLongMap!20915)

(assert (=> b!1320108 (= res!876164 (contains!8628 (getCurrentListMap!5481 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320110 () Bool)

(declare-fun e!753076 () Bool)

(assert (=> b!1320110 (= e!753076 tp_is_empty!35985)))

(declare-fun b!1320111 () Bool)

(declare-fun e!753075 () Bool)

(declare-fun mapRes!55625 () Bool)

(assert (=> b!1320111 (= e!753075 (and e!753076 mapRes!55625))))

(declare-fun condMapEmpty!55625 () Bool)

(declare-fun mapDefault!55625 () ValueCell!17094)

(assert (=> b!1320111 (= condMapEmpty!55625 (= (arr!42925 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17094)) mapDefault!55625)))))

(declare-fun b!1320112 () Bool)

(declare-fun res!876161 () Bool)

(assert (=> b!1320112 (=> (not res!876161) (not e!753078))))

(assert (=> b!1320112 (= res!876161 (not (= (select (arr!42924 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55625 () Bool)

(declare-fun tp!105970 () Bool)

(assert (=> mapNonEmpty!55625 (= mapRes!55625 (and tp!105970 e!753077))))

(declare-fun mapKey!55625 () (_ BitVec 32))

(declare-fun mapRest!55625 () (Array (_ BitVec 32) ValueCell!17094))

(declare-fun mapValue!55625 () ValueCell!17094)

(assert (=> mapNonEmpty!55625 (= (arr!42925 _values!1337) (store mapRest!55625 mapKey!55625 mapValue!55625))))

(declare-fun mapIsEmpty!55625 () Bool)

(assert (=> mapIsEmpty!55625 mapRes!55625))

(declare-fun b!1320113 () Bool)

(declare-fun res!876162 () Bool)

(assert (=> b!1320113 (=> (not res!876162) (not e!753078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320113 (= res!876162 (validKeyInArray!0 (select (arr!42924 _keys!1609) from!2000)))))

(declare-fun b!1320114 () Bool)

(declare-fun res!876158 () Bool)

(assert (=> b!1320114 (=> (not res!876158) (not e!753078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88900 (_ BitVec 32)) Bool)

(assert (=> b!1320114 (= res!876158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320115 () Bool)

(declare-fun res!876157 () Bool)

(assert (=> b!1320115 (=> (not res!876157) (not e!753078))))

(assert (=> b!1320115 (= res!876157 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43474 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320109 () Bool)

(declare-fun res!876160 () Bool)

(assert (=> b!1320109 (=> (not res!876160) (not e!753078))))

(declare-datatypes ((List!30411 0))(
  ( (Nil!30408) (Cons!30407 (h!31616 (_ BitVec 64)) (t!44125 List!30411)) )
))
(declare-fun arrayNoDuplicates!0 (array!88900 (_ BitVec 32) List!30411) Bool)

(assert (=> b!1320109 (= res!876160 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30408))))

(declare-fun res!876163 () Bool)

(assert (=> start!111508 (=> (not res!876163) (not e!753078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111508 (= res!876163 (validMask!0 mask!2019))))

(assert (=> start!111508 e!753078))

(declare-fun array_inv!32407 (array!88900) Bool)

(assert (=> start!111508 (array_inv!32407 _keys!1609)))

(assert (=> start!111508 true))

(assert (=> start!111508 tp_is_empty!35985))

(declare-fun array_inv!32408 (array!88902) Bool)

(assert (=> start!111508 (and (array_inv!32408 _values!1337) e!753075)))

(assert (=> start!111508 tp!105971))

(assert (= (and start!111508 res!876163) b!1320106))

(assert (= (and b!1320106 res!876159) b!1320114))

(assert (= (and b!1320114 res!876158) b!1320109))

(assert (= (and b!1320109 res!876160) b!1320115))

(assert (= (and b!1320115 res!876157) b!1320108))

(assert (= (and b!1320108 res!876164) b!1320112))

(assert (= (and b!1320112 res!876161) b!1320113))

(assert (= (and b!1320113 res!876162) b!1320107))

(assert (= (and b!1320111 condMapEmpty!55625) mapIsEmpty!55625))

(assert (= (and b!1320111 (not condMapEmpty!55625)) mapNonEmpty!55625))

(get-info :version)

(assert (= (and mapNonEmpty!55625 ((_ is ValueCellFull!17094) mapValue!55625)) b!1320105))

(assert (= (and b!1320111 ((_ is ValueCellFull!17094) mapDefault!55625)) b!1320110))

(assert (= start!111508 b!1320111))

(declare-fun b_lambda!23491 () Bool)

(assert (=> (not b_lambda!23491) (not b!1320107)))

(declare-fun t!44123 () Bool)

(declare-fun tb!11517 () Bool)

(assert (=> (and start!111508 (= defaultEntry!1340 defaultEntry!1340) t!44123) tb!11517))

(declare-fun result!24089 () Bool)

(assert (=> tb!11517 (= result!24089 tp_is_empty!35985)))

(assert (=> b!1320107 t!44123))

(declare-fun b_and!48491 () Bool)

(assert (= b_and!48489 (and (=> t!44123 result!24089) b_and!48491)))

(declare-fun m!1207771 () Bool)

(assert (=> b!1320109 m!1207771))

(declare-fun m!1207773 () Bool)

(assert (=> b!1320113 m!1207773))

(assert (=> b!1320113 m!1207773))

(declare-fun m!1207775 () Bool)

(assert (=> b!1320113 m!1207775))

(declare-fun m!1207777 () Bool)

(assert (=> mapNonEmpty!55625 m!1207777))

(declare-fun m!1207779 () Bool)

(assert (=> b!1320108 m!1207779))

(assert (=> b!1320108 m!1207779))

(declare-fun m!1207781 () Bool)

(assert (=> b!1320108 m!1207781))

(declare-fun m!1207783 () Bool)

(assert (=> b!1320107 m!1207783))

(declare-fun m!1207785 () Bool)

(assert (=> b!1320107 m!1207785))

(assert (=> b!1320107 m!1207783))

(declare-fun m!1207787 () Bool)

(assert (=> b!1320107 m!1207787))

(declare-fun m!1207789 () Bool)

(assert (=> b!1320107 m!1207789))

(declare-fun m!1207791 () Bool)

(assert (=> b!1320107 m!1207791))

(assert (=> b!1320107 m!1207789))

(assert (=> b!1320107 m!1207785))

(declare-fun m!1207793 () Bool)

(assert (=> b!1320107 m!1207793))

(assert (=> b!1320107 m!1207773))

(declare-fun m!1207795 () Bool)

(assert (=> b!1320107 m!1207795))

(declare-fun m!1207797 () Bool)

(assert (=> b!1320107 m!1207797))

(declare-fun m!1207799 () Bool)

(assert (=> b!1320107 m!1207799))

(declare-fun m!1207801 () Bool)

(assert (=> b!1320107 m!1207801))

(declare-fun m!1207803 () Bool)

(assert (=> start!111508 m!1207803))

(declare-fun m!1207805 () Bool)

(assert (=> start!111508 m!1207805))

(declare-fun m!1207807 () Bool)

(assert (=> start!111508 m!1207807))

(assert (=> b!1320112 m!1207773))

(declare-fun m!1207809 () Bool)

(assert (=> b!1320114 m!1207809))

(check-sat tp_is_empty!35985 (not b!1320114) (not b_lambda!23491) (not b!1320107) b_and!48491 (not mapNonEmpty!55625) (not b!1320109) (not b!1320108) (not b_next!30165) (not start!111508) (not b!1320113))
(check-sat b_and!48491 (not b_next!30165))
