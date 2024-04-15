; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34432 () Bool)

(assert start!34432)

(declare-fun b_free!7369 () Bool)

(declare-fun b_next!7369 () Bool)

(assert (=> start!34432 (= b_free!7369 (not b_next!7369))))

(declare-fun tp!25652 () Bool)

(declare-fun b_and!14551 () Bool)

(assert (=> start!34432 (= tp!25652 b_and!14551)))

(declare-fun b!343754 () Bool)

(declare-fun e!210748 () Bool)

(declare-fun e!210744 () Bool)

(declare-fun mapRes!12420 () Bool)

(assert (=> b!343754 (= e!210748 (and e!210744 mapRes!12420))))

(declare-fun condMapEmpty!12420 () Bool)

(declare-datatypes ((V!10739 0))(
  ( (V!10740 (val!3705 Int)) )
))
(declare-datatypes ((ValueCell!3317 0))(
  ( (ValueCellFull!3317 (v!5875 V!10739)) (EmptyCell!3317) )
))
(declare-datatypes ((array!18225 0))(
  ( (array!18226 (arr!8629 (Array (_ BitVec 32) ValueCell!3317)) (size!8982 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18225)

(declare-fun mapDefault!12420 () ValueCell!3317)

(assert (=> b!343754 (= condMapEmpty!12420 (= (arr!8629 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3317)) mapDefault!12420)))))

(declare-fun mapNonEmpty!12420 () Bool)

(declare-fun tp!25653 () Bool)

(declare-fun e!210747 () Bool)

(assert (=> mapNonEmpty!12420 (= mapRes!12420 (and tp!25653 e!210747))))

(declare-fun mapRest!12420 () (Array (_ BitVec 32) ValueCell!3317))

(declare-fun mapValue!12420 () ValueCell!3317)

(declare-fun mapKey!12420 () (_ BitVec 32))

(assert (=> mapNonEmpty!12420 (= (arr!8629 _values!1525) (store mapRest!12420 mapKey!12420 mapValue!12420))))

(declare-fun res!190087 () Bool)

(declare-fun e!210745 () Bool)

(assert (=> start!34432 (=> (not res!190087) (not e!210745))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34432 (= res!190087 (validMask!0 mask!2385))))

(assert (=> start!34432 e!210745))

(assert (=> start!34432 true))

(declare-fun tp_is_empty!7321 () Bool)

(assert (=> start!34432 tp_is_empty!7321))

(assert (=> start!34432 tp!25652))

(declare-fun array_inv!6414 (array!18225) Bool)

(assert (=> start!34432 (and (array_inv!6414 _values!1525) e!210748)))

(declare-datatypes ((array!18227 0))(
  ( (array!18228 (arr!8630 (Array (_ BitVec 32) (_ BitVec 64))) (size!8983 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18227)

(declare-fun array_inv!6415 (array!18227) Bool)

(assert (=> start!34432 (array_inv!6415 _keys!1895)))

(declare-fun mapIsEmpty!12420 () Bool)

(assert (=> mapIsEmpty!12420 mapRes!12420))

(declare-fun b!343755 () Bool)

(declare-fun res!190084 () Bool)

(assert (=> b!343755 (=> (not res!190084) (not e!210745))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343755 (= res!190084 (validKeyInArray!0 k0!1348))))

(declare-fun b!343756 () Bool)

(assert (=> b!343756 (= e!210744 tp_is_empty!7321)))

(declare-fun b!343757 () Bool)

(assert (=> b!343757 (= e!210747 tp_is_empty!7321)))

(declare-fun b!343758 () Bool)

(declare-fun res!190083 () Bool)

(assert (=> b!343758 (=> (not res!190083) (not e!210745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18227 (_ BitVec 32)) Bool)

(assert (=> b!343758 (= res!190083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343759 () Bool)

(assert (=> b!343759 (= e!210745 false)))

(declare-datatypes ((SeekEntryResult!3327 0))(
  ( (MissingZero!3327 (index!15487 (_ BitVec 32))) (Found!3327 (index!15488 (_ BitVec 32))) (Intermediate!3327 (undefined!4139 Bool) (index!15489 (_ BitVec 32)) (x!34244 (_ BitVec 32))) (Undefined!3327) (MissingVacant!3327 (index!15490 (_ BitVec 32))) )
))
(declare-fun lt!162393 () SeekEntryResult!3327)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18227 (_ BitVec 32)) SeekEntryResult!3327)

(assert (=> b!343759 (= lt!162393 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343760 () Bool)

(declare-fun res!190088 () Bool)

(assert (=> b!343760 (=> (not res!190088) (not e!210745))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343760 (= res!190088 (and (= (size!8982 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8983 _keys!1895) (size!8982 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343761 () Bool)

(declare-fun res!190086 () Bool)

(assert (=> b!343761 (=> (not res!190086) (not e!210745))))

(declare-fun zeroValue!1467 () V!10739)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10739)

(declare-datatypes ((tuple2!5318 0))(
  ( (tuple2!5319 (_1!2670 (_ BitVec 64)) (_2!2670 V!10739)) )
))
(declare-datatypes ((List!4941 0))(
  ( (Nil!4938) (Cons!4937 (h!5793 tuple2!5318) (t!10048 List!4941)) )
))
(declare-datatypes ((ListLongMap!4221 0))(
  ( (ListLongMap!4222 (toList!2126 List!4941)) )
))
(declare-fun contains!2195 (ListLongMap!4221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1632 (array!18227 array!18225 (_ BitVec 32) (_ BitVec 32) V!10739 V!10739 (_ BitVec 32) Int) ListLongMap!4221)

(assert (=> b!343761 (= res!190086 (not (contains!2195 (getCurrentListMap!1632 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343762 () Bool)

(declare-fun res!190085 () Bool)

(assert (=> b!343762 (=> (not res!190085) (not e!210745))))

(declare-datatypes ((List!4942 0))(
  ( (Nil!4939) (Cons!4938 (h!5794 (_ BitVec 64)) (t!10049 List!4942)) )
))
(declare-fun arrayNoDuplicates!0 (array!18227 (_ BitVec 32) List!4942) Bool)

(assert (=> b!343762 (= res!190085 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4939))))

(assert (= (and start!34432 res!190087) b!343760))

(assert (= (and b!343760 res!190088) b!343758))

(assert (= (and b!343758 res!190083) b!343762))

(assert (= (and b!343762 res!190085) b!343755))

(assert (= (and b!343755 res!190084) b!343761))

(assert (= (and b!343761 res!190086) b!343759))

(assert (= (and b!343754 condMapEmpty!12420) mapIsEmpty!12420))

(assert (= (and b!343754 (not condMapEmpty!12420)) mapNonEmpty!12420))

(get-info :version)

(assert (= (and mapNonEmpty!12420 ((_ is ValueCellFull!3317) mapValue!12420)) b!343757))

(assert (= (and b!343754 ((_ is ValueCellFull!3317) mapDefault!12420)) b!343756))

(assert (= start!34432 b!343754))

(declare-fun m!345027 () Bool)

(assert (=> b!343755 m!345027))

(declare-fun m!345029 () Bool)

(assert (=> mapNonEmpty!12420 m!345029))

(declare-fun m!345031 () Bool)

(assert (=> b!343759 m!345031))

(declare-fun m!345033 () Bool)

(assert (=> b!343762 m!345033))

(declare-fun m!345035 () Bool)

(assert (=> b!343758 m!345035))

(declare-fun m!345037 () Bool)

(assert (=> start!34432 m!345037))

(declare-fun m!345039 () Bool)

(assert (=> start!34432 m!345039))

(declare-fun m!345041 () Bool)

(assert (=> start!34432 m!345041))

(declare-fun m!345043 () Bool)

(assert (=> b!343761 m!345043))

(assert (=> b!343761 m!345043))

(declare-fun m!345045 () Bool)

(assert (=> b!343761 m!345045))

(check-sat b_and!14551 (not b!343762) (not start!34432) (not mapNonEmpty!12420) (not b_next!7369) (not b!343758) tp_is_empty!7321 (not b!343761) (not b!343755) (not b!343759))
(check-sat b_and!14551 (not b_next!7369))
