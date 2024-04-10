; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112580 () Bool)

(assert start!112580)

(declare-fun b_free!30975 () Bool)

(declare-fun b_next!30975 () Bool)

(assert (=> start!112580 (= b_free!30975 (not b_next!30975))))

(declare-fun tp!108562 () Bool)

(declare-fun b_and!49883 () Bool)

(assert (=> start!112580 (= tp!108562 b_and!49883)))

(declare-fun b!1335461 () Bool)

(declare-fun res!886318 () Bool)

(declare-fun e!760594 () Bool)

(assert (=> b!1335461 (=> (not res!886318) (not e!760594))))

(declare-datatypes ((array!90630 0))(
  ( (array!90631 (arr!43781 (Array (_ BitVec 32) (_ BitVec 64))) (size!44331 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90630)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90630 (_ BitVec 32)) Bool)

(assert (=> b!1335461 (= res!886318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!886317 () Bool)

(assert (=> start!112580 (=> (not res!886317) (not e!760594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112580 (= res!886317 (validMask!0 mask!1998))))

(assert (=> start!112580 e!760594))

(declare-datatypes ((V!54283 0))(
  ( (V!54284 (val!18517 Int)) )
))
(declare-datatypes ((ValueCell!17544 0))(
  ( (ValueCellFull!17544 (v!21154 V!54283)) (EmptyCell!17544) )
))
(declare-datatypes ((array!90632 0))(
  ( (array!90633 (arr!43782 (Array (_ BitVec 32) ValueCell!17544)) (size!44332 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90632)

(declare-fun e!760593 () Bool)

(declare-fun array_inv!33017 (array!90632) Bool)

(assert (=> start!112580 (and (array_inv!33017 _values!1320) e!760593)))

(assert (=> start!112580 true))

(declare-fun array_inv!33018 (array!90630) Bool)

(assert (=> start!112580 (array_inv!33018 _keys!1590)))

(assert (=> start!112580 tp!108562))

(declare-fun tp_is_empty!36885 () Bool)

(assert (=> start!112580 tp_is_empty!36885))

(declare-fun b!1335462 () Bool)

(declare-fun res!886322 () Bool)

(assert (=> b!1335462 (=> (not res!886322) (not e!760594))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335462 (= res!886322 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44331 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57001 () Bool)

(declare-fun mapRes!57001 () Bool)

(declare-fun tp!108561 () Bool)

(declare-fun e!760596 () Bool)

(assert (=> mapNonEmpty!57001 (= mapRes!57001 (and tp!108561 e!760596))))

(declare-fun mapValue!57001 () ValueCell!17544)

(declare-fun mapRest!57001 () (Array (_ BitVec 32) ValueCell!17544))

(declare-fun mapKey!57001 () (_ BitVec 32))

(assert (=> mapNonEmpty!57001 (= (arr!43782 _values!1320) (store mapRest!57001 mapKey!57001 mapValue!57001))))

(declare-fun b!1335463 () Bool)

(declare-fun e!760595 () Bool)

(assert (=> b!1335463 (= e!760595 tp_is_empty!36885)))

(declare-fun b!1335464 () Bool)

(declare-fun res!886316 () Bool)

(assert (=> b!1335464 (=> (not res!886316) (not e!760594))))

(assert (=> b!1335464 (= res!886316 (not (= (select (arr!43781 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335465 () Bool)

(declare-fun res!886320 () Bool)

(assert (=> b!1335465 (=> (not res!886320) (not e!760594))))

(assert (=> b!1335465 (= res!886320 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335466 () Bool)

(declare-fun res!886319 () Bool)

(assert (=> b!1335466 (=> (not res!886319) (not e!760594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335466 (= res!886319 (validKeyInArray!0 (select (arr!43781 _keys!1590) from!1980)))))

(declare-fun b!1335467 () Bool)

(declare-fun res!886321 () Bool)

(assert (=> b!1335467 (=> (not res!886321) (not e!760594))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54283)

(declare-fun zeroValue!1262 () V!54283)

(declare-datatypes ((tuple2!23878 0))(
  ( (tuple2!23879 (_1!11950 (_ BitVec 64)) (_2!11950 V!54283)) )
))
(declare-datatypes ((List!31019 0))(
  ( (Nil!31016) (Cons!31015 (h!32224 tuple2!23878) (t!45283 List!31019)) )
))
(declare-datatypes ((ListLongMap!21535 0))(
  ( (ListLongMap!21536 (toList!10783 List!31019)) )
))
(declare-fun contains!8947 (ListLongMap!21535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5757 (array!90630 array!90632 (_ BitVec 32) (_ BitVec 32) V!54283 V!54283 (_ BitVec 32) Int) ListLongMap!21535)

(assert (=> b!1335467 (= res!886321 (contains!8947 (getCurrentListMap!5757 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335468 () Bool)

(assert (=> b!1335468 (= e!760594 false)))

(declare-fun lt!592459 () ListLongMap!21535)

(declare-fun getCurrentListMapNoExtraKeys!6369 (array!90630 array!90632 (_ BitVec 32) (_ BitVec 32) V!54283 V!54283 (_ BitVec 32) Int) ListLongMap!21535)

(assert (=> b!1335468 (= lt!592459 (getCurrentListMapNoExtraKeys!6369 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1335469 () Bool)

(declare-fun res!886315 () Bool)

(assert (=> b!1335469 (=> (not res!886315) (not e!760594))))

(declare-datatypes ((List!31020 0))(
  ( (Nil!31017) (Cons!31016 (h!32225 (_ BitVec 64)) (t!45284 List!31020)) )
))
(declare-fun arrayNoDuplicates!0 (array!90630 (_ BitVec 32) List!31020) Bool)

(assert (=> b!1335469 (= res!886315 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31017))))

(declare-fun mapIsEmpty!57001 () Bool)

(assert (=> mapIsEmpty!57001 mapRes!57001))

(declare-fun b!1335470 () Bool)

(declare-fun res!886323 () Bool)

(assert (=> b!1335470 (=> (not res!886323) (not e!760594))))

(assert (=> b!1335470 (= res!886323 (and (= (size!44332 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44331 _keys!1590) (size!44332 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335471 () Bool)

(assert (=> b!1335471 (= e!760596 tp_is_empty!36885)))

(declare-fun b!1335472 () Bool)

(assert (=> b!1335472 (= e!760593 (and e!760595 mapRes!57001))))

(declare-fun condMapEmpty!57001 () Bool)

(declare-fun mapDefault!57001 () ValueCell!17544)

(assert (=> b!1335472 (= condMapEmpty!57001 (= (arr!43782 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17544)) mapDefault!57001)))))

(assert (= (and start!112580 res!886317) b!1335470))

(assert (= (and b!1335470 res!886323) b!1335461))

(assert (= (and b!1335461 res!886318) b!1335469))

(assert (= (and b!1335469 res!886315) b!1335462))

(assert (= (and b!1335462 res!886322) b!1335467))

(assert (= (and b!1335467 res!886321) b!1335464))

(assert (= (and b!1335464 res!886316) b!1335466))

(assert (= (and b!1335466 res!886319) b!1335465))

(assert (= (and b!1335465 res!886320) b!1335468))

(assert (= (and b!1335472 condMapEmpty!57001) mapIsEmpty!57001))

(assert (= (and b!1335472 (not condMapEmpty!57001)) mapNonEmpty!57001))

(get-info :version)

(assert (= (and mapNonEmpty!57001 ((_ is ValueCellFull!17544) mapValue!57001)) b!1335471))

(assert (= (and b!1335472 ((_ is ValueCellFull!17544) mapDefault!57001)) b!1335463))

(assert (= start!112580 b!1335472))

(declare-fun m!1223509 () Bool)

(assert (=> b!1335469 m!1223509))

(declare-fun m!1223511 () Bool)

(assert (=> start!112580 m!1223511))

(declare-fun m!1223513 () Bool)

(assert (=> start!112580 m!1223513))

(declare-fun m!1223515 () Bool)

(assert (=> start!112580 m!1223515))

(declare-fun m!1223517 () Bool)

(assert (=> b!1335467 m!1223517))

(assert (=> b!1335467 m!1223517))

(declare-fun m!1223519 () Bool)

(assert (=> b!1335467 m!1223519))

(declare-fun m!1223521 () Bool)

(assert (=> b!1335461 m!1223521))

(declare-fun m!1223523 () Bool)

(assert (=> b!1335466 m!1223523))

(assert (=> b!1335466 m!1223523))

(declare-fun m!1223525 () Bool)

(assert (=> b!1335466 m!1223525))

(assert (=> b!1335464 m!1223523))

(declare-fun m!1223527 () Bool)

(assert (=> b!1335468 m!1223527))

(declare-fun m!1223529 () Bool)

(assert (=> mapNonEmpty!57001 m!1223529))

(check-sat (not b!1335461) (not b!1335467) (not mapNonEmpty!57001) b_and!49883 (not b!1335469) (not b!1335466) (not start!112580) tp_is_empty!36885 (not b!1335468) (not b_next!30975))
(check-sat b_and!49883 (not b_next!30975))
