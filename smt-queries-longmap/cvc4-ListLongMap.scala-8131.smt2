; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99656 () Bool)

(assert start!99656)

(declare-fun b_free!25235 () Bool)

(declare-fun b_next!25235 () Bool)

(assert (=> start!99656 (= b_free!25235 (not b_next!25235))))

(declare-fun tp!88418 () Bool)

(declare-fun b_and!41337 () Bool)

(assert (=> start!99656 (= tp!88418 b_and!41337)))

(declare-fun b!1181570 () Bool)

(declare-fun res!785199 () Bool)

(declare-fun e!671760 () Bool)

(assert (=> b!1181570 (=> (not res!785199) (not e!671760))))

(declare-datatypes ((V!44813 0))(
  ( (V!44814 (val!14939 Int)) )
))
(declare-datatypes ((tuple2!19138 0))(
  ( (tuple2!19139 (_1!9580 (_ BitVec 64)) (_2!9580 V!44813)) )
))
(declare-datatypes ((List!25878 0))(
  ( (Nil!25875) (Cons!25874 (h!27083 tuple2!19138) (t!38105 List!25878)) )
))
(declare-datatypes ((ListLongMap!17107 0))(
  ( (ListLongMap!17108 (toList!8569 List!25878)) )
))
(declare-fun lt!534467 () ListLongMap!17107)

(declare-fun lt!534457 () tuple2!19138)

(declare-fun lt!534466 () ListLongMap!17107)

(declare-fun +!3877 (ListLongMap!17107 tuple2!19138) ListLongMap!17107)

(assert (=> b!1181570 (= res!785199 (= lt!534467 (+!3877 lt!534466 lt!534457)))))

(declare-fun mapIsEmpty!46475 () Bool)

(declare-fun mapRes!46475 () Bool)

(assert (=> mapIsEmpty!46475 mapRes!46475))

(declare-fun b!1181571 () Bool)

(declare-fun res!785198 () Bool)

(declare-fun e!671768 () Bool)

(assert (=> b!1181571 (=> (not res!785198) (not e!671768))))

(declare-datatypes ((array!76333 0))(
  ( (array!76334 (arr!36816 (Array (_ BitVec 32) (_ BitVec 64))) (size!37352 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76333)

(declare-datatypes ((List!25879 0))(
  ( (Nil!25876) (Cons!25875 (h!27084 (_ BitVec 64)) (t!38106 List!25879)) )
))
(declare-fun arrayNoDuplicates!0 (array!76333 (_ BitVec 32) List!25879) Bool)

(assert (=> b!1181571 (= res!785198 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25876))))

(declare-fun b!1181572 () Bool)

(declare-datatypes ((Unit!39075 0))(
  ( (Unit!39076) )
))
(declare-fun e!671764 () Unit!39075)

(declare-fun Unit!39077 () Unit!39075)

(assert (=> b!1181572 (= e!671764 Unit!39077)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!534459 () Unit!39075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39075)

(assert (=> b!1181572 (= lt!534459 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181572 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534462 () Unit!39075)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76333 (_ BitVec 32) (_ BitVec 32)) Unit!39075)

(assert (=> b!1181572 (= lt!534462 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181572 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25876)))

(declare-fun lt!534455 () Unit!39075)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76333 (_ BitVec 64) (_ BitVec 32) List!25879) Unit!39075)

(assert (=> b!1181572 (= lt!534455 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25876))))

(assert (=> b!1181572 false))

(declare-fun b!1181573 () Bool)

(declare-fun res!785189 () Bool)

(assert (=> b!1181573 (=> (not res!785189) (not e!671768))))

(assert (=> b!1181573 (= res!785189 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37352 _keys!1208))))))

(declare-fun b!1181574 () Bool)

(declare-fun e!671770 () Bool)

(declare-fun e!671765 () Bool)

(assert (=> b!1181574 (= e!671770 (not e!671765))))

(declare-fun res!785200 () Bool)

(assert (=> b!1181574 (=> res!785200 e!671765)))

(assert (=> b!1181574 (= res!785200 (bvsgt from!1455 i!673))))

(assert (=> b!1181574 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!534461 () Unit!39075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76333 (_ BitVec 64) (_ BitVec 32)) Unit!39075)

(assert (=> b!1181574 (= lt!534461 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1181575 () Bool)

(declare-fun e!671762 () Bool)

(assert (=> b!1181575 (= e!671765 e!671762)))

(declare-fun res!785201 () Bool)

(assert (=> b!1181575 (=> res!785201 e!671762)))

(assert (=> b!1181575 (= res!785201 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44813)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!534458 () ListLongMap!17107)

(declare-fun minValue!944 () V!44813)

(declare-datatypes ((ValueCell!14173 0))(
  ( (ValueCellFull!14173 (v!17577 V!44813)) (EmptyCell!14173) )
))
(declare-datatypes ((array!76335 0))(
  ( (array!76336 (arr!36817 (Array (_ BitVec 32) ValueCell!14173)) (size!37353 (_ BitVec 32))) )
))
(declare-fun lt!534454 () array!76335)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!534465 () array!76333)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5022 (array!76333 array!76335 (_ BitVec 32) (_ BitVec 32) V!44813 V!44813 (_ BitVec 32) Int) ListLongMap!17107)

(assert (=> b!1181575 (= lt!534458 (getCurrentListMapNoExtraKeys!5022 lt!534465 lt!534454 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534463 () V!44813)

(declare-fun _values!996 () array!76335)

(assert (=> b!1181575 (= lt!534454 (array!76336 (store (arr!36817 _values!996) i!673 (ValueCellFull!14173 lt!534463)) (size!37353 _values!996)))))

(declare-fun dynLambda!2977 (Int (_ BitVec 64)) V!44813)

(assert (=> b!1181575 (= lt!534463 (dynLambda!2977 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181575 (= lt!534467 (getCurrentListMapNoExtraKeys!5022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181576 () Bool)

(declare-fun res!785195 () Bool)

(assert (=> b!1181576 (=> (not res!785195) (not e!671768))))

(assert (=> b!1181576 (= res!785195 (and (= (size!37353 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37352 _keys!1208) (size!37353 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181577 () Bool)

(declare-fun res!785203 () Bool)

(assert (=> b!1181577 (=> (not res!785203) (not e!671768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181577 (= res!785203 (validMask!0 mask!1564))))

(declare-fun b!1181578 () Bool)

(declare-fun e!671766 () Bool)

(assert (=> b!1181578 (= e!671762 e!671766)))

(declare-fun res!785192 () Bool)

(assert (=> b!1181578 (=> res!785192 e!671766)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181578 (= res!785192 (not (validKeyInArray!0 (select (arr!36816 _keys!1208) from!1455))))))

(declare-fun lt!534468 () ListLongMap!17107)

(declare-fun lt!534460 () ListLongMap!17107)

(assert (=> b!1181578 (= lt!534468 lt!534460)))

(declare-fun -!1608 (ListLongMap!17107 (_ BitVec 64)) ListLongMap!17107)

(assert (=> b!1181578 (= lt!534460 (-!1608 lt!534466 k!934))))

(assert (=> b!1181578 (= lt!534468 (getCurrentListMapNoExtraKeys!5022 lt!534465 lt!534454 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181578 (= lt!534466 (getCurrentListMapNoExtraKeys!5022 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534456 () Unit!39075)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!835 (array!76333 array!76335 (_ BitVec 32) (_ BitVec 32) V!44813 V!44813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39075)

(assert (=> b!1181578 (= lt!534456 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!835 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181579 () Bool)

(declare-fun e!671761 () Bool)

(declare-fun e!671769 () Bool)

(assert (=> b!1181579 (= e!671761 (and e!671769 mapRes!46475))))

(declare-fun condMapEmpty!46475 () Bool)

(declare-fun mapDefault!46475 () ValueCell!14173)

