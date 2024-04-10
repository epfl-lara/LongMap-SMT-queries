; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40414 () Bool)

(assert start!40414)

(declare-fun b!444419 () Bool)

(declare-fun res!263521 () Bool)

(declare-fun e!261367 () Bool)

(assert (=> b!444419 (=> (not res!263521) (not e!261367))))

(declare-datatypes ((array!27407 0))(
  ( (array!27408 (arr!13151 (Array (_ BitVec 32) (_ BitVec 64))) (size!13503 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27407)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16837 0))(
  ( (V!16838 (val!5944 Int)) )
))
(declare-datatypes ((ValueCell!5556 0))(
  ( (ValueCellFull!5556 (v!8195 V!16837)) (EmptyCell!5556) )
))
(declare-datatypes ((array!27409 0))(
  ( (array!27410 (arr!13152 (Array (_ BitVec 32) ValueCell!5556)) (size!13504 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27409)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444419 (= res!263521 (and (= (size!13504 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13503 _keys!709) (size!13504 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444420 () Bool)

(declare-fun res!263529 () Bool)

(assert (=> b!444420 (=> (not res!263529) (not e!261367))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444420 (= res!263529 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13503 _keys!709))))))

(declare-fun mapIsEmpty!19326 () Bool)

(declare-fun mapRes!19326 () Bool)

(assert (=> mapIsEmpty!19326 mapRes!19326))

(declare-fun b!444421 () Bool)

(declare-fun e!261366 () Bool)

(declare-fun tp_is_empty!11799 () Bool)

(assert (=> b!444421 (= e!261366 tp_is_empty!11799)))

(declare-fun b!444422 () Bool)

(declare-fun res!263522 () Bool)

(assert (=> b!444422 (=> (not res!263522) (not e!261367))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444422 (= res!263522 (validKeyInArray!0 k0!794))))

(declare-fun b!444424 () Bool)

(declare-fun e!261364 () Bool)

(assert (=> b!444424 (= e!261367 e!261364)))

(declare-fun res!263527 () Bool)

(assert (=> b!444424 (=> (not res!263527) (not e!261364))))

(declare-fun lt!203488 () array!27407)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27407 (_ BitVec 32)) Bool)

(assert (=> b!444424 (= res!263527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203488 mask!1025))))

(assert (=> b!444424 (= lt!203488 (array!27408 (store (arr!13151 _keys!709) i!563 k0!794) (size!13503 _keys!709)))))

(declare-fun b!444425 () Bool)

(declare-fun res!263528 () Bool)

(assert (=> b!444425 (=> (not res!263528) (not e!261367))))

(assert (=> b!444425 (= res!263528 (or (= (select (arr!13151 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13151 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444426 () Bool)

(declare-fun res!263525 () Bool)

(assert (=> b!444426 (=> (not res!263525) (not e!261367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444426 (= res!263525 (validMask!0 mask!1025))))

(declare-fun b!444427 () Bool)

(declare-fun res!263524 () Bool)

(assert (=> b!444427 (=> (not res!263524) (not e!261367))))

(declare-datatypes ((List!7873 0))(
  ( (Nil!7870) (Cons!7869 (h!8725 (_ BitVec 64)) (t!13631 List!7873)) )
))
(declare-fun arrayNoDuplicates!0 (array!27407 (_ BitVec 32) List!7873) Bool)

(assert (=> b!444427 (= res!263524 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7870))))

(declare-fun b!444428 () Bool)

(declare-fun e!261363 () Bool)

(assert (=> b!444428 (= e!261363 (and e!261366 mapRes!19326))))

(declare-fun condMapEmpty!19326 () Bool)

(declare-fun mapDefault!19326 () ValueCell!5556)

(assert (=> b!444428 (= condMapEmpty!19326 (= (arr!13152 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5556)) mapDefault!19326)))))

(declare-fun b!444429 () Bool)

(declare-fun e!261365 () Bool)

(assert (=> b!444429 (= e!261365 tp_is_empty!11799)))

(declare-fun b!444430 () Bool)

(declare-fun res!263523 () Bool)

(assert (=> b!444430 (=> (not res!263523) (not e!261367))))

(assert (=> b!444430 (= res!263523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!263530 () Bool)

(assert (=> start!40414 (=> (not res!263530) (not e!261367))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40414 (= res!263530 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13503 _keys!709))))))

(assert (=> start!40414 e!261367))

(assert (=> start!40414 true))

(declare-fun array_inv!9540 (array!27409) Bool)

(assert (=> start!40414 (and (array_inv!9540 _values!549) e!261363)))

(declare-fun array_inv!9541 (array!27407) Bool)

(assert (=> start!40414 (array_inv!9541 _keys!709)))

(declare-fun b!444423 () Bool)

(declare-fun res!263526 () Bool)

(assert (=> b!444423 (=> (not res!263526) (not e!261367))))

(declare-fun arrayContainsKey!0 (array!27407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444423 (= res!263526 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19326 () Bool)

(declare-fun tp!37308 () Bool)

(assert (=> mapNonEmpty!19326 (= mapRes!19326 (and tp!37308 e!261365))))

(declare-fun mapRest!19326 () (Array (_ BitVec 32) ValueCell!5556))

(declare-fun mapKey!19326 () (_ BitVec 32))

(declare-fun mapValue!19326 () ValueCell!5556)

(assert (=> mapNonEmpty!19326 (= (arr!13152 _values!549) (store mapRest!19326 mapKey!19326 mapValue!19326))))

(declare-fun b!444431 () Bool)

(assert (=> b!444431 (= e!261364 false)))

(declare-fun lt!203489 () Bool)

(assert (=> b!444431 (= lt!203489 (arrayNoDuplicates!0 lt!203488 #b00000000000000000000000000000000 Nil!7870))))

(assert (= (and start!40414 res!263530) b!444426))

(assert (= (and b!444426 res!263525) b!444419))

(assert (= (and b!444419 res!263521) b!444430))

(assert (= (and b!444430 res!263523) b!444427))

(assert (= (and b!444427 res!263524) b!444420))

(assert (= (and b!444420 res!263529) b!444422))

(assert (= (and b!444422 res!263522) b!444425))

(assert (= (and b!444425 res!263528) b!444423))

(assert (= (and b!444423 res!263526) b!444424))

(assert (= (and b!444424 res!263527) b!444431))

(assert (= (and b!444428 condMapEmpty!19326) mapIsEmpty!19326))

(assert (= (and b!444428 (not condMapEmpty!19326)) mapNonEmpty!19326))

(get-info :version)

(assert (= (and mapNonEmpty!19326 ((_ is ValueCellFull!5556) mapValue!19326)) b!444429))

(assert (= (and b!444428 ((_ is ValueCellFull!5556) mapDefault!19326)) b!444421))

(assert (= start!40414 b!444428))

(declare-fun m!430309 () Bool)

(assert (=> b!444424 m!430309))

(declare-fun m!430311 () Bool)

(assert (=> b!444424 m!430311))

(declare-fun m!430313 () Bool)

(assert (=> start!40414 m!430313))

(declare-fun m!430315 () Bool)

(assert (=> start!40414 m!430315))

(declare-fun m!430317 () Bool)

(assert (=> b!444426 m!430317))

(declare-fun m!430319 () Bool)

(assert (=> b!444423 m!430319))

(declare-fun m!430321 () Bool)

(assert (=> b!444425 m!430321))

(declare-fun m!430323 () Bool)

(assert (=> mapNonEmpty!19326 m!430323))

(declare-fun m!430325 () Bool)

(assert (=> b!444431 m!430325))

(declare-fun m!430327 () Bool)

(assert (=> b!444427 m!430327))

(declare-fun m!430329 () Bool)

(assert (=> b!444430 m!430329))

(declare-fun m!430331 () Bool)

(assert (=> b!444422 m!430331))

(check-sat (not b!444423) (not mapNonEmpty!19326) (not b!444431) (not b!444422) (not b!444424) (not b!444427) tp_is_empty!11799 (not start!40414) (not b!444426) (not b!444430))
(check-sat)
