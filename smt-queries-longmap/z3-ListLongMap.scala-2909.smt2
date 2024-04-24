; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41582 () Bool)

(assert start!41582)

(declare-fun b_free!11263 () Bool)

(declare-fun b_next!11263 () Bool)

(assert (=> start!41582 (= b_free!11263 (not b_next!11263))))

(declare-fun tp!39786 () Bool)

(declare-fun b_and!19613 () Bool)

(assert (=> start!41582 (= tp!39786 b_and!19613)))

(declare-fun b!464547 () Bool)

(declare-fun e!271381 () Bool)

(declare-fun tp_is_empty!12691 () Bool)

(assert (=> b!464547 (= e!271381 tp_is_empty!12691)))

(declare-fun res!277763 () Bool)

(declare-fun e!271380 () Bool)

(assert (=> start!41582 (=> (not res!277763) (not e!271380))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41582 (= res!277763 (validMask!0 mask!1365))))

(assert (=> start!41582 e!271380))

(assert (=> start!41582 tp_is_empty!12691))

(assert (=> start!41582 tp!39786))

(assert (=> start!41582 true))

(declare-datatypes ((array!29164 0))(
  ( (array!29165 (arr!14013 (Array (_ BitVec 32) (_ BitVec 64))) (size!14365 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29164)

(declare-fun array_inv!10204 (array!29164) Bool)

(assert (=> start!41582 (array_inv!10204 _keys!1025)))

(declare-datatypes ((V!18027 0))(
  ( (V!18028 (val!6390 Int)) )
))
(declare-datatypes ((ValueCell!6002 0))(
  ( (ValueCellFull!6002 (v!8678 V!18027)) (EmptyCell!6002) )
))
(declare-datatypes ((array!29166 0))(
  ( (array!29167 (arr!14014 (Array (_ BitVec 32) ValueCell!6002)) (size!14366 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29166)

(declare-fun e!271379 () Bool)

(declare-fun array_inv!10205 (array!29166) Bool)

(assert (=> start!41582 (and (array_inv!10205 _values!833) e!271379)))

(declare-fun b!464548 () Bool)

(declare-fun res!277762 () Bool)

(assert (=> b!464548 (=> (not res!277762) (not e!271380))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464548 (= res!277762 (and (= (size!14366 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14365 _keys!1025) (size!14366 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464549 () Bool)

(declare-fun e!271383 () Bool)

(declare-fun mapRes!20713 () Bool)

(assert (=> b!464549 (= e!271379 (and e!271383 mapRes!20713))))

(declare-fun condMapEmpty!20713 () Bool)

(declare-fun mapDefault!20713 () ValueCell!6002)

(assert (=> b!464549 (= condMapEmpty!20713 (= (arr!14014 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6002)) mapDefault!20713)))))

(declare-fun mapIsEmpty!20713 () Bool)

(assert (=> mapIsEmpty!20713 mapRes!20713))

(declare-fun mapNonEmpty!20713 () Bool)

(declare-fun tp!39787 () Bool)

(assert (=> mapNonEmpty!20713 (= mapRes!20713 (and tp!39787 e!271381))))

(declare-fun mapValue!20713 () ValueCell!6002)

(declare-fun mapKey!20713 () (_ BitVec 32))

(declare-fun mapRest!20713 () (Array (_ BitVec 32) ValueCell!6002))

(assert (=> mapNonEmpty!20713 (= (arr!14014 _values!833) (store mapRest!20713 mapKey!20713 mapValue!20713))))

(declare-fun b!464550 () Bool)

(declare-fun res!277764 () Bool)

(assert (=> b!464550 (=> (not res!277764) (not e!271380))))

(declare-datatypes ((List!8395 0))(
  ( (Nil!8392) (Cons!8391 (h!9247 (_ BitVec 64)) (t!14333 List!8395)) )
))
(declare-fun arrayNoDuplicates!0 (array!29164 (_ BitVec 32) List!8395) Bool)

(assert (=> b!464550 (= res!277764 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8392))))

(declare-fun b!464551 () Bool)

(assert (=> b!464551 (= e!271383 tp_is_empty!12691)))

(declare-fun b!464552 () Bool)

(declare-fun res!277765 () Bool)

(assert (=> b!464552 (=> (not res!277765) (not e!271380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29164 (_ BitVec 32)) Bool)

(assert (=> b!464552 (= res!277765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464553 () Bool)

(assert (=> b!464553 (= e!271380 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14365 _keys!1025)))))))

(declare-datatypes ((tuple2!8310 0))(
  ( (tuple2!8311 (_1!4166 (_ BitVec 64)) (_2!4166 V!18027)) )
))
(declare-datatypes ((List!8396 0))(
  ( (Nil!8393) (Cons!8392 (h!9248 tuple2!8310) (t!14334 List!8396)) )
))
(declare-datatypes ((ListLongMap!7225 0))(
  ( (ListLongMap!7226 (toList!3628 List!8396)) )
))
(declare-fun lt!209800 () ListLongMap!7225)

(declare-fun lt!209799 () ListLongMap!7225)

(assert (=> b!464553 (= lt!209800 lt!209799)))

(declare-fun minValueBefore!38 () V!18027)

(declare-fun zeroValue!794 () V!18027)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13474 0))(
  ( (Unit!13475) )
))
(declare-fun lt!209801 () Unit!13474)

(declare-fun minValueAfter!38 () V!18027)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!15 (array!29164 array!29166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18027 V!18027 V!18027 V!18027 (_ BitVec 32) Int) Unit!13474)

(assert (=> b!464553 (= lt!209801 (lemmaNoChangeToArrayThenSameMapNoExtras!15 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1855 (array!29164 array!29166 (_ BitVec 32) (_ BitVec 32) V!18027 V!18027 (_ BitVec 32) Int) ListLongMap!7225)

(assert (=> b!464553 (= lt!209799 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464553 (= lt!209800 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41582 res!277763) b!464548))

(assert (= (and b!464548 res!277762) b!464552))

(assert (= (and b!464552 res!277765) b!464550))

(assert (= (and b!464550 res!277764) b!464553))

(assert (= (and b!464549 condMapEmpty!20713) mapIsEmpty!20713))

(assert (= (and b!464549 (not condMapEmpty!20713)) mapNonEmpty!20713))

(get-info :version)

(assert (= (and mapNonEmpty!20713 ((_ is ValueCellFull!6002) mapValue!20713)) b!464547))

(assert (= (and b!464549 ((_ is ValueCellFull!6002) mapDefault!20713)) b!464551))

(assert (= start!41582 b!464549))

(declare-fun m!447151 () Bool)

(assert (=> mapNonEmpty!20713 m!447151))

(declare-fun m!447153 () Bool)

(assert (=> b!464553 m!447153))

(declare-fun m!447155 () Bool)

(assert (=> b!464553 m!447155))

(declare-fun m!447157 () Bool)

(assert (=> b!464553 m!447157))

(declare-fun m!447159 () Bool)

(assert (=> start!41582 m!447159))

(declare-fun m!447161 () Bool)

(assert (=> start!41582 m!447161))

(declare-fun m!447163 () Bool)

(assert (=> start!41582 m!447163))

(declare-fun m!447165 () Bool)

(assert (=> b!464552 m!447165))

(declare-fun m!447167 () Bool)

(assert (=> b!464550 m!447167))

(check-sat tp_is_empty!12691 (not b!464550) (not b!464552) (not b!464553) (not b_next!11263) b_and!19613 (not mapNonEmpty!20713) (not start!41582))
(check-sat b_and!19613 (not b_next!11263))
(get-model)

(declare-fun d!75083 () Bool)

(assert (=> d!75083 (= (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209822 () Unit!13474)

(declare-fun choose!1344 (array!29164 array!29166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18027 V!18027 V!18027 V!18027 (_ BitVec 32) Int) Unit!13474)

(assert (=> d!75083 (= lt!209822 (choose!1344 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75083 (validMask!0 mask!1365)))

(assert (=> d!75083 (= (lemmaNoChangeToArrayThenSameMapNoExtras!15 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209822)))

(declare-fun bs!14710 () Bool)

(assert (= bs!14710 d!75083))

(assert (=> bs!14710 m!447157))

(assert (=> bs!14710 m!447155))

(declare-fun m!447205 () Bool)

(assert (=> bs!14710 m!447205))

(assert (=> bs!14710 m!447159))

(assert (=> b!464553 d!75083))

(declare-fun b!464620 () Bool)

(declare-fun res!277800 () Bool)

(declare-fun e!271434 () Bool)

(assert (=> b!464620 (=> (not res!277800) (not e!271434))))

(declare-fun lt!209837 () ListLongMap!7225)

(declare-fun contains!2501 (ListLongMap!7225 (_ BitVec 64)) Bool)

(assert (=> b!464620 (= res!277800 (not (contains!2501 lt!209837 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!464621 () Bool)

(declare-fun e!271429 () Bool)

(declare-fun e!271433 () Bool)

(assert (=> b!464621 (= e!271429 e!271433)))

(declare-fun c!56636 () Bool)

(assert (=> b!464621 (= c!56636 (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(declare-fun d!75085 () Bool)

(assert (=> d!75085 e!271434))

(declare-fun res!277799 () Bool)

(assert (=> d!75085 (=> (not res!277799) (not e!271434))))

(assert (=> d!75085 (= res!277799 (not (contains!2501 lt!209837 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!271430 () ListLongMap!7225)

(assert (=> d!75085 (= lt!209837 e!271430)))

(declare-fun c!56635 () Bool)

(assert (=> d!75085 (= c!56635 (bvsge #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (=> d!75085 (validMask!0 mask!1365)))

(assert (=> d!75085 (= (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209837)))

(declare-fun b!464622 () Bool)

(assert (=> b!464622 (= e!271433 (= lt!209837 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!464623 () Bool)

(declare-fun e!271431 () Bool)

(assert (=> b!464623 (= e!271429 e!271431)))

(assert (=> b!464623 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(declare-fun res!277801 () Bool)

(assert (=> b!464623 (= res!277801 (contains!2501 lt!209837 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464623 (=> (not res!277801) (not e!271431))))

(declare-fun b!464624 () Bool)

(assert (=> b!464624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (=> b!464624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14366 _values!833)))))

(declare-fun apply!320 (ListLongMap!7225 (_ BitVec 64)) V!18027)

(declare-fun get!6890 (ValueCell!6002 V!18027) V!18027)

(declare-fun dynLambda!910 (Int (_ BitVec 64)) V!18027)

(assert (=> b!464624 (= e!271431 (= (apply!320 lt!209837 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)) (get!6890 (select (arr!14014 _values!833) #b00000000000000000000000000000000) (dynLambda!910 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!464625 () Bool)

(declare-fun e!271428 () ListLongMap!7225)

(declare-fun call!30207 () ListLongMap!7225)

(assert (=> b!464625 (= e!271428 call!30207)))

(declare-fun b!464626 () Bool)

(declare-fun e!271432 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!464626 (= e!271432 (validKeyInArray!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464626 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!464627 () Bool)

(assert (=> b!464627 (= e!271430 (ListLongMap!7226 Nil!8393))))

(declare-fun bm!30204 () Bool)

(assert (=> bm!30204 (= call!30207 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!464628 () Bool)

(declare-fun lt!209841 () Unit!13474)

(declare-fun lt!209840 () Unit!13474)

(assert (=> b!464628 (= lt!209841 lt!209840)))

(declare-fun lt!209843 () V!18027)

(declare-fun lt!209839 () (_ BitVec 64))

(declare-fun lt!209842 () (_ BitVec 64))

(declare-fun lt!209838 () ListLongMap!7225)

(declare-fun +!1647 (ListLongMap!7225 tuple2!8310) ListLongMap!7225)

(assert (=> b!464628 (not (contains!2501 (+!1647 lt!209838 (tuple2!8311 lt!209842 lt!209843)) lt!209839))))

(declare-fun addStillNotContains!155 (ListLongMap!7225 (_ BitVec 64) V!18027 (_ BitVec 64)) Unit!13474)

(assert (=> b!464628 (= lt!209840 (addStillNotContains!155 lt!209838 lt!209842 lt!209843 lt!209839))))

(assert (=> b!464628 (= lt!209839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!464628 (= lt!209843 (get!6890 (select (arr!14014 _values!833) #b00000000000000000000000000000000) (dynLambda!910 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!464628 (= lt!209842 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!464628 (= lt!209838 call!30207)))

(assert (=> b!464628 (= e!271428 (+!1647 call!30207 (tuple2!8311 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000) (get!6890 (select (arr!14014 _values!833) #b00000000000000000000000000000000) (dynLambda!910 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!464629 () Bool)

(assert (=> b!464629 (= e!271430 e!271428)))

(declare-fun c!56637 () Bool)

(assert (=> b!464629 (= c!56637 (validKeyInArray!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464630 () Bool)

(declare-fun isEmpty!573 (ListLongMap!7225) Bool)

(assert (=> b!464630 (= e!271433 (isEmpty!573 lt!209837))))

(declare-fun b!464631 () Bool)

(assert (=> b!464631 (= e!271434 e!271429)))

(declare-fun c!56634 () Bool)

(assert (=> b!464631 (= c!56634 e!271432)))

(declare-fun res!277798 () Bool)

(assert (=> b!464631 (=> (not res!277798) (not e!271432))))

(assert (=> b!464631 (= res!277798 (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (= (and d!75085 c!56635) b!464627))

(assert (= (and d!75085 (not c!56635)) b!464629))

(assert (= (and b!464629 c!56637) b!464628))

(assert (= (and b!464629 (not c!56637)) b!464625))

(assert (= (or b!464628 b!464625) bm!30204))

(assert (= (and d!75085 res!277799) b!464620))

(assert (= (and b!464620 res!277800) b!464631))

(assert (= (and b!464631 res!277798) b!464626))

(assert (= (and b!464631 c!56634) b!464623))

(assert (= (and b!464631 (not c!56634)) b!464621))

(assert (= (and b!464623 res!277801) b!464624))

(assert (= (and b!464621 c!56636) b!464622))

(assert (= (and b!464621 (not c!56636)) b!464630))

(declare-fun b_lambda!9987 () Bool)

(assert (=> (not b_lambda!9987) (not b!464624)))

(declare-fun t!14337 () Bool)

(declare-fun tb!3897 () Bool)

(assert (=> (and start!41582 (= defaultEntry!841 defaultEntry!841) t!14337) tb!3897))

(declare-fun result!7365 () Bool)

(assert (=> tb!3897 (= result!7365 tp_is_empty!12691)))

(assert (=> b!464624 t!14337))

(declare-fun b_and!19619 () Bool)

(assert (= b_and!19613 (and (=> t!14337 result!7365) b_and!19619)))

(declare-fun b_lambda!9989 () Bool)

(assert (=> (not b_lambda!9989) (not b!464628)))

(assert (=> b!464628 t!14337))

(declare-fun b_and!19621 () Bool)

(assert (= b_and!19619 (and (=> t!14337 result!7365) b_and!19621)))

(declare-fun m!447207 () Bool)

(assert (=> b!464620 m!447207))

(declare-fun m!447209 () Bool)

(assert (=> d!75085 m!447209))

(assert (=> d!75085 m!447159))

(declare-fun m!447211 () Bool)

(assert (=> b!464630 m!447211))

(declare-fun m!447213 () Bool)

(assert (=> b!464628 m!447213))

(declare-fun m!447215 () Bool)

(assert (=> b!464628 m!447215))

(assert (=> b!464628 m!447213))

(declare-fun m!447217 () Bool)

(assert (=> b!464628 m!447217))

(declare-fun m!447219 () Bool)

(assert (=> b!464628 m!447219))

(declare-fun m!447221 () Bool)

(assert (=> b!464628 m!447221))

(declare-fun m!447223 () Bool)

(assert (=> b!464628 m!447223))

(assert (=> b!464628 m!447221))

(declare-fun m!447225 () Bool)

(assert (=> b!464628 m!447225))

(assert (=> b!464628 m!447215))

(declare-fun m!447227 () Bool)

(assert (=> b!464628 m!447227))

(assert (=> b!464624 m!447227))

(declare-fun m!447229 () Bool)

(assert (=> b!464624 m!447229))

(assert (=> b!464624 m!447213))

(assert (=> b!464624 m!447215))

(assert (=> b!464624 m!447213))

(assert (=> b!464624 m!447217))

(assert (=> b!464624 m!447215))

(assert (=> b!464624 m!447227))

(declare-fun m!447231 () Bool)

(assert (=> b!464622 m!447231))

(assert (=> b!464629 m!447227))

(assert (=> b!464629 m!447227))

(declare-fun m!447233 () Bool)

(assert (=> b!464629 m!447233))

(assert (=> b!464623 m!447227))

(assert (=> b!464623 m!447227))

(declare-fun m!447235 () Bool)

(assert (=> b!464623 m!447235))

(assert (=> bm!30204 m!447231))

(assert (=> b!464626 m!447227))

(assert (=> b!464626 m!447227))

(assert (=> b!464626 m!447233))

(assert (=> b!464553 d!75085))

(declare-fun b!464634 () Bool)

(declare-fun res!277804 () Bool)

(declare-fun e!271441 () Bool)

(assert (=> b!464634 (=> (not res!277804) (not e!271441))))

(declare-fun lt!209844 () ListLongMap!7225)

(assert (=> b!464634 (= res!277804 (not (contains!2501 lt!209844 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!464635 () Bool)

(declare-fun e!271436 () Bool)

(declare-fun e!271440 () Bool)

(assert (=> b!464635 (= e!271436 e!271440)))

(declare-fun c!56640 () Bool)

(assert (=> b!464635 (= c!56640 (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(declare-fun d!75087 () Bool)

(assert (=> d!75087 e!271441))

(declare-fun res!277803 () Bool)

(assert (=> d!75087 (=> (not res!277803) (not e!271441))))

(assert (=> d!75087 (= res!277803 (not (contains!2501 lt!209844 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!271437 () ListLongMap!7225)

(assert (=> d!75087 (= lt!209844 e!271437)))

(declare-fun c!56639 () Bool)

(assert (=> d!75087 (= c!56639 (bvsge #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (=> d!75087 (validMask!0 mask!1365)))

(assert (=> d!75087 (= (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!209844)))

(declare-fun b!464636 () Bool)

(assert (=> b!464636 (= e!271440 (= lt!209844 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!464637 () Bool)

(declare-fun e!271438 () Bool)

(assert (=> b!464637 (= e!271436 e!271438)))

(assert (=> b!464637 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(declare-fun res!277805 () Bool)

(assert (=> b!464637 (= res!277805 (contains!2501 lt!209844 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464637 (=> (not res!277805) (not e!271438))))

(declare-fun b!464638 () Bool)

(assert (=> b!464638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (=> b!464638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14366 _values!833)))))

(assert (=> b!464638 (= e!271438 (= (apply!320 lt!209844 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)) (get!6890 (select (arr!14014 _values!833) #b00000000000000000000000000000000) (dynLambda!910 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!464639 () Bool)

(declare-fun e!271435 () ListLongMap!7225)

(declare-fun call!30208 () ListLongMap!7225)

(assert (=> b!464639 (= e!271435 call!30208)))

(declare-fun b!464640 () Bool)

(declare-fun e!271439 () Bool)

(assert (=> b!464640 (= e!271439 (validKeyInArray!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!464640 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!464641 () Bool)

(assert (=> b!464641 (= e!271437 (ListLongMap!7226 Nil!8393))))

(declare-fun bm!30205 () Bool)

(assert (=> bm!30205 (= call!30208 (getCurrentListMapNoExtraKeys!1855 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!464642 () Bool)

(declare-fun lt!209848 () Unit!13474)

(declare-fun lt!209847 () Unit!13474)

(assert (=> b!464642 (= lt!209848 lt!209847)))

(declare-fun lt!209849 () (_ BitVec 64))

(declare-fun lt!209846 () (_ BitVec 64))

(declare-fun lt!209845 () ListLongMap!7225)

(declare-fun lt!209850 () V!18027)

(assert (=> b!464642 (not (contains!2501 (+!1647 lt!209845 (tuple2!8311 lt!209849 lt!209850)) lt!209846))))

(assert (=> b!464642 (= lt!209847 (addStillNotContains!155 lt!209845 lt!209849 lt!209850 lt!209846))))

(assert (=> b!464642 (= lt!209846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!464642 (= lt!209850 (get!6890 (select (arr!14014 _values!833) #b00000000000000000000000000000000) (dynLambda!910 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!464642 (= lt!209849 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!464642 (= lt!209845 call!30208)))

(assert (=> b!464642 (= e!271435 (+!1647 call!30208 (tuple2!8311 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000) (get!6890 (select (arr!14014 _values!833) #b00000000000000000000000000000000) (dynLambda!910 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!464643 () Bool)

(assert (=> b!464643 (= e!271437 e!271435)))

(declare-fun c!56641 () Bool)

(assert (=> b!464643 (= c!56641 (validKeyInArray!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464644 () Bool)

(assert (=> b!464644 (= e!271440 (isEmpty!573 lt!209844))))

(declare-fun b!464645 () Bool)

(assert (=> b!464645 (= e!271441 e!271436)))

(declare-fun c!56638 () Bool)

(assert (=> b!464645 (= c!56638 e!271439)))

(declare-fun res!277802 () Bool)

(assert (=> b!464645 (=> (not res!277802) (not e!271439))))

(assert (=> b!464645 (= res!277802 (bvslt #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (= (and d!75087 c!56639) b!464641))

(assert (= (and d!75087 (not c!56639)) b!464643))

(assert (= (and b!464643 c!56641) b!464642))

(assert (= (and b!464643 (not c!56641)) b!464639))

(assert (= (or b!464642 b!464639) bm!30205))

(assert (= (and d!75087 res!277803) b!464634))

(assert (= (and b!464634 res!277804) b!464645))

(assert (= (and b!464645 res!277802) b!464640))

(assert (= (and b!464645 c!56638) b!464637))

(assert (= (and b!464645 (not c!56638)) b!464635))

(assert (= (and b!464637 res!277805) b!464638))

(assert (= (and b!464635 c!56640) b!464636))

(assert (= (and b!464635 (not c!56640)) b!464644))

(declare-fun b_lambda!9991 () Bool)

(assert (=> (not b_lambda!9991) (not b!464638)))

(assert (=> b!464638 t!14337))

(declare-fun b_and!19623 () Bool)

(assert (= b_and!19621 (and (=> t!14337 result!7365) b_and!19623)))

(declare-fun b_lambda!9993 () Bool)

(assert (=> (not b_lambda!9993) (not b!464642)))

(assert (=> b!464642 t!14337))

(declare-fun b_and!19625 () Bool)

(assert (= b_and!19623 (and (=> t!14337 result!7365) b_and!19625)))

(declare-fun m!447237 () Bool)

(assert (=> b!464634 m!447237))

(declare-fun m!447239 () Bool)

(assert (=> d!75087 m!447239))

(assert (=> d!75087 m!447159))

(declare-fun m!447241 () Bool)

(assert (=> b!464644 m!447241))

(assert (=> b!464642 m!447213))

(assert (=> b!464642 m!447215))

(assert (=> b!464642 m!447213))

(assert (=> b!464642 m!447217))

(declare-fun m!447243 () Bool)

(assert (=> b!464642 m!447243))

(declare-fun m!447245 () Bool)

(assert (=> b!464642 m!447245))

(declare-fun m!447247 () Bool)

(assert (=> b!464642 m!447247))

(assert (=> b!464642 m!447245))

(declare-fun m!447249 () Bool)

(assert (=> b!464642 m!447249))

(assert (=> b!464642 m!447215))

(assert (=> b!464642 m!447227))

(assert (=> b!464638 m!447227))

(declare-fun m!447251 () Bool)

(assert (=> b!464638 m!447251))

(assert (=> b!464638 m!447213))

(assert (=> b!464638 m!447215))

(assert (=> b!464638 m!447213))

(assert (=> b!464638 m!447217))

(assert (=> b!464638 m!447215))

(assert (=> b!464638 m!447227))

(declare-fun m!447253 () Bool)

(assert (=> b!464636 m!447253))

(assert (=> b!464643 m!447227))

(assert (=> b!464643 m!447227))

(assert (=> b!464643 m!447233))

(assert (=> b!464637 m!447227))

(assert (=> b!464637 m!447227))

(declare-fun m!447255 () Bool)

(assert (=> b!464637 m!447255))

(assert (=> bm!30205 m!447253))

(assert (=> b!464640 m!447227))

(assert (=> b!464640 m!447227))

(assert (=> b!464640 m!447233))

(assert (=> b!464553 d!75087))

(declare-fun b!464654 () Bool)

(declare-fun e!271448 () Bool)

(declare-fun e!271450 () Bool)

(assert (=> b!464654 (= e!271448 e!271450)))

(declare-fun lt!209858 () (_ BitVec 64))

(assert (=> b!464654 (= lt!209858 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!209859 () Unit!13474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29164 (_ BitVec 64) (_ BitVec 32)) Unit!13474)

(assert (=> b!464654 (= lt!209859 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209858 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!464654 (arrayContainsKey!0 _keys!1025 lt!209858 #b00000000000000000000000000000000)))

(declare-fun lt!209857 () Unit!13474)

(assert (=> b!464654 (= lt!209857 lt!209859)))

(declare-fun res!277811 () Bool)

(declare-datatypes ((SeekEntryResult!3493 0))(
  ( (MissingZero!3493 (index!16151 (_ BitVec 32))) (Found!3493 (index!16152 (_ BitVec 32))) (Intermediate!3493 (undefined!4305 Bool) (index!16153 (_ BitVec 32)) (x!43362 (_ BitVec 32))) (Undefined!3493) (MissingVacant!3493 (index!16154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29164 (_ BitVec 32)) SeekEntryResult!3493)

(assert (=> b!464654 (= res!277811 (= (seekEntryOrOpen!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3493 #b00000000000000000000000000000000)))))

(assert (=> b!464654 (=> (not res!277811) (not e!271450))))

(declare-fun bm!30208 () Bool)

(declare-fun call!30211 () Bool)

(assert (=> bm!30208 (= call!30211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!464655 () Bool)

(assert (=> b!464655 (= e!271448 call!30211)))

(declare-fun d!75089 () Bool)

(declare-fun res!277810 () Bool)

(declare-fun e!271449 () Bool)

(assert (=> d!75089 (=> res!277810 e!271449)))

(assert (=> d!75089 (= res!277810 (bvsge #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (=> d!75089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!271449)))

(declare-fun b!464656 () Bool)

(assert (=> b!464656 (= e!271449 e!271448)))

(declare-fun c!56644 () Bool)

(assert (=> b!464656 (= c!56644 (validKeyInArray!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464657 () Bool)

(assert (=> b!464657 (= e!271450 call!30211)))

(assert (= (and d!75089 (not res!277810)) b!464656))

(assert (= (and b!464656 c!56644) b!464654))

(assert (= (and b!464656 (not c!56644)) b!464655))

(assert (= (and b!464654 res!277811) b!464657))

(assert (= (or b!464657 b!464655) bm!30208))

(assert (=> b!464654 m!447227))

(declare-fun m!447257 () Bool)

(assert (=> b!464654 m!447257))

(declare-fun m!447259 () Bool)

(assert (=> b!464654 m!447259))

(assert (=> b!464654 m!447227))

(declare-fun m!447261 () Bool)

(assert (=> b!464654 m!447261))

(declare-fun m!447263 () Bool)

(assert (=> bm!30208 m!447263))

(assert (=> b!464656 m!447227))

(assert (=> b!464656 m!447227))

(assert (=> b!464656 m!447233))

(assert (=> b!464552 d!75089))

(declare-fun d!75091 () Bool)

(assert (=> d!75091 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41582 d!75091))

(declare-fun d!75093 () Bool)

(assert (=> d!75093 (= (array_inv!10204 _keys!1025) (bvsge (size!14365 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41582 d!75093))

(declare-fun d!75095 () Bool)

(assert (=> d!75095 (= (array_inv!10205 _values!833) (bvsge (size!14366 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41582 d!75095))

(declare-fun b!464668 () Bool)

(declare-fun e!271461 () Bool)

(declare-fun call!30214 () Bool)

(assert (=> b!464668 (= e!271461 call!30214)))

(declare-fun b!464670 () Bool)

(declare-fun e!271460 () Bool)

(assert (=> b!464670 (= e!271460 e!271461)))

(declare-fun c!56647 () Bool)

(assert (=> b!464670 (= c!56647 (validKeyInArray!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!464671 () Bool)

(assert (=> b!464671 (= e!271461 call!30214)))

(declare-fun b!464672 () Bool)

(declare-fun e!271459 () Bool)

(assert (=> b!464672 (= e!271459 e!271460)))

(declare-fun res!277818 () Bool)

(assert (=> b!464672 (=> (not res!277818) (not e!271460))))

(declare-fun e!271462 () Bool)

(assert (=> b!464672 (= res!277818 (not e!271462))))

(declare-fun res!277819 () Bool)

(assert (=> b!464672 (=> (not res!277819) (not e!271462))))

(assert (=> b!464672 (= res!277819 (validKeyInArray!0 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30211 () Bool)

(assert (=> bm!30211 (= call!30214 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56647 (Cons!8391 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000) Nil!8392) Nil!8392)))))

(declare-fun d!75097 () Bool)

(declare-fun res!277820 () Bool)

(assert (=> d!75097 (=> res!277820 e!271459)))

(assert (=> d!75097 (= res!277820 (bvsge #b00000000000000000000000000000000 (size!14365 _keys!1025)))))

(assert (=> d!75097 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8392) e!271459)))

(declare-fun b!464669 () Bool)

(declare-fun contains!2502 (List!8395 (_ BitVec 64)) Bool)

(assert (=> b!464669 (= e!271462 (contains!2502 Nil!8392 (select (arr!14013 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75097 (not res!277820)) b!464672))

(assert (= (and b!464672 res!277819) b!464669))

(assert (= (and b!464672 res!277818) b!464670))

(assert (= (and b!464670 c!56647) b!464668))

(assert (= (and b!464670 (not c!56647)) b!464671))

(assert (= (or b!464668 b!464671) bm!30211))

(assert (=> b!464670 m!447227))

(assert (=> b!464670 m!447227))

(assert (=> b!464670 m!447233))

(assert (=> b!464672 m!447227))

(assert (=> b!464672 m!447227))

(assert (=> b!464672 m!447233))

(assert (=> bm!30211 m!447227))

(declare-fun m!447265 () Bool)

(assert (=> bm!30211 m!447265))

(assert (=> b!464669 m!447227))

(assert (=> b!464669 m!447227))

(declare-fun m!447267 () Bool)

(assert (=> b!464669 m!447267))

(assert (=> b!464550 d!75097))

(declare-fun mapIsEmpty!20722 () Bool)

(declare-fun mapRes!20722 () Bool)

(assert (=> mapIsEmpty!20722 mapRes!20722))

(declare-fun condMapEmpty!20722 () Bool)

(declare-fun mapDefault!20722 () ValueCell!6002)

(assert (=> mapNonEmpty!20713 (= condMapEmpty!20722 (= mapRest!20713 ((as const (Array (_ BitVec 32) ValueCell!6002)) mapDefault!20722)))))

(declare-fun e!271468 () Bool)

(assert (=> mapNonEmpty!20713 (= tp!39787 (and e!271468 mapRes!20722))))

(declare-fun b!464679 () Bool)

(declare-fun e!271467 () Bool)

(assert (=> b!464679 (= e!271467 tp_is_empty!12691)))

(declare-fun b!464680 () Bool)

(assert (=> b!464680 (= e!271468 tp_is_empty!12691)))

(declare-fun mapNonEmpty!20722 () Bool)

(declare-fun tp!39802 () Bool)

(assert (=> mapNonEmpty!20722 (= mapRes!20722 (and tp!39802 e!271467))))

(declare-fun mapRest!20722 () (Array (_ BitVec 32) ValueCell!6002))

(declare-fun mapValue!20722 () ValueCell!6002)

(declare-fun mapKey!20722 () (_ BitVec 32))

(assert (=> mapNonEmpty!20722 (= mapRest!20713 (store mapRest!20722 mapKey!20722 mapValue!20722))))

(assert (= (and mapNonEmpty!20713 condMapEmpty!20722) mapIsEmpty!20722))

(assert (= (and mapNonEmpty!20713 (not condMapEmpty!20722)) mapNonEmpty!20722))

(assert (= (and mapNonEmpty!20722 ((_ is ValueCellFull!6002) mapValue!20722)) b!464679))

(assert (= (and mapNonEmpty!20713 ((_ is ValueCellFull!6002) mapDefault!20722)) b!464680))

(declare-fun m!447269 () Bool)

(assert (=> mapNonEmpty!20722 m!447269))

(declare-fun b_lambda!9995 () Bool)

(assert (= b_lambda!9989 (or (and start!41582 b_free!11263) b_lambda!9995)))

(declare-fun b_lambda!9997 () Bool)

(assert (= b_lambda!9991 (or (and start!41582 b_free!11263) b_lambda!9997)))

(declare-fun b_lambda!9999 () Bool)

(assert (= b_lambda!9993 (or (and start!41582 b_free!11263) b_lambda!9999)))

(declare-fun b_lambda!10001 () Bool)

(assert (= b_lambda!9987 (or (and start!41582 b_free!11263) b_lambda!10001)))

(check-sat (not d!75087) (not b!464643) (not b!464642) (not b!464628) (not b_lambda!10001) (not b!464656) (not b!464638) (not b!464622) (not bm!30205) (not b!464669) (not bm!30208) (not b!464640) (not b_lambda!9999) (not b!464636) (not b!464654) (not b!464629) (not b!464626) tp_is_empty!12691 (not mapNonEmpty!20722) (not d!75083) (not b!464624) (not b!464644) b_and!19625 (not b!464620) (not b!464623) (not b!464670) (not bm!30211) (not b!464672) (not b!464630) (not b_next!11263) (not bm!30204) (not b_lambda!9997) (not b!464634) (not b_lambda!9995) (not d!75085) (not b!464637))
(check-sat b_and!19625 (not b_next!11263))
