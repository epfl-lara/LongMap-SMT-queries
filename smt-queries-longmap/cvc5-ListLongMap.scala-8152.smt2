; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99778 () Bool)

(assert start!99778)

(declare-fun b_free!25357 () Bool)

(declare-fun b_next!25357 () Bool)

(assert (=> start!99778 (= b_free!25357 (not b_next!25357))))

(declare-fun tp!88785 () Bool)

(declare-fun b_and!41581 () Bool)

(assert (=> start!99778 (= tp!88785 b_and!41581)))

(declare-fun b!1185354 () Bool)

(declare-fun e!673957 () Bool)

(declare-fun e!673955 () Bool)

(assert (=> b!1185354 (= e!673957 e!673955)))

(declare-fun res!787940 () Bool)

(assert (=> b!1185354 (=> res!787940 e!673955)))

(declare-datatypes ((array!76571 0))(
  ( (array!76572 (arr!36935 (Array (_ BitVec 32) (_ BitVec 64))) (size!37471 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76571)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185354 (= res!787940 (not (= (select (arr!36935 _keys!1208) from!1455) k!934)))))

(declare-fun b!1185355 () Bool)

(declare-fun e!673962 () Bool)

(declare-fun e!673963 () Bool)

(assert (=> b!1185355 (= e!673962 e!673963)))

(declare-fun res!787938 () Bool)

(assert (=> b!1185355 (=> res!787938 e!673963)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185355 (= res!787938 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44977 0))(
  ( (V!44978 (val!15000 Int)) )
))
(declare-datatypes ((tuple2!19240 0))(
  ( (tuple2!19241 (_1!9631 (_ BitVec 64)) (_2!9631 V!44977)) )
))
(declare-datatypes ((List!25980 0))(
  ( (Nil!25977) (Cons!25976 (h!27185 tuple2!19240) (t!38329 List!25980)) )
))
(declare-datatypes ((ListLongMap!17209 0))(
  ( (ListLongMap!17210 (toList!8620 List!25980)) )
))
(declare-fun lt!537930 () ListLongMap!17209)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14234 0))(
  ( (ValueCellFull!14234 (v!17638 V!44977)) (EmptyCell!14234) )
))
(declare-datatypes ((array!76573 0))(
  ( (array!76574 (arr!36936 (Array (_ BitVec 32) ValueCell!14234)) (size!37472 (_ BitVec 32))) )
))
(declare-fun lt!537932 () array!76573)

(declare-fun zeroValue!944 () V!44977)

(declare-fun lt!537927 () array!76571)

(declare-fun minValue!944 () V!44977)

(declare-fun getCurrentListMapNoExtraKeys!5066 (array!76571 array!76573 (_ BitVec 32) (_ BitVec 32) V!44977 V!44977 (_ BitVec 32) Int) ListLongMap!17209)

(assert (=> b!1185355 (= lt!537930 (getCurrentListMapNoExtraKeys!5066 lt!537927 lt!537932 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537939 () V!44977)

(declare-fun _values!996 () array!76573)

(assert (=> b!1185355 (= lt!537932 (array!76574 (store (arr!36936 _values!996) i!673 (ValueCellFull!14234 lt!537939)) (size!37472 _values!996)))))

(declare-fun dynLambda!3017 (Int (_ BitVec 64)) V!44977)

(assert (=> b!1185355 (= lt!537939 (dynLambda!3017 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537931 () ListLongMap!17209)

(assert (=> b!1185355 (= lt!537931 (getCurrentListMapNoExtraKeys!5066 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185356 () Bool)

(declare-fun res!787948 () Bool)

(declare-fun e!673961 () Bool)

(assert (=> b!1185356 (=> (not res!787948) (not e!673961))))

(declare-datatypes ((List!25981 0))(
  ( (Nil!25978) (Cons!25977 (h!27186 (_ BitVec 64)) (t!38330 List!25981)) )
))
(declare-fun arrayNoDuplicates!0 (array!76571 (_ BitVec 32) List!25981) Bool)

(assert (=> b!1185356 (= res!787948 (arrayNoDuplicates!0 lt!537927 #b00000000000000000000000000000000 Nil!25978))))

(declare-fun b!1185357 () Bool)

(declare-fun e!673966 () Bool)

(assert (=> b!1185357 (= e!673966 true)))

(declare-fun lt!537936 () ListLongMap!17209)

(declare-fun lt!537928 () ListLongMap!17209)

(declare-fun -!1655 (ListLongMap!17209 (_ BitVec 64)) ListLongMap!17209)

(assert (=> b!1185357 (= (-!1655 lt!537936 k!934) lt!537928)))

(declare-datatypes ((Unit!39264 0))(
  ( (Unit!39265) )
))
(declare-fun lt!537929 () Unit!39264)

(declare-fun lt!537933 () V!44977)

(declare-fun lt!537944 () ListLongMap!17209)

(declare-fun addRemoveCommutativeForDiffKeys!180 (ListLongMap!17209 (_ BitVec 64) V!44977 (_ BitVec 64)) Unit!39264)

(assert (=> b!1185357 (= lt!537929 (addRemoveCommutativeForDiffKeys!180 lt!537944 (select (arr!36935 _keys!1208) from!1455) lt!537933 k!934))))

(declare-fun lt!537943 () ListLongMap!17209)

(declare-fun lt!537935 () ListLongMap!17209)

(assert (=> b!1185357 (and (= lt!537931 lt!537936) (= lt!537935 lt!537943))))

(declare-fun lt!537940 () tuple2!19240)

(declare-fun +!3917 (ListLongMap!17209 tuple2!19240) ListLongMap!17209)

(assert (=> b!1185357 (= lt!537936 (+!3917 lt!537944 lt!537940))))

(assert (=> b!1185357 (not (= (select (arr!36935 _keys!1208) from!1455) k!934))))

(declare-fun lt!537938 () Unit!39264)

(declare-fun e!673964 () Unit!39264)

(assert (=> b!1185357 (= lt!537938 e!673964)))

(declare-fun c!117159 () Bool)

(assert (=> b!1185357 (= c!117159 (= (select (arr!36935 _keys!1208) from!1455) k!934))))

(assert (=> b!1185357 e!673957))

(declare-fun res!787936 () Bool)

(assert (=> b!1185357 (=> (not res!787936) (not e!673957))))

(assert (=> b!1185357 (= res!787936 (= lt!537930 lt!537928))))

(assert (=> b!1185357 (= lt!537928 (+!3917 lt!537935 lt!537940))))

(assert (=> b!1185357 (= lt!537940 (tuple2!19241 (select (arr!36935 _keys!1208) from!1455) lt!537933))))

(declare-fun get!18910 (ValueCell!14234 V!44977) V!44977)

(assert (=> b!1185357 (= lt!537933 (get!18910 (select (arr!36936 _values!996) from!1455) lt!537939))))

(declare-fun b!1185358 () Bool)

(declare-fun res!787946 () Bool)

(declare-fun e!673956 () Bool)

(assert (=> b!1185358 (=> (not res!787946) (not e!673956))))

(assert (=> b!1185358 (= res!787946 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25978))))

(declare-fun b!1185359 () Bool)

(declare-fun Unit!39266 () Unit!39264)

(assert (=> b!1185359 (= e!673964 Unit!39266)))

(declare-fun lt!537942 () Unit!39264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39264)

(assert (=> b!1185359 (= lt!537942 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185359 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537937 () Unit!39264)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76571 (_ BitVec 32) (_ BitVec 32)) Unit!39264)

(assert (=> b!1185359 (= lt!537937 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185359 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25978)))

(declare-fun lt!537934 () Unit!39264)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76571 (_ BitVec 64) (_ BitVec 32) List!25981) Unit!39264)

(assert (=> b!1185359 (= lt!537934 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25978))))

(assert (=> b!1185359 false))

(declare-fun b!1185360 () Bool)

(declare-fun Unit!39267 () Unit!39264)

(assert (=> b!1185360 (= e!673964 Unit!39267)))

(declare-fun b!1185361 () Bool)

(assert (=> b!1185361 (= e!673963 e!673966)))

(declare-fun res!787941 () Bool)

(assert (=> b!1185361 (=> res!787941 e!673966)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185361 (= res!787941 (not (validKeyInArray!0 (select (arr!36935 _keys!1208) from!1455))))))

(assert (=> b!1185361 (= lt!537943 lt!537935)))

(assert (=> b!1185361 (= lt!537935 (-!1655 lt!537944 k!934))))

(assert (=> b!1185361 (= lt!537943 (getCurrentListMapNoExtraKeys!5066 lt!537927 lt!537932 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185361 (= lt!537944 (getCurrentListMapNoExtraKeys!5066 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537945 () Unit!39264)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!871 (array!76571 array!76573 (_ BitVec 32) (_ BitVec 32) V!44977 V!44977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39264)

(assert (=> b!1185361 (= lt!537945 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!871 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185362 () Bool)

(declare-fun res!787934 () Bool)

(assert (=> b!1185362 (=> (not res!787934) (not e!673956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185362 (= res!787934 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!46658 () Bool)

(declare-fun mapRes!46658 () Bool)

(assert (=> mapIsEmpty!46658 mapRes!46658))

(declare-fun b!1185363 () Bool)

(assert (=> b!1185363 (= e!673961 (not e!673962))))

(declare-fun res!787945 () Bool)

(assert (=> b!1185363 (=> res!787945 e!673962)))

(assert (=> b!1185363 (= res!787945 (bvsgt from!1455 i!673))))

(assert (=> b!1185363 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!537941 () Unit!39264)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76571 (_ BitVec 64) (_ BitVec 32)) Unit!39264)

(assert (=> b!1185363 (= lt!537941 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185364 () Bool)

(declare-fun res!787944 () Bool)

(assert (=> b!1185364 (=> (not res!787944) (not e!673956))))

(assert (=> b!1185364 (= res!787944 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37471 _keys!1208))))))

(declare-fun b!1185365 () Bool)

(declare-fun res!787937 () Bool)

(assert (=> b!1185365 (=> (not res!787937) (not e!673956))))

(assert (=> b!1185365 (= res!787937 (validKeyInArray!0 k!934))))

(declare-fun b!1185366 () Bool)

(declare-fun res!787947 () Bool)

(assert (=> b!1185366 (=> (not res!787947) (not e!673956))))

(assert (=> b!1185366 (= res!787947 (and (= (size!37472 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37471 _keys!1208) (size!37472 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!787943 () Bool)

(assert (=> start!99778 (=> (not res!787943) (not e!673956))))

(assert (=> start!99778 (= res!787943 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37471 _keys!1208))))))

(assert (=> start!99778 e!673956))

(declare-fun tp_is_empty!29887 () Bool)

(assert (=> start!99778 tp_is_empty!29887))

(declare-fun array_inv!28188 (array!76571) Bool)

(assert (=> start!99778 (array_inv!28188 _keys!1208)))

(assert (=> start!99778 true))

(assert (=> start!99778 tp!88785))

(declare-fun e!673960 () Bool)

(declare-fun array_inv!28189 (array!76573) Bool)

(assert (=> start!99778 (and (array_inv!28189 _values!996) e!673960)))

(declare-fun b!1185353 () Bool)

(declare-fun res!787939 () Bool)

(assert (=> b!1185353 (=> (not res!787939) (not e!673956))))

(assert (=> b!1185353 (= res!787939 (= (select (arr!36935 _keys!1208) i!673) k!934))))

(declare-fun b!1185367 () Bool)

(assert (=> b!1185367 (= e!673956 e!673961)))

(declare-fun res!787935 () Bool)

(assert (=> b!1185367 (=> (not res!787935) (not e!673961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76571 (_ BitVec 32)) Bool)

(assert (=> b!1185367 (= res!787935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537927 mask!1564))))

(assert (=> b!1185367 (= lt!537927 (array!76572 (store (arr!36935 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37471 _keys!1208)))))

(declare-fun b!1185368 () Bool)

(declare-fun e!673965 () Bool)

(assert (=> b!1185368 (= e!673960 (and e!673965 mapRes!46658))))

(declare-fun condMapEmpty!46658 () Bool)

(declare-fun mapDefault!46658 () ValueCell!14234)

