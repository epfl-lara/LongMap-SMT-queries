; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73054 () Bool)

(assert start!73054)

(declare-fun b_free!13987 () Bool)

(declare-fun b_next!13987 () Bool)

(assert (=> start!73054 (= b_free!13987 (not b_next!13987))))

(declare-fun tp!49466 () Bool)

(declare-fun b_and!23107 () Bool)

(assert (=> start!73054 (= tp!49466 b_and!23107)))

(declare-fun b!849610 () Bool)

(declare-fun res!577221 () Bool)

(declare-fun e!473958 () Bool)

(assert (=> b!849610 (=> (not res!577221) (not e!473958))))

(declare-datatypes ((array!48443 0))(
  ( (array!48444 (arr!23253 (Array (_ BitVec 32) (_ BitVec 64))) (size!23695 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48443)

(declare-datatypes ((List!16488 0))(
  ( (Nil!16485) (Cons!16484 (h!17615 (_ BitVec 64)) (t!22912 List!16488)) )
))
(declare-fun arrayNoDuplicates!0 (array!48443 (_ BitVec 32) List!16488) Bool)

(assert (=> b!849610 (= res!577221 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16485))))

(declare-fun b!849611 () Bool)

(declare-fun e!473962 () Bool)

(declare-datatypes ((V!26545 0))(
  ( (V!26546 (val!8109 Int)) )
))
(declare-datatypes ((tuple2!10644 0))(
  ( (tuple2!10645 (_1!5333 (_ BitVec 64)) (_2!5333 V!26545)) )
))
(declare-datatypes ((List!16489 0))(
  ( (Nil!16486) (Cons!16485 (h!17616 tuple2!10644) (t!22913 List!16489)) )
))
(declare-datatypes ((ListLongMap!9403 0))(
  ( (ListLongMap!9404 (toList!4717 List!16489)) )
))
(declare-fun call!37791 () ListLongMap!9403)

(declare-fun call!37790 () ListLongMap!9403)

(assert (=> b!849611 (= e!473962 (= call!37791 call!37790))))

(declare-fun res!577220 () Bool)

(assert (=> start!73054 (=> (not res!577220) (not e!473958))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73054 (= res!577220 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23695 _keys!868))))))

(assert (=> start!73054 e!473958))

(declare-fun tp_is_empty!16123 () Bool)

(assert (=> start!73054 tp_is_empty!16123))

(assert (=> start!73054 true))

(assert (=> start!73054 tp!49466))

(declare-fun array_inv!18538 (array!48443) Bool)

(assert (=> start!73054 (array_inv!18538 _keys!868)))

(declare-datatypes ((ValueCell!7622 0))(
  ( (ValueCellFull!7622 (v!10528 V!26545)) (EmptyCell!7622) )
))
(declare-datatypes ((array!48445 0))(
  ( (array!48446 (arr!23254 (Array (_ BitVec 32) ValueCell!7622)) (size!23696 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48445)

(declare-fun e!473964 () Bool)

(declare-fun array_inv!18539 (array!48445) Bool)

(assert (=> start!73054 (and (array_inv!18539 _values!688) e!473964)))

(declare-fun b!849612 () Bool)

(declare-fun res!577219 () Bool)

(assert (=> b!849612 (=> (not res!577219) (not e!473958))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849612 (= res!577219 (validMask!0 mask!1196))))

(declare-fun b!849613 () Bool)

(declare-fun res!577222 () Bool)

(assert (=> b!849613 (=> (not res!577222) (not e!473958))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849613 (= res!577222 (validKeyInArray!0 k0!854))))

(declare-fun b!849614 () Bool)

(declare-fun e!473963 () Bool)

(declare-fun mapRes!25784 () Bool)

(assert (=> b!849614 (= e!473964 (and e!473963 mapRes!25784))))

(declare-fun condMapEmpty!25784 () Bool)

(declare-fun mapDefault!25784 () ValueCell!7622)

(assert (=> b!849614 (= condMapEmpty!25784 (= (arr!23254 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7622)) mapDefault!25784)))))

(declare-fun b!849615 () Bool)

(declare-fun e!473957 () Bool)

(assert (=> b!849615 (= e!473957 tp_is_empty!16123)))

(declare-fun b!849616 () Bool)

(declare-fun res!577218 () Bool)

(assert (=> b!849616 (=> (not res!577218) (not e!473958))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849616 (= res!577218 (and (= (select (arr!23253 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849617 () Bool)

(declare-fun res!577226 () Bool)

(assert (=> b!849617 (=> (not res!577226) (not e!473958))))

(assert (=> b!849617 (= res!577226 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23695 _keys!868))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37787 () Bool)

(declare-fun lt!382208 () array!48445)

(declare-fun minValue!654 () V!26545)

(declare-fun zeroValue!654 () V!26545)

(declare-fun getCurrentListMapNoExtraKeys!2726 (array!48443 array!48445 (_ BitVec 32) (_ BitVec 32) V!26545 V!26545 (_ BitVec 32) Int) ListLongMap!9403)

(assert (=> bm!37787 (= call!37791 (getCurrentListMapNoExtraKeys!2726 _keys!868 lt!382208 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849618 () Bool)

(declare-fun res!577227 () Bool)

(assert (=> b!849618 (=> (not res!577227) (not e!473958))))

(assert (=> b!849618 (= res!577227 (and (= (size!23696 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23695 _keys!868) (size!23696 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25784 () Bool)

(declare-fun tp!49465 () Bool)

(assert (=> mapNonEmpty!25784 (= mapRes!25784 (and tp!49465 e!473957))))

(declare-fun mapValue!25784 () ValueCell!7622)

(declare-fun mapKey!25784 () (_ BitVec 32))

(declare-fun mapRest!25784 () (Array (_ BitVec 32) ValueCell!7622))

(assert (=> mapNonEmpty!25784 (= (arr!23254 _values!688) (store mapRest!25784 mapKey!25784 mapValue!25784))))

(declare-fun b!849619 () Bool)

(declare-fun res!577224 () Bool)

(assert (=> b!849619 (=> (not res!577224) (not e!473958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48443 (_ BitVec 32)) Bool)

(assert (=> b!849619 (= res!577224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun v!557 () V!26545)

(declare-fun b!849620 () Bool)

(declare-fun +!2143 (ListLongMap!9403 tuple2!10644) ListLongMap!9403)

(assert (=> b!849620 (= e!473962 (= call!37791 (+!2143 call!37790 (tuple2!10645 k0!854 v!557))))))

(declare-fun b!849621 () Bool)

(declare-fun e!473960 () Bool)

(declare-fun e!473961 () Bool)

(assert (=> b!849621 (= e!473960 (not e!473961))))

(declare-fun res!577225 () Bool)

(assert (=> b!849621 (=> res!577225 e!473961)))

(assert (=> b!849621 (= res!577225 (not (validKeyInArray!0 (select (arr!23253 _keys!868) from!1053))))))

(assert (=> b!849621 e!473962))

(declare-fun c!91586 () Bool)

(assert (=> b!849621 (= c!91586 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28957 0))(
  ( (Unit!28958) )
))
(declare-fun lt!382211 () Unit!28957)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!353 (array!48443 array!48445 (_ BitVec 32) (_ BitVec 32) V!26545 V!26545 (_ BitVec 32) (_ BitVec 64) V!26545 (_ BitVec 32) Int) Unit!28957)

(assert (=> b!849621 (= lt!382211 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!353 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849622 () Bool)

(assert (=> b!849622 (= e!473958 e!473960)))

(declare-fun res!577223 () Bool)

(assert (=> b!849622 (=> (not res!577223) (not e!473960))))

(assert (=> b!849622 (= res!577223 (= from!1053 i!612))))

(declare-fun lt!382217 () ListLongMap!9403)

(assert (=> b!849622 (= lt!382217 (getCurrentListMapNoExtraKeys!2726 _keys!868 lt!382208 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849622 (= lt!382208 (array!48446 (store (arr!23254 _values!688) i!612 (ValueCellFull!7622 v!557)) (size!23696 _values!688)))))

(declare-fun lt!382214 () ListLongMap!9403)

(assert (=> b!849622 (= lt!382214 (getCurrentListMapNoExtraKeys!2726 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849623 () Bool)

(assert (=> b!849623 (= e!473961 true)))

(declare-fun lt!382213 () tuple2!10644)

(declare-fun lt!382212 () ListLongMap!9403)

(declare-fun lt!382210 () V!26545)

(assert (=> b!849623 (= (+!2143 lt!382212 lt!382213) (+!2143 (+!2143 lt!382212 (tuple2!10645 k0!854 lt!382210)) lt!382213))))

(declare-fun lt!382209 () V!26545)

(assert (=> b!849623 (= lt!382213 (tuple2!10645 k0!854 lt!382209))))

(declare-fun lt!382216 () Unit!28957)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!257 (ListLongMap!9403 (_ BitVec 64) V!26545 V!26545) Unit!28957)

(assert (=> b!849623 (= lt!382216 (addSameAsAddTwiceSameKeyDiffValues!257 lt!382212 k0!854 lt!382210 lt!382209))))

(declare-fun lt!382215 () V!26545)

(declare-fun get!12250 (ValueCell!7622 V!26545) V!26545)

(assert (=> b!849623 (= lt!382210 (get!12250 (select (arr!23254 _values!688) from!1053) lt!382215))))

(assert (=> b!849623 (= lt!382217 (+!2143 lt!382212 (tuple2!10645 (select (arr!23253 _keys!868) from!1053) lt!382209)))))

(assert (=> b!849623 (= lt!382209 (get!12250 (select (store (arr!23254 _values!688) i!612 (ValueCellFull!7622 v!557)) from!1053) lt!382215))))

(declare-fun dynLambda!1007 (Int (_ BitVec 64)) V!26545)

(assert (=> b!849623 (= lt!382215 (dynLambda!1007 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!849623 (= lt!382212 (getCurrentListMapNoExtraKeys!2726 _keys!868 lt!382208 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25784 () Bool)

(assert (=> mapIsEmpty!25784 mapRes!25784))

(declare-fun bm!37788 () Bool)

(assert (=> bm!37788 (= call!37790 (getCurrentListMapNoExtraKeys!2726 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849624 () Bool)

(assert (=> b!849624 (= e!473963 tp_is_empty!16123)))

(assert (= (and start!73054 res!577220) b!849612))

(assert (= (and b!849612 res!577219) b!849618))

(assert (= (and b!849618 res!577227) b!849619))

(assert (= (and b!849619 res!577224) b!849610))

(assert (= (and b!849610 res!577221) b!849617))

(assert (= (and b!849617 res!577226) b!849613))

(assert (= (and b!849613 res!577222) b!849616))

(assert (= (and b!849616 res!577218) b!849622))

(assert (= (and b!849622 res!577223) b!849621))

(assert (= (and b!849621 c!91586) b!849620))

(assert (= (and b!849621 (not c!91586)) b!849611))

(assert (= (or b!849620 b!849611) bm!37787))

(assert (= (or b!849620 b!849611) bm!37788))

(assert (= (and b!849621 (not res!577225)) b!849623))

(assert (= (and b!849614 condMapEmpty!25784) mapIsEmpty!25784))

(assert (= (and b!849614 (not condMapEmpty!25784)) mapNonEmpty!25784))

(get-info :version)

(assert (= (and mapNonEmpty!25784 ((_ is ValueCellFull!7622) mapValue!25784)) b!849615))

(assert (= (and b!849614 ((_ is ValueCellFull!7622) mapDefault!25784)) b!849624))

(assert (= start!73054 b!849614))

(declare-fun b_lambda!11501 () Bool)

(assert (=> (not b_lambda!11501) (not b!849623)))

(declare-fun t!22911 () Bool)

(declare-fun tb!4281 () Bool)

(assert (=> (and start!73054 (= defaultEntry!696 defaultEntry!696) t!22911) tb!4281))

(declare-fun result!8181 () Bool)

(assert (=> tb!4281 (= result!8181 tp_is_empty!16123)))

(assert (=> b!849623 t!22911))

(declare-fun b_and!23109 () Bool)

(assert (= b_and!23107 (and (=> t!22911 result!8181) b_and!23109)))

(declare-fun m!789767 () Bool)

(assert (=> b!849610 m!789767))

(declare-fun m!789769 () Bool)

(assert (=> b!849613 m!789769))

(declare-fun m!789771 () Bool)

(assert (=> b!849622 m!789771))

(declare-fun m!789773 () Bool)

(assert (=> b!849622 m!789773))

(declare-fun m!789775 () Bool)

(assert (=> b!849622 m!789775))

(declare-fun m!789777 () Bool)

(assert (=> b!849620 m!789777))

(declare-fun m!789779 () Bool)

(assert (=> b!849612 m!789779))

(declare-fun m!789781 () Bool)

(assert (=> b!849621 m!789781))

(assert (=> b!849621 m!789781))

(declare-fun m!789783 () Bool)

(assert (=> b!849621 m!789783))

(declare-fun m!789785 () Bool)

(assert (=> b!849621 m!789785))

(declare-fun m!789787 () Bool)

(assert (=> b!849619 m!789787))

(declare-fun m!789789 () Bool)

(assert (=> b!849616 m!789789))

(declare-fun m!789791 () Bool)

(assert (=> bm!37788 m!789791))

(declare-fun m!789793 () Bool)

(assert (=> mapNonEmpty!25784 m!789793))

(declare-fun m!789795 () Bool)

(assert (=> bm!37787 m!789795))

(declare-fun m!789797 () Bool)

(assert (=> b!849623 m!789797))

(declare-fun m!789799 () Bool)

(assert (=> b!849623 m!789799))

(declare-fun m!789801 () Bool)

(assert (=> b!849623 m!789801))

(declare-fun m!789803 () Bool)

(assert (=> b!849623 m!789803))

(assert (=> b!849623 m!789797))

(declare-fun m!789805 () Bool)

(assert (=> b!849623 m!789805))

(assert (=> b!849623 m!789801))

(declare-fun m!789807 () Bool)

(assert (=> b!849623 m!789807))

(assert (=> b!849623 m!789781))

(declare-fun m!789809 () Bool)

(assert (=> b!849623 m!789809))

(declare-fun m!789811 () Bool)

(assert (=> b!849623 m!789811))

(assert (=> b!849623 m!789803))

(declare-fun m!789813 () Bool)

(assert (=> b!849623 m!789813))

(assert (=> b!849623 m!789795))

(declare-fun m!789815 () Bool)

(assert (=> b!849623 m!789815))

(assert (=> b!849623 m!789773))

(declare-fun m!789817 () Bool)

(assert (=> start!73054 m!789817))

(declare-fun m!789819 () Bool)

(assert (=> start!73054 m!789819))

(check-sat (not b_lambda!11501) (not bm!37788) (not b!849622) (not mapNonEmpty!25784) (not b!849623) (not b!849621) b_and!23109 (not b!849610) tp_is_empty!16123 (not b!849613) (not b!849620) (not start!73054) (not b_next!13987) (not b!849619) (not bm!37787) (not b!849612))
(check-sat b_and!23109 (not b_next!13987))
