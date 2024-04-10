; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71106 () Bool)

(assert start!71106)

(declare-fun b_free!13293 () Bool)

(declare-fun b_next!13293 () Bool)

(assert (=> start!71106 (= b_free!13293 (not b_next!13293))))

(declare-fun tp!46636 () Bool)

(declare-fun b_and!22207 () Bool)

(assert (=> start!71106 (= tp!46636 b_and!22207)))

(declare-fun b!825863 () Bool)

(declare-fun e!459775 () Bool)

(declare-fun e!459780 () Bool)

(assert (=> b!825863 (= e!459775 e!459780)))

(declare-fun res!563001 () Bool)

(assert (=> b!825863 (=> res!563001 e!459780)))

(declare-datatypes ((V!25005 0))(
  ( (V!25006 (val!7549 Int)) )
))
(declare-datatypes ((tuple2!9998 0))(
  ( (tuple2!9999 (_1!5010 (_ BitVec 64)) (_2!5010 V!25005)) )
))
(declare-fun lt!373258 () tuple2!9998)

(declare-datatypes ((List!15798 0))(
  ( (Nil!15795) (Cons!15794 (h!16923 tuple2!9998) (t!22143 List!15798)) )
))
(declare-datatypes ((ListLongMap!8821 0))(
  ( (ListLongMap!8822 (toList!4426 List!15798)) )
))
(declare-fun lt!373265 () ListLongMap!8821)

(declare-fun lt!373260 () ListLongMap!8821)

(declare-fun lt!373255 () tuple2!9998)

(declare-fun +!1933 (ListLongMap!8821 tuple2!9998) ListLongMap!8821)

(assert (=> b!825863 (= res!563001 (not (= lt!373260 (+!1933 (+!1933 lt!373265 lt!373255) lt!373258))))))

(declare-fun lt!373266 () ListLongMap!8821)

(declare-fun lt!373261 () ListLongMap!8821)

(assert (=> b!825863 (and (= lt!373266 lt!373261) (= lt!373260 lt!373261) (= lt!373260 lt!373266))))

(declare-fun lt!373262 () ListLongMap!8821)

(assert (=> b!825863 (= lt!373261 (+!1933 lt!373262 lt!373255))))

(declare-fun lt!373264 () ListLongMap!8821)

(assert (=> b!825863 (= lt!373266 (+!1933 lt!373264 lt!373255))))

(declare-fun zeroValueAfter!34 () V!25005)

(declare-datatypes ((Unit!28313 0))(
  ( (Unit!28314) )
))
(declare-fun lt!373263 () Unit!28313)

(declare-fun zeroValueBefore!34 () V!25005)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!216 (ListLongMap!8821 (_ BitVec 64) V!25005 V!25005) Unit!28313)

(assert (=> b!825863 (= lt!373263 (addSameAsAddTwiceSameKeyDiffValues!216 lt!373264 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459777 () Bool)

(assert (=> b!825863 e!459777))

(declare-fun res!562997 () Bool)

(assert (=> b!825863 (=> (not res!562997) (not e!459777))))

(declare-fun lt!373254 () ListLongMap!8821)

(assert (=> b!825863 (= res!562997 (= lt!373254 lt!373262))))

(declare-fun lt!373256 () tuple2!9998)

(assert (=> b!825863 (= lt!373262 (+!1933 lt!373264 lt!373256))))

(assert (=> b!825863 (= lt!373264 (+!1933 lt!373265 lt!373258))))

(assert (=> b!825863 (= lt!373255 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459778 () Bool)

(assert (=> b!825863 e!459778))

(declare-fun res!562996 () Bool)

(assert (=> b!825863 (=> (not res!562996) (not e!459778))))

(assert (=> b!825863 (= res!562996 (= lt!373254 (+!1933 (+!1933 lt!373265 lt!373256) lt!373258)))))

(declare-fun minValue!754 () V!25005)

(assert (=> b!825863 (= lt!373258 (tuple2!9999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825863 (= lt!373256 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46188 0))(
  ( (array!46189 (arr!22140 (Array (_ BitVec 32) (_ BitVec 64))) (size!22561 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46188)

(declare-datatypes ((ValueCell!7086 0))(
  ( (ValueCellFull!7086 (v!9982 V!25005)) (EmptyCell!7086) )
))
(declare-datatypes ((array!46190 0))(
  ( (array!46191 (arr!22141 (Array (_ BitVec 32) ValueCell!7086)) (size!22562 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46190)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2556 (array!46188 array!46190 (_ BitVec 32) (_ BitVec 32) V!25005 V!25005 (_ BitVec 32) Int) ListLongMap!8821)

(assert (=> b!825863 (= lt!373260 (getCurrentListMap!2556 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825863 (= lt!373254 (getCurrentListMap!2556 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825864 () Bool)

(declare-fun res!562998 () Bool)

(declare-fun e!459776 () Bool)

(assert (=> b!825864 (=> (not res!562998) (not e!459776))))

(declare-datatypes ((List!15799 0))(
  ( (Nil!15796) (Cons!15795 (h!16924 (_ BitVec 64)) (t!22144 List!15799)) )
))
(declare-fun arrayNoDuplicates!0 (array!46188 (_ BitVec 32) List!15799) Bool)

(assert (=> b!825864 (= res!562998 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15796))))

(declare-fun b!825865 () Bool)

(declare-fun e!459782 () Bool)

(declare-fun tp_is_empty!15003 () Bool)

(assert (=> b!825865 (= e!459782 tp_is_empty!15003)))

(declare-fun mapNonEmpty!24127 () Bool)

(declare-fun mapRes!24127 () Bool)

(declare-fun tp!46635 () Bool)

(declare-fun e!459779 () Bool)

(assert (=> mapNonEmpty!24127 (= mapRes!24127 (and tp!46635 e!459779))))

(declare-fun mapKey!24127 () (_ BitVec 32))

(declare-fun mapRest!24127 () (Array (_ BitVec 32) ValueCell!7086))

(declare-fun mapValue!24127 () ValueCell!7086)

(assert (=> mapNonEmpty!24127 (= (arr!22141 _values!788) (store mapRest!24127 mapKey!24127 mapValue!24127))))

(declare-fun b!825866 () Bool)

(assert (=> b!825866 (= e!459779 tp_is_empty!15003)))

(declare-fun b!825867 () Bool)

(declare-fun res!562999 () Bool)

(assert (=> b!825867 (=> (not res!562999) (not e!459776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46188 (_ BitVec 32)) Bool)

(assert (=> b!825867 (= res!562999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825868 () Bool)

(declare-fun lt!373259 () ListLongMap!8821)

(assert (=> b!825868 (= e!459777 (= lt!373260 (+!1933 (+!1933 lt!373259 lt!373258) lt!373255)))))

(declare-fun b!825869 () Bool)

(assert (=> b!825869 (= e!459776 (not e!459775))))

(declare-fun res!562995 () Bool)

(assert (=> b!825869 (=> res!562995 e!459775)))

(assert (=> b!825869 (= res!562995 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825869 (= lt!373265 lt!373259)))

(declare-fun lt!373257 () Unit!28313)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!545 (array!46188 array!46190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25005 V!25005 V!25005 V!25005 (_ BitVec 32) Int) Unit!28313)

(assert (=> b!825869 (= lt!373257 (lemmaNoChangeToArrayThenSameMapNoExtras!545 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2435 (array!46188 array!46190 (_ BitVec 32) (_ BitVec 32) V!25005 V!25005 (_ BitVec 32) Int) ListLongMap!8821)

(assert (=> b!825869 (= lt!373259 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825869 (= lt!373265 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825870 () Bool)

(assert (=> b!825870 (= e!459780 (bvsle #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun res!563000 () Bool)

(assert (=> start!71106 (=> (not res!563000) (not e!459776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71106 (= res!563000 (validMask!0 mask!1312))))

(assert (=> start!71106 e!459776))

(assert (=> start!71106 tp_is_empty!15003))

(declare-fun array_inv!17649 (array!46188) Bool)

(assert (=> start!71106 (array_inv!17649 _keys!976)))

(assert (=> start!71106 true))

(declare-fun e!459781 () Bool)

(declare-fun array_inv!17650 (array!46190) Bool)

(assert (=> start!71106 (and (array_inv!17650 _values!788) e!459781)))

(assert (=> start!71106 tp!46636))

(declare-fun b!825871 () Bool)

(assert (=> b!825871 (= e!459781 (and e!459782 mapRes!24127))))

(declare-fun condMapEmpty!24127 () Bool)

(declare-fun mapDefault!24127 () ValueCell!7086)

(assert (=> b!825871 (= condMapEmpty!24127 (= (arr!22141 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7086)) mapDefault!24127)))))

(declare-fun b!825872 () Bool)

(assert (=> b!825872 (= e!459778 (= lt!373260 (+!1933 (+!1933 lt!373259 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373258)))))

(declare-fun b!825873 () Bool)

(declare-fun res!563002 () Bool)

(assert (=> b!825873 (=> (not res!563002) (not e!459776))))

(assert (=> b!825873 (= res!563002 (and (= (size!22562 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22561 _keys!976) (size!22562 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24127 () Bool)

(assert (=> mapIsEmpty!24127 mapRes!24127))

(assert (= (and start!71106 res!563000) b!825873))

(assert (= (and b!825873 res!563002) b!825867))

(assert (= (and b!825867 res!562999) b!825864))

(assert (= (and b!825864 res!562998) b!825869))

(assert (= (and b!825869 (not res!562995)) b!825863))

(assert (= (and b!825863 res!562996) b!825872))

(assert (= (and b!825863 res!562997) b!825868))

(assert (= (and b!825863 (not res!563001)) b!825870))

(assert (= (and b!825871 condMapEmpty!24127) mapIsEmpty!24127))

(assert (= (and b!825871 (not condMapEmpty!24127)) mapNonEmpty!24127))

(get-info :version)

(assert (= (and mapNonEmpty!24127 ((_ is ValueCellFull!7086) mapValue!24127)) b!825866))

(assert (= (and b!825871 ((_ is ValueCellFull!7086) mapDefault!24127)) b!825865))

(assert (= start!71106 b!825871))

(declare-fun m!768269 () Bool)

(assert (=> b!825863 m!768269))

(declare-fun m!768271 () Bool)

(assert (=> b!825863 m!768271))

(declare-fun m!768273 () Bool)

(assert (=> b!825863 m!768273))

(declare-fun m!768275 () Bool)

(assert (=> b!825863 m!768275))

(declare-fun m!768277 () Bool)

(assert (=> b!825863 m!768277))

(assert (=> b!825863 m!768269))

(declare-fun m!768279 () Bool)

(assert (=> b!825863 m!768279))

(assert (=> b!825863 m!768271))

(declare-fun m!768281 () Bool)

(assert (=> b!825863 m!768281))

(declare-fun m!768283 () Bool)

(assert (=> b!825863 m!768283))

(declare-fun m!768285 () Bool)

(assert (=> b!825863 m!768285))

(declare-fun m!768287 () Bool)

(assert (=> b!825863 m!768287))

(declare-fun m!768289 () Bool)

(assert (=> b!825863 m!768289))

(declare-fun m!768291 () Bool)

(assert (=> b!825868 m!768291))

(assert (=> b!825868 m!768291))

(declare-fun m!768293 () Bool)

(assert (=> b!825868 m!768293))

(declare-fun m!768295 () Bool)

(assert (=> b!825872 m!768295))

(assert (=> b!825872 m!768295))

(declare-fun m!768297 () Bool)

(assert (=> b!825872 m!768297))

(declare-fun m!768299 () Bool)

(assert (=> b!825864 m!768299))

(declare-fun m!768301 () Bool)

(assert (=> start!71106 m!768301))

(declare-fun m!768303 () Bool)

(assert (=> start!71106 m!768303))

(declare-fun m!768305 () Bool)

(assert (=> start!71106 m!768305))

(declare-fun m!768307 () Bool)

(assert (=> b!825869 m!768307))

(declare-fun m!768309 () Bool)

(assert (=> b!825869 m!768309))

(declare-fun m!768311 () Bool)

(assert (=> b!825869 m!768311))

(declare-fun m!768313 () Bool)

(assert (=> mapNonEmpty!24127 m!768313))

(declare-fun m!768315 () Bool)

(assert (=> b!825867 m!768315))

(check-sat b_and!22207 tp_is_empty!15003 (not b!825863) (not b!825872) (not b!825864) (not b!825869) (not b!825868) (not b_next!13293) (not b!825867) (not mapNonEmpty!24127) (not start!71106))
(check-sat b_and!22207 (not b_next!13293))
(get-model)

(declare-fun d!104995 () Bool)

(declare-fun res!563031 () Bool)

(declare-fun e!459819 () Bool)

(assert (=> d!104995 (=> res!563031 e!459819)))

(assert (=> d!104995 (= res!563031 (bvsge #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> d!104995 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!459819)))

(declare-fun b!825915 () Bool)

(declare-fun e!459818 () Bool)

(assert (=> b!825915 (= e!459819 e!459818)))

(declare-fun c!89433 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!825915 (= c!89433 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825916 () Bool)

(declare-fun e!459817 () Bool)

(declare-fun call!35873 () Bool)

(assert (=> b!825916 (= e!459817 call!35873)))

(declare-fun bm!35870 () Bool)

(assert (=> bm!35870 (= call!35873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!825917 () Bool)

(assert (=> b!825917 (= e!459818 call!35873)))

(declare-fun b!825918 () Bool)

(assert (=> b!825918 (= e!459818 e!459817)))

(declare-fun lt!373312 () (_ BitVec 64))

(assert (=> b!825918 (= lt!373312 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373313 () Unit!28313)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46188 (_ BitVec 64) (_ BitVec 32)) Unit!28313)

(assert (=> b!825918 (= lt!373313 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!373312 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!825918 (arrayContainsKey!0 _keys!976 lt!373312 #b00000000000000000000000000000000)))

(declare-fun lt!373314 () Unit!28313)

(assert (=> b!825918 (= lt!373314 lt!373313)))

(declare-fun res!563032 () Bool)

(declare-datatypes ((SeekEntryResult!8734 0))(
  ( (MissingZero!8734 (index!37307 (_ BitVec 32))) (Found!8734 (index!37308 (_ BitVec 32))) (Intermediate!8734 (undefined!9546 Bool) (index!37309 (_ BitVec 32)) (x!69717 (_ BitVec 32))) (Undefined!8734) (MissingVacant!8734 (index!37310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46188 (_ BitVec 32)) SeekEntryResult!8734)

(assert (=> b!825918 (= res!563032 (= (seekEntryOrOpen!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8734 #b00000000000000000000000000000000)))))

(assert (=> b!825918 (=> (not res!563032) (not e!459817))))

(assert (= (and d!104995 (not res!563031)) b!825915))

(assert (= (and b!825915 c!89433) b!825918))

(assert (= (and b!825915 (not c!89433)) b!825917))

(assert (= (and b!825918 res!563032) b!825916))

(assert (= (or b!825916 b!825917) bm!35870))

(declare-fun m!768365 () Bool)

(assert (=> b!825915 m!768365))

(assert (=> b!825915 m!768365))

(declare-fun m!768367 () Bool)

(assert (=> b!825915 m!768367))

(declare-fun m!768369 () Bool)

(assert (=> bm!35870 m!768369))

(assert (=> b!825918 m!768365))

(declare-fun m!768371 () Bool)

(assert (=> b!825918 m!768371))

(declare-fun m!768373 () Bool)

(assert (=> b!825918 m!768373))

(assert (=> b!825918 m!768365))

(declare-fun m!768375 () Bool)

(assert (=> b!825918 m!768375))

(assert (=> b!825867 d!104995))

(declare-fun d!104997 () Bool)

(declare-fun e!459822 () Bool)

(assert (=> d!104997 e!459822))

(declare-fun res!563037 () Bool)

(assert (=> d!104997 (=> (not res!563037) (not e!459822))))

(declare-fun lt!373324 () ListLongMap!8821)

(declare-fun contains!4179 (ListLongMap!8821 (_ BitVec 64)) Bool)

(assert (=> d!104997 (= res!563037 (contains!4179 lt!373324 (_1!5010 lt!373258)))))

(declare-fun lt!373326 () List!15798)

(assert (=> d!104997 (= lt!373324 (ListLongMap!8822 lt!373326))))

(declare-fun lt!373325 () Unit!28313)

(declare-fun lt!373323 () Unit!28313)

(assert (=> d!104997 (= lt!373325 lt!373323)))

(declare-datatypes ((Option!412 0))(
  ( (Some!411 (v!9984 V!25005)) (None!410) )
))
(declare-fun getValueByKey!406 (List!15798 (_ BitVec 64)) Option!412)

(assert (=> d!104997 (= (getValueByKey!406 lt!373326 (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258)))))

(declare-fun lemmaContainsTupThenGetReturnValue!220 (List!15798 (_ BitVec 64) V!25005) Unit!28313)

(assert (=> d!104997 (= lt!373323 (lemmaContainsTupThenGetReturnValue!220 lt!373326 (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(declare-fun insertStrictlySorted!259 (List!15798 (_ BitVec 64) V!25005) List!15798)

(assert (=> d!104997 (= lt!373326 (insertStrictlySorted!259 (toList!4426 (+!1933 lt!373265 lt!373256)) (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!104997 (= (+!1933 (+!1933 lt!373265 lt!373256) lt!373258) lt!373324)))

(declare-fun b!825923 () Bool)

(declare-fun res!563038 () Bool)

(assert (=> b!825923 (=> (not res!563038) (not e!459822))))

(assert (=> b!825923 (= res!563038 (= (getValueByKey!406 (toList!4426 lt!373324) (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258))))))

(declare-fun b!825924 () Bool)

(declare-fun contains!4180 (List!15798 tuple2!9998) Bool)

(assert (=> b!825924 (= e!459822 (contains!4180 (toList!4426 lt!373324) lt!373258))))

(assert (= (and d!104997 res!563037) b!825923))

(assert (= (and b!825923 res!563038) b!825924))

(declare-fun m!768377 () Bool)

(assert (=> d!104997 m!768377))

(declare-fun m!768379 () Bool)

(assert (=> d!104997 m!768379))

(declare-fun m!768381 () Bool)

(assert (=> d!104997 m!768381))

(declare-fun m!768383 () Bool)

(assert (=> d!104997 m!768383))

(declare-fun m!768385 () Bool)

(assert (=> b!825923 m!768385))

(declare-fun m!768387 () Bool)

(assert (=> b!825924 m!768387))

(assert (=> b!825863 d!104997))

(declare-fun b!825967 () Bool)

(declare-fun e!459860 () ListLongMap!8821)

(declare-fun e!459861 () ListLongMap!8821)

(assert (=> b!825967 (= e!459860 e!459861)))

(declare-fun c!89447 () Bool)

(assert (=> b!825967 (= c!89447 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35885 () Bool)

(declare-fun call!35891 () ListLongMap!8821)

(declare-fun call!35889 () ListLongMap!8821)

(assert (=> bm!35885 (= call!35891 call!35889)))

(declare-fun bm!35886 () Bool)

(declare-fun call!35890 () ListLongMap!8821)

(assert (=> bm!35886 (= call!35889 call!35890)))

(declare-fun b!825968 () Bool)

(declare-fun e!459856 () ListLongMap!8821)

(declare-fun call!35893 () ListLongMap!8821)

(assert (=> b!825968 (= e!459856 call!35893)))

(declare-fun b!825969 () Bool)

(declare-fun c!89450 () Bool)

(assert (=> b!825969 (= c!89450 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825969 (= e!459861 e!459856)))

(declare-fun b!825970 () Bool)

(declare-fun e!459858 () Bool)

(declare-fun call!35894 () Bool)

(assert (=> b!825970 (= e!459858 (not call!35894))))

(declare-fun b!825971 () Bool)

(declare-fun e!459854 () Unit!28313)

(declare-fun Unit!28317 () Unit!28313)

(assert (=> b!825971 (= e!459854 Unit!28317)))

(declare-fun b!825973 () Bool)

(assert (=> b!825973 (= e!459861 call!35893)))

(declare-fun bm!35887 () Bool)

(declare-fun call!35892 () Bool)

(declare-fun lt!373379 () ListLongMap!8821)

(assert (=> bm!35887 (= call!35892 (contains!4179 lt!373379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825974 () Bool)

(declare-fun e!459852 () Bool)

(assert (=> b!825974 (= e!459852 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825975 () Bool)

(declare-fun e!459851 () Bool)

(assert (=> b!825975 (= e!459851 (not call!35892))))

(declare-fun b!825976 () Bool)

(declare-fun e!459857 () Bool)

(assert (=> b!825976 (= e!459851 e!459857)))

(declare-fun res!563057 () Bool)

(assert (=> b!825976 (= res!563057 call!35892)))

(assert (=> b!825976 (=> (not res!563057) (not e!459857))))

(declare-fun b!825977 () Bool)

(declare-fun e!459859 () Bool)

(declare-fun e!459849 () Bool)

(assert (=> b!825977 (= e!459859 e!459849)))

(declare-fun res!563059 () Bool)

(assert (=> b!825977 (=> (not res!563059) (not e!459849))))

(assert (=> b!825977 (= res!563059 (contains!4179 lt!373379 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!825977 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun b!825978 () Bool)

(declare-fun e!459853 () Bool)

(declare-fun apply!362 (ListLongMap!8821 (_ BitVec 64)) V!25005)

(assert (=> b!825978 (= e!459853 (= (apply!362 lt!373379 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!825979 () Bool)

(assert (=> b!825979 (= e!459857 (= (apply!362 lt!373379 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!825980 () Bool)

(declare-fun e!459855 () Bool)

(assert (=> b!825980 (= e!459855 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35888 () Bool)

(assert (=> bm!35888 (= call!35894 (contains!4179 lt!373379 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825981 () Bool)

(declare-fun res!563060 () Bool)

(declare-fun e!459850 () Bool)

(assert (=> b!825981 (=> (not res!563060) (not e!459850))))

(assert (=> b!825981 (= res!563060 e!459851)))

(declare-fun c!89448 () Bool)

(assert (=> b!825981 (= c!89448 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35889 () Bool)

(declare-fun c!89449 () Bool)

(declare-fun call!35888 () ListLongMap!8821)

(assert (=> bm!35889 (= call!35888 (+!1933 (ite c!89449 call!35890 (ite c!89447 call!35889 call!35891)) (ite (or c!89449 c!89447) (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!825972 () Bool)

(assert (=> b!825972 (= e!459858 e!459853)))

(declare-fun res!563061 () Bool)

(assert (=> b!825972 (= res!563061 call!35894)))

(assert (=> b!825972 (=> (not res!563061) (not e!459853))))

(declare-fun d!104999 () Bool)

(assert (=> d!104999 e!459850))

(declare-fun res!563063 () Bool)

(assert (=> d!104999 (=> (not res!563063) (not e!459850))))

(assert (=> d!104999 (= res!563063 (or (bvsge #b00000000000000000000000000000000 (size!22561 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))))

(declare-fun lt!373385 () ListLongMap!8821)

(assert (=> d!104999 (= lt!373379 lt!373385)))

(declare-fun lt!373378 () Unit!28313)

(assert (=> d!104999 (= lt!373378 e!459854)))

(declare-fun c!89451 () Bool)

(assert (=> d!104999 (= c!89451 e!459855)))

(declare-fun res!563058 () Bool)

(assert (=> d!104999 (=> (not res!563058) (not e!459855))))

(assert (=> d!104999 (= res!563058 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> d!104999 (= lt!373385 e!459860)))

(assert (=> d!104999 (= c!89449 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104999 (validMask!0 mask!1312)))

(assert (=> d!104999 (= (getCurrentListMap!2556 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373379)))

(declare-fun b!825982 () Bool)

(declare-fun res!563065 () Bool)

(assert (=> b!825982 (=> (not res!563065) (not e!459850))))

(assert (=> b!825982 (= res!563065 e!459859)))

(declare-fun res!563062 () Bool)

(assert (=> b!825982 (=> res!563062 e!459859)))

(assert (=> b!825982 (= res!563062 (not e!459852))))

(declare-fun res!563064 () Bool)

(assert (=> b!825982 (=> (not res!563064) (not e!459852))))

(assert (=> b!825982 (= res!563064 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun b!825983 () Bool)

(declare-fun lt!373388 () Unit!28313)

(assert (=> b!825983 (= e!459854 lt!373388)))

(declare-fun lt!373376 () ListLongMap!8821)

(assert (=> b!825983 (= lt!373376 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373384 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373383 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373383 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373377 () Unit!28313)

(declare-fun addStillContains!314 (ListLongMap!8821 (_ BitVec 64) V!25005 (_ BitVec 64)) Unit!28313)

(assert (=> b!825983 (= lt!373377 (addStillContains!314 lt!373376 lt!373384 zeroValueBefore!34 lt!373383))))

(assert (=> b!825983 (contains!4179 (+!1933 lt!373376 (tuple2!9999 lt!373384 zeroValueBefore!34)) lt!373383)))

(declare-fun lt!373373 () Unit!28313)

(assert (=> b!825983 (= lt!373373 lt!373377)))

(declare-fun lt!373380 () ListLongMap!8821)

(assert (=> b!825983 (= lt!373380 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373390 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373390 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373371 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373371 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373391 () Unit!28313)

(declare-fun addApplyDifferent!314 (ListLongMap!8821 (_ BitVec 64) V!25005 (_ BitVec 64)) Unit!28313)

(assert (=> b!825983 (= lt!373391 (addApplyDifferent!314 lt!373380 lt!373390 minValue!754 lt!373371))))

(assert (=> b!825983 (= (apply!362 (+!1933 lt!373380 (tuple2!9999 lt!373390 minValue!754)) lt!373371) (apply!362 lt!373380 lt!373371))))

(declare-fun lt!373375 () Unit!28313)

(assert (=> b!825983 (= lt!373375 lt!373391)))

(declare-fun lt!373382 () ListLongMap!8821)

(assert (=> b!825983 (= lt!373382 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373389 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373389 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373372 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373372 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373381 () Unit!28313)

(assert (=> b!825983 (= lt!373381 (addApplyDifferent!314 lt!373382 lt!373389 zeroValueBefore!34 lt!373372))))

(assert (=> b!825983 (= (apply!362 (+!1933 lt!373382 (tuple2!9999 lt!373389 zeroValueBefore!34)) lt!373372) (apply!362 lt!373382 lt!373372))))

(declare-fun lt!373392 () Unit!28313)

(assert (=> b!825983 (= lt!373392 lt!373381)))

(declare-fun lt!373387 () ListLongMap!8821)

(assert (=> b!825983 (= lt!373387 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373386 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373386 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373374 () (_ BitVec 64))

(assert (=> b!825983 (= lt!373374 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!825983 (= lt!373388 (addApplyDifferent!314 lt!373387 lt!373386 minValue!754 lt!373374))))

(assert (=> b!825983 (= (apply!362 (+!1933 lt!373387 (tuple2!9999 lt!373386 minValue!754)) lt!373374) (apply!362 lt!373387 lt!373374))))

(declare-fun b!825984 () Bool)

(assert (=> b!825984 (= e!459860 (+!1933 call!35888 (tuple2!9999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!825985 () Bool)

(assert (=> b!825985 (= e!459856 call!35891)))

(declare-fun b!825986 () Bool)

(assert (=> b!825986 (= e!459850 e!459858)))

(declare-fun c!89446 () Bool)

(assert (=> b!825986 (= c!89446 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35890 () Bool)

(assert (=> bm!35890 (= call!35890 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35891 () Bool)

(assert (=> bm!35891 (= call!35893 call!35888)))

(declare-fun b!825987 () Bool)

(declare-fun get!11739 (ValueCell!7086 V!25005) V!25005)

(declare-fun dynLambda!973 (Int (_ BitVec 64)) V!25005)

(assert (=> b!825987 (= e!459849 (= (apply!362 lt!373379 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)) (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!825987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22562 _values!788)))))

(assert (=> b!825987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (= (and d!104999 c!89449) b!825984))

(assert (= (and d!104999 (not c!89449)) b!825967))

(assert (= (and b!825967 c!89447) b!825973))

(assert (= (and b!825967 (not c!89447)) b!825969))

(assert (= (and b!825969 c!89450) b!825968))

(assert (= (and b!825969 (not c!89450)) b!825985))

(assert (= (or b!825968 b!825985) bm!35885))

(assert (= (or b!825973 bm!35885) bm!35886))

(assert (= (or b!825973 b!825968) bm!35891))

(assert (= (or b!825984 bm!35886) bm!35890))

(assert (= (or b!825984 bm!35891) bm!35889))

(assert (= (and d!104999 res!563058) b!825980))

(assert (= (and d!104999 c!89451) b!825983))

(assert (= (and d!104999 (not c!89451)) b!825971))

(assert (= (and d!104999 res!563063) b!825982))

(assert (= (and b!825982 res!563064) b!825974))

(assert (= (and b!825982 (not res!563062)) b!825977))

(assert (= (and b!825977 res!563059) b!825987))

(assert (= (and b!825982 res!563065) b!825981))

(assert (= (and b!825981 c!89448) b!825976))

(assert (= (and b!825981 (not c!89448)) b!825975))

(assert (= (and b!825976 res!563057) b!825979))

(assert (= (or b!825976 b!825975) bm!35887))

(assert (= (and b!825981 res!563060) b!825986))

(assert (= (and b!825986 c!89446) b!825972))

(assert (= (and b!825986 (not c!89446)) b!825970))

(assert (= (and b!825972 res!563061) b!825978))

(assert (= (or b!825972 b!825970) bm!35888))

(declare-fun b_lambda!11115 () Bool)

(assert (=> (not b_lambda!11115) (not b!825987)))

(declare-fun t!22148 () Bool)

(declare-fun tb!4205 () Bool)

(assert (=> (and start!71106 (= defaultEntry!796 defaultEntry!796) t!22148) tb!4205))

(declare-fun result!7955 () Bool)

(assert (=> tb!4205 (= result!7955 tp_is_empty!15003)))

(assert (=> b!825987 t!22148))

(declare-fun b_and!22211 () Bool)

(assert (= b_and!22207 (and (=> t!22148 result!7955) b_and!22211)))

(assert (=> b!825980 m!768365))

(assert (=> b!825980 m!768365))

(assert (=> b!825980 m!768367))

(assert (=> b!825977 m!768365))

(assert (=> b!825977 m!768365))

(declare-fun m!768389 () Bool)

(assert (=> b!825977 m!768389))

(declare-fun m!768391 () Bool)

(assert (=> bm!35889 m!768391))

(assert (=> b!825987 m!768365))

(declare-fun m!768393 () Bool)

(assert (=> b!825987 m!768393))

(declare-fun m!768395 () Bool)

(assert (=> b!825987 m!768395))

(assert (=> b!825987 m!768393))

(declare-fun m!768397 () Bool)

(assert (=> b!825987 m!768397))

(assert (=> b!825987 m!768395))

(assert (=> b!825987 m!768365))

(declare-fun m!768399 () Bool)

(assert (=> b!825987 m!768399))

(assert (=> bm!35890 m!768311))

(assert (=> d!104999 m!768301))

(declare-fun m!768401 () Bool)

(assert (=> b!825978 m!768401))

(declare-fun m!768403 () Bool)

(assert (=> b!825979 m!768403))

(assert (=> b!825974 m!768365))

(assert (=> b!825974 m!768365))

(assert (=> b!825974 m!768367))

(declare-fun m!768405 () Bool)

(assert (=> bm!35887 m!768405))

(declare-fun m!768407 () Bool)

(assert (=> bm!35888 m!768407))

(assert (=> b!825983 m!768365))

(assert (=> b!825983 m!768311))

(declare-fun m!768409 () Bool)

(assert (=> b!825983 m!768409))

(declare-fun m!768411 () Bool)

(assert (=> b!825983 m!768411))

(declare-fun m!768413 () Bool)

(assert (=> b!825983 m!768413))

(declare-fun m!768415 () Bool)

(assert (=> b!825983 m!768415))

(declare-fun m!768417 () Bool)

(assert (=> b!825983 m!768417))

(declare-fun m!768419 () Bool)

(assert (=> b!825983 m!768419))

(declare-fun m!768421 () Bool)

(assert (=> b!825983 m!768421))

(assert (=> b!825983 m!768409))

(declare-fun m!768423 () Bool)

(assert (=> b!825983 m!768423))

(declare-fun m!768425 () Bool)

(assert (=> b!825983 m!768425))

(declare-fun m!768427 () Bool)

(assert (=> b!825983 m!768427))

(assert (=> b!825983 m!768415))

(assert (=> b!825983 m!768425))

(declare-fun m!768429 () Bool)

(assert (=> b!825983 m!768429))

(declare-fun m!768431 () Bool)

(assert (=> b!825983 m!768431))

(declare-fun m!768433 () Bool)

(assert (=> b!825983 m!768433))

(declare-fun m!768435 () Bool)

(assert (=> b!825983 m!768435))

(assert (=> b!825983 m!768435))

(declare-fun m!768437 () Bool)

(assert (=> b!825983 m!768437))

(declare-fun m!768439 () Bool)

(assert (=> b!825984 m!768439))

(assert (=> b!825863 d!104999))

(declare-fun b!825990 () Bool)

(declare-fun e!459873 () ListLongMap!8821)

(declare-fun e!459874 () ListLongMap!8821)

(assert (=> b!825990 (= e!459873 e!459874)))

(declare-fun c!89453 () Bool)

(assert (=> b!825990 (= c!89453 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35892 () Bool)

(declare-fun call!35898 () ListLongMap!8821)

(declare-fun call!35896 () ListLongMap!8821)

(assert (=> bm!35892 (= call!35898 call!35896)))

(declare-fun bm!35893 () Bool)

(declare-fun call!35897 () ListLongMap!8821)

(assert (=> bm!35893 (= call!35896 call!35897)))

(declare-fun b!825991 () Bool)

(declare-fun e!459869 () ListLongMap!8821)

(declare-fun call!35900 () ListLongMap!8821)

(assert (=> b!825991 (= e!459869 call!35900)))

(declare-fun b!825992 () Bool)

(declare-fun c!89456 () Bool)

(assert (=> b!825992 (= c!89456 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825992 (= e!459874 e!459869)))

(declare-fun b!825993 () Bool)

(declare-fun e!459871 () Bool)

(declare-fun call!35901 () Bool)

(assert (=> b!825993 (= e!459871 (not call!35901))))

(declare-fun b!825994 () Bool)

(declare-fun e!459867 () Unit!28313)

(declare-fun Unit!28318 () Unit!28313)

(assert (=> b!825994 (= e!459867 Unit!28318)))

(declare-fun b!825996 () Bool)

(assert (=> b!825996 (= e!459874 call!35900)))

(declare-fun bm!35894 () Bool)

(declare-fun call!35899 () Bool)

(declare-fun lt!373401 () ListLongMap!8821)

(assert (=> bm!35894 (= call!35899 (contains!4179 lt!373401 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!825997 () Bool)

(declare-fun e!459865 () Bool)

(assert (=> b!825997 (= e!459865 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!825998 () Bool)

(declare-fun e!459864 () Bool)

(assert (=> b!825998 (= e!459864 (not call!35899))))

(declare-fun b!825999 () Bool)

(declare-fun e!459870 () Bool)

(assert (=> b!825999 (= e!459864 e!459870)))

(declare-fun res!563066 () Bool)

(assert (=> b!825999 (= res!563066 call!35899)))

(assert (=> b!825999 (=> (not res!563066) (not e!459870))))

(declare-fun b!826000 () Bool)

(declare-fun e!459872 () Bool)

(declare-fun e!459862 () Bool)

(assert (=> b!826000 (= e!459872 e!459862)))

(declare-fun res!563068 () Bool)

(assert (=> b!826000 (=> (not res!563068) (not e!459862))))

(assert (=> b!826000 (= res!563068 (contains!4179 lt!373401 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826000 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun b!826001 () Bool)

(declare-fun e!459866 () Bool)

(assert (=> b!826001 (= e!459866 (= (apply!362 lt!373401 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!826002 () Bool)

(assert (=> b!826002 (= e!459870 (= (apply!362 lt!373401 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!826003 () Bool)

(declare-fun e!459868 () Bool)

(assert (=> b!826003 (= e!459868 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35895 () Bool)

(assert (=> bm!35895 (= call!35901 (contains!4179 lt!373401 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826004 () Bool)

(declare-fun res!563069 () Bool)

(declare-fun e!459863 () Bool)

(assert (=> b!826004 (=> (not res!563069) (not e!459863))))

(assert (=> b!826004 (= res!563069 e!459864)))

(declare-fun c!89454 () Bool)

(assert (=> b!826004 (= c!89454 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!35895 () ListLongMap!8821)

(declare-fun bm!35896 () Bool)

(declare-fun c!89455 () Bool)

(assert (=> bm!35896 (= call!35895 (+!1933 (ite c!89455 call!35897 (ite c!89453 call!35896 call!35898)) (ite (or c!89455 c!89453) (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!825995 () Bool)

(assert (=> b!825995 (= e!459871 e!459866)))

(declare-fun res!563070 () Bool)

(assert (=> b!825995 (= res!563070 call!35901)))

(assert (=> b!825995 (=> (not res!563070) (not e!459866))))

(declare-fun d!105001 () Bool)

(assert (=> d!105001 e!459863))

(declare-fun res!563072 () Bool)

(assert (=> d!105001 (=> (not res!563072) (not e!459863))))

(assert (=> d!105001 (= res!563072 (or (bvsge #b00000000000000000000000000000000 (size!22561 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))))

(declare-fun lt!373407 () ListLongMap!8821)

(assert (=> d!105001 (= lt!373401 lt!373407)))

(declare-fun lt!373400 () Unit!28313)

(assert (=> d!105001 (= lt!373400 e!459867)))

(declare-fun c!89457 () Bool)

(assert (=> d!105001 (= c!89457 e!459868)))

(declare-fun res!563067 () Bool)

(assert (=> d!105001 (=> (not res!563067) (not e!459868))))

(assert (=> d!105001 (= res!563067 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> d!105001 (= lt!373407 e!459873)))

(assert (=> d!105001 (= c!89455 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105001 (validMask!0 mask!1312)))

(assert (=> d!105001 (= (getCurrentListMap!2556 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373401)))

(declare-fun b!826005 () Bool)

(declare-fun res!563074 () Bool)

(assert (=> b!826005 (=> (not res!563074) (not e!459863))))

(assert (=> b!826005 (= res!563074 e!459872)))

(declare-fun res!563071 () Bool)

(assert (=> b!826005 (=> res!563071 e!459872)))

(assert (=> b!826005 (= res!563071 (not e!459865))))

(declare-fun res!563073 () Bool)

(assert (=> b!826005 (=> (not res!563073) (not e!459865))))

(assert (=> b!826005 (= res!563073 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun b!826006 () Bool)

(declare-fun lt!373410 () Unit!28313)

(assert (=> b!826006 (= e!459867 lt!373410)))

(declare-fun lt!373398 () ListLongMap!8821)

(assert (=> b!826006 (= lt!373398 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373406 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373406 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373405 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373405 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373399 () Unit!28313)

(assert (=> b!826006 (= lt!373399 (addStillContains!314 lt!373398 lt!373406 zeroValueAfter!34 lt!373405))))

(assert (=> b!826006 (contains!4179 (+!1933 lt!373398 (tuple2!9999 lt!373406 zeroValueAfter!34)) lt!373405)))

(declare-fun lt!373395 () Unit!28313)

(assert (=> b!826006 (= lt!373395 lt!373399)))

(declare-fun lt!373402 () ListLongMap!8821)

(assert (=> b!826006 (= lt!373402 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373412 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373412 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373393 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373393 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373413 () Unit!28313)

(assert (=> b!826006 (= lt!373413 (addApplyDifferent!314 lt!373402 lt!373412 minValue!754 lt!373393))))

(assert (=> b!826006 (= (apply!362 (+!1933 lt!373402 (tuple2!9999 lt!373412 minValue!754)) lt!373393) (apply!362 lt!373402 lt!373393))))

(declare-fun lt!373397 () Unit!28313)

(assert (=> b!826006 (= lt!373397 lt!373413)))

(declare-fun lt!373404 () ListLongMap!8821)

(assert (=> b!826006 (= lt!373404 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373411 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373394 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373394 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373403 () Unit!28313)

(assert (=> b!826006 (= lt!373403 (addApplyDifferent!314 lt!373404 lt!373411 zeroValueAfter!34 lt!373394))))

(assert (=> b!826006 (= (apply!362 (+!1933 lt!373404 (tuple2!9999 lt!373411 zeroValueAfter!34)) lt!373394) (apply!362 lt!373404 lt!373394))))

(declare-fun lt!373414 () Unit!28313)

(assert (=> b!826006 (= lt!373414 lt!373403)))

(declare-fun lt!373409 () ListLongMap!8821)

(assert (=> b!826006 (= lt!373409 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373408 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373408 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373396 () (_ BitVec 64))

(assert (=> b!826006 (= lt!373396 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826006 (= lt!373410 (addApplyDifferent!314 lt!373409 lt!373408 minValue!754 lt!373396))))

(assert (=> b!826006 (= (apply!362 (+!1933 lt!373409 (tuple2!9999 lt!373408 minValue!754)) lt!373396) (apply!362 lt!373409 lt!373396))))

(declare-fun b!826007 () Bool)

(assert (=> b!826007 (= e!459873 (+!1933 call!35895 (tuple2!9999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!826008 () Bool)

(assert (=> b!826008 (= e!459869 call!35898)))

(declare-fun b!826009 () Bool)

(assert (=> b!826009 (= e!459863 e!459871)))

(declare-fun c!89452 () Bool)

(assert (=> b!826009 (= c!89452 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35897 () Bool)

(assert (=> bm!35897 (= call!35897 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35898 () Bool)

(assert (=> bm!35898 (= call!35900 call!35895)))

(declare-fun b!826010 () Bool)

(assert (=> b!826010 (= e!459862 (= (apply!362 lt!373401 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)) (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!826010 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22562 _values!788)))))

(assert (=> b!826010 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (= (and d!105001 c!89455) b!826007))

(assert (= (and d!105001 (not c!89455)) b!825990))

(assert (= (and b!825990 c!89453) b!825996))

(assert (= (and b!825990 (not c!89453)) b!825992))

(assert (= (and b!825992 c!89456) b!825991))

(assert (= (and b!825992 (not c!89456)) b!826008))

(assert (= (or b!825991 b!826008) bm!35892))

(assert (= (or b!825996 bm!35892) bm!35893))

(assert (= (or b!825996 b!825991) bm!35898))

(assert (= (or b!826007 bm!35893) bm!35897))

(assert (= (or b!826007 bm!35898) bm!35896))

(assert (= (and d!105001 res!563067) b!826003))

(assert (= (and d!105001 c!89457) b!826006))

(assert (= (and d!105001 (not c!89457)) b!825994))

(assert (= (and d!105001 res!563072) b!826005))

(assert (= (and b!826005 res!563073) b!825997))

(assert (= (and b!826005 (not res!563071)) b!826000))

(assert (= (and b!826000 res!563068) b!826010))

(assert (= (and b!826005 res!563074) b!826004))

(assert (= (and b!826004 c!89454) b!825999))

(assert (= (and b!826004 (not c!89454)) b!825998))

(assert (= (and b!825999 res!563066) b!826002))

(assert (= (or b!825999 b!825998) bm!35894))

(assert (= (and b!826004 res!563069) b!826009))

(assert (= (and b!826009 c!89452) b!825995))

(assert (= (and b!826009 (not c!89452)) b!825993))

(assert (= (and b!825995 res!563070) b!826001))

(assert (= (or b!825995 b!825993) bm!35895))

(declare-fun b_lambda!11117 () Bool)

(assert (=> (not b_lambda!11117) (not b!826010)))

(assert (=> b!826010 t!22148))

(declare-fun b_and!22213 () Bool)

(assert (= b_and!22211 (and (=> t!22148 result!7955) b_and!22213)))

(assert (=> b!826003 m!768365))

(assert (=> b!826003 m!768365))

(assert (=> b!826003 m!768367))

(assert (=> b!826000 m!768365))

(assert (=> b!826000 m!768365))

(declare-fun m!768441 () Bool)

(assert (=> b!826000 m!768441))

(declare-fun m!768443 () Bool)

(assert (=> bm!35896 m!768443))

(assert (=> b!826010 m!768365))

(assert (=> b!826010 m!768393))

(assert (=> b!826010 m!768395))

(assert (=> b!826010 m!768393))

(assert (=> b!826010 m!768397))

(assert (=> b!826010 m!768395))

(assert (=> b!826010 m!768365))

(declare-fun m!768445 () Bool)

(assert (=> b!826010 m!768445))

(assert (=> bm!35897 m!768309))

(assert (=> d!105001 m!768301))

(declare-fun m!768447 () Bool)

(assert (=> b!826001 m!768447))

(declare-fun m!768449 () Bool)

(assert (=> b!826002 m!768449))

(assert (=> b!825997 m!768365))

(assert (=> b!825997 m!768365))

(assert (=> b!825997 m!768367))

(declare-fun m!768451 () Bool)

(assert (=> bm!35894 m!768451))

(declare-fun m!768453 () Bool)

(assert (=> bm!35895 m!768453))

(assert (=> b!826006 m!768365))

(assert (=> b!826006 m!768309))

(declare-fun m!768455 () Bool)

(assert (=> b!826006 m!768455))

(declare-fun m!768457 () Bool)

(assert (=> b!826006 m!768457))

(declare-fun m!768459 () Bool)

(assert (=> b!826006 m!768459))

(declare-fun m!768461 () Bool)

(assert (=> b!826006 m!768461))

(declare-fun m!768463 () Bool)

(assert (=> b!826006 m!768463))

(declare-fun m!768465 () Bool)

(assert (=> b!826006 m!768465))

(declare-fun m!768467 () Bool)

(assert (=> b!826006 m!768467))

(assert (=> b!826006 m!768455))

(declare-fun m!768469 () Bool)

(assert (=> b!826006 m!768469))

(declare-fun m!768471 () Bool)

(assert (=> b!826006 m!768471))

(declare-fun m!768473 () Bool)

(assert (=> b!826006 m!768473))

(assert (=> b!826006 m!768461))

(assert (=> b!826006 m!768471))

(declare-fun m!768475 () Bool)

(assert (=> b!826006 m!768475))

(declare-fun m!768477 () Bool)

(assert (=> b!826006 m!768477))

(declare-fun m!768479 () Bool)

(assert (=> b!826006 m!768479))

(declare-fun m!768481 () Bool)

(assert (=> b!826006 m!768481))

(assert (=> b!826006 m!768481))

(declare-fun m!768483 () Bool)

(assert (=> b!826006 m!768483))

(declare-fun m!768485 () Bool)

(assert (=> b!826007 m!768485))

(assert (=> b!825863 d!105001))

(declare-fun d!105003 () Bool)

(declare-fun e!459875 () Bool)

(assert (=> d!105003 e!459875))

(declare-fun res!563075 () Bool)

(assert (=> d!105003 (=> (not res!563075) (not e!459875))))

(declare-fun lt!373416 () ListLongMap!8821)

(assert (=> d!105003 (= res!563075 (contains!4179 lt!373416 (_1!5010 lt!373258)))))

(declare-fun lt!373418 () List!15798)

(assert (=> d!105003 (= lt!373416 (ListLongMap!8822 lt!373418))))

(declare-fun lt!373417 () Unit!28313)

(declare-fun lt!373415 () Unit!28313)

(assert (=> d!105003 (= lt!373417 lt!373415)))

(assert (=> d!105003 (= (getValueByKey!406 lt!373418 (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258)))))

(assert (=> d!105003 (= lt!373415 (lemmaContainsTupThenGetReturnValue!220 lt!373418 (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105003 (= lt!373418 (insertStrictlySorted!259 (toList!4426 lt!373265) (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105003 (= (+!1933 lt!373265 lt!373258) lt!373416)))

(declare-fun b!826011 () Bool)

(declare-fun res!563076 () Bool)

(assert (=> b!826011 (=> (not res!563076) (not e!459875))))

(assert (=> b!826011 (= res!563076 (= (getValueByKey!406 (toList!4426 lt!373416) (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258))))))

(declare-fun b!826012 () Bool)

(assert (=> b!826012 (= e!459875 (contains!4180 (toList!4426 lt!373416) lt!373258))))

(assert (= (and d!105003 res!563075) b!826011))

(assert (= (and b!826011 res!563076) b!826012))

(declare-fun m!768487 () Bool)

(assert (=> d!105003 m!768487))

(declare-fun m!768489 () Bool)

(assert (=> d!105003 m!768489))

(declare-fun m!768491 () Bool)

(assert (=> d!105003 m!768491))

(declare-fun m!768493 () Bool)

(assert (=> d!105003 m!768493))

(declare-fun m!768495 () Bool)

(assert (=> b!826011 m!768495))

(declare-fun m!768497 () Bool)

(assert (=> b!826012 m!768497))

(assert (=> b!825863 d!105003))

(declare-fun d!105005 () Bool)

(declare-fun e!459876 () Bool)

(assert (=> d!105005 e!459876))

(declare-fun res!563077 () Bool)

(assert (=> d!105005 (=> (not res!563077) (not e!459876))))

(declare-fun lt!373420 () ListLongMap!8821)

(assert (=> d!105005 (= res!563077 (contains!4179 lt!373420 (_1!5010 lt!373255)))))

(declare-fun lt!373422 () List!15798)

(assert (=> d!105005 (= lt!373420 (ListLongMap!8822 lt!373422))))

(declare-fun lt!373421 () Unit!28313)

(declare-fun lt!373419 () Unit!28313)

(assert (=> d!105005 (= lt!373421 lt!373419)))

(assert (=> d!105005 (= (getValueByKey!406 lt!373422 (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255)))))

(assert (=> d!105005 (= lt!373419 (lemmaContainsTupThenGetReturnValue!220 lt!373422 (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105005 (= lt!373422 (insertStrictlySorted!259 (toList!4426 lt!373262) (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105005 (= (+!1933 lt!373262 lt!373255) lt!373420)))

(declare-fun b!826013 () Bool)

(declare-fun res!563078 () Bool)

(assert (=> b!826013 (=> (not res!563078) (not e!459876))))

(assert (=> b!826013 (= res!563078 (= (getValueByKey!406 (toList!4426 lt!373420) (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255))))))

(declare-fun b!826014 () Bool)

(assert (=> b!826014 (= e!459876 (contains!4180 (toList!4426 lt!373420) lt!373255))))

(assert (= (and d!105005 res!563077) b!826013))

(assert (= (and b!826013 res!563078) b!826014))

(declare-fun m!768499 () Bool)

(assert (=> d!105005 m!768499))

(declare-fun m!768501 () Bool)

(assert (=> d!105005 m!768501))

(declare-fun m!768503 () Bool)

(assert (=> d!105005 m!768503))

(declare-fun m!768505 () Bool)

(assert (=> d!105005 m!768505))

(declare-fun m!768507 () Bool)

(assert (=> b!826013 m!768507))

(declare-fun m!768509 () Bool)

(assert (=> b!826014 m!768509))

(assert (=> b!825863 d!105005))

(declare-fun d!105007 () Bool)

(declare-fun e!459877 () Bool)

(assert (=> d!105007 e!459877))

(declare-fun res!563079 () Bool)

(assert (=> d!105007 (=> (not res!563079) (not e!459877))))

(declare-fun lt!373424 () ListLongMap!8821)

(assert (=> d!105007 (= res!563079 (contains!4179 lt!373424 (_1!5010 lt!373256)))))

(declare-fun lt!373426 () List!15798)

(assert (=> d!105007 (= lt!373424 (ListLongMap!8822 lt!373426))))

(declare-fun lt!373425 () Unit!28313)

(declare-fun lt!373423 () Unit!28313)

(assert (=> d!105007 (= lt!373425 lt!373423)))

(assert (=> d!105007 (= (getValueByKey!406 lt!373426 (_1!5010 lt!373256)) (Some!411 (_2!5010 lt!373256)))))

(assert (=> d!105007 (= lt!373423 (lemmaContainsTupThenGetReturnValue!220 lt!373426 (_1!5010 lt!373256) (_2!5010 lt!373256)))))

(assert (=> d!105007 (= lt!373426 (insertStrictlySorted!259 (toList!4426 lt!373264) (_1!5010 lt!373256) (_2!5010 lt!373256)))))

(assert (=> d!105007 (= (+!1933 lt!373264 lt!373256) lt!373424)))

(declare-fun b!826015 () Bool)

(declare-fun res!563080 () Bool)

(assert (=> b!826015 (=> (not res!563080) (not e!459877))))

(assert (=> b!826015 (= res!563080 (= (getValueByKey!406 (toList!4426 lt!373424) (_1!5010 lt!373256)) (Some!411 (_2!5010 lt!373256))))))

(declare-fun b!826016 () Bool)

(assert (=> b!826016 (= e!459877 (contains!4180 (toList!4426 lt!373424) lt!373256))))

(assert (= (and d!105007 res!563079) b!826015))

(assert (= (and b!826015 res!563080) b!826016))

(declare-fun m!768511 () Bool)

(assert (=> d!105007 m!768511))

(declare-fun m!768513 () Bool)

(assert (=> d!105007 m!768513))

(declare-fun m!768515 () Bool)

(assert (=> d!105007 m!768515))

(declare-fun m!768517 () Bool)

(assert (=> d!105007 m!768517))

(declare-fun m!768519 () Bool)

(assert (=> b!826015 m!768519))

(declare-fun m!768521 () Bool)

(assert (=> b!826016 m!768521))

(assert (=> b!825863 d!105007))

(declare-fun d!105009 () Bool)

(declare-fun e!459878 () Bool)

(assert (=> d!105009 e!459878))

(declare-fun res!563081 () Bool)

(assert (=> d!105009 (=> (not res!563081) (not e!459878))))

(declare-fun lt!373428 () ListLongMap!8821)

(assert (=> d!105009 (= res!563081 (contains!4179 lt!373428 (_1!5010 lt!373255)))))

(declare-fun lt!373430 () List!15798)

(assert (=> d!105009 (= lt!373428 (ListLongMap!8822 lt!373430))))

(declare-fun lt!373429 () Unit!28313)

(declare-fun lt!373427 () Unit!28313)

(assert (=> d!105009 (= lt!373429 lt!373427)))

(assert (=> d!105009 (= (getValueByKey!406 lt!373430 (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255)))))

(assert (=> d!105009 (= lt!373427 (lemmaContainsTupThenGetReturnValue!220 lt!373430 (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105009 (= lt!373430 (insertStrictlySorted!259 (toList!4426 lt!373264) (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105009 (= (+!1933 lt!373264 lt!373255) lt!373428)))

(declare-fun b!826017 () Bool)

(declare-fun res!563082 () Bool)

(assert (=> b!826017 (=> (not res!563082) (not e!459878))))

(assert (=> b!826017 (= res!563082 (= (getValueByKey!406 (toList!4426 lt!373428) (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255))))))

(declare-fun b!826018 () Bool)

(assert (=> b!826018 (= e!459878 (contains!4180 (toList!4426 lt!373428) lt!373255))))

(assert (= (and d!105009 res!563081) b!826017))

(assert (= (and b!826017 res!563082) b!826018))

(declare-fun m!768523 () Bool)

(assert (=> d!105009 m!768523))

(declare-fun m!768525 () Bool)

(assert (=> d!105009 m!768525))

(declare-fun m!768527 () Bool)

(assert (=> d!105009 m!768527))

(declare-fun m!768529 () Bool)

(assert (=> d!105009 m!768529))

(declare-fun m!768531 () Bool)

(assert (=> b!826017 m!768531))

(declare-fun m!768533 () Bool)

(assert (=> b!826018 m!768533))

(assert (=> b!825863 d!105009))

(declare-fun d!105011 () Bool)

(declare-fun e!459879 () Bool)

(assert (=> d!105011 e!459879))

(declare-fun res!563083 () Bool)

(assert (=> d!105011 (=> (not res!563083) (not e!459879))))

(declare-fun lt!373432 () ListLongMap!8821)

(assert (=> d!105011 (= res!563083 (contains!4179 lt!373432 (_1!5010 lt!373258)))))

(declare-fun lt!373434 () List!15798)

(assert (=> d!105011 (= lt!373432 (ListLongMap!8822 lt!373434))))

(declare-fun lt!373433 () Unit!28313)

(declare-fun lt!373431 () Unit!28313)

(assert (=> d!105011 (= lt!373433 lt!373431)))

(assert (=> d!105011 (= (getValueByKey!406 lt!373434 (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258)))))

(assert (=> d!105011 (= lt!373431 (lemmaContainsTupThenGetReturnValue!220 lt!373434 (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105011 (= lt!373434 (insertStrictlySorted!259 (toList!4426 (+!1933 lt!373265 lt!373255)) (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105011 (= (+!1933 (+!1933 lt!373265 lt!373255) lt!373258) lt!373432)))

(declare-fun b!826019 () Bool)

(declare-fun res!563084 () Bool)

(assert (=> b!826019 (=> (not res!563084) (not e!459879))))

(assert (=> b!826019 (= res!563084 (= (getValueByKey!406 (toList!4426 lt!373432) (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258))))))

(declare-fun b!826020 () Bool)

(assert (=> b!826020 (= e!459879 (contains!4180 (toList!4426 lt!373432) lt!373258))))

(assert (= (and d!105011 res!563083) b!826019))

(assert (= (and b!826019 res!563084) b!826020))

(declare-fun m!768535 () Bool)

(assert (=> d!105011 m!768535))

(declare-fun m!768537 () Bool)

(assert (=> d!105011 m!768537))

(declare-fun m!768539 () Bool)

(assert (=> d!105011 m!768539))

(declare-fun m!768541 () Bool)

(assert (=> d!105011 m!768541))

(declare-fun m!768543 () Bool)

(assert (=> b!826019 m!768543))

(declare-fun m!768545 () Bool)

(assert (=> b!826020 m!768545))

(assert (=> b!825863 d!105011))

(declare-fun d!105013 () Bool)

(declare-fun e!459880 () Bool)

(assert (=> d!105013 e!459880))

(declare-fun res!563085 () Bool)

(assert (=> d!105013 (=> (not res!563085) (not e!459880))))

(declare-fun lt!373436 () ListLongMap!8821)

(assert (=> d!105013 (= res!563085 (contains!4179 lt!373436 (_1!5010 lt!373256)))))

(declare-fun lt!373438 () List!15798)

(assert (=> d!105013 (= lt!373436 (ListLongMap!8822 lt!373438))))

(declare-fun lt!373437 () Unit!28313)

(declare-fun lt!373435 () Unit!28313)

(assert (=> d!105013 (= lt!373437 lt!373435)))

(assert (=> d!105013 (= (getValueByKey!406 lt!373438 (_1!5010 lt!373256)) (Some!411 (_2!5010 lt!373256)))))

(assert (=> d!105013 (= lt!373435 (lemmaContainsTupThenGetReturnValue!220 lt!373438 (_1!5010 lt!373256) (_2!5010 lt!373256)))))

(assert (=> d!105013 (= lt!373438 (insertStrictlySorted!259 (toList!4426 lt!373265) (_1!5010 lt!373256) (_2!5010 lt!373256)))))

(assert (=> d!105013 (= (+!1933 lt!373265 lt!373256) lt!373436)))

(declare-fun b!826021 () Bool)

(declare-fun res!563086 () Bool)

(assert (=> b!826021 (=> (not res!563086) (not e!459880))))

(assert (=> b!826021 (= res!563086 (= (getValueByKey!406 (toList!4426 lt!373436) (_1!5010 lt!373256)) (Some!411 (_2!5010 lt!373256))))))

(declare-fun b!826022 () Bool)

(assert (=> b!826022 (= e!459880 (contains!4180 (toList!4426 lt!373436) lt!373256))))

(assert (= (and d!105013 res!563085) b!826021))

(assert (= (and b!826021 res!563086) b!826022))

(declare-fun m!768547 () Bool)

(assert (=> d!105013 m!768547))

(declare-fun m!768549 () Bool)

(assert (=> d!105013 m!768549))

(declare-fun m!768551 () Bool)

(assert (=> d!105013 m!768551))

(declare-fun m!768553 () Bool)

(assert (=> d!105013 m!768553))

(declare-fun m!768555 () Bool)

(assert (=> b!826021 m!768555))

(declare-fun m!768557 () Bool)

(assert (=> b!826022 m!768557))

(assert (=> b!825863 d!105013))

(declare-fun d!105015 () Bool)

(declare-fun e!459881 () Bool)

(assert (=> d!105015 e!459881))

(declare-fun res!563087 () Bool)

(assert (=> d!105015 (=> (not res!563087) (not e!459881))))

(declare-fun lt!373440 () ListLongMap!8821)

(assert (=> d!105015 (= res!563087 (contains!4179 lt!373440 (_1!5010 lt!373255)))))

(declare-fun lt!373442 () List!15798)

(assert (=> d!105015 (= lt!373440 (ListLongMap!8822 lt!373442))))

(declare-fun lt!373441 () Unit!28313)

(declare-fun lt!373439 () Unit!28313)

(assert (=> d!105015 (= lt!373441 lt!373439)))

(assert (=> d!105015 (= (getValueByKey!406 lt!373442 (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255)))))

(assert (=> d!105015 (= lt!373439 (lemmaContainsTupThenGetReturnValue!220 lt!373442 (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105015 (= lt!373442 (insertStrictlySorted!259 (toList!4426 lt!373265) (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105015 (= (+!1933 lt!373265 lt!373255) lt!373440)))

(declare-fun b!826023 () Bool)

(declare-fun res!563088 () Bool)

(assert (=> b!826023 (=> (not res!563088) (not e!459881))))

(assert (=> b!826023 (= res!563088 (= (getValueByKey!406 (toList!4426 lt!373440) (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255))))))

(declare-fun b!826024 () Bool)

(assert (=> b!826024 (= e!459881 (contains!4180 (toList!4426 lt!373440) lt!373255))))

(assert (= (and d!105015 res!563087) b!826023))

(assert (= (and b!826023 res!563088) b!826024))

(declare-fun m!768559 () Bool)

(assert (=> d!105015 m!768559))

(declare-fun m!768561 () Bool)

(assert (=> d!105015 m!768561))

(declare-fun m!768563 () Bool)

(assert (=> d!105015 m!768563))

(declare-fun m!768565 () Bool)

(assert (=> d!105015 m!768565))

(declare-fun m!768567 () Bool)

(assert (=> b!826023 m!768567))

(declare-fun m!768569 () Bool)

(assert (=> b!826024 m!768569))

(assert (=> b!825863 d!105015))

(declare-fun d!105017 () Bool)

(assert (=> d!105017 (= (+!1933 lt!373264 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1933 (+!1933 lt!373264 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!373445 () Unit!28313)

(declare-fun choose!1405 (ListLongMap!8821 (_ BitVec 64) V!25005 V!25005) Unit!28313)

(assert (=> d!105017 (= lt!373445 (choose!1405 lt!373264 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!105017 (= (addSameAsAddTwiceSameKeyDiffValues!216 lt!373264 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!373445)))

(declare-fun bs!23071 () Bool)

(assert (= bs!23071 d!105017))

(declare-fun m!768571 () Bool)

(assert (=> bs!23071 m!768571))

(declare-fun m!768573 () Bool)

(assert (=> bs!23071 m!768573))

(assert (=> bs!23071 m!768573))

(declare-fun m!768575 () Bool)

(assert (=> bs!23071 m!768575))

(declare-fun m!768577 () Bool)

(assert (=> bs!23071 m!768577))

(assert (=> b!825863 d!105017))

(declare-fun d!105019 () Bool)

(assert (=> d!105019 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71106 d!105019))

(declare-fun d!105021 () Bool)

(assert (=> d!105021 (= (array_inv!17649 _keys!976) (bvsge (size!22561 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71106 d!105021))

(declare-fun d!105023 () Bool)

(assert (=> d!105023 (= (array_inv!17650 _values!788) (bvsge (size!22562 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71106 d!105023))

(declare-fun d!105025 () Bool)

(declare-fun e!459882 () Bool)

(assert (=> d!105025 e!459882))

(declare-fun res!563089 () Bool)

(assert (=> d!105025 (=> (not res!563089) (not e!459882))))

(declare-fun lt!373447 () ListLongMap!8821)

(assert (=> d!105025 (= res!563089 (contains!4179 lt!373447 (_1!5010 lt!373258)))))

(declare-fun lt!373449 () List!15798)

(assert (=> d!105025 (= lt!373447 (ListLongMap!8822 lt!373449))))

(declare-fun lt!373448 () Unit!28313)

(declare-fun lt!373446 () Unit!28313)

(assert (=> d!105025 (= lt!373448 lt!373446)))

(assert (=> d!105025 (= (getValueByKey!406 lt!373449 (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258)))))

(assert (=> d!105025 (= lt!373446 (lemmaContainsTupThenGetReturnValue!220 lt!373449 (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105025 (= lt!373449 (insertStrictlySorted!259 (toList!4426 (+!1933 lt!373259 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105025 (= (+!1933 (+!1933 lt!373259 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373258) lt!373447)))

(declare-fun b!826025 () Bool)

(declare-fun res!563090 () Bool)

(assert (=> b!826025 (=> (not res!563090) (not e!459882))))

(assert (=> b!826025 (= res!563090 (= (getValueByKey!406 (toList!4426 lt!373447) (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258))))))

(declare-fun b!826026 () Bool)

(assert (=> b!826026 (= e!459882 (contains!4180 (toList!4426 lt!373447) lt!373258))))

(assert (= (and d!105025 res!563089) b!826025))

(assert (= (and b!826025 res!563090) b!826026))

(declare-fun m!768579 () Bool)

(assert (=> d!105025 m!768579))

(declare-fun m!768581 () Bool)

(assert (=> d!105025 m!768581))

(declare-fun m!768583 () Bool)

(assert (=> d!105025 m!768583))

(declare-fun m!768585 () Bool)

(assert (=> d!105025 m!768585))

(declare-fun m!768587 () Bool)

(assert (=> b!826025 m!768587))

(declare-fun m!768589 () Bool)

(assert (=> b!826026 m!768589))

(assert (=> b!825872 d!105025))

(declare-fun d!105027 () Bool)

(declare-fun e!459883 () Bool)

(assert (=> d!105027 e!459883))

(declare-fun res!563091 () Bool)

(assert (=> d!105027 (=> (not res!563091) (not e!459883))))

(declare-fun lt!373451 () ListLongMap!8821)

(assert (=> d!105027 (= res!563091 (contains!4179 lt!373451 (_1!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!373453 () List!15798)

(assert (=> d!105027 (= lt!373451 (ListLongMap!8822 lt!373453))))

(declare-fun lt!373452 () Unit!28313)

(declare-fun lt!373450 () Unit!28313)

(assert (=> d!105027 (= lt!373452 lt!373450)))

(assert (=> d!105027 (= (getValueByKey!406 lt!373453 (_1!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!411 (_2!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105027 (= lt!373450 (lemmaContainsTupThenGetReturnValue!220 lt!373453 (_1!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105027 (= lt!373453 (insertStrictlySorted!259 (toList!4426 lt!373259) (_1!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105027 (= (+!1933 lt!373259 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373451)))

(declare-fun b!826027 () Bool)

(declare-fun res!563092 () Bool)

(assert (=> b!826027 (=> (not res!563092) (not e!459883))))

(assert (=> b!826027 (= res!563092 (= (getValueByKey!406 (toList!4426 lt!373451) (_1!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!411 (_2!5010 (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!826028 () Bool)

(assert (=> b!826028 (= e!459883 (contains!4180 (toList!4426 lt!373451) (tuple2!9999 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105027 res!563091) b!826027))

(assert (= (and b!826027 res!563092) b!826028))

(declare-fun m!768591 () Bool)

(assert (=> d!105027 m!768591))

(declare-fun m!768593 () Bool)

(assert (=> d!105027 m!768593))

(declare-fun m!768595 () Bool)

(assert (=> d!105027 m!768595))

(declare-fun m!768597 () Bool)

(assert (=> d!105027 m!768597))

(declare-fun m!768599 () Bool)

(assert (=> b!826027 m!768599))

(declare-fun m!768601 () Bool)

(assert (=> b!826028 m!768601))

(assert (=> b!825872 d!105027))

(declare-fun d!105029 () Bool)

(declare-fun res!563099 () Bool)

(declare-fun e!459892 () Bool)

(assert (=> d!105029 (=> res!563099 e!459892)))

(assert (=> d!105029 (= res!563099 (bvsge #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> d!105029 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15796) e!459892)))

(declare-fun b!826039 () Bool)

(declare-fun e!459894 () Bool)

(declare-fun call!35904 () Bool)

(assert (=> b!826039 (= e!459894 call!35904)))

(declare-fun b!826040 () Bool)

(declare-fun e!459893 () Bool)

(assert (=> b!826040 (= e!459893 e!459894)))

(declare-fun c!89460 () Bool)

(assert (=> b!826040 (= c!89460 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826041 () Bool)

(declare-fun e!459895 () Bool)

(declare-fun contains!4181 (List!15799 (_ BitVec 64)) Bool)

(assert (=> b!826041 (= e!459895 (contains!4181 Nil!15796 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826042 () Bool)

(assert (=> b!826042 (= e!459892 e!459893)))

(declare-fun res!563101 () Bool)

(assert (=> b!826042 (=> (not res!563101) (not e!459893))))

(assert (=> b!826042 (= res!563101 (not e!459895))))

(declare-fun res!563100 () Bool)

(assert (=> b!826042 (=> (not res!563100) (not e!459895))))

(assert (=> b!826042 (= res!563100 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826043 () Bool)

(assert (=> b!826043 (= e!459894 call!35904)))

(declare-fun bm!35901 () Bool)

(assert (=> bm!35901 (= call!35904 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89460 (Cons!15795 (select (arr!22140 _keys!976) #b00000000000000000000000000000000) Nil!15796) Nil!15796)))))

(assert (= (and d!105029 (not res!563099)) b!826042))

(assert (= (and b!826042 res!563100) b!826041))

(assert (= (and b!826042 res!563101) b!826040))

(assert (= (and b!826040 c!89460) b!826039))

(assert (= (and b!826040 (not c!89460)) b!826043))

(assert (= (or b!826039 b!826043) bm!35901))

(assert (=> b!826040 m!768365))

(assert (=> b!826040 m!768365))

(assert (=> b!826040 m!768367))

(assert (=> b!826041 m!768365))

(assert (=> b!826041 m!768365))

(declare-fun m!768603 () Bool)

(assert (=> b!826041 m!768603))

(assert (=> b!826042 m!768365))

(assert (=> b!826042 m!768365))

(assert (=> b!826042 m!768367))

(assert (=> bm!35901 m!768365))

(declare-fun m!768605 () Bool)

(assert (=> bm!35901 m!768605))

(assert (=> b!825864 d!105029))

(declare-fun d!105031 () Bool)

(declare-fun e!459896 () Bool)

(assert (=> d!105031 e!459896))

(declare-fun res!563102 () Bool)

(assert (=> d!105031 (=> (not res!563102) (not e!459896))))

(declare-fun lt!373455 () ListLongMap!8821)

(assert (=> d!105031 (= res!563102 (contains!4179 lt!373455 (_1!5010 lt!373255)))))

(declare-fun lt!373457 () List!15798)

(assert (=> d!105031 (= lt!373455 (ListLongMap!8822 lt!373457))))

(declare-fun lt!373456 () Unit!28313)

(declare-fun lt!373454 () Unit!28313)

(assert (=> d!105031 (= lt!373456 lt!373454)))

(assert (=> d!105031 (= (getValueByKey!406 lt!373457 (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255)))))

(assert (=> d!105031 (= lt!373454 (lemmaContainsTupThenGetReturnValue!220 lt!373457 (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105031 (= lt!373457 (insertStrictlySorted!259 (toList!4426 (+!1933 lt!373259 lt!373258)) (_1!5010 lt!373255) (_2!5010 lt!373255)))))

(assert (=> d!105031 (= (+!1933 (+!1933 lt!373259 lt!373258) lt!373255) lt!373455)))

(declare-fun b!826044 () Bool)

(declare-fun res!563103 () Bool)

(assert (=> b!826044 (=> (not res!563103) (not e!459896))))

(assert (=> b!826044 (= res!563103 (= (getValueByKey!406 (toList!4426 lt!373455) (_1!5010 lt!373255)) (Some!411 (_2!5010 lt!373255))))))

(declare-fun b!826045 () Bool)

(assert (=> b!826045 (= e!459896 (contains!4180 (toList!4426 lt!373455) lt!373255))))

(assert (= (and d!105031 res!563102) b!826044))

(assert (= (and b!826044 res!563103) b!826045))

(declare-fun m!768607 () Bool)

(assert (=> d!105031 m!768607))

(declare-fun m!768609 () Bool)

(assert (=> d!105031 m!768609))

(declare-fun m!768611 () Bool)

(assert (=> d!105031 m!768611))

(declare-fun m!768613 () Bool)

(assert (=> d!105031 m!768613))

(declare-fun m!768615 () Bool)

(assert (=> b!826044 m!768615))

(declare-fun m!768617 () Bool)

(assert (=> b!826045 m!768617))

(assert (=> b!825868 d!105031))

(declare-fun d!105033 () Bool)

(declare-fun e!459897 () Bool)

(assert (=> d!105033 e!459897))

(declare-fun res!563104 () Bool)

(assert (=> d!105033 (=> (not res!563104) (not e!459897))))

(declare-fun lt!373459 () ListLongMap!8821)

(assert (=> d!105033 (= res!563104 (contains!4179 lt!373459 (_1!5010 lt!373258)))))

(declare-fun lt!373461 () List!15798)

(assert (=> d!105033 (= lt!373459 (ListLongMap!8822 lt!373461))))

(declare-fun lt!373460 () Unit!28313)

(declare-fun lt!373458 () Unit!28313)

(assert (=> d!105033 (= lt!373460 lt!373458)))

(assert (=> d!105033 (= (getValueByKey!406 lt!373461 (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258)))))

(assert (=> d!105033 (= lt!373458 (lemmaContainsTupThenGetReturnValue!220 lt!373461 (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105033 (= lt!373461 (insertStrictlySorted!259 (toList!4426 lt!373259) (_1!5010 lt!373258) (_2!5010 lt!373258)))))

(assert (=> d!105033 (= (+!1933 lt!373259 lt!373258) lt!373459)))

(declare-fun b!826046 () Bool)

(declare-fun res!563105 () Bool)

(assert (=> b!826046 (=> (not res!563105) (not e!459897))))

(assert (=> b!826046 (= res!563105 (= (getValueByKey!406 (toList!4426 lt!373459) (_1!5010 lt!373258)) (Some!411 (_2!5010 lt!373258))))))

(declare-fun b!826047 () Bool)

(assert (=> b!826047 (= e!459897 (contains!4180 (toList!4426 lt!373459) lt!373258))))

(assert (= (and d!105033 res!563104) b!826046))

(assert (= (and b!826046 res!563105) b!826047))

(declare-fun m!768619 () Bool)

(assert (=> d!105033 m!768619))

(declare-fun m!768621 () Bool)

(assert (=> d!105033 m!768621))

(declare-fun m!768623 () Bool)

(assert (=> d!105033 m!768623))

(declare-fun m!768625 () Bool)

(assert (=> d!105033 m!768625))

(declare-fun m!768627 () Bool)

(assert (=> b!826046 m!768627))

(declare-fun m!768629 () Bool)

(assert (=> b!826047 m!768629))

(assert (=> b!825868 d!105033))

(declare-fun d!105035 () Bool)

(assert (=> d!105035 (= (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373464 () Unit!28313)

(declare-fun choose!1406 (array!46188 array!46190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25005 V!25005 V!25005 V!25005 (_ BitVec 32) Int) Unit!28313)

(assert (=> d!105035 (= lt!373464 (choose!1406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105035 (validMask!0 mask!1312)))

(assert (=> d!105035 (= (lemmaNoChangeToArrayThenSameMapNoExtras!545 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373464)))

(declare-fun bs!23072 () Bool)

(assert (= bs!23072 d!105035))

(assert (=> bs!23072 m!768311))

(assert (=> bs!23072 m!768309))

(declare-fun m!768631 () Bool)

(assert (=> bs!23072 m!768631))

(assert (=> bs!23072 m!768301))

(assert (=> b!825869 d!105035))

(declare-fun b!826072 () Bool)

(declare-fun e!459916 () ListLongMap!8821)

(assert (=> b!826072 (= e!459916 (ListLongMap!8822 Nil!15795))))

(declare-fun bm!35904 () Bool)

(declare-fun call!35907 () ListLongMap!8821)

(assert (=> bm!35904 (= call!35907 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!826073 () Bool)

(declare-fun lt!373481 () Unit!28313)

(declare-fun lt!373483 () Unit!28313)

(assert (=> b!826073 (= lt!373481 lt!373483)))

(declare-fun lt!373485 () (_ BitVec 64))

(declare-fun lt!373479 () ListLongMap!8821)

(declare-fun lt!373482 () V!25005)

(declare-fun lt!373480 () (_ BitVec 64))

(assert (=> b!826073 (not (contains!4179 (+!1933 lt!373479 (tuple2!9999 lt!373485 lt!373482)) lt!373480))))

(declare-fun addStillNotContains!187 (ListLongMap!8821 (_ BitVec 64) V!25005 (_ BitVec 64)) Unit!28313)

(assert (=> b!826073 (= lt!373483 (addStillNotContains!187 lt!373479 lt!373485 lt!373482 lt!373480))))

(assert (=> b!826073 (= lt!373480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!826073 (= lt!373482 (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!826073 (= lt!373485 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826073 (= lt!373479 call!35907)))

(declare-fun e!459915 () ListLongMap!8821)

(assert (=> b!826073 (= e!459915 (+!1933 call!35907 (tuple2!9999 (select (arr!22140 _keys!976) #b00000000000000000000000000000000) (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!105037 () Bool)

(declare-fun e!459917 () Bool)

(assert (=> d!105037 e!459917))

(declare-fun res!563116 () Bool)

(assert (=> d!105037 (=> (not res!563116) (not e!459917))))

(declare-fun lt!373484 () ListLongMap!8821)

(assert (=> d!105037 (= res!563116 (not (contains!4179 lt!373484 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105037 (= lt!373484 e!459916)))

(declare-fun c!89472 () Bool)

(assert (=> d!105037 (= c!89472 (bvsge #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> d!105037 (validMask!0 mask!1312)))

(assert (=> d!105037 (= (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373484)))

(declare-fun b!826074 () Bool)

(declare-fun e!459912 () Bool)

(assert (=> b!826074 (= e!459912 (= lt!373484 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!826075 () Bool)

(declare-fun res!563117 () Bool)

(assert (=> b!826075 (=> (not res!563117) (not e!459917))))

(assert (=> b!826075 (= res!563117 (not (contains!4179 lt!373484 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!826076 () Bool)

(assert (=> b!826076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> b!826076 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22562 _values!788)))))

(declare-fun e!459913 () Bool)

(assert (=> b!826076 (= e!459913 (= (apply!362 lt!373484 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)) (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!826077 () Bool)

(assert (=> b!826077 (= e!459915 call!35907)))

(declare-fun b!826078 () Bool)

(assert (=> b!826078 (= e!459916 e!459915)))

(declare-fun c!89470 () Bool)

(assert (=> b!826078 (= c!89470 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826079 () Bool)

(declare-fun e!459914 () Bool)

(assert (=> b!826079 (= e!459914 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826079 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!826080 () Bool)

(declare-fun isEmpty!644 (ListLongMap!8821) Bool)

(assert (=> b!826080 (= e!459912 (isEmpty!644 lt!373484))))

(declare-fun b!826081 () Bool)

(declare-fun e!459918 () Bool)

(assert (=> b!826081 (= e!459918 e!459913)))

(assert (=> b!826081 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun res!563115 () Bool)

(assert (=> b!826081 (= res!563115 (contains!4179 lt!373484 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826081 (=> (not res!563115) (not e!459913))))

(declare-fun b!826082 () Bool)

(assert (=> b!826082 (= e!459917 e!459918)))

(declare-fun c!89471 () Bool)

(assert (=> b!826082 (= c!89471 e!459914)))

(declare-fun res!563114 () Bool)

(assert (=> b!826082 (=> (not res!563114) (not e!459914))))

(assert (=> b!826082 (= res!563114 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun b!826083 () Bool)

(assert (=> b!826083 (= e!459918 e!459912)))

(declare-fun c!89469 () Bool)

(assert (=> b!826083 (= c!89469 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (= (and d!105037 c!89472) b!826072))

(assert (= (and d!105037 (not c!89472)) b!826078))

(assert (= (and b!826078 c!89470) b!826073))

(assert (= (and b!826078 (not c!89470)) b!826077))

(assert (= (or b!826073 b!826077) bm!35904))

(assert (= (and d!105037 res!563116) b!826075))

(assert (= (and b!826075 res!563117) b!826082))

(assert (= (and b!826082 res!563114) b!826079))

(assert (= (and b!826082 c!89471) b!826081))

(assert (= (and b!826082 (not c!89471)) b!826083))

(assert (= (and b!826081 res!563115) b!826076))

(assert (= (and b!826083 c!89469) b!826074))

(assert (= (and b!826083 (not c!89469)) b!826080))

(declare-fun b_lambda!11119 () Bool)

(assert (=> (not b_lambda!11119) (not b!826073)))

(assert (=> b!826073 t!22148))

(declare-fun b_and!22215 () Bool)

(assert (= b_and!22213 (and (=> t!22148 result!7955) b_and!22215)))

(declare-fun b_lambda!11121 () Bool)

(assert (=> (not b_lambda!11121) (not b!826076)))

(assert (=> b!826076 t!22148))

(declare-fun b_and!22217 () Bool)

(assert (= b_and!22215 (and (=> t!22148 result!7955) b_and!22217)))

(declare-fun m!768633 () Bool)

(assert (=> b!826080 m!768633))

(declare-fun m!768635 () Bool)

(assert (=> bm!35904 m!768635))

(assert (=> b!826074 m!768635))

(declare-fun m!768637 () Bool)

(assert (=> d!105037 m!768637))

(assert (=> d!105037 m!768301))

(assert (=> b!826081 m!768365))

(assert (=> b!826081 m!768365))

(declare-fun m!768639 () Bool)

(assert (=> b!826081 m!768639))

(assert (=> b!826078 m!768365))

(assert (=> b!826078 m!768365))

(assert (=> b!826078 m!768367))

(assert (=> b!826073 m!768395))

(assert (=> b!826073 m!768393))

(assert (=> b!826073 m!768397))

(declare-fun m!768641 () Bool)

(assert (=> b!826073 m!768641))

(assert (=> b!826073 m!768641))

(declare-fun m!768643 () Bool)

(assert (=> b!826073 m!768643))

(declare-fun m!768645 () Bool)

(assert (=> b!826073 m!768645))

(assert (=> b!826073 m!768365))

(assert (=> b!826073 m!768393))

(declare-fun m!768647 () Bool)

(assert (=> b!826073 m!768647))

(assert (=> b!826073 m!768395))

(declare-fun m!768649 () Bool)

(assert (=> b!826075 m!768649))

(assert (=> b!826076 m!768395))

(assert (=> b!826076 m!768393))

(assert (=> b!826076 m!768397))

(assert (=> b!826076 m!768365))

(assert (=> b!826076 m!768393))

(assert (=> b!826076 m!768365))

(declare-fun m!768651 () Bool)

(assert (=> b!826076 m!768651))

(assert (=> b!826076 m!768395))

(assert (=> b!826079 m!768365))

(assert (=> b!826079 m!768365))

(assert (=> b!826079 m!768367))

(assert (=> b!825869 d!105037))

(declare-fun b!826084 () Bool)

(declare-fun e!459923 () ListLongMap!8821)

(assert (=> b!826084 (= e!459923 (ListLongMap!8822 Nil!15795))))

(declare-fun call!35908 () ListLongMap!8821)

(declare-fun bm!35905 () Bool)

(assert (=> bm!35905 (= call!35908 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!826085 () Bool)

(declare-fun lt!373488 () Unit!28313)

(declare-fun lt!373490 () Unit!28313)

(assert (=> b!826085 (= lt!373488 lt!373490)))

(declare-fun lt!373489 () V!25005)

(declare-fun lt!373487 () (_ BitVec 64))

(declare-fun lt!373486 () ListLongMap!8821)

(declare-fun lt!373492 () (_ BitVec 64))

(assert (=> b!826085 (not (contains!4179 (+!1933 lt!373486 (tuple2!9999 lt!373492 lt!373489)) lt!373487))))

(assert (=> b!826085 (= lt!373490 (addStillNotContains!187 lt!373486 lt!373492 lt!373489 lt!373487))))

(assert (=> b!826085 (= lt!373487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!826085 (= lt!373489 (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!826085 (= lt!373492 (select (arr!22140 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826085 (= lt!373486 call!35908)))

(declare-fun e!459922 () ListLongMap!8821)

(assert (=> b!826085 (= e!459922 (+!1933 call!35908 (tuple2!9999 (select (arr!22140 _keys!976) #b00000000000000000000000000000000) (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!105039 () Bool)

(declare-fun e!459924 () Bool)

(assert (=> d!105039 e!459924))

(declare-fun res!563120 () Bool)

(assert (=> d!105039 (=> (not res!563120) (not e!459924))))

(declare-fun lt!373491 () ListLongMap!8821)

(assert (=> d!105039 (= res!563120 (not (contains!4179 lt!373491 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105039 (= lt!373491 e!459923)))

(declare-fun c!89476 () Bool)

(assert (=> d!105039 (= c!89476 (bvsge #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> d!105039 (validMask!0 mask!1312)))

(assert (=> d!105039 (= (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373491)))

(declare-fun b!826086 () Bool)

(declare-fun e!459919 () Bool)

(assert (=> b!826086 (= e!459919 (= lt!373491 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!826087 () Bool)

(declare-fun res!563121 () Bool)

(assert (=> b!826087 (=> (not res!563121) (not e!459924))))

(assert (=> b!826087 (= res!563121 (not (contains!4179 lt!373491 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!826088 () Bool)

(assert (=> b!826088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (=> b!826088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22562 _values!788)))))

(declare-fun e!459920 () Bool)

(assert (=> b!826088 (= e!459920 (= (apply!362 lt!373491 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)) (get!11739 (select (arr!22141 _values!788) #b00000000000000000000000000000000) (dynLambda!973 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!826089 () Bool)

(assert (=> b!826089 (= e!459922 call!35908)))

(declare-fun b!826090 () Bool)

(assert (=> b!826090 (= e!459923 e!459922)))

(declare-fun c!89474 () Bool)

(assert (=> b!826090 (= c!89474 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826091 () Bool)

(declare-fun e!459921 () Bool)

(assert (=> b!826091 (= e!459921 (validKeyInArray!0 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826091 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!826092 () Bool)

(assert (=> b!826092 (= e!459919 (isEmpty!644 lt!373491))))

(declare-fun b!826093 () Bool)

(declare-fun e!459925 () Bool)

(assert (=> b!826093 (= e!459925 e!459920)))

(assert (=> b!826093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun res!563119 () Bool)

(assert (=> b!826093 (= res!563119 (contains!4179 lt!373491 (select (arr!22140 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826093 (=> (not res!563119) (not e!459920))))

(declare-fun b!826094 () Bool)

(assert (=> b!826094 (= e!459924 e!459925)))

(declare-fun c!89475 () Bool)

(assert (=> b!826094 (= c!89475 e!459921)))

(declare-fun res!563118 () Bool)

(assert (=> b!826094 (=> (not res!563118) (not e!459921))))

(assert (=> b!826094 (= res!563118 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(declare-fun b!826095 () Bool)

(assert (=> b!826095 (= e!459925 e!459919)))

(declare-fun c!89473 () Bool)

(assert (=> b!826095 (= c!89473 (bvslt #b00000000000000000000000000000000 (size!22561 _keys!976)))))

(assert (= (and d!105039 c!89476) b!826084))

(assert (= (and d!105039 (not c!89476)) b!826090))

(assert (= (and b!826090 c!89474) b!826085))

(assert (= (and b!826090 (not c!89474)) b!826089))

(assert (= (or b!826085 b!826089) bm!35905))

(assert (= (and d!105039 res!563120) b!826087))

(assert (= (and b!826087 res!563121) b!826094))

(assert (= (and b!826094 res!563118) b!826091))

(assert (= (and b!826094 c!89475) b!826093))

(assert (= (and b!826094 (not c!89475)) b!826095))

(assert (= (and b!826093 res!563119) b!826088))

(assert (= (and b!826095 c!89473) b!826086))

(assert (= (and b!826095 (not c!89473)) b!826092))

(declare-fun b_lambda!11123 () Bool)

(assert (=> (not b_lambda!11123) (not b!826085)))

(assert (=> b!826085 t!22148))

(declare-fun b_and!22219 () Bool)

(assert (= b_and!22217 (and (=> t!22148 result!7955) b_and!22219)))

(declare-fun b_lambda!11125 () Bool)

(assert (=> (not b_lambda!11125) (not b!826088)))

(assert (=> b!826088 t!22148))

(declare-fun b_and!22221 () Bool)

(assert (= b_and!22219 (and (=> t!22148 result!7955) b_and!22221)))

(declare-fun m!768653 () Bool)

(assert (=> b!826092 m!768653))

(declare-fun m!768655 () Bool)

(assert (=> bm!35905 m!768655))

(assert (=> b!826086 m!768655))

(declare-fun m!768657 () Bool)

(assert (=> d!105039 m!768657))

(assert (=> d!105039 m!768301))

(assert (=> b!826093 m!768365))

(assert (=> b!826093 m!768365))

(declare-fun m!768659 () Bool)

(assert (=> b!826093 m!768659))

(assert (=> b!826090 m!768365))

(assert (=> b!826090 m!768365))

(assert (=> b!826090 m!768367))

(assert (=> b!826085 m!768395))

(assert (=> b!826085 m!768393))

(assert (=> b!826085 m!768397))

(declare-fun m!768661 () Bool)

(assert (=> b!826085 m!768661))

(assert (=> b!826085 m!768661))

(declare-fun m!768663 () Bool)

(assert (=> b!826085 m!768663))

(declare-fun m!768665 () Bool)

(assert (=> b!826085 m!768665))

(assert (=> b!826085 m!768365))

(assert (=> b!826085 m!768393))

(declare-fun m!768667 () Bool)

(assert (=> b!826085 m!768667))

(assert (=> b!826085 m!768395))

(declare-fun m!768669 () Bool)

(assert (=> b!826087 m!768669))

(assert (=> b!826088 m!768395))

(assert (=> b!826088 m!768393))

(assert (=> b!826088 m!768397))

(assert (=> b!826088 m!768365))

(assert (=> b!826088 m!768393))

(assert (=> b!826088 m!768365))

(declare-fun m!768671 () Bool)

(assert (=> b!826088 m!768671))

(assert (=> b!826088 m!768395))

(assert (=> b!826091 m!768365))

(assert (=> b!826091 m!768365))

(assert (=> b!826091 m!768367))

(assert (=> b!825869 d!105039))

(declare-fun b!826102 () Bool)

(declare-fun e!459930 () Bool)

(assert (=> b!826102 (= e!459930 tp_is_empty!15003)))

(declare-fun condMapEmpty!24133 () Bool)

(declare-fun mapDefault!24133 () ValueCell!7086)

(assert (=> mapNonEmpty!24127 (= condMapEmpty!24133 (= mapRest!24127 ((as const (Array (_ BitVec 32) ValueCell!7086)) mapDefault!24133)))))

(declare-fun e!459931 () Bool)

(declare-fun mapRes!24133 () Bool)

(assert (=> mapNonEmpty!24127 (= tp!46635 (and e!459931 mapRes!24133))))

(declare-fun mapIsEmpty!24133 () Bool)

(assert (=> mapIsEmpty!24133 mapRes!24133))

(declare-fun mapNonEmpty!24133 () Bool)

(declare-fun tp!46645 () Bool)

(assert (=> mapNonEmpty!24133 (= mapRes!24133 (and tp!46645 e!459930))))

(declare-fun mapValue!24133 () ValueCell!7086)

(declare-fun mapRest!24133 () (Array (_ BitVec 32) ValueCell!7086))

(declare-fun mapKey!24133 () (_ BitVec 32))

(assert (=> mapNonEmpty!24133 (= mapRest!24127 (store mapRest!24133 mapKey!24133 mapValue!24133))))

(declare-fun b!826103 () Bool)

(assert (=> b!826103 (= e!459931 tp_is_empty!15003)))

(assert (= (and mapNonEmpty!24127 condMapEmpty!24133) mapIsEmpty!24133))

(assert (= (and mapNonEmpty!24127 (not condMapEmpty!24133)) mapNonEmpty!24133))

(assert (= (and mapNonEmpty!24133 ((_ is ValueCellFull!7086) mapValue!24133)) b!826102))

(assert (= (and mapNonEmpty!24127 ((_ is ValueCellFull!7086) mapDefault!24133)) b!826103))

(declare-fun m!768673 () Bool)

(assert (=> mapNonEmpty!24133 m!768673))

(declare-fun b_lambda!11127 () Bool)

(assert (= b_lambda!11121 (or (and start!71106 b_free!13293) b_lambda!11127)))

(declare-fun b_lambda!11129 () Bool)

(assert (= b_lambda!11119 (or (and start!71106 b_free!13293) b_lambda!11129)))

(declare-fun b_lambda!11131 () Bool)

(assert (= b_lambda!11125 (or (and start!71106 b_free!13293) b_lambda!11131)))

(declare-fun b_lambda!11133 () Bool)

(assert (= b_lambda!11123 (or (and start!71106 b_free!13293) b_lambda!11133)))

(declare-fun b_lambda!11135 () Bool)

(assert (= b_lambda!11117 (or (and start!71106 b_free!13293) b_lambda!11135)))

(declare-fun b_lambda!11137 () Bool)

(assert (= b_lambda!11115 (or (and start!71106 b_free!13293) b_lambda!11137)))

(check-sat (not b!825915) (not b!826012) (not b!826006) (not d!105005) (not b!826003) (not b_lambda!11135) (not bm!35904) (not b!826013) (not b!826018) (not b!825983) (not b!826040) (not b!826001) (not d!105025) (not b!825997) (not d!105007) (not b!826011) (not b!826074) (not bm!35889) (not b!826000) (not b!826044) (not b_lambda!11137) (not b!826026) (not d!105001) (not b!826076) (not d!104999) (not b!826085) (not b!826028) (not b!826017) (not b_next!13293) (not b!826086) (not b!826078) (not d!105017) tp_is_empty!15003 (not d!105003) (not d!105027) (not b!826093) b_and!22221 (not b_lambda!11129) (not bm!35890) (not bm!35905) (not b!826020) (not b!826010) (not d!105031) (not b!826046) (not b!826080) (not b!826088) (not b!826022) (not b!826073) (not bm!35870) (not b!826027) (not bm!35894) (not b!825979) (not b!826024) (not b!826091) (not bm!35895) (not b!825918) (not d!105009) (not b!826042) (not bm!35888) (not b!826047) (not bm!35887) (not b!826019) (not b!826002) (not d!104997) (not d!105037) (not d!105015) (not d!105039) (not b_lambda!11133) (not bm!35896) (not b!825987) (not b!826025) (not b!825978) (not b!826041) (not b!825984) (not b!826075) (not b!825923) (not d!105035) (not b!826092) (not b_lambda!11131) (not b!826081) (not b_lambda!11127) (not d!105013) (not b!825977) (not d!105033) (not b!826087) (not b!825974) (not b!826079) (not bm!35897) (not b!826023) (not bm!35901) (not b!826016) (not b!825924) (not b!826015) (not b!826045) (not b!825980) (not mapNonEmpty!24133) (not b!826090) (not d!105011) (not b!826007) (not b!826014) (not b!826021))
(check-sat b_and!22221 (not b_next!13293))
