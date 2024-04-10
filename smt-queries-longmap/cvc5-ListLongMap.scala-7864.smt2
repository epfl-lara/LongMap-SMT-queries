; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97928 () Bool)

(assert start!97928)

(declare-fun b_free!23629 () Bool)

(declare-fun b_next!23629 () Bool)

(assert (=> start!97928 (= b_free!23629 (not b_next!23629))))

(declare-fun tp!83591 () Bool)

(declare-fun b_and!38041 () Bool)

(assert (=> start!97928 (= tp!83591 b_and!38041)))

(declare-fun b!1122013 () Bool)

(declare-fun e!638813 () Bool)

(declare-fun e!638809 () Bool)

(declare-fun mapRes!44056 () Bool)

(assert (=> b!1122013 (= e!638813 (and e!638809 mapRes!44056))))

(declare-fun condMapEmpty!44056 () Bool)

(declare-datatypes ((V!42673 0))(
  ( (V!42674 (val!14136 Int)) )
))
(declare-datatypes ((ValueCell!13370 0))(
  ( (ValueCellFull!13370 (v!16769 V!42673)) (EmptyCell!13370) )
))
(declare-datatypes ((array!73199 0))(
  ( (array!73200 (arr!35252 (Array (_ BitVec 32) ValueCell!13370)) (size!35788 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73199)

(declare-fun mapDefault!44056 () ValueCell!13370)

