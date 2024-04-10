; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98752 () Bool)

(assert start!98752)

(declare-fun b_free!24357 () Bool)

(declare-fun b_next!24357 () Bool)

(assert (=> start!98752 (= b_free!24357 (not b_next!24357))))

(declare-fun tp!85781 () Bool)

(declare-fun b_and!39563 () Bool)

(assert (=> start!98752 (= tp!85781 b_and!39563)))

(declare-fun bm!53823 () Bool)

(declare-datatypes ((Unit!37878 0))(
  ( (Unit!37879) )
))
(declare-fun call!53833 () Unit!37878)

(declare-fun call!53832 () Unit!37878)

(assert (=> bm!53823 (= call!53833 call!53832)))

(declare-fun b!1151434 () Bool)

(declare-fun res!765702 () Bool)

(declare-fun e!654897 () Bool)

(assert (=> b!1151434 (=> (not res!765702) (not e!654897))))

(declare-datatypes ((array!74621 0))(
  ( (array!74622 (arr!35961 (Array (_ BitVec 32) (_ BitVec 64))) (size!36497 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74621)

(declare-datatypes ((List!25158 0))(
  ( (Nil!25155) (Cons!25154 (h!26363 (_ BitVec 64)) (t!36507 List!25158)) )
))
(declare-fun arrayNoDuplicates!0 (array!74621 (_ BitVec 32) List!25158) Bool)

(assert (=> b!1151434 (= res!765702 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25155))))

(declare-fun b!1151435 () Bool)

(declare-fun e!654901 () Bool)

(declare-fun e!654899 () Bool)

(declare-fun mapRes!45155 () Bool)

(assert (=> b!1151435 (= e!654901 (and e!654899 mapRes!45155))))

(declare-fun condMapEmpty!45155 () Bool)

(declare-datatypes ((V!43643 0))(
  ( (V!43644 (val!14500 Int)) )
))
(declare-datatypes ((ValueCell!13734 0))(
  ( (ValueCellFull!13734 (v!17137 V!43643)) (EmptyCell!13734) )
))
(declare-datatypes ((array!74623 0))(
  ( (array!74624 (arr!35962 (Array (_ BitVec 32) ValueCell!13734)) (size!36498 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74623)

(declare-fun mapDefault!45155 () ValueCell!13734)

(assert (=> b!1151435 (= condMapEmpty!45155 (= (arr!35962 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13734)) mapDefault!45155)))))

(declare-fun b!1151436 () Bool)

(declare-fun c!114076 () Bool)

(declare-fun lt!515514 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1151436 (= c!114076 (and (not lt!515514) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654890 () Unit!37878)

(declare-fun e!654894 () Unit!37878)

(assert (=> b!1151436 (= e!654890 e!654894)))

(declare-fun zeroValue!944 () V!43643)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!515533 () array!74623)

(declare-fun minValue!944 () V!43643)

(declare-fun bm!53824 () Bool)

(declare-datatypes ((tuple2!18410 0))(
  ( (tuple2!18411 (_1!9216 (_ BitVec 64)) (_2!9216 V!43643)) )
))
(declare-datatypes ((List!25159 0))(
  ( (Nil!25156) (Cons!25155 (h!26364 tuple2!18410) (t!36508 List!25159)) )
))
(declare-datatypes ((ListLongMap!16379 0))(
  ( (ListLongMap!16380 (toList!8205 List!25159)) )
))
(declare-fun call!53829 () ListLongMap!16379)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!515524 () array!74621)

(declare-fun getCurrentListMapNoExtraKeys!4677 (array!74621 array!74623 (_ BitVec 32) (_ BitVec 32) V!43643 V!43643 (_ BitVec 32) Int) ListLongMap!16379)

(assert (=> bm!53824 (= call!53829 (getCurrentListMapNoExtraKeys!4677 lt!515524 lt!515533 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151437 () Bool)

(declare-fun e!654898 () Bool)

(assert (=> b!1151437 (= e!654898 true)))

(declare-fun e!654900 () Bool)

(assert (=> b!1151437 e!654900))

(declare-fun res!765705 () Bool)

(assert (=> b!1151437 (=> (not res!765705) (not e!654900))))

(declare-fun lt!515531 () ListLongMap!16379)

(declare-fun lt!515525 () ListLongMap!16379)

(assert (=> b!1151437 (= res!765705 (= lt!515531 lt!515525))))

(declare-fun lt!515516 () ListLongMap!16379)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1336 (ListLongMap!16379 (_ BitVec 64)) ListLongMap!16379)

(assert (=> b!1151437 (= lt!515531 (-!1336 lt!515516 k0!934))))

(declare-fun lt!515518 () V!43643)

(declare-fun +!3623 (ListLongMap!16379 tuple2!18410) ListLongMap!16379)

(assert (=> b!1151437 (= (-!1336 (+!3623 lt!515525 (tuple2!18411 (select (arr!35961 _keys!1208) from!1455) lt!515518)) (select (arr!35961 _keys!1208) from!1455)) lt!515525)))

(declare-fun lt!515522 () Unit!37878)

(declare-fun addThenRemoveForNewKeyIsSame!179 (ListLongMap!16379 (_ BitVec 64) V!43643) Unit!37878)

(assert (=> b!1151437 (= lt!515522 (addThenRemoveForNewKeyIsSame!179 lt!515525 (select (arr!35961 _keys!1208) from!1455) lt!515518))))

(declare-fun lt!515530 () V!43643)

(declare-fun get!18311 (ValueCell!13734 V!43643) V!43643)

(assert (=> b!1151437 (= lt!515518 (get!18311 (select (arr!35962 _values!996) from!1455) lt!515530))))

(declare-fun lt!515528 () Unit!37878)

(declare-fun e!654895 () Unit!37878)

(assert (=> b!1151437 (= lt!515528 e!654895)))

(declare-fun c!114074 () Bool)

(declare-fun contains!6724 (ListLongMap!16379 (_ BitVec 64)) Bool)

(assert (=> b!1151437 (= c!114074 (contains!6724 lt!515525 k0!934))))

(assert (=> b!1151437 (= lt!515525 (getCurrentListMapNoExtraKeys!4677 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151438 () Bool)

(declare-fun res!765710 () Bool)

(assert (=> b!1151438 (=> (not res!765710) (not e!654897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151438 (= res!765710 (validKeyInArray!0 k0!934))))

(declare-fun b!1151439 () Bool)

(declare-fun call!53826 () Bool)

(assert (=> b!1151439 call!53826))

(declare-fun lt!515523 () Unit!37878)

(assert (=> b!1151439 (= lt!515523 call!53833)))

(declare-fun e!654896 () Unit!37878)

(assert (=> b!1151439 (= e!654896 lt!515523)))

(declare-fun call!53830 () ListLongMap!16379)

(declare-fun bm!53825 () Bool)

(assert (=> bm!53825 (= call!53830 (getCurrentListMapNoExtraKeys!4677 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151440 () Bool)

(declare-fun Unit!37880 () Unit!37878)

(assert (=> b!1151440 (= e!654895 Unit!37880)))

(assert (=> b!1151440 (= lt!515514 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!114075 () Bool)

(assert (=> b!1151440 (= c!114075 (and (not lt!515514) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!515529 () Unit!37878)

(assert (=> b!1151440 (= lt!515529 e!654890)))

(declare-fun lt!515534 () Unit!37878)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!465 (array!74621 array!74623 (_ BitVec 32) (_ BitVec 32) V!43643 V!43643 (_ BitVec 64) (_ BitVec 32) Int) Unit!37878)

(assert (=> b!1151440 (= lt!515534 (lemmaListMapContainsThenArrayContainsFrom!465 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114072 () Bool)

(assert (=> b!1151440 (= c!114072 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765700 () Bool)

(declare-fun e!654887 () Bool)

(assert (=> b!1151440 (= res!765700 e!654887)))

(declare-fun e!654902 () Bool)

(assert (=> b!1151440 (=> (not res!765700) (not e!654902))))

(assert (=> b!1151440 e!654902))

(declare-fun lt!515527 () Unit!37878)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74621 (_ BitVec 32) (_ BitVec 32)) Unit!37878)

(assert (=> b!1151440 (= lt!515527 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1151440 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25155)))

(declare-fun lt!515526 () Unit!37878)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74621 (_ BitVec 64) (_ BitVec 32) List!25158) Unit!37878)

(assert (=> b!1151440 (= lt!515526 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25155))))

(assert (=> b!1151440 false))

(declare-fun b!1151441 () Bool)

(declare-fun Unit!37881 () Unit!37878)

(assert (=> b!1151441 (= e!654895 Unit!37881)))

(declare-fun b!1151442 () Bool)

(declare-fun e!654893 () Bool)

(declare-fun e!654888 () Bool)

(assert (=> b!1151442 (= e!654893 (not e!654888))))

(declare-fun res!765711 () Bool)

(assert (=> b!1151442 (=> res!765711 e!654888)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151442 (= res!765711 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1151442 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!515519 () Unit!37878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74621 (_ BitVec 64) (_ BitVec 32)) Unit!37878)

(assert (=> b!1151442 (= lt!515519 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1151443 () Bool)

(declare-fun tp_is_empty!28887 () Bool)

(assert (=> b!1151443 (= e!654899 tp_is_empty!28887)))

(declare-fun mapIsEmpty!45155 () Bool)

(assert (=> mapIsEmpty!45155 mapRes!45155))

(declare-fun b!1151444 () Bool)

(declare-fun res!765707 () Bool)

(assert (=> b!1151444 (=> (not res!765707) (not e!654897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1151444 (= res!765707 (validMask!0 mask!1564))))

(declare-fun b!1151445 () Bool)

(declare-fun res!765704 () Bool)

(assert (=> b!1151445 (=> (not res!765704) (not e!654897))))

(assert (=> b!1151445 (= res!765704 (and (= (size!36498 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36497 _keys!1208) (size!36498 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1151446 () Bool)

(assert (=> b!1151446 (= e!654897 e!654893)))

(declare-fun res!765712 () Bool)

(assert (=> b!1151446 (=> (not res!765712) (not e!654893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74621 (_ BitVec 32)) Bool)

(assert (=> b!1151446 (= res!765712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515524 mask!1564))))

(assert (=> b!1151446 (= lt!515524 (array!74622 (store (arr!35961 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36497 _keys!1208)))))

(declare-fun b!1151447 () Bool)

(declare-fun Unit!37882 () Unit!37878)

(assert (=> b!1151447 (= e!654896 Unit!37882)))

(declare-fun call!53827 () ListLongMap!16379)

(declare-fun call!53831 () Bool)

(declare-fun lt!515532 () ListLongMap!16379)

(declare-fun bm!53826 () Bool)

(assert (=> bm!53826 (= call!53831 (contains!6724 (ite c!114075 lt!515532 call!53827) k0!934))))

(declare-fun b!1151448 () Bool)

(declare-fun res!765699 () Bool)

(assert (=> b!1151448 (=> (not res!765699) (not e!654893))))

(assert (=> b!1151448 (= res!765699 (arrayNoDuplicates!0 lt!515524 #b00000000000000000000000000000000 Nil!25155))))

(declare-fun b!1151449 () Bool)

(declare-fun e!654889 () Bool)

(assert (=> b!1151449 (= e!654889 (= call!53829 call!53830))))

(declare-fun bm!53827 () Bool)

(declare-fun call!53828 () ListLongMap!16379)

(assert (=> bm!53827 (= call!53827 call!53828)))

(declare-fun b!1151450 () Bool)

(assert (=> b!1151450 (= e!654887 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515514) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1151451 () Bool)

(declare-fun lt!515515 () Unit!37878)

(assert (=> b!1151451 (= e!654894 lt!515515)))

(assert (=> b!1151451 (= lt!515515 call!53833)))

(assert (=> b!1151451 call!53826))

(declare-fun b!1151452 () Bool)

(assert (=> b!1151452 (contains!6724 call!53828 k0!934)))

(declare-fun lt!515535 () Unit!37878)

(assert (=> b!1151452 (= lt!515535 call!53832)))

(assert (=> b!1151452 call!53831))

(assert (=> b!1151452 (= lt!515532 (+!3623 lt!515525 (tuple2!18411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!515521 () Unit!37878)

(declare-fun addStillContains!872 (ListLongMap!16379 (_ BitVec 64) V!43643 (_ BitVec 64)) Unit!37878)

(assert (=> b!1151452 (= lt!515521 (addStillContains!872 lt!515525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1151452 (= e!654890 lt!515535)))

(declare-fun b!1151453 () Bool)

(assert (=> b!1151453 (= e!654900 (= lt!515531 (getCurrentListMapNoExtraKeys!4677 lt!515524 lt!515533 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151454 () Bool)

(declare-fun res!765701 () Bool)

(assert (=> b!1151454 (=> (not res!765701) (not e!654897))))

(assert (=> b!1151454 (= res!765701 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36497 _keys!1208))))))

(declare-fun b!1151455 () Bool)

(declare-fun res!765708 () Bool)

(assert (=> b!1151455 (=> (not res!765708) (not e!654897))))

(assert (=> b!1151455 (= res!765708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!53828 () Bool)

(assert (=> bm!53828 (= call!53826 call!53831)))

(declare-fun res!765713 () Bool)

(assert (=> start!98752 (=> (not res!765713) (not e!654897))))

(assert (=> start!98752 (= res!765713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36497 _keys!1208))))))

(assert (=> start!98752 e!654897))

(assert (=> start!98752 tp_is_empty!28887))

(declare-fun array_inv!27540 (array!74621) Bool)

(assert (=> start!98752 (array_inv!27540 _keys!1208)))

(assert (=> start!98752 true))

(assert (=> start!98752 tp!85781))

(declare-fun array_inv!27541 (array!74623) Bool)

(assert (=> start!98752 (and (array_inv!27541 _values!996) e!654901)))

(declare-fun b!1151456 () Bool)

(assert (=> b!1151456 (= e!654894 e!654896)))

(declare-fun c!114071 () Bool)

(assert (=> b!1151456 (= c!114071 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515514))))

(declare-fun mapNonEmpty!45155 () Bool)

(declare-fun tp!85782 () Bool)

(declare-fun e!654892 () Bool)

(assert (=> mapNonEmpty!45155 (= mapRes!45155 (and tp!85782 e!654892))))

(declare-fun mapValue!45155 () ValueCell!13734)

(declare-fun mapKey!45155 () (_ BitVec 32))

(declare-fun mapRest!45155 () (Array (_ BitVec 32) ValueCell!13734))

(assert (=> mapNonEmpty!45155 (= (arr!35962 _values!996) (store mapRest!45155 mapKey!45155 mapValue!45155))))

(declare-fun bm!53829 () Bool)

(assert (=> bm!53829 (= call!53828 (+!3623 (ite c!114075 lt!515532 lt!515525) (ite c!114075 (tuple2!18411 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114076 (tuple2!18411 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18411 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1151457 () Bool)

(declare-fun e!654903 () Bool)

(assert (=> b!1151457 (= e!654903 e!654898)))

(declare-fun res!765709 () Bool)

(assert (=> b!1151457 (=> res!765709 e!654898)))

(assert (=> b!1151457 (= res!765709 (not (= (select (arr!35961 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1151457 e!654889))

(declare-fun c!114073 () Bool)

(assert (=> b!1151457 (= c!114073 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515517 () Unit!37878)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!573 (array!74621 array!74623 (_ BitVec 32) (_ BitVec 32) V!43643 V!43643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37878)

(assert (=> b!1151457 (= lt!515517 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!573 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151458 () Bool)

(assert (=> b!1151458 (= e!654888 e!654903)))

(declare-fun res!765703 () Bool)

(assert (=> b!1151458 (=> res!765703 e!654903)))

(assert (=> b!1151458 (= res!765703 (not (= from!1455 i!673)))))

(declare-fun lt!515520 () ListLongMap!16379)

(assert (=> b!1151458 (= lt!515520 (getCurrentListMapNoExtraKeys!4677 lt!515524 lt!515533 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1151458 (= lt!515533 (array!74624 (store (arr!35962 _values!996) i!673 (ValueCellFull!13734 lt!515530)) (size!36498 _values!996)))))

(declare-fun dynLambda!2700 (Int (_ BitVec 64)) V!43643)

(assert (=> b!1151458 (= lt!515530 (dynLambda!2700 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1151458 (= lt!515516 (getCurrentListMapNoExtraKeys!4677 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151459 () Bool)

(assert (=> b!1151459 (= e!654892 tp_is_empty!28887)))

(declare-fun b!1151460 () Bool)

(assert (=> b!1151460 (= e!654887 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!53830 () Bool)

(assert (=> bm!53830 (= call!53832 (addStillContains!872 (ite c!114075 lt!515532 lt!515525) (ite c!114075 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114076 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114075 minValue!944 (ite c!114076 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1151461 () Bool)

(assert (=> b!1151461 (= e!654902 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1151462 () Bool)

(declare-fun res!765706 () Bool)

(assert (=> b!1151462 (=> (not res!765706) (not e!654897))))

(assert (=> b!1151462 (= res!765706 (= (select (arr!35961 _keys!1208) i!673) k0!934))))

(declare-fun b!1151463 () Bool)

(assert (=> b!1151463 (= e!654889 (= call!53829 (-!1336 call!53830 k0!934)))))

(assert (= (and start!98752 res!765713) b!1151444))

(assert (= (and b!1151444 res!765707) b!1151445))

(assert (= (and b!1151445 res!765704) b!1151455))

(assert (= (and b!1151455 res!765708) b!1151434))

(assert (= (and b!1151434 res!765702) b!1151454))

(assert (= (and b!1151454 res!765701) b!1151438))

(assert (= (and b!1151438 res!765710) b!1151462))

(assert (= (and b!1151462 res!765706) b!1151446))

(assert (= (and b!1151446 res!765712) b!1151448))

(assert (= (and b!1151448 res!765699) b!1151442))

(assert (= (and b!1151442 (not res!765711)) b!1151458))

(assert (= (and b!1151458 (not res!765703)) b!1151457))

(assert (= (and b!1151457 c!114073) b!1151463))

(assert (= (and b!1151457 (not c!114073)) b!1151449))

(assert (= (or b!1151463 b!1151449) bm!53824))

(assert (= (or b!1151463 b!1151449) bm!53825))

(assert (= (and b!1151457 (not res!765709)) b!1151437))

(assert (= (and b!1151437 c!114074) b!1151440))

(assert (= (and b!1151437 (not c!114074)) b!1151441))

(assert (= (and b!1151440 c!114075) b!1151452))

(assert (= (and b!1151440 (not c!114075)) b!1151436))

(assert (= (and b!1151436 c!114076) b!1151451))

(assert (= (and b!1151436 (not c!114076)) b!1151456))

(assert (= (and b!1151456 c!114071) b!1151439))

(assert (= (and b!1151456 (not c!114071)) b!1151447))

(assert (= (or b!1151451 b!1151439) bm!53823))

(assert (= (or b!1151451 b!1151439) bm!53827))

(assert (= (or b!1151451 b!1151439) bm!53828))

(assert (= (or b!1151452 bm!53828) bm!53826))

(assert (= (or b!1151452 bm!53823) bm!53830))

(assert (= (or b!1151452 bm!53827) bm!53829))

(assert (= (and b!1151440 c!114072) b!1151460))

(assert (= (and b!1151440 (not c!114072)) b!1151450))

(assert (= (and b!1151440 res!765700) b!1151461))

(assert (= (and b!1151437 res!765705) b!1151453))

(assert (= (and b!1151435 condMapEmpty!45155) mapIsEmpty!45155))

(assert (= (and b!1151435 (not condMapEmpty!45155)) mapNonEmpty!45155))

(get-info :version)

(assert (= (and mapNonEmpty!45155 ((_ is ValueCellFull!13734) mapValue!45155)) b!1151459))

(assert (= (and b!1151435 ((_ is ValueCellFull!13734) mapDefault!45155)) b!1151443))

(assert (= start!98752 b!1151435))

(declare-fun b_lambda!19463 () Bool)

(assert (=> (not b_lambda!19463) (not b!1151458)))

(declare-fun t!36506 () Bool)

(declare-fun tb!9169 () Bool)

(assert (=> (and start!98752 (= defaultEntry!1004 defaultEntry!1004) t!36506) tb!9169))

(declare-fun result!18903 () Bool)

(assert (=> tb!9169 (= result!18903 tp_is_empty!28887)))

(assert (=> b!1151458 t!36506))

(declare-fun b_and!39565 () Bool)

(assert (= b_and!39563 (and (=> t!36506 result!18903) b_and!39565)))

(declare-fun m!1061545 () Bool)

(assert (=> b!1151458 m!1061545))

(declare-fun m!1061547 () Bool)

(assert (=> b!1151458 m!1061547))

(declare-fun m!1061549 () Bool)

(assert (=> b!1151458 m!1061549))

(declare-fun m!1061551 () Bool)

(assert (=> b!1151458 m!1061551))

(declare-fun m!1061553 () Bool)

(assert (=> b!1151455 m!1061553))

(declare-fun m!1061555 () Bool)

(assert (=> b!1151460 m!1061555))

(declare-fun m!1061557 () Bool)

(assert (=> b!1151462 m!1061557))

(declare-fun m!1061559 () Bool)

(assert (=> b!1151448 m!1061559))

(assert (=> b!1151461 m!1061555))

(declare-fun m!1061561 () Bool)

(assert (=> b!1151442 m!1061561))

(declare-fun m!1061563 () Bool)

(assert (=> b!1151442 m!1061563))

(declare-fun m!1061565 () Bool)

(assert (=> b!1151444 m!1061565))

(declare-fun m!1061567 () Bool)

(assert (=> b!1151463 m!1061567))

(declare-fun m!1061569 () Bool)

(assert (=> mapNonEmpty!45155 m!1061569))

(declare-fun m!1061571 () Bool)

(assert (=> b!1151440 m!1061571))

(declare-fun m!1061573 () Bool)

(assert (=> b!1151440 m!1061573))

(declare-fun m!1061575 () Bool)

(assert (=> b!1151440 m!1061575))

(declare-fun m!1061577 () Bool)

(assert (=> b!1151440 m!1061577))

(declare-fun m!1061579 () Bool)

(assert (=> start!98752 m!1061579))

(declare-fun m!1061581 () Bool)

(assert (=> start!98752 m!1061581))

(declare-fun m!1061583 () Bool)

(assert (=> bm!53826 m!1061583))

(declare-fun m!1061585 () Bool)

(assert (=> b!1151457 m!1061585))

(declare-fun m!1061587 () Bool)

(assert (=> b!1151457 m!1061587))

(declare-fun m!1061589 () Bool)

(assert (=> b!1151453 m!1061589))

(declare-fun m!1061591 () Bool)

(assert (=> bm!53829 m!1061591))

(declare-fun m!1061593 () Bool)

(assert (=> bm!53830 m!1061593))

(declare-fun m!1061595 () Bool)

(assert (=> b!1151437 m!1061595))

(assert (=> b!1151437 m!1061595))

(declare-fun m!1061597 () Bool)

(assert (=> b!1151437 m!1061597))

(declare-fun m!1061599 () Bool)

(assert (=> b!1151437 m!1061599))

(assert (=> b!1151437 m!1061585))

(declare-fun m!1061601 () Bool)

(assert (=> b!1151437 m!1061601))

(assert (=> b!1151437 m!1061585))

(declare-fun m!1061603 () Bool)

(assert (=> b!1151437 m!1061603))

(declare-fun m!1061605 () Bool)

(assert (=> b!1151437 m!1061605))

(assert (=> b!1151437 m!1061599))

(assert (=> b!1151437 m!1061585))

(declare-fun m!1061607 () Bool)

(assert (=> b!1151437 m!1061607))

(declare-fun m!1061609 () Bool)

(assert (=> b!1151437 m!1061609))

(declare-fun m!1061611 () Bool)

(assert (=> b!1151452 m!1061611))

(declare-fun m!1061613 () Bool)

(assert (=> b!1151452 m!1061613))

(declare-fun m!1061615 () Bool)

(assert (=> b!1151452 m!1061615))

(declare-fun m!1061617 () Bool)

(assert (=> b!1151446 m!1061617))

(declare-fun m!1061619 () Bool)

(assert (=> b!1151446 m!1061619))

(assert (=> bm!53824 m!1061589))

(assert (=> bm!53825 m!1061603))

(declare-fun m!1061621 () Bool)

(assert (=> b!1151434 m!1061621))

(declare-fun m!1061623 () Bool)

(assert (=> b!1151438 m!1061623))

(check-sat (not b!1151446) tp_is_empty!28887 (not bm!53826) (not b!1151460) (not b!1151461) (not bm!53825) (not b_next!24357) (not b!1151458) (not bm!53829) (not b!1151444) (not bm!53830) (not b!1151453) (not b!1151452) (not b!1151440) (not b!1151434) (not b!1151455) (not b!1151463) (not b!1151442) (not start!98752) (not b_lambda!19463) (not bm!53824) (not b!1151457) (not b!1151438) b_and!39565 (not mapNonEmpty!45155) (not b!1151437) (not b!1151448))
(check-sat b_and!39565 (not b_next!24357))
