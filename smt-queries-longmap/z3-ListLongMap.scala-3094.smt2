; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43490 () Bool)

(assert start!43490)

(declare-fun b_free!12283 () Bool)

(declare-fun b_next!12283 () Bool)

(assert (=> start!43490 (= b_free!12283 (not b_next!12283))))

(declare-fun tp!43132 () Bool)

(declare-fun b_and!21053 () Bool)

(assert (=> start!43490 (= tp!43132 b_and!21053)))

(declare-fun b!481966 () Bool)

(declare-fun e!283586 () Bool)

(declare-fun tp_is_empty!13795 () Bool)

(assert (=> b!481966 (= e!283586 tp_is_empty!13795)))

(declare-fun mapNonEmpty!22402 () Bool)

(declare-fun mapRes!22402 () Bool)

(declare-fun tp!43131 () Bool)

(assert (=> mapNonEmpty!22402 (= mapRes!22402 (and tp!43131 e!283586))))

(declare-datatypes ((V!19465 0))(
  ( (V!19466 (val!6945 Int)) )
))
(declare-datatypes ((ValueCell!6536 0))(
  ( (ValueCellFull!6536 (v!9239 V!19465)) (EmptyCell!6536) )
))
(declare-fun mapValue!22402 () ValueCell!6536)

(declare-fun mapKey!22402 () (_ BitVec 32))

(declare-fun mapRest!22402 () (Array (_ BitVec 32) ValueCell!6536))

(declare-datatypes ((array!31236 0))(
  ( (array!31237 (arr!15020 (Array (_ BitVec 32) ValueCell!6536)) (size!15378 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31236)

(assert (=> mapNonEmpty!22402 (= (arr!15020 _values!1516) (store mapRest!22402 mapKey!22402 mapValue!22402))))

(declare-fun mapIsEmpty!22402 () Bool)

(assert (=> mapIsEmpty!22402 mapRes!22402))

(declare-fun b!481968 () Bool)

(declare-fun res!287344 () Bool)

(declare-fun e!283589 () Bool)

(assert (=> b!481968 (=> (not res!287344) (not e!283589))))

(declare-datatypes ((array!31238 0))(
  ( (array!31239 (arr!15021 (Array (_ BitVec 32) (_ BitVec 64))) (size!15379 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31238)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31238 (_ BitVec 32)) Bool)

(assert (=> b!481968 (= res!287344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481969 () Bool)

(declare-fun e!283587 () Bool)

(assert (=> b!481969 (= e!283587 tp_is_empty!13795)))

(declare-fun b!481970 () Bool)

(declare-fun res!287346 () Bool)

(assert (=> b!481970 (=> (not res!287346) (not e!283589))))

(declare-datatypes ((List!9098 0))(
  ( (Nil!9095) (Cons!9094 (h!9950 (_ BitVec 64)) (t!15304 List!9098)) )
))
(declare-fun arrayNoDuplicates!0 (array!31238 (_ BitVec 32) List!9098) Bool)

(assert (=> b!481970 (= res!287346 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9095))))

(declare-fun b!481971 () Bool)

(declare-fun res!287343 () Bool)

(assert (=> b!481971 (=> (not res!287343) (not e!283589))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481971 (= res!287343 (and (= (size!15378 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15379 _keys!1874) (size!15378 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481972 () Bool)

(declare-fun e!283588 () Bool)

(assert (=> b!481972 (= e!283588 (and e!283587 mapRes!22402))))

(declare-fun condMapEmpty!22402 () Bool)

(declare-fun mapDefault!22402 () ValueCell!6536)

(assert (=> b!481972 (= condMapEmpty!22402 (= (arr!15020 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6536)) mapDefault!22402)))))

(declare-fun b!481967 () Bool)

(assert (=> b!481967 (= e!283589 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19465)

(declare-fun lt!218674 () Bool)

(declare-fun zeroValue!1458 () V!19465)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9034 0))(
  ( (tuple2!9035 (_1!4528 (_ BitVec 64)) (_2!4528 V!19465)) )
))
(declare-datatypes ((List!9099 0))(
  ( (Nil!9096) (Cons!9095 (h!9951 tuple2!9034) (t!15305 List!9099)) )
))
(declare-datatypes ((ListLongMap!7949 0))(
  ( (ListLongMap!7950 (toList!3990 List!9099)) )
))
(declare-fun contains!2622 (ListLongMap!7949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2304 (array!31238 array!31236 (_ BitVec 32) (_ BitVec 32) V!19465 V!19465 (_ BitVec 32) Int) ListLongMap!7949)

(assert (=> b!481967 (= lt!218674 (contains!2622 (getCurrentListMap!2304 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!287345 () Bool)

(assert (=> start!43490 (=> (not res!287345) (not e!283589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43490 (= res!287345 (validMask!0 mask!2352))))

(assert (=> start!43490 e!283589))

(assert (=> start!43490 true))

(assert (=> start!43490 tp_is_empty!13795))

(declare-fun array_inv!10908 (array!31236) Bool)

(assert (=> start!43490 (and (array_inv!10908 _values!1516) e!283588)))

(assert (=> start!43490 tp!43132))

(declare-fun array_inv!10909 (array!31238) Bool)

(assert (=> start!43490 (array_inv!10909 _keys!1874)))

(assert (= (and start!43490 res!287345) b!481971))

(assert (= (and b!481971 res!287343) b!481968))

(assert (= (and b!481968 res!287344) b!481970))

(assert (= (and b!481970 res!287346) b!481967))

(assert (= (and b!481972 condMapEmpty!22402) mapIsEmpty!22402))

(assert (= (and b!481972 (not condMapEmpty!22402)) mapNonEmpty!22402))

(get-info :version)

(assert (= (and mapNonEmpty!22402 ((_ is ValueCellFull!6536) mapValue!22402)) b!481966))

(assert (= (and b!481972 ((_ is ValueCellFull!6536) mapDefault!22402)) b!481969))

(assert (= start!43490 b!481972))

(declare-fun m!463561 () Bool)

(assert (=> b!481967 m!463561))

(assert (=> b!481967 m!463561))

(declare-fun m!463563 () Bool)

(assert (=> b!481967 m!463563))

(declare-fun m!463565 () Bool)

(assert (=> b!481970 m!463565))

(declare-fun m!463567 () Bool)

(assert (=> start!43490 m!463567))

(declare-fun m!463569 () Bool)

(assert (=> start!43490 m!463569))

(declare-fun m!463571 () Bool)

(assert (=> start!43490 m!463571))

(declare-fun m!463573 () Bool)

(assert (=> b!481968 m!463573))

(declare-fun m!463575 () Bool)

(assert (=> mapNonEmpty!22402 m!463575))

(check-sat tp_is_empty!13795 (not b!481970) (not b!481967) (not b!481968) (not b_next!12283) b_and!21053 (not mapNonEmpty!22402) (not start!43490))
(check-sat b_and!21053 (not b_next!12283))
