; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73242 () Bool)

(assert start!73242)

(declare-fun b_free!14157 () Bool)

(declare-fun b_next!14157 () Bool)

(assert (=> start!73242 (= b_free!14157 (not b_next!14157))))

(declare-fun tp!49975 () Bool)

(declare-fun b_and!23473 () Bool)

(assert (=> start!73242 (= tp!49975 b_and!23473)))

(declare-fun b!853844 () Bool)

(declare-fun e!476146 () Bool)

(declare-fun tp_is_empty!16293 () Bool)

(assert (=> b!853844 (= e!476146 tp_is_empty!16293)))

(declare-fun b!853845 () Bool)

(declare-fun e!476145 () Bool)

(assert (=> b!853845 (= e!476145 tp_is_empty!16293)))

(declare-fun res!579884 () Bool)

(declare-fun e!476149 () Bool)

(assert (=> start!73242 (=> (not res!579884) (not e!476149))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48784 0))(
  ( (array!48785 (arr!23423 (Array (_ BitVec 32) (_ BitVec 64))) (size!23863 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48784)

(assert (=> start!73242 (= res!579884 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23863 _keys!868))))))

(assert (=> start!73242 e!476149))

(assert (=> start!73242 tp_is_empty!16293))

(assert (=> start!73242 true))

(assert (=> start!73242 tp!49975))

(declare-fun array_inv!18570 (array!48784) Bool)

(assert (=> start!73242 (array_inv!18570 _keys!868)))

(declare-datatypes ((V!26771 0))(
  ( (V!26772 (val!8194 Int)) )
))
(declare-datatypes ((ValueCell!7707 0))(
  ( (ValueCellFull!7707 (v!10619 V!26771)) (EmptyCell!7707) )
))
(declare-datatypes ((array!48786 0))(
  ( (array!48787 (arr!23424 (Array (_ BitVec 32) ValueCell!7707)) (size!23864 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48786)

(declare-fun e!476147 () Bool)

(declare-fun array_inv!18571 (array!48786) Bool)

(assert (=> start!73242 (and (array_inv!18571 _values!688) e!476147)))

(declare-fun mapNonEmpty!26039 () Bool)

(declare-fun mapRes!26039 () Bool)

(declare-fun tp!49974 () Bool)

(assert (=> mapNonEmpty!26039 (= mapRes!26039 (and tp!49974 e!476145))))

(declare-fun mapRest!26039 () (Array (_ BitVec 32) ValueCell!7707))

(declare-fun mapKey!26039 () (_ BitVec 32))

(declare-fun mapValue!26039 () ValueCell!7707)

(assert (=> mapNonEmpty!26039 (= (arr!23424 _values!688) (store mapRest!26039 mapKey!26039 mapValue!26039))))

(declare-fun b!853846 () Bool)

(declare-fun e!476150 () Bool)

(assert (=> b!853846 (= e!476150 true)))

(declare-datatypes ((tuple2!10778 0))(
  ( (tuple2!10779 (_1!5400 (_ BitVec 64)) (_2!5400 V!26771)) )
))
(declare-fun lt!384996 () tuple2!10778)

(declare-datatypes ((List!16600 0))(
  ( (Nil!16597) (Cons!16596 (h!17727 tuple2!10778) (t!23203 List!16600)) )
))
(declare-datatypes ((ListLongMap!9547 0))(
  ( (ListLongMap!9548 (toList!4789 List!16600)) )
))
(declare-fun lt!384997 () ListLongMap!9547)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!384998 () V!26771)

(declare-fun +!2180 (ListLongMap!9547 tuple2!10778) ListLongMap!9547)

(assert (=> b!853846 (= (+!2180 lt!384997 lt!384996) (+!2180 (+!2180 lt!384997 (tuple2!10779 k0!854 lt!384998)) lt!384996))))

(declare-fun lt!385002 () V!26771)

(assert (=> b!853846 (= lt!384996 (tuple2!10779 k0!854 lt!385002))))

(declare-datatypes ((Unit!29143 0))(
  ( (Unit!29144) )
))
(declare-fun lt!385003 () Unit!29143)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!306 (ListLongMap!9547 (_ BitVec 64) V!26771 V!26771) Unit!29143)

(assert (=> b!853846 (= lt!385003 (addSameAsAddTwiceSameKeyDiffValues!306 lt!384997 k0!854 lt!384998 lt!385002))))

(declare-fun lt!384995 () V!26771)

(declare-fun get!12356 (ValueCell!7707 V!26771) V!26771)

(assert (=> b!853846 (= lt!384998 (get!12356 (select (arr!23424 _values!688) from!1053) lt!384995))))

(declare-fun lt!385000 () ListLongMap!9547)

(assert (=> b!853846 (= lt!385000 (+!2180 lt!384997 (tuple2!10779 (select (arr!23423 _keys!868) from!1053) lt!385002)))))

(declare-fun v!557 () V!26771)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853846 (= lt!385002 (get!12356 (select (store (arr!23424 _values!688) i!612 (ValueCellFull!7707 v!557)) from!1053) lt!384995))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1060 (Int (_ BitVec 64)) V!26771)

(assert (=> b!853846 (= lt!384995 (dynLambda!1060 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26771)

(declare-fun zeroValue!654 () V!26771)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!385001 () array!48786)

(declare-fun getCurrentListMapNoExtraKeys!2770 (array!48784 array!48786 (_ BitVec 32) (_ BitVec 32) V!26771 V!26771 (_ BitVec 32) Int) ListLongMap!9547)

(assert (=> b!853846 (= lt!384997 (getCurrentListMapNoExtraKeys!2770 _keys!868 lt!385001 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853847 () Bool)

(declare-fun e!476152 () Bool)

(declare-fun call!38326 () ListLongMap!9547)

(declare-fun call!38327 () ListLongMap!9547)

(assert (=> b!853847 (= e!476152 (= call!38326 call!38327))))

(declare-fun b!853848 () Bool)

(declare-fun res!579880 () Bool)

(assert (=> b!853848 (=> (not res!579880) (not e!476149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853848 (= res!579880 (validKeyInArray!0 k0!854))))

(declare-fun b!853849 () Bool)

(declare-fun e!476148 () Bool)

(assert (=> b!853849 (= e!476148 (not e!476150))))

(declare-fun res!579885 () Bool)

(assert (=> b!853849 (=> res!579885 e!476150)))

(assert (=> b!853849 (= res!579885 (not (validKeyInArray!0 (select (arr!23423 _keys!868) from!1053))))))

(assert (=> b!853849 e!476152))

(declare-fun c!91906 () Bool)

(assert (=> b!853849 (= c!91906 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384999 () Unit!29143)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!403 (array!48784 array!48786 (_ BitVec 32) (_ BitVec 32) V!26771 V!26771 (_ BitVec 32) (_ BitVec 64) V!26771 (_ BitVec 32) Int) Unit!29143)

(assert (=> b!853849 (= lt!384999 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!403 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38323 () Bool)

(assert (=> bm!38323 (= call!38326 (getCurrentListMapNoExtraKeys!2770 _keys!868 lt!385001 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853850 () Bool)

(assert (=> b!853850 (= e!476152 (= call!38326 (+!2180 call!38327 (tuple2!10779 k0!854 v!557))))))

(declare-fun b!853851 () Bool)

(assert (=> b!853851 (= e!476147 (and e!476146 mapRes!26039))))

(declare-fun condMapEmpty!26039 () Bool)

(declare-fun mapDefault!26039 () ValueCell!7707)

(assert (=> b!853851 (= condMapEmpty!26039 (= (arr!23424 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7707)) mapDefault!26039)))))

(declare-fun b!853852 () Bool)

(declare-fun res!579878 () Bool)

(assert (=> b!853852 (=> (not res!579878) (not e!476149))))

(assert (=> b!853852 (= res!579878 (and (= (select (arr!23423 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853853 () Bool)

(declare-fun res!579881 () Bool)

(assert (=> b!853853 (=> (not res!579881) (not e!476149))))

(assert (=> b!853853 (= res!579881 (and (= (size!23864 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23863 _keys!868) (size!23864 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26039 () Bool)

(assert (=> mapIsEmpty!26039 mapRes!26039))

(declare-fun b!853854 () Bool)

(assert (=> b!853854 (= e!476149 e!476148)))

(declare-fun res!579886 () Bool)

(assert (=> b!853854 (=> (not res!579886) (not e!476148))))

(assert (=> b!853854 (= res!579886 (= from!1053 i!612))))

(assert (=> b!853854 (= lt!385000 (getCurrentListMapNoExtraKeys!2770 _keys!868 lt!385001 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853854 (= lt!385001 (array!48787 (store (arr!23424 _values!688) i!612 (ValueCellFull!7707 v!557)) (size!23864 _values!688)))))

(declare-fun lt!384994 () ListLongMap!9547)

(assert (=> b!853854 (= lt!384994 (getCurrentListMapNoExtraKeys!2770 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853855 () Bool)

(declare-fun res!579883 () Bool)

(assert (=> b!853855 (=> (not res!579883) (not e!476149))))

(declare-datatypes ((List!16601 0))(
  ( (Nil!16598) (Cons!16597 (h!17728 (_ BitVec 64)) (t!23204 List!16601)) )
))
(declare-fun arrayNoDuplicates!0 (array!48784 (_ BitVec 32) List!16601) Bool)

(assert (=> b!853855 (= res!579883 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16598))))

(declare-fun b!853856 () Bool)

(declare-fun res!579882 () Bool)

(assert (=> b!853856 (=> (not res!579882) (not e!476149))))

(assert (=> b!853856 (= res!579882 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23863 _keys!868))))))

(declare-fun b!853857 () Bool)

(declare-fun res!579879 () Bool)

(assert (=> b!853857 (=> (not res!579879) (not e!476149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853857 (= res!579879 (validMask!0 mask!1196))))

(declare-fun b!853858 () Bool)

(declare-fun res!579887 () Bool)

(assert (=> b!853858 (=> (not res!579887) (not e!476149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48784 (_ BitVec 32)) Bool)

(assert (=> b!853858 (= res!579887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38324 () Bool)

(assert (=> bm!38324 (= call!38327 (getCurrentListMapNoExtraKeys!2770 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73242 res!579884) b!853857))

(assert (= (and b!853857 res!579879) b!853853))

(assert (= (and b!853853 res!579881) b!853858))

(assert (= (and b!853858 res!579887) b!853855))

(assert (= (and b!853855 res!579883) b!853856))

(assert (= (and b!853856 res!579882) b!853848))

(assert (= (and b!853848 res!579880) b!853852))

(assert (= (and b!853852 res!579878) b!853854))

(assert (= (and b!853854 res!579886) b!853849))

(assert (= (and b!853849 c!91906) b!853850))

(assert (= (and b!853849 (not c!91906)) b!853847))

(assert (= (or b!853850 b!853847) bm!38323))

(assert (= (or b!853850 b!853847) bm!38324))

(assert (= (and b!853849 (not res!579885)) b!853846))

(assert (= (and b!853851 condMapEmpty!26039) mapIsEmpty!26039))

(assert (= (and b!853851 (not condMapEmpty!26039)) mapNonEmpty!26039))

(get-info :version)

(assert (= (and mapNonEmpty!26039 ((_ is ValueCellFull!7707) mapValue!26039)) b!853845))

(assert (= (and b!853851 ((_ is ValueCellFull!7707) mapDefault!26039)) b!853844))

(assert (= start!73242 b!853851))

(declare-fun b_lambda!11689 () Bool)

(assert (=> (not b_lambda!11689) (not b!853846)))

(declare-fun t!23202 () Bool)

(declare-fun tb!4459 () Bool)

(assert (=> (and start!73242 (= defaultEntry!696 defaultEntry!696) t!23202) tb!4459))

(declare-fun result!8529 () Bool)

(assert (=> tb!4459 (= result!8529 tp_is_empty!16293)))

(assert (=> b!853846 t!23202))

(declare-fun b_and!23475 () Bool)

(assert (= b_and!23473 (and (=> t!23202 result!8529) b_and!23475)))

(declare-fun m!795119 () Bool)

(assert (=> b!853858 m!795119))

(declare-fun m!795121 () Bool)

(assert (=> b!853849 m!795121))

(assert (=> b!853849 m!795121))

(declare-fun m!795123 () Bool)

(assert (=> b!853849 m!795123))

(declare-fun m!795125 () Bool)

(assert (=> b!853849 m!795125))

(declare-fun m!795127 () Bool)

(assert (=> b!853850 m!795127))

(declare-fun m!795129 () Bool)

(assert (=> b!853857 m!795129))

(declare-fun m!795131 () Bool)

(assert (=> b!853855 m!795131))

(declare-fun m!795133 () Bool)

(assert (=> b!853848 m!795133))

(declare-fun m!795135 () Bool)

(assert (=> bm!38323 m!795135))

(declare-fun m!795137 () Bool)

(assert (=> bm!38324 m!795137))

(declare-fun m!795139 () Bool)

(assert (=> b!853846 m!795139))

(declare-fun m!795141 () Bool)

(assert (=> b!853846 m!795141))

(declare-fun m!795143 () Bool)

(assert (=> b!853846 m!795143))

(declare-fun m!795145 () Bool)

(assert (=> b!853846 m!795145))

(declare-fun m!795147 () Bool)

(assert (=> b!853846 m!795147))

(declare-fun m!795149 () Bool)

(assert (=> b!853846 m!795149))

(assert (=> b!853846 m!795145))

(declare-fun m!795151 () Bool)

(assert (=> b!853846 m!795151))

(declare-fun m!795153 () Bool)

(assert (=> b!853846 m!795153))

(declare-fun m!795155 () Bool)

(assert (=> b!853846 m!795155))

(assert (=> b!853846 m!795153))

(assert (=> b!853846 m!795121))

(declare-fun m!795157 () Bool)

(assert (=> b!853846 m!795157))

(assert (=> b!853846 m!795139))

(declare-fun m!795159 () Bool)

(assert (=> b!853846 m!795159))

(assert (=> b!853846 m!795135))

(declare-fun m!795161 () Bool)

(assert (=> mapNonEmpty!26039 m!795161))

(declare-fun m!795163 () Bool)

(assert (=> b!853854 m!795163))

(assert (=> b!853854 m!795151))

(declare-fun m!795165 () Bool)

(assert (=> b!853854 m!795165))

(declare-fun m!795167 () Bool)

(assert (=> b!853852 m!795167))

(declare-fun m!795169 () Bool)

(assert (=> start!73242 m!795169))

(declare-fun m!795171 () Bool)

(assert (=> start!73242 m!795171))

(check-sat (not bm!38324) (not b!853846) (not b!853858) tp_is_empty!16293 (not b_lambda!11689) (not mapNonEmpty!26039) (not start!73242) (not b!853857) (not bm!38323) (not b!853854) (not b!853850) (not b!853855) (not b_next!14157) (not b!853848) (not b!853849) b_and!23475)
(check-sat b_and!23475 (not b_next!14157))
