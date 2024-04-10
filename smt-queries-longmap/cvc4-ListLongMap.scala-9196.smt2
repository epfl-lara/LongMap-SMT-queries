; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110528 () Bool)

(assert start!110528)

(declare-fun b_free!29363 () Bool)

(declare-fun b_next!29363 () Bool)

(assert (=> start!110528 (= b_free!29363 (not b_next!29363))))

(declare-fun tp!103410 () Bool)

(declare-fun b_and!47571 () Bool)

(assert (=> start!110528 (= tp!103410 b_and!47571)))

(declare-fun mapIsEmpty!54268 () Bool)

(declare-fun mapRes!54268 () Bool)

(assert (=> mapIsEmpty!54268 mapRes!54268))

(declare-fun b!1307495 () Bool)

(declare-fun e!746087 () Bool)

(declare-fun e!746086 () Bool)

(assert (=> b!1307495 (= e!746087 (and e!746086 mapRes!54268))))

(declare-fun condMapEmpty!54268 () Bool)

(declare-datatypes ((V!51893 0))(
  ( (V!51894 (val!17621 Int)) )
))
(declare-datatypes ((ValueCell!16648 0))(
  ( (ValueCellFull!16648 (v!20248 V!51893)) (EmptyCell!16648) )
))
(declare-datatypes ((array!87188 0))(
  ( (array!87189 (arr!42074 (Array (_ BitVec 32) ValueCell!16648)) (size!42624 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87188)

(declare-fun mapDefault!54268 () ValueCell!16648)

