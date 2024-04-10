; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99362 () Bool)

(assert start!99362)

(declare-fun b_free!24941 () Bool)

(declare-fun b_next!24941 () Bool)

(assert (=> start!99362 (= b_free!24941 (not b_next!24941))))

(declare-fun tp!87537 () Bool)

(declare-fun b_and!40749 () Bool)

(assert (=> start!99362 (= tp!87537 b_and!40749)))

(declare-fun b!1172059 () Bool)

(declare-fun e!666192 () Bool)

(declare-fun e!666193 () Bool)

(declare-fun mapRes!46034 () Bool)

(assert (=> b!1172059 (= e!666192 (and e!666193 mapRes!46034))))

(declare-fun condMapEmpty!46034 () Bool)

(declare-datatypes ((V!44421 0))(
  ( (V!44422 (val!14792 Int)) )
))
(declare-datatypes ((ValueCell!14026 0))(
  ( (ValueCellFull!14026 (v!17430 V!44421)) (EmptyCell!14026) )
))
(declare-datatypes ((array!75759 0))(
  ( (array!75760 (arr!36529 (Array (_ BitVec 32) ValueCell!14026)) (size!37065 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75759)

(declare-fun mapDefault!46034 () ValueCell!14026)

