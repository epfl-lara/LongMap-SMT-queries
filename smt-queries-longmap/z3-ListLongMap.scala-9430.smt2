; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112190 () Bool)

(assert start!112190)

(declare-fun b_free!30585 () Bool)

(declare-fun b_next!30585 () Bool)

(assert (=> start!112190 (= b_free!30585 (not b_next!30585))))

(declare-fun tp!107392 () Bool)

(declare-fun b_and!49235 () Bool)

(assert (=> start!112190 (= tp!107392 b_and!49235)))

(declare-fun b!1328712 () Bool)

(declare-fun res!881582 () Bool)

(declare-fun e!757591 () Bool)

(assert (=> b!1328712 (=> (not res!881582) (not e!757591))))

(declare-datatypes ((V!53763 0))(
  ( (V!53764 (val!18322 Int)) )
))
(declare-datatypes ((ValueCell!17349 0))(
  ( (ValueCellFull!17349 (v!20959 V!53763)) (EmptyCell!17349) )
))
(declare-datatypes ((array!89882 0))(
  ( (array!89883 (arr!43407 (Array (_ BitVec 32) ValueCell!17349)) (size!43957 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89882)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((array!89884 0))(
  ( (array!89885 (arr!43408 (Array (_ BitVec 32) (_ BitVec 64))) (size!43958 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89884)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328712 (= res!881582 (and (= (size!43957 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43958 _keys!1590) (size!43957 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328713 () Bool)

(declare-fun res!881580 () Bool)

(assert (=> b!1328713 (=> (not res!881580) (not e!757591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89884 (_ BitVec 32)) Bool)

(assert (=> b!1328713 (= res!881580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328714 () Bool)

(declare-fun res!881579 () Bool)

(assert (=> b!1328714 (=> (not res!881579) (not e!757591))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1328714 (= res!881579 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43958 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328715 () Bool)

(assert (=> b!1328715 (= e!757591 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53763)

(declare-fun zeroValue!1262 () V!53763)

(declare-fun lt!590875 () Bool)

(declare-datatypes ((tuple2!23582 0))(
  ( (tuple2!23583 (_1!11802 (_ BitVec 64)) (_2!11802 V!53763)) )
))
(declare-datatypes ((List!30739 0))(
  ( (Nil!30736) (Cons!30735 (h!31944 tuple2!23582) (t!44745 List!30739)) )
))
(declare-datatypes ((ListLongMap!21239 0))(
  ( (ListLongMap!21240 (toList!10635 List!30739)) )
))
(declare-fun contains!8799 (ListLongMap!21239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5626 (array!89884 array!89882 (_ BitVec 32) (_ BitVec 32) V!53763 V!53763 (_ BitVec 32) Int) ListLongMap!21239)

(assert (=> b!1328715 (= lt!590875 (contains!8799 (getCurrentListMap!5626 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56416 () Bool)

(declare-fun mapRes!56416 () Bool)

(assert (=> mapIsEmpty!56416 mapRes!56416))

(declare-fun b!1328717 () Bool)

(declare-fun e!757589 () Bool)

(declare-fun tp_is_empty!36495 () Bool)

(assert (=> b!1328717 (= e!757589 tp_is_empty!36495)))

(declare-fun b!1328718 () Bool)

(declare-fun e!757588 () Bool)

(assert (=> b!1328718 (= e!757588 tp_is_empty!36495)))

(declare-fun res!881583 () Bool)

(assert (=> start!112190 (=> (not res!881583) (not e!757591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112190 (= res!881583 (validMask!0 mask!1998))))

(assert (=> start!112190 e!757591))

(declare-fun e!757587 () Bool)

(declare-fun array_inv!32751 (array!89882) Bool)

(assert (=> start!112190 (and (array_inv!32751 _values!1320) e!757587)))

(assert (=> start!112190 true))

(declare-fun array_inv!32752 (array!89884) Bool)

(assert (=> start!112190 (array_inv!32752 _keys!1590)))

(assert (=> start!112190 tp!107392))

(assert (=> start!112190 tp_is_empty!36495))

(declare-fun b!1328716 () Bool)

(assert (=> b!1328716 (= e!757587 (and e!757589 mapRes!56416))))

(declare-fun condMapEmpty!56416 () Bool)

(declare-fun mapDefault!56416 () ValueCell!17349)

(assert (=> b!1328716 (= condMapEmpty!56416 (= (arr!43407 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17349)) mapDefault!56416)))))

(declare-fun b!1328719 () Bool)

(declare-fun res!881581 () Bool)

(assert (=> b!1328719 (=> (not res!881581) (not e!757591))))

(declare-datatypes ((List!30740 0))(
  ( (Nil!30737) (Cons!30736 (h!31945 (_ BitVec 64)) (t!44746 List!30740)) )
))
(declare-fun arrayNoDuplicates!0 (array!89884 (_ BitVec 32) List!30740) Bool)

(assert (=> b!1328719 (= res!881581 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30737))))

(declare-fun mapNonEmpty!56416 () Bool)

(declare-fun tp!107391 () Bool)

(assert (=> mapNonEmpty!56416 (= mapRes!56416 (and tp!107391 e!757588))))

(declare-fun mapRest!56416 () (Array (_ BitVec 32) ValueCell!17349))

(declare-fun mapKey!56416 () (_ BitVec 32))

(declare-fun mapValue!56416 () ValueCell!17349)

(assert (=> mapNonEmpty!56416 (= (arr!43407 _values!1320) (store mapRest!56416 mapKey!56416 mapValue!56416))))

(assert (= (and start!112190 res!881583) b!1328712))

(assert (= (and b!1328712 res!881582) b!1328713))

(assert (= (and b!1328713 res!881580) b!1328719))

(assert (= (and b!1328719 res!881581) b!1328714))

(assert (= (and b!1328714 res!881579) b!1328715))

(assert (= (and b!1328716 condMapEmpty!56416) mapIsEmpty!56416))

(assert (= (and b!1328716 (not condMapEmpty!56416)) mapNonEmpty!56416))

(get-info :version)

(assert (= (and mapNonEmpty!56416 ((_ is ValueCellFull!17349) mapValue!56416)) b!1328718))

(assert (= (and b!1328716 ((_ is ValueCellFull!17349) mapDefault!56416)) b!1328717))

(assert (= start!112190 b!1328716))

(declare-fun m!1217593 () Bool)

(assert (=> b!1328719 m!1217593))

(declare-fun m!1217595 () Bool)

(assert (=> mapNonEmpty!56416 m!1217595))

(declare-fun m!1217597 () Bool)

(assert (=> b!1328713 m!1217597))

(declare-fun m!1217599 () Bool)

(assert (=> start!112190 m!1217599))

(declare-fun m!1217601 () Bool)

(assert (=> start!112190 m!1217601))

(declare-fun m!1217603 () Bool)

(assert (=> start!112190 m!1217603))

(declare-fun m!1217605 () Bool)

(assert (=> b!1328715 m!1217605))

(assert (=> b!1328715 m!1217605))

(declare-fun m!1217607 () Bool)

(assert (=> b!1328715 m!1217607))

(check-sat (not b!1328719) (not mapNonEmpty!56416) (not b_next!30585) (not b!1328713) (not start!112190) tp_is_empty!36495 b_and!49235 (not b!1328715))
(check-sat b_and!49235 (not b_next!30585))
