; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34084 () Bool)

(assert start!34084)

(declare-fun b_free!7163 () Bool)

(declare-fun b_next!7163 () Bool)

(assert (=> start!34084 (= b_free!7163 (not b_next!7163))))

(declare-fun tp!25014 () Bool)

(declare-fun b_and!14357 () Bool)

(assert (=> start!34084 (= tp!25014 b_and!14357)))

(declare-fun mapIsEmpty!12090 () Bool)

(declare-fun mapRes!12090 () Bool)

(assert (=> mapIsEmpty!12090 mapRes!12090))

(declare-fun b!339702 () Bool)

(declare-fun res!187649 () Bool)

(declare-fun e!208408 () Bool)

(assert (=> b!339702 (=> (not res!187649) (not e!208408))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10463 0))(
  ( (V!10464 (val!3602 Int)) )
))
(declare-fun zeroValue!1467 () V!10463)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3214 0))(
  ( (ValueCellFull!3214 (v!5771 V!10463)) (EmptyCell!3214) )
))
(declare-datatypes ((array!17829 0))(
  ( (array!17830 (arr!8438 (Array (_ BitVec 32) ValueCell!3214)) (size!8790 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17829)

(declare-datatypes ((array!17831 0))(
  ( (array!17832 (arr!8439 (Array (_ BitVec 32) (_ BitVec 64))) (size!8791 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17831)

(declare-fun minValue!1467 () V!10463)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5230 0))(
  ( (tuple2!5231 (_1!2626 (_ BitVec 64)) (_2!2626 V!10463)) )
))
(declare-datatypes ((List!4849 0))(
  ( (Nil!4846) (Cons!4845 (h!5701 tuple2!5230) (t!9951 List!4849)) )
))
(declare-datatypes ((ListLongMap!4143 0))(
  ( (ListLongMap!4144 (toList!2087 List!4849)) )
))
(declare-fun contains!2138 (ListLongMap!4143 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1608 (array!17831 array!17829 (_ BitVec 32) (_ BitVec 32) V!10463 V!10463 (_ BitVec 32) Int) ListLongMap!4143)

(assert (=> b!339702 (= res!187649 (not (contains!2138 (getCurrentListMap!1608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!339704 () Bool)

(assert (=> b!339704 (= e!208408 false)))

(declare-datatypes ((SeekEntryResult!3259 0))(
  ( (MissingZero!3259 (index!15215 (_ BitVec 32))) (Found!3259 (index!15216 (_ BitVec 32))) (Intermediate!3259 (undefined!4071 Bool) (index!15217 (_ BitVec 32)) (x!33831 (_ BitVec 32))) (Undefined!3259) (MissingVacant!3259 (index!15218 (_ BitVec 32))) )
))
(declare-fun lt!161263 () SeekEntryResult!3259)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17831 (_ BitVec 32)) SeekEntryResult!3259)

(assert (=> b!339704 (= lt!161263 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!339705 () Bool)

(declare-fun res!187648 () Bool)

(assert (=> b!339705 (=> (not res!187648) (not e!208408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17831 (_ BitVec 32)) Bool)

(assert (=> b!339705 (= res!187648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339706 () Bool)

(declare-fun res!187647 () Bool)

(assert (=> b!339706 (=> (not res!187647) (not e!208408))))

(assert (=> b!339706 (= res!187647 (and (= (size!8790 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8791 _keys!1895) (size!8790 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339707 () Bool)

(declare-fun e!208409 () Bool)

(declare-fun tp_is_empty!7115 () Bool)

(assert (=> b!339707 (= e!208409 tp_is_empty!7115)))

(declare-fun b!339708 () Bool)

(declare-fun res!187645 () Bool)

(assert (=> b!339708 (=> (not res!187645) (not e!208408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339708 (= res!187645 (validKeyInArray!0 k!1348))))

(declare-fun b!339709 () Bool)

(declare-fun res!187646 () Bool)

(assert (=> b!339709 (=> (not res!187646) (not e!208408))))

(declare-datatypes ((List!4850 0))(
  ( (Nil!4847) (Cons!4846 (h!5702 (_ BitVec 64)) (t!9952 List!4850)) )
))
(declare-fun arrayNoDuplicates!0 (array!17831 (_ BitVec 32) List!4850) Bool)

(assert (=> b!339709 (= res!187646 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4847))))

(declare-fun b!339710 () Bool)

(declare-fun e!208406 () Bool)

(assert (=> b!339710 (= e!208406 tp_is_empty!7115)))

(declare-fun mapNonEmpty!12090 () Bool)

(declare-fun tp!25013 () Bool)

(assert (=> mapNonEmpty!12090 (= mapRes!12090 (and tp!25013 e!208409))))

(declare-fun mapKey!12090 () (_ BitVec 32))

(declare-fun mapValue!12090 () ValueCell!3214)

(declare-fun mapRest!12090 () (Array (_ BitVec 32) ValueCell!3214))

(assert (=> mapNonEmpty!12090 (= (arr!8438 _values!1525) (store mapRest!12090 mapKey!12090 mapValue!12090))))

(declare-fun b!339703 () Bool)

(declare-fun e!208407 () Bool)

(assert (=> b!339703 (= e!208407 (and e!208406 mapRes!12090))))

(declare-fun condMapEmpty!12090 () Bool)

(declare-fun mapDefault!12090 () ValueCell!3214)

