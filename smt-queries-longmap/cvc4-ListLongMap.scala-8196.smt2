; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100046 () Bool)

(assert start!100046)

(declare-fun b_free!25625 () Bool)

(declare-fun b_next!25625 () Bool)

(assert (=> start!100046 (= b_free!25625 (not b_next!25625))))

(declare-fun tp!89588 () Bool)

(declare-fun b_and!42117 () Bool)

(assert (=> start!100046 (= tp!89588 b_and!42117)))

(declare-fun b!1192361 () Bool)

(declare-fun e!677741 () Bool)

(declare-fun e!677744 () Bool)

(declare-fun mapRes!47060 () Bool)

(assert (=> b!1192361 (= e!677741 (and e!677744 mapRes!47060))))

(declare-fun condMapEmpty!47060 () Bool)

(declare-datatypes ((V!45333 0))(
  ( (V!45334 (val!15134 Int)) )
))
(declare-datatypes ((ValueCell!14368 0))(
  ( (ValueCellFull!14368 (v!17772 V!45333)) (EmptyCell!14368) )
))
(declare-datatypes ((array!77097 0))(
  ( (array!77098 (arr!37198 (Array (_ BitVec 32) ValueCell!14368)) (size!37734 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77097)

(declare-fun mapDefault!47060 () ValueCell!14368)

