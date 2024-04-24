; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36774 () Bool)

(assert start!36774)

(declare-fun b!367349 () Bool)

(declare-fun e!224815 () Bool)

(declare-fun e!224812 () Bool)

(declare-fun mapRes!14409 () Bool)

(assert (=> b!367349 (= e!224815 (and e!224812 mapRes!14409))))

(declare-fun condMapEmpty!14409 () Bool)

(declare-datatypes ((V!12523 0))(
  ( (V!12524 (val!4326 Int)) )
))
(declare-datatypes ((ValueCell!3938 0))(
  ( (ValueCellFull!3938 (v!6524 V!12523)) (EmptyCell!3938) )
))
(declare-datatypes ((array!21068 0))(
  ( (array!21069 (arr!10002 (Array (_ BitVec 32) ValueCell!3938)) (size!10354 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21068)

(declare-fun mapDefault!14409 () ValueCell!3938)

(assert (=> b!367349 (= condMapEmpty!14409 (= (arr!10002 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3938)) mapDefault!14409)))))

(declare-fun b!367350 () Bool)

(declare-fun e!224814 () Bool)

(assert (=> b!367350 (= e!224814 false)))

(declare-fun lt!169396 () Bool)

(declare-datatypes ((array!21070 0))(
  ( (array!21071 (arr!10003 (Array (_ BitVec 32) (_ BitVec 64))) (size!10355 (_ BitVec 32))) )
))
(declare-fun lt!169395 () array!21070)

(declare-datatypes ((List!5474 0))(
  ( (Nil!5471) (Cons!5470 (h!6326 (_ BitVec 64)) (t!10616 List!5474)) )
))
(declare-fun arrayNoDuplicates!0 (array!21070 (_ BitVec 32) List!5474) Bool)

(assert (=> b!367350 (= lt!169396 (arrayNoDuplicates!0 lt!169395 #b00000000000000000000000000000000 Nil!5471))))

(declare-fun mapNonEmpty!14409 () Bool)

(declare-fun tp!28485 () Bool)

(declare-fun e!224817 () Bool)

(assert (=> mapNonEmpty!14409 (= mapRes!14409 (and tp!28485 e!224817))))

(declare-fun mapValue!14409 () ValueCell!3938)

(declare-fun mapRest!14409 () (Array (_ BitVec 32) ValueCell!3938))

(declare-fun mapKey!14409 () (_ BitVec 32))

(assert (=> mapNonEmpty!14409 (= (arr!10002 _values!506) (store mapRest!14409 mapKey!14409 mapValue!14409))))

(declare-fun b!367351 () Bool)

(declare-fun res!205687 () Bool)

(declare-fun e!224816 () Bool)

(assert (=> b!367351 (=> (not res!205687) (not e!224816))))

(declare-fun _keys!658 () array!21070)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367351 (= res!205687 (or (= (select (arr!10003 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10003 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367352 () Bool)

(declare-fun res!205685 () Bool)

(assert (=> b!367352 (=> (not res!205685) (not e!224816))))

(assert (=> b!367352 (= res!205685 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5471))))

(declare-fun b!367353 () Bool)

(declare-fun res!205691 () Bool)

(assert (=> b!367353 (=> (not res!205691) (not e!224816))))

(assert (=> b!367353 (= res!205691 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10355 _keys!658))))))

(declare-fun mapIsEmpty!14409 () Bool)

(assert (=> mapIsEmpty!14409 mapRes!14409))

(declare-fun res!205689 () Bool)

(assert (=> start!36774 (=> (not res!205689) (not e!224816))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36774 (= res!205689 (validMask!0 mask!970))))

(assert (=> start!36774 e!224816))

(assert (=> start!36774 true))

(declare-fun array_inv!7432 (array!21068) Bool)

(assert (=> start!36774 (and (array_inv!7432 _values!506) e!224815)))

(declare-fun array_inv!7433 (array!21070) Bool)

(assert (=> start!36774 (array_inv!7433 _keys!658)))

(declare-fun b!367354 () Bool)

(declare-fun tp_is_empty!8563 () Bool)

(assert (=> b!367354 (= e!224817 tp_is_empty!8563)))

(declare-fun b!367355 () Bool)

(declare-fun res!205684 () Bool)

(assert (=> b!367355 (=> (not res!205684) (not e!224816))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367355 (= res!205684 (and (= (size!10354 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10355 _keys!658) (size!10354 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367356 () Bool)

(assert (=> b!367356 (= e!224812 tp_is_empty!8563)))

(declare-fun b!367357 () Bool)

(declare-fun res!205683 () Bool)

(assert (=> b!367357 (=> (not res!205683) (not e!224816))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367357 (= res!205683 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367358 () Bool)

(declare-fun res!205688 () Bool)

(assert (=> b!367358 (=> (not res!205688) (not e!224816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367358 (= res!205688 (validKeyInArray!0 k0!778))))

(declare-fun b!367359 () Bool)

(assert (=> b!367359 (= e!224816 e!224814)))

(declare-fun res!205686 () Bool)

(assert (=> b!367359 (=> (not res!205686) (not e!224814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21070 (_ BitVec 32)) Bool)

(assert (=> b!367359 (= res!205686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169395 mask!970))))

(assert (=> b!367359 (= lt!169395 (array!21071 (store (arr!10003 _keys!658) i!548 k0!778) (size!10355 _keys!658)))))

(declare-fun b!367360 () Bool)

(declare-fun res!205690 () Bool)

(assert (=> b!367360 (=> (not res!205690) (not e!224816))))

(assert (=> b!367360 (= res!205690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36774 res!205689) b!367355))

(assert (= (and b!367355 res!205684) b!367360))

(assert (= (and b!367360 res!205690) b!367352))

(assert (= (and b!367352 res!205685) b!367353))

(assert (= (and b!367353 res!205691) b!367358))

(assert (= (and b!367358 res!205688) b!367351))

(assert (= (and b!367351 res!205687) b!367357))

(assert (= (and b!367357 res!205683) b!367359))

(assert (= (and b!367359 res!205686) b!367350))

(assert (= (and b!367349 condMapEmpty!14409) mapIsEmpty!14409))

(assert (= (and b!367349 (not condMapEmpty!14409)) mapNonEmpty!14409))

(get-info :version)

(assert (= (and mapNonEmpty!14409 ((_ is ValueCellFull!3938) mapValue!14409)) b!367354))

(assert (= (and b!367349 ((_ is ValueCellFull!3938) mapDefault!14409)) b!367356))

(assert (= start!36774 b!367349))

(declare-fun m!364625 () Bool)

(assert (=> b!367360 m!364625))

(declare-fun m!364627 () Bool)

(assert (=> b!367352 m!364627))

(declare-fun m!364629 () Bool)

(assert (=> b!367357 m!364629))

(declare-fun m!364631 () Bool)

(assert (=> b!367359 m!364631))

(declare-fun m!364633 () Bool)

(assert (=> b!367359 m!364633))

(declare-fun m!364635 () Bool)

(assert (=> b!367351 m!364635))

(declare-fun m!364637 () Bool)

(assert (=> start!36774 m!364637))

(declare-fun m!364639 () Bool)

(assert (=> start!36774 m!364639))

(declare-fun m!364641 () Bool)

(assert (=> start!36774 m!364641))

(declare-fun m!364643 () Bool)

(assert (=> mapNonEmpty!14409 m!364643))

(declare-fun m!364645 () Bool)

(assert (=> b!367358 m!364645))

(declare-fun m!364647 () Bool)

(assert (=> b!367350 m!364647))

(check-sat (not b!367350) (not start!36774) (not b!367357) (not b!367359) (not mapNonEmpty!14409) (not b!367358) tp_is_empty!8563 (not b!367352) (not b!367360))
(check-sat)
