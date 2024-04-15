; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73102 () Bool)

(assert start!73102)

(declare-fun b_free!14035 () Bool)

(declare-fun b_next!14035 () Bool)

(assert (=> start!73102 (= b_free!14035 (not b_next!14035))))

(declare-fun tp!49609 () Bool)

(declare-fun b_and!23203 () Bool)

(assert (=> start!73102 (= tp!49609 b_and!23203)))

(declare-datatypes ((V!26609 0))(
  ( (V!26610 (val!8133 Int)) )
))
(declare-datatypes ((tuple2!10684 0))(
  ( (tuple2!10685 (_1!5353 (_ BitVec 64)) (_2!5353 V!26609)) )
))
(declare-datatypes ((List!16521 0))(
  ( (Nil!16518) (Cons!16517 (h!17648 tuple2!10684) (t!22993 List!16521)) )
))
(declare-datatypes ((ListLongMap!9443 0))(
  ( (ListLongMap!9444 (toList!4737 List!16521)) )
))
(declare-fun call!37934 () ListLongMap!9443)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48535 0))(
  ( (array!48536 (arr!23299 (Array (_ BitVec 32) (_ BitVec 64))) (size!23741 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48535)

(declare-datatypes ((ValueCell!7646 0))(
  ( (ValueCellFull!7646 (v!10552 V!26609)) (EmptyCell!7646) )
))
(declare-datatypes ((array!48537 0))(
  ( (array!48538 (arr!23300 (Array (_ BitVec 32) ValueCell!7646)) (size!23742 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48537)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26609)

(declare-fun zeroValue!654 () V!26609)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!37931 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2745 (array!48535 array!48537 (_ BitVec 32) (_ BitVec 32) V!26609 V!26609 (_ BitVec 32) Int) ListLongMap!9443)

(assert (=> bm!37931 (= call!37934 (getCurrentListMapNoExtraKeys!2745 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850738 () Bool)

(declare-fun res!577947 () Bool)

(declare-fun e!474540 () Bool)

(assert (=> b!850738 (=> (not res!577947) (not e!474540))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850738 (= res!577947 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23741 _keys!868))))))

(declare-fun b!850739 () Bool)

(declare-fun res!577944 () Bool)

(assert (=> b!850739 (=> (not res!577944) (not e!474540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850739 (= res!577944 (validMask!0 mask!1196))))

(declare-fun b!850740 () Bool)

(declare-fun e!474534 () Bool)

(assert (=> b!850740 (= e!474534 true)))

(declare-fun lt!382933 () V!26609)

(declare-fun lt!382929 () ListLongMap!9443)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!382928 () tuple2!10684)

(declare-fun +!2157 (ListLongMap!9443 tuple2!10684) ListLongMap!9443)

(assert (=> b!850740 (= (+!2157 lt!382929 lt!382928) (+!2157 (+!2157 lt!382929 (tuple2!10685 k0!854 lt!382933)) lt!382928))))

(declare-fun lt!382931 () V!26609)

(assert (=> b!850740 (= lt!382928 (tuple2!10685 k0!854 lt!382931))))

(declare-datatypes ((Unit!28987 0))(
  ( (Unit!28988) )
))
(declare-fun lt!382935 () Unit!28987)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!271 (ListLongMap!9443 (_ BitVec 64) V!26609 V!26609) Unit!28987)

(assert (=> b!850740 (= lt!382935 (addSameAsAddTwiceSameKeyDiffValues!271 lt!382929 k0!854 lt!382933 lt!382931))))

(declare-fun lt!382932 () V!26609)

(declare-fun get!12280 (ValueCell!7646 V!26609) V!26609)

(assert (=> b!850740 (= lt!382933 (get!12280 (select (arr!23300 _values!688) from!1053) lt!382932))))

(declare-fun lt!382934 () ListLongMap!9443)

(assert (=> b!850740 (= lt!382934 (+!2157 lt!382929 (tuple2!10685 (select (arr!23299 _keys!868) from!1053) lt!382931)))))

(declare-fun v!557 () V!26609)

(assert (=> b!850740 (= lt!382931 (get!12280 (select (store (arr!23300 _values!688) i!612 (ValueCellFull!7646 v!557)) from!1053) lt!382932))))

(declare-fun dynLambda!1021 (Int (_ BitVec 64)) V!26609)

(assert (=> b!850740 (= lt!382932 (dynLambda!1021 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382930 () array!48537)

(assert (=> b!850740 (= lt!382929 (getCurrentListMapNoExtraKeys!2745 _keys!868 lt!382930 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850741 () Bool)

(declare-fun e!474536 () Bool)

(assert (=> b!850741 (= e!474540 e!474536)))

(declare-fun res!577939 () Bool)

(assert (=> b!850741 (=> (not res!577939) (not e!474536))))

(assert (=> b!850741 (= res!577939 (= from!1053 i!612))))

(assert (=> b!850741 (= lt!382934 (getCurrentListMapNoExtraKeys!2745 _keys!868 lt!382930 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850741 (= lt!382930 (array!48538 (store (arr!23300 _values!688) i!612 (ValueCellFull!7646 v!557)) (size!23742 _values!688)))))

(declare-fun lt!382936 () ListLongMap!9443)

(assert (=> b!850741 (= lt!382936 (getCurrentListMapNoExtraKeys!2745 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850742 () Bool)

(assert (=> b!850742 (= e!474536 (not e!474534))))

(declare-fun res!577941 () Bool)

(assert (=> b!850742 (=> res!577941 e!474534)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850742 (= res!577941 (not (validKeyInArray!0 (select (arr!23299 _keys!868) from!1053))))))

(declare-fun e!474539 () Bool)

(assert (=> b!850742 e!474539))

(declare-fun c!91658 () Bool)

(assert (=> b!850742 (= c!91658 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382937 () Unit!28987)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!365 (array!48535 array!48537 (_ BitVec 32) (_ BitVec 32) V!26609 V!26609 (_ BitVec 32) (_ BitVec 64) V!26609 (_ BitVec 32) Int) Unit!28987)

(assert (=> b!850742 (= lt!382937 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!365 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850743 () Bool)

(declare-fun res!577943 () Bool)

(assert (=> b!850743 (=> (not res!577943) (not e!474540))))

(declare-datatypes ((List!16522 0))(
  ( (Nil!16519) (Cons!16518 (h!17649 (_ BitVec 64)) (t!22994 List!16522)) )
))
(declare-fun arrayNoDuplicates!0 (array!48535 (_ BitVec 32) List!16522) Bool)

(assert (=> b!850743 (= res!577943 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16519))))

(declare-fun b!850744 () Bool)

(declare-fun e!474533 () Bool)

(declare-fun tp_is_empty!16171 () Bool)

(assert (=> b!850744 (= e!474533 tp_is_empty!16171)))

(declare-fun res!577945 () Bool)

(assert (=> start!73102 (=> (not res!577945) (not e!474540))))

(assert (=> start!73102 (= res!577945 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23741 _keys!868))))))

(assert (=> start!73102 e!474540))

(assert (=> start!73102 tp_is_empty!16171))

(assert (=> start!73102 true))

(assert (=> start!73102 tp!49609))

(declare-fun array_inv!18564 (array!48535) Bool)

(assert (=> start!73102 (array_inv!18564 _keys!868)))

(declare-fun e!474537 () Bool)

(declare-fun array_inv!18565 (array!48537) Bool)

(assert (=> start!73102 (and (array_inv!18565 _values!688) e!474537)))

(declare-fun b!850745 () Bool)

(declare-fun res!577938 () Bool)

(assert (=> b!850745 (=> (not res!577938) (not e!474540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48535 (_ BitVec 32)) Bool)

(assert (=> b!850745 (= res!577938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850746 () Bool)

(declare-fun res!577940 () Bool)

(assert (=> b!850746 (=> (not res!577940) (not e!474540))))

(assert (=> b!850746 (= res!577940 (and (= (size!23742 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23741 _keys!868) (size!23742 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850747 () Bool)

(declare-fun e!474538 () Bool)

(assert (=> b!850747 (= e!474538 tp_is_empty!16171)))

(declare-fun mapNonEmpty!25856 () Bool)

(declare-fun mapRes!25856 () Bool)

(declare-fun tp!49610 () Bool)

(assert (=> mapNonEmpty!25856 (= mapRes!25856 (and tp!49610 e!474538))))

(declare-fun mapKey!25856 () (_ BitVec 32))

(declare-fun mapRest!25856 () (Array (_ BitVec 32) ValueCell!7646))

(declare-fun mapValue!25856 () ValueCell!7646)

(assert (=> mapNonEmpty!25856 (= (arr!23300 _values!688) (store mapRest!25856 mapKey!25856 mapValue!25856))))

(declare-fun b!850748 () Bool)

(declare-fun res!577946 () Bool)

(assert (=> b!850748 (=> (not res!577946) (not e!474540))))

(assert (=> b!850748 (= res!577946 (and (= (select (arr!23299 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850749 () Bool)

(declare-fun call!37935 () ListLongMap!9443)

(assert (=> b!850749 (= e!474539 (= call!37935 (+!2157 call!37934 (tuple2!10685 k0!854 v!557))))))

(declare-fun b!850750 () Bool)

(declare-fun res!577942 () Bool)

(assert (=> b!850750 (=> (not res!577942) (not e!474540))))

(assert (=> b!850750 (= res!577942 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25856 () Bool)

(assert (=> mapIsEmpty!25856 mapRes!25856))

(declare-fun b!850751 () Bool)

(assert (=> b!850751 (= e!474537 (and e!474533 mapRes!25856))))

(declare-fun condMapEmpty!25856 () Bool)

(declare-fun mapDefault!25856 () ValueCell!7646)

(assert (=> b!850751 (= condMapEmpty!25856 (= (arr!23300 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7646)) mapDefault!25856)))))

(declare-fun b!850752 () Bool)

(assert (=> b!850752 (= e!474539 (= call!37935 call!37934))))

(declare-fun bm!37932 () Bool)

(assert (=> bm!37932 (= call!37935 (getCurrentListMapNoExtraKeys!2745 _keys!868 lt!382930 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73102 res!577945) b!850739))

(assert (= (and b!850739 res!577944) b!850746))

(assert (= (and b!850746 res!577940) b!850745))

(assert (= (and b!850745 res!577938) b!850743))

(assert (= (and b!850743 res!577943) b!850738))

(assert (= (and b!850738 res!577947) b!850750))

(assert (= (and b!850750 res!577942) b!850748))

(assert (= (and b!850748 res!577946) b!850741))

(assert (= (and b!850741 res!577939) b!850742))

(assert (= (and b!850742 c!91658) b!850749))

(assert (= (and b!850742 (not c!91658)) b!850752))

(assert (= (or b!850749 b!850752) bm!37932))

(assert (= (or b!850749 b!850752) bm!37931))

(assert (= (and b!850742 (not res!577941)) b!850740))

(assert (= (and b!850751 condMapEmpty!25856) mapIsEmpty!25856))

(assert (= (and b!850751 (not condMapEmpty!25856)) mapNonEmpty!25856))

(get-info :version)

(assert (= (and mapNonEmpty!25856 ((_ is ValueCellFull!7646) mapValue!25856)) b!850747))

(assert (= (and b!850751 ((_ is ValueCellFull!7646) mapDefault!25856)) b!850744))

(assert (= start!73102 b!850751))

(declare-fun b_lambda!11549 () Bool)

(assert (=> (not b_lambda!11549) (not b!850740)))

(declare-fun t!22992 () Bool)

(declare-fun tb!4329 () Bool)

(assert (=> (and start!73102 (= defaultEntry!696 defaultEntry!696) t!22992) tb!4329))

(declare-fun result!8277 () Bool)

(assert (=> tb!4329 (= result!8277 tp_is_empty!16171)))

(assert (=> b!850740 t!22992))

(declare-fun b_and!23205 () Bool)

(assert (= b_and!23203 (and (=> t!22992 result!8277) b_and!23205)))

(declare-fun m!791065 () Bool)

(assert (=> b!850740 m!791065))

(declare-fun m!791067 () Bool)

(assert (=> b!850740 m!791067))

(declare-fun m!791069 () Bool)

(assert (=> b!850740 m!791069))

(declare-fun m!791071 () Bool)

(assert (=> b!850740 m!791071))

(declare-fun m!791073 () Bool)

(assert (=> b!850740 m!791073))

(assert (=> b!850740 m!791071))

(declare-fun m!791075 () Bool)

(assert (=> b!850740 m!791075))

(assert (=> b!850740 m!791073))

(declare-fun m!791077 () Bool)

(assert (=> b!850740 m!791077))

(declare-fun m!791079 () Bool)

(assert (=> b!850740 m!791079))

(assert (=> b!850740 m!791065))

(declare-fun m!791081 () Bool)

(assert (=> b!850740 m!791081))

(declare-fun m!791083 () Bool)

(assert (=> b!850740 m!791083))

(declare-fun m!791085 () Bool)

(assert (=> b!850740 m!791085))

(declare-fun m!791087 () Bool)

(assert (=> b!850740 m!791087))

(declare-fun m!791089 () Bool)

(assert (=> b!850740 m!791089))

(declare-fun m!791091 () Bool)

(assert (=> b!850748 m!791091))

(declare-fun m!791093 () Bool)

(assert (=> b!850739 m!791093))

(declare-fun m!791095 () Bool)

(assert (=> bm!37931 m!791095))

(declare-fun m!791097 () Bool)

(assert (=> mapNonEmpty!25856 m!791097))

(assert (=> bm!37932 m!791083))

(declare-fun m!791099 () Bool)

(assert (=> start!73102 m!791099))

(declare-fun m!791101 () Bool)

(assert (=> start!73102 m!791101))

(declare-fun m!791103 () Bool)

(assert (=> b!850749 m!791103))

(declare-fun m!791105 () Bool)

(assert (=> b!850741 m!791105))

(assert (=> b!850741 m!791081))

(declare-fun m!791107 () Bool)

(assert (=> b!850741 m!791107))

(declare-fun m!791109 () Bool)

(assert (=> b!850745 m!791109))

(assert (=> b!850742 m!791087))

(assert (=> b!850742 m!791087))

(declare-fun m!791111 () Bool)

(assert (=> b!850742 m!791111))

(declare-fun m!791113 () Bool)

(assert (=> b!850742 m!791113))

(declare-fun m!791115 () Bool)

(assert (=> b!850750 m!791115))

(declare-fun m!791117 () Bool)

(assert (=> b!850743 m!791117))

(check-sat (not b!850739) (not b!850749) (not start!73102) (not b!850740) (not mapNonEmpty!25856) (not bm!37932) b_and!23205 tp_is_empty!16171 (not b_lambda!11549) (not b!850745) (not b!850743) (not bm!37931) (not b_next!14035) (not b!850742) (not b!850741) (not b!850750))
(check-sat b_and!23205 (not b_next!14035))
