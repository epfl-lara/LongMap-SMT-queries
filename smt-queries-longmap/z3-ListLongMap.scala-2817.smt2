; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40798 () Bool)

(assert start!40798)

(declare-fun b_free!10801 () Bool)

(declare-fun b_next!10801 () Bool)

(assert (=> start!40798 (= b_free!10801 (not b_next!10801))))

(declare-fun tp!38226 () Bool)

(declare-fun b_and!18899 () Bool)

(assert (=> start!40798 (= tp!38226 b_and!18899)))

(declare-fun b!452941 () Bool)

(declare-fun res!269879 () Bool)

(declare-fun e!265135 () Bool)

(assert (=> b!452941 (=> (not res!269879) (not e!265135))))

(declare-datatypes ((array!28074 0))(
  ( (array!28075 (arr!13481 (Array (_ BitVec 32) (_ BitVec 64))) (size!13833 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28074)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28074 (_ BitVec 32)) Bool)

(assert (=> b!452941 (= res!269879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!269882 () Bool)

(assert (=> start!40798 (=> (not res!269882) (not e!265135))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40798 (= res!269882 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13833 _keys!709))))))

(assert (=> start!40798 e!265135))

(declare-fun tp_is_empty!12139 () Bool)

(assert (=> start!40798 tp_is_empty!12139))

(assert (=> start!40798 tp!38226))

(assert (=> start!40798 true))

(declare-datatypes ((V!17291 0))(
  ( (V!17292 (val!6114 Int)) )
))
(declare-datatypes ((ValueCell!5726 0))(
  ( (ValueCellFull!5726 (v!8374 V!17291)) (EmptyCell!5726) )
))
(declare-datatypes ((array!28076 0))(
  ( (array!28077 (arr!13482 (Array (_ BitVec 32) ValueCell!5726)) (size!13834 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28076)

(declare-fun e!265132 () Bool)

(declare-fun array_inv!9842 (array!28076) Bool)

(assert (=> start!40798 (and (array_inv!9842 _values!549) e!265132)))

(declare-fun array_inv!9843 (array!28074) Bool)

(assert (=> start!40798 (array_inv!9843 _keys!709)))

(declare-datatypes ((tuple2!7956 0))(
  ( (tuple2!7957 (_1!3989 (_ BitVec 64)) (_2!3989 V!17291)) )
))
(declare-datatypes ((List!8023 0))(
  ( (Nil!8020) (Cons!8019 (h!8875 tuple2!7956) (t!13839 List!8023)) )
))
(declare-datatypes ((ListLongMap!6871 0))(
  ( (ListLongMap!6872 (toList!3451 List!8023)) )
))
(declare-fun lt!205565 () ListLongMap!6871)

(declare-fun lt!205572 () ListLongMap!6871)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!265130 () Bool)

(declare-fun b!452942 () Bool)

(declare-fun v!412 () V!17291)

(declare-fun +!1575 (ListLongMap!6871 tuple2!7956) ListLongMap!6871)

(assert (=> b!452942 (= e!265130 (= lt!205565 (+!1575 lt!205572 (tuple2!7957 k0!794 v!412))))))

(declare-fun lt!205567 () ListLongMap!6871)

(declare-fun lt!205564 () tuple2!7956)

(declare-fun lt!205569 () V!17291)

(assert (=> b!452942 (= (+!1575 lt!205567 lt!205564) (+!1575 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)) lt!205564))))

(declare-fun lt!205574 () V!17291)

(assert (=> b!452942 (= lt!205564 (tuple2!7957 k0!794 lt!205574))))

(declare-datatypes ((Unit!13229 0))(
  ( (Unit!13230) )
))
(declare-fun lt!205568 () Unit!13229)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!89 (ListLongMap!6871 (_ BitVec 64) V!17291 V!17291) Unit!13229)

(assert (=> b!452942 (= lt!205568 (addSameAsAddTwiceSameKeyDiffValues!89 lt!205567 k0!794 lt!205569 lt!205574))))

(declare-fun lt!205570 () V!17291)

(declare-fun get!6656 (ValueCell!5726 V!17291) V!17291)

(assert (=> b!452942 (= lt!205569 (get!6656 (select (arr!13482 _values!549) from!863) lt!205570))))

(declare-fun lt!205566 () array!28074)

(assert (=> b!452942 (= lt!205565 (+!1575 lt!205567 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452942 (= lt!205574 (get!6656 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205570))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!871 (Int (_ BitVec 64)) V!17291)

(assert (=> b!452942 (= lt!205570 (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!17291)

(declare-fun zeroValue!515 () V!17291)

(declare-fun lt!205573 () array!28076)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1680 (array!28074 array!28076 (_ BitVec 32) (_ BitVec 32) V!17291 V!17291 (_ BitVec 32) Int) ListLongMap!6871)

(assert (=> b!452942 (= lt!205567 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452943 () Bool)

(declare-fun e!265134 () Bool)

(assert (=> b!452943 (= e!265134 tp_is_empty!12139)))

(declare-fun b!452944 () Bool)

(declare-fun e!265133 () Bool)

(declare-fun call!30002 () ListLongMap!6871)

(declare-fun call!30003 () ListLongMap!6871)

(assert (=> b!452944 (= e!265133 (= call!30002 call!30003))))

(declare-fun b!452945 () Bool)

(declare-fun e!265128 () Bool)

(assert (=> b!452945 (= e!265128 (not e!265130))))

(declare-fun res!269884 () Bool)

(assert (=> b!452945 (=> res!269884 e!265130)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452945 (= res!269884 (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!452945 e!265133))

(declare-fun c!56123 () Bool)

(assert (=> b!452945 (= c!56123 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205571 () Unit!13229)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!735 (array!28074 array!28076 (_ BitVec 32) (_ BitVec 32) V!17291 V!17291 (_ BitVec 32) (_ BitVec 64) V!17291 (_ BitVec 32) Int) Unit!13229)

(assert (=> b!452945 (= lt!205571 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!735 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19845 () Bool)

(declare-fun mapRes!19845 () Bool)

(assert (=> mapIsEmpty!19845 mapRes!19845))

(declare-fun b!452946 () Bool)

(declare-fun res!269883 () Bool)

(assert (=> b!452946 (=> (not res!269883) (not e!265135))))

(assert (=> b!452946 (= res!269883 (validKeyInArray!0 k0!794))))

(declare-fun b!452947 () Bool)

(declare-fun res!269886 () Bool)

(assert (=> b!452947 (=> (not res!269886) (not e!265135))))

(assert (=> b!452947 (= res!269886 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13833 _keys!709))))))

(declare-fun b!452948 () Bool)

(declare-fun e!265131 () Bool)

(assert (=> b!452948 (= e!265131 tp_is_empty!12139)))

(declare-fun mapNonEmpty!19845 () Bool)

(declare-fun tp!38225 () Bool)

(assert (=> mapNonEmpty!19845 (= mapRes!19845 (and tp!38225 e!265134))))

(declare-fun mapValue!19845 () ValueCell!5726)

(declare-fun mapKey!19845 () (_ BitVec 32))

(declare-fun mapRest!19845 () (Array (_ BitVec 32) ValueCell!5726))

(assert (=> mapNonEmpty!19845 (= (arr!13482 _values!549) (store mapRest!19845 mapKey!19845 mapValue!19845))))

(declare-fun b!452949 () Bool)

(assert (=> b!452949 (= e!265132 (and e!265131 mapRes!19845))))

(declare-fun condMapEmpty!19845 () Bool)

(declare-fun mapDefault!19845 () ValueCell!5726)

(assert (=> b!452949 (= condMapEmpty!19845 (= (arr!13482 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5726)) mapDefault!19845)))))

(declare-fun b!452950 () Bool)

(declare-fun res!269888 () Bool)

(declare-fun e!265129 () Bool)

(assert (=> b!452950 (=> (not res!269888) (not e!265129))))

(declare-datatypes ((List!8024 0))(
  ( (Nil!8021) (Cons!8020 (h!8876 (_ BitVec 64)) (t!13840 List!8024)) )
))
(declare-fun arrayNoDuplicates!0 (array!28074 (_ BitVec 32) List!8024) Bool)

(assert (=> b!452950 (= res!269888 (arrayNoDuplicates!0 lt!205566 #b00000000000000000000000000000000 Nil!8021))))

(declare-fun b!452951 () Bool)

(declare-fun res!269878 () Bool)

(assert (=> b!452951 (=> (not res!269878) (not e!265135))))

(assert (=> b!452951 (= res!269878 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8021))))

(declare-fun bm!29999 () Bool)

(assert (=> bm!29999 (= call!30002 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 _keys!709 lt!205566) (ite c!56123 _values!549 lt!205573) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452952 () Bool)

(declare-fun res!269877 () Bool)

(assert (=> b!452952 (=> (not res!269877) (not e!265135))))

(assert (=> b!452952 (= res!269877 (or (= (select (arr!13481 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13481 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452953 () Bool)

(assert (=> b!452953 (= e!265129 e!265128)))

(declare-fun res!269887 () Bool)

(assert (=> b!452953 (=> (not res!269887) (not e!265128))))

(assert (=> b!452953 (= res!269887 (= from!863 i!563))))

(assert (=> b!452953 (= lt!205565 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452953 (= lt!205573 (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549)))))

(assert (=> b!452953 (= lt!205572 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452954 () Bool)

(declare-fun res!269880 () Bool)

(assert (=> b!452954 (=> (not res!269880) (not e!265135))))

(declare-fun arrayContainsKey!0 (array!28074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452954 (= res!269880 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452955 () Bool)

(declare-fun res!269890 () Bool)

(assert (=> b!452955 (=> (not res!269890) (not e!265135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452955 (= res!269890 (validMask!0 mask!1025))))

(declare-fun b!452956 () Bool)

(assert (=> b!452956 (= e!265133 (= call!30003 (+!1575 call!30002 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!452957 () Bool)

(assert (=> b!452957 (= e!265135 e!265129)))

(declare-fun res!269881 () Bool)

(assert (=> b!452957 (=> (not res!269881) (not e!265129))))

(assert (=> b!452957 (= res!269881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205566 mask!1025))))

(assert (=> b!452957 (= lt!205566 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)))))

(declare-fun bm!30000 () Bool)

(assert (=> bm!30000 (= call!30003 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 lt!205566 _keys!709) (ite c!56123 lt!205573 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452958 () Bool)

(declare-fun res!269885 () Bool)

(assert (=> b!452958 (=> (not res!269885) (not e!265129))))

(assert (=> b!452958 (= res!269885 (bvsle from!863 i!563))))

(declare-fun b!452959 () Bool)

(declare-fun res!269889 () Bool)

(assert (=> b!452959 (=> (not res!269889) (not e!265135))))

(assert (=> b!452959 (= res!269889 (and (= (size!13834 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13833 _keys!709) (size!13834 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40798 res!269882) b!452955))

(assert (= (and b!452955 res!269890) b!452959))

(assert (= (and b!452959 res!269889) b!452941))

(assert (= (and b!452941 res!269879) b!452951))

(assert (= (and b!452951 res!269878) b!452947))

(assert (= (and b!452947 res!269886) b!452946))

(assert (= (and b!452946 res!269883) b!452952))

(assert (= (and b!452952 res!269877) b!452954))

(assert (= (and b!452954 res!269880) b!452957))

(assert (= (and b!452957 res!269881) b!452950))

(assert (= (and b!452950 res!269888) b!452958))

(assert (= (and b!452958 res!269885) b!452953))

(assert (= (and b!452953 res!269887) b!452945))

(assert (= (and b!452945 c!56123) b!452956))

(assert (= (and b!452945 (not c!56123)) b!452944))

(assert (= (or b!452956 b!452944) bm!30000))

(assert (= (or b!452956 b!452944) bm!29999))

(assert (= (and b!452945 (not res!269884)) b!452942))

(assert (= (and b!452949 condMapEmpty!19845) mapIsEmpty!19845))

(assert (= (and b!452949 (not condMapEmpty!19845)) mapNonEmpty!19845))

(get-info :version)

(assert (= (and mapNonEmpty!19845 ((_ is ValueCellFull!5726) mapValue!19845)) b!452943))

(assert (= (and b!452949 ((_ is ValueCellFull!5726) mapDefault!19845)) b!452948))

(assert (= start!40798 b!452949))

(declare-fun b_lambda!9593 () Bool)

(assert (=> (not b_lambda!9593) (not b!452942)))

(declare-fun t!13838 () Bool)

(declare-fun tb!3773 () Bool)

(assert (=> (and start!40798 (= defaultEntry!557 defaultEntry!557) t!13838) tb!3773))

(declare-fun result!7091 () Bool)

(assert (=> tb!3773 (= result!7091 tp_is_empty!12139)))

(assert (=> b!452942 t!13838))

(declare-fun b_and!18901 () Bool)

(assert (= b_and!18899 (and (=> t!13838 result!7091) b_and!18901)))

(declare-fun m!436969 () Bool)

(assert (=> b!452954 m!436969))

(declare-fun m!436971 () Bool)

(assert (=> b!452941 m!436971))

(declare-fun m!436973 () Bool)

(assert (=> start!40798 m!436973))

(declare-fun m!436975 () Bool)

(assert (=> start!40798 m!436975))

(declare-fun m!436977 () Bool)

(assert (=> b!452956 m!436977))

(declare-fun m!436979 () Bool)

(assert (=> b!452955 m!436979))

(declare-fun m!436981 () Bool)

(assert (=> mapNonEmpty!19845 m!436981))

(declare-fun m!436983 () Bool)

(assert (=> bm!30000 m!436983))

(declare-fun m!436985 () Bool)

(assert (=> b!452951 m!436985))

(declare-fun m!436987 () Bool)

(assert (=> b!452953 m!436987))

(declare-fun m!436989 () Bool)

(assert (=> b!452953 m!436989))

(declare-fun m!436991 () Bool)

(assert (=> b!452953 m!436991))

(declare-fun m!436993 () Bool)

(assert (=> b!452945 m!436993))

(assert (=> b!452945 m!436993))

(declare-fun m!436995 () Bool)

(assert (=> b!452945 m!436995))

(declare-fun m!436997 () Bool)

(assert (=> b!452945 m!436997))

(declare-fun m!436999 () Bool)

(assert (=> b!452952 m!436999))

(declare-fun m!437001 () Bool)

(assert (=> bm!29999 m!437001))

(declare-fun m!437003 () Bool)

(assert (=> b!452957 m!437003))

(declare-fun m!437005 () Bool)

(assert (=> b!452957 m!437005))

(declare-fun m!437007 () Bool)

(assert (=> b!452950 m!437007))

(declare-fun m!437009 () Bool)

(assert (=> b!452946 m!437009))

(declare-fun m!437011 () Bool)

(assert (=> b!452942 m!437011))

(declare-fun m!437013 () Bool)

(assert (=> b!452942 m!437013))

(declare-fun m!437015 () Bool)

(assert (=> b!452942 m!437015))

(declare-fun m!437017 () Bool)

(assert (=> b!452942 m!437017))

(declare-fun m!437019 () Bool)

(assert (=> b!452942 m!437019))

(assert (=> b!452942 m!436989))

(declare-fun m!437021 () Bool)

(assert (=> b!452942 m!437021))

(declare-fun m!437023 () Bool)

(assert (=> b!452942 m!437023))

(assert (=> b!452942 m!437013))

(declare-fun m!437025 () Bool)

(assert (=> b!452942 m!437025))

(assert (=> b!452942 m!437025))

(declare-fun m!437027 () Bool)

(assert (=> b!452942 m!437027))

(assert (=> b!452942 m!437023))

(declare-fun m!437029 () Bool)

(assert (=> b!452942 m!437029))

(declare-fun m!437031 () Bool)

(assert (=> b!452942 m!437031))

(declare-fun m!437033 () Bool)

(assert (=> b!452942 m!437033))

(declare-fun m!437035 () Bool)

(assert (=> b!452942 m!437035))

(check-sat (not b!452945) (not b_next!10801) (not b!452956) (not b!452950) (not b!452946) (not b!452951) (not b_lambda!9593) (not bm!29999) (not b!452955) (not mapNonEmpty!19845) (not start!40798) (not b!452954) (not b!452957) b_and!18901 (not b!452942) (not b!452941) (not bm!30000) tp_is_empty!12139 (not b!452953))
(check-sat b_and!18901 (not b_next!10801))
(get-model)

(declare-fun b_lambda!9599 () Bool)

(assert (= b_lambda!9593 (or (and start!40798 b_free!10801) b_lambda!9599)))

(check-sat (not b!452945) (not b_next!10801) (not b!452956) (not b!452950) (not b!452951) (not bm!29999) (not b!452955) (not mapNonEmpty!19845) (not start!40798) (not b!452954) (not b!452957) (not b_lambda!9599) (not b!452946) b_and!18901 (not b!452942) (not b!452941) (not bm!30000) tp_is_empty!12139 (not b!452953))
(check-sat b_and!18901 (not b_next!10801))
(get-model)

(declare-fun b!453090 () Bool)

(declare-fun e!265202 () Bool)

(declare-fun e!265200 () Bool)

(assert (=> b!453090 (= e!265202 e!265200)))

(declare-fun res!269981 () Bool)

(assert (=> b!453090 (=> (not res!269981) (not e!265200))))

(declare-fun e!265201 () Bool)

(assert (=> b!453090 (= res!269981 (not e!265201))))

(declare-fun res!269983 () Bool)

(assert (=> b!453090 (=> (not res!269983) (not e!265201))))

(assert (=> b!453090 (= res!269983 (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453091 () Bool)

(declare-fun e!265199 () Bool)

(declare-fun call!30018 () Bool)

(assert (=> b!453091 (= e!265199 call!30018)))

(declare-fun d!74349 () Bool)

(declare-fun res!269982 () Bool)

(assert (=> d!74349 (=> res!269982 e!265202)))

(assert (=> d!74349 (= res!269982 (bvsge #b00000000000000000000000000000000 (size!13833 _keys!709)))))

(assert (=> d!74349 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8021) e!265202)))

(declare-fun b!453092 () Bool)

(assert (=> b!453092 (= e!265200 e!265199)))

(declare-fun c!56132 () Bool)

(assert (=> b!453092 (= c!56132 (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453093 () Bool)

(assert (=> b!453093 (= e!265199 call!30018)))

(declare-fun b!453094 () Bool)

(declare-fun contains!2477 (List!8024 (_ BitVec 64)) Bool)

(assert (=> b!453094 (= e!265201 (contains!2477 Nil!8021 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30015 () Bool)

(assert (=> bm!30015 (= call!30018 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56132 (Cons!8020 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8021) Nil!8021)))))

(assert (= (and d!74349 (not res!269982)) b!453090))

(assert (= (and b!453090 res!269983) b!453094))

(assert (= (and b!453090 res!269981) b!453092))

(assert (= (and b!453092 c!56132) b!453091))

(assert (= (and b!453092 (not c!56132)) b!453093))

(assert (= (or b!453091 b!453093) bm!30015))

(declare-fun m!437173 () Bool)

(assert (=> b!453090 m!437173))

(assert (=> b!453090 m!437173))

(declare-fun m!437175 () Bool)

(assert (=> b!453090 m!437175))

(assert (=> b!453092 m!437173))

(assert (=> b!453092 m!437173))

(assert (=> b!453092 m!437175))

(assert (=> b!453094 m!437173))

(assert (=> b!453094 m!437173))

(declare-fun m!437177 () Bool)

(assert (=> b!453094 m!437177))

(assert (=> bm!30015 m!437173))

(declare-fun m!437179 () Bool)

(assert (=> bm!30015 m!437179))

(assert (=> b!452951 d!74349))

(declare-fun b!453119 () Bool)

(declare-fun e!265220 () ListLongMap!6871)

(declare-fun e!265222 () ListLongMap!6871)

(assert (=> b!453119 (= e!265220 e!265222)))

(declare-fun c!56142 () Bool)

(assert (=> b!453119 (= c!56142 (validKeyInArray!0 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun call!30021 () ListLongMap!6871)

(declare-fun bm!30018 () Bool)

(assert (=> bm!30018 (= call!30021 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 _keys!709 lt!205566) (ite c!56123 _values!549 lt!205573) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453120 () Bool)

(declare-fun res!269994 () Bool)

(declare-fun e!265221 () Bool)

(assert (=> b!453120 (=> (not res!269994) (not e!265221))))

(declare-fun lt!205657 () ListLongMap!6871)

(declare-fun contains!2478 (ListLongMap!6871 (_ BitVec 64)) Bool)

(assert (=> b!453120 (= res!269994 (not (contains!2478 lt!205657 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453121 () Bool)

(assert (=> b!453121 (= e!265220 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453123 () Bool)

(declare-fun e!265219 () Bool)

(declare-fun e!265218 () Bool)

(assert (=> b!453123 (= e!265219 e!265218)))

(declare-fun c!56141 () Bool)

(assert (=> b!453123 (= c!56141 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(declare-fun b!453124 () Bool)

(declare-fun e!265223 () Bool)

(assert (=> b!453124 (= e!265219 e!265223)))

(assert (=> b!453124 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(declare-fun res!269993 () Bool)

(assert (=> b!453124 (= res!269993 (contains!2478 lt!205657 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453124 (=> (not res!269993) (not e!265223))))

(declare-fun b!453125 () Bool)

(declare-fun lt!205658 () Unit!13229)

(declare-fun lt!205659 () Unit!13229)

(assert (=> b!453125 (= lt!205658 lt!205659)))

(declare-fun lt!205656 () V!17291)

(declare-fun lt!205661 () (_ BitVec 64))

(declare-fun lt!205660 () (_ BitVec 64))

(declare-fun lt!205655 () ListLongMap!6871)

(assert (=> b!453125 (not (contains!2478 (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656)) lt!205660))))

(declare-fun addStillNotContains!148 (ListLongMap!6871 (_ BitVec 64) V!17291 (_ BitVec 64)) Unit!13229)

(assert (=> b!453125 (= lt!205659 (addStillNotContains!148 lt!205655 lt!205661 lt!205656 lt!205660))))

(assert (=> b!453125 (= lt!205660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453125 (= lt!205656 (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453125 (= lt!205661 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!453125 (= lt!205655 call!30021)))

(assert (=> b!453125 (= e!265222 (+!1575 call!30021 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!265217 () Bool)

(declare-fun b!453126 () Bool)

(assert (=> b!453126 (= e!265217 (validKeyInArray!0 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453126 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453127 () Bool)

(assert (=> b!453127 (= e!265221 e!265219)))

(declare-fun c!56143 () Bool)

(assert (=> b!453127 (= c!56143 e!265217)))

(declare-fun res!269992 () Bool)

(assert (=> b!453127 (=> (not res!269992) (not e!265217))))

(assert (=> b!453127 (= res!269992 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(declare-fun b!453128 () Bool)

(declare-fun isEmpty!565 (ListLongMap!6871) Bool)

(assert (=> b!453128 (= e!265218 (isEmpty!565 lt!205657))))

(declare-fun b!453129 () Bool)

(assert (=> b!453129 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(assert (=> b!453129 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56123 _values!549 lt!205573))))))

(declare-fun apply!313 (ListLongMap!6871 (_ BitVec 64)) V!17291)

(assert (=> b!453129 (= e!265223 (= (apply!313 lt!205657 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453130 () Bool)

(assert (=> b!453130 (= e!265222 call!30021)))

(declare-fun d!74351 () Bool)

(assert (=> d!74351 e!265221))

(declare-fun res!269995 () Bool)

(assert (=> d!74351 (=> (not res!269995) (not e!265221))))

(assert (=> d!74351 (= res!269995 (not (contains!2478 lt!205657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74351 (= lt!205657 e!265220)))

(declare-fun c!56144 () Bool)

(assert (=> d!74351 (= c!56144 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(assert (=> d!74351 (validMask!0 mask!1025)))

(assert (=> d!74351 (= (getCurrentListMapNoExtraKeys!1680 (ite c!56123 _keys!709 lt!205566) (ite c!56123 _values!549 lt!205573) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205657)))

(declare-fun b!453122 () Bool)

(assert (=> b!453122 (= e!265218 (= lt!205657 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 _keys!709 lt!205566) (ite c!56123 _values!549 lt!205573) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74351 c!56144) b!453121))

(assert (= (and d!74351 (not c!56144)) b!453119))

(assert (= (and b!453119 c!56142) b!453125))

(assert (= (and b!453119 (not c!56142)) b!453130))

(assert (= (or b!453125 b!453130) bm!30018))

(assert (= (and d!74351 res!269995) b!453120))

(assert (= (and b!453120 res!269994) b!453127))

(assert (= (and b!453127 res!269992) b!453126))

(assert (= (and b!453127 c!56143) b!453124))

(assert (= (and b!453127 (not c!56143)) b!453123))

(assert (= (and b!453124 res!269993) b!453129))

(assert (= (and b!453123 c!56141) b!453122))

(assert (= (and b!453123 (not c!56141)) b!453128))

(declare-fun b_lambda!9601 () Bool)

(assert (=> (not b_lambda!9601) (not b!453125)))

(assert (=> b!453125 t!13838))

(declare-fun b_and!18911 () Bool)

(assert (= b_and!18901 (and (=> t!13838 result!7091) b_and!18911)))

(declare-fun b_lambda!9603 () Bool)

(assert (=> (not b_lambda!9603) (not b!453129)))

(assert (=> b!453129 t!13838))

(declare-fun b_and!18913 () Bool)

(assert (= b_and!18911 (and (=> t!13838 result!7091) b_and!18913)))

(declare-fun m!437181 () Bool)

(assert (=> bm!30018 m!437181))

(declare-fun m!437183 () Bool)

(assert (=> b!453128 m!437183))

(declare-fun m!437185 () Bool)

(assert (=> b!453124 m!437185))

(assert (=> b!453124 m!437185))

(declare-fun m!437187 () Bool)

(assert (=> b!453124 m!437187))

(declare-fun m!437189 () Bool)

(assert (=> b!453120 m!437189))

(assert (=> b!453122 m!437181))

(declare-fun m!437191 () Bool)

(assert (=> b!453129 m!437191))

(assert (=> b!453129 m!437019))

(declare-fun m!437193 () Bool)

(assert (=> b!453129 m!437193))

(assert (=> b!453129 m!437185))

(declare-fun m!437195 () Bool)

(assert (=> b!453129 m!437195))

(assert (=> b!453129 m!437191))

(assert (=> b!453129 m!437019))

(assert (=> b!453129 m!437185))

(assert (=> b!453125 m!437191))

(assert (=> b!453125 m!437019))

(assert (=> b!453125 m!437193))

(declare-fun m!437197 () Bool)

(assert (=> b!453125 m!437197))

(assert (=> b!453125 m!437191))

(assert (=> b!453125 m!437019))

(declare-fun m!437199 () Bool)

(assert (=> b!453125 m!437199))

(assert (=> b!453125 m!437197))

(declare-fun m!437201 () Bool)

(assert (=> b!453125 m!437201))

(assert (=> b!453125 m!437185))

(declare-fun m!437203 () Bool)

(assert (=> b!453125 m!437203))

(declare-fun m!437205 () Bool)

(assert (=> d!74351 m!437205))

(assert (=> d!74351 m!436979))

(assert (=> b!453119 m!437185))

(assert (=> b!453119 m!437185))

(declare-fun m!437207 () Bool)

(assert (=> b!453119 m!437207))

(assert (=> b!453126 m!437185))

(assert (=> b!453126 m!437185))

(assert (=> b!453126 m!437207))

(assert (=> bm!29999 d!74351))

(declare-fun d!74353 () Bool)

(declare-fun res!270000 () Bool)

(declare-fun e!265231 () Bool)

(assert (=> d!74353 (=> res!270000 e!265231)))

(assert (=> d!74353 (= res!270000 (bvsge #b00000000000000000000000000000000 (size!13833 _keys!709)))))

(assert (=> d!74353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!265231)))

(declare-fun bm!30021 () Bool)

(declare-fun call!30024 () Bool)

(assert (=> bm!30021 (= call!30024 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!453139 () Bool)

(declare-fun e!265230 () Bool)

(assert (=> b!453139 (= e!265231 e!265230)))

(declare-fun c!56147 () Bool)

(assert (=> b!453139 (= c!56147 (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453140 () Bool)

(declare-fun e!265232 () Bool)

(assert (=> b!453140 (= e!265230 e!265232)))

(declare-fun lt!205670 () (_ BitVec 64))

(assert (=> b!453140 (= lt!205670 (select (arr!13481 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!205669 () Unit!13229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28074 (_ BitVec 64) (_ BitVec 32)) Unit!13229)

(assert (=> b!453140 (= lt!205669 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205670 #b00000000000000000000000000000000))))

(assert (=> b!453140 (arrayContainsKey!0 _keys!709 lt!205670 #b00000000000000000000000000000000)))

(declare-fun lt!205668 () Unit!13229)

(assert (=> b!453140 (= lt!205668 lt!205669)))

(declare-fun res!270001 () Bool)

(declare-datatypes ((SeekEntryResult!3481 0))(
  ( (MissingZero!3481 (index!16103 (_ BitVec 32))) (Found!3481 (index!16104 (_ BitVec 32))) (Intermediate!3481 (undefined!4293 Bool) (index!16105 (_ BitVec 32)) (x!42407 (_ BitVec 32))) (Undefined!3481) (MissingVacant!3481 (index!16106 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28074 (_ BitVec 32)) SeekEntryResult!3481)

(assert (=> b!453140 (= res!270001 (= (seekEntryOrOpen!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3481 #b00000000000000000000000000000000)))))

(assert (=> b!453140 (=> (not res!270001) (not e!265232))))

(declare-fun b!453141 () Bool)

(assert (=> b!453141 (= e!265230 call!30024)))

(declare-fun b!453142 () Bool)

(assert (=> b!453142 (= e!265232 call!30024)))

(assert (= (and d!74353 (not res!270000)) b!453139))

(assert (= (and b!453139 c!56147) b!453140))

(assert (= (and b!453139 (not c!56147)) b!453141))

(assert (= (and b!453140 res!270001) b!453142))

(assert (= (or b!453142 b!453141) bm!30021))

(declare-fun m!437209 () Bool)

(assert (=> bm!30021 m!437209))

(assert (=> b!453139 m!437173))

(assert (=> b!453139 m!437173))

(assert (=> b!453139 m!437175))

(assert (=> b!453140 m!437173))

(declare-fun m!437211 () Bool)

(assert (=> b!453140 m!437211))

(declare-fun m!437213 () Bool)

(assert (=> b!453140 m!437213))

(assert (=> b!453140 m!437173))

(declare-fun m!437215 () Bool)

(assert (=> b!453140 m!437215))

(assert (=> b!452941 d!74353))

(declare-fun b!453143 () Bool)

(declare-fun e!265236 () Bool)

(declare-fun e!265234 () Bool)

(assert (=> b!453143 (= e!265236 e!265234)))

(declare-fun res!270002 () Bool)

(assert (=> b!453143 (=> (not res!270002) (not e!265234))))

(declare-fun e!265235 () Bool)

(assert (=> b!453143 (= res!270002 (not e!265235))))

(declare-fun res!270004 () Bool)

(assert (=> b!453143 (=> (not res!270004) (not e!265235))))

(assert (=> b!453143 (= res!270004 (validKeyInArray!0 (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(declare-fun b!453144 () Bool)

(declare-fun e!265233 () Bool)

(declare-fun call!30025 () Bool)

(assert (=> b!453144 (= e!265233 call!30025)))

(declare-fun d!74355 () Bool)

(declare-fun res!270003 () Bool)

(assert (=> d!74355 (=> res!270003 e!265236)))

(assert (=> d!74355 (= res!270003 (bvsge #b00000000000000000000000000000000 (size!13833 lt!205566)))))

(assert (=> d!74355 (= (arrayNoDuplicates!0 lt!205566 #b00000000000000000000000000000000 Nil!8021) e!265236)))

(declare-fun b!453145 () Bool)

(assert (=> b!453145 (= e!265234 e!265233)))

(declare-fun c!56148 () Bool)

(assert (=> b!453145 (= c!56148 (validKeyInArray!0 (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(declare-fun b!453146 () Bool)

(assert (=> b!453146 (= e!265233 call!30025)))

(declare-fun b!453147 () Bool)

(assert (=> b!453147 (= e!265235 (contains!2477 Nil!8021 (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(declare-fun bm!30022 () Bool)

(assert (=> bm!30022 (= call!30025 (arrayNoDuplicates!0 lt!205566 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56148 (Cons!8020 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) Nil!8021) Nil!8021)))))

(assert (= (and d!74355 (not res!270003)) b!453143))

(assert (= (and b!453143 res!270004) b!453147))

(assert (= (and b!453143 res!270002) b!453145))

(assert (= (and b!453145 c!56148) b!453144))

(assert (= (and b!453145 (not c!56148)) b!453146))

(assert (= (or b!453144 b!453146) bm!30022))

(declare-fun m!437217 () Bool)

(assert (=> b!453143 m!437217))

(assert (=> b!453143 m!437217))

(declare-fun m!437219 () Bool)

(assert (=> b!453143 m!437219))

(assert (=> b!453145 m!437217))

(assert (=> b!453145 m!437217))

(assert (=> b!453145 m!437219))

(assert (=> b!453147 m!437217))

(assert (=> b!453147 m!437217))

(declare-fun m!437221 () Bool)

(assert (=> b!453147 m!437221))

(assert (=> bm!30022 m!437217))

(declare-fun m!437223 () Bool)

(assert (=> bm!30022 m!437223))

(assert (=> b!452950 d!74355))

(declare-fun d!74357 () Bool)

(declare-fun e!265239 () Bool)

(assert (=> d!74357 e!265239))

(declare-fun res!270009 () Bool)

(assert (=> d!74357 (=> (not res!270009) (not e!265239))))

(declare-fun lt!205680 () ListLongMap!6871)

(assert (=> d!74357 (= res!270009 (contains!2478 lt!205680 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun lt!205679 () List!8023)

(assert (=> d!74357 (= lt!205680 (ListLongMap!6872 lt!205679))))

(declare-fun lt!205681 () Unit!13229)

(declare-fun lt!205682 () Unit!13229)

(assert (=> d!74357 (= lt!205681 lt!205682)))

(declare-datatypes ((Option!377 0))(
  ( (Some!376 (v!8380 V!17291)) (None!375) )
))
(declare-fun getValueByKey!371 (List!8023 (_ BitVec 64)) Option!377)

(assert (=> d!74357 (= (getValueByKey!371 lt!205679 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun lemmaContainsTupThenGetReturnValue!193 (List!8023 (_ BitVec 64) V!17291) Unit!13229)

(assert (=> d!74357 (= lt!205682 (lemmaContainsTupThenGetReturnValue!193 lt!205679 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun insertStrictlySorted!196 (List!8023 (_ BitVec 64) V!17291) List!8023)

(assert (=> d!74357 (= lt!205679 (insertStrictlySorted!196 (toList!3451 lt!205567) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(assert (=> d!74357 (= (+!1575 lt!205567 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) lt!205680)))

(declare-fun b!453152 () Bool)

(declare-fun res!270010 () Bool)

(assert (=> b!453152 (=> (not res!270010) (not e!265239))))

(assert (=> b!453152 (= res!270010 (= (getValueByKey!371 (toList!3451 lt!205680) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(declare-fun b!453153 () Bool)

(declare-fun contains!2479 (List!8023 tuple2!7956) Bool)

(assert (=> b!453153 (= e!265239 (contains!2479 (toList!3451 lt!205680) (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))

(assert (= (and d!74357 res!270009) b!453152))

(assert (= (and b!453152 res!270010) b!453153))

(declare-fun m!437225 () Bool)

(assert (=> d!74357 m!437225))

(declare-fun m!437227 () Bool)

(assert (=> d!74357 m!437227))

(declare-fun m!437229 () Bool)

(assert (=> d!74357 m!437229))

(declare-fun m!437231 () Bool)

(assert (=> d!74357 m!437231))

(declare-fun m!437233 () Bool)

(assert (=> b!453152 m!437233))

(declare-fun m!437235 () Bool)

(assert (=> b!453153 m!437235))

(assert (=> b!452942 d!74357))

(declare-fun d!74359 () Bool)

(declare-fun c!56151 () Bool)

(assert (=> d!74359 (= c!56151 ((_ is ValueCellFull!5726) (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863)))))

(declare-fun e!265242 () V!17291)

(assert (=> d!74359 (= (get!6656 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205570) e!265242)))

(declare-fun b!453158 () Bool)

(declare-fun get!6659 (ValueCell!5726 V!17291) V!17291)

(assert (=> b!453158 (= e!265242 (get!6659 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205570))))

(declare-fun b!453159 () Bool)

(declare-fun get!6660 (ValueCell!5726 V!17291) V!17291)

(assert (=> b!453159 (= e!265242 (get!6660 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205570))))

(assert (= (and d!74359 c!56151) b!453158))

(assert (= (and d!74359 (not c!56151)) b!453159))

(assert (=> b!453158 m!437023))

(declare-fun m!437237 () Bool)

(assert (=> b!453158 m!437237))

(assert (=> b!453159 m!437023))

(declare-fun m!437239 () Bool)

(assert (=> b!453159 m!437239))

(assert (=> b!452942 d!74359))

(declare-fun d!74361 () Bool)

(declare-fun e!265243 () Bool)

(assert (=> d!74361 e!265243))

(declare-fun res!270011 () Bool)

(assert (=> d!74361 (=> (not res!270011) (not e!265243))))

(declare-fun lt!205684 () ListLongMap!6871)

(assert (=> d!74361 (= res!270011 (contains!2478 lt!205684 (_1!3989 lt!205564)))))

(declare-fun lt!205683 () List!8023)

(assert (=> d!74361 (= lt!205684 (ListLongMap!6872 lt!205683))))

(declare-fun lt!205685 () Unit!13229)

(declare-fun lt!205686 () Unit!13229)

(assert (=> d!74361 (= lt!205685 lt!205686)))

(assert (=> d!74361 (= (getValueByKey!371 lt!205683 (_1!3989 lt!205564)) (Some!376 (_2!3989 lt!205564)))))

(assert (=> d!74361 (= lt!205686 (lemmaContainsTupThenGetReturnValue!193 lt!205683 (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(assert (=> d!74361 (= lt!205683 (insertStrictlySorted!196 (toList!3451 lt!205567) (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(assert (=> d!74361 (= (+!1575 lt!205567 lt!205564) lt!205684)))

(declare-fun b!453160 () Bool)

(declare-fun res!270012 () Bool)

(assert (=> b!453160 (=> (not res!270012) (not e!265243))))

(assert (=> b!453160 (= res!270012 (= (getValueByKey!371 (toList!3451 lt!205684) (_1!3989 lt!205564)) (Some!376 (_2!3989 lt!205564))))))

(declare-fun b!453161 () Bool)

(assert (=> b!453161 (= e!265243 (contains!2479 (toList!3451 lt!205684) lt!205564))))

(assert (= (and d!74361 res!270011) b!453160))

(assert (= (and b!453160 res!270012) b!453161))

(declare-fun m!437241 () Bool)

(assert (=> d!74361 m!437241))

(declare-fun m!437243 () Bool)

(assert (=> d!74361 m!437243))

(declare-fun m!437245 () Bool)

(assert (=> d!74361 m!437245))

(declare-fun m!437247 () Bool)

(assert (=> d!74361 m!437247))

(declare-fun m!437249 () Bool)

(assert (=> b!453160 m!437249))

(declare-fun m!437251 () Bool)

(assert (=> b!453161 m!437251))

(assert (=> b!452942 d!74361))

(declare-fun d!74363 () Bool)

(assert (=> d!74363 (= (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205574)) (+!1575 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)) (tuple2!7957 k0!794 lt!205574)))))

(declare-fun lt!205689 () Unit!13229)

(declare-fun choose!1334 (ListLongMap!6871 (_ BitVec 64) V!17291 V!17291) Unit!13229)

(assert (=> d!74363 (= lt!205689 (choose!1334 lt!205567 k0!794 lt!205569 lt!205574))))

(assert (=> d!74363 (= (addSameAsAddTwiceSameKeyDiffValues!89 lt!205567 k0!794 lt!205569 lt!205574) lt!205689)))

(declare-fun bs!14418 () Bool)

(assert (= bs!14418 d!74363))

(declare-fun m!437253 () Bool)

(assert (=> bs!14418 m!437253))

(assert (=> bs!14418 m!437013))

(assert (=> bs!14418 m!437013))

(declare-fun m!437255 () Bool)

(assert (=> bs!14418 m!437255))

(declare-fun m!437257 () Bool)

(assert (=> bs!14418 m!437257))

(assert (=> b!452942 d!74363))

(declare-fun d!74365 () Bool)

(declare-fun e!265244 () Bool)

(assert (=> d!74365 e!265244))

(declare-fun res!270013 () Bool)

(assert (=> d!74365 (=> (not res!270013) (not e!265244))))

(declare-fun lt!205691 () ListLongMap!6871)

(assert (=> d!74365 (= res!270013 (contains!2478 lt!205691 (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun lt!205690 () List!8023)

(assert (=> d!74365 (= lt!205691 (ListLongMap!6872 lt!205690))))

(declare-fun lt!205692 () Unit!13229)

(declare-fun lt!205693 () Unit!13229)

(assert (=> d!74365 (= lt!205692 lt!205693)))

(assert (=> d!74365 (= (getValueByKey!371 lt!205690 (_1!3989 (tuple2!7957 k0!794 lt!205569))) (Some!376 (_2!3989 (tuple2!7957 k0!794 lt!205569))))))

(assert (=> d!74365 (= lt!205693 (lemmaContainsTupThenGetReturnValue!193 lt!205690 (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569))))))

(assert (=> d!74365 (= lt!205690 (insertStrictlySorted!196 (toList!3451 lt!205567) (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569))))))

(assert (=> d!74365 (= (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)) lt!205691)))

(declare-fun b!453162 () Bool)

(declare-fun res!270014 () Bool)

(assert (=> b!453162 (=> (not res!270014) (not e!265244))))

(assert (=> b!453162 (= res!270014 (= (getValueByKey!371 (toList!3451 lt!205691) (_1!3989 (tuple2!7957 k0!794 lt!205569))) (Some!376 (_2!3989 (tuple2!7957 k0!794 lt!205569)))))))

(declare-fun b!453163 () Bool)

(assert (=> b!453163 (= e!265244 (contains!2479 (toList!3451 lt!205691) (tuple2!7957 k0!794 lt!205569)))))

(assert (= (and d!74365 res!270013) b!453162))

(assert (= (and b!453162 res!270014) b!453163))

(declare-fun m!437259 () Bool)

(assert (=> d!74365 m!437259))

(declare-fun m!437261 () Bool)

(assert (=> d!74365 m!437261))

(declare-fun m!437263 () Bool)

(assert (=> d!74365 m!437263))

(declare-fun m!437265 () Bool)

(assert (=> d!74365 m!437265))

(declare-fun m!437267 () Bool)

(assert (=> b!453162 m!437267))

(declare-fun m!437269 () Bool)

(assert (=> b!453163 m!437269))

(assert (=> b!452942 d!74365))

(declare-fun d!74367 () Bool)

(declare-fun e!265245 () Bool)

(assert (=> d!74367 e!265245))

(declare-fun res!270015 () Bool)

(assert (=> d!74367 (=> (not res!270015) (not e!265245))))

(declare-fun lt!205695 () ListLongMap!6871)

(assert (=> d!74367 (= res!270015 (contains!2478 lt!205695 (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun lt!205694 () List!8023)

(assert (=> d!74367 (= lt!205695 (ListLongMap!6872 lt!205694))))

(declare-fun lt!205696 () Unit!13229)

(declare-fun lt!205697 () Unit!13229)

(assert (=> d!74367 (= lt!205696 lt!205697)))

(assert (=> d!74367 (= (getValueByKey!371 lt!205694 (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74367 (= lt!205697 (lemmaContainsTupThenGetReturnValue!193 lt!205694 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74367 (= lt!205694 (insertStrictlySorted!196 (toList!3451 lt!205572) (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74367 (= (+!1575 lt!205572 (tuple2!7957 k0!794 v!412)) lt!205695)))

(declare-fun b!453164 () Bool)

(declare-fun res!270016 () Bool)

(assert (=> b!453164 (=> (not res!270016) (not e!265245))))

(assert (=> b!453164 (= res!270016 (= (getValueByKey!371 (toList!3451 lt!205695) (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun b!453165 () Bool)

(assert (=> b!453165 (= e!265245 (contains!2479 (toList!3451 lt!205695) (tuple2!7957 k0!794 v!412)))))

(assert (= (and d!74367 res!270015) b!453164))

(assert (= (and b!453164 res!270016) b!453165))

(declare-fun m!437271 () Bool)

(assert (=> d!74367 m!437271))

(declare-fun m!437273 () Bool)

(assert (=> d!74367 m!437273))

(declare-fun m!437275 () Bool)

(assert (=> d!74367 m!437275))

(declare-fun m!437277 () Bool)

(assert (=> d!74367 m!437277))

(declare-fun m!437279 () Bool)

(assert (=> b!453164 m!437279))

(declare-fun m!437281 () Bool)

(assert (=> b!453165 m!437281))

(assert (=> b!452942 d!74367))

(declare-fun d!74369 () Bool)

(declare-fun e!265246 () Bool)

(assert (=> d!74369 e!265246))

(declare-fun res!270017 () Bool)

(assert (=> d!74369 (=> (not res!270017) (not e!265246))))

(declare-fun lt!205699 () ListLongMap!6871)

(assert (=> d!74369 (= res!270017 (contains!2478 lt!205699 (_1!3989 lt!205564)))))

(declare-fun lt!205698 () List!8023)

(assert (=> d!74369 (= lt!205699 (ListLongMap!6872 lt!205698))))

(declare-fun lt!205700 () Unit!13229)

(declare-fun lt!205701 () Unit!13229)

(assert (=> d!74369 (= lt!205700 lt!205701)))

(assert (=> d!74369 (= (getValueByKey!371 lt!205698 (_1!3989 lt!205564)) (Some!376 (_2!3989 lt!205564)))))

(assert (=> d!74369 (= lt!205701 (lemmaContainsTupThenGetReturnValue!193 lt!205698 (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(assert (=> d!74369 (= lt!205698 (insertStrictlySorted!196 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))) (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(assert (=> d!74369 (= (+!1575 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)) lt!205564) lt!205699)))

(declare-fun b!453166 () Bool)

(declare-fun res!270018 () Bool)

(assert (=> b!453166 (=> (not res!270018) (not e!265246))))

(assert (=> b!453166 (= res!270018 (= (getValueByKey!371 (toList!3451 lt!205699) (_1!3989 lt!205564)) (Some!376 (_2!3989 lt!205564))))))

(declare-fun b!453167 () Bool)

(assert (=> b!453167 (= e!265246 (contains!2479 (toList!3451 lt!205699) lt!205564))))

(assert (= (and d!74369 res!270017) b!453166))

(assert (= (and b!453166 res!270018) b!453167))

(declare-fun m!437283 () Bool)

(assert (=> d!74369 m!437283))

(declare-fun m!437285 () Bool)

(assert (=> d!74369 m!437285))

(declare-fun m!437287 () Bool)

(assert (=> d!74369 m!437287))

(declare-fun m!437289 () Bool)

(assert (=> d!74369 m!437289))

(declare-fun m!437291 () Bool)

(assert (=> b!453166 m!437291))

(declare-fun m!437293 () Bool)

(assert (=> b!453167 m!437293))

(assert (=> b!452942 d!74369))

(declare-fun d!74371 () Bool)

(declare-fun c!56152 () Bool)

(assert (=> d!74371 (= c!56152 ((_ is ValueCellFull!5726) (select (arr!13482 _values!549) from!863)))))

(declare-fun e!265247 () V!17291)

(assert (=> d!74371 (= (get!6656 (select (arr!13482 _values!549) from!863) lt!205570) e!265247)))

(declare-fun b!453168 () Bool)

(assert (=> b!453168 (= e!265247 (get!6659 (select (arr!13482 _values!549) from!863) lt!205570))))

(declare-fun b!453169 () Bool)

(assert (=> b!453169 (= e!265247 (get!6660 (select (arr!13482 _values!549) from!863) lt!205570))))

(assert (= (and d!74371 c!56152) b!453168))

(assert (= (and d!74371 (not c!56152)) b!453169))

(assert (=> b!453168 m!437025))

(declare-fun m!437295 () Bool)

(assert (=> b!453168 m!437295))

(assert (=> b!453169 m!437025))

(declare-fun m!437297 () Bool)

(assert (=> b!453169 m!437297))

(assert (=> b!452942 d!74371))

(declare-fun b!453170 () Bool)

(declare-fun e!265251 () ListLongMap!6871)

(declare-fun e!265253 () ListLongMap!6871)

(assert (=> b!453170 (= e!265251 e!265253)))

(declare-fun c!56154 () Bool)

(assert (=> b!453170 (= c!56154 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun call!30026 () ListLongMap!6871)

(declare-fun bm!30023 () Bool)

(assert (=> bm!30023 (= call!30026 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453171 () Bool)

(declare-fun res!270021 () Bool)

(declare-fun e!265252 () Bool)

(assert (=> b!453171 (=> (not res!270021) (not e!265252))))

(declare-fun lt!205704 () ListLongMap!6871)

(assert (=> b!453171 (= res!270021 (not (contains!2478 lt!205704 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453172 () Bool)

(assert (=> b!453172 (= e!265251 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453174 () Bool)

(declare-fun e!265250 () Bool)

(declare-fun e!265249 () Bool)

(assert (=> b!453174 (= e!265250 e!265249)))

(declare-fun c!56153 () Bool)

(assert (=> b!453174 (= c!56153 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 lt!205566)))))

(declare-fun b!453175 () Bool)

(declare-fun e!265254 () Bool)

(assert (=> b!453175 (= e!265250 e!265254)))

(assert (=> b!453175 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 lt!205566)))))

(declare-fun res!270020 () Bool)

(assert (=> b!453175 (= res!270020 (contains!2478 lt!205704 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453175 (=> (not res!270020) (not e!265254))))

(declare-fun b!453176 () Bool)

(declare-fun lt!205705 () Unit!13229)

(declare-fun lt!205706 () Unit!13229)

(assert (=> b!453176 (= lt!205705 lt!205706)))

(declare-fun lt!205703 () V!17291)

(declare-fun lt!205708 () (_ BitVec 64))

(declare-fun lt!205702 () ListLongMap!6871)

(declare-fun lt!205707 () (_ BitVec 64))

(assert (=> b!453176 (not (contains!2478 (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703)) lt!205707))))

(assert (=> b!453176 (= lt!205706 (addStillNotContains!148 lt!205702 lt!205708 lt!205703 lt!205707))))

(assert (=> b!453176 (= lt!205707 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453176 (= lt!205703 (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453176 (= lt!205708 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!453176 (= lt!205702 call!30026)))

(assert (=> b!453176 (= e!265253 (+!1575 call!30026 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453177 () Bool)

(declare-fun e!265248 () Bool)

(assert (=> b!453177 (= e!265248 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453177 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453178 () Bool)

(assert (=> b!453178 (= e!265252 e!265250)))

(declare-fun c!56155 () Bool)

(assert (=> b!453178 (= c!56155 e!265248)))

(declare-fun res!270019 () Bool)

(assert (=> b!453178 (=> (not res!270019) (not e!265248))))

(assert (=> b!453178 (= res!270019 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 lt!205566)))))

(declare-fun b!453179 () Bool)

(assert (=> b!453179 (= e!265249 (isEmpty!565 lt!205704))))

(declare-fun b!453180 () Bool)

(assert (=> b!453180 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 lt!205566)))))

(assert (=> b!453180 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 lt!205573)))))

(assert (=> b!453180 (= e!265254 (= (apply!313 lt!205704 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453181 () Bool)

(assert (=> b!453181 (= e!265253 call!30026)))

(declare-fun d!74373 () Bool)

(assert (=> d!74373 e!265252))

(declare-fun res!270022 () Bool)

(assert (=> d!74373 (=> (not res!270022) (not e!265252))))

(assert (=> d!74373 (= res!270022 (not (contains!2478 lt!205704 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74373 (= lt!205704 e!265251)))

(declare-fun c!56156 () Bool)

(assert (=> d!74373 (= c!56156 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13833 lt!205566)))))

(assert (=> d!74373 (validMask!0 mask!1025)))

(assert (=> d!74373 (= (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205704)))

(declare-fun b!453173 () Bool)

(assert (=> b!453173 (= e!265249 (= lt!205704 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74373 c!56156) b!453172))

(assert (= (and d!74373 (not c!56156)) b!453170))

(assert (= (and b!453170 c!56154) b!453176))

(assert (= (and b!453170 (not c!56154)) b!453181))

(assert (= (or b!453176 b!453181) bm!30023))

(assert (= (and d!74373 res!270022) b!453171))

(assert (= (and b!453171 res!270021) b!453178))

(assert (= (and b!453178 res!270019) b!453177))

(assert (= (and b!453178 c!56155) b!453175))

(assert (= (and b!453178 (not c!56155)) b!453174))

(assert (= (and b!453175 res!270020) b!453180))

(assert (= (and b!453174 c!56153) b!453173))

(assert (= (and b!453174 (not c!56153)) b!453179))

(declare-fun b_lambda!9605 () Bool)

(assert (=> (not b_lambda!9605) (not b!453176)))

(assert (=> b!453176 t!13838))

(declare-fun b_and!18915 () Bool)

(assert (= b_and!18913 (and (=> t!13838 result!7091) b_and!18915)))

(declare-fun b_lambda!9607 () Bool)

(assert (=> (not b_lambda!9607) (not b!453180)))

(assert (=> b!453180 t!13838))

(declare-fun b_and!18917 () Bool)

(assert (= b_and!18915 (and (=> t!13838 result!7091) b_and!18917)))

(declare-fun m!437299 () Bool)

(assert (=> bm!30023 m!437299))

(declare-fun m!437301 () Bool)

(assert (=> b!453179 m!437301))

(declare-fun m!437303 () Bool)

(assert (=> b!453175 m!437303))

(assert (=> b!453175 m!437303))

(declare-fun m!437305 () Bool)

(assert (=> b!453175 m!437305))

(declare-fun m!437307 () Bool)

(assert (=> b!453171 m!437307))

(assert (=> b!453173 m!437299))

(declare-fun m!437309 () Bool)

(assert (=> b!453180 m!437309))

(assert (=> b!453180 m!437019))

(declare-fun m!437311 () Bool)

(assert (=> b!453180 m!437311))

(assert (=> b!453180 m!437303))

(declare-fun m!437313 () Bool)

(assert (=> b!453180 m!437313))

(assert (=> b!453180 m!437309))

(assert (=> b!453180 m!437019))

(assert (=> b!453180 m!437303))

(assert (=> b!453176 m!437309))

(assert (=> b!453176 m!437019))

(assert (=> b!453176 m!437311))

(declare-fun m!437315 () Bool)

(assert (=> b!453176 m!437315))

(assert (=> b!453176 m!437309))

(assert (=> b!453176 m!437019))

(declare-fun m!437317 () Bool)

(assert (=> b!453176 m!437317))

(assert (=> b!453176 m!437315))

(declare-fun m!437319 () Bool)

(assert (=> b!453176 m!437319))

(assert (=> b!453176 m!437303))

(declare-fun m!437321 () Bool)

(assert (=> b!453176 m!437321))

(declare-fun m!437323 () Bool)

(assert (=> d!74373 m!437323))

(assert (=> d!74373 m!436979))

(assert (=> b!453170 m!437303))

(assert (=> b!453170 m!437303))

(declare-fun m!437325 () Bool)

(assert (=> b!453170 m!437325))

(assert (=> b!453177 m!437303))

(assert (=> b!453177 m!437303))

(assert (=> b!453177 m!437325))

(assert (=> b!452942 d!74373))

(declare-fun b!453182 () Bool)

(declare-fun e!265258 () ListLongMap!6871)

(declare-fun e!265260 () ListLongMap!6871)

(assert (=> b!453182 (= e!265258 e!265260)))

(declare-fun c!56158 () Bool)

(assert (=> b!453182 (= c!56158 (validKeyInArray!0 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun bm!30024 () Bool)

(declare-fun call!30027 () ListLongMap!6871)

(assert (=> bm!30024 (= call!30027 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 lt!205566 _keys!709) (ite c!56123 lt!205573 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453183 () Bool)

(declare-fun res!270025 () Bool)

(declare-fun e!265259 () Bool)

(assert (=> b!453183 (=> (not res!270025) (not e!265259))))

(declare-fun lt!205711 () ListLongMap!6871)

(assert (=> b!453183 (= res!270025 (not (contains!2478 lt!205711 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453184 () Bool)

(assert (=> b!453184 (= e!265258 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453186 () Bool)

(declare-fun e!265257 () Bool)

(declare-fun e!265256 () Bool)

(assert (=> b!453186 (= e!265257 e!265256)))

(declare-fun c!56157 () Bool)

(assert (=> b!453186 (= c!56157 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(declare-fun b!453187 () Bool)

(declare-fun e!265261 () Bool)

(assert (=> b!453187 (= e!265257 e!265261)))

(assert (=> b!453187 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(declare-fun res!270024 () Bool)

(assert (=> b!453187 (= res!270024 (contains!2478 lt!205711 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453187 (=> (not res!270024) (not e!265261))))

(declare-fun b!453188 () Bool)

(declare-fun lt!205712 () Unit!13229)

(declare-fun lt!205713 () Unit!13229)

(assert (=> b!453188 (= lt!205712 lt!205713)))

(declare-fun lt!205715 () (_ BitVec 64))

(declare-fun lt!205710 () V!17291)

(declare-fun lt!205709 () ListLongMap!6871)

(declare-fun lt!205714 () (_ BitVec 64))

(assert (=> b!453188 (not (contains!2478 (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710)) lt!205714))))

(assert (=> b!453188 (= lt!205713 (addStillNotContains!148 lt!205709 lt!205715 lt!205710 lt!205714))))

(assert (=> b!453188 (= lt!205714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453188 (= lt!205710 (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453188 (= lt!205715 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!453188 (= lt!205709 call!30027)))

(assert (=> b!453188 (= e!265260 (+!1575 call!30027 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453189 () Bool)

(declare-fun e!265255 () Bool)

(assert (=> b!453189 (= e!265255 (validKeyInArray!0 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453189 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453190 () Bool)

(assert (=> b!453190 (= e!265259 e!265257)))

(declare-fun c!56159 () Bool)

(assert (=> b!453190 (= c!56159 e!265255)))

(declare-fun res!270023 () Bool)

(assert (=> b!453190 (=> (not res!270023) (not e!265255))))

(assert (=> b!453190 (= res!270023 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(declare-fun b!453191 () Bool)

(assert (=> b!453191 (= e!265256 (isEmpty!565 lt!205711))))

(declare-fun b!453192 () Bool)

(assert (=> b!453192 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(assert (=> b!453192 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56123 lt!205573 _values!549))))))

(assert (=> b!453192 (= e!265261 (= (apply!313 lt!205711 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453193 () Bool)

(assert (=> b!453193 (= e!265260 call!30027)))

(declare-fun d!74375 () Bool)

(assert (=> d!74375 e!265259))

(declare-fun res!270026 () Bool)

(assert (=> d!74375 (=> (not res!270026) (not e!265259))))

(assert (=> d!74375 (= res!270026 (not (contains!2478 lt!205711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74375 (= lt!205711 e!265258)))

(declare-fun c!56160 () Bool)

(assert (=> d!74375 (= c!56160 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(assert (=> d!74375 (validMask!0 mask!1025)))

(assert (=> d!74375 (= (getCurrentListMapNoExtraKeys!1680 (ite c!56123 lt!205566 _keys!709) (ite c!56123 lt!205573 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205711)))

(declare-fun b!453185 () Bool)

(assert (=> b!453185 (= e!265256 (= lt!205711 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 lt!205566 _keys!709) (ite c!56123 lt!205573 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74375 c!56160) b!453184))

(assert (= (and d!74375 (not c!56160)) b!453182))

(assert (= (and b!453182 c!56158) b!453188))

(assert (= (and b!453182 (not c!56158)) b!453193))

(assert (= (or b!453188 b!453193) bm!30024))

(assert (= (and d!74375 res!270026) b!453183))

(assert (= (and b!453183 res!270025) b!453190))

(assert (= (and b!453190 res!270023) b!453189))

(assert (= (and b!453190 c!56159) b!453187))

(assert (= (and b!453190 (not c!56159)) b!453186))

(assert (= (and b!453187 res!270024) b!453192))

(assert (= (and b!453186 c!56157) b!453185))

(assert (= (and b!453186 (not c!56157)) b!453191))

(declare-fun b_lambda!9609 () Bool)

(assert (=> (not b_lambda!9609) (not b!453188)))

(assert (=> b!453188 t!13838))

(declare-fun b_and!18919 () Bool)

(assert (= b_and!18917 (and (=> t!13838 result!7091) b_and!18919)))

(declare-fun b_lambda!9611 () Bool)

(assert (=> (not b_lambda!9611) (not b!453192)))

(assert (=> b!453192 t!13838))

(declare-fun b_and!18921 () Bool)

(assert (= b_and!18919 (and (=> t!13838 result!7091) b_and!18921)))

(declare-fun m!437327 () Bool)

(assert (=> bm!30024 m!437327))

(declare-fun m!437329 () Bool)

(assert (=> b!453191 m!437329))

(declare-fun m!437331 () Bool)

(assert (=> b!453187 m!437331))

(assert (=> b!453187 m!437331))

(declare-fun m!437333 () Bool)

(assert (=> b!453187 m!437333))

(declare-fun m!437335 () Bool)

(assert (=> b!453183 m!437335))

(assert (=> b!453185 m!437327))

(declare-fun m!437337 () Bool)

(assert (=> b!453192 m!437337))

(assert (=> b!453192 m!437019))

(declare-fun m!437339 () Bool)

(assert (=> b!453192 m!437339))

(assert (=> b!453192 m!437331))

(declare-fun m!437341 () Bool)

(assert (=> b!453192 m!437341))

(assert (=> b!453192 m!437337))

(assert (=> b!453192 m!437019))

(assert (=> b!453192 m!437331))

(assert (=> b!453188 m!437337))

(assert (=> b!453188 m!437019))

(assert (=> b!453188 m!437339))

(declare-fun m!437343 () Bool)

(assert (=> b!453188 m!437343))

(assert (=> b!453188 m!437337))

(assert (=> b!453188 m!437019))

(declare-fun m!437345 () Bool)

(assert (=> b!453188 m!437345))

(assert (=> b!453188 m!437343))

(declare-fun m!437347 () Bool)

(assert (=> b!453188 m!437347))

(assert (=> b!453188 m!437331))

(declare-fun m!437349 () Bool)

(assert (=> b!453188 m!437349))

(declare-fun m!437351 () Bool)

(assert (=> d!74375 m!437351))

(assert (=> d!74375 m!436979))

(assert (=> b!453182 m!437331))

(assert (=> b!453182 m!437331))

(declare-fun m!437353 () Bool)

(assert (=> b!453182 m!437353))

(assert (=> b!453189 m!437331))

(assert (=> b!453189 m!437331))

(assert (=> b!453189 m!437353))

(assert (=> bm!30000 d!74375))

(declare-fun d!74377 () Bool)

(assert (=> d!74377 (= (array_inv!9842 _values!549) (bvsge (size!13834 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40798 d!74377))

(declare-fun d!74379 () Bool)

(assert (=> d!74379 (= (array_inv!9843 _keys!709) (bvsge (size!13833 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40798 d!74379))

(declare-fun d!74381 () Bool)

(declare-fun res!270027 () Bool)

(declare-fun e!265263 () Bool)

(assert (=> d!74381 (=> res!270027 e!265263)))

(assert (=> d!74381 (= res!270027 (bvsge #b00000000000000000000000000000000 (size!13833 lt!205566)))))

(assert (=> d!74381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205566 mask!1025) e!265263)))

(declare-fun bm!30025 () Bool)

(declare-fun call!30028 () Bool)

(assert (=> bm!30025 (= call!30028 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!205566 mask!1025))))

(declare-fun b!453194 () Bool)

(declare-fun e!265262 () Bool)

(assert (=> b!453194 (= e!265263 e!265262)))

(declare-fun c!56161 () Bool)

(assert (=> b!453194 (= c!56161 (validKeyInArray!0 (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(declare-fun b!453195 () Bool)

(declare-fun e!265264 () Bool)

(assert (=> b!453195 (= e!265262 e!265264)))

(declare-fun lt!205718 () (_ BitVec 64))

(assert (=> b!453195 (= lt!205718 (select (arr!13481 lt!205566) #b00000000000000000000000000000000))))

(declare-fun lt!205717 () Unit!13229)

(assert (=> b!453195 (= lt!205717 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205566 lt!205718 #b00000000000000000000000000000000))))

(assert (=> b!453195 (arrayContainsKey!0 lt!205566 lt!205718 #b00000000000000000000000000000000)))

(declare-fun lt!205716 () Unit!13229)

(assert (=> b!453195 (= lt!205716 lt!205717)))

(declare-fun res!270028 () Bool)

(assert (=> b!453195 (= res!270028 (= (seekEntryOrOpen!0 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) lt!205566 mask!1025) (Found!3481 #b00000000000000000000000000000000)))))

(assert (=> b!453195 (=> (not res!270028) (not e!265264))))

(declare-fun b!453196 () Bool)

(assert (=> b!453196 (= e!265262 call!30028)))

(declare-fun b!453197 () Bool)

(assert (=> b!453197 (= e!265264 call!30028)))

(assert (= (and d!74381 (not res!270027)) b!453194))

(assert (= (and b!453194 c!56161) b!453195))

(assert (= (and b!453194 (not c!56161)) b!453196))

(assert (= (and b!453195 res!270028) b!453197))

(assert (= (or b!453197 b!453196) bm!30025))

(declare-fun m!437355 () Bool)

(assert (=> bm!30025 m!437355))

(assert (=> b!453194 m!437217))

(assert (=> b!453194 m!437217))

(assert (=> b!453194 m!437219))

(assert (=> b!453195 m!437217))

(declare-fun m!437357 () Bool)

(assert (=> b!453195 m!437357))

(declare-fun m!437359 () Bool)

(assert (=> b!453195 m!437359))

(assert (=> b!453195 m!437217))

(declare-fun m!437361 () Bool)

(assert (=> b!453195 m!437361))

(assert (=> b!452957 d!74381))

(declare-fun d!74383 () Bool)

(declare-fun e!265265 () Bool)

(assert (=> d!74383 e!265265))

(declare-fun res!270029 () Bool)

(assert (=> d!74383 (=> (not res!270029) (not e!265265))))

(declare-fun lt!205720 () ListLongMap!6871)

(assert (=> d!74383 (= res!270029 (contains!2478 lt!205720 (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun lt!205719 () List!8023)

(assert (=> d!74383 (= lt!205720 (ListLongMap!6872 lt!205719))))

(declare-fun lt!205721 () Unit!13229)

(declare-fun lt!205722 () Unit!13229)

(assert (=> d!74383 (= lt!205721 lt!205722)))

(assert (=> d!74383 (= (getValueByKey!371 lt!205719 (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74383 (= lt!205722 (lemmaContainsTupThenGetReturnValue!193 lt!205719 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74383 (= lt!205719 (insertStrictlySorted!196 (toList!3451 call!30002) (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74383 (= (+!1575 call!30002 (tuple2!7957 k0!794 v!412)) lt!205720)))

(declare-fun b!453198 () Bool)

(declare-fun res!270030 () Bool)

(assert (=> b!453198 (=> (not res!270030) (not e!265265))))

(assert (=> b!453198 (= res!270030 (= (getValueByKey!371 (toList!3451 lt!205720) (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun b!453199 () Bool)

(assert (=> b!453199 (= e!265265 (contains!2479 (toList!3451 lt!205720) (tuple2!7957 k0!794 v!412)))))

(assert (= (and d!74383 res!270029) b!453198))

(assert (= (and b!453198 res!270030) b!453199))

(declare-fun m!437363 () Bool)

(assert (=> d!74383 m!437363))

(declare-fun m!437365 () Bool)

(assert (=> d!74383 m!437365))

(declare-fun m!437367 () Bool)

(assert (=> d!74383 m!437367))

(declare-fun m!437369 () Bool)

(assert (=> d!74383 m!437369))

(declare-fun m!437371 () Bool)

(assert (=> b!453198 m!437371))

(declare-fun m!437373 () Bool)

(assert (=> b!453199 m!437373))

(assert (=> b!452956 d!74383))

(declare-fun d!74385 () Bool)

(declare-fun res!270035 () Bool)

(declare-fun e!265270 () Bool)

(assert (=> d!74385 (=> res!270035 e!265270)))

(assert (=> d!74385 (= res!270035 (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74385 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!265270)))

(declare-fun b!453204 () Bool)

(declare-fun e!265271 () Bool)

(assert (=> b!453204 (= e!265270 e!265271)))

(declare-fun res!270036 () Bool)

(assert (=> b!453204 (=> (not res!270036) (not e!265271))))

(assert (=> b!453204 (= res!270036 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(declare-fun b!453205 () Bool)

(assert (=> b!453205 (= e!265271 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74385 (not res!270035)) b!453204))

(assert (= (and b!453204 res!270036) b!453205))

(assert (=> d!74385 m!437173))

(declare-fun m!437375 () Bool)

(assert (=> b!453205 m!437375))

(assert (=> b!452954 d!74385))

(declare-fun d!74387 () Bool)

(assert (=> d!74387 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452946 d!74387))

(declare-fun d!74389 () Bool)

(assert (=> d!74389 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!452955 d!74389))

(declare-fun d!74391 () Bool)

(assert (=> d!74391 (= (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)) (and (not (= (select (arr!13481 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452945 d!74391))

(declare-fun d!74393 () Bool)

(declare-fun e!265277 () Bool)

(assert (=> d!74393 e!265277))

(declare-fun res!270039 () Bool)

(assert (=> d!74393 (=> (not res!270039) (not e!265277))))

(assert (=> d!74393 (= res!270039 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13833 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13834 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13833 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13834 _values!549))))))))

(declare-fun lt!205725 () Unit!13229)

(declare-fun choose!1335 (array!28074 array!28076 (_ BitVec 32) (_ BitVec 32) V!17291 V!17291 (_ BitVec 32) (_ BitVec 64) V!17291 (_ BitVec 32) Int) Unit!13229)

(assert (=> d!74393 (= lt!205725 (choose!1335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74393 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13833 _keys!709)))))

(assert (=> d!74393 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!735 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205725)))

(declare-fun b!453212 () Bool)

(declare-fun e!265276 () Bool)

(assert (=> b!453212 (= e!265277 e!265276)))

(declare-fun c!56164 () Bool)

(assert (=> b!453212 (= c!56164 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!453213 () Bool)

(declare-fun call!30033 () ListLongMap!6871)

(declare-fun call!30034 () ListLongMap!6871)

(assert (=> b!453213 (= e!265276 (= call!30034 (+!1575 call!30033 (tuple2!7957 k0!794 v!412))))))

(declare-fun bm!30030 () Bool)

(assert (=> bm!30030 (= call!30034 (getCurrentListMapNoExtraKeys!1680 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)) (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!30031 () Bool)

(assert (=> bm!30031 (= call!30033 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453214 () Bool)

(assert (=> b!453214 (= e!265276 (= call!30034 call!30033))))

(assert (= (and d!74393 res!270039) b!453212))

(assert (= (and b!453212 c!56164) b!453213))

(assert (= (and b!453212 (not c!56164)) b!453214))

(assert (= (or b!453213 b!453214) bm!30031))

(assert (= (or b!453213 b!453214) bm!30030))

(declare-fun m!437377 () Bool)

(assert (=> d!74393 m!437377))

(declare-fun m!437379 () Bool)

(assert (=> b!453213 m!437379))

(assert (=> bm!30030 m!437005))

(assert (=> bm!30030 m!436989))

(declare-fun m!437381 () Bool)

(assert (=> bm!30030 m!437381))

(declare-fun m!437383 () Bool)

(assert (=> bm!30031 m!437383))

(assert (=> b!452945 d!74393))

(declare-fun b!453215 () Bool)

(declare-fun e!265281 () ListLongMap!6871)

(declare-fun e!265283 () ListLongMap!6871)

(assert (=> b!453215 (= e!265281 e!265283)))

(declare-fun c!56166 () Bool)

(assert (=> b!453215 (= c!56166 (validKeyInArray!0 (select (arr!13481 lt!205566) from!863)))))

(declare-fun bm!30032 () Bool)

(declare-fun call!30035 () ListLongMap!6871)

(assert (=> bm!30032 (= call!30035 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453216 () Bool)

(declare-fun res!270042 () Bool)

(declare-fun e!265282 () Bool)

(assert (=> b!453216 (=> (not res!270042) (not e!265282))))

(declare-fun lt!205728 () ListLongMap!6871)

(assert (=> b!453216 (= res!270042 (not (contains!2478 lt!205728 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453217 () Bool)

(assert (=> b!453217 (= e!265281 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453219 () Bool)

(declare-fun e!265280 () Bool)

(declare-fun e!265279 () Bool)

(assert (=> b!453219 (= e!265280 e!265279)))

(declare-fun c!56165 () Bool)

(assert (=> b!453219 (= c!56165 (bvslt from!863 (size!13833 lt!205566)))))

(declare-fun b!453220 () Bool)

(declare-fun e!265284 () Bool)

(assert (=> b!453220 (= e!265280 e!265284)))

(assert (=> b!453220 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13833 lt!205566)))))

(declare-fun res!270041 () Bool)

(assert (=> b!453220 (= res!270041 (contains!2478 lt!205728 (select (arr!13481 lt!205566) from!863)))))

(assert (=> b!453220 (=> (not res!270041) (not e!265284))))

(declare-fun b!453221 () Bool)

(declare-fun lt!205729 () Unit!13229)

(declare-fun lt!205730 () Unit!13229)

(assert (=> b!453221 (= lt!205729 lt!205730)))

(declare-fun lt!205732 () (_ BitVec 64))

(declare-fun lt!205731 () (_ BitVec 64))

(declare-fun lt!205726 () ListLongMap!6871)

(declare-fun lt!205727 () V!17291)

(assert (=> b!453221 (not (contains!2478 (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727)) lt!205731))))

(assert (=> b!453221 (= lt!205730 (addStillNotContains!148 lt!205726 lt!205732 lt!205727 lt!205731))))

(assert (=> b!453221 (= lt!205731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453221 (= lt!205727 (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453221 (= lt!205732 (select (arr!13481 lt!205566) from!863))))

(assert (=> b!453221 (= lt!205726 call!30035)))

(assert (=> b!453221 (= e!265283 (+!1575 call!30035 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453222 () Bool)

(declare-fun e!265278 () Bool)

(assert (=> b!453222 (= e!265278 (validKeyInArray!0 (select (arr!13481 lt!205566) from!863)))))

(assert (=> b!453222 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!453223 () Bool)

(assert (=> b!453223 (= e!265282 e!265280)))

(declare-fun c!56167 () Bool)

(assert (=> b!453223 (= c!56167 e!265278)))

(declare-fun res!270040 () Bool)

(assert (=> b!453223 (=> (not res!270040) (not e!265278))))

(assert (=> b!453223 (= res!270040 (bvslt from!863 (size!13833 lt!205566)))))

(declare-fun b!453224 () Bool)

(assert (=> b!453224 (= e!265279 (isEmpty!565 lt!205728))))

(declare-fun b!453225 () Bool)

(assert (=> b!453225 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13833 lt!205566)))))

(assert (=> b!453225 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13834 lt!205573)))))

(assert (=> b!453225 (= e!265284 (= (apply!313 lt!205728 (select (arr!13481 lt!205566) from!863)) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453226 () Bool)

(assert (=> b!453226 (= e!265283 call!30035)))

(declare-fun d!74395 () Bool)

(assert (=> d!74395 e!265282))

(declare-fun res!270043 () Bool)

(assert (=> d!74395 (=> (not res!270043) (not e!265282))))

(assert (=> d!74395 (= res!270043 (not (contains!2478 lt!205728 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74395 (= lt!205728 e!265281)))

(declare-fun c!56168 () Bool)

(assert (=> d!74395 (= c!56168 (bvsge from!863 (size!13833 lt!205566)))))

(assert (=> d!74395 (validMask!0 mask!1025)))

(assert (=> d!74395 (= (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!205728)))

(declare-fun b!453218 () Bool)

(assert (=> b!453218 (= e!265279 (= lt!205728 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74395 c!56168) b!453217))

(assert (= (and d!74395 (not c!56168)) b!453215))

(assert (= (and b!453215 c!56166) b!453221))

(assert (= (and b!453215 (not c!56166)) b!453226))

(assert (= (or b!453221 b!453226) bm!30032))

(assert (= (and d!74395 res!270043) b!453216))

(assert (= (and b!453216 res!270042) b!453223))

(assert (= (and b!453223 res!270040) b!453222))

(assert (= (and b!453223 c!56167) b!453220))

(assert (= (and b!453223 (not c!56167)) b!453219))

(assert (= (and b!453220 res!270041) b!453225))

(assert (= (and b!453219 c!56165) b!453218))

(assert (= (and b!453219 (not c!56165)) b!453224))

(declare-fun b_lambda!9613 () Bool)

(assert (=> (not b_lambda!9613) (not b!453221)))

(assert (=> b!453221 t!13838))

(declare-fun b_and!18923 () Bool)

(assert (= b_and!18921 (and (=> t!13838 result!7091) b_and!18923)))

(declare-fun b_lambda!9615 () Bool)

(assert (=> (not b_lambda!9615) (not b!453225)))

(assert (=> b!453225 t!13838))

(declare-fun b_and!18925 () Bool)

(assert (= b_and!18923 (and (=> t!13838 result!7091) b_and!18925)))

(declare-fun m!437385 () Bool)

(assert (=> bm!30032 m!437385))

(declare-fun m!437387 () Bool)

(assert (=> b!453224 m!437387))

(assert (=> b!453220 m!437031))

(assert (=> b!453220 m!437031))

(declare-fun m!437389 () Bool)

(assert (=> b!453220 m!437389))

(declare-fun m!437391 () Bool)

(assert (=> b!453216 m!437391))

(assert (=> b!453218 m!437385))

(declare-fun m!437393 () Bool)

(assert (=> b!453225 m!437393))

(assert (=> b!453225 m!437019))

(declare-fun m!437395 () Bool)

(assert (=> b!453225 m!437395))

(assert (=> b!453225 m!437031))

(declare-fun m!437397 () Bool)

(assert (=> b!453225 m!437397))

(assert (=> b!453225 m!437393))

(assert (=> b!453225 m!437019))

(assert (=> b!453225 m!437031))

(assert (=> b!453221 m!437393))

(assert (=> b!453221 m!437019))

(assert (=> b!453221 m!437395))

(declare-fun m!437399 () Bool)

(assert (=> b!453221 m!437399))

(assert (=> b!453221 m!437393))

(assert (=> b!453221 m!437019))

(declare-fun m!437401 () Bool)

(assert (=> b!453221 m!437401))

(assert (=> b!453221 m!437399))

(declare-fun m!437403 () Bool)

(assert (=> b!453221 m!437403))

(assert (=> b!453221 m!437031))

(declare-fun m!437405 () Bool)

(assert (=> b!453221 m!437405))

(declare-fun m!437407 () Bool)

(assert (=> d!74395 m!437407))

(assert (=> d!74395 m!436979))

(assert (=> b!453215 m!437031))

(assert (=> b!453215 m!437031))

(declare-fun m!437409 () Bool)

(assert (=> b!453215 m!437409))

(assert (=> b!453222 m!437031))

(assert (=> b!453222 m!437031))

(assert (=> b!453222 m!437409))

(assert (=> b!452953 d!74395))

(declare-fun b!453227 () Bool)

(declare-fun e!265288 () ListLongMap!6871)

(declare-fun e!265290 () ListLongMap!6871)

(assert (=> b!453227 (= e!265288 e!265290)))

(declare-fun c!56170 () Bool)

(assert (=> b!453227 (= c!56170 (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)))))

(declare-fun bm!30033 () Bool)

(declare-fun call!30036 () ListLongMap!6871)

(assert (=> bm!30033 (= call!30036 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453228 () Bool)

(declare-fun res!270046 () Bool)

(declare-fun e!265289 () Bool)

(assert (=> b!453228 (=> (not res!270046) (not e!265289))))

(declare-fun lt!205735 () ListLongMap!6871)

(assert (=> b!453228 (= res!270046 (not (contains!2478 lt!205735 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453229 () Bool)

(assert (=> b!453229 (= e!265288 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453231 () Bool)

(declare-fun e!265287 () Bool)

(declare-fun e!265286 () Bool)

(assert (=> b!453231 (= e!265287 e!265286)))

(declare-fun c!56169 () Bool)

(assert (=> b!453231 (= c!56169 (bvslt from!863 (size!13833 _keys!709)))))

(declare-fun b!453232 () Bool)

(declare-fun e!265291 () Bool)

(assert (=> b!453232 (= e!265287 e!265291)))

(assert (=> b!453232 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13833 _keys!709)))))

(declare-fun res!270045 () Bool)

(assert (=> b!453232 (= res!270045 (contains!2478 lt!205735 (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!453232 (=> (not res!270045) (not e!265291))))

(declare-fun b!453233 () Bool)

(declare-fun lt!205736 () Unit!13229)

(declare-fun lt!205737 () Unit!13229)

(assert (=> b!453233 (= lt!205736 lt!205737)))

(declare-fun lt!205733 () ListLongMap!6871)

(declare-fun lt!205734 () V!17291)

(declare-fun lt!205738 () (_ BitVec 64))

(declare-fun lt!205739 () (_ BitVec 64))

(assert (=> b!453233 (not (contains!2478 (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734)) lt!205738))))

(assert (=> b!453233 (= lt!205737 (addStillNotContains!148 lt!205733 lt!205739 lt!205734 lt!205738))))

(assert (=> b!453233 (= lt!205738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453233 (= lt!205734 (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453233 (= lt!205739 (select (arr!13481 _keys!709) from!863))))

(assert (=> b!453233 (= lt!205733 call!30036)))

(assert (=> b!453233 (= e!265290 (+!1575 call!30036 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453234 () Bool)

(declare-fun e!265285 () Bool)

(assert (=> b!453234 (= e!265285 (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!453234 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!453235 () Bool)

(assert (=> b!453235 (= e!265289 e!265287)))

(declare-fun c!56171 () Bool)

(assert (=> b!453235 (= c!56171 e!265285)))

(declare-fun res!270044 () Bool)

(assert (=> b!453235 (=> (not res!270044) (not e!265285))))

(assert (=> b!453235 (= res!270044 (bvslt from!863 (size!13833 _keys!709)))))

(declare-fun b!453236 () Bool)

(assert (=> b!453236 (= e!265286 (isEmpty!565 lt!205735))))

(declare-fun b!453237 () Bool)

(assert (=> b!453237 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13833 _keys!709)))))

(assert (=> b!453237 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13834 _values!549)))))

(assert (=> b!453237 (= e!265291 (= (apply!313 lt!205735 (select (arr!13481 _keys!709) from!863)) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453238 () Bool)

(assert (=> b!453238 (= e!265290 call!30036)))

(declare-fun d!74397 () Bool)

(assert (=> d!74397 e!265289))

(declare-fun res!270047 () Bool)

(assert (=> d!74397 (=> (not res!270047) (not e!265289))))

(assert (=> d!74397 (= res!270047 (not (contains!2478 lt!205735 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74397 (= lt!205735 e!265288)))

(declare-fun c!56172 () Bool)

(assert (=> d!74397 (= c!56172 (bvsge from!863 (size!13833 _keys!709)))))

(assert (=> d!74397 (validMask!0 mask!1025)))

(assert (=> d!74397 (= (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!205735)))

(declare-fun b!453230 () Bool)

(assert (=> b!453230 (= e!265286 (= lt!205735 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74397 c!56172) b!453229))

(assert (= (and d!74397 (not c!56172)) b!453227))

(assert (= (and b!453227 c!56170) b!453233))

(assert (= (and b!453227 (not c!56170)) b!453238))

(assert (= (or b!453233 b!453238) bm!30033))

(assert (= (and d!74397 res!270047) b!453228))

(assert (= (and b!453228 res!270046) b!453235))

(assert (= (and b!453235 res!270044) b!453234))

(assert (= (and b!453235 c!56171) b!453232))

(assert (= (and b!453235 (not c!56171)) b!453231))

(assert (= (and b!453232 res!270045) b!453237))

(assert (= (and b!453231 c!56169) b!453230))

(assert (= (and b!453231 (not c!56169)) b!453236))

(declare-fun b_lambda!9617 () Bool)

(assert (=> (not b_lambda!9617) (not b!453233)))

(assert (=> b!453233 t!13838))

(declare-fun b_and!18927 () Bool)

(assert (= b_and!18925 (and (=> t!13838 result!7091) b_and!18927)))

(declare-fun b_lambda!9619 () Bool)

(assert (=> (not b_lambda!9619) (not b!453237)))

(assert (=> b!453237 t!13838))

(declare-fun b_and!18929 () Bool)

(assert (= b_and!18927 (and (=> t!13838 result!7091) b_and!18929)))

(declare-fun m!437411 () Bool)

(assert (=> bm!30033 m!437411))

(declare-fun m!437413 () Bool)

(assert (=> b!453236 m!437413))

(assert (=> b!453232 m!436993))

(assert (=> b!453232 m!436993))

(declare-fun m!437415 () Bool)

(assert (=> b!453232 m!437415))

(declare-fun m!437417 () Bool)

(assert (=> b!453228 m!437417))

(assert (=> b!453230 m!437411))

(assert (=> b!453237 m!437025))

(assert (=> b!453237 m!437019))

(declare-fun m!437419 () Bool)

(assert (=> b!453237 m!437419))

(assert (=> b!453237 m!436993))

(declare-fun m!437421 () Bool)

(assert (=> b!453237 m!437421))

(assert (=> b!453237 m!437025))

(assert (=> b!453237 m!437019))

(assert (=> b!453237 m!436993))

(assert (=> b!453233 m!437025))

(assert (=> b!453233 m!437019))

(assert (=> b!453233 m!437419))

(declare-fun m!437423 () Bool)

(assert (=> b!453233 m!437423))

(assert (=> b!453233 m!437025))

(assert (=> b!453233 m!437019))

(declare-fun m!437425 () Bool)

(assert (=> b!453233 m!437425))

(assert (=> b!453233 m!437423))

(declare-fun m!437427 () Bool)

(assert (=> b!453233 m!437427))

(assert (=> b!453233 m!436993))

(declare-fun m!437429 () Bool)

(assert (=> b!453233 m!437429))

(declare-fun m!437431 () Bool)

(assert (=> d!74397 m!437431))

(assert (=> d!74397 m!436979))

(assert (=> b!453227 m!436993))

(assert (=> b!453227 m!436993))

(assert (=> b!453227 m!436995))

(assert (=> b!453234 m!436993))

(assert (=> b!453234 m!436993))

(assert (=> b!453234 m!436995))

(assert (=> b!452953 d!74397))

(declare-fun b!453245 () Bool)

(declare-fun e!265296 () Bool)

(assert (=> b!453245 (= e!265296 tp_is_empty!12139)))

(declare-fun condMapEmpty!19854 () Bool)

(declare-fun mapDefault!19854 () ValueCell!5726)

(assert (=> mapNonEmpty!19845 (= condMapEmpty!19854 (= mapRest!19845 ((as const (Array (_ BitVec 32) ValueCell!5726)) mapDefault!19854)))))

(declare-fun e!265297 () Bool)

(declare-fun mapRes!19854 () Bool)

(assert (=> mapNonEmpty!19845 (= tp!38225 (and e!265297 mapRes!19854))))

(declare-fun b!453246 () Bool)

(assert (=> b!453246 (= e!265297 tp_is_empty!12139)))

(declare-fun mapNonEmpty!19854 () Bool)

(declare-fun tp!38241 () Bool)

(assert (=> mapNonEmpty!19854 (= mapRes!19854 (and tp!38241 e!265296))))

(declare-fun mapValue!19854 () ValueCell!5726)

(declare-fun mapKey!19854 () (_ BitVec 32))

(declare-fun mapRest!19854 () (Array (_ BitVec 32) ValueCell!5726))

(assert (=> mapNonEmpty!19854 (= mapRest!19845 (store mapRest!19854 mapKey!19854 mapValue!19854))))

(declare-fun mapIsEmpty!19854 () Bool)

(assert (=> mapIsEmpty!19854 mapRes!19854))

(assert (= (and mapNonEmpty!19845 condMapEmpty!19854) mapIsEmpty!19854))

(assert (= (and mapNonEmpty!19845 (not condMapEmpty!19854)) mapNonEmpty!19854))

(assert (= (and mapNonEmpty!19854 ((_ is ValueCellFull!5726) mapValue!19854)) b!453245))

(assert (= (and mapNonEmpty!19845 ((_ is ValueCellFull!5726) mapDefault!19854)) b!453246))

(declare-fun m!437433 () Bool)

(assert (=> mapNonEmpty!19854 m!437433))

(declare-fun b_lambda!9621 () Bool)

(assert (= b_lambda!9619 (or (and start!40798 b_free!10801) b_lambda!9621)))

(declare-fun b_lambda!9623 () Bool)

(assert (= b_lambda!9603 (or (and start!40798 b_free!10801) b_lambda!9623)))

(declare-fun b_lambda!9625 () Bool)

(assert (= b_lambda!9607 (or (and start!40798 b_free!10801) b_lambda!9625)))

(declare-fun b_lambda!9627 () Bool)

(assert (= b_lambda!9615 (or (and start!40798 b_free!10801) b_lambda!9627)))

(declare-fun b_lambda!9629 () Bool)

(assert (= b_lambda!9605 (or (and start!40798 b_free!10801) b_lambda!9629)))

(declare-fun b_lambda!9631 () Bool)

(assert (= b_lambda!9611 (or (and start!40798 b_free!10801) b_lambda!9631)))

(declare-fun b_lambda!9633 () Bool)

(assert (= b_lambda!9617 (or (and start!40798 b_free!10801) b_lambda!9633)))

(declare-fun b_lambda!9635 () Bool)

(assert (= b_lambda!9601 (or (and start!40798 b_free!10801) b_lambda!9635)))

(declare-fun b_lambda!9637 () Bool)

(assert (= b_lambda!9613 (or (and start!40798 b_free!10801) b_lambda!9637)))

(declare-fun b_lambda!9639 () Bool)

(assert (= b_lambda!9609 (or (and start!40798 b_free!10801) b_lambda!9639)))

(check-sat (not b!453158) (not bm!30015) (not d!74393) (not b!453236) b_and!18929 (not b!453185) (not d!74357) (not b_lambda!9627) (not b!453182) (not b!453170) (not b!453126) (not bm!30021) (not d!74369) (not bm!30030) (not b_lambda!9635) (not b_lambda!9621) (not b!453227) (not b!453176) (not d!74383) (not b_next!10801) (not bm!30024) (not b!453233) (not b!453147) (not b_lambda!9639) (not b!453090) (not b!453159) (not b!453160) (not b!453092) (not d!74351) (not b!453180) (not b!453175) (not b_lambda!9633) (not bm!30025) (not b!453224) (not b_lambda!9599) (not bm!30023) (not bm!30031) (not b_lambda!9625) (not mapNonEmpty!19854) (not d!74365) (not b!453139) (not d!74373) (not b!453162) (not b_lambda!9629) (not b!453124) (not b!453177) (not d!74395) (not d!74367) (not b!453125) (not d!74397) (not b!453194) (not b!453218) (not bm!30022) (not b!453232) (not b!453228) (not b!453198) (not b!453094) (not b!453166) (not b!453237) (not b!453173) (not b!453163) (not b!453165) (not b!453161) (not bm!30032) (not b!453140) (not b!453189) (not b!453205) (not d!74375) (not b!453192) (not b!453171) (not b!453152) (not b!453119) (not b!453195) (not b!453183) (not b!453168) (not b!453234) (not b!453225) (not b!453143) (not bm!30018) (not b!453191) (not b!453145) (not b!453120) (not b!453221) (not b_lambda!9623) (not b!453199) (not b!453129) (not b!453222) (not d!74361) (not b!453167) (not b!453169) (not b!453216) (not b!453220) (not bm!30033) (not b!453187) tp_is_empty!12139 (not b_lambda!9637) (not b!453215) (not b!453230) (not b!453179) (not b!453164) (not d!74363) (not b!453122) (not b!453153) (not b!453213) (not b!453188) (not b_lambda!9631) (not b!453128))
(check-sat b_and!18929 (not b_next!10801))
(get-model)

(declare-fun d!74399 () Bool)

(assert (=> d!74399 (= (validKeyInArray!0 (select (arr!13481 lt!205566) from!863)) (and (not (= (select (arr!13481 lt!205566) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 lt!205566) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453222 d!74399))

(declare-fun d!74401 () Bool)

(declare-fun get!6661 (Option!377) V!17291)

(assert (=> d!74401 (= (apply!313 lt!205711 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6661 (getValueByKey!371 (toList!3451 lt!205711) (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14419 () Bool)

(assert (= bs!14419 d!74401))

(assert (=> bs!14419 m!437331))

(declare-fun m!437435 () Bool)

(assert (=> bs!14419 m!437435))

(assert (=> bs!14419 m!437435))

(declare-fun m!437437 () Bool)

(assert (=> bs!14419 m!437437))

(assert (=> b!453192 d!74401))

(declare-fun c!56173 () Bool)

(declare-fun d!74403 () Bool)

(assert (=> d!74403 (= c!56173 ((_ is ValueCellFull!5726) (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265298 () V!17291)

(assert (=> d!74403 (= (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265298)))

(declare-fun b!453247 () Bool)

(assert (=> b!453247 (= e!265298 (get!6659 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453248 () Bool)

(assert (=> b!453248 (= e!265298 (get!6660 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74403 c!56173) b!453247))

(assert (= (and d!74403 (not c!56173)) b!453248))

(assert (=> b!453247 m!437337))

(assert (=> b!453247 m!437019))

(declare-fun m!437439 () Bool)

(assert (=> b!453247 m!437439))

(assert (=> b!453248 m!437337))

(assert (=> b!453248 m!437019))

(declare-fun m!437441 () Bool)

(assert (=> b!453248 m!437441))

(assert (=> b!453192 d!74403))

(declare-fun d!74405 () Bool)

(declare-fun isEmpty!566 (List!8023) Bool)

(assert (=> d!74405 (= (isEmpty!565 lt!205728) (isEmpty!566 (toList!3451 lt!205728)))))

(declare-fun bs!14420 () Bool)

(assert (= bs!14420 d!74405))

(declare-fun m!437443 () Bool)

(assert (=> bs!14420 m!437443))

(assert (=> b!453224 d!74405))

(declare-fun d!74407 () Bool)

(assert (=> d!74407 (= (get!6660 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205570) lt!205570)))

(assert (=> b!453159 d!74407))

(declare-fun b!453249 () Bool)

(declare-fun e!265302 () ListLongMap!6871)

(declare-fun e!265304 () ListLongMap!6871)

(assert (=> b!453249 (= e!265302 e!265304)))

(declare-fun c!56175 () Bool)

(assert (=> b!453249 (= c!56175 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(declare-fun call!30037 () ListLongMap!6871)

(declare-fun bm!30034 () Bool)

(assert (=> bm!30034 (= call!30037 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453250 () Bool)

(declare-fun res!270050 () Bool)

(declare-fun e!265303 () Bool)

(assert (=> b!453250 (=> (not res!270050) (not e!265303))))

(declare-fun lt!205742 () ListLongMap!6871)

(assert (=> b!453250 (= res!270050 (not (contains!2478 lt!205742 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453251 () Bool)

(assert (=> b!453251 (= e!265302 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453253 () Bool)

(declare-fun e!265301 () Bool)

(declare-fun e!265300 () Bool)

(assert (=> b!453253 (= e!265301 e!265300)))

(declare-fun c!56174 () Bool)

(assert (=> b!453253 (= c!56174 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(declare-fun b!453254 () Bool)

(declare-fun e!265305 () Bool)

(assert (=> b!453254 (= e!265301 e!265305)))

(assert (=> b!453254 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(declare-fun res!270049 () Bool)

(assert (=> b!453254 (= res!270049 (contains!2478 lt!205742 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453254 (=> (not res!270049) (not e!265305))))

(declare-fun b!453255 () Bool)

(declare-fun lt!205743 () Unit!13229)

(declare-fun lt!205744 () Unit!13229)

(assert (=> b!453255 (= lt!205743 lt!205744)))

(declare-fun lt!205745 () (_ BitVec 64))

(declare-fun lt!205740 () ListLongMap!6871)

(declare-fun lt!205746 () (_ BitVec 64))

(declare-fun lt!205741 () V!17291)

(assert (=> b!453255 (not (contains!2478 (+!1575 lt!205740 (tuple2!7957 lt!205746 lt!205741)) lt!205745))))

(assert (=> b!453255 (= lt!205744 (addStillNotContains!148 lt!205740 lt!205746 lt!205741 lt!205745))))

(assert (=> b!453255 (= lt!205745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453255 (= lt!205741 (get!6656 (select (arr!13482 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453255 (= lt!205746 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001)))))

(assert (=> b!453255 (= lt!205740 call!30037)))

(assert (=> b!453255 (= e!265304 (+!1575 call!30037 (tuple2!7957 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001)) (get!6656 (select (arr!13482 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453256 () Bool)

(declare-fun e!265299 () Bool)

(assert (=> b!453256 (= e!265299 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453256 (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453257 () Bool)

(assert (=> b!453257 (= e!265303 e!265301)))

(declare-fun c!56176 () Bool)

(assert (=> b!453257 (= c!56176 e!265299)))

(declare-fun res!270048 () Bool)

(assert (=> b!453257 (=> (not res!270048) (not e!265299))))

(assert (=> b!453257 (= res!270048 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(declare-fun b!453258 () Bool)

(assert (=> b!453258 (= e!265300 (isEmpty!565 lt!205742))))

(declare-fun b!453259 () Bool)

(assert (=> b!453259 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(assert (=> b!453259 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 _values!549)))))

(assert (=> b!453259 (= e!265305 (= (apply!313 lt!205742 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))) (get!6656 (select (arr!13482 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453260 () Bool)

(assert (=> b!453260 (= e!265304 call!30037)))

(declare-fun d!74409 () Bool)

(assert (=> d!74409 e!265303))

(declare-fun res!270051 () Bool)

(assert (=> d!74409 (=> (not res!270051) (not e!265303))))

(assert (=> d!74409 (= res!270051 (not (contains!2478 lt!205742 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74409 (= lt!205742 e!265302)))

(declare-fun c!56177 () Bool)

(assert (=> d!74409 (= c!56177 (bvsge (bvadd from!863 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(assert (=> d!74409 (validMask!0 mask!1025)))

(assert (=> d!74409 (= (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205742)))

(declare-fun b!453252 () Bool)

(assert (=> b!453252 (= e!265300 (= lt!205742 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74409 c!56177) b!453251))

(assert (= (and d!74409 (not c!56177)) b!453249))

(assert (= (and b!453249 c!56175) b!453255))

(assert (= (and b!453249 (not c!56175)) b!453260))

(assert (= (or b!453255 b!453260) bm!30034))

(assert (= (and d!74409 res!270051) b!453250))

(assert (= (and b!453250 res!270050) b!453257))

(assert (= (and b!453257 res!270048) b!453256))

(assert (= (and b!453257 c!56176) b!453254))

(assert (= (and b!453257 (not c!56176)) b!453253))

(assert (= (and b!453254 res!270049) b!453259))

(assert (= (and b!453253 c!56174) b!453252))

(assert (= (and b!453253 (not c!56174)) b!453258))

(declare-fun b_lambda!9641 () Bool)

(assert (=> (not b_lambda!9641) (not b!453255)))

(assert (=> b!453255 t!13838))

(declare-fun b_and!18931 () Bool)

(assert (= b_and!18929 (and (=> t!13838 result!7091) b_and!18931)))

(declare-fun b_lambda!9643 () Bool)

(assert (=> (not b_lambda!9643) (not b!453259)))

(assert (=> b!453259 t!13838))

(declare-fun b_and!18933 () Bool)

(assert (= b_and!18931 (and (=> t!13838 result!7091) b_and!18933)))

(declare-fun m!437445 () Bool)

(assert (=> bm!30034 m!437445))

(declare-fun m!437447 () Bool)

(assert (=> b!453258 m!437447))

(declare-fun m!437449 () Bool)

(assert (=> b!453254 m!437449))

(assert (=> b!453254 m!437449))

(declare-fun m!437451 () Bool)

(assert (=> b!453254 m!437451))

(declare-fun m!437453 () Bool)

(assert (=> b!453250 m!437453))

(assert (=> b!453252 m!437445))

(declare-fun m!437455 () Bool)

(assert (=> b!453259 m!437455))

(assert (=> b!453259 m!437019))

(declare-fun m!437457 () Bool)

(assert (=> b!453259 m!437457))

(assert (=> b!453259 m!437449))

(declare-fun m!437459 () Bool)

(assert (=> b!453259 m!437459))

(assert (=> b!453259 m!437455))

(assert (=> b!453259 m!437019))

(assert (=> b!453259 m!437449))

(assert (=> b!453255 m!437455))

(assert (=> b!453255 m!437019))

(assert (=> b!453255 m!437457))

(declare-fun m!437461 () Bool)

(assert (=> b!453255 m!437461))

(assert (=> b!453255 m!437455))

(assert (=> b!453255 m!437019))

(declare-fun m!437463 () Bool)

(assert (=> b!453255 m!437463))

(assert (=> b!453255 m!437461))

(declare-fun m!437465 () Bool)

(assert (=> b!453255 m!437465))

(assert (=> b!453255 m!437449))

(declare-fun m!437467 () Bool)

(assert (=> b!453255 m!437467))

(declare-fun m!437469 () Bool)

(assert (=> d!74409 m!437469))

(assert (=> d!74409 m!436979))

(assert (=> b!453249 m!437449))

(assert (=> b!453249 m!437449))

(declare-fun m!437471 () Bool)

(assert (=> b!453249 m!437471))

(assert (=> b!453256 m!437449))

(assert (=> b!453256 m!437449))

(assert (=> b!453256 m!437471))

(assert (=> bm!30033 d!74409))

(declare-fun d!74411 () Bool)

(declare-fun e!265306 () Bool)

(assert (=> d!74411 e!265306))

(declare-fun res!270052 () Bool)

(assert (=> d!74411 (=> (not res!270052) (not e!265306))))

(declare-fun lt!205748 () ListLongMap!6871)

(assert (=> d!74411 (= res!270052 (contains!2478 lt!205748 (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205747 () List!8023)

(assert (=> d!74411 (= lt!205748 (ListLongMap!6872 lt!205747))))

(declare-fun lt!205749 () Unit!13229)

(declare-fun lt!205750 () Unit!13229)

(assert (=> d!74411 (= lt!205749 lt!205750)))

(assert (=> d!74411 (= (getValueByKey!371 lt!205747 (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74411 (= lt!205750 (lemmaContainsTupThenGetReturnValue!193 lt!205747 (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74411 (= lt!205747 (insertStrictlySorted!196 (toList!3451 call!30027) (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74411 (= (+!1575 call!30027 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205748)))

(declare-fun b!453261 () Bool)

(declare-fun res!270053 () Bool)

(assert (=> b!453261 (=> (not res!270053) (not e!265306))))

(assert (=> b!453261 (= res!270053 (= (getValueByKey!371 (toList!3451 lt!205748) (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453262 () Bool)

(assert (=> b!453262 (= e!265306 (contains!2479 (toList!3451 lt!205748) (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74411 res!270052) b!453261))

(assert (= (and b!453261 res!270053) b!453262))

(declare-fun m!437473 () Bool)

(assert (=> d!74411 m!437473))

(declare-fun m!437475 () Bool)

(assert (=> d!74411 m!437475))

(declare-fun m!437477 () Bool)

(assert (=> d!74411 m!437477))

(declare-fun m!437479 () Bool)

(assert (=> d!74411 m!437479))

(declare-fun m!437481 () Bool)

(assert (=> b!453261 m!437481))

(declare-fun m!437483 () Bool)

(assert (=> b!453262 m!437483))

(assert (=> b!453188 d!74411))

(declare-fun d!74413 () Bool)

(declare-fun e!265311 () Bool)

(assert (=> d!74413 e!265311))

(declare-fun res!270056 () Bool)

(assert (=> d!74413 (=> res!270056 e!265311)))

(declare-fun lt!205760 () Bool)

(assert (=> d!74413 (= res!270056 (not lt!205760))))

(declare-fun lt!205761 () Bool)

(assert (=> d!74413 (= lt!205760 lt!205761)))

(declare-fun lt!205762 () Unit!13229)

(declare-fun e!265312 () Unit!13229)

(assert (=> d!74413 (= lt!205762 e!265312)))

(declare-fun c!56180 () Bool)

(assert (=> d!74413 (= c!56180 lt!205761)))

(declare-fun containsKey!347 (List!8023 (_ BitVec 64)) Bool)

(assert (=> d!74413 (= lt!205761 (containsKey!347 (toList!3451 (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710))) lt!205714))))

(assert (=> d!74413 (= (contains!2478 (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710)) lt!205714) lt!205760)))

(declare-fun b!453269 () Bool)

(declare-fun lt!205759 () Unit!13229)

(assert (=> b!453269 (= e!265312 lt!205759)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!295 (List!8023 (_ BitVec 64)) Unit!13229)

(assert (=> b!453269 (= lt!205759 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710))) lt!205714))))

(declare-fun isDefined!296 (Option!377) Bool)

(assert (=> b!453269 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710))) lt!205714))))

(declare-fun b!453270 () Bool)

(declare-fun Unit!13235 () Unit!13229)

(assert (=> b!453270 (= e!265312 Unit!13235)))

(declare-fun b!453271 () Bool)

(assert (=> b!453271 (= e!265311 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710))) lt!205714)))))

(assert (= (and d!74413 c!56180) b!453269))

(assert (= (and d!74413 (not c!56180)) b!453270))

(assert (= (and d!74413 (not res!270056)) b!453271))

(declare-fun m!437485 () Bool)

(assert (=> d!74413 m!437485))

(declare-fun m!437487 () Bool)

(assert (=> b!453269 m!437487))

(declare-fun m!437489 () Bool)

(assert (=> b!453269 m!437489))

(assert (=> b!453269 m!437489))

(declare-fun m!437491 () Bool)

(assert (=> b!453269 m!437491))

(assert (=> b!453271 m!437489))

(assert (=> b!453271 m!437489))

(assert (=> b!453271 m!437491))

(assert (=> b!453188 d!74413))

(declare-fun d!74415 () Bool)

(declare-fun e!265313 () Bool)

(assert (=> d!74415 e!265313))

(declare-fun res!270057 () Bool)

(assert (=> d!74415 (=> (not res!270057) (not e!265313))))

(declare-fun lt!205764 () ListLongMap!6871)

(assert (=> d!74415 (= res!270057 (contains!2478 lt!205764 (_1!3989 (tuple2!7957 lt!205715 lt!205710))))))

(declare-fun lt!205763 () List!8023)

(assert (=> d!74415 (= lt!205764 (ListLongMap!6872 lt!205763))))

(declare-fun lt!205765 () Unit!13229)

(declare-fun lt!205766 () Unit!13229)

(assert (=> d!74415 (= lt!205765 lt!205766)))

(assert (=> d!74415 (= (getValueByKey!371 lt!205763 (_1!3989 (tuple2!7957 lt!205715 lt!205710))) (Some!376 (_2!3989 (tuple2!7957 lt!205715 lt!205710))))))

(assert (=> d!74415 (= lt!205766 (lemmaContainsTupThenGetReturnValue!193 lt!205763 (_1!3989 (tuple2!7957 lt!205715 lt!205710)) (_2!3989 (tuple2!7957 lt!205715 lt!205710))))))

(assert (=> d!74415 (= lt!205763 (insertStrictlySorted!196 (toList!3451 lt!205709) (_1!3989 (tuple2!7957 lt!205715 lt!205710)) (_2!3989 (tuple2!7957 lt!205715 lt!205710))))))

(assert (=> d!74415 (= (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710)) lt!205764)))

(declare-fun b!453272 () Bool)

(declare-fun res!270058 () Bool)

(assert (=> b!453272 (=> (not res!270058) (not e!265313))))

(assert (=> b!453272 (= res!270058 (= (getValueByKey!371 (toList!3451 lt!205764) (_1!3989 (tuple2!7957 lt!205715 lt!205710))) (Some!376 (_2!3989 (tuple2!7957 lt!205715 lt!205710)))))))

(declare-fun b!453273 () Bool)

(assert (=> b!453273 (= e!265313 (contains!2479 (toList!3451 lt!205764) (tuple2!7957 lt!205715 lt!205710)))))

(assert (= (and d!74415 res!270057) b!453272))

(assert (= (and b!453272 res!270058) b!453273))

(declare-fun m!437493 () Bool)

(assert (=> d!74415 m!437493))

(declare-fun m!437495 () Bool)

(assert (=> d!74415 m!437495))

(declare-fun m!437497 () Bool)

(assert (=> d!74415 m!437497))

(declare-fun m!437499 () Bool)

(assert (=> d!74415 m!437499))

(declare-fun m!437501 () Bool)

(assert (=> b!453272 m!437501))

(declare-fun m!437503 () Bool)

(assert (=> b!453273 m!437503))

(assert (=> b!453188 d!74415))

(assert (=> b!453188 d!74403))

(declare-fun d!74417 () Bool)

(assert (=> d!74417 (not (contains!2478 (+!1575 lt!205709 (tuple2!7957 lt!205715 lt!205710)) lt!205714))))

(declare-fun lt!205769 () Unit!13229)

(declare-fun choose!1336 (ListLongMap!6871 (_ BitVec 64) V!17291 (_ BitVec 64)) Unit!13229)

(assert (=> d!74417 (= lt!205769 (choose!1336 lt!205709 lt!205715 lt!205710 lt!205714))))

(declare-fun e!265316 () Bool)

(assert (=> d!74417 e!265316))

(declare-fun res!270061 () Bool)

(assert (=> d!74417 (=> (not res!270061) (not e!265316))))

(assert (=> d!74417 (= res!270061 (not (contains!2478 lt!205709 lt!205714)))))

(assert (=> d!74417 (= (addStillNotContains!148 lt!205709 lt!205715 lt!205710 lt!205714) lt!205769)))

(declare-fun b!453277 () Bool)

(assert (=> b!453277 (= e!265316 (not (= lt!205715 lt!205714)))))

(assert (= (and d!74417 res!270061) b!453277))

(assert (=> d!74417 m!437343))

(assert (=> d!74417 m!437343))

(assert (=> d!74417 m!437347))

(declare-fun m!437505 () Bool)

(assert (=> d!74417 m!437505))

(declare-fun m!437507 () Bool)

(assert (=> d!74417 m!437507))

(assert (=> b!453188 d!74417))

(declare-fun d!74419 () Bool)

(declare-fun e!265317 () Bool)

(assert (=> d!74419 e!265317))

(declare-fun res!270062 () Bool)

(assert (=> d!74419 (=> res!270062 e!265317)))

(declare-fun lt!205771 () Bool)

(assert (=> d!74419 (= res!270062 (not lt!205771))))

(declare-fun lt!205772 () Bool)

(assert (=> d!74419 (= lt!205771 lt!205772)))

(declare-fun lt!205773 () Unit!13229)

(declare-fun e!265318 () Unit!13229)

(assert (=> d!74419 (= lt!205773 e!265318)))

(declare-fun c!56181 () Bool)

(assert (=> d!74419 (= c!56181 lt!205772)))

(assert (=> d!74419 (= lt!205772 (containsKey!347 (toList!3451 lt!205728) (select (arr!13481 lt!205566) from!863)))))

(assert (=> d!74419 (= (contains!2478 lt!205728 (select (arr!13481 lt!205566) from!863)) lt!205771)))

(declare-fun b!453278 () Bool)

(declare-fun lt!205770 () Unit!13229)

(assert (=> b!453278 (= e!265318 lt!205770)))

(assert (=> b!453278 (= lt!205770 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205728) (select (arr!13481 lt!205566) from!863)))))

(assert (=> b!453278 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205728) (select (arr!13481 lt!205566) from!863)))))

(declare-fun b!453279 () Bool)

(declare-fun Unit!13236 () Unit!13229)

(assert (=> b!453279 (= e!265318 Unit!13236)))

(declare-fun b!453280 () Bool)

(assert (=> b!453280 (= e!265317 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205728) (select (arr!13481 lt!205566) from!863))))))

(assert (= (and d!74419 c!56181) b!453278))

(assert (= (and d!74419 (not c!56181)) b!453279))

(assert (= (and d!74419 (not res!270062)) b!453280))

(assert (=> d!74419 m!437031))

(declare-fun m!437509 () Bool)

(assert (=> d!74419 m!437509))

(assert (=> b!453278 m!437031))

(declare-fun m!437511 () Bool)

(assert (=> b!453278 m!437511))

(assert (=> b!453278 m!437031))

(declare-fun m!437513 () Bool)

(assert (=> b!453278 m!437513))

(assert (=> b!453278 m!437513))

(declare-fun m!437515 () Bool)

(assert (=> b!453278 m!437515))

(assert (=> b!453280 m!437031))

(assert (=> b!453280 m!437513))

(assert (=> b!453280 m!437513))

(assert (=> b!453280 m!437515))

(assert (=> b!453220 d!74419))

(declare-fun d!74421 () Bool)

(declare-fun e!265319 () Bool)

(assert (=> d!74421 e!265319))

(declare-fun res!270063 () Bool)

(assert (=> d!74421 (=> res!270063 e!265319)))

(declare-fun lt!205775 () Bool)

(assert (=> d!74421 (= res!270063 (not lt!205775))))

(declare-fun lt!205776 () Bool)

(assert (=> d!74421 (= lt!205775 lt!205776)))

(declare-fun lt!205777 () Unit!13229)

(declare-fun e!265320 () Unit!13229)

(assert (=> d!74421 (= lt!205777 e!265320)))

(declare-fun c!56182 () Bool)

(assert (=> d!74421 (= c!56182 lt!205776)))

(assert (=> d!74421 (= lt!205776 (containsKey!347 (toList!3451 lt!205735) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74421 (= (contains!2478 lt!205735 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205775)))

(declare-fun b!453281 () Bool)

(declare-fun lt!205774 () Unit!13229)

(assert (=> b!453281 (= e!265320 lt!205774)))

(assert (=> b!453281 (= lt!205774 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205735) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453281 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205735) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453282 () Bool)

(declare-fun Unit!13237 () Unit!13229)

(assert (=> b!453282 (= e!265320 Unit!13237)))

(declare-fun b!453283 () Bool)

(assert (=> b!453283 (= e!265319 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205735) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74421 c!56182) b!453281))

(assert (= (and d!74421 (not c!56182)) b!453282))

(assert (= (and d!74421 (not res!270063)) b!453283))

(declare-fun m!437517 () Bool)

(assert (=> d!74421 m!437517))

(declare-fun m!437519 () Bool)

(assert (=> b!453281 m!437519))

(declare-fun m!437521 () Bool)

(assert (=> b!453281 m!437521))

(assert (=> b!453281 m!437521))

(declare-fun m!437523 () Bool)

(assert (=> b!453281 m!437523))

(assert (=> b!453283 m!437521))

(assert (=> b!453283 m!437521))

(assert (=> b!453283 m!437523))

(assert (=> d!74397 d!74421))

(assert (=> d!74397 d!74389))

(declare-fun d!74423 () Bool)

(declare-fun e!265321 () Bool)

(assert (=> d!74423 e!265321))

(declare-fun res!270064 () Bool)

(assert (=> d!74423 (=> res!270064 e!265321)))

(declare-fun lt!205779 () Bool)

(assert (=> d!74423 (= res!270064 (not lt!205779))))

(declare-fun lt!205780 () Bool)

(assert (=> d!74423 (= lt!205779 lt!205780)))

(declare-fun lt!205781 () Unit!13229)

(declare-fun e!265322 () Unit!13229)

(assert (=> d!74423 (= lt!205781 e!265322)))

(declare-fun c!56183 () Bool)

(assert (=> d!74423 (= c!56183 lt!205780)))

(assert (=> d!74423 (= lt!205780 (containsKey!347 (toList!3451 lt!205704) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74423 (= (contains!2478 lt!205704 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205779)))

(declare-fun b!453284 () Bool)

(declare-fun lt!205778 () Unit!13229)

(assert (=> b!453284 (= e!265322 lt!205778)))

(assert (=> b!453284 (= lt!205778 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205704) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453284 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205704) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453285 () Bool)

(declare-fun Unit!13238 () Unit!13229)

(assert (=> b!453285 (= e!265322 Unit!13238)))

(declare-fun b!453286 () Bool)

(assert (=> b!453286 (= e!265321 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205704) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74423 c!56183) b!453284))

(assert (= (and d!74423 (not c!56183)) b!453285))

(assert (= (and d!74423 (not res!270064)) b!453286))

(declare-fun m!437525 () Bool)

(assert (=> d!74423 m!437525))

(declare-fun m!437527 () Bool)

(assert (=> b!453284 m!437527))

(declare-fun m!437529 () Bool)

(assert (=> b!453284 m!437529))

(assert (=> b!453284 m!437529))

(declare-fun m!437531 () Bool)

(assert (=> b!453284 m!437531))

(assert (=> b!453286 m!437529))

(assert (=> b!453286 m!437529))

(assert (=> b!453286 m!437531))

(assert (=> d!74373 d!74423))

(assert (=> d!74373 d!74389))

(declare-fun d!74425 () Bool)

(assert (=> d!74425 (= (validKeyInArray!0 (select (arr!13481 lt!205566) #b00000000000000000000000000000000)) (and (not (= (select (arr!13481 lt!205566) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 lt!205566) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453194 d!74425))

(declare-fun b!453295 () Bool)

(declare-fun e!265327 () Option!377)

(assert (=> b!453295 (= e!265327 (Some!376 (_2!3989 (h!8875 (toList!3451 lt!205720)))))))

(declare-fun c!56188 () Bool)

(declare-fun d!74427 () Bool)

(assert (=> d!74427 (= c!56188 (and ((_ is Cons!8019) (toList!3451 lt!205720)) (= (_1!3989 (h!8875 (toList!3451 lt!205720))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (=> d!74427 (= (getValueByKey!371 (toList!3451 lt!205720) (_1!3989 (tuple2!7957 k0!794 v!412))) e!265327)))

(declare-fun b!453296 () Bool)

(declare-fun e!265328 () Option!377)

(assert (=> b!453296 (= e!265327 e!265328)))

(declare-fun c!56189 () Bool)

(assert (=> b!453296 (= c!56189 (and ((_ is Cons!8019) (toList!3451 lt!205720)) (not (= (_1!3989 (h!8875 (toList!3451 lt!205720))) (_1!3989 (tuple2!7957 k0!794 v!412))))))))

(declare-fun b!453297 () Bool)

(assert (=> b!453297 (= e!265328 (getValueByKey!371 (t!13839 (toList!3451 lt!205720)) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453298 () Bool)

(assert (=> b!453298 (= e!265328 None!375)))

(assert (= (and d!74427 c!56188) b!453295))

(assert (= (and d!74427 (not c!56188)) b!453296))

(assert (= (and b!453296 c!56189) b!453297))

(assert (= (and b!453296 (not c!56189)) b!453298))

(declare-fun m!437533 () Bool)

(assert (=> b!453297 m!437533))

(assert (=> b!453198 d!74427))

(declare-fun b!453299 () Bool)

(declare-fun e!265332 () ListLongMap!6871)

(declare-fun e!265334 () ListLongMap!6871)

(assert (=> b!453299 (= e!265332 e!265334)))

(declare-fun c!56191 () Bool)

(assert (=> b!453299 (= c!56191 (validKeyInArray!0 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun call!30038 () ListLongMap!6871)

(declare-fun bm!30035 () Bool)

(assert (=> bm!30035 (= call!30038 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 _keys!709 lt!205566) (ite c!56123 _values!549 lt!205573) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453300 () Bool)

(declare-fun res!270067 () Bool)

(declare-fun e!265333 () Bool)

(assert (=> b!453300 (=> (not res!270067) (not e!265333))))

(declare-fun lt!205784 () ListLongMap!6871)

(assert (=> b!453300 (= res!270067 (not (contains!2478 lt!205784 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453301 () Bool)

(assert (=> b!453301 (= e!265332 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453303 () Bool)

(declare-fun e!265331 () Bool)

(declare-fun e!265330 () Bool)

(assert (=> b!453303 (= e!265331 e!265330)))

(declare-fun c!56190 () Bool)

(assert (=> b!453303 (= c!56190 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(declare-fun b!453304 () Bool)

(declare-fun e!265335 () Bool)

(assert (=> b!453304 (= e!265331 e!265335)))

(assert (=> b!453304 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(declare-fun res!270066 () Bool)

(assert (=> b!453304 (= res!270066 (contains!2478 lt!205784 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453304 (=> (not res!270066) (not e!265335))))

(declare-fun b!453305 () Bool)

(declare-fun lt!205785 () Unit!13229)

(declare-fun lt!205786 () Unit!13229)

(assert (=> b!453305 (= lt!205785 lt!205786)))

(declare-fun lt!205787 () (_ BitVec 64))

(declare-fun lt!205782 () ListLongMap!6871)

(declare-fun lt!205783 () V!17291)

(declare-fun lt!205788 () (_ BitVec 64))

(assert (=> b!453305 (not (contains!2478 (+!1575 lt!205782 (tuple2!7957 lt!205788 lt!205783)) lt!205787))))

(assert (=> b!453305 (= lt!205786 (addStillNotContains!148 lt!205782 lt!205788 lt!205783 lt!205787))))

(assert (=> b!453305 (= lt!205787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453305 (= lt!205783 (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453305 (= lt!205788 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(assert (=> b!453305 (= lt!205782 call!30038)))

(assert (=> b!453305 (= e!265334 (+!1575 call!30038 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453306 () Bool)

(declare-fun e!265329 () Bool)

(assert (=> b!453306 (= e!265329 (validKeyInArray!0 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453306 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453307 () Bool)

(assert (=> b!453307 (= e!265333 e!265331)))

(declare-fun c!56192 () Bool)

(assert (=> b!453307 (= c!56192 e!265329)))

(declare-fun res!270065 () Bool)

(assert (=> b!453307 (=> (not res!270065) (not e!265329))))

(assert (=> b!453307 (= res!270065 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(declare-fun b!453308 () Bool)

(assert (=> b!453308 (= e!265330 (isEmpty!565 lt!205784))))

(declare-fun b!453309 () Bool)

(assert (=> b!453309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(assert (=> b!453309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56123 _values!549 lt!205573))))))

(assert (=> b!453309 (= e!265335 (= (apply!313 lt!205784 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453310 () Bool)

(assert (=> b!453310 (= e!265334 call!30038)))

(declare-fun d!74429 () Bool)

(assert (=> d!74429 e!265333))

(declare-fun res!270068 () Bool)

(assert (=> d!74429 (=> (not res!270068) (not e!265333))))

(assert (=> d!74429 (= res!270068 (not (contains!2478 lt!205784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74429 (= lt!205784 e!265332)))

(declare-fun c!56193 () Bool)

(assert (=> d!74429 (= c!56193 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 _keys!709 lt!205566))))))

(assert (=> d!74429 (validMask!0 mask!1025)))

(assert (=> d!74429 (= (getCurrentListMapNoExtraKeys!1680 (ite c!56123 _keys!709 lt!205566) (ite c!56123 _values!549 lt!205573) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205784)))

(declare-fun b!453302 () Bool)

(assert (=> b!453302 (= e!265330 (= lt!205784 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 _keys!709 lt!205566) (ite c!56123 _values!549 lt!205573) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74429 c!56193) b!453301))

(assert (= (and d!74429 (not c!56193)) b!453299))

(assert (= (and b!453299 c!56191) b!453305))

(assert (= (and b!453299 (not c!56191)) b!453310))

(assert (= (or b!453305 b!453310) bm!30035))

(assert (= (and d!74429 res!270068) b!453300))

(assert (= (and b!453300 res!270067) b!453307))

(assert (= (and b!453307 res!270065) b!453306))

(assert (= (and b!453307 c!56192) b!453304))

(assert (= (and b!453307 (not c!56192)) b!453303))

(assert (= (and b!453304 res!270066) b!453309))

(assert (= (and b!453303 c!56190) b!453302))

(assert (= (and b!453303 (not c!56190)) b!453308))

(declare-fun b_lambda!9645 () Bool)

(assert (=> (not b_lambda!9645) (not b!453305)))

(assert (=> b!453305 t!13838))

(declare-fun b_and!18935 () Bool)

(assert (= b_and!18933 (and (=> t!13838 result!7091) b_and!18935)))

(declare-fun b_lambda!9647 () Bool)

(assert (=> (not b_lambda!9647) (not b!453309)))

(assert (=> b!453309 t!13838))

(declare-fun b_and!18937 () Bool)

(assert (= b_and!18935 (and (=> t!13838 result!7091) b_and!18937)))

(declare-fun m!437535 () Bool)

(assert (=> bm!30035 m!437535))

(declare-fun m!437537 () Bool)

(assert (=> b!453308 m!437537))

(declare-fun m!437539 () Bool)

(assert (=> b!453304 m!437539))

(assert (=> b!453304 m!437539))

(declare-fun m!437541 () Bool)

(assert (=> b!453304 m!437541))

(declare-fun m!437543 () Bool)

(assert (=> b!453300 m!437543))

(assert (=> b!453302 m!437535))

(declare-fun m!437545 () Bool)

(assert (=> b!453309 m!437545))

(assert (=> b!453309 m!437019))

(declare-fun m!437547 () Bool)

(assert (=> b!453309 m!437547))

(assert (=> b!453309 m!437539))

(declare-fun m!437549 () Bool)

(assert (=> b!453309 m!437549))

(assert (=> b!453309 m!437545))

(assert (=> b!453309 m!437019))

(assert (=> b!453309 m!437539))

(assert (=> b!453305 m!437545))

(assert (=> b!453305 m!437019))

(assert (=> b!453305 m!437547))

(declare-fun m!437551 () Bool)

(assert (=> b!453305 m!437551))

(assert (=> b!453305 m!437545))

(assert (=> b!453305 m!437019))

(declare-fun m!437553 () Bool)

(assert (=> b!453305 m!437553))

(assert (=> b!453305 m!437551))

(declare-fun m!437555 () Bool)

(assert (=> b!453305 m!437555))

(assert (=> b!453305 m!437539))

(declare-fun m!437557 () Bool)

(assert (=> b!453305 m!437557))

(declare-fun m!437559 () Bool)

(assert (=> d!74429 m!437559))

(assert (=> d!74429 m!436979))

(assert (=> b!453299 m!437539))

(assert (=> b!453299 m!437539))

(declare-fun m!437561 () Bool)

(assert (=> b!453299 m!437561))

(assert (=> b!453306 m!437539))

(assert (=> b!453306 m!437539))

(assert (=> b!453306 m!437561))

(assert (=> bm!30018 d!74429))

(declare-fun b!453311 () Bool)

(declare-fun e!265339 () ListLongMap!6871)

(declare-fun e!265341 () ListLongMap!6871)

(assert (=> b!453311 (= e!265339 e!265341)))

(declare-fun c!56195 () Bool)

(assert (=> b!453311 (= c!56195 (validKeyInArray!0 (select (arr!13481 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun bm!30036 () Bool)

(declare-fun call!30039 () ListLongMap!6871)

(assert (=> bm!30036 (= call!30039 (getCurrentListMapNoExtraKeys!1680 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)) (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453312 () Bool)

(declare-fun res!270071 () Bool)

(declare-fun e!265340 () Bool)

(assert (=> b!453312 (=> (not res!270071) (not e!265340))))

(declare-fun lt!205791 () ListLongMap!6871)

(assert (=> b!453312 (= res!270071 (not (contains!2478 lt!205791 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453313 () Bool)

(assert (=> b!453313 (= e!265339 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453315 () Bool)

(declare-fun e!265338 () Bool)

(declare-fun e!265337 () Bool)

(assert (=> b!453315 (= e!265338 e!265337)))

(declare-fun c!56194 () Bool)

(assert (=> b!453315 (= c!56194 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)))))))

(declare-fun b!453316 () Bool)

(declare-fun e!265342 () Bool)

(assert (=> b!453316 (= e!265338 e!265342)))

(assert (=> b!453316 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)))))))

(declare-fun res!270070 () Bool)

(assert (=> b!453316 (= res!270070 (contains!2478 lt!205791 (select (arr!13481 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453316 (=> (not res!270070) (not e!265342))))

(declare-fun b!453317 () Bool)

(declare-fun lt!205792 () Unit!13229)

(declare-fun lt!205793 () Unit!13229)

(assert (=> b!453317 (= lt!205792 lt!205793)))

(declare-fun lt!205795 () (_ BitVec 64))

(declare-fun lt!205790 () V!17291)

(declare-fun lt!205789 () ListLongMap!6871)

(declare-fun lt!205794 () (_ BitVec 64))

(assert (=> b!453317 (not (contains!2478 (+!1575 lt!205789 (tuple2!7957 lt!205795 lt!205790)) lt!205794))))

(assert (=> b!453317 (= lt!205793 (addStillNotContains!148 lt!205789 lt!205795 lt!205790 lt!205794))))

(assert (=> b!453317 (= lt!205794 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453317 (= lt!205790 (get!6656 (select (arr!13482 (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453317 (= lt!205795 (select (arr!13481 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!453317 (= lt!205789 call!30039)))

(assert (=> b!453317 (= e!265341 (+!1575 call!30039 (tuple2!7957 (select (arr!13481 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453318 () Bool)

(declare-fun e!265336 () Bool)

(assert (=> b!453318 (= e!265336 (validKeyInArray!0 (select (arr!13481 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453318 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453319 () Bool)

(assert (=> b!453319 (= e!265340 e!265338)))

(declare-fun c!56196 () Bool)

(assert (=> b!453319 (= c!56196 e!265336)))

(declare-fun res!270069 () Bool)

(assert (=> b!453319 (=> (not res!270069) (not e!265336))))

(assert (=> b!453319 (= res!270069 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)))))))

(declare-fun b!453320 () Bool)

(assert (=> b!453320 (= e!265337 (isEmpty!565 lt!205791))))

(declare-fun b!453321 () Bool)

(assert (=> b!453321 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)))))))

(assert (=> b!453321 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549)))))))

(assert (=> b!453321 (= e!265342 (= (apply!313 lt!205791 (select (arr!13481 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (select (arr!13482 (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453322 () Bool)

(assert (=> b!453322 (= e!265341 call!30039)))

(declare-fun d!74431 () Bool)

(assert (=> d!74431 e!265340))

(declare-fun res!270072 () Bool)

(assert (=> d!74431 (=> (not res!270072) (not e!265340))))

(assert (=> d!74431 (= res!270072 (not (contains!2478 lt!205791 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74431 (= lt!205791 e!265339)))

(declare-fun c!56197 () Bool)

(assert (=> d!74431 (= c!56197 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13833 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)))))))

(assert (=> d!74431 (validMask!0 mask!1025)))

(assert (=> d!74431 (= (getCurrentListMapNoExtraKeys!1680 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)) (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205791)))

(declare-fun b!453314 () Bool)

(assert (=> b!453314 (= e!265337 (= lt!205791 (getCurrentListMapNoExtraKeys!1680 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)) (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74431 c!56197) b!453313))

(assert (= (and d!74431 (not c!56197)) b!453311))

(assert (= (and b!453311 c!56195) b!453317))

(assert (= (and b!453311 (not c!56195)) b!453322))

(assert (= (or b!453317 b!453322) bm!30036))

(assert (= (and d!74431 res!270072) b!453312))

(assert (= (and b!453312 res!270071) b!453319))

(assert (= (and b!453319 res!270069) b!453318))

(assert (= (and b!453319 c!56196) b!453316))

(assert (= (and b!453319 (not c!56196)) b!453315))

(assert (= (and b!453316 res!270070) b!453321))

(assert (= (and b!453315 c!56194) b!453314))

(assert (= (and b!453315 (not c!56194)) b!453320))

(declare-fun b_lambda!9649 () Bool)

(assert (=> (not b_lambda!9649) (not b!453317)))

(assert (=> b!453317 t!13838))

(declare-fun b_and!18939 () Bool)

(assert (= b_and!18937 (and (=> t!13838 result!7091) b_and!18939)))

(declare-fun b_lambda!9651 () Bool)

(assert (=> (not b_lambda!9651) (not b!453321)))

(assert (=> b!453321 t!13838))

(declare-fun b_and!18941 () Bool)

(assert (= b_and!18939 (and (=> t!13838 result!7091) b_and!18941)))

(declare-fun m!437563 () Bool)

(assert (=> bm!30036 m!437563))

(declare-fun m!437565 () Bool)

(assert (=> b!453320 m!437565))

(declare-fun m!437567 () Bool)

(assert (=> b!453316 m!437567))

(assert (=> b!453316 m!437567))

(declare-fun m!437569 () Bool)

(assert (=> b!453316 m!437569))

(declare-fun m!437571 () Bool)

(assert (=> b!453312 m!437571))

(assert (=> b!453314 m!437563))

(declare-fun m!437573 () Bool)

(assert (=> b!453321 m!437573))

(assert (=> b!453321 m!437019))

(declare-fun m!437575 () Bool)

(assert (=> b!453321 m!437575))

(assert (=> b!453321 m!437567))

(declare-fun m!437577 () Bool)

(assert (=> b!453321 m!437577))

(assert (=> b!453321 m!437573))

(assert (=> b!453321 m!437019))

(assert (=> b!453321 m!437567))

(assert (=> b!453317 m!437573))

(assert (=> b!453317 m!437019))

(assert (=> b!453317 m!437575))

(declare-fun m!437579 () Bool)

(assert (=> b!453317 m!437579))

(assert (=> b!453317 m!437573))

(assert (=> b!453317 m!437019))

(declare-fun m!437581 () Bool)

(assert (=> b!453317 m!437581))

(assert (=> b!453317 m!437579))

(declare-fun m!437583 () Bool)

(assert (=> b!453317 m!437583))

(assert (=> b!453317 m!437567))

(declare-fun m!437585 () Bool)

(assert (=> b!453317 m!437585))

(declare-fun m!437587 () Bool)

(assert (=> d!74431 m!437587))

(assert (=> d!74431 m!436979))

(assert (=> b!453311 m!437567))

(assert (=> b!453311 m!437567))

(declare-fun m!437589 () Bool)

(assert (=> b!453311 m!437589))

(assert (=> b!453318 m!437567))

(assert (=> b!453318 m!437567))

(assert (=> b!453318 m!437589))

(assert (=> bm!30030 d!74431))

(declare-fun d!74433 () Bool)

(declare-fun e!265343 () Bool)

(assert (=> d!74433 e!265343))

(declare-fun res!270073 () Bool)

(assert (=> d!74433 (=> res!270073 e!265343)))

(declare-fun lt!205797 () Bool)

(assert (=> d!74433 (= res!270073 (not lt!205797))))

(declare-fun lt!205798 () Bool)

(assert (=> d!74433 (= lt!205797 lt!205798)))

(declare-fun lt!205799 () Unit!13229)

(declare-fun e!265344 () Unit!13229)

(assert (=> d!74433 (= lt!205799 e!265344)))

(declare-fun c!56198 () Bool)

(assert (=> d!74433 (= c!56198 lt!205798)))

(assert (=> d!74433 (= lt!205798 (containsKey!347 (toList!3451 lt!205684) (_1!3989 lt!205564)))))

(assert (=> d!74433 (= (contains!2478 lt!205684 (_1!3989 lt!205564)) lt!205797)))

(declare-fun b!453323 () Bool)

(declare-fun lt!205796 () Unit!13229)

(assert (=> b!453323 (= e!265344 lt!205796)))

(assert (=> b!453323 (= lt!205796 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205684) (_1!3989 lt!205564)))))

(assert (=> b!453323 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205684) (_1!3989 lt!205564)))))

(declare-fun b!453324 () Bool)

(declare-fun Unit!13239 () Unit!13229)

(assert (=> b!453324 (= e!265344 Unit!13239)))

(declare-fun b!453325 () Bool)

(assert (=> b!453325 (= e!265343 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205684) (_1!3989 lt!205564))))))

(assert (= (and d!74433 c!56198) b!453323))

(assert (= (and d!74433 (not c!56198)) b!453324))

(assert (= (and d!74433 (not res!270073)) b!453325))

(declare-fun m!437591 () Bool)

(assert (=> d!74433 m!437591))

(declare-fun m!437593 () Bool)

(assert (=> b!453323 m!437593))

(assert (=> b!453323 m!437249))

(assert (=> b!453323 m!437249))

(declare-fun m!437595 () Bool)

(assert (=> b!453323 m!437595))

(assert (=> b!453325 m!437249))

(assert (=> b!453325 m!437249))

(assert (=> b!453325 m!437595))

(assert (=> d!74361 d!74433))

(declare-fun b!453326 () Bool)

(declare-fun e!265345 () Option!377)

(assert (=> b!453326 (= e!265345 (Some!376 (_2!3989 (h!8875 lt!205683))))))

(declare-fun d!74435 () Bool)

(declare-fun c!56199 () Bool)

(assert (=> d!74435 (= c!56199 (and ((_ is Cons!8019) lt!205683) (= (_1!3989 (h!8875 lt!205683)) (_1!3989 lt!205564))))))

(assert (=> d!74435 (= (getValueByKey!371 lt!205683 (_1!3989 lt!205564)) e!265345)))

(declare-fun b!453327 () Bool)

(declare-fun e!265346 () Option!377)

(assert (=> b!453327 (= e!265345 e!265346)))

(declare-fun c!56200 () Bool)

(assert (=> b!453327 (= c!56200 (and ((_ is Cons!8019) lt!205683) (not (= (_1!3989 (h!8875 lt!205683)) (_1!3989 lt!205564)))))))

(declare-fun b!453328 () Bool)

(assert (=> b!453328 (= e!265346 (getValueByKey!371 (t!13839 lt!205683) (_1!3989 lt!205564)))))

(declare-fun b!453329 () Bool)

(assert (=> b!453329 (= e!265346 None!375)))

(assert (= (and d!74435 c!56199) b!453326))

(assert (= (and d!74435 (not c!56199)) b!453327))

(assert (= (and b!453327 c!56200) b!453328))

(assert (= (and b!453327 (not c!56200)) b!453329))

(declare-fun m!437597 () Bool)

(assert (=> b!453328 m!437597))

(assert (=> d!74361 d!74435))

(declare-fun d!74437 () Bool)

(assert (=> d!74437 (= (getValueByKey!371 lt!205683 (_1!3989 lt!205564)) (Some!376 (_2!3989 lt!205564)))))

(declare-fun lt!205802 () Unit!13229)

(declare-fun choose!1337 (List!8023 (_ BitVec 64) V!17291) Unit!13229)

(assert (=> d!74437 (= lt!205802 (choose!1337 lt!205683 (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(declare-fun e!265349 () Bool)

(assert (=> d!74437 e!265349))

(declare-fun res!270078 () Bool)

(assert (=> d!74437 (=> (not res!270078) (not e!265349))))

(declare-fun isStrictlySorted!365 (List!8023) Bool)

(assert (=> d!74437 (= res!270078 (isStrictlySorted!365 lt!205683))))

(assert (=> d!74437 (= (lemmaContainsTupThenGetReturnValue!193 lt!205683 (_1!3989 lt!205564) (_2!3989 lt!205564)) lt!205802)))

(declare-fun b!453334 () Bool)

(declare-fun res!270079 () Bool)

(assert (=> b!453334 (=> (not res!270079) (not e!265349))))

(assert (=> b!453334 (= res!270079 (containsKey!347 lt!205683 (_1!3989 lt!205564)))))

(declare-fun b!453335 () Bool)

(assert (=> b!453335 (= e!265349 (contains!2479 lt!205683 (tuple2!7957 (_1!3989 lt!205564) (_2!3989 lt!205564))))))

(assert (= (and d!74437 res!270078) b!453334))

(assert (= (and b!453334 res!270079) b!453335))

(assert (=> d!74437 m!437243))

(declare-fun m!437599 () Bool)

(assert (=> d!74437 m!437599))

(declare-fun m!437601 () Bool)

(assert (=> d!74437 m!437601))

(declare-fun m!437603 () Bool)

(assert (=> b!453334 m!437603))

(declare-fun m!437605 () Bool)

(assert (=> b!453335 m!437605))

(assert (=> d!74361 d!74437))

(declare-fun b!453356 () Bool)

(declare-fun e!265362 () List!8023)

(assert (=> b!453356 (= e!265362 (insertStrictlySorted!196 (t!13839 (toList!3451 lt!205567)) (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(declare-fun b!453358 () Bool)

(declare-fun e!265360 () List!8023)

(declare-fun e!265364 () List!8023)

(assert (=> b!453358 (= e!265360 e!265364)))

(declare-fun c!56211 () Bool)

(assert (=> b!453358 (= c!56211 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (= (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 lt!205564))))))

(declare-fun b!453359 () Bool)

(declare-fun c!56209 () Bool)

(assert (=> b!453359 (= c!56209 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (bvsgt (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 lt!205564))))))

(declare-fun e!265363 () List!8023)

(assert (=> b!453359 (= e!265364 e!265363)))

(declare-fun b!453360 () Bool)

(declare-fun call!30048 () List!8023)

(assert (=> b!453360 (= e!265364 call!30048)))

(declare-fun bm!30043 () Bool)

(declare-fun call!30046 () List!8023)

(assert (=> bm!30043 (= call!30048 call!30046)))

(declare-fun b!453361 () Bool)

(declare-fun call!30047 () List!8023)

(assert (=> b!453361 (= e!265363 call!30047)))

(declare-fun d!74439 () Bool)

(declare-fun e!265361 () Bool)

(assert (=> d!74439 e!265361))

(declare-fun res!270084 () Bool)

(assert (=> d!74439 (=> (not res!270084) (not e!265361))))

(declare-fun lt!205805 () List!8023)

(assert (=> d!74439 (= res!270084 (isStrictlySorted!365 lt!205805))))

(assert (=> d!74439 (= lt!205805 e!265360)))

(declare-fun c!56210 () Bool)

(assert (=> d!74439 (= c!56210 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (bvslt (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 lt!205564))))))

(assert (=> d!74439 (isStrictlySorted!365 (toList!3451 lt!205567))))

(assert (=> d!74439 (= (insertStrictlySorted!196 (toList!3451 lt!205567) (_1!3989 lt!205564) (_2!3989 lt!205564)) lt!205805)))

(declare-fun b!453357 () Bool)

(assert (=> b!453357 (= e!265360 call!30046)))

(declare-fun b!453362 () Bool)

(assert (=> b!453362 (= e!265363 call!30047)))

(declare-fun b!453363 () Bool)

(declare-fun res!270085 () Bool)

(assert (=> b!453363 (=> (not res!270085) (not e!265361))))

(assert (=> b!453363 (= res!270085 (containsKey!347 lt!205805 (_1!3989 lt!205564)))))

(declare-fun b!453364 () Bool)

(assert (=> b!453364 (= e!265361 (contains!2479 lt!205805 (tuple2!7957 (_1!3989 lt!205564) (_2!3989 lt!205564))))))

(declare-fun bm!30044 () Bool)

(assert (=> bm!30044 (= call!30047 call!30048)))

(declare-fun bm!30045 () Bool)

(declare-fun $colon$colon!108 (List!8023 tuple2!7956) List!8023)

(assert (=> bm!30045 (= call!30046 ($colon$colon!108 e!265362 (ite c!56210 (h!8875 (toList!3451 lt!205567)) (tuple2!7957 (_1!3989 lt!205564) (_2!3989 lt!205564)))))))

(declare-fun c!56212 () Bool)

(assert (=> bm!30045 (= c!56212 c!56210)))

(declare-fun b!453365 () Bool)

(assert (=> b!453365 (= e!265362 (ite c!56211 (t!13839 (toList!3451 lt!205567)) (ite c!56209 (Cons!8019 (h!8875 (toList!3451 lt!205567)) (t!13839 (toList!3451 lt!205567))) Nil!8020)))))

(assert (= (and d!74439 c!56210) b!453357))

(assert (= (and d!74439 (not c!56210)) b!453358))

(assert (= (and b!453358 c!56211) b!453360))

(assert (= (and b!453358 (not c!56211)) b!453359))

(assert (= (and b!453359 c!56209) b!453362))

(assert (= (and b!453359 (not c!56209)) b!453361))

(assert (= (or b!453362 b!453361) bm!30044))

(assert (= (or b!453360 bm!30044) bm!30043))

(assert (= (or b!453357 bm!30043) bm!30045))

(assert (= (and bm!30045 c!56212) b!453356))

(assert (= (and bm!30045 (not c!56212)) b!453365))

(assert (= (and d!74439 res!270084) b!453363))

(assert (= (and b!453363 res!270085) b!453364))

(declare-fun m!437607 () Bool)

(assert (=> b!453364 m!437607))

(declare-fun m!437609 () Bool)

(assert (=> b!453363 m!437609))

(declare-fun m!437611 () Bool)

(assert (=> b!453356 m!437611))

(declare-fun m!437613 () Bool)

(assert (=> d!74439 m!437613))

(declare-fun m!437615 () Bool)

(assert (=> d!74439 m!437615))

(declare-fun m!437617 () Bool)

(assert (=> bm!30045 m!437617))

(assert (=> d!74361 d!74439))

(declare-fun d!74441 () Bool)

(declare-fun e!265365 () Bool)

(assert (=> d!74441 e!265365))

(declare-fun res!270086 () Bool)

(assert (=> d!74441 (=> (not res!270086) (not e!265365))))

(declare-fun lt!205807 () ListLongMap!6871)

(assert (=> d!74441 (= res!270086 (contains!2478 lt!205807 (_1!3989 (tuple2!7957 lt!205739 lt!205734))))))

(declare-fun lt!205806 () List!8023)

(assert (=> d!74441 (= lt!205807 (ListLongMap!6872 lt!205806))))

(declare-fun lt!205808 () Unit!13229)

(declare-fun lt!205809 () Unit!13229)

(assert (=> d!74441 (= lt!205808 lt!205809)))

(assert (=> d!74441 (= (getValueByKey!371 lt!205806 (_1!3989 (tuple2!7957 lt!205739 lt!205734))) (Some!376 (_2!3989 (tuple2!7957 lt!205739 lt!205734))))))

(assert (=> d!74441 (= lt!205809 (lemmaContainsTupThenGetReturnValue!193 lt!205806 (_1!3989 (tuple2!7957 lt!205739 lt!205734)) (_2!3989 (tuple2!7957 lt!205739 lt!205734))))))

(assert (=> d!74441 (= lt!205806 (insertStrictlySorted!196 (toList!3451 lt!205733) (_1!3989 (tuple2!7957 lt!205739 lt!205734)) (_2!3989 (tuple2!7957 lt!205739 lt!205734))))))

(assert (=> d!74441 (= (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734)) lt!205807)))

(declare-fun b!453366 () Bool)

(declare-fun res!270087 () Bool)

(assert (=> b!453366 (=> (not res!270087) (not e!265365))))

(assert (=> b!453366 (= res!270087 (= (getValueByKey!371 (toList!3451 lt!205807) (_1!3989 (tuple2!7957 lt!205739 lt!205734))) (Some!376 (_2!3989 (tuple2!7957 lt!205739 lt!205734)))))))

(declare-fun b!453367 () Bool)

(assert (=> b!453367 (= e!265365 (contains!2479 (toList!3451 lt!205807) (tuple2!7957 lt!205739 lt!205734)))))

(assert (= (and d!74441 res!270086) b!453366))

(assert (= (and b!453366 res!270087) b!453367))

(declare-fun m!437619 () Bool)

(assert (=> d!74441 m!437619))

(declare-fun m!437621 () Bool)

(assert (=> d!74441 m!437621))

(declare-fun m!437623 () Bool)

(assert (=> d!74441 m!437623))

(declare-fun m!437625 () Bool)

(assert (=> d!74441 m!437625))

(declare-fun m!437627 () Bool)

(assert (=> b!453366 m!437627))

(declare-fun m!437629 () Bool)

(assert (=> b!453367 m!437629))

(assert (=> b!453233 d!74441))

(declare-fun d!74443 () Bool)

(declare-fun e!265366 () Bool)

(assert (=> d!74443 e!265366))

(declare-fun res!270088 () Bool)

(assert (=> d!74443 (=> res!270088 e!265366)))

(declare-fun lt!205811 () Bool)

(assert (=> d!74443 (= res!270088 (not lt!205811))))

(declare-fun lt!205812 () Bool)

(assert (=> d!74443 (= lt!205811 lt!205812)))

(declare-fun lt!205813 () Unit!13229)

(declare-fun e!265367 () Unit!13229)

(assert (=> d!74443 (= lt!205813 e!265367)))

(declare-fun c!56213 () Bool)

(assert (=> d!74443 (= c!56213 lt!205812)))

(assert (=> d!74443 (= lt!205812 (containsKey!347 (toList!3451 (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734))) lt!205738))))

(assert (=> d!74443 (= (contains!2478 (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734)) lt!205738) lt!205811)))

(declare-fun b!453368 () Bool)

(declare-fun lt!205810 () Unit!13229)

(assert (=> b!453368 (= e!265367 lt!205810)))

(assert (=> b!453368 (= lt!205810 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734))) lt!205738))))

(assert (=> b!453368 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734))) lt!205738))))

(declare-fun b!453369 () Bool)

(declare-fun Unit!13240 () Unit!13229)

(assert (=> b!453369 (= e!265367 Unit!13240)))

(declare-fun b!453370 () Bool)

(assert (=> b!453370 (= e!265366 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734))) lt!205738)))))

(assert (= (and d!74443 c!56213) b!453368))

(assert (= (and d!74443 (not c!56213)) b!453369))

(assert (= (and d!74443 (not res!270088)) b!453370))

(declare-fun m!437631 () Bool)

(assert (=> d!74443 m!437631))

(declare-fun m!437633 () Bool)

(assert (=> b!453368 m!437633))

(declare-fun m!437635 () Bool)

(assert (=> b!453368 m!437635))

(assert (=> b!453368 m!437635))

(declare-fun m!437637 () Bool)

(assert (=> b!453368 m!437637))

(assert (=> b!453370 m!437635))

(assert (=> b!453370 m!437635))

(assert (=> b!453370 m!437637))

(assert (=> b!453233 d!74443))

(declare-fun d!74445 () Bool)

(assert (=> d!74445 (not (contains!2478 (+!1575 lt!205733 (tuple2!7957 lt!205739 lt!205734)) lt!205738))))

(declare-fun lt!205814 () Unit!13229)

(assert (=> d!74445 (= lt!205814 (choose!1336 lt!205733 lt!205739 lt!205734 lt!205738))))

(declare-fun e!265368 () Bool)

(assert (=> d!74445 e!265368))

(declare-fun res!270089 () Bool)

(assert (=> d!74445 (=> (not res!270089) (not e!265368))))

(assert (=> d!74445 (= res!270089 (not (contains!2478 lt!205733 lt!205738)))))

(assert (=> d!74445 (= (addStillNotContains!148 lt!205733 lt!205739 lt!205734 lt!205738) lt!205814)))

(declare-fun b!453371 () Bool)

(assert (=> b!453371 (= e!265368 (not (= lt!205739 lt!205738)))))

(assert (= (and d!74445 res!270089) b!453371))

(assert (=> d!74445 m!437423))

(assert (=> d!74445 m!437423))

(assert (=> d!74445 m!437427))

(declare-fun m!437639 () Bool)

(assert (=> d!74445 m!437639))

(declare-fun m!437641 () Bool)

(assert (=> d!74445 m!437641))

(assert (=> b!453233 d!74445))

(declare-fun d!74447 () Bool)

(declare-fun e!265369 () Bool)

(assert (=> d!74447 e!265369))

(declare-fun res!270090 () Bool)

(assert (=> d!74447 (=> (not res!270090) (not e!265369))))

(declare-fun lt!205816 () ListLongMap!6871)

(assert (=> d!74447 (= res!270090 (contains!2478 lt!205816 (_1!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205815 () List!8023)

(assert (=> d!74447 (= lt!205816 (ListLongMap!6872 lt!205815))))

(declare-fun lt!205817 () Unit!13229)

(declare-fun lt!205818 () Unit!13229)

(assert (=> d!74447 (= lt!205817 lt!205818)))

(assert (=> d!74447 (= (getValueByKey!371 lt!205815 (_1!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74447 (= lt!205818 (lemmaContainsTupThenGetReturnValue!193 lt!205815 (_1!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74447 (= lt!205815 (insertStrictlySorted!196 (toList!3451 call!30036) (_1!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74447 (= (+!1575 call!30036 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205816)))

(declare-fun b!453372 () Bool)

(declare-fun res!270091 () Bool)

(assert (=> b!453372 (=> (not res!270091) (not e!265369))))

(assert (=> b!453372 (= res!270091 (= (getValueByKey!371 (toList!3451 lt!205816) (_1!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453373 () Bool)

(assert (=> b!453373 (= e!265369 (contains!2479 (toList!3451 lt!205816) (tuple2!7957 (select (arr!13481 _keys!709) from!863) (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74447 res!270090) b!453372))

(assert (= (and b!453372 res!270091) b!453373))

(declare-fun m!437643 () Bool)

(assert (=> d!74447 m!437643))

(declare-fun m!437645 () Bool)

(assert (=> d!74447 m!437645))

(declare-fun m!437647 () Bool)

(assert (=> d!74447 m!437647))

(declare-fun m!437649 () Bool)

(assert (=> d!74447 m!437649))

(declare-fun m!437651 () Bool)

(assert (=> b!453372 m!437651))

(declare-fun m!437653 () Bool)

(assert (=> b!453373 m!437653))

(assert (=> b!453233 d!74447))

(declare-fun d!74449 () Bool)

(declare-fun c!56214 () Bool)

(assert (=> d!74449 (= c!56214 ((_ is ValueCellFull!5726) (select (arr!13482 _values!549) from!863)))))

(declare-fun e!265370 () V!17291)

(assert (=> d!74449 (= (get!6656 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265370)))

(declare-fun b!453374 () Bool)

(assert (=> b!453374 (= e!265370 (get!6659 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453375 () Bool)

(assert (=> b!453375 (= e!265370 (get!6660 (select (arr!13482 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74449 c!56214) b!453374))

(assert (= (and d!74449 (not c!56214)) b!453375))

(assert (=> b!453374 m!437025))

(assert (=> b!453374 m!437019))

(declare-fun m!437655 () Bool)

(assert (=> b!453374 m!437655))

(assert (=> b!453375 m!437025))

(assert (=> b!453375 m!437019))

(declare-fun m!437657 () Bool)

(assert (=> b!453375 m!437657))

(assert (=> b!453233 d!74449))

(declare-fun b!453376 () Bool)

(declare-fun e!265374 () ListLongMap!6871)

(declare-fun e!265376 () ListLongMap!6871)

(assert (=> b!453376 (= e!265374 e!265376)))

(declare-fun c!56216 () Bool)

(assert (=> b!453376 (= c!56216 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun call!30049 () ListLongMap!6871)

(declare-fun bm!30046 () Bool)

(assert (=> bm!30046 (= call!30049 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453377 () Bool)

(declare-fun res!270094 () Bool)

(declare-fun e!265375 () Bool)

(assert (=> b!453377 (=> (not res!270094) (not e!265375))))

(declare-fun lt!205821 () ListLongMap!6871)

(assert (=> b!453377 (= res!270094 (not (contains!2478 lt!205821 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453378 () Bool)

(assert (=> b!453378 (= e!265374 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453380 () Bool)

(declare-fun e!265373 () Bool)

(declare-fun e!265372 () Bool)

(assert (=> b!453380 (= e!265373 e!265372)))

(declare-fun c!56215 () Bool)

(assert (=> b!453380 (= c!56215 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(declare-fun b!453381 () Bool)

(declare-fun e!265377 () Bool)

(assert (=> b!453381 (= e!265373 e!265377)))

(assert (=> b!453381 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(declare-fun res!270093 () Bool)

(assert (=> b!453381 (= res!270093 (contains!2478 lt!205821 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453381 (=> (not res!270093) (not e!265377))))

(declare-fun b!453382 () Bool)

(declare-fun lt!205822 () Unit!13229)

(declare-fun lt!205823 () Unit!13229)

(assert (=> b!453382 (= lt!205822 lt!205823)))

(declare-fun lt!205819 () ListLongMap!6871)

(declare-fun lt!205825 () (_ BitVec 64))

(declare-fun lt!205820 () V!17291)

(declare-fun lt!205824 () (_ BitVec 64))

(assert (=> b!453382 (not (contains!2478 (+!1575 lt!205819 (tuple2!7957 lt!205825 lt!205820)) lt!205824))))

(assert (=> b!453382 (= lt!205823 (addStillNotContains!148 lt!205819 lt!205825 lt!205820 lt!205824))))

(assert (=> b!453382 (= lt!205824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453382 (= lt!205820 (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453382 (= lt!205825 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(assert (=> b!453382 (= lt!205819 call!30049)))

(assert (=> b!453382 (= e!265376 (+!1575 call!30049 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453383 () Bool)

(declare-fun e!265371 () Bool)

(assert (=> b!453383 (= e!265371 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453383 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453384 () Bool)

(assert (=> b!453384 (= e!265375 e!265373)))

(declare-fun c!56217 () Bool)

(assert (=> b!453384 (= c!56217 e!265371)))

(declare-fun res!270092 () Bool)

(assert (=> b!453384 (=> (not res!270092) (not e!265371))))

(assert (=> b!453384 (= res!270092 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(declare-fun b!453385 () Bool)

(assert (=> b!453385 (= e!265372 (isEmpty!565 lt!205821))))

(declare-fun b!453386 () Bool)

(assert (=> b!453386 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(assert (=> b!453386 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 lt!205573)))))

(assert (=> b!453386 (= e!265377 (= (apply!313 lt!205821 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453387 () Bool)

(assert (=> b!453387 (= e!265376 call!30049)))

(declare-fun d!74451 () Bool)

(assert (=> d!74451 e!265375))

(declare-fun res!270095 () Bool)

(assert (=> d!74451 (=> (not res!270095) (not e!265375))))

(assert (=> d!74451 (= res!270095 (not (contains!2478 lt!205821 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74451 (= lt!205821 e!265374)))

(declare-fun c!56218 () Bool)

(assert (=> d!74451 (= c!56218 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(assert (=> d!74451 (validMask!0 mask!1025)))

(assert (=> d!74451 (= (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205821)))

(declare-fun b!453379 () Bool)

(assert (=> b!453379 (= e!265372 (= lt!205821 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74451 c!56218) b!453378))

(assert (= (and d!74451 (not c!56218)) b!453376))

(assert (= (and b!453376 c!56216) b!453382))

(assert (= (and b!453376 (not c!56216)) b!453387))

(assert (= (or b!453382 b!453387) bm!30046))

(assert (= (and d!74451 res!270095) b!453377))

(assert (= (and b!453377 res!270094) b!453384))

(assert (= (and b!453384 res!270092) b!453383))

(assert (= (and b!453384 c!56217) b!453381))

(assert (= (and b!453384 (not c!56217)) b!453380))

(assert (= (and b!453381 res!270093) b!453386))

(assert (= (and b!453380 c!56215) b!453379))

(assert (= (and b!453380 (not c!56215)) b!453385))

(declare-fun b_lambda!9653 () Bool)

(assert (=> (not b_lambda!9653) (not b!453382)))

(assert (=> b!453382 t!13838))

(declare-fun b_and!18943 () Bool)

(assert (= b_and!18941 (and (=> t!13838 result!7091) b_and!18943)))

(declare-fun b_lambda!9655 () Bool)

(assert (=> (not b_lambda!9655) (not b!453386)))

(assert (=> b!453386 t!13838))

(declare-fun b_and!18945 () Bool)

(assert (= b_and!18943 (and (=> t!13838 result!7091) b_and!18945)))

(declare-fun m!437659 () Bool)

(assert (=> bm!30046 m!437659))

(declare-fun m!437661 () Bool)

(assert (=> b!453385 m!437661))

(declare-fun m!437663 () Bool)

(assert (=> b!453381 m!437663))

(assert (=> b!453381 m!437663))

(declare-fun m!437665 () Bool)

(assert (=> b!453381 m!437665))

(declare-fun m!437667 () Bool)

(assert (=> b!453377 m!437667))

(assert (=> b!453379 m!437659))

(declare-fun m!437669 () Bool)

(assert (=> b!453386 m!437669))

(assert (=> b!453386 m!437019))

(declare-fun m!437671 () Bool)

(assert (=> b!453386 m!437671))

(assert (=> b!453386 m!437663))

(declare-fun m!437673 () Bool)

(assert (=> b!453386 m!437673))

(assert (=> b!453386 m!437669))

(assert (=> b!453386 m!437019))

(assert (=> b!453386 m!437663))

(assert (=> b!453382 m!437669))

(assert (=> b!453382 m!437019))

(assert (=> b!453382 m!437671))

(declare-fun m!437675 () Bool)

(assert (=> b!453382 m!437675))

(assert (=> b!453382 m!437669))

(assert (=> b!453382 m!437019))

(declare-fun m!437677 () Bool)

(assert (=> b!453382 m!437677))

(assert (=> b!453382 m!437675))

(declare-fun m!437679 () Bool)

(assert (=> b!453382 m!437679))

(assert (=> b!453382 m!437663))

(declare-fun m!437681 () Bool)

(assert (=> b!453382 m!437681))

(declare-fun m!437683 () Bool)

(assert (=> d!74451 m!437683))

(assert (=> d!74451 m!436979))

(assert (=> b!453376 m!437663))

(assert (=> b!453376 m!437663))

(declare-fun m!437685 () Bool)

(assert (=> b!453376 m!437685))

(assert (=> b!453383 m!437663))

(assert (=> b!453383 m!437663))

(assert (=> b!453383 m!437685))

(assert (=> bm!30023 d!74451))

(declare-fun d!74453 () Bool)

(declare-fun e!265378 () Bool)

(assert (=> d!74453 e!265378))

(declare-fun res!270096 () Bool)

(assert (=> d!74453 (=> res!270096 e!265378)))

(declare-fun lt!205827 () Bool)

(assert (=> d!74453 (= res!270096 (not lt!205827))))

(declare-fun lt!205828 () Bool)

(assert (=> d!74453 (= lt!205827 lt!205828)))

(declare-fun lt!205829 () Unit!13229)

(declare-fun e!265379 () Unit!13229)

(assert (=> d!74453 (= lt!205829 e!265379)))

(declare-fun c!56219 () Bool)

(assert (=> d!74453 (= c!56219 lt!205828)))

(assert (=> d!74453 (= lt!205828 (containsKey!347 (toList!3451 lt!205680) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(assert (=> d!74453 (= (contains!2478 lt!205680 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) lt!205827)))

(declare-fun b!453388 () Bool)

(declare-fun lt!205826 () Unit!13229)

(assert (=> b!453388 (= e!265379 lt!205826)))

(assert (=> b!453388 (= lt!205826 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205680) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(assert (=> b!453388 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205680) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun b!453389 () Bool)

(declare-fun Unit!13241 () Unit!13229)

(assert (=> b!453389 (= e!265379 Unit!13241)))

(declare-fun b!453390 () Bool)

(assert (=> b!453390 (= e!265378 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205680) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(assert (= (and d!74453 c!56219) b!453388))

(assert (= (and d!74453 (not c!56219)) b!453389))

(assert (= (and d!74453 (not res!270096)) b!453390))

(declare-fun m!437687 () Bool)

(assert (=> d!74453 m!437687))

(declare-fun m!437689 () Bool)

(assert (=> b!453388 m!437689))

(assert (=> b!453388 m!437233))

(assert (=> b!453388 m!437233))

(declare-fun m!437691 () Bool)

(assert (=> b!453388 m!437691))

(assert (=> b!453390 m!437233))

(assert (=> b!453390 m!437233))

(assert (=> b!453390 m!437691))

(assert (=> d!74357 d!74453))

(declare-fun b!453391 () Bool)

(declare-fun e!265380 () Option!377)

(assert (=> b!453391 (= e!265380 (Some!376 (_2!3989 (h!8875 lt!205679))))))

(declare-fun c!56220 () Bool)

(declare-fun d!74455 () Bool)

(assert (=> d!74455 (= c!56220 (and ((_ is Cons!8019) lt!205679) (= (_1!3989 (h!8875 lt!205679)) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(assert (=> d!74455 (= (getValueByKey!371 lt!205679 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) e!265380)))

(declare-fun b!453392 () Bool)

(declare-fun e!265381 () Option!377)

(assert (=> b!453392 (= e!265380 e!265381)))

(declare-fun c!56221 () Bool)

(assert (=> b!453392 (= c!56221 (and ((_ is Cons!8019) lt!205679) (not (= (_1!3989 (h!8875 lt!205679)) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))))

(declare-fun b!453393 () Bool)

(assert (=> b!453393 (= e!265381 (getValueByKey!371 (t!13839 lt!205679) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun b!453394 () Bool)

(assert (=> b!453394 (= e!265381 None!375)))

(assert (= (and d!74455 c!56220) b!453391))

(assert (= (and d!74455 (not c!56220)) b!453392))

(assert (= (and b!453392 c!56221) b!453393))

(assert (= (and b!453392 (not c!56221)) b!453394))

(declare-fun m!437693 () Bool)

(assert (=> b!453393 m!437693))

(assert (=> d!74357 d!74455))

(declare-fun d!74457 () Bool)

(assert (=> d!74457 (= (getValueByKey!371 lt!205679 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun lt!205830 () Unit!13229)

(assert (=> d!74457 (= lt!205830 (choose!1337 lt!205679 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun e!265382 () Bool)

(assert (=> d!74457 e!265382))

(declare-fun res!270097 () Bool)

(assert (=> d!74457 (=> (not res!270097) (not e!265382))))

(assert (=> d!74457 (= res!270097 (isStrictlySorted!365 lt!205679))))

(assert (=> d!74457 (= (lemmaContainsTupThenGetReturnValue!193 lt!205679 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) lt!205830)))

(declare-fun b!453395 () Bool)

(declare-fun res!270098 () Bool)

(assert (=> b!453395 (=> (not res!270098) (not e!265382))))

(assert (=> b!453395 (= res!270098 (containsKey!347 lt!205679 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun b!453396 () Bool)

(assert (=> b!453396 (= e!265382 (contains!2479 lt!205679 (tuple2!7957 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(assert (= (and d!74457 res!270097) b!453395))

(assert (= (and b!453395 res!270098) b!453396))

(assert (=> d!74457 m!437227))

(declare-fun m!437695 () Bool)

(assert (=> d!74457 m!437695))

(declare-fun m!437697 () Bool)

(assert (=> d!74457 m!437697))

(declare-fun m!437699 () Bool)

(assert (=> b!453395 m!437699))

(declare-fun m!437701 () Bool)

(assert (=> b!453396 m!437701))

(assert (=> d!74357 d!74457))

(declare-fun e!265385 () List!8023)

(declare-fun b!453397 () Bool)

(assert (=> b!453397 (= e!265385 (insertStrictlySorted!196 (t!13839 (toList!3451 lt!205567)) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun b!453399 () Bool)

(declare-fun e!265383 () List!8023)

(declare-fun e!265387 () List!8023)

(assert (=> b!453399 (= e!265383 e!265387)))

(declare-fun c!56224 () Bool)

(assert (=> b!453399 (= c!56224 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (= (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(declare-fun b!453400 () Bool)

(declare-fun c!56222 () Bool)

(assert (=> b!453400 (= c!56222 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (bvsgt (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(declare-fun e!265386 () List!8023)

(assert (=> b!453400 (= e!265387 e!265386)))

(declare-fun b!453401 () Bool)

(declare-fun call!30052 () List!8023)

(assert (=> b!453401 (= e!265387 call!30052)))

(declare-fun bm!30047 () Bool)

(declare-fun call!30050 () List!8023)

(assert (=> bm!30047 (= call!30052 call!30050)))

(declare-fun b!453402 () Bool)

(declare-fun call!30051 () List!8023)

(assert (=> b!453402 (= e!265386 call!30051)))

(declare-fun d!74459 () Bool)

(declare-fun e!265384 () Bool)

(assert (=> d!74459 e!265384))

(declare-fun res!270099 () Bool)

(assert (=> d!74459 (=> (not res!270099) (not e!265384))))

(declare-fun lt!205831 () List!8023)

(assert (=> d!74459 (= res!270099 (isStrictlySorted!365 lt!205831))))

(assert (=> d!74459 (= lt!205831 e!265383)))

(declare-fun c!56223 () Bool)

(assert (=> d!74459 (= c!56223 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (bvslt (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(assert (=> d!74459 (isStrictlySorted!365 (toList!3451 lt!205567))))

(assert (=> d!74459 (= (insertStrictlySorted!196 (toList!3451 lt!205567) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) lt!205831)))

(declare-fun b!453398 () Bool)

(assert (=> b!453398 (= e!265383 call!30050)))

(declare-fun b!453403 () Bool)

(assert (=> b!453403 (= e!265386 call!30051)))

(declare-fun b!453404 () Bool)

(declare-fun res!270100 () Bool)

(assert (=> b!453404 (=> (not res!270100) (not e!265384))))

(assert (=> b!453404 (= res!270100 (containsKey!347 lt!205831 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun b!453405 () Bool)

(assert (=> b!453405 (= e!265384 (contains!2479 lt!205831 (tuple2!7957 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(declare-fun bm!30048 () Bool)

(assert (=> bm!30048 (= call!30051 call!30052)))

(declare-fun bm!30049 () Bool)

(assert (=> bm!30049 (= call!30050 ($colon$colon!108 e!265385 (ite c!56223 (h!8875 (toList!3451 lt!205567)) (tuple2!7957 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))))

(declare-fun c!56225 () Bool)

(assert (=> bm!30049 (= c!56225 c!56223)))

(declare-fun b!453406 () Bool)

(assert (=> b!453406 (= e!265385 (ite c!56224 (t!13839 (toList!3451 lt!205567)) (ite c!56222 (Cons!8019 (h!8875 (toList!3451 lt!205567)) (t!13839 (toList!3451 lt!205567))) Nil!8020)))))

(assert (= (and d!74459 c!56223) b!453398))

(assert (= (and d!74459 (not c!56223)) b!453399))

(assert (= (and b!453399 c!56224) b!453401))

(assert (= (and b!453399 (not c!56224)) b!453400))

(assert (= (and b!453400 c!56222) b!453403))

(assert (= (and b!453400 (not c!56222)) b!453402))

(assert (= (or b!453403 b!453402) bm!30048))

(assert (= (or b!453401 bm!30048) bm!30047))

(assert (= (or b!453398 bm!30047) bm!30049))

(assert (= (and bm!30049 c!56225) b!453397))

(assert (= (and bm!30049 (not c!56225)) b!453406))

(assert (= (and d!74459 res!270099) b!453404))

(assert (= (and b!453404 res!270100) b!453405))

(declare-fun m!437703 () Bool)

(assert (=> b!453405 m!437703))

(declare-fun m!437705 () Bool)

(assert (=> b!453404 m!437705))

(declare-fun m!437707 () Bool)

(assert (=> b!453397 m!437707))

(declare-fun m!437709 () Bool)

(assert (=> d!74459 m!437709))

(assert (=> d!74459 m!437615))

(declare-fun m!437711 () Bool)

(assert (=> bm!30049 m!437711))

(assert (=> d!74357 d!74459))

(declare-fun d!74461 () Bool)

(declare-fun c!56226 () Bool)

(assert (=> d!74461 (= c!56226 ((_ is ValueCellFull!5726) (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265388 () V!17291)

(assert (=> d!74461 (= (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265388)))

(declare-fun b!453407 () Bool)

(assert (=> b!453407 (= e!265388 (get!6659 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453408 () Bool)

(assert (=> b!453408 (= e!265388 (get!6660 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74461 c!56226) b!453407))

(assert (= (and d!74461 (not c!56226)) b!453408))

(assert (=> b!453407 m!437191))

(assert (=> b!453407 m!437019))

(declare-fun m!437713 () Bool)

(assert (=> b!453407 m!437713))

(assert (=> b!453408 m!437191))

(assert (=> b!453408 m!437019))

(declare-fun m!437715 () Bool)

(assert (=> b!453408 m!437715))

(assert (=> b!453125 d!74461))

(declare-fun d!74463 () Bool)

(declare-fun e!265389 () Bool)

(assert (=> d!74463 e!265389))

(declare-fun res!270101 () Bool)

(assert (=> d!74463 (=> res!270101 e!265389)))

(declare-fun lt!205833 () Bool)

(assert (=> d!74463 (= res!270101 (not lt!205833))))

(declare-fun lt!205834 () Bool)

(assert (=> d!74463 (= lt!205833 lt!205834)))

(declare-fun lt!205835 () Unit!13229)

(declare-fun e!265390 () Unit!13229)

(assert (=> d!74463 (= lt!205835 e!265390)))

(declare-fun c!56227 () Bool)

(assert (=> d!74463 (= c!56227 lt!205834)))

(assert (=> d!74463 (= lt!205834 (containsKey!347 (toList!3451 (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656))) lt!205660))))

(assert (=> d!74463 (= (contains!2478 (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656)) lt!205660) lt!205833)))

(declare-fun b!453409 () Bool)

(declare-fun lt!205832 () Unit!13229)

(assert (=> b!453409 (= e!265390 lt!205832)))

(assert (=> b!453409 (= lt!205832 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656))) lt!205660))))

(assert (=> b!453409 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656))) lt!205660))))

(declare-fun b!453410 () Bool)

(declare-fun Unit!13242 () Unit!13229)

(assert (=> b!453410 (= e!265390 Unit!13242)))

(declare-fun b!453411 () Bool)

(assert (=> b!453411 (= e!265389 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656))) lt!205660)))))

(assert (= (and d!74463 c!56227) b!453409))

(assert (= (and d!74463 (not c!56227)) b!453410))

(assert (= (and d!74463 (not res!270101)) b!453411))

(declare-fun m!437717 () Bool)

(assert (=> d!74463 m!437717))

(declare-fun m!437719 () Bool)

(assert (=> b!453409 m!437719))

(declare-fun m!437721 () Bool)

(assert (=> b!453409 m!437721))

(assert (=> b!453409 m!437721))

(declare-fun m!437723 () Bool)

(assert (=> b!453409 m!437723))

(assert (=> b!453411 m!437721))

(assert (=> b!453411 m!437721))

(assert (=> b!453411 m!437723))

(assert (=> b!453125 d!74463))

(declare-fun d!74465 () Bool)

(declare-fun e!265391 () Bool)

(assert (=> d!74465 e!265391))

(declare-fun res!270102 () Bool)

(assert (=> d!74465 (=> (not res!270102) (not e!265391))))

(declare-fun lt!205837 () ListLongMap!6871)

(assert (=> d!74465 (= res!270102 (contains!2478 lt!205837 (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205836 () List!8023)

(assert (=> d!74465 (= lt!205837 (ListLongMap!6872 lt!205836))))

(declare-fun lt!205838 () Unit!13229)

(declare-fun lt!205839 () Unit!13229)

(assert (=> d!74465 (= lt!205838 lt!205839)))

(assert (=> d!74465 (= (getValueByKey!371 lt!205836 (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74465 (= lt!205839 (lemmaContainsTupThenGetReturnValue!193 lt!205836 (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74465 (= lt!205836 (insertStrictlySorted!196 (toList!3451 call!30021) (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74465 (= (+!1575 call!30021 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205837)))

(declare-fun b!453412 () Bool)

(declare-fun res!270103 () Bool)

(assert (=> b!453412 (=> (not res!270103) (not e!265391))))

(assert (=> b!453412 (= res!270103 (= (getValueByKey!371 (toList!3451 lt!205837) (_1!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453413 () Bool)

(assert (=> b!453413 (= e!265391 (contains!2479 (toList!3451 lt!205837) (tuple2!7957 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 (ite c!56123 _values!549 lt!205573)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74465 res!270102) b!453412))

(assert (= (and b!453412 res!270103) b!453413))

(declare-fun m!437725 () Bool)

(assert (=> d!74465 m!437725))

(declare-fun m!437727 () Bool)

(assert (=> d!74465 m!437727))

(declare-fun m!437729 () Bool)

(assert (=> d!74465 m!437729))

(declare-fun m!437731 () Bool)

(assert (=> d!74465 m!437731))

(declare-fun m!437733 () Bool)

(assert (=> b!453412 m!437733))

(declare-fun m!437735 () Bool)

(assert (=> b!453413 m!437735))

(assert (=> b!453125 d!74465))

(declare-fun d!74467 () Bool)

(assert (=> d!74467 (not (contains!2478 (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656)) lt!205660))))

(declare-fun lt!205840 () Unit!13229)

(assert (=> d!74467 (= lt!205840 (choose!1336 lt!205655 lt!205661 lt!205656 lt!205660))))

(declare-fun e!265392 () Bool)

(assert (=> d!74467 e!265392))

(declare-fun res!270104 () Bool)

(assert (=> d!74467 (=> (not res!270104) (not e!265392))))

(assert (=> d!74467 (= res!270104 (not (contains!2478 lt!205655 lt!205660)))))

(assert (=> d!74467 (= (addStillNotContains!148 lt!205655 lt!205661 lt!205656 lt!205660) lt!205840)))

(declare-fun b!453414 () Bool)

(assert (=> b!453414 (= e!265392 (not (= lt!205661 lt!205660)))))

(assert (= (and d!74467 res!270104) b!453414))

(assert (=> d!74467 m!437197))

(assert (=> d!74467 m!437197))

(assert (=> d!74467 m!437201))

(declare-fun m!437737 () Bool)

(assert (=> d!74467 m!437737))

(declare-fun m!437739 () Bool)

(assert (=> d!74467 m!437739))

(assert (=> b!453125 d!74467))

(declare-fun d!74469 () Bool)

(declare-fun e!265393 () Bool)

(assert (=> d!74469 e!265393))

(declare-fun res!270105 () Bool)

(assert (=> d!74469 (=> (not res!270105) (not e!265393))))

(declare-fun lt!205842 () ListLongMap!6871)

(assert (=> d!74469 (= res!270105 (contains!2478 lt!205842 (_1!3989 (tuple2!7957 lt!205661 lt!205656))))))

(declare-fun lt!205841 () List!8023)

(assert (=> d!74469 (= lt!205842 (ListLongMap!6872 lt!205841))))

(declare-fun lt!205843 () Unit!13229)

(declare-fun lt!205844 () Unit!13229)

(assert (=> d!74469 (= lt!205843 lt!205844)))

(assert (=> d!74469 (= (getValueByKey!371 lt!205841 (_1!3989 (tuple2!7957 lt!205661 lt!205656))) (Some!376 (_2!3989 (tuple2!7957 lt!205661 lt!205656))))))

(assert (=> d!74469 (= lt!205844 (lemmaContainsTupThenGetReturnValue!193 lt!205841 (_1!3989 (tuple2!7957 lt!205661 lt!205656)) (_2!3989 (tuple2!7957 lt!205661 lt!205656))))))

(assert (=> d!74469 (= lt!205841 (insertStrictlySorted!196 (toList!3451 lt!205655) (_1!3989 (tuple2!7957 lt!205661 lt!205656)) (_2!3989 (tuple2!7957 lt!205661 lt!205656))))))

(assert (=> d!74469 (= (+!1575 lt!205655 (tuple2!7957 lt!205661 lt!205656)) lt!205842)))

(declare-fun b!453415 () Bool)

(declare-fun res!270106 () Bool)

(assert (=> b!453415 (=> (not res!270106) (not e!265393))))

(assert (=> b!453415 (= res!270106 (= (getValueByKey!371 (toList!3451 lt!205842) (_1!3989 (tuple2!7957 lt!205661 lt!205656))) (Some!376 (_2!3989 (tuple2!7957 lt!205661 lt!205656)))))))

(declare-fun b!453416 () Bool)

(assert (=> b!453416 (= e!265393 (contains!2479 (toList!3451 lt!205842) (tuple2!7957 lt!205661 lt!205656)))))

(assert (= (and d!74469 res!270105) b!453415))

(assert (= (and b!453415 res!270106) b!453416))

(declare-fun m!437741 () Bool)

(assert (=> d!74469 m!437741))

(declare-fun m!437743 () Bool)

(assert (=> d!74469 m!437743))

(declare-fun m!437745 () Bool)

(assert (=> d!74469 m!437745))

(declare-fun m!437747 () Bool)

(assert (=> d!74469 m!437747))

(declare-fun m!437749 () Bool)

(assert (=> b!453415 m!437749))

(declare-fun m!437751 () Bool)

(assert (=> b!453416 m!437751))

(assert (=> b!453125 d!74469))

(declare-fun d!74471 () Bool)

(assert (=> d!74471 (= (apply!313 lt!205735 (select (arr!13481 _keys!709) from!863)) (get!6661 (getValueByKey!371 (toList!3451 lt!205735) (select (arr!13481 _keys!709) from!863))))))

(declare-fun bs!14421 () Bool)

(assert (= bs!14421 d!74471))

(assert (=> bs!14421 m!436993))

(declare-fun m!437753 () Bool)

(assert (=> bs!14421 m!437753))

(assert (=> bs!14421 m!437753))

(declare-fun m!437755 () Bool)

(assert (=> bs!14421 m!437755))

(assert (=> b!453237 d!74471))

(assert (=> b!453237 d!74449))

(assert (=> b!453143 d!74425))

(declare-fun d!74473 () Bool)

(declare-fun e!265394 () Bool)

(assert (=> d!74473 e!265394))

(declare-fun res!270107 () Bool)

(assert (=> d!74473 (=> res!270107 e!265394)))

(declare-fun lt!205846 () Bool)

(assert (=> d!74473 (= res!270107 (not lt!205846))))

(declare-fun lt!205847 () Bool)

(assert (=> d!74473 (= lt!205846 lt!205847)))

(declare-fun lt!205848 () Unit!13229)

(declare-fun e!265395 () Unit!13229)

(assert (=> d!74473 (= lt!205848 e!265395)))

(declare-fun c!56228 () Bool)

(assert (=> d!74473 (= c!56228 lt!205847)))

(assert (=> d!74473 (= lt!205847 (containsKey!347 (toList!3451 lt!205728) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74473 (= (contains!2478 lt!205728 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205846)))

(declare-fun b!453417 () Bool)

(declare-fun lt!205845 () Unit!13229)

(assert (=> b!453417 (= e!265395 lt!205845)))

(assert (=> b!453417 (= lt!205845 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205728) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453417 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205728) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453418 () Bool)

(declare-fun Unit!13243 () Unit!13229)

(assert (=> b!453418 (= e!265395 Unit!13243)))

(declare-fun b!453419 () Bool)

(assert (=> b!453419 (= e!265394 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205728) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74473 c!56228) b!453417))

(assert (= (and d!74473 (not c!56228)) b!453418))

(assert (= (and d!74473 (not res!270107)) b!453419))

(declare-fun m!437757 () Bool)

(assert (=> d!74473 m!437757))

(declare-fun m!437759 () Bool)

(assert (=> b!453417 m!437759))

(declare-fun m!437761 () Bool)

(assert (=> b!453417 m!437761))

(assert (=> b!453417 m!437761))

(declare-fun m!437763 () Bool)

(assert (=> b!453417 m!437763))

(assert (=> b!453419 m!437761))

(assert (=> b!453419 m!437761))

(assert (=> b!453419 m!437763))

(assert (=> d!74395 d!74473))

(assert (=> d!74395 d!74389))

(assert (=> b!453145 d!74425))

(declare-fun d!74475 () Bool)

(assert (=> d!74475 (= (validKeyInArray!0 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453182 d!74475))

(declare-fun d!74477 () Bool)

(assert (=> d!74477 (= (apply!313 lt!205657 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6661 (getValueByKey!371 (toList!3451 lt!205657) (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14422 () Bool)

(assert (= bs!14422 d!74477))

(assert (=> bs!14422 m!437185))

(declare-fun m!437765 () Bool)

(assert (=> bs!14422 m!437765))

(assert (=> bs!14422 m!437765))

(declare-fun m!437767 () Bool)

(assert (=> bs!14422 m!437767))

(assert (=> b!453129 d!74477))

(assert (=> b!453129 d!74461))

(declare-fun b!453420 () Bool)

(declare-fun e!265399 () Bool)

(declare-fun e!265397 () Bool)

(assert (=> b!453420 (= e!265399 e!265397)))

(declare-fun res!270108 () Bool)

(assert (=> b!453420 (=> (not res!270108) (not e!265397))))

(declare-fun e!265398 () Bool)

(assert (=> b!453420 (= res!270108 (not e!265398))))

(declare-fun res!270110 () Bool)

(assert (=> b!453420 (=> (not res!270110) (not e!265398))))

(assert (=> b!453420 (= res!270110 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453421 () Bool)

(declare-fun e!265396 () Bool)

(declare-fun call!30053 () Bool)

(assert (=> b!453421 (= e!265396 call!30053)))

(declare-fun d!74479 () Bool)

(declare-fun res!270109 () Bool)

(assert (=> d!74479 (=> res!270109 e!265399)))

(assert (=> d!74479 (= res!270109 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(assert (=> d!74479 (= (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56132 (Cons!8020 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8021) Nil!8021)) e!265399)))

(declare-fun b!453422 () Bool)

(assert (=> b!453422 (= e!265397 e!265396)))

(declare-fun c!56229 () Bool)

(assert (=> b!453422 (= c!56229 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453423 () Bool)

(assert (=> b!453423 (= e!265396 call!30053)))

(declare-fun b!453424 () Bool)

(assert (=> b!453424 (= e!265398 (contains!2477 (ite c!56132 (Cons!8020 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8021) Nil!8021) (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!30050 () Bool)

(assert (=> bm!30050 (= call!30053 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!56229 (Cons!8020 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!56132 (Cons!8020 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8021) Nil!8021)) (ite c!56132 (Cons!8020 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8021) Nil!8021))))))

(assert (= (and d!74479 (not res!270109)) b!453420))

(assert (= (and b!453420 res!270110) b!453424))

(assert (= (and b!453420 res!270108) b!453422))

(assert (= (and b!453422 c!56229) b!453421))

(assert (= (and b!453422 (not c!56229)) b!453423))

(assert (= (or b!453421 b!453423) bm!30050))

(declare-fun m!437769 () Bool)

(assert (=> b!453420 m!437769))

(assert (=> b!453420 m!437769))

(declare-fun m!437771 () Bool)

(assert (=> b!453420 m!437771))

(assert (=> b!453422 m!437769))

(assert (=> b!453422 m!437769))

(assert (=> b!453422 m!437771))

(assert (=> b!453424 m!437769))

(assert (=> b!453424 m!437769))

(declare-fun m!437773 () Bool)

(assert (=> b!453424 m!437773))

(assert (=> bm!30050 m!437769))

(declare-fun m!437775 () Bool)

(assert (=> bm!30050 m!437775))

(assert (=> bm!30015 d!74479))

(declare-fun call!30059 () ListLongMap!6871)

(declare-fun bm!30055 () Bool)

(assert (=> bm!30055 (= call!30059 (getCurrentListMapNoExtraKeys!1680 (array!28075 (store (arr!13481 _keys!709) i!563 k0!794) (size!13833 _keys!709)) (array!28077 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13834 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!74481 () Bool)

(declare-fun e!265402 () Bool)

(assert (=> d!74481 e!265402))

(declare-fun c!56232 () Bool)

(assert (=> d!74481 (= c!56232 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (=> d!74481 true))

(declare-fun _$4!58 () Unit!13229)

(assert (=> d!74481 (= (choose!1335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) _$4!58)))

(declare-fun call!30058 () ListLongMap!6871)

(declare-fun b!453429 () Bool)

(assert (=> b!453429 (= e!265402 (= call!30059 (+!1575 call!30058 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453430 () Bool)

(assert (=> b!453430 (= e!265402 (= call!30059 call!30058))))

(declare-fun bm!30056 () Bool)

(assert (=> bm!30056 (= call!30058 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74481 c!56232) b!453429))

(assert (= (and d!74481 (not c!56232)) b!453430))

(assert (= (or b!453429 b!453430) bm!30055))

(assert (= (or b!453429 b!453430) bm!30056))

(assert (=> bm!30055 m!437005))

(assert (=> bm!30055 m!436989))

(assert (=> bm!30055 m!437381))

(declare-fun m!437777 () Bool)

(assert (=> b!453429 m!437777))

(assert (=> bm!30056 m!437383))

(assert (=> d!74393 d!74481))

(declare-fun d!74483 () Bool)

(declare-fun e!265403 () Bool)

(assert (=> d!74483 e!265403))

(declare-fun res!270111 () Bool)

(assert (=> d!74483 (=> (not res!270111) (not e!265403))))

(declare-fun lt!205850 () ListLongMap!6871)

(assert (=> d!74483 (= res!270111 (contains!2478 lt!205850 (_1!3989 (tuple2!7957 lt!205708 lt!205703))))))

(declare-fun lt!205849 () List!8023)

(assert (=> d!74483 (= lt!205850 (ListLongMap!6872 lt!205849))))

(declare-fun lt!205851 () Unit!13229)

(declare-fun lt!205852 () Unit!13229)

(assert (=> d!74483 (= lt!205851 lt!205852)))

(assert (=> d!74483 (= (getValueByKey!371 lt!205849 (_1!3989 (tuple2!7957 lt!205708 lt!205703))) (Some!376 (_2!3989 (tuple2!7957 lt!205708 lt!205703))))))

(assert (=> d!74483 (= lt!205852 (lemmaContainsTupThenGetReturnValue!193 lt!205849 (_1!3989 (tuple2!7957 lt!205708 lt!205703)) (_2!3989 (tuple2!7957 lt!205708 lt!205703))))))

(assert (=> d!74483 (= lt!205849 (insertStrictlySorted!196 (toList!3451 lt!205702) (_1!3989 (tuple2!7957 lt!205708 lt!205703)) (_2!3989 (tuple2!7957 lt!205708 lt!205703))))))

(assert (=> d!74483 (= (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703)) lt!205850)))

(declare-fun b!453431 () Bool)

(declare-fun res!270112 () Bool)

(assert (=> b!453431 (=> (not res!270112) (not e!265403))))

(assert (=> b!453431 (= res!270112 (= (getValueByKey!371 (toList!3451 lt!205850) (_1!3989 (tuple2!7957 lt!205708 lt!205703))) (Some!376 (_2!3989 (tuple2!7957 lt!205708 lt!205703)))))))

(declare-fun b!453432 () Bool)

(assert (=> b!453432 (= e!265403 (contains!2479 (toList!3451 lt!205850) (tuple2!7957 lt!205708 lt!205703)))))

(assert (= (and d!74483 res!270111) b!453431))

(assert (= (and b!453431 res!270112) b!453432))

(declare-fun m!437779 () Bool)

(assert (=> d!74483 m!437779))

(declare-fun m!437781 () Bool)

(assert (=> d!74483 m!437781))

(declare-fun m!437783 () Bool)

(assert (=> d!74483 m!437783))

(declare-fun m!437785 () Bool)

(assert (=> d!74483 m!437785))

(declare-fun m!437787 () Bool)

(assert (=> b!453431 m!437787))

(declare-fun m!437789 () Bool)

(assert (=> b!453432 m!437789))

(assert (=> b!453176 d!74483))

(declare-fun d!74485 () Bool)

(declare-fun e!265404 () Bool)

(assert (=> d!74485 e!265404))

(declare-fun res!270113 () Bool)

(assert (=> d!74485 (=> (not res!270113) (not e!265404))))

(declare-fun lt!205854 () ListLongMap!6871)

(assert (=> d!74485 (= res!270113 (contains!2478 lt!205854 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205853 () List!8023)

(assert (=> d!74485 (= lt!205854 (ListLongMap!6872 lt!205853))))

(declare-fun lt!205855 () Unit!13229)

(declare-fun lt!205856 () Unit!13229)

(assert (=> d!74485 (= lt!205855 lt!205856)))

(assert (=> d!74485 (= (getValueByKey!371 lt!205853 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74485 (= lt!205856 (lemmaContainsTupThenGetReturnValue!193 lt!205853 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74485 (= lt!205853 (insertStrictlySorted!196 (toList!3451 call!30026) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74485 (= (+!1575 call!30026 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205854)))

(declare-fun b!453433 () Bool)

(declare-fun res!270114 () Bool)

(assert (=> b!453433 (=> (not res!270114) (not e!265404))))

(assert (=> b!453433 (= res!270114 (= (getValueByKey!371 (toList!3451 lt!205854) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453434 () Bool)

(assert (=> b!453434 (= e!265404 (contains!2479 (toList!3451 lt!205854) (tuple2!7957 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74485 res!270113) b!453433))

(assert (= (and b!453433 res!270114) b!453434))

(declare-fun m!437791 () Bool)

(assert (=> d!74485 m!437791))

(declare-fun m!437793 () Bool)

(assert (=> d!74485 m!437793))

(declare-fun m!437795 () Bool)

(assert (=> d!74485 m!437795))

(declare-fun m!437797 () Bool)

(assert (=> d!74485 m!437797))

(declare-fun m!437799 () Bool)

(assert (=> b!453433 m!437799))

(declare-fun m!437801 () Bool)

(assert (=> b!453434 m!437801))

(assert (=> b!453176 d!74485))

(declare-fun d!74487 () Bool)

(declare-fun c!56233 () Bool)

(assert (=> d!74487 (= c!56233 ((_ is ValueCellFull!5726) (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265405 () V!17291)

(assert (=> d!74487 (= (get!6656 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265405)))

(declare-fun b!453435 () Bool)

(assert (=> b!453435 (= e!265405 (get!6659 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453436 () Bool)

(assert (=> b!453436 (= e!265405 (get!6660 (select (arr!13482 lt!205573) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74487 c!56233) b!453435))

(assert (= (and d!74487 (not c!56233)) b!453436))

(assert (=> b!453435 m!437309))

(assert (=> b!453435 m!437019))

(declare-fun m!437803 () Bool)

(assert (=> b!453435 m!437803))

(assert (=> b!453436 m!437309))

(assert (=> b!453436 m!437019))

(declare-fun m!437805 () Bool)

(assert (=> b!453436 m!437805))

(assert (=> b!453176 d!74487))

(declare-fun d!74489 () Bool)

(assert (=> d!74489 (not (contains!2478 (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703)) lt!205707))))

(declare-fun lt!205857 () Unit!13229)

(assert (=> d!74489 (= lt!205857 (choose!1336 lt!205702 lt!205708 lt!205703 lt!205707))))

(declare-fun e!265406 () Bool)

(assert (=> d!74489 e!265406))

(declare-fun res!270115 () Bool)

(assert (=> d!74489 (=> (not res!270115) (not e!265406))))

(assert (=> d!74489 (= res!270115 (not (contains!2478 lt!205702 lt!205707)))))

(assert (=> d!74489 (= (addStillNotContains!148 lt!205702 lt!205708 lt!205703 lt!205707) lt!205857)))

(declare-fun b!453437 () Bool)

(assert (=> b!453437 (= e!265406 (not (= lt!205708 lt!205707)))))

(assert (= (and d!74489 res!270115) b!453437))

(assert (=> d!74489 m!437315))

(assert (=> d!74489 m!437315))

(assert (=> d!74489 m!437319))

(declare-fun m!437807 () Bool)

(assert (=> d!74489 m!437807))

(declare-fun m!437809 () Bool)

(assert (=> d!74489 m!437809))

(assert (=> b!453176 d!74489))

(declare-fun d!74491 () Bool)

(declare-fun e!265407 () Bool)

(assert (=> d!74491 e!265407))

(declare-fun res!270116 () Bool)

(assert (=> d!74491 (=> res!270116 e!265407)))

(declare-fun lt!205859 () Bool)

(assert (=> d!74491 (= res!270116 (not lt!205859))))

(declare-fun lt!205860 () Bool)

(assert (=> d!74491 (= lt!205859 lt!205860)))

(declare-fun lt!205861 () Unit!13229)

(declare-fun e!265408 () Unit!13229)

(assert (=> d!74491 (= lt!205861 e!265408)))

(declare-fun c!56234 () Bool)

(assert (=> d!74491 (= c!56234 lt!205860)))

(assert (=> d!74491 (= lt!205860 (containsKey!347 (toList!3451 (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703))) lt!205707))))

(assert (=> d!74491 (= (contains!2478 (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703)) lt!205707) lt!205859)))

(declare-fun b!453438 () Bool)

(declare-fun lt!205858 () Unit!13229)

(assert (=> b!453438 (= e!265408 lt!205858)))

(assert (=> b!453438 (= lt!205858 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703))) lt!205707))))

(assert (=> b!453438 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703))) lt!205707))))

(declare-fun b!453439 () Bool)

(declare-fun Unit!13244 () Unit!13229)

(assert (=> b!453439 (= e!265408 Unit!13244)))

(declare-fun b!453440 () Bool)

(assert (=> b!453440 (= e!265407 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205702 (tuple2!7957 lt!205708 lt!205703))) lt!205707)))))

(assert (= (and d!74491 c!56234) b!453438))

(assert (= (and d!74491 (not c!56234)) b!453439))

(assert (= (and d!74491 (not res!270116)) b!453440))

(declare-fun m!437811 () Bool)

(assert (=> d!74491 m!437811))

(declare-fun m!437813 () Bool)

(assert (=> b!453438 m!437813))

(declare-fun m!437815 () Bool)

(assert (=> b!453438 m!437815))

(assert (=> b!453438 m!437815))

(declare-fun m!437817 () Bool)

(assert (=> b!453438 m!437817))

(assert (=> b!453440 m!437815))

(assert (=> b!453440 m!437815))

(assert (=> b!453440 m!437817))

(assert (=> b!453176 d!74491))

(declare-fun d!74493 () Bool)

(declare-fun e!265409 () Bool)

(assert (=> d!74493 e!265409))

(declare-fun res!270117 () Bool)

(assert (=> d!74493 (=> (not res!270117) (not e!265409))))

(declare-fun lt!205863 () ListLongMap!6871)

(assert (=> d!74493 (= res!270117 (contains!2478 lt!205863 (_1!3989 (tuple2!7957 k0!794 lt!205574))))))

(declare-fun lt!205862 () List!8023)

(assert (=> d!74493 (= lt!205863 (ListLongMap!6872 lt!205862))))

(declare-fun lt!205864 () Unit!13229)

(declare-fun lt!205865 () Unit!13229)

(assert (=> d!74493 (= lt!205864 lt!205865)))

(assert (=> d!74493 (= (getValueByKey!371 lt!205862 (_1!3989 (tuple2!7957 k0!794 lt!205574))) (Some!376 (_2!3989 (tuple2!7957 k0!794 lt!205574))))))

(assert (=> d!74493 (= lt!205865 (lemmaContainsTupThenGetReturnValue!193 lt!205862 (_1!3989 (tuple2!7957 k0!794 lt!205574)) (_2!3989 (tuple2!7957 k0!794 lt!205574))))))

(assert (=> d!74493 (= lt!205862 (insertStrictlySorted!196 (toList!3451 lt!205567) (_1!3989 (tuple2!7957 k0!794 lt!205574)) (_2!3989 (tuple2!7957 k0!794 lt!205574))))))

(assert (=> d!74493 (= (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205574)) lt!205863)))

(declare-fun b!453441 () Bool)

(declare-fun res!270118 () Bool)

(assert (=> b!453441 (=> (not res!270118) (not e!265409))))

(assert (=> b!453441 (= res!270118 (= (getValueByKey!371 (toList!3451 lt!205863) (_1!3989 (tuple2!7957 k0!794 lt!205574))) (Some!376 (_2!3989 (tuple2!7957 k0!794 lt!205574)))))))

(declare-fun b!453442 () Bool)

(assert (=> b!453442 (= e!265409 (contains!2479 (toList!3451 lt!205863) (tuple2!7957 k0!794 lt!205574)))))

(assert (= (and d!74493 res!270117) b!453441))

(assert (= (and b!453441 res!270118) b!453442))

(declare-fun m!437819 () Bool)

(assert (=> d!74493 m!437819))

(declare-fun m!437821 () Bool)

(assert (=> d!74493 m!437821))

(declare-fun m!437823 () Bool)

(assert (=> d!74493 m!437823))

(declare-fun m!437825 () Bool)

(assert (=> d!74493 m!437825))

(declare-fun m!437827 () Bool)

(assert (=> b!453441 m!437827))

(declare-fun m!437829 () Bool)

(assert (=> b!453442 m!437829))

(assert (=> d!74363 d!74493))

(declare-fun d!74495 () Bool)

(declare-fun e!265410 () Bool)

(assert (=> d!74495 e!265410))

(declare-fun res!270119 () Bool)

(assert (=> d!74495 (=> (not res!270119) (not e!265410))))

(declare-fun lt!205867 () ListLongMap!6871)

(assert (=> d!74495 (= res!270119 (contains!2478 lt!205867 (_1!3989 (tuple2!7957 k0!794 lt!205574))))))

(declare-fun lt!205866 () List!8023)

(assert (=> d!74495 (= lt!205867 (ListLongMap!6872 lt!205866))))

(declare-fun lt!205868 () Unit!13229)

(declare-fun lt!205869 () Unit!13229)

(assert (=> d!74495 (= lt!205868 lt!205869)))

(assert (=> d!74495 (= (getValueByKey!371 lt!205866 (_1!3989 (tuple2!7957 k0!794 lt!205574))) (Some!376 (_2!3989 (tuple2!7957 k0!794 lt!205574))))))

(assert (=> d!74495 (= lt!205869 (lemmaContainsTupThenGetReturnValue!193 lt!205866 (_1!3989 (tuple2!7957 k0!794 lt!205574)) (_2!3989 (tuple2!7957 k0!794 lt!205574))))))

(assert (=> d!74495 (= lt!205866 (insertStrictlySorted!196 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))) (_1!3989 (tuple2!7957 k0!794 lt!205574)) (_2!3989 (tuple2!7957 k0!794 lt!205574))))))

(assert (=> d!74495 (= (+!1575 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)) (tuple2!7957 k0!794 lt!205574)) lt!205867)))

(declare-fun b!453443 () Bool)

(declare-fun res!270120 () Bool)

(assert (=> b!453443 (=> (not res!270120) (not e!265410))))

(assert (=> b!453443 (= res!270120 (= (getValueByKey!371 (toList!3451 lt!205867) (_1!3989 (tuple2!7957 k0!794 lt!205574))) (Some!376 (_2!3989 (tuple2!7957 k0!794 lt!205574)))))))

(declare-fun b!453444 () Bool)

(assert (=> b!453444 (= e!265410 (contains!2479 (toList!3451 lt!205867) (tuple2!7957 k0!794 lt!205574)))))

(assert (= (and d!74495 res!270119) b!453443))

(assert (= (and b!453443 res!270120) b!453444))

(declare-fun m!437831 () Bool)

(assert (=> d!74495 m!437831))

(declare-fun m!437833 () Bool)

(assert (=> d!74495 m!437833))

(declare-fun m!437835 () Bool)

(assert (=> d!74495 m!437835))

(declare-fun m!437837 () Bool)

(assert (=> d!74495 m!437837))

(declare-fun m!437839 () Bool)

(assert (=> b!453443 m!437839))

(declare-fun m!437841 () Bool)

(assert (=> b!453444 m!437841))

(assert (=> d!74363 d!74495))

(assert (=> d!74363 d!74365))

(declare-fun d!74497 () Bool)

(assert (=> d!74497 (= (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205574)) (+!1575 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)) (tuple2!7957 k0!794 lt!205574)))))

(assert (=> d!74497 true))

(declare-fun _$24!42 () Unit!13229)

(assert (=> d!74497 (= (choose!1334 lt!205567 k0!794 lt!205569 lt!205574) _$24!42)))

(declare-fun bs!14423 () Bool)

(assert (= bs!14423 d!74497))

(assert (=> bs!14423 m!437253))

(assert (=> bs!14423 m!437013))

(assert (=> bs!14423 m!437013))

(assert (=> bs!14423 m!437255))

(assert (=> d!74363 d!74497))

(declare-fun d!74499 () Bool)

(assert (=> d!74499 (= (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)) (and (not (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453139 d!74499))

(declare-fun d!74501 () Bool)

(declare-fun lt!205872 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!205 (List!8023) (InoxSet tuple2!7956))

(assert (=> d!74501 (= lt!205872 (select (content!205 (toList!3451 lt!205695)) (tuple2!7957 k0!794 v!412)))))

(declare-fun e!265415 () Bool)

(assert (=> d!74501 (= lt!205872 e!265415)))

(declare-fun res!270126 () Bool)

(assert (=> d!74501 (=> (not res!270126) (not e!265415))))

(assert (=> d!74501 (= res!270126 ((_ is Cons!8019) (toList!3451 lt!205695)))))

(assert (=> d!74501 (= (contains!2479 (toList!3451 lt!205695) (tuple2!7957 k0!794 v!412)) lt!205872)))

(declare-fun b!453449 () Bool)

(declare-fun e!265416 () Bool)

(assert (=> b!453449 (= e!265415 e!265416)))

(declare-fun res!270125 () Bool)

(assert (=> b!453449 (=> res!270125 e!265416)))

(assert (=> b!453449 (= res!270125 (= (h!8875 (toList!3451 lt!205695)) (tuple2!7957 k0!794 v!412)))))

(declare-fun b!453450 () Bool)

(assert (=> b!453450 (= e!265416 (contains!2479 (t!13839 (toList!3451 lt!205695)) (tuple2!7957 k0!794 v!412)))))

(assert (= (and d!74501 res!270126) b!453449))

(assert (= (and b!453449 (not res!270125)) b!453450))

(declare-fun m!437843 () Bool)

(assert (=> d!74501 m!437843))

(declare-fun m!437845 () Bool)

(assert (=> d!74501 m!437845))

(declare-fun m!437847 () Bool)

(assert (=> b!453450 m!437847))

(assert (=> b!453165 d!74501))

(declare-fun b!453451 () Bool)

(declare-fun e!265420 () ListLongMap!6871)

(declare-fun e!265422 () ListLongMap!6871)

(assert (=> b!453451 (= e!265420 e!265422)))

(declare-fun c!56236 () Bool)

(assert (=> b!453451 (= c!56236 (validKeyInArray!0 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun bm!30057 () Bool)

(declare-fun call!30060 () ListLongMap!6871)

(assert (=> bm!30057 (= call!30060 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 lt!205566 _keys!709) (ite c!56123 lt!205573 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453452 () Bool)

(declare-fun res!270129 () Bool)

(declare-fun e!265421 () Bool)

(assert (=> b!453452 (=> (not res!270129) (not e!265421))))

(declare-fun lt!205875 () ListLongMap!6871)

(assert (=> b!453452 (= res!270129 (not (contains!2478 lt!205875 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453453 () Bool)

(assert (=> b!453453 (= e!265420 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453455 () Bool)

(declare-fun e!265419 () Bool)

(declare-fun e!265418 () Bool)

(assert (=> b!453455 (= e!265419 e!265418)))

(declare-fun c!56235 () Bool)

(assert (=> b!453455 (= c!56235 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(declare-fun b!453456 () Bool)

(declare-fun e!265423 () Bool)

(assert (=> b!453456 (= e!265419 e!265423)))

(assert (=> b!453456 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(declare-fun res!270128 () Bool)

(assert (=> b!453456 (= res!270128 (contains!2478 lt!205875 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453456 (=> (not res!270128) (not e!265423))))

(declare-fun b!453457 () Bool)

(declare-fun lt!205876 () Unit!13229)

(declare-fun lt!205877 () Unit!13229)

(assert (=> b!453457 (= lt!205876 lt!205877)))

(declare-fun lt!205874 () V!17291)

(declare-fun lt!205879 () (_ BitVec 64))

(declare-fun lt!205878 () (_ BitVec 64))

(declare-fun lt!205873 () ListLongMap!6871)

(assert (=> b!453457 (not (contains!2478 (+!1575 lt!205873 (tuple2!7957 lt!205879 lt!205874)) lt!205878))))

(assert (=> b!453457 (= lt!205877 (addStillNotContains!148 lt!205873 lt!205879 lt!205874 lt!205878))))

(assert (=> b!453457 (= lt!205878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453457 (= lt!205874 (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453457 (= lt!205879 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(assert (=> b!453457 (= lt!205873 call!30060)))

(assert (=> b!453457 (= e!265422 (+!1575 call!30060 (tuple2!7957 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453458 () Bool)

(declare-fun e!265417 () Bool)

(assert (=> b!453458 (= e!265417 (validKeyInArray!0 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453458 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453459 () Bool)

(assert (=> b!453459 (= e!265421 e!265419)))

(declare-fun c!56237 () Bool)

(assert (=> b!453459 (= c!56237 e!265417)))

(declare-fun res!270127 () Bool)

(assert (=> b!453459 (=> (not res!270127) (not e!265417))))

(assert (=> b!453459 (= res!270127 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(declare-fun b!453460 () Bool)

(assert (=> b!453460 (= e!265418 (isEmpty!565 lt!205875))))

(declare-fun b!453461 () Bool)

(assert (=> b!453461 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(assert (=> b!453461 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56123 lt!205573 _values!549))))))

(assert (=> b!453461 (= e!265423 (= (apply!313 lt!205875 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6656 (select (arr!13482 (ite c!56123 lt!205573 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453462 () Bool)

(assert (=> b!453462 (= e!265422 call!30060)))

(declare-fun d!74503 () Bool)

(assert (=> d!74503 e!265421))

(declare-fun res!270130 () Bool)

(assert (=> d!74503 (=> (not res!270130) (not e!265421))))

(assert (=> d!74503 (= res!270130 (not (contains!2478 lt!205875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74503 (= lt!205875 e!265420)))

(declare-fun c!56238 () Bool)

(assert (=> d!74503 (= c!56238 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13833 (ite c!56123 lt!205566 _keys!709))))))

(assert (=> d!74503 (validMask!0 mask!1025)))

(assert (=> d!74503 (= (getCurrentListMapNoExtraKeys!1680 (ite c!56123 lt!205566 _keys!709) (ite c!56123 lt!205573 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205875)))

(declare-fun b!453454 () Bool)

(assert (=> b!453454 (= e!265418 (= lt!205875 (getCurrentListMapNoExtraKeys!1680 (ite c!56123 lt!205566 _keys!709) (ite c!56123 lt!205573 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74503 c!56238) b!453453))

(assert (= (and d!74503 (not c!56238)) b!453451))

(assert (= (and b!453451 c!56236) b!453457))

(assert (= (and b!453451 (not c!56236)) b!453462))

(assert (= (or b!453457 b!453462) bm!30057))

(assert (= (and d!74503 res!270130) b!453452))

(assert (= (and b!453452 res!270129) b!453459))

(assert (= (and b!453459 res!270127) b!453458))

(assert (= (and b!453459 c!56237) b!453456))

(assert (= (and b!453459 (not c!56237)) b!453455))

(assert (= (and b!453456 res!270128) b!453461))

(assert (= (and b!453455 c!56235) b!453454))

(assert (= (and b!453455 (not c!56235)) b!453460))

(declare-fun b_lambda!9657 () Bool)

(assert (=> (not b_lambda!9657) (not b!453457)))

(assert (=> b!453457 t!13838))

(declare-fun b_and!18947 () Bool)

(assert (= b_and!18945 (and (=> t!13838 result!7091) b_and!18947)))

(declare-fun b_lambda!9659 () Bool)

(assert (=> (not b_lambda!9659) (not b!453461)))

(assert (=> b!453461 t!13838))

(declare-fun b_and!18949 () Bool)

(assert (= b_and!18947 (and (=> t!13838 result!7091) b_and!18949)))

(declare-fun m!437849 () Bool)

(assert (=> bm!30057 m!437849))

(declare-fun m!437851 () Bool)

(assert (=> b!453460 m!437851))

(declare-fun m!437853 () Bool)

(assert (=> b!453456 m!437853))

(assert (=> b!453456 m!437853))

(declare-fun m!437855 () Bool)

(assert (=> b!453456 m!437855))

(declare-fun m!437857 () Bool)

(assert (=> b!453452 m!437857))

(assert (=> b!453454 m!437849))

(declare-fun m!437859 () Bool)

(assert (=> b!453461 m!437859))

(assert (=> b!453461 m!437019))

(declare-fun m!437861 () Bool)

(assert (=> b!453461 m!437861))

(assert (=> b!453461 m!437853))

(declare-fun m!437863 () Bool)

(assert (=> b!453461 m!437863))

(assert (=> b!453461 m!437859))

(assert (=> b!453461 m!437019))

(assert (=> b!453461 m!437853))

(assert (=> b!453457 m!437859))

(assert (=> b!453457 m!437019))

(assert (=> b!453457 m!437861))

(declare-fun m!437865 () Bool)

(assert (=> b!453457 m!437865))

(assert (=> b!453457 m!437859))

(assert (=> b!453457 m!437019))

(declare-fun m!437867 () Bool)

(assert (=> b!453457 m!437867))

(assert (=> b!453457 m!437865))

(declare-fun m!437869 () Bool)

(assert (=> b!453457 m!437869))

(assert (=> b!453457 m!437853))

(declare-fun m!437871 () Bool)

(assert (=> b!453457 m!437871))

(declare-fun m!437873 () Bool)

(assert (=> d!74503 m!437873))

(assert (=> d!74503 m!436979))

(assert (=> b!453451 m!437853))

(assert (=> b!453451 m!437853))

(declare-fun m!437875 () Bool)

(assert (=> b!453451 m!437875))

(assert (=> b!453458 m!437853))

(assert (=> b!453458 m!437853))

(assert (=> b!453458 m!437875))

(assert (=> b!453185 d!74503))

(declare-fun d!74505 () Bool)

(declare-fun e!265424 () Bool)

(assert (=> d!74505 e!265424))

(declare-fun res!270131 () Bool)

(assert (=> d!74505 (=> res!270131 e!265424)))

(declare-fun lt!205881 () Bool)

(assert (=> d!74505 (= res!270131 (not lt!205881))))

(declare-fun lt!205882 () Bool)

(assert (=> d!74505 (= lt!205881 lt!205882)))

(declare-fun lt!205883 () Unit!13229)

(declare-fun e!265425 () Unit!13229)

(assert (=> d!74505 (= lt!205883 e!265425)))

(declare-fun c!56239 () Bool)

(assert (=> d!74505 (= c!56239 lt!205882)))

(assert (=> d!74505 (= lt!205882 (containsKey!347 (toList!3451 lt!205711) (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74505 (= (contains!2478 lt!205711 (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) lt!205881)))

(declare-fun b!453463 () Bool)

(declare-fun lt!205880 () Unit!13229)

(assert (=> b!453463 (= e!265425 lt!205880)))

(assert (=> b!453463 (= lt!205880 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205711) (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453463 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205711) (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453464 () Bool)

(declare-fun Unit!13245 () Unit!13229)

(assert (=> b!453464 (= e!265425 Unit!13245)))

(declare-fun b!453465 () Bool)

(assert (=> b!453465 (= e!265424 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205711) (select (arr!13481 (ite c!56123 lt!205566 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74505 c!56239) b!453463))

(assert (= (and d!74505 (not c!56239)) b!453464))

(assert (= (and d!74505 (not res!270131)) b!453465))

(assert (=> d!74505 m!437331))

(declare-fun m!437877 () Bool)

(assert (=> d!74505 m!437877))

(assert (=> b!453463 m!437331))

(declare-fun m!437879 () Bool)

(assert (=> b!453463 m!437879))

(assert (=> b!453463 m!437331))

(assert (=> b!453463 m!437435))

(assert (=> b!453463 m!437435))

(declare-fun m!437881 () Bool)

(assert (=> b!453463 m!437881))

(assert (=> b!453465 m!437331))

(assert (=> b!453465 m!437435))

(assert (=> b!453465 m!437435))

(assert (=> b!453465 m!437881))

(assert (=> b!453187 d!74505))

(declare-fun d!74507 () Bool)

(declare-fun lt!205884 () Bool)

(assert (=> d!74507 (= lt!205884 (select (content!205 (toList!3451 lt!205699)) lt!205564))))

(declare-fun e!265426 () Bool)

(assert (=> d!74507 (= lt!205884 e!265426)))

(declare-fun res!270133 () Bool)

(assert (=> d!74507 (=> (not res!270133) (not e!265426))))

(assert (=> d!74507 (= res!270133 ((_ is Cons!8019) (toList!3451 lt!205699)))))

(assert (=> d!74507 (= (contains!2479 (toList!3451 lt!205699) lt!205564) lt!205884)))

(declare-fun b!453466 () Bool)

(declare-fun e!265427 () Bool)

(assert (=> b!453466 (= e!265426 e!265427)))

(declare-fun res!270132 () Bool)

(assert (=> b!453466 (=> res!270132 e!265427)))

(assert (=> b!453466 (= res!270132 (= (h!8875 (toList!3451 lt!205699)) lt!205564))))

(declare-fun b!453467 () Bool)

(assert (=> b!453467 (= e!265427 (contains!2479 (t!13839 (toList!3451 lt!205699)) lt!205564))))

(assert (= (and d!74507 res!270133) b!453466))

(assert (= (and b!453466 (not res!270132)) b!453467))

(declare-fun m!437883 () Bool)

(assert (=> d!74507 m!437883))

(declare-fun m!437885 () Bool)

(assert (=> d!74507 m!437885))

(declare-fun m!437887 () Bool)

(assert (=> b!453467 m!437887))

(assert (=> b!453167 d!74507))

(declare-fun d!74509 () Bool)

(declare-fun e!265428 () Bool)

(assert (=> d!74509 e!265428))

(declare-fun res!270134 () Bool)

(assert (=> d!74509 (=> res!270134 e!265428)))

(declare-fun lt!205886 () Bool)

(assert (=> d!74509 (= res!270134 (not lt!205886))))

(declare-fun lt!205887 () Bool)

(assert (=> d!74509 (= lt!205886 lt!205887)))

(declare-fun lt!205888 () Unit!13229)

(declare-fun e!265429 () Unit!13229)

(assert (=> d!74509 (= lt!205888 e!265429)))

(declare-fun c!56240 () Bool)

(assert (=> d!74509 (= c!56240 lt!205887)))

(assert (=> d!74509 (= lt!205887 (containsKey!347 (toList!3451 lt!205711) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74509 (= (contains!2478 lt!205711 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205886)))

(declare-fun b!453468 () Bool)

(declare-fun lt!205885 () Unit!13229)

(assert (=> b!453468 (= e!265429 lt!205885)))

(assert (=> b!453468 (= lt!205885 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205711) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453468 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205711) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453469 () Bool)

(declare-fun Unit!13246 () Unit!13229)

(assert (=> b!453469 (= e!265429 Unit!13246)))

(declare-fun b!453470 () Bool)

(assert (=> b!453470 (= e!265428 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74509 c!56240) b!453468))

(assert (= (and d!74509 (not c!56240)) b!453469))

(assert (= (and d!74509 (not res!270134)) b!453470))

(declare-fun m!437889 () Bool)

(assert (=> d!74509 m!437889))

(declare-fun m!437891 () Bool)

(assert (=> b!453468 m!437891))

(declare-fun m!437893 () Bool)

(assert (=> b!453468 m!437893))

(assert (=> b!453468 m!437893))

(declare-fun m!437895 () Bool)

(assert (=> b!453468 m!437895))

(assert (=> b!453470 m!437893))

(assert (=> b!453470 m!437893))

(assert (=> b!453470 m!437895))

(assert (=> b!453183 d!74509))

(declare-fun lt!205889 () Bool)

(declare-fun d!74511 () Bool)

(assert (=> d!74511 (= lt!205889 (select (content!205 (toList!3451 lt!205680)) (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))

(declare-fun e!265430 () Bool)

(assert (=> d!74511 (= lt!205889 e!265430)))

(declare-fun res!270136 () Bool)

(assert (=> d!74511 (=> (not res!270136) (not e!265430))))

(assert (=> d!74511 (= res!270136 ((_ is Cons!8019) (toList!3451 lt!205680)))))

(assert (=> d!74511 (= (contains!2479 (toList!3451 lt!205680) (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)) lt!205889)))

(declare-fun b!453471 () Bool)

(declare-fun e!265431 () Bool)

(assert (=> b!453471 (= e!265430 e!265431)))

(declare-fun res!270135 () Bool)

(assert (=> b!453471 (=> res!270135 e!265431)))

(assert (=> b!453471 (= res!270135 (= (h!8875 (toList!3451 lt!205680)) (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))

(declare-fun b!453472 () Bool)

(assert (=> b!453472 (= e!265431 (contains!2479 (t!13839 (toList!3451 lt!205680)) (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))

(assert (= (and d!74511 res!270136) b!453471))

(assert (= (and b!453471 (not res!270135)) b!453472))

(declare-fun m!437897 () Bool)

(assert (=> d!74511 m!437897))

(declare-fun m!437899 () Bool)

(assert (=> d!74511 m!437899))

(declare-fun m!437901 () Bool)

(assert (=> b!453472 m!437901))

(assert (=> b!453153 d!74511))

(declare-fun d!74513 () Bool)

(assert (=> d!74513 (= (get!6659 (select (arr!13482 _values!549) from!863) lt!205570) (v!8374 (select (arr!13482 _values!549) from!863)))))

(assert (=> b!453168 d!74513))

(declare-fun d!74515 () Bool)

(assert (=> d!74515 (= (apply!313 lt!205704 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))) (get!6661 (getValueByKey!371 (toList!3451 lt!205704) (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14424 () Bool)

(assert (= bs!14424 d!74515))

(assert (=> bs!14424 m!437303))

(declare-fun m!437903 () Bool)

(assert (=> bs!14424 m!437903))

(assert (=> bs!14424 m!437903))

(declare-fun m!437905 () Bool)

(assert (=> bs!14424 m!437905))

(assert (=> b!453180 d!74515))

(assert (=> b!453180 d!74487))

(declare-fun b!453473 () Bool)

(declare-fun e!265432 () Option!377)

(assert (=> b!453473 (= e!265432 (Some!376 (_2!3989 (h!8875 (toList!3451 lt!205684)))))))

(declare-fun d!74517 () Bool)

(declare-fun c!56241 () Bool)

(assert (=> d!74517 (= c!56241 (and ((_ is Cons!8019) (toList!3451 lt!205684)) (= (_1!3989 (h!8875 (toList!3451 lt!205684))) (_1!3989 lt!205564))))))

(assert (=> d!74517 (= (getValueByKey!371 (toList!3451 lt!205684) (_1!3989 lt!205564)) e!265432)))

(declare-fun b!453474 () Bool)

(declare-fun e!265433 () Option!377)

(assert (=> b!453474 (= e!265432 e!265433)))

(declare-fun c!56242 () Bool)

(assert (=> b!453474 (= c!56242 (and ((_ is Cons!8019) (toList!3451 lt!205684)) (not (= (_1!3989 (h!8875 (toList!3451 lt!205684))) (_1!3989 lt!205564)))))))

(declare-fun b!453475 () Bool)

(assert (=> b!453475 (= e!265433 (getValueByKey!371 (t!13839 (toList!3451 lt!205684)) (_1!3989 lt!205564)))))

(declare-fun b!453476 () Bool)

(assert (=> b!453476 (= e!265433 None!375)))

(assert (= (and d!74517 c!56241) b!453473))

(assert (= (and d!74517 (not c!56241)) b!453474))

(assert (= (and b!453474 c!56242) b!453475))

(assert (= (and b!453474 (not c!56242)) b!453476))

(declare-fun m!437907 () Bool)

(assert (=> b!453475 m!437907))

(assert (=> b!453160 d!74517))

(declare-fun d!74519 () Bool)

(declare-fun lt!205890 () Bool)

(assert (=> d!74519 (= lt!205890 (select (content!205 (toList!3451 lt!205691)) (tuple2!7957 k0!794 lt!205569)))))

(declare-fun e!265434 () Bool)

(assert (=> d!74519 (= lt!205890 e!265434)))

(declare-fun res!270138 () Bool)

(assert (=> d!74519 (=> (not res!270138) (not e!265434))))

(assert (=> d!74519 (= res!270138 ((_ is Cons!8019) (toList!3451 lt!205691)))))

(assert (=> d!74519 (= (contains!2479 (toList!3451 lt!205691) (tuple2!7957 k0!794 lt!205569)) lt!205890)))

(declare-fun b!453477 () Bool)

(declare-fun e!265435 () Bool)

(assert (=> b!453477 (= e!265434 e!265435)))

(declare-fun res!270137 () Bool)

(assert (=> b!453477 (=> res!270137 e!265435)))

(assert (=> b!453477 (= res!270137 (= (h!8875 (toList!3451 lt!205691)) (tuple2!7957 k0!794 lt!205569)))))

(declare-fun b!453478 () Bool)

(assert (=> b!453478 (= e!265435 (contains!2479 (t!13839 (toList!3451 lt!205691)) (tuple2!7957 k0!794 lt!205569)))))

(assert (= (and d!74519 res!270138) b!453477))

(assert (= (and b!453477 (not res!270137)) b!453478))

(declare-fun m!437909 () Bool)

(assert (=> d!74519 m!437909))

(declare-fun m!437911 () Bool)

(assert (=> d!74519 m!437911))

(declare-fun m!437913 () Bool)

(assert (=> b!453478 m!437913))

(assert (=> b!453163 d!74519))

(declare-fun d!74521 () Bool)

(declare-fun lt!205893 () Bool)

(declare-fun content!206 (List!8024) (InoxSet (_ BitVec 64)))

(assert (=> d!74521 (= lt!205893 (select (content!206 Nil!8021) (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(declare-fun e!265441 () Bool)

(assert (=> d!74521 (= lt!205893 e!265441)))

(declare-fun res!270144 () Bool)

(assert (=> d!74521 (=> (not res!270144) (not e!265441))))

(assert (=> d!74521 (= res!270144 ((_ is Cons!8020) Nil!8021))))

(assert (=> d!74521 (= (contains!2477 Nil!8021 (select (arr!13481 lt!205566) #b00000000000000000000000000000000)) lt!205893)))

(declare-fun b!453483 () Bool)

(declare-fun e!265440 () Bool)

(assert (=> b!453483 (= e!265441 e!265440)))

(declare-fun res!270143 () Bool)

(assert (=> b!453483 (=> res!270143 e!265440)))

(assert (=> b!453483 (= res!270143 (= (h!8876 Nil!8021) (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(declare-fun b!453484 () Bool)

(assert (=> b!453484 (= e!265440 (contains!2477 (t!13840 Nil!8021) (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(assert (= (and d!74521 res!270144) b!453483))

(assert (= (and b!453483 (not res!270143)) b!453484))

(declare-fun m!437915 () Bool)

(assert (=> d!74521 m!437915))

(assert (=> d!74521 m!437217))

(declare-fun m!437917 () Bool)

(assert (=> d!74521 m!437917))

(assert (=> b!453484 m!437217))

(declare-fun m!437919 () Bool)

(assert (=> b!453484 m!437919))

(assert (=> b!453147 d!74521))

(declare-fun b!453485 () Bool)

(declare-fun e!265445 () ListLongMap!6871)

(declare-fun e!265447 () ListLongMap!6871)

(assert (=> b!453485 (= e!265445 e!265447)))

(declare-fun c!56244 () Bool)

(assert (=> b!453485 (= c!56244 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd from!863 #b00000000000000000000000000000001))))))

(declare-fun bm!30058 () Bool)

(declare-fun call!30061 () ListLongMap!6871)

(assert (=> bm!30058 (= call!30061 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453486 () Bool)

(declare-fun res!270147 () Bool)

(declare-fun e!265446 () Bool)

(assert (=> b!453486 (=> (not res!270147) (not e!265446))))

(declare-fun lt!205896 () ListLongMap!6871)

(assert (=> b!453486 (= res!270147 (not (contains!2478 lt!205896 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453487 () Bool)

(assert (=> b!453487 (= e!265445 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453489 () Bool)

(declare-fun e!265444 () Bool)

(declare-fun e!265443 () Bool)

(assert (=> b!453489 (= e!265444 e!265443)))

(declare-fun c!56243 () Bool)

(assert (=> b!453489 (= c!56243 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(declare-fun b!453490 () Bool)

(declare-fun e!265448 () Bool)

(assert (=> b!453490 (= e!265444 e!265448)))

(assert (=> b!453490 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(declare-fun res!270146 () Bool)

(assert (=> b!453490 (= res!270146 (contains!2478 lt!205896 (select (arr!13481 lt!205566) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453490 (=> (not res!270146) (not e!265448))))

(declare-fun b!453491 () Bool)

(declare-fun lt!205897 () Unit!13229)

(declare-fun lt!205898 () Unit!13229)

(assert (=> b!453491 (= lt!205897 lt!205898)))

(declare-fun lt!205900 () (_ BitVec 64))

(declare-fun lt!205899 () (_ BitVec 64))

(declare-fun lt!205894 () ListLongMap!6871)

(declare-fun lt!205895 () V!17291)

(assert (=> b!453491 (not (contains!2478 (+!1575 lt!205894 (tuple2!7957 lt!205900 lt!205895)) lt!205899))))

(assert (=> b!453491 (= lt!205898 (addStillNotContains!148 lt!205894 lt!205900 lt!205895 lt!205899))))

(assert (=> b!453491 (= lt!205899 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453491 (= lt!205895 (get!6656 (select (arr!13482 lt!205573) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453491 (= lt!205900 (select (arr!13481 lt!205566) (bvadd from!863 #b00000000000000000000000000000001)))))

(assert (=> b!453491 (= lt!205894 call!30061)))

(assert (=> b!453491 (= e!265447 (+!1575 call!30061 (tuple2!7957 (select (arr!13481 lt!205566) (bvadd from!863 #b00000000000000000000000000000001)) (get!6656 (select (arr!13482 lt!205573) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453492 () Bool)

(declare-fun e!265442 () Bool)

(assert (=> b!453492 (= e!265442 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453492 (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453493 () Bool)

(assert (=> b!453493 (= e!265446 e!265444)))

(declare-fun c!56245 () Bool)

(assert (=> b!453493 (= c!56245 e!265442)))

(declare-fun res!270145 () Bool)

(assert (=> b!453493 (=> (not res!270145) (not e!265442))))

(assert (=> b!453493 (= res!270145 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(declare-fun b!453494 () Bool)

(assert (=> b!453494 (= e!265443 (isEmpty!565 lt!205896))))

(declare-fun b!453495 () Bool)

(assert (=> b!453495 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(assert (=> b!453495 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 lt!205573)))))

(assert (=> b!453495 (= e!265448 (= (apply!313 lt!205896 (select (arr!13481 lt!205566) (bvadd from!863 #b00000000000000000000000000000001))) (get!6656 (select (arr!13482 lt!205573) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453496 () Bool)

(assert (=> b!453496 (= e!265447 call!30061)))

(declare-fun d!74523 () Bool)

(assert (=> d!74523 e!265446))

(declare-fun res!270148 () Bool)

(assert (=> d!74523 (=> (not res!270148) (not e!265446))))

(assert (=> d!74523 (= res!270148 (not (contains!2478 lt!205896 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74523 (= lt!205896 e!265445)))

(declare-fun c!56246 () Bool)

(assert (=> d!74523 (= c!56246 (bvsge (bvadd from!863 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(assert (=> d!74523 (validMask!0 mask!1025)))

(assert (=> d!74523 (= (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205896)))

(declare-fun b!453488 () Bool)

(assert (=> b!453488 (= e!265443 (= lt!205896 (getCurrentListMapNoExtraKeys!1680 lt!205566 lt!205573 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74523 c!56246) b!453487))

(assert (= (and d!74523 (not c!56246)) b!453485))

(assert (= (and b!453485 c!56244) b!453491))

(assert (= (and b!453485 (not c!56244)) b!453496))

(assert (= (or b!453491 b!453496) bm!30058))

(assert (= (and d!74523 res!270148) b!453486))

(assert (= (and b!453486 res!270147) b!453493))

(assert (= (and b!453493 res!270145) b!453492))

(assert (= (and b!453493 c!56245) b!453490))

(assert (= (and b!453493 (not c!56245)) b!453489))

(assert (= (and b!453490 res!270146) b!453495))

(assert (= (and b!453489 c!56243) b!453488))

(assert (= (and b!453489 (not c!56243)) b!453494))

(declare-fun b_lambda!9661 () Bool)

(assert (=> (not b_lambda!9661) (not b!453491)))

(assert (=> b!453491 t!13838))

(declare-fun b_and!18951 () Bool)

(assert (= b_and!18949 (and (=> t!13838 result!7091) b_and!18951)))

(declare-fun b_lambda!9663 () Bool)

(assert (=> (not b_lambda!9663) (not b!453495)))

(assert (=> b!453495 t!13838))

(declare-fun b_and!18953 () Bool)

(assert (= b_and!18951 (and (=> t!13838 result!7091) b_and!18953)))

(declare-fun m!437921 () Bool)

(assert (=> bm!30058 m!437921))

(declare-fun m!437923 () Bool)

(assert (=> b!453494 m!437923))

(declare-fun m!437925 () Bool)

(assert (=> b!453490 m!437925))

(assert (=> b!453490 m!437925))

(declare-fun m!437927 () Bool)

(assert (=> b!453490 m!437927))

(declare-fun m!437929 () Bool)

(assert (=> b!453486 m!437929))

(assert (=> b!453488 m!437921))

(declare-fun m!437931 () Bool)

(assert (=> b!453495 m!437931))

(assert (=> b!453495 m!437019))

(declare-fun m!437933 () Bool)

(assert (=> b!453495 m!437933))

(assert (=> b!453495 m!437925))

(declare-fun m!437935 () Bool)

(assert (=> b!453495 m!437935))

(assert (=> b!453495 m!437931))

(assert (=> b!453495 m!437019))

(assert (=> b!453495 m!437925))

(assert (=> b!453491 m!437931))

(assert (=> b!453491 m!437019))

(assert (=> b!453491 m!437933))

(declare-fun m!437937 () Bool)

(assert (=> b!453491 m!437937))

(assert (=> b!453491 m!437931))

(assert (=> b!453491 m!437019))

(declare-fun m!437939 () Bool)

(assert (=> b!453491 m!437939))

(assert (=> b!453491 m!437937))

(declare-fun m!437941 () Bool)

(assert (=> b!453491 m!437941))

(assert (=> b!453491 m!437925))

(declare-fun m!437943 () Bool)

(assert (=> b!453491 m!437943))

(declare-fun m!437945 () Bool)

(assert (=> d!74523 m!437945))

(assert (=> d!74523 m!436979))

(assert (=> b!453485 m!437925))

(assert (=> b!453485 m!437925))

(declare-fun m!437947 () Bool)

(assert (=> b!453485 m!437947))

(assert (=> b!453492 m!437925))

(assert (=> b!453492 m!437925))

(assert (=> b!453492 m!437947))

(assert (=> bm!30032 d!74523))

(declare-fun d!74525 () Bool)

(assert (=> d!74525 (= (isEmpty!565 lt!205711) (isEmpty!566 (toList!3451 lt!205711)))))

(declare-fun bs!14425 () Bool)

(assert (= bs!14425 d!74525))

(declare-fun m!437949 () Bool)

(assert (=> bs!14425 m!437949))

(assert (=> b!453191 d!74525))

(declare-fun d!74527 () Bool)

(assert (=> d!74527 (= (get!6659 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205570) (v!8374 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863)))))

(assert (=> b!453158 d!74527))

(declare-fun b!453497 () Bool)

(declare-fun e!265452 () ListLongMap!6871)

(declare-fun e!265454 () ListLongMap!6871)

(assert (=> b!453497 (= e!265452 e!265454)))

(declare-fun c!56248 () Bool)

(assert (=> b!453497 (= c!56248 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun call!30062 () ListLongMap!6871)

(declare-fun bm!30059 () Bool)

(assert (=> bm!30059 (= call!30062 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453498 () Bool)

(declare-fun res!270151 () Bool)

(declare-fun e!265453 () Bool)

(assert (=> b!453498 (=> (not res!270151) (not e!265453))))

(declare-fun lt!205903 () ListLongMap!6871)

(assert (=> b!453498 (= res!270151 (not (contains!2478 lt!205903 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453499 () Bool)

(assert (=> b!453499 (= e!265452 (ListLongMap!6872 Nil!8020))))

(declare-fun b!453501 () Bool)

(declare-fun e!265451 () Bool)

(declare-fun e!265450 () Bool)

(assert (=> b!453501 (= e!265451 e!265450)))

(declare-fun c!56247 () Bool)

(assert (=> b!453501 (= c!56247 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 _keys!709)))))

(declare-fun b!453502 () Bool)

(declare-fun e!265455 () Bool)

(assert (=> b!453502 (= e!265451 e!265455)))

(assert (=> b!453502 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 _keys!709)))))

(declare-fun res!270150 () Bool)

(assert (=> b!453502 (= res!270150 (contains!2478 lt!205903 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453502 (=> (not res!270150) (not e!265455))))

(declare-fun b!453503 () Bool)

(declare-fun lt!205904 () Unit!13229)

(declare-fun lt!205905 () Unit!13229)

(assert (=> b!453503 (= lt!205904 lt!205905)))

(declare-fun lt!205907 () (_ BitVec 64))

(declare-fun lt!205906 () (_ BitVec 64))

(declare-fun lt!205901 () ListLongMap!6871)

(declare-fun lt!205902 () V!17291)

(assert (=> b!453503 (not (contains!2478 (+!1575 lt!205901 (tuple2!7957 lt!205907 lt!205902)) lt!205906))))

(assert (=> b!453503 (= lt!205905 (addStillNotContains!148 lt!205901 lt!205907 lt!205902 lt!205906))))

(assert (=> b!453503 (= lt!205906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453503 (= lt!205902 (get!6656 (select (arr!13482 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453503 (= lt!205907 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!453503 (= lt!205901 call!30062)))

(assert (=> b!453503 (= e!265454 (+!1575 call!30062 (tuple2!7957 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6656 (select (arr!13482 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453504 () Bool)

(declare-fun e!265449 () Bool)

(assert (=> b!453504 (= e!265449 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453504 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453505 () Bool)

(assert (=> b!453505 (= e!265453 e!265451)))

(declare-fun c!56249 () Bool)

(assert (=> b!453505 (= c!56249 e!265449)))

(declare-fun res!270149 () Bool)

(assert (=> b!453505 (=> (not res!270149) (not e!265449))))

(assert (=> b!453505 (= res!270149 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 _keys!709)))))

(declare-fun b!453506 () Bool)

(assert (=> b!453506 (= e!265450 (isEmpty!565 lt!205903))))

(declare-fun b!453507 () Bool)

(assert (=> b!453507 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13833 _keys!709)))))

(assert (=> b!453507 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 _values!549)))))

(assert (=> b!453507 (= e!265455 (= (apply!313 lt!205903 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6656 (select (arr!13482 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453508 () Bool)

(assert (=> b!453508 (= e!265454 call!30062)))

(declare-fun d!74529 () Bool)

(assert (=> d!74529 e!265453))

(declare-fun res!270152 () Bool)

(assert (=> d!74529 (=> (not res!270152) (not e!265453))))

(assert (=> d!74529 (= res!270152 (not (contains!2478 lt!205903 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74529 (= lt!205903 e!265452)))

(declare-fun c!56250 () Bool)

(assert (=> d!74529 (= c!56250 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13833 _keys!709)))))

(assert (=> d!74529 (validMask!0 mask!1025)))

(assert (=> d!74529 (= (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205903)))

(declare-fun b!453500 () Bool)

(assert (=> b!453500 (= e!265450 (= lt!205903 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(assert (= (and d!74529 c!56250) b!453499))

(assert (= (and d!74529 (not c!56250)) b!453497))

(assert (= (and b!453497 c!56248) b!453503))

(assert (= (and b!453497 (not c!56248)) b!453508))

(assert (= (or b!453503 b!453508) bm!30059))

(assert (= (and d!74529 res!270152) b!453498))

(assert (= (and b!453498 res!270151) b!453505))

(assert (= (and b!453505 res!270149) b!453504))

(assert (= (and b!453505 c!56249) b!453502))

(assert (= (and b!453505 (not c!56249)) b!453501))

(assert (= (and b!453502 res!270150) b!453507))

(assert (= (and b!453501 c!56247) b!453500))

(assert (= (and b!453501 (not c!56247)) b!453506))

(declare-fun b_lambda!9665 () Bool)

(assert (=> (not b_lambda!9665) (not b!453503)))

(assert (=> b!453503 t!13838))

(declare-fun b_and!18955 () Bool)

(assert (= b_and!18953 (and (=> t!13838 result!7091) b_and!18955)))

(declare-fun b_lambda!9667 () Bool)

(assert (=> (not b_lambda!9667) (not b!453507)))

(assert (=> b!453507 t!13838))

(declare-fun b_and!18957 () Bool)

(assert (= b_and!18955 (and (=> t!13838 result!7091) b_and!18957)))

(declare-fun m!437951 () Bool)

(assert (=> bm!30059 m!437951))

(declare-fun m!437953 () Bool)

(assert (=> b!453506 m!437953))

(declare-fun m!437955 () Bool)

(assert (=> b!453502 m!437955))

(assert (=> b!453502 m!437955))

(declare-fun m!437957 () Bool)

(assert (=> b!453502 m!437957))

(declare-fun m!437959 () Bool)

(assert (=> b!453498 m!437959))

(assert (=> b!453500 m!437951))

(declare-fun m!437961 () Bool)

(assert (=> b!453507 m!437961))

(assert (=> b!453507 m!437019))

(declare-fun m!437963 () Bool)

(assert (=> b!453507 m!437963))

(assert (=> b!453507 m!437955))

(declare-fun m!437965 () Bool)

(assert (=> b!453507 m!437965))

(assert (=> b!453507 m!437961))

(assert (=> b!453507 m!437019))

(assert (=> b!453507 m!437955))

(assert (=> b!453503 m!437961))

(assert (=> b!453503 m!437019))

(assert (=> b!453503 m!437963))

(declare-fun m!437967 () Bool)

(assert (=> b!453503 m!437967))

(assert (=> b!453503 m!437961))

(assert (=> b!453503 m!437019))

(declare-fun m!437969 () Bool)

(assert (=> b!453503 m!437969))

(assert (=> b!453503 m!437967))

(declare-fun m!437971 () Bool)

(assert (=> b!453503 m!437971))

(assert (=> b!453503 m!437955))

(declare-fun m!437973 () Bool)

(assert (=> b!453503 m!437973))

(declare-fun m!437975 () Bool)

(assert (=> d!74529 m!437975))

(assert (=> d!74529 m!436979))

(assert (=> b!453497 m!437955))

(assert (=> b!453497 m!437955))

(declare-fun m!437977 () Bool)

(assert (=> b!453497 m!437977))

(assert (=> b!453504 m!437955))

(assert (=> b!453504 m!437955))

(assert (=> b!453504 m!437977))

(assert (=> bm!30031 d!74529))

(declare-fun d!74531 () Bool)

(assert (=> d!74531 (arrayContainsKey!0 lt!205566 lt!205718 #b00000000000000000000000000000000)))

(declare-fun lt!205910 () Unit!13229)

(declare-fun choose!13 (array!28074 (_ BitVec 64) (_ BitVec 32)) Unit!13229)

(assert (=> d!74531 (= lt!205910 (choose!13 lt!205566 lt!205718 #b00000000000000000000000000000000))))

(assert (=> d!74531 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!74531 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205566 lt!205718 #b00000000000000000000000000000000) lt!205910)))

(declare-fun bs!14426 () Bool)

(assert (= bs!14426 d!74531))

(assert (=> bs!14426 m!437359))

(declare-fun m!437979 () Bool)

(assert (=> bs!14426 m!437979))

(assert (=> b!453195 d!74531))

(declare-fun d!74533 () Bool)

(declare-fun res!270153 () Bool)

(declare-fun e!265456 () Bool)

(assert (=> d!74533 (=> res!270153 e!265456)))

(assert (=> d!74533 (= res!270153 (= (select (arr!13481 lt!205566) #b00000000000000000000000000000000) lt!205718))))

(assert (=> d!74533 (= (arrayContainsKey!0 lt!205566 lt!205718 #b00000000000000000000000000000000) e!265456)))

(declare-fun b!453509 () Bool)

(declare-fun e!265457 () Bool)

(assert (=> b!453509 (= e!265456 e!265457)))

(declare-fun res!270154 () Bool)

(assert (=> b!453509 (=> (not res!270154) (not e!265457))))

(assert (=> b!453509 (= res!270154 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(declare-fun b!453510 () Bool)

(assert (=> b!453510 (= e!265457 (arrayContainsKey!0 lt!205566 lt!205718 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74533 (not res!270153)) b!453509))

(assert (= (and b!453509 res!270154) b!453510))

(assert (=> d!74533 m!437217))

(declare-fun m!437981 () Bool)

(assert (=> b!453510 m!437981))

(assert (=> b!453195 d!74533))

(declare-fun b!453523 () Bool)

(declare-fun e!265464 () SeekEntryResult!3481)

(declare-fun e!265465 () SeekEntryResult!3481)

(assert (=> b!453523 (= e!265464 e!265465)))

(declare-fun lt!205917 () (_ BitVec 64))

(declare-fun lt!205918 () SeekEntryResult!3481)

(assert (=> b!453523 (= lt!205917 (select (arr!13481 lt!205566) (index!16105 lt!205918)))))

(declare-fun c!56258 () Bool)

(assert (=> b!453523 (= c!56258 (= lt!205917 (select (arr!13481 lt!205566) #b00000000000000000000000000000000)))))

(declare-fun b!453524 () Bool)

(assert (=> b!453524 (= e!265464 Undefined!3481)))

(declare-fun d!74535 () Bool)

(declare-fun lt!205919 () SeekEntryResult!3481)

(assert (=> d!74535 (and (or ((_ is Undefined!3481) lt!205919) (not ((_ is Found!3481) lt!205919)) (and (bvsge (index!16104 lt!205919) #b00000000000000000000000000000000) (bvslt (index!16104 lt!205919) (size!13833 lt!205566)))) (or ((_ is Undefined!3481) lt!205919) ((_ is Found!3481) lt!205919) (not ((_ is MissingZero!3481) lt!205919)) (and (bvsge (index!16103 lt!205919) #b00000000000000000000000000000000) (bvslt (index!16103 lt!205919) (size!13833 lt!205566)))) (or ((_ is Undefined!3481) lt!205919) ((_ is Found!3481) lt!205919) ((_ is MissingZero!3481) lt!205919) (not ((_ is MissingVacant!3481) lt!205919)) (and (bvsge (index!16106 lt!205919) #b00000000000000000000000000000000) (bvslt (index!16106 lt!205919) (size!13833 lt!205566)))) (or ((_ is Undefined!3481) lt!205919) (ite ((_ is Found!3481) lt!205919) (= (select (arr!13481 lt!205566) (index!16104 lt!205919)) (select (arr!13481 lt!205566) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!3481) lt!205919) (= (select (arr!13481 lt!205566) (index!16103 lt!205919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3481) lt!205919) (= (select (arr!13481 lt!205566) (index!16106 lt!205919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74535 (= lt!205919 e!265464)))

(declare-fun c!56259 () Bool)

(assert (=> d!74535 (= c!56259 (and ((_ is Intermediate!3481) lt!205918) (undefined!4293 lt!205918)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!28074 (_ BitVec 32)) SeekEntryResult!3481)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!74535 (= lt!205918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) mask!1025) (select (arr!13481 lt!205566) #b00000000000000000000000000000000) lt!205566 mask!1025))))

(assert (=> d!74535 (validMask!0 mask!1025)))

(assert (=> d!74535 (= (seekEntryOrOpen!0 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) lt!205566 mask!1025) lt!205919)))

(declare-fun b!453525 () Bool)

(declare-fun c!56257 () Bool)

(assert (=> b!453525 (= c!56257 (= lt!205917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!265466 () SeekEntryResult!3481)

(assert (=> b!453525 (= e!265465 e!265466)))

(declare-fun b!453526 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!28074 (_ BitVec 32)) SeekEntryResult!3481)

(assert (=> b!453526 (= e!265466 (seekKeyOrZeroReturnVacant!0 (x!42407 lt!205918) (index!16105 lt!205918) (index!16105 lt!205918) (select (arr!13481 lt!205566) #b00000000000000000000000000000000) lt!205566 mask!1025))))

(declare-fun b!453527 () Bool)

(assert (=> b!453527 (= e!265465 (Found!3481 (index!16105 lt!205918)))))

(declare-fun b!453528 () Bool)

(assert (=> b!453528 (= e!265466 (MissingZero!3481 (index!16105 lt!205918)))))

(assert (= (and d!74535 c!56259) b!453524))

(assert (= (and d!74535 (not c!56259)) b!453523))

(assert (= (and b!453523 c!56258) b!453527))

(assert (= (and b!453523 (not c!56258)) b!453525))

(assert (= (and b!453525 c!56257) b!453528))

(assert (= (and b!453525 (not c!56257)) b!453526))

(declare-fun m!437983 () Bool)

(assert (=> b!453523 m!437983))

(assert (=> d!74535 m!436979))

(declare-fun m!437985 () Bool)

(assert (=> d!74535 m!437985))

(assert (=> d!74535 m!437217))

(declare-fun m!437987 () Bool)

(assert (=> d!74535 m!437987))

(declare-fun m!437989 () Bool)

(assert (=> d!74535 m!437989))

(declare-fun m!437991 () Bool)

(assert (=> d!74535 m!437991))

(declare-fun m!437993 () Bool)

(assert (=> d!74535 m!437993))

(assert (=> d!74535 m!437217))

(assert (=> d!74535 m!437985))

(assert (=> b!453526 m!437217))

(declare-fun m!437995 () Bool)

(assert (=> b!453526 m!437995))

(assert (=> b!453195 d!74535))

(assert (=> b!453227 d!74391))

(declare-fun d!74537 () Bool)

(assert (=> d!74537 (= (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453170 d!74537))

(declare-fun d!74539 () Bool)

(declare-fun e!265467 () Bool)

(assert (=> d!74539 e!265467))

(declare-fun res!270155 () Bool)

(assert (=> d!74539 (=> res!270155 e!265467)))

(declare-fun lt!205921 () Bool)

(assert (=> d!74539 (= res!270155 (not lt!205921))))

(declare-fun lt!205922 () Bool)

(assert (=> d!74539 (= lt!205921 lt!205922)))

(declare-fun lt!205923 () Unit!13229)

(declare-fun e!265468 () Unit!13229)

(assert (=> d!74539 (= lt!205923 e!265468)))

(declare-fun c!56260 () Bool)

(assert (=> d!74539 (= c!56260 lt!205922)))

(assert (=> d!74539 (= lt!205922 (containsKey!347 (toList!3451 lt!205735) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74539 (= (contains!2478 lt!205735 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205921)))

(declare-fun b!453529 () Bool)

(declare-fun lt!205920 () Unit!13229)

(assert (=> b!453529 (= e!265468 lt!205920)))

(assert (=> b!453529 (= lt!205920 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205735) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453529 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205735) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453530 () Bool)

(declare-fun Unit!13247 () Unit!13229)

(assert (=> b!453530 (= e!265468 Unit!13247)))

(declare-fun b!453531 () Bool)

(assert (=> b!453531 (= e!265467 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74539 c!56260) b!453529))

(assert (= (and d!74539 (not c!56260)) b!453530))

(assert (= (and d!74539 (not res!270155)) b!453531))

(declare-fun m!437997 () Bool)

(assert (=> d!74539 m!437997))

(declare-fun m!437999 () Bool)

(assert (=> b!453529 m!437999))

(declare-fun m!438001 () Bool)

(assert (=> b!453529 m!438001))

(assert (=> b!453529 m!438001))

(declare-fun m!438003 () Bool)

(assert (=> b!453529 m!438003))

(assert (=> b!453531 m!438001))

(assert (=> b!453531 m!438001))

(assert (=> b!453531 m!438003))

(assert (=> b!453228 d!74539))

(assert (=> b!453122 d!74429))

(declare-fun d!74541 () Bool)

(declare-fun e!265469 () Bool)

(assert (=> d!74541 e!265469))

(declare-fun res!270156 () Bool)

(assert (=> d!74541 (=> (not res!270156) (not e!265469))))

(declare-fun lt!205925 () ListLongMap!6871)

(assert (=> d!74541 (= res!270156 (contains!2478 lt!205925 (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun lt!205924 () List!8023)

(assert (=> d!74541 (= lt!205925 (ListLongMap!6872 lt!205924))))

(declare-fun lt!205926 () Unit!13229)

(declare-fun lt!205927 () Unit!13229)

(assert (=> d!74541 (= lt!205926 lt!205927)))

(assert (=> d!74541 (= (getValueByKey!371 lt!205924 (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74541 (= lt!205927 (lemmaContainsTupThenGetReturnValue!193 lt!205924 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74541 (= lt!205924 (insertStrictlySorted!196 (toList!3451 call!30033) (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74541 (= (+!1575 call!30033 (tuple2!7957 k0!794 v!412)) lt!205925)))

(declare-fun b!453532 () Bool)

(declare-fun res!270157 () Bool)

(assert (=> b!453532 (=> (not res!270157) (not e!265469))))

(assert (=> b!453532 (= res!270157 (= (getValueByKey!371 (toList!3451 lt!205925) (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun b!453533 () Bool)

(assert (=> b!453533 (= e!265469 (contains!2479 (toList!3451 lt!205925) (tuple2!7957 k0!794 v!412)))))

(assert (= (and d!74541 res!270156) b!453532))

(assert (= (and b!453532 res!270157) b!453533))

(declare-fun m!438005 () Bool)

(assert (=> d!74541 m!438005))

(declare-fun m!438007 () Bool)

(assert (=> d!74541 m!438007))

(declare-fun m!438009 () Bool)

(assert (=> d!74541 m!438009))

(declare-fun m!438011 () Bool)

(assert (=> d!74541 m!438011))

(declare-fun m!438013 () Bool)

(assert (=> b!453532 m!438013))

(declare-fun m!438015 () Bool)

(assert (=> b!453533 m!438015))

(assert (=> b!453213 d!74541))

(declare-fun d!74543 () Bool)

(declare-fun res!270158 () Bool)

(declare-fun e!265471 () Bool)

(assert (=> d!74543 (=> res!270158 e!265471)))

(assert (=> d!74543 (= res!270158 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(assert (=> d!74543 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!205566 mask!1025) e!265471)))

(declare-fun bm!30060 () Bool)

(declare-fun call!30063 () Bool)

(assert (=> bm!30060 (= call!30063 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!205566 mask!1025))))

(declare-fun b!453534 () Bool)

(declare-fun e!265470 () Bool)

(assert (=> b!453534 (= e!265471 e!265470)))

(declare-fun c!56261 () Bool)

(assert (=> b!453534 (= c!56261 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453535 () Bool)

(declare-fun e!265472 () Bool)

(assert (=> b!453535 (= e!265470 e!265472)))

(declare-fun lt!205930 () (_ BitVec 64))

(assert (=> b!453535 (= lt!205930 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!205929 () Unit!13229)

(assert (=> b!453535 (= lt!205929 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205566 lt!205930 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!453535 (arrayContainsKey!0 lt!205566 lt!205930 #b00000000000000000000000000000000)))

(declare-fun lt!205928 () Unit!13229)

(assert (=> b!453535 (= lt!205928 lt!205929)))

(declare-fun res!270159 () Bool)

(assert (=> b!453535 (= res!270159 (= (seekEntryOrOpen!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!205566 mask!1025) (Found!3481 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!453535 (=> (not res!270159) (not e!265472))))

(declare-fun b!453536 () Bool)

(assert (=> b!453536 (= e!265470 call!30063)))

(declare-fun b!453537 () Bool)

(assert (=> b!453537 (= e!265472 call!30063)))

(assert (= (and d!74543 (not res!270158)) b!453534))

(assert (= (and b!453534 c!56261) b!453535))

(assert (= (and b!453534 (not c!56261)) b!453536))

(assert (= (and b!453535 res!270159) b!453537))

(assert (= (or b!453537 b!453536) bm!30060))

(declare-fun m!438017 () Bool)

(assert (=> bm!30060 m!438017))

(declare-fun m!438019 () Bool)

(assert (=> b!453534 m!438019))

(assert (=> b!453534 m!438019))

(declare-fun m!438021 () Bool)

(assert (=> b!453534 m!438021))

(assert (=> b!453535 m!438019))

(declare-fun m!438023 () Bool)

(assert (=> b!453535 m!438023))

(declare-fun m!438025 () Bool)

(assert (=> b!453535 m!438025))

(assert (=> b!453535 m!438019))

(declare-fun m!438027 () Bool)

(assert (=> b!453535 m!438027))

(assert (=> bm!30025 d!74543))

(declare-fun d!74545 () Bool)

(assert (=> d!74545 (= (validKeyInArray!0 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453119 d!74545))

(declare-fun d!74547 () Bool)

(declare-fun e!265473 () Bool)

(assert (=> d!74547 e!265473))

(declare-fun res!270160 () Bool)

(assert (=> d!74547 (=> res!270160 e!265473)))

(declare-fun lt!205932 () Bool)

(assert (=> d!74547 (= res!270160 (not lt!205932))))

(declare-fun lt!205933 () Bool)

(assert (=> d!74547 (= lt!205932 lt!205933)))

(declare-fun lt!205934 () Unit!13229)

(declare-fun e!265474 () Unit!13229)

(assert (=> d!74547 (= lt!205934 e!265474)))

(declare-fun c!56262 () Bool)

(assert (=> d!74547 (= c!56262 lt!205933)))

(assert (=> d!74547 (= lt!205933 (containsKey!347 (toList!3451 lt!205657) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74547 (= (contains!2478 lt!205657 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205932)))

(declare-fun b!453538 () Bool)

(declare-fun lt!205931 () Unit!13229)

(assert (=> b!453538 (= e!265474 lt!205931)))

(assert (=> b!453538 (= lt!205931 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205657) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453538 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205657) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453539 () Bool)

(declare-fun Unit!13248 () Unit!13229)

(assert (=> b!453539 (= e!265474 Unit!13248)))

(declare-fun b!453540 () Bool)

(assert (=> b!453540 (= e!265473 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205657) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74547 c!56262) b!453538))

(assert (= (and d!74547 (not c!56262)) b!453539))

(assert (= (and d!74547 (not res!270160)) b!453540))

(declare-fun m!438029 () Bool)

(assert (=> d!74547 m!438029))

(declare-fun m!438031 () Bool)

(assert (=> b!453538 m!438031))

(declare-fun m!438033 () Bool)

(assert (=> b!453538 m!438033))

(assert (=> b!453538 m!438033))

(declare-fun m!438035 () Bool)

(assert (=> b!453538 m!438035))

(assert (=> b!453540 m!438033))

(assert (=> b!453540 m!438033))

(assert (=> b!453540 m!438035))

(assert (=> d!74351 d!74547))

(assert (=> d!74351 d!74389))

(declare-fun lt!205935 () Bool)

(declare-fun d!74549 () Bool)

(assert (=> d!74549 (= lt!205935 (select (content!205 (toList!3451 lt!205720)) (tuple2!7957 k0!794 v!412)))))

(declare-fun e!265475 () Bool)

(assert (=> d!74549 (= lt!205935 e!265475)))

(declare-fun res!270162 () Bool)

(assert (=> d!74549 (=> (not res!270162) (not e!265475))))

(assert (=> d!74549 (= res!270162 ((_ is Cons!8019) (toList!3451 lt!205720)))))

(assert (=> d!74549 (= (contains!2479 (toList!3451 lt!205720) (tuple2!7957 k0!794 v!412)) lt!205935)))

(declare-fun b!453541 () Bool)

(declare-fun e!265476 () Bool)

(assert (=> b!453541 (= e!265475 e!265476)))

(declare-fun res!270161 () Bool)

(assert (=> b!453541 (=> res!270161 e!265476)))

(assert (=> b!453541 (= res!270161 (= (h!8875 (toList!3451 lt!205720)) (tuple2!7957 k0!794 v!412)))))

(declare-fun b!453542 () Bool)

(assert (=> b!453542 (= e!265476 (contains!2479 (t!13839 (toList!3451 lt!205720)) (tuple2!7957 k0!794 v!412)))))

(assert (= (and d!74549 res!270162) b!453541))

(assert (= (and b!453541 (not res!270161)) b!453542))

(declare-fun m!438037 () Bool)

(assert (=> d!74549 m!438037))

(declare-fun m!438039 () Bool)

(assert (=> d!74549 m!438039))

(declare-fun m!438041 () Bool)

(assert (=> b!453542 m!438041))

(assert (=> b!453199 d!74549))

(declare-fun d!74551 () Bool)

(declare-fun e!265477 () Bool)

(assert (=> d!74551 e!265477))

(declare-fun res!270163 () Bool)

(assert (=> d!74551 (=> res!270163 e!265477)))

(declare-fun lt!205937 () Bool)

(assert (=> d!74551 (= res!270163 (not lt!205937))))

(declare-fun lt!205938 () Bool)

(assert (=> d!74551 (= lt!205937 lt!205938)))

(declare-fun lt!205939 () Unit!13229)

(declare-fun e!265478 () Unit!13229)

(assert (=> d!74551 (= lt!205939 e!265478)))

(declare-fun c!56263 () Bool)

(assert (=> d!74551 (= c!56263 lt!205938)))

(assert (=> d!74551 (= lt!205938 (containsKey!347 (toList!3451 lt!205657) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74551 (= (contains!2478 lt!205657 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205937)))

(declare-fun b!453543 () Bool)

(declare-fun lt!205936 () Unit!13229)

(assert (=> b!453543 (= e!265478 lt!205936)))

(assert (=> b!453543 (= lt!205936 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205657) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453543 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205657) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453544 () Bool)

(declare-fun Unit!13249 () Unit!13229)

(assert (=> b!453544 (= e!265478 Unit!13249)))

(declare-fun b!453545 () Bool)

(assert (=> b!453545 (= e!265477 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205657) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74551 c!56263) b!453543))

(assert (= (and d!74551 (not c!56263)) b!453544))

(assert (= (and d!74551 (not res!270163)) b!453545))

(declare-fun m!438043 () Bool)

(assert (=> d!74551 m!438043))

(declare-fun m!438045 () Bool)

(assert (=> b!453543 m!438045))

(declare-fun m!438047 () Bool)

(assert (=> b!453543 m!438047))

(assert (=> b!453543 m!438047))

(declare-fun m!438049 () Bool)

(assert (=> b!453543 m!438049))

(assert (=> b!453545 m!438047))

(assert (=> b!453545 m!438047))

(assert (=> b!453545 m!438049))

(assert (=> b!453120 d!74551))

(declare-fun d!74553 () Bool)

(declare-fun e!265479 () Bool)

(assert (=> d!74553 e!265479))

(declare-fun res!270164 () Bool)

(assert (=> d!74553 (=> (not res!270164) (not e!265479))))

(declare-fun lt!205941 () ListLongMap!6871)

(assert (=> d!74553 (= res!270164 (contains!2478 lt!205941 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205940 () List!8023)

(assert (=> d!74553 (= lt!205941 (ListLongMap!6872 lt!205940))))

(declare-fun lt!205942 () Unit!13229)

(declare-fun lt!205943 () Unit!13229)

(assert (=> d!74553 (= lt!205942 lt!205943)))

(assert (=> d!74553 (= (getValueByKey!371 lt!205940 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74553 (= lt!205943 (lemmaContainsTupThenGetReturnValue!193 lt!205940 (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74553 (= lt!205940 (insertStrictlySorted!196 (toList!3451 call!30035) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74553 (= (+!1575 call!30035 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205941)))

(declare-fun b!453546 () Bool)

(declare-fun res!270165 () Bool)

(assert (=> b!453546 (=> (not res!270165) (not e!265479))))

(assert (=> b!453546 (= res!270165 (= (getValueByKey!371 (toList!3451 lt!205941) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!376 (_2!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453547 () Bool)

(assert (=> b!453547 (= e!265479 (contains!2479 (toList!3451 lt!205941) (tuple2!7957 (select (arr!13481 lt!205566) from!863) (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74553 res!270164) b!453546))

(assert (= (and b!453546 res!270165) b!453547))

(declare-fun m!438051 () Bool)

(assert (=> d!74553 m!438051))

(declare-fun m!438053 () Bool)

(assert (=> d!74553 m!438053))

(declare-fun m!438055 () Bool)

(assert (=> d!74553 m!438055))

(declare-fun m!438057 () Bool)

(assert (=> d!74553 m!438057))

(declare-fun m!438059 () Bool)

(assert (=> b!453546 m!438059))

(declare-fun m!438061 () Bool)

(assert (=> b!453547 m!438061))

(assert (=> b!453221 d!74553))

(declare-fun d!74555 () Bool)

(declare-fun e!265480 () Bool)

(assert (=> d!74555 e!265480))

(declare-fun res!270166 () Bool)

(assert (=> d!74555 (=> res!270166 e!265480)))

(declare-fun lt!205945 () Bool)

(assert (=> d!74555 (= res!270166 (not lt!205945))))

(declare-fun lt!205946 () Bool)

(assert (=> d!74555 (= lt!205945 lt!205946)))

(declare-fun lt!205947 () Unit!13229)

(declare-fun e!265481 () Unit!13229)

(assert (=> d!74555 (= lt!205947 e!265481)))

(declare-fun c!56264 () Bool)

(assert (=> d!74555 (= c!56264 lt!205946)))

(assert (=> d!74555 (= lt!205946 (containsKey!347 (toList!3451 (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727))) lt!205731))))

(assert (=> d!74555 (= (contains!2478 (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727)) lt!205731) lt!205945)))

(declare-fun b!453548 () Bool)

(declare-fun lt!205944 () Unit!13229)

(assert (=> b!453548 (= e!265481 lt!205944)))

(assert (=> b!453548 (= lt!205944 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727))) lt!205731))))

(assert (=> b!453548 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727))) lt!205731))))

(declare-fun b!453549 () Bool)

(declare-fun Unit!13250 () Unit!13229)

(assert (=> b!453549 (= e!265481 Unit!13250)))

(declare-fun b!453550 () Bool)

(assert (=> b!453550 (= e!265480 (isDefined!296 (getValueByKey!371 (toList!3451 (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727))) lt!205731)))))

(assert (= (and d!74555 c!56264) b!453548))

(assert (= (and d!74555 (not c!56264)) b!453549))

(assert (= (and d!74555 (not res!270166)) b!453550))

(declare-fun m!438063 () Bool)

(assert (=> d!74555 m!438063))

(declare-fun m!438065 () Bool)

(assert (=> b!453548 m!438065))

(declare-fun m!438067 () Bool)

(assert (=> b!453548 m!438067))

(assert (=> b!453548 m!438067))

(declare-fun m!438069 () Bool)

(assert (=> b!453548 m!438069))

(assert (=> b!453550 m!438067))

(assert (=> b!453550 m!438067))

(assert (=> b!453550 m!438069))

(assert (=> b!453221 d!74555))

(declare-fun d!74557 () Bool)

(assert (=> d!74557 (not (contains!2478 (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727)) lt!205731))))

(declare-fun lt!205948 () Unit!13229)

(assert (=> d!74557 (= lt!205948 (choose!1336 lt!205726 lt!205732 lt!205727 lt!205731))))

(declare-fun e!265482 () Bool)

(assert (=> d!74557 e!265482))

(declare-fun res!270167 () Bool)

(assert (=> d!74557 (=> (not res!270167) (not e!265482))))

(assert (=> d!74557 (= res!270167 (not (contains!2478 lt!205726 lt!205731)))))

(assert (=> d!74557 (= (addStillNotContains!148 lt!205726 lt!205732 lt!205727 lt!205731) lt!205948)))

(declare-fun b!453551 () Bool)

(assert (=> b!453551 (= e!265482 (not (= lt!205732 lt!205731)))))

(assert (= (and d!74557 res!270167) b!453551))

(assert (=> d!74557 m!437399))

(assert (=> d!74557 m!437399))

(assert (=> d!74557 m!437403))

(declare-fun m!438071 () Bool)

(assert (=> d!74557 m!438071))

(declare-fun m!438073 () Bool)

(assert (=> d!74557 m!438073))

(assert (=> b!453221 d!74557))

(declare-fun d!74559 () Bool)

(declare-fun e!265483 () Bool)

(assert (=> d!74559 e!265483))

(declare-fun res!270168 () Bool)

(assert (=> d!74559 (=> (not res!270168) (not e!265483))))

(declare-fun lt!205950 () ListLongMap!6871)

(assert (=> d!74559 (= res!270168 (contains!2478 lt!205950 (_1!3989 (tuple2!7957 lt!205732 lt!205727))))))

(declare-fun lt!205949 () List!8023)

(assert (=> d!74559 (= lt!205950 (ListLongMap!6872 lt!205949))))

(declare-fun lt!205951 () Unit!13229)

(declare-fun lt!205952 () Unit!13229)

(assert (=> d!74559 (= lt!205951 lt!205952)))

(assert (=> d!74559 (= (getValueByKey!371 lt!205949 (_1!3989 (tuple2!7957 lt!205732 lt!205727))) (Some!376 (_2!3989 (tuple2!7957 lt!205732 lt!205727))))))

(assert (=> d!74559 (= lt!205952 (lemmaContainsTupThenGetReturnValue!193 lt!205949 (_1!3989 (tuple2!7957 lt!205732 lt!205727)) (_2!3989 (tuple2!7957 lt!205732 lt!205727))))))

(assert (=> d!74559 (= lt!205949 (insertStrictlySorted!196 (toList!3451 lt!205726) (_1!3989 (tuple2!7957 lt!205732 lt!205727)) (_2!3989 (tuple2!7957 lt!205732 lt!205727))))))

(assert (=> d!74559 (= (+!1575 lt!205726 (tuple2!7957 lt!205732 lt!205727)) lt!205950)))

(declare-fun b!453552 () Bool)

(declare-fun res!270169 () Bool)

(assert (=> b!453552 (=> (not res!270169) (not e!265483))))

(assert (=> b!453552 (= res!270169 (= (getValueByKey!371 (toList!3451 lt!205950) (_1!3989 (tuple2!7957 lt!205732 lt!205727))) (Some!376 (_2!3989 (tuple2!7957 lt!205732 lt!205727)))))))

(declare-fun b!453553 () Bool)

(assert (=> b!453553 (= e!265483 (contains!2479 (toList!3451 lt!205950) (tuple2!7957 lt!205732 lt!205727)))))

(assert (= (and d!74559 res!270168) b!453552))

(assert (= (and b!453552 res!270169) b!453553))

(declare-fun m!438075 () Bool)

(assert (=> d!74559 m!438075))

(declare-fun m!438077 () Bool)

(assert (=> d!74559 m!438077))

(declare-fun m!438079 () Bool)

(assert (=> d!74559 m!438079))

(declare-fun m!438081 () Bool)

(assert (=> d!74559 m!438081))

(declare-fun m!438083 () Bool)

(assert (=> b!453552 m!438083))

(declare-fun m!438085 () Bool)

(assert (=> b!453553 m!438085))

(assert (=> b!453221 d!74559))

(declare-fun d!74561 () Bool)

(declare-fun c!56265 () Bool)

(assert (=> d!74561 (= c!56265 ((_ is ValueCellFull!5726) (select (arr!13482 lt!205573) from!863)))))

(declare-fun e!265484 () V!17291)

(assert (=> d!74561 (= (get!6656 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265484)))

(declare-fun b!453554 () Bool)

(assert (=> b!453554 (= e!265484 (get!6659 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453555 () Bool)

(assert (=> b!453555 (= e!265484 (get!6660 (select (arr!13482 lt!205573) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74561 c!56265) b!453554))

(assert (= (and d!74561 (not c!56265)) b!453555))

(assert (=> b!453554 m!437393))

(assert (=> b!453554 m!437019))

(declare-fun m!438087 () Bool)

(assert (=> b!453554 m!438087))

(assert (=> b!453555 m!437393))

(assert (=> b!453555 m!437019))

(declare-fun m!438089 () Bool)

(assert (=> b!453555 m!438089))

(assert (=> b!453221 d!74561))

(assert (=> b!453189 d!74475))

(assert (=> b!453173 d!74451))

(declare-fun d!74563 () Bool)

(declare-fun e!265485 () Bool)

(assert (=> d!74563 e!265485))

(declare-fun res!270170 () Bool)

(assert (=> d!74563 (=> res!270170 e!265485)))

(declare-fun lt!205954 () Bool)

(assert (=> d!74563 (= res!270170 (not lt!205954))))

(declare-fun lt!205955 () Bool)

(assert (=> d!74563 (= lt!205954 lt!205955)))

(declare-fun lt!205956 () Unit!13229)

(declare-fun e!265486 () Unit!13229)

(assert (=> d!74563 (= lt!205956 e!265486)))

(declare-fun c!56266 () Bool)

(assert (=> d!74563 (= c!56266 lt!205955)))

(assert (=> d!74563 (= lt!205955 (containsKey!347 (toList!3451 lt!205691) (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(assert (=> d!74563 (= (contains!2478 lt!205691 (_1!3989 (tuple2!7957 k0!794 lt!205569))) lt!205954)))

(declare-fun b!453556 () Bool)

(declare-fun lt!205953 () Unit!13229)

(assert (=> b!453556 (= e!265486 lt!205953)))

(assert (=> b!453556 (= lt!205953 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205691) (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(assert (=> b!453556 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205691) (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun b!453557 () Bool)

(declare-fun Unit!13251 () Unit!13229)

(assert (=> b!453557 (= e!265486 Unit!13251)))

(declare-fun b!453558 () Bool)

(assert (=> b!453558 (= e!265485 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205691) (_1!3989 (tuple2!7957 k0!794 lt!205569)))))))

(assert (= (and d!74563 c!56266) b!453556))

(assert (= (and d!74563 (not c!56266)) b!453557))

(assert (= (and d!74563 (not res!270170)) b!453558))

(declare-fun m!438091 () Bool)

(assert (=> d!74563 m!438091))

(declare-fun m!438093 () Bool)

(assert (=> b!453556 m!438093))

(assert (=> b!453556 m!437267))

(assert (=> b!453556 m!437267))

(declare-fun m!438095 () Bool)

(assert (=> b!453556 m!438095))

(assert (=> b!453558 m!437267))

(assert (=> b!453558 m!437267))

(assert (=> b!453558 m!438095))

(assert (=> d!74365 d!74563))

(declare-fun b!453559 () Bool)

(declare-fun e!265487 () Option!377)

(assert (=> b!453559 (= e!265487 (Some!376 (_2!3989 (h!8875 lt!205690))))))

(declare-fun d!74565 () Bool)

(declare-fun c!56267 () Bool)

(assert (=> d!74565 (= c!56267 (and ((_ is Cons!8019) lt!205690) (= (_1!3989 (h!8875 lt!205690)) (_1!3989 (tuple2!7957 k0!794 lt!205569)))))))

(assert (=> d!74565 (= (getValueByKey!371 lt!205690 (_1!3989 (tuple2!7957 k0!794 lt!205569))) e!265487)))

(declare-fun b!453560 () Bool)

(declare-fun e!265488 () Option!377)

(assert (=> b!453560 (= e!265487 e!265488)))

(declare-fun c!56268 () Bool)

(assert (=> b!453560 (= c!56268 (and ((_ is Cons!8019) lt!205690) (not (= (_1!3989 (h!8875 lt!205690)) (_1!3989 (tuple2!7957 k0!794 lt!205569))))))))

(declare-fun b!453561 () Bool)

(assert (=> b!453561 (= e!265488 (getValueByKey!371 (t!13839 lt!205690) (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun b!453562 () Bool)

(assert (=> b!453562 (= e!265488 None!375)))

(assert (= (and d!74565 c!56267) b!453559))

(assert (= (and d!74565 (not c!56267)) b!453560))

(assert (= (and b!453560 c!56268) b!453561))

(assert (= (and b!453560 (not c!56268)) b!453562))

(declare-fun m!438097 () Bool)

(assert (=> b!453561 m!438097))

(assert (=> d!74365 d!74565))

(declare-fun d!74567 () Bool)

(assert (=> d!74567 (= (getValueByKey!371 lt!205690 (_1!3989 (tuple2!7957 k0!794 lt!205569))) (Some!376 (_2!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun lt!205957 () Unit!13229)

(assert (=> d!74567 (= lt!205957 (choose!1337 lt!205690 (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun e!265489 () Bool)

(assert (=> d!74567 e!265489))

(declare-fun res!270171 () Bool)

(assert (=> d!74567 (=> (not res!270171) (not e!265489))))

(assert (=> d!74567 (= res!270171 (isStrictlySorted!365 lt!205690))))

(assert (=> d!74567 (= (lemmaContainsTupThenGetReturnValue!193 lt!205690 (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569))) lt!205957)))

(declare-fun b!453563 () Bool)

(declare-fun res!270172 () Bool)

(assert (=> b!453563 (=> (not res!270172) (not e!265489))))

(assert (=> b!453563 (= res!270172 (containsKey!347 lt!205690 (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun b!453564 () Bool)

(assert (=> b!453564 (= e!265489 (contains!2479 lt!205690 (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569)))))))

(assert (= (and d!74567 res!270171) b!453563))

(assert (= (and b!453563 res!270172) b!453564))

(assert (=> d!74567 m!437261))

(declare-fun m!438099 () Bool)

(assert (=> d!74567 m!438099))

(declare-fun m!438101 () Bool)

(assert (=> d!74567 m!438101))

(declare-fun m!438103 () Bool)

(assert (=> b!453563 m!438103))

(declare-fun m!438105 () Bool)

(assert (=> b!453564 m!438105))

(assert (=> d!74365 d!74567))

(declare-fun e!265492 () List!8023)

(declare-fun b!453565 () Bool)

(assert (=> b!453565 (= e!265492 (insertStrictlySorted!196 (t!13839 (toList!3451 lt!205567)) (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun b!453567 () Bool)

(declare-fun e!265490 () List!8023)

(declare-fun e!265494 () List!8023)

(assert (=> b!453567 (= e!265490 e!265494)))

(declare-fun c!56271 () Bool)

(assert (=> b!453567 (= c!56271 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (= (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 (tuple2!7957 k0!794 lt!205569)))))))

(declare-fun c!56269 () Bool)

(declare-fun b!453568 () Bool)

(assert (=> b!453568 (= c!56269 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (bvsgt (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 (tuple2!7957 k0!794 lt!205569)))))))

(declare-fun e!265493 () List!8023)

(assert (=> b!453568 (= e!265494 e!265493)))

(declare-fun b!453569 () Bool)

(declare-fun call!30066 () List!8023)

(assert (=> b!453569 (= e!265494 call!30066)))

(declare-fun bm!30061 () Bool)

(declare-fun call!30064 () List!8023)

(assert (=> bm!30061 (= call!30066 call!30064)))

(declare-fun b!453570 () Bool)

(declare-fun call!30065 () List!8023)

(assert (=> b!453570 (= e!265493 call!30065)))

(declare-fun d!74569 () Bool)

(declare-fun e!265491 () Bool)

(assert (=> d!74569 e!265491))

(declare-fun res!270173 () Bool)

(assert (=> d!74569 (=> (not res!270173) (not e!265491))))

(declare-fun lt!205958 () List!8023)

(assert (=> d!74569 (= res!270173 (isStrictlySorted!365 lt!205958))))

(assert (=> d!74569 (= lt!205958 e!265490)))

(declare-fun c!56270 () Bool)

(assert (=> d!74569 (= c!56270 (and ((_ is Cons!8019) (toList!3451 lt!205567)) (bvslt (_1!3989 (h!8875 (toList!3451 lt!205567))) (_1!3989 (tuple2!7957 k0!794 lt!205569)))))))

(assert (=> d!74569 (isStrictlySorted!365 (toList!3451 lt!205567))))

(assert (=> d!74569 (= (insertStrictlySorted!196 (toList!3451 lt!205567) (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569))) lt!205958)))

(declare-fun b!453566 () Bool)

(assert (=> b!453566 (= e!265490 call!30064)))

(declare-fun b!453571 () Bool)

(assert (=> b!453571 (= e!265493 call!30065)))

(declare-fun b!453572 () Bool)

(declare-fun res!270174 () Bool)

(assert (=> b!453572 (=> (not res!270174) (not e!265491))))

(assert (=> b!453572 (= res!270174 (containsKey!347 lt!205958 (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun b!453573 () Bool)

(assert (=> b!453573 (= e!265491 (contains!2479 lt!205958 (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569)))))))

(declare-fun bm!30062 () Bool)

(assert (=> bm!30062 (= call!30065 call!30066)))

(declare-fun bm!30063 () Bool)

(assert (=> bm!30063 (= call!30064 ($colon$colon!108 e!265492 (ite c!56270 (h!8875 (toList!3451 lt!205567)) (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 lt!205569)) (_2!3989 (tuple2!7957 k0!794 lt!205569))))))))

(declare-fun c!56272 () Bool)

(assert (=> bm!30063 (= c!56272 c!56270)))

(declare-fun b!453574 () Bool)

(assert (=> b!453574 (= e!265492 (ite c!56271 (t!13839 (toList!3451 lt!205567)) (ite c!56269 (Cons!8019 (h!8875 (toList!3451 lt!205567)) (t!13839 (toList!3451 lt!205567))) Nil!8020)))))

(assert (= (and d!74569 c!56270) b!453566))

(assert (= (and d!74569 (not c!56270)) b!453567))

(assert (= (and b!453567 c!56271) b!453569))

(assert (= (and b!453567 (not c!56271)) b!453568))

(assert (= (and b!453568 c!56269) b!453571))

(assert (= (and b!453568 (not c!56269)) b!453570))

(assert (= (or b!453571 b!453570) bm!30062))

(assert (= (or b!453569 bm!30062) bm!30061))

(assert (= (or b!453566 bm!30061) bm!30063))

(assert (= (and bm!30063 c!56272) b!453565))

(assert (= (and bm!30063 (not c!56272)) b!453574))

(assert (= (and d!74569 res!270173) b!453572))

(assert (= (and b!453572 res!270174) b!453573))

(declare-fun m!438107 () Bool)

(assert (=> b!453573 m!438107))

(declare-fun m!438109 () Bool)

(assert (=> b!453572 m!438109))

(declare-fun m!438111 () Bool)

(assert (=> b!453565 m!438111))

(declare-fun m!438113 () Bool)

(assert (=> d!74569 m!438113))

(assert (=> d!74569 m!437615))

(declare-fun m!438115 () Bool)

(assert (=> bm!30063 m!438115))

(assert (=> d!74365 d!74569))

(declare-fun d!74571 () Bool)

(declare-fun e!265495 () Bool)

(assert (=> d!74571 e!265495))

(declare-fun res!270175 () Bool)

(assert (=> d!74571 (=> res!270175 e!265495)))

(declare-fun lt!205960 () Bool)

(assert (=> d!74571 (= res!270175 (not lt!205960))))

(declare-fun lt!205961 () Bool)

(assert (=> d!74571 (= lt!205960 lt!205961)))

(declare-fun lt!205962 () Unit!13229)

(declare-fun e!265496 () Unit!13229)

(assert (=> d!74571 (= lt!205962 e!265496)))

(declare-fun c!56273 () Bool)

(assert (=> d!74571 (= c!56273 lt!205961)))

(assert (=> d!74571 (= lt!205961 (containsKey!347 (toList!3451 lt!205735) (select (arr!13481 _keys!709) from!863)))))

(assert (=> d!74571 (= (contains!2478 lt!205735 (select (arr!13481 _keys!709) from!863)) lt!205960)))

(declare-fun b!453575 () Bool)

(declare-fun lt!205959 () Unit!13229)

(assert (=> b!453575 (= e!265496 lt!205959)))

(assert (=> b!453575 (= lt!205959 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205735) (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!453575 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205735) (select (arr!13481 _keys!709) from!863)))))

(declare-fun b!453576 () Bool)

(declare-fun Unit!13252 () Unit!13229)

(assert (=> b!453576 (= e!265496 Unit!13252)))

(declare-fun b!453577 () Bool)

(assert (=> b!453577 (= e!265495 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205735) (select (arr!13481 _keys!709) from!863))))))

(assert (= (and d!74571 c!56273) b!453575))

(assert (= (and d!74571 (not c!56273)) b!453576))

(assert (= (and d!74571 (not res!270175)) b!453577))

(assert (=> d!74571 m!436993))

(declare-fun m!438117 () Bool)

(assert (=> d!74571 m!438117))

(assert (=> b!453575 m!436993))

(declare-fun m!438119 () Bool)

(assert (=> b!453575 m!438119))

(assert (=> b!453575 m!436993))

(assert (=> b!453575 m!437753))

(assert (=> b!453575 m!437753))

(declare-fun m!438121 () Bool)

(assert (=> b!453575 m!438121))

(assert (=> b!453577 m!436993))

(assert (=> b!453577 m!437753))

(assert (=> b!453577 m!437753))

(assert (=> b!453577 m!438121))

(assert (=> b!453232 d!74571))

(assert (=> b!453126 d!74545))

(assert (=> b!453092 d!74499))

(declare-fun d!74573 () Bool)

(declare-fun e!265497 () Bool)

(assert (=> d!74573 e!265497))

(declare-fun res!270176 () Bool)

(assert (=> d!74573 (=> res!270176 e!265497)))

(declare-fun lt!205964 () Bool)

(assert (=> d!74573 (= res!270176 (not lt!205964))))

(declare-fun lt!205965 () Bool)

(assert (=> d!74573 (= lt!205964 lt!205965)))

(declare-fun lt!205966 () Unit!13229)

(declare-fun e!265498 () Unit!13229)

(assert (=> d!74573 (= lt!205966 e!265498)))

(declare-fun c!56274 () Bool)

(assert (=> d!74573 (= c!56274 lt!205965)))

(assert (=> d!74573 (= lt!205965 (containsKey!347 (toList!3451 lt!205695) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74573 (= (contains!2478 lt!205695 (_1!3989 (tuple2!7957 k0!794 v!412))) lt!205964)))

(declare-fun b!453578 () Bool)

(declare-fun lt!205963 () Unit!13229)

(assert (=> b!453578 (= e!265498 lt!205963)))

(assert (=> b!453578 (= lt!205963 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205695) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> b!453578 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205695) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453579 () Bool)

(declare-fun Unit!13253 () Unit!13229)

(assert (=> b!453579 (= e!265498 Unit!13253)))

(declare-fun b!453580 () Bool)

(assert (=> b!453580 (= e!265497 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205695) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (= (and d!74573 c!56274) b!453578))

(assert (= (and d!74573 (not c!56274)) b!453579))

(assert (= (and d!74573 (not res!270176)) b!453580))

(declare-fun m!438123 () Bool)

(assert (=> d!74573 m!438123))

(declare-fun m!438125 () Bool)

(assert (=> b!453578 m!438125))

(assert (=> b!453578 m!437279))

(assert (=> b!453578 m!437279))

(declare-fun m!438127 () Bool)

(assert (=> b!453578 m!438127))

(assert (=> b!453580 m!437279))

(assert (=> b!453580 m!437279))

(assert (=> b!453580 m!438127))

(assert (=> d!74367 d!74573))

(declare-fun b!453581 () Bool)

(declare-fun e!265499 () Option!377)

(assert (=> b!453581 (= e!265499 (Some!376 (_2!3989 (h!8875 lt!205694))))))

(declare-fun d!74575 () Bool)

(declare-fun c!56275 () Bool)

(assert (=> d!74575 (= c!56275 (and ((_ is Cons!8019) lt!205694) (= (_1!3989 (h!8875 lt!205694)) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (=> d!74575 (= (getValueByKey!371 lt!205694 (_1!3989 (tuple2!7957 k0!794 v!412))) e!265499)))

(declare-fun b!453582 () Bool)

(declare-fun e!265500 () Option!377)

(assert (=> b!453582 (= e!265499 e!265500)))

(declare-fun c!56276 () Bool)

(assert (=> b!453582 (= c!56276 (and ((_ is Cons!8019) lt!205694) (not (= (_1!3989 (h!8875 lt!205694)) (_1!3989 (tuple2!7957 k0!794 v!412))))))))

(declare-fun b!453583 () Bool)

(assert (=> b!453583 (= e!265500 (getValueByKey!371 (t!13839 lt!205694) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453584 () Bool)

(assert (=> b!453584 (= e!265500 None!375)))

(assert (= (and d!74575 c!56275) b!453581))

(assert (= (and d!74575 (not c!56275)) b!453582))

(assert (= (and b!453582 c!56276) b!453583))

(assert (= (and b!453582 (not c!56276)) b!453584))

(declare-fun m!438129 () Bool)

(assert (=> b!453583 m!438129))

(assert (=> d!74367 d!74575))

(declare-fun d!74577 () Bool)

(assert (=> d!74577 (= (getValueByKey!371 lt!205694 (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun lt!205967 () Unit!13229)

(assert (=> d!74577 (= lt!205967 (choose!1337 lt!205694 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun e!265501 () Bool)

(assert (=> d!74577 e!265501))

(declare-fun res!270177 () Bool)

(assert (=> d!74577 (=> (not res!270177) (not e!265501))))

(assert (=> d!74577 (= res!270177 (isStrictlySorted!365 lt!205694))))

(assert (=> d!74577 (= (lemmaContainsTupThenGetReturnValue!193 lt!205694 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))) lt!205967)))

(declare-fun b!453585 () Bool)

(declare-fun res!270178 () Bool)

(assert (=> b!453585 (=> (not res!270178) (not e!265501))))

(assert (=> b!453585 (= res!270178 (containsKey!347 lt!205694 (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453586 () Bool)

(assert (=> b!453586 (= e!265501 (contains!2479 lt!205694 (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (= (and d!74577 res!270177) b!453585))

(assert (= (and b!453585 res!270178) b!453586))

(assert (=> d!74577 m!437273))

(declare-fun m!438131 () Bool)

(assert (=> d!74577 m!438131))

(declare-fun m!438133 () Bool)

(assert (=> d!74577 m!438133))

(declare-fun m!438135 () Bool)

(assert (=> b!453585 m!438135))

(declare-fun m!438137 () Bool)

(assert (=> b!453586 m!438137))

(assert (=> d!74367 d!74577))

(declare-fun e!265504 () List!8023)

(declare-fun b!453587 () Bool)

(assert (=> b!453587 (= e!265504 (insertStrictlySorted!196 (t!13839 (toList!3451 lt!205572)) (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453589 () Bool)

(declare-fun e!265502 () List!8023)

(declare-fun e!265506 () List!8023)

(assert (=> b!453589 (= e!265502 e!265506)))

(declare-fun c!56279 () Bool)

(assert (=> b!453589 (= c!56279 (and ((_ is Cons!8019) (toList!3451 lt!205572)) (= (_1!3989 (h!8875 (toList!3451 lt!205572))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun c!56277 () Bool)

(declare-fun b!453590 () Bool)

(assert (=> b!453590 (= c!56277 (and ((_ is Cons!8019) (toList!3451 lt!205572)) (bvsgt (_1!3989 (h!8875 (toList!3451 lt!205572))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun e!265505 () List!8023)

(assert (=> b!453590 (= e!265506 e!265505)))

(declare-fun b!453591 () Bool)

(declare-fun call!30069 () List!8023)

(assert (=> b!453591 (= e!265506 call!30069)))

(declare-fun bm!30064 () Bool)

(declare-fun call!30067 () List!8023)

(assert (=> bm!30064 (= call!30069 call!30067)))

(declare-fun b!453592 () Bool)

(declare-fun call!30068 () List!8023)

(assert (=> b!453592 (= e!265505 call!30068)))

(declare-fun d!74579 () Bool)

(declare-fun e!265503 () Bool)

(assert (=> d!74579 e!265503))

(declare-fun res!270179 () Bool)

(assert (=> d!74579 (=> (not res!270179) (not e!265503))))

(declare-fun lt!205968 () List!8023)

(assert (=> d!74579 (= res!270179 (isStrictlySorted!365 lt!205968))))

(assert (=> d!74579 (= lt!205968 e!265502)))

(declare-fun c!56278 () Bool)

(assert (=> d!74579 (= c!56278 (and ((_ is Cons!8019) (toList!3451 lt!205572)) (bvslt (_1!3989 (h!8875 (toList!3451 lt!205572))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (=> d!74579 (isStrictlySorted!365 (toList!3451 lt!205572))))

(assert (=> d!74579 (= (insertStrictlySorted!196 (toList!3451 lt!205572) (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))) lt!205968)))

(declare-fun b!453588 () Bool)

(assert (=> b!453588 (= e!265502 call!30067)))

(declare-fun b!453593 () Bool)

(assert (=> b!453593 (= e!265505 call!30068)))

(declare-fun b!453594 () Bool)

(declare-fun res!270180 () Bool)

(assert (=> b!453594 (=> (not res!270180) (not e!265503))))

(assert (=> b!453594 (= res!270180 (containsKey!347 lt!205968 (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453595 () Bool)

(assert (=> b!453595 (= e!265503 (contains!2479 lt!205968 (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun bm!30065 () Bool)

(assert (=> bm!30065 (= call!30068 call!30069)))

(declare-fun bm!30066 () Bool)

(assert (=> bm!30066 (= call!30067 ($colon$colon!108 e!265504 (ite c!56278 (h!8875 (toList!3451 lt!205572)) (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))))

(declare-fun c!56280 () Bool)

(assert (=> bm!30066 (= c!56280 c!56278)))

(declare-fun b!453596 () Bool)

(assert (=> b!453596 (= e!265504 (ite c!56279 (t!13839 (toList!3451 lt!205572)) (ite c!56277 (Cons!8019 (h!8875 (toList!3451 lt!205572)) (t!13839 (toList!3451 lt!205572))) Nil!8020)))))

(assert (= (and d!74579 c!56278) b!453588))

(assert (= (and d!74579 (not c!56278)) b!453589))

(assert (= (and b!453589 c!56279) b!453591))

(assert (= (and b!453589 (not c!56279)) b!453590))

(assert (= (and b!453590 c!56277) b!453593))

(assert (= (and b!453590 (not c!56277)) b!453592))

(assert (= (or b!453593 b!453592) bm!30065))

(assert (= (or b!453591 bm!30065) bm!30064))

(assert (= (or b!453588 bm!30064) bm!30066))

(assert (= (and bm!30066 c!56280) b!453587))

(assert (= (and bm!30066 (not c!56280)) b!453596))

(assert (= (and d!74579 res!270179) b!453594))

(assert (= (and b!453594 res!270180) b!453595))

(declare-fun m!438139 () Bool)

(assert (=> b!453595 m!438139))

(declare-fun m!438141 () Bool)

(assert (=> b!453594 m!438141))

(declare-fun m!438143 () Bool)

(assert (=> b!453587 m!438143))

(declare-fun m!438145 () Bool)

(assert (=> d!74579 m!438145))

(declare-fun m!438147 () Bool)

(assert (=> d!74579 m!438147))

(declare-fun m!438149 () Bool)

(assert (=> bm!30066 m!438149))

(assert (=> d!74367 d!74579))

(declare-fun d!74581 () Bool)

(assert (=> d!74581 (= (isEmpty!565 lt!205657) (isEmpty!566 (toList!3451 lt!205657)))))

(declare-fun bs!14427 () Bool)

(assert (= bs!14427 d!74581))

(declare-fun m!438151 () Bool)

(assert (=> bs!14427 m!438151))

(assert (=> b!453128 d!74581))

(declare-fun d!74583 () Bool)

(declare-fun lt!205969 () Bool)

(assert (=> d!74583 (= lt!205969 (select (content!206 Nil!8021) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun e!265508 () Bool)

(assert (=> d!74583 (= lt!205969 e!265508)))

(declare-fun res!270182 () Bool)

(assert (=> d!74583 (=> (not res!270182) (not e!265508))))

(assert (=> d!74583 (= res!270182 ((_ is Cons!8020) Nil!8021))))

(assert (=> d!74583 (= (contains!2477 Nil!8021 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)) lt!205969)))

(declare-fun b!453597 () Bool)

(declare-fun e!265507 () Bool)

(assert (=> b!453597 (= e!265508 e!265507)))

(declare-fun res!270181 () Bool)

(assert (=> b!453597 (=> res!270181 e!265507)))

(assert (=> b!453597 (= res!270181 (= (h!8876 Nil!8021) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453598 () Bool)

(assert (=> b!453598 (= e!265507 (contains!2477 (t!13840 Nil!8021) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74583 res!270182) b!453597))

(assert (= (and b!453597 (not res!270181)) b!453598))

(assert (=> d!74583 m!437915))

(assert (=> d!74583 m!437173))

(declare-fun m!438153 () Bool)

(assert (=> d!74583 m!438153))

(assert (=> b!453598 m!437173))

(declare-fun m!438155 () Bool)

(assert (=> b!453598 m!438155))

(assert (=> b!453094 d!74583))

(declare-fun d!74585 () Bool)

(declare-fun e!265509 () Bool)

(assert (=> d!74585 e!265509))

(declare-fun res!270183 () Bool)

(assert (=> d!74585 (=> res!270183 e!265509)))

(declare-fun lt!205971 () Bool)

(assert (=> d!74585 (= res!270183 (not lt!205971))))

(declare-fun lt!205972 () Bool)

(assert (=> d!74585 (= lt!205971 lt!205972)))

(declare-fun lt!205973 () Unit!13229)

(declare-fun e!265510 () Unit!13229)

(assert (=> d!74585 (= lt!205973 e!265510)))

(declare-fun c!56281 () Bool)

(assert (=> d!74585 (= c!56281 lt!205972)))

(assert (=> d!74585 (= lt!205972 (containsKey!347 (toList!3451 lt!205657) (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74585 (= (contains!2478 lt!205657 (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))) lt!205971)))

(declare-fun b!453599 () Bool)

(declare-fun lt!205970 () Unit!13229)

(assert (=> b!453599 (= e!265510 lt!205970)))

(assert (=> b!453599 (= lt!205970 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205657) (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453599 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205657) (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453600 () Bool)

(declare-fun Unit!13254 () Unit!13229)

(assert (=> b!453600 (= e!265510 Unit!13254)))

(declare-fun b!453601 () Bool)

(assert (=> b!453601 (= e!265509 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205657) (select (arr!13481 (ite c!56123 _keys!709 lt!205566)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74585 c!56281) b!453599))

(assert (= (and d!74585 (not c!56281)) b!453600))

(assert (= (and d!74585 (not res!270183)) b!453601))

(assert (=> d!74585 m!437185))

(declare-fun m!438157 () Bool)

(assert (=> d!74585 m!438157))

(assert (=> b!453599 m!437185))

(declare-fun m!438159 () Bool)

(assert (=> b!453599 m!438159))

(assert (=> b!453599 m!437185))

(assert (=> b!453599 m!437765))

(assert (=> b!453599 m!437765))

(declare-fun m!438161 () Bool)

(assert (=> b!453599 m!438161))

(assert (=> b!453601 m!437185))

(assert (=> b!453601 m!437765))

(assert (=> b!453601 m!437765))

(assert (=> b!453601 m!438161))

(assert (=> b!453124 d!74585))

(assert (=> b!453090 d!74499))

(declare-fun d!74587 () Bool)

(assert (=> d!74587 (= (apply!313 lt!205728 (select (arr!13481 lt!205566) from!863)) (get!6661 (getValueByKey!371 (toList!3451 lt!205728) (select (arr!13481 lt!205566) from!863))))))

(declare-fun bs!14428 () Bool)

(assert (= bs!14428 d!74587))

(assert (=> bs!14428 m!437031))

(assert (=> bs!14428 m!437513))

(assert (=> bs!14428 m!437513))

(declare-fun m!438163 () Bool)

(assert (=> bs!14428 m!438163))

(assert (=> b!453225 d!74587))

(assert (=> b!453225 d!74561))

(declare-fun d!74589 () Bool)

(declare-fun e!265511 () Bool)

(assert (=> d!74589 e!265511))

(declare-fun res!270184 () Bool)

(assert (=> d!74589 (=> res!270184 e!265511)))

(declare-fun lt!205975 () Bool)

(assert (=> d!74589 (= res!270184 (not lt!205975))))

(declare-fun lt!205976 () Bool)

(assert (=> d!74589 (= lt!205975 lt!205976)))

(declare-fun lt!205977 () Unit!13229)

(declare-fun e!265512 () Unit!13229)

(assert (=> d!74589 (= lt!205977 e!265512)))

(declare-fun c!56282 () Bool)

(assert (=> d!74589 (= c!56282 lt!205976)))

(assert (=> d!74589 (= lt!205976 (containsKey!347 (toList!3451 lt!205704) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74589 (= (contains!2478 lt!205704 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205975)))

(declare-fun b!453602 () Bool)

(declare-fun lt!205974 () Unit!13229)

(assert (=> b!453602 (= e!265512 lt!205974)))

(assert (=> b!453602 (= lt!205974 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205704) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453602 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205704) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453603 () Bool)

(declare-fun Unit!13255 () Unit!13229)

(assert (=> b!453603 (= e!265512 Unit!13255)))

(declare-fun b!453604 () Bool)

(assert (=> b!453604 (= e!265511 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74589 c!56282) b!453602))

(assert (= (and d!74589 (not c!56282)) b!453603))

(assert (= (and d!74589 (not res!270184)) b!453604))

(declare-fun m!438165 () Bool)

(assert (=> d!74589 m!438165))

(declare-fun m!438167 () Bool)

(assert (=> b!453602 m!438167))

(declare-fun m!438169 () Bool)

(assert (=> b!453602 m!438169))

(assert (=> b!453602 m!438169))

(declare-fun m!438171 () Bool)

(assert (=> b!453602 m!438171))

(assert (=> b!453604 m!438169))

(assert (=> b!453604 m!438169))

(assert (=> b!453604 m!438171))

(assert (=> b!453171 d!74589))

(assert (=> b!453230 d!74409))

(declare-fun d!74591 () Bool)

(assert (=> d!74591 (= (isEmpty!565 lt!205704) (isEmpty!566 (toList!3451 lt!205704)))))

(declare-fun bs!14429 () Bool)

(assert (= bs!14429 d!74591))

(declare-fun m!438173 () Bool)

(assert (=> bs!14429 m!438173))

(assert (=> b!453179 d!74591))

(declare-fun d!74593 () Bool)

(declare-fun e!265513 () Bool)

(assert (=> d!74593 e!265513))

(declare-fun res!270185 () Bool)

(assert (=> d!74593 (=> res!270185 e!265513)))

(declare-fun lt!205979 () Bool)

(assert (=> d!74593 (= res!270185 (not lt!205979))))

(declare-fun lt!205980 () Bool)

(assert (=> d!74593 (= lt!205979 lt!205980)))

(declare-fun lt!205981 () Unit!13229)

(declare-fun e!265514 () Unit!13229)

(assert (=> d!74593 (= lt!205981 e!265514)))

(declare-fun c!56283 () Bool)

(assert (=> d!74593 (= c!56283 lt!205980)))

(assert (=> d!74593 (= lt!205980 (containsKey!347 (toList!3451 lt!205720) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> d!74593 (= (contains!2478 lt!205720 (_1!3989 (tuple2!7957 k0!794 v!412))) lt!205979)))

(declare-fun b!453605 () Bool)

(declare-fun lt!205978 () Unit!13229)

(assert (=> b!453605 (= e!265514 lt!205978)))

(assert (=> b!453605 (= lt!205978 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205720) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(assert (=> b!453605 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205720) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453606 () Bool)

(declare-fun Unit!13256 () Unit!13229)

(assert (=> b!453606 (= e!265514 Unit!13256)))

(declare-fun b!453607 () Bool)

(assert (=> b!453607 (= e!265513 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205720) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (= (and d!74593 c!56283) b!453605))

(assert (= (and d!74593 (not c!56283)) b!453606))

(assert (= (and d!74593 (not res!270185)) b!453607))

(declare-fun m!438175 () Bool)

(assert (=> d!74593 m!438175))

(declare-fun m!438177 () Bool)

(assert (=> b!453605 m!438177))

(assert (=> b!453605 m!437371))

(assert (=> b!453605 m!437371))

(declare-fun m!438179 () Bool)

(assert (=> b!453605 m!438179))

(assert (=> b!453607 m!437371))

(assert (=> b!453607 m!437371))

(assert (=> b!453607 m!438179))

(assert (=> d!74383 d!74593))

(declare-fun b!453608 () Bool)

(declare-fun e!265515 () Option!377)

(assert (=> b!453608 (= e!265515 (Some!376 (_2!3989 (h!8875 lt!205719))))))

(declare-fun d!74595 () Bool)

(declare-fun c!56284 () Bool)

(assert (=> d!74595 (= c!56284 (and ((_ is Cons!8019) lt!205719) (= (_1!3989 (h!8875 lt!205719)) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (=> d!74595 (= (getValueByKey!371 lt!205719 (_1!3989 (tuple2!7957 k0!794 v!412))) e!265515)))

(declare-fun b!453609 () Bool)

(declare-fun e!265516 () Option!377)

(assert (=> b!453609 (= e!265515 e!265516)))

(declare-fun c!56285 () Bool)

(assert (=> b!453609 (= c!56285 (and ((_ is Cons!8019) lt!205719) (not (= (_1!3989 (h!8875 lt!205719)) (_1!3989 (tuple2!7957 k0!794 v!412))))))))

(declare-fun b!453610 () Bool)

(assert (=> b!453610 (= e!265516 (getValueByKey!371 (t!13839 lt!205719) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453611 () Bool)

(assert (=> b!453611 (= e!265516 None!375)))

(assert (= (and d!74595 c!56284) b!453608))

(assert (= (and d!74595 (not c!56284)) b!453609))

(assert (= (and b!453609 c!56285) b!453610))

(assert (= (and b!453609 (not c!56285)) b!453611))

(declare-fun m!438181 () Bool)

(assert (=> b!453610 m!438181))

(assert (=> d!74383 d!74595))

(declare-fun d!74597 () Bool)

(assert (=> d!74597 (= (getValueByKey!371 lt!205719 (_1!3989 (tuple2!7957 k0!794 v!412))) (Some!376 (_2!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun lt!205982 () Unit!13229)

(assert (=> d!74597 (= lt!205982 (choose!1337 lt!205719 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun e!265517 () Bool)

(assert (=> d!74597 e!265517))

(declare-fun res!270186 () Bool)

(assert (=> d!74597 (=> (not res!270186) (not e!265517))))

(assert (=> d!74597 (= res!270186 (isStrictlySorted!365 lt!205719))))

(assert (=> d!74597 (= (lemmaContainsTupThenGetReturnValue!193 lt!205719 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))) lt!205982)))

(declare-fun b!453612 () Bool)

(declare-fun res!270187 () Bool)

(assert (=> b!453612 (=> (not res!270187) (not e!265517))))

(assert (=> b!453612 (= res!270187 (containsKey!347 lt!205719 (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453613 () Bool)

(assert (=> b!453613 (= e!265517 (contains!2479 lt!205719 (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (= (and d!74597 res!270186) b!453612))

(assert (= (and b!453612 res!270187) b!453613))

(assert (=> d!74597 m!437365))

(declare-fun m!438183 () Bool)

(assert (=> d!74597 m!438183))

(declare-fun m!438185 () Bool)

(assert (=> d!74597 m!438185))

(declare-fun m!438187 () Bool)

(assert (=> b!453612 m!438187))

(declare-fun m!438189 () Bool)

(assert (=> b!453613 m!438189))

(assert (=> d!74383 d!74597))

(declare-fun e!265520 () List!8023)

(declare-fun b!453614 () Bool)

(assert (=> b!453614 (= e!265520 (insertStrictlySorted!196 (t!13839 (toList!3451 call!30002)) (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453616 () Bool)

(declare-fun e!265518 () List!8023)

(declare-fun e!265522 () List!8023)

(assert (=> b!453616 (= e!265518 e!265522)))

(declare-fun c!56288 () Bool)

(assert (=> b!453616 (= c!56288 (and ((_ is Cons!8019) (toList!3451 call!30002)) (= (_1!3989 (h!8875 (toList!3451 call!30002))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun c!56286 () Bool)

(declare-fun b!453617 () Bool)

(assert (=> b!453617 (= c!56286 (and ((_ is Cons!8019) (toList!3451 call!30002)) (bvsgt (_1!3989 (h!8875 (toList!3451 call!30002))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun e!265521 () List!8023)

(assert (=> b!453617 (= e!265522 e!265521)))

(declare-fun b!453618 () Bool)

(declare-fun call!30072 () List!8023)

(assert (=> b!453618 (= e!265522 call!30072)))

(declare-fun bm!30067 () Bool)

(declare-fun call!30070 () List!8023)

(assert (=> bm!30067 (= call!30072 call!30070)))

(declare-fun b!453619 () Bool)

(declare-fun call!30071 () List!8023)

(assert (=> b!453619 (= e!265521 call!30071)))

(declare-fun d!74599 () Bool)

(declare-fun e!265519 () Bool)

(assert (=> d!74599 e!265519))

(declare-fun res!270188 () Bool)

(assert (=> d!74599 (=> (not res!270188) (not e!265519))))

(declare-fun lt!205983 () List!8023)

(assert (=> d!74599 (= res!270188 (isStrictlySorted!365 lt!205983))))

(assert (=> d!74599 (= lt!205983 e!265518)))

(declare-fun c!56287 () Bool)

(assert (=> d!74599 (= c!56287 (and ((_ is Cons!8019) (toList!3451 call!30002)) (bvslt (_1!3989 (h!8875 (toList!3451 call!30002))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (=> d!74599 (isStrictlySorted!365 (toList!3451 call!30002))))

(assert (=> d!74599 (= (insertStrictlySorted!196 (toList!3451 call!30002) (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))) lt!205983)))

(declare-fun b!453615 () Bool)

(assert (=> b!453615 (= e!265518 call!30070)))

(declare-fun b!453620 () Bool)

(assert (=> b!453620 (= e!265521 call!30071)))

(declare-fun b!453621 () Bool)

(declare-fun res!270189 () Bool)

(assert (=> b!453621 (=> (not res!270189) (not e!265519))))

(assert (=> b!453621 (= res!270189 (containsKey!347 lt!205983 (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453622 () Bool)

(assert (=> b!453622 (= e!265519 (contains!2479 lt!205983 (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412)))))))

(declare-fun bm!30068 () Bool)

(assert (=> bm!30068 (= call!30071 call!30072)))

(declare-fun bm!30069 () Bool)

(assert (=> bm!30069 (= call!30070 ($colon$colon!108 e!265520 (ite c!56287 (h!8875 (toList!3451 call!30002)) (tuple2!7957 (_1!3989 (tuple2!7957 k0!794 v!412)) (_2!3989 (tuple2!7957 k0!794 v!412))))))))

(declare-fun c!56289 () Bool)

(assert (=> bm!30069 (= c!56289 c!56287)))

(declare-fun b!453623 () Bool)

(assert (=> b!453623 (= e!265520 (ite c!56288 (t!13839 (toList!3451 call!30002)) (ite c!56286 (Cons!8019 (h!8875 (toList!3451 call!30002)) (t!13839 (toList!3451 call!30002))) Nil!8020)))))

(assert (= (and d!74599 c!56287) b!453615))

(assert (= (and d!74599 (not c!56287)) b!453616))

(assert (= (and b!453616 c!56288) b!453618))

(assert (= (and b!453616 (not c!56288)) b!453617))

(assert (= (and b!453617 c!56286) b!453620))

(assert (= (and b!453617 (not c!56286)) b!453619))

(assert (= (or b!453620 b!453619) bm!30068))

(assert (= (or b!453618 bm!30068) bm!30067))

(assert (= (or b!453615 bm!30067) bm!30069))

(assert (= (and bm!30069 c!56289) b!453614))

(assert (= (and bm!30069 (not c!56289)) b!453623))

(assert (= (and d!74599 res!270188) b!453621))

(assert (= (and b!453621 res!270189) b!453622))

(declare-fun m!438191 () Bool)

(assert (=> b!453622 m!438191))

(declare-fun m!438193 () Bool)

(assert (=> b!453621 m!438193))

(declare-fun m!438195 () Bool)

(assert (=> b!453614 m!438195))

(declare-fun m!438197 () Bool)

(assert (=> d!74599 m!438197))

(declare-fun m!438199 () Bool)

(assert (=> d!74599 m!438199))

(declare-fun m!438201 () Bool)

(assert (=> bm!30069 m!438201))

(assert (=> d!74383 d!74599))

(declare-fun d!74601 () Bool)

(declare-fun e!265523 () Bool)

(assert (=> d!74601 e!265523))

(declare-fun res!270190 () Bool)

(assert (=> d!74601 (=> res!270190 e!265523)))

(declare-fun lt!205985 () Bool)

(assert (=> d!74601 (= res!270190 (not lt!205985))))

(declare-fun lt!205986 () Bool)

(assert (=> d!74601 (= lt!205985 lt!205986)))

(declare-fun lt!205987 () Unit!13229)

(declare-fun e!265524 () Unit!13229)

(assert (=> d!74601 (= lt!205987 e!265524)))

(declare-fun c!56290 () Bool)

(assert (=> d!74601 (= c!56290 lt!205986)))

(assert (=> d!74601 (= lt!205986 (containsKey!347 (toList!3451 lt!205704) (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74601 (= (contains!2478 lt!205704 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))) lt!205985)))

(declare-fun b!453624 () Bool)

(declare-fun lt!205984 () Unit!13229)

(assert (=> b!453624 (= e!265524 lt!205984)))

(assert (=> b!453624 (= lt!205984 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205704) (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453624 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205704) (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453625 () Bool)

(declare-fun Unit!13257 () Unit!13229)

(assert (=> b!453625 (= e!265524 Unit!13257)))

(declare-fun b!453626 () Bool)

(assert (=> b!453626 (= e!265523 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205704) (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74601 c!56290) b!453624))

(assert (= (and d!74601 (not c!56290)) b!453625))

(assert (= (and d!74601 (not res!270190)) b!453626))

(assert (=> d!74601 m!437303))

(declare-fun m!438203 () Bool)

(assert (=> d!74601 m!438203))

(assert (=> b!453624 m!437303))

(declare-fun m!438205 () Bool)

(assert (=> b!453624 m!438205))

(assert (=> b!453624 m!437303))

(assert (=> b!453624 m!437903))

(assert (=> b!453624 m!437903))

(declare-fun m!438207 () Bool)

(assert (=> b!453624 m!438207))

(assert (=> b!453626 m!437303))

(assert (=> b!453626 m!437903))

(assert (=> b!453626 m!437903))

(assert (=> b!453626 m!438207))

(assert (=> b!453175 d!74601))

(declare-fun d!74603 () Bool)

(declare-fun res!270191 () Bool)

(declare-fun e!265526 () Bool)

(assert (=> d!74603 (=> res!270191 e!265526)))

(assert (=> d!74603 (= res!270191 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(assert (=> d!74603 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025) e!265526)))

(declare-fun bm!30070 () Bool)

(declare-fun call!30073 () Bool)

(assert (=> bm!30070 (= call!30073 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!453627 () Bool)

(declare-fun e!265525 () Bool)

(assert (=> b!453627 (= e!265526 e!265525)))

(declare-fun c!56291 () Bool)

(assert (=> b!453627 (= c!56291 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453628 () Bool)

(declare-fun e!265527 () Bool)

(assert (=> b!453628 (= e!265525 e!265527)))

(declare-fun lt!205990 () (_ BitVec 64))

(assert (=> b!453628 (= lt!205990 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!205989 () Unit!13229)

(assert (=> b!453628 (= lt!205989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205990 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!453628 (arrayContainsKey!0 _keys!709 lt!205990 #b00000000000000000000000000000000)))

(declare-fun lt!205988 () Unit!13229)

(assert (=> b!453628 (= lt!205988 lt!205989)))

(declare-fun res!270192 () Bool)

(assert (=> b!453628 (= res!270192 (= (seekEntryOrOpen!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!709 mask!1025) (Found!3481 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!453628 (=> (not res!270192) (not e!265527))))

(declare-fun b!453629 () Bool)

(assert (=> b!453629 (= e!265525 call!30073)))

(declare-fun b!453630 () Bool)

(assert (=> b!453630 (= e!265527 call!30073)))

(assert (= (and d!74603 (not res!270191)) b!453627))

(assert (= (and b!453627 c!56291) b!453628))

(assert (= (and b!453627 (not c!56291)) b!453629))

(assert (= (and b!453628 res!270192) b!453630))

(assert (= (or b!453630 b!453629) bm!30070))

(declare-fun m!438209 () Bool)

(assert (=> bm!30070 m!438209))

(assert (=> b!453627 m!437769))

(assert (=> b!453627 m!437769))

(assert (=> b!453627 m!437771))

(assert (=> b!453628 m!437769))

(declare-fun m!438211 () Bool)

(assert (=> b!453628 m!438211))

(declare-fun m!438213 () Bool)

(assert (=> b!453628 m!438213))

(assert (=> b!453628 m!437769))

(declare-fun m!438215 () Bool)

(assert (=> b!453628 m!438215))

(assert (=> bm!30021 d!74603))

(assert (=> b!453234 d!74391))

(assert (=> b!453177 d!74537))

(declare-fun d!74605 () Bool)

(assert (=> d!74605 (arrayContainsKey!0 _keys!709 lt!205670 #b00000000000000000000000000000000)))

(declare-fun lt!205991 () Unit!13229)

(assert (=> d!74605 (= lt!205991 (choose!13 _keys!709 lt!205670 #b00000000000000000000000000000000))))

(assert (=> d!74605 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!74605 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205670 #b00000000000000000000000000000000) lt!205991)))

(declare-fun bs!14430 () Bool)

(assert (= bs!14430 d!74605))

(assert (=> bs!14430 m!437213))

(declare-fun m!438217 () Bool)

(assert (=> bs!14430 m!438217))

(assert (=> b!453140 d!74605))

(declare-fun d!74607 () Bool)

(declare-fun res!270193 () Bool)

(declare-fun e!265528 () Bool)

(assert (=> d!74607 (=> res!270193 e!265528)))

(assert (=> d!74607 (= res!270193 (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) lt!205670))))

(assert (=> d!74607 (= (arrayContainsKey!0 _keys!709 lt!205670 #b00000000000000000000000000000000) e!265528)))

(declare-fun b!453631 () Bool)

(declare-fun e!265529 () Bool)

(assert (=> b!453631 (= e!265528 e!265529)))

(declare-fun res!270194 () Bool)

(assert (=> b!453631 (=> (not res!270194) (not e!265529))))

(assert (=> b!453631 (= res!270194 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(declare-fun b!453632 () Bool)

(assert (=> b!453632 (= e!265529 (arrayContainsKey!0 _keys!709 lt!205670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74607 (not res!270193)) b!453631))

(assert (= (and b!453631 res!270194) b!453632))

(assert (=> d!74607 m!437173))

(declare-fun m!438219 () Bool)

(assert (=> b!453632 m!438219))

(assert (=> b!453140 d!74607))

(declare-fun b!453633 () Bool)

(declare-fun e!265530 () SeekEntryResult!3481)

(declare-fun e!265531 () SeekEntryResult!3481)

(assert (=> b!453633 (= e!265530 e!265531)))

(declare-fun lt!205992 () (_ BitVec 64))

(declare-fun lt!205993 () SeekEntryResult!3481)

(assert (=> b!453633 (= lt!205992 (select (arr!13481 _keys!709) (index!16105 lt!205993)))))

(declare-fun c!56293 () Bool)

(assert (=> b!453633 (= c!56293 (= lt!205992 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453634 () Bool)

(assert (=> b!453634 (= e!265530 Undefined!3481)))

(declare-fun d!74609 () Bool)

(declare-fun lt!205994 () SeekEntryResult!3481)

(assert (=> d!74609 (and (or ((_ is Undefined!3481) lt!205994) (not ((_ is Found!3481) lt!205994)) (and (bvsge (index!16104 lt!205994) #b00000000000000000000000000000000) (bvslt (index!16104 lt!205994) (size!13833 _keys!709)))) (or ((_ is Undefined!3481) lt!205994) ((_ is Found!3481) lt!205994) (not ((_ is MissingZero!3481) lt!205994)) (and (bvsge (index!16103 lt!205994) #b00000000000000000000000000000000) (bvslt (index!16103 lt!205994) (size!13833 _keys!709)))) (or ((_ is Undefined!3481) lt!205994) ((_ is Found!3481) lt!205994) ((_ is MissingZero!3481) lt!205994) (not ((_ is MissingVacant!3481) lt!205994)) (and (bvsge (index!16106 lt!205994) #b00000000000000000000000000000000) (bvslt (index!16106 lt!205994) (size!13833 _keys!709)))) (or ((_ is Undefined!3481) lt!205994) (ite ((_ is Found!3481) lt!205994) (= (select (arr!13481 _keys!709) (index!16104 lt!205994)) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!3481) lt!205994) (= (select (arr!13481 _keys!709) (index!16103 lt!205994)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3481) lt!205994) (= (select (arr!13481 _keys!709) (index!16106 lt!205994)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74609 (= lt!205994 e!265530)))

(declare-fun c!56294 () Bool)

(assert (=> d!74609 (= c!56294 (and ((_ is Intermediate!3481) lt!205993) (undefined!4293 lt!205993)))))

(assert (=> d!74609 (= lt!205993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) mask!1025) (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025))))

(assert (=> d!74609 (validMask!0 mask!1025)))

(assert (=> d!74609 (= (seekEntryOrOpen!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) lt!205994)))

(declare-fun b!453635 () Bool)

(declare-fun c!56292 () Bool)

(assert (=> b!453635 (= c!56292 (= lt!205992 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!265532 () SeekEntryResult!3481)

(assert (=> b!453635 (= e!265531 e!265532)))

(declare-fun b!453636 () Bool)

(assert (=> b!453636 (= e!265532 (seekKeyOrZeroReturnVacant!0 (x!42407 lt!205993) (index!16105 lt!205993) (index!16105 lt!205993) (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025))))

(declare-fun b!453637 () Bool)

(assert (=> b!453637 (= e!265531 (Found!3481 (index!16105 lt!205993)))))

(declare-fun b!453638 () Bool)

(assert (=> b!453638 (= e!265532 (MissingZero!3481 (index!16105 lt!205993)))))

(assert (= (and d!74609 c!56294) b!453634))

(assert (= (and d!74609 (not c!56294)) b!453633))

(assert (= (and b!453633 c!56293) b!453637))

(assert (= (and b!453633 (not c!56293)) b!453635))

(assert (= (and b!453635 c!56292) b!453638))

(assert (= (and b!453635 (not c!56292)) b!453636))

(declare-fun m!438221 () Bool)

(assert (=> b!453633 m!438221))

(assert (=> d!74609 m!436979))

(declare-fun m!438223 () Bool)

(assert (=> d!74609 m!438223))

(assert (=> d!74609 m!437173))

(declare-fun m!438225 () Bool)

(assert (=> d!74609 m!438225))

(declare-fun m!438227 () Bool)

(assert (=> d!74609 m!438227))

(declare-fun m!438229 () Bool)

(assert (=> d!74609 m!438229))

(declare-fun m!438231 () Bool)

(assert (=> d!74609 m!438231))

(assert (=> d!74609 m!437173))

(assert (=> d!74609 m!438223))

(assert (=> b!453636 m!437173))

(declare-fun m!438233 () Bool)

(assert (=> b!453636 m!438233))

(assert (=> b!453140 d!74609))

(declare-fun d!74611 () Bool)

(assert (=> d!74611 (= (isEmpty!565 lt!205735) (isEmpty!566 (toList!3451 lt!205735)))))

(declare-fun bs!14431 () Bool)

(assert (= bs!14431 d!74611))

(declare-fun m!438235 () Bool)

(assert (=> bs!14431 m!438235))

(assert (=> b!453236 d!74611))

(declare-fun d!74613 () Bool)

(declare-fun e!265533 () Bool)

(assert (=> d!74613 e!265533))

(declare-fun res!270195 () Bool)

(assert (=> d!74613 (=> res!270195 e!265533)))

(declare-fun lt!205996 () Bool)

(assert (=> d!74613 (= res!270195 (not lt!205996))))

(declare-fun lt!205997 () Bool)

(assert (=> d!74613 (= lt!205996 lt!205997)))

(declare-fun lt!205998 () Unit!13229)

(declare-fun e!265534 () Unit!13229)

(assert (=> d!74613 (= lt!205998 e!265534)))

(declare-fun c!56295 () Bool)

(assert (=> d!74613 (= c!56295 lt!205997)))

(assert (=> d!74613 (= lt!205997 (containsKey!347 (toList!3451 lt!205711) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74613 (= (contains!2478 lt!205711 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205996)))

(declare-fun b!453639 () Bool)

(declare-fun lt!205995 () Unit!13229)

(assert (=> b!453639 (= e!265534 lt!205995)))

(assert (=> b!453639 (= lt!205995 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205711) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453639 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205711) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453640 () Bool)

(declare-fun Unit!13258 () Unit!13229)

(assert (=> b!453640 (= e!265534 Unit!13258)))

(declare-fun b!453641 () Bool)

(assert (=> b!453641 (= e!265533 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205711) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74613 c!56295) b!453639))

(assert (= (and d!74613 (not c!56295)) b!453640))

(assert (= (and d!74613 (not res!270195)) b!453641))

(declare-fun m!438237 () Bool)

(assert (=> d!74613 m!438237))

(declare-fun m!438239 () Bool)

(assert (=> b!453639 m!438239))

(declare-fun m!438241 () Bool)

(assert (=> b!453639 m!438241))

(assert (=> b!453639 m!438241))

(declare-fun m!438243 () Bool)

(assert (=> b!453639 m!438243))

(assert (=> b!453641 m!438241))

(assert (=> b!453641 m!438241))

(assert (=> b!453641 m!438243))

(assert (=> d!74375 d!74613))

(assert (=> d!74375 d!74389))

(declare-fun d!74615 () Bool)

(declare-fun e!265535 () Bool)

(assert (=> d!74615 e!265535))

(declare-fun res!270196 () Bool)

(assert (=> d!74615 (=> res!270196 e!265535)))

(declare-fun lt!206000 () Bool)

(assert (=> d!74615 (= res!270196 (not lt!206000))))

(declare-fun lt!206001 () Bool)

(assert (=> d!74615 (= lt!206000 lt!206001)))

(declare-fun lt!206002 () Unit!13229)

(declare-fun e!265536 () Unit!13229)

(assert (=> d!74615 (= lt!206002 e!265536)))

(declare-fun c!56296 () Bool)

(assert (=> d!74615 (= c!56296 lt!206001)))

(assert (=> d!74615 (= lt!206001 (containsKey!347 (toList!3451 lt!205699) (_1!3989 lt!205564)))))

(assert (=> d!74615 (= (contains!2478 lt!205699 (_1!3989 lt!205564)) lt!206000)))

(declare-fun b!453642 () Bool)

(declare-fun lt!205999 () Unit!13229)

(assert (=> b!453642 (= e!265536 lt!205999)))

(assert (=> b!453642 (= lt!205999 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205699) (_1!3989 lt!205564)))))

(assert (=> b!453642 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205699) (_1!3989 lt!205564)))))

(declare-fun b!453643 () Bool)

(declare-fun Unit!13259 () Unit!13229)

(assert (=> b!453643 (= e!265536 Unit!13259)))

(declare-fun b!453644 () Bool)

(assert (=> b!453644 (= e!265535 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205699) (_1!3989 lt!205564))))))

(assert (= (and d!74615 c!56296) b!453642))

(assert (= (and d!74615 (not c!56296)) b!453643))

(assert (= (and d!74615 (not res!270196)) b!453644))

(declare-fun m!438245 () Bool)

(assert (=> d!74615 m!438245))

(declare-fun m!438247 () Bool)

(assert (=> b!453642 m!438247))

(assert (=> b!453642 m!437291))

(assert (=> b!453642 m!437291))

(declare-fun m!438249 () Bool)

(assert (=> b!453642 m!438249))

(assert (=> b!453644 m!437291))

(assert (=> b!453644 m!437291))

(assert (=> b!453644 m!438249))

(assert (=> d!74369 d!74615))

(declare-fun b!453645 () Bool)

(declare-fun e!265537 () Option!377)

(assert (=> b!453645 (= e!265537 (Some!376 (_2!3989 (h!8875 lt!205698))))))

(declare-fun d!74617 () Bool)

(declare-fun c!56297 () Bool)

(assert (=> d!74617 (= c!56297 (and ((_ is Cons!8019) lt!205698) (= (_1!3989 (h!8875 lt!205698)) (_1!3989 lt!205564))))))

(assert (=> d!74617 (= (getValueByKey!371 lt!205698 (_1!3989 lt!205564)) e!265537)))

(declare-fun b!453646 () Bool)

(declare-fun e!265538 () Option!377)

(assert (=> b!453646 (= e!265537 e!265538)))

(declare-fun c!56298 () Bool)

(assert (=> b!453646 (= c!56298 (and ((_ is Cons!8019) lt!205698) (not (= (_1!3989 (h!8875 lt!205698)) (_1!3989 lt!205564)))))))

(declare-fun b!453647 () Bool)

(assert (=> b!453647 (= e!265538 (getValueByKey!371 (t!13839 lt!205698) (_1!3989 lt!205564)))))

(declare-fun b!453648 () Bool)

(assert (=> b!453648 (= e!265538 None!375)))

(assert (= (and d!74617 c!56297) b!453645))

(assert (= (and d!74617 (not c!56297)) b!453646))

(assert (= (and b!453646 c!56298) b!453647))

(assert (= (and b!453646 (not c!56298)) b!453648))

(declare-fun m!438251 () Bool)

(assert (=> b!453647 m!438251))

(assert (=> d!74369 d!74617))

(declare-fun d!74619 () Bool)

(assert (=> d!74619 (= (getValueByKey!371 lt!205698 (_1!3989 lt!205564)) (Some!376 (_2!3989 lt!205564)))))

(declare-fun lt!206003 () Unit!13229)

(assert (=> d!74619 (= lt!206003 (choose!1337 lt!205698 (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(declare-fun e!265539 () Bool)

(assert (=> d!74619 e!265539))

(declare-fun res!270197 () Bool)

(assert (=> d!74619 (=> (not res!270197) (not e!265539))))

(assert (=> d!74619 (= res!270197 (isStrictlySorted!365 lt!205698))))

(assert (=> d!74619 (= (lemmaContainsTupThenGetReturnValue!193 lt!205698 (_1!3989 lt!205564) (_2!3989 lt!205564)) lt!206003)))

(declare-fun b!453649 () Bool)

(declare-fun res!270198 () Bool)

(assert (=> b!453649 (=> (not res!270198) (not e!265539))))

(assert (=> b!453649 (= res!270198 (containsKey!347 lt!205698 (_1!3989 lt!205564)))))

(declare-fun b!453650 () Bool)

(assert (=> b!453650 (= e!265539 (contains!2479 lt!205698 (tuple2!7957 (_1!3989 lt!205564) (_2!3989 lt!205564))))))

(assert (= (and d!74619 res!270197) b!453649))

(assert (= (and b!453649 res!270198) b!453650))

(assert (=> d!74619 m!437285))

(declare-fun m!438253 () Bool)

(assert (=> d!74619 m!438253))

(declare-fun m!438255 () Bool)

(assert (=> d!74619 m!438255))

(declare-fun m!438257 () Bool)

(assert (=> b!453649 m!438257))

(declare-fun m!438259 () Bool)

(assert (=> b!453650 m!438259))

(assert (=> d!74369 d!74619))

(declare-fun b!453651 () Bool)

(declare-fun e!265542 () List!8023)

(assert (=> b!453651 (= e!265542 (insertStrictlySorted!196 (t!13839 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)))) (_1!3989 lt!205564) (_2!3989 lt!205564)))))

(declare-fun b!453653 () Bool)

(declare-fun e!265540 () List!8023)

(declare-fun e!265544 () List!8023)

(assert (=> b!453653 (= e!265540 e!265544)))

(declare-fun c!56301 () Bool)

(assert (=> b!453653 (= c!56301 (and ((_ is Cons!8019) (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)))) (= (_1!3989 (h!8875 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))))) (_1!3989 lt!205564))))))

(declare-fun c!56299 () Bool)

(declare-fun b!453654 () Bool)

(assert (=> b!453654 (= c!56299 (and ((_ is Cons!8019) (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)))) (bvsgt (_1!3989 (h!8875 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))))) (_1!3989 lt!205564))))))

(declare-fun e!265543 () List!8023)

(assert (=> b!453654 (= e!265544 e!265543)))

(declare-fun b!453655 () Bool)

(declare-fun call!30076 () List!8023)

(assert (=> b!453655 (= e!265544 call!30076)))

(declare-fun bm!30071 () Bool)

(declare-fun call!30074 () List!8023)

(assert (=> bm!30071 (= call!30076 call!30074)))

(declare-fun b!453656 () Bool)

(declare-fun call!30075 () List!8023)

(assert (=> b!453656 (= e!265543 call!30075)))

(declare-fun d!74621 () Bool)

(declare-fun e!265541 () Bool)

(assert (=> d!74621 e!265541))

(declare-fun res!270199 () Bool)

(assert (=> d!74621 (=> (not res!270199) (not e!265541))))

(declare-fun lt!206004 () List!8023)

(assert (=> d!74621 (= res!270199 (isStrictlySorted!365 lt!206004))))

(assert (=> d!74621 (= lt!206004 e!265540)))

(declare-fun c!56300 () Bool)

(assert (=> d!74621 (= c!56300 (and ((_ is Cons!8019) (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)))) (bvslt (_1!3989 (h!8875 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))))) (_1!3989 lt!205564))))))

(assert (=> d!74621 (isStrictlySorted!365 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))))))

(assert (=> d!74621 (= (insertStrictlySorted!196 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))) (_1!3989 lt!205564) (_2!3989 lt!205564)) lt!206004)))

(declare-fun b!453652 () Bool)

(assert (=> b!453652 (= e!265540 call!30074)))

(declare-fun b!453657 () Bool)

(assert (=> b!453657 (= e!265543 call!30075)))

(declare-fun b!453658 () Bool)

(declare-fun res!270200 () Bool)

(assert (=> b!453658 (=> (not res!270200) (not e!265541))))

(assert (=> b!453658 (= res!270200 (containsKey!347 lt!206004 (_1!3989 lt!205564)))))

(declare-fun b!453659 () Bool)

(assert (=> b!453659 (= e!265541 (contains!2479 lt!206004 (tuple2!7957 (_1!3989 lt!205564) (_2!3989 lt!205564))))))

(declare-fun bm!30072 () Bool)

(assert (=> bm!30072 (= call!30075 call!30076)))

(declare-fun bm!30073 () Bool)

(assert (=> bm!30073 (= call!30074 ($colon$colon!108 e!265542 (ite c!56300 (h!8875 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)))) (tuple2!7957 (_1!3989 lt!205564) (_2!3989 lt!205564)))))))

(declare-fun c!56302 () Bool)

(assert (=> bm!30073 (= c!56302 c!56300)))

(declare-fun b!453660 () Bool)

(assert (=> b!453660 (= e!265542 (ite c!56301 (t!13839 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)))) (ite c!56299 (Cons!8019 (h!8875 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569)))) (t!13839 (toList!3451 (+!1575 lt!205567 (tuple2!7957 k0!794 lt!205569))))) Nil!8020)))))

(assert (= (and d!74621 c!56300) b!453652))

(assert (= (and d!74621 (not c!56300)) b!453653))

(assert (= (and b!453653 c!56301) b!453655))

(assert (= (and b!453653 (not c!56301)) b!453654))

(assert (= (and b!453654 c!56299) b!453657))

(assert (= (and b!453654 (not c!56299)) b!453656))

(assert (= (or b!453657 b!453656) bm!30072))

(assert (= (or b!453655 bm!30072) bm!30071))

(assert (= (or b!453652 bm!30071) bm!30073))

(assert (= (and bm!30073 c!56302) b!453651))

(assert (= (and bm!30073 (not c!56302)) b!453660))

(assert (= (and d!74621 res!270199) b!453658))

(assert (= (and b!453658 res!270200) b!453659))

(declare-fun m!438261 () Bool)

(assert (=> b!453659 m!438261))

(declare-fun m!438263 () Bool)

(assert (=> b!453658 m!438263))

(declare-fun m!438265 () Bool)

(assert (=> b!453651 m!438265))

(declare-fun m!438267 () Bool)

(assert (=> d!74621 m!438267))

(declare-fun m!438269 () Bool)

(assert (=> d!74621 m!438269))

(declare-fun m!438271 () Bool)

(assert (=> bm!30073 m!438271))

(assert (=> d!74369 d!74621))

(declare-fun d!74623 () Bool)

(declare-fun lt!206005 () Bool)

(assert (=> d!74623 (= lt!206005 (select (content!205 (toList!3451 lt!205684)) lt!205564))))

(declare-fun e!265545 () Bool)

(assert (=> d!74623 (= lt!206005 e!265545)))

(declare-fun res!270202 () Bool)

(assert (=> d!74623 (=> (not res!270202) (not e!265545))))

(assert (=> d!74623 (= res!270202 ((_ is Cons!8019) (toList!3451 lt!205684)))))

(assert (=> d!74623 (= (contains!2479 (toList!3451 lt!205684) lt!205564) lt!206005)))

(declare-fun b!453661 () Bool)

(declare-fun e!265546 () Bool)

(assert (=> b!453661 (= e!265545 e!265546)))

(declare-fun res!270201 () Bool)

(assert (=> b!453661 (=> res!270201 e!265546)))

(assert (=> b!453661 (= res!270201 (= (h!8875 (toList!3451 lt!205684)) lt!205564))))

(declare-fun b!453662 () Bool)

(assert (=> b!453662 (= e!265546 (contains!2479 (t!13839 (toList!3451 lt!205684)) lt!205564))))

(assert (= (and d!74623 res!270202) b!453661))

(assert (= (and b!453661 (not res!270201)) b!453662))

(declare-fun m!438273 () Bool)

(assert (=> d!74623 m!438273))

(declare-fun m!438275 () Bool)

(assert (=> d!74623 m!438275))

(declare-fun m!438277 () Bool)

(assert (=> b!453662 m!438277))

(assert (=> b!453161 d!74623))

(declare-fun b!453663 () Bool)

(declare-fun e!265550 () Bool)

(declare-fun e!265548 () Bool)

(assert (=> b!453663 (= e!265550 e!265548)))

(declare-fun res!270203 () Bool)

(assert (=> b!453663 (=> (not res!270203) (not e!265548))))

(declare-fun e!265549 () Bool)

(assert (=> b!453663 (= res!270203 (not e!265549))))

(declare-fun res!270205 () Bool)

(assert (=> b!453663 (=> (not res!270205) (not e!265549))))

(assert (=> b!453663 (= res!270205 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453664 () Bool)

(declare-fun e!265547 () Bool)

(declare-fun call!30077 () Bool)

(assert (=> b!453664 (= e!265547 call!30077)))

(declare-fun d!74625 () Bool)

(declare-fun res!270204 () Bool)

(assert (=> d!74625 (=> res!270204 e!265550)))

(assert (=> d!74625 (= res!270204 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13833 lt!205566)))))

(assert (=> d!74625 (= (arrayNoDuplicates!0 lt!205566 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56148 (Cons!8020 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) Nil!8021) Nil!8021)) e!265550)))

(declare-fun b!453665 () Bool)

(assert (=> b!453665 (= e!265548 e!265547)))

(declare-fun c!56303 () Bool)

(assert (=> b!453665 (= c!56303 (validKeyInArray!0 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453666 () Bool)

(assert (=> b!453666 (= e!265547 call!30077)))

(declare-fun b!453667 () Bool)

(assert (=> b!453667 (= e!265549 (contains!2477 (ite c!56148 (Cons!8020 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) Nil!8021) Nil!8021) (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!30074 () Bool)

(assert (=> bm!30074 (= call!30077 (arrayNoDuplicates!0 lt!205566 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!56303 (Cons!8020 (select (arr!13481 lt!205566) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!56148 (Cons!8020 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) Nil!8021) Nil!8021)) (ite c!56148 (Cons!8020 (select (arr!13481 lt!205566) #b00000000000000000000000000000000) Nil!8021) Nil!8021))))))

(assert (= (and d!74625 (not res!270204)) b!453663))

(assert (= (and b!453663 res!270205) b!453667))

(assert (= (and b!453663 res!270203) b!453665))

(assert (= (and b!453665 c!56303) b!453664))

(assert (= (and b!453665 (not c!56303)) b!453666))

(assert (= (or b!453664 b!453666) bm!30074))

(assert (=> b!453663 m!438019))

(assert (=> b!453663 m!438019))

(assert (=> b!453663 m!438021))

(assert (=> b!453665 m!438019))

(assert (=> b!453665 m!438019))

(assert (=> b!453665 m!438021))

(assert (=> b!453667 m!438019))

(assert (=> b!453667 m!438019))

(declare-fun m!438279 () Bool)

(assert (=> b!453667 m!438279))

(assert (=> bm!30074 m!438019))

(declare-fun m!438281 () Bool)

(assert (=> bm!30074 m!438281))

(assert (=> bm!30022 d!74625))

(declare-fun b!453668 () Bool)

(declare-fun e!265551 () Option!377)

(assert (=> b!453668 (= e!265551 (Some!376 (_2!3989 (h!8875 (toList!3451 lt!205699)))))))

(declare-fun d!74627 () Bool)

(declare-fun c!56304 () Bool)

(assert (=> d!74627 (= c!56304 (and ((_ is Cons!8019) (toList!3451 lt!205699)) (= (_1!3989 (h!8875 (toList!3451 lt!205699))) (_1!3989 lt!205564))))))

(assert (=> d!74627 (= (getValueByKey!371 (toList!3451 lt!205699) (_1!3989 lt!205564)) e!265551)))

(declare-fun b!453669 () Bool)

(declare-fun e!265552 () Option!377)

(assert (=> b!453669 (= e!265551 e!265552)))

(declare-fun c!56305 () Bool)

(assert (=> b!453669 (= c!56305 (and ((_ is Cons!8019) (toList!3451 lt!205699)) (not (= (_1!3989 (h!8875 (toList!3451 lt!205699))) (_1!3989 lt!205564)))))))

(declare-fun b!453670 () Bool)

(assert (=> b!453670 (= e!265552 (getValueByKey!371 (t!13839 (toList!3451 lt!205699)) (_1!3989 lt!205564)))))

(declare-fun b!453671 () Bool)

(assert (=> b!453671 (= e!265552 None!375)))

(assert (= (and d!74627 c!56304) b!453668))

(assert (= (and d!74627 (not c!56304)) b!453669))

(assert (= (and b!453669 c!56305) b!453670))

(assert (= (and b!453669 (not c!56305)) b!453671))

(declare-fun m!438283 () Bool)

(assert (=> b!453670 m!438283))

(assert (=> b!453166 d!74627))

(assert (=> b!453218 d!74523))

(declare-fun b!453672 () Bool)

(declare-fun e!265553 () Option!377)

(assert (=> b!453672 (= e!265553 (Some!376 (_2!3989 (h!8875 (toList!3451 lt!205691)))))))

(declare-fun c!56306 () Bool)

(declare-fun d!74629 () Bool)

(assert (=> d!74629 (= c!56306 (and ((_ is Cons!8019) (toList!3451 lt!205691)) (= (_1!3989 (h!8875 (toList!3451 lt!205691))) (_1!3989 (tuple2!7957 k0!794 lt!205569)))))))

(assert (=> d!74629 (= (getValueByKey!371 (toList!3451 lt!205691) (_1!3989 (tuple2!7957 k0!794 lt!205569))) e!265553)))

(declare-fun b!453673 () Bool)

(declare-fun e!265554 () Option!377)

(assert (=> b!453673 (= e!265553 e!265554)))

(declare-fun c!56307 () Bool)

(assert (=> b!453673 (= c!56307 (and ((_ is Cons!8019) (toList!3451 lt!205691)) (not (= (_1!3989 (h!8875 (toList!3451 lt!205691))) (_1!3989 (tuple2!7957 k0!794 lt!205569))))))))

(declare-fun b!453674 () Bool)

(assert (=> b!453674 (= e!265554 (getValueByKey!371 (t!13839 (toList!3451 lt!205691)) (_1!3989 (tuple2!7957 k0!794 lt!205569))))))

(declare-fun b!453675 () Bool)

(assert (=> b!453675 (= e!265554 None!375)))

(assert (= (and d!74629 c!56306) b!453672))

(assert (= (and d!74629 (not c!56306)) b!453673))

(assert (= (and b!453673 c!56307) b!453674))

(assert (= (and b!453673 (not c!56307)) b!453675))

(declare-fun m!438285 () Bool)

(assert (=> b!453674 m!438285))

(assert (=> b!453162 d!74629))

(assert (=> bm!30024 d!74503))

(declare-fun b!453676 () Bool)

(declare-fun e!265555 () Option!377)

(assert (=> b!453676 (= e!265555 (Some!376 (_2!3989 (h!8875 (toList!3451 lt!205680)))))))

(declare-fun c!56308 () Bool)

(declare-fun d!74631 () Bool)

(assert (=> d!74631 (= c!56308 (and ((_ is Cons!8019) (toList!3451 lt!205680)) (= (_1!3989 (h!8875 (toList!3451 lt!205680))) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574)))))))

(assert (=> d!74631 (= (getValueByKey!371 (toList!3451 lt!205680) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))) e!265555)))

(declare-fun b!453677 () Bool)

(declare-fun e!265556 () Option!377)

(assert (=> b!453677 (= e!265555 e!265556)))

(declare-fun c!56309 () Bool)

(assert (=> b!453677 (= c!56309 (and ((_ is Cons!8019) (toList!3451 lt!205680)) (not (= (_1!3989 (h!8875 (toList!3451 lt!205680))) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))))

(declare-fun b!453678 () Bool)

(assert (=> b!453678 (= e!265556 (getValueByKey!371 (t!13839 (toList!3451 lt!205680)) (_1!3989 (tuple2!7957 (select (arr!13481 lt!205566) from!863) lt!205574))))))

(declare-fun b!453679 () Bool)

(assert (=> b!453679 (= e!265556 None!375)))

(assert (= (and d!74631 c!56308) b!453676))

(assert (= (and d!74631 (not c!56308)) b!453677))

(assert (= (and b!453677 c!56309) b!453678))

(assert (= (and b!453677 (not c!56309)) b!453679))

(declare-fun m!438287 () Bool)

(assert (=> b!453678 m!438287))

(assert (=> b!453152 d!74631))

(assert (=> b!453215 d!74399))

(declare-fun b!453680 () Bool)

(declare-fun e!265557 () Option!377)

(assert (=> b!453680 (= e!265557 (Some!376 (_2!3989 (h!8875 (toList!3451 lt!205695)))))))

(declare-fun d!74633 () Bool)

(declare-fun c!56310 () Bool)

(assert (=> d!74633 (= c!56310 (and ((_ is Cons!8019) (toList!3451 lt!205695)) (= (_1!3989 (h!8875 (toList!3451 lt!205695))) (_1!3989 (tuple2!7957 k0!794 v!412)))))))

(assert (=> d!74633 (= (getValueByKey!371 (toList!3451 lt!205695) (_1!3989 (tuple2!7957 k0!794 v!412))) e!265557)))

(declare-fun b!453681 () Bool)

(declare-fun e!265558 () Option!377)

(assert (=> b!453681 (= e!265557 e!265558)))

(declare-fun c!56311 () Bool)

(assert (=> b!453681 (= c!56311 (and ((_ is Cons!8019) (toList!3451 lt!205695)) (not (= (_1!3989 (h!8875 (toList!3451 lt!205695))) (_1!3989 (tuple2!7957 k0!794 v!412))))))))

(declare-fun b!453682 () Bool)

(assert (=> b!453682 (= e!265558 (getValueByKey!371 (t!13839 (toList!3451 lt!205695)) (_1!3989 (tuple2!7957 k0!794 v!412))))))

(declare-fun b!453683 () Bool)

(assert (=> b!453683 (= e!265558 None!375)))

(assert (= (and d!74633 c!56310) b!453680))

(assert (= (and d!74633 (not c!56310)) b!453681))

(assert (= (and b!453681 c!56311) b!453682))

(assert (= (and b!453681 (not c!56311)) b!453683))

(declare-fun m!438289 () Bool)

(assert (=> b!453682 m!438289))

(assert (=> b!453164 d!74633))

(declare-fun d!74635 () Bool)

(declare-fun res!270206 () Bool)

(declare-fun e!265559 () Bool)

(assert (=> d!74635 (=> res!270206 e!265559)))

(assert (=> d!74635 (= res!270206 (= (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!794))))

(assert (=> d!74635 (= (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!265559)))

(declare-fun b!453684 () Bool)

(declare-fun e!265560 () Bool)

(assert (=> b!453684 (= e!265559 e!265560)))

(declare-fun res!270207 () Bool)

(assert (=> b!453684 (=> (not res!270207) (not e!265560))))

(assert (=> b!453684 (= res!270207 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!13833 _keys!709)))))

(declare-fun b!453685 () Bool)

(assert (=> b!453685 (= e!265560 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!74635 (not res!270206)) b!453684))

(assert (= (and b!453684 res!270207) b!453685))

(assert (=> d!74635 m!437769))

(declare-fun m!438291 () Bool)

(assert (=> b!453685 m!438291))

(assert (=> b!453205 d!74635))

(declare-fun d!74637 () Bool)

(declare-fun e!265561 () Bool)

(assert (=> d!74637 e!265561))

(declare-fun res!270208 () Bool)

(assert (=> d!74637 (=> res!270208 e!265561)))

(declare-fun lt!206007 () Bool)

(assert (=> d!74637 (= res!270208 (not lt!206007))))

(declare-fun lt!206008 () Bool)

(assert (=> d!74637 (= lt!206007 lt!206008)))

(declare-fun lt!206009 () Unit!13229)

(declare-fun e!265562 () Unit!13229)

(assert (=> d!74637 (= lt!206009 e!265562)))

(declare-fun c!56312 () Bool)

(assert (=> d!74637 (= c!56312 lt!206008)))

(assert (=> d!74637 (= lt!206008 (containsKey!347 (toList!3451 lt!205728) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74637 (= (contains!2478 lt!205728 #b1000000000000000000000000000000000000000000000000000000000000000) lt!206007)))

(declare-fun b!453686 () Bool)

(declare-fun lt!206006 () Unit!13229)

(assert (=> b!453686 (= e!265562 lt!206006)))

(assert (=> b!453686 (= lt!206006 (lemmaContainsKeyImpliesGetValueByKeyDefined!295 (toList!3451 lt!205728) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453686 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205728) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453687 () Bool)

(declare-fun Unit!13260 () Unit!13229)

(assert (=> b!453687 (= e!265562 Unit!13260)))

(declare-fun b!453688 () Bool)

(assert (=> b!453688 (= e!265561 (isDefined!296 (getValueByKey!371 (toList!3451 lt!205728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74637 c!56312) b!453686))

(assert (= (and d!74637 (not c!56312)) b!453687))

(assert (= (and d!74637 (not res!270208)) b!453688))

(declare-fun m!438293 () Bool)

(assert (=> d!74637 m!438293))

(declare-fun m!438295 () Bool)

(assert (=> b!453686 m!438295))

(declare-fun m!438297 () Bool)

(assert (=> b!453686 m!438297))

(assert (=> b!453686 m!438297))

(declare-fun m!438299 () Bool)

(assert (=> b!453686 m!438299))

(assert (=> b!453688 m!438297))

(assert (=> b!453688 m!438297))

(assert (=> b!453688 m!438299))

(assert (=> b!453216 d!74637))

(declare-fun d!74639 () Bool)

(assert (=> d!74639 (= (get!6660 (select (arr!13482 _values!549) from!863) lt!205570) lt!205570)))

(assert (=> b!453169 d!74639))

(declare-fun b!453689 () Bool)

(declare-fun e!265563 () Bool)

(assert (=> b!453689 (= e!265563 tp_is_empty!12139)))

(declare-fun condMapEmpty!19855 () Bool)

(declare-fun mapDefault!19855 () ValueCell!5726)

(assert (=> mapNonEmpty!19854 (= condMapEmpty!19855 (= mapRest!19854 ((as const (Array (_ BitVec 32) ValueCell!5726)) mapDefault!19855)))))

(declare-fun e!265564 () Bool)

(declare-fun mapRes!19855 () Bool)

(assert (=> mapNonEmpty!19854 (= tp!38241 (and e!265564 mapRes!19855))))

(declare-fun b!453690 () Bool)

(assert (=> b!453690 (= e!265564 tp_is_empty!12139)))

(declare-fun mapNonEmpty!19855 () Bool)

(declare-fun tp!38242 () Bool)

(assert (=> mapNonEmpty!19855 (= mapRes!19855 (and tp!38242 e!265563))))

(declare-fun mapRest!19855 () (Array (_ BitVec 32) ValueCell!5726))

(declare-fun mapValue!19855 () ValueCell!5726)

(declare-fun mapKey!19855 () (_ BitVec 32))

(assert (=> mapNonEmpty!19855 (= mapRest!19854 (store mapRest!19855 mapKey!19855 mapValue!19855))))

(declare-fun mapIsEmpty!19855 () Bool)

(assert (=> mapIsEmpty!19855 mapRes!19855))

(assert (= (and mapNonEmpty!19854 condMapEmpty!19855) mapIsEmpty!19855))

(assert (= (and mapNonEmpty!19854 (not condMapEmpty!19855)) mapNonEmpty!19855))

(assert (= (and mapNonEmpty!19855 ((_ is ValueCellFull!5726) mapValue!19855)) b!453689))

(assert (= (and mapNonEmpty!19854 ((_ is ValueCellFull!5726) mapDefault!19855)) b!453690))

(declare-fun m!438301 () Bool)

(assert (=> mapNonEmpty!19855 m!438301))

(declare-fun b_lambda!9669 () Bool)

(assert (= b_lambda!9655 (or (and start!40798 b_free!10801) b_lambda!9669)))

(declare-fun b_lambda!9671 () Bool)

(assert (= b_lambda!9663 (or (and start!40798 b_free!10801) b_lambda!9671)))

(declare-fun b_lambda!9673 () Bool)

(assert (= b_lambda!9657 (or (and start!40798 b_free!10801) b_lambda!9673)))

(declare-fun b_lambda!9675 () Bool)

(assert (= b_lambda!9649 (or (and start!40798 b_free!10801) b_lambda!9675)))

(declare-fun b_lambda!9677 () Bool)

(assert (= b_lambda!9661 (or (and start!40798 b_free!10801) b_lambda!9677)))

(declare-fun b_lambda!9679 () Bool)

(assert (= b_lambda!9643 (or (and start!40798 b_free!10801) b_lambda!9679)))

(declare-fun b_lambda!9681 () Bool)

(assert (= b_lambda!9647 (or (and start!40798 b_free!10801) b_lambda!9681)))

(declare-fun b_lambda!9683 () Bool)

(assert (= b_lambda!9667 (or (and start!40798 b_free!10801) b_lambda!9683)))

(declare-fun b_lambda!9685 () Bool)

(assert (= b_lambda!9651 (or (and start!40798 b_free!10801) b_lambda!9685)))

(declare-fun b_lambda!9687 () Bool)

(assert (= b_lambda!9645 (or (and start!40798 b_free!10801) b_lambda!9687)))

(declare-fun b_lambda!9689 () Bool)

(assert (= b_lambda!9665 (or (and start!40798 b_free!10801) b_lambda!9689)))

(declare-fun b_lambda!9691 () Bool)

(assert (= b_lambda!9641 (or (and start!40798 b_free!10801) b_lambda!9691)))

(declare-fun b_lambda!9693 () Bool)

(assert (= b_lambda!9653 (or (and start!40798 b_free!10801) b_lambda!9693)))

(declare-fun b_lambda!9695 () Bool)

(assert (= b_lambda!9659 (or (and start!40798 b_free!10801) b_lambda!9695)))

(check-sat (not b_lambda!9627) (not b!453367) (not b!453507) (not b!453457) (not b!453563) (not b!453409) (not d!74447) (not d!74583) (not bm!30035) (not d!74453) (not b_lambda!9685) (not d!74611) (not b!453639) (not b!453556) (not b!453370) (not d!74477) (not d!74439) (not b_lambda!9635) (not b!453667) (not d!74553) (not d!74429) (not b!453558) (not b!453404) (not b!453678) (not b_lambda!9669) (not b!453586) (not b!453429) (not b!453363) (not b!453451) (not b_lambda!9621) (not d!74445) (not b!453535) (not bm!30074) (not d!74585) (not b!453321) (not b_next!10801) (not b!453419) (not b!453325) (not b!453607) (not b!453417) (not b!453283) (not b!453456) (not b_lambda!9639) (not b!453248) (not d!74593) (not d!74433) (not b!453543) (not b!453612) (not b!453564) (not b!453269) (not d!74589) (not bm!30060) (not bm!30034) (not b!453249) (not b!453442) (not d!74413) (not d!74505) (not d!74605) (not d!74573) (not b!453497) (not b!453665) (not b_lambda!9693) (not b!453587) (not d!74623) (not b!453372) (not d!74539) (not b!453440) (not b!453538) (not b!453318) (not b!453594) (not b!453271) (not b!453685) (not b!453647) (not d!74577) (not d!74495) (not b!453386) (not b!453364) (not d!74507) (not d!74467) (not b!453490) (not d!74405) (not d!74587) (not b!453438) (not d!74503) (not b!453412) (not b!453309) (not b!453420) (not b!453413) (not bm!30059) (not d!74619) (not b!453308) (not d!74463) (not b!453686) (not b!453334) (not b!453627) (not d!74569) (not b!453452) (not b!453302) (not d!74511) (not b!453424) (not d!74541) (not b_lambda!9633) (not b_lambda!9599) (not b!453272) (not d!74601) (not bm!30055) (not b!453644) (not d!74465) (not b!453575) (not b!453463) (not b!453626) (not b!453688) (not b!453436) (not b_lambda!9625) (not d!74401) (not b!453467) (not b!453316) (not b!453297) (not b!453533) (not bm!30046) (not b!453500) (not b!453605) (not b!453548) (not b!453443) (not b!453312) (not b!453573) (not b!453254) (not b!453632) (not b!453317) (not d!74443) (not d!74581) (not b!453636) (not b!453465) (not b!453320) (not b!453434) (not b!453305) (not d!74557) (not bm!30070) (not b!453546) (not d!74519) (not b_lambda!9629) (not b!453674) (not d!74451) (not b!453411) (not d!74571) (not d!74521) (not d!74551) (not d!74621) (not b!453494) (not b!453553) (not d!74613) (not d!74547) (not b!453306) (not b!453393) (not b!453529) (not b!453383) (not d!74529) (not b!453450) (not bm!30063) (not b!453385) (not b!453502) (not b_lambda!9679) (not b!453422) (not b!453278) (not d!74469) (not b!453650) (not b!453435) (not b!453554) (not b!453604) (not b!453374) (not b_lambda!9689) (not bm!30049) (not d!74599) (not b!453273) (not d!74459) (not b_lambda!9677) (not b!453602) (not b!453583) (not b!453252) (not b!453470) (not b!453503) (not b!453572) (not bm!30073) (not b!453454) (not d!74535) (not b!453444) (not d!74489) (not bm!30045) (not b!453578) (not b!453261) (not b!453565) (not b!453682) (not b!453510) (not b!453622) (not d!74609) (not d!74419) (not b!453472) (not b!453286) (not b!453259) (not b!453585) (not b!453552) (not b!453580) (not b_lambda!9681) (not b!453433) (not d!74525) (not b!453506) (not d!74441) (not b!453376) (not b!453601) (not b!453614) (not d!74415) (not b!453379) (not d!74485) (not d!74493) (not b!453504) (not d!74423) (not b!453335) (not d!74483) (not b!453366) (not b!453484) b_and!18957 (not b!453416) (not b!453258) (not b!453281) (not b!453478) (not bm!30050) (not b_lambda!9683) (not d!74509) (not b!453598) (not b!453613) (not b!453486) (not d!74409) (not b!453485) (not b!453531) (not b!453407) (not b!453492) (not d!74515) (not b!453621) (not b_lambda!9687) (not b!453262) (not bm!30066) (not b!453545) (not d!74421) (not d!74615) (not b!453396) (not b!453547) (not b!453561) (not d!74591) (not b!453390) (not d!74491) (not d!74497) (not b!453658) (not b!453659) (not b!453311) (not b!453299) (not b!453377) (not b!453532) (not b!453670) (not b!453395) (not b!453624) (not d!74501) (not b!453368) (not b!453610) (not b!453432) (not b!453388) (not b_lambda!9671) (not b!453642) (not b_lambda!9691) (not d!74457) (not b_lambda!9695) (not b!453284) (not d!74411) (not d!74549) (not b!453375) (not b!453498) (not b!453256) (not b!453405) (not b!453599) (not b!453475) (not b!453628) (not b!453356) (not b!453460) (not d!74563) (not b!453300) (not d!74523) (not b_lambda!9623) (not b!453397) (not d!74559) (not b!453595) (not b_lambda!9675) (not b!453314) (not d!74579) (not b!453328) (not d!74567) (not b!453649) (not bm!30056) (not b!453495) (not d!74473) (not b!453280) (not bm!30058) (not b!453641) (not d!74431) (not b!453468) (not b!453555) (not d!74637) (not bm!30036) (not b!453542) (not b!453431) (not b!453488) (not b!453255) (not d!74597) (not b!453461) (not d!74531) (not d!74471) (not b!453247) (not d!74417) (not d!74555) (not bm!30069) (not b!453534) (not b!453651) (not mapNonEmpty!19855) (not b!453373) (not b_lambda!9637) (not bm!30057) (not b!453663) (not d!74437) (not b!453526) (not b!453415) (not b!453382) (not b!453550) (not b!453323) tp_is_empty!12139 (not b!453540) (not b!453458) (not b_lambda!9673) (not b!453441) (not b!453250) (not b!453408) (not b!453662) (not b!453304) (not b_lambda!9631) (not b!453577) (not b!453491) (not b!453381))
(check-sat b_and!18957 (not b_next!10801))
