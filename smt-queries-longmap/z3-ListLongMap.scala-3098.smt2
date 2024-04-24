; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43514 () Bool)

(assert start!43514)

(declare-fun b_free!12307 () Bool)

(declare-fun b_next!12307 () Bool)

(assert (=> start!43514 (= b_free!12307 (not b_next!12307))))

(declare-fun tp!43204 () Bool)

(declare-fun b_and!21077 () Bool)

(assert (=> start!43514 (= tp!43204 b_and!21077)))

(declare-fun b!482218 () Bool)

(declare-fun res!287488 () Bool)

(declare-fun e!283767 () Bool)

(assert (=> b!482218 (=> (not res!287488) (not e!283767))))

(declare-datatypes ((array!31284 0))(
  ( (array!31285 (arr!15044 (Array (_ BitVec 32) (_ BitVec 64))) (size!15402 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31284)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31284 (_ BitVec 32)) Bool)

(assert (=> b!482218 (= res!287488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22438 () Bool)

(declare-fun mapRes!22438 () Bool)

(declare-fun tp!43203 () Bool)

(declare-fun e!283766 () Bool)

(assert (=> mapNonEmpty!22438 (= mapRes!22438 (and tp!43203 e!283766))))

(declare-fun mapKey!22438 () (_ BitVec 32))

(declare-datatypes ((V!19497 0))(
  ( (V!19498 (val!6957 Int)) )
))
(declare-datatypes ((ValueCell!6548 0))(
  ( (ValueCellFull!6548 (v!9251 V!19497)) (EmptyCell!6548) )
))
(declare-fun mapRest!22438 () (Array (_ BitVec 32) ValueCell!6548))

(declare-fun mapValue!22438 () ValueCell!6548)

(declare-datatypes ((array!31286 0))(
  ( (array!31287 (arr!15045 (Array (_ BitVec 32) ValueCell!6548)) (size!15403 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31286)

(assert (=> mapNonEmpty!22438 (= (arr!15045 _values!1516) (store mapRest!22438 mapKey!22438 mapValue!22438))))

(declare-fun b!482219 () Bool)

(declare-fun res!287489 () Bool)

(assert (=> b!482219 (=> (not res!287489) (not e!283767))))

(declare-datatypes ((List!9117 0))(
  ( (Nil!9114) (Cons!9113 (h!9969 (_ BitVec 64)) (t!15323 List!9117)) )
))
(declare-fun arrayNoDuplicates!0 (array!31284 (_ BitVec 32) List!9117) Bool)

(assert (=> b!482219 (= res!287489 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9114))))

(declare-fun b!482220 () Bool)

(declare-fun res!287490 () Bool)

(assert (=> b!482220 (=> (not res!287490) (not e!283767))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482220 (= res!287490 (and (= (size!15403 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15402 _keys!1874) (size!15403 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287487 () Bool)

(assert (=> start!43514 (=> (not res!287487) (not e!283767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43514 (= res!287487 (validMask!0 mask!2352))))

(assert (=> start!43514 e!283767))

(assert (=> start!43514 true))

(declare-fun tp_is_empty!13819 () Bool)

(assert (=> start!43514 tp_is_empty!13819))

(declare-fun e!283769 () Bool)

(declare-fun array_inv!10924 (array!31286) Bool)

(assert (=> start!43514 (and (array_inv!10924 _values!1516) e!283769)))

(assert (=> start!43514 tp!43204))

(declare-fun array_inv!10925 (array!31284) Bool)

(assert (=> start!43514 (array_inv!10925 _keys!1874)))

(declare-fun b!482221 () Bool)

(assert (=> b!482221 (= e!283767 false)))

(declare-fun lt!218710 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19497)

(declare-fun zeroValue!1458 () V!19497)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9048 0))(
  ( (tuple2!9049 (_1!4535 (_ BitVec 64)) (_2!4535 V!19497)) )
))
(declare-datatypes ((List!9118 0))(
  ( (Nil!9115) (Cons!9114 (h!9970 tuple2!9048) (t!15324 List!9118)) )
))
(declare-datatypes ((ListLongMap!7963 0))(
  ( (ListLongMap!7964 (toList!3997 List!9118)) )
))
(declare-fun contains!2629 (ListLongMap!7963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2311 (array!31284 array!31286 (_ BitVec 32) (_ BitVec 32) V!19497 V!19497 (_ BitVec 32) Int) ListLongMap!7963)

(assert (=> b!482221 (= lt!218710 (contains!2629 (getCurrentListMap!2311 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun mapIsEmpty!22438 () Bool)

(assert (=> mapIsEmpty!22438 mapRes!22438))

(declare-fun b!482222 () Bool)

(declare-fun e!283768 () Bool)

(assert (=> b!482222 (= e!283768 tp_is_empty!13819)))

(declare-fun b!482223 () Bool)

(assert (=> b!482223 (= e!283769 (and e!283768 mapRes!22438))))

(declare-fun condMapEmpty!22438 () Bool)

(declare-fun mapDefault!22438 () ValueCell!6548)

(assert (=> b!482223 (= condMapEmpty!22438 (= (arr!15045 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6548)) mapDefault!22438)))))

(declare-fun b!482224 () Bool)

(assert (=> b!482224 (= e!283766 tp_is_empty!13819)))

(assert (= (and start!43514 res!287487) b!482220))

(assert (= (and b!482220 res!287490) b!482218))

(assert (= (and b!482218 res!287488) b!482219))

(assert (= (and b!482219 res!287489) b!482221))

(assert (= (and b!482223 condMapEmpty!22438) mapIsEmpty!22438))

(assert (= (and b!482223 (not condMapEmpty!22438)) mapNonEmpty!22438))

(get-info :version)

(assert (= (and mapNonEmpty!22438 ((_ is ValueCellFull!6548) mapValue!22438)) b!482224))

(assert (= (and b!482223 ((_ is ValueCellFull!6548) mapDefault!22438)) b!482222))

(assert (= start!43514 b!482223))

(declare-fun m!463753 () Bool)

(assert (=> b!482219 m!463753))

(declare-fun m!463755 () Bool)

(assert (=> mapNonEmpty!22438 m!463755))

(declare-fun m!463757 () Bool)

(assert (=> b!482218 m!463757))

(declare-fun m!463759 () Bool)

(assert (=> b!482221 m!463759))

(assert (=> b!482221 m!463759))

(declare-fun m!463761 () Bool)

(assert (=> b!482221 m!463761))

(declare-fun m!463763 () Bool)

(assert (=> start!43514 m!463763))

(declare-fun m!463765 () Bool)

(assert (=> start!43514 m!463765))

(declare-fun m!463767 () Bool)

(assert (=> start!43514 m!463767))

(check-sat (not b_next!12307) (not b!482219) b_and!21077 tp_is_empty!13819 (not b!482221) (not start!43514) (not mapNonEmpty!22438) (not b!482218))
(check-sat b_and!21077 (not b_next!12307))
