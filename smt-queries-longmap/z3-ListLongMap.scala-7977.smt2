; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98696 () Bool)

(assert start!98696)

(declare-fun b_free!24307 () Bool)

(declare-fun b_next!24307 () Bool)

(assert (=> start!98696 (= b_free!24307 (not b_next!24307))))

(declare-fun tp!85631 () Bool)

(declare-fun b_and!39441 () Bool)

(assert (=> start!98696 (= tp!85631 b_and!39441)))

(declare-fun b!1149010 () Bool)

(declare-datatypes ((V!43577 0))(
  ( (V!43578 (val!14475 Int)) )
))
(declare-datatypes ((tuple2!18442 0))(
  ( (tuple2!18443 (_1!9232 (_ BitVec 64)) (_2!9232 V!43577)) )
))
(declare-datatypes ((List!25178 0))(
  ( (Nil!25175) (Cons!25174 (h!26383 tuple2!18442) (t!36468 List!25178)) )
))
(declare-datatypes ((ListLongMap!16411 0))(
  ( (ListLongMap!16412 (toList!8221 List!25178)) )
))
(declare-fun lt!513672 () ListLongMap!16411)

(declare-fun minValue!944 () V!43577)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6680 (ListLongMap!16411 (_ BitVec 64)) Bool)

(declare-fun +!3639 (ListLongMap!16411 tuple2!18442) ListLongMap!16411)

(assert (=> b!1149010 (contains!6680 (+!3639 lt!513672 (tuple2!18443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-datatypes ((Unit!37611 0))(
  ( (Unit!37612) )
))
(declare-fun lt!513676 () Unit!37611)

(declare-fun addStillContains!850 (ListLongMap!16411 (_ BitVec 64) V!43577 (_ BitVec 64)) Unit!37611)

(assert (=> b!1149010 (= lt!513676 (addStillContains!850 lt!513672 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!53209 () Bool)

(assert (=> b!1149010 call!53209))

(declare-fun call!53210 () ListLongMap!16411)

(assert (=> b!1149010 (= lt!513672 call!53210)))

(declare-fun lt!513683 () Unit!37611)

(declare-fun call!53207 () Unit!37611)

(assert (=> b!1149010 (= lt!513683 call!53207)))

(declare-fun e!653546 () Unit!37611)

(assert (=> b!1149010 (= e!653546 lt!513676)))

(declare-fun zeroValue!944 () V!43577)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74442 0))(
  ( (array!74443 (arr!35872 (Array (_ BitVec 32) (_ BitVec 64))) (size!36410 (_ BitVec 32))) )
))
(declare-fun lt!513675 () array!74442)

(declare-fun e!653544 () Bool)

(declare-fun lt!513678 () ListLongMap!16411)

(declare-datatypes ((ValueCell!13709 0))(
  ( (ValueCellFull!13709 (v!17111 V!43577)) (EmptyCell!13709) )
))
(declare-datatypes ((array!74444 0))(
  ( (array!74445 (arr!35873 (Array (_ BitVec 32) ValueCell!13709)) (size!36411 (_ BitVec 32))) )
))
(declare-fun lt!513679 () array!74444)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun b!1149011 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4705 (array!74442 array!74444 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 32) Int) ListLongMap!16411)

(assert (=> b!1149011 (= e!653544 (= lt!513678 (getCurrentListMapNoExtraKeys!4705 lt!513675 lt!513679 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1149012 () Bool)

(declare-fun res!764519 () Bool)

(declare-fun e!653534 () Bool)

(assert (=> b!1149012 (=> (not res!764519) (not e!653534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149012 (= res!764519 (validKeyInArray!0 k0!934))))

(declare-fun b!1149013 () Bool)

(declare-fun e!653543 () Bool)

(declare-fun lt!513674 () Bool)

(assert (=> b!1149013 (= e!653543 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!513674) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149014 () Bool)

(declare-fun e!653548 () Unit!37611)

(declare-fun e!653550 () Unit!37611)

(assert (=> b!1149014 (= e!653548 e!653550)))

(declare-fun c!113595 () Bool)

(assert (=> b!1149014 (= c!113595 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!513674))))

(declare-fun bm!53200 () Bool)

(declare-fun call!53205 () Bool)

(assert (=> bm!53200 (= call!53205 call!53209)))

(declare-fun c!113599 () Bool)

(declare-fun lt!513692 () ListLongMap!16411)

(declare-fun c!113596 () Bool)

(declare-fun bm!53201 () Bool)

(assert (=> bm!53201 (= call!53210 (+!3639 lt!513692 (ite (or c!113596 c!113599) (tuple2!18443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1149015 () Bool)

(declare-fun e!653538 () Bool)

(declare-fun e!653549 () Bool)

(assert (=> b!1149015 (= e!653538 e!653549)))

(declare-fun res!764511 () Bool)

(assert (=> b!1149015 (=> res!764511 e!653549)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149015 (= res!764511 (not (= from!1455 i!673)))))

(declare-fun lt!513689 () ListLongMap!16411)

(assert (=> b!1149015 (= lt!513689 (getCurrentListMapNoExtraKeys!4705 lt!513675 lt!513679 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!513686 () V!43577)

(declare-fun _values!996 () array!74444)

(assert (=> b!1149015 (= lt!513679 (array!74445 (store (arr!35873 _values!996) i!673 (ValueCellFull!13709 lt!513686)) (size!36411 _values!996)))))

(declare-fun dynLambda!2672 (Int (_ BitVec 64)) V!43577)

(assert (=> b!1149015 (= lt!513686 (dynLambda!2672 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!74442)

(declare-fun lt!513688 () ListLongMap!16411)

(assert (=> b!1149015 (= lt!513688 (getCurrentListMapNoExtraKeys!4705 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!53204 () ListLongMap!16411)

(declare-fun bm!53202 () Bool)

(assert (=> bm!53202 (= call!53209 (contains!6680 (ite c!113596 lt!513672 call!53204) k0!934))))

(declare-fun b!1149016 () Bool)

(assert (=> b!1149016 (= c!113599 (and (not lt!513674) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149016 (= e!653546 e!653548)))

(declare-fun b!1149017 () Bool)

(declare-fun Unit!37613 () Unit!37611)

(assert (=> b!1149017 (= e!653550 Unit!37613)))

(declare-fun b!1149018 () Bool)

(declare-fun e!653537 () Bool)

(assert (=> b!1149018 (= e!653534 e!653537)))

(declare-fun res!764510 () Bool)

(assert (=> b!1149018 (=> (not res!764510) (not e!653537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74442 (_ BitVec 32)) Bool)

(assert (=> b!1149018 (= res!764510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!513675 mask!1564))))

(assert (=> b!1149018 (= lt!513675 (array!74443 (store (arr!35872 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36410 _keys!1208)))))

(declare-fun b!1149019 () Bool)

(declare-fun res!764514 () Bool)

(assert (=> b!1149019 (=> (not res!764514) (not e!653537))))

(declare-datatypes ((List!25179 0))(
  ( (Nil!25176) (Cons!25175 (h!26384 (_ BitVec 64)) (t!36469 List!25179)) )
))
(declare-fun arrayNoDuplicates!0 (array!74442 (_ BitVec 32) List!25179) Bool)

(assert (=> b!1149019 (= res!764514 (arrayNoDuplicates!0 lt!513675 #b00000000000000000000000000000000 Nil!25176))))

(declare-fun b!1149020 () Bool)

(declare-fun e!653541 () Bool)

(declare-fun tp_is_empty!28837 () Bool)

(assert (=> b!1149020 (= e!653541 tp_is_empty!28837)))

(declare-fun b!1149021 () Bool)

(declare-fun res!764518 () Bool)

(assert (=> b!1149021 (=> (not res!764518) (not e!653534))))

(assert (=> b!1149021 (= res!764518 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36410 _keys!1208))))))

(declare-fun mapIsEmpty!45080 () Bool)

(declare-fun mapRes!45080 () Bool)

(assert (=> mapIsEmpty!45080 mapRes!45080))

(declare-fun mapNonEmpty!45080 () Bool)

(declare-fun tp!85632 () Bool)

(declare-fun e!653547 () Bool)

(assert (=> mapNonEmpty!45080 (= mapRes!45080 (and tp!85632 e!653547))))

(declare-fun mapRest!45080 () (Array (_ BitVec 32) ValueCell!13709))

(declare-fun mapValue!45080 () ValueCell!13709)

(declare-fun mapKey!45080 () (_ BitVec 32))

(assert (=> mapNonEmpty!45080 (= (arr!35873 _values!996) (store mapRest!45080 mapKey!45080 mapValue!45080))))

(declare-fun e!653535 () Bool)

(declare-fun b!1149022 () Bool)

(declare-fun arrayContainsKey!0 (array!74442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149022 (= e!653535 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149023 () Bool)

(assert (=> b!1149023 (= e!653537 (not e!653538))))

(declare-fun res!764520 () Bool)

(assert (=> b!1149023 (=> res!764520 e!653538)))

(assert (=> b!1149023 (= res!764520 (bvsgt from!1455 i!673))))

(assert (=> b!1149023 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!513687 () Unit!37611)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74442 (_ BitVec 64) (_ BitVec 32)) Unit!37611)

(assert (=> b!1149023 (= lt!513687 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!53203 () Bool)

(assert (=> bm!53203 (= call!53204 call!53210)))

(declare-fun b!1149024 () Bool)

(assert (=> b!1149024 (= e!653543 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149025 () Bool)

(declare-fun res!764513 () Bool)

(assert (=> b!1149025 (=> (not res!764513) (not e!653534))))

(assert (=> b!1149025 (= res!764513 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25176))))

(declare-fun b!1149026 () Bool)

(declare-fun e!653542 () Bool)

(assert (=> b!1149026 (= e!653549 e!653542)))

(declare-fun res!764522 () Bool)

(assert (=> b!1149026 (=> res!764522 e!653542)))

(assert (=> b!1149026 (= res!764522 (not (= (select (arr!35872 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653545 () Bool)

(assert (=> b!1149026 e!653545))

(declare-fun c!113598 () Bool)

(assert (=> b!1149026 (= c!113598 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!513691 () Unit!37611)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!568 (array!74442 array!74444 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37611)

(assert (=> b!1149026 (= lt!513691 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149027 () Bool)

(declare-fun call!53206 () ListLongMap!16411)

(declare-fun call!53203 () ListLongMap!16411)

(assert (=> b!1149027 (= e!653545 (= call!53206 call!53203))))

(declare-fun b!1149028 () Bool)

(declare-fun res!764516 () Bool)

(assert (=> b!1149028 (=> (not res!764516) (not e!653534))))

(assert (=> b!1149028 (= res!764516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149029 () Bool)

(declare-fun res!764521 () Bool)

(assert (=> b!1149029 (=> (not res!764521) (not e!653534))))

(assert (=> b!1149029 (= res!764521 (= (select (arr!35872 _keys!1208) i!673) k0!934))))

(declare-fun bm!53204 () Bool)

(assert (=> bm!53204 (= call!53203 (getCurrentListMapNoExtraKeys!4705 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149030 () Bool)

(assert (=> b!1149030 call!53205))

(declare-fun lt!513680 () Unit!37611)

(declare-fun call!53208 () Unit!37611)

(assert (=> b!1149030 (= lt!513680 call!53208)))

(assert (=> b!1149030 (= e!653550 lt!513680)))

(declare-fun b!1149031 () Bool)

(declare-fun res!764517 () Bool)

(assert (=> b!1149031 (=> (not res!764517) (not e!653534))))

(assert (=> b!1149031 (= res!764517 (and (= (size!36411 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36410 _keys!1208) (size!36411 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!53205 () Bool)

(assert (=> bm!53205 (= call!53208 call!53207)))

(declare-fun b!1149032 () Bool)

(assert (=> b!1149032 (= e!653542 true)))

(assert (=> b!1149032 e!653544))

(declare-fun res!764515 () Bool)

(assert (=> b!1149032 (=> (not res!764515) (not e!653544))))

(assert (=> b!1149032 (= res!764515 (= lt!513678 lt!513692))))

(declare-fun -!1291 (ListLongMap!16411 (_ BitVec 64)) ListLongMap!16411)

(assert (=> b!1149032 (= lt!513678 (-!1291 lt!513688 k0!934))))

(declare-fun lt!513682 () V!43577)

(assert (=> b!1149032 (= (-!1291 (+!3639 lt!513692 (tuple2!18443 (select (arr!35872 _keys!1208) from!1455) lt!513682)) (select (arr!35872 _keys!1208) from!1455)) lt!513692)))

(declare-fun lt!513685 () Unit!37611)

(declare-fun addThenRemoveForNewKeyIsSame!150 (ListLongMap!16411 (_ BitVec 64) V!43577) Unit!37611)

(assert (=> b!1149032 (= lt!513685 (addThenRemoveForNewKeyIsSame!150 lt!513692 (select (arr!35872 _keys!1208) from!1455) lt!513682))))

(declare-fun get!18266 (ValueCell!13709 V!43577) V!43577)

(assert (=> b!1149032 (= lt!513682 (get!18266 (select (arr!35873 _values!996) from!1455) lt!513686))))

(declare-fun lt!513677 () Unit!37611)

(declare-fun e!653536 () Unit!37611)

(assert (=> b!1149032 (= lt!513677 e!653536)))

(declare-fun c!113600 () Bool)

(assert (=> b!1149032 (= c!113600 (contains!6680 lt!513692 k0!934))))

(assert (=> b!1149032 (= lt!513692 (getCurrentListMapNoExtraKeys!4705 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149033 () Bool)

(assert (=> b!1149033 (= e!653547 tp_is_empty!28837)))

(declare-fun b!1149034 () Bool)

(declare-fun Unit!37614 () Unit!37611)

(assert (=> b!1149034 (= e!653536 Unit!37614)))

(declare-fun b!1149035 () Bool)

(assert (=> b!1149035 (= e!653545 (= call!53206 (-!1291 call!53203 k0!934)))))

(declare-fun b!1149036 () Bool)

(declare-fun res!764512 () Bool)

(assert (=> b!1149036 (=> (not res!764512) (not e!653534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149036 (= res!764512 (validMask!0 mask!1564))))

(declare-fun b!1149037 () Bool)

(declare-fun Unit!37615 () Unit!37611)

(assert (=> b!1149037 (= e!653536 Unit!37615)))

(assert (=> b!1149037 (= lt!513674 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1149037 (= c!113596 (and (not lt!513674) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!513690 () Unit!37611)

(assert (=> b!1149037 (= lt!513690 e!653546)))

(declare-fun lt!513693 () Unit!37611)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!442 (array!74442 array!74444 (_ BitVec 32) (_ BitVec 32) V!43577 V!43577 (_ BitVec 64) (_ BitVec 32) Int) Unit!37611)

(assert (=> b!1149037 (= lt!513693 (lemmaListMapContainsThenArrayContainsFrom!442 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113597 () Bool)

(assert (=> b!1149037 (= c!113597 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764508 () Bool)

(assert (=> b!1149037 (= res!764508 e!653543)))

(assert (=> b!1149037 (=> (not res!764508) (not e!653535))))

(assert (=> b!1149037 e!653535))

(declare-fun lt!513684 () Unit!37611)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74442 (_ BitVec 32) (_ BitVec 32)) Unit!37611)

(assert (=> b!1149037 (= lt!513684 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1149037 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25176)))

(declare-fun lt!513681 () Unit!37611)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74442 (_ BitVec 64) (_ BitVec 32) List!25179) Unit!37611)

(assert (=> b!1149037 (= lt!513681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25176))))

(assert (=> b!1149037 false))

(declare-fun res!764509 () Bool)

(assert (=> start!98696 (=> (not res!764509) (not e!653534))))

(assert (=> start!98696 (= res!764509 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36410 _keys!1208))))))

(assert (=> start!98696 e!653534))

(assert (=> start!98696 tp_is_empty!28837))

(declare-fun array_inv!27568 (array!74442) Bool)

(assert (=> start!98696 (array_inv!27568 _keys!1208)))

(assert (=> start!98696 true))

(assert (=> start!98696 tp!85631))

(declare-fun e!653539 () Bool)

(declare-fun array_inv!27569 (array!74444) Bool)

(assert (=> start!98696 (and (array_inv!27569 _values!996) e!653539)))

(declare-fun b!1149038 () Bool)

(assert (=> b!1149038 (= e!653539 (and e!653541 mapRes!45080))))

(declare-fun condMapEmpty!45080 () Bool)

(declare-fun mapDefault!45080 () ValueCell!13709)

(assert (=> b!1149038 (= condMapEmpty!45080 (= (arr!35873 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13709)) mapDefault!45080)))))

(declare-fun b!1149039 () Bool)

(declare-fun lt!513673 () Unit!37611)

(assert (=> b!1149039 (= e!653548 lt!513673)))

(assert (=> b!1149039 (= lt!513673 call!53208)))

(assert (=> b!1149039 call!53205))

(declare-fun bm!53206 () Bool)

(assert (=> bm!53206 (= call!53207 (addStillContains!850 lt!513692 (ite (or c!113596 c!113599) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113596 c!113599) zeroValue!944 minValue!944) k0!934))))

(declare-fun bm!53207 () Bool)

(assert (=> bm!53207 (= call!53206 (getCurrentListMapNoExtraKeys!4705 lt!513675 lt!513679 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98696 res!764509) b!1149036))

(assert (= (and b!1149036 res!764512) b!1149031))

(assert (= (and b!1149031 res!764517) b!1149028))

(assert (= (and b!1149028 res!764516) b!1149025))

(assert (= (and b!1149025 res!764513) b!1149021))

(assert (= (and b!1149021 res!764518) b!1149012))

(assert (= (and b!1149012 res!764519) b!1149029))

(assert (= (and b!1149029 res!764521) b!1149018))

(assert (= (and b!1149018 res!764510) b!1149019))

(assert (= (and b!1149019 res!764514) b!1149023))

(assert (= (and b!1149023 (not res!764520)) b!1149015))

(assert (= (and b!1149015 (not res!764511)) b!1149026))

(assert (= (and b!1149026 c!113598) b!1149035))

(assert (= (and b!1149026 (not c!113598)) b!1149027))

(assert (= (or b!1149035 b!1149027) bm!53207))

(assert (= (or b!1149035 b!1149027) bm!53204))

(assert (= (and b!1149026 (not res!764522)) b!1149032))

(assert (= (and b!1149032 c!113600) b!1149037))

(assert (= (and b!1149032 (not c!113600)) b!1149034))

(assert (= (and b!1149037 c!113596) b!1149010))

(assert (= (and b!1149037 (not c!113596)) b!1149016))

(assert (= (and b!1149016 c!113599) b!1149039))

(assert (= (and b!1149016 (not c!113599)) b!1149014))

(assert (= (and b!1149014 c!113595) b!1149030))

(assert (= (and b!1149014 (not c!113595)) b!1149017))

(assert (= (or b!1149039 b!1149030) bm!53205))

(assert (= (or b!1149039 b!1149030) bm!53203))

(assert (= (or b!1149039 b!1149030) bm!53200))

(assert (= (or b!1149010 bm!53200) bm!53202))

(assert (= (or b!1149010 bm!53205) bm!53206))

(assert (= (or b!1149010 bm!53203) bm!53201))

(assert (= (and b!1149037 c!113597) b!1149024))

(assert (= (and b!1149037 (not c!113597)) b!1149013))

(assert (= (and b!1149037 res!764508) b!1149022))

(assert (= (and b!1149032 res!764515) b!1149011))

(assert (= (and b!1149038 condMapEmpty!45080) mapIsEmpty!45080))

(assert (= (and b!1149038 (not condMapEmpty!45080)) mapNonEmpty!45080))

(get-info :version)

(assert (= (and mapNonEmpty!45080 ((_ is ValueCellFull!13709) mapValue!45080)) b!1149033))

(assert (= (and b!1149038 ((_ is ValueCellFull!13709) mapDefault!45080)) b!1149020))

(assert (= start!98696 b!1149038))

(declare-fun b_lambda!19395 () Bool)

(assert (=> (not b_lambda!19395) (not b!1149015)))

(declare-fun t!36467 () Bool)

(declare-fun tb!9111 () Bool)

(assert (=> (and start!98696 (= defaultEntry!1004 defaultEntry!1004) t!36467) tb!9111))

(declare-fun result!18795 () Bool)

(assert (=> tb!9111 (= result!18795 tp_is_empty!28837)))

(assert (=> b!1149015 t!36467))

(declare-fun b_and!39443 () Bool)

(assert (= b_and!39441 (and (=> t!36467 result!18795) b_and!39443)))

(declare-fun m!1058943 () Bool)

(assert (=> b!1149035 m!1058943))

(declare-fun m!1058945 () Bool)

(assert (=> b!1149036 m!1058945))

(declare-fun m!1058947 () Bool)

(assert (=> bm!53207 m!1058947))

(declare-fun m!1058949 () Bool)

(assert (=> b!1149024 m!1058949))

(declare-fun m!1058951 () Bool)

(assert (=> start!98696 m!1058951))

(declare-fun m!1058953 () Bool)

(assert (=> start!98696 m!1058953))

(declare-fun m!1058955 () Bool)

(assert (=> b!1149019 m!1058955))

(declare-fun m!1058957 () Bool)

(assert (=> b!1149025 m!1058957))

(declare-fun m!1058959 () Bool)

(assert (=> bm!53206 m!1058959))

(declare-fun m!1058961 () Bool)

(assert (=> b!1149023 m!1058961))

(declare-fun m!1058963 () Bool)

(assert (=> b!1149023 m!1058963))

(declare-fun m!1058965 () Bool)

(assert (=> b!1149010 m!1058965))

(assert (=> b!1149010 m!1058965))

(declare-fun m!1058967 () Bool)

(assert (=> b!1149010 m!1058967))

(declare-fun m!1058969 () Bool)

(assert (=> b!1149010 m!1058969))

(declare-fun m!1058971 () Bool)

(assert (=> b!1149029 m!1058971))

(declare-fun m!1058973 () Bool)

(assert (=> b!1149015 m!1058973))

(declare-fun m!1058975 () Bool)

(assert (=> b!1149015 m!1058975))

(declare-fun m!1058977 () Bool)

(assert (=> b!1149015 m!1058977))

(declare-fun m!1058979 () Bool)

(assert (=> b!1149015 m!1058979))

(declare-fun m!1058981 () Bool)

(assert (=> bm!53201 m!1058981))

(assert (=> b!1149022 m!1058949))

(declare-fun m!1058983 () Bool)

(assert (=> b!1149012 m!1058983))

(declare-fun m!1058985 () Bool)

(assert (=> b!1149032 m!1058985))

(declare-fun m!1058987 () Bool)

(assert (=> b!1149032 m!1058987))

(declare-fun m!1058989 () Bool)

(assert (=> b!1149032 m!1058989))

(declare-fun m!1058991 () Bool)

(assert (=> b!1149032 m!1058991))

(assert (=> b!1149032 m!1058987))

(declare-fun m!1058993 () Bool)

(assert (=> b!1149032 m!1058993))

(declare-fun m!1058995 () Bool)

(assert (=> b!1149032 m!1058995))

(declare-fun m!1058997 () Bool)

(assert (=> b!1149032 m!1058997))

(assert (=> b!1149032 m!1058989))

(declare-fun m!1058999 () Bool)

(assert (=> b!1149032 m!1058999))

(assert (=> b!1149032 m!1058997))

(assert (=> b!1149032 m!1058989))

(declare-fun m!1059001 () Bool)

(assert (=> b!1149032 m!1059001))

(declare-fun m!1059003 () Bool)

(assert (=> mapNonEmpty!45080 m!1059003))

(assert (=> b!1149011 m!1058947))

(assert (=> bm!53204 m!1058999))

(assert (=> b!1149026 m!1058989))

(declare-fun m!1059005 () Bool)

(assert (=> b!1149026 m!1059005))

(declare-fun m!1059007 () Bool)

(assert (=> b!1149037 m!1059007))

(declare-fun m!1059009 () Bool)

(assert (=> b!1149037 m!1059009))

(declare-fun m!1059011 () Bool)

(assert (=> b!1149037 m!1059011))

(declare-fun m!1059013 () Bool)

(assert (=> b!1149037 m!1059013))

(declare-fun m!1059015 () Bool)

(assert (=> b!1149028 m!1059015))

(declare-fun m!1059017 () Bool)

(assert (=> b!1149018 m!1059017))

(declare-fun m!1059019 () Bool)

(assert (=> b!1149018 m!1059019))

(declare-fun m!1059021 () Bool)

(assert (=> bm!53202 m!1059021))

(check-sat (not mapNonEmpty!45080) (not b!1149032) (not bm!53206) (not b!1149035) (not b!1149010) (not b!1149036) b_and!39443 (not b_lambda!19395) (not b!1149011) (not b!1149026) (not b!1149022) (not b!1149015) (not b!1149023) (not bm!53204) (not start!98696) (not b!1149028) (not b!1149037) tp_is_empty!28837 (not bm!53202) (not bm!53207) (not b!1149019) (not bm!53201) (not b_next!24307) (not b!1149012) (not b!1149025) (not b!1149018) (not b!1149024))
(check-sat b_and!39443 (not b_next!24307))
