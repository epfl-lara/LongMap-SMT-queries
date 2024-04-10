; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99586 () Bool)

(assert start!99586)

(declare-fun b_free!25165 () Bool)

(declare-fun b_next!25165 () Bool)

(assert (=> start!99586 (= b_free!25165 (not b_next!25165))))

(declare-fun tp!88208 () Bool)

(declare-fun b_and!41197 () Bool)

(assert (=> start!99586 (= tp!88208 b_and!41197)))

(declare-fun b!1179205 () Bool)

(declare-fun res!783430 () Bool)

(declare-fun e!670399 () Bool)

(assert (=> b!1179205 (=> (not res!783430) (not e!670399))))

(declare-datatypes ((array!76193 0))(
  ( (array!76194 (arr!36746 (Array (_ BitVec 32) (_ BitVec 64))) (size!37282 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76193)

(declare-datatypes ((List!25813 0))(
  ( (Nil!25810) (Cons!25809 (h!27018 (_ BitVec 64)) (t!37970 List!25813)) )
))
(declare-fun arrayNoDuplicates!0 (array!76193 (_ BitVec 32) List!25813) Bool)

(assert (=> b!1179205 (= res!783430 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25810))))

(declare-fun b!1179206 () Bool)

(declare-fun e!670402 () Bool)

(declare-fun e!670396 () Bool)

(assert (=> b!1179206 (= e!670402 (not e!670396))))

(declare-fun res!783418 () Bool)

(assert (=> b!1179206 (=> res!783418 e!670396)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179206 (= res!783418 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179206 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38962 0))(
  ( (Unit!38963) )
))
(declare-fun lt!532889 () Unit!38962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76193 (_ BitVec 64) (_ BitVec 32)) Unit!38962)

(assert (=> b!1179206 (= lt!532889 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179207 () Bool)

(assert (=> b!1179207 (= e!670399 e!670402)))

(declare-fun res!783429 () Bool)

(assert (=> b!1179207 (=> (not res!783429) (not e!670402))))

(declare-fun lt!532885 () array!76193)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76193 (_ BitVec 32)) Bool)

(assert (=> b!1179207 (= res!783429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532885 mask!1564))))

(assert (=> b!1179207 (= lt!532885 (array!76194 (store (arr!36746 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37282 _keys!1208)))))

(declare-fun b!1179208 () Bool)

(declare-fun res!783433 () Bool)

(assert (=> b!1179208 (=> (not res!783433) (not e!670399))))

(assert (=> b!1179208 (= res!783433 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37282 _keys!1208))))))

(declare-fun b!1179209 () Bool)

(declare-fun res!783432 () Bool)

(assert (=> b!1179209 (=> (not res!783432) (not e!670402))))

(assert (=> b!1179209 (= res!783432 (arrayNoDuplicates!0 lt!532885 #b00000000000000000000000000000000 Nil!25810))))

(declare-fun b!1179210 () Bool)

(declare-fun e!670401 () Unit!38962)

(declare-fun Unit!38964 () Unit!38962)

(assert (=> b!1179210 (= e!670401 Unit!38964)))

(declare-fun b!1179211 () Bool)

(declare-fun Unit!38965 () Unit!38962)

(assert (=> b!1179211 (= e!670401 Unit!38965)))

(declare-fun lt!532879 () Unit!38962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76193 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38962)

(assert (=> b!1179211 (= lt!532879 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179211 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532881 () Unit!38962)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76193 (_ BitVec 32) (_ BitVec 32)) Unit!38962)

(assert (=> b!1179211 (= lt!532881 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179211 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25810)))

(declare-fun lt!532888 () Unit!38962)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76193 (_ BitVec 64) (_ BitVec 32) List!25813) Unit!38962)

(assert (=> b!1179211 (= lt!532888 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25810))))

(assert (=> b!1179211 false))

(declare-fun mapIsEmpty!46370 () Bool)

(declare-fun mapRes!46370 () Bool)

(assert (=> mapIsEmpty!46370 mapRes!46370))

(declare-fun b!1179212 () Bool)

(declare-fun res!783421 () Bool)

(assert (=> b!1179212 (=> (not res!783421) (not e!670399))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44721 0))(
  ( (V!44722 (val!14904 Int)) )
))
(declare-datatypes ((ValueCell!14138 0))(
  ( (ValueCellFull!14138 (v!17542 V!44721)) (EmptyCell!14138) )
))
(declare-datatypes ((array!76195 0))(
  ( (array!76196 (arr!36747 (Array (_ BitVec 32) ValueCell!14138)) (size!37283 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76195)

(assert (=> b!1179212 (= res!783421 (and (= (size!37283 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37282 _keys!1208) (size!37283 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179213 () Bool)

(declare-fun res!783431 () Bool)

(assert (=> b!1179213 (=> (not res!783431) (not e!670399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179213 (= res!783431 (validMask!0 mask!1564))))

(declare-fun b!1179214 () Bool)

(declare-fun e!670403 () Bool)

(declare-fun e!670404 () Bool)

(assert (=> b!1179214 (= e!670403 e!670404)))

(declare-fun res!783426 () Bool)

(assert (=> b!1179214 (=> res!783426 e!670404)))

(assert (=> b!1179214 (= res!783426 (not (= (select (arr!36746 _keys!1208) from!1455) k!934)))))

(declare-fun b!1179215 () Bool)

(declare-fun e!670395 () Bool)

(assert (=> b!1179215 (= e!670396 e!670395)))

(declare-fun res!783427 () Bool)

(assert (=> b!1179215 (=> res!783427 e!670395)))

(assert (=> b!1179215 (= res!783427 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44721)

(declare-datatypes ((tuple2!19076 0))(
  ( (tuple2!19077 (_1!9549 (_ BitVec 64)) (_2!9549 V!44721)) )
))
(declare-datatypes ((List!25814 0))(
  ( (Nil!25811) (Cons!25810 (h!27019 tuple2!19076) (t!37971 List!25814)) )
))
(declare-datatypes ((ListLongMap!17045 0))(
  ( (ListLongMap!17046 (toList!8538 List!25814)) )
))
(declare-fun lt!532891 () ListLongMap!17045)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532886 () array!76195)

(declare-fun minValue!944 () V!44721)

(declare-fun getCurrentListMapNoExtraKeys!4993 (array!76193 array!76195 (_ BitVec 32) (_ BitVec 32) V!44721 V!44721 (_ BitVec 32) Int) ListLongMap!17045)

(assert (=> b!1179215 (= lt!532891 (getCurrentListMapNoExtraKeys!4993 lt!532885 lt!532886 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!532893 () V!44721)

(assert (=> b!1179215 (= lt!532886 (array!76196 (store (arr!36747 _values!996) i!673 (ValueCellFull!14138 lt!532893)) (size!37283 _values!996)))))

(declare-fun dynLambda!2953 (Int (_ BitVec 64)) V!44721)

(assert (=> b!1179215 (= lt!532893 (dynLambda!2953 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532892 () ListLongMap!17045)

(assert (=> b!1179215 (= lt!532892 (getCurrentListMapNoExtraKeys!4993 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!783420 () Bool)

(assert (=> start!99586 (=> (not res!783420) (not e!670399))))

(assert (=> start!99586 (= res!783420 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37282 _keys!1208))))))

(assert (=> start!99586 e!670399))

(declare-fun tp_is_empty!29695 () Bool)

(assert (=> start!99586 tp_is_empty!29695))

(declare-fun array_inv!28056 (array!76193) Bool)

(assert (=> start!99586 (array_inv!28056 _keys!1208)))

(assert (=> start!99586 true))

(assert (=> start!99586 tp!88208))

(declare-fun e!670405 () Bool)

(declare-fun array_inv!28057 (array!76195) Bool)

(assert (=> start!99586 (and (array_inv!28057 _values!996) e!670405)))

(declare-fun b!1179216 () Bool)

(assert (=> b!1179216 (= e!670404 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1179217 () Bool)

(declare-fun e!670393 () Bool)

(assert (=> b!1179217 (= e!670405 (and e!670393 mapRes!46370))))

(declare-fun condMapEmpty!46370 () Bool)

(declare-fun mapDefault!46370 () ValueCell!14138)

