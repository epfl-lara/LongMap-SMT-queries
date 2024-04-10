; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98428 () Bool)

(assert start!98428)

(declare-fun b_free!24033 () Bool)

(declare-fun b_next!24033 () Bool)

(assert (=> start!98428 (= b_free!24033 (not b_next!24033))))

(declare-fun tp!84810 () Bool)

(declare-fun b_and!38915 () Bool)

(assert (=> start!98428 (= tp!84810 b_and!38915)))

(declare-fun b!1136777 () Bool)

(declare-fun e!646885 () Bool)

(declare-datatypes ((V!43211 0))(
  ( (V!43212 (val!14338 Int)) )
))
(declare-datatypes ((tuple2!18104 0))(
  ( (tuple2!18105 (_1!9063 (_ BitVec 64)) (_2!9063 V!43211)) )
))
(declare-datatypes ((List!24863 0))(
  ( (Nil!24860) (Cons!24859 (h!26068 tuple2!18104) (t!35888 List!24863)) )
))
(declare-datatypes ((ListLongMap!16073 0))(
  ( (ListLongMap!16074 (toList!8052 List!24863)) )
))
(declare-fun call!49938 () ListLongMap!16073)

(declare-fun call!49943 () ListLongMap!16073)

(assert (=> b!1136777 (= e!646885 (= call!49938 call!49943))))

(declare-fun lt!505481 () ListLongMap!16073)

(declare-datatypes ((Unit!37229 0))(
  ( (Unit!37230) )
))
(declare-fun call!49944 () Unit!37229)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43211)

(declare-fun zeroValue!944 () V!43211)

(declare-fun bm!49935 () Bool)

(declare-fun c!111157 () Bool)

(declare-fun c!111156 () Bool)

(declare-fun addStillContains!749 (ListLongMap!16073 (_ BitVec 64) V!43211 (_ BitVec 64)) Unit!37229)

(assert (=> bm!49935 (= call!49944 (addStillContains!749 lt!505481 (ite (or c!111156 c!111157) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111156 c!111157) zeroValue!944 minValue!944) k0!934))))

(declare-datatypes ((array!73987 0))(
  ( (array!73988 (arr!35644 (Array (_ BitVec 32) (_ BitVec 64))) (size!36180 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73987)

(declare-fun e!646879 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1136779 () Bool)

(declare-fun arrayContainsKey!0 (array!73987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1136779 (= e!646879 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136780 () Bool)

(declare-fun e!646876 () Bool)

(declare-fun tp_is_empty!28563 () Bool)

(assert (=> b!1136780 (= e!646876 tp_is_empty!28563)))

(declare-fun b!1136781 () Bool)

(declare-fun res!758669 () Bool)

(declare-fun e!646883 () Bool)

(assert (=> b!1136781 (=> (not res!758669) (not e!646883))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1136781 (= res!758669 (= (select (arr!35644 _keys!1208) i!673) k0!934))))

(declare-fun b!1136782 () Bool)

(declare-fun lt!505490 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1136782 (= c!111157 (and (not lt!505490) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!646873 () Unit!37229)

(declare-fun e!646884 () Unit!37229)

(assert (=> b!1136782 (= e!646873 e!646884)))

(declare-fun b!1136783 () Bool)

(declare-fun lt!505483 () Unit!37229)

(assert (=> b!1136783 (= e!646884 lt!505483)))

(declare-fun call!49940 () Unit!37229)

(assert (=> b!1136783 (= lt!505483 call!49940)))

(declare-fun call!49942 () Bool)

(assert (=> b!1136783 call!49942))

(declare-fun b!1136784 () Bool)

(declare-fun e!646886 () Unit!37229)

(assert (=> b!1136784 (= e!646884 e!646886)))

(declare-fun c!111159 () Bool)

(assert (=> b!1136784 (= c!111159 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505490))))

(declare-fun b!1136785 () Bool)

(declare-fun res!758658 () Bool)

(assert (=> b!1136785 (=> (not res!758658) (not e!646883))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13572 0))(
  ( (ValueCellFull!13572 (v!16975 V!43211)) (EmptyCell!13572) )
))
(declare-datatypes ((array!73989 0))(
  ( (array!73990 (arr!35645 (Array (_ BitVec 32) ValueCell!13572)) (size!36181 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73989)

(assert (=> b!1136785 (= res!758658 (and (= (size!36181 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36180 _keys!1208) (size!36181 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!49939 () ListLongMap!16073)

(declare-fun lt!505485 () ListLongMap!16073)

(declare-fun bm!49936 () Bool)

(declare-fun +!3488 (ListLongMap!16073 tuple2!18104) ListLongMap!16073)

(assert (=> bm!49936 (= call!49939 (+!3488 (ite c!111156 lt!505485 lt!505481) (ite c!111156 (tuple2!18105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111157 (tuple2!18105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18105 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1136786 () Bool)

(declare-fun -!1213 (ListLongMap!16073 (_ BitVec 64)) ListLongMap!16073)

(assert (=> b!1136786 (= e!646885 (= call!49938 (-!1213 call!49943 k0!934)))))

(declare-fun b!1136787 () Bool)

(declare-fun res!758661 () Bool)

(assert (=> b!1136787 (=> (not res!758661) (not e!646883))))

(declare-datatypes ((List!24864 0))(
  ( (Nil!24861) (Cons!24860 (h!26069 (_ BitVec 64)) (t!35889 List!24864)) )
))
(declare-fun arrayNoDuplicates!0 (array!73987 (_ BitVec 32) List!24864) Bool)

(assert (=> b!1136787 (= res!758661 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24861))))

(declare-fun b!1136778 () Bool)

(declare-fun res!758666 () Bool)

(assert (=> b!1136778 (=> (not res!758666) (not e!646883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1136778 (= res!758666 (validMask!0 mask!1564))))

(declare-fun res!758663 () Bool)

(assert (=> start!98428 (=> (not res!758663) (not e!646883))))

(assert (=> start!98428 (= res!758663 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36180 _keys!1208))))))

(assert (=> start!98428 e!646883))

(assert (=> start!98428 tp_is_empty!28563))

(declare-fun array_inv!27332 (array!73987) Bool)

(assert (=> start!98428 (array_inv!27332 _keys!1208)))

(assert (=> start!98428 true))

(assert (=> start!98428 tp!84810))

(declare-fun e!646874 () Bool)

(declare-fun array_inv!27333 (array!73989) Bool)

(assert (=> start!98428 (and (array_inv!27333 _values!996) e!646874)))

(declare-fun b!1136788 () Bool)

(declare-fun e!646882 () Bool)

(assert (=> b!1136788 (= e!646882 tp_is_empty!28563)))

(declare-fun b!1136789 () Bool)

(declare-fun e!646872 () Bool)

(declare-fun e!646878 () Bool)

(assert (=> b!1136789 (= e!646872 e!646878)))

(declare-fun res!758665 () Bool)

(assert (=> b!1136789 (=> res!758665 e!646878)))

(assert (=> b!1136789 (= res!758665 (not (= from!1455 i!673)))))

(declare-fun lt!505492 () array!73989)

(declare-fun lt!505493 () array!73987)

(declare-fun lt!505494 () ListLongMap!16073)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4536 (array!73987 array!73989 (_ BitVec 32) (_ BitVec 32) V!43211 V!43211 (_ BitVec 32) Int) ListLongMap!16073)

(assert (=> b!1136789 (= lt!505494 (getCurrentListMapNoExtraKeys!4536 lt!505493 lt!505492 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2594 (Int (_ BitVec 64)) V!43211)

(assert (=> b!1136789 (= lt!505492 (array!73990 (store (arr!35645 _values!996) i!673 (ValueCellFull!13572 (dynLambda!2594 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36181 _values!996)))))

(declare-fun lt!505477 () ListLongMap!16073)

(assert (=> b!1136789 (= lt!505477 (getCurrentListMapNoExtraKeys!4536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1136790 () Bool)

(declare-fun contains!6592 (ListLongMap!16073 (_ BitVec 64)) Bool)

(assert (=> b!1136790 (contains!6592 call!49939 k0!934)))

(declare-fun lt!505484 () Unit!37229)

(assert (=> b!1136790 (= lt!505484 (addStillContains!749 lt!505485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!49945 () Bool)

(assert (=> b!1136790 call!49945))

(assert (=> b!1136790 (= lt!505485 (+!3488 lt!505481 (tuple2!18105 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!505478 () Unit!37229)

(assert (=> b!1136790 (= lt!505478 call!49944)))

(assert (=> b!1136790 (= e!646873 lt!505484)))

(declare-fun b!1136791 () Bool)

(declare-fun res!758664 () Bool)

(assert (=> b!1136791 (=> (not res!758664) (not e!646883))))

(assert (=> b!1136791 (= res!758664 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36180 _keys!1208))))))

(declare-fun bm!49937 () Bool)

(assert (=> bm!49937 (= call!49943 (getCurrentListMapNoExtraKeys!4536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44669 () Bool)

(declare-fun mapRes!44669 () Bool)

(declare-fun tp!84809 () Bool)

(assert (=> mapNonEmpty!44669 (= mapRes!44669 (and tp!84809 e!646882))))

(declare-fun mapValue!44669 () ValueCell!13572)

(declare-fun mapRest!44669 () (Array (_ BitVec 32) ValueCell!13572))

(declare-fun mapKey!44669 () (_ BitVec 32))

(assert (=> mapNonEmpty!44669 (= (arr!35645 _values!996) (store mapRest!44669 mapKey!44669 mapValue!44669))))

(declare-fun b!1136792 () Bool)

(declare-fun e!646880 () Unit!37229)

(declare-fun Unit!37231 () Unit!37229)

(assert (=> b!1136792 (= e!646880 Unit!37231)))

(declare-fun b!1136793 () Bool)

(declare-fun res!758657 () Bool)

(assert (=> b!1136793 (=> (not res!758657) (not e!646883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1136793 (= res!758657 (validKeyInArray!0 k0!934))))

(declare-fun b!1136794 () Bool)

(assert (=> b!1136794 (= e!646874 (and e!646876 mapRes!44669))))

(declare-fun condMapEmpty!44669 () Bool)

(declare-fun mapDefault!44669 () ValueCell!13572)

(assert (=> b!1136794 (= condMapEmpty!44669 (= (arr!35645 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13572)) mapDefault!44669)))))

(declare-fun b!1136795 () Bool)

(declare-fun res!758667 () Bool)

(declare-fun e!646887 () Bool)

(assert (=> b!1136795 (=> (not res!758667) (not e!646887))))

(assert (=> b!1136795 (= res!758667 (arrayNoDuplicates!0 lt!505493 #b00000000000000000000000000000000 Nil!24861))))

(declare-fun bm!49938 () Bool)

(assert (=> bm!49938 (= call!49942 call!49945)))

(declare-fun b!1136796 () Bool)

(declare-fun e!646875 () Bool)

(assert (=> b!1136796 (= e!646875 true)))

(declare-fun lt!505491 () Unit!37229)

(assert (=> b!1136796 (= lt!505491 e!646880)))

(declare-fun c!111158 () Bool)

(assert (=> b!1136796 (= c!111158 (contains!6592 lt!505481 k0!934))))

(assert (=> b!1136796 (= lt!505481 (getCurrentListMapNoExtraKeys!4536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49939 () Bool)

(assert (=> bm!49939 (= call!49938 (getCurrentListMapNoExtraKeys!4536 lt!505493 lt!505492 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49940 () Bool)

(declare-fun call!49941 () ListLongMap!16073)

(assert (=> bm!49940 (= call!49945 (contains!6592 (ite c!111156 lt!505485 call!49941) k0!934))))

(declare-fun b!1136797 () Bool)

(assert (=> b!1136797 (= e!646879 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505490) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1136798 () Bool)

(declare-fun res!758660 () Bool)

(assert (=> b!1136798 (=> (not res!758660) (not e!646883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73987 (_ BitVec 32)) Bool)

(assert (=> b!1136798 (= res!758660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44669 () Bool)

(assert (=> mapIsEmpty!44669 mapRes!44669))

(declare-fun b!1136799 () Bool)

(declare-fun Unit!37232 () Unit!37229)

(assert (=> b!1136799 (= e!646886 Unit!37232)))

(declare-fun b!1136800 () Bool)

(assert (=> b!1136800 (= e!646883 e!646887)))

(declare-fun res!758656 () Bool)

(assert (=> b!1136800 (=> (not res!758656) (not e!646887))))

(assert (=> b!1136800 (= res!758656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505493 mask!1564))))

(assert (=> b!1136800 (= lt!505493 (array!73988 (store (arr!35644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36180 _keys!1208)))))

(declare-fun b!1136801 () Bool)

(assert (=> b!1136801 (= e!646887 (not e!646872))))

(declare-fun res!758659 () Bool)

(assert (=> b!1136801 (=> res!758659 e!646872)))

(assert (=> b!1136801 (= res!758659 (bvsgt from!1455 i!673))))

(assert (=> b!1136801 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505486 () Unit!37229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73987 (_ BitVec 64) (_ BitVec 32)) Unit!37229)

(assert (=> b!1136801 (= lt!505486 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1136802 () Bool)

(assert (=> b!1136802 (= e!646878 e!646875)))

(declare-fun res!758668 () Bool)

(assert (=> b!1136802 (=> res!758668 e!646875)))

(assert (=> b!1136802 (= res!758668 (not (= (select (arr!35644 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1136802 e!646885))

(declare-fun c!111155 () Bool)

(assert (=> b!1136802 (= c!111155 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505489 () Unit!37229)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!459 (array!73987 array!73989 (_ BitVec 32) (_ BitVec 32) V!43211 V!43211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37229)

(assert (=> b!1136802 (= lt!505489 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!459 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49941 () Bool)

(assert (=> bm!49941 (= call!49941 call!49939)))

(declare-fun b!1136803 () Bool)

(declare-fun e!646881 () Bool)

(assert (=> b!1136803 (= e!646881 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1136804 () Bool)

(declare-fun Unit!37233 () Unit!37229)

(assert (=> b!1136804 (= e!646880 Unit!37233)))

(assert (=> b!1136804 (= lt!505490 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1136804 (= c!111156 (and (not lt!505490) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!505480 () Unit!37229)

(assert (=> b!1136804 (= lt!505480 e!646873)))

(declare-fun lt!505488 () Unit!37229)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!352 (array!73987 array!73989 (_ BitVec 32) (_ BitVec 32) V!43211 V!43211 (_ BitVec 64) (_ BitVec 32) Int) Unit!37229)

(assert (=> b!1136804 (= lt!505488 (lemmaListMapContainsThenArrayContainsFrom!352 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111160 () Bool)

(assert (=> b!1136804 (= c!111160 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!758662 () Bool)

(assert (=> b!1136804 (= res!758662 e!646879)))

(assert (=> b!1136804 (=> (not res!758662) (not e!646881))))

(assert (=> b!1136804 e!646881))

(declare-fun lt!505482 () Unit!37229)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73987 (_ BitVec 32) (_ BitVec 32)) Unit!37229)

(assert (=> b!1136804 (= lt!505482 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1136804 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24861)))

(declare-fun lt!505487 () Unit!37229)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!73987 (_ BitVec 64) (_ BitVec 32) List!24864) Unit!37229)

(assert (=> b!1136804 (= lt!505487 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24861))))

(assert (=> b!1136804 false))

(declare-fun b!1136805 () Bool)

(assert (=> b!1136805 call!49942))

(declare-fun lt!505479 () Unit!37229)

(assert (=> b!1136805 (= lt!505479 call!49940)))

(assert (=> b!1136805 (= e!646886 lt!505479)))

(declare-fun bm!49942 () Bool)

(assert (=> bm!49942 (= call!49940 call!49944)))

(assert (= (and start!98428 res!758663) b!1136778))

(assert (= (and b!1136778 res!758666) b!1136785))

(assert (= (and b!1136785 res!758658) b!1136798))

(assert (= (and b!1136798 res!758660) b!1136787))

(assert (= (and b!1136787 res!758661) b!1136791))

(assert (= (and b!1136791 res!758664) b!1136793))

(assert (= (and b!1136793 res!758657) b!1136781))

(assert (= (and b!1136781 res!758669) b!1136800))

(assert (= (and b!1136800 res!758656) b!1136795))

(assert (= (and b!1136795 res!758667) b!1136801))

(assert (= (and b!1136801 (not res!758659)) b!1136789))

(assert (= (and b!1136789 (not res!758665)) b!1136802))

(assert (= (and b!1136802 c!111155) b!1136786))

(assert (= (and b!1136802 (not c!111155)) b!1136777))

(assert (= (or b!1136786 b!1136777) bm!49939))

(assert (= (or b!1136786 b!1136777) bm!49937))

(assert (= (and b!1136802 (not res!758668)) b!1136796))

(assert (= (and b!1136796 c!111158) b!1136804))

(assert (= (and b!1136796 (not c!111158)) b!1136792))

(assert (= (and b!1136804 c!111156) b!1136790))

(assert (= (and b!1136804 (not c!111156)) b!1136782))

(assert (= (and b!1136782 c!111157) b!1136783))

(assert (= (and b!1136782 (not c!111157)) b!1136784))

(assert (= (and b!1136784 c!111159) b!1136805))

(assert (= (and b!1136784 (not c!111159)) b!1136799))

(assert (= (or b!1136783 b!1136805) bm!49942))

(assert (= (or b!1136783 b!1136805) bm!49941))

(assert (= (or b!1136783 b!1136805) bm!49938))

(assert (= (or b!1136790 bm!49938) bm!49940))

(assert (= (or b!1136790 bm!49942) bm!49935))

(assert (= (or b!1136790 bm!49941) bm!49936))

(assert (= (and b!1136804 c!111160) b!1136779))

(assert (= (and b!1136804 (not c!111160)) b!1136797))

(assert (= (and b!1136804 res!758662) b!1136803))

(assert (= (and b!1136794 condMapEmpty!44669) mapIsEmpty!44669))

(assert (= (and b!1136794 (not condMapEmpty!44669)) mapNonEmpty!44669))

(get-info :version)

(assert (= (and mapNonEmpty!44669 ((_ is ValueCellFull!13572) mapValue!44669)) b!1136788))

(assert (= (and b!1136794 ((_ is ValueCellFull!13572) mapDefault!44669)) b!1136780))

(assert (= start!98428 b!1136794))

(declare-fun b_lambda!19139 () Bool)

(assert (=> (not b_lambda!19139) (not b!1136789)))

(declare-fun t!35887 () Bool)

(declare-fun tb!8845 () Bool)

(assert (=> (and start!98428 (= defaultEntry!1004 defaultEntry!1004) t!35887) tb!8845))

(declare-fun result!18255 () Bool)

(assert (=> tb!8845 (= result!18255 tp_is_empty!28563)))

(assert (=> b!1136789 t!35887))

(declare-fun b_and!38917 () Bool)

(assert (= b_and!38915 (and (=> t!35887 result!18255) b_and!38917)))

(declare-fun m!1049021 () Bool)

(assert (=> b!1136787 m!1049021))

(declare-fun m!1049023 () Bool)

(assert (=> bm!49939 m!1049023))

(declare-fun m!1049025 () Bool)

(assert (=> bm!49940 m!1049025))

(declare-fun m!1049027 () Bool)

(assert (=> bm!49937 m!1049027))

(declare-fun m!1049029 () Bool)

(assert (=> b!1136800 m!1049029))

(declare-fun m!1049031 () Bool)

(assert (=> b!1136800 m!1049031))

(declare-fun m!1049033 () Bool)

(assert (=> b!1136790 m!1049033))

(declare-fun m!1049035 () Bool)

(assert (=> b!1136790 m!1049035))

(declare-fun m!1049037 () Bool)

(assert (=> b!1136790 m!1049037))

(declare-fun m!1049039 () Bool)

(assert (=> b!1136793 m!1049039))

(declare-fun m!1049041 () Bool)

(assert (=> b!1136796 m!1049041))

(assert (=> b!1136796 m!1049027))

(declare-fun m!1049043 () Bool)

(assert (=> b!1136801 m!1049043))

(declare-fun m!1049045 () Bool)

(assert (=> b!1136801 m!1049045))

(declare-fun m!1049047 () Bool)

(assert (=> b!1136804 m!1049047))

(declare-fun m!1049049 () Bool)

(assert (=> b!1136804 m!1049049))

(declare-fun m!1049051 () Bool)

(assert (=> b!1136804 m!1049051))

(declare-fun m!1049053 () Bool)

(assert (=> b!1136804 m!1049053))

(declare-fun m!1049055 () Bool)

(assert (=> b!1136778 m!1049055))

(declare-fun m!1049057 () Bool)

(assert (=> b!1136795 m!1049057))

(declare-fun m!1049059 () Bool)

(assert (=> b!1136781 m!1049059))

(declare-fun m!1049061 () Bool)

(assert (=> b!1136802 m!1049061))

(declare-fun m!1049063 () Bool)

(assert (=> b!1136802 m!1049063))

(declare-fun m!1049065 () Bool)

(assert (=> b!1136779 m!1049065))

(declare-fun m!1049067 () Bool)

(assert (=> bm!49935 m!1049067))

(assert (=> b!1136803 m!1049065))

(declare-fun m!1049069 () Bool)

(assert (=> b!1136798 m!1049069))

(declare-fun m!1049071 () Bool)

(assert (=> bm!49936 m!1049071))

(declare-fun m!1049073 () Bool)

(assert (=> b!1136789 m!1049073))

(declare-fun m!1049075 () Bool)

(assert (=> b!1136789 m!1049075))

(declare-fun m!1049077 () Bool)

(assert (=> b!1136789 m!1049077))

(declare-fun m!1049079 () Bool)

(assert (=> b!1136789 m!1049079))

(declare-fun m!1049081 () Bool)

(assert (=> b!1136786 m!1049081))

(declare-fun m!1049083 () Bool)

(assert (=> mapNonEmpty!44669 m!1049083))

(declare-fun m!1049085 () Bool)

(assert (=> start!98428 m!1049085))

(declare-fun m!1049087 () Bool)

(assert (=> start!98428 m!1049087))

(check-sat (not b!1136802) (not b!1136804) (not bm!49939) tp_is_empty!28563 b_and!38917 (not b!1136786) (not start!98428) (not bm!49940) (not b_next!24033) (not b!1136796) (not bm!49936) (not b!1136789) (not b!1136798) (not b!1136790) (not bm!49937) (not b_lambda!19139) (not b!1136801) (not mapNonEmpty!44669) (not b!1136795) (not b!1136779) (not b!1136800) (not b!1136803) (not bm!49935) (not b!1136793) (not b!1136787) (not b!1136778))
(check-sat b_and!38917 (not b_next!24033))
