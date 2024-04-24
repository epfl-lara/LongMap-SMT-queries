; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98788 () Bool)

(assert start!98788)

(declare-fun b_free!24157 () Bool)

(declare-fun b_next!24157 () Bool)

(assert (=> start!98788 (= b_free!24157 (not b_next!24157))))

(declare-fun tp!85181 () Bool)

(declare-fun b_and!39165 () Bool)

(assert (=> start!98788 (= tp!85181 b_and!39165)))

(declare-fun b!1143584 () Bool)

(declare-fun res!761770 () Bool)

(declare-fun e!650683 () Bool)

(assert (=> b!1143584 (=> (not res!761770) (not e!650683))))

(declare-datatypes ((array!74273 0))(
  ( (array!74274 (arr!35781 (Array (_ BitVec 32) (_ BitVec 64))) (size!36318 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74273)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43377 0))(
  ( (V!43378 (val!14400 Int)) )
))
(declare-datatypes ((ValueCell!13634 0))(
  ( (ValueCellFull!13634 (v!17033 V!43377)) (EmptyCell!13634) )
))
(declare-datatypes ((array!74275 0))(
  ( (array!74276 (arr!35782 (Array (_ BitVec 32) ValueCell!13634)) (size!36319 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74275)

(assert (=> b!1143584 (= res!761770 (and (= (size!36319 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36318 _keys!1208) (size!36319 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1143585 () Bool)

(declare-fun e!650689 () Bool)

(declare-fun e!650684 () Bool)

(assert (=> b!1143585 (= e!650689 e!650684)))

(declare-fun res!761780 () Bool)

(assert (=> b!1143585 (=> res!761780 e!650684)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143585 (= res!761780 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43377)

(declare-fun lt!509635 () array!74275)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!509639 () array!74273)

(declare-fun minValue!944 () V!43377)

(declare-datatypes ((tuple2!18234 0))(
  ( (tuple2!18235 (_1!9128 (_ BitVec 64)) (_2!9128 V!43377)) )
))
(declare-datatypes ((List!24992 0))(
  ( (Nil!24989) (Cons!24988 (h!26206 tuple2!18234) (t!36133 List!24992)) )
))
(declare-datatypes ((ListLongMap!16211 0))(
  ( (ListLongMap!16212 (toList!8121 List!24992)) )
))
(declare-fun lt!509634 () ListLongMap!16211)

(declare-fun getCurrentListMapNoExtraKeys!4628 (array!74273 array!74275 (_ BitVec 32) (_ BitVec 32) V!43377 V!43377 (_ BitVec 32) Int) ListLongMap!16211)

(assert (=> b!1143585 (= lt!509634 (getCurrentListMapNoExtraKeys!4628 lt!509639 lt!509635 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!509627 () V!43377)

(assert (=> b!1143585 (= lt!509635 (array!74276 (store (arr!35782 _values!996) i!673 (ValueCellFull!13634 lt!509627)) (size!36319 _values!996)))))

(declare-fun dynLambda!2666 (Int (_ BitVec 64)) V!43377)

(assert (=> b!1143585 (= lt!509627 (dynLambda!2666 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!509626 () ListLongMap!16211)

(assert (=> b!1143585 (= lt!509626 (getCurrentListMapNoExtraKeys!4628 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1143586 () Bool)

(declare-fun res!761778 () Bool)

(assert (=> b!1143586 (=> (not res!761778) (not e!650683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74273 (_ BitVec 32)) Bool)

(assert (=> b!1143586 (= res!761778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!51488 () Bool)

(declare-fun call!51496 () ListLongMap!16211)

(declare-fun call!51495 () ListLongMap!16211)

(assert (=> bm!51488 (= call!51496 call!51495)))

(declare-fun call!51498 () ListLongMap!16211)

(declare-fun call!51492 () ListLongMap!16211)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1143587 () Bool)

(declare-fun e!650695 () Bool)

(declare-fun -!1251 (ListLongMap!16211 (_ BitVec 64)) ListLongMap!16211)

(assert (=> b!1143587 (= e!650695 (= call!51498 (-!1251 call!51492 k0!934)))))

(declare-fun b!1143588 () Bool)

(declare-fun c!112674 () Bool)

(declare-fun lt!509624 () Bool)

(assert (=> b!1143588 (= c!112674 (and (not lt!509624) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!37449 0))(
  ( (Unit!37450) )
))
(declare-fun e!650692 () Unit!37449)

(declare-fun e!650694 () Unit!37449)

(assert (=> b!1143588 (= e!650692 e!650694)))

(declare-fun b!1143589 () Bool)

(declare-fun e!650680 () Bool)

(declare-fun e!650690 () Bool)

(declare-fun mapRes!44855 () Bool)

(assert (=> b!1143589 (= e!650680 (and e!650690 mapRes!44855))))

(declare-fun condMapEmpty!44855 () Bool)

(declare-fun mapDefault!44855 () ValueCell!13634)

(assert (=> b!1143589 (= condMapEmpty!44855 (= (arr!35782 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13634)) mapDefault!44855)))))

(declare-fun b!1143590 () Bool)

(declare-fun e!650686 () Bool)

(assert (=> b!1143590 (= e!650684 e!650686)))

(declare-fun res!761771 () Bool)

(assert (=> b!1143590 (=> res!761771 e!650686)))

(assert (=> b!1143590 (= res!761771 (not (= (select (arr!35781 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1143590 e!650695))

(declare-fun c!112669 () Bool)

(assert (=> b!1143590 (= c!112669 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!509636 () Unit!37449)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!505 (array!74273 array!74275 (_ BitVec 32) (_ BitVec 32) V!43377 V!43377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37449)

(assert (=> b!1143590 (= lt!509636 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!505 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143591 () Bool)

(declare-fun e!650682 () Unit!37449)

(declare-fun Unit!37451 () Unit!37449)

(assert (=> b!1143591 (= e!650682 Unit!37451)))

(declare-fun res!761773 () Bool)

(assert (=> start!98788 (=> (not res!761773) (not e!650683))))

(assert (=> start!98788 (= res!761773 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36318 _keys!1208))))))

(assert (=> start!98788 e!650683))

(declare-fun tp_is_empty!28687 () Bool)

(assert (=> start!98788 tp_is_empty!28687))

(declare-fun array_inv!27468 (array!74273) Bool)

(assert (=> start!98788 (array_inv!27468 _keys!1208)))

(assert (=> start!98788 true))

(assert (=> start!98788 tp!85181))

(declare-fun array_inv!27469 (array!74275) Bool)

(assert (=> start!98788 (and (array_inv!27469 _values!996) e!650680)))

(declare-fun bm!51489 () Bool)

(declare-fun call!51494 () Bool)

(declare-fun call!51497 () Bool)

(assert (=> bm!51489 (= call!51494 call!51497)))

(declare-fun lt!509641 () ListLongMap!16211)

(declare-fun lt!509632 () ListLongMap!16211)

(declare-fun bm!51490 () Bool)

(declare-fun c!112670 () Bool)

(declare-fun +!3568 (ListLongMap!16211 tuple2!18234) ListLongMap!16211)

(assert (=> bm!51490 (= call!51495 (+!3568 (ite c!112670 lt!509641 lt!509632) (ite c!112670 (tuple2!18235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112674 (tuple2!18235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1143592 () Bool)

(declare-fun e!650685 () Bool)

(declare-fun arrayContainsKey!0 (array!74273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143592 (= e!650685 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!44855 () Bool)

(assert (=> mapIsEmpty!44855 mapRes!44855))

(declare-fun b!1143593 () Bool)

(declare-fun res!761781 () Bool)

(declare-fun e!650691 () Bool)

(assert (=> b!1143593 (=> (not res!761781) (not e!650691))))

(declare-datatypes ((List!24993 0))(
  ( (Nil!24990) (Cons!24989 (h!26207 (_ BitVec 64)) (t!36134 List!24993)) )
))
(declare-fun arrayNoDuplicates!0 (array!74273 (_ BitVec 32) List!24993) Bool)

(assert (=> b!1143593 (= res!761781 (arrayNoDuplicates!0 lt!509639 #b00000000000000000000000000000000 Nil!24990))))

(declare-fun e!650688 () Bool)

(declare-fun b!1143594 () Bool)

(assert (=> b!1143594 (= e!650688 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!51491 () Bool)

(assert (=> bm!51491 (= call!51498 (getCurrentListMapNoExtraKeys!4628 lt!509639 lt!509635 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143595 () Bool)

(declare-fun res!761775 () Bool)

(assert (=> b!1143595 (=> (not res!761775) (not e!650683))))

(assert (=> b!1143595 (= res!761775 (= (select (arr!35781 _keys!1208) i!673) k0!934))))

(declare-fun b!1143596 () Bool)

(assert (=> b!1143596 (= e!650683 e!650691)))

(declare-fun res!761769 () Bool)

(assert (=> b!1143596 (=> (not res!761769) (not e!650691))))

(assert (=> b!1143596 (= res!761769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!509639 mask!1564))))

(assert (=> b!1143596 (= lt!509639 (array!74274 (store (arr!35781 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36318 _keys!1208)))))

(declare-fun b!1143597 () Bool)

(declare-fun contains!6666 (ListLongMap!16211 (_ BitVec 64)) Bool)

(assert (=> b!1143597 (contains!6666 call!51495 k0!934)))

(declare-fun lt!509621 () Unit!37449)

(declare-fun addStillContains!795 (ListLongMap!16211 (_ BitVec 64) V!43377 (_ BitVec 64)) Unit!37449)

(assert (=> b!1143597 (= lt!509621 (addStillContains!795 lt!509641 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1143597 call!51497))

(assert (=> b!1143597 (= lt!509641 (+!3568 lt!509632 (tuple2!18235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!509630 () Unit!37449)

(declare-fun call!51491 () Unit!37449)

(assert (=> b!1143597 (= lt!509630 call!51491)))

(assert (=> b!1143597 (= e!650692 lt!509621)))

(declare-fun bm!51492 () Bool)

(assert (=> bm!51492 (= call!51497 (contains!6666 (ite c!112670 lt!509641 call!51496) k0!934))))

(declare-fun b!1143598 () Bool)

(assert (=> b!1143598 (= e!650688 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!509624) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1143599 () Bool)

(declare-fun res!761774 () Bool)

(assert (=> b!1143599 (=> (not res!761774) (not e!650683))))

(assert (=> b!1143599 (= res!761774 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24990))))

(declare-fun b!1143600 () Bool)

(assert (=> b!1143600 (= e!650690 tp_is_empty!28687)))

(declare-fun b!1143601 () Bool)

(declare-fun res!761776 () Bool)

(assert (=> b!1143601 (=> (not res!761776) (not e!650683))))

(assert (=> b!1143601 (= res!761776 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36318 _keys!1208))))))

(declare-fun bm!51493 () Bool)

(assert (=> bm!51493 (= call!51491 (addStillContains!795 lt!509632 (ite (or c!112670 c!112674) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112670 c!112674) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1143602 () Bool)

(assert (=> b!1143602 (= e!650686 true)))

(declare-fun lt!509633 () V!43377)

(assert (=> b!1143602 (= (-!1251 (+!3568 lt!509632 (tuple2!18235 (select (arr!35781 _keys!1208) from!1455) lt!509633)) (select (arr!35781 _keys!1208) from!1455)) lt!509632)))

(declare-fun lt!509629 () Unit!37449)

(declare-fun addThenRemoveForNewKeyIsSame!109 (ListLongMap!16211 (_ BitVec 64) V!43377) Unit!37449)

(assert (=> b!1143602 (= lt!509629 (addThenRemoveForNewKeyIsSame!109 lt!509632 (select (arr!35781 _keys!1208) from!1455) lt!509633))))

(declare-fun get!18206 (ValueCell!13634 V!43377) V!43377)

(assert (=> b!1143602 (= lt!509633 (get!18206 (select (arr!35782 _values!996) from!1455) lt!509627))))

(declare-fun lt!509631 () Unit!37449)

(declare-fun e!650687 () Unit!37449)

(assert (=> b!1143602 (= lt!509631 e!650687)))

(declare-fun c!112671 () Bool)

(assert (=> b!1143602 (= c!112671 (contains!6666 lt!509632 k0!934))))

(assert (=> b!1143602 (= lt!509632 (getCurrentListMapNoExtraKeys!4628 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143603 () Bool)

(declare-fun Unit!37452 () Unit!37449)

(assert (=> b!1143603 (= e!650687 Unit!37452)))

(assert (=> b!1143603 (= lt!509624 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143603 (= c!112670 (and (not lt!509624) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!509622 () Unit!37449)

(assert (=> b!1143603 (= lt!509622 e!650692)))

(declare-fun lt!509625 () Unit!37449)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!397 (array!74273 array!74275 (_ BitVec 32) (_ BitVec 32) V!43377 V!43377 (_ BitVec 64) (_ BitVec 32) Int) Unit!37449)

(assert (=> b!1143603 (= lt!509625 (lemmaListMapContainsThenArrayContainsFrom!397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112672 () Bool)

(assert (=> b!1143603 (= c!112672 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761772 () Bool)

(assert (=> b!1143603 (= res!761772 e!650688)))

(assert (=> b!1143603 (=> (not res!761772) (not e!650685))))

(assert (=> b!1143603 e!650685))

(declare-fun lt!509623 () Unit!37449)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74273 (_ BitVec 32) (_ BitVec 32)) Unit!37449)

(assert (=> b!1143603 (= lt!509623 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143603 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24990)))

(declare-fun lt!509628 () Unit!37449)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74273 (_ BitVec 64) (_ BitVec 32) List!24993) Unit!37449)

(assert (=> b!1143603 (= lt!509628 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24990))))

(assert (=> b!1143603 false))

(declare-fun b!1143604 () Bool)

(assert (=> b!1143604 (= e!650694 e!650682)))

(declare-fun c!112673 () Bool)

(assert (=> b!1143604 (= c!112673 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!509624))))

(declare-fun b!1143605 () Bool)

(assert (=> b!1143605 (= e!650691 (not e!650689))))

(declare-fun res!761779 () Bool)

(assert (=> b!1143605 (=> res!761779 e!650689)))

(assert (=> b!1143605 (= res!761779 (bvsgt from!1455 i!673))))

(assert (=> b!1143605 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!509638 () Unit!37449)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74273 (_ BitVec 64) (_ BitVec 32)) Unit!37449)

(assert (=> b!1143605 (= lt!509638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1143606 () Bool)

(declare-fun Unit!37453 () Unit!37449)

(assert (=> b!1143606 (= e!650687 Unit!37453)))

(declare-fun b!1143607 () Bool)

(assert (=> b!1143607 (= e!650695 (= call!51498 call!51492))))

(declare-fun mapNonEmpty!44855 () Bool)

(declare-fun tp!85182 () Bool)

(declare-fun e!650693 () Bool)

(assert (=> mapNonEmpty!44855 (= mapRes!44855 (and tp!85182 e!650693))))

(declare-fun mapValue!44855 () ValueCell!13634)

(declare-fun mapRest!44855 () (Array (_ BitVec 32) ValueCell!13634))

(declare-fun mapKey!44855 () (_ BitVec 32))

(assert (=> mapNonEmpty!44855 (= (arr!35782 _values!996) (store mapRest!44855 mapKey!44855 mapValue!44855))))

(declare-fun bm!51494 () Bool)

(assert (=> bm!51494 (= call!51492 (getCurrentListMapNoExtraKeys!4628 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1143608 () Bool)

(declare-fun res!761777 () Bool)

(assert (=> b!1143608 (=> (not res!761777) (not e!650683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143608 (= res!761777 (validKeyInArray!0 k0!934))))

(declare-fun b!1143609 () Bool)

(declare-fun lt!509637 () Unit!37449)

(assert (=> b!1143609 (= e!650694 lt!509637)))

(declare-fun call!51493 () Unit!37449)

(assert (=> b!1143609 (= lt!509637 call!51493)))

(assert (=> b!1143609 call!51494))

(declare-fun b!1143610 () Bool)

(declare-fun res!761768 () Bool)

(assert (=> b!1143610 (=> (not res!761768) (not e!650683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1143610 (= res!761768 (validMask!0 mask!1564))))

(declare-fun bm!51495 () Bool)

(assert (=> bm!51495 (= call!51493 call!51491)))

(declare-fun b!1143611 () Bool)

(assert (=> b!1143611 (= e!650693 tp_is_empty!28687)))

(declare-fun b!1143612 () Bool)

(assert (=> b!1143612 call!51494))

(declare-fun lt!509640 () Unit!37449)

(assert (=> b!1143612 (= lt!509640 call!51493)))

(assert (=> b!1143612 (= e!650682 lt!509640)))

(assert (= (and start!98788 res!761773) b!1143610))

(assert (= (and b!1143610 res!761768) b!1143584))

(assert (= (and b!1143584 res!761770) b!1143586))

(assert (= (and b!1143586 res!761778) b!1143599))

(assert (= (and b!1143599 res!761774) b!1143601))

(assert (= (and b!1143601 res!761776) b!1143608))

(assert (= (and b!1143608 res!761777) b!1143595))

(assert (= (and b!1143595 res!761775) b!1143596))

(assert (= (and b!1143596 res!761769) b!1143593))

(assert (= (and b!1143593 res!761781) b!1143605))

(assert (= (and b!1143605 (not res!761779)) b!1143585))

(assert (= (and b!1143585 (not res!761780)) b!1143590))

(assert (= (and b!1143590 c!112669) b!1143587))

(assert (= (and b!1143590 (not c!112669)) b!1143607))

(assert (= (or b!1143587 b!1143607) bm!51494))

(assert (= (or b!1143587 b!1143607) bm!51491))

(assert (= (and b!1143590 (not res!761771)) b!1143602))

(assert (= (and b!1143602 c!112671) b!1143603))

(assert (= (and b!1143602 (not c!112671)) b!1143606))

(assert (= (and b!1143603 c!112670) b!1143597))

(assert (= (and b!1143603 (not c!112670)) b!1143588))

(assert (= (and b!1143588 c!112674) b!1143609))

(assert (= (and b!1143588 (not c!112674)) b!1143604))

(assert (= (and b!1143604 c!112673) b!1143612))

(assert (= (and b!1143604 (not c!112673)) b!1143591))

(assert (= (or b!1143609 b!1143612) bm!51495))

(assert (= (or b!1143609 b!1143612) bm!51488))

(assert (= (or b!1143609 b!1143612) bm!51489))

(assert (= (or b!1143597 bm!51489) bm!51492))

(assert (= (or b!1143597 bm!51495) bm!51493))

(assert (= (or b!1143597 bm!51488) bm!51490))

(assert (= (and b!1143603 c!112672) b!1143594))

(assert (= (and b!1143603 (not c!112672)) b!1143598))

(assert (= (and b!1143603 res!761772) b!1143592))

(assert (= (and b!1143589 condMapEmpty!44855) mapIsEmpty!44855))

(assert (= (and b!1143589 (not condMapEmpty!44855)) mapNonEmpty!44855))

(get-info :version)

(assert (= (and mapNonEmpty!44855 ((_ is ValueCellFull!13634) mapValue!44855)) b!1143611))

(assert (= (and b!1143589 ((_ is ValueCellFull!13634) mapDefault!44855)) b!1143600))

(assert (= start!98788 b!1143589))

(declare-fun b_lambda!19257 () Bool)

(assert (=> (not b_lambda!19257) (not b!1143585)))

(declare-fun t!36132 () Bool)

(declare-fun tb!8961 () Bool)

(assert (=> (and start!98788 (= defaultEntry!1004 defaultEntry!1004) t!36132) tb!8961))

(declare-fun result!18495 () Bool)

(assert (=> tb!8961 (= result!18495 tp_is_empty!28687)))

(assert (=> b!1143585 t!36132))

(declare-fun b_and!39167 () Bool)

(assert (= b_and!39165 (and (=> t!36132 result!18495) b_and!39167)))

(declare-fun m!1055153 () Bool)

(assert (=> bm!51491 m!1055153))

(declare-fun m!1055155 () Bool)

(assert (=> b!1143586 m!1055155))

(declare-fun m!1055157 () Bool)

(assert (=> b!1143592 m!1055157))

(declare-fun m!1055159 () Bool)

(assert (=> b!1143602 m!1055159))

(declare-fun m!1055161 () Bool)

(assert (=> b!1143602 m!1055161))

(assert (=> b!1143602 m!1055161))

(declare-fun m!1055163 () Bool)

(assert (=> b!1143602 m!1055163))

(declare-fun m!1055165 () Bool)

(assert (=> b!1143602 m!1055165))

(declare-fun m!1055167 () Bool)

(assert (=> b!1143602 m!1055167))

(declare-fun m!1055169 () Bool)

(assert (=> b!1143602 m!1055169))

(declare-fun m!1055171 () Bool)

(assert (=> b!1143602 m!1055171))

(assert (=> b!1143602 m!1055167))

(assert (=> b!1143602 m!1055165))

(assert (=> b!1143602 m!1055167))

(declare-fun m!1055173 () Bool)

(assert (=> b!1143602 m!1055173))

(assert (=> bm!51494 m!1055159))

(declare-fun m!1055175 () Bool)

(assert (=> b!1143603 m!1055175))

(declare-fun m!1055177 () Bool)

(assert (=> b!1143603 m!1055177))

(declare-fun m!1055179 () Bool)

(assert (=> b!1143603 m!1055179))

(declare-fun m!1055181 () Bool)

(assert (=> b!1143603 m!1055181))

(declare-fun m!1055183 () Bool)

(assert (=> b!1143599 m!1055183))

(declare-fun m!1055185 () Bool)

(assert (=> b!1143587 m!1055185))

(declare-fun m!1055187 () Bool)

(assert (=> b!1143605 m!1055187))

(declare-fun m!1055189 () Bool)

(assert (=> b!1143605 m!1055189))

(declare-fun m!1055191 () Bool)

(assert (=> b!1143585 m!1055191))

(declare-fun m!1055193 () Bool)

(assert (=> b!1143585 m!1055193))

(declare-fun m!1055195 () Bool)

(assert (=> b!1143585 m!1055195))

(declare-fun m!1055197 () Bool)

(assert (=> b!1143585 m!1055197))

(declare-fun m!1055199 () Bool)

(assert (=> b!1143610 m!1055199))

(declare-fun m!1055201 () Bool)

(assert (=> b!1143597 m!1055201))

(declare-fun m!1055203 () Bool)

(assert (=> b!1143597 m!1055203))

(declare-fun m!1055205 () Bool)

(assert (=> b!1143597 m!1055205))

(assert (=> b!1143590 m!1055167))

(declare-fun m!1055207 () Bool)

(assert (=> b!1143590 m!1055207))

(declare-fun m!1055209 () Bool)

(assert (=> bm!51493 m!1055209))

(declare-fun m!1055211 () Bool)

(assert (=> start!98788 m!1055211))

(declare-fun m!1055213 () Bool)

(assert (=> start!98788 m!1055213))

(declare-fun m!1055215 () Bool)

(assert (=> bm!51492 m!1055215))

(assert (=> b!1143594 m!1055157))

(declare-fun m!1055217 () Bool)

(assert (=> b!1143593 m!1055217))

(declare-fun m!1055219 () Bool)

(assert (=> mapNonEmpty!44855 m!1055219))

(declare-fun m!1055221 () Bool)

(assert (=> b!1143596 m!1055221))

(declare-fun m!1055223 () Bool)

(assert (=> b!1143596 m!1055223))

(declare-fun m!1055225 () Bool)

(assert (=> b!1143595 m!1055225))

(declare-fun m!1055227 () Bool)

(assert (=> bm!51490 m!1055227))

(declare-fun m!1055229 () Bool)

(assert (=> b!1143608 m!1055229))

(check-sat (not b!1143610) (not b!1143585) (not bm!51491) (not start!98788) (not b_next!24157) (not bm!51494) (not b!1143602) b_and!39167 (not b!1143596) (not b!1143593) tp_is_empty!28687 (not bm!51493) (not b!1143586) (not b!1143603) (not bm!51490) (not b!1143592) (not b_lambda!19257) (not b!1143587) (not b!1143608) (not b!1143590) (not bm!51492) (not b!1143594) (not mapNonEmpty!44855) (not b!1143597) (not b!1143605) (not b!1143599))
(check-sat b_and!39167 (not b_next!24157))
