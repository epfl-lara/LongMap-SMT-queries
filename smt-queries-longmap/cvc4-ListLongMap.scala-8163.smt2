; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99848 () Bool)

(assert start!99848)

(declare-fun b_free!25427 () Bool)

(declare-fun b_next!25427 () Bool)

(assert (=> start!99848 (= b_free!25427 (not b_next!25427))))

(declare-fun tp!88995 () Bool)

(declare-fun b_and!41721 () Bool)

(assert (=> start!99848 (= tp!88995 b_and!41721)))

(declare-fun b!1187523 () Bool)

(declare-fun e!675220 () Bool)

(declare-fun tp_is_empty!29957 () Bool)

(assert (=> b!1187523 (= e!675220 tp_is_empty!29957)))

(declare-fun b!1187524 () Bool)

(declare-fun e!675225 () Bool)

(assert (=> b!1187524 (= e!675225 tp_is_empty!29957)))

(declare-fun b!1187525 () Bool)

(declare-fun e!675217 () Bool)

(declare-fun e!675218 () Bool)

(assert (=> b!1187525 (= e!675217 (not e!675218))))

(declare-fun res!789512 () Bool)

(assert (=> b!1187525 (=> res!789512 e!675218)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1187525 (= res!789512 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76709 0))(
  ( (array!76710 (arr!37004 (Array (_ BitVec 32) (_ BitVec 64))) (size!37540 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76709)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187525 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39380 0))(
  ( (Unit!39381) )
))
(declare-fun lt!539927 () Unit!39380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76709 (_ BitVec 64) (_ BitVec 32)) Unit!39380)

(assert (=> b!1187525 (= lt!539927 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187526 () Bool)

(declare-fun e!675216 () Bool)

(assert (=> b!1187526 (= e!675216 e!675217)))

(declare-fun res!789518 () Bool)

(assert (=> b!1187526 (=> (not res!789518) (not e!675217))))

(declare-fun lt!539937 () array!76709)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76709 (_ BitVec 32)) Bool)

(assert (=> b!1187526 (= res!789518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539937 mask!1564))))

(assert (=> b!1187526 (= lt!539937 (array!76710 (store (arr!37004 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37540 _keys!1208)))))

(declare-fun res!789519 () Bool)

(assert (=> start!99848 (=> (not res!789519) (not e!675216))))

(assert (=> start!99848 (= res!789519 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37540 _keys!1208))))))

(assert (=> start!99848 e!675216))

(assert (=> start!99848 tp_is_empty!29957))

(declare-fun array_inv!28234 (array!76709) Bool)

(assert (=> start!99848 (array_inv!28234 _keys!1208)))

(assert (=> start!99848 true))

(assert (=> start!99848 tp!88995))

(declare-datatypes ((V!45069 0))(
  ( (V!45070 (val!15035 Int)) )
))
(declare-datatypes ((ValueCell!14269 0))(
  ( (ValueCellFull!14269 (v!17673 V!45069)) (EmptyCell!14269) )
))
(declare-datatypes ((array!76711 0))(
  ( (array!76712 (arr!37005 (Array (_ BitVec 32) ValueCell!14269)) (size!37541 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76711)

(declare-fun e!675222 () Bool)

(declare-fun array_inv!28235 (array!76711) Bool)

(assert (=> start!99848 (and (array_inv!28235 _values!996) e!675222)))

(declare-fun b!1187527 () Bool)

(declare-fun e!675224 () Bool)

(assert (=> b!1187527 (= e!675218 e!675224)))

(declare-fun res!789521 () Bool)

(assert (=> b!1187527 (=> res!789521 e!675224)))

(assert (=> b!1187527 (= res!789521 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45069)

(declare-datatypes ((tuple2!19302 0))(
  ( (tuple2!19303 (_1!9662 (_ BitVec 64)) (_2!9662 V!45069)) )
))
(declare-datatypes ((List!26041 0))(
  ( (Nil!26038) (Cons!26037 (h!27246 tuple2!19302) (t!38460 List!26041)) )
))
(declare-datatypes ((ListLongMap!17271 0))(
  ( (ListLongMap!17272 (toList!8651 List!26041)) )
))
(declare-fun lt!539935 () ListLongMap!17271)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!539922 () array!76711)

(declare-fun minValue!944 () V!45069)

(declare-fun getCurrentListMapNoExtraKeys!5093 (array!76709 array!76711 (_ BitVec 32) (_ BitVec 32) V!45069 V!45069 (_ BitVec 32) Int) ListLongMap!17271)

(assert (=> b!1187527 (= lt!539935 (getCurrentListMapNoExtraKeys!5093 lt!539937 lt!539922 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!539940 () V!45069)

(assert (=> b!1187527 (= lt!539922 (array!76712 (store (arr!37005 _values!996) i!673 (ValueCellFull!14269 lt!539940)) (size!37541 _values!996)))))

(declare-fun dynLambda!3039 (Int (_ BitVec 64)) V!45069)

(assert (=> b!1187527 (= lt!539940 (dynLambda!3039 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!539929 () ListLongMap!17271)

(assert (=> b!1187527 (= lt!539929 (getCurrentListMapNoExtraKeys!5093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1187528 () Bool)

(declare-fun e!675223 () Unit!39380)

(declare-fun Unit!39382 () Unit!39380)

(assert (=> b!1187528 (= e!675223 Unit!39382)))

(declare-fun lt!539925 () Unit!39380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39380)

(assert (=> b!1187528 (= lt!539925 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187528 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539931 () Unit!39380)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76709 (_ BitVec 32) (_ BitVec 32)) Unit!39380)

(assert (=> b!1187528 (= lt!539931 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26042 0))(
  ( (Nil!26039) (Cons!26038 (h!27247 (_ BitVec 64)) (t!38461 List!26042)) )
))
(declare-fun arrayNoDuplicates!0 (array!76709 (_ BitVec 32) List!26042) Bool)

(assert (=> b!1187528 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26039)))

(declare-fun lt!539923 () Unit!39380)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76709 (_ BitVec 64) (_ BitVec 32) List!26042) Unit!39380)

(assert (=> b!1187528 (= lt!539923 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!26039))))

(assert (=> b!1187528 false))

(declare-fun b!1187529 () Bool)

(declare-fun res!789520 () Bool)

(assert (=> b!1187529 (=> (not res!789520) (not e!675216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187529 (= res!789520 (validMask!0 mask!1564))))

(declare-fun b!1187530 () Bool)

(declare-fun e!675215 () Bool)

(assert (=> b!1187530 (= e!675215 true)))

(declare-fun lt!539930 () ListLongMap!17271)

(declare-fun lt!539928 () ListLongMap!17271)

(declare-fun -!1682 (ListLongMap!17271 (_ BitVec 64)) ListLongMap!17271)

(assert (=> b!1187530 (= (-!1682 lt!539930 k!934) lt!539928)))

(declare-fun lt!539938 () ListLongMap!17271)

(declare-fun lt!539936 () Unit!39380)

(declare-fun lt!539933 () V!45069)

(declare-fun addRemoveCommutativeForDiffKeys!201 (ListLongMap!17271 (_ BitVec 64) V!45069 (_ BitVec 64)) Unit!39380)

(assert (=> b!1187530 (= lt!539936 (addRemoveCommutativeForDiffKeys!201 lt!539938 (select (arr!37004 _keys!1208) from!1455) lt!539933 k!934))))

(declare-fun lt!539934 () ListLongMap!17271)

(declare-fun lt!539932 () ListLongMap!17271)

(assert (=> b!1187530 (and (= lt!539929 lt!539930) (= lt!539932 lt!539934))))

(declare-fun lt!539939 () tuple2!19302)

(declare-fun +!3938 (ListLongMap!17271 tuple2!19302) ListLongMap!17271)

(assert (=> b!1187530 (= lt!539930 (+!3938 lt!539938 lt!539939))))

(assert (=> b!1187530 (not (= (select (arr!37004 _keys!1208) from!1455) k!934))))

(declare-fun lt!539924 () Unit!39380)

(assert (=> b!1187530 (= lt!539924 e!675223)))

(declare-fun c!117264 () Bool)

(assert (=> b!1187530 (= c!117264 (= (select (arr!37004 _keys!1208) from!1455) k!934))))

(declare-fun e!675219 () Bool)

(assert (=> b!1187530 e!675219))

(declare-fun res!789522 () Bool)

(assert (=> b!1187530 (=> (not res!789522) (not e!675219))))

(assert (=> b!1187530 (= res!789522 (= lt!539935 lt!539928))))

(assert (=> b!1187530 (= lt!539928 (+!3938 lt!539932 lt!539939))))

(assert (=> b!1187530 (= lt!539939 (tuple2!19303 (select (arr!37004 _keys!1208) from!1455) lt!539933))))

(declare-fun get!18953 (ValueCell!14269 V!45069) V!45069)

(assert (=> b!1187530 (= lt!539933 (get!18953 (select (arr!37005 _values!996) from!1455) lt!539940))))

(declare-fun b!1187531 () Bool)

(declare-fun e!675226 () Bool)

(assert (=> b!1187531 (= e!675219 e!675226)))

(declare-fun res!789513 () Bool)

(assert (=> b!1187531 (=> res!789513 e!675226)))

(assert (=> b!1187531 (= res!789513 (not (= (select (arr!37004 _keys!1208) from!1455) k!934)))))

(declare-fun b!1187532 () Bool)

(declare-fun Unit!39383 () Unit!39380)

(assert (=> b!1187532 (= e!675223 Unit!39383)))

(declare-fun b!1187533 () Bool)

(assert (=> b!1187533 (= e!675224 e!675215)))

(declare-fun res!789515 () Bool)

(assert (=> b!1187533 (=> res!789515 e!675215)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187533 (= res!789515 (not (validKeyInArray!0 (select (arr!37004 _keys!1208) from!1455))))))

(assert (=> b!1187533 (= lt!539934 lt!539932)))

(assert (=> b!1187533 (= lt!539932 (-!1682 lt!539938 k!934))))

(assert (=> b!1187533 (= lt!539934 (getCurrentListMapNoExtraKeys!5093 lt!539937 lt!539922 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187533 (= lt!539938 (getCurrentListMapNoExtraKeys!5093 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539926 () Unit!39380)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!893 (array!76709 array!76711 (_ BitVec 32) (_ BitVec 32) V!45069 V!45069 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39380)

(assert (=> b!1187533 (= lt!539926 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!893 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187534 () Bool)

(declare-fun res!789511 () Bool)

(assert (=> b!1187534 (=> (not res!789511) (not e!675216))))

(assert (=> b!1187534 (= res!789511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46763 () Bool)

(declare-fun mapRes!46763 () Bool)

(assert (=> mapIsEmpty!46763 mapRes!46763))

(declare-fun b!1187535 () Bool)

(assert (=> b!1187535 (= e!675226 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1187536 () Bool)

(declare-fun res!789517 () Bool)

(assert (=> b!1187536 (=> (not res!789517) (not e!675216))))

(assert (=> b!1187536 (= res!789517 (= (select (arr!37004 _keys!1208) i!673) k!934))))

(declare-fun b!1187537 () Bool)

(declare-fun res!789509 () Bool)

(assert (=> b!1187537 (=> (not res!789509) (not e!675216))))

(assert (=> b!1187537 (= res!789509 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26039))))

(declare-fun mapNonEmpty!46763 () Bool)

(declare-fun tp!88994 () Bool)

(assert (=> mapNonEmpty!46763 (= mapRes!46763 (and tp!88994 e!675220))))

(declare-fun mapValue!46763 () ValueCell!14269)

(declare-fun mapRest!46763 () (Array (_ BitVec 32) ValueCell!14269))

(declare-fun mapKey!46763 () (_ BitVec 32))

(assert (=> mapNonEmpty!46763 (= (arr!37005 _values!996) (store mapRest!46763 mapKey!46763 mapValue!46763))))

(declare-fun b!1187538 () Bool)

(declare-fun res!789510 () Bool)

(assert (=> b!1187538 (=> (not res!789510) (not e!675216))))

(assert (=> b!1187538 (= res!789510 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37540 _keys!1208))))))

(declare-fun b!1187539 () Bool)

(declare-fun res!789514 () Bool)

(assert (=> b!1187539 (=> (not res!789514) (not e!675216))))

(assert (=> b!1187539 (= res!789514 (and (= (size!37541 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37540 _keys!1208) (size!37541 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187540 () Bool)

(assert (=> b!1187540 (= e!675222 (and e!675225 mapRes!46763))))

(declare-fun condMapEmpty!46763 () Bool)

(declare-fun mapDefault!46763 () ValueCell!14269)

