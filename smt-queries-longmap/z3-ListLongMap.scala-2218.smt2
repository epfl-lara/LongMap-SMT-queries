; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36756 () Bool)

(assert start!36756)

(declare-fun b!367025 () Bool)

(declare-fun res!205442 () Bool)

(declare-fun e!224650 () Bool)

(assert (=> b!367025 (=> (not res!205442) (not e!224650))))

(declare-datatypes ((array!21032 0))(
  ( (array!21033 (arr!9984 (Array (_ BitVec 32) (_ BitVec 64))) (size!10336 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21032)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21032 (_ BitVec 32)) Bool)

(assert (=> b!367025 (= res!205442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367026 () Bool)

(declare-fun res!205446 () Bool)

(assert (=> b!367026 (=> (not res!205446) (not e!224650))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367026 (= res!205446 (or (= (select (arr!9984 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9984 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367027 () Bool)

(declare-fun e!224652 () Bool)

(declare-fun tp_is_empty!8545 () Bool)

(assert (=> b!367027 (= e!224652 tp_is_empty!8545)))

(declare-fun mapIsEmpty!14382 () Bool)

(declare-fun mapRes!14382 () Bool)

(assert (=> mapIsEmpty!14382 mapRes!14382))

(declare-fun b!367028 () Bool)

(declare-fun e!224655 () Bool)

(declare-fun e!224654 () Bool)

(assert (=> b!367028 (= e!224655 (and e!224654 mapRes!14382))))

(declare-fun condMapEmpty!14382 () Bool)

(declare-datatypes ((V!12499 0))(
  ( (V!12500 (val!4317 Int)) )
))
(declare-datatypes ((ValueCell!3929 0))(
  ( (ValueCellFull!3929 (v!6515 V!12499)) (EmptyCell!3929) )
))
(declare-datatypes ((array!21034 0))(
  ( (array!21035 (arr!9985 (Array (_ BitVec 32) ValueCell!3929)) (size!10337 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21034)

(declare-fun mapDefault!14382 () ValueCell!3929)

(assert (=> b!367028 (= condMapEmpty!14382 (= (arr!9985 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3929)) mapDefault!14382)))))

(declare-fun b!367030 () Bool)

(declare-fun e!224653 () Bool)

(assert (=> b!367030 (= e!224650 e!224653)))

(declare-fun res!205447 () Bool)

(assert (=> b!367030 (=> (not res!205447) (not e!224653))))

(declare-fun lt!169342 () array!21032)

(assert (=> b!367030 (= res!205447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169342 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!367030 (= lt!169342 (array!21033 (store (arr!9984 _keys!658) i!548 k0!778) (size!10336 _keys!658)))))

(declare-fun b!367031 () Bool)

(declare-fun res!205445 () Bool)

(assert (=> b!367031 (=> (not res!205445) (not e!224650))))

(declare-datatypes ((List!5467 0))(
  ( (Nil!5464) (Cons!5463 (h!6319 (_ BitVec 64)) (t!10609 List!5467)) )
))
(declare-fun arrayNoDuplicates!0 (array!21032 (_ BitVec 32) List!5467) Bool)

(assert (=> b!367031 (= res!205445 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5464))))

(declare-fun b!367032 () Bool)

(declare-fun res!205448 () Bool)

(assert (=> b!367032 (=> (not res!205448) (not e!224650))))

(assert (=> b!367032 (= res!205448 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10336 _keys!658))))))

(declare-fun b!367033 () Bool)

(assert (=> b!367033 (= e!224654 tp_is_empty!8545)))

(declare-fun b!367034 () Bool)

(declare-fun res!205444 () Bool)

(assert (=> b!367034 (=> (not res!205444) (not e!224650))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367034 (= res!205444 (and (= (size!10337 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10336 _keys!658) (size!10337 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367035 () Bool)

(assert (=> b!367035 (= e!224653 false)))

(declare-fun lt!169341 () Bool)

(assert (=> b!367035 (= lt!169341 (arrayNoDuplicates!0 lt!169342 #b00000000000000000000000000000000 Nil!5464))))

(declare-fun b!367036 () Bool)

(declare-fun res!205440 () Bool)

(assert (=> b!367036 (=> (not res!205440) (not e!224650))))

(declare-fun arrayContainsKey!0 (array!21032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367036 (= res!205440 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14382 () Bool)

(declare-fun tp!28458 () Bool)

(assert (=> mapNonEmpty!14382 (= mapRes!14382 (and tp!28458 e!224652))))

(declare-fun mapKey!14382 () (_ BitVec 32))

(declare-fun mapRest!14382 () (Array (_ BitVec 32) ValueCell!3929))

(declare-fun mapValue!14382 () ValueCell!3929)

(assert (=> mapNonEmpty!14382 (= (arr!9985 _values!506) (store mapRest!14382 mapKey!14382 mapValue!14382))))

(declare-fun b!367029 () Bool)

(declare-fun res!205441 () Bool)

(assert (=> b!367029 (=> (not res!205441) (not e!224650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367029 (= res!205441 (validKeyInArray!0 k0!778))))

(declare-fun res!205443 () Bool)

(assert (=> start!36756 (=> (not res!205443) (not e!224650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36756 (= res!205443 (validMask!0 mask!970))))

(assert (=> start!36756 e!224650))

(assert (=> start!36756 true))

(declare-fun array_inv!7422 (array!21034) Bool)

(assert (=> start!36756 (and (array_inv!7422 _values!506) e!224655)))

(declare-fun array_inv!7423 (array!21032) Bool)

(assert (=> start!36756 (array_inv!7423 _keys!658)))

(assert (= (and start!36756 res!205443) b!367034))

(assert (= (and b!367034 res!205444) b!367025))

(assert (= (and b!367025 res!205442) b!367031))

(assert (= (and b!367031 res!205445) b!367032))

(assert (= (and b!367032 res!205448) b!367029))

(assert (= (and b!367029 res!205441) b!367026))

(assert (= (and b!367026 res!205446) b!367036))

(assert (= (and b!367036 res!205440) b!367030))

(assert (= (and b!367030 res!205447) b!367035))

(assert (= (and b!367028 condMapEmpty!14382) mapIsEmpty!14382))

(assert (= (and b!367028 (not condMapEmpty!14382)) mapNonEmpty!14382))

(get-info :version)

(assert (= (and mapNonEmpty!14382 ((_ is ValueCellFull!3929) mapValue!14382)) b!367027))

(assert (= (and b!367028 ((_ is ValueCellFull!3929) mapDefault!14382)) b!367033))

(assert (= start!36756 b!367028))

(declare-fun m!364409 () Bool)

(assert (=> b!367036 m!364409))

(declare-fun m!364411 () Bool)

(assert (=> b!367026 m!364411))

(declare-fun m!364413 () Bool)

(assert (=> b!367035 m!364413))

(declare-fun m!364415 () Bool)

(assert (=> mapNonEmpty!14382 m!364415))

(declare-fun m!364417 () Bool)

(assert (=> start!36756 m!364417))

(declare-fun m!364419 () Bool)

(assert (=> start!36756 m!364419))

(declare-fun m!364421 () Bool)

(assert (=> start!36756 m!364421))

(declare-fun m!364423 () Bool)

(assert (=> b!367030 m!364423))

(declare-fun m!364425 () Bool)

(assert (=> b!367030 m!364425))

(declare-fun m!364427 () Bool)

(assert (=> b!367025 m!364427))

(declare-fun m!364429 () Bool)

(assert (=> b!367031 m!364429))

(declare-fun m!364431 () Bool)

(assert (=> b!367029 m!364431))

(check-sat (not b!367036) (not start!36756) (not b!367035) (not mapNonEmpty!14382) tp_is_empty!8545 (not b!367025) (not b!367030) (not b!367029) (not b!367031))
(check-sat)
