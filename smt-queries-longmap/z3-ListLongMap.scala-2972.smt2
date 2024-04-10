; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42090 () Bool)

(assert start!42090)

(declare-fun b_free!11643 () Bool)

(declare-fun b_next!11643 () Bool)

(assert (=> start!42090 (= b_free!11643 (not b_next!11643))))

(declare-fun tp!40948 () Bool)

(declare-fun b_and!20053 () Bool)

(assert (=> start!42090 (= tp!40948 b_and!20053)))

(declare-fun res!280844 () Bool)

(declare-fun e!275261 () Bool)

(assert (=> start!42090 (=> (not res!280844) (not e!275261))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42090 (= res!280844 (validMask!0 mask!1365))))

(assert (=> start!42090 e!275261))

(declare-fun tp_is_empty!13071 () Bool)

(assert (=> start!42090 tp_is_empty!13071))

(assert (=> start!42090 tp!40948))

(assert (=> start!42090 true))

(declare-datatypes ((array!29913 0))(
  ( (array!29914 (arr!14381 (Array (_ BitVec 32) (_ BitVec 64))) (size!14733 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29913)

(declare-fun array_inv!10374 (array!29913) Bool)

(assert (=> start!42090 (array_inv!10374 _keys!1025)))

(declare-datatypes ((V!18533 0))(
  ( (V!18534 (val!6580 Int)) )
))
(declare-datatypes ((ValueCell!6192 0))(
  ( (ValueCellFull!6192 (v!8870 V!18533)) (EmptyCell!6192) )
))
(declare-datatypes ((array!29915 0))(
  ( (array!29916 (arr!14382 (Array (_ BitVec 32) ValueCell!6192)) (size!14734 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29915)

(declare-fun e!275263 () Bool)

(declare-fun array_inv!10375 (array!29915) Bool)

(assert (=> start!42090 (and (array_inv!10375 _values!833) e!275263)))

(declare-fun mapNonEmpty!21304 () Bool)

(declare-fun mapRes!21304 () Bool)

(declare-fun tp!40947 () Bool)

(declare-fun e!275265 () Bool)

(assert (=> mapNonEmpty!21304 (= mapRes!21304 (and tp!40947 e!275265))))

(declare-fun mapRest!21304 () (Array (_ BitVec 32) ValueCell!6192))

(declare-fun mapValue!21304 () ValueCell!6192)

(declare-fun mapKey!21304 () (_ BitVec 32))

(assert (=> mapNonEmpty!21304 (= (arr!14382 _values!833) (store mapRest!21304 mapKey!21304 mapValue!21304))))

(declare-fun b!469949 () Bool)

(declare-fun e!275264 () Bool)

(assert (=> b!469949 (= e!275261 (not e!275264))))

(declare-fun res!280842 () Bool)

(assert (=> b!469949 (=> res!280842 e!275264)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469949 (= res!280842 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8666 0))(
  ( (tuple2!8667 (_1!4344 (_ BitVec 64)) (_2!4344 V!18533)) )
))
(declare-datatypes ((List!8743 0))(
  ( (Nil!8740) (Cons!8739 (h!9595 tuple2!8666) (t!14703 List!8743)) )
))
(declare-datatypes ((ListLongMap!7579 0))(
  ( (ListLongMap!7580 (toList!3805 List!8743)) )
))
(declare-fun lt!213159 () ListLongMap!7579)

(declare-fun lt!213157 () ListLongMap!7579)

(assert (=> b!469949 (= lt!213159 lt!213157)))

(declare-fun zeroValue!794 () V!18533)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18533)

(declare-datatypes ((Unit!13767 0))(
  ( (Unit!13768) )
))
(declare-fun lt!213156 () Unit!13767)

(declare-fun minValueAfter!38 () V!18533)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!149 (array!29913 array!29915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18533 V!18533 V!18533 V!18533 (_ BitVec 32) Int) Unit!13767)

(assert (=> b!469949 (= lt!213156 (lemmaNoChangeToArrayThenSameMapNoExtras!149 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1969 (array!29913 array!29915 (_ BitVec 32) (_ BitVec 32) V!18533 V!18533 (_ BitVec 32) Int) ListLongMap!7579)

(assert (=> b!469949 (= lt!213157 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469949 (= lt!213159 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469950 () Bool)

(declare-fun res!280846 () Bool)

(assert (=> b!469950 (=> (not res!280846) (not e!275261))))

(assert (=> b!469950 (= res!280846 (and (= (size!14734 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14733 _keys!1025) (size!14734 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469951 () Bool)

(declare-fun res!280845 () Bool)

(assert (=> b!469951 (=> (not res!280845) (not e!275261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29913 (_ BitVec 32)) Bool)

(assert (=> b!469951 (= res!280845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21304 () Bool)

(assert (=> mapIsEmpty!21304 mapRes!21304))

(declare-fun b!469952 () Bool)

(declare-fun e!275262 () Bool)

(assert (=> b!469952 (= e!275263 (and e!275262 mapRes!21304))))

(declare-fun condMapEmpty!21304 () Bool)

(declare-fun mapDefault!21304 () ValueCell!6192)

(assert (=> b!469952 (= condMapEmpty!21304 (= (arr!14382 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6192)) mapDefault!21304)))))

(declare-fun b!469953 () Bool)

(declare-fun res!280843 () Bool)

(assert (=> b!469953 (=> (not res!280843) (not e!275261))))

(declare-datatypes ((List!8744 0))(
  ( (Nil!8741) (Cons!8740 (h!9596 (_ BitVec 64)) (t!14704 List!8744)) )
))
(declare-fun arrayNoDuplicates!0 (array!29913 (_ BitVec 32) List!8744) Bool)

(assert (=> b!469953 (= res!280843 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8741))))

(declare-fun b!469954 () Bool)

(assert (=> b!469954 (= e!275264 (bvsle #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun lt!213161 () tuple2!8666)

(declare-fun +!1712 (ListLongMap!7579 tuple2!8666) ListLongMap!7579)

(assert (=> b!469954 (= (+!1712 lt!213159 lt!213161) (+!1712 (+!1712 lt!213159 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213161))))

(assert (=> b!469954 (= lt!213161 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!213160 () Unit!13767)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!125 (ListLongMap!7579 (_ BitVec 64) V!18533 V!18533) Unit!13767)

(assert (=> b!469954 (= lt!213160 (addSameAsAddTwiceSameKeyDiffValues!125 lt!213159 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!213155 () ListLongMap!7579)

(declare-fun getCurrentListMap!2226 (array!29913 array!29915 (_ BitVec 32) (_ BitVec 32) V!18533 V!18533 (_ BitVec 32) Int) ListLongMap!7579)

(assert (=> b!469954 (= lt!213155 (getCurrentListMap!2226 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213158 () ListLongMap!7579)

(assert (=> b!469954 (= lt!213158 (getCurrentListMap!2226 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469955 () Bool)

(assert (=> b!469955 (= e!275265 tp_is_empty!13071)))

(declare-fun b!469956 () Bool)

(assert (=> b!469956 (= e!275262 tp_is_empty!13071)))

(assert (= (and start!42090 res!280844) b!469950))

(assert (= (and b!469950 res!280846) b!469951))

(assert (= (and b!469951 res!280845) b!469953))

(assert (= (and b!469953 res!280843) b!469949))

(assert (= (and b!469949 (not res!280842)) b!469954))

(assert (= (and b!469952 condMapEmpty!21304) mapIsEmpty!21304))

(assert (= (and b!469952 (not condMapEmpty!21304)) mapNonEmpty!21304))

(get-info :version)

(assert (= (and mapNonEmpty!21304 ((_ is ValueCellFull!6192) mapValue!21304)) b!469955))

(assert (= (and b!469952 ((_ is ValueCellFull!6192) mapDefault!21304)) b!469956))

(assert (= start!42090 b!469952))

(declare-fun m!452241 () Bool)

(assert (=> mapNonEmpty!21304 m!452241))

(declare-fun m!452243 () Bool)

(assert (=> b!469951 m!452243))

(declare-fun m!452245 () Bool)

(assert (=> start!42090 m!452245))

(declare-fun m!452247 () Bool)

(assert (=> start!42090 m!452247))

(declare-fun m!452249 () Bool)

(assert (=> start!42090 m!452249))

(declare-fun m!452251 () Bool)

(assert (=> b!469954 m!452251))

(declare-fun m!452253 () Bool)

(assert (=> b!469954 m!452253))

(declare-fun m!452255 () Bool)

(assert (=> b!469954 m!452255))

(declare-fun m!452257 () Bool)

(assert (=> b!469954 m!452257))

(declare-fun m!452259 () Bool)

(assert (=> b!469954 m!452259))

(declare-fun m!452261 () Bool)

(assert (=> b!469954 m!452261))

(assert (=> b!469954 m!452259))

(declare-fun m!452263 () Bool)

(assert (=> b!469953 m!452263))

(declare-fun m!452265 () Bool)

(assert (=> b!469949 m!452265))

(declare-fun m!452267 () Bool)

(assert (=> b!469949 m!452267))

(declare-fun m!452269 () Bool)

(assert (=> b!469949 m!452269))

(check-sat (not b!469953) tp_is_empty!13071 b_and!20053 (not mapNonEmpty!21304) (not start!42090) (not b_next!11643) (not b!469954) (not b!469951) (not b!469949))
(check-sat b_and!20053 (not b_next!11643))
(get-model)

(declare-fun d!75319 () Bool)

(assert (=> d!75319 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42090 d!75319))

(declare-fun d!75321 () Bool)

(assert (=> d!75321 (= (array_inv!10374 _keys!1025) (bvsge (size!14733 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42090 d!75321))

(declare-fun d!75323 () Bool)

(assert (=> d!75323 (= (array_inv!10375 _values!833) (bvsge (size!14734 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42090 d!75323))

(declare-fun d!75325 () Bool)

(declare-fun res!280870 () Bool)

(declare-fun e!275295 () Bool)

(assert (=> d!75325 (=> res!280870 e!275295)))

(assert (=> d!75325 (= res!280870 (bvsge #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(assert (=> d!75325 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8741) e!275295)))

(declare-fun b!469991 () Bool)

(declare-fun e!275294 () Bool)

(declare-fun call!30396 () Bool)

(assert (=> b!469991 (= e!275294 call!30396)))

(declare-fun b!469992 () Bool)

(declare-fun e!275293 () Bool)

(declare-fun contains!2537 (List!8744 (_ BitVec 64)) Bool)

(assert (=> b!469992 (= e!275293 (contains!2537 Nil!8741 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469993 () Bool)

(declare-fun e!275292 () Bool)

(assert (=> b!469993 (= e!275295 e!275292)))

(declare-fun res!280869 () Bool)

(assert (=> b!469993 (=> (not res!280869) (not e!275292))))

(assert (=> b!469993 (= res!280869 (not e!275293))))

(declare-fun res!280868 () Bool)

(assert (=> b!469993 (=> (not res!280868) (not e!275293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!469993 (= res!280868 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!469994 () Bool)

(assert (=> b!469994 (= e!275294 call!30396)))

(declare-fun b!469995 () Bool)

(assert (=> b!469995 (= e!275292 e!275294)))

(declare-fun c!56899 () Bool)

(assert (=> b!469995 (= c!56899 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30393 () Bool)

(assert (=> bm!30393 (= call!30396 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56899 (Cons!8740 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000) Nil!8741) Nil!8741)))))

(assert (= (and d!75325 (not res!280870)) b!469993))

(assert (= (and b!469993 res!280868) b!469992))

(assert (= (and b!469993 res!280869) b!469995))

(assert (= (and b!469995 c!56899) b!469991))

(assert (= (and b!469995 (not c!56899)) b!469994))

(assert (= (or b!469991 b!469994) bm!30393))

(declare-fun m!452301 () Bool)

(assert (=> b!469992 m!452301))

(assert (=> b!469992 m!452301))

(declare-fun m!452303 () Bool)

(assert (=> b!469992 m!452303))

(assert (=> b!469993 m!452301))

(assert (=> b!469993 m!452301))

(declare-fun m!452305 () Bool)

(assert (=> b!469993 m!452305))

(assert (=> b!469995 m!452301))

(assert (=> b!469995 m!452301))

(assert (=> b!469995 m!452305))

(assert (=> bm!30393 m!452301))

(declare-fun m!452307 () Bool)

(assert (=> bm!30393 m!452307))

(assert (=> b!469953 d!75325))

(declare-fun b!470038 () Bool)

(declare-fun e!275323 () Bool)

(declare-fun call!30411 () Bool)

(assert (=> b!470038 (= e!275323 (not call!30411))))

(declare-fun b!470039 () Bool)

(declare-fun e!275329 () Bool)

(declare-fun call!30413 () Bool)

(assert (=> b!470039 (= e!275329 (not call!30413))))

(declare-fun b!470040 () Bool)

(declare-fun e!275324 () Unit!13767)

(declare-fun lt!213246 () Unit!13767)

(assert (=> b!470040 (= e!275324 lt!213246)))

(declare-fun lt!213232 () ListLongMap!7579)

(assert (=> b!470040 (= lt!213232 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213240 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213240 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213241 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213241 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213233 () Unit!13767)

(declare-fun addStillContains!289 (ListLongMap!7579 (_ BitVec 64) V!18533 (_ BitVec 64)) Unit!13767)

(assert (=> b!470040 (= lt!213233 (addStillContains!289 lt!213232 lt!213240 zeroValue!794 lt!213241))))

(declare-fun contains!2538 (ListLongMap!7579 (_ BitVec 64)) Bool)

(assert (=> b!470040 (contains!2538 (+!1712 lt!213232 (tuple2!8667 lt!213240 zeroValue!794)) lt!213241)))

(declare-fun lt!213231 () Unit!13767)

(assert (=> b!470040 (= lt!213231 lt!213233)))

(declare-fun lt!213236 () ListLongMap!7579)

(assert (=> b!470040 (= lt!213236 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213229 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213237 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213237 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213238 () Unit!13767)

(declare-fun addApplyDifferent!289 (ListLongMap!7579 (_ BitVec 64) V!18533 (_ BitVec 64)) Unit!13767)

(assert (=> b!470040 (= lt!213238 (addApplyDifferent!289 lt!213236 lt!213229 minValueAfter!38 lt!213237))))

(declare-fun apply!327 (ListLongMap!7579 (_ BitVec 64)) V!18533)

(assert (=> b!470040 (= (apply!327 (+!1712 lt!213236 (tuple2!8667 lt!213229 minValueAfter!38)) lt!213237) (apply!327 lt!213236 lt!213237))))

(declare-fun lt!213242 () Unit!13767)

(assert (=> b!470040 (= lt!213242 lt!213238)))

(declare-fun lt!213239 () ListLongMap!7579)

(assert (=> b!470040 (= lt!213239 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213245 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213245 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213244 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213244 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213235 () Unit!13767)

(assert (=> b!470040 (= lt!213235 (addApplyDifferent!289 lt!213239 lt!213245 zeroValue!794 lt!213244))))

(assert (=> b!470040 (= (apply!327 (+!1712 lt!213239 (tuple2!8667 lt!213245 zeroValue!794)) lt!213244) (apply!327 lt!213239 lt!213244))))

(declare-fun lt!213230 () Unit!13767)

(assert (=> b!470040 (= lt!213230 lt!213235)))

(declare-fun lt!213227 () ListLongMap!7579)

(assert (=> b!470040 (= lt!213227 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213228 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213228 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213243 () (_ BitVec 64))

(assert (=> b!470040 (= lt!213243 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470040 (= lt!213246 (addApplyDifferent!289 lt!213227 lt!213228 minValueAfter!38 lt!213243))))

(assert (=> b!470040 (= (apply!327 (+!1712 lt!213227 (tuple2!8667 lt!213228 minValueAfter!38)) lt!213243) (apply!327 lt!213227 lt!213243))))

(declare-fun b!470041 () Bool)

(declare-fun Unit!13771 () Unit!13767)

(assert (=> b!470041 (= e!275324 Unit!13771)))

(declare-fun bm!30408 () Bool)

(declare-fun call!30416 () ListLongMap!7579)

(assert (=> bm!30408 (= call!30416 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470042 () Bool)

(declare-fun res!280889 () Bool)

(declare-fun e!275332 () Bool)

(assert (=> b!470042 (=> (not res!280889) (not e!275332))))

(declare-fun e!275330 () Bool)

(assert (=> b!470042 (= res!280889 e!275330)))

(declare-fun res!280892 () Bool)

(assert (=> b!470042 (=> res!280892 e!275330)))

(declare-fun e!275331 () Bool)

(assert (=> b!470042 (= res!280892 (not e!275331))))

(declare-fun res!280891 () Bool)

(assert (=> b!470042 (=> (not res!280891) (not e!275331))))

(assert (=> b!470042 (= res!280891 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470043 () Bool)

(declare-fun e!275326 () Bool)

(assert (=> b!470043 (= e!275326 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75327 () Bool)

(assert (=> d!75327 e!275332))

(declare-fun res!280897 () Bool)

(assert (=> d!75327 (=> (not res!280897) (not e!275332))))

(assert (=> d!75327 (= res!280897 (or (bvsge #b00000000000000000000000000000000 (size!14733 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))))

(declare-fun lt!213247 () ListLongMap!7579)

(declare-fun lt!213234 () ListLongMap!7579)

(assert (=> d!75327 (= lt!213247 lt!213234)))

(declare-fun lt!213248 () Unit!13767)

(assert (=> d!75327 (= lt!213248 e!275324)))

(declare-fun c!56916 () Bool)

(assert (=> d!75327 (= c!56916 e!275326)))

(declare-fun res!280895 () Bool)

(assert (=> d!75327 (=> (not res!280895) (not e!275326))))

(assert (=> d!75327 (= res!280895 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun e!275325 () ListLongMap!7579)

(assert (=> d!75327 (= lt!213234 e!275325)))

(declare-fun c!56913 () Bool)

(assert (=> d!75327 (= c!56913 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75327 (validMask!0 mask!1365)))

(assert (=> d!75327 (= (getCurrentListMap!2226 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213247)))

(declare-fun b!470044 () Bool)

(declare-fun e!275333 () ListLongMap!7579)

(declare-fun call!30415 () ListLongMap!7579)

(assert (=> b!470044 (= e!275333 call!30415)))

(declare-fun b!470045 () Bool)

(declare-fun e!275327 () Bool)

(assert (=> b!470045 (= e!275329 e!275327)))

(declare-fun res!280890 () Bool)

(assert (=> b!470045 (= res!280890 call!30413)))

(assert (=> b!470045 (=> (not res!280890) (not e!275327))))

(declare-fun b!470046 () Bool)

(declare-fun e!275322 () Bool)

(declare-fun get!7020 (ValueCell!6192 V!18533) V!18533)

(declare-fun dynLambda!920 (Int (_ BitVec 64)) V!18533)

(assert (=> b!470046 (= e!275322 (= (apply!327 lt!213247 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)) (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!470046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14734 _values!833)))))

(assert (=> b!470046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470047 () Bool)

(declare-fun e!275328 () Bool)

(assert (=> b!470047 (= e!275328 (= (apply!327 lt!213247 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!470048 () Bool)

(assert (=> b!470048 (= e!275325 e!275333)))

(declare-fun c!56914 () Bool)

(assert (=> b!470048 (= c!56914 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30409 () Bool)

(declare-fun call!30417 () ListLongMap!7579)

(declare-fun call!30412 () ListLongMap!7579)

(declare-fun call!30414 () ListLongMap!7579)

(assert (=> bm!30409 (= call!30412 (+!1712 (ite c!56913 call!30416 (ite c!56914 call!30417 call!30414)) (ite (or c!56913 c!56914) (tuple2!8667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!470049 () Bool)

(declare-fun res!280894 () Bool)

(assert (=> b!470049 (=> (not res!280894) (not e!275332))))

(assert (=> b!470049 (= res!280894 e!275329)))

(declare-fun c!56912 () Bool)

(assert (=> b!470049 (= c!56912 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30410 () Bool)

(assert (=> bm!30410 (= call!30413 (contains!2538 lt!213247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30411 () Bool)

(assert (=> bm!30411 (= call!30415 call!30412)))

(declare-fun b!470050 () Bool)

(assert (=> b!470050 (= e!275331 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470051 () Bool)

(assert (=> b!470051 (= e!275323 e!275328)))

(declare-fun res!280896 () Bool)

(assert (=> b!470051 (= res!280896 call!30411)))

(assert (=> b!470051 (=> (not res!280896) (not e!275328))))

(declare-fun b!470052 () Bool)

(assert (=> b!470052 (= e!275332 e!275323)))

(declare-fun c!56915 () Bool)

(assert (=> b!470052 (= c!56915 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!470053 () Bool)

(declare-fun e!275334 () ListLongMap!7579)

(assert (=> b!470053 (= e!275334 call!30415)))

(declare-fun bm!30412 () Bool)

(assert (=> bm!30412 (= call!30417 call!30416)))

(declare-fun bm!30413 () Bool)

(assert (=> bm!30413 (= call!30411 (contains!2538 lt!213247 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!470054 () Bool)

(declare-fun c!56917 () Bool)

(assert (=> b!470054 (= c!56917 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!470054 (= e!275333 e!275334)))

(declare-fun b!470055 () Bool)

(assert (=> b!470055 (= e!275327 (= (apply!327 lt!213247 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30414 () Bool)

(assert (=> bm!30414 (= call!30414 call!30417)))

(declare-fun b!470056 () Bool)

(assert (=> b!470056 (= e!275334 call!30414)))

(declare-fun b!470057 () Bool)

(assert (=> b!470057 (= e!275330 e!275322)))

(declare-fun res!280893 () Bool)

(assert (=> b!470057 (=> (not res!280893) (not e!275322))))

(assert (=> b!470057 (= res!280893 (contains!2538 lt!213247 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470058 () Bool)

(assert (=> b!470058 (= e!275325 (+!1712 call!30412 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and d!75327 c!56913) b!470058))

(assert (= (and d!75327 (not c!56913)) b!470048))

(assert (= (and b!470048 c!56914) b!470044))

(assert (= (and b!470048 (not c!56914)) b!470054))

(assert (= (and b!470054 c!56917) b!470053))

(assert (= (and b!470054 (not c!56917)) b!470056))

(assert (= (or b!470053 b!470056) bm!30414))

(assert (= (or b!470044 bm!30414) bm!30412))

(assert (= (or b!470044 b!470053) bm!30411))

(assert (= (or b!470058 bm!30412) bm!30408))

(assert (= (or b!470058 bm!30411) bm!30409))

(assert (= (and d!75327 res!280895) b!470043))

(assert (= (and d!75327 c!56916) b!470040))

(assert (= (and d!75327 (not c!56916)) b!470041))

(assert (= (and d!75327 res!280897) b!470042))

(assert (= (and b!470042 res!280891) b!470050))

(assert (= (and b!470042 (not res!280892)) b!470057))

(assert (= (and b!470057 res!280893) b!470046))

(assert (= (and b!470042 res!280889) b!470049))

(assert (= (and b!470049 c!56912) b!470045))

(assert (= (and b!470049 (not c!56912)) b!470039))

(assert (= (and b!470045 res!280890) b!470055))

(assert (= (or b!470045 b!470039) bm!30410))

(assert (= (and b!470049 res!280894) b!470052))

(assert (= (and b!470052 c!56915) b!470051))

(assert (= (and b!470052 (not c!56915)) b!470038))

(assert (= (and b!470051 res!280896) b!470047))

(assert (= (or b!470051 b!470038) bm!30413))

(declare-fun b_lambda!10113 () Bool)

(assert (=> (not b_lambda!10113) (not b!470046)))

(declare-fun t!14708 () Bool)

(declare-fun tb!3919 () Bool)

(assert (=> (and start!42090 (= defaultEntry!841 defaultEntry!841) t!14708) tb!3919))

(declare-fun result!7415 () Bool)

(assert (=> tb!3919 (= result!7415 tp_is_empty!13071)))

(assert (=> b!470046 t!14708))

(declare-fun b_and!20057 () Bool)

(assert (= b_and!20053 (and (=> t!14708 result!7415) b_and!20057)))

(declare-fun m!452309 () Bool)

(assert (=> bm!30409 m!452309))

(declare-fun m!452311 () Bool)

(assert (=> b!470047 m!452311))

(declare-fun m!452313 () Bool)

(assert (=> bm!30413 m!452313))

(assert (=> b!470050 m!452301))

(assert (=> b!470050 m!452301))

(assert (=> b!470050 m!452305))

(assert (=> b!470057 m!452301))

(assert (=> b!470057 m!452301))

(declare-fun m!452315 () Bool)

(assert (=> b!470057 m!452315))

(declare-fun m!452317 () Bool)

(assert (=> b!470040 m!452317))

(declare-fun m!452319 () Bool)

(assert (=> b!470040 m!452319))

(declare-fun m!452321 () Bool)

(assert (=> b!470040 m!452321))

(declare-fun m!452323 () Bool)

(assert (=> b!470040 m!452323))

(declare-fun m!452325 () Bool)

(assert (=> b!470040 m!452325))

(declare-fun m!452327 () Bool)

(assert (=> b!470040 m!452327))

(declare-fun m!452329 () Bool)

(assert (=> b!470040 m!452329))

(declare-fun m!452331 () Bool)

(assert (=> b!470040 m!452331))

(declare-fun m!452333 () Bool)

(assert (=> b!470040 m!452333))

(declare-fun m!452335 () Bool)

(assert (=> b!470040 m!452335))

(assert (=> b!470040 m!452323))

(declare-fun m!452337 () Bool)

(assert (=> b!470040 m!452337))

(assert (=> b!470040 m!452317))

(assert (=> b!470040 m!452267))

(assert (=> b!470040 m!452301))

(declare-fun m!452339 () Bool)

(assert (=> b!470040 m!452339))

(declare-fun m!452341 () Bool)

(assert (=> b!470040 m!452341))

(assert (=> b!470040 m!452331))

(assert (=> b!470040 m!452321))

(declare-fun m!452343 () Bool)

(assert (=> b!470040 m!452343))

(declare-fun m!452345 () Bool)

(assert (=> b!470040 m!452345))

(declare-fun m!452347 () Bool)

(assert (=> b!470055 m!452347))

(assert (=> bm!30408 m!452267))

(declare-fun m!452349 () Bool)

(assert (=> b!470058 m!452349))

(assert (=> d!75327 m!452245))

(declare-fun m!452351 () Bool)

(assert (=> bm!30410 m!452351))

(assert (=> b!470043 m!452301))

(assert (=> b!470043 m!452301))

(assert (=> b!470043 m!452305))

(declare-fun m!452353 () Bool)

(assert (=> b!470046 m!452353))

(declare-fun m!452355 () Bool)

(assert (=> b!470046 m!452355))

(declare-fun m!452357 () Bool)

(assert (=> b!470046 m!452357))

(assert (=> b!470046 m!452301))

(declare-fun m!452359 () Bool)

(assert (=> b!470046 m!452359))

(assert (=> b!470046 m!452353))

(assert (=> b!470046 m!452355))

(assert (=> b!470046 m!452301))

(assert (=> b!469954 d!75327))

(declare-fun d!75329 () Bool)

(assert (=> d!75329 (= (+!1712 lt!213159 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1712 (+!1712 lt!213159 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!213251 () Unit!13767)

(declare-fun choose!1345 (ListLongMap!7579 (_ BitVec 64) V!18533 V!18533) Unit!13767)

(assert (=> d!75329 (= lt!213251 (choose!1345 lt!213159 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75329 (= (addSameAsAddTwiceSameKeyDiffValues!125 lt!213159 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!213251)))

(declare-fun bs!14891 () Bool)

(assert (= bs!14891 d!75329))

(declare-fun m!452361 () Bool)

(assert (=> bs!14891 m!452361))

(assert (=> bs!14891 m!452259))

(assert (=> bs!14891 m!452259))

(declare-fun m!452363 () Bool)

(assert (=> bs!14891 m!452363))

(declare-fun m!452365 () Bool)

(assert (=> bs!14891 m!452365))

(assert (=> b!469954 d!75329))

(declare-fun b!470061 () Bool)

(declare-fun e!275336 () Bool)

(declare-fun call!30418 () Bool)

(assert (=> b!470061 (= e!275336 (not call!30418))))

(declare-fun b!470062 () Bool)

(declare-fun e!275342 () Bool)

(declare-fun call!30420 () Bool)

(assert (=> b!470062 (= e!275342 (not call!30420))))

(declare-fun b!470063 () Bool)

(declare-fun e!275337 () Unit!13767)

(declare-fun lt!213271 () Unit!13767)

(assert (=> b!470063 (= e!275337 lt!213271)))

(declare-fun lt!213257 () ListLongMap!7579)

(assert (=> b!470063 (= lt!213257 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213265 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213266 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213266 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213258 () Unit!13767)

(assert (=> b!470063 (= lt!213258 (addStillContains!289 lt!213257 lt!213265 zeroValue!794 lt!213266))))

(assert (=> b!470063 (contains!2538 (+!1712 lt!213257 (tuple2!8667 lt!213265 zeroValue!794)) lt!213266)))

(declare-fun lt!213256 () Unit!13767)

(assert (=> b!470063 (= lt!213256 lt!213258)))

(declare-fun lt!213261 () ListLongMap!7579)

(assert (=> b!470063 (= lt!213261 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213254 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213262 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213262 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213263 () Unit!13767)

(assert (=> b!470063 (= lt!213263 (addApplyDifferent!289 lt!213261 lt!213254 minValueBefore!38 lt!213262))))

(assert (=> b!470063 (= (apply!327 (+!1712 lt!213261 (tuple2!8667 lt!213254 minValueBefore!38)) lt!213262) (apply!327 lt!213261 lt!213262))))

(declare-fun lt!213267 () Unit!13767)

(assert (=> b!470063 (= lt!213267 lt!213263)))

(declare-fun lt!213264 () ListLongMap!7579)

(assert (=> b!470063 (= lt!213264 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213270 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213269 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213269 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213260 () Unit!13767)

(assert (=> b!470063 (= lt!213260 (addApplyDifferent!289 lt!213264 lt!213270 zeroValue!794 lt!213269))))

(assert (=> b!470063 (= (apply!327 (+!1712 lt!213264 (tuple2!8667 lt!213270 zeroValue!794)) lt!213269) (apply!327 lt!213264 lt!213269))))

(declare-fun lt!213255 () Unit!13767)

(assert (=> b!470063 (= lt!213255 lt!213260)))

(declare-fun lt!213252 () ListLongMap!7579)

(assert (=> b!470063 (= lt!213252 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213253 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213253 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!213268 () (_ BitVec 64))

(assert (=> b!470063 (= lt!213268 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470063 (= lt!213271 (addApplyDifferent!289 lt!213252 lt!213253 minValueBefore!38 lt!213268))))

(assert (=> b!470063 (= (apply!327 (+!1712 lt!213252 (tuple2!8667 lt!213253 minValueBefore!38)) lt!213268) (apply!327 lt!213252 lt!213268))))

(declare-fun b!470064 () Bool)

(declare-fun Unit!13772 () Unit!13767)

(assert (=> b!470064 (= e!275337 Unit!13772)))

(declare-fun call!30423 () ListLongMap!7579)

(declare-fun bm!30415 () Bool)

(assert (=> bm!30415 (= call!30423 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470065 () Bool)

(declare-fun res!280898 () Bool)

(declare-fun e!275345 () Bool)

(assert (=> b!470065 (=> (not res!280898) (not e!275345))))

(declare-fun e!275343 () Bool)

(assert (=> b!470065 (= res!280898 e!275343)))

(declare-fun res!280901 () Bool)

(assert (=> b!470065 (=> res!280901 e!275343)))

(declare-fun e!275344 () Bool)

(assert (=> b!470065 (= res!280901 (not e!275344))))

(declare-fun res!280900 () Bool)

(assert (=> b!470065 (=> (not res!280900) (not e!275344))))

(assert (=> b!470065 (= res!280900 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470066 () Bool)

(declare-fun e!275339 () Bool)

(assert (=> b!470066 (= e!275339 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75331 () Bool)

(assert (=> d!75331 e!275345))

(declare-fun res!280906 () Bool)

(assert (=> d!75331 (=> (not res!280906) (not e!275345))))

(assert (=> d!75331 (= res!280906 (or (bvsge #b00000000000000000000000000000000 (size!14733 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))))

(declare-fun lt!213272 () ListLongMap!7579)

(declare-fun lt!213259 () ListLongMap!7579)

(assert (=> d!75331 (= lt!213272 lt!213259)))

(declare-fun lt!213273 () Unit!13767)

(assert (=> d!75331 (= lt!213273 e!275337)))

(declare-fun c!56922 () Bool)

(assert (=> d!75331 (= c!56922 e!275339)))

(declare-fun res!280904 () Bool)

(assert (=> d!75331 (=> (not res!280904) (not e!275339))))

(assert (=> d!75331 (= res!280904 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun e!275338 () ListLongMap!7579)

(assert (=> d!75331 (= lt!213259 e!275338)))

(declare-fun c!56919 () Bool)

(assert (=> d!75331 (= c!56919 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75331 (validMask!0 mask!1365)))

(assert (=> d!75331 (= (getCurrentListMap!2226 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213272)))

(declare-fun b!470067 () Bool)

(declare-fun e!275346 () ListLongMap!7579)

(declare-fun call!30422 () ListLongMap!7579)

(assert (=> b!470067 (= e!275346 call!30422)))

(declare-fun b!470068 () Bool)

(declare-fun e!275340 () Bool)

(assert (=> b!470068 (= e!275342 e!275340)))

(declare-fun res!280899 () Bool)

(assert (=> b!470068 (= res!280899 call!30420)))

(assert (=> b!470068 (=> (not res!280899) (not e!275340))))

(declare-fun e!275335 () Bool)

(declare-fun b!470069 () Bool)

(assert (=> b!470069 (= e!275335 (= (apply!327 lt!213272 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)) (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!470069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14734 _values!833)))))

(assert (=> b!470069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470070 () Bool)

(declare-fun e!275341 () Bool)

(assert (=> b!470070 (= e!275341 (= (apply!327 lt!213272 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!470071 () Bool)

(assert (=> b!470071 (= e!275338 e!275346)))

(declare-fun c!56920 () Bool)

(assert (=> b!470071 (= c!56920 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!30419 () ListLongMap!7579)

(declare-fun call!30421 () ListLongMap!7579)

(declare-fun bm!30416 () Bool)

(declare-fun call!30424 () ListLongMap!7579)

(assert (=> bm!30416 (= call!30419 (+!1712 (ite c!56919 call!30423 (ite c!56920 call!30424 call!30421)) (ite (or c!56919 c!56920) (tuple2!8667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!470072 () Bool)

(declare-fun res!280903 () Bool)

(assert (=> b!470072 (=> (not res!280903) (not e!275345))))

(assert (=> b!470072 (= res!280903 e!275342)))

(declare-fun c!56918 () Bool)

(assert (=> b!470072 (= c!56918 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30417 () Bool)

(assert (=> bm!30417 (= call!30420 (contains!2538 lt!213272 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30418 () Bool)

(assert (=> bm!30418 (= call!30422 call!30419)))

(declare-fun b!470073 () Bool)

(assert (=> b!470073 (= e!275344 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470074 () Bool)

(assert (=> b!470074 (= e!275336 e!275341)))

(declare-fun res!280905 () Bool)

(assert (=> b!470074 (= res!280905 call!30418)))

(assert (=> b!470074 (=> (not res!280905) (not e!275341))))

(declare-fun b!470075 () Bool)

(assert (=> b!470075 (= e!275345 e!275336)))

(declare-fun c!56921 () Bool)

(assert (=> b!470075 (= c!56921 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!470076 () Bool)

(declare-fun e!275347 () ListLongMap!7579)

(assert (=> b!470076 (= e!275347 call!30422)))

(declare-fun bm!30419 () Bool)

(assert (=> bm!30419 (= call!30424 call!30423)))

(declare-fun bm!30420 () Bool)

(assert (=> bm!30420 (= call!30418 (contains!2538 lt!213272 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!470077 () Bool)

(declare-fun c!56923 () Bool)

(assert (=> b!470077 (= c!56923 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!470077 (= e!275346 e!275347)))

(declare-fun b!470078 () Bool)

(assert (=> b!470078 (= e!275340 (= (apply!327 lt!213272 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun bm!30421 () Bool)

(assert (=> bm!30421 (= call!30421 call!30424)))

(declare-fun b!470079 () Bool)

(assert (=> b!470079 (= e!275347 call!30421)))

(declare-fun b!470080 () Bool)

(assert (=> b!470080 (= e!275343 e!275335)))

(declare-fun res!280902 () Bool)

(assert (=> b!470080 (=> (not res!280902) (not e!275335))))

(assert (=> b!470080 (= res!280902 (contains!2538 lt!213272 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470080 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470081 () Bool)

(assert (=> b!470081 (= e!275338 (+!1712 call!30419 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75331 c!56919) b!470081))

(assert (= (and d!75331 (not c!56919)) b!470071))

(assert (= (and b!470071 c!56920) b!470067))

(assert (= (and b!470071 (not c!56920)) b!470077))

(assert (= (and b!470077 c!56923) b!470076))

(assert (= (and b!470077 (not c!56923)) b!470079))

(assert (= (or b!470076 b!470079) bm!30421))

(assert (= (or b!470067 bm!30421) bm!30419))

(assert (= (or b!470067 b!470076) bm!30418))

(assert (= (or b!470081 bm!30419) bm!30415))

(assert (= (or b!470081 bm!30418) bm!30416))

(assert (= (and d!75331 res!280904) b!470066))

(assert (= (and d!75331 c!56922) b!470063))

(assert (= (and d!75331 (not c!56922)) b!470064))

(assert (= (and d!75331 res!280906) b!470065))

(assert (= (and b!470065 res!280900) b!470073))

(assert (= (and b!470065 (not res!280901)) b!470080))

(assert (= (and b!470080 res!280902) b!470069))

(assert (= (and b!470065 res!280898) b!470072))

(assert (= (and b!470072 c!56918) b!470068))

(assert (= (and b!470072 (not c!56918)) b!470062))

(assert (= (and b!470068 res!280899) b!470078))

(assert (= (or b!470068 b!470062) bm!30417))

(assert (= (and b!470072 res!280903) b!470075))

(assert (= (and b!470075 c!56921) b!470074))

(assert (= (and b!470075 (not c!56921)) b!470061))

(assert (= (and b!470074 res!280905) b!470070))

(assert (= (or b!470074 b!470061) bm!30420))

(declare-fun b_lambda!10115 () Bool)

(assert (=> (not b_lambda!10115) (not b!470069)))

(assert (=> b!470069 t!14708))

(declare-fun b_and!20059 () Bool)

(assert (= b_and!20057 (and (=> t!14708 result!7415) b_and!20059)))

(declare-fun m!452367 () Bool)

(assert (=> bm!30416 m!452367))

(declare-fun m!452369 () Bool)

(assert (=> b!470070 m!452369))

(declare-fun m!452371 () Bool)

(assert (=> bm!30420 m!452371))

(assert (=> b!470073 m!452301))

(assert (=> b!470073 m!452301))

(assert (=> b!470073 m!452305))

(assert (=> b!470080 m!452301))

(assert (=> b!470080 m!452301))

(declare-fun m!452373 () Bool)

(assert (=> b!470080 m!452373))

(declare-fun m!452375 () Bool)

(assert (=> b!470063 m!452375))

(declare-fun m!452377 () Bool)

(assert (=> b!470063 m!452377))

(declare-fun m!452379 () Bool)

(assert (=> b!470063 m!452379))

(declare-fun m!452381 () Bool)

(assert (=> b!470063 m!452381))

(declare-fun m!452383 () Bool)

(assert (=> b!470063 m!452383))

(declare-fun m!452385 () Bool)

(assert (=> b!470063 m!452385))

(declare-fun m!452387 () Bool)

(assert (=> b!470063 m!452387))

(declare-fun m!452389 () Bool)

(assert (=> b!470063 m!452389))

(declare-fun m!452391 () Bool)

(assert (=> b!470063 m!452391))

(declare-fun m!452393 () Bool)

(assert (=> b!470063 m!452393))

(assert (=> b!470063 m!452381))

(declare-fun m!452395 () Bool)

(assert (=> b!470063 m!452395))

(assert (=> b!470063 m!452375))

(assert (=> b!470063 m!452269))

(assert (=> b!470063 m!452301))

(declare-fun m!452397 () Bool)

(assert (=> b!470063 m!452397))

(declare-fun m!452399 () Bool)

(assert (=> b!470063 m!452399))

(assert (=> b!470063 m!452389))

(assert (=> b!470063 m!452379))

(declare-fun m!452401 () Bool)

(assert (=> b!470063 m!452401))

(declare-fun m!452403 () Bool)

(assert (=> b!470063 m!452403))

(declare-fun m!452405 () Bool)

(assert (=> b!470078 m!452405))

(assert (=> bm!30415 m!452269))

(declare-fun m!452407 () Bool)

(assert (=> b!470081 m!452407))

(assert (=> d!75331 m!452245))

(declare-fun m!452409 () Bool)

(assert (=> bm!30417 m!452409))

(assert (=> b!470066 m!452301))

(assert (=> b!470066 m!452301))

(assert (=> b!470066 m!452305))

(assert (=> b!470069 m!452353))

(assert (=> b!470069 m!452355))

(assert (=> b!470069 m!452357))

(assert (=> b!470069 m!452301))

(declare-fun m!452411 () Bool)

(assert (=> b!470069 m!452411))

(assert (=> b!470069 m!452353))

(assert (=> b!470069 m!452355))

(assert (=> b!470069 m!452301))

(assert (=> b!469954 d!75331))

(declare-fun d!75333 () Bool)

(declare-fun e!275350 () Bool)

(assert (=> d!75333 e!275350))

(declare-fun res!280912 () Bool)

(assert (=> d!75333 (=> (not res!280912) (not e!275350))))

(declare-fun lt!213282 () ListLongMap!7579)

(assert (=> d!75333 (= res!280912 (contains!2538 lt!213282 (_1!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!213285 () List!8743)

(assert (=> d!75333 (= lt!213282 (ListLongMap!7580 lt!213285))))

(declare-fun lt!213283 () Unit!13767)

(declare-fun lt!213284 () Unit!13767)

(assert (=> d!75333 (= lt!213283 lt!213284)))

(declare-datatypes ((Option!385 0))(
  ( (Some!384 (v!8872 V!18533)) (None!383) )
))
(declare-fun getValueByKey!379 (List!8743 (_ BitVec 64)) Option!385)

(assert (=> d!75333 (= (getValueByKey!379 lt!213285 (_1!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!384 (_2!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lemmaContainsTupThenGetReturnValue!201 (List!8743 (_ BitVec 64) V!18533) Unit!13767)

(assert (=> d!75333 (= lt!213284 (lemmaContainsTupThenGetReturnValue!201 lt!213285 (_1!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun insertStrictlySorted!204 (List!8743 (_ BitVec 64) V!18533) List!8743)

(assert (=> d!75333 (= lt!213285 (insertStrictlySorted!204 (toList!3805 lt!213159) (_1!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75333 (= (+!1712 lt!213159 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213282)))

(declare-fun b!470086 () Bool)

(declare-fun res!280911 () Bool)

(assert (=> b!470086 (=> (not res!280911) (not e!275350))))

(assert (=> b!470086 (= res!280911 (= (getValueByKey!379 (toList!3805 lt!213282) (_1!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!384 (_2!4344 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!470087 () Bool)

(declare-fun contains!2539 (List!8743 tuple2!8666) Bool)

(assert (=> b!470087 (= e!275350 (contains!2539 (toList!3805 lt!213282) (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75333 res!280912) b!470086))

(assert (= (and b!470086 res!280911) b!470087))

(declare-fun m!452413 () Bool)

(assert (=> d!75333 m!452413))

(declare-fun m!452415 () Bool)

(assert (=> d!75333 m!452415))

(declare-fun m!452417 () Bool)

(assert (=> d!75333 m!452417))

(declare-fun m!452419 () Bool)

(assert (=> d!75333 m!452419))

(declare-fun m!452421 () Bool)

(assert (=> b!470086 m!452421))

(declare-fun m!452423 () Bool)

(assert (=> b!470087 m!452423))

(assert (=> b!469954 d!75333))

(declare-fun d!75335 () Bool)

(declare-fun e!275351 () Bool)

(assert (=> d!75335 e!275351))

(declare-fun res!280914 () Bool)

(assert (=> d!75335 (=> (not res!280914) (not e!275351))))

(declare-fun lt!213286 () ListLongMap!7579)

(assert (=> d!75335 (= res!280914 (contains!2538 lt!213286 (_1!4344 lt!213161)))))

(declare-fun lt!213289 () List!8743)

(assert (=> d!75335 (= lt!213286 (ListLongMap!7580 lt!213289))))

(declare-fun lt!213287 () Unit!13767)

(declare-fun lt!213288 () Unit!13767)

(assert (=> d!75335 (= lt!213287 lt!213288)))

(assert (=> d!75335 (= (getValueByKey!379 lt!213289 (_1!4344 lt!213161)) (Some!384 (_2!4344 lt!213161)))))

(assert (=> d!75335 (= lt!213288 (lemmaContainsTupThenGetReturnValue!201 lt!213289 (_1!4344 lt!213161) (_2!4344 lt!213161)))))

(assert (=> d!75335 (= lt!213289 (insertStrictlySorted!204 (toList!3805 lt!213159) (_1!4344 lt!213161) (_2!4344 lt!213161)))))

(assert (=> d!75335 (= (+!1712 lt!213159 lt!213161) lt!213286)))

(declare-fun b!470088 () Bool)

(declare-fun res!280913 () Bool)

(assert (=> b!470088 (=> (not res!280913) (not e!275351))))

(assert (=> b!470088 (= res!280913 (= (getValueByKey!379 (toList!3805 lt!213286) (_1!4344 lt!213161)) (Some!384 (_2!4344 lt!213161))))))

(declare-fun b!470089 () Bool)

(assert (=> b!470089 (= e!275351 (contains!2539 (toList!3805 lt!213286) lt!213161))))

(assert (= (and d!75335 res!280914) b!470088))

(assert (= (and b!470088 res!280913) b!470089))

(declare-fun m!452425 () Bool)

(assert (=> d!75335 m!452425))

(declare-fun m!452427 () Bool)

(assert (=> d!75335 m!452427))

(declare-fun m!452429 () Bool)

(assert (=> d!75335 m!452429))

(declare-fun m!452431 () Bool)

(assert (=> d!75335 m!452431))

(declare-fun m!452433 () Bool)

(assert (=> b!470088 m!452433))

(declare-fun m!452435 () Bool)

(assert (=> b!470089 m!452435))

(assert (=> b!469954 d!75335))

(declare-fun d!75337 () Bool)

(declare-fun e!275352 () Bool)

(assert (=> d!75337 e!275352))

(declare-fun res!280916 () Bool)

(assert (=> d!75337 (=> (not res!280916) (not e!275352))))

(declare-fun lt!213290 () ListLongMap!7579)

(assert (=> d!75337 (= res!280916 (contains!2538 lt!213290 (_1!4344 lt!213161)))))

(declare-fun lt!213293 () List!8743)

(assert (=> d!75337 (= lt!213290 (ListLongMap!7580 lt!213293))))

(declare-fun lt!213291 () Unit!13767)

(declare-fun lt!213292 () Unit!13767)

(assert (=> d!75337 (= lt!213291 lt!213292)))

(assert (=> d!75337 (= (getValueByKey!379 lt!213293 (_1!4344 lt!213161)) (Some!384 (_2!4344 lt!213161)))))

(assert (=> d!75337 (= lt!213292 (lemmaContainsTupThenGetReturnValue!201 lt!213293 (_1!4344 lt!213161) (_2!4344 lt!213161)))))

(assert (=> d!75337 (= lt!213293 (insertStrictlySorted!204 (toList!3805 (+!1712 lt!213159 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4344 lt!213161) (_2!4344 lt!213161)))))

(assert (=> d!75337 (= (+!1712 (+!1712 lt!213159 (tuple2!8667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213161) lt!213290)))

(declare-fun b!470090 () Bool)

(declare-fun res!280915 () Bool)

(assert (=> b!470090 (=> (not res!280915) (not e!275352))))

(assert (=> b!470090 (= res!280915 (= (getValueByKey!379 (toList!3805 lt!213290) (_1!4344 lt!213161)) (Some!384 (_2!4344 lt!213161))))))

(declare-fun b!470091 () Bool)

(assert (=> b!470091 (= e!275352 (contains!2539 (toList!3805 lt!213290) lt!213161))))

(assert (= (and d!75337 res!280916) b!470090))

(assert (= (and b!470090 res!280915) b!470091))

(declare-fun m!452437 () Bool)

(assert (=> d!75337 m!452437))

(declare-fun m!452439 () Bool)

(assert (=> d!75337 m!452439))

(declare-fun m!452441 () Bool)

(assert (=> d!75337 m!452441))

(declare-fun m!452443 () Bool)

(assert (=> d!75337 m!452443))

(declare-fun m!452445 () Bool)

(assert (=> b!470090 m!452445))

(declare-fun m!452447 () Bool)

(assert (=> b!470091 m!452447))

(assert (=> b!469954 d!75337))

(declare-fun d!75339 () Bool)

(assert (=> d!75339 (= (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213296 () Unit!13767)

(declare-fun choose!1346 (array!29913 array!29915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18533 V!18533 V!18533 V!18533 (_ BitVec 32) Int) Unit!13767)

(assert (=> d!75339 (= lt!213296 (choose!1346 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75339 (validMask!0 mask!1365)))

(assert (=> d!75339 (= (lemmaNoChangeToArrayThenSameMapNoExtras!149 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213296)))

(declare-fun bs!14892 () Bool)

(assert (= bs!14892 d!75339))

(assert (=> bs!14892 m!452269))

(assert (=> bs!14892 m!452267))

(declare-fun m!452449 () Bool)

(assert (=> bs!14892 m!452449))

(assert (=> bs!14892 m!452245))

(assert (=> b!469949 d!75339))

(declare-fun b!470116 () Bool)

(declare-fun res!280925 () Bool)

(declare-fun e!275368 () Bool)

(assert (=> b!470116 (=> (not res!280925) (not e!275368))))

(declare-fun lt!213315 () ListLongMap!7579)

(assert (=> b!470116 (= res!280925 (not (contains!2538 lt!213315 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!470117 () Bool)

(declare-fun e!275370 () Bool)

(assert (=> b!470117 (= e!275368 e!275370)))

(declare-fun c!56935 () Bool)

(declare-fun e!275371 () Bool)

(assert (=> b!470117 (= c!56935 e!275371)))

(declare-fun res!280926 () Bool)

(assert (=> b!470117 (=> (not res!280926) (not e!275371))))

(assert (=> b!470117 (= res!280926 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun e!275372 () Bool)

(declare-fun b!470118 () Bool)

(assert (=> b!470118 (= e!275372 (= lt!213315 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!470119 () Bool)

(declare-fun e!275369 () Bool)

(assert (=> b!470119 (= e!275370 e!275369)))

(assert (=> b!470119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun res!280927 () Bool)

(assert (=> b!470119 (= res!280927 (contains!2538 lt!213315 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470119 (=> (not res!280927) (not e!275369))))

(declare-fun call!30427 () ListLongMap!7579)

(declare-fun bm!30424 () Bool)

(assert (=> bm!30424 (= call!30427 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!470120 () Bool)

(declare-fun e!275373 () ListLongMap!7579)

(declare-fun e!275367 () ListLongMap!7579)

(assert (=> b!470120 (= e!275373 e!275367)))

(declare-fun c!56933 () Bool)

(assert (=> b!470120 (= c!56933 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470121 () Bool)

(assert (=> b!470121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(assert (=> b!470121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14734 _values!833)))))

(assert (=> b!470121 (= e!275369 (= (apply!327 lt!213315 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)) (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!75341 () Bool)

(assert (=> d!75341 e!275368))

(declare-fun res!280928 () Bool)

(assert (=> d!75341 (=> (not res!280928) (not e!275368))))

(assert (=> d!75341 (= res!280928 (not (contains!2538 lt!213315 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75341 (= lt!213315 e!275373)))

(declare-fun c!56934 () Bool)

(assert (=> d!75341 (= c!56934 (bvsge #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(assert (=> d!75341 (validMask!0 mask!1365)))

(assert (=> d!75341 (= (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213315)))

(declare-fun b!470122 () Bool)

(assert (=> b!470122 (= e!275367 call!30427)))

(declare-fun b!470123 () Bool)

(assert (=> b!470123 (= e!275370 e!275372)))

(declare-fun c!56932 () Bool)

(assert (=> b!470123 (= c!56932 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470124 () Bool)

(assert (=> b!470124 (= e!275371 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470124 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470125 () Bool)

(declare-fun isEmpty!574 (ListLongMap!7579) Bool)

(assert (=> b!470125 (= e!275372 (isEmpty!574 lt!213315))))

(declare-fun b!470126 () Bool)

(declare-fun lt!213314 () Unit!13767)

(declare-fun lt!213311 () Unit!13767)

(assert (=> b!470126 (= lt!213314 lt!213311)))

(declare-fun lt!213316 () V!18533)

(declare-fun lt!213317 () (_ BitVec 64))

(declare-fun lt!213312 () (_ BitVec 64))

(declare-fun lt!213313 () ListLongMap!7579)

(assert (=> b!470126 (not (contains!2538 (+!1712 lt!213313 (tuple2!8667 lt!213312 lt!213316)) lt!213317))))

(declare-fun addStillNotContains!160 (ListLongMap!7579 (_ BitVec 64) V!18533 (_ BitVec 64)) Unit!13767)

(assert (=> b!470126 (= lt!213311 (addStillNotContains!160 lt!213313 lt!213312 lt!213316 lt!213317))))

(assert (=> b!470126 (= lt!213317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470126 (= lt!213316 (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470126 (= lt!213312 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470126 (= lt!213313 call!30427)))

(assert (=> b!470126 (= e!275367 (+!1712 call!30427 (tuple2!8667 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000) (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!470127 () Bool)

(assert (=> b!470127 (= e!275373 (ListLongMap!7580 Nil!8740))))

(assert (= (and d!75341 c!56934) b!470127))

(assert (= (and d!75341 (not c!56934)) b!470120))

(assert (= (and b!470120 c!56933) b!470126))

(assert (= (and b!470120 (not c!56933)) b!470122))

(assert (= (or b!470126 b!470122) bm!30424))

(assert (= (and d!75341 res!280928) b!470116))

(assert (= (and b!470116 res!280925) b!470117))

(assert (= (and b!470117 res!280926) b!470124))

(assert (= (and b!470117 c!56935) b!470119))

(assert (= (and b!470117 (not c!56935)) b!470123))

(assert (= (and b!470119 res!280927) b!470121))

(assert (= (and b!470123 c!56932) b!470118))

(assert (= (and b!470123 (not c!56932)) b!470125))

(declare-fun b_lambda!10117 () Bool)

(assert (=> (not b_lambda!10117) (not b!470121)))

(assert (=> b!470121 t!14708))

(declare-fun b_and!20061 () Bool)

(assert (= b_and!20059 (and (=> t!14708 result!7415) b_and!20061)))

(declare-fun b_lambda!10119 () Bool)

(assert (=> (not b_lambda!10119) (not b!470126)))

(assert (=> b!470126 t!14708))

(declare-fun b_and!20063 () Bool)

(assert (= b_and!20061 (and (=> t!14708 result!7415) b_and!20063)))

(declare-fun m!452451 () Bool)

(assert (=> bm!30424 m!452451))

(assert (=> b!470124 m!452301))

(assert (=> b!470124 m!452301))

(assert (=> b!470124 m!452305))

(declare-fun m!452453 () Bool)

(assert (=> b!470126 m!452453))

(assert (=> b!470126 m!452353))

(assert (=> b!470126 m!452355))

(assert (=> b!470126 m!452357))

(assert (=> b!470126 m!452301))

(declare-fun m!452455 () Bool)

(assert (=> b!470126 m!452455))

(assert (=> b!470126 m!452353))

(declare-fun m!452457 () Bool)

(assert (=> b!470126 m!452457))

(assert (=> b!470126 m!452355))

(assert (=> b!470126 m!452457))

(declare-fun m!452459 () Bool)

(assert (=> b!470126 m!452459))

(assert (=> b!470118 m!452451))

(declare-fun m!452461 () Bool)

(assert (=> b!470116 m!452461))

(assert (=> b!470119 m!452301))

(assert (=> b!470119 m!452301))

(declare-fun m!452463 () Bool)

(assert (=> b!470119 m!452463))

(assert (=> b!470121 m!452353))

(assert (=> b!470121 m!452355))

(assert (=> b!470121 m!452357))

(assert (=> b!470121 m!452301))

(assert (=> b!470121 m!452353))

(assert (=> b!470121 m!452301))

(declare-fun m!452465 () Bool)

(assert (=> b!470121 m!452465))

(assert (=> b!470121 m!452355))

(assert (=> b!470120 m!452301))

(assert (=> b!470120 m!452301))

(assert (=> b!470120 m!452305))

(declare-fun m!452467 () Bool)

(assert (=> b!470125 m!452467))

(declare-fun m!452469 () Bool)

(assert (=> d!75341 m!452469))

(assert (=> d!75341 m!452245))

(assert (=> b!469949 d!75341))

(declare-fun b!470128 () Bool)

(declare-fun res!280929 () Bool)

(declare-fun e!275375 () Bool)

(assert (=> b!470128 (=> (not res!280929) (not e!275375))))

(declare-fun lt!213322 () ListLongMap!7579)

(assert (=> b!470128 (= res!280929 (not (contains!2538 lt!213322 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!470129 () Bool)

(declare-fun e!275377 () Bool)

(assert (=> b!470129 (= e!275375 e!275377)))

(declare-fun c!56939 () Bool)

(declare-fun e!275378 () Bool)

(assert (=> b!470129 (= c!56939 e!275378)))

(declare-fun res!280930 () Bool)

(assert (=> b!470129 (=> (not res!280930) (not e!275378))))

(assert (=> b!470129 (= res!280930 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun e!275379 () Bool)

(declare-fun b!470130 () Bool)

(assert (=> b!470130 (= e!275379 (= lt!213322 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!470131 () Bool)

(declare-fun e!275376 () Bool)

(assert (=> b!470131 (= e!275377 e!275376)))

(assert (=> b!470131 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun res!280931 () Bool)

(assert (=> b!470131 (= res!280931 (contains!2538 lt!213322 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470131 (=> (not res!280931) (not e!275376))))

(declare-fun call!30428 () ListLongMap!7579)

(declare-fun bm!30425 () Bool)

(assert (=> bm!30425 (= call!30428 (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!470132 () Bool)

(declare-fun e!275380 () ListLongMap!7579)

(declare-fun e!275374 () ListLongMap!7579)

(assert (=> b!470132 (= e!275380 e!275374)))

(declare-fun c!56937 () Bool)

(assert (=> b!470132 (= c!56937 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470133 () Bool)

(assert (=> b!470133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(assert (=> b!470133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14734 _values!833)))))

(assert (=> b!470133 (= e!275376 (= (apply!327 lt!213322 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)) (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!75343 () Bool)

(assert (=> d!75343 e!275375))

(declare-fun res!280932 () Bool)

(assert (=> d!75343 (=> (not res!280932) (not e!275375))))

(assert (=> d!75343 (= res!280932 (not (contains!2538 lt!213322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75343 (= lt!213322 e!275380)))

(declare-fun c!56938 () Bool)

(assert (=> d!75343 (= c!56938 (bvsge #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(assert (=> d!75343 (validMask!0 mask!1365)))

(assert (=> d!75343 (= (getCurrentListMapNoExtraKeys!1969 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213322)))

(declare-fun b!470134 () Bool)

(assert (=> b!470134 (= e!275374 call!30428)))

(declare-fun b!470135 () Bool)

(assert (=> b!470135 (= e!275377 e!275379)))

(declare-fun c!56936 () Bool)

(assert (=> b!470135 (= c!56936 (bvslt #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(declare-fun b!470136 () Bool)

(assert (=> b!470136 (= e!275378 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470136 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470137 () Bool)

(assert (=> b!470137 (= e!275379 (isEmpty!574 lt!213322))))

(declare-fun b!470138 () Bool)

(declare-fun lt!213321 () Unit!13767)

(declare-fun lt!213318 () Unit!13767)

(assert (=> b!470138 (= lt!213321 lt!213318)))

(declare-fun lt!213323 () V!18533)

(declare-fun lt!213319 () (_ BitVec 64))

(declare-fun lt!213324 () (_ BitVec 64))

(declare-fun lt!213320 () ListLongMap!7579)

(assert (=> b!470138 (not (contains!2538 (+!1712 lt!213320 (tuple2!8667 lt!213319 lt!213323)) lt!213324))))

(assert (=> b!470138 (= lt!213318 (addStillNotContains!160 lt!213320 lt!213319 lt!213323 lt!213324))))

(assert (=> b!470138 (= lt!213324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470138 (= lt!213323 (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470138 (= lt!213319 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!470138 (= lt!213320 call!30428)))

(assert (=> b!470138 (= e!275374 (+!1712 call!30428 (tuple2!8667 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000) (get!7020 (select (arr!14382 _values!833) #b00000000000000000000000000000000) (dynLambda!920 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!470139 () Bool)

(assert (=> b!470139 (= e!275380 (ListLongMap!7580 Nil!8740))))

(assert (= (and d!75343 c!56938) b!470139))

(assert (= (and d!75343 (not c!56938)) b!470132))

(assert (= (and b!470132 c!56937) b!470138))

(assert (= (and b!470132 (not c!56937)) b!470134))

(assert (= (or b!470138 b!470134) bm!30425))

(assert (= (and d!75343 res!280932) b!470128))

(assert (= (and b!470128 res!280929) b!470129))

(assert (= (and b!470129 res!280930) b!470136))

(assert (= (and b!470129 c!56939) b!470131))

(assert (= (and b!470129 (not c!56939)) b!470135))

(assert (= (and b!470131 res!280931) b!470133))

(assert (= (and b!470135 c!56936) b!470130))

(assert (= (and b!470135 (not c!56936)) b!470137))

(declare-fun b_lambda!10121 () Bool)

(assert (=> (not b_lambda!10121) (not b!470133)))

(assert (=> b!470133 t!14708))

(declare-fun b_and!20065 () Bool)

(assert (= b_and!20063 (and (=> t!14708 result!7415) b_and!20065)))

(declare-fun b_lambda!10123 () Bool)

(assert (=> (not b_lambda!10123) (not b!470138)))

(assert (=> b!470138 t!14708))

(declare-fun b_and!20067 () Bool)

(assert (= b_and!20065 (and (=> t!14708 result!7415) b_and!20067)))

(declare-fun m!452471 () Bool)

(assert (=> bm!30425 m!452471))

(assert (=> b!470136 m!452301))

(assert (=> b!470136 m!452301))

(assert (=> b!470136 m!452305))

(declare-fun m!452473 () Bool)

(assert (=> b!470138 m!452473))

(assert (=> b!470138 m!452353))

(assert (=> b!470138 m!452355))

(assert (=> b!470138 m!452357))

(assert (=> b!470138 m!452301))

(declare-fun m!452475 () Bool)

(assert (=> b!470138 m!452475))

(assert (=> b!470138 m!452353))

(declare-fun m!452477 () Bool)

(assert (=> b!470138 m!452477))

(assert (=> b!470138 m!452355))

(assert (=> b!470138 m!452477))

(declare-fun m!452479 () Bool)

(assert (=> b!470138 m!452479))

(assert (=> b!470130 m!452471))

(declare-fun m!452481 () Bool)

(assert (=> b!470128 m!452481))

(assert (=> b!470131 m!452301))

(assert (=> b!470131 m!452301))

(declare-fun m!452483 () Bool)

(assert (=> b!470131 m!452483))

(assert (=> b!470133 m!452353))

(assert (=> b!470133 m!452355))

(assert (=> b!470133 m!452357))

(assert (=> b!470133 m!452301))

(assert (=> b!470133 m!452353))

(assert (=> b!470133 m!452301))

(declare-fun m!452485 () Bool)

(assert (=> b!470133 m!452485))

(assert (=> b!470133 m!452355))

(assert (=> b!470132 m!452301))

(assert (=> b!470132 m!452301))

(assert (=> b!470132 m!452305))

(declare-fun m!452487 () Bool)

(assert (=> b!470137 m!452487))

(declare-fun m!452489 () Bool)

(assert (=> d!75343 m!452489))

(assert (=> d!75343 m!452245))

(assert (=> b!469949 d!75343))

(declare-fun b!470148 () Bool)

(declare-fun e!275389 () Bool)

(declare-fun e!275388 () Bool)

(assert (=> b!470148 (= e!275389 e!275388)))

(declare-fun lt!213333 () (_ BitVec 64))

(assert (=> b!470148 (= lt!213333 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213332 () Unit!13767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29913 (_ BitVec 64) (_ BitVec 32)) Unit!13767)

(assert (=> b!470148 (= lt!213332 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213333 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!470148 (arrayContainsKey!0 _keys!1025 lt!213333 #b00000000000000000000000000000000)))

(declare-fun lt!213331 () Unit!13767)

(assert (=> b!470148 (= lt!213331 lt!213332)))

(declare-fun res!280938 () Bool)

(declare-datatypes ((SeekEntryResult!3551 0))(
  ( (MissingZero!3551 (index!16383 (_ BitVec 32))) (Found!3551 (index!16384 (_ BitVec 32))) (Intermediate!3551 (undefined!4363 Bool) (index!16385 (_ BitVec 32)) (x!44004 (_ BitVec 32))) (Undefined!3551) (MissingVacant!3551 (index!16386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29913 (_ BitVec 32)) SeekEntryResult!3551)

(assert (=> b!470148 (= res!280938 (= (seekEntryOrOpen!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3551 #b00000000000000000000000000000000)))))

(assert (=> b!470148 (=> (not res!280938) (not e!275388))))

(declare-fun b!470149 () Bool)

(declare-fun e!275387 () Bool)

(assert (=> b!470149 (= e!275387 e!275389)))

(declare-fun c!56942 () Bool)

(assert (=> b!470149 (= c!56942 (validKeyInArray!0 (select (arr!14381 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!75345 () Bool)

(declare-fun res!280937 () Bool)

(assert (=> d!75345 (=> res!280937 e!275387)))

(assert (=> d!75345 (= res!280937 (bvsge #b00000000000000000000000000000000 (size!14733 _keys!1025)))))

(assert (=> d!75345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!275387)))

(declare-fun b!470150 () Bool)

(declare-fun call!30431 () Bool)

(assert (=> b!470150 (= e!275389 call!30431)))

(declare-fun b!470151 () Bool)

(assert (=> b!470151 (= e!275388 call!30431)))

(declare-fun bm!30428 () Bool)

(assert (=> bm!30428 (= call!30431 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(assert (= (and d!75345 (not res!280937)) b!470149))

(assert (= (and b!470149 c!56942) b!470148))

(assert (= (and b!470149 (not c!56942)) b!470150))

(assert (= (and b!470148 res!280938) b!470151))

(assert (= (or b!470151 b!470150) bm!30428))

(assert (=> b!470148 m!452301))

(declare-fun m!452491 () Bool)

(assert (=> b!470148 m!452491))

(declare-fun m!452493 () Bool)

(assert (=> b!470148 m!452493))

(assert (=> b!470148 m!452301))

(declare-fun m!452495 () Bool)

(assert (=> b!470148 m!452495))

(assert (=> b!470149 m!452301))

(assert (=> b!470149 m!452301))

(assert (=> b!470149 m!452305))

(declare-fun m!452497 () Bool)

(assert (=> bm!30428 m!452497))

(assert (=> b!469951 d!75345))

(declare-fun b!470159 () Bool)

(declare-fun e!275394 () Bool)

(assert (=> b!470159 (= e!275394 tp_is_empty!13071)))

(declare-fun b!470158 () Bool)

(declare-fun e!275395 () Bool)

(assert (=> b!470158 (= e!275395 tp_is_empty!13071)))

(declare-fun mapIsEmpty!21310 () Bool)

(declare-fun mapRes!21310 () Bool)

(assert (=> mapIsEmpty!21310 mapRes!21310))

(declare-fun mapNonEmpty!21310 () Bool)

(declare-fun tp!40957 () Bool)

(assert (=> mapNonEmpty!21310 (= mapRes!21310 (and tp!40957 e!275395))))

(declare-fun mapKey!21310 () (_ BitVec 32))

(declare-fun mapValue!21310 () ValueCell!6192)

(declare-fun mapRest!21310 () (Array (_ BitVec 32) ValueCell!6192))

(assert (=> mapNonEmpty!21310 (= mapRest!21304 (store mapRest!21310 mapKey!21310 mapValue!21310))))

(declare-fun condMapEmpty!21310 () Bool)

(declare-fun mapDefault!21310 () ValueCell!6192)

(assert (=> mapNonEmpty!21304 (= condMapEmpty!21310 (= mapRest!21304 ((as const (Array (_ BitVec 32) ValueCell!6192)) mapDefault!21310)))))

(assert (=> mapNonEmpty!21304 (= tp!40947 (and e!275394 mapRes!21310))))

(assert (= (and mapNonEmpty!21304 condMapEmpty!21310) mapIsEmpty!21310))

(assert (= (and mapNonEmpty!21304 (not condMapEmpty!21310)) mapNonEmpty!21310))

(assert (= (and mapNonEmpty!21310 ((_ is ValueCellFull!6192) mapValue!21310)) b!470158))

(assert (= (and mapNonEmpty!21304 ((_ is ValueCellFull!6192) mapDefault!21310)) b!470159))

(declare-fun m!452499 () Bool)

(assert (=> mapNonEmpty!21310 m!452499))

(declare-fun b_lambda!10125 () Bool)

(assert (= b_lambda!10123 (or (and start!42090 b_free!11643) b_lambda!10125)))

(declare-fun b_lambda!10127 () Bool)

(assert (= b_lambda!10113 (or (and start!42090 b_free!11643) b_lambda!10127)))

(declare-fun b_lambda!10129 () Bool)

(assert (= b_lambda!10115 (or (and start!42090 b_free!11643) b_lambda!10129)))

(declare-fun b_lambda!10131 () Bool)

(assert (= b_lambda!10121 (or (and start!42090 b_free!11643) b_lambda!10131)))

(declare-fun b_lambda!10133 () Bool)

(assert (= b_lambda!10119 (or (and start!42090 b_free!11643) b_lambda!10133)))

(declare-fun b_lambda!10135 () Bool)

(assert (= b_lambda!10117 (or (and start!42090 b_free!11643) b_lambda!10135)))

(check-sat (not b_lambda!10127) (not d!75341) (not b!470080) (not b!469992) (not b!470050) (not b!470091) (not b!470043) (not b!470133) (not b!470136) (not b!470055) (not bm!30415) (not b!470088) (not b!470073) (not b_lambda!10129) (not d!75335) (not b!470120) (not b!470149) (not b!470137) (not bm!30410) (not b!470121) (not bm!30416) (not b!470047) (not b!470148) (not b!470118) (not b_lambda!10133) (not d!75329) tp_is_empty!13071 (not b!470058) (not bm!30428) (not b!469993) (not b!470125) (not b!470130) b_and!20067 (not d!75339) (not b!470081) (not b!470063) (not b_lambda!10135) (not bm!30417) (not b_lambda!10125) (not b!470128) (not b!470069) (not b!470078) (not b!470116) (not d!75333) (not bm!30420) (not d!75337) (not b!470089) (not bm!30413) (not b_next!11643) (not bm!30409) (not b!469995) (not b!470057) (not b!470087) (not b!470124) (not b!470086) (not bm!30425) (not b!470040) (not bm!30393) (not mapNonEmpty!21310) (not b!470138) (not d!75343) (not b!470066) (not bm!30408) (not bm!30424) (not b!470126) (not b!470119) (not b!470090) (not d!75327) (not d!75331) (not b!470131) (not b!470046) (not b!470132) (not b!470070) (not b_lambda!10131))
(check-sat b_and!20067 (not b_next!11643))
