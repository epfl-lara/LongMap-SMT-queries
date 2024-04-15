; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112572 () Bool)

(assert start!112572)

(declare-fun b_free!30967 () Bool)

(declare-fun b_next!30967 () Bool)

(assert (=> start!112572 (= b_free!30967 (not b_next!30967))))

(declare-fun tp!108538 () Bool)

(declare-fun b_and!49857 () Bool)

(assert (=> start!112572 (= tp!108538 b_and!49857)))

(declare-fun b!1335275 () Bool)

(declare-fun res!886209 () Bool)

(declare-fun e!760500 () Bool)

(assert (=> b!1335275 (=> (not res!886209) (not e!760500))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90559 0))(
  ( (array!90560 (arr!43746 (Array (_ BitVec 32) (_ BitVec 64))) (size!44298 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90559)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1335275 (= res!886209 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44298 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335276 () Bool)

(declare-fun e!760501 () Bool)

(declare-fun tp_is_empty!36877 () Bool)

(assert (=> b!1335276 (= e!760501 tp_is_empty!36877)))

(declare-fun b!1335277 () Bool)

(declare-fun res!886208 () Bool)

(assert (=> b!1335277 (=> (not res!886208) (not e!760500))))

(declare-datatypes ((V!54273 0))(
  ( (V!54274 (val!18513 Int)) )
))
(declare-datatypes ((ValueCell!17540 0))(
  ( (ValueCellFull!17540 (v!21149 V!54273)) (EmptyCell!17540) )
))
(declare-datatypes ((array!90561 0))(
  ( (array!90562 (arr!43747 (Array (_ BitVec 32) ValueCell!17540)) (size!44299 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90561)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1335277 (= res!886208 (and (= (size!44299 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44298 _keys!1590) (size!44299 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335278 () Bool)

(declare-fun e!760502 () Bool)

(declare-fun e!760504 () Bool)

(declare-fun mapRes!56989 () Bool)

(assert (=> b!1335278 (= e!760502 (and e!760504 mapRes!56989))))

(declare-fun condMapEmpty!56989 () Bool)

(declare-fun mapDefault!56989 () ValueCell!17540)

(assert (=> b!1335278 (= condMapEmpty!56989 (= (arr!43747 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17540)) mapDefault!56989)))))

(declare-fun b!1335279 () Bool)

(assert (=> b!1335279 (= e!760500 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592261 () Bool)

(declare-fun minValue!1262 () V!54273)

(declare-fun zeroValue!1262 () V!54273)

(declare-datatypes ((tuple2!23934 0))(
  ( (tuple2!23935 (_1!11978 (_ BitVec 64)) (_2!11978 V!54273)) )
))
(declare-datatypes ((List!31070 0))(
  ( (Nil!31067) (Cons!31066 (h!32275 tuple2!23934) (t!45326 List!31070)) )
))
(declare-datatypes ((ListLongMap!21591 0))(
  ( (ListLongMap!21592 (toList!10811 List!31070)) )
))
(declare-fun contains!8903 (ListLongMap!21591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5665 (array!90559 array!90561 (_ BitVec 32) (_ BitVec 32) V!54273 V!54273 (_ BitVec 32) Int) ListLongMap!21591)

(assert (=> b!1335279 (= lt!592261 (contains!8903 (getCurrentListMap!5665 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!886206 () Bool)

(assert (=> start!112572 (=> (not res!886206) (not e!760500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112572 (= res!886206 (validMask!0 mask!1998))))

(assert (=> start!112572 e!760500))

(declare-fun array_inv!33187 (array!90561) Bool)

(assert (=> start!112572 (and (array_inv!33187 _values!1320) e!760502)))

(assert (=> start!112572 true))

(declare-fun array_inv!33188 (array!90559) Bool)

(assert (=> start!112572 (array_inv!33188 _keys!1590)))

(assert (=> start!112572 tp!108538))

(assert (=> start!112572 tp_is_empty!36877))

(declare-fun mapNonEmpty!56989 () Bool)

(declare-fun tp!108539 () Bool)

(assert (=> mapNonEmpty!56989 (= mapRes!56989 (and tp!108539 e!760501))))

(declare-fun mapKey!56989 () (_ BitVec 32))

(declare-fun mapRest!56989 () (Array (_ BitVec 32) ValueCell!17540))

(declare-fun mapValue!56989 () ValueCell!17540)

(assert (=> mapNonEmpty!56989 (= (arr!43747 _values!1320) (store mapRest!56989 mapKey!56989 mapValue!56989))))

(declare-fun b!1335280 () Bool)

(declare-fun res!886210 () Bool)

(assert (=> b!1335280 (=> (not res!886210) (not e!760500))))

(declare-datatypes ((List!31071 0))(
  ( (Nil!31068) (Cons!31067 (h!32276 (_ BitVec 64)) (t!45327 List!31071)) )
))
(declare-fun arrayNoDuplicates!0 (array!90559 (_ BitVec 32) List!31071) Bool)

(assert (=> b!1335280 (= res!886210 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31068))))

(declare-fun b!1335281 () Bool)

(assert (=> b!1335281 (= e!760504 tp_is_empty!36877)))

(declare-fun mapIsEmpty!56989 () Bool)

(assert (=> mapIsEmpty!56989 mapRes!56989))

(declare-fun b!1335282 () Bool)

(declare-fun res!886207 () Bool)

(assert (=> b!1335282 (=> (not res!886207) (not e!760500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90559 (_ BitVec 32)) Bool)

(assert (=> b!1335282 (= res!886207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112572 res!886206) b!1335277))

(assert (= (and b!1335277 res!886208) b!1335282))

(assert (= (and b!1335282 res!886207) b!1335280))

(assert (= (and b!1335280 res!886210) b!1335275))

(assert (= (and b!1335275 res!886209) b!1335279))

(assert (= (and b!1335278 condMapEmpty!56989) mapIsEmpty!56989))

(assert (= (and b!1335278 (not condMapEmpty!56989)) mapNonEmpty!56989))

(get-info :version)

(assert (= (and mapNonEmpty!56989 ((_ is ValueCellFull!17540) mapValue!56989)) b!1335276))

(assert (= (and b!1335278 ((_ is ValueCellFull!17540) mapDefault!56989)) b!1335281))

(assert (= start!112572 b!1335278))

(declare-fun m!1222923 () Bool)

(assert (=> b!1335282 m!1222923))

(declare-fun m!1222925 () Bool)

(assert (=> start!112572 m!1222925))

(declare-fun m!1222927 () Bool)

(assert (=> start!112572 m!1222927))

(declare-fun m!1222929 () Bool)

(assert (=> start!112572 m!1222929))

(declare-fun m!1222931 () Bool)

(assert (=> mapNonEmpty!56989 m!1222931))

(declare-fun m!1222933 () Bool)

(assert (=> b!1335280 m!1222933))

(declare-fun m!1222935 () Bool)

(assert (=> b!1335279 m!1222935))

(assert (=> b!1335279 m!1222935))

(declare-fun m!1222937 () Bool)

(assert (=> b!1335279 m!1222937))

(check-sat (not b!1335280) b_and!49857 (not b!1335279) (not start!112572) (not mapNonEmpty!56989) (not b_next!30967) tp_is_empty!36877 (not b!1335282))
(check-sat b_and!49857 (not b_next!30967))
