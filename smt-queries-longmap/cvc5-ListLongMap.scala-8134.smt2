; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99670 () Bool)

(assert start!99670)

(declare-fun b_free!25249 () Bool)

(declare-fun b_next!25249 () Bool)

(assert (=> start!99670 (= b_free!25249 (not b_next!25249))))

(declare-fun tp!88461 () Bool)

(declare-fun b_and!41365 () Bool)

(assert (=> start!99670 (= tp!88461 b_and!41365)))

(declare-fun b!1182005 () Bool)

(declare-fun res!785513 () Bool)

(declare-fun e!672012 () Bool)

(assert (=> b!1182005 (=> (not res!785513) (not e!672012))))

(declare-datatypes ((array!76361 0))(
  ( (array!76362 (arr!36830 (Array (_ BitVec 32) (_ BitVec 64))) (size!37366 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76361)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1182005 (= res!785513 (= (select (arr!36830 _keys!1208) i!673) k!934))))

(declare-fun b!1182006 () Bool)

(declare-fun e!672020 () Bool)

(assert (=> b!1182006 (= e!672012 e!672020)))

(declare-fun res!785516 () Bool)

(assert (=> b!1182006 (=> (not res!785516) (not e!672020))))

(declare-fun lt!534855 () array!76361)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76361 (_ BitVec 32)) Bool)

(assert (=> b!1182006 (= res!785516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534855 mask!1564))))

(assert (=> b!1182006 (= lt!534855 (array!76362 (store (arr!36830 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37366 _keys!1208)))))

(declare-fun b!1182007 () Bool)

(declare-fun res!785518 () Bool)

(assert (=> b!1182007 (=> (not res!785518) (not e!672012))))

(assert (=> b!1182007 (= res!785518 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37366 _keys!1208))))))

(declare-fun b!1182008 () Bool)

(declare-fun e!672014 () Bool)

(declare-fun e!672016 () Bool)

(assert (=> b!1182008 (= e!672014 e!672016)))

(declare-fun res!785507 () Bool)

(assert (=> b!1182008 (=> res!785507 e!672016)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1182008 (= res!785507 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44833 0))(
  ( (V!44834 (val!14946 Int)) )
))
(declare-fun zeroValue!944 () V!44833)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14180 0))(
  ( (ValueCellFull!14180 (v!17584 V!44833)) (EmptyCell!14180) )
))
(declare-datatypes ((array!76363 0))(
  ( (array!76364 (arr!36831 (Array (_ BitVec 32) ValueCell!14180)) (size!37367 (_ BitVec 32))) )
))
(declare-fun lt!534861 () array!76363)

(declare-datatypes ((tuple2!19152 0))(
  ( (tuple2!19153 (_1!9587 (_ BitVec 64)) (_2!9587 V!44833)) )
))
(declare-datatypes ((List!25892 0))(
  ( (Nil!25889) (Cons!25888 (h!27097 tuple2!19152) (t!38133 List!25892)) )
))
(declare-datatypes ((ListLongMap!17121 0))(
  ( (ListLongMap!17122 (toList!8576 List!25892)) )
))
(declare-fun lt!534864 () ListLongMap!17121)

(declare-fun minValue!944 () V!44833)

(declare-fun getCurrentListMapNoExtraKeys!5029 (array!76361 array!76363 (_ BitVec 32) (_ BitVec 32) V!44833 V!44833 (_ BitVec 32) Int) ListLongMap!17121)

(assert (=> b!1182008 (= lt!534864 (getCurrentListMapNoExtraKeys!5029 lt!534855 lt!534861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534852 () V!44833)

(declare-fun _values!996 () array!76363)

(assert (=> b!1182008 (= lt!534861 (array!76364 (store (arr!36831 _values!996) i!673 (ValueCellFull!14180 lt!534852)) (size!37367 _values!996)))))

(declare-fun dynLambda!2984 (Int (_ BitVec 64)) V!44833)

(assert (=> b!1182008 (= lt!534852 (dynLambda!2984 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534859 () ListLongMap!17121)

(assert (=> b!1182008 (= lt!534859 (getCurrentListMapNoExtraKeys!5029 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182009 () Bool)

(declare-fun e!672019 () Bool)

(assert (=> b!1182009 (= e!672016 e!672019)))

(declare-fun res!785504 () Bool)

(assert (=> b!1182009 (=> res!785504 e!672019)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182009 (= res!785504 (not (validKeyInArray!0 (select (arr!36830 _keys!1208) from!1455))))))

(declare-fun lt!534865 () ListLongMap!17121)

(declare-fun lt!534856 () ListLongMap!17121)

(assert (=> b!1182009 (= lt!534865 lt!534856)))

(declare-fun lt!534850 () ListLongMap!17121)

(declare-fun -!1614 (ListLongMap!17121 (_ BitVec 64)) ListLongMap!17121)

(assert (=> b!1182009 (= lt!534856 (-!1614 lt!534850 k!934))))

(assert (=> b!1182009 (= lt!534865 (getCurrentListMapNoExtraKeys!5029 lt!534855 lt!534861 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182009 (= lt!534850 (getCurrentListMapNoExtraKeys!5029 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39099 0))(
  ( (Unit!39100) )
))
(declare-fun lt!534857 () Unit!39099)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!839 (array!76361 array!76363 (_ BitVec 32) (_ BitVec 32) V!44833 V!44833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39099)

(assert (=> b!1182009 (= lt!534857 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!839 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182010 () Bool)

(declare-fun e!672011 () Bool)

(declare-fun arrayContainsKey!0 (array!76361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182010 (= e!672011 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46496 () Bool)

(declare-fun mapRes!46496 () Bool)

(assert (=> mapIsEmpty!46496 mapRes!46496))

(declare-fun b!1182011 () Bool)

(declare-fun e!672017 () Bool)

(assert (=> b!1182011 (= e!672017 e!672011)))

(declare-fun res!785509 () Bool)

(assert (=> b!1182011 (=> res!785509 e!672011)))

(assert (=> b!1182011 (= res!785509 (not (= (select (arr!36830 _keys!1208) from!1455) k!934)))))

(declare-fun b!1182013 () Bool)

(declare-fun res!785514 () Bool)

(assert (=> b!1182013 (=> (not res!785514) (not e!672012))))

(declare-datatypes ((List!25893 0))(
  ( (Nil!25890) (Cons!25889 (h!27098 (_ BitVec 64)) (t!38134 List!25893)) )
))
(declare-fun arrayNoDuplicates!0 (array!76361 (_ BitVec 32) List!25893) Bool)

(assert (=> b!1182013 (= res!785514 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25890))))

(declare-fun b!1182014 () Bool)

(declare-fun res!785517 () Bool)

(assert (=> b!1182014 (=> (not res!785517) (not e!672012))))

(assert (=> b!1182014 (= res!785517 (and (= (size!37367 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37366 _keys!1208) (size!37367 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182015 () Bool)

(declare-fun res!785515 () Bool)

(assert (=> b!1182015 (=> (not res!785515) (not e!672020))))

(assert (=> b!1182015 (= res!785515 (arrayNoDuplicates!0 lt!534855 #b00000000000000000000000000000000 Nil!25890))))

(declare-fun b!1182016 () Bool)

(declare-fun res!785510 () Bool)

(assert (=> b!1182016 (=> (not res!785510) (not e!672012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182016 (= res!785510 (validMask!0 mask!1564))))

(declare-fun b!1182017 () Bool)

(assert (=> b!1182017 (= e!672020 (not e!672014))))

(declare-fun res!785512 () Bool)

(assert (=> b!1182017 (=> res!785512 e!672014)))

(assert (=> b!1182017 (= res!785512 (bvsgt from!1455 i!673))))

(assert (=> b!1182017 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!534863 () Unit!39099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76361 (_ BitVec 64) (_ BitVec 32)) Unit!39099)

(assert (=> b!1182017 (= lt!534863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1182018 () Bool)

(declare-fun e!672018 () Unit!39099)

(declare-fun Unit!39101 () Unit!39099)

(assert (=> b!1182018 (= e!672018 Unit!39101)))

(declare-fun b!1182019 () Bool)

(declare-fun Unit!39102 () Unit!39099)

(assert (=> b!1182019 (= e!672018 Unit!39102)))

(declare-fun lt!534866 () Unit!39099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39099)

(assert (=> b!1182019 (= lt!534866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182019 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534867 () Unit!39099)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76361 (_ BitVec 32) (_ BitVec 32)) Unit!39099)

(assert (=> b!1182019 (= lt!534867 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182019 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25890)))

(declare-fun lt!534860 () Unit!39099)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76361 (_ BitVec 64) (_ BitVec 32) List!25893) Unit!39099)

(assert (=> b!1182019 (= lt!534860 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25890))))

(assert (=> b!1182019 false))

(declare-fun b!1182020 () Bool)

(declare-fun e!672015 () Bool)

(declare-fun e!672021 () Bool)

(assert (=> b!1182020 (= e!672015 (and e!672021 mapRes!46496))))

(declare-fun condMapEmpty!46496 () Bool)

(declare-fun mapDefault!46496 () ValueCell!14180)

