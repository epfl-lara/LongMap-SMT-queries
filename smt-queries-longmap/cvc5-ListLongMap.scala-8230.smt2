; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100288 () Bool)

(assert start!100288)

(declare-fun b!1196490 () Bool)

(declare-fun e!679793 () Bool)

(declare-fun tp_is_empty!30355 () Bool)

(assert (=> b!1196490 (= e!679793 tp_is_empty!30355)))

(declare-fun b!1196491 () Bool)

(declare-fun res!796276 () Bool)

(declare-fun e!679790 () Bool)

(assert (=> b!1196491 (=> (not res!796276) (not e!679790))))

(declare-datatypes ((array!77489 0))(
  ( (array!77490 (arr!37391 (Array (_ BitVec 32) (_ BitVec 64))) (size!37927 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77489)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1196491 (= res!796276 (= (select (arr!37391 _keys!1208) i!673) k!934))))

(declare-fun b!1196492 () Bool)

(declare-fun res!796275 () Bool)

(declare-fun e!679792 () Bool)

(assert (=> b!1196492 (=> (not res!796275) (not e!679792))))

(declare-fun lt!543090 () array!77489)

(declare-datatypes ((List!26304 0))(
  ( (Nil!26301) (Cons!26300 (h!27509 (_ BitVec 64)) (t!38975 List!26304)) )
))
(declare-fun arrayNoDuplicates!0 (array!77489 (_ BitVec 32) List!26304) Bool)

(assert (=> b!1196492 (= res!796275 (arrayNoDuplicates!0 lt!543090 #b00000000000000000000000000000000 Nil!26301))))

(declare-fun b!1196493 () Bool)

(declare-fun res!796272 () Bool)

(assert (=> b!1196493 (=> (not res!796272) (not e!679790))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45601 0))(
  ( (V!45602 (val!15234 Int)) )
))
(declare-datatypes ((ValueCell!14468 0))(
  ( (ValueCellFull!14468 (v!17872 V!45601)) (EmptyCell!14468) )
))
(declare-datatypes ((array!77491 0))(
  ( (array!77492 (arr!37392 (Array (_ BitVec 32) ValueCell!14468)) (size!37928 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77491)

(assert (=> b!1196493 (= res!796272 (and (= (size!37928 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37927 _keys!1208) (size!37928 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196494 () Bool)

(declare-fun res!796271 () Bool)

(assert (=> b!1196494 (=> (not res!796271) (not e!679790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77489 (_ BitVec 32)) Bool)

(assert (=> b!1196494 (= res!796271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196495 () Bool)

(declare-fun res!796274 () Bool)

(assert (=> b!1196495 (=> (not res!796274) (not e!679790))))

(assert (=> b!1196495 (= res!796274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37927 _keys!1208))))))

(declare-fun b!1196496 () Bool)

(declare-fun e!679795 () Bool)

(assert (=> b!1196496 (= e!679795 tp_is_empty!30355)))

(declare-fun b!1196497 () Bool)

(assert (=> b!1196497 (= e!679790 e!679792)))

(declare-fun res!796269 () Bool)

(assert (=> b!1196497 (=> (not res!796269) (not e!679792))))

(assert (=> b!1196497 (= res!796269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543090 mask!1564))))

(assert (=> b!1196497 (= lt!543090 (array!77490 (store (arr!37391 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37927 _keys!1208)))))

(declare-fun b!1196498 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1196498 (= e!679792 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37927 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvsub (size!37927 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!37927 _keys!1208) from!1455)))))))

(declare-fun arrayContainsKey!0 (array!77489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196498 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39674 0))(
  ( (Unit!39675) )
))
(declare-fun lt!543089 () Unit!39674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77489 (_ BitVec 64) (_ BitVec 32)) Unit!39674)

(assert (=> b!1196498 (= lt!543089 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1196499 () Bool)

(declare-fun e!679794 () Bool)

(declare-fun mapRes!47369 () Bool)

(assert (=> b!1196499 (= e!679794 (and e!679795 mapRes!47369))))

(declare-fun condMapEmpty!47369 () Bool)

(declare-fun mapDefault!47369 () ValueCell!14468)

