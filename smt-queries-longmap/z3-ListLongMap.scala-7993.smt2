; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98792 () Bool)

(assert start!98792)

(declare-fun b_free!24403 () Bool)

(declare-fun b_next!24403 () Bool)

(assert (=> start!98792 (= b_free!24403 (not b_next!24403))))

(declare-fun tp!85919 () Bool)

(declare-fun b_and!39633 () Bool)

(assert (=> start!98792 (= tp!85919 b_and!39633)))

(declare-fun res!766675 () Bool)

(declare-fun e!655985 () Bool)

(assert (=> start!98792 (=> (not res!766675) (not e!655985))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74630 0))(
  ( (array!74631 (arr!35966 (Array (_ BitVec 32) (_ BitVec 64))) (size!36504 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74630)

(assert (=> start!98792 (= res!766675 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36504 _keys!1208))))))

(assert (=> start!98792 e!655985))

(declare-fun tp_is_empty!28933 () Bool)

(assert (=> start!98792 tp_is_empty!28933))

(declare-fun array_inv!27634 (array!74630) Bool)

(assert (=> start!98792 (array_inv!27634 _keys!1208)))

(assert (=> start!98792 true))

(assert (=> start!98792 tp!85919))

(declare-datatypes ((V!43705 0))(
  ( (V!43706 (val!14523 Int)) )
))
(declare-datatypes ((ValueCell!13757 0))(
  ( (ValueCellFull!13757 (v!17159 V!43705)) (EmptyCell!13757) )
))
(declare-datatypes ((array!74632 0))(
  ( (array!74633 (arr!35967 (Array (_ BitVec 32) ValueCell!13757)) (size!36505 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74632)

(declare-fun e!655996 () Bool)

(declare-fun array_inv!27635 (array!74632) Bool)

(assert (=> start!98792 (and (array_inv!27635 _values!996) e!655996)))

(declare-fun mapIsEmpty!45224 () Bool)

(declare-fun mapRes!45224 () Bool)

(assert (=> mapIsEmpty!45224 mapRes!45224))

(declare-fun b!1153426 () Bool)

(declare-fun e!655987 () Bool)

(declare-fun e!655998 () Bool)

(assert (=> b!1153426 (= e!655987 (not e!655998))))

(declare-fun res!766682 () Bool)

(assert (=> b!1153426 (=> res!766682 e!655998)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1153426 (= res!766682 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!74630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1153426 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!37796 0))(
  ( (Unit!37797) )
))
(declare-fun lt!516861 () Unit!37796)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74630 (_ BitVec 64) (_ BitVec 32)) Unit!37796)

(assert (=> b!1153426 (= lt!516861 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1153427 () Bool)

(declare-fun res!766672 () Bool)

(assert (=> b!1153427 (=> (not res!766672) (not e!655985))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74630 (_ BitVec 32)) Bool)

(assert (=> b!1153427 (= res!766672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1153428 () Bool)

(declare-fun e!655991 () Unit!37796)

(declare-fun lt!516841 () Unit!37796)

(assert (=> b!1153428 (= e!655991 lt!516841)))

(declare-fun call!54358 () Unit!37796)

(assert (=> b!1153428 (= lt!516841 call!54358)))

(declare-fun call!54362 () Bool)

(assert (=> b!1153428 call!54362))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!516850 () array!74630)

(declare-fun bm!54352 () Bool)

(declare-fun minValue!944 () V!43705)

(declare-fun zeroValue!944 () V!43705)

(declare-datatypes ((tuple2!18530 0))(
  ( (tuple2!18531 (_1!9276 (_ BitVec 64)) (_2!9276 V!43705)) )
))
(declare-datatypes ((List!25260 0))(
  ( (Nil!25257) (Cons!25256 (h!26465 tuple2!18530) (t!36646 List!25260)) )
))
(declare-datatypes ((ListLongMap!16499 0))(
  ( (ListLongMap!16500 (toList!8265 List!25260)) )
))
(declare-fun call!54355 () ListLongMap!16499)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!516844 () array!74632)

(declare-fun getCurrentListMapNoExtraKeys!4747 (array!74630 array!74632 (_ BitVec 32) (_ BitVec 32) V!43705 V!43705 (_ BitVec 32) Int) ListLongMap!16499)

(assert (=> bm!54352 (= call!54355 (getCurrentListMapNoExtraKeys!4747 lt!516850 lt!516844 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153429 () Bool)

(declare-fun c!114459 () Bool)

(declare-fun lt!516842 () Bool)

(assert (=> b!1153429 (= c!114459 (and (not lt!516842) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!655993 () Unit!37796)

(assert (=> b!1153429 (= e!655993 e!655991)))

(declare-fun call!54359 () Unit!37796)

(declare-fun lt!516860 () ListLongMap!16499)

(declare-fun c!114462 () Bool)

(declare-fun bm!54353 () Bool)

(declare-fun lt!516859 () ListLongMap!16499)

(declare-fun addStillContains!888 (ListLongMap!16499 (_ BitVec 64) V!43705 (_ BitVec 64)) Unit!37796)

(assert (=> bm!54353 (= call!54359 (addStillContains!888 (ite c!114462 lt!516859 lt!516860) (ite c!114462 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114459 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114462 minValue!944 (ite c!114459 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1153430 () Bool)

(declare-fun e!655989 () Bool)

(assert (=> b!1153430 (= e!655989 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153431 () Bool)

(declare-fun e!655983 () Unit!37796)

(assert (=> b!1153431 (= e!655991 e!655983)))

(declare-fun c!114461 () Bool)

(assert (=> b!1153431 (= c!114461 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!516842))))

(declare-fun b!1153432 () Bool)

(declare-fun res!766670 () Bool)

(assert (=> b!1153432 (=> (not res!766670) (not e!655985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1153432 (= res!766670 (validMask!0 mask!1564))))

(declare-fun bm!54354 () Bool)

(declare-fun call!54360 () Bool)

(assert (=> bm!54354 (= call!54362 call!54360)))

(declare-fun b!1153433 () Bool)

(declare-fun e!655994 () Bool)

(assert (=> b!1153433 (= e!655994 true)))

(declare-fun e!655984 () Bool)

(assert (=> b!1153433 e!655984))

(declare-fun res!766676 () Bool)

(assert (=> b!1153433 (=> (not res!766676) (not e!655984))))

(declare-fun lt!516856 () ListLongMap!16499)

(assert (=> b!1153433 (= res!766676 (= lt!516856 lt!516860))))

(declare-fun lt!516858 () ListLongMap!16499)

(declare-fun -!1326 (ListLongMap!16499 (_ BitVec 64)) ListLongMap!16499)

(assert (=> b!1153433 (= lt!516856 (-!1326 lt!516858 k0!934))))

(declare-fun lt!516847 () V!43705)

(declare-fun +!3677 (ListLongMap!16499 tuple2!18530) ListLongMap!16499)

(assert (=> b!1153433 (= (-!1326 (+!3677 lt!516860 (tuple2!18531 (select (arr!35966 _keys!1208) from!1455) lt!516847)) (select (arr!35966 _keys!1208) from!1455)) lt!516860)))

(declare-fun lt!516853 () Unit!37796)

(declare-fun addThenRemoveForNewKeyIsSame!180 (ListLongMap!16499 (_ BitVec 64) V!43705) Unit!37796)

(assert (=> b!1153433 (= lt!516853 (addThenRemoveForNewKeyIsSame!180 lt!516860 (select (arr!35966 _keys!1208) from!1455) lt!516847))))

(declare-fun lt!516845 () V!43705)

(declare-fun get!18328 (ValueCell!13757 V!43705) V!43705)

(assert (=> b!1153433 (= lt!516847 (get!18328 (select (arr!35967 _values!996) from!1455) lt!516845))))

(declare-fun lt!516854 () Unit!37796)

(declare-fun e!655992 () Unit!37796)

(assert (=> b!1153433 (= lt!516854 e!655992)))

(declare-fun c!114460 () Bool)

(declare-fun contains!6718 (ListLongMap!16499 (_ BitVec 64)) Bool)

(assert (=> b!1153433 (= c!114460 (contains!6718 lt!516860 k0!934))))

(assert (=> b!1153433 (= lt!516860 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!655982 () Bool)

(declare-fun b!1153434 () Bool)

(assert (=> b!1153434 (= e!655982 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1153435 () Bool)

(assert (=> b!1153435 (= e!655985 e!655987)))

(declare-fun res!766678 () Bool)

(assert (=> b!1153435 (=> (not res!766678) (not e!655987))))

(assert (=> b!1153435 (= res!766678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!516850 mask!1564))))

(assert (=> b!1153435 (= lt!516850 (array!74631 (store (arr!35966 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36504 _keys!1208)))))

(declare-fun b!1153436 () Bool)

(declare-fun call!54361 () ListLongMap!16499)

(declare-fun e!655990 () Bool)

(assert (=> b!1153436 (= e!655990 (= call!54355 (-!1326 call!54361 k0!934)))))

(declare-fun bm!54355 () Bool)

(assert (=> bm!54355 (= call!54361 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153437 () Bool)

(declare-fun e!655995 () Bool)

(assert (=> b!1153437 (= e!655995 tp_is_empty!28933)))

(declare-fun b!1153438 () Bool)

(assert (=> b!1153438 (= e!655996 (and e!655995 mapRes!45224))))

(declare-fun condMapEmpty!45224 () Bool)

(declare-fun mapDefault!45224 () ValueCell!13757)

(assert (=> b!1153438 (= condMapEmpty!45224 (= (arr!35967 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13757)) mapDefault!45224)))))

(declare-fun b!1153439 () Bool)

(declare-fun res!766673 () Bool)

(assert (=> b!1153439 (=> (not res!766673) (not e!655985))))

(declare-datatypes ((List!25261 0))(
  ( (Nil!25258) (Cons!25257 (h!26466 (_ BitVec 64)) (t!36647 List!25261)) )
))
(declare-fun arrayNoDuplicates!0 (array!74630 (_ BitVec 32) List!25261) Bool)

(assert (=> b!1153439 (= res!766673 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25258))))

(declare-fun mapNonEmpty!45224 () Bool)

(declare-fun tp!85920 () Bool)

(declare-fun e!655997 () Bool)

(assert (=> mapNonEmpty!45224 (= mapRes!45224 (and tp!85920 e!655997))))

(declare-fun mapRest!45224 () (Array (_ BitVec 32) ValueCell!13757))

(declare-fun mapKey!45224 () (_ BitVec 32))

(declare-fun mapValue!45224 () ValueCell!13757)

(assert (=> mapNonEmpty!45224 (= (arr!35967 _values!996) (store mapRest!45224 mapKey!45224 mapValue!45224))))

(declare-fun b!1153440 () Bool)

(declare-fun e!655988 () Bool)

(assert (=> b!1153440 (= e!655988 e!655994)))

(declare-fun res!766671 () Bool)

(assert (=> b!1153440 (=> res!766671 e!655994)))

(assert (=> b!1153440 (= res!766671 (not (= (select (arr!35966 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1153440 e!655990))

(declare-fun c!114463 () Bool)

(assert (=> b!1153440 (= c!114463 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!516857 () Unit!37796)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!599 (array!74630 array!74632 (_ BitVec 32) (_ BitVec 32) V!43705 V!43705 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37796)

(assert (=> b!1153440 (= lt!516857 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!599 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1153441 () Bool)

(declare-fun res!766677 () Bool)

(assert (=> b!1153441 (=> (not res!766677) (not e!655985))))

(assert (=> b!1153441 (= res!766677 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36504 _keys!1208))))))

(declare-fun call!54356 () ListLongMap!16499)

(declare-fun bm!54356 () Bool)

(assert (=> bm!54356 (= call!54356 (+!3677 (ite c!114462 lt!516859 lt!516860) (ite c!114462 (tuple2!18531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114459 (tuple2!18531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1153442 () Bool)

(assert (=> b!1153442 (= e!655998 e!655988)))

(declare-fun res!766681 () Bool)

(assert (=> b!1153442 (=> res!766681 e!655988)))

(assert (=> b!1153442 (= res!766681 (not (= from!1455 i!673)))))

(declare-fun lt!516855 () ListLongMap!16499)

(assert (=> b!1153442 (= lt!516855 (getCurrentListMapNoExtraKeys!4747 lt!516850 lt!516844 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1153442 (= lt!516844 (array!74633 (store (arr!35967 _values!996) i!673 (ValueCellFull!13757 lt!516845)) (size!36505 _values!996)))))

(declare-fun dynLambda!2707 (Int (_ BitVec 64)) V!43705)

(assert (=> b!1153442 (= lt!516845 (dynLambda!2707 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1153442 (= lt!516858 (getCurrentListMapNoExtraKeys!4747 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1153443 () Bool)

(assert (=> b!1153443 (= e!655984 (= lt!516856 (getCurrentListMapNoExtraKeys!4747 lt!516850 lt!516844 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1153444 () Bool)

(assert (=> b!1153444 (contains!6718 call!54356 k0!934)))

(declare-fun lt!516851 () Unit!37796)

(assert (=> b!1153444 (= lt!516851 call!54359)))

(assert (=> b!1153444 call!54360))

(assert (=> b!1153444 (= lt!516859 (+!3677 lt!516860 (tuple2!18531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!516843 () Unit!37796)

(assert (=> b!1153444 (= lt!516843 (addStillContains!888 lt!516860 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1153444 (= e!655993 lt!516851)))

(declare-fun bm!54357 () Bool)

(declare-fun call!54357 () ListLongMap!16499)

(assert (=> bm!54357 (= call!54360 (contains!6718 (ite c!114462 lt!516859 call!54357) k0!934))))

(declare-fun bm!54358 () Bool)

(assert (=> bm!54358 (= call!54358 call!54359)))

(declare-fun b!1153445 () Bool)

(assert (=> b!1153445 (= e!655997 tp_is_empty!28933)))

(declare-fun b!1153446 () Bool)

(declare-fun res!766669 () Bool)

(assert (=> b!1153446 (=> (not res!766669) (not e!655985))))

(assert (=> b!1153446 (= res!766669 (= (select (arr!35966 _keys!1208) i!673) k0!934))))

(declare-fun b!1153447 () Bool)

(declare-fun Unit!37798 () Unit!37796)

(assert (=> b!1153447 (= e!655983 Unit!37798)))

(declare-fun b!1153448 () Bool)

(declare-fun res!766674 () Bool)

(assert (=> b!1153448 (=> (not res!766674) (not e!655985))))

(assert (=> b!1153448 (= res!766674 (and (= (size!36505 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36504 _keys!1208) (size!36505 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1153449 () Bool)

(assert (=> b!1153449 call!54362))

(declare-fun lt!516846 () Unit!37796)

(assert (=> b!1153449 (= lt!516846 call!54358)))

(assert (=> b!1153449 (= e!655983 lt!516846)))

(declare-fun b!1153450 () Bool)

(declare-fun Unit!37799 () Unit!37796)

(assert (=> b!1153450 (= e!655992 Unit!37799)))

(assert (=> b!1153450 (= lt!516842 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1153450 (= c!114462 (and (not lt!516842) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!516848 () Unit!37796)

(assert (=> b!1153450 (= lt!516848 e!655993)))

(declare-fun lt!516849 () Unit!37796)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!476 (array!74630 array!74632 (_ BitVec 32) (_ BitVec 32) V!43705 V!43705 (_ BitVec 64) (_ BitVec 32) Int) Unit!37796)

(assert (=> b!1153450 (= lt!516849 (lemmaListMapContainsThenArrayContainsFrom!476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114464 () Bool)

(assert (=> b!1153450 (= c!114464 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!766668 () Bool)

(assert (=> b!1153450 (= res!766668 e!655989)))

(assert (=> b!1153450 (=> (not res!766668) (not e!655982))))

(assert (=> b!1153450 e!655982))

(declare-fun lt!516840 () Unit!37796)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74630 (_ BitVec 32) (_ BitVec 32)) Unit!37796)

(assert (=> b!1153450 (= lt!516840 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1153450 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25258)))

(declare-fun lt!516852 () Unit!37796)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74630 (_ BitVec 64) (_ BitVec 32) List!25261) Unit!37796)

(assert (=> b!1153450 (= lt!516852 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25258))))

(assert (=> b!1153450 false))

(declare-fun b!1153451 () Bool)

(declare-fun res!766679 () Bool)

(assert (=> b!1153451 (=> (not res!766679) (not e!655987))))

(assert (=> b!1153451 (= res!766679 (arrayNoDuplicates!0 lt!516850 #b00000000000000000000000000000000 Nil!25258))))

(declare-fun bm!54359 () Bool)

(assert (=> bm!54359 (= call!54357 call!54356)))

(declare-fun b!1153452 () Bool)

(declare-fun res!766680 () Bool)

(assert (=> b!1153452 (=> (not res!766680) (not e!655985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1153452 (= res!766680 (validKeyInArray!0 k0!934))))

(declare-fun b!1153453 () Bool)

(assert (=> b!1153453 (= e!655990 (= call!54355 call!54361))))

(declare-fun b!1153454 () Bool)

(declare-fun Unit!37800 () Unit!37796)

(assert (=> b!1153454 (= e!655992 Unit!37800)))

(declare-fun b!1153455 () Bool)

(assert (=> b!1153455 (= e!655989 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!516842) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!98792 res!766675) b!1153432))

(assert (= (and b!1153432 res!766670) b!1153448))

(assert (= (and b!1153448 res!766674) b!1153427))

(assert (= (and b!1153427 res!766672) b!1153439))

(assert (= (and b!1153439 res!766673) b!1153441))

(assert (= (and b!1153441 res!766677) b!1153452))

(assert (= (and b!1153452 res!766680) b!1153446))

(assert (= (and b!1153446 res!766669) b!1153435))

(assert (= (and b!1153435 res!766678) b!1153451))

(assert (= (and b!1153451 res!766679) b!1153426))

(assert (= (and b!1153426 (not res!766682)) b!1153442))

(assert (= (and b!1153442 (not res!766681)) b!1153440))

(assert (= (and b!1153440 c!114463) b!1153436))

(assert (= (and b!1153440 (not c!114463)) b!1153453))

(assert (= (or b!1153436 b!1153453) bm!54352))

(assert (= (or b!1153436 b!1153453) bm!54355))

(assert (= (and b!1153440 (not res!766671)) b!1153433))

(assert (= (and b!1153433 c!114460) b!1153450))

(assert (= (and b!1153433 (not c!114460)) b!1153454))

(assert (= (and b!1153450 c!114462) b!1153444))

(assert (= (and b!1153450 (not c!114462)) b!1153429))

(assert (= (and b!1153429 c!114459) b!1153428))

(assert (= (and b!1153429 (not c!114459)) b!1153431))

(assert (= (and b!1153431 c!114461) b!1153449))

(assert (= (and b!1153431 (not c!114461)) b!1153447))

(assert (= (or b!1153428 b!1153449) bm!54358))

(assert (= (or b!1153428 b!1153449) bm!54359))

(assert (= (or b!1153428 b!1153449) bm!54354))

(assert (= (or b!1153444 bm!54354) bm!54357))

(assert (= (or b!1153444 bm!54358) bm!54353))

(assert (= (or b!1153444 bm!54359) bm!54356))

(assert (= (and b!1153450 c!114464) b!1153430))

(assert (= (and b!1153450 (not c!114464)) b!1153455))

(assert (= (and b!1153450 res!766668) b!1153434))

(assert (= (and b!1153433 res!766676) b!1153443))

(assert (= (and b!1153438 condMapEmpty!45224) mapIsEmpty!45224))

(assert (= (and b!1153438 (not condMapEmpty!45224)) mapNonEmpty!45224))

(get-info :version)

(assert (= (and mapNonEmpty!45224 ((_ is ValueCellFull!13757) mapValue!45224)) b!1153445))

(assert (= (and b!1153438 ((_ is ValueCellFull!13757) mapDefault!45224)) b!1153437))

(assert (= start!98792 b!1153438))

(declare-fun b_lambda!19491 () Bool)

(assert (=> (not b_lambda!19491) (not b!1153442)))

(declare-fun t!36645 () Bool)

(declare-fun tb!9207 () Bool)

(assert (=> (and start!98792 (= defaultEntry!1004 defaultEntry!1004) t!36645) tb!9207))

(declare-fun result!18987 () Bool)

(assert (=> tb!9207 (= result!18987 tp_is_empty!28933)))

(assert (=> b!1153442 t!36645))

(declare-fun b_and!39635 () Bool)

(assert (= b_and!39633 (and (=> t!36645 result!18987) b_and!39635)))

(declare-fun m!1062787 () Bool)

(assert (=> bm!54356 m!1062787))

(declare-fun m!1062789 () Bool)

(assert (=> b!1153439 m!1062789))

(declare-fun m!1062791 () Bool)

(assert (=> b!1153444 m!1062791))

(declare-fun m!1062793 () Bool)

(assert (=> b!1153444 m!1062793))

(declare-fun m!1062795 () Bool)

(assert (=> b!1153444 m!1062795))

(declare-fun m!1062797 () Bool)

(assert (=> b!1153430 m!1062797))

(declare-fun m!1062799 () Bool)

(assert (=> b!1153452 m!1062799))

(declare-fun m!1062801 () Bool)

(assert (=> b!1153451 m!1062801))

(declare-fun m!1062803 () Bool)

(assert (=> b!1153433 m!1062803))

(declare-fun m!1062805 () Bool)

(assert (=> b!1153433 m!1062805))

(declare-fun m!1062807 () Bool)

(assert (=> b!1153433 m!1062807))

(declare-fun m!1062809 () Bool)

(assert (=> b!1153433 m!1062809))

(declare-fun m!1062811 () Bool)

(assert (=> b!1153433 m!1062811))

(assert (=> b!1153433 m!1062807))

(declare-fun m!1062813 () Bool)

(assert (=> b!1153433 m!1062813))

(declare-fun m!1062815 () Bool)

(assert (=> b!1153433 m!1062815))

(assert (=> b!1153433 m!1062805))

(assert (=> b!1153433 m!1062807))

(declare-fun m!1062817 () Bool)

(assert (=> b!1153433 m!1062817))

(declare-fun m!1062819 () Bool)

(assert (=> b!1153433 m!1062819))

(assert (=> b!1153433 m!1062817))

(declare-fun m!1062821 () Bool)

(assert (=> b!1153443 m!1062821))

(declare-fun m!1062823 () Bool)

(assert (=> b!1153450 m!1062823))

(declare-fun m!1062825 () Bool)

(assert (=> b!1153450 m!1062825))

(declare-fun m!1062827 () Bool)

(assert (=> b!1153450 m!1062827))

(declare-fun m!1062829 () Bool)

(assert (=> b!1153450 m!1062829))

(declare-fun m!1062831 () Bool)

(assert (=> b!1153436 m!1062831))

(assert (=> bm!54352 m!1062821))

(assert (=> bm!54355 m!1062803))

(assert (=> b!1153440 m!1062807))

(declare-fun m!1062833 () Bool)

(assert (=> b!1153440 m!1062833))

(declare-fun m!1062835 () Bool)

(assert (=> b!1153446 m!1062835))

(declare-fun m!1062837 () Bool)

(assert (=> b!1153442 m!1062837))

(declare-fun m!1062839 () Bool)

(assert (=> b!1153442 m!1062839))

(declare-fun m!1062841 () Bool)

(assert (=> b!1153442 m!1062841))

(declare-fun m!1062843 () Bool)

(assert (=> b!1153442 m!1062843))

(declare-fun m!1062845 () Bool)

(assert (=> bm!54357 m!1062845))

(declare-fun m!1062847 () Bool)

(assert (=> b!1153435 m!1062847))

(declare-fun m!1062849 () Bool)

(assert (=> b!1153435 m!1062849))

(assert (=> b!1153434 m!1062797))

(declare-fun m!1062851 () Bool)

(assert (=> start!98792 m!1062851))

(declare-fun m!1062853 () Bool)

(assert (=> start!98792 m!1062853))

(declare-fun m!1062855 () Bool)

(assert (=> b!1153432 m!1062855))

(declare-fun m!1062857 () Bool)

(assert (=> b!1153426 m!1062857))

(declare-fun m!1062859 () Bool)

(assert (=> b!1153426 m!1062859))

(declare-fun m!1062861 () Bool)

(assert (=> b!1153427 m!1062861))

(declare-fun m!1062863 () Bool)

(assert (=> mapNonEmpty!45224 m!1062863))

(declare-fun m!1062865 () Bool)

(assert (=> bm!54353 m!1062865))

(check-sat (not b!1153439) (not b_next!24403) (not b!1153440) b_and!39635 (not b!1153444) (not bm!54352) (not b!1153435) (not start!98792) (not b!1153434) (not b!1153430) (not b_lambda!19491) (not bm!54353) (not bm!54357) (not b!1153432) (not b!1153442) (not b!1153427) (not mapNonEmpty!45224) tp_is_empty!28933 (not b!1153433) (not b!1153426) (not b!1153452) (not b!1153450) (not bm!54356) (not b!1153436) (not b!1153443) (not b!1153451) (not bm!54355))
(check-sat b_and!39635 (not b_next!24403))
