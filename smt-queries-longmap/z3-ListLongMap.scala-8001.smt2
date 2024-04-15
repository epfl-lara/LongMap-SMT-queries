; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98840 () Bool)

(assert start!98840)

(declare-fun b_free!24451 () Bool)

(declare-fun b_next!24451 () Bool)

(assert (=> start!98840 (= b_free!24451 (not b_next!24451))))

(declare-fun tp!86063 () Bool)

(declare-fun b_and!39729 () Bool)

(assert (=> start!98840 (= tp!86063 b_and!39729)))

(declare-fun b!1155634 () Bool)

(declare-fun e!657221 () Bool)

(declare-fun e!657213 () Bool)

(assert (=> b!1155634 (= e!657221 e!657213)))

(declare-fun res!767759 () Bool)

(assert (=> b!1155634 (=> res!767759 e!657213)))

(declare-datatypes ((array!74726 0))(
  ( (array!74727 (arr!36014 (Array (_ BitVec 32) (_ BitVec 64))) (size!36552 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74726)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1155634 (= res!767759 (not (= (select (arr!36014 _keys!1208) from!1455) k0!934)))))

(declare-fun e!657218 () Bool)

(assert (=> b!1155634 e!657218))

(declare-fun c!114892 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1155634 (= c!114892 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((V!43769 0))(
  ( (V!43770 (val!14547 Int)) )
))
(declare-datatypes ((ValueCell!13781 0))(
  ( (ValueCellFull!13781 (v!17183 V!43769)) (EmptyCell!13781) )
))
(declare-datatypes ((array!74728 0))(
  ( (array!74729 (arr!36015 (Array (_ BitVec 32) ValueCell!13781)) (size!36553 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74728)

(declare-fun minValue!944 () V!43769)

(declare-fun zeroValue!944 () V!43769)

(declare-datatypes ((Unit!37904 0))(
  ( (Unit!37905) )
))
(declare-fun lt!518439 () Unit!37904)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!620 (array!74726 array!74728 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37904)

(assert (=> b!1155634 (= lt!518439 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!620 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155635 () Bool)

(declare-fun res!767749 () Bool)

(declare-fun e!657212 () Bool)

(assert (=> b!1155635 (=> (not res!767749) (not e!657212))))

(assert (=> b!1155635 (= res!767749 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36552 _keys!1208))))))

(declare-datatypes ((tuple2!18578 0))(
  ( (tuple2!18579 (_1!9300 (_ BitVec 64)) (_2!9300 V!43769)) )
))
(declare-datatypes ((List!25308 0))(
  ( (Nil!25305) (Cons!25304 (h!26513 tuple2!18578) (t!36742 List!25308)) )
))
(declare-datatypes ((ListLongMap!16547 0))(
  ( (ListLongMap!16548 (toList!8289 List!25308)) )
))
(declare-fun lt!518431 () ListLongMap!16547)

(declare-fun bm!54928 () Bool)

(declare-fun lt!518444 () ListLongMap!16547)

(declare-fun call!54931 () Unit!37904)

(declare-fun c!114891 () Bool)

(declare-fun c!114896 () Bool)

(declare-fun addStillContains!911 (ListLongMap!16547 (_ BitVec 64) V!43769 (_ BitVec 64)) Unit!37904)

(assert (=> bm!54928 (= call!54931 (addStillContains!911 (ite c!114891 lt!518444 lt!518431) (ite c!114891 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!114896 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!114891 minValue!944 (ite c!114896 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1155636 () Bool)

(declare-fun e!657215 () Unit!37904)

(declare-fun Unit!37906 () Unit!37904)

(assert (=> b!1155636 (= e!657215 Unit!37906)))

(declare-fun lt!518426 () Bool)

(assert (=> b!1155636 (= lt!518426 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1155636 (= c!114891 (and (not lt!518426) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!518436 () Unit!37904)

(declare-fun e!657206 () Unit!37904)

(assert (=> b!1155636 (= lt!518436 e!657206)))

(declare-fun lt!518443 () Unit!37904)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!497 (array!74726 array!74728 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 64) (_ BitVec 32) Int) Unit!37904)

(assert (=> b!1155636 (= lt!518443 (lemmaListMapContainsThenArrayContainsFrom!497 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!114894 () Bool)

(assert (=> b!1155636 (= c!114894 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!767752 () Bool)

(declare-fun e!657219 () Bool)

(assert (=> b!1155636 (= res!767752 e!657219)))

(declare-fun e!657210 () Bool)

(assert (=> b!1155636 (=> (not res!767752) (not e!657210))))

(assert (=> b!1155636 e!657210))

(declare-fun lt!518429 () Unit!37904)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74726 (_ BitVec 32) (_ BitVec 32)) Unit!37904)

(assert (=> b!1155636 (= lt!518429 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25309 0))(
  ( (Nil!25306) (Cons!25305 (h!26514 (_ BitVec 64)) (t!36743 List!25309)) )
))
(declare-fun arrayNoDuplicates!0 (array!74726 (_ BitVec 32) List!25309) Bool)

(assert (=> b!1155636 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25306)))

(declare-fun lt!518433 () Unit!37904)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74726 (_ BitVec 64) (_ BitVec 32) List!25309) Unit!37904)

(assert (=> b!1155636 (= lt!518433 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25306))))

(assert (=> b!1155636 false))

(declare-fun b!1155637 () Bool)

(declare-fun e!657209 () Bool)

(declare-fun e!657220 () Bool)

(assert (=> b!1155637 (= e!657209 (not e!657220))))

(declare-fun res!767753 () Bool)

(assert (=> b!1155637 (=> res!767753 e!657220)))

(assert (=> b!1155637 (= res!767753 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1155637 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!518438 () Unit!37904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74726 (_ BitVec 64) (_ BitVec 32)) Unit!37904)

(assert (=> b!1155637 (= lt!518438 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1155638 () Bool)

(assert (=> b!1155638 (= e!657220 e!657221)))

(declare-fun res!767757 () Bool)

(assert (=> b!1155638 (=> res!767757 e!657221)))

(assert (=> b!1155638 (= res!767757 (not (= from!1455 i!673)))))

(declare-fun lt!518442 () array!74726)

(declare-fun lt!518445 () array!74728)

(declare-fun lt!518425 () ListLongMap!16547)

(declare-fun getCurrentListMapNoExtraKeys!4770 (array!74726 array!74728 (_ BitVec 32) (_ BitVec 32) V!43769 V!43769 (_ BitVec 32) Int) ListLongMap!16547)

(assert (=> b!1155638 (= lt!518425 (getCurrentListMapNoExtraKeys!4770 lt!518442 lt!518445 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!518441 () V!43769)

(assert (=> b!1155638 (= lt!518445 (array!74729 (store (arr!36015 _values!996) i!673 (ValueCellFull!13781 lt!518441)) (size!36553 _values!996)))))

(declare-fun dynLambda!2728 (Int (_ BitVec 64)) V!43769)

(assert (=> b!1155638 (= lt!518441 (dynLambda!2728 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!518428 () ListLongMap!16547)

(assert (=> b!1155638 (= lt!518428 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1155639 () Bool)

(declare-fun e!657216 () Unit!37904)

(declare-fun e!657217 () Unit!37904)

(assert (=> b!1155639 (= e!657216 e!657217)))

(declare-fun c!114895 () Bool)

(assert (=> b!1155639 (= c!114895 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!518426))))

(declare-fun b!1155640 () Bool)

(declare-fun e!657214 () Bool)

(declare-fun tp_is_empty!28981 () Bool)

(assert (=> b!1155640 (= e!657214 tp_is_empty!28981)))

(declare-fun b!1155641 () Bool)

(declare-fun Unit!37907 () Unit!37904)

(assert (=> b!1155641 (= e!657217 Unit!37907)))

(declare-fun mapNonEmpty!45296 () Bool)

(declare-fun mapRes!45296 () Bool)

(declare-fun tp!86064 () Bool)

(assert (=> mapNonEmpty!45296 (= mapRes!45296 (and tp!86064 e!657214))))

(declare-fun mapRest!45296 () (Array (_ BitVec 32) ValueCell!13781))

(declare-fun mapKey!45296 () (_ BitVec 32))

(declare-fun mapValue!45296 () ValueCell!13781)

(assert (=> mapNonEmpty!45296 (= (arr!36015 _values!996) (store mapRest!45296 mapKey!45296 mapValue!45296))))

(declare-fun b!1155643 () Bool)

(assert (=> b!1155643 (= e!657213 true)))

(declare-fun e!657211 () Bool)

(assert (=> b!1155643 e!657211))

(declare-fun res!767748 () Bool)

(assert (=> b!1155643 (=> (not res!767748) (not e!657211))))

(declare-fun lt!518435 () ListLongMap!16547)

(assert (=> b!1155643 (= res!767748 (= lt!518435 lt!518431))))

(declare-fun -!1348 (ListLongMap!16547 (_ BitVec 64)) ListLongMap!16547)

(assert (=> b!1155643 (= lt!518435 (-!1348 lt!518428 k0!934))))

(declare-fun lt!518424 () V!43769)

(declare-fun +!3700 (ListLongMap!16547 tuple2!18578) ListLongMap!16547)

(assert (=> b!1155643 (= (-!1348 (+!3700 lt!518431 (tuple2!18579 (select (arr!36014 _keys!1208) from!1455) lt!518424)) (select (arr!36014 _keys!1208) from!1455)) lt!518431)))

(declare-fun lt!518427 () Unit!37904)

(declare-fun addThenRemoveForNewKeyIsSame!201 (ListLongMap!16547 (_ BitVec 64) V!43769) Unit!37904)

(assert (=> b!1155643 (= lt!518427 (addThenRemoveForNewKeyIsSame!201 lt!518431 (select (arr!36014 _keys!1208) from!1455) lt!518424))))

(declare-fun get!18365 (ValueCell!13781 V!43769) V!43769)

(assert (=> b!1155643 (= lt!518424 (get!18365 (select (arr!36015 _values!996) from!1455) lt!518441))))

(declare-fun lt!518430 () Unit!37904)

(assert (=> b!1155643 (= lt!518430 e!657215)))

(declare-fun c!114893 () Bool)

(declare-fun contains!6741 (ListLongMap!16547 (_ BitVec 64)) Bool)

(assert (=> b!1155643 (= c!114893 (contains!6741 lt!518431 k0!934))))

(assert (=> b!1155643 (= lt!518431 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155644 () Bool)

(declare-fun res!767754 () Bool)

(assert (=> b!1155644 (=> (not res!767754) (not e!657212))))

(assert (=> b!1155644 (= res!767754 (= (select (arr!36014 _keys!1208) i!673) k0!934))))

(declare-fun b!1155645 () Bool)

(declare-fun res!767760 () Bool)

(assert (=> b!1155645 (=> (not res!767760) (not e!657212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74726 (_ BitVec 32)) Bool)

(assert (=> b!1155645 (= res!767760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1155646 () Bool)

(assert (=> b!1155646 (= e!657219 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1155647 () Bool)

(declare-fun call!54934 () ListLongMap!16547)

(declare-fun call!54936 () ListLongMap!16547)

(assert (=> b!1155647 (= e!657218 (= call!54936 (-!1348 call!54934 k0!934)))))

(declare-fun b!1155648 () Bool)

(declare-fun res!767762 () Bool)

(assert (=> b!1155648 (=> (not res!767762) (not e!657212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1155648 (= res!767762 (validMask!0 mask!1564))))

(declare-fun call!54937 () ListLongMap!16547)

(declare-fun bm!54929 () Bool)

(declare-fun call!54933 () Bool)

(assert (=> bm!54929 (= call!54933 (contains!6741 (ite c!114891 lt!518444 call!54937) k0!934))))

(declare-fun b!1155649 () Bool)

(declare-fun res!767751 () Bool)

(assert (=> b!1155649 (=> (not res!767751) (not e!657209))))

(assert (=> b!1155649 (= res!767751 (arrayNoDuplicates!0 lt!518442 #b00000000000000000000000000000000 Nil!25306))))

(declare-fun b!1155650 () Bool)

(declare-fun call!54935 () ListLongMap!16547)

(assert (=> b!1155650 (contains!6741 call!54935 k0!934)))

(declare-fun lt!518440 () Unit!37904)

(assert (=> b!1155650 (= lt!518440 call!54931)))

(assert (=> b!1155650 call!54933))

(assert (=> b!1155650 (= lt!518444 (+!3700 lt!518431 (tuple2!18579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!518437 () Unit!37904)

(assert (=> b!1155650 (= lt!518437 (addStillContains!911 lt!518431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1155650 (= e!657206 lt!518440)))

(declare-fun b!1155651 () Bool)

(assert (=> b!1155651 (= e!657210 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!54930 () Bool)

(assert (=> bm!54930 (= call!54935 (+!3700 (ite c!114891 lt!518444 lt!518431) (ite c!114891 (tuple2!18579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!114896 (tuple2!18579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1155652 () Bool)

(declare-fun res!767756 () Bool)

(assert (=> b!1155652 (=> (not res!767756) (not e!657212))))

(assert (=> b!1155652 (= res!767756 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25306))))

(declare-fun b!1155653 () Bool)

(declare-fun call!54932 () Bool)

(assert (=> b!1155653 call!54932))

(declare-fun lt!518432 () Unit!37904)

(declare-fun call!54938 () Unit!37904)

(assert (=> b!1155653 (= lt!518432 call!54938)))

(assert (=> b!1155653 (= e!657217 lt!518432)))

(declare-fun res!767761 () Bool)

(assert (=> start!98840 (=> (not res!767761) (not e!657212))))

(assert (=> start!98840 (= res!767761 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36552 _keys!1208))))))

(assert (=> start!98840 e!657212))

(assert (=> start!98840 tp_is_empty!28981))

(declare-fun array_inv!27676 (array!74726) Bool)

(assert (=> start!98840 (array_inv!27676 _keys!1208)))

(assert (=> start!98840 true))

(assert (=> start!98840 tp!86063))

(declare-fun e!657222 () Bool)

(declare-fun array_inv!27677 (array!74728) Bool)

(assert (=> start!98840 (and (array_inv!27677 _values!996) e!657222)))

(declare-fun b!1155642 () Bool)

(declare-fun Unit!37908 () Unit!37904)

(assert (=> b!1155642 (= e!657215 Unit!37908)))

(declare-fun bm!54931 () Bool)

(assert (=> bm!54931 (= call!54934 (getCurrentListMapNoExtraKeys!4770 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155654 () Bool)

(assert (=> b!1155654 (= e!657218 (= call!54936 call!54934))))

(declare-fun b!1155655 () Bool)

(declare-fun e!657208 () Bool)

(assert (=> b!1155655 (= e!657222 (and e!657208 mapRes!45296))))

(declare-fun condMapEmpty!45296 () Bool)

(declare-fun mapDefault!45296 () ValueCell!13781)

(assert (=> b!1155655 (= condMapEmpty!45296 (= (arr!36015 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13781)) mapDefault!45296)))))

(declare-fun b!1155656 () Bool)

(assert (=> b!1155656 (= e!657208 tp_is_empty!28981)))

(declare-fun b!1155657 () Bool)

(assert (=> b!1155657 (= e!657219 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!518426) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!54932 () Bool)

(assert (=> bm!54932 (= call!54932 call!54933)))

(declare-fun b!1155658 () Bool)

(declare-fun res!767755 () Bool)

(assert (=> b!1155658 (=> (not res!767755) (not e!657212))))

(assert (=> b!1155658 (= res!767755 (and (= (size!36553 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36552 _keys!1208) (size!36553 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!54933 () Bool)

(assert (=> bm!54933 (= call!54938 call!54931)))

(declare-fun b!1155659 () Bool)

(assert (=> b!1155659 (= c!114896 (and (not lt!518426) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1155659 (= e!657206 e!657216)))

(declare-fun bm!54934 () Bool)

(assert (=> bm!54934 (= call!54936 (getCurrentListMapNoExtraKeys!4770 lt!518442 lt!518445 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1155660 () Bool)

(declare-fun res!767750 () Bool)

(assert (=> b!1155660 (=> (not res!767750) (not e!657212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1155660 (= res!767750 (validKeyInArray!0 k0!934))))

(declare-fun b!1155661 () Bool)

(declare-fun lt!518434 () Unit!37904)

(assert (=> b!1155661 (= e!657216 lt!518434)))

(assert (=> b!1155661 (= lt!518434 call!54938)))

(assert (=> b!1155661 call!54932))

(declare-fun mapIsEmpty!45296 () Bool)

(assert (=> mapIsEmpty!45296 mapRes!45296))

(declare-fun b!1155662 () Bool)

(assert (=> b!1155662 (= e!657212 e!657209)))

(declare-fun res!767758 () Bool)

(assert (=> b!1155662 (=> (not res!767758) (not e!657209))))

(assert (=> b!1155662 (= res!767758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!518442 mask!1564))))

(assert (=> b!1155662 (= lt!518442 (array!74727 (store (arr!36014 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36552 _keys!1208)))))

(declare-fun b!1155663 () Bool)

(assert (=> b!1155663 (= e!657211 (= lt!518435 (getCurrentListMapNoExtraKeys!4770 lt!518442 lt!518445 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!54935 () Bool)

(assert (=> bm!54935 (= call!54937 call!54935)))

(assert (= (and start!98840 res!767761) b!1155648))

(assert (= (and b!1155648 res!767762) b!1155658))

(assert (= (and b!1155658 res!767755) b!1155645))

(assert (= (and b!1155645 res!767760) b!1155652))

(assert (= (and b!1155652 res!767756) b!1155635))

(assert (= (and b!1155635 res!767749) b!1155660))

(assert (= (and b!1155660 res!767750) b!1155644))

(assert (= (and b!1155644 res!767754) b!1155662))

(assert (= (and b!1155662 res!767758) b!1155649))

(assert (= (and b!1155649 res!767751) b!1155637))

(assert (= (and b!1155637 (not res!767753)) b!1155638))

(assert (= (and b!1155638 (not res!767757)) b!1155634))

(assert (= (and b!1155634 c!114892) b!1155647))

(assert (= (and b!1155634 (not c!114892)) b!1155654))

(assert (= (or b!1155647 b!1155654) bm!54934))

(assert (= (or b!1155647 b!1155654) bm!54931))

(assert (= (and b!1155634 (not res!767759)) b!1155643))

(assert (= (and b!1155643 c!114893) b!1155636))

(assert (= (and b!1155643 (not c!114893)) b!1155642))

(assert (= (and b!1155636 c!114891) b!1155650))

(assert (= (and b!1155636 (not c!114891)) b!1155659))

(assert (= (and b!1155659 c!114896) b!1155661))

(assert (= (and b!1155659 (not c!114896)) b!1155639))

(assert (= (and b!1155639 c!114895) b!1155653))

(assert (= (and b!1155639 (not c!114895)) b!1155641))

(assert (= (or b!1155661 b!1155653) bm!54933))

(assert (= (or b!1155661 b!1155653) bm!54935))

(assert (= (or b!1155661 b!1155653) bm!54932))

(assert (= (or b!1155650 bm!54932) bm!54929))

(assert (= (or b!1155650 bm!54933) bm!54928))

(assert (= (or b!1155650 bm!54935) bm!54930))

(assert (= (and b!1155636 c!114894) b!1155646))

(assert (= (and b!1155636 (not c!114894)) b!1155657))

(assert (= (and b!1155636 res!767752) b!1155651))

(assert (= (and b!1155643 res!767748) b!1155663))

(assert (= (and b!1155655 condMapEmpty!45296) mapIsEmpty!45296))

(assert (= (and b!1155655 (not condMapEmpty!45296)) mapNonEmpty!45296))

(get-info :version)

(assert (= (and mapNonEmpty!45296 ((_ is ValueCellFull!13781) mapValue!45296)) b!1155640))

(assert (= (and b!1155655 ((_ is ValueCellFull!13781) mapDefault!45296)) b!1155656))

(assert (= start!98840 b!1155655))

(declare-fun b_lambda!19539 () Bool)

(assert (=> (not b_lambda!19539) (not b!1155638)))

(declare-fun t!36741 () Bool)

(declare-fun tb!9255 () Bool)

(assert (=> (and start!98840 (= defaultEntry!1004 defaultEntry!1004) t!36741) tb!9255))

(declare-fun result!19083 () Bool)

(assert (=> tb!9255 (= result!19083 tp_is_empty!28981)))

(assert (=> b!1155638 t!36741))

(declare-fun b_and!39731 () Bool)

(assert (= b_and!39729 (and (=> t!36741 result!19083) b_and!39731)))

(declare-fun m!1064711 () Bool)

(assert (=> b!1155652 m!1064711))

(declare-fun m!1064713 () Bool)

(assert (=> b!1155648 m!1064713))

(declare-fun m!1064715 () Bool)

(assert (=> b!1155636 m!1064715))

(declare-fun m!1064717 () Bool)

(assert (=> b!1155636 m!1064717))

(declare-fun m!1064719 () Bool)

(assert (=> b!1155636 m!1064719))

(declare-fun m!1064721 () Bool)

(assert (=> b!1155636 m!1064721))

(declare-fun m!1064723 () Bool)

(assert (=> b!1155647 m!1064723))

(declare-fun m!1064725 () Bool)

(assert (=> bm!54931 m!1064725))

(declare-fun m!1064727 () Bool)

(assert (=> bm!54930 m!1064727))

(declare-fun m!1064729 () Bool)

(assert (=> b!1155651 m!1064729))

(declare-fun m!1064731 () Bool)

(assert (=> b!1155660 m!1064731))

(declare-fun m!1064733 () Bool)

(assert (=> b!1155649 m!1064733))

(declare-fun m!1064735 () Bool)

(assert (=> bm!54928 m!1064735))

(declare-fun m!1064737 () Bool)

(assert (=> b!1155634 m!1064737))

(declare-fun m!1064739 () Bool)

(assert (=> b!1155634 m!1064739))

(declare-fun m!1064741 () Bool)

(assert (=> mapNonEmpty!45296 m!1064741))

(declare-fun m!1064743 () Bool)

(assert (=> b!1155663 m!1064743))

(declare-fun m!1064745 () Bool)

(assert (=> b!1155662 m!1064745))

(declare-fun m!1064747 () Bool)

(assert (=> b!1155662 m!1064747))

(declare-fun m!1064749 () Bool)

(assert (=> b!1155638 m!1064749))

(declare-fun m!1064751 () Bool)

(assert (=> b!1155638 m!1064751))

(declare-fun m!1064753 () Bool)

(assert (=> b!1155638 m!1064753))

(declare-fun m!1064755 () Bool)

(assert (=> b!1155638 m!1064755))

(assert (=> b!1155646 m!1064729))

(assert (=> b!1155643 m!1064725))

(declare-fun m!1064757 () Bool)

(assert (=> b!1155643 m!1064757))

(declare-fun m!1064759 () Bool)

(assert (=> b!1155643 m!1064759))

(declare-fun m!1064761 () Bool)

(assert (=> b!1155643 m!1064761))

(assert (=> b!1155643 m!1064737))

(declare-fun m!1064763 () Bool)

(assert (=> b!1155643 m!1064763))

(assert (=> b!1155643 m!1064757))

(declare-fun m!1064765 () Bool)

(assert (=> b!1155643 m!1064765))

(assert (=> b!1155643 m!1064737))

(declare-fun m!1064767 () Bool)

(assert (=> b!1155643 m!1064767))

(declare-fun m!1064769 () Bool)

(assert (=> b!1155643 m!1064769))

(assert (=> b!1155643 m!1064761))

(assert (=> b!1155643 m!1064737))

(assert (=> bm!54934 m!1064743))

(declare-fun m!1064771 () Bool)

(assert (=> start!98840 m!1064771))

(declare-fun m!1064773 () Bool)

(assert (=> start!98840 m!1064773))

(declare-fun m!1064775 () Bool)

(assert (=> b!1155645 m!1064775))

(declare-fun m!1064777 () Bool)

(assert (=> b!1155637 m!1064777))

(declare-fun m!1064779 () Bool)

(assert (=> b!1155637 m!1064779))

(declare-fun m!1064781 () Bool)

(assert (=> b!1155650 m!1064781))

(declare-fun m!1064783 () Bool)

(assert (=> b!1155650 m!1064783))

(declare-fun m!1064785 () Bool)

(assert (=> b!1155650 m!1064785))

(declare-fun m!1064787 () Bool)

(assert (=> bm!54929 m!1064787))

(declare-fun m!1064789 () Bool)

(assert (=> b!1155644 m!1064789))

(check-sat (not b!1155663) (not b!1155660) (not b!1155645) (not b_next!24451) (not b!1155636) (not b!1155650) b_and!39731 (not b_lambda!19539) (not bm!54934) (not b!1155662) (not bm!54931) (not start!98840) (not b!1155647) (not b!1155652) (not b!1155649) (not b!1155634) (not bm!54928) (not bm!54929) (not mapNonEmpty!45296) (not b!1155637) (not b!1155638) (not b!1155651) tp_is_empty!28981 (not b!1155648) (not bm!54930) (not b!1155646) (not b!1155643))
(check-sat b_and!39731 (not b_next!24451))
