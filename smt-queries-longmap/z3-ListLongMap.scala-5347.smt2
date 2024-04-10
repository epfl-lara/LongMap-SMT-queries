; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71464 () Bool)

(assert start!71464)

(declare-fun b_free!13491 () Bool)

(declare-fun b_next!13491 () Bool)

(assert (=> start!71464 (= b_free!13491 (not b_next!13491))))

(declare-fun tp!47257 () Bool)

(declare-fun b_and!22509 () Bool)

(assert (=> start!71464 (= tp!47257 b_and!22509)))

(declare-fun b!829933 () Bool)

(declare-fun e!462680 () Bool)

(declare-fun e!462676 () Bool)

(declare-fun mapRes!24451 () Bool)

(assert (=> b!829933 (= e!462680 (and e!462676 mapRes!24451))))

(declare-fun condMapEmpty!24451 () Bool)

(declare-datatypes ((V!25269 0))(
  ( (V!25270 (val!7648 Int)) )
))
(declare-datatypes ((ValueCell!7185 0))(
  ( (ValueCellFull!7185 (v!10089 V!25269)) (EmptyCell!7185) )
))
(declare-datatypes ((array!46570 0))(
  ( (array!46571 (arr!22322 (Array (_ BitVec 32) ValueCell!7185)) (size!22743 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46570)

(declare-fun mapDefault!24451 () ValueCell!7185)

(assert (=> b!829933 (= condMapEmpty!24451 (= (arr!22322 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7185)) mapDefault!24451)))))

(declare-fun b!829934 () Bool)

(declare-fun res!565307 () Bool)

(declare-fun e!462675 () Bool)

(assert (=> b!829934 (=> (not res!565307) (not e!462675))))

(declare-datatypes ((array!46572 0))(
  ( (array!46573 (arr!22323 (Array (_ BitVec 32) (_ BitVec 64))) (size!22744 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46572)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46572 (_ BitVec 32)) Bool)

(assert (=> b!829934 (= res!565307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!829935 () Bool)

(declare-fun e!462681 () Bool)

(declare-fun zeroValueAfter!34 () V!25269)

(declare-fun minValue!754 () V!25269)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10144 0))(
  ( (tuple2!10145 (_1!5083 (_ BitVec 64)) (_2!5083 V!25269)) )
))
(declare-datatypes ((List!15938 0))(
  ( (Nil!15935) (Cons!15934 (h!17063 tuple2!10144) (t!22301 List!15938)) )
))
(declare-datatypes ((ListLongMap!8967 0))(
  ( (ListLongMap!8968 (toList!4499 List!15938)) )
))
(declare-fun lt!376480 () ListLongMap!8967)

(declare-fun getCurrentListMap!2596 (array!46572 array!46570 (_ BitVec 32) (_ BitVec 32) V!25269 V!25269 (_ BitVec 32) Int) ListLongMap!8967)

(declare-fun +!1978 (ListLongMap!8967 tuple2!10144) ListLongMap!8967)

(assert (=> b!829935 (= e!462681 (= (getCurrentListMap!2596 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1978 (+!1978 lt!376480 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829936 () Bool)

(assert (=> b!829936 (= e!462675 (not e!462681))))

(declare-fun res!565304 () Bool)

(assert (=> b!829936 (=> res!565304 e!462681)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!829936 (= res!565304 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!462678 () Bool)

(assert (=> b!829936 e!462678))

(declare-fun res!565308 () Bool)

(assert (=> b!829936 (=> (not res!565308) (not e!462678))))

(declare-fun lt!376479 () ListLongMap!8967)

(assert (=> b!829936 (= res!565308 (= lt!376479 lt!376480))))

(declare-fun zeroValueBefore!34 () V!25269)

(declare-datatypes ((Unit!28421 0))(
  ( (Unit!28422) )
))
(declare-fun lt!376478 () Unit!28421)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!586 (array!46572 array!46570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25269 V!25269 V!25269 V!25269 (_ BitVec 32) Int) Unit!28421)

(assert (=> b!829936 (= lt!376478 (lemmaNoChangeToArrayThenSameMapNoExtras!586 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2498 (array!46572 array!46570 (_ BitVec 32) (_ BitVec 32) V!25269 V!25269 (_ BitVec 32) Int) ListLongMap!8967)

(assert (=> b!829936 (= lt!376480 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829936 (= lt!376479 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829937 () Bool)

(declare-fun tp_is_empty!15201 () Bool)

(assert (=> b!829937 (= e!462676 tp_is_empty!15201)))

(declare-fun mapIsEmpty!24451 () Bool)

(assert (=> mapIsEmpty!24451 mapRes!24451))

(declare-fun res!565306 () Bool)

(assert (=> start!71464 (=> (not res!565306) (not e!462675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71464 (= res!565306 (validMask!0 mask!1312))))

(assert (=> start!71464 e!462675))

(assert (=> start!71464 tp_is_empty!15201))

(declare-fun array_inv!17777 (array!46572) Bool)

(assert (=> start!71464 (array_inv!17777 _keys!976)))

(assert (=> start!71464 true))

(declare-fun array_inv!17778 (array!46570) Bool)

(assert (=> start!71464 (and (array_inv!17778 _values!788) e!462680)))

(assert (=> start!71464 tp!47257))

(declare-fun b!829938 () Bool)

(declare-fun res!565309 () Bool)

(assert (=> b!829938 (=> (not res!565309) (not e!462675))))

(declare-datatypes ((List!15939 0))(
  ( (Nil!15936) (Cons!15935 (h!17064 (_ BitVec 64)) (t!22302 List!15939)) )
))
(declare-fun arrayNoDuplicates!0 (array!46572 (_ BitVec 32) List!15939) Bool)

(assert (=> b!829938 (= res!565309 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15936))))

(declare-fun e!462677 () Bool)

(declare-fun b!829939 () Bool)

(assert (=> b!829939 (= e!462677 (= (getCurrentListMap!2596 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1978 (+!1978 lt!376479 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!829940 () Bool)

(declare-fun res!565310 () Bool)

(assert (=> b!829940 (=> (not res!565310) (not e!462675))))

(assert (=> b!829940 (= res!565310 (and (= (size!22743 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22744 _keys!976) (size!22743 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829941 () Bool)

(assert (=> b!829941 (= e!462678 e!462677)))

(declare-fun res!565305 () Bool)

(assert (=> b!829941 (=> res!565305 e!462677)))

(assert (=> b!829941 (= res!565305 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!24451 () Bool)

(declare-fun tp!47256 () Bool)

(declare-fun e!462682 () Bool)

(assert (=> mapNonEmpty!24451 (= mapRes!24451 (and tp!47256 e!462682))))

(declare-fun mapRest!24451 () (Array (_ BitVec 32) ValueCell!7185))

(declare-fun mapKey!24451 () (_ BitVec 32))

(declare-fun mapValue!24451 () ValueCell!7185)

(assert (=> mapNonEmpty!24451 (= (arr!22322 _values!788) (store mapRest!24451 mapKey!24451 mapValue!24451))))

(declare-fun b!829942 () Bool)

(assert (=> b!829942 (= e!462682 tp_is_empty!15201)))

(assert (= (and start!71464 res!565306) b!829940))

(assert (= (and b!829940 res!565310) b!829934))

(assert (= (and b!829934 res!565307) b!829938))

(assert (= (and b!829938 res!565309) b!829936))

(assert (= (and b!829936 res!565308) b!829941))

(assert (= (and b!829941 (not res!565305)) b!829939))

(assert (= (and b!829936 (not res!565304)) b!829935))

(assert (= (and b!829933 condMapEmpty!24451) mapIsEmpty!24451))

(assert (= (and b!829933 (not condMapEmpty!24451)) mapNonEmpty!24451))

(get-info :version)

(assert (= (and mapNonEmpty!24451 ((_ is ValueCellFull!7185) mapValue!24451)) b!829942))

(assert (= (and b!829933 ((_ is ValueCellFull!7185) mapDefault!24451)) b!829937))

(assert (= start!71464 b!829933))

(declare-fun m!772961 () Bool)

(assert (=> mapNonEmpty!24451 m!772961))

(declare-fun m!772963 () Bool)

(assert (=> b!829935 m!772963))

(declare-fun m!772965 () Bool)

(assert (=> b!829935 m!772965))

(assert (=> b!829935 m!772965))

(declare-fun m!772967 () Bool)

(assert (=> b!829935 m!772967))

(declare-fun m!772969 () Bool)

(assert (=> b!829938 m!772969))

(declare-fun m!772971 () Bool)

(assert (=> start!71464 m!772971))

(declare-fun m!772973 () Bool)

(assert (=> start!71464 m!772973))

(declare-fun m!772975 () Bool)

(assert (=> start!71464 m!772975))

(declare-fun m!772977 () Bool)

(assert (=> b!829939 m!772977))

(declare-fun m!772979 () Bool)

(assert (=> b!829939 m!772979))

(assert (=> b!829939 m!772979))

(declare-fun m!772981 () Bool)

(assert (=> b!829939 m!772981))

(declare-fun m!772983 () Bool)

(assert (=> b!829936 m!772983))

(declare-fun m!772985 () Bool)

(assert (=> b!829936 m!772985))

(declare-fun m!772987 () Bool)

(assert (=> b!829936 m!772987))

(declare-fun m!772989 () Bool)

(assert (=> b!829934 m!772989))

(check-sat (not b_next!13491) (not b!829939) tp_is_empty!15201 (not b!829936) b_and!22509 (not mapNonEmpty!24451) (not start!71464) (not b!829935) (not b!829938) (not b!829934))
(check-sat b_and!22509 (not b_next!13491))
(get-model)

(declare-fun b!829981 () Bool)

(declare-fun e!462714 () Bool)

(declare-fun call!36187 () Bool)

(assert (=> b!829981 (= e!462714 call!36187)))

(declare-fun b!829982 () Bool)

(declare-fun e!462713 () Bool)

(assert (=> b!829982 (= e!462713 call!36187)))

(declare-fun b!829983 () Bool)

(declare-fun e!462715 () Bool)

(assert (=> b!829983 (= e!462715 e!462713)))

(declare-fun c!89823 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829983 (= c!89823 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105307 () Bool)

(declare-fun res!565336 () Bool)

(assert (=> d!105307 (=> res!565336 e!462715)))

(assert (=> d!105307 (= res!565336 (bvsge #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(assert (=> d!105307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462715)))

(declare-fun bm!36184 () Bool)

(assert (=> bm!36184 (= call!36187 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!829984 () Bool)

(assert (=> b!829984 (= e!462713 e!462714)))

(declare-fun lt!376498 () (_ BitVec 64))

(assert (=> b!829984 (= lt!376498 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376497 () Unit!28421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46572 (_ BitVec 64) (_ BitVec 32)) Unit!28421)

(assert (=> b!829984 (= lt!376497 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376498 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829984 (arrayContainsKey!0 _keys!976 lt!376498 #b00000000000000000000000000000000)))

(declare-fun lt!376496 () Unit!28421)

(assert (=> b!829984 (= lt!376496 lt!376497)))

(declare-fun res!565337 () Bool)

(declare-datatypes ((SeekEntryResult!8743 0))(
  ( (MissingZero!8743 (index!37343 (_ BitVec 32))) (Found!8743 (index!37344 (_ BitVec 32))) (Intermediate!8743 (undefined!9555 Bool) (index!37345 (_ BitVec 32)) (x!70089 (_ BitVec 32))) (Undefined!8743) (MissingVacant!8743 (index!37346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46572 (_ BitVec 32)) SeekEntryResult!8743)

(assert (=> b!829984 (= res!565337 (= (seekEntryOrOpen!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8743 #b00000000000000000000000000000000)))))

(assert (=> b!829984 (=> (not res!565337) (not e!462714))))

(assert (= (and d!105307 (not res!565336)) b!829983))

(assert (= (and b!829983 c!89823) b!829984))

(assert (= (and b!829983 (not c!89823)) b!829982))

(assert (= (and b!829984 res!565337) b!829981))

(assert (= (or b!829981 b!829982) bm!36184))

(declare-fun m!773021 () Bool)

(assert (=> b!829983 m!773021))

(assert (=> b!829983 m!773021))

(declare-fun m!773023 () Bool)

(assert (=> b!829983 m!773023))

(declare-fun m!773025 () Bool)

(assert (=> bm!36184 m!773025))

(assert (=> b!829984 m!773021))

(declare-fun m!773027 () Bool)

(assert (=> b!829984 m!773027))

(declare-fun m!773029 () Bool)

(assert (=> b!829984 m!773029))

(assert (=> b!829984 m!773021))

(declare-fun m!773031 () Bool)

(assert (=> b!829984 m!773031))

(assert (=> b!829934 d!105307))

(declare-fun d!105309 () Bool)

(declare-fun res!565346 () Bool)

(declare-fun e!462724 () Bool)

(assert (=> d!105309 (=> res!565346 e!462724)))

(assert (=> d!105309 (= res!565346 (bvsge #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(assert (=> d!105309 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15936) e!462724)))

(declare-fun b!829995 () Bool)

(declare-fun e!462727 () Bool)

(declare-fun contains!4205 (List!15939 (_ BitVec 64)) Bool)

(assert (=> b!829995 (= e!462727 (contains!4205 Nil!15936 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829996 () Bool)

(declare-fun e!462725 () Bool)

(declare-fun e!462726 () Bool)

(assert (=> b!829996 (= e!462725 e!462726)))

(declare-fun c!89826 () Bool)

(assert (=> b!829996 (= c!89826 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829997 () Bool)

(declare-fun call!36190 () Bool)

(assert (=> b!829997 (= e!462726 call!36190)))

(declare-fun b!829998 () Bool)

(assert (=> b!829998 (= e!462724 e!462725)))

(declare-fun res!565345 () Bool)

(assert (=> b!829998 (=> (not res!565345) (not e!462725))))

(assert (=> b!829998 (= res!565345 (not e!462727))))

(declare-fun res!565344 () Bool)

(assert (=> b!829998 (=> (not res!565344) (not e!462727))))

(assert (=> b!829998 (= res!565344 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36187 () Bool)

(assert (=> bm!36187 (= call!36190 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89826 (Cons!15935 (select (arr!22323 _keys!976) #b00000000000000000000000000000000) Nil!15936) Nil!15936)))))

(declare-fun b!829999 () Bool)

(assert (=> b!829999 (= e!462726 call!36190)))

(assert (= (and d!105309 (not res!565346)) b!829998))

(assert (= (and b!829998 res!565344) b!829995))

(assert (= (and b!829998 res!565345) b!829996))

(assert (= (and b!829996 c!89826) b!829997))

(assert (= (and b!829996 (not c!89826)) b!829999))

(assert (= (or b!829997 b!829999) bm!36187))

(assert (=> b!829995 m!773021))

(assert (=> b!829995 m!773021))

(declare-fun m!773033 () Bool)

(assert (=> b!829995 m!773033))

(assert (=> b!829996 m!773021))

(assert (=> b!829996 m!773021))

(assert (=> b!829996 m!773023))

(assert (=> b!829998 m!773021))

(assert (=> b!829998 m!773021))

(assert (=> b!829998 m!773023))

(assert (=> bm!36187 m!773021))

(declare-fun m!773035 () Bool)

(assert (=> bm!36187 m!773035))

(assert (=> b!829938 d!105309))

(declare-fun d!105311 () Bool)

(assert (=> d!105311 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71464 d!105311))

(declare-fun d!105313 () Bool)

(assert (=> d!105313 (= (array_inv!17777 _keys!976) (bvsge (size!22744 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71464 d!105313))

(declare-fun d!105315 () Bool)

(assert (=> d!105315 (= (array_inv!17778 _values!788) (bvsge (size!22743 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71464 d!105315))

(declare-fun d!105317 () Bool)

(assert (=> d!105317 (= (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376501 () Unit!28421)

(declare-fun choose!1415 (array!46572 array!46570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25269 V!25269 V!25269 V!25269 (_ BitVec 32) Int) Unit!28421)

(assert (=> d!105317 (= lt!376501 (choose!1415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105317 (validMask!0 mask!1312)))

(assert (=> d!105317 (= (lemmaNoChangeToArrayThenSameMapNoExtras!586 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376501)))

(declare-fun bs!23180 () Bool)

(assert (= bs!23180 d!105317))

(assert (=> bs!23180 m!772987))

(assert (=> bs!23180 m!772985))

(declare-fun m!773037 () Bool)

(assert (=> bs!23180 m!773037))

(assert (=> bs!23180 m!772971))

(assert (=> b!829936 d!105317))

(declare-fun b!830024 () Bool)

(declare-fun e!462743 () ListLongMap!8967)

(declare-fun call!36193 () ListLongMap!8967)

(assert (=> b!830024 (= e!462743 call!36193)))

(declare-fun bm!36190 () Bool)

(assert (=> bm!36190 (= call!36193 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830025 () Bool)

(declare-fun e!462748 () Bool)

(declare-fun e!462742 () Bool)

(assert (=> b!830025 (= e!462748 e!462742)))

(assert (=> b!830025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun res!565356 () Bool)

(declare-fun lt!376520 () ListLongMap!8967)

(declare-fun contains!4206 (ListLongMap!8967 (_ BitVec 64)) Bool)

(assert (=> b!830025 (= res!565356 (contains!4206 lt!376520 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830025 (=> (not res!565356) (not e!462742))))

(declare-fun b!830026 () Bool)

(declare-fun e!462745 () Bool)

(declare-fun isEmpty!653 (ListLongMap!8967) Bool)

(assert (=> b!830026 (= e!462745 (isEmpty!653 lt!376520))))

(declare-fun b!830027 () Bool)

(assert (=> b!830027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(assert (=> b!830027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22743 _values!788)))))

(declare-fun apply!371 (ListLongMap!8967 (_ BitVec 64)) V!25269)

(declare-fun get!11814 (ValueCell!7185 V!25269) V!25269)

(declare-fun dynLambda!982 (Int (_ BitVec 64)) V!25269)

(assert (=> b!830027 (= e!462742 (= (apply!371 lt!376520 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830028 () Bool)

(declare-fun e!462744 () ListLongMap!8967)

(assert (=> b!830028 (= e!462744 e!462743)))

(declare-fun c!89835 () Bool)

(assert (=> b!830028 (= c!89835 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830030 () Bool)

(assert (=> b!830030 (= e!462748 e!462745)))

(declare-fun c!89836 () Bool)

(assert (=> b!830030 (= c!89836 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830031 () Bool)

(assert (=> b!830031 (= e!462744 (ListLongMap!8968 Nil!15935))))

(declare-fun d!105319 () Bool)

(declare-fun e!462747 () Bool)

(assert (=> d!105319 e!462747))

(declare-fun res!565358 () Bool)

(assert (=> d!105319 (=> (not res!565358) (not e!462747))))

(assert (=> d!105319 (= res!565358 (not (contains!4206 lt!376520 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105319 (= lt!376520 e!462744)))

(declare-fun c!89837 () Bool)

(assert (=> d!105319 (= c!89837 (bvsge #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(assert (=> d!105319 (validMask!0 mask!1312)))

(assert (=> d!105319 (= (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376520)))

(declare-fun b!830029 () Bool)

(assert (=> b!830029 (= e!462747 e!462748)))

(declare-fun c!89838 () Bool)

(declare-fun e!462746 () Bool)

(assert (=> b!830029 (= c!89838 e!462746)))

(declare-fun res!565355 () Bool)

(assert (=> b!830029 (=> (not res!565355) (not e!462746))))

(assert (=> b!830029 (= res!565355 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830032 () Bool)

(declare-fun lt!376517 () Unit!28421)

(declare-fun lt!376516 () Unit!28421)

(assert (=> b!830032 (= lt!376517 lt!376516)))

(declare-fun lt!376522 () ListLongMap!8967)

(declare-fun lt!376521 () (_ BitVec 64))

(declare-fun lt!376519 () (_ BitVec 64))

(declare-fun lt!376518 () V!25269)

(assert (=> b!830032 (not (contains!4206 (+!1978 lt!376522 (tuple2!10145 lt!376521 lt!376518)) lt!376519))))

(declare-fun addStillNotContains!196 (ListLongMap!8967 (_ BitVec 64) V!25269 (_ BitVec 64)) Unit!28421)

(assert (=> b!830032 (= lt!376516 (addStillNotContains!196 lt!376522 lt!376521 lt!376518 lt!376519))))

(assert (=> b!830032 (= lt!376519 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830032 (= lt!376518 (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830032 (= lt!376521 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830032 (= lt!376522 call!36193)))

(assert (=> b!830032 (= e!462743 (+!1978 call!36193 (tuple2!10145 (select (arr!22323 _keys!976) #b00000000000000000000000000000000) (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830033 () Bool)

(assert (=> b!830033 (= e!462746 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830033 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830034 () Bool)

(assert (=> b!830034 (= e!462745 (= lt!376520 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830035 () Bool)

(declare-fun res!565357 () Bool)

(assert (=> b!830035 (=> (not res!565357) (not e!462747))))

(assert (=> b!830035 (= res!565357 (not (contains!4206 lt!376520 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105319 c!89837) b!830031))

(assert (= (and d!105319 (not c!89837)) b!830028))

(assert (= (and b!830028 c!89835) b!830032))

(assert (= (and b!830028 (not c!89835)) b!830024))

(assert (= (or b!830032 b!830024) bm!36190))

(assert (= (and d!105319 res!565358) b!830035))

(assert (= (and b!830035 res!565357) b!830029))

(assert (= (and b!830029 res!565355) b!830033))

(assert (= (and b!830029 c!89838) b!830025))

(assert (= (and b!830029 (not c!89838)) b!830030))

(assert (= (and b!830025 res!565356) b!830027))

(assert (= (and b!830030 c!89836) b!830034))

(assert (= (and b!830030 (not c!89836)) b!830026))

(declare-fun b_lambda!11323 () Bool)

(assert (=> (not b_lambda!11323) (not b!830027)))

(declare-fun t!22306 () Bool)

(declare-fun tb!4223 () Bool)

(assert (=> (and start!71464 (= defaultEntry!796 defaultEntry!796) t!22306) tb!4223))

(declare-fun result!8009 () Bool)

(assert (=> tb!4223 (= result!8009 tp_is_empty!15201)))

(assert (=> b!830027 t!22306))

(declare-fun b_and!22513 () Bool)

(assert (= b_and!22509 (and (=> t!22306 result!8009) b_and!22513)))

(declare-fun b_lambda!11325 () Bool)

(assert (=> (not b_lambda!11325) (not b!830032)))

(assert (=> b!830032 t!22306))

(declare-fun b_and!22515 () Bool)

(assert (= b_and!22513 (and (=> t!22306 result!8009) b_and!22515)))

(declare-fun m!773039 () Bool)

(assert (=> b!830026 m!773039))

(assert (=> b!830025 m!773021))

(assert (=> b!830025 m!773021))

(declare-fun m!773041 () Bool)

(assert (=> b!830025 m!773041))

(assert (=> b!830033 m!773021))

(assert (=> b!830033 m!773021))

(assert (=> b!830033 m!773023))

(declare-fun m!773043 () Bool)

(assert (=> bm!36190 m!773043))

(declare-fun m!773045 () Bool)

(assert (=> b!830035 m!773045))

(declare-fun m!773047 () Bool)

(assert (=> d!105319 m!773047))

(assert (=> d!105319 m!772971))

(assert (=> b!830034 m!773043))

(assert (=> b!830028 m!773021))

(assert (=> b!830028 m!773021))

(assert (=> b!830028 m!773023))

(declare-fun m!773049 () Bool)

(assert (=> b!830027 m!773049))

(assert (=> b!830027 m!773021))

(declare-fun m!773051 () Bool)

(assert (=> b!830027 m!773051))

(assert (=> b!830027 m!773049))

(declare-fun m!773053 () Bool)

(assert (=> b!830027 m!773053))

(declare-fun m!773055 () Bool)

(assert (=> b!830027 m!773055))

(assert (=> b!830027 m!773053))

(assert (=> b!830027 m!773021))

(assert (=> b!830032 m!773049))

(assert (=> b!830032 m!773053))

(assert (=> b!830032 m!773055))

(declare-fun m!773057 () Bool)

(assert (=> b!830032 m!773057))

(assert (=> b!830032 m!773053))

(assert (=> b!830032 m!773021))

(assert (=> b!830032 m!773049))

(declare-fun m!773059 () Bool)

(assert (=> b!830032 m!773059))

(declare-fun m!773061 () Bool)

(assert (=> b!830032 m!773061))

(declare-fun m!773063 () Bool)

(assert (=> b!830032 m!773063))

(assert (=> b!830032 m!773059))

(assert (=> b!829936 d!105319))

(declare-fun b!830038 () Bool)

(declare-fun e!462750 () ListLongMap!8967)

(declare-fun call!36194 () ListLongMap!8967)

(assert (=> b!830038 (= e!462750 call!36194)))

(declare-fun bm!36191 () Bool)

(assert (=> bm!36191 (= call!36194 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!830039 () Bool)

(declare-fun e!462755 () Bool)

(declare-fun e!462749 () Bool)

(assert (=> b!830039 (= e!462755 e!462749)))

(assert (=> b!830039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun res!565360 () Bool)

(declare-fun lt!376527 () ListLongMap!8967)

(assert (=> b!830039 (= res!565360 (contains!4206 lt!376527 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830039 (=> (not res!565360) (not e!462749))))

(declare-fun b!830040 () Bool)

(declare-fun e!462752 () Bool)

(assert (=> b!830040 (= e!462752 (isEmpty!653 lt!376527))))

(declare-fun b!830041 () Bool)

(assert (=> b!830041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(assert (=> b!830041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22743 _values!788)))))

(assert (=> b!830041 (= e!462749 (= (apply!371 lt!376527 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!830042 () Bool)

(declare-fun e!462751 () ListLongMap!8967)

(assert (=> b!830042 (= e!462751 e!462750)))

(declare-fun c!89839 () Bool)

(assert (=> b!830042 (= c!89839 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830044 () Bool)

(assert (=> b!830044 (= e!462755 e!462752)))

(declare-fun c!89840 () Bool)

(assert (=> b!830044 (= c!89840 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830045 () Bool)

(assert (=> b!830045 (= e!462751 (ListLongMap!8968 Nil!15935))))

(declare-fun d!105321 () Bool)

(declare-fun e!462754 () Bool)

(assert (=> d!105321 e!462754))

(declare-fun res!565362 () Bool)

(assert (=> d!105321 (=> (not res!565362) (not e!462754))))

(assert (=> d!105321 (= res!565362 (not (contains!4206 lt!376527 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105321 (= lt!376527 e!462751)))

(declare-fun c!89841 () Bool)

(assert (=> d!105321 (= c!89841 (bvsge #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(assert (=> d!105321 (validMask!0 mask!1312)))

(assert (=> d!105321 (= (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376527)))

(declare-fun b!830043 () Bool)

(assert (=> b!830043 (= e!462754 e!462755)))

(declare-fun c!89842 () Bool)

(declare-fun e!462753 () Bool)

(assert (=> b!830043 (= c!89842 e!462753)))

(declare-fun res!565359 () Bool)

(assert (=> b!830043 (=> (not res!565359) (not e!462753))))

(assert (=> b!830043 (= res!565359 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830046 () Bool)

(declare-fun lt!376524 () Unit!28421)

(declare-fun lt!376523 () Unit!28421)

(assert (=> b!830046 (= lt!376524 lt!376523)))

(declare-fun lt!376528 () (_ BitVec 64))

(declare-fun lt!376529 () ListLongMap!8967)

(declare-fun lt!376526 () (_ BitVec 64))

(declare-fun lt!376525 () V!25269)

(assert (=> b!830046 (not (contains!4206 (+!1978 lt!376529 (tuple2!10145 lt!376528 lt!376525)) lt!376526))))

(assert (=> b!830046 (= lt!376523 (addStillNotContains!196 lt!376529 lt!376528 lt!376525 lt!376526))))

(assert (=> b!830046 (= lt!376526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!830046 (= lt!376525 (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!830046 (= lt!376528 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830046 (= lt!376529 call!36194)))

(assert (=> b!830046 (= e!462750 (+!1978 call!36194 (tuple2!10145 (select (arr!22323 _keys!976) #b00000000000000000000000000000000) (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!830047 () Bool)

(assert (=> b!830047 (= e!462753 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830047 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!830048 () Bool)

(assert (=> b!830048 (= e!462752 (= lt!376527 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!830049 () Bool)

(declare-fun res!565361 () Bool)

(assert (=> b!830049 (=> (not res!565361) (not e!462754))))

(assert (=> b!830049 (= res!565361 (not (contains!4206 lt!376527 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105321 c!89841) b!830045))

(assert (= (and d!105321 (not c!89841)) b!830042))

(assert (= (and b!830042 c!89839) b!830046))

(assert (= (and b!830042 (not c!89839)) b!830038))

(assert (= (or b!830046 b!830038) bm!36191))

(assert (= (and d!105321 res!565362) b!830049))

(assert (= (and b!830049 res!565361) b!830043))

(assert (= (and b!830043 res!565359) b!830047))

(assert (= (and b!830043 c!89842) b!830039))

(assert (= (and b!830043 (not c!89842)) b!830044))

(assert (= (and b!830039 res!565360) b!830041))

(assert (= (and b!830044 c!89840) b!830048))

(assert (= (and b!830044 (not c!89840)) b!830040))

(declare-fun b_lambda!11327 () Bool)

(assert (=> (not b_lambda!11327) (not b!830041)))

(assert (=> b!830041 t!22306))

(declare-fun b_and!22517 () Bool)

(assert (= b_and!22515 (and (=> t!22306 result!8009) b_and!22517)))

(declare-fun b_lambda!11329 () Bool)

(assert (=> (not b_lambda!11329) (not b!830046)))

(assert (=> b!830046 t!22306))

(declare-fun b_and!22519 () Bool)

(assert (= b_and!22517 (and (=> t!22306 result!8009) b_and!22519)))

(declare-fun m!773065 () Bool)

(assert (=> b!830040 m!773065))

(assert (=> b!830039 m!773021))

(assert (=> b!830039 m!773021))

(declare-fun m!773067 () Bool)

(assert (=> b!830039 m!773067))

(assert (=> b!830047 m!773021))

(assert (=> b!830047 m!773021))

(assert (=> b!830047 m!773023))

(declare-fun m!773069 () Bool)

(assert (=> bm!36191 m!773069))

(declare-fun m!773071 () Bool)

(assert (=> b!830049 m!773071))

(declare-fun m!773073 () Bool)

(assert (=> d!105321 m!773073))

(assert (=> d!105321 m!772971))

(assert (=> b!830048 m!773069))

(assert (=> b!830042 m!773021))

(assert (=> b!830042 m!773021))

(assert (=> b!830042 m!773023))

(assert (=> b!830041 m!773049))

(assert (=> b!830041 m!773021))

(declare-fun m!773075 () Bool)

(assert (=> b!830041 m!773075))

(assert (=> b!830041 m!773049))

(assert (=> b!830041 m!773053))

(assert (=> b!830041 m!773055))

(assert (=> b!830041 m!773053))

(assert (=> b!830041 m!773021))

(assert (=> b!830046 m!773049))

(assert (=> b!830046 m!773053))

(assert (=> b!830046 m!773055))

(declare-fun m!773077 () Bool)

(assert (=> b!830046 m!773077))

(assert (=> b!830046 m!773053))

(assert (=> b!830046 m!773021))

(assert (=> b!830046 m!773049))

(declare-fun m!773079 () Bool)

(assert (=> b!830046 m!773079))

(declare-fun m!773081 () Bool)

(assert (=> b!830046 m!773081))

(declare-fun m!773083 () Bool)

(assert (=> b!830046 m!773083))

(assert (=> b!830046 m!773079))

(assert (=> b!829936 d!105321))

(declare-fun b!830092 () Bool)

(declare-fun e!462782 () Bool)

(assert (=> b!830092 (= e!462782 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830093 () Bool)

(declare-fun e!462791 () Unit!28421)

(declare-fun Unit!28425 () Unit!28421)

(assert (=> b!830093 (= e!462791 Unit!28425)))

(declare-fun b!830094 () Bool)

(declare-fun e!462790 () ListLongMap!8967)

(declare-fun call!36215 () ListLongMap!8967)

(assert (=> b!830094 (= e!462790 call!36215)))

(declare-fun b!830095 () Bool)

(declare-fun e!462786 () Bool)

(declare-fun e!462787 () Bool)

(assert (=> b!830095 (= e!462786 e!462787)))

(declare-fun c!89858 () Bool)

(assert (=> b!830095 (= c!89858 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830096 () Bool)

(declare-fun e!462784 () ListLongMap!8967)

(declare-fun call!36209 () ListLongMap!8967)

(assert (=> b!830096 (= e!462784 call!36209)))

(declare-fun b!830097 () Bool)

(declare-fun e!462788 () Bool)

(assert (=> b!830097 (= e!462787 e!462788)))

(declare-fun res!565388 () Bool)

(declare-fun call!36213 () Bool)

(assert (=> b!830097 (= res!565388 call!36213)))

(assert (=> b!830097 (=> (not res!565388) (not e!462788))))

(declare-fun b!830098 () Bool)

(declare-fun e!462794 () Bool)

(declare-fun e!462783 () Bool)

(assert (=> b!830098 (= e!462794 e!462783)))

(declare-fun res!565384 () Bool)

(assert (=> b!830098 (=> (not res!565384) (not e!462783))))

(declare-fun lt!376583 () ListLongMap!8967)

(assert (=> b!830098 (= res!565384 (contains!4206 lt!376583 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830099 () Bool)

(declare-fun res!565387 () Bool)

(assert (=> b!830099 (=> (not res!565387) (not e!462786))))

(assert (=> b!830099 (= res!565387 e!462794)))

(declare-fun res!565386 () Bool)

(assert (=> b!830099 (=> res!565386 e!462794)))

(declare-fun e!462792 () Bool)

(assert (=> b!830099 (= res!565386 (not e!462792))))

(declare-fun res!565383 () Bool)

(assert (=> b!830099 (=> (not res!565383) (not e!462792))))

(assert (=> b!830099 (= res!565383 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun d!105323 () Bool)

(assert (=> d!105323 e!462786))

(declare-fun res!565385 () Bool)

(assert (=> d!105323 (=> (not res!565385) (not e!462786))))

(assert (=> d!105323 (= res!565385 (or (bvsge #b00000000000000000000000000000000 (size!22744 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))))

(declare-fun lt!376585 () ListLongMap!8967)

(assert (=> d!105323 (= lt!376583 lt!376585)))

(declare-fun lt!376590 () Unit!28421)

(assert (=> d!105323 (= lt!376590 e!462791)))

(declare-fun c!89859 () Bool)

(assert (=> d!105323 (= c!89859 e!462782)))

(declare-fun res!565389 () Bool)

(assert (=> d!105323 (=> (not res!565389) (not e!462782))))

(assert (=> d!105323 (= res!565389 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun e!462785 () ListLongMap!8967)

(assert (=> d!105323 (= lt!376585 e!462785)))

(declare-fun c!89857 () Bool)

(assert (=> d!105323 (= c!89857 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105323 (validMask!0 mask!1312)))

(assert (=> d!105323 (= (getCurrentListMap!2596 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376583)))

(declare-fun b!830100 () Bool)

(declare-fun lt!376578 () Unit!28421)

(assert (=> b!830100 (= e!462791 lt!376578)))

(declare-fun lt!376580 () ListLongMap!8967)

(assert (=> b!830100 (= lt!376580 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376576 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376587 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376587 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376574 () Unit!28421)

(declare-fun addStillContains!322 (ListLongMap!8967 (_ BitVec 64) V!25269 (_ BitVec 64)) Unit!28421)

(assert (=> b!830100 (= lt!376574 (addStillContains!322 lt!376580 lt!376576 zeroValueBefore!34 lt!376587))))

(assert (=> b!830100 (contains!4206 (+!1978 lt!376580 (tuple2!10145 lt!376576 zeroValueBefore!34)) lt!376587)))

(declare-fun lt!376582 () Unit!28421)

(assert (=> b!830100 (= lt!376582 lt!376574)))

(declare-fun lt!376581 () ListLongMap!8967)

(assert (=> b!830100 (= lt!376581 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376588 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376588 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376595 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376595 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376586 () Unit!28421)

(declare-fun addApplyDifferent!322 (ListLongMap!8967 (_ BitVec 64) V!25269 (_ BitVec 64)) Unit!28421)

(assert (=> b!830100 (= lt!376586 (addApplyDifferent!322 lt!376581 lt!376588 minValue!754 lt!376595))))

(assert (=> b!830100 (= (apply!371 (+!1978 lt!376581 (tuple2!10145 lt!376588 minValue!754)) lt!376595) (apply!371 lt!376581 lt!376595))))

(declare-fun lt!376575 () Unit!28421)

(assert (=> b!830100 (= lt!376575 lt!376586)))

(declare-fun lt!376584 () ListLongMap!8967)

(assert (=> b!830100 (= lt!376584 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376594 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376577 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376577 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376593 () Unit!28421)

(assert (=> b!830100 (= lt!376593 (addApplyDifferent!322 lt!376584 lt!376594 zeroValueBefore!34 lt!376577))))

(assert (=> b!830100 (= (apply!371 (+!1978 lt!376584 (tuple2!10145 lt!376594 zeroValueBefore!34)) lt!376577) (apply!371 lt!376584 lt!376577))))

(declare-fun lt!376591 () Unit!28421)

(assert (=> b!830100 (= lt!376591 lt!376593)))

(declare-fun lt!376592 () ListLongMap!8967)

(assert (=> b!830100 (= lt!376592 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376579 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376579 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376589 () (_ BitVec 64))

(assert (=> b!830100 (= lt!376589 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830100 (= lt!376578 (addApplyDifferent!322 lt!376592 lt!376579 minValue!754 lt!376589))))

(assert (=> b!830100 (= (apply!371 (+!1978 lt!376592 (tuple2!10145 lt!376579 minValue!754)) lt!376589) (apply!371 lt!376592 lt!376589))))

(declare-fun bm!36206 () Bool)

(declare-fun call!36212 () ListLongMap!8967)

(assert (=> bm!36206 (= call!36215 call!36212)))

(declare-fun b!830101 () Bool)

(assert (=> b!830101 (= e!462792 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830102 () Bool)

(declare-fun c!89860 () Bool)

(assert (=> b!830102 (= c!89860 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830102 (= e!462784 e!462790)))

(declare-fun b!830103 () Bool)

(assert (=> b!830103 (= e!462785 e!462784)))

(declare-fun c!89855 () Bool)

(assert (=> b!830103 (= c!89855 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830104 () Bool)

(declare-fun call!36210 () ListLongMap!8967)

(assert (=> b!830104 (= e!462785 (+!1978 call!36210 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36207 () Bool)

(declare-fun call!36214 () Bool)

(assert (=> bm!36207 (= call!36214 (contains!4206 lt!376583 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830105 () Bool)

(declare-fun e!462793 () Bool)

(assert (=> b!830105 (= e!462793 (= (apply!371 lt!376583 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun call!36211 () ListLongMap!8967)

(declare-fun bm!36208 () Bool)

(assert (=> bm!36208 (= call!36210 (+!1978 (ite c!89857 call!36211 (ite c!89855 call!36212 call!36215)) (ite (or c!89857 c!89855) (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830106 () Bool)

(assert (=> b!830106 (= e!462788 (= (apply!371 lt!376583 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830107 () Bool)

(assert (=> b!830107 (= e!462790 call!36209)))

(declare-fun bm!36209 () Bool)

(assert (=> bm!36209 (= call!36212 call!36211)))

(declare-fun bm!36210 () Bool)

(assert (=> bm!36210 (= call!36213 (contains!4206 lt!376583 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36211 () Bool)

(assert (=> bm!36211 (= call!36211 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830108 () Bool)

(assert (=> b!830108 (= e!462783 (= (apply!371 lt!376583 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22743 _values!788)))))

(assert (=> b!830108 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830109 () Bool)

(assert (=> b!830109 (= e!462787 (not call!36213))))

(declare-fun b!830110 () Bool)

(declare-fun e!462789 () Bool)

(assert (=> b!830110 (= e!462789 (not call!36214))))

(declare-fun b!830111 () Bool)

(declare-fun res!565382 () Bool)

(assert (=> b!830111 (=> (not res!565382) (not e!462786))))

(assert (=> b!830111 (= res!565382 e!462789)))

(declare-fun c!89856 () Bool)

(assert (=> b!830111 (= c!89856 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830112 () Bool)

(assert (=> b!830112 (= e!462789 e!462793)))

(declare-fun res!565381 () Bool)

(assert (=> b!830112 (= res!565381 call!36214)))

(assert (=> b!830112 (=> (not res!565381) (not e!462793))))

(declare-fun bm!36212 () Bool)

(assert (=> bm!36212 (= call!36209 call!36210)))

(assert (= (and d!105323 c!89857) b!830104))

(assert (= (and d!105323 (not c!89857)) b!830103))

(assert (= (and b!830103 c!89855) b!830096))

(assert (= (and b!830103 (not c!89855)) b!830102))

(assert (= (and b!830102 c!89860) b!830107))

(assert (= (and b!830102 (not c!89860)) b!830094))

(assert (= (or b!830107 b!830094) bm!36206))

(assert (= (or b!830096 bm!36206) bm!36209))

(assert (= (or b!830096 b!830107) bm!36212))

(assert (= (or b!830104 bm!36209) bm!36211))

(assert (= (or b!830104 bm!36212) bm!36208))

(assert (= (and d!105323 res!565389) b!830092))

(assert (= (and d!105323 c!89859) b!830100))

(assert (= (and d!105323 (not c!89859)) b!830093))

(assert (= (and d!105323 res!565385) b!830099))

(assert (= (and b!830099 res!565383) b!830101))

(assert (= (and b!830099 (not res!565386)) b!830098))

(assert (= (and b!830098 res!565384) b!830108))

(assert (= (and b!830099 res!565387) b!830111))

(assert (= (and b!830111 c!89856) b!830112))

(assert (= (and b!830111 (not c!89856)) b!830110))

(assert (= (and b!830112 res!565381) b!830105))

(assert (= (or b!830112 b!830110) bm!36207))

(assert (= (and b!830111 res!565382) b!830095))

(assert (= (and b!830095 c!89858) b!830097))

(assert (= (and b!830095 (not c!89858)) b!830109))

(assert (= (and b!830097 res!565388) b!830106))

(assert (= (or b!830097 b!830109) bm!36210))

(declare-fun b_lambda!11331 () Bool)

(assert (=> (not b_lambda!11331) (not b!830108)))

(assert (=> b!830108 t!22306))

(declare-fun b_and!22521 () Bool)

(assert (= b_and!22519 (and (=> t!22306 result!8009) b_and!22521)))

(assert (=> bm!36211 m!772987))

(assert (=> d!105323 m!772971))

(assert (=> b!830098 m!773021))

(assert (=> b!830098 m!773021))

(declare-fun m!773085 () Bool)

(assert (=> b!830098 m!773085))

(declare-fun m!773087 () Bool)

(assert (=> b!830100 m!773087))

(declare-fun m!773089 () Bool)

(assert (=> b!830100 m!773089))

(declare-fun m!773091 () Bool)

(assert (=> b!830100 m!773091))

(declare-fun m!773093 () Bool)

(assert (=> b!830100 m!773093))

(declare-fun m!773095 () Bool)

(assert (=> b!830100 m!773095))

(declare-fun m!773097 () Bool)

(assert (=> b!830100 m!773097))

(assert (=> b!830100 m!773021))

(declare-fun m!773099 () Bool)

(assert (=> b!830100 m!773099))

(declare-fun m!773101 () Bool)

(assert (=> b!830100 m!773101))

(declare-fun m!773103 () Bool)

(assert (=> b!830100 m!773103))

(assert (=> b!830100 m!773091))

(assert (=> b!830100 m!773089))

(declare-fun m!773105 () Bool)

(assert (=> b!830100 m!773105))

(assert (=> b!830100 m!772987))

(declare-fun m!773107 () Bool)

(assert (=> b!830100 m!773107))

(declare-fun m!773109 () Bool)

(assert (=> b!830100 m!773109))

(declare-fun m!773111 () Bool)

(assert (=> b!830100 m!773111))

(assert (=> b!830100 m!773107))

(declare-fun m!773113 () Bool)

(assert (=> b!830100 m!773113))

(assert (=> b!830100 m!773095))

(declare-fun m!773115 () Bool)

(assert (=> b!830100 m!773115))

(assert (=> b!830108 m!773049))

(assert (=> b!830108 m!773021))

(declare-fun m!773117 () Bool)

(assert (=> b!830108 m!773117))

(assert (=> b!830108 m!773021))

(assert (=> b!830108 m!773053))

(assert (=> b!830108 m!773049))

(assert (=> b!830108 m!773053))

(assert (=> b!830108 m!773055))

(assert (=> b!830101 m!773021))

(assert (=> b!830101 m!773021))

(assert (=> b!830101 m!773023))

(assert (=> b!830092 m!773021))

(assert (=> b!830092 m!773021))

(assert (=> b!830092 m!773023))

(declare-fun m!773119 () Bool)

(assert (=> b!830104 m!773119))

(declare-fun m!773121 () Bool)

(assert (=> bm!36210 m!773121))

(declare-fun m!773123 () Bool)

(assert (=> b!830105 m!773123))

(declare-fun m!773125 () Bool)

(assert (=> bm!36207 m!773125))

(declare-fun m!773127 () Bool)

(assert (=> b!830106 m!773127))

(declare-fun m!773129 () Bool)

(assert (=> bm!36208 m!773129))

(assert (=> b!829939 d!105323))

(declare-fun d!105325 () Bool)

(declare-fun e!462797 () Bool)

(assert (=> d!105325 e!462797))

(declare-fun res!565394 () Bool)

(assert (=> d!105325 (=> (not res!565394) (not e!462797))))

(declare-fun lt!376605 () ListLongMap!8967)

(assert (=> d!105325 (= res!565394 (contains!4206 lt!376605 (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376604 () List!15938)

(assert (=> d!105325 (= lt!376605 (ListLongMap!8968 lt!376604))))

(declare-fun lt!376607 () Unit!28421)

(declare-fun lt!376606 () Unit!28421)

(assert (=> d!105325 (= lt!376607 lt!376606)))

(declare-datatypes ((Option!420 0))(
  ( (Some!419 (v!10091 V!25269)) (None!418) )
))
(declare-fun getValueByKey!414 (List!15938 (_ BitVec 64)) Option!420)

(assert (=> d!105325 (= (getValueByKey!414 lt!376604 (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!228 (List!15938 (_ BitVec 64) V!25269) Unit!28421)

(assert (=> d!105325 (= lt!376606 (lemmaContainsTupThenGetReturnValue!228 lt!376604 (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!267 (List!15938 (_ BitVec 64) V!25269) List!15938)

(assert (=> d!105325 (= lt!376604 (insertStrictlySorted!267 (toList!4499 (+!1978 lt!376479 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105325 (= (+!1978 (+!1978 lt!376479 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376605)))

(declare-fun b!830117 () Bool)

(declare-fun res!565395 () Bool)

(assert (=> b!830117 (=> (not res!565395) (not e!462797))))

(assert (=> b!830117 (= res!565395 (= (getValueByKey!414 (toList!4499 lt!376605) (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830118 () Bool)

(declare-fun contains!4207 (List!15938 tuple2!10144) Bool)

(assert (=> b!830118 (= e!462797 (contains!4207 (toList!4499 lt!376605) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105325 res!565394) b!830117))

(assert (= (and b!830117 res!565395) b!830118))

(declare-fun m!773131 () Bool)

(assert (=> d!105325 m!773131))

(declare-fun m!773133 () Bool)

(assert (=> d!105325 m!773133))

(declare-fun m!773135 () Bool)

(assert (=> d!105325 m!773135))

(declare-fun m!773137 () Bool)

(assert (=> d!105325 m!773137))

(declare-fun m!773139 () Bool)

(assert (=> b!830117 m!773139))

(declare-fun m!773141 () Bool)

(assert (=> b!830118 m!773141))

(assert (=> b!829939 d!105325))

(declare-fun d!105327 () Bool)

(declare-fun e!462798 () Bool)

(assert (=> d!105327 e!462798))

(declare-fun res!565396 () Bool)

(assert (=> d!105327 (=> (not res!565396) (not e!462798))))

(declare-fun lt!376609 () ListLongMap!8967)

(assert (=> d!105327 (= res!565396 (contains!4206 lt!376609 (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!376608 () List!15938)

(assert (=> d!105327 (= lt!376609 (ListLongMap!8968 lt!376608))))

(declare-fun lt!376611 () Unit!28421)

(declare-fun lt!376610 () Unit!28421)

(assert (=> d!105327 (= lt!376611 lt!376610)))

(assert (=> d!105327 (= (getValueByKey!414 lt!376608 (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!419 (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105327 (= lt!376610 (lemmaContainsTupThenGetReturnValue!228 lt!376608 (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105327 (= lt!376608 (insertStrictlySorted!267 (toList!4499 lt!376479) (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105327 (= (+!1978 lt!376479 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!376609)))

(declare-fun b!830119 () Bool)

(declare-fun res!565397 () Bool)

(assert (=> b!830119 (=> (not res!565397) (not e!462798))))

(assert (=> b!830119 (= res!565397 (= (getValueByKey!414 (toList!4499 lt!376609) (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!419 (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!830120 () Bool)

(assert (=> b!830120 (= e!462798 (contains!4207 (toList!4499 lt!376609) (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105327 res!565396) b!830119))

(assert (= (and b!830119 res!565397) b!830120))

(declare-fun m!773143 () Bool)

(assert (=> d!105327 m!773143))

(declare-fun m!773145 () Bool)

(assert (=> d!105327 m!773145))

(declare-fun m!773147 () Bool)

(assert (=> d!105327 m!773147))

(declare-fun m!773149 () Bool)

(assert (=> d!105327 m!773149))

(declare-fun m!773151 () Bool)

(assert (=> b!830119 m!773151))

(declare-fun m!773153 () Bool)

(assert (=> b!830120 m!773153))

(assert (=> b!829939 d!105327))

(declare-fun b!830121 () Bool)

(declare-fun e!462799 () Bool)

(assert (=> b!830121 (= e!462799 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830122 () Bool)

(declare-fun e!462808 () Unit!28421)

(declare-fun Unit!28426 () Unit!28421)

(assert (=> b!830122 (= e!462808 Unit!28426)))

(declare-fun b!830123 () Bool)

(declare-fun e!462807 () ListLongMap!8967)

(declare-fun call!36222 () ListLongMap!8967)

(assert (=> b!830123 (= e!462807 call!36222)))

(declare-fun b!830124 () Bool)

(declare-fun e!462803 () Bool)

(declare-fun e!462804 () Bool)

(assert (=> b!830124 (= e!462803 e!462804)))

(declare-fun c!89864 () Bool)

(assert (=> b!830124 (= c!89864 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830125 () Bool)

(declare-fun e!462801 () ListLongMap!8967)

(declare-fun call!36216 () ListLongMap!8967)

(assert (=> b!830125 (= e!462801 call!36216)))

(declare-fun b!830126 () Bool)

(declare-fun e!462805 () Bool)

(assert (=> b!830126 (= e!462804 e!462805)))

(declare-fun res!565405 () Bool)

(declare-fun call!36220 () Bool)

(assert (=> b!830126 (= res!565405 call!36220)))

(assert (=> b!830126 (=> (not res!565405) (not e!462805))))

(declare-fun b!830127 () Bool)

(declare-fun e!462811 () Bool)

(declare-fun e!462800 () Bool)

(assert (=> b!830127 (= e!462811 e!462800)))

(declare-fun res!565401 () Bool)

(assert (=> b!830127 (=> (not res!565401) (not e!462800))))

(declare-fun lt!376621 () ListLongMap!8967)

(assert (=> b!830127 (= res!565401 (contains!4206 lt!376621 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!830127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830128 () Bool)

(declare-fun res!565404 () Bool)

(assert (=> b!830128 (=> (not res!565404) (not e!462803))))

(assert (=> b!830128 (= res!565404 e!462811)))

(declare-fun res!565403 () Bool)

(assert (=> b!830128 (=> res!565403 e!462811)))

(declare-fun e!462809 () Bool)

(assert (=> b!830128 (= res!565403 (not e!462809))))

(declare-fun res!565400 () Bool)

(assert (=> b!830128 (=> (not res!565400) (not e!462809))))

(assert (=> b!830128 (= res!565400 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun d!105329 () Bool)

(assert (=> d!105329 e!462803))

(declare-fun res!565402 () Bool)

(assert (=> d!105329 (=> (not res!565402) (not e!462803))))

(assert (=> d!105329 (= res!565402 (or (bvsge #b00000000000000000000000000000000 (size!22744 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))))

(declare-fun lt!376623 () ListLongMap!8967)

(assert (=> d!105329 (= lt!376621 lt!376623)))

(declare-fun lt!376628 () Unit!28421)

(assert (=> d!105329 (= lt!376628 e!462808)))

(declare-fun c!89865 () Bool)

(assert (=> d!105329 (= c!89865 e!462799)))

(declare-fun res!565406 () Bool)

(assert (=> d!105329 (=> (not res!565406) (not e!462799))))

(assert (=> d!105329 (= res!565406 (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun e!462802 () ListLongMap!8967)

(assert (=> d!105329 (= lt!376623 e!462802)))

(declare-fun c!89863 () Bool)

(assert (=> d!105329 (= c!89863 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105329 (validMask!0 mask!1312)))

(assert (=> d!105329 (= (getCurrentListMap!2596 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376621)))

(declare-fun b!830129 () Bool)

(declare-fun lt!376616 () Unit!28421)

(assert (=> b!830129 (= e!462808 lt!376616)))

(declare-fun lt!376618 () ListLongMap!8967)

(assert (=> b!830129 (= lt!376618 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376614 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376625 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376625 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376612 () Unit!28421)

(assert (=> b!830129 (= lt!376612 (addStillContains!322 lt!376618 lt!376614 zeroValueAfter!34 lt!376625))))

(assert (=> b!830129 (contains!4206 (+!1978 lt!376618 (tuple2!10145 lt!376614 zeroValueAfter!34)) lt!376625)))

(declare-fun lt!376620 () Unit!28421)

(assert (=> b!830129 (= lt!376620 lt!376612)))

(declare-fun lt!376619 () ListLongMap!8967)

(assert (=> b!830129 (= lt!376619 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376626 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376626 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376633 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376633 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376624 () Unit!28421)

(assert (=> b!830129 (= lt!376624 (addApplyDifferent!322 lt!376619 lt!376626 minValue!754 lt!376633))))

(assert (=> b!830129 (= (apply!371 (+!1978 lt!376619 (tuple2!10145 lt!376626 minValue!754)) lt!376633) (apply!371 lt!376619 lt!376633))))

(declare-fun lt!376613 () Unit!28421)

(assert (=> b!830129 (= lt!376613 lt!376624)))

(declare-fun lt!376622 () ListLongMap!8967)

(assert (=> b!830129 (= lt!376622 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376632 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376615 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376615 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376631 () Unit!28421)

(assert (=> b!830129 (= lt!376631 (addApplyDifferent!322 lt!376622 lt!376632 zeroValueAfter!34 lt!376615))))

(assert (=> b!830129 (= (apply!371 (+!1978 lt!376622 (tuple2!10145 lt!376632 zeroValueAfter!34)) lt!376615) (apply!371 lt!376622 lt!376615))))

(declare-fun lt!376629 () Unit!28421)

(assert (=> b!830129 (= lt!376629 lt!376631)))

(declare-fun lt!376630 () ListLongMap!8967)

(assert (=> b!830129 (= lt!376630 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376617 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376617 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376627 () (_ BitVec 64))

(assert (=> b!830129 (= lt!376627 (select (arr!22323 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!830129 (= lt!376616 (addApplyDifferent!322 lt!376630 lt!376617 minValue!754 lt!376627))))

(assert (=> b!830129 (= (apply!371 (+!1978 lt!376630 (tuple2!10145 lt!376617 minValue!754)) lt!376627) (apply!371 lt!376630 lt!376627))))

(declare-fun bm!36213 () Bool)

(declare-fun call!36219 () ListLongMap!8967)

(assert (=> bm!36213 (= call!36222 call!36219)))

(declare-fun b!830130 () Bool)

(assert (=> b!830130 (= e!462809 (validKeyInArray!0 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!830131 () Bool)

(declare-fun c!89866 () Bool)

(assert (=> b!830131 (= c!89866 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!830131 (= e!462801 e!462807)))

(declare-fun b!830132 () Bool)

(assert (=> b!830132 (= e!462802 e!462801)))

(declare-fun c!89861 () Bool)

(assert (=> b!830132 (= c!89861 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!830133 () Bool)

(declare-fun call!36217 () ListLongMap!8967)

(assert (=> b!830133 (= e!462802 (+!1978 call!36217 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!36214 () Bool)

(declare-fun call!36221 () Bool)

(assert (=> bm!36214 (= call!36221 (contains!4206 lt!376621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!830134 () Bool)

(declare-fun e!462810 () Bool)

(assert (=> b!830134 (= e!462810 (= (apply!371 lt!376621 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun call!36218 () ListLongMap!8967)

(declare-fun bm!36215 () Bool)

(assert (=> bm!36215 (= call!36217 (+!1978 (ite c!89863 call!36218 (ite c!89861 call!36219 call!36222)) (ite (or c!89863 c!89861) (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!830135 () Bool)

(assert (=> b!830135 (= e!462805 (= (apply!371 lt!376621 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!830136 () Bool)

(assert (=> b!830136 (= e!462807 call!36216)))

(declare-fun bm!36216 () Bool)

(assert (=> bm!36216 (= call!36219 call!36218)))

(declare-fun bm!36217 () Bool)

(assert (=> bm!36217 (= call!36220 (contains!4206 lt!376621 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36218 () Bool)

(assert (=> bm!36218 (= call!36218 (getCurrentListMapNoExtraKeys!2498 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830137 () Bool)

(assert (=> b!830137 (= e!462800 (= (apply!371 lt!376621 (select (arr!22323 _keys!976) #b00000000000000000000000000000000)) (get!11814 (select (arr!22322 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!830137 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22743 _values!788)))))

(assert (=> b!830137 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22744 _keys!976)))))

(declare-fun b!830138 () Bool)

(assert (=> b!830138 (= e!462804 (not call!36220))))

(declare-fun b!830139 () Bool)

(declare-fun e!462806 () Bool)

(assert (=> b!830139 (= e!462806 (not call!36221))))

(declare-fun b!830140 () Bool)

(declare-fun res!565399 () Bool)

(assert (=> b!830140 (=> (not res!565399) (not e!462803))))

(assert (=> b!830140 (= res!565399 e!462806)))

(declare-fun c!89862 () Bool)

(assert (=> b!830140 (= c!89862 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!830141 () Bool)

(assert (=> b!830141 (= e!462806 e!462810)))

(declare-fun res!565398 () Bool)

(assert (=> b!830141 (= res!565398 call!36221)))

(assert (=> b!830141 (=> (not res!565398) (not e!462810))))

(declare-fun bm!36219 () Bool)

(assert (=> bm!36219 (= call!36216 call!36217)))

(assert (= (and d!105329 c!89863) b!830133))

(assert (= (and d!105329 (not c!89863)) b!830132))

(assert (= (and b!830132 c!89861) b!830125))

(assert (= (and b!830132 (not c!89861)) b!830131))

(assert (= (and b!830131 c!89866) b!830136))

(assert (= (and b!830131 (not c!89866)) b!830123))

(assert (= (or b!830136 b!830123) bm!36213))

(assert (= (or b!830125 bm!36213) bm!36216))

(assert (= (or b!830125 b!830136) bm!36219))

(assert (= (or b!830133 bm!36216) bm!36218))

(assert (= (or b!830133 bm!36219) bm!36215))

(assert (= (and d!105329 res!565406) b!830121))

(assert (= (and d!105329 c!89865) b!830129))

(assert (= (and d!105329 (not c!89865)) b!830122))

(assert (= (and d!105329 res!565402) b!830128))

(assert (= (and b!830128 res!565400) b!830130))

(assert (= (and b!830128 (not res!565403)) b!830127))

(assert (= (and b!830127 res!565401) b!830137))

(assert (= (and b!830128 res!565404) b!830140))

(assert (= (and b!830140 c!89862) b!830141))

(assert (= (and b!830140 (not c!89862)) b!830139))

(assert (= (and b!830141 res!565398) b!830134))

(assert (= (or b!830141 b!830139) bm!36214))

(assert (= (and b!830140 res!565399) b!830124))

(assert (= (and b!830124 c!89864) b!830126))

(assert (= (and b!830124 (not c!89864)) b!830138))

(assert (= (and b!830126 res!565405) b!830135))

(assert (= (or b!830126 b!830138) bm!36217))

(declare-fun b_lambda!11333 () Bool)

(assert (=> (not b_lambda!11333) (not b!830137)))

(assert (=> b!830137 t!22306))

(declare-fun b_and!22523 () Bool)

(assert (= b_and!22521 (and (=> t!22306 result!8009) b_and!22523)))

(assert (=> bm!36218 m!772985))

(assert (=> d!105329 m!772971))

(assert (=> b!830127 m!773021))

(assert (=> b!830127 m!773021))

(declare-fun m!773155 () Bool)

(assert (=> b!830127 m!773155))

(declare-fun m!773157 () Bool)

(assert (=> b!830129 m!773157))

(declare-fun m!773159 () Bool)

(assert (=> b!830129 m!773159))

(declare-fun m!773161 () Bool)

(assert (=> b!830129 m!773161))

(declare-fun m!773163 () Bool)

(assert (=> b!830129 m!773163))

(declare-fun m!773165 () Bool)

(assert (=> b!830129 m!773165))

(declare-fun m!773167 () Bool)

(assert (=> b!830129 m!773167))

(assert (=> b!830129 m!773021))

(declare-fun m!773169 () Bool)

(assert (=> b!830129 m!773169))

(declare-fun m!773171 () Bool)

(assert (=> b!830129 m!773171))

(declare-fun m!773173 () Bool)

(assert (=> b!830129 m!773173))

(assert (=> b!830129 m!773161))

(assert (=> b!830129 m!773159))

(declare-fun m!773175 () Bool)

(assert (=> b!830129 m!773175))

(assert (=> b!830129 m!772985))

(declare-fun m!773177 () Bool)

(assert (=> b!830129 m!773177))

(declare-fun m!773179 () Bool)

(assert (=> b!830129 m!773179))

(declare-fun m!773181 () Bool)

(assert (=> b!830129 m!773181))

(assert (=> b!830129 m!773177))

(declare-fun m!773183 () Bool)

(assert (=> b!830129 m!773183))

(assert (=> b!830129 m!773165))

(declare-fun m!773185 () Bool)

(assert (=> b!830129 m!773185))

(assert (=> b!830137 m!773049))

(assert (=> b!830137 m!773021))

(declare-fun m!773187 () Bool)

(assert (=> b!830137 m!773187))

(assert (=> b!830137 m!773021))

(assert (=> b!830137 m!773053))

(assert (=> b!830137 m!773049))

(assert (=> b!830137 m!773053))

(assert (=> b!830137 m!773055))

(assert (=> b!830130 m!773021))

(assert (=> b!830130 m!773021))

(assert (=> b!830130 m!773023))

(assert (=> b!830121 m!773021))

(assert (=> b!830121 m!773021))

(assert (=> b!830121 m!773023))

(declare-fun m!773189 () Bool)

(assert (=> b!830133 m!773189))

(declare-fun m!773191 () Bool)

(assert (=> bm!36217 m!773191))

(declare-fun m!773193 () Bool)

(assert (=> b!830134 m!773193))

(declare-fun m!773195 () Bool)

(assert (=> bm!36214 m!773195))

(declare-fun m!773197 () Bool)

(assert (=> b!830135 m!773197))

(declare-fun m!773199 () Bool)

(assert (=> bm!36215 m!773199))

(assert (=> b!829935 d!105329))

(declare-fun d!105331 () Bool)

(declare-fun e!462812 () Bool)

(assert (=> d!105331 e!462812))

(declare-fun res!565407 () Bool)

(assert (=> d!105331 (=> (not res!565407) (not e!462812))))

(declare-fun lt!376635 () ListLongMap!8967)

(assert (=> d!105331 (= res!565407 (contains!4206 lt!376635 (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376634 () List!15938)

(assert (=> d!105331 (= lt!376635 (ListLongMap!8968 lt!376634))))

(declare-fun lt!376637 () Unit!28421)

(declare-fun lt!376636 () Unit!28421)

(assert (=> d!105331 (= lt!376637 lt!376636)))

(assert (=> d!105331 (= (getValueByKey!414 lt!376634 (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105331 (= lt!376636 (lemmaContainsTupThenGetReturnValue!228 lt!376634 (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105331 (= lt!376634 (insertStrictlySorted!267 (toList!4499 (+!1978 lt!376480 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105331 (= (+!1978 (+!1978 lt!376480 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376635)))

(declare-fun b!830142 () Bool)

(declare-fun res!565408 () Bool)

(assert (=> b!830142 (=> (not res!565408) (not e!462812))))

(assert (=> b!830142 (= res!565408 (= (getValueByKey!414 (toList!4499 lt!376635) (_1!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!419 (_2!5083 (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!830143 () Bool)

(assert (=> b!830143 (= e!462812 (contains!4207 (toList!4499 lt!376635) (tuple2!10145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105331 res!565407) b!830142))

(assert (= (and b!830142 res!565408) b!830143))

(declare-fun m!773201 () Bool)

(assert (=> d!105331 m!773201))

(declare-fun m!773203 () Bool)

(assert (=> d!105331 m!773203))

(declare-fun m!773205 () Bool)

(assert (=> d!105331 m!773205))

(declare-fun m!773207 () Bool)

(assert (=> d!105331 m!773207))

(declare-fun m!773209 () Bool)

(assert (=> b!830142 m!773209))

(declare-fun m!773211 () Bool)

(assert (=> b!830143 m!773211))

(assert (=> b!829935 d!105331))

(declare-fun d!105333 () Bool)

(declare-fun e!462813 () Bool)

(assert (=> d!105333 e!462813))

(declare-fun res!565409 () Bool)

(assert (=> d!105333 (=> (not res!565409) (not e!462813))))

(declare-fun lt!376639 () ListLongMap!8967)

(assert (=> d!105333 (= res!565409 (contains!4206 lt!376639 (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!376638 () List!15938)

(assert (=> d!105333 (= lt!376639 (ListLongMap!8968 lt!376638))))

(declare-fun lt!376641 () Unit!28421)

(declare-fun lt!376640 () Unit!28421)

(assert (=> d!105333 (= lt!376641 lt!376640)))

(assert (=> d!105333 (= (getValueByKey!414 lt!376638 (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105333 (= lt!376640 (lemmaContainsTupThenGetReturnValue!228 lt!376638 (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105333 (= lt!376638 (insertStrictlySorted!267 (toList!4499 lt!376480) (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105333 (= (+!1978 lt!376480 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376639)))

(declare-fun b!830144 () Bool)

(declare-fun res!565410 () Bool)

(assert (=> b!830144 (=> (not res!565410) (not e!462813))))

(assert (=> b!830144 (= res!565410 (= (getValueByKey!414 (toList!4499 lt!376639) (_1!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!419 (_2!5083 (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!830145 () Bool)

(assert (=> b!830145 (= e!462813 (contains!4207 (toList!4499 lt!376639) (tuple2!10145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105333 res!565409) b!830144))

(assert (= (and b!830144 res!565410) b!830145))

(declare-fun m!773213 () Bool)

(assert (=> d!105333 m!773213))

(declare-fun m!773215 () Bool)

(assert (=> d!105333 m!773215))

(declare-fun m!773217 () Bool)

(assert (=> d!105333 m!773217))

(declare-fun m!773219 () Bool)

(assert (=> d!105333 m!773219))

(declare-fun m!773221 () Bool)

(assert (=> b!830144 m!773221))

(declare-fun m!773223 () Bool)

(assert (=> b!830145 m!773223))

(assert (=> b!829935 d!105333))

(declare-fun condMapEmpty!24457 () Bool)

(declare-fun mapDefault!24457 () ValueCell!7185)

(assert (=> mapNonEmpty!24451 (= condMapEmpty!24457 (= mapRest!24451 ((as const (Array (_ BitVec 32) ValueCell!7185)) mapDefault!24457)))))

(declare-fun e!462818 () Bool)

(declare-fun mapRes!24457 () Bool)

(assert (=> mapNonEmpty!24451 (= tp!47256 (and e!462818 mapRes!24457))))

(declare-fun mapIsEmpty!24457 () Bool)

(assert (=> mapIsEmpty!24457 mapRes!24457))

(declare-fun b!830153 () Bool)

(assert (=> b!830153 (= e!462818 tp_is_empty!15201)))

(declare-fun b!830152 () Bool)

(declare-fun e!462819 () Bool)

(assert (=> b!830152 (= e!462819 tp_is_empty!15201)))

(declare-fun mapNonEmpty!24457 () Bool)

(declare-fun tp!47266 () Bool)

(assert (=> mapNonEmpty!24457 (= mapRes!24457 (and tp!47266 e!462819))))

(declare-fun mapRest!24457 () (Array (_ BitVec 32) ValueCell!7185))

(declare-fun mapValue!24457 () ValueCell!7185)

(declare-fun mapKey!24457 () (_ BitVec 32))

(assert (=> mapNonEmpty!24457 (= mapRest!24451 (store mapRest!24457 mapKey!24457 mapValue!24457))))

(assert (= (and mapNonEmpty!24451 condMapEmpty!24457) mapIsEmpty!24457))

(assert (= (and mapNonEmpty!24451 (not condMapEmpty!24457)) mapNonEmpty!24457))

(assert (= (and mapNonEmpty!24457 ((_ is ValueCellFull!7185) mapValue!24457)) b!830152))

(assert (= (and mapNonEmpty!24451 ((_ is ValueCellFull!7185) mapDefault!24457)) b!830153))

(declare-fun m!773225 () Bool)

(assert (=> mapNonEmpty!24457 m!773225))

(declare-fun b_lambda!11335 () Bool)

(assert (= b_lambda!11333 (or (and start!71464 b_free!13491) b_lambda!11335)))

(declare-fun b_lambda!11337 () Bool)

(assert (= b_lambda!11331 (or (and start!71464 b_free!13491) b_lambda!11337)))

(declare-fun b_lambda!11339 () Bool)

(assert (= b_lambda!11327 (or (and start!71464 b_free!13491) b_lambda!11339)))

(declare-fun b_lambda!11341 () Bool)

(assert (= b_lambda!11329 (or (and start!71464 b_free!13491) b_lambda!11341)))

(declare-fun b_lambda!11343 () Bool)

(assert (= b_lambda!11323 (or (and start!71464 b_free!13491) b_lambda!11343)))

(declare-fun b_lambda!11345 () Bool)

(assert (= b_lambda!11325 (or (and start!71464 b_free!13491) b_lambda!11345)))

(check-sat (not b!830118) (not d!105323) (not b_lambda!11335) (not d!105325) (not b!830127) (not b!830108) (not bm!36191) (not b!830033) (not bm!36208) (not b_next!13491) (not b!830098) (not b!830134) (not b!830092) (not b!829984) (not b!830039) (not b_lambda!11343) (not b_lambda!11339) (not b!830101) (not b!830144) (not d!105333) (not b!829996) (not b_lambda!11337) (not b!830049) (not bm!36210) b_and!22523 (not d!105319) (not b!830047) (not b!830105) (not b!830117) (not d!105329) (not bm!36218) (not b!830142) (not b!829998) (not d!105327) (not bm!36215) (not b!830121) (not d!105317) (not bm!36187) (not b!830143) (not b_lambda!11345) (not b!830035) (not b!830032) (not b!830130) (not b!830104) tp_is_empty!15201 (not bm!36207) (not b!830042) (not b_lambda!11341) (not bm!36214) (not b!830034) (not b!830026) (not b!830100) (not bm!36217) (not bm!36190) (not b!830040) (not bm!36211) (not b!830106) (not b!830129) (not b!830120) (not b!830145) (not b!830025) (not b!830137) (not b!830048) (not d!105321) (not b!829995) (not b!830041) (not b!830028) (not b!830027) (not mapNonEmpty!24457) (not b!830119) (not b!830135) (not bm!36184) (not b!830133) (not d!105331) (not b!830046) (not b!829983))
(check-sat b_and!22523 (not b_next!13491))
