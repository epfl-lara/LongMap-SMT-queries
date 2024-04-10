; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97986 () Bool)

(assert start!97986)

(declare-fun b_free!23687 () Bool)

(declare-fun b_next!23687 () Bool)

(assert (=> start!97986 (= b_free!23687 (not b_next!23687))))

(declare-fun tp!83764 () Bool)

(declare-fun b_and!38157 () Bool)

(assert (=> start!97986 (= tp!83764 b_and!38157)))

(declare-fun b!1123646 () Bool)

(declare-fun e!639684 () Bool)

(declare-fun e!639683 () Bool)

(declare-fun mapRes!44143 () Bool)

(assert (=> b!1123646 (= e!639684 (and e!639683 mapRes!44143))))

(declare-fun condMapEmpty!44143 () Bool)

(declare-datatypes ((V!42749 0))(
  ( (V!42750 (val!14165 Int)) )
))
(declare-datatypes ((ValueCell!13399 0))(
  ( (ValueCellFull!13399 (v!16798 V!42749)) (EmptyCell!13399) )
))
(declare-datatypes ((array!73303 0))(
  ( (array!73304 (arr!35304 (Array (_ BitVec 32) ValueCell!13399)) (size!35840 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73303)

(declare-fun mapDefault!44143 () ValueCell!13399)

