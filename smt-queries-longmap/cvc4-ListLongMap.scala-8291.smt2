; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101022 () Bool)

(assert start!101022)

(declare-fun b_free!26021 () Bool)

(declare-fun b_next!26021 () Bool)

(assert (=> start!101022 (= b_free!26021 (not b_next!26021))))

(declare-fun tp!91078 () Bool)

(declare-fun b_and!43123 () Bool)

(assert (=> start!101022 (= tp!91078 b_and!43123)))

(declare-fun b!1210659 () Bool)

(declare-datatypes ((Unit!40135 0))(
  ( (Unit!40136) )
))
(declare-fun e!687559 () Unit!40135)

(declare-fun Unit!40137 () Unit!40135)

(assert (=> b!1210659 (= e!687559 Unit!40137)))

(declare-fun b!1210660 () Bool)

(declare-fun e!687553 () Bool)

(declare-fun e!687552 () Bool)

(assert (=> b!1210660 (= e!687553 (not e!687552))))

(declare-fun res!804420 () Bool)

(assert (=> b!1210660 (=> res!804420 e!687552)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1210660 (= res!804420 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78235 0))(
  ( (array!78236 (arr!37754 (Array (_ BitVec 32) (_ BitVec 64))) (size!38290 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78235)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1210660 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!549706 () Unit!40135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78235 (_ BitVec 64) (_ BitVec 32)) Unit!40135)

(assert (=> b!1210660 (= lt!549706 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1210661 () Bool)

(declare-fun e!687560 () Bool)

(declare-fun e!687554 () Bool)

(declare-fun mapRes!47956 () Bool)

(assert (=> b!1210661 (= e!687560 (and e!687554 mapRes!47956))))

(declare-fun condMapEmpty!47956 () Bool)

(declare-datatypes ((V!46093 0))(
  ( (V!46094 (val!15419 Int)) )
))
(declare-datatypes ((ValueCell!14653 0))(
  ( (ValueCellFull!14653 (v!18070 V!46093)) (EmptyCell!14653) )
))
(declare-datatypes ((array!78237 0))(
  ( (array!78238 (arr!37755 (Array (_ BitVec 32) ValueCell!14653)) (size!38291 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78237)

(declare-fun mapDefault!47956 () ValueCell!14653)

