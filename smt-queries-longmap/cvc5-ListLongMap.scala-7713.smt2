; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96910 () Bool)

(assert start!96910)

(declare-fun b_free!23203 () Bool)

(declare-fun b_next!23203 () Bool)

(assert (=> start!96910 (= b_free!23203 (not b_next!23203))))

(declare-fun tp!81569 () Bool)

(declare-fun b_and!37223 () Bool)

(assert (=> start!96910 (= tp!81569 b_and!37223)))

(declare-fun b!1102505 () Bool)

(declare-fun e!629290 () Bool)

(declare-fun tp_is_empty!27253 () Bool)

(assert (=> b!1102505 (= e!629290 tp_is_empty!27253)))

(declare-fun b!1102506 () Bool)

(declare-fun e!629288 () Bool)

(assert (=> b!1102506 (= e!629288 tp_is_empty!27253)))

(declare-fun b!1102507 () Bool)

(declare-fun e!629292 () Bool)

(declare-fun mapRes!42673 () Bool)

(assert (=> b!1102507 (= e!629292 (and e!629290 mapRes!42673))))

(declare-fun condMapEmpty!42673 () Bool)

(declare-datatypes ((V!41465 0))(
  ( (V!41466 (val!13683 Int)) )
))
(declare-datatypes ((ValueCell!12917 0))(
  ( (ValueCellFull!12917 (v!16314 V!41465)) (EmptyCell!12917) )
))
(declare-datatypes ((array!71429 0))(
  ( (array!71430 (arr!34375 (Array (_ BitVec 32) ValueCell!12917)) (size!34911 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71429)

(declare-fun mapDefault!42673 () ValueCell!12917)

