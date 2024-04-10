; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101070 () Bool)

(assert start!101070)

(declare-fun b_free!26031 () Bool)

(declare-fun b_next!26031 () Bool)

(assert (=> start!101070 (= b_free!26031 (not b_next!26031))))

(declare-fun tp!91111 () Bool)

(declare-fun b_and!43161 () Bool)

(assert (=> start!101070 (= tp!91111 b_and!43161)))

(declare-datatypes ((V!46107 0))(
  ( (V!46108 (val!15424 Int)) )
))
(declare-fun zeroValue!944 () V!46107)

(declare-datatypes ((array!78257 0))(
  ( (array!78258 (arr!37764 (Array (_ BitVec 32) (_ BitVec 64))) (size!38300 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78257)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!19812 0))(
  ( (tuple2!19813 (_1!9917 (_ BitVec 64)) (_2!9917 V!46107)) )
))
(declare-datatypes ((List!26613 0))(
  ( (Nil!26610) (Cons!26609 (h!27818 tuple2!19812) (t!39624 List!26613)) )
))
(declare-datatypes ((ListLongMap!17781 0))(
  ( (ListLongMap!17782 (toList!8906 List!26613)) )
))
(declare-fun call!59840 () ListLongMap!17781)

(declare-datatypes ((ValueCell!14658 0))(
  ( (ValueCellFull!14658 (v!18076 V!46107)) (EmptyCell!14658) )
))
(declare-datatypes ((array!78259 0))(
  ( (array!78260 (arr!37765 (Array (_ BitVec 32) ValueCell!14658)) (size!38301 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78259)

(declare-fun bm!59831 () Bool)

(declare-fun minValue!944 () V!46107)

(declare-fun getCurrentListMapNoExtraKeys!5338 (array!78257 array!78259 (_ BitVec 32) (_ BitVec 32) V!46107 V!46107 (_ BitVec 32) Int) ListLongMap!17781)

(assert (=> bm!59831 (= call!59840 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211285 () Bool)

(declare-fun e!687927 () Bool)

(declare-fun e!687924 () Bool)

(assert (=> b!1211285 (= e!687927 e!687924)))

(declare-fun res!804714 () Bool)

(assert (=> b!1211285 (=> res!804714 e!687924)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1211285 (= res!804714 (not (= from!1455 i!673)))))

(declare-fun lt!550142 () array!78257)

(declare-fun lt!550137 () array!78259)

(declare-fun lt!550138 () ListLongMap!17781)

(assert (=> b!1211285 (= lt!550138 (getCurrentListMapNoExtraKeys!5338 lt!550142 lt!550137 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!550148 () V!46107)

(assert (=> b!1211285 (= lt!550137 (array!78260 (store (arr!37765 _values!996) i!673 (ValueCellFull!14658 lt!550148)) (size!38301 _values!996)))))

(declare-fun dynLambda!3234 (Int (_ BitVec 64)) V!46107)

(assert (=> b!1211285 (= lt!550148 (dynLambda!3234 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!550149 () ListLongMap!17781)

(assert (=> b!1211285 (= lt!550149 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!47974 () Bool)

(declare-fun mapRes!47974 () Bool)

(assert (=> mapIsEmpty!47974 mapRes!47974))

(declare-fun lt!550152 () ListLongMap!17781)

(declare-fun lt!550151 () ListLongMap!17781)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun c!119440 () Bool)

(declare-datatypes ((Unit!40161 0))(
  ( (Unit!40162) )
))
(declare-fun call!59841 () Unit!40161)

(declare-fun bm!59832 () Bool)

(declare-fun c!119439 () Bool)

(declare-fun addStillContains!1052 (ListLongMap!17781 (_ BitVec 64) V!46107 (_ BitVec 64)) Unit!40161)

(assert (=> bm!59832 (= call!59841 (addStillContains!1052 (ite c!119440 lt!550151 lt!550152) (ite c!119440 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!119439 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!119440 minValue!944 (ite c!119439 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1211286 () Bool)

(declare-fun e!687919 () Bool)

(declare-fun tp_is_empty!30735 () Bool)

(assert (=> b!1211286 (= e!687919 tp_is_empty!30735)))

(declare-fun b!1211287 () Bool)

(declare-fun e!687917 () Bool)

(declare-fun call!59835 () ListLongMap!17781)

(assert (=> b!1211287 (= e!687917 (= call!59835 call!59840))))

(declare-fun b!1211288 () Bool)

(declare-fun e!687913 () Unit!40161)

(declare-fun Unit!40163 () Unit!40161)

(assert (=> b!1211288 (= e!687913 Unit!40163)))

(declare-fun b!1211289 () Bool)

(declare-fun e!687923 () Bool)

(assert (=> b!1211289 (= e!687924 e!687923)))

(declare-fun res!804705 () Bool)

(assert (=> b!1211289 (=> res!804705 e!687923)))

(assert (=> b!1211289 (= res!804705 (not (= (select (arr!37764 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1211289 e!687917))

(declare-fun c!119443 () Bool)

(assert (=> b!1211289 (= c!119443 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!550153 () Unit!40161)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1065 (array!78257 array!78259 (_ BitVec 32) (_ BitVec 32) V!46107 V!46107 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40161)

(assert (=> b!1211289 (= lt!550153 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!687921 () Bool)

(declare-fun b!1211290 () Bool)

(declare-fun lt!550140 () Bool)

(assert (=> b!1211290 (= e!687921 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!550140) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!47974 () Bool)

(declare-fun tp!91112 () Bool)

(declare-fun e!687912 () Bool)

(assert (=> mapNonEmpty!47974 (= mapRes!47974 (and tp!91112 e!687912))))

(declare-fun mapKey!47974 () (_ BitVec 32))

(declare-fun mapRest!47974 () (Array (_ BitVec 32) ValueCell!14658))

(declare-fun mapValue!47974 () ValueCell!14658)

(assert (=> mapNonEmpty!47974 (= (arr!37765 _values!996) (store mapRest!47974 mapKey!47974 mapValue!47974))))

(declare-fun b!1211291 () Bool)

(declare-fun res!804708 () Bool)

(declare-fun e!687925 () Bool)

(assert (=> b!1211291 (=> (not res!804708) (not e!687925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78257 (_ BitVec 32)) Bool)

(assert (=> b!1211291 (= res!804708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59833 () Bool)

(assert (=> bm!59833 (= call!59835 (getCurrentListMapNoExtraKeys!5338 lt!550142 lt!550137 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1211292 () Bool)

(assert (=> b!1211292 (= e!687912 tp_is_empty!30735)))

(declare-fun b!1211293 () Bool)

(assert (=> b!1211293 (= e!687923 true)))

(declare-fun e!687911 () Bool)

(assert (=> b!1211293 e!687911))

(declare-fun res!804701 () Bool)

(assert (=> b!1211293 (=> (not res!804701) (not e!687911))))

(declare-fun lt!550156 () V!46107)

(declare-fun -!1855 (ListLongMap!17781 (_ BitVec 64)) ListLongMap!17781)

(declare-fun +!4024 (ListLongMap!17781 tuple2!19812) ListLongMap!17781)

(assert (=> b!1211293 (= res!804701 (= (-!1855 (+!4024 lt!550152 (tuple2!19813 (select (arr!37764 _keys!1208) from!1455) lt!550156)) (select (arr!37764 _keys!1208) from!1455)) lt!550152))))

(declare-fun lt!550139 () Unit!40161)

(declare-fun addThenRemoveForNewKeyIsSame!273 (ListLongMap!17781 (_ BitVec 64) V!46107) Unit!40161)

(assert (=> b!1211293 (= lt!550139 (addThenRemoveForNewKeyIsSame!273 lt!550152 (select (arr!37764 _keys!1208) from!1455) lt!550156))))

(declare-fun get!19244 (ValueCell!14658 V!46107) V!46107)

(assert (=> b!1211293 (= lt!550156 (get!19244 (select (arr!37765 _values!996) from!1455) lt!550148))))

(declare-fun lt!550146 () Unit!40161)

(declare-fun e!687915 () Unit!40161)

(assert (=> b!1211293 (= lt!550146 e!687915)))

(declare-fun c!119441 () Bool)

(declare-fun contains!6979 (ListLongMap!17781 (_ BitVec 64)) Bool)

(assert (=> b!1211293 (= c!119441 (contains!6979 lt!550152 k0!934))))

(assert (=> b!1211293 (= lt!550152 (getCurrentListMapNoExtraKeys!5338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!687916 () Bool)

(declare-fun b!1211294 () Bool)

(declare-fun arrayContainsKey!0 (array!78257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1211294 (= e!687916 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211295 () Bool)

(declare-fun res!804702 () Bool)

(declare-fun e!687920 () Bool)

(assert (=> b!1211295 (=> (not res!804702) (not e!687920))))

(declare-datatypes ((List!26614 0))(
  ( (Nil!26611) (Cons!26610 (h!27819 (_ BitVec 64)) (t!39625 List!26614)) )
))
(declare-fun arrayNoDuplicates!0 (array!78257 (_ BitVec 32) List!26614) Bool)

(assert (=> b!1211295 (= res!804702 (arrayNoDuplicates!0 lt!550142 #b00000000000000000000000000000000 Nil!26611))))

(declare-fun b!1211296 () Bool)

(assert (=> b!1211296 (= e!687911 (= (-!1855 lt!550149 k0!934) lt!550152))))

(declare-fun b!1211297 () Bool)

(declare-fun call!59839 () Bool)

(assert (=> b!1211297 call!59839))

(declare-fun lt!550143 () Unit!40161)

(declare-fun call!59838 () Unit!40161)

(assert (=> b!1211297 (= lt!550143 call!59838)))

(assert (=> b!1211297 (= e!687913 lt!550143)))

(declare-fun bm!59834 () Bool)

(declare-fun call!59834 () ListLongMap!17781)

(assert (=> bm!59834 (= call!59834 (+!4024 lt!550152 (ite (or c!119440 c!119439) (tuple2!19813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1211298 () Bool)

(declare-fun res!804704 () Bool)

(assert (=> b!1211298 (=> (not res!804704) (not e!687925))))

(assert (=> b!1211298 (= res!804704 (= (select (arr!37764 _keys!1208) i!673) k0!934))))

(declare-fun res!804713 () Bool)

(assert (=> start!101070 (=> (not res!804713) (not e!687925))))

(assert (=> start!101070 (= res!804713 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38300 _keys!1208))))))

(assert (=> start!101070 e!687925))

(assert (=> start!101070 tp_is_empty!30735))

(declare-fun array_inv!28766 (array!78257) Bool)

(assert (=> start!101070 (array_inv!28766 _keys!1208)))

(assert (=> start!101070 true))

(assert (=> start!101070 tp!91111))

(declare-fun e!687914 () Bool)

(declare-fun array_inv!28767 (array!78259) Bool)

(assert (=> start!101070 (and (array_inv!28767 _values!996) e!687914)))

(declare-fun b!1211299 () Bool)

(declare-fun res!804710 () Bool)

(assert (=> b!1211299 (=> (not res!804710) (not e!687925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1211299 (= res!804710 (validMask!0 mask!1564))))

(declare-fun b!1211300 () Bool)

(assert (=> b!1211300 (= e!687920 (not e!687927))))

(declare-fun res!804703 () Bool)

(assert (=> b!1211300 (=> res!804703 e!687927)))

(assert (=> b!1211300 (= res!804703 (bvsgt from!1455 i!673))))

(assert (=> b!1211300 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!550155 () Unit!40161)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78257 (_ BitVec 64) (_ BitVec 32)) Unit!40161)

(assert (=> b!1211300 (= lt!550155 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!59835 () Bool)

(assert (=> bm!59835 (= call!59838 call!59841)))

(declare-fun bm!59836 () Bool)

(declare-fun call!59836 () ListLongMap!17781)

(assert (=> bm!59836 (= call!59836 call!59834)))

(declare-fun b!1211301 () Bool)

(assert (=> b!1211301 (= c!119439 (and (not lt!550140) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!687922 () Unit!40161)

(declare-fun e!687926 () Unit!40161)

(assert (=> b!1211301 (= e!687922 e!687926)))

(declare-fun b!1211302 () Bool)

(declare-fun res!804706 () Bool)

(assert (=> b!1211302 (=> (not res!804706) (not e!687925))))

(assert (=> b!1211302 (= res!804706 (and (= (size!38301 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38300 _keys!1208) (size!38301 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1211303 () Bool)

(declare-fun Unit!40164 () Unit!40161)

(assert (=> b!1211303 (= e!687915 Unit!40164)))

(declare-fun call!59837 () Bool)

(declare-fun bm!59837 () Bool)

(assert (=> bm!59837 (= call!59837 (contains!6979 (ite c!119440 lt!550151 call!59836) k0!934))))

(declare-fun b!1211304 () Bool)

(assert (=> b!1211304 (= e!687914 (and e!687919 mapRes!47974))))

(declare-fun condMapEmpty!47974 () Bool)

(declare-fun mapDefault!47974 () ValueCell!14658)

(assert (=> b!1211304 (= condMapEmpty!47974 (= (arr!37765 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14658)) mapDefault!47974)))))

(declare-fun b!1211305 () Bool)

(declare-fun lt!550141 () Unit!40161)

(assert (=> b!1211305 (= e!687926 lt!550141)))

(assert (=> b!1211305 (= lt!550141 call!59838)))

(assert (=> b!1211305 call!59839))

(declare-fun b!1211306 () Bool)

(assert (=> b!1211306 (= e!687921 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1211307 () Bool)

(declare-fun Unit!40165 () Unit!40161)

(assert (=> b!1211307 (= e!687915 Unit!40165)))

(assert (=> b!1211307 (= lt!550140 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1211307 (= c!119440 (and (not lt!550140) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!550157 () Unit!40161)

(assert (=> b!1211307 (= lt!550157 e!687922)))

(declare-fun lt!550145 () Unit!40161)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!603 (array!78257 array!78259 (_ BitVec 32) (_ BitVec 32) V!46107 V!46107 (_ BitVec 64) (_ BitVec 32) Int) Unit!40161)

(assert (=> b!1211307 (= lt!550145 (lemmaListMapContainsThenArrayContainsFrom!603 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!119438 () Bool)

(assert (=> b!1211307 (= c!119438 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!804707 () Bool)

(assert (=> b!1211307 (= res!804707 e!687921)))

(assert (=> b!1211307 (=> (not res!804707) (not e!687916))))

(assert (=> b!1211307 e!687916))

(declare-fun lt!550150 () Unit!40161)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78257 (_ BitVec 32) (_ BitVec 32)) Unit!40161)

(assert (=> b!1211307 (= lt!550150 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1211307 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26611)))

(declare-fun lt!550147 () Unit!40161)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78257 (_ BitVec 64) (_ BitVec 32) List!26614) Unit!40161)

(assert (=> b!1211307 (= lt!550147 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26611))))

(assert (=> b!1211307 false))

(declare-fun b!1211308 () Bool)

(declare-fun res!804712 () Bool)

(assert (=> b!1211308 (=> (not res!804712) (not e!687925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1211308 (= res!804712 (validKeyInArray!0 k0!934))))

(declare-fun b!1211309 () Bool)

(assert (=> b!1211309 (= e!687917 (= call!59835 (-!1855 call!59840 k0!934)))))

(declare-fun b!1211310 () Bool)

(declare-fun res!804711 () Bool)

(assert (=> b!1211310 (=> (not res!804711) (not e!687925))))

(assert (=> b!1211310 (= res!804711 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38300 _keys!1208))))))

(declare-fun bm!59838 () Bool)

(assert (=> bm!59838 (= call!59839 call!59837)))

(declare-fun b!1211311 () Bool)

(assert (=> b!1211311 (contains!6979 (+!4024 lt!550151 (tuple2!19813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!550154 () Unit!40161)

(assert (=> b!1211311 (= lt!550154 call!59841)))

(assert (=> b!1211311 call!59837))

(assert (=> b!1211311 (= lt!550151 call!59834)))

(declare-fun lt!550144 () Unit!40161)

(assert (=> b!1211311 (= lt!550144 (addStillContains!1052 lt!550152 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1211311 (= e!687922 lt!550154)))

(declare-fun b!1211312 () Bool)

(declare-fun res!804715 () Bool)

(assert (=> b!1211312 (=> (not res!804715) (not e!687925))))

(assert (=> b!1211312 (= res!804715 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26611))))

(declare-fun b!1211313 () Bool)

(assert (=> b!1211313 (= e!687925 e!687920)))

(declare-fun res!804709 () Bool)

(assert (=> b!1211313 (=> (not res!804709) (not e!687920))))

(assert (=> b!1211313 (= res!804709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!550142 mask!1564))))

(assert (=> b!1211313 (= lt!550142 (array!78258 (store (arr!37764 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38300 _keys!1208)))))

(declare-fun b!1211314 () Bool)

(assert (=> b!1211314 (= e!687926 e!687913)))

(declare-fun c!119442 () Bool)

(assert (=> b!1211314 (= c!119442 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!550140))))

(assert (= (and start!101070 res!804713) b!1211299))

(assert (= (and b!1211299 res!804710) b!1211302))

(assert (= (and b!1211302 res!804706) b!1211291))

(assert (= (and b!1211291 res!804708) b!1211312))

(assert (= (and b!1211312 res!804715) b!1211310))

(assert (= (and b!1211310 res!804711) b!1211308))

(assert (= (and b!1211308 res!804712) b!1211298))

(assert (= (and b!1211298 res!804704) b!1211313))

(assert (= (and b!1211313 res!804709) b!1211295))

(assert (= (and b!1211295 res!804702) b!1211300))

(assert (= (and b!1211300 (not res!804703)) b!1211285))

(assert (= (and b!1211285 (not res!804714)) b!1211289))

(assert (= (and b!1211289 c!119443) b!1211309))

(assert (= (and b!1211289 (not c!119443)) b!1211287))

(assert (= (or b!1211309 b!1211287) bm!59833))

(assert (= (or b!1211309 b!1211287) bm!59831))

(assert (= (and b!1211289 (not res!804705)) b!1211293))

(assert (= (and b!1211293 c!119441) b!1211307))

(assert (= (and b!1211293 (not c!119441)) b!1211303))

(assert (= (and b!1211307 c!119440) b!1211311))

(assert (= (and b!1211307 (not c!119440)) b!1211301))

(assert (= (and b!1211301 c!119439) b!1211305))

(assert (= (and b!1211301 (not c!119439)) b!1211314))

(assert (= (and b!1211314 c!119442) b!1211297))

(assert (= (and b!1211314 (not c!119442)) b!1211288))

(assert (= (or b!1211305 b!1211297) bm!59835))

(assert (= (or b!1211305 b!1211297) bm!59836))

(assert (= (or b!1211305 b!1211297) bm!59838))

(assert (= (or b!1211311 bm!59838) bm!59837))

(assert (= (or b!1211311 bm!59835) bm!59832))

(assert (= (or b!1211311 bm!59836) bm!59834))

(assert (= (and b!1211307 c!119438) b!1211306))

(assert (= (and b!1211307 (not c!119438)) b!1211290))

(assert (= (and b!1211307 res!804707) b!1211294))

(assert (= (and b!1211293 res!804701) b!1211296))

(assert (= (and b!1211304 condMapEmpty!47974) mapIsEmpty!47974))

(assert (= (and b!1211304 (not condMapEmpty!47974)) mapNonEmpty!47974))

(get-info :version)

(assert (= (and mapNonEmpty!47974 ((_ is ValueCellFull!14658) mapValue!47974)) b!1211292))

(assert (= (and b!1211304 ((_ is ValueCellFull!14658) mapDefault!47974)) b!1211286))

(assert (= start!101070 b!1211304))

(declare-fun b_lambda!21669 () Bool)

(assert (=> (not b_lambda!21669) (not b!1211285)))

(declare-fun t!39623 () Bool)

(declare-fun tb!10831 () Bool)

(assert (=> (and start!101070 (= defaultEntry!1004 defaultEntry!1004) t!39623) tb!10831))

(declare-fun result!22257 () Bool)

(assert (=> tb!10831 (= result!22257 tp_is_empty!30735)))

(assert (=> b!1211285 t!39623))

(declare-fun b_and!43163 () Bool)

(assert (= b_and!43161 (and (=> t!39623 result!22257) b_and!43163)))

(declare-fun m!1116759 () Bool)

(assert (=> b!1211309 m!1116759))

(declare-fun m!1116761 () Bool)

(assert (=> b!1211311 m!1116761))

(assert (=> b!1211311 m!1116761))

(declare-fun m!1116763 () Bool)

(assert (=> b!1211311 m!1116763))

(declare-fun m!1116765 () Bool)

(assert (=> b!1211311 m!1116765))

(declare-fun m!1116767 () Bool)

(assert (=> b!1211308 m!1116767))

(declare-fun m!1116769 () Bool)

(assert (=> bm!59833 m!1116769))

(declare-fun m!1116771 () Bool)

(assert (=> b!1211294 m!1116771))

(declare-fun m!1116773 () Bool)

(assert (=> b!1211312 m!1116773))

(declare-fun m!1116775 () Bool)

(assert (=> bm!59837 m!1116775))

(assert (=> b!1211306 m!1116771))

(declare-fun m!1116777 () Bool)

(assert (=> start!101070 m!1116777))

(declare-fun m!1116779 () Bool)

(assert (=> start!101070 m!1116779))

(declare-fun m!1116781 () Bool)

(assert (=> b!1211313 m!1116781))

(declare-fun m!1116783 () Bool)

(assert (=> b!1211313 m!1116783))

(declare-fun m!1116785 () Bool)

(assert (=> bm!59831 m!1116785))

(declare-fun m!1116787 () Bool)

(assert (=> mapNonEmpty!47974 m!1116787))

(declare-fun m!1116789 () Bool)

(assert (=> bm!59834 m!1116789))

(declare-fun m!1116791 () Bool)

(assert (=> b!1211291 m!1116791))

(declare-fun m!1116793 () Bool)

(assert (=> b!1211296 m!1116793))

(declare-fun m!1116795 () Bool)

(assert (=> b!1211289 m!1116795))

(declare-fun m!1116797 () Bool)

(assert (=> b!1211289 m!1116797))

(declare-fun m!1116799 () Bool)

(assert (=> b!1211285 m!1116799))

(declare-fun m!1116801 () Bool)

(assert (=> b!1211285 m!1116801))

(declare-fun m!1116803 () Bool)

(assert (=> b!1211285 m!1116803))

(declare-fun m!1116805 () Bool)

(assert (=> b!1211285 m!1116805))

(declare-fun m!1116807 () Bool)

(assert (=> b!1211299 m!1116807))

(declare-fun m!1116809 () Bool)

(assert (=> b!1211298 m!1116809))

(declare-fun m!1116811 () Bool)

(assert (=> bm!59832 m!1116811))

(declare-fun m!1116813 () Bool)

(assert (=> b!1211300 m!1116813))

(declare-fun m!1116815 () Bool)

(assert (=> b!1211300 m!1116815))

(declare-fun m!1116817 () Bool)

(assert (=> b!1211293 m!1116817))

(assert (=> b!1211293 m!1116785))

(declare-fun m!1116819 () Bool)

(assert (=> b!1211293 m!1116819))

(assert (=> b!1211293 m!1116819))

(declare-fun m!1116821 () Bool)

(assert (=> b!1211293 m!1116821))

(assert (=> b!1211293 m!1116795))

(declare-fun m!1116823 () Bool)

(assert (=> b!1211293 m!1116823))

(declare-fun m!1116825 () Bool)

(assert (=> b!1211293 m!1116825))

(assert (=> b!1211293 m!1116795))

(assert (=> b!1211293 m!1116825))

(assert (=> b!1211293 m!1116795))

(declare-fun m!1116827 () Bool)

(assert (=> b!1211293 m!1116827))

(declare-fun m!1116829 () Bool)

(assert (=> b!1211295 m!1116829))

(declare-fun m!1116831 () Bool)

(assert (=> b!1211307 m!1116831))

(declare-fun m!1116833 () Bool)

(assert (=> b!1211307 m!1116833))

(declare-fun m!1116835 () Bool)

(assert (=> b!1211307 m!1116835))

(declare-fun m!1116837 () Bool)

(assert (=> b!1211307 m!1116837))

(check-sat (not b!1211299) (not b!1211295) (not b!1211312) tp_is_empty!30735 (not bm!59832) b_and!43163 (not start!101070) (not b!1211289) (not b!1211311) (not b_lambda!21669) (not bm!59834) (not bm!59833) (not b!1211296) (not b!1211308) (not b!1211313) (not b!1211291) (not b!1211285) (not b!1211307) (not bm!59831) (not b!1211306) (not bm!59837) (not mapNonEmpty!47974) (not b!1211293) (not b!1211294) (not b!1211309) (not b_next!26031) (not b!1211300))
(check-sat b_and!43163 (not b_next!26031))
