; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38432 () Bool)

(assert start!38432)

(declare-fun b!396322 () Bool)

(declare-fun res!227425 () Bool)

(declare-fun e!239796 () Bool)

(assert (=> b!396322 (=> (not res!227425) (not e!239796))))

(declare-datatypes ((array!23627 0))(
  ( (array!23628 (arr!11263 (Array (_ BitVec 32) (_ BitVec 64))) (size!11616 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23627)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23627 (_ BitVec 32)) Bool)

(assert (=> b!396322 (= res!227425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396323 () Bool)

(declare-fun e!239794 () Bool)

(declare-fun tp_is_empty!9865 () Bool)

(assert (=> b!396323 (= e!239794 tp_is_empty!9865)))

(declare-fun b!396324 () Bool)

(declare-fun e!239793 () Bool)

(assert (=> b!396324 (= e!239796 e!239793)))

(declare-fun res!227430 () Bool)

(assert (=> b!396324 (=> (not res!227430) (not e!239793))))

(declare-fun lt!186941 () array!23627)

(assert (=> b!396324 (= res!227430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186941 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396324 (= lt!186941 (array!23628 (store (arr!11263 _keys!709) i!563 k0!794) (size!11616 _keys!709)))))

(declare-fun b!396325 () Bool)

(declare-fun res!227426 () Bool)

(assert (=> b!396325 (=> (not res!227426) (not e!239796))))

(declare-fun arrayContainsKey!0 (array!23627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396325 (= res!227426 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396326 () Bool)

(declare-fun res!227422 () Bool)

(assert (=> b!396326 (=> (not res!227422) (not e!239796))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14259 0))(
  ( (V!14260 (val!4977 Int)) )
))
(declare-datatypes ((ValueCell!4589 0))(
  ( (ValueCellFull!4589 (v!7218 V!14259)) (EmptyCell!4589) )
))
(declare-datatypes ((array!23629 0))(
  ( (array!23630 (arr!11264 (Array (_ BitVec 32) ValueCell!4589)) (size!11617 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23629)

(assert (=> b!396326 (= res!227422 (and (= (size!11617 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11616 _keys!709) (size!11617 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396327 () Bool)

(declare-fun res!227427 () Bool)

(assert (=> b!396327 (=> (not res!227427) (not e!239796))))

(declare-datatypes ((List!6490 0))(
  ( (Nil!6487) (Cons!6486 (h!7342 (_ BitVec 64)) (t!11655 List!6490)) )
))
(declare-fun arrayNoDuplicates!0 (array!23627 (_ BitVec 32) List!6490) Bool)

(assert (=> b!396327 (= res!227427 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6487))))

(declare-fun b!396328 () Bool)

(declare-fun e!239792 () Bool)

(assert (=> b!396328 (= e!239792 tp_is_empty!9865)))

(declare-fun mapIsEmpty!16419 () Bool)

(declare-fun mapRes!16419 () Bool)

(assert (=> mapIsEmpty!16419 mapRes!16419))

(declare-fun b!396330 () Bool)

(declare-fun e!239795 () Bool)

(assert (=> b!396330 (= e!239795 (and e!239792 mapRes!16419))))

(declare-fun condMapEmpty!16419 () Bool)

(declare-fun mapDefault!16419 () ValueCell!4589)

(assert (=> b!396330 (= condMapEmpty!16419 (= (arr!11264 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4589)) mapDefault!16419)))))

(declare-fun b!396331 () Bool)

(assert (=> b!396331 (= e!239793 false)))

(declare-fun lt!186940 () Bool)

(assert (=> b!396331 (= lt!186940 (arrayNoDuplicates!0 lt!186941 #b00000000000000000000000000000000 Nil!6487))))

(declare-fun b!396332 () Bool)

(declare-fun res!227421 () Bool)

(assert (=> b!396332 (=> (not res!227421) (not e!239796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396332 (= res!227421 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16419 () Bool)

(declare-fun tp!32214 () Bool)

(assert (=> mapNonEmpty!16419 (= mapRes!16419 (and tp!32214 e!239794))))

(declare-fun mapValue!16419 () ValueCell!4589)

(declare-fun mapRest!16419 () (Array (_ BitVec 32) ValueCell!4589))

(declare-fun mapKey!16419 () (_ BitVec 32))

(assert (=> mapNonEmpty!16419 (= (arr!11264 _values!549) (store mapRest!16419 mapKey!16419 mapValue!16419))))

(declare-fun b!396333 () Bool)

(declare-fun res!227423 () Bool)

(assert (=> b!396333 (=> (not res!227423) (not e!239796))))

(assert (=> b!396333 (= res!227423 (or (= (select (arr!11263 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11263 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396334 () Bool)

(declare-fun res!227428 () Bool)

(assert (=> b!396334 (=> (not res!227428) (not e!239796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396334 (= res!227428 (validKeyInArray!0 k0!794))))

(declare-fun b!396329 () Bool)

(declare-fun res!227429 () Bool)

(assert (=> b!396329 (=> (not res!227429) (not e!239796))))

(assert (=> b!396329 (= res!227429 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11616 _keys!709))))))

(declare-fun res!227424 () Bool)

(assert (=> start!38432 (=> (not res!227424) (not e!239796))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38432 (= res!227424 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11616 _keys!709))))))

(assert (=> start!38432 e!239796))

(assert (=> start!38432 true))

(declare-fun array_inv!8264 (array!23629) Bool)

(assert (=> start!38432 (and (array_inv!8264 _values!549) e!239795)))

(declare-fun array_inv!8265 (array!23627) Bool)

(assert (=> start!38432 (array_inv!8265 _keys!709)))

(assert (= (and start!38432 res!227424) b!396332))

(assert (= (and b!396332 res!227421) b!396326))

(assert (= (and b!396326 res!227422) b!396322))

(assert (= (and b!396322 res!227425) b!396327))

(assert (= (and b!396327 res!227427) b!396329))

(assert (= (and b!396329 res!227429) b!396334))

(assert (= (and b!396334 res!227428) b!396333))

(assert (= (and b!396333 res!227423) b!396325))

(assert (= (and b!396325 res!227426) b!396324))

(assert (= (and b!396324 res!227430) b!396331))

(assert (= (and b!396330 condMapEmpty!16419) mapIsEmpty!16419))

(assert (= (and b!396330 (not condMapEmpty!16419)) mapNonEmpty!16419))

(get-info :version)

(assert (= (and mapNonEmpty!16419 ((_ is ValueCellFull!4589) mapValue!16419)) b!396323))

(assert (= (and b!396330 ((_ is ValueCellFull!4589) mapDefault!16419)) b!396328))

(assert (= start!38432 b!396330))

(declare-fun m!391443 () Bool)

(assert (=> b!396324 m!391443))

(declare-fun m!391445 () Bool)

(assert (=> b!396324 m!391445))

(declare-fun m!391447 () Bool)

(assert (=> b!396331 m!391447))

(declare-fun m!391449 () Bool)

(assert (=> b!396332 m!391449))

(declare-fun m!391451 () Bool)

(assert (=> b!396327 m!391451))

(declare-fun m!391453 () Bool)

(assert (=> b!396333 m!391453))

(declare-fun m!391455 () Bool)

(assert (=> b!396334 m!391455))

(declare-fun m!391457 () Bool)

(assert (=> mapNonEmpty!16419 m!391457))

(declare-fun m!391459 () Bool)

(assert (=> b!396322 m!391459))

(declare-fun m!391461 () Bool)

(assert (=> start!38432 m!391461))

(declare-fun m!391463 () Bool)

(assert (=> start!38432 m!391463))

(declare-fun m!391465 () Bool)

(assert (=> b!396325 m!391465))

(check-sat (not b!396322) tp_is_empty!9865 (not b!396331) (not b!396325) (not mapNonEmpty!16419) (not b!396334) (not b!396324) (not start!38432) (not b!396332) (not b!396327))
(check-sat)
