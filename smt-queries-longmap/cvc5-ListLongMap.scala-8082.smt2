; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99358 () Bool)

(assert start!99358)

(declare-fun b_free!24937 () Bool)

(declare-fun b_next!24937 () Bool)

(assert (=> start!99358 (= b_free!24937 (not b_next!24937))))

(declare-fun tp!87525 () Bool)

(declare-fun b_and!40741 () Bool)

(assert (=> start!99358 (= tp!87525 b_and!40741)))

(declare-fun b!1171923 () Bool)

(declare-fun e!666109 () Bool)

(declare-fun e!666121 () Bool)

(assert (=> b!1171923 (= e!666109 e!666121)))

(declare-fun res!778006 () Bool)

(assert (=> b!1171923 (=> res!778006 e!666121)))

(declare-datatypes ((array!75751 0))(
  ( (array!75752 (arr!36525 (Array (_ BitVec 32) (_ BitVec 64))) (size!37061 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75751)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171923 (= res!778006 (or (bvsge (size!37061 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37061 _keys!1208)) (bvsge from!1455 (size!37061 _keys!1208))))))

(declare-datatypes ((List!25632 0))(
  ( (Nil!25629) (Cons!25628 (h!26837 (_ BitVec 64)) (t!37561 List!25632)) )
))
(declare-fun arrayNoDuplicates!0 (array!75751 (_ BitVec 32) List!25632) Bool)

(assert (=> b!1171923 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25629)))

(declare-datatypes ((Unit!38648 0))(
  ( (Unit!38649) )
))
(declare-fun lt!527988 () Unit!38648)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75751 (_ BitVec 32) (_ BitVec 32)) Unit!38648)

(assert (=> b!1171923 (= lt!527988 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171923 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!527982 () Unit!38648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75751 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38648)

(assert (=> b!1171923 (= lt!527982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171924 () Bool)

(declare-fun res!778019 () Bool)

(declare-fun e!666115 () Bool)

(assert (=> b!1171924 (=> (not res!778019) (not e!666115))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75751 (_ BitVec 32)) Bool)

(assert (=> b!1171924 (= res!778019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171925 () Bool)

(declare-fun res!778024 () Bool)

(assert (=> b!1171925 (=> res!778024 e!666121)))

(declare-fun contains!6852 (List!25632 (_ BitVec 64)) Bool)

(assert (=> b!1171925 (= res!778024 (contains!6852 Nil!25629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171926 () Bool)

(declare-fun res!778008 () Bool)

(assert (=> b!1171926 (=> res!778008 e!666121)))

(declare-fun noDuplicate!1613 (List!25632) Bool)

(assert (=> b!1171926 (= res!778008 (not (noDuplicate!1613 Nil!25629)))))

(declare-fun b!1171928 () Bool)

(declare-fun res!778011 () Bool)

(assert (=> b!1171928 (=> (not res!778011) (not e!666115))))

(assert (=> b!1171928 (= res!778011 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37061 _keys!1208))))))

(declare-fun b!1171929 () Bool)

(declare-fun e!666114 () Bool)

(assert (=> b!1171929 (= e!666115 e!666114)))

(declare-fun res!778015 () Bool)

(assert (=> b!1171929 (=> (not res!778015) (not e!666114))))

(declare-fun lt!527979 () array!75751)

(assert (=> b!1171929 (= res!778015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527979 mask!1564))))

(assert (=> b!1171929 (= lt!527979 (array!75752 (store (arr!36525 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37061 _keys!1208)))))

(declare-fun mapIsEmpty!46028 () Bool)

(declare-fun mapRes!46028 () Bool)

(assert (=> mapIsEmpty!46028 mapRes!46028))

(declare-fun b!1171930 () Bool)

(declare-fun e!666110 () Bool)

(assert (=> b!1171930 (= e!666114 (not e!666110))))

(declare-fun res!778017 () Bool)

(assert (=> b!1171930 (=> res!778017 e!666110)))

(assert (=> b!1171930 (= res!778017 (bvsgt from!1455 i!673))))

(assert (=> b!1171930 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!527991 () Unit!38648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75751 (_ BitVec 64) (_ BitVec 32)) Unit!38648)

(assert (=> b!1171930 (= lt!527991 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1171931 () Bool)

(declare-fun e!666118 () Bool)

(declare-fun tp_is_empty!29467 () Bool)

(assert (=> b!1171931 (= e!666118 tp_is_empty!29467)))

(declare-fun b!1171932 () Bool)

(declare-fun e!666119 () Bool)

(assert (=> b!1171932 (= e!666119 tp_is_empty!29467)))

(declare-fun b!1171933 () Bool)

(declare-fun res!778014 () Bool)

(assert (=> b!1171933 (=> (not res!778014) (not e!666115))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44417 0))(
  ( (V!44418 (val!14790 Int)) )
))
(declare-datatypes ((ValueCell!14024 0))(
  ( (ValueCellFull!14024 (v!17428 V!44417)) (EmptyCell!14024) )
))
(declare-datatypes ((array!75753 0))(
  ( (array!75754 (arr!36526 (Array (_ BitVec 32) ValueCell!14024)) (size!37062 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75753)

(assert (=> b!1171933 (= res!778014 (and (= (size!37062 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37061 _keys!1208) (size!37062 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!46028 () Bool)

(declare-fun tp!87524 () Bool)

(assert (=> mapNonEmpty!46028 (= mapRes!46028 (and tp!87524 e!666118))))

(declare-fun mapValue!46028 () ValueCell!14024)

(declare-fun mapKey!46028 () (_ BitVec 32))

(declare-fun mapRest!46028 () (Array (_ BitVec 32) ValueCell!14024))

(assert (=> mapNonEmpty!46028 (= (arr!36526 _values!996) (store mapRest!46028 mapKey!46028 mapValue!46028))))

(declare-fun e!666117 () Bool)

(declare-fun b!1171934 () Bool)

(assert (=> b!1171934 (= e!666117 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1171935 () Bool)

(declare-fun res!778020 () Bool)

(assert (=> b!1171935 (=> (not res!778020) (not e!666115))))

(assert (=> b!1171935 (= res!778020 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25629))))

(declare-fun b!1171936 () Bool)

(assert (=> b!1171936 (= e!666121 true)))

(declare-fun lt!527984 () Bool)

(assert (=> b!1171936 (= lt!527984 (contains!6852 Nil!25629 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171937 () Bool)

(declare-fun res!778016 () Bool)

(assert (=> b!1171937 (=> (not res!778016) (not e!666115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171937 (= res!778016 (validMask!0 mask!1564))))

(declare-fun b!1171938 () Bool)

(declare-fun e!666116 () Bool)

(declare-fun e!666111 () Bool)

(assert (=> b!1171938 (= e!666116 e!666111)))

(declare-fun res!778018 () Bool)

(assert (=> b!1171938 (=> res!778018 e!666111)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171938 (= res!778018 (not (validKeyInArray!0 (select (arr!36525 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18896 0))(
  ( (tuple2!18897 (_1!9459 (_ BitVec 64)) (_2!9459 V!44417)) )
))
(declare-datatypes ((List!25633 0))(
  ( (Nil!25630) (Cons!25629 (h!26838 tuple2!18896) (t!37562 List!25633)) )
))
(declare-datatypes ((ListLongMap!16865 0))(
  ( (ListLongMap!16866 (toList!8448 List!25633)) )
))
(declare-fun lt!527989 () ListLongMap!16865)

(declare-fun lt!527987 () ListLongMap!16865)

(assert (=> b!1171938 (= lt!527989 lt!527987)))

(declare-fun lt!527985 () ListLongMap!16865)

(declare-fun -!1516 (ListLongMap!16865 (_ BitVec 64)) ListLongMap!16865)

(assert (=> b!1171938 (= lt!527987 (-!1516 lt!527985 k!934))))

(declare-fun zeroValue!944 () V!44417)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527986 () array!75753)

(declare-fun minValue!944 () V!44417)

(declare-fun getCurrentListMapNoExtraKeys!4912 (array!75751 array!75753 (_ BitVec 32) (_ BitVec 32) V!44417 V!44417 (_ BitVec 32) Int) ListLongMap!16865)

(assert (=> b!1171938 (= lt!527989 (getCurrentListMapNoExtraKeys!4912 lt!527979 lt!527986 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171938 (= lt!527985 (getCurrentListMapNoExtraKeys!4912 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527981 () Unit!38648)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!743 (array!75751 array!75753 (_ BitVec 32) (_ BitVec 32) V!44417 V!44417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38648)

(assert (=> b!1171938 (= lt!527981 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!743 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171939 () Bool)

(declare-fun e!666112 () Bool)

(assert (=> b!1171939 (= e!666112 e!666117)))

(declare-fun res!778007 () Bool)

(assert (=> b!1171939 (=> res!778007 e!666117)))

(assert (=> b!1171939 (= res!778007 (not (= (select (arr!36525 _keys!1208) from!1455) k!934)))))

(declare-fun b!1171940 () Bool)

(declare-fun res!778022 () Bool)

(assert (=> b!1171940 (=> (not res!778022) (not e!666115))))

(assert (=> b!1171940 (= res!778022 (= (select (arr!36525 _keys!1208) i!673) k!934))))

(declare-fun res!778023 () Bool)

(assert (=> start!99358 (=> (not res!778023) (not e!666115))))

(assert (=> start!99358 (= res!778023 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37061 _keys!1208))))))

(assert (=> start!99358 e!666115))

(assert (=> start!99358 tp_is_empty!29467))

(declare-fun array_inv!27910 (array!75751) Bool)

(assert (=> start!99358 (array_inv!27910 _keys!1208)))

(assert (=> start!99358 true))

(assert (=> start!99358 tp!87525))

(declare-fun e!666120 () Bool)

(declare-fun array_inv!27911 (array!75753) Bool)

(assert (=> start!99358 (and (array_inv!27911 _values!996) e!666120)))

(declare-fun b!1171927 () Bool)

(assert (=> b!1171927 (= e!666111 e!666109)))

(declare-fun res!778009 () Bool)

(assert (=> b!1171927 (=> res!778009 e!666109)))

(assert (=> b!1171927 (= res!778009 (not (= (select (arr!36525 _keys!1208) from!1455) k!934)))))

(assert (=> b!1171927 e!666112))

(declare-fun res!778012 () Bool)

(assert (=> b!1171927 (=> (not res!778012) (not e!666112))))

(declare-fun lt!527990 () V!44417)

(declare-fun lt!527980 () ListLongMap!16865)

(declare-fun +!3771 (ListLongMap!16865 tuple2!18896) ListLongMap!16865)

(declare-fun get!18631 (ValueCell!14024 V!44417) V!44417)

(assert (=> b!1171927 (= res!778012 (= lt!527980 (+!3771 lt!527987 (tuple2!18897 (select (arr!36525 _keys!1208) from!1455) (get!18631 (select (arr!36526 _values!996) from!1455) lt!527990)))))))

(declare-fun b!1171941 () Bool)

(declare-fun res!778013 () Bool)

(assert (=> b!1171941 (=> (not res!778013) (not e!666114))))

(assert (=> b!1171941 (= res!778013 (arrayNoDuplicates!0 lt!527979 #b00000000000000000000000000000000 Nil!25629))))

(declare-fun b!1171942 () Bool)

(assert (=> b!1171942 (= e!666110 e!666116)))

(declare-fun res!778021 () Bool)

(assert (=> b!1171942 (=> res!778021 e!666116)))

(assert (=> b!1171942 (= res!778021 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1171942 (= lt!527980 (getCurrentListMapNoExtraKeys!4912 lt!527979 lt!527986 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1171942 (= lt!527986 (array!75754 (store (arr!36526 _values!996) i!673 (ValueCellFull!14024 lt!527990)) (size!37062 _values!996)))))

(declare-fun dynLambda!2884 (Int (_ BitVec 64)) V!44417)

(assert (=> b!1171942 (= lt!527990 (dynLambda!2884 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527983 () ListLongMap!16865)

(assert (=> b!1171942 (= lt!527983 (getCurrentListMapNoExtraKeys!4912 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171943 () Bool)

(assert (=> b!1171943 (= e!666120 (and e!666119 mapRes!46028))))

(declare-fun condMapEmpty!46028 () Bool)

(declare-fun mapDefault!46028 () ValueCell!14024)

