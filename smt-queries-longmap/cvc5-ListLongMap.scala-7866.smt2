; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97940 () Bool)

(assert start!97940)

(declare-fun b_free!23641 () Bool)

(declare-fun b_next!23641 () Bool)

(assert (=> start!97940 (= b_free!23641 (not b_next!23641))))

(declare-fun tp!83626 () Bool)

(declare-fun b_and!38065 () Bool)

(assert (=> start!97940 (= tp!83626 b_and!38065)))

(declare-fun b!1122350 () Bool)

(declare-fun e!638993 () Bool)

(declare-fun e!638994 () Bool)

(declare-fun mapRes!44074 () Bool)

(assert (=> b!1122350 (= e!638993 (and e!638994 mapRes!44074))))

(declare-fun condMapEmpty!44074 () Bool)

(declare-datatypes ((V!42689 0))(
  ( (V!42690 (val!14142 Int)) )
))
(declare-datatypes ((ValueCell!13376 0))(
  ( (ValueCellFull!13376 (v!16775 V!42689)) (EmptyCell!13376) )
))
(declare-datatypes ((array!73221 0))(
  ( (array!73222 (arr!35263 (Array (_ BitVec 32) ValueCell!13376)) (size!35799 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73221)

(declare-fun mapDefault!44074 () ValueCell!13376)

