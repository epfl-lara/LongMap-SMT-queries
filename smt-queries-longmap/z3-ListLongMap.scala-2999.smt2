; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42300 () Bool)

(assert start!42300)

(declare-fun b_free!11805 () Bool)

(declare-fun b_next!11805 () Bool)

(assert (=> start!42300 (= b_free!11805 (not b_next!11805))))

(declare-fun tp!41442 () Bool)

(declare-fun b_and!20243 () Bool)

(assert (=> start!42300 (= tp!41442 b_and!20243)))

(declare-fun b!472003 () Bool)

(declare-fun e!276705 () Bool)

(declare-fun e!276704 () Bool)

(declare-fun mapRes!21556 () Bool)

(assert (=> b!472003 (= e!276705 (and e!276704 mapRes!21556))))

(declare-fun condMapEmpty!21556 () Bool)

(declare-datatypes ((V!18749 0))(
  ( (V!18750 (val!6661 Int)) )
))
(declare-datatypes ((ValueCell!6273 0))(
  ( (ValueCellFull!6273 (v!8952 V!18749)) (EmptyCell!6273) )
))
(declare-datatypes ((array!30223 0))(
  ( (array!30224 (arr!14533 (Array (_ BitVec 32) ValueCell!6273)) (size!14885 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30223)

(declare-fun mapDefault!21556 () ValueCell!6273)

(assert (=> b!472003 (= condMapEmpty!21556 (= (arr!14533 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6273)) mapDefault!21556)))))

(declare-fun mapNonEmpty!21556 () Bool)

(declare-fun tp!41443 () Bool)

(declare-fun e!276701 () Bool)

(assert (=> mapNonEmpty!21556 (= mapRes!21556 (and tp!41443 e!276701))))

(declare-fun mapValue!21556 () ValueCell!6273)

(declare-fun mapKey!21556 () (_ BitVec 32))

(declare-fun mapRest!21556 () (Array (_ BitVec 32) ValueCell!6273))

(assert (=> mapNonEmpty!21556 (= (arr!14533 _values!833) (store mapRest!21556 mapKey!21556 mapValue!21556))))

(declare-fun b!472004 () Bool)

(declare-fun tp_is_empty!13233 () Bool)

(assert (=> b!472004 (= e!276704 tp_is_empty!13233)))

(declare-fun b!472005 () Bool)

(assert (=> b!472005 (= e!276701 tp_is_empty!13233)))

(declare-fun res!281960 () Bool)

(declare-fun e!276702 () Bool)

(assert (=> start!42300 (=> (not res!281960) (not e!276702))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42300 (= res!281960 (validMask!0 mask!1365))))

(assert (=> start!42300 e!276702))

(assert (=> start!42300 tp_is_empty!13233))

(assert (=> start!42300 tp!41442))

(assert (=> start!42300 true))

(declare-datatypes ((array!30225 0))(
  ( (array!30226 (arr!14534 (Array (_ BitVec 32) (_ BitVec 64))) (size!14886 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30225)

(declare-fun array_inv!10476 (array!30225) Bool)

(assert (=> start!42300 (array_inv!10476 _keys!1025)))

(declare-fun array_inv!10477 (array!30223) Bool)

(assert (=> start!42300 (and (array_inv!10477 _values!833) e!276705)))

(declare-fun mapIsEmpty!21556 () Bool)

(assert (=> mapIsEmpty!21556 mapRes!21556))

(declare-fun b!472006 () Bool)

(declare-fun res!281957 () Bool)

(assert (=> b!472006 (=> (not res!281957) (not e!276702))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472006 (= res!281957 (and (= (size!14885 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14886 _keys!1025) (size!14885 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472007 () Bool)

(assert (=> b!472007 (= e!276702 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14886 _keys!1025)))))))

(declare-datatypes ((tuple2!8768 0))(
  ( (tuple2!8769 (_1!4395 (_ BitVec 64)) (_2!4395 V!18749)) )
))
(declare-datatypes ((List!8851 0))(
  ( (Nil!8848) (Cons!8847 (h!9703 tuple2!8768) (t!14817 List!8851)) )
))
(declare-datatypes ((ListLongMap!7681 0))(
  ( (ListLongMap!7682 (toList!3856 List!8851)) )
))
(declare-fun lt!214133 () ListLongMap!7681)

(declare-fun lt!214131 () ListLongMap!7681)

(assert (=> b!472007 (= lt!214133 lt!214131)))

(declare-fun minValueBefore!38 () V!18749)

(declare-fun zeroValue!794 () V!18749)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13871 0))(
  ( (Unit!13872) )
))
(declare-fun lt!214132 () Unit!13871)

(declare-fun minValueAfter!38 () V!18749)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!199 (array!30225 array!30223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18749 V!18749 V!18749 V!18749 (_ BitVec 32) Int) Unit!13871)

(assert (=> b!472007 (= lt!214132 (lemmaNoChangeToArrayThenSameMapNoExtras!199 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2019 (array!30225 array!30223 (_ BitVec 32) (_ BitVec 32) V!18749 V!18749 (_ BitVec 32) Int) ListLongMap!7681)

(assert (=> b!472007 (= lt!214131 (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472007 (= lt!214133 (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472008 () Bool)

(declare-fun res!281958 () Bool)

(assert (=> b!472008 (=> (not res!281958) (not e!276702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30225 (_ BitVec 32)) Bool)

(assert (=> b!472008 (= res!281958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472009 () Bool)

(declare-fun res!281959 () Bool)

(assert (=> b!472009 (=> (not res!281959) (not e!276702))))

(declare-datatypes ((List!8852 0))(
  ( (Nil!8849) (Cons!8848 (h!9704 (_ BitVec 64)) (t!14818 List!8852)) )
))
(declare-fun arrayNoDuplicates!0 (array!30225 (_ BitVec 32) List!8852) Bool)

(assert (=> b!472009 (= res!281959 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8849))))

(assert (= (and start!42300 res!281960) b!472006))

(assert (= (and b!472006 res!281957) b!472008))

(assert (= (and b!472008 res!281958) b!472009))

(assert (= (and b!472009 res!281959) b!472007))

(assert (= (and b!472003 condMapEmpty!21556) mapIsEmpty!21556))

(assert (= (and b!472003 (not condMapEmpty!21556)) mapNonEmpty!21556))

(get-info :version)

(assert (= (and mapNonEmpty!21556 ((_ is ValueCellFull!6273) mapValue!21556)) b!472005))

(assert (= (and b!472003 ((_ is ValueCellFull!6273) mapDefault!21556)) b!472004))

(assert (= start!42300 b!472003))

(declare-fun m!454055 () Bool)

(assert (=> b!472008 m!454055))

(declare-fun m!454057 () Bool)

(assert (=> start!42300 m!454057))

(declare-fun m!454059 () Bool)

(assert (=> start!42300 m!454059))

(declare-fun m!454061 () Bool)

(assert (=> start!42300 m!454061))

(declare-fun m!454063 () Bool)

(assert (=> b!472009 m!454063))

(declare-fun m!454065 () Bool)

(assert (=> b!472007 m!454065))

(declare-fun m!454067 () Bool)

(assert (=> b!472007 m!454067))

(declare-fun m!454069 () Bool)

(assert (=> b!472007 m!454069))

(declare-fun m!454071 () Bool)

(assert (=> mapNonEmpty!21556 m!454071))

(check-sat (not b!472008) (not b_next!11805) (not start!42300) (not b!472009) (not b!472007) tp_is_empty!13233 (not mapNonEmpty!21556) b_and!20243)
(check-sat b_and!20243 (not b_next!11805))
(get-model)

(declare-fun d!75433 () Bool)

(assert (=> d!75433 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42300 d!75433))

(declare-fun d!75435 () Bool)

(assert (=> d!75435 (= (array_inv!10476 _keys!1025) (bvsge (size!14886 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42300 d!75435))

(declare-fun d!75437 () Bool)

(assert (=> d!75437 (= (array_inv!10477 _values!833) (bvsge (size!14885 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42300 d!75437))

(declare-fun d!75439 () Bool)

(assert (=> d!75439 (= (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214145 () Unit!13871)

(declare-fun choose!1349 (array!30225 array!30223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18749 V!18749 V!18749 V!18749 (_ BitVec 32) Int) Unit!13871)

(assert (=> d!75439 (= lt!214145 (choose!1349 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75439 (validMask!0 mask!1365)))

(assert (=> d!75439 (= (lemmaNoChangeToArrayThenSameMapNoExtras!199 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214145)))

(declare-fun bs!14976 () Bool)

(assert (= bs!14976 d!75439))

(assert (=> bs!14976 m!454069))

(assert (=> bs!14976 m!454067))

(declare-fun m!454091 () Bool)

(assert (=> bs!14976 m!454091))

(assert (=> bs!14976 m!454057))

(assert (=> b!472007 d!75439))

(declare-fun b!472055 () Bool)

(declare-fun e!276739 () ListLongMap!7681)

(declare-fun e!276736 () ListLongMap!7681)

(assert (=> b!472055 (= e!276739 e!276736)))

(declare-fun c!56995 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!472055 (= c!56995 (validKeyInArray!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472056 () Bool)

(declare-fun e!276735 () Bool)

(declare-fun e!276740 () Bool)

(assert (=> b!472056 (= e!276735 e!276740)))

(assert (=> b!472056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(declare-fun res!281984 () Bool)

(declare-fun lt!214166 () ListLongMap!7681)

(declare-fun contains!2544 (ListLongMap!7681 (_ BitVec 64)) Bool)

(assert (=> b!472056 (= res!281984 (contains!2544 lt!214166 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472056 (=> (not res!281984) (not e!276740))))

(declare-fun b!472057 () Bool)

(declare-fun e!276737 () Bool)

(assert (=> b!472057 (= e!276735 e!276737)))

(declare-fun c!56996 () Bool)

(assert (=> b!472057 (= c!56996 (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(declare-fun b!472058 () Bool)

(declare-fun e!276738 () Bool)

(assert (=> b!472058 (= e!276738 e!276735)))

(declare-fun c!56998 () Bool)

(declare-fun e!276741 () Bool)

(assert (=> b!472058 (= c!56998 e!276741)))

(declare-fun res!281981 () Bool)

(assert (=> b!472058 (=> (not res!281981) (not e!276741))))

(assert (=> b!472058 (= res!281981 (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(declare-fun b!472059 () Bool)

(declare-fun lt!214164 () Unit!13871)

(declare-fun lt!214163 () Unit!13871)

(assert (=> b!472059 (= lt!214164 lt!214163)))

(declare-fun lt!214161 () (_ BitVec 64))

(declare-fun lt!214165 () V!18749)

(declare-fun lt!214162 () ListLongMap!7681)

(declare-fun lt!214160 () (_ BitVec 64))

(declare-fun +!1716 (ListLongMap!7681 tuple2!8768) ListLongMap!7681)

(assert (=> b!472059 (not (contains!2544 (+!1716 lt!214162 (tuple2!8769 lt!214160 lt!214165)) lt!214161))))

(declare-fun addStillNotContains!163 (ListLongMap!7681 (_ BitVec 64) V!18749 (_ BitVec 64)) Unit!13871)

(assert (=> b!472059 (= lt!214163 (addStillNotContains!163 lt!214162 lt!214160 lt!214165 lt!214161))))

(assert (=> b!472059 (= lt!214161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7077 (ValueCell!6273 V!18749) V!18749)

(declare-fun dynLambda!923 (Int (_ BitVec 64)) V!18749)

(assert (=> b!472059 (= lt!214165 (get!7077 (select (arr!14533 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472059 (= lt!214160 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30454 () ListLongMap!7681)

(assert (=> b!472059 (= lt!214162 call!30454)))

(assert (=> b!472059 (= e!276736 (+!1716 call!30454 (tuple2!8769 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000) (get!7077 (select (arr!14533 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!472060 () Bool)

(assert (=> b!472060 (= e!276736 call!30454)))

(declare-fun b!472061 () Bool)

(declare-fun isEmpty!577 (ListLongMap!7681) Bool)

(assert (=> b!472061 (= e!276737 (isEmpty!577 lt!214166))))

(declare-fun d!75441 () Bool)

(assert (=> d!75441 e!276738))

(declare-fun res!281982 () Bool)

(assert (=> d!75441 (=> (not res!281982) (not e!276738))))

(assert (=> d!75441 (= res!281982 (not (contains!2544 lt!214166 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75441 (= lt!214166 e!276739)))

(declare-fun c!56997 () Bool)

(assert (=> d!75441 (= c!56997 (bvsge #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(assert (=> d!75441 (validMask!0 mask!1365)))

(assert (=> d!75441 (= (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214166)))

(declare-fun b!472062 () Bool)

(declare-fun res!281983 () Bool)

(assert (=> b!472062 (=> (not res!281983) (not e!276738))))

(assert (=> b!472062 (= res!281983 (not (contains!2544 lt!214166 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472063 () Bool)

(assert (=> b!472063 (= e!276741 (validKeyInArray!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472063 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!472064 () Bool)

(assert (=> b!472064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(assert (=> b!472064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14885 _values!833)))))

(declare-fun apply!330 (ListLongMap!7681 (_ BitVec 64)) V!18749)

(assert (=> b!472064 (= e!276740 (= (apply!330 lt!214166 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)) (get!7077 (select (arr!14533 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30451 () Bool)

(assert (=> bm!30451 (= call!30454 (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472065 () Bool)

(assert (=> b!472065 (= e!276739 (ListLongMap!7682 Nil!8848))))

(declare-fun b!472066 () Bool)

(assert (=> b!472066 (= e!276737 (= lt!214166 (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(assert (= (and d!75441 c!56997) b!472065))

(assert (= (and d!75441 (not c!56997)) b!472055))

(assert (= (and b!472055 c!56995) b!472059))

(assert (= (and b!472055 (not c!56995)) b!472060))

(assert (= (or b!472059 b!472060) bm!30451))

(assert (= (and d!75441 res!281982) b!472062))

(assert (= (and b!472062 res!281983) b!472058))

(assert (= (and b!472058 res!281981) b!472063))

(assert (= (and b!472058 c!56998) b!472056))

(assert (= (and b!472058 (not c!56998)) b!472057))

(assert (= (and b!472056 res!281984) b!472064))

(assert (= (and b!472057 c!56996) b!472066))

(assert (= (and b!472057 (not c!56996)) b!472061))

(declare-fun b_lambda!10169 () Bool)

(assert (=> (not b_lambda!10169) (not b!472059)))

(declare-fun t!14821 () Bool)

(declare-fun tb!3925 () Bool)

(assert (=> (and start!42300 (= defaultEntry!841 defaultEntry!841) t!14821) tb!3925))

(declare-fun result!7433 () Bool)

(assert (=> tb!3925 (= result!7433 tp_is_empty!13233)))

(assert (=> b!472059 t!14821))

(declare-fun b_and!20247 () Bool)

(assert (= b_and!20243 (and (=> t!14821 result!7433) b_and!20247)))

(declare-fun b_lambda!10171 () Bool)

(assert (=> (not b_lambda!10171) (not b!472064)))

(assert (=> b!472064 t!14821))

(declare-fun b_and!20249 () Bool)

(assert (= b_and!20247 (and (=> t!14821 result!7433) b_and!20249)))

(declare-fun m!454093 () Bool)

(assert (=> b!472064 m!454093))

(assert (=> b!472064 m!454093))

(declare-fun m!454095 () Bool)

(assert (=> b!472064 m!454095))

(declare-fun m!454097 () Bool)

(assert (=> b!472064 m!454097))

(assert (=> b!472064 m!454097))

(declare-fun m!454099 () Bool)

(assert (=> b!472064 m!454099))

(declare-fun m!454101 () Bool)

(assert (=> b!472064 m!454101))

(assert (=> b!472064 m!454099))

(assert (=> b!472063 m!454093))

(assert (=> b!472063 m!454093))

(declare-fun m!454103 () Bool)

(assert (=> b!472063 m!454103))

(declare-fun m!454105 () Bool)

(assert (=> d!75441 m!454105))

(assert (=> d!75441 m!454057))

(declare-fun m!454107 () Bool)

(assert (=> bm!30451 m!454107))

(assert (=> b!472055 m!454093))

(assert (=> b!472055 m!454093))

(assert (=> b!472055 m!454103))

(declare-fun m!454109 () Bool)

(assert (=> b!472059 m!454109))

(assert (=> b!472059 m!454097))

(declare-fun m!454111 () Bool)

(assert (=> b!472059 m!454111))

(declare-fun m!454113 () Bool)

(assert (=> b!472059 m!454113))

(assert (=> b!472059 m!454097))

(assert (=> b!472059 m!454099))

(assert (=> b!472059 m!454101))

(assert (=> b!472059 m!454099))

(assert (=> b!472059 m!454093))

(assert (=> b!472059 m!454111))

(declare-fun m!454115 () Bool)

(assert (=> b!472059 m!454115))

(assert (=> b!472066 m!454107))

(declare-fun m!454117 () Bool)

(assert (=> b!472062 m!454117))

(assert (=> b!472056 m!454093))

(assert (=> b!472056 m!454093))

(declare-fun m!454119 () Bool)

(assert (=> b!472056 m!454119))

(declare-fun m!454121 () Bool)

(assert (=> b!472061 m!454121))

(assert (=> b!472007 d!75441))

(declare-fun b!472069 () Bool)

(declare-fun e!276746 () ListLongMap!7681)

(declare-fun e!276743 () ListLongMap!7681)

(assert (=> b!472069 (= e!276746 e!276743)))

(declare-fun c!56999 () Bool)

(assert (=> b!472069 (= c!56999 (validKeyInArray!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472070 () Bool)

(declare-fun e!276742 () Bool)

(declare-fun e!276747 () Bool)

(assert (=> b!472070 (= e!276742 e!276747)))

(assert (=> b!472070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(declare-fun res!281988 () Bool)

(declare-fun lt!214173 () ListLongMap!7681)

(assert (=> b!472070 (= res!281988 (contains!2544 lt!214173 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472070 (=> (not res!281988) (not e!276747))))

(declare-fun b!472071 () Bool)

(declare-fun e!276744 () Bool)

(assert (=> b!472071 (= e!276742 e!276744)))

(declare-fun c!57000 () Bool)

(assert (=> b!472071 (= c!57000 (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(declare-fun b!472072 () Bool)

(declare-fun e!276745 () Bool)

(assert (=> b!472072 (= e!276745 e!276742)))

(declare-fun c!57002 () Bool)

(declare-fun e!276748 () Bool)

(assert (=> b!472072 (= c!57002 e!276748)))

(declare-fun res!281985 () Bool)

(assert (=> b!472072 (=> (not res!281985) (not e!276748))))

(assert (=> b!472072 (= res!281985 (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(declare-fun b!472073 () Bool)

(declare-fun lt!214171 () Unit!13871)

(declare-fun lt!214170 () Unit!13871)

(assert (=> b!472073 (= lt!214171 lt!214170)))

(declare-fun lt!214168 () (_ BitVec 64))

(declare-fun lt!214169 () ListLongMap!7681)

(declare-fun lt!214167 () (_ BitVec 64))

(declare-fun lt!214172 () V!18749)

(assert (=> b!472073 (not (contains!2544 (+!1716 lt!214169 (tuple2!8769 lt!214167 lt!214172)) lt!214168))))

(assert (=> b!472073 (= lt!214170 (addStillNotContains!163 lt!214169 lt!214167 lt!214172 lt!214168))))

(assert (=> b!472073 (= lt!214168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!472073 (= lt!214172 (get!7077 (select (arr!14533 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!472073 (= lt!214167 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30455 () ListLongMap!7681)

(assert (=> b!472073 (= lt!214169 call!30455)))

(assert (=> b!472073 (= e!276743 (+!1716 call!30455 (tuple2!8769 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000) (get!7077 (select (arr!14533 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!472074 () Bool)

(assert (=> b!472074 (= e!276743 call!30455)))

(declare-fun b!472075 () Bool)

(assert (=> b!472075 (= e!276744 (isEmpty!577 lt!214173))))

(declare-fun d!75443 () Bool)

(assert (=> d!75443 e!276745))

(declare-fun res!281986 () Bool)

(assert (=> d!75443 (=> (not res!281986) (not e!276745))))

(assert (=> d!75443 (= res!281986 (not (contains!2544 lt!214173 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75443 (= lt!214173 e!276746)))

(declare-fun c!57001 () Bool)

(assert (=> d!75443 (= c!57001 (bvsge #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(assert (=> d!75443 (validMask!0 mask!1365)))

(assert (=> d!75443 (= (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!214173)))

(declare-fun b!472076 () Bool)

(declare-fun res!281987 () Bool)

(assert (=> b!472076 (=> (not res!281987) (not e!276745))))

(assert (=> b!472076 (= res!281987 (not (contains!2544 lt!214173 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!472077 () Bool)

(assert (=> b!472077 (= e!276748 (validKeyInArray!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!472077 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!472078 () Bool)

(assert (=> b!472078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(assert (=> b!472078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14885 _values!833)))))

(assert (=> b!472078 (= e!276747 (= (apply!330 lt!214173 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)) (get!7077 (select (arr!14533 _values!833) #b00000000000000000000000000000000) (dynLambda!923 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30452 () Bool)

(assert (=> bm!30452 (= call!30455 (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!472079 () Bool)

(assert (=> b!472079 (= e!276746 (ListLongMap!7682 Nil!8848))))

(declare-fun b!472080 () Bool)

(assert (=> b!472080 (= e!276744 (= lt!214173 (getCurrentListMapNoExtraKeys!2019 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(assert (= (and d!75443 c!57001) b!472079))

(assert (= (and d!75443 (not c!57001)) b!472069))

(assert (= (and b!472069 c!56999) b!472073))

(assert (= (and b!472069 (not c!56999)) b!472074))

(assert (= (or b!472073 b!472074) bm!30452))

(assert (= (and d!75443 res!281986) b!472076))

(assert (= (and b!472076 res!281987) b!472072))

(assert (= (and b!472072 res!281985) b!472077))

(assert (= (and b!472072 c!57002) b!472070))

(assert (= (and b!472072 (not c!57002)) b!472071))

(assert (= (and b!472070 res!281988) b!472078))

(assert (= (and b!472071 c!57000) b!472080))

(assert (= (and b!472071 (not c!57000)) b!472075))

(declare-fun b_lambda!10173 () Bool)

(assert (=> (not b_lambda!10173) (not b!472073)))

(assert (=> b!472073 t!14821))

(declare-fun b_and!20251 () Bool)

(assert (= b_and!20249 (and (=> t!14821 result!7433) b_and!20251)))

(declare-fun b_lambda!10175 () Bool)

(assert (=> (not b_lambda!10175) (not b!472078)))

(assert (=> b!472078 t!14821))

(declare-fun b_and!20253 () Bool)

(assert (= b_and!20251 (and (=> t!14821 result!7433) b_and!20253)))

(assert (=> b!472078 m!454093))

(assert (=> b!472078 m!454093))

(declare-fun m!454123 () Bool)

(assert (=> b!472078 m!454123))

(assert (=> b!472078 m!454097))

(assert (=> b!472078 m!454097))

(assert (=> b!472078 m!454099))

(assert (=> b!472078 m!454101))

(assert (=> b!472078 m!454099))

(assert (=> b!472077 m!454093))

(assert (=> b!472077 m!454093))

(assert (=> b!472077 m!454103))

(declare-fun m!454125 () Bool)

(assert (=> d!75443 m!454125))

(assert (=> d!75443 m!454057))

(declare-fun m!454127 () Bool)

(assert (=> bm!30452 m!454127))

(assert (=> b!472069 m!454093))

(assert (=> b!472069 m!454093))

(assert (=> b!472069 m!454103))

(declare-fun m!454129 () Bool)

(assert (=> b!472073 m!454129))

(assert (=> b!472073 m!454097))

(declare-fun m!454131 () Bool)

(assert (=> b!472073 m!454131))

(declare-fun m!454133 () Bool)

(assert (=> b!472073 m!454133))

(assert (=> b!472073 m!454097))

(assert (=> b!472073 m!454099))

(assert (=> b!472073 m!454101))

(assert (=> b!472073 m!454099))

(assert (=> b!472073 m!454093))

(assert (=> b!472073 m!454131))

(declare-fun m!454135 () Bool)

(assert (=> b!472073 m!454135))

(assert (=> b!472080 m!454127))

(declare-fun m!454137 () Bool)

(assert (=> b!472076 m!454137))

(assert (=> b!472070 m!454093))

(assert (=> b!472070 m!454093))

(declare-fun m!454139 () Bool)

(assert (=> b!472070 m!454139))

(declare-fun m!454141 () Bool)

(assert (=> b!472075 m!454141))

(assert (=> b!472007 d!75443))

(declare-fun b!472089 () Bool)

(declare-fun e!276756 () Bool)

(declare-fun call!30458 () Bool)

(assert (=> b!472089 (= e!276756 call!30458)))

(declare-fun bm!30455 () Bool)

(assert (=> bm!30455 (= call!30458 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75445 () Bool)

(declare-fun res!281994 () Bool)

(declare-fun e!276757 () Bool)

(assert (=> d!75445 (=> res!281994 e!276757)))

(assert (=> d!75445 (= res!281994 (bvsge #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(assert (=> d!75445 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!276757)))

(declare-fun b!472090 () Bool)

(declare-fun e!276755 () Bool)

(assert (=> b!472090 (= e!276756 e!276755)))

(declare-fun lt!214181 () (_ BitVec 64))

(assert (=> b!472090 (= lt!214181 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!214182 () Unit!13871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30225 (_ BitVec 64) (_ BitVec 32)) Unit!13871)

(assert (=> b!472090 (= lt!214182 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!214181 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!472090 (arrayContainsKey!0 _keys!1025 lt!214181 #b00000000000000000000000000000000)))

(declare-fun lt!214180 () Unit!13871)

(assert (=> b!472090 (= lt!214180 lt!214182)))

(declare-fun res!281993 () Bool)

(declare-datatypes ((SeekEntryResult!3554 0))(
  ( (MissingZero!3554 (index!16395 (_ BitVec 32))) (Found!3554 (index!16396 (_ BitVec 32))) (Intermediate!3554 (undefined!4366 Bool) (index!16397 (_ BitVec 32)) (x!44256 (_ BitVec 32))) (Undefined!3554) (MissingVacant!3554 (index!16398 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30225 (_ BitVec 32)) SeekEntryResult!3554)

(assert (=> b!472090 (= res!281993 (= (seekEntryOrOpen!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3554 #b00000000000000000000000000000000)))))

(assert (=> b!472090 (=> (not res!281993) (not e!276755))))

(declare-fun b!472091 () Bool)

(assert (=> b!472091 (= e!276757 e!276756)))

(declare-fun c!57005 () Bool)

(assert (=> b!472091 (= c!57005 (validKeyInArray!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472092 () Bool)

(assert (=> b!472092 (= e!276755 call!30458)))

(assert (= (and d!75445 (not res!281994)) b!472091))

(assert (= (and b!472091 c!57005) b!472090))

(assert (= (and b!472091 (not c!57005)) b!472089))

(assert (= (and b!472090 res!281993) b!472092))

(assert (= (or b!472092 b!472089) bm!30455))

(declare-fun m!454143 () Bool)

(assert (=> bm!30455 m!454143))

(assert (=> b!472090 m!454093))

(declare-fun m!454145 () Bool)

(assert (=> b!472090 m!454145))

(declare-fun m!454147 () Bool)

(assert (=> b!472090 m!454147))

(assert (=> b!472090 m!454093))

(declare-fun m!454149 () Bool)

(assert (=> b!472090 m!454149))

(assert (=> b!472091 m!454093))

(assert (=> b!472091 m!454093))

(assert (=> b!472091 m!454103))

(assert (=> b!472008 d!75445))

(declare-fun b!472104 () Bool)

(declare-fun e!276766 () Bool)

(declare-fun call!30461 () Bool)

(assert (=> b!472104 (= e!276766 call!30461)))

(declare-fun bm!30458 () Bool)

(declare-fun c!57008 () Bool)

(assert (=> bm!30458 (= call!30461 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57008 (Cons!8848 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000) Nil!8849) Nil!8849)))))

(declare-fun b!472105 () Bool)

(declare-fun e!276767 () Bool)

(declare-fun contains!2545 (List!8852 (_ BitVec 64)) Bool)

(assert (=> b!472105 (= e!276767 (contains!2545 Nil!8849 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472106 () Bool)

(declare-fun e!276769 () Bool)

(declare-fun e!276768 () Bool)

(assert (=> b!472106 (= e!276769 e!276768)))

(declare-fun res!282001 () Bool)

(assert (=> b!472106 (=> (not res!282001) (not e!276768))))

(assert (=> b!472106 (= res!282001 (not e!276767))))

(declare-fun res!282003 () Bool)

(assert (=> b!472106 (=> (not res!282003) (not e!276767))))

(assert (=> b!472106 (= res!282003 (validKeyInArray!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!472107 () Bool)

(assert (=> b!472107 (= e!276768 e!276766)))

(assert (=> b!472107 (= c!57008 (validKeyInArray!0 (select (arr!14534 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75447 () Bool)

(declare-fun res!282002 () Bool)

(assert (=> d!75447 (=> res!282002 e!276769)))

(assert (=> d!75447 (= res!282002 (bvsge #b00000000000000000000000000000000 (size!14886 _keys!1025)))))

(assert (=> d!75447 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8849) e!276769)))

(declare-fun b!472103 () Bool)

(assert (=> b!472103 (= e!276766 call!30461)))

(assert (= (and d!75447 (not res!282002)) b!472106))

(assert (= (and b!472106 res!282003) b!472105))

(assert (= (and b!472106 res!282001) b!472107))

(assert (= (and b!472107 c!57008) b!472103))

(assert (= (and b!472107 (not c!57008)) b!472104))

(assert (= (or b!472103 b!472104) bm!30458))

(assert (=> bm!30458 m!454093))

(declare-fun m!454151 () Bool)

(assert (=> bm!30458 m!454151))

(assert (=> b!472105 m!454093))

(assert (=> b!472105 m!454093))

(declare-fun m!454153 () Bool)

(assert (=> b!472105 m!454153))

(assert (=> b!472106 m!454093))

(assert (=> b!472106 m!454093))

(assert (=> b!472106 m!454103))

(assert (=> b!472107 m!454093))

(assert (=> b!472107 m!454093))

(assert (=> b!472107 m!454103))

(assert (=> b!472009 d!75447))

(declare-fun mapNonEmpty!21562 () Bool)

(declare-fun mapRes!21562 () Bool)

(declare-fun tp!41452 () Bool)

(declare-fun e!276775 () Bool)

(assert (=> mapNonEmpty!21562 (= mapRes!21562 (and tp!41452 e!276775))))

(declare-fun mapValue!21562 () ValueCell!6273)

(declare-fun mapRest!21562 () (Array (_ BitVec 32) ValueCell!6273))

(declare-fun mapKey!21562 () (_ BitVec 32))

(assert (=> mapNonEmpty!21562 (= mapRest!21556 (store mapRest!21562 mapKey!21562 mapValue!21562))))

(declare-fun b!472115 () Bool)

(declare-fun e!276774 () Bool)

(assert (=> b!472115 (= e!276774 tp_is_empty!13233)))

(declare-fun mapIsEmpty!21562 () Bool)

(assert (=> mapIsEmpty!21562 mapRes!21562))

(declare-fun b!472114 () Bool)

(assert (=> b!472114 (= e!276775 tp_is_empty!13233)))

(declare-fun condMapEmpty!21562 () Bool)

(declare-fun mapDefault!21562 () ValueCell!6273)

(assert (=> mapNonEmpty!21556 (= condMapEmpty!21562 (= mapRest!21556 ((as const (Array (_ BitVec 32) ValueCell!6273)) mapDefault!21562)))))

(assert (=> mapNonEmpty!21556 (= tp!41443 (and e!276774 mapRes!21562))))

(assert (= (and mapNonEmpty!21556 condMapEmpty!21562) mapIsEmpty!21562))

(assert (= (and mapNonEmpty!21556 (not condMapEmpty!21562)) mapNonEmpty!21562))

(assert (= (and mapNonEmpty!21562 ((_ is ValueCellFull!6273) mapValue!21562)) b!472114))

(assert (= (and mapNonEmpty!21556 ((_ is ValueCellFull!6273) mapDefault!21562)) b!472115))

(declare-fun m!454155 () Bool)

(assert (=> mapNonEmpty!21562 m!454155))

(declare-fun b_lambda!10177 () Bool)

(assert (= b_lambda!10171 (or (and start!42300 b_free!11805) b_lambda!10177)))

(declare-fun b_lambda!10179 () Bool)

(assert (= b_lambda!10169 (or (and start!42300 b_free!11805) b_lambda!10179)))

(declare-fun b_lambda!10181 () Bool)

(assert (= b_lambda!10173 (or (and start!42300 b_free!11805) b_lambda!10181)))

(declare-fun b_lambda!10183 () Bool)

(assert (= b_lambda!10175 (or (and start!42300 b_free!11805) b_lambda!10183)))

(check-sat (not d!75443) (not b!472080) (not bm!30451) (not b!472091) (not b_lambda!10177) (not bm!30452) (not d!75441) (not b!472090) (not mapNonEmpty!21562) (not b!472056) (not b_lambda!10183) (not b!472107) (not b!472064) b_and!20253 tp_is_empty!13233 (not b!472063) (not b!472061) (not d!75439) (not b!472075) (not b_next!11805) (not b!472073) (not b_lambda!10181) (not b!472055) (not b!472076) (not b!472066) (not b_lambda!10179) (not b!472059) (not bm!30458) (not bm!30455) (not b!472062) (not b!472070) (not b!472078) (not b!472106) (not b!472069) (not b!472105) (not b!472077))
(check-sat b_and!20253 (not b_next!11805))
