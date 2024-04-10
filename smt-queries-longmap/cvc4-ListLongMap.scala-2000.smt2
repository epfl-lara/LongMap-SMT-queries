; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34958 () Bool)

(assert start!34958)

(declare-fun b_free!7673 () Bool)

(declare-fun b_next!7673 () Bool)

(assert (=> start!34958 (= b_free!7673 (not b_next!7673))))

(declare-fun tp!26594 () Bool)

(declare-fun b_and!14901 () Bool)

(assert (=> start!34958 (= tp!26594 b_and!14901)))

(declare-fun b!350201 () Bool)

(declare-datatypes ((Unit!10855 0))(
  ( (Unit!10856) )
))
(declare-fun e!214517 () Unit!10855)

(declare-fun Unit!10857 () Unit!10855)

(assert (=> b!350201 (= e!214517 Unit!10857)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11143 0))(
  ( (V!11144 (val!3857 Int)) )
))
(declare-fun zeroValue!1467 () V!11143)

(declare-fun defaultEntry!1528 () Int)

(declare-fun lt!164464 () Unit!10855)

(declare-datatypes ((ValueCell!3469 0))(
  ( (ValueCellFull!3469 (v!6043 V!11143)) (EmptyCell!3469) )
))
(declare-datatypes ((array!18835 0))(
  ( (array!18836 (arr!8924 (Array (_ BitVec 32) ValueCell!3469)) (size!9276 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18835)

(declare-datatypes ((array!18837 0))(
  ( (array!18838 (arr!8925 (Array (_ BitVec 32) (_ BitVec 64))) (size!9277 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18837)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11143)

(declare-fun lemmaArrayContainsKeyThenInListMap!326 (array!18837 array!18835 (_ BitVec 32) (_ BitVec 32) V!11143 V!11143 (_ BitVec 64) (_ BitVec 32) Int) Unit!10855)

(declare-fun arrayScanForKey!0 (array!18837 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350201 (= lt!164464 (lemmaArrayContainsKeyThenInListMap!326 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!350201 false))

(declare-fun b!350202 () Bool)

(declare-fun res!194083 () Bool)

(declare-fun e!214524 () Bool)

(assert (=> b!350202 (=> res!194083 e!214524)))

(declare-fun call!26953 () Bool)

(assert (=> b!350202 (= res!194083 (not call!26953))))

(declare-fun e!214522 () Bool)

(assert (=> b!350202 (= e!214522 e!214524)))

(declare-fun mapIsEmpty!12906 () Bool)

(declare-fun mapRes!12906 () Bool)

(assert (=> mapIsEmpty!12906 mapRes!12906))

(declare-fun b!350203 () Bool)

(declare-fun e!214523 () Bool)

(declare-datatypes ((SeekEntryResult!3438 0))(
  ( (MissingZero!3438 (index!15931 (_ BitVec 32))) (Found!3438 (index!15932 (_ BitVec 32))) (Intermediate!3438 (undefined!4250 Bool) (index!15933 (_ BitVec 32)) (x!34860 (_ BitVec 32))) (Undefined!3438) (MissingVacant!3438 (index!15934 (_ BitVec 32))) )
))
(declare-fun lt!164463 () SeekEntryResult!3438)

(assert (=> b!350203 (= e!214523 (not (= (select (arr!8925 _keys!1895) (index!15931 lt!164463)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!350204 () Bool)

(declare-fun res!194077 () Bool)

(declare-fun e!214525 () Bool)

(assert (=> b!350204 (=> (not res!194077) (not e!214525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18837 (_ BitVec 32)) Bool)

(assert (=> b!350204 (= res!194077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350205 () Bool)

(declare-fun e!214515 () Bool)

(assert (=> b!350205 (= e!214515 e!214523)))

(declare-fun res!194080 () Bool)

(assert (=> b!350205 (= res!194080 (not call!26953))))

(assert (=> b!350205 (=> res!194080 e!214523)))

(declare-fun b!350206 () Bool)

(assert (=> b!350206 (= e!214522 (not (is-Undefined!3438 lt!164463)))))

(declare-fun b!350207 () Bool)

(declare-fun e!214519 () Bool)

(declare-fun tp_is_empty!7625 () Bool)

(assert (=> b!350207 (= e!214519 tp_is_empty!7625)))

(declare-fun b!350208 () Bool)

(declare-fun res!194084 () Bool)

(assert (=> b!350208 (=> (not res!194084) (not e!214525))))

(declare-datatypes ((tuple2!5572 0))(
  ( (tuple2!5573 (_1!2797 (_ BitVec 64)) (_2!2797 V!11143)) )
))
(declare-datatypes ((List!5192 0))(
  ( (Nil!5189) (Cons!5188 (h!6044 tuple2!5572) (t!10328 List!5192)) )
))
(declare-datatypes ((ListLongMap!4485 0))(
  ( (ListLongMap!4486 (toList!2258 List!5192)) )
))
(declare-fun contains!2326 (ListLongMap!4485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1779 (array!18837 array!18835 (_ BitVec 32) (_ BitVec 32) V!11143 V!11143 (_ BitVec 32) Int) ListLongMap!4485)

(assert (=> b!350208 (= res!194084 (not (contains!2326 (getCurrentListMap!1779 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350210 () Bool)

(declare-fun e!214514 () Bool)

(declare-fun e!214516 () Bool)

(assert (=> b!350210 (= e!214514 (and e!214516 mapRes!12906))))

(declare-fun condMapEmpty!12906 () Bool)

(declare-fun mapDefault!12906 () ValueCell!3469)

