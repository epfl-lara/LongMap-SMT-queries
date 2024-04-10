; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33532 () Bool)

(assert start!33532)

(declare-fun b_free!6821 () Bool)

(declare-fun b_next!6821 () Bool)

(assert (=> start!33532 (= b_free!6821 (not b_next!6821))))

(declare-fun tp!23958 () Bool)

(declare-fun b_and!13995 () Bool)

(assert (=> start!33532 (= tp!23958 b_and!13995)))

(declare-fun b!332799 () Bool)

(declare-fun e!204359 () Bool)

(assert (=> b!332799 (= e!204359 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10007 0))(
  ( (V!10008 (val!3431 Int)) )
))
(declare-fun zeroValue!1467 () V!10007)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3043 0))(
  ( (ValueCellFull!3043 (v!5590 V!10007)) (EmptyCell!3043) )
))
(declare-datatypes ((array!17141 0))(
  ( (array!17142 (arr!8104 (Array (_ BitVec 32) ValueCell!3043)) (size!8456 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17141)

(declare-datatypes ((array!17143 0))(
  ( (array!17144 (arr!8105 (Array (_ BitVec 32) (_ BitVec 64))) (size!8457 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17143)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10007)

(declare-fun lt!159046 () Bool)

(declare-datatypes ((tuple2!4996 0))(
  ( (tuple2!4997 (_1!2509 (_ BitVec 64)) (_2!2509 V!10007)) )
))
(declare-datatypes ((List!4611 0))(
  ( (Nil!4608) (Cons!4607 (h!5463 tuple2!4996) (t!9693 List!4611)) )
))
(declare-datatypes ((ListLongMap!3909 0))(
  ( (ListLongMap!3910 (toList!1970 List!4611)) )
))
(declare-fun contains!2011 (ListLongMap!3909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1498 (array!17143 array!17141 (_ BitVec 32) (_ BitVec 32) V!10007 V!10007 (_ BitVec 32) Int) ListLongMap!3909)

(assert (=> b!332799 (= lt!159046 (contains!2011 (getCurrentListMap!1498 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348))))

(declare-fun b!332800 () Bool)

(declare-fun e!204361 () Bool)

(declare-fun tp_is_empty!6773 () Bool)

(assert (=> b!332800 (= e!204361 tp_is_empty!6773)))

(declare-fun b!332801 () Bool)

(declare-fun e!204363 () Bool)

(declare-fun e!204362 () Bool)

(declare-fun mapRes!11547 () Bool)

(assert (=> b!332801 (= e!204363 (and e!204362 mapRes!11547))))

(declare-fun condMapEmpty!11547 () Bool)

(declare-fun mapDefault!11547 () ValueCell!3043)

