; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100226 () Bool)

(assert start!100226)

(declare-fun b!1195281 () Bool)

(declare-fun res!795344 () Bool)

(declare-fun e!679232 () Bool)

(assert (=> b!1195281 (=> (not res!795344) (not e!679232))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77367 0))(
  ( (array!77368 (arr!37330 (Array (_ BitVec 32) (_ BitVec 64))) (size!37866 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77367)

(assert (=> b!1195281 (= res!795344 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37866 _keys!1208))))))

(declare-fun b!1195282 () Bool)

(declare-fun e!679234 () Bool)

(assert (=> b!1195282 (= e!679234 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195282 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39626 0))(
  ( (Unit!39627) )
))
(declare-fun lt!542904 () Unit!39626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77367 (_ BitVec 64) (_ BitVec 32)) Unit!39626)

(assert (=> b!1195282 (= lt!542904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195283 () Bool)

(declare-fun e!679237 () Bool)

(declare-fun tp_is_empty!30293 () Bool)

(assert (=> b!1195283 (= e!679237 tp_is_empty!30293)))

(declare-fun b!1195284 () Bool)

(declare-fun res!795345 () Bool)

(assert (=> b!1195284 (=> (not res!795345) (not e!679234))))

(declare-fun lt!542903 () array!77367)

(declare-datatypes ((List!26276 0))(
  ( (Nil!26273) (Cons!26272 (h!27481 (_ BitVec 64)) (t!38947 List!26276)) )
))
(declare-fun arrayNoDuplicates!0 (array!77367 (_ BitVec 32) List!26276) Bool)

(assert (=> b!1195284 (= res!795345 (arrayNoDuplicates!0 lt!542903 #b00000000000000000000000000000000 Nil!26273))))

(declare-fun b!1195285 () Bool)

(declare-fun res!795341 () Bool)

(assert (=> b!1195285 (=> (not res!795341) (not e!679232))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45517 0))(
  ( (V!45518 (val!15203 Int)) )
))
(declare-datatypes ((ValueCell!14437 0))(
  ( (ValueCellFull!14437 (v!17841 V!45517)) (EmptyCell!14437) )
))
(declare-datatypes ((array!77369 0))(
  ( (array!77370 (arr!37331 (Array (_ BitVec 32) ValueCell!14437)) (size!37867 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77369)

(assert (=> b!1195285 (= res!795341 (and (= (size!37867 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37866 _keys!1208) (size!37867 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47276 () Bool)

(declare-fun mapRes!47276 () Bool)

(assert (=> mapIsEmpty!47276 mapRes!47276))

(declare-fun res!795342 () Bool)

(assert (=> start!100226 (=> (not res!795342) (not e!679232))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100226 (= res!795342 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37866 _keys!1208))))))

(assert (=> start!100226 e!679232))

(declare-fun array_inv!28454 (array!77367) Bool)

(assert (=> start!100226 (array_inv!28454 _keys!1208)))

(assert (=> start!100226 true))

(declare-fun e!679235 () Bool)

(declare-fun array_inv!28455 (array!77369) Bool)

(assert (=> start!100226 (and (array_inv!28455 _values!996) e!679235)))

(declare-fun b!1195286 () Bool)

(assert (=> b!1195286 (= e!679235 (and e!679237 mapRes!47276))))

(declare-fun condMapEmpty!47276 () Bool)

(declare-fun mapDefault!47276 () ValueCell!14437)

