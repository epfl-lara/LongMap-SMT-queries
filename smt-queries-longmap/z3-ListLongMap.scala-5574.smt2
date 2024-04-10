; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73230 () Bool)

(assert start!73230)

(declare-fun b_free!14145 () Bool)

(declare-fun b_next!14145 () Bool)

(assert (=> start!73230 (= b_free!14145 (not b_next!14145))))

(declare-fun tp!49938 () Bool)

(declare-fun b_and!23449 () Bool)

(assert (=> start!73230 (= tp!49938 b_and!23449)))

(declare-fun b!853562 () Bool)

(declare-fun res!579701 () Bool)

(declare-fun e!476004 () Bool)

(assert (=> b!853562 (=> (not res!579701) (not e!476004))))

(declare-datatypes ((array!48760 0))(
  ( (array!48761 (arr!23411 (Array (_ BitVec 32) (_ BitVec 64))) (size!23851 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48760)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48760 (_ BitVec 32)) Bool)

(assert (=> b!853562 (= res!579701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((V!26755 0))(
  ( (V!26756 (val!8188 Int)) )
))
(declare-fun minValue!654 () V!26755)

(declare-fun zeroValue!654 () V!26755)

(declare-fun bm!38287 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10766 0))(
  ( (tuple2!10767 (_1!5394 (_ BitVec 64)) (_2!5394 V!26755)) )
))
(declare-datatypes ((List!16590 0))(
  ( (Nil!16587) (Cons!16586 (h!17717 tuple2!10766) (t!23181 List!16590)) )
))
(declare-datatypes ((ListLongMap!9535 0))(
  ( (ListLongMap!9536 (toList!4783 List!16590)) )
))
(declare-fun call!38290 () ListLongMap!9535)

(declare-datatypes ((ValueCell!7701 0))(
  ( (ValueCellFull!7701 (v!10613 V!26755)) (EmptyCell!7701) )
))
(declare-datatypes ((array!48762 0))(
  ( (array!48763 (arr!23412 (Array (_ BitVec 32) ValueCell!7701)) (size!23852 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48762)

(declare-fun getCurrentListMapNoExtraKeys!2764 (array!48760 array!48762 (_ BitVec 32) (_ BitVec 32) V!26755 V!26755 (_ BitVec 32) Int) ListLongMap!9535)

(assert (=> bm!38287 (= call!38290 (getCurrentListMapNoExtraKeys!2764 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853563 () Bool)

(declare-fun res!579706 () Bool)

(assert (=> b!853563 (=> (not res!579706) (not e!476004))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!853563 (= res!579706 (and (= (select (arr!23411 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853565 () Bool)

(declare-fun e!476002 () Bool)

(declare-fun tp_is_empty!16281 () Bool)

(assert (=> b!853565 (= e!476002 tp_is_empty!16281)))

(declare-fun mapNonEmpty!26021 () Bool)

(declare-fun mapRes!26021 () Bool)

(declare-fun tp!49939 () Bool)

(declare-fun e!476005 () Bool)

(assert (=> mapNonEmpty!26021 (= mapRes!26021 (and tp!49939 e!476005))))

(declare-fun mapKey!26021 () (_ BitVec 32))

(declare-fun mapValue!26021 () ValueCell!7701)

(declare-fun mapRest!26021 () (Array (_ BitVec 32) ValueCell!7701))

(assert (=> mapNonEmpty!26021 (= (arr!23412 _values!688) (store mapRest!26021 mapKey!26021 mapValue!26021))))

(declare-fun b!853566 () Bool)

(assert (=> b!853566 (= e!476005 tp_is_empty!16281)))

(declare-fun b!853567 () Bool)

(declare-fun e!476007 () Bool)

(declare-fun call!38291 () ListLongMap!9535)

(assert (=> b!853567 (= e!476007 (= call!38291 call!38290))))

(declare-fun b!853568 () Bool)

(declare-fun res!579700 () Bool)

(assert (=> b!853568 (=> (not res!579700) (not e!476004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853568 (= res!579700 (validKeyInArray!0 k0!854))))

(declare-fun b!853569 () Bool)

(declare-fun e!476003 () Bool)

(assert (=> b!853569 (= e!476004 e!476003)))

(declare-fun res!579705 () Bool)

(assert (=> b!853569 (=> (not res!579705) (not e!476003))))

(assert (=> b!853569 (= res!579705 (= from!1053 i!612))))

(declare-fun lt!384822 () ListLongMap!9535)

(declare-fun lt!384814 () array!48762)

(assert (=> b!853569 (= lt!384822 (getCurrentListMapNoExtraKeys!2764 _keys!868 lt!384814 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26755)

(assert (=> b!853569 (= lt!384814 (array!48763 (store (arr!23412 _values!688) i!612 (ValueCellFull!7701 v!557)) (size!23852 _values!688)))))

(declare-fun lt!384823 () ListLongMap!9535)

(assert (=> b!853569 (= lt!384823 (getCurrentListMapNoExtraKeys!2764 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853570 () Bool)

(declare-fun +!2175 (ListLongMap!9535 tuple2!10766) ListLongMap!9535)

(assert (=> b!853570 (= e!476007 (= call!38291 (+!2175 call!38290 (tuple2!10767 k0!854 v!557))))))

(declare-fun b!853571 () Bool)

(declare-fun res!579698 () Bool)

(assert (=> b!853571 (=> (not res!579698) (not e!476004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853571 (= res!579698 (validMask!0 mask!1196))))

(declare-fun b!853572 () Bool)

(declare-fun res!579702 () Bool)

(assert (=> b!853572 (=> (not res!579702) (not e!476004))))

(declare-datatypes ((List!16591 0))(
  ( (Nil!16588) (Cons!16587 (h!17718 (_ BitVec 64)) (t!23182 List!16591)) )
))
(declare-fun arrayNoDuplicates!0 (array!48760 (_ BitVec 32) List!16591) Bool)

(assert (=> b!853572 (= res!579702 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16588))))

(declare-fun b!853564 () Bool)

(declare-fun e!476001 () Bool)

(assert (=> b!853564 (= e!476003 (not e!476001))))

(declare-fun res!579707 () Bool)

(assert (=> b!853564 (=> res!579707 e!476001)))

(assert (=> b!853564 (= res!579707 (not (validKeyInArray!0 (select (arr!23411 _keys!868) from!1053))))))

(assert (=> b!853564 e!476007))

(declare-fun c!91888 () Bool)

(assert (=> b!853564 (= c!91888 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29133 0))(
  ( (Unit!29134) )
))
(declare-fun lt!384817 () Unit!29133)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!400 (array!48760 array!48762 (_ BitVec 32) (_ BitVec 32) V!26755 V!26755 (_ BitVec 32) (_ BitVec 64) V!26755 (_ BitVec 32) Int) Unit!29133)

(assert (=> b!853564 (= lt!384817 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!400 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!579699 () Bool)

(assert (=> start!73230 (=> (not res!579699) (not e!476004))))

(assert (=> start!73230 (= res!579699 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23851 _keys!868))))))

(assert (=> start!73230 e!476004))

(assert (=> start!73230 tp_is_empty!16281))

(assert (=> start!73230 true))

(assert (=> start!73230 tp!49938))

(declare-fun array_inv!18562 (array!48760) Bool)

(assert (=> start!73230 (array_inv!18562 _keys!868)))

(declare-fun e!476006 () Bool)

(declare-fun array_inv!18563 (array!48762) Bool)

(assert (=> start!73230 (and (array_inv!18563 _values!688) e!476006)))

(declare-fun b!853573 () Bool)

(declare-fun res!579704 () Bool)

(assert (=> b!853573 (=> (not res!579704) (not e!476004))))

(assert (=> b!853573 (= res!579704 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23851 _keys!868))))))

(declare-fun b!853574 () Bool)

(declare-fun res!579703 () Bool)

(assert (=> b!853574 (=> (not res!579703) (not e!476004))))

(assert (=> b!853574 (= res!579703 (and (= (size!23852 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23851 _keys!868) (size!23852 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38288 () Bool)

(assert (=> bm!38288 (= call!38291 (getCurrentListMapNoExtraKeys!2764 _keys!868 lt!384814 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853575 () Bool)

(assert (=> b!853575 (= e!476006 (and e!476002 mapRes!26021))))

(declare-fun condMapEmpty!26021 () Bool)

(declare-fun mapDefault!26021 () ValueCell!7701)

(assert (=> b!853575 (= condMapEmpty!26021 (= (arr!23412 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7701)) mapDefault!26021)))))

(declare-fun b!853576 () Bool)

(assert (=> b!853576 (= e!476001 true)))

(declare-fun lt!384818 () ListLongMap!9535)

(declare-fun lt!384819 () tuple2!10766)

(declare-fun lt!384821 () V!26755)

(assert (=> b!853576 (= (+!2175 lt!384818 lt!384819) (+!2175 (+!2175 lt!384818 (tuple2!10767 k0!854 lt!384821)) lt!384819))))

(declare-fun lt!384820 () V!26755)

(assert (=> b!853576 (= lt!384819 (tuple2!10767 k0!854 lt!384820))))

(declare-fun lt!384815 () Unit!29133)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!302 (ListLongMap!9535 (_ BitVec 64) V!26755 V!26755) Unit!29133)

(assert (=> b!853576 (= lt!384815 (addSameAsAddTwiceSameKeyDiffValues!302 lt!384818 k0!854 lt!384821 lt!384820))))

(declare-fun lt!384816 () V!26755)

(declare-fun get!12348 (ValueCell!7701 V!26755) V!26755)

(assert (=> b!853576 (= lt!384821 (get!12348 (select (arr!23412 _values!688) from!1053) lt!384816))))

(assert (=> b!853576 (= lt!384822 (+!2175 lt!384818 (tuple2!10767 (select (arr!23411 _keys!868) from!1053) lt!384820)))))

(assert (=> b!853576 (= lt!384820 (get!12348 (select (store (arr!23412 _values!688) i!612 (ValueCellFull!7701 v!557)) from!1053) lt!384816))))

(declare-fun dynLambda!1056 (Int (_ BitVec 64)) V!26755)

(assert (=> b!853576 (= lt!384816 (dynLambda!1056 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853576 (= lt!384818 (getCurrentListMapNoExtraKeys!2764 _keys!868 lt!384814 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26021 () Bool)

(assert (=> mapIsEmpty!26021 mapRes!26021))

(assert (= (and start!73230 res!579699) b!853571))

(assert (= (and b!853571 res!579698) b!853574))

(assert (= (and b!853574 res!579703) b!853562))

(assert (= (and b!853562 res!579701) b!853572))

(assert (= (and b!853572 res!579702) b!853573))

(assert (= (and b!853573 res!579704) b!853568))

(assert (= (and b!853568 res!579700) b!853563))

(assert (= (and b!853563 res!579706) b!853569))

(assert (= (and b!853569 res!579705) b!853564))

(assert (= (and b!853564 c!91888) b!853570))

(assert (= (and b!853564 (not c!91888)) b!853567))

(assert (= (or b!853570 b!853567) bm!38288))

(assert (= (or b!853570 b!853567) bm!38287))

(assert (= (and b!853564 (not res!579707)) b!853576))

(assert (= (and b!853575 condMapEmpty!26021) mapIsEmpty!26021))

(assert (= (and b!853575 (not condMapEmpty!26021)) mapNonEmpty!26021))

(get-info :version)

(assert (= (and mapNonEmpty!26021 ((_ is ValueCellFull!7701) mapValue!26021)) b!853566))

(assert (= (and b!853575 ((_ is ValueCellFull!7701) mapDefault!26021)) b!853565))

(assert (= start!73230 b!853575))

(declare-fun b_lambda!11677 () Bool)

(assert (=> (not b_lambda!11677) (not b!853576)))

(declare-fun t!23180 () Bool)

(declare-fun tb!4447 () Bool)

(assert (=> (and start!73230 (= defaultEntry!696 defaultEntry!696) t!23180) tb!4447))

(declare-fun result!8505 () Bool)

(assert (=> tb!4447 (= result!8505 tp_is_empty!16281)))

(assert (=> b!853576 t!23180))

(declare-fun b_and!23451 () Bool)

(assert (= b_and!23449 (and (=> t!23180 result!8505) b_and!23451)))

(declare-fun m!794793 () Bool)

(assert (=> b!853568 m!794793))

(declare-fun m!794795 () Bool)

(assert (=> bm!38288 m!794795))

(declare-fun m!794797 () Bool)

(assert (=> b!853562 m!794797))

(declare-fun m!794799 () Bool)

(assert (=> b!853564 m!794799))

(assert (=> b!853564 m!794799))

(declare-fun m!794801 () Bool)

(assert (=> b!853564 m!794801))

(declare-fun m!794803 () Bool)

(assert (=> b!853564 m!794803))

(declare-fun m!794805 () Bool)

(assert (=> b!853563 m!794805))

(declare-fun m!794807 () Bool)

(assert (=> bm!38287 m!794807))

(declare-fun m!794809 () Bool)

(assert (=> start!73230 m!794809))

(declare-fun m!794811 () Bool)

(assert (=> start!73230 m!794811))

(declare-fun m!794813 () Bool)

(assert (=> b!853571 m!794813))

(declare-fun m!794815 () Bool)

(assert (=> b!853576 m!794815))

(declare-fun m!794817 () Bool)

(assert (=> b!853576 m!794817))

(declare-fun m!794819 () Bool)

(assert (=> b!853576 m!794819))

(declare-fun m!794821 () Bool)

(assert (=> b!853576 m!794821))

(declare-fun m!794823 () Bool)

(assert (=> b!853576 m!794823))

(assert (=> b!853576 m!794795))

(declare-fun m!794825 () Bool)

(assert (=> b!853576 m!794825))

(declare-fun m!794827 () Bool)

(assert (=> b!853576 m!794827))

(assert (=> b!853576 m!794825))

(declare-fun m!794829 () Bool)

(assert (=> b!853576 m!794829))

(declare-fun m!794831 () Bool)

(assert (=> b!853576 m!794831))

(assert (=> b!853576 m!794821))

(declare-fun m!794833 () Bool)

(assert (=> b!853576 m!794833))

(assert (=> b!853576 m!794799))

(declare-fun m!794835 () Bool)

(assert (=> b!853576 m!794835))

(assert (=> b!853576 m!794815))

(declare-fun m!794837 () Bool)

(assert (=> mapNonEmpty!26021 m!794837))

(declare-fun m!794839 () Bool)

(assert (=> b!853572 m!794839))

(declare-fun m!794841 () Bool)

(assert (=> b!853570 m!794841))

(declare-fun m!794843 () Bool)

(assert (=> b!853569 m!794843))

(assert (=> b!853569 m!794827))

(declare-fun m!794845 () Bool)

(assert (=> b!853569 m!794845))

(check-sat (not b_next!14145) tp_is_empty!16281 (not mapNonEmpty!26021) (not b!853562) (not bm!38287) (not bm!38288) (not b!853569) (not b_lambda!11677) (not b!853564) (not start!73230) (not b!853572) b_and!23451 (not b!853568) (not b!853570) (not b!853571) (not b!853576))
(check-sat b_and!23451 (not b_next!14145))
