; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98474 () Bool)

(assert start!98474)

(declare-fun b_free!24085 () Bool)

(declare-fun b_next!24085 () Bool)

(assert (=> start!98474 (= b_free!24085 (not b_next!24085))))

(declare-fun tp!84965 () Bool)

(declare-fun b_and!38997 () Bool)

(assert (=> start!98474 (= tp!84965 b_and!38997)))

(declare-fun b!1138967 () Bool)

(declare-fun e!648048 () Bool)

(declare-fun tp_is_empty!28615 () Bool)

(assert (=> b!1138967 (= e!648048 tp_is_empty!28615)))

(declare-fun b!1138968 () Bool)

(declare-datatypes ((Unit!37183 0))(
  ( (Unit!37184) )
))
(declare-fun e!648046 () Unit!37183)

(declare-fun Unit!37185 () Unit!37183)

(assert (=> b!1138968 (= e!648046 Unit!37185)))

(declare-fun b!1138969 () Bool)

(declare-fun call!50544 () Bool)

(assert (=> b!1138969 call!50544))

(declare-fun lt!506694 () Unit!37183)

(declare-fun call!50540 () Unit!37183)

(assert (=> b!1138969 (= lt!506694 call!50540)))

(declare-fun e!648050 () Unit!37183)

(assert (=> b!1138969 (= e!648050 lt!506694)))

(declare-fun b!1138970 () Bool)

(declare-fun res!759685 () Bool)

(declare-fun e!648047 () Bool)

(assert (=> b!1138970 (=> (not res!759685) (not e!648047))))

(declare-datatypes ((array!74012 0))(
  ( (array!74013 (arr!35657 (Array (_ BitVec 32) (_ BitVec 64))) (size!36195 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74012)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74012 (_ BitVec 32)) Bool)

(assert (=> b!1138970 (= res!759685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1138971 () Bool)

(declare-fun res!759687 () Bool)

(assert (=> b!1138971 (=> (not res!759687) (not e!648047))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!43281 0))(
  ( (V!43282 (val!14364 Int)) )
))
(declare-datatypes ((ValueCell!13598 0))(
  ( (ValueCellFull!13598 (v!17000 V!43281)) (EmptyCell!13598) )
))
(declare-datatypes ((array!74014 0))(
  ( (array!74015 (arr!35658 (Array (_ BitVec 32) ValueCell!13598)) (size!36196 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74014)

(assert (=> b!1138971 (= res!759687 (and (= (size!36196 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36195 _keys!1208) (size!36196 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44747 () Bool)

(declare-fun mapRes!44747 () Bool)

(assert (=> mapIsEmpty!44747 mapRes!44747))

(declare-fun b!1138972 () Bool)

(declare-fun e!648056 () Bool)

(declare-fun e!648051 () Bool)

(assert (=> b!1138972 (= e!648056 e!648051)))

(declare-fun res!759695 () Bool)

(assert (=> b!1138972 (=> res!759695 e!648051)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1138972 (= res!759695 (not (= (select (arr!35657 _keys!1208) from!1455) k0!934)))))

(declare-fun e!648042 () Bool)

(assert (=> b!1138972 e!648042))

(declare-fun c!111600 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138972 (= c!111600 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506698 () Unit!37183)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43281)

(declare-fun zeroValue!944 () V!43281)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!494 (array!74012 array!74014 (_ BitVec 32) (_ BitVec 32) V!43281 V!43281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37183)

(assert (=> b!1138972 (= lt!506698 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!18242 0))(
  ( (tuple2!18243 (_1!9132 (_ BitVec 64)) (_2!9132 V!43281)) )
))
(declare-datatypes ((List!24982 0))(
  ( (Nil!24979) (Cons!24978 (h!26187 tuple2!18242) (t!36050 List!24982)) )
))
(declare-datatypes ((ListLongMap!16211 0))(
  ( (ListLongMap!16212 (toList!8121 List!24982)) )
))
(declare-fun lt!506692 () ListLongMap!16211)

(declare-fun bm!50536 () Bool)

(declare-fun c!111601 () Bool)

(declare-fun lt!506693 () ListLongMap!16211)

(declare-fun call!50545 () ListLongMap!16211)

(declare-fun c!111598 () Bool)

(declare-fun +!3548 (ListLongMap!16211 tuple2!18242) ListLongMap!16211)

(assert (=> bm!50536 (= call!50545 (+!3548 (ite c!111601 lt!506692 lt!506693) (ite c!111601 (tuple2!18243 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111598 (tuple2!18243 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18243 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!50537 () Bool)

(declare-fun call!50539 () Unit!37183)

(assert (=> bm!50537 (= call!50540 call!50539)))

(declare-fun b!1138973 () Bool)

(declare-fun e!648052 () Bool)

(assert (=> b!1138973 (= e!648052 tp_is_empty!28615)))

(declare-fun bm!50538 () Bool)

(declare-fun addStillContains!766 (ListLongMap!16211 (_ BitVec 64) V!43281 (_ BitVec 64)) Unit!37183)

(assert (=> bm!50538 (= call!50539 (addStillContains!766 lt!506693 (ite (or c!111601 c!111598) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111601 c!111598) zeroValue!944 minValue!944) k0!934))))

(declare-fun res!759691 () Bool)

(assert (=> start!98474 (=> (not res!759691) (not e!648047))))

(assert (=> start!98474 (= res!759691 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36195 _keys!1208))))))

(assert (=> start!98474 e!648047))

(assert (=> start!98474 tp_is_empty!28615))

(declare-fun array_inv!27404 (array!74012) Bool)

(assert (=> start!98474 (array_inv!27404 _keys!1208)))

(assert (=> start!98474 true))

(assert (=> start!98474 tp!84965))

(declare-fun e!648045 () Bool)

(declare-fun array_inv!27405 (array!74014) Bool)

(assert (=> start!98474 (and (array_inv!27405 _values!996) e!648045)))

(declare-fun bm!50539 () Bool)

(declare-fun call!50546 () Bool)

(assert (=> bm!50539 (= call!50544 call!50546)))

(declare-fun b!1138974 () Bool)

(declare-fun res!759693 () Bool)

(assert (=> b!1138974 (=> (not res!759693) (not e!648047))))

(assert (=> b!1138974 (= res!759693 (= (select (arr!35657 _keys!1208) i!673) k0!934))))

(declare-fun lt!506707 () array!74012)

(declare-fun bm!50540 () Bool)

(declare-fun call!50541 () ListLongMap!16211)

(declare-fun lt!506704 () array!74014)

(declare-fun getCurrentListMapNoExtraKeys!4616 (array!74012 array!74014 (_ BitVec 32) (_ BitVec 32) V!43281 V!43281 (_ BitVec 32) Int) ListLongMap!16211)

(assert (=> bm!50540 (= call!50541 (getCurrentListMapNoExtraKeys!4616 lt!506707 lt!506704 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!648049 () Bool)

(declare-fun b!1138975 () Bool)

(declare-fun arrayContainsKey!0 (array!74012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138975 (= e!648049 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138976 () Bool)

(declare-fun Unit!37186 () Unit!37183)

(assert (=> b!1138976 (= e!648046 Unit!37186)))

(declare-fun lt!506702 () Bool)

(assert (=> b!1138976 (= lt!506702 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1138976 (= c!111601 (and (not lt!506702) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506691 () Unit!37183)

(declare-fun e!648043 () Unit!37183)

(assert (=> b!1138976 (= lt!506691 e!648043)))

(declare-fun lt!506706 () Unit!37183)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!370 (array!74012 array!74014 (_ BitVec 32) (_ BitVec 32) V!43281 V!43281 (_ BitVec 64) (_ BitVec 32) Int) Unit!37183)

(assert (=> b!1138976 (= lt!506706 (lemmaListMapContainsThenArrayContainsFrom!370 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111597 () Bool)

(assert (=> b!1138976 (= c!111597 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759682 () Bool)

(assert (=> b!1138976 (= res!759682 e!648049)))

(declare-fun e!648055 () Bool)

(assert (=> b!1138976 (=> (not res!759682) (not e!648055))))

(assert (=> b!1138976 e!648055))

(declare-fun lt!506703 () Unit!37183)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74012 (_ BitVec 32) (_ BitVec 32)) Unit!37183)

(assert (=> b!1138976 (= lt!506703 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24983 0))(
  ( (Nil!24980) (Cons!24979 (h!26188 (_ BitVec 64)) (t!36051 List!24983)) )
))
(declare-fun arrayNoDuplicates!0 (array!74012 (_ BitVec 32) List!24983) Bool)

(assert (=> b!1138976 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24980)))

(declare-fun lt!506701 () Unit!37183)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74012 (_ BitVec 64) (_ BitVec 32) List!24983) Unit!37183)

(assert (=> b!1138976 (= lt!506701 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24980))))

(assert (=> b!1138976 false))

(declare-fun b!1138977 () Bool)

(assert (=> b!1138977 (= e!648051 true)))

(declare-fun lt!506696 () Bool)

(declare-fun contains!6593 (ListLongMap!16211 (_ BitVec 64)) Bool)

(assert (=> b!1138977 (= lt!506696 (contains!6593 lt!506693 (select (arr!35657 _keys!1208) from!1455)))))

(declare-fun lt!506709 () Unit!37183)

(assert (=> b!1138977 (= lt!506709 e!648046)))

(declare-fun c!111599 () Bool)

(assert (=> b!1138977 (= c!111599 (contains!6593 lt!506693 k0!934))))

(assert (=> b!1138977 (= lt!506693 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50541 () Bool)

(declare-fun call!50543 () ListLongMap!16211)

(assert (=> bm!50541 (= call!50543 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138978 () Bool)

(declare-fun e!648057 () Bool)

(declare-fun e!648044 () Bool)

(assert (=> b!1138978 (= e!648057 (not e!648044))))

(declare-fun res!759689 () Bool)

(assert (=> b!1138978 (=> res!759689 e!648044)))

(assert (=> b!1138978 (= res!759689 (bvsgt from!1455 i!673))))

(assert (=> b!1138978 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506705 () Unit!37183)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74012 (_ BitVec 64) (_ BitVec 32)) Unit!37183)

(assert (=> b!1138978 (= lt!506705 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44747 () Bool)

(declare-fun tp!84966 () Bool)

(assert (=> mapNonEmpty!44747 (= mapRes!44747 (and tp!84966 e!648048))))

(declare-fun mapKey!44747 () (_ BitVec 32))

(declare-fun mapRest!44747 () (Array (_ BitVec 32) ValueCell!13598))

(declare-fun mapValue!44747 () ValueCell!13598)

(assert (=> mapNonEmpty!44747 (= (arr!35658 _values!996) (store mapRest!44747 mapKey!44747 mapValue!44747))))

(declare-fun b!1138979 () Bool)

(assert (=> b!1138979 (= e!648049 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506702) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138980 () Bool)

(declare-fun Unit!37187 () Unit!37183)

(assert (=> b!1138980 (= e!648050 Unit!37187)))

(declare-fun b!1138981 () Bool)

(assert (=> b!1138981 (= c!111598 (and (not lt!506702) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!648053 () Unit!37183)

(assert (=> b!1138981 (= e!648043 e!648053)))

(declare-fun b!1138982 () Bool)

(assert (=> b!1138982 (= e!648042 (= call!50541 call!50543))))

(declare-fun bm!50542 () Bool)

(declare-fun call!50542 () ListLongMap!16211)

(assert (=> bm!50542 (= call!50542 call!50545)))

(declare-fun b!1138983 () Bool)

(declare-fun lt!506697 () Unit!37183)

(assert (=> b!1138983 (= e!648053 lt!506697)))

(assert (=> b!1138983 (= lt!506697 call!50540)))

(assert (=> b!1138983 call!50544))

(declare-fun b!1138984 () Bool)

(assert (=> b!1138984 (contains!6593 call!50545 k0!934)))

(declare-fun lt!506708 () Unit!37183)

(assert (=> b!1138984 (= lt!506708 (addStillContains!766 lt!506692 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1138984 call!50546))

(assert (=> b!1138984 (= lt!506692 (+!3548 lt!506693 (tuple2!18243 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506700 () Unit!37183)

(assert (=> b!1138984 (= lt!506700 call!50539)))

(assert (=> b!1138984 (= e!648043 lt!506708)))

(declare-fun b!1138985 () Bool)

(declare-fun res!759686 () Bool)

(assert (=> b!1138985 (=> (not res!759686) (not e!648047))))

(assert (=> b!1138985 (= res!759686 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24980))))

(declare-fun b!1138986 () Bool)

(assert (=> b!1138986 (= e!648044 e!648056)))

(declare-fun res!759694 () Bool)

(assert (=> b!1138986 (=> res!759694 e!648056)))

(assert (=> b!1138986 (= res!759694 (not (= from!1455 i!673)))))

(declare-fun lt!506699 () ListLongMap!16211)

(assert (=> b!1138986 (= lt!506699 (getCurrentListMapNoExtraKeys!4616 lt!506707 lt!506704 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2603 (Int (_ BitVec 64)) V!43281)

(assert (=> b!1138986 (= lt!506704 (array!74015 (store (arr!35658 _values!996) i!673 (ValueCellFull!13598 (dynLambda!2603 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36196 _values!996)))))

(declare-fun lt!506695 () ListLongMap!16211)

(assert (=> b!1138986 (= lt!506695 (getCurrentListMapNoExtraKeys!4616 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138987 () Bool)

(assert (=> b!1138987 (= e!648055 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138988 () Bool)

(assert (=> b!1138988 (= e!648045 (and e!648052 mapRes!44747))))

(declare-fun condMapEmpty!44747 () Bool)

(declare-fun mapDefault!44747 () ValueCell!13598)

(assert (=> b!1138988 (= condMapEmpty!44747 (= (arr!35658 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13598)) mapDefault!44747)))))

(declare-fun b!1138989 () Bool)

(assert (=> b!1138989 (= e!648047 e!648057)))

(declare-fun res!759692 () Bool)

(assert (=> b!1138989 (=> (not res!759692) (not e!648057))))

(assert (=> b!1138989 (= res!759692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506707 mask!1564))))

(assert (=> b!1138989 (= lt!506707 (array!74013 (store (arr!35657 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36195 _keys!1208)))))

(declare-fun bm!50543 () Bool)

(assert (=> bm!50543 (= call!50546 (contains!6593 (ite c!111601 lt!506692 call!50542) k0!934))))

(declare-fun b!1138990 () Bool)

(declare-fun res!759684 () Bool)

(assert (=> b!1138990 (=> (not res!759684) (not e!648047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138990 (= res!759684 (validKeyInArray!0 k0!934))))

(declare-fun b!1138991 () Bool)

(declare-fun res!759683 () Bool)

(assert (=> b!1138991 (=> (not res!759683) (not e!648047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138991 (= res!759683 (validMask!0 mask!1564))))

(declare-fun b!1138992 () Bool)

(declare-fun res!759690 () Bool)

(assert (=> b!1138992 (=> (not res!759690) (not e!648047))))

(assert (=> b!1138992 (= res!759690 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36195 _keys!1208))))))

(declare-fun b!1138993 () Bool)

(declare-fun -!1209 (ListLongMap!16211 (_ BitVec 64)) ListLongMap!16211)

(assert (=> b!1138993 (= e!648042 (= call!50541 (-!1209 call!50543 k0!934)))))

(declare-fun b!1138994 () Bool)

(declare-fun res!759688 () Bool)

(assert (=> b!1138994 (=> (not res!759688) (not e!648057))))

(assert (=> b!1138994 (= res!759688 (arrayNoDuplicates!0 lt!506707 #b00000000000000000000000000000000 Nil!24980))))

(declare-fun b!1138995 () Bool)

(assert (=> b!1138995 (= e!648053 e!648050)))

(declare-fun c!111602 () Bool)

(assert (=> b!1138995 (= c!111602 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506702))))

(assert (= (and start!98474 res!759691) b!1138991))

(assert (= (and b!1138991 res!759683) b!1138971))

(assert (= (and b!1138971 res!759687) b!1138970))

(assert (= (and b!1138970 res!759685) b!1138985))

(assert (= (and b!1138985 res!759686) b!1138992))

(assert (= (and b!1138992 res!759690) b!1138990))

(assert (= (and b!1138990 res!759684) b!1138974))

(assert (= (and b!1138974 res!759693) b!1138989))

(assert (= (and b!1138989 res!759692) b!1138994))

(assert (= (and b!1138994 res!759688) b!1138978))

(assert (= (and b!1138978 (not res!759689)) b!1138986))

(assert (= (and b!1138986 (not res!759694)) b!1138972))

(assert (= (and b!1138972 c!111600) b!1138993))

(assert (= (and b!1138972 (not c!111600)) b!1138982))

(assert (= (or b!1138993 b!1138982) bm!50541))

(assert (= (or b!1138993 b!1138982) bm!50540))

(assert (= (and b!1138972 (not res!759695)) b!1138977))

(assert (= (and b!1138977 c!111599) b!1138976))

(assert (= (and b!1138977 (not c!111599)) b!1138968))

(assert (= (and b!1138976 c!111601) b!1138984))

(assert (= (and b!1138976 (not c!111601)) b!1138981))

(assert (= (and b!1138981 c!111598) b!1138983))

(assert (= (and b!1138981 (not c!111598)) b!1138995))

(assert (= (and b!1138995 c!111602) b!1138969))

(assert (= (and b!1138995 (not c!111602)) b!1138980))

(assert (= (or b!1138983 b!1138969) bm!50537))

(assert (= (or b!1138983 b!1138969) bm!50542))

(assert (= (or b!1138983 b!1138969) bm!50539))

(assert (= (or b!1138984 bm!50539) bm!50543))

(assert (= (or b!1138984 bm!50537) bm!50538))

(assert (= (or b!1138984 bm!50542) bm!50536))

(assert (= (and b!1138976 c!111597) b!1138975))

(assert (= (and b!1138976 (not c!111597)) b!1138979))

(assert (= (and b!1138976 res!759682) b!1138987))

(assert (= (and b!1138988 condMapEmpty!44747) mapIsEmpty!44747))

(assert (= (and b!1138988 (not condMapEmpty!44747)) mapNonEmpty!44747))

(get-info :version)

(assert (= (and mapNonEmpty!44747 ((_ is ValueCellFull!13598) mapValue!44747)) b!1138967))

(assert (= (and b!1138988 ((_ is ValueCellFull!13598) mapDefault!44747)) b!1138973))

(assert (= start!98474 b!1138988))

(declare-fun b_lambda!19173 () Bool)

(assert (=> (not b_lambda!19173) (not b!1138986)))

(declare-fun t!36049 () Bool)

(declare-fun tb!8889 () Bool)

(assert (=> (and start!98474 (= defaultEntry!1004 defaultEntry!1004) t!36049) tb!8889))

(declare-fun result!18351 () Bool)

(assert (=> tb!8889 (= result!18351 tp_is_empty!28615)))

(assert (=> b!1138986 t!36049))

(declare-fun b_and!38999 () Bool)

(assert (= b_and!38997 (and (=> t!36049 result!18351) b_and!38999)))

(declare-fun m!1050191 () Bool)

(assert (=> b!1138975 m!1050191))

(declare-fun m!1050193 () Bool)

(assert (=> b!1138984 m!1050193))

(declare-fun m!1050195 () Bool)

(assert (=> b!1138984 m!1050195))

(declare-fun m!1050197 () Bool)

(assert (=> b!1138984 m!1050197))

(declare-fun m!1050199 () Bool)

(assert (=> b!1138972 m!1050199))

(declare-fun m!1050201 () Bool)

(assert (=> b!1138972 m!1050201))

(assert (=> b!1138987 m!1050191))

(declare-fun m!1050203 () Bool)

(assert (=> mapNonEmpty!44747 m!1050203))

(declare-fun m!1050205 () Bool)

(assert (=> b!1138986 m!1050205))

(declare-fun m!1050207 () Bool)

(assert (=> b!1138986 m!1050207))

(declare-fun m!1050209 () Bool)

(assert (=> b!1138986 m!1050209))

(declare-fun m!1050211 () Bool)

(assert (=> b!1138986 m!1050211))

(assert (=> b!1138977 m!1050199))

(assert (=> b!1138977 m!1050199))

(declare-fun m!1050213 () Bool)

(assert (=> b!1138977 m!1050213))

(declare-fun m!1050215 () Bool)

(assert (=> b!1138977 m!1050215))

(declare-fun m!1050217 () Bool)

(assert (=> b!1138977 m!1050217))

(declare-fun m!1050219 () Bool)

(assert (=> start!98474 m!1050219))

(declare-fun m!1050221 () Bool)

(assert (=> start!98474 m!1050221))

(declare-fun m!1050223 () Bool)

(assert (=> b!1138985 m!1050223))

(declare-fun m!1050225 () Bool)

(assert (=> b!1138970 m!1050225))

(declare-fun m!1050227 () Bool)

(assert (=> b!1138990 m!1050227))

(declare-fun m!1050229 () Bool)

(assert (=> b!1138974 m!1050229))

(assert (=> bm!50541 m!1050217))

(declare-fun m!1050231 () Bool)

(assert (=> b!1138991 m!1050231))

(declare-fun m!1050233 () Bool)

(assert (=> b!1138993 m!1050233))

(declare-fun m!1050235 () Bool)

(assert (=> b!1138994 m!1050235))

(declare-fun m!1050237 () Bool)

(assert (=> b!1138976 m!1050237))

(declare-fun m!1050239 () Bool)

(assert (=> b!1138976 m!1050239))

(declare-fun m!1050241 () Bool)

(assert (=> b!1138976 m!1050241))

(declare-fun m!1050243 () Bool)

(assert (=> b!1138976 m!1050243))

(declare-fun m!1050245 () Bool)

(assert (=> bm!50538 m!1050245))

(declare-fun m!1050247 () Bool)

(assert (=> b!1138989 m!1050247))

(declare-fun m!1050249 () Bool)

(assert (=> b!1138989 m!1050249))

(declare-fun m!1050251 () Bool)

(assert (=> bm!50543 m!1050251))

(declare-fun m!1050253 () Bool)

(assert (=> b!1138978 m!1050253))

(declare-fun m!1050255 () Bool)

(assert (=> b!1138978 m!1050255))

(declare-fun m!1050257 () Bool)

(assert (=> bm!50540 m!1050257))

(declare-fun m!1050259 () Bool)

(assert (=> bm!50536 m!1050259))

(check-sat (not bm!50538) (not b_next!24085) (not b!1138984) (not b!1138994) (not b!1138989) (not b!1138976) (not b!1138990) (not b!1138970) (not b!1138985) (not b!1138972) (not b!1138978) (not bm!50543) (not bm!50540) (not start!98474) b_and!38999 (not bm!50536) tp_is_empty!28615 (not b_lambda!19173) (not mapNonEmpty!44747) (not b!1138991) (not b!1138975) (not b!1138993) (not b!1138987) (not b!1138977) (not b!1138986) (not bm!50541))
(check-sat b_and!38999 (not b_next!24085))
