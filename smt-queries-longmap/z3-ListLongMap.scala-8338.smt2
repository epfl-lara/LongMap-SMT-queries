; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101484 () Bool)

(assert start!101484)

(declare-fun b_free!26301 () Bool)

(declare-fun b_next!26301 () Bool)

(assert (=> start!101484 (= b_free!26301 (not b_next!26301))))

(declare-fun tp!91937 () Bool)

(declare-fun b_and!43791 () Bool)

(assert (=> start!101484 (= tp!91937 b_and!43791)))

(declare-fun b!1220077 () Bool)

(declare-fun e!692785 () Bool)

(declare-fun e!692777 () Bool)

(assert (=> b!1220077 (= e!692785 e!692777)))

(declare-fun res!810446 () Bool)

(assert (=> b!1220077 (=> res!810446 e!692777)))

(declare-datatypes ((array!78787 0))(
  ( (array!78788 (arr!38024 (Array (_ BitVec 32) (_ BitVec 64))) (size!38560 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78787)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220077 (= res!810446 (not (= (select (arr!38024 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220078 () Bool)

(declare-fun res!810443 () Bool)

(declare-fun e!692783 () Bool)

(assert (=> b!1220078 (=> (not res!810443) (not e!692783))))

(declare-fun lt!554795 () array!78787)

(declare-datatypes ((List!26828 0))(
  ( (Nil!26825) (Cons!26824 (h!28033 (_ BitVec 64)) (t!40109 List!26828)) )
))
(declare-fun arrayNoDuplicates!0 (array!78787 (_ BitVec 32) List!26828) Bool)

(assert (=> b!1220078 (= res!810443 (arrayNoDuplicates!0 lt!554795 #b00000000000000000000000000000000 Nil!26825))))

(declare-fun b!1220079 () Bool)

(declare-fun e!692778 () Bool)

(declare-fun e!692780 () Bool)

(assert (=> b!1220079 (= e!692778 e!692780)))

(declare-fun res!810444 () Bool)

(assert (=> b!1220079 (=> res!810444 e!692780)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1220079 (= res!810444 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46467 0))(
  ( (V!46468 (val!15559 Int)) )
))
(declare-fun zeroValue!944 () V!46467)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14793 0))(
  ( (ValueCellFull!14793 (v!18216 V!46467)) (EmptyCell!14793) )
))
(declare-datatypes ((array!78789 0))(
  ( (array!78790 (arr!38025 (Array (_ BitVec 32) ValueCell!14793)) (size!38561 (_ BitVec 32))) )
))
(declare-fun lt!554802 () array!78789)

(declare-fun minValue!944 () V!46467)

(declare-datatypes ((tuple2!20028 0))(
  ( (tuple2!20029 (_1!10025 (_ BitVec 64)) (_2!10025 V!46467)) )
))
(declare-datatypes ((List!26829 0))(
  ( (Nil!26826) (Cons!26825 (h!28034 tuple2!20028) (t!40110 List!26829)) )
))
(declare-datatypes ((ListLongMap!17997 0))(
  ( (ListLongMap!17998 (toList!9014 List!26829)) )
))
(declare-fun lt!554796 () ListLongMap!17997)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5437 (array!78787 array!78789 (_ BitVec 32) (_ BitVec 32) V!46467 V!46467 (_ BitVec 32) Int) ListLongMap!17997)

(assert (=> b!1220079 (= lt!554796 (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78789)

(declare-fun lt!554797 () V!46467)

(assert (=> b!1220079 (= lt!554802 (array!78790 (store (arr!38025 _values!996) i!673 (ValueCellFull!14793 lt!554797)) (size!38561 _values!996)))))

(declare-fun dynLambda!3319 (Int (_ BitVec 64)) V!46467)

(assert (=> b!1220079 (= lt!554797 (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554800 () ListLongMap!17997)

(assert (=> b!1220079 (= lt!554800 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220080 () Bool)

(declare-fun res!810455 () Bool)

(declare-fun e!692782 () Bool)

(assert (=> b!1220080 (=> (not res!810455) (not e!692782))))

(assert (=> b!1220080 (= res!810455 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38560 _keys!1208))))))

(declare-fun b!1220081 () Bool)

(declare-fun res!810456 () Bool)

(assert (=> b!1220081 (=> (not res!810456) (not e!692782))))

(assert (=> b!1220081 (= res!810456 (and (= (size!38561 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38560 _keys!1208) (size!38561 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220082 () Bool)

(declare-fun res!810442 () Bool)

(assert (=> b!1220082 (=> (not res!810442) (not e!692782))))

(assert (=> b!1220082 (= res!810442 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26825))))

(declare-fun b!1220083 () Bool)

(declare-fun e!692779 () Bool)

(declare-fun tp_is_empty!31005 () Bool)

(assert (=> b!1220083 (= e!692779 tp_is_empty!31005)))

(declare-fun b!1220084 () Bool)

(declare-fun res!810451 () Bool)

(assert (=> b!1220084 (=> (not res!810451) (not e!692782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220084 (= res!810451 (validMask!0 mask!1564))))

(declare-fun b!1220086 () Bool)

(declare-fun res!810448 () Bool)

(assert (=> b!1220086 (=> (not res!810448) (not e!692782))))

(assert (=> b!1220086 (= res!810448 (= (select (arr!38024 _keys!1208) i!673) k0!934))))

(declare-fun b!1220087 () Bool)

(declare-fun e!692788 () Bool)

(declare-fun e!692787 () Bool)

(declare-fun mapRes!48394 () Bool)

(assert (=> b!1220087 (= e!692788 (and e!692787 mapRes!48394))))

(declare-fun condMapEmpty!48394 () Bool)

(declare-fun mapDefault!48394 () ValueCell!14793)

(assert (=> b!1220087 (= condMapEmpty!48394 (= (arr!38025 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14793)) mapDefault!48394)))))

(declare-fun b!1220088 () Bool)

(assert (=> b!1220088 (= e!692783 (not e!692778))))

(declare-fun res!810452 () Bool)

(assert (=> b!1220088 (=> res!810452 e!692778)))

(assert (=> b!1220088 (= res!810452 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220088 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40430 0))(
  ( (Unit!40431) )
))
(declare-fun lt!554793 () Unit!40430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78787 (_ BitVec 64) (_ BitVec 32)) Unit!40430)

(assert (=> b!1220088 (= lt!554793 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220089 () Bool)

(declare-fun res!810447 () Bool)

(assert (=> b!1220089 (=> (not res!810447) (not e!692782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220089 (= res!810447 (validKeyInArray!0 k0!934))))

(declare-fun b!1220090 () Bool)

(assert (=> b!1220090 (= e!692782 e!692783)))

(declare-fun res!810453 () Bool)

(assert (=> b!1220090 (=> (not res!810453) (not e!692783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78787 (_ BitVec 32)) Bool)

(assert (=> b!1220090 (= res!810453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554795 mask!1564))))

(assert (=> b!1220090 (= lt!554795 (array!78788 (store (arr!38024 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38560 _keys!1208)))))

(declare-fun b!1220091 () Bool)

(declare-fun res!810441 () Bool)

(assert (=> b!1220091 (=> (not res!810441) (not e!692782))))

(assert (=> b!1220091 (= res!810441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!810450 () Bool)

(assert (=> start!101484 (=> (not res!810450) (not e!692782))))

(assert (=> start!101484 (= res!810450 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38560 _keys!1208))))))

(assert (=> start!101484 e!692782))

(assert (=> start!101484 tp_is_empty!31005))

(declare-fun array_inv!28936 (array!78787) Bool)

(assert (=> start!101484 (array_inv!28936 _keys!1208)))

(assert (=> start!101484 true))

(assert (=> start!101484 tp!91937))

(declare-fun array_inv!28937 (array!78789) Bool)

(assert (=> start!101484 (and (array_inv!28937 _values!996) e!692788)))

(declare-fun b!1220085 () Bool)

(assert (=> b!1220085 (= e!692787 tp_is_empty!31005)))

(declare-fun b!1220092 () Bool)

(assert (=> b!1220092 (= e!692777 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48394 () Bool)

(assert (=> mapIsEmpty!48394 mapRes!48394))

(declare-fun b!1220093 () Bool)

(declare-fun e!692784 () Bool)

(assert (=> b!1220093 (= e!692784 (bvslt (size!38560 _keys!1208) #b01111111111111111111111111111111))))

(assert (=> b!1220093 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26825)))

(declare-fun lt!554799 () Unit!40430)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78787 (_ BitVec 32) (_ BitVec 32)) Unit!40430)

(assert (=> b!1220093 (= lt!554799 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220093 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554791 () Unit!40430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78787 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40430)

(assert (=> b!1220093 (= lt!554791 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220094 () Bool)

(declare-fun e!692781 () Bool)

(assert (=> b!1220094 (= e!692781 e!692784)))

(declare-fun res!810454 () Bool)

(assert (=> b!1220094 (=> res!810454 e!692784)))

(assert (=> b!1220094 (= res!810454 (not (= (select (arr!38024 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1220094 e!692785))

(declare-fun res!810449 () Bool)

(assert (=> b!1220094 (=> (not res!810449) (not e!692785))))

(declare-fun lt!554801 () ListLongMap!17997)

(declare-fun +!4082 (ListLongMap!17997 tuple2!20028) ListLongMap!17997)

(declare-fun get!19397 (ValueCell!14793 V!46467) V!46467)

(assert (=> b!1220094 (= res!810449 (= lt!554796 (+!4082 lt!554801 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797)))))))

(declare-fun mapNonEmpty!48394 () Bool)

(declare-fun tp!91936 () Bool)

(assert (=> mapNonEmpty!48394 (= mapRes!48394 (and tp!91936 e!692779))))

(declare-fun mapValue!48394 () ValueCell!14793)

(declare-fun mapKey!48394 () (_ BitVec 32))

(declare-fun mapRest!48394 () (Array (_ BitVec 32) ValueCell!14793))

(assert (=> mapNonEmpty!48394 (= (arr!38025 _values!996) (store mapRest!48394 mapKey!48394 mapValue!48394))))

(declare-fun b!1220095 () Bool)

(assert (=> b!1220095 (= e!692780 e!692781)))

(declare-fun res!810445 () Bool)

(assert (=> b!1220095 (=> res!810445 e!692781)))

(assert (=> b!1220095 (= res!810445 (not (validKeyInArray!0 (select (arr!38024 _keys!1208) from!1455))))))

(declare-fun lt!554792 () ListLongMap!17997)

(assert (=> b!1220095 (= lt!554792 lt!554801)))

(declare-fun lt!554794 () ListLongMap!17997)

(declare-fun -!1923 (ListLongMap!17997 (_ BitVec 64)) ListLongMap!17997)

(assert (=> b!1220095 (= lt!554801 (-!1923 lt!554794 k0!934))))

(assert (=> b!1220095 (= lt!554792 (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220095 (= lt!554794 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554798 () Unit!40430)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1130 (array!78787 array!78789 (_ BitVec 32) (_ BitVec 32) V!46467 V!46467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40430)

(assert (=> b!1220095 (= lt!554798 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!101484 res!810450) b!1220084))

(assert (= (and b!1220084 res!810451) b!1220081))

(assert (= (and b!1220081 res!810456) b!1220091))

(assert (= (and b!1220091 res!810441) b!1220082))

(assert (= (and b!1220082 res!810442) b!1220080))

(assert (= (and b!1220080 res!810455) b!1220089))

(assert (= (and b!1220089 res!810447) b!1220086))

(assert (= (and b!1220086 res!810448) b!1220090))

(assert (= (and b!1220090 res!810453) b!1220078))

(assert (= (and b!1220078 res!810443) b!1220088))

(assert (= (and b!1220088 (not res!810452)) b!1220079))

(assert (= (and b!1220079 (not res!810444)) b!1220095))

(assert (= (and b!1220095 (not res!810445)) b!1220094))

(assert (= (and b!1220094 res!810449) b!1220077))

(assert (= (and b!1220077 (not res!810446)) b!1220092))

(assert (= (and b!1220094 (not res!810454)) b!1220093))

(assert (= (and b!1220087 condMapEmpty!48394) mapIsEmpty!48394))

(assert (= (and b!1220087 (not condMapEmpty!48394)) mapNonEmpty!48394))

(get-info :version)

(assert (= (and mapNonEmpty!48394 ((_ is ValueCellFull!14793) mapValue!48394)) b!1220083))

(assert (= (and b!1220087 ((_ is ValueCellFull!14793) mapDefault!48394)) b!1220085))

(assert (= start!101484 b!1220087))

(declare-fun b_lambda!22129 () Bool)

(assert (=> (not b_lambda!22129) (not b!1220079)))

(declare-fun t!40108 () Bool)

(declare-fun tb!11101 () Bool)

(assert (=> (and start!101484 (= defaultEntry!1004 defaultEntry!1004) t!40108) tb!11101))

(declare-fun result!22807 () Bool)

(assert (=> tb!11101 (= result!22807 tp_is_empty!31005)))

(assert (=> b!1220079 t!40108))

(declare-fun b_and!43793 () Bool)

(assert (= b_and!43791 (and (=> t!40108 result!22807) b_and!43793)))

(declare-fun m!1124851 () Bool)

(assert (=> b!1220094 m!1124851))

(declare-fun m!1124853 () Bool)

(assert (=> b!1220094 m!1124853))

(assert (=> b!1220094 m!1124853))

(declare-fun m!1124855 () Bool)

(assert (=> b!1220094 m!1124855))

(declare-fun m!1124857 () Bool)

(assert (=> b!1220094 m!1124857))

(declare-fun m!1124859 () Bool)

(assert (=> start!101484 m!1124859))

(declare-fun m!1124861 () Bool)

(assert (=> start!101484 m!1124861))

(declare-fun m!1124863 () Bool)

(assert (=> b!1220093 m!1124863))

(declare-fun m!1124865 () Bool)

(assert (=> b!1220093 m!1124865))

(declare-fun m!1124867 () Bool)

(assert (=> b!1220093 m!1124867))

(declare-fun m!1124869 () Bool)

(assert (=> b!1220093 m!1124869))

(declare-fun m!1124871 () Bool)

(assert (=> mapNonEmpty!48394 m!1124871))

(declare-fun m!1124873 () Bool)

(assert (=> b!1220078 m!1124873))

(declare-fun m!1124875 () Bool)

(assert (=> b!1220089 m!1124875))

(declare-fun m!1124877 () Bool)

(assert (=> b!1220086 m!1124877))

(declare-fun m!1124879 () Bool)

(assert (=> b!1220082 m!1124879))

(declare-fun m!1124881 () Bool)

(assert (=> b!1220088 m!1124881))

(declare-fun m!1124883 () Bool)

(assert (=> b!1220088 m!1124883))

(declare-fun m!1124885 () Bool)

(assert (=> b!1220092 m!1124885))

(assert (=> b!1220077 m!1124851))

(declare-fun m!1124887 () Bool)

(assert (=> b!1220079 m!1124887))

(declare-fun m!1124889 () Bool)

(assert (=> b!1220079 m!1124889))

(declare-fun m!1124891 () Bool)

(assert (=> b!1220079 m!1124891))

(declare-fun m!1124893 () Bool)

(assert (=> b!1220079 m!1124893))

(declare-fun m!1124895 () Bool)

(assert (=> b!1220091 m!1124895))

(declare-fun m!1124897 () Bool)

(assert (=> b!1220084 m!1124897))

(declare-fun m!1124899 () Bool)

(assert (=> b!1220095 m!1124899))

(declare-fun m!1124901 () Bool)

(assert (=> b!1220095 m!1124901))

(declare-fun m!1124903 () Bool)

(assert (=> b!1220095 m!1124903))

(declare-fun m!1124905 () Bool)

(assert (=> b!1220095 m!1124905))

(assert (=> b!1220095 m!1124851))

(declare-fun m!1124907 () Bool)

(assert (=> b!1220095 m!1124907))

(assert (=> b!1220095 m!1124851))

(declare-fun m!1124909 () Bool)

(assert (=> b!1220090 m!1124909))

(declare-fun m!1124911 () Bool)

(assert (=> b!1220090 m!1124911))

(check-sat (not b_lambda!22129) (not b!1220091) (not b_next!26301) tp_is_empty!31005 b_and!43793 (not b!1220095) (not b!1220084) (not b!1220082) (not b!1220094) (not start!101484) (not b!1220088) (not b!1220078) (not mapNonEmpty!48394) (not b!1220090) (not b!1220089) (not b!1220093) (not b!1220092) (not b!1220079))
(check-sat b_and!43793 (not b_next!26301))
(get-model)

(declare-fun b_lambda!22133 () Bool)

(assert (= b_lambda!22129 (or (and start!101484 b_free!26301) b_lambda!22133)))

(check-sat (not b!1220091) (not b_next!26301) tp_is_empty!31005 b_and!43793 (not b!1220095) (not b!1220084) (not b!1220082) (not b!1220094) (not b!1220088) (not b!1220078) (not mapNonEmpty!48394) (not b!1220090) (not b!1220089) (not b!1220093) (not b!1220092) (not b!1220079) (not b_lambda!22133) (not start!101484))
(check-sat b_and!43793 (not b_next!26301))
(get-model)

(declare-fun b!1220167 () Bool)

(declare-fun e!692835 () Bool)

(declare-fun call!60689 () Bool)

(assert (=> b!1220167 (= e!692835 call!60689)))

(declare-fun b!1220168 () Bool)

(declare-fun e!692836 () Bool)

(declare-fun e!692833 () Bool)

(assert (=> b!1220168 (= e!692836 e!692833)))

(declare-fun res!810513 () Bool)

(assert (=> b!1220168 (=> (not res!810513) (not e!692833))))

(declare-fun e!692834 () Bool)

(assert (=> b!1220168 (= res!810513 (not e!692834))))

(declare-fun res!810511 () Bool)

(assert (=> b!1220168 (=> (not res!810511) (not e!692834))))

(assert (=> b!1220168 (= res!810511 (validKeyInArray!0 (select (arr!38024 lt!554795) #b00000000000000000000000000000000)))))

(declare-fun bm!60686 () Bool)

(declare-fun c!120203 () Bool)

(assert (=> bm!60686 (= call!60689 (arrayNoDuplicates!0 lt!554795 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120203 (Cons!26824 (select (arr!38024 lt!554795) #b00000000000000000000000000000000) Nil!26825) Nil!26825)))))

(declare-fun b!1220169 () Bool)

(declare-fun contains!7017 (List!26828 (_ BitVec 64)) Bool)

(assert (=> b!1220169 (= e!692834 (contains!7017 Nil!26825 (select (arr!38024 lt!554795) #b00000000000000000000000000000000)))))

(declare-fun d!133739 () Bool)

(declare-fun res!810512 () Bool)

(assert (=> d!133739 (=> res!810512 e!692836)))

(assert (=> d!133739 (= res!810512 (bvsge #b00000000000000000000000000000000 (size!38560 lt!554795)))))

(assert (=> d!133739 (= (arrayNoDuplicates!0 lt!554795 #b00000000000000000000000000000000 Nil!26825) e!692836)))

(declare-fun b!1220170 () Bool)

(assert (=> b!1220170 (= e!692833 e!692835)))

(assert (=> b!1220170 (= c!120203 (validKeyInArray!0 (select (arr!38024 lt!554795) #b00000000000000000000000000000000)))))

(declare-fun b!1220171 () Bool)

(assert (=> b!1220171 (= e!692835 call!60689)))

(assert (= (and d!133739 (not res!810512)) b!1220168))

(assert (= (and b!1220168 res!810511) b!1220169))

(assert (= (and b!1220168 res!810513) b!1220170))

(assert (= (and b!1220170 c!120203) b!1220171))

(assert (= (and b!1220170 (not c!120203)) b!1220167))

(assert (= (or b!1220171 b!1220167) bm!60686))

(declare-fun m!1124975 () Bool)

(assert (=> b!1220168 m!1124975))

(assert (=> b!1220168 m!1124975))

(declare-fun m!1124977 () Bool)

(assert (=> b!1220168 m!1124977))

(assert (=> bm!60686 m!1124975))

(declare-fun m!1124979 () Bool)

(assert (=> bm!60686 m!1124979))

(assert (=> b!1220169 m!1124975))

(assert (=> b!1220169 m!1124975))

(declare-fun m!1124981 () Bool)

(assert (=> b!1220169 m!1124981))

(assert (=> b!1220170 m!1124975))

(assert (=> b!1220170 m!1124975))

(assert (=> b!1220170 m!1124977))

(assert (=> b!1220078 d!133739))

(declare-fun d!133741 () Bool)

(assert (=> d!133741 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1220089 d!133741))

(declare-fun d!133743 () Bool)

(declare-fun res!810518 () Bool)

(declare-fun e!692841 () Bool)

(assert (=> d!133743 (=> res!810518 e!692841)))

(assert (=> d!133743 (= res!810518 (= (select (arr!38024 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!133743 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!692841)))

(declare-fun b!1220176 () Bool)

(declare-fun e!692842 () Bool)

(assert (=> b!1220176 (= e!692841 e!692842)))

(declare-fun res!810519 () Bool)

(assert (=> b!1220176 (=> (not res!810519) (not e!692842))))

(assert (=> b!1220176 (= res!810519 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!38560 _keys!1208)))))

(declare-fun b!1220177 () Bool)

(assert (=> b!1220177 (= e!692842 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!133743 (not res!810518)) b!1220176))

(assert (= (and b!1220176 res!810519) b!1220177))

(declare-fun m!1124983 () Bool)

(assert (=> d!133743 m!1124983))

(declare-fun m!1124985 () Bool)

(assert (=> b!1220177 m!1124985))

(assert (=> b!1220088 d!133743))

(declare-fun d!133745 () Bool)

(assert (=> d!133745 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554841 () Unit!40430)

(declare-fun choose!13 (array!78787 (_ BitVec 64) (_ BitVec 32)) Unit!40430)

(assert (=> d!133745 (= lt!554841 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!133745 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133745 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!554841)))

(declare-fun bs!34357 () Bool)

(assert (= bs!34357 d!133745))

(assert (=> bs!34357 m!1124881))

(declare-fun m!1124987 () Bool)

(assert (=> bs!34357 m!1124987))

(assert (=> b!1220088 d!133745))

(declare-fun d!133747 () Bool)

(assert (=> d!133747 (= (array_inv!28936 _keys!1208) (bvsge (size!38560 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!101484 d!133747))

(declare-fun d!133749 () Bool)

(assert (=> d!133749 (= (array_inv!28937 _values!996) (bvsge (size!38561 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!101484 d!133749))

(declare-fun d!133751 () Bool)

(declare-fun res!810524 () Bool)

(declare-fun e!692851 () Bool)

(assert (=> d!133751 (=> res!810524 e!692851)))

(assert (=> d!133751 (= res!810524 (bvsge #b00000000000000000000000000000000 (size!38560 _keys!1208)))))

(assert (=> d!133751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!692851)))

(declare-fun bm!60689 () Bool)

(declare-fun call!60692 () Bool)

(assert (=> bm!60689 (= call!60692 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1220186 () Bool)

(declare-fun e!692850 () Bool)

(declare-fun e!692849 () Bool)

(assert (=> b!1220186 (= e!692850 e!692849)))

(declare-fun lt!554848 () (_ BitVec 64))

(assert (=> b!1220186 (= lt!554848 (select (arr!38024 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!554850 () Unit!40430)

(assert (=> b!1220186 (= lt!554850 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!554848 #b00000000000000000000000000000000))))

(assert (=> b!1220186 (arrayContainsKey!0 _keys!1208 lt!554848 #b00000000000000000000000000000000)))

(declare-fun lt!554849 () Unit!40430)

(assert (=> b!1220186 (= lt!554849 lt!554850)))

(declare-fun res!810525 () Bool)

(declare-datatypes ((SeekEntryResult!9947 0))(
  ( (MissingZero!9947 (index!42159 (_ BitVec 32))) (Found!9947 (index!42160 (_ BitVec 32))) (Intermediate!9947 (undefined!10759 Bool) (index!42161 (_ BitVec 32)) (x!107476 (_ BitVec 32))) (Undefined!9947) (MissingVacant!9947 (index!42162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!78787 (_ BitVec 32)) SeekEntryResult!9947)

(assert (=> b!1220186 (= res!810525 (= (seekEntryOrOpen!0 (select (arr!38024 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9947 #b00000000000000000000000000000000)))))

(assert (=> b!1220186 (=> (not res!810525) (not e!692849))))

(declare-fun b!1220187 () Bool)

(assert (=> b!1220187 (= e!692851 e!692850)))

(declare-fun c!120206 () Bool)

(assert (=> b!1220187 (= c!120206 (validKeyInArray!0 (select (arr!38024 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1220188 () Bool)

(assert (=> b!1220188 (= e!692849 call!60692)))

(declare-fun b!1220189 () Bool)

(assert (=> b!1220189 (= e!692850 call!60692)))

(assert (= (and d!133751 (not res!810524)) b!1220187))

(assert (= (and b!1220187 c!120206) b!1220186))

(assert (= (and b!1220187 (not c!120206)) b!1220189))

(assert (= (and b!1220186 res!810525) b!1220188))

(assert (= (or b!1220188 b!1220189) bm!60689))

(declare-fun m!1124989 () Bool)

(assert (=> bm!60689 m!1124989))

(assert (=> b!1220186 m!1124983))

(declare-fun m!1124991 () Bool)

(assert (=> b!1220186 m!1124991))

(declare-fun m!1124993 () Bool)

(assert (=> b!1220186 m!1124993))

(assert (=> b!1220186 m!1124983))

(declare-fun m!1124995 () Bool)

(assert (=> b!1220186 m!1124995))

(assert (=> b!1220187 m!1124983))

(assert (=> b!1220187 m!1124983))

(declare-fun m!1124997 () Bool)

(assert (=> b!1220187 m!1124997))

(assert (=> b!1220091 d!133751))

(declare-fun d!133753 () Bool)

(declare-fun res!810526 () Bool)

(declare-fun e!692854 () Bool)

(assert (=> d!133753 (=> res!810526 e!692854)))

(assert (=> d!133753 (= res!810526 (bvsge #b00000000000000000000000000000000 (size!38560 lt!554795)))))

(assert (=> d!133753 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554795 mask!1564) e!692854)))

(declare-fun bm!60690 () Bool)

(declare-fun call!60693 () Bool)

(assert (=> bm!60690 (= call!60693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!554795 mask!1564))))

(declare-fun b!1220190 () Bool)

(declare-fun e!692853 () Bool)

(declare-fun e!692852 () Bool)

(assert (=> b!1220190 (= e!692853 e!692852)))

(declare-fun lt!554851 () (_ BitVec 64))

(assert (=> b!1220190 (= lt!554851 (select (arr!38024 lt!554795) #b00000000000000000000000000000000))))

(declare-fun lt!554853 () Unit!40430)

(assert (=> b!1220190 (= lt!554853 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!554795 lt!554851 #b00000000000000000000000000000000))))

(assert (=> b!1220190 (arrayContainsKey!0 lt!554795 lt!554851 #b00000000000000000000000000000000)))

(declare-fun lt!554852 () Unit!40430)

(assert (=> b!1220190 (= lt!554852 lt!554853)))

(declare-fun res!810527 () Bool)

(assert (=> b!1220190 (= res!810527 (= (seekEntryOrOpen!0 (select (arr!38024 lt!554795) #b00000000000000000000000000000000) lt!554795 mask!1564) (Found!9947 #b00000000000000000000000000000000)))))

(assert (=> b!1220190 (=> (not res!810527) (not e!692852))))

(declare-fun b!1220191 () Bool)

(assert (=> b!1220191 (= e!692854 e!692853)))

(declare-fun c!120207 () Bool)

(assert (=> b!1220191 (= c!120207 (validKeyInArray!0 (select (arr!38024 lt!554795) #b00000000000000000000000000000000)))))

(declare-fun b!1220192 () Bool)

(assert (=> b!1220192 (= e!692852 call!60693)))

(declare-fun b!1220193 () Bool)

(assert (=> b!1220193 (= e!692853 call!60693)))

(assert (= (and d!133753 (not res!810526)) b!1220191))

(assert (= (and b!1220191 c!120207) b!1220190))

(assert (= (and b!1220191 (not c!120207)) b!1220193))

(assert (= (and b!1220190 res!810527) b!1220192))

(assert (= (or b!1220192 b!1220193) bm!60690))

(declare-fun m!1124999 () Bool)

(assert (=> bm!60690 m!1124999))

(assert (=> b!1220190 m!1124975))

(declare-fun m!1125001 () Bool)

(assert (=> b!1220190 m!1125001))

(declare-fun m!1125003 () Bool)

(assert (=> b!1220190 m!1125003))

(assert (=> b!1220190 m!1124975))

(declare-fun m!1125005 () Bool)

(assert (=> b!1220190 m!1125005))

(assert (=> b!1220191 m!1124975))

(assert (=> b!1220191 m!1124975))

(assert (=> b!1220191 m!1124977))

(assert (=> b!1220090 d!133753))

(declare-fun d!133755 () Bool)

(declare-fun e!692871 () Bool)

(assert (=> d!133755 e!692871))

(declare-fun res!810538 () Bool)

(assert (=> d!133755 (=> (not res!810538) (not e!692871))))

(declare-fun lt!554868 () ListLongMap!17997)

(declare-fun contains!7018 (ListLongMap!17997 (_ BitVec 64)) Bool)

(assert (=> d!133755 (= res!810538 (not (contains!7018 lt!554868 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692869 () ListLongMap!17997)

(assert (=> d!133755 (= lt!554868 e!692869)))

(declare-fun c!120217 () Bool)

(assert (=> d!133755 (= c!120217 (bvsge from!1455 (size!38560 lt!554795)))))

(assert (=> d!133755 (validMask!0 mask!1564)))

(assert (=> d!133755 (= (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554868)))

(declare-fun e!692872 () Bool)

(declare-fun b!1220218 () Bool)

(assert (=> b!1220218 (= e!692872 (= lt!554868 (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220219 () Bool)

(declare-fun res!810537 () Bool)

(assert (=> b!1220219 (=> (not res!810537) (not e!692871))))

(assert (=> b!1220219 (= res!810537 (not (contains!7018 lt!554868 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220220 () Bool)

(declare-fun e!692875 () ListLongMap!17997)

(declare-fun call!60696 () ListLongMap!17997)

(assert (=> b!1220220 (= e!692875 call!60696)))

(declare-fun b!1220221 () Bool)

(declare-fun isEmpty!998 (ListLongMap!17997) Bool)

(assert (=> b!1220221 (= e!692872 (isEmpty!998 lt!554868))))

(declare-fun b!1220222 () Bool)

(declare-fun e!692870 () Bool)

(declare-fun e!692874 () Bool)

(assert (=> b!1220222 (= e!692870 e!692874)))

(assert (=> b!1220222 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38560 lt!554795)))))

(declare-fun res!810536 () Bool)

(assert (=> b!1220222 (= res!810536 (contains!7018 lt!554868 (select (arr!38024 lt!554795) from!1455)))))

(assert (=> b!1220222 (=> (not res!810536) (not e!692874))))

(declare-fun b!1220223 () Bool)

(assert (=> b!1220223 (= e!692871 e!692870)))

(declare-fun c!120218 () Bool)

(declare-fun e!692873 () Bool)

(assert (=> b!1220223 (= c!120218 e!692873)))

(declare-fun res!810539 () Bool)

(assert (=> b!1220223 (=> (not res!810539) (not e!692873))))

(assert (=> b!1220223 (= res!810539 (bvslt from!1455 (size!38560 lt!554795)))))

(declare-fun b!1220224 () Bool)

(assert (=> b!1220224 (= e!692873 (validKeyInArray!0 (select (arr!38024 lt!554795) from!1455)))))

(assert (=> b!1220224 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1220225 () Bool)

(declare-fun lt!554874 () Unit!40430)

(declare-fun lt!554871 () Unit!40430)

(assert (=> b!1220225 (= lt!554874 lt!554871)))

(declare-fun lt!554873 () (_ BitVec 64))

(declare-fun lt!554869 () (_ BitVec 64))

(declare-fun lt!554872 () ListLongMap!17997)

(declare-fun lt!554870 () V!46467)

(assert (=> b!1220225 (not (contains!7018 (+!4082 lt!554872 (tuple2!20029 lt!554869 lt!554870)) lt!554873))))

(declare-fun addStillNotContains!302 (ListLongMap!17997 (_ BitVec 64) V!46467 (_ BitVec 64)) Unit!40430)

(assert (=> b!1220225 (= lt!554871 (addStillNotContains!302 lt!554872 lt!554869 lt!554870 lt!554873))))

(assert (=> b!1220225 (= lt!554873 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220225 (= lt!554870 (get!19397 (select (arr!38025 lt!554802) from!1455) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220225 (= lt!554869 (select (arr!38024 lt!554795) from!1455))))

(assert (=> b!1220225 (= lt!554872 call!60696)))

(assert (=> b!1220225 (= e!692875 (+!4082 call!60696 (tuple2!20029 (select (arr!38024 lt!554795) from!1455) (get!19397 (select (arr!38025 lt!554802) from!1455) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220226 () Bool)

(assert (=> b!1220226 (= e!692870 e!692872)))

(declare-fun c!120216 () Bool)

(assert (=> b!1220226 (= c!120216 (bvslt from!1455 (size!38560 lt!554795)))))

(declare-fun b!1220227 () Bool)

(assert (=> b!1220227 (= e!692869 (ListLongMap!17998 Nil!26826))))

(declare-fun b!1220228 () Bool)

(assert (=> b!1220228 (= e!692869 e!692875)))

(declare-fun c!120219 () Bool)

(assert (=> b!1220228 (= c!120219 (validKeyInArray!0 (select (arr!38024 lt!554795) from!1455)))))

(declare-fun bm!60693 () Bool)

(assert (=> bm!60693 (= call!60696 (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1220229 () Bool)

(assert (=> b!1220229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38560 lt!554795)))))

(assert (=> b!1220229 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38561 lt!554802)))))

(declare-fun apply!974 (ListLongMap!17997 (_ BitVec 64)) V!46467)

(assert (=> b!1220229 (= e!692874 (= (apply!974 lt!554868 (select (arr!38024 lt!554795) from!1455)) (get!19397 (select (arr!38025 lt!554802) from!1455) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133755 c!120217) b!1220227))

(assert (= (and d!133755 (not c!120217)) b!1220228))

(assert (= (and b!1220228 c!120219) b!1220225))

(assert (= (and b!1220228 (not c!120219)) b!1220220))

(assert (= (or b!1220225 b!1220220) bm!60693))

(assert (= (and d!133755 res!810538) b!1220219))

(assert (= (and b!1220219 res!810537) b!1220223))

(assert (= (and b!1220223 res!810539) b!1220224))

(assert (= (and b!1220223 c!120218) b!1220222))

(assert (= (and b!1220223 (not c!120218)) b!1220226))

(assert (= (and b!1220222 res!810536) b!1220229))

(assert (= (and b!1220226 c!120216) b!1220218))

(assert (= (and b!1220226 (not c!120216)) b!1220221))

(declare-fun b_lambda!22135 () Bool)

(assert (=> (not b_lambda!22135) (not b!1220225)))

(assert (=> b!1220225 t!40108))

(declare-fun b_and!43799 () Bool)

(assert (= b_and!43793 (and (=> t!40108 result!22807) b_and!43799)))

(declare-fun b_lambda!22137 () Bool)

(assert (=> (not b_lambda!22137) (not b!1220229)))

(assert (=> b!1220229 t!40108))

(declare-fun b_and!43801 () Bool)

(assert (= b_and!43799 (and (=> t!40108 result!22807) b_and!43801)))

(assert (=> b!1220225 m!1124891))

(declare-fun m!1125007 () Bool)

(assert (=> b!1220225 m!1125007))

(declare-fun m!1125009 () Bool)

(assert (=> b!1220225 m!1125009))

(assert (=> b!1220225 m!1124891))

(declare-fun m!1125011 () Bool)

(assert (=> b!1220225 m!1125011))

(declare-fun m!1125013 () Bool)

(assert (=> b!1220225 m!1125013))

(declare-fun m!1125015 () Bool)

(assert (=> b!1220225 m!1125015))

(declare-fun m!1125017 () Bool)

(assert (=> b!1220225 m!1125017))

(declare-fun m!1125019 () Bool)

(assert (=> b!1220225 m!1125019))

(assert (=> b!1220225 m!1125013))

(assert (=> b!1220225 m!1125009))

(declare-fun m!1125021 () Bool)

(assert (=> b!1220218 m!1125021))

(assert (=> b!1220229 m!1124891))

(assert (=> b!1220229 m!1125009))

(assert (=> b!1220229 m!1125007))

(assert (=> b!1220229 m!1125009))

(assert (=> b!1220229 m!1124891))

(assert (=> b!1220229 m!1125011))

(assert (=> b!1220229 m!1125007))

(declare-fun m!1125023 () Bool)

(assert (=> b!1220229 m!1125023))

(declare-fun m!1125025 () Bool)

(assert (=> b!1220219 m!1125025))

(assert (=> bm!60693 m!1125021))

(assert (=> b!1220224 m!1125007))

(assert (=> b!1220224 m!1125007))

(declare-fun m!1125027 () Bool)

(assert (=> b!1220224 m!1125027))

(declare-fun m!1125029 () Bool)

(assert (=> b!1220221 m!1125029))

(declare-fun m!1125031 () Bool)

(assert (=> d!133755 m!1125031))

(assert (=> d!133755 m!1124897))

(assert (=> b!1220228 m!1125007))

(assert (=> b!1220228 m!1125007))

(assert (=> b!1220228 m!1125027))

(assert (=> b!1220222 m!1125007))

(assert (=> b!1220222 m!1125007))

(declare-fun m!1125033 () Bool)

(assert (=> b!1220222 m!1125033))

(assert (=> b!1220079 d!133755))

(declare-fun d!133757 () Bool)

(declare-fun e!692878 () Bool)

(assert (=> d!133757 e!692878))

(declare-fun res!810542 () Bool)

(assert (=> d!133757 (=> (not res!810542) (not e!692878))))

(declare-fun lt!554875 () ListLongMap!17997)

(assert (=> d!133757 (= res!810542 (not (contains!7018 lt!554875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692876 () ListLongMap!17997)

(assert (=> d!133757 (= lt!554875 e!692876)))

(declare-fun c!120221 () Bool)

(assert (=> d!133757 (= c!120221 (bvsge from!1455 (size!38560 _keys!1208)))))

(assert (=> d!133757 (validMask!0 mask!1564)))

(assert (=> d!133757 (= (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!554875)))

(declare-fun b!1220230 () Bool)

(declare-fun e!692879 () Bool)

(assert (=> b!1220230 (= e!692879 (= lt!554875 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220231 () Bool)

(declare-fun res!810541 () Bool)

(assert (=> b!1220231 (=> (not res!810541) (not e!692878))))

(assert (=> b!1220231 (= res!810541 (not (contains!7018 lt!554875 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220232 () Bool)

(declare-fun e!692882 () ListLongMap!17997)

(declare-fun call!60697 () ListLongMap!17997)

(assert (=> b!1220232 (= e!692882 call!60697)))

(declare-fun b!1220233 () Bool)

(assert (=> b!1220233 (= e!692879 (isEmpty!998 lt!554875))))

(declare-fun b!1220234 () Bool)

(declare-fun e!692877 () Bool)

(declare-fun e!692881 () Bool)

(assert (=> b!1220234 (= e!692877 e!692881)))

(assert (=> b!1220234 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38560 _keys!1208)))))

(declare-fun res!810540 () Bool)

(assert (=> b!1220234 (= res!810540 (contains!7018 lt!554875 (select (arr!38024 _keys!1208) from!1455)))))

(assert (=> b!1220234 (=> (not res!810540) (not e!692881))))

(declare-fun b!1220235 () Bool)

(assert (=> b!1220235 (= e!692878 e!692877)))

(declare-fun c!120222 () Bool)

(declare-fun e!692880 () Bool)

(assert (=> b!1220235 (= c!120222 e!692880)))

(declare-fun res!810543 () Bool)

(assert (=> b!1220235 (=> (not res!810543) (not e!692880))))

(assert (=> b!1220235 (= res!810543 (bvslt from!1455 (size!38560 _keys!1208)))))

(declare-fun b!1220236 () Bool)

(assert (=> b!1220236 (= e!692880 (validKeyInArray!0 (select (arr!38024 _keys!1208) from!1455)))))

(assert (=> b!1220236 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1220237 () Bool)

(declare-fun lt!554881 () Unit!40430)

(declare-fun lt!554878 () Unit!40430)

(assert (=> b!1220237 (= lt!554881 lt!554878)))

(declare-fun lt!554877 () V!46467)

(declare-fun lt!554879 () ListLongMap!17997)

(declare-fun lt!554876 () (_ BitVec 64))

(declare-fun lt!554880 () (_ BitVec 64))

(assert (=> b!1220237 (not (contains!7018 (+!4082 lt!554879 (tuple2!20029 lt!554876 lt!554877)) lt!554880))))

(assert (=> b!1220237 (= lt!554878 (addStillNotContains!302 lt!554879 lt!554876 lt!554877 lt!554880))))

(assert (=> b!1220237 (= lt!554880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220237 (= lt!554877 (get!19397 (select (arr!38025 _values!996) from!1455) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220237 (= lt!554876 (select (arr!38024 _keys!1208) from!1455))))

(assert (=> b!1220237 (= lt!554879 call!60697)))

(assert (=> b!1220237 (= e!692882 (+!4082 call!60697 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220238 () Bool)

(assert (=> b!1220238 (= e!692877 e!692879)))

(declare-fun c!120220 () Bool)

(assert (=> b!1220238 (= c!120220 (bvslt from!1455 (size!38560 _keys!1208)))))

(declare-fun b!1220239 () Bool)

(assert (=> b!1220239 (= e!692876 (ListLongMap!17998 Nil!26826))))

(declare-fun b!1220240 () Bool)

(assert (=> b!1220240 (= e!692876 e!692882)))

(declare-fun c!120223 () Bool)

(assert (=> b!1220240 (= c!120223 (validKeyInArray!0 (select (arr!38024 _keys!1208) from!1455)))))

(declare-fun bm!60694 () Bool)

(assert (=> bm!60694 (= call!60697 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1220241 () Bool)

(assert (=> b!1220241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38560 _keys!1208)))))

(assert (=> b!1220241 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!38561 _values!996)))))

(assert (=> b!1220241 (= e!692881 (= (apply!974 lt!554875 (select (arr!38024 _keys!1208) from!1455)) (get!19397 (select (arr!38025 _values!996) from!1455) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133757 c!120221) b!1220239))

(assert (= (and d!133757 (not c!120221)) b!1220240))

(assert (= (and b!1220240 c!120223) b!1220237))

(assert (= (and b!1220240 (not c!120223)) b!1220232))

(assert (= (or b!1220237 b!1220232) bm!60694))

(assert (= (and d!133757 res!810542) b!1220231))

(assert (= (and b!1220231 res!810541) b!1220235))

(assert (= (and b!1220235 res!810543) b!1220236))

(assert (= (and b!1220235 c!120222) b!1220234))

(assert (= (and b!1220235 (not c!120222)) b!1220238))

(assert (= (and b!1220234 res!810540) b!1220241))

(assert (= (and b!1220238 c!120220) b!1220230))

(assert (= (and b!1220238 (not c!120220)) b!1220233))

(declare-fun b_lambda!22139 () Bool)

(assert (=> (not b_lambda!22139) (not b!1220237)))

(assert (=> b!1220237 t!40108))

(declare-fun b_and!43803 () Bool)

(assert (= b_and!43801 (and (=> t!40108 result!22807) b_and!43803)))

(declare-fun b_lambda!22141 () Bool)

(assert (=> (not b_lambda!22141) (not b!1220241)))

(assert (=> b!1220241 t!40108))

(declare-fun b_and!43805 () Bool)

(assert (= b_and!43803 (and (=> t!40108 result!22807) b_and!43805)))

(assert (=> b!1220237 m!1124891))

(assert (=> b!1220237 m!1124851))

(assert (=> b!1220237 m!1124853))

(assert (=> b!1220237 m!1124891))

(declare-fun m!1125035 () Bool)

(assert (=> b!1220237 m!1125035))

(declare-fun m!1125037 () Bool)

(assert (=> b!1220237 m!1125037))

(declare-fun m!1125039 () Bool)

(assert (=> b!1220237 m!1125039))

(declare-fun m!1125041 () Bool)

(assert (=> b!1220237 m!1125041))

(declare-fun m!1125043 () Bool)

(assert (=> b!1220237 m!1125043))

(assert (=> b!1220237 m!1125037))

(assert (=> b!1220237 m!1124853))

(declare-fun m!1125045 () Bool)

(assert (=> b!1220230 m!1125045))

(assert (=> b!1220241 m!1124891))

(assert (=> b!1220241 m!1124853))

(assert (=> b!1220241 m!1124851))

(assert (=> b!1220241 m!1124853))

(assert (=> b!1220241 m!1124891))

(assert (=> b!1220241 m!1125035))

(assert (=> b!1220241 m!1124851))

(declare-fun m!1125047 () Bool)

(assert (=> b!1220241 m!1125047))

(declare-fun m!1125049 () Bool)

(assert (=> b!1220231 m!1125049))

(assert (=> bm!60694 m!1125045))

(assert (=> b!1220236 m!1124851))

(assert (=> b!1220236 m!1124851))

(assert (=> b!1220236 m!1124907))

(declare-fun m!1125051 () Bool)

(assert (=> b!1220233 m!1125051))

(declare-fun m!1125053 () Bool)

(assert (=> d!133757 m!1125053))

(assert (=> d!133757 m!1124897))

(assert (=> b!1220240 m!1124851))

(assert (=> b!1220240 m!1124851))

(assert (=> b!1220240 m!1124907))

(assert (=> b!1220234 m!1124851))

(assert (=> b!1220234 m!1124851))

(declare-fun m!1125055 () Bool)

(assert (=> b!1220234 m!1125055))

(assert (=> b!1220079 d!133757))

(declare-fun b!1220242 () Bool)

(declare-fun e!692885 () Bool)

(declare-fun call!60698 () Bool)

(assert (=> b!1220242 (= e!692885 call!60698)))

(declare-fun b!1220243 () Bool)

(declare-fun e!692886 () Bool)

(declare-fun e!692883 () Bool)

(assert (=> b!1220243 (= e!692886 e!692883)))

(declare-fun res!810546 () Bool)

(assert (=> b!1220243 (=> (not res!810546) (not e!692883))))

(declare-fun e!692884 () Bool)

(assert (=> b!1220243 (= res!810546 (not e!692884))))

(declare-fun res!810544 () Bool)

(assert (=> b!1220243 (=> (not res!810544) (not e!692884))))

(assert (=> b!1220243 (= res!810544 (validKeyInArray!0 (select (arr!38024 _keys!1208) from!1455)))))

(declare-fun bm!60695 () Bool)

(declare-fun c!120224 () Bool)

(assert (=> bm!60695 (= call!60698 (arrayNoDuplicates!0 _keys!1208 (bvadd from!1455 #b00000000000000000000000000000001) (ite c!120224 (Cons!26824 (select (arr!38024 _keys!1208) from!1455) Nil!26825) Nil!26825)))))

(declare-fun b!1220244 () Bool)

(assert (=> b!1220244 (= e!692884 (contains!7017 Nil!26825 (select (arr!38024 _keys!1208) from!1455)))))

(declare-fun d!133759 () Bool)

(declare-fun res!810545 () Bool)

(assert (=> d!133759 (=> res!810545 e!692886)))

(assert (=> d!133759 (= res!810545 (bvsge from!1455 (size!38560 _keys!1208)))))

(assert (=> d!133759 (= (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26825) e!692886)))

(declare-fun b!1220245 () Bool)

(assert (=> b!1220245 (= e!692883 e!692885)))

(assert (=> b!1220245 (= c!120224 (validKeyInArray!0 (select (arr!38024 _keys!1208) from!1455)))))

(declare-fun b!1220246 () Bool)

(assert (=> b!1220246 (= e!692885 call!60698)))

(assert (= (and d!133759 (not res!810545)) b!1220243))

(assert (= (and b!1220243 res!810544) b!1220244))

(assert (= (and b!1220243 res!810546) b!1220245))

(assert (= (and b!1220245 c!120224) b!1220246))

(assert (= (and b!1220245 (not c!120224)) b!1220242))

(assert (= (or b!1220246 b!1220242) bm!60695))

(assert (=> b!1220243 m!1124851))

(assert (=> b!1220243 m!1124851))

(assert (=> b!1220243 m!1124907))

(assert (=> bm!60695 m!1124851))

(declare-fun m!1125057 () Bool)

(assert (=> bm!60695 m!1125057))

(assert (=> b!1220244 m!1124851))

(assert (=> b!1220244 m!1124851))

(declare-fun m!1125059 () Bool)

(assert (=> b!1220244 m!1125059))

(assert (=> b!1220245 m!1124851))

(assert (=> b!1220245 m!1124851))

(assert (=> b!1220245 m!1124907))

(assert (=> b!1220093 d!133759))

(declare-fun d!133761 () Bool)

(assert (=> d!133761 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26825)))

(declare-fun lt!554884 () Unit!40430)

(declare-fun choose!39 (array!78787 (_ BitVec 32) (_ BitVec 32)) Unit!40430)

(assert (=> d!133761 (= lt!554884 (choose!39 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> d!133761 (bvslt (size!38560 _keys!1208) #b01111111111111111111111111111111)))

(assert (=> d!133761 (= (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455) lt!554884)))

(declare-fun bs!34358 () Bool)

(assert (= bs!34358 d!133761))

(assert (=> bs!34358 m!1124863))

(declare-fun m!1125061 () Bool)

(assert (=> bs!34358 m!1125061))

(assert (=> b!1220093 d!133761))

(declare-fun d!133763 () Bool)

(declare-fun res!810547 () Bool)

(declare-fun e!692887 () Bool)

(assert (=> d!133763 (=> res!810547 e!692887)))

(assert (=> d!133763 (= res!810547 (= (select (arr!38024 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) k0!934))))

(assert (=> d!133763 (= (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)) e!692887)))

(declare-fun b!1220247 () Bool)

(declare-fun e!692888 () Bool)

(assert (=> b!1220247 (= e!692887 e!692888)))

(declare-fun res!810548 () Bool)

(assert (=> b!1220247 (=> (not res!810548) (not e!692888))))

(assert (=> b!1220247 (= res!810548 (bvslt (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) (size!38560 _keys!1208)))))

(declare-fun b!1220248 () Bool)

(assert (=> b!1220248 (= e!692888 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001)))))

(assert (= (and d!133763 (not res!810547)) b!1220247))

(assert (= (and b!1220247 res!810548) b!1220248))

(declare-fun m!1125063 () Bool)

(assert (=> d!133763 m!1125063))

(declare-fun m!1125065 () Bool)

(assert (=> b!1220248 m!1125065))

(assert (=> b!1220093 d!133763))

(declare-fun d!133765 () Bool)

(assert (=> d!133765 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554887 () Unit!40430)

(declare-fun choose!114 (array!78787 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40430)

(assert (=> d!133765 (= lt!554887 (choose!114 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> d!133765 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!133765 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)) lt!554887)))

(declare-fun bs!34359 () Bool)

(assert (= bs!34359 d!133765))

(assert (=> bs!34359 m!1124867))

(declare-fun m!1125067 () Bool)

(assert (=> bs!34359 m!1125067))

(assert (=> b!1220093 d!133765))

(declare-fun b!1220249 () Bool)

(declare-fun e!692891 () Bool)

(declare-fun call!60699 () Bool)

(assert (=> b!1220249 (= e!692891 call!60699)))

(declare-fun b!1220250 () Bool)

(declare-fun e!692892 () Bool)

(declare-fun e!692889 () Bool)

(assert (=> b!1220250 (= e!692892 e!692889)))

(declare-fun res!810551 () Bool)

(assert (=> b!1220250 (=> (not res!810551) (not e!692889))))

(declare-fun e!692890 () Bool)

(assert (=> b!1220250 (= res!810551 (not e!692890))))

(declare-fun res!810549 () Bool)

(assert (=> b!1220250 (=> (not res!810549) (not e!692890))))

(assert (=> b!1220250 (= res!810549 (validKeyInArray!0 (select (arr!38024 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!60696 () Bool)

(declare-fun c!120225 () Bool)

(assert (=> bm!60696 (= call!60699 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!120225 (Cons!26824 (select (arr!38024 _keys!1208) #b00000000000000000000000000000000) Nil!26825) Nil!26825)))))

(declare-fun b!1220251 () Bool)

(assert (=> b!1220251 (= e!692890 (contains!7017 Nil!26825 (select (arr!38024 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!133767 () Bool)

(declare-fun res!810550 () Bool)

(assert (=> d!133767 (=> res!810550 e!692892)))

(assert (=> d!133767 (= res!810550 (bvsge #b00000000000000000000000000000000 (size!38560 _keys!1208)))))

(assert (=> d!133767 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26825) e!692892)))

(declare-fun b!1220252 () Bool)

(assert (=> b!1220252 (= e!692889 e!692891)))

(assert (=> b!1220252 (= c!120225 (validKeyInArray!0 (select (arr!38024 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1220253 () Bool)

(assert (=> b!1220253 (= e!692891 call!60699)))

(assert (= (and d!133767 (not res!810550)) b!1220250))

(assert (= (and b!1220250 res!810549) b!1220251))

(assert (= (and b!1220250 res!810551) b!1220252))

(assert (= (and b!1220252 c!120225) b!1220253))

(assert (= (and b!1220252 (not c!120225)) b!1220249))

(assert (= (or b!1220253 b!1220249) bm!60696))

(assert (=> b!1220250 m!1124983))

(assert (=> b!1220250 m!1124983))

(assert (=> b!1220250 m!1124997))

(assert (=> bm!60696 m!1124983))

(declare-fun m!1125069 () Bool)

(assert (=> bm!60696 m!1125069))

(assert (=> b!1220251 m!1124983))

(assert (=> b!1220251 m!1124983))

(declare-fun m!1125071 () Bool)

(assert (=> b!1220251 m!1125071))

(assert (=> b!1220252 m!1124983))

(assert (=> b!1220252 m!1124983))

(assert (=> b!1220252 m!1124997))

(assert (=> b!1220082 d!133767))

(declare-fun d!133769 () Bool)

(declare-fun res!810552 () Bool)

(declare-fun e!692893 () Bool)

(assert (=> d!133769 (=> res!810552 e!692893)))

(assert (=> d!133769 (= res!810552 (= (select (arr!38024 _keys!1208) i!673) k0!934))))

(assert (=> d!133769 (= (arrayContainsKey!0 _keys!1208 k0!934 i!673) e!692893)))

(declare-fun b!1220254 () Bool)

(declare-fun e!692894 () Bool)

(assert (=> b!1220254 (= e!692893 e!692894)))

(declare-fun res!810553 () Bool)

(assert (=> b!1220254 (=> (not res!810553) (not e!692894))))

(assert (=> b!1220254 (= res!810553 (bvslt (bvadd i!673 #b00000000000000000000000000000001) (size!38560 _keys!1208)))))

(declare-fun b!1220255 () Bool)

(assert (=> b!1220255 (= e!692894 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd i!673 #b00000000000000000000000000000001)))))

(assert (= (and d!133769 (not res!810552)) b!1220254))

(assert (= (and b!1220254 res!810553) b!1220255))

(assert (=> d!133769 m!1124877))

(declare-fun m!1125073 () Bool)

(assert (=> b!1220255 m!1125073))

(assert (=> b!1220092 d!133769))

(declare-fun d!133771 () Bool)

(declare-fun e!692897 () Bool)

(assert (=> d!133771 e!692897))

(declare-fun res!810556 () Bool)

(assert (=> d!133771 (=> (not res!810556) (not e!692897))))

(declare-fun lt!554888 () ListLongMap!17997)

(assert (=> d!133771 (= res!810556 (not (contains!7018 lt!554888 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692895 () ListLongMap!17997)

(assert (=> d!133771 (= lt!554888 e!692895)))

(declare-fun c!120227 () Bool)

(assert (=> d!133771 (= c!120227 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 lt!554795)))))

(assert (=> d!133771 (validMask!0 mask!1564)))

(assert (=> d!133771 (= (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554888)))

(declare-fun b!1220256 () Bool)

(declare-fun e!692898 () Bool)

(assert (=> b!1220256 (= e!692898 (= lt!554888 (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220257 () Bool)

(declare-fun res!810555 () Bool)

(assert (=> b!1220257 (=> (not res!810555) (not e!692897))))

(assert (=> b!1220257 (= res!810555 (not (contains!7018 lt!554888 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220258 () Bool)

(declare-fun e!692901 () ListLongMap!17997)

(declare-fun call!60700 () ListLongMap!17997)

(assert (=> b!1220258 (= e!692901 call!60700)))

(declare-fun b!1220259 () Bool)

(assert (=> b!1220259 (= e!692898 (isEmpty!998 lt!554888))))

(declare-fun b!1220260 () Bool)

(declare-fun e!692896 () Bool)

(declare-fun e!692900 () Bool)

(assert (=> b!1220260 (= e!692896 e!692900)))

(assert (=> b!1220260 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 lt!554795)))))

(declare-fun res!810554 () Bool)

(assert (=> b!1220260 (= res!810554 (contains!7018 lt!554888 (select (arr!38024 lt!554795) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220260 (=> (not res!810554) (not e!692900))))

(declare-fun b!1220261 () Bool)

(assert (=> b!1220261 (= e!692897 e!692896)))

(declare-fun c!120228 () Bool)

(declare-fun e!692899 () Bool)

(assert (=> b!1220261 (= c!120228 e!692899)))

(declare-fun res!810557 () Bool)

(assert (=> b!1220261 (=> (not res!810557) (not e!692899))))

(assert (=> b!1220261 (= res!810557 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 lt!554795)))))

(declare-fun b!1220262 () Bool)

(assert (=> b!1220262 (= e!692899 (validKeyInArray!0 (select (arr!38024 lt!554795) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220262 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1220263 () Bool)

(declare-fun lt!554894 () Unit!40430)

(declare-fun lt!554891 () Unit!40430)

(assert (=> b!1220263 (= lt!554894 lt!554891)))

(declare-fun lt!554892 () ListLongMap!17997)

(declare-fun lt!554889 () (_ BitVec 64))

(declare-fun lt!554890 () V!46467)

(declare-fun lt!554893 () (_ BitVec 64))

(assert (=> b!1220263 (not (contains!7018 (+!4082 lt!554892 (tuple2!20029 lt!554889 lt!554890)) lt!554893))))

(assert (=> b!1220263 (= lt!554891 (addStillNotContains!302 lt!554892 lt!554889 lt!554890 lt!554893))))

(assert (=> b!1220263 (= lt!554893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220263 (= lt!554890 (get!19397 (select (arr!38025 lt!554802) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220263 (= lt!554889 (select (arr!38024 lt!554795) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220263 (= lt!554892 call!60700)))

(assert (=> b!1220263 (= e!692901 (+!4082 call!60700 (tuple2!20029 (select (arr!38024 lt!554795) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19397 (select (arr!38025 lt!554802) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220264 () Bool)

(assert (=> b!1220264 (= e!692896 e!692898)))

(declare-fun c!120226 () Bool)

(assert (=> b!1220264 (= c!120226 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 lt!554795)))))

(declare-fun b!1220265 () Bool)

(assert (=> b!1220265 (= e!692895 (ListLongMap!17998 Nil!26826))))

(declare-fun b!1220266 () Bool)

(assert (=> b!1220266 (= e!692895 e!692901)))

(declare-fun c!120229 () Bool)

(assert (=> b!1220266 (= c!120229 (validKeyInArray!0 (select (arr!38024 lt!554795) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!60697 () Bool)

(assert (=> bm!60697 (= call!60700 (getCurrentListMapNoExtraKeys!5437 lt!554795 lt!554802 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1220267 () Bool)

(assert (=> b!1220267 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 lt!554795)))))

(assert (=> b!1220267 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38561 lt!554802)))))

(assert (=> b!1220267 (= e!692900 (= (apply!974 lt!554888 (select (arr!38024 lt!554795) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19397 (select (arr!38025 lt!554802) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133771 c!120227) b!1220265))

(assert (= (and d!133771 (not c!120227)) b!1220266))

(assert (= (and b!1220266 c!120229) b!1220263))

(assert (= (and b!1220266 (not c!120229)) b!1220258))

(assert (= (or b!1220263 b!1220258) bm!60697))

(assert (= (and d!133771 res!810556) b!1220257))

(assert (= (and b!1220257 res!810555) b!1220261))

(assert (= (and b!1220261 res!810557) b!1220262))

(assert (= (and b!1220261 c!120228) b!1220260))

(assert (= (and b!1220261 (not c!120228)) b!1220264))

(assert (= (and b!1220260 res!810554) b!1220267))

(assert (= (and b!1220264 c!120226) b!1220256))

(assert (= (and b!1220264 (not c!120226)) b!1220259))

(declare-fun b_lambda!22143 () Bool)

(assert (=> (not b_lambda!22143) (not b!1220263)))

(assert (=> b!1220263 t!40108))

(declare-fun b_and!43807 () Bool)

(assert (= b_and!43805 (and (=> t!40108 result!22807) b_and!43807)))

(declare-fun b_lambda!22145 () Bool)

(assert (=> (not b_lambda!22145) (not b!1220267)))

(assert (=> b!1220267 t!40108))

(declare-fun b_and!43809 () Bool)

(assert (= b_and!43807 (and (=> t!40108 result!22807) b_and!43809)))

(assert (=> b!1220263 m!1124891))

(declare-fun m!1125075 () Bool)

(assert (=> b!1220263 m!1125075))

(declare-fun m!1125077 () Bool)

(assert (=> b!1220263 m!1125077))

(assert (=> b!1220263 m!1124891))

(declare-fun m!1125079 () Bool)

(assert (=> b!1220263 m!1125079))

(declare-fun m!1125081 () Bool)

(assert (=> b!1220263 m!1125081))

(declare-fun m!1125083 () Bool)

(assert (=> b!1220263 m!1125083))

(declare-fun m!1125085 () Bool)

(assert (=> b!1220263 m!1125085))

(declare-fun m!1125087 () Bool)

(assert (=> b!1220263 m!1125087))

(assert (=> b!1220263 m!1125081))

(assert (=> b!1220263 m!1125077))

(declare-fun m!1125089 () Bool)

(assert (=> b!1220256 m!1125089))

(assert (=> b!1220267 m!1124891))

(assert (=> b!1220267 m!1125077))

(assert (=> b!1220267 m!1125075))

(assert (=> b!1220267 m!1125077))

(assert (=> b!1220267 m!1124891))

(assert (=> b!1220267 m!1125079))

(assert (=> b!1220267 m!1125075))

(declare-fun m!1125091 () Bool)

(assert (=> b!1220267 m!1125091))

(declare-fun m!1125093 () Bool)

(assert (=> b!1220257 m!1125093))

(assert (=> bm!60697 m!1125089))

(assert (=> b!1220262 m!1125075))

(assert (=> b!1220262 m!1125075))

(declare-fun m!1125095 () Bool)

(assert (=> b!1220262 m!1125095))

(declare-fun m!1125097 () Bool)

(assert (=> b!1220259 m!1125097))

(declare-fun m!1125099 () Bool)

(assert (=> d!133771 m!1125099))

(assert (=> d!133771 m!1124897))

(assert (=> b!1220266 m!1125075))

(assert (=> b!1220266 m!1125075))

(assert (=> b!1220266 m!1125095))

(assert (=> b!1220260 m!1125075))

(assert (=> b!1220260 m!1125075))

(declare-fun m!1125101 () Bool)

(assert (=> b!1220260 m!1125101))

(assert (=> b!1220095 d!133771))

(declare-fun d!133773 () Bool)

(assert (=> d!133773 (= (validKeyInArray!0 (select (arr!38024 _keys!1208) from!1455)) (and (not (= (select (arr!38024 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38024 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1220095 d!133773))

(declare-fun d!133775 () Bool)

(declare-fun e!692907 () Bool)

(assert (=> d!133775 e!692907))

(declare-fun res!810560 () Bool)

(assert (=> d!133775 (=> (not res!810560) (not e!692907))))

(assert (=> d!133775 (= res!810560 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38560 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38560 _keys!1208))))))))

(declare-fun lt!554897 () Unit!40430)

(declare-fun choose!1825 (array!78787 array!78789 (_ BitVec 32) (_ BitVec 32) V!46467 V!46467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40430)

(assert (=> d!133775 (= lt!554897 (choose!1825 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!133775 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 _keys!1208)))))

(assert (=> d!133775 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1130 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554897)))

(declare-fun b!1220274 () Bool)

(declare-fun e!692906 () Bool)

(assert (=> b!1220274 (= e!692907 e!692906)))

(declare-fun c!120232 () Bool)

(assert (=> b!1220274 (= c!120232 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun b!1220275 () Bool)

(declare-fun call!60705 () ListLongMap!17997)

(declare-fun call!60706 () ListLongMap!17997)

(assert (=> b!1220275 (= e!692906 (= call!60705 call!60706))))

(assert (=> b!1220275 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38561 _values!996)))))

(declare-fun bm!60702 () Bool)

(assert (=> bm!60702 (= call!60705 (getCurrentListMapNoExtraKeys!5437 (array!78788 (store (arr!38024 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38560 _keys!1208)) (array!78790 (store (arr!38025 _values!996) i!673 (ValueCellFull!14793 (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38561 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220276 () Bool)

(assert (=> b!1220276 (= e!692906 (= call!60705 (-!1923 call!60706 k0!934)))))

(assert (=> b!1220276 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38561 _values!996)))))

(declare-fun bm!60703 () Bool)

(assert (=> bm!60703 (= call!60706 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!133775 res!810560) b!1220274))

(assert (= (and b!1220274 c!120232) b!1220276))

(assert (= (and b!1220274 (not c!120232)) b!1220275))

(assert (= (or b!1220276 b!1220275) bm!60703))

(assert (= (or b!1220276 b!1220275) bm!60702))

(declare-fun b_lambda!22147 () Bool)

(assert (=> (not b_lambda!22147) (not bm!60702)))

(assert (=> bm!60702 t!40108))

(declare-fun b_and!43811 () Bool)

(assert (= b_and!43809 (and (=> t!40108 result!22807) b_and!43811)))

(declare-fun m!1125103 () Bool)

(assert (=> d!133775 m!1125103))

(assert (=> bm!60702 m!1124911))

(assert (=> bm!60702 m!1124891))

(declare-fun m!1125105 () Bool)

(assert (=> bm!60702 m!1125105))

(declare-fun m!1125107 () Bool)

(assert (=> bm!60702 m!1125107))

(declare-fun m!1125109 () Bool)

(assert (=> b!1220276 m!1125109))

(assert (=> bm!60703 m!1124899))

(assert (=> b!1220095 d!133775))

(declare-fun d!133777 () Bool)

(declare-fun lt!554900 () ListLongMap!17997)

(assert (=> d!133777 (not (contains!7018 lt!554900 k0!934))))

(declare-fun removeStrictlySorted!107 (List!26829 (_ BitVec 64)) List!26829)

(assert (=> d!133777 (= lt!554900 (ListLongMap!17998 (removeStrictlySorted!107 (toList!9014 lt!554794) k0!934)))))

(assert (=> d!133777 (= (-!1923 lt!554794 k0!934) lt!554900)))

(declare-fun bs!34360 () Bool)

(assert (= bs!34360 d!133777))

(declare-fun m!1125111 () Bool)

(assert (=> bs!34360 m!1125111))

(declare-fun m!1125113 () Bool)

(assert (=> bs!34360 m!1125113))

(assert (=> b!1220095 d!133777))

(declare-fun d!133779 () Bool)

(declare-fun e!692910 () Bool)

(assert (=> d!133779 e!692910))

(declare-fun res!810563 () Bool)

(assert (=> d!133779 (=> (not res!810563) (not e!692910))))

(declare-fun lt!554901 () ListLongMap!17997)

(assert (=> d!133779 (= res!810563 (not (contains!7018 lt!554901 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!692908 () ListLongMap!17997)

(assert (=> d!133779 (= lt!554901 e!692908)))

(declare-fun c!120234 () Bool)

(assert (=> d!133779 (= c!120234 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 _keys!1208)))))

(assert (=> d!133779 (validMask!0 mask!1564)))

(assert (=> d!133779 (= (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!554901)))

(declare-fun e!692911 () Bool)

(declare-fun b!1220277 () Bool)

(assert (=> b!1220277 (= e!692911 (= lt!554901 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1220278 () Bool)

(declare-fun res!810562 () Bool)

(assert (=> b!1220278 (=> (not res!810562) (not e!692910))))

(assert (=> b!1220278 (= res!810562 (not (contains!7018 lt!554901 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1220279 () Bool)

(declare-fun e!692914 () ListLongMap!17997)

(declare-fun call!60707 () ListLongMap!17997)

(assert (=> b!1220279 (= e!692914 call!60707)))

(declare-fun b!1220280 () Bool)

(assert (=> b!1220280 (= e!692911 (isEmpty!998 lt!554901))))

(declare-fun b!1220281 () Bool)

(declare-fun e!692909 () Bool)

(declare-fun e!692913 () Bool)

(assert (=> b!1220281 (= e!692909 e!692913)))

(assert (=> b!1220281 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 _keys!1208)))))

(declare-fun res!810561 () Bool)

(assert (=> b!1220281 (= res!810561 (contains!7018 lt!554901 (select (arr!38024 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220281 (=> (not res!810561) (not e!692913))))

(declare-fun b!1220282 () Bool)

(assert (=> b!1220282 (= e!692910 e!692909)))

(declare-fun c!120235 () Bool)

(declare-fun e!692912 () Bool)

(assert (=> b!1220282 (= c!120235 e!692912)))

(declare-fun res!810564 () Bool)

(assert (=> b!1220282 (=> (not res!810564) (not e!692912))))

(assert (=> b!1220282 (= res!810564 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 _keys!1208)))))

(declare-fun b!1220283 () Bool)

(assert (=> b!1220283 (= e!692912 (validKeyInArray!0 (select (arr!38024 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1220283 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1220284 () Bool)

(declare-fun lt!554907 () Unit!40430)

(declare-fun lt!554904 () Unit!40430)

(assert (=> b!1220284 (= lt!554907 lt!554904)))

(declare-fun lt!554906 () (_ BitVec 64))

(declare-fun lt!554903 () V!46467)

(declare-fun lt!554902 () (_ BitVec 64))

(declare-fun lt!554905 () ListLongMap!17997)

(assert (=> b!1220284 (not (contains!7018 (+!4082 lt!554905 (tuple2!20029 lt!554902 lt!554903)) lt!554906))))

(assert (=> b!1220284 (= lt!554904 (addStillNotContains!302 lt!554905 lt!554902 lt!554903 lt!554906))))

(assert (=> b!1220284 (= lt!554906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1220284 (= lt!554903 (get!19397 (select (arr!38025 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1220284 (= lt!554902 (select (arr!38024 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1220284 (= lt!554905 call!60707)))

(assert (=> b!1220284 (= e!692914 (+!4082 call!60707 (tuple2!20029 (select (arr!38024 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19397 (select (arr!38025 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1220285 () Bool)

(assert (=> b!1220285 (= e!692909 e!692911)))

(declare-fun c!120233 () Bool)

(assert (=> b!1220285 (= c!120233 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 _keys!1208)))))

(declare-fun b!1220286 () Bool)

(assert (=> b!1220286 (= e!692908 (ListLongMap!17998 Nil!26826))))

(declare-fun b!1220287 () Bool)

(assert (=> b!1220287 (= e!692908 e!692914)))

(declare-fun c!120236 () Bool)

(assert (=> b!1220287 (= c!120236 (validKeyInArray!0 (select (arr!38024 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun bm!60704 () Bool)

(assert (=> bm!60704 (= call!60707 (getCurrentListMapNoExtraKeys!5437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1220288 () Bool)

(assert (=> b!1220288 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38560 _keys!1208)))))

(assert (=> b!1220288 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!38561 _values!996)))))

(assert (=> b!1220288 (= e!692913 (= (apply!974 lt!554901 (select (arr!38024 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19397 (select (arr!38025 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3319 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!133779 c!120234) b!1220286))

(assert (= (and d!133779 (not c!120234)) b!1220287))

(assert (= (and b!1220287 c!120236) b!1220284))

(assert (= (and b!1220287 (not c!120236)) b!1220279))

(assert (= (or b!1220284 b!1220279) bm!60704))

(assert (= (and d!133779 res!810563) b!1220278))

(assert (= (and b!1220278 res!810562) b!1220282))

(assert (= (and b!1220282 res!810564) b!1220283))

(assert (= (and b!1220282 c!120235) b!1220281))

(assert (= (and b!1220282 (not c!120235)) b!1220285))

(assert (= (and b!1220281 res!810561) b!1220288))

(assert (= (and b!1220285 c!120233) b!1220277))

(assert (= (and b!1220285 (not c!120233)) b!1220280))

(declare-fun b_lambda!22149 () Bool)

(assert (=> (not b_lambda!22149) (not b!1220284)))

(assert (=> b!1220284 t!40108))

(declare-fun b_and!43813 () Bool)

(assert (= b_and!43811 (and (=> t!40108 result!22807) b_and!43813)))

(declare-fun b_lambda!22151 () Bool)

(assert (=> (not b_lambda!22151) (not b!1220288)))

(assert (=> b!1220288 t!40108))

(declare-fun b_and!43815 () Bool)

(assert (= b_and!43813 (and (=> t!40108 result!22807) b_and!43815)))

(assert (=> b!1220284 m!1124891))

(assert (=> b!1220284 m!1125063))

(declare-fun m!1125115 () Bool)

(assert (=> b!1220284 m!1125115))

(assert (=> b!1220284 m!1124891))

(declare-fun m!1125117 () Bool)

(assert (=> b!1220284 m!1125117))

(declare-fun m!1125119 () Bool)

(assert (=> b!1220284 m!1125119))

(declare-fun m!1125121 () Bool)

(assert (=> b!1220284 m!1125121))

(declare-fun m!1125123 () Bool)

(assert (=> b!1220284 m!1125123))

(declare-fun m!1125125 () Bool)

(assert (=> b!1220284 m!1125125))

(assert (=> b!1220284 m!1125119))

(assert (=> b!1220284 m!1125115))

(declare-fun m!1125127 () Bool)

(assert (=> b!1220277 m!1125127))

(assert (=> b!1220288 m!1124891))

(assert (=> b!1220288 m!1125115))

(assert (=> b!1220288 m!1125063))

(assert (=> b!1220288 m!1125115))

(assert (=> b!1220288 m!1124891))

(assert (=> b!1220288 m!1125117))

(assert (=> b!1220288 m!1125063))

(declare-fun m!1125129 () Bool)

(assert (=> b!1220288 m!1125129))

(declare-fun m!1125131 () Bool)

(assert (=> b!1220278 m!1125131))

(assert (=> bm!60704 m!1125127))

(assert (=> b!1220283 m!1125063))

(assert (=> b!1220283 m!1125063))

(declare-fun m!1125133 () Bool)

(assert (=> b!1220283 m!1125133))

(declare-fun m!1125135 () Bool)

(assert (=> b!1220280 m!1125135))

(declare-fun m!1125137 () Bool)

(assert (=> d!133779 m!1125137))

(assert (=> d!133779 m!1124897))

(assert (=> b!1220287 m!1125063))

(assert (=> b!1220287 m!1125063))

(assert (=> b!1220287 m!1125133))

(assert (=> b!1220281 m!1125063))

(assert (=> b!1220281 m!1125063))

(declare-fun m!1125139 () Bool)

(assert (=> b!1220281 m!1125139))

(assert (=> b!1220095 d!133779))

(declare-fun d!133781 () Bool)

(assert (=> d!133781 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1220084 d!133781))

(declare-fun d!133783 () Bool)

(declare-fun e!692917 () Bool)

(assert (=> d!133783 e!692917))

(declare-fun res!810569 () Bool)

(assert (=> d!133783 (=> (not res!810569) (not e!692917))))

(declare-fun lt!554916 () ListLongMap!17997)

(assert (=> d!133783 (= res!810569 (contains!7018 lt!554916 (_1!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797)))))))

(declare-fun lt!554919 () List!26829)

(assert (=> d!133783 (= lt!554916 (ListLongMap!17998 lt!554919))))

(declare-fun lt!554917 () Unit!40430)

(declare-fun lt!554918 () Unit!40430)

(assert (=> d!133783 (= lt!554917 lt!554918)))

(declare-datatypes ((Option!696 0))(
  ( (Some!695 (v!18218 V!46467)) (None!694) )
))
(declare-fun getValueByKey!645 (List!26829 (_ BitVec 64)) Option!696)

(assert (=> d!133783 (= (getValueByKey!645 lt!554919 (_1!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797)))) (Some!695 (_2!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!322 (List!26829 (_ BitVec 64) V!46467) Unit!40430)

(assert (=> d!133783 (= lt!554918 (lemmaContainsTupThenGetReturnValue!322 lt!554919 (_1!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797))) (_2!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797)))))))

(declare-fun insertStrictlySorted!415 (List!26829 (_ BitVec 64) V!46467) List!26829)

(assert (=> d!133783 (= lt!554919 (insertStrictlySorted!415 (toList!9014 lt!554801) (_1!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797))) (_2!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797)))))))

(assert (=> d!133783 (= (+!4082 lt!554801 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797))) lt!554916)))

(declare-fun b!1220293 () Bool)

(declare-fun res!810570 () Bool)

(assert (=> b!1220293 (=> (not res!810570) (not e!692917))))

(assert (=> b!1220293 (= res!810570 (= (getValueByKey!645 (toList!9014 lt!554916) (_1!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797)))) (Some!695 (_2!10025 (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797))))))))

(declare-fun b!1220294 () Bool)

(declare-fun contains!7019 (List!26829 tuple2!20028) Bool)

(assert (=> b!1220294 (= e!692917 (contains!7019 (toList!9014 lt!554916) (tuple2!20029 (select (arr!38024 _keys!1208) from!1455) (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797))))))

(assert (= (and d!133783 res!810569) b!1220293))

(assert (= (and b!1220293 res!810570) b!1220294))

(declare-fun m!1125141 () Bool)

(assert (=> d!133783 m!1125141))

(declare-fun m!1125143 () Bool)

(assert (=> d!133783 m!1125143))

(declare-fun m!1125145 () Bool)

(assert (=> d!133783 m!1125145))

(declare-fun m!1125147 () Bool)

(assert (=> d!133783 m!1125147))

(declare-fun m!1125149 () Bool)

(assert (=> b!1220293 m!1125149))

(declare-fun m!1125151 () Bool)

(assert (=> b!1220294 m!1125151))

(assert (=> b!1220094 d!133783))

(declare-fun d!133785 () Bool)

(declare-fun c!120239 () Bool)

(assert (=> d!133785 (= c!120239 ((_ is ValueCellFull!14793) (select (arr!38025 _values!996) from!1455)))))

(declare-fun e!692920 () V!46467)

(assert (=> d!133785 (= (get!19397 (select (arr!38025 _values!996) from!1455) lt!554797) e!692920)))

(declare-fun b!1220299 () Bool)

(declare-fun get!19398 (ValueCell!14793 V!46467) V!46467)

(assert (=> b!1220299 (= e!692920 (get!19398 (select (arr!38025 _values!996) from!1455) lt!554797))))

(declare-fun b!1220300 () Bool)

(declare-fun get!19399 (ValueCell!14793 V!46467) V!46467)

(assert (=> b!1220300 (= e!692920 (get!19399 (select (arr!38025 _values!996) from!1455) lt!554797))))

(assert (= (and d!133785 c!120239) b!1220299))

(assert (= (and d!133785 (not c!120239)) b!1220300))

(assert (=> b!1220299 m!1124853))

(declare-fun m!1125153 () Bool)

(assert (=> b!1220299 m!1125153))

(assert (=> b!1220300 m!1124853))

(declare-fun m!1125155 () Bool)

(assert (=> b!1220300 m!1125155))

(assert (=> b!1220094 d!133785))

(declare-fun mapNonEmpty!48400 () Bool)

(declare-fun mapRes!48400 () Bool)

(declare-fun tp!91946 () Bool)

(declare-fun e!692925 () Bool)

(assert (=> mapNonEmpty!48400 (= mapRes!48400 (and tp!91946 e!692925))))

(declare-fun mapValue!48400 () ValueCell!14793)

(declare-fun mapKey!48400 () (_ BitVec 32))

(declare-fun mapRest!48400 () (Array (_ BitVec 32) ValueCell!14793))

(assert (=> mapNonEmpty!48400 (= mapRest!48394 (store mapRest!48400 mapKey!48400 mapValue!48400))))

(declare-fun mapIsEmpty!48400 () Bool)

(assert (=> mapIsEmpty!48400 mapRes!48400))

(declare-fun condMapEmpty!48400 () Bool)

(declare-fun mapDefault!48400 () ValueCell!14793)

(assert (=> mapNonEmpty!48394 (= condMapEmpty!48400 (= mapRest!48394 ((as const (Array (_ BitVec 32) ValueCell!14793)) mapDefault!48400)))))

(declare-fun e!692926 () Bool)

(assert (=> mapNonEmpty!48394 (= tp!91936 (and e!692926 mapRes!48400))))

(declare-fun b!1220307 () Bool)

(assert (=> b!1220307 (= e!692925 tp_is_empty!31005)))

(declare-fun b!1220308 () Bool)

(assert (=> b!1220308 (= e!692926 tp_is_empty!31005)))

(assert (= (and mapNonEmpty!48394 condMapEmpty!48400) mapIsEmpty!48400))

(assert (= (and mapNonEmpty!48394 (not condMapEmpty!48400)) mapNonEmpty!48400))

(assert (= (and mapNonEmpty!48400 ((_ is ValueCellFull!14793) mapValue!48400)) b!1220307))

(assert (= (and mapNonEmpty!48394 ((_ is ValueCellFull!14793) mapDefault!48400)) b!1220308))

(declare-fun m!1125157 () Bool)

(assert (=> mapNonEmpty!48400 m!1125157))

(declare-fun b_lambda!22153 () Bool)

(assert (= b_lambda!22151 (or (and start!101484 b_free!26301) b_lambda!22153)))

(declare-fun b_lambda!22155 () Bool)

(assert (= b_lambda!22149 (or (and start!101484 b_free!26301) b_lambda!22155)))

(declare-fun b_lambda!22157 () Bool)

(assert (= b_lambda!22139 (or (and start!101484 b_free!26301) b_lambda!22157)))

(declare-fun b_lambda!22159 () Bool)

(assert (= b_lambda!22141 (or (and start!101484 b_free!26301) b_lambda!22159)))

(declare-fun b_lambda!22161 () Bool)

(assert (= b_lambda!22135 (or (and start!101484 b_free!26301) b_lambda!22161)))

(declare-fun b_lambda!22163 () Bool)

(assert (= b_lambda!22147 (or (and start!101484 b_free!26301) b_lambda!22163)))

(declare-fun b_lambda!22165 () Bool)

(assert (= b_lambda!22137 (or (and start!101484 b_free!26301) b_lambda!22165)))

(declare-fun b_lambda!22167 () Bool)

(assert (= b_lambda!22143 (or (and start!101484 b_free!26301) b_lambda!22167)))

(declare-fun b_lambda!22169 () Bool)

(assert (= b_lambda!22145 (or (and start!101484 b_free!26301) b_lambda!22169)))

(check-sat (not b!1220288) (not b!1220231) (not b!1220233) (not b!1220259) (not bm!60689) (not b!1220245) (not b!1220230) (not b!1220283) (not b!1220241) (not bm!60703) (not b!1220224) (not b!1220300) (not b!1220222) (not b_lambda!22157) (not b!1220256) (not b!1220257) (not d!133745) (not b!1220277) (not b!1220267) (not b!1220287) (not b!1220255) (not bm!60696) (not b!1220263) (not d!133755) (not b!1220229) (not b!1220260) (not b!1220228) (not b!1220225) (not bm!60702) (not d!133779) (not b!1220276) (not b_next!26301) (not b!1220190) (not bm!60695) tp_is_empty!31005 b_and!43815 (not bm!60686) (not b_lambda!22161) (not b!1220170) (not b!1220252) (not b!1220266) (not b!1220168) (not d!133777) (not b_lambda!22155) (not b!1220237) (not d!133771) (not b!1220187) (not bm!60693) (not b!1220284) (not b!1220169) (not b_lambda!22165) (not b!1220248) (not b!1220280) (not b!1220221) (not bm!60697) (not bm!60694) (not mapNonEmpty!48400) (not b!1220250) (not b!1220236) (not b!1220186) (not b!1220299) (not b_lambda!22169) (not b_lambda!22153) (not b_lambda!22167) (not b!1220177) (not b!1220293) (not b!1220251) (not b!1220244) (not b!1220281) (not b!1220218) (not b!1220262) (not b!1220219) (not bm!60690) (not b!1220234) (not b_lambda!22159) (not d!133757) (not d!133783) (not b!1220278) (not b!1220240) (not b!1220191) (not d!133761) (not d!133775) (not b_lambda!22133) (not bm!60704) (not b!1220243) (not d!133765) (not b!1220294) (not b_lambda!22163))
(check-sat b_and!43815 (not b_next!26301))
