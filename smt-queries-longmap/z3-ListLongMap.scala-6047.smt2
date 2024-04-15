; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78184 () Bool)

(assert start!78184)

(declare-fun b_free!16693 () Bool)

(declare-fun b_next!16693 () Bool)

(assert (=> start!78184 (= b_free!16693 (not b_next!16693))))

(declare-fun tp!58356 () Bool)

(declare-fun b_and!27243 () Bool)

(assert (=> start!78184 (= tp!58356 b_and!27243)))

(declare-fun b!912414 () Bool)

(declare-fun e!511788 () Bool)

(assert (=> b!912414 (= e!511788 (not true))))

(declare-datatypes ((array!54217 0))(
  ( (array!54218 (arr!26063 (Array (_ BitVec 32) (_ BitVec 64))) (size!26524 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54217)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912414 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!30447 0))(
  ( (V!30448 (val!9606 Int)) )
))
(declare-datatypes ((ValueCell!9074 0))(
  ( (ValueCellFull!9074 (v!12116 V!30447)) (EmptyCell!9074) )
))
(declare-datatypes ((array!54219 0))(
  ( (array!54220 (arr!26064 (Array (_ BitVec 32) ValueCell!9074)) (size!26525 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54219)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30447)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30447)

(declare-datatypes ((Unit!30810 0))(
  ( (Unit!30811) )
))
(declare-fun lt!410454 () Unit!30810)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lemmaKeyInListMapIsInArray!262 (array!54217 array!54219 (_ BitVec 32) (_ BitVec 32) V!30447 V!30447 (_ BitVec 64) Int) Unit!30810)

(assert (=> b!912414 (= lt!410454 (lemmaKeyInListMapIsInArray!262 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912415 () Bool)

(declare-fun res!615544 () Bool)

(assert (=> b!912415 (=> (not res!615544) (not e!511788))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912415 (= res!615544 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30394 () Bool)

(declare-fun mapRes!30394 () Bool)

(assert (=> mapIsEmpty!30394 mapRes!30394))

(declare-fun mapNonEmpty!30394 () Bool)

(declare-fun tp!58357 () Bool)

(declare-fun e!511786 () Bool)

(assert (=> mapNonEmpty!30394 (= mapRes!30394 (and tp!58357 e!511786))))

(declare-fun mapValue!30394 () ValueCell!9074)

(declare-fun mapRest!30394 () (Array (_ BitVec 32) ValueCell!9074))

(declare-fun mapKey!30394 () (_ BitVec 32))

(assert (=> mapNonEmpty!30394 (= (arr!26064 _values!1152) (store mapRest!30394 mapKey!30394 mapValue!30394))))

(declare-fun b!912416 () Bool)

(declare-fun res!615538 () Bool)

(assert (=> b!912416 (=> (not res!615538) (not e!511788))))

(declare-datatypes ((tuple2!12560 0))(
  ( (tuple2!12561 (_1!6291 (_ BitVec 64)) (_2!6291 V!30447)) )
))
(declare-datatypes ((List!18340 0))(
  ( (Nil!18337) (Cons!18336 (h!19482 tuple2!12560) (t!25920 List!18340)) )
))
(declare-datatypes ((ListLongMap!11247 0))(
  ( (ListLongMap!11248 (toList!5639 List!18340)) )
))
(declare-fun contains!4642 (ListLongMap!11247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2841 (array!54217 array!54219 (_ BitVec 32) (_ BitVec 32) V!30447 V!30447 (_ BitVec 32) Int) ListLongMap!11247)

(assert (=> b!912416 (= res!615538 (contains!4642 (getCurrentListMap!2841 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912417 () Bool)

(declare-fun res!615539 () Bool)

(assert (=> b!912417 (=> (not res!615539) (not e!511788))))

(assert (=> b!912417 (= res!615539 (and (= (size!26525 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26524 _keys!1386) (size!26525 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912418 () Bool)

(declare-fun tp_is_empty!19111 () Bool)

(assert (=> b!912418 (= e!511786 tp_is_empty!19111)))

(declare-fun b!912419 () Bool)

(declare-fun res!615543 () Bool)

(assert (=> b!912419 (=> (not res!615543) (not e!511788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54217 (_ BitVec 32)) Bool)

(assert (=> b!912419 (= res!615543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912420 () Bool)

(declare-fun e!511790 () Bool)

(assert (=> b!912420 (= e!511790 tp_is_empty!19111)))

(declare-fun b!912422 () Bool)

(declare-fun e!511789 () Bool)

(assert (=> b!912422 (= e!511789 (and e!511790 mapRes!30394))))

(declare-fun condMapEmpty!30394 () Bool)

(declare-fun mapDefault!30394 () ValueCell!9074)

(assert (=> b!912422 (= condMapEmpty!30394 (= (arr!26064 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9074)) mapDefault!30394)))))

(declare-fun b!912423 () Bool)

(declare-fun res!615542 () Bool)

(assert (=> b!912423 (=> (not res!615542) (not e!511788))))

(declare-datatypes ((List!18341 0))(
  ( (Nil!18338) (Cons!18337 (h!19483 (_ BitVec 64)) (t!25921 List!18341)) )
))
(declare-fun arrayNoDuplicates!0 (array!54217 (_ BitVec 32) List!18341) Bool)

(assert (=> b!912423 (= res!615542 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18338))))

(declare-fun b!912421 () Bool)

(declare-fun res!615540 () Bool)

(assert (=> b!912421 (=> (not res!615540) (not e!511788))))

(assert (=> b!912421 (= res!615540 (and (= (select (arr!26063 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!615541 () Bool)

(assert (=> start!78184 (=> (not res!615541) (not e!511788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78184 (= res!615541 (validMask!0 mask!1756))))

(assert (=> start!78184 e!511788))

(declare-fun array_inv!20434 (array!54219) Bool)

(assert (=> start!78184 (and (array_inv!20434 _values!1152) e!511789)))

(assert (=> start!78184 tp!58356))

(assert (=> start!78184 true))

(assert (=> start!78184 tp_is_empty!19111))

(declare-fun array_inv!20435 (array!54217) Bool)

(assert (=> start!78184 (array_inv!20435 _keys!1386)))

(assert (= (and start!78184 res!615541) b!912417))

(assert (= (and b!912417 res!615539) b!912419))

(assert (= (and b!912419 res!615543) b!912423))

(assert (= (and b!912423 res!615542) b!912416))

(assert (= (and b!912416 res!615538) b!912415))

(assert (= (and b!912415 res!615544) b!912421))

(assert (= (and b!912421 res!615540) b!912414))

(assert (= (and b!912422 condMapEmpty!30394) mapIsEmpty!30394))

(assert (= (and b!912422 (not condMapEmpty!30394)) mapNonEmpty!30394))

(get-info :version)

(assert (= (and mapNonEmpty!30394 ((_ is ValueCellFull!9074) mapValue!30394)) b!912418))

(assert (= (and b!912422 ((_ is ValueCellFull!9074) mapDefault!30394)) b!912420))

(assert (= start!78184 b!912422))

(declare-fun m!846357 () Bool)

(assert (=> b!912421 m!846357))

(declare-fun m!846359 () Bool)

(assert (=> b!912415 m!846359))

(declare-fun m!846361 () Bool)

(assert (=> start!78184 m!846361))

(declare-fun m!846363 () Bool)

(assert (=> start!78184 m!846363))

(declare-fun m!846365 () Bool)

(assert (=> start!78184 m!846365))

(declare-fun m!846367 () Bool)

(assert (=> mapNonEmpty!30394 m!846367))

(declare-fun m!846369 () Bool)

(assert (=> b!912416 m!846369))

(assert (=> b!912416 m!846369))

(declare-fun m!846371 () Bool)

(assert (=> b!912416 m!846371))

(declare-fun m!846373 () Bool)

(assert (=> b!912423 m!846373))

(declare-fun m!846375 () Bool)

(assert (=> b!912414 m!846375))

(declare-fun m!846377 () Bool)

(assert (=> b!912414 m!846377))

(declare-fun m!846379 () Bool)

(assert (=> b!912419 m!846379))

(check-sat (not b!912419) (not b!912414) (not b!912416) b_and!27243 tp_is_empty!19111 (not b!912423) (not start!78184) (not b!912415) (not b_next!16693) (not mapNonEmpty!30394))
(check-sat b_and!27243 (not b_next!16693))
