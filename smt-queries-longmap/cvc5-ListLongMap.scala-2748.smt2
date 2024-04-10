; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40326 () Bool)

(assert start!40326)

(declare-fun b!442917 () Bool)

(declare-fun res!262381 () Bool)

(declare-fun e!260662 () Bool)

(assert (=> b!442917 (=> (not res!262381) (not e!260662))))

(declare-datatypes ((array!27261 0))(
  ( (array!27262 (arr!13079 (Array (_ BitVec 32) (_ BitVec 64))) (size!13431 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27261)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!16739 0))(
  ( (V!16740 (val!5907 Int)) )
))
(declare-datatypes ((ValueCell!5519 0))(
  ( (ValueCellFull!5519 (v!8158 V!16739)) (EmptyCell!5519) )
))
(declare-datatypes ((array!27263 0))(
  ( (array!27264 (arr!13080 (Array (_ BitVec 32) ValueCell!5519)) (size!13432 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27263)

(assert (=> b!442917 (= res!262381 (and (= (size!13432 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13431 _keys!709) (size!13432 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442918 () Bool)

(declare-fun res!262384 () Bool)

(assert (=> b!442918 (=> (not res!262384) (not e!260662))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442918 (= res!262384 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19212 () Bool)

(declare-fun mapRes!19212 () Bool)

(declare-fun tp!37194 () Bool)

(declare-fun e!260660 () Bool)

(assert (=> mapNonEmpty!19212 (= mapRes!19212 (and tp!37194 e!260660))))

(declare-fun mapValue!19212 () ValueCell!5519)

(declare-fun mapKey!19212 () (_ BitVec 32))

(declare-fun mapRest!19212 () (Array (_ BitVec 32) ValueCell!5519))

(assert (=> mapNonEmpty!19212 (= (arr!13080 _values!549) (store mapRest!19212 mapKey!19212 mapValue!19212))))

(declare-fun b!442919 () Bool)

(declare-fun e!260659 () Bool)

(declare-fun tp_is_empty!11725 () Bool)

(assert (=> b!442919 (= e!260659 tp_is_empty!11725)))

(declare-fun b!442920 () Bool)

(declare-fun e!260658 () Bool)

(assert (=> b!442920 (= e!260662 e!260658)))

(declare-fun res!262383 () Bool)

(assert (=> b!442920 (=> (not res!262383) (not e!260658))))

(declare-fun lt!203264 () array!27261)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27261 (_ BitVec 32)) Bool)

(assert (=> b!442920 (= res!262383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203264 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442920 (= lt!203264 (array!27262 (store (arr!13079 _keys!709) i!563 k!794) (size!13431 _keys!709)))))

(declare-fun b!442921 () Bool)

(declare-fun e!260657 () Bool)

(assert (=> b!442921 (= e!260657 (and e!260659 mapRes!19212))))

(declare-fun condMapEmpty!19212 () Bool)

(declare-fun mapDefault!19212 () ValueCell!5519)

