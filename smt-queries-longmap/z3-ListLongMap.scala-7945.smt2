; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98746 () Bool)

(assert start!98746)

(declare-fun b_free!24115 () Bool)

(declare-fun b_next!24115 () Bool)

(assert (=> start!98746 (= b_free!24115 (not b_next!24115))))

(declare-fun tp!85055 () Bool)

(declare-fun b_and!39081 () Bool)

(assert (=> start!98746 (= tp!85055 b_and!39081)))

(declare-fun b!1141715 () Bool)

(declare-fun res!760895 () Bool)

(declare-fun e!649680 () Bool)

(assert (=> b!1141715 (=> (not res!760895) (not e!649680))))

(declare-datatypes ((array!74191 0))(
  ( (array!74192 (arr!35740 (Array (_ BitVec 32) (_ BitVec 64))) (size!36277 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74191)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74191 (_ BitVec 32)) Bool)

(assert (=> b!1141715 (= res!760895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141716 () Bool)

(declare-fun e!649683 () Bool)

(assert (=> b!1141716 (= e!649680 e!649683)))

(declare-fun res!760899 () Bool)

(assert (=> b!1141716 (=> (not res!760899) (not e!649683))))

(declare-fun lt!508305 () array!74191)

(assert (=> b!1141716 (= res!760899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508305 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141716 (= lt!508305 (array!74192 (store (arr!35740 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36277 _keys!1208)))))

(declare-fun b!1141717 () Bool)

(declare-fun e!649686 () Bool)

(declare-fun e!649677 () Bool)

(declare-fun mapRes!44792 () Bool)

(assert (=> b!1141717 (= e!649686 (and e!649677 mapRes!44792))))

(declare-fun condMapEmpty!44792 () Bool)

(declare-datatypes ((V!43321 0))(
  ( (V!43322 (val!14379 Int)) )
))
(declare-datatypes ((ValueCell!13613 0))(
  ( (ValueCellFull!13613 (v!17012 V!43321)) (EmptyCell!13613) )
))
(declare-datatypes ((array!74193 0))(
  ( (array!74194 (arr!35741 (Array (_ BitVec 32) ValueCell!13613)) (size!36278 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74193)

(declare-fun mapDefault!44792 () ValueCell!13613)

(assert (=> b!1141717 (= condMapEmpty!44792 (= (arr!35741 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13613)) mapDefault!44792)))))

(declare-fun b!1141718 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!649672 () Bool)

(declare-fun arrayContainsKey!0 (array!74191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141718 (= e!649672 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50984 () Bool)

(declare-datatypes ((tuple2!18196 0))(
  ( (tuple2!18197 (_1!9109 (_ BitVec 64)) (_2!9109 V!43321)) )
))
(declare-datatypes ((List!24958 0))(
  ( (Nil!24955) (Cons!24954 (h!26172 tuple2!18196) (t!36057 List!24958)) )
))
(declare-datatypes ((ListLongMap!16173 0))(
  ( (ListLongMap!16174 (toList!8102 List!24958)) )
))
(declare-fun call!50988 () ListLongMap!16173)

(declare-fun call!50992 () ListLongMap!16173)

(assert (=> bm!50984 (= call!50988 call!50992)))

(declare-fun zeroValue!944 () V!43321)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!50985 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!508299 () array!74193)

(declare-fun call!50993 () ListLongMap!16173)

(declare-fun minValue!944 () V!43321)

(declare-fun getCurrentListMapNoExtraKeys!4610 (array!74191 array!74193 (_ BitVec 32) (_ BitVec 32) V!43321 V!43321 (_ BitVec 32) Int) ListLongMap!16173)

(assert (=> bm!50985 (= call!50993 (getCurrentListMapNoExtraKeys!4610 lt!508305 lt!508299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141719 () Bool)

(declare-fun e!649676 () Bool)

(declare-fun e!649684 () Bool)

(assert (=> b!1141719 (= e!649676 e!649684)))

(declare-fun res!760888 () Bool)

(assert (=> b!1141719 (=> res!760888 e!649684)))

(assert (=> b!1141719 (= res!760888 (not (= from!1455 i!673)))))

(declare-fun lt!508301 () ListLongMap!16173)

(assert (=> b!1141719 (= lt!508301 (getCurrentListMapNoExtraKeys!4610 lt!508305 lt!508299 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508311 () V!43321)

(assert (=> b!1141719 (= lt!508299 (array!74194 (store (arr!35741 _values!996) i!673 (ValueCellFull!13613 lt!508311)) (size!36278 _values!996)))))

(declare-fun dynLambda!2653 (Int (_ BitVec 64)) V!43321)

(assert (=> b!1141719 (= lt!508311 (dynLambda!2653 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508317 () ListLongMap!16173)

(assert (=> b!1141719 (= lt!508317 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141720 () Bool)

(declare-fun res!760894 () Bool)

(assert (=> b!1141720 (=> (not res!760894) (not e!649680))))

(assert (=> b!1141720 (= res!760894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36277 _keys!1208))))))

(declare-fun b!1141721 () Bool)

(declare-fun lt!508307 () ListLongMap!16173)

(declare-fun contains!6649 (ListLongMap!16173 (_ BitVec 64)) Bool)

(declare-fun +!3551 (ListLongMap!16173 tuple2!18196) ListLongMap!16173)

(assert (=> b!1141721 (contains!6649 (+!3551 lt!508307 (tuple2!18197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!37375 0))(
  ( (Unit!37376) )
))
(declare-fun lt!508318 () Unit!37375)

(declare-fun call!50990 () Unit!37375)

(assert (=> b!1141721 (= lt!508318 call!50990)))

(declare-fun call!50989 () Bool)

(assert (=> b!1141721 call!50989))

(assert (=> b!1141721 (= lt!508307 call!50992)))

(declare-fun lt!508302 () Unit!37375)

(declare-fun lt!508308 () ListLongMap!16173)

(declare-fun addStillContains!779 (ListLongMap!16173 (_ BitVec 64) V!43321 (_ BitVec 64)) Unit!37375)

(assert (=> b!1141721 (= lt!508302 (addStillContains!779 lt!508308 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!649674 () Unit!37375)

(assert (=> b!1141721 (= e!649674 lt!508318)))

(declare-fun b!1141722 () Bool)

(declare-fun e!649685 () Bool)

(declare-fun tp_is_empty!28645 () Bool)

(assert (=> b!1141722 (= e!649685 tp_is_empty!28645)))

(declare-fun b!1141723 () Bool)

(declare-fun e!649681 () Bool)

(assert (=> b!1141723 (= e!649684 e!649681)))

(declare-fun res!760889 () Bool)

(assert (=> b!1141723 (=> res!760889 e!649681)))

(assert (=> b!1141723 (= res!760889 (not (= (select (arr!35740 _keys!1208) from!1455) k0!934)))))

(declare-fun e!649675 () Bool)

(assert (=> b!1141723 e!649675))

(declare-fun c!112296 () Bool)

(assert (=> b!1141723 (= c!112296 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!508298 () Unit!37375)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!492 (array!74191 array!74193 (_ BitVec 32) (_ BitVec 32) V!43321 V!43321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37375)

(assert (=> b!1141723 (= lt!508298 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141724 () Bool)

(assert (=> b!1141724 (= e!649683 (not e!649676))))

(declare-fun res!760896 () Bool)

(assert (=> b!1141724 (=> res!760896 e!649676)))

(assert (=> b!1141724 (= res!760896 (bvsgt from!1455 i!673))))

(assert (=> b!1141724 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508314 () Unit!37375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74191 (_ BitVec 64) (_ BitVec 32)) Unit!37375)

(assert (=> b!1141724 (= lt!508314 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1141725 () Bool)

(assert (=> b!1141725 (= e!649681 true)))

(declare-fun lt!508312 () V!43321)

(declare-fun -!1236 (ListLongMap!16173 (_ BitVec 64)) ListLongMap!16173)

(assert (=> b!1141725 (= (-!1236 (+!3551 lt!508308 (tuple2!18197 (select (arr!35740 _keys!1208) from!1455) lt!508312)) (select (arr!35740 _keys!1208) from!1455)) lt!508308)))

(declare-fun lt!508304 () Unit!37375)

(declare-fun addThenRemoveForNewKeyIsSame!96 (ListLongMap!16173 (_ BitVec 64) V!43321) Unit!37375)

(assert (=> b!1141725 (= lt!508304 (addThenRemoveForNewKeyIsSame!96 lt!508308 (select (arr!35740 _keys!1208) from!1455) lt!508312))))

(declare-fun get!18179 (ValueCell!13613 V!43321) V!43321)

(assert (=> b!1141725 (= lt!508312 (get!18179 (select (arr!35741 _values!996) from!1455) lt!508311))))

(declare-fun lt!508303 () Unit!37375)

(declare-fun e!649679 () Unit!37375)

(assert (=> b!1141725 (= lt!508303 e!649679)))

(declare-fun c!112291 () Bool)

(assert (=> b!1141725 (= c!112291 (contains!6649 lt!508308 k0!934))))

(assert (=> b!1141725 (= lt!508308 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141726 () Bool)

(declare-fun e!649682 () Unit!37375)

(declare-fun lt!508313 () Unit!37375)

(assert (=> b!1141726 (= e!649682 lt!508313)))

(declare-fun call!50994 () Unit!37375)

(assert (=> b!1141726 (= lt!508313 call!50994)))

(declare-fun call!50991 () Bool)

(assert (=> b!1141726 call!50991))

(declare-fun b!1141727 () Bool)

(declare-fun res!760890 () Bool)

(assert (=> b!1141727 (=> (not res!760890) (not e!649680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141727 (= res!760890 (validKeyInArray!0 k0!934))))

(declare-fun res!760886 () Bool)

(assert (=> start!98746 (=> (not res!760886) (not e!649680))))

(assert (=> start!98746 (= res!760886 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36277 _keys!1208))))))

(assert (=> start!98746 e!649680))

(assert (=> start!98746 tp_is_empty!28645))

(declare-fun array_inv!27444 (array!74191) Bool)

(assert (=> start!98746 (array_inv!27444 _keys!1208)))

(assert (=> start!98746 true))

(assert (=> start!98746 tp!85055))

(declare-fun array_inv!27445 (array!74193) Bool)

(assert (=> start!98746 (and (array_inv!27445 _values!996) e!649686)))

(declare-fun mapNonEmpty!44792 () Bool)

(declare-fun tp!85056 () Bool)

(assert (=> mapNonEmpty!44792 (= mapRes!44792 (and tp!85056 e!649685))))

(declare-fun mapRest!44792 () (Array (_ BitVec 32) ValueCell!13613))

(declare-fun mapValue!44792 () ValueCell!13613)

(declare-fun mapKey!44792 () (_ BitVec 32))

(assert (=> mapNonEmpty!44792 (= (arr!35741 _values!996) (store mapRest!44792 mapKey!44792 mapValue!44792))))

(declare-fun b!1141728 () Bool)

(declare-fun res!760892 () Bool)

(assert (=> b!1141728 (=> (not res!760892) (not e!649680))))

(assert (=> b!1141728 (= res!760892 (= (select (arr!35740 _keys!1208) i!673) k0!934))))

(declare-fun b!1141729 () Bool)

(declare-fun Unit!37377 () Unit!37375)

(assert (=> b!1141729 (= e!649679 Unit!37377)))

(declare-fun lt!508306 () Bool)

(assert (=> b!1141729 (= lt!508306 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112293 () Bool)

(assert (=> b!1141729 (= c!112293 (and (not lt!508306) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508316 () Unit!37375)

(assert (=> b!1141729 (= lt!508316 e!649674)))

(declare-fun lt!508315 () Unit!37375)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!384 (array!74191 array!74193 (_ BitVec 32) (_ BitVec 32) V!43321 V!43321 (_ BitVec 64) (_ BitVec 32) Int) Unit!37375)

(assert (=> b!1141729 (= lt!508315 (lemmaListMapContainsThenArrayContainsFrom!384 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112292 () Bool)

(assert (=> b!1141729 (= c!112292 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760891 () Bool)

(assert (=> b!1141729 (= res!760891 e!649672)))

(declare-fun e!649678 () Bool)

(assert (=> b!1141729 (=> (not res!760891) (not e!649678))))

(assert (=> b!1141729 e!649678))

(declare-fun lt!508310 () Unit!37375)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74191 (_ BitVec 32) (_ BitVec 32)) Unit!37375)

(assert (=> b!1141729 (= lt!508310 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24959 0))(
  ( (Nil!24956) (Cons!24955 (h!26173 (_ BitVec 64)) (t!36058 List!24959)) )
))
(declare-fun arrayNoDuplicates!0 (array!74191 (_ BitVec 32) List!24959) Bool)

(assert (=> b!1141729 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24956)))

(declare-fun lt!508309 () Unit!37375)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74191 (_ BitVec 64) (_ BitVec 32) List!24959) Unit!37375)

(assert (=> b!1141729 (= lt!508309 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24956))))

(assert (=> b!1141729 false))

(declare-fun bm!50986 () Bool)

(declare-fun c!112294 () Bool)

(assert (=> bm!50986 (= call!50992 (+!3551 lt!508308 (ite (or c!112293 c!112294) (tuple2!18197 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1141730 () Bool)

(declare-fun res!760893 () Bool)

(assert (=> b!1141730 (=> (not res!760893) (not e!649683))))

(assert (=> b!1141730 (= res!760893 (arrayNoDuplicates!0 lt!508305 #b00000000000000000000000000000000 Nil!24956))))

(declare-fun b!1141731 () Bool)

(declare-fun res!760887 () Bool)

(assert (=> b!1141731 (=> (not res!760887) (not e!649680))))

(assert (=> b!1141731 (= res!760887 (and (= (size!36278 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36277 _keys!1208) (size!36278 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141732 () Bool)

(assert (=> b!1141732 (= e!649677 tp_is_empty!28645)))

(declare-fun b!1141733 () Bool)

(declare-fun Unit!37378 () Unit!37375)

(assert (=> b!1141733 (= e!649679 Unit!37378)))

(declare-fun b!1141734 () Bool)

(declare-fun res!760898 () Bool)

(assert (=> b!1141734 (=> (not res!760898) (not e!649680))))

(assert (=> b!1141734 (= res!760898 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24956))))

(declare-fun call!50987 () ListLongMap!16173)

(declare-fun bm!50987 () Bool)

(assert (=> bm!50987 (= call!50987 (getCurrentListMapNoExtraKeys!4610 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141735 () Bool)

(assert (=> b!1141735 (= e!649672 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508306) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141736 () Bool)

(assert (=> b!1141736 call!50991))

(declare-fun lt!508300 () Unit!37375)

(assert (=> b!1141736 (= lt!508300 call!50994)))

(declare-fun e!649687 () Unit!37375)

(assert (=> b!1141736 (= e!649687 lt!508300)))

(declare-fun bm!50988 () Bool)

(assert (=> bm!50988 (= call!50990 (addStillContains!779 (ite c!112293 lt!508307 lt!508308) (ite c!112293 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112294 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112293 minValue!944 (ite c!112294 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1141737 () Bool)

(declare-fun res!760897 () Bool)

(assert (=> b!1141737 (=> (not res!760897) (not e!649680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141737 (= res!760897 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44792 () Bool)

(assert (=> mapIsEmpty!44792 mapRes!44792))

(declare-fun bm!50989 () Bool)

(assert (=> bm!50989 (= call!50994 call!50990)))

(declare-fun b!1141738 () Bool)

(assert (=> b!1141738 (= e!649682 e!649687)))

(declare-fun c!112295 () Bool)

(assert (=> b!1141738 (= c!112295 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508306))))

(declare-fun b!1141739 () Bool)

(declare-fun Unit!37379 () Unit!37375)

(assert (=> b!1141739 (= e!649687 Unit!37379)))

(declare-fun b!1141740 () Bool)

(assert (=> b!1141740 (= e!649675 (= call!50993 call!50987))))

(declare-fun b!1141741 () Bool)

(assert (=> b!1141741 (= e!649678 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141742 () Bool)

(assert (=> b!1141742 (= e!649675 (= call!50993 (-!1236 call!50987 k0!934)))))

(declare-fun bm!50990 () Bool)

(assert (=> bm!50990 (= call!50989 (contains!6649 (ite c!112293 lt!508307 call!50988) k0!934))))

(declare-fun b!1141743 () Bool)

(assert (=> b!1141743 (= c!112294 (and (not lt!508306) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1141743 (= e!649674 e!649682)))

(declare-fun bm!50991 () Bool)

(assert (=> bm!50991 (= call!50991 call!50989)))

(assert (= (and start!98746 res!760886) b!1141737))

(assert (= (and b!1141737 res!760897) b!1141731))

(assert (= (and b!1141731 res!760887) b!1141715))

(assert (= (and b!1141715 res!760895) b!1141734))

(assert (= (and b!1141734 res!760898) b!1141720))

(assert (= (and b!1141720 res!760894) b!1141727))

(assert (= (and b!1141727 res!760890) b!1141728))

(assert (= (and b!1141728 res!760892) b!1141716))

(assert (= (and b!1141716 res!760899) b!1141730))

(assert (= (and b!1141730 res!760893) b!1141724))

(assert (= (and b!1141724 (not res!760896)) b!1141719))

(assert (= (and b!1141719 (not res!760888)) b!1141723))

(assert (= (and b!1141723 c!112296) b!1141742))

(assert (= (and b!1141723 (not c!112296)) b!1141740))

(assert (= (or b!1141742 b!1141740) bm!50985))

(assert (= (or b!1141742 b!1141740) bm!50987))

(assert (= (and b!1141723 (not res!760889)) b!1141725))

(assert (= (and b!1141725 c!112291) b!1141729))

(assert (= (and b!1141725 (not c!112291)) b!1141733))

(assert (= (and b!1141729 c!112293) b!1141721))

(assert (= (and b!1141729 (not c!112293)) b!1141743))

(assert (= (and b!1141743 c!112294) b!1141726))

(assert (= (and b!1141743 (not c!112294)) b!1141738))

(assert (= (and b!1141738 c!112295) b!1141736))

(assert (= (and b!1141738 (not c!112295)) b!1141739))

(assert (= (or b!1141726 b!1141736) bm!50989))

(assert (= (or b!1141726 b!1141736) bm!50984))

(assert (= (or b!1141726 b!1141736) bm!50991))

(assert (= (or b!1141721 bm!50991) bm!50990))

(assert (= (or b!1141721 bm!50989) bm!50988))

(assert (= (or b!1141721 bm!50984) bm!50986))

(assert (= (and b!1141729 c!112292) b!1141718))

(assert (= (and b!1141729 (not c!112292)) b!1141735))

(assert (= (and b!1141729 res!760891) b!1141741))

(assert (= (and b!1141717 condMapEmpty!44792) mapIsEmpty!44792))

(assert (= (and b!1141717 (not condMapEmpty!44792)) mapNonEmpty!44792))

(get-info :version)

(assert (= (and mapNonEmpty!44792 ((_ is ValueCellFull!13613) mapValue!44792)) b!1141722))

(assert (= (and b!1141717 ((_ is ValueCellFull!13613) mapDefault!44792)) b!1141732))

(assert (= start!98746 b!1141717))

(declare-fun b_lambda!19215 () Bool)

(assert (=> (not b_lambda!19215) (not b!1141719)))

(declare-fun t!36056 () Bool)

(declare-fun tb!8919 () Bool)

(assert (=> (and start!98746 (= defaultEntry!1004 defaultEntry!1004) t!36056) tb!8919))

(declare-fun result!18411 () Bool)

(assert (=> tb!8919 (= result!18411 tp_is_empty!28645)))

(assert (=> b!1141719 t!36056))

(declare-fun b_and!39083 () Bool)

(assert (= b_and!39081 (and (=> t!36056 result!18411) b_and!39083)))

(declare-fun m!1053515 () Bool)

(assert (=> bm!50986 m!1053515))

(declare-fun m!1053517 () Bool)

(assert (=> bm!50990 m!1053517))

(declare-fun m!1053519 () Bool)

(assert (=> b!1141729 m!1053519))

(declare-fun m!1053521 () Bool)

(assert (=> b!1141729 m!1053521))

(declare-fun m!1053523 () Bool)

(assert (=> b!1141729 m!1053523))

(declare-fun m!1053525 () Bool)

(assert (=> b!1141729 m!1053525))

(declare-fun m!1053527 () Bool)

(assert (=> b!1141716 m!1053527))

(declare-fun m!1053529 () Bool)

(assert (=> b!1141716 m!1053529))

(declare-fun m!1053531 () Bool)

(assert (=> b!1141721 m!1053531))

(assert (=> b!1141721 m!1053531))

(declare-fun m!1053533 () Bool)

(assert (=> b!1141721 m!1053533))

(declare-fun m!1053535 () Bool)

(assert (=> b!1141721 m!1053535))

(declare-fun m!1053537 () Bool)

(assert (=> b!1141741 m!1053537))

(declare-fun m!1053539 () Bool)

(assert (=> b!1141734 m!1053539))

(declare-fun m!1053541 () Bool)

(assert (=> start!98746 m!1053541))

(declare-fun m!1053543 () Bool)

(assert (=> start!98746 m!1053543))

(declare-fun m!1053545 () Bool)

(assert (=> b!1141742 m!1053545))

(assert (=> b!1141718 m!1053537))

(declare-fun m!1053547 () Bool)

(assert (=> mapNonEmpty!44792 m!1053547))

(declare-fun m!1053549 () Bool)

(assert (=> b!1141728 m!1053549))

(declare-fun m!1053551 () Bool)

(assert (=> b!1141725 m!1053551))

(declare-fun m!1053553 () Bool)

(assert (=> b!1141725 m!1053553))

(declare-fun m!1053555 () Bool)

(assert (=> b!1141725 m!1053555))

(assert (=> b!1141725 m!1053553))

(declare-fun m!1053557 () Bool)

(assert (=> b!1141725 m!1053557))

(declare-fun m!1053559 () Bool)

(assert (=> b!1141725 m!1053559))

(declare-fun m!1053561 () Bool)

(assert (=> b!1141725 m!1053561))

(assert (=> b!1141725 m!1053559))

(assert (=> b!1141725 m!1053555))

(assert (=> b!1141725 m!1053559))

(declare-fun m!1053563 () Bool)

(assert (=> b!1141725 m!1053563))

(declare-fun m!1053565 () Bool)

(assert (=> b!1141725 m!1053565))

(declare-fun m!1053567 () Bool)

(assert (=> b!1141737 m!1053567))

(declare-fun m!1053569 () Bool)

(assert (=> bm!50985 m!1053569))

(declare-fun m!1053571 () Bool)

(assert (=> bm!50988 m!1053571))

(assert (=> bm!50987 m!1053551))

(declare-fun m!1053573 () Bool)

(assert (=> b!1141730 m!1053573))

(declare-fun m!1053575 () Bool)

(assert (=> b!1141715 m!1053575))

(declare-fun m!1053577 () Bool)

(assert (=> b!1141727 m!1053577))

(declare-fun m!1053579 () Bool)

(assert (=> b!1141719 m!1053579))

(declare-fun m!1053581 () Bool)

(assert (=> b!1141719 m!1053581))

(declare-fun m!1053583 () Bool)

(assert (=> b!1141719 m!1053583))

(declare-fun m!1053585 () Bool)

(assert (=> b!1141719 m!1053585))

(assert (=> b!1141723 m!1053559))

(declare-fun m!1053587 () Bool)

(assert (=> b!1141723 m!1053587))

(declare-fun m!1053589 () Bool)

(assert (=> b!1141724 m!1053589))

(declare-fun m!1053591 () Bool)

(assert (=> b!1141724 m!1053591))

(check-sat (not start!98746) (not b!1141741) (not b!1141730) (not b!1141729) b_and!39083 (not b!1141725) tp_is_empty!28645 (not bm!50986) (not b!1141716) (not bm!50985) (not bm!50988) (not bm!50990) (not b_lambda!19215) (not b!1141734) (not b!1141723) (not b!1141715) (not b_next!24115) (not b!1141721) (not b!1141737) (not b!1141718) (not b!1141719) (not b!1141742) (not b!1141724) (not bm!50987) (not mapNonEmpty!44792) (not b!1141727))
(check-sat b_and!39083 (not b_next!24115))
