; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40732 () Bool)

(assert start!40732)

(declare-fun b_free!10743 () Bool)

(declare-fun b_next!10743 () Bool)

(assert (=> start!40732 (= b_free!10743 (not b_next!10743))))

(declare-fun tp!38049 () Bool)

(declare-fun b_and!18753 () Bool)

(assert (=> start!40732 (= tp!38049 b_and!18753)))

(declare-fun b!451134 () Bool)

(declare-fun res!268608 () Bool)

(declare-fun e!264288 () Bool)

(assert (=> b!451134 (=> (not res!268608) (not e!264288))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27967 0))(
  ( (array!27968 (arr!13429 (Array (_ BitVec 32) (_ BitVec 64))) (size!13781 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27967)

(assert (=> b!451134 (= res!268608 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13781 _keys!709))))))

(declare-fun bm!29818 () Bool)

(declare-datatypes ((V!17213 0))(
  ( (V!17214 (val!6085 Int)) )
))
(declare-fun minValue!515 () V!17213)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5697 0))(
  ( (ValueCellFull!5697 (v!8340 V!17213)) (EmptyCell!5697) )
))
(declare-datatypes ((array!27969 0))(
  ( (array!27970 (arr!13430 (Array (_ BitVec 32) ValueCell!5697)) (size!13782 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27969)

(declare-datatypes ((tuple2!7998 0))(
  ( (tuple2!7999 (_1!4010 (_ BitVec 64)) (_2!4010 V!17213)) )
))
(declare-datatypes ((List!8062 0))(
  ( (Nil!8059) (Cons!8058 (h!8914 tuple2!7998) (t!13828 List!8062)) )
))
(declare-datatypes ((ListLongMap!6911 0))(
  ( (ListLongMap!6912 (toList!3471 List!8062)) )
))
(declare-fun call!29821 () ListLongMap!6911)

(declare-fun zeroValue!515 () V!17213)

(declare-fun lt!204809 () array!27967)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!204810 () array!27969)

(declare-fun c!56021 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1655 (array!27967 array!27969 (_ BitVec 32) (_ BitVec 32) V!17213 V!17213 (_ BitVec 32) Int) ListLongMap!6911)

(assert (=> bm!29818 (= call!29821 (getCurrentListMapNoExtraKeys!1655 (ite c!56021 lt!204809 _keys!709) (ite c!56021 lt!204810 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451135 () Bool)

(declare-fun e!264289 () Bool)

(declare-fun call!29822 () ListLongMap!6911)

(assert (=> b!451135 (= e!264289 (= call!29822 call!29821))))

(declare-fun b!451136 () Bool)

(declare-fun e!264290 () Bool)

(declare-fun e!264284 () Bool)

(assert (=> b!451136 (= e!264290 (not e!264284))))

(declare-fun res!268601 () Bool)

(assert (=> b!451136 (=> res!268601 e!264284)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451136 (= res!268601 (validKeyInArray!0 (select (arr!13429 _keys!709) from!863)))))

(assert (=> b!451136 e!264289))

(assert (=> b!451136 (= c!56021 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13208 0))(
  ( (Unit!13209) )
))
(declare-fun lt!204812 () Unit!13208)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17213)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!719 (array!27967 array!27969 (_ BitVec 32) (_ BitVec 32) V!17213 V!17213 (_ BitVec 32) (_ BitVec 64) V!17213 (_ BitVec 32) Int) Unit!13208)

(assert (=> b!451136 (= lt!204812 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!719 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451137 () Bool)

(declare-fun +!1551 (ListLongMap!6911 tuple2!7998) ListLongMap!6911)

(assert (=> b!451137 (= e!264289 (= call!29821 (+!1551 call!29822 (tuple2!7999 k0!794 v!412))))))

(declare-fun b!451139 () Bool)

(declare-fun res!268604 () Bool)

(declare-fun e!264283 () Bool)

(assert (=> b!451139 (=> (not res!268604) (not e!264283))))

(assert (=> b!451139 (= res!268604 (bvsle from!863 i!563))))

(declare-fun b!451140 () Bool)

(declare-fun res!268605 () Bool)

(assert (=> b!451140 (=> (not res!268605) (not e!264288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27967 (_ BitVec 32)) Bool)

(assert (=> b!451140 (= res!268605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451141 () Bool)

(declare-fun res!268606 () Bool)

(assert (=> b!451141 (=> (not res!268606) (not e!264283))))

(declare-datatypes ((List!8063 0))(
  ( (Nil!8060) (Cons!8059 (h!8915 (_ BitVec 64)) (t!13829 List!8063)) )
))
(declare-fun arrayNoDuplicates!0 (array!27967 (_ BitVec 32) List!8063) Bool)

(assert (=> b!451141 (= res!268606 (arrayNoDuplicates!0 lt!204809 #b00000000000000000000000000000000 Nil!8060))))

(declare-fun b!451142 () Bool)

(declare-fun res!268609 () Bool)

(assert (=> b!451142 (=> (not res!268609) (not e!264288))))

(declare-fun arrayContainsKey!0 (array!27967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451142 (= res!268609 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451143 () Bool)

(declare-fun res!268607 () Bool)

(assert (=> b!451143 (=> (not res!268607) (not e!264288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451143 (= res!268607 (validMask!0 mask!1025))))

(declare-fun b!451144 () Bool)

(declare-fun e!264285 () Bool)

(declare-fun tp_is_empty!12081 () Bool)

(assert (=> b!451144 (= e!264285 tp_is_empty!12081)))

(declare-fun b!451145 () Bool)

(assert (=> b!451145 (= e!264288 e!264283)))

(declare-fun res!268612 () Bool)

(assert (=> b!451145 (=> (not res!268612) (not e!264283))))

(assert (=> b!451145 (= res!268612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204809 mask!1025))))

(assert (=> b!451145 (= lt!204809 (array!27968 (store (arr!13429 _keys!709) i!563 k0!794) (size!13781 _keys!709)))))

(declare-fun b!451146 () Bool)

(declare-fun e!264287 () Bool)

(assert (=> b!451146 (= e!264287 tp_is_empty!12081)))

(declare-fun b!451147 () Bool)

(declare-fun res!268602 () Bool)

(assert (=> b!451147 (=> (not res!268602) (not e!264288))))

(assert (=> b!451147 (= res!268602 (or (= (select (arr!13429 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13429 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29819 () Bool)

(assert (=> bm!29819 (= call!29822 (getCurrentListMapNoExtraKeys!1655 (ite c!56021 _keys!709 lt!204809) (ite c!56021 _values!549 lt!204810) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19755 () Bool)

(declare-fun mapRes!19755 () Bool)

(declare-fun tp!38048 () Bool)

(assert (=> mapNonEmpty!19755 (= mapRes!19755 (and tp!38048 e!264287))))

(declare-fun mapValue!19755 () ValueCell!5697)

(declare-fun mapKey!19755 () (_ BitVec 32))

(declare-fun mapRest!19755 () (Array (_ BitVec 32) ValueCell!5697))

(assert (=> mapNonEmpty!19755 (= (arr!13430 _values!549) (store mapRest!19755 mapKey!19755 mapValue!19755))))

(declare-fun b!451148 () Bool)

(declare-fun e!264282 () Bool)

(assert (=> b!451148 (= e!264282 (and e!264285 mapRes!19755))))

(declare-fun condMapEmpty!19755 () Bool)

(declare-fun mapDefault!19755 () ValueCell!5697)

(assert (=> b!451148 (= condMapEmpty!19755 (= (arr!13430 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5697)) mapDefault!19755)))))

(declare-fun mapIsEmpty!19755 () Bool)

(assert (=> mapIsEmpty!19755 mapRes!19755))

(declare-fun b!451149 () Bool)

(assert (=> b!451149 (= e!264283 e!264290)))

(declare-fun res!268610 () Bool)

(assert (=> b!451149 (=> (not res!268610) (not e!264290))))

(assert (=> b!451149 (= res!268610 (= from!863 i!563))))

(declare-fun lt!204813 () ListLongMap!6911)

(assert (=> b!451149 (= lt!204813 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451149 (= lt!204810 (array!27970 (store (arr!13430 _values!549) i!563 (ValueCellFull!5697 v!412)) (size!13782 _values!549)))))

(declare-fun lt!204811 () ListLongMap!6911)

(assert (=> b!451149 (= lt!204811 (getCurrentListMapNoExtraKeys!1655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451150 () Bool)

(declare-fun res!268613 () Bool)

(assert (=> b!451150 (=> (not res!268613) (not e!264288))))

(assert (=> b!451150 (= res!268613 (and (= (size!13782 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13781 _keys!709) (size!13782 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451151 () Bool)

(declare-fun res!268614 () Bool)

(assert (=> b!451151 (=> (not res!268614) (not e!264288))))

(assert (=> b!451151 (= res!268614 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8060))))

(declare-fun b!451152 () Bool)

(declare-fun get!6609 (ValueCell!5697 V!17213) V!17213)

(declare-fun dynLambda!852 (Int (_ BitVec 64)) V!17213)

(assert (=> b!451152 (= e!264284 (= lt!204813 (+!1551 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!451138 () Bool)

(declare-fun res!268603 () Bool)

(assert (=> b!451138 (=> (not res!268603) (not e!264288))))

(assert (=> b!451138 (= res!268603 (validKeyInArray!0 k0!794))))

(declare-fun res!268611 () Bool)

(assert (=> start!40732 (=> (not res!268611) (not e!264288))))

(assert (=> start!40732 (= res!268611 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13781 _keys!709))))))

(assert (=> start!40732 e!264288))

(assert (=> start!40732 tp_is_empty!12081))

(assert (=> start!40732 tp!38049))

(assert (=> start!40732 true))

(declare-fun array_inv!9724 (array!27969) Bool)

(assert (=> start!40732 (and (array_inv!9724 _values!549) e!264282)))

(declare-fun array_inv!9725 (array!27967) Bool)

(assert (=> start!40732 (array_inv!9725 _keys!709)))

(assert (= (and start!40732 res!268611) b!451143))

(assert (= (and b!451143 res!268607) b!451150))

(assert (= (and b!451150 res!268613) b!451140))

(assert (= (and b!451140 res!268605) b!451151))

(assert (= (and b!451151 res!268614) b!451134))

(assert (= (and b!451134 res!268608) b!451138))

(assert (= (and b!451138 res!268603) b!451147))

(assert (= (and b!451147 res!268602) b!451142))

(assert (= (and b!451142 res!268609) b!451145))

(assert (= (and b!451145 res!268612) b!451141))

(assert (= (and b!451141 res!268606) b!451139))

(assert (= (and b!451139 res!268604) b!451149))

(assert (= (and b!451149 res!268610) b!451136))

(assert (= (and b!451136 c!56021) b!451137))

(assert (= (and b!451136 (not c!56021)) b!451135))

(assert (= (or b!451137 b!451135) bm!29818))

(assert (= (or b!451137 b!451135) bm!29819))

(assert (= (and b!451136 (not res!268601)) b!451152))

(assert (= (and b!451148 condMapEmpty!19755) mapIsEmpty!19755))

(assert (= (and b!451148 (not condMapEmpty!19755)) mapNonEmpty!19755))

(get-info :version)

(assert (= (and mapNonEmpty!19755 ((_ is ValueCellFull!5697) mapValue!19755)) b!451146))

(assert (= (and b!451148 ((_ is ValueCellFull!5697) mapDefault!19755)) b!451144))

(assert (= start!40732 b!451148))

(declare-fun b_lambda!9479 () Bool)

(assert (=> (not b_lambda!9479) (not b!451152)))

(declare-fun t!13827 () Bool)

(declare-fun tb!3723 () Bool)

(assert (=> (and start!40732 (= defaultEntry!557 defaultEntry!557) t!13827) tb!3723))

(declare-fun result!6981 () Bool)

(assert (=> tb!3723 (= result!6981 tp_is_empty!12081)))

(assert (=> b!451152 t!13827))

(declare-fun b_and!18755 () Bool)

(assert (= b_and!18753 (and (=> t!13827 result!6981) b_and!18755)))

(declare-fun m!434875 () Bool)

(assert (=> b!451140 m!434875))

(declare-fun m!434877 () Bool)

(assert (=> b!451138 m!434877))

(declare-fun m!434879 () Bool)

(assert (=> b!451136 m!434879))

(assert (=> b!451136 m!434879))

(declare-fun m!434881 () Bool)

(assert (=> b!451136 m!434881))

(declare-fun m!434883 () Bool)

(assert (=> b!451136 m!434883))

(declare-fun m!434885 () Bool)

(assert (=> b!451141 m!434885))

(declare-fun m!434887 () Bool)

(assert (=> b!451143 m!434887))

(declare-fun m!434889 () Bool)

(assert (=> b!451149 m!434889))

(declare-fun m!434891 () Bool)

(assert (=> b!451149 m!434891))

(declare-fun m!434893 () Bool)

(assert (=> b!451149 m!434893))

(declare-fun m!434895 () Bool)

(assert (=> b!451137 m!434895))

(declare-fun m!434897 () Bool)

(assert (=> start!40732 m!434897))

(declare-fun m!434899 () Bool)

(assert (=> start!40732 m!434899))

(declare-fun m!434901 () Bool)

(assert (=> b!451151 m!434901))

(declare-fun m!434903 () Bool)

(assert (=> b!451145 m!434903))

(declare-fun m!434905 () Bool)

(assert (=> b!451145 m!434905))

(declare-fun m!434907 () Bool)

(assert (=> b!451147 m!434907))

(declare-fun m!434909 () Bool)

(assert (=> bm!29818 m!434909))

(declare-fun m!434911 () Bool)

(assert (=> b!451142 m!434911))

(declare-fun m!434913 () Bool)

(assert (=> mapNonEmpty!19755 m!434913))

(declare-fun m!434915 () Bool)

(assert (=> b!451152 m!434915))

(declare-fun m!434917 () Bool)

(assert (=> b!451152 m!434917))

(declare-fun m!434919 () Bool)

(assert (=> b!451152 m!434919))

(assert (=> b!451152 m!434915))

(declare-fun m!434921 () Bool)

(assert (=> b!451152 m!434921))

(declare-fun m!434923 () Bool)

(assert (=> b!451152 m!434923))

(assert (=> b!451152 m!434919))

(assert (=> b!451152 m!434917))

(declare-fun m!434925 () Bool)

(assert (=> b!451152 m!434925))

(declare-fun m!434927 () Bool)

(assert (=> bm!29819 m!434927))

(check-sat (not b_next!10743) (not bm!29819) (not mapNonEmpty!19755) (not b!451143) (not b!451137) (not start!40732) (not b!451142) (not b!451145) (not b!451140) (not b!451141) (not b!451138) b_and!18755 (not bm!29818) (not b!451151) (not b!451136) tp_is_empty!12081 (not b!451152) (not b_lambda!9479) (not b!451149))
(check-sat b_and!18755 (not b_next!10743))
(get-model)

(declare-fun b_lambda!9483 () Bool)

(assert (= b_lambda!9479 (or (and start!40732 b_free!10743) b_lambda!9483)))

(check-sat (not b_next!10743) (not bm!29819) (not mapNonEmpty!19755) (not b_lambda!9483) (not b!451143) (not b!451137) (not start!40732) (not b!451149) (not b!451142) (not b!451145) (not b!451140) (not b!451141) (not b!451138) b_and!18755 (not bm!29818) (not b!451151) (not b!451136) tp_is_empty!12081 (not b!451152))
(check-sat b_and!18755 (not b_next!10743))
(get-model)

(declare-fun d!74263 () Bool)

(declare-fun res!268661 () Bool)

(declare-fun e!264322 () Bool)

(assert (=> d!74263 (=> res!268661 e!264322)))

(assert (=> d!74263 (= res!268661 (= (select (arr!13429 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74263 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!264322)))

(declare-fun b!451218 () Bool)

(declare-fun e!264323 () Bool)

(assert (=> b!451218 (= e!264322 e!264323)))

(declare-fun res!268662 () Bool)

(assert (=> b!451218 (=> (not res!268662) (not e!264323))))

(assert (=> b!451218 (= res!268662 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13781 _keys!709)))))

(declare-fun b!451219 () Bool)

(assert (=> b!451219 (= e!264323 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74263 (not res!268661)) b!451218))

(assert (= (and b!451218 res!268662) b!451219))

(declare-fun m!434983 () Bool)

(assert (=> d!74263 m!434983))

(declare-fun m!434985 () Bool)

(assert (=> b!451219 m!434985))

(assert (=> b!451142 d!74263))

(declare-fun b!451244 () Bool)

(declare-fun lt!204843 () ListLongMap!6911)

(declare-fun e!264342 () Bool)

(assert (=> b!451244 (= e!264342 (= lt!204843 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74265 () Bool)

(declare-fun e!264344 () Bool)

(assert (=> d!74265 e!264344))

(declare-fun res!268674 () Bool)

(assert (=> d!74265 (=> (not res!268674) (not e!264344))))

(declare-fun contains!2494 (ListLongMap!6911 (_ BitVec 64)) Bool)

(assert (=> d!74265 (= res!268674 (not (contains!2494 lt!204843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264343 () ListLongMap!6911)

(assert (=> d!74265 (= lt!204843 e!264343)))

(declare-fun c!56033 () Bool)

(assert (=> d!74265 (= c!56033 (bvsge from!863 (size!13781 lt!204809)))))

(assert (=> d!74265 (validMask!0 mask!1025)))

(assert (=> d!74265 (= (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!204843)))

(declare-fun b!451245 () Bool)

(declare-fun e!264339 () ListLongMap!6911)

(declare-fun call!29831 () ListLongMap!6911)

(assert (=> b!451245 (= e!264339 call!29831)))

(declare-fun b!451246 () Bool)

(declare-fun e!264338 () Bool)

(declare-fun e!264340 () Bool)

(assert (=> b!451246 (= e!264338 e!264340)))

(assert (=> b!451246 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13781 lt!204809)))))

(declare-fun res!268671 () Bool)

(assert (=> b!451246 (= res!268671 (contains!2494 lt!204843 (select (arr!13429 lt!204809) from!863)))))

(assert (=> b!451246 (=> (not res!268671) (not e!264340))))

(declare-fun b!451247 () Bool)

(declare-fun res!268672 () Bool)

(assert (=> b!451247 (=> (not res!268672) (not e!264344))))

(assert (=> b!451247 (= res!268672 (not (contains!2494 lt!204843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451248 () Bool)

(declare-fun e!264341 () Bool)

(assert (=> b!451248 (= e!264341 (validKeyInArray!0 (select (arr!13429 lt!204809) from!863)))))

(assert (=> b!451248 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!451249 () Bool)

(declare-fun lt!204848 () Unit!13208)

(declare-fun lt!204844 () Unit!13208)

(assert (=> b!451249 (= lt!204848 lt!204844)))

(declare-fun lt!204847 () V!17213)

(declare-fun lt!204845 () (_ BitVec 64))

(declare-fun lt!204849 () (_ BitVec 64))

(declare-fun lt!204846 () ListLongMap!6911)

(assert (=> b!451249 (not (contains!2494 (+!1551 lt!204846 (tuple2!7999 lt!204849 lt!204847)) lt!204845))))

(declare-fun addStillNotContains!145 (ListLongMap!6911 (_ BitVec 64) V!17213 (_ BitVec 64)) Unit!13208)

(assert (=> b!451249 (= lt!204844 (addStillNotContains!145 lt!204846 lt!204849 lt!204847 lt!204845))))

(assert (=> b!451249 (= lt!204845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451249 (= lt!204847 (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451249 (= lt!204849 (select (arr!13429 lt!204809) from!863))))

(assert (=> b!451249 (= lt!204846 call!29831)))

(assert (=> b!451249 (= e!264339 (+!1551 call!29831 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!29828 () Bool)

(assert (=> bm!29828 (= call!29831 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451250 () Bool)

(assert (=> b!451250 (= e!264343 (ListLongMap!6912 Nil!8059))))

(declare-fun b!451251 () Bool)

(assert (=> b!451251 (= e!264338 e!264342)))

(declare-fun c!56036 () Bool)

(assert (=> b!451251 (= c!56036 (bvslt from!863 (size!13781 lt!204809)))))

(declare-fun b!451252 () Bool)

(assert (=> b!451252 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13781 lt!204809)))))

(assert (=> b!451252 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13782 lt!204810)))))

(declare-fun apply!312 (ListLongMap!6911 (_ BitVec 64)) V!17213)

(assert (=> b!451252 (= e!264340 (= (apply!312 lt!204843 (select (arr!13429 lt!204809) from!863)) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451253 () Bool)

(assert (=> b!451253 (= e!264344 e!264338)))

(declare-fun c!56034 () Bool)

(assert (=> b!451253 (= c!56034 e!264341)))

(declare-fun res!268673 () Bool)

(assert (=> b!451253 (=> (not res!268673) (not e!264341))))

(assert (=> b!451253 (= res!268673 (bvslt from!863 (size!13781 lt!204809)))))

(declare-fun b!451254 () Bool)

(assert (=> b!451254 (= e!264343 e!264339)))

(declare-fun c!56035 () Bool)

(assert (=> b!451254 (= c!56035 (validKeyInArray!0 (select (arr!13429 lt!204809) from!863)))))

(declare-fun b!451255 () Bool)

(declare-fun isEmpty!558 (ListLongMap!6911) Bool)

(assert (=> b!451255 (= e!264342 (isEmpty!558 lt!204843))))

(assert (= (and d!74265 c!56033) b!451250))

(assert (= (and d!74265 (not c!56033)) b!451254))

(assert (= (and b!451254 c!56035) b!451249))

(assert (= (and b!451254 (not c!56035)) b!451245))

(assert (= (or b!451249 b!451245) bm!29828))

(assert (= (and d!74265 res!268674) b!451247))

(assert (= (and b!451247 res!268672) b!451253))

(assert (= (and b!451253 res!268673) b!451248))

(assert (= (and b!451253 c!56034) b!451246))

(assert (= (and b!451253 (not c!56034)) b!451251))

(assert (= (and b!451246 res!268671) b!451252))

(assert (= (and b!451251 c!56036) b!451244))

(assert (= (and b!451251 (not c!56036)) b!451255))

(declare-fun b_lambda!9485 () Bool)

(assert (=> (not b_lambda!9485) (not b!451249)))

(assert (=> b!451249 t!13827))

(declare-fun b_and!18761 () Bool)

(assert (= b_and!18755 (and (=> t!13827 result!6981) b_and!18761)))

(declare-fun b_lambda!9487 () Bool)

(assert (=> (not b_lambda!9487) (not b!451252)))

(assert (=> b!451252 t!13827))

(declare-fun b_and!18763 () Bool)

(assert (= b_and!18761 (and (=> t!13827 result!6981) b_and!18763)))

(assert (=> b!451246 m!434923))

(assert (=> b!451246 m!434923))

(declare-fun m!434987 () Bool)

(assert (=> b!451246 m!434987))

(declare-fun m!434989 () Bool)

(assert (=> b!451247 m!434989))

(assert (=> b!451254 m!434923))

(assert (=> b!451254 m!434923))

(declare-fun m!434991 () Bool)

(assert (=> b!451254 m!434991))

(declare-fun m!434993 () Bool)

(assert (=> bm!29828 m!434993))

(assert (=> b!451248 m!434923))

(assert (=> b!451248 m!434923))

(assert (=> b!451248 m!434991))

(declare-fun m!434995 () Bool)

(assert (=> b!451249 m!434995))

(assert (=> b!451249 m!434915))

(declare-fun m!434997 () Bool)

(assert (=> b!451249 m!434997))

(assert (=> b!451249 m!434919))

(assert (=> b!451249 m!434997))

(declare-fun m!434999 () Bool)

(assert (=> b!451249 m!434999))

(declare-fun m!435001 () Bool)

(assert (=> b!451249 m!435001))

(assert (=> b!451249 m!434923))

(assert (=> b!451249 m!434919))

(assert (=> b!451249 m!434915))

(assert (=> b!451249 m!434921))

(declare-fun m!435003 () Bool)

(assert (=> d!74265 m!435003))

(assert (=> d!74265 m!434887))

(assert (=> b!451244 m!434993))

(declare-fun m!435005 () Bool)

(assert (=> b!451255 m!435005))

(assert (=> b!451252 m!434915))

(assert (=> b!451252 m!434919))

(assert (=> b!451252 m!434923))

(declare-fun m!435007 () Bool)

(assert (=> b!451252 m!435007))

(assert (=> b!451252 m!434923))

(assert (=> b!451252 m!434919))

(assert (=> b!451252 m!434915))

(assert (=> b!451252 m!434921))

(assert (=> b!451149 d!74265))

(declare-fun e!264349 () Bool)

(declare-fun b!451256 () Bool)

(declare-fun lt!204850 () ListLongMap!6911)

(assert (=> b!451256 (= e!264349 (= lt!204850 (getCurrentListMapNoExtraKeys!1655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74267 () Bool)

(declare-fun e!264351 () Bool)

(assert (=> d!74267 e!264351))

(declare-fun res!268678 () Bool)

(assert (=> d!74267 (=> (not res!268678) (not e!264351))))

(assert (=> d!74267 (= res!268678 (not (contains!2494 lt!204850 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264350 () ListLongMap!6911)

(assert (=> d!74267 (= lt!204850 e!264350)))

(declare-fun c!56037 () Bool)

(assert (=> d!74267 (= c!56037 (bvsge from!863 (size!13781 _keys!709)))))

(assert (=> d!74267 (validMask!0 mask!1025)))

(assert (=> d!74267 (= (getCurrentListMapNoExtraKeys!1655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!204850)))

(declare-fun b!451257 () Bool)

(declare-fun e!264346 () ListLongMap!6911)

(declare-fun call!29832 () ListLongMap!6911)

(assert (=> b!451257 (= e!264346 call!29832)))

(declare-fun b!451258 () Bool)

(declare-fun e!264345 () Bool)

(declare-fun e!264347 () Bool)

(assert (=> b!451258 (= e!264345 e!264347)))

(assert (=> b!451258 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13781 _keys!709)))))

(declare-fun res!268675 () Bool)

(assert (=> b!451258 (= res!268675 (contains!2494 lt!204850 (select (arr!13429 _keys!709) from!863)))))

(assert (=> b!451258 (=> (not res!268675) (not e!264347))))

(declare-fun b!451259 () Bool)

(declare-fun res!268676 () Bool)

(assert (=> b!451259 (=> (not res!268676) (not e!264351))))

(assert (=> b!451259 (= res!268676 (not (contains!2494 lt!204850 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451260 () Bool)

(declare-fun e!264348 () Bool)

(assert (=> b!451260 (= e!264348 (validKeyInArray!0 (select (arr!13429 _keys!709) from!863)))))

(assert (=> b!451260 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!451261 () Bool)

(declare-fun lt!204855 () Unit!13208)

(declare-fun lt!204851 () Unit!13208)

(assert (=> b!451261 (= lt!204855 lt!204851)))

(declare-fun lt!204856 () (_ BitVec 64))

(declare-fun lt!204854 () V!17213)

(declare-fun lt!204852 () (_ BitVec 64))

(declare-fun lt!204853 () ListLongMap!6911)

(assert (=> b!451261 (not (contains!2494 (+!1551 lt!204853 (tuple2!7999 lt!204856 lt!204854)) lt!204852))))

(assert (=> b!451261 (= lt!204851 (addStillNotContains!145 lt!204853 lt!204856 lt!204854 lt!204852))))

(assert (=> b!451261 (= lt!204852 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451261 (= lt!204854 (get!6609 (select (arr!13430 _values!549) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451261 (= lt!204856 (select (arr!13429 _keys!709) from!863))))

(assert (=> b!451261 (= lt!204853 call!29832)))

(assert (=> b!451261 (= e!264346 (+!1551 call!29832 (tuple2!7999 (select (arr!13429 _keys!709) from!863) (get!6609 (select (arr!13430 _values!549) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!29829 () Bool)

(assert (=> bm!29829 (= call!29832 (getCurrentListMapNoExtraKeys!1655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451262 () Bool)

(assert (=> b!451262 (= e!264350 (ListLongMap!6912 Nil!8059))))

(declare-fun b!451263 () Bool)

(assert (=> b!451263 (= e!264345 e!264349)))

(declare-fun c!56040 () Bool)

(assert (=> b!451263 (= c!56040 (bvslt from!863 (size!13781 _keys!709)))))

(declare-fun b!451264 () Bool)

(assert (=> b!451264 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13781 _keys!709)))))

(assert (=> b!451264 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13782 _values!549)))))

(assert (=> b!451264 (= e!264347 (= (apply!312 lt!204850 (select (arr!13429 _keys!709) from!863)) (get!6609 (select (arr!13430 _values!549) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451265 () Bool)

(assert (=> b!451265 (= e!264351 e!264345)))

(declare-fun c!56038 () Bool)

(assert (=> b!451265 (= c!56038 e!264348)))

(declare-fun res!268677 () Bool)

(assert (=> b!451265 (=> (not res!268677) (not e!264348))))

(assert (=> b!451265 (= res!268677 (bvslt from!863 (size!13781 _keys!709)))))

(declare-fun b!451266 () Bool)

(assert (=> b!451266 (= e!264350 e!264346)))

(declare-fun c!56039 () Bool)

(assert (=> b!451266 (= c!56039 (validKeyInArray!0 (select (arr!13429 _keys!709) from!863)))))

(declare-fun b!451267 () Bool)

(assert (=> b!451267 (= e!264349 (isEmpty!558 lt!204850))))

(assert (= (and d!74267 c!56037) b!451262))

(assert (= (and d!74267 (not c!56037)) b!451266))

(assert (= (and b!451266 c!56039) b!451261))

(assert (= (and b!451266 (not c!56039)) b!451257))

(assert (= (or b!451261 b!451257) bm!29829))

(assert (= (and d!74267 res!268678) b!451259))

(assert (= (and b!451259 res!268676) b!451265))

(assert (= (and b!451265 res!268677) b!451260))

(assert (= (and b!451265 c!56038) b!451258))

(assert (= (and b!451265 (not c!56038)) b!451263))

(assert (= (and b!451258 res!268675) b!451264))

(assert (= (and b!451263 c!56040) b!451256))

(assert (= (and b!451263 (not c!56040)) b!451267))

(declare-fun b_lambda!9489 () Bool)

(assert (=> (not b_lambda!9489) (not b!451261)))

(assert (=> b!451261 t!13827))

(declare-fun b_and!18765 () Bool)

(assert (= b_and!18763 (and (=> t!13827 result!6981) b_and!18765)))

(declare-fun b_lambda!9491 () Bool)

(assert (=> (not b_lambda!9491) (not b!451264)))

(assert (=> b!451264 t!13827))

(declare-fun b_and!18767 () Bool)

(assert (= b_and!18765 (and (=> t!13827 result!6981) b_and!18767)))

(assert (=> b!451258 m!434879))

(assert (=> b!451258 m!434879))

(declare-fun m!435009 () Bool)

(assert (=> b!451258 m!435009))

(declare-fun m!435011 () Bool)

(assert (=> b!451259 m!435011))

(assert (=> b!451266 m!434879))

(assert (=> b!451266 m!434879))

(assert (=> b!451266 m!434881))

(declare-fun m!435013 () Bool)

(assert (=> bm!29829 m!435013))

(assert (=> b!451260 m!434879))

(assert (=> b!451260 m!434879))

(assert (=> b!451260 m!434881))

(declare-fun m!435015 () Bool)

(assert (=> b!451261 m!435015))

(assert (=> b!451261 m!434915))

(declare-fun m!435017 () Bool)

(assert (=> b!451261 m!435017))

(declare-fun m!435019 () Bool)

(assert (=> b!451261 m!435019))

(assert (=> b!451261 m!435017))

(declare-fun m!435021 () Bool)

(assert (=> b!451261 m!435021))

(declare-fun m!435023 () Bool)

(assert (=> b!451261 m!435023))

(assert (=> b!451261 m!434879))

(assert (=> b!451261 m!435019))

(assert (=> b!451261 m!434915))

(declare-fun m!435025 () Bool)

(assert (=> b!451261 m!435025))

(declare-fun m!435027 () Bool)

(assert (=> d!74267 m!435027))

(assert (=> d!74267 m!434887))

(assert (=> b!451256 m!435013))

(declare-fun m!435029 () Bool)

(assert (=> b!451267 m!435029))

(assert (=> b!451264 m!434915))

(assert (=> b!451264 m!435019))

(assert (=> b!451264 m!434879))

(declare-fun m!435031 () Bool)

(assert (=> b!451264 m!435031))

(assert (=> b!451264 m!434879))

(assert (=> b!451264 m!435019))

(assert (=> b!451264 m!434915))

(assert (=> b!451264 m!435025))

(assert (=> b!451149 d!74267))

(declare-fun b!451278 () Bool)

(declare-fun e!264361 () Bool)

(declare-fun call!29835 () Bool)

(assert (=> b!451278 (= e!264361 call!29835)))

(declare-fun bm!29832 () Bool)

(declare-fun c!56043 () Bool)

(assert (=> bm!29832 (= call!29835 (arrayNoDuplicates!0 lt!204809 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56043 (Cons!8059 (select (arr!13429 lt!204809) #b00000000000000000000000000000000) Nil!8060) Nil!8060)))))

(declare-fun d!74269 () Bool)

(declare-fun res!268686 () Bool)

(declare-fun e!264363 () Bool)

(assert (=> d!74269 (=> res!268686 e!264363)))

(assert (=> d!74269 (= res!268686 (bvsge #b00000000000000000000000000000000 (size!13781 lt!204809)))))

(assert (=> d!74269 (= (arrayNoDuplicates!0 lt!204809 #b00000000000000000000000000000000 Nil!8060) e!264363)))

(declare-fun b!451279 () Bool)

(assert (=> b!451279 (= e!264361 call!29835)))

(declare-fun b!451280 () Bool)

(declare-fun e!264362 () Bool)

(assert (=> b!451280 (= e!264362 e!264361)))

(assert (=> b!451280 (= c!56043 (validKeyInArray!0 (select (arr!13429 lt!204809) #b00000000000000000000000000000000)))))

(declare-fun b!451281 () Bool)

(declare-fun e!264360 () Bool)

(declare-fun contains!2495 (List!8063 (_ BitVec 64)) Bool)

(assert (=> b!451281 (= e!264360 (contains!2495 Nil!8060 (select (arr!13429 lt!204809) #b00000000000000000000000000000000)))))

(declare-fun b!451282 () Bool)

(assert (=> b!451282 (= e!264363 e!264362)))

(declare-fun res!268687 () Bool)

(assert (=> b!451282 (=> (not res!268687) (not e!264362))))

(assert (=> b!451282 (= res!268687 (not e!264360))))

(declare-fun res!268685 () Bool)

(assert (=> b!451282 (=> (not res!268685) (not e!264360))))

(assert (=> b!451282 (= res!268685 (validKeyInArray!0 (select (arr!13429 lt!204809) #b00000000000000000000000000000000)))))

(assert (= (and d!74269 (not res!268686)) b!451282))

(assert (= (and b!451282 res!268685) b!451281))

(assert (= (and b!451282 res!268687) b!451280))

(assert (= (and b!451280 c!56043) b!451278))

(assert (= (and b!451280 (not c!56043)) b!451279))

(assert (= (or b!451278 b!451279) bm!29832))

(declare-fun m!435033 () Bool)

(assert (=> bm!29832 m!435033))

(declare-fun m!435035 () Bool)

(assert (=> bm!29832 m!435035))

(assert (=> b!451280 m!435033))

(assert (=> b!451280 m!435033))

(declare-fun m!435037 () Bool)

(assert (=> b!451280 m!435037))

(assert (=> b!451281 m!435033))

(assert (=> b!451281 m!435033))

(declare-fun m!435039 () Bool)

(assert (=> b!451281 m!435039))

(assert (=> b!451282 m!435033))

(assert (=> b!451282 m!435033))

(assert (=> b!451282 m!435037))

(assert (=> b!451141 d!74269))

(declare-fun lt!204857 () ListLongMap!6911)

(declare-fun e!264368 () Bool)

(declare-fun b!451283 () Bool)

(assert (=> b!451283 (= e!264368 (= lt!204857 (getCurrentListMapNoExtraKeys!1655 (ite c!56021 lt!204809 _keys!709) (ite c!56021 lt!204810 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74271 () Bool)

(declare-fun e!264370 () Bool)

(assert (=> d!74271 e!264370))

(declare-fun res!268691 () Bool)

(assert (=> d!74271 (=> (not res!268691) (not e!264370))))

(assert (=> d!74271 (= res!268691 (not (contains!2494 lt!204857 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264369 () ListLongMap!6911)

(assert (=> d!74271 (= lt!204857 e!264369)))

(declare-fun c!56044 () Bool)

(assert (=> d!74271 (= c!56044 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 lt!204809 _keys!709))))))

(assert (=> d!74271 (validMask!0 mask!1025)))

(assert (=> d!74271 (= (getCurrentListMapNoExtraKeys!1655 (ite c!56021 lt!204809 _keys!709) (ite c!56021 lt!204810 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204857)))

(declare-fun b!451284 () Bool)

(declare-fun e!264365 () ListLongMap!6911)

(declare-fun call!29836 () ListLongMap!6911)

(assert (=> b!451284 (= e!264365 call!29836)))

(declare-fun b!451285 () Bool)

(declare-fun e!264364 () Bool)

(declare-fun e!264366 () Bool)

(assert (=> b!451285 (= e!264364 e!264366)))

(assert (=> b!451285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 lt!204809 _keys!709))))))

(declare-fun res!268688 () Bool)

(assert (=> b!451285 (= res!268688 (contains!2494 lt!204857 (select (arr!13429 (ite c!56021 lt!204809 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451285 (=> (not res!268688) (not e!264366))))

(declare-fun b!451286 () Bool)

(declare-fun res!268689 () Bool)

(assert (=> b!451286 (=> (not res!268689) (not e!264370))))

(assert (=> b!451286 (= res!268689 (not (contains!2494 lt!204857 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264367 () Bool)

(declare-fun b!451287 () Bool)

(assert (=> b!451287 (= e!264367 (validKeyInArray!0 (select (arr!13429 (ite c!56021 lt!204809 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451287 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!451288 () Bool)

(declare-fun lt!204862 () Unit!13208)

(declare-fun lt!204858 () Unit!13208)

(assert (=> b!451288 (= lt!204862 lt!204858)))

(declare-fun lt!204860 () ListLongMap!6911)

(declare-fun lt!204859 () (_ BitVec 64))

(declare-fun lt!204861 () V!17213)

(declare-fun lt!204863 () (_ BitVec 64))

(assert (=> b!451288 (not (contains!2494 (+!1551 lt!204860 (tuple2!7999 lt!204863 lt!204861)) lt!204859))))

(assert (=> b!451288 (= lt!204858 (addStillNotContains!145 lt!204860 lt!204863 lt!204861 lt!204859))))

(assert (=> b!451288 (= lt!204859 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451288 (= lt!204861 (get!6609 (select (arr!13430 (ite c!56021 lt!204810 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451288 (= lt!204863 (select (arr!13429 (ite c!56021 lt!204809 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!451288 (= lt!204860 call!29836)))

(assert (=> b!451288 (= e!264365 (+!1551 call!29836 (tuple2!7999 (select (arr!13429 (ite c!56021 lt!204809 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6609 (select (arr!13430 (ite c!56021 lt!204810 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!29833 () Bool)

(assert (=> bm!29833 (= call!29836 (getCurrentListMapNoExtraKeys!1655 (ite c!56021 lt!204809 _keys!709) (ite c!56021 lt!204810 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451289 () Bool)

(assert (=> b!451289 (= e!264369 (ListLongMap!6912 Nil!8059))))

(declare-fun b!451290 () Bool)

(assert (=> b!451290 (= e!264364 e!264368)))

(declare-fun c!56047 () Bool)

(assert (=> b!451290 (= c!56047 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 lt!204809 _keys!709))))))

(declare-fun b!451291 () Bool)

(assert (=> b!451291 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 lt!204809 _keys!709))))))

(assert (=> b!451291 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13782 (ite c!56021 lt!204810 _values!549))))))

(assert (=> b!451291 (= e!264366 (= (apply!312 lt!204857 (select (arr!13429 (ite c!56021 lt!204809 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6609 (select (arr!13430 (ite c!56021 lt!204810 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451292 () Bool)

(assert (=> b!451292 (= e!264370 e!264364)))

(declare-fun c!56045 () Bool)

(assert (=> b!451292 (= c!56045 e!264367)))

(declare-fun res!268690 () Bool)

(assert (=> b!451292 (=> (not res!268690) (not e!264367))))

(assert (=> b!451292 (= res!268690 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 lt!204809 _keys!709))))))

(declare-fun b!451293 () Bool)

(assert (=> b!451293 (= e!264369 e!264365)))

(declare-fun c!56046 () Bool)

(assert (=> b!451293 (= c!56046 (validKeyInArray!0 (select (arr!13429 (ite c!56021 lt!204809 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!451294 () Bool)

(assert (=> b!451294 (= e!264368 (isEmpty!558 lt!204857))))

(assert (= (and d!74271 c!56044) b!451289))

(assert (= (and d!74271 (not c!56044)) b!451293))

(assert (= (and b!451293 c!56046) b!451288))

(assert (= (and b!451293 (not c!56046)) b!451284))

(assert (= (or b!451288 b!451284) bm!29833))

(assert (= (and d!74271 res!268691) b!451286))

(assert (= (and b!451286 res!268689) b!451292))

(assert (= (and b!451292 res!268690) b!451287))

(assert (= (and b!451292 c!56045) b!451285))

(assert (= (and b!451292 (not c!56045)) b!451290))

(assert (= (and b!451285 res!268688) b!451291))

(assert (= (and b!451290 c!56047) b!451283))

(assert (= (and b!451290 (not c!56047)) b!451294))

(declare-fun b_lambda!9493 () Bool)

(assert (=> (not b_lambda!9493) (not b!451288)))

(assert (=> b!451288 t!13827))

(declare-fun b_and!18769 () Bool)

(assert (= b_and!18767 (and (=> t!13827 result!6981) b_and!18769)))

(declare-fun b_lambda!9495 () Bool)

(assert (=> (not b_lambda!9495) (not b!451291)))

(assert (=> b!451291 t!13827))

(declare-fun b_and!18771 () Bool)

(assert (= b_and!18769 (and (=> t!13827 result!6981) b_and!18771)))

(declare-fun m!435041 () Bool)

(assert (=> b!451285 m!435041))

(assert (=> b!451285 m!435041))

(declare-fun m!435043 () Bool)

(assert (=> b!451285 m!435043))

(declare-fun m!435045 () Bool)

(assert (=> b!451286 m!435045))

(assert (=> b!451293 m!435041))

(assert (=> b!451293 m!435041))

(declare-fun m!435047 () Bool)

(assert (=> b!451293 m!435047))

(declare-fun m!435049 () Bool)

(assert (=> bm!29833 m!435049))

(assert (=> b!451287 m!435041))

(assert (=> b!451287 m!435041))

(assert (=> b!451287 m!435047))

(declare-fun m!435051 () Bool)

(assert (=> b!451288 m!435051))

(assert (=> b!451288 m!434915))

(declare-fun m!435053 () Bool)

(assert (=> b!451288 m!435053))

(declare-fun m!435055 () Bool)

(assert (=> b!451288 m!435055))

(assert (=> b!451288 m!435053))

(declare-fun m!435057 () Bool)

(assert (=> b!451288 m!435057))

(declare-fun m!435059 () Bool)

(assert (=> b!451288 m!435059))

(assert (=> b!451288 m!435041))

(assert (=> b!451288 m!435055))

(assert (=> b!451288 m!434915))

(declare-fun m!435061 () Bool)

(assert (=> b!451288 m!435061))

(declare-fun m!435063 () Bool)

(assert (=> d!74271 m!435063))

(assert (=> d!74271 m!434887))

(assert (=> b!451283 m!435049))

(declare-fun m!435065 () Bool)

(assert (=> b!451294 m!435065))

(assert (=> b!451291 m!434915))

(assert (=> b!451291 m!435055))

(assert (=> b!451291 m!435041))

(declare-fun m!435067 () Bool)

(assert (=> b!451291 m!435067))

(assert (=> b!451291 m!435041))

(assert (=> b!451291 m!435055))

(assert (=> b!451291 m!434915))

(assert (=> b!451291 m!435061))

(assert (=> bm!29818 d!74271))

(declare-fun d!74273 () Bool)

(declare-fun e!264373 () Bool)

(assert (=> d!74273 e!264373))

(declare-fun res!268696 () Bool)

(assert (=> d!74273 (=> (not res!268696) (not e!264373))))

(declare-fun lt!204875 () ListLongMap!6911)

(assert (=> d!74273 (= res!268696 (contains!2494 lt!204875 (_1!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!204874 () List!8062)

(assert (=> d!74273 (= lt!204875 (ListLongMap!6912 lt!204874))))

(declare-fun lt!204872 () Unit!13208)

(declare-fun lt!204873 () Unit!13208)

(assert (=> d!74273 (= lt!204872 lt!204873)))

(declare-datatypes ((Option!375 0))(
  ( (Some!374 (v!8345 V!17213)) (None!373) )
))
(declare-fun getValueByKey!369 (List!8062 (_ BitVec 64)) Option!375)

(assert (=> d!74273 (= (getValueByKey!369 lt!204874 (_1!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!374 (_2!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!191 (List!8062 (_ BitVec 64) V!17213) Unit!13208)

(assert (=> d!74273 (= lt!204873 (lemmaContainsTupThenGetReturnValue!191 lt!204874 (_1!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!194 (List!8062 (_ BitVec 64) V!17213) List!8062)

(assert (=> d!74273 (= lt!204874 (insertStrictlySorted!194 (toList!3471 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557)) (_1!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74273 (= (+!1551 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!204875)))

(declare-fun b!451299 () Bool)

(declare-fun res!268697 () Bool)

(assert (=> b!451299 (=> (not res!268697) (not e!264373))))

(assert (=> b!451299 (= res!268697 (= (getValueByKey!369 (toList!3471 lt!204875) (_1!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!374 (_2!4010 (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!451300 () Bool)

(declare-fun contains!2496 (List!8062 tuple2!7998) Bool)

(assert (=> b!451300 (= e!264373 (contains!2496 (toList!3471 lt!204875) (tuple2!7999 (select (arr!13429 lt!204809) from!863) (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74273 res!268696) b!451299))

(assert (= (and b!451299 res!268697) b!451300))

(declare-fun m!435069 () Bool)

(assert (=> d!74273 m!435069))

(declare-fun m!435071 () Bool)

(assert (=> d!74273 m!435071))

(declare-fun m!435073 () Bool)

(assert (=> d!74273 m!435073))

(declare-fun m!435075 () Bool)

(assert (=> d!74273 m!435075))

(declare-fun m!435077 () Bool)

(assert (=> b!451299 m!435077))

(declare-fun m!435079 () Bool)

(assert (=> b!451300 m!435079))

(assert (=> b!451152 d!74273))

(declare-fun b!451301 () Bool)

(declare-fun e!264378 () Bool)

(declare-fun lt!204876 () ListLongMap!6911)

(assert (=> b!451301 (= e!264378 (= lt!204876 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74275 () Bool)

(declare-fun e!264380 () Bool)

(assert (=> d!74275 e!264380))

(declare-fun res!268701 () Bool)

(assert (=> d!74275 (=> (not res!268701) (not e!264380))))

(assert (=> d!74275 (= res!268701 (not (contains!2494 lt!204876 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264379 () ListLongMap!6911)

(assert (=> d!74275 (= lt!204876 e!264379)))

(declare-fun c!56048 () Bool)

(assert (=> d!74275 (= c!56048 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13781 lt!204809)))))

(assert (=> d!74275 (validMask!0 mask!1025)))

(assert (=> d!74275 (= (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204876)))

(declare-fun b!451302 () Bool)

(declare-fun e!264375 () ListLongMap!6911)

(declare-fun call!29837 () ListLongMap!6911)

(assert (=> b!451302 (= e!264375 call!29837)))

(declare-fun b!451303 () Bool)

(declare-fun e!264374 () Bool)

(declare-fun e!264376 () Bool)

(assert (=> b!451303 (= e!264374 e!264376)))

(assert (=> b!451303 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 lt!204809)))))

(declare-fun res!268698 () Bool)

(assert (=> b!451303 (= res!268698 (contains!2494 lt!204876 (select (arr!13429 lt!204809) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451303 (=> (not res!268698) (not e!264376))))

(declare-fun b!451304 () Bool)

(declare-fun res!268699 () Bool)

(assert (=> b!451304 (=> (not res!268699) (not e!264380))))

(assert (=> b!451304 (= res!268699 (not (contains!2494 lt!204876 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451305 () Bool)

(declare-fun e!264377 () Bool)

(assert (=> b!451305 (= e!264377 (validKeyInArray!0 (select (arr!13429 lt!204809) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451305 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!451306 () Bool)

(declare-fun lt!204881 () Unit!13208)

(declare-fun lt!204877 () Unit!13208)

(assert (=> b!451306 (= lt!204881 lt!204877)))

(declare-fun lt!204878 () (_ BitVec 64))

(declare-fun lt!204880 () V!17213)

(declare-fun lt!204882 () (_ BitVec 64))

(declare-fun lt!204879 () ListLongMap!6911)

(assert (=> b!451306 (not (contains!2494 (+!1551 lt!204879 (tuple2!7999 lt!204882 lt!204880)) lt!204878))))

(assert (=> b!451306 (= lt!204877 (addStillNotContains!145 lt!204879 lt!204882 lt!204880 lt!204878))))

(assert (=> b!451306 (= lt!204878 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451306 (= lt!204880 (get!6609 (select (arr!13430 lt!204810) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451306 (= lt!204882 (select (arr!13429 lt!204809) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!451306 (= lt!204879 call!29837)))

(assert (=> b!451306 (= e!264375 (+!1551 call!29837 (tuple2!7999 (select (arr!13429 lt!204809) (bvadd #b00000000000000000000000000000001 from!863)) (get!6609 (select (arr!13430 lt!204810) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!29834 () Bool)

(assert (=> bm!29834 (= call!29837 (getCurrentListMapNoExtraKeys!1655 lt!204809 lt!204810 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451307 () Bool)

(assert (=> b!451307 (= e!264379 (ListLongMap!6912 Nil!8059))))

(declare-fun b!451308 () Bool)

(assert (=> b!451308 (= e!264374 e!264378)))

(declare-fun c!56051 () Bool)

(assert (=> b!451308 (= c!56051 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 lt!204809)))))

(declare-fun b!451309 () Bool)

(assert (=> b!451309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 lt!204809)))))

(assert (=> b!451309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13782 lt!204810)))))

(assert (=> b!451309 (= e!264376 (= (apply!312 lt!204876 (select (arr!13429 lt!204809) (bvadd #b00000000000000000000000000000001 from!863))) (get!6609 (select (arr!13430 lt!204810) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451310 () Bool)

(assert (=> b!451310 (= e!264380 e!264374)))

(declare-fun c!56049 () Bool)

(assert (=> b!451310 (= c!56049 e!264377)))

(declare-fun res!268700 () Bool)

(assert (=> b!451310 (=> (not res!268700) (not e!264377))))

(assert (=> b!451310 (= res!268700 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 lt!204809)))))

(declare-fun b!451311 () Bool)

(assert (=> b!451311 (= e!264379 e!264375)))

(declare-fun c!56050 () Bool)

(assert (=> b!451311 (= c!56050 (validKeyInArray!0 (select (arr!13429 lt!204809) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!451312 () Bool)

(assert (=> b!451312 (= e!264378 (isEmpty!558 lt!204876))))

(assert (= (and d!74275 c!56048) b!451307))

(assert (= (and d!74275 (not c!56048)) b!451311))

(assert (= (and b!451311 c!56050) b!451306))

(assert (= (and b!451311 (not c!56050)) b!451302))

(assert (= (or b!451306 b!451302) bm!29834))

(assert (= (and d!74275 res!268701) b!451304))

(assert (= (and b!451304 res!268699) b!451310))

(assert (= (and b!451310 res!268700) b!451305))

(assert (= (and b!451310 c!56049) b!451303))

(assert (= (and b!451310 (not c!56049)) b!451308))

(assert (= (and b!451303 res!268698) b!451309))

(assert (= (and b!451308 c!56051) b!451301))

(assert (= (and b!451308 (not c!56051)) b!451312))

(declare-fun b_lambda!9497 () Bool)

(assert (=> (not b_lambda!9497) (not b!451306)))

(assert (=> b!451306 t!13827))

(declare-fun b_and!18773 () Bool)

(assert (= b_and!18771 (and (=> t!13827 result!6981) b_and!18773)))

(declare-fun b_lambda!9499 () Bool)

(assert (=> (not b_lambda!9499) (not b!451309)))

(assert (=> b!451309 t!13827))

(declare-fun b_and!18775 () Bool)

(assert (= b_and!18773 (and (=> t!13827 result!6981) b_and!18775)))

(declare-fun m!435081 () Bool)

(assert (=> b!451303 m!435081))

(assert (=> b!451303 m!435081))

(declare-fun m!435083 () Bool)

(assert (=> b!451303 m!435083))

(declare-fun m!435085 () Bool)

(assert (=> b!451304 m!435085))

(assert (=> b!451311 m!435081))

(assert (=> b!451311 m!435081))

(declare-fun m!435087 () Bool)

(assert (=> b!451311 m!435087))

(declare-fun m!435089 () Bool)

(assert (=> bm!29834 m!435089))

(assert (=> b!451305 m!435081))

(assert (=> b!451305 m!435081))

(assert (=> b!451305 m!435087))

(declare-fun m!435091 () Bool)

(assert (=> b!451306 m!435091))

(assert (=> b!451306 m!434915))

(declare-fun m!435093 () Bool)

(assert (=> b!451306 m!435093))

(declare-fun m!435095 () Bool)

(assert (=> b!451306 m!435095))

(assert (=> b!451306 m!435093))

(declare-fun m!435097 () Bool)

(assert (=> b!451306 m!435097))

(declare-fun m!435099 () Bool)

(assert (=> b!451306 m!435099))

(assert (=> b!451306 m!435081))

(assert (=> b!451306 m!435095))

(assert (=> b!451306 m!434915))

(declare-fun m!435101 () Bool)

(assert (=> b!451306 m!435101))

(declare-fun m!435103 () Bool)

(assert (=> d!74275 m!435103))

(assert (=> d!74275 m!434887))

(assert (=> b!451301 m!435089))

(declare-fun m!435105 () Bool)

(assert (=> b!451312 m!435105))

(assert (=> b!451309 m!434915))

(assert (=> b!451309 m!435095))

(assert (=> b!451309 m!435081))

(declare-fun m!435107 () Bool)

(assert (=> b!451309 m!435107))

(assert (=> b!451309 m!435081))

(assert (=> b!451309 m!435095))

(assert (=> b!451309 m!434915))

(assert (=> b!451309 m!435101))

(assert (=> b!451152 d!74275))

(declare-fun d!74277 () Bool)

(declare-fun c!56054 () Bool)

(assert (=> d!74277 (= c!56054 ((_ is ValueCellFull!5697) (select (arr!13430 lt!204810) from!863)))))

(declare-fun e!264383 () V!17213)

(assert (=> d!74277 (= (get!6609 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!264383)))

(declare-fun b!451317 () Bool)

(declare-fun get!6611 (ValueCell!5697 V!17213) V!17213)

(assert (=> b!451317 (= e!264383 (get!6611 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451318 () Bool)

(declare-fun get!6612 (ValueCell!5697 V!17213) V!17213)

(assert (=> b!451318 (= e!264383 (get!6612 (select (arr!13430 lt!204810) from!863) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74277 c!56054) b!451317))

(assert (= (and d!74277 (not c!56054)) b!451318))

(assert (=> b!451317 m!434919))

(assert (=> b!451317 m!434915))

(declare-fun m!435109 () Bool)

(assert (=> b!451317 m!435109))

(assert (=> b!451318 m!434919))

(assert (=> b!451318 m!434915))

(declare-fun m!435111 () Bool)

(assert (=> b!451318 m!435111))

(assert (=> b!451152 d!74277))

(declare-fun bm!29837 () Bool)

(declare-fun call!29840 () Bool)

(assert (=> bm!29837 (= call!29840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!204809 mask!1025))))

(declare-fun b!451327 () Bool)

(declare-fun e!264391 () Bool)

(assert (=> b!451327 (= e!264391 call!29840)))

(declare-fun b!451328 () Bool)

(declare-fun e!264392 () Bool)

(assert (=> b!451328 (= e!264392 call!29840)))

(declare-fun d!74279 () Bool)

(declare-fun res!268706 () Bool)

(declare-fun e!264390 () Bool)

(assert (=> d!74279 (=> res!268706 e!264390)))

(assert (=> d!74279 (= res!268706 (bvsge #b00000000000000000000000000000000 (size!13781 lt!204809)))))

(assert (=> d!74279 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204809 mask!1025) e!264390)))

(declare-fun b!451329 () Bool)

(assert (=> b!451329 (= e!264390 e!264392)))

(declare-fun c!56057 () Bool)

(assert (=> b!451329 (= c!56057 (validKeyInArray!0 (select (arr!13429 lt!204809) #b00000000000000000000000000000000)))))

(declare-fun b!451330 () Bool)

(assert (=> b!451330 (= e!264392 e!264391)))

(declare-fun lt!204889 () (_ BitVec 64))

(assert (=> b!451330 (= lt!204889 (select (arr!13429 lt!204809) #b00000000000000000000000000000000))))

(declare-fun lt!204890 () Unit!13208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27967 (_ BitVec 64) (_ BitVec 32)) Unit!13208)

(assert (=> b!451330 (= lt!204890 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!204809 lt!204889 #b00000000000000000000000000000000))))

(assert (=> b!451330 (arrayContainsKey!0 lt!204809 lt!204889 #b00000000000000000000000000000000)))

(declare-fun lt!204891 () Unit!13208)

(assert (=> b!451330 (= lt!204891 lt!204890)))

(declare-fun res!268707 () Bool)

(declare-datatypes ((SeekEntryResult!3531 0))(
  ( (MissingZero!3531 (index!16303 (_ BitVec 32))) (Found!3531 (index!16304 (_ BitVec 32))) (Intermediate!3531 (undefined!4343 Bool) (index!16305 (_ BitVec 32)) (x!42309 (_ BitVec 32))) (Undefined!3531) (MissingVacant!3531 (index!16306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27967 (_ BitVec 32)) SeekEntryResult!3531)

(assert (=> b!451330 (= res!268707 (= (seekEntryOrOpen!0 (select (arr!13429 lt!204809) #b00000000000000000000000000000000) lt!204809 mask!1025) (Found!3531 #b00000000000000000000000000000000)))))

(assert (=> b!451330 (=> (not res!268707) (not e!264391))))

(assert (= (and d!74279 (not res!268706)) b!451329))

(assert (= (and b!451329 c!56057) b!451330))

(assert (= (and b!451329 (not c!56057)) b!451328))

(assert (= (and b!451330 res!268707) b!451327))

(assert (= (or b!451327 b!451328) bm!29837))

(declare-fun m!435113 () Bool)

(assert (=> bm!29837 m!435113))

(assert (=> b!451329 m!435033))

(assert (=> b!451329 m!435033))

(assert (=> b!451329 m!435037))

(assert (=> b!451330 m!435033))

(declare-fun m!435115 () Bool)

(assert (=> b!451330 m!435115))

(declare-fun m!435117 () Bool)

(assert (=> b!451330 m!435117))

(assert (=> b!451330 m!435033))

(declare-fun m!435119 () Bool)

(assert (=> b!451330 m!435119))

(assert (=> b!451145 d!74279))

(declare-fun b!451331 () Bool)

(declare-fun e!264394 () Bool)

(declare-fun call!29841 () Bool)

(assert (=> b!451331 (= e!264394 call!29841)))

(declare-fun bm!29838 () Bool)

(declare-fun c!56058 () Bool)

(assert (=> bm!29838 (= call!29841 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56058 (Cons!8059 (select (arr!13429 _keys!709) #b00000000000000000000000000000000) Nil!8060) Nil!8060)))))

(declare-fun d!74281 () Bool)

(declare-fun res!268709 () Bool)

(declare-fun e!264396 () Bool)

(assert (=> d!74281 (=> res!268709 e!264396)))

(assert (=> d!74281 (= res!268709 (bvsge #b00000000000000000000000000000000 (size!13781 _keys!709)))))

(assert (=> d!74281 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8060) e!264396)))

(declare-fun b!451332 () Bool)

(assert (=> b!451332 (= e!264394 call!29841)))

(declare-fun b!451333 () Bool)

(declare-fun e!264395 () Bool)

(assert (=> b!451333 (= e!264395 e!264394)))

(assert (=> b!451333 (= c!56058 (validKeyInArray!0 (select (arr!13429 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!451334 () Bool)

(declare-fun e!264393 () Bool)

(assert (=> b!451334 (= e!264393 (contains!2495 Nil!8060 (select (arr!13429 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!451335 () Bool)

(assert (=> b!451335 (= e!264396 e!264395)))

(declare-fun res!268710 () Bool)

(assert (=> b!451335 (=> (not res!268710) (not e!264395))))

(assert (=> b!451335 (= res!268710 (not e!264393))))

(declare-fun res!268708 () Bool)

(assert (=> b!451335 (=> (not res!268708) (not e!264393))))

(assert (=> b!451335 (= res!268708 (validKeyInArray!0 (select (arr!13429 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74281 (not res!268709)) b!451335))

(assert (= (and b!451335 res!268708) b!451334))

(assert (= (and b!451335 res!268710) b!451333))

(assert (= (and b!451333 c!56058) b!451331))

(assert (= (and b!451333 (not c!56058)) b!451332))

(assert (= (or b!451331 b!451332) bm!29838))

(assert (=> bm!29838 m!434983))

(declare-fun m!435121 () Bool)

(assert (=> bm!29838 m!435121))

(assert (=> b!451333 m!434983))

(assert (=> b!451333 m!434983))

(declare-fun m!435123 () Bool)

(assert (=> b!451333 m!435123))

(assert (=> b!451334 m!434983))

(assert (=> b!451334 m!434983))

(declare-fun m!435125 () Bool)

(assert (=> b!451334 m!435125))

(assert (=> b!451335 m!434983))

(assert (=> b!451335 m!434983))

(assert (=> b!451335 m!435123))

(assert (=> b!451151 d!74281))

(declare-fun d!74283 () Bool)

(assert (=> d!74283 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!451143 d!74283))

(declare-fun b!451336 () Bool)

(declare-fun lt!204892 () ListLongMap!6911)

(declare-fun e!264401 () Bool)

(assert (=> b!451336 (= e!264401 (= lt!204892 (getCurrentListMapNoExtraKeys!1655 (ite c!56021 _keys!709 lt!204809) (ite c!56021 _values!549 lt!204810) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun d!74285 () Bool)

(declare-fun e!264403 () Bool)

(assert (=> d!74285 e!264403))

(declare-fun res!268714 () Bool)

(assert (=> d!74285 (=> (not res!268714) (not e!264403))))

(assert (=> d!74285 (= res!268714 (not (contains!2494 lt!204892 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264402 () ListLongMap!6911)

(assert (=> d!74285 (= lt!204892 e!264402)))

(declare-fun c!56059 () Bool)

(assert (=> d!74285 (= c!56059 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 _keys!709 lt!204809))))))

(assert (=> d!74285 (validMask!0 mask!1025)))

(assert (=> d!74285 (= (getCurrentListMapNoExtraKeys!1655 (ite c!56021 _keys!709 lt!204809) (ite c!56021 _values!549 lt!204810) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204892)))

(declare-fun b!451337 () Bool)

(declare-fun e!264398 () ListLongMap!6911)

(declare-fun call!29842 () ListLongMap!6911)

(assert (=> b!451337 (= e!264398 call!29842)))

(declare-fun b!451338 () Bool)

(declare-fun e!264397 () Bool)

(declare-fun e!264399 () Bool)

(assert (=> b!451338 (= e!264397 e!264399)))

(assert (=> b!451338 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 _keys!709 lt!204809))))))

(declare-fun res!268711 () Bool)

(assert (=> b!451338 (= res!268711 (contains!2494 lt!204892 (select (arr!13429 (ite c!56021 _keys!709 lt!204809)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451338 (=> (not res!268711) (not e!264399))))

(declare-fun b!451339 () Bool)

(declare-fun res!268712 () Bool)

(assert (=> b!451339 (=> (not res!268712) (not e!264403))))

(assert (=> b!451339 (= res!268712 (not (contains!2494 lt!204892 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264400 () Bool)

(declare-fun b!451340 () Bool)

(assert (=> b!451340 (= e!264400 (validKeyInArray!0 (select (arr!13429 (ite c!56021 _keys!709 lt!204809)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451340 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!451341 () Bool)

(declare-fun lt!204897 () Unit!13208)

(declare-fun lt!204893 () Unit!13208)

(assert (=> b!451341 (= lt!204897 lt!204893)))

(declare-fun lt!204896 () V!17213)

(declare-fun lt!204894 () (_ BitVec 64))

(declare-fun lt!204895 () ListLongMap!6911)

(declare-fun lt!204898 () (_ BitVec 64))

(assert (=> b!451341 (not (contains!2494 (+!1551 lt!204895 (tuple2!7999 lt!204898 lt!204896)) lt!204894))))

(assert (=> b!451341 (= lt!204893 (addStillNotContains!145 lt!204895 lt!204898 lt!204896 lt!204894))))

(assert (=> b!451341 (= lt!204894 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451341 (= lt!204896 (get!6609 (select (arr!13430 (ite c!56021 _values!549 lt!204810)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451341 (= lt!204898 (select (arr!13429 (ite c!56021 _keys!709 lt!204809)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!451341 (= lt!204895 call!29842)))

(assert (=> b!451341 (= e!264398 (+!1551 call!29842 (tuple2!7999 (select (arr!13429 (ite c!56021 _keys!709 lt!204809)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6609 (select (arr!13430 (ite c!56021 _values!549 lt!204810)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!29839 () Bool)

(assert (=> bm!29839 (= call!29842 (getCurrentListMapNoExtraKeys!1655 (ite c!56021 _keys!709 lt!204809) (ite c!56021 _values!549 lt!204810) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451342 () Bool)

(assert (=> b!451342 (= e!264402 (ListLongMap!6912 Nil!8059))))

(declare-fun b!451343 () Bool)

(assert (=> b!451343 (= e!264397 e!264401)))

(declare-fun c!56062 () Bool)

(assert (=> b!451343 (= c!56062 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 _keys!709 lt!204809))))))

(declare-fun b!451344 () Bool)

(assert (=> b!451344 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 _keys!709 lt!204809))))))

(assert (=> b!451344 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13782 (ite c!56021 _values!549 lt!204810))))))

(assert (=> b!451344 (= e!264399 (= (apply!312 lt!204892 (select (arr!13429 (ite c!56021 _keys!709 lt!204809)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6609 (select (arr!13430 (ite c!56021 _values!549 lt!204810)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!852 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451345 () Bool)

(assert (=> b!451345 (= e!264403 e!264397)))

(declare-fun c!56060 () Bool)

(assert (=> b!451345 (= c!56060 e!264400)))

(declare-fun res!268713 () Bool)

(assert (=> b!451345 (=> (not res!268713) (not e!264400))))

(assert (=> b!451345 (= res!268713 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13781 (ite c!56021 _keys!709 lt!204809))))))

(declare-fun b!451346 () Bool)

(assert (=> b!451346 (= e!264402 e!264398)))

(declare-fun c!56061 () Bool)

(assert (=> b!451346 (= c!56061 (validKeyInArray!0 (select (arr!13429 (ite c!56021 _keys!709 lt!204809)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!451347 () Bool)

(assert (=> b!451347 (= e!264401 (isEmpty!558 lt!204892))))

(assert (= (and d!74285 c!56059) b!451342))

(assert (= (and d!74285 (not c!56059)) b!451346))

(assert (= (and b!451346 c!56061) b!451341))

(assert (= (and b!451346 (not c!56061)) b!451337))

(assert (= (or b!451341 b!451337) bm!29839))

(assert (= (and d!74285 res!268714) b!451339))

(assert (= (and b!451339 res!268712) b!451345))

(assert (= (and b!451345 res!268713) b!451340))

(assert (= (and b!451345 c!56060) b!451338))

(assert (= (and b!451345 (not c!56060)) b!451343))

(assert (= (and b!451338 res!268711) b!451344))

(assert (= (and b!451343 c!56062) b!451336))

(assert (= (and b!451343 (not c!56062)) b!451347))

(declare-fun b_lambda!9501 () Bool)

(assert (=> (not b_lambda!9501) (not b!451341)))

(assert (=> b!451341 t!13827))

(declare-fun b_and!18777 () Bool)

(assert (= b_and!18775 (and (=> t!13827 result!6981) b_and!18777)))

(declare-fun b_lambda!9503 () Bool)

(assert (=> (not b_lambda!9503) (not b!451344)))

(assert (=> b!451344 t!13827))

(declare-fun b_and!18779 () Bool)

(assert (= b_and!18777 (and (=> t!13827 result!6981) b_and!18779)))

(declare-fun m!435127 () Bool)

(assert (=> b!451338 m!435127))

(assert (=> b!451338 m!435127))

(declare-fun m!435129 () Bool)

(assert (=> b!451338 m!435129))

(declare-fun m!435131 () Bool)

(assert (=> b!451339 m!435131))

(assert (=> b!451346 m!435127))

(assert (=> b!451346 m!435127))

(declare-fun m!435133 () Bool)

(assert (=> b!451346 m!435133))

(declare-fun m!435135 () Bool)

(assert (=> bm!29839 m!435135))

(assert (=> b!451340 m!435127))

(assert (=> b!451340 m!435127))

(assert (=> b!451340 m!435133))

(declare-fun m!435137 () Bool)

(assert (=> b!451341 m!435137))

(assert (=> b!451341 m!434915))

(declare-fun m!435139 () Bool)

(assert (=> b!451341 m!435139))

(declare-fun m!435141 () Bool)

(assert (=> b!451341 m!435141))

(assert (=> b!451341 m!435139))

(declare-fun m!435143 () Bool)

(assert (=> b!451341 m!435143))

(declare-fun m!435145 () Bool)

(assert (=> b!451341 m!435145))

(assert (=> b!451341 m!435127))

(assert (=> b!451341 m!435141))

(assert (=> b!451341 m!434915))

(declare-fun m!435147 () Bool)

(assert (=> b!451341 m!435147))

(declare-fun m!435149 () Bool)

(assert (=> d!74285 m!435149))

(assert (=> d!74285 m!434887))

(assert (=> b!451336 m!435135))

(declare-fun m!435151 () Bool)

(assert (=> b!451347 m!435151))

(assert (=> b!451344 m!434915))

(assert (=> b!451344 m!435141))

(assert (=> b!451344 m!435127))

(declare-fun m!435153 () Bool)

(assert (=> b!451344 m!435153))

(assert (=> b!451344 m!435127))

(assert (=> b!451344 m!435141))

(assert (=> b!451344 m!434915))

(assert (=> b!451344 m!435147))

(assert (=> bm!29819 d!74285))

(declare-fun d!74287 () Bool)

(declare-fun e!264404 () Bool)

(assert (=> d!74287 e!264404))

(declare-fun res!268715 () Bool)

(assert (=> d!74287 (=> (not res!268715) (not e!264404))))

(declare-fun lt!204902 () ListLongMap!6911)

(assert (=> d!74287 (= res!268715 (contains!2494 lt!204902 (_1!4010 (tuple2!7999 k0!794 v!412))))))

(declare-fun lt!204901 () List!8062)

(assert (=> d!74287 (= lt!204902 (ListLongMap!6912 lt!204901))))

(declare-fun lt!204899 () Unit!13208)

(declare-fun lt!204900 () Unit!13208)

(assert (=> d!74287 (= lt!204899 lt!204900)))

(assert (=> d!74287 (= (getValueByKey!369 lt!204901 (_1!4010 (tuple2!7999 k0!794 v!412))) (Some!374 (_2!4010 (tuple2!7999 k0!794 v!412))))))

(assert (=> d!74287 (= lt!204900 (lemmaContainsTupThenGetReturnValue!191 lt!204901 (_1!4010 (tuple2!7999 k0!794 v!412)) (_2!4010 (tuple2!7999 k0!794 v!412))))))

(assert (=> d!74287 (= lt!204901 (insertStrictlySorted!194 (toList!3471 call!29822) (_1!4010 (tuple2!7999 k0!794 v!412)) (_2!4010 (tuple2!7999 k0!794 v!412))))))

(assert (=> d!74287 (= (+!1551 call!29822 (tuple2!7999 k0!794 v!412)) lt!204902)))

(declare-fun b!451348 () Bool)

(declare-fun res!268716 () Bool)

(assert (=> b!451348 (=> (not res!268716) (not e!264404))))

(assert (=> b!451348 (= res!268716 (= (getValueByKey!369 (toList!3471 lt!204902) (_1!4010 (tuple2!7999 k0!794 v!412))) (Some!374 (_2!4010 (tuple2!7999 k0!794 v!412)))))))

(declare-fun b!451349 () Bool)

(assert (=> b!451349 (= e!264404 (contains!2496 (toList!3471 lt!204902) (tuple2!7999 k0!794 v!412)))))

(assert (= (and d!74287 res!268715) b!451348))

(assert (= (and b!451348 res!268716) b!451349))

(declare-fun m!435155 () Bool)

(assert (=> d!74287 m!435155))

(declare-fun m!435157 () Bool)

(assert (=> d!74287 m!435157))

(declare-fun m!435159 () Bool)

(assert (=> d!74287 m!435159))

(declare-fun m!435161 () Bool)

(assert (=> d!74287 m!435161))

(declare-fun m!435163 () Bool)

(assert (=> b!451348 m!435163))

(declare-fun m!435165 () Bool)

(assert (=> b!451349 m!435165))

(assert (=> b!451137 d!74287))

(declare-fun d!74289 () Bool)

(assert (=> d!74289 (= (validKeyInArray!0 (select (arr!13429 _keys!709) from!863)) (and (not (= (select (arr!13429 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13429 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!451136 d!74289))

(declare-fun b!451356 () Bool)

(declare-fun e!264409 () Bool)

(declare-fun call!29848 () ListLongMap!6911)

(declare-fun call!29847 () ListLongMap!6911)

(assert (=> b!451356 (= e!264409 (= call!29848 call!29847))))

(declare-fun bm!29844 () Bool)

(assert (=> bm!29844 (= call!29847 (getCurrentListMapNoExtraKeys!1655 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!74291 () Bool)

(declare-fun e!264410 () Bool)

(assert (=> d!74291 e!264410))

(declare-fun res!268719 () Bool)

(assert (=> d!74291 (=> (not res!268719) (not e!264410))))

(assert (=> d!74291 (= res!268719 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13781 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13782 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13781 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13782 _values!549))))))))

(declare-fun lt!204905 () Unit!13208)

(declare-fun choose!1326 (array!27967 array!27969 (_ BitVec 32) (_ BitVec 32) V!17213 V!17213 (_ BitVec 32) (_ BitVec 64) V!17213 (_ BitVec 32) Int) Unit!13208)

(assert (=> d!74291 (= lt!204905 (choose!1326 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74291 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13781 _keys!709)))))

(assert (=> d!74291 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!719 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204905)))

(declare-fun b!451357 () Bool)

(assert (=> b!451357 (= e!264409 (= call!29848 (+!1551 call!29847 (tuple2!7999 k0!794 v!412))))))

(declare-fun b!451358 () Bool)

(assert (=> b!451358 (= e!264410 e!264409)))

(declare-fun c!56065 () Bool)

(assert (=> b!451358 (= c!56065 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun bm!29845 () Bool)

(assert (=> bm!29845 (= call!29848 (getCurrentListMapNoExtraKeys!1655 (array!27968 (store (arr!13429 _keys!709) i!563 k0!794) (size!13781 _keys!709)) (array!27970 (store (arr!13430 _values!549) i!563 (ValueCellFull!5697 v!412)) (size!13782 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74291 res!268719) b!451358))

(assert (= (and b!451358 c!56065) b!451357))

(assert (= (and b!451358 (not c!56065)) b!451356))

(assert (= (or b!451357 b!451356) bm!29844))

(assert (= (or b!451357 b!451356) bm!29845))

(declare-fun m!435167 () Bool)

(assert (=> bm!29844 m!435167))

(declare-fun m!435169 () Bool)

(assert (=> d!74291 m!435169))

(declare-fun m!435171 () Bool)

(assert (=> b!451357 m!435171))

(assert (=> bm!29845 m!434905))

(assert (=> bm!29845 m!434891))

(declare-fun m!435173 () Bool)

(assert (=> bm!29845 m!435173))

(assert (=> b!451136 d!74291))

(declare-fun bm!29846 () Bool)

(declare-fun call!29849 () Bool)

(assert (=> bm!29846 (= call!29849 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!451359 () Bool)

(declare-fun e!264412 () Bool)

(assert (=> b!451359 (= e!264412 call!29849)))

(declare-fun b!451360 () Bool)

(declare-fun e!264413 () Bool)

(assert (=> b!451360 (= e!264413 call!29849)))

(declare-fun d!74293 () Bool)

(declare-fun res!268720 () Bool)

(declare-fun e!264411 () Bool)

(assert (=> d!74293 (=> res!268720 e!264411)))

(assert (=> d!74293 (= res!268720 (bvsge #b00000000000000000000000000000000 (size!13781 _keys!709)))))

(assert (=> d!74293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!264411)))

(declare-fun b!451361 () Bool)

(assert (=> b!451361 (= e!264411 e!264413)))

(declare-fun c!56066 () Bool)

(assert (=> b!451361 (= c!56066 (validKeyInArray!0 (select (arr!13429 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!451362 () Bool)

(assert (=> b!451362 (= e!264413 e!264412)))

(declare-fun lt!204906 () (_ BitVec 64))

(assert (=> b!451362 (= lt!204906 (select (arr!13429 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!204907 () Unit!13208)

(assert (=> b!451362 (= lt!204907 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!204906 #b00000000000000000000000000000000))))

(assert (=> b!451362 (arrayContainsKey!0 _keys!709 lt!204906 #b00000000000000000000000000000000)))

(declare-fun lt!204908 () Unit!13208)

(assert (=> b!451362 (= lt!204908 lt!204907)))

(declare-fun res!268721 () Bool)

(assert (=> b!451362 (= res!268721 (= (seekEntryOrOpen!0 (select (arr!13429 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3531 #b00000000000000000000000000000000)))))

(assert (=> b!451362 (=> (not res!268721) (not e!264412))))

(assert (= (and d!74293 (not res!268720)) b!451361))

(assert (= (and b!451361 c!56066) b!451362))

(assert (= (and b!451361 (not c!56066)) b!451360))

(assert (= (and b!451362 res!268721) b!451359))

(assert (= (or b!451359 b!451360) bm!29846))

(declare-fun m!435175 () Bool)

(assert (=> bm!29846 m!435175))

(assert (=> b!451361 m!434983))

(assert (=> b!451361 m!434983))

(assert (=> b!451361 m!435123))

(assert (=> b!451362 m!434983))

(declare-fun m!435177 () Bool)

(assert (=> b!451362 m!435177))

(declare-fun m!435179 () Bool)

(assert (=> b!451362 m!435179))

(assert (=> b!451362 m!434983))

(declare-fun m!435181 () Bool)

(assert (=> b!451362 m!435181))

(assert (=> b!451140 d!74293))

(declare-fun d!74295 () Bool)

(assert (=> d!74295 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!451138 d!74295))

(declare-fun d!74297 () Bool)

(assert (=> d!74297 (= (array_inv!9724 _values!549) (bvsge (size!13782 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40732 d!74297))

(declare-fun d!74299 () Bool)

(assert (=> d!74299 (= (array_inv!9725 _keys!709) (bvsge (size!13781 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40732 d!74299))

(declare-fun condMapEmpty!19761 () Bool)

(declare-fun mapDefault!19761 () ValueCell!5697)

(assert (=> mapNonEmpty!19755 (= condMapEmpty!19761 (= mapRest!19755 ((as const (Array (_ BitVec 32) ValueCell!5697)) mapDefault!19761)))))

(declare-fun e!264419 () Bool)

(declare-fun mapRes!19761 () Bool)

(assert (=> mapNonEmpty!19755 (= tp!38048 (and e!264419 mapRes!19761))))

(declare-fun b!451370 () Bool)

(assert (=> b!451370 (= e!264419 tp_is_empty!12081)))

(declare-fun mapIsEmpty!19761 () Bool)

(assert (=> mapIsEmpty!19761 mapRes!19761))

(declare-fun b!451369 () Bool)

(declare-fun e!264418 () Bool)

(assert (=> b!451369 (= e!264418 tp_is_empty!12081)))

(declare-fun mapNonEmpty!19761 () Bool)

(declare-fun tp!38058 () Bool)

(assert (=> mapNonEmpty!19761 (= mapRes!19761 (and tp!38058 e!264418))))

(declare-fun mapValue!19761 () ValueCell!5697)

(declare-fun mapRest!19761 () (Array (_ BitVec 32) ValueCell!5697))

(declare-fun mapKey!19761 () (_ BitVec 32))

(assert (=> mapNonEmpty!19761 (= mapRest!19755 (store mapRest!19761 mapKey!19761 mapValue!19761))))

(assert (= (and mapNonEmpty!19755 condMapEmpty!19761) mapIsEmpty!19761))

(assert (= (and mapNonEmpty!19755 (not condMapEmpty!19761)) mapNonEmpty!19761))

(assert (= (and mapNonEmpty!19761 ((_ is ValueCellFull!5697) mapValue!19761)) b!451369))

(assert (= (and mapNonEmpty!19755 ((_ is ValueCellFull!5697) mapDefault!19761)) b!451370))

(declare-fun m!435183 () Bool)

(assert (=> mapNonEmpty!19761 m!435183))

(declare-fun b_lambda!9505 () Bool)

(assert (= b_lambda!9487 (or (and start!40732 b_free!10743) b_lambda!9505)))

(declare-fun b_lambda!9507 () Bool)

(assert (= b_lambda!9503 (or (and start!40732 b_free!10743) b_lambda!9507)))

(declare-fun b_lambda!9509 () Bool)

(assert (= b_lambda!9491 (or (and start!40732 b_free!10743) b_lambda!9509)))

(declare-fun b_lambda!9511 () Bool)

(assert (= b_lambda!9485 (or (and start!40732 b_free!10743) b_lambda!9511)))

(declare-fun b_lambda!9513 () Bool)

(assert (= b_lambda!9489 (or (and start!40732 b_free!10743) b_lambda!9513)))

(declare-fun b_lambda!9515 () Bool)

(assert (= b_lambda!9495 (or (and start!40732 b_free!10743) b_lambda!9515)))

(declare-fun b_lambda!9517 () Bool)

(assert (= b_lambda!9501 (or (and start!40732 b_free!10743) b_lambda!9517)))

(declare-fun b_lambda!9519 () Bool)

(assert (= b_lambda!9499 (or (and start!40732 b_free!10743) b_lambda!9519)))

(declare-fun b_lambda!9521 () Bool)

(assert (= b_lambda!9497 (or (and start!40732 b_free!10743) b_lambda!9521)))

(declare-fun b_lambda!9523 () Bool)

(assert (= b_lambda!9493 (or (and start!40732 b_free!10743) b_lambda!9523)))

(check-sat (not b!451300) (not b_lambda!9505) (not b!451252) (not d!74271) (not b_lambda!9517) (not b!451282) (not b_next!10743) (not d!74267) (not b!451283) (not b!451317) (not b_lambda!9507) (not b!451349) (not b!451255) (not b!451294) (not b!451336) (not d!74275) (not b_lambda!9509) (not b_lambda!9483) (not b!451338) (not b!451244) (not b!451256) (not b!451329) (not b!451266) (not b!451361) (not b!451301) (not b!451362) (not b!451293) (not b!451333) (not d!74273) (not b!451259) (not b!451288) (not mapNonEmpty!19761) (not b!451334) (not bm!29844) (not bm!29839) (not bm!29838) (not d!74287) (not b!451280) (not d!74291) (not bm!29833) (not b_lambda!9519) (not b!451312) (not b_lambda!9523) (not b_lambda!9515) (not b!451281) (not b!451311) (not b!451254) (not b!451260) (not bm!29845) (not b!451305) (not b!451335) (not b!451344) (not b!451287) (not b!451330) (not b!451341) (not bm!29834) (not b!451285) (not b!451357) (not b!451286) (not b!451347) (not b!451318) (not d!74265) (not d!74285) (not bm!29829) (not b!451348) (not b!451309) (not b!451246) (not bm!29837) (not b!451267) tp_is_empty!12081 b_and!18779 (not b!451248) (not b!451303) (not b!451258) (not b!451261) (not b!451346) (not b_lambda!9521) (not b!451219) (not b!451304) (not b!451339) (not b!451299) (not bm!29832) (not b_lambda!9513) (not bm!29846) (not b!451340) (not bm!29828) (not b!451291) (not b!451306) (not b!451264) (not b!451247) (not b_lambda!9511) (not b!451249))
(check-sat b_and!18779 (not b_next!10743))
