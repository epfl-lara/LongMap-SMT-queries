; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43328 () Bool)

(assert start!43328)

(declare-fun b_free!12175 () Bool)

(declare-fun b_next!12175 () Bool)

(assert (=> start!43328 (= b_free!12175 (not b_next!12175))))

(declare-fun tp!42799 () Bool)

(declare-fun b_and!20929 () Bool)

(assert (=> start!43328 (= tp!42799 b_and!20929)))

(declare-fun res!286275 () Bool)

(declare-fun e!282423 () Bool)

(assert (=> start!43328 (=> (not res!286275) (not e!282423))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43328 (= res!286275 (validMask!0 mask!2352))))

(assert (=> start!43328 e!282423))

(assert (=> start!43328 true))

(declare-fun tp_is_empty!13687 () Bool)

(assert (=> start!43328 tp_is_empty!13687))

(declare-datatypes ((V!19321 0))(
  ( (V!19322 (val!6891 Int)) )
))
(declare-datatypes ((ValueCell!6482 0))(
  ( (ValueCellFull!6482 (v!9181 V!19321)) (EmptyCell!6482) )
))
(declare-datatypes ((array!31043 0))(
  ( (array!31044 (arr!14927 (Array (_ BitVec 32) ValueCell!6482)) (size!15285 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31043)

(declare-fun e!282420 () Bool)

(declare-fun array_inv!10768 (array!31043) Bool)

(assert (=> start!43328 (and (array_inv!10768 _values!1516) e!282420)))

(assert (=> start!43328 tp!42799))

(declare-datatypes ((array!31045 0))(
  ( (array!31046 (arr!14928 (Array (_ BitVec 32) (_ BitVec 64))) (size!15286 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31045)

(declare-fun array_inv!10769 (array!31045) Bool)

(assert (=> start!43328 (array_inv!10769 _keys!1874)))

(declare-fun b!479971 () Bool)

(declare-fun res!286278 () Bool)

(assert (=> b!479971 (=> (not res!286278) (not e!282423))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19321)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19321)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9046 0))(
  ( (tuple2!9047 (_1!4534 (_ BitVec 64)) (_2!4534 V!19321)) )
))
(declare-datatypes ((List!9125 0))(
  ( (Nil!9122) (Cons!9121 (h!9977 tuple2!9046) (t!15333 List!9125)) )
))
(declare-datatypes ((ListLongMap!7959 0))(
  ( (ListLongMap!7960 (toList!3995 List!9125)) )
))
(declare-fun contains!2606 (ListLongMap!7959 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2314 (array!31045 array!31043 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 32) Int) ListLongMap!7959)

(assert (=> b!479971 (= res!286278 (contains!2606 (getCurrentListMap!2314 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!479972 () Bool)

(declare-fun res!286273 () Bool)

(assert (=> b!479972 (=> (not res!286273) (not e!282423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31045 (_ BitVec 32)) Bool)

(assert (=> b!479972 (= res!286273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479973 () Bool)

(declare-fun e!282425 () Bool)

(assert (=> b!479973 (= e!282425 tp_is_empty!13687)))

(declare-fun b!479974 () Bool)

(declare-fun e!282422 () Bool)

(declare-fun mapRes!22231 () Bool)

(assert (=> b!479974 (= e!282420 (and e!282422 mapRes!22231))))

(declare-fun condMapEmpty!22231 () Bool)

(declare-fun mapDefault!22231 () ValueCell!6482)

