; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98834 () Bool)

(assert start!98834)

(declare-fun b_free!24445 () Bool)

(declare-fun b_next!24445 () Bool)

(assert (=> start!98834 (= b_free!24445 (not b_next!24445))))

(declare-fun tp!86045 () Bool)

(declare-fun b_and!39717 () Bool)

(assert (=> start!98834 (= tp!86045 b_and!39717)))

(declare-datatypes ((array!74714 0))(
  ( (array!74715 (arr!36008 (Array (_ BitVec 32) (_ BitVec 64))) (size!36546 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74714)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!657067 () Bool)

(declare-fun b!1155358 () Bool)

(declare-fun arrayContainsKey!0 (array!74714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155358 (= e!657067 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155359 () Bool)

(declare-fun res!767619 () Bool)

(declare-fun e!657053 () Bool)

(assert (=> b!1155359 (=> (not res!767619) (not e!657053))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155359 (= res!767619 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36546 _keys!1208))))))

(declare-fun e!657057 () Bool)

(declare-fun b!1155360 () Bool)

(assert (=> b!1155360 (= e!657057 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-datatypes ((V!43761 0))(
  ( (V!43762 (val!14544 Int)) )
))
(declare-fun zeroValue!944 () V!43761)

(declare-fun bm!54856 () Bool)

(declare-fun c!114841 () Bool)

(declare-fun c!114840 () Bool)

(declare-datatypes ((Unit!37891 0))(
  ( (Unit!37892) )
))
(declare-fun call!54863 () Unit!37891)

(declare-datatypes ((tuple2!18572 0))(
  ( (tuple2!18573 (_1!9297 (_ BitVec 64)) (_2!9297 V!43761)) )
))
(declare-datatypes ((List!25302 0))(
  ( (Nil!25299) (Cons!25298 (h!26507 tuple2!18572) (t!36730 List!25302)) )
))
(declare-datatypes ((ListLongMap!16541 0))(
  ( (ListLongMap!16542 (toList!8286 List!25302)) )
))
(declare-fun lt!518244 () ListLongMap!16541)

(declare-fun minValue!944 () V!43761)

(declare-fun addStillContains!909 (ListLongMap!16541 (_ BitVec 64) V!43761 (_ BitVec 64)) Unit!37891)

(assert (=> bm!54856 (= call!54863 (addStillContains!909 lt!518244 (ite (or c!114841 c!114840) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!114841 c!114840) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1155361 () Bool)

(declare-fun res!767626 () Bool)

(assert (=> b!1155361 (=> (not res!767626) (not e!657053))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155361 (= res!767626 (validMask!0 mask!1564))))

(declare-fun call!54866 () ListLongMap!16541)

(declare-fun e!657063 () Bool)

(declare-fun call!54865 () ListLongMap!16541)

(declare-fun b!1155362 () Bool)

(declare-fun -!1345 (ListLongMap!16541 (_ BitVec 64)) ListLongMap!16541)

(assert (=> b!1155362 (= e!657063 (= call!54866 (-!1345 call!54865 k0!934)))))

(declare-fun mapNonEmpty!45287 () Bool)

(declare-fun mapRes!45287 () Bool)

(declare-fun tp!86046 () Bool)

(declare-fun e!657060 () Bool)

(assert (=> mapNonEmpty!45287 (= mapRes!45287 (and tp!86046 e!657060))))

(declare-fun mapKey!45287 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13778 0))(
  ( (ValueCellFull!13778 (v!17180 V!43761)) (EmptyCell!13778) )
))
(declare-datatypes ((array!74716 0))(
  ( (array!74717 (arr!36009 (Array (_ BitVec 32) ValueCell!13778)) (size!36547 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74716)

(declare-fun mapValue!45287 () ValueCell!13778)

(declare-fun mapRest!45287 () (Array (_ BitVec 32) ValueCell!13778))

(assert (=> mapNonEmpty!45287 (= (arr!36009 _values!996) (store mapRest!45287 mapKey!45287 mapValue!45287))))

(declare-fun b!1155363 () Bool)

(declare-fun e!657068 () Unit!37891)

(declare-fun Unit!37893 () Unit!37891)

(assert (=> b!1155363 (= e!657068 Unit!37893)))

(declare-fun bm!54857 () Bool)

(declare-fun call!54864 () Bool)

(declare-fun call!54862 () Bool)

(assert (=> bm!54857 (= call!54864 call!54862)))

(declare-fun b!1155364 () Bool)

(declare-fun lt!518237 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1155364 (= c!114840 (and (not lt!518237) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!657059 () Unit!37891)

(declare-fun e!657062 () Unit!37891)

(assert (=> b!1155364 (= e!657059 e!657062)))

(declare-fun b!1155365 () Bool)

(declare-fun e!657065 () Bool)

(assert (=> b!1155365 (= e!657053 e!657065)))

(declare-fun res!767615 () Bool)

(assert (=> b!1155365 (=> (not res!767615) (not e!657065))))

(declare-fun lt!518232 () array!74714)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74714 (_ BitVec 32)) Bool)

(assert (=> b!1155365 (= res!767615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518232 mask!1564))))

(assert (=> b!1155365 (= lt!518232 (array!74715 (store (arr!36008 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36546 _keys!1208)))))

(declare-fun bm!54858 () Bool)

(declare-fun lt!518228 () ListLongMap!16541)

(declare-fun call!54859 () ListLongMap!16541)

(declare-fun +!3697 (ListLongMap!16541 tuple2!18572) ListLongMap!16541)

(assert (=> bm!54858 (= call!54859 (+!3697 (ite c!114841 lt!518228 lt!518244) (ite c!114841 (tuple2!18573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114840 (tuple2!18573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18573 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155367 () Bool)

(declare-fun contains!6738 (ListLongMap!16541 (_ BitVec 64)) Bool)

(assert (=> b!1155367 (contains!6738 call!54859 k0!934)))

(declare-fun lt!518231 () Unit!37891)

(assert (=> b!1155367 (= lt!518231 (addStillContains!909 lt!518228 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1155367 call!54862))

(assert (=> b!1155367 (= lt!518228 (+!3697 lt!518244 (tuple2!18573 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518233 () Unit!37891)

(assert (=> b!1155367 (= lt!518233 call!54863)))

(assert (=> b!1155367 (= e!657059 lt!518231)))

(declare-fun b!1155368 () Bool)

(assert (=> b!1155368 (= e!657057 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518237) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1155369 () Bool)

(declare-fun res!767620 () Bool)

(assert (=> b!1155369 (=> (not res!767620) (not e!657053))))

(assert (=> b!1155369 (= res!767620 (= (select (arr!36008 _keys!1208) i!673) k0!934))))

(declare-fun b!1155370 () Bool)

(declare-fun e!657061 () Bool)

(declare-fun e!657058 () Bool)

(assert (=> b!1155370 (= e!657061 e!657058)))

(declare-fun res!767627 () Bool)

(assert (=> b!1155370 (=> res!767627 e!657058)))

(assert (=> b!1155370 (= res!767627 (not (= (select (arr!36008 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1155370 e!657063))

(declare-fun c!114838 () Bool)

(assert (=> b!1155370 (= c!114838 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!518239 () Unit!37891)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!617 (array!74714 array!74716 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37891)

(assert (=> b!1155370 (= lt!518239 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!617 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155371 () Bool)

(declare-fun e!657056 () Unit!37891)

(assert (=> b!1155371 (= e!657062 e!657056)))

(declare-fun c!114842 () Bool)

(assert (=> b!1155371 (= c!114842 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518237))))

(declare-fun mapIsEmpty!45287 () Bool)

(assert (=> mapIsEmpty!45287 mapRes!45287))

(declare-fun b!1155372 () Bool)

(assert (=> b!1155372 (= e!657058 true)))

(declare-fun e!657069 () Bool)

(assert (=> b!1155372 e!657069))

(declare-fun res!767624 () Bool)

(assert (=> b!1155372 (=> (not res!767624) (not e!657069))))

(declare-fun lt!518243 () ListLongMap!16541)

(assert (=> b!1155372 (= res!767624 (= lt!518243 lt!518244))))

(declare-fun lt!518245 () ListLongMap!16541)

(assert (=> b!1155372 (= lt!518243 (-!1345 lt!518245 k0!934))))

(declare-fun lt!518226 () V!43761)

(assert (=> b!1155372 (= (-!1345 (+!3697 lt!518244 (tuple2!18573 (select (arr!36008 _keys!1208) from!1455) lt!518226)) (select (arr!36008 _keys!1208) from!1455)) lt!518244)))

(declare-fun lt!518234 () Unit!37891)

(declare-fun addThenRemoveForNewKeyIsSame!198 (ListLongMap!16541 (_ BitVec 64) V!43761) Unit!37891)

(assert (=> b!1155372 (= lt!518234 (addThenRemoveForNewKeyIsSame!198 lt!518244 (select (arr!36008 _keys!1208) from!1455) lt!518226))))

(declare-fun lt!518240 () V!43761)

(declare-fun get!18360 (ValueCell!13778 V!43761) V!43761)

(assert (=> b!1155372 (= lt!518226 (get!18360 (select (arr!36009 _values!996) from!1455) lt!518240))))

(declare-fun lt!518246 () Unit!37891)

(assert (=> b!1155372 (= lt!518246 e!657068)))

(declare-fun c!114837 () Bool)

(assert (=> b!1155372 (= c!114837 (contains!6738 lt!518244 k0!934))))

(declare-fun getCurrentListMapNoExtraKeys!4767 (array!74714 array!74716 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 32) Int) ListLongMap!16541)

(assert (=> b!1155372 (= lt!518244 (getCurrentListMapNoExtraKeys!4767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155373 () Bool)

(declare-fun lt!518227 () Unit!37891)

(assert (=> b!1155373 (= e!657062 lt!518227)))

(declare-fun call!54861 () Unit!37891)

(assert (=> b!1155373 (= lt!518227 call!54861)))

(assert (=> b!1155373 call!54864))

(declare-fun bm!54859 () Bool)

(assert (=> bm!54859 (= call!54861 call!54863)))

(declare-fun b!1155374 () Bool)

(declare-fun res!767623 () Bool)

(assert (=> b!1155374 (=> (not res!767623) (not e!657053))))

(assert (=> b!1155374 (= res!767623 (and (= (size!36547 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36546 _keys!1208) (size!36547 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54860 () Bool)

(declare-fun call!54860 () ListLongMap!16541)

(assert (=> bm!54860 (= call!54860 call!54859)))

(declare-fun b!1155375 () Bool)

(declare-fun e!657064 () Bool)

(declare-fun tp_is_empty!28975 () Bool)

(assert (=> b!1155375 (= e!657064 tp_is_empty!28975)))

(declare-fun b!1155376 () Bool)

(declare-fun res!767625 () Bool)

(assert (=> b!1155376 (=> (not res!767625) (not e!657053))))

(declare-datatypes ((List!25303 0))(
  ( (Nil!25300) (Cons!25299 (h!26508 (_ BitVec 64)) (t!36731 List!25303)) )
))
(declare-fun arrayNoDuplicates!0 (array!74714 (_ BitVec 32) List!25303) Bool)

(assert (=> b!1155376 (= res!767625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25300))))

(declare-fun b!1155377 () Bool)

(declare-fun e!657066 () Bool)

(assert (=> b!1155377 (= e!657066 e!657061)))

(declare-fun res!767613 () Bool)

(assert (=> b!1155377 (=> res!767613 e!657061)))

(assert (=> b!1155377 (= res!767613 (not (= from!1455 i!673)))))

(declare-fun lt!518229 () array!74716)

(declare-fun lt!518238 () ListLongMap!16541)

(assert (=> b!1155377 (= lt!518238 (getCurrentListMapNoExtraKeys!4767 lt!518232 lt!518229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1155377 (= lt!518229 (array!74717 (store (arr!36009 _values!996) i!673 (ValueCellFull!13778 lt!518240)) (size!36547 _values!996)))))

(declare-fun dynLambda!2726 (Int (_ BitVec 64)) V!43761)

(assert (=> b!1155377 (= lt!518240 (dynLambda!2726 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1155377 (= lt!518245 (getCurrentListMapNoExtraKeys!4767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!54861 () Bool)

(assert (=> bm!54861 (= call!54865 (getCurrentListMapNoExtraKeys!4767 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155378 () Bool)

(declare-fun res!767617 () Bool)

(assert (=> b!1155378 (=> (not res!767617) (not e!657053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155378 (= res!767617 (validKeyInArray!0 k0!934))))

(declare-fun b!1155379 () Bool)

(declare-fun Unit!37894 () Unit!37891)

(assert (=> b!1155379 (= e!657056 Unit!37894)))

(declare-fun bm!54862 () Bool)

(assert (=> bm!54862 (= call!54862 (contains!6738 (ite c!114841 lt!518228 call!54860) k0!934))))

(declare-fun b!1155380 () Bool)

(declare-fun res!767618 () Bool)

(assert (=> b!1155380 (=> (not res!767618) (not e!657053))))

(assert (=> b!1155380 (= res!767618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155381 () Bool)

(declare-fun Unit!37895 () Unit!37891)

(assert (=> b!1155381 (= e!657068 Unit!37895)))

(assert (=> b!1155381 (= lt!518237 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155381 (= c!114841 (and (not lt!518237) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518230 () Unit!37891)

(assert (=> b!1155381 (= lt!518230 e!657059)))

(declare-fun lt!518247 () Unit!37891)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!495 (array!74714 array!74716 (_ BitVec 32) (_ BitVec 32) V!43761 V!43761 (_ BitVec 64) (_ BitVec 32) Int) Unit!37891)

(assert (=> b!1155381 (= lt!518247 (lemmaListMapContainsThenArrayContainsFrom!495 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114839 () Bool)

(assert (=> b!1155381 (= c!114839 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767616 () Bool)

(assert (=> b!1155381 (= res!767616 e!657057)))

(assert (=> b!1155381 (=> (not res!767616) (not e!657067))))

(assert (=> b!1155381 e!657067))

(declare-fun lt!518242 () Unit!37891)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74714 (_ BitVec 32) (_ BitVec 32)) Unit!37891)

(assert (=> b!1155381 (= lt!518242 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1155381 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25300)))

(declare-fun lt!518236 () Unit!37891)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74714 (_ BitVec 64) (_ BitVec 32) List!25303) Unit!37891)

(assert (=> b!1155381 (= lt!518236 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25300))))

(assert (=> b!1155381 false))

(declare-fun b!1155382 () Bool)

(assert (=> b!1155382 (= e!657060 tp_is_empty!28975)))

(declare-fun b!1155383 () Bool)

(declare-fun e!657055 () Bool)

(assert (=> b!1155383 (= e!657055 (and e!657064 mapRes!45287))))

(declare-fun condMapEmpty!45287 () Bool)

(declare-fun mapDefault!45287 () ValueCell!13778)

(assert (=> b!1155383 (= condMapEmpty!45287 (= (arr!36009 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13778)) mapDefault!45287)))))

(declare-fun b!1155384 () Bool)

(assert (=> b!1155384 (= e!657069 (= lt!518243 (getCurrentListMapNoExtraKeys!4767 lt!518232 lt!518229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun res!767621 () Bool)

(assert (=> start!98834 (=> (not res!767621) (not e!657053))))

(assert (=> start!98834 (= res!767621 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36546 _keys!1208))))))

(assert (=> start!98834 e!657053))

(assert (=> start!98834 tp_is_empty!28975))

(declare-fun array_inv!27670 (array!74714) Bool)

(assert (=> start!98834 (array_inv!27670 _keys!1208)))

(assert (=> start!98834 true))

(assert (=> start!98834 tp!86045))

(declare-fun array_inv!27671 (array!74716) Bool)

(assert (=> start!98834 (and (array_inv!27671 _values!996) e!657055)))

(declare-fun b!1155366 () Bool)

(declare-fun res!767622 () Bool)

(assert (=> b!1155366 (=> (not res!767622) (not e!657065))))

(assert (=> b!1155366 (= res!767622 (arrayNoDuplicates!0 lt!518232 #b00000000000000000000000000000000 Nil!25300))))

(declare-fun bm!54863 () Bool)

(assert (=> bm!54863 (= call!54866 (getCurrentListMapNoExtraKeys!4767 lt!518232 lt!518229 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155385 () Bool)

(assert (=> b!1155385 call!54864))

(declare-fun lt!518241 () Unit!37891)

(assert (=> b!1155385 (= lt!518241 call!54861)))

(assert (=> b!1155385 (= e!657056 lt!518241)))

(declare-fun b!1155386 () Bool)

(assert (=> b!1155386 (= e!657063 (= call!54866 call!54865))))

(declare-fun b!1155387 () Bool)

(assert (=> b!1155387 (= e!657065 (not e!657066))))

(declare-fun res!767614 () Bool)

(assert (=> b!1155387 (=> res!767614 e!657066)))

(assert (=> b!1155387 (= res!767614 (bvsgt from!1455 i!673))))

(assert (=> b!1155387 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518235 () Unit!37891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74714 (_ BitVec 64) (_ BitVec 32)) Unit!37891)

(assert (=> b!1155387 (= lt!518235 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98834 res!767621) b!1155361))

(assert (= (and b!1155361 res!767626) b!1155374))

(assert (= (and b!1155374 res!767623) b!1155380))

(assert (= (and b!1155380 res!767618) b!1155376))

(assert (= (and b!1155376 res!767625) b!1155359))

(assert (= (and b!1155359 res!767619) b!1155378))

(assert (= (and b!1155378 res!767617) b!1155369))

(assert (= (and b!1155369 res!767620) b!1155365))

(assert (= (and b!1155365 res!767615) b!1155366))

(assert (= (and b!1155366 res!767622) b!1155387))

(assert (= (and b!1155387 (not res!767614)) b!1155377))

(assert (= (and b!1155377 (not res!767613)) b!1155370))

(assert (= (and b!1155370 c!114838) b!1155362))

(assert (= (and b!1155370 (not c!114838)) b!1155386))

(assert (= (or b!1155362 b!1155386) bm!54863))

(assert (= (or b!1155362 b!1155386) bm!54861))

(assert (= (and b!1155370 (not res!767627)) b!1155372))

(assert (= (and b!1155372 c!114837) b!1155381))

(assert (= (and b!1155372 (not c!114837)) b!1155363))

(assert (= (and b!1155381 c!114841) b!1155367))

(assert (= (and b!1155381 (not c!114841)) b!1155364))

(assert (= (and b!1155364 c!114840) b!1155373))

(assert (= (and b!1155364 (not c!114840)) b!1155371))

(assert (= (and b!1155371 c!114842) b!1155385))

(assert (= (and b!1155371 (not c!114842)) b!1155379))

(assert (= (or b!1155373 b!1155385) bm!54859))

(assert (= (or b!1155373 b!1155385) bm!54860))

(assert (= (or b!1155373 b!1155385) bm!54857))

(assert (= (or b!1155367 bm!54857) bm!54862))

(assert (= (or b!1155367 bm!54859) bm!54856))

(assert (= (or b!1155367 bm!54860) bm!54858))

(assert (= (and b!1155381 c!114839) b!1155360))

(assert (= (and b!1155381 (not c!114839)) b!1155368))

(assert (= (and b!1155381 res!767616) b!1155358))

(assert (= (and b!1155372 res!767624) b!1155384))

(assert (= (and b!1155383 condMapEmpty!45287) mapIsEmpty!45287))

(assert (= (and b!1155383 (not condMapEmpty!45287)) mapNonEmpty!45287))

(get-info :version)

(assert (= (and mapNonEmpty!45287 ((_ is ValueCellFull!13778) mapValue!45287)) b!1155382))

(assert (= (and b!1155383 ((_ is ValueCellFull!13778) mapDefault!45287)) b!1155375))

(assert (= start!98834 b!1155383))

(declare-fun b_lambda!19533 () Bool)

(assert (=> (not b_lambda!19533) (not b!1155377)))

(declare-fun t!36729 () Bool)

(declare-fun tb!9249 () Bool)

(assert (=> (and start!98834 (= defaultEntry!1004 defaultEntry!1004) t!36729) tb!9249))

(declare-fun result!19071 () Bool)

(assert (=> tb!9249 (= result!19071 tp_is_empty!28975)))

(assert (=> b!1155377 t!36729))

(declare-fun b_and!39719 () Bool)

(assert (= b_and!39717 (and (=> t!36729 result!19071) b_and!39719)))

(declare-fun m!1064471 () Bool)

(assert (=> b!1155387 m!1064471))

(declare-fun m!1064473 () Bool)

(assert (=> b!1155387 m!1064473))

(declare-fun m!1064475 () Bool)

(assert (=> b!1155369 m!1064475))

(declare-fun m!1064477 () Bool)

(assert (=> bm!54858 m!1064477))

(declare-fun m!1064479 () Bool)

(assert (=> start!98834 m!1064479))

(declare-fun m!1064481 () Bool)

(assert (=> start!98834 m!1064481))

(declare-fun m!1064483 () Bool)

(assert (=> b!1155362 m!1064483))

(declare-fun m!1064485 () Bool)

(assert (=> bm!54862 m!1064485))

(declare-fun m!1064487 () Bool)

(assert (=> b!1155380 m!1064487))

(declare-fun m!1064489 () Bool)

(assert (=> b!1155367 m!1064489))

(declare-fun m!1064491 () Bool)

(assert (=> b!1155367 m!1064491))

(declare-fun m!1064493 () Bool)

(assert (=> b!1155367 m!1064493))

(declare-fun m!1064495 () Bool)

(assert (=> b!1155378 m!1064495))

(declare-fun m!1064497 () Bool)

(assert (=> b!1155372 m!1064497))

(declare-fun m!1064499 () Bool)

(assert (=> b!1155372 m!1064499))

(declare-fun m!1064501 () Bool)

(assert (=> b!1155372 m!1064501))

(declare-fun m!1064503 () Bool)

(assert (=> b!1155372 m!1064503))

(declare-fun m!1064505 () Bool)

(assert (=> b!1155372 m!1064505))

(assert (=> b!1155372 m!1064499))

(assert (=> b!1155372 m!1064503))

(declare-fun m!1064507 () Bool)

(assert (=> b!1155372 m!1064507))

(declare-fun m!1064509 () Bool)

(assert (=> b!1155372 m!1064509))

(declare-fun m!1064511 () Bool)

(assert (=> b!1155372 m!1064511))

(assert (=> b!1155372 m!1064503))

(assert (=> b!1155372 m!1064509))

(declare-fun m!1064513 () Bool)

(assert (=> b!1155372 m!1064513))

(declare-fun m!1064515 () Bool)

(assert (=> b!1155384 m!1064515))

(declare-fun m!1064517 () Bool)

(assert (=> bm!54856 m!1064517))

(declare-fun m!1064519 () Bool)

(assert (=> b!1155365 m!1064519))

(declare-fun m!1064521 () Bool)

(assert (=> b!1155365 m!1064521))

(declare-fun m!1064523 () Bool)

(assert (=> b!1155360 m!1064523))

(declare-fun m!1064525 () Bool)

(assert (=> b!1155381 m!1064525))

(declare-fun m!1064527 () Bool)

(assert (=> b!1155381 m!1064527))

(declare-fun m!1064529 () Bool)

(assert (=> b!1155381 m!1064529))

(declare-fun m!1064531 () Bool)

(assert (=> b!1155381 m!1064531))

(assert (=> b!1155358 m!1064523))

(declare-fun m!1064533 () Bool)

(assert (=> b!1155376 m!1064533))

(declare-fun m!1064535 () Bool)

(assert (=> b!1155361 m!1064535))

(assert (=> bm!54861 m!1064497))

(declare-fun m!1064537 () Bool)

(assert (=> b!1155366 m!1064537))

(assert (=> b!1155370 m!1064503))

(declare-fun m!1064539 () Bool)

(assert (=> b!1155370 m!1064539))

(declare-fun m!1064541 () Bool)

(assert (=> b!1155377 m!1064541))

(declare-fun m!1064543 () Bool)

(assert (=> b!1155377 m!1064543))

(declare-fun m!1064545 () Bool)

(assert (=> b!1155377 m!1064545))

(declare-fun m!1064547 () Bool)

(assert (=> b!1155377 m!1064547))

(declare-fun m!1064549 () Bool)

(assert (=> mapNonEmpty!45287 m!1064549))

(assert (=> bm!54863 m!1064515))

(check-sat (not b!1155378) (not bm!54861) (not b_next!24445) (not mapNonEmpty!45287) (not b!1155376) (not b!1155367) (not b!1155362) (not bm!54863) (not b!1155366) (not b!1155360) (not b!1155387) (not b!1155361) (not b!1155365) (not bm!54858) (not bm!54856) b_and!39719 (not b!1155377) (not b!1155372) (not bm!54862) (not b!1155384) (not start!98834) (not b!1155370) (not b!1155380) (not b!1155358) (not b!1155381) tp_is_empty!28975 (not b_lambda!19533))
(check-sat b_and!39719 (not b_next!24445))
