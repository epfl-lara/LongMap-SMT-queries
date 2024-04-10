; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35118 () Bool)

(assert start!35118)

(declare-fun b_free!7763 () Bool)

(declare-fun b_next!7763 () Bool)

(assert (=> start!35118 (= b_free!7763 (not b_next!7763))))

(declare-fun tp!26873 () Bool)

(declare-fun b_and!14997 () Bool)

(assert (=> start!35118 (= tp!26873 b_and!14997)))

(declare-fun b!352164 () Bool)

(declare-fun res!195313 () Bool)

(declare-fun e!215652 () Bool)

(assert (=> b!352164 (=> (not res!195313) (not e!215652))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11263 0))(
  ( (V!11264 (val!3902 Int)) )
))
(declare-datatypes ((ValueCell!3514 0))(
  ( (ValueCellFull!3514 (v!6091 V!11263)) (EmptyCell!3514) )
))
(declare-datatypes ((array!19019 0))(
  ( (array!19020 (arr!9013 (Array (_ BitVec 32) ValueCell!3514)) (size!9365 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19019)

(declare-datatypes ((array!19021 0))(
  ( (array!19022 (arr!9014 (Array (_ BitVec 32) (_ BitVec 64))) (size!9366 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19021)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352164 (= res!195313 (and (= (size!9365 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9366 _keys!1895) (size!9365 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352165 () Bool)

(declare-fun e!215650 () Bool)

(declare-fun tp_is_empty!7715 () Bool)

(assert (=> b!352165 (= e!215650 tp_is_empty!7715)))

(declare-fun mapIsEmpty!13050 () Bool)

(declare-fun mapRes!13050 () Bool)

(assert (=> mapIsEmpty!13050 mapRes!13050))

(declare-fun b!352166 () Bool)

(declare-fun res!195318 () Bool)

(assert (=> b!352166 (=> (not res!195318) (not e!215652))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352166 (= res!195318 (validKeyInArray!0 k!1348))))

(declare-fun b!352167 () Bool)

(declare-fun e!215646 () Bool)

(assert (=> b!352167 (= e!215652 e!215646)))

(declare-fun res!195312 () Bool)

(assert (=> b!352167 (=> (not res!195312) (not e!215646))))

(declare-datatypes ((SeekEntryResult!3467 0))(
  ( (MissingZero!3467 (index!16047 (_ BitVec 32))) (Found!3467 (index!16048 (_ BitVec 32))) (Intermediate!3467 (undefined!4279 Bool) (index!16049 (_ BitVec 32)) (x!35039 (_ BitVec 32))) (Undefined!3467) (MissingVacant!3467 (index!16050 (_ BitVec 32))) )
))
(declare-fun lt!165078 () SeekEntryResult!3467)

(assert (=> b!352167 (= res!195312 (and (not (is-Found!3467 lt!165078)) (not (is-MissingZero!3467 lt!165078)) (is-MissingVacant!3467 lt!165078)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19021 (_ BitVec 32)) SeekEntryResult!3467)

(assert (=> b!352167 (= lt!165078 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!352168 () Bool)

(declare-fun res!195314 () Bool)

(assert (=> b!352168 (=> (not res!195314) (not e!215652))))

(declare-fun zeroValue!1467 () V!11263)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11263)

(declare-datatypes ((tuple2!5626 0))(
  ( (tuple2!5627 (_1!2824 (_ BitVec 64)) (_2!2824 V!11263)) )
))
(declare-datatypes ((List!5247 0))(
  ( (Nil!5244) (Cons!5243 (h!6099 tuple2!5626) (t!10389 List!5247)) )
))
(declare-datatypes ((ListLongMap!4539 0))(
  ( (ListLongMap!4540 (toList!2285 List!5247)) )
))
(declare-fun contains!2356 (ListLongMap!4539 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1806 (array!19021 array!19019 (_ BitVec 32) (_ BitVec 32) V!11263 V!11263 (_ BitVec 32) Int) ListLongMap!4539)

(assert (=> b!352168 (= res!195314 (not (contains!2356 (getCurrentListMap!1806 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!352169 () Bool)

(declare-fun e!215649 () Bool)

(assert (=> b!352169 (= e!215649 tp_is_empty!7715)))

(declare-fun b!352170 () Bool)

(declare-datatypes ((Unit!10893 0))(
  ( (Unit!10894) )
))
(declare-fun e!215651 () Unit!10893)

(declare-fun Unit!10895 () Unit!10893)

(assert (=> b!352170 (= e!215651 Unit!10895)))

(declare-fun lt!165076 () Unit!10893)

(declare-fun lemmaArrayContainsKeyThenInListMap!334 (array!19021 array!19019 (_ BitVec 32) (_ BitVec 32) V!11263 V!11263 (_ BitVec 64) (_ BitVec 32) Int) Unit!10893)

(declare-fun arrayScanForKey!0 (array!19021 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!352170 (= lt!165076 (lemmaArrayContainsKeyThenInListMap!334 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!352170 false))

(declare-fun b!352172 () Bool)

(declare-fun Unit!10896 () Unit!10893)

(assert (=> b!352172 (= e!215651 Unit!10896)))

(declare-fun mapNonEmpty!13050 () Bool)

(declare-fun tp!26874 () Bool)

(assert (=> mapNonEmpty!13050 (= mapRes!13050 (and tp!26874 e!215649))))

(declare-fun mapValue!13050 () ValueCell!3514)

(declare-fun mapRest!13050 () (Array (_ BitVec 32) ValueCell!3514))

(declare-fun mapKey!13050 () (_ BitVec 32))

(assert (=> mapNonEmpty!13050 (= (arr!9013 _values!1525) (store mapRest!13050 mapKey!13050 mapValue!13050))))

(declare-fun b!352173 () Bool)

(declare-fun res!195316 () Bool)

(assert (=> b!352173 (=> (not res!195316) (not e!215652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19021 (_ BitVec 32)) Bool)

(assert (=> b!352173 (= res!195316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352174 () Bool)

(declare-fun e!215645 () Bool)

(assert (=> b!352174 (= e!215645 (and e!215650 mapRes!13050))))

(declare-fun condMapEmpty!13050 () Bool)

(declare-fun mapDefault!13050 () ValueCell!3514)

