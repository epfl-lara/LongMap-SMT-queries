; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98734 () Bool)

(assert start!98734)

(declare-fun b_free!24103 () Bool)

(declare-fun b_next!24103 () Bool)

(assert (=> start!98734 (= b_free!24103 (not b_next!24103))))

(declare-fun tp!85019 () Bool)

(declare-fun b_and!39057 () Bool)

(assert (=> start!98734 (= tp!85019 b_and!39057)))

(declare-fun res!760637 () Bool)

(declare-fun e!649393 () Bool)

(assert (=> start!98734 (=> (not res!760637) (not e!649393))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74167 0))(
  ( (array!74168 (arr!35728 (Array (_ BitVec 32) (_ BitVec 64))) (size!36265 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74167)

(assert (=> start!98734 (= res!760637 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36265 _keys!1208))))))

(assert (=> start!98734 e!649393))

(declare-fun tp_is_empty!28633 () Bool)

(assert (=> start!98734 tp_is_empty!28633))

(declare-fun array_inv!27434 (array!74167) Bool)

(assert (=> start!98734 (array_inv!27434 _keys!1208)))

(assert (=> start!98734 true))

(assert (=> start!98734 tp!85019))

(declare-datatypes ((V!43305 0))(
  ( (V!43306 (val!14373 Int)) )
))
(declare-datatypes ((ValueCell!13607 0))(
  ( (ValueCellFull!13607 (v!17006 V!43305)) (EmptyCell!13607) )
))
(declare-datatypes ((array!74169 0))(
  ( (array!74170 (arr!35729 (Array (_ BitVec 32) ValueCell!13607)) (size!36266 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74169)

(declare-fun e!649384 () Bool)

(declare-fun array_inv!27435 (array!74169) Bool)

(assert (=> start!98734 (and (array_inv!27435 _values!996) e!649384)))

(declare-fun b!1141181 () Bool)

(declare-fun e!649390 () Bool)

(declare-fun e!649399 () Bool)

(assert (=> b!1141181 (= e!649390 e!649399)))

(declare-fun res!760641 () Bool)

(assert (=> b!1141181 (=> res!760641 e!649399)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141181 (= res!760641 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43305)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!507920 () array!74167)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43305)

(declare-fun lt!507936 () array!74169)

(declare-datatypes ((tuple2!18184 0))(
  ( (tuple2!18185 (_1!9103 (_ BitVec 64)) (_2!9103 V!43305)) )
))
(declare-datatypes ((List!24946 0))(
  ( (Nil!24943) (Cons!24942 (h!26160 tuple2!18184) (t!36033 List!24946)) )
))
(declare-datatypes ((ListLongMap!16161 0))(
  ( (ListLongMap!16162 (toList!8096 List!24946)) )
))
(declare-fun lt!507923 () ListLongMap!16161)

(declare-fun getCurrentListMapNoExtraKeys!4604 (array!74167 array!74169 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 32) Int) ListLongMap!16161)

(assert (=> b!1141181 (= lt!507923 (getCurrentListMapNoExtraKeys!4604 lt!507920 lt!507936 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!507933 () V!43305)

(assert (=> b!1141181 (= lt!507936 (array!74170 (store (arr!35729 _values!996) i!673 (ValueCellFull!13607 lt!507933)) (size!36266 _values!996)))))

(declare-fun dynLambda!2648 (Int (_ BitVec 64)) V!43305)

(assert (=> b!1141181 (= lt!507933 (dynLambda!2648 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507922 () ListLongMap!16161)

(assert (=> b!1141181 (= lt!507922 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1141182 () Bool)

(declare-fun call!50844 () ListLongMap!16161)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6643 (ListLongMap!16161 (_ BitVec 64)) Bool)

(assert (=> b!1141182 (contains!6643 call!50844 k0!934)))

(declare-datatypes ((Unit!37347 0))(
  ( (Unit!37348) )
))
(declare-fun lt!507930 () Unit!37347)

(declare-fun lt!507934 () ListLongMap!16161)

(declare-fun addStillContains!773 (ListLongMap!16161 (_ BitVec 64) V!43305 (_ BitVec 64)) Unit!37347)

(assert (=> b!1141182 (= lt!507930 (addStillContains!773 lt!507934 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50848 () Bool)

(assert (=> b!1141182 call!50848))

(declare-fun lt!507924 () ListLongMap!16161)

(declare-fun +!3545 (ListLongMap!16161 tuple2!18184) ListLongMap!16161)

(assert (=> b!1141182 (= lt!507934 (+!3545 lt!507924 (tuple2!18185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507929 () Unit!37347)

(declare-fun call!50850 () Unit!37347)

(assert (=> b!1141182 (= lt!507929 call!50850)))

(declare-fun e!649394 () Unit!37347)

(assert (=> b!1141182 (= e!649394 lt!507930)))

(declare-fun mapNonEmpty!44774 () Bool)

(declare-fun mapRes!44774 () Bool)

(declare-fun tp!85020 () Bool)

(declare-fun e!649397 () Bool)

(assert (=> mapNonEmpty!44774 (= mapRes!44774 (and tp!85020 e!649397))))

(declare-fun mapKey!44774 () (_ BitVec 32))

(declare-fun mapRest!44774 () (Array (_ BitVec 32) ValueCell!13607))

(declare-fun mapValue!44774 () ValueCell!13607)

(assert (=> mapNonEmpty!44774 (= (arr!35729 _values!996) (store mapRest!44774 mapKey!44774 mapValue!44774))))

(declare-fun b!1141183 () Bool)

(declare-fun call!50845 () Bool)

(assert (=> b!1141183 call!50845))

(declare-fun lt!507937 () Unit!37347)

(declare-fun call!50849 () Unit!37347)

(assert (=> b!1141183 (= lt!507937 call!50849)))

(declare-fun e!649398 () Unit!37347)

(assert (=> b!1141183 (= e!649398 lt!507937)))

(declare-fun b!1141184 () Bool)

(declare-fun e!649387 () Unit!37347)

(declare-fun Unit!37349 () Unit!37347)

(assert (=> b!1141184 (= e!649387 Unit!37349)))

(declare-fun lt!507925 () Bool)

(assert (=> b!1141184 (= lt!507925 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!112183 () Bool)

(assert (=> b!1141184 (= c!112183 (and (not lt!507925) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507927 () Unit!37347)

(assert (=> b!1141184 (= lt!507927 e!649394)))

(declare-fun lt!507931 () Unit!37347)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!378 (array!74167 array!74169 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 64) (_ BitVec 32) Int) Unit!37347)

(assert (=> b!1141184 (= lt!507931 (lemmaListMapContainsThenArrayContainsFrom!378 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112185 () Bool)

(assert (=> b!1141184 (= c!112185 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760640 () Bool)

(declare-fun e!649386 () Bool)

(assert (=> b!1141184 (= res!760640 e!649386)))

(declare-fun e!649395 () Bool)

(assert (=> b!1141184 (=> (not res!760640) (not e!649395))))

(assert (=> b!1141184 e!649395))

(declare-fun lt!507926 () Unit!37347)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74167 (_ BitVec 32) (_ BitVec 32)) Unit!37347)

(assert (=> b!1141184 (= lt!507926 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24947 0))(
  ( (Nil!24944) (Cons!24943 (h!26161 (_ BitVec 64)) (t!36034 List!24947)) )
))
(declare-fun arrayNoDuplicates!0 (array!74167 (_ BitVec 32) List!24947) Bool)

(assert (=> b!1141184 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24944)))

(declare-fun lt!507938 () Unit!37347)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74167 (_ BitVec 64) (_ BitVec 32) List!24947) Unit!37347)

(assert (=> b!1141184 (= lt!507938 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24944))))

(assert (=> b!1141184 false))

(declare-fun mapIsEmpty!44774 () Bool)

(assert (=> mapIsEmpty!44774 mapRes!44774))

(declare-fun b!1141185 () Bool)

(declare-fun arrayContainsKey!0 (array!74167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141185 (= e!649395 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141186 () Bool)

(declare-fun res!760639 () Bool)

(assert (=> b!1141186 (=> (not res!760639) (not e!649393))))

(assert (=> b!1141186 (= res!760639 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24944))))

(declare-fun b!1141187 () Bool)

(declare-fun res!760644 () Bool)

(assert (=> b!1141187 (=> (not res!760644) (not e!649393))))

(assert (=> b!1141187 (= res!760644 (= (select (arr!35728 _keys!1208) i!673) k0!934))))

(declare-fun b!1141188 () Bool)

(declare-fun e!649391 () Bool)

(declare-fun call!50843 () ListLongMap!16161)

(declare-fun call!50847 () ListLongMap!16161)

(assert (=> b!1141188 (= e!649391 (= call!50843 call!50847))))

(declare-fun b!1141189 () Bool)

(declare-fun e!649385 () Bool)

(assert (=> b!1141189 (= e!649399 e!649385)))

(declare-fun res!760643 () Bool)

(assert (=> b!1141189 (=> res!760643 e!649385)))

(assert (=> b!1141189 (= res!760643 (not (= (select (arr!35728 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1141189 e!649391))

(declare-fun c!112184 () Bool)

(assert (=> b!1141189 (= c!112184 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507940 () Unit!37347)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!488 (array!74167 array!74169 (_ BitVec 32) (_ BitVec 32) V!43305 V!43305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37347)

(assert (=> b!1141189 (= lt!507940 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112186 () Bool)

(declare-fun bm!50840 () Bool)

(assert (=> bm!50840 (= call!50844 (+!3545 (ite c!112183 lt!507934 lt!507924) (ite c!112183 (tuple2!18185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112186 (tuple2!18185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1141190 () Bool)

(declare-fun res!760642 () Bool)

(assert (=> b!1141190 (=> (not res!760642) (not e!649393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74167 (_ BitVec 32)) Bool)

(assert (=> b!1141190 (= res!760642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1141191 () Bool)

(declare-fun -!1230 (ListLongMap!16161 (_ BitVec 64)) ListLongMap!16161)

(assert (=> b!1141191 (= e!649391 (= call!50843 (-!1230 call!50847 k0!934)))))

(declare-fun b!1141192 () Bool)

(declare-fun Unit!37350 () Unit!37347)

(assert (=> b!1141192 (= e!649398 Unit!37350)))

(declare-fun b!1141193 () Bool)

(declare-fun Unit!37351 () Unit!37347)

(assert (=> b!1141193 (= e!649387 Unit!37351)))

(declare-fun b!1141194 () Bool)

(assert (=> b!1141194 (= c!112186 (and (not lt!507925) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649389 () Unit!37347)

(assert (=> b!1141194 (= e!649394 e!649389)))

(declare-fun b!1141195 () Bool)

(declare-fun res!760647 () Bool)

(assert (=> b!1141195 (=> (not res!760647) (not e!649393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141195 (= res!760647 (validMask!0 mask!1564))))

(declare-fun bm!50841 () Bool)

(assert (=> bm!50841 (= call!50845 call!50848)))

(declare-fun b!1141196 () Bool)

(assert (=> b!1141196 (= e!649385 true)))

(declare-fun lt!507921 () V!43305)

(assert (=> b!1141196 (= (-!1230 (+!3545 lt!507924 (tuple2!18185 (select (arr!35728 _keys!1208) from!1455) lt!507921)) (select (arr!35728 _keys!1208) from!1455)) lt!507924)))

(declare-fun lt!507932 () Unit!37347)

(declare-fun addThenRemoveForNewKeyIsSame!90 (ListLongMap!16161 (_ BitVec 64) V!43305) Unit!37347)

(assert (=> b!1141196 (= lt!507932 (addThenRemoveForNewKeyIsSame!90 lt!507924 (select (arr!35728 _keys!1208) from!1455) lt!507921))))

(declare-fun get!18169 (ValueCell!13607 V!43305) V!43305)

(assert (=> b!1141196 (= lt!507921 (get!18169 (select (arr!35729 _values!996) from!1455) lt!507933))))

(declare-fun lt!507939 () Unit!37347)

(assert (=> b!1141196 (= lt!507939 e!649387)))

(declare-fun c!112187 () Bool)

(assert (=> b!1141196 (= c!112187 (contains!6643 lt!507924 k0!934))))

(assert (=> b!1141196 (= lt!507924 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141197 () Bool)

(declare-fun lt!507928 () Unit!37347)

(assert (=> b!1141197 (= e!649389 lt!507928)))

(assert (=> b!1141197 (= lt!507928 call!50849)))

(assert (=> b!1141197 call!50845))

(declare-fun b!1141198 () Bool)

(declare-fun e!649396 () Bool)

(assert (=> b!1141198 (= e!649384 (and e!649396 mapRes!44774))))

(declare-fun condMapEmpty!44774 () Bool)

(declare-fun mapDefault!44774 () ValueCell!13607)

(assert (=> b!1141198 (= condMapEmpty!44774 (= (arr!35729 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13607)) mapDefault!44774)))))

(declare-fun b!1141199 () Bool)

(assert (=> b!1141199 (= e!649396 tp_is_empty!28633)))

(declare-fun b!1141200 () Bool)

(declare-fun res!760645 () Bool)

(assert (=> b!1141200 (=> (not res!760645) (not e!649393))))

(assert (=> b!1141200 (= res!760645 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36265 _keys!1208))))))

(declare-fun b!1141201 () Bool)

(declare-fun res!760634 () Bool)

(declare-fun e!649388 () Bool)

(assert (=> b!1141201 (=> (not res!760634) (not e!649388))))

(assert (=> b!1141201 (= res!760634 (arrayNoDuplicates!0 lt!507920 #b00000000000000000000000000000000 Nil!24944))))

(declare-fun b!1141202 () Bool)

(declare-fun res!760646 () Bool)

(assert (=> b!1141202 (=> (not res!760646) (not e!649393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141202 (= res!760646 (validKeyInArray!0 k0!934))))

(declare-fun b!1141203 () Bool)

(assert (=> b!1141203 (= e!649393 e!649388)))

(declare-fun res!760635 () Bool)

(assert (=> b!1141203 (=> (not res!760635) (not e!649388))))

(assert (=> b!1141203 (= res!760635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507920 mask!1564))))

(assert (=> b!1141203 (= lt!507920 (array!74168 (store (arr!35728 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36265 _keys!1208)))))

(declare-fun bm!50842 () Bool)

(assert (=> bm!50842 (= call!50850 (addStillContains!773 lt!507924 (ite (or c!112183 c!112186) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112183 c!112186) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1141204 () Bool)

(assert (=> b!1141204 (= e!649389 e!649398)))

(declare-fun c!112188 () Bool)

(assert (=> b!1141204 (= c!112188 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507925))))

(declare-fun bm!50843 () Bool)

(assert (=> bm!50843 (= call!50849 call!50850)))

(declare-fun bm!50844 () Bool)

(assert (=> bm!50844 (= call!50847 (getCurrentListMapNoExtraKeys!4604 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141205 () Bool)

(declare-fun res!760636 () Bool)

(assert (=> b!1141205 (=> (not res!760636) (not e!649393))))

(assert (=> b!1141205 (= res!760636 (and (= (size!36266 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36265 _keys!1208) (size!36266 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!50845 () Bool)

(declare-fun call!50846 () ListLongMap!16161)

(assert (=> bm!50845 (= call!50848 (contains!6643 (ite c!112183 lt!507934 call!50846) k0!934))))

(declare-fun b!1141206 () Bool)

(assert (=> b!1141206 (= e!649386 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507925) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141207 () Bool)

(assert (=> b!1141207 (= e!649388 (not e!649390))))

(declare-fun res!760638 () Bool)

(assert (=> b!1141207 (=> res!760638 e!649390)))

(assert (=> b!1141207 (= res!760638 (bvsgt from!1455 i!673))))

(assert (=> b!1141207 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507935 () Unit!37347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74167 (_ BitVec 64) (_ BitVec 32)) Unit!37347)

(assert (=> b!1141207 (= lt!507935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!50846 () Bool)

(assert (=> bm!50846 (= call!50846 call!50844)))

(declare-fun b!1141208 () Bool)

(assert (=> b!1141208 (= e!649386 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50847 () Bool)

(assert (=> bm!50847 (= call!50843 (getCurrentListMapNoExtraKeys!4604 lt!507920 lt!507936 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141209 () Bool)

(assert (=> b!1141209 (= e!649397 tp_is_empty!28633)))

(assert (= (and start!98734 res!760637) b!1141195))

(assert (= (and b!1141195 res!760647) b!1141205))

(assert (= (and b!1141205 res!760636) b!1141190))

(assert (= (and b!1141190 res!760642) b!1141186))

(assert (= (and b!1141186 res!760639) b!1141200))

(assert (= (and b!1141200 res!760645) b!1141202))

(assert (= (and b!1141202 res!760646) b!1141187))

(assert (= (and b!1141187 res!760644) b!1141203))

(assert (= (and b!1141203 res!760635) b!1141201))

(assert (= (and b!1141201 res!760634) b!1141207))

(assert (= (and b!1141207 (not res!760638)) b!1141181))

(assert (= (and b!1141181 (not res!760641)) b!1141189))

(assert (= (and b!1141189 c!112184) b!1141191))

(assert (= (and b!1141189 (not c!112184)) b!1141188))

(assert (= (or b!1141191 b!1141188) bm!50847))

(assert (= (or b!1141191 b!1141188) bm!50844))

(assert (= (and b!1141189 (not res!760643)) b!1141196))

(assert (= (and b!1141196 c!112187) b!1141184))

(assert (= (and b!1141196 (not c!112187)) b!1141193))

(assert (= (and b!1141184 c!112183) b!1141182))

(assert (= (and b!1141184 (not c!112183)) b!1141194))

(assert (= (and b!1141194 c!112186) b!1141197))

(assert (= (and b!1141194 (not c!112186)) b!1141204))

(assert (= (and b!1141204 c!112188) b!1141183))

(assert (= (and b!1141204 (not c!112188)) b!1141192))

(assert (= (or b!1141197 b!1141183) bm!50843))

(assert (= (or b!1141197 b!1141183) bm!50846))

(assert (= (or b!1141197 b!1141183) bm!50841))

(assert (= (or b!1141182 bm!50841) bm!50845))

(assert (= (or b!1141182 bm!50843) bm!50842))

(assert (= (or b!1141182 bm!50846) bm!50840))

(assert (= (and b!1141184 c!112185) b!1141208))

(assert (= (and b!1141184 (not c!112185)) b!1141206))

(assert (= (and b!1141184 res!760640) b!1141185))

(assert (= (and b!1141198 condMapEmpty!44774) mapIsEmpty!44774))

(assert (= (and b!1141198 (not condMapEmpty!44774)) mapNonEmpty!44774))

(get-info :version)

(assert (= (and mapNonEmpty!44774 ((_ is ValueCellFull!13607) mapValue!44774)) b!1141209))

(assert (= (and b!1141198 ((_ is ValueCellFull!13607) mapDefault!44774)) b!1141199))

(assert (= start!98734 b!1141198))

(declare-fun b_lambda!19203 () Bool)

(assert (=> (not b_lambda!19203) (not b!1141181)))

(declare-fun t!36032 () Bool)

(declare-fun tb!8907 () Bool)

(assert (=> (and start!98734 (= defaultEntry!1004 defaultEntry!1004) t!36032) tb!8907))

(declare-fun result!18387 () Bool)

(assert (=> tb!8907 (= result!18387 tp_is_empty!28633)))

(assert (=> b!1141181 t!36032))

(declare-fun b_and!39059 () Bool)

(assert (= b_and!39057 (and (=> t!36032 result!18387) b_and!39059)))

(declare-fun m!1053045 () Bool)

(assert (=> b!1141208 m!1053045))

(declare-fun m!1053047 () Bool)

(assert (=> bm!50842 m!1053047))

(declare-fun m!1053049 () Bool)

(assert (=> b!1141202 m!1053049))

(declare-fun m!1053051 () Bool)

(assert (=> b!1141182 m!1053051))

(declare-fun m!1053053 () Bool)

(assert (=> b!1141182 m!1053053))

(declare-fun m!1053055 () Bool)

(assert (=> b!1141182 m!1053055))

(declare-fun m!1053057 () Bool)

(assert (=> b!1141195 m!1053057))

(declare-fun m!1053059 () Bool)

(assert (=> b!1141196 m!1053059))

(declare-fun m!1053061 () Bool)

(assert (=> b!1141196 m!1053061))

(declare-fun m!1053063 () Bool)

(assert (=> b!1141196 m!1053063))

(declare-fun m!1053065 () Bool)

(assert (=> b!1141196 m!1053065))

(declare-fun m!1053067 () Bool)

(assert (=> b!1141196 m!1053067))

(assert (=> b!1141196 m!1053063))

(declare-fun m!1053069 () Bool)

(assert (=> b!1141196 m!1053069))

(assert (=> b!1141196 m!1053061))

(declare-fun m!1053071 () Bool)

(assert (=> b!1141196 m!1053071))

(assert (=> b!1141196 m!1053063))

(declare-fun m!1053073 () Bool)

(assert (=> b!1141196 m!1053073))

(assert (=> b!1141196 m!1053067))

(declare-fun m!1053075 () Bool)

(assert (=> b!1141181 m!1053075))

(declare-fun m!1053077 () Bool)

(assert (=> b!1141181 m!1053077))

(declare-fun m!1053079 () Bool)

(assert (=> b!1141181 m!1053079))

(declare-fun m!1053081 () Bool)

(assert (=> b!1141181 m!1053081))

(declare-fun m!1053083 () Bool)

(assert (=> b!1141190 m!1053083))

(assert (=> b!1141185 m!1053045))

(declare-fun m!1053085 () Bool)

(assert (=> bm!50847 m!1053085))

(declare-fun m!1053087 () Bool)

(assert (=> b!1141191 m!1053087))

(assert (=> bm!50844 m!1053059))

(declare-fun m!1053089 () Bool)

(assert (=> b!1141203 m!1053089))

(declare-fun m!1053091 () Bool)

(assert (=> b!1141203 m!1053091))

(declare-fun m!1053093 () Bool)

(assert (=> b!1141184 m!1053093))

(declare-fun m!1053095 () Bool)

(assert (=> b!1141184 m!1053095))

(declare-fun m!1053097 () Bool)

(assert (=> b!1141184 m!1053097))

(declare-fun m!1053099 () Bool)

(assert (=> b!1141184 m!1053099))

(declare-fun m!1053101 () Bool)

(assert (=> b!1141207 m!1053101))

(declare-fun m!1053103 () Bool)

(assert (=> b!1141207 m!1053103))

(declare-fun m!1053105 () Bool)

(assert (=> b!1141187 m!1053105))

(declare-fun m!1053107 () Bool)

(assert (=> bm!50840 m!1053107))

(declare-fun m!1053109 () Bool)

(assert (=> start!98734 m!1053109))

(declare-fun m!1053111 () Bool)

(assert (=> start!98734 m!1053111))

(assert (=> b!1141189 m!1053063))

(declare-fun m!1053113 () Bool)

(assert (=> b!1141189 m!1053113))

(declare-fun m!1053115 () Bool)

(assert (=> b!1141186 m!1053115))

(declare-fun m!1053117 () Bool)

(assert (=> bm!50845 m!1053117))

(declare-fun m!1053119 () Bool)

(assert (=> b!1141201 m!1053119))

(declare-fun m!1053121 () Bool)

(assert (=> mapNonEmpty!44774 m!1053121))

(check-sat (not b!1141202) b_and!39059 (not b!1141195) (not b!1141181) (not b!1141189) (not b_next!24103) (not bm!50840) (not bm!50845) (not mapNonEmpty!44774) (not bm!50844) (not b!1141207) (not b!1141203) tp_is_empty!28633 (not b!1141196) (not b_lambda!19203) (not b!1141184) (not b!1141190) (not bm!50847) (not b!1141208) (not b!1141191) (not start!98734) (not b!1141186) (not bm!50842) (not b!1141201) (not b!1141185) (not b!1141182))
(check-sat b_and!39059 (not b_next!24103))
