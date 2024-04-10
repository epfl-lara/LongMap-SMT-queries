; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97640 () Bool)

(assert start!97640)

(declare-fun b!1115718 () Bool)

(declare-fun e!635762 () Bool)

(declare-fun e!635759 () Bool)

(declare-fun mapRes!43624 () Bool)

(assert (=> b!1115718 (= e!635762 (and e!635759 mapRes!43624))))

(declare-fun condMapEmpty!43624 () Bool)

(declare-datatypes ((V!42289 0))(
  ( (V!42290 (val!13992 Int)) )
))
(declare-datatypes ((ValueCell!13226 0))(
  ( (ValueCellFull!13226 (v!16625 V!42289)) (EmptyCell!13226) )
))
(declare-datatypes ((array!72641 0))(
  ( (array!72642 (arr!34973 (Array (_ BitVec 32) ValueCell!13226)) (size!35509 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72641)

(declare-fun mapDefault!43624 () ValueCell!13226)

