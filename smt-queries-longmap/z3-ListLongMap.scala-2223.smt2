; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36786 () Bool)

(assert start!36786)

(declare-fun res!205725 () Bool)

(declare-fun e!224783 () Bool)

(assert (=> start!36786 (=> (not res!205725) (not e!224783))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36786 (= res!205725 (validMask!0 mask!970))))

(assert (=> start!36786 e!224783))

(assert (=> start!36786 true))

(declare-datatypes ((V!12539 0))(
  ( (V!12540 (val!4332 Int)) )
))
(declare-datatypes ((ValueCell!3944 0))(
  ( (ValueCellFull!3944 (v!6523 V!12539)) (EmptyCell!3944) )
))
(declare-datatypes ((array!21091 0))(
  ( (array!21092 (arr!10014 (Array (_ BitVec 32) ValueCell!3944)) (size!10367 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21091)

(declare-fun e!224778 () Bool)

(declare-fun array_inv!7424 (array!21091) Bool)

(assert (=> start!36786 (and (array_inv!7424 _values!506) e!224778)))

(declare-datatypes ((array!21093 0))(
  ( (array!21094 (arr!10015 (Array (_ BitVec 32) (_ BitVec 64))) (size!10368 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21093)

(declare-fun array_inv!7425 (array!21093) Bool)

(assert (=> start!36786 (array_inv!7425 _keys!658)))

(declare-fun b!367345 () Bool)

(declare-fun res!205730 () Bool)

(assert (=> b!367345 (=> (not res!205730) (not e!224783))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367345 (= res!205730 (or (= (select (arr!10015 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10015 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367346 () Bool)

(declare-fun res!205724 () Bool)

(declare-fun e!224781 () Bool)

(assert (=> b!367346 (=> (not res!205724) (not e!224781))))

(declare-fun lt!169176 () array!21093)

(declare-datatypes ((List!5537 0))(
  ( (Nil!5534) (Cons!5533 (h!6389 (_ BitVec 64)) (t!10678 List!5537)) )
))
(declare-fun arrayNoDuplicates!0 (array!21093 (_ BitVec 32) List!5537) Bool)

(assert (=> b!367346 (= res!205724 (arrayNoDuplicates!0 lt!169176 #b00000000000000000000000000000000 Nil!5534))))

(declare-fun b!367347 () Bool)

(declare-fun res!205729 () Bool)

(assert (=> b!367347 (=> (not res!205729) (not e!224783))))

(assert (=> b!367347 (= res!205729 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5534))))

(declare-fun b!367348 () Bool)

(declare-fun res!205726 () Bool)

(assert (=> b!367348 (=> (not res!205726) (not e!224783))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367348 (= res!205726 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367349 () Bool)

(declare-fun res!205728 () Bool)

(assert (=> b!367349 (=> (not res!205728) (not e!224783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367349 (= res!205728 (validKeyInArray!0 k0!778))))

(declare-fun b!367350 () Bool)

(declare-fun res!205723 () Bool)

(assert (=> b!367350 (=> (not res!205723) (not e!224783))))

(assert (=> b!367350 (= res!205723 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10368 _keys!658))))))

(declare-fun b!367351 () Bool)

(declare-fun res!205722 () Bool)

(assert (=> b!367351 (=> (not res!205722) (not e!224783))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367351 (= res!205722 (and (= (size!10367 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10368 _keys!658) (size!10367 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367352 () Bool)

(declare-fun res!205721 () Bool)

(assert (=> b!367352 (=> (not res!205721) (not e!224783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21093 (_ BitVec 32)) Bool)

(assert (=> b!367352 (= res!205721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367353 () Bool)

(declare-fun e!224780 () Bool)

(declare-fun tp_is_empty!8575 () Bool)

(assert (=> b!367353 (= e!224780 tp_is_empty!8575)))

(declare-fun b!367354 () Bool)

(declare-fun e!224782 () Bool)

(assert (=> b!367354 (= e!224782 tp_is_empty!8575)))

(declare-fun b!367355 () Bool)

(assert (=> b!367355 (= e!224781 (bvsgt #b00000000000000000000000000000000 (size!10368 _keys!658)))))

(declare-fun mapIsEmpty!14427 () Bool)

(declare-fun mapRes!14427 () Bool)

(assert (=> mapIsEmpty!14427 mapRes!14427))

(declare-fun b!367356 () Bool)

(assert (=> b!367356 (= e!224778 (and e!224780 mapRes!14427))))

(declare-fun condMapEmpty!14427 () Bool)

(declare-fun mapDefault!14427 () ValueCell!3944)

(assert (=> b!367356 (= condMapEmpty!14427 (= (arr!10014 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3944)) mapDefault!14427)))))

(declare-fun b!367357 () Bool)

(assert (=> b!367357 (= e!224783 e!224781)))

(declare-fun res!205727 () Bool)

(assert (=> b!367357 (=> (not res!205727) (not e!224781))))

(assert (=> b!367357 (= res!205727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169176 mask!970))))

(assert (=> b!367357 (= lt!169176 (array!21094 (store (arr!10015 _keys!658) i!548 k0!778) (size!10368 _keys!658)))))

(declare-fun mapNonEmpty!14427 () Bool)

(declare-fun tp!28503 () Bool)

(assert (=> mapNonEmpty!14427 (= mapRes!14427 (and tp!28503 e!224782))))

(declare-fun mapRest!14427 () (Array (_ BitVec 32) ValueCell!3944))

(declare-fun mapValue!14427 () ValueCell!3944)

(declare-fun mapKey!14427 () (_ BitVec 32))

(assert (=> mapNonEmpty!14427 (= (arr!10014 _values!506) (store mapRest!14427 mapKey!14427 mapValue!14427))))

(assert (= (and start!36786 res!205725) b!367351))

(assert (= (and b!367351 res!205722) b!367352))

(assert (= (and b!367352 res!205721) b!367347))

(assert (= (and b!367347 res!205729) b!367350))

(assert (= (and b!367350 res!205723) b!367349))

(assert (= (and b!367349 res!205728) b!367345))

(assert (= (and b!367345 res!205730) b!367348))

(assert (= (and b!367348 res!205726) b!367357))

(assert (= (and b!367357 res!205727) b!367346))

(assert (= (and b!367346 res!205724) b!367355))

(assert (= (and b!367356 condMapEmpty!14427) mapIsEmpty!14427))

(assert (= (and b!367356 (not condMapEmpty!14427)) mapNonEmpty!14427))

(get-info :version)

(assert (= (and mapNonEmpty!14427 ((_ is ValueCellFull!3944) mapValue!14427)) b!367354))

(assert (= (and b!367356 ((_ is ValueCellFull!3944) mapDefault!14427)) b!367353))

(assert (= start!36786 b!367356))

(declare-fun m!363815 () Bool)

(assert (=> b!367352 m!363815))

(declare-fun m!363817 () Bool)

(assert (=> start!36786 m!363817))

(declare-fun m!363819 () Bool)

(assert (=> start!36786 m!363819))

(declare-fun m!363821 () Bool)

(assert (=> start!36786 m!363821))

(declare-fun m!363823 () Bool)

(assert (=> b!367357 m!363823))

(declare-fun m!363825 () Bool)

(assert (=> b!367357 m!363825))

(declare-fun m!363827 () Bool)

(assert (=> mapNonEmpty!14427 m!363827))

(declare-fun m!363829 () Bool)

(assert (=> b!367346 m!363829))

(declare-fun m!363831 () Bool)

(assert (=> b!367348 m!363831))

(declare-fun m!363833 () Bool)

(assert (=> b!367349 m!363833))

(declare-fun m!363835 () Bool)

(assert (=> b!367347 m!363835))

(declare-fun m!363837 () Bool)

(assert (=> b!367345 m!363837))

(check-sat (not b!367357) (not b!367352) (not start!36786) tp_is_empty!8575 (not mapNonEmpty!14427) (not b!367347) (not b!367349) (not b!367348) (not b!367346))
(check-sat)
