; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97976 () Bool)

(assert start!97976)

(declare-fun b_free!23677 () Bool)

(declare-fun b_next!23677 () Bool)

(assert (=> start!97976 (= b_free!23677 (not b_next!23677))))

(declare-fun tp!83734 () Bool)

(declare-fun b_and!38137 () Bool)

(assert (=> start!97976 (= tp!83734 b_and!38137)))

(declare-fun b!1123359 () Bool)

(declare-fun e!639536 () Bool)

(declare-fun e!639532 () Bool)

(declare-fun mapRes!44128 () Bool)

(assert (=> b!1123359 (= e!639536 (and e!639532 mapRes!44128))))

(declare-fun condMapEmpty!44128 () Bool)

(declare-datatypes ((V!42737 0))(
  ( (V!42738 (val!14160 Int)) )
))
(declare-datatypes ((ValueCell!13394 0))(
  ( (ValueCellFull!13394 (v!16793 V!42737)) (EmptyCell!13394) )
))
(declare-datatypes ((array!73285 0))(
  ( (array!73286 (arr!35295 (Array (_ BitVec 32) ValueCell!13394)) (size!35831 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73285)

(declare-fun mapDefault!44128 () ValueCell!13394)

