; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36768 () Bool)

(assert start!36768)

(declare-fun b!367241 () Bool)

(declare-fun e!224762 () Bool)

(declare-fun tp_is_empty!8557 () Bool)

(assert (=> b!367241 (= e!224762 tp_is_empty!8557)))

(declare-fun b!367242 () Bool)

(declare-fun e!224763 () Bool)

(assert (=> b!367242 (= e!224763 false)))

(declare-fun lt!169377 () Bool)

(declare-datatypes ((array!21056 0))(
  ( (array!21057 (arr!9996 (Array (_ BitVec 32) (_ BitVec 64))) (size!10348 (_ BitVec 32))) )
))
(declare-fun lt!169378 () array!21056)

(declare-datatypes ((List!5472 0))(
  ( (Nil!5469) (Cons!5468 (h!6324 (_ BitVec 64)) (t!10614 List!5472)) )
))
(declare-fun arrayNoDuplicates!0 (array!21056 (_ BitVec 32) List!5472) Bool)

(assert (=> b!367242 (= lt!169377 (arrayNoDuplicates!0 lt!169378 #b00000000000000000000000000000000 Nil!5469))))

(declare-fun b!367243 () Bool)

(declare-fun e!224758 () Bool)

(assert (=> b!367243 (= e!224758 tp_is_empty!8557)))

(declare-fun b!367244 () Bool)

(declare-fun res!205604 () Bool)

(declare-fun e!224760 () Bool)

(assert (=> b!367244 (=> (not res!205604) (not e!224760))))

(declare-fun _keys!658 () array!21056)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367244 (= res!205604 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367245 () Bool)

(declare-fun res!205605 () Bool)

(assert (=> b!367245 (=> (not res!205605) (not e!224760))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367245 (= res!205605 (or (= (select (arr!9996 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9996 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367246 () Bool)

(declare-fun res!205610 () Bool)

(assert (=> b!367246 (=> (not res!205610) (not e!224760))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12515 0))(
  ( (V!12516 (val!4323 Int)) )
))
(declare-datatypes ((ValueCell!3935 0))(
  ( (ValueCellFull!3935 (v!6521 V!12515)) (EmptyCell!3935) )
))
(declare-datatypes ((array!21058 0))(
  ( (array!21059 (arr!9997 (Array (_ BitVec 32) ValueCell!3935)) (size!10349 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21058)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367246 (= res!205610 (and (= (size!10349 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10348 _keys!658) (size!10349 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367247 () Bool)

(declare-fun res!205602 () Bool)

(assert (=> b!367247 (=> (not res!205602) (not e!224760))))

(assert (=> b!367247 (= res!205602 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5469))))

(declare-fun b!367248 () Bool)

(assert (=> b!367248 (= e!224760 e!224763)))

(declare-fun res!205606 () Bool)

(assert (=> b!367248 (=> (not res!205606) (not e!224763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21056 (_ BitVec 32)) Bool)

(assert (=> b!367248 (= res!205606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169378 mask!970))))

(assert (=> b!367248 (= lt!169378 (array!21057 (store (arr!9996 _keys!658) i!548 k0!778) (size!10348 _keys!658)))))

(declare-fun b!367249 () Bool)

(declare-fun res!205608 () Bool)

(assert (=> b!367249 (=> (not res!205608) (not e!224760))))

(assert (=> b!367249 (= res!205608 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10348 _keys!658))))))

(declare-fun mapIsEmpty!14400 () Bool)

(declare-fun mapRes!14400 () Bool)

(assert (=> mapIsEmpty!14400 mapRes!14400))

(declare-fun res!205603 () Bool)

(assert (=> start!36768 (=> (not res!205603) (not e!224760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36768 (= res!205603 (validMask!0 mask!970))))

(assert (=> start!36768 e!224760))

(assert (=> start!36768 true))

(declare-fun e!224759 () Bool)

(declare-fun array_inv!7428 (array!21058) Bool)

(assert (=> start!36768 (and (array_inv!7428 _values!506) e!224759)))

(declare-fun array_inv!7429 (array!21056) Bool)

(assert (=> start!36768 (array_inv!7429 _keys!658)))

(declare-fun mapNonEmpty!14400 () Bool)

(declare-fun tp!28476 () Bool)

(assert (=> mapNonEmpty!14400 (= mapRes!14400 (and tp!28476 e!224758))))

(declare-fun mapRest!14400 () (Array (_ BitVec 32) ValueCell!3935))

(declare-fun mapValue!14400 () ValueCell!3935)

(declare-fun mapKey!14400 () (_ BitVec 32))

(assert (=> mapNonEmpty!14400 (= (arr!9997 _values!506) (store mapRest!14400 mapKey!14400 mapValue!14400))))

(declare-fun b!367250 () Bool)

(declare-fun res!205607 () Bool)

(assert (=> b!367250 (=> (not res!205607) (not e!224760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367250 (= res!205607 (validKeyInArray!0 k0!778))))

(declare-fun b!367251 () Bool)

(assert (=> b!367251 (= e!224759 (and e!224762 mapRes!14400))))

(declare-fun condMapEmpty!14400 () Bool)

(declare-fun mapDefault!14400 () ValueCell!3935)

(assert (=> b!367251 (= condMapEmpty!14400 (= (arr!9997 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3935)) mapDefault!14400)))))

(declare-fun b!367252 () Bool)

(declare-fun res!205609 () Bool)

(assert (=> b!367252 (=> (not res!205609) (not e!224760))))

(assert (=> b!367252 (= res!205609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!36768 res!205603) b!367246))

(assert (= (and b!367246 res!205610) b!367252))

(assert (= (and b!367252 res!205609) b!367247))

(assert (= (and b!367247 res!205602) b!367249))

(assert (= (and b!367249 res!205608) b!367250))

(assert (= (and b!367250 res!205607) b!367245))

(assert (= (and b!367245 res!205605) b!367244))

(assert (= (and b!367244 res!205604) b!367248))

(assert (= (and b!367248 res!205606) b!367242))

(assert (= (and b!367251 condMapEmpty!14400) mapIsEmpty!14400))

(assert (= (and b!367251 (not condMapEmpty!14400)) mapNonEmpty!14400))

(get-info :version)

(assert (= (and mapNonEmpty!14400 ((_ is ValueCellFull!3935) mapValue!14400)) b!367243))

(assert (= (and b!367251 ((_ is ValueCellFull!3935) mapDefault!14400)) b!367241))

(assert (= start!36768 b!367251))

(declare-fun m!364553 () Bool)

(assert (=> b!367247 m!364553))

(declare-fun m!364555 () Bool)

(assert (=> b!367244 m!364555))

(declare-fun m!364557 () Bool)

(assert (=> b!367242 m!364557))

(declare-fun m!364559 () Bool)

(assert (=> b!367245 m!364559))

(declare-fun m!364561 () Bool)

(assert (=> b!367252 m!364561))

(declare-fun m!364563 () Bool)

(assert (=> b!367248 m!364563))

(declare-fun m!364565 () Bool)

(assert (=> b!367248 m!364565))

(declare-fun m!364567 () Bool)

(assert (=> b!367250 m!364567))

(declare-fun m!364569 () Bool)

(assert (=> start!36768 m!364569))

(declare-fun m!364571 () Bool)

(assert (=> start!36768 m!364571))

(declare-fun m!364573 () Bool)

(assert (=> start!36768 m!364573))

(declare-fun m!364575 () Bool)

(assert (=> mapNonEmpty!14400 m!364575))

(check-sat (not b!367244) (not b!367242) (not b!367248) (not mapNonEmpty!14400) (not start!36768) (not b!367247) tp_is_empty!8557 (not b!367252) (not b!367250))
(check-sat)
