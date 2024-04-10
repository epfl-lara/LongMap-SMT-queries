; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99562 () Bool)

(assert start!99562)

(declare-fun b_free!25141 () Bool)

(declare-fun b_next!25141 () Bool)

(assert (=> start!99562 (= b_free!25141 (not b_next!25141))))

(declare-fun tp!88136 () Bool)

(declare-fun b_and!41149 () Bool)

(assert (=> start!99562 (= tp!88136 b_and!41149)))

(declare-fun b!1178425 () Bool)

(declare-fun e!669931 () Bool)

(declare-fun tp_is_empty!29671 () Bool)

(assert (=> b!1178425 (= e!669931 tp_is_empty!29671)))

(declare-datatypes ((V!44689 0))(
  ( (V!44690 (val!14892 Int)) )
))
(declare-datatypes ((tuple2!19054 0))(
  ( (tuple2!19055 (_1!9538 (_ BitVec 64)) (_2!9538 V!44689)) )
))
(declare-fun lt!532345 () tuple2!19054)

(declare-fun b!1178426 () Bool)

(declare-datatypes ((List!25792 0))(
  ( (Nil!25789) (Cons!25788 (h!26997 tuple2!19054) (t!37925 List!25792)) )
))
(declare-datatypes ((ListLongMap!17023 0))(
  ( (ListLongMap!17024 (toList!8527 List!25792)) )
))
(declare-fun lt!532339 () ListLongMap!17023)

(declare-fun lt!532349 () ListLongMap!17023)

(declare-fun e!669935 () Bool)

(declare-fun +!3841 (ListLongMap!17023 tuple2!19054) ListLongMap!17023)

(assert (=> b!1178426 (= e!669935 (= lt!532349 (+!3841 lt!532339 lt!532345)))))

(declare-fun b!1178427 () Bool)

(declare-fun res!782857 () Bool)

(declare-fun e!669936 () Bool)

(assert (=> b!1178427 (=> (not res!782857) (not e!669936))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76145 0))(
  ( (array!76146 (arr!36722 (Array (_ BitVec 32) (_ BitVec 64))) (size!37258 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76145)

(assert (=> b!1178427 (= res!782857 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37258 _keys!1208))))))

(declare-fun res!782853 () Bool)

(assert (=> start!99562 (=> (not res!782853) (not e!669936))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99562 (= res!782853 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37258 _keys!1208))))))

(assert (=> start!99562 e!669936))

(assert (=> start!99562 tp_is_empty!29671))

(declare-fun array_inv!28040 (array!76145) Bool)

(assert (=> start!99562 (array_inv!28040 _keys!1208)))

(assert (=> start!99562 true))

(assert (=> start!99562 tp!88136))

(declare-datatypes ((ValueCell!14126 0))(
  ( (ValueCellFull!14126 (v!17530 V!44689)) (EmptyCell!14126) )
))
(declare-datatypes ((array!76147 0))(
  ( (array!76148 (arr!36723 (Array (_ BitVec 32) ValueCell!14126)) (size!37259 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76147)

(declare-fun e!669937 () Bool)

(declare-fun array_inv!28041 (array!76147) Bool)

(assert (=> start!99562 (and (array_inv!28041 _values!996) e!669937)))

(declare-fun b!1178428 () Bool)

(declare-fun res!782844 () Bool)

(assert (=> b!1178428 (=> (not res!782844) (not e!669936))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1178428 (= res!782844 (= (select (arr!36722 _keys!1208) i!673) k!934))))

(declare-fun b!1178429 () Bool)

(declare-fun e!669926 () Bool)

(declare-fun e!669925 () Bool)

(assert (=> b!1178429 (= e!669926 (not e!669925))))

(declare-fun res!782850 () Bool)

(assert (=> b!1178429 (=> res!782850 e!669925)))

(assert (=> b!1178429 (= res!782850 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178429 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38922 0))(
  ( (Unit!38923) )
))
(declare-fun lt!532341 () Unit!38922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76145 (_ BitVec 64) (_ BitVec 32)) Unit!38922)

(assert (=> b!1178429 (= lt!532341 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapIsEmpty!46334 () Bool)

(declare-fun mapRes!46334 () Bool)

(assert (=> mapIsEmpty!46334 mapRes!46334))

(declare-fun b!1178430 () Bool)

(declare-fun e!669932 () Unit!38922)

(declare-fun Unit!38924 () Unit!38922)

(assert (=> b!1178430 (= e!669932 Unit!38924)))

(declare-fun lt!532343 () Unit!38922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38922)

(assert (=> b!1178430 (= lt!532343 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178430 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532348 () Unit!38922)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76145 (_ BitVec 32) (_ BitVec 32)) Unit!38922)

(assert (=> b!1178430 (= lt!532348 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25793 0))(
  ( (Nil!25790) (Cons!25789 (h!26998 (_ BitVec 64)) (t!37926 List!25793)) )
))
(declare-fun arrayNoDuplicates!0 (array!76145 (_ BitVec 32) List!25793) Bool)

(assert (=> b!1178430 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25790)))

(declare-fun lt!532342 () Unit!38922)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76145 (_ BitVec 64) (_ BitVec 32) List!25793) Unit!38922)

(assert (=> b!1178430 (= lt!532342 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25790))))

(assert (=> b!1178430 false))

(declare-fun b!1178431 () Bool)

(declare-fun e!669934 () Bool)

(assert (=> b!1178431 (= e!669934 tp_is_empty!29671)))

(declare-fun b!1178432 () Bool)

(declare-fun res!782847 () Bool)

(assert (=> b!1178432 (=> (not res!782847) (not e!669936))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1178432 (= res!782847 (and (= (size!37259 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37258 _keys!1208) (size!37259 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178433 () Bool)

(declare-fun e!669927 () Bool)

(declare-fun e!669929 () Bool)

(assert (=> b!1178433 (= e!669927 e!669929)))

(declare-fun res!782855 () Bool)

(assert (=> b!1178433 (=> res!782855 e!669929)))

(assert (=> b!1178433 (= res!782855 (not (= (select (arr!36722 _keys!1208) from!1455) k!934)))))

(declare-fun b!1178434 () Bool)

(declare-fun res!782842 () Bool)

(assert (=> b!1178434 (=> (not res!782842) (not e!669926))))

(declare-fun lt!532340 () array!76145)

(assert (=> b!1178434 (= res!782842 (arrayNoDuplicates!0 lt!532340 #b00000000000000000000000000000000 Nil!25790))))

(declare-fun b!1178435 () Bool)

(declare-fun e!669933 () Bool)

(declare-fun e!669930 () Bool)

(assert (=> b!1178435 (= e!669933 e!669930)))

(declare-fun res!782848 () Bool)

(assert (=> b!1178435 (=> res!782848 e!669930)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178435 (= res!782848 (not (validKeyInArray!0 (select (arr!36722 _keys!1208) from!1455))))))

(declare-fun lt!532350 () ListLongMap!17023)

(declare-fun lt!532351 () ListLongMap!17023)

(assert (=> b!1178435 (= lt!532350 lt!532351)))

(declare-fun -!1574 (ListLongMap!17023 (_ BitVec 64)) ListLongMap!17023)

(assert (=> b!1178435 (= lt!532351 (-!1574 lt!532339 k!934))))

(declare-fun zeroValue!944 () V!44689)

(declare-fun lt!532353 () array!76147)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44689)

(declare-fun getCurrentListMapNoExtraKeys!4983 (array!76145 array!76147 (_ BitVec 32) (_ BitVec 32) V!44689 V!44689 (_ BitVec 32) Int) ListLongMap!17023)

(assert (=> b!1178435 (= lt!532350 (getCurrentListMapNoExtraKeys!4983 lt!532340 lt!532353 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178435 (= lt!532339 (getCurrentListMapNoExtraKeys!4983 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532347 () Unit!38922)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!801 (array!76145 array!76147 (_ BitVec 32) (_ BitVec 32) V!44689 V!44689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38922)

(assert (=> b!1178435 (= lt!532347 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!801 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178436 () Bool)

(assert (=> b!1178436 (= e!669930 true)))

(assert (=> b!1178436 e!669935))

(declare-fun res!782849 () Bool)

(assert (=> b!1178436 (=> (not res!782849) (not e!669935))))

(assert (=> b!1178436 (= res!782849 (not (= (select (arr!36722 _keys!1208) from!1455) k!934)))))

(declare-fun lt!532352 () Unit!38922)

(assert (=> b!1178436 (= lt!532352 e!669932)))

(declare-fun c!116835 () Bool)

(assert (=> b!1178436 (= c!116835 (= (select (arr!36722 _keys!1208) from!1455) k!934))))

(assert (=> b!1178436 e!669927))

(declare-fun res!782845 () Bool)

(assert (=> b!1178436 (=> (not res!782845) (not e!669927))))

(declare-fun lt!532344 () ListLongMap!17023)

(assert (=> b!1178436 (= res!782845 (= lt!532344 (+!3841 lt!532351 lt!532345)))))

(declare-fun lt!532346 () V!44689)

(declare-fun get!18769 (ValueCell!14126 V!44689) V!44689)

(assert (=> b!1178436 (= lt!532345 (tuple2!19055 (select (arr!36722 _keys!1208) from!1455) (get!18769 (select (arr!36723 _values!996) from!1455) lt!532346)))))

(declare-fun b!1178437 () Bool)

(declare-fun res!782851 () Bool)

(assert (=> b!1178437 (=> (not res!782851) (not e!669936))))

(assert (=> b!1178437 (= res!782851 (validKeyInArray!0 k!934))))

(declare-fun b!1178438 () Bool)

(declare-fun res!782854 () Bool)

(assert (=> b!1178438 (=> (not res!782854) (not e!669936))))

(assert (=> b!1178438 (= res!782854 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25790))))

(declare-fun b!1178439 () Bool)

(assert (=> b!1178439 (= e!669936 e!669926)))

(declare-fun res!782843 () Bool)

(assert (=> b!1178439 (=> (not res!782843) (not e!669926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76145 (_ BitVec 32)) Bool)

(assert (=> b!1178439 (= res!782843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532340 mask!1564))))

(assert (=> b!1178439 (= lt!532340 (array!76146 (store (arr!36722 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37258 _keys!1208)))))

(declare-fun b!1178440 () Bool)

(declare-fun res!782846 () Bool)

(assert (=> b!1178440 (=> (not res!782846) (not e!669936))))

(assert (=> b!1178440 (= res!782846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46334 () Bool)

(declare-fun tp!88137 () Bool)

(assert (=> mapNonEmpty!46334 (= mapRes!46334 (and tp!88137 e!669934))))

(declare-fun mapRest!46334 () (Array (_ BitVec 32) ValueCell!14126))

(declare-fun mapKey!46334 () (_ BitVec 32))

(declare-fun mapValue!46334 () ValueCell!14126)

(assert (=> mapNonEmpty!46334 (= (arr!36723 _values!996) (store mapRest!46334 mapKey!46334 mapValue!46334))))

(declare-fun b!1178441 () Bool)

(assert (=> b!1178441 (= e!669929 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1178442 () Bool)

(assert (=> b!1178442 (= e!669925 e!669933)))

(declare-fun res!782856 () Bool)

(assert (=> b!1178442 (=> res!782856 e!669933)))

(assert (=> b!1178442 (= res!782856 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1178442 (= lt!532344 (getCurrentListMapNoExtraKeys!4983 lt!532340 lt!532353 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178442 (= lt!532353 (array!76148 (store (arr!36723 _values!996) i!673 (ValueCellFull!14126 lt!532346)) (size!37259 _values!996)))))

(declare-fun dynLambda!2945 (Int (_ BitVec 64)) V!44689)

(assert (=> b!1178442 (= lt!532346 (dynLambda!2945 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178442 (= lt!532349 (getCurrentListMapNoExtraKeys!4983 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178443 () Bool)

(declare-fun Unit!38925 () Unit!38922)

(assert (=> b!1178443 (= e!669932 Unit!38925)))

(declare-fun b!1178444 () Bool)

(assert (=> b!1178444 (= e!669937 (and e!669931 mapRes!46334))))

(declare-fun condMapEmpty!46334 () Bool)

(declare-fun mapDefault!46334 () ValueCell!14126)

