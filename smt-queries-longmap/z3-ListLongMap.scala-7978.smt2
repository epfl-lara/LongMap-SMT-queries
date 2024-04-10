; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98710 () Bool)

(assert start!98710)

(declare-fun b_free!24315 () Bool)

(declare-fun b_next!24315 () Bool)

(assert (=> start!98710 (= b_free!24315 (not b_next!24315))))

(declare-fun tp!85655 () Bool)

(declare-fun b_and!39479 () Bool)

(assert (=> start!98710 (= tp!85655 b_and!39479)))

(declare-fun b!1149502 () Bool)

(declare-fun res!764768 () Bool)

(declare-fun e!653832 () Bool)

(assert (=> b!1149502 (=> (not res!764768) (not e!653832))))

(declare-datatypes ((array!74537 0))(
  ( (array!74538 (arr!35919 (Array (_ BitVec 32) (_ BitVec 64))) (size!36455 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43587 0))(
  ( (V!43588 (val!14479 Int)) )
))
(declare-datatypes ((ValueCell!13713 0))(
  ( (ValueCellFull!13713 (v!17116 V!43587)) (EmptyCell!13713) )
))
(declare-datatypes ((array!74539 0))(
  ( (array!74540 (arr!35920 (Array (_ BitVec 32) ValueCell!13713)) (size!36456 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74539)

(assert (=> b!1149502 (= res!764768 (and (= (size!36456 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36455 _keys!1208) (size!36456 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!653826 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1149503 () Bool)

(declare-fun arrayContainsKey!0 (array!74537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1149503 (= e!653826 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1149504 () Bool)

(declare-datatypes ((Unit!37787 0))(
  ( (Unit!37788) )
))
(declare-fun e!653819 () Unit!37787)

(declare-fun Unit!37789 () Unit!37787)

(assert (=> b!1149504 (= e!653819 Unit!37789)))

(declare-fun lt!514129 () Bool)

(assert (=> b!1149504 (= lt!514129 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113698 () Bool)

(assert (=> b!1149504 (= c!113698 (and (not lt!514129) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514148 () Unit!37787)

(declare-fun e!653831 () Unit!37787)

(assert (=> b!1149504 (= lt!514148 e!653831)))

(declare-fun zeroValue!944 () V!43587)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!514128 () Unit!37787)

(declare-fun minValue!944 () V!43587)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!448 (array!74537 array!74539 (_ BitVec 32) (_ BitVec 32) V!43587 V!43587 (_ BitVec 64) (_ BitVec 32) Int) Unit!37787)

(assert (=> b!1149504 (= lt!514128 (lemmaListMapContainsThenArrayContainsFrom!448 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113697 () Bool)

(assert (=> b!1149504 (= c!113697 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!764763 () Bool)

(assert (=> b!1149504 (= res!764763 e!653826)))

(declare-fun e!653823 () Bool)

(assert (=> b!1149504 (=> (not res!764763) (not e!653823))))

(assert (=> b!1149504 e!653823))

(declare-fun lt!514145 () Unit!37787)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74537 (_ BitVec 32) (_ BitVec 32)) Unit!37787)

(assert (=> b!1149504 (= lt!514145 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25119 0))(
  ( (Nil!25116) (Cons!25115 (h!26324 (_ BitVec 64)) (t!36426 List!25119)) )
))
(declare-fun arrayNoDuplicates!0 (array!74537 (_ BitVec 32) List!25119) Bool)

(assert (=> b!1149504 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25116)))

(declare-fun lt!514142 () Unit!37787)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74537 (_ BitVec 64) (_ BitVec 32) List!25119) Unit!37787)

(assert (=> b!1149504 (= lt!514142 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25116))))

(assert (=> b!1149504 false))

(declare-datatypes ((tuple2!18370 0))(
  ( (tuple2!18371 (_1!9196 (_ BitVec 64)) (_2!9196 V!43587)) )
))
(declare-datatypes ((List!25120 0))(
  ( (Nil!25117) (Cons!25116 (h!26325 tuple2!18370) (t!36427 List!25120)) )
))
(declare-datatypes ((ListLongMap!16339 0))(
  ( (ListLongMap!16340 (toList!8185 List!25120)) )
))
(declare-fun call!53328 () ListLongMap!16339)

(declare-fun lt!514135 () ListLongMap!16339)

(declare-fun c!113696 () Bool)

(declare-fun bm!53319 () Bool)

(declare-fun +!3606 (ListLongMap!16339 tuple2!18370) ListLongMap!16339)

(assert (=> bm!53319 (= call!53328 (+!3606 lt!514135 (ite (or c!113698 c!113696) (tuple2!18371 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1149505 () Bool)

(declare-fun e!653827 () Bool)

(declare-fun e!653830 () Bool)

(declare-fun mapRes!45092 () Bool)

(assert (=> b!1149505 (= e!653827 (and e!653830 mapRes!45092))))

(declare-fun condMapEmpty!45092 () Bool)

(declare-fun mapDefault!45092 () ValueCell!13713)

(assert (=> b!1149505 (= condMapEmpty!45092 (= (arr!35920 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13713)) mapDefault!45092)))))

(declare-fun b!1149506 () Bool)

(declare-fun e!653829 () Bool)

(declare-fun e!653828 () Bool)

(assert (=> b!1149506 (= e!653829 e!653828)))

(declare-fun res!764755 () Bool)

(assert (=> b!1149506 (=> res!764755 e!653828)))

(assert (=> b!1149506 (= res!764755 (not (= (select (arr!35919 _keys!1208) from!1455) k0!934)))))

(declare-fun e!653825 () Bool)

(assert (=> b!1149506 e!653825))

(declare-fun c!113695 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1149506 (= c!113695 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!514147 () Unit!37787)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!555 (array!74537 array!74539 (_ BitVec 32) (_ BitVec 32) V!43587 V!43587 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37787)

(assert (=> b!1149506 (= lt!514147 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!555 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149507 () Bool)

(declare-fun res!764757 () Bool)

(assert (=> b!1149507 (=> (not res!764757) (not e!653832))))

(assert (=> b!1149507 (= res!764757 (= (select (arr!35919 _keys!1208) i!673) k0!934))))

(declare-fun b!1149508 () Bool)

(declare-fun e!653821 () Unit!37787)

(declare-fun Unit!37790 () Unit!37787)

(assert (=> b!1149508 (= e!653821 Unit!37790)))

(declare-fun bm!53320 () Bool)

(declare-fun call!53326 () ListLongMap!16339)

(assert (=> bm!53320 (= call!53326 call!53328)))

(declare-fun b!1149509 () Bool)

(declare-fun call!53325 () ListLongMap!16339)

(declare-fun call!53329 () ListLongMap!16339)

(assert (=> b!1149509 (= e!653825 (= call!53325 call!53329))))

(declare-fun b!1149510 () Bool)

(declare-fun e!653816 () Unit!37787)

(declare-fun lt!514132 () Unit!37787)

(assert (=> b!1149510 (= e!653816 lt!514132)))

(declare-fun call!53322 () Unit!37787)

(assert (=> b!1149510 (= lt!514132 call!53322)))

(declare-fun call!53324 () Bool)

(assert (=> b!1149510 call!53324))

(declare-fun b!1149511 () Bool)

(declare-fun res!764764 () Bool)

(assert (=> b!1149511 (=> (not res!764764) (not e!653832))))

(assert (=> b!1149511 (= res!764764 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36455 _keys!1208))))))

(declare-fun b!1149512 () Bool)

(assert (=> b!1149512 (= e!653823 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!45092 () Bool)

(declare-fun tp!85656 () Bool)

(declare-fun e!653817 () Bool)

(assert (=> mapNonEmpty!45092 (= mapRes!45092 (and tp!85656 e!653817))))

(declare-fun mapRest!45092 () (Array (_ BitVec 32) ValueCell!13713))

(declare-fun mapKey!45092 () (_ BitVec 32))

(declare-fun mapValue!45092 () ValueCell!13713)

(assert (=> mapNonEmpty!45092 (= (arr!35920 _values!996) (store mapRest!45092 mapKey!45092 mapValue!45092))))

(declare-fun b!1149513 () Bool)

(assert (=> b!1149513 (= e!653826 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514129) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1149514 () Bool)

(declare-fun e!653824 () Bool)

(declare-fun e!653822 () Bool)

(assert (=> b!1149514 (= e!653824 (not e!653822))))

(declare-fun res!764761 () Bool)

(assert (=> b!1149514 (=> res!764761 e!653822)))

(assert (=> b!1149514 (= res!764761 (bvsgt from!1455 i!673))))

(assert (=> b!1149514 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!514140 () Unit!37787)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74537 (_ BitVec 64) (_ BitVec 32)) Unit!37787)

(assert (=> b!1149514 (= lt!514140 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1149515 () Bool)

(declare-fun lt!514131 () ListLongMap!16339)

(declare-fun lt!514146 () array!74537)

(declare-fun lt!514134 () array!74539)

(declare-fun e!653820 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4658 (array!74537 array!74539 (_ BitVec 32) (_ BitVec 32) V!43587 V!43587 (_ BitVec 32) Int) ListLongMap!16339)

(assert (=> b!1149515 (= e!653820 (= lt!514131 (getCurrentListMapNoExtraKeys!4658 lt!514146 lt!514134 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53321 () Bool)

(assert (=> bm!53321 (= call!53329 (getCurrentListMapNoExtraKeys!4658 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53322 () Bool)

(assert (=> bm!53322 (= call!53325 (getCurrentListMapNoExtraKeys!4658 lt!514146 lt!514134 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53323 () Bool)

(declare-fun call!53323 () Unit!37787)

(assert (=> bm!53323 (= call!53322 call!53323)))

(declare-fun b!1149516 () Bool)

(declare-fun res!764758 () Bool)

(assert (=> b!1149516 (=> (not res!764758) (not e!653832))))

(assert (=> b!1149516 (= res!764758 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25116))))

(declare-fun bm!53324 () Bool)

(declare-fun lt!514133 () ListLongMap!16339)

(declare-fun call!53327 () Bool)

(declare-fun contains!6706 (ListLongMap!16339 (_ BitVec 64)) Bool)

(assert (=> bm!53324 (= call!53327 (contains!6706 (ite c!113698 lt!514133 call!53326) k0!934))))

(declare-fun bm!53325 () Bool)

(assert (=> bm!53325 (= call!53324 call!53327)))

(declare-fun b!1149517 () Bool)

(declare-fun res!764754 () Bool)

(assert (=> b!1149517 (=> (not res!764754) (not e!653824))))

(assert (=> b!1149517 (= res!764754 (arrayNoDuplicates!0 lt!514146 #b00000000000000000000000000000000 Nil!25116))))

(declare-fun bm!53326 () Bool)

(declare-fun addStillContains!856 (ListLongMap!16339 (_ BitVec 64) V!43587 (_ BitVec 64)) Unit!37787)

(assert (=> bm!53326 (= call!53323 (addStillContains!856 lt!514135 (ite (or c!113698 c!113696) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113698 c!113696) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1149518 () Bool)

(declare-fun res!764762 () Bool)

(assert (=> b!1149518 (=> (not res!764762) (not e!653832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1149518 (= res!764762 (validKeyInArray!0 k0!934))))

(declare-fun b!1149519 () Bool)

(declare-fun Unit!37791 () Unit!37787)

(assert (=> b!1149519 (= e!653819 Unit!37791)))

(declare-fun b!1149520 () Bool)

(declare-fun res!764767 () Bool)

(assert (=> b!1149520 (=> (not res!764767) (not e!653832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74537 (_ BitVec 32)) Bool)

(assert (=> b!1149520 (= res!764767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1149521 () Bool)

(assert (=> b!1149521 (= e!653816 e!653821)))

(declare-fun c!113694 () Bool)

(assert (=> b!1149521 (= c!113694 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!514129))))

(declare-fun mapIsEmpty!45092 () Bool)

(assert (=> mapIsEmpty!45092 mapRes!45092))

(declare-fun b!1149522 () Bool)

(assert (=> b!1149522 call!53324))

(declare-fun lt!514139 () Unit!37787)

(assert (=> b!1149522 (= lt!514139 call!53322)))

(assert (=> b!1149522 (= e!653821 lt!514139)))

(declare-fun res!764759 () Bool)

(assert (=> start!98710 (=> (not res!764759) (not e!653832))))

(assert (=> start!98710 (= res!764759 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36455 _keys!1208))))))

(assert (=> start!98710 e!653832))

(declare-fun tp_is_empty!28845 () Bool)

(assert (=> start!98710 tp_is_empty!28845))

(declare-fun array_inv!27510 (array!74537) Bool)

(assert (=> start!98710 (array_inv!27510 _keys!1208)))

(assert (=> start!98710 true))

(assert (=> start!98710 tp!85655))

(declare-fun array_inv!27511 (array!74539) Bool)

(assert (=> start!98710 (and (array_inv!27511 _values!996) e!653827)))

(declare-fun b!1149523 () Bool)

(declare-fun -!1319 (ListLongMap!16339 (_ BitVec 64)) ListLongMap!16339)

(assert (=> b!1149523 (= e!653825 (= call!53325 (-!1319 call!53329 k0!934)))))

(declare-fun b!1149524 () Bool)

(assert (=> b!1149524 (= e!653822 e!653829)))

(declare-fun res!764756 () Bool)

(assert (=> b!1149524 (=> res!764756 e!653829)))

(assert (=> b!1149524 (= res!764756 (not (= from!1455 i!673)))))

(declare-fun lt!514149 () ListLongMap!16339)

(assert (=> b!1149524 (= lt!514149 (getCurrentListMapNoExtraKeys!4658 lt!514146 lt!514134 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!514138 () V!43587)

(assert (=> b!1149524 (= lt!514134 (array!74540 (store (arr!35920 _values!996) i!673 (ValueCellFull!13713 lt!514138)) (size!36456 _values!996)))))

(declare-fun dynLambda!2683 (Int (_ BitVec 64)) V!43587)

(assert (=> b!1149524 (= lt!514138 (dynLambda!2683 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!514141 () ListLongMap!16339)

(assert (=> b!1149524 (= lt!514141 (getCurrentListMapNoExtraKeys!4658 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1149525 () Bool)

(assert (=> b!1149525 (= e!653828 true)))

(assert (=> b!1149525 e!653820))

(declare-fun res!764765 () Bool)

(assert (=> b!1149525 (=> (not res!764765) (not e!653820))))

(assert (=> b!1149525 (= res!764765 (= lt!514131 lt!514135))))

(assert (=> b!1149525 (= lt!514131 (-!1319 lt!514141 k0!934))))

(declare-fun lt!514130 () V!43587)

(assert (=> b!1149525 (= (-!1319 (+!3606 lt!514135 (tuple2!18371 (select (arr!35919 _keys!1208) from!1455) lt!514130)) (select (arr!35919 _keys!1208) from!1455)) lt!514135)))

(declare-fun lt!514137 () Unit!37787)

(declare-fun addThenRemoveForNewKeyIsSame!163 (ListLongMap!16339 (_ BitVec 64) V!43587) Unit!37787)

(assert (=> b!1149525 (= lt!514137 (addThenRemoveForNewKeyIsSame!163 lt!514135 (select (arr!35919 _keys!1208) from!1455) lt!514130))))

(declare-fun get!18281 (ValueCell!13713 V!43587) V!43587)

(assert (=> b!1149525 (= lt!514130 (get!18281 (select (arr!35920 _values!996) from!1455) lt!514138))))

(declare-fun lt!514143 () Unit!37787)

(assert (=> b!1149525 (= lt!514143 e!653819)))

(declare-fun c!113693 () Bool)

(assert (=> b!1149525 (= c!113693 (contains!6706 lt!514135 k0!934))))

(assert (=> b!1149525 (= lt!514135 (getCurrentListMapNoExtraKeys!4658 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1149526 () Bool)

(assert (=> b!1149526 (= e!653817 tp_is_empty!28845)))

(declare-fun b!1149527 () Bool)

(declare-fun res!764766 () Bool)

(assert (=> b!1149527 (=> (not res!764766) (not e!653832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1149527 (= res!764766 (validMask!0 mask!1564))))

(declare-fun b!1149528 () Bool)

(assert (=> b!1149528 (= e!653830 tp_is_empty!28845)))

(declare-fun b!1149529 () Bool)

(assert (=> b!1149529 (= c!113696 (and (not lt!514129) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1149529 (= e!653831 e!653816)))

(declare-fun b!1149530 () Bool)

(assert (=> b!1149530 (= e!653832 e!653824)))

(declare-fun res!764760 () Bool)

(assert (=> b!1149530 (=> (not res!764760) (not e!653824))))

(assert (=> b!1149530 (= res!764760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514146 mask!1564))))

(assert (=> b!1149530 (= lt!514146 (array!74538 (store (arr!35919 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36455 _keys!1208)))))

(declare-fun b!1149531 () Bool)

(assert (=> b!1149531 (contains!6706 (+!3606 lt!514133 (tuple2!18371 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!514136 () Unit!37787)

(assert (=> b!1149531 (= lt!514136 (addStillContains!856 lt!514133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1149531 call!53327))

(assert (=> b!1149531 (= lt!514133 call!53328)))

(declare-fun lt!514144 () Unit!37787)

(assert (=> b!1149531 (= lt!514144 call!53323)))

(assert (=> b!1149531 (= e!653831 lt!514136)))

(assert (= (and start!98710 res!764759) b!1149527))

(assert (= (and b!1149527 res!764766) b!1149502))

(assert (= (and b!1149502 res!764768) b!1149520))

(assert (= (and b!1149520 res!764767) b!1149516))

(assert (= (and b!1149516 res!764758) b!1149511))

(assert (= (and b!1149511 res!764764) b!1149518))

(assert (= (and b!1149518 res!764762) b!1149507))

(assert (= (and b!1149507 res!764757) b!1149530))

(assert (= (and b!1149530 res!764760) b!1149517))

(assert (= (and b!1149517 res!764754) b!1149514))

(assert (= (and b!1149514 (not res!764761)) b!1149524))

(assert (= (and b!1149524 (not res!764756)) b!1149506))

(assert (= (and b!1149506 c!113695) b!1149523))

(assert (= (and b!1149506 (not c!113695)) b!1149509))

(assert (= (or b!1149523 b!1149509) bm!53322))

(assert (= (or b!1149523 b!1149509) bm!53321))

(assert (= (and b!1149506 (not res!764755)) b!1149525))

(assert (= (and b!1149525 c!113693) b!1149504))

(assert (= (and b!1149525 (not c!113693)) b!1149519))

(assert (= (and b!1149504 c!113698) b!1149531))

(assert (= (and b!1149504 (not c!113698)) b!1149529))

(assert (= (and b!1149529 c!113696) b!1149510))

(assert (= (and b!1149529 (not c!113696)) b!1149521))

(assert (= (and b!1149521 c!113694) b!1149522))

(assert (= (and b!1149521 (not c!113694)) b!1149508))

(assert (= (or b!1149510 b!1149522) bm!53323))

(assert (= (or b!1149510 b!1149522) bm!53320))

(assert (= (or b!1149510 b!1149522) bm!53325))

(assert (= (or b!1149531 bm!53325) bm!53324))

(assert (= (or b!1149531 bm!53323) bm!53326))

(assert (= (or b!1149531 bm!53320) bm!53319))

(assert (= (and b!1149504 c!113697) b!1149503))

(assert (= (and b!1149504 (not c!113697)) b!1149513))

(assert (= (and b!1149504 res!764763) b!1149512))

(assert (= (and b!1149525 res!764765) b!1149515))

(assert (= (and b!1149505 condMapEmpty!45092) mapIsEmpty!45092))

(assert (= (and b!1149505 (not condMapEmpty!45092)) mapNonEmpty!45092))

(get-info :version)

(assert (= (and mapNonEmpty!45092 ((_ is ValueCellFull!13713) mapValue!45092)) b!1149526))

(assert (= (and b!1149505 ((_ is ValueCellFull!13713) mapDefault!45092)) b!1149528))

(assert (= start!98710 b!1149505))

(declare-fun b_lambda!19421 () Bool)

(assert (=> (not b_lambda!19421) (not b!1149524)))

(declare-fun t!36425 () Bool)

(declare-fun tb!9127 () Bool)

(assert (=> (and start!98710 (= defaultEntry!1004 defaultEntry!1004) t!36425) tb!9127))

(declare-fun result!18819 () Bool)

(assert (=> tb!9127 (= result!18819 tp_is_empty!28845)))

(assert (=> b!1149524 t!36425))

(declare-fun b_and!39481 () Bool)

(assert (= b_and!39479 (and (=> t!36425 result!18819) b_and!39481)))

(declare-fun m!1059861 () Bool)

(assert (=> start!98710 m!1059861))

(declare-fun m!1059863 () Bool)

(assert (=> start!98710 m!1059863))

(declare-fun m!1059865 () Bool)

(assert (=> b!1149517 m!1059865))

(declare-fun m!1059867 () Bool)

(assert (=> b!1149527 m!1059867))

(declare-fun m!1059869 () Bool)

(assert (=> bm!53321 m!1059869))

(declare-fun m!1059871 () Bool)

(assert (=> bm!53322 m!1059871))

(declare-fun m!1059873 () Bool)

(assert (=> mapNonEmpty!45092 m!1059873))

(assert (=> b!1149515 m!1059871))

(declare-fun m!1059875 () Bool)

(assert (=> b!1149507 m!1059875))

(declare-fun m!1059877 () Bool)

(assert (=> b!1149520 m!1059877))

(declare-fun m!1059879 () Bool)

(assert (=> b!1149504 m!1059879))

(declare-fun m!1059881 () Bool)

(assert (=> b!1149504 m!1059881))

(declare-fun m!1059883 () Bool)

(assert (=> b!1149504 m!1059883))

(declare-fun m!1059885 () Bool)

(assert (=> b!1149504 m!1059885))

(declare-fun m!1059887 () Bool)

(assert (=> b!1149503 m!1059887))

(declare-fun m!1059889 () Bool)

(assert (=> bm!53324 m!1059889))

(declare-fun m!1059891 () Bool)

(assert (=> b!1149523 m!1059891))

(declare-fun m!1059893 () Bool)

(assert (=> b!1149518 m!1059893))

(declare-fun m!1059895 () Bool)

(assert (=> b!1149524 m!1059895))

(declare-fun m!1059897 () Bool)

(assert (=> b!1149524 m!1059897))

(declare-fun m!1059899 () Bool)

(assert (=> b!1149524 m!1059899))

(declare-fun m!1059901 () Bool)

(assert (=> b!1149524 m!1059901))

(declare-fun m!1059903 () Bool)

(assert (=> b!1149506 m!1059903))

(declare-fun m!1059905 () Bool)

(assert (=> b!1149506 m!1059905))

(declare-fun m!1059907 () Bool)

(assert (=> b!1149516 m!1059907))

(declare-fun m!1059909 () Bool)

(assert (=> b!1149531 m!1059909))

(assert (=> b!1149531 m!1059909))

(declare-fun m!1059911 () Bool)

(assert (=> b!1149531 m!1059911))

(declare-fun m!1059913 () Bool)

(assert (=> b!1149531 m!1059913))

(declare-fun m!1059915 () Bool)

(assert (=> b!1149530 m!1059915))

(declare-fun m!1059917 () Bool)

(assert (=> b!1149530 m!1059917))

(declare-fun m!1059919 () Bool)

(assert (=> bm!53319 m!1059919))

(declare-fun m!1059921 () Bool)

(assert (=> b!1149525 m!1059921))

(assert (=> b!1149525 m!1059869))

(declare-fun m!1059923 () Bool)

(assert (=> b!1149525 m!1059923))

(assert (=> b!1149525 m!1059903))

(declare-fun m!1059925 () Bool)

(assert (=> b!1149525 m!1059925))

(declare-fun m!1059927 () Bool)

(assert (=> b!1149525 m!1059927))

(declare-fun m!1059929 () Bool)

(assert (=> b!1149525 m!1059929))

(declare-fun m!1059931 () Bool)

(assert (=> b!1149525 m!1059931))

(assert (=> b!1149525 m!1059903))

(assert (=> b!1149525 m!1059927))

(assert (=> b!1149525 m!1059921))

(assert (=> b!1149525 m!1059903))

(declare-fun m!1059933 () Bool)

(assert (=> b!1149525 m!1059933))

(declare-fun m!1059935 () Bool)

(assert (=> b!1149514 m!1059935))

(declare-fun m!1059937 () Bool)

(assert (=> b!1149514 m!1059937))

(assert (=> b!1149512 m!1059887))

(declare-fun m!1059939 () Bool)

(assert (=> bm!53326 m!1059939))

(check-sat (not bm!53326) (not b_next!24315) (not b!1149525) (not b!1149504) (not b!1149514) b_and!39481 tp_is_empty!28845 (not b!1149527) (not b!1149523) (not b!1149517) (not start!98710) (not b!1149506) (not b!1149518) (not bm!53322) (not b!1149530) (not bm!53324) (not b!1149516) (not bm!53319) (not b!1149512) (not mapNonEmpty!45092) (not b!1149524) (not b!1149520) (not b!1149503) (not bm!53321) (not b!1149515) (not b_lambda!19421) (not b!1149531))
(check-sat b_and!39481 (not b_next!24315))
