; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34804 () Bool)

(assert start!34804)

(declare-fun b_free!7589 () Bool)

(declare-fun b_next!7589 () Bool)

(assert (=> start!34804 (= b_free!7589 (not b_next!7589))))

(declare-fun tp!26334 () Bool)

(declare-fun b_and!14811 () Bool)

(assert (=> start!34804 (= tp!26334 b_and!14811)))

(declare-fun res!192898 () Bool)

(declare-fun e!213394 () Bool)

(assert (=> start!34804 (=> (not res!192898) (not e!213394))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34804 (= res!192898 (validMask!0 mask!2385))))

(assert (=> start!34804 e!213394))

(assert (=> start!34804 true))

(declare-fun tp_is_empty!7541 () Bool)

(assert (=> start!34804 tp_is_empty!7541))

(assert (=> start!34804 tp!26334))

(declare-datatypes ((V!11031 0))(
  ( (V!11032 (val!3815 Int)) )
))
(declare-datatypes ((ValueCell!3427 0))(
  ( (ValueCellFull!3427 (v!5998 V!11031)) (EmptyCell!3427) )
))
(declare-datatypes ((array!18669 0))(
  ( (array!18670 (arr!8844 (Array (_ BitVec 32) ValueCell!3427)) (size!9196 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18669)

(declare-fun e!213395 () Bool)

(declare-fun array_inv!6550 (array!18669) Bool)

(assert (=> start!34804 (and (array_inv!6550 _values!1525) e!213395)))

(declare-datatypes ((array!18671 0))(
  ( (array!18672 (arr!8845 (Array (_ BitVec 32) (_ BitVec 64))) (size!9197 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18671)

(declare-fun array_inv!6551 (array!18671) Bool)

(assert (=> start!34804 (array_inv!6551 _keys!1895)))

(declare-fun b!348278 () Bool)

(declare-fun e!213397 () Bool)

(assert (=> b!348278 (= e!213397 tp_is_empty!7541)))

(declare-fun b!348279 () Bool)

(declare-fun res!192900 () Bool)

(assert (=> b!348279 (=> (not res!192900) (not e!213394))))

(declare-datatypes ((List!5138 0))(
  ( (Nil!5135) (Cons!5134 (h!5990 (_ BitVec 64)) (t!10268 List!5138)) )
))
(declare-fun arrayNoDuplicates!0 (array!18671 (_ BitVec 32) List!5138) Bool)

(assert (=> b!348279 (= res!192900 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5135))))

(declare-fun b!348280 () Bool)

(declare-fun e!213396 () Bool)

(assert (=> b!348280 (= e!213396 false)))

(declare-fun lt!163848 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18671 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348280 (= lt!163848 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12771 () Bool)

(declare-fun mapRes!12771 () Bool)

(assert (=> mapIsEmpty!12771 mapRes!12771))

(declare-fun b!348281 () Bool)

(declare-fun res!192903 () Bool)

(assert (=> b!348281 (=> (not res!192903) (not e!213394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18671 (_ BitVec 32)) Bool)

(assert (=> b!348281 (= res!192903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12771 () Bool)

(declare-fun tp!26333 () Bool)

(declare-fun e!213398 () Bool)

(assert (=> mapNonEmpty!12771 (= mapRes!12771 (and tp!26333 e!213398))))

(declare-fun mapValue!12771 () ValueCell!3427)

(declare-fun mapRest!12771 () (Array (_ BitVec 32) ValueCell!3427))

(declare-fun mapKey!12771 () (_ BitVec 32))

(assert (=> mapNonEmpty!12771 (= (arr!8844 _values!1525) (store mapRest!12771 mapKey!12771 mapValue!12771))))

(declare-fun b!348282 () Bool)

(assert (=> b!348282 (= e!213394 e!213396)))

(declare-fun res!192897 () Bool)

(assert (=> b!348282 (=> (not res!192897) (not e!213396))))

(declare-datatypes ((SeekEntryResult!3412 0))(
  ( (MissingZero!3412 (index!15827 (_ BitVec 32))) (Found!3412 (index!15828 (_ BitVec 32))) (Intermediate!3412 (undefined!4224 Bool) (index!15829 (_ BitVec 32)) (x!34692 (_ BitVec 32))) (Undefined!3412) (MissingVacant!3412 (index!15830 (_ BitVec 32))) )
))
(declare-fun lt!163849 () SeekEntryResult!3412)

(assert (=> b!348282 (= res!192897 (and (not (is-Found!3412 lt!163849)) (is-MissingZero!3412 lt!163849)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18671 (_ BitVec 32)) SeekEntryResult!3412)

(assert (=> b!348282 (= lt!163849 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!348283 () Bool)

(declare-fun res!192904 () Bool)

(assert (=> b!348283 (=> (not res!192904) (not e!213394))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!348283 (= res!192904 (and (= (size!9196 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9197 _keys!1895) (size!9196 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348284 () Bool)

(assert (=> b!348284 (= e!213398 tp_is_empty!7541)))

(declare-fun b!348285 () Bool)

(declare-fun res!192901 () Bool)

(assert (=> b!348285 (=> (not res!192901) (not e!213394))))

(declare-fun zeroValue!1467 () V!11031)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11031)

(declare-datatypes ((tuple2!5516 0))(
  ( (tuple2!5517 (_1!2769 (_ BitVec 64)) (_2!2769 V!11031)) )
))
(declare-datatypes ((List!5139 0))(
  ( (Nil!5136) (Cons!5135 (h!5991 tuple2!5516) (t!10269 List!5139)) )
))
(declare-datatypes ((ListLongMap!4429 0))(
  ( (ListLongMap!4430 (toList!2230 List!5139)) )
))
(declare-fun contains!2295 (ListLongMap!4429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1751 (array!18671 array!18669 (_ BitVec 32) (_ BitVec 32) V!11031 V!11031 (_ BitVec 32) Int) ListLongMap!4429)

(assert (=> b!348285 (= res!192901 (not (contains!2295 (getCurrentListMap!1751 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!348286 () Bool)

(declare-fun res!192902 () Bool)

(assert (=> b!348286 (=> (not res!192902) (not e!213396))))

(declare-fun arrayContainsKey!0 (array!18671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348286 (= res!192902 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348287 () Bool)

(assert (=> b!348287 (= e!213395 (and e!213397 mapRes!12771))))

(declare-fun condMapEmpty!12771 () Bool)

(declare-fun mapDefault!12771 () ValueCell!3427)

