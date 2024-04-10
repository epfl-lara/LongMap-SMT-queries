; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99294 () Bool)

(assert start!99294)

(declare-fun b_free!24873 () Bool)

(declare-fun b_next!24873 () Bool)

(assert (=> start!99294 (= b_free!24873 (not b_next!24873))))

(declare-fun tp!87332 () Bool)

(declare-fun b_and!40613 () Bool)

(assert (=> start!99294 (= tp!87332 b_and!40613)))

(declare-fun b!1169898 () Bool)

(declare-fun e!664916 () Bool)

(declare-fun e!664924 () Bool)

(assert (=> b!1169898 (= e!664916 e!664924)))

(declare-fun res!776338 () Bool)

(assert (=> b!1169898 (=> res!776338 e!664924)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169898 (= res!776338 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44331 0))(
  ( (V!44332 (val!14758 Int)) )
))
(declare-fun zeroValue!944 () V!44331)

(declare-datatypes ((ValueCell!13992 0))(
  ( (ValueCellFull!13992 (v!17396 V!44331)) (EmptyCell!13992) )
))
(declare-datatypes ((array!75627 0))(
  ( (array!75628 (arr!36463 (Array (_ BitVec 32) ValueCell!13992)) (size!36999 (_ BitVec 32))) )
))
(declare-fun lt!526840 () array!75627)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((array!75629 0))(
  ( (array!75630 (arr!36464 (Array (_ BitVec 32) (_ BitVec 64))) (size!37000 (_ BitVec 32))) )
))
(declare-fun lt!526836 () array!75629)

(declare-datatypes ((tuple2!18844 0))(
  ( (tuple2!18845 (_1!9433 (_ BitVec 64)) (_2!9433 V!44331)) )
))
(declare-datatypes ((List!25580 0))(
  ( (Nil!25577) (Cons!25576 (h!26785 tuple2!18844) (t!37445 List!25580)) )
))
(declare-datatypes ((ListLongMap!16813 0))(
  ( (ListLongMap!16814 (toList!8422 List!25580)) )
))
(declare-fun lt!526833 () ListLongMap!16813)

(declare-fun minValue!944 () V!44331)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4886 (array!75629 array!75627 (_ BitVec 32) (_ BitVec 32) V!44331 V!44331 (_ BitVec 32) Int) ListLongMap!16813)

(assert (=> b!1169898 (= lt!526833 (getCurrentListMapNoExtraKeys!4886 lt!526836 lt!526840 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!75627)

(declare-fun lt!526839 () V!44331)

(assert (=> b!1169898 (= lt!526840 (array!75628 (store (arr!36463 _values!996) i!673 (ValueCellFull!13992 lt!526839)) (size!36999 _values!996)))))

(declare-fun dynLambda!2863 (Int (_ BitVec 64)) V!44331)

(assert (=> b!1169898 (= lt!526839 (dynLambda!2863 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75629)

(declare-fun lt!526835 () ListLongMap!16813)

(assert (=> b!1169898 (= lt!526835 (getCurrentListMapNoExtraKeys!4886 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169899 () Bool)

(declare-fun res!776339 () Bool)

(declare-fun e!664920 () Bool)

(assert (=> b!1169899 (=> (not res!776339) (not e!664920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75629 (_ BitVec 32)) Bool)

(assert (=> b!1169899 (= res!776339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169901 () Bool)

(declare-fun res!776343 () Bool)

(assert (=> b!1169901 (=> (not res!776343) (not e!664920))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1169901 (= res!776343 (= (select (arr!36464 _keys!1208) i!673) k0!934))))

(declare-fun b!1169902 () Bool)

(declare-fun res!776346 () Bool)

(assert (=> b!1169902 (=> (not res!776346) (not e!664920))))

(assert (=> b!1169902 (= res!776346 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37000 _keys!1208))))))

(declare-fun b!1169903 () Bool)

(declare-fun res!776336 () Bool)

(assert (=> b!1169903 (=> (not res!776336) (not e!664920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169903 (= res!776336 (validKeyInArray!0 k0!934))))

(declare-fun b!1169904 () Bool)

(declare-fun res!776337 () Bool)

(assert (=> b!1169904 (=> (not res!776337) (not e!664920))))

(assert (=> b!1169904 (= res!776337 (and (= (size!36999 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37000 _keys!1208) (size!36999 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169905 () Bool)

(declare-fun e!664923 () Bool)

(declare-fun e!664914 () Bool)

(declare-fun mapRes!45932 () Bool)

(assert (=> b!1169905 (= e!664923 (and e!664914 mapRes!45932))))

(declare-fun condMapEmpty!45932 () Bool)

(declare-fun mapDefault!45932 () ValueCell!13992)

(assert (=> b!1169905 (= condMapEmpty!45932 (= (arr!36463 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13992)) mapDefault!45932)))))

(declare-fun b!1169906 () Bool)

(declare-fun e!664917 () Bool)

(declare-fun e!664918 () Bool)

(assert (=> b!1169906 (= e!664917 e!664918)))

(declare-fun res!776333 () Bool)

(assert (=> b!1169906 (=> res!776333 e!664918)))

(assert (=> b!1169906 (= res!776333 (not (= (select (arr!36464 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!45932 () Bool)

(declare-fun tp!87333 () Bool)

(declare-fun e!664915 () Bool)

(assert (=> mapNonEmpty!45932 (= mapRes!45932 (and tp!87333 e!664915))))

(declare-fun mapValue!45932 () ValueCell!13992)

(declare-fun mapRest!45932 () (Array (_ BitVec 32) ValueCell!13992))

(declare-fun mapKey!45932 () (_ BitVec 32))

(assert (=> mapNonEmpty!45932 (= (arr!36463 _values!996) (store mapRest!45932 mapKey!45932 mapValue!45932))))

(declare-fun mapIsEmpty!45932 () Bool)

(assert (=> mapIsEmpty!45932 mapRes!45932))

(declare-fun b!1169907 () Bool)

(declare-fun e!664919 () Bool)

(assert (=> b!1169907 (= e!664920 e!664919)))

(declare-fun res!776345 () Bool)

(assert (=> b!1169907 (=> (not res!776345) (not e!664919))))

(assert (=> b!1169907 (= res!776345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526836 mask!1564))))

(assert (=> b!1169907 (= lt!526836 (array!75630 (store (arr!36464 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37000 _keys!1208)))))

(declare-fun b!1169908 () Bool)

(declare-fun arrayContainsKey!0 (array!75629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169908 (= e!664918 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169909 () Bool)

(declare-fun e!664922 () Bool)

(assert (=> b!1169909 (= e!664922 true)))

(assert (=> b!1169909 e!664917))

(declare-fun res!776344 () Bool)

(assert (=> b!1169909 (=> (not res!776344) (not e!664917))))

(declare-fun lt!526842 () ListLongMap!16813)

(declare-fun +!3751 (ListLongMap!16813 tuple2!18844) ListLongMap!16813)

(declare-fun get!18589 (ValueCell!13992 V!44331) V!44331)

(assert (=> b!1169909 (= res!776344 (= lt!526833 (+!3751 lt!526842 (tuple2!18845 (select (arr!36464 _keys!1208) from!1455) (get!18589 (select (arr!36463 _values!996) from!1455) lt!526839)))))))

(declare-fun b!1169910 () Bool)

(assert (=> b!1169910 (= e!664919 (not e!664916))))

(declare-fun res!776341 () Bool)

(assert (=> b!1169910 (=> res!776341 e!664916)))

(assert (=> b!1169910 (= res!776341 (bvsgt from!1455 i!673))))

(assert (=> b!1169910 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38596 0))(
  ( (Unit!38597) )
))
(declare-fun lt!526838 () Unit!38596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75629 (_ BitVec 64) (_ BitVec 32)) Unit!38596)

(assert (=> b!1169910 (= lt!526838 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169911 () Bool)

(declare-fun tp_is_empty!29403 () Bool)

(assert (=> b!1169911 (= e!664915 tp_is_empty!29403)))

(declare-fun res!776347 () Bool)

(assert (=> start!99294 (=> (not res!776347) (not e!664920))))

(assert (=> start!99294 (= res!776347 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37000 _keys!1208))))))

(assert (=> start!99294 e!664920))

(assert (=> start!99294 tp_is_empty!29403))

(declare-fun array_inv!27870 (array!75629) Bool)

(assert (=> start!99294 (array_inv!27870 _keys!1208)))

(assert (=> start!99294 true))

(assert (=> start!99294 tp!87332))

(declare-fun array_inv!27871 (array!75627) Bool)

(assert (=> start!99294 (and (array_inv!27871 _values!996) e!664923)))

(declare-fun b!1169900 () Bool)

(assert (=> b!1169900 (= e!664924 e!664922)))

(declare-fun res!776335 () Bool)

(assert (=> b!1169900 (=> res!776335 e!664922)))

(assert (=> b!1169900 (= res!776335 (not (validKeyInArray!0 (select (arr!36464 _keys!1208) from!1455))))))

(declare-fun lt!526834 () ListLongMap!16813)

(assert (=> b!1169900 (= lt!526834 lt!526842)))

(declare-fun lt!526841 () ListLongMap!16813)

(declare-fun -!1493 (ListLongMap!16813 (_ BitVec 64)) ListLongMap!16813)

(assert (=> b!1169900 (= lt!526842 (-!1493 lt!526841 k0!934))))

(assert (=> b!1169900 (= lt!526834 (getCurrentListMapNoExtraKeys!4886 lt!526836 lt!526840 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169900 (= lt!526841 (getCurrentListMapNoExtraKeys!4886 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526837 () Unit!38596)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!720 (array!75629 array!75627 (_ BitVec 32) (_ BitVec 32) V!44331 V!44331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38596)

(assert (=> b!1169900 (= lt!526837 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!720 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169912 () Bool)

(declare-fun res!776342 () Bool)

(assert (=> b!1169912 (=> (not res!776342) (not e!664920))))

(declare-datatypes ((List!25581 0))(
  ( (Nil!25578) (Cons!25577 (h!26786 (_ BitVec 64)) (t!37446 List!25581)) )
))
(declare-fun arrayNoDuplicates!0 (array!75629 (_ BitVec 32) List!25581) Bool)

(assert (=> b!1169912 (= res!776342 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25578))))

(declare-fun b!1169913 () Bool)

(declare-fun res!776334 () Bool)

(assert (=> b!1169913 (=> (not res!776334) (not e!664919))))

(assert (=> b!1169913 (= res!776334 (arrayNoDuplicates!0 lt!526836 #b00000000000000000000000000000000 Nil!25578))))

(declare-fun b!1169914 () Bool)

(assert (=> b!1169914 (= e!664914 tp_is_empty!29403)))

(declare-fun b!1169915 () Bool)

(declare-fun res!776340 () Bool)

(assert (=> b!1169915 (=> (not res!776340) (not e!664920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169915 (= res!776340 (validMask!0 mask!1564))))

(assert (= (and start!99294 res!776347) b!1169915))

(assert (= (and b!1169915 res!776340) b!1169904))

(assert (= (and b!1169904 res!776337) b!1169899))

(assert (= (and b!1169899 res!776339) b!1169912))

(assert (= (and b!1169912 res!776342) b!1169902))

(assert (= (and b!1169902 res!776346) b!1169903))

(assert (= (and b!1169903 res!776336) b!1169901))

(assert (= (and b!1169901 res!776343) b!1169907))

(assert (= (and b!1169907 res!776345) b!1169913))

(assert (= (and b!1169913 res!776334) b!1169910))

(assert (= (and b!1169910 (not res!776341)) b!1169898))

(assert (= (and b!1169898 (not res!776338)) b!1169900))

(assert (= (and b!1169900 (not res!776335)) b!1169909))

(assert (= (and b!1169909 res!776344) b!1169906))

(assert (= (and b!1169906 (not res!776333)) b!1169908))

(assert (= (and b!1169905 condMapEmpty!45932) mapIsEmpty!45932))

(assert (= (and b!1169905 (not condMapEmpty!45932)) mapNonEmpty!45932))

(get-info :version)

(assert (= (and mapNonEmpty!45932 ((_ is ValueCellFull!13992) mapValue!45932)) b!1169911))

(assert (= (and b!1169905 ((_ is ValueCellFull!13992) mapDefault!45932)) b!1169914))

(assert (= start!99294 b!1169905))

(declare-fun b_lambda!20017 () Bool)

(assert (=> (not b_lambda!20017) (not b!1169898)))

(declare-fun t!37444 () Bool)

(declare-fun tb!9685 () Bool)

(assert (=> (and start!99294 (= defaultEntry!1004 defaultEntry!1004) t!37444) tb!9685))

(declare-fun result!19937 () Bool)

(assert (=> tb!9685 (= result!19937 tp_is_empty!29403)))

(assert (=> b!1169898 t!37444))

(declare-fun b_and!40615 () Bool)

(assert (= b_and!40613 (and (=> t!37444 result!19937) b_and!40615)))

(declare-fun m!1077741 () Bool)

(assert (=> b!1169907 m!1077741))

(declare-fun m!1077743 () Bool)

(assert (=> b!1169907 m!1077743))

(declare-fun m!1077745 () Bool)

(assert (=> b!1169898 m!1077745))

(declare-fun m!1077747 () Bool)

(assert (=> b!1169898 m!1077747))

(declare-fun m!1077749 () Bool)

(assert (=> b!1169898 m!1077749))

(declare-fun m!1077751 () Bool)

(assert (=> b!1169898 m!1077751))

(declare-fun m!1077753 () Bool)

(assert (=> b!1169912 m!1077753))

(declare-fun m!1077755 () Bool)

(assert (=> mapNonEmpty!45932 m!1077755))

(declare-fun m!1077757 () Bool)

(assert (=> b!1169908 m!1077757))

(declare-fun m!1077759 () Bool)

(assert (=> b!1169915 m!1077759))

(declare-fun m!1077761 () Bool)

(assert (=> b!1169903 m!1077761))

(declare-fun m!1077763 () Bool)

(assert (=> b!1169909 m!1077763))

(declare-fun m!1077765 () Bool)

(assert (=> b!1169909 m!1077765))

(assert (=> b!1169909 m!1077765))

(declare-fun m!1077767 () Bool)

(assert (=> b!1169909 m!1077767))

(declare-fun m!1077769 () Bool)

(assert (=> b!1169909 m!1077769))

(declare-fun m!1077771 () Bool)

(assert (=> b!1169910 m!1077771))

(declare-fun m!1077773 () Bool)

(assert (=> b!1169910 m!1077773))

(declare-fun m!1077775 () Bool)

(assert (=> b!1169899 m!1077775))

(declare-fun m!1077777 () Bool)

(assert (=> b!1169900 m!1077777))

(declare-fun m!1077779 () Bool)

(assert (=> b!1169900 m!1077779))

(declare-fun m!1077781 () Bool)

(assert (=> b!1169900 m!1077781))

(declare-fun m!1077783 () Bool)

(assert (=> b!1169900 m!1077783))

(assert (=> b!1169900 m!1077763))

(declare-fun m!1077785 () Bool)

(assert (=> b!1169900 m!1077785))

(assert (=> b!1169900 m!1077763))

(declare-fun m!1077787 () Bool)

(assert (=> start!99294 m!1077787))

(declare-fun m!1077789 () Bool)

(assert (=> start!99294 m!1077789))

(declare-fun m!1077791 () Bool)

(assert (=> b!1169901 m!1077791))

(assert (=> b!1169906 m!1077763))

(declare-fun m!1077793 () Bool)

(assert (=> b!1169913 m!1077793))

(check-sat (not b_next!24873) (not b!1169915) tp_is_empty!29403 b_and!40615 (not b!1169907) (not start!99294) (not b!1169912) (not b_lambda!20017) (not b!1169908) (not b!1169903) (not b!1169910) (not b!1169909) (not b!1169898) (not b!1169899) (not b!1169913) (not mapNonEmpty!45932) (not b!1169900))
(check-sat b_and!40615 (not b_next!24873))
