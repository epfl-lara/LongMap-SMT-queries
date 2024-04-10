; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38346 () Bool)

(assert start!38346)

(declare-fun b!395455 () Bool)

(declare-fun res!226712 () Bool)

(declare-fun e!239421 () Bool)

(assert (=> b!395455 (=> (not res!226712) (not e!239421))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395455 (= res!226712 (validKeyInArray!0 k0!794))))

(declare-fun b!395456 () Bool)

(declare-fun res!226718 () Bool)

(assert (=> b!395456 (=> (not res!226718) (not e!239421))))

(declare-datatypes ((array!23533 0))(
  ( (array!23534 (arr!11219 (Array (_ BitVec 32) (_ BitVec 64))) (size!11571 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23533)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395456 (= res!226718 (or (= (select (arr!11219 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11219 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395457 () Bool)

(declare-fun res!226719 () Bool)

(assert (=> b!395457 (=> (not res!226719) (not e!239421))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14189 0))(
  ( (V!14190 (val!4951 Int)) )
))
(declare-datatypes ((ValueCell!4563 0))(
  ( (ValueCellFull!4563 (v!7197 V!14189)) (EmptyCell!4563) )
))
(declare-datatypes ((array!23535 0))(
  ( (array!23536 (arr!11220 (Array (_ BitVec 32) ValueCell!4563)) (size!11572 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23535)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395457 (= res!226719 (and (= (size!11572 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11571 _keys!709) (size!11572 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395458 () Bool)

(declare-fun e!239420 () Bool)

(declare-fun e!239419 () Bool)

(declare-fun mapRes!16332 () Bool)

(assert (=> b!395458 (= e!239420 (and e!239419 mapRes!16332))))

(declare-fun condMapEmpty!16332 () Bool)

(declare-fun mapDefault!16332 () ValueCell!4563)

(assert (=> b!395458 (= condMapEmpty!16332 (= (arr!11220 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4563)) mapDefault!16332)))))

(declare-fun b!395459 () Bool)

(declare-fun res!226713 () Bool)

(assert (=> b!395459 (=> (not res!226713) (not e!239421))))

(declare-datatypes ((List!6511 0))(
  ( (Nil!6508) (Cons!6507 (h!7363 (_ BitVec 64)) (t!11685 List!6511)) )
))
(declare-fun arrayNoDuplicates!0 (array!23533 (_ BitVec 32) List!6511) Bool)

(assert (=> b!395459 (= res!226713 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6508))))

(declare-fun b!395460 () Bool)

(declare-fun res!226714 () Bool)

(assert (=> b!395460 (=> (not res!226714) (not e!239421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23533 (_ BitVec 32)) Bool)

(assert (=> b!395460 (= res!226714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395461 () Bool)

(declare-fun e!239422 () Bool)

(declare-fun tp_is_empty!9813 () Bool)

(assert (=> b!395461 (= e!239422 tp_is_empty!9813)))

(declare-fun b!395462 () Bool)

(declare-fun res!226717 () Bool)

(assert (=> b!395462 (=> (not res!226717) (not e!239421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395462 (= res!226717 (validMask!0 mask!1025))))

(declare-fun b!395463 () Bool)

(declare-fun res!226715 () Bool)

(assert (=> b!395463 (=> (not res!226715) (not e!239421))))

(declare-fun arrayContainsKey!0 (array!23533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395463 (= res!226715 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!226720 () Bool)

(assert (=> start!38346 (=> (not res!226720) (not e!239421))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38346 (= res!226720 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11571 _keys!709))))))

(assert (=> start!38346 e!239421))

(assert (=> start!38346 true))

(declare-fun array_inv!8236 (array!23535) Bool)

(assert (=> start!38346 (and (array_inv!8236 _values!549) e!239420)))

(declare-fun array_inv!8237 (array!23533) Bool)

(assert (=> start!38346 (array_inv!8237 _keys!709)))

(declare-fun mapIsEmpty!16332 () Bool)

(assert (=> mapIsEmpty!16332 mapRes!16332))

(declare-fun mapNonEmpty!16332 () Bool)

(declare-fun tp!32127 () Bool)

(assert (=> mapNonEmpty!16332 (= mapRes!16332 (and tp!32127 e!239422))))

(declare-fun mapRest!16332 () (Array (_ BitVec 32) ValueCell!4563))

(declare-fun mapKey!16332 () (_ BitVec 32))

(declare-fun mapValue!16332 () ValueCell!4563)

(assert (=> mapNonEmpty!16332 (= (arr!11220 _values!549) (store mapRest!16332 mapKey!16332 mapValue!16332))))

(declare-fun b!395464 () Bool)

(declare-fun res!226716 () Bool)

(assert (=> b!395464 (=> (not res!226716) (not e!239421))))

(assert (=> b!395464 (= res!226716 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11571 _keys!709))))))

(declare-fun b!395465 () Bool)

(assert (=> b!395465 (= e!239419 tp_is_empty!9813)))

(declare-fun b!395466 () Bool)

(assert (=> b!395466 (= e!239421 (not (= (size!11571 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025))))))

(assert (= (and start!38346 res!226720) b!395462))

(assert (= (and b!395462 res!226717) b!395457))

(assert (= (and b!395457 res!226719) b!395460))

(assert (= (and b!395460 res!226714) b!395459))

(assert (= (and b!395459 res!226713) b!395464))

(assert (= (and b!395464 res!226716) b!395455))

(assert (= (and b!395455 res!226712) b!395456))

(assert (= (and b!395456 res!226718) b!395463))

(assert (= (and b!395463 res!226715) b!395466))

(assert (= (and b!395458 condMapEmpty!16332) mapIsEmpty!16332))

(assert (= (and b!395458 (not condMapEmpty!16332)) mapNonEmpty!16332))

(get-info :version)

(assert (= (and mapNonEmpty!16332 ((_ is ValueCellFull!4563) mapValue!16332)) b!395461))

(assert (= (and b!395458 ((_ is ValueCellFull!4563) mapDefault!16332)) b!395465))

(assert (= start!38346 b!395458))

(declare-fun m!391495 () Bool)

(assert (=> start!38346 m!391495))

(declare-fun m!391497 () Bool)

(assert (=> start!38346 m!391497))

(declare-fun m!391499 () Bool)

(assert (=> b!395459 m!391499))

(declare-fun m!391501 () Bool)

(assert (=> b!395456 m!391501))

(declare-fun m!391503 () Bool)

(assert (=> mapNonEmpty!16332 m!391503))

(declare-fun m!391505 () Bool)

(assert (=> b!395463 m!391505))

(declare-fun m!391507 () Bool)

(assert (=> b!395455 m!391507))

(declare-fun m!391509 () Bool)

(assert (=> b!395462 m!391509))

(declare-fun m!391511 () Bool)

(assert (=> b!395460 m!391511))

(check-sat (not b!395462) (not b!395460) (not b!395459) (not mapNonEmpty!16332) tp_is_empty!9813 (not b!395463) (not b!395455) (not start!38346))
(check-sat)
