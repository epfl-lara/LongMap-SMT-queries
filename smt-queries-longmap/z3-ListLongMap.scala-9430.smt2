; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112412 () Bool)

(assert start!112412)

(declare-fun b_free!30583 () Bool)

(declare-fun b_next!30583 () Bool)

(assert (=> start!112412 (= b_free!30583 (not b_next!30583))))

(declare-fun tp!107385 () Bool)

(declare-fun b_and!49235 () Bool)

(assert (=> start!112412 (= tp!107385 b_and!49235)))

(declare-fun b!1329987 () Bool)

(declare-fun e!758415 () Bool)

(declare-fun tp_is_empty!36493 () Bool)

(assert (=> b!1329987 (= e!758415 tp_is_empty!36493)))

(declare-fun b!1329988 () Bool)

(declare-fun res!882086 () Bool)

(declare-fun e!758419 () Bool)

(assert (=> b!1329988 (=> (not res!882086) (not e!758419))))

(declare-datatypes ((array!89987 0))(
  ( (array!89988 (arr!43455 (Array (_ BitVec 32) (_ BitVec 64))) (size!44006 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89987)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89987 (_ BitVec 32)) Bool)

(assert (=> b!1329988 (= res!882086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329989 () Bool)

(declare-fun res!882085 () Bool)

(assert (=> b!1329989 (=> (not res!882085) (not e!758419))))

(declare-datatypes ((List!30785 0))(
  ( (Nil!30782) (Cons!30781 (h!31999 (_ BitVec 64)) (t!44783 List!30785)) )
))
(declare-fun arrayNoDuplicates!0 (array!89987 (_ BitVec 32) List!30785) Bool)

(assert (=> b!1329989 (= res!882085 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30782))))

(declare-fun b!1329990 () Bool)

(declare-fun e!758417 () Bool)

(assert (=> b!1329990 (= e!758417 tp_is_empty!36493)))

(declare-fun b!1329991 () Bool)

(declare-fun res!882083 () Bool)

(assert (=> b!1329991 (=> (not res!882083) (not e!758419))))

(declare-datatypes ((V!53761 0))(
  ( (V!53762 (val!18321 Int)) )
))
(declare-datatypes ((ValueCell!17348 0))(
  ( (ValueCellFull!17348 (v!20953 V!53761)) (EmptyCell!17348) )
))
(declare-datatypes ((array!89989 0))(
  ( (array!89990 (arr!43456 (Array (_ BitVec 32) ValueCell!17348)) (size!44007 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89989)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329991 (= res!882083 (and (= (size!44007 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44006 _keys!1590) (size!44007 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56413 () Bool)

(declare-fun mapRes!56413 () Bool)

(declare-fun tp!107386 () Bool)

(assert (=> mapNonEmpty!56413 (= mapRes!56413 (and tp!107386 e!758415))))

(declare-fun mapValue!56413 () ValueCell!17348)

(declare-fun mapKey!56413 () (_ BitVec 32))

(declare-fun mapRest!56413 () (Array (_ BitVec 32) ValueCell!17348))

(assert (=> mapNonEmpty!56413 (= (arr!43456 _values!1320) (store mapRest!56413 mapKey!56413 mapValue!56413))))

(declare-fun mapIsEmpty!56413 () Bool)

(assert (=> mapIsEmpty!56413 mapRes!56413))

(declare-fun res!882084 () Bool)

(assert (=> start!112412 (=> (not res!882084) (not e!758419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112412 (= res!882084 (validMask!0 mask!1998))))

(assert (=> start!112412 e!758419))

(declare-fun e!758418 () Bool)

(declare-fun array_inv!33067 (array!89989) Bool)

(assert (=> start!112412 (and (array_inv!33067 _values!1320) e!758418)))

(assert (=> start!112412 true))

(declare-fun array_inv!33068 (array!89987) Bool)

(assert (=> start!112412 (array_inv!33068 _keys!1590)))

(assert (=> start!112412 tp!107385))

(assert (=> start!112412 tp_is_empty!36493))

(declare-fun b!1329992 () Bool)

(assert (=> b!1329992 (= e!758419 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53761)

(declare-fun zeroValue!1262 () V!53761)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591348 () Bool)

(declare-datatypes ((tuple2!23608 0))(
  ( (tuple2!23609 (_1!11815 (_ BitVec 64)) (_2!11815 V!53761)) )
))
(declare-datatypes ((List!30786 0))(
  ( (Nil!30783) (Cons!30782 (h!32000 tuple2!23608) (t!44784 List!30786)) )
))
(declare-datatypes ((ListLongMap!21273 0))(
  ( (ListLongMap!21274 (toList!10652 List!30786)) )
))
(declare-fun contains!8828 (ListLongMap!21273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5629 (array!89987 array!89989 (_ BitVec 32) (_ BitVec 32) V!53761 V!53761 (_ BitVec 32) Int) ListLongMap!21273)

(assert (=> b!1329992 (= lt!591348 (contains!8828 (getCurrentListMap!5629 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329993 () Bool)

(assert (=> b!1329993 (= e!758418 (and e!758417 mapRes!56413))))

(declare-fun condMapEmpty!56413 () Bool)

(declare-fun mapDefault!56413 () ValueCell!17348)

(assert (=> b!1329993 (= condMapEmpty!56413 (= (arr!43456 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17348)) mapDefault!56413)))))

(declare-fun b!1329994 () Bool)

(declare-fun res!882082 () Bool)

(assert (=> b!1329994 (=> (not res!882082) (not e!758419))))

(assert (=> b!1329994 (= res!882082 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44006 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112412 res!882084) b!1329991))

(assert (= (and b!1329991 res!882083) b!1329988))

(assert (= (and b!1329988 res!882086) b!1329989))

(assert (= (and b!1329989 res!882085) b!1329994))

(assert (= (and b!1329994 res!882082) b!1329992))

(assert (= (and b!1329993 condMapEmpty!56413) mapIsEmpty!56413))

(assert (= (and b!1329993 (not condMapEmpty!56413)) mapNonEmpty!56413))

(get-info :version)

(assert (= (and mapNonEmpty!56413 ((_ is ValueCellFull!17348) mapValue!56413)) b!1329987))

(assert (= (and b!1329993 ((_ is ValueCellFull!17348) mapDefault!56413)) b!1329990))

(assert (= start!112412 b!1329993))

(declare-fun m!1219175 () Bool)

(assert (=> b!1329989 m!1219175))

(declare-fun m!1219177 () Bool)

(assert (=> b!1329988 m!1219177))

(declare-fun m!1219179 () Bool)

(assert (=> mapNonEmpty!56413 m!1219179))

(declare-fun m!1219181 () Bool)

(assert (=> start!112412 m!1219181))

(declare-fun m!1219183 () Bool)

(assert (=> start!112412 m!1219183))

(declare-fun m!1219185 () Bool)

(assert (=> start!112412 m!1219185))

(declare-fun m!1219187 () Bool)

(assert (=> b!1329992 m!1219187))

(assert (=> b!1329992 m!1219187))

(declare-fun m!1219189 () Bool)

(assert (=> b!1329992 m!1219189))

(check-sat (not b!1329989) (not b!1329992) tp_is_empty!36493 (not start!112412) (not b!1329988) (not mapNonEmpty!56413) (not b_next!30583) b_and!49235)
(check-sat b_and!49235 (not b_next!30583))
