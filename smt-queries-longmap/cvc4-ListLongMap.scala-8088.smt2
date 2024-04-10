; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99398 () Bool)

(assert start!99398)

(declare-fun b_free!24977 () Bool)

(declare-fun b_next!24977 () Bool)

(assert (=> start!99398 (= b_free!24977 (not b_next!24977))))

(declare-fun tp!87644 () Bool)

(declare-fun b_and!40821 () Bool)

(assert (=> start!99398 (= tp!87644 b_and!40821)))

(declare-fun b!1173231 () Bool)

(declare-datatypes ((Unit!38690 0))(
  ( (Unit!38691) )
))
(declare-fun e!666868 () Unit!38690)

(declare-fun Unit!38692 () Unit!38690)

(assert (=> b!1173231 (= e!666868 Unit!38692)))

(declare-datatypes ((array!75825 0))(
  ( (array!75826 (arr!36562 (Array (_ BitVec 32) (_ BitVec 64))) (size!37098 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75825)

(declare-fun lt!528795 () Unit!38690)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75825 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38690)

(assert (=> b!1173231 (= lt!528795 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173231 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528787 () Unit!38690)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75825 (_ BitVec 32) (_ BitVec 32)) Unit!38690)

(assert (=> b!1173231 (= lt!528787 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25664 0))(
  ( (Nil!25661) (Cons!25660 (h!26869 (_ BitVec 64)) (t!37633 List!25664)) )
))
(declare-fun arrayNoDuplicates!0 (array!75825 (_ BitVec 32) List!25664) Bool)

(assert (=> b!1173231 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25661)))

(declare-fun lt!528794 () Unit!38690)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75825 (_ BitVec 64) (_ BitVec 32) List!25664) Unit!38690)

(assert (=> b!1173231 (= lt!528794 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25661))))

(assert (=> b!1173231 false))

(declare-fun b!1173232 () Bool)

(declare-fun e!666867 () Bool)

(declare-fun e!666873 () Bool)

(assert (=> b!1173232 (= e!666867 e!666873)))

(declare-fun res!779055 () Bool)

(assert (=> b!1173232 (=> res!779055 e!666873)))

(assert (=> b!1173232 (= res!779055 (not (= (select (arr!36562 _keys!1208) from!1455) k!934)))))

(declare-fun b!1173233 () Bool)

(assert (=> b!1173233 (= e!666873 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173234 () Bool)

(declare-fun res!779044 () Bool)

(declare-fun e!666869 () Bool)

(assert (=> b!1173234 (=> (not res!779044) (not e!666869))))

(assert (=> b!1173234 (= res!779044 (= (select (arr!36562 _keys!1208) i!673) k!934))))

(declare-fun b!1173235 () Bool)

(declare-fun e!666871 () Bool)

(assert (=> b!1173235 (= e!666869 e!666871)))

(declare-fun res!779043 () Bool)

(assert (=> b!1173235 (=> (not res!779043) (not e!666871))))

(declare-fun lt!528792 () array!75825)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75825 (_ BitVec 32)) Bool)

(assert (=> b!1173235 (= res!779043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528792 mask!1564))))

(assert (=> b!1173235 (= lt!528792 (array!75826 (store (arr!36562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37098 _keys!1208)))))

(declare-fun b!1173236 () Bool)

(declare-fun e!666870 () Bool)

(declare-fun e!666866 () Bool)

(declare-fun mapRes!46088 () Bool)

(assert (=> b!1173236 (= e!666870 (and e!666866 mapRes!46088))))

(declare-fun condMapEmpty!46088 () Bool)

(declare-datatypes ((V!44469 0))(
  ( (V!44470 (val!14810 Int)) )
))
(declare-datatypes ((ValueCell!14044 0))(
  ( (ValueCellFull!14044 (v!17448 V!44469)) (EmptyCell!14044) )
))
(declare-datatypes ((array!75827 0))(
  ( (array!75828 (arr!36563 (Array (_ BitVec 32) ValueCell!14044)) (size!37099 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75827)

(declare-fun mapDefault!46088 () ValueCell!14044)

