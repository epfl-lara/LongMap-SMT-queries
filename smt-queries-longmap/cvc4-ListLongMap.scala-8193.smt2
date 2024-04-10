; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100028 () Bool)

(assert start!100028)

(declare-fun b_free!25607 () Bool)

(declare-fun b_next!25607 () Bool)

(assert (=> start!100028 (= b_free!25607 (not b_next!25607))))

(declare-fun tp!89535 () Bool)

(declare-fun b_and!42081 () Bool)

(assert (=> start!100028 (= tp!89535 b_and!42081)))

(declare-fun b!1191938 () Bool)

(declare-fun res!792860 () Bool)

(declare-fun e!677523 () Bool)

(assert (=> b!1191938 (=> (not res!792860) (not e!677523))))

(declare-datatypes ((array!77063 0))(
  ( (array!77064 (arr!37181 (Array (_ BitVec 32) (_ BitVec 64))) (size!37717 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77063)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45309 0))(
  ( (V!45310 (val!15125 Int)) )
))
(declare-datatypes ((ValueCell!14359 0))(
  ( (ValueCellFull!14359 (v!17763 V!45309)) (EmptyCell!14359) )
))
(declare-datatypes ((array!77065 0))(
  ( (array!77066 (arr!37182 (Array (_ BitVec 32) ValueCell!14359)) (size!37718 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77065)

(assert (=> b!1191938 (= res!792860 (and (= (size!37718 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37717 _keys!1208) (size!37718 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191939 () Bool)

(declare-fun e!677528 () Bool)

(assert (=> b!1191939 (= e!677528 true)))

(declare-fun zeroValue!944 () V!45309)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!542028 () array!77063)

(declare-fun minValue!944 () V!45309)

(declare-fun lt!542024 () array!77065)

(declare-datatypes ((tuple2!19442 0))(
  ( (tuple2!19443 (_1!9732 (_ BitVec 64)) (_2!9732 V!45309)) )
))
(declare-datatypes ((List!26185 0))(
  ( (Nil!26182) (Cons!26181 (h!27390 tuple2!19442) (t!38784 List!26185)) )
))
(declare-datatypes ((ListLongMap!17411 0))(
  ( (ListLongMap!17412 (toList!8721 List!26185)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5162 (array!77063 array!77065 (_ BitVec 32) (_ BitVec 32) V!45309 V!45309 (_ BitVec 32) Int) ListLongMap!17411)

(declare-fun -!1746 (ListLongMap!17411 (_ BitVec 64)) ListLongMap!17411)

(assert (=> b!1191939 (= (getCurrentListMapNoExtraKeys!5162 lt!542028 lt!542024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1746 (getCurrentListMapNoExtraKeys!5162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39540 0))(
  ( (Unit!39541) )
))
(declare-fun lt!542027 () Unit!39540)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!955 (array!77063 array!77065 (_ BitVec 32) (_ BitVec 32) V!45309 V!45309 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39540)

(assert (=> b!1191939 (= lt!542027 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!955 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191940 () Bool)

(declare-fun res!792864 () Bool)

(assert (=> b!1191940 (=> (not res!792864) (not e!677523))))

(assert (=> b!1191940 (= res!792864 (= (select (arr!37181 _keys!1208) i!673) k!934))))

(declare-fun b!1191941 () Bool)

(declare-fun res!792865 () Bool)

(assert (=> b!1191941 (=> (not res!792865) (not e!677523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191941 (= res!792865 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47033 () Bool)

(declare-fun mapRes!47033 () Bool)

(assert (=> mapIsEmpty!47033 mapRes!47033))

(declare-fun b!1191942 () Bool)

(declare-fun e!677527 () Bool)

(declare-fun tp_is_empty!30137 () Bool)

(assert (=> b!1191942 (= e!677527 tp_is_empty!30137)))

(declare-fun b!1191943 () Bool)

(declare-fun res!792861 () Bool)

(assert (=> b!1191943 (=> (not res!792861) (not e!677523))))

(declare-datatypes ((List!26186 0))(
  ( (Nil!26183) (Cons!26182 (h!27391 (_ BitVec 64)) (t!38785 List!26186)) )
))
(declare-fun arrayNoDuplicates!0 (array!77063 (_ BitVec 32) List!26186) Bool)

(assert (=> b!1191943 (= res!792861 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26183))))

(declare-fun mapNonEmpty!47033 () Bool)

(declare-fun tp!89534 () Bool)

(assert (=> mapNonEmpty!47033 (= mapRes!47033 (and tp!89534 e!677527))))

(declare-fun mapRest!47033 () (Array (_ BitVec 32) ValueCell!14359))

(declare-fun mapKey!47033 () (_ BitVec 32))

(declare-fun mapValue!47033 () ValueCell!14359)

(assert (=> mapNonEmpty!47033 (= (arr!37182 _values!996) (store mapRest!47033 mapKey!47033 mapValue!47033))))

(declare-fun b!1191944 () Bool)

(declare-fun e!677525 () Bool)

(assert (=> b!1191944 (= e!677523 e!677525)))

(declare-fun res!792871 () Bool)

(assert (=> b!1191944 (=> (not res!792871) (not e!677525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77063 (_ BitVec 32)) Bool)

(assert (=> b!1191944 (= res!792871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542028 mask!1564))))

(assert (=> b!1191944 (= lt!542028 (array!77064 (store (arr!37181 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37717 _keys!1208)))))

(declare-fun b!1191945 () Bool)

(declare-fun e!677524 () Bool)

(assert (=> b!1191945 (= e!677524 tp_is_empty!30137)))

(declare-fun b!1191946 () Bool)

(declare-fun res!792866 () Bool)

(assert (=> b!1191946 (=> (not res!792866) (not e!677525))))

(assert (=> b!1191946 (= res!792866 (arrayNoDuplicates!0 lt!542028 #b00000000000000000000000000000000 Nil!26183))))

(declare-fun b!1191947 () Bool)

(declare-fun e!677529 () Bool)

(assert (=> b!1191947 (= e!677529 e!677528)))

(declare-fun res!792862 () Bool)

(assert (=> b!1191947 (=> res!792862 e!677528)))

(assert (=> b!1191947 (= res!792862 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!542026 () ListLongMap!17411)

(assert (=> b!1191947 (= lt!542026 (getCurrentListMapNoExtraKeys!5162 lt!542028 lt!542024 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3095 (Int (_ BitVec 64)) V!45309)

(assert (=> b!1191947 (= lt!542024 (array!77066 (store (arr!37182 _values!996) i!673 (ValueCellFull!14359 (dynLambda!3095 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37718 _values!996)))))

(declare-fun lt!542023 () ListLongMap!17411)

(assert (=> b!1191947 (= lt!542023 (getCurrentListMapNoExtraKeys!5162 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191948 () Bool)

(declare-fun res!792863 () Bool)

(assert (=> b!1191948 (=> (not res!792863) (not e!677523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191948 (= res!792863 (validKeyInArray!0 k!934))))

(declare-fun b!1191949 () Bool)

(assert (=> b!1191949 (= e!677525 (not e!677529))))

(declare-fun res!792870 () Bool)

(assert (=> b!1191949 (=> res!792870 e!677529)))

(assert (=> b!1191949 (= res!792870 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191949 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!542025 () Unit!39540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77063 (_ BitVec 64) (_ BitVec 32)) Unit!39540)

(assert (=> b!1191949 (= lt!542025 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191950 () Bool)

(declare-fun res!792867 () Bool)

(assert (=> b!1191950 (=> (not res!792867) (not e!677523))))

(assert (=> b!1191950 (= res!792867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!792869 () Bool)

(assert (=> start!100028 (=> (not res!792869) (not e!677523))))

(assert (=> start!100028 (= res!792869 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37717 _keys!1208))))))

(assert (=> start!100028 e!677523))

(assert (=> start!100028 tp_is_empty!30137))

(declare-fun array_inv!28354 (array!77063) Bool)

(assert (=> start!100028 (array_inv!28354 _keys!1208)))

(assert (=> start!100028 true))

(assert (=> start!100028 tp!89535))

(declare-fun e!677530 () Bool)

(declare-fun array_inv!28355 (array!77065) Bool)

(assert (=> start!100028 (and (array_inv!28355 _values!996) e!677530)))

(declare-fun b!1191951 () Bool)

(declare-fun res!792868 () Bool)

(assert (=> b!1191951 (=> (not res!792868) (not e!677523))))

(assert (=> b!1191951 (= res!792868 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37717 _keys!1208))))))

(declare-fun b!1191952 () Bool)

(assert (=> b!1191952 (= e!677530 (and e!677524 mapRes!47033))))

(declare-fun condMapEmpty!47033 () Bool)

(declare-fun mapDefault!47033 () ValueCell!14359)

