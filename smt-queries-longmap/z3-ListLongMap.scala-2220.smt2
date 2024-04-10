; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36784 () Bool)

(assert start!36784)

(declare-fun b!367326 () Bool)

(declare-fun res!205634 () Bool)

(declare-fun e!224812 () Bool)

(assert (=> b!367326 (=> (not res!205634) (not e!224812))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12517 0))(
  ( (V!12518 (val!4324 Int)) )
))
(declare-datatypes ((ValueCell!3936 0))(
  ( (ValueCellFull!3936 (v!6521 V!12517)) (EmptyCell!3936) )
))
(declare-datatypes ((array!21077 0))(
  ( (array!21078 (arr!10007 (Array (_ BitVec 32) ValueCell!3936)) (size!10359 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21077)

(declare-datatypes ((array!21079 0))(
  ( (array!21080 (arr!10008 (Array (_ BitVec 32) (_ BitVec 64))) (size!10360 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21079)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367326 (= res!205634 (and (= (size!10359 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10360 _keys!658) (size!10359 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367327 () Bool)

(declare-fun e!224808 () Bool)

(declare-fun e!224810 () Bool)

(declare-fun mapRes!14403 () Bool)

(assert (=> b!367327 (= e!224808 (and e!224810 mapRes!14403))))

(declare-fun condMapEmpty!14403 () Bool)

(declare-fun mapDefault!14403 () ValueCell!3936)

(assert (=> b!367327 (= condMapEmpty!14403 (= (arr!10007 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3936)) mapDefault!14403)))))

(declare-fun b!367328 () Bool)

(declare-fun e!224811 () Bool)

(declare-fun tp_is_empty!8559 () Bool)

(assert (=> b!367328 (= e!224811 tp_is_empty!8559)))

(declare-fun b!367329 () Bool)

(declare-fun res!205632 () Bool)

(assert (=> b!367329 (=> (not res!205632) (not e!224812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21079 (_ BitVec 32)) Bool)

(assert (=> b!367329 (= res!205632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367330 () Bool)

(declare-fun res!205633 () Bool)

(assert (=> b!367330 (=> (not res!205633) (not e!224812))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367330 (= res!205633 (validKeyInArray!0 k0!778))))

(declare-fun b!367331 () Bool)

(declare-fun res!205635 () Bool)

(assert (=> b!367331 (=> (not res!205635) (not e!224812))))

(declare-datatypes ((List!5565 0))(
  ( (Nil!5562) (Cons!5561 (h!6417 (_ BitVec 64)) (t!10715 List!5565)) )
))
(declare-fun arrayNoDuplicates!0 (array!21079 (_ BitVec 32) List!5565) Bool)

(assert (=> b!367331 (= res!205635 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5562))))

(declare-fun mapIsEmpty!14403 () Bool)

(assert (=> mapIsEmpty!14403 mapRes!14403))

(declare-fun b!367332 () Bool)

(declare-fun e!224809 () Bool)

(assert (=> b!367332 (= e!224809 false)))

(declare-fun lt!169364 () Bool)

(declare-fun lt!169365 () array!21079)

(assert (=> b!367332 (= lt!169364 (arrayNoDuplicates!0 lt!169365 #b00000000000000000000000000000000 Nil!5562))))

(declare-fun res!205639 () Bool)

(assert (=> start!36784 (=> (not res!205639) (not e!224812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36784 (= res!205639 (validMask!0 mask!970))))

(assert (=> start!36784 e!224812))

(assert (=> start!36784 true))

(declare-fun array_inv!7400 (array!21077) Bool)

(assert (=> start!36784 (and (array_inv!7400 _values!506) e!224808)))

(declare-fun array_inv!7401 (array!21079) Bool)

(assert (=> start!36784 (array_inv!7401 _keys!658)))

(declare-fun b!367333 () Bool)

(declare-fun res!205640 () Bool)

(assert (=> b!367333 (=> (not res!205640) (not e!224812))))

(declare-fun arrayContainsKey!0 (array!21079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367333 (= res!205640 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367334 () Bool)

(declare-fun res!205636 () Bool)

(assert (=> b!367334 (=> (not res!205636) (not e!224812))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367334 (= res!205636 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10360 _keys!658))))))

(declare-fun b!367335 () Bool)

(declare-fun res!205637 () Bool)

(assert (=> b!367335 (=> (not res!205637) (not e!224812))))

(assert (=> b!367335 (= res!205637 (or (= (select (arr!10008 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10008 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367336 () Bool)

(assert (=> b!367336 (= e!224810 tp_is_empty!8559)))

(declare-fun b!367337 () Bool)

(assert (=> b!367337 (= e!224812 e!224809)))

(declare-fun res!205638 () Bool)

(assert (=> b!367337 (=> (not res!205638) (not e!224809))))

(assert (=> b!367337 (= res!205638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169365 mask!970))))

(assert (=> b!367337 (= lt!169365 (array!21080 (store (arr!10008 _keys!658) i!548 k0!778) (size!10360 _keys!658)))))

(declare-fun mapNonEmpty!14403 () Bool)

(declare-fun tp!28479 () Bool)

(assert (=> mapNonEmpty!14403 (= mapRes!14403 (and tp!28479 e!224811))))

(declare-fun mapRest!14403 () (Array (_ BitVec 32) ValueCell!3936))

(declare-fun mapKey!14403 () (_ BitVec 32))

(declare-fun mapValue!14403 () ValueCell!3936)

(assert (=> mapNonEmpty!14403 (= (arr!10007 _values!506) (store mapRest!14403 mapKey!14403 mapValue!14403))))

(assert (= (and start!36784 res!205639) b!367326))

(assert (= (and b!367326 res!205634) b!367329))

(assert (= (and b!367329 res!205632) b!367331))

(assert (= (and b!367331 res!205635) b!367334))

(assert (= (and b!367334 res!205636) b!367330))

(assert (= (and b!367330 res!205633) b!367335))

(assert (= (and b!367335 res!205637) b!367333))

(assert (= (and b!367333 res!205640) b!367337))

(assert (= (and b!367337 res!205638) b!367332))

(assert (= (and b!367327 condMapEmpty!14403) mapIsEmpty!14403))

(assert (= (and b!367327 (not condMapEmpty!14403)) mapNonEmpty!14403))

(get-info :version)

(assert (= (and mapNonEmpty!14403 ((_ is ValueCellFull!3936) mapValue!14403)) b!367328))

(assert (= (and b!367327 ((_ is ValueCellFull!3936) mapDefault!14403)) b!367336))

(assert (= start!36784 b!367327))

(declare-fun m!364347 () Bool)

(assert (=> b!367329 m!364347))

(declare-fun m!364349 () Bool)

(assert (=> b!367333 m!364349))

(declare-fun m!364351 () Bool)

(assert (=> start!36784 m!364351))

(declare-fun m!364353 () Bool)

(assert (=> start!36784 m!364353))

(declare-fun m!364355 () Bool)

(assert (=> start!36784 m!364355))

(declare-fun m!364357 () Bool)

(assert (=> b!367335 m!364357))

(declare-fun m!364359 () Bool)

(assert (=> b!367331 m!364359))

(declare-fun m!364361 () Bool)

(assert (=> b!367330 m!364361))

(declare-fun m!364363 () Bool)

(assert (=> b!367332 m!364363))

(declare-fun m!364365 () Bool)

(assert (=> b!367337 m!364365))

(declare-fun m!364367 () Bool)

(assert (=> b!367337 m!364367))

(declare-fun m!364369 () Bool)

(assert (=> mapNonEmpty!14403 m!364369))

(check-sat (not b!367333) (not b!367329) (not mapNonEmpty!14403) (not b!367331) (not start!36784) (not b!367330) (not b!367337) (not b!367332) tp_is_empty!8559)
(check-sat)
