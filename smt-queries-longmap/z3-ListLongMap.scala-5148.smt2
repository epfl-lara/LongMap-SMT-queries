; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69996 () Bool)

(assert start!69996)

(declare-fun b!813032 () Bool)

(declare-fun res!555356 () Bool)

(declare-fun e!450341 () Bool)

(assert (=> b!813032 (=> (not res!555356) (not e!450341))))

(declare-datatypes ((array!44233 0))(
  ( (array!44234 (arr!21176 (Array (_ BitVec 32) (_ BitVec 64))) (size!21596 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44233)

(assert (=> b!813032 (= res!555356 (and (bvsle #b00000000000000000000000000000000 (size!21596 _keys!976)) (bvslt (size!21596 _keys!976) #b01111111111111111111111111111111)))))

(declare-fun b!813033 () Bool)

(declare-fun res!555355 () Bool)

(assert (=> b!813033 (=> (not res!555355) (not e!450341))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23675 0))(
  ( (V!23676 (val!7050 Int)) )
))
(declare-datatypes ((ValueCell!6587 0))(
  ( (ValueCellFull!6587 (v!9476 V!23675)) (EmptyCell!6587) )
))
(declare-datatypes ((array!44235 0))(
  ( (array!44236 (arr!21177 (Array (_ BitVec 32) ValueCell!6587)) (size!21597 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44235)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813033 (= res!555355 (and (= (size!21597 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21596 _keys!976) (size!21597 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22576 () Bool)

(declare-fun mapRes!22576 () Bool)

(declare-fun tp!43684 () Bool)

(declare-fun e!450338 () Bool)

(assert (=> mapNonEmpty!22576 (= mapRes!22576 (and tp!43684 e!450338))))

(declare-fun mapRest!22576 () (Array (_ BitVec 32) ValueCell!6587))

(declare-fun mapKey!22576 () (_ BitVec 32))

(declare-fun mapValue!22576 () ValueCell!6587)

(assert (=> mapNonEmpty!22576 (= (arr!21177 _values!788) (store mapRest!22576 mapKey!22576 mapValue!22576))))

(declare-fun res!555354 () Bool)

(assert (=> start!69996 (=> (not res!555354) (not e!450341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69996 (= res!555354 (validMask!0 mask!1312))))

(assert (=> start!69996 e!450341))

(declare-fun array_inv!17025 (array!44233) Bool)

(assert (=> start!69996 (array_inv!17025 _keys!976)))

(assert (=> start!69996 true))

(declare-fun e!450342 () Bool)

(declare-fun array_inv!17026 (array!44235) Bool)

(assert (=> start!69996 (and (array_inv!17026 _values!788) e!450342)))

(declare-fun b!813034 () Bool)

(declare-datatypes ((List!14991 0))(
  ( (Nil!14988) (Cons!14987 (h!16122 (_ BitVec 64)) (t!21298 List!14991)) )
))
(declare-fun noDuplicate!1294 (List!14991) Bool)

(assert (=> b!813034 (= e!450341 (not (noDuplicate!1294 Nil!14988)))))

(declare-fun mapIsEmpty!22576 () Bool)

(assert (=> mapIsEmpty!22576 mapRes!22576))

(declare-fun b!813035 () Bool)

(declare-fun e!450339 () Bool)

(assert (=> b!813035 (= e!450342 (and e!450339 mapRes!22576))))

(declare-fun condMapEmpty!22576 () Bool)

(declare-fun mapDefault!22576 () ValueCell!6587)

(assert (=> b!813035 (= condMapEmpty!22576 (= (arr!21177 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6587)) mapDefault!22576)))))

(declare-fun b!813036 () Bool)

(declare-fun tp_is_empty!14005 () Bool)

(assert (=> b!813036 (= e!450338 tp_is_empty!14005)))

(declare-fun b!813037 () Bool)

(declare-fun res!555353 () Bool)

(assert (=> b!813037 (=> (not res!555353) (not e!450341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44233 (_ BitVec 32)) Bool)

(assert (=> b!813037 (= res!555353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813038 () Bool)

(assert (=> b!813038 (= e!450339 tp_is_empty!14005)))

(assert (= (and start!69996 res!555354) b!813033))

(assert (= (and b!813033 res!555355) b!813037))

(assert (= (and b!813037 res!555353) b!813032))

(assert (= (and b!813032 res!555356) b!813034))

(assert (= (and b!813035 condMapEmpty!22576) mapIsEmpty!22576))

(assert (= (and b!813035 (not condMapEmpty!22576)) mapNonEmpty!22576))

(get-info :version)

(assert (= (and mapNonEmpty!22576 ((_ is ValueCellFull!6587) mapValue!22576)) b!813036))

(assert (= (and b!813035 ((_ is ValueCellFull!6587) mapDefault!22576)) b!813038))

(assert (= start!69996 b!813035))

(declare-fun m!755913 () Bool)

(assert (=> mapNonEmpty!22576 m!755913))

(declare-fun m!755915 () Bool)

(assert (=> start!69996 m!755915))

(declare-fun m!755917 () Bool)

(assert (=> start!69996 m!755917))

(declare-fun m!755919 () Bool)

(assert (=> start!69996 m!755919))

(declare-fun m!755921 () Bool)

(assert (=> b!813034 m!755921))

(declare-fun m!755923 () Bool)

(assert (=> b!813037 m!755923))

(check-sat (not b!813034) (not mapNonEmpty!22576) (not b!813037) (not start!69996) tp_is_empty!14005)
(check-sat)
(get-model)

(declare-fun b!813089 () Bool)

(declare-fun e!450380 () Bool)

(declare-fun e!450379 () Bool)

(assert (=> b!813089 (= e!450380 e!450379)))

(declare-fun c!89174 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!813089 (= c!89174 (validKeyInArray!0 (select (arr!21176 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!813090 () Bool)

(declare-fun e!450381 () Bool)

(declare-fun call!35526 () Bool)

(assert (=> b!813090 (= e!450381 call!35526)))

(declare-fun bm!35523 () Bool)

(assert (=> bm!35523 (= call!35526 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!813091 () Bool)

(assert (=> b!813091 (= e!450379 call!35526)))

(declare-fun d!104631 () Bool)

(declare-fun res!555385 () Bool)

(assert (=> d!104631 (=> res!555385 e!450380)))

(assert (=> d!104631 (= res!555385 (bvsge #b00000000000000000000000000000000 (size!21596 _keys!976)))))

(assert (=> d!104631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450380)))

(declare-fun b!813092 () Bool)

(assert (=> b!813092 (= e!450379 e!450381)))

(declare-fun lt!364460 () (_ BitVec 64))

(assert (=> b!813092 (= lt!364460 (select (arr!21176 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27691 0))(
  ( (Unit!27692) )
))
(declare-fun lt!364458 () Unit!27691)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44233 (_ BitVec 64) (_ BitVec 32)) Unit!27691)

(assert (=> b!813092 (= lt!364458 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364460 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!813092 (arrayContainsKey!0 _keys!976 lt!364460 #b00000000000000000000000000000000)))

(declare-fun lt!364459 () Unit!27691)

(assert (=> b!813092 (= lt!364459 lt!364458)))

(declare-fun res!555386 () Bool)

(declare-datatypes ((SeekEntryResult!8667 0))(
  ( (MissingZero!8667 (index!37039 (_ BitVec 32))) (Found!8667 (index!37040 (_ BitVec 32))) (Intermediate!8667 (undefined!9479 Bool) (index!37041 (_ BitVec 32)) (x!68156 (_ BitVec 32))) (Undefined!8667) (MissingVacant!8667 (index!37042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44233 (_ BitVec 32)) SeekEntryResult!8667)

(assert (=> b!813092 (= res!555386 (= (seekEntryOrOpen!0 (select (arr!21176 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8667 #b00000000000000000000000000000000)))))

(assert (=> b!813092 (=> (not res!555386) (not e!450381))))

(assert (= (and d!104631 (not res!555385)) b!813089))

(assert (= (and b!813089 c!89174) b!813092))

(assert (= (and b!813089 (not c!89174)) b!813091))

(assert (= (and b!813092 res!555386) b!813090))

(assert (= (or b!813090 b!813091) bm!35523))

(declare-fun m!755949 () Bool)

(assert (=> b!813089 m!755949))

(assert (=> b!813089 m!755949))

(declare-fun m!755951 () Bool)

(assert (=> b!813089 m!755951))

(declare-fun m!755953 () Bool)

(assert (=> bm!35523 m!755953))

(assert (=> b!813092 m!755949))

(declare-fun m!755955 () Bool)

(assert (=> b!813092 m!755955))

(declare-fun m!755957 () Bool)

(assert (=> b!813092 m!755957))

(assert (=> b!813092 m!755949))

(declare-fun m!755959 () Bool)

(assert (=> b!813092 m!755959))

(assert (=> b!813037 d!104631))

(declare-fun d!104633 () Bool)

(assert (=> d!104633 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69996 d!104633))

(declare-fun d!104635 () Bool)

(assert (=> d!104635 (= (array_inv!17025 _keys!976) (bvsge (size!21596 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69996 d!104635))

(declare-fun d!104637 () Bool)

(assert (=> d!104637 (= (array_inv!17026 _values!788) (bvsge (size!21597 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69996 d!104637))

(declare-fun d!104639 () Bool)

(declare-fun res!555391 () Bool)

(declare-fun e!450386 () Bool)

(assert (=> d!104639 (=> res!555391 e!450386)))

(assert (=> d!104639 (= res!555391 ((_ is Nil!14988) Nil!14988))))

(assert (=> d!104639 (= (noDuplicate!1294 Nil!14988) e!450386)))

(declare-fun b!813097 () Bool)

(declare-fun e!450387 () Bool)

(assert (=> b!813097 (= e!450386 e!450387)))

(declare-fun res!555392 () Bool)

(assert (=> b!813097 (=> (not res!555392) (not e!450387))))

(declare-fun contains!4116 (List!14991 (_ BitVec 64)) Bool)

(assert (=> b!813097 (= res!555392 (not (contains!4116 (t!21298 Nil!14988) (h!16122 Nil!14988))))))

(declare-fun b!813098 () Bool)

(assert (=> b!813098 (= e!450387 (noDuplicate!1294 (t!21298 Nil!14988)))))

(assert (= (and d!104639 (not res!555391)) b!813097))

(assert (= (and b!813097 res!555392) b!813098))

(declare-fun m!755961 () Bool)

(assert (=> b!813097 m!755961))

(declare-fun m!755963 () Bool)

(assert (=> b!813098 m!755963))

(assert (=> b!813034 d!104639))

(declare-fun b!813105 () Bool)

(declare-fun e!450393 () Bool)

(assert (=> b!813105 (= e!450393 tp_is_empty!14005)))

(declare-fun b!813106 () Bool)

(declare-fun e!450392 () Bool)

(assert (=> b!813106 (= e!450392 tp_is_empty!14005)))

(declare-fun mapIsEmpty!22585 () Bool)

(declare-fun mapRes!22585 () Bool)

(assert (=> mapIsEmpty!22585 mapRes!22585))

(declare-fun mapNonEmpty!22585 () Bool)

(declare-fun tp!43693 () Bool)

(assert (=> mapNonEmpty!22585 (= mapRes!22585 (and tp!43693 e!450393))))

(declare-fun mapRest!22585 () (Array (_ BitVec 32) ValueCell!6587))

(declare-fun mapValue!22585 () ValueCell!6587)

(declare-fun mapKey!22585 () (_ BitVec 32))

(assert (=> mapNonEmpty!22585 (= mapRest!22576 (store mapRest!22585 mapKey!22585 mapValue!22585))))

(declare-fun condMapEmpty!22585 () Bool)

(declare-fun mapDefault!22585 () ValueCell!6587)

(assert (=> mapNonEmpty!22576 (= condMapEmpty!22585 (= mapRest!22576 ((as const (Array (_ BitVec 32) ValueCell!6587)) mapDefault!22585)))))

(assert (=> mapNonEmpty!22576 (= tp!43684 (and e!450392 mapRes!22585))))

(assert (= (and mapNonEmpty!22576 condMapEmpty!22585) mapIsEmpty!22585))

(assert (= (and mapNonEmpty!22576 (not condMapEmpty!22585)) mapNonEmpty!22585))

(assert (= (and mapNonEmpty!22585 ((_ is ValueCellFull!6587) mapValue!22585)) b!813105))

(assert (= (and mapNonEmpty!22576 ((_ is ValueCellFull!6587) mapDefault!22585)) b!813106))

(declare-fun m!755965 () Bool)

(assert (=> mapNonEmpty!22585 m!755965))

(check-sat (not b!813098) (not b!813097) (not b!813092) (not mapNonEmpty!22585) tp_is_empty!14005 (not b!813089) (not bm!35523))
(check-sat)
