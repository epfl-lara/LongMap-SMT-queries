; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99758 () Bool)

(assert start!99758)

(declare-fun b_free!25337 () Bool)

(declare-fun b_next!25337 () Bool)

(assert (=> start!99758 (= b_free!25337 (not b_next!25337))))

(declare-fun tp!88725 () Bool)

(declare-fun b_and!41541 () Bool)

(assert (=> start!99758 (= tp!88725 b_and!41541)))

(declare-fun e!673601 () Bool)

(declare-datatypes ((array!76533 0))(
  ( (array!76534 (arr!36916 (Array (_ BitVec 32) (_ BitVec 64))) (size!37452 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76533)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1184733 () Bool)

(declare-fun arrayContainsKey!0 (array!76533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184733 (= e!673601 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184734 () Bool)

(declare-fun e!673603 () Bool)

(declare-fun tp_is_empty!29867 () Bool)

(assert (=> b!1184734 (= e!673603 tp_is_empty!29867)))

(declare-fun b!1184735 () Bool)

(declare-fun e!673595 () Bool)

(declare-fun e!673596 () Bool)

(assert (=> b!1184735 (= e!673595 (not e!673596))))

(declare-fun res!787496 () Bool)

(assert (=> b!1184735 (=> res!787496 e!673596)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1184735 (= res!787496 (bvsgt from!1455 i!673))))

(assert (=> b!1184735 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39233 0))(
  ( (Unit!39234) )
))
(declare-fun lt!537369 () Unit!39233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76533 (_ BitVec 64) (_ BitVec 32)) Unit!39233)

(assert (=> b!1184735 (= lt!537369 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1184736 () Bool)

(declare-fun e!673606 () Bool)

(assert (=> b!1184736 (= e!673606 true)))

(declare-datatypes ((V!44949 0))(
  ( (V!44950 (val!14990 Int)) )
))
(declare-datatypes ((tuple2!19222 0))(
  ( (tuple2!19223 (_1!9622 (_ BitVec 64)) (_2!9622 V!44949)) )
))
(declare-datatypes ((List!25962 0))(
  ( (Nil!25959) (Cons!25958 (h!27167 tuple2!19222) (t!38291 List!25962)) )
))
(declare-datatypes ((ListLongMap!17191 0))(
  ( (ListLongMap!17192 (toList!8611 List!25962)) )
))
(declare-fun lt!537363 () ListLongMap!17191)

(declare-fun lt!537374 () ListLongMap!17191)

(declare-fun -!1646 (ListLongMap!17191 (_ BitVec 64)) ListLongMap!17191)

(assert (=> b!1184736 (= (-!1646 lt!537363 k!934) lt!537374)))

(declare-fun lt!537373 () ListLongMap!17191)

(declare-fun lt!537367 () Unit!39233)

(declare-fun lt!537366 () V!44949)

(declare-fun addRemoveCommutativeForDiffKeys!171 (ListLongMap!17191 (_ BitVec 64) V!44949 (_ BitVec 64)) Unit!39233)

(assert (=> b!1184736 (= lt!537367 (addRemoveCommutativeForDiffKeys!171 lt!537373 (select (arr!36916 _keys!1208) from!1455) lt!537366 k!934))))

(declare-fun lt!537371 () ListLongMap!17191)

(declare-fun lt!537365 () ListLongMap!17191)

(declare-fun lt!537358 () ListLongMap!17191)

(assert (=> b!1184736 (and (= lt!537371 lt!537363) (= lt!537365 lt!537358))))

(declare-fun lt!537368 () tuple2!19222)

(declare-fun +!3908 (ListLongMap!17191 tuple2!19222) ListLongMap!17191)

(assert (=> b!1184736 (= lt!537363 (+!3908 lt!537373 lt!537368))))

(assert (=> b!1184736 (not (= (select (arr!36916 _keys!1208) from!1455) k!934))))

(declare-fun lt!537361 () Unit!39233)

(declare-fun e!673602 () Unit!39233)

(assert (=> b!1184736 (= lt!537361 e!673602)))

(declare-fun c!117129 () Bool)

(assert (=> b!1184736 (= c!117129 (= (select (arr!36916 _keys!1208) from!1455) k!934))))

(declare-fun e!673599 () Bool)

(assert (=> b!1184736 e!673599))

(declare-fun res!787486 () Bool)

(assert (=> b!1184736 (=> (not res!787486) (not e!673599))))

(declare-fun lt!537375 () ListLongMap!17191)

(assert (=> b!1184736 (= res!787486 (= lt!537375 lt!537374))))

(assert (=> b!1184736 (= lt!537374 (+!3908 lt!537365 lt!537368))))

(assert (=> b!1184736 (= lt!537368 (tuple2!19223 (select (arr!36916 _keys!1208) from!1455) lt!537366))))

(declare-fun lt!537372 () V!44949)

(declare-datatypes ((ValueCell!14224 0))(
  ( (ValueCellFull!14224 (v!17628 V!44949)) (EmptyCell!14224) )
))
(declare-datatypes ((array!76535 0))(
  ( (array!76536 (arr!36917 (Array (_ BitVec 32) ValueCell!14224)) (size!37453 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76535)

(declare-fun get!18893 (ValueCell!14224 V!44949) V!44949)

(assert (=> b!1184736 (= lt!537366 (get!18893 (select (arr!36917 _values!996) from!1455) lt!537372))))

(declare-fun res!787484 () Bool)

(declare-fun e!673597 () Bool)

(assert (=> start!99758 (=> (not res!787484) (not e!673597))))

(assert (=> start!99758 (= res!787484 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37452 _keys!1208))))))

(assert (=> start!99758 e!673597))

(assert (=> start!99758 tp_is_empty!29867))

(declare-fun array_inv!28174 (array!76533) Bool)

(assert (=> start!99758 (array_inv!28174 _keys!1208)))

(assert (=> start!99758 true))

(assert (=> start!99758 tp!88725))

(declare-fun e!673600 () Bool)

(declare-fun array_inv!28175 (array!76535) Bool)

(assert (=> start!99758 (and (array_inv!28175 _values!996) e!673600)))

(declare-fun b!1184737 () Bool)

(declare-fun res!787488 () Bool)

(assert (=> b!1184737 (=> (not res!787488) (not e!673597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184737 (= res!787488 (validKeyInArray!0 k!934))))

(declare-fun b!1184738 () Bool)

(declare-fun e!673604 () Bool)

(assert (=> b!1184738 (= e!673604 e!673606)))

(declare-fun res!787494 () Bool)

(assert (=> b!1184738 (=> res!787494 e!673606)))

(assert (=> b!1184738 (= res!787494 (not (validKeyInArray!0 (select (arr!36916 _keys!1208) from!1455))))))

(assert (=> b!1184738 (= lt!537358 lt!537365)))

(assert (=> b!1184738 (= lt!537365 (-!1646 lt!537373 k!934))))

(declare-fun zeroValue!944 () V!44949)

(declare-fun lt!537357 () array!76533)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44949)

(declare-fun lt!537364 () array!76535)

(declare-fun getCurrentListMapNoExtraKeys!5060 (array!76533 array!76535 (_ BitVec 32) (_ BitVec 32) V!44949 V!44949 (_ BitVec 32) Int) ListLongMap!17191)

(assert (=> b!1184738 (= lt!537358 (getCurrentListMapNoExtraKeys!5060 lt!537357 lt!537364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184738 (= lt!537373 (getCurrentListMapNoExtraKeys!5060 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537362 () Unit!39233)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!865 (array!76533 array!76535 (_ BitVec 32) (_ BitVec 32) V!44949 V!44949 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39233)

(assert (=> b!1184738 (= lt!537362 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!865 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184739 () Bool)

(declare-fun res!787493 () Bool)

(assert (=> b!1184739 (=> (not res!787493) (not e!673597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184739 (= res!787493 (validMask!0 mask!1564))))

(declare-fun b!1184740 () Bool)

(declare-fun res!787489 () Bool)

(assert (=> b!1184740 (=> (not res!787489) (not e!673597))))

(assert (=> b!1184740 (= res!787489 (and (= (size!37453 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37452 _keys!1208) (size!37453 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184741 () Bool)

(assert (=> b!1184741 (= e!673596 e!673604)))

(declare-fun res!787491 () Bool)

(assert (=> b!1184741 (=> res!787491 e!673604)))

(assert (=> b!1184741 (= res!787491 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1184741 (= lt!537375 (getCurrentListMapNoExtraKeys!5060 lt!537357 lt!537364 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184741 (= lt!537364 (array!76536 (store (arr!36917 _values!996) i!673 (ValueCellFull!14224 lt!537372)) (size!37453 _values!996)))))

(declare-fun dynLambda!3011 (Int (_ BitVec 64)) V!44949)

(assert (=> b!1184741 (= lt!537372 (dynLambda!3011 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184741 (= lt!537371 (getCurrentListMapNoExtraKeys!5060 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184742 () Bool)

(assert (=> b!1184742 (= e!673597 e!673595)))

(declare-fun res!787490 () Bool)

(assert (=> b!1184742 (=> (not res!787490) (not e!673595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76533 (_ BitVec 32)) Bool)

(assert (=> b!1184742 (= res!787490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537357 mask!1564))))

(assert (=> b!1184742 (= lt!537357 (array!76534 (store (arr!36916 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37452 _keys!1208)))))

(declare-fun b!1184743 () Bool)

(assert (=> b!1184743 (= e!673599 e!673601)))

(declare-fun res!787492 () Bool)

(assert (=> b!1184743 (=> res!787492 e!673601)))

(assert (=> b!1184743 (= res!787492 (not (= (select (arr!36916 _keys!1208) from!1455) k!934)))))

(declare-fun b!1184744 () Bool)

(declare-fun res!787498 () Bool)

(assert (=> b!1184744 (=> (not res!787498) (not e!673597))))

(declare-datatypes ((List!25963 0))(
  ( (Nil!25960) (Cons!25959 (h!27168 (_ BitVec 64)) (t!38292 List!25963)) )
))
(declare-fun arrayNoDuplicates!0 (array!76533 (_ BitVec 32) List!25963) Bool)

(assert (=> b!1184744 (= res!787498 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25960))))

(declare-fun b!1184745 () Bool)

(declare-fun Unit!39235 () Unit!39233)

(assert (=> b!1184745 (= e!673602 Unit!39235)))

(declare-fun lt!537370 () Unit!39233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76533 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39233)

(assert (=> b!1184745 (= lt!537370 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184745 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537359 () Unit!39233)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76533 (_ BitVec 32) (_ BitVec 32)) Unit!39233)

(assert (=> b!1184745 (= lt!537359 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184745 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25960)))

(declare-fun lt!537360 () Unit!39233)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76533 (_ BitVec 64) (_ BitVec 32) List!25963) Unit!39233)

(assert (=> b!1184745 (= lt!537360 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25960))))

(assert (=> b!1184745 false))

(declare-fun b!1184746 () Bool)

(declare-fun res!787497 () Bool)

(assert (=> b!1184746 (=> (not res!787497) (not e!673597))))

(assert (=> b!1184746 (= res!787497 (= (select (arr!36916 _keys!1208) i!673) k!934))))

(declare-fun b!1184747 () Bool)

(declare-fun res!787485 () Bool)

(assert (=> b!1184747 (=> (not res!787485) (not e!673595))))

(assert (=> b!1184747 (= res!787485 (arrayNoDuplicates!0 lt!537357 #b00000000000000000000000000000000 Nil!25960))))

(declare-fun mapIsEmpty!46628 () Bool)

(declare-fun mapRes!46628 () Bool)

(assert (=> mapIsEmpty!46628 mapRes!46628))

(declare-fun b!1184748 () Bool)

(declare-fun e!673598 () Bool)

(assert (=> b!1184748 (= e!673598 tp_is_empty!29867)))

(declare-fun b!1184749 () Bool)

(assert (=> b!1184749 (= e!673600 (and e!673603 mapRes!46628))))

(declare-fun condMapEmpty!46628 () Bool)

(declare-fun mapDefault!46628 () ValueCell!14224)

