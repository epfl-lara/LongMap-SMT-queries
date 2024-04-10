; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112550 () Bool)

(assert start!112550)

(declare-fun b_free!30945 () Bool)

(declare-fun b_next!30945 () Bool)

(assert (=> start!112550 (= b_free!30945 (not b_next!30945))))

(declare-fun tp!108472 () Bool)

(declare-fun b_and!49853 () Bool)

(assert (=> start!112550 (= tp!108472 b_and!49853)))

(declare-fun b!1335054 () Bool)

(declare-fun e!760368 () Bool)

(declare-fun tp_is_empty!36855 () Bool)

(assert (=> b!1335054 (= e!760368 tp_is_empty!36855)))

(declare-fun b!1335055 () Bool)

(declare-fun e!760370 () Bool)

(assert (=> b!1335055 (= e!760370 tp_is_empty!36855)))

(declare-fun b!1335056 () Bool)

(declare-fun res!886047 () Bool)

(declare-fun e!760372 () Bool)

(assert (=> b!1335056 (=> (not res!886047) (not e!760372))))

(declare-datatypes ((V!54243 0))(
  ( (V!54244 (val!18502 Int)) )
))
(declare-datatypes ((ValueCell!17529 0))(
  ( (ValueCellFull!17529 (v!21139 V!54243)) (EmptyCell!17529) )
))
(declare-datatypes ((array!90570 0))(
  ( (array!90571 (arr!43751 (Array (_ BitVec 32) ValueCell!17529)) (size!44301 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90570)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90572 0))(
  ( (array!90573 (arr!43752 (Array (_ BitVec 32) (_ BitVec 64))) (size!44302 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90572)

(assert (=> b!1335056 (= res!886047 (and (= (size!44301 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44302 _keys!1590) (size!44301 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335057 () Bool)

(declare-fun e!760371 () Bool)

(declare-fun mapRes!56956 () Bool)

(assert (=> b!1335057 (= e!760371 (and e!760368 mapRes!56956))))

(declare-fun condMapEmpty!56956 () Bool)

(declare-fun mapDefault!56956 () ValueCell!17529)

(assert (=> b!1335057 (= condMapEmpty!56956 (= (arr!43751 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17529)) mapDefault!56956)))))

(declare-fun mapIsEmpty!56956 () Bool)

(assert (=> mapIsEmpty!56956 mapRes!56956))

(declare-fun b!1335058 () Bool)

(declare-fun res!886046 () Bool)

(assert (=> b!1335058 (=> (not res!886046) (not e!760372))))

(declare-datatypes ((List!30995 0))(
  ( (Nil!30992) (Cons!30991 (h!32200 (_ BitVec 64)) (t!45259 List!30995)) )
))
(declare-fun arrayNoDuplicates!0 (array!90572 (_ BitVec 32) List!30995) Bool)

(assert (=> b!1335058 (= res!886046 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30992))))

(declare-fun b!1335059 () Bool)

(assert (=> b!1335059 (= e!760372 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592423 () Bool)

(declare-fun minValue!1262 () V!54243)

(declare-fun zeroValue!1262 () V!54243)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23856 0))(
  ( (tuple2!23857 (_1!11939 (_ BitVec 64)) (_2!11939 V!54243)) )
))
(declare-datatypes ((List!30996 0))(
  ( (Nil!30993) (Cons!30992 (h!32201 tuple2!23856) (t!45260 List!30996)) )
))
(declare-datatypes ((ListLongMap!21513 0))(
  ( (ListLongMap!21514 (toList!10772 List!30996)) )
))
(declare-fun contains!8936 (ListLongMap!21513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5746 (array!90572 array!90570 (_ BitVec 32) (_ BitVec 32) V!54243 V!54243 (_ BitVec 32) Int) ListLongMap!21513)

(assert (=> b!1335059 (= lt!592423 (contains!8936 (getCurrentListMap!5746 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335060 () Bool)

(declare-fun res!886043 () Bool)

(assert (=> b!1335060 (=> (not res!886043) (not e!760372))))

(assert (=> b!1335060 (= res!886043 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44302 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335061 () Bool)

(declare-fun res!886044 () Bool)

(assert (=> b!1335061 (=> (not res!886044) (not e!760372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90572 (_ BitVec 32)) Bool)

(assert (=> b!1335061 (= res!886044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56956 () Bool)

(declare-fun tp!108471 () Bool)

(assert (=> mapNonEmpty!56956 (= mapRes!56956 (and tp!108471 e!760370))))

(declare-fun mapValue!56956 () ValueCell!17529)

(declare-fun mapKey!56956 () (_ BitVec 32))

(declare-fun mapRest!56956 () (Array (_ BitVec 32) ValueCell!17529))

(assert (=> mapNonEmpty!56956 (= (arr!43751 _values!1320) (store mapRest!56956 mapKey!56956 mapValue!56956))))

(declare-fun res!886045 () Bool)

(assert (=> start!112550 (=> (not res!886045) (not e!760372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112550 (= res!886045 (validMask!0 mask!1998))))

(assert (=> start!112550 e!760372))

(declare-fun array_inv!32995 (array!90570) Bool)

(assert (=> start!112550 (and (array_inv!32995 _values!1320) e!760371)))

(assert (=> start!112550 true))

(declare-fun array_inv!32996 (array!90572) Bool)

(assert (=> start!112550 (array_inv!32996 _keys!1590)))

(assert (=> start!112550 tp!108472))

(assert (=> start!112550 tp_is_empty!36855))

(assert (= (and start!112550 res!886045) b!1335056))

(assert (= (and b!1335056 res!886047) b!1335061))

(assert (= (and b!1335061 res!886044) b!1335058))

(assert (= (and b!1335058 res!886046) b!1335060))

(assert (= (and b!1335060 res!886043) b!1335059))

(assert (= (and b!1335057 condMapEmpty!56956) mapIsEmpty!56956))

(assert (= (and b!1335057 (not condMapEmpty!56956)) mapNonEmpty!56956))

(get-info :version)

(assert (= (and mapNonEmpty!56956 ((_ is ValueCellFull!17529) mapValue!56956)) b!1335055))

(assert (= (and b!1335057 ((_ is ValueCellFull!17529) mapDefault!56956)) b!1335054))

(assert (= start!112550 b!1335057))

(declare-fun m!1223251 () Bool)

(assert (=> b!1335058 m!1223251))

(declare-fun m!1223253 () Bool)

(assert (=> start!112550 m!1223253))

(declare-fun m!1223255 () Bool)

(assert (=> start!112550 m!1223255))

(declare-fun m!1223257 () Bool)

(assert (=> start!112550 m!1223257))

(declare-fun m!1223259 () Bool)

(assert (=> b!1335061 m!1223259))

(declare-fun m!1223261 () Bool)

(assert (=> b!1335059 m!1223261))

(assert (=> b!1335059 m!1223261))

(declare-fun m!1223263 () Bool)

(assert (=> b!1335059 m!1223263))

(declare-fun m!1223265 () Bool)

(assert (=> mapNonEmpty!56956 m!1223265))

(check-sat (not b!1335059) (not start!112550) (not mapNonEmpty!56956) b_and!49853 (not b!1335061) (not b_next!30945) (not b!1335058) tp_is_empty!36855)
(check-sat b_and!49853 (not b_next!30945))
