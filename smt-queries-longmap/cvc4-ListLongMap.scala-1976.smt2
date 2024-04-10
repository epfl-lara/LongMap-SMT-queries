; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34722 () Bool)

(assert start!34722)

(declare-fun b_free!7529 () Bool)

(declare-fun b_next!7529 () Bool)

(assert (=> start!34722 (= b_free!7529 (not b_next!7529))))

(declare-fun tp!26150 () Bool)

(declare-fun b_and!14749 () Bool)

(assert (=> start!34722 (= tp!26150 b_and!14749)))

(declare-fun b!347144 () Bool)

(declare-fun res!192122 () Bool)

(declare-fun e!212721 () Bool)

(assert (=> b!347144 (=> (not res!192122) (not e!212721))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347144 (= res!192122 (validKeyInArray!0 k!1348))))

(declare-fun b!347145 () Bool)

(declare-fun res!192117 () Bool)

(assert (=> b!347145 (=> (not res!192117) (not e!212721))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10951 0))(
  ( (V!10952 (val!3785 Int)) )
))
(declare-fun zeroValue!1467 () V!10951)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3397 0))(
  ( (ValueCellFull!3397 (v!5967 V!10951)) (EmptyCell!3397) )
))
(declare-datatypes ((array!18553 0))(
  ( (array!18554 (arr!8787 (Array (_ BitVec 32) ValueCell!3397)) (size!9139 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18553)

(declare-datatypes ((array!18555 0))(
  ( (array!18556 (arr!8788 (Array (_ BitVec 32) (_ BitVec 64))) (size!9140 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18555)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10951)

(declare-datatypes ((tuple2!5480 0))(
  ( (tuple2!5481 (_1!2751 (_ BitVec 64)) (_2!2751 V!10951)) )
))
(declare-datatypes ((List!5101 0))(
  ( (Nil!5098) (Cons!5097 (h!5953 tuple2!5480) (t!10229 List!5101)) )
))
(declare-datatypes ((ListLongMap!4393 0))(
  ( (ListLongMap!4394 (toList!2212 List!5101)) )
))
(declare-fun contains!2276 (ListLongMap!4393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1733 (array!18555 array!18553 (_ BitVec 32) (_ BitVec 32) V!10951 V!10951 (_ BitVec 32) Int) ListLongMap!4393)

(assert (=> b!347145 (= res!192117 (not (contains!2276 (getCurrentListMap!1733 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!347146 () Bool)

(declare-fun e!212720 () Bool)

(declare-fun e!212724 () Bool)

(declare-fun mapRes!12678 () Bool)

(assert (=> b!347146 (= e!212720 (and e!212724 mapRes!12678))))

(declare-fun condMapEmpty!12678 () Bool)

(declare-fun mapDefault!12678 () ValueCell!3397)

