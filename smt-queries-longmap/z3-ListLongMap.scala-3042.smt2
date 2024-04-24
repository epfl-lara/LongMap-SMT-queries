; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42662 () Bool)

(assert start!42662)

(declare-fun b_free!12061 () Bool)

(declare-fun b_next!12061 () Bool)

(assert (=> start!42662 (= b_free!12061 (not b_next!12061))))

(declare-fun tp!42232 () Bool)

(declare-fun b_and!20583 () Bool)

(assert (=> start!42662 (= tp!42232 b_and!20583)))

(declare-fun b!475938 () Bool)

(declare-fun e!279511 () Bool)

(declare-fun tp_is_empty!13489 () Bool)

(assert (=> b!475938 (= e!279511 tp_is_empty!13489)))

(declare-fun b!475939 () Bool)

(declare-fun e!279512 () Bool)

(declare-fun e!279508 () Bool)

(assert (=> b!475939 (= e!279512 (not e!279508))))

(declare-fun res!284192 () Bool)

(assert (=> b!475939 (=> res!284192 e!279508)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475939 (= res!284192 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!19091 0))(
  ( (V!19092 (val!6789 Int)) )
))
(declare-datatypes ((tuple2!8876 0))(
  ( (tuple2!8877 (_1!4449 (_ BitVec 64)) (_2!4449 V!19091)) )
))
(declare-datatypes ((List!8937 0))(
  ( (Nil!8934) (Cons!8933 (h!9789 tuple2!8876) (t!14909 List!8937)) )
))
(declare-datatypes ((ListLongMap!7791 0))(
  ( (ListLongMap!7792 (toList!3911 List!8937)) )
))
(declare-fun lt!216922 () ListLongMap!7791)

(declare-fun lt!216921 () ListLongMap!7791)

(assert (=> b!475939 (= lt!216922 lt!216921)))

(declare-fun minValueBefore!38 () V!19091)

(declare-fun zeroValue!794 () V!19091)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13992 0))(
  ( (Unit!13993) )
))
(declare-fun lt!216920 () Unit!13992)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30708 0))(
  ( (array!30709 (arr!14768 (Array (_ BitVec 32) (_ BitVec 64))) (size!15120 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30708)

(declare-datatypes ((ValueCell!6401 0))(
  ( (ValueCellFull!6401 (v!9085 V!19091)) (EmptyCell!6401) )
))
(declare-datatypes ((array!30710 0))(
  ( (array!30711 (arr!14769 (Array (_ BitVec 32) ValueCell!6401)) (size!15121 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30710)

(declare-fun minValueAfter!38 () V!19091)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!256 (array!30708 array!30710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 V!19091 V!19091 (_ BitVec 32) Int) Unit!13992)

(assert (=> b!475939 (= lt!216920 (lemmaNoChangeToArrayThenSameMapNoExtras!256 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2118 (array!30708 array!30710 (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 (_ BitVec 32) Int) ListLongMap!7791)

(assert (=> b!475939 (= lt!216921 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475939 (= lt!216922 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21961 () Bool)

(declare-fun mapRes!21961 () Bool)

(declare-fun tp!42231 () Bool)

(assert (=> mapNonEmpty!21961 (= mapRes!21961 (and tp!42231 e!279511))))

(declare-fun mapValue!21961 () ValueCell!6401)

(declare-fun mapKey!21961 () (_ BitVec 32))

(declare-fun mapRest!21961 () (Array (_ BitVec 32) ValueCell!6401))

(assert (=> mapNonEmpty!21961 (= (arr!14769 _values!833) (store mapRest!21961 mapKey!21961 mapValue!21961))))

(declare-fun b!475940 () Bool)

(declare-fun +!1769 (ListLongMap!7791 tuple2!8876) ListLongMap!7791)

(declare-fun getCurrentListMap!2248 (array!30708 array!30710 (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 (_ BitVec 32) Int) ListLongMap!7791)

(assert (=> b!475940 (= e!279508 (= (+!1769 (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(declare-fun b!475942 () Bool)

(declare-fun e!279510 () Bool)

(declare-fun e!279509 () Bool)

(assert (=> b!475942 (= e!279510 (and e!279509 mapRes!21961))))

(declare-fun condMapEmpty!21961 () Bool)

(declare-fun mapDefault!21961 () ValueCell!6401)

(assert (=> b!475942 (= condMapEmpty!21961 (= (arr!14769 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6401)) mapDefault!21961)))))

(declare-fun mapIsEmpty!21961 () Bool)

(assert (=> mapIsEmpty!21961 mapRes!21961))

(declare-fun b!475943 () Bool)

(declare-fun res!284189 () Bool)

(assert (=> b!475943 (=> (not res!284189) (not e!279512))))

(declare-datatypes ((List!8938 0))(
  ( (Nil!8935) (Cons!8934 (h!9790 (_ BitVec 64)) (t!14910 List!8938)) )
))
(declare-fun arrayNoDuplicates!0 (array!30708 (_ BitVec 32) List!8938) Bool)

(assert (=> b!475943 (= res!284189 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8935))))

(declare-fun b!475944 () Bool)

(declare-fun res!284190 () Bool)

(assert (=> b!475944 (=> (not res!284190) (not e!279512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30708 (_ BitVec 32)) Bool)

(assert (=> b!475944 (= res!284190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475945 () Bool)

(declare-fun res!284191 () Bool)

(assert (=> b!475945 (=> (not res!284191) (not e!279512))))

(assert (=> b!475945 (= res!284191 (and (= (size!15121 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15120 _keys!1025) (size!15121 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475941 () Bool)

(assert (=> b!475941 (= e!279509 tp_is_empty!13489)))

(declare-fun res!284188 () Bool)

(assert (=> start!42662 (=> (not res!284188) (not e!279512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42662 (= res!284188 (validMask!0 mask!1365))))

(assert (=> start!42662 e!279512))

(assert (=> start!42662 tp_is_empty!13489))

(assert (=> start!42662 tp!42232))

(assert (=> start!42662 true))

(declare-fun array_inv!10734 (array!30708) Bool)

(assert (=> start!42662 (array_inv!10734 _keys!1025)))

(declare-fun array_inv!10735 (array!30710) Bool)

(assert (=> start!42662 (and (array_inv!10735 _values!833) e!279510)))

(assert (= (and start!42662 res!284188) b!475945))

(assert (= (and b!475945 res!284191) b!475944))

(assert (= (and b!475944 res!284190) b!475943))

(assert (= (and b!475943 res!284189) b!475939))

(assert (= (and b!475939 (not res!284192)) b!475940))

(assert (= (and b!475942 condMapEmpty!21961) mapIsEmpty!21961))

(assert (= (and b!475942 (not condMapEmpty!21961)) mapNonEmpty!21961))

(get-info :version)

(assert (= (and mapNonEmpty!21961 ((_ is ValueCellFull!6401) mapValue!21961)) b!475938))

(assert (= (and b!475942 ((_ is ValueCellFull!6401) mapDefault!21961)) b!475941))

(assert (= start!42662 b!475942))

(declare-fun m!458411 () Bool)

(assert (=> b!475939 m!458411))

(declare-fun m!458413 () Bool)

(assert (=> b!475939 m!458413))

(declare-fun m!458415 () Bool)

(assert (=> b!475939 m!458415))

(declare-fun m!458417 () Bool)

(assert (=> mapNonEmpty!21961 m!458417))

(declare-fun m!458419 () Bool)

(assert (=> start!42662 m!458419))

(declare-fun m!458421 () Bool)

(assert (=> start!42662 m!458421))

(declare-fun m!458423 () Bool)

(assert (=> start!42662 m!458423))

(declare-fun m!458425 () Bool)

(assert (=> b!475944 m!458425))

(declare-fun m!458427 () Bool)

(assert (=> b!475943 m!458427))

(declare-fun m!458429 () Bool)

(assert (=> b!475940 m!458429))

(assert (=> b!475940 m!458429))

(declare-fun m!458431 () Bool)

(assert (=> b!475940 m!458431))

(declare-fun m!458433 () Bool)

(assert (=> b!475940 m!458433))

(check-sat (not b!475944) b_and!20583 (not start!42662) tp_is_empty!13489 (not b!475943) (not b!475940) (not b!475939) (not b_next!12061) (not mapNonEmpty!21961))
(check-sat b_and!20583 (not b_next!12061))
(get-model)

(declare-fun d!75707 () Bool)

(declare-fun e!279551 () Bool)

(assert (=> d!75707 e!279551))

(declare-fun res!284227 () Bool)

(assert (=> d!75707 (=> (not res!284227) (not e!279551))))

(declare-fun lt!216951 () ListLongMap!7791)

(declare-fun contains!2543 (ListLongMap!7791 (_ BitVec 64)) Bool)

(assert (=> d!75707 (= res!284227 (contains!2543 lt!216951 (_1!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lt!216949 () List!8937)

(assert (=> d!75707 (= lt!216951 (ListLongMap!7792 lt!216949))))

(declare-fun lt!216950 () Unit!13992)

(declare-fun lt!216952 () Unit!13992)

(assert (=> d!75707 (= lt!216950 lt!216952)))

(declare-datatypes ((Option!391 0))(
  ( (Some!390 (v!9088 V!19091)) (None!389) )
))
(declare-fun getValueByKey!385 (List!8937 (_ BitVec 64)) Option!391)

(assert (=> d!75707 (= (getValueByKey!385 lt!216949 (_1!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!390 (_2!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!207 (List!8937 (_ BitVec 64) V!19091) Unit!13992)

(assert (=> d!75707 (= lt!216952 (lemmaContainsTupThenGetReturnValue!207 lt!216949 (_1!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun insertStrictlySorted!210 (List!8937 (_ BitVec 64) V!19091) List!8937)

(assert (=> d!75707 (= lt!216949 (insertStrictlySorted!210 (toList!3911 (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841)) (_1!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (_2!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(assert (=> d!75707 (= (+!1769 (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) lt!216951)))

(declare-fun b!475998 () Bool)

(declare-fun res!284228 () Bool)

(assert (=> b!475998 (=> (not res!284228) (not e!279551))))

(assert (=> b!475998 (= res!284228 (= (getValueByKey!385 (toList!3911 lt!216951) (_1!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))) (Some!390 (_2!4449 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))))

(declare-fun b!475999 () Bool)

(declare-fun contains!2544 (List!8937 tuple2!8876) Bool)

(assert (=> b!475999 (= e!279551 (contains!2544 (toList!3911 lt!216951) (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75707 res!284227) b!475998))

(assert (= (and b!475998 res!284228) b!475999))

(declare-fun m!458483 () Bool)

(assert (=> d!75707 m!458483))

(declare-fun m!458485 () Bool)

(assert (=> d!75707 m!458485))

(declare-fun m!458487 () Bool)

(assert (=> d!75707 m!458487))

(declare-fun m!458489 () Bool)

(assert (=> d!75707 m!458489))

(declare-fun m!458491 () Bool)

(assert (=> b!475998 m!458491))

(declare-fun m!458493 () Bool)

(assert (=> b!475999 m!458493))

(assert (=> b!475940 d!75707))

(declare-fun b!476042 () Bool)

(declare-fun e!279578 () Bool)

(declare-fun e!279589 () Bool)

(assert (=> b!476042 (= e!279578 e!279589)))

(declare-fun c!57240 () Bool)

(assert (=> b!476042 (= c!57240 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476043 () Bool)

(declare-fun e!279587 () Bool)

(declare-fun lt!217010 () ListLongMap!7791)

(declare-fun apply!337 (ListLongMap!7791 (_ BitVec 64)) V!19091)

(assert (=> b!476043 (= e!279587 (= (apply!337 lt!217010 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!476044 () Bool)

(declare-fun e!279590 () Bool)

(declare-fun call!30661 () Bool)

(assert (=> b!476044 (= e!279590 (not call!30661))))

(declare-fun b!476045 () Bool)

(declare-fun res!284253 () Bool)

(assert (=> b!476045 (=> (not res!284253) (not e!279578))))

(assert (=> b!476045 (= res!284253 e!279590)))

(declare-fun c!57243 () Bool)

(assert (=> b!476045 (= c!57243 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30652 () Bool)

(declare-fun call!30655 () ListLongMap!7791)

(declare-fun call!30657 () ListLongMap!7791)

(assert (=> bm!30652 (= call!30655 call!30657)))

(declare-fun bm!30653 () Bool)

(declare-fun call!30656 () Bool)

(assert (=> bm!30653 (= call!30656 (contains!2543 lt!217010 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476046 () Bool)

(declare-fun e!279580 () Bool)

(declare-fun get!7173 (ValueCell!6401 V!19091) V!19091)

(declare-fun dynLambda!927 (Int (_ BitVec 64)) V!19091)

(assert (=> b!476046 (= e!279580 (= (apply!337 lt!217010 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15121 _values!833)))))

(assert (=> b!476046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun b!476047 () Bool)

(declare-fun e!279579 () Bool)

(assert (=> b!476047 (= e!279590 e!279579)))

(declare-fun res!284251 () Bool)

(assert (=> b!476047 (= res!284251 call!30661)))

(assert (=> b!476047 (=> (not res!284251) (not e!279579))))

(declare-fun b!476048 () Bool)

(declare-fun e!279588 () Unit!13992)

(declare-fun lt!216999 () Unit!13992)

(assert (=> b!476048 (= e!279588 lt!216999)))

(declare-fun lt!216998 () ListLongMap!7791)

(assert (=> b!476048 (= lt!216998 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217004 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217004 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217011 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217011 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217005 () Unit!13992)

(declare-fun addStillContains!295 (ListLongMap!7791 (_ BitVec 64) V!19091 (_ BitVec 64)) Unit!13992)

(assert (=> b!476048 (= lt!217005 (addStillContains!295 lt!216998 lt!217004 zeroValue!794 lt!217011))))

(assert (=> b!476048 (contains!2543 (+!1769 lt!216998 (tuple2!8877 lt!217004 zeroValue!794)) lt!217011)))

(declare-fun lt!217018 () Unit!13992)

(assert (=> b!476048 (= lt!217018 lt!217005)))

(declare-fun lt!217015 () ListLongMap!7791)

(assert (=> b!476048 (= lt!217015 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217001 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217001 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217017 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217017 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217007 () Unit!13992)

(declare-fun addApplyDifferent!295 (ListLongMap!7791 (_ BitVec 64) V!19091 (_ BitVec 64)) Unit!13992)

(assert (=> b!476048 (= lt!217007 (addApplyDifferent!295 lt!217015 lt!217001 minValueBefore!38 lt!217017))))

(assert (=> b!476048 (= (apply!337 (+!1769 lt!217015 (tuple2!8877 lt!217001 minValueBefore!38)) lt!217017) (apply!337 lt!217015 lt!217017))))

(declare-fun lt!217009 () Unit!13992)

(assert (=> b!476048 (= lt!217009 lt!217007)))

(declare-fun lt!217006 () ListLongMap!7791)

(assert (=> b!476048 (= lt!217006 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217002 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217013 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217013 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216997 () Unit!13992)

(assert (=> b!476048 (= lt!216997 (addApplyDifferent!295 lt!217006 lt!217002 zeroValue!794 lt!217013))))

(assert (=> b!476048 (= (apply!337 (+!1769 lt!217006 (tuple2!8877 lt!217002 zeroValue!794)) lt!217013) (apply!337 lt!217006 lt!217013))))

(declare-fun lt!217008 () Unit!13992)

(assert (=> b!476048 (= lt!217008 lt!216997)))

(declare-fun lt!217003 () ListLongMap!7791)

(assert (=> b!476048 (= lt!217003 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217016 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217016 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217012 () (_ BitVec 64))

(assert (=> b!476048 (= lt!217012 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476048 (= lt!216999 (addApplyDifferent!295 lt!217003 lt!217016 minValueBefore!38 lt!217012))))

(assert (=> b!476048 (= (apply!337 (+!1769 lt!217003 (tuple2!8877 lt!217016 minValueBefore!38)) lt!217012) (apply!337 lt!217003 lt!217012))))

(declare-fun bm!30654 () Bool)

(assert (=> bm!30654 (= call!30661 (contains!2543 lt!217010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476049 () Bool)

(assert (=> b!476049 (= e!279589 (not call!30656))))

(declare-fun b!476050 () Bool)

(declare-fun e!279585 () ListLongMap!7791)

(declare-fun call!30659 () ListLongMap!7791)

(assert (=> b!476050 (= e!279585 call!30659)))

(declare-fun b!476051 () Bool)

(assert (=> b!476051 (= e!279579 (= (apply!337 lt!217010 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!476052 () Bool)

(declare-fun e!279582 () ListLongMap!7791)

(declare-fun call!30660 () ListLongMap!7791)

(assert (=> b!476052 (= e!279582 (+!1769 call!30660 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!476053 () Bool)

(declare-fun c!57245 () Bool)

(assert (=> b!476053 (= c!57245 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279583 () ListLongMap!7791)

(assert (=> b!476053 (= e!279585 e!279583)))

(declare-fun b!476054 () Bool)

(declare-fun Unit!13998 () Unit!13992)

(assert (=> b!476054 (= e!279588 Unit!13998)))

(declare-fun b!476055 () Bool)

(assert (=> b!476055 (= e!279583 call!30659)))

(declare-fun bm!30655 () Bool)

(declare-fun call!30658 () ListLongMap!7791)

(assert (=> bm!30655 (= call!30657 call!30658)))

(declare-fun b!476056 () Bool)

(declare-fun e!279581 () Bool)

(assert (=> b!476056 (= e!279581 e!279580)))

(declare-fun res!284249 () Bool)

(assert (=> b!476056 (=> (not res!284249) (not e!279580))))

(assert (=> b!476056 (= res!284249 (contains!2543 lt!217010 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun b!476057 () Bool)

(assert (=> b!476057 (= e!279589 e!279587)))

(declare-fun res!284254 () Bool)

(assert (=> b!476057 (= res!284254 call!30656)))

(assert (=> b!476057 (=> (not res!284254) (not e!279587))))

(declare-fun b!476058 () Bool)

(declare-fun e!279586 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!476058 (= e!279586 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30656 () Bool)

(assert (=> bm!30656 (= call!30659 call!30660)))

(declare-fun b!476059 () Bool)

(declare-fun e!279584 () Bool)

(assert (=> b!476059 (= e!279584 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476060 () Bool)

(declare-fun res!284252 () Bool)

(assert (=> b!476060 (=> (not res!284252) (not e!279578))))

(assert (=> b!476060 (= res!284252 e!279581)))

(declare-fun res!284248 () Bool)

(assert (=> b!476060 (=> res!284248 e!279581)))

(assert (=> b!476060 (= res!284248 (not e!279586))))

(declare-fun res!284247 () Bool)

(assert (=> b!476060 (=> (not res!284247) (not e!279586))))

(assert (=> b!476060 (= res!284247 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun d!75709 () Bool)

(assert (=> d!75709 e!279578))

(declare-fun res!284255 () Bool)

(assert (=> d!75709 (=> (not res!284255) (not e!279578))))

(assert (=> d!75709 (= res!284255 (or (bvsge #b00000000000000000000000000000000 (size!15120 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))))

(declare-fun lt!217000 () ListLongMap!7791)

(assert (=> d!75709 (= lt!217010 lt!217000)))

(declare-fun lt!217014 () Unit!13992)

(assert (=> d!75709 (= lt!217014 e!279588)))

(declare-fun c!57242 () Bool)

(assert (=> d!75709 (= c!57242 e!279584)))

(declare-fun res!284250 () Bool)

(assert (=> d!75709 (=> (not res!284250) (not e!279584))))

(assert (=> d!75709 (= res!284250 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> d!75709 (= lt!217000 e!279582)))

(declare-fun c!57241 () Bool)

(assert (=> d!75709 (= c!57241 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75709 (validMask!0 mask!1365)))

(assert (=> d!75709 (= (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217010)))

(declare-fun b!476061 () Bool)

(assert (=> b!476061 (= e!279582 e!279585)))

(declare-fun c!57244 () Bool)

(assert (=> b!476061 (= c!57244 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30657 () Bool)

(assert (=> bm!30657 (= call!30660 (+!1769 (ite c!57241 call!30658 (ite c!57244 call!30657 call!30655)) (ite (or c!57241 c!57244) (tuple2!8877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!476062 () Bool)

(assert (=> b!476062 (= e!279583 call!30655)))

(declare-fun bm!30658 () Bool)

(assert (=> bm!30658 (= call!30658 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and d!75709 c!57241) b!476052))

(assert (= (and d!75709 (not c!57241)) b!476061))

(assert (= (and b!476061 c!57244) b!476050))

(assert (= (and b!476061 (not c!57244)) b!476053))

(assert (= (and b!476053 c!57245) b!476055))

(assert (= (and b!476053 (not c!57245)) b!476062))

(assert (= (or b!476055 b!476062) bm!30652))

(assert (= (or b!476050 bm!30652) bm!30655))

(assert (= (or b!476050 b!476055) bm!30656))

(assert (= (or b!476052 bm!30655) bm!30658))

(assert (= (or b!476052 bm!30656) bm!30657))

(assert (= (and d!75709 res!284250) b!476059))

(assert (= (and d!75709 c!57242) b!476048))

(assert (= (and d!75709 (not c!57242)) b!476054))

(assert (= (and d!75709 res!284255) b!476060))

(assert (= (and b!476060 res!284247) b!476058))

(assert (= (and b!476060 (not res!284248)) b!476056))

(assert (= (and b!476056 res!284249) b!476046))

(assert (= (and b!476060 res!284252) b!476045))

(assert (= (and b!476045 c!57243) b!476047))

(assert (= (and b!476045 (not c!57243)) b!476044))

(assert (= (and b!476047 res!284251) b!476051))

(assert (= (or b!476047 b!476044) bm!30654))

(assert (= (and b!476045 res!284253) b!476042))

(assert (= (and b!476042 c!57240) b!476057))

(assert (= (and b!476042 (not c!57240)) b!476049))

(assert (= (and b!476057 res!284254) b!476043))

(assert (= (or b!476057 b!476049) bm!30653))

(declare-fun b_lambda!10331 () Bool)

(assert (=> (not b_lambda!10331) (not b!476046)))

(declare-fun t!14916 () Bool)

(declare-fun tb!3931 () Bool)

(assert (=> (and start!42662 (= defaultEntry!841 defaultEntry!841) t!14916) tb!3931))

(declare-fun result!7467 () Bool)

(assert (=> tb!3931 (= result!7467 tp_is_empty!13489)))

(assert (=> b!476046 t!14916))

(declare-fun b_and!20589 () Bool)

(assert (= b_and!20583 (and (=> t!14916 result!7467) b_and!20589)))

(declare-fun m!458495 () Bool)

(assert (=> b!476052 m!458495))

(declare-fun m!458497 () Bool)

(assert (=> bm!30654 m!458497))

(declare-fun m!458499 () Bool)

(assert (=> b!476058 m!458499))

(assert (=> b!476058 m!458499))

(declare-fun m!458501 () Bool)

(assert (=> b!476058 m!458501))

(declare-fun m!458503 () Bool)

(assert (=> b!476046 m!458503))

(declare-fun m!458505 () Bool)

(assert (=> b!476046 m!458505))

(declare-fun m!458507 () Bool)

(assert (=> b!476046 m!458507))

(assert (=> b!476046 m!458503))

(assert (=> b!476046 m!458499))

(assert (=> b!476046 m!458505))

(assert (=> b!476046 m!458499))

(declare-fun m!458509 () Bool)

(assert (=> b!476046 m!458509))

(assert (=> b!476059 m!458499))

(assert (=> b!476059 m!458499))

(assert (=> b!476059 m!458501))

(declare-fun m!458511 () Bool)

(assert (=> bm!30657 m!458511))

(declare-fun m!458513 () Bool)

(assert (=> bm!30653 m!458513))

(assert (=> bm!30658 m!458415))

(assert (=> b!476056 m!458499))

(assert (=> b!476056 m!458499))

(declare-fun m!458515 () Bool)

(assert (=> b!476056 m!458515))

(assert (=> d!75709 m!458419))

(declare-fun m!458517 () Bool)

(assert (=> b!476051 m!458517))

(declare-fun m!458519 () Bool)

(assert (=> b!476043 m!458519))

(declare-fun m!458521 () Bool)

(assert (=> b!476048 m!458521))

(declare-fun m!458523 () Bool)

(assert (=> b!476048 m!458523))

(declare-fun m!458525 () Bool)

(assert (=> b!476048 m!458525))

(declare-fun m!458527 () Bool)

(assert (=> b!476048 m!458527))

(declare-fun m!458529 () Bool)

(assert (=> b!476048 m!458529))

(assert (=> b!476048 m!458415))

(declare-fun m!458531 () Bool)

(assert (=> b!476048 m!458531))

(declare-fun m!458533 () Bool)

(assert (=> b!476048 m!458533))

(assert (=> b!476048 m!458499))

(declare-fun m!458535 () Bool)

(assert (=> b!476048 m!458535))

(assert (=> b!476048 m!458523))

(assert (=> b!476048 m!458533))

(declare-fun m!458537 () Bool)

(assert (=> b!476048 m!458537))

(assert (=> b!476048 m!458535))

(declare-fun m!458539 () Bool)

(assert (=> b!476048 m!458539))

(declare-fun m!458541 () Bool)

(assert (=> b!476048 m!458541))

(declare-fun m!458543 () Bool)

(assert (=> b!476048 m!458543))

(declare-fun m!458545 () Bool)

(assert (=> b!476048 m!458545))

(declare-fun m!458547 () Bool)

(assert (=> b!476048 m!458547))

(assert (=> b!476048 m!458543))

(declare-fun m!458549 () Bool)

(assert (=> b!476048 m!458549))

(assert (=> b!475940 d!75709))

(declare-fun b!476065 () Bool)

(declare-fun e!279591 () Bool)

(declare-fun e!279602 () Bool)

(assert (=> b!476065 (= e!279591 e!279602)))

(declare-fun c!57246 () Bool)

(assert (=> b!476065 (= c!57246 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!476066 () Bool)

(declare-fun e!279600 () Bool)

(declare-fun lt!217032 () ListLongMap!7791)

(assert (=> b!476066 (= e!279600 (= (apply!337 lt!217032 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!476067 () Bool)

(declare-fun e!279603 () Bool)

(declare-fun call!30668 () Bool)

(assert (=> b!476067 (= e!279603 (not call!30668))))

(declare-fun b!476068 () Bool)

(declare-fun res!284262 () Bool)

(assert (=> b!476068 (=> (not res!284262) (not e!279591))))

(assert (=> b!476068 (= res!284262 e!279603)))

(declare-fun c!57249 () Bool)

(assert (=> b!476068 (= c!57249 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30659 () Bool)

(declare-fun call!30662 () ListLongMap!7791)

(declare-fun call!30664 () ListLongMap!7791)

(assert (=> bm!30659 (= call!30662 call!30664)))

(declare-fun bm!30660 () Bool)

(declare-fun call!30663 () Bool)

(assert (=> bm!30660 (= call!30663 (contains!2543 lt!217032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!279593 () Bool)

(declare-fun b!476069 () Bool)

(assert (=> b!476069 (= e!279593 (= (apply!337 lt!217032 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!476069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15121 _values!833)))))

(assert (=> b!476069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun b!476070 () Bool)

(declare-fun e!279592 () Bool)

(assert (=> b!476070 (= e!279603 e!279592)))

(declare-fun res!284260 () Bool)

(assert (=> b!476070 (= res!284260 call!30668)))

(assert (=> b!476070 (=> (not res!284260) (not e!279592))))

(declare-fun b!476071 () Bool)

(declare-fun e!279601 () Unit!13992)

(declare-fun lt!217021 () Unit!13992)

(assert (=> b!476071 (= e!279601 lt!217021)))

(declare-fun lt!217020 () ListLongMap!7791)

(assert (=> b!476071 (= lt!217020 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217026 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217033 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217033 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217027 () Unit!13992)

(assert (=> b!476071 (= lt!217027 (addStillContains!295 lt!217020 lt!217026 zeroValue!794 lt!217033))))

(assert (=> b!476071 (contains!2543 (+!1769 lt!217020 (tuple2!8877 lt!217026 zeroValue!794)) lt!217033)))

(declare-fun lt!217040 () Unit!13992)

(assert (=> b!476071 (= lt!217040 lt!217027)))

(declare-fun lt!217037 () ListLongMap!7791)

(assert (=> b!476071 (= lt!217037 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217023 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217023 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217039 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217039 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217029 () Unit!13992)

(assert (=> b!476071 (= lt!217029 (addApplyDifferent!295 lt!217037 lt!217023 minValueAfter!38 lt!217039))))

(assert (=> b!476071 (= (apply!337 (+!1769 lt!217037 (tuple2!8877 lt!217023 minValueAfter!38)) lt!217039) (apply!337 lt!217037 lt!217039))))

(declare-fun lt!217031 () Unit!13992)

(assert (=> b!476071 (= lt!217031 lt!217029)))

(declare-fun lt!217028 () ListLongMap!7791)

(assert (=> b!476071 (= lt!217028 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217024 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217035 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217035 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217019 () Unit!13992)

(assert (=> b!476071 (= lt!217019 (addApplyDifferent!295 lt!217028 lt!217024 zeroValue!794 lt!217035))))

(assert (=> b!476071 (= (apply!337 (+!1769 lt!217028 (tuple2!8877 lt!217024 zeroValue!794)) lt!217035) (apply!337 lt!217028 lt!217035))))

(declare-fun lt!217030 () Unit!13992)

(assert (=> b!476071 (= lt!217030 lt!217019)))

(declare-fun lt!217025 () ListLongMap!7791)

(assert (=> b!476071 (= lt!217025 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217038 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217038 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217034 () (_ BitVec 64))

(assert (=> b!476071 (= lt!217034 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!476071 (= lt!217021 (addApplyDifferent!295 lt!217025 lt!217038 minValueAfter!38 lt!217034))))

(assert (=> b!476071 (= (apply!337 (+!1769 lt!217025 (tuple2!8877 lt!217038 minValueAfter!38)) lt!217034) (apply!337 lt!217025 lt!217034))))

(declare-fun bm!30661 () Bool)

(assert (=> bm!30661 (= call!30668 (contains!2543 lt!217032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!476072 () Bool)

(assert (=> b!476072 (= e!279602 (not call!30663))))

(declare-fun b!476073 () Bool)

(declare-fun e!279598 () ListLongMap!7791)

(declare-fun call!30666 () ListLongMap!7791)

(assert (=> b!476073 (= e!279598 call!30666)))

(declare-fun b!476074 () Bool)

(assert (=> b!476074 (= e!279592 (= (apply!337 lt!217032 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!476075 () Bool)

(declare-fun e!279595 () ListLongMap!7791)

(declare-fun call!30667 () ListLongMap!7791)

(assert (=> b!476075 (= e!279595 (+!1769 call!30667 (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!476076 () Bool)

(declare-fun c!57251 () Bool)

(assert (=> b!476076 (= c!57251 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279596 () ListLongMap!7791)

(assert (=> b!476076 (= e!279598 e!279596)))

(declare-fun b!476077 () Bool)

(declare-fun Unit!13999 () Unit!13992)

(assert (=> b!476077 (= e!279601 Unit!13999)))

(declare-fun b!476078 () Bool)

(assert (=> b!476078 (= e!279596 call!30666)))

(declare-fun bm!30662 () Bool)

(declare-fun call!30665 () ListLongMap!7791)

(assert (=> bm!30662 (= call!30664 call!30665)))

(declare-fun b!476079 () Bool)

(declare-fun e!279594 () Bool)

(assert (=> b!476079 (= e!279594 e!279593)))

(declare-fun res!284258 () Bool)

(assert (=> b!476079 (=> (not res!284258) (not e!279593))))

(assert (=> b!476079 (= res!284258 (contains!2543 lt!217032 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476079 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun b!476080 () Bool)

(assert (=> b!476080 (= e!279602 e!279600)))

(declare-fun res!284263 () Bool)

(assert (=> b!476080 (= res!284263 call!30663)))

(assert (=> b!476080 (=> (not res!284263) (not e!279600))))

(declare-fun b!476081 () Bool)

(declare-fun e!279599 () Bool)

(assert (=> b!476081 (= e!279599 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30663 () Bool)

(assert (=> bm!30663 (= call!30666 call!30667)))

(declare-fun b!476082 () Bool)

(declare-fun e!279597 () Bool)

(assert (=> b!476082 (= e!279597 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476083 () Bool)

(declare-fun res!284261 () Bool)

(assert (=> b!476083 (=> (not res!284261) (not e!279591))))

(assert (=> b!476083 (= res!284261 e!279594)))

(declare-fun res!284257 () Bool)

(assert (=> b!476083 (=> res!284257 e!279594)))

(assert (=> b!476083 (= res!284257 (not e!279599))))

(declare-fun res!284256 () Bool)

(assert (=> b!476083 (=> (not res!284256) (not e!279599))))

(assert (=> b!476083 (= res!284256 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun d!75711 () Bool)

(assert (=> d!75711 e!279591))

(declare-fun res!284264 () Bool)

(assert (=> d!75711 (=> (not res!284264) (not e!279591))))

(assert (=> d!75711 (= res!284264 (or (bvsge #b00000000000000000000000000000000 (size!15120 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))))

(declare-fun lt!217022 () ListLongMap!7791)

(assert (=> d!75711 (= lt!217032 lt!217022)))

(declare-fun lt!217036 () Unit!13992)

(assert (=> d!75711 (= lt!217036 e!279601)))

(declare-fun c!57248 () Bool)

(assert (=> d!75711 (= c!57248 e!279597)))

(declare-fun res!284259 () Bool)

(assert (=> d!75711 (=> (not res!284259) (not e!279597))))

(assert (=> d!75711 (= res!284259 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> d!75711 (= lt!217022 e!279595)))

(declare-fun c!57247 () Bool)

(assert (=> d!75711 (= c!57247 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75711 (validMask!0 mask!1365)))

(assert (=> d!75711 (= (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217032)))

(declare-fun b!476084 () Bool)

(assert (=> b!476084 (= e!279595 e!279598)))

(declare-fun c!57250 () Bool)

(assert (=> b!476084 (= c!57250 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30664 () Bool)

(assert (=> bm!30664 (= call!30667 (+!1769 (ite c!57247 call!30665 (ite c!57250 call!30664 call!30662)) (ite (or c!57247 c!57250) (tuple2!8877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8877 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!476085 () Bool)

(assert (=> b!476085 (= e!279596 call!30662)))

(declare-fun bm!30665 () Bool)

(assert (=> bm!30665 (= call!30665 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and d!75711 c!57247) b!476075))

(assert (= (and d!75711 (not c!57247)) b!476084))

(assert (= (and b!476084 c!57250) b!476073))

(assert (= (and b!476084 (not c!57250)) b!476076))

(assert (= (and b!476076 c!57251) b!476078))

(assert (= (and b!476076 (not c!57251)) b!476085))

(assert (= (or b!476078 b!476085) bm!30659))

(assert (= (or b!476073 bm!30659) bm!30662))

(assert (= (or b!476073 b!476078) bm!30663))

(assert (= (or b!476075 bm!30662) bm!30665))

(assert (= (or b!476075 bm!30663) bm!30664))

(assert (= (and d!75711 res!284259) b!476082))

(assert (= (and d!75711 c!57248) b!476071))

(assert (= (and d!75711 (not c!57248)) b!476077))

(assert (= (and d!75711 res!284264) b!476083))

(assert (= (and b!476083 res!284256) b!476081))

(assert (= (and b!476083 (not res!284257)) b!476079))

(assert (= (and b!476079 res!284258) b!476069))

(assert (= (and b!476083 res!284261) b!476068))

(assert (= (and b!476068 c!57249) b!476070))

(assert (= (and b!476068 (not c!57249)) b!476067))

(assert (= (and b!476070 res!284260) b!476074))

(assert (= (or b!476070 b!476067) bm!30661))

(assert (= (and b!476068 res!284262) b!476065))

(assert (= (and b!476065 c!57246) b!476080))

(assert (= (and b!476065 (not c!57246)) b!476072))

(assert (= (and b!476080 res!284263) b!476066))

(assert (= (or b!476080 b!476072) bm!30660))

(declare-fun b_lambda!10333 () Bool)

(assert (=> (not b_lambda!10333) (not b!476069)))

(assert (=> b!476069 t!14916))

(declare-fun b_and!20591 () Bool)

(assert (= b_and!20589 (and (=> t!14916 result!7467) b_and!20591)))

(declare-fun m!458551 () Bool)

(assert (=> b!476075 m!458551))

(declare-fun m!458553 () Bool)

(assert (=> bm!30661 m!458553))

(assert (=> b!476081 m!458499))

(assert (=> b!476081 m!458499))

(assert (=> b!476081 m!458501))

(assert (=> b!476069 m!458503))

(assert (=> b!476069 m!458505))

(assert (=> b!476069 m!458507))

(assert (=> b!476069 m!458503))

(assert (=> b!476069 m!458499))

(assert (=> b!476069 m!458505))

(assert (=> b!476069 m!458499))

(declare-fun m!458555 () Bool)

(assert (=> b!476069 m!458555))

(assert (=> b!476082 m!458499))

(assert (=> b!476082 m!458499))

(assert (=> b!476082 m!458501))

(declare-fun m!458557 () Bool)

(assert (=> bm!30664 m!458557))

(declare-fun m!458559 () Bool)

(assert (=> bm!30660 m!458559))

(assert (=> bm!30665 m!458413))

(assert (=> b!476079 m!458499))

(assert (=> b!476079 m!458499))

(declare-fun m!458561 () Bool)

(assert (=> b!476079 m!458561))

(assert (=> d!75711 m!458419))

(declare-fun m!458563 () Bool)

(assert (=> b!476074 m!458563))

(declare-fun m!458565 () Bool)

(assert (=> b!476066 m!458565))

(declare-fun m!458567 () Bool)

(assert (=> b!476071 m!458567))

(declare-fun m!458569 () Bool)

(assert (=> b!476071 m!458569))

(declare-fun m!458571 () Bool)

(assert (=> b!476071 m!458571))

(declare-fun m!458573 () Bool)

(assert (=> b!476071 m!458573))

(declare-fun m!458575 () Bool)

(assert (=> b!476071 m!458575))

(assert (=> b!476071 m!458413))

(declare-fun m!458577 () Bool)

(assert (=> b!476071 m!458577))

(declare-fun m!458579 () Bool)

(assert (=> b!476071 m!458579))

(assert (=> b!476071 m!458499))

(declare-fun m!458581 () Bool)

(assert (=> b!476071 m!458581))

(assert (=> b!476071 m!458569))

(assert (=> b!476071 m!458579))

(declare-fun m!458583 () Bool)

(assert (=> b!476071 m!458583))

(assert (=> b!476071 m!458581))

(declare-fun m!458585 () Bool)

(assert (=> b!476071 m!458585))

(declare-fun m!458587 () Bool)

(assert (=> b!476071 m!458587))

(declare-fun m!458589 () Bool)

(assert (=> b!476071 m!458589))

(declare-fun m!458591 () Bool)

(assert (=> b!476071 m!458591))

(declare-fun m!458593 () Bool)

(assert (=> b!476071 m!458593))

(assert (=> b!476071 m!458589))

(declare-fun m!458595 () Bool)

(assert (=> b!476071 m!458595))

(assert (=> b!475940 d!75711))

(declare-fun b!476096 () Bool)

(declare-fun e!279614 () Bool)

(declare-fun call!30671 () Bool)

(assert (=> b!476096 (= e!279614 call!30671)))

(declare-fun b!476097 () Bool)

(declare-fun e!279615 () Bool)

(declare-fun e!279613 () Bool)

(assert (=> b!476097 (= e!279615 e!279613)))

(declare-fun res!284273 () Bool)

(assert (=> b!476097 (=> (not res!284273) (not e!279613))))

(declare-fun e!279612 () Bool)

(assert (=> b!476097 (= res!284273 (not e!279612))))

(declare-fun res!284272 () Bool)

(assert (=> b!476097 (=> (not res!284272) (not e!279612))))

(assert (=> b!476097 (= res!284272 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75713 () Bool)

(declare-fun res!284271 () Bool)

(assert (=> d!75713 (=> res!284271 e!279615)))

(assert (=> d!75713 (= res!284271 (bvsge #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> d!75713 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8935) e!279615)))

(declare-fun b!476098 () Bool)

(assert (=> b!476098 (= e!279614 call!30671)))

(declare-fun b!476099 () Bool)

(declare-fun contains!2545 (List!8938 (_ BitVec 64)) Bool)

(assert (=> b!476099 (= e!279612 (contains!2545 Nil!8935 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30668 () Bool)

(declare-fun c!57254 () Bool)

(assert (=> bm!30668 (= call!30671 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57254 (Cons!8934 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000) Nil!8935) Nil!8935)))))

(declare-fun b!476100 () Bool)

(assert (=> b!476100 (= e!279613 e!279614)))

(assert (=> b!476100 (= c!57254 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75713 (not res!284271)) b!476097))

(assert (= (and b!476097 res!284272) b!476099))

(assert (= (and b!476097 res!284273) b!476100))

(assert (= (and b!476100 c!57254) b!476098))

(assert (= (and b!476100 (not c!57254)) b!476096))

(assert (= (or b!476098 b!476096) bm!30668))

(assert (=> b!476097 m!458499))

(assert (=> b!476097 m!458499))

(assert (=> b!476097 m!458501))

(assert (=> b!476099 m!458499))

(assert (=> b!476099 m!458499))

(declare-fun m!458597 () Bool)

(assert (=> b!476099 m!458597))

(assert (=> bm!30668 m!458499))

(declare-fun m!458599 () Bool)

(assert (=> bm!30668 m!458599))

(assert (=> b!476100 m!458499))

(assert (=> b!476100 m!458499))

(assert (=> b!476100 m!458501))

(assert (=> b!475943 d!75713))

(declare-fun d!75715 () Bool)

(assert (=> d!75715 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42662 d!75715))

(declare-fun d!75717 () Bool)

(assert (=> d!75717 (= (array_inv!10734 _keys!1025) (bvsge (size!15120 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42662 d!75717))

(declare-fun d!75719 () Bool)

(assert (=> d!75719 (= (array_inv!10735 _values!833) (bvsge (size!15121 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42662 d!75719))

(declare-fun d!75721 () Bool)

(declare-fun res!284278 () Bool)

(declare-fun e!279623 () Bool)

(assert (=> d!75721 (=> res!284278 e!279623)))

(assert (=> d!75721 (= res!284278 (bvsge #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> d!75721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279623)))

(declare-fun b!476109 () Bool)

(declare-fun e!279624 () Bool)

(assert (=> b!476109 (= e!279623 e!279624)))

(declare-fun c!57257 () Bool)

(assert (=> b!476109 (= c!57257 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476110 () Bool)

(declare-fun e!279622 () Bool)

(declare-fun call!30674 () Bool)

(assert (=> b!476110 (= e!279622 call!30674)))

(declare-fun b!476111 () Bool)

(assert (=> b!476111 (= e!279624 e!279622)))

(declare-fun lt!217049 () (_ BitVec 64))

(assert (=> b!476111 (= lt!217049 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!217047 () Unit!13992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30708 (_ BitVec 64) (_ BitVec 32)) Unit!13992)

(assert (=> b!476111 (= lt!217047 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!217049 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!476111 (arrayContainsKey!0 _keys!1025 lt!217049 #b00000000000000000000000000000000)))

(declare-fun lt!217048 () Unit!13992)

(assert (=> b!476111 (= lt!217048 lt!217047)))

(declare-fun res!284279 () Bool)

(declare-datatypes ((SeekEntryResult!3510 0))(
  ( (MissingZero!3510 (index!16219 (_ BitVec 32))) (Found!3510 (index!16220 (_ BitVec 32))) (Intermediate!3510 (undefined!4322 Bool) (index!16221 (_ BitVec 32)) (x!44630 (_ BitVec 32))) (Undefined!3510) (MissingVacant!3510 (index!16222 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30708 (_ BitVec 32)) SeekEntryResult!3510)

(assert (=> b!476111 (= res!284279 (= (seekEntryOrOpen!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3510 #b00000000000000000000000000000000)))))

(assert (=> b!476111 (=> (not res!284279) (not e!279622))))

(declare-fun b!476112 () Bool)

(assert (=> b!476112 (= e!279624 call!30674)))

(declare-fun bm!30671 () Bool)

(assert (=> bm!30671 (= call!30674 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75721 (not res!284278)) b!476109))

(assert (= (and b!476109 c!57257) b!476111))

(assert (= (and b!476109 (not c!57257)) b!476112))

(assert (= (and b!476111 res!284279) b!476110))

(assert (= (or b!476110 b!476112) bm!30671))

(assert (=> b!476109 m!458499))

(assert (=> b!476109 m!458499))

(assert (=> b!476109 m!458501))

(assert (=> b!476111 m!458499))

(declare-fun m!458601 () Bool)

(assert (=> b!476111 m!458601))

(declare-fun m!458603 () Bool)

(assert (=> b!476111 m!458603))

(assert (=> b!476111 m!458499))

(declare-fun m!458605 () Bool)

(assert (=> b!476111 m!458605))

(declare-fun m!458607 () Bool)

(assert (=> bm!30671 m!458607))

(assert (=> b!475944 d!75721))

(declare-fun d!75723 () Bool)

(assert (=> d!75723 (= (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!217052 () Unit!13992)

(declare-fun choose!1365 (array!30708 array!30710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19091 V!19091 V!19091 V!19091 (_ BitVec 32) Int) Unit!13992)

(assert (=> d!75723 (= lt!217052 (choose!1365 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75723 (validMask!0 mask!1365)))

(assert (=> d!75723 (= (lemmaNoChangeToArrayThenSameMapNoExtras!256 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217052)))

(declare-fun bs!15130 () Bool)

(assert (= bs!15130 d!75723))

(assert (=> bs!15130 m!458415))

(assert (=> bs!15130 m!458413))

(declare-fun m!458609 () Bool)

(assert (=> bs!15130 m!458609))

(assert (=> bs!15130 m!458419))

(assert (=> b!475939 d!75723))

(declare-fun b!476137 () Bool)

(declare-fun e!279645 () Bool)

(declare-fun lt!217071 () ListLongMap!7791)

(declare-fun isEmpty!590 (ListLongMap!7791) Bool)

(assert (=> b!476137 (= e!279645 (isEmpty!590 lt!217071))))

(declare-fun d!75725 () Bool)

(declare-fun e!279639 () Bool)

(assert (=> d!75725 e!279639))

(declare-fun res!284291 () Bool)

(assert (=> d!75725 (=> (not res!284291) (not e!279639))))

(assert (=> d!75725 (= res!284291 (not (contains!2543 lt!217071 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279640 () ListLongMap!7791)

(assert (=> d!75725 (= lt!217071 e!279640)))

(declare-fun c!57268 () Bool)

(assert (=> d!75725 (= c!57268 (bvsge #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> d!75725 (validMask!0 mask!1365)))

(assert (=> d!75725 (= (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217071)))

(declare-fun b!476138 () Bool)

(assert (=> b!476138 (= e!279640 (ListLongMap!7792 Nil!8934))))

(declare-fun b!476139 () Bool)

(declare-fun e!279644 () ListLongMap!7791)

(assert (=> b!476139 (= e!279640 e!279644)))

(declare-fun c!57269 () Bool)

(assert (=> b!476139 (= c!57269 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476140 () Bool)

(declare-fun lt!217067 () Unit!13992)

(declare-fun lt!217069 () Unit!13992)

(assert (=> b!476140 (= lt!217067 lt!217069)))

(declare-fun lt!217073 () (_ BitVec 64))

(declare-fun lt!217070 () (_ BitVec 64))

(declare-fun lt!217072 () V!19091)

(declare-fun lt!217068 () ListLongMap!7791)

(assert (=> b!476140 (not (contains!2543 (+!1769 lt!217068 (tuple2!8877 lt!217073 lt!217072)) lt!217070))))

(declare-fun addStillNotContains!172 (ListLongMap!7791 (_ BitVec 64) V!19091 (_ BitVec 64)) Unit!13992)

(assert (=> b!476140 (= lt!217069 (addStillNotContains!172 lt!217068 lt!217073 lt!217072 lt!217070))))

(assert (=> b!476140 (= lt!217070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476140 (= lt!217072 (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476140 (= lt!217073 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30677 () ListLongMap!7791)

(assert (=> b!476140 (= lt!217068 call!30677)))

(assert (=> b!476140 (= e!279644 (+!1769 call!30677 (tuple2!8877 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000) (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476141 () Bool)

(declare-fun e!279642 () Bool)

(declare-fun e!279643 () Bool)

(assert (=> b!476141 (= e!279642 e!279643)))

(assert (=> b!476141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun res!284290 () Bool)

(assert (=> b!476141 (= res!284290 (contains!2543 lt!217071 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476141 (=> (not res!284290) (not e!279643))))

(declare-fun bm!30674 () Bool)

(assert (=> bm!30674 (= call!30677 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476142 () Bool)

(assert (=> b!476142 (= e!279644 call!30677)))

(declare-fun b!476143 () Bool)

(assert (=> b!476143 (= e!279639 e!279642)))

(declare-fun c!57266 () Bool)

(declare-fun e!279641 () Bool)

(assert (=> b!476143 (= c!57266 e!279641)))

(declare-fun res!284288 () Bool)

(assert (=> b!476143 (=> (not res!284288) (not e!279641))))

(assert (=> b!476143 (= res!284288 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun b!476144 () Bool)

(assert (=> b!476144 (= e!279641 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476144 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!476145 () Bool)

(assert (=> b!476145 (= e!279645 (= lt!217071 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!476146 () Bool)

(declare-fun res!284289 () Bool)

(assert (=> b!476146 (=> (not res!284289) (not e!279639))))

(assert (=> b!476146 (= res!284289 (not (contains!2543 lt!217071 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476147 () Bool)

(assert (=> b!476147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> b!476147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15121 _values!833)))))

(assert (=> b!476147 (= e!279643 (= (apply!337 lt!217071 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476148 () Bool)

(assert (=> b!476148 (= e!279642 e!279645)))

(declare-fun c!57267 () Bool)

(assert (=> b!476148 (= c!57267 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (= (and d!75725 c!57268) b!476138))

(assert (= (and d!75725 (not c!57268)) b!476139))

(assert (= (and b!476139 c!57269) b!476140))

(assert (= (and b!476139 (not c!57269)) b!476142))

(assert (= (or b!476140 b!476142) bm!30674))

(assert (= (and d!75725 res!284291) b!476146))

(assert (= (and b!476146 res!284289) b!476143))

(assert (= (and b!476143 res!284288) b!476144))

(assert (= (and b!476143 c!57266) b!476141))

(assert (= (and b!476143 (not c!57266)) b!476148))

(assert (= (and b!476141 res!284290) b!476147))

(assert (= (and b!476148 c!57267) b!476145))

(assert (= (and b!476148 (not c!57267)) b!476137))

(declare-fun b_lambda!10335 () Bool)

(assert (=> (not b_lambda!10335) (not b!476140)))

(assert (=> b!476140 t!14916))

(declare-fun b_and!20593 () Bool)

(assert (= b_and!20591 (and (=> t!14916 result!7467) b_and!20593)))

(declare-fun b_lambda!10337 () Bool)

(assert (=> (not b_lambda!10337) (not b!476147)))

(assert (=> b!476147 t!14916))

(declare-fun b_and!20595 () Bool)

(assert (= b_and!20593 (and (=> t!14916 result!7467) b_and!20595)))

(assert (=> b!476144 m!458499))

(assert (=> b!476144 m!458499))

(assert (=> b!476144 m!458501))

(declare-fun m!458611 () Bool)

(assert (=> b!476137 m!458611))

(declare-fun m!458613 () Bool)

(assert (=> b!476140 m!458613))

(assert (=> b!476140 m!458613))

(declare-fun m!458615 () Bool)

(assert (=> b!476140 m!458615))

(assert (=> b!476140 m!458503))

(assert (=> b!476140 m!458505))

(assert (=> b!476140 m!458507))

(declare-fun m!458617 () Bool)

(assert (=> b!476140 m!458617))

(assert (=> b!476140 m!458505))

(assert (=> b!476140 m!458503))

(declare-fun m!458619 () Bool)

(assert (=> b!476140 m!458619))

(assert (=> b!476140 m!458499))

(assert (=> b!476147 m!458503))

(assert (=> b!476147 m!458505))

(assert (=> b!476147 m!458507))

(assert (=> b!476147 m!458505))

(assert (=> b!476147 m!458499))

(declare-fun m!458621 () Bool)

(assert (=> b!476147 m!458621))

(assert (=> b!476147 m!458503))

(assert (=> b!476147 m!458499))

(declare-fun m!458623 () Bool)

(assert (=> bm!30674 m!458623))

(declare-fun m!458625 () Bool)

(assert (=> b!476146 m!458625))

(assert (=> b!476145 m!458623))

(assert (=> b!476141 m!458499))

(assert (=> b!476141 m!458499))

(declare-fun m!458627 () Bool)

(assert (=> b!476141 m!458627))

(assert (=> b!476139 m!458499))

(assert (=> b!476139 m!458499))

(assert (=> b!476139 m!458501))

(declare-fun m!458629 () Bool)

(assert (=> d!75725 m!458629))

(assert (=> d!75725 m!458419))

(assert (=> b!475939 d!75725))

(declare-fun b!476149 () Bool)

(declare-fun e!279652 () Bool)

(declare-fun lt!217078 () ListLongMap!7791)

(assert (=> b!476149 (= e!279652 (isEmpty!590 lt!217078))))

(declare-fun d!75727 () Bool)

(declare-fun e!279646 () Bool)

(assert (=> d!75727 e!279646))

(declare-fun res!284295 () Bool)

(assert (=> d!75727 (=> (not res!284295) (not e!279646))))

(assert (=> d!75727 (= res!284295 (not (contains!2543 lt!217078 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279647 () ListLongMap!7791)

(assert (=> d!75727 (= lt!217078 e!279647)))

(declare-fun c!57272 () Bool)

(assert (=> d!75727 (= c!57272 (bvsge #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> d!75727 (validMask!0 mask!1365)))

(assert (=> d!75727 (= (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!217078)))

(declare-fun b!476150 () Bool)

(assert (=> b!476150 (= e!279647 (ListLongMap!7792 Nil!8934))))

(declare-fun b!476151 () Bool)

(declare-fun e!279651 () ListLongMap!7791)

(assert (=> b!476151 (= e!279647 e!279651)))

(declare-fun c!57273 () Bool)

(assert (=> b!476151 (= c!57273 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!476152 () Bool)

(declare-fun lt!217074 () Unit!13992)

(declare-fun lt!217076 () Unit!13992)

(assert (=> b!476152 (= lt!217074 lt!217076)))

(declare-fun lt!217080 () (_ BitVec 64))

(declare-fun lt!217079 () V!19091)

(declare-fun lt!217077 () (_ BitVec 64))

(declare-fun lt!217075 () ListLongMap!7791)

(assert (=> b!476152 (not (contains!2543 (+!1769 lt!217075 (tuple2!8877 lt!217080 lt!217079)) lt!217077))))

(assert (=> b!476152 (= lt!217076 (addStillNotContains!172 lt!217075 lt!217080 lt!217079 lt!217077))))

(assert (=> b!476152 (= lt!217077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!476152 (= lt!217079 (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!476152 (= lt!217080 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30678 () ListLongMap!7791)

(assert (=> b!476152 (= lt!217075 call!30678)))

(assert (=> b!476152 (= e!279651 (+!1769 call!30678 (tuple2!8877 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000) (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!476153 () Bool)

(declare-fun e!279649 () Bool)

(declare-fun e!279650 () Bool)

(assert (=> b!476153 (= e!279649 e!279650)))

(assert (=> b!476153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun res!284294 () Bool)

(assert (=> b!476153 (= res!284294 (contains!2543 lt!217078 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476153 (=> (not res!284294) (not e!279650))))

(declare-fun bm!30675 () Bool)

(assert (=> bm!30675 (= call!30678 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!476154 () Bool)

(assert (=> b!476154 (= e!279651 call!30678)))

(declare-fun b!476155 () Bool)

(assert (=> b!476155 (= e!279646 e!279649)))

(declare-fun c!57270 () Bool)

(declare-fun e!279648 () Bool)

(assert (=> b!476155 (= c!57270 e!279648)))

(declare-fun res!284292 () Bool)

(assert (=> b!476155 (=> (not res!284292) (not e!279648))))

(assert (=> b!476155 (= res!284292 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(declare-fun b!476156 () Bool)

(assert (=> b!476156 (= e!279648 (validKeyInArray!0 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!476156 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!476157 () Bool)

(assert (=> b!476157 (= e!279652 (= lt!217078 (getCurrentListMapNoExtraKeys!2118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!476158 () Bool)

(declare-fun res!284293 () Bool)

(assert (=> b!476158 (=> (not res!284293) (not e!279646))))

(assert (=> b!476158 (= res!284293 (not (contains!2543 lt!217078 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!476159 () Bool)

(assert (=> b!476159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (=> b!476159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15121 _values!833)))))

(assert (=> b!476159 (= e!279650 (= (apply!337 lt!217078 (select (arr!14768 _keys!1025) #b00000000000000000000000000000000)) (get!7173 (select (arr!14769 _values!833) #b00000000000000000000000000000000) (dynLambda!927 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!476160 () Bool)

(assert (=> b!476160 (= e!279649 e!279652)))

(declare-fun c!57271 () Bool)

(assert (=> b!476160 (= c!57271 (bvslt #b00000000000000000000000000000000 (size!15120 _keys!1025)))))

(assert (= (and d!75727 c!57272) b!476150))

(assert (= (and d!75727 (not c!57272)) b!476151))

(assert (= (and b!476151 c!57273) b!476152))

(assert (= (and b!476151 (not c!57273)) b!476154))

(assert (= (or b!476152 b!476154) bm!30675))

(assert (= (and d!75727 res!284295) b!476158))

(assert (= (and b!476158 res!284293) b!476155))

(assert (= (and b!476155 res!284292) b!476156))

(assert (= (and b!476155 c!57270) b!476153))

(assert (= (and b!476155 (not c!57270)) b!476160))

(assert (= (and b!476153 res!284294) b!476159))

(assert (= (and b!476160 c!57271) b!476157))

(assert (= (and b!476160 (not c!57271)) b!476149))

(declare-fun b_lambda!10339 () Bool)

(assert (=> (not b_lambda!10339) (not b!476152)))

(assert (=> b!476152 t!14916))

(declare-fun b_and!20597 () Bool)

(assert (= b_and!20595 (and (=> t!14916 result!7467) b_and!20597)))

(declare-fun b_lambda!10341 () Bool)

(assert (=> (not b_lambda!10341) (not b!476159)))

(assert (=> b!476159 t!14916))

(declare-fun b_and!20599 () Bool)

(assert (= b_and!20597 (and (=> t!14916 result!7467) b_and!20599)))

(assert (=> b!476156 m!458499))

(assert (=> b!476156 m!458499))

(assert (=> b!476156 m!458501))

(declare-fun m!458631 () Bool)

(assert (=> b!476149 m!458631))

(declare-fun m!458633 () Bool)

(assert (=> b!476152 m!458633))

(assert (=> b!476152 m!458633))

(declare-fun m!458635 () Bool)

(assert (=> b!476152 m!458635))

(assert (=> b!476152 m!458503))

(assert (=> b!476152 m!458505))

(assert (=> b!476152 m!458507))

(declare-fun m!458637 () Bool)

(assert (=> b!476152 m!458637))

(assert (=> b!476152 m!458505))

(assert (=> b!476152 m!458503))

(declare-fun m!458639 () Bool)

(assert (=> b!476152 m!458639))

(assert (=> b!476152 m!458499))

(assert (=> b!476159 m!458503))

(assert (=> b!476159 m!458505))

(assert (=> b!476159 m!458507))

(assert (=> b!476159 m!458505))

(assert (=> b!476159 m!458499))

(declare-fun m!458641 () Bool)

(assert (=> b!476159 m!458641))

(assert (=> b!476159 m!458503))

(assert (=> b!476159 m!458499))

(declare-fun m!458643 () Bool)

(assert (=> bm!30675 m!458643))

(declare-fun m!458645 () Bool)

(assert (=> b!476158 m!458645))

(assert (=> b!476157 m!458643))

(assert (=> b!476153 m!458499))

(assert (=> b!476153 m!458499))

(declare-fun m!458647 () Bool)

(assert (=> b!476153 m!458647))

(assert (=> b!476151 m!458499))

(assert (=> b!476151 m!458499))

(assert (=> b!476151 m!458501))

(declare-fun m!458649 () Bool)

(assert (=> d!75727 m!458649))

(assert (=> d!75727 m!458419))

(assert (=> b!475939 d!75727))

(declare-fun condMapEmpty!21970 () Bool)

(declare-fun mapDefault!21970 () ValueCell!6401)

(assert (=> mapNonEmpty!21961 (= condMapEmpty!21970 (= mapRest!21961 ((as const (Array (_ BitVec 32) ValueCell!6401)) mapDefault!21970)))))

(declare-fun e!279658 () Bool)

(declare-fun mapRes!21970 () Bool)

(assert (=> mapNonEmpty!21961 (= tp!42231 (and e!279658 mapRes!21970))))

(declare-fun mapNonEmpty!21970 () Bool)

(declare-fun tp!42247 () Bool)

(declare-fun e!279657 () Bool)

(assert (=> mapNonEmpty!21970 (= mapRes!21970 (and tp!42247 e!279657))))

(declare-fun mapRest!21970 () (Array (_ BitVec 32) ValueCell!6401))

(declare-fun mapValue!21970 () ValueCell!6401)

(declare-fun mapKey!21970 () (_ BitVec 32))

(assert (=> mapNonEmpty!21970 (= mapRest!21961 (store mapRest!21970 mapKey!21970 mapValue!21970))))

(declare-fun b!476167 () Bool)

(assert (=> b!476167 (= e!279657 tp_is_empty!13489)))

(declare-fun b!476168 () Bool)

(assert (=> b!476168 (= e!279658 tp_is_empty!13489)))

(declare-fun mapIsEmpty!21970 () Bool)

(assert (=> mapIsEmpty!21970 mapRes!21970))

(assert (= (and mapNonEmpty!21961 condMapEmpty!21970) mapIsEmpty!21970))

(assert (= (and mapNonEmpty!21961 (not condMapEmpty!21970)) mapNonEmpty!21970))

(assert (= (and mapNonEmpty!21970 ((_ is ValueCellFull!6401) mapValue!21970)) b!476167))

(assert (= (and mapNonEmpty!21961 ((_ is ValueCellFull!6401) mapDefault!21970)) b!476168))

(declare-fun m!458651 () Bool)

(assert (=> mapNonEmpty!21970 m!458651))

(declare-fun b_lambda!10343 () Bool)

(assert (= b_lambda!10339 (or (and start!42662 b_free!12061) b_lambda!10343)))

(declare-fun b_lambda!10345 () Bool)

(assert (= b_lambda!10341 (or (and start!42662 b_free!12061) b_lambda!10345)))

(declare-fun b_lambda!10347 () Bool)

(assert (= b_lambda!10337 (or (and start!42662 b_free!12061) b_lambda!10347)))

(declare-fun b_lambda!10349 () Bool)

(assert (= b_lambda!10335 (or (and start!42662 b_free!12061) b_lambda!10349)))

(declare-fun b_lambda!10351 () Bool)

(assert (= b_lambda!10331 (or (and start!42662 b_free!12061) b_lambda!10351)))

(declare-fun b_lambda!10353 () Bool)

(assert (= b_lambda!10333 (or (and start!42662 b_free!12061) b_lambda!10353)))

(check-sat (not mapNonEmpty!21970) (not b!476159) (not bm!30653) (not b!476059) (not d!75725) (not bm!30674) (not b!476066) (not bm!30657) (not b!476109) (not b!476051) (not b!475998) (not bm!30664) (not b_lambda!10345) (not bm!30661) (not d!75711) (not b!476140) (not d!75723) (not d!75727) (not b!476153) (not bm!30668) (not bm!30671) (not b!476111) (not b!476157) (not b!476144) b_and!20599 (not b_lambda!10353) (not b_lambda!10349) (not bm!30654) (not b_lambda!10347) (not b!476097) (not b!476146) (not b!476152) tp_is_empty!13489 (not b!476151) (not b!476139) (not b!476079) (not b!476069) (not b_lambda!10343) (not b!476058) (not b!476149) (not b!475999) (not b!476043) (not b!476071) (not bm!30675) (not b!476141) (not d!75709) (not b_lambda!10351) (not b!476099) (not d!75707) (not b!476156) (not b_next!12061) (not bm!30665) (not b!476147) (not b!476081) (not b!476137) (not bm!30660) (not bm!30658) (not b!476052) (not b!476056) (not b!476075) (not b!476046) (not b!476100) (not b!476082) (not b!476048) (not b!476145) (not b!476074) (not b!476158))
(check-sat b_and!20599 (not b_next!12061))
