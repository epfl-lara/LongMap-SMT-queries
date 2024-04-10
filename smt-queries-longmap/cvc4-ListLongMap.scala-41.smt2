; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!722 () Bool)

(assert start!722)

(declare-fun b_free!155 () Bool)

(declare-fun b_next!155 () Bool)

(assert (=> start!722 (= b_free!155 (not b_next!155))))

(declare-fun tp!689 () Bool)

(declare-fun b_and!297 () Bool)

(assert (=> start!722 (= tp!689 b_and!297)))

(declare-fun b!5024 () Bool)

(declare-fun e!2689 () Bool)

(declare-datatypes ((array!399 0))(
  ( (array!400 (arr!190 (Array (_ BitVec 32) (_ BitVec 64))) (size!252 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!399)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5024 (= e!2689 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!5025 () Bool)

(declare-fun res!6029 () Bool)

(declare-fun e!2685 () Bool)

(assert (=> b!5025 (=> (not res!6029) (not e!2685))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!487 0))(
  ( (V!488 (val!122 Int)) )
))
(declare-datatypes ((ValueCell!100 0))(
  ( (ValueCellFull!100 (v!1211 V!487)) (EmptyCell!100) )
))
(declare-datatypes ((array!401 0))(
  ( (array!402 (arr!191 (Array (_ BitVec 32) ValueCell!100)) (size!253 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!401)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5025 (= res!6029 (and (= (size!253 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!252 _keys!1806) (size!253 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5026 () Bool)

(assert (=> b!5026 (= e!2689 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5027 () Bool)

(declare-fun res!6026 () Bool)

(assert (=> b!5027 (=> (not res!6026) (not e!2685))))

(declare-datatypes ((List!125 0))(
  ( (Nil!122) (Cons!121 (h!687 (_ BitVec 64)) (t!2256 List!125)) )
))
(declare-fun arrayNoDuplicates!0 (array!399 (_ BitVec 32) List!125) Bool)

(assert (=> b!5027 (= res!6026 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!122))))

(declare-fun b!5029 () Bool)

(declare-fun e!2687 () Bool)

(declare-fun e!2690 () Bool)

(declare-fun mapRes!314 () Bool)

(assert (=> b!5029 (= e!2687 (and e!2690 mapRes!314))))

(declare-fun condMapEmpty!314 () Bool)

(declare-fun mapDefault!314 () ValueCell!100)

