; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42216 () Bool)

(assert start!42216)

(declare-fun b_free!11749 () Bool)

(declare-fun b_next!11749 () Bool)

(assert (=> start!42216 (= b_free!11749 (not b_next!11749))))

(declare-fun tp!41271 () Bool)

(declare-fun b_and!20153 () Bool)

(assert (=> start!42216 (= tp!41271 b_and!20153)))

(declare-fun b!471059 () Bool)

(declare-fun e!276052 () Bool)

(declare-fun e!276053 () Bool)

(declare-fun mapRes!21469 () Bool)

(assert (=> b!471059 (= e!276052 (and e!276053 mapRes!21469))))

(declare-fun condMapEmpty!21469 () Bool)

(declare-datatypes ((V!18675 0))(
  ( (V!18676 (val!6633 Int)) )
))
(declare-datatypes ((ValueCell!6245 0))(
  ( (ValueCellFull!6245 (v!8918 V!18675)) (EmptyCell!6245) )
))
(declare-datatypes ((array!30099 0))(
  ( (array!30100 (arr!14472 (Array (_ BitVec 32) ValueCell!6245)) (size!14825 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30099)

(declare-fun mapDefault!21469 () ValueCell!6245)

(assert (=> b!471059 (= condMapEmpty!21469 (= (arr!14472 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6245)) mapDefault!21469)))))

(declare-fun b!471061 () Bool)

(declare-fun res!281464 () Bool)

(declare-fun e!276055 () Bool)

(assert (=> b!471061 (=> (not res!281464) (not e!276055))))

(declare-datatypes ((array!30101 0))(
  ( (array!30102 (arr!14473 (Array (_ BitVec 32) (_ BitVec 64))) (size!14826 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30101)

(declare-datatypes ((List!8839 0))(
  ( (Nil!8836) (Cons!8835 (h!9691 (_ BitVec 64)) (t!14794 List!8839)) )
))
(declare-fun arrayNoDuplicates!0 (array!30101 (_ BitVec 32) List!8839) Bool)

(assert (=> b!471061 (= res!281464 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8836))))

(declare-fun b!471062 () Bool)

(declare-fun res!281463 () Bool)

(assert (=> b!471062 (=> (not res!281463) (not e!276055))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!471062 (= res!281463 (and (= (size!14825 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14826 _keys!1025) (size!14825 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471060 () Bool)

(declare-fun e!276056 () Bool)

(declare-fun tp_is_empty!13177 () Bool)

(assert (=> b!471060 (= e!276056 tp_is_empty!13177)))

(declare-fun res!281462 () Bool)

(assert (=> start!42216 (=> (not res!281462) (not e!276055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42216 (= res!281462 (validMask!0 mask!1365))))

(assert (=> start!42216 e!276055))

(assert (=> start!42216 tp_is_empty!13177))

(assert (=> start!42216 tp!41271))

(assert (=> start!42216 true))

(declare-fun array_inv!10524 (array!30101) Bool)

(assert (=> start!42216 (array_inv!10524 _keys!1025)))

(declare-fun array_inv!10525 (array!30099) Bool)

(assert (=> start!42216 (and (array_inv!10525 _values!833) e!276052)))

(declare-fun b!471063 () Bool)

(assert (=> b!471063 (= e!276053 tp_is_empty!13177)))

(declare-fun b!471064 () Bool)

(assert (=> b!471064 (= e!276055 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14826 _keys!1025)))))))

(declare-datatypes ((tuple2!8766 0))(
  ( (tuple2!8767 (_1!4394 (_ BitVec 64)) (_2!4394 V!18675)) )
))
(declare-datatypes ((List!8840 0))(
  ( (Nil!8837) (Cons!8836 (h!9692 tuple2!8766) (t!14795 List!8840)) )
))
(declare-datatypes ((ListLongMap!7669 0))(
  ( (ListLongMap!7670 (toList!3850 List!8840)) )
))
(declare-fun lt!213606 () ListLongMap!7669)

(declare-fun lt!213607 () ListLongMap!7669)

(assert (=> b!471064 (= lt!213606 lt!213607)))

(declare-datatypes ((Unit!13801 0))(
  ( (Unit!13802) )
))
(declare-fun lt!213605 () Unit!13801)

(declare-fun minValueBefore!38 () V!18675)

(declare-fun zeroValue!794 () V!18675)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18675)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!182 (array!30101 array!30099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18675 V!18675 V!18675 V!18675 (_ BitVec 32) Int) Unit!13801)

(assert (=> b!471064 (= lt!213605 (lemmaNoChangeToArrayThenSameMapNoExtras!182 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2025 (array!30101 array!30099 (_ BitVec 32) (_ BitVec 32) V!18675 V!18675 (_ BitVec 32) Int) ListLongMap!7669)

(assert (=> b!471064 (= lt!213607 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471064 (= lt!213606 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471065 () Bool)

(declare-fun res!281461 () Bool)

(assert (=> b!471065 (=> (not res!281461) (not e!276055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30101 (_ BitVec 32)) Bool)

(assert (=> b!471065 (= res!281461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21469 () Bool)

(declare-fun tp!41272 () Bool)

(assert (=> mapNonEmpty!21469 (= mapRes!21469 (and tp!41272 e!276056))))

(declare-fun mapRest!21469 () (Array (_ BitVec 32) ValueCell!6245))

(declare-fun mapKey!21469 () (_ BitVec 32))

(declare-fun mapValue!21469 () ValueCell!6245)

(assert (=> mapNonEmpty!21469 (= (arr!14472 _values!833) (store mapRest!21469 mapKey!21469 mapValue!21469))))

(declare-fun mapIsEmpty!21469 () Bool)

(assert (=> mapIsEmpty!21469 mapRes!21469))

(assert (= (and start!42216 res!281462) b!471062))

(assert (= (and b!471062 res!281463) b!471065))

(assert (= (and b!471065 res!281461) b!471061))

(assert (= (and b!471061 res!281464) b!471064))

(assert (= (and b!471059 condMapEmpty!21469) mapIsEmpty!21469))

(assert (= (and b!471059 (not condMapEmpty!21469)) mapNonEmpty!21469))

(get-info :version)

(assert (= (and mapNonEmpty!21469 ((_ is ValueCellFull!6245) mapValue!21469)) b!471060))

(assert (= (and b!471059 ((_ is ValueCellFull!6245) mapDefault!21469)) b!471063))

(assert (= start!42216 b!471059))

(declare-fun m!452751 () Bool)

(assert (=> mapNonEmpty!21469 m!452751))

(declare-fun m!452753 () Bool)

(assert (=> b!471065 m!452753))

(declare-fun m!452755 () Bool)

(assert (=> b!471061 m!452755))

(declare-fun m!452757 () Bool)

(assert (=> b!471064 m!452757))

(declare-fun m!452759 () Bool)

(assert (=> b!471064 m!452759))

(declare-fun m!452761 () Bool)

(assert (=> b!471064 m!452761))

(declare-fun m!452763 () Bool)

(assert (=> start!42216 m!452763))

(declare-fun m!452765 () Bool)

(assert (=> start!42216 m!452765))

(declare-fun m!452767 () Bool)

(assert (=> start!42216 m!452767))

(check-sat (not b!471061) b_and!20153 (not b_next!11749) (not mapNonEmpty!21469) (not b!471064) tp_is_empty!13177 (not b!471065) (not start!42216))
(check-sat b_and!20153 (not b_next!11749))
(get-model)

(declare-fun d!75195 () Bool)

(assert (=> d!75195 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42216 d!75195))

(declare-fun d!75197 () Bool)

(assert (=> d!75197 (= (array_inv!10524 _keys!1025) (bvsge (size!14826 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42216 d!75197))

(declare-fun d!75199 () Bool)

(assert (=> d!75199 (= (array_inv!10525 _values!833) (bvsge (size!14825 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42216 d!75199))

(declare-fun d!75201 () Bool)

(assert (=> d!75201 (= (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213628 () Unit!13801)

(declare-fun choose!1355 (array!30101 array!30099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18675 V!18675 V!18675 V!18675 (_ BitVec 32) Int) Unit!13801)

(assert (=> d!75201 (= lt!213628 (choose!1355 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75201 (validMask!0 mask!1365)))

(assert (=> d!75201 (= (lemmaNoChangeToArrayThenSameMapNoExtras!182 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213628)))

(declare-fun bs!14918 () Bool)

(assert (= bs!14918 d!75201))

(assert (=> bs!14918 m!452761))

(assert (=> bs!14918 m!452759))

(declare-fun m!452805 () Bool)

(assert (=> bs!14918 m!452805))

(assert (=> bs!14918 m!452763))

(assert (=> b!471064 d!75201))

(declare-fun b!471132 () Bool)

(declare-fun e!276106 () ListLongMap!7669)

(declare-fun call!30419 () ListLongMap!7669)

(assert (=> b!471132 (= e!276106 call!30419)))

(declare-fun b!471133 () Bool)

(declare-fun lt!213643 () Unit!13801)

(declare-fun lt!213649 () Unit!13801)

(assert (=> b!471133 (= lt!213643 lt!213649)))

(declare-fun lt!213648 () (_ BitVec 64))

(declare-fun lt!213646 () ListLongMap!7669)

(declare-fun lt!213644 () V!18675)

(declare-fun lt!213647 () (_ BitVec 64))

(declare-fun contains!2533 (ListLongMap!7669 (_ BitVec 64)) Bool)

(declare-fun +!1745 (ListLongMap!7669 tuple2!8766) ListLongMap!7669)

(assert (=> b!471133 (not (contains!2533 (+!1745 lt!213646 (tuple2!8767 lt!213647 lt!213644)) lt!213648))))

(declare-fun addStillNotContains!163 (ListLongMap!7669 (_ BitVec 64) V!18675 (_ BitVec 64)) Unit!13801)

(assert (=> b!471133 (= lt!213649 (addStillNotContains!163 lt!213646 lt!213647 lt!213644 lt!213648))))

(assert (=> b!471133 (= lt!213648 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7064 (ValueCell!6245 V!18675) V!18675)

(declare-fun dynLambda!925 (Int (_ BitVec 64)) V!18675)

(assert (=> b!471133 (= lt!213644 (get!7064 (select (arr!14472 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471133 (= lt!213647 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!471133 (= lt!213646 call!30419)))

(assert (=> b!471133 (= e!276106 (+!1745 call!30419 (tuple2!8767 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000) (get!7064 (select (arr!14472 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471134 () Bool)

(declare-fun e!276103 () Bool)

(declare-fun e!276102 () Bool)

(assert (=> b!471134 (= e!276103 e!276102)))

(assert (=> b!471134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun res!281497 () Bool)

(declare-fun lt!213645 () ListLongMap!7669)

(assert (=> b!471134 (= res!281497 (contains!2533 lt!213645 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471134 (=> (not res!281497) (not e!276102))))

(declare-fun b!471135 () Bool)

(declare-fun e!276105 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!471135 (= e!276105 (validKeyInArray!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471135 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471136 () Bool)

(assert (=> b!471136 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> b!471136 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14825 _values!833)))))

(declare-fun apply!329 (ListLongMap!7669 (_ BitVec 64)) V!18675)

(assert (=> b!471136 (= e!276102 (= (apply!329 lt!213645 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)) (get!7064 (select (arr!14472 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!471137 () Bool)

(declare-fun e!276104 () Bool)

(declare-fun isEmpty!580 (ListLongMap!7669) Bool)

(assert (=> b!471137 (= e!276104 (isEmpty!580 lt!213645))))

(declare-fun b!471138 () Bool)

(declare-fun res!281500 () Bool)

(declare-fun e!276107 () Bool)

(assert (=> b!471138 (=> (not res!281500) (not e!276107))))

(assert (=> b!471138 (= res!281500 (not (contains!2533 lt!213645 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!471139 () Bool)

(declare-fun e!276101 () ListLongMap!7669)

(assert (=> b!471139 (= e!276101 (ListLongMap!7670 Nil!8837))))

(declare-fun b!471140 () Bool)

(assert (=> b!471140 (= e!276104 (= lt!213645 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun d!75203 () Bool)

(assert (=> d!75203 e!276107))

(declare-fun res!281498 () Bool)

(assert (=> d!75203 (=> (not res!281498) (not e!276107))))

(assert (=> d!75203 (= res!281498 (not (contains!2533 lt!213645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75203 (= lt!213645 e!276101)))

(declare-fun c!56905 () Bool)

(assert (=> d!75203 (= c!56905 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75203 (validMask!0 mask!1365)))

(assert (=> d!75203 (= (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213645)))

(declare-fun b!471141 () Bool)

(assert (=> b!471141 (= e!276103 e!276104)))

(declare-fun c!56902 () Bool)

(assert (=> b!471141 (= c!56902 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun b!471142 () Bool)

(assert (=> b!471142 (= e!276107 e!276103)))

(declare-fun c!56903 () Bool)

(assert (=> b!471142 (= c!56903 e!276105)))

(declare-fun res!281499 () Bool)

(assert (=> b!471142 (=> (not res!281499) (not e!276105))))

(assert (=> b!471142 (= res!281499 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun bm!30416 () Bool)

(assert (=> bm!30416 (= call!30419 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!471143 () Bool)

(assert (=> b!471143 (= e!276101 e!276106)))

(declare-fun c!56904 () Bool)

(assert (=> b!471143 (= c!56904 (validKeyInArray!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75203 c!56905) b!471139))

(assert (= (and d!75203 (not c!56905)) b!471143))

(assert (= (and b!471143 c!56904) b!471133))

(assert (= (and b!471143 (not c!56904)) b!471132))

(assert (= (or b!471133 b!471132) bm!30416))

(assert (= (and d!75203 res!281498) b!471138))

(assert (= (and b!471138 res!281500) b!471142))

(assert (= (and b!471142 res!281499) b!471135))

(assert (= (and b!471142 c!56903) b!471134))

(assert (= (and b!471142 (not c!56903)) b!471141))

(assert (= (and b!471134 res!281497) b!471136))

(assert (= (and b!471141 c!56902) b!471140))

(assert (= (and b!471141 (not c!56902)) b!471137))

(declare-fun b_lambda!10135 () Bool)

(assert (=> (not b_lambda!10135) (not b!471133)))

(declare-fun t!14799 () Bool)

(declare-fun tb!3915 () Bool)

(assert (=> (and start!42216 (= defaultEntry!841 defaultEntry!841) t!14799) tb!3915))

(declare-fun result!7419 () Bool)

(assert (=> tb!3915 (= result!7419 tp_is_empty!13177)))

(assert (=> b!471133 t!14799))

(declare-fun b_and!20159 () Bool)

(assert (= b_and!20153 (and (=> t!14799 result!7419) b_and!20159)))

(declare-fun b_lambda!10137 () Bool)

(assert (=> (not b_lambda!10137) (not b!471136)))

(assert (=> b!471136 t!14799))

(declare-fun b_and!20161 () Bool)

(assert (= b_and!20159 (and (=> t!14799 result!7419) b_and!20161)))

(declare-fun m!452807 () Bool)

(assert (=> bm!30416 m!452807))

(declare-fun m!452809 () Bool)

(assert (=> d!75203 m!452809))

(assert (=> d!75203 m!452763))

(declare-fun m!452811 () Bool)

(assert (=> b!471136 m!452811))

(declare-fun m!452813 () Bool)

(assert (=> b!471136 m!452813))

(declare-fun m!452815 () Bool)

(assert (=> b!471136 m!452815))

(declare-fun m!452817 () Bool)

(assert (=> b!471136 m!452817))

(assert (=> b!471136 m!452813))

(assert (=> b!471136 m!452815))

(assert (=> b!471136 m!452811))

(declare-fun m!452819 () Bool)

(assert (=> b!471136 m!452819))

(assert (=> b!471143 m!452811))

(assert (=> b!471143 m!452811))

(declare-fun m!452821 () Bool)

(assert (=> b!471143 m!452821))

(assert (=> b!471140 m!452807))

(assert (=> b!471134 m!452811))

(assert (=> b!471134 m!452811))

(declare-fun m!452823 () Bool)

(assert (=> b!471134 m!452823))

(declare-fun m!452825 () Bool)

(assert (=> b!471138 m!452825))

(assert (=> b!471135 m!452811))

(assert (=> b!471135 m!452811))

(assert (=> b!471135 m!452821))

(assert (=> b!471133 m!452811))

(declare-fun m!452827 () Bool)

(assert (=> b!471133 m!452827))

(assert (=> b!471133 m!452813))

(assert (=> b!471133 m!452815))

(declare-fun m!452829 () Bool)

(assert (=> b!471133 m!452829))

(declare-fun m!452831 () Bool)

(assert (=> b!471133 m!452831))

(assert (=> b!471133 m!452829))

(declare-fun m!452833 () Bool)

(assert (=> b!471133 m!452833))

(assert (=> b!471133 m!452813))

(assert (=> b!471133 m!452815))

(assert (=> b!471133 m!452817))

(declare-fun m!452835 () Bool)

(assert (=> b!471137 m!452835))

(assert (=> b!471064 d!75203))

(declare-fun b!471146 () Bool)

(declare-fun e!276113 () ListLongMap!7669)

(declare-fun call!30420 () ListLongMap!7669)

(assert (=> b!471146 (= e!276113 call!30420)))

(declare-fun b!471147 () Bool)

(declare-fun lt!213650 () Unit!13801)

(declare-fun lt!213656 () Unit!13801)

(assert (=> b!471147 (= lt!213650 lt!213656)))

(declare-fun lt!213654 () (_ BitVec 64))

(declare-fun lt!213651 () V!18675)

(declare-fun lt!213653 () ListLongMap!7669)

(declare-fun lt!213655 () (_ BitVec 64))

(assert (=> b!471147 (not (contains!2533 (+!1745 lt!213653 (tuple2!8767 lt!213654 lt!213651)) lt!213655))))

(assert (=> b!471147 (= lt!213656 (addStillNotContains!163 lt!213653 lt!213654 lt!213651 lt!213655))))

(assert (=> b!471147 (= lt!213655 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!471147 (= lt!213651 (get!7064 (select (arr!14472 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!471147 (= lt!213654 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!471147 (= lt!213653 call!30420)))

(assert (=> b!471147 (= e!276113 (+!1745 call!30420 (tuple2!8767 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000) (get!7064 (select (arr!14472 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!471148 () Bool)

(declare-fun e!276110 () Bool)

(declare-fun e!276109 () Bool)

(assert (=> b!471148 (= e!276110 e!276109)))

(assert (=> b!471148 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun res!281501 () Bool)

(declare-fun lt!213652 () ListLongMap!7669)

(assert (=> b!471148 (= res!281501 (contains!2533 lt!213652 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471148 (=> (not res!281501) (not e!276109))))

(declare-fun b!471149 () Bool)

(declare-fun e!276112 () Bool)

(assert (=> b!471149 (= e!276112 (validKeyInArray!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!471149 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!471150 () Bool)

(assert (=> b!471150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> b!471150 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14825 _values!833)))))

(assert (=> b!471150 (= e!276109 (= (apply!329 lt!213652 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)) (get!7064 (select (arr!14472 _values!833) #b00000000000000000000000000000000) (dynLambda!925 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!471151 () Bool)

(declare-fun e!276111 () Bool)

(assert (=> b!471151 (= e!276111 (isEmpty!580 lt!213652))))

(declare-fun b!471152 () Bool)

(declare-fun res!281504 () Bool)

(declare-fun e!276114 () Bool)

(assert (=> b!471152 (=> (not res!281504) (not e!276114))))

(assert (=> b!471152 (= res!281504 (not (contains!2533 lt!213652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!471153 () Bool)

(declare-fun e!276108 () ListLongMap!7669)

(assert (=> b!471153 (= e!276108 (ListLongMap!7670 Nil!8837))))

(declare-fun b!471154 () Bool)

(assert (=> b!471154 (= e!276111 (= lt!213652 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun d!75205 () Bool)

(assert (=> d!75205 e!276114))

(declare-fun res!281502 () Bool)

(assert (=> d!75205 (=> (not res!281502) (not e!276114))))

(assert (=> d!75205 (= res!281502 (not (contains!2533 lt!213652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75205 (= lt!213652 e!276108)))

(declare-fun c!56909 () Bool)

(assert (=> d!75205 (= c!56909 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75205 (validMask!0 mask!1365)))

(assert (=> d!75205 (= (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213652)))

(declare-fun b!471155 () Bool)

(assert (=> b!471155 (= e!276110 e!276111)))

(declare-fun c!56906 () Bool)

(assert (=> b!471155 (= c!56906 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun b!471156 () Bool)

(assert (=> b!471156 (= e!276114 e!276110)))

(declare-fun c!56907 () Bool)

(assert (=> b!471156 (= c!56907 e!276112)))

(declare-fun res!281503 () Bool)

(assert (=> b!471156 (=> (not res!281503) (not e!276112))))

(assert (=> b!471156 (= res!281503 (bvslt #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(declare-fun bm!30417 () Bool)

(assert (=> bm!30417 (= call!30420 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!471157 () Bool)

(assert (=> b!471157 (= e!276108 e!276113)))

(declare-fun c!56908 () Bool)

(assert (=> b!471157 (= c!56908 (validKeyInArray!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75205 c!56909) b!471153))

(assert (= (and d!75205 (not c!56909)) b!471157))

(assert (= (and b!471157 c!56908) b!471147))

(assert (= (and b!471157 (not c!56908)) b!471146))

(assert (= (or b!471147 b!471146) bm!30417))

(assert (= (and d!75205 res!281502) b!471152))

(assert (= (and b!471152 res!281504) b!471156))

(assert (= (and b!471156 res!281503) b!471149))

(assert (= (and b!471156 c!56907) b!471148))

(assert (= (and b!471156 (not c!56907)) b!471155))

(assert (= (and b!471148 res!281501) b!471150))

(assert (= (and b!471155 c!56906) b!471154))

(assert (= (and b!471155 (not c!56906)) b!471151))

(declare-fun b_lambda!10139 () Bool)

(assert (=> (not b_lambda!10139) (not b!471147)))

(assert (=> b!471147 t!14799))

(declare-fun b_and!20163 () Bool)

(assert (= b_and!20161 (and (=> t!14799 result!7419) b_and!20163)))

(declare-fun b_lambda!10141 () Bool)

(assert (=> (not b_lambda!10141) (not b!471150)))

(assert (=> b!471150 t!14799))

(declare-fun b_and!20165 () Bool)

(assert (= b_and!20163 (and (=> t!14799 result!7419) b_and!20165)))

(declare-fun m!452837 () Bool)

(assert (=> bm!30417 m!452837))

(declare-fun m!452839 () Bool)

(assert (=> d!75205 m!452839))

(assert (=> d!75205 m!452763))

(assert (=> b!471150 m!452811))

(assert (=> b!471150 m!452813))

(assert (=> b!471150 m!452815))

(assert (=> b!471150 m!452817))

(assert (=> b!471150 m!452813))

(assert (=> b!471150 m!452815))

(assert (=> b!471150 m!452811))

(declare-fun m!452841 () Bool)

(assert (=> b!471150 m!452841))

(assert (=> b!471157 m!452811))

(assert (=> b!471157 m!452811))

(assert (=> b!471157 m!452821))

(assert (=> b!471154 m!452837))

(assert (=> b!471148 m!452811))

(assert (=> b!471148 m!452811))

(declare-fun m!452843 () Bool)

(assert (=> b!471148 m!452843))

(declare-fun m!452845 () Bool)

(assert (=> b!471152 m!452845))

(assert (=> b!471149 m!452811))

(assert (=> b!471149 m!452811))

(assert (=> b!471149 m!452821))

(assert (=> b!471147 m!452811))

(declare-fun m!452847 () Bool)

(assert (=> b!471147 m!452847))

(assert (=> b!471147 m!452813))

(assert (=> b!471147 m!452815))

(declare-fun m!452849 () Bool)

(assert (=> b!471147 m!452849))

(declare-fun m!452851 () Bool)

(assert (=> b!471147 m!452851))

(assert (=> b!471147 m!452849))

(declare-fun m!452853 () Bool)

(assert (=> b!471147 m!452853))

(assert (=> b!471147 m!452813))

(assert (=> b!471147 m!452815))

(assert (=> b!471147 m!452817))

(declare-fun m!452855 () Bool)

(assert (=> b!471151 m!452855))

(assert (=> b!471064 d!75205))

(declare-fun bm!30420 () Bool)

(declare-fun call!30423 () Bool)

(assert (=> bm!30420 (= call!30423 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75207 () Bool)

(declare-fun res!281510 () Bool)

(declare-fun e!276123 () Bool)

(assert (=> d!75207 (=> res!281510 e!276123)))

(assert (=> d!75207 (= res!281510 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!276123)))

(declare-fun b!471166 () Bool)

(declare-fun e!276122 () Bool)

(declare-fun e!276121 () Bool)

(assert (=> b!471166 (= e!276122 e!276121)))

(declare-fun lt!213665 () (_ BitVec 64))

(assert (=> b!471166 (= lt!213665 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213663 () Unit!13801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30101 (_ BitVec 64) (_ BitVec 32)) Unit!13801)

(assert (=> b!471166 (= lt!213663 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213665 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!471166 (arrayContainsKey!0 _keys!1025 lt!213665 #b00000000000000000000000000000000)))

(declare-fun lt!213664 () Unit!13801)

(assert (=> b!471166 (= lt!213664 lt!213663)))

(declare-fun res!281509 () Bool)

(declare-datatypes ((SeekEntryResult!3548 0))(
  ( (MissingZero!3548 (index!16371 (_ BitVec 32))) (Found!3548 (index!16372 (_ BitVec 32))) (Intermediate!3548 (undefined!4360 Bool) (index!16373 (_ BitVec 32)) (x!44162 (_ BitVec 32))) (Undefined!3548) (MissingVacant!3548 (index!16374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30101 (_ BitVec 32)) SeekEntryResult!3548)

(assert (=> b!471166 (= res!281509 (= (seekEntryOrOpen!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3548 #b00000000000000000000000000000000)))))

(assert (=> b!471166 (=> (not res!281509) (not e!276121))))

(declare-fun b!471167 () Bool)

(assert (=> b!471167 (= e!276122 call!30423)))

(declare-fun b!471168 () Bool)

(assert (=> b!471168 (= e!276123 e!276122)))

(declare-fun c!56912 () Bool)

(assert (=> b!471168 (= c!56912 (validKeyInArray!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471169 () Bool)

(assert (=> b!471169 (= e!276121 call!30423)))

(assert (= (and d!75207 (not res!281510)) b!471168))

(assert (= (and b!471168 c!56912) b!471166))

(assert (= (and b!471168 (not c!56912)) b!471167))

(assert (= (and b!471166 res!281509) b!471169))

(assert (= (or b!471169 b!471167) bm!30420))

(declare-fun m!452857 () Bool)

(assert (=> bm!30420 m!452857))

(assert (=> b!471166 m!452811))

(declare-fun m!452859 () Bool)

(assert (=> b!471166 m!452859))

(declare-fun m!452861 () Bool)

(assert (=> b!471166 m!452861))

(assert (=> b!471166 m!452811))

(declare-fun m!452863 () Bool)

(assert (=> b!471166 m!452863))

(assert (=> b!471168 m!452811))

(assert (=> b!471168 m!452811))

(assert (=> b!471168 m!452821))

(assert (=> b!471065 d!75207))

(declare-fun b!471180 () Bool)

(declare-fun e!276134 () Bool)

(declare-fun call!30426 () Bool)

(assert (=> b!471180 (= e!276134 call!30426)))

(declare-fun b!471181 () Bool)

(assert (=> b!471181 (= e!276134 call!30426)))

(declare-fun bm!30423 () Bool)

(declare-fun c!56915 () Bool)

(assert (=> bm!30423 (= call!30426 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56915 (Cons!8835 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000) Nil!8836) Nil!8836)))))

(declare-fun b!471182 () Bool)

(declare-fun e!276133 () Bool)

(assert (=> b!471182 (= e!276133 e!276134)))

(assert (=> b!471182 (= c!56915 (validKeyInArray!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471183 () Bool)

(declare-fun e!276135 () Bool)

(declare-fun contains!2534 (List!8839 (_ BitVec 64)) Bool)

(assert (=> b!471183 (= e!276135 (contains!2534 Nil!8836 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!471184 () Bool)

(declare-fun e!276132 () Bool)

(assert (=> b!471184 (= e!276132 e!276133)))

(declare-fun res!281517 () Bool)

(assert (=> b!471184 (=> (not res!281517) (not e!276133))))

(assert (=> b!471184 (= res!281517 (not e!276135))))

(declare-fun res!281518 () Bool)

(assert (=> b!471184 (=> (not res!281518) (not e!276135))))

(assert (=> b!471184 (= res!281518 (validKeyInArray!0 (select (arr!14473 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75209 () Bool)

(declare-fun res!281519 () Bool)

(assert (=> d!75209 (=> res!281519 e!276132)))

(assert (=> d!75209 (= res!281519 (bvsge #b00000000000000000000000000000000 (size!14826 _keys!1025)))))

(assert (=> d!75209 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8836) e!276132)))

(assert (= (and d!75209 (not res!281519)) b!471184))

(assert (= (and b!471184 res!281518) b!471183))

(assert (= (and b!471184 res!281517) b!471182))

(assert (= (and b!471182 c!56915) b!471181))

(assert (= (and b!471182 (not c!56915)) b!471180))

(assert (= (or b!471181 b!471180) bm!30423))

(assert (=> bm!30423 m!452811))

(declare-fun m!452865 () Bool)

(assert (=> bm!30423 m!452865))

(assert (=> b!471182 m!452811))

(assert (=> b!471182 m!452811))

(assert (=> b!471182 m!452821))

(assert (=> b!471183 m!452811))

(assert (=> b!471183 m!452811))

(declare-fun m!452867 () Bool)

(assert (=> b!471183 m!452867))

(assert (=> b!471184 m!452811))

(assert (=> b!471184 m!452811))

(assert (=> b!471184 m!452821))

(assert (=> b!471061 d!75209))

(declare-fun b!471191 () Bool)

(declare-fun e!276141 () Bool)

(assert (=> b!471191 (= e!276141 tp_is_empty!13177)))

(declare-fun condMapEmpty!21478 () Bool)

(declare-fun mapDefault!21478 () ValueCell!6245)

(assert (=> mapNonEmpty!21469 (= condMapEmpty!21478 (= mapRest!21469 ((as const (Array (_ BitVec 32) ValueCell!6245)) mapDefault!21478)))))

(declare-fun e!276140 () Bool)

(declare-fun mapRes!21478 () Bool)

(assert (=> mapNonEmpty!21469 (= tp!41272 (and e!276140 mapRes!21478))))

(declare-fun mapNonEmpty!21478 () Bool)

(declare-fun tp!41287 () Bool)

(assert (=> mapNonEmpty!21478 (= mapRes!21478 (and tp!41287 e!276141))))

(declare-fun mapKey!21478 () (_ BitVec 32))

(declare-fun mapValue!21478 () ValueCell!6245)

(declare-fun mapRest!21478 () (Array (_ BitVec 32) ValueCell!6245))

(assert (=> mapNonEmpty!21478 (= mapRest!21469 (store mapRest!21478 mapKey!21478 mapValue!21478))))

(declare-fun mapIsEmpty!21478 () Bool)

(assert (=> mapIsEmpty!21478 mapRes!21478))

(declare-fun b!471192 () Bool)

(assert (=> b!471192 (= e!276140 tp_is_empty!13177)))

(assert (= (and mapNonEmpty!21469 condMapEmpty!21478) mapIsEmpty!21478))

(assert (= (and mapNonEmpty!21469 (not condMapEmpty!21478)) mapNonEmpty!21478))

(assert (= (and mapNonEmpty!21478 ((_ is ValueCellFull!6245) mapValue!21478)) b!471191))

(assert (= (and mapNonEmpty!21469 ((_ is ValueCellFull!6245) mapDefault!21478)) b!471192))

(declare-fun m!452869 () Bool)

(assert (=> mapNonEmpty!21478 m!452869))

(declare-fun b_lambda!10143 () Bool)

(assert (= b_lambda!10135 (or (and start!42216 b_free!11749) b_lambda!10143)))

(declare-fun b_lambda!10145 () Bool)

(assert (= b_lambda!10141 (or (and start!42216 b_free!11749) b_lambda!10145)))

(declare-fun b_lambda!10147 () Bool)

(assert (= b_lambda!10139 (or (and start!42216 b_free!11749) b_lambda!10147)))

(declare-fun b_lambda!10149 () Bool)

(assert (= b_lambda!10137 (or (and start!42216 b_free!11749) b_lambda!10149)))

(check-sat (not b!471136) (not b!471184) (not b!471149) b_and!20165 (not b!471147) (not b_next!11749) (not b_lambda!10143) (not b_lambda!10147) (not b!471150) (not b!471183) (not b!471138) (not b!471157) (not b!471151) (not b!471133) (not b!471134) (not b!471182) (not mapNonEmpty!21478) (not b!471148) (not bm!30417) (not b!471154) (not b!471137) (not d!75201) (not b!471143) (not b!471135) (not bm!30420) (not b!471152) (not b_lambda!10145) (not b!471166) (not d!75205) (not bm!30423) (not b!471168) (not d!75203) (not b_lambda!10149) (not bm!30416) (not b!471140) tp_is_empty!13177)
(check-sat b_and!20165 (not b_next!11749))
