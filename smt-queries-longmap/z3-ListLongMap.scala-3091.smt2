; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43472 () Bool)

(assert start!43472)

(declare-fun b_free!12265 () Bool)

(declare-fun b_next!12265 () Bool)

(assert (=> start!43472 (= b_free!12265 (not b_next!12265))))

(declare-fun tp!43078 () Bool)

(declare-fun b_and!21035 () Bool)

(assert (=> start!43472 (= tp!43078 b_and!21035)))

(declare-fun b!481777 () Bool)

(declare-fun res!287236 () Bool)

(declare-fun e!283452 () Bool)

(assert (=> b!481777 (=> (not res!287236) (not e!283452))))

(declare-datatypes ((array!31202 0))(
  ( (array!31203 (arr!15003 (Array (_ BitVec 32) (_ BitVec 64))) (size!15361 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31202)

(declare-datatypes ((List!9086 0))(
  ( (Nil!9083) (Cons!9082 (h!9938 (_ BitVec 64)) (t!15292 List!9086)) )
))
(declare-fun arrayNoDuplicates!0 (array!31202 (_ BitVec 32) List!9086) Bool)

(assert (=> b!481777 (= res!287236 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9083))))

(declare-fun b!481778 () Bool)

(assert (=> b!481778 (= e!283452 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218647 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19441 0))(
  ( (V!19442 (val!6936 Int)) )
))
(declare-fun minValue!1458 () V!19441)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19441)

(declare-datatypes ((ValueCell!6527 0))(
  ( (ValueCellFull!6527 (v!9230 V!19441)) (EmptyCell!6527) )
))
(declare-datatypes ((array!31204 0))(
  ( (array!31205 (arr!15004 (Array (_ BitVec 32) ValueCell!6527)) (size!15362 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31204)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9020 0))(
  ( (tuple2!9021 (_1!4521 (_ BitVec 64)) (_2!4521 V!19441)) )
))
(declare-datatypes ((List!9087 0))(
  ( (Nil!9084) (Cons!9083 (h!9939 tuple2!9020) (t!15293 List!9087)) )
))
(declare-datatypes ((ListLongMap!7935 0))(
  ( (ListLongMap!7936 (toList!3983 List!9087)) )
))
(declare-fun contains!2615 (ListLongMap!7935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2297 (array!31202 array!31204 (_ BitVec 32) (_ BitVec 32) V!19441 V!19441 (_ BitVec 32) Int) ListLongMap!7935)

(assert (=> b!481778 (= lt!218647 (contains!2615 (getCurrentListMap!2297 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481779 () Bool)

(declare-fun res!287237 () Bool)

(assert (=> b!481779 (=> (not res!287237) (not e!283452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31202 (_ BitVec 32)) Bool)

(assert (=> b!481779 (= res!287237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481780 () Bool)

(declare-fun e!283453 () Bool)

(declare-fun tp_is_empty!13777 () Bool)

(assert (=> b!481780 (= e!283453 tp_is_empty!13777)))

(declare-fun b!481781 () Bool)

(declare-fun e!283451 () Bool)

(assert (=> b!481781 (= e!283451 tp_is_empty!13777)))

(declare-fun b!481782 () Bool)

(declare-fun e!283454 () Bool)

(declare-fun mapRes!22375 () Bool)

(assert (=> b!481782 (= e!283454 (and e!283451 mapRes!22375))))

(declare-fun condMapEmpty!22375 () Bool)

(declare-fun mapDefault!22375 () ValueCell!6527)

(assert (=> b!481782 (= condMapEmpty!22375 (= (arr!15004 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6527)) mapDefault!22375)))))

(declare-fun res!287238 () Bool)

(assert (=> start!43472 (=> (not res!287238) (not e!283452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43472 (= res!287238 (validMask!0 mask!2352))))

(assert (=> start!43472 e!283452))

(assert (=> start!43472 true))

(assert (=> start!43472 tp_is_empty!13777))

(declare-fun array_inv!10896 (array!31204) Bool)

(assert (=> start!43472 (and (array_inv!10896 _values!1516) e!283454)))

(assert (=> start!43472 tp!43078))

(declare-fun array_inv!10897 (array!31202) Bool)

(assert (=> start!43472 (array_inv!10897 _keys!1874)))

(declare-fun mapIsEmpty!22375 () Bool)

(assert (=> mapIsEmpty!22375 mapRes!22375))

(declare-fun b!481783 () Bool)

(declare-fun res!287235 () Bool)

(assert (=> b!481783 (=> (not res!287235) (not e!283452))))

(assert (=> b!481783 (= res!287235 (and (= (size!15362 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15361 _keys!1874) (size!15362 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22375 () Bool)

(declare-fun tp!43077 () Bool)

(assert (=> mapNonEmpty!22375 (= mapRes!22375 (and tp!43077 e!283453))))

(declare-fun mapRest!22375 () (Array (_ BitVec 32) ValueCell!6527))

(declare-fun mapValue!22375 () ValueCell!6527)

(declare-fun mapKey!22375 () (_ BitVec 32))

(assert (=> mapNonEmpty!22375 (= (arr!15004 _values!1516) (store mapRest!22375 mapKey!22375 mapValue!22375))))

(assert (= (and start!43472 res!287238) b!481783))

(assert (= (and b!481783 res!287235) b!481779))

(assert (= (and b!481779 res!287237) b!481777))

(assert (= (and b!481777 res!287236) b!481778))

(assert (= (and b!481782 condMapEmpty!22375) mapIsEmpty!22375))

(assert (= (and b!481782 (not condMapEmpty!22375)) mapNonEmpty!22375))

(get-info :version)

(assert (= (and mapNonEmpty!22375 ((_ is ValueCellFull!6527) mapValue!22375)) b!481780))

(assert (= (and b!481782 ((_ is ValueCellFull!6527) mapDefault!22375)) b!481781))

(assert (= start!43472 b!481782))

(declare-fun m!463417 () Bool)

(assert (=> b!481777 m!463417))

(declare-fun m!463419 () Bool)

(assert (=> b!481779 m!463419))

(declare-fun m!463421 () Bool)

(assert (=> mapNonEmpty!22375 m!463421))

(declare-fun m!463423 () Bool)

(assert (=> b!481778 m!463423))

(assert (=> b!481778 m!463423))

(declare-fun m!463425 () Bool)

(assert (=> b!481778 m!463425))

(declare-fun m!463427 () Bool)

(assert (=> start!43472 m!463427))

(declare-fun m!463429 () Bool)

(assert (=> start!43472 m!463429))

(declare-fun m!463431 () Bool)

(assert (=> start!43472 m!463431))

(check-sat b_and!21035 (not b_next!12265) (not start!43472) (not b!481778) (not b!481779) (not b!481777) tp_is_empty!13777 (not mapNonEmpty!22375))
(check-sat b_and!21035 (not b_next!12265))
