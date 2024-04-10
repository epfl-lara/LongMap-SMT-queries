; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40078 () Bool)

(assert start!40078)

(declare-fun b_free!10345 () Bool)

(declare-fun b_next!10345 () Bool)

(assert (=> start!40078 (= b_free!10345 (not b_next!10345))))

(declare-fun tp!36563 () Bool)

(declare-fun b_and!18313 () Bool)

(assert (=> start!40078 (= tp!36563 b_and!18313)))

(declare-fun b!437636 () Bool)

(declare-fun res!258230 () Bool)

(declare-fun e!258264 () Bool)

(assert (=> b!437636 (=> (not res!258230) (not e!258264))))

(declare-datatypes ((array!26813 0))(
  ( (array!26814 (arr!12856 (Array (_ BitVec 32) (_ BitVec 64))) (size!13208 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26813)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26813 (_ BitVec 32)) Bool)

(assert (=> b!437636 (= res!258230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437637 () Bool)

(declare-fun res!258227 () Bool)

(assert (=> b!437637 (=> (not res!258227) (not e!258264))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437637 (= res!258227 (validKeyInArray!0 k!794))))

(declare-fun b!437638 () Bool)

(declare-fun e!258267 () Bool)

(declare-fun e!258265 () Bool)

(declare-fun mapRes!18867 () Bool)

(assert (=> b!437638 (= e!258267 (and e!258265 mapRes!18867))))

(declare-fun condMapEmpty!18867 () Bool)

(declare-datatypes ((V!16435 0))(
  ( (V!16436 (val!5793 Int)) )
))
(declare-datatypes ((ValueCell!5405 0))(
  ( (ValueCellFull!5405 (v!8040 V!16435)) (EmptyCell!5405) )
))
(declare-datatypes ((array!26815 0))(
  ( (array!26816 (arr!12857 (Array (_ BitVec 32) ValueCell!5405)) (size!13209 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26815)

(declare-fun mapDefault!18867 () ValueCell!5405)

