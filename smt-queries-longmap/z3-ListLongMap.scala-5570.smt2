; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73206 () Bool)

(assert start!73206)

(declare-fun b_free!14121 () Bool)

(declare-fun b_next!14121 () Bool)

(assert (=> start!73206 (= b_free!14121 (not b_next!14121))))

(declare-fun tp!49867 () Bool)

(declare-fun b_and!23401 () Bool)

(assert (=> start!73206 (= tp!49867 b_and!23401)))

(declare-fun b!852998 () Bool)

(declare-fun res!579341 () Bool)

(declare-fun e!475717 () Bool)

(assert (=> b!852998 (=> (not res!579341) (not e!475717))))

(declare-datatypes ((array!48712 0))(
  ( (array!48713 (arr!23387 (Array (_ BitVec 32) (_ BitVec 64))) (size!23827 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48712)

(declare-datatypes ((List!16570 0))(
  ( (Nil!16567) (Cons!16566 (h!17697 (_ BitVec 64)) (t!23137 List!16570)) )
))
(declare-fun arrayNoDuplicates!0 (array!48712 (_ BitVec 32) List!16570) Bool)

(assert (=> b!852998 (= res!579341 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16567))))

(declare-fun b!852999 () Bool)

(declare-fun e!475714 () Bool)

(declare-fun tp_is_empty!16257 () Bool)

(assert (=> b!852999 (= e!475714 tp_is_empty!16257)))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38215 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26723 0))(
  ( (V!26724 (val!8176 Int)) )
))
(declare-datatypes ((tuple2!10742 0))(
  ( (tuple2!10743 (_1!5382 (_ BitVec 64)) (_2!5382 V!26723)) )
))
(declare-datatypes ((List!16571 0))(
  ( (Nil!16568) (Cons!16567 (h!17698 tuple2!10742) (t!23138 List!16571)) )
))
(declare-datatypes ((ListLongMap!9511 0))(
  ( (ListLongMap!9512 (toList!4771 List!16571)) )
))
(declare-fun call!38218 () ListLongMap!9511)

(declare-datatypes ((ValueCell!7689 0))(
  ( (ValueCellFull!7689 (v!10601 V!26723)) (EmptyCell!7689) )
))
(declare-datatypes ((array!48714 0))(
  ( (array!48715 (arr!23388 (Array (_ BitVec 32) ValueCell!7689)) (size!23828 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48714)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26723)

(declare-fun zeroValue!654 () V!26723)

(declare-fun getCurrentListMapNoExtraKeys!2752 (array!48712 array!48714 (_ BitVec 32) (_ BitVec 32) V!26723 V!26723 (_ BitVec 32) Int) ListLongMap!9511)

(assert (=> bm!38215 (= call!38218 (getCurrentListMapNoExtraKeys!2752 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853000 () Bool)

(declare-fun e!475720 () Bool)

(declare-fun e!475719 () Bool)

(assert (=> b!853000 (= e!475720 (not e!475719))))

(declare-fun res!579344 () Bool)

(assert (=> b!853000 (=> res!579344 e!475719)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853000 (= res!579344 (not (validKeyInArray!0 (select (arr!23387 _keys!868) from!1053))))))

(declare-fun e!475715 () Bool)

(assert (=> b!853000 e!475715))

(declare-fun c!91852 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853000 (= c!91852 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29115 0))(
  ( (Unit!29116) )
))
(declare-fun lt!384460 () Unit!29115)

(declare-fun v!557 () V!26723)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!394 (array!48712 array!48714 (_ BitVec 32) (_ BitVec 32) V!26723 V!26723 (_ BitVec 32) (_ BitVec 64) V!26723 (_ BitVec 32) Int) Unit!29115)

(assert (=> b!853000 (= lt!384460 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!394 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853001 () Bool)

(declare-fun e!475713 () Bool)

(declare-fun mapRes!25985 () Bool)

(assert (=> b!853001 (= e!475713 (and e!475714 mapRes!25985))))

(declare-fun condMapEmpty!25985 () Bool)

(declare-fun mapDefault!25985 () ValueCell!7689)

(assert (=> b!853001 (= condMapEmpty!25985 (= (arr!23388 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7689)) mapDefault!25985)))))

(declare-fun b!853002 () Bool)

(declare-fun res!579338 () Bool)

(assert (=> b!853002 (=> (not res!579338) (not e!475717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48712 (_ BitVec 32)) Bool)

(assert (=> b!853002 (= res!579338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun call!38219 () ListLongMap!9511)

(declare-fun b!853003 () Bool)

(declare-fun +!2165 (ListLongMap!9511 tuple2!10742) ListLongMap!9511)

(assert (=> b!853003 (= e!475715 (= call!38219 (+!2165 call!38218 (tuple2!10743 k0!854 v!557))))))

(declare-fun b!853004 () Bool)

(declare-fun e!475718 () Bool)

(assert (=> b!853004 (= e!475718 tp_is_empty!16257)))

(declare-fun b!853005 () Bool)

(declare-fun res!579347 () Bool)

(assert (=> b!853005 (=> (not res!579347) (not e!475717))))

(assert (=> b!853005 (= res!579347 (and (= (size!23828 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23827 _keys!868) (size!23828 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!579346 () Bool)

(assert (=> start!73206 (=> (not res!579346) (not e!475717))))

(assert (=> start!73206 (= res!579346 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23827 _keys!868))))))

(assert (=> start!73206 e!475717))

(assert (=> start!73206 tp_is_empty!16257))

(assert (=> start!73206 true))

(assert (=> start!73206 tp!49867))

(declare-fun array_inv!18544 (array!48712) Bool)

(assert (=> start!73206 (array_inv!18544 _keys!868)))

(declare-fun array_inv!18545 (array!48714) Bool)

(assert (=> start!73206 (and (array_inv!18545 _values!688) e!475713)))

(declare-fun b!853006 () Bool)

(declare-fun res!579345 () Bool)

(assert (=> b!853006 (=> (not res!579345) (not e!475717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853006 (= res!579345 (validMask!0 mask!1196))))

(declare-fun b!853007 () Bool)

(assert (=> b!853007 (= e!475717 e!475720)))

(declare-fun res!579339 () Bool)

(assert (=> b!853007 (=> (not res!579339) (not e!475720))))

(assert (=> b!853007 (= res!579339 (= from!1053 i!612))))

(declare-fun lt!384454 () ListLongMap!9511)

(declare-fun lt!384462 () array!48714)

(assert (=> b!853007 (= lt!384454 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!384462 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853007 (= lt!384462 (array!48715 (store (arr!23388 _values!688) i!612 (ValueCellFull!7689 v!557)) (size!23828 _values!688)))))

(declare-fun lt!384463 () ListLongMap!9511)

(assert (=> b!853007 (= lt!384463 (getCurrentListMapNoExtraKeys!2752 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853008 () Bool)

(declare-fun res!579340 () Bool)

(assert (=> b!853008 (=> (not res!579340) (not e!475717))))

(assert (=> b!853008 (= res!579340 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23827 _keys!868))))))

(declare-fun b!853009 () Bool)

(declare-fun res!579342 () Bool)

(assert (=> b!853009 (=> (not res!579342) (not e!475717))))

(assert (=> b!853009 (= res!579342 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25985 () Bool)

(assert (=> mapIsEmpty!25985 mapRes!25985))

(declare-fun mapNonEmpty!25985 () Bool)

(declare-fun tp!49866 () Bool)

(assert (=> mapNonEmpty!25985 (= mapRes!25985 (and tp!49866 e!475718))))

(declare-fun mapRest!25985 () (Array (_ BitVec 32) ValueCell!7689))

(declare-fun mapValue!25985 () ValueCell!7689)

(declare-fun mapKey!25985 () (_ BitVec 32))

(assert (=> mapNonEmpty!25985 (= (arr!23388 _values!688) (store mapRest!25985 mapKey!25985 mapValue!25985))))

(declare-fun b!853010 () Bool)

(assert (=> b!853010 (= e!475715 (= call!38219 call!38218))))

(declare-fun b!853011 () Bool)

(assert (=> b!853011 (= e!475719 true)))

(declare-fun lt!384457 () ListLongMap!9511)

(declare-fun lt!384461 () V!26723)

(declare-fun lt!384459 () tuple2!10742)

(assert (=> b!853011 (= (+!2165 lt!384457 lt!384459) (+!2165 (+!2165 lt!384457 (tuple2!10743 k0!854 lt!384461)) lt!384459))))

(declare-fun lt!384455 () V!26723)

(assert (=> b!853011 (= lt!384459 (tuple2!10743 k0!854 lt!384455))))

(declare-fun lt!384458 () Unit!29115)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!293 (ListLongMap!9511 (_ BitVec 64) V!26723 V!26723) Unit!29115)

(assert (=> b!853011 (= lt!384458 (addSameAsAddTwiceSameKeyDiffValues!293 lt!384457 k0!854 lt!384461 lt!384455))))

(declare-fun lt!384456 () V!26723)

(declare-fun get!12331 (ValueCell!7689 V!26723) V!26723)

(assert (=> b!853011 (= lt!384461 (get!12331 (select (arr!23388 _values!688) from!1053) lt!384456))))

(assert (=> b!853011 (= lt!384454 (+!2165 lt!384457 (tuple2!10743 (select (arr!23387 _keys!868) from!1053) lt!384455)))))

(assert (=> b!853011 (= lt!384455 (get!12331 (select (store (arr!23388 _values!688) i!612 (ValueCellFull!7689 v!557)) from!1053) lt!384456))))

(declare-fun dynLambda!1047 (Int (_ BitVec 64)) V!26723)

(assert (=> b!853011 (= lt!384456 (dynLambda!1047 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853011 (= lt!384457 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!384462 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853012 () Bool)

(declare-fun res!579343 () Bool)

(assert (=> b!853012 (=> (not res!579343) (not e!475717))))

(assert (=> b!853012 (= res!579343 (and (= (select (arr!23387 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!38216 () Bool)

(assert (=> bm!38216 (= call!38219 (getCurrentListMapNoExtraKeys!2752 _keys!868 lt!384462 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73206 res!579346) b!853006))

(assert (= (and b!853006 res!579345) b!853005))

(assert (= (and b!853005 res!579347) b!853002))

(assert (= (and b!853002 res!579338) b!852998))

(assert (= (and b!852998 res!579341) b!853008))

(assert (= (and b!853008 res!579340) b!853009))

(assert (= (and b!853009 res!579342) b!853012))

(assert (= (and b!853012 res!579343) b!853007))

(assert (= (and b!853007 res!579339) b!853000))

(assert (= (and b!853000 c!91852) b!853003))

(assert (= (and b!853000 (not c!91852)) b!853010))

(assert (= (or b!853003 b!853010) bm!38216))

(assert (= (or b!853003 b!853010) bm!38215))

(assert (= (and b!853000 (not res!579344)) b!853011))

(assert (= (and b!853001 condMapEmpty!25985) mapIsEmpty!25985))

(assert (= (and b!853001 (not condMapEmpty!25985)) mapNonEmpty!25985))

(get-info :version)

(assert (= (and mapNonEmpty!25985 ((_ is ValueCellFull!7689) mapValue!25985)) b!853004))

(assert (= (and b!853001 ((_ is ValueCellFull!7689) mapDefault!25985)) b!852999))

(assert (= start!73206 b!853001))

(declare-fun b_lambda!11653 () Bool)

(assert (=> (not b_lambda!11653) (not b!853011)))

(declare-fun t!23136 () Bool)

(declare-fun tb!4423 () Bool)

(assert (=> (and start!73206 (= defaultEntry!696 defaultEntry!696) t!23136) tb!4423))

(declare-fun result!8457 () Bool)

(assert (=> tb!4423 (= result!8457 tp_is_empty!16257)))

(assert (=> b!853011 t!23136))

(declare-fun b_and!23403 () Bool)

(assert (= b_and!23401 (and (=> t!23136 result!8457) b_and!23403)))

(declare-fun m!794143 () Bool)

(assert (=> b!853012 m!794143))

(declare-fun m!794145 () Bool)

(assert (=> bm!38215 m!794145))

(declare-fun m!794147 () Bool)

(assert (=> b!853003 m!794147))

(declare-fun m!794149 () Bool)

(assert (=> b!853011 m!794149))

(declare-fun m!794151 () Bool)

(assert (=> b!853011 m!794151))

(declare-fun m!794153 () Bool)

(assert (=> b!853011 m!794153))

(declare-fun m!794155 () Bool)

(assert (=> b!853011 m!794155))

(assert (=> b!853011 m!794151))

(declare-fun m!794157 () Bool)

(assert (=> b!853011 m!794157))

(declare-fun m!794159 () Bool)

(assert (=> b!853011 m!794159))

(assert (=> b!853011 m!794155))

(declare-fun m!794161 () Bool)

(assert (=> b!853011 m!794161))

(declare-fun m!794163 () Bool)

(assert (=> b!853011 m!794163))

(declare-fun m!794165 () Bool)

(assert (=> b!853011 m!794165))

(declare-fun m!794167 () Bool)

(assert (=> b!853011 m!794167))

(declare-fun m!794169 () Bool)

(assert (=> b!853011 m!794169))

(assert (=> b!853011 m!794165))

(declare-fun m!794171 () Bool)

(assert (=> b!853011 m!794171))

(declare-fun m!794173 () Bool)

(assert (=> b!853011 m!794173))

(declare-fun m!794175 () Bool)

(assert (=> b!853006 m!794175))

(declare-fun m!794177 () Bool)

(assert (=> b!853009 m!794177))

(assert (=> b!853000 m!794171))

(assert (=> b!853000 m!794171))

(declare-fun m!794179 () Bool)

(assert (=> b!853000 m!794179))

(declare-fun m!794181 () Bool)

(assert (=> b!853000 m!794181))

(declare-fun m!794183 () Bool)

(assert (=> b!853002 m!794183))

(declare-fun m!794185 () Bool)

(assert (=> b!852998 m!794185))

(assert (=> bm!38216 m!794163))

(declare-fun m!794187 () Bool)

(assert (=> start!73206 m!794187))

(declare-fun m!794189 () Bool)

(assert (=> start!73206 m!794189))

(declare-fun m!794191 () Bool)

(assert (=> mapNonEmpty!25985 m!794191))

(declare-fun m!794193 () Bool)

(assert (=> b!853007 m!794193))

(assert (=> b!853007 m!794159))

(declare-fun m!794195 () Bool)

(assert (=> b!853007 m!794195))

(check-sat (not b!853006) (not bm!38215) (not b!853002) (not b!853000) (not mapNonEmpty!25985) (not start!73206) (not b!853011) (not bm!38216) (not b!852998) (not b_next!14121) (not b!853009) (not b!853003) b_and!23403 tp_is_empty!16257 (not b_lambda!11653) (not b!853007))
(check-sat b_and!23403 (not b_next!14121))
