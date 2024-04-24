; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98902 () Bool)

(assert start!98902)

(declare-fun b_free!24271 () Bool)

(declare-fun b_next!24271 () Bool)

(assert (=> start!98902 (= b_free!24271 (not b_next!24271))))

(declare-fun tp!85523 () Bool)

(declare-fun b_and!39393 () Bool)

(assert (=> start!98902 (= tp!85523 b_and!39393)))

(declare-fun mapNonEmpty!45026 () Bool)

(declare-fun mapRes!45026 () Bool)

(declare-fun tp!85524 () Bool)

(declare-fun e!653534 () Bool)

(assert (=> mapNonEmpty!45026 (= mapRes!45026 (and tp!85524 e!653534))))

(declare-datatypes ((V!43529 0))(
  ( (V!43530 (val!14457 Int)) )
))
(declare-datatypes ((ValueCell!13691 0))(
  ( (ValueCellFull!13691 (v!17090 V!43529)) (EmptyCell!13691) )
))
(declare-fun mapRest!45026 () (Array (_ BitVec 32) ValueCell!13691))

(declare-fun mapValue!45026 () ValueCell!13691)

(declare-datatypes ((array!74497 0))(
  ( (array!74498 (arr!35893 (Array (_ BitVec 32) ValueCell!13691)) (size!36430 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74497)

(declare-fun mapKey!45026 () (_ BitVec 32))

(assert (=> mapNonEmpty!45026 (= (arr!35893 _values!996) (store mapRest!45026 mapKey!45026 mapValue!45026))))

(declare-fun b!1148767 () Bool)

(declare-datatypes ((Unit!37676 0))(
  ( (Unit!37677) )
))
(declare-fun e!653530 () Unit!37676)

(declare-fun Unit!37678 () Unit!37676)

(assert (=> b!1148767 (= e!653530 Unit!37678)))

(declare-fun b!1148768 () Bool)

(declare-fun e!653541 () Unit!37676)

(declare-fun Unit!37679 () Unit!37676)

(assert (=> b!1148768 (= e!653541 Unit!37679)))

(declare-fun res!764272 () Bool)

(declare-fun e!653533 () Bool)

(assert (=> start!98902 (=> (not res!764272) (not e!653533))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74499 0))(
  ( (array!74500 (arr!35894 (Array (_ BitVec 32) (_ BitVec 64))) (size!36431 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74499)

(assert (=> start!98902 (= res!764272 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36431 _keys!1208))))))

(assert (=> start!98902 e!653533))

(declare-fun tp_is_empty!28801 () Bool)

(assert (=> start!98902 tp_is_empty!28801))

(declare-fun array_inv!27548 (array!74499) Bool)

(assert (=> start!98902 (array_inv!27548 _keys!1208)))

(assert (=> start!98902 true))

(assert (=> start!98902 tp!85523))

(declare-fun e!653532 () Bool)

(declare-fun array_inv!27549 (array!74497) Bool)

(assert (=> start!98902 (and (array_inv!27549 _values!996) e!653532)))

(declare-fun b!1148769 () Bool)

(declare-fun lt!513225 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun e!653542 () Bool)

(assert (=> b!1148769 (= e!653542 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513225) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1148770 () Bool)

(declare-fun e!653535 () Bool)

(declare-fun arrayContainsKey!0 (array!74499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1148770 (= e!653535 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!52856 () Bool)

(declare-fun call!52861 () Unit!37676)

(declare-fun call!52863 () Unit!37676)

(assert (=> bm!52856 (= call!52861 call!52863)))

(declare-fun b!1148771 () Bool)

(declare-fun e!653537 () Bool)

(declare-fun e!653526 () Bool)

(assert (=> b!1148771 (= e!653537 (not e!653526))))

(declare-fun res!764274 () Bool)

(assert (=> b!1148771 (=> res!764274 e!653526)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1148771 (= res!764274 (bvsgt from!1455 i!673))))

(assert (=> b!1148771 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513231 () Unit!37676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74499 (_ BitVec 64) (_ BitVec 32)) Unit!37676)

(assert (=> b!1148771 (= lt!513231 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1148772 () Bool)

(declare-fun res!764277 () Bool)

(assert (=> b!1148772 (=> (not res!764277) (not e!653533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1148772 (= res!764277 (validKeyInArray!0 k0!934))))

(declare-fun b!1148773 () Bool)

(declare-fun e!653529 () Bool)

(assert (=> b!1148773 (= e!653532 (and e!653529 mapRes!45026))))

(declare-fun condMapEmpty!45026 () Bool)

(declare-fun mapDefault!45026 () ValueCell!13691)

(assert (=> b!1148773 (= condMapEmpty!45026 (= (arr!35893 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13691)) mapDefault!45026)))))

(declare-fun zeroValue!944 () V!43529)

(declare-datatypes ((tuple2!18342 0))(
  ( (tuple2!18343 (_1!9182 (_ BitVec 64)) (_2!9182 V!43529)) )
))
(declare-datatypes ((List!25096 0))(
  ( (Nil!25093) (Cons!25092 (h!26310 tuple2!18342) (t!36351 List!25096)) )
))
(declare-datatypes ((ListLongMap!16319 0))(
  ( (ListLongMap!16320 (toList!8175 List!25096)) )
))
(declare-fun call!52859 () ListLongMap!16319)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!52857 () Bool)

(declare-fun minValue!944 () V!43529)

(declare-fun getCurrentListMapNoExtraKeys!4678 (array!74499 array!74497 (_ BitVec 32) (_ BitVec 32) V!43529 V!43529 (_ BitVec 32) Int) ListLongMap!16319)

(assert (=> bm!52857 (= call!52859 (getCurrentListMapNoExtraKeys!4678 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148774 () Bool)

(assert (=> b!1148774 (= e!653542 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1148775 () Bool)

(declare-fun res!764282 () Bool)

(assert (=> b!1148775 (=> (not res!764282) (not e!653537))))

(declare-fun lt!513220 () array!74499)

(declare-datatypes ((List!25097 0))(
  ( (Nil!25094) (Cons!25093 (h!26311 (_ BitVec 64)) (t!36352 List!25097)) )
))
(declare-fun arrayNoDuplicates!0 (array!74499 (_ BitVec 32) List!25097) Bool)

(assert (=> b!1148775 (= res!764282 (arrayNoDuplicates!0 lt!513220 #b00000000000000000000000000000000 Nil!25094))))

(declare-fun c!113697 () Bool)

(declare-fun call!52862 () ListLongMap!16319)

(declare-fun c!113696 () Bool)

(declare-fun bm!52858 () Bool)

(declare-fun lt!513218 () ListLongMap!16319)

(declare-fun +!3615 (ListLongMap!16319 tuple2!18342) ListLongMap!16319)

(assert (=> bm!52858 (= call!52862 (+!3615 lt!513218 (ite (or c!113696 c!113697) (tuple2!18343 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1148776 () Bool)

(assert (=> b!1148776 (= e!653533 e!653537)))

(declare-fun res!764280 () Bool)

(assert (=> b!1148776 (=> (not res!764280) (not e!653537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74499 (_ BitVec 32)) Bool)

(assert (=> b!1148776 (= res!764280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513220 mask!1564))))

(assert (=> b!1148776 (= lt!513220 (array!74500 (store (arr!35894 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36431 _keys!1208)))))

(declare-fun e!653528 () Bool)

(declare-fun call!52865 () ListLongMap!16319)

(declare-fun b!1148777 () Bool)

(declare-fun -!1300 (ListLongMap!16319 (_ BitVec 64)) ListLongMap!16319)

(assert (=> b!1148777 (= e!653528 (= call!52865 (-!1300 call!52859 k0!934)))))

(declare-fun lt!513219 () array!74497)

(declare-fun bm!52859 () Bool)

(assert (=> bm!52859 (= call!52865 (getCurrentListMapNoExtraKeys!4678 lt!513220 lt!513219 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!52860 () ListLongMap!16319)

(declare-fun lt!513221 () ListLongMap!16319)

(declare-fun bm!52860 () Bool)

(declare-fun call!52864 () Bool)

(declare-fun contains!6713 (ListLongMap!16319 (_ BitVec 64)) Bool)

(assert (=> bm!52860 (= call!52864 (contains!6713 (ite c!113696 lt!513221 call!52860) k0!934))))

(declare-fun b!1148778 () Bool)

(declare-fun call!52866 () Bool)

(assert (=> b!1148778 call!52866))

(declare-fun lt!513217 () Unit!37676)

(assert (=> b!1148778 (= lt!513217 call!52861)))

(assert (=> b!1148778 (= e!653541 lt!513217)))

(declare-fun b!1148779 () Bool)

(declare-fun res!764275 () Bool)

(assert (=> b!1148779 (=> (not res!764275) (not e!653533))))

(assert (=> b!1148779 (= res!764275 (and (= (size!36430 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36431 _keys!1208) (size!36430 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1148780 () Bool)

(declare-fun Unit!37680 () Unit!37676)

(assert (=> b!1148780 (= e!653530 Unit!37680)))

(assert (=> b!1148780 (= lt!513225 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1148780 (= c!113696 (and (not lt!513225) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513213 () Unit!37676)

(declare-fun e!653527 () Unit!37676)

(assert (=> b!1148780 (= lt!513213 e!653527)))

(declare-fun lt!513227 () Unit!37676)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!437 (array!74499 array!74497 (_ BitVec 32) (_ BitVec 32) V!43529 V!43529 (_ BitVec 64) (_ BitVec 32) Int) Unit!37676)

(assert (=> b!1148780 (= lt!513227 (lemmaListMapContainsThenArrayContainsFrom!437 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113699 () Bool)

(assert (=> b!1148780 (= c!113699 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764283 () Bool)

(assert (=> b!1148780 (= res!764283 e!653542)))

(assert (=> b!1148780 (=> (not res!764283) (not e!653535))))

(assert (=> b!1148780 e!653535))

(declare-fun lt!513224 () Unit!37676)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74499 (_ BitVec 32) (_ BitVec 32)) Unit!37676)

(assert (=> b!1148780 (= lt!513224 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1148780 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25094)))

(declare-fun lt!513223 () Unit!37676)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74499 (_ BitVec 64) (_ BitVec 32) List!25097) Unit!37676)

(assert (=> b!1148780 (= lt!513223 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25094))))

(assert (=> b!1148780 false))

(declare-fun bm!52861 () Bool)

(declare-fun addStillContains!841 (ListLongMap!16319 (_ BitVec 64) V!43529 (_ BitVec 64)) Unit!37676)

(assert (=> bm!52861 (= call!52863 (addStillContains!841 lt!513218 (ite (or c!113696 c!113697) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113696 c!113697) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1148781 () Bool)

(assert (=> b!1148781 (= e!653528 (= call!52865 call!52859))))

(declare-fun bm!52862 () Bool)

(assert (=> bm!52862 (= call!52866 call!52864)))

(declare-fun b!1148782 () Bool)

(declare-fun e!653539 () Bool)

(declare-fun e!653536 () Bool)

(assert (=> b!1148782 (= e!653539 e!653536)))

(declare-fun res!764285 () Bool)

(assert (=> b!1148782 (=> res!764285 e!653536)))

(assert (=> b!1148782 (= res!764285 (not (= (select (arr!35894 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1148782 e!653528))

(declare-fun c!113698 () Bool)

(assert (=> b!1148782 (= c!113698 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513226 () Unit!37676)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!545 (array!74499 array!74497 (_ BitVec 32) (_ BitVec 32) V!43529 V!43529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37676)

(assert (=> b!1148782 (= lt!513226 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!545 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1148783 () Bool)

(declare-fun res!764284 () Bool)

(assert (=> b!1148783 (=> (not res!764284) (not e!653533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1148783 (= res!764284 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45026 () Bool)

(assert (=> mapIsEmpty!45026 mapRes!45026))

(declare-fun b!1148784 () Bool)

(assert (=> b!1148784 (contains!6713 (+!3615 lt!513221 (tuple2!18343 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!513222 () Unit!37676)

(assert (=> b!1148784 (= lt!513222 (addStillContains!841 lt!513221 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1148784 call!52864))

(assert (=> b!1148784 (= lt!513221 call!52862)))

(declare-fun lt!513228 () Unit!37676)

(assert (=> b!1148784 (= lt!513228 call!52863)))

(assert (=> b!1148784 (= e!653527 lt!513222)))

(declare-fun b!1148785 () Bool)

(declare-fun e!653538 () Unit!37676)

(assert (=> b!1148785 (= e!653538 e!653541)))

(declare-fun c!113700 () Bool)

(assert (=> b!1148785 (= c!113700 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513225))))

(declare-fun b!1148786 () Bool)

(assert (=> b!1148786 (= e!653534 tp_is_empty!28801)))

(declare-fun b!1148787 () Bool)

(declare-fun res!764281 () Bool)

(assert (=> b!1148787 (=> (not res!764281) (not e!653533))))

(assert (=> b!1148787 (= res!764281 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25094))))

(declare-fun b!1148788 () Bool)

(declare-fun res!764276 () Bool)

(assert (=> b!1148788 (=> (not res!764276) (not e!653533))))

(assert (=> b!1148788 (= res!764276 (= (select (arr!35894 _keys!1208) i!673) k0!934))))

(declare-fun b!1148789 () Bool)

(declare-fun lt!513214 () ListLongMap!16319)

(declare-fun e!653531 () Bool)

(assert (=> b!1148789 (= e!653531 (= (-!1300 lt!513214 k0!934) lt!513218))))

(declare-fun b!1148790 () Bool)

(assert (=> b!1148790 (= e!653529 tp_is_empty!28801)))

(declare-fun b!1148791 () Bool)

(declare-fun res!764279 () Bool)

(assert (=> b!1148791 (=> (not res!764279) (not e!653533))))

(assert (=> b!1148791 (= res!764279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1148792 () Bool)

(assert (=> b!1148792 (= e!653526 e!653539)))

(declare-fun res!764286 () Bool)

(assert (=> b!1148792 (=> res!764286 e!653539)))

(assert (=> b!1148792 (= res!764286 (not (= from!1455 i!673)))))

(declare-fun lt!513215 () ListLongMap!16319)

(assert (=> b!1148792 (= lt!513215 (getCurrentListMapNoExtraKeys!4678 lt!513220 lt!513219 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513232 () V!43529)

(assert (=> b!1148792 (= lt!513219 (array!74498 (store (arr!35893 _values!996) i!673 (ValueCellFull!13691 lt!513232)) (size!36430 _values!996)))))

(declare-fun dynLambda!2705 (Int (_ BitVec 64)) V!43529)

(assert (=> b!1148792 (= lt!513232 (dynLambda!2705 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1148792 (= lt!513214 (getCurrentListMapNoExtraKeys!4678 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!52863 () Bool)

(assert (=> bm!52863 (= call!52860 call!52862)))

(declare-fun b!1148793 () Bool)

(assert (=> b!1148793 (= c!113697 (and (not lt!513225) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1148793 (= e!653527 e!653538)))

(declare-fun b!1148794 () Bool)

(declare-fun res!764273 () Bool)

(assert (=> b!1148794 (=> (not res!764273) (not e!653533))))

(assert (=> b!1148794 (= res!764273 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36431 _keys!1208))))))

(declare-fun b!1148795 () Bool)

(declare-fun lt!513229 () Unit!37676)

(assert (=> b!1148795 (= e!653538 lt!513229)))

(assert (=> b!1148795 (= lt!513229 call!52861)))

(assert (=> b!1148795 call!52866))

(declare-fun b!1148796 () Bool)

(assert (=> b!1148796 (= e!653536 true)))

(assert (=> b!1148796 e!653531))

(declare-fun res!764278 () Bool)

(assert (=> b!1148796 (=> (not res!764278) (not e!653531))))

(declare-fun lt!513212 () V!43529)

(assert (=> b!1148796 (= res!764278 (= (-!1300 (+!3615 lt!513218 (tuple2!18343 (select (arr!35894 _keys!1208) from!1455) lt!513212)) (select (arr!35894 _keys!1208) from!1455)) lt!513218))))

(declare-fun lt!513230 () Unit!37676)

(declare-fun addThenRemoveForNewKeyIsSame!152 (ListLongMap!16319 (_ BitVec 64) V!43529) Unit!37676)

(assert (=> b!1148796 (= lt!513230 (addThenRemoveForNewKeyIsSame!152 lt!513218 (select (arr!35894 _keys!1208) from!1455) lt!513212))))

(declare-fun get!18287 (ValueCell!13691 V!43529) V!43529)

(assert (=> b!1148796 (= lt!513212 (get!18287 (select (arr!35893 _values!996) from!1455) lt!513232))))

(declare-fun lt!513216 () Unit!37676)

(assert (=> b!1148796 (= lt!513216 e!653530)))

(declare-fun c!113695 () Bool)

(assert (=> b!1148796 (= c!113695 (contains!6713 lt!513218 k0!934))))

(assert (=> b!1148796 (= lt!513218 (getCurrentListMapNoExtraKeys!4678 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98902 res!764272) b!1148783))

(assert (= (and b!1148783 res!764284) b!1148779))

(assert (= (and b!1148779 res!764275) b!1148791))

(assert (= (and b!1148791 res!764279) b!1148787))

(assert (= (and b!1148787 res!764281) b!1148794))

(assert (= (and b!1148794 res!764273) b!1148772))

(assert (= (and b!1148772 res!764277) b!1148788))

(assert (= (and b!1148788 res!764276) b!1148776))

(assert (= (and b!1148776 res!764280) b!1148775))

(assert (= (and b!1148775 res!764282) b!1148771))

(assert (= (and b!1148771 (not res!764274)) b!1148792))

(assert (= (and b!1148792 (not res!764286)) b!1148782))

(assert (= (and b!1148782 c!113698) b!1148777))

(assert (= (and b!1148782 (not c!113698)) b!1148781))

(assert (= (or b!1148777 b!1148781) bm!52859))

(assert (= (or b!1148777 b!1148781) bm!52857))

(assert (= (and b!1148782 (not res!764285)) b!1148796))

(assert (= (and b!1148796 c!113695) b!1148780))

(assert (= (and b!1148796 (not c!113695)) b!1148767))

(assert (= (and b!1148780 c!113696) b!1148784))

(assert (= (and b!1148780 (not c!113696)) b!1148793))

(assert (= (and b!1148793 c!113697) b!1148795))

(assert (= (and b!1148793 (not c!113697)) b!1148785))

(assert (= (and b!1148785 c!113700) b!1148778))

(assert (= (and b!1148785 (not c!113700)) b!1148768))

(assert (= (or b!1148795 b!1148778) bm!52856))

(assert (= (or b!1148795 b!1148778) bm!52863))

(assert (= (or b!1148795 b!1148778) bm!52862))

(assert (= (or b!1148784 bm!52862) bm!52860))

(assert (= (or b!1148784 bm!52856) bm!52861))

(assert (= (or b!1148784 bm!52863) bm!52858))

(assert (= (and b!1148780 c!113699) b!1148774))

(assert (= (and b!1148780 (not c!113699)) b!1148769))

(assert (= (and b!1148780 res!764283) b!1148770))

(assert (= (and b!1148796 res!764278) b!1148789))

(assert (= (and b!1148773 condMapEmpty!45026) mapIsEmpty!45026))

(assert (= (and b!1148773 (not condMapEmpty!45026)) mapNonEmpty!45026))

(get-info :version)

(assert (= (and mapNonEmpty!45026 ((_ is ValueCellFull!13691) mapValue!45026)) b!1148786))

(assert (= (and b!1148773 ((_ is ValueCellFull!13691) mapDefault!45026)) b!1148790))

(assert (= start!98902 b!1148773))

(declare-fun b_lambda!19371 () Bool)

(assert (=> (not b_lambda!19371) (not b!1148792)))

(declare-fun t!36350 () Bool)

(declare-fun tb!9075 () Bool)

(assert (=> (and start!98902 (= defaultEntry!1004 defaultEntry!1004) t!36350) tb!9075))

(declare-fun result!18723 () Bool)

(assert (=> tb!9075 (= result!18723 tp_is_empty!28801)))

(assert (=> b!1148792 t!36350))

(declare-fun b_and!39395 () Bool)

(assert (= b_and!39393 (and (=> t!36350 result!18723) b_and!39395)))

(declare-fun m!1059673 () Bool)

(assert (=> mapNonEmpty!45026 m!1059673))

(declare-fun m!1059675 () Bool)

(assert (=> b!1148780 m!1059675))

(declare-fun m!1059677 () Bool)

(assert (=> b!1148780 m!1059677))

(declare-fun m!1059679 () Bool)

(assert (=> b!1148780 m!1059679))

(declare-fun m!1059681 () Bool)

(assert (=> b!1148780 m!1059681))

(declare-fun m!1059683 () Bool)

(assert (=> bm!52857 m!1059683))

(declare-fun m!1059685 () Bool)

(assert (=> b!1148775 m!1059685))

(declare-fun m!1059687 () Bool)

(assert (=> b!1148789 m!1059687))

(declare-fun m!1059689 () Bool)

(assert (=> b!1148787 m!1059689))

(declare-fun m!1059691 () Bool)

(assert (=> b!1148791 m!1059691))

(declare-fun m!1059693 () Bool)

(assert (=> bm!52859 m!1059693))

(declare-fun m!1059695 () Bool)

(assert (=> b!1148774 m!1059695))

(declare-fun m!1059697 () Bool)

(assert (=> b!1148783 m!1059697))

(declare-fun m!1059699 () Bool)

(assert (=> b!1148784 m!1059699))

(assert (=> b!1148784 m!1059699))

(declare-fun m!1059701 () Bool)

(assert (=> b!1148784 m!1059701))

(declare-fun m!1059703 () Bool)

(assert (=> b!1148784 m!1059703))

(declare-fun m!1059705 () Bool)

(assert (=> b!1148777 m!1059705))

(declare-fun m!1059707 () Bool)

(assert (=> b!1148792 m!1059707))

(declare-fun m!1059709 () Bool)

(assert (=> b!1148792 m!1059709))

(declare-fun m!1059711 () Bool)

(assert (=> b!1148792 m!1059711))

(declare-fun m!1059713 () Bool)

(assert (=> b!1148792 m!1059713))

(declare-fun m!1059715 () Bool)

(assert (=> bm!52861 m!1059715))

(declare-fun m!1059717 () Bool)

(assert (=> bm!52858 m!1059717))

(declare-fun m!1059719 () Bool)

(assert (=> bm!52860 m!1059719))

(declare-fun m!1059721 () Bool)

(assert (=> b!1148771 m!1059721))

(declare-fun m!1059723 () Bool)

(assert (=> b!1148771 m!1059723))

(declare-fun m!1059725 () Bool)

(assert (=> start!98902 m!1059725))

(declare-fun m!1059727 () Bool)

(assert (=> start!98902 m!1059727))

(assert (=> b!1148770 m!1059695))

(declare-fun m!1059729 () Bool)

(assert (=> b!1148772 m!1059729))

(declare-fun m!1059731 () Bool)

(assert (=> b!1148776 m!1059731))

(declare-fun m!1059733 () Bool)

(assert (=> b!1148776 m!1059733))

(declare-fun m!1059735 () Bool)

(assert (=> b!1148788 m!1059735))

(assert (=> b!1148796 m!1059683))

(declare-fun m!1059737 () Bool)

(assert (=> b!1148796 m!1059737))

(declare-fun m!1059739 () Bool)

(assert (=> b!1148796 m!1059739))

(declare-fun m!1059741 () Bool)

(assert (=> b!1148796 m!1059741))

(declare-fun m!1059743 () Bool)

(assert (=> b!1148796 m!1059743))

(declare-fun m!1059745 () Bool)

(assert (=> b!1148796 m!1059745))

(declare-fun m!1059747 () Bool)

(assert (=> b!1148796 m!1059747))

(assert (=> b!1148796 m!1059737))

(assert (=> b!1148796 m!1059743))

(assert (=> b!1148796 m!1059737))

(declare-fun m!1059749 () Bool)

(assert (=> b!1148796 m!1059749))

(assert (=> b!1148796 m!1059745))

(assert (=> b!1148782 m!1059737))

(declare-fun m!1059751 () Bool)

(assert (=> b!1148782 m!1059751))

(check-sat (not bm!52860) (not b_lambda!19371) (not bm!52859) (not b!1148782) (not b!1148792) (not b!1148770) (not b_next!24271) (not b!1148771) (not mapNonEmpty!45026) (not b!1148772) (not bm!52858) (not b!1148787) (not b!1148789) (not start!98902) (not b!1148791) (not b!1148796) (not b!1148775) (not b!1148784) (not b!1148776) b_and!39395 (not b!1148783) (not b!1148777) (not b!1148774) (not bm!52857) (not bm!52861) tp_is_empty!28801 (not b!1148780))
(check-sat b_and!39395 (not b_next!24271))
