; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100982 () Bool)

(assert start!100982)

(declare-fun b_free!25987 () Bool)

(declare-fun b_next!25987 () Bool)

(assert (=> start!100982 (= b_free!25987 (not b_next!25987))))

(declare-fun tp!90976 () Bool)

(declare-fun b_and!43029 () Bool)

(assert (=> start!100982 (= tp!90976 b_and!43029)))

(declare-fun mapIsEmpty!47905 () Bool)

(declare-fun mapRes!47905 () Bool)

(assert (=> mapIsEmpty!47905 mapRes!47905))

(declare-fun b!1208990 () Bool)

(declare-fun e!686648 () Bool)

(declare-fun e!686643 () Bool)

(assert (=> b!1208990 (= e!686648 e!686643)))

(declare-fun res!803571 () Bool)

(assert (=> b!1208990 (=> res!803571 e!686643)))

(declare-datatypes ((array!78080 0))(
  ( (array!78081 (arr!37677 (Array (_ BitVec 32) (_ BitVec 64))) (size!38215 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78080)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1208990 (= res!803571 (not (= (select (arr!37677 _keys!1208) from!1455) k0!934)))))

(declare-fun e!686645 () Bool)

(assert (=> b!1208990 e!686645))

(declare-fun c!118995 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208990 (= c!118995 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!46049 0))(
  ( (V!46050 (val!15402 Int)) )
))
(declare-fun zeroValue!944 () V!46049)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!39911 0))(
  ( (Unit!39912) )
))
(declare-fun lt!548630 () Unit!39911)

(declare-datatypes ((ValueCell!14636 0))(
  ( (ValueCellFull!14636 (v!18052 V!46049)) (EmptyCell!14636) )
))
(declare-datatypes ((array!78082 0))(
  ( (array!78083 (arr!37678 (Array (_ BitVec 32) ValueCell!14636)) (size!38216 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78082)

(declare-fun minValue!944 () V!46049)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1048 (array!78080 array!78082 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39911)

(assert (=> b!1208990 (= lt!548630 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1048 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1208991 () Bool)

(declare-fun e!686646 () Unit!39911)

(declare-fun Unit!39913 () Unit!39911)

(assert (=> b!1208991 (= e!686646 Unit!39913)))

(declare-fun b!1208992 () Bool)

(declare-fun e!686651 () Bool)

(declare-fun e!686642 () Bool)

(assert (=> b!1208992 (= e!686651 (not e!686642))))

(declare-fun res!803570 () Bool)

(assert (=> b!1208992 (=> res!803570 e!686642)))

(assert (=> b!1208992 (= res!803570 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1208992 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!548617 () Unit!39911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78080 (_ BitVec 64) (_ BitVec 32)) Unit!39911)

(assert (=> b!1208992 (= lt!548617 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1208993 () Bool)

(declare-datatypes ((tuple2!19844 0))(
  ( (tuple2!19845 (_1!9933 (_ BitVec 64)) (_2!9933 V!46049)) )
))
(declare-datatypes ((List!26624 0))(
  ( (Nil!26621) (Cons!26620 (h!27829 tuple2!19844) (t!39582 List!26624)) )
))
(declare-datatypes ((ListLongMap!17813 0))(
  ( (ListLongMap!17814 (toList!8922 List!26624)) )
))
(declare-fun call!59266 () ListLongMap!17813)

(declare-fun call!59267 () ListLongMap!17813)

(assert (=> b!1208993 (= e!686645 (= call!59266 call!59267))))

(declare-fun b!1208994 () Bool)

(declare-fun e!686639 () Unit!39911)

(declare-fun lt!548628 () Unit!39911)

(assert (=> b!1208994 (= e!686639 lt!548628)))

(declare-fun lt!548622 () ListLongMap!17813)

(declare-fun lt!548626 () Unit!39911)

(declare-fun addStillContains!1033 (ListLongMap!17813 (_ BitVec 64) V!46049 (_ BitVec 64)) Unit!39911)

(assert (=> b!1208994 (= lt!548626 (addStillContains!1033 lt!548622 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun lt!548627 () ListLongMap!17813)

(declare-fun call!59262 () ListLongMap!17813)

(assert (=> b!1208994 (= lt!548627 call!59262)))

(declare-fun call!59265 () Bool)

(assert (=> b!1208994 call!59265))

(declare-fun call!59263 () Unit!39911)

(assert (=> b!1208994 (= lt!548628 call!59263)))

(declare-fun contains!6927 (ListLongMap!17813 (_ BitVec 64)) Bool)

(declare-fun +!4049 (ListLongMap!17813 tuple2!19844) ListLongMap!17813)

(assert (=> b!1208994 (contains!6927 (+!4049 lt!548627 (tuple2!19845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1208995 () Bool)

(declare-fun e!686637 () Bool)

(declare-fun tp_is_empty!30691 () Bool)

(assert (=> b!1208995 (= e!686637 tp_is_empty!30691)))

(declare-fun b!1208996 () Bool)

(declare-fun res!803559 () Bool)

(assert (=> b!1208996 (=> (not res!803559) (not e!686651))))

(declare-fun lt!548620 () array!78080)

(declare-datatypes ((List!26625 0))(
  ( (Nil!26622) (Cons!26621 (h!27830 (_ BitVec 64)) (t!39583 List!26625)) )
))
(declare-fun arrayNoDuplicates!0 (array!78080 (_ BitVec 32) List!26625) Bool)

(assert (=> b!1208996 (= res!803559 (arrayNoDuplicates!0 lt!548620 #b00000000000000000000000000000000 Nil!26622))))

(declare-fun b!1208997 () Bool)

(assert (=> b!1208997 (= e!686642 e!686648)))

(declare-fun res!803558 () Bool)

(assert (=> b!1208997 (=> res!803558 e!686648)))

(assert (=> b!1208997 (= res!803558 (not (= from!1455 i!673)))))

(declare-fun lt!548632 () ListLongMap!17813)

(declare-fun lt!548621 () array!78082)

(declare-fun getCurrentListMapNoExtraKeys!5365 (array!78080 array!78082 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 32) Int) ListLongMap!17813)

(assert (=> b!1208997 (= lt!548632 (getCurrentListMapNoExtraKeys!5365 lt!548620 lt!548621 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3229 (Int (_ BitVec 64)) V!46049)

(assert (=> b!1208997 (= lt!548621 (array!78083 (store (arr!37678 _values!996) i!673 (ValueCellFull!14636 (dynLambda!3229 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38216 _values!996)))))

(declare-fun lt!548616 () ListLongMap!17813)

(assert (=> b!1208997 (= lt!548616 (getCurrentListMapNoExtraKeys!5365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1208998 () Bool)

(declare-fun -!1806 (ListLongMap!17813 (_ BitVec 64)) ListLongMap!17813)

(assert (=> b!1208998 (= e!686645 (= call!59266 (-!1806 call!59267 k0!934)))))

(declare-fun b!1208999 () Bool)

(declare-fun res!803560 () Bool)

(declare-fun e!686647 () Bool)

(assert (=> b!1208999 (=> (not res!803560) (not e!686647))))

(assert (=> b!1208999 (= res!803560 (and (= (size!38216 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38215 _keys!1208) (size!38216 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!59258 () Bool)

(declare-fun call!59261 () Unit!39911)

(assert (=> bm!59258 (= call!59261 call!59263)))

(declare-fun e!686640 () Bool)

(declare-fun b!1209000 () Bool)

(assert (=> b!1209000 (= e!686640 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1209001 () Bool)

(declare-fun e!686649 () Unit!39911)

(assert (=> b!1209001 (= e!686639 e!686649)))

(declare-fun c!118994 () Bool)

(declare-fun lt!548625 () Bool)

(assert (=> b!1209001 (= c!118994 (and (not lt!548625) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!59259 () Bool)

(assert (=> bm!59259 (= call!59266 (getCurrentListMapNoExtraKeys!5365 lt!548620 lt!548621 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209002 () Bool)

(assert (=> b!1209002 (= e!686647 e!686651)))

(declare-fun res!803561 () Bool)

(assert (=> b!1209002 (=> (not res!803561) (not e!686651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78080 (_ BitVec 32)) Bool)

(assert (=> b!1209002 (= res!803561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548620 mask!1564))))

(assert (=> b!1209002 (= lt!548620 (array!78081 (store (arr!37677 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38215 _keys!1208)))))

(declare-fun b!1209003 () Bool)

(declare-fun res!803568 () Bool)

(declare-fun e!686638 () Bool)

(assert (=> b!1209003 (=> res!803568 e!686638)))

(declare-fun noDuplicate!1641 (List!26625) Bool)

(assert (=> b!1209003 (= res!803568 (not (noDuplicate!1641 Nil!26622)))))

(declare-fun bm!59260 () Bool)

(declare-fun call!59268 () Bool)

(assert (=> bm!59260 (= call!59268 call!59265)))

(declare-fun b!1209004 () Bool)

(declare-fun lt!548629 () Unit!39911)

(assert (=> b!1209004 (= e!686646 lt!548629)))

(assert (=> b!1209004 (= lt!548629 call!59261)))

(assert (=> b!1209004 call!59268))

(declare-fun call!59264 () ListLongMap!17813)

(declare-fun bm!59261 () Bool)

(declare-fun c!118992 () Bool)

(assert (=> bm!59261 (= call!59265 (contains!6927 (ite c!118992 lt!548627 call!59264) k0!934))))

(declare-fun b!1209005 () Bool)

(declare-fun res!803567 () Bool)

(assert (=> b!1209005 (=> (not res!803567) (not e!686647))))

(assert (=> b!1209005 (= res!803567 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26622))))

(declare-fun b!1209006 () Bool)

(declare-fun e!686636 () Bool)

(assert (=> b!1209006 (= e!686636 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!548625) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1209007 () Bool)

(declare-fun res!803565 () Bool)

(assert (=> b!1209007 (=> (not res!803565) (not e!686647))))

(assert (=> b!1209007 (= res!803565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!59262 () Bool)

(assert (=> bm!59262 (= call!59262 (+!4049 lt!548622 (ite (or c!118992 c!118994) (tuple2!19845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1209008 () Bool)

(declare-fun e!686652 () Bool)

(assert (=> b!1209008 (= e!686652 e!686638)))

(declare-fun res!803566 () Bool)

(assert (=> b!1209008 (=> res!803566 e!686638)))

(assert (=> b!1209008 (= res!803566 (or (bvsge (size!38215 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38215 _keys!1208)) (bvsge from!1455 (size!38215 _keys!1208))))))

(assert (=> b!1209008 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26622)))

(declare-fun lt!548624 () Unit!39911)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78080 (_ BitVec 32) (_ BitVec 32)) Unit!39911)

(assert (=> b!1209008 (= lt!548624 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1209008 e!686640))

(declare-fun res!803569 () Bool)

(assert (=> b!1209008 (=> (not res!803569) (not e!686640))))

(assert (=> b!1209008 (= res!803569 e!686636)))

(declare-fun c!118991 () Bool)

(assert (=> b!1209008 (= c!118991 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!548631 () Unit!39911)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!578 (array!78080 array!78082 (_ BitVec 32) (_ BitVec 32) V!46049 V!46049 (_ BitVec 64) (_ BitVec 32) Int) Unit!39911)

(assert (=> b!1209008 (= lt!548631 (lemmaListMapContainsThenArrayContainsFrom!578 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!548618 () Unit!39911)

(assert (=> b!1209008 (= lt!548618 e!686639)))

(assert (=> b!1209008 (= c!118992 (and (not lt!548625) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1209008 (= lt!548625 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1209009 () Bool)

(declare-fun res!803562 () Bool)

(assert (=> b!1209009 (=> (not res!803562) (not e!686647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1209009 (= res!803562 (validKeyInArray!0 k0!934))))

(declare-fun bm!59263 () Bool)

(assert (=> bm!59263 (= call!59267 (getCurrentListMapNoExtraKeys!5365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209010 () Bool)

(assert (=> b!1209010 (= e!686638 true)))

(declare-fun lt!548619 () Bool)

(declare-fun contains!6928 (List!26625 (_ BitVec 64)) Bool)

(assert (=> b!1209010 (= lt!548619 (contains!6928 Nil!26622 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1209011 () Bool)

(declare-fun c!118993 () Bool)

(assert (=> b!1209011 (= c!118993 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!548625))))

(assert (=> b!1209011 (= e!686649 e!686646)))

(declare-fun b!1209012 () Bool)

(declare-fun res!803563 () Bool)

(assert (=> b!1209012 (=> (not res!803563) (not e!686647))))

(assert (=> b!1209012 (= res!803563 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38215 _keys!1208))))))

(declare-fun b!1209013 () Bool)

(declare-fun res!803557 () Bool)

(assert (=> b!1209013 (=> (not res!803557) (not e!686647))))

(assert (=> b!1209013 (= res!803557 (= (select (arr!37677 _keys!1208) i!673) k0!934))))

(declare-fun b!1209014 () Bool)

(assert (=> b!1209014 (= e!686643 e!686652)))

(declare-fun res!803573 () Bool)

(assert (=> b!1209014 (=> res!803573 e!686652)))

(assert (=> b!1209014 (= res!803573 (not (contains!6927 lt!548622 k0!934)))))

(assert (=> b!1209014 (= lt!548622 (getCurrentListMapNoExtraKeys!5365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1209015 () Bool)

(declare-fun e!686644 () Bool)

(declare-fun e!686641 () Bool)

(assert (=> b!1209015 (= e!686644 (and e!686641 mapRes!47905))))

(declare-fun condMapEmpty!47905 () Bool)

(declare-fun mapDefault!47905 () ValueCell!14636)

(assert (=> b!1209015 (= condMapEmpty!47905 (= (arr!37678 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14636)) mapDefault!47905)))))

(declare-fun b!1209016 () Bool)

(declare-fun res!803572 () Bool)

(assert (=> b!1209016 (=> (not res!803572) (not e!686647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1209016 (= res!803572 (validMask!0 mask!1564))))

(declare-fun b!1209017 () Bool)

(assert (=> b!1209017 call!59268))

(declare-fun lt!548623 () Unit!39911)

(assert (=> b!1209017 (= lt!548623 call!59261)))

(assert (=> b!1209017 (= e!686649 lt!548623)))

(declare-fun bm!59264 () Bool)

(assert (=> bm!59264 (= call!59263 (addStillContains!1033 (ite c!118992 lt!548627 lt!548622) (ite c!118992 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118994 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118992 minValue!944 (ite c!118994 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1209018 () Bool)

(declare-fun res!803574 () Bool)

(assert (=> b!1209018 (=> res!803574 e!686638)))

(assert (=> b!1209018 (= res!803574 (contains!6928 Nil!26622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!59265 () Bool)

(assert (=> bm!59265 (= call!59264 call!59262)))

(declare-fun b!1209019 () Bool)

(assert (=> b!1209019 (= e!686641 tp_is_empty!30691)))

(declare-fun res!803564 () Bool)

(assert (=> start!100982 (=> (not res!803564) (not e!686647))))

(assert (=> start!100982 (= res!803564 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38215 _keys!1208))))))

(assert (=> start!100982 e!686647))

(assert (=> start!100982 tp_is_empty!30691))

(declare-fun array_inv!28810 (array!78080) Bool)

(assert (=> start!100982 (array_inv!28810 _keys!1208)))

(assert (=> start!100982 true))

(assert (=> start!100982 tp!90976))

(declare-fun array_inv!28811 (array!78082) Bool)

(assert (=> start!100982 (and (array_inv!28811 _values!996) e!686644)))

(declare-fun mapNonEmpty!47905 () Bool)

(declare-fun tp!90977 () Bool)

(assert (=> mapNonEmpty!47905 (= mapRes!47905 (and tp!90977 e!686637))))

(declare-fun mapKey!47905 () (_ BitVec 32))

(declare-fun mapValue!47905 () ValueCell!14636)

(declare-fun mapRest!47905 () (Array (_ BitVec 32) ValueCell!14636))

(assert (=> mapNonEmpty!47905 (= (arr!37678 _values!996) (store mapRest!47905 mapKey!47905 mapValue!47905))))

(declare-fun b!1209020 () Bool)

(assert (=> b!1209020 (= e!686636 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (= (and start!100982 res!803564) b!1209016))

(assert (= (and b!1209016 res!803572) b!1208999))

(assert (= (and b!1208999 res!803560) b!1209007))

(assert (= (and b!1209007 res!803565) b!1209005))

(assert (= (and b!1209005 res!803567) b!1209012))

(assert (= (and b!1209012 res!803563) b!1209009))

(assert (= (and b!1209009 res!803562) b!1209013))

(assert (= (and b!1209013 res!803557) b!1209002))

(assert (= (and b!1209002 res!803561) b!1208996))

(assert (= (and b!1208996 res!803559) b!1208992))

(assert (= (and b!1208992 (not res!803570)) b!1208997))

(assert (= (and b!1208997 (not res!803558)) b!1208990))

(assert (= (and b!1208990 c!118995) b!1208998))

(assert (= (and b!1208990 (not c!118995)) b!1208993))

(assert (= (or b!1208998 b!1208993) bm!59259))

(assert (= (or b!1208998 b!1208993) bm!59263))

(assert (= (and b!1208990 (not res!803571)) b!1209014))

(assert (= (and b!1209014 (not res!803573)) b!1209008))

(assert (= (and b!1209008 c!118992) b!1208994))

(assert (= (and b!1209008 (not c!118992)) b!1209001))

(assert (= (and b!1209001 c!118994) b!1209017))

(assert (= (and b!1209001 (not c!118994)) b!1209011))

(assert (= (and b!1209011 c!118993) b!1209004))

(assert (= (and b!1209011 (not c!118993)) b!1208991))

(assert (= (or b!1209017 b!1209004) bm!59258))

(assert (= (or b!1209017 b!1209004) bm!59265))

(assert (= (or b!1209017 b!1209004) bm!59260))

(assert (= (or b!1208994 bm!59260) bm!59261))

(assert (= (or b!1208994 bm!59258) bm!59264))

(assert (= (or b!1208994 bm!59265) bm!59262))

(assert (= (and b!1209008 c!118991) b!1209020))

(assert (= (and b!1209008 (not c!118991)) b!1209006))

(assert (= (and b!1209008 res!803569) b!1209000))

(assert (= (and b!1209008 (not res!803566)) b!1209003))

(assert (= (and b!1209003 (not res!803568)) b!1209018))

(assert (= (and b!1209018 (not res!803574)) b!1209010))

(assert (= (and b!1209015 condMapEmpty!47905) mapIsEmpty!47905))

(assert (= (and b!1209015 (not condMapEmpty!47905)) mapNonEmpty!47905))

(get-info :version)

(assert (= (and mapNonEmpty!47905 ((_ is ValueCellFull!14636) mapValue!47905)) b!1208995))

(assert (= (and b!1209015 ((_ is ValueCellFull!14636) mapDefault!47905)) b!1209019))

(assert (= start!100982 b!1209015))

(declare-fun b_lambda!21561 () Bool)

(assert (=> (not b_lambda!21561) (not b!1208997)))

(declare-fun t!39581 () Bool)

(declare-fun tb!10779 () Bool)

(assert (=> (and start!100982 (= defaultEntry!1004 defaultEntry!1004) t!39581) tb!10779))

(declare-fun result!22159 () Bool)

(assert (=> tb!10779 (= result!22159 tp_is_empty!30691)))

(assert (=> b!1208997 t!39581))

(declare-fun b_and!43031 () Bool)

(assert (= b_and!43029 (and (=> t!39581 result!22159) b_and!43031)))

(declare-fun m!1114297 () Bool)

(assert (=> b!1208996 m!1114297))

(declare-fun m!1114299 () Bool)

(assert (=> bm!59261 m!1114299))

(declare-fun m!1114301 () Bool)

(assert (=> b!1209005 m!1114301))

(declare-fun m!1114303 () Bool)

(assert (=> b!1209016 m!1114303))

(declare-fun m!1114305 () Bool)

(assert (=> b!1209010 m!1114305))

(declare-fun m!1114307 () Bool)

(assert (=> bm!59259 m!1114307))

(declare-fun m!1114309 () Bool)

(assert (=> bm!59264 m!1114309))

(declare-fun m!1114311 () Bool)

(assert (=> mapNonEmpty!47905 m!1114311))

(declare-fun m!1114313 () Bool)

(assert (=> b!1209009 m!1114313))

(declare-fun m!1114315 () Bool)

(assert (=> b!1209008 m!1114315))

(declare-fun m!1114317 () Bool)

(assert (=> b!1209008 m!1114317))

(declare-fun m!1114319 () Bool)

(assert (=> b!1209008 m!1114319))

(declare-fun m!1114321 () Bool)

(assert (=> bm!59262 m!1114321))

(declare-fun m!1114323 () Bool)

(assert (=> b!1208997 m!1114323))

(declare-fun m!1114325 () Bool)

(assert (=> b!1208997 m!1114325))

(declare-fun m!1114327 () Bool)

(assert (=> b!1208997 m!1114327))

(declare-fun m!1114329 () Bool)

(assert (=> b!1208997 m!1114329))

(declare-fun m!1114331 () Bool)

(assert (=> b!1208992 m!1114331))

(declare-fun m!1114333 () Bool)

(assert (=> b!1208992 m!1114333))

(declare-fun m!1114335 () Bool)

(assert (=> start!100982 m!1114335))

(declare-fun m!1114337 () Bool)

(assert (=> start!100982 m!1114337))

(declare-fun m!1114339 () Bool)

(assert (=> b!1209014 m!1114339))

(declare-fun m!1114341 () Bool)

(assert (=> b!1209014 m!1114341))

(declare-fun m!1114343 () Bool)

(assert (=> b!1208998 m!1114343))

(declare-fun m!1114345 () Bool)

(assert (=> b!1209013 m!1114345))

(declare-fun m!1114347 () Bool)

(assert (=> b!1209000 m!1114347))

(declare-fun m!1114349 () Bool)

(assert (=> b!1209007 m!1114349))

(declare-fun m!1114351 () Bool)

(assert (=> b!1209002 m!1114351))

(declare-fun m!1114353 () Bool)

(assert (=> b!1209002 m!1114353))

(assert (=> bm!59263 m!1114341))

(declare-fun m!1114355 () Bool)

(assert (=> b!1208990 m!1114355))

(declare-fun m!1114357 () Bool)

(assert (=> b!1208990 m!1114357))

(declare-fun m!1114359 () Bool)

(assert (=> b!1209018 m!1114359))

(declare-fun m!1114361 () Bool)

(assert (=> b!1208994 m!1114361))

(declare-fun m!1114363 () Bool)

(assert (=> b!1208994 m!1114363))

(assert (=> b!1208994 m!1114363))

(declare-fun m!1114365 () Bool)

(assert (=> b!1208994 m!1114365))

(assert (=> b!1209020 m!1114347))

(declare-fun m!1114367 () Bool)

(assert (=> b!1209003 m!1114367))

(check-sat (not b_next!25987) (not bm!59259) (not b!1209010) (not b!1209002) (not b!1209018) (not bm!59264) (not b!1208992) (not b!1209003) (not b!1209007) (not b!1208997) (not b!1209009) (not b!1209020) b_and!43031 (not start!100982) (not b!1209005) (not bm!59261) (not b!1209008) (not b!1208994) (not b!1209016) (not b!1209014) (not b!1208990) (not bm!59262) (not b!1209000) (not b!1208996) (not bm!59263) (not b_lambda!21561) tp_is_empty!30691 (not b!1208998) (not mapNonEmpty!47905))
(check-sat b_and!43031 (not b_next!25987))
