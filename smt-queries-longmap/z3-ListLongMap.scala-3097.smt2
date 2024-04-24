; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43508 () Bool)

(assert start!43508)

(declare-fun b_free!12301 () Bool)

(declare-fun b_next!12301 () Bool)

(assert (=> start!43508 (= b_free!12301 (not b_next!12301))))

(declare-fun tp!43185 () Bool)

(declare-fun b_and!21071 () Bool)

(assert (=> start!43508 (= tp!43185 b_and!21071)))

(declare-fun b!482155 () Bool)

(declare-fun e!283721 () Bool)

(declare-fun tp_is_empty!13813 () Bool)

(assert (=> b!482155 (= e!283721 tp_is_empty!13813)))

(declare-fun b!482156 () Bool)

(declare-fun e!283725 () Bool)

(declare-fun mapRes!22429 () Bool)

(assert (=> b!482156 (= e!283725 (and e!283721 mapRes!22429))))

(declare-fun condMapEmpty!22429 () Bool)

(declare-datatypes ((V!19489 0))(
  ( (V!19490 (val!6954 Int)) )
))
(declare-datatypes ((ValueCell!6545 0))(
  ( (ValueCellFull!6545 (v!9248 V!19489)) (EmptyCell!6545) )
))
(declare-datatypes ((array!31272 0))(
  ( (array!31273 (arr!15038 (Array (_ BitVec 32) ValueCell!6545)) (size!15396 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31272)

(declare-fun mapDefault!22429 () ValueCell!6545)

(assert (=> b!482156 (= condMapEmpty!22429 (= (arr!15038 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6545)) mapDefault!22429)))))

(declare-fun b!482157 () Bool)

(declare-fun res!287453 () Bool)

(declare-fun e!283724 () Bool)

(assert (=> b!482157 (=> (not res!287453) (not e!283724))))

(declare-datatypes ((array!31274 0))(
  ( (array!31275 (arr!15039 (Array (_ BitVec 32) (_ BitVec 64))) (size!15397 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31274)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31274 (_ BitVec 32)) Bool)

(assert (=> b!482157 (= res!287453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482158 () Bool)

(assert (=> b!482158 (= e!283724 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218701 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19489)

(declare-fun minValue!1458 () V!19489)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9044 0))(
  ( (tuple2!9045 (_1!4533 (_ BitVec 64)) (_2!4533 V!19489)) )
))
(declare-datatypes ((List!9112 0))(
  ( (Nil!9109) (Cons!9108 (h!9964 tuple2!9044) (t!15318 List!9112)) )
))
(declare-datatypes ((ListLongMap!7959 0))(
  ( (ListLongMap!7960 (toList!3995 List!9112)) )
))
(declare-fun contains!2627 (ListLongMap!7959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2309 (array!31274 array!31272 (_ BitVec 32) (_ BitVec 32) V!19489 V!19489 (_ BitVec 32) Int) ListLongMap!7959)

(assert (=> b!482158 (= lt!218701 (contains!2627 (getCurrentListMap!2309 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482159 () Bool)

(declare-fun e!283722 () Bool)

(assert (=> b!482159 (= e!283722 tp_is_empty!13813)))

(declare-fun b!482160 () Bool)

(declare-fun res!287451 () Bool)

(assert (=> b!482160 (=> (not res!287451) (not e!283724))))

(declare-datatypes ((List!9113 0))(
  ( (Nil!9110) (Cons!9109 (h!9965 (_ BitVec 64)) (t!15319 List!9113)) )
))
(declare-fun arrayNoDuplicates!0 (array!31274 (_ BitVec 32) List!9113) Bool)

(assert (=> b!482160 (= res!287451 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9110))))

(declare-fun res!287454 () Bool)

(assert (=> start!43508 (=> (not res!287454) (not e!283724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43508 (= res!287454 (validMask!0 mask!2352))))

(assert (=> start!43508 e!283724))

(assert (=> start!43508 true))

(assert (=> start!43508 tp_is_empty!13813))

(declare-fun array_inv!10920 (array!31272) Bool)

(assert (=> start!43508 (and (array_inv!10920 _values!1516) e!283725)))

(assert (=> start!43508 tp!43185))

(declare-fun array_inv!10921 (array!31274) Bool)

(assert (=> start!43508 (array_inv!10921 _keys!1874)))

(declare-fun mapNonEmpty!22429 () Bool)

(declare-fun tp!43186 () Bool)

(assert (=> mapNonEmpty!22429 (= mapRes!22429 (and tp!43186 e!283722))))

(declare-fun mapKey!22429 () (_ BitVec 32))

(declare-fun mapValue!22429 () ValueCell!6545)

(declare-fun mapRest!22429 () (Array (_ BitVec 32) ValueCell!6545))

(assert (=> mapNonEmpty!22429 (= (arr!15038 _values!1516) (store mapRest!22429 mapKey!22429 mapValue!22429))))

(declare-fun mapIsEmpty!22429 () Bool)

(assert (=> mapIsEmpty!22429 mapRes!22429))

(declare-fun b!482161 () Bool)

(declare-fun res!287452 () Bool)

(assert (=> b!482161 (=> (not res!287452) (not e!283724))))

(assert (=> b!482161 (= res!287452 (and (= (size!15396 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15397 _keys!1874) (size!15396 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(assert (= (and start!43508 res!287454) b!482161))

(assert (= (and b!482161 res!287452) b!482157))

(assert (= (and b!482157 res!287453) b!482160))

(assert (= (and b!482160 res!287451) b!482158))

(assert (= (and b!482156 condMapEmpty!22429) mapIsEmpty!22429))

(assert (= (and b!482156 (not condMapEmpty!22429)) mapNonEmpty!22429))

(get-info :version)

(assert (= (and mapNonEmpty!22429 ((_ is ValueCellFull!6545) mapValue!22429)) b!482159))

(assert (= (and b!482156 ((_ is ValueCellFull!6545) mapDefault!22429)) b!482155))

(assert (= start!43508 b!482156))

(declare-fun m!463705 () Bool)

(assert (=> start!43508 m!463705))

(declare-fun m!463707 () Bool)

(assert (=> start!43508 m!463707))

(declare-fun m!463709 () Bool)

(assert (=> start!43508 m!463709))

(declare-fun m!463711 () Bool)

(assert (=> b!482158 m!463711))

(assert (=> b!482158 m!463711))

(declare-fun m!463713 () Bool)

(assert (=> b!482158 m!463713))

(declare-fun m!463715 () Bool)

(assert (=> mapNonEmpty!22429 m!463715))

(declare-fun m!463717 () Bool)

(assert (=> b!482157 m!463717))

(declare-fun m!463719 () Bool)

(assert (=> b!482160 m!463719))

(check-sat b_and!21071 (not mapNonEmpty!22429) (not b!482160) (not start!43508) (not b_next!12301) (not b!482157) tp_is_empty!13813 (not b!482158))
(check-sat b_and!21071 (not b_next!12301))
