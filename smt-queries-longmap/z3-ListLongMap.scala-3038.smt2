; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42588 () Bool)

(assert start!42588)

(declare-fun b_free!12037 () Bool)

(declare-fun b_next!12037 () Bool)

(assert (=> start!42588 (= b_free!12037 (not b_next!12037))))

(declare-fun tp!42151 () Bool)

(declare-fun b_and!20491 () Bool)

(assert (=> start!42588 (= tp!42151 b_and!20491)))

(declare-fun b!475006 () Bool)

(declare-fun res!283711 () Bool)

(declare-fun e!278888 () Bool)

(assert (=> b!475006 (=> (not res!283711) (not e!278888))))

(declare-datatypes ((array!30657 0))(
  ( (array!30658 (arr!14746 (Array (_ BitVec 32) (_ BitVec 64))) (size!15099 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30657)

(declare-datatypes ((List!9056 0))(
  ( (Nil!9053) (Cons!9052 (h!9908 (_ BitVec 64)) (t!15021 List!9056)) )
))
(declare-fun arrayNoDuplicates!0 (array!30657 (_ BitVec 32) List!9056) Bool)

(assert (=> b!475006 (= res!283711 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9053))))

(declare-fun mapIsEmpty!21916 () Bool)

(declare-fun mapRes!21916 () Bool)

(assert (=> mapIsEmpty!21916 mapRes!21916))

(declare-fun b!475007 () Bool)

(declare-fun res!283712 () Bool)

(assert (=> b!475007 (=> (not res!283712) (not e!278888))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!19059 0))(
  ( (V!19060 (val!6777 Int)) )
))
(declare-datatypes ((ValueCell!6389 0))(
  ( (ValueCellFull!6389 (v!9064 V!19059)) (EmptyCell!6389) )
))
(declare-datatypes ((array!30659 0))(
  ( (array!30660 (arr!14747 (Array (_ BitVec 32) ValueCell!6389)) (size!15100 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30659)

(assert (=> b!475007 (= res!283712 (and (= (size!15100 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15099 _keys!1025) (size!15100 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475008 () Bool)

(declare-fun e!278887 () Bool)

(declare-fun tp_is_empty!13465 () Bool)

(assert (=> b!475008 (= e!278887 tp_is_empty!13465)))

(declare-fun b!475009 () Bool)

(declare-fun res!283710 () Bool)

(assert (=> b!475009 (=> (not res!283710) (not e!278888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30657 (_ BitVec 32)) Bool)

(assert (=> b!475009 (= res!283710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475010 () Bool)

(declare-fun e!278885 () Bool)

(assert (=> b!475010 (= e!278885 tp_is_empty!13465)))

(declare-fun res!283713 () Bool)

(assert (=> start!42588 (=> (not res!283713) (not e!278888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42588 (= res!283713 (validMask!0 mask!1365))))

(assert (=> start!42588 e!278888))

(assert (=> start!42588 tp_is_empty!13465))

(assert (=> start!42588 tp!42151))

(assert (=> start!42588 true))

(declare-fun array_inv!10724 (array!30657) Bool)

(assert (=> start!42588 (array_inv!10724 _keys!1025)))

(declare-fun e!278889 () Bool)

(declare-fun array_inv!10725 (array!30659) Bool)

(assert (=> start!42588 (and (array_inv!10725 _values!833) e!278889)))

(declare-fun b!475011 () Bool)

(assert (=> b!475011 (= e!278889 (and e!278885 mapRes!21916))))

(declare-fun condMapEmpty!21916 () Bool)

(declare-fun mapDefault!21916 () ValueCell!6389)

(assert (=> b!475011 (= condMapEmpty!21916 (= (arr!14747 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6389)) mapDefault!21916)))))

(declare-fun mapNonEmpty!21916 () Bool)

(declare-fun tp!42150 () Bool)

(assert (=> mapNonEmpty!21916 (= mapRes!21916 (and tp!42150 e!278887))))

(declare-fun mapRest!21916 () (Array (_ BitVec 32) ValueCell!6389))

(declare-fun mapKey!21916 () (_ BitVec 32))

(declare-fun mapValue!21916 () ValueCell!6389)

(assert (=> mapNonEmpty!21916 (= (arr!14747 _values!833) (store mapRest!21916 mapKey!21916 mapValue!21916))))

(declare-fun b!475012 () Bool)

(assert (=> b!475012 (= e!278888 (bvsgt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(declare-datatypes ((tuple2!8994 0))(
  ( (tuple2!8995 (_1!4508 (_ BitVec 64)) (_2!4508 V!19059)) )
))
(declare-datatypes ((List!9057 0))(
  ( (Nil!9054) (Cons!9053 (h!9909 tuple2!8994) (t!15022 List!9057)) )
))
(declare-datatypes ((ListLongMap!7897 0))(
  ( (ListLongMap!7898 (toList!3964 List!9057)) )
))
(declare-fun lt!216196 () ListLongMap!7897)

(declare-fun zeroValue!794 () V!19059)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19059)

(declare-fun getCurrentListMapNoExtraKeys!2131 (array!30657 array!30659 (_ BitVec 32) (_ BitVec 32) V!19059 V!19059 (_ BitVec 32) Int) ListLongMap!7897)

(assert (=> b!475012 (= lt!216196 (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19059)

(declare-fun lt!216197 () ListLongMap!7897)

(assert (=> b!475012 (= lt!216197 (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42588 res!283713) b!475007))

(assert (= (and b!475007 res!283712) b!475009))

(assert (= (and b!475009 res!283710) b!475006))

(assert (= (and b!475006 res!283711) b!475012))

(assert (= (and b!475011 condMapEmpty!21916) mapIsEmpty!21916))

(assert (= (and b!475011 (not condMapEmpty!21916)) mapNonEmpty!21916))

(get-info :version)

(assert (= (and mapNonEmpty!21916 ((_ is ValueCellFull!6389) mapValue!21916)) b!475008))

(assert (= (and b!475011 ((_ is ValueCellFull!6389) mapDefault!21916)) b!475010))

(assert (= start!42588 b!475011))

(declare-fun m!456761 () Bool)

(assert (=> start!42588 m!456761))

(declare-fun m!456763 () Bool)

(assert (=> start!42588 m!456763))

(declare-fun m!456765 () Bool)

(assert (=> start!42588 m!456765))

(declare-fun m!456767 () Bool)

(assert (=> b!475009 m!456767))

(declare-fun m!456769 () Bool)

(assert (=> mapNonEmpty!21916 m!456769))

(declare-fun m!456771 () Bool)

(assert (=> b!475012 m!456771))

(declare-fun m!456773 () Bool)

(assert (=> b!475012 m!456773))

(declare-fun m!456775 () Bool)

(assert (=> b!475006 m!456775))

(check-sat (not mapNonEmpty!21916) b_and!20491 (not b!475009) (not b_next!12037) (not b!475012) (not b!475006) (not start!42588) tp_is_empty!13465)
(check-sat b_and!20491 (not b_next!12037))
(get-model)

(declare-fun d!75401 () Bool)

(assert (=> d!75401 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42588 d!75401))

(declare-fun d!75403 () Bool)

(assert (=> d!75403 (= (array_inv!10724 _keys!1025) (bvsge (size!15099 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42588 d!75403))

(declare-fun d!75405 () Bool)

(assert (=> d!75405 (= (array_inv!10725 _values!833) (bvsge (size!15100 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42588 d!75405))

(declare-fun b!475079 () Bool)

(declare-fun e!278940 () ListLongMap!7897)

(assert (=> b!475079 (= e!278940 (ListLongMap!7898 Nil!9054))))

(declare-fun b!475080 () Bool)

(declare-fun e!278934 () Bool)

(declare-fun e!278938 () Bool)

(assert (=> b!475080 (= e!278934 e!278938)))

(declare-fun c!57078 () Bool)

(declare-fun e!278939 () Bool)

(assert (=> b!475080 (= c!57078 e!278939)))

(declare-fun res!283747 () Bool)

(assert (=> b!475080 (=> (not res!283747) (not e!278939))))

(assert (=> b!475080 (= res!283747 (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(declare-fun b!475081 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475081 (= e!278939 (validKeyInArray!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475081 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475082 () Bool)

(declare-datatypes ((Unit!13984 0))(
  ( (Unit!13985) )
))
(declare-fun lt!216226 () Unit!13984)

(declare-fun lt!216225 () Unit!13984)

(assert (=> b!475082 (= lt!216226 lt!216225)))

(declare-fun lt!216228 () ListLongMap!7897)

(declare-fun lt!216224 () (_ BitVec 64))

(declare-fun lt!216229 () V!19059)

(declare-fun lt!216230 () (_ BitVec 64))

(declare-fun contains!2545 (ListLongMap!7897 (_ BitVec 64)) Bool)

(declare-fun +!1788 (ListLongMap!7897 tuple2!8994) ListLongMap!7897)

(assert (=> b!475082 (not (contains!2545 (+!1788 lt!216228 (tuple2!8995 lt!216230 lt!216229)) lt!216224))))

(declare-fun addStillNotContains!168 (ListLongMap!7897 (_ BitVec 64) V!19059 (_ BitVec 64)) Unit!13984)

(assert (=> b!475082 (= lt!216225 (addStillNotContains!168 lt!216228 lt!216230 lt!216229 lt!216224))))

(assert (=> b!475082 (= lt!216224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7165 (ValueCell!6389 V!19059) V!19059)

(declare-fun dynLambda!930 (Int (_ BitVec 64)) V!19059)

(assert (=> b!475082 (= lt!216229 (get!7165 (select (arr!14747 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475082 (= lt!216230 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30546 () ListLongMap!7897)

(assert (=> b!475082 (= lt!216228 call!30546)))

(declare-fun e!278935 () ListLongMap!7897)

(assert (=> b!475082 (= e!278935 (+!1788 call!30546 (tuple2!8995 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000) (get!7165 (select (arr!14747 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475083 () Bool)

(assert (=> b!475083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(assert (=> b!475083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15100 _values!833)))))

(declare-fun lt!216227 () ListLongMap!7897)

(declare-fun e!278936 () Bool)

(declare-fun apply!334 (ListLongMap!7897 (_ BitVec 64)) V!19059)

(assert (=> b!475083 (= e!278936 (= (apply!334 lt!216227 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)) (get!7165 (select (arr!14747 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475084 () Bool)

(declare-fun e!278937 () Bool)

(assert (=> b!475084 (= e!278938 e!278937)))

(declare-fun c!57080 () Bool)

(assert (=> b!475084 (= c!57080 (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(declare-fun b!475085 () Bool)

(declare-fun isEmpty!585 (ListLongMap!7897) Bool)

(assert (=> b!475085 (= e!278937 (isEmpty!585 lt!216227))))

(declare-fun b!475087 () Bool)

(assert (=> b!475087 (= e!278935 call!30546)))

(declare-fun b!475088 () Bool)

(assert (=> b!475088 (= e!278938 e!278936)))

(assert (=> b!475088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(declare-fun res!283749 () Bool)

(assert (=> b!475088 (= res!283749 (contains!2545 lt!216227 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475088 (=> (not res!283749) (not e!278936))))

(declare-fun b!475089 () Bool)

(assert (=> b!475089 (= e!278940 e!278935)))

(declare-fun c!57081 () Bool)

(assert (=> b!475089 (= c!57081 (validKeyInArray!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30543 () Bool)

(assert (=> bm!30543 (= call!30546 (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475090 () Bool)

(declare-fun res!283748 () Bool)

(assert (=> b!475090 (=> (not res!283748) (not e!278934))))

(assert (=> b!475090 (= res!283748 (not (contains!2545 lt!216227 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475086 () Bool)

(assert (=> b!475086 (= e!278937 (= lt!216227 (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun d!75407 () Bool)

(assert (=> d!75407 e!278934))

(declare-fun res!283746 () Bool)

(assert (=> d!75407 (=> (not res!283746) (not e!278934))))

(assert (=> d!75407 (= res!283746 (not (contains!2545 lt!216227 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75407 (= lt!216227 e!278940)))

(declare-fun c!57079 () Bool)

(assert (=> d!75407 (= c!57079 (bvsge #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(assert (=> d!75407 (validMask!0 mask!1365)))

(assert (=> d!75407 (= (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216227)))

(assert (= (and d!75407 c!57079) b!475079))

(assert (= (and d!75407 (not c!57079)) b!475089))

(assert (= (and b!475089 c!57081) b!475082))

(assert (= (and b!475089 (not c!57081)) b!475087))

(assert (= (or b!475082 b!475087) bm!30543))

(assert (= (and d!75407 res!283746) b!475090))

(assert (= (and b!475090 res!283748) b!475080))

(assert (= (and b!475080 res!283747) b!475081))

(assert (= (and b!475080 c!57078) b!475088))

(assert (= (and b!475080 (not c!57078)) b!475084))

(assert (= (and b!475088 res!283749) b!475083))

(assert (= (and b!475084 c!57080) b!475086))

(assert (= (and b!475084 (not c!57080)) b!475085))

(declare-fun b_lambda!10235 () Bool)

(assert (=> (not b_lambda!10235) (not b!475082)))

(declare-fun t!15026 () Bool)

(declare-fun tb!3925 () Bool)

(assert (=> (and start!42588 (= defaultEntry!841 defaultEntry!841) t!15026) tb!3925))

(declare-fun result!7449 () Bool)

(assert (=> tb!3925 (= result!7449 tp_is_empty!13465)))

(assert (=> b!475082 t!15026))

(declare-fun b_and!20497 () Bool)

(assert (= b_and!20491 (and (=> t!15026 result!7449) b_and!20497)))

(declare-fun b_lambda!10237 () Bool)

(assert (=> (not b_lambda!10237) (not b!475083)))

(assert (=> b!475083 t!15026))

(declare-fun b_and!20499 () Bool)

(assert (= b_and!20497 (and (=> t!15026 result!7449) b_and!20499)))

(declare-fun m!456809 () Bool)

(assert (=> b!475085 m!456809))

(declare-fun m!456811 () Bool)

(assert (=> b!475090 m!456811))

(declare-fun m!456813 () Bool)

(assert (=> b!475082 m!456813))

(declare-fun m!456815 () Bool)

(assert (=> b!475082 m!456815))

(declare-fun m!456817 () Bool)

(assert (=> b!475082 m!456817))

(declare-fun m!456819 () Bool)

(assert (=> b!475082 m!456819))

(declare-fun m!456821 () Bool)

(assert (=> b!475082 m!456821))

(declare-fun m!456823 () Bool)

(assert (=> b!475082 m!456823))

(declare-fun m!456825 () Bool)

(assert (=> b!475082 m!456825))

(assert (=> b!475082 m!456821))

(assert (=> b!475082 m!456825))

(declare-fun m!456827 () Bool)

(assert (=> b!475082 m!456827))

(assert (=> b!475082 m!456813))

(assert (=> b!475081 m!456817))

(assert (=> b!475081 m!456817))

(declare-fun m!456829 () Bool)

(assert (=> b!475081 m!456829))

(assert (=> b!475088 m!456817))

(assert (=> b!475088 m!456817))

(declare-fun m!456831 () Bool)

(assert (=> b!475088 m!456831))

(declare-fun m!456833 () Bool)

(assert (=> bm!30543 m!456833))

(assert (=> b!475086 m!456833))

(declare-fun m!456835 () Bool)

(assert (=> d!75407 m!456835))

(assert (=> d!75407 m!456761))

(assert (=> b!475089 m!456817))

(assert (=> b!475089 m!456817))

(assert (=> b!475089 m!456829))

(assert (=> b!475083 m!456821))

(assert (=> b!475083 m!456825))

(assert (=> b!475083 m!456827))

(assert (=> b!475083 m!456817))

(assert (=> b!475083 m!456821))

(assert (=> b!475083 m!456817))

(declare-fun m!456837 () Bool)

(assert (=> b!475083 m!456837))

(assert (=> b!475083 m!456825))

(assert (=> b!475012 d!75407))

(declare-fun b!475093 () Bool)

(declare-fun e!278947 () ListLongMap!7897)

(assert (=> b!475093 (= e!278947 (ListLongMap!7898 Nil!9054))))

(declare-fun b!475094 () Bool)

(declare-fun e!278941 () Bool)

(declare-fun e!278945 () Bool)

(assert (=> b!475094 (= e!278941 e!278945)))

(declare-fun c!57082 () Bool)

(declare-fun e!278946 () Bool)

(assert (=> b!475094 (= c!57082 e!278946)))

(declare-fun res!283751 () Bool)

(assert (=> b!475094 (=> (not res!283751) (not e!278946))))

(assert (=> b!475094 (= res!283751 (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(declare-fun b!475095 () Bool)

(assert (=> b!475095 (= e!278946 (validKeyInArray!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475095 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475096 () Bool)

(declare-fun lt!216233 () Unit!13984)

(declare-fun lt!216232 () Unit!13984)

(assert (=> b!475096 (= lt!216233 lt!216232)))

(declare-fun lt!216236 () V!19059)

(declare-fun lt!216231 () (_ BitVec 64))

(declare-fun lt!216235 () ListLongMap!7897)

(declare-fun lt!216237 () (_ BitVec 64))

(assert (=> b!475096 (not (contains!2545 (+!1788 lt!216235 (tuple2!8995 lt!216237 lt!216236)) lt!216231))))

(assert (=> b!475096 (= lt!216232 (addStillNotContains!168 lt!216235 lt!216237 lt!216236 lt!216231))))

(assert (=> b!475096 (= lt!216231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475096 (= lt!216236 (get!7165 (select (arr!14747 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475096 (= lt!216237 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30547 () ListLongMap!7897)

(assert (=> b!475096 (= lt!216235 call!30547)))

(declare-fun e!278942 () ListLongMap!7897)

(assert (=> b!475096 (= e!278942 (+!1788 call!30547 (tuple2!8995 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000) (get!7165 (select (arr!14747 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475097 () Bool)

(assert (=> b!475097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(assert (=> b!475097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15100 _values!833)))))

(declare-fun e!278943 () Bool)

(declare-fun lt!216234 () ListLongMap!7897)

(assert (=> b!475097 (= e!278943 (= (apply!334 lt!216234 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)) (get!7165 (select (arr!14747 _values!833) #b00000000000000000000000000000000) (dynLambda!930 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475098 () Bool)

(declare-fun e!278944 () Bool)

(assert (=> b!475098 (= e!278945 e!278944)))

(declare-fun c!57084 () Bool)

(assert (=> b!475098 (= c!57084 (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(declare-fun b!475099 () Bool)

(assert (=> b!475099 (= e!278944 (isEmpty!585 lt!216234))))

(declare-fun b!475101 () Bool)

(assert (=> b!475101 (= e!278942 call!30547)))

(declare-fun b!475102 () Bool)

(assert (=> b!475102 (= e!278945 e!278943)))

(assert (=> b!475102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(declare-fun res!283753 () Bool)

(assert (=> b!475102 (= res!283753 (contains!2545 lt!216234 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475102 (=> (not res!283753) (not e!278943))))

(declare-fun b!475103 () Bool)

(assert (=> b!475103 (= e!278947 e!278942)))

(declare-fun c!57085 () Bool)

(assert (=> b!475103 (= c!57085 (validKeyInArray!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30544 () Bool)

(assert (=> bm!30544 (= call!30547 (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475104 () Bool)

(declare-fun res!283752 () Bool)

(assert (=> b!475104 (=> (not res!283752) (not e!278941))))

(assert (=> b!475104 (= res!283752 (not (contains!2545 lt!216234 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475100 () Bool)

(assert (=> b!475100 (= e!278944 (= lt!216234 (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun d!75409 () Bool)

(assert (=> d!75409 e!278941))

(declare-fun res!283750 () Bool)

(assert (=> d!75409 (=> (not res!283750) (not e!278941))))

(assert (=> d!75409 (= res!283750 (not (contains!2545 lt!216234 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75409 (= lt!216234 e!278947)))

(declare-fun c!57083 () Bool)

(assert (=> d!75409 (= c!57083 (bvsge #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(assert (=> d!75409 (validMask!0 mask!1365)))

(assert (=> d!75409 (= (getCurrentListMapNoExtraKeys!2131 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216234)))

(assert (= (and d!75409 c!57083) b!475093))

(assert (= (and d!75409 (not c!57083)) b!475103))

(assert (= (and b!475103 c!57085) b!475096))

(assert (= (and b!475103 (not c!57085)) b!475101))

(assert (= (or b!475096 b!475101) bm!30544))

(assert (= (and d!75409 res!283750) b!475104))

(assert (= (and b!475104 res!283752) b!475094))

(assert (= (and b!475094 res!283751) b!475095))

(assert (= (and b!475094 c!57082) b!475102))

(assert (= (and b!475094 (not c!57082)) b!475098))

(assert (= (and b!475102 res!283753) b!475097))

(assert (= (and b!475098 c!57084) b!475100))

(assert (= (and b!475098 (not c!57084)) b!475099))

(declare-fun b_lambda!10239 () Bool)

(assert (=> (not b_lambda!10239) (not b!475096)))

(assert (=> b!475096 t!15026))

(declare-fun b_and!20501 () Bool)

(assert (= b_and!20499 (and (=> t!15026 result!7449) b_and!20501)))

(declare-fun b_lambda!10241 () Bool)

(assert (=> (not b_lambda!10241) (not b!475097)))

(assert (=> b!475097 t!15026))

(declare-fun b_and!20503 () Bool)

(assert (= b_and!20501 (and (=> t!15026 result!7449) b_and!20503)))

(declare-fun m!456839 () Bool)

(assert (=> b!475099 m!456839))

(declare-fun m!456841 () Bool)

(assert (=> b!475104 m!456841))

(declare-fun m!456843 () Bool)

(assert (=> b!475096 m!456843))

(declare-fun m!456845 () Bool)

(assert (=> b!475096 m!456845))

(assert (=> b!475096 m!456817))

(declare-fun m!456847 () Bool)

(assert (=> b!475096 m!456847))

(assert (=> b!475096 m!456821))

(declare-fun m!456849 () Bool)

(assert (=> b!475096 m!456849))

(assert (=> b!475096 m!456825))

(assert (=> b!475096 m!456821))

(assert (=> b!475096 m!456825))

(assert (=> b!475096 m!456827))

(assert (=> b!475096 m!456843))

(assert (=> b!475095 m!456817))

(assert (=> b!475095 m!456817))

(assert (=> b!475095 m!456829))

(assert (=> b!475102 m!456817))

(assert (=> b!475102 m!456817))

(declare-fun m!456851 () Bool)

(assert (=> b!475102 m!456851))

(declare-fun m!456853 () Bool)

(assert (=> bm!30544 m!456853))

(assert (=> b!475100 m!456853))

(declare-fun m!456855 () Bool)

(assert (=> d!75409 m!456855))

(assert (=> d!75409 m!456761))

(assert (=> b!475103 m!456817))

(assert (=> b!475103 m!456817))

(assert (=> b!475103 m!456829))

(assert (=> b!475097 m!456821))

(assert (=> b!475097 m!456825))

(assert (=> b!475097 m!456827))

(assert (=> b!475097 m!456817))

(assert (=> b!475097 m!456821))

(assert (=> b!475097 m!456817))

(declare-fun m!456857 () Bool)

(assert (=> b!475097 m!456857))

(assert (=> b!475097 m!456825))

(assert (=> b!475012 d!75409))

(declare-fun b!475113 () Bool)

(declare-fun e!278954 () Bool)

(declare-fun call!30550 () Bool)

(assert (=> b!475113 (= e!278954 call!30550)))

(declare-fun bm!30547 () Bool)

(assert (=> bm!30547 (= call!30550 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475114 () Bool)

(declare-fun e!278955 () Bool)

(assert (=> b!475114 (= e!278955 call!30550)))

(declare-fun d!75411 () Bool)

(declare-fun res!283758 () Bool)

(declare-fun e!278956 () Bool)

(assert (=> d!75411 (=> res!283758 e!278956)))

(assert (=> d!75411 (= res!283758 (bvsge #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(assert (=> d!75411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!278956)))

(declare-fun b!475115 () Bool)

(assert (=> b!475115 (= e!278956 e!278955)))

(declare-fun c!57088 () Bool)

(assert (=> b!475115 (= c!57088 (validKeyInArray!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475116 () Bool)

(assert (=> b!475116 (= e!278955 e!278954)))

(declare-fun lt!216246 () (_ BitVec 64))

(assert (=> b!475116 (= lt!216246 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216244 () Unit!13984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30657 (_ BitVec 64) (_ BitVec 32)) Unit!13984)

(assert (=> b!475116 (= lt!216244 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216246 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475116 (arrayContainsKey!0 _keys!1025 lt!216246 #b00000000000000000000000000000000)))

(declare-fun lt!216245 () Unit!13984)

(assert (=> b!475116 (= lt!216245 lt!216244)))

(declare-fun res!283759 () Bool)

(declare-datatypes ((SeekEntryResult!3553 0))(
  ( (MissingZero!3553 (index!16391 (_ BitVec 32))) (Found!3553 (index!16392 (_ BitVec 32))) (Intermediate!3553 (undefined!4365 Bool) (index!16393 (_ BitVec 32)) (x!44606 (_ BitVec 32))) (Undefined!3553) (MissingVacant!3553 (index!16394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30657 (_ BitVec 32)) SeekEntryResult!3553)

(assert (=> b!475116 (= res!283759 (= (seekEntryOrOpen!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3553 #b00000000000000000000000000000000)))))

(assert (=> b!475116 (=> (not res!283759) (not e!278954))))

(assert (= (and d!75411 (not res!283758)) b!475115))

(assert (= (and b!475115 c!57088) b!475116))

(assert (= (and b!475115 (not c!57088)) b!475114))

(assert (= (and b!475116 res!283759) b!475113))

(assert (= (or b!475113 b!475114) bm!30547))

(declare-fun m!456859 () Bool)

(assert (=> bm!30547 m!456859))

(assert (=> b!475115 m!456817))

(assert (=> b!475115 m!456817))

(assert (=> b!475115 m!456829))

(assert (=> b!475116 m!456817))

(declare-fun m!456861 () Bool)

(assert (=> b!475116 m!456861))

(declare-fun m!456863 () Bool)

(assert (=> b!475116 m!456863))

(assert (=> b!475116 m!456817))

(declare-fun m!456865 () Bool)

(assert (=> b!475116 m!456865))

(assert (=> b!475009 d!75411))

(declare-fun d!75413 () Bool)

(declare-fun res!283768 () Bool)

(declare-fun e!278965 () Bool)

(assert (=> d!75413 (=> res!283768 e!278965)))

(assert (=> d!75413 (= res!283768 (bvsge #b00000000000000000000000000000000 (size!15099 _keys!1025)))))

(assert (=> d!75413 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9053) e!278965)))

(declare-fun b!475127 () Bool)

(declare-fun e!278968 () Bool)

(declare-fun contains!2546 (List!9056 (_ BitVec 64)) Bool)

(assert (=> b!475127 (= e!278968 (contains!2546 Nil!9053 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475128 () Bool)

(declare-fun e!278967 () Bool)

(declare-fun call!30553 () Bool)

(assert (=> b!475128 (= e!278967 call!30553)))

(declare-fun b!475129 () Bool)

(declare-fun e!278966 () Bool)

(assert (=> b!475129 (= e!278966 e!278967)))

(declare-fun c!57091 () Bool)

(assert (=> b!475129 (= c!57091 (validKeyInArray!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30550 () Bool)

(assert (=> bm!30550 (= call!30553 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57091 (Cons!9052 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000) Nil!9053) Nil!9053)))))

(declare-fun b!475130 () Bool)

(assert (=> b!475130 (= e!278967 call!30553)))

(declare-fun b!475131 () Bool)

(assert (=> b!475131 (= e!278965 e!278966)))

(declare-fun res!283767 () Bool)

(assert (=> b!475131 (=> (not res!283767) (not e!278966))))

(assert (=> b!475131 (= res!283767 (not e!278968))))

(declare-fun res!283766 () Bool)

(assert (=> b!475131 (=> (not res!283766) (not e!278968))))

(assert (=> b!475131 (= res!283766 (validKeyInArray!0 (select (arr!14746 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75413 (not res!283768)) b!475131))

(assert (= (and b!475131 res!283766) b!475127))

(assert (= (and b!475131 res!283767) b!475129))

(assert (= (and b!475129 c!57091) b!475128))

(assert (= (and b!475129 (not c!57091)) b!475130))

(assert (= (or b!475128 b!475130) bm!30550))

(assert (=> b!475127 m!456817))

(assert (=> b!475127 m!456817))

(declare-fun m!456867 () Bool)

(assert (=> b!475127 m!456867))

(assert (=> b!475129 m!456817))

(assert (=> b!475129 m!456817))

(assert (=> b!475129 m!456829))

(assert (=> bm!30550 m!456817))

(declare-fun m!456869 () Bool)

(assert (=> bm!30550 m!456869))

(assert (=> b!475131 m!456817))

(assert (=> b!475131 m!456817))

(assert (=> b!475131 m!456829))

(assert (=> b!475006 d!75413))

(declare-fun mapIsEmpty!21925 () Bool)

(declare-fun mapRes!21925 () Bool)

(assert (=> mapIsEmpty!21925 mapRes!21925))

(declare-fun mapNonEmpty!21925 () Bool)

(declare-fun tp!42166 () Bool)

(declare-fun e!278973 () Bool)

(assert (=> mapNonEmpty!21925 (= mapRes!21925 (and tp!42166 e!278973))))

(declare-fun mapRest!21925 () (Array (_ BitVec 32) ValueCell!6389))

(declare-fun mapValue!21925 () ValueCell!6389)

(declare-fun mapKey!21925 () (_ BitVec 32))

(assert (=> mapNonEmpty!21925 (= mapRest!21916 (store mapRest!21925 mapKey!21925 mapValue!21925))))

(declare-fun b!475139 () Bool)

(declare-fun e!278974 () Bool)

(assert (=> b!475139 (= e!278974 tp_is_empty!13465)))

(declare-fun condMapEmpty!21925 () Bool)

(declare-fun mapDefault!21925 () ValueCell!6389)

(assert (=> mapNonEmpty!21916 (= condMapEmpty!21925 (= mapRest!21916 ((as const (Array (_ BitVec 32) ValueCell!6389)) mapDefault!21925)))))

(assert (=> mapNonEmpty!21916 (= tp!42150 (and e!278974 mapRes!21925))))

(declare-fun b!475138 () Bool)

(assert (=> b!475138 (= e!278973 tp_is_empty!13465)))

(assert (= (and mapNonEmpty!21916 condMapEmpty!21925) mapIsEmpty!21925))

(assert (= (and mapNonEmpty!21916 (not condMapEmpty!21925)) mapNonEmpty!21925))

(assert (= (and mapNonEmpty!21925 ((_ is ValueCellFull!6389) mapValue!21925)) b!475138))

(assert (= (and mapNonEmpty!21916 ((_ is ValueCellFull!6389) mapDefault!21925)) b!475139))

(declare-fun m!456871 () Bool)

(assert (=> mapNonEmpty!21925 m!456871))

(declare-fun b_lambda!10243 () Bool)

(assert (= b_lambda!10241 (or (and start!42588 b_free!12037) b_lambda!10243)))

(declare-fun b_lambda!10245 () Bool)

(assert (= b_lambda!10235 (or (and start!42588 b_free!12037) b_lambda!10245)))

(declare-fun b_lambda!10247 () Bool)

(assert (= b_lambda!10239 (or (and start!42588 b_free!12037) b_lambda!10247)))

(declare-fun b_lambda!10249 () Bool)

(assert (= b_lambda!10237 (or (and start!42588 b_free!12037) b_lambda!10249)))

(check-sat (not b_lambda!10249) (not bm!30547) (not b!475102) (not b!475115) (not b_lambda!10247) (not b!475090) (not mapNonEmpty!21925) (not b!475100) (not b!475089) (not b!475099) (not b!475097) (not b!475127) (not b!475129) (not b!475086) (not b_lambda!10243) (not b_lambda!10245) b_and!20503 (not b!475104) (not bm!30543) (not b_next!12037) (not d!75409) (not b!475116) (not b!475096) (not d!75407) (not b!475088) (not b!475095) (not b!475131) (not b!475085) (not b!475081) (not bm!30550) tp_is_empty!13465 (not b!475083) (not b!475082) (not bm!30544) (not b!475103))
(check-sat b_and!20503 (not b_next!12037))
