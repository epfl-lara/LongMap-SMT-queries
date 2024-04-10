; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36790 () Bool)

(assert start!36790)

(declare-fun b!367434 () Bool)

(declare-fun res!205721 () Bool)

(declare-fun e!224865 () Bool)

(assert (=> b!367434 (=> (not res!205721) (not e!224865))))

(declare-datatypes ((array!21089 0))(
  ( (array!21090 (arr!10013 (Array (_ BitVec 32) (_ BitVec 64))) (size!10365 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21089)

(declare-datatypes ((List!5567 0))(
  ( (Nil!5564) (Cons!5563 (h!6419 (_ BitVec 64)) (t!10717 List!5567)) )
))
(declare-fun arrayNoDuplicates!0 (array!21089 (_ BitVec 32) List!5567) Bool)

(assert (=> b!367434 (= res!205721 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5564))))

(declare-fun b!367435 () Bool)

(declare-fun e!224862 () Bool)

(assert (=> b!367435 (= e!224865 e!224862)))

(declare-fun res!205716 () Bool)

(assert (=> b!367435 (=> (not res!205716) (not e!224862))))

(declare-fun lt!169383 () array!21089)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21089 (_ BitVec 32)) Bool)

(assert (=> b!367435 (= res!205716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169383 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367435 (= lt!169383 (array!21090 (store (arr!10013 _keys!658) i!548 k0!778) (size!10365 _keys!658)))))

(declare-fun b!367436 () Bool)

(declare-fun res!205719 () Bool)

(assert (=> b!367436 (=> (not res!205719) (not e!224865))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12525 0))(
  ( (V!12526 (val!4327 Int)) )
))
(declare-datatypes ((ValueCell!3939 0))(
  ( (ValueCellFull!3939 (v!6524 V!12525)) (EmptyCell!3939) )
))
(declare-datatypes ((array!21091 0))(
  ( (array!21092 (arr!10014 (Array (_ BitVec 32) ValueCell!3939)) (size!10366 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21091)

(assert (=> b!367436 (= res!205719 (and (= (size!10366 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10365 _keys!658) (size!10366 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367438 () Bool)

(declare-fun res!205720 () Bool)

(assert (=> b!367438 (=> (not res!205720) (not e!224865))))

(assert (=> b!367438 (= res!205720 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10365 _keys!658))))))

(declare-fun b!367439 () Bool)

(declare-fun e!224864 () Bool)

(declare-fun tp_is_empty!8565 () Bool)

(assert (=> b!367439 (= e!224864 tp_is_empty!8565)))

(declare-fun b!367440 () Bool)

(declare-fun res!205713 () Bool)

(assert (=> b!367440 (=> (not res!205713) (not e!224865))))

(assert (=> b!367440 (= res!205713 (or (= (select (arr!10013 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10013 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367441 () Bool)

(declare-fun res!205715 () Bool)

(assert (=> b!367441 (=> (not res!205715) (not e!224865))))

(declare-fun arrayContainsKey!0 (array!21089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367441 (= res!205715 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14412 () Bool)

(declare-fun mapRes!14412 () Bool)

(assert (=> mapIsEmpty!14412 mapRes!14412))

(declare-fun mapNonEmpty!14412 () Bool)

(declare-fun tp!28488 () Bool)

(declare-fun e!224863 () Bool)

(assert (=> mapNonEmpty!14412 (= mapRes!14412 (and tp!28488 e!224863))))

(declare-fun mapKey!14412 () (_ BitVec 32))

(declare-fun mapValue!14412 () ValueCell!3939)

(declare-fun mapRest!14412 () (Array (_ BitVec 32) ValueCell!3939))

(assert (=> mapNonEmpty!14412 (= (arr!10014 _values!506) (store mapRest!14412 mapKey!14412 mapValue!14412))))

(declare-fun b!367442 () Bool)

(declare-fun e!224867 () Bool)

(assert (=> b!367442 (= e!224867 (and e!224864 mapRes!14412))))

(declare-fun condMapEmpty!14412 () Bool)

(declare-fun mapDefault!14412 () ValueCell!3939)

(assert (=> b!367442 (= condMapEmpty!14412 (= (arr!10014 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3939)) mapDefault!14412)))))

(declare-fun b!367443 () Bool)

(declare-fun res!205718 () Bool)

(assert (=> b!367443 (=> (not res!205718) (not e!224865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367443 (= res!205718 (validKeyInArray!0 k0!778))))

(declare-fun b!367437 () Bool)

(declare-fun res!205717 () Bool)

(assert (=> b!367437 (=> (not res!205717) (not e!224865))))

(assert (=> b!367437 (= res!205717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!205714 () Bool)

(assert (=> start!36790 (=> (not res!205714) (not e!224865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36790 (= res!205714 (validMask!0 mask!970))))

(assert (=> start!36790 e!224865))

(assert (=> start!36790 true))

(declare-fun array_inv!7404 (array!21091) Bool)

(assert (=> start!36790 (and (array_inv!7404 _values!506) e!224867)))

(declare-fun array_inv!7405 (array!21089) Bool)

(assert (=> start!36790 (array_inv!7405 _keys!658)))

(declare-fun b!367444 () Bool)

(assert (=> b!367444 (= e!224863 tp_is_empty!8565)))

(declare-fun b!367445 () Bool)

(assert (=> b!367445 (= e!224862 false)))

(declare-fun lt!169382 () Bool)

(assert (=> b!367445 (= lt!169382 (arrayNoDuplicates!0 lt!169383 #b00000000000000000000000000000000 Nil!5564))))

(assert (= (and start!36790 res!205714) b!367436))

(assert (= (and b!367436 res!205719) b!367437))

(assert (= (and b!367437 res!205717) b!367434))

(assert (= (and b!367434 res!205721) b!367438))

(assert (= (and b!367438 res!205720) b!367443))

(assert (= (and b!367443 res!205718) b!367440))

(assert (= (and b!367440 res!205713) b!367441))

(assert (= (and b!367441 res!205715) b!367435))

(assert (= (and b!367435 res!205716) b!367445))

(assert (= (and b!367442 condMapEmpty!14412) mapIsEmpty!14412))

(assert (= (and b!367442 (not condMapEmpty!14412)) mapNonEmpty!14412))

(get-info :version)

(assert (= (and mapNonEmpty!14412 ((_ is ValueCellFull!3939) mapValue!14412)) b!367444))

(assert (= (and b!367442 ((_ is ValueCellFull!3939) mapDefault!14412)) b!367439))

(assert (= start!36790 b!367442))

(declare-fun m!364419 () Bool)

(assert (=> b!367445 m!364419))

(declare-fun m!364421 () Bool)

(assert (=> start!36790 m!364421))

(declare-fun m!364423 () Bool)

(assert (=> start!36790 m!364423))

(declare-fun m!364425 () Bool)

(assert (=> start!36790 m!364425))

(declare-fun m!364427 () Bool)

(assert (=> mapNonEmpty!14412 m!364427))

(declare-fun m!364429 () Bool)

(assert (=> b!367434 m!364429))

(declare-fun m!364431 () Bool)

(assert (=> b!367435 m!364431))

(declare-fun m!364433 () Bool)

(assert (=> b!367435 m!364433))

(declare-fun m!364435 () Bool)

(assert (=> b!367437 m!364435))

(declare-fun m!364437 () Bool)

(assert (=> b!367440 m!364437))

(declare-fun m!364439 () Bool)

(assert (=> b!367443 m!364439))

(declare-fun m!364441 () Bool)

(assert (=> b!367441 m!364441))

(check-sat (not b!367437) (not b!367445) (not b!367443) (not b!367435) (not mapNonEmpty!14412) (not b!367434) (not b!367441) (not start!36790) tp_is_empty!8565)
(check-sat)
