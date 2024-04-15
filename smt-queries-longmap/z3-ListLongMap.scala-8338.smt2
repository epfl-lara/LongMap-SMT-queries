; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101476 () Bool)

(assert start!101476)

(declare-fun b_free!26299 () Bool)

(declare-fun b_next!26299 () Bool)

(assert (=> start!101476 (= b_free!26299 (not b_next!26299))))

(declare-fun tp!91931 () Bool)

(declare-fun b_and!43769 () Bool)

(assert (=> start!101476 (= tp!91931 b_and!43769)))

(declare-fun b!1219909 () Bool)

(declare-fun res!810344 () Bool)

(declare-fun e!692683 () Bool)

(assert (=> b!1219909 (=> (not res!810344) (not e!692683))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219909 (= res!810344 (validMask!0 mask!1564))))

(declare-fun b!1219910 () Bool)

(declare-fun e!692681 () Bool)

(declare-fun e!692676 () Bool)

(declare-fun mapRes!48391 () Bool)

(assert (=> b!1219910 (= e!692681 (and e!692676 mapRes!48391))))

(declare-fun condMapEmpty!48391 () Bool)

(declare-datatypes ((V!46465 0))(
  ( (V!46466 (val!15558 Int)) )
))
(declare-datatypes ((ValueCell!14792 0))(
  ( (ValueCellFull!14792 (v!18214 V!46465)) (EmptyCell!14792) )
))
(declare-datatypes ((array!78704 0))(
  ( (array!78705 (arr!37983 (Array (_ BitVec 32) ValueCell!14792)) (size!38521 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78704)

(declare-fun mapDefault!48391 () ValueCell!14792)

(assert (=> b!1219910 (= condMapEmpty!48391 (= (arr!37983 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14792)) mapDefault!48391)))))

(declare-fun mapIsEmpty!48391 () Bool)

(assert (=> mapIsEmpty!48391 mapRes!48391))

(declare-fun b!1219911 () Bool)

(declare-fun e!692675 () Bool)

(declare-fun e!692682 () Bool)

(assert (=> b!1219911 (= e!692675 e!692682)))

(declare-fun res!810336 () Bool)

(assert (=> b!1219911 (=> res!810336 e!692682)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!78706 0))(
  ( (array!78707 (arr!37984 (Array (_ BitVec 32) (_ BitVec 64))) (size!38522 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78706)

(assert (=> b!1219911 (= res!810336 (not (= (select (arr!37984 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692678 () Bool)

(assert (=> b!1219911 e!692678))

(declare-fun res!810339 () Bool)

(assert (=> b!1219911 (=> (not res!810339) (not e!692678))))

(declare-fun lt!554579 () V!46465)

(declare-datatypes ((tuple2!20108 0))(
  ( (tuple2!20109 (_1!10065 (_ BitVec 64)) (_2!10065 V!46465)) )
))
(declare-datatypes ((List!26888 0))(
  ( (Nil!26885) (Cons!26884 (h!28093 tuple2!20108) (t!40158 List!26888)) )
))
(declare-datatypes ((ListLongMap!18077 0))(
  ( (ListLongMap!18078 (toList!9054 List!26888)) )
))
(declare-fun lt!554585 () ListLongMap!18077)

(declare-fun lt!554575 () ListLongMap!18077)

(declare-fun +!4120 (ListLongMap!18077 tuple2!20108) ListLongMap!18077)

(declare-fun get!19387 (ValueCell!14792 V!46465) V!46465)

(assert (=> b!1219911 (= res!810339 (= lt!554575 (+!4120 lt!554585 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579)))))))

(declare-fun b!1219912 () Bool)

(declare-fun res!810338 () Bool)

(assert (=> b!1219912 (=> (not res!810338) (not e!692683))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1219912 (= res!810338 (and (= (size!38521 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38522 _keys!1208) (size!38521 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219913 () Bool)

(declare-fun e!692674 () Bool)

(declare-fun e!692677 () Bool)

(assert (=> b!1219913 (= e!692674 e!692677)))

(declare-fun res!810346 () Bool)

(assert (=> b!1219913 (=> res!810346 e!692677)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219913 (= res!810346 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46465)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46465)

(declare-fun lt!554581 () array!78704)

(declare-fun lt!554576 () array!78706)

(declare-fun getCurrentListMapNoExtraKeys!5491 (array!78706 array!78704 (_ BitVec 32) (_ BitVec 32) V!46465 V!46465 (_ BitVec 32) Int) ListLongMap!18077)

(assert (=> b!1219913 (= lt!554575 (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219913 (= lt!554581 (array!78705 (store (arr!37983 _values!996) i!673 (ValueCellFull!14792 lt!554579)) (size!38521 _values!996)))))

(declare-fun dynLambda!3340 (Int (_ BitVec 64)) V!46465)

(assert (=> b!1219913 (= lt!554579 (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554580 () ListLongMap!18077)

(assert (=> b!1219913 (= lt!554580 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219914 () Bool)

(declare-fun res!810345 () Bool)

(assert (=> b!1219914 (=> (not res!810345) (not e!692683))))

(assert (=> b!1219914 (= res!810345 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38522 _keys!1208))))))

(declare-fun b!1219915 () Bool)

(declare-fun tp_is_empty!31003 () Bool)

(assert (=> b!1219915 (= e!692676 tp_is_empty!31003)))

(declare-fun b!1219916 () Bool)

(declare-fun e!692679 () Bool)

(assert (=> b!1219916 (= e!692679 (not e!692674))))

(declare-fun res!810332 () Bool)

(assert (=> b!1219916 (=> res!810332 e!692674)))

(assert (=> b!1219916 (= res!810332 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219916 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40281 0))(
  ( (Unit!40282) )
))
(declare-fun lt!554582 () Unit!40281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78706 (_ BitVec 64) (_ BitVec 32)) Unit!40281)

(assert (=> b!1219916 (= lt!554582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219917 () Bool)

(declare-fun res!810335 () Bool)

(assert (=> b!1219917 (=> (not res!810335) (not e!692683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219917 (= res!810335 (validKeyInArray!0 k0!934))))

(declare-fun b!1219918 () Bool)

(assert (=> b!1219918 (= e!692682 (bvslt (size!38522 _keys!1208) #b01111111111111111111111111111111))))

(declare-datatypes ((List!26889 0))(
  ( (Nil!26886) (Cons!26885 (h!28094 (_ BitVec 64)) (t!40159 List!26889)) )
))
(declare-fun arrayNoDuplicates!0 (array!78706 (_ BitVec 32) List!26889) Bool)

(assert (=> b!1219918 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26886)))

(declare-fun lt!554583 () Unit!40281)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78706 (_ BitVec 32) (_ BitVec 32)) Unit!40281)

(assert (=> b!1219918 (= lt!554583 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1219918 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554584 () Unit!40281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78706 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40281)

(assert (=> b!1219918 (= lt!554584 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219919 () Bool)

(declare-fun e!692672 () Bool)

(assert (=> b!1219919 (= e!692678 e!692672)))

(declare-fun res!810340 () Bool)

(assert (=> b!1219919 (=> res!810340 e!692672)))

(assert (=> b!1219919 (= res!810340 (not (= (select (arr!37984 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219920 () Bool)

(declare-fun res!810341 () Bool)

(assert (=> b!1219920 (=> (not res!810341) (not e!692683))))

(assert (=> b!1219920 (= res!810341 (= (select (arr!37984 _keys!1208) i!673) k0!934))))

(declare-fun b!1219921 () Bool)

(assert (=> b!1219921 (= e!692683 e!692679)))

(declare-fun res!810334 () Bool)

(assert (=> b!1219921 (=> (not res!810334) (not e!692679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78706 (_ BitVec 32)) Bool)

(assert (=> b!1219921 (= res!810334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554576 mask!1564))))

(assert (=> b!1219921 (= lt!554576 (array!78707 (store (arr!37984 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38522 _keys!1208)))))

(declare-fun b!1219922 () Bool)

(declare-fun e!692680 () Bool)

(assert (=> b!1219922 (= e!692680 tp_is_empty!31003)))

(declare-fun res!810337 () Bool)

(assert (=> start!101476 (=> (not res!810337) (not e!692683))))

(assert (=> start!101476 (= res!810337 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38522 _keys!1208))))))

(assert (=> start!101476 e!692683))

(assert (=> start!101476 tp_is_empty!31003))

(declare-fun array_inv!29028 (array!78706) Bool)

(assert (=> start!101476 (array_inv!29028 _keys!1208)))

(assert (=> start!101476 true))

(assert (=> start!101476 tp!91931))

(declare-fun array_inv!29029 (array!78704) Bool)

(assert (=> start!101476 (and (array_inv!29029 _values!996) e!692681)))

(declare-fun mapNonEmpty!48391 () Bool)

(declare-fun tp!91930 () Bool)

(assert (=> mapNonEmpty!48391 (= mapRes!48391 (and tp!91930 e!692680))))

(declare-fun mapRest!48391 () (Array (_ BitVec 32) ValueCell!14792))

(declare-fun mapKey!48391 () (_ BitVec 32))

(declare-fun mapValue!48391 () ValueCell!14792)

(assert (=> mapNonEmpty!48391 (= (arr!37983 _values!996) (store mapRest!48391 mapKey!48391 mapValue!48391))))

(declare-fun b!1219923 () Bool)

(assert (=> b!1219923 (= e!692677 e!692675)))

(declare-fun res!810347 () Bool)

(assert (=> b!1219923 (=> res!810347 e!692675)))

(assert (=> b!1219923 (= res!810347 (not (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455))))))

(declare-fun lt!554577 () ListLongMap!18077)

(assert (=> b!1219923 (= lt!554577 lt!554585)))

(declare-fun lt!554574 () ListLongMap!18077)

(declare-fun -!1884 (ListLongMap!18077 (_ BitVec 64)) ListLongMap!18077)

(assert (=> b!1219923 (= lt!554585 (-!1884 lt!554574 k0!934))))

(assert (=> b!1219923 (= lt!554577 (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219923 (= lt!554574 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554578 () Unit!40281)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1119 (array!78706 array!78704 (_ BitVec 32) (_ BitVec 32) V!46465 V!46465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40281)

(assert (=> b!1219923 (= lt!554578 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219924 () Bool)

(declare-fun res!810342 () Bool)

(assert (=> b!1219924 (=> (not res!810342) (not e!692683))))

(assert (=> b!1219924 (= res!810342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219925 () Bool)

(declare-fun res!810343 () Bool)

(assert (=> b!1219925 (=> (not res!810343) (not e!692679))))

(assert (=> b!1219925 (= res!810343 (arrayNoDuplicates!0 lt!554576 #b00000000000000000000000000000000 Nil!26886))))

(declare-fun b!1219926 () Bool)

(declare-fun res!810333 () Bool)

(assert (=> b!1219926 (=> (not res!810333) (not e!692683))))

(assert (=> b!1219926 (= res!810333 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26886))))

(declare-fun b!1219927 () Bool)

(assert (=> b!1219927 (= e!692672 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!101476 res!810337) b!1219909))

(assert (= (and b!1219909 res!810344) b!1219912))

(assert (= (and b!1219912 res!810338) b!1219924))

(assert (= (and b!1219924 res!810342) b!1219926))

(assert (= (and b!1219926 res!810333) b!1219914))

(assert (= (and b!1219914 res!810345) b!1219917))

(assert (= (and b!1219917 res!810335) b!1219920))

(assert (= (and b!1219920 res!810341) b!1219921))

(assert (= (and b!1219921 res!810334) b!1219925))

(assert (= (and b!1219925 res!810343) b!1219916))

(assert (= (and b!1219916 (not res!810332)) b!1219913))

(assert (= (and b!1219913 (not res!810346)) b!1219923))

(assert (= (and b!1219923 (not res!810347)) b!1219911))

(assert (= (and b!1219911 res!810339) b!1219919))

(assert (= (and b!1219919 (not res!810340)) b!1219927))

(assert (= (and b!1219911 (not res!810336)) b!1219918))

(assert (= (and b!1219910 condMapEmpty!48391) mapIsEmpty!48391))

(assert (= (and b!1219910 (not condMapEmpty!48391)) mapNonEmpty!48391))

(get-info :version)

(assert (= (and mapNonEmpty!48391 ((_ is ValueCellFull!14792) mapValue!48391)) b!1219922))

(assert (= (and b!1219910 ((_ is ValueCellFull!14792) mapDefault!48391)) b!1219915))

(assert (= start!101476 b!1219910))

(declare-fun b_lambda!22117 () Bool)

(assert (=> (not b_lambda!22117) (not b!1219913)))

(declare-fun t!40157 () Bool)

(declare-fun tb!11091 () Bool)

(assert (=> (and start!101476 (= defaultEntry!1004 defaultEntry!1004) t!40157) tb!11091))

(declare-fun result!22795 () Bool)

(assert (=> tb!11091 (= result!22795 tp_is_empty!31003)))

(assert (=> b!1219913 t!40157))

(declare-fun b_and!43771 () Bool)

(assert (= b_and!43769 (and (=> t!40157 result!22795) b_and!43771)))

(declare-fun m!1124225 () Bool)

(assert (=> b!1219909 m!1124225))

(declare-fun m!1124227 () Bool)

(assert (=> b!1219913 m!1124227))

(declare-fun m!1124229 () Bool)

(assert (=> b!1219913 m!1124229))

(declare-fun m!1124231 () Bool)

(assert (=> b!1219913 m!1124231))

(declare-fun m!1124233 () Bool)

(assert (=> b!1219913 m!1124233))

(declare-fun m!1124235 () Bool)

(assert (=> b!1219919 m!1124235))

(declare-fun m!1124237 () Bool)

(assert (=> b!1219923 m!1124237))

(declare-fun m!1124239 () Bool)

(assert (=> b!1219923 m!1124239))

(declare-fun m!1124241 () Bool)

(assert (=> b!1219923 m!1124241))

(assert (=> b!1219923 m!1124235))

(declare-fun m!1124243 () Bool)

(assert (=> b!1219923 m!1124243))

(declare-fun m!1124245 () Bool)

(assert (=> b!1219923 m!1124245))

(assert (=> b!1219923 m!1124235))

(declare-fun m!1124247 () Bool)

(assert (=> b!1219917 m!1124247))

(declare-fun m!1124249 () Bool)

(assert (=> b!1219926 m!1124249))

(declare-fun m!1124251 () Bool)

(assert (=> b!1219918 m!1124251))

(declare-fun m!1124253 () Bool)

(assert (=> b!1219918 m!1124253))

(declare-fun m!1124255 () Bool)

(assert (=> b!1219918 m!1124255))

(declare-fun m!1124257 () Bool)

(assert (=> b!1219918 m!1124257))

(declare-fun m!1124259 () Bool)

(assert (=> b!1219924 m!1124259))

(assert (=> b!1219911 m!1124235))

(declare-fun m!1124261 () Bool)

(assert (=> b!1219911 m!1124261))

(assert (=> b!1219911 m!1124261))

(declare-fun m!1124263 () Bool)

(assert (=> b!1219911 m!1124263))

(declare-fun m!1124265 () Bool)

(assert (=> b!1219911 m!1124265))

(declare-fun m!1124267 () Bool)

(assert (=> start!101476 m!1124267))

(declare-fun m!1124269 () Bool)

(assert (=> start!101476 m!1124269))

(declare-fun m!1124271 () Bool)

(assert (=> mapNonEmpty!48391 m!1124271))

(declare-fun m!1124273 () Bool)

(assert (=> b!1219921 m!1124273))

(declare-fun m!1124275 () Bool)

(assert (=> b!1219921 m!1124275))

(declare-fun m!1124277 () Bool)

(assert (=> b!1219920 m!1124277))

(declare-fun m!1124279 () Bool)

(assert (=> b!1219916 m!1124279))

(declare-fun m!1124281 () Bool)

(assert (=> b!1219916 m!1124281))

(declare-fun m!1124283 () Bool)

(assert (=> b!1219927 m!1124283))

(declare-fun m!1124285 () Bool)

(assert (=> b!1219925 m!1124285))

(check-sat (not b!1219925) (not b!1219918) (not b!1219913) (not mapNonEmpty!48391) (not start!101476) (not b!1219911) (not b!1219927) (not b_next!26299) (not b!1219916) (not b!1219921) (not b!1219917) tp_is_empty!31003 (not b_lambda!22117) (not b!1219923) (not b!1219909) (not b!1219926) (not b!1219924) b_and!43771)
(check-sat b_and!43771 (not b_next!26299))
(get-model)

(declare-fun b_lambda!22123 () Bool)

(assert (= b_lambda!22117 (or (and start!101476 b_free!26299) b_lambda!22123)))

(check-sat (not b!1219925) (not b!1219918) (not b!1219913) (not mapNonEmpty!48391) (not start!101476) (not b!1219911) (not b!1219927) (not b_next!26299) (not b!1219916) (not b!1219921) (not b!1219917) tp_is_empty!31003 (not b!1219909) (not b!1219926) (not b!1219924) b_and!43771 (not b_lambda!22123) (not b!1219923))
(check-sat b_and!43771 (not b_next!26299))
(get-model)

(declare-fun d!133591 () Bool)

(assert (=> d!133591 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1219909 d!133591))

(declare-fun d!133593 () Bool)

(declare-fun res!810448 () Bool)

(declare-fun e!692760 () Bool)

(assert (=> d!133593 (=> res!810448 e!692760)))

(assert (=> d!133593 (= res!810448 (= (select (arr!37984 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133593 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!692760)))

(declare-fun b!1220052 () Bool)

(declare-fun e!692761 () Bool)

(assert (=> b!1220052 (= e!692760 e!692761)))

(declare-fun res!810449 () Bool)

(assert (=> b!1220052 (=> (not res!810449) (not e!692761))))

(assert (=> b!1220052 (= res!810449 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38522 _keys!1208)))))

(declare-fun b!1220053 () Bool)

(assert (=> b!1220053 (= e!692761 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133593 (not res!810448)) b!1220052))

(assert (= (and b!1220052 res!810449) b!1220053))

(declare-fun m!1124411 () Bool)

(assert (=> d!133593 m!1124411))

(declare-fun m!1124413 () Bool)

(assert (=> b!1220053 m!1124413))

(assert (=> b!1219916 d!133593))

(declare-fun d!133595 () Bool)

(assert (=> d!133595 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554660 () Unit!40281)

(declare-fun choose!13 (array!78706 (_ BitVec 64) (_ BitVec 32)) Unit!40281)

(assert (=> d!133595 (= lt!554660 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133595 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133595 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!554660)))

(declare-fun bs!34328 () Bool)

(assert (= bs!34328 d!133595))

(assert (=> bs!34328 m!1124279))

(declare-fun m!1124415 () Bool)

(assert (=> bs!34328 m!1124415))

(assert (=> b!1219916 d!133595))

(declare-fun b!1220064 () Bool)

(declare-fun e!692771 () Bool)

(declare-fun call!60667 () Bool)

(assert (=> b!1220064 (= e!692771 call!60667)))

(declare-fun b!1220065 () Bool)

(declare-fun e!692772 () Bool)

(assert (=> b!1220065 (= e!692772 e!692771)))

(declare-fun c!120182 () Bool)

(assert (=> b!1220065 (= c!120182 (validKeyInArray!0 (select (arr!37984 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133597 () Bool)

(declare-fun res!810456 () Bool)

(declare-fun e!692770 () Bool)

(assert (=> d!133597 (=> res!810456 e!692770)))

(assert (=> d!133597 (= res!810456 (bvsge #b00000000000000000000000000000000 (size!38522 _keys!1208)))))

(assert (=> d!133597 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26886) e!692770)))

(declare-fun b!1220066 () Bool)

(assert (=> b!1220066 (= e!692770 e!692772)))

(declare-fun res!810457 () Bool)

(assert (=> b!1220066 (=> (not res!810457) (not e!692772))))

(declare-fun e!692773 () Bool)

(assert (=> b!1220066 (= res!810457 (not e!692773))))

(declare-fun res!810458 () Bool)

(assert (=> b!1220066 (=> (not res!810458) (not e!692773))))

(assert (=> b!1220066 (= res!810458 (validKeyInArray!0 (select (arr!37984 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1220067 () Bool)

(declare-fun contains!6992 (List!26889 (_ BitVec 64)) Bool)

(assert (=> b!1220067 (= e!692773 (contains!6992 Nil!26886 (select (arr!37984 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60664 () Bool)

(assert (=> bm!60664 (= call!60667 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120182 (Cons!26885 (select (arr!37984 _keys!1208) #b00000000000000000000000000000000) Nil!26886) Nil!26886)))))

(declare-fun b!1220068 () Bool)

(assert (=> b!1220068 (= e!692771 call!60667)))

(assert (= (and d!133597 (not res!810456)) b!1220066))

(assert (= (and b!1220066 res!810458) b!1220067))

(assert (= (and b!1220066 res!810457) b!1220065))

(assert (= (and b!1220065 c!120182) b!1220068))

(assert (= (and b!1220065 (not c!120182)) b!1220064))

(assert (= (or b!1220068 b!1220064) bm!60664))

(assert (=> b!1220065 m!1124411))

(assert (=> b!1220065 m!1124411))

(declare-fun m!1124417 () Bool)

(assert (=> b!1220065 m!1124417))

(assert (=> b!1220066 m!1124411))

(assert (=> b!1220066 m!1124411))

(assert (=> b!1220066 m!1124417))

(assert (=> b!1220067 m!1124411))

(assert (=> b!1220067 m!1124411))

(declare-fun m!1124419 () Bool)

(assert (=> b!1220067 m!1124419))

(assert (=> bm!60664 m!1124411))

(declare-fun m!1124421 () Bool)

(assert (=> bm!60664 m!1124421))

(assert (=> b!1219926 d!133597))

(declare-fun d!133599 () Bool)

(assert (=> d!133599 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1219917 d!133599))

(declare-fun d!133601 () Bool)

(declare-fun res!810459 () Bool)

(declare-fun e!692774 () Bool)

(assert (=> d!133601 (=> res!810459 e!692774)))

(assert (=> d!133601 (= res!810459 (= (select (arr!37984 _keys!1208) i!673) k0!934))))

(assert (=> d!133601 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!692774)))

(declare-fun b!1220069 () Bool)

(declare-fun e!692775 () Bool)

(assert (=> b!1220069 (= e!692774 e!692775)))

(declare-fun res!810460 () Bool)

(assert (=> b!1220069 (=> (not res!810460) (not e!692775))))

(assert (=> b!1220069 (= res!810460 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38522 _keys!1208)))))

(declare-fun b!1220070 () Bool)

(assert (=> b!1220070 (= e!692775 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133601 (not res!810459)) b!1220069))

(assert (= (and b!1220069 res!810460) b!1220070))

(assert (=> d!133601 m!1124277))

(declare-fun m!1124423 () Bool)

(assert (=> b!1220070 m!1124423))

(assert (=> b!1219927 d!133601))

(declare-fun b!1220071 () Bool)

(declare-fun e!692777 () Bool)

(declare-fun call!60668 () Bool)

(assert (=> b!1220071 (= e!692777 call!60668)))

(declare-fun b!1220072 () Bool)

(declare-fun e!692778 () Bool)

(assert (=> b!1220072 (= e!692778 e!692777)))

(declare-fun c!120183 () Bool)

(assert (=> b!1220072 (= c!120183 (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455)))))

(declare-fun d!133603 () Bool)

(declare-fun res!810461 () Bool)

(declare-fun e!692776 () Bool)

(assert (=> d!133603 (=> res!810461 e!692776)))

(assert (=> d!133603 (= res!810461 (bvsge from!1455 (size!38522 _keys!1208)))))

(assert (=> d!133603 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26886) e!692776)))

(declare-fun b!1220073 () Bool)

(assert (=> b!1220073 (= e!692776 e!692778)))

(declare-fun res!810462 () Bool)

(assert (=> b!1220073 (=> (not res!810462) (not e!692778))))

(declare-fun e!692779 () Bool)

(assert (=> b!1220073 (= res!810462 (not e!692779))))

(declare-fun res!810463 () Bool)

(assert (=> b!1220073 (=> (not res!810463) (not e!692779))))

(assert (=> b!1220073 (= res!810463 (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455)))))

(declare-fun b!1220074 () Bool)

(assert (=> b!1220074 (= e!692779 (contains!6992 Nil!26886 (select (arr!37984 _keys!1208) from!1455)))))

(declare-fun bm!60665 () Bool)

(assert (=> bm!60665 (= call!60668 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120183 (Cons!26885 (select (arr!37984 _keys!1208) from!1455) Nil!26886) Nil!26886)))))

(declare-fun b!1220075 () Bool)

(assert (=> b!1220075 (= e!692777 call!60668)))

(assert (= (and d!133603 (not res!810461)) b!1220073))

(assert (= (and b!1220073 res!810463) b!1220074))

(assert (= (and b!1220073 res!810462) b!1220072))

(assert (= (and b!1220072 c!120183) b!1220075))

(assert (= (and b!1220072 (not c!120183)) b!1220071))

(assert (= (or b!1220075 b!1220071) bm!60665))

(assert (=> b!1220072 m!1124235))

(assert (=> b!1220072 m!1124235))

(assert (=> b!1220072 m!1124243))

(assert (=> b!1220073 m!1124235))

(assert (=> b!1220073 m!1124235))

(assert (=> b!1220073 m!1124243))

(assert (=> b!1220074 m!1124235))

(assert (=> b!1220074 m!1124235))

(declare-fun m!1124425 () Bool)

(assert (=> b!1220074 m!1124425))

(assert (=> bm!60665 m!1124235))

(declare-fun m!1124427 () Bool)

(assert (=> bm!60665 m!1124427))

(assert (=> b!1219918 d!133603))

(declare-fun d!133605 () Bool)

(assert (=> d!133605 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26886)))

(declare-fun lt!554663 () Unit!40281)

(declare-fun choose!39 (array!78706 (_ BitVec 32) (_ BitVec 32)) Unit!40281)

(assert (=> d!133605 (= lt!554663 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133605 (bvslt (size!38522 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133605 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!554663)))

(declare-fun bs!34329 () Bool)

(assert (= bs!34329 d!133605))

(assert (=> bs!34329 m!1124251))

(declare-fun m!1124429 () Bool)

(assert (=> bs!34329 m!1124429))

(assert (=> b!1219918 d!133605))

(declare-fun d!133607 () Bool)

(declare-fun res!810464 () Bool)

(declare-fun e!692780 () Bool)

(assert (=> d!133607 (=> res!810464 e!692780)))

(assert (=> d!133607 (= res!810464 (= (select (arr!37984 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133607 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!692780)))

(declare-fun b!1220076 () Bool)

(declare-fun e!692781 () Bool)

(assert (=> b!1220076 (= e!692780 e!692781)))

(declare-fun res!810465 () Bool)

(assert (=> b!1220076 (=> (not res!810465) (not e!692781))))

(assert (=> b!1220076 (= res!810465 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38522 _keys!1208)))))

(declare-fun b!1220077 () Bool)

(assert (=> b!1220077 (= e!692781 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133607 (not res!810464)) b!1220076))

(assert (= (and b!1220076 res!810465) b!1220077))

(declare-fun m!1124431 () Bool)

(assert (=> d!133607 m!1124431))

(declare-fun m!1124433 () Bool)

(assert (=> b!1220077 m!1124433))

(assert (=> b!1219918 d!133607))

(declare-fun d!133609 () Bool)

(assert (=> d!133609 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554666 () Unit!40281)

(declare-fun choose!114 (array!78706 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40281)

(assert (=> d!133609 (= lt!554666 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133609 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133609 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!554666)))

(declare-fun bs!34330 () Bool)

(assert (= bs!34330 d!133609))

(assert (=> bs!34330 m!1124255))

(declare-fun m!1124435 () Bool)

(assert (=> bs!34330 m!1124435))

(assert (=> b!1219918 d!133609))

(declare-fun b!1220102 () Bool)

(declare-fun e!692796 () ListLongMap!18077)

(declare-fun e!692800 () ListLongMap!18077)

(assert (=> b!1220102 (= e!692796 e!692800)))

(declare-fun c!120195 () Bool)

(assert (=> b!1220102 (= c!120195 (validKeyInArray!0 (select (arr!37984 lt!554576) from!1455)))))

(declare-fun b!1220103 () Bool)

(declare-fun e!692801 () Bool)

(assert (=> b!1220103 (= e!692801 (validKeyInArray!0 (select (arr!37984 lt!554576) from!1455)))))

(assert (=> b!1220103 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1220104 () Bool)

(assert (=> b!1220104 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38522 lt!554576)))))

(assert (=> b!1220104 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38521 lt!554581)))))

(declare-fun e!692799 () Bool)

(declare-fun lt!554684 () ListLongMap!18077)

(declare-fun apply!967 (ListLongMap!18077 (_ BitVec 64)) V!46465)

(assert (=> b!1220104 (= e!692799 (= (apply!967 lt!554684 (select (arr!37984 lt!554576) from!1455)) (get!19387 (select (arr!37983 lt!554581) from!1455) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1220105 () Bool)

(declare-fun e!692798 () Bool)

(declare-fun e!692802 () Bool)

(assert (=> b!1220105 (= e!692798 e!692802)))

(declare-fun c!120193 () Bool)

(assert (=> b!1220105 (= c!120193 (bvslt from!1455 (size!38522 lt!554576)))))

(declare-fun b!1220106 () Bool)

(declare-fun call!60671 () ListLongMap!18077)

(assert (=> b!1220106 (= e!692800 call!60671)))

(declare-fun b!1220107 () Bool)

(assert (=> b!1220107 (= e!692798 e!692799)))

(assert (=> b!1220107 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38522 lt!554576)))))

(declare-fun res!810476 () Bool)

(declare-fun contains!6993 (ListLongMap!18077 (_ BitVec 64)) Bool)

(assert (=> b!1220107 (= res!810476 (contains!6993 lt!554684 (select (arr!37984 lt!554576) from!1455)))))

(assert (=> b!1220107 (=> (not res!810476) (not e!692799))))

(declare-fun b!1220108 () Bool)

(declare-fun res!810475 () Bool)

(declare-fun e!692797 () Bool)

(assert (=> b!1220108 (=> (not res!810475) (not e!692797))))

(assert (=> b!1220108 (= res!810475 (not (contains!6993 lt!554684 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220109 () Bool)

(declare-fun lt!554681 () Unit!40281)

(declare-fun lt!554682 () Unit!40281)

(assert (=> b!1220109 (= lt!554681 lt!554682)))

(declare-fun lt!554687 () ListLongMap!18077)

(declare-fun lt!554686 () (_ BitVec 64))

(declare-fun lt!554685 () V!46465)

(declare-fun lt!554683 () (_ BitVec 64))

(assert (=> b!1220109 (not (contains!6993 (+!4120 lt!554687 (tuple2!20109 lt!554683 lt!554685)) lt!554686))))

(declare-fun addStillNotContains!303 (ListLongMap!18077 (_ BitVec 64) V!46465 (_ BitVec 64)) Unit!40281)

(assert (=> b!1220109 (= lt!554682 (addStillNotContains!303 lt!554687 lt!554683 lt!554685 lt!554686))))

(assert (=> b!1220109 (= lt!554686 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220109 (= lt!554685 (get!19387 (select (arr!37983 lt!554581) from!1455) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220109 (= lt!554683 (select (arr!37984 lt!554576) from!1455))))

(assert (=> b!1220109 (= lt!554687 call!60671)))

(assert (=> b!1220109 (= e!692800 (+!4120 call!60671 (tuple2!20109 (select (arr!37984 lt!554576) from!1455) (get!19387 (select (arr!37983 lt!554581) from!1455) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220110 () Bool)

(assert (=> b!1220110 (= e!692802 (= lt!554684 (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220111 () Bool)

(assert (=> b!1220111 (= e!692796 (ListLongMap!18078 Nil!26885))))

(declare-fun bm!60668 () Bool)

(assert (=> bm!60668 (= call!60671 (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133611 () Bool)

(assert (=> d!133611 e!692797))

(declare-fun res!810474 () Bool)

(assert (=> d!133611 (=> (not res!810474) (not e!692797))))

(assert (=> d!133611 (= res!810474 (not (contains!6993 lt!554684 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133611 (= lt!554684 e!692796)))

(declare-fun c!120192 () Bool)

(assert (=> d!133611 (= c!120192 (bvsge from!1455 (size!38522 lt!554576)))))

(assert (=> d!133611 (validMask!0 mask!1564)))

(assert (=> d!133611 (= (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554684)))

(declare-fun b!1220112 () Bool)

(declare-fun isEmpty!1003 (ListLongMap!18077) Bool)

(assert (=> b!1220112 (= e!692802 (isEmpty!1003 lt!554684))))

(declare-fun b!1220113 () Bool)

(assert (=> b!1220113 (= e!692797 e!692798)))

(declare-fun c!120194 () Bool)

(assert (=> b!1220113 (= c!120194 e!692801)))

(declare-fun res!810477 () Bool)

(assert (=> b!1220113 (=> (not res!810477) (not e!692801))))

(assert (=> b!1220113 (= res!810477 (bvslt from!1455 (size!38522 lt!554576)))))

(assert (= (and d!133611 c!120192) b!1220111))

(assert (= (and d!133611 (not c!120192)) b!1220102))

(assert (= (and b!1220102 c!120195) b!1220109))

(assert (= (and b!1220102 (not c!120195)) b!1220106))

(assert (= (or b!1220109 b!1220106) bm!60668))

(assert (= (and d!133611 res!810474) b!1220108))

(assert (= (and b!1220108 res!810475) b!1220113))

(assert (= (and b!1220113 res!810477) b!1220103))

(assert (= (and b!1220113 c!120194) b!1220107))

(assert (= (and b!1220113 (not c!120194)) b!1220105))

(assert (= (and b!1220107 res!810476) b!1220104))

(assert (= (and b!1220105 c!120193) b!1220110))

(assert (= (and b!1220105 (not c!120193)) b!1220112))

(declare-fun b_lambda!22125 () Bool)

(assert (=> (not b_lambda!22125) (not b!1220104)))

(assert (=> b!1220104 t!40157))

(declare-fun b_and!43781 () Bool)

(assert (= b_and!43771 (and (=> t!40157 result!22795) b_and!43781)))

(declare-fun b_lambda!22127 () Bool)

(assert (=> (not b_lambda!22127) (not b!1220109)))

(assert (=> b!1220109 t!40157))

(declare-fun b_and!43783 () Bool)

(assert (= b_and!43781 (and (=> t!40157 result!22795) b_and!43783)))

(declare-fun m!1124437 () Bool)

(assert (=> b!1220108 m!1124437))

(declare-fun m!1124439 () Bool)

(assert (=> bm!60668 m!1124439))

(declare-fun m!1124441 () Bool)

(assert (=> b!1220102 m!1124441))

(assert (=> b!1220102 m!1124441))

(declare-fun m!1124443 () Bool)

(assert (=> b!1220102 m!1124443))

(assert (=> b!1220107 m!1124441))

(assert (=> b!1220107 m!1124441))

(declare-fun m!1124445 () Bool)

(assert (=> b!1220107 m!1124445))

(declare-fun m!1124447 () Bool)

(assert (=> b!1220104 m!1124447))

(assert (=> b!1220104 m!1124231))

(declare-fun m!1124449 () Bool)

(assert (=> b!1220104 m!1124449))

(assert (=> b!1220104 m!1124441))

(declare-fun m!1124451 () Bool)

(assert (=> b!1220104 m!1124451))

(assert (=> b!1220104 m!1124231))

(assert (=> b!1220104 m!1124441))

(assert (=> b!1220104 m!1124447))

(declare-fun m!1124453 () Bool)

(assert (=> d!133611 m!1124453))

(assert (=> d!133611 m!1124225))

(assert (=> b!1220110 m!1124439))

(assert (=> b!1220109 m!1124447))

(assert (=> b!1220109 m!1124231))

(assert (=> b!1220109 m!1124449))

(declare-fun m!1124455 () Bool)

(assert (=> b!1220109 m!1124455))

(declare-fun m!1124457 () Bool)

(assert (=> b!1220109 m!1124457))

(assert (=> b!1220109 m!1124231))

(assert (=> b!1220109 m!1124457))

(declare-fun m!1124459 () Bool)

(assert (=> b!1220109 m!1124459))

(assert (=> b!1220109 m!1124441))

(assert (=> b!1220109 m!1124447))

(declare-fun m!1124461 () Bool)

(assert (=> b!1220109 m!1124461))

(declare-fun m!1124463 () Bool)

(assert (=> b!1220112 m!1124463))

(assert (=> b!1220103 m!1124441))

(assert (=> b!1220103 m!1124441))

(assert (=> b!1220103 m!1124443))

(assert (=> b!1219913 d!133611))

(declare-fun b!1220114 () Bool)

(declare-fun e!692803 () ListLongMap!18077)

(declare-fun e!692807 () ListLongMap!18077)

(assert (=> b!1220114 (= e!692803 e!692807)))

(declare-fun c!120199 () Bool)

(assert (=> b!1220114 (= c!120199 (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455)))))

(declare-fun b!1220115 () Bool)

(declare-fun e!692808 () Bool)

(assert (=> b!1220115 (= e!692808 (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455)))))

(assert (=> b!1220115 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1220116 () Bool)

(assert (=> b!1220116 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38522 _keys!1208)))))

(assert (=> b!1220116 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38521 _values!996)))))

(declare-fun lt!554691 () ListLongMap!18077)

(declare-fun e!692806 () Bool)

(assert (=> b!1220116 (= e!692806 (= (apply!967 lt!554691 (select (arr!37984 _keys!1208) from!1455)) (get!19387 (select (arr!37983 _values!996) from!1455) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1220117 () Bool)

(declare-fun e!692805 () Bool)

(declare-fun e!692809 () Bool)

(assert (=> b!1220117 (= e!692805 e!692809)))

(declare-fun c!120197 () Bool)

(assert (=> b!1220117 (= c!120197 (bvslt from!1455 (size!38522 _keys!1208)))))

(declare-fun b!1220118 () Bool)

(declare-fun call!60672 () ListLongMap!18077)

(assert (=> b!1220118 (= e!692807 call!60672)))

(declare-fun b!1220119 () Bool)

(assert (=> b!1220119 (= e!692805 e!692806)))

(assert (=> b!1220119 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38522 _keys!1208)))))

(declare-fun res!810480 () Bool)

(assert (=> b!1220119 (= res!810480 (contains!6993 lt!554691 (select (arr!37984 _keys!1208) from!1455)))))

(assert (=> b!1220119 (=> (not res!810480) (not e!692806))))

(declare-fun b!1220120 () Bool)

(declare-fun res!810479 () Bool)

(declare-fun e!692804 () Bool)

(assert (=> b!1220120 (=> (not res!810479) (not e!692804))))

(assert (=> b!1220120 (= res!810479 (not (contains!6993 lt!554691 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220121 () Bool)

(declare-fun lt!554688 () Unit!40281)

(declare-fun lt!554689 () Unit!40281)

(assert (=> b!1220121 (= lt!554688 lt!554689)))

(declare-fun lt!554693 () (_ BitVec 64))

(declare-fun lt!554694 () ListLongMap!18077)

(declare-fun lt!554690 () (_ BitVec 64))

(declare-fun lt!554692 () V!46465)

(assert (=> b!1220121 (not (contains!6993 (+!4120 lt!554694 (tuple2!20109 lt!554690 lt!554692)) lt!554693))))

(assert (=> b!1220121 (= lt!554689 (addStillNotContains!303 lt!554694 lt!554690 lt!554692 lt!554693))))

(assert (=> b!1220121 (= lt!554693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220121 (= lt!554692 (get!19387 (select (arr!37983 _values!996) from!1455) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220121 (= lt!554690 (select (arr!37984 _keys!1208) from!1455))))

(assert (=> b!1220121 (= lt!554694 call!60672)))

(assert (=> b!1220121 (= e!692807 (+!4120 call!60672 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220122 () Bool)

(assert (=> b!1220122 (= e!692809 (= lt!554691 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220123 () Bool)

(assert (=> b!1220123 (= e!692803 (ListLongMap!18078 Nil!26885))))

(declare-fun bm!60669 () Bool)

(assert (=> bm!60669 (= call!60672 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133613 () Bool)

(assert (=> d!133613 e!692804))

(declare-fun res!810478 () Bool)

(assert (=> d!133613 (=> (not res!810478) (not e!692804))))

(assert (=> d!133613 (= res!810478 (not (contains!6993 lt!554691 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133613 (= lt!554691 e!692803)))

(declare-fun c!120196 () Bool)

(assert (=> d!133613 (= c!120196 (bvsge from!1455 (size!38522 _keys!1208)))))

(assert (=> d!133613 (validMask!0 mask!1564)))

(assert (=> d!133613 (= (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554691)))

(declare-fun b!1220124 () Bool)

(assert (=> b!1220124 (= e!692809 (isEmpty!1003 lt!554691))))

(declare-fun b!1220125 () Bool)

(assert (=> b!1220125 (= e!692804 e!692805)))

(declare-fun c!120198 () Bool)

(assert (=> b!1220125 (= c!120198 e!692808)))

(declare-fun res!810481 () Bool)

(assert (=> b!1220125 (=> (not res!810481) (not e!692808))))

(assert (=> b!1220125 (= res!810481 (bvslt from!1455 (size!38522 _keys!1208)))))

(assert (= (and d!133613 c!120196) b!1220123))

(assert (= (and d!133613 (not c!120196)) b!1220114))

(assert (= (and b!1220114 c!120199) b!1220121))

(assert (= (and b!1220114 (not c!120199)) b!1220118))

(assert (= (or b!1220121 b!1220118) bm!60669))

(assert (= (and d!133613 res!810478) b!1220120))

(assert (= (and b!1220120 res!810479) b!1220125))

(assert (= (and b!1220125 res!810481) b!1220115))

(assert (= (and b!1220125 c!120198) b!1220119))

(assert (= (and b!1220125 (not c!120198)) b!1220117))

(assert (= (and b!1220119 res!810480) b!1220116))

(assert (= (and b!1220117 c!120197) b!1220122))

(assert (= (and b!1220117 (not c!120197)) b!1220124))

(declare-fun b_lambda!22129 () Bool)

(assert (=> (not b_lambda!22129) (not b!1220116)))

(assert (=> b!1220116 t!40157))

(declare-fun b_and!43785 () Bool)

(assert (= b_and!43783 (and (=> t!40157 result!22795) b_and!43785)))

(declare-fun b_lambda!22131 () Bool)

(assert (=> (not b_lambda!22131) (not b!1220121)))

(assert (=> b!1220121 t!40157))

(declare-fun b_and!43787 () Bool)

(assert (= b_and!43785 (and (=> t!40157 result!22795) b_and!43787)))

(declare-fun m!1124465 () Bool)

(assert (=> b!1220120 m!1124465))

(declare-fun m!1124467 () Bool)

(assert (=> bm!60669 m!1124467))

(assert (=> b!1220114 m!1124235))

(assert (=> b!1220114 m!1124235))

(assert (=> b!1220114 m!1124243))

(assert (=> b!1220119 m!1124235))

(assert (=> b!1220119 m!1124235))

(declare-fun m!1124469 () Bool)

(assert (=> b!1220119 m!1124469))

(assert (=> b!1220116 m!1124261))

(assert (=> b!1220116 m!1124231))

(declare-fun m!1124471 () Bool)

(assert (=> b!1220116 m!1124471))

(assert (=> b!1220116 m!1124235))

(declare-fun m!1124473 () Bool)

(assert (=> b!1220116 m!1124473))

(assert (=> b!1220116 m!1124231))

(assert (=> b!1220116 m!1124235))

(assert (=> b!1220116 m!1124261))

(declare-fun m!1124475 () Bool)

(assert (=> d!133613 m!1124475))

(assert (=> d!133613 m!1124225))

(assert (=> b!1220122 m!1124467))

(assert (=> b!1220121 m!1124261))

(assert (=> b!1220121 m!1124231))

(assert (=> b!1220121 m!1124471))

(declare-fun m!1124477 () Bool)

(assert (=> b!1220121 m!1124477))

(declare-fun m!1124479 () Bool)

(assert (=> b!1220121 m!1124479))

(assert (=> b!1220121 m!1124231))

(assert (=> b!1220121 m!1124479))

(declare-fun m!1124481 () Bool)

(assert (=> b!1220121 m!1124481))

(assert (=> b!1220121 m!1124235))

(assert (=> b!1220121 m!1124261))

(declare-fun m!1124483 () Bool)

(assert (=> b!1220121 m!1124483))

(declare-fun m!1124485 () Bool)

(assert (=> b!1220124 m!1124485))

(assert (=> b!1220115 m!1124235))

(assert (=> b!1220115 m!1124235))

(assert (=> b!1220115 m!1124243))

(assert (=> b!1219913 d!133613))

(declare-fun d!133615 () Bool)

(declare-fun lt!554697 () ListLongMap!18077)

(assert (=> d!133615 (not (contains!6993 lt!554697 k0!934))))

(declare-fun removeStrictlySorted!107 (List!26888 (_ BitVec 64)) List!26888)

(assert (=> d!133615 (= lt!554697 (ListLongMap!18078 (removeStrictlySorted!107 (toList!9054 lt!554574) k0!934)))))

(assert (=> d!133615 (= (-!1884 lt!554574 k0!934) lt!554697)))

(declare-fun bs!34331 () Bool)

(assert (= bs!34331 d!133615))

(declare-fun m!1124487 () Bool)

(assert (=> bs!34331 m!1124487))

(declare-fun m!1124489 () Bool)

(assert (=> bs!34331 m!1124489))

(assert (=> b!1219923 d!133615))

(declare-fun b!1220126 () Bool)

(declare-fun e!692810 () ListLongMap!18077)

(declare-fun e!692814 () ListLongMap!18077)

(assert (=> b!1220126 (= e!692810 e!692814)))

(declare-fun c!120203 () Bool)

(assert (=> b!1220126 (= c!120203 (validKeyInArray!0 (select (arr!37984 lt!554576) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1220127 () Bool)

(declare-fun e!692815 () Bool)

(assert (=> b!1220127 (= e!692815 (validKeyInArray!0 (select (arr!37984 lt!554576) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220127 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1220128 () Bool)

(assert (=> b!1220128 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 lt!554576)))))

(assert (=> b!1220128 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38521 lt!554581)))))

(declare-fun e!692813 () Bool)

(declare-fun lt!554701 () ListLongMap!18077)

(assert (=> b!1220128 (= e!692813 (= (apply!967 lt!554701 (select (arr!37984 lt!554576) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19387 (select (arr!37983 lt!554581) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1220129 () Bool)

(declare-fun e!692812 () Bool)

(declare-fun e!692816 () Bool)

(assert (=> b!1220129 (= e!692812 e!692816)))

(declare-fun c!120201 () Bool)

(assert (=> b!1220129 (= c!120201 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 lt!554576)))))

(declare-fun b!1220130 () Bool)

(declare-fun call!60673 () ListLongMap!18077)

(assert (=> b!1220130 (= e!692814 call!60673)))

(declare-fun b!1220131 () Bool)

(assert (=> b!1220131 (= e!692812 e!692813)))

(assert (=> b!1220131 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 lt!554576)))))

(declare-fun res!810484 () Bool)

(assert (=> b!1220131 (= res!810484 (contains!6993 lt!554701 (select (arr!37984 lt!554576) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220131 (=> (not res!810484) (not e!692813))))

(declare-fun b!1220132 () Bool)

(declare-fun res!810483 () Bool)

(declare-fun e!692811 () Bool)

(assert (=> b!1220132 (=> (not res!810483) (not e!692811))))

(assert (=> b!1220132 (= res!810483 (not (contains!6993 lt!554701 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220133 () Bool)

(declare-fun lt!554698 () Unit!40281)

(declare-fun lt!554699 () Unit!40281)

(assert (=> b!1220133 (= lt!554698 lt!554699)))

(declare-fun lt!554704 () ListLongMap!18077)

(declare-fun lt!554700 () (_ BitVec 64))

(declare-fun lt!554703 () (_ BitVec 64))

(declare-fun lt!554702 () V!46465)

(assert (=> b!1220133 (not (contains!6993 (+!4120 lt!554704 (tuple2!20109 lt!554700 lt!554702)) lt!554703))))

(assert (=> b!1220133 (= lt!554699 (addStillNotContains!303 lt!554704 lt!554700 lt!554702 lt!554703))))

(assert (=> b!1220133 (= lt!554703 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220133 (= lt!554702 (get!19387 (select (arr!37983 lt!554581) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220133 (= lt!554700 (select (arr!37984 lt!554576) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220133 (= lt!554704 call!60673)))

(assert (=> b!1220133 (= e!692814 (+!4120 call!60673 (tuple2!20109 (select (arr!37984 lt!554576) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19387 (select (arr!37983 lt!554581) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220134 () Bool)

(assert (=> b!1220134 (= e!692816 (= lt!554701 (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220135 () Bool)

(assert (=> b!1220135 (= e!692810 (ListLongMap!18078 Nil!26885))))

(declare-fun bm!60670 () Bool)

(assert (=> bm!60670 (= call!60673 (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133617 () Bool)

(assert (=> d!133617 e!692811))

(declare-fun res!810482 () Bool)

(assert (=> d!133617 (=> (not res!810482) (not e!692811))))

(assert (=> d!133617 (= res!810482 (not (contains!6993 lt!554701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133617 (= lt!554701 e!692810)))

(declare-fun c!120200 () Bool)

(assert (=> d!133617 (= c!120200 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 lt!554576)))))

(assert (=> d!133617 (validMask!0 mask!1564)))

(assert (=> d!133617 (= (getCurrentListMapNoExtraKeys!5491 lt!554576 lt!554581 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554701)))

(declare-fun b!1220136 () Bool)

(assert (=> b!1220136 (= e!692816 (isEmpty!1003 lt!554701))))

(declare-fun b!1220137 () Bool)

(assert (=> b!1220137 (= e!692811 e!692812)))

(declare-fun c!120202 () Bool)

(assert (=> b!1220137 (= c!120202 e!692815)))

(declare-fun res!810485 () Bool)

(assert (=> b!1220137 (=> (not res!810485) (not e!692815))))

(assert (=> b!1220137 (= res!810485 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 lt!554576)))))

(assert (= (and d!133617 c!120200) b!1220135))

(assert (= (and d!133617 (not c!120200)) b!1220126))

(assert (= (and b!1220126 c!120203) b!1220133))

(assert (= (and b!1220126 (not c!120203)) b!1220130))

(assert (= (or b!1220133 b!1220130) bm!60670))

(assert (= (and d!133617 res!810482) b!1220132))

(assert (= (and b!1220132 res!810483) b!1220137))

(assert (= (and b!1220137 res!810485) b!1220127))

(assert (= (and b!1220137 c!120202) b!1220131))

(assert (= (and b!1220137 (not c!120202)) b!1220129))

(assert (= (and b!1220131 res!810484) b!1220128))

(assert (= (and b!1220129 c!120201) b!1220134))

(assert (= (and b!1220129 (not c!120201)) b!1220136))

(declare-fun b_lambda!22133 () Bool)

(assert (=> (not b_lambda!22133) (not b!1220128)))

(assert (=> b!1220128 t!40157))

(declare-fun b_and!43789 () Bool)

(assert (= b_and!43787 (and (=> t!40157 result!22795) b_and!43789)))

(declare-fun b_lambda!22135 () Bool)

(assert (=> (not b_lambda!22135) (not b!1220133)))

(assert (=> b!1220133 t!40157))

(declare-fun b_and!43791 () Bool)

(assert (= b_and!43789 (and (=> t!40157 result!22795) b_and!43791)))

(declare-fun m!1124491 () Bool)

(assert (=> b!1220132 m!1124491))

(declare-fun m!1124493 () Bool)

(assert (=> bm!60670 m!1124493))

(declare-fun m!1124495 () Bool)

(assert (=> b!1220126 m!1124495))

(assert (=> b!1220126 m!1124495))

(declare-fun m!1124497 () Bool)

(assert (=> b!1220126 m!1124497))

(assert (=> b!1220131 m!1124495))

(assert (=> b!1220131 m!1124495))

(declare-fun m!1124499 () Bool)

(assert (=> b!1220131 m!1124499))

(declare-fun m!1124501 () Bool)

(assert (=> b!1220128 m!1124501))

(assert (=> b!1220128 m!1124231))

(declare-fun m!1124503 () Bool)

(assert (=> b!1220128 m!1124503))

(assert (=> b!1220128 m!1124495))

(declare-fun m!1124505 () Bool)

(assert (=> b!1220128 m!1124505))

(assert (=> b!1220128 m!1124231))

(assert (=> b!1220128 m!1124495))

(assert (=> b!1220128 m!1124501))

(declare-fun m!1124507 () Bool)

(assert (=> d!133617 m!1124507))

(assert (=> d!133617 m!1124225))

(assert (=> b!1220134 m!1124493))

(assert (=> b!1220133 m!1124501))

(assert (=> b!1220133 m!1124231))

(assert (=> b!1220133 m!1124503))

(declare-fun m!1124509 () Bool)

(assert (=> b!1220133 m!1124509))

(declare-fun m!1124511 () Bool)

(assert (=> b!1220133 m!1124511))

(assert (=> b!1220133 m!1124231))

(assert (=> b!1220133 m!1124511))

(declare-fun m!1124513 () Bool)

(assert (=> b!1220133 m!1124513))

(assert (=> b!1220133 m!1124495))

(assert (=> b!1220133 m!1124501))

(declare-fun m!1124515 () Bool)

(assert (=> b!1220133 m!1124515))

(declare-fun m!1124517 () Bool)

(assert (=> b!1220136 m!1124517))

(assert (=> b!1220127 m!1124495))

(assert (=> b!1220127 m!1124495))

(assert (=> b!1220127 m!1124497))

(assert (=> b!1219923 d!133617))

(declare-fun d!133619 () Bool)

(assert (=> d!133619 (= (validKeyInArray!0 (select (arr!37984 _keys!1208) from!1455)) (and (not (= (select (arr!37984 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!37984 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1219923 d!133619))

(declare-fun b!1220144 () Bool)

(declare-fun e!692821 () Bool)

(declare-fun e!692822 () Bool)

(assert (=> b!1220144 (= e!692821 e!692822)))

(declare-fun c!120206 () Bool)

(assert (=> b!1220144 (= c!120206 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun call!60679 () ListLongMap!18077)

(declare-fun b!1220145 () Bool)

(declare-fun call!60678 () ListLongMap!18077)

(assert (=> b!1220145 (= e!692822 (= call!60679 (-!1884 call!60678 k0!934)))))

(assert (=> b!1220145 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38521 _values!996)))))

(declare-fun d!133621 () Bool)

(assert (=> d!133621 e!692821))

(declare-fun res!810488 () Bool)

(assert (=> d!133621 (=> (not res!810488) (not e!692821))))

(assert (=> d!133621 (= res!810488 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38522 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38522 _keys!1208))))))))

(declare-fun lt!554707 () Unit!40281)

(declare-fun choose!1833 (array!78706 array!78704 (_ BitVec 32) (_ BitVec 32) V!46465 V!46465 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40281)

(assert (=> d!133621 (= lt!554707 (choose!1833 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133621 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 _keys!1208)))))

(assert (=> d!133621 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554707)))

(declare-fun b!1220146 () Bool)

(assert (=> b!1220146 (= e!692822 (= call!60679 call!60678))))

(assert (=> b!1220146 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38521 _values!996)))))

(declare-fun bm!60675 () Bool)

(assert (=> bm!60675 (= call!60678 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!60676 () Bool)

(assert (=> bm!60676 (= call!60679 (getCurrentListMapNoExtraKeys!5491 (array!78707 (store (arr!37984 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38522 _keys!1208)) (array!78705 (store (arr!37983 _values!996) i!673 (ValueCellFull!14792 (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38521 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133621 res!810488) b!1220144))

(assert (= (and b!1220144 c!120206) b!1220145))

(assert (= (and b!1220144 (not c!120206)) b!1220146))

(assert (= (or b!1220145 b!1220146) bm!60675))

(assert (= (or b!1220145 b!1220146) bm!60676))

(declare-fun b_lambda!22137 () Bool)

(assert (=> (not b_lambda!22137) (not bm!60676)))

(assert (=> bm!60676 t!40157))

(declare-fun b_and!43793 () Bool)

(assert (= b_and!43791 (and (=> t!40157 result!22795) b_and!43793)))

(declare-fun m!1124519 () Bool)

(assert (=> b!1220145 m!1124519))

(declare-fun m!1124521 () Bool)

(assert (=> d!133621 m!1124521))

(assert (=> bm!60675 m!1124237))

(assert (=> bm!60676 m!1124275))

(assert (=> bm!60676 m!1124231))

(declare-fun m!1124523 () Bool)

(assert (=> bm!60676 m!1124523))

(declare-fun m!1124525 () Bool)

(assert (=> bm!60676 m!1124525))

(assert (=> b!1219923 d!133621))

(declare-fun b!1220147 () Bool)

(declare-fun e!692823 () ListLongMap!18077)

(declare-fun e!692827 () ListLongMap!18077)

(assert (=> b!1220147 (= e!692823 e!692827)))

(declare-fun c!120210 () Bool)

(assert (=> b!1220147 (= c!120210 (validKeyInArray!0 (select (arr!37984 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1220148 () Bool)

(declare-fun e!692828 () Bool)

(assert (=> b!1220148 (= e!692828 (validKeyInArray!0 (select (arr!37984 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220148 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1220149 () Bool)

(assert (=> b!1220149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 _keys!1208)))))

(assert (=> b!1220149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38521 _values!996)))))

(declare-fun lt!554711 () ListLongMap!18077)

(declare-fun e!692826 () Bool)

(assert (=> b!1220149 (= e!692826 (= (apply!967 lt!554711 (select (arr!37984 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19387 (select (arr!37983 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1220150 () Bool)

(declare-fun e!692825 () Bool)

(declare-fun e!692829 () Bool)

(assert (=> b!1220150 (= e!692825 e!692829)))

(declare-fun c!120208 () Bool)

(assert (=> b!1220150 (= c!120208 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 _keys!1208)))))

(declare-fun b!1220151 () Bool)

(declare-fun call!60680 () ListLongMap!18077)

(assert (=> b!1220151 (= e!692827 call!60680)))

(declare-fun b!1220152 () Bool)

(assert (=> b!1220152 (= e!692825 e!692826)))

(assert (=> b!1220152 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 _keys!1208)))))

(declare-fun res!810491 () Bool)

(assert (=> b!1220152 (= res!810491 (contains!6993 lt!554711 (select (arr!37984 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220152 (=> (not res!810491) (not e!692826))))

(declare-fun b!1220153 () Bool)

(declare-fun res!810490 () Bool)

(declare-fun e!692824 () Bool)

(assert (=> b!1220153 (=> (not res!810490) (not e!692824))))

(assert (=> b!1220153 (= res!810490 (not (contains!6993 lt!554711 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220154 () Bool)

(declare-fun lt!554708 () Unit!40281)

(declare-fun lt!554709 () Unit!40281)

(assert (=> b!1220154 (= lt!554708 lt!554709)))

(declare-fun lt!554710 () (_ BitVec 64))

(declare-fun lt!554713 () (_ BitVec 64))

(declare-fun lt!554712 () V!46465)

(declare-fun lt!554714 () ListLongMap!18077)

(assert (=> b!1220154 (not (contains!6993 (+!4120 lt!554714 (tuple2!20109 lt!554710 lt!554712)) lt!554713))))

(assert (=> b!1220154 (= lt!554709 (addStillNotContains!303 lt!554714 lt!554710 lt!554712 lt!554713))))

(assert (=> b!1220154 (= lt!554713 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220154 (= lt!554712 (get!19387 (select (arr!37983 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220154 (= lt!554710 (select (arr!37984 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220154 (= lt!554714 call!60680)))

(assert (=> b!1220154 (= e!692827 (+!4120 call!60680 (tuple2!20109 (select (arr!37984 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19387 (select (arr!37983 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3340 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220155 () Bool)

(assert (=> b!1220155 (= e!692829 (= lt!554711 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220156 () Bool)

(assert (=> b!1220156 (= e!692823 (ListLongMap!18078 Nil!26885))))

(declare-fun bm!60677 () Bool)

(assert (=> bm!60677 (= call!60680 (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!133623 () Bool)

(assert (=> d!133623 e!692824))

(declare-fun res!810489 () Bool)

(assert (=> d!133623 (=> (not res!810489) (not e!692824))))

(assert (=> d!133623 (= res!810489 (not (contains!6993 lt!554711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!133623 (= lt!554711 e!692823)))

(declare-fun c!120207 () Bool)

(assert (=> d!133623 (= c!120207 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 _keys!1208)))))

(assert (=> d!133623 (validMask!0 mask!1564)))

(assert (=> d!133623 (= (getCurrentListMapNoExtraKeys!5491 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554711)))

(declare-fun b!1220157 () Bool)

(assert (=> b!1220157 (= e!692829 (isEmpty!1003 lt!554711))))

(declare-fun b!1220158 () Bool)

(assert (=> b!1220158 (= e!692824 e!692825)))

(declare-fun c!120209 () Bool)

(assert (=> b!1220158 (= c!120209 e!692828)))

(declare-fun res!810492 () Bool)

(assert (=> b!1220158 (=> (not res!810492) (not e!692828))))

(assert (=> b!1220158 (= res!810492 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38522 _keys!1208)))))

(assert (= (and d!133623 c!120207) b!1220156))

(assert (= (and d!133623 (not c!120207)) b!1220147))

(assert (= (and b!1220147 c!120210) b!1220154))

(assert (= (and b!1220147 (not c!120210)) b!1220151))

(assert (= (or b!1220154 b!1220151) bm!60677))

(assert (= (and d!133623 res!810489) b!1220153))

(assert (= (and b!1220153 res!810490) b!1220158))

(assert (= (and b!1220158 res!810492) b!1220148))

(assert (= (and b!1220158 c!120209) b!1220152))

(assert (= (and b!1220158 (not c!120209)) b!1220150))

(assert (= (and b!1220152 res!810491) b!1220149))

(assert (= (and b!1220150 c!120208) b!1220155))

(assert (= (and b!1220150 (not c!120208)) b!1220157))

(declare-fun b_lambda!22139 () Bool)

(assert (=> (not b_lambda!22139) (not b!1220149)))

(assert (=> b!1220149 t!40157))

(declare-fun b_and!43795 () Bool)

(assert (= b_and!43793 (and (=> t!40157 result!22795) b_and!43795)))

(declare-fun b_lambda!22141 () Bool)

(assert (=> (not b_lambda!22141) (not b!1220154)))

(assert (=> b!1220154 t!40157))

(declare-fun b_and!43797 () Bool)

(assert (= b_and!43795 (and (=> t!40157 result!22795) b_and!43797)))

(declare-fun m!1124527 () Bool)

(assert (=> b!1220153 m!1124527))

(declare-fun m!1124529 () Bool)

(assert (=> bm!60677 m!1124529))

(assert (=> b!1220147 m!1124431))

(assert (=> b!1220147 m!1124431))

(declare-fun m!1124531 () Bool)

(assert (=> b!1220147 m!1124531))

(assert (=> b!1220152 m!1124431))

(assert (=> b!1220152 m!1124431))

(declare-fun m!1124533 () Bool)

(assert (=> b!1220152 m!1124533))

(declare-fun m!1124535 () Bool)

(assert (=> b!1220149 m!1124535))

(assert (=> b!1220149 m!1124231))

(declare-fun m!1124537 () Bool)

(assert (=> b!1220149 m!1124537))

(assert (=> b!1220149 m!1124431))

(declare-fun m!1124539 () Bool)

(assert (=> b!1220149 m!1124539))

(assert (=> b!1220149 m!1124231))

(assert (=> b!1220149 m!1124431))

(assert (=> b!1220149 m!1124535))

(declare-fun m!1124541 () Bool)

(assert (=> d!133623 m!1124541))

(assert (=> d!133623 m!1124225))

(assert (=> b!1220155 m!1124529))

(assert (=> b!1220154 m!1124535))

(assert (=> b!1220154 m!1124231))

(assert (=> b!1220154 m!1124537))

(declare-fun m!1124543 () Bool)

(assert (=> b!1220154 m!1124543))

(declare-fun m!1124545 () Bool)

(assert (=> b!1220154 m!1124545))

(assert (=> b!1220154 m!1124231))

(assert (=> b!1220154 m!1124545))

(declare-fun m!1124547 () Bool)

(assert (=> b!1220154 m!1124547))

(assert (=> b!1220154 m!1124431))

(assert (=> b!1220154 m!1124535))

(declare-fun m!1124549 () Bool)

(assert (=> b!1220154 m!1124549))

(declare-fun m!1124551 () Bool)

(assert (=> b!1220157 m!1124551))

(assert (=> b!1220148 m!1124431))

(assert (=> b!1220148 m!1124431))

(assert (=> b!1220148 m!1124531))

(assert (=> b!1219923 d!133623))

(declare-fun b!1220167 () Bool)

(declare-fun e!692838 () Bool)

(declare-fun e!692837 () Bool)

(assert (=> b!1220167 (= e!692838 e!692837)))

(declare-fun c!120213 () Bool)

(assert (=> b!1220167 (= c!120213 (validKeyInArray!0 (select (arr!37984 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1220168 () Bool)

(declare-fun e!692836 () Bool)

(declare-fun call!60683 () Bool)

(assert (=> b!1220168 (= e!692836 call!60683)))

(declare-fun d!133625 () Bool)

(declare-fun res!810498 () Bool)

(assert (=> d!133625 (=> res!810498 e!692838)))

(assert (=> d!133625 (= res!810498 (bvsge #b00000000000000000000000000000000 (size!38522 _keys!1208)))))

(assert (=> d!133625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!692838)))

(declare-fun b!1220169 () Bool)

(assert (=> b!1220169 (= e!692837 e!692836)))

(declare-fun lt!554721 () (_ BitVec 64))

(assert (=> b!1220169 (= lt!554721 (select (arr!37984 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!554723 () Unit!40281)

(assert (=> b!1220169 (= lt!554723 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554721 #b00000000000000000000000000000000))))

(assert (=> b!1220169 (arrayContainsKey!0 _keys!1208 lt!554721 #b00000000000000000000000000000000)))

(declare-fun lt!554722 () Unit!40281)

(assert (=> b!1220169 (= lt!554722 lt!554723)))

(declare-fun res!810497 () Bool)

(declare-datatypes ((SeekEntryResult!9946 0))(
  ( (MissingZero!9946 (index!42155 (_ BitVec 32))) (Found!9946 (index!42156 (_ BitVec 32))) (Intermediate!9946 (undefined!10758 Bool) (index!42157 (_ BitVec 32)) (x!107472 (_ BitVec 32))) (Undefined!9946) (MissingVacant!9946 (index!42158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78706 (_ BitVec 32)) SeekEntryResult!9946)

(assert (=> b!1220169 (= res!810497 (= (seekEntryOrOpen!0 (select (arr!37984 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9946 #b00000000000000000000000000000000)))))

(assert (=> b!1220169 (=> (not res!810497) (not e!692836))))

(declare-fun b!1220170 () Bool)

(assert (=> b!1220170 (= e!692837 call!60683)))

(declare-fun bm!60680 () Bool)

(assert (=> bm!60680 (= call!60683 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!133625 (not res!810498)) b!1220167))

(assert (= (and b!1220167 c!120213) b!1220169))

(assert (= (and b!1220167 (not c!120213)) b!1220170))

(assert (= (and b!1220169 res!810497) b!1220168))

(assert (= (or b!1220168 b!1220170) bm!60680))

(assert (=> b!1220167 m!1124411))

(assert (=> b!1220167 m!1124411))

(assert (=> b!1220167 m!1124417))

(assert (=> b!1220169 m!1124411))

(declare-fun m!1124553 () Bool)

(assert (=> b!1220169 m!1124553))

(declare-fun m!1124555 () Bool)

(assert (=> b!1220169 m!1124555))

(assert (=> b!1220169 m!1124411))

(declare-fun m!1124557 () Bool)

(assert (=> b!1220169 m!1124557))

(declare-fun m!1124559 () Bool)

(assert (=> bm!60680 m!1124559))

(assert (=> b!1219924 d!133625))

(declare-fun b!1220171 () Bool)

(declare-fun e!692840 () Bool)

(declare-fun call!60684 () Bool)

(assert (=> b!1220171 (= e!692840 call!60684)))

(declare-fun b!1220172 () Bool)

(declare-fun e!692841 () Bool)

(assert (=> b!1220172 (= e!692841 e!692840)))

(declare-fun c!120214 () Bool)

(assert (=> b!1220172 (= c!120214 (validKeyInArray!0 (select (arr!37984 lt!554576) #b00000000000000000000000000000000)))))

(declare-fun d!133627 () Bool)

(declare-fun res!810499 () Bool)

(declare-fun e!692839 () Bool)

(assert (=> d!133627 (=> res!810499 e!692839)))

(assert (=> d!133627 (= res!810499 (bvsge #b00000000000000000000000000000000 (size!38522 lt!554576)))))

(assert (=> d!133627 (= (arrayNoDuplicates!0 lt!554576 #b00000000000000000000000000000000 Nil!26886) e!692839)))

(declare-fun b!1220173 () Bool)

(assert (=> b!1220173 (= e!692839 e!692841)))

(declare-fun res!810500 () Bool)

(assert (=> b!1220173 (=> (not res!810500) (not e!692841))))

(declare-fun e!692842 () Bool)

(assert (=> b!1220173 (= res!810500 (not e!692842))))

(declare-fun res!810501 () Bool)

(assert (=> b!1220173 (=> (not res!810501) (not e!692842))))

(assert (=> b!1220173 (= res!810501 (validKeyInArray!0 (select (arr!37984 lt!554576) #b00000000000000000000000000000000)))))

(declare-fun b!1220174 () Bool)

(assert (=> b!1220174 (= e!692842 (contains!6992 Nil!26886 (select (arr!37984 lt!554576) #b00000000000000000000000000000000)))))

(declare-fun bm!60681 () Bool)

(assert (=> bm!60681 (= call!60684 (arrayNoDuplicates!0 lt!554576 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120214 (Cons!26885 (select (arr!37984 lt!554576) #b00000000000000000000000000000000) Nil!26886) Nil!26886)))))

(declare-fun b!1220175 () Bool)

(assert (=> b!1220175 (= e!692840 call!60684)))

(assert (= (and d!133627 (not res!810499)) b!1220173))

(assert (= (and b!1220173 res!810501) b!1220174))

(assert (= (and b!1220173 res!810500) b!1220172))

(assert (= (and b!1220172 c!120214) b!1220175))

(assert (= (and b!1220172 (not c!120214)) b!1220171))

(assert (= (or b!1220175 b!1220171) bm!60681))

(declare-fun m!1124561 () Bool)

(assert (=> b!1220172 m!1124561))

(assert (=> b!1220172 m!1124561))

(declare-fun m!1124563 () Bool)

(assert (=> b!1220172 m!1124563))

(assert (=> b!1220173 m!1124561))

(assert (=> b!1220173 m!1124561))

(assert (=> b!1220173 m!1124563))

(assert (=> b!1220174 m!1124561))

(assert (=> b!1220174 m!1124561))

(declare-fun m!1124565 () Bool)

(assert (=> b!1220174 m!1124565))

(assert (=> bm!60681 m!1124561))

(declare-fun m!1124567 () Bool)

(assert (=> bm!60681 m!1124567))

(assert (=> b!1219925 d!133627))

(declare-fun b!1220176 () Bool)

(declare-fun e!692845 () Bool)

(declare-fun e!692844 () Bool)

(assert (=> b!1220176 (= e!692845 e!692844)))

(declare-fun c!120215 () Bool)

(assert (=> b!1220176 (= c!120215 (validKeyInArray!0 (select (arr!37984 lt!554576) #b00000000000000000000000000000000)))))

(declare-fun b!1220177 () Bool)

(declare-fun e!692843 () Bool)

(declare-fun call!60685 () Bool)

(assert (=> b!1220177 (= e!692843 call!60685)))

(declare-fun d!133629 () Bool)

(declare-fun res!810503 () Bool)

(assert (=> d!133629 (=> res!810503 e!692845)))

(assert (=> d!133629 (= res!810503 (bvsge #b00000000000000000000000000000000 (size!38522 lt!554576)))))

(assert (=> d!133629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554576 mask!1564) e!692845)))

(declare-fun b!1220178 () Bool)

(assert (=> b!1220178 (= e!692844 e!692843)))

(declare-fun lt!554724 () (_ BitVec 64))

(assert (=> b!1220178 (= lt!554724 (select (arr!37984 lt!554576) #b00000000000000000000000000000000))))

(declare-fun lt!554726 () Unit!40281)

(assert (=> b!1220178 (= lt!554726 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!554576 lt!554724 #b00000000000000000000000000000000))))

(assert (=> b!1220178 (arrayContainsKey!0 lt!554576 lt!554724 #b00000000000000000000000000000000)))

(declare-fun lt!554725 () Unit!40281)

(assert (=> b!1220178 (= lt!554725 lt!554726)))

(declare-fun res!810502 () Bool)

(assert (=> b!1220178 (= res!810502 (= (seekEntryOrOpen!0 (select (arr!37984 lt!554576) #b00000000000000000000000000000000) lt!554576 mask!1564) (Found!9946 #b00000000000000000000000000000000)))))

(assert (=> b!1220178 (=> (not res!810502) (not e!692843))))

(declare-fun b!1220179 () Bool)

(assert (=> b!1220179 (= e!692844 call!60685)))

(declare-fun bm!60682 () Bool)

(assert (=> bm!60682 (= call!60685 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!554576 mask!1564))))

(assert (= (and d!133629 (not res!810503)) b!1220176))

(assert (= (and b!1220176 c!120215) b!1220178))

(assert (= (and b!1220176 (not c!120215)) b!1220179))

(assert (= (and b!1220178 res!810502) b!1220177))

(assert (= (or b!1220177 b!1220179) bm!60682))

(assert (=> b!1220176 m!1124561))

(assert (=> b!1220176 m!1124561))

(assert (=> b!1220176 m!1124563))

(assert (=> b!1220178 m!1124561))

(declare-fun m!1124569 () Bool)

(assert (=> b!1220178 m!1124569))

(declare-fun m!1124571 () Bool)

(assert (=> b!1220178 m!1124571))

(assert (=> b!1220178 m!1124561))

(declare-fun m!1124573 () Bool)

(assert (=> b!1220178 m!1124573))

(declare-fun m!1124575 () Bool)

(assert (=> bm!60682 m!1124575))

(assert (=> b!1219921 d!133629))

(declare-fun d!133631 () Bool)

(assert (=> d!133631 (= (array_inv!29028 _keys!1208) (bvsge (size!38522 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101476 d!133631))

(declare-fun d!133633 () Bool)

(assert (=> d!133633 (= (array_inv!29029 _values!996) (bvsge (size!38521 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101476 d!133633))

(declare-fun d!133635 () Bool)

(declare-fun e!692848 () Bool)

(assert (=> d!133635 e!692848))

(declare-fun res!810508 () Bool)

(assert (=> d!133635 (=> (not res!810508) (not e!692848))))

(declare-fun lt!554738 () ListLongMap!18077)

(assert (=> d!133635 (= res!810508 (contains!6993 lt!554738 (_1!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579)))))))

(declare-fun lt!554735 () List!26888)

(assert (=> d!133635 (= lt!554738 (ListLongMap!18078 lt!554735))))

(declare-fun lt!554737 () Unit!40281)

(declare-fun lt!554736 () Unit!40281)

(assert (=> d!133635 (= lt!554737 lt!554736)))

(declare-datatypes ((Option!698 0))(
  ( (Some!697 (v!18217 V!46465)) (None!696) )
))
(declare-fun getValueByKey!647 (List!26888 (_ BitVec 64)) Option!698)

(assert (=> d!133635 (= (getValueByKey!647 lt!554735 (_1!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579)))) (Some!697 (_2!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!323 (List!26888 (_ BitVec 64) V!46465) Unit!40281)

(assert (=> d!133635 (= lt!554736 (lemmaContainsTupThenGetReturnValue!323 lt!554735 (_1!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579))) (_2!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579)))))))

(declare-fun insertStrictlySorted!416 (List!26888 (_ BitVec 64) V!46465) List!26888)

(assert (=> d!133635 (= lt!554735 (insertStrictlySorted!416 (toList!9054 lt!554585) (_1!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579))) (_2!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579)))))))

(assert (=> d!133635 (= (+!4120 lt!554585 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579))) lt!554738)))

(declare-fun b!1220184 () Bool)

(declare-fun res!810509 () Bool)

(assert (=> b!1220184 (=> (not res!810509) (not e!692848))))

(assert (=> b!1220184 (= res!810509 (= (getValueByKey!647 (toList!9054 lt!554738) (_1!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579)))) (Some!697 (_2!10065 (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579))))))))

(declare-fun b!1220185 () Bool)

(declare-fun contains!6994 (List!26888 tuple2!20108) Bool)

(assert (=> b!1220185 (= e!692848 (contains!6994 (toList!9054 lt!554738) (tuple2!20109 (select (arr!37984 _keys!1208) from!1455) (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579))))))

(assert (= (and d!133635 res!810508) b!1220184))

(assert (= (and b!1220184 res!810509) b!1220185))

(declare-fun m!1124577 () Bool)

(assert (=> d!133635 m!1124577))

(declare-fun m!1124579 () Bool)

(assert (=> d!133635 m!1124579))

(declare-fun m!1124581 () Bool)

(assert (=> d!133635 m!1124581))

(declare-fun m!1124583 () Bool)

(assert (=> d!133635 m!1124583))

(declare-fun m!1124585 () Bool)

(assert (=> b!1220184 m!1124585))

(declare-fun m!1124587 () Bool)

(assert (=> b!1220185 m!1124587))

(assert (=> b!1219911 d!133635))

(declare-fun d!133637 () Bool)

(declare-fun c!120218 () Bool)

(assert (=> d!133637 (= c!120218 ((_ is ValueCellFull!14792) (select (arr!37983 _values!996) from!1455)))))

(declare-fun e!692851 () V!46465)

(assert (=> d!133637 (= (get!19387 (select (arr!37983 _values!996) from!1455) lt!554579) e!692851)))

(declare-fun b!1220190 () Bool)

(declare-fun get!19389 (ValueCell!14792 V!46465) V!46465)

(assert (=> b!1220190 (= e!692851 (get!19389 (select (arr!37983 _values!996) from!1455) lt!554579))))

(declare-fun b!1220191 () Bool)

(declare-fun get!19390 (ValueCell!14792 V!46465) V!46465)

(assert (=> b!1220191 (= e!692851 (get!19390 (select (arr!37983 _values!996) from!1455) lt!554579))))

(assert (= (and d!133637 c!120218) b!1220190))

(assert (= (and d!133637 (not c!120218)) b!1220191))

(assert (=> b!1220190 m!1124261))

(declare-fun m!1124589 () Bool)

(assert (=> b!1220190 m!1124589))

(assert (=> b!1220191 m!1124261))

(declare-fun m!1124591 () Bool)

(assert (=> b!1220191 m!1124591))

(assert (=> b!1219911 d!133637))

(declare-fun condMapEmpty!48400 () Bool)

(declare-fun mapDefault!48400 () ValueCell!14792)

(assert (=> mapNonEmpty!48391 (= condMapEmpty!48400 (= mapRest!48391 ((as const (Array (_ BitVec 32) ValueCell!14792)) mapDefault!48400)))))

(declare-fun e!692857 () Bool)

(declare-fun mapRes!48400 () Bool)

(assert (=> mapNonEmpty!48391 (= tp!91930 (and e!692857 mapRes!48400))))

(declare-fun b!1220198 () Bool)

(declare-fun e!692856 () Bool)

(assert (=> b!1220198 (= e!692856 tp_is_empty!31003)))

(declare-fun mapNonEmpty!48400 () Bool)

(declare-fun tp!91946 () Bool)

(assert (=> mapNonEmpty!48400 (= mapRes!48400 (and tp!91946 e!692856))))

(declare-fun mapKey!48400 () (_ BitVec 32))

(declare-fun mapValue!48400 () ValueCell!14792)

(declare-fun mapRest!48400 () (Array (_ BitVec 32) ValueCell!14792))

(assert (=> mapNonEmpty!48400 (= mapRest!48391 (store mapRest!48400 mapKey!48400 mapValue!48400))))

(declare-fun mapIsEmpty!48400 () Bool)

(assert (=> mapIsEmpty!48400 mapRes!48400))

(declare-fun b!1220199 () Bool)

(assert (=> b!1220199 (= e!692857 tp_is_empty!31003)))

(assert (= (and mapNonEmpty!48391 condMapEmpty!48400) mapIsEmpty!48400))

(assert (= (and mapNonEmpty!48391 (not condMapEmpty!48400)) mapNonEmpty!48400))

(assert (= (and mapNonEmpty!48400 ((_ is ValueCellFull!14792) mapValue!48400)) b!1220198))

(assert (= (and mapNonEmpty!48391 ((_ is ValueCellFull!14792) mapDefault!48400)) b!1220199))

(declare-fun m!1124593 () Bool)

(assert (=> mapNonEmpty!48400 m!1124593))

(declare-fun b_lambda!22143 () Bool)

(assert (= b_lambda!22141 (or (and start!101476 b_free!26299) b_lambda!22143)))

(declare-fun b_lambda!22145 () Bool)

(assert (= b_lambda!22129 (or (and start!101476 b_free!26299) b_lambda!22145)))

(declare-fun b_lambda!22147 () Bool)

(assert (= b_lambda!22125 (or (and start!101476 b_free!26299) b_lambda!22147)))

(declare-fun b_lambda!22149 () Bool)

(assert (= b_lambda!22133 (or (and start!101476 b_free!26299) b_lambda!22149)))

(declare-fun b_lambda!22151 () Bool)

(assert (= b_lambda!22135 (or (and start!101476 b_free!26299) b_lambda!22151)))

(declare-fun b_lambda!22153 () Bool)

(assert (= b_lambda!22131 (or (and start!101476 b_free!26299) b_lambda!22153)))

(declare-fun b_lambda!22155 () Bool)

(assert (= b_lambda!22139 (or (and start!101476 b_free!26299) b_lambda!22155)))

(declare-fun b_lambda!22157 () Bool)

(assert (= b_lambda!22127 (or (and start!101476 b_free!26299) b_lambda!22157)))

(declare-fun b_lambda!22159 () Bool)

(assert (= b_lambda!22137 (or (and start!101476 b_free!26299) b_lambda!22159)))

(check-sat (not bm!60676) (not b!1220065) (not bm!60682) (not b!1220067) (not b!1220147) (not b!1220132) (not d!133609) (not b!1220176) (not bm!60677) (not b!1220109) (not b!1220185) (not b!1220128) (not d!133617) (not b!1220072) (not b!1220119) (not b!1220136) (not bm!60681) (not b_lambda!22151) (not b!1220107) (not b!1220108) (not b!1220114) (not b!1220104) (not d!133595) (not b_lambda!22143) (not b!1220148) (not b_lambda!22157) (not bm!60675) (not b!1220153) (not bm!60670) (not d!133621) (not b!1220134) (not bm!60664) (not bm!60668) (not b!1220174) (not b!1220074) (not b!1220121) (not b!1220152) (not b!1220122) (not bm!60665) (not b!1220073) (not b!1220190) (not mapNonEmpty!48400) b_and!43797 (not b!1220149) (not d!133613) (not b!1220124) (not b!1220191) (not b!1220154) (not b!1220120) (not b!1220115) (not b!1220102) (not b_next!26299) (not b_lambda!22159) (not bm!60669) (not b!1220184) (not d!133605) (not b!1220116) (not bm!60680) (not b_lambda!22153) (not b!1220077) (not d!133611) (not d!133615) (not b!1220172) (not b_lambda!22145) (not d!133635) (not b!1220110) (not b!1220126) (not b_lambda!22155) (not b!1220112) (not b!1220157) tp_is_empty!31003 (not b!1220066) (not b!1220127) (not b_lambda!22149) (not b!1220131) (not b!1220167) (not b!1220145) (not b!1220178) (not b_lambda!22123) (not b!1220133) (not b!1220169) (not b!1220155) (not b!1220053) (not b_lambda!22147) (not d!133623) (not b!1220173) (not b!1220070) (not b!1220103))
(check-sat b_and!43797 (not b_next!26299))
