; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74072 () Bool)

(assert start!74072)

(declare-fun b_free!14987 () Bool)

(declare-fun b_next!14987 () Bool)

(assert (=> start!74072 (= b_free!14987 (not b_next!14987))))

(declare-fun tp!52464 () Bool)

(declare-fun b_and!24739 () Bool)

(assert (=> start!74072 (= tp!52464 b_and!24739)))

(declare-fun b!871419 () Bool)

(declare-fun e!485185 () Bool)

(declare-fun tp_is_empty!17123 () Bool)

(assert (=> b!871419 (= e!485185 tp_is_empty!17123)))

(declare-fun b!871420 () Bool)

(declare-fun res!592343 () Bool)

(declare-fun e!485180 () Bool)

(assert (=> b!871420 (=> (not res!592343) (not e!485180))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871420 (= res!592343 (validKeyInArray!0 k!854))))

(declare-fun b!871421 () Bool)

(declare-fun e!485182 () Bool)

(declare-fun e!485183 () Bool)

(declare-fun mapRes!27284 () Bool)

(assert (=> b!871421 (= e!485182 (and e!485183 mapRes!27284))))

(declare-fun condMapEmpty!27284 () Bool)

(declare-datatypes ((V!27877 0))(
  ( (V!27878 (val!8609 Int)) )
))
(declare-datatypes ((ValueCell!8122 0))(
  ( (ValueCellFull!8122 (v!11034 V!27877)) (EmptyCell!8122) )
))
(declare-datatypes ((array!50386 0))(
  ( (array!50387 (arr!24224 (Array (_ BitVec 32) ValueCell!8122)) (size!24664 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50386)

(declare-fun mapDefault!27284 () ValueCell!8122)

