; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100820 () Bool)

(assert start!100820)

(declare-fun b_free!25959 () Bool)

(declare-fun b_next!25959 () Bool)

(assert (=> start!100820 (= b_free!25959 (not b_next!25959))))

(declare-fun tp!90883 () Bool)

(declare-fun b_and!42919 () Bool)

(assert (=> start!100820 (= tp!90883 b_and!42919)))

(declare-fun bm!58854 () Bool)

(declare-fun call!58860 () Bool)

(declare-fun call!58863 () Bool)

(assert (=> bm!58854 (= call!58860 call!58863)))

(declare-fun b!1206979 () Bool)

(declare-fun e!685434 () Bool)

(declare-fun e!685431 () Bool)

(assert (=> b!1206979 (= e!685434 (not e!685431))))

(declare-fun res!802590 () Bool)

(assert (=> b!1206979 (=> res!802590 e!685431)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206979 (= res!802590 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78109 0))(
  ( (array!78110 (arr!37694 (Array (_ BitVec 32) (_ BitVec 64))) (size!38230 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78109)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206979 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40010 0))(
  ( (Unit!40011) )
))
(declare-fun lt!547600 () Unit!40010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78109 (_ BitVec 64) (_ BitVec 32)) Unit!40010)

(assert (=> b!1206979 (= lt!547600 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1206980 () Bool)

(declare-fun e!685444 () Unit!40010)

(declare-fun Unit!40012 () Unit!40010)

(assert (=> b!1206980 (= e!685444 Unit!40012)))

(declare-datatypes ((V!46011 0))(
  ( (V!46012 (val!15388 Int)) )
))
(declare-fun zeroValue!944 () V!46011)

(declare-fun c!118565 () Bool)

(declare-datatypes ((tuple2!19748 0))(
  ( (tuple2!19749 (_1!9885 (_ BitVec 64)) (_2!9885 V!46011)) )
))
(declare-datatypes ((List!26550 0))(
  ( (Nil!26547) (Cons!26546 (h!27755 tuple2!19748) (t!39489 List!26550)) )
))
(declare-datatypes ((ListLongMap!17717 0))(
  ( (ListLongMap!17718 (toList!8874 List!26550)) )
))
(declare-fun lt!547603 () ListLongMap!17717)

(declare-fun call!58857 () Unit!40010)

(declare-fun bm!58855 () Bool)

(declare-fun c!118567 () Bool)

(declare-fun minValue!944 () V!46011)

(declare-fun addStillContains!1024 (ListLongMap!17717 (_ BitVec 64) V!46011 (_ BitVec 64)) Unit!40010)

(assert (=> bm!58855 (= call!58857 (addStillContains!1024 lt!547603 (ite (or c!118565 c!118567) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!118565 c!118567) zeroValue!944 minValue!944) k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun call!58861 () ListLongMap!17717)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14622 0))(
  ( (ValueCellFull!14622 (v!18033 V!46011)) (EmptyCell!14622) )
))
(declare-datatypes ((array!78111 0))(
  ( (array!78112 (arr!37695 (Array (_ BitVec 32) ValueCell!14622)) (size!38231 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78111)

(declare-fun bm!58856 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5308 (array!78109 array!78111 (_ BitVec 32) (_ BitVec 32) V!46011 V!46011 (_ BitVec 32) Int) ListLongMap!17717)

(assert (=> bm!58856 (= call!58861 (getCurrentListMapNoExtraKeys!5308 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547597 () ListLongMap!17717)

(declare-fun call!58864 () ListLongMap!17717)

(declare-fun bm!58857 () Bool)

(declare-fun contains!6933 (ListLongMap!17717 (_ BitVec 64)) Bool)

(assert (=> bm!58857 (= call!58863 (contains!6933 (ite c!118565 lt!547597 call!58864) k0!934))))

(declare-fun mapIsEmpty!47853 () Bool)

(declare-fun mapRes!47853 () Bool)

(assert (=> mapIsEmpty!47853 mapRes!47853))

(declare-fun lt!547606 () array!78109)

(declare-fun call!58859 () ListLongMap!17717)

(declare-fun lt!547602 () array!78111)

(declare-fun bm!58858 () Bool)

(assert (=> bm!58858 (= call!58859 (getCurrentListMapNoExtraKeys!5308 lt!547606 lt!547602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206981 () Bool)

(declare-fun e!685433 () Bool)

(assert (=> b!1206981 (= e!685433 (= call!58859 call!58861))))

(declare-fun b!1206982 () Bool)

(declare-fun res!802582 () Bool)

(declare-fun e!685440 () Bool)

(assert (=> b!1206982 (=> (not res!802582) (not e!685440))))

(declare-datatypes ((List!26551 0))(
  ( (Nil!26548) (Cons!26547 (h!27756 (_ BitVec 64)) (t!39490 List!26551)) )
))
(declare-fun arrayNoDuplicates!0 (array!78109 (_ BitVec 32) List!26551) Bool)

(assert (=> b!1206982 (= res!802582 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26548))))

(declare-fun b!1206983 () Bool)

(declare-fun res!802584 () Bool)

(assert (=> b!1206983 (=> (not res!802584) (not e!685440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206983 (= res!802584 (validKeyInArray!0 k0!934))))

(declare-fun res!802592 () Bool)

(assert (=> start!100820 (=> (not res!802592) (not e!685440))))

(assert (=> start!100820 (= res!802592 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38230 _keys!1208))))))

(assert (=> start!100820 e!685440))

(declare-fun tp_is_empty!30663 () Bool)

(assert (=> start!100820 tp_is_empty!30663))

(declare-fun array_inv!28712 (array!78109) Bool)

(assert (=> start!100820 (array_inv!28712 _keys!1208)))

(assert (=> start!100820 true))

(assert (=> start!100820 tp!90883))

(declare-fun e!685437 () Bool)

(declare-fun array_inv!28713 (array!78111) Bool)

(assert (=> start!100820 (and (array_inv!28713 _values!996) e!685437)))

(declare-fun b!1206984 () Bool)

(declare-fun lt!547598 () Unit!40010)

(assert (=> b!1206984 (= e!685444 lt!547598)))

(declare-fun call!58858 () Unit!40010)

(assert (=> b!1206984 (= lt!547598 call!58858)))

(assert (=> b!1206984 call!58860))

(declare-fun bm!58859 () Bool)

(assert (=> bm!58859 (= call!58858 call!58857)))

(declare-fun b!1206985 () Bool)

(declare-fun res!802579 () Bool)

(assert (=> b!1206985 (=> (not res!802579) (not e!685440))))

(assert (=> b!1206985 (= res!802579 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38230 _keys!1208))))))

(declare-fun b!1206986 () Bool)

(declare-fun -!1830 (ListLongMap!17717 (_ BitVec 64)) ListLongMap!17717)

(assert (=> b!1206986 (= e!685433 (= call!58859 (-!1830 call!58861 k0!934)))))

(declare-fun b!1206987 () Bool)

(declare-fun e!685445 () Unit!40010)

(declare-fun lt!547594 () Unit!40010)

(assert (=> b!1206987 (= e!685445 lt!547594)))

(declare-fun lt!547592 () Unit!40010)

(assert (=> b!1206987 (= lt!547592 call!58857)))

(declare-fun call!58862 () ListLongMap!17717)

(assert (=> b!1206987 (= lt!547597 call!58862)))

(assert (=> b!1206987 call!58863))

(assert (=> b!1206987 (= lt!547594 (addStillContains!1024 lt!547597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun +!3995 (ListLongMap!17717 tuple2!19748) ListLongMap!17717)

(assert (=> b!1206987 (contains!6933 (+!3995 lt!547597 (tuple2!19749 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1206988 () Bool)

(declare-fun res!802586 () Bool)

(assert (=> b!1206988 (=> (not res!802586) (not e!685440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78109 (_ BitVec 32)) Bool)

(assert (=> b!1206988 (= res!802586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47853 () Bool)

(declare-fun tp!90882 () Bool)

(declare-fun e!685435 () Bool)

(assert (=> mapNonEmpty!47853 (= mapRes!47853 (and tp!90882 e!685435))))

(declare-fun mapValue!47853 () ValueCell!14622)

(declare-fun mapRest!47853 () (Array (_ BitVec 32) ValueCell!14622))

(declare-fun mapKey!47853 () (_ BitVec 32))

(assert (=> mapNonEmpty!47853 (= (arr!37695 _values!996) (store mapRest!47853 mapKey!47853 mapValue!47853))))

(declare-fun b!1206989 () Bool)

(declare-fun e!685438 () Bool)

(assert (=> b!1206989 (= e!685431 e!685438)))

(declare-fun res!802589 () Bool)

(assert (=> b!1206989 (=> res!802589 e!685438)))

(assert (=> b!1206989 (= res!802589 (not (= from!1455 i!673)))))

(declare-fun lt!547596 () ListLongMap!17717)

(assert (=> b!1206989 (= lt!547596 (getCurrentListMapNoExtraKeys!5308 lt!547606 lt!547602 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3212 (Int (_ BitVec 64)) V!46011)

(assert (=> b!1206989 (= lt!547602 (array!78112 (store (arr!37695 _values!996) i!673 (ValueCellFull!14622 (dynLambda!3212 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38231 _values!996)))))

(declare-fun lt!547604 () ListLongMap!17717)

(assert (=> b!1206989 (= lt!547604 (getCurrentListMapNoExtraKeys!5308 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206990 () Bool)

(declare-fun c!118568 () Bool)

(declare-fun lt!547595 () Bool)

(assert (=> b!1206990 (= c!118568 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547595))))

(declare-fun e!685443 () Unit!40010)

(assert (=> b!1206990 (= e!685443 e!685444)))

(declare-fun b!1206991 () Bool)

(declare-fun e!685441 () Bool)

(assert (=> b!1206991 (= e!685438 e!685441)))

(declare-fun res!802580 () Bool)

(assert (=> b!1206991 (=> res!802580 e!685441)))

(assert (=> b!1206991 (= res!802580 (not (= (select (arr!37694 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1206991 e!685433))

(declare-fun c!118564 () Bool)

(assert (=> b!1206991 (= c!118564 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!547601 () Unit!40010)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1037 (array!78109 array!78111 (_ BitVec 32) (_ BitVec 32) V!46011 V!46011 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> b!1206991 (= lt!547601 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1037 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206992 () Bool)

(declare-fun res!802588 () Bool)

(assert (=> b!1206992 (=> (not res!802588) (not e!685440))))

(assert (=> b!1206992 (= res!802588 (= (select (arr!37694 _keys!1208) i!673) k0!934))))

(declare-fun b!1206993 () Bool)

(declare-fun res!802587 () Bool)

(assert (=> b!1206993 (=> (not res!802587) (not e!685440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206993 (= res!802587 (validMask!0 mask!1564))))

(declare-fun b!1206994 () Bool)

(assert (=> b!1206994 (= e!685440 e!685434)))

(declare-fun res!802593 () Bool)

(assert (=> b!1206994 (=> (not res!802593) (not e!685434))))

(assert (=> b!1206994 (= res!802593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547606 mask!1564))))

(assert (=> b!1206994 (= lt!547606 (array!78110 (store (arr!37694 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38230 _keys!1208)))))

(declare-fun e!685439 () Bool)

(declare-fun b!1206995 () Bool)

(assert (=> b!1206995 (= e!685439 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!685430 () Bool)

(declare-fun b!1206996 () Bool)

(assert (=> b!1206996 (= e!685430 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547595) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206997 () Bool)

(declare-fun e!685436 () Bool)

(assert (=> b!1206997 (= e!685436 true)))

(assert (=> b!1206997 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26548)))

(declare-fun lt!547599 () Unit!40010)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78109 (_ BitVec 32) (_ BitVec 32)) Unit!40010)

(assert (=> b!1206997 (= lt!547599 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1206997 e!685439))

(declare-fun res!802585 () Bool)

(assert (=> b!1206997 (=> (not res!802585) (not e!685439))))

(assert (=> b!1206997 (= res!802585 e!685430)))

(declare-fun c!118566 () Bool)

(assert (=> b!1206997 (= c!118566 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547607 () Unit!40010)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!577 (array!78109 array!78111 (_ BitVec 32) (_ BitVec 32) V!46011 V!46011 (_ BitVec 64) (_ BitVec 32) Int) Unit!40010)

(assert (=> b!1206997 (= lt!547607 (lemmaListMapContainsThenArrayContainsFrom!577 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547593 () Unit!40010)

(assert (=> b!1206997 (= lt!547593 e!685445)))

(assert (=> b!1206997 (= c!118565 (and (not lt!547595) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206997 (= lt!547595 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58860 () Bool)

(assert (=> bm!58860 (= call!58864 call!58862)))

(declare-fun bm!58861 () Bool)

(assert (=> bm!58861 (= call!58862 (+!3995 lt!547603 (ite (or c!118565 c!118567) (tuple2!19749 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19749 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1206998 () Bool)

(declare-fun e!685432 () Bool)

(assert (=> b!1206998 (= e!685437 (and e!685432 mapRes!47853))))

(declare-fun condMapEmpty!47853 () Bool)

(declare-fun mapDefault!47853 () ValueCell!14622)

(assert (=> b!1206998 (= condMapEmpty!47853 (= (arr!37695 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14622)) mapDefault!47853)))))

(declare-fun b!1206999 () Bool)

(declare-fun res!802583 () Bool)

(assert (=> b!1206999 (=> (not res!802583) (not e!685434))))

(assert (=> b!1206999 (= res!802583 (arrayNoDuplicates!0 lt!547606 #b00000000000000000000000000000000 Nil!26548))))

(declare-fun b!1207000 () Bool)

(assert (=> b!1207000 (= e!685432 tp_is_empty!30663)))

(declare-fun b!1207001 () Bool)

(assert (=> b!1207001 (= e!685435 tp_is_empty!30663)))

(declare-fun b!1207002 () Bool)

(assert (=> b!1207002 call!58860))

(declare-fun lt!547605 () Unit!40010)

(assert (=> b!1207002 (= lt!547605 call!58858)))

(assert (=> b!1207002 (= e!685443 lt!547605)))

(declare-fun b!1207003 () Bool)

(assert (=> b!1207003 (= e!685430 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1207004 () Bool)

(assert (=> b!1207004 (= e!685441 e!685436)))

(declare-fun res!802591 () Bool)

(assert (=> b!1207004 (=> res!802591 e!685436)))

(assert (=> b!1207004 (= res!802591 (not (contains!6933 lt!547603 k0!934)))))

(assert (=> b!1207004 (= lt!547603 (getCurrentListMapNoExtraKeys!5308 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1207005 () Bool)

(assert (=> b!1207005 (= e!685445 e!685443)))

(assert (=> b!1207005 (= c!118567 (and (not lt!547595) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1207006 () Bool)

(declare-fun res!802581 () Bool)

(assert (=> b!1207006 (=> (not res!802581) (not e!685440))))

(assert (=> b!1207006 (= res!802581 (and (= (size!38231 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38230 _keys!1208) (size!38231 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100820 res!802592) b!1206993))

(assert (= (and b!1206993 res!802587) b!1207006))

(assert (= (and b!1207006 res!802581) b!1206988))

(assert (= (and b!1206988 res!802586) b!1206982))

(assert (= (and b!1206982 res!802582) b!1206985))

(assert (= (and b!1206985 res!802579) b!1206983))

(assert (= (and b!1206983 res!802584) b!1206992))

(assert (= (and b!1206992 res!802588) b!1206994))

(assert (= (and b!1206994 res!802593) b!1206999))

(assert (= (and b!1206999 res!802583) b!1206979))

(assert (= (and b!1206979 (not res!802590)) b!1206989))

(assert (= (and b!1206989 (not res!802589)) b!1206991))

(assert (= (and b!1206991 c!118564) b!1206986))

(assert (= (and b!1206991 (not c!118564)) b!1206981))

(assert (= (or b!1206986 b!1206981) bm!58858))

(assert (= (or b!1206986 b!1206981) bm!58856))

(assert (= (and b!1206991 (not res!802580)) b!1207004))

(assert (= (and b!1207004 (not res!802591)) b!1206997))

(assert (= (and b!1206997 c!118565) b!1206987))

(assert (= (and b!1206997 (not c!118565)) b!1207005))

(assert (= (and b!1207005 c!118567) b!1207002))

(assert (= (and b!1207005 (not c!118567)) b!1206990))

(assert (= (and b!1206990 c!118568) b!1206984))

(assert (= (and b!1206990 (not c!118568)) b!1206980))

(assert (= (or b!1207002 b!1206984) bm!58859))

(assert (= (or b!1207002 b!1206984) bm!58860))

(assert (= (or b!1207002 b!1206984) bm!58854))

(assert (= (or b!1206987 bm!58854) bm!58857))

(assert (= (or b!1206987 bm!58859) bm!58855))

(assert (= (or b!1206987 bm!58860) bm!58861))

(assert (= (and b!1206997 c!118566) b!1207003))

(assert (= (and b!1206997 (not c!118566)) b!1206996))

(assert (= (and b!1206997 res!802585) b!1206995))

(assert (= (and b!1206998 condMapEmpty!47853) mapIsEmpty!47853))

(assert (= (and b!1206998 (not condMapEmpty!47853)) mapNonEmpty!47853))

(get-info :version)

(assert (= (and mapNonEmpty!47853 ((_ is ValueCellFull!14622) mapValue!47853)) b!1207001))

(assert (= (and b!1206998 ((_ is ValueCellFull!14622) mapDefault!47853)) b!1207000))

(assert (= start!100820 b!1206998))

(declare-fun b_lambda!21393 () Bool)

(assert (=> (not b_lambda!21393) (not b!1206989)))

(declare-fun t!39488 () Bool)

(declare-fun tb!10759 () Bool)

(assert (=> (and start!100820 (= defaultEntry!1004 defaultEntry!1004) t!39488) tb!10759))

(declare-fun result!22105 () Bool)

(assert (=> tb!10759 (= result!22105 tp_is_empty!30663)))

(assert (=> b!1206989 t!39488))

(declare-fun b_and!42921 () Bool)

(assert (= b_and!42919 (and (=> t!39488 result!22105) b_and!42921)))

(declare-fun m!1112593 () Bool)

(assert (=> b!1206991 m!1112593))

(declare-fun m!1112595 () Bool)

(assert (=> b!1206991 m!1112595))

(declare-fun m!1112597 () Bool)

(assert (=> bm!58855 m!1112597))

(declare-fun m!1112599 () Bool)

(assert (=> b!1206993 m!1112599))

(declare-fun m!1112601 () Bool)

(assert (=> mapNonEmpty!47853 m!1112601))

(declare-fun m!1112603 () Bool)

(assert (=> b!1206983 m!1112603))

(declare-fun m!1112605 () Bool)

(assert (=> b!1206997 m!1112605))

(declare-fun m!1112607 () Bool)

(assert (=> b!1206997 m!1112607))

(declare-fun m!1112609 () Bool)

(assert (=> b!1206997 m!1112609))

(declare-fun m!1112611 () Bool)

(assert (=> b!1206987 m!1112611))

(declare-fun m!1112613 () Bool)

(assert (=> b!1206987 m!1112613))

(assert (=> b!1206987 m!1112613))

(declare-fun m!1112615 () Bool)

(assert (=> b!1206987 m!1112615))

(declare-fun m!1112617 () Bool)

(assert (=> b!1206994 m!1112617))

(declare-fun m!1112619 () Bool)

(assert (=> b!1206994 m!1112619))

(declare-fun m!1112621 () Bool)

(assert (=> bm!58856 m!1112621))

(declare-fun m!1112623 () Bool)

(assert (=> b!1207003 m!1112623))

(declare-fun m!1112625 () Bool)

(assert (=> b!1206986 m!1112625))

(declare-fun m!1112627 () Bool)

(assert (=> b!1206979 m!1112627))

(declare-fun m!1112629 () Bool)

(assert (=> b!1206979 m!1112629))

(declare-fun m!1112631 () Bool)

(assert (=> b!1206982 m!1112631))

(declare-fun m!1112633 () Bool)

(assert (=> b!1207004 m!1112633))

(assert (=> b!1207004 m!1112621))

(declare-fun m!1112635 () Bool)

(assert (=> b!1206989 m!1112635))

(declare-fun m!1112637 () Bool)

(assert (=> b!1206989 m!1112637))

(declare-fun m!1112639 () Bool)

(assert (=> b!1206989 m!1112639))

(declare-fun m!1112641 () Bool)

(assert (=> b!1206989 m!1112641))

(declare-fun m!1112643 () Bool)

(assert (=> b!1206988 m!1112643))

(declare-fun m!1112645 () Bool)

(assert (=> start!100820 m!1112645))

(declare-fun m!1112647 () Bool)

(assert (=> start!100820 m!1112647))

(declare-fun m!1112649 () Bool)

(assert (=> bm!58861 m!1112649))

(declare-fun m!1112651 () Bool)

(assert (=> bm!58858 m!1112651))

(assert (=> b!1206995 m!1112623))

(declare-fun m!1112653 () Bool)

(assert (=> b!1206999 m!1112653))

(declare-fun m!1112655 () Bool)

(assert (=> b!1206992 m!1112655))

(declare-fun m!1112657 () Bool)

(assert (=> bm!58857 m!1112657))

(check-sat (not b_lambda!21393) (not b!1206993) (not b!1206999) (not bm!58855) (not b!1206979) (not b!1206991) (not b!1206997) (not bm!58858) (not b!1206995) (not b!1206994) (not bm!58857) (not b_next!25959) (not b!1206989) (not b!1206986) (not mapNonEmpty!47853) (not b!1206987) (not b!1206982) (not bm!58861) (not b!1207004) (not b!1206983) (not b!1206988) (not bm!58856) (not start!100820) (not b!1207003) tp_is_empty!30663 b_and!42921)
(check-sat b_and!42921 (not b_next!25959))
