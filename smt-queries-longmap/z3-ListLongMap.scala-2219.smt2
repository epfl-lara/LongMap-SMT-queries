; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36762 () Bool)

(assert start!36762)

(declare-fun b!367133 () Bool)

(declare-fun res!205529 () Bool)

(declare-fun e!224708 () Bool)

(assert (=> b!367133 (=> (not res!205529) (not e!224708))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12507 0))(
  ( (V!12508 (val!4320 Int)) )
))
(declare-datatypes ((ValueCell!3932 0))(
  ( (ValueCellFull!3932 (v!6518 V!12507)) (EmptyCell!3932) )
))
(declare-datatypes ((array!21044 0))(
  ( (array!21045 (arr!9990 (Array (_ BitVec 32) ValueCell!3932)) (size!10342 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21044)

(declare-datatypes ((array!21046 0))(
  ( (array!21047 (arr!9991 (Array (_ BitVec 32) (_ BitVec 64))) (size!10343 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21046)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367133 (= res!205529 (and (= (size!10342 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10343 _keys!658) (size!10342 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367134 () Bool)

(declare-fun res!205521 () Bool)

(assert (=> b!367134 (=> (not res!205521) (not e!224708))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367134 (= res!205521 (validKeyInArray!0 k0!778))))

(declare-fun b!367135 () Bool)

(declare-fun res!205523 () Bool)

(assert (=> b!367135 (=> (not res!205523) (not e!224708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21046 (_ BitVec 32)) Bool)

(assert (=> b!367135 (= res!205523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367136 () Bool)

(declare-fun res!205527 () Bool)

(assert (=> b!367136 (=> (not res!205527) (not e!224708))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367136 (= res!205527 (or (= (select (arr!9991 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9991 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14391 () Bool)

(declare-fun mapRes!14391 () Bool)

(declare-fun tp!28467 () Bool)

(declare-fun e!224706 () Bool)

(assert (=> mapNonEmpty!14391 (= mapRes!14391 (and tp!28467 e!224706))))

(declare-fun mapValue!14391 () ValueCell!3932)

(declare-fun mapKey!14391 () (_ BitVec 32))

(declare-fun mapRest!14391 () (Array (_ BitVec 32) ValueCell!3932))

(assert (=> mapNonEmpty!14391 (= (arr!9990 _values!506) (store mapRest!14391 mapKey!14391 mapValue!14391))))

(declare-fun b!367137 () Bool)

(declare-fun e!224707 () Bool)

(assert (=> b!367137 (= e!224707 false)))

(declare-fun lt!169360 () Bool)

(declare-fun lt!169359 () array!21046)

(declare-datatypes ((List!5469 0))(
  ( (Nil!5466) (Cons!5465 (h!6321 (_ BitVec 64)) (t!10611 List!5469)) )
))
(declare-fun arrayNoDuplicates!0 (array!21046 (_ BitVec 32) List!5469) Bool)

(assert (=> b!367137 (= lt!169360 (arrayNoDuplicates!0 lt!169359 #b00000000000000000000000000000000 Nil!5466))))

(declare-fun b!367138 () Bool)

(declare-fun res!205526 () Bool)

(assert (=> b!367138 (=> (not res!205526) (not e!224708))))

(assert (=> b!367138 (= res!205526 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10343 _keys!658))))))

(declare-fun b!367139 () Bool)

(declare-fun res!205525 () Bool)

(assert (=> b!367139 (=> (not res!205525) (not e!224708))))

(assert (=> b!367139 (= res!205525 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5466))))

(declare-fun res!205522 () Bool)

(assert (=> start!36762 (=> (not res!205522) (not e!224708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36762 (= res!205522 (validMask!0 mask!970))))

(assert (=> start!36762 e!224708))

(assert (=> start!36762 true))

(declare-fun e!224705 () Bool)

(declare-fun array_inv!7426 (array!21044) Bool)

(assert (=> start!36762 (and (array_inv!7426 _values!506) e!224705)))

(declare-fun array_inv!7427 (array!21046) Bool)

(assert (=> start!36762 (array_inv!7427 _keys!658)))

(declare-fun mapIsEmpty!14391 () Bool)

(assert (=> mapIsEmpty!14391 mapRes!14391))

(declare-fun b!367140 () Bool)

(declare-fun e!224709 () Bool)

(declare-fun tp_is_empty!8551 () Bool)

(assert (=> b!367140 (= e!224709 tp_is_empty!8551)))

(declare-fun b!367141 () Bool)

(assert (=> b!367141 (= e!224708 e!224707)))

(declare-fun res!205528 () Bool)

(assert (=> b!367141 (=> (not res!205528) (not e!224707))))

(assert (=> b!367141 (= res!205528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169359 mask!970))))

(assert (=> b!367141 (= lt!169359 (array!21047 (store (arr!9991 _keys!658) i!548 k0!778) (size!10343 _keys!658)))))

(declare-fun b!367142 () Bool)

(assert (=> b!367142 (= e!224706 tp_is_empty!8551)))

(declare-fun b!367143 () Bool)

(declare-fun res!205524 () Bool)

(assert (=> b!367143 (=> (not res!205524) (not e!224708))))

(declare-fun arrayContainsKey!0 (array!21046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367143 (= res!205524 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367144 () Bool)

(assert (=> b!367144 (= e!224705 (and e!224709 mapRes!14391))))

(declare-fun condMapEmpty!14391 () Bool)

(declare-fun mapDefault!14391 () ValueCell!3932)

(assert (=> b!367144 (= condMapEmpty!14391 (= (arr!9990 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3932)) mapDefault!14391)))))

(assert (= (and start!36762 res!205522) b!367133))

(assert (= (and b!367133 res!205529) b!367135))

(assert (= (and b!367135 res!205523) b!367139))

(assert (= (and b!367139 res!205525) b!367138))

(assert (= (and b!367138 res!205526) b!367134))

(assert (= (and b!367134 res!205521) b!367136))

(assert (= (and b!367136 res!205527) b!367143))

(assert (= (and b!367143 res!205524) b!367141))

(assert (= (and b!367141 res!205528) b!367137))

(assert (= (and b!367144 condMapEmpty!14391) mapIsEmpty!14391))

(assert (= (and b!367144 (not condMapEmpty!14391)) mapNonEmpty!14391))

(get-info :version)

(assert (= (and mapNonEmpty!14391 ((_ is ValueCellFull!3932) mapValue!14391)) b!367142))

(assert (= (and b!367144 ((_ is ValueCellFull!3932) mapDefault!14391)) b!367140))

(assert (= start!36762 b!367144))

(declare-fun m!364481 () Bool)

(assert (=> b!367134 m!364481))

(declare-fun m!364483 () Bool)

(assert (=> b!367143 m!364483))

(declare-fun m!364485 () Bool)

(assert (=> b!367137 m!364485))

(declare-fun m!364487 () Bool)

(assert (=> b!367136 m!364487))

(declare-fun m!364489 () Bool)

(assert (=> mapNonEmpty!14391 m!364489))

(declare-fun m!364491 () Bool)

(assert (=> b!367139 m!364491))

(declare-fun m!364493 () Bool)

(assert (=> b!367135 m!364493))

(declare-fun m!364495 () Bool)

(assert (=> b!367141 m!364495))

(declare-fun m!364497 () Bool)

(assert (=> b!367141 m!364497))

(declare-fun m!364499 () Bool)

(assert (=> start!36762 m!364499))

(declare-fun m!364501 () Bool)

(assert (=> start!36762 m!364501))

(declare-fun m!364503 () Bool)

(assert (=> start!36762 m!364503))

(check-sat (not b!367135) (not b!367134) (not b!367139) (not start!36762) tp_is_empty!8551 (not b!367141) (not b!367143) (not mapNonEmpty!14391) (not b!367137))
(check-sat)
