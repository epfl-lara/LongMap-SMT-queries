; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112578 () Bool)

(assert start!112578)

(declare-fun b_free!30973 () Bool)

(declare-fun b_next!30973 () Bool)

(assert (=> start!112578 (= b_free!30973 (not b_next!30973))))

(declare-fun tp!108557 () Bool)

(declare-fun b_and!49863 () Bool)

(assert (=> start!112578 (= tp!108557 b_and!49863)))

(declare-fun mapIsEmpty!56998 () Bool)

(declare-fun mapRes!56998 () Bool)

(assert (=> mapIsEmpty!56998 mapRes!56998))

(declare-fun b!1335355 () Bool)

(declare-fun res!886263 () Bool)

(declare-fun e!760549 () Bool)

(assert (=> b!1335355 (=> (not res!886263) (not e!760549))))

(declare-datatypes ((array!90571 0))(
  ( (array!90572 (arr!43752 (Array (_ BitVec 32) (_ BitVec 64))) (size!44304 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90571)

(declare-datatypes ((List!31076 0))(
  ( (Nil!31073) (Cons!31072 (h!32281 (_ BitVec 64)) (t!45332 List!31076)) )
))
(declare-fun arrayNoDuplicates!0 (array!90571 (_ BitVec 32) List!31076) Bool)

(assert (=> b!1335355 (= res!886263 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31073))))

(declare-fun b!1335356 () Bool)

(declare-fun res!886265 () Bool)

(assert (=> b!1335356 (=> (not res!886265) (not e!760549))))

(declare-datatypes ((V!54281 0))(
  ( (V!54282 (val!18516 Int)) )
))
(declare-datatypes ((ValueCell!17543 0))(
  ( (ValueCellFull!17543 (v!21152 V!54281)) (EmptyCell!17543) )
))
(declare-datatypes ((array!90573 0))(
  ( (array!90574 (arr!43753 (Array (_ BitVec 32) ValueCell!17543)) (size!44305 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90573)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335356 (= res!886265 (and (= (size!44305 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44304 _keys!1590) (size!44305 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335357 () Bool)

(assert (=> b!1335357 (= e!760549 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23940 0))(
  ( (tuple2!23941 (_1!11981 (_ BitVec 64)) (_2!11981 V!54281)) )
))
(declare-datatypes ((List!31077 0))(
  ( (Nil!31074) (Cons!31073 (h!32282 tuple2!23940) (t!45333 List!31077)) )
))
(declare-datatypes ((ListLongMap!21597 0))(
  ( (ListLongMap!21598 (toList!10814 List!31077)) )
))
(declare-fun lt!592270 () ListLongMap!21597)

(declare-fun minValue!1262 () V!54281)

(declare-fun zeroValue!1262 () V!54281)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6391 (array!90571 array!90573 (_ BitVec 32) (_ BitVec 32) V!54281 V!54281 (_ BitVec 32) Int) ListLongMap!21597)

(assert (=> b!1335357 (= lt!592270 (getCurrentListMapNoExtraKeys!6391 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1335358 () Bool)

(declare-fun res!886259 () Bool)

(assert (=> b!1335358 (=> (not res!886259) (not e!760549))))

(assert (=> b!1335358 (= res!886259 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56998 () Bool)

(declare-fun tp!108556 () Bool)

(declare-fun e!760545 () Bool)

(assert (=> mapNonEmpty!56998 (= mapRes!56998 (and tp!108556 e!760545))))

(declare-fun mapValue!56998 () ValueCell!17543)

(declare-fun mapKey!56998 () (_ BitVec 32))

(declare-fun mapRest!56998 () (Array (_ BitVec 32) ValueCell!17543))

(assert (=> mapNonEmpty!56998 (= (arr!43753 _values!1320) (store mapRest!56998 mapKey!56998 mapValue!56998))))

(declare-fun b!1335359 () Bool)

(declare-fun res!886262 () Bool)

(assert (=> b!1335359 (=> (not res!886262) (not e!760549))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335359 (= res!886262 (not (= (select (arr!43752 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335360 () Bool)

(declare-fun res!886260 () Bool)

(assert (=> b!1335360 (=> (not res!886260) (not e!760549))))

(declare-fun contains!8906 (ListLongMap!21597 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5668 (array!90571 array!90573 (_ BitVec 32) (_ BitVec 32) V!54281 V!54281 (_ BitVec 32) Int) ListLongMap!21597)

(assert (=> b!1335360 (= res!886260 (contains!8906 (getCurrentListMap!5668 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335361 () Bool)

(declare-fun res!886261 () Bool)

(assert (=> b!1335361 (=> (not res!886261) (not e!760549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335361 (= res!886261 (validKeyInArray!0 (select (arr!43752 _keys!1590) from!1980)))))

(declare-fun b!1335363 () Bool)

(declare-fun res!886266 () Bool)

(assert (=> b!1335363 (=> (not res!886266) (not e!760549))))

(assert (=> b!1335363 (= res!886266 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44304 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335364 () Bool)

(declare-fun tp_is_empty!36883 () Bool)

(assert (=> b!1335364 (= e!760545 tp_is_empty!36883)))

(declare-fun b!1335365 () Bool)

(declare-fun e!760546 () Bool)

(assert (=> b!1335365 (= e!760546 tp_is_empty!36883)))

(declare-fun b!1335366 () Bool)

(declare-fun e!760548 () Bool)

(assert (=> b!1335366 (= e!760548 (and e!760546 mapRes!56998))))

(declare-fun condMapEmpty!56998 () Bool)

(declare-fun mapDefault!56998 () ValueCell!17543)

(assert (=> b!1335366 (= condMapEmpty!56998 (= (arr!43753 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17543)) mapDefault!56998)))))

(declare-fun b!1335362 () Bool)

(declare-fun res!886267 () Bool)

(assert (=> b!1335362 (=> (not res!886267) (not e!760549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90571 (_ BitVec 32)) Bool)

(assert (=> b!1335362 (= res!886267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!886264 () Bool)

(assert (=> start!112578 (=> (not res!886264) (not e!760549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112578 (= res!886264 (validMask!0 mask!1998))))

(assert (=> start!112578 e!760549))

(declare-fun array_inv!33191 (array!90573) Bool)

(assert (=> start!112578 (and (array_inv!33191 _values!1320) e!760548)))

(assert (=> start!112578 true))

(declare-fun array_inv!33192 (array!90571) Bool)

(assert (=> start!112578 (array_inv!33192 _keys!1590)))

(assert (=> start!112578 tp!108557))

(assert (=> start!112578 tp_is_empty!36883))

(assert (= (and start!112578 res!886264) b!1335356))

(assert (= (and b!1335356 res!886265) b!1335362))

(assert (= (and b!1335362 res!886267) b!1335355))

(assert (= (and b!1335355 res!886263) b!1335363))

(assert (= (and b!1335363 res!886266) b!1335360))

(assert (= (and b!1335360 res!886260) b!1335359))

(assert (= (and b!1335359 res!886262) b!1335361))

(assert (= (and b!1335361 res!886261) b!1335358))

(assert (= (and b!1335358 res!886259) b!1335357))

(assert (= (and b!1335366 condMapEmpty!56998) mapIsEmpty!56998))

(assert (= (and b!1335366 (not condMapEmpty!56998)) mapNonEmpty!56998))

(get-info :version)

(assert (= (and mapNonEmpty!56998 ((_ is ValueCellFull!17543) mapValue!56998)) b!1335364))

(assert (= (and b!1335366 ((_ is ValueCellFull!17543) mapDefault!56998)) b!1335365))

(assert (= start!112578 b!1335366))

(declare-fun m!1222971 () Bool)

(assert (=> b!1335361 m!1222971))

(assert (=> b!1335361 m!1222971))

(declare-fun m!1222973 () Bool)

(assert (=> b!1335361 m!1222973))

(declare-fun m!1222975 () Bool)

(assert (=> b!1335355 m!1222975))

(declare-fun m!1222977 () Bool)

(assert (=> b!1335357 m!1222977))

(assert (=> b!1335359 m!1222971))

(declare-fun m!1222979 () Bool)

(assert (=> b!1335362 m!1222979))

(declare-fun m!1222981 () Bool)

(assert (=> mapNonEmpty!56998 m!1222981))

(declare-fun m!1222983 () Bool)

(assert (=> b!1335360 m!1222983))

(assert (=> b!1335360 m!1222983))

(declare-fun m!1222985 () Bool)

(assert (=> b!1335360 m!1222985))

(declare-fun m!1222987 () Bool)

(assert (=> start!112578 m!1222987))

(declare-fun m!1222989 () Bool)

(assert (=> start!112578 m!1222989))

(declare-fun m!1222991 () Bool)

(assert (=> start!112578 m!1222991))

(check-sat (not b!1335360) tp_is_empty!36883 (not b!1335355) (not b!1335362) (not b_next!30973) (not b!1335357) (not mapNonEmpty!56998) (not start!112578) b_and!49863 (not b!1335361))
(check-sat b_and!49863 (not b_next!30973))
