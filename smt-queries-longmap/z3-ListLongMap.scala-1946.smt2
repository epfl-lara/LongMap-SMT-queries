; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34408 () Bool)

(assert start!34408)

(declare-fun b_free!7345 () Bool)

(declare-fun b_next!7345 () Bool)

(assert (=> start!34408 (= b_free!7345 (not b_next!7345))))

(declare-fun tp!25580 () Bool)

(declare-fun b_and!14527 () Bool)

(assert (=> start!34408 (= tp!25580 b_and!14527)))

(declare-fun b!343430 () Bool)

(declare-fun res!189872 () Bool)

(declare-fun e!210564 () Bool)

(assert (=> b!343430 (=> (not res!189872) (not e!210564))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10707 0))(
  ( (V!10708 (val!3693 Int)) )
))
(declare-datatypes ((ValueCell!3305 0))(
  ( (ValueCellFull!3305 (v!5863 V!10707)) (EmptyCell!3305) )
))
(declare-datatypes ((array!18177 0))(
  ( (array!18178 (arr!8605 (Array (_ BitVec 32) ValueCell!3305)) (size!8958 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18177)

(declare-datatypes ((array!18179 0))(
  ( (array!18180 (arr!8606 (Array (_ BitVec 32) (_ BitVec 64))) (size!8959 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18179)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343430 (= res!189872 (and (= (size!8958 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8959 _keys!1895) (size!8958 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!189868 () Bool)

(assert (=> start!34408 (=> (not res!189868) (not e!210564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34408 (= res!189868 (validMask!0 mask!2385))))

(assert (=> start!34408 e!210564))

(assert (=> start!34408 true))

(declare-fun tp_is_empty!7297 () Bool)

(assert (=> start!34408 tp_is_empty!7297))

(assert (=> start!34408 tp!25580))

(declare-fun e!210566 () Bool)

(declare-fun array_inv!6392 (array!18177) Bool)

(assert (=> start!34408 (and (array_inv!6392 _values!1525) e!210566)))

(declare-fun array_inv!6393 (array!18179) Bool)

(assert (=> start!34408 (array_inv!6393 _keys!1895)))

(declare-fun b!343431 () Bool)

(declare-fun res!189869 () Bool)

(assert (=> b!343431 (=> (not res!189869) (not e!210564))))

(declare-datatypes ((List!4921 0))(
  ( (Nil!4918) (Cons!4917 (h!5773 (_ BitVec 64)) (t!10028 List!4921)) )
))
(declare-fun arrayNoDuplicates!0 (array!18179 (_ BitVec 32) List!4921) Bool)

(assert (=> b!343431 (= res!189869 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4918))))

(declare-fun b!343432 () Bool)

(declare-fun res!189871 () Bool)

(assert (=> b!343432 (=> (not res!189871) (not e!210564))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343432 (= res!189871 (validKeyInArray!0 k0!1348))))

(declare-fun b!343433 () Bool)

(declare-fun res!189870 () Bool)

(assert (=> b!343433 (=> (not res!189870) (not e!210564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18179 (_ BitVec 32)) Bool)

(assert (=> b!343433 (= res!189870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12384 () Bool)

(declare-fun mapRes!12384 () Bool)

(declare-fun tp!25581 () Bool)

(declare-fun e!210565 () Bool)

(assert (=> mapNonEmpty!12384 (= mapRes!12384 (and tp!25581 e!210565))))

(declare-fun mapValue!12384 () ValueCell!3305)

(declare-fun mapKey!12384 () (_ BitVec 32))

(declare-fun mapRest!12384 () (Array (_ BitVec 32) ValueCell!3305))

(assert (=> mapNonEmpty!12384 (= (arr!8605 _values!1525) (store mapRest!12384 mapKey!12384 mapValue!12384))))

(declare-fun mapIsEmpty!12384 () Bool)

(assert (=> mapIsEmpty!12384 mapRes!12384))

(declare-datatypes ((SeekEntryResult!3316 0))(
  ( (MissingZero!3316 (index!15443 (_ BitVec 32))) (Found!3316 (index!15444 (_ BitVec 32))) (Intermediate!3316 (undefined!4128 Bool) (index!15445 (_ BitVec 32)) (x!34201 (_ BitVec 32))) (Undefined!3316) (MissingVacant!3316 (index!15446 (_ BitVec 32))) )
))
(declare-fun lt!162357 () SeekEntryResult!3316)

(declare-fun b!343434 () Bool)

(get-info :version)

(assert (=> b!343434 (= e!210564 (and (not ((_ is Found!3316) lt!162357)) (not ((_ is MissingZero!3316) lt!162357)) (not ((_ is MissingVacant!3316) lt!162357)) ((_ is Undefined!3316) lt!162357) (not (= (size!8959 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18179 (_ BitVec 32)) SeekEntryResult!3316)

(assert (=> b!343434 (= lt!162357 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343435 () Bool)

(declare-fun e!210568 () Bool)

(assert (=> b!343435 (= e!210568 tp_is_empty!7297)))

(declare-fun b!343436 () Bool)

(assert (=> b!343436 (= e!210566 (and e!210568 mapRes!12384))))

(declare-fun condMapEmpty!12384 () Bool)

(declare-fun mapDefault!12384 () ValueCell!3305)

(assert (=> b!343436 (= condMapEmpty!12384 (= (arr!8605 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3305)) mapDefault!12384)))))

(declare-fun b!343437 () Bool)

(declare-fun res!189867 () Bool)

(assert (=> b!343437 (=> (not res!189867) (not e!210564))))

(declare-fun zeroValue!1467 () V!10707)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10707)

(declare-datatypes ((tuple2!5298 0))(
  ( (tuple2!5299 (_1!2660 (_ BitVec 64)) (_2!2660 V!10707)) )
))
(declare-datatypes ((List!4922 0))(
  ( (Nil!4919) (Cons!4918 (h!5774 tuple2!5298) (t!10029 List!4922)) )
))
(declare-datatypes ((ListLongMap!4201 0))(
  ( (ListLongMap!4202 (toList!2116 List!4922)) )
))
(declare-fun contains!2185 (ListLongMap!4201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1622 (array!18179 array!18177 (_ BitVec 32) (_ BitVec 32) V!10707 V!10707 (_ BitVec 32) Int) ListLongMap!4201)

(assert (=> b!343437 (= res!189867 (not (contains!2185 (getCurrentListMap!1622 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343438 () Bool)

(assert (=> b!343438 (= e!210565 tp_is_empty!7297)))

(assert (= (and start!34408 res!189868) b!343430))

(assert (= (and b!343430 res!189872) b!343433))

(assert (= (and b!343433 res!189870) b!343431))

(assert (= (and b!343431 res!189869) b!343432))

(assert (= (and b!343432 res!189871) b!343437))

(assert (= (and b!343437 res!189867) b!343434))

(assert (= (and b!343436 condMapEmpty!12384) mapIsEmpty!12384))

(assert (= (and b!343436 (not condMapEmpty!12384)) mapNonEmpty!12384))

(assert (= (and mapNonEmpty!12384 ((_ is ValueCellFull!3305) mapValue!12384)) b!343438))

(assert (= (and b!343436 ((_ is ValueCellFull!3305) mapDefault!12384)) b!343435))

(assert (= start!34408 b!343436))

(declare-fun m!344787 () Bool)

(assert (=> start!34408 m!344787))

(declare-fun m!344789 () Bool)

(assert (=> start!34408 m!344789))

(declare-fun m!344791 () Bool)

(assert (=> start!34408 m!344791))

(declare-fun m!344793 () Bool)

(assert (=> b!343434 m!344793))

(declare-fun m!344795 () Bool)

(assert (=> b!343437 m!344795))

(assert (=> b!343437 m!344795))

(declare-fun m!344797 () Bool)

(assert (=> b!343437 m!344797))

(declare-fun m!344799 () Bool)

(assert (=> b!343432 m!344799))

(declare-fun m!344801 () Bool)

(assert (=> mapNonEmpty!12384 m!344801))

(declare-fun m!344803 () Bool)

(assert (=> b!343433 m!344803))

(declare-fun m!344805 () Bool)

(assert (=> b!343431 m!344805))

(check-sat (not b_next!7345) b_and!14527 tp_is_empty!7297 (not b!343432) (not start!34408) (not b!343437) (not b!343431) (not b!343434) (not mapNonEmpty!12384) (not b!343433))
(check-sat b_and!14527 (not b_next!7345))
