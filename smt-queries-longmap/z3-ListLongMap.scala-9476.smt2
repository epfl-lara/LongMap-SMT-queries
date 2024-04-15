; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112464 () Bool)

(assert start!112464)

(declare-fun b_free!30859 () Bool)

(declare-fun b_next!30859 () Bool)

(assert (=> start!112464 (= b_free!30859 (not b_next!30859))))

(declare-fun tp!108214 () Bool)

(declare-fun b_and!49701 () Bool)

(assert (=> start!112464 (= tp!108214 b_and!49701)))

(declare-fun b!1333484 () Bool)

(declare-fun res!884951 () Bool)

(declare-fun e!759625 () Bool)

(assert (=> b!1333484 (=> (not res!884951) (not e!759625))))

(declare-datatypes ((V!54129 0))(
  ( (V!54130 (val!18459 Int)) )
))
(declare-datatypes ((ValueCell!17486 0))(
  ( (ValueCellFull!17486 (v!21095 V!54129)) (EmptyCell!17486) )
))
(declare-datatypes ((array!90351 0))(
  ( (array!90352 (arr!43642 (Array (_ BitVec 32) ValueCell!17486)) (size!44194 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90351)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!90353 0))(
  ( (array!90354 (arr!43643 (Array (_ BitVec 32) (_ BitVec 64))) (size!44195 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90353)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333484 (= res!884951 (and (= (size!44194 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44195 _keys!1590) (size!44194 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333485 () Bool)

(declare-fun e!759624 () Bool)

(assert (=> b!1333485 (= e!759624 (not true))))

(declare-datatypes ((tuple2!23858 0))(
  ( (tuple2!23859 (_1!11940 (_ BitVec 64)) (_2!11940 V!54129)) )
))
(declare-datatypes ((List!30997 0))(
  ( (Nil!30994) (Cons!30993 (h!32202 tuple2!23858) (t!45207 List!30997)) )
))
(declare-datatypes ((ListLongMap!21515 0))(
  ( (ListLongMap!21516 (toList!10773 List!30997)) )
))
(declare-fun lt!591968 () ListLongMap!21515)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8865 (ListLongMap!21515 (_ BitVec 64)) Bool)

(assert (=> b!1333485 (contains!8865 lt!591968 k0!1153)))

(declare-datatypes ((Unit!43674 0))(
  ( (Unit!43675) )
))
(declare-fun lt!591969 () Unit!43674)

(declare-fun lt!591970 () V!54129)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!287 ((_ BitVec 64) (_ BitVec 64) V!54129 ListLongMap!21515) Unit!43674)

(assert (=> b!1333485 (= lt!591969 (lemmaInListMapAfterAddingDiffThenInBefore!287 k0!1153 (select (arr!43643 _keys!1590) from!1980) lt!591970 lt!591968))))

(declare-fun b!1333486 () Bool)

(declare-fun res!884958 () Bool)

(assert (=> b!1333486 (=> (not res!884958) (not e!759624))))

(assert (=> b!1333486 (= res!884958 (not (= k0!1153 (select (arr!43643 _keys!1590) from!1980))))))

(declare-fun b!1333487 () Bool)

(declare-fun res!884956 () Bool)

(assert (=> b!1333487 (=> (not res!884956) (not e!759625))))

(assert (=> b!1333487 (= res!884956 (not (= (select (arr!43643 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56827 () Bool)

(declare-fun mapRes!56827 () Bool)

(declare-fun tp!108215 () Bool)

(declare-fun e!759623 () Bool)

(assert (=> mapNonEmpty!56827 (= mapRes!56827 (and tp!108215 e!759623))))

(declare-fun mapRest!56827 () (Array (_ BitVec 32) ValueCell!17486))

(declare-fun mapValue!56827 () ValueCell!17486)

(declare-fun mapKey!56827 () (_ BitVec 32))

(assert (=> mapNonEmpty!56827 (= (arr!43642 _values!1320) (store mapRest!56827 mapKey!56827 mapValue!56827))))

(declare-fun b!1333488 () Bool)

(declare-fun res!884950 () Bool)

(assert (=> b!1333488 (=> (not res!884950) (not e!759625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90353 (_ BitVec 32)) Bool)

(assert (=> b!1333488 (= res!884950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333489 () Bool)

(declare-fun res!884955 () Bool)

(assert (=> b!1333489 (=> (not res!884955) (not e!759625))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54129)

(declare-fun zeroValue!1262 () V!54129)

(declare-fun getCurrentListMap!5630 (array!90353 array!90351 (_ BitVec 32) (_ BitVec 32) V!54129 V!54129 (_ BitVec 32) Int) ListLongMap!21515)

(assert (=> b!1333489 (= res!884955 (contains!8865 (getCurrentListMap!5630 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333490 () Bool)

(declare-fun res!884954 () Bool)

(assert (=> b!1333490 (=> (not res!884954) (not e!759625))))

(assert (=> b!1333490 (= res!884954 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333491 () Bool)

(declare-fun e!759621 () Bool)

(declare-fun e!759620 () Bool)

(assert (=> b!1333491 (= e!759621 (and e!759620 mapRes!56827))))

(declare-fun condMapEmpty!56827 () Bool)

(declare-fun mapDefault!56827 () ValueCell!17486)

(assert (=> b!1333491 (= condMapEmpty!56827 (= (arr!43642 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17486)) mapDefault!56827)))))

(declare-fun b!1333492 () Bool)

(declare-fun tp_is_empty!36769 () Bool)

(assert (=> b!1333492 (= e!759620 tp_is_empty!36769)))

(declare-fun b!1333493 () Bool)

(declare-fun res!884952 () Bool)

(assert (=> b!1333493 (=> (not res!884952) (not e!759625))))

(declare-datatypes ((List!30998 0))(
  ( (Nil!30995) (Cons!30994 (h!32203 (_ BitVec 64)) (t!45208 List!30998)) )
))
(declare-fun arrayNoDuplicates!0 (array!90353 (_ BitVec 32) List!30998) Bool)

(assert (=> b!1333493 (= res!884952 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30995))))

(declare-fun b!1333494 () Bool)

(declare-fun res!884957 () Bool)

(assert (=> b!1333494 (=> (not res!884957) (not e!759625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333494 (= res!884957 (validKeyInArray!0 (select (arr!43643 _keys!1590) from!1980)))))

(declare-fun b!1333495 () Bool)

(declare-fun res!884949 () Bool)

(assert (=> b!1333495 (=> (not res!884949) (not e!759625))))

(assert (=> b!1333495 (= res!884949 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44195 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333496 () Bool)

(assert (=> b!1333496 (= e!759625 e!759624)))

(declare-fun res!884953 () Bool)

(assert (=> b!1333496 (=> (not res!884953) (not e!759624))))

(declare-fun +!4736 (ListLongMap!21515 tuple2!23858) ListLongMap!21515)

(assert (=> b!1333496 (= res!884953 (contains!8865 (+!4736 lt!591968 (tuple2!23859 (select (arr!43643 _keys!1590) from!1980) lt!591970)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6374 (array!90353 array!90351 (_ BitVec 32) (_ BitVec 32) V!54129 V!54129 (_ BitVec 32) Int) ListLongMap!21515)

(assert (=> b!1333496 (= lt!591968 (getCurrentListMapNoExtraKeys!6374 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22019 (ValueCell!17486 V!54129) V!54129)

(declare-fun dynLambda!3666 (Int (_ BitVec 64)) V!54129)

(assert (=> b!1333496 (= lt!591970 (get!22019 (select (arr!43642 _values!1320) from!1980) (dynLambda!3666 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1333497 () Bool)

(assert (=> b!1333497 (= e!759623 tp_is_empty!36769)))

(declare-fun res!884959 () Bool)

(assert (=> start!112464 (=> (not res!884959) (not e!759625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112464 (= res!884959 (validMask!0 mask!1998))))

(assert (=> start!112464 e!759625))

(declare-fun array_inv!33111 (array!90351) Bool)

(assert (=> start!112464 (and (array_inv!33111 _values!1320) e!759621)))

(assert (=> start!112464 true))

(declare-fun array_inv!33112 (array!90353) Bool)

(assert (=> start!112464 (array_inv!33112 _keys!1590)))

(assert (=> start!112464 tp!108214))

(assert (=> start!112464 tp_is_empty!36769))

(declare-fun mapIsEmpty!56827 () Bool)

(assert (=> mapIsEmpty!56827 mapRes!56827))

(assert (= (and start!112464 res!884959) b!1333484))

(assert (= (and b!1333484 res!884951) b!1333488))

(assert (= (and b!1333488 res!884950) b!1333493))

(assert (= (and b!1333493 res!884952) b!1333495))

(assert (= (and b!1333495 res!884949) b!1333489))

(assert (= (and b!1333489 res!884955) b!1333487))

(assert (= (and b!1333487 res!884956) b!1333494))

(assert (= (and b!1333494 res!884957) b!1333490))

(assert (= (and b!1333490 res!884954) b!1333496))

(assert (= (and b!1333496 res!884953) b!1333486))

(assert (= (and b!1333486 res!884958) b!1333485))

(assert (= (and b!1333491 condMapEmpty!56827) mapIsEmpty!56827))

(assert (= (and b!1333491 (not condMapEmpty!56827)) mapNonEmpty!56827))

(get-info :version)

(assert (= (and mapNonEmpty!56827 ((_ is ValueCellFull!17486) mapValue!56827)) b!1333497))

(assert (= (and b!1333491 ((_ is ValueCellFull!17486) mapDefault!56827)) b!1333492))

(assert (= start!112464 b!1333491))

(declare-fun b_lambda!24055 () Bool)

(assert (=> (not b_lambda!24055) (not b!1333496)))

(declare-fun t!45206 () Bool)

(declare-fun tb!12013 () Bool)

(assert (=> (and start!112464 (= defaultEntry!1323 defaultEntry!1323) t!45206) tb!12013))

(declare-fun result!25105 () Bool)

(assert (=> tb!12013 (= result!25105 tp_is_empty!36769)))

(assert (=> b!1333496 t!45206))

(declare-fun b_and!49703 () Bool)

(assert (= b_and!49701 (and (=> t!45206 result!25105) b_and!49703)))

(declare-fun m!1221567 () Bool)

(assert (=> b!1333486 m!1221567))

(assert (=> b!1333487 m!1221567))

(declare-fun m!1221569 () Bool)

(assert (=> b!1333493 m!1221569))

(declare-fun m!1221571 () Bool)

(assert (=> start!112464 m!1221571))

(declare-fun m!1221573 () Bool)

(assert (=> start!112464 m!1221573))

(declare-fun m!1221575 () Bool)

(assert (=> start!112464 m!1221575))

(declare-fun m!1221577 () Bool)

(assert (=> b!1333496 m!1221577))

(declare-fun m!1221579 () Bool)

(assert (=> b!1333496 m!1221579))

(declare-fun m!1221581 () Bool)

(assert (=> b!1333496 m!1221581))

(declare-fun m!1221583 () Bool)

(assert (=> b!1333496 m!1221583))

(assert (=> b!1333496 m!1221581))

(declare-fun m!1221585 () Bool)

(assert (=> b!1333496 m!1221585))

(declare-fun m!1221587 () Bool)

(assert (=> b!1333496 m!1221587))

(assert (=> b!1333496 m!1221583))

(assert (=> b!1333496 m!1221577))

(assert (=> b!1333496 m!1221567))

(declare-fun m!1221589 () Bool)

(assert (=> b!1333488 m!1221589))

(declare-fun m!1221591 () Bool)

(assert (=> mapNonEmpty!56827 m!1221591))

(declare-fun m!1221593 () Bool)

(assert (=> b!1333489 m!1221593))

(assert (=> b!1333489 m!1221593))

(declare-fun m!1221595 () Bool)

(assert (=> b!1333489 m!1221595))

(declare-fun m!1221597 () Bool)

(assert (=> b!1333485 m!1221597))

(assert (=> b!1333485 m!1221567))

(assert (=> b!1333485 m!1221567))

(declare-fun m!1221599 () Bool)

(assert (=> b!1333485 m!1221599))

(assert (=> b!1333494 m!1221567))

(assert (=> b!1333494 m!1221567))

(declare-fun m!1221601 () Bool)

(assert (=> b!1333494 m!1221601))

(check-sat tp_is_empty!36769 (not b!1333496) (not b!1333488) (not mapNonEmpty!56827) (not b!1333494) (not b_next!30859) (not b!1333489) (not start!112464) (not b!1333485) (not b!1333493) (not b_lambda!24055) b_and!49703)
(check-sat b_and!49703 (not b_next!30859))
