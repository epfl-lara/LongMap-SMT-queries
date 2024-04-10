; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99500 () Bool)

(assert start!99500)

(declare-fun b_free!25079 () Bool)

(declare-fun b_next!25079 () Bool)

(assert (=> start!99500 (= b_free!25079 (not b_next!25079))))

(declare-fun tp!87951 () Bool)

(declare-fun b_and!41025 () Bool)

(assert (=> start!99500 (= tp!87951 b_and!41025)))

(declare-fun b!1176410 () Bool)

(declare-fun res!781359 () Bool)

(declare-fun e!668716 () Bool)

(assert (=> b!1176410 (=> (not res!781359) (not e!668716))))

(declare-datatypes ((array!76025 0))(
  ( (array!76026 (arr!36662 (Array (_ BitVec 32) (_ BitVec 64))) (size!37198 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76025)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1176410 (= res!781359 (= (select (arr!36662 _keys!1208) i!673) k!934))))

(declare-fun b!1176411 () Bool)

(declare-fun res!781369 () Bool)

(assert (=> b!1176411 (=> (not res!781369) (not e!668716))))

(assert (=> b!1176411 (= res!781369 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37198 _keys!1208))))))

(declare-fun b!1176412 () Bool)

(declare-fun e!668726 () Bool)

(declare-fun e!668724 () Bool)

(declare-fun mapRes!46241 () Bool)

(assert (=> b!1176412 (= e!668726 (and e!668724 mapRes!46241))))

(declare-fun condMapEmpty!46241 () Bool)

(declare-datatypes ((V!44605 0))(
  ( (V!44606 (val!14861 Int)) )
))
(declare-datatypes ((ValueCell!14095 0))(
  ( (ValueCellFull!14095 (v!17499 V!44605)) (EmptyCell!14095) )
))
(declare-datatypes ((array!76027 0))(
  ( (array!76028 (arr!36663 (Array (_ BitVec 32) ValueCell!14095)) (size!37199 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76027)

(declare-fun mapDefault!46241 () ValueCell!14095)

