; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35200 () Bool)

(assert start!35200)

(declare-fun b_free!7793 () Bool)

(declare-fun b_next!7793 () Bool)

(assert (=> start!35200 (= b_free!7793 (not b_next!7793))))

(declare-fun tp!26969 () Bool)

(declare-fun b_and!15031 () Bool)

(assert (=> start!35200 (= tp!26969 b_and!15031)))

(declare-fun b!352915 () Bool)

(declare-fun res!195717 () Bool)

(declare-fun e!216102 () Bool)

(assert (=> b!352915 (=> (not res!195717) (not e!216102))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352915 (= res!195717 (validKeyInArray!0 k!1348))))

(declare-fun b!352916 () Bool)

(declare-fun e!216098 () Bool)

(declare-fun tp_is_empty!7745 () Bool)

(assert (=> b!352916 (= e!216098 tp_is_empty!7745)))

(declare-fun mapIsEmpty!13101 () Bool)

(declare-fun mapRes!13101 () Bool)

(assert (=> mapIsEmpty!13101 mapRes!13101))

(declare-fun b!352917 () Bool)

(declare-fun res!195718 () Bool)

(assert (=> b!352917 (=> (not res!195718) (not e!216102))))

(declare-datatypes ((array!19079 0))(
  ( (array!19080 (arr!9041 (Array (_ BitVec 32) (_ BitVec 64))) (size!9393 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19079)

(declare-datatypes ((List!5263 0))(
  ( (Nil!5260) (Cons!5259 (h!6115 (_ BitVec 64)) (t!10409 List!5263)) )
))
(declare-fun arrayNoDuplicates!0 (array!19079 (_ BitVec 32) List!5263) Bool)

(assert (=> b!352917 (= res!195718 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5260))))

(declare-fun b!352918 () Bool)

(declare-datatypes ((SeekEntryResult!3477 0))(
  ( (MissingZero!3477 (index!16087 (_ BitVec 32))) (Found!3477 (index!16088 (_ BitVec 32))) (Intermediate!3477 (undefined!4289 Bool) (index!16089 (_ BitVec 32)) (x!35109 (_ BitVec 32))) (Undefined!3477) (MissingVacant!3477 (index!16090 (_ BitVec 32))) )
))
(declare-fun lt!165355 () SeekEntryResult!3477)

(assert (=> b!352918 (= e!216102 (and (not (is-Found!3477 lt!165355)) (not (is-MissingZero!3477 lt!165355)) (not (is-MissingVacant!3477 lt!165355)) (not (is-Undefined!3477 lt!165355))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19079 (_ BitVec 32)) SeekEntryResult!3477)

(assert (=> b!352918 (= lt!165355 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!195719 () Bool)

(assert (=> start!35200 (=> (not res!195719) (not e!216102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35200 (= res!195719 (validMask!0 mask!2385))))

(assert (=> start!35200 e!216102))

(assert (=> start!35200 true))

(assert (=> start!35200 tp_is_empty!7745))

(assert (=> start!35200 tp!26969))

(declare-datatypes ((V!11303 0))(
  ( (V!11304 (val!3917 Int)) )
))
(declare-datatypes ((ValueCell!3529 0))(
  ( (ValueCellFull!3529 (v!6108 V!11303)) (EmptyCell!3529) )
))
(declare-datatypes ((array!19081 0))(
  ( (array!19082 (arr!9042 (Array (_ BitVec 32) ValueCell!3529)) (size!9394 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19081)

(declare-fun e!216099 () Bool)

(declare-fun array_inv!6664 (array!19081) Bool)

(assert (=> start!35200 (and (array_inv!6664 _values!1525) e!216099)))

(declare-fun array_inv!6665 (array!19079) Bool)

(assert (=> start!35200 (array_inv!6665 _keys!1895)))

(declare-fun b!352919 () Bool)

(declare-fun res!195716 () Bool)

(assert (=> b!352919 (=> (not res!195716) (not e!216102))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352919 (= res!195716 (and (= (size!9394 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9393 _keys!1895) (size!9394 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13101 () Bool)

(declare-fun tp!26970 () Bool)

(assert (=> mapNonEmpty!13101 (= mapRes!13101 (and tp!26970 e!216098))))

(declare-fun mapRest!13101 () (Array (_ BitVec 32) ValueCell!3529))

(declare-fun mapKey!13101 () (_ BitVec 32))

(declare-fun mapValue!13101 () ValueCell!3529)

(assert (=> mapNonEmpty!13101 (= (arr!9042 _values!1525) (store mapRest!13101 mapKey!13101 mapValue!13101))))

(declare-fun b!352920 () Bool)

(declare-fun res!195715 () Bool)

(assert (=> b!352920 (=> (not res!195715) (not e!216102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19079 (_ BitVec 32)) Bool)

(assert (=> b!352920 (= res!195715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352921 () Bool)

(declare-fun e!216100 () Bool)

(assert (=> b!352921 (= e!216099 (and e!216100 mapRes!13101))))

(declare-fun condMapEmpty!13101 () Bool)

(declare-fun mapDefault!13101 () ValueCell!3529)

