; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73710 () Bool)

(assert start!73710)

(declare-fun b_free!14625 () Bool)

(declare-fun b_next!14625 () Bool)

(assert (=> start!73710 (= b_free!14625 (not b_next!14625))))

(declare-fun tp!51378 () Bool)

(declare-fun b_and!24229 () Bool)

(assert (=> start!73710 (= tp!51378 b_and!24229)))

(declare-fun b!863875 () Bool)

(declare-fun e!481268 () Bool)

(declare-fun tp_is_empty!16761 () Bool)

(assert (=> b!863875 (= e!481268 tp_is_empty!16761)))

(declare-fun b!863876 () Bool)

(declare-fun res!587011 () Bool)

(declare-fun e!481269 () Bool)

(assert (=> b!863876 (=> (not res!587011) (not e!481269))))

(declare-datatypes ((array!49684 0))(
  ( (array!49685 (arr!23873 (Array (_ BitVec 32) (_ BitVec 64))) (size!24313 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49684)

(declare-datatypes ((List!16964 0))(
  ( (Nil!16961) (Cons!16960 (h!18091 (_ BitVec 64)) (t!23855 List!16964)) )
))
(declare-fun arrayNoDuplicates!0 (array!49684 (_ BitVec 32) List!16964) Bool)

(assert (=> b!863876 (= res!587011 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16961))))

(declare-fun mapNonEmpty!26741 () Bool)

(declare-fun mapRes!26741 () Bool)

(declare-fun tp!51379 () Bool)

(assert (=> mapNonEmpty!26741 (= mapRes!26741 (and tp!51379 e!481268))))

(declare-datatypes ((V!27395 0))(
  ( (V!27396 (val!8428 Int)) )
))
(declare-datatypes ((ValueCell!7941 0))(
  ( (ValueCellFull!7941 (v!10853 V!27395)) (EmptyCell!7941) )
))
(declare-datatypes ((array!49686 0))(
  ( (array!49687 (arr!23874 (Array (_ BitVec 32) ValueCell!7941)) (size!24314 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49686)

(declare-fun mapRest!26741 () (Array (_ BitVec 32) ValueCell!7941))

(declare-fun mapKey!26741 () (_ BitVec 32))

(declare-fun mapValue!26741 () ValueCell!7941)

(assert (=> mapNonEmpty!26741 (= (arr!23874 _values!688) (store mapRest!26741 mapKey!26741 mapValue!26741))))

(declare-fun b!863877 () Bool)

(declare-fun res!587014 () Bool)

(assert (=> b!863877 (=> (not res!587014) (not e!481269))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!863877 (= res!587014 (and (= (size!24314 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24313 _keys!868) (size!24314 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863878 () Bool)

(declare-fun e!481264 () Bool)

(assert (=> b!863878 (= e!481269 e!481264)))

(declare-fun res!587015 () Bool)

(assert (=> b!863878 (=> (not res!587015) (not e!481264))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!863878 (= res!587015 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390657 () array!49686)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11158 0))(
  ( (tuple2!11159 (_1!5590 (_ BitVec 64)) (_2!5590 V!27395)) )
))
(declare-datatypes ((List!16965 0))(
  ( (Nil!16962) (Cons!16961 (h!18092 tuple2!11158) (t!23856 List!16965)) )
))
(declare-datatypes ((ListLongMap!9927 0))(
  ( (ListLongMap!9928 (toList!4979 List!16965)) )
))
(declare-fun lt!390651 () ListLongMap!9927)

(declare-fun minValue!654 () V!27395)

(declare-fun zeroValue!654 () V!27395)

(declare-fun getCurrentListMapNoExtraKeys!2953 (array!49684 array!49686 (_ BitVec 32) (_ BitVec 32) V!27395 V!27395 (_ BitVec 32) Int) ListLongMap!9927)

(assert (=> b!863878 (= lt!390651 (getCurrentListMapNoExtraKeys!2953 _keys!868 lt!390657 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27395)

(assert (=> b!863878 (= lt!390657 (array!49687 (store (arr!23874 _values!688) i!612 (ValueCellFull!7941 v!557)) (size!24314 _values!688)))))

(declare-fun lt!390656 () ListLongMap!9927)

(assert (=> b!863878 (= lt!390656 (getCurrentListMapNoExtraKeys!2953 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26741 () Bool)

(assert (=> mapIsEmpty!26741 mapRes!26741))

(declare-fun b!863879 () Bool)

(declare-fun e!481265 () Bool)

(assert (=> b!863879 (= e!481265 tp_is_empty!16761)))

(declare-fun b!863880 () Bool)

(declare-datatypes ((Unit!29539 0))(
  ( (Unit!29540) )
))
(declare-fun e!481262 () Unit!29539)

(declare-fun Unit!29541 () Unit!29539)

(assert (=> b!863880 (= e!481262 Unit!29541)))

(declare-fun b!863881 () Bool)

(declare-fun e!481266 () Bool)

(assert (=> b!863881 (= e!481264 (not e!481266))))

(declare-fun res!587012 () Bool)

(assert (=> b!863881 (=> res!587012 e!481266)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863881 (= res!587012 (not (validKeyInArray!0 (select (arr!23873 _keys!868) from!1053))))))

(declare-fun lt!390659 () ListLongMap!9927)

(declare-fun lt!390660 () ListLongMap!9927)

(assert (=> b!863881 (= lt!390659 lt!390660)))

(declare-fun lt!390649 () ListLongMap!9927)

(declare-fun lt!390662 () tuple2!11158)

(declare-fun +!2328 (ListLongMap!9927 tuple2!11158) ListLongMap!9927)

(assert (=> b!863881 (= lt!390660 (+!2328 lt!390649 lt!390662))))

(assert (=> b!863881 (= lt!390659 (getCurrentListMapNoExtraKeys!2953 _keys!868 lt!390657 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!863881 (= lt!390662 (tuple2!11159 k0!854 v!557))))

(assert (=> b!863881 (= lt!390649 (getCurrentListMapNoExtraKeys!2953 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!390663 () Unit!29539)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!533 (array!49684 array!49686 (_ BitVec 32) (_ BitVec 32) V!27395 V!27395 (_ BitVec 32) (_ BitVec 64) V!27395 (_ BitVec 32) Int) Unit!29539)

(assert (=> b!863881 (= lt!390663 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!533 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863882 () Bool)

(declare-fun e!481263 () Bool)

(assert (=> b!863882 (= e!481263 (and e!481265 mapRes!26741))))

(declare-fun condMapEmpty!26741 () Bool)

(declare-fun mapDefault!26741 () ValueCell!7941)

(assert (=> b!863882 (= condMapEmpty!26741 (= (arr!23874 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7941)) mapDefault!26741)))))

(declare-fun b!863883 () Bool)

(declare-fun res!587017 () Bool)

(assert (=> b!863883 (=> (not res!587017) (not e!481269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49684 (_ BitVec 32)) Bool)

(assert (=> b!863883 (= res!587017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!863884 () Bool)

(declare-fun e!481267 () Bool)

(assert (=> b!863884 (= e!481266 e!481267)))

(declare-fun res!587016 () Bool)

(assert (=> b!863884 (=> res!587016 e!481267)))

(assert (=> b!863884 (= res!587016 (= k0!854 (select (arr!23873 _keys!868) from!1053)))))

(assert (=> b!863884 (not (= (select (arr!23873 _keys!868) from!1053) k0!854))))

(declare-fun lt!390654 () Unit!29539)

(assert (=> b!863884 (= lt!390654 e!481262)))

(declare-fun c!92158 () Bool)

(assert (=> b!863884 (= c!92158 (= (select (arr!23873 _keys!868) from!1053) k0!854))))

(declare-fun lt!390664 () ListLongMap!9927)

(assert (=> b!863884 (= lt!390651 lt!390664)))

(declare-fun lt!390661 () tuple2!11158)

(assert (=> b!863884 (= lt!390664 (+!2328 lt!390660 lt!390661))))

(declare-fun lt!390655 () V!27395)

(assert (=> b!863884 (= lt!390661 (tuple2!11159 (select (arr!23873 _keys!868) from!1053) lt!390655))))

(declare-fun get!12607 (ValueCell!7941 V!27395) V!27395)

(declare-fun dynLambda!1155 (Int (_ BitVec 64)) V!27395)

(assert (=> b!863884 (= lt!390655 (get!12607 (select (arr!23874 _values!688) from!1053) (dynLambda!1155 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863885 () Bool)

(declare-fun res!587021 () Bool)

(assert (=> b!863885 (=> (not res!587021) (not e!481269))))

(assert (=> b!863885 (= res!587021 (and (= (select (arr!23873 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863886 () Bool)

(declare-fun res!587020 () Bool)

(assert (=> b!863886 (=> (not res!587020) (not e!481269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863886 (= res!587020 (validMask!0 mask!1196))))

(declare-fun b!863888 () Bool)

(declare-fun res!587013 () Bool)

(assert (=> b!863888 (=> (not res!587013) (not e!481269))))

(assert (=> b!863888 (= res!587013 (validKeyInArray!0 k0!854))))

(declare-fun b!863889 () Bool)

(declare-fun Unit!29542 () Unit!29539)

(assert (=> b!863889 (= e!481262 Unit!29542)))

(declare-fun lt!390658 () Unit!29539)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49684 (_ BitVec 32) (_ BitVec 32)) Unit!29539)

(assert (=> b!863889 (= lt!390658 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!863889 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16961)))

(declare-fun lt!390653 () Unit!29539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29539)

(assert (=> b!863889 (= lt!390653 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863889 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390652 () Unit!29539)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49684 (_ BitVec 64) (_ BitVec 32) List!16964) Unit!29539)

(assert (=> b!863889 (= lt!390652 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16961))))

(assert (=> b!863889 false))

(declare-fun b!863890 () Bool)

(assert (=> b!863890 (= e!481267 true)))

(assert (=> b!863890 (= lt!390664 (+!2328 (+!2328 lt!390649 lt!390661) lt!390662))))

(declare-fun lt!390650 () Unit!29539)

(declare-fun addCommutativeForDiffKeys!501 (ListLongMap!9927 (_ BitVec 64) V!27395 (_ BitVec 64) V!27395) Unit!29539)

(assert (=> b!863890 (= lt!390650 (addCommutativeForDiffKeys!501 lt!390649 k0!854 v!557 (select (arr!23873 _keys!868) from!1053) lt!390655))))

(declare-fun res!587019 () Bool)

(assert (=> start!73710 (=> (not res!587019) (not e!481269))))

(assert (=> start!73710 (= res!587019 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24313 _keys!868))))))

(assert (=> start!73710 e!481269))

(assert (=> start!73710 tp_is_empty!16761))

(assert (=> start!73710 true))

(assert (=> start!73710 tp!51378))

(declare-fun array_inv!18882 (array!49684) Bool)

(assert (=> start!73710 (array_inv!18882 _keys!868)))

(declare-fun array_inv!18883 (array!49686) Bool)

(assert (=> start!73710 (and (array_inv!18883 _values!688) e!481263)))

(declare-fun b!863887 () Bool)

(declare-fun res!587018 () Bool)

(assert (=> b!863887 (=> (not res!587018) (not e!481269))))

(assert (=> b!863887 (= res!587018 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24313 _keys!868))))))

(assert (= (and start!73710 res!587019) b!863886))

(assert (= (and b!863886 res!587020) b!863877))

(assert (= (and b!863877 res!587014) b!863883))

(assert (= (and b!863883 res!587017) b!863876))

(assert (= (and b!863876 res!587011) b!863887))

(assert (= (and b!863887 res!587018) b!863888))

(assert (= (and b!863888 res!587013) b!863885))

(assert (= (and b!863885 res!587021) b!863878))

(assert (= (and b!863878 res!587015) b!863881))

(assert (= (and b!863881 (not res!587012)) b!863884))

(assert (= (and b!863884 c!92158) b!863889))

(assert (= (and b!863884 (not c!92158)) b!863880))

(assert (= (and b!863884 (not res!587016)) b!863890))

(assert (= (and b!863882 condMapEmpty!26741) mapIsEmpty!26741))

(assert (= (and b!863882 (not condMapEmpty!26741)) mapNonEmpty!26741))

(get-info :version)

(assert (= (and mapNonEmpty!26741 ((_ is ValueCellFull!7941) mapValue!26741)) b!863875))

(assert (= (and b!863882 ((_ is ValueCellFull!7941) mapDefault!26741)) b!863879))

(assert (= start!73710 b!863882))

(declare-fun b_lambda!11977 () Bool)

(assert (=> (not b_lambda!11977) (not b!863884)))

(declare-fun t!23854 () Bool)

(declare-fun tb!4747 () Bool)

(assert (=> (and start!73710 (= defaultEntry!696 defaultEntry!696) t!23854) tb!4747))

(declare-fun result!9105 () Bool)

(assert (=> tb!4747 (= result!9105 tp_is_empty!16761)))

(assert (=> b!863884 t!23854))

(declare-fun b_and!24231 () Bool)

(assert (= b_and!24229 (and (=> t!23854 result!9105) b_and!24231)))

(declare-fun m!805125 () Bool)

(assert (=> b!863890 m!805125))

(assert (=> b!863890 m!805125))

(declare-fun m!805127 () Bool)

(assert (=> b!863890 m!805127))

(declare-fun m!805129 () Bool)

(assert (=> b!863890 m!805129))

(assert (=> b!863890 m!805129))

(declare-fun m!805131 () Bool)

(assert (=> b!863890 m!805131))

(declare-fun m!805133 () Bool)

(assert (=> mapNonEmpty!26741 m!805133))

(declare-fun m!805135 () Bool)

(assert (=> b!863886 m!805135))

(declare-fun m!805137 () Bool)

(assert (=> b!863889 m!805137))

(declare-fun m!805139 () Bool)

(assert (=> b!863889 m!805139))

(declare-fun m!805141 () Bool)

(assert (=> b!863889 m!805141))

(declare-fun m!805143 () Bool)

(assert (=> b!863889 m!805143))

(declare-fun m!805145 () Bool)

(assert (=> b!863889 m!805145))

(declare-fun m!805147 () Bool)

(assert (=> b!863876 m!805147))

(declare-fun m!805149 () Bool)

(assert (=> b!863888 m!805149))

(declare-fun m!805151 () Bool)

(assert (=> b!863884 m!805151))

(declare-fun m!805153 () Bool)

(assert (=> b!863884 m!805153))

(declare-fun m!805155 () Bool)

(assert (=> b!863884 m!805155))

(declare-fun m!805157 () Bool)

(assert (=> b!863884 m!805157))

(assert (=> b!863884 m!805153))

(assert (=> b!863884 m!805129))

(assert (=> b!863884 m!805155))

(declare-fun m!805159 () Bool)

(assert (=> b!863878 m!805159))

(declare-fun m!805161 () Bool)

(assert (=> b!863878 m!805161))

(declare-fun m!805163 () Bool)

(assert (=> b!863878 m!805163))

(declare-fun m!805165 () Bool)

(assert (=> b!863883 m!805165))

(declare-fun m!805167 () Bool)

(assert (=> b!863881 m!805167))

(declare-fun m!805169 () Bool)

(assert (=> b!863881 m!805169))

(assert (=> b!863881 m!805129))

(declare-fun m!805171 () Bool)

(assert (=> b!863881 m!805171))

(assert (=> b!863881 m!805129))

(declare-fun m!805173 () Bool)

(assert (=> b!863881 m!805173))

(declare-fun m!805175 () Bool)

(assert (=> b!863881 m!805175))

(declare-fun m!805177 () Bool)

(assert (=> b!863885 m!805177))

(declare-fun m!805179 () Bool)

(assert (=> start!73710 m!805179))

(declare-fun m!805181 () Bool)

(assert (=> start!73710 m!805181))

(check-sat (not b!863883) tp_is_empty!16761 (not b_lambda!11977) (not start!73710) (not mapNonEmpty!26741) (not b!863888) (not b!863878) (not b!863884) (not b!863890) (not b!863876) b_and!24231 (not b!863886) (not b!863881) (not b_next!14625) (not b!863889))
(check-sat b_and!24231 (not b_next!14625))
