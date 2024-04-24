; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73252 () Bool)

(assert start!73252)

(declare-fun b_free!13999 () Bool)

(declare-fun b_next!13999 () Bool)

(assert (=> start!73252 (= b_free!13999 (not b_next!13999))))

(declare-fun tp!49502 () Bool)

(declare-fun b_and!23167 () Bool)

(assert (=> start!73252 (= tp!49502 b_and!23167)))

(declare-fun b!851034 () Bool)

(declare-fun res!577859 () Bool)

(declare-fun e!474834 () Bool)

(assert (=> b!851034 (=> (not res!577859) (not e!474834))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48525 0))(
  ( (array!48526 (arr!23289 (Array (_ BitVec 32) (_ BitVec 64))) (size!23730 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48525)

(assert (=> b!851034 (= res!577859 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23730 _keys!868))))))

(declare-fun b!851035 () Bool)

(declare-fun e!474833 () Bool)

(declare-fun e!474836 () Bool)

(assert (=> b!851035 (= e!474833 (not e!474836))))

(declare-fun res!577853 () Bool)

(assert (=> b!851035 (=> res!577853 e!474836)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851035 (= res!577853 (not (validKeyInArray!0 (select (arr!23289 _keys!868) from!1053))))))

(declare-fun e!474831 () Bool)

(assert (=> b!851035 e!474831))

(declare-fun c!91951 () Bool)

(assert (=> b!851035 (= c!91951 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29026 0))(
  ( (Unit!29027) )
))
(declare-fun lt!382991 () Unit!29026)

(declare-datatypes ((V!26561 0))(
  ( (V!26562 (val!8115 Int)) )
))
(declare-fun v!557 () V!26561)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7628 0))(
  ( (ValueCellFull!7628 (v!10540 V!26561)) (EmptyCell!7628) )
))
(declare-datatypes ((array!48527 0))(
  ( (array!48528 (arr!23290 (Array (_ BitVec 32) ValueCell!7628)) (size!23731 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48527)

(declare-fun minValue!654 () V!26561)

(declare-fun zeroValue!654 () V!26561)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!348 (array!48525 array!48527 (_ BitVec 32) (_ BitVec 32) V!26561 V!26561 (_ BitVec 32) (_ BitVec 64) V!26561 (_ BitVec 32) Int) Unit!29026)

(assert (=> b!851035 (= lt!382991 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!348 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851036 () Bool)

(declare-fun e!474832 () Bool)

(declare-fun tp_is_empty!16135 () Bool)

(assert (=> b!851036 (= e!474832 tp_is_empty!16135)))

(declare-fun mapIsEmpty!25802 () Bool)

(declare-fun mapRes!25802 () Bool)

(assert (=> mapIsEmpty!25802 mapRes!25802))

(declare-fun mapNonEmpty!25802 () Bool)

(declare-fun tp!49501 () Bool)

(declare-fun e!474837 () Bool)

(assert (=> mapNonEmpty!25802 (= mapRes!25802 (and tp!49501 e!474837))))

(declare-fun mapValue!25802 () ValueCell!7628)

(declare-fun mapRest!25802 () (Array (_ BitVec 32) ValueCell!7628))

(declare-fun mapKey!25802 () (_ BitVec 32))

(assert (=> mapNonEmpty!25802 (= (arr!23290 _values!688) (store mapRest!25802 mapKey!25802 mapValue!25802))))

(declare-fun b!851037 () Bool)

(assert (=> b!851037 (= e!474836 true)))

(declare-fun lt!382989 () V!26561)

(declare-datatypes ((tuple2!10560 0))(
  ( (tuple2!10561 (_1!5291 (_ BitVec 64)) (_2!5291 V!26561)) )
))
(declare-fun lt!382985 () tuple2!10560)

(declare-datatypes ((List!16423 0))(
  ( (Nil!16420) (Cons!16419 (h!17556 tuple2!10560) (t!22860 List!16423)) )
))
(declare-datatypes ((ListLongMap!9331 0))(
  ( (ListLongMap!9332 (toList!4681 List!16423)) )
))
(declare-fun lt!382994 () ListLongMap!9331)

(declare-fun +!2131 (ListLongMap!9331 tuple2!10560) ListLongMap!9331)

(assert (=> b!851037 (= (+!2131 lt!382994 lt!382985) (+!2131 (+!2131 lt!382994 (tuple2!10561 k0!854 lt!382989)) lt!382985))))

(declare-fun lt!382986 () V!26561)

(assert (=> b!851037 (= lt!382985 (tuple2!10561 k0!854 lt!382986))))

(declare-fun lt!382987 () Unit!29026)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!261 (ListLongMap!9331 (_ BitVec 64) V!26561 V!26561) Unit!29026)

(assert (=> b!851037 (= lt!382987 (addSameAsAddTwiceSameKeyDiffValues!261 lt!382994 k0!854 lt!382989 lt!382986))))

(declare-fun lt!382993 () V!26561)

(declare-fun get!12258 (ValueCell!7628 V!26561) V!26561)

(assert (=> b!851037 (= lt!382989 (get!12258 (select (arr!23290 _values!688) from!1053) lt!382993))))

(declare-fun lt!382992 () ListLongMap!9331)

(assert (=> b!851037 (= lt!382992 (+!2131 lt!382994 (tuple2!10561 (select (arr!23289 _keys!868) from!1053) lt!382986)))))

(assert (=> b!851037 (= lt!382986 (get!12258 (select (store (arr!23290 _values!688) i!612 (ValueCellFull!7628 v!557)) from!1053) lt!382993))))

(declare-fun dynLambda!1008 (Int (_ BitVec 64)) V!26561)

(assert (=> b!851037 (= lt!382993 (dynLambda!1008 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382990 () array!48527)

(declare-fun getCurrentListMapNoExtraKeys!2739 (array!48525 array!48527 (_ BitVec 32) (_ BitVec 32) V!26561 V!26561 (_ BitVec 32) Int) ListLongMap!9331)

(assert (=> b!851037 (= lt!382994 (getCurrentListMapNoExtraKeys!2739 _keys!868 lt!382990 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851038 () Bool)

(declare-fun res!577858 () Bool)

(assert (=> b!851038 (=> (not res!577858) (not e!474834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851038 (= res!577858 (validMask!0 mask!1196))))

(declare-fun bm!37894 () Bool)

(declare-fun call!37897 () ListLongMap!9331)

(assert (=> bm!37894 (= call!37897 (getCurrentListMapNoExtraKeys!2739 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851039 () Bool)

(declare-fun res!577861 () Bool)

(assert (=> b!851039 (=> (not res!577861) (not e!474834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48525 (_ BitVec 32)) Bool)

(assert (=> b!851039 (= res!577861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun call!37898 () ListLongMap!9331)

(declare-fun bm!37895 () Bool)

(assert (=> bm!37895 (= call!37898 (getCurrentListMapNoExtraKeys!2739 _keys!868 lt!382990 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851040 () Bool)

(declare-fun e!474835 () Bool)

(assert (=> b!851040 (= e!474835 (and e!474832 mapRes!25802))))

(declare-fun condMapEmpty!25802 () Bool)

(declare-fun mapDefault!25802 () ValueCell!7628)

(assert (=> b!851040 (= condMapEmpty!25802 (= (arr!23290 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7628)) mapDefault!25802)))))

(declare-fun b!851041 () Bool)

(declare-fun res!577856 () Bool)

(assert (=> b!851041 (=> (not res!577856) (not e!474834))))

(assert (=> b!851041 (= res!577856 (and (= (size!23731 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23730 _keys!868) (size!23731 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851042 () Bool)

(declare-fun res!577857 () Bool)

(assert (=> b!851042 (=> (not res!577857) (not e!474834))))

(declare-datatypes ((List!16424 0))(
  ( (Nil!16421) (Cons!16420 (h!17557 (_ BitVec 64)) (t!22861 List!16424)) )
))
(declare-fun arrayNoDuplicates!0 (array!48525 (_ BitVec 32) List!16424) Bool)

(assert (=> b!851042 (= res!577857 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16421))))

(declare-fun b!851043 () Bool)

(assert (=> b!851043 (= e!474837 tp_is_empty!16135)))

(declare-fun res!577852 () Bool)

(assert (=> start!73252 (=> (not res!577852) (not e!474834))))

(assert (=> start!73252 (= res!577852 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23730 _keys!868))))))

(assert (=> start!73252 e!474834))

(assert (=> start!73252 tp_is_empty!16135))

(assert (=> start!73252 true))

(assert (=> start!73252 tp!49502))

(declare-fun array_inv!18534 (array!48525) Bool)

(assert (=> start!73252 (array_inv!18534 _keys!868)))

(declare-fun array_inv!18535 (array!48527) Bool)

(assert (=> start!73252 (and (array_inv!18535 _values!688) e!474835)))

(declare-fun b!851044 () Bool)

(assert (=> b!851044 (= e!474834 e!474833)))

(declare-fun res!577855 () Bool)

(assert (=> b!851044 (=> (not res!577855) (not e!474833))))

(assert (=> b!851044 (= res!577855 (= from!1053 i!612))))

(assert (=> b!851044 (= lt!382992 (getCurrentListMapNoExtraKeys!2739 _keys!868 lt!382990 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851044 (= lt!382990 (array!48528 (store (arr!23290 _values!688) i!612 (ValueCellFull!7628 v!557)) (size!23731 _values!688)))))

(declare-fun lt!382988 () ListLongMap!9331)

(assert (=> b!851044 (= lt!382988 (getCurrentListMapNoExtraKeys!2739 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851045 () Bool)

(assert (=> b!851045 (= e!474831 (= call!37898 call!37897))))

(declare-fun b!851046 () Bool)

(declare-fun res!577854 () Bool)

(assert (=> b!851046 (=> (not res!577854) (not e!474834))))

(assert (=> b!851046 (= res!577854 (and (= (select (arr!23289 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851047 () Bool)

(assert (=> b!851047 (= e!474831 (= call!37898 (+!2131 call!37897 (tuple2!10561 k0!854 v!557))))))

(declare-fun b!851048 () Bool)

(declare-fun res!577860 () Bool)

(assert (=> b!851048 (=> (not res!577860) (not e!474834))))

(assert (=> b!851048 (= res!577860 (validKeyInArray!0 k0!854))))

(assert (= (and start!73252 res!577852) b!851038))

(assert (= (and b!851038 res!577858) b!851041))

(assert (= (and b!851041 res!577856) b!851039))

(assert (= (and b!851039 res!577861) b!851042))

(assert (= (and b!851042 res!577857) b!851034))

(assert (= (and b!851034 res!577859) b!851048))

(assert (= (and b!851048 res!577860) b!851046))

(assert (= (and b!851046 res!577854) b!851044))

(assert (= (and b!851044 res!577855) b!851035))

(assert (= (and b!851035 c!91951) b!851047))

(assert (= (and b!851035 (not c!91951)) b!851045))

(assert (= (or b!851047 b!851045) bm!37895))

(assert (= (or b!851047 b!851045) bm!37894))

(assert (= (and b!851035 (not res!577853)) b!851037))

(assert (= (and b!851040 condMapEmpty!25802) mapIsEmpty!25802))

(assert (= (and b!851040 (not condMapEmpty!25802)) mapNonEmpty!25802))

(get-info :version)

(assert (= (and mapNonEmpty!25802 ((_ is ValueCellFull!7628) mapValue!25802)) b!851043))

(assert (= (and b!851040 ((_ is ValueCellFull!7628) mapDefault!25802)) b!851036))

(assert (= start!73252 b!851040))

(declare-fun b_lambda!11545 () Bool)

(assert (=> (not b_lambda!11545) (not b!851037)))

(declare-fun t!22859 () Bool)

(declare-fun tb!4293 () Bool)

(assert (=> (and start!73252 (= defaultEntry!696 defaultEntry!696) t!22859) tb!4293))

(declare-fun result!8205 () Bool)

(assert (=> tb!4293 (= result!8205 tp_is_empty!16135)))

(assert (=> b!851037 t!22859))

(declare-fun b_and!23169 () Bool)

(assert (= b_and!23167 (and (=> t!22859 result!8205) b_and!23169)))

(declare-fun m!792139 () Bool)

(assert (=> mapNonEmpty!25802 m!792139))

(declare-fun m!792141 () Bool)

(assert (=> b!851046 m!792141))

(declare-fun m!792143 () Bool)

(assert (=> b!851047 m!792143))

(declare-fun m!792145 () Bool)

(assert (=> b!851044 m!792145))

(declare-fun m!792147 () Bool)

(assert (=> b!851044 m!792147))

(declare-fun m!792149 () Bool)

(assert (=> b!851044 m!792149))

(declare-fun m!792151 () Bool)

(assert (=> b!851039 m!792151))

(declare-fun m!792153 () Bool)

(assert (=> b!851038 m!792153))

(declare-fun m!792155 () Bool)

(assert (=> b!851035 m!792155))

(assert (=> b!851035 m!792155))

(declare-fun m!792157 () Bool)

(assert (=> b!851035 m!792157))

(declare-fun m!792159 () Bool)

(assert (=> b!851035 m!792159))

(declare-fun m!792161 () Bool)

(assert (=> bm!37894 m!792161))

(declare-fun m!792163 () Bool)

(assert (=> b!851048 m!792163))

(declare-fun m!792165 () Bool)

(assert (=> start!73252 m!792165))

(declare-fun m!792167 () Bool)

(assert (=> start!73252 m!792167))

(declare-fun m!792169 () Bool)

(assert (=> b!851042 m!792169))

(declare-fun m!792171 () Bool)

(assert (=> bm!37895 m!792171))

(declare-fun m!792173 () Bool)

(assert (=> b!851037 m!792173))

(declare-fun m!792175 () Bool)

(assert (=> b!851037 m!792175))

(declare-fun m!792177 () Bool)

(assert (=> b!851037 m!792177))

(declare-fun m!792179 () Bool)

(assert (=> b!851037 m!792179))

(declare-fun m!792181 () Bool)

(assert (=> b!851037 m!792181))

(assert (=> b!851037 m!792179))

(declare-fun m!792183 () Bool)

(assert (=> b!851037 m!792183))

(assert (=> b!851037 m!792147))

(assert (=> b!851037 m!792155))

(declare-fun m!792185 () Bool)

(assert (=> b!851037 m!792185))

(declare-fun m!792187 () Bool)

(assert (=> b!851037 m!792187))

(declare-fun m!792189 () Bool)

(assert (=> b!851037 m!792189))

(assert (=> b!851037 m!792171))

(assert (=> b!851037 m!792189))

(declare-fun m!792191 () Bool)

(assert (=> b!851037 m!792191))

(assert (=> b!851037 m!792175))

(check-sat tp_is_empty!16135 (not bm!37895) b_and!23169 (not b!851039) (not b!851044) (not b!851047) (not b!851035) (not b!851042) (not b!851038) (not bm!37894) (not mapNonEmpty!25802) (not start!73252) (not b_lambda!11545) (not b!851048) (not b_next!13999) (not b!851037))
(check-sat b_and!23169 (not b_next!13999))
