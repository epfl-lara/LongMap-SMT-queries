; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69914 () Bool)

(assert start!69914)

(declare-fun res!555360 () Bool)

(declare-fun e!450287 () Bool)

(assert (=> start!69914 (=> (not res!555360) (not e!450287))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69914 (= res!555360 (validMask!0 mask!1312))))

(assert (=> start!69914 e!450287))

(declare-datatypes ((array!44350 0))(
  ( (array!44351 (arr!21237 (Array (_ BitVec 32) (_ BitVec 64))) (size!21658 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44350)

(declare-fun array_inv!17013 (array!44350) Bool)

(assert (=> start!69914 (array_inv!17013 _keys!976)))

(assert (=> start!69914 true))

(declare-datatypes ((V!23757 0))(
  ( (V!23758 (val!7081 Int)) )
))
(declare-datatypes ((ValueCell!6618 0))(
  ( (ValueCellFull!6618 (v!9508 V!23757)) (EmptyCell!6618) )
))
(declare-datatypes ((array!44352 0))(
  ( (array!44353 (arr!21238 (Array (_ BitVec 32) ValueCell!6618)) (size!21659 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44352)

(declare-fun e!450288 () Bool)

(declare-fun array_inv!17014 (array!44352) Bool)

(assert (=> start!69914 (and (array_inv!17014 _values!788) e!450288)))

(declare-fun b!812795 () Bool)

(assert (=> b!812795 (= e!450287 (bvsgt #b00000000000000000000000000000000 (size!21658 _keys!976)))))

(declare-fun b!812796 () Bool)

(declare-fun res!555359 () Bool)

(assert (=> b!812796 (=> (not res!555359) (not e!450287))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812796 (= res!555359 (and (= (size!21659 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21658 _keys!976) (size!21659 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22675 () Bool)

(declare-fun mapRes!22675 () Bool)

(assert (=> mapIsEmpty!22675 mapRes!22675))

(declare-fun b!812797 () Bool)

(declare-fun e!450285 () Bool)

(declare-fun tp_is_empty!14067 () Bool)

(assert (=> b!812797 (= e!450285 tp_is_empty!14067)))

(declare-fun mapNonEmpty!22675 () Bool)

(declare-fun tp!43783 () Bool)

(declare-fun e!450284 () Bool)

(assert (=> mapNonEmpty!22675 (= mapRes!22675 (and tp!43783 e!450284))))

(declare-fun mapKey!22675 () (_ BitVec 32))

(declare-fun mapRest!22675 () (Array (_ BitVec 32) ValueCell!6618))

(declare-fun mapValue!22675 () ValueCell!6618)

(assert (=> mapNonEmpty!22675 (= (arr!21238 _values!788) (store mapRest!22675 mapKey!22675 mapValue!22675))))

(declare-fun b!812798 () Bool)

(declare-fun res!555357 () Bool)

(assert (=> b!812798 (=> (not res!555357) (not e!450287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44350 (_ BitVec 32)) Bool)

(assert (=> b!812798 (= res!555357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812799 () Bool)

(assert (=> b!812799 (= e!450284 tp_is_empty!14067)))

(declare-fun b!812800 () Bool)

(assert (=> b!812800 (= e!450288 (and e!450285 mapRes!22675))))

(declare-fun condMapEmpty!22675 () Bool)

(declare-fun mapDefault!22675 () ValueCell!6618)

(assert (=> b!812800 (= condMapEmpty!22675 (= (arr!21238 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6618)) mapDefault!22675)))))

(declare-fun b!812801 () Bool)

(declare-fun res!555358 () Bool)

(assert (=> b!812801 (=> (not res!555358) (not e!450287))))

(declare-datatypes ((List!15107 0))(
  ( (Nil!15104) (Cons!15103 (h!16232 (_ BitVec 64)) (t!21422 List!15107)) )
))
(declare-fun arrayNoDuplicates!0 (array!44350 (_ BitVec 32) List!15107) Bool)

(assert (=> b!812801 (= res!555358 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15104))))

(assert (= (and start!69914 res!555360) b!812796))

(assert (= (and b!812796 res!555359) b!812798))

(assert (= (and b!812798 res!555357) b!812801))

(assert (= (and b!812801 res!555358) b!812795))

(assert (= (and b!812800 condMapEmpty!22675) mapIsEmpty!22675))

(assert (= (and b!812800 (not condMapEmpty!22675)) mapNonEmpty!22675))

(get-info :version)

(assert (= (and mapNonEmpty!22675 ((_ is ValueCellFull!6618) mapValue!22675)) b!812799))

(assert (= (and b!812800 ((_ is ValueCellFull!6618) mapDefault!22675)) b!812797))

(assert (= start!69914 b!812800))

(declare-fun m!755061 () Bool)

(assert (=> start!69914 m!755061))

(declare-fun m!755063 () Bool)

(assert (=> start!69914 m!755063))

(declare-fun m!755065 () Bool)

(assert (=> start!69914 m!755065))

(declare-fun m!755067 () Bool)

(assert (=> mapNonEmpty!22675 m!755067))

(declare-fun m!755069 () Bool)

(assert (=> b!812798 m!755069))

(declare-fun m!755071 () Bool)

(assert (=> b!812801 m!755071))

(check-sat (not start!69914) (not mapNonEmpty!22675) (not b!812798) (not b!812801) tp_is_empty!14067)
(check-sat)
(get-model)

(declare-fun b!812831 () Bool)

(declare-fun e!450310 () Bool)

(declare-fun e!450311 () Bool)

(assert (=> b!812831 (= e!450310 e!450311)))

(declare-fun lt!364200 () (_ BitVec 64))

(assert (=> b!812831 (= lt!364200 (select (arr!21237 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27710 0))(
  ( (Unit!27711) )
))
(declare-fun lt!364198 () Unit!27710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44350 (_ BitVec 64) (_ BitVec 32)) Unit!27710)

(assert (=> b!812831 (= lt!364198 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!364200 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812831 (arrayContainsKey!0 _keys!976 lt!364200 #b00000000000000000000000000000000)))

(declare-fun lt!364199 () Unit!27710)

(assert (=> b!812831 (= lt!364199 lt!364198)))

(declare-fun res!555378 () Bool)

(declare-datatypes ((SeekEntryResult!8718 0))(
  ( (MissingZero!8718 (index!37243 (_ BitVec 32))) (Found!8718 (index!37244 (_ BitVec 32))) (Intermediate!8718 (undefined!9530 Bool) (index!37245 (_ BitVec 32)) (x!68277 (_ BitVec 32))) (Undefined!8718) (MissingVacant!8718 (index!37246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44350 (_ BitVec 32)) SeekEntryResult!8718)

(assert (=> b!812831 (= res!555378 (= (seekEntryOrOpen!0 (select (arr!21237 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8718 #b00000000000000000000000000000000)))))

(assert (=> b!812831 (=> (not res!555378) (not e!450311))))

(declare-fun bm!35484 () Bool)

(declare-fun call!35487 () Bool)

(assert (=> bm!35484 (= call!35487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!812832 () Bool)

(assert (=> b!812832 (= e!450310 call!35487)))

(declare-fun b!812833 () Bool)

(declare-fun e!450312 () Bool)

(assert (=> b!812833 (= e!450312 e!450310)))

(declare-fun c!88903 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812833 (= c!88903 (validKeyInArray!0 (select (arr!21237 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104355 () Bool)

(declare-fun res!555377 () Bool)

(assert (=> d!104355 (=> res!555377 e!450312)))

(assert (=> d!104355 (= res!555377 (bvsge #b00000000000000000000000000000000 (size!21658 _keys!976)))))

(assert (=> d!104355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!450312)))

(declare-fun b!812834 () Bool)

(assert (=> b!812834 (= e!450311 call!35487)))

(assert (= (and d!104355 (not res!555377)) b!812833))

(assert (= (and b!812833 c!88903) b!812831))

(assert (= (and b!812833 (not c!88903)) b!812832))

(assert (= (and b!812831 res!555378) b!812834))

(assert (= (or b!812834 b!812832) bm!35484))

(declare-fun m!755085 () Bool)

(assert (=> b!812831 m!755085))

(declare-fun m!755087 () Bool)

(assert (=> b!812831 m!755087))

(declare-fun m!755089 () Bool)

(assert (=> b!812831 m!755089))

(assert (=> b!812831 m!755085))

(declare-fun m!755091 () Bool)

(assert (=> b!812831 m!755091))

(declare-fun m!755093 () Bool)

(assert (=> bm!35484 m!755093))

(assert (=> b!812833 m!755085))

(assert (=> b!812833 m!755085))

(declare-fun m!755095 () Bool)

(assert (=> b!812833 m!755095))

(assert (=> b!812798 d!104355))

(declare-fun d!104357 () Bool)

(assert (=> d!104357 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69914 d!104357))

(declare-fun d!104359 () Bool)

(assert (=> d!104359 (= (array_inv!17013 _keys!976) (bvsge (size!21658 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69914 d!104359))

(declare-fun d!104361 () Bool)

(assert (=> d!104361 (= (array_inv!17014 _values!788) (bvsge (size!21659 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69914 d!104361))

(declare-fun b!812845 () Bool)

(declare-fun e!450321 () Bool)

(declare-fun e!450324 () Bool)

(assert (=> b!812845 (= e!450321 e!450324)))

(declare-fun res!555385 () Bool)

(assert (=> b!812845 (=> (not res!555385) (not e!450324))))

(declare-fun e!450323 () Bool)

(assert (=> b!812845 (= res!555385 (not e!450323))))

(declare-fun res!555386 () Bool)

(assert (=> b!812845 (=> (not res!555386) (not e!450323))))

(assert (=> b!812845 (= res!555386 (validKeyInArray!0 (select (arr!21237 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!812846 () Bool)

(declare-fun e!450322 () Bool)

(declare-fun call!35490 () Bool)

(assert (=> b!812846 (= e!450322 call!35490)))

(declare-fun b!812848 () Bool)

(assert (=> b!812848 (= e!450322 call!35490)))

(declare-fun bm!35487 () Bool)

(declare-fun c!88906 () Bool)

(assert (=> bm!35487 (= call!35490 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88906 (Cons!15103 (select (arr!21237 _keys!976) #b00000000000000000000000000000000) Nil!15104) Nil!15104)))))

(declare-fun b!812849 () Bool)

(declare-fun contains!4142 (List!15107 (_ BitVec 64)) Bool)

(assert (=> b!812849 (= e!450323 (contains!4142 Nil!15104 (select (arr!21237 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104363 () Bool)

(declare-fun res!555387 () Bool)

(assert (=> d!104363 (=> res!555387 e!450321)))

(assert (=> d!104363 (= res!555387 (bvsge #b00000000000000000000000000000000 (size!21658 _keys!976)))))

(assert (=> d!104363 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15104) e!450321)))

(declare-fun b!812847 () Bool)

(assert (=> b!812847 (= e!450324 e!450322)))

(assert (=> b!812847 (= c!88906 (validKeyInArray!0 (select (arr!21237 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104363 (not res!555387)) b!812845))

(assert (= (and b!812845 res!555386) b!812849))

(assert (= (and b!812845 res!555385) b!812847))

(assert (= (and b!812847 c!88906) b!812846))

(assert (= (and b!812847 (not c!88906)) b!812848))

(assert (= (or b!812846 b!812848) bm!35487))

(assert (=> b!812845 m!755085))

(assert (=> b!812845 m!755085))

(assert (=> b!812845 m!755095))

(assert (=> bm!35487 m!755085))

(declare-fun m!755097 () Bool)

(assert (=> bm!35487 m!755097))

(assert (=> b!812849 m!755085))

(assert (=> b!812849 m!755085))

(declare-fun m!755099 () Bool)

(assert (=> b!812849 m!755099))

(assert (=> b!812847 m!755085))

(assert (=> b!812847 m!755085))

(assert (=> b!812847 m!755095))

(assert (=> b!812801 d!104363))

(declare-fun mapIsEmpty!22681 () Bool)

(declare-fun mapRes!22681 () Bool)

(assert (=> mapIsEmpty!22681 mapRes!22681))

(declare-fun condMapEmpty!22681 () Bool)

(declare-fun mapDefault!22681 () ValueCell!6618)

(assert (=> mapNonEmpty!22675 (= condMapEmpty!22681 (= mapRest!22675 ((as const (Array (_ BitVec 32) ValueCell!6618)) mapDefault!22681)))))

(declare-fun e!450330 () Bool)

(assert (=> mapNonEmpty!22675 (= tp!43783 (and e!450330 mapRes!22681))))

(declare-fun mapNonEmpty!22681 () Bool)

(declare-fun tp!43789 () Bool)

(declare-fun e!450329 () Bool)

(assert (=> mapNonEmpty!22681 (= mapRes!22681 (and tp!43789 e!450329))))

(declare-fun mapRest!22681 () (Array (_ BitVec 32) ValueCell!6618))

(declare-fun mapValue!22681 () ValueCell!6618)

(declare-fun mapKey!22681 () (_ BitVec 32))

(assert (=> mapNonEmpty!22681 (= mapRest!22675 (store mapRest!22681 mapKey!22681 mapValue!22681))))

(declare-fun b!812857 () Bool)

(assert (=> b!812857 (= e!450330 tp_is_empty!14067)))

(declare-fun b!812856 () Bool)

(assert (=> b!812856 (= e!450329 tp_is_empty!14067)))

(assert (= (and mapNonEmpty!22675 condMapEmpty!22681) mapIsEmpty!22681))

(assert (= (and mapNonEmpty!22675 (not condMapEmpty!22681)) mapNonEmpty!22681))

(assert (= (and mapNonEmpty!22681 ((_ is ValueCellFull!6618) mapValue!22681)) b!812856))

(assert (= (and mapNonEmpty!22675 ((_ is ValueCellFull!6618) mapDefault!22681)) b!812857))

(declare-fun m!755101 () Bool)

(assert (=> mapNonEmpty!22681 m!755101))

(check-sat (not bm!35487) (not b!812845) (not b!812831) (not b!812849) (not mapNonEmpty!22681) (not bm!35484) (not b!812847) tp_is_empty!14067 (not b!812833))
(check-sat)
