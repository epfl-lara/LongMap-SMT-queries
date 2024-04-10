; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99334 () Bool)

(assert start!99334)

(declare-fun b_free!24913 () Bool)

(declare-fun b_next!24913 () Bool)

(assert (=> start!99334 (= b_free!24913 (not b_next!24913))))

(declare-fun tp!87452 () Bool)

(declare-fun b_and!40693 () Bool)

(assert (=> start!99334 (= tp!87452 b_and!40693)))

(declare-fun res!777327 () Bool)

(declare-fun e!665646 () Bool)

(assert (=> start!99334 (=> (not res!777327) (not e!665646))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75705 0))(
  ( (array!75706 (arr!36502 (Array (_ BitVec 32) (_ BitVec 64))) (size!37038 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75705)

(assert (=> start!99334 (= res!777327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37038 _keys!1208))))))

(assert (=> start!99334 e!665646))

(declare-fun tp_is_empty!29443 () Bool)

(assert (=> start!99334 tp_is_empty!29443))

(declare-fun array_inv!27898 (array!75705) Bool)

(assert (=> start!99334 (array_inv!27898 _keys!1208)))

(assert (=> start!99334 true))

(assert (=> start!99334 tp!87452))

(declare-datatypes ((V!44385 0))(
  ( (V!44386 (val!14778 Int)) )
))
(declare-datatypes ((ValueCell!14012 0))(
  ( (ValueCellFull!14012 (v!17416 V!44385)) (EmptyCell!14012) )
))
(declare-datatypes ((array!75707 0))(
  ( (array!75708 (arr!36503 (Array (_ BitVec 32) ValueCell!14012)) (size!37039 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75707)

(declare-fun e!665648 () Bool)

(declare-fun array_inv!27899 (array!75707) Bool)

(assert (=> start!99334 (and (array_inv!27899 _values!996) e!665648)))

(declare-fun b!1171107 () Bool)

(declare-fun res!777332 () Bool)

(declare-fun e!665644 () Bool)

(assert (=> b!1171107 (=> res!777332 e!665644)))

(declare-datatypes ((List!25612 0))(
  ( (Nil!25609) (Cons!25608 (h!26817 (_ BitVec 64)) (t!37517 List!25612)) )
))
(declare-fun contains!6844 (List!25612 (_ BitVec 64)) Bool)

(assert (=> b!1171107 (= res!777332 (contains!6844 Nil!25609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171108 () Bool)

(declare-fun res!777337 () Bool)

(assert (=> b!1171108 (=> (not res!777337) (not e!665646))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171108 (= res!777337 (validKeyInArray!0 k!934))))

(declare-fun b!1171109 () Bool)

(declare-fun e!665641 () Bool)

(assert (=> b!1171109 (= e!665646 e!665641)))

(declare-fun res!777322 () Bool)

(assert (=> b!1171109 (=> (not res!777322) (not e!665641))))

(declare-fun lt!527514 () array!75705)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75705 (_ BitVec 32)) Bool)

(assert (=> b!1171109 (= res!777322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527514 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171109 (= lt!527514 (array!75706 (store (arr!36502 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37038 _keys!1208)))))

(declare-fun b!1171110 () Bool)

(declare-fun e!665642 () Bool)

(assert (=> b!1171110 (= e!665641 (not e!665642))))

(declare-fun res!777324 () Bool)

(assert (=> b!1171110 (=> res!777324 e!665642)))

(assert (=> b!1171110 (= res!777324 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171110 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38630 0))(
  ( (Unit!38631) )
))
(declare-fun lt!527519 () Unit!38630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75705 (_ BitVec 64) (_ BitVec 32)) Unit!38630)

(assert (=> b!1171110 (= lt!527519 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1171111 () Bool)

(declare-fun e!665649 () Bool)

(assert (=> b!1171111 (= e!665649 e!665644)))

(declare-fun res!777338 () Bool)

(assert (=> b!1171111 (=> res!777338 e!665644)))

(assert (=> b!1171111 (= res!777338 (or (bvsge (size!37038 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37038 _keys!1208)) (bvsge from!1455 (size!37038 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!75705 (_ BitVec 32) List!25612) Bool)

(assert (=> b!1171111 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25609)))

(declare-fun lt!527515 () Unit!38630)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75705 (_ BitVec 32) (_ BitVec 32)) Unit!38630)

(assert (=> b!1171111 (= lt!527515 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1171111 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527521 () Unit!38630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75705 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38630)

(assert (=> b!1171111 (= lt!527521 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171112 () Bool)

(declare-fun res!777331 () Bool)

(assert (=> b!1171112 (=> (not res!777331) (not e!665646))))

(assert (=> b!1171112 (= res!777331 (= (select (arr!36502 _keys!1208) i!673) k!934))))

(declare-fun b!1171113 () Bool)

(declare-fun res!777330 () Bool)

(assert (=> b!1171113 (=> res!777330 e!665644)))

(declare-fun noDuplicate!1606 (List!25612) Bool)

(assert (=> b!1171113 (= res!777330 (not (noDuplicate!1606 Nil!25609)))))

(declare-fun b!1171114 () Bool)

(declare-fun e!665651 () Bool)

(assert (=> b!1171114 (= e!665651 tp_is_empty!29443)))

(declare-fun b!1171115 () Bool)

(declare-fun e!665643 () Bool)

(assert (=> b!1171115 (= e!665643 e!665649)))

(declare-fun res!777329 () Bool)

(assert (=> b!1171115 (=> res!777329 e!665649)))

(assert (=> b!1171115 (= res!777329 (not (= (select (arr!36502 _keys!1208) from!1455) k!934)))))

(declare-fun e!665645 () Bool)

(assert (=> b!1171115 e!665645))

(declare-fun res!777335 () Bool)

(assert (=> b!1171115 (=> (not res!777335) (not e!665645))))

(declare-datatypes ((tuple2!18876 0))(
  ( (tuple2!18877 (_1!9449 (_ BitVec 64)) (_2!9449 V!44385)) )
))
(declare-datatypes ((List!25613 0))(
  ( (Nil!25610) (Cons!25609 (h!26818 tuple2!18876) (t!37518 List!25613)) )
))
(declare-datatypes ((ListLongMap!16845 0))(
  ( (ListLongMap!16846 (toList!8438 List!25613)) )
))
(declare-fun lt!527512 () ListLongMap!16845)

(declare-fun lt!527517 () V!44385)

(declare-fun lt!527522 () ListLongMap!16845)

(declare-fun +!3765 (ListLongMap!16845 tuple2!18876) ListLongMap!16845)

(declare-fun get!18617 (ValueCell!14012 V!44385) V!44385)

(assert (=> b!1171115 (= res!777335 (= lt!527512 (+!3765 lt!527522 (tuple2!18877 (select (arr!36502 _keys!1208) from!1455) (get!18617 (select (arr!36503 _values!996) from!1455) lt!527517)))))))

(declare-fun b!1171116 () Bool)

(declare-fun res!777340 () Bool)

(assert (=> b!1171116 (=> (not res!777340) (not e!665646))))

(assert (=> b!1171116 (= res!777340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45992 () Bool)

(declare-fun mapRes!45992 () Bool)

(assert (=> mapIsEmpty!45992 mapRes!45992))

(declare-fun b!1171117 () Bool)

(declare-fun res!777334 () Bool)

(assert (=> b!1171117 (=> (not res!777334) (not e!665646))))

(assert (=> b!1171117 (= res!777334 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37038 _keys!1208))))))

(declare-fun b!1171118 () Bool)

(declare-fun res!777339 () Bool)

(assert (=> b!1171118 (=> (not res!777339) (not e!665646))))

(assert (=> b!1171118 (= res!777339 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25609))))

(declare-fun b!1171119 () Bool)

(declare-fun res!777323 () Bool)

(assert (=> b!1171119 (=> (not res!777323) (not e!665646))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1171119 (= res!777323 (and (= (size!37039 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37038 _keys!1208) (size!37039 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171120 () Bool)

(declare-fun res!777333 () Bool)

(assert (=> b!1171120 (=> (not res!777333) (not e!665641))))

(assert (=> b!1171120 (= res!777333 (arrayNoDuplicates!0 lt!527514 #b00000000000000000000000000000000 Nil!25609))))

(declare-fun e!665647 () Bool)

(declare-fun b!1171121 () Bool)

(assert (=> b!1171121 (= e!665647 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1171122 () Bool)

(declare-fun res!777326 () Bool)

(assert (=> b!1171122 (=> (not res!777326) (not e!665646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171122 (= res!777326 (validMask!0 mask!1564))))

(declare-fun b!1171123 () Bool)

(declare-fun e!665650 () Bool)

(assert (=> b!1171123 (= e!665650 e!665643)))

(declare-fun res!777328 () Bool)

(assert (=> b!1171123 (=> res!777328 e!665643)))

(assert (=> b!1171123 (= res!777328 (not (validKeyInArray!0 (select (arr!36502 _keys!1208) from!1455))))))

(declare-fun lt!527520 () ListLongMap!16845)

(assert (=> b!1171123 (= lt!527520 lt!527522)))

(declare-fun lt!527518 () ListLongMap!16845)

(declare-fun -!1508 (ListLongMap!16845 (_ BitVec 64)) ListLongMap!16845)

(assert (=> b!1171123 (= lt!527522 (-!1508 lt!527518 k!934))))

(declare-fun zeroValue!944 () V!44385)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527523 () array!75707)

(declare-fun minValue!944 () V!44385)

(declare-fun getCurrentListMapNoExtraKeys!4902 (array!75705 array!75707 (_ BitVec 32) (_ BitVec 32) V!44385 V!44385 (_ BitVec 32) Int) ListLongMap!16845)

(assert (=> b!1171123 (= lt!527520 (getCurrentListMapNoExtraKeys!4902 lt!527514 lt!527523 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171123 (= lt!527518 (getCurrentListMapNoExtraKeys!4902 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527513 () Unit!38630)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!735 (array!75705 array!75707 (_ BitVec 32) (_ BitVec 32) V!44385 V!44385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38630)

(assert (=> b!1171123 (= lt!527513 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!735 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45992 () Bool)

(declare-fun tp!87453 () Bool)

(declare-fun e!665652 () Bool)

(assert (=> mapNonEmpty!45992 (= mapRes!45992 (and tp!87453 e!665652))))

(declare-fun mapValue!45992 () ValueCell!14012)

(declare-fun mapKey!45992 () (_ BitVec 32))

(declare-fun mapRest!45992 () (Array (_ BitVec 32) ValueCell!14012))

(assert (=> mapNonEmpty!45992 (= (arr!36503 _values!996) (store mapRest!45992 mapKey!45992 mapValue!45992))))

(declare-fun b!1171124 () Bool)

(assert (=> b!1171124 (= e!665645 e!665647)))

(declare-fun res!777336 () Bool)

(assert (=> b!1171124 (=> res!777336 e!665647)))

(assert (=> b!1171124 (= res!777336 (not (= (select (arr!36502 _keys!1208) from!1455) k!934)))))

(declare-fun b!1171125 () Bool)

(assert (=> b!1171125 (= e!665648 (and e!665651 mapRes!45992))))

(declare-fun condMapEmpty!45992 () Bool)

(declare-fun mapDefault!45992 () ValueCell!14012)

