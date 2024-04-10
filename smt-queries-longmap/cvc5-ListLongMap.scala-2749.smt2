; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40332 () Bool)

(assert start!40332)

(declare-fun b!443034 () Bool)

(declare-fun res!262469 () Bool)

(declare-fun e!260713 () Bool)

(assert (=> b!443034 (=> (not res!262469) (not e!260713))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27273 0))(
  ( (array!27274 (arr!13085 (Array (_ BitVec 32) (_ BitVec 64))) (size!13437 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27273)

(assert (=> b!443034 (= res!262469 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13437 _keys!709))))))

(declare-fun mapIsEmpty!19221 () Bool)

(declare-fun mapRes!19221 () Bool)

(assert (=> mapIsEmpty!19221 mapRes!19221))

(declare-fun b!443035 () Bool)

(declare-fun res!262472 () Bool)

(assert (=> b!443035 (=> (not res!262472) (not e!260713))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443035 (= res!262472 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19221 () Bool)

(declare-fun tp!37203 () Bool)

(declare-fun e!260715 () Bool)

(assert (=> mapNonEmpty!19221 (= mapRes!19221 (and tp!37203 e!260715))))

(declare-fun mapKey!19221 () (_ BitVec 32))

(declare-datatypes ((V!16747 0))(
  ( (V!16748 (val!5910 Int)) )
))
(declare-datatypes ((ValueCell!5522 0))(
  ( (ValueCellFull!5522 (v!8161 V!16747)) (EmptyCell!5522) )
))
(declare-fun mapRest!19221 () (Array (_ BitVec 32) ValueCell!5522))

(declare-datatypes ((array!27275 0))(
  ( (array!27276 (arr!13086 (Array (_ BitVec 32) ValueCell!5522)) (size!13438 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27275)

(declare-fun mapValue!19221 () ValueCell!5522)

(assert (=> mapNonEmpty!19221 (= (arr!13086 _values!549) (store mapRest!19221 mapKey!19221 mapValue!19221))))

(declare-fun b!443036 () Bool)

(declare-fun res!262474 () Bool)

(assert (=> b!443036 (=> (not res!262474) (not e!260713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443036 (= res!262474 (validKeyInArray!0 k!794))))

(declare-fun b!443037 () Bool)

(declare-fun e!260714 () Bool)

(assert (=> b!443037 (= e!260714 false)))

(declare-fun lt!203281 () Bool)

(declare-fun lt!203282 () array!27273)

(declare-datatypes ((List!7849 0))(
  ( (Nil!7846) (Cons!7845 (h!8701 (_ BitVec 64)) (t!13607 List!7849)) )
))
(declare-fun arrayNoDuplicates!0 (array!27273 (_ BitVec 32) List!7849) Bool)

(assert (=> b!443037 (= lt!203281 (arrayNoDuplicates!0 lt!203282 #b00000000000000000000000000000000 Nil!7846))))

(declare-fun res!262473 () Bool)

(assert (=> start!40332 (=> (not res!262473) (not e!260713))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40332 (= res!262473 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13437 _keys!709))))))

(assert (=> start!40332 e!260713))

(assert (=> start!40332 true))

(declare-fun e!260711 () Bool)

(declare-fun array_inv!9490 (array!27275) Bool)

(assert (=> start!40332 (and (array_inv!9490 _values!549) e!260711)))

(declare-fun array_inv!9491 (array!27273) Bool)

(assert (=> start!40332 (array_inv!9491 _keys!709)))

(declare-fun b!443038 () Bool)

(declare-fun res!262475 () Bool)

(assert (=> b!443038 (=> (not res!262475) (not e!260713))))

(assert (=> b!443038 (= res!262475 (or (= (select (arr!13085 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13085 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443039 () Bool)

(declare-fun e!260712 () Bool)

(declare-fun tp_is_empty!11731 () Bool)

(assert (=> b!443039 (= e!260712 tp_is_empty!11731)))

(declare-fun b!443040 () Bool)

(assert (=> b!443040 (= e!260711 (and e!260712 mapRes!19221))))

(declare-fun condMapEmpty!19221 () Bool)

(declare-fun mapDefault!19221 () ValueCell!5522)

