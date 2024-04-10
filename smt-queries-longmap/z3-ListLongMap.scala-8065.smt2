; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99232 () Bool)

(assert start!99232)

(declare-fun b_free!24837 () Bool)

(declare-fun b_next!24837 () Bool)

(assert (=> start!99232 (= b_free!24837 (not b_next!24837))))

(declare-fun tp!87222 () Bool)

(declare-fun b_and!40523 () Bool)

(assert (=> start!99232 (= tp!87222 b_and!40523)))

(declare-fun b!1168755 () Bool)

(declare-fun e!664238 () Bool)

(declare-fun e!664237 () Bool)

(assert (=> b!1168755 (= e!664238 e!664237)))

(declare-fun res!775476 () Bool)

(assert (=> b!1168755 (=> res!775476 e!664237)))

(declare-datatypes ((array!75555 0))(
  ( (array!75556 (arr!36428 (Array (_ BitVec 32) (_ BitVec 64))) (size!36964 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75555)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168755 (= res!775476 (not (validKeyInArray!0 (select (arr!36428 _keys!1208) from!1455))))))

(declare-datatypes ((V!44283 0))(
  ( (V!44284 (val!14740 Int)) )
))
(declare-datatypes ((tuple2!18816 0))(
  ( (tuple2!18817 (_1!9419 (_ BitVec 64)) (_2!9419 V!44283)) )
))
(declare-datatypes ((List!25554 0))(
  ( (Nil!25551) (Cons!25550 (h!26759 tuple2!18816) (t!37383 List!25554)) )
))
(declare-datatypes ((ListLongMap!16785 0))(
  ( (ListLongMap!16786 (toList!8408 List!25554)) )
))
(declare-fun lt!526219 () ListLongMap!16785)

(declare-fun lt!526224 () ListLongMap!16785)

(assert (=> b!1168755 (= lt!526219 lt!526224)))

(declare-fun lt!526226 () ListLongMap!16785)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1480 (ListLongMap!16785 (_ BitVec 64)) ListLongMap!16785)

(assert (=> b!1168755 (= lt!526224 (-!1480 lt!526226 k0!934))))

(declare-fun zeroValue!944 () V!44283)

(declare-fun lt!526222 () array!75555)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44283)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13974 0))(
  ( (ValueCellFull!13974 (v!17377 V!44283)) (EmptyCell!13974) )
))
(declare-datatypes ((array!75557 0))(
  ( (array!75558 (arr!36429 (Array (_ BitVec 32) ValueCell!13974)) (size!36965 (_ BitVec 32))) )
))
(declare-fun lt!526227 () array!75557)

(declare-fun getCurrentListMapNoExtraKeys!4872 (array!75555 array!75557 (_ BitVec 32) (_ BitVec 32) V!44283 V!44283 (_ BitVec 32) Int) ListLongMap!16785)

(assert (=> b!1168755 (= lt!526219 (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75557)

(assert (=> b!1168755 (= lt!526226 (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38568 0))(
  ( (Unit!38569) )
))
(declare-fun lt!526225 () Unit!38568)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!707 (array!75555 array!75557 (_ BitVec 32) (_ BitVec 32) V!44283 V!44283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38568)

(assert (=> b!1168755 (= lt!526225 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!707 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45875 () Bool)

(declare-fun mapRes!45875 () Bool)

(declare-fun tp!87221 () Bool)

(declare-fun e!664242 () Bool)

(assert (=> mapNonEmpty!45875 (= mapRes!45875 (and tp!87221 e!664242))))

(declare-fun mapValue!45875 () ValueCell!13974)

(declare-fun mapRest!45875 () (Array (_ BitVec 32) ValueCell!13974))

(declare-fun mapKey!45875 () (_ BitVec 32))

(assert (=> mapNonEmpty!45875 (= (arr!36429 _values!996) (store mapRest!45875 mapKey!45875 mapValue!45875))))

(declare-fun b!1168756 () Bool)

(declare-fun res!775483 () Bool)

(declare-fun e!664240 () Bool)

(assert (=> b!1168756 (=> (not res!775483) (not e!664240))))

(assert (=> b!1168756 (= res!775483 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36964 _keys!1208))))))

(declare-fun b!1168757 () Bool)

(assert (=> b!1168757 (= e!664237 (or (not (= (select (arr!36428 _keys!1208) from!1455) k0!934)) (bvslt (size!36964 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun lt!526218 () ListLongMap!16785)

(declare-fun lt!526223 () V!44283)

(declare-fun +!3742 (ListLongMap!16785 tuple2!18816) ListLongMap!16785)

(declare-fun get!18566 (ValueCell!13974 V!44283) V!44283)

(assert (=> b!1168757 (= lt!526218 (+!3742 lt!526224 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223))))))

(declare-fun res!775474 () Bool)

(assert (=> start!99232 (=> (not res!775474) (not e!664240))))

(assert (=> start!99232 (= res!775474 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36964 _keys!1208))))))

(assert (=> start!99232 e!664240))

(declare-fun tp_is_empty!29367 () Bool)

(assert (=> start!99232 tp_is_empty!29367))

(declare-fun array_inv!27842 (array!75555) Bool)

(assert (=> start!99232 (array_inv!27842 _keys!1208)))

(assert (=> start!99232 true))

(assert (=> start!99232 tp!87222))

(declare-fun e!664239 () Bool)

(declare-fun array_inv!27843 (array!75557) Bool)

(assert (=> start!99232 (and (array_inv!27843 _values!996) e!664239)))

(declare-fun mapIsEmpty!45875 () Bool)

(assert (=> mapIsEmpty!45875 mapRes!45875))

(declare-fun b!1168758 () Bool)

(declare-fun res!775479 () Bool)

(assert (=> b!1168758 (=> (not res!775479) (not e!664240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168758 (= res!775479 (validMask!0 mask!1564))))

(declare-fun b!1168759 () Bool)

(declare-fun e!664241 () Bool)

(assert (=> b!1168759 (= e!664240 e!664241)))

(declare-fun res!775477 () Bool)

(assert (=> b!1168759 (=> (not res!775477) (not e!664241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75555 (_ BitVec 32)) Bool)

(assert (=> b!1168759 (= res!775477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526222 mask!1564))))

(assert (=> b!1168759 (= lt!526222 (array!75556 (store (arr!36428 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36964 _keys!1208)))))

(declare-fun b!1168760 () Bool)

(declare-fun res!775482 () Bool)

(assert (=> b!1168760 (=> (not res!775482) (not e!664240))))

(declare-datatypes ((List!25555 0))(
  ( (Nil!25552) (Cons!25551 (h!26760 (_ BitVec 64)) (t!37384 List!25555)) )
))
(declare-fun arrayNoDuplicates!0 (array!75555 (_ BitVec 32) List!25555) Bool)

(assert (=> b!1168760 (= res!775482 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25552))))

(declare-fun b!1168761 () Bool)

(declare-fun res!775481 () Bool)

(assert (=> b!1168761 (=> (not res!775481) (not e!664240))))

(assert (=> b!1168761 (= res!775481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168762 () Bool)

(declare-fun res!775472 () Bool)

(assert (=> b!1168762 (=> (not res!775472) (not e!664240))))

(assert (=> b!1168762 (= res!775472 (and (= (size!36965 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36964 _keys!1208) (size!36965 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168763 () Bool)

(declare-fun res!775475 () Bool)

(assert (=> b!1168763 (=> (not res!775475) (not e!664240))))

(assert (=> b!1168763 (= res!775475 (= (select (arr!36428 _keys!1208) i!673) k0!934))))

(declare-fun b!1168764 () Bool)

(declare-fun e!664235 () Bool)

(assert (=> b!1168764 (= e!664239 (and e!664235 mapRes!45875))))

(declare-fun condMapEmpty!45875 () Bool)

(declare-fun mapDefault!45875 () ValueCell!13974)

(assert (=> b!1168764 (= condMapEmpty!45875 (= (arr!36429 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13974)) mapDefault!45875)))))

(declare-fun b!1168765 () Bool)

(assert (=> b!1168765 (= e!664235 tp_is_empty!29367)))

(declare-fun b!1168766 () Bool)

(declare-fun res!775484 () Bool)

(assert (=> b!1168766 (=> (not res!775484) (not e!664241))))

(assert (=> b!1168766 (= res!775484 (arrayNoDuplicates!0 lt!526222 #b00000000000000000000000000000000 Nil!25552))))

(declare-fun b!1168767 () Bool)

(declare-fun e!664236 () Bool)

(assert (=> b!1168767 (= e!664236 e!664238)))

(declare-fun res!775478 () Bool)

(assert (=> b!1168767 (=> res!775478 e!664238)))

(assert (=> b!1168767 (= res!775478 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1168767 (= lt!526218 (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1168767 (= lt!526227 (array!75558 (store (arr!36429 _values!996) i!673 (ValueCellFull!13974 lt!526223)) (size!36965 _values!996)))))

(declare-fun dynLambda!2851 (Int (_ BitVec 64)) V!44283)

(assert (=> b!1168767 (= lt!526223 (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526221 () ListLongMap!16785)

(assert (=> b!1168767 (= lt!526221 (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168768 () Bool)

(declare-fun res!775473 () Bool)

(assert (=> b!1168768 (=> (not res!775473) (not e!664240))))

(assert (=> b!1168768 (= res!775473 (validKeyInArray!0 k0!934))))

(declare-fun b!1168769 () Bool)

(assert (=> b!1168769 (= e!664242 tp_is_empty!29367)))

(declare-fun b!1168770 () Bool)

(assert (=> b!1168770 (= e!664241 (not e!664236))))

(declare-fun res!775480 () Bool)

(assert (=> b!1168770 (=> res!775480 e!664236)))

(assert (=> b!1168770 (= res!775480 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168770 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526220 () Unit!38568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75555 (_ BitVec 64) (_ BitVec 32)) Unit!38568)

(assert (=> b!1168770 (= lt!526220 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99232 res!775474) b!1168758))

(assert (= (and b!1168758 res!775479) b!1168762))

(assert (= (and b!1168762 res!775472) b!1168761))

(assert (= (and b!1168761 res!775481) b!1168760))

(assert (= (and b!1168760 res!775482) b!1168756))

(assert (= (and b!1168756 res!775483) b!1168768))

(assert (= (and b!1168768 res!775473) b!1168763))

(assert (= (and b!1168763 res!775475) b!1168759))

(assert (= (and b!1168759 res!775477) b!1168766))

(assert (= (and b!1168766 res!775484) b!1168770))

(assert (= (and b!1168770 (not res!775480)) b!1168767))

(assert (= (and b!1168767 (not res!775478)) b!1168755))

(assert (= (and b!1168755 (not res!775476)) b!1168757))

(assert (= (and b!1168764 condMapEmpty!45875) mapIsEmpty!45875))

(assert (= (and b!1168764 (not condMapEmpty!45875)) mapNonEmpty!45875))

(get-info :version)

(assert (= (and mapNonEmpty!45875 ((_ is ValueCellFull!13974) mapValue!45875)) b!1168769))

(assert (= (and b!1168764 ((_ is ValueCellFull!13974) mapDefault!45875)) b!1168765))

(assert (= start!99232 b!1168764))

(declare-fun b_lambda!19943 () Bool)

(assert (=> (not b_lambda!19943) (not b!1168767)))

(declare-fun t!37382 () Bool)

(declare-fun tb!9649 () Bool)

(assert (=> (and start!99232 (= defaultEntry!1004 defaultEntry!1004) t!37382) tb!9649))

(declare-fun result!19863 () Bool)

(assert (=> tb!9649 (= result!19863 tp_is_empty!29367)))

(assert (=> b!1168767 t!37382))

(declare-fun b_and!40525 () Bool)

(assert (= b_and!40523 (and (=> t!37382 result!19863) b_and!40525)))

(declare-fun m!1076601 () Bool)

(assert (=> start!99232 m!1076601))

(declare-fun m!1076603 () Bool)

(assert (=> start!99232 m!1076603))

(declare-fun m!1076605 () Bool)

(assert (=> b!1168757 m!1076605))

(declare-fun m!1076607 () Bool)

(assert (=> b!1168757 m!1076607))

(assert (=> b!1168757 m!1076607))

(declare-fun m!1076609 () Bool)

(assert (=> b!1168757 m!1076609))

(declare-fun m!1076611 () Bool)

(assert (=> b!1168757 m!1076611))

(declare-fun m!1076613 () Bool)

(assert (=> b!1168768 m!1076613))

(declare-fun m!1076615 () Bool)

(assert (=> b!1168761 m!1076615))

(declare-fun m!1076617 () Bool)

(assert (=> mapNonEmpty!45875 m!1076617))

(declare-fun m!1076619 () Bool)

(assert (=> b!1168759 m!1076619))

(declare-fun m!1076621 () Bool)

(assert (=> b!1168759 m!1076621))

(declare-fun m!1076623 () Bool)

(assert (=> b!1168767 m!1076623))

(declare-fun m!1076625 () Bool)

(assert (=> b!1168767 m!1076625))

(declare-fun m!1076627 () Bool)

(assert (=> b!1168767 m!1076627))

(declare-fun m!1076629 () Bool)

(assert (=> b!1168767 m!1076629))

(declare-fun m!1076631 () Bool)

(assert (=> b!1168763 m!1076631))

(declare-fun m!1076633 () Bool)

(assert (=> b!1168760 m!1076633))

(declare-fun m!1076635 () Bool)

(assert (=> b!1168758 m!1076635))

(declare-fun m!1076637 () Bool)

(assert (=> b!1168766 m!1076637))

(declare-fun m!1076639 () Bool)

(assert (=> b!1168755 m!1076639))

(declare-fun m!1076641 () Bool)

(assert (=> b!1168755 m!1076641))

(declare-fun m!1076643 () Bool)

(assert (=> b!1168755 m!1076643))

(assert (=> b!1168755 m!1076605))

(declare-fun m!1076645 () Bool)

(assert (=> b!1168755 m!1076645))

(declare-fun m!1076647 () Bool)

(assert (=> b!1168755 m!1076647))

(assert (=> b!1168755 m!1076605))

(declare-fun m!1076649 () Bool)

(assert (=> b!1168770 m!1076649))

(declare-fun m!1076651 () Bool)

(assert (=> b!1168770 m!1076651))

(check-sat (not b_lambda!19943) (not b!1168758) (not b!1168767) (not b!1168770) (not b!1168760) (not b!1168755) (not b!1168761) (not b_next!24837) tp_is_empty!29367 (not mapNonEmpty!45875) (not b!1168768) (not b!1168757) b_and!40525 (not b!1168766) (not b!1168759) (not start!99232))
(check-sat b_and!40525 (not b_next!24837))
(get-model)

(declare-fun b_lambda!19947 () Bool)

(assert (= b_lambda!19943 (or (and start!99232 b_free!24837) b_lambda!19947)))

(check-sat (not b_lambda!19947) (not b!1168758) (not b!1168767) (not b!1168770) (not b!1168760) (not b!1168755) (not b!1168761) (not b_next!24837) tp_is_empty!29367 (not mapNonEmpty!45875) (not b!1168768) (not b!1168757) b_and!40525 (not b!1168766) (not b!1168759) (not start!99232))
(check-sat b_and!40525 (not b_next!24837))
(get-model)

(declare-fun b!1168831 () Bool)

(declare-fun e!664277 () Bool)

(declare-fun call!57100 () Bool)

(assert (=> b!1168831 (= e!664277 call!57100)))

(declare-fun b!1168832 () Bool)

(declare-fun e!664278 () Bool)

(declare-fun e!664276 () Bool)

(assert (=> b!1168832 (= e!664278 e!664276)))

(declare-fun c!116527 () Bool)

(assert (=> b!1168832 (= c!116527 (validKeyInArray!0 (select (arr!36428 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57097 () Bool)

(assert (=> bm!57097 (= call!57100 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1168834 () Bool)

(assert (=> b!1168834 (= e!664276 e!664277)))

(declare-fun lt!526266 () (_ BitVec 64))

(assert (=> b!1168834 (= lt!526266 (select (arr!36428 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!526264 () Unit!38568)

(assert (=> b!1168834 (= lt!526264 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!526266 #b00000000000000000000000000000000))))

(assert (=> b!1168834 (arrayContainsKey!0 _keys!1208 lt!526266 #b00000000000000000000000000000000)))

(declare-fun lt!526265 () Unit!38568)

(assert (=> b!1168834 (= lt!526265 lt!526264)))

(declare-fun res!775528 () Bool)

(declare-datatypes ((SeekEntryResult!9927 0))(
  ( (MissingZero!9927 (index!42079 (_ BitVec 32))) (Found!9927 (index!42080 (_ BitVec 32))) (Intermediate!9927 (undefined!10739 Bool) (index!42081 (_ BitVec 32)) (x!103619 (_ BitVec 32))) (Undefined!9927) (MissingVacant!9927 (index!42082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!75555 (_ BitVec 32)) SeekEntryResult!9927)

(assert (=> b!1168834 (= res!775528 (= (seekEntryOrOpen!0 (select (arr!36428 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9927 #b00000000000000000000000000000000)))))

(assert (=> b!1168834 (=> (not res!775528) (not e!664277))))

(declare-fun d!131923 () Bool)

(declare-fun res!775529 () Bool)

(assert (=> d!131923 (=> res!775529 e!664278)))

(assert (=> d!131923 (= res!775529 (bvsge #b00000000000000000000000000000000 (size!36964 _keys!1208)))))

(assert (=> d!131923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!664278)))

(declare-fun b!1168833 () Bool)

(assert (=> b!1168833 (= e!664276 call!57100)))

(assert (= (and d!131923 (not res!775529)) b!1168832))

(assert (= (and b!1168832 c!116527) b!1168834))

(assert (= (and b!1168832 (not c!116527)) b!1168833))

(assert (= (and b!1168834 res!775528) b!1168831))

(assert (= (or b!1168831 b!1168833) bm!57097))

(declare-fun m!1076705 () Bool)

(assert (=> b!1168832 m!1076705))

(assert (=> b!1168832 m!1076705))

(declare-fun m!1076707 () Bool)

(assert (=> b!1168832 m!1076707))

(declare-fun m!1076709 () Bool)

(assert (=> bm!57097 m!1076709))

(assert (=> b!1168834 m!1076705))

(declare-fun m!1076711 () Bool)

(assert (=> b!1168834 m!1076711))

(declare-fun m!1076713 () Bool)

(assert (=> b!1168834 m!1076713))

(assert (=> b!1168834 m!1076705))

(declare-fun m!1076715 () Bool)

(assert (=> b!1168834 m!1076715))

(assert (=> b!1168761 d!131923))

(declare-fun d!131925 () Bool)

(declare-fun e!664281 () Bool)

(assert (=> d!131925 e!664281))

(declare-fun res!775534 () Bool)

(assert (=> d!131925 (=> (not res!775534) (not e!664281))))

(declare-fun lt!526278 () ListLongMap!16785)

(declare-fun contains!6838 (ListLongMap!16785 (_ BitVec 64)) Bool)

(assert (=> d!131925 (= res!775534 (contains!6838 lt!526278 (_1!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223)))))))

(declare-fun lt!526275 () List!25554)

(assert (=> d!131925 (= lt!526278 (ListLongMap!16786 lt!526275))))

(declare-fun lt!526276 () Unit!38568)

(declare-fun lt!526277 () Unit!38568)

(assert (=> d!131925 (= lt!526276 lt!526277)))

(declare-datatypes ((Option!681 0))(
  ( (Some!680 (v!17379 V!44283)) (None!679) )
))
(declare-fun getValueByKey!630 (List!25554 (_ BitVec 64)) Option!681)

(assert (=> d!131925 (= (getValueByKey!630 lt!526275 (_1!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223)))) (Some!680 (_2!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!307 (List!25554 (_ BitVec 64) V!44283) Unit!38568)

(assert (=> d!131925 (= lt!526277 (lemmaContainsTupThenGetReturnValue!307 lt!526275 (_1!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223))) (_2!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223)))))))

(declare-fun insertStrictlySorted!400 (List!25554 (_ BitVec 64) V!44283) List!25554)

(assert (=> d!131925 (= lt!526275 (insertStrictlySorted!400 (toList!8408 lt!526224) (_1!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223))) (_2!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223)))))))

(assert (=> d!131925 (= (+!3742 lt!526224 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223))) lt!526278)))

(declare-fun b!1168839 () Bool)

(declare-fun res!775535 () Bool)

(assert (=> b!1168839 (=> (not res!775535) (not e!664281))))

(assert (=> b!1168839 (= res!775535 (= (getValueByKey!630 (toList!8408 lt!526278) (_1!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223)))) (Some!680 (_2!9419 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223))))))))

(declare-fun b!1168840 () Bool)

(declare-fun contains!6839 (List!25554 tuple2!18816) Bool)

(assert (=> b!1168840 (= e!664281 (contains!6839 (toList!8408 lt!526278) (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223))))))

(assert (= (and d!131925 res!775534) b!1168839))

(assert (= (and b!1168839 res!775535) b!1168840))

(declare-fun m!1076717 () Bool)

(assert (=> d!131925 m!1076717))

(declare-fun m!1076719 () Bool)

(assert (=> d!131925 m!1076719))

(declare-fun m!1076721 () Bool)

(assert (=> d!131925 m!1076721))

(declare-fun m!1076723 () Bool)

(assert (=> d!131925 m!1076723))

(declare-fun m!1076725 () Bool)

(assert (=> b!1168839 m!1076725))

(declare-fun m!1076727 () Bool)

(assert (=> b!1168840 m!1076727))

(assert (=> b!1168757 d!131925))

(declare-fun d!131927 () Bool)

(declare-fun c!116530 () Bool)

(assert (=> d!131927 (= c!116530 ((_ is ValueCellFull!13974) (select (arr!36429 _values!996) from!1455)))))

(declare-fun e!664284 () V!44283)

(assert (=> d!131927 (= (get!18566 (select (arr!36429 _values!996) from!1455) lt!526223) e!664284)))

(declare-fun b!1168845 () Bool)

(declare-fun get!18568 (ValueCell!13974 V!44283) V!44283)

(assert (=> b!1168845 (= e!664284 (get!18568 (select (arr!36429 _values!996) from!1455) lt!526223))))

(declare-fun b!1168846 () Bool)

(declare-fun get!18569 (ValueCell!13974 V!44283) V!44283)

(assert (=> b!1168846 (= e!664284 (get!18569 (select (arr!36429 _values!996) from!1455) lt!526223))))

(assert (= (and d!131927 c!116530) b!1168845))

(assert (= (and d!131927 (not c!116530)) b!1168846))

(assert (=> b!1168845 m!1076607))

(declare-fun m!1076729 () Bool)

(assert (=> b!1168845 m!1076729))

(assert (=> b!1168846 m!1076607))

(declare-fun m!1076731 () Bool)

(assert (=> b!1168846 m!1076731))

(assert (=> b!1168757 d!131927))

(declare-fun bm!57100 () Bool)

(declare-fun call!57103 () ListLongMap!16785)

(assert (=> bm!57100 (= call!57103 (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168871 () Bool)

(declare-fun e!664303 () Bool)

(assert (=> b!1168871 (= e!664303 (validKeyInArray!0 (select (arr!36428 lt!526222) from!1455)))))

(assert (=> b!1168871 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1168873 () Bool)

(declare-fun e!664299 () ListLongMap!16785)

(assert (=> b!1168873 (= e!664299 call!57103)))

(declare-fun b!1168874 () Bool)

(declare-fun e!664305 () Bool)

(declare-fun lt!526299 () ListLongMap!16785)

(declare-fun isEmpty!977 (ListLongMap!16785) Bool)

(assert (=> b!1168874 (= e!664305 (isEmpty!977 lt!526299))))

(declare-fun b!1168875 () Bool)

(declare-fun e!664302 () ListLongMap!16785)

(assert (=> b!1168875 (= e!664302 e!664299)))

(declare-fun c!116539 () Bool)

(assert (=> b!1168875 (= c!116539 (validKeyInArray!0 (select (arr!36428 lt!526222) from!1455)))))

(declare-fun b!1168876 () Bool)

(declare-fun res!775545 () Bool)

(declare-fun e!664300 () Bool)

(assert (=> b!1168876 (=> (not res!775545) (not e!664300))))

(assert (=> b!1168876 (= res!775545 (not (contains!6838 lt!526299 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168877 () Bool)

(declare-fun e!664304 () Bool)

(assert (=> b!1168877 (= e!664304 e!664305)))

(declare-fun c!116541 () Bool)

(assert (=> b!1168877 (= c!116541 (bvslt from!1455 (size!36964 lt!526222)))))

(declare-fun b!1168878 () Bool)

(declare-fun lt!526294 () Unit!38568)

(declare-fun lt!526293 () Unit!38568)

(assert (=> b!1168878 (= lt!526294 lt!526293)))

(declare-fun lt!526297 () (_ BitVec 64))

(declare-fun lt!526296 () ListLongMap!16785)

(declare-fun lt!526295 () (_ BitVec 64))

(declare-fun lt!526298 () V!44283)

(assert (=> b!1168878 (not (contains!6838 (+!3742 lt!526296 (tuple2!18817 lt!526295 lt!526298)) lt!526297))))

(declare-fun addStillNotContains!285 (ListLongMap!16785 (_ BitVec 64) V!44283 (_ BitVec 64)) Unit!38568)

(assert (=> b!1168878 (= lt!526293 (addStillNotContains!285 lt!526296 lt!526295 lt!526298 lt!526297))))

(assert (=> b!1168878 (= lt!526297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168878 (= lt!526298 (get!18566 (select (arr!36429 lt!526227) from!1455) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168878 (= lt!526295 (select (arr!36428 lt!526222) from!1455))))

(assert (=> b!1168878 (= lt!526296 call!57103)))

(assert (=> b!1168878 (= e!664299 (+!3742 call!57103 (tuple2!18817 (select (arr!36428 lt!526222) from!1455) (get!18566 (select (arr!36429 lt!526227) from!1455) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1168879 () Bool)

(assert (=> b!1168879 (= e!664302 (ListLongMap!16786 Nil!25551))))

(declare-fun b!1168880 () Bool)

(assert (=> b!1168880 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36964 lt!526222)))))

(assert (=> b!1168880 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36965 lt!526227)))))

(declare-fun e!664301 () Bool)

(declare-fun apply!957 (ListLongMap!16785 (_ BitVec 64)) V!44283)

(assert (=> b!1168880 (= e!664301 (= (apply!957 lt!526299 (select (arr!36428 lt!526222) from!1455)) (get!18566 (select (arr!36429 lt!526227) from!1455) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1168872 () Bool)

(assert (=> b!1168872 (= e!664304 e!664301)))

(assert (=> b!1168872 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36964 lt!526222)))))

(declare-fun res!775546 () Bool)

(assert (=> b!1168872 (= res!775546 (contains!6838 lt!526299 (select (arr!36428 lt!526222) from!1455)))))

(assert (=> b!1168872 (=> (not res!775546) (not e!664301))))

(declare-fun d!131929 () Bool)

(assert (=> d!131929 e!664300))

(declare-fun res!775544 () Bool)

(assert (=> d!131929 (=> (not res!775544) (not e!664300))))

(assert (=> d!131929 (= res!775544 (not (contains!6838 lt!526299 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131929 (= lt!526299 e!664302)))

(declare-fun c!116542 () Bool)

(assert (=> d!131929 (= c!116542 (bvsge from!1455 (size!36964 lt!526222)))))

(assert (=> d!131929 (validMask!0 mask!1564)))

(assert (=> d!131929 (= (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!526299)))

(declare-fun b!1168881 () Bool)

(assert (=> b!1168881 (= e!664305 (= lt!526299 (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168882 () Bool)

(assert (=> b!1168882 (= e!664300 e!664304)))

(declare-fun c!116540 () Bool)

(assert (=> b!1168882 (= c!116540 e!664303)))

(declare-fun res!775547 () Bool)

(assert (=> b!1168882 (=> (not res!775547) (not e!664303))))

(assert (=> b!1168882 (= res!775547 (bvslt from!1455 (size!36964 lt!526222)))))

(assert (= (and d!131929 c!116542) b!1168879))

(assert (= (and d!131929 (not c!116542)) b!1168875))

(assert (= (and b!1168875 c!116539) b!1168878))

(assert (= (and b!1168875 (not c!116539)) b!1168873))

(assert (= (or b!1168878 b!1168873) bm!57100))

(assert (= (and d!131929 res!775544) b!1168876))

(assert (= (and b!1168876 res!775545) b!1168882))

(assert (= (and b!1168882 res!775547) b!1168871))

(assert (= (and b!1168882 c!116540) b!1168872))

(assert (= (and b!1168882 (not c!116540)) b!1168877))

(assert (= (and b!1168872 res!775546) b!1168880))

(assert (= (and b!1168877 c!116541) b!1168881))

(assert (= (and b!1168877 (not c!116541)) b!1168874))

(declare-fun b_lambda!19949 () Bool)

(assert (=> (not b_lambda!19949) (not b!1168878)))

(assert (=> b!1168878 t!37382))

(declare-fun b_and!40531 () Bool)

(assert (= b_and!40525 (and (=> t!37382 result!19863) b_and!40531)))

(declare-fun b_lambda!19951 () Bool)

(assert (=> (not b_lambda!19951) (not b!1168880)))

(assert (=> b!1168880 t!37382))

(declare-fun b_and!40533 () Bool)

(assert (= b_and!40531 (and (=> t!37382 result!19863) b_and!40533)))

(declare-fun m!1076733 () Bool)

(assert (=> b!1168878 m!1076733))

(declare-fun m!1076735 () Bool)

(assert (=> b!1168878 m!1076735))

(assert (=> b!1168878 m!1076627))

(declare-fun m!1076737 () Bool)

(assert (=> b!1168878 m!1076737))

(assert (=> b!1168878 m!1076735))

(assert (=> b!1168878 m!1076627))

(declare-fun m!1076739 () Bool)

(assert (=> b!1168878 m!1076739))

(declare-fun m!1076741 () Bool)

(assert (=> b!1168878 m!1076741))

(assert (=> b!1168878 m!1076741))

(declare-fun m!1076743 () Bool)

(assert (=> b!1168878 m!1076743))

(declare-fun m!1076745 () Bool)

(assert (=> b!1168878 m!1076745))

(assert (=> b!1168872 m!1076733))

(assert (=> b!1168872 m!1076733))

(declare-fun m!1076747 () Bool)

(assert (=> b!1168872 m!1076747))

(declare-fun m!1076749 () Bool)

(assert (=> b!1168876 m!1076749))

(assert (=> b!1168880 m!1076733))

(assert (=> b!1168880 m!1076735))

(assert (=> b!1168880 m!1076627))

(assert (=> b!1168880 m!1076737))

(assert (=> b!1168880 m!1076733))

(declare-fun m!1076751 () Bool)

(assert (=> b!1168880 m!1076751))

(assert (=> b!1168880 m!1076735))

(assert (=> b!1168880 m!1076627))

(assert (=> b!1168875 m!1076733))

(assert (=> b!1168875 m!1076733))

(declare-fun m!1076753 () Bool)

(assert (=> b!1168875 m!1076753))

(declare-fun m!1076755 () Bool)

(assert (=> bm!57100 m!1076755))

(declare-fun m!1076757 () Bool)

(assert (=> d!131929 m!1076757))

(assert (=> d!131929 m!1076635))

(declare-fun m!1076759 () Bool)

(assert (=> b!1168874 m!1076759))

(assert (=> b!1168871 m!1076733))

(assert (=> b!1168871 m!1076733))

(assert (=> b!1168871 m!1076753))

(assert (=> b!1168881 m!1076755))

(assert (=> b!1168767 d!131929))

(declare-fun call!57104 () ListLongMap!16785)

(declare-fun bm!57101 () Bool)

(assert (=> bm!57101 (= call!57104 (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168883 () Bool)

(declare-fun e!664310 () Bool)

(assert (=> b!1168883 (= e!664310 (validKeyInArray!0 (select (arr!36428 _keys!1208) from!1455)))))

(assert (=> b!1168883 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1168885 () Bool)

(declare-fun e!664306 () ListLongMap!16785)

(assert (=> b!1168885 (= e!664306 call!57104)))

(declare-fun b!1168886 () Bool)

(declare-fun e!664312 () Bool)

(declare-fun lt!526306 () ListLongMap!16785)

(assert (=> b!1168886 (= e!664312 (isEmpty!977 lt!526306))))

(declare-fun b!1168887 () Bool)

(declare-fun e!664309 () ListLongMap!16785)

(assert (=> b!1168887 (= e!664309 e!664306)))

(declare-fun c!116543 () Bool)

(assert (=> b!1168887 (= c!116543 (validKeyInArray!0 (select (arr!36428 _keys!1208) from!1455)))))

(declare-fun b!1168888 () Bool)

(declare-fun res!775549 () Bool)

(declare-fun e!664307 () Bool)

(assert (=> b!1168888 (=> (not res!775549) (not e!664307))))

(assert (=> b!1168888 (= res!775549 (not (contains!6838 lt!526306 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168889 () Bool)

(declare-fun e!664311 () Bool)

(assert (=> b!1168889 (= e!664311 e!664312)))

(declare-fun c!116545 () Bool)

(assert (=> b!1168889 (= c!116545 (bvslt from!1455 (size!36964 _keys!1208)))))

(declare-fun b!1168890 () Bool)

(declare-fun lt!526301 () Unit!38568)

(declare-fun lt!526300 () Unit!38568)

(assert (=> b!1168890 (= lt!526301 lt!526300)))

(declare-fun lt!526304 () (_ BitVec 64))

(declare-fun lt!526302 () (_ BitVec 64))

(declare-fun lt!526305 () V!44283)

(declare-fun lt!526303 () ListLongMap!16785)

(assert (=> b!1168890 (not (contains!6838 (+!3742 lt!526303 (tuple2!18817 lt!526302 lt!526305)) lt!526304))))

(assert (=> b!1168890 (= lt!526300 (addStillNotContains!285 lt!526303 lt!526302 lt!526305 lt!526304))))

(assert (=> b!1168890 (= lt!526304 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168890 (= lt!526305 (get!18566 (select (arr!36429 _values!996) from!1455) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168890 (= lt!526302 (select (arr!36428 _keys!1208) from!1455))))

(assert (=> b!1168890 (= lt!526303 call!57104)))

(assert (=> b!1168890 (= e!664306 (+!3742 call!57104 (tuple2!18817 (select (arr!36428 _keys!1208) from!1455) (get!18566 (select (arr!36429 _values!996) from!1455) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1168891 () Bool)

(assert (=> b!1168891 (= e!664309 (ListLongMap!16786 Nil!25551))))

(declare-fun b!1168892 () Bool)

(assert (=> b!1168892 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36964 _keys!1208)))))

(assert (=> b!1168892 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36965 _values!996)))))

(declare-fun e!664308 () Bool)

(assert (=> b!1168892 (= e!664308 (= (apply!957 lt!526306 (select (arr!36428 _keys!1208) from!1455)) (get!18566 (select (arr!36429 _values!996) from!1455) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1168884 () Bool)

(assert (=> b!1168884 (= e!664311 e!664308)))

(assert (=> b!1168884 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!36964 _keys!1208)))))

(declare-fun res!775550 () Bool)

(assert (=> b!1168884 (= res!775550 (contains!6838 lt!526306 (select (arr!36428 _keys!1208) from!1455)))))

(assert (=> b!1168884 (=> (not res!775550) (not e!664308))))

(declare-fun d!131931 () Bool)

(assert (=> d!131931 e!664307))

(declare-fun res!775548 () Bool)

(assert (=> d!131931 (=> (not res!775548) (not e!664307))))

(assert (=> d!131931 (= res!775548 (not (contains!6838 lt!526306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131931 (= lt!526306 e!664309)))

(declare-fun c!116546 () Bool)

(assert (=> d!131931 (= c!116546 (bvsge from!1455 (size!36964 _keys!1208)))))

(assert (=> d!131931 (validMask!0 mask!1564)))

(assert (=> d!131931 (= (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!526306)))

(declare-fun b!1168893 () Bool)

(assert (=> b!1168893 (= e!664312 (= lt!526306 (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168894 () Bool)

(assert (=> b!1168894 (= e!664307 e!664311)))

(declare-fun c!116544 () Bool)

(assert (=> b!1168894 (= c!116544 e!664310)))

(declare-fun res!775551 () Bool)

(assert (=> b!1168894 (=> (not res!775551) (not e!664310))))

(assert (=> b!1168894 (= res!775551 (bvslt from!1455 (size!36964 _keys!1208)))))

(assert (= (and d!131931 c!116546) b!1168891))

(assert (= (and d!131931 (not c!116546)) b!1168887))

(assert (= (and b!1168887 c!116543) b!1168890))

(assert (= (and b!1168887 (not c!116543)) b!1168885))

(assert (= (or b!1168890 b!1168885) bm!57101))

(assert (= (and d!131931 res!775548) b!1168888))

(assert (= (and b!1168888 res!775549) b!1168894))

(assert (= (and b!1168894 res!775551) b!1168883))

(assert (= (and b!1168894 c!116544) b!1168884))

(assert (= (and b!1168894 (not c!116544)) b!1168889))

(assert (= (and b!1168884 res!775550) b!1168892))

(assert (= (and b!1168889 c!116545) b!1168893))

(assert (= (and b!1168889 (not c!116545)) b!1168886))

(declare-fun b_lambda!19953 () Bool)

(assert (=> (not b_lambda!19953) (not b!1168890)))

(assert (=> b!1168890 t!37382))

(declare-fun b_and!40535 () Bool)

(assert (= b_and!40533 (and (=> t!37382 result!19863) b_and!40535)))

(declare-fun b_lambda!19955 () Bool)

(assert (=> (not b_lambda!19955) (not b!1168892)))

(assert (=> b!1168892 t!37382))

(declare-fun b_and!40537 () Bool)

(assert (= b_and!40535 (and (=> t!37382 result!19863) b_and!40537)))

(assert (=> b!1168890 m!1076605))

(assert (=> b!1168890 m!1076607))

(assert (=> b!1168890 m!1076627))

(declare-fun m!1076761 () Bool)

(assert (=> b!1168890 m!1076761))

(assert (=> b!1168890 m!1076607))

(assert (=> b!1168890 m!1076627))

(declare-fun m!1076763 () Bool)

(assert (=> b!1168890 m!1076763))

(declare-fun m!1076765 () Bool)

(assert (=> b!1168890 m!1076765))

(assert (=> b!1168890 m!1076765))

(declare-fun m!1076767 () Bool)

(assert (=> b!1168890 m!1076767))

(declare-fun m!1076769 () Bool)

(assert (=> b!1168890 m!1076769))

(assert (=> b!1168884 m!1076605))

(assert (=> b!1168884 m!1076605))

(declare-fun m!1076771 () Bool)

(assert (=> b!1168884 m!1076771))

(declare-fun m!1076773 () Bool)

(assert (=> b!1168888 m!1076773))

(assert (=> b!1168892 m!1076605))

(assert (=> b!1168892 m!1076607))

(assert (=> b!1168892 m!1076627))

(assert (=> b!1168892 m!1076761))

(assert (=> b!1168892 m!1076605))

(declare-fun m!1076775 () Bool)

(assert (=> b!1168892 m!1076775))

(assert (=> b!1168892 m!1076607))

(assert (=> b!1168892 m!1076627))

(assert (=> b!1168887 m!1076605))

(assert (=> b!1168887 m!1076605))

(assert (=> b!1168887 m!1076645))

(declare-fun m!1076777 () Bool)

(assert (=> bm!57101 m!1076777))

(declare-fun m!1076779 () Bool)

(assert (=> d!131931 m!1076779))

(assert (=> d!131931 m!1076635))

(declare-fun m!1076781 () Bool)

(assert (=> b!1168886 m!1076781))

(assert (=> b!1168883 m!1076605))

(assert (=> b!1168883 m!1076605))

(assert (=> b!1168883 m!1076645))

(assert (=> b!1168893 m!1076777))

(assert (=> b!1168767 d!131931))

(declare-fun d!131933 () Bool)

(assert (=> d!131933 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1168768 d!131933))

(declare-fun d!131935 () Bool)

(assert (=> d!131935 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1168758 d!131935))

(declare-fun bm!57102 () Bool)

(declare-fun call!57105 () ListLongMap!16785)

(assert (=> bm!57102 (= call!57105 (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168895 () Bool)

(declare-fun e!664317 () Bool)

(assert (=> b!1168895 (= e!664317 (validKeyInArray!0 (select (arr!36428 lt!526222) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168895 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1168897 () Bool)

(declare-fun e!664313 () ListLongMap!16785)

(assert (=> b!1168897 (= e!664313 call!57105)))

(declare-fun b!1168898 () Bool)

(declare-fun e!664319 () Bool)

(declare-fun lt!526313 () ListLongMap!16785)

(assert (=> b!1168898 (= e!664319 (isEmpty!977 lt!526313))))

(declare-fun b!1168899 () Bool)

(declare-fun e!664316 () ListLongMap!16785)

(assert (=> b!1168899 (= e!664316 e!664313)))

(declare-fun c!116547 () Bool)

(assert (=> b!1168899 (= c!116547 (validKeyInArray!0 (select (arr!36428 lt!526222) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1168900 () Bool)

(declare-fun res!775553 () Bool)

(declare-fun e!664314 () Bool)

(assert (=> b!1168900 (=> (not res!775553) (not e!664314))))

(assert (=> b!1168900 (= res!775553 (not (contains!6838 lt!526313 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168901 () Bool)

(declare-fun e!664318 () Bool)

(assert (=> b!1168901 (= e!664318 e!664319)))

(declare-fun c!116549 () Bool)

(assert (=> b!1168901 (= c!116549 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 lt!526222)))))

(declare-fun b!1168902 () Bool)

(declare-fun lt!526308 () Unit!38568)

(declare-fun lt!526307 () Unit!38568)

(assert (=> b!1168902 (= lt!526308 lt!526307)))

(declare-fun lt!526312 () V!44283)

(declare-fun lt!526311 () (_ BitVec 64))

(declare-fun lt!526309 () (_ BitVec 64))

(declare-fun lt!526310 () ListLongMap!16785)

(assert (=> b!1168902 (not (contains!6838 (+!3742 lt!526310 (tuple2!18817 lt!526309 lt!526312)) lt!526311))))

(assert (=> b!1168902 (= lt!526307 (addStillNotContains!285 lt!526310 lt!526309 lt!526312 lt!526311))))

(assert (=> b!1168902 (= lt!526311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168902 (= lt!526312 (get!18566 (select (arr!36429 lt!526227) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168902 (= lt!526309 (select (arr!36428 lt!526222) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1168902 (= lt!526310 call!57105)))

(assert (=> b!1168902 (= e!664313 (+!3742 call!57105 (tuple2!18817 (select (arr!36428 lt!526222) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18566 (select (arr!36429 lt!526227) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1168903 () Bool)

(assert (=> b!1168903 (= e!664316 (ListLongMap!16786 Nil!25551))))

(declare-fun b!1168904 () Bool)

(assert (=> b!1168904 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 lt!526222)))))

(assert (=> b!1168904 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36965 lt!526227)))))

(declare-fun e!664315 () Bool)

(assert (=> b!1168904 (= e!664315 (= (apply!957 lt!526313 (select (arr!36428 lt!526222) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18566 (select (arr!36429 lt!526227) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1168896 () Bool)

(assert (=> b!1168896 (= e!664318 e!664315)))

(assert (=> b!1168896 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 lt!526222)))))

(declare-fun res!775554 () Bool)

(assert (=> b!1168896 (= res!775554 (contains!6838 lt!526313 (select (arr!36428 lt!526222) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168896 (=> (not res!775554) (not e!664315))))

(declare-fun d!131937 () Bool)

(assert (=> d!131937 e!664314))

(declare-fun res!775552 () Bool)

(assert (=> d!131937 (=> (not res!775552) (not e!664314))))

(assert (=> d!131937 (= res!775552 (not (contains!6838 lt!526313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131937 (= lt!526313 e!664316)))

(declare-fun c!116550 () Bool)

(assert (=> d!131937 (= c!116550 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 lt!526222)))))

(assert (=> d!131937 (validMask!0 mask!1564)))

(assert (=> d!131937 (= (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526313)))

(declare-fun b!1168905 () Bool)

(assert (=> b!1168905 (= e!664319 (= lt!526313 (getCurrentListMapNoExtraKeys!4872 lt!526222 lt!526227 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168906 () Bool)

(assert (=> b!1168906 (= e!664314 e!664318)))

(declare-fun c!116548 () Bool)

(assert (=> b!1168906 (= c!116548 e!664317)))

(declare-fun res!775555 () Bool)

(assert (=> b!1168906 (=> (not res!775555) (not e!664317))))

(assert (=> b!1168906 (= res!775555 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 lt!526222)))))

(assert (= (and d!131937 c!116550) b!1168903))

(assert (= (and d!131937 (not c!116550)) b!1168899))

(assert (= (and b!1168899 c!116547) b!1168902))

(assert (= (and b!1168899 (not c!116547)) b!1168897))

(assert (= (or b!1168902 b!1168897) bm!57102))

(assert (= (and d!131937 res!775552) b!1168900))

(assert (= (and b!1168900 res!775553) b!1168906))

(assert (= (and b!1168906 res!775555) b!1168895))

(assert (= (and b!1168906 c!116548) b!1168896))

(assert (= (and b!1168906 (not c!116548)) b!1168901))

(assert (= (and b!1168896 res!775554) b!1168904))

(assert (= (and b!1168901 c!116549) b!1168905))

(assert (= (and b!1168901 (not c!116549)) b!1168898))

(declare-fun b_lambda!19957 () Bool)

(assert (=> (not b_lambda!19957) (not b!1168902)))

(assert (=> b!1168902 t!37382))

(declare-fun b_and!40539 () Bool)

(assert (= b_and!40537 (and (=> t!37382 result!19863) b_and!40539)))

(declare-fun b_lambda!19959 () Bool)

(assert (=> (not b_lambda!19959) (not b!1168904)))

(assert (=> b!1168904 t!37382))

(declare-fun b_and!40541 () Bool)

(assert (= b_and!40539 (and (=> t!37382 result!19863) b_and!40541)))

(declare-fun m!1076783 () Bool)

(assert (=> b!1168902 m!1076783))

(declare-fun m!1076785 () Bool)

(assert (=> b!1168902 m!1076785))

(assert (=> b!1168902 m!1076627))

(declare-fun m!1076787 () Bool)

(assert (=> b!1168902 m!1076787))

(assert (=> b!1168902 m!1076785))

(assert (=> b!1168902 m!1076627))

(declare-fun m!1076789 () Bool)

(assert (=> b!1168902 m!1076789))

(declare-fun m!1076791 () Bool)

(assert (=> b!1168902 m!1076791))

(assert (=> b!1168902 m!1076791))

(declare-fun m!1076793 () Bool)

(assert (=> b!1168902 m!1076793))

(declare-fun m!1076795 () Bool)

(assert (=> b!1168902 m!1076795))

(assert (=> b!1168896 m!1076783))

(assert (=> b!1168896 m!1076783))

(declare-fun m!1076797 () Bool)

(assert (=> b!1168896 m!1076797))

(declare-fun m!1076799 () Bool)

(assert (=> b!1168900 m!1076799))

(assert (=> b!1168904 m!1076783))

(assert (=> b!1168904 m!1076785))

(assert (=> b!1168904 m!1076627))

(assert (=> b!1168904 m!1076787))

(assert (=> b!1168904 m!1076783))

(declare-fun m!1076801 () Bool)

(assert (=> b!1168904 m!1076801))

(assert (=> b!1168904 m!1076785))

(assert (=> b!1168904 m!1076627))

(assert (=> b!1168899 m!1076783))

(assert (=> b!1168899 m!1076783))

(declare-fun m!1076803 () Bool)

(assert (=> b!1168899 m!1076803))

(declare-fun m!1076805 () Bool)

(assert (=> bm!57102 m!1076805))

(declare-fun m!1076807 () Bool)

(assert (=> d!131937 m!1076807))

(assert (=> d!131937 m!1076635))

(declare-fun m!1076809 () Bool)

(assert (=> b!1168898 m!1076809))

(assert (=> b!1168895 m!1076783))

(assert (=> b!1168895 m!1076783))

(assert (=> b!1168895 m!1076803))

(assert (=> b!1168905 m!1076805))

(assert (=> b!1168755 d!131937))

(declare-fun d!131939 () Bool)

(assert (=> d!131939 (= (validKeyInArray!0 (select (arr!36428 _keys!1208) from!1455)) (and (not (= (select (arr!36428 _keys!1208) from!1455) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!36428 _keys!1208) from!1455) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1168755 d!131939))

(declare-fun bm!57103 () Bool)

(declare-fun call!57106 () ListLongMap!16785)

(assert (=> bm!57103 (= call!57106 (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun b!1168907 () Bool)

(declare-fun e!664324 () Bool)

(assert (=> b!1168907 (= e!664324 (validKeyInArray!0 (select (arr!36428 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168907 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1168909 () Bool)

(declare-fun e!664320 () ListLongMap!16785)

(assert (=> b!1168909 (= e!664320 call!57106)))

(declare-fun b!1168910 () Bool)

(declare-fun e!664326 () Bool)

(declare-fun lt!526320 () ListLongMap!16785)

(assert (=> b!1168910 (= e!664326 (isEmpty!977 lt!526320))))

(declare-fun b!1168911 () Bool)

(declare-fun e!664323 () ListLongMap!16785)

(assert (=> b!1168911 (= e!664323 e!664320)))

(declare-fun c!116551 () Bool)

(assert (=> b!1168911 (= c!116551 (validKeyInArray!0 (select (arr!36428 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(declare-fun b!1168912 () Bool)

(declare-fun res!775557 () Bool)

(declare-fun e!664321 () Bool)

(assert (=> b!1168912 (=> (not res!775557) (not e!664321))))

(assert (=> b!1168912 (= res!775557 (not (contains!6838 lt!526320 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1168913 () Bool)

(declare-fun e!664325 () Bool)

(assert (=> b!1168913 (= e!664325 e!664326)))

(declare-fun c!116553 () Bool)

(assert (=> b!1168913 (= c!116553 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 _keys!1208)))))

(declare-fun b!1168914 () Bool)

(declare-fun lt!526315 () Unit!38568)

(declare-fun lt!526314 () Unit!38568)

(assert (=> b!1168914 (= lt!526315 lt!526314)))

(declare-fun lt!526317 () ListLongMap!16785)

(declare-fun lt!526319 () V!44283)

(declare-fun lt!526318 () (_ BitVec 64))

(declare-fun lt!526316 () (_ BitVec 64))

(assert (=> b!1168914 (not (contains!6838 (+!3742 lt!526317 (tuple2!18817 lt!526316 lt!526319)) lt!526318))))

(assert (=> b!1168914 (= lt!526314 (addStillNotContains!285 lt!526317 lt!526316 lt!526319 lt!526318))))

(assert (=> b!1168914 (= lt!526318 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1168914 (= lt!526319 (get!18566 (select (arr!36429 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1168914 (= lt!526316 (select (arr!36428 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1168914 (= lt!526317 call!57106)))

(assert (=> b!1168914 (= e!664320 (+!3742 call!57106 (tuple2!18817 (select (arr!36428 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!18566 (select (arr!36429 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1168915 () Bool)

(assert (=> b!1168915 (= e!664323 (ListLongMap!16786 Nil!25551))))

(declare-fun b!1168916 () Bool)

(assert (=> b!1168916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 _keys!1208)))))

(assert (=> b!1168916 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36965 _values!996)))))

(declare-fun e!664322 () Bool)

(assert (=> b!1168916 (= e!664322 (= (apply!957 lt!526320 (select (arr!36428 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!18566 (select (arr!36429 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1168908 () Bool)

(assert (=> b!1168908 (= e!664325 e!664322)))

(assert (=> b!1168908 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 _keys!1208)))))

(declare-fun res!775558 () Bool)

(assert (=> b!1168908 (= res!775558 (contains!6838 lt!526320 (select (arr!36428 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1168908 (=> (not res!775558) (not e!664322))))

(declare-fun d!131941 () Bool)

(assert (=> d!131941 e!664321))

(declare-fun res!775556 () Bool)

(assert (=> d!131941 (=> (not res!775556) (not e!664321))))

(assert (=> d!131941 (= res!775556 (not (contains!6838 lt!526320 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131941 (= lt!526320 e!664323)))

(declare-fun c!116554 () Bool)

(assert (=> d!131941 (= c!116554 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 _keys!1208)))))

(assert (=> d!131941 (validMask!0 mask!1564)))

(assert (=> d!131941 (= (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526320)))

(declare-fun b!1168917 () Bool)

(assert (=> b!1168917 (= e!664326 (= lt!526320 (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1168918 () Bool)

(assert (=> b!1168918 (= e!664321 e!664325)))

(declare-fun c!116552 () Bool)

(assert (=> b!1168918 (= c!116552 e!664324)))

(declare-fun res!775559 () Bool)

(assert (=> b!1168918 (=> (not res!775559) (not e!664324))))

(assert (=> b!1168918 (= res!775559 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 _keys!1208)))))

(assert (= (and d!131941 c!116554) b!1168915))

(assert (= (and d!131941 (not c!116554)) b!1168911))

(assert (= (and b!1168911 c!116551) b!1168914))

(assert (= (and b!1168911 (not c!116551)) b!1168909))

(assert (= (or b!1168914 b!1168909) bm!57103))

(assert (= (and d!131941 res!775556) b!1168912))

(assert (= (and b!1168912 res!775557) b!1168918))

(assert (= (and b!1168918 res!775559) b!1168907))

(assert (= (and b!1168918 c!116552) b!1168908))

(assert (= (and b!1168918 (not c!116552)) b!1168913))

(assert (= (and b!1168908 res!775558) b!1168916))

(assert (= (and b!1168913 c!116553) b!1168917))

(assert (= (and b!1168913 (not c!116553)) b!1168910))

(declare-fun b_lambda!19961 () Bool)

(assert (=> (not b_lambda!19961) (not b!1168914)))

(assert (=> b!1168914 t!37382))

(declare-fun b_and!40543 () Bool)

(assert (= b_and!40541 (and (=> t!37382 result!19863) b_and!40543)))

(declare-fun b_lambda!19963 () Bool)

(assert (=> (not b_lambda!19963) (not b!1168916)))

(assert (=> b!1168916 t!37382))

(declare-fun b_and!40545 () Bool)

(assert (= b_and!40543 (and (=> t!37382 result!19863) b_and!40545)))

(declare-fun m!1076811 () Bool)

(assert (=> b!1168914 m!1076811))

(declare-fun m!1076813 () Bool)

(assert (=> b!1168914 m!1076813))

(assert (=> b!1168914 m!1076627))

(declare-fun m!1076815 () Bool)

(assert (=> b!1168914 m!1076815))

(assert (=> b!1168914 m!1076813))

(assert (=> b!1168914 m!1076627))

(declare-fun m!1076817 () Bool)

(assert (=> b!1168914 m!1076817))

(declare-fun m!1076819 () Bool)

(assert (=> b!1168914 m!1076819))

(assert (=> b!1168914 m!1076819))

(declare-fun m!1076821 () Bool)

(assert (=> b!1168914 m!1076821))

(declare-fun m!1076823 () Bool)

(assert (=> b!1168914 m!1076823))

(assert (=> b!1168908 m!1076811))

(assert (=> b!1168908 m!1076811))

(declare-fun m!1076825 () Bool)

(assert (=> b!1168908 m!1076825))

(declare-fun m!1076827 () Bool)

(assert (=> b!1168912 m!1076827))

(assert (=> b!1168916 m!1076811))

(assert (=> b!1168916 m!1076813))

(assert (=> b!1168916 m!1076627))

(assert (=> b!1168916 m!1076815))

(assert (=> b!1168916 m!1076811))

(declare-fun m!1076829 () Bool)

(assert (=> b!1168916 m!1076829))

(assert (=> b!1168916 m!1076813))

(assert (=> b!1168916 m!1076627))

(assert (=> b!1168911 m!1076811))

(assert (=> b!1168911 m!1076811))

(declare-fun m!1076831 () Bool)

(assert (=> b!1168911 m!1076831))

(declare-fun m!1076833 () Bool)

(assert (=> bm!57103 m!1076833))

(declare-fun m!1076835 () Bool)

(assert (=> d!131941 m!1076835))

(assert (=> d!131941 m!1076635))

(declare-fun m!1076837 () Bool)

(assert (=> b!1168910 m!1076837))

(assert (=> b!1168907 m!1076811))

(assert (=> b!1168907 m!1076811))

(assert (=> b!1168907 m!1076831))

(assert (=> b!1168917 m!1076833))

(assert (=> b!1168755 d!131941))

(declare-fun d!131943 () Bool)

(declare-fun lt!526323 () ListLongMap!16785)

(assert (=> d!131943 (not (contains!6838 lt!526323 k0!934))))

(declare-fun removeStrictlySorted!91 (List!25554 (_ BitVec 64)) List!25554)

(assert (=> d!131943 (= lt!526323 (ListLongMap!16786 (removeStrictlySorted!91 (toList!8408 lt!526226) k0!934)))))

(assert (=> d!131943 (= (-!1480 lt!526226 k0!934) lt!526323)))

(declare-fun bs!33434 () Bool)

(assert (= bs!33434 d!131943))

(declare-fun m!1076839 () Bool)

(assert (=> bs!33434 m!1076839))

(declare-fun m!1076841 () Bool)

(assert (=> bs!33434 m!1076841))

(assert (=> b!1168755 d!131943))

(declare-fun b!1168925 () Bool)

(declare-fun e!664331 () Bool)

(declare-fun call!57112 () ListLongMap!16785)

(declare-fun call!57111 () ListLongMap!16785)

(assert (=> b!1168925 (= e!664331 (= call!57112 call!57111))))

(assert (=> b!1168925 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36965 _values!996)))))

(declare-fun b!1168926 () Bool)

(assert (=> b!1168926 (= e!664331 (= call!57112 (-!1480 call!57111 k0!934)))))

(assert (=> b!1168926 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36965 _values!996)))))

(declare-fun bm!57108 () Bool)

(assert (=> bm!57108 (= call!57111 (getCurrentListMapNoExtraKeys!4872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun d!131945 () Bool)

(declare-fun e!664332 () Bool)

(assert (=> d!131945 e!664332))

(declare-fun res!775562 () Bool)

(assert (=> d!131945 (=> (not res!775562) (not e!664332))))

(assert (=> d!131945 (= res!775562 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36964 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36964 _keys!1208))))))))

(declare-fun lt!526326 () Unit!38568)

(declare-fun choose!1783 (array!75555 array!75557 (_ BitVec 32) (_ BitVec 32) V!44283 V!44283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38568)

(assert (=> d!131945 (= lt!526326 (choose!1783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!131945 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 _keys!1208)))))

(assert (=> d!131945 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!707 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!526326)))

(declare-fun b!1168927 () Bool)

(assert (=> b!1168927 (= e!664332 e!664331)))

(declare-fun c!116557 () Bool)

(assert (=> b!1168927 (= c!116557 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun bm!57109 () Bool)

(assert (=> bm!57109 (= call!57112 (getCurrentListMapNoExtraKeys!4872 (array!75556 (store (arr!36428 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36964 _keys!1208)) (array!75558 (store (arr!36429 _values!996) i!673 (ValueCellFull!13974 (dynLambda!2851 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36965 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and d!131945 res!775562) b!1168927))

(assert (= (and b!1168927 c!116557) b!1168926))

(assert (= (and b!1168927 (not c!116557)) b!1168925))

(assert (= (or b!1168926 b!1168925) bm!57108))

(assert (= (or b!1168926 b!1168925) bm!57109))

(declare-fun b_lambda!19965 () Bool)

(assert (=> (not b_lambda!19965) (not bm!57109)))

(assert (=> bm!57109 t!37382))

(declare-fun b_and!40547 () Bool)

(assert (= b_and!40545 (and (=> t!37382 result!19863) b_and!40547)))

(declare-fun m!1076843 () Bool)

(assert (=> b!1168926 m!1076843))

(assert (=> bm!57108 m!1076639))

(declare-fun m!1076845 () Bool)

(assert (=> d!131945 m!1076845))

(assert (=> bm!57109 m!1076621))

(assert (=> bm!57109 m!1076627))

(declare-fun m!1076847 () Bool)

(assert (=> bm!57109 m!1076847))

(declare-fun m!1076849 () Bool)

(assert (=> bm!57109 m!1076849))

(assert (=> b!1168755 d!131945))

(declare-fun b!1168928 () Bool)

(declare-fun e!664334 () Bool)

(declare-fun call!57113 () Bool)

(assert (=> b!1168928 (= e!664334 call!57113)))

(declare-fun b!1168929 () Bool)

(declare-fun e!664335 () Bool)

(declare-fun e!664333 () Bool)

(assert (=> b!1168929 (= e!664335 e!664333)))

(declare-fun c!116558 () Bool)

(assert (=> b!1168929 (= c!116558 (validKeyInArray!0 (select (arr!36428 lt!526222) #b00000000000000000000000000000000)))))

(declare-fun bm!57110 () Bool)

(assert (=> bm!57110 (= call!57113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!526222 mask!1564))))

(declare-fun b!1168931 () Bool)

(assert (=> b!1168931 (= e!664333 e!664334)))

(declare-fun lt!526329 () (_ BitVec 64))

(assert (=> b!1168931 (= lt!526329 (select (arr!36428 lt!526222) #b00000000000000000000000000000000))))

(declare-fun lt!526327 () Unit!38568)

(assert (=> b!1168931 (= lt!526327 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!526222 lt!526329 #b00000000000000000000000000000000))))

(assert (=> b!1168931 (arrayContainsKey!0 lt!526222 lt!526329 #b00000000000000000000000000000000)))

(declare-fun lt!526328 () Unit!38568)

(assert (=> b!1168931 (= lt!526328 lt!526327)))

(declare-fun res!775563 () Bool)

(assert (=> b!1168931 (= res!775563 (= (seekEntryOrOpen!0 (select (arr!36428 lt!526222) #b00000000000000000000000000000000) lt!526222 mask!1564) (Found!9927 #b00000000000000000000000000000000)))))

(assert (=> b!1168931 (=> (not res!775563) (not e!664334))))

(declare-fun d!131947 () Bool)

(declare-fun res!775564 () Bool)

(assert (=> d!131947 (=> res!775564 e!664335)))

(assert (=> d!131947 (= res!775564 (bvsge #b00000000000000000000000000000000 (size!36964 lt!526222)))))

(assert (=> d!131947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526222 mask!1564) e!664335)))

(declare-fun b!1168930 () Bool)

(assert (=> b!1168930 (= e!664333 call!57113)))

(assert (= (and d!131947 (not res!775564)) b!1168929))

(assert (= (and b!1168929 c!116558) b!1168931))

(assert (= (and b!1168929 (not c!116558)) b!1168930))

(assert (= (and b!1168931 res!775563) b!1168928))

(assert (= (or b!1168928 b!1168930) bm!57110))

(declare-fun m!1076851 () Bool)

(assert (=> b!1168929 m!1076851))

(assert (=> b!1168929 m!1076851))

(declare-fun m!1076853 () Bool)

(assert (=> b!1168929 m!1076853))

(declare-fun m!1076855 () Bool)

(assert (=> bm!57110 m!1076855))

(assert (=> b!1168931 m!1076851))

(declare-fun m!1076857 () Bool)

(assert (=> b!1168931 m!1076857))

(declare-fun m!1076859 () Bool)

(assert (=> b!1168931 m!1076859))

(assert (=> b!1168931 m!1076851))

(declare-fun m!1076861 () Bool)

(assert (=> b!1168931 m!1076861))

(assert (=> b!1168759 d!131947))

(declare-fun d!131949 () Bool)

(assert (=> d!131949 (= (array_inv!27842 _keys!1208) (bvsge (size!36964 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!99232 d!131949))

(declare-fun d!131951 () Bool)

(assert (=> d!131951 (= (array_inv!27843 _values!996) (bvsge (size!36965 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!99232 d!131951))

(declare-fun d!131953 () Bool)

(declare-fun res!775569 () Bool)

(declare-fun e!664340 () Bool)

(assert (=> d!131953 (=> res!775569 e!664340)))

(assert (=> d!131953 (= res!775569 (= (select (arr!36428 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!131953 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!664340)))

(declare-fun b!1168936 () Bool)

(declare-fun e!664341 () Bool)

(assert (=> b!1168936 (= e!664340 e!664341)))

(declare-fun res!775570 () Bool)

(assert (=> b!1168936 (=> (not res!775570) (not e!664341))))

(assert (=> b!1168936 (= res!775570 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!36964 _keys!1208)))))

(declare-fun b!1168937 () Bool)

(assert (=> b!1168937 (= e!664341 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131953 (not res!775569)) b!1168936))

(assert (= (and b!1168936 res!775570) b!1168937))

(assert (=> d!131953 m!1076705))

(declare-fun m!1076863 () Bool)

(assert (=> b!1168937 m!1076863))

(assert (=> b!1168770 d!131953))

(declare-fun d!131955 () Bool)

(assert (=> d!131955 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526332 () Unit!38568)

(declare-fun choose!13 (array!75555 (_ BitVec 64) (_ BitVec 32)) Unit!38568)

(assert (=> d!131955 (= lt!526332 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!131955 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!131955 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!526332)))

(declare-fun bs!33435 () Bool)

(assert (= bs!33435 d!131955))

(assert (=> bs!33435 m!1076649))

(declare-fun m!1076865 () Bool)

(assert (=> bs!33435 m!1076865))

(assert (=> b!1168770 d!131955))

(declare-fun b!1168948 () Bool)

(declare-fun e!664353 () Bool)

(declare-fun call!57116 () Bool)

(assert (=> b!1168948 (= e!664353 call!57116)))

(declare-fun b!1168949 () Bool)

(declare-fun e!664350 () Bool)

(declare-fun contains!6840 (List!25555 (_ BitVec 64)) Bool)

(assert (=> b!1168949 (= e!664350 (contains!6840 Nil!25552 (select (arr!36428 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1168950 () Bool)

(declare-fun e!664352 () Bool)

(declare-fun e!664351 () Bool)

(assert (=> b!1168950 (= e!664352 e!664351)))

(declare-fun res!775579 () Bool)

(assert (=> b!1168950 (=> (not res!775579) (not e!664351))))

(assert (=> b!1168950 (= res!775579 (not e!664350))))

(declare-fun res!775577 () Bool)

(assert (=> b!1168950 (=> (not res!775577) (not e!664350))))

(assert (=> b!1168950 (= res!775577 (validKeyInArray!0 (select (arr!36428 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1168951 () Bool)

(assert (=> b!1168951 (= e!664353 call!57116)))

(declare-fun d!131957 () Bool)

(declare-fun res!775578 () Bool)

(assert (=> d!131957 (=> res!775578 e!664352)))

(assert (=> d!131957 (= res!775578 (bvsge #b00000000000000000000000000000000 (size!36964 _keys!1208)))))

(assert (=> d!131957 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25552) e!664352)))

(declare-fun b!1168952 () Bool)

(assert (=> b!1168952 (= e!664351 e!664353)))

(declare-fun c!116561 () Bool)

(assert (=> b!1168952 (= c!116561 (validKeyInArray!0 (select (arr!36428 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!57113 () Bool)

(assert (=> bm!57113 (= call!57116 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!116561 (Cons!25551 (select (arr!36428 _keys!1208) #b00000000000000000000000000000000) Nil!25552) Nil!25552)))))

(assert (= (and d!131957 (not res!775578)) b!1168950))

(assert (= (and b!1168950 res!775577) b!1168949))

(assert (= (and b!1168950 res!775579) b!1168952))

(assert (= (and b!1168952 c!116561) b!1168951))

(assert (= (and b!1168952 (not c!116561)) b!1168948))

(assert (= (or b!1168951 b!1168948) bm!57113))

(assert (=> b!1168949 m!1076705))

(assert (=> b!1168949 m!1076705))

(declare-fun m!1076867 () Bool)

(assert (=> b!1168949 m!1076867))

(assert (=> b!1168950 m!1076705))

(assert (=> b!1168950 m!1076705))

(assert (=> b!1168950 m!1076707))

(assert (=> b!1168952 m!1076705))

(assert (=> b!1168952 m!1076705))

(assert (=> b!1168952 m!1076707))

(assert (=> bm!57113 m!1076705))

(declare-fun m!1076869 () Bool)

(assert (=> bm!57113 m!1076869))

(assert (=> b!1168760 d!131957))

(declare-fun b!1168953 () Bool)

(declare-fun e!664357 () Bool)

(declare-fun call!57117 () Bool)

(assert (=> b!1168953 (= e!664357 call!57117)))

(declare-fun b!1168954 () Bool)

(declare-fun e!664354 () Bool)

(assert (=> b!1168954 (= e!664354 (contains!6840 Nil!25552 (select (arr!36428 lt!526222) #b00000000000000000000000000000000)))))

(declare-fun b!1168955 () Bool)

(declare-fun e!664356 () Bool)

(declare-fun e!664355 () Bool)

(assert (=> b!1168955 (= e!664356 e!664355)))

(declare-fun res!775582 () Bool)

(assert (=> b!1168955 (=> (not res!775582) (not e!664355))))

(assert (=> b!1168955 (= res!775582 (not e!664354))))

(declare-fun res!775580 () Bool)

(assert (=> b!1168955 (=> (not res!775580) (not e!664354))))

(assert (=> b!1168955 (= res!775580 (validKeyInArray!0 (select (arr!36428 lt!526222) #b00000000000000000000000000000000)))))

(declare-fun b!1168956 () Bool)

(assert (=> b!1168956 (= e!664357 call!57117)))

(declare-fun d!131959 () Bool)

(declare-fun res!775581 () Bool)

(assert (=> d!131959 (=> res!775581 e!664356)))

(assert (=> d!131959 (= res!775581 (bvsge #b00000000000000000000000000000000 (size!36964 lt!526222)))))

(assert (=> d!131959 (= (arrayNoDuplicates!0 lt!526222 #b00000000000000000000000000000000 Nil!25552) e!664356)))

(declare-fun b!1168957 () Bool)

(assert (=> b!1168957 (= e!664355 e!664357)))

(declare-fun c!116562 () Bool)

(assert (=> b!1168957 (= c!116562 (validKeyInArray!0 (select (arr!36428 lt!526222) #b00000000000000000000000000000000)))))

(declare-fun bm!57114 () Bool)

(assert (=> bm!57114 (= call!57117 (arrayNoDuplicates!0 lt!526222 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!116562 (Cons!25551 (select (arr!36428 lt!526222) #b00000000000000000000000000000000) Nil!25552) Nil!25552)))))

(assert (= (and d!131959 (not res!775581)) b!1168955))

(assert (= (and b!1168955 res!775580) b!1168954))

(assert (= (and b!1168955 res!775582) b!1168957))

(assert (= (and b!1168957 c!116562) b!1168956))

(assert (= (and b!1168957 (not c!116562)) b!1168953))

(assert (= (or b!1168956 b!1168953) bm!57114))

(assert (=> b!1168954 m!1076851))

(assert (=> b!1168954 m!1076851))

(declare-fun m!1076871 () Bool)

(assert (=> b!1168954 m!1076871))

(assert (=> b!1168955 m!1076851))

(assert (=> b!1168955 m!1076851))

(assert (=> b!1168955 m!1076853))

(assert (=> b!1168957 m!1076851))

(assert (=> b!1168957 m!1076851))

(assert (=> b!1168957 m!1076853))

(assert (=> bm!57114 m!1076851))

(declare-fun m!1076873 () Bool)

(assert (=> bm!57114 m!1076873))

(assert (=> b!1168766 d!131959))

(declare-fun mapIsEmpty!45881 () Bool)

(declare-fun mapRes!45881 () Bool)

(assert (=> mapIsEmpty!45881 mapRes!45881))

(declare-fun mapNonEmpty!45881 () Bool)

(declare-fun tp!87231 () Bool)

(declare-fun e!664362 () Bool)

(assert (=> mapNonEmpty!45881 (= mapRes!45881 (and tp!87231 e!664362))))

(declare-fun mapKey!45881 () (_ BitVec 32))

(declare-fun mapRest!45881 () (Array (_ BitVec 32) ValueCell!13974))

(declare-fun mapValue!45881 () ValueCell!13974)

(assert (=> mapNonEmpty!45881 (= mapRest!45875 (store mapRest!45881 mapKey!45881 mapValue!45881))))

(declare-fun condMapEmpty!45881 () Bool)

(declare-fun mapDefault!45881 () ValueCell!13974)

(assert (=> mapNonEmpty!45875 (= condMapEmpty!45881 (= mapRest!45875 ((as const (Array (_ BitVec 32) ValueCell!13974)) mapDefault!45881)))))

(declare-fun e!664363 () Bool)

(assert (=> mapNonEmpty!45875 (= tp!87221 (and e!664363 mapRes!45881))))

(declare-fun b!1168965 () Bool)

(assert (=> b!1168965 (= e!664363 tp_is_empty!29367)))

(declare-fun b!1168964 () Bool)

(assert (=> b!1168964 (= e!664362 tp_is_empty!29367)))

(assert (= (and mapNonEmpty!45875 condMapEmpty!45881) mapIsEmpty!45881))

(assert (= (and mapNonEmpty!45875 (not condMapEmpty!45881)) mapNonEmpty!45881))

(assert (= (and mapNonEmpty!45881 ((_ is ValueCellFull!13974) mapValue!45881)) b!1168964))

(assert (= (and mapNonEmpty!45875 ((_ is ValueCellFull!13974) mapDefault!45881)) b!1168965))

(declare-fun m!1076875 () Bool)

(assert (=> mapNonEmpty!45881 m!1076875))

(declare-fun b_lambda!19967 () Bool)

(assert (= b_lambda!19959 (or (and start!99232 b_free!24837) b_lambda!19967)))

(declare-fun b_lambda!19969 () Bool)

(assert (= b_lambda!19953 (or (and start!99232 b_free!24837) b_lambda!19969)))

(declare-fun b_lambda!19971 () Bool)

(assert (= b_lambda!19951 (or (and start!99232 b_free!24837) b_lambda!19971)))

(declare-fun b_lambda!19973 () Bool)

(assert (= b_lambda!19955 (or (and start!99232 b_free!24837) b_lambda!19973)))

(declare-fun b_lambda!19975 () Bool)

(assert (= b_lambda!19949 (or (and start!99232 b_free!24837) b_lambda!19975)))

(declare-fun b_lambda!19977 () Bool)

(assert (= b_lambda!19957 (or (and start!99232 b_free!24837) b_lambda!19977)))

(declare-fun b_lambda!19979 () Bool)

(assert (= b_lambda!19963 (or (and start!99232 b_free!24837) b_lambda!19979)))

(declare-fun b_lambda!19981 () Bool)

(assert (= b_lambda!19965 (or (and start!99232 b_free!24837) b_lambda!19981)))

(declare-fun b_lambda!19983 () Bool)

(assert (= b_lambda!19961 (or (and start!99232 b_free!24837) b_lambda!19983)))

(check-sat (not b!1168895) (not b!1168910) (not b_lambda!19947) (not b_lambda!19981) (not b!1168871) (not b!1168957) (not b!1168839) (not b!1168876) (not b!1168880) (not b_lambda!19973) (not b!1168892) (not b!1168881) (not b!1168887) (not b_lambda!19967) (not b_lambda!19969) (not b!1168914) (not b!1168904) (not bm!57114) (not b!1168883) (not d!131943) (not b!1168884) (not bm!57102) (not b!1168950) (not d!131929) (not b!1168908) (not b!1168898) (not b!1168955) (not b!1168899) (not b!1168907) (not b!1168900) (not mapNonEmpty!45881) (not b!1168954) (not b!1168886) (not bm!57113) (not b_lambda!19975) (not bm!57109) (not b!1168878) (not b!1168846) (not b!1168872) (not bm!57103) (not b!1168911) (not b!1168926) (not b_lambda!19971) (not b!1168949) (not bm!57097) (not d!131955) (not b!1168888) (not b!1168875) (not bm!57101) (not bm!57100) (not b!1168952) (not b_lambda!19979) (not b!1168917) b_and!40547 (not b!1168929) (not b!1168916) (not b!1168840) (not b_lambda!19983) (not b!1168893) (not b!1168912) (not bm!57108) (not b!1168890) (not b!1168845) (not d!131925) (not b!1168931) (not b!1168896) (not b_next!24837) (not d!131931) (not d!131941) (not b!1168834) (not b!1168874) (not b!1168832) (not b!1168902) (not bm!57110) (not b!1168937) tp_is_empty!29367 (not d!131945) (not b!1168905) (not b_lambda!19977) (not d!131937))
(check-sat b_and!40547 (not b_next!24837))
