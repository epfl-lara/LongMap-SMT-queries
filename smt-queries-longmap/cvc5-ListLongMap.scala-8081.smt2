; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99352 () Bool)

(assert start!99352)

(declare-fun b_free!24931 () Bool)

(declare-fun b_next!24931 () Bool)

(assert (=> start!99352 (= b_free!24931 (not b_next!24931))))

(declare-fun tp!87507 () Bool)

(declare-fun b_and!40729 () Bool)

(assert (=> start!99352 (= tp!87507 b_and!40729)))

(declare-fun b!1171719 () Bool)

(declare-fun res!777835 () Bool)

(declare-fun e!665996 () Bool)

(assert (=> b!1171719 (=> (not res!777835) (not e!665996))))

(declare-datatypes ((array!75739 0))(
  ( (array!75740 (arr!36519 (Array (_ BitVec 32) (_ BitVec 64))) (size!37055 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75739)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44409 0))(
  ( (V!44410 (val!14787 Int)) )
))
(declare-datatypes ((ValueCell!14021 0))(
  ( (ValueCellFull!14021 (v!17425 V!44409)) (EmptyCell!14021) )
))
(declare-datatypes ((array!75741 0))(
  ( (array!75742 (arr!36520 (Array (_ BitVec 32) ValueCell!14021)) (size!37056 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75741)

(assert (=> b!1171719 (= res!777835 (and (= (size!37056 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37055 _keys!1208) (size!37056 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171720 () Bool)

(declare-fun e!666000 () Bool)

(declare-fun e!666004 () Bool)

(declare-fun mapRes!46019 () Bool)

(assert (=> b!1171720 (= e!666000 (and e!666004 mapRes!46019))))

(declare-fun condMapEmpty!46019 () Bool)

(declare-fun mapDefault!46019 () ValueCell!14021)

