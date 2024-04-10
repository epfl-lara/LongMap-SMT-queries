; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43530 () Bool)

(assert start!43530)

(declare-fun b_free!12309 () Bool)

(declare-fun b_next!12309 () Bool)

(assert (=> start!43530 (= b_free!12309 (not b_next!12309))))

(declare-fun tp!43210 () Bool)

(declare-fun b_and!21069 () Bool)

(assert (=> start!43530 (= tp!43210 b_and!21069)))

(declare-fun b!482300 () Bool)

(declare-fun e!283822 () Bool)

(declare-fun tp_is_empty!13821 () Bool)

(assert (=> b!482300 (= e!283822 tp_is_empty!13821)))

(declare-fun res!287506 () Bool)

(declare-fun e!283823 () Bool)

(assert (=> start!43530 (=> (not res!287506) (not e!283823))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43530 (= res!287506 (validMask!0 mask!2352))))

(assert (=> start!43530 e!283823))

(assert (=> start!43530 true))

(assert (=> start!43530 tp_is_empty!13821))

(declare-datatypes ((V!19499 0))(
  ( (V!19500 (val!6958 Int)) )
))
(declare-datatypes ((ValueCell!6549 0))(
  ( (ValueCellFull!6549 (v!9251 V!19499)) (EmptyCell!6549) )
))
(declare-datatypes ((array!31301 0))(
  ( (array!31302 (arr!15053 (Array (_ BitVec 32) ValueCell!6549)) (size!15411 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31301)

(declare-fun e!283820 () Bool)

(declare-fun array_inv!10860 (array!31301) Bool)

(assert (=> start!43530 (and (array_inv!10860 _values!1516) e!283820)))

(assert (=> start!43530 tp!43210))

(declare-datatypes ((array!31303 0))(
  ( (array!31304 (arr!15054 (Array (_ BitVec 32) (_ BitVec 64))) (size!15412 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31303)

(declare-fun array_inv!10861 (array!31303) Bool)

(assert (=> start!43530 (array_inv!10861 _keys!1874)))

(declare-fun mapIsEmpty!22441 () Bool)

(declare-fun mapRes!22441 () Bool)

(assert (=> mapIsEmpty!22441 mapRes!22441))

(declare-fun b!482301 () Bool)

(assert (=> b!482301 (= e!283820 (and e!283822 mapRes!22441))))

(declare-fun condMapEmpty!22441 () Bool)

(declare-fun mapDefault!22441 () ValueCell!6549)

(assert (=> b!482301 (= condMapEmpty!22441 (= (arr!15053 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6549)) mapDefault!22441)))))

(declare-fun b!482302 () Bool)

(assert (=> b!482302 (= e!283823 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218701 () Bool)

(declare-fun minValue!1458 () V!19499)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19499)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9132 0))(
  ( (tuple2!9133 (_1!4577 (_ BitVec 64)) (_2!4577 V!19499)) )
))
(declare-datatypes ((List!9212 0))(
  ( (Nil!9209) (Cons!9208 (h!10064 tuple2!9132) (t!15426 List!9212)) )
))
(declare-datatypes ((ListLongMap!8045 0))(
  ( (ListLongMap!8046 (toList!4038 List!9212)) )
))
(declare-fun contains!2652 (ListLongMap!8045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2357 (array!31303 array!31301 (_ BitVec 32) (_ BitVec 32) V!19499 V!19499 (_ BitVec 32) Int) ListLongMap!8045)

(assert (=> b!482302 (= lt!218701 (contains!2652 (getCurrentListMap!2357 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482303 () Bool)

(declare-fun res!287507 () Bool)

(assert (=> b!482303 (=> (not res!287507) (not e!283823))))

(assert (=> b!482303 (= res!287507 (and (= (size!15411 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15412 _keys!1874) (size!15411 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482304 () Bool)

(declare-fun e!283821 () Bool)

(assert (=> b!482304 (= e!283821 tp_is_empty!13821)))

(declare-fun b!482305 () Bool)

(declare-fun res!287508 () Bool)

(assert (=> b!482305 (=> (not res!287508) (not e!283823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31303 (_ BitVec 32)) Bool)

(assert (=> b!482305 (= res!287508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22441 () Bool)

(declare-fun tp!43209 () Bool)

(assert (=> mapNonEmpty!22441 (= mapRes!22441 (and tp!43209 e!283821))))

(declare-fun mapRest!22441 () (Array (_ BitVec 32) ValueCell!6549))

(declare-fun mapKey!22441 () (_ BitVec 32))

(declare-fun mapValue!22441 () ValueCell!6549)

(assert (=> mapNonEmpty!22441 (= (arr!15053 _values!1516) (store mapRest!22441 mapKey!22441 mapValue!22441))))

(declare-fun b!482306 () Bool)

(declare-fun res!287509 () Bool)

(assert (=> b!482306 (=> (not res!287509) (not e!283823))))

(declare-datatypes ((List!9213 0))(
  ( (Nil!9210) (Cons!9209 (h!10065 (_ BitVec 64)) (t!15427 List!9213)) )
))
(declare-fun arrayNoDuplicates!0 (array!31303 (_ BitVec 32) List!9213) Bool)

(assert (=> b!482306 (= res!287509 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9210))))

(assert (= (and start!43530 res!287506) b!482303))

(assert (= (and b!482303 res!287507) b!482305))

(assert (= (and b!482305 res!287508) b!482306))

(assert (= (and b!482306 res!287509) b!482302))

(assert (= (and b!482301 condMapEmpty!22441) mapIsEmpty!22441))

(assert (= (and b!482301 (not condMapEmpty!22441)) mapNonEmpty!22441))

(get-info :version)

(assert (= (and mapNonEmpty!22441 ((_ is ValueCellFull!6549) mapValue!22441)) b!482304))

(assert (= (and b!482301 ((_ is ValueCellFull!6549) mapDefault!22441)) b!482300))

(assert (= start!43530 b!482301))

(declare-fun m!463587 () Bool)

(assert (=> b!482305 m!463587))

(declare-fun m!463589 () Bool)

(assert (=> b!482302 m!463589))

(assert (=> b!482302 m!463589))

(declare-fun m!463591 () Bool)

(assert (=> b!482302 m!463591))

(declare-fun m!463593 () Bool)

(assert (=> start!43530 m!463593))

(declare-fun m!463595 () Bool)

(assert (=> start!43530 m!463595))

(declare-fun m!463597 () Bool)

(assert (=> start!43530 m!463597))

(declare-fun m!463599 () Bool)

(assert (=> b!482306 m!463599))

(declare-fun m!463601 () Bool)

(assert (=> mapNonEmpty!22441 m!463601))

(check-sat (not b!482302) (not b!482305) b_and!21069 (not b_next!12309) tp_is_empty!13821 (not b!482306) (not mapNonEmpty!22441) (not start!43530))
(check-sat b_and!21069 (not b_next!12309))
