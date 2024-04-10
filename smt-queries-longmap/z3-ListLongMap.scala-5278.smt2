; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70820 () Bool)

(assert start!70820)

(declare-fun b_free!13077 () Bool)

(declare-fun b_next!13077 () Bool)

(assert (=> start!70820 (= b_free!13077 (not b_next!13077))))

(declare-fun tp!45975 () Bool)

(declare-fun b_and!21949 () Bool)

(assert (=> start!70820 (= tp!45975 b_and!21949)))

(declare-fun b!822598 () Bool)

(declare-fun e!457383 () Bool)

(declare-datatypes ((array!45766 0))(
  ( (array!45767 (arr!21933 (Array (_ BitVec 32) (_ BitVec 64))) (size!22354 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45766)

(assert (=> b!822598 (= e!457383 (bvsle #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-datatypes ((V!24717 0))(
  ( (V!24718 (val!7441 Int)) )
))
(declare-datatypes ((tuple2!9828 0))(
  ( (tuple2!9829 (_1!4925 (_ BitVec 64)) (_2!4925 V!24717)) )
))
(declare-datatypes ((List!15644 0))(
  ( (Nil!15641) (Cons!15640 (h!16769 tuple2!9828) (t!21981 List!15644)) )
))
(declare-datatypes ((ListLongMap!8651 0))(
  ( (ListLongMap!8652 (toList!4341 List!15644)) )
))
(declare-fun lt!370313 () ListLongMap!8651)

(declare-fun lt!370311 () ListLongMap!8651)

(declare-fun lt!370316 () tuple2!9828)

(declare-fun +!1891 (ListLongMap!8651 tuple2!9828) ListLongMap!8651)

(assert (=> b!822598 (= lt!370313 (+!1891 lt!370311 lt!370316))))

(declare-fun lt!370317 () ListLongMap!8651)

(declare-fun zeroValueAfter!34 () V!24717)

(declare-fun minValue!754 () V!24717)

(declare-datatypes ((Unit!28146 0))(
  ( (Unit!28147) )
))
(declare-fun lt!370308 () Unit!28146)

(declare-fun addCommutativeForDiffKeys!454 (ListLongMap!8651 (_ BitVec 64) V!24717 (_ BitVec 64) V!24717) Unit!28146)

(assert (=> b!822598 (= lt!370308 (addCommutativeForDiffKeys!454 lt!370317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370310 () ListLongMap!8651)

(assert (=> b!822598 (= lt!370310 lt!370313)))

(declare-fun lt!370312 () tuple2!9828)

(assert (=> b!822598 (= lt!370313 (+!1891 (+!1891 lt!370317 lt!370316) lt!370312))))

(assert (=> b!822598 (= lt!370316 (tuple2!9829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370315 () ListLongMap!8651)

(assert (=> b!822598 (= lt!370315 lt!370311)))

(assert (=> b!822598 (= lt!370311 (+!1891 lt!370317 lt!370312))))

(assert (=> b!822598 (= lt!370312 (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((ValueCell!6978 0))(
  ( (ValueCellFull!6978 (v!9872 V!24717)) (EmptyCell!6978) )
))
(declare-datatypes ((array!45768 0))(
  ( (array!45769 (arr!21934 (Array (_ BitVec 32) ValueCell!6978)) (size!22355 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45768)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2505 (array!45766 array!45768 (_ BitVec 32) (_ BitVec 32) V!24717 V!24717 (_ BitVec 32) Int) ListLongMap!8651)

(assert (=> b!822598 (= lt!370310 (getCurrentListMap!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24717)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822598 (= lt!370315 (getCurrentListMap!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23791 () Bool)

(declare-fun mapRes!23791 () Bool)

(assert (=> mapIsEmpty!23791 mapRes!23791))

(declare-fun b!822599 () Bool)

(declare-fun e!457380 () Bool)

(declare-fun tp_is_empty!14787 () Bool)

(assert (=> b!822599 (= e!457380 tp_is_empty!14787)))

(declare-fun b!822600 () Bool)

(declare-fun res!561051 () Bool)

(declare-fun e!457382 () Bool)

(assert (=> b!822600 (=> (not res!561051) (not e!457382))))

(assert (=> b!822600 (= res!561051 (and (= (size!22355 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22354 _keys!976) (size!22355 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822601 () Bool)

(declare-fun e!457379 () Bool)

(assert (=> b!822601 (= e!457379 (and e!457380 mapRes!23791))))

(declare-fun condMapEmpty!23791 () Bool)

(declare-fun mapDefault!23791 () ValueCell!6978)

(assert (=> b!822601 (= condMapEmpty!23791 (= (arr!21934 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6978)) mapDefault!23791)))))

(declare-fun b!822602 () Bool)

(declare-fun res!561052 () Bool)

(assert (=> b!822602 (=> (not res!561052) (not e!457382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45766 (_ BitVec 32)) Bool)

(assert (=> b!822602 (= res!561052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822603 () Bool)

(declare-fun res!561053 () Bool)

(assert (=> b!822603 (=> (not res!561053) (not e!457382))))

(declare-datatypes ((List!15645 0))(
  ( (Nil!15642) (Cons!15641 (h!16770 (_ BitVec 64)) (t!21982 List!15645)) )
))
(declare-fun arrayNoDuplicates!0 (array!45766 (_ BitVec 32) List!15645) Bool)

(assert (=> b!822603 (= res!561053 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15642))))

(declare-fun b!822604 () Bool)

(assert (=> b!822604 (= e!457382 (not e!457383))))

(declare-fun res!561050 () Bool)

(assert (=> b!822604 (=> res!561050 e!457383)))

(assert (=> b!822604 (= res!561050 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370309 () ListLongMap!8651)

(assert (=> b!822604 (= lt!370317 lt!370309)))

(declare-fun lt!370314 () Unit!28146)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!470 (array!45766 array!45768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24717 V!24717 V!24717 V!24717 (_ BitVec 32) Int) Unit!28146)

(assert (=> b!822604 (= lt!370314 (lemmaNoChangeToArrayThenSameMapNoExtras!470 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2360 (array!45766 array!45768 (_ BitVec 32) (_ BitVec 32) V!24717 V!24717 (_ BitVec 32) Int) ListLongMap!8651)

(assert (=> b!822604 (= lt!370309 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822604 (= lt!370317 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822605 () Bool)

(declare-fun e!457378 () Bool)

(assert (=> b!822605 (= e!457378 tp_is_empty!14787)))

(declare-fun res!561054 () Bool)

(assert (=> start!70820 (=> (not res!561054) (not e!457382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70820 (= res!561054 (validMask!0 mask!1312))))

(assert (=> start!70820 e!457382))

(assert (=> start!70820 tp_is_empty!14787))

(declare-fun array_inv!17519 (array!45766) Bool)

(assert (=> start!70820 (array_inv!17519 _keys!976)))

(assert (=> start!70820 true))

(declare-fun array_inv!17520 (array!45768) Bool)

(assert (=> start!70820 (and (array_inv!17520 _values!788) e!457379)))

(assert (=> start!70820 tp!45975))

(declare-fun mapNonEmpty!23791 () Bool)

(declare-fun tp!45976 () Bool)

(assert (=> mapNonEmpty!23791 (= mapRes!23791 (and tp!45976 e!457378))))

(declare-fun mapKey!23791 () (_ BitVec 32))

(declare-fun mapRest!23791 () (Array (_ BitVec 32) ValueCell!6978))

(declare-fun mapValue!23791 () ValueCell!6978)

(assert (=> mapNonEmpty!23791 (= (arr!21934 _values!788) (store mapRest!23791 mapKey!23791 mapValue!23791))))

(assert (= (and start!70820 res!561054) b!822600))

(assert (= (and b!822600 res!561051) b!822602))

(assert (= (and b!822602 res!561052) b!822603))

(assert (= (and b!822603 res!561053) b!822604))

(assert (= (and b!822604 (not res!561050)) b!822598))

(assert (= (and b!822601 condMapEmpty!23791) mapIsEmpty!23791))

(assert (= (and b!822601 (not condMapEmpty!23791)) mapNonEmpty!23791))

(get-info :version)

(assert (= (and mapNonEmpty!23791 ((_ is ValueCellFull!6978) mapValue!23791)) b!822605))

(assert (= (and b!822601 ((_ is ValueCellFull!6978) mapDefault!23791)) b!822599))

(assert (= start!70820 b!822601))

(declare-fun m!764505 () Bool)

(assert (=> b!822604 m!764505))

(declare-fun m!764507 () Bool)

(assert (=> b!822604 m!764507))

(declare-fun m!764509 () Bool)

(assert (=> b!822604 m!764509))

(declare-fun m!764511 () Bool)

(assert (=> start!70820 m!764511))

(declare-fun m!764513 () Bool)

(assert (=> start!70820 m!764513))

(declare-fun m!764515 () Bool)

(assert (=> start!70820 m!764515))

(declare-fun m!764517 () Bool)

(assert (=> b!822602 m!764517))

(declare-fun m!764519 () Bool)

(assert (=> b!822603 m!764519))

(declare-fun m!764521 () Bool)

(assert (=> b!822598 m!764521))

(declare-fun m!764523 () Bool)

(assert (=> b!822598 m!764523))

(assert (=> b!822598 m!764521))

(declare-fun m!764525 () Bool)

(assert (=> b!822598 m!764525))

(declare-fun m!764527 () Bool)

(assert (=> b!822598 m!764527))

(declare-fun m!764529 () Bool)

(assert (=> b!822598 m!764529))

(declare-fun m!764531 () Bool)

(assert (=> b!822598 m!764531))

(declare-fun m!764533 () Bool)

(assert (=> b!822598 m!764533))

(declare-fun m!764535 () Bool)

(assert (=> mapNonEmpty!23791 m!764535))

(check-sat (not b!822602) b_and!21949 tp_is_empty!14787 (not b!822603) (not b!822604) (not start!70820) (not b!822598) (not mapNonEmpty!23791) (not b_next!13077))
(check-sat b_and!21949 (not b_next!13077))
(get-model)

(declare-fun d!104829 () Bool)

(assert (=> d!104829 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70820 d!104829))

(declare-fun d!104831 () Bool)

(assert (=> d!104831 (= (array_inv!17519 _keys!976) (bvsge (size!22354 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70820 d!104831))

(declare-fun d!104833 () Bool)

(assert (=> d!104833 (= (array_inv!17520 _values!788) (bvsge (size!22355 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70820 d!104833))

(declare-fun d!104835 () Bool)

(assert (=> d!104835 (= (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370350 () Unit!28146)

(declare-fun choose!1399 (array!45766 array!45768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24717 V!24717 V!24717 V!24717 (_ BitVec 32) Int) Unit!28146)

(assert (=> d!104835 (= lt!370350 (choose!1399 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104835 (validMask!0 mask!1312)))

(assert (=> d!104835 (= (lemmaNoChangeToArrayThenSameMapNoExtras!470 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370350)))

(declare-fun bs!22957 () Bool)

(assert (= bs!22957 d!104835))

(assert (=> bs!22957 m!764509))

(assert (=> bs!22957 m!764507))

(declare-fun m!764569 () Bool)

(assert (=> bs!22957 m!764569))

(assert (=> bs!22957 m!764511))

(assert (=> b!822604 d!104835))

(declare-fun b!822654 () Bool)

(declare-fun e!457420 () ListLongMap!8651)

(declare-fun call!35756 () ListLongMap!8651)

(assert (=> b!822654 (= e!457420 call!35756)))

(declare-fun b!822655 () Bool)

(declare-fun e!457418 () Bool)

(declare-fun e!457416 () Bool)

(assert (=> b!822655 (= e!457418 e!457416)))

(assert (=> b!822655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun res!561080 () Bool)

(declare-fun lt!370368 () ListLongMap!8651)

(declare-fun contains!4169 (ListLongMap!8651 (_ BitVec 64)) Bool)

(assert (=> b!822655 (= res!561080 (contains!4169 lt!370368 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822655 (=> (not res!561080) (not e!457416))))

(declare-fun b!822656 () Bool)

(assert (=> b!822656 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> b!822656 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22355 _values!788)))))

(declare-fun apply!358 (ListLongMap!8651 (_ BitVec 64)) V!24717)

(declare-fun get!11663 (ValueCell!6978 V!24717) V!24717)

(declare-fun dynLambda!969 (Int (_ BitVec 64)) V!24717)

(assert (=> b!822656 (= e!457416 (= (apply!358 lt!370368 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)) (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!822657 () Bool)

(declare-fun res!561079 () Bool)

(declare-fun e!457421 () Bool)

(assert (=> b!822657 (=> (not res!561079) (not e!457421))))

(assert (=> b!822657 (= res!561079 (not (contains!4169 lt!370368 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!104837 () Bool)

(assert (=> d!104837 e!457421))

(declare-fun res!561081 () Bool)

(assert (=> d!104837 (=> (not res!561081) (not e!457421))))

(assert (=> d!104837 (= res!561081 (not (contains!4169 lt!370368 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!457422 () ListLongMap!8651)

(assert (=> d!104837 (= lt!370368 e!457422)))

(declare-fun c!89288 () Bool)

(assert (=> d!104837 (= c!89288 (bvsge #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> d!104837 (validMask!0 mask!1312)))

(assert (=> d!104837 (= (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370368)))

(declare-fun b!822658 () Bool)

(declare-fun lt!370365 () Unit!28146)

(declare-fun lt!370369 () Unit!28146)

(assert (=> b!822658 (= lt!370365 lt!370369)))

(declare-fun lt!370366 () V!24717)

(declare-fun lt!370371 () ListLongMap!8651)

(declare-fun lt!370370 () (_ BitVec 64))

(declare-fun lt!370367 () (_ BitVec 64))

(assert (=> b!822658 (not (contains!4169 (+!1891 lt!370371 (tuple2!9829 lt!370370 lt!370366)) lt!370367))))

(declare-fun addStillNotContains!183 (ListLongMap!8651 (_ BitVec 64) V!24717 (_ BitVec 64)) Unit!28146)

(assert (=> b!822658 (= lt!370369 (addStillNotContains!183 lt!370371 lt!370370 lt!370366 lt!370367))))

(assert (=> b!822658 (= lt!370367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!822658 (= lt!370366 (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!822658 (= lt!370370 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822658 (= lt!370371 call!35756)))

(assert (=> b!822658 (= e!457420 (+!1891 call!35756 (tuple2!9829 (select (arr!21933 _keys!976) #b00000000000000000000000000000000) (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!822659 () Bool)

(assert (=> b!822659 (= e!457422 (ListLongMap!8652 Nil!15641))))

(declare-fun b!822660 () Bool)

(declare-fun e!457417 () Bool)

(assert (=> b!822660 (= e!457417 (= lt!370368 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35753 () Bool)

(assert (=> bm!35753 (= call!35756 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!822661 () Bool)

(declare-fun e!457419 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!822661 (= e!457419 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822661 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!822662 () Bool)

(assert (=> b!822662 (= e!457421 e!457418)))

(declare-fun c!89286 () Bool)

(assert (=> b!822662 (= c!89286 e!457419)))

(declare-fun res!561078 () Bool)

(assert (=> b!822662 (=> (not res!561078) (not e!457419))))

(assert (=> b!822662 (= res!561078 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822663 () Bool)

(assert (=> b!822663 (= e!457422 e!457420)))

(declare-fun c!89285 () Bool)

(assert (=> b!822663 (= c!89285 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822664 () Bool)

(assert (=> b!822664 (= e!457418 e!457417)))

(declare-fun c!89287 () Bool)

(assert (=> b!822664 (= c!89287 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822665 () Bool)

(declare-fun isEmpty!640 (ListLongMap!8651) Bool)

(assert (=> b!822665 (= e!457417 (isEmpty!640 lt!370368))))

(assert (= (and d!104837 c!89288) b!822659))

(assert (= (and d!104837 (not c!89288)) b!822663))

(assert (= (and b!822663 c!89285) b!822658))

(assert (= (and b!822663 (not c!89285)) b!822654))

(assert (= (or b!822658 b!822654) bm!35753))

(assert (= (and d!104837 res!561081) b!822657))

(assert (= (and b!822657 res!561079) b!822662))

(assert (= (and b!822662 res!561078) b!822661))

(assert (= (and b!822662 c!89286) b!822655))

(assert (= (and b!822662 (not c!89286)) b!822664))

(assert (= (and b!822655 res!561080) b!822656))

(assert (= (and b!822664 c!89287) b!822660))

(assert (= (and b!822664 (not c!89287)) b!822665))

(declare-fun b_lambda!11031 () Bool)

(assert (=> (not b_lambda!11031) (not b!822656)))

(declare-fun t!21986 () Bool)

(declare-fun tb!4197 () Bool)

(assert (=> (and start!70820 (= defaultEntry!796 defaultEntry!796) t!21986) tb!4197))

(declare-fun result!7931 () Bool)

(assert (=> tb!4197 (= result!7931 tp_is_empty!14787)))

(assert (=> b!822656 t!21986))

(declare-fun b_and!21953 () Bool)

(assert (= b_and!21949 (and (=> t!21986 result!7931) b_and!21953)))

(declare-fun b_lambda!11033 () Bool)

(assert (=> (not b_lambda!11033) (not b!822658)))

(assert (=> b!822658 t!21986))

(declare-fun b_and!21955 () Bool)

(assert (= b_and!21953 (and (=> t!21986 result!7931) b_and!21955)))

(declare-fun m!764571 () Bool)

(assert (=> b!822655 m!764571))

(assert (=> b!822655 m!764571))

(declare-fun m!764573 () Bool)

(assert (=> b!822655 m!764573))

(declare-fun m!764575 () Bool)

(assert (=> b!822665 m!764575))

(declare-fun m!764577 () Bool)

(assert (=> bm!35753 m!764577))

(assert (=> b!822661 m!764571))

(assert (=> b!822661 m!764571))

(declare-fun m!764579 () Bool)

(assert (=> b!822661 m!764579))

(assert (=> b!822660 m!764577))

(assert (=> b!822663 m!764571))

(assert (=> b!822663 m!764571))

(assert (=> b!822663 m!764579))

(declare-fun m!764581 () Bool)

(assert (=> b!822657 m!764581))

(declare-fun m!764583 () Bool)

(assert (=> b!822658 m!764583))

(declare-fun m!764585 () Bool)

(assert (=> b!822658 m!764585))

(declare-fun m!764587 () Bool)

(assert (=> b!822658 m!764587))

(declare-fun m!764589 () Bool)

(assert (=> b!822658 m!764589))

(assert (=> b!822658 m!764587))

(assert (=> b!822658 m!764571))

(declare-fun m!764591 () Bool)

(assert (=> b!822658 m!764591))

(assert (=> b!822658 m!764585))

(declare-fun m!764593 () Bool)

(assert (=> b!822658 m!764593))

(assert (=> b!822658 m!764583))

(declare-fun m!764595 () Bool)

(assert (=> b!822658 m!764595))

(assert (=> b!822656 m!764587))

(assert (=> b!822656 m!764571))

(assert (=> b!822656 m!764585))

(assert (=> b!822656 m!764585))

(assert (=> b!822656 m!764587))

(assert (=> b!822656 m!764589))

(assert (=> b!822656 m!764571))

(declare-fun m!764597 () Bool)

(assert (=> b!822656 m!764597))

(declare-fun m!764599 () Bool)

(assert (=> d!104837 m!764599))

(assert (=> d!104837 m!764511))

(assert (=> b!822604 d!104837))

(declare-fun b!822668 () Bool)

(declare-fun e!457427 () ListLongMap!8651)

(declare-fun call!35757 () ListLongMap!8651)

(assert (=> b!822668 (= e!457427 call!35757)))

(declare-fun b!822669 () Bool)

(declare-fun e!457425 () Bool)

(declare-fun e!457423 () Bool)

(assert (=> b!822669 (= e!457425 e!457423)))

(assert (=> b!822669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun res!561084 () Bool)

(declare-fun lt!370375 () ListLongMap!8651)

(assert (=> b!822669 (= res!561084 (contains!4169 lt!370375 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822669 (=> (not res!561084) (not e!457423))))

(declare-fun b!822670 () Bool)

(assert (=> b!822670 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> b!822670 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22355 _values!788)))))

(assert (=> b!822670 (= e!457423 (= (apply!358 lt!370375 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)) (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!822671 () Bool)

(declare-fun res!561083 () Bool)

(declare-fun e!457428 () Bool)

(assert (=> b!822671 (=> (not res!561083) (not e!457428))))

(assert (=> b!822671 (= res!561083 (not (contains!4169 lt!370375 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!104839 () Bool)

(assert (=> d!104839 e!457428))

(declare-fun res!561085 () Bool)

(assert (=> d!104839 (=> (not res!561085) (not e!457428))))

(assert (=> d!104839 (= res!561085 (not (contains!4169 lt!370375 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!457429 () ListLongMap!8651)

(assert (=> d!104839 (= lt!370375 e!457429)))

(declare-fun c!89292 () Bool)

(assert (=> d!104839 (= c!89292 (bvsge #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> d!104839 (validMask!0 mask!1312)))

(assert (=> d!104839 (= (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370375)))

(declare-fun b!822672 () Bool)

(declare-fun lt!370372 () Unit!28146)

(declare-fun lt!370376 () Unit!28146)

(assert (=> b!822672 (= lt!370372 lt!370376)))

(declare-fun lt!370373 () V!24717)

(declare-fun lt!370378 () ListLongMap!8651)

(declare-fun lt!370377 () (_ BitVec 64))

(declare-fun lt!370374 () (_ BitVec 64))

(assert (=> b!822672 (not (contains!4169 (+!1891 lt!370378 (tuple2!9829 lt!370377 lt!370373)) lt!370374))))

(assert (=> b!822672 (= lt!370376 (addStillNotContains!183 lt!370378 lt!370377 lt!370373 lt!370374))))

(assert (=> b!822672 (= lt!370374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!822672 (= lt!370373 (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!822672 (= lt!370377 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822672 (= lt!370378 call!35757)))

(assert (=> b!822672 (= e!457427 (+!1891 call!35757 (tuple2!9829 (select (arr!21933 _keys!976) #b00000000000000000000000000000000) (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!822673 () Bool)

(assert (=> b!822673 (= e!457429 (ListLongMap!8652 Nil!15641))))

(declare-fun e!457424 () Bool)

(declare-fun b!822674 () Bool)

(assert (=> b!822674 (= e!457424 (= lt!370375 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun bm!35754 () Bool)

(assert (=> bm!35754 (= call!35757 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!822675 () Bool)

(declare-fun e!457426 () Bool)

(assert (=> b!822675 (= e!457426 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822675 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!822676 () Bool)

(assert (=> b!822676 (= e!457428 e!457425)))

(declare-fun c!89290 () Bool)

(assert (=> b!822676 (= c!89290 e!457426)))

(declare-fun res!561082 () Bool)

(assert (=> b!822676 (=> (not res!561082) (not e!457426))))

(assert (=> b!822676 (= res!561082 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822677 () Bool)

(assert (=> b!822677 (= e!457429 e!457427)))

(declare-fun c!89289 () Bool)

(assert (=> b!822677 (= c!89289 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822678 () Bool)

(assert (=> b!822678 (= e!457425 e!457424)))

(declare-fun c!89291 () Bool)

(assert (=> b!822678 (= c!89291 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822679 () Bool)

(assert (=> b!822679 (= e!457424 (isEmpty!640 lt!370375))))

(assert (= (and d!104839 c!89292) b!822673))

(assert (= (and d!104839 (not c!89292)) b!822677))

(assert (= (and b!822677 c!89289) b!822672))

(assert (= (and b!822677 (not c!89289)) b!822668))

(assert (= (or b!822672 b!822668) bm!35754))

(assert (= (and d!104839 res!561085) b!822671))

(assert (= (and b!822671 res!561083) b!822676))

(assert (= (and b!822676 res!561082) b!822675))

(assert (= (and b!822676 c!89290) b!822669))

(assert (= (and b!822676 (not c!89290)) b!822678))

(assert (= (and b!822669 res!561084) b!822670))

(assert (= (and b!822678 c!89291) b!822674))

(assert (= (and b!822678 (not c!89291)) b!822679))

(declare-fun b_lambda!11035 () Bool)

(assert (=> (not b_lambda!11035) (not b!822670)))

(assert (=> b!822670 t!21986))

(declare-fun b_and!21957 () Bool)

(assert (= b_and!21955 (and (=> t!21986 result!7931) b_and!21957)))

(declare-fun b_lambda!11037 () Bool)

(assert (=> (not b_lambda!11037) (not b!822672)))

(assert (=> b!822672 t!21986))

(declare-fun b_and!21959 () Bool)

(assert (= b_and!21957 (and (=> t!21986 result!7931) b_and!21959)))

(assert (=> b!822669 m!764571))

(assert (=> b!822669 m!764571))

(declare-fun m!764601 () Bool)

(assert (=> b!822669 m!764601))

(declare-fun m!764603 () Bool)

(assert (=> b!822679 m!764603))

(declare-fun m!764605 () Bool)

(assert (=> bm!35754 m!764605))

(assert (=> b!822675 m!764571))

(assert (=> b!822675 m!764571))

(assert (=> b!822675 m!764579))

(assert (=> b!822674 m!764605))

(assert (=> b!822677 m!764571))

(assert (=> b!822677 m!764571))

(assert (=> b!822677 m!764579))

(declare-fun m!764607 () Bool)

(assert (=> b!822671 m!764607))

(declare-fun m!764609 () Bool)

(assert (=> b!822672 m!764609))

(assert (=> b!822672 m!764585))

(assert (=> b!822672 m!764587))

(assert (=> b!822672 m!764589))

(assert (=> b!822672 m!764587))

(assert (=> b!822672 m!764571))

(declare-fun m!764611 () Bool)

(assert (=> b!822672 m!764611))

(assert (=> b!822672 m!764585))

(declare-fun m!764613 () Bool)

(assert (=> b!822672 m!764613))

(assert (=> b!822672 m!764609))

(declare-fun m!764615 () Bool)

(assert (=> b!822672 m!764615))

(assert (=> b!822670 m!764587))

(assert (=> b!822670 m!764571))

(assert (=> b!822670 m!764585))

(assert (=> b!822670 m!764585))

(assert (=> b!822670 m!764587))

(assert (=> b!822670 m!764589))

(assert (=> b!822670 m!764571))

(declare-fun m!764617 () Bool)

(assert (=> b!822670 m!764617))

(declare-fun m!764619 () Bool)

(assert (=> d!104839 m!764619))

(assert (=> d!104839 m!764511))

(assert (=> b!822604 d!104839))

(declare-fun b!822690 () Bool)

(declare-fun e!457439 () Bool)

(declare-fun call!35760 () Bool)

(assert (=> b!822690 (= e!457439 call!35760)))

(declare-fun b!822691 () Bool)

(declare-fun e!457440 () Bool)

(assert (=> b!822691 (= e!457440 e!457439)))

(declare-fun c!89295 () Bool)

(assert (=> b!822691 (= c!89295 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822692 () Bool)

(assert (=> b!822692 (= e!457439 call!35760)))

(declare-fun d!104841 () Bool)

(declare-fun res!561093 () Bool)

(declare-fun e!457441 () Bool)

(assert (=> d!104841 (=> res!561093 e!457441)))

(assert (=> d!104841 (= res!561093 (bvsge #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> d!104841 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15642) e!457441)))

(declare-fun bm!35757 () Bool)

(assert (=> bm!35757 (= call!35760 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89295 (Cons!15641 (select (arr!21933 _keys!976) #b00000000000000000000000000000000) Nil!15642) Nil!15642)))))

(declare-fun b!822693 () Bool)

(declare-fun e!457438 () Bool)

(declare-fun contains!4170 (List!15645 (_ BitVec 64)) Bool)

(assert (=> b!822693 (= e!457438 (contains!4170 Nil!15642 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822694 () Bool)

(assert (=> b!822694 (= e!457441 e!457440)))

(declare-fun res!561094 () Bool)

(assert (=> b!822694 (=> (not res!561094) (not e!457440))))

(assert (=> b!822694 (= res!561094 (not e!457438))))

(declare-fun res!561092 () Bool)

(assert (=> b!822694 (=> (not res!561092) (not e!457438))))

(assert (=> b!822694 (= res!561092 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104841 (not res!561093)) b!822694))

(assert (= (and b!822694 res!561092) b!822693))

(assert (= (and b!822694 res!561094) b!822691))

(assert (= (and b!822691 c!89295) b!822690))

(assert (= (and b!822691 (not c!89295)) b!822692))

(assert (= (or b!822690 b!822692) bm!35757))

(assert (=> b!822691 m!764571))

(assert (=> b!822691 m!764571))

(assert (=> b!822691 m!764579))

(assert (=> bm!35757 m!764571))

(declare-fun m!764621 () Bool)

(assert (=> bm!35757 m!764621))

(assert (=> b!822693 m!764571))

(assert (=> b!822693 m!764571))

(declare-fun m!764623 () Bool)

(assert (=> b!822693 m!764623))

(assert (=> b!822694 m!764571))

(assert (=> b!822694 m!764571))

(assert (=> b!822694 m!764579))

(assert (=> b!822603 d!104841))

(declare-fun d!104843 () Bool)

(declare-fun e!457444 () Bool)

(assert (=> d!104843 e!457444))

(declare-fun res!561100 () Bool)

(assert (=> d!104843 (=> (not res!561100) (not e!457444))))

(declare-fun lt!370388 () ListLongMap!8651)

(assert (=> d!104843 (= res!561100 (contains!4169 lt!370388 (_1!4925 lt!370316)))))

(declare-fun lt!370390 () List!15644)

(assert (=> d!104843 (= lt!370388 (ListLongMap!8652 lt!370390))))

(declare-fun lt!370387 () Unit!28146)

(declare-fun lt!370389 () Unit!28146)

(assert (=> d!104843 (= lt!370387 lt!370389)))

(declare-datatypes ((Option!410 0))(
  ( (Some!409 (v!9874 V!24717)) (None!408) )
))
(declare-fun getValueByKey!404 (List!15644 (_ BitVec 64)) Option!410)

(assert (=> d!104843 (= (getValueByKey!404 lt!370390 (_1!4925 lt!370316)) (Some!409 (_2!4925 lt!370316)))))

(declare-fun lemmaContainsTupThenGetReturnValue!218 (List!15644 (_ BitVec 64) V!24717) Unit!28146)

(assert (=> d!104843 (= lt!370389 (lemmaContainsTupThenGetReturnValue!218 lt!370390 (_1!4925 lt!370316) (_2!4925 lt!370316)))))

(declare-fun insertStrictlySorted!257 (List!15644 (_ BitVec 64) V!24717) List!15644)

(assert (=> d!104843 (= lt!370390 (insertStrictlySorted!257 (toList!4341 lt!370317) (_1!4925 lt!370316) (_2!4925 lt!370316)))))

(assert (=> d!104843 (= (+!1891 lt!370317 lt!370316) lt!370388)))

(declare-fun b!822699 () Bool)

(declare-fun res!561099 () Bool)

(assert (=> b!822699 (=> (not res!561099) (not e!457444))))

(assert (=> b!822699 (= res!561099 (= (getValueByKey!404 (toList!4341 lt!370388) (_1!4925 lt!370316)) (Some!409 (_2!4925 lt!370316))))))

(declare-fun b!822700 () Bool)

(declare-fun contains!4171 (List!15644 tuple2!9828) Bool)

(assert (=> b!822700 (= e!457444 (contains!4171 (toList!4341 lt!370388) lt!370316))))

(assert (= (and d!104843 res!561100) b!822699))

(assert (= (and b!822699 res!561099) b!822700))

(declare-fun m!764625 () Bool)

(assert (=> d!104843 m!764625))

(declare-fun m!764627 () Bool)

(assert (=> d!104843 m!764627))

(declare-fun m!764629 () Bool)

(assert (=> d!104843 m!764629))

(declare-fun m!764631 () Bool)

(assert (=> d!104843 m!764631))

(declare-fun m!764633 () Bool)

(assert (=> b!822699 m!764633))

(declare-fun m!764635 () Bool)

(assert (=> b!822700 m!764635))

(assert (=> b!822598 d!104843))

(declare-fun d!104845 () Bool)

(declare-fun e!457445 () Bool)

(assert (=> d!104845 e!457445))

(declare-fun res!561102 () Bool)

(assert (=> d!104845 (=> (not res!561102) (not e!457445))))

(declare-fun lt!370392 () ListLongMap!8651)

(assert (=> d!104845 (= res!561102 (contains!4169 lt!370392 (_1!4925 lt!370312)))))

(declare-fun lt!370394 () List!15644)

(assert (=> d!104845 (= lt!370392 (ListLongMap!8652 lt!370394))))

(declare-fun lt!370391 () Unit!28146)

(declare-fun lt!370393 () Unit!28146)

(assert (=> d!104845 (= lt!370391 lt!370393)))

(assert (=> d!104845 (= (getValueByKey!404 lt!370394 (_1!4925 lt!370312)) (Some!409 (_2!4925 lt!370312)))))

(assert (=> d!104845 (= lt!370393 (lemmaContainsTupThenGetReturnValue!218 lt!370394 (_1!4925 lt!370312) (_2!4925 lt!370312)))))

(assert (=> d!104845 (= lt!370394 (insertStrictlySorted!257 (toList!4341 (+!1891 lt!370317 lt!370316)) (_1!4925 lt!370312) (_2!4925 lt!370312)))))

(assert (=> d!104845 (= (+!1891 (+!1891 lt!370317 lt!370316) lt!370312) lt!370392)))

(declare-fun b!822701 () Bool)

(declare-fun res!561101 () Bool)

(assert (=> b!822701 (=> (not res!561101) (not e!457445))))

(assert (=> b!822701 (= res!561101 (= (getValueByKey!404 (toList!4341 lt!370392) (_1!4925 lt!370312)) (Some!409 (_2!4925 lt!370312))))))

(declare-fun b!822702 () Bool)

(assert (=> b!822702 (= e!457445 (contains!4171 (toList!4341 lt!370392) lt!370312))))

(assert (= (and d!104845 res!561102) b!822701))

(assert (= (and b!822701 res!561101) b!822702))

(declare-fun m!764637 () Bool)

(assert (=> d!104845 m!764637))

(declare-fun m!764639 () Bool)

(assert (=> d!104845 m!764639))

(declare-fun m!764641 () Bool)

(assert (=> d!104845 m!764641))

(declare-fun m!764643 () Bool)

(assert (=> d!104845 m!764643))

(declare-fun m!764645 () Bool)

(assert (=> b!822701 m!764645))

(declare-fun m!764647 () Bool)

(assert (=> b!822702 m!764647))

(assert (=> b!822598 d!104845))

(declare-fun b!822745 () Bool)

(declare-fun e!457480 () ListLongMap!8651)

(declare-fun call!35777 () ListLongMap!8651)

(assert (=> b!822745 (= e!457480 call!35777)))

(declare-fun b!822746 () Bool)

(declare-fun call!35781 () ListLongMap!8651)

(assert (=> b!822746 (= e!457480 call!35781)))

(declare-fun b!822747 () Bool)

(declare-fun e!457483 () ListLongMap!8651)

(declare-fun e!457473 () ListLongMap!8651)

(assert (=> b!822747 (= e!457483 e!457473)))

(declare-fun c!89308 () Bool)

(assert (=> b!822747 (= c!89308 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35772 () Bool)

(declare-fun call!35775 () Bool)

(declare-fun lt!370454 () ListLongMap!8651)

(assert (=> bm!35772 (= call!35775 (contains!4169 lt!370454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35773 () Bool)

(declare-fun call!35778 () ListLongMap!8651)

(assert (=> bm!35773 (= call!35778 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35774 () Bool)

(declare-fun call!35779 () ListLongMap!8651)

(assert (=> bm!35774 (= call!35779 call!35778)))

(declare-fun b!822748 () Bool)

(declare-fun e!457475 () Unit!28146)

(declare-fun lt!370455 () Unit!28146)

(assert (=> b!822748 (= e!457475 lt!370455)))

(declare-fun lt!370442 () ListLongMap!8651)

(assert (=> b!822748 (= lt!370442 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370451 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370451 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370444 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370444 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370448 () Unit!28146)

(declare-fun addStillContains!311 (ListLongMap!8651 (_ BitVec 64) V!24717 (_ BitVec 64)) Unit!28146)

(assert (=> b!822748 (= lt!370448 (addStillContains!311 lt!370442 lt!370451 zeroValueBefore!34 lt!370444))))

(assert (=> b!822748 (contains!4169 (+!1891 lt!370442 (tuple2!9829 lt!370451 zeroValueBefore!34)) lt!370444)))

(declare-fun lt!370456 () Unit!28146)

(assert (=> b!822748 (= lt!370456 lt!370448)))

(declare-fun lt!370460 () ListLongMap!8651)

(assert (=> b!822748 (= lt!370460 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370458 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370458 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370457 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370457 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370445 () Unit!28146)

(declare-fun addApplyDifferent!311 (ListLongMap!8651 (_ BitVec 64) V!24717 (_ BitVec 64)) Unit!28146)

(assert (=> b!822748 (= lt!370445 (addApplyDifferent!311 lt!370460 lt!370458 minValue!754 lt!370457))))

(assert (=> b!822748 (= (apply!358 (+!1891 lt!370460 (tuple2!9829 lt!370458 minValue!754)) lt!370457) (apply!358 lt!370460 lt!370457))))

(declare-fun lt!370447 () Unit!28146)

(assert (=> b!822748 (= lt!370447 lt!370445)))

(declare-fun lt!370453 () ListLongMap!8651)

(assert (=> b!822748 (= lt!370453 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370440 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370439 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370439 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370449 () Unit!28146)

(assert (=> b!822748 (= lt!370449 (addApplyDifferent!311 lt!370453 lt!370440 zeroValueBefore!34 lt!370439))))

(assert (=> b!822748 (= (apply!358 (+!1891 lt!370453 (tuple2!9829 lt!370440 zeroValueBefore!34)) lt!370439) (apply!358 lt!370453 lt!370439))))

(declare-fun lt!370450 () Unit!28146)

(assert (=> b!822748 (= lt!370450 lt!370449)))

(declare-fun lt!370452 () ListLongMap!8651)

(assert (=> b!822748 (= lt!370452 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370459 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370459 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370441 () (_ BitVec 64))

(assert (=> b!822748 (= lt!370441 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822748 (= lt!370455 (addApplyDifferent!311 lt!370452 lt!370459 minValue!754 lt!370441))))

(assert (=> b!822748 (= (apply!358 (+!1891 lt!370452 (tuple2!9829 lt!370459 minValue!754)) lt!370441) (apply!358 lt!370452 lt!370441))))

(declare-fun b!822749 () Bool)

(declare-fun res!561124 () Bool)

(declare-fun e!457476 () Bool)

(assert (=> b!822749 (=> (not res!561124) (not e!457476))))

(declare-fun e!457477 () Bool)

(assert (=> b!822749 (= res!561124 e!457477)))

(declare-fun c!89312 () Bool)

(assert (=> b!822749 (= c!89312 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!822750 () Bool)

(declare-fun call!35776 () Bool)

(assert (=> b!822750 (= e!457477 (not call!35776))))

(declare-fun b!822751 () Bool)

(declare-fun e!457481 () Bool)

(declare-fun e!457478 () Bool)

(assert (=> b!822751 (= e!457481 e!457478)))

(declare-fun res!561127 () Bool)

(assert (=> b!822751 (= res!561127 call!35775)))

(assert (=> b!822751 (=> (not res!561127) (not e!457478))))

(declare-fun bm!35775 () Bool)

(declare-fun call!35780 () ListLongMap!8651)

(assert (=> bm!35775 (= call!35777 call!35780)))

(declare-fun b!822752 () Bool)

(declare-fun res!561129 () Bool)

(assert (=> b!822752 (=> (not res!561129) (not e!457476))))

(declare-fun e!457484 () Bool)

(assert (=> b!822752 (= res!561129 e!457484)))

(declare-fun res!561121 () Bool)

(assert (=> b!822752 (=> res!561121 e!457484)))

(declare-fun e!457474 () Bool)

(assert (=> b!822752 (= res!561121 (not e!457474))))

(declare-fun res!561128 () Bool)

(assert (=> b!822752 (=> (not res!561128) (not e!457474))))

(assert (=> b!822752 (= res!561128 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun d!104847 () Bool)

(assert (=> d!104847 e!457476))

(declare-fun res!561122 () Bool)

(assert (=> d!104847 (=> (not res!561122) (not e!457476))))

(assert (=> d!104847 (= res!561122 (or (bvsge #b00000000000000000000000000000000 (size!22354 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))))

(declare-fun lt!370443 () ListLongMap!8651)

(assert (=> d!104847 (= lt!370454 lt!370443)))

(declare-fun lt!370446 () Unit!28146)

(assert (=> d!104847 (= lt!370446 e!457475)))

(declare-fun c!89310 () Bool)

(declare-fun e!457472 () Bool)

(assert (=> d!104847 (= c!89310 e!457472)))

(declare-fun res!561125 () Bool)

(assert (=> d!104847 (=> (not res!561125) (not e!457472))))

(assert (=> d!104847 (= res!561125 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> d!104847 (= lt!370443 e!457483)))

(declare-fun c!89313 () Bool)

(assert (=> d!104847 (= c!89313 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104847 (validMask!0 mask!1312)))

(assert (=> d!104847 (= (getCurrentListMap!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370454)))

(declare-fun b!822753 () Bool)

(assert (=> b!822753 (= e!457478 (= (apply!358 lt!370454 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!822754 () Bool)

(assert (=> b!822754 (= e!457481 (not call!35775))))

(declare-fun b!822755 () Bool)

(declare-fun Unit!28150 () Unit!28146)

(assert (=> b!822755 (= e!457475 Unit!28150)))

(declare-fun b!822756 () Bool)

(declare-fun e!457482 () Bool)

(assert (=> b!822756 (= e!457482 (= (apply!358 lt!370454 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!822757 () Bool)

(assert (=> b!822757 (= e!457476 e!457481)))

(declare-fun c!89309 () Bool)

(assert (=> b!822757 (= c!89309 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35776 () Bool)

(assert (=> bm!35776 (= call!35776 (contains!4169 lt!370454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35777 () Bool)

(assert (=> bm!35777 (= call!35780 (+!1891 (ite c!89313 call!35778 (ite c!89308 call!35779 call!35781)) (ite (or c!89313 c!89308) (tuple2!9829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!822758 () Bool)

(declare-fun c!89311 () Bool)

(assert (=> b!822758 (= c!89311 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!822758 (= e!457473 e!457480)))

(declare-fun b!822759 () Bool)

(assert (=> b!822759 (= e!457473 call!35777)))

(declare-fun b!822760 () Bool)

(assert (=> b!822760 (= e!457477 e!457482)))

(declare-fun res!561126 () Bool)

(assert (=> b!822760 (= res!561126 call!35776)))

(assert (=> b!822760 (=> (not res!561126) (not e!457482))))

(declare-fun b!822761 () Bool)

(assert (=> b!822761 (= e!457472 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35778 () Bool)

(assert (=> bm!35778 (= call!35781 call!35779)))

(declare-fun b!822762 () Bool)

(assert (=> b!822762 (= e!457474 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822763 () Bool)

(declare-fun e!457479 () Bool)

(assert (=> b!822763 (= e!457484 e!457479)))

(declare-fun res!561123 () Bool)

(assert (=> b!822763 (=> (not res!561123) (not e!457479))))

(assert (=> b!822763 (= res!561123 (contains!4169 lt!370454 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822763 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822764 () Bool)

(assert (=> b!822764 (= e!457479 (= (apply!358 lt!370454 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)) (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!822764 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22355 _values!788)))))

(assert (=> b!822764 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822765 () Bool)

(assert (=> b!822765 (= e!457483 (+!1891 call!35780 (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!104847 c!89313) b!822765))

(assert (= (and d!104847 (not c!89313)) b!822747))

(assert (= (and b!822747 c!89308) b!822759))

(assert (= (and b!822747 (not c!89308)) b!822758))

(assert (= (and b!822758 c!89311) b!822745))

(assert (= (and b!822758 (not c!89311)) b!822746))

(assert (= (or b!822745 b!822746) bm!35778))

(assert (= (or b!822759 bm!35778) bm!35774))

(assert (= (or b!822759 b!822745) bm!35775))

(assert (= (or b!822765 bm!35774) bm!35773))

(assert (= (or b!822765 bm!35775) bm!35777))

(assert (= (and d!104847 res!561125) b!822761))

(assert (= (and d!104847 c!89310) b!822748))

(assert (= (and d!104847 (not c!89310)) b!822755))

(assert (= (and d!104847 res!561122) b!822752))

(assert (= (and b!822752 res!561128) b!822762))

(assert (= (and b!822752 (not res!561121)) b!822763))

(assert (= (and b!822763 res!561123) b!822764))

(assert (= (and b!822752 res!561129) b!822749))

(assert (= (and b!822749 c!89312) b!822760))

(assert (= (and b!822749 (not c!89312)) b!822750))

(assert (= (and b!822760 res!561126) b!822756))

(assert (= (or b!822760 b!822750) bm!35776))

(assert (= (and b!822749 res!561124) b!822757))

(assert (= (and b!822757 c!89309) b!822751))

(assert (= (and b!822757 (not c!89309)) b!822754))

(assert (= (and b!822751 res!561127) b!822753))

(assert (= (or b!822751 b!822754) bm!35772))

(declare-fun b_lambda!11039 () Bool)

(assert (=> (not b_lambda!11039) (not b!822764)))

(assert (=> b!822764 t!21986))

(declare-fun b_and!21961 () Bool)

(assert (= b_and!21959 (and (=> t!21986 result!7931) b_and!21961)))

(assert (=> b!822762 m!764571))

(assert (=> b!822762 m!764571))

(assert (=> b!822762 m!764579))

(declare-fun m!764649 () Bool)

(assert (=> b!822753 m!764649))

(declare-fun m!764651 () Bool)

(assert (=> bm!35772 m!764651))

(declare-fun m!764653 () Bool)

(assert (=> bm!35777 m!764653))

(declare-fun m!764655 () Bool)

(assert (=> b!822765 m!764655))

(assert (=> b!822748 m!764509))

(declare-fun m!764657 () Bool)

(assert (=> b!822748 m!764657))

(declare-fun m!764659 () Bool)

(assert (=> b!822748 m!764659))

(declare-fun m!764661 () Bool)

(assert (=> b!822748 m!764661))

(declare-fun m!764663 () Bool)

(assert (=> b!822748 m!764663))

(declare-fun m!764665 () Bool)

(assert (=> b!822748 m!764665))

(declare-fun m!764667 () Bool)

(assert (=> b!822748 m!764667))

(declare-fun m!764669 () Bool)

(assert (=> b!822748 m!764669))

(declare-fun m!764671 () Bool)

(assert (=> b!822748 m!764671))

(declare-fun m!764673 () Bool)

(assert (=> b!822748 m!764673))

(declare-fun m!764675 () Bool)

(assert (=> b!822748 m!764675))

(declare-fun m!764677 () Bool)

(assert (=> b!822748 m!764677))

(assert (=> b!822748 m!764665))

(declare-fun m!764679 () Bool)

(assert (=> b!822748 m!764679))

(declare-fun m!764681 () Bool)

(assert (=> b!822748 m!764681))

(assert (=> b!822748 m!764673))

(assert (=> b!822748 m!764571))

(assert (=> b!822748 m!764667))

(declare-fun m!764683 () Bool)

(assert (=> b!822748 m!764683))

(assert (=> b!822748 m!764677))

(declare-fun m!764685 () Bool)

(assert (=> b!822748 m!764685))

(assert (=> b!822763 m!764571))

(assert (=> b!822763 m!764571))

(declare-fun m!764687 () Bool)

(assert (=> b!822763 m!764687))

(declare-fun m!764689 () Bool)

(assert (=> bm!35776 m!764689))

(assert (=> bm!35773 m!764509))

(assert (=> b!822761 m!764571))

(assert (=> b!822761 m!764571))

(assert (=> b!822761 m!764579))

(assert (=> d!104847 m!764511))

(declare-fun m!764691 () Bool)

(assert (=> b!822756 m!764691))

(assert (=> b!822764 m!764585))

(assert (=> b!822764 m!764571))

(declare-fun m!764693 () Bool)

(assert (=> b!822764 m!764693))

(assert (=> b!822764 m!764571))

(assert (=> b!822764 m!764587))

(assert (=> b!822764 m!764585))

(assert (=> b!822764 m!764587))

(assert (=> b!822764 m!764589))

(assert (=> b!822598 d!104847))

(declare-fun b!822766 () Bool)

(declare-fun e!457493 () ListLongMap!8651)

(declare-fun call!35784 () ListLongMap!8651)

(assert (=> b!822766 (= e!457493 call!35784)))

(declare-fun b!822767 () Bool)

(declare-fun call!35788 () ListLongMap!8651)

(assert (=> b!822767 (= e!457493 call!35788)))

(declare-fun b!822768 () Bool)

(declare-fun e!457496 () ListLongMap!8651)

(declare-fun e!457486 () ListLongMap!8651)

(assert (=> b!822768 (= e!457496 e!457486)))

(declare-fun c!89314 () Bool)

(assert (=> b!822768 (= c!89314 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35779 () Bool)

(declare-fun call!35782 () Bool)

(declare-fun lt!370476 () ListLongMap!8651)

(assert (=> bm!35779 (= call!35782 (contains!4169 lt!370476 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!35785 () ListLongMap!8651)

(declare-fun bm!35780 () Bool)

(assert (=> bm!35780 (= call!35785 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35781 () Bool)

(declare-fun call!35786 () ListLongMap!8651)

(assert (=> bm!35781 (= call!35786 call!35785)))

(declare-fun b!822769 () Bool)

(declare-fun e!457488 () Unit!28146)

(declare-fun lt!370477 () Unit!28146)

(assert (=> b!822769 (= e!457488 lt!370477)))

(declare-fun lt!370464 () ListLongMap!8651)

(assert (=> b!822769 (= lt!370464 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370473 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370466 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370466 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370470 () Unit!28146)

(assert (=> b!822769 (= lt!370470 (addStillContains!311 lt!370464 lt!370473 zeroValueAfter!34 lt!370466))))

(assert (=> b!822769 (contains!4169 (+!1891 lt!370464 (tuple2!9829 lt!370473 zeroValueAfter!34)) lt!370466)))

(declare-fun lt!370478 () Unit!28146)

(assert (=> b!822769 (= lt!370478 lt!370470)))

(declare-fun lt!370482 () ListLongMap!8651)

(assert (=> b!822769 (= lt!370482 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370480 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370480 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370479 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370479 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370467 () Unit!28146)

(assert (=> b!822769 (= lt!370467 (addApplyDifferent!311 lt!370482 lt!370480 minValue!754 lt!370479))))

(assert (=> b!822769 (= (apply!358 (+!1891 lt!370482 (tuple2!9829 lt!370480 minValue!754)) lt!370479) (apply!358 lt!370482 lt!370479))))

(declare-fun lt!370469 () Unit!28146)

(assert (=> b!822769 (= lt!370469 lt!370467)))

(declare-fun lt!370475 () ListLongMap!8651)

(assert (=> b!822769 (= lt!370475 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370462 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370461 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370461 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370471 () Unit!28146)

(assert (=> b!822769 (= lt!370471 (addApplyDifferent!311 lt!370475 lt!370462 zeroValueAfter!34 lt!370461))))

(assert (=> b!822769 (= (apply!358 (+!1891 lt!370475 (tuple2!9829 lt!370462 zeroValueAfter!34)) lt!370461) (apply!358 lt!370475 lt!370461))))

(declare-fun lt!370472 () Unit!28146)

(assert (=> b!822769 (= lt!370472 lt!370471)))

(declare-fun lt!370474 () ListLongMap!8651)

(assert (=> b!822769 (= lt!370474 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370481 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370481 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370463 () (_ BitVec 64))

(assert (=> b!822769 (= lt!370463 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!822769 (= lt!370477 (addApplyDifferent!311 lt!370474 lt!370481 minValue!754 lt!370463))))

(assert (=> b!822769 (= (apply!358 (+!1891 lt!370474 (tuple2!9829 lt!370481 minValue!754)) lt!370463) (apply!358 lt!370474 lt!370463))))

(declare-fun b!822770 () Bool)

(declare-fun res!561133 () Bool)

(declare-fun e!457489 () Bool)

(assert (=> b!822770 (=> (not res!561133) (not e!457489))))

(declare-fun e!457490 () Bool)

(assert (=> b!822770 (= res!561133 e!457490)))

(declare-fun c!89318 () Bool)

(assert (=> b!822770 (= c!89318 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!822771 () Bool)

(declare-fun call!35783 () Bool)

(assert (=> b!822771 (= e!457490 (not call!35783))))

(declare-fun b!822772 () Bool)

(declare-fun e!457494 () Bool)

(declare-fun e!457491 () Bool)

(assert (=> b!822772 (= e!457494 e!457491)))

(declare-fun res!561136 () Bool)

(assert (=> b!822772 (= res!561136 call!35782)))

(assert (=> b!822772 (=> (not res!561136) (not e!457491))))

(declare-fun bm!35782 () Bool)

(declare-fun call!35787 () ListLongMap!8651)

(assert (=> bm!35782 (= call!35784 call!35787)))

(declare-fun b!822773 () Bool)

(declare-fun res!561138 () Bool)

(assert (=> b!822773 (=> (not res!561138) (not e!457489))))

(declare-fun e!457497 () Bool)

(assert (=> b!822773 (= res!561138 e!457497)))

(declare-fun res!561130 () Bool)

(assert (=> b!822773 (=> res!561130 e!457497)))

(declare-fun e!457487 () Bool)

(assert (=> b!822773 (= res!561130 (not e!457487))))

(declare-fun res!561137 () Bool)

(assert (=> b!822773 (=> (not res!561137) (not e!457487))))

(assert (=> b!822773 (= res!561137 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun d!104849 () Bool)

(assert (=> d!104849 e!457489))

(declare-fun res!561131 () Bool)

(assert (=> d!104849 (=> (not res!561131) (not e!457489))))

(assert (=> d!104849 (= res!561131 (or (bvsge #b00000000000000000000000000000000 (size!22354 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))))

(declare-fun lt!370465 () ListLongMap!8651)

(assert (=> d!104849 (= lt!370476 lt!370465)))

(declare-fun lt!370468 () Unit!28146)

(assert (=> d!104849 (= lt!370468 e!457488)))

(declare-fun c!89316 () Bool)

(declare-fun e!457485 () Bool)

(assert (=> d!104849 (= c!89316 e!457485)))

(declare-fun res!561134 () Bool)

(assert (=> d!104849 (=> (not res!561134) (not e!457485))))

(assert (=> d!104849 (= res!561134 (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> d!104849 (= lt!370465 e!457496)))

(declare-fun c!89319 () Bool)

(assert (=> d!104849 (= c!89319 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104849 (validMask!0 mask!1312)))

(assert (=> d!104849 (= (getCurrentListMap!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370476)))

(declare-fun b!822774 () Bool)

(assert (=> b!822774 (= e!457491 (= (apply!358 lt!370476 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!822775 () Bool)

(assert (=> b!822775 (= e!457494 (not call!35782))))

(declare-fun b!822776 () Bool)

(declare-fun Unit!28151 () Unit!28146)

(assert (=> b!822776 (= e!457488 Unit!28151)))

(declare-fun b!822777 () Bool)

(declare-fun e!457495 () Bool)

(assert (=> b!822777 (= e!457495 (= (apply!358 lt!370476 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!822778 () Bool)

(assert (=> b!822778 (= e!457489 e!457494)))

(declare-fun c!89315 () Bool)

(assert (=> b!822778 (= c!89315 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35783 () Bool)

(assert (=> bm!35783 (= call!35783 (contains!4169 lt!370476 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35784 () Bool)

(assert (=> bm!35784 (= call!35787 (+!1891 (ite c!89319 call!35785 (ite c!89314 call!35786 call!35788)) (ite (or c!89319 c!89314) (tuple2!9829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!822779 () Bool)

(declare-fun c!89317 () Bool)

(assert (=> b!822779 (= c!89317 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!822779 (= e!457486 e!457493)))

(declare-fun b!822780 () Bool)

(assert (=> b!822780 (= e!457486 call!35784)))

(declare-fun b!822781 () Bool)

(assert (=> b!822781 (= e!457490 e!457495)))

(declare-fun res!561135 () Bool)

(assert (=> b!822781 (= res!561135 call!35783)))

(assert (=> b!822781 (=> (not res!561135) (not e!457495))))

(declare-fun b!822782 () Bool)

(assert (=> b!822782 (= e!457485 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35785 () Bool)

(assert (=> bm!35785 (= call!35788 call!35786)))

(declare-fun b!822783 () Bool)

(assert (=> b!822783 (= e!457487 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822784 () Bool)

(declare-fun e!457492 () Bool)

(assert (=> b!822784 (= e!457497 e!457492)))

(declare-fun res!561132 () Bool)

(assert (=> b!822784 (=> (not res!561132) (not e!457492))))

(assert (=> b!822784 (= res!561132 (contains!4169 lt!370476 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!822784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822785 () Bool)

(assert (=> b!822785 (= e!457492 (= (apply!358 lt!370476 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)) (get!11663 (select (arr!21934 _values!788) #b00000000000000000000000000000000) (dynLambda!969 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!822785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22355 _values!788)))))

(assert (=> b!822785 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(declare-fun b!822786 () Bool)

(assert (=> b!822786 (= e!457496 (+!1891 call!35787 (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!104849 c!89319) b!822786))

(assert (= (and d!104849 (not c!89319)) b!822768))

(assert (= (and b!822768 c!89314) b!822780))

(assert (= (and b!822768 (not c!89314)) b!822779))

(assert (= (and b!822779 c!89317) b!822766))

(assert (= (and b!822779 (not c!89317)) b!822767))

(assert (= (or b!822766 b!822767) bm!35785))

(assert (= (or b!822780 bm!35785) bm!35781))

(assert (= (or b!822780 b!822766) bm!35782))

(assert (= (or b!822786 bm!35781) bm!35780))

(assert (= (or b!822786 bm!35782) bm!35784))

(assert (= (and d!104849 res!561134) b!822782))

(assert (= (and d!104849 c!89316) b!822769))

(assert (= (and d!104849 (not c!89316)) b!822776))

(assert (= (and d!104849 res!561131) b!822773))

(assert (= (and b!822773 res!561137) b!822783))

(assert (= (and b!822773 (not res!561130)) b!822784))

(assert (= (and b!822784 res!561132) b!822785))

(assert (= (and b!822773 res!561138) b!822770))

(assert (= (and b!822770 c!89318) b!822781))

(assert (= (and b!822770 (not c!89318)) b!822771))

(assert (= (and b!822781 res!561135) b!822777))

(assert (= (or b!822781 b!822771) bm!35783))

(assert (= (and b!822770 res!561133) b!822778))

(assert (= (and b!822778 c!89315) b!822772))

(assert (= (and b!822778 (not c!89315)) b!822775))

(assert (= (and b!822772 res!561136) b!822774))

(assert (= (or b!822772 b!822775) bm!35779))

(declare-fun b_lambda!11041 () Bool)

(assert (=> (not b_lambda!11041) (not b!822785)))

(assert (=> b!822785 t!21986))

(declare-fun b_and!21963 () Bool)

(assert (= b_and!21961 (and (=> t!21986 result!7931) b_and!21963)))

(assert (=> b!822783 m!764571))

(assert (=> b!822783 m!764571))

(assert (=> b!822783 m!764579))

(declare-fun m!764695 () Bool)

(assert (=> b!822774 m!764695))

(declare-fun m!764697 () Bool)

(assert (=> bm!35779 m!764697))

(declare-fun m!764699 () Bool)

(assert (=> bm!35784 m!764699))

(declare-fun m!764701 () Bool)

(assert (=> b!822786 m!764701))

(assert (=> b!822769 m!764507))

(declare-fun m!764703 () Bool)

(assert (=> b!822769 m!764703))

(declare-fun m!764705 () Bool)

(assert (=> b!822769 m!764705))

(declare-fun m!764707 () Bool)

(assert (=> b!822769 m!764707))

(declare-fun m!764709 () Bool)

(assert (=> b!822769 m!764709))

(declare-fun m!764711 () Bool)

(assert (=> b!822769 m!764711))

(declare-fun m!764713 () Bool)

(assert (=> b!822769 m!764713))

(declare-fun m!764715 () Bool)

(assert (=> b!822769 m!764715))

(declare-fun m!764717 () Bool)

(assert (=> b!822769 m!764717))

(declare-fun m!764719 () Bool)

(assert (=> b!822769 m!764719))

(declare-fun m!764721 () Bool)

(assert (=> b!822769 m!764721))

(declare-fun m!764723 () Bool)

(assert (=> b!822769 m!764723))

(assert (=> b!822769 m!764711))

(declare-fun m!764725 () Bool)

(assert (=> b!822769 m!764725))

(declare-fun m!764727 () Bool)

(assert (=> b!822769 m!764727))

(assert (=> b!822769 m!764719))

(assert (=> b!822769 m!764571))

(assert (=> b!822769 m!764713))

(declare-fun m!764729 () Bool)

(assert (=> b!822769 m!764729))

(assert (=> b!822769 m!764723))

(declare-fun m!764731 () Bool)

(assert (=> b!822769 m!764731))

(assert (=> b!822784 m!764571))

(assert (=> b!822784 m!764571))

(declare-fun m!764733 () Bool)

(assert (=> b!822784 m!764733))

(declare-fun m!764735 () Bool)

(assert (=> bm!35783 m!764735))

(assert (=> bm!35780 m!764507))

(assert (=> b!822782 m!764571))

(assert (=> b!822782 m!764571))

(assert (=> b!822782 m!764579))

(assert (=> d!104849 m!764511))

(declare-fun m!764737 () Bool)

(assert (=> b!822777 m!764737))

(assert (=> b!822785 m!764585))

(assert (=> b!822785 m!764571))

(declare-fun m!764739 () Bool)

(assert (=> b!822785 m!764739))

(assert (=> b!822785 m!764571))

(assert (=> b!822785 m!764587))

(assert (=> b!822785 m!764585))

(assert (=> b!822785 m!764587))

(assert (=> b!822785 m!764589))

(assert (=> b!822598 d!104849))

(declare-fun d!104851 () Bool)

(assert (=> d!104851 (= (+!1891 (+!1891 lt!370317 (tuple2!9829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (+!1891 (+!1891 lt!370317 (tuple2!9829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (tuple2!9829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!370485 () Unit!28146)

(declare-fun choose!1400 (ListLongMap!8651 (_ BitVec 64) V!24717 (_ BitVec 64) V!24717) Unit!28146)

(assert (=> d!104851 (= lt!370485 (choose!1400 lt!370317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> d!104851 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!104851 (= (addCommutativeForDiffKeys!454 lt!370317 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754) lt!370485)))

(declare-fun bs!22958 () Bool)

(assert (= bs!22958 d!104851))

(declare-fun m!764741 () Bool)

(assert (=> bs!22958 m!764741))

(declare-fun m!764743 () Bool)

(assert (=> bs!22958 m!764743))

(declare-fun m!764745 () Bool)

(assert (=> bs!22958 m!764745))

(assert (=> bs!22958 m!764745))

(declare-fun m!764747 () Bool)

(assert (=> bs!22958 m!764747))

(assert (=> bs!22958 m!764741))

(declare-fun m!764749 () Bool)

(assert (=> bs!22958 m!764749))

(assert (=> b!822598 d!104851))

(declare-fun d!104853 () Bool)

(declare-fun e!457498 () Bool)

(assert (=> d!104853 e!457498))

(declare-fun res!561140 () Bool)

(assert (=> d!104853 (=> (not res!561140) (not e!457498))))

(declare-fun lt!370487 () ListLongMap!8651)

(assert (=> d!104853 (= res!561140 (contains!4169 lt!370487 (_1!4925 lt!370312)))))

(declare-fun lt!370489 () List!15644)

(assert (=> d!104853 (= lt!370487 (ListLongMap!8652 lt!370489))))

(declare-fun lt!370486 () Unit!28146)

(declare-fun lt!370488 () Unit!28146)

(assert (=> d!104853 (= lt!370486 lt!370488)))

(assert (=> d!104853 (= (getValueByKey!404 lt!370489 (_1!4925 lt!370312)) (Some!409 (_2!4925 lt!370312)))))

(assert (=> d!104853 (= lt!370488 (lemmaContainsTupThenGetReturnValue!218 lt!370489 (_1!4925 lt!370312) (_2!4925 lt!370312)))))

(assert (=> d!104853 (= lt!370489 (insertStrictlySorted!257 (toList!4341 lt!370317) (_1!4925 lt!370312) (_2!4925 lt!370312)))))

(assert (=> d!104853 (= (+!1891 lt!370317 lt!370312) lt!370487)))

(declare-fun b!822787 () Bool)

(declare-fun res!561139 () Bool)

(assert (=> b!822787 (=> (not res!561139) (not e!457498))))

(assert (=> b!822787 (= res!561139 (= (getValueByKey!404 (toList!4341 lt!370487) (_1!4925 lt!370312)) (Some!409 (_2!4925 lt!370312))))))

(declare-fun b!822788 () Bool)

(assert (=> b!822788 (= e!457498 (contains!4171 (toList!4341 lt!370487) lt!370312))))

(assert (= (and d!104853 res!561140) b!822787))

(assert (= (and b!822787 res!561139) b!822788))

(declare-fun m!764751 () Bool)

(assert (=> d!104853 m!764751))

(declare-fun m!764753 () Bool)

(assert (=> d!104853 m!764753))

(declare-fun m!764755 () Bool)

(assert (=> d!104853 m!764755))

(declare-fun m!764757 () Bool)

(assert (=> d!104853 m!764757))

(declare-fun m!764759 () Bool)

(assert (=> b!822787 m!764759))

(declare-fun m!764761 () Bool)

(assert (=> b!822788 m!764761))

(assert (=> b!822598 d!104853))

(declare-fun d!104855 () Bool)

(declare-fun e!457499 () Bool)

(assert (=> d!104855 e!457499))

(declare-fun res!561142 () Bool)

(assert (=> d!104855 (=> (not res!561142) (not e!457499))))

(declare-fun lt!370491 () ListLongMap!8651)

(assert (=> d!104855 (= res!561142 (contains!4169 lt!370491 (_1!4925 lt!370316)))))

(declare-fun lt!370493 () List!15644)

(assert (=> d!104855 (= lt!370491 (ListLongMap!8652 lt!370493))))

(declare-fun lt!370490 () Unit!28146)

(declare-fun lt!370492 () Unit!28146)

(assert (=> d!104855 (= lt!370490 lt!370492)))

(assert (=> d!104855 (= (getValueByKey!404 lt!370493 (_1!4925 lt!370316)) (Some!409 (_2!4925 lt!370316)))))

(assert (=> d!104855 (= lt!370492 (lemmaContainsTupThenGetReturnValue!218 lt!370493 (_1!4925 lt!370316) (_2!4925 lt!370316)))))

(assert (=> d!104855 (= lt!370493 (insertStrictlySorted!257 (toList!4341 lt!370311) (_1!4925 lt!370316) (_2!4925 lt!370316)))))

(assert (=> d!104855 (= (+!1891 lt!370311 lt!370316) lt!370491)))

(declare-fun b!822789 () Bool)

(declare-fun res!561141 () Bool)

(assert (=> b!822789 (=> (not res!561141) (not e!457499))))

(assert (=> b!822789 (= res!561141 (= (getValueByKey!404 (toList!4341 lt!370491) (_1!4925 lt!370316)) (Some!409 (_2!4925 lt!370316))))))

(declare-fun b!822790 () Bool)

(assert (=> b!822790 (= e!457499 (contains!4171 (toList!4341 lt!370491) lt!370316))))

(assert (= (and d!104855 res!561142) b!822789))

(assert (= (and b!822789 res!561141) b!822790))

(declare-fun m!764763 () Bool)

(assert (=> d!104855 m!764763))

(declare-fun m!764765 () Bool)

(assert (=> d!104855 m!764765))

(declare-fun m!764767 () Bool)

(assert (=> d!104855 m!764767))

(declare-fun m!764769 () Bool)

(assert (=> d!104855 m!764769))

(declare-fun m!764771 () Bool)

(assert (=> b!822789 m!764771))

(declare-fun m!764773 () Bool)

(assert (=> b!822790 m!764773))

(assert (=> b!822598 d!104855))

(declare-fun b!822799 () Bool)

(declare-fun e!457508 () Bool)

(declare-fun call!35791 () Bool)

(assert (=> b!822799 (= e!457508 call!35791)))

(declare-fun b!822800 () Bool)

(declare-fun e!457507 () Bool)

(assert (=> b!822800 (= e!457507 e!457508)))

(declare-fun c!89322 () Bool)

(assert (=> b!822800 (= c!89322 (validKeyInArray!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!822801 () Bool)

(declare-fun e!457506 () Bool)

(assert (=> b!822801 (= e!457508 e!457506)))

(declare-fun lt!370502 () (_ BitVec 64))

(assert (=> b!822801 (= lt!370502 (select (arr!21933 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370500 () Unit!28146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45766 (_ BitVec 64) (_ BitVec 32)) Unit!28146)

(assert (=> b!822801 (= lt!370500 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!370502 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!822801 (arrayContainsKey!0 _keys!976 lt!370502 #b00000000000000000000000000000000)))

(declare-fun lt!370501 () Unit!28146)

(assert (=> b!822801 (= lt!370501 lt!370500)))

(declare-fun res!561147 () Bool)

(declare-datatypes ((SeekEntryResult!8730 0))(
  ( (MissingZero!8730 (index!37291 (_ BitVec 32))) (Found!8730 (index!37292 (_ BitVec 32))) (Intermediate!8730 (undefined!9542 Bool) (index!37293 (_ BitVec 32)) (x!69381 (_ BitVec 32))) (Undefined!8730) (MissingVacant!8730 (index!37294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45766 (_ BitVec 32)) SeekEntryResult!8730)

(assert (=> b!822801 (= res!561147 (= (seekEntryOrOpen!0 (select (arr!21933 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8730 #b00000000000000000000000000000000)))))

(assert (=> b!822801 (=> (not res!561147) (not e!457506))))

(declare-fun b!822802 () Bool)

(assert (=> b!822802 (= e!457506 call!35791)))

(declare-fun d!104857 () Bool)

(declare-fun res!561148 () Bool)

(assert (=> d!104857 (=> res!561148 e!457507)))

(assert (=> d!104857 (= res!561148 (bvsge #b00000000000000000000000000000000 (size!22354 _keys!976)))))

(assert (=> d!104857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!457507)))

(declare-fun bm!35788 () Bool)

(assert (=> bm!35788 (= call!35791 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!104857 (not res!561148)) b!822800))

(assert (= (and b!822800 c!89322) b!822801))

(assert (= (and b!822800 (not c!89322)) b!822799))

(assert (= (and b!822801 res!561147) b!822802))

(assert (= (or b!822802 b!822799) bm!35788))

(assert (=> b!822800 m!764571))

(assert (=> b!822800 m!764571))

(assert (=> b!822800 m!764579))

(assert (=> b!822801 m!764571))

(declare-fun m!764775 () Bool)

(assert (=> b!822801 m!764775))

(declare-fun m!764777 () Bool)

(assert (=> b!822801 m!764777))

(assert (=> b!822801 m!764571))

(declare-fun m!764779 () Bool)

(assert (=> b!822801 m!764779))

(declare-fun m!764781 () Bool)

(assert (=> bm!35788 m!764781))

(assert (=> b!822602 d!104857))

(declare-fun mapNonEmpty!23797 () Bool)

(declare-fun mapRes!23797 () Bool)

(declare-fun tp!45985 () Bool)

(declare-fun e!457513 () Bool)

(assert (=> mapNonEmpty!23797 (= mapRes!23797 (and tp!45985 e!457513))))

(declare-fun mapRest!23797 () (Array (_ BitVec 32) ValueCell!6978))

(declare-fun mapValue!23797 () ValueCell!6978)

(declare-fun mapKey!23797 () (_ BitVec 32))

(assert (=> mapNonEmpty!23797 (= mapRest!23791 (store mapRest!23797 mapKey!23797 mapValue!23797))))

(declare-fun mapIsEmpty!23797 () Bool)

(assert (=> mapIsEmpty!23797 mapRes!23797))

(declare-fun condMapEmpty!23797 () Bool)

(declare-fun mapDefault!23797 () ValueCell!6978)

(assert (=> mapNonEmpty!23791 (= condMapEmpty!23797 (= mapRest!23791 ((as const (Array (_ BitVec 32) ValueCell!6978)) mapDefault!23797)))))

(declare-fun e!457514 () Bool)

(assert (=> mapNonEmpty!23791 (= tp!45976 (and e!457514 mapRes!23797))))

(declare-fun b!822810 () Bool)

(assert (=> b!822810 (= e!457514 tp_is_empty!14787)))

(declare-fun b!822809 () Bool)

(assert (=> b!822809 (= e!457513 tp_is_empty!14787)))

(assert (= (and mapNonEmpty!23791 condMapEmpty!23797) mapIsEmpty!23797))

(assert (= (and mapNonEmpty!23791 (not condMapEmpty!23797)) mapNonEmpty!23797))

(assert (= (and mapNonEmpty!23797 ((_ is ValueCellFull!6978) mapValue!23797)) b!822809))

(assert (= (and mapNonEmpty!23791 ((_ is ValueCellFull!6978) mapDefault!23797)) b!822810))

(declare-fun m!764783 () Bool)

(assert (=> mapNonEmpty!23797 m!764783))

(declare-fun b_lambda!11043 () Bool)

(assert (= b_lambda!11035 (or (and start!70820 b_free!13077) b_lambda!11043)))

(declare-fun b_lambda!11045 () Bool)

(assert (= b_lambda!11037 (or (and start!70820 b_free!13077) b_lambda!11045)))

(declare-fun b_lambda!11047 () Bool)

(assert (= b_lambda!11031 (or (and start!70820 b_free!13077) b_lambda!11047)))

(declare-fun b_lambda!11049 () Bool)

(assert (= b_lambda!11041 (or (and start!70820 b_free!13077) b_lambda!11049)))

(declare-fun b_lambda!11051 () Bool)

(assert (= b_lambda!11039 (or (and start!70820 b_free!13077) b_lambda!11051)))

(declare-fun b_lambda!11053 () Bool)

(assert (= b_lambda!11033 (or (and start!70820 b_free!13077) b_lambda!11053)))

(check-sat (not b!822694) (not b!822764) (not mapNonEmpty!23797) (not b!822788) (not b_lambda!11043) (not bm!35780) (not b_lambda!11045) (not b!822669) (not b!822782) (not b!822777) (not b!822785) (not b!822701) (not d!104837) (not b!822774) (not b!822663) (not b!822672) (not d!104835) (not b!822693) (not bm!35754) (not bm!35788) (not b!822753) (not d!104847) (not b_lambda!11047) (not b!822787) (not b_lambda!11049) (not bm!35784) (not b_lambda!11051) (not b!822661) (not bm!35753) (not b!822671) b_and!21963 (not d!104843) (not bm!35783) (not d!104855) (not d!104839) (not b!822789) (not b!822700) tp_is_empty!14787 (not b!822769) (not b!822670) (not b!822674) (not b!822665) (not b!822657) (not b!822800) (not b!822702) (not b!822762) (not d!104851) (not b!822677) (not bm!35757) (not b!822783) (not b!822656) (not b!822699) (not b!822748) (not bm!35779) (not d!104845) (not bm!35777) (not b!822658) (not b!822655) (not d!104849) (not b!822761) (not b!822679) (not bm!35773) (not b!822786) (not b!822801) (not b!822691) (not bm!35776) (not b!822675) (not bm!35772) (not b!822660) (not d!104853) (not b!822784) (not b_next!13077) (not b!822756) (not b_lambda!11053) (not b!822763) (not b!822790) (not b!822765))
(check-sat b_and!21963 (not b_next!13077))
