; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97790 () Bool)

(assert start!97790)

(declare-fun b_free!23491 () Bool)

(declare-fun b_next!23491 () Bool)

(assert (=> start!97790 (= b_free!23491 (not b_next!23491))))

(declare-fun tp!83177 () Bool)

(declare-fun b_and!37765 () Bool)

(assert (=> start!97790 (= tp!83177 b_and!37765)))

(declare-fun b!1118726 () Bool)

(declare-fun e!637193 () Bool)

(declare-fun tp_is_empty!28021 () Bool)

(assert (=> b!1118726 (= e!637193 tp_is_empty!28021)))

(declare-fun b!1118727 () Bool)

(declare-fun e!637197 () Bool)

(declare-fun e!637196 () Bool)

(declare-fun mapRes!43849 () Bool)

(assert (=> b!1118727 (= e!637197 (and e!637196 mapRes!43849))))

(declare-fun condMapEmpty!43849 () Bool)

(declare-datatypes ((V!42489 0))(
  ( (V!42490 (val!14067 Int)) )
))
(declare-datatypes ((ValueCell!13301 0))(
  ( (ValueCellFull!13301 (v!16700 V!42489)) (EmptyCell!13301) )
))
(declare-datatypes ((array!72933 0))(
  ( (array!72934 (arr!35119 (Array (_ BitVec 32) ValueCell!13301)) (size!35655 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72933)

(declare-fun mapDefault!43849 () ValueCell!13301)

