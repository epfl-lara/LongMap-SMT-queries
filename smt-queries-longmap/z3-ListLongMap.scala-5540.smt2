; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73026 () Bool)

(assert start!73026)

(declare-fun b_free!13941 () Bool)

(declare-fun b_next!13941 () Bool)

(assert (=> start!73026 (= b_free!13941 (not b_next!13941))))

(declare-fun tp!49326 () Bool)

(declare-fun b_and!23041 () Bool)

(assert (=> start!73026 (= tp!49326 b_and!23041)))

(declare-fun b!848768 () Bool)

(declare-datatypes ((V!26483 0))(
  ( (V!26484 (val!8086 Int)) )
))
(declare-fun v!557 () V!26483)

(declare-fun e!473560 () Bool)

(declare-datatypes ((tuple2!10578 0))(
  ( (tuple2!10579 (_1!5300 (_ BitVec 64)) (_2!5300 V!26483)) )
))
(declare-datatypes ((List!16432 0))(
  ( (Nil!16429) (Cons!16428 (h!17559 tuple2!10578) (t!22819 List!16432)) )
))
(declare-datatypes ((ListLongMap!9347 0))(
  ( (ListLongMap!9348 (toList!4689 List!16432)) )
))
(declare-fun call!37679 () ListLongMap!9347)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!37678 () ListLongMap!9347)

(declare-fun +!2098 (ListLongMap!9347 tuple2!10578) ListLongMap!9347)

(assert (=> b!848768 (= e!473560 (= call!37678 (+!2098 call!37679 (tuple2!10579 k0!854 v!557))))))

(declare-fun b!848769 () Bool)

(declare-fun e!473557 () Bool)

(declare-fun e!473558 () Bool)

(assert (=> b!848769 (= e!473557 (not e!473558))))

(declare-fun res!576642 () Bool)

(assert (=> b!848769 (=> res!576642 e!473558)))

(declare-datatypes ((array!48360 0))(
  ( (array!48361 (arr!23211 (Array (_ BitVec 32) (_ BitVec 64))) (size!23651 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48360)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848769 (= res!576642 (not (validKeyInArray!0 (select (arr!23211 _keys!868) from!1053))))))

(assert (=> b!848769 e!473560))

(declare-fun c!91582 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848769 (= c!91582 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28985 0))(
  ( (Unit!28986) )
))
(declare-fun lt!382104 () Unit!28985)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7599 0))(
  ( (ValueCellFull!7599 (v!10511 V!26483)) (EmptyCell!7599) )
))
(declare-datatypes ((array!48362 0))(
  ( (array!48363 (arr!23212 (Array (_ BitVec 32) ValueCell!7599)) (size!23652 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48362)

(declare-fun minValue!654 () V!26483)

(declare-fun zeroValue!654 () V!26483)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!338 (array!48360 array!48362 (_ BitVec 32) (_ BitVec 32) V!26483 V!26483 (_ BitVec 32) (_ BitVec 64) V!26483 (_ BitVec 32) Int) Unit!28985)

(assert (=> b!848769 (= lt!382104 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!338 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848770 () Bool)

(declare-fun res!576641 () Bool)

(declare-fun e!473556 () Bool)

(assert (=> b!848770 (=> (not res!576641) (not e!473556))))

(assert (=> b!848770 (= res!576641 (and (= (size!23652 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23651 _keys!868) (size!23652 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848772 () Bool)

(declare-fun res!576638 () Bool)

(assert (=> b!848772 (=> (not res!576638) (not e!473556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48360 (_ BitVec 32)) Bool)

(assert (=> b!848772 (= res!576638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848773 () Bool)

(declare-fun res!576640 () Bool)

(assert (=> b!848773 (=> (not res!576640) (not e!473556))))

(assert (=> b!848773 (= res!576640 (and (= (select (arr!23211 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848774 () Bool)

(declare-fun e!473554 () Bool)

(declare-fun e!473559 () Bool)

(declare-fun mapRes!25715 () Bool)

(assert (=> b!848774 (= e!473554 (and e!473559 mapRes!25715))))

(declare-fun condMapEmpty!25715 () Bool)

(declare-fun mapDefault!25715 () ValueCell!7599)

(assert (=> b!848774 (= condMapEmpty!25715 (= (arr!23212 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7599)) mapDefault!25715)))))

(declare-fun b!848775 () Bool)

(declare-fun res!576645 () Bool)

(assert (=> b!848775 (=> (not res!576645) (not e!473556))))

(declare-datatypes ((List!16433 0))(
  ( (Nil!16430) (Cons!16429 (h!17560 (_ BitVec 64)) (t!22820 List!16433)) )
))
(declare-fun arrayNoDuplicates!0 (array!48360 (_ BitVec 32) List!16433) Bool)

(assert (=> b!848775 (= res!576645 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16430))))

(declare-fun b!848776 () Bool)

(declare-fun e!473555 () Bool)

(declare-fun tp_is_empty!16077 () Bool)

(assert (=> b!848776 (= e!473555 tp_is_empty!16077)))

(declare-fun lt!382103 () array!48362)

(declare-fun bm!37675 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2671 (array!48360 array!48362 (_ BitVec 32) (_ BitVec 32) V!26483 V!26483 (_ BitVec 32) Int) ListLongMap!9347)

(assert (=> bm!37675 (= call!37678 (getCurrentListMapNoExtraKeys!2671 _keys!868 lt!382103 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848777 () Bool)

(assert (=> b!848777 (= e!473556 e!473557)))

(declare-fun res!576644 () Bool)

(assert (=> b!848777 (=> (not res!576644) (not e!473557))))

(assert (=> b!848777 (= res!576644 (= from!1053 i!612))))

(declare-fun lt!382102 () ListLongMap!9347)

(assert (=> b!848777 (= lt!382102 (getCurrentListMapNoExtraKeys!2671 _keys!868 lt!382103 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848777 (= lt!382103 (array!48363 (store (arr!23212 _values!688) i!612 (ValueCellFull!7599 v!557)) (size!23652 _values!688)))))

(declare-fun lt!382105 () ListLongMap!9347)

(assert (=> b!848777 (= lt!382105 (getCurrentListMapNoExtraKeys!2671 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!37676 () Bool)

(assert (=> bm!37676 (= call!37679 (getCurrentListMapNoExtraKeys!2671 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848778 () Bool)

(assert (=> b!848778 (= e!473560 (= call!37678 call!37679))))

(declare-fun b!848779 () Bool)

(declare-fun res!576639 () Bool)

(assert (=> b!848779 (=> (not res!576639) (not e!473556))))

(assert (=> b!848779 (= res!576639 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25715 () Bool)

(assert (=> mapIsEmpty!25715 mapRes!25715))

(declare-fun b!848771 () Bool)

(assert (=> b!848771 (= e!473559 tp_is_empty!16077)))

(declare-fun res!576646 () Bool)

(assert (=> start!73026 (=> (not res!576646) (not e!473556))))

(assert (=> start!73026 (= res!576646 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23651 _keys!868))))))

(assert (=> start!73026 e!473556))

(assert (=> start!73026 tp_is_empty!16077))

(assert (=> start!73026 true))

(assert (=> start!73026 tp!49326))

(declare-fun array_inv!18424 (array!48360) Bool)

(assert (=> start!73026 (array_inv!18424 _keys!868)))

(declare-fun array_inv!18425 (array!48362) Bool)

(assert (=> start!73026 (and (array_inv!18425 _values!688) e!473554)))

(declare-fun b!848780 () Bool)

(assert (=> b!848780 (= e!473558 true)))

(declare-fun get!12213 (ValueCell!7599 V!26483) V!26483)

(declare-fun dynLambda!989 (Int (_ BitVec 64)) V!26483)

(assert (=> b!848780 (= lt!382102 (+!2098 (getCurrentListMapNoExtraKeys!2671 _keys!868 lt!382103 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10579 (select (arr!23211 _keys!868) from!1053) (get!12213 (select (arr!23212 lt!382103) from!1053) (dynLambda!989 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!25715 () Bool)

(declare-fun tp!49327 () Bool)

(assert (=> mapNonEmpty!25715 (= mapRes!25715 (and tp!49327 e!473555))))

(declare-fun mapRest!25715 () (Array (_ BitVec 32) ValueCell!7599))

(declare-fun mapKey!25715 () (_ BitVec 32))

(declare-fun mapValue!25715 () ValueCell!7599)

(assert (=> mapNonEmpty!25715 (= (arr!23212 _values!688) (store mapRest!25715 mapKey!25715 mapValue!25715))))

(declare-fun b!848781 () Bool)

(declare-fun res!576643 () Bool)

(assert (=> b!848781 (=> (not res!576643) (not e!473556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848781 (= res!576643 (validMask!0 mask!1196))))

(declare-fun b!848782 () Bool)

(declare-fun res!576647 () Bool)

(assert (=> b!848782 (=> (not res!576647) (not e!473556))))

(assert (=> b!848782 (= res!576647 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23651 _keys!868))))))

(assert (= (and start!73026 res!576646) b!848781))

(assert (= (and b!848781 res!576643) b!848770))

(assert (= (and b!848770 res!576641) b!848772))

(assert (= (and b!848772 res!576638) b!848775))

(assert (= (and b!848775 res!576645) b!848782))

(assert (= (and b!848782 res!576647) b!848779))

(assert (= (and b!848779 res!576639) b!848773))

(assert (= (and b!848773 res!576640) b!848777))

(assert (= (and b!848777 res!576644) b!848769))

(assert (= (and b!848769 c!91582) b!848768))

(assert (= (and b!848769 (not c!91582)) b!848778))

(assert (= (or b!848768 b!848778) bm!37675))

(assert (= (or b!848768 b!848778) bm!37676))

(assert (= (and b!848769 (not res!576642)) b!848780))

(assert (= (and b!848774 condMapEmpty!25715) mapIsEmpty!25715))

(assert (= (and b!848774 (not condMapEmpty!25715)) mapNonEmpty!25715))

(get-info :version)

(assert (= (and mapNonEmpty!25715 ((_ is ValueCellFull!7599) mapValue!25715)) b!848776))

(assert (= (and b!848774 ((_ is ValueCellFull!7599) mapDefault!25715)) b!848771))

(assert (= start!73026 b!848774))

(declare-fun b_lambda!11473 () Bool)

(assert (=> (not b_lambda!11473) (not b!848780)))

(declare-fun t!22818 () Bool)

(declare-fun tb!4243 () Bool)

(assert (=> (and start!73026 (= defaultEntry!696 defaultEntry!696) t!22818) tb!4243))

(declare-fun result!8097 () Bool)

(assert (=> tb!4243 (= result!8097 tp_is_empty!16077)))

(assert (=> b!848780 t!22818))

(declare-fun b_and!23043 () Bool)

(assert (= b_and!23041 (and (=> t!22818 result!8097) b_and!23043)))

(declare-fun m!789519 () Bool)

(assert (=> b!848772 m!789519))

(declare-fun m!789521 () Bool)

(assert (=> b!848769 m!789521))

(assert (=> b!848769 m!789521))

(declare-fun m!789523 () Bool)

(assert (=> b!848769 m!789523))

(declare-fun m!789525 () Bool)

(assert (=> b!848769 m!789525))

(declare-fun m!789527 () Bool)

(assert (=> b!848780 m!789527))

(declare-fun m!789529 () Bool)

(assert (=> b!848780 m!789529))

(assert (=> b!848780 m!789527))

(declare-fun m!789531 () Bool)

(assert (=> b!848780 m!789531))

(assert (=> b!848780 m!789529))

(declare-fun m!789533 () Bool)

(assert (=> b!848780 m!789533))

(declare-fun m!789535 () Bool)

(assert (=> b!848780 m!789535))

(assert (=> b!848780 m!789521))

(assert (=> b!848780 m!789533))

(assert (=> bm!37675 m!789527))

(declare-fun m!789537 () Bool)

(assert (=> b!848781 m!789537))

(declare-fun m!789539 () Bool)

(assert (=> b!848775 m!789539))

(declare-fun m!789541 () Bool)

(assert (=> b!848779 m!789541))

(declare-fun m!789543 () Bool)

(assert (=> b!848773 m!789543))

(declare-fun m!789545 () Bool)

(assert (=> b!848768 m!789545))

(declare-fun m!789547 () Bool)

(assert (=> b!848777 m!789547))

(declare-fun m!789549 () Bool)

(assert (=> b!848777 m!789549))

(declare-fun m!789551 () Bool)

(assert (=> b!848777 m!789551))

(declare-fun m!789553 () Bool)

(assert (=> start!73026 m!789553))

(declare-fun m!789555 () Bool)

(assert (=> start!73026 m!789555))

(declare-fun m!789557 () Bool)

(assert (=> bm!37676 m!789557))

(declare-fun m!789559 () Bool)

(assert (=> mapNonEmpty!25715 m!789559))

(check-sat (not b!848775) (not b!848780) (not mapNonEmpty!25715) tp_is_empty!16077 (not b!848772) (not b!848779) (not b_lambda!11473) (not bm!37676) (not b!848777) (not b!848769) (not b_next!13941) (not bm!37675) (not b!848781) (not start!73026) (not b!848768) b_and!23043)
(check-sat b_and!23043 (not b_next!13941))
