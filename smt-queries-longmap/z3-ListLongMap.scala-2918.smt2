; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41650 () Bool)

(assert start!41650)

(declare-fun b_free!11317 () Bool)

(declare-fun b_next!11317 () Bool)

(assert (=> start!41650 (= b_free!11317 (not b_next!11317))))

(declare-fun tp!39952 () Bool)

(declare-fun b_and!19639 () Bool)

(assert (=> start!41650 (= tp!39952 b_and!19639)))

(declare-fun b!464989 () Bool)

(declare-fun e!271708 () Bool)

(declare-fun tp_is_empty!12745 () Bool)

(assert (=> b!464989 (= e!271708 tp_is_empty!12745)))

(declare-fun b!464990 () Bool)

(declare-fun e!271704 () Bool)

(assert (=> b!464990 (= e!271704 tp_is_empty!12745)))

(declare-fun b!464991 () Bool)

(declare-fun res!277997 () Bool)

(declare-fun e!271707 () Bool)

(assert (=> b!464991 (=> (not res!277997) (not e!271707))))

(declare-datatypes ((array!29271 0))(
  ( (array!29272 (arr!14066 (Array (_ BitVec 32) (_ BitVec 64))) (size!14419 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29271)

(declare-datatypes ((List!8534 0))(
  ( (Nil!8531) (Cons!8530 (h!9386 (_ BitVec 64)) (t!14473 List!8534)) )
))
(declare-fun arrayNoDuplicates!0 (array!29271 (_ BitVec 32) List!8534) Bool)

(assert (=> b!464991 (= res!277997 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8531))))

(declare-fun b!464992 () Bool)

(declare-fun e!271705 () Bool)

(declare-fun mapRes!20797 () Bool)

(assert (=> b!464992 (= e!271705 (and e!271708 mapRes!20797))))

(declare-fun condMapEmpty!20797 () Bool)

(declare-datatypes ((V!18099 0))(
  ( (V!18100 (val!6417 Int)) )
))
(declare-datatypes ((ValueCell!6029 0))(
  ( (ValueCellFull!6029 (v!8698 V!18099)) (EmptyCell!6029) )
))
(declare-datatypes ((array!29273 0))(
  ( (array!29274 (arr!14067 (Array (_ BitVec 32) ValueCell!6029)) (size!14420 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29273)

(declare-fun mapDefault!20797 () ValueCell!6029)

(assert (=> b!464992 (= condMapEmpty!20797 (= (arr!14067 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6029)) mapDefault!20797)))))

(declare-fun b!464993 () Bool)

(declare-fun res!277996 () Bool)

(assert (=> b!464993 (=> (not res!277996) (not e!271707))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29271 (_ BitVec 32)) Bool)

(assert (=> b!464993 (= res!277996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464994 () Bool)

(declare-fun res!277995 () Bool)

(assert (=> b!464994 (=> (not res!277995) (not e!271707))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464994 (= res!277995 (and (= (size!14420 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14419 _keys!1025) (size!14420 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20797 () Bool)

(declare-fun tp!39951 () Bool)

(assert (=> mapNonEmpty!20797 (= mapRes!20797 (and tp!39951 e!271704))))

(declare-fun mapValue!20797 () ValueCell!6029)

(declare-fun mapKey!20797 () (_ BitVec 32))

(declare-fun mapRest!20797 () (Array (_ BitVec 32) ValueCell!6029))

(assert (=> mapNonEmpty!20797 (= (arr!14067 _values!833) (store mapRest!20797 mapKey!20797 mapValue!20797))))

(declare-fun res!277998 () Bool)

(assert (=> start!41650 (=> (not res!277998) (not e!271707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41650 (= res!277998 (validMask!0 mask!1365))))

(assert (=> start!41650 e!271707))

(assert (=> start!41650 tp_is_empty!12745))

(assert (=> start!41650 tp!39952))

(assert (=> start!41650 true))

(declare-fun array_inv!10244 (array!29271) Bool)

(assert (=> start!41650 (array_inv!10244 _keys!1025)))

(declare-fun array_inv!10245 (array!29273) Bool)

(assert (=> start!41650 (and (array_inv!10245 _values!833) e!271705)))

(declare-fun b!464995 () Bool)

(assert (=> b!464995 (= e!271707 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14419 _keys!1025)))))))

(declare-datatypes ((tuple2!8446 0))(
  ( (tuple2!8447 (_1!4234 (_ BitVec 64)) (_2!4234 V!18099)) )
))
(declare-datatypes ((List!8535 0))(
  ( (Nil!8532) (Cons!8531 (h!9387 tuple2!8446) (t!14474 List!8535)) )
))
(declare-datatypes ((ListLongMap!7349 0))(
  ( (ListLongMap!7350 (toList!3690 List!8535)) )
))
(declare-fun lt!209837 () ListLongMap!7349)

(declare-fun lt!209838 () ListLongMap!7349)

(assert (=> b!464995 (= lt!209837 lt!209838)))

(declare-fun minValueBefore!38 () V!18099)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13496 0))(
  ( (Unit!13497) )
))
(declare-fun lt!209836 () Unit!13496)

(declare-fun zeroValue!794 () V!18099)

(declare-fun minValueAfter!38 () V!18099)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!39 (array!29271 array!29273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18099 V!18099 V!18099 V!18099 (_ BitVec 32) Int) Unit!13496)

(assert (=> b!464995 (= lt!209836 (lemmaNoChangeToArrayThenSameMapNoExtras!39 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1882 (array!29271 array!29273 (_ BitVec 32) (_ BitVec 32) V!18099 V!18099 (_ BitVec 32) Int) ListLongMap!7349)

(assert (=> b!464995 (= lt!209838 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464995 (= lt!209837 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20797 () Bool)

(assert (=> mapIsEmpty!20797 mapRes!20797))

(assert (= (and start!41650 res!277998) b!464994))

(assert (= (and b!464994 res!277995) b!464993))

(assert (= (and b!464993 res!277996) b!464991))

(assert (= (and b!464991 res!277997) b!464995))

(assert (= (and b!464992 condMapEmpty!20797) mapIsEmpty!20797))

(assert (= (and b!464992 (not condMapEmpty!20797)) mapNonEmpty!20797))

(get-info :version)

(assert (= (and mapNonEmpty!20797 ((_ is ValueCellFull!6029) mapValue!20797)) b!464990))

(assert (= (and b!464992 ((_ is ValueCellFull!6029) mapDefault!20797)) b!464989))

(assert (= start!41650 b!464992))

(declare-fun m!446787 () Bool)

(assert (=> mapNonEmpty!20797 m!446787))

(declare-fun m!446789 () Bool)

(assert (=> b!464991 m!446789))

(declare-fun m!446791 () Bool)

(assert (=> b!464995 m!446791))

(declare-fun m!446793 () Bool)

(assert (=> b!464995 m!446793))

(declare-fun m!446795 () Bool)

(assert (=> b!464995 m!446795))

(declare-fun m!446797 () Bool)

(assert (=> start!41650 m!446797))

(declare-fun m!446799 () Bool)

(assert (=> start!41650 m!446799))

(declare-fun m!446801 () Bool)

(assert (=> start!41650 m!446801))

(declare-fun m!446803 () Bool)

(assert (=> b!464993 m!446803))

(check-sat b_and!19639 (not mapNonEmpty!20797) (not b!464995) (not b!464993) (not b!464991) (not b_next!11317) (not start!41650) tp_is_empty!12745)
(check-sat b_and!19639 (not b_next!11317))
(get-model)

(declare-fun d!74885 () Bool)

(assert (=> d!74885 (= (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209859 () Unit!13496)

(declare-fun choose!1345 (array!29271 array!29273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18099 V!18099 V!18099 V!18099 (_ BitVec 32) Int) Unit!13496)

(assert (=> d!74885 (= lt!209859 (choose!1345 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!74885 (validMask!0 mask!1365)))

(assert (=> d!74885 (= (lemmaNoChangeToArrayThenSameMapNoExtras!39 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209859)))

(declare-fun bs!14692 () Bool)

(assert (= bs!14692 d!74885))

(assert (=> bs!14692 m!446795))

(assert (=> bs!14692 m!446793))

(declare-fun m!446841 () Bool)

(assert (=> bs!14692 m!446841))

(assert (=> bs!14692 m!446797))

(assert (=> b!464995 d!74885))

(declare-fun b!465062 () Bool)

(declare-fun e!271753 () Bool)

(declare-fun e!271755 () Bool)

(assert (=> b!465062 (= e!271753 e!271755)))

(declare-fun c!56613 () Bool)

(assert (=> b!465062 (= c!56613 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465063 () Bool)

(assert (=> b!465063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> b!465063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14420 _values!833)))))

(declare-fun e!271756 () Bool)

(declare-fun lt!209877 () ListLongMap!7349)

(declare-fun apply!321 (ListLongMap!7349 (_ BitVec 64)) V!18099)

(declare-fun get!6912 (ValueCell!6029 V!18099) V!18099)

(declare-fun dynLambda!917 (Int (_ BitVec 64)) V!18099)

(assert (=> b!465063 (= e!271756 (= (apply!321 lt!209877 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)) (get!6912 (select (arr!14067 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!465064 () Bool)

(declare-fun e!271759 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!465064 (= e!271759 (validKeyInArray!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465064 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!465065 () Bool)

(declare-fun e!271757 () ListLongMap!7349)

(assert (=> b!465065 (= e!271757 (ListLongMap!7350 Nil!8532))))

(declare-fun b!465066 () Bool)

(declare-fun e!271758 () Bool)

(assert (=> b!465066 (= e!271758 e!271753)))

(declare-fun c!56614 () Bool)

(assert (=> b!465066 (= c!56614 e!271759)))

(declare-fun res!278034 () Bool)

(assert (=> b!465066 (=> (not res!278034) (not e!271759))))

(assert (=> b!465066 (= res!278034 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465067 () Bool)

(assert (=> b!465067 (= e!271753 e!271756)))

(assert (=> b!465067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun res!278031 () Bool)

(declare-fun contains!2513 (ListLongMap!7349 (_ BitVec 64)) Bool)

(assert (=> b!465067 (= res!278031 (contains!2513 lt!209877 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465067 (=> (not res!278031) (not e!271756))))

(declare-fun b!465068 () Bool)

(declare-fun e!271754 () ListLongMap!7349)

(declare-fun call!30206 () ListLongMap!7349)

(assert (=> b!465068 (= e!271754 call!30206)))

(declare-fun b!465069 () Bool)

(assert (=> b!465069 (= e!271757 e!271754)))

(declare-fun c!56615 () Bool)

(assert (=> b!465069 (= c!56615 (validKeyInArray!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465070 () Bool)

(declare-fun lt!209878 () Unit!13496)

(declare-fun lt!209876 () Unit!13496)

(assert (=> b!465070 (= lt!209878 lt!209876)))

(declare-fun lt!209879 () (_ BitVec 64))

(declare-fun lt!209880 () (_ BitVec 64))

(declare-fun lt!209875 () V!18099)

(declare-fun lt!209874 () ListLongMap!7349)

(declare-fun +!1666 (ListLongMap!7349 tuple2!8446) ListLongMap!7349)

(assert (=> b!465070 (not (contains!2513 (+!1666 lt!209874 (tuple2!8447 lt!209880 lt!209875)) lt!209879))))

(declare-fun addStillNotContains!155 (ListLongMap!7349 (_ BitVec 64) V!18099 (_ BitVec 64)) Unit!13496)

(assert (=> b!465070 (= lt!209876 (addStillNotContains!155 lt!209874 lt!209880 lt!209875 lt!209879))))

(assert (=> b!465070 (= lt!209879 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!465070 (= lt!209875 (get!6912 (select (arr!14067 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465070 (= lt!209880 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465070 (= lt!209874 call!30206)))

(assert (=> b!465070 (= e!271754 (+!1666 call!30206 (tuple2!8447 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000) (get!6912 (select (arr!14067 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!465071 () Bool)

(declare-fun res!278032 () Bool)

(assert (=> b!465071 (=> (not res!278032) (not e!271758))))

(assert (=> b!465071 (= res!278032 (not (contains!2513 lt!209877 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465072 () Bool)

(assert (=> b!465072 (= e!271755 (= lt!209877 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun d!74887 () Bool)

(assert (=> d!74887 e!271758))

(declare-fun res!278033 () Bool)

(assert (=> d!74887 (=> (not res!278033) (not e!271758))))

(assert (=> d!74887 (= res!278033 (not (contains!2513 lt!209877 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74887 (= lt!209877 e!271757)))

(declare-fun c!56612 () Bool)

(assert (=> d!74887 (= c!56612 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!74887 (validMask!0 mask!1365)))

(assert (=> d!74887 (= (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209877)))

(declare-fun b!465073 () Bool)

(declare-fun isEmpty!572 (ListLongMap!7349) Bool)

(assert (=> b!465073 (= e!271755 (isEmpty!572 lt!209877))))

(declare-fun bm!30203 () Bool)

(assert (=> bm!30203 (= call!30206 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!74887 c!56612) b!465065))

(assert (= (and d!74887 (not c!56612)) b!465069))

(assert (= (and b!465069 c!56615) b!465070))

(assert (= (and b!465069 (not c!56615)) b!465068))

(assert (= (or b!465070 b!465068) bm!30203))

(assert (= (and d!74887 res!278033) b!465071))

(assert (= (and b!465071 res!278032) b!465066))

(assert (= (and b!465066 res!278034) b!465064))

(assert (= (and b!465066 c!56614) b!465067))

(assert (= (and b!465066 (not c!56614)) b!465062))

(assert (= (and b!465067 res!278031) b!465063))

(assert (= (and b!465062 c!56613) b!465072))

(assert (= (and b!465062 (not c!56613)) b!465073))

(declare-fun b_lambda!9971 () Bool)

(assert (=> (not b_lambda!9971) (not b!465063)))

(declare-fun t!14478 () Bool)

(declare-fun tb!3899 () Bool)

(assert (=> (and start!41650 (= defaultEntry!841 defaultEntry!841) t!14478) tb!3899))

(declare-fun result!7371 () Bool)

(assert (=> tb!3899 (= result!7371 tp_is_empty!12745)))

(assert (=> b!465063 t!14478))

(declare-fun b_and!19645 () Bool)

(assert (= b_and!19639 (and (=> t!14478 result!7371) b_and!19645)))

(declare-fun b_lambda!9973 () Bool)

(assert (=> (not b_lambda!9973) (not b!465070)))

(assert (=> b!465070 t!14478))

(declare-fun b_and!19647 () Bool)

(assert (= b_and!19645 (and (=> t!14478 result!7371) b_and!19647)))

(declare-fun m!446843 () Bool)

(assert (=> b!465071 m!446843))

(declare-fun m!446845 () Bool)

(assert (=> b!465067 m!446845))

(assert (=> b!465067 m!446845))

(declare-fun m!446847 () Bool)

(assert (=> b!465067 m!446847))

(assert (=> b!465063 m!446845))

(declare-fun m!446849 () Bool)

(assert (=> b!465063 m!446849))

(declare-fun m!446851 () Bool)

(assert (=> b!465063 m!446851))

(declare-fun m!446853 () Bool)

(assert (=> b!465063 m!446853))

(assert (=> b!465063 m!446845))

(assert (=> b!465063 m!446853))

(assert (=> b!465063 m!446851))

(declare-fun m!446855 () Bool)

(assert (=> b!465063 m!446855))

(declare-fun m!446857 () Bool)

(assert (=> bm!30203 m!446857))

(declare-fun m!446859 () Bool)

(assert (=> b!465073 m!446859))

(assert (=> b!465064 m!446845))

(assert (=> b!465064 m!446845))

(declare-fun m!446861 () Bool)

(assert (=> b!465064 m!446861))

(assert (=> b!465072 m!446857))

(declare-fun m!446863 () Bool)

(assert (=> d!74887 m!446863))

(assert (=> d!74887 m!446797))

(declare-fun m!446865 () Bool)

(assert (=> b!465070 m!446865))

(assert (=> b!465070 m!446851))

(assert (=> b!465070 m!446853))

(declare-fun m!446867 () Bool)

(assert (=> b!465070 m!446867))

(declare-fun m!446869 () Bool)

(assert (=> b!465070 m!446869))

(assert (=> b!465070 m!446867))

(declare-fun m!446871 () Bool)

(assert (=> b!465070 m!446871))

(assert (=> b!465070 m!446845))

(assert (=> b!465070 m!446853))

(assert (=> b!465070 m!446851))

(assert (=> b!465070 m!446855))

(assert (=> b!465069 m!446845))

(assert (=> b!465069 m!446845))

(assert (=> b!465069 m!446861))

(assert (=> b!464995 d!74887))

(declare-fun b!465076 () Bool)

(declare-fun e!271760 () Bool)

(declare-fun e!271762 () Bool)

(assert (=> b!465076 (= e!271760 e!271762)))

(declare-fun c!56617 () Bool)

(assert (=> b!465076 (= c!56617 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465077 () Bool)

(assert (=> b!465077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> b!465077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14420 _values!833)))))

(declare-fun e!271763 () Bool)

(declare-fun lt!209884 () ListLongMap!7349)

(assert (=> b!465077 (= e!271763 (= (apply!321 lt!209884 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)) (get!6912 (select (arr!14067 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!465078 () Bool)

(declare-fun e!271766 () Bool)

(assert (=> b!465078 (= e!271766 (validKeyInArray!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465078 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!465079 () Bool)

(declare-fun e!271764 () ListLongMap!7349)

(assert (=> b!465079 (= e!271764 (ListLongMap!7350 Nil!8532))))

(declare-fun b!465080 () Bool)

(declare-fun e!271765 () Bool)

(assert (=> b!465080 (= e!271765 e!271760)))

(declare-fun c!56618 () Bool)

(assert (=> b!465080 (= c!56618 e!271766)))

(declare-fun res!278038 () Bool)

(assert (=> b!465080 (=> (not res!278038) (not e!271766))))

(assert (=> b!465080 (= res!278038 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465081 () Bool)

(assert (=> b!465081 (= e!271760 e!271763)))

(assert (=> b!465081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun res!278035 () Bool)

(assert (=> b!465081 (= res!278035 (contains!2513 lt!209884 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465081 (=> (not res!278035) (not e!271763))))

(declare-fun b!465082 () Bool)

(declare-fun e!271761 () ListLongMap!7349)

(declare-fun call!30207 () ListLongMap!7349)

(assert (=> b!465082 (= e!271761 call!30207)))

(declare-fun b!465083 () Bool)

(assert (=> b!465083 (= e!271764 e!271761)))

(declare-fun c!56619 () Bool)

(assert (=> b!465083 (= c!56619 (validKeyInArray!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465084 () Bool)

(declare-fun lt!209885 () Unit!13496)

(declare-fun lt!209883 () Unit!13496)

(assert (=> b!465084 (= lt!209885 lt!209883)))

(declare-fun lt!209887 () (_ BitVec 64))

(declare-fun lt!209886 () (_ BitVec 64))

(declare-fun lt!209882 () V!18099)

(declare-fun lt!209881 () ListLongMap!7349)

(assert (=> b!465084 (not (contains!2513 (+!1666 lt!209881 (tuple2!8447 lt!209887 lt!209882)) lt!209886))))

(assert (=> b!465084 (= lt!209883 (addStillNotContains!155 lt!209881 lt!209887 lt!209882 lt!209886))))

(assert (=> b!465084 (= lt!209886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!465084 (= lt!209882 (get!6912 (select (arr!14067 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465084 (= lt!209887 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!465084 (= lt!209881 call!30207)))

(assert (=> b!465084 (= e!271761 (+!1666 call!30207 (tuple2!8447 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000) (get!6912 (select (arr!14067 _values!833) #b00000000000000000000000000000000) (dynLambda!917 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!465085 () Bool)

(declare-fun res!278036 () Bool)

(assert (=> b!465085 (=> (not res!278036) (not e!271765))))

(assert (=> b!465085 (= res!278036 (not (contains!2513 lt!209884 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465086 () Bool)

(assert (=> b!465086 (= e!271762 (= lt!209884 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun d!74889 () Bool)

(assert (=> d!74889 e!271765))

(declare-fun res!278037 () Bool)

(assert (=> d!74889 (=> (not res!278037) (not e!271765))))

(assert (=> d!74889 (= res!278037 (not (contains!2513 lt!209884 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74889 (= lt!209884 e!271764)))

(declare-fun c!56616 () Bool)

(assert (=> d!74889 (= c!56616 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!74889 (validMask!0 mask!1365)))

(assert (=> d!74889 (= (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209884)))

(declare-fun b!465087 () Bool)

(assert (=> b!465087 (= e!271762 (isEmpty!572 lt!209884))))

(declare-fun bm!30204 () Bool)

(assert (=> bm!30204 (= call!30207 (getCurrentListMapNoExtraKeys!1882 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(assert (= (and d!74889 c!56616) b!465079))

(assert (= (and d!74889 (not c!56616)) b!465083))

(assert (= (and b!465083 c!56619) b!465084))

(assert (= (and b!465083 (not c!56619)) b!465082))

(assert (= (or b!465084 b!465082) bm!30204))

(assert (= (and d!74889 res!278037) b!465085))

(assert (= (and b!465085 res!278036) b!465080))

(assert (= (and b!465080 res!278038) b!465078))

(assert (= (and b!465080 c!56618) b!465081))

(assert (= (and b!465080 (not c!56618)) b!465076))

(assert (= (and b!465081 res!278035) b!465077))

(assert (= (and b!465076 c!56617) b!465086))

(assert (= (and b!465076 (not c!56617)) b!465087))

(declare-fun b_lambda!9975 () Bool)

(assert (=> (not b_lambda!9975) (not b!465077)))

(assert (=> b!465077 t!14478))

(declare-fun b_and!19649 () Bool)

(assert (= b_and!19647 (and (=> t!14478 result!7371) b_and!19649)))

(declare-fun b_lambda!9977 () Bool)

(assert (=> (not b_lambda!9977) (not b!465084)))

(assert (=> b!465084 t!14478))

(declare-fun b_and!19651 () Bool)

(assert (= b_and!19649 (and (=> t!14478 result!7371) b_and!19651)))

(declare-fun m!446873 () Bool)

(assert (=> b!465085 m!446873))

(assert (=> b!465081 m!446845))

(assert (=> b!465081 m!446845))

(declare-fun m!446875 () Bool)

(assert (=> b!465081 m!446875))

(assert (=> b!465077 m!446845))

(declare-fun m!446877 () Bool)

(assert (=> b!465077 m!446877))

(assert (=> b!465077 m!446851))

(assert (=> b!465077 m!446853))

(assert (=> b!465077 m!446845))

(assert (=> b!465077 m!446853))

(assert (=> b!465077 m!446851))

(assert (=> b!465077 m!446855))

(declare-fun m!446879 () Bool)

(assert (=> bm!30204 m!446879))

(declare-fun m!446881 () Bool)

(assert (=> b!465087 m!446881))

(assert (=> b!465078 m!446845))

(assert (=> b!465078 m!446845))

(assert (=> b!465078 m!446861))

(assert (=> b!465086 m!446879))

(declare-fun m!446883 () Bool)

(assert (=> d!74889 m!446883))

(assert (=> d!74889 m!446797))

(declare-fun m!446885 () Bool)

(assert (=> b!465084 m!446885))

(assert (=> b!465084 m!446851))

(assert (=> b!465084 m!446853))

(declare-fun m!446887 () Bool)

(assert (=> b!465084 m!446887))

(declare-fun m!446889 () Bool)

(assert (=> b!465084 m!446889))

(assert (=> b!465084 m!446887))

(declare-fun m!446891 () Bool)

(assert (=> b!465084 m!446891))

(assert (=> b!465084 m!446845))

(assert (=> b!465084 m!446853))

(assert (=> b!465084 m!446851))

(assert (=> b!465084 m!446855))

(assert (=> b!465083 m!446845))

(assert (=> b!465083 m!446845))

(assert (=> b!465083 m!446861))

(assert (=> b!464995 d!74889))

(declare-fun d!74891 () Bool)

(declare-fun res!278047 () Bool)

(declare-fun e!271777 () Bool)

(assert (=> d!74891 (=> res!278047 e!271777)))

(assert (=> d!74891 (= res!278047 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!74891 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8531) e!271777)))

(declare-fun b!465098 () Bool)

(declare-fun e!271776 () Bool)

(declare-fun contains!2514 (List!8534 (_ BitVec 64)) Bool)

(assert (=> b!465098 (= e!271776 (contains!2514 Nil!8531 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465099 () Bool)

(declare-fun e!271775 () Bool)

(assert (=> b!465099 (= e!271777 e!271775)))

(declare-fun res!278046 () Bool)

(assert (=> b!465099 (=> (not res!278046) (not e!271775))))

(assert (=> b!465099 (= res!278046 (not e!271776))))

(declare-fun res!278045 () Bool)

(assert (=> b!465099 (=> (not res!278045) (not e!271776))))

(assert (=> b!465099 (= res!278045 (validKeyInArray!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465100 () Bool)

(declare-fun e!271778 () Bool)

(declare-fun call!30210 () Bool)

(assert (=> b!465100 (= e!271778 call!30210)))

(declare-fun b!465101 () Bool)

(assert (=> b!465101 (= e!271775 e!271778)))

(declare-fun c!56622 () Bool)

(assert (=> b!465101 (= c!56622 (validKeyInArray!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465102 () Bool)

(assert (=> b!465102 (= e!271778 call!30210)))

(declare-fun bm!30207 () Bool)

(assert (=> bm!30207 (= call!30210 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56622 (Cons!8530 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000) Nil!8531) Nil!8531)))))

(assert (= (and d!74891 (not res!278047)) b!465099))

(assert (= (and b!465099 res!278045) b!465098))

(assert (= (and b!465099 res!278046) b!465101))

(assert (= (and b!465101 c!56622) b!465102))

(assert (= (and b!465101 (not c!56622)) b!465100))

(assert (= (or b!465102 b!465100) bm!30207))

(assert (=> b!465098 m!446845))

(assert (=> b!465098 m!446845))

(declare-fun m!446893 () Bool)

(assert (=> b!465098 m!446893))

(assert (=> b!465099 m!446845))

(assert (=> b!465099 m!446845))

(assert (=> b!465099 m!446861))

(assert (=> b!465101 m!446845))

(assert (=> b!465101 m!446845))

(assert (=> b!465101 m!446861))

(assert (=> bm!30207 m!446845))

(declare-fun m!446895 () Bool)

(assert (=> bm!30207 m!446895))

(assert (=> b!464991 d!74891))

(declare-fun b!465111 () Bool)

(declare-fun e!271785 () Bool)

(declare-fun call!30213 () Bool)

(assert (=> b!465111 (= e!271785 call!30213)))

(declare-fun b!465112 () Bool)

(declare-fun e!271786 () Bool)

(declare-fun e!271787 () Bool)

(assert (=> b!465112 (= e!271786 e!271787)))

(declare-fun c!56625 () Bool)

(assert (=> b!465112 (= c!56625 (validKeyInArray!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30210 () Bool)

(assert (=> bm!30210 (= call!30213 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!465114 () Bool)

(assert (=> b!465114 (= e!271787 call!30213)))

(declare-fun b!465113 () Bool)

(assert (=> b!465113 (= e!271787 e!271785)))

(declare-fun lt!209894 () (_ BitVec 64))

(assert (=> b!465113 (= lt!209894 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!209896 () Unit!13496)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29271 (_ BitVec 64) (_ BitVec 32)) Unit!13496)

(assert (=> b!465113 (= lt!209896 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209894 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!465113 (arrayContainsKey!0 _keys!1025 lt!209894 #b00000000000000000000000000000000)))

(declare-fun lt!209895 () Unit!13496)

(assert (=> b!465113 (= lt!209895 lt!209896)))

(declare-fun res!278052 () Bool)

(declare-datatypes ((SeekEntryResult!3540 0))(
  ( (MissingZero!3540 (index!16339 (_ BitVec 32))) (Found!3540 (index!16340 (_ BitVec 32))) (Intermediate!3540 (undefined!4352 Bool) (index!16341 (_ BitVec 32)) (x!43490 (_ BitVec 32))) (Undefined!3540) (MissingVacant!3540 (index!16342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29271 (_ BitVec 32)) SeekEntryResult!3540)

(assert (=> b!465113 (= res!278052 (= (seekEntryOrOpen!0 (select (arr!14066 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3540 #b00000000000000000000000000000000)))))

(assert (=> b!465113 (=> (not res!278052) (not e!271785))))

(declare-fun d!74893 () Bool)

(declare-fun res!278053 () Bool)

(assert (=> d!74893 (=> res!278053 e!271786)))

(assert (=> d!74893 (= res!278053 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!74893 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!271786)))

(assert (= (and d!74893 (not res!278053)) b!465112))

(assert (= (and b!465112 c!56625) b!465113))

(assert (= (and b!465112 (not c!56625)) b!465114))

(assert (= (and b!465113 res!278052) b!465111))

(assert (= (or b!465111 b!465114) bm!30210))

(assert (=> b!465112 m!446845))

(assert (=> b!465112 m!446845))

(assert (=> b!465112 m!446861))

(declare-fun m!446897 () Bool)

(assert (=> bm!30210 m!446897))

(assert (=> b!465113 m!446845))

(declare-fun m!446899 () Bool)

(assert (=> b!465113 m!446899))

(declare-fun m!446901 () Bool)

(assert (=> b!465113 m!446901))

(assert (=> b!465113 m!446845))

(declare-fun m!446903 () Bool)

(assert (=> b!465113 m!446903))

(assert (=> b!464993 d!74893))

(declare-fun d!74895 () Bool)

(assert (=> d!74895 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41650 d!74895))

(declare-fun d!74897 () Bool)

(assert (=> d!74897 (= (array_inv!10244 _keys!1025) (bvsge (size!14419 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41650 d!74897))

(declare-fun d!74899 () Bool)

(assert (=> d!74899 (= (array_inv!10245 _values!833) (bvsge (size!14420 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41650 d!74899))

(declare-fun b!465121 () Bool)

(declare-fun e!271793 () Bool)

(assert (=> b!465121 (= e!271793 tp_is_empty!12745)))

(declare-fun condMapEmpty!20806 () Bool)

(declare-fun mapDefault!20806 () ValueCell!6029)

(assert (=> mapNonEmpty!20797 (= condMapEmpty!20806 (= mapRest!20797 ((as const (Array (_ BitVec 32) ValueCell!6029)) mapDefault!20806)))))

(declare-fun e!271792 () Bool)

(declare-fun mapRes!20806 () Bool)

(assert (=> mapNonEmpty!20797 (= tp!39951 (and e!271792 mapRes!20806))))

(declare-fun mapNonEmpty!20806 () Bool)

(declare-fun tp!39967 () Bool)

(assert (=> mapNonEmpty!20806 (= mapRes!20806 (and tp!39967 e!271793))))

(declare-fun mapValue!20806 () ValueCell!6029)

(declare-fun mapRest!20806 () (Array (_ BitVec 32) ValueCell!6029))

(declare-fun mapKey!20806 () (_ BitVec 32))

(assert (=> mapNonEmpty!20806 (= mapRest!20797 (store mapRest!20806 mapKey!20806 mapValue!20806))))

(declare-fun b!465122 () Bool)

(assert (=> b!465122 (= e!271792 tp_is_empty!12745)))

(declare-fun mapIsEmpty!20806 () Bool)

(assert (=> mapIsEmpty!20806 mapRes!20806))

(assert (= (and mapNonEmpty!20797 condMapEmpty!20806) mapIsEmpty!20806))

(assert (= (and mapNonEmpty!20797 (not condMapEmpty!20806)) mapNonEmpty!20806))

(assert (= (and mapNonEmpty!20806 ((_ is ValueCellFull!6029) mapValue!20806)) b!465121))

(assert (= (and mapNonEmpty!20797 ((_ is ValueCellFull!6029) mapDefault!20806)) b!465122))

(declare-fun m!446905 () Bool)

(assert (=> mapNonEmpty!20806 m!446905))

(declare-fun b_lambda!9979 () Bool)

(assert (= b_lambda!9975 (or (and start!41650 b_free!11317) b_lambda!9979)))

(declare-fun b_lambda!9981 () Bool)

(assert (= b_lambda!9977 (or (and start!41650 b_free!11317) b_lambda!9981)))

(declare-fun b_lambda!9983 () Bool)

(assert (= b_lambda!9971 (or (and start!41650 b_free!11317) b_lambda!9983)))

(declare-fun b_lambda!9985 () Bool)

(assert (= b_lambda!9973 (or (and start!41650 b_free!11317) b_lambda!9985)))

(check-sat (not mapNonEmpty!20806) (not b!465081) (not bm!30204) b_and!19651 (not b!465064) (not b!465084) (not b!465067) (not b!465071) (not b!465073) (not b!465070) (not b!465098) (not b!465101) (not b!465063) (not b_lambda!9981) (not b_next!11317) (not bm!30203) (not b_lambda!9979) (not b!465085) (not b!465077) (not bm!30207) (not b!465086) (not d!74885) (not b_lambda!9985) (not b_lambda!9983) (not b!465113) (not d!74887) tp_is_empty!12745 (not b!465112) (not b!465069) (not b!465078) (not b!465099) (not b!465083) (not d!74889) (not b!465087) (not bm!30210) (not b!465072))
(check-sat b_and!19651 (not b_next!11317))
