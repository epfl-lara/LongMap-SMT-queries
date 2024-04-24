; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99034 () Bool)

(assert start!99034)

(declare-fun b_free!24403 () Bool)

(declare-fun b_next!24403 () Bool)

(assert (=> start!99034 (= b_free!24403 (not b_next!24403))))

(declare-fun tp!85919 () Bool)

(declare-fun b_and!39657 () Bool)

(assert (=> start!99034 (= tp!85919 b_and!39657)))

(declare-fun b!1154839 () Bool)

(declare-fun e!656903 () Bool)

(declare-fun tp_is_empty!28933 () Bool)

(assert (=> b!1154839 (= e!656903 tp_is_empty!28933)))

(declare-fun bm!54440 () Bool)

(declare-fun call!54450 () Bool)

(declare-fun call!54449 () Bool)

(assert (=> bm!54440 (= call!54450 call!54449)))

(declare-fun b!1154840 () Bool)

(declare-fun res!767245 () Bool)

(declare-fun e!656905 () Bool)

(assert (=> b!1154840 (=> (not res!767245) (not e!656905))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154840 (= res!767245 (validKeyInArray!0 k0!934))))

(declare-datatypes ((V!43705 0))(
  ( (V!43706 (val!14523 Int)) )
))
(declare-fun zeroValue!944 () V!43705)

(declare-datatypes ((array!74757 0))(
  ( (array!74758 (arr!36023 (Array (_ BitVec 32) (_ BitVec 64))) (size!36560 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74757)

(declare-fun bm!54441 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13757 0))(
  ( (ValueCellFull!13757 (v!17156 V!43705)) (EmptyCell!13757) )
))
(declare-datatypes ((array!74759 0))(
  ( (array!74760 (arr!36024 (Array (_ BitVec 32) ValueCell!13757)) (size!36561 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74759)

(declare-fun minValue!944 () V!43705)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!18472 0))(
  ( (tuple2!18473 (_1!9247 (_ BitVec 64)) (_2!9247 V!43705)) )
))
(declare-datatypes ((List!25218 0))(
  ( (Nil!25215) (Cons!25214 (h!26432 tuple2!18472) (t!36605 List!25218)) )
))
(declare-datatypes ((ListLongMap!16449 0))(
  ( (ListLongMap!16450 (toList!8240 List!25218)) )
))
(declare-fun call!54447 () ListLongMap!16449)

(declare-fun getCurrentListMapNoExtraKeys!4736 (array!74757 array!74759 (_ BitVec 32) (_ BitVec 32) V!43705 V!43705 (_ BitVec 32) Int) ListLongMap!16449)

(assert (=> bm!54441 (= call!54447 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154841 () Bool)

(declare-fun e!656897 () Bool)

(declare-fun e!656907 () Bool)

(assert (=> b!1154841 (= e!656897 e!656907)))

(declare-fun res!767254 () Bool)

(assert (=> b!1154841 (=> res!767254 e!656907)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1154841 (= res!767254 (not (= from!1455 i!673)))))

(declare-fun lt!517523 () ListLongMap!16449)

(declare-fun lt!517527 () array!74759)

(declare-fun lt!517519 () array!74757)

(assert (=> b!1154841 (= lt!517523 (getCurrentListMapNoExtraKeys!4736 lt!517519 lt!517527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!517518 () V!43705)

(assert (=> b!1154841 (= lt!517527 (array!74760 (store (arr!36024 _values!996) i!673 (ValueCellFull!13757 lt!517518)) (size!36561 _values!996)))))

(declare-fun dynLambda!2758 (Int (_ BitVec 64)) V!43705)

(assert (=> b!1154841 (= lt!517518 (dynLambda!2758 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!517517 () ListLongMap!16449)

(assert (=> b!1154841 (= lt!517517 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154843 () Bool)

(declare-fun res!767243 () Bool)

(assert (=> b!1154843 (=> (not res!767243) (not e!656905))))

(assert (=> b!1154843 (= res!767243 (= (select (arr!36023 _keys!1208) i!673) k0!934))))

(declare-fun b!1154844 () Bool)

(declare-fun res!767242 () Bool)

(assert (=> b!1154844 (=> (not res!767242) (not e!656905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154844 (= res!767242 (validMask!0 mask!1564))))

(declare-fun c!114886 () Bool)

(declare-fun c!114888 () Bool)

(declare-fun lt!517528 () ListLongMap!16449)

(declare-fun bm!54442 () Bool)

(declare-fun call!54444 () ListLongMap!16449)

(declare-fun lt!517531 () ListLongMap!16449)

(declare-fun +!3668 (ListLongMap!16449 tuple2!18472) ListLongMap!16449)

(assert (=> bm!54442 (= call!54444 (+!3668 (ite c!114886 lt!517528 lt!517531) (ite c!114886 (tuple2!18473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114888 (tuple2!18473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18473 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1154845 () Bool)

(declare-fun e!656904 () Bool)

(assert (=> b!1154845 (= e!656907 e!656904)))

(declare-fun res!767252 () Bool)

(assert (=> b!1154845 (=> res!767252 e!656904)))

(assert (=> b!1154845 (= res!767252 (not (= (select (arr!36023 _keys!1208) from!1455) k0!934)))))

(declare-fun e!656894 () Bool)

(assert (=> b!1154845 e!656894))

(declare-fun c!114887 () Bool)

(assert (=> b!1154845 (= c!114887 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!37946 0))(
  ( (Unit!37947) )
))
(declare-fun lt!517529 () Unit!37946)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!590 (array!74757 array!74759 (_ BitVec 32) (_ BitVec 32) V!43705 V!43705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37946)

(assert (=> b!1154845 (= lt!517529 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!590 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!54448 () ListLongMap!16449)

(declare-fun b!1154846 () Bool)

(declare-fun -!1350 (ListLongMap!16449 (_ BitVec 64)) ListLongMap!16449)

(assert (=> b!1154846 (= e!656894 (= call!54448 (-!1350 call!54447 k0!934)))))

(declare-fun b!1154847 () Bool)

(declare-fun e!656900 () Bool)

(declare-fun e!656899 () Bool)

(declare-fun mapRes!45224 () Bool)

(assert (=> b!1154847 (= e!656900 (and e!656899 mapRes!45224))))

(declare-fun condMapEmpty!45224 () Bool)

(declare-fun mapDefault!45224 () ValueCell!13757)

(assert (=> b!1154847 (= condMapEmpty!45224 (= (arr!36024 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13757)) mapDefault!45224)))))

(declare-fun b!1154848 () Bool)

(declare-fun e!656893 () Unit!37946)

(declare-fun Unit!37948 () Unit!37946)

(assert (=> b!1154848 (= e!656893 Unit!37948)))

(declare-fun b!1154849 () Bool)

(assert (=> b!1154849 call!54450))

(declare-fun lt!517520 () Unit!37946)

(declare-fun call!54446 () Unit!37946)

(assert (=> b!1154849 (= lt!517520 call!54446)))

(assert (=> b!1154849 (= e!656893 lt!517520)))

(declare-fun b!1154850 () Bool)

(declare-fun e!656895 () Bool)

(declare-fun arrayContainsKey!0 (array!74757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154850 (= e!656895 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154851 () Bool)

(declare-fun e!656908 () Unit!37946)

(declare-fun Unit!37949 () Unit!37946)

(assert (=> b!1154851 (= e!656908 Unit!37949)))

(declare-fun lt!517533 () Bool)

(assert (=> b!1154851 (= lt!517533 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1154851 (= c!114886 (and (not lt!517533) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!517536 () Unit!37946)

(declare-fun e!656906 () Unit!37946)

(assert (=> b!1154851 (= lt!517536 e!656906)))

(declare-fun lt!517525 () Unit!37946)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!485 (array!74757 array!74759 (_ BitVec 32) (_ BitVec 32) V!43705 V!43705 (_ BitVec 64) (_ BitVec 32) Int) Unit!37946)

(assert (=> b!1154851 (= lt!517525 (lemmaListMapContainsThenArrayContainsFrom!485 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114885 () Bool)

(assert (=> b!1154851 (= c!114885 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767251 () Bool)

(assert (=> b!1154851 (= res!767251 e!656895)))

(declare-fun e!656901 () Bool)

(assert (=> b!1154851 (=> (not res!767251) (not e!656901))))

(assert (=> b!1154851 e!656901))

(declare-fun lt!517526 () Unit!37946)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74757 (_ BitVec 32) (_ BitVec 32)) Unit!37946)

(assert (=> b!1154851 (= lt!517526 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25219 0))(
  ( (Nil!25216) (Cons!25215 (h!26433 (_ BitVec 64)) (t!36606 List!25219)) )
))
(declare-fun arrayNoDuplicates!0 (array!74757 (_ BitVec 32) List!25219) Bool)

(assert (=> b!1154851 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25216)))

(declare-fun lt!517521 () Unit!37946)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74757 (_ BitVec 64) (_ BitVec 32) List!25219) Unit!37946)

(assert (=> b!1154851 (= lt!517521 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25216))))

(assert (=> b!1154851 false))

(declare-fun b!1154852 () Bool)

(declare-fun res!767253 () Bool)

(assert (=> b!1154852 (=> (not res!767253) (not e!656905))))

(assert (=> b!1154852 (= res!767253 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36560 _keys!1208))))))

(declare-fun b!1154853 () Bool)

(declare-fun contains!6767 (ListLongMap!16449 (_ BitVec 64)) Bool)

(assert (=> b!1154853 (contains!6767 call!54444 k0!934)))

(declare-fun lt!517537 () Unit!37946)

(declare-fun call!54443 () Unit!37946)

(assert (=> b!1154853 (= lt!517537 call!54443)))

(assert (=> b!1154853 call!54449))

(assert (=> b!1154853 (= lt!517528 (+!3668 lt!517531 (tuple2!18473 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!517532 () Unit!37946)

(declare-fun addStillContains!891 (ListLongMap!16449 (_ BitVec 64) V!43705 (_ BitVec 64)) Unit!37946)

(assert (=> b!1154853 (= lt!517532 (addStillContains!891 lt!517531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1154853 (= e!656906 lt!517537)))

(declare-fun bm!54443 () Bool)

(assert (=> bm!54443 (= call!54443 (addStillContains!891 (ite c!114886 lt!517528 lt!517531) (ite c!114886 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114888 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114886 minValue!944 (ite c!114888 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!54444 () Bool)

(assert (=> bm!54444 (= call!54446 call!54443)))

(declare-fun b!1154854 () Bool)

(declare-fun res!767256 () Bool)

(assert (=> b!1154854 (=> (not res!767256) (not e!656905))))

(assert (=> b!1154854 (= res!767256 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25216))))

(declare-fun b!1154855 () Bool)

(declare-fun res!767250 () Bool)

(assert (=> b!1154855 (=> (not res!767250) (not e!656905))))

(assert (=> b!1154855 (= res!767250 (and (= (size!36561 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36560 _keys!1208) (size!36561 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!54445 () ListLongMap!16449)

(declare-fun bm!54445 () Bool)

(assert (=> bm!54445 (= call!54449 (contains!6767 (ite c!114886 lt!517528 call!54445) k0!934))))

(declare-fun b!1154856 () Bool)

(declare-fun res!767247 () Bool)

(declare-fun e!656902 () Bool)

(assert (=> b!1154856 (=> (not res!767247) (not e!656902))))

(assert (=> b!1154856 (= res!767247 (arrayNoDuplicates!0 lt!517519 #b00000000000000000000000000000000 Nil!25216))))

(declare-fun b!1154857 () Bool)

(assert (=> b!1154857 (= e!656901 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154858 () Bool)

(assert (=> b!1154858 (= e!656902 (not e!656897))))

(declare-fun res!767249 () Bool)

(assert (=> b!1154858 (=> res!767249 e!656897)))

(assert (=> b!1154858 (= res!767249 (bvsgt from!1455 i!673))))

(assert (=> b!1154858 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!517530 () Unit!37946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74757 (_ BitVec 64) (_ BitVec 32)) Unit!37946)

(assert (=> b!1154858 (= lt!517530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1154859 () Bool)

(assert (=> b!1154859 (= e!656899 tp_is_empty!28933)))

(declare-fun b!1154860 () Bool)

(declare-fun e!656896 () Unit!37946)

(assert (=> b!1154860 (= e!656896 e!656893)))

(declare-fun c!114884 () Bool)

(assert (=> b!1154860 (= c!114884 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!517533))))

(declare-fun b!1154861 () Bool)

(assert (=> b!1154861 (= e!656894 (= call!54448 call!54447))))

(declare-fun b!1154862 () Bool)

(assert (=> b!1154862 (= e!656905 e!656902)))

(declare-fun res!767248 () Bool)

(assert (=> b!1154862 (=> (not res!767248) (not e!656902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74757 (_ BitVec 32)) Bool)

(assert (=> b!1154862 (= res!767248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517519 mask!1564))))

(assert (=> b!1154862 (= lt!517519 (array!74758 (store (arr!36023 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36560 _keys!1208)))))

(declare-fun bm!54446 () Bool)

(assert (=> bm!54446 (= call!54445 call!54444)))

(declare-fun b!1154863 () Bool)

(declare-fun res!767255 () Bool)

(assert (=> b!1154863 (=> (not res!767255) (not e!656905))))

(assert (=> b!1154863 (= res!767255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!45224 () Bool)

(declare-fun tp!85920 () Bool)

(assert (=> mapNonEmpty!45224 (= mapRes!45224 (and tp!85920 e!656903))))

(declare-fun mapKey!45224 () (_ BitVec 32))

(declare-fun mapRest!45224 () (Array (_ BitVec 32) ValueCell!13757))

(declare-fun mapValue!45224 () ValueCell!13757)

(assert (=> mapNonEmpty!45224 (= (arr!36024 _values!996) (store mapRest!45224 mapKey!45224 mapValue!45224))))

(declare-fun mapIsEmpty!45224 () Bool)

(assert (=> mapIsEmpty!45224 mapRes!45224))

(declare-fun lt!517535 () ListLongMap!16449)

(declare-fun e!656892 () Bool)

(declare-fun b!1154864 () Bool)

(assert (=> b!1154864 (= e!656892 (= lt!517535 (getCurrentListMapNoExtraKeys!4736 lt!517519 lt!517527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1154865 () Bool)

(declare-fun Unit!37950 () Unit!37946)

(assert (=> b!1154865 (= e!656908 Unit!37950)))

(declare-fun b!1154866 () Bool)

(declare-fun lt!517534 () Unit!37946)

(assert (=> b!1154866 (= e!656896 lt!517534)))

(assert (=> b!1154866 (= lt!517534 call!54446)))

(assert (=> b!1154866 call!54450))

(declare-fun b!1154867 () Bool)

(assert (=> b!1154867 (= e!656904 true)))

(assert (=> b!1154867 e!656892))

(declare-fun res!767246 () Bool)

(assert (=> b!1154867 (=> (not res!767246) (not e!656892))))

(assert (=> b!1154867 (= res!767246 (= lt!517535 lt!517531))))

(assert (=> b!1154867 (= lt!517535 (-!1350 lt!517517 k0!934))))

(declare-fun lt!517516 () V!43705)

(assert (=> b!1154867 (= (-!1350 (+!3668 lt!517531 (tuple2!18473 (select (arr!36023 _keys!1208) from!1455) lt!517516)) (select (arr!36023 _keys!1208) from!1455)) lt!517531)))

(declare-fun lt!517524 () Unit!37946)

(declare-fun addThenRemoveForNewKeyIsSame!193 (ListLongMap!16449 (_ BitVec 64) V!43705) Unit!37946)

(assert (=> b!1154867 (= lt!517524 (addThenRemoveForNewKeyIsSame!193 lt!517531 (select (arr!36023 _keys!1208) from!1455) lt!517516))))

(declare-fun get!18372 (ValueCell!13757 V!43705) V!43705)

(assert (=> b!1154867 (= lt!517516 (get!18372 (select (arr!36024 _values!996) from!1455) lt!517518))))

(declare-fun lt!517522 () Unit!37946)

(assert (=> b!1154867 (= lt!517522 e!656908)))

(declare-fun c!114883 () Bool)

(assert (=> b!1154867 (= c!114883 (contains!6767 lt!517531 k0!934))))

(assert (=> b!1154867 (= lt!517531 (getCurrentListMapNoExtraKeys!4736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154842 () Bool)

(assert (=> b!1154842 (= e!656895 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517533) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!767244 () Bool)

(assert (=> start!99034 (=> (not res!767244) (not e!656905))))

(assert (=> start!99034 (= res!767244 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36560 _keys!1208))))))

(assert (=> start!99034 e!656905))

(assert (=> start!99034 tp_is_empty!28933))

(declare-fun array_inv!27636 (array!74757) Bool)

(assert (=> start!99034 (array_inv!27636 _keys!1208)))

(assert (=> start!99034 true))

(assert (=> start!99034 tp!85919))

(declare-fun array_inv!27637 (array!74759) Bool)

(assert (=> start!99034 (and (array_inv!27637 _values!996) e!656900)))

(declare-fun b!1154868 () Bool)

(assert (=> b!1154868 (= c!114888 (and (not lt!517533) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1154868 (= e!656906 e!656896)))

(declare-fun bm!54447 () Bool)

(assert (=> bm!54447 (= call!54448 (getCurrentListMapNoExtraKeys!4736 lt!517519 lt!517527 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99034 res!767244) b!1154844))

(assert (= (and b!1154844 res!767242) b!1154855))

(assert (= (and b!1154855 res!767250) b!1154863))

(assert (= (and b!1154863 res!767255) b!1154854))

(assert (= (and b!1154854 res!767256) b!1154852))

(assert (= (and b!1154852 res!767253) b!1154840))

(assert (= (and b!1154840 res!767245) b!1154843))

(assert (= (and b!1154843 res!767243) b!1154862))

(assert (= (and b!1154862 res!767248) b!1154856))

(assert (= (and b!1154856 res!767247) b!1154858))

(assert (= (and b!1154858 (not res!767249)) b!1154841))

(assert (= (and b!1154841 (not res!767254)) b!1154845))

(assert (= (and b!1154845 c!114887) b!1154846))

(assert (= (and b!1154845 (not c!114887)) b!1154861))

(assert (= (or b!1154846 b!1154861) bm!54447))

(assert (= (or b!1154846 b!1154861) bm!54441))

(assert (= (and b!1154845 (not res!767252)) b!1154867))

(assert (= (and b!1154867 c!114883) b!1154851))

(assert (= (and b!1154867 (not c!114883)) b!1154865))

(assert (= (and b!1154851 c!114886) b!1154853))

(assert (= (and b!1154851 (not c!114886)) b!1154868))

(assert (= (and b!1154868 c!114888) b!1154866))

(assert (= (and b!1154868 (not c!114888)) b!1154860))

(assert (= (and b!1154860 c!114884) b!1154849))

(assert (= (and b!1154860 (not c!114884)) b!1154848))

(assert (= (or b!1154866 b!1154849) bm!54444))

(assert (= (or b!1154866 b!1154849) bm!54446))

(assert (= (or b!1154866 b!1154849) bm!54440))

(assert (= (or b!1154853 bm!54440) bm!54445))

(assert (= (or b!1154853 bm!54444) bm!54443))

(assert (= (or b!1154853 bm!54446) bm!54442))

(assert (= (and b!1154851 c!114885) b!1154850))

(assert (= (and b!1154851 (not c!114885)) b!1154842))

(assert (= (and b!1154851 res!767251) b!1154857))

(assert (= (and b!1154867 res!767246) b!1154864))

(assert (= (and b!1154847 condMapEmpty!45224) mapIsEmpty!45224))

(assert (= (and b!1154847 (not condMapEmpty!45224)) mapNonEmpty!45224))

(get-info :version)

(assert (= (and mapNonEmpty!45224 ((_ is ValueCellFull!13757) mapValue!45224)) b!1154839))

(assert (= (and b!1154847 ((_ is ValueCellFull!13757) mapDefault!45224)) b!1154859))

(assert (= start!99034 b!1154847))

(declare-fun b_lambda!19503 () Bool)

(assert (=> (not b_lambda!19503) (not b!1154841)))

(declare-fun t!36604 () Bool)

(declare-fun tb!9207 () Bool)

(assert (=> (and start!99034 (= defaultEntry!1004 defaultEntry!1004) t!36604) tb!9207))

(declare-fun result!18987 () Bool)

(assert (=> tb!9207 (= result!18987 tp_is_empty!28933)))

(assert (=> b!1154841 t!36604))

(declare-fun b_and!39659 () Bool)

(assert (= b_and!39657 (and (=> t!36604 result!18987) b_and!39659)))

(declare-fun m!1064953 () Bool)

(assert (=> b!1154862 m!1064953))

(declare-fun m!1064955 () Bool)

(assert (=> b!1154862 m!1064955))

(declare-fun m!1064957 () Bool)

(assert (=> b!1154846 m!1064957))

(declare-fun m!1064959 () Bool)

(assert (=> b!1154854 m!1064959))

(declare-fun m!1064961 () Bool)

(assert (=> b!1154845 m!1064961))

(declare-fun m!1064963 () Bool)

(assert (=> b!1154845 m!1064963))

(declare-fun m!1064965 () Bool)

(assert (=> bm!54443 m!1064965))

(declare-fun m!1064967 () Bool)

(assert (=> bm!54441 m!1064967))

(declare-fun m!1064969 () Bool)

(assert (=> b!1154841 m!1064969))

(declare-fun m!1064971 () Bool)

(assert (=> b!1154841 m!1064971))

(declare-fun m!1064973 () Bool)

(assert (=> b!1154841 m!1064973))

(declare-fun m!1064975 () Bool)

(assert (=> b!1154841 m!1064975))

(assert (=> b!1154867 m!1064967))

(declare-fun m!1064977 () Bool)

(assert (=> b!1154867 m!1064977))

(declare-fun m!1064979 () Bool)

(assert (=> b!1154867 m!1064979))

(declare-fun m!1064981 () Bool)

(assert (=> b!1154867 m!1064981))

(assert (=> b!1154867 m!1064961))

(declare-fun m!1064983 () Bool)

(assert (=> b!1154867 m!1064983))

(assert (=> b!1154867 m!1064979))

(assert (=> b!1154867 m!1064961))

(declare-fun m!1064985 () Bool)

(assert (=> b!1154867 m!1064985))

(assert (=> b!1154867 m!1064977))

(declare-fun m!1064987 () Bool)

(assert (=> b!1154867 m!1064987))

(declare-fun m!1064989 () Bool)

(assert (=> b!1154867 m!1064989))

(assert (=> b!1154867 m!1064961))

(declare-fun m!1064991 () Bool)

(assert (=> b!1154857 m!1064991))

(declare-fun m!1064993 () Bool)

(assert (=> b!1154864 m!1064993))

(declare-fun m!1064995 () Bool)

(assert (=> b!1154844 m!1064995))

(declare-fun m!1064997 () Bool)

(assert (=> b!1154856 m!1064997))

(declare-fun m!1064999 () Bool)

(assert (=> b!1154840 m!1064999))

(declare-fun m!1065001 () Bool)

(assert (=> b!1154851 m!1065001))

(declare-fun m!1065003 () Bool)

(assert (=> b!1154851 m!1065003))

(declare-fun m!1065005 () Bool)

(assert (=> b!1154851 m!1065005))

(declare-fun m!1065007 () Bool)

(assert (=> b!1154851 m!1065007))

(declare-fun m!1065009 () Bool)

(assert (=> start!99034 m!1065009))

(declare-fun m!1065011 () Bool)

(assert (=> start!99034 m!1065011))

(declare-fun m!1065013 () Bool)

(assert (=> b!1154853 m!1065013))

(declare-fun m!1065015 () Bool)

(assert (=> b!1154853 m!1065015))

(declare-fun m!1065017 () Bool)

(assert (=> b!1154853 m!1065017))

(assert (=> bm!54447 m!1064993))

(assert (=> b!1154850 m!1064991))

(declare-fun m!1065019 () Bool)

(assert (=> mapNonEmpty!45224 m!1065019))

(declare-fun m!1065021 () Bool)

(assert (=> bm!54442 m!1065021))

(declare-fun m!1065023 () Bool)

(assert (=> b!1154858 m!1065023))

(declare-fun m!1065025 () Bool)

(assert (=> b!1154858 m!1065025))

(declare-fun m!1065027 () Bool)

(assert (=> b!1154863 m!1065027))

(declare-fun m!1065029 () Bool)

(assert (=> bm!54445 m!1065029))

(declare-fun m!1065031 () Bool)

(assert (=> b!1154843 m!1065031))

(check-sat (not b!1154840) (not b!1154864) (not b!1154862) (not b!1154863) (not mapNonEmpty!45224) (not b!1154858) (not bm!54445) (not bm!54443) (not b_next!24403) (not b!1154844) (not b!1154854) b_and!39659 (not b!1154853) (not bm!54442) (not b!1154867) (not b!1154850) (not b!1154857) (not b!1154851) (not start!99034) (not b!1154845) (not b!1154846) (not b!1154841) (not bm!54447) (not bm!54441) (not b!1154856) tp_is_empty!28933 (not b_lambda!19503))
(check-sat b_and!39659 (not b_next!24403))
