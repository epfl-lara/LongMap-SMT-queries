; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40370 () Bool)

(assert start!40370)

(declare-fun b!443562 () Bool)

(declare-fun res!262868 () Bool)

(declare-fun e!260968 () Bool)

(assert (=> b!443562 (=> (not res!262868) (not e!260968))))

(declare-datatypes ((array!27323 0))(
  ( (array!27324 (arr!13109 (Array (_ BitVec 32) (_ BitVec 64))) (size!13461 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27323)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443562 (= res!262868 (or (= (select (arr!13109 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13109 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19260 () Bool)

(declare-fun mapRes!19260 () Bool)

(declare-fun tp!37242 () Bool)

(declare-fun e!260972 () Bool)

(assert (=> mapNonEmpty!19260 (= mapRes!19260 (and tp!37242 e!260972))))

(declare-datatypes ((V!16779 0))(
  ( (V!16780 (val!5922 Int)) )
))
(declare-datatypes ((ValueCell!5534 0))(
  ( (ValueCellFull!5534 (v!8173 V!16779)) (EmptyCell!5534) )
))
(declare-datatypes ((array!27325 0))(
  ( (array!27326 (arr!13110 (Array (_ BitVec 32) ValueCell!5534)) (size!13462 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27325)

(declare-fun mapValue!19260 () ValueCell!5534)

(declare-fun mapKey!19260 () (_ BitVec 32))

(declare-fun mapRest!19260 () (Array (_ BitVec 32) ValueCell!5534))

(assert (=> mapNonEmpty!19260 (= (arr!13110 _values!549) (store mapRest!19260 mapKey!19260 mapValue!19260))))

(declare-fun mapIsEmpty!19260 () Bool)

(assert (=> mapIsEmpty!19260 mapRes!19260))

(declare-fun b!443563 () Bool)

(declare-fun res!262865 () Bool)

(assert (=> b!443563 (=> (not res!262865) (not e!260968))))

(assert (=> b!443563 (= res!262865 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13461 _keys!709))))))

(declare-fun b!443564 () Bool)

(declare-fun res!262867 () Bool)

(assert (=> b!443564 (=> (not res!262867) (not e!260968))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443564 (= res!262867 (validKeyInArray!0 k!794))))

(declare-fun b!443565 () Bool)

(declare-fun res!262864 () Bool)

(assert (=> b!443565 (=> (not res!262864) (not e!260968))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27323 (_ BitVec 32)) Bool)

(assert (=> b!443565 (= res!262864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443566 () Bool)

(declare-fun e!260967 () Bool)

(declare-fun tp_is_empty!11755 () Bool)

(assert (=> b!443566 (= e!260967 tp_is_empty!11755)))

(declare-fun b!443567 () Bool)

(declare-fun e!260969 () Bool)

(assert (=> b!443567 (= e!260969 (and e!260967 mapRes!19260))))

(declare-fun condMapEmpty!19260 () Bool)

(declare-fun mapDefault!19260 () ValueCell!5534)

