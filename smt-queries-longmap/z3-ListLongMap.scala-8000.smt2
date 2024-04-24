; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99076 () Bool)

(assert start!99076)

(declare-fun b_free!24445 () Bool)

(declare-fun b_next!24445 () Bool)

(assert (=> start!99076 (= b_free!24445 (not b_next!24445))))

(declare-fun tp!86045 () Bool)

(declare-fun b_and!39741 () Bool)

(assert (=> start!99076 (= tp!86045 b_and!39741)))

(declare-fun b!1156771 () Bool)

(declare-datatypes ((Unit!38027 0))(
  ( (Unit!38028) )
))
(declare-fun e!657976 () Unit!38027)

(declare-fun e!657971 () Unit!38027)

(assert (=> b!1156771 (= e!657976 e!657971)))

(declare-fun c!115262 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!518906 () Bool)

(assert (=> b!1156771 (= c!115262 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518906))))

(declare-fun b!1156772 () Bool)

(declare-fun res!768197 () Bool)

(declare-fun e!657966 () Bool)

(assert (=> b!1156772 (=> (not res!768197) (not e!657966))))

(declare-datatypes ((array!74841 0))(
  ( (array!74842 (arr!36065 (Array (_ BitVec 32) (_ BitVec 64))) (size!36602 (_ BitVec 32))) )
))
(declare-fun lt!518920 () array!74841)

(declare-datatypes ((List!25258 0))(
  ( (Nil!25255) (Cons!25254 (h!26472 (_ BitVec 64)) (t!36687 List!25258)) )
))
(declare-fun arrayNoDuplicates!0 (array!74841 (_ BitVec 32) List!25258) Bool)

(assert (=> b!1156772 (= res!768197 (arrayNoDuplicates!0 lt!518920 #b00000000000000000000000000000000 Nil!25255))))

(declare-fun bm!54944 () Bool)

(declare-fun call!54953 () Unit!38027)

(declare-fun call!54951 () Unit!38027)

(assert (=> bm!54944 (= call!54953 call!54951)))

(declare-fun b!1156773 () Bool)

(declare-fun e!657965 () Bool)

(assert (=> b!1156773 (= e!657966 (not e!657965))))

(declare-fun res!768190 () Bool)

(assert (=> b!1156773 (=> res!768190 e!657965)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1156773 (= res!768190 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!74841)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1156773 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518913 () Unit!38027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74841 (_ BitVec 64) (_ BitVec 32)) Unit!38027)

(assert (=> b!1156773 (= lt!518913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1156774 () Bool)

(declare-fun e!657967 () Bool)

(declare-fun e!657968 () Bool)

(declare-fun mapRes!45287 () Bool)

(assert (=> b!1156774 (= e!657967 (and e!657968 mapRes!45287))))

(declare-fun condMapEmpty!45287 () Bool)

(declare-datatypes ((V!43761 0))(
  ( (V!43762 (val!14544 Int)) )
))
(declare-datatypes ((ValueCell!13778 0))(
  ( (ValueCellFull!13778 (v!17177 V!43761)) (EmptyCell!13778) )
))
(declare-datatypes ((array!74843 0))(
  ( (array!74844 (arr!36066 (Array (_ BitVec 32) ValueCell!13778)) (size!36603 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74843)

(declare-fun mapDefault!45287 () ValueCell!13778)

(assert (=> b!1156774 (= condMapEmpty!45287 (= (arr!36066 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13778)) mapDefault!45287)))))

(declare-fun bm!54945 () Bool)

(declare-datatypes ((tuple2!18514 0))(
  ( (tuple2!18515 (_1!9268 (_ BitVec 64)) (_2!9268 V!43761)) )
))
(declare-datatypes ((List!25259 0))(
  ( (Nil!25256) (Cons!25255 (h!26473 tuple2!18514) (t!36688 List!25259)) )
))
(declare-datatypes ((ListLongMap!16491 0))(
  ( (ListLongMap!16492 (toList!8261 List!25259)) )
))
(declare-fun lt!518922 () ListLongMap!16491)

(declare-fun call!54952 () Bool)

(declare-fun call!54947 () ListLongMap!16491)

(declare-fun c!115263 () Bool)

(declare-fun contains!6786 (ListLongMap!16491 (_ BitVec 64)) Bool)

(assert (=> bm!54945 (= call!54952 (contains!6786 (ite c!115263 lt!518922 call!54947) k0!934))))

(declare-fun b!1156775 () Bool)

(declare-fun res!768194 () Bool)

(declare-fun e!657972 () Bool)

(assert (=> b!1156775 (=> (not res!768194) (not e!657972))))

(assert (=> b!1156775 (= res!768194 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36602 _keys!1208))))))

(declare-fun zeroValue!944 () V!43761)

(declare-fun call!54950 () ListLongMap!16491)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43761)

(declare-fun bm!54946 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4755 (array!74841 array!74843 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 32) Int) ListLongMap!16491)

(assert (=> bm!54946 (= call!54950 (getCurrentListMapNoExtraKeys!4755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!657964 () Bool)

(declare-fun b!1156777 () Bool)

(declare-fun call!54949 () ListLongMap!16491)

(declare-fun -!1366 (ListLongMap!16491 (_ BitVec 64)) ListLongMap!16491)

(assert (=> b!1156777 (= e!657964 (= call!54949 (-!1366 call!54950 k0!934)))))

(declare-fun b!1156778 () Bool)

(declare-fun res!768189 () Bool)

(assert (=> b!1156778 (=> (not res!768189) (not e!657972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1156778 (= res!768189 (validMask!0 mask!1564))))

(declare-fun b!1156779 () Bool)

(declare-fun res!768187 () Bool)

(assert (=> b!1156779 (=> (not res!768187) (not e!657972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74841 (_ BitVec 32)) Bool)

(assert (=> b!1156779 (= res!768187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1156780 () Bool)

(declare-fun tp_is_empty!28975 () Bool)

(assert (=> b!1156780 (= e!657968 tp_is_empty!28975)))

(declare-fun b!1156781 () Bool)

(declare-fun e!657973 () Bool)

(assert (=> b!1156781 (= e!657973 tp_is_empty!28975)))

(declare-fun b!1156782 () Bool)

(declare-fun call!54948 () Bool)

(assert (=> b!1156782 call!54948))

(declare-fun lt!518915 () Unit!38027)

(assert (=> b!1156782 (= lt!518915 call!54953)))

(assert (=> b!1156782 (= e!657971 lt!518915)))

(declare-fun lt!518921 () array!74843)

(declare-fun bm!54947 () Bool)

(assert (=> bm!54947 (= call!54949 (getCurrentListMapNoExtraKeys!4755 lt!518920 lt!518921 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156783 () Bool)

(declare-fun e!657970 () Bool)

(declare-fun e!657975 () Bool)

(assert (=> b!1156783 (= e!657970 e!657975)))

(declare-fun res!768198 () Bool)

(assert (=> b!1156783 (=> res!768198 e!657975)))

(assert (=> b!1156783 (= res!768198 (not (= (select (arr!36065 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1156783 e!657964))

(declare-fun c!115261 () Bool)

(assert (=> b!1156783 (= c!115261 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!518907 () Unit!38027)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!607 (array!74841 array!74843 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38027)

(assert (=> b!1156783 (= lt!518907 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54948 () Bool)

(assert (=> bm!54948 (= call!54948 call!54952)))

(declare-fun b!1156784 () Bool)

(declare-fun c!115264 () Bool)

(assert (=> b!1156784 (= c!115264 (and (not lt!518906) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657974 () Unit!38027)

(assert (=> b!1156784 (= e!657974 e!657976)))

(declare-fun b!1156785 () Bool)

(assert (=> b!1156785 (= e!657965 e!657970)))

(declare-fun res!768196 () Bool)

(assert (=> b!1156785 (=> res!768196 e!657970)))

(assert (=> b!1156785 (= res!768196 (not (= from!1455 i!673)))))

(declare-fun lt!518916 () ListLongMap!16491)

(assert (=> b!1156785 (= lt!518916 (getCurrentListMapNoExtraKeys!4755 lt!518920 lt!518921 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518902 () V!43761)

(assert (=> b!1156785 (= lt!518921 (array!74844 (store (arr!36066 _values!996) i!673 (ValueCellFull!13778 lt!518902)) (size!36603 _values!996)))))

(declare-fun dynLambda!2769 (Int (_ BitVec 64)) V!43761)

(assert (=> b!1156785 (= lt!518902 (dynLambda!2769 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518918 () ListLongMap!16491)

(assert (=> b!1156785 (= lt!518918 (getCurrentListMapNoExtraKeys!4755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!657979 () Bool)

(declare-fun b!1156786 () Bool)

(assert (=> b!1156786 (= e!657979 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54949 () Bool)

(declare-fun call!54954 () ListLongMap!16491)

(assert (=> bm!54949 (= call!54947 call!54954)))

(declare-fun mapIsEmpty!45287 () Bool)

(assert (=> mapIsEmpty!45287 mapRes!45287))

(declare-fun b!1156787 () Bool)

(declare-fun lt!518910 () Unit!38027)

(assert (=> b!1156787 (= e!657976 lt!518910)))

(assert (=> b!1156787 (= lt!518910 call!54953)))

(assert (=> b!1156787 call!54948))

(declare-fun b!1156788 () Bool)

(declare-fun e!657977 () Bool)

(declare-fun lt!518905 () ListLongMap!16491)

(assert (=> b!1156788 (= e!657977 (= lt!518905 (getCurrentListMapNoExtraKeys!4755 lt!518920 lt!518921 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1156789 () Bool)

(declare-fun res!768199 () Bool)

(assert (=> b!1156789 (=> (not res!768199) (not e!657972))))

(assert (=> b!1156789 (= res!768199 (and (= (size!36603 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36602 _keys!1208) (size!36603 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!518911 () ListLongMap!16491)

(declare-fun bm!54950 () Bool)

(declare-fun +!3686 (ListLongMap!16491 tuple2!18514) ListLongMap!16491)

(assert (=> bm!54950 (= call!54954 (+!3686 lt!518911 (ite (or c!115263 c!115264) (tuple2!18515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1156790 () Bool)

(assert (=> b!1156790 (contains!6786 (+!3686 lt!518922 (tuple2!18515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!518914 () Unit!38027)

(declare-fun addStillContains!908 (ListLongMap!16491 (_ BitVec 64) V!43761 (_ BitVec 64)) Unit!38027)

(assert (=> b!1156790 (= lt!518914 (addStillContains!908 lt!518922 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1156790 call!54952))

(assert (=> b!1156790 (= lt!518922 call!54954)))

(declare-fun lt!518909 () Unit!38027)

(assert (=> b!1156790 (= lt!518909 call!54951)))

(assert (=> b!1156790 (= e!657974 lt!518914)))

(declare-fun b!1156776 () Bool)

(declare-fun res!768200 () Bool)

(assert (=> b!1156776 (=> (not res!768200) (not e!657972))))

(assert (=> b!1156776 (= res!768200 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25255))))

(declare-fun res!768191 () Bool)

(assert (=> start!99076 (=> (not res!768191) (not e!657972))))

(assert (=> start!99076 (= res!768191 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36602 _keys!1208))))))

(assert (=> start!99076 e!657972))

(assert (=> start!99076 tp_is_empty!28975))

(declare-fun array_inv!27660 (array!74841) Bool)

(assert (=> start!99076 (array_inv!27660 _keys!1208)))

(assert (=> start!99076 true))

(assert (=> start!99076 tp!86045))

(declare-fun array_inv!27661 (array!74843) Bool)

(assert (=> start!99076 (and (array_inv!27661 _values!996) e!657967)))

(declare-fun b!1156791 () Bool)

(declare-fun e!657969 () Unit!38027)

(declare-fun Unit!38029 () Unit!38027)

(assert (=> b!1156791 (= e!657969 Unit!38029)))

(declare-fun b!1156792 () Bool)

(declare-fun e!657978 () Bool)

(assert (=> b!1156792 (= e!657978 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1156793 () Bool)

(assert (=> b!1156793 (= e!657972 e!657966)))

(declare-fun res!768193 () Bool)

(assert (=> b!1156793 (=> (not res!768193) (not e!657966))))

(assert (=> b!1156793 (= res!768193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518920 mask!1564))))

(assert (=> b!1156793 (= lt!518920 (array!74842 (store (arr!36065 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36602 _keys!1208)))))

(declare-fun b!1156794 () Bool)

(assert (=> b!1156794 (= e!657975 true)))

(assert (=> b!1156794 e!657977))

(declare-fun res!768188 () Bool)

(assert (=> b!1156794 (=> (not res!768188) (not e!657977))))

(assert (=> b!1156794 (= res!768188 (= lt!518905 lt!518911))))

(assert (=> b!1156794 (= lt!518905 (-!1366 lt!518918 k0!934))))

(declare-fun lt!518917 () V!43761)

(assert (=> b!1156794 (= (-!1366 (+!3686 lt!518911 (tuple2!18515 (select (arr!36065 _keys!1208) from!1455) lt!518917)) (select (arr!36065 _keys!1208) from!1455)) lt!518911)))

(declare-fun lt!518923 () Unit!38027)

(declare-fun addThenRemoveForNewKeyIsSame!206 (ListLongMap!16491 (_ BitVec 64) V!43761) Unit!38027)

(assert (=> b!1156794 (= lt!518923 (addThenRemoveForNewKeyIsSame!206 lt!518911 (select (arr!36065 _keys!1208) from!1455) lt!518917))))

(declare-fun get!18399 (ValueCell!13778 V!43761) V!43761)

(assert (=> b!1156794 (= lt!518917 (get!18399 (select (arr!36066 _values!996) from!1455) lt!518902))))

(declare-fun lt!518904 () Unit!38027)

(assert (=> b!1156794 (= lt!518904 e!657969)))

(declare-fun c!115265 () Bool)

(assert (=> b!1156794 (= c!115265 (contains!6786 lt!518911 k0!934))))

(assert (=> b!1156794 (= lt!518911 (getCurrentListMapNoExtraKeys!4755 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1156795 () Bool)

(declare-fun Unit!38030 () Unit!38027)

(assert (=> b!1156795 (= e!657969 Unit!38030)))

(assert (=> b!1156795 (= lt!518906 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1156795 (= c!115263 (and (not lt!518906) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518908 () Unit!38027)

(assert (=> b!1156795 (= lt!518908 e!657974)))

(declare-fun lt!518903 () Unit!38027)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!500 (array!74841 array!74843 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 64) (_ BitVec 32) Int) Unit!38027)

(assert (=> b!1156795 (= lt!518903 (lemmaListMapContainsThenArrayContainsFrom!500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115266 () Bool)

(assert (=> b!1156795 (= c!115266 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!768195 () Bool)

(assert (=> b!1156795 (= res!768195 e!657978)))

(assert (=> b!1156795 (=> (not res!768195) (not e!657979))))

(assert (=> b!1156795 e!657979))

(declare-fun lt!518912 () Unit!38027)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74841 (_ BitVec 32) (_ BitVec 32)) Unit!38027)

(assert (=> b!1156795 (= lt!518912 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1156795 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25255)))

(declare-fun lt!518919 () Unit!38027)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74841 (_ BitVec 64) (_ BitVec 32) List!25258) Unit!38027)

(assert (=> b!1156795 (= lt!518919 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25255))))

(assert (=> b!1156795 false))

(declare-fun b!1156796 () Bool)

(assert (=> b!1156796 (= e!657978 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518906) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1156797 () Bool)

(assert (=> b!1156797 (= e!657964 (= call!54949 call!54950))))

(declare-fun mapNonEmpty!45287 () Bool)

(declare-fun tp!86046 () Bool)

(assert (=> mapNonEmpty!45287 (= mapRes!45287 (and tp!86046 e!657973))))

(declare-fun mapValue!45287 () ValueCell!13778)

(declare-fun mapRest!45287 () (Array (_ BitVec 32) ValueCell!13778))

(declare-fun mapKey!45287 () (_ BitVec 32))

(assert (=> mapNonEmpty!45287 (= (arr!36066 _values!996) (store mapRest!45287 mapKey!45287 mapValue!45287))))

(declare-fun b!1156798 () Bool)

(declare-fun res!768192 () Bool)

(assert (=> b!1156798 (=> (not res!768192) (not e!657972))))

(assert (=> b!1156798 (= res!768192 (= (select (arr!36065 _keys!1208) i!673) k0!934))))

(declare-fun bm!54951 () Bool)

(assert (=> bm!54951 (= call!54951 (addStillContains!908 lt!518911 (ite (or c!115263 c!115264) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115263 c!115264) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1156799 () Bool)

(declare-fun res!768201 () Bool)

(assert (=> b!1156799 (=> (not res!768201) (not e!657972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1156799 (= res!768201 (validKeyInArray!0 k0!934))))

(declare-fun b!1156800 () Bool)

(declare-fun Unit!38031 () Unit!38027)

(assert (=> b!1156800 (= e!657971 Unit!38031)))

(assert (= (and start!99076 res!768191) b!1156778))

(assert (= (and b!1156778 res!768189) b!1156789))

(assert (= (and b!1156789 res!768199) b!1156779))

(assert (= (and b!1156779 res!768187) b!1156776))

(assert (= (and b!1156776 res!768200) b!1156775))

(assert (= (and b!1156775 res!768194) b!1156799))

(assert (= (and b!1156799 res!768201) b!1156798))

(assert (= (and b!1156798 res!768192) b!1156793))

(assert (= (and b!1156793 res!768193) b!1156772))

(assert (= (and b!1156772 res!768197) b!1156773))

(assert (= (and b!1156773 (not res!768190)) b!1156785))

(assert (= (and b!1156785 (not res!768196)) b!1156783))

(assert (= (and b!1156783 c!115261) b!1156777))

(assert (= (and b!1156783 (not c!115261)) b!1156797))

(assert (= (or b!1156777 b!1156797) bm!54947))

(assert (= (or b!1156777 b!1156797) bm!54946))

(assert (= (and b!1156783 (not res!768198)) b!1156794))

(assert (= (and b!1156794 c!115265) b!1156795))

(assert (= (and b!1156794 (not c!115265)) b!1156791))

(assert (= (and b!1156795 c!115263) b!1156790))

(assert (= (and b!1156795 (not c!115263)) b!1156784))

(assert (= (and b!1156784 c!115264) b!1156787))

(assert (= (and b!1156784 (not c!115264)) b!1156771))

(assert (= (and b!1156771 c!115262) b!1156782))

(assert (= (and b!1156771 (not c!115262)) b!1156800))

(assert (= (or b!1156787 b!1156782) bm!54944))

(assert (= (or b!1156787 b!1156782) bm!54949))

(assert (= (or b!1156787 b!1156782) bm!54948))

(assert (= (or b!1156790 bm!54948) bm!54945))

(assert (= (or b!1156790 bm!54944) bm!54951))

(assert (= (or b!1156790 bm!54949) bm!54950))

(assert (= (and b!1156795 c!115266) b!1156792))

(assert (= (and b!1156795 (not c!115266)) b!1156796))

(assert (= (and b!1156795 res!768195) b!1156786))

(assert (= (and b!1156794 res!768188) b!1156788))

(assert (= (and b!1156774 condMapEmpty!45287) mapIsEmpty!45287))

(assert (= (and b!1156774 (not condMapEmpty!45287)) mapNonEmpty!45287))

(get-info :version)

(assert (= (and mapNonEmpty!45287 ((_ is ValueCellFull!13778) mapValue!45287)) b!1156781))

(assert (= (and b!1156774 ((_ is ValueCellFull!13778) mapDefault!45287)) b!1156780))

(assert (= start!99076 b!1156774))

(declare-fun b_lambda!19545 () Bool)

(assert (=> (not b_lambda!19545) (not b!1156785)))

(declare-fun t!36686 () Bool)

(declare-fun tb!9249 () Bool)

(assert (=> (and start!99076 (= defaultEntry!1004 defaultEntry!1004) t!36686) tb!9249))

(declare-fun result!19071 () Bool)

(assert (=> tb!9249 (= result!19071 tp_is_empty!28975)))

(assert (=> b!1156785 t!36686))

(declare-fun b_and!39743 () Bool)

(assert (= b_and!39741 (and (=> t!36686 result!19071) b_and!39743)))

(declare-fun m!1066637 () Bool)

(assert (=> b!1156783 m!1066637))

(declare-fun m!1066639 () Bool)

(assert (=> b!1156783 m!1066639))

(declare-fun m!1066641 () Bool)

(assert (=> b!1156773 m!1066641))

(declare-fun m!1066643 () Bool)

(assert (=> b!1156773 m!1066643))

(declare-fun m!1066645 () Bool)

(assert (=> b!1156777 m!1066645))

(declare-fun m!1066647 () Bool)

(assert (=> start!99076 m!1066647))

(declare-fun m!1066649 () Bool)

(assert (=> start!99076 m!1066649))

(declare-fun m!1066651 () Bool)

(assert (=> b!1156776 m!1066651))

(declare-fun m!1066653 () Bool)

(assert (=> b!1156790 m!1066653))

(assert (=> b!1156790 m!1066653))

(declare-fun m!1066655 () Bool)

(assert (=> b!1156790 m!1066655))

(declare-fun m!1066657 () Bool)

(assert (=> b!1156790 m!1066657))

(declare-fun m!1066659 () Bool)

(assert (=> bm!54951 m!1066659))

(declare-fun m!1066661 () Bool)

(assert (=> b!1156779 m!1066661))

(declare-fun m!1066663 () Bool)

(assert (=> b!1156793 m!1066663))

(declare-fun m!1066665 () Bool)

(assert (=> b!1156793 m!1066665))

(declare-fun m!1066667 () Bool)

(assert (=> b!1156778 m!1066667))

(declare-fun m!1066669 () Bool)

(assert (=> bm!54945 m!1066669))

(declare-fun m!1066671 () Bool)

(assert (=> b!1156772 m!1066671))

(declare-fun m!1066673 () Bool)

(assert (=> b!1156795 m!1066673))

(declare-fun m!1066675 () Bool)

(assert (=> b!1156795 m!1066675))

(declare-fun m!1066677 () Bool)

(assert (=> b!1156795 m!1066677))

(declare-fun m!1066679 () Bool)

(assert (=> b!1156795 m!1066679))

(declare-fun m!1066681 () Bool)

(assert (=> b!1156788 m!1066681))

(declare-fun m!1066683 () Bool)

(assert (=> mapNonEmpty!45287 m!1066683))

(declare-fun m!1066685 () Bool)

(assert (=> b!1156794 m!1066685))

(declare-fun m!1066687 () Bool)

(assert (=> b!1156794 m!1066687))

(declare-fun m!1066689 () Bool)

(assert (=> b!1156794 m!1066689))

(declare-fun m!1066691 () Bool)

(assert (=> b!1156794 m!1066691))

(assert (=> b!1156794 m!1066687))

(assert (=> b!1156794 m!1066637))

(declare-fun m!1066693 () Bool)

(assert (=> b!1156794 m!1066693))

(assert (=> b!1156794 m!1066637))

(declare-fun m!1066695 () Bool)

(assert (=> b!1156794 m!1066695))

(declare-fun m!1066697 () Bool)

(assert (=> b!1156794 m!1066697))

(assert (=> b!1156794 m!1066637))

(assert (=> b!1156794 m!1066691))

(declare-fun m!1066699 () Bool)

(assert (=> b!1156794 m!1066699))

(assert (=> bm!54946 m!1066685))

(declare-fun m!1066701 () Bool)

(assert (=> b!1156786 m!1066701))

(assert (=> b!1156792 m!1066701))

(declare-fun m!1066703 () Bool)

(assert (=> bm!54950 m!1066703))

(declare-fun m!1066705 () Bool)

(assert (=> b!1156798 m!1066705))

(assert (=> bm!54947 m!1066681))

(declare-fun m!1066707 () Bool)

(assert (=> b!1156785 m!1066707))

(declare-fun m!1066709 () Bool)

(assert (=> b!1156785 m!1066709))

(declare-fun m!1066711 () Bool)

(assert (=> b!1156785 m!1066711))

(declare-fun m!1066713 () Bool)

(assert (=> b!1156785 m!1066713))

(declare-fun m!1066715 () Bool)

(assert (=> b!1156799 m!1066715))

(check-sat (not start!99076) (not b_next!24445) (not bm!54945) tp_is_empty!28975 (not bm!54946) (not b!1156795) (not b!1156776) (not b!1156773) (not b!1156794) (not b!1156785) (not bm!54950) (not mapNonEmpty!45287) (not b!1156772) b_and!39743 (not bm!54951) (not bm!54947) (not b!1156799) (not b!1156786) (not b!1156793) (not b!1156777) (not b!1156792) (not b!1156790) (not b!1156779) (not b!1156778) (not b!1156788) (not b_lambda!19545) (not b!1156783))
(check-sat b_and!39743 (not b_next!24445))
