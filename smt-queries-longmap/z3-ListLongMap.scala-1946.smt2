; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34408 () Bool)

(assert start!34408)

(declare-fun b_free!7345 () Bool)

(declare-fun b_next!7345 () Bool)

(assert (=> start!34408 (= b_free!7345 (not b_next!7345))))

(declare-fun tp!25581 () Bool)

(declare-fun b_and!14567 () Bool)

(assert (=> start!34408 (= tp!25581 b_and!14567)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!343652 () Bool)

(declare-datatypes ((array!18182 0))(
  ( (array!18183 (arr!8607 (Array (_ BitVec 32) (_ BitVec 64))) (size!8959 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18182)

(declare-datatypes ((SeekEntryResult!3272 0))(
  ( (MissingZero!3272 (index!15267 (_ BitVec 32))) (Found!3272 (index!15268 (_ BitVec 32))) (Intermediate!3272 (undefined!4084 Bool) (index!15269 (_ BitVec 32)) (x!34159 (_ BitVec 32))) (Undefined!3272) (MissingVacant!3272 (index!15270 (_ BitVec 32))) )
))
(declare-fun lt!162610 () SeekEntryResult!3272)

(declare-fun e!210707 () Bool)

(get-info :version)

(assert (=> b!343652 (= e!210707 (and (not ((_ is Found!3272) lt!162610)) (not ((_ is MissingZero!3272) lt!162610)) (not ((_ is MissingVacant!3272) lt!162610)) ((_ is Undefined!3272) lt!162610) (not (= (size!8959 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18182 (_ BitVec 32)) SeekEntryResult!3272)

(assert (=> b!343652 (= lt!162610 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12384 () Bool)

(declare-fun mapRes!12384 () Bool)

(assert (=> mapIsEmpty!12384 mapRes!12384))

(declare-fun b!343653 () Bool)

(declare-fun res!189998 () Bool)

(assert (=> b!343653 (=> (not res!189998) (not e!210707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18182 (_ BitVec 32)) Bool)

(assert (=> b!343653 (= res!189998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343655 () Bool)

(declare-fun res!189995 () Bool)

(assert (=> b!343655 (=> (not res!189995) (not e!210707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343655 (= res!189995 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!12384 () Bool)

(declare-fun tp!25580 () Bool)

(declare-fun e!210708 () Bool)

(assert (=> mapNonEmpty!12384 (= mapRes!12384 (and tp!25580 e!210708))))

(declare-datatypes ((V!10707 0))(
  ( (V!10708 (val!3693 Int)) )
))
(declare-datatypes ((ValueCell!3305 0))(
  ( (ValueCellFull!3305 (v!5870 V!10707)) (EmptyCell!3305) )
))
(declare-fun mapRest!12384 () (Array (_ BitVec 32) ValueCell!3305))

(declare-fun mapValue!12384 () ValueCell!3305)

(declare-datatypes ((array!18184 0))(
  ( (array!18185 (arr!8608 (Array (_ BitVec 32) ValueCell!3305)) (size!8960 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18184)

(declare-fun mapKey!12384 () (_ BitVec 32))

(assert (=> mapNonEmpty!12384 (= (arr!8608 _values!1525) (store mapRest!12384 mapKey!12384 mapValue!12384))))

(declare-fun b!343656 () Bool)

(declare-fun tp_is_empty!7297 () Bool)

(assert (=> b!343656 (= e!210708 tp_is_empty!7297)))

(declare-fun b!343654 () Bool)

(declare-fun res!189993 () Bool)

(assert (=> b!343654 (=> (not res!189993) (not e!210707))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343654 (= res!189993 (and (= (size!8960 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8959 _keys!1895) (size!8960 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!189996 () Bool)

(assert (=> start!34408 (=> (not res!189996) (not e!210707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34408 (= res!189996 (validMask!0 mask!2385))))

(assert (=> start!34408 e!210707))

(assert (=> start!34408 true))

(assert (=> start!34408 tp_is_empty!7297))

(assert (=> start!34408 tp!25581))

(declare-fun e!210710 () Bool)

(declare-fun array_inv!6358 (array!18184) Bool)

(assert (=> start!34408 (and (array_inv!6358 _values!1525) e!210710)))

(declare-fun array_inv!6359 (array!18182) Bool)

(assert (=> start!34408 (array_inv!6359 _keys!1895)))

(declare-fun b!343657 () Bool)

(declare-fun e!210709 () Bool)

(assert (=> b!343657 (= e!210709 tp_is_empty!7297)))

(declare-fun b!343658 () Bool)

(assert (=> b!343658 (= e!210710 (and e!210709 mapRes!12384))))

(declare-fun condMapEmpty!12384 () Bool)

(declare-fun mapDefault!12384 () ValueCell!3305)

(assert (=> b!343658 (= condMapEmpty!12384 (= (arr!8608 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3305)) mapDefault!12384)))))

(declare-fun b!343659 () Bool)

(declare-fun res!189994 () Bool)

(assert (=> b!343659 (=> (not res!189994) (not e!210707))))

(declare-datatypes ((List!4871 0))(
  ( (Nil!4868) (Cons!4867 (h!5723 (_ BitVec 64)) (t!9979 List!4871)) )
))
(declare-fun arrayNoDuplicates!0 (array!18182 (_ BitVec 32) List!4871) Bool)

(assert (=> b!343659 (= res!189994 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4868))))

(declare-fun b!343660 () Bool)

(declare-fun res!189997 () Bool)

(assert (=> b!343660 (=> (not res!189997) (not e!210707))))

(declare-fun zeroValue!1467 () V!10707)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10707)

(declare-datatypes ((tuple2!5268 0))(
  ( (tuple2!5269 (_1!2645 (_ BitVec 64)) (_2!2645 V!10707)) )
))
(declare-datatypes ((List!4872 0))(
  ( (Nil!4869) (Cons!4868 (h!5724 tuple2!5268) (t!9980 List!4872)) )
))
(declare-datatypes ((ListLongMap!4183 0))(
  ( (ListLongMap!4184 (toList!2107 List!4872)) )
))
(declare-fun contains!2184 (ListLongMap!4183 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1636 (array!18182 array!18184 (_ BitVec 32) (_ BitVec 32) V!10707 V!10707 (_ BitVec 32) Int) ListLongMap!4183)

(assert (=> b!343660 (= res!189997 (not (contains!2184 (getCurrentListMap!1636 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!34408 res!189996) b!343654))

(assert (= (and b!343654 res!189993) b!343653))

(assert (= (and b!343653 res!189998) b!343659))

(assert (= (and b!343659 res!189994) b!343655))

(assert (= (and b!343655 res!189995) b!343660))

(assert (= (and b!343660 res!189997) b!343652))

(assert (= (and b!343658 condMapEmpty!12384) mapIsEmpty!12384))

(assert (= (and b!343658 (not condMapEmpty!12384)) mapNonEmpty!12384))

(assert (= (and mapNonEmpty!12384 ((_ is ValueCellFull!3305) mapValue!12384)) b!343656))

(assert (= (and b!343658 ((_ is ValueCellFull!3305) mapDefault!12384)) b!343657))

(assert (= start!34408 b!343658))

(declare-fun m!345741 () Bool)

(assert (=> start!34408 m!345741))

(declare-fun m!345743 () Bool)

(assert (=> start!34408 m!345743))

(declare-fun m!345745 () Bool)

(assert (=> start!34408 m!345745))

(declare-fun m!345747 () Bool)

(assert (=> b!343660 m!345747))

(assert (=> b!343660 m!345747))

(declare-fun m!345749 () Bool)

(assert (=> b!343660 m!345749))

(declare-fun m!345751 () Bool)

(assert (=> b!343655 m!345751))

(declare-fun m!345753 () Bool)

(assert (=> b!343659 m!345753))

(declare-fun m!345755 () Bool)

(assert (=> b!343652 m!345755))

(declare-fun m!345757 () Bool)

(assert (=> b!343653 m!345757))

(declare-fun m!345759 () Bool)

(assert (=> mapNonEmpty!12384 m!345759))

(check-sat (not mapNonEmpty!12384) b_and!14567 (not b!343659) (not b!343655) (not b!343660) (not b!343653) (not b!343652) (not start!34408) (not b_next!7345) tp_is_empty!7297)
(check-sat b_and!14567 (not b_next!7345))
