; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73630 () Bool)

(assert start!73630)

(declare-fun b_free!14377 () Bool)

(declare-fun b_next!14377 () Bool)

(assert (=> start!73630 (= b_free!14377 (not b_next!14377))))

(declare-fun tp!50636 () Bool)

(declare-fun b_and!23743 () Bool)

(assert (=> start!73630 (= tp!50636 b_and!23743)))

(declare-fun b!858824 () Bool)

(declare-fun res!583156 () Bool)

(declare-fun e!478730 () Bool)

(assert (=> b!858824 (=> (not res!583156) (not e!478730))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858824 (= res!583156 (validMask!0 mask!1196))))

(declare-fun b!858825 () Bool)

(declare-fun res!583153 () Bool)

(assert (=> b!858825 (=> (not res!583153) (not e!478730))))

(declare-datatypes ((array!49257 0))(
  ( (array!49258 (arr!23655 (Array (_ BitVec 32) (_ BitVec 64))) (size!24096 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49257)

(declare-datatypes ((List!16722 0))(
  ( (Nil!16719) (Cons!16718 (h!17855 (_ BitVec 64)) (t!23357 List!16722)) )
))
(declare-fun arrayNoDuplicates!0 (array!49257 (_ BitVec 32) List!16722) Bool)

(assert (=> b!858825 (= res!583153 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16719))))

(declare-fun res!583154 () Bool)

(assert (=> start!73630 (=> (not res!583154) (not e!478730))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73630 (= res!583154 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24096 _keys!868))))))

(assert (=> start!73630 e!478730))

(declare-fun tp_is_empty!16513 () Bool)

(assert (=> start!73630 tp_is_empty!16513))

(assert (=> start!73630 true))

(assert (=> start!73630 tp!50636))

(declare-fun array_inv!18782 (array!49257) Bool)

(assert (=> start!73630 (array_inv!18782 _keys!868)))

(declare-datatypes ((V!27065 0))(
  ( (V!27066 (val!8304 Int)) )
))
(declare-datatypes ((ValueCell!7817 0))(
  ( (ValueCellFull!7817 (v!10729 V!27065)) (EmptyCell!7817) )
))
(declare-datatypes ((array!49259 0))(
  ( (array!49260 (arr!23656 (Array (_ BitVec 32) ValueCell!7817)) (size!24097 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49259)

(declare-fun e!478731 () Bool)

(declare-fun array_inv!18783 (array!49259) Bool)

(assert (=> start!73630 (and (array_inv!18783 _values!688) e!478731)))

(declare-fun b!858826 () Bool)

(declare-fun res!583155 () Bool)

(assert (=> b!858826 (=> (not res!583155) (not e!478730))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!858826 (= res!583155 (and (= (select (arr!23655 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858827 () Bool)

(declare-fun e!478727 () Bool)

(assert (=> b!858827 (= e!478727 true)))

(declare-datatypes ((tuple2!10880 0))(
  ( (tuple2!10881 (_1!5451 (_ BitVec 64)) (_2!5451 V!27065)) )
))
(declare-datatypes ((List!16723 0))(
  ( (Nil!16720) (Cons!16719 (h!17856 tuple2!10880) (t!23358 List!16723)) )
))
(declare-datatypes ((ListLongMap!9651 0))(
  ( (ListLongMap!9652 (toList!4841 List!16723)) )
))
(declare-fun lt!386817 () ListLongMap!9651)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386816 () ListLongMap!9651)

(declare-fun +!2248 (ListLongMap!9651 tuple2!10880) ListLongMap!9651)

(declare-fun get!12459 (ValueCell!7817 V!27065) V!27065)

(declare-fun dynLambda!1083 (Int (_ BitVec 64)) V!27065)

(assert (=> b!858827 (= lt!386817 (+!2248 lt!386816 (tuple2!10881 (select (arr!23655 _keys!868) from!1053) (get!12459 (select (arr!23656 _values!688) from!1053) (dynLambda!1083 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858828 () Bool)

(declare-fun res!583157 () Bool)

(assert (=> b!858828 (=> (not res!583157) (not e!478730))))

(assert (=> b!858828 (= res!583157 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24096 _keys!868))))))

(declare-fun b!858829 () Bool)

(declare-fun e!478732 () Bool)

(assert (=> b!858829 (= e!478732 tp_is_empty!16513)))

(declare-fun b!858830 () Bool)

(declare-fun e!478729 () Bool)

(assert (=> b!858830 (= e!478729 (not e!478727))))

(declare-fun res!583162 () Bool)

(assert (=> b!858830 (=> res!583162 e!478727)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858830 (= res!583162 (not (validKeyInArray!0 (select (arr!23655 _keys!868) from!1053))))))

(declare-fun lt!386818 () ListLongMap!9651)

(assert (=> b!858830 (= lt!386818 lt!386816)))

(declare-fun v!557 () V!27065)

(declare-fun lt!386815 () ListLongMap!9651)

(assert (=> b!858830 (= lt!386816 (+!2248 lt!386815 (tuple2!10881 k0!854 v!557)))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!386819 () array!49259)

(declare-fun minValue!654 () V!27065)

(declare-fun zeroValue!654 () V!27065)

(declare-fun getCurrentListMapNoExtraKeys!2897 (array!49257 array!49259 (_ BitVec 32) (_ BitVec 32) V!27065 V!27065 (_ BitVec 32) Int) ListLongMap!9651)

(assert (=> b!858830 (= lt!386818 (getCurrentListMapNoExtraKeys!2897 _keys!868 lt!386819 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!858830 (= lt!386815 (getCurrentListMapNoExtraKeys!2897 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29252 0))(
  ( (Unit!29253) )
))
(declare-fun lt!386813 () Unit!29252)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!446 (array!49257 array!49259 (_ BitVec 32) (_ BitVec 32) V!27065 V!27065 (_ BitVec 32) (_ BitVec 64) V!27065 (_ BitVec 32) Int) Unit!29252)

(assert (=> b!858830 (= lt!386813 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!446 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858831 () Bool)

(declare-fun e!478726 () Bool)

(assert (=> b!858831 (= e!478726 tp_is_empty!16513)))

(declare-fun b!858832 () Bool)

(assert (=> b!858832 (= e!478730 e!478729)))

(declare-fun res!583158 () Bool)

(assert (=> b!858832 (=> (not res!583158) (not e!478729))))

(assert (=> b!858832 (= res!583158 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858832 (= lt!386817 (getCurrentListMapNoExtraKeys!2897 _keys!868 lt!386819 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858832 (= lt!386819 (array!49260 (store (arr!23656 _values!688) i!612 (ValueCellFull!7817 v!557)) (size!24097 _values!688)))))

(declare-fun lt!386814 () ListLongMap!9651)

(assert (=> b!858832 (= lt!386814 (getCurrentListMapNoExtraKeys!2897 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26369 () Bool)

(declare-fun mapRes!26369 () Bool)

(assert (=> mapIsEmpty!26369 mapRes!26369))

(declare-fun mapNonEmpty!26369 () Bool)

(declare-fun tp!50635 () Bool)

(assert (=> mapNonEmpty!26369 (= mapRes!26369 (and tp!50635 e!478726))))

(declare-fun mapRest!26369 () (Array (_ BitVec 32) ValueCell!7817))

(declare-fun mapValue!26369 () ValueCell!7817)

(declare-fun mapKey!26369 () (_ BitVec 32))

(assert (=> mapNonEmpty!26369 (= (arr!23656 _values!688) (store mapRest!26369 mapKey!26369 mapValue!26369))))

(declare-fun b!858833 () Bool)

(assert (=> b!858833 (= e!478731 (and e!478732 mapRes!26369))))

(declare-fun condMapEmpty!26369 () Bool)

(declare-fun mapDefault!26369 () ValueCell!7817)

(assert (=> b!858833 (= condMapEmpty!26369 (= (arr!23656 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7817)) mapDefault!26369)))))

(declare-fun b!858834 () Bool)

(declare-fun res!583160 () Bool)

(assert (=> b!858834 (=> (not res!583160) (not e!478730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49257 (_ BitVec 32)) Bool)

(assert (=> b!858834 (= res!583160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858835 () Bool)

(declare-fun res!583159 () Bool)

(assert (=> b!858835 (=> (not res!583159) (not e!478730))))

(assert (=> b!858835 (= res!583159 (validKeyInArray!0 k0!854))))

(declare-fun b!858836 () Bool)

(declare-fun res!583161 () Bool)

(assert (=> b!858836 (=> (not res!583161) (not e!478730))))

(assert (=> b!858836 (= res!583161 (and (= (size!24097 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24096 _keys!868) (size!24097 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73630 res!583154) b!858824))

(assert (= (and b!858824 res!583156) b!858836))

(assert (= (and b!858836 res!583161) b!858834))

(assert (= (and b!858834 res!583160) b!858825))

(assert (= (and b!858825 res!583153) b!858828))

(assert (= (and b!858828 res!583157) b!858835))

(assert (= (and b!858835 res!583159) b!858826))

(assert (= (and b!858826 res!583155) b!858832))

(assert (= (and b!858832 res!583158) b!858830))

(assert (= (and b!858830 (not res!583162)) b!858827))

(assert (= (and b!858833 condMapEmpty!26369) mapIsEmpty!26369))

(assert (= (and b!858833 (not condMapEmpty!26369)) mapNonEmpty!26369))

(get-info :version)

(assert (= (and mapNonEmpty!26369 ((_ is ValueCellFull!7817) mapValue!26369)) b!858831))

(assert (= (and b!858833 ((_ is ValueCellFull!7817) mapDefault!26369)) b!858829))

(assert (= start!73630 b!858833))

(declare-fun b_lambda!11743 () Bool)

(assert (=> (not b_lambda!11743) (not b!858827)))

(declare-fun t!23356 () Bool)

(declare-fun tb!4491 () Bool)

(assert (=> (and start!73630 (= defaultEntry!696 defaultEntry!696) t!23356) tb!4491))

(declare-fun result!8601 () Bool)

(assert (=> tb!4491 (= result!8601 tp_is_empty!16513)))

(assert (=> b!858827 t!23356))

(declare-fun b_and!23745 () Bool)

(assert (= b_and!23743 (and (=> t!23356 result!8601) b_and!23745)))

(declare-fun m!799913 () Bool)

(assert (=> b!858832 m!799913))

(declare-fun m!799915 () Bool)

(assert (=> b!858832 m!799915))

(declare-fun m!799917 () Bool)

(assert (=> b!858832 m!799917))

(declare-fun m!799919 () Bool)

(assert (=> b!858835 m!799919))

(declare-fun m!799921 () Bool)

(assert (=> mapNonEmpty!26369 m!799921))

(declare-fun m!799923 () Bool)

(assert (=> b!858827 m!799923))

(declare-fun m!799925 () Bool)

(assert (=> b!858827 m!799925))

(declare-fun m!799927 () Bool)

(assert (=> b!858827 m!799927))

(declare-fun m!799929 () Bool)

(assert (=> b!858827 m!799929))

(assert (=> b!858827 m!799925))

(declare-fun m!799931 () Bool)

(assert (=> b!858827 m!799931))

(assert (=> b!858827 m!799927))

(declare-fun m!799933 () Bool)

(assert (=> b!858834 m!799933))

(declare-fun m!799935 () Bool)

(assert (=> b!858824 m!799935))

(declare-fun m!799937 () Bool)

(assert (=> b!858830 m!799937))

(assert (=> b!858830 m!799931))

(declare-fun m!799939 () Bool)

(assert (=> b!858830 m!799939))

(declare-fun m!799941 () Bool)

(assert (=> b!858830 m!799941))

(assert (=> b!858830 m!799931))

(declare-fun m!799943 () Bool)

(assert (=> b!858830 m!799943))

(declare-fun m!799945 () Bool)

(assert (=> b!858830 m!799945))

(declare-fun m!799947 () Bool)

(assert (=> b!858826 m!799947))

(declare-fun m!799949 () Bool)

(assert (=> start!73630 m!799949))

(declare-fun m!799951 () Bool)

(assert (=> start!73630 m!799951))

(declare-fun m!799953 () Bool)

(assert (=> b!858825 m!799953))

(check-sat b_and!23745 (not b!858830) tp_is_empty!16513 (not b_lambda!11743) (not b_next!14377) (not b!858825) (not mapNonEmpty!26369) (not b!858835) (not b!858824) (not b!858827) (not start!73630) (not b!858834) (not b!858832))
(check-sat b_and!23745 (not b_next!14377))
