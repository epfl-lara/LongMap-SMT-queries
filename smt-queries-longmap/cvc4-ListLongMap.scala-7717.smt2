; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96962 () Bool)

(assert start!96962)

(declare-datatypes ((array!71483 0))(
  ( (array!71484 (arr!34401 (Array (_ BitVec 32) (_ BitVec 64))) (size!34937 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71483)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!629662 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun b!1103108 () Bool)

(declare-datatypes ((V!41501 0))(
  ( (V!41502 (val!13697 Int)) )
))
(declare-datatypes ((ValueCell!12931 0))(
  ( (ValueCellFull!12931 (v!16328 V!41501)) (EmptyCell!12931) )
))
(declare-datatypes ((array!71485 0))(
  ( (array!71486 (arr!34402 (Array (_ BitVec 32) ValueCell!12931)) (size!34938 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71485)

(assert (=> b!1103108 (= e!629662 (and (= (size!34938 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34937 _keys!1208) (size!34938 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (= (size!34937 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34937 _keys!1208))))))

(declare-fun b!1103109 () Bool)

(declare-fun e!629661 () Bool)

(declare-fun e!629658 () Bool)

(declare-fun mapRes!42718 () Bool)

(assert (=> b!1103109 (= e!629661 (and e!629658 mapRes!42718))))

(declare-fun condMapEmpty!42718 () Bool)

(declare-fun mapDefault!42718 () ValueCell!12931)

