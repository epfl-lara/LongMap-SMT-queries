; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98656 () Bool)

(assert start!98656)

(declare-fun b_free!24025 () Bool)

(declare-fun b_next!24025 () Bool)

(assert (=> start!98656 (= b_free!24025 (not b_next!24025))))

(declare-fun tp!84786 () Bool)

(declare-fun b_and!38901 () Bool)

(assert (=> start!98656 (= tp!84786 b_and!38901)))

(declare-fun e!647511 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((V!43201 0))(
  ( (V!43202 (val!14334 Int)) )
))
(declare-datatypes ((tuple2!18106 0))(
  ( (tuple2!18107 (_1!9064 (_ BitVec 64)) (_2!9064 V!43201)) )
))
(declare-datatypes ((List!24871 0))(
  ( (Nil!24868) (Cons!24867 (h!26085 tuple2!18106) (t!35880 List!24871)) )
))
(declare-datatypes ((ListLongMap!16083 0))(
  ( (ListLongMap!16084 (toList!8057 List!24871)) )
))
(declare-fun call!49914 () ListLongMap!16083)

(declare-fun call!49910 () ListLongMap!16083)

(declare-fun b!1137696 () Bool)

(declare-fun -!1202 (ListLongMap!16083 (_ BitVec 64)) ListLongMap!16083)

(assert (=> b!1137696 (= e!647511 (= call!49910 (-!1202 call!49914 k0!934)))))

(declare-fun b!1137697 () Bool)

(declare-datatypes ((Unit!37188 0))(
  ( (Unit!37189) )
))
(declare-fun e!647509 () Unit!37188)

(declare-fun e!647515 () Unit!37188)

(assert (=> b!1137697 (= e!647509 e!647515)))

(declare-fun c!111489 () Bool)

(declare-fun lt!505755 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1137697 (= c!111489 (and (not lt!505755) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1137698 () Bool)

(declare-fun e!647517 () Bool)

(declare-fun e!647514 () Bool)

(declare-fun mapRes!44657 () Bool)

(assert (=> b!1137698 (= e!647517 (and e!647514 mapRes!44657))))

(declare-fun condMapEmpty!44657 () Bool)

(declare-datatypes ((ValueCell!13568 0))(
  ( (ValueCellFull!13568 (v!16967 V!43201)) (EmptyCell!13568) )
))
(declare-datatypes ((array!74011 0))(
  ( (array!74012 (arr!35650 (Array (_ BitVec 32) ValueCell!13568)) (size!36187 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74011)

(declare-fun mapDefault!44657 () ValueCell!13568)

(assert (=> b!1137698 (= condMapEmpty!44657 (= (arr!35650 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13568)) mapDefault!44657)))))

(declare-datatypes ((array!74013 0))(
  ( (array!74014 (arr!35651 (Array (_ BitVec 32) (_ BitVec 64))) (size!36188 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74013)

(declare-fun e!647512 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1137699 () Bool)

(declare-fun arrayContainsKey!0 (array!74013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137699 (= e!647512 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137700 () Bool)

(declare-fun res!758982 () Bool)

(declare-fun e!647505 () Bool)

(assert (=> b!1137700 (=> (not res!758982) (not e!647505))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137700 (= res!758982 (validMask!0 mask!1564))))

(declare-fun res!758969 () Bool)

(assert (=> start!98656 (=> (not res!758969) (not e!647505))))

(assert (=> start!98656 (= res!758969 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36188 _keys!1208))))))

(assert (=> start!98656 e!647505))

(declare-fun tp_is_empty!28555 () Bool)

(assert (=> start!98656 tp_is_empty!28555))

(declare-fun array_inv!27386 (array!74013) Bool)

(assert (=> start!98656 (array_inv!27386 _keys!1208)))

(assert (=> start!98656 true))

(assert (=> start!98656 tp!84786))

(declare-fun array_inv!27387 (array!74011) Bool)

(assert (=> start!98656 (and (array_inv!27387 _values!996) e!647517)))

(declare-fun b!1137701 () Bool)

(declare-fun res!758980 () Bool)

(declare-fun e!647519 () Bool)

(assert (=> b!1137701 (=> res!758980 e!647519)))

(declare-datatypes ((List!24872 0))(
  ( (Nil!24869) (Cons!24868 (h!26086 (_ BitVec 64)) (t!35881 List!24872)) )
))
(declare-fun contains!6607 (List!24872 (_ BitVec 64)) Bool)

(assert (=> b!1137701 (= res!758980 (contains!6607 Nil!24869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1137702 () Bool)

(assert (=> b!1137702 (= e!647514 tp_is_empty!28555)))

(declare-fun zeroValue!944 () V!43201)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!505759 () array!74013)

(declare-fun lt!505762 () array!74011)

(declare-fun minValue!944 () V!43201)

(declare-fun bm!49904 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4568 (array!74013 array!74011 (_ BitVec 32) (_ BitVec 32) V!43201 V!43201 (_ BitVec 32) Int) ListLongMap!16083)

(assert (=> bm!49904 (= call!49910 (getCurrentListMapNoExtraKeys!4568 lt!505759 lt!505762 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!647507 () Bool)

(declare-fun b!1137703 () Bool)

(assert (=> b!1137703 (= e!647507 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1137704 () Bool)

(declare-fun e!647510 () Bool)

(declare-fun e!647516 () Bool)

(assert (=> b!1137704 (= e!647510 (not e!647516))))

(declare-fun res!758974 () Bool)

(assert (=> b!1137704 (=> res!758974 e!647516)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137704 (= res!758974 (bvsgt from!1455 i!673))))

(assert (=> b!1137704 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505760 () Unit!37188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74013 (_ BitVec 64) (_ BitVec 32)) Unit!37188)

(assert (=> b!1137704 (= lt!505760 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137705 () Bool)

(declare-fun e!647518 () Bool)

(declare-fun e!647506 () Bool)

(assert (=> b!1137705 (= e!647518 e!647506)))

(declare-fun res!758984 () Bool)

(assert (=> b!1137705 (=> res!758984 e!647506)))

(assert (=> b!1137705 (= res!758984 (not (= (select (arr!35651 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137705 e!647511))

(declare-fun c!111488 () Bool)

(assert (=> b!1137705 (= c!111488 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505758 () Unit!37188)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!458 (array!74013 array!74011 (_ BitVec 32) (_ BitVec 32) V!43201 V!43201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37188)

(assert (=> b!1137705 (= lt!505758 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137706 () Bool)

(declare-fun e!647521 () Bool)

(assert (=> b!1137706 (= e!647506 e!647521)))

(declare-fun res!758983 () Bool)

(assert (=> b!1137706 (=> res!758983 e!647521)))

(declare-fun lt!505765 () ListLongMap!16083)

(declare-fun contains!6608 (ListLongMap!16083 (_ BitVec 64)) Bool)

(assert (=> b!1137706 (= res!758983 (not (contains!6608 lt!505765 k0!934)))))

(assert (=> b!1137706 (= lt!505765 (getCurrentListMapNoExtraKeys!4568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137707 () Bool)

(assert (=> b!1137707 (= e!647511 (= call!49910 call!49914))))

(declare-fun b!1137708 () Bool)

(assert (=> b!1137708 (= e!647505 e!647510)))

(declare-fun res!758971 () Bool)

(assert (=> b!1137708 (=> (not res!758971) (not e!647510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74013 (_ BitVec 32)) Bool)

(assert (=> b!1137708 (= res!758971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505759 mask!1564))))

(assert (=> b!1137708 (= lt!505759 (array!74014 (store (arr!35651 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36188 _keys!1208)))))

(declare-fun b!1137709 () Bool)

(declare-fun res!758973 () Bool)

(assert (=> b!1137709 (=> (not res!758973) (not e!647505))))

(assert (=> b!1137709 (= res!758973 (= (select (arr!35651 _keys!1208) i!673) k0!934))))

(declare-fun bm!49905 () Bool)

(declare-fun call!49913 () Unit!37188)

(declare-fun call!49911 () Unit!37188)

(assert (=> bm!49905 (= call!49913 call!49911)))

(declare-fun b!1137710 () Bool)

(declare-fun call!49907 () Bool)

(assert (=> b!1137710 call!49907))

(declare-fun lt!505757 () Unit!37188)

(assert (=> b!1137710 (= lt!505757 call!49913)))

(assert (=> b!1137710 (= e!647515 lt!505757)))

(declare-fun bm!49906 () Bool)

(declare-fun call!49908 () ListLongMap!16083)

(declare-fun call!49912 () ListLongMap!16083)

(assert (=> bm!49906 (= call!49908 call!49912)))

(declare-fun b!1137711 () Bool)

(declare-fun res!758975 () Bool)

(assert (=> b!1137711 (=> (not res!758975) (not e!647505))))

(assert (=> b!1137711 (= res!758975 (and (= (size!36187 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36188 _keys!1208) (size!36187 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137712 () Bool)

(assert (=> b!1137712 (= e!647521 e!647519)))

(declare-fun res!758981 () Bool)

(assert (=> b!1137712 (=> res!758981 e!647519)))

(assert (=> b!1137712 (= res!758981 (or (bvsge (size!36188 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36188 _keys!1208)) (bvsge from!1455 (size!36188 _keys!1208))))))

(declare-fun arrayNoDuplicates!0 (array!74013 (_ BitVec 32) List!24872) Bool)

(assert (=> b!1137712 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24869)))

(declare-fun lt!505766 () Unit!37188)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74013 (_ BitVec 32) (_ BitVec 32)) Unit!37188)

(assert (=> b!1137712 (= lt!505766 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137712 e!647507))

(declare-fun res!758979 () Bool)

(assert (=> b!1137712 (=> (not res!758979) (not e!647507))))

(assert (=> b!1137712 (= res!758979 e!647512)))

(declare-fun c!111492 () Bool)

(assert (=> b!1137712 (= c!111492 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505768 () Unit!37188)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!346 (array!74013 array!74011 (_ BitVec 32) (_ BitVec 32) V!43201 V!43201 (_ BitVec 64) (_ BitVec 32) Int) Unit!37188)

(assert (=> b!1137712 (= lt!505768 (lemmaListMapContainsThenArrayContainsFrom!346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505754 () Unit!37188)

(assert (=> b!1137712 (= lt!505754 e!647509)))

(declare-fun c!111490 () Bool)

(assert (=> b!1137712 (= c!111490 (and (not lt!505755) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1137712 (= lt!505755 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1137713 () Bool)

(assert (=> b!1137713 (= e!647512 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505755) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137714 () Bool)

(declare-fun lt!505761 () Unit!37188)

(assert (=> b!1137714 (= e!647509 lt!505761)))

(declare-fun lt!505764 () Unit!37188)

(assert (=> b!1137714 (= lt!505764 call!49911)))

(declare-fun lt!505756 () ListLongMap!16083)

(assert (=> b!1137714 (= lt!505756 call!49912)))

(declare-fun call!49909 () Bool)

(assert (=> b!1137714 call!49909))

(declare-fun addStillContains!738 (ListLongMap!16083 (_ BitVec 64) V!43201 (_ BitVec 64)) Unit!37188)

(assert (=> b!1137714 (= lt!505761 (addStillContains!738 lt!505756 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3512 (ListLongMap!16083 tuple2!18106) ListLongMap!16083)

(assert (=> b!1137714 (contains!6608 (+!3512 lt!505756 (tuple2!18107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1137715 () Bool)

(declare-fun e!647513 () Unit!37188)

(declare-fun lt!505753 () Unit!37188)

(assert (=> b!1137715 (= e!647513 lt!505753)))

(assert (=> b!1137715 (= lt!505753 call!49913)))

(assert (=> b!1137715 call!49907))

(declare-fun mapNonEmpty!44657 () Bool)

(declare-fun tp!84785 () Bool)

(declare-fun e!647508 () Bool)

(assert (=> mapNonEmpty!44657 (= mapRes!44657 (and tp!84785 e!647508))))

(declare-fun mapValue!44657 () ValueCell!13568)

(declare-fun mapKey!44657 () (_ BitVec 32))

(declare-fun mapRest!44657 () (Array (_ BitVec 32) ValueCell!13568))

(assert (=> mapNonEmpty!44657 (= (arr!35650 _values!996) (store mapRest!44657 mapKey!44657 mapValue!44657))))

(declare-fun b!1137716 () Bool)

(declare-fun c!111491 () Bool)

(assert (=> b!1137716 (= c!111491 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505755))))

(assert (=> b!1137716 (= e!647515 e!647513)))

(declare-fun bm!49907 () Bool)

(assert (=> bm!49907 (= call!49909 (contains!6608 (ite c!111490 lt!505756 call!49908) k0!934))))

(declare-fun b!1137717 () Bool)

(declare-fun res!758968 () Bool)

(assert (=> b!1137717 (=> (not res!758968) (not e!647505))))

(assert (=> b!1137717 (= res!758968 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24869))))

(declare-fun b!1137718 () Bool)

(assert (=> b!1137718 (= e!647508 tp_is_empty!28555)))

(declare-fun b!1137719 () Bool)

(assert (=> b!1137719 (= e!647516 e!647518)))

(declare-fun res!758985 () Bool)

(assert (=> b!1137719 (=> res!758985 e!647518)))

(assert (=> b!1137719 (= res!758985 (not (= from!1455 i!673)))))

(declare-fun lt!505763 () ListLongMap!16083)

(assert (=> b!1137719 (= lt!505763 (getCurrentListMapNoExtraKeys!4568 lt!505759 lt!505762 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2619 (Int (_ BitVec 64)) V!43201)

(assert (=> b!1137719 (= lt!505762 (array!74012 (store (arr!35650 _values!996) i!673 (ValueCellFull!13568 (dynLambda!2619 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36187 _values!996)))))

(declare-fun lt!505752 () ListLongMap!16083)

(assert (=> b!1137719 (= lt!505752 (getCurrentListMapNoExtraKeys!4568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137720 () Bool)

(declare-fun Unit!37190 () Unit!37188)

(assert (=> b!1137720 (= e!647513 Unit!37190)))

(declare-fun bm!49908 () Bool)

(assert (=> bm!49908 (= call!49911 (addStillContains!738 lt!505765 (ite (or c!111490 c!111489) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111490 c!111489) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!44657 () Bool)

(assert (=> mapIsEmpty!44657 mapRes!44657))

(declare-fun bm!49909 () Bool)

(assert (=> bm!49909 (= call!49914 (getCurrentListMapNoExtraKeys!4568 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137721 () Bool)

(declare-fun res!758978 () Bool)

(assert (=> b!1137721 (=> (not res!758978) (not e!647505))))

(assert (=> b!1137721 (= res!758978 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36188 _keys!1208))))))

(declare-fun b!1137722 () Bool)

(assert (=> b!1137722 (= e!647519 true)))

(declare-fun lt!505767 () Bool)

(assert (=> b!1137722 (= lt!505767 (contains!6607 Nil!24869 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1137723 () Bool)

(declare-fun res!758977 () Bool)

(assert (=> b!1137723 (=> (not res!758977) (not e!647505))))

(assert (=> b!1137723 (= res!758977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137724 () Bool)

(declare-fun res!758976 () Bool)

(assert (=> b!1137724 (=> (not res!758976) (not e!647510))))

(assert (=> b!1137724 (= res!758976 (arrayNoDuplicates!0 lt!505759 #b00000000000000000000000000000000 Nil!24869))))

(declare-fun bm!49910 () Bool)

(assert (=> bm!49910 (= call!49907 call!49909)))

(declare-fun b!1137725 () Bool)

(declare-fun res!758970 () Bool)

(assert (=> b!1137725 (=> res!758970 e!647519)))

(declare-fun noDuplicate!1619 (List!24872) Bool)

(assert (=> b!1137725 (= res!758970 (not (noDuplicate!1619 Nil!24869)))))

(declare-fun bm!49911 () Bool)

(assert (=> bm!49911 (= call!49912 (+!3512 lt!505765 (ite (or c!111490 c!111489) (tuple2!18107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1137726 () Bool)

(declare-fun res!758972 () Bool)

(assert (=> b!1137726 (=> (not res!758972) (not e!647505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137726 (= res!758972 (validKeyInArray!0 k0!934))))

(assert (= (and start!98656 res!758969) b!1137700))

(assert (= (and b!1137700 res!758982) b!1137711))

(assert (= (and b!1137711 res!758975) b!1137723))

(assert (= (and b!1137723 res!758977) b!1137717))

(assert (= (and b!1137717 res!758968) b!1137721))

(assert (= (and b!1137721 res!758978) b!1137726))

(assert (= (and b!1137726 res!758972) b!1137709))

(assert (= (and b!1137709 res!758973) b!1137708))

(assert (= (and b!1137708 res!758971) b!1137724))

(assert (= (and b!1137724 res!758976) b!1137704))

(assert (= (and b!1137704 (not res!758974)) b!1137719))

(assert (= (and b!1137719 (not res!758985)) b!1137705))

(assert (= (and b!1137705 c!111488) b!1137696))

(assert (= (and b!1137705 (not c!111488)) b!1137707))

(assert (= (or b!1137696 b!1137707) bm!49904))

(assert (= (or b!1137696 b!1137707) bm!49909))

(assert (= (and b!1137705 (not res!758984)) b!1137706))

(assert (= (and b!1137706 (not res!758983)) b!1137712))

(assert (= (and b!1137712 c!111490) b!1137714))

(assert (= (and b!1137712 (not c!111490)) b!1137697))

(assert (= (and b!1137697 c!111489) b!1137710))

(assert (= (and b!1137697 (not c!111489)) b!1137716))

(assert (= (and b!1137716 c!111491) b!1137715))

(assert (= (and b!1137716 (not c!111491)) b!1137720))

(assert (= (or b!1137710 b!1137715) bm!49905))

(assert (= (or b!1137710 b!1137715) bm!49906))

(assert (= (or b!1137710 b!1137715) bm!49910))

(assert (= (or b!1137714 bm!49910) bm!49907))

(assert (= (or b!1137714 bm!49905) bm!49908))

(assert (= (or b!1137714 bm!49906) bm!49911))

(assert (= (and b!1137712 c!111492) b!1137699))

(assert (= (and b!1137712 (not c!111492)) b!1137713))

(assert (= (and b!1137712 res!758979) b!1137703))

(assert (= (and b!1137712 (not res!758981)) b!1137725))

(assert (= (and b!1137725 (not res!758970)) b!1137701))

(assert (= (and b!1137701 (not res!758980)) b!1137722))

(assert (= (and b!1137698 condMapEmpty!44657) mapIsEmpty!44657))

(assert (= (and b!1137698 (not condMapEmpty!44657)) mapNonEmpty!44657))

(get-info :version)

(assert (= (and mapNonEmpty!44657 ((_ is ValueCellFull!13568) mapValue!44657)) b!1137718))

(assert (= (and b!1137698 ((_ is ValueCellFull!13568) mapDefault!44657)) b!1137702))

(assert (= start!98656 b!1137698))

(declare-fun b_lambda!19125 () Bool)

(assert (=> (not b_lambda!19125) (not b!1137719)))

(declare-fun t!35879 () Bool)

(declare-fun tb!8829 () Bool)

(assert (=> (and start!98656 (= defaultEntry!1004 defaultEntry!1004) t!35879) tb!8829))

(declare-fun result!18231 () Bool)

(assert (=> tb!8829 (= result!18231 tp_is_empty!28555)))

(assert (=> b!1137719 t!35879))

(declare-fun b_and!38903 () Bool)

(assert (= b_and!38901 (and (=> t!35879 result!18231) b_and!38903)))

(declare-fun m!1050315 () Bool)

(assert (=> b!1137699 m!1050315))

(declare-fun m!1050317 () Bool)

(assert (=> bm!49904 m!1050317))

(declare-fun m!1050319 () Bool)

(assert (=> b!1137724 m!1050319))

(declare-fun m!1050321 () Bool)

(assert (=> b!1137708 m!1050321))

(declare-fun m!1050323 () Bool)

(assert (=> b!1137708 m!1050323))

(declare-fun m!1050325 () Bool)

(assert (=> b!1137701 m!1050325))

(declare-fun m!1050327 () Bool)

(assert (=> b!1137726 m!1050327))

(declare-fun m!1050329 () Bool)

(assert (=> mapNonEmpty!44657 m!1050329))

(declare-fun m!1050331 () Bool)

(assert (=> b!1137696 m!1050331))

(declare-fun m!1050333 () Bool)

(assert (=> b!1137723 m!1050333))

(assert (=> b!1137703 m!1050315))

(declare-fun m!1050335 () Bool)

(assert (=> b!1137714 m!1050335))

(declare-fun m!1050337 () Bool)

(assert (=> b!1137714 m!1050337))

(assert (=> b!1137714 m!1050337))

(declare-fun m!1050339 () Bool)

(assert (=> b!1137714 m!1050339))

(declare-fun m!1050341 () Bool)

(assert (=> bm!49907 m!1050341))

(declare-fun m!1050343 () Bool)

(assert (=> b!1137719 m!1050343))

(declare-fun m!1050345 () Bool)

(assert (=> b!1137719 m!1050345))

(declare-fun m!1050347 () Bool)

(assert (=> b!1137719 m!1050347))

(declare-fun m!1050349 () Bool)

(assert (=> b!1137719 m!1050349))

(declare-fun m!1050351 () Bool)

(assert (=> b!1137709 m!1050351))

(declare-fun m!1050353 () Bool)

(assert (=> bm!49908 m!1050353))

(declare-fun m!1050355 () Bool)

(assert (=> bm!49911 m!1050355))

(declare-fun m!1050357 () Bool)

(assert (=> b!1137725 m!1050357))

(declare-fun m!1050359 () Bool)

(assert (=> b!1137704 m!1050359))

(declare-fun m!1050361 () Bool)

(assert (=> b!1137704 m!1050361))

(declare-fun m!1050363 () Bool)

(assert (=> bm!49909 m!1050363))

(declare-fun m!1050365 () Bool)

(assert (=> b!1137700 m!1050365))

(declare-fun m!1050367 () Bool)

(assert (=> b!1137705 m!1050367))

(declare-fun m!1050369 () Bool)

(assert (=> b!1137705 m!1050369))

(declare-fun m!1050371 () Bool)

(assert (=> start!98656 m!1050371))

(declare-fun m!1050373 () Bool)

(assert (=> start!98656 m!1050373))

(declare-fun m!1050375 () Bool)

(assert (=> b!1137717 m!1050375))

(declare-fun m!1050377 () Bool)

(assert (=> b!1137706 m!1050377))

(assert (=> b!1137706 m!1050363))

(declare-fun m!1050379 () Bool)

(assert (=> b!1137712 m!1050379))

(declare-fun m!1050381 () Bool)

(assert (=> b!1137712 m!1050381))

(declare-fun m!1050383 () Bool)

(assert (=> b!1137712 m!1050383))

(declare-fun m!1050385 () Bool)

(assert (=> b!1137722 m!1050385))

(check-sat (not b!1137726) b_and!38903 (not bm!49908) (not start!98656) (not b_lambda!19125) (not b_next!24025) (not b!1137719) (not b!1137696) (not bm!49909) (not b!1137712) (not b!1137700) tp_is_empty!28555 (not mapNonEmpty!44657) (not b!1137722) (not b!1137725) (not b!1137717) (not b!1137703) (not b!1137724) (not bm!49904) (not b!1137699) (not b!1137708) (not b!1137701) (not bm!49907) (not b!1137704) (not b!1137706) (not bm!49911) (not b!1137723) (not b!1137705) (not b!1137714))
(check-sat b_and!38903 (not b_next!24025))
