; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112556 () Bool)

(assert start!112556)

(declare-fun b_free!30951 () Bool)

(declare-fun b_next!30951 () Bool)

(assert (=> start!112556 (= b_free!30951 (not b_next!30951))))

(declare-fun tp!108489 () Bool)

(declare-fun b_and!49859 () Bool)

(assert (=> start!112556 (= tp!108489 b_and!49859)))

(declare-fun b!1335126 () Bool)

(declare-fun res!886091 () Bool)

(declare-fun e!760414 () Bool)

(assert (=> b!1335126 (=> (not res!886091) (not e!760414))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90582 0))(
  ( (array!90583 (arr!43757 (Array (_ BitVec 32) (_ BitVec 64))) (size!44307 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90582)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335126 (= res!886091 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44307 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56965 () Bool)

(declare-fun mapRes!56965 () Bool)

(assert (=> mapIsEmpty!56965 mapRes!56965))

(declare-fun res!886089 () Bool)

(assert (=> start!112556 (=> (not res!886089) (not e!760414))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112556 (= res!886089 (validMask!0 mask!1998))))

(assert (=> start!112556 e!760414))

(declare-datatypes ((V!54251 0))(
  ( (V!54252 (val!18505 Int)) )
))
(declare-datatypes ((ValueCell!17532 0))(
  ( (ValueCellFull!17532 (v!21142 V!54251)) (EmptyCell!17532) )
))
(declare-datatypes ((array!90584 0))(
  ( (array!90585 (arr!43758 (Array (_ BitVec 32) ValueCell!17532)) (size!44308 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90584)

(declare-fun e!760415 () Bool)

(declare-fun array_inv!33001 (array!90584) Bool)

(assert (=> start!112556 (and (array_inv!33001 _values!1320) e!760415)))

(assert (=> start!112556 true))

(declare-fun array_inv!33002 (array!90582) Bool)

(assert (=> start!112556 (array_inv!33002 _keys!1590)))

(assert (=> start!112556 tp!108489))

(declare-fun tp_is_empty!36861 () Bool)

(assert (=> start!112556 tp_is_empty!36861))

(declare-fun b!1335127 () Bool)

(declare-fun e!760416 () Bool)

(assert (=> b!1335127 (= e!760416 tp_is_empty!36861)))

(declare-fun b!1335128 () Bool)

(declare-fun res!886090 () Bool)

(assert (=> b!1335128 (=> (not res!886090) (not e!760414))))

(declare-datatypes ((List!31000 0))(
  ( (Nil!30997) (Cons!30996 (h!32205 (_ BitVec 64)) (t!45264 List!31000)) )
))
(declare-fun arrayNoDuplicates!0 (array!90582 (_ BitVec 32) List!31000) Bool)

(assert (=> b!1335128 (= res!886090 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30997))))

(declare-fun b!1335129 () Bool)

(declare-fun res!886088 () Bool)

(assert (=> b!1335129 (=> (not res!886088) (not e!760414))))

(assert (=> b!1335129 (= res!886088 (and (= (size!44308 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44307 _keys!1590) (size!44308 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56965 () Bool)

(declare-fun tp!108490 () Bool)

(assert (=> mapNonEmpty!56965 (= mapRes!56965 (and tp!108490 e!760416))))

(declare-fun mapKey!56965 () (_ BitVec 32))

(declare-fun mapValue!56965 () ValueCell!17532)

(declare-fun mapRest!56965 () (Array (_ BitVec 32) ValueCell!17532))

(assert (=> mapNonEmpty!56965 (= (arr!43758 _values!1320) (store mapRest!56965 mapKey!56965 mapValue!56965))))

(declare-fun b!1335130 () Bool)

(declare-fun res!886092 () Bool)

(assert (=> b!1335130 (=> (not res!886092) (not e!760414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90582 (_ BitVec 32)) Bool)

(assert (=> b!1335130 (= res!886092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335131 () Bool)

(assert (=> b!1335131 (= e!760414 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592432 () Bool)

(declare-fun minValue!1262 () V!54251)

(declare-fun zeroValue!1262 () V!54251)

(declare-datatypes ((tuple2!23860 0))(
  ( (tuple2!23861 (_1!11941 (_ BitVec 64)) (_2!11941 V!54251)) )
))
(declare-datatypes ((List!31001 0))(
  ( (Nil!30998) (Cons!30997 (h!32206 tuple2!23860) (t!45265 List!31001)) )
))
(declare-datatypes ((ListLongMap!21517 0))(
  ( (ListLongMap!21518 (toList!10774 List!31001)) )
))
(declare-fun contains!8938 (ListLongMap!21517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5748 (array!90582 array!90584 (_ BitVec 32) (_ BitVec 32) V!54251 V!54251 (_ BitVec 32) Int) ListLongMap!21517)

(assert (=> b!1335131 (= lt!592432 (contains!8938 (getCurrentListMap!5748 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335132 () Bool)

(declare-fun e!760413 () Bool)

(assert (=> b!1335132 (= e!760415 (and e!760413 mapRes!56965))))

(declare-fun condMapEmpty!56965 () Bool)

(declare-fun mapDefault!56965 () ValueCell!17532)

(assert (=> b!1335132 (= condMapEmpty!56965 (= (arr!43758 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17532)) mapDefault!56965)))))

(declare-fun b!1335133 () Bool)

(assert (=> b!1335133 (= e!760413 tp_is_empty!36861)))

(assert (= (and start!112556 res!886089) b!1335129))

(assert (= (and b!1335129 res!886088) b!1335130))

(assert (= (and b!1335130 res!886092) b!1335128))

(assert (= (and b!1335128 res!886090) b!1335126))

(assert (= (and b!1335126 res!886091) b!1335131))

(assert (= (and b!1335132 condMapEmpty!56965) mapIsEmpty!56965))

(assert (= (and b!1335132 (not condMapEmpty!56965)) mapNonEmpty!56965))

(get-info :version)

(assert (= (and mapNonEmpty!56965 ((_ is ValueCellFull!17532) mapValue!56965)) b!1335127))

(assert (= (and b!1335132 ((_ is ValueCellFull!17532) mapDefault!56965)) b!1335133))

(assert (= start!112556 b!1335132))

(declare-fun m!1223299 () Bool)

(assert (=> mapNonEmpty!56965 m!1223299))

(declare-fun m!1223301 () Bool)

(assert (=> b!1335128 m!1223301))

(declare-fun m!1223303 () Bool)

(assert (=> start!112556 m!1223303))

(declare-fun m!1223305 () Bool)

(assert (=> start!112556 m!1223305))

(declare-fun m!1223307 () Bool)

(assert (=> start!112556 m!1223307))

(declare-fun m!1223309 () Bool)

(assert (=> b!1335130 m!1223309))

(declare-fun m!1223311 () Bool)

(assert (=> b!1335131 m!1223311))

(assert (=> b!1335131 m!1223311))

(declare-fun m!1223313 () Bool)

(assert (=> b!1335131 m!1223313))

(check-sat (not b!1335130) b_and!49859 (not b!1335131) (not mapNonEmpty!56965) (not start!112556) (not b_next!30951) tp_is_empty!36861 (not b!1335128))
(check-sat b_and!49859 (not b_next!30951))
