; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73378 () Bool)

(assert start!73378)

(declare-fun b_free!14125 () Bool)

(declare-fun b_next!14125 () Bool)

(assert (=> start!73378 (= b_free!14125 (not b_next!14125))))

(declare-fun tp!49879 () Bool)

(declare-fun b_and!23419 () Bool)

(assert (=> start!73378 (= tp!49879 b_and!23419)))

(declare-fun b!853995 () Bool)

(declare-fun e!476347 () Bool)

(declare-datatypes ((V!26729 0))(
  ( (V!26730 (val!8178 Int)) )
))
(declare-datatypes ((tuple2!10672 0))(
  ( (tuple2!10673 (_1!5347 (_ BitVec 64)) (_2!5347 V!26729)) )
))
(declare-datatypes ((List!16523 0))(
  ( (Nil!16520) (Cons!16519 (h!17656 tuple2!10672) (t!23086 List!16523)) )
))
(declare-datatypes ((ListLongMap!9443 0))(
  ( (ListLongMap!9444 (toList!4737 List!16523)) )
))
(declare-fun call!38275 () ListLongMap!9443)

(declare-fun call!38276 () ListLongMap!9443)

(assert (=> b!853995 (= e!476347 (= call!38275 call!38276))))

(declare-fun b!853996 () Bool)

(declare-fun res!579744 () Bool)

(declare-fun e!476344 () Bool)

(assert (=> b!853996 (=> (not res!579744) (not e!476344))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48769 0))(
  ( (array!48770 (arr!23411 (Array (_ BitVec 32) (_ BitVec 64))) (size!23852 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48769)

(assert (=> b!853996 (= res!579744 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23852 _keys!868))))))

(declare-fun b!853997 () Bool)

(declare-fun e!476345 () Bool)

(declare-fun tp_is_empty!16261 () Bool)

(assert (=> b!853997 (= e!476345 tp_is_empty!16261)))

(declare-fun b!853998 () Bool)

(declare-fun e!476349 () Bool)

(assert (=> b!853998 (= e!476344 e!476349)))

(declare-fun res!579751 () Bool)

(assert (=> b!853998 (=> (not res!579751) (not e!476349))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!853998 (= res!579751 (= from!1053 i!612))))

(declare-fun lt!384880 () ListLongMap!9443)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7691 0))(
  ( (ValueCellFull!7691 (v!10603 V!26729)) (EmptyCell!7691) )
))
(declare-datatypes ((array!48771 0))(
  ( (array!48772 (arr!23412 (Array (_ BitVec 32) ValueCell!7691)) (size!23853 (_ BitVec 32))) )
))
(declare-fun lt!384876 () array!48771)

(declare-fun minValue!654 () V!26729)

(declare-fun zeroValue!654 () V!26729)

(declare-fun getCurrentListMapNoExtraKeys!2794 (array!48769 array!48771 (_ BitVec 32) (_ BitVec 32) V!26729 V!26729 (_ BitVec 32) Int) ListLongMap!9443)

(assert (=> b!853998 (= lt!384880 (getCurrentListMapNoExtraKeys!2794 _keys!868 lt!384876 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26729)

(declare-fun _values!688 () array!48771)

(assert (=> b!853998 (= lt!384876 (array!48772 (store (arr!23412 _values!688) i!612 (ValueCellFull!7691 v!557)) (size!23853 _values!688)))))

(declare-fun lt!384875 () ListLongMap!9443)

(assert (=> b!853998 (= lt!384875 (getCurrentListMapNoExtraKeys!2794 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun bm!38272 () Bool)

(assert (=> bm!38272 (= call!38275 (getCurrentListMapNoExtraKeys!2794 _keys!868 lt!384876 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853999 () Bool)

(declare-fun res!579745 () Bool)

(assert (=> b!853999 (=> (not res!579745) (not e!476344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48769 (_ BitVec 32)) Bool)

(assert (=> b!853999 (= res!579745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854000 () Bool)

(declare-fun res!579748 () Bool)

(assert (=> b!854000 (=> (not res!579748) (not e!476344))))

(assert (=> b!854000 (= res!579748 (and (= (size!23853 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23852 _keys!868) (size!23853 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!854001 () Bool)

(declare-fun +!2182 (ListLongMap!9443 tuple2!10672) ListLongMap!9443)

(assert (=> b!854001 (= e!476347 (= call!38275 (+!2182 call!38276 (tuple2!10673 k0!854 v!557))))))

(declare-fun b!854002 () Bool)

(declare-fun e!476350 () Bool)

(declare-fun mapRes!25991 () Bool)

(assert (=> b!854002 (= e!476350 (and e!476345 mapRes!25991))))

(declare-fun condMapEmpty!25991 () Bool)

(declare-fun mapDefault!25991 () ValueCell!7691)

(assert (=> b!854002 (= condMapEmpty!25991 (= (arr!23412 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7691)) mapDefault!25991)))))

(declare-fun b!854003 () Bool)

(declare-fun e!476348 () Bool)

(assert (=> b!854003 (= e!476349 (not e!476348))))

(declare-fun res!579747 () Bool)

(assert (=> b!854003 (=> res!579747 e!476348)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854003 (= res!579747 (not (validKeyInArray!0 (select (arr!23411 _keys!868) from!1053))))))

(assert (=> b!854003 e!476347))

(declare-fun c!92140 () Bool)

(assert (=> b!854003 (= c!92140 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29124 0))(
  ( (Unit!29125) )
))
(declare-fun lt!384881 () Unit!29124)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!387 (array!48769 array!48771 (_ BitVec 32) (_ BitVec 32) V!26729 V!26729 (_ BitVec 32) (_ BitVec 64) V!26729 (_ BitVec 32) Int) Unit!29124)

(assert (=> b!854003 (= lt!384881 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!387 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854004 () Bool)

(declare-fun res!579746 () Bool)

(assert (=> b!854004 (=> (not res!579746) (not e!476344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854004 (= res!579746 (validMask!0 mask!1196))))

(declare-fun b!854005 () Bool)

(declare-fun e!476343 () Bool)

(assert (=> b!854005 (= e!476343 tp_is_empty!16261)))

(declare-fun bm!38273 () Bool)

(assert (=> bm!38273 (= call!38276 (getCurrentListMapNoExtraKeys!2794 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854006 () Bool)

(declare-fun res!579750 () Bool)

(assert (=> b!854006 (=> (not res!579750) (not e!476344))))

(assert (=> b!854006 (= res!579750 (and (= (select (arr!23411 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854007 () Bool)

(assert (=> b!854007 (= e!476348 true)))

(declare-fun lt!384883 () tuple2!10672)

(declare-fun lt!384879 () ListLongMap!9443)

(declare-fun lt!384884 () V!26729)

(assert (=> b!854007 (= (+!2182 lt!384879 lt!384883) (+!2182 (+!2182 lt!384879 (tuple2!10673 k0!854 lt!384884)) lt!384883))))

(declare-fun lt!384878 () V!26729)

(assert (=> b!854007 (= lt!384883 (tuple2!10673 k0!854 lt!384878))))

(declare-fun lt!384877 () Unit!29124)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!308 (ListLongMap!9443 (_ BitVec 64) V!26729 V!26729) Unit!29124)

(assert (=> b!854007 (= lt!384877 (addSameAsAddTwiceSameKeyDiffValues!308 lt!384879 k0!854 lt!384884 lt!384878))))

(declare-fun lt!384882 () V!26729)

(declare-fun get!12347 (ValueCell!7691 V!26729) V!26729)

(assert (=> b!854007 (= lt!384884 (get!12347 (select (arr!23412 _values!688) from!1053) lt!384882))))

(assert (=> b!854007 (= lt!384880 (+!2182 lt!384879 (tuple2!10673 (select (arr!23411 _keys!868) from!1053) lt!384878)))))

(assert (=> b!854007 (= lt!384878 (get!12347 (select (store (arr!23412 _values!688) i!612 (ValueCellFull!7691 v!557)) from!1053) lt!384882))))

(declare-fun dynLambda!1055 (Int (_ BitVec 64)) V!26729)

(assert (=> b!854007 (= lt!384882 (dynLambda!1055 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854007 (= lt!384879 (getCurrentListMapNoExtraKeys!2794 _keys!868 lt!384876 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854008 () Bool)

(declare-fun res!579749 () Bool)

(assert (=> b!854008 (=> (not res!579749) (not e!476344))))

(assert (=> b!854008 (= res!579749 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25991 () Bool)

(assert (=> mapIsEmpty!25991 mapRes!25991))

(declare-fun b!854009 () Bool)

(declare-fun res!579742 () Bool)

(assert (=> b!854009 (=> (not res!579742) (not e!476344))))

(declare-datatypes ((List!16524 0))(
  ( (Nil!16521) (Cons!16520 (h!17657 (_ BitVec 64)) (t!23087 List!16524)) )
))
(declare-fun arrayNoDuplicates!0 (array!48769 (_ BitVec 32) List!16524) Bool)

(assert (=> b!854009 (= res!579742 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16521))))

(declare-fun mapNonEmpty!25991 () Bool)

(declare-fun tp!49880 () Bool)

(assert (=> mapNonEmpty!25991 (= mapRes!25991 (and tp!49880 e!476343))))

(declare-fun mapValue!25991 () ValueCell!7691)

(declare-fun mapRest!25991 () (Array (_ BitVec 32) ValueCell!7691))

(declare-fun mapKey!25991 () (_ BitVec 32))

(assert (=> mapNonEmpty!25991 (= (arr!23412 _values!688) (store mapRest!25991 mapKey!25991 mapValue!25991))))

(declare-fun res!579743 () Bool)

(assert (=> start!73378 (=> (not res!579743) (not e!476344))))

(assert (=> start!73378 (= res!579743 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23852 _keys!868))))))

(assert (=> start!73378 e!476344))

(assert (=> start!73378 tp_is_empty!16261))

(assert (=> start!73378 true))

(assert (=> start!73378 tp!49879))

(declare-fun array_inv!18616 (array!48769) Bool)

(assert (=> start!73378 (array_inv!18616 _keys!868)))

(declare-fun array_inv!18617 (array!48771) Bool)

(assert (=> start!73378 (and (array_inv!18617 _values!688) e!476350)))

(assert (= (and start!73378 res!579743) b!854004))

(assert (= (and b!854004 res!579746) b!854000))

(assert (= (and b!854000 res!579748) b!853999))

(assert (= (and b!853999 res!579745) b!854009))

(assert (= (and b!854009 res!579742) b!853996))

(assert (= (and b!853996 res!579744) b!854008))

(assert (= (and b!854008 res!579749) b!854006))

(assert (= (and b!854006 res!579750) b!853998))

(assert (= (and b!853998 res!579751) b!854003))

(assert (= (and b!854003 c!92140) b!854001))

(assert (= (and b!854003 (not c!92140)) b!853995))

(assert (= (or b!854001 b!853995) bm!38272))

(assert (= (or b!854001 b!853995) bm!38273))

(assert (= (and b!854003 (not res!579747)) b!854007))

(assert (= (and b!854002 condMapEmpty!25991) mapIsEmpty!25991))

(assert (= (and b!854002 (not condMapEmpty!25991)) mapNonEmpty!25991))

(get-info :version)

(assert (= (and mapNonEmpty!25991 ((_ is ValueCellFull!7691) mapValue!25991)) b!854005))

(assert (= (and b!854002 ((_ is ValueCellFull!7691) mapDefault!25991)) b!853997))

(assert (= start!73378 b!854002))

(declare-fun b_lambda!11671 () Bool)

(assert (=> (not b_lambda!11671) (not b!854007)))

(declare-fun t!23085 () Bool)

(declare-fun tb!4419 () Bool)

(assert (=> (and start!73378 (= defaultEntry!696 defaultEntry!696) t!23085) tb!4419))

(declare-fun result!8457 () Bool)

(assert (=> tb!4419 (= result!8457 tp_is_empty!16261)))

(assert (=> b!854007 t!23085))

(declare-fun b_and!23421 () Bool)

(assert (= b_and!23419 (and (=> t!23085 result!8457) b_and!23421)))

(declare-fun m!795541 () Bool)

(assert (=> b!853998 m!795541))

(declare-fun m!795543 () Bool)

(assert (=> b!853998 m!795543))

(declare-fun m!795545 () Bool)

(assert (=> b!853998 m!795545))

(declare-fun m!795547 () Bool)

(assert (=> b!854003 m!795547))

(assert (=> b!854003 m!795547))

(declare-fun m!795549 () Bool)

(assert (=> b!854003 m!795549))

(declare-fun m!795551 () Bool)

(assert (=> b!854003 m!795551))

(declare-fun m!795553 () Bool)

(assert (=> b!854007 m!795553))

(declare-fun m!795555 () Bool)

(assert (=> b!854007 m!795555))

(declare-fun m!795557 () Bool)

(assert (=> b!854007 m!795557))

(declare-fun m!795559 () Bool)

(assert (=> b!854007 m!795559))

(declare-fun m!795561 () Bool)

(assert (=> b!854007 m!795561))

(declare-fun m!795563 () Bool)

(assert (=> b!854007 m!795563))

(declare-fun m!795565 () Bool)

(assert (=> b!854007 m!795565))

(assert (=> b!854007 m!795565))

(declare-fun m!795567 () Bool)

(assert (=> b!854007 m!795567))

(assert (=> b!854007 m!795547))

(declare-fun m!795569 () Bool)

(assert (=> b!854007 m!795569))

(assert (=> b!854007 m!795555))

(declare-fun m!795571 () Bool)

(assert (=> b!854007 m!795571))

(assert (=> b!854007 m!795563))

(declare-fun m!795573 () Bool)

(assert (=> b!854007 m!795573))

(assert (=> b!854007 m!795543))

(declare-fun m!795575 () Bool)

(assert (=> b!854008 m!795575))

(declare-fun m!795577 () Bool)

(assert (=> bm!38273 m!795577))

(declare-fun m!795579 () Bool)

(assert (=> b!854001 m!795579))

(assert (=> bm!38272 m!795553))

(declare-fun m!795581 () Bool)

(assert (=> b!854006 m!795581))

(declare-fun m!795583 () Bool)

(assert (=> b!854009 m!795583))

(declare-fun m!795585 () Bool)

(assert (=> b!853999 m!795585))

(declare-fun m!795587 () Bool)

(assert (=> start!73378 m!795587))

(declare-fun m!795589 () Bool)

(assert (=> start!73378 m!795589))

(declare-fun m!795591 () Bool)

(assert (=> b!854004 m!795591))

(declare-fun m!795593 () Bool)

(assert (=> mapNonEmpty!25991 m!795593))

(check-sat (not b_lambda!11671) tp_is_empty!16261 (not b!854007) (not b!854004) (not b!854008) (not b!853999) (not bm!38273) (not mapNonEmpty!25991) (not b!854001) (not bm!38272) b_and!23421 (not b!854009) (not b_next!14125) (not start!73378) (not b!854003) (not b!853998))
(check-sat b_and!23421 (not b_next!14125))
