; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73288 () Bool)

(assert start!73288)

(declare-fun b_free!14035 () Bool)

(declare-fun b_next!14035 () Bool)

(assert (=> start!73288 (= b_free!14035 (not b_next!14035))))

(declare-fun tp!49610 () Bool)

(declare-fun b_and!23239 () Bool)

(assert (=> start!73288 (= tp!49610 b_and!23239)))

(declare-fun b!851880 () Bool)

(declare-fun e!475269 () Bool)

(declare-datatypes ((V!26609 0))(
  ( (V!26610 (val!8133 Int)) )
))
(declare-datatypes ((tuple2!10590 0))(
  ( (tuple2!10591 (_1!5306 (_ BitVec 64)) (_2!5306 V!26609)) )
))
(declare-datatypes ((List!16449 0))(
  ( (Nil!16446) (Cons!16445 (h!17582 tuple2!10590) (t!22922 List!16449)) )
))
(declare-datatypes ((ListLongMap!9361 0))(
  ( (ListLongMap!9362 (toList!4696 List!16449)) )
))
(declare-fun call!38006 () ListLongMap!9361)

(declare-fun call!38005 () ListLongMap!9361)

(assert (=> b!851880 (= e!475269 (= call!38006 call!38005))))

(declare-fun bm!38002 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48595 0))(
  ( (array!48596 (arr!23324 (Array (_ BitVec 32) (_ BitVec 64))) (size!23765 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48595)

(declare-datatypes ((ValueCell!7646 0))(
  ( (ValueCellFull!7646 (v!10558 V!26609)) (EmptyCell!7646) )
))
(declare-datatypes ((array!48597 0))(
  ( (array!48598 (arr!23325 (Array (_ BitVec 32) ValueCell!7646)) (size!23766 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48597)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26609)

(declare-fun zeroValue!654 () V!26609)

(declare-fun getCurrentListMapNoExtraKeys!2754 (array!48595 array!48597 (_ BitVec 32) (_ BitVec 32) V!26609 V!26609 (_ BitVec 32) Int) ListLongMap!9361)

(assert (=> bm!38002 (= call!38005 (getCurrentListMapNoExtraKeys!2754 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!383534 () array!48597)

(declare-fun bm!38003 () Bool)

(assert (=> bm!38003 (= call!38006 (getCurrentListMapNoExtraKeys!2754 _keys!868 lt!383534 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851881 () Bool)

(declare-fun res!578401 () Bool)

(declare-fun e!475264 () Bool)

(assert (=> b!851881 (=> (not res!578401) (not e!475264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851881 (= res!578401 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25856 () Bool)

(declare-fun mapRes!25856 () Bool)

(declare-fun tp!49609 () Bool)

(declare-fun e!475270 () Bool)

(assert (=> mapNonEmpty!25856 (= mapRes!25856 (and tp!49609 e!475270))))

(declare-fun mapRest!25856 () (Array (_ BitVec 32) ValueCell!7646))

(declare-fun mapValue!25856 () ValueCell!7646)

(declare-fun mapKey!25856 () (_ BitVec 32))

(assert (=> mapNonEmpty!25856 (= (arr!23325 _values!688) (store mapRest!25856 mapKey!25856 mapValue!25856))))

(declare-fun b!851882 () Bool)

(declare-fun e!475263 () Bool)

(declare-fun e!475265 () Bool)

(assert (=> b!851882 (= e!475263 (and e!475265 mapRes!25856))))

(declare-fun condMapEmpty!25856 () Bool)

(declare-fun mapDefault!25856 () ValueCell!7646)

(assert (=> b!851882 (= condMapEmpty!25856 (= (arr!23325 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7646)) mapDefault!25856)))))

(declare-fun b!851883 () Bool)

(declare-fun res!578400 () Bool)

(assert (=> b!851883 (=> (not res!578400) (not e!475264))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851883 (= res!578400 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23765 _keys!868))))))

(declare-fun b!851884 () Bool)

(declare-fun e!475267 () Bool)

(assert (=> b!851884 (= e!475267 true)))

(declare-fun lt!383533 () V!26609)

(declare-fun lt!383527 () ListLongMap!9361)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!383525 () tuple2!10590)

(declare-fun +!2143 (ListLongMap!9361 tuple2!10590) ListLongMap!9361)

(assert (=> b!851884 (= (+!2143 lt!383527 lt!383525) (+!2143 (+!2143 lt!383527 (tuple2!10591 k0!854 lt!383533)) lt!383525))))

(declare-fun lt!383531 () V!26609)

(assert (=> b!851884 (= lt!383525 (tuple2!10591 k0!854 lt!383531))))

(declare-datatypes ((Unit!29050 0))(
  ( (Unit!29051) )
))
(declare-fun lt!383532 () Unit!29050)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!273 (ListLongMap!9361 (_ BitVec 64) V!26609 V!26609) Unit!29050)

(assert (=> b!851884 (= lt!383532 (addSameAsAddTwiceSameKeyDiffValues!273 lt!383527 k0!854 lt!383533 lt!383531))))

(declare-fun lt!383526 () V!26609)

(declare-fun get!12282 (ValueCell!7646 V!26609) V!26609)

(assert (=> b!851884 (= lt!383533 (get!12282 (select (arr!23325 _values!688) from!1053) lt!383526))))

(declare-fun lt!383528 () ListLongMap!9361)

(assert (=> b!851884 (= lt!383528 (+!2143 lt!383527 (tuple2!10591 (select (arr!23324 _keys!868) from!1053) lt!383531)))))

(declare-fun v!557 () V!26609)

(assert (=> b!851884 (= lt!383531 (get!12282 (select (store (arr!23325 _values!688) i!612 (ValueCellFull!7646 v!557)) from!1053) lt!383526))))

(declare-fun dynLambda!1020 (Int (_ BitVec 64)) V!26609)

(assert (=> b!851884 (= lt!383526 (dynLambda!1020 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851884 (= lt!383527 (getCurrentListMapNoExtraKeys!2754 _keys!868 lt!383534 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851885 () Bool)

(declare-fun res!578392 () Bool)

(assert (=> b!851885 (=> (not res!578392) (not e!475264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48595 (_ BitVec 32)) Bool)

(assert (=> b!851885 (= res!578392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851886 () Bool)

(declare-fun res!578399 () Bool)

(assert (=> b!851886 (=> (not res!578399) (not e!475264))))

(declare-datatypes ((List!16450 0))(
  ( (Nil!16447) (Cons!16446 (h!17583 (_ BitVec 64)) (t!22923 List!16450)) )
))
(declare-fun arrayNoDuplicates!0 (array!48595 (_ BitVec 32) List!16450) Bool)

(assert (=> b!851886 (= res!578399 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16447))))

(declare-fun b!851887 () Bool)

(declare-fun e!475266 () Bool)

(assert (=> b!851887 (= e!475266 (not e!475267))))

(declare-fun res!578397 () Bool)

(assert (=> b!851887 (=> res!578397 e!475267)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851887 (= res!578397 (not (validKeyInArray!0 (select (arr!23324 _keys!868) from!1053))))))

(assert (=> b!851887 e!475269))

(declare-fun c!92005 () Bool)

(assert (=> b!851887 (= c!92005 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383529 () Unit!29050)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!358 (array!48595 array!48597 (_ BitVec 32) (_ BitVec 32) V!26609 V!26609 (_ BitVec 32) (_ BitVec 64) V!26609 (_ BitVec 32) Int) Unit!29050)

(assert (=> b!851887 (= lt!383529 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!358 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851888 () Bool)

(declare-fun res!578398 () Bool)

(assert (=> b!851888 (=> (not res!578398) (not e!475264))))

(assert (=> b!851888 (= res!578398 (and (= (size!23766 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23765 _keys!868) (size!23766 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!578395 () Bool)

(assert (=> start!73288 (=> (not res!578395) (not e!475264))))

(assert (=> start!73288 (= res!578395 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23765 _keys!868))))))

(assert (=> start!73288 e!475264))

(declare-fun tp_is_empty!16171 () Bool)

(assert (=> start!73288 tp_is_empty!16171))

(assert (=> start!73288 true))

(assert (=> start!73288 tp!49610))

(declare-fun array_inv!18552 (array!48595) Bool)

(assert (=> start!73288 (array_inv!18552 _keys!868)))

(declare-fun array_inv!18553 (array!48597) Bool)

(assert (=> start!73288 (and (array_inv!18553 _values!688) e!475263)))

(declare-fun b!851889 () Bool)

(declare-fun res!578396 () Bool)

(assert (=> b!851889 (=> (not res!578396) (not e!475264))))

(assert (=> b!851889 (= res!578396 (validKeyInArray!0 k0!854))))

(declare-fun b!851890 () Bool)

(assert (=> b!851890 (= e!475265 tp_is_empty!16171)))

(declare-fun b!851891 () Bool)

(assert (=> b!851891 (= e!475264 e!475266)))

(declare-fun res!578393 () Bool)

(assert (=> b!851891 (=> (not res!578393) (not e!475266))))

(assert (=> b!851891 (= res!578393 (= from!1053 i!612))))

(assert (=> b!851891 (= lt!383528 (getCurrentListMapNoExtraKeys!2754 _keys!868 lt!383534 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851891 (= lt!383534 (array!48598 (store (arr!23325 _values!688) i!612 (ValueCellFull!7646 v!557)) (size!23766 _values!688)))))

(declare-fun lt!383530 () ListLongMap!9361)

(assert (=> b!851891 (= lt!383530 (getCurrentListMapNoExtraKeys!2754 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851892 () Bool)

(declare-fun res!578394 () Bool)

(assert (=> b!851892 (=> (not res!578394) (not e!475264))))

(assert (=> b!851892 (= res!578394 (and (= (select (arr!23324 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25856 () Bool)

(assert (=> mapIsEmpty!25856 mapRes!25856))

(declare-fun b!851893 () Bool)

(assert (=> b!851893 (= e!475269 (= call!38006 (+!2143 call!38005 (tuple2!10591 k0!854 v!557))))))

(declare-fun b!851894 () Bool)

(assert (=> b!851894 (= e!475270 tp_is_empty!16171)))

(assert (= (and start!73288 res!578395) b!851881))

(assert (= (and b!851881 res!578401) b!851888))

(assert (= (and b!851888 res!578398) b!851885))

(assert (= (and b!851885 res!578392) b!851886))

(assert (= (and b!851886 res!578399) b!851883))

(assert (= (and b!851883 res!578400) b!851889))

(assert (= (and b!851889 res!578396) b!851892))

(assert (= (and b!851892 res!578394) b!851891))

(assert (= (and b!851891 res!578393) b!851887))

(assert (= (and b!851887 c!92005) b!851893))

(assert (= (and b!851887 (not c!92005)) b!851880))

(assert (= (or b!851893 b!851880) bm!38003))

(assert (= (or b!851893 b!851880) bm!38002))

(assert (= (and b!851887 (not res!578397)) b!851884))

(assert (= (and b!851882 condMapEmpty!25856) mapIsEmpty!25856))

(assert (= (and b!851882 (not condMapEmpty!25856)) mapNonEmpty!25856))

(get-info :version)

(assert (= (and mapNonEmpty!25856 ((_ is ValueCellFull!7646) mapValue!25856)) b!851894))

(assert (= (and b!851882 ((_ is ValueCellFull!7646) mapDefault!25856)) b!851890))

(assert (= start!73288 b!851882))

(declare-fun b_lambda!11581 () Bool)

(assert (=> (not b_lambda!11581) (not b!851884)))

(declare-fun t!22921 () Bool)

(declare-fun tb!4329 () Bool)

(assert (=> (and start!73288 (= defaultEntry!696 defaultEntry!696) t!22921) tb!4329))

(declare-fun result!8277 () Bool)

(assert (=> tb!4329 (= result!8277 tp_is_empty!16171)))

(assert (=> b!851884 t!22921))

(declare-fun b_and!23241 () Bool)

(assert (= b_and!23239 (and (=> t!22921 result!8277) b_and!23241)))

(declare-fun m!793111 () Bool)

(assert (=> start!73288 m!793111))

(declare-fun m!793113 () Bool)

(assert (=> start!73288 m!793113))

(declare-fun m!793115 () Bool)

(assert (=> mapNonEmpty!25856 m!793115))

(declare-fun m!793117 () Bool)

(assert (=> b!851884 m!793117))

(declare-fun m!793119 () Bool)

(assert (=> b!851884 m!793119))

(declare-fun m!793121 () Bool)

(assert (=> b!851884 m!793121))

(declare-fun m!793123 () Bool)

(assert (=> b!851884 m!793123))

(declare-fun m!793125 () Bool)

(assert (=> b!851884 m!793125))

(assert (=> b!851884 m!793121))

(declare-fun m!793127 () Bool)

(assert (=> b!851884 m!793127))

(declare-fun m!793129 () Bool)

(assert (=> b!851884 m!793129))

(declare-fun m!793131 () Bool)

(assert (=> b!851884 m!793131))

(declare-fun m!793133 () Bool)

(assert (=> b!851884 m!793133))

(declare-fun m!793135 () Bool)

(assert (=> b!851884 m!793135))

(assert (=> b!851884 m!793117))

(declare-fun m!793137 () Bool)

(assert (=> b!851884 m!793137))

(declare-fun m!793139 () Bool)

(assert (=> b!851884 m!793139))

(declare-fun m!793141 () Bool)

(assert (=> b!851884 m!793141))

(assert (=> b!851884 m!793129))

(declare-fun m!793143 () Bool)

(assert (=> b!851886 m!793143))

(assert (=> bm!38003 m!793133))

(declare-fun m!793145 () Bool)

(assert (=> b!851889 m!793145))

(declare-fun m!793147 () Bool)

(assert (=> b!851891 m!793147))

(assert (=> b!851891 m!793127))

(declare-fun m!793149 () Bool)

(assert (=> b!851891 m!793149))

(assert (=> b!851887 m!793137))

(assert (=> b!851887 m!793137))

(declare-fun m!793151 () Bool)

(assert (=> b!851887 m!793151))

(declare-fun m!793153 () Bool)

(assert (=> b!851887 m!793153))

(declare-fun m!793155 () Bool)

(assert (=> b!851892 m!793155))

(declare-fun m!793157 () Bool)

(assert (=> b!851885 m!793157))

(declare-fun m!793159 () Bool)

(assert (=> b!851893 m!793159))

(declare-fun m!793161 () Bool)

(assert (=> b!851881 m!793161))

(declare-fun m!793163 () Bool)

(assert (=> bm!38002 m!793163))

(check-sat (not b!851891) (not b_lambda!11581) (not b!851893) b_and!23241 (not bm!38002) tp_is_empty!16171 (not b!851884) (not bm!38003) (not b!851887) (not start!73288) (not b!851889) (not mapNonEmpty!25856) (not b!851886) (not b!851885) (not b_next!14035) (not b!851881))
(check-sat b_and!23241 (not b_next!14035))
