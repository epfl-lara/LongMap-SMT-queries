; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98162 () Bool)

(assert start!98162)

(declare-fun b_free!23863 () Bool)

(declare-fun b_next!23863 () Bool)

(assert (=> start!98162 (= b_free!23863 (not b_next!23863))))

(declare-fun tp!84292 () Bool)

(declare-fun b_and!38509 () Bool)

(assert (=> start!98162 (= tp!84292 b_and!38509)))

(declare-fun b!1128772 () Bool)

(declare-fun e!642410 () Bool)

(declare-fun e!642417 () Bool)

(declare-fun mapRes!44407 () Bool)

(assert (=> b!1128772 (= e!642410 (and e!642417 mapRes!44407))))

(declare-fun condMapEmpty!44407 () Bool)

(declare-datatypes ((V!42985 0))(
  ( (V!42986 (val!14253 Int)) )
))
(declare-datatypes ((ValueCell!13487 0))(
  ( (ValueCellFull!13487 (v!16886 V!42985)) (EmptyCell!13487) )
))
(declare-datatypes ((array!73645 0))(
  ( (array!73646 (arr!35475 (Array (_ BitVec 32) ValueCell!13487)) (size!36011 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73645)

(declare-fun mapDefault!44407 () ValueCell!13487)

