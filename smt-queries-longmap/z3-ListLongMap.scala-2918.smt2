; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41650 () Bool)

(assert start!41650)

(declare-fun b_free!11317 () Bool)

(declare-fun b_next!11317 () Bool)

(assert (=> start!41650 (= b_free!11317 (not b_next!11317))))

(declare-fun tp!39952 () Bool)

(declare-fun b_and!19675 () Bool)

(assert (=> start!41650 (= tp!39952 b_and!19675)))

(declare-fun b!465199 () Bool)

(declare-fun e!271839 () Bool)

(declare-fun tp_is_empty!12745 () Bool)

(assert (=> b!465199 (= e!271839 tp_is_empty!12745)))

(declare-fun b!465200 () Bool)

(declare-fun e!271841 () Bool)

(declare-fun mapRes!20797 () Bool)

(assert (=> b!465200 (= e!271841 (and e!271839 mapRes!20797))))

(declare-fun condMapEmpty!20797 () Bool)

(declare-datatypes ((V!18099 0))(
  ( (V!18100 (val!6417 Int)) )
))
(declare-datatypes ((ValueCell!6029 0))(
  ( (ValueCellFull!6029 (v!8705 V!18099)) (EmptyCell!6029) )
))
(declare-datatypes ((array!29272 0))(
  ( (array!29273 (arr!14066 (Array (_ BitVec 32) ValueCell!6029)) (size!14418 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29272)

(declare-fun mapDefault!20797 () ValueCell!6029)

(assert (=> b!465200 (= condMapEmpty!20797 (= (arr!14066 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6029)) mapDefault!20797)))))

(declare-fun mapIsEmpty!20797 () Bool)

(assert (=> mapIsEmpty!20797 mapRes!20797))

(declare-fun b!465201 () Bool)

(declare-fun res!278117 () Bool)

(declare-fun e!271843 () Bool)

(assert (=> b!465201 (=> (not res!278117) (not e!271843))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29274 0))(
  ( (array!29275 (arr!14067 (Array (_ BitVec 32) (_ BitVec 64))) (size!14419 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29274)

(assert (=> b!465201 (= res!278117 (and (= (size!14418 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14419 _keys!1025) (size!14418 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465202 () Bool)

(declare-fun res!278120 () Bool)

(assert (=> b!465202 (=> (not res!278120) (not e!271843))))

(declare-datatypes ((List!8432 0))(
  ( (Nil!8429) (Cons!8428 (h!9284 (_ BitVec 64)) (t!14372 List!8432)) )
))
(declare-fun arrayNoDuplicates!0 (array!29274 (_ BitVec 32) List!8432) Bool)

(assert (=> b!465202 (= res!278120 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8429))))

(declare-fun b!465203 () Bool)

(declare-fun res!278118 () Bool)

(assert (=> b!465203 (=> (not res!278118) (not e!271843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29274 (_ BitVec 32)) Bool)

(assert (=> b!465203 (= res!278118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20797 () Bool)

(declare-fun tp!39951 () Bool)

(declare-fun e!271840 () Bool)

(assert (=> mapNonEmpty!20797 (= mapRes!20797 (and tp!39951 e!271840))))

(declare-fun mapRest!20797 () (Array (_ BitVec 32) ValueCell!6029))

(declare-fun mapValue!20797 () ValueCell!6029)

(declare-fun mapKey!20797 () (_ BitVec 32))

(assert (=> mapNonEmpty!20797 (= (arr!14066 _values!833) (store mapRest!20797 mapKey!20797 mapValue!20797))))

(declare-fun res!278119 () Bool)

(assert (=> start!41650 (=> (not res!278119) (not e!271843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41650 (= res!278119 (validMask!0 mask!1365))))

(assert (=> start!41650 e!271843))

(assert (=> start!41650 tp_is_empty!12745))

(assert (=> start!41650 tp!39952))

(assert (=> start!41650 true))

(declare-fun array_inv!10240 (array!29274) Bool)

(assert (=> start!41650 (array_inv!10240 _keys!1025)))

(declare-fun array_inv!10241 (array!29272) Bool)

(assert (=> start!41650 (and (array_inv!10241 _values!833) e!271841)))

(declare-fun b!465204 () Bool)

(assert (=> b!465204 (= e!271840 tp_is_empty!12745)))

(declare-fun b!465205 () Bool)

(assert (=> b!465205 (= e!271843 (not (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14419 _keys!1025)))))))

(declare-datatypes ((tuple2!8344 0))(
  ( (tuple2!8345 (_1!4183 (_ BitVec 64)) (_2!4183 V!18099)) )
))
(declare-datatypes ((List!8433 0))(
  ( (Nil!8430) (Cons!8429 (h!9285 tuple2!8344) (t!14373 List!8433)) )
))
(declare-datatypes ((ListLongMap!7259 0))(
  ( (ListLongMap!7260 (toList!3645 List!8433)) )
))
(declare-fun lt!210083 () ListLongMap!7259)

(declare-fun lt!210082 () ListLongMap!7259)

(assert (=> b!465205 (= lt!210083 lt!210082)))

(declare-fun minValueBefore!38 () V!18099)

(declare-fun zeroValue!794 () V!18099)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13508 0))(
  ( (Unit!13509) )
))
(declare-fun lt!210084 () Unit!13508)

(declare-fun minValueAfter!38 () V!18099)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!32 (array!29274 array!29272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18099 V!18099 V!18099 V!18099 (_ BitVec 32) Int) Unit!13508)

(assert (=> b!465205 (= lt!210084 (lemmaNoChangeToArrayThenSameMapNoExtras!32 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1872 (array!29274 array!29272 (_ BitVec 32) (_ BitVec 32) V!18099 V!18099 (_ BitVec 32) Int) ListLongMap!7259)

(assert (=> b!465205 (= lt!210082 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465205 (= lt!210083 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41650 res!278119) b!465201))

(assert (= (and b!465201 res!278117) b!465203))

(assert (= (and b!465203 res!278118) b!465202))

(assert (= (and b!465202 res!278120) b!465205))

(assert (= (and b!465200 condMapEmpty!20797) mapIsEmpty!20797))

(assert (= (and b!465200 (not condMapEmpty!20797)) mapNonEmpty!20797))

(get-info :version)

(assert (= (and mapNonEmpty!20797 ((_ is ValueCellFull!6029) mapValue!20797)) b!465204))

(assert (= (and b!465200 ((_ is ValueCellFull!6029) mapDefault!20797)) b!465199))

(assert (= start!41650 b!465200))

(declare-fun m!447703 () Bool)

(assert (=> b!465205 m!447703))

(declare-fun m!447705 () Bool)

(assert (=> b!465205 m!447705))

(declare-fun m!447707 () Bool)

(assert (=> b!465205 m!447707))

(declare-fun m!447709 () Bool)

(assert (=> b!465203 m!447709))

(declare-fun m!447711 () Bool)

(assert (=> mapNonEmpty!20797 m!447711))

(declare-fun m!447713 () Bool)

(assert (=> b!465202 m!447713))

(declare-fun m!447715 () Bool)

(assert (=> start!41650 m!447715))

(declare-fun m!447717 () Bool)

(assert (=> start!41650 m!447717))

(declare-fun m!447719 () Bool)

(assert (=> start!41650 m!447719))

(check-sat (not b!465205) b_and!19675 (not b!465203) (not b!465202) (not start!41650) (not b_next!11317) (not mapNonEmpty!20797) tp_is_empty!12745)
(check-sat b_and!19675 (not b_next!11317))
(get-model)

(declare-fun b!465258 () Bool)

(declare-fun e!271884 () Bool)

(declare-fun call!30217 () Bool)

(assert (=> b!465258 (= e!271884 call!30217)))

(declare-fun d!75117 () Bool)

(declare-fun res!278153 () Bool)

(declare-fun e!271883 () Bool)

(assert (=> d!75117 (=> res!278153 e!271883)))

(assert (=> d!75117 (= res!278153 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!75117 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8429) e!271883)))

(declare-fun b!465259 () Bool)

(declare-fun e!271885 () Bool)

(assert (=> b!465259 (= e!271885 e!271884)))

(declare-fun c!56650 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!465259 (= c!56650 (validKeyInArray!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30214 () Bool)

(assert (=> bm!30214 (= call!30217 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56650 (Cons!8428 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000) Nil!8429) Nil!8429)))))

(declare-fun b!465260 () Bool)

(declare-fun e!271882 () Bool)

(declare-fun contains!2503 (List!8432 (_ BitVec 64)) Bool)

(assert (=> b!465260 (= e!271882 (contains!2503 Nil!8429 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465261 () Bool)

(assert (=> b!465261 (= e!271883 e!271885)))

(declare-fun res!278152 () Bool)

(assert (=> b!465261 (=> (not res!278152) (not e!271885))))

(assert (=> b!465261 (= res!278152 (not e!271882))))

(declare-fun res!278151 () Bool)

(assert (=> b!465261 (=> (not res!278151) (not e!271882))))

(assert (=> b!465261 (= res!278151 (validKeyInArray!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465262 () Bool)

(assert (=> b!465262 (= e!271884 call!30217)))

(assert (= (and d!75117 (not res!278153)) b!465261))

(assert (= (and b!465261 res!278151) b!465260))

(assert (= (and b!465261 res!278152) b!465259))

(assert (= (and b!465259 c!56650) b!465258))

(assert (= (and b!465259 (not c!56650)) b!465262))

(assert (= (or b!465258 b!465262) bm!30214))

(declare-fun m!447757 () Bool)

(assert (=> b!465259 m!447757))

(assert (=> b!465259 m!447757))

(declare-fun m!447759 () Bool)

(assert (=> b!465259 m!447759))

(assert (=> bm!30214 m!447757))

(declare-fun m!447761 () Bool)

(assert (=> bm!30214 m!447761))

(assert (=> b!465260 m!447757))

(assert (=> b!465260 m!447757))

(declare-fun m!447763 () Bool)

(assert (=> b!465260 m!447763))

(assert (=> b!465261 m!447757))

(assert (=> b!465261 m!447757))

(assert (=> b!465261 m!447759))

(assert (=> b!465202 d!75117))

(declare-fun d!75119 () Bool)

(assert (=> d!75119 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41650 d!75119))

(declare-fun d!75121 () Bool)

(assert (=> d!75121 (= (array_inv!10240 _keys!1025) (bvsge (size!14419 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41650 d!75121))

(declare-fun d!75123 () Bool)

(assert (=> d!75123 (= (array_inv!10241 _values!833) (bvsge (size!14418 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41650 d!75123))

(declare-fun b!465271 () Bool)

(declare-fun e!271894 () Bool)

(declare-fun e!271892 () Bool)

(assert (=> b!465271 (= e!271894 e!271892)))

(declare-fun lt!210111 () (_ BitVec 64))

(assert (=> b!465271 (= lt!210111 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!210109 () Unit!13508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29274 (_ BitVec 64) (_ BitVec 32)) Unit!13508)

(assert (=> b!465271 (= lt!210109 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!210111 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!465271 (arrayContainsKey!0 _keys!1025 lt!210111 #b00000000000000000000000000000000)))

(declare-fun lt!210110 () Unit!13508)

(assert (=> b!465271 (= lt!210110 lt!210109)))

(declare-fun res!278158 () Bool)

(declare-datatypes ((SeekEntryResult!3494 0))(
  ( (MissingZero!3494 (index!16155 (_ BitVec 32))) (Found!3494 (index!16156 (_ BitVec 32))) (Intermediate!3494 (undefined!4306 Bool) (index!16157 (_ BitVec 32)) (x!43446 (_ BitVec 32))) (Undefined!3494) (MissingVacant!3494 (index!16158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29274 (_ BitVec 32)) SeekEntryResult!3494)

(assert (=> b!465271 (= res!278158 (= (seekEntryOrOpen!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3494 #b00000000000000000000000000000000)))))

(assert (=> b!465271 (=> (not res!278158) (not e!271892))))

(declare-fun bm!30217 () Bool)

(declare-fun call!30220 () Bool)

(assert (=> bm!30217 (= call!30220 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!465272 () Bool)

(assert (=> b!465272 (= e!271892 call!30220)))

(declare-fun d!75125 () Bool)

(declare-fun res!278159 () Bool)

(declare-fun e!271893 () Bool)

(assert (=> d!75125 (=> res!278159 e!271893)))

(assert (=> d!75125 (= res!278159 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!75125 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!271893)))

(declare-fun b!465273 () Bool)

(assert (=> b!465273 (= e!271893 e!271894)))

(declare-fun c!56653 () Bool)

(assert (=> b!465273 (= c!56653 (validKeyInArray!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465274 () Bool)

(assert (=> b!465274 (= e!271894 call!30220)))

(assert (= (and d!75125 (not res!278159)) b!465273))

(assert (= (and b!465273 c!56653) b!465271))

(assert (= (and b!465273 (not c!56653)) b!465274))

(assert (= (and b!465271 res!278158) b!465272))

(assert (= (or b!465272 b!465274) bm!30217))

(assert (=> b!465271 m!447757))

(declare-fun m!447765 () Bool)

(assert (=> b!465271 m!447765))

(declare-fun m!447767 () Bool)

(assert (=> b!465271 m!447767))

(assert (=> b!465271 m!447757))

(declare-fun m!447769 () Bool)

(assert (=> b!465271 m!447769))

(declare-fun m!447771 () Bool)

(assert (=> bm!30217 m!447771))

(assert (=> b!465273 m!447757))

(assert (=> b!465273 m!447757))

(assert (=> b!465273 m!447759))

(assert (=> b!465203 d!75125))

(declare-fun d!75127 () Bool)

(assert (=> d!75127 (= (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210114 () Unit!13508)

(declare-fun choose!1345 (array!29274 array!29272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18099 V!18099 V!18099 V!18099 (_ BitVec 32) Int) Unit!13508)

(assert (=> d!75127 (= lt!210114 (choose!1345 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75127 (validMask!0 mask!1365)))

(assert (=> d!75127 (= (lemmaNoChangeToArrayThenSameMapNoExtras!32 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210114)))

(declare-fun bs!14738 () Bool)

(assert (= bs!14738 d!75127))

(assert (=> bs!14738 m!447707))

(assert (=> bs!14738 m!447705))

(declare-fun m!447773 () Bool)

(assert (=> bs!14738 m!447773))

(assert (=> bs!14738 m!447715))

(assert (=> b!465205 d!75127))

(declare-fun b!465299 () Bool)

(declare-fun res!278171 () Bool)

(declare-fun e!271912 () Bool)

(assert (=> b!465299 (=> (not res!278171) (not e!271912))))

(declare-fun lt!210131 () ListLongMap!7259)

(declare-fun contains!2504 (ListLongMap!7259 (_ BitVec 64)) Bool)

(assert (=> b!465299 (= res!278171 (not (contains!2504 lt!210131 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465300 () Bool)

(declare-fun e!271910 () Bool)

(declare-fun e!271914 () Bool)

(assert (=> b!465300 (= e!271910 e!271914)))

(assert (=> b!465300 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun res!278168 () Bool)

(assert (=> b!465300 (= res!278168 (contains!2504 lt!210131 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465300 (=> (not res!278168) (not e!271914))))

(declare-fun b!465301 () Bool)

(declare-fun e!271913 () Bool)

(declare-fun isEmpty!574 (ListLongMap!7259) Bool)

(assert (=> b!465301 (= e!271913 (isEmpty!574 lt!210131))))

(declare-fun b!465302 () Bool)

(declare-fun lt!210130 () Unit!13508)

(declare-fun lt!210134 () Unit!13508)

(assert (=> b!465302 (= lt!210130 lt!210134)))

(declare-fun lt!210133 () V!18099)

(declare-fun lt!210129 () (_ BitVec 64))

(declare-fun lt!210135 () ListLongMap!7259)

(declare-fun lt!210132 () (_ BitVec 64))

(declare-fun +!1648 (ListLongMap!7259 tuple2!8344) ListLongMap!7259)

(assert (=> b!465302 (not (contains!2504 (+!1648 lt!210135 (tuple2!8345 lt!210129 lt!210133)) lt!210132))))

(declare-fun addStillNotContains!156 (ListLongMap!7259 (_ BitVec 64) V!18099 (_ BitVec 64)) Unit!13508)

(assert (=> b!465302 (= lt!210134 (addStillNotContains!156 lt!210135 lt!210129 lt!210133 lt!210132))))

(assert (=> b!465302 (= lt!210132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6909 (ValueCell!6029 V!18099) V!18099)

(declare-fun dynLambda!911 (Int (_ BitVec 64)) V!18099)

(assert (=> b!465302 (= lt!210133 (get!6909 (select (arr!14066 _values!833) #b00000000000000000000000000000000) (dynLambda!911 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465302 (= lt!210129 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30223 () ListLongMap!7259)

(assert (=> b!465302 (= lt!210135 call!30223)))

(declare-fun e!271909 () ListLongMap!7259)

(assert (=> b!465302 (= e!271909 (+!1648 call!30223 (tuple2!8345 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000) (get!6909 (select (arr!14066 _values!833) #b00000000000000000000000000000000) (dynLambda!911 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!75129 () Bool)

(assert (=> d!75129 e!271912))

(declare-fun res!278170 () Bool)

(assert (=> d!75129 (=> (not res!278170) (not e!271912))))

(assert (=> d!75129 (= res!278170 (not (contains!2504 lt!210131 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!271911 () ListLongMap!7259)

(assert (=> d!75129 (= lt!210131 e!271911)))

(declare-fun c!56664 () Bool)

(assert (=> d!75129 (= c!56664 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!75129 (validMask!0 mask!1365)))

(assert (=> d!75129 (= (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210131)))

(declare-fun b!465303 () Bool)

(assert (=> b!465303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> b!465303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14418 _values!833)))))

(declare-fun apply!321 (ListLongMap!7259 (_ BitVec 64)) V!18099)

(assert (=> b!465303 (= e!271914 (= (apply!321 lt!210131 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)) (get!6909 (select (arr!14066 _values!833) #b00000000000000000000000000000000) (dynLambda!911 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30220 () Bool)

(assert (=> bm!30220 (= call!30223 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!465304 () Bool)

(assert (=> b!465304 (= e!271910 e!271913)))

(declare-fun c!56665 () Bool)

(assert (=> b!465304 (= c!56665 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465305 () Bool)

(assert (=> b!465305 (= e!271912 e!271910)))

(declare-fun c!56663 () Bool)

(declare-fun e!271915 () Bool)

(assert (=> b!465305 (= c!56663 e!271915)))

(declare-fun res!278169 () Bool)

(assert (=> b!465305 (=> (not res!278169) (not e!271915))))

(assert (=> b!465305 (= res!278169 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465306 () Bool)

(assert (=> b!465306 (= e!271909 call!30223)))

(declare-fun b!465307 () Bool)

(assert (=> b!465307 (= e!271911 e!271909)))

(declare-fun c!56662 () Bool)

(assert (=> b!465307 (= c!56662 (validKeyInArray!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465308 () Bool)

(assert (=> b!465308 (= e!271915 (validKeyInArray!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465308 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!465309 () Bool)

(assert (=> b!465309 (= e!271913 (= lt!210131 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!465310 () Bool)

(assert (=> b!465310 (= e!271911 (ListLongMap!7260 Nil!8430))))

(assert (= (and d!75129 c!56664) b!465310))

(assert (= (and d!75129 (not c!56664)) b!465307))

(assert (= (and b!465307 c!56662) b!465302))

(assert (= (and b!465307 (not c!56662)) b!465306))

(assert (= (or b!465302 b!465306) bm!30220))

(assert (= (and d!75129 res!278170) b!465299))

(assert (= (and b!465299 res!278171) b!465305))

(assert (= (and b!465305 res!278169) b!465308))

(assert (= (and b!465305 c!56663) b!465300))

(assert (= (and b!465305 (not c!56663)) b!465304))

(assert (= (and b!465300 res!278168) b!465303))

(assert (= (and b!465304 c!56665) b!465309))

(assert (= (and b!465304 (not c!56665)) b!465301))

(declare-fun b_lambda!10003 () Bool)

(assert (=> (not b_lambda!10003) (not b!465302)))

(declare-fun t!14377 () Bool)

(declare-fun tb!3899 () Bool)

(assert (=> (and start!41650 (= defaultEntry!841 defaultEntry!841) t!14377) tb!3899))

(declare-fun result!7371 () Bool)

(assert (=> tb!3899 (= result!7371 tp_is_empty!12745)))

(assert (=> b!465302 t!14377))

(declare-fun b_and!19681 () Bool)

(assert (= b_and!19675 (and (=> t!14377 result!7371) b_and!19681)))

(declare-fun b_lambda!10005 () Bool)

(assert (=> (not b_lambda!10005) (not b!465303)))

(assert (=> b!465303 t!14377))

(declare-fun b_and!19683 () Bool)

(assert (= b_and!19681 (and (=> t!14377 result!7371) b_and!19683)))

(declare-fun m!447775 () Bool)

(assert (=> bm!30220 m!447775))

(assert (=> b!465303 m!447757))

(declare-fun m!447777 () Bool)

(assert (=> b!465303 m!447777))

(declare-fun m!447779 () Bool)

(assert (=> b!465303 m!447779))

(declare-fun m!447781 () Bool)

(assert (=> b!465303 m!447781))

(assert (=> b!465303 m!447779))

(assert (=> b!465303 m!447757))

(declare-fun m!447783 () Bool)

(assert (=> b!465303 m!447783))

(assert (=> b!465303 m!447777))

(assert (=> b!465300 m!447757))

(assert (=> b!465300 m!447757))

(declare-fun m!447785 () Bool)

(assert (=> b!465300 m!447785))

(declare-fun m!447787 () Bool)

(assert (=> d!75129 m!447787))

(assert (=> d!75129 m!447715))

(assert (=> b!465307 m!447757))

(assert (=> b!465307 m!447757))

(assert (=> b!465307 m!447759))

(assert (=> b!465308 m!447757))

(assert (=> b!465308 m!447757))

(assert (=> b!465308 m!447759))

(declare-fun m!447789 () Bool)

(assert (=> b!465301 m!447789))

(declare-fun m!447791 () Bool)

(assert (=> b!465299 m!447791))

(assert (=> b!465309 m!447775))

(declare-fun m!447793 () Bool)

(assert (=> b!465302 m!447793))

(declare-fun m!447795 () Bool)

(assert (=> b!465302 m!447795))

(assert (=> b!465302 m!447757))

(assert (=> b!465302 m!447795))

(declare-fun m!447797 () Bool)

(assert (=> b!465302 m!447797))

(assert (=> b!465302 m!447777))

(assert (=> b!465302 m!447779))

(assert (=> b!465302 m!447781))

(assert (=> b!465302 m!447779))

(assert (=> b!465302 m!447777))

(declare-fun m!447799 () Bool)

(assert (=> b!465302 m!447799))

(assert (=> b!465205 d!75129))

(declare-fun b!465313 () Bool)

(declare-fun res!278175 () Bool)

(declare-fun e!271919 () Bool)

(assert (=> b!465313 (=> (not res!278175) (not e!271919))))

(declare-fun lt!210138 () ListLongMap!7259)

(assert (=> b!465313 (= res!278175 (not (contains!2504 lt!210138 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!465314 () Bool)

(declare-fun e!271917 () Bool)

(declare-fun e!271921 () Bool)

(assert (=> b!465314 (= e!271917 e!271921)))

(assert (=> b!465314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun res!278172 () Bool)

(assert (=> b!465314 (= res!278172 (contains!2504 lt!210138 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465314 (=> (not res!278172) (not e!271921))))

(declare-fun b!465315 () Bool)

(declare-fun e!271920 () Bool)

(assert (=> b!465315 (= e!271920 (isEmpty!574 lt!210138))))

(declare-fun b!465316 () Bool)

(declare-fun lt!210137 () Unit!13508)

(declare-fun lt!210141 () Unit!13508)

(assert (=> b!465316 (= lt!210137 lt!210141)))

(declare-fun lt!210136 () (_ BitVec 64))

(declare-fun lt!210139 () (_ BitVec 64))

(declare-fun lt!210142 () ListLongMap!7259)

(declare-fun lt!210140 () V!18099)

(assert (=> b!465316 (not (contains!2504 (+!1648 lt!210142 (tuple2!8345 lt!210136 lt!210140)) lt!210139))))

(assert (=> b!465316 (= lt!210141 (addStillNotContains!156 lt!210142 lt!210136 lt!210140 lt!210139))))

(assert (=> b!465316 (= lt!210139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!465316 (= lt!210140 (get!6909 (select (arr!14066 _values!833) #b00000000000000000000000000000000) (dynLambda!911 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!465316 (= lt!210136 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30224 () ListLongMap!7259)

(assert (=> b!465316 (= lt!210142 call!30224)))

(declare-fun e!271916 () ListLongMap!7259)

(assert (=> b!465316 (= e!271916 (+!1648 call!30224 (tuple2!8345 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000) (get!6909 (select (arr!14066 _values!833) #b00000000000000000000000000000000) (dynLambda!911 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!75131 () Bool)

(assert (=> d!75131 e!271919))

(declare-fun res!278174 () Bool)

(assert (=> d!75131 (=> (not res!278174) (not e!271919))))

(assert (=> d!75131 (= res!278174 (not (contains!2504 lt!210138 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!271918 () ListLongMap!7259)

(assert (=> d!75131 (= lt!210138 e!271918)))

(declare-fun c!56668 () Bool)

(assert (=> d!75131 (= c!56668 (bvsge #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> d!75131 (validMask!0 mask!1365)))

(assert (=> d!75131 (= (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!210138)))

(declare-fun b!465317 () Bool)

(assert (=> b!465317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(assert (=> b!465317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14418 _values!833)))))

(assert (=> b!465317 (= e!271921 (= (apply!321 lt!210138 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)) (get!6909 (select (arr!14066 _values!833) #b00000000000000000000000000000000) (dynLambda!911 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!30221 () Bool)

(assert (=> bm!30221 (= call!30224 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!465318 () Bool)

(assert (=> b!465318 (= e!271917 e!271920)))

(declare-fun c!56669 () Bool)

(assert (=> b!465318 (= c!56669 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465319 () Bool)

(assert (=> b!465319 (= e!271919 e!271917)))

(declare-fun c!56667 () Bool)

(declare-fun e!271922 () Bool)

(assert (=> b!465319 (= c!56667 e!271922)))

(declare-fun res!278173 () Bool)

(assert (=> b!465319 (=> (not res!278173) (not e!271922))))

(assert (=> b!465319 (= res!278173 (bvslt #b00000000000000000000000000000000 (size!14419 _keys!1025)))))

(declare-fun b!465320 () Bool)

(assert (=> b!465320 (= e!271916 call!30224)))

(declare-fun b!465321 () Bool)

(assert (=> b!465321 (= e!271918 e!271916)))

(declare-fun c!56666 () Bool)

(assert (=> b!465321 (= c!56666 (validKeyInArray!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!465322 () Bool)

(assert (=> b!465322 (= e!271922 (validKeyInArray!0 (select (arr!14067 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!465322 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!465323 () Bool)

(assert (=> b!465323 (= e!271920 (= lt!210138 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!465324 () Bool)

(assert (=> b!465324 (= e!271918 (ListLongMap!7260 Nil!8430))))

(assert (= (and d!75131 c!56668) b!465324))

(assert (= (and d!75131 (not c!56668)) b!465321))

(assert (= (and b!465321 c!56666) b!465316))

(assert (= (and b!465321 (not c!56666)) b!465320))

(assert (= (or b!465316 b!465320) bm!30221))

(assert (= (and d!75131 res!278174) b!465313))

(assert (= (and b!465313 res!278175) b!465319))

(assert (= (and b!465319 res!278173) b!465322))

(assert (= (and b!465319 c!56667) b!465314))

(assert (= (and b!465319 (not c!56667)) b!465318))

(assert (= (and b!465314 res!278172) b!465317))

(assert (= (and b!465318 c!56669) b!465323))

(assert (= (and b!465318 (not c!56669)) b!465315))

(declare-fun b_lambda!10007 () Bool)

(assert (=> (not b_lambda!10007) (not b!465316)))

(assert (=> b!465316 t!14377))

(declare-fun b_and!19685 () Bool)

(assert (= b_and!19683 (and (=> t!14377 result!7371) b_and!19685)))

(declare-fun b_lambda!10009 () Bool)

(assert (=> (not b_lambda!10009) (not b!465317)))

(assert (=> b!465317 t!14377))

(declare-fun b_and!19687 () Bool)

(assert (= b_and!19685 (and (=> t!14377 result!7371) b_and!19687)))

(declare-fun m!447801 () Bool)

(assert (=> bm!30221 m!447801))

(assert (=> b!465317 m!447757))

(assert (=> b!465317 m!447777))

(assert (=> b!465317 m!447779))

(assert (=> b!465317 m!447781))

(assert (=> b!465317 m!447779))

(assert (=> b!465317 m!447757))

(declare-fun m!447803 () Bool)

(assert (=> b!465317 m!447803))

(assert (=> b!465317 m!447777))

(assert (=> b!465314 m!447757))

(assert (=> b!465314 m!447757))

(declare-fun m!447805 () Bool)

(assert (=> b!465314 m!447805))

(declare-fun m!447807 () Bool)

(assert (=> d!75131 m!447807))

(assert (=> d!75131 m!447715))

(assert (=> b!465321 m!447757))

(assert (=> b!465321 m!447757))

(assert (=> b!465321 m!447759))

(assert (=> b!465322 m!447757))

(assert (=> b!465322 m!447757))

(assert (=> b!465322 m!447759))

(declare-fun m!447809 () Bool)

(assert (=> b!465315 m!447809))

(declare-fun m!447811 () Bool)

(assert (=> b!465313 m!447811))

(assert (=> b!465323 m!447801))

(declare-fun m!447813 () Bool)

(assert (=> b!465316 m!447813))

(declare-fun m!447815 () Bool)

(assert (=> b!465316 m!447815))

(assert (=> b!465316 m!447757))

(assert (=> b!465316 m!447815))

(declare-fun m!447817 () Bool)

(assert (=> b!465316 m!447817))

(assert (=> b!465316 m!447777))

(assert (=> b!465316 m!447779))

(assert (=> b!465316 m!447781))

(assert (=> b!465316 m!447779))

(assert (=> b!465316 m!447777))

(declare-fun m!447819 () Bool)

(assert (=> b!465316 m!447819))

(assert (=> b!465205 d!75131))

(declare-fun mapIsEmpty!20806 () Bool)

(declare-fun mapRes!20806 () Bool)

(assert (=> mapIsEmpty!20806 mapRes!20806))

(declare-fun condMapEmpty!20806 () Bool)

(declare-fun mapDefault!20806 () ValueCell!6029)

(assert (=> mapNonEmpty!20797 (= condMapEmpty!20806 (= mapRest!20797 ((as const (Array (_ BitVec 32) ValueCell!6029)) mapDefault!20806)))))

(declare-fun e!271928 () Bool)

(assert (=> mapNonEmpty!20797 (= tp!39951 (and e!271928 mapRes!20806))))

(declare-fun b!465332 () Bool)

(assert (=> b!465332 (= e!271928 tp_is_empty!12745)))

(declare-fun b!465331 () Bool)

(declare-fun e!271927 () Bool)

(assert (=> b!465331 (= e!271927 tp_is_empty!12745)))

(declare-fun mapNonEmpty!20806 () Bool)

(declare-fun tp!39967 () Bool)

(assert (=> mapNonEmpty!20806 (= mapRes!20806 (and tp!39967 e!271927))))

(declare-fun mapRest!20806 () (Array (_ BitVec 32) ValueCell!6029))

(declare-fun mapValue!20806 () ValueCell!6029)

(declare-fun mapKey!20806 () (_ BitVec 32))

(assert (=> mapNonEmpty!20806 (= mapRest!20797 (store mapRest!20806 mapKey!20806 mapValue!20806))))

(assert (= (and mapNonEmpty!20797 condMapEmpty!20806) mapIsEmpty!20806))

(assert (= (and mapNonEmpty!20797 (not condMapEmpty!20806)) mapNonEmpty!20806))

(assert (= (and mapNonEmpty!20806 ((_ is ValueCellFull!6029) mapValue!20806)) b!465331))

(assert (= (and mapNonEmpty!20797 ((_ is ValueCellFull!6029) mapDefault!20806)) b!465332))

(declare-fun m!447821 () Bool)

(assert (=> mapNonEmpty!20806 m!447821))

(declare-fun b_lambda!10011 () Bool)

(assert (= b_lambda!10003 (or (and start!41650 b_free!11317) b_lambda!10011)))

(declare-fun b_lambda!10013 () Bool)

(assert (= b_lambda!10009 (or (and start!41650 b_free!11317) b_lambda!10013)))

(declare-fun b_lambda!10015 () Bool)

(assert (= b_lambda!10007 (or (and start!41650 b_free!11317) b_lambda!10015)))

(declare-fun b_lambda!10017 () Bool)

(assert (= b_lambda!10005 (or (and start!41650 b_free!11317) b_lambda!10017)))

(check-sat (not bm!30221) (not b!465259) (not b!465273) (not b!465315) (not b!465322) (not b!465261) (not b!465300) (not b!465260) (not bm!30220) (not b!465316) (not bm!30214) (not mapNonEmpty!20806) (not b!465301) b_and!19687 (not b!465307) (not b!465299) (not b!465302) (not b!465308) (not b_lambda!10013) (not b!465313) (not b!465314) (not b_next!11317) (not b_lambda!10011) (not b!465303) (not b_lambda!10015) (not bm!30217) (not b!465309) (not b!465321) (not d!75127) (not d!75129) (not b!465271) (not b!465317) (not b!465323) (not b_lambda!10017) tp_is_empty!12745 (not d!75131))
(check-sat b_and!19687 (not b_next!11317))
