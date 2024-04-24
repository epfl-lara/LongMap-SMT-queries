; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77862 () Bool)

(assert start!77862)

(declare-fun b_free!16279 () Bool)

(declare-fun b_next!16279 () Bool)

(assert (=> start!77862 (= b_free!16279 (not b_next!16279))))

(declare-fun tp!57100 () Bool)

(declare-fun b_and!26721 () Bool)

(assert (=> start!77862 (= tp!57100 b_and!26721)))

(declare-fun b!907133 () Bool)

(declare-fun e!508424 () Bool)

(declare-fun e!508428 () Bool)

(assert (=> b!907133 (= e!508424 e!508428)))

(declare-fun res!611918 () Bool)

(assert (=> b!907133 (=> res!611918 e!508428)))

(declare-datatypes ((V!29895 0))(
  ( (V!29896 (val!9399 Int)) )
))
(declare-datatypes ((tuple2!12164 0))(
  ( (tuple2!12165 (_1!6093 (_ BitVec 64)) (_2!6093 V!29895)) )
))
(declare-datatypes ((List!18002 0))(
  ( (Nil!17999) (Cons!17998 (h!19150 tuple2!12164) (t!25445 List!18002)) )
))
(declare-datatypes ((ListLongMap!10863 0))(
  ( (ListLongMap!10864 (toList!5447 List!18002)) )
))
(declare-fun lt!409207 () ListLongMap!10863)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4502 (ListLongMap!10863 (_ BitVec 64)) Bool)

(assert (=> b!907133 (= res!611918 (not (contains!4502 lt!409207 k0!1033)))))

(declare-datatypes ((ValueCell!8867 0))(
  ( (ValueCellFull!8867 (v!11901 V!29895)) (EmptyCell!8867) )
))
(declare-datatypes ((array!53477 0))(
  ( (array!53478 (arr!25693 (Array (_ BitVec 32) ValueCell!8867)) (size!26153 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53477)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29895)

(declare-datatypes ((array!53479 0))(
  ( (array!53480 (arr!25694 (Array (_ BitVec 32) (_ BitVec 64))) (size!26154 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53479)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29895)

(declare-fun getCurrentListMap!2713 (array!53479 array!53477 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 32) Int) ListLongMap!10863)

(assert (=> b!907133 (= lt!409207 (getCurrentListMap!2713 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907134 () Bool)

(declare-fun e!508426 () Bool)

(declare-fun e!508429 () Bool)

(declare-fun mapRes!29758 () Bool)

(assert (=> b!907134 (= e!508426 (and e!508429 mapRes!29758))))

(declare-fun condMapEmpty!29758 () Bool)

(declare-fun mapDefault!29758 () ValueCell!8867)

(assert (=> b!907134 (= condMapEmpty!29758 (= (arr!25693 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8867)) mapDefault!29758)))))

(declare-fun b!907135 () Bool)

(declare-fun res!611916 () Bool)

(declare-fun e!508431 () Bool)

(assert (=> b!907135 (=> (not res!611916) (not e!508431))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907135 (= res!611916 (inRange!0 i!717 mask!1756))))

(declare-fun b!907136 () Bool)

(declare-fun res!611919 () Bool)

(assert (=> b!907136 (=> res!611919 e!508428)))

(declare-fun lt!409204 () V!29895)

(declare-fun apply!466 (ListLongMap!10863 (_ BitVec 64)) V!29895)

(assert (=> b!907136 (= res!611919 (not (= (apply!466 lt!409207 k0!1033) lt!409204)))))

(declare-fun mapIsEmpty!29758 () Bool)

(assert (=> mapIsEmpty!29758 mapRes!29758))

(declare-fun b!907137 () Bool)

(declare-fun e!508427 () Bool)

(declare-fun tp_is_empty!18697 () Bool)

(assert (=> b!907137 (= e!508427 tp_is_empty!18697)))

(declare-fun b!907138 () Bool)

(declare-fun e!508430 () Bool)

(assert (=> b!907138 (= e!508430 e!508431)))

(declare-fun res!611920 () Bool)

(assert (=> b!907138 (=> (not res!611920) (not e!508431))))

(declare-fun lt!409205 () ListLongMap!10863)

(assert (=> b!907138 (= res!611920 (contains!4502 lt!409205 k0!1033))))

(assert (=> b!907138 (= lt!409205 (getCurrentListMap!2713 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907139 () Bool)

(declare-fun res!611915 () Bool)

(assert (=> b!907139 (=> (not res!611915) (not e!508430))))

(assert (=> b!907139 (= res!611915 (and (= (size!26153 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26154 _keys!1386) (size!26153 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907140 () Bool)

(assert (=> b!907140 (= e!508428 true)))

(assert (=> b!907140 (= (apply!466 lt!409205 k0!1033) lt!409204)))

(declare-datatypes ((Unit!30748 0))(
  ( (Unit!30749) )
))
(declare-fun lt!409206 () Unit!30748)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!21 (array!53479 array!53477 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 64) V!29895 (_ BitVec 32) Int) Unit!30748)

(assert (=> b!907140 (= lt!409206 (lemmaListMapApplyFromThenApplyFromZero!21 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409204 i!717 defaultEntry!1160))))

(declare-fun b!907141 () Bool)

(assert (=> b!907141 (= e!508431 (not e!508424))))

(declare-fun res!611921 () Bool)

(assert (=> b!907141 (=> res!611921 e!508424)))

(assert (=> b!907141 (= res!611921 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26154 _keys!1386))))))

(declare-fun get!13518 (ValueCell!8867 V!29895) V!29895)

(declare-fun dynLambda!1360 (Int (_ BitVec 64)) V!29895)

(assert (=> b!907141 (= lt!409204 (get!13518 (select (arr!25693 _values!1152) i!717) (dynLambda!1360 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907141 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409203 () Unit!30748)

(declare-fun lemmaKeyInListMapIsInArray!219 (array!53479 array!53477 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 64) Int) Unit!30748)

(assert (=> b!907141 (= lt!409203 (lemmaKeyInListMapIsInArray!219 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907142 () Bool)

(declare-fun res!611922 () Bool)

(assert (=> b!907142 (=> (not res!611922) (not e!508431))))

(assert (=> b!907142 (= res!611922 (and (= (select (arr!25694 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907143 () Bool)

(declare-fun res!611914 () Bool)

(assert (=> b!907143 (=> (not res!611914) (not e!508430))))

(declare-datatypes ((List!18003 0))(
  ( (Nil!18000) (Cons!17999 (h!19151 (_ BitVec 64)) (t!25446 List!18003)) )
))
(declare-fun arrayNoDuplicates!0 (array!53479 (_ BitVec 32) List!18003) Bool)

(assert (=> b!907143 (= res!611914 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18000))))

(declare-fun mapNonEmpty!29758 () Bool)

(declare-fun tp!57099 () Bool)

(assert (=> mapNonEmpty!29758 (= mapRes!29758 (and tp!57099 e!508427))))

(declare-fun mapValue!29758 () ValueCell!8867)

(declare-fun mapKey!29758 () (_ BitVec 32))

(declare-fun mapRest!29758 () (Array (_ BitVec 32) ValueCell!8867))

(assert (=> mapNonEmpty!29758 (= (arr!25693 _values!1152) (store mapRest!29758 mapKey!29758 mapValue!29758))))

(declare-fun res!611923 () Bool)

(assert (=> start!77862 (=> (not res!611923) (not e!508430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77862 (= res!611923 (validMask!0 mask!1756))))

(assert (=> start!77862 e!508430))

(declare-fun array_inv!20180 (array!53477) Bool)

(assert (=> start!77862 (and (array_inv!20180 _values!1152) e!508426)))

(assert (=> start!77862 tp!57100))

(assert (=> start!77862 true))

(assert (=> start!77862 tp_is_empty!18697))

(declare-fun array_inv!20181 (array!53479) Bool)

(assert (=> start!77862 (array_inv!20181 _keys!1386)))

(declare-fun b!907144 () Bool)

(assert (=> b!907144 (= e!508429 tp_is_empty!18697)))

(declare-fun b!907145 () Bool)

(declare-fun res!611917 () Bool)

(assert (=> b!907145 (=> (not res!611917) (not e!508430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53479 (_ BitVec 32)) Bool)

(assert (=> b!907145 (= res!611917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77862 res!611923) b!907139))

(assert (= (and b!907139 res!611915) b!907145))

(assert (= (and b!907145 res!611917) b!907143))

(assert (= (and b!907143 res!611914) b!907138))

(assert (= (and b!907138 res!611920) b!907135))

(assert (= (and b!907135 res!611916) b!907142))

(assert (= (and b!907142 res!611922) b!907141))

(assert (= (and b!907141 (not res!611921)) b!907133))

(assert (= (and b!907133 (not res!611918)) b!907136))

(assert (= (and b!907136 (not res!611919)) b!907140))

(assert (= (and b!907134 condMapEmpty!29758) mapIsEmpty!29758))

(assert (= (and b!907134 (not condMapEmpty!29758)) mapNonEmpty!29758))

(get-info :version)

(assert (= (and mapNonEmpty!29758 ((_ is ValueCellFull!8867) mapValue!29758)) b!907137))

(assert (= (and b!907134 ((_ is ValueCellFull!8867) mapDefault!29758)) b!907144))

(assert (= start!77862 b!907134))

(declare-fun b_lambda!13167 () Bool)

(assert (=> (not b_lambda!13167) (not b!907141)))

(declare-fun t!25444 () Bool)

(declare-fun tb!5293 () Bool)

(assert (=> (and start!77862 (= defaultEntry!1160 defaultEntry!1160) t!25444) tb!5293))

(declare-fun result!10389 () Bool)

(assert (=> tb!5293 (= result!10389 tp_is_empty!18697)))

(assert (=> b!907141 t!25444))

(declare-fun b_and!26723 () Bool)

(assert (= b_and!26721 (and (=> t!25444 result!10389) b_and!26723)))

(declare-fun m!842909 () Bool)

(assert (=> b!907142 m!842909))

(declare-fun m!842911 () Bool)

(assert (=> b!907138 m!842911))

(declare-fun m!842913 () Bool)

(assert (=> b!907138 m!842913))

(declare-fun m!842915 () Bool)

(assert (=> b!907140 m!842915))

(declare-fun m!842917 () Bool)

(assert (=> b!907140 m!842917))

(declare-fun m!842919 () Bool)

(assert (=> b!907136 m!842919))

(declare-fun m!842921 () Bool)

(assert (=> mapNonEmpty!29758 m!842921))

(declare-fun m!842923 () Bool)

(assert (=> b!907143 m!842923))

(declare-fun m!842925 () Bool)

(assert (=> b!907145 m!842925))

(declare-fun m!842927 () Bool)

(assert (=> b!907141 m!842927))

(declare-fun m!842929 () Bool)

(assert (=> b!907141 m!842929))

(declare-fun m!842931 () Bool)

(assert (=> b!907141 m!842931))

(declare-fun m!842933 () Bool)

(assert (=> b!907141 m!842933))

(assert (=> b!907141 m!842927))

(assert (=> b!907141 m!842931))

(declare-fun m!842935 () Bool)

(assert (=> b!907141 m!842935))

(declare-fun m!842937 () Bool)

(assert (=> start!77862 m!842937))

(declare-fun m!842939 () Bool)

(assert (=> start!77862 m!842939))

(declare-fun m!842941 () Bool)

(assert (=> start!77862 m!842941))

(declare-fun m!842943 () Bool)

(assert (=> b!907133 m!842943))

(declare-fun m!842945 () Bool)

(assert (=> b!907133 m!842945))

(declare-fun m!842947 () Bool)

(assert (=> b!907135 m!842947))

(check-sat (not start!77862) (not b!907140) (not b!907141) (not b!907135) (not b!907136) tp_is_empty!18697 (not b!907145) (not mapNonEmpty!29758) b_and!26723 (not b!907133) (not b!907138) (not b_next!16279) (not b_lambda!13167) (not b!907143))
(check-sat b_and!26723 (not b_next!16279))
