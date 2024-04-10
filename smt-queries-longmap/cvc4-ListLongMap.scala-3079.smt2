; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43370 () Bool)

(assert start!43370)

(declare-fun b_free!12197 () Bool)

(declare-fun b_next!12197 () Bool)

(assert (=> start!43370 (= b_free!12197 (not b_next!12197))))

(declare-fun tp!42867 () Bool)

(declare-fun b_and!20953 () Bool)

(assert (=> start!43370 (= tp!42867 b_and!20953)))

(declare-fun mapIsEmpty!22267 () Bool)

(declare-fun mapRes!22267 () Bool)

(assert (=> mapIsEmpty!22267 mapRes!22267))

(declare-fun b!480462 () Bool)

(declare-fun res!286531 () Bool)

(declare-fun e!282706 () Bool)

(assert (=> b!480462 (=> (not res!286531) (not e!282706))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480462 (= res!286531 (validKeyInArray!0 k!1332))))

(declare-fun res!286533 () Bool)

(assert (=> start!43370 (=> (not res!286533) (not e!282706))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43370 (= res!286533 (validMask!0 mask!2352))))

(assert (=> start!43370 e!282706))

(assert (=> start!43370 true))

(declare-fun tp_is_empty!13709 () Bool)

(assert (=> start!43370 tp_is_empty!13709))

(declare-datatypes ((V!19349 0))(
  ( (V!19350 (val!6902 Int)) )
))
(declare-datatypes ((ValueCell!6493 0))(
  ( (ValueCellFull!6493 (v!9193 V!19349)) (EmptyCell!6493) )
))
(declare-datatypes ((array!31085 0))(
  ( (array!31086 (arr!14947 (Array (_ BitVec 32) ValueCell!6493)) (size!15305 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31085)

(declare-fun e!282708 () Bool)

(declare-fun array_inv!10780 (array!31085) Bool)

(assert (=> start!43370 (and (array_inv!10780 _values!1516) e!282708)))

(assert (=> start!43370 tp!42867))

(declare-datatypes ((array!31087 0))(
  ( (array!31088 (arr!14948 (Array (_ BitVec 32) (_ BitVec 64))) (size!15306 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31087)

(declare-fun array_inv!10781 (array!31087) Bool)

(assert (=> start!43370 (array_inv!10781 _keys!1874)))

(declare-fun b!480463 () Bool)

(declare-fun e!282709 () Bool)

(assert (=> b!480463 (= e!282708 (and e!282709 mapRes!22267))))

(declare-fun condMapEmpty!22267 () Bool)

(declare-fun mapDefault!22267 () ValueCell!6493)

