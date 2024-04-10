; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33516 () Bool)

(assert start!33516)

(declare-fun b_free!6805 () Bool)

(declare-fun b_next!6805 () Bool)

(assert (=> start!33516 (= b_free!6805 (not b_next!6805))))

(declare-fun tp!23909 () Bool)

(declare-fun b_and!13979 () Bool)

(assert (=> start!33516 (= tp!23909 b_and!13979)))

(declare-fun b!332599 () Bool)

(declare-fun e!204241 () Bool)

(declare-fun tp_is_empty!6757 () Bool)

(assert (=> b!332599 (= e!204241 tp_is_empty!6757)))

(declare-fun b!332600 () Bool)

(declare-fun res!183230 () Bool)

(declare-fun e!204239 () Bool)

(assert (=> b!332600 (=> (not res!183230) (not e!204239))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332600 (= res!183230 (validKeyInArray!0 k!1348))))

(declare-fun b!332601 () Bool)

(assert (=> b!332601 (= e!204239 false)))

(declare-datatypes ((V!9987 0))(
  ( (V!9988 (val!3423 Int)) )
))
(declare-fun zeroValue!1467 () V!9987)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3035 0))(
  ( (ValueCellFull!3035 (v!5582 V!9987)) (EmptyCell!3035) )
))
(declare-datatypes ((array!17111 0))(
  ( (array!17112 (arr!8089 (Array (_ BitVec 32) ValueCell!3035)) (size!8441 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17111)

(declare-datatypes ((array!17113 0))(
  ( (array!17114 (arr!8090 (Array (_ BitVec 32) (_ BitVec 64))) (size!8442 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17113)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!9987)

(declare-fun lt!159031 () Bool)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((tuple2!4988 0))(
  ( (tuple2!4989 (_1!2505 (_ BitVec 64)) (_2!2505 V!9987)) )
))
(declare-datatypes ((List!4601 0))(
  ( (Nil!4598) (Cons!4597 (h!5453 tuple2!4988) (t!9683 List!4601)) )
))
(declare-datatypes ((ListLongMap!3901 0))(
  ( (ListLongMap!3902 (toList!1966 List!4601)) )
))
(declare-fun contains!2007 (ListLongMap!3901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1494 (array!17113 array!17111 (_ BitVec 32) (_ BitVec 32) V!9987 V!9987 (_ BitVec 32) Int) ListLongMap!3901)

(assert (=> b!332601 (= lt!159031 (contains!2007 (getCurrentListMap!1494 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348))))

(declare-fun b!332602 () Bool)

(declare-fun e!204243 () Bool)

(assert (=> b!332602 (= e!204243 tp_is_empty!6757)))

(declare-fun mapIsEmpty!11523 () Bool)

(declare-fun mapRes!11523 () Bool)

(assert (=> mapIsEmpty!11523 mapRes!11523))

(declare-fun b!332603 () Bool)

(declare-fun res!183233 () Bool)

(assert (=> b!332603 (=> (not res!183233) (not e!204239))))

(declare-datatypes ((List!4602 0))(
  ( (Nil!4599) (Cons!4598 (h!5454 (_ BitVec 64)) (t!9684 List!4602)) )
))
(declare-fun arrayNoDuplicates!0 (array!17113 (_ BitVec 32) List!4602) Bool)

(assert (=> b!332603 (= res!183233 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4599))))

(declare-fun b!332604 () Bool)

(declare-fun res!183232 () Bool)

(assert (=> b!332604 (=> (not res!183232) (not e!204239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17113 (_ BitVec 32)) Bool)

(assert (=> b!332604 (= res!183232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332598 () Bool)

(declare-fun e!204242 () Bool)

(assert (=> b!332598 (= e!204242 (and e!204243 mapRes!11523))))

(declare-fun condMapEmpty!11523 () Bool)

(declare-fun mapDefault!11523 () ValueCell!3035)

