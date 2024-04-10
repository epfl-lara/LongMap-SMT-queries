; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99626 () Bool)

(assert start!99626)

(declare-fun b_free!25205 () Bool)

(declare-fun b_next!25205 () Bool)

(assert (=> start!99626 (= b_free!25205 (not b_next!25205))))

(declare-fun tp!88328 () Bool)

(declare-fun b_and!41277 () Bool)

(assert (=> start!99626 (= tp!88328 b_and!41277)))

(declare-fun b!1180549 () Bool)

(declare-datatypes ((Unit!39027 0))(
  ( (Unit!39028) )
))
(declare-fun e!671179 () Unit!39027)

(declare-fun Unit!39029 () Unit!39027)

(assert (=> b!1180549 (= e!671179 Unit!39029)))

(declare-fun lt!533779 () Unit!39027)

(declare-datatypes ((array!76273 0))(
  ( (array!76274 (arr!36786 (Array (_ BitVec 32) (_ BitVec 64))) (size!37322 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76273)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76273 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39027)

(assert (=> b!1180549 (= lt!533779 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180549 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533790 () Unit!39027)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76273 (_ BitVec 32) (_ BitVec 32)) Unit!39027)

(assert (=> b!1180549 (= lt!533790 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25852 0))(
  ( (Nil!25849) (Cons!25848 (h!27057 (_ BitVec 64)) (t!38049 List!25852)) )
))
(declare-fun arrayNoDuplicates!0 (array!76273 (_ BitVec 32) List!25852) Bool)

(assert (=> b!1180549 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25849)))

(declare-fun lt!533791 () Unit!39027)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76273 (_ BitVec 64) (_ BitVec 32) List!25852) Unit!39027)

(assert (=> b!1180549 (= lt!533791 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25849))))

(assert (=> b!1180549 false))

(declare-fun b!1180550 () Bool)

(declare-fun e!671180 () Bool)

(declare-fun e!671182 () Bool)

(declare-fun mapRes!46430 () Bool)

(assert (=> b!1180550 (= e!671180 (and e!671182 mapRes!46430))))

(declare-fun condMapEmpty!46430 () Bool)

(declare-datatypes ((V!44773 0))(
  ( (V!44774 (val!14924 Int)) )
))
(declare-datatypes ((ValueCell!14158 0))(
  ( (ValueCellFull!14158 (v!17562 V!44773)) (EmptyCell!14158) )
))
(declare-datatypes ((array!76275 0))(
  ( (array!76276 (arr!36787 (Array (_ BitVec 32) ValueCell!14158)) (size!37323 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76275)

(declare-fun mapDefault!46430 () ValueCell!14158)

