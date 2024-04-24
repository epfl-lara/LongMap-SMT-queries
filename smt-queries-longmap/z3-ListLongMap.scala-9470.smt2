; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112652 () Bool)

(assert start!112652)

(declare-fun b_free!30823 () Bool)

(declare-fun b_next!30823 () Bool)

(assert (=> start!112652 (= b_free!30823 (not b_next!30823))))

(declare-fun tp!108106 () Bool)

(declare-fun b_and!49667 () Bool)

(assert (=> start!112652 (= tp!108106 b_and!49667)))

(declare-fun res!885061 () Bool)

(declare-fun e!760218 () Bool)

(assert (=> start!112652 (=> (not res!885061) (not e!760218))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112652 (= res!885061 (validMask!0 mask!1998))))

(assert (=> start!112652 e!760218))

(declare-datatypes ((V!54081 0))(
  ( (V!54082 (val!18441 Int)) )
))
(declare-datatypes ((ValueCell!17468 0))(
  ( (ValueCellFull!17468 (v!21073 V!54081)) (EmptyCell!17468) )
))
(declare-datatypes ((array!90443 0))(
  ( (array!90444 (arr!43683 (Array (_ BitVec 32) ValueCell!17468)) (size!44234 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90443)

(declare-fun e!760219 () Bool)

(declare-fun array_inv!33223 (array!90443) Bool)

(assert (=> start!112652 (and (array_inv!33223 _values!1320) e!760219)))

(assert (=> start!112652 true))

(declare-datatypes ((array!90445 0))(
  ( (array!90446 (arr!43684 (Array (_ BitVec 32) (_ BitVec 64))) (size!44235 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90445)

(declare-fun array_inv!33224 (array!90445) Bool)

(assert (=> start!112652 (array_inv!33224 _keys!1590)))

(assert (=> start!112652 tp!108106))

(declare-fun tp_is_empty!36733 () Bool)

(assert (=> start!112652 tp_is_empty!36733))

(declare-fun b!1334238 () Bool)

(declare-fun e!760216 () Bool)

(assert (=> b!1334238 (= e!760216 tp_is_empty!36733)))

(declare-fun b!1334239 () Bool)

(declare-fun res!885064 () Bool)

(assert (=> b!1334239 (=> (not res!885064) (not e!760218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90445 (_ BitVec 32)) Bool)

(assert (=> b!1334239 (= res!885064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334240 () Bool)

(declare-fun res!885063 () Bool)

(assert (=> b!1334240 (=> (not res!885063) (not e!760218))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334240 (= res!885063 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44235 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334241 () Bool)

(declare-fun res!885062 () Bool)

(assert (=> b!1334241 (=> (not res!885062) (not e!760218))))

(assert (=> b!1334241 (= res!885062 (and (= (size!44234 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44235 _keys!1590) (size!44234 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334242 () Bool)

(declare-fun e!760217 () Bool)

(assert (=> b!1334242 (= e!760217 tp_is_empty!36733)))

(declare-fun b!1334243 () Bool)

(declare-fun res!885065 () Bool)

(assert (=> b!1334243 (=> (not res!885065) (not e!760218))))

(declare-datatypes ((List!30954 0))(
  ( (Nil!30951) (Cons!30950 (h!32168 (_ BitVec 64)) (t!45144 List!30954)) )
))
(declare-fun arrayNoDuplicates!0 (array!90445 (_ BitVec 32) List!30954) Bool)

(assert (=> b!1334243 (= res!885065 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30951))))

(declare-fun mapNonEmpty!56773 () Bool)

(declare-fun mapRes!56773 () Bool)

(declare-fun tp!108105 () Bool)

(assert (=> mapNonEmpty!56773 (= mapRes!56773 (and tp!108105 e!760216))))

(declare-fun mapValue!56773 () ValueCell!17468)

(declare-fun mapRest!56773 () (Array (_ BitVec 32) ValueCell!17468))

(declare-fun mapKey!56773 () (_ BitVec 32))

(assert (=> mapNonEmpty!56773 (= (arr!43683 _values!1320) (store mapRest!56773 mapKey!56773 mapValue!56773))))

(declare-fun b!1334244 () Bool)

(assert (=> b!1334244 (= e!760218 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54081)

(declare-fun zeroValue!1262 () V!54081)

(declare-fun lt!592563 () Bool)

(declare-datatypes ((tuple2!23796 0))(
  ( (tuple2!23797 (_1!11909 (_ BitVec 64)) (_2!11909 V!54081)) )
))
(declare-datatypes ((List!30955 0))(
  ( (Nil!30952) (Cons!30951 (h!32169 tuple2!23796) (t!45145 List!30955)) )
))
(declare-datatypes ((ListLongMap!21461 0))(
  ( (ListLongMap!21462 (toList!10746 List!30955)) )
))
(declare-fun contains!8922 (ListLongMap!21461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5710 (array!90445 array!90443 (_ BitVec 32) (_ BitVec 32) V!54081 V!54081 (_ BitVec 32) Int) ListLongMap!21461)

(assert (=> b!1334244 (= lt!592563 (contains!8922 (getCurrentListMap!5710 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56773 () Bool)

(assert (=> mapIsEmpty!56773 mapRes!56773))

(declare-fun b!1334245 () Bool)

(assert (=> b!1334245 (= e!760219 (and e!760217 mapRes!56773))))

(declare-fun condMapEmpty!56773 () Bool)

(declare-fun mapDefault!56773 () ValueCell!17468)

(assert (=> b!1334245 (= condMapEmpty!56773 (= (arr!43683 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17468)) mapDefault!56773)))))

(assert (= (and start!112652 res!885061) b!1334241))

(assert (= (and b!1334241 res!885062) b!1334239))

(assert (= (and b!1334239 res!885064) b!1334243))

(assert (= (and b!1334243 res!885065) b!1334240))

(assert (= (and b!1334240 res!885063) b!1334244))

(assert (= (and b!1334245 condMapEmpty!56773) mapIsEmpty!56773))

(assert (= (and b!1334245 (not condMapEmpty!56773)) mapNonEmpty!56773))

(get-info :version)

(assert (= (and mapNonEmpty!56773 ((_ is ValueCellFull!17468) mapValue!56773)) b!1334238))

(assert (= (and b!1334245 ((_ is ValueCellFull!17468) mapDefault!56773)) b!1334242))

(assert (= start!112652 b!1334245))

(declare-fun m!1223225 () Bool)

(assert (=> mapNonEmpty!56773 m!1223225))

(declare-fun m!1223227 () Bool)

(assert (=> b!1334243 m!1223227))

(declare-fun m!1223229 () Bool)

(assert (=> b!1334244 m!1223229))

(assert (=> b!1334244 m!1223229))

(declare-fun m!1223231 () Bool)

(assert (=> b!1334244 m!1223231))

(declare-fun m!1223233 () Bool)

(assert (=> b!1334239 m!1223233))

(declare-fun m!1223235 () Bool)

(assert (=> start!112652 m!1223235))

(declare-fun m!1223237 () Bool)

(assert (=> start!112652 m!1223237))

(declare-fun m!1223239 () Bool)

(assert (=> start!112652 m!1223239))

(check-sat (not mapNonEmpty!56773) b_and!49667 tp_is_empty!36733 (not b!1334243) (not b!1334239) (not start!112652) (not b!1334244) (not b_next!30823))
(check-sat b_and!49667 (not b_next!30823))
