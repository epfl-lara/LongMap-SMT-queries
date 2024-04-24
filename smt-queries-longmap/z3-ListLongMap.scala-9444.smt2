; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112496 () Bool)

(assert start!112496)

(declare-fun b_free!30667 () Bool)

(declare-fun b_next!30667 () Bool)

(assert (=> start!112496 (= b_free!30667 (not b_next!30667))))

(declare-fun tp!107638 () Bool)

(declare-fun b_and!49391 () Bool)

(assert (=> start!112496 (= tp!107638 b_and!49391)))

(declare-fun mapNonEmpty!56539 () Bool)

(declare-fun mapRes!56539 () Bool)

(declare-fun tp!107637 () Bool)

(declare-fun e!759049 () Bool)

(assert (=> mapNonEmpty!56539 (= mapRes!56539 (and tp!107637 e!759049))))

(declare-datatypes ((V!53873 0))(
  ( (V!53874 (val!18363 Int)) )
))
(declare-datatypes ((ValueCell!17390 0))(
  ( (ValueCellFull!17390 (v!20995 V!53873)) (EmptyCell!17390) )
))
(declare-datatypes ((array!90151 0))(
  ( (array!90152 (arr!43537 (Array (_ BitVec 32) ValueCell!17390)) (size!44088 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90151)

(declare-fun mapValue!56539 () ValueCell!17390)

(declare-fun mapKey!56539 () (_ BitVec 32))

(declare-fun mapRest!56539 () (Array (_ BitVec 32) ValueCell!17390))

(assert (=> mapNonEmpty!56539 (= (arr!43537 _values!1320) (store mapRest!56539 mapKey!56539 mapValue!56539))))

(declare-fun b!1331534 () Bool)

(declare-fun res!883186 () Bool)

(declare-fun e!759046 () Bool)

(assert (=> b!1331534 (=> (not res!883186) (not e!759046))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331534 (= res!883186 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331535 () Bool)

(declare-fun res!883179 () Bool)

(assert (=> b!1331535 (=> (not res!883179) (not e!759046))))

(declare-datatypes ((array!90153 0))(
  ( (array!90154 (arr!43538 (Array (_ BitVec 32) (_ BitVec 64))) (size!44089 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90153)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90153 (_ BitVec 32)) Bool)

(assert (=> b!1331535 (= res!883179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331536 () Bool)

(declare-fun res!883183 () Bool)

(assert (=> b!1331536 (=> (not res!883183) (not e!759046))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331536 (= res!883183 (not (= (select (arr!43538 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapIsEmpty!56539 () Bool)

(assert (=> mapIsEmpty!56539 mapRes!56539))

(declare-fun b!1331537 () Bool)

(declare-fun res!883187 () Bool)

(assert (=> b!1331537 (=> (not res!883187) (not e!759046))))

(assert (=> b!1331537 (= res!883187 (and (= (size!44088 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44089 _keys!1590) (size!44088 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331538 () Bool)

(assert (=> b!1331538 (= e!759046 (not true))))

(declare-datatypes ((tuple2!23682 0))(
  ( (tuple2!23683 (_1!11852 (_ BitVec 64)) (_2!11852 V!53873)) )
))
(declare-datatypes ((List!30850 0))(
  ( (Nil!30847) (Cons!30846 (h!32064 tuple2!23682) (t!44922 List!30850)) )
))
(declare-datatypes ((ListLongMap!21347 0))(
  ( (ListLongMap!21348 (toList!10689 List!30850)) )
))
(declare-fun lt!591557 () ListLongMap!21347)

(declare-fun contains!8865 (ListLongMap!21347 (_ BitVec 64)) Bool)

(assert (=> b!1331538 (contains!8865 lt!591557 k0!1153)))

(declare-datatypes ((Unit!43724 0))(
  ( (Unit!43725) )
))
(declare-fun lt!591558 () Unit!43724)

(declare-fun minValue!1262 () V!53873)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!250 ((_ BitVec 64) (_ BitVec 64) V!53873 ListLongMap!21347) Unit!43724)

(assert (=> b!1331538 (= lt!591558 (lemmaInListMapAfterAddingDiffThenInBefore!250 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591557))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53873)

(declare-fun +!4707 (ListLongMap!21347 tuple2!23682) ListLongMap!21347)

(declare-fun getCurrentListMapNoExtraKeys!6351 (array!90153 array!90151 (_ BitVec 32) (_ BitVec 32) V!53873 V!53873 (_ BitVec 32) Int) ListLongMap!21347)

(declare-fun get!21962 (ValueCell!17390 V!53873) V!53873)

(declare-fun dynLambda!3661 (Int (_ BitVec 64)) V!53873)

(assert (=> b!1331538 (= lt!591557 (+!4707 (getCurrentListMapNoExtraKeys!6351 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23683 (select (arr!43538 _keys!1590) from!1980) (get!21962 (select (arr!43537 _values!1320) from!1980) (dynLambda!3661 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!883185 () Bool)

(assert (=> start!112496 (=> (not res!883185) (not e!759046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112496 (= res!883185 (validMask!0 mask!1998))))

(assert (=> start!112496 e!759046))

(declare-fun e!759048 () Bool)

(declare-fun array_inv!33127 (array!90151) Bool)

(assert (=> start!112496 (and (array_inv!33127 _values!1320) e!759048)))

(assert (=> start!112496 true))

(declare-fun array_inv!33128 (array!90153) Bool)

(assert (=> start!112496 (array_inv!33128 _keys!1590)))

(assert (=> start!112496 tp!107638))

(declare-fun tp_is_empty!36577 () Bool)

(assert (=> start!112496 tp_is_empty!36577))

(declare-fun b!1331539 () Bool)

(declare-fun e!759045 () Bool)

(assert (=> b!1331539 (= e!759048 (and e!759045 mapRes!56539))))

(declare-fun condMapEmpty!56539 () Bool)

(declare-fun mapDefault!56539 () ValueCell!17390)

(assert (=> b!1331539 (= condMapEmpty!56539 (= (arr!43537 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17390)) mapDefault!56539)))))

(declare-fun b!1331540 () Bool)

(declare-fun res!883182 () Bool)

(assert (=> b!1331540 (=> (not res!883182) (not e!759046))))

(declare-fun getCurrentListMap!5660 (array!90153 array!90151 (_ BitVec 32) (_ BitVec 32) V!53873 V!53873 (_ BitVec 32) Int) ListLongMap!21347)

(assert (=> b!1331540 (= res!883182 (contains!8865 (getCurrentListMap!5660 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331541 () Bool)

(declare-fun res!883180 () Bool)

(assert (=> b!1331541 (=> (not res!883180) (not e!759046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331541 (= res!883180 (validKeyInArray!0 (select (arr!43538 _keys!1590) from!1980)))))

(declare-fun b!1331542 () Bool)

(declare-fun res!883184 () Bool)

(assert (=> b!1331542 (=> (not res!883184) (not e!759046))))

(declare-datatypes ((List!30851 0))(
  ( (Nil!30848) (Cons!30847 (h!32065 (_ BitVec 64)) (t!44923 List!30851)) )
))
(declare-fun arrayNoDuplicates!0 (array!90153 (_ BitVec 32) List!30851) Bool)

(assert (=> b!1331542 (= res!883184 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30848))))

(declare-fun b!1331543 () Bool)

(assert (=> b!1331543 (= e!759049 tp_is_empty!36577)))

(declare-fun b!1331544 () Bool)

(assert (=> b!1331544 (= e!759045 tp_is_empty!36577)))

(declare-fun b!1331545 () Bool)

(declare-fun res!883181 () Bool)

(assert (=> b!1331545 (=> (not res!883181) (not e!759046))))

(assert (=> b!1331545 (= res!883181 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44089 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112496 res!883185) b!1331537))

(assert (= (and b!1331537 res!883187) b!1331535))

(assert (= (and b!1331535 res!883179) b!1331542))

(assert (= (and b!1331542 res!883184) b!1331545))

(assert (= (and b!1331545 res!883181) b!1331540))

(assert (= (and b!1331540 res!883182) b!1331536))

(assert (= (and b!1331536 res!883183) b!1331541))

(assert (= (and b!1331541 res!883180) b!1331534))

(assert (= (and b!1331534 res!883186) b!1331538))

(assert (= (and b!1331539 condMapEmpty!56539) mapIsEmpty!56539))

(assert (= (and b!1331539 (not condMapEmpty!56539)) mapNonEmpty!56539))

(get-info :version)

(assert (= (and mapNonEmpty!56539 ((_ is ValueCellFull!17390) mapValue!56539)) b!1331543))

(assert (= (and b!1331539 ((_ is ValueCellFull!17390) mapDefault!56539)) b!1331544))

(assert (= start!112496 b!1331539))

(declare-fun b_lambda!23921 () Bool)

(assert (=> (not b_lambda!23921) (not b!1331538)))

(declare-fun t!44921 () Bool)

(declare-fun tb!11875 () Bool)

(assert (=> (and start!112496 (= defaultEntry!1323 defaultEntry!1323) t!44921) tb!11875))

(declare-fun result!24829 () Bool)

(assert (=> tb!11875 (= result!24829 tp_is_empty!36577)))

(assert (=> b!1331538 t!44921))

(declare-fun b_and!49393 () Bool)

(assert (= b_and!49391 (and (=> t!44921 result!24829) b_and!49393)))

(declare-fun m!1220507 () Bool)

(assert (=> b!1331536 m!1220507))

(declare-fun m!1220509 () Bool)

(assert (=> b!1331542 m!1220509))

(declare-fun m!1220511 () Bool)

(assert (=> b!1331535 m!1220511))

(declare-fun m!1220513 () Bool)

(assert (=> b!1331540 m!1220513))

(assert (=> b!1331540 m!1220513))

(declare-fun m!1220515 () Bool)

(assert (=> b!1331540 m!1220515))

(declare-fun m!1220517 () Bool)

(assert (=> start!112496 m!1220517))

(declare-fun m!1220519 () Bool)

(assert (=> start!112496 m!1220519))

(declare-fun m!1220521 () Bool)

(assert (=> start!112496 m!1220521))

(declare-fun m!1220523 () Bool)

(assert (=> mapNonEmpty!56539 m!1220523))

(assert (=> b!1331541 m!1220507))

(assert (=> b!1331541 m!1220507))

(declare-fun m!1220525 () Bool)

(assert (=> b!1331541 m!1220525))

(declare-fun m!1220527 () Bool)

(assert (=> b!1331538 m!1220527))

(declare-fun m!1220529 () Bool)

(assert (=> b!1331538 m!1220529))

(declare-fun m!1220531 () Bool)

(assert (=> b!1331538 m!1220531))

(declare-fun m!1220533 () Bool)

(assert (=> b!1331538 m!1220533))

(declare-fun m!1220535 () Bool)

(assert (=> b!1331538 m!1220535))

(assert (=> b!1331538 m!1220529))

(declare-fun m!1220537 () Bool)

(assert (=> b!1331538 m!1220537))

(assert (=> b!1331538 m!1220531))

(assert (=> b!1331538 m!1220535))

(declare-fun m!1220539 () Bool)

(assert (=> b!1331538 m!1220539))

(assert (=> b!1331538 m!1220507))

(check-sat (not b_lambda!23921) (not b!1331538) b_and!49393 (not b!1331541) (not mapNonEmpty!56539) (not b!1331535) tp_is_empty!36577 (not b!1331540) (not b!1331542) (not b_next!30667) (not start!112496))
(check-sat b_and!49393 (not b_next!30667))
