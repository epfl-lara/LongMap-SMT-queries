; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36762 () Bool)

(assert start!36762)

(declare-fun b!366911 () Bool)

(declare-fun res!205398 () Bool)

(declare-fun e!224565 () Bool)

(assert (=> b!366911 (=> (not res!205398) (not e!224565))))

(declare-datatypes ((array!21045 0))(
  ( (array!21046 (arr!9991 (Array (_ BitVec 32) (_ BitVec 64))) (size!10344 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21045)

(declare-datatypes ((List!5526 0))(
  ( (Nil!5523) (Cons!5522 (h!6378 (_ BitVec 64)) (t!10667 List!5526)) )
))
(declare-fun arrayNoDuplicates!0 (array!21045 (_ BitVec 32) List!5526) Bool)

(assert (=> b!366911 (= res!205398 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5523))))

(declare-fun b!366912 () Bool)

(declare-fun e!224567 () Bool)

(declare-fun e!224564 () Bool)

(declare-fun mapRes!14391 () Bool)

(assert (=> b!366912 (= e!224567 (and e!224564 mapRes!14391))))

(declare-fun condMapEmpty!14391 () Bool)

(declare-datatypes ((V!12507 0))(
  ( (V!12508 (val!4320 Int)) )
))
(declare-datatypes ((ValueCell!3932 0))(
  ( (ValueCellFull!3932 (v!6511 V!12507)) (EmptyCell!3932) )
))
(declare-datatypes ((array!21047 0))(
  ( (array!21048 (arr!9992 (Array (_ BitVec 32) ValueCell!3932)) (size!10345 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21047)

(declare-fun mapDefault!14391 () ValueCell!3932)

(assert (=> b!366912 (= condMapEmpty!14391 (= (arr!9992 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3932)) mapDefault!14391)))))

(declare-fun b!366913 () Bool)

(declare-fun res!205397 () Bool)

(assert (=> b!366913 (=> (not res!205397) (not e!224565))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366913 (= res!205397 (validKeyInArray!0 k0!778))))

(declare-fun b!366914 () Bool)

(declare-fun res!205396 () Bool)

(assert (=> b!366914 (=> (not res!205396) (not e!224565))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21045 (_ BitVec 32)) Bool)

(assert (=> b!366914 (= res!205396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366915 () Bool)

(declare-fun e!224562 () Bool)

(declare-fun tp_is_empty!8551 () Bool)

(assert (=> b!366915 (= e!224562 tp_is_empty!8551)))

(declare-fun res!205400 () Bool)

(assert (=> start!36762 (=> (not res!205400) (not e!224565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36762 (= res!205400 (validMask!0 mask!970))))

(assert (=> start!36762 e!224565))

(assert (=> start!36762 true))

(declare-fun array_inv!7404 (array!21047) Bool)

(assert (=> start!36762 (and (array_inv!7404 _values!506) e!224567)))

(declare-fun array_inv!7405 (array!21045) Bool)

(assert (=> start!36762 (array_inv!7405 _keys!658)))

(declare-fun b!366916 () Bool)

(declare-fun res!205401 () Bool)

(assert (=> b!366916 (=> (not res!205401) (not e!224565))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366916 (= res!205401 (and (= (size!10345 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10344 _keys!658) (size!10345 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366917 () Bool)

(declare-fun e!224566 () Bool)

(assert (=> b!366917 (= e!224565 e!224566)))

(declare-fun res!205395 () Bool)

(assert (=> b!366917 (=> (not res!205395) (not e!224566))))

(declare-fun lt!169107 () array!21045)

(assert (=> b!366917 (= res!205395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169107 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366917 (= lt!169107 (array!21046 (store (arr!9991 _keys!658) i!548 k0!778) (size!10344 _keys!658)))))

(declare-fun b!366918 () Bool)

(declare-fun res!205403 () Bool)

(assert (=> b!366918 (=> (not res!205403) (not e!224565))))

(assert (=> b!366918 (= res!205403 (or (= (select (arr!9991 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9991 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366919 () Bool)

(declare-fun res!205402 () Bool)

(assert (=> b!366919 (=> (not res!205402) (not e!224565))))

(assert (=> b!366919 (= res!205402 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10344 _keys!658))))))

(declare-fun b!366920 () Bool)

(declare-fun res!205399 () Bool)

(assert (=> b!366920 (=> (not res!205399) (not e!224565))))

(declare-fun arrayContainsKey!0 (array!21045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366920 (= res!205399 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366921 () Bool)

(assert (=> b!366921 (= e!224564 tp_is_empty!8551)))

(declare-fun mapIsEmpty!14391 () Bool)

(assert (=> mapIsEmpty!14391 mapRes!14391))

(declare-fun mapNonEmpty!14391 () Bool)

(declare-fun tp!28467 () Bool)

(assert (=> mapNonEmpty!14391 (= mapRes!14391 (and tp!28467 e!224562))))

(declare-fun mapValue!14391 () ValueCell!3932)

(declare-fun mapKey!14391 () (_ BitVec 32))

(declare-fun mapRest!14391 () (Array (_ BitVec 32) ValueCell!3932))

(assert (=> mapNonEmpty!14391 (= (arr!9992 _values!506) (store mapRest!14391 mapKey!14391 mapValue!14391))))

(declare-fun b!366922 () Bool)

(assert (=> b!366922 (= e!224566 false)))

(declare-fun lt!169106 () Bool)

(assert (=> b!366922 (= lt!169106 (arrayNoDuplicates!0 lt!169107 #b00000000000000000000000000000000 Nil!5523))))

(assert (= (and start!36762 res!205400) b!366916))

(assert (= (and b!366916 res!205401) b!366914))

(assert (= (and b!366914 res!205396) b!366911))

(assert (= (and b!366911 res!205398) b!366919))

(assert (= (and b!366919 res!205402) b!366913))

(assert (= (and b!366913 res!205397) b!366918))

(assert (= (and b!366918 res!205403) b!366920))

(assert (= (and b!366920 res!205399) b!366917))

(assert (= (and b!366917 res!205395) b!366922))

(assert (= (and b!366912 condMapEmpty!14391) mapIsEmpty!14391))

(assert (= (and b!366912 (not condMapEmpty!14391)) mapNonEmpty!14391))

(get-info :version)

(assert (= (and mapNonEmpty!14391 ((_ is ValueCellFull!3932) mapValue!14391)) b!366915))

(assert (= (and b!366912 ((_ is ValueCellFull!3932) mapDefault!14391)) b!366921))

(assert (= start!36762 b!366912))

(declare-fun m!363527 () Bool)

(assert (=> b!366911 m!363527))

(declare-fun m!363529 () Bool)

(assert (=> b!366920 m!363529))

(declare-fun m!363531 () Bool)

(assert (=> start!36762 m!363531))

(declare-fun m!363533 () Bool)

(assert (=> start!36762 m!363533))

(declare-fun m!363535 () Bool)

(assert (=> start!36762 m!363535))

(declare-fun m!363537 () Bool)

(assert (=> b!366914 m!363537))

(declare-fun m!363539 () Bool)

(assert (=> mapNonEmpty!14391 m!363539))

(declare-fun m!363541 () Bool)

(assert (=> b!366917 m!363541))

(declare-fun m!363543 () Bool)

(assert (=> b!366917 m!363543))

(declare-fun m!363545 () Bool)

(assert (=> b!366922 m!363545))

(declare-fun m!363547 () Bool)

(assert (=> b!366913 m!363547))

(declare-fun m!363549 () Bool)

(assert (=> b!366918 m!363549))

(check-sat tp_is_empty!8551 (not b!366922) (not mapNonEmpty!14391) (not start!36762) (not b!366920) (not b!366913) (not b!366914) (not b!366911) (not b!366917))
(check-sat)
