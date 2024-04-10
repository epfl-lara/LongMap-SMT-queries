; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42678 () Bool)

(assert start!42678)

(declare-fun b_free!12063 () Bool)

(declare-fun b_next!12063 () Bool)

(assert (=> start!42678 (= b_free!12063 (not b_next!12063))))

(declare-fun tp!42238 () Bool)

(declare-fun b_and!20575 () Bool)

(assert (=> start!42678 (= tp!42238 b_and!20575)))

(declare-fun b!476023 () Bool)

(declare-fun e!279569 () Bool)

(declare-fun e!279566 () Bool)

(assert (=> b!476023 (= e!279569 (not e!279566))))

(declare-fun res!284213 () Bool)

(assert (=> b!476023 (=> res!284213 e!279566)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!476023 (= res!284213 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!19093 0))(
  ( (V!19094 (val!6790 Int)) )
))
(declare-datatypes ((tuple2!8954 0))(
  ( (tuple2!8955 (_1!4488 (_ BitVec 64)) (_2!4488 V!19093)) )
))
(declare-datatypes ((List!9031 0))(
  ( (Nil!9028) (Cons!9027 (h!9883 tuple2!8954) (t!15011 List!9031)) )
))
(declare-datatypes ((ListLongMap!7867 0))(
  ( (ListLongMap!7868 (toList!3949 List!9031)) )
))
(declare-fun lt!216917 () ListLongMap!7867)

(declare-fun lt!216918 () ListLongMap!7867)

(assert (=> b!476023 (= lt!216917 lt!216918)))

(declare-fun minValueBefore!38 () V!19093)

(declare-fun zeroValue!794 () V!19093)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!14022 0))(
  ( (Unit!14023) )
))
(declare-fun lt!216919 () Unit!14022)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30723 0))(
  ( (array!30724 (arr!14776 (Array (_ BitVec 32) (_ BitVec 64))) (size!15128 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30723)

(declare-datatypes ((ValueCell!6402 0))(
  ( (ValueCellFull!6402 (v!9085 V!19093)) (EmptyCell!6402) )
))
(declare-datatypes ((array!30725 0))(
  ( (array!30726 (arr!14777 (Array (_ BitVec 32) ValueCell!6402)) (size!15129 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30725)

(declare-fun minValueAfter!38 () V!19093)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!265 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19093 V!19093 V!19093 V!19093 (_ BitVec 32) Int) Unit!14022)

(assert (=> b!476023 (= lt!216919 (lemmaNoChangeToArrayThenSameMapNoExtras!265 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2105 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) V!19093 V!19093 (_ BitVec 32) Int) ListLongMap!7867)

(assert (=> b!476023 (= lt!216918 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!476023 (= lt!216917 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!476024 () Bool)

(declare-fun res!284214 () Bool)

(assert (=> b!476024 (=> (not res!284214) (not e!279569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30723 (_ BitVec 32)) Bool)

(assert (=> b!476024 (= res!284214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21964 () Bool)

(declare-fun mapRes!21964 () Bool)

(assert (=> mapIsEmpty!21964 mapRes!21964))

(declare-fun b!476025 () Bool)

(declare-fun +!1762 (ListLongMap!7867 tuple2!8954) ListLongMap!7867)

(declare-fun getCurrentListMap!2290 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) V!19093 V!19093 (_ BitVec 32) Int) ListLongMap!7867)

(assert (=> b!476025 (= e!279566 (= (+!1762 (getCurrentListMap!2290 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2290 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun b!476026 () Bool)

(declare-fun e!279568 () Bool)

(declare-fun tp_is_empty!13491 () Bool)

(assert (=> b!476026 (= e!279568 tp_is_empty!13491)))

(declare-fun b!476027 () Bool)

(declare-fun e!279567 () Bool)

(assert (=> b!476027 (= e!279567 tp_is_empty!13491)))

(declare-fun mapNonEmpty!21964 () Bool)

(declare-fun tp!42237 () Bool)

(assert (=> mapNonEmpty!21964 (= mapRes!21964 (and tp!42237 e!279568))))

(declare-fun mapKey!21964 () (_ BitVec 32))

(declare-fun mapValue!21964 () ValueCell!6402)

(declare-fun mapRest!21964 () (Array (_ BitVec 32) ValueCell!6402))

(assert (=> mapNonEmpty!21964 (= (arr!14777 _values!833) (store mapRest!21964 mapKey!21964 mapValue!21964))))

(declare-fun b!476028 () Bool)

(declare-fun e!279565 () Bool)

(assert (=> b!476028 (= e!279565 (and e!279567 mapRes!21964))))

(declare-fun condMapEmpty!21964 () Bool)

(declare-fun mapDefault!21964 () ValueCell!6402)

(assert (=> b!476028 (= condMapEmpty!21964 (= (arr!14777 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6402)) mapDefault!21964)))))

(declare-fun b!476030 () Bool)

(declare-fun res!284212 () Bool)

(assert (=> b!476030 (=> (not res!284212) (not e!279569))))

(assert (=> b!476030 (= res!284212 (and (= (size!15129 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15128 _keys!1025) (size!15129 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!284210 () Bool)

(assert (=> start!42678 (=> (not res!284210) (not e!279569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42678 (= res!284210 (validMask!0 mask!1365))))

(assert (=> start!42678 e!279569))

(assert (=> start!42678 tp_is_empty!13491))

(assert (=> start!42678 tp!42238))

(assert (=> start!42678 true))

(declare-fun array_inv!10662 (array!30723) Bool)

(assert (=> start!42678 (array_inv!10662 _keys!1025)))

(declare-fun array_inv!10663 (array!30725) Bool)

(assert (=> start!42678 (and (array_inv!10663 _values!833) e!279565)))

(declare-fun b!476029 () Bool)

(declare-fun res!284211 () Bool)

(assert (=> b!476029 (=> (not res!284211) (not e!279569))))

(declare-datatypes ((List!9032 0))(
  ( (Nil!9029) (Cons!9028 (h!9884 (_ BitVec 64)) (t!15012 List!9032)) )
))
(declare-fun arrayNoDuplicates!0 (array!30723 (_ BitVec 32) List!9032) Bool)

(assert (=> b!476029 (= res!284211 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9029))))

(assert (= (and start!42678 res!284210) b!476030))

(assert (= (and b!476030 res!284212) b!476024))

(assert (= (and b!476024 res!284214) b!476029))

(assert (= (and b!476029 res!284211) b!476023))

(assert (= (and b!476023 (not res!284213)) b!476025))

(assert (= (and b!476028 condMapEmpty!21964) mapIsEmpty!21964))

(assert (= (and b!476028 (not condMapEmpty!21964)) mapNonEmpty!21964))

(get-info :version)

(assert (= (and mapNonEmpty!21964 ((_ is ValueCellFull!6402) mapValue!21964)) b!476026))

(assert (= (and b!476028 ((_ is ValueCellFull!6402) mapDefault!21964)) b!476027))

(assert (= start!42678 b!476028))

(declare-fun m!458253 () Bool)

(assert (=> b!476029 m!458253))

(declare-fun m!458255 () Bool)

(assert (=> b!476024 m!458255))

(declare-fun m!458257 () Bool)

(assert (=> b!476023 m!458257))

(declare-fun m!458259 () Bool)

(assert (=> b!476023 m!458259))

(declare-fun m!458261 () Bool)

(assert (=> b!476023 m!458261))

(declare-fun m!458263 () Bool)

(assert (=> mapNonEmpty!21964 m!458263))

(declare-fun m!458265 () Bool)

(assert (=> start!42678 m!458265))

(declare-fun m!458267 () Bool)

(assert (=> start!42678 m!458267))

(declare-fun m!458269 () Bool)

(assert (=> start!42678 m!458269))

(declare-fun m!458271 () Bool)

(assert (=> b!476025 m!458271))

(assert (=> b!476025 m!458271))

(declare-fun m!458273 () Bool)

(assert (=> b!476025 m!458273))

(declare-fun m!458275 () Bool)

(assert (=> b!476025 m!458275))

(check-sat (not b!476029) (not b!476023) (not mapNonEmpty!21964) b_and!20575 (not start!42678) (not b_next!12063) (not b!476024) (not b!476025) tp_is_empty!13491)
(check-sat b_and!20575 (not b_next!12063))
(get-model)

(declare-fun d!75679 () Bool)

(declare-fun e!279590 () Bool)

(assert (=> d!75679 e!279590))

(declare-fun res!284235 () Bool)

(assert (=> d!75679 (=> (not res!284235) (not e!279590))))

(declare-fun lt!216938 () ListLongMap!7867)

(declare-fun contains!2562 (ListLongMap!7867 (_ BitVec 64)) Bool)

(assert (=> d!75679 (= res!284235 (contains!2562 lt!216938 (_1!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!216939 () List!9031)

(assert (=> d!75679 (= lt!216938 (ListLongMap!7868 lt!216939))))

(declare-fun lt!216937 () Unit!14022)

(declare-fun lt!216940 () Unit!14022)

(assert (=> d!75679 (= lt!216937 lt!216940)))

(declare-datatypes ((Option!390 0))(
  ( (Some!389 (v!9087 V!19093)) (None!388) )
))
(declare-fun getValueByKey!384 (List!9031 (_ BitVec 64)) Option!390)

(assert (=> d!75679 (= (getValueByKey!384 lt!216939 (_1!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!389 (_2!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!206 (List!9031 (_ BitVec 64) V!19093) Unit!14022)

(assert (=> d!75679 (= lt!216940 (lemmaContainsTupThenGetReturnValue!206 lt!216939 (_1!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!209 (List!9031 (_ BitVec 64) V!19093) List!9031)

(assert (=> d!75679 (= lt!216939 (insertStrictlySorted!209 (toList!3949 (getCurrentListMap!2290 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75679 (= (+!1762 (getCurrentListMap!2290 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!216938)))

(declare-fun b!476059 () Bool)

(declare-fun res!284234 () Bool)

(assert (=> b!476059 (=> (not res!284234) (not e!279590))))

(assert (=> b!476059 (= res!284234 (= (getValueByKey!384 (toList!3949 lt!216938) (_1!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!389 (_2!4488 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!476060 () Bool)

(declare-fun contains!2563 (List!9031 tuple2!8954) Bool)

(assert (=> b!476060 (= e!279590 (contains!2563 (toList!3949 lt!216938) (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75679 res!284235) b!476059))

(assert (= (and b!476059 res!284234) b!476060))

(declare-fun m!458301 () Bool)

(assert (=> d!75679 m!458301))

(declare-fun m!458303 () Bool)

(assert (=> d!75679 m!458303))

(declare-fun m!458305 () Bool)

(assert (=> d!75679 m!458305))

(declare-fun m!458307 () Bool)

(assert (=> d!75679 m!458307))

(declare-fun m!458309 () Bool)

(assert (=> b!476059 m!458309))

(declare-fun m!458311 () Bool)

(assert (=> b!476060 m!458311))

(assert (=> b!476025 d!75679))

(declare-fun b!476103 () Bool)

(declare-fun e!279629 () ListLongMap!7867)

(declare-fun call!30669 () ListLongMap!7867)

(assert (=> b!476103 (= e!279629 (+!1762 call!30669 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!476104 () Bool)

(declare-fun lt!217001 () ListLongMap!7867)

(declare-fun e!279621 () Bool)

(declare-fun apply!337 (ListLongMap!7867 (_ BitVec 64)) V!19093)

(declare-fun get!7170 (ValueCell!6402 V!19093) V!19093)

(declare-fun dynLambda!930 (Int (_ BitVec 64)) V!19093)

(assert (=> b!476104 (= e!279621 (= (apply!337 lt!217001 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(assert (=> b!476104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun d!75681 () Bool)

(declare-fun e!279627 () Bool)

(assert (=> d!75681 e!279627))

(declare-fun res!284261 () Bool)

(assert (=> d!75681 (=> (not res!284261) (not e!279627))))

(assert (=> d!75681 (= res!284261 (or (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))))

(declare-fun lt!217003 () ListLongMap!7867)

(assert (=> d!75681 (= lt!217001 lt!217003)))

(declare-fun lt!216993 () Unit!14022)

(declare-fun e!279617 () Unit!14022)

(assert (=> d!75681 (= lt!216993 e!279617)))

(declare-fun c!57271 () Bool)

(declare-fun e!279622 () Bool)

(assert (=> d!75681 (= c!57271 e!279622)))

(declare-fun res!284262 () Bool)

(assert (=> d!75681 (=> (not res!284262) (not e!279622))))

(assert (=> d!75681 (= res!284262 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75681 (= lt!217003 e!279629)))

(declare-fun c!57270 () Bool)

(assert (=> d!75681 (= c!57270 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75681 (validMask!0 mask!1365)))

(assert (=> d!75681 (= (getCurrentListMap!2290 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217001)))

(declare-fun b!476105 () Bool)

(declare-fun e!279619 () Bool)

(assert (=> b!476105 (= e!279619 (= (apply!337 lt!217001 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!476106 () Bool)

(declare-fun e!279623 () ListLongMap!7867)

(declare-fun call!30670 () ListLongMap!7867)

(assert (=> b!476106 (= e!279623 call!30670)))

(declare-fun b!476107 () Bool)

(declare-fun c!57272 () Bool)

(assert (=> b!476107 (= c!57272 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279618 () ListLongMap!7867)

(assert (=> b!476107 (= e!279618 e!279623)))

(declare-fun b!476108 () Bool)

(declare-fun call!30674 () ListLongMap!7867)

(assert (=> b!476108 (= e!279623 call!30674)))

(declare-fun bm!30666 () Bool)

(declare-fun call!30675 () Bool)

(assert (=> bm!30666 (= call!30675 (contains!2562 lt!217001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476109 () Bool)

(assert (=> b!476109 (= e!279618 call!30674)))

(declare-fun b!476110 () Bool)

(declare-fun e!279620 () Bool)

(assert (=> b!476110 (= e!279620 e!279619)))

(declare-fun res!284259 () Bool)

(declare-fun call!30672 () Bool)

(assert (=> b!476110 (= res!284259 call!30672)))

(assert (=> b!476110 (=> (not res!284259) (not e!279619))))

(declare-fun bm!30667 () Bool)

(declare-fun call!30673 () ListLongMap!7867)

(declare-fun call!30671 () ListLongMap!7867)

(assert (=> bm!30667 (= call!30673 call!30671)))

(declare-fun b!476111 () Bool)

(assert (=> b!476111 (= e!279620 (not call!30672))))

(declare-fun b!476112 () Bool)

(assert (=> b!476112 (= e!279629 e!279618)))

(declare-fun c!57267 () Bool)

(assert (=> b!476112 (= c!57267 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30668 () Bool)

(assert (=> bm!30668 (= call!30672 (contains!2562 lt!217001 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30669 () Bool)

(assert (=> bm!30669 (= call!30674 call!30669)))

(declare-fun b!476113 () Bool)

(declare-fun e!279628 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!476113 (= e!279628 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476114 () Bool)

(assert (=> b!476114 (= e!279622 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476115 () Bool)

(declare-fun e!279625 () Bool)

(assert (=> b!476115 (= e!279625 (not call!30675))))

(declare-fun b!476116 () Bool)

(declare-fun e!279624 () Bool)

(assert (=> b!476116 (= e!279625 e!279624)))

(declare-fun res!284260 () Bool)

(assert (=> b!476116 (= res!284260 call!30675)))

(assert (=> b!476116 (=> (not res!284260) (not e!279624))))

(declare-fun bm!30670 () Bool)

(assert (=> bm!30670 (= call!30670 call!30673)))

(declare-fun b!476117 () Bool)

(declare-fun res!284254 () Bool)

(assert (=> b!476117 (=> (not res!284254) (not e!279627))))

(declare-fun e!279626 () Bool)

(assert (=> b!476117 (= res!284254 e!279626)))

(declare-fun res!284255 () Bool)

(assert (=> b!476117 (=> res!284255 e!279626)))

(assert (=> b!476117 (= res!284255 (not e!279628))))

(declare-fun res!284258 () Bool)

(assert (=> b!476117 (=> (not res!284258) (not e!279628))))

(assert (=> b!476117 (= res!284258 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476118 () Bool)

(declare-fun res!284257 () Bool)

(assert (=> b!476118 (=> (not res!284257) (not e!279627))))

(assert (=> b!476118 (= res!284257 e!279625)))

(declare-fun c!57268 () Bool)

(assert (=> b!476118 (= c!57268 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30671 () Bool)

(assert (=> bm!30671 (= call!30669 (+!1762 (ite c!57270 call!30671 (ite c!57267 call!30673 call!30670)) (ite (or c!57270 c!57267) (tuple2!8955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!476119 () Bool)

(assert (=> b!476119 (= e!279626 e!279621)))

(declare-fun res!284256 () Bool)

(assert (=> b!476119 (=> (not res!284256) (not e!279621))))

(assert (=> b!476119 (= res!284256 (contains!2562 lt!217001 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476120 () Bool)

(declare-fun lt!216999 () Unit!14022)

(assert (=> b!476120 (= e!279617 lt!216999)))

(declare-fun lt!216997 () ListLongMap!7867)

(assert (=> b!476120 (= lt!216997 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217000 () (_ BitVec 64))

(assert (=> b!476120 (= lt!217000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216989 () (_ BitVec 64))

(assert (=> b!476120 (= lt!216989 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216992 () Unit!14022)

(declare-fun addStillContains!295 (ListLongMap!7867 (_ BitVec 64) V!19093 (_ BitVec 64)) Unit!14022)

(assert (=> b!476120 (= lt!216992 (addStillContains!295 lt!216997 lt!217000 zeroValue!794 lt!216989))))

(assert (=> b!476120 (contains!2562 (+!1762 lt!216997 (tuple2!8955 lt!217000 zeroValue!794)) lt!216989)))

(declare-fun lt!216987 () Unit!14022)

(assert (=> b!476120 (= lt!216987 lt!216992)))

(declare-fun lt!216990 () ListLongMap!7867)

(assert (=> b!476120 (= lt!216990 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217002 () (_ BitVec 64))

(assert (=> b!476120 (= lt!217002 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216985 () (_ BitVec 64))

(assert (=> b!476120 (= lt!216985 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217005 () Unit!14022)

(declare-fun addApplyDifferent!295 (ListLongMap!7867 (_ BitVec 64) V!19093 (_ BitVec 64)) Unit!14022)

(assert (=> b!476120 (= lt!217005 (addApplyDifferent!295 lt!216990 lt!217002 minValueBefore!38 lt!216985))))

(assert (=> b!476120 (= (apply!337 (+!1762 lt!216990 (tuple2!8955 lt!217002 minValueBefore!38)) lt!216985) (apply!337 lt!216990 lt!216985))))

(declare-fun lt!216991 () Unit!14022)

(assert (=> b!476120 (= lt!216991 lt!217005)))

(declare-fun lt!217006 () ListLongMap!7867)

(assert (=> b!476120 (= lt!217006 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216995 () (_ BitVec 64))

(assert (=> b!476120 (= lt!216995 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217004 () (_ BitVec 64))

(assert (=> b!476120 (= lt!217004 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216986 () Unit!14022)

(assert (=> b!476120 (= lt!216986 (addApplyDifferent!295 lt!217006 lt!216995 zeroValue!794 lt!217004))))

(assert (=> b!476120 (= (apply!337 (+!1762 lt!217006 (tuple2!8955 lt!216995 zeroValue!794)) lt!217004) (apply!337 lt!217006 lt!217004))))

(declare-fun lt!216996 () Unit!14022)

(assert (=> b!476120 (= lt!216996 lt!216986)))

(declare-fun lt!216994 () ListLongMap!7867)

(assert (=> b!476120 (= lt!216994 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216988 () (_ BitVec 64))

(assert (=> b!476120 (= lt!216988 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216998 () (_ BitVec 64))

(assert (=> b!476120 (= lt!216998 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476120 (= lt!216999 (addApplyDifferent!295 lt!216994 lt!216988 minValueBefore!38 lt!216998))))

(assert (=> b!476120 (= (apply!337 (+!1762 lt!216994 (tuple2!8955 lt!216988 minValueBefore!38)) lt!216998) (apply!337 lt!216994 lt!216998))))

(declare-fun b!476121 () Bool)

(assert (=> b!476121 (= e!279627 e!279620)))

(declare-fun c!57269 () Bool)

(assert (=> b!476121 (= c!57269 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476122 () Bool)

(assert (=> b!476122 (= e!279624 (= (apply!337 lt!217001 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!476123 () Bool)

(declare-fun Unit!14026 () Unit!14022)

(assert (=> b!476123 (= e!279617 Unit!14026)))

(declare-fun bm!30672 () Bool)

(assert (=> bm!30672 (= call!30671 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and d!75681 c!57270) b!476103))

(assert (= (and d!75681 (not c!57270)) b!476112))

(assert (= (and b!476112 c!57267) b!476109))

(assert (= (and b!476112 (not c!57267)) b!476107))

(assert (= (and b!476107 c!57272) b!476108))

(assert (= (and b!476107 (not c!57272)) b!476106))

(assert (= (or b!476108 b!476106) bm!30670))

(assert (= (or b!476109 bm!30670) bm!30667))

(assert (= (or b!476109 b!476108) bm!30669))

(assert (= (or b!476103 bm!30667) bm!30672))

(assert (= (or b!476103 bm!30669) bm!30671))

(assert (= (and d!75681 res!284262) b!476114))

(assert (= (and d!75681 c!57271) b!476120))

(assert (= (and d!75681 (not c!57271)) b!476123))

(assert (= (and d!75681 res!284261) b!476117))

(assert (= (and b!476117 res!284258) b!476113))

(assert (= (and b!476117 (not res!284255)) b!476119))

(assert (= (and b!476119 res!284256) b!476104))

(assert (= (and b!476117 res!284254) b!476118))

(assert (= (and b!476118 c!57268) b!476116))

(assert (= (and b!476118 (not c!57268)) b!476115))

(assert (= (and b!476116 res!284260) b!476122))

(assert (= (or b!476116 b!476115) bm!30666))

(assert (= (and b!476118 res!284257) b!476121))

(assert (= (and b!476121 c!57269) b!476110))

(assert (= (and b!476121 (not c!57269)) b!476111))

(assert (= (and b!476110 res!284259) b!476105))

(assert (= (or b!476110 b!476111) bm!30668))

(declare-fun b_lambda!10317 () Bool)

(assert (=> (not b_lambda!10317) (not b!476104)))

(declare-fun t!15016 () Bool)

(declare-fun tb!3939 () Bool)

(assert (=> (and start!42678 (= defaultEntry!841 defaultEntry!841) t!15016) tb!3939))

(declare-fun result!7475 () Bool)

(assert (=> tb!3939 (= result!7475 tp_is_empty!13491)))

(assert (=> b!476104 t!15016))

(declare-fun b_and!20579 () Bool)

(assert (= b_and!20575 (and (=> t!15016 result!7475) b_and!20579)))

(declare-fun m!458313 () Bool)

(assert (=> bm!30671 m!458313))

(declare-fun m!458315 () Bool)

(assert (=> b!476114 m!458315))

(assert (=> b!476114 m!458315))

(declare-fun m!458317 () Bool)

(assert (=> b!476114 m!458317))

(assert (=> b!476119 m!458315))

(assert (=> b!476119 m!458315))

(declare-fun m!458319 () Bool)

(assert (=> b!476119 m!458319))

(declare-fun m!458321 () Bool)

(assert (=> b!476120 m!458321))

(declare-fun m!458323 () Bool)

(assert (=> b!476120 m!458323))

(declare-fun m!458325 () Bool)

(assert (=> b!476120 m!458325))

(declare-fun m!458327 () Bool)

(assert (=> b!476120 m!458327))

(declare-fun m!458329 () Bool)

(assert (=> b!476120 m!458329))

(assert (=> b!476120 m!458315))

(assert (=> b!476120 m!458323))

(declare-fun m!458331 () Bool)

(assert (=> b!476120 m!458331))

(declare-fun m!458333 () Bool)

(assert (=> b!476120 m!458333))

(declare-fun m!458335 () Bool)

(assert (=> b!476120 m!458335))

(assert (=> b!476120 m!458321))

(declare-fun m!458337 () Bool)

(assert (=> b!476120 m!458337))

(declare-fun m!458339 () Bool)

(assert (=> b!476120 m!458339))

(assert (=> b!476120 m!458331))

(declare-fun m!458341 () Bool)

(assert (=> b!476120 m!458341))

(assert (=> b!476120 m!458329))

(declare-fun m!458343 () Bool)

(assert (=> b!476120 m!458343))

(assert (=> b!476120 m!458261))

(declare-fun m!458345 () Bool)

(assert (=> b!476120 m!458345))

(declare-fun m!458347 () Bool)

(assert (=> b!476120 m!458347))

(declare-fun m!458349 () Bool)

(assert (=> b!476120 m!458349))

(assert (=> b!476104 m!458315))

(assert (=> b!476104 m!458315))

(declare-fun m!458351 () Bool)

(assert (=> b!476104 m!458351))

(declare-fun m!458353 () Bool)

(assert (=> b!476104 m!458353))

(declare-fun m!458355 () Bool)

(assert (=> b!476104 m!458355))

(assert (=> b!476104 m!458353))

(declare-fun m!458357 () Bool)

(assert (=> b!476104 m!458357))

(assert (=> b!476104 m!458355))

(declare-fun m!458359 () Bool)

(assert (=> b!476105 m!458359))

(declare-fun m!458361 () Bool)

(assert (=> bm!30668 m!458361))

(assert (=> bm!30672 m!458261))

(assert (=> b!476113 m!458315))

(assert (=> b!476113 m!458315))

(assert (=> b!476113 m!458317))

(declare-fun m!458363 () Bool)

(assert (=> b!476103 m!458363))

(declare-fun m!458365 () Bool)

(assert (=> b!476122 m!458365))

(assert (=> d!75681 m!458265))

(declare-fun m!458367 () Bool)

(assert (=> bm!30666 m!458367))

(assert (=> b!476025 d!75681))

(declare-fun b!476126 () Bool)

(declare-fun e!279642 () ListLongMap!7867)

(declare-fun call!30676 () ListLongMap!7867)

(assert (=> b!476126 (= e!279642 (+!1762 call!30676 (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!217023 () ListLongMap!7867)

(declare-fun e!279634 () Bool)

(declare-fun b!476127 () Bool)

(assert (=> b!476127 (= e!279634 (= (apply!337 lt!217023 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(assert (=> b!476127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun d!75683 () Bool)

(declare-fun e!279640 () Bool)

(assert (=> d!75683 e!279640))

(declare-fun res!284270 () Bool)

(assert (=> d!75683 (=> (not res!284270) (not e!279640))))

(assert (=> d!75683 (= res!284270 (or (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))))

(declare-fun lt!217025 () ListLongMap!7867)

(assert (=> d!75683 (= lt!217023 lt!217025)))

(declare-fun lt!217015 () Unit!14022)

(declare-fun e!279630 () Unit!14022)

(assert (=> d!75683 (= lt!217015 e!279630)))

(declare-fun c!57277 () Bool)

(declare-fun e!279635 () Bool)

(assert (=> d!75683 (= c!57277 e!279635)))

(declare-fun res!284271 () Bool)

(assert (=> d!75683 (=> (not res!284271) (not e!279635))))

(assert (=> d!75683 (= res!284271 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75683 (= lt!217025 e!279642)))

(declare-fun c!57276 () Bool)

(assert (=> d!75683 (= c!57276 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75683 (validMask!0 mask!1365)))

(assert (=> d!75683 (= (getCurrentListMap!2290 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217023)))

(declare-fun b!476128 () Bool)

(declare-fun e!279632 () Bool)

(assert (=> b!476128 (= e!279632 (= (apply!337 lt!217023 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!476129 () Bool)

(declare-fun e!279636 () ListLongMap!7867)

(declare-fun call!30677 () ListLongMap!7867)

(assert (=> b!476129 (= e!279636 call!30677)))

(declare-fun b!476130 () Bool)

(declare-fun c!57278 () Bool)

(assert (=> b!476130 (= c!57278 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279631 () ListLongMap!7867)

(assert (=> b!476130 (= e!279631 e!279636)))

(declare-fun b!476131 () Bool)

(declare-fun call!30681 () ListLongMap!7867)

(assert (=> b!476131 (= e!279636 call!30681)))

(declare-fun bm!30673 () Bool)

(declare-fun call!30682 () Bool)

(assert (=> bm!30673 (= call!30682 (contains!2562 lt!217023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476132 () Bool)

(assert (=> b!476132 (= e!279631 call!30681)))

(declare-fun b!476133 () Bool)

(declare-fun e!279633 () Bool)

(assert (=> b!476133 (= e!279633 e!279632)))

(declare-fun res!284268 () Bool)

(declare-fun call!30679 () Bool)

(assert (=> b!476133 (= res!284268 call!30679)))

(assert (=> b!476133 (=> (not res!284268) (not e!279632))))

(declare-fun bm!30674 () Bool)

(declare-fun call!30680 () ListLongMap!7867)

(declare-fun call!30678 () ListLongMap!7867)

(assert (=> bm!30674 (= call!30680 call!30678)))

(declare-fun b!476134 () Bool)

(assert (=> b!476134 (= e!279633 (not call!30679))))

(declare-fun b!476135 () Bool)

(assert (=> b!476135 (= e!279642 e!279631)))

(declare-fun c!57273 () Bool)

(assert (=> b!476135 (= c!57273 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30675 () Bool)

(assert (=> bm!30675 (= call!30679 (contains!2562 lt!217023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30676 () Bool)

(assert (=> bm!30676 (= call!30681 call!30676)))

(declare-fun b!476136 () Bool)

(declare-fun e!279641 () Bool)

(assert (=> b!476136 (= e!279641 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476137 () Bool)

(assert (=> b!476137 (= e!279635 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476138 () Bool)

(declare-fun e!279638 () Bool)

(assert (=> b!476138 (= e!279638 (not call!30682))))

(declare-fun b!476139 () Bool)

(declare-fun e!279637 () Bool)

(assert (=> b!476139 (= e!279638 e!279637)))

(declare-fun res!284269 () Bool)

(assert (=> b!476139 (= res!284269 call!30682)))

(assert (=> b!476139 (=> (not res!284269) (not e!279637))))

(declare-fun bm!30677 () Bool)

(assert (=> bm!30677 (= call!30677 call!30680)))

(declare-fun b!476140 () Bool)

(declare-fun res!284263 () Bool)

(assert (=> b!476140 (=> (not res!284263) (not e!279640))))

(declare-fun e!279639 () Bool)

(assert (=> b!476140 (= res!284263 e!279639)))

(declare-fun res!284264 () Bool)

(assert (=> b!476140 (=> res!284264 e!279639)))

(assert (=> b!476140 (= res!284264 (not e!279641))))

(declare-fun res!284267 () Bool)

(assert (=> b!476140 (=> (not res!284267) (not e!279641))))

(assert (=> b!476140 (= res!284267 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476141 () Bool)

(declare-fun res!284266 () Bool)

(assert (=> b!476141 (=> (not res!284266) (not e!279640))))

(assert (=> b!476141 (= res!284266 e!279638)))

(declare-fun c!57274 () Bool)

(assert (=> b!476141 (= c!57274 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30678 () Bool)

(assert (=> bm!30678 (= call!30676 (+!1762 (ite c!57276 call!30678 (ite c!57273 call!30680 call!30677)) (ite (or c!57276 c!57273) (tuple2!8955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!476142 () Bool)

(assert (=> b!476142 (= e!279639 e!279634)))

(declare-fun res!284265 () Bool)

(assert (=> b!476142 (=> (not res!284265) (not e!279634))))

(assert (=> b!476142 (= res!284265 (contains!2562 lt!217023 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476143 () Bool)

(declare-fun lt!217021 () Unit!14022)

(assert (=> b!476143 (= e!279630 lt!217021)))

(declare-fun lt!217019 () ListLongMap!7867)

(assert (=> b!476143 (= lt!217019 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217022 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217022 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217011 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217011 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217014 () Unit!14022)

(assert (=> b!476143 (= lt!217014 (addStillContains!295 lt!217019 lt!217022 zeroValue!794 lt!217011))))

(assert (=> b!476143 (contains!2562 (+!1762 lt!217019 (tuple2!8955 lt!217022 zeroValue!794)) lt!217011)))

(declare-fun lt!217009 () Unit!14022)

(assert (=> b!476143 (= lt!217009 lt!217014)))

(declare-fun lt!217012 () ListLongMap!7867)

(assert (=> b!476143 (= lt!217012 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217024 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217024 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217007 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217007 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217027 () Unit!14022)

(assert (=> b!476143 (= lt!217027 (addApplyDifferent!295 lt!217012 lt!217024 minValueAfter!38 lt!217007))))

(assert (=> b!476143 (= (apply!337 (+!1762 lt!217012 (tuple2!8955 lt!217024 minValueAfter!38)) lt!217007) (apply!337 lt!217012 lt!217007))))

(declare-fun lt!217013 () Unit!14022)

(assert (=> b!476143 (= lt!217013 lt!217027)))

(declare-fun lt!217028 () ListLongMap!7867)

(assert (=> b!476143 (= lt!217028 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217017 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217026 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217026 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217008 () Unit!14022)

(assert (=> b!476143 (= lt!217008 (addApplyDifferent!295 lt!217028 lt!217017 zeroValue!794 lt!217026))))

(assert (=> b!476143 (= (apply!337 (+!1762 lt!217028 (tuple2!8955 lt!217017 zeroValue!794)) lt!217026) (apply!337 lt!217028 lt!217026))))

(declare-fun lt!217018 () Unit!14022)

(assert (=> b!476143 (= lt!217018 lt!217008)))

(declare-fun lt!217016 () ListLongMap!7867)

(assert (=> b!476143 (= lt!217016 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217010 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217010 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217020 () (_ BitVec 64))

(assert (=> b!476143 (= lt!217020 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476143 (= lt!217021 (addApplyDifferent!295 lt!217016 lt!217010 minValueAfter!38 lt!217020))))

(assert (=> b!476143 (= (apply!337 (+!1762 lt!217016 (tuple2!8955 lt!217010 minValueAfter!38)) lt!217020) (apply!337 lt!217016 lt!217020))))

(declare-fun b!476144 () Bool)

(assert (=> b!476144 (= e!279640 e!279633)))

(declare-fun c!57275 () Bool)

(assert (=> b!476144 (= c!57275 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476145 () Bool)

(assert (=> b!476145 (= e!279637 (= (apply!337 lt!217023 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!476146 () Bool)

(declare-fun Unit!14027 () Unit!14022)

(assert (=> b!476146 (= e!279630 Unit!14027)))

(declare-fun bm!30679 () Bool)

(assert (=> bm!30679 (= call!30678 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and d!75683 c!57276) b!476126))

(assert (= (and d!75683 (not c!57276)) b!476135))

(assert (= (and b!476135 c!57273) b!476132))

(assert (= (and b!476135 (not c!57273)) b!476130))

(assert (= (and b!476130 c!57278) b!476131))

(assert (= (and b!476130 (not c!57278)) b!476129))

(assert (= (or b!476131 b!476129) bm!30677))

(assert (= (or b!476132 bm!30677) bm!30674))

(assert (= (or b!476132 b!476131) bm!30676))

(assert (= (or b!476126 bm!30674) bm!30679))

(assert (= (or b!476126 bm!30676) bm!30678))

(assert (= (and d!75683 res!284271) b!476137))

(assert (= (and d!75683 c!57277) b!476143))

(assert (= (and d!75683 (not c!57277)) b!476146))

(assert (= (and d!75683 res!284270) b!476140))

(assert (= (and b!476140 res!284267) b!476136))

(assert (= (and b!476140 (not res!284264)) b!476142))

(assert (= (and b!476142 res!284265) b!476127))

(assert (= (and b!476140 res!284263) b!476141))

(assert (= (and b!476141 c!57274) b!476139))

(assert (= (and b!476141 (not c!57274)) b!476138))

(assert (= (and b!476139 res!284269) b!476145))

(assert (= (or b!476139 b!476138) bm!30673))

(assert (= (and b!476141 res!284266) b!476144))

(assert (= (and b!476144 c!57275) b!476133))

(assert (= (and b!476144 (not c!57275)) b!476134))

(assert (= (and b!476133 res!284268) b!476128))

(assert (= (or b!476133 b!476134) bm!30675))

(declare-fun b_lambda!10319 () Bool)

(assert (=> (not b_lambda!10319) (not b!476127)))

(assert (=> b!476127 t!15016))

(declare-fun b_and!20581 () Bool)

(assert (= b_and!20579 (and (=> t!15016 result!7475) b_and!20581)))

(declare-fun m!458369 () Bool)

(assert (=> bm!30678 m!458369))

(assert (=> b!476137 m!458315))

(assert (=> b!476137 m!458315))

(assert (=> b!476137 m!458317))

(assert (=> b!476142 m!458315))

(assert (=> b!476142 m!458315))

(declare-fun m!458371 () Bool)

(assert (=> b!476142 m!458371))

(declare-fun m!458373 () Bool)

(assert (=> b!476143 m!458373))

(declare-fun m!458375 () Bool)

(assert (=> b!476143 m!458375))

(declare-fun m!458377 () Bool)

(assert (=> b!476143 m!458377))

(declare-fun m!458379 () Bool)

(assert (=> b!476143 m!458379))

(declare-fun m!458381 () Bool)

(assert (=> b!476143 m!458381))

(assert (=> b!476143 m!458315))

(assert (=> b!476143 m!458375))

(declare-fun m!458383 () Bool)

(assert (=> b!476143 m!458383))

(declare-fun m!458385 () Bool)

(assert (=> b!476143 m!458385))

(declare-fun m!458387 () Bool)

(assert (=> b!476143 m!458387))

(assert (=> b!476143 m!458373))

(declare-fun m!458389 () Bool)

(assert (=> b!476143 m!458389))

(declare-fun m!458391 () Bool)

(assert (=> b!476143 m!458391))

(assert (=> b!476143 m!458383))

(declare-fun m!458393 () Bool)

(assert (=> b!476143 m!458393))

(assert (=> b!476143 m!458381))

(declare-fun m!458395 () Bool)

(assert (=> b!476143 m!458395))

(assert (=> b!476143 m!458259))

(declare-fun m!458397 () Bool)

(assert (=> b!476143 m!458397))

(declare-fun m!458399 () Bool)

(assert (=> b!476143 m!458399))

(declare-fun m!458401 () Bool)

(assert (=> b!476143 m!458401))

(assert (=> b!476127 m!458315))

(assert (=> b!476127 m!458315))

(declare-fun m!458403 () Bool)

(assert (=> b!476127 m!458403))

(assert (=> b!476127 m!458353))

(assert (=> b!476127 m!458355))

(assert (=> b!476127 m!458353))

(assert (=> b!476127 m!458357))

(assert (=> b!476127 m!458355))

(declare-fun m!458405 () Bool)

(assert (=> b!476128 m!458405))

(declare-fun m!458407 () Bool)

(assert (=> bm!30675 m!458407))

(assert (=> bm!30679 m!458259))

(assert (=> b!476136 m!458315))

(assert (=> b!476136 m!458315))

(assert (=> b!476136 m!458317))

(declare-fun m!458409 () Bool)

(assert (=> b!476126 m!458409))

(declare-fun m!458411 () Bool)

(assert (=> b!476145 m!458411))

(assert (=> d!75683 m!458265))

(declare-fun m!458413 () Bool)

(assert (=> bm!30673 m!458413))

(assert (=> b!476025 d!75683))

(declare-fun d!75685 () Bool)

(assert (=> d!75685 (= (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217031 () Unit!14022)

(declare-fun choose!1358 (array!30723 array!30725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19093 V!19093 V!19093 V!19093 (_ BitVec 32) Int) Unit!14022)

(assert (=> d!75685 (= lt!217031 (choose!1358 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75685 (validMask!0 mask!1365)))

(assert (=> d!75685 (= (lemmaNoChangeToArrayThenSameMapNoExtras!265 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217031)))

(declare-fun bs!15114 () Bool)

(assert (= bs!15114 d!75685))

(assert (=> bs!15114 m!458261))

(assert (=> bs!15114 m!458259))

(declare-fun m!458415 () Bool)

(assert (=> bs!15114 m!458415))

(assert (=> bs!15114 m!458265))

(assert (=> b!476023 d!75685))

(declare-fun b!476171 () Bool)

(assert (=> b!476171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> b!476171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(declare-fun lt!217047 () ListLongMap!7867)

(declare-fun e!279659 () Bool)

(assert (=> b!476171 (= e!279659 (= (apply!337 lt!217047 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476172 () Bool)

(declare-fun e!279658 () Bool)

(declare-fun e!279660 () Bool)

(assert (=> b!476172 (= e!279658 e!279660)))

(declare-fun c!57288 () Bool)

(assert (=> b!476172 (= c!57288 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476173 () Bool)

(declare-fun e!279663 () Bool)

(assert (=> b!476173 (= e!279663 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476173 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75687 () Bool)

(declare-fun e!279657 () Bool)

(assert (=> d!75687 e!279657))

(declare-fun res!284280 () Bool)

(assert (=> d!75687 (=> (not res!284280) (not e!279657))))

(assert (=> d!75687 (= res!284280 (not (contains!2562 lt!217047 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279661 () ListLongMap!7867)

(assert (=> d!75687 (= lt!217047 e!279661)))

(declare-fun c!57287 () Bool)

(assert (=> d!75687 (= c!57287 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75687 (validMask!0 mask!1365)))

(assert (=> d!75687 (= (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217047)))

(declare-fun b!476174 () Bool)

(assert (=> b!476174 (= e!279657 e!279658)))

(declare-fun c!57289 () Bool)

(assert (=> b!476174 (= c!57289 e!279663)))

(declare-fun res!284283 () Bool)

(assert (=> b!476174 (=> (not res!284283) (not e!279663))))

(assert (=> b!476174 (= res!284283 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476175 () Bool)

(declare-fun e!279662 () ListLongMap!7867)

(assert (=> b!476175 (= e!279661 e!279662)))

(declare-fun c!57290 () Bool)

(assert (=> b!476175 (= c!57290 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476176 () Bool)

(assert (=> b!476176 (= e!279661 (ListLongMap!7868 Nil!9028))))

(declare-fun b!476177 () Bool)

(assert (=> b!476177 (= e!279660 (= lt!217047 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!476178 () Bool)

(declare-fun lt!217052 () Unit!14022)

(declare-fun lt!217048 () Unit!14022)

(assert (=> b!476178 (= lt!217052 lt!217048)))

(declare-fun lt!217049 () (_ BitVec 64))

(declare-fun lt!217046 () ListLongMap!7867)

(declare-fun lt!217050 () (_ BitVec 64))

(declare-fun lt!217051 () V!19093)

(assert (=> b!476178 (not (contains!2562 (+!1762 lt!217046 (tuple2!8955 lt!217049 lt!217051)) lt!217050))))

(declare-fun addStillNotContains!170 (ListLongMap!7867 (_ BitVec 64) V!19093 (_ BitVec 64)) Unit!14022)

(assert (=> b!476178 (= lt!217048 (addStillNotContains!170 lt!217046 lt!217049 lt!217051 lt!217050))))

(assert (=> b!476178 (= lt!217050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476178 (= lt!217051 (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476178 (= lt!217049 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30685 () ListLongMap!7867)

(assert (=> b!476178 (= lt!217046 call!30685)))

(assert (=> b!476178 (= e!279662 (+!1762 call!30685 (tuple2!8955 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000) (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476179 () Bool)

(declare-fun res!284281 () Bool)

(assert (=> b!476179 (=> (not res!284281) (not e!279657))))

(assert (=> b!476179 (= res!284281 (not (contains!2562 lt!217047 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476180 () Bool)

(assert (=> b!476180 (= e!279658 e!279659)))

(assert (=> b!476180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun res!284282 () Bool)

(assert (=> b!476180 (= res!284282 (contains!2562 lt!217047 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476180 (=> (not res!284282) (not e!279659))))

(declare-fun b!476181 () Bool)

(assert (=> b!476181 (= e!279662 call!30685)))

(declare-fun bm!30682 () Bool)

(assert (=> bm!30682 (= call!30685 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476182 () Bool)

(declare-fun isEmpty!584 (ListLongMap!7867) Bool)

(assert (=> b!476182 (= e!279660 (isEmpty!584 lt!217047))))

(assert (= (and d!75687 c!57287) b!476176))

(assert (= (and d!75687 (not c!57287)) b!476175))

(assert (= (and b!476175 c!57290) b!476178))

(assert (= (and b!476175 (not c!57290)) b!476181))

(assert (= (or b!476178 b!476181) bm!30682))

(assert (= (and d!75687 res!284280) b!476179))

(assert (= (and b!476179 res!284281) b!476174))

(assert (= (and b!476174 res!284283) b!476173))

(assert (= (and b!476174 c!57289) b!476180))

(assert (= (and b!476174 (not c!57289)) b!476172))

(assert (= (and b!476180 res!284282) b!476171))

(assert (= (and b!476172 c!57288) b!476177))

(assert (= (and b!476172 (not c!57288)) b!476182))

(declare-fun b_lambda!10321 () Bool)

(assert (=> (not b_lambda!10321) (not b!476171)))

(assert (=> b!476171 t!15016))

(declare-fun b_and!20583 () Bool)

(assert (= b_and!20581 (and (=> t!15016 result!7475) b_and!20583)))

(declare-fun b_lambda!10323 () Bool)

(assert (=> (not b_lambda!10323) (not b!476178)))

(assert (=> b!476178 t!15016))

(declare-fun b_and!20585 () Bool)

(assert (= b_and!20583 (and (=> t!15016 result!7475) b_and!20585)))

(declare-fun m!458417 () Bool)

(assert (=> bm!30682 m!458417))

(declare-fun m!458419 () Bool)

(assert (=> b!476182 m!458419))

(assert (=> b!476177 m!458417))

(declare-fun m!458421 () Bool)

(assert (=> b!476178 m!458421))

(assert (=> b!476178 m!458353))

(assert (=> b!476178 m!458355))

(declare-fun m!458423 () Bool)

(assert (=> b!476178 m!458423))

(assert (=> b!476178 m!458421))

(declare-fun m!458425 () Bool)

(assert (=> b!476178 m!458425))

(assert (=> b!476178 m!458355))

(assert (=> b!476178 m!458353))

(assert (=> b!476178 m!458357))

(assert (=> b!476178 m!458315))

(declare-fun m!458427 () Bool)

(assert (=> b!476178 m!458427))

(assert (=> b!476175 m!458315))

(assert (=> b!476175 m!458315))

(assert (=> b!476175 m!458317))

(assert (=> b!476180 m!458315))

(assert (=> b!476180 m!458315))

(declare-fun m!458429 () Bool)

(assert (=> b!476180 m!458429))

(declare-fun m!458431 () Bool)

(assert (=> d!75687 m!458431))

(assert (=> d!75687 m!458265))

(assert (=> b!476171 m!458353))

(assert (=> b!476171 m!458355))

(assert (=> b!476171 m!458315))

(assert (=> b!476171 m!458315))

(declare-fun m!458433 () Bool)

(assert (=> b!476171 m!458433))

(assert (=> b!476171 m!458355))

(assert (=> b!476171 m!458353))

(assert (=> b!476171 m!458357))

(assert (=> b!476173 m!458315))

(assert (=> b!476173 m!458315))

(assert (=> b!476173 m!458317))

(declare-fun m!458435 () Bool)

(assert (=> b!476179 m!458435))

(assert (=> b!476023 d!75687))

(declare-fun b!476183 () Bool)

(assert (=> b!476183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> b!476183 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15129 _values!833)))))

(declare-fun lt!217054 () ListLongMap!7867)

(declare-fun e!279666 () Bool)

(assert (=> b!476183 (= e!279666 (= (apply!337 lt!217054 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)) (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476184 () Bool)

(declare-fun e!279665 () Bool)

(declare-fun e!279667 () Bool)

(assert (=> b!476184 (= e!279665 e!279667)))

(declare-fun c!57292 () Bool)

(assert (=> b!476184 (= c!57292 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476185 () Bool)

(declare-fun e!279670 () Bool)

(assert (=> b!476185 (= e!279670 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476185 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!75689 () Bool)

(declare-fun e!279664 () Bool)

(assert (=> d!75689 e!279664))

(declare-fun res!284284 () Bool)

(assert (=> d!75689 (=> (not res!284284) (not e!279664))))

(assert (=> d!75689 (= res!284284 (not (contains!2562 lt!217054 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279668 () ListLongMap!7867)

(assert (=> d!75689 (= lt!217054 e!279668)))

(declare-fun c!57291 () Bool)

(assert (=> d!75689 (= c!57291 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75689 (validMask!0 mask!1365)))

(assert (=> d!75689 (= (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217054)))

(declare-fun b!476186 () Bool)

(assert (=> b!476186 (= e!279664 e!279665)))

(declare-fun c!57293 () Bool)

(assert (=> b!476186 (= c!57293 e!279670)))

(declare-fun res!284287 () Bool)

(assert (=> b!476186 (=> (not res!284287) (not e!279670))))

(assert (=> b!476186 (= res!284287 (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun b!476187 () Bool)

(declare-fun e!279669 () ListLongMap!7867)

(assert (=> b!476187 (= e!279668 e!279669)))

(declare-fun c!57294 () Bool)

(assert (=> b!476187 (= c!57294 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476188 () Bool)

(assert (=> b!476188 (= e!279668 (ListLongMap!7868 Nil!9028))))

(declare-fun b!476189 () Bool)

(assert (=> b!476189 (= e!279667 (= lt!217054 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!476190 () Bool)

(declare-fun lt!217059 () Unit!14022)

(declare-fun lt!217055 () Unit!14022)

(assert (=> b!476190 (= lt!217059 lt!217055)))

(declare-fun lt!217057 () (_ BitVec 64))

(declare-fun lt!217053 () ListLongMap!7867)

(declare-fun lt!217056 () (_ BitVec 64))

(declare-fun lt!217058 () V!19093)

(assert (=> b!476190 (not (contains!2562 (+!1762 lt!217053 (tuple2!8955 lt!217056 lt!217058)) lt!217057))))

(assert (=> b!476190 (= lt!217055 (addStillNotContains!170 lt!217053 lt!217056 lt!217058 lt!217057))))

(assert (=> b!476190 (= lt!217057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476190 (= lt!217058 (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476190 (= lt!217056 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30686 () ListLongMap!7867)

(assert (=> b!476190 (= lt!217053 call!30686)))

(assert (=> b!476190 (= e!279669 (+!1762 call!30686 (tuple2!8955 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000) (get!7170 (select (arr!14777 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476191 () Bool)

(declare-fun res!284285 () Bool)

(assert (=> b!476191 (=> (not res!284285) (not e!279664))))

(assert (=> b!476191 (= res!284285 (not (contains!2562 lt!217054 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476192 () Bool)

(assert (=> b!476192 (= e!279665 e!279666)))

(assert (=> b!476192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(declare-fun res!284286 () Bool)

(assert (=> b!476192 (= res!284286 (contains!2562 lt!217054 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476192 (=> (not res!284286) (not e!279666))))

(declare-fun b!476193 () Bool)

(assert (=> b!476193 (= e!279669 call!30686)))

(declare-fun bm!30683 () Bool)

(assert (=> bm!30683 (= call!30686 (getCurrentListMapNoExtraKeys!2105 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476194 () Bool)

(assert (=> b!476194 (= e!279667 (isEmpty!584 lt!217054))))

(assert (= (and d!75689 c!57291) b!476188))

(assert (= (and d!75689 (not c!57291)) b!476187))

(assert (= (and b!476187 c!57294) b!476190))

(assert (= (and b!476187 (not c!57294)) b!476193))

(assert (= (or b!476190 b!476193) bm!30683))

(assert (= (and d!75689 res!284284) b!476191))

(assert (= (and b!476191 res!284285) b!476186))

(assert (= (and b!476186 res!284287) b!476185))

(assert (= (and b!476186 c!57293) b!476192))

(assert (= (and b!476186 (not c!57293)) b!476184))

(assert (= (and b!476192 res!284286) b!476183))

(assert (= (and b!476184 c!57292) b!476189))

(assert (= (and b!476184 (not c!57292)) b!476194))

(declare-fun b_lambda!10325 () Bool)

(assert (=> (not b_lambda!10325) (not b!476183)))

(assert (=> b!476183 t!15016))

(declare-fun b_and!20587 () Bool)

(assert (= b_and!20585 (and (=> t!15016 result!7475) b_and!20587)))

(declare-fun b_lambda!10327 () Bool)

(assert (=> (not b_lambda!10327) (not b!476190)))

(assert (=> b!476190 t!15016))

(declare-fun b_and!20589 () Bool)

(assert (= b_and!20587 (and (=> t!15016 result!7475) b_and!20589)))

(declare-fun m!458437 () Bool)

(assert (=> bm!30683 m!458437))

(declare-fun m!458439 () Bool)

(assert (=> b!476194 m!458439))

(assert (=> b!476189 m!458437))

(declare-fun m!458441 () Bool)

(assert (=> b!476190 m!458441))

(assert (=> b!476190 m!458353))

(assert (=> b!476190 m!458355))

(declare-fun m!458443 () Bool)

(assert (=> b!476190 m!458443))

(assert (=> b!476190 m!458441))

(declare-fun m!458445 () Bool)

(assert (=> b!476190 m!458445))

(assert (=> b!476190 m!458355))

(assert (=> b!476190 m!458353))

(assert (=> b!476190 m!458357))

(assert (=> b!476190 m!458315))

(declare-fun m!458447 () Bool)

(assert (=> b!476190 m!458447))

(assert (=> b!476187 m!458315))

(assert (=> b!476187 m!458315))

(assert (=> b!476187 m!458317))

(assert (=> b!476192 m!458315))

(assert (=> b!476192 m!458315))

(declare-fun m!458449 () Bool)

(assert (=> b!476192 m!458449))

(declare-fun m!458451 () Bool)

(assert (=> d!75689 m!458451))

(assert (=> d!75689 m!458265))

(assert (=> b!476183 m!458353))

(assert (=> b!476183 m!458355))

(assert (=> b!476183 m!458315))

(assert (=> b!476183 m!458315))

(declare-fun m!458453 () Bool)

(assert (=> b!476183 m!458453))

(assert (=> b!476183 m!458355))

(assert (=> b!476183 m!458353))

(assert (=> b!476183 m!458357))

(assert (=> b!476185 m!458315))

(assert (=> b!476185 m!458315))

(assert (=> b!476185 m!458317))

(declare-fun m!458455 () Bool)

(assert (=> b!476191 m!458455))

(assert (=> b!476023 d!75689))

(declare-fun b!476203 () Bool)

(declare-fun e!279679 () Bool)

(declare-fun e!279677 () Bool)

(assert (=> b!476203 (= e!279679 e!279677)))

(declare-fun lt!217068 () (_ BitVec 64))

(assert (=> b!476203 (= lt!217068 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217066 () Unit!14022)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30723 (_ BitVec 64) (_ BitVec 32)) Unit!14022)

(assert (=> b!476203 (= lt!217066 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!217068 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!476203 (arrayContainsKey!0 _keys!1025 lt!217068 #b00000000000000000000000000000000)))

(declare-fun lt!217067 () Unit!14022)

(assert (=> b!476203 (= lt!217067 lt!217066)))

(declare-fun res!284292 () Bool)

(declare-datatypes ((SeekEntryResult!3561 0))(
  ( (MissingZero!3561 (index!16423 (_ BitVec 32))) (Found!3561 (index!16424 (_ BitVec 32))) (Intermediate!3561 (undefined!4373 Bool) (index!16425 (_ BitVec 32)) (x!44684 (_ BitVec 32))) (Undefined!3561) (MissingVacant!3561 (index!16426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30723 (_ BitVec 32)) SeekEntryResult!3561)

(assert (=> b!476203 (= res!284292 (= (seekEntryOrOpen!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3561 #b00000000000000000000000000000000)))))

(assert (=> b!476203 (=> (not res!284292) (not e!279677))))

(declare-fun bm!30686 () Bool)

(declare-fun call!30689 () Bool)

(assert (=> bm!30686 (= call!30689 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!476205 () Bool)

(assert (=> b!476205 (= e!279679 call!30689)))

(declare-fun b!476206 () Bool)

(assert (=> b!476206 (= e!279677 call!30689)))

(declare-fun b!476204 () Bool)

(declare-fun e!279678 () Bool)

(assert (=> b!476204 (= e!279678 e!279679)))

(declare-fun c!57297 () Bool)

(assert (=> b!476204 (= c!57297 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75691 () Bool)

(declare-fun res!284293 () Bool)

(assert (=> d!75691 (=> res!284293 e!279678)))

(assert (=> d!75691 (= res!284293 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279678)))

(assert (= (and d!75691 (not res!284293)) b!476204))

(assert (= (and b!476204 c!57297) b!476203))

(assert (= (and b!476204 (not c!57297)) b!476205))

(assert (= (and b!476203 res!284292) b!476206))

(assert (= (or b!476206 b!476205) bm!30686))

(assert (=> b!476203 m!458315))

(declare-fun m!458457 () Bool)

(assert (=> b!476203 m!458457))

(declare-fun m!458459 () Bool)

(assert (=> b!476203 m!458459))

(assert (=> b!476203 m!458315))

(declare-fun m!458461 () Bool)

(assert (=> b!476203 m!458461))

(declare-fun m!458463 () Bool)

(assert (=> bm!30686 m!458463))

(assert (=> b!476204 m!458315))

(assert (=> b!476204 m!458315))

(assert (=> b!476204 m!458317))

(assert (=> b!476024 d!75691))

(declare-fun b!476217 () Bool)

(declare-fun e!279689 () Bool)

(declare-fun contains!2564 (List!9032 (_ BitVec 64)) Bool)

(assert (=> b!476217 (= e!279689 (contains!2564 Nil!9029 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30689 () Bool)

(declare-fun call!30692 () Bool)

(declare-fun c!57300 () Bool)

(assert (=> bm!30689 (= call!30692 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57300 (Cons!9028 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000) Nil!9029) Nil!9029)))))

(declare-fun b!476218 () Bool)

(declare-fun e!279691 () Bool)

(declare-fun e!279690 () Bool)

(assert (=> b!476218 (= e!279691 e!279690)))

(declare-fun res!284301 () Bool)

(assert (=> b!476218 (=> (not res!284301) (not e!279690))))

(assert (=> b!476218 (= res!284301 (not e!279689))))

(declare-fun res!284300 () Bool)

(assert (=> b!476218 (=> (not res!284300) (not e!279689))))

(assert (=> b!476218 (= res!284300 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75693 () Bool)

(declare-fun res!284302 () Bool)

(assert (=> d!75693 (=> res!284302 e!279691)))

(assert (=> d!75693 (= res!284302 (bvsge #b00000000000000000000000000000000 (size!15128 _keys!1025)))))

(assert (=> d!75693 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9029) e!279691)))

(declare-fun b!476219 () Bool)

(declare-fun e!279688 () Bool)

(assert (=> b!476219 (= e!279688 call!30692)))

(declare-fun b!476220 () Bool)

(assert (=> b!476220 (= e!279688 call!30692)))

(declare-fun b!476221 () Bool)

(assert (=> b!476221 (= e!279690 e!279688)))

(assert (=> b!476221 (= c!57300 (validKeyInArray!0 (select (arr!14776 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75693 (not res!284302)) b!476218))

(assert (= (and b!476218 res!284300) b!476217))

(assert (= (and b!476218 res!284301) b!476221))

(assert (= (and b!476221 c!57300) b!476220))

(assert (= (and b!476221 (not c!57300)) b!476219))

(assert (= (or b!476220 b!476219) bm!30689))

(assert (=> b!476217 m!458315))

(assert (=> b!476217 m!458315))

(declare-fun m!458465 () Bool)

(assert (=> b!476217 m!458465))

(assert (=> bm!30689 m!458315))

(declare-fun m!458467 () Bool)

(assert (=> bm!30689 m!458467))

(assert (=> b!476218 m!458315))

(assert (=> b!476218 m!458315))

(assert (=> b!476218 m!458317))

(assert (=> b!476221 m!458315))

(assert (=> b!476221 m!458315))

(assert (=> b!476221 m!458317))

(assert (=> b!476029 d!75693))

(declare-fun d!75695 () Bool)

(assert (=> d!75695 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42678 d!75695))

(declare-fun d!75697 () Bool)

(assert (=> d!75697 (= (array_inv!10662 _keys!1025) (bvsge (size!15128 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42678 d!75697))

(declare-fun d!75699 () Bool)

(assert (=> d!75699 (= (array_inv!10663 _values!833) (bvsge (size!15129 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42678 d!75699))

(declare-fun b!476228 () Bool)

(declare-fun e!279697 () Bool)

(assert (=> b!476228 (= e!279697 tp_is_empty!13491)))

(declare-fun condMapEmpty!21970 () Bool)

(declare-fun mapDefault!21970 () ValueCell!6402)

(assert (=> mapNonEmpty!21964 (= condMapEmpty!21970 (= mapRest!21964 ((as const (Array (_ BitVec 32) ValueCell!6402)) mapDefault!21970)))))

(declare-fun e!279696 () Bool)

(declare-fun mapRes!21970 () Bool)

(assert (=> mapNonEmpty!21964 (= tp!42237 (and e!279696 mapRes!21970))))

(declare-fun mapIsEmpty!21970 () Bool)

(assert (=> mapIsEmpty!21970 mapRes!21970))

(declare-fun mapNonEmpty!21970 () Bool)

(declare-fun tp!42247 () Bool)

(assert (=> mapNonEmpty!21970 (= mapRes!21970 (and tp!42247 e!279697))))

(declare-fun mapKey!21970 () (_ BitVec 32))

(declare-fun mapValue!21970 () ValueCell!6402)

(declare-fun mapRest!21970 () (Array (_ BitVec 32) ValueCell!6402))

(assert (=> mapNonEmpty!21970 (= mapRest!21964 (store mapRest!21970 mapKey!21970 mapValue!21970))))

(declare-fun b!476229 () Bool)

(assert (=> b!476229 (= e!279696 tp_is_empty!13491)))

(assert (= (and mapNonEmpty!21964 condMapEmpty!21970) mapIsEmpty!21970))

(assert (= (and mapNonEmpty!21964 (not condMapEmpty!21970)) mapNonEmpty!21970))

(assert (= (and mapNonEmpty!21970 ((_ is ValueCellFull!6402) mapValue!21970)) b!476228))

(assert (= (and mapNonEmpty!21964 ((_ is ValueCellFull!6402) mapDefault!21970)) b!476229))

(declare-fun m!458469 () Bool)

(assert (=> mapNonEmpty!21970 m!458469))

(declare-fun b_lambda!10329 () Bool)

(assert (= b_lambda!10317 (or (and start!42678 b_free!12063) b_lambda!10329)))

(declare-fun b_lambda!10331 () Bool)

(assert (= b_lambda!10321 (or (and start!42678 b_free!12063) b_lambda!10331)))

(declare-fun b_lambda!10333 () Bool)

(assert (= b_lambda!10323 (or (and start!42678 b_free!12063) b_lambda!10333)))

(declare-fun b_lambda!10335 () Bool)

(assert (= b_lambda!10327 (or (and start!42678 b_free!12063) b_lambda!10335)))

(declare-fun b_lambda!10337 () Bool)

(assert (= b_lambda!10325 (or (and start!42678 b_free!12063) b_lambda!10337)))

(declare-fun b_lambda!10339 () Bool)

(assert (= b_lambda!10319 (or (and start!42678 b_free!12063) b_lambda!10339)))

(check-sat (not b!476145) (not b!476187) (not b!476179) (not b!476190) b_and!20589 (not b!476194) (not bm!30675) (not b!476119) (not d!75683) (not bm!30679) (not bm!30683) (not b!476128) (not b_lambda!10339) (not bm!30686) tp_is_empty!13491 (not b!476105) (not mapNonEmpty!21970) (not b_lambda!10333) (not b!476178) (not bm!30689) (not b!476185) (not b!476104) (not b!476113) (not b!476203) (not b!476173) (not b!476143) (not b!476180) (not b_lambda!10331) (not b!476204) (not b_lambda!10329) (not d!75689) (not b!476192) (not b!476120) (not b!476217) (not bm!30678) (not d!75681) (not b!476177) (not b!476218) (not b!476189) (not b!476183) (not bm!30666) (not b!476136) (not b_lambda!10337) (not b!476103) (not bm!30671) (not b_next!12063) (not bm!30682) (not b!476182) (not bm!30668) (not b_lambda!10335) (not b!476060) (not d!75679) (not b!476126) (not b!476221) (not b!476127) (not b!476122) (not b!476137) (not b!476191) (not d!75685) (not b!476114) (not bm!30672) (not b!476142) (not bm!30673) (not b!476171) (not b!476175) (not d!75687) (not b!476059))
(check-sat b_and!20589 (not b_next!12063))
