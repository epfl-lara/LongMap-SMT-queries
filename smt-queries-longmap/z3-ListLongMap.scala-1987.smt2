; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34808 () Bool)

(assert start!34808)

(declare-fun b_free!7593 () Bool)

(declare-fun b_next!7593 () Bool)

(assert (=> start!34808 (= b_free!7593 (not b_next!7593))))

(declare-fun tp!26346 () Bool)

(declare-fun b_and!14815 () Bool)

(assert (=> start!34808 (= tp!26346 b_and!14815)))

(declare-fun b!348344 () Bool)

(declare-fun res!192945 () Bool)

(declare-fun e!213434 () Bool)

(assert (=> b!348344 (=> (not res!192945) (not e!213434))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348344 (= res!192945 (validKeyInArray!0 k0!1348))))

(declare-fun b!348345 () Bool)

(declare-fun e!213433 () Bool)

(declare-fun e!213430 () Bool)

(declare-fun mapRes!12777 () Bool)

(assert (=> b!348345 (= e!213433 (and e!213430 mapRes!12777))))

(declare-fun condMapEmpty!12777 () Bool)

(declare-datatypes ((V!11037 0))(
  ( (V!11038 (val!3817 Int)) )
))
(declare-datatypes ((ValueCell!3429 0))(
  ( (ValueCellFull!3429 (v!6000 V!11037)) (EmptyCell!3429) )
))
(declare-datatypes ((array!18677 0))(
  ( (array!18678 (arr!8848 (Array (_ BitVec 32) ValueCell!3429)) (size!9200 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18677)

(declare-fun mapDefault!12777 () ValueCell!3429)

(assert (=> b!348345 (= condMapEmpty!12777 (= (arr!8848 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3429)) mapDefault!12777)))))

(declare-fun mapIsEmpty!12777 () Bool)

(assert (=> mapIsEmpty!12777 mapRes!12777))

(declare-fun b!348346 () Bool)

(declare-fun e!213429 () Bool)

(assert (=> b!348346 (= e!213434 e!213429)))

(declare-fun res!192946 () Bool)

(assert (=> b!348346 (=> (not res!192946) (not e!213429))))

(declare-datatypes ((SeekEntryResult!3413 0))(
  ( (MissingZero!3413 (index!15831 (_ BitVec 32))) (Found!3413 (index!15832 (_ BitVec 32))) (Intermediate!3413 (undefined!4225 Bool) (index!15833 (_ BitVec 32)) (x!34701 (_ BitVec 32))) (Undefined!3413) (MissingVacant!3413 (index!15834 (_ BitVec 32))) )
))
(declare-fun lt!163860 () SeekEntryResult!3413)

(get-info :version)

(assert (=> b!348346 (= res!192946 (and (not ((_ is Found!3413) lt!163860)) ((_ is MissingZero!3413) lt!163860)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!18679 0))(
  ( (array!18680 (arr!8849 (Array (_ BitVec 32) (_ BitVec 64))) (size!9201 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18679)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18679 (_ BitVec 32)) SeekEntryResult!3413)

(assert (=> b!348346 (= lt!163860 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!348347 () Bool)

(declare-fun res!192951 () Bool)

(assert (=> b!348347 (=> (not res!192951) (not e!213434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18679 (_ BitVec 32)) Bool)

(assert (=> b!348347 (= res!192951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!348348 () Bool)

(declare-fun res!192949 () Bool)

(assert (=> b!348348 (=> (not res!192949) (not e!213429))))

(declare-fun arrayContainsKey!0 (array!18679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348348 (= res!192949 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!348349 () Bool)

(declare-fun tp_is_empty!7545 () Bool)

(assert (=> b!348349 (= e!213430 tp_is_empty!7545)))

(declare-fun b!348350 () Bool)

(declare-fun res!192947 () Bool)

(assert (=> b!348350 (=> (not res!192947) (not e!213434))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348350 (= res!192947 (and (= (size!9200 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9201 _keys!1895) (size!9200 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348351 () Bool)

(declare-fun e!213431 () Bool)

(assert (=> b!348351 (= e!213431 tp_is_empty!7545)))

(declare-fun mapNonEmpty!12777 () Bool)

(declare-fun tp!26345 () Bool)

(assert (=> mapNonEmpty!12777 (= mapRes!12777 (and tp!26345 e!213431))))

(declare-fun mapKey!12777 () (_ BitVec 32))

(declare-fun mapValue!12777 () ValueCell!3429)

(declare-fun mapRest!12777 () (Array (_ BitVec 32) ValueCell!3429))

(assert (=> mapNonEmpty!12777 (= (arr!8848 _values!1525) (store mapRest!12777 mapKey!12777 mapValue!12777))))

(declare-fun b!348352 () Bool)

(declare-fun res!192948 () Bool)

(assert (=> b!348352 (=> (not res!192948) (not e!213434))))

(declare-fun zeroValue!1467 () V!11037)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11037)

(declare-datatypes ((tuple2!5520 0))(
  ( (tuple2!5521 (_1!2771 (_ BitVec 64)) (_2!2771 V!11037)) )
))
(declare-datatypes ((List!5141 0))(
  ( (Nil!5138) (Cons!5137 (h!5993 tuple2!5520) (t!10271 List!5141)) )
))
(declare-datatypes ((ListLongMap!4433 0))(
  ( (ListLongMap!4434 (toList!2232 List!5141)) )
))
(declare-fun contains!2297 (ListLongMap!4433 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1753 (array!18679 array!18677 (_ BitVec 32) (_ BitVec 32) V!11037 V!11037 (_ BitVec 32) Int) ListLongMap!4433)

(assert (=> b!348352 (= res!192948 (not (contains!2297 (getCurrentListMap!1753 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!192950 () Bool)

(assert (=> start!34808 (=> (not res!192950) (not e!213434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34808 (= res!192950 (validMask!0 mask!2385))))

(assert (=> start!34808 e!213434))

(assert (=> start!34808 true))

(assert (=> start!34808 tp_is_empty!7545))

(assert (=> start!34808 tp!26346))

(declare-fun array_inv!6552 (array!18677) Bool)

(assert (=> start!34808 (and (array_inv!6552 _values!1525) e!213433)))

(declare-fun array_inv!6553 (array!18679) Bool)

(assert (=> start!34808 (array_inv!6553 _keys!1895)))

(declare-fun b!348353 () Bool)

(declare-fun res!192952 () Bool)

(assert (=> b!348353 (=> (not res!192952) (not e!213434))))

(declare-datatypes ((List!5142 0))(
  ( (Nil!5139) (Cons!5138 (h!5994 (_ BitVec 64)) (t!10272 List!5142)) )
))
(declare-fun arrayNoDuplicates!0 (array!18679 (_ BitVec 32) List!5142) Bool)

(assert (=> b!348353 (= res!192952 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5139))))

(declare-fun b!348354 () Bool)

(assert (=> b!348354 (= e!213429 false)))

(declare-fun lt!163861 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18679 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348354 (= lt!163861 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34808 res!192950) b!348350))

(assert (= (and b!348350 res!192947) b!348347))

(assert (= (and b!348347 res!192951) b!348353))

(assert (= (and b!348353 res!192952) b!348344))

(assert (= (and b!348344 res!192945) b!348352))

(assert (= (and b!348352 res!192948) b!348346))

(assert (= (and b!348346 res!192946) b!348348))

(assert (= (and b!348348 res!192949) b!348354))

(assert (= (and b!348345 condMapEmpty!12777) mapIsEmpty!12777))

(assert (= (and b!348345 (not condMapEmpty!12777)) mapNonEmpty!12777))

(assert (= (and mapNonEmpty!12777 ((_ is ValueCellFull!3429) mapValue!12777)) b!348351))

(assert (= (and b!348345 ((_ is ValueCellFull!3429) mapDefault!12777)) b!348349))

(assert (= start!34808 b!348345))

(declare-fun m!349141 () Bool)

(assert (=> b!348348 m!349141))

(declare-fun m!349143 () Bool)

(assert (=> b!348352 m!349143))

(assert (=> b!348352 m!349143))

(declare-fun m!349145 () Bool)

(assert (=> b!348352 m!349145))

(declare-fun m!349147 () Bool)

(assert (=> b!348354 m!349147))

(declare-fun m!349149 () Bool)

(assert (=> b!348347 m!349149))

(declare-fun m!349151 () Bool)

(assert (=> b!348346 m!349151))

(declare-fun m!349153 () Bool)

(assert (=> b!348353 m!349153))

(declare-fun m!349155 () Bool)

(assert (=> mapNonEmpty!12777 m!349155))

(declare-fun m!349157 () Bool)

(assert (=> b!348344 m!349157))

(declare-fun m!349159 () Bool)

(assert (=> start!34808 m!349159))

(declare-fun m!349161 () Bool)

(assert (=> start!34808 m!349161))

(declare-fun m!349163 () Bool)

(assert (=> start!34808 m!349163))

(check-sat tp_is_empty!7545 (not b!348353) (not start!34808) (not b!348346) (not mapNonEmpty!12777) (not b_next!7593) (not b!348348) (not b!348347) (not b!348354) (not b!348352) b_and!14815 (not b!348344))
(check-sat b_and!14815 (not b_next!7593))
