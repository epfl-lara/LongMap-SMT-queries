; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39644 () Bool)

(assert start!39644)

(declare-fun b_free!9925 () Bool)

(declare-fun b_next!9925 () Bool)

(assert (=> start!39644 (= b_free!9925 (not b_next!9925))))

(declare-fun tp!35303 () Bool)

(declare-fun b_and!17555 () Bool)

(assert (=> start!39644 (= tp!35303 b_and!17555)))

(declare-fun b!425344 () Bool)

(declare-fun res!249107 () Bool)

(declare-fun e!252468 () Bool)

(assert (=> b!425344 (=> (not res!249107) (not e!252468))))

(declare-datatypes ((array!25983 0))(
  ( (array!25984 (arr!12441 (Array (_ BitVec 32) (_ BitVec 64))) (size!12794 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25983)

(declare-datatypes ((List!7327 0))(
  ( (Nil!7324) (Cons!7323 (h!8179 (_ BitVec 64)) (t!12762 List!7327)) )
))
(declare-fun arrayNoDuplicates!0 (array!25983 (_ BitVec 32) List!7327) Bool)

(assert (=> b!425344 (= res!249107 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7324))))

(declare-fun b!425345 () Bool)

(declare-fun e!252467 () Bool)

(assert (=> b!425345 (= e!252467 (not true))))

(declare-datatypes ((V!15875 0))(
  ( (V!15876 (val!5583 Int)) )
))
(declare-fun minValue!515 () V!15875)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5195 0))(
  ( (ValueCellFull!5195 (v!7824 V!15875)) (EmptyCell!5195) )
))
(declare-datatypes ((array!25985 0))(
  ( (array!25986 (arr!12442 (Array (_ BitVec 32) ValueCell!5195)) (size!12795 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25985)

(declare-fun zeroValue!515 () V!15875)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!194470 () array!25985)

(declare-fun v!412 () V!15875)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!194473 () array!25983)

(declare-datatypes ((tuple2!7328 0))(
  ( (tuple2!7329 (_1!3675 (_ BitVec 64)) (_2!3675 V!15875)) )
))
(declare-datatypes ((List!7328 0))(
  ( (Nil!7325) (Cons!7324 (h!8180 tuple2!7328) (t!12763 List!7328)) )
))
(declare-datatypes ((ListLongMap!6231 0))(
  ( (ListLongMap!6232 (toList!3131 List!7328)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1339 (array!25983 array!25985 (_ BitVec 32) (_ BitVec 32) V!15875 V!15875 (_ BitVec 32) Int) ListLongMap!6231)

(declare-fun +!1313 (ListLongMap!6231 tuple2!7328) ListLongMap!6231)

(assert (=> b!425345 (= (getCurrentListMapNoExtraKeys!1339 lt!194473 lt!194470 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1313 (getCurrentListMapNoExtraKeys!1339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7329 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12472 0))(
  ( (Unit!12473) )
))
(declare-fun lt!194471 () Unit!12472)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!484 (array!25983 array!25985 (_ BitVec 32) (_ BitVec 32) V!15875 V!15875 (_ BitVec 32) (_ BitVec 64) V!15875 (_ BitVec 32) Int) Unit!12472)

(assert (=> b!425345 (= lt!194471 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!484 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425347 () Bool)

(declare-fun res!249101 () Bool)

(declare-fun e!252465 () Bool)

(assert (=> b!425347 (=> (not res!249101) (not e!252465))))

(assert (=> b!425347 (= res!249101 (bvsle from!863 i!563))))

(declare-fun b!425348 () Bool)

(declare-fun e!252471 () Bool)

(declare-fun tp_is_empty!11077 () Bool)

(assert (=> b!425348 (= e!252471 tp_is_empty!11077)))

(declare-fun b!425349 () Bool)

(declare-fun e!252470 () Bool)

(declare-fun mapRes!18237 () Bool)

(assert (=> b!425349 (= e!252470 (and e!252471 mapRes!18237))))

(declare-fun condMapEmpty!18237 () Bool)

(declare-fun mapDefault!18237 () ValueCell!5195)

(assert (=> b!425349 (= condMapEmpty!18237 (= (arr!12442 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5195)) mapDefault!18237)))))

(declare-fun b!425350 () Bool)

(declare-fun res!249103 () Bool)

(assert (=> b!425350 (=> (not res!249103) (not e!252468))))

(assert (=> b!425350 (= res!249103 (or (= (select (arr!12441 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12441 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425351 () Bool)

(declare-fun res!249110 () Bool)

(assert (=> b!425351 (=> (not res!249110) (not e!252468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425351 (= res!249110 (validKeyInArray!0 k0!794))))

(declare-fun b!425352 () Bool)

(declare-fun res!249111 () Bool)

(assert (=> b!425352 (=> (not res!249111) (not e!252468))))

(declare-fun arrayContainsKey!0 (array!25983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425352 (= res!249111 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425353 () Bool)

(declare-fun e!252466 () Bool)

(assert (=> b!425353 (= e!252466 tp_is_empty!11077)))

(declare-fun b!425346 () Bool)

(declare-fun res!249102 () Bool)

(assert (=> b!425346 (=> (not res!249102) (not e!252468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425346 (= res!249102 (validMask!0 mask!1025))))

(declare-fun res!249106 () Bool)

(assert (=> start!39644 (=> (not res!249106) (not e!252468))))

(assert (=> start!39644 (= res!249106 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12794 _keys!709))))))

(assert (=> start!39644 e!252468))

(assert (=> start!39644 tp_is_empty!11077))

(assert (=> start!39644 tp!35303))

(assert (=> start!39644 true))

(declare-fun array_inv!9100 (array!25985) Bool)

(assert (=> start!39644 (and (array_inv!9100 _values!549) e!252470)))

(declare-fun array_inv!9101 (array!25983) Bool)

(assert (=> start!39644 (array_inv!9101 _keys!709)))

(declare-fun b!425354 () Bool)

(declare-fun res!249108 () Bool)

(assert (=> b!425354 (=> (not res!249108) (not e!252468))))

(assert (=> b!425354 (= res!249108 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12794 _keys!709))))))

(declare-fun mapNonEmpty!18237 () Bool)

(declare-fun tp!35304 () Bool)

(assert (=> mapNonEmpty!18237 (= mapRes!18237 (and tp!35304 e!252466))))

(declare-fun mapKey!18237 () (_ BitVec 32))

(declare-fun mapRest!18237 () (Array (_ BitVec 32) ValueCell!5195))

(declare-fun mapValue!18237 () ValueCell!5195)

(assert (=> mapNonEmpty!18237 (= (arr!12442 _values!549) (store mapRest!18237 mapKey!18237 mapValue!18237))))

(declare-fun b!425355 () Bool)

(declare-fun res!249100 () Bool)

(assert (=> b!425355 (=> (not res!249100) (not e!252465))))

(assert (=> b!425355 (= res!249100 (arrayNoDuplicates!0 lt!194473 #b00000000000000000000000000000000 Nil!7324))))

(declare-fun b!425356 () Bool)

(assert (=> b!425356 (= e!252465 e!252467)))

(declare-fun res!249099 () Bool)

(assert (=> b!425356 (=> (not res!249099) (not e!252467))))

(assert (=> b!425356 (= res!249099 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194474 () ListLongMap!6231)

(assert (=> b!425356 (= lt!194474 (getCurrentListMapNoExtraKeys!1339 lt!194473 lt!194470 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425356 (= lt!194470 (array!25986 (store (arr!12442 _values!549) i!563 (ValueCellFull!5195 v!412)) (size!12795 _values!549)))))

(declare-fun lt!194472 () ListLongMap!6231)

(assert (=> b!425356 (= lt!194472 (getCurrentListMapNoExtraKeys!1339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425357 () Bool)

(declare-fun res!249104 () Bool)

(assert (=> b!425357 (=> (not res!249104) (not e!252468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25983 (_ BitVec 32)) Bool)

(assert (=> b!425357 (= res!249104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425358 () Bool)

(declare-fun res!249109 () Bool)

(assert (=> b!425358 (=> (not res!249109) (not e!252468))))

(assert (=> b!425358 (= res!249109 (and (= (size!12795 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12794 _keys!709) (size!12795 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425359 () Bool)

(assert (=> b!425359 (= e!252468 e!252465)))

(declare-fun res!249105 () Bool)

(assert (=> b!425359 (=> (not res!249105) (not e!252465))))

(assert (=> b!425359 (= res!249105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194473 mask!1025))))

(assert (=> b!425359 (= lt!194473 (array!25984 (store (arr!12441 _keys!709) i!563 k0!794) (size!12794 _keys!709)))))

(declare-fun mapIsEmpty!18237 () Bool)

(assert (=> mapIsEmpty!18237 mapRes!18237))

(assert (= (and start!39644 res!249106) b!425346))

(assert (= (and b!425346 res!249102) b!425358))

(assert (= (and b!425358 res!249109) b!425357))

(assert (= (and b!425357 res!249104) b!425344))

(assert (= (and b!425344 res!249107) b!425354))

(assert (= (and b!425354 res!249108) b!425351))

(assert (= (and b!425351 res!249110) b!425350))

(assert (= (and b!425350 res!249103) b!425352))

(assert (= (and b!425352 res!249111) b!425359))

(assert (= (and b!425359 res!249105) b!425355))

(assert (= (and b!425355 res!249100) b!425347))

(assert (= (and b!425347 res!249101) b!425356))

(assert (= (and b!425356 res!249099) b!425345))

(assert (= (and b!425349 condMapEmpty!18237) mapIsEmpty!18237))

(assert (= (and b!425349 (not condMapEmpty!18237)) mapNonEmpty!18237))

(get-info :version)

(assert (= (and mapNonEmpty!18237 ((_ is ValueCellFull!5195) mapValue!18237)) b!425353))

(assert (= (and b!425349 ((_ is ValueCellFull!5195) mapDefault!18237)) b!425348))

(assert (= start!39644 b!425349))

(declare-fun m!413745 () Bool)

(assert (=> b!425355 m!413745))

(declare-fun m!413747 () Bool)

(assert (=> b!425350 m!413747))

(declare-fun m!413749 () Bool)

(assert (=> b!425351 m!413749))

(declare-fun m!413751 () Bool)

(assert (=> b!425345 m!413751))

(declare-fun m!413753 () Bool)

(assert (=> b!425345 m!413753))

(assert (=> b!425345 m!413753))

(declare-fun m!413755 () Bool)

(assert (=> b!425345 m!413755))

(declare-fun m!413757 () Bool)

(assert (=> b!425345 m!413757))

(declare-fun m!413759 () Bool)

(assert (=> b!425352 m!413759))

(declare-fun m!413761 () Bool)

(assert (=> b!425356 m!413761))

(declare-fun m!413763 () Bool)

(assert (=> b!425356 m!413763))

(declare-fun m!413765 () Bool)

(assert (=> b!425356 m!413765))

(declare-fun m!413767 () Bool)

(assert (=> b!425359 m!413767))

(declare-fun m!413769 () Bool)

(assert (=> b!425359 m!413769))

(declare-fun m!413771 () Bool)

(assert (=> mapNonEmpty!18237 m!413771))

(declare-fun m!413773 () Bool)

(assert (=> b!425344 m!413773))

(declare-fun m!413775 () Bool)

(assert (=> b!425346 m!413775))

(declare-fun m!413777 () Bool)

(assert (=> start!39644 m!413777))

(declare-fun m!413779 () Bool)

(assert (=> start!39644 m!413779))

(declare-fun m!413781 () Bool)

(assert (=> b!425357 m!413781))

(check-sat (not b!425355) (not b!425359) (not b!425351) (not b_next!9925) (not b!425344) (not b!425356) (not b!425352) (not b!425346) b_and!17555 tp_is_empty!11077 (not b!425345) (not start!39644) (not mapNonEmpty!18237) (not b!425357))
(check-sat b_and!17555 (not b_next!9925))
