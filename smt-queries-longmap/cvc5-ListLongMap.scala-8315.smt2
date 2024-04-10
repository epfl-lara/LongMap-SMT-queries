; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101238 () Bool)

(assert start!101238)

(declare-fun b_free!26161 () Bool)

(declare-fun b_next!26161 () Bool)

(assert (=> start!101238 (= b_free!26161 (not b_next!26161))))

(declare-fun tp!91505 () Bool)

(declare-fun b_and!43439 () Bool)

(assert (=> start!101238 (= tp!91505 b_and!43439)))

(declare-fun b!1215816 () Bool)

(declare-fun e!690325 () Bool)

(declare-fun e!690327 () Bool)

(assert (=> b!1215816 (= e!690325 (not e!690327))))

(declare-fun res!807293 () Bool)

(assert (=> b!1215816 (=> res!807293 e!690327)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1215816 (= res!807293 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78503 0))(
  ( (array!78504 (arr!37886 (Array (_ BitVec 32) (_ BitVec 64))) (size!38422 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78503)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1215816 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40312 0))(
  ( (Unit!40313) )
))
(declare-fun lt!552720 () Unit!40312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78503 (_ BitVec 64) (_ BitVec 32)) Unit!40312)

(assert (=> b!1215816 (= lt!552720 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1215817 () Bool)

(declare-fun res!807286 () Bool)

(declare-fun e!690323 () Bool)

(assert (=> b!1215817 (=> (not res!807286) (not e!690323))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46281 0))(
  ( (V!46282 (val!15489 Int)) )
))
(declare-datatypes ((ValueCell!14723 0))(
  ( (ValueCellFull!14723 (v!18142 V!46281)) (EmptyCell!14723) )
))
(declare-datatypes ((array!78505 0))(
  ( (array!78506 (arr!37887 (Array (_ BitVec 32) ValueCell!14723)) (size!38423 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78505)

(assert (=> b!1215817 (= res!807286 (and (= (size!38423 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38422 _keys!1208) (size!38423 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1215818 () Bool)

(declare-fun e!690328 () Bool)

(declare-fun e!690326 () Bool)

(declare-fun mapRes!48172 () Bool)

(assert (=> b!1215818 (= e!690328 (and e!690326 mapRes!48172))))

(declare-fun condMapEmpty!48172 () Bool)

(declare-fun mapDefault!48172 () ValueCell!14723)

