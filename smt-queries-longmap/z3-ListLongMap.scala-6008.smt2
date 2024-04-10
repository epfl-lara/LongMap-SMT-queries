; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77902 () Bool)

(assert start!77902)

(declare-fun b_free!16461 () Bool)

(declare-fun b_next!16461 () Bool)

(assert (=> start!77902 (= b_free!16461 (not b_next!16461))))

(declare-fun tp!57647 () Bool)

(declare-fun b_and!27029 () Bool)

(assert (=> start!77902 (= tp!57647 b_and!27029)))

(declare-fun b!909611 () Bool)

(declare-fun e!509898 () Bool)

(declare-fun tp_is_empty!18879 () Bool)

(assert (=> b!909611 (= e!509898 tp_is_empty!18879)))

(declare-fun mapIsEmpty!30034 () Bool)

(declare-fun mapRes!30034 () Bool)

(assert (=> mapIsEmpty!30034 mapRes!30034))

(declare-fun b!909612 () Bool)

(declare-fun res!613913 () Bool)

(declare-fun e!509900 () Bool)

(assert (=> b!909612 (=> (not res!613913) (not e!509900))))

(declare-datatypes ((array!53780 0))(
  ( (array!53781 (arr!25848 (Array (_ BitVec 32) (_ BitVec 64))) (size!26307 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53780)

(declare-datatypes ((List!18158 0))(
  ( (Nil!18155) (Cons!18154 (h!19300 (_ BitVec 64)) (t!25739 List!18158)) )
))
(declare-fun arrayNoDuplicates!0 (array!53780 (_ BitVec 32) List!18158) Bool)

(assert (=> b!909612 (= res!613913 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18155))))

(declare-fun b!909613 () Bool)

(declare-fun res!613912 () Bool)

(assert (=> b!909613 (=> (not res!613912) (not e!509900))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53780 (_ BitVec 32)) Bool)

(assert (=> b!909613 (= res!613912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909615 () Bool)

(declare-fun res!613917 () Bool)

(assert (=> b!909615 (=> (not res!613917) (not e!509900))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909615 (= res!613917 (inRange!0 i!717 mask!1756))))

(declare-fun b!909616 () Bool)

(declare-fun res!613916 () Bool)

(assert (=> b!909616 (=> (not res!613916) (not e!509900))))

(declare-datatypes ((V!30137 0))(
  ( (V!30138 (val!9490 Int)) )
))
(declare-datatypes ((ValueCell!8958 0))(
  ( (ValueCellFull!8958 (v!11997 V!30137)) (EmptyCell!8958) )
))
(declare-datatypes ((array!53782 0))(
  ( (array!53783 (arr!25849 (Array (_ BitVec 32) ValueCell!8958)) (size!26308 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53782)

(declare-fun defaultEntry!1160 () Int)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30137)

(declare-fun zeroValue!1094 () V!30137)

(declare-datatypes ((tuple2!12366 0))(
  ( (tuple2!12367 (_1!6194 (_ BitVec 64)) (_2!6194 V!30137)) )
))
(declare-datatypes ((List!18159 0))(
  ( (Nil!18156) (Cons!18155 (h!19301 tuple2!12366) (t!25740 List!18159)) )
))
(declare-datatypes ((ListLongMap!11063 0))(
  ( (ListLongMap!11064 (toList!5547 List!18159)) )
))
(declare-fun contains!4589 (ListLongMap!11063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2809 (array!53780 array!53782 (_ BitVec 32) (_ BitVec 32) V!30137 V!30137 (_ BitVec 32) Int) ListLongMap!11063)

(assert (=> b!909616 (= res!613916 (contains!4589 (getCurrentListMap!2809 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909617 () Bool)

(declare-fun res!613914 () Bool)

(assert (=> b!909617 (=> (not res!613914) (not e!509900))))

(assert (=> b!909617 (= res!613914 (and (= (size!26308 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26307 _keys!1386) (size!26308 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909618 () Bool)

(declare-fun e!509901 () Bool)

(declare-fun e!509897 () Bool)

(assert (=> b!909618 (= e!509901 (and e!509897 mapRes!30034))))

(declare-fun condMapEmpty!30034 () Bool)

(declare-fun mapDefault!30034 () ValueCell!8958)

(assert (=> b!909618 (= condMapEmpty!30034 (= (arr!25849 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8958)) mapDefault!30034)))))

(declare-fun mapNonEmpty!30034 () Bool)

(declare-fun tp!57648 () Bool)

(assert (=> mapNonEmpty!30034 (= mapRes!30034 (and tp!57648 e!509898))))

(declare-fun mapRest!30034 () (Array (_ BitVec 32) ValueCell!8958))

(declare-fun mapValue!30034 () ValueCell!8958)

(declare-fun mapKey!30034 () (_ BitVec 32))

(assert (=> mapNonEmpty!30034 (= (arr!25849 _values!1152) (store mapRest!30034 mapKey!30034 mapValue!30034))))

(declare-fun b!909619 () Bool)

(assert (=> b!909619 (= e!509897 tp_is_empty!18879)))

(declare-fun res!613915 () Bool)

(assert (=> start!77902 (=> (not res!613915) (not e!509900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77902 (= res!613915 (validMask!0 mask!1756))))

(assert (=> start!77902 e!509900))

(declare-fun array_inv!20220 (array!53782) Bool)

(assert (=> start!77902 (and (array_inv!20220 _values!1152) e!509901)))

(assert (=> start!77902 tp!57647))

(assert (=> start!77902 true))

(assert (=> start!77902 tp_is_empty!18879))

(declare-fun array_inv!20221 (array!53780) Bool)

(assert (=> start!77902 (array_inv!20221 _keys!1386)))

(declare-fun b!909614 () Bool)

(assert (=> b!909614 (= e!509900 (and (= (select (arr!25848 _keys!1386) i!717) k0!1033) (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!26307 _keys!1386))))))

(assert (= (and start!77902 res!613915) b!909617))

(assert (= (and b!909617 res!613914) b!909613))

(assert (= (and b!909613 res!613912) b!909612))

(assert (= (and b!909612 res!613913) b!909616))

(assert (= (and b!909616 res!613916) b!909615))

(assert (= (and b!909615 res!613917) b!909614))

(assert (= (and b!909618 condMapEmpty!30034) mapIsEmpty!30034))

(assert (= (and b!909618 (not condMapEmpty!30034)) mapNonEmpty!30034))

(get-info :version)

(assert (= (and mapNonEmpty!30034 ((_ is ValueCellFull!8958) mapValue!30034)) b!909611))

(assert (= (and b!909618 ((_ is ValueCellFull!8958) mapDefault!30034)) b!909619))

(assert (= start!77902 b!909618))

(declare-fun m!844813 () Bool)

(assert (=> start!77902 m!844813))

(declare-fun m!844815 () Bool)

(assert (=> start!77902 m!844815))

(declare-fun m!844817 () Bool)

(assert (=> start!77902 m!844817))

(declare-fun m!844819 () Bool)

(assert (=> b!909616 m!844819))

(assert (=> b!909616 m!844819))

(declare-fun m!844821 () Bool)

(assert (=> b!909616 m!844821))

(declare-fun m!844823 () Bool)

(assert (=> mapNonEmpty!30034 m!844823))

(declare-fun m!844825 () Bool)

(assert (=> b!909613 m!844825))

(declare-fun m!844827 () Bool)

(assert (=> b!909612 m!844827))

(declare-fun m!844829 () Bool)

(assert (=> b!909614 m!844829))

(declare-fun m!844831 () Bool)

(assert (=> b!909615 m!844831))

(check-sat (not b_next!16461) (not b!909615) (not b!909613) (not b!909616) b_and!27029 (not b!909612) tp_is_empty!18879 (not start!77902) (not mapNonEmpty!30034))
(check-sat b_and!27029 (not b_next!16461))
(get-model)

(declare-fun d!112159 () Bool)

(assert (=> d!112159 (= (inRange!0 i!717 mask!1756) (and (bvsge i!717 #b00000000000000000000000000000000) (bvslt i!717 (bvadd mask!1756 #b00000000000000000000000000000001))))))

(assert (=> b!909615 d!112159))

(declare-fun d!112161 () Bool)

(declare-fun e!509922 () Bool)

(assert (=> d!112161 e!509922))

(declare-fun res!613938 () Bool)

(assert (=> d!112161 (=> res!613938 e!509922)))

(declare-fun lt!410021 () Bool)

(assert (=> d!112161 (= res!613938 (not lt!410021))))

(declare-fun lt!410023 () Bool)

(assert (=> d!112161 (= lt!410021 lt!410023)))

(declare-datatypes ((Unit!30854 0))(
  ( (Unit!30855) )
))
(declare-fun lt!410024 () Unit!30854)

(declare-fun e!509921 () Unit!30854)

(assert (=> d!112161 (= lt!410024 e!509921)))

(declare-fun c!95691 () Bool)

(assert (=> d!112161 (= c!95691 lt!410023)))

(declare-fun containsKey!437 (List!18159 (_ BitVec 64)) Bool)

(assert (=> d!112161 (= lt!410023 (containsKey!437 (toList!5547 (getCurrentListMap!2809 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(assert (=> d!112161 (= (contains!4589 (getCurrentListMap!2809 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033) lt!410021)))

(declare-fun b!909653 () Bool)

(declare-fun lt!410022 () Unit!30854)

(assert (=> b!909653 (= e!509921 lt!410022)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!333 (List!18159 (_ BitVec 64)) Unit!30854)

(assert (=> b!909653 (= lt!410022 (lemmaContainsKeyImpliesGetValueByKeyDefined!333 (toList!5547 (getCurrentListMap!2809 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-datatypes ((Option!476 0))(
  ( (Some!475 (v!11999 V!30137)) (None!474) )
))
(declare-fun isDefined!342 (Option!476) Bool)

(declare-fun getValueByKey!470 (List!18159 (_ BitVec 64)) Option!476)

(assert (=> b!909653 (isDefined!342 (getValueByKey!470 (toList!5547 (getCurrentListMap!2809 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033))))

(declare-fun b!909654 () Bool)

(declare-fun Unit!30856 () Unit!30854)

(assert (=> b!909654 (= e!509921 Unit!30856)))

(declare-fun b!909655 () Bool)

(assert (=> b!909655 (= e!509922 (isDefined!342 (getValueByKey!470 (toList!5547 (getCurrentListMap!2809 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160)) k0!1033)))))

(assert (= (and d!112161 c!95691) b!909653))

(assert (= (and d!112161 (not c!95691)) b!909654))

(assert (= (and d!112161 (not res!613938)) b!909655))

(declare-fun m!844853 () Bool)

(assert (=> d!112161 m!844853))

(declare-fun m!844855 () Bool)

(assert (=> b!909653 m!844855))

(declare-fun m!844857 () Bool)

(assert (=> b!909653 m!844857))

(assert (=> b!909653 m!844857))

(declare-fun m!844859 () Bool)

(assert (=> b!909653 m!844859))

(assert (=> b!909655 m!844857))

(assert (=> b!909655 m!844857))

(assert (=> b!909655 m!844859))

(assert (=> b!909616 d!112161))

(declare-fun bm!40298 () Bool)

(declare-fun call!40304 () ListLongMap!11063)

(declare-fun call!40301 () ListLongMap!11063)

(assert (=> bm!40298 (= call!40304 call!40301)))

(declare-fun b!909698 () Bool)

(declare-fun e!509959 () Bool)

(declare-fun e!509952 () Bool)

(assert (=> b!909698 (= e!509959 e!509952)))

(declare-fun res!613958 () Bool)

(declare-fun call!40305 () Bool)

(assert (=> b!909698 (= res!613958 call!40305)))

(assert (=> b!909698 (=> (not res!613958) (not e!509952))))

(declare-fun b!909699 () Bool)

(declare-fun e!509953 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!909699 (= e!509953 (validKeyInArray!0 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!909700 () Bool)

(declare-fun e!509957 () ListLongMap!11063)

(declare-fun +!2603 (ListLongMap!11063 tuple2!12366) ListLongMap!11063)

(assert (=> b!909700 (= e!509957 (+!2603 call!40301 (tuple2!12367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094)))))

(declare-fun b!909701 () Bool)

(declare-fun e!509960 () Bool)

(declare-fun e!509950 () Bool)

(assert (=> b!909701 (= e!509960 e!509950)))

(declare-fun c!95707 () Bool)

(assert (=> b!909701 (= c!95707 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!909702 () Bool)

(declare-fun e!509956 () ListLongMap!11063)

(declare-fun call!40302 () ListLongMap!11063)

(assert (=> b!909702 (= e!509956 call!40302)))

(declare-fun b!909703 () Bool)

(declare-fun res!613960 () Bool)

(assert (=> b!909703 (=> (not res!613960) (not e!509960))))

(declare-fun e!509949 () Bool)

(assert (=> b!909703 (= res!613960 e!509949)))

(declare-fun res!613965 () Bool)

(assert (=> b!909703 (=> res!613965 e!509949)))

(declare-fun e!509961 () Bool)

(assert (=> b!909703 (= res!613965 (not e!509961))))

(declare-fun res!613957 () Bool)

(assert (=> b!909703 (=> (not res!613957) (not e!509961))))

(assert (=> b!909703 (= res!613957 (bvslt #b00000000000000000000000000000000 (size!26307 _keys!1386)))))

(declare-fun bm!40299 () Bool)

(declare-fun call!40306 () ListLongMap!11063)

(declare-fun call!40307 () ListLongMap!11063)

(assert (=> bm!40299 (= call!40306 call!40307)))

(declare-fun b!909704 () Bool)

(declare-fun e!509951 () Unit!30854)

(declare-fun lt!410088 () Unit!30854)

(assert (=> b!909704 (= e!509951 lt!410088)))

(declare-fun lt!410090 () ListLongMap!11063)

(declare-fun getCurrentListMapNoExtraKeys!3290 (array!53780 array!53782 (_ BitVec 32) (_ BitVec 32) V!30137 V!30137 (_ BitVec 32) Int) ListLongMap!11063)

(assert (=> b!909704 (= lt!410090 (getCurrentListMapNoExtraKeys!3290 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410080 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410080 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410089 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410089 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410077 () Unit!30854)

(declare-fun addStillContains!344 (ListLongMap!11063 (_ BitVec 64) V!30137 (_ BitVec 64)) Unit!30854)

(assert (=> b!909704 (= lt!410077 (addStillContains!344 lt!410090 lt!410080 zeroValue!1094 lt!410089))))

(assert (=> b!909704 (contains!4589 (+!2603 lt!410090 (tuple2!12367 lt!410080 zeroValue!1094)) lt!410089)))

(declare-fun lt!410082 () Unit!30854)

(assert (=> b!909704 (= lt!410082 lt!410077)))

(declare-fun lt!410076 () ListLongMap!11063)

(assert (=> b!909704 (= lt!410076 (getCurrentListMapNoExtraKeys!3290 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410070 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410070 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410075 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410075 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410079 () Unit!30854)

(declare-fun addApplyDifferent!344 (ListLongMap!11063 (_ BitVec 64) V!30137 (_ BitVec 64)) Unit!30854)

(assert (=> b!909704 (= lt!410079 (addApplyDifferent!344 lt!410076 lt!410070 minValue!1094 lt!410075))))

(declare-fun apply!511 (ListLongMap!11063 (_ BitVec 64)) V!30137)

(assert (=> b!909704 (= (apply!511 (+!2603 lt!410076 (tuple2!12367 lt!410070 minValue!1094)) lt!410075) (apply!511 lt!410076 lt!410075))))

(declare-fun lt!410086 () Unit!30854)

(assert (=> b!909704 (= lt!410086 lt!410079)))

(declare-fun lt!410074 () ListLongMap!11063)

(assert (=> b!909704 (= lt!410074 (getCurrentListMapNoExtraKeys!3290 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410084 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410084 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410085 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410085 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410081 () Unit!30854)

(assert (=> b!909704 (= lt!410081 (addApplyDifferent!344 lt!410074 lt!410084 zeroValue!1094 lt!410085))))

(assert (=> b!909704 (= (apply!511 (+!2603 lt!410074 (tuple2!12367 lt!410084 zeroValue!1094)) lt!410085) (apply!511 lt!410074 lt!410085))))

(declare-fun lt!410069 () Unit!30854)

(assert (=> b!909704 (= lt!410069 lt!410081)))

(declare-fun lt!410071 () ListLongMap!11063)

(assert (=> b!909704 (= lt!410071 (getCurrentListMapNoExtraKeys!3290 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun lt!410087 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410087 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!410073 () (_ BitVec 64))

(assert (=> b!909704 (= lt!410073 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> b!909704 (= lt!410088 (addApplyDifferent!344 lt!410071 lt!410087 minValue!1094 lt!410073))))

(assert (=> b!909704 (= (apply!511 (+!2603 lt!410071 (tuple2!12367 lt!410087 minValue!1094)) lt!410073) (apply!511 lt!410071 lt!410073))))

(declare-fun b!909705 () Bool)

(declare-fun e!509955 () Bool)

(declare-fun lt!410072 () ListLongMap!11063)

(assert (=> b!909705 (= e!509955 (= (apply!511 lt!410072 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1094))))

(declare-fun b!909706 () Bool)

(declare-fun e!509958 () Bool)

(assert (=> b!909706 (= e!509949 e!509958)))

(declare-fun res!613964 () Bool)

(assert (=> b!909706 (=> (not res!613964) (not e!509958))))

(assert (=> b!909706 (= res!613964 (contains!4589 lt!410072 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)))))

(assert (=> b!909706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26307 _keys!1386)))))

(declare-fun b!909707 () Bool)

(declare-fun Unit!30857 () Unit!30854)

(assert (=> b!909707 (= e!509951 Unit!30857)))

(declare-fun d!112163 () Bool)

(assert (=> d!112163 e!509960))

(declare-fun res!613961 () Bool)

(assert (=> d!112163 (=> (not res!613961) (not e!509960))))

(assert (=> d!112163 (= res!613961 (or (bvsge #b00000000000000000000000000000000 (size!26307 _keys!1386)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26307 _keys!1386)))))))

(declare-fun lt!410083 () ListLongMap!11063)

(assert (=> d!112163 (= lt!410072 lt!410083)))

(declare-fun lt!410078 () Unit!30854)

(assert (=> d!112163 (= lt!410078 e!509951)))

(declare-fun c!95704 () Bool)

(assert (=> d!112163 (= c!95704 e!509953)))

(declare-fun res!613963 () Bool)

(assert (=> d!112163 (=> (not res!613963) (not e!509953))))

(assert (=> d!112163 (= res!613963 (bvslt #b00000000000000000000000000000000 (size!26307 _keys!1386)))))

(assert (=> d!112163 (= lt!410083 e!509957)))

(declare-fun c!95709 () Bool)

(assert (=> d!112163 (= c!95709 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112163 (validMask!0 mask!1756)))

(assert (=> d!112163 (= (getCurrentListMap!2809 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) lt!410072)))

(declare-fun b!909708 () Bool)

(declare-fun e!509954 () ListLongMap!11063)

(assert (=> b!909708 (= e!509954 call!40304)))

(declare-fun b!909709 () Bool)

(declare-fun get!13604 (ValueCell!8958 V!30137) V!30137)

(declare-fun dynLambda!1387 (Int (_ BitVec 64)) V!30137)

(assert (=> b!909709 (= e!509958 (= (apply!511 lt!410072 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)) (get!13604 (select (arr!25849 _values!1152) #b00000000000000000000000000000000) (dynLambda!1387 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!909709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26308 _values!1152)))))

(assert (=> b!909709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!26307 _keys!1386)))))

(declare-fun b!909710 () Bool)

(declare-fun call!40303 () Bool)

(assert (=> b!909710 (= e!509950 (not call!40303))))

(declare-fun b!909711 () Bool)

(assert (=> b!909711 (= e!509952 (= (apply!511 lt!410072 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1094))))

(declare-fun b!909712 () Bool)

(assert (=> b!909712 (= e!509961 (validKeyInArray!0 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40300 () Bool)

(assert (=> bm!40300 (= call!40307 (getCurrentListMapNoExtraKeys!3290 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun bm!40301 () Bool)

(declare-fun c!95708 () Bool)

(assert (=> bm!40301 (= call!40301 (+!2603 (ite c!95709 call!40307 (ite c!95708 call!40306 call!40302)) (ite (or c!95709 c!95708) (tuple2!12367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1094) (tuple2!12367 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1094))))))

(declare-fun bm!40302 () Bool)

(assert (=> bm!40302 (= call!40302 call!40306)))

(declare-fun b!909713 () Bool)

(declare-fun c!95705 () Bool)

(assert (=> b!909713 (= c!95705 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!909713 (= e!509954 e!509956)))

(declare-fun b!909714 () Bool)

(assert (=> b!909714 (= e!509956 call!40304)))

(declare-fun bm!40303 () Bool)

(assert (=> bm!40303 (= call!40305 (contains!4589 lt!410072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!909715 () Bool)

(assert (=> b!909715 (= e!509957 e!509954)))

(assert (=> b!909715 (= c!95708 (and (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1073 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!40304 () Bool)

(assert (=> bm!40304 (= call!40303 (contains!4589 lt!410072 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!909716 () Bool)

(declare-fun res!613959 () Bool)

(assert (=> b!909716 (=> (not res!613959) (not e!509960))))

(assert (=> b!909716 (= res!613959 e!509959)))

(declare-fun c!95706 () Bool)

(assert (=> b!909716 (= c!95706 (not (= (bvand extraKeys!1073 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!909717 () Bool)

(assert (=> b!909717 (= e!509959 (not call!40305))))

(declare-fun b!909718 () Bool)

(assert (=> b!909718 (= e!509950 e!509955)))

(declare-fun res!613962 () Bool)

(assert (=> b!909718 (= res!613962 call!40303)))

(assert (=> b!909718 (=> (not res!613962) (not e!509955))))

(assert (= (and d!112163 c!95709) b!909700))

(assert (= (and d!112163 (not c!95709)) b!909715))

(assert (= (and b!909715 c!95708) b!909708))

(assert (= (and b!909715 (not c!95708)) b!909713))

(assert (= (and b!909713 c!95705) b!909714))

(assert (= (and b!909713 (not c!95705)) b!909702))

(assert (= (or b!909714 b!909702) bm!40302))

(assert (= (or b!909708 bm!40302) bm!40299))

(assert (= (or b!909708 b!909714) bm!40298))

(assert (= (or b!909700 bm!40299) bm!40300))

(assert (= (or b!909700 bm!40298) bm!40301))

(assert (= (and d!112163 res!613963) b!909699))

(assert (= (and d!112163 c!95704) b!909704))

(assert (= (and d!112163 (not c!95704)) b!909707))

(assert (= (and d!112163 res!613961) b!909703))

(assert (= (and b!909703 res!613957) b!909712))

(assert (= (and b!909703 (not res!613965)) b!909706))

(assert (= (and b!909706 res!613964) b!909709))

(assert (= (and b!909703 res!613960) b!909716))

(assert (= (and b!909716 c!95706) b!909698))

(assert (= (and b!909716 (not c!95706)) b!909717))

(assert (= (and b!909698 res!613958) b!909711))

(assert (= (or b!909698 b!909717) bm!40303))

(assert (= (and b!909716 res!613959) b!909701))

(assert (= (and b!909701 c!95707) b!909718))

(assert (= (and b!909701 (not c!95707)) b!909710))

(assert (= (and b!909718 res!613962) b!909705))

(assert (= (or b!909718 b!909710) bm!40304))

(declare-fun b_lambda!13295 () Bool)

(assert (=> (not b_lambda!13295) (not b!909709)))

(declare-fun t!25744 () Bool)

(declare-fun tb!5433 () Bool)

(assert (=> (and start!77902 (= defaultEntry!1160 defaultEntry!1160) t!25744) tb!5433))

(declare-fun result!10663 () Bool)

(assert (=> tb!5433 (= result!10663 tp_is_empty!18879)))

(assert (=> b!909709 t!25744))

(declare-fun b_and!27033 () Bool)

(assert (= b_and!27029 (and (=> t!25744 result!10663) b_and!27033)))

(assert (=> d!112163 m!844813))

(declare-fun m!844861 () Bool)

(assert (=> bm!40301 m!844861))

(declare-fun m!844863 () Bool)

(assert (=> bm!40303 m!844863))

(declare-fun m!844865 () Bool)

(assert (=> b!909699 m!844865))

(assert (=> b!909699 m!844865))

(declare-fun m!844867 () Bool)

(assert (=> b!909699 m!844867))

(declare-fun m!844869 () Bool)

(assert (=> bm!40300 m!844869))

(declare-fun m!844871 () Bool)

(assert (=> b!909700 m!844871))

(assert (=> b!909706 m!844865))

(assert (=> b!909706 m!844865))

(declare-fun m!844873 () Bool)

(assert (=> b!909706 m!844873))

(declare-fun m!844875 () Bool)

(assert (=> b!909705 m!844875))

(assert (=> b!909712 m!844865))

(assert (=> b!909712 m!844865))

(assert (=> b!909712 m!844867))

(declare-fun m!844877 () Bool)

(assert (=> b!909711 m!844877))

(declare-fun m!844879 () Bool)

(assert (=> bm!40304 m!844879))

(declare-fun m!844881 () Bool)

(assert (=> b!909709 m!844881))

(declare-fun m!844883 () Bool)

(assert (=> b!909709 m!844883))

(declare-fun m!844885 () Bool)

(assert (=> b!909709 m!844885))

(assert (=> b!909709 m!844865))

(declare-fun m!844887 () Bool)

(assert (=> b!909709 m!844887))

(assert (=> b!909709 m!844883))

(assert (=> b!909709 m!844881))

(assert (=> b!909709 m!844865))

(declare-fun m!844889 () Bool)

(assert (=> b!909704 m!844889))

(declare-fun m!844891 () Bool)

(assert (=> b!909704 m!844891))

(declare-fun m!844893 () Bool)

(assert (=> b!909704 m!844893))

(declare-fun m!844895 () Bool)

(assert (=> b!909704 m!844895))

(declare-fun m!844897 () Bool)

(assert (=> b!909704 m!844897))

(declare-fun m!844899 () Bool)

(assert (=> b!909704 m!844899))

(declare-fun m!844901 () Bool)

(assert (=> b!909704 m!844901))

(declare-fun m!844903 () Bool)

(assert (=> b!909704 m!844903))

(declare-fun m!844905 () Bool)

(assert (=> b!909704 m!844905))

(declare-fun m!844907 () Bool)

(assert (=> b!909704 m!844907))

(declare-fun m!844909 () Bool)

(assert (=> b!909704 m!844909))

(assert (=> b!909704 m!844869))

(assert (=> b!909704 m!844865))

(declare-fun m!844911 () Bool)

(assert (=> b!909704 m!844911))

(assert (=> b!909704 m!844895))

(declare-fun m!844913 () Bool)

(assert (=> b!909704 m!844913))

(declare-fun m!844915 () Bool)

(assert (=> b!909704 m!844915))

(declare-fun m!844917 () Bool)

(assert (=> b!909704 m!844917))

(assert (=> b!909704 m!844905))

(assert (=> b!909704 m!844901))

(assert (=> b!909704 m!844891))

(assert (=> b!909616 d!112163))

(declare-fun bm!40307 () Bool)

(declare-fun call!40310 () Bool)

(declare-fun c!95712 () Bool)

(assert (=> bm!40307 (= call!40310 (arrayNoDuplicates!0 _keys!1386 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95712 (Cons!18154 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000) Nil!18155) Nil!18155)))))

(declare-fun b!909731 () Bool)

(declare-fun e!509971 () Bool)

(assert (=> b!909731 (= e!509971 call!40310)))

(declare-fun b!909732 () Bool)

(declare-fun e!509972 () Bool)

(assert (=> b!909732 (= e!509972 e!509971)))

(assert (=> b!909732 (= c!95712 (validKeyInArray!0 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!909733 () Bool)

(declare-fun e!509973 () Bool)

(declare-fun contains!4591 (List!18158 (_ BitVec 64)) Bool)

(assert (=> b!909733 (= e!509973 (contains!4591 Nil!18155 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!909734 () Bool)

(assert (=> b!909734 (= e!509971 call!40310)))

(declare-fun d!112165 () Bool)

(declare-fun res!613972 () Bool)

(declare-fun e!509970 () Bool)

(assert (=> d!112165 (=> res!613972 e!509970)))

(assert (=> d!112165 (= res!613972 (bvsge #b00000000000000000000000000000000 (size!26307 _keys!1386)))))

(assert (=> d!112165 (= (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18155) e!509970)))

(declare-fun b!909735 () Bool)

(assert (=> b!909735 (= e!509970 e!509972)))

(declare-fun res!613974 () Bool)

(assert (=> b!909735 (=> (not res!613974) (not e!509972))))

(assert (=> b!909735 (= res!613974 (not e!509973))))

(declare-fun res!613973 () Bool)

(assert (=> b!909735 (=> (not res!613973) (not e!509973))))

(assert (=> b!909735 (= res!613973 (validKeyInArray!0 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)))))

(assert (= (and d!112165 (not res!613972)) b!909735))

(assert (= (and b!909735 res!613973) b!909733))

(assert (= (and b!909735 res!613974) b!909732))

(assert (= (and b!909732 c!95712) b!909734))

(assert (= (and b!909732 (not c!95712)) b!909731))

(assert (= (or b!909734 b!909731) bm!40307))

(assert (=> bm!40307 m!844865))

(declare-fun m!844919 () Bool)

(assert (=> bm!40307 m!844919))

(assert (=> b!909732 m!844865))

(assert (=> b!909732 m!844865))

(assert (=> b!909732 m!844867))

(assert (=> b!909733 m!844865))

(assert (=> b!909733 m!844865))

(declare-fun m!844921 () Bool)

(assert (=> b!909733 m!844921))

(assert (=> b!909735 m!844865))

(assert (=> b!909735 m!844865))

(assert (=> b!909735 m!844867))

(assert (=> b!909612 d!112165))

(declare-fun d!112167 () Bool)

(assert (=> d!112167 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77902 d!112167))

(declare-fun d!112169 () Bool)

(assert (=> d!112169 (= (array_inv!20220 _values!1152) (bvsge (size!26308 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77902 d!112169))

(declare-fun d!112171 () Bool)

(assert (=> d!112171 (= (array_inv!20221 _keys!1386) (bvsge (size!26307 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77902 d!112171))

(declare-fun b!909744 () Bool)

(declare-fun e!509982 () Bool)

(declare-fun e!509981 () Bool)

(assert (=> b!909744 (= e!509982 e!509981)))

(declare-fun c!95715 () Bool)

(assert (=> b!909744 (= c!95715 (validKeyInArray!0 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun bm!40310 () Bool)

(declare-fun call!40313 () Bool)

(assert (=> bm!40310 (= call!40313 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun b!909745 () Bool)

(assert (=> b!909745 (= e!509981 call!40313)))

(declare-fun d!112173 () Bool)

(declare-fun res!613980 () Bool)

(assert (=> d!112173 (=> res!613980 e!509982)))

(assert (=> d!112173 (= res!613980 (bvsge #b00000000000000000000000000000000 (size!26307 _keys!1386)))))

(assert (=> d!112173 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!509982)))

(declare-fun b!909746 () Bool)

(declare-fun e!509980 () Bool)

(assert (=> b!909746 (= e!509980 call!40313)))

(declare-fun b!909747 () Bool)

(assert (=> b!909747 (= e!509981 e!509980)))

(declare-fun lt!410098 () (_ BitVec 64))

(assert (=> b!909747 (= lt!410098 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000))))

(declare-fun lt!410097 () Unit!30854)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!53780 (_ BitVec 64) (_ BitVec 32)) Unit!30854)

(assert (=> b!909747 (= lt!410097 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!410098 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!53780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909747 (arrayContainsKey!0 _keys!1386 lt!410098 #b00000000000000000000000000000000)))

(declare-fun lt!410099 () Unit!30854)

(assert (=> b!909747 (= lt!410099 lt!410097)))

(declare-fun res!613979 () Bool)

(declare-datatypes ((SeekEntryResult!8964 0))(
  ( (MissingZero!8964 (index!38227 (_ BitVec 32))) (Found!8964 (index!38228 (_ BitVec 32))) (Intermediate!8964 (undefined!9776 Bool) (index!38229 (_ BitVec 32)) (x!77723 (_ BitVec 32))) (Undefined!8964) (MissingVacant!8964 (index!38230 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!53780 (_ BitVec 32)) SeekEntryResult!8964)

(assert (=> b!909747 (= res!613979 (= (seekEntryOrOpen!0 (select (arr!25848 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8964 #b00000000000000000000000000000000)))))

(assert (=> b!909747 (=> (not res!613979) (not e!509980))))

(assert (= (and d!112173 (not res!613980)) b!909744))

(assert (= (and b!909744 c!95715) b!909747))

(assert (= (and b!909744 (not c!95715)) b!909745))

(assert (= (and b!909747 res!613979) b!909746))

(assert (= (or b!909746 b!909745) bm!40310))

(assert (=> b!909744 m!844865))

(assert (=> b!909744 m!844865))

(assert (=> b!909744 m!844867))

(declare-fun m!844923 () Bool)

(assert (=> bm!40310 m!844923))

(assert (=> b!909747 m!844865))

(declare-fun m!844925 () Bool)

(assert (=> b!909747 m!844925))

(declare-fun m!844927 () Bool)

(assert (=> b!909747 m!844927))

(assert (=> b!909747 m!844865))

(declare-fun m!844929 () Bool)

(assert (=> b!909747 m!844929))

(assert (=> b!909613 d!112173))

(declare-fun condMapEmpty!30040 () Bool)

(declare-fun mapDefault!30040 () ValueCell!8958)

(assert (=> mapNonEmpty!30034 (= condMapEmpty!30040 (= mapRest!30034 ((as const (Array (_ BitVec 32) ValueCell!8958)) mapDefault!30040)))))

(declare-fun e!509988 () Bool)

(declare-fun mapRes!30040 () Bool)

(assert (=> mapNonEmpty!30034 (= tp!57648 (and e!509988 mapRes!30040))))

(declare-fun mapIsEmpty!30040 () Bool)

(assert (=> mapIsEmpty!30040 mapRes!30040))

(declare-fun mapNonEmpty!30040 () Bool)

(declare-fun tp!57657 () Bool)

(declare-fun e!509987 () Bool)

(assert (=> mapNonEmpty!30040 (= mapRes!30040 (and tp!57657 e!509987))))

(declare-fun mapRest!30040 () (Array (_ BitVec 32) ValueCell!8958))

(declare-fun mapKey!30040 () (_ BitVec 32))

(declare-fun mapValue!30040 () ValueCell!8958)

(assert (=> mapNonEmpty!30040 (= mapRest!30034 (store mapRest!30040 mapKey!30040 mapValue!30040))))

(declare-fun b!909755 () Bool)

(assert (=> b!909755 (= e!509988 tp_is_empty!18879)))

(declare-fun b!909754 () Bool)

(assert (=> b!909754 (= e!509987 tp_is_empty!18879)))

(assert (= (and mapNonEmpty!30034 condMapEmpty!30040) mapIsEmpty!30040))

(assert (= (and mapNonEmpty!30034 (not condMapEmpty!30040)) mapNonEmpty!30040))

(assert (= (and mapNonEmpty!30040 ((_ is ValueCellFull!8958) mapValue!30040)) b!909754))

(assert (= (and mapNonEmpty!30034 ((_ is ValueCellFull!8958) mapDefault!30040)) b!909755))

(declare-fun m!844931 () Bool)

(assert (=> mapNonEmpty!30040 m!844931))

(declare-fun b_lambda!13297 () Bool)

(assert (= b_lambda!13295 (or (and start!77902 b_free!16461) b_lambda!13297)))

(check-sat (not bm!40300) (not b!909706) (not b_next!16461) (not mapNonEmpty!30040) (not d!112163) (not b!909653) (not b!909735) (not b!909744) tp_is_empty!18879 (not b!909705) (not b_lambda!13297) (not bm!40301) (not b!909732) b_and!27033 (not b!909700) (not bm!40310) (not bm!40307) (not b!909709) (not bm!40304) (not b!909733) (not bm!40303) (not b!909747) (not b!909711) (not b!909704) (not b!909699) (not b!909655) (not d!112161) (not b!909712))
(check-sat b_and!27033 (not b_next!16461))
