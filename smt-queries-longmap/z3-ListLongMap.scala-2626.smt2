; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39560 () Bool)

(assert start!39560)

(declare-fun b_free!9841 () Bool)

(declare-fun b_next!9841 () Bool)

(assert (=> start!39560 (= b_free!9841 (not b_next!9841))))

(declare-fun tp!35051 () Bool)

(declare-fun b_and!17471 () Bool)

(assert (=> start!39560 (= tp!35051 b_and!17471)))

(declare-fun b!423398 () Bool)

(declare-fun res!247535 () Bool)

(declare-fun e!251653 () Bool)

(assert (=> b!423398 (=> (not res!247535) (not e!251653))))

(declare-datatypes ((array!25815 0))(
  ( (array!25816 (arr!12357 (Array (_ BitVec 32) (_ BitVec 64))) (size!12710 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25815)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423398 (= res!247535 (or (= (select (arr!12357 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12357 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423399 () Bool)

(declare-fun res!247532 () Bool)

(declare-fun e!251658 () Bool)

(assert (=> b!423399 (=> (not res!247532) (not e!251658))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423399 (= res!247532 (bvsle from!863 i!563))))

(declare-fun b!423400 () Bool)

(declare-fun e!251656 () Bool)

(declare-fun tp_is_empty!10993 () Bool)

(assert (=> b!423400 (= e!251656 tp_is_empty!10993)))

(declare-fun b!423401 () Bool)

(declare-fun res!247537 () Bool)

(assert (=> b!423401 (=> (not res!247537) (not e!251653))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15763 0))(
  ( (V!15764 (val!5541 Int)) )
))
(declare-datatypes ((ValueCell!5153 0))(
  ( (ValueCellFull!5153 (v!7782 V!15763)) (EmptyCell!5153) )
))
(declare-datatypes ((array!25817 0))(
  ( (array!25818 (arr!12358 (Array (_ BitVec 32) ValueCell!5153)) (size!12711 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25817)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423401 (= res!247537 (and (= (size!12711 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12710 _keys!709) (size!12711 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423402 () Bool)

(declare-fun res!247540 () Bool)

(assert (=> b!423402 (=> (not res!247540) (not e!251653))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423402 (= res!247540 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18111 () Bool)

(declare-fun mapRes!18111 () Bool)

(declare-fun tp!35052 () Bool)

(assert (=> mapNonEmpty!18111 (= mapRes!18111 (and tp!35052 e!251656))))

(declare-fun mapValue!18111 () ValueCell!5153)

(declare-fun mapRest!18111 () (Array (_ BitVec 32) ValueCell!5153))

(declare-fun mapKey!18111 () (_ BitVec 32))

(assert (=> mapNonEmpty!18111 (= (arr!12358 _values!549) (store mapRest!18111 mapKey!18111 mapValue!18111))))

(declare-fun b!423403 () Bool)

(declare-fun res!247539 () Bool)

(assert (=> b!423403 (=> (not res!247539) (not e!251653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423403 (= res!247539 (validKeyInArray!0 k0!794))))

(declare-fun b!423404 () Bool)

(declare-fun e!251657 () Bool)

(declare-fun e!251654 () Bool)

(assert (=> b!423404 (= e!251657 (and e!251654 mapRes!18111))))

(declare-fun condMapEmpty!18111 () Bool)

(declare-fun mapDefault!18111 () ValueCell!5153)

(assert (=> b!423404 (= condMapEmpty!18111 (= (arr!12358 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5153)) mapDefault!18111)))))

(declare-fun b!423405 () Bool)

(assert (=> b!423405 (= e!251654 tp_is_empty!10993)))

(declare-fun b!423406 () Bool)

(assert (=> b!423406 (= e!251658 false)))

(declare-fun minValue!515 () V!15763)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15763)

(declare-fun v!412 () V!15763)

(declare-fun lt!193982 () array!25815)

(declare-datatypes ((tuple2!7264 0))(
  ( (tuple2!7265 (_1!3643 (_ BitVec 64)) (_2!3643 V!15763)) )
))
(declare-datatypes ((List!7259 0))(
  ( (Nil!7256) (Cons!7255 (h!8111 tuple2!7264) (t!12694 List!7259)) )
))
(declare-datatypes ((ListLongMap!6167 0))(
  ( (ListLongMap!6168 (toList!3099 List!7259)) )
))
(declare-fun lt!193980 () ListLongMap!6167)

(declare-fun getCurrentListMapNoExtraKeys!1307 (array!25815 array!25817 (_ BitVec 32) (_ BitVec 32) V!15763 V!15763 (_ BitVec 32) Int) ListLongMap!6167)

(assert (=> b!423406 (= lt!193980 (getCurrentListMapNoExtraKeys!1307 lt!193982 (array!25818 (store (arr!12358 _values!549) i!563 (ValueCellFull!5153 v!412)) (size!12711 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193981 () ListLongMap!6167)

(assert (=> b!423406 (= lt!193981 (getCurrentListMapNoExtraKeys!1307 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423407 () Bool)

(declare-fun res!247536 () Bool)

(assert (=> b!423407 (=> (not res!247536) (not e!251658))))

(declare-datatypes ((List!7260 0))(
  ( (Nil!7257) (Cons!7256 (h!8112 (_ BitVec 64)) (t!12695 List!7260)) )
))
(declare-fun arrayNoDuplicates!0 (array!25815 (_ BitVec 32) List!7260) Bool)

(assert (=> b!423407 (= res!247536 (arrayNoDuplicates!0 lt!193982 #b00000000000000000000000000000000 Nil!7257))))

(declare-fun b!423408 () Bool)

(declare-fun res!247542 () Bool)

(assert (=> b!423408 (=> (not res!247542) (not e!251653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25815 (_ BitVec 32)) Bool)

(assert (=> b!423408 (= res!247542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423409 () Bool)

(assert (=> b!423409 (= e!251653 e!251658)))

(declare-fun res!247534 () Bool)

(assert (=> b!423409 (=> (not res!247534) (not e!251658))))

(assert (=> b!423409 (= res!247534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193982 mask!1025))))

(assert (=> b!423409 (= lt!193982 (array!25816 (store (arr!12357 _keys!709) i!563 k0!794) (size!12710 _keys!709)))))

(declare-fun res!247531 () Bool)

(assert (=> start!39560 (=> (not res!247531) (not e!251653))))

(assert (=> start!39560 (= res!247531 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12710 _keys!709))))))

(assert (=> start!39560 e!251653))

(assert (=> start!39560 tp_is_empty!10993))

(assert (=> start!39560 tp!35051))

(assert (=> start!39560 true))

(declare-fun array_inv!9040 (array!25817) Bool)

(assert (=> start!39560 (and (array_inv!9040 _values!549) e!251657)))

(declare-fun array_inv!9041 (array!25815) Bool)

(assert (=> start!39560 (array_inv!9041 _keys!709)))

(declare-fun mapIsEmpty!18111 () Bool)

(assert (=> mapIsEmpty!18111 mapRes!18111))

(declare-fun b!423410 () Bool)

(declare-fun res!247541 () Bool)

(assert (=> b!423410 (=> (not res!247541) (not e!251653))))

(assert (=> b!423410 (= res!247541 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12710 _keys!709))))))

(declare-fun b!423411 () Bool)

(declare-fun res!247538 () Bool)

(assert (=> b!423411 (=> (not res!247538) (not e!251653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423411 (= res!247538 (validMask!0 mask!1025))))

(declare-fun b!423412 () Bool)

(declare-fun res!247533 () Bool)

(assert (=> b!423412 (=> (not res!247533) (not e!251653))))

(assert (=> b!423412 (= res!247533 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7257))))

(assert (= (and start!39560 res!247531) b!423411))

(assert (= (and b!423411 res!247538) b!423401))

(assert (= (and b!423401 res!247537) b!423408))

(assert (= (and b!423408 res!247542) b!423412))

(assert (= (and b!423412 res!247533) b!423410))

(assert (= (and b!423410 res!247541) b!423403))

(assert (= (and b!423403 res!247539) b!423398))

(assert (= (and b!423398 res!247535) b!423402))

(assert (= (and b!423402 res!247540) b!423409))

(assert (= (and b!423409 res!247534) b!423407))

(assert (= (and b!423407 res!247536) b!423399))

(assert (= (and b!423399 res!247532) b!423406))

(assert (= (and b!423404 condMapEmpty!18111) mapIsEmpty!18111))

(assert (= (and b!423404 (not condMapEmpty!18111)) mapNonEmpty!18111))

(get-info :version)

(assert (= (and mapNonEmpty!18111 ((_ is ValueCellFull!5153) mapValue!18111)) b!423400))

(assert (= (and b!423404 ((_ is ValueCellFull!5153) mapDefault!18111)) b!423405))

(assert (= start!39560 b!423404))

(declare-fun m!412341 () Bool)

(assert (=> b!423412 m!412341))

(declare-fun m!412343 () Bool)

(assert (=> b!423411 m!412343))

(declare-fun m!412345 () Bool)

(assert (=> start!39560 m!412345))

(declare-fun m!412347 () Bool)

(assert (=> start!39560 m!412347))

(declare-fun m!412349 () Bool)

(assert (=> b!423408 m!412349))

(declare-fun m!412351 () Bool)

(assert (=> b!423402 m!412351))

(declare-fun m!412353 () Bool)

(assert (=> mapNonEmpty!18111 m!412353))

(declare-fun m!412355 () Bool)

(assert (=> b!423403 m!412355))

(declare-fun m!412357 () Bool)

(assert (=> b!423407 m!412357))

(declare-fun m!412359 () Bool)

(assert (=> b!423398 m!412359))

(declare-fun m!412361 () Bool)

(assert (=> b!423409 m!412361))

(declare-fun m!412363 () Bool)

(assert (=> b!423409 m!412363))

(declare-fun m!412365 () Bool)

(assert (=> b!423406 m!412365))

(declare-fun m!412367 () Bool)

(assert (=> b!423406 m!412367))

(declare-fun m!412369 () Bool)

(assert (=> b!423406 m!412369))

(check-sat (not b!423409) b_and!17471 (not b!423402) (not start!39560) (not mapNonEmpty!18111) (not b!423403) (not b!423407) (not b!423411) (not b!423408) tp_is_empty!10993 (not b!423412) (not b!423406) (not b_next!9841))
(check-sat b_and!17471 (not b_next!9841))
