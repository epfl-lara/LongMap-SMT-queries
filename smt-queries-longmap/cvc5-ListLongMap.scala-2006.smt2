; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35016 () Bool)

(assert start!35016)

(declare-fun b_free!7705 () Bool)

(declare-fun b_next!7705 () Bool)

(assert (=> start!35016 (= b_free!7705 (not b_next!7705))))

(declare-fun tp!26694 () Bool)

(declare-fun b_and!14935 () Bool)

(assert (=> start!35016 (= tp!26694 b_and!14935)))

(declare-fun mapNonEmpty!12957 () Bool)

(declare-fun mapRes!12957 () Bool)

(declare-fun tp!26693 () Bool)

(declare-fun e!214901 () Bool)

(assert (=> mapNonEmpty!12957 (= mapRes!12957 (and tp!26693 e!214901))))

(declare-datatypes ((V!11187 0))(
  ( (V!11188 (val!3873 Int)) )
))
(declare-datatypes ((ValueCell!3485 0))(
  ( (ValueCellFull!3485 (v!6060 V!11187)) (EmptyCell!3485) )
))
(declare-fun mapValue!12957 () ValueCell!3485)

(declare-fun mapRest!12957 () (Array (_ BitVec 32) ValueCell!3485))

(declare-datatypes ((array!18901 0))(
  ( (array!18902 (arr!8956 (Array (_ BitVec 32) ValueCell!3485)) (size!9308 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18901)

(declare-fun mapKey!12957 () (_ BitVec 32))

(assert (=> mapNonEmpty!12957 (= (arr!8956 _values!1525) (store mapRest!12957 mapKey!12957 mapValue!12957))))

(declare-fun res!194513 () Bool)

(declare-fun e!214898 () Bool)

(assert (=> start!35016 (=> (not res!194513) (not e!214898))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35016 (= res!194513 (validMask!0 mask!2385))))

(assert (=> start!35016 e!214898))

(assert (=> start!35016 true))

(declare-fun tp_is_empty!7657 () Bool)

(assert (=> start!35016 tp_is_empty!7657))

(assert (=> start!35016 tp!26694))

(declare-fun e!214902 () Bool)

(declare-fun array_inv!6610 (array!18901) Bool)

(assert (=> start!35016 (and (array_inv!6610 _values!1525) e!214902)))

(declare-datatypes ((array!18903 0))(
  ( (array!18904 (arr!8957 (Array (_ BitVec 32) (_ BitVec 64))) (size!9309 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18903)

(declare-fun array_inv!6611 (array!18903) Bool)

(assert (=> start!35016 (array_inv!6611 _keys!1895)))

(declare-fun b!350876 () Bool)

(declare-fun e!214899 () Bool)

(assert (=> b!350876 (= e!214899 tp_is_empty!7657)))

(declare-fun b!350877 () Bool)

(declare-fun res!194519 () Bool)

(assert (=> b!350877 (=> (not res!194519) (not e!214898))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11187)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11187)

(declare-datatypes ((tuple2!5590 0))(
  ( (tuple2!5591 (_1!2806 (_ BitVec 64)) (_2!2806 V!11187)) )
))
(declare-datatypes ((List!5211 0))(
  ( (Nil!5208) (Cons!5207 (h!6063 tuple2!5590) (t!10349 List!5211)) )
))
(declare-datatypes ((ListLongMap!4503 0))(
  ( (ListLongMap!4504 (toList!2267 List!5211)) )
))
(declare-fun contains!2336 (ListLongMap!4503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1788 (array!18903 array!18901 (_ BitVec 32) (_ BitVec 32) V!11187 V!11187 (_ BitVec 32) Int) ListLongMap!4503)

(assert (=> b!350877 (= res!194519 (not (contains!2336 (getCurrentListMap!1788 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350878 () Bool)

(assert (=> b!350878 (= e!214901 tp_is_empty!7657)))

(declare-fun b!350879 () Bool)

(declare-fun e!214903 () Bool)

(assert (=> b!350879 (= e!214898 e!214903)))

(declare-fun res!194514 () Bool)

(assert (=> b!350879 (=> (not res!194514) (not e!214903))))

(declare-datatypes ((SeekEntryResult!3446 0))(
  ( (MissingZero!3446 (index!15963 (_ BitVec 32))) (Found!3446 (index!15964 (_ BitVec 32))) (Intermediate!3446 (undefined!4258 Bool) (index!15965 (_ BitVec 32)) (x!34926 (_ BitVec 32))) (Undefined!3446) (MissingVacant!3446 (index!15966 (_ BitVec 32))) )
))
(declare-fun lt!164662 () SeekEntryResult!3446)

(assert (=> b!350879 (= res!194514 (and (not (is-Found!3446 lt!164662)) (not (is-MissingZero!3446 lt!164662)) (is-MissingVacant!3446 lt!164662)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18903 (_ BitVec 32)) SeekEntryResult!3446)

(assert (=> b!350879 (= lt!164662 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!350880 () Bool)

(declare-fun res!194516 () Bool)

(assert (=> b!350880 (=> (not res!194516) (not e!214898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18903 (_ BitVec 32)) Bool)

(assert (=> b!350880 (= res!194516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350881 () Bool)

(assert (=> b!350881 (= e!214902 (and e!214899 mapRes!12957))))

(declare-fun condMapEmpty!12957 () Bool)

(declare-fun mapDefault!12957 () ValueCell!3485)

