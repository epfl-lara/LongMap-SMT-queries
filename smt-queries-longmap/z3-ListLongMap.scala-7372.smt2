; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93952 () Bool)

(assert start!93952)

(declare-fun b_free!21411 () Bool)

(declare-fun b_next!21411 () Bool)

(assert (=> start!93952 (= b_free!21411 (not b_next!21411))))

(declare-fun tp!75659 () Bool)

(declare-fun b_and!34133 () Bool)

(assert (=> start!93952 (= tp!75659 b_and!34133)))

(declare-fun b!1062625 () Bool)

(declare-fun e!605333 () Bool)

(declare-fun tp_is_empty!25221 () Bool)

(assert (=> b!1062625 (= e!605333 tp_is_empty!25221)))

(declare-fun b!1062626 () Bool)

(declare-fun e!605337 () Bool)

(declare-fun e!605334 () Bool)

(assert (=> b!1062626 (= e!605337 e!605334)))

(declare-fun res!709555 () Bool)

(assert (=> b!1062626 (=> res!709555 e!605334)))

(declare-datatypes ((V!38763 0))(
  ( (V!38764 (val!12661 Int)) )
))
(declare-datatypes ((tuple2!16022 0))(
  ( (tuple2!16023 (_1!8022 (_ BitVec 64)) (_2!8022 V!38763)) )
))
(declare-datatypes ((List!22603 0))(
  ( (Nil!22600) (Cons!22599 (h!23808 tuple2!16022) (t!31914 List!22603)) )
))
(declare-datatypes ((ListLongMap!13991 0))(
  ( (ListLongMap!13992 (toList!7011 List!22603)) )
))
(declare-fun lt!468205 () ListLongMap!13991)

(declare-fun contains!6242 (ListLongMap!13991 (_ BitVec 64)) Bool)

(assert (=> b!1062626 (= res!709555 (contains!6242 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38763)

(declare-datatypes ((ValueCell!11907 0))(
  ( (ValueCellFull!11907 (v!15271 V!38763)) (EmptyCell!11907) )
))
(declare-datatypes ((array!67445 0))(
  ( (array!67446 (arr!32429 (Array (_ BitVec 32) ValueCell!11907)) (size!32965 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67445)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38763)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67447 0))(
  ( (array!67448 (arr!32430 (Array (_ BitVec 32) (_ BitVec 64))) (size!32966 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67447)

(declare-fun getCurrentListMap!3995 (array!67447 array!67445 (_ BitVec 32) (_ BitVec 32) V!38763 V!38763 (_ BitVec 32) Int) ListLongMap!13991)

(assert (=> b!1062626 (= lt!468205 (getCurrentListMap!3995 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062627 () Bool)

(declare-fun res!709551 () Bool)

(declare-fun e!605332 () Bool)

(assert (=> b!1062627 (=> (not res!709551) (not e!605332))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1062627 (= res!709551 (and (= (size!32965 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32966 _keys!1163) (size!32965 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!709552 () Bool)

(assert (=> start!93952 (=> (not res!709552) (not e!605332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93952 (= res!709552 (validMask!0 mask!1515))))

(assert (=> start!93952 e!605332))

(assert (=> start!93952 true))

(assert (=> start!93952 tp_is_empty!25221))

(declare-fun e!605336 () Bool)

(declare-fun array_inv!25122 (array!67445) Bool)

(assert (=> start!93952 (and (array_inv!25122 _values!955) e!605336)))

(assert (=> start!93952 tp!75659))

(declare-fun array_inv!25123 (array!67447) Bool)

(assert (=> start!93952 (array_inv!25123 _keys!1163)))

(declare-fun b!1062628 () Bool)

(declare-fun e!605335 () Bool)

(assert (=> b!1062628 (= e!605335 tp_is_empty!25221)))

(declare-fun mapNonEmpty!39505 () Bool)

(declare-fun mapRes!39505 () Bool)

(declare-fun tp!75658 () Bool)

(assert (=> mapNonEmpty!39505 (= mapRes!39505 (and tp!75658 e!605335))))

(declare-fun mapKey!39505 () (_ BitVec 32))

(declare-fun mapRest!39505 () (Array (_ BitVec 32) ValueCell!11907))

(declare-fun mapValue!39505 () ValueCell!11907)

(assert (=> mapNonEmpty!39505 (= (arr!32429 _values!955) (store mapRest!39505 mapKey!39505 mapValue!39505))))

(declare-fun b!1062629 () Bool)

(declare-fun res!709556 () Bool)

(assert (=> b!1062629 (=> (not res!709556) (not e!605332))))

(declare-datatypes ((List!22604 0))(
  ( (Nil!22601) (Cons!22600 (h!23809 (_ BitVec 64)) (t!31915 List!22604)) )
))
(declare-fun arrayNoDuplicates!0 (array!67447 (_ BitVec 32) List!22604) Bool)

(assert (=> b!1062629 (= res!709556 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22601))))

(declare-fun mapIsEmpty!39505 () Bool)

(assert (=> mapIsEmpty!39505 mapRes!39505))

(declare-fun b!1062630 () Bool)

(assert (=> b!1062630 (= e!605334 (bvsle #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun -!575 (ListLongMap!13991 (_ BitVec 64)) ListLongMap!13991)

(assert (=> b!1062630 (= (-!575 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468205)))

(declare-datatypes ((Unit!34820 0))(
  ( (Unit!34821) )
))
(declare-fun lt!468206 () Unit!34820)

(declare-fun removeNotPresentStillSame!22 (ListLongMap!13991 (_ BitVec 64)) Unit!34820)

(assert (=> b!1062630 (= lt!468206 (removeNotPresentStillSame!22 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062631 () Bool)

(declare-fun res!709553 () Bool)

(assert (=> b!1062631 (=> (not res!709553) (not e!605332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67447 (_ BitVec 32)) Bool)

(assert (=> b!1062631 (= res!709553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062632 () Bool)

(assert (=> b!1062632 (= e!605336 (and e!605333 mapRes!39505))))

(declare-fun condMapEmpty!39505 () Bool)

(declare-fun mapDefault!39505 () ValueCell!11907)

(assert (=> b!1062632 (= condMapEmpty!39505 (= (arr!32429 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11907)) mapDefault!39505)))))

(declare-fun b!1062633 () Bool)

(assert (=> b!1062633 (= e!605332 (not e!605337))))

(declare-fun res!709554 () Bool)

(assert (=> b!1062633 (=> res!709554 e!605337)))

(assert (=> b!1062633 (= res!709554 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468203 () ListLongMap!13991)

(declare-fun lt!468204 () ListLongMap!13991)

(assert (=> b!1062633 (= lt!468203 lt!468204)))

(declare-fun lt!468202 () Unit!34820)

(declare-fun zeroValueAfter!47 () V!38763)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!642 (array!67447 array!67445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38763 V!38763 V!38763 V!38763 (_ BitVec 32) Int) Unit!34820)

(assert (=> b!1062633 (= lt!468202 (lemmaNoChangeToArrayThenSameMapNoExtras!642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3605 (array!67447 array!67445 (_ BitVec 32) (_ BitVec 32) V!38763 V!38763 (_ BitVec 32) Int) ListLongMap!13991)

(assert (=> b!1062633 (= lt!468204 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062633 (= lt!468203 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!93952 res!709552) b!1062627))

(assert (= (and b!1062627 res!709551) b!1062631))

(assert (= (and b!1062631 res!709553) b!1062629))

(assert (= (and b!1062629 res!709556) b!1062633))

(assert (= (and b!1062633 (not res!709554)) b!1062626))

(assert (= (and b!1062626 (not res!709555)) b!1062630))

(assert (= (and b!1062632 condMapEmpty!39505) mapIsEmpty!39505))

(assert (= (and b!1062632 (not condMapEmpty!39505)) mapNonEmpty!39505))

(get-info :version)

(assert (= (and mapNonEmpty!39505 ((_ is ValueCellFull!11907) mapValue!39505)) b!1062628))

(assert (= (and b!1062632 ((_ is ValueCellFull!11907) mapDefault!39505)) b!1062625))

(assert (= start!93952 b!1062632))

(declare-fun m!981371 () Bool)

(assert (=> b!1062629 m!981371))

(declare-fun m!981373 () Bool)

(assert (=> start!93952 m!981373))

(declare-fun m!981375 () Bool)

(assert (=> start!93952 m!981375))

(declare-fun m!981377 () Bool)

(assert (=> start!93952 m!981377))

(declare-fun m!981379 () Bool)

(assert (=> mapNonEmpty!39505 m!981379))

(declare-fun m!981381 () Bool)

(assert (=> b!1062633 m!981381))

(declare-fun m!981383 () Bool)

(assert (=> b!1062633 m!981383))

(declare-fun m!981385 () Bool)

(assert (=> b!1062633 m!981385))

(declare-fun m!981387 () Bool)

(assert (=> b!1062630 m!981387))

(declare-fun m!981389 () Bool)

(assert (=> b!1062630 m!981389))

(declare-fun m!981391 () Bool)

(assert (=> b!1062626 m!981391))

(declare-fun m!981393 () Bool)

(assert (=> b!1062626 m!981393))

(declare-fun m!981395 () Bool)

(assert (=> b!1062631 m!981395))

(check-sat (not b!1062633) (not b!1062626) (not b!1062631) (not b_next!21411) (not b!1062629) (not start!93952) (not mapNonEmpty!39505) (not b!1062630) b_and!34133 tp_is_empty!25221)
(check-sat b_and!34133 (not b_next!21411))
(get-model)

(declare-fun b!1062669 () Bool)

(declare-fun e!605367 () Bool)

(declare-fun e!605366 () Bool)

(assert (=> b!1062669 (= e!605367 e!605366)))

(declare-fun lt!468228 () (_ BitVec 64))

(assert (=> b!1062669 (= lt!468228 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468230 () Unit!34820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67447 (_ BitVec 64) (_ BitVec 32)) Unit!34820)

(assert (=> b!1062669 (= lt!468230 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!468228 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1062669 (arrayContainsKey!0 _keys!1163 lt!468228 #b00000000000000000000000000000000)))

(declare-fun lt!468229 () Unit!34820)

(assert (=> b!1062669 (= lt!468229 lt!468230)))

(declare-fun res!709580 () Bool)

(declare-datatypes ((SeekEntryResult!9872 0))(
  ( (MissingZero!9872 (index!41859 (_ BitVec 32))) (Found!9872 (index!41860 (_ BitVec 32))) (Intermediate!9872 (undefined!10684 Bool) (index!41861 (_ BitVec 32)) (x!95078 (_ BitVec 32))) (Undefined!9872) (MissingVacant!9872 (index!41862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67447 (_ BitVec 32)) SeekEntryResult!9872)

(assert (=> b!1062669 (= res!709580 (= (seekEntryOrOpen!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9872 #b00000000000000000000000000000000)))))

(assert (=> b!1062669 (=> (not res!709580) (not e!605366))))

(declare-fun d!128863 () Bool)

(declare-fun res!709579 () Bool)

(declare-fun e!605368 () Bool)

(assert (=> d!128863 (=> res!709579 e!605368)))

(assert (=> d!128863 (= res!709579 (bvsge #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (=> d!128863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!605368)))

(declare-fun b!1062670 () Bool)

(assert (=> b!1062670 (= e!605368 e!605367)))

(declare-fun c!107242 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1062670 (= c!107242 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44909 () Bool)

(declare-fun call!44912 () Bool)

(assert (=> bm!44909 (= call!44912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1062671 () Bool)

(assert (=> b!1062671 (= e!605366 call!44912)))

(declare-fun b!1062672 () Bool)

(assert (=> b!1062672 (= e!605367 call!44912)))

(assert (= (and d!128863 (not res!709579)) b!1062670))

(assert (= (and b!1062670 c!107242) b!1062669))

(assert (= (and b!1062670 (not c!107242)) b!1062672))

(assert (= (and b!1062669 res!709580) b!1062671))

(assert (= (or b!1062671 b!1062672) bm!44909))

(declare-fun m!981423 () Bool)

(assert (=> b!1062669 m!981423))

(declare-fun m!981425 () Bool)

(assert (=> b!1062669 m!981425))

(declare-fun m!981427 () Bool)

(assert (=> b!1062669 m!981427))

(assert (=> b!1062669 m!981423))

(declare-fun m!981429 () Bool)

(assert (=> b!1062669 m!981429))

(assert (=> b!1062670 m!981423))

(assert (=> b!1062670 m!981423))

(declare-fun m!981431 () Bool)

(assert (=> b!1062670 m!981431))

(declare-fun m!981433 () Bool)

(assert (=> bm!44909 m!981433))

(assert (=> b!1062631 d!128863))

(declare-fun d!128865 () Bool)

(declare-fun lt!468233 () ListLongMap!13991)

(assert (=> d!128865 (not (contains!6242 lt!468233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!67 (List!22603 (_ BitVec 64)) List!22603)

(assert (=> d!128865 (= lt!468233 (ListLongMap!13992 (removeStrictlySorted!67 (toList!7011 lt!468205) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128865 (= (-!575 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468233)))

(declare-fun bs!31241 () Bool)

(assert (= bs!31241 d!128865))

(declare-fun m!981435 () Bool)

(assert (=> bs!31241 m!981435))

(declare-fun m!981437 () Bool)

(assert (=> bs!31241 m!981437))

(assert (=> b!1062630 d!128865))

(declare-fun d!128867 () Bool)

(assert (=> d!128867 (= (-!575 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468205)))

(declare-fun lt!468236 () Unit!34820)

(declare-fun choose!1724 (ListLongMap!13991 (_ BitVec 64)) Unit!34820)

(assert (=> d!128867 (= lt!468236 (choose!1724 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128867 (not (contains!6242 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128867 (= (removeNotPresentStillSame!22 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468236)))

(declare-fun bs!31242 () Bool)

(assert (= bs!31242 d!128867))

(assert (=> bs!31242 m!981387))

(declare-fun m!981439 () Bool)

(assert (=> bs!31242 m!981439))

(assert (=> bs!31242 m!981391))

(assert (=> b!1062630 d!128867))

(declare-fun d!128869 () Bool)

(declare-fun e!605373 () Bool)

(assert (=> d!128869 e!605373))

(declare-fun res!709583 () Bool)

(assert (=> d!128869 (=> res!709583 e!605373)))

(declare-fun lt!468248 () Bool)

(assert (=> d!128869 (= res!709583 (not lt!468248))))

(declare-fun lt!468246 () Bool)

(assert (=> d!128869 (= lt!468248 lt!468246)))

(declare-fun lt!468245 () Unit!34820)

(declare-fun e!605374 () Unit!34820)

(assert (=> d!128869 (= lt!468245 e!605374)))

(declare-fun c!107245 () Bool)

(assert (=> d!128869 (= c!107245 lt!468246)))

(declare-fun containsKey!572 (List!22603 (_ BitVec 64)) Bool)

(assert (=> d!128869 (= lt!468246 (containsKey!572 (toList!7011 lt!468205) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128869 (= (contains!6242 lt!468205 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468248)))

(declare-fun b!1062679 () Bool)

(declare-fun lt!468247 () Unit!34820)

(assert (=> b!1062679 (= e!605374 lt!468247)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!405 (List!22603 (_ BitVec 64)) Unit!34820)

(assert (=> b!1062679 (= lt!468247 (lemmaContainsKeyImpliesGetValueByKeyDefined!405 (toList!7011 lt!468205) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!648 0))(
  ( (Some!647 (v!15273 V!38763)) (None!646) )
))
(declare-fun isDefined!444 (Option!648) Bool)

(declare-fun getValueByKey!597 (List!22603 (_ BitVec 64)) Option!648)

(assert (=> b!1062679 (isDefined!444 (getValueByKey!597 (toList!7011 lt!468205) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062680 () Bool)

(declare-fun Unit!34824 () Unit!34820)

(assert (=> b!1062680 (= e!605374 Unit!34824)))

(declare-fun b!1062681 () Bool)

(assert (=> b!1062681 (= e!605373 (isDefined!444 (getValueByKey!597 (toList!7011 lt!468205) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128869 c!107245) b!1062679))

(assert (= (and d!128869 (not c!107245)) b!1062680))

(assert (= (and d!128869 (not res!709583)) b!1062681))

(declare-fun m!981441 () Bool)

(assert (=> d!128869 m!981441))

(declare-fun m!981443 () Bool)

(assert (=> b!1062679 m!981443))

(declare-fun m!981445 () Bool)

(assert (=> b!1062679 m!981445))

(assert (=> b!1062679 m!981445))

(declare-fun m!981447 () Bool)

(assert (=> b!1062679 m!981447))

(assert (=> b!1062681 m!981445))

(assert (=> b!1062681 m!981445))

(assert (=> b!1062681 m!981447))

(assert (=> b!1062626 d!128869))

(declare-fun b!1062725 () Bool)

(declare-fun e!605412 () Bool)

(assert (=> b!1062725 (= e!605412 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062726 () Bool)

(declare-fun e!605408 () Bool)

(declare-fun lt!468296 () ListLongMap!13991)

(declare-fun apply!919 (ListLongMap!13991 (_ BitVec 64)) V!38763)

(assert (=> b!1062726 (= e!605408 (= (apply!919 lt!468296 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1062727 () Bool)

(declare-fun e!605413 () Bool)

(declare-fun call!44930 () Bool)

(assert (=> b!1062727 (= e!605413 (not call!44930))))

(declare-fun b!1062728 () Bool)

(declare-fun e!605410 () Bool)

(assert (=> b!1062728 (= e!605410 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062729 () Bool)

(declare-fun e!605409 () Bool)

(assert (=> b!1062729 (= e!605409 (= (apply!919 lt!468296 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!44924 () Bool)

(declare-fun call!44928 () Bool)

(assert (=> bm!44924 (= call!44928 (contains!6242 lt!468296 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062730 () Bool)

(assert (=> b!1062730 (= e!605413 e!605408)))

(declare-fun res!709602 () Bool)

(assert (=> b!1062730 (= res!709602 call!44930)))

(assert (=> b!1062730 (=> (not res!709602) (not e!605408))))

(declare-fun b!1062731 () Bool)

(declare-fun e!605411 () Bool)

(assert (=> b!1062731 (= e!605411 (not call!44928))))

(declare-fun b!1062732 () Bool)

(declare-fun e!605402 () Unit!34820)

(declare-fun Unit!34825 () Unit!34820)

(assert (=> b!1062732 (= e!605402 Unit!34825)))

(declare-fun b!1062733 () Bool)

(declare-fun e!605401 () ListLongMap!13991)

(declare-fun call!44929 () ListLongMap!13991)

(assert (=> b!1062733 (= e!605401 call!44929)))

(declare-fun b!1062734 () Bool)

(declare-fun lt!468308 () Unit!34820)

(assert (=> b!1062734 (= e!605402 lt!468308)))

(declare-fun lt!468304 () ListLongMap!13991)

(assert (=> b!1062734 (= lt!468304 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468294 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468305 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468305 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468302 () Unit!34820)

(declare-fun addStillContains!636 (ListLongMap!13991 (_ BitVec 64) V!38763 (_ BitVec 64)) Unit!34820)

(assert (=> b!1062734 (= lt!468302 (addStillContains!636 lt!468304 lt!468294 zeroValueBefore!47 lt!468305))))

(declare-fun +!3117 (ListLongMap!13991 tuple2!16022) ListLongMap!13991)

(assert (=> b!1062734 (contains!6242 (+!3117 lt!468304 (tuple2!16023 lt!468294 zeroValueBefore!47)) lt!468305)))

(declare-fun lt!468311 () Unit!34820)

(assert (=> b!1062734 (= lt!468311 lt!468302)))

(declare-fun lt!468307 () ListLongMap!13991)

(assert (=> b!1062734 (= lt!468307 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468314 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468314 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468301 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468301 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468312 () Unit!34820)

(declare-fun addApplyDifferent!496 (ListLongMap!13991 (_ BitVec 64) V!38763 (_ BitVec 64)) Unit!34820)

(assert (=> b!1062734 (= lt!468312 (addApplyDifferent!496 lt!468307 lt!468314 minValue!907 lt!468301))))

(assert (=> b!1062734 (= (apply!919 (+!3117 lt!468307 (tuple2!16023 lt!468314 minValue!907)) lt!468301) (apply!919 lt!468307 lt!468301))))

(declare-fun lt!468313 () Unit!34820)

(assert (=> b!1062734 (= lt!468313 lt!468312)))

(declare-fun lt!468310 () ListLongMap!13991)

(assert (=> b!1062734 (= lt!468310 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468297 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468299 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468299 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468298 () Unit!34820)

(assert (=> b!1062734 (= lt!468298 (addApplyDifferent!496 lt!468310 lt!468297 zeroValueBefore!47 lt!468299))))

(assert (=> b!1062734 (= (apply!919 (+!3117 lt!468310 (tuple2!16023 lt!468297 zeroValueBefore!47)) lt!468299) (apply!919 lt!468310 lt!468299))))

(declare-fun lt!468303 () Unit!34820)

(assert (=> b!1062734 (= lt!468303 lt!468298)))

(declare-fun lt!468300 () ListLongMap!13991)

(assert (=> b!1062734 (= lt!468300 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468306 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468306 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468295 () (_ BitVec 64))

(assert (=> b!1062734 (= lt!468295 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1062734 (= lt!468308 (addApplyDifferent!496 lt!468300 lt!468306 minValue!907 lt!468295))))

(assert (=> b!1062734 (= (apply!919 (+!3117 lt!468300 (tuple2!16023 lt!468306 minValue!907)) lt!468295) (apply!919 lt!468300 lt!468295))))

(declare-fun d!128871 () Bool)

(declare-fun e!605405 () Bool)

(assert (=> d!128871 e!605405))

(declare-fun res!709605 () Bool)

(assert (=> d!128871 (=> (not res!709605) (not e!605405))))

(assert (=> d!128871 (= res!709605 (or (bvsge #b00000000000000000000000000000000 (size!32966 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))))

(declare-fun lt!468309 () ListLongMap!13991)

(assert (=> d!128871 (= lt!468296 lt!468309)))

(declare-fun lt!468293 () Unit!34820)

(assert (=> d!128871 (= lt!468293 e!605402)))

(declare-fun c!107262 () Bool)

(assert (=> d!128871 (= c!107262 e!605410)))

(declare-fun res!709610 () Bool)

(assert (=> d!128871 (=> (not res!709610) (not e!605410))))

(assert (=> d!128871 (= res!709610 (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun e!605403 () ListLongMap!13991)

(assert (=> d!128871 (= lt!468309 e!605403)))

(declare-fun c!107259 () Bool)

(assert (=> d!128871 (= c!107259 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128871 (validMask!0 mask!1515)))

(assert (=> d!128871 (= (getCurrentListMap!3995 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468296)))

(declare-fun e!605404 () Bool)

(declare-fun b!1062724 () Bool)

(declare-fun get!16951 (ValueCell!11907 V!38763) V!38763)

(declare-fun dynLambda!2026 (Int (_ BitVec 64)) V!38763)

(assert (=> b!1062724 (= e!605404 (= (apply!919 lt!468296 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)) (get!16951 (select (arr!32429 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1062724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32965 _values!955)))))

(assert (=> b!1062724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun b!1062735 () Bool)

(declare-fun c!107258 () Bool)

(assert (=> b!1062735 (= c!107258 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!605406 () ListLongMap!13991)

(assert (=> b!1062735 (= e!605401 e!605406)))

(declare-fun bm!44925 () Bool)

(declare-fun call!44931 () ListLongMap!13991)

(assert (=> bm!44925 (= call!44929 call!44931)))

(declare-fun b!1062736 () Bool)

(declare-fun res!709604 () Bool)

(assert (=> b!1062736 (=> (not res!709604) (not e!605405))))

(declare-fun e!605407 () Bool)

(assert (=> b!1062736 (= res!709604 e!605407)))

(declare-fun res!709607 () Bool)

(assert (=> b!1062736 (=> res!709607 e!605407)))

(assert (=> b!1062736 (= res!709607 (not e!605412))))

(declare-fun res!709609 () Bool)

(assert (=> b!1062736 (=> (not res!709609) (not e!605412))))

(assert (=> b!1062736 (= res!709609 (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun call!44932 () ListLongMap!13991)

(declare-fun bm!44926 () Bool)

(declare-fun call!44933 () ListLongMap!13991)

(declare-fun call!44927 () ListLongMap!13991)

(declare-fun c!107263 () Bool)

(assert (=> bm!44926 (= call!44931 (+!3117 (ite c!107259 call!44927 (ite c!107263 call!44933 call!44932)) (ite (or c!107259 c!107263) (tuple2!16023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1062737 () Bool)

(assert (=> b!1062737 (= e!605406 call!44929)))

(declare-fun b!1062738 () Bool)

(declare-fun res!709603 () Bool)

(assert (=> b!1062738 (=> (not res!709603) (not e!605405))))

(assert (=> b!1062738 (= res!709603 e!605413)))

(declare-fun c!107260 () Bool)

(assert (=> b!1062738 (= c!107260 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!44927 () Bool)

(assert (=> bm!44927 (= call!44927 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062739 () Bool)

(assert (=> b!1062739 (= e!605403 (+!3117 call!44931 (tuple2!16023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1062740 () Bool)

(assert (=> b!1062740 (= e!605403 e!605401)))

(assert (=> b!1062740 (= c!107263 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44928 () Bool)

(assert (=> bm!44928 (= call!44933 call!44927)))

(declare-fun b!1062741 () Bool)

(assert (=> b!1062741 (= e!605407 e!605404)))

(declare-fun res!709606 () Bool)

(assert (=> b!1062741 (=> (not res!709606) (not e!605404))))

(assert (=> b!1062741 (= res!709606 (contains!6242 lt!468296 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun bm!44929 () Bool)

(assert (=> bm!44929 (= call!44932 call!44933)))

(declare-fun b!1062742 () Bool)

(assert (=> b!1062742 (= e!605406 call!44932)))

(declare-fun b!1062743 () Bool)

(assert (=> b!1062743 (= e!605411 e!605409)))

(declare-fun res!709608 () Bool)

(assert (=> b!1062743 (= res!709608 call!44928)))

(assert (=> b!1062743 (=> (not res!709608) (not e!605409))))

(declare-fun b!1062744 () Bool)

(assert (=> b!1062744 (= e!605405 e!605411)))

(declare-fun c!107261 () Bool)

(assert (=> b!1062744 (= c!107261 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44930 () Bool)

(assert (=> bm!44930 (= call!44930 (contains!6242 lt!468296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128871 c!107259) b!1062739))

(assert (= (and d!128871 (not c!107259)) b!1062740))

(assert (= (and b!1062740 c!107263) b!1062733))

(assert (= (and b!1062740 (not c!107263)) b!1062735))

(assert (= (and b!1062735 c!107258) b!1062737))

(assert (= (and b!1062735 (not c!107258)) b!1062742))

(assert (= (or b!1062737 b!1062742) bm!44929))

(assert (= (or b!1062733 bm!44929) bm!44928))

(assert (= (or b!1062733 b!1062737) bm!44925))

(assert (= (or b!1062739 bm!44928) bm!44927))

(assert (= (or b!1062739 bm!44925) bm!44926))

(assert (= (and d!128871 res!709610) b!1062728))

(assert (= (and d!128871 c!107262) b!1062734))

(assert (= (and d!128871 (not c!107262)) b!1062732))

(assert (= (and d!128871 res!709605) b!1062736))

(assert (= (and b!1062736 res!709609) b!1062725))

(assert (= (and b!1062736 (not res!709607)) b!1062741))

(assert (= (and b!1062741 res!709606) b!1062724))

(assert (= (and b!1062736 res!709604) b!1062738))

(assert (= (and b!1062738 c!107260) b!1062730))

(assert (= (and b!1062738 (not c!107260)) b!1062727))

(assert (= (and b!1062730 res!709602) b!1062726))

(assert (= (or b!1062730 b!1062727) bm!44930))

(assert (= (and b!1062738 res!709603) b!1062744))

(assert (= (and b!1062744 c!107261) b!1062743))

(assert (= (and b!1062744 (not c!107261)) b!1062731))

(assert (= (and b!1062743 res!709608) b!1062729))

(assert (= (or b!1062743 b!1062731) bm!44924))

(declare-fun b_lambda!16461 () Bool)

(assert (=> (not b_lambda!16461) (not b!1062724)))

(declare-fun t!31918 () Bool)

(declare-fun tb!7133 () Bool)

(assert (=> (and start!93952 (= defaultEntry!963 defaultEntry!963) t!31918) tb!7133))

(declare-fun result!14707 () Bool)

(assert (=> tb!7133 (= result!14707 tp_is_empty!25221)))

(assert (=> b!1062724 t!31918))

(declare-fun b_and!34137 () Bool)

(assert (= b_and!34133 (and (=> t!31918 result!14707) b_and!34137)))

(declare-fun m!981449 () Bool)

(assert (=> b!1062739 m!981449))

(assert (=> b!1062725 m!981423))

(assert (=> b!1062725 m!981423))

(assert (=> b!1062725 m!981431))

(declare-fun m!981451 () Bool)

(assert (=> bm!44930 m!981451))

(declare-fun m!981453 () Bool)

(assert (=> bm!44924 m!981453))

(assert (=> b!1062741 m!981423))

(assert (=> b!1062741 m!981423))

(declare-fun m!981455 () Bool)

(assert (=> b!1062741 m!981455))

(assert (=> b!1062734 m!981423))

(declare-fun m!981457 () Bool)

(assert (=> b!1062734 m!981457))

(declare-fun m!981459 () Bool)

(assert (=> b!1062734 m!981459))

(declare-fun m!981461 () Bool)

(assert (=> b!1062734 m!981461))

(declare-fun m!981463 () Bool)

(assert (=> b!1062734 m!981463))

(declare-fun m!981465 () Bool)

(assert (=> b!1062734 m!981465))

(declare-fun m!981467 () Bool)

(assert (=> b!1062734 m!981467))

(assert (=> b!1062734 m!981457))

(declare-fun m!981469 () Bool)

(assert (=> b!1062734 m!981469))

(assert (=> b!1062734 m!981461))

(declare-fun m!981471 () Bool)

(assert (=> b!1062734 m!981471))

(declare-fun m!981473 () Bool)

(assert (=> b!1062734 m!981473))

(declare-fun m!981475 () Bool)

(assert (=> b!1062734 m!981475))

(assert (=> b!1062734 m!981465))

(declare-fun m!981477 () Bool)

(assert (=> b!1062734 m!981477))

(declare-fun m!981479 () Bool)

(assert (=> b!1062734 m!981479))

(declare-fun m!981481 () Bool)

(assert (=> b!1062734 m!981481))

(declare-fun m!981483 () Bool)

(assert (=> b!1062734 m!981483))

(declare-fun m!981485 () Bool)

(assert (=> b!1062734 m!981485))

(assert (=> b!1062734 m!981385))

(assert (=> b!1062734 m!981477))

(assert (=> d!128871 m!981373))

(assert (=> b!1062724 m!981423))

(declare-fun m!981487 () Bool)

(assert (=> b!1062724 m!981487))

(assert (=> b!1062724 m!981423))

(declare-fun m!981489 () Bool)

(assert (=> b!1062724 m!981489))

(declare-fun m!981491 () Bool)

(assert (=> b!1062724 m!981491))

(declare-fun m!981493 () Bool)

(assert (=> b!1062724 m!981493))

(assert (=> b!1062724 m!981489))

(assert (=> b!1062724 m!981491))

(declare-fun m!981495 () Bool)

(assert (=> b!1062729 m!981495))

(assert (=> bm!44927 m!981385))

(assert (=> b!1062728 m!981423))

(assert (=> b!1062728 m!981423))

(assert (=> b!1062728 m!981431))

(declare-fun m!981497 () Bool)

(assert (=> b!1062726 m!981497))

(declare-fun m!981499 () Bool)

(assert (=> bm!44926 m!981499))

(assert (=> b!1062626 d!128871))

(declare-fun b!1062757 () Bool)

(declare-fun e!605422 () Bool)

(declare-fun call!44936 () Bool)

(assert (=> b!1062757 (= e!605422 call!44936)))

(declare-fun b!1062758 () Bool)

(declare-fun e!605423 () Bool)

(declare-fun contains!6244 (List!22604 (_ BitVec 64)) Bool)

(assert (=> b!1062758 (= e!605423 (contains!6244 Nil!22601 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128873 () Bool)

(declare-fun res!709618 () Bool)

(declare-fun e!605424 () Bool)

(assert (=> d!128873 (=> res!709618 e!605424)))

(assert (=> d!128873 (= res!709618 (bvsge #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (=> d!128873 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22601) e!605424)))

(declare-fun b!1062759 () Bool)

(declare-fun e!605425 () Bool)

(assert (=> b!1062759 (= e!605424 e!605425)))

(declare-fun res!709617 () Bool)

(assert (=> b!1062759 (=> (not res!709617) (not e!605425))))

(assert (=> b!1062759 (= res!709617 (not e!605423))))

(declare-fun res!709619 () Bool)

(assert (=> b!1062759 (=> (not res!709619) (not e!605423))))

(assert (=> b!1062759 (= res!709619 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062760 () Bool)

(assert (=> b!1062760 (= e!605422 call!44936)))

(declare-fun b!1062761 () Bool)

(assert (=> b!1062761 (= e!605425 e!605422)))

(declare-fun c!107266 () Bool)

(assert (=> b!1062761 (= c!107266 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44933 () Bool)

(assert (=> bm!44933 (= call!44936 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107266 (Cons!22600 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000) Nil!22601) Nil!22601)))))

(assert (= (and d!128873 (not res!709618)) b!1062759))

(assert (= (and b!1062759 res!709619) b!1062758))

(assert (= (and b!1062759 res!709617) b!1062761))

(assert (= (and b!1062761 c!107266) b!1062757))

(assert (= (and b!1062761 (not c!107266)) b!1062760))

(assert (= (or b!1062757 b!1062760) bm!44933))

(assert (=> b!1062758 m!981423))

(assert (=> b!1062758 m!981423))

(declare-fun m!981501 () Bool)

(assert (=> b!1062758 m!981501))

(assert (=> b!1062759 m!981423))

(assert (=> b!1062759 m!981423))

(assert (=> b!1062759 m!981431))

(assert (=> b!1062761 m!981423))

(assert (=> b!1062761 m!981423))

(assert (=> b!1062761 m!981431))

(assert (=> bm!44933 m!981423))

(declare-fun m!981503 () Bool)

(assert (=> bm!44933 m!981503))

(assert (=> b!1062629 d!128873))

(declare-fun d!128875 () Bool)

(assert (=> d!128875 (= (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468317 () Unit!34820)

(declare-fun choose!1725 (array!67447 array!67445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38763 V!38763 V!38763 V!38763 (_ BitVec 32) Int) Unit!34820)

(assert (=> d!128875 (= lt!468317 (choose!1725 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128875 (validMask!0 mask!1515)))

(assert (=> d!128875 (= (lemmaNoChangeToArrayThenSameMapNoExtras!642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468317)))

(declare-fun bs!31243 () Bool)

(assert (= bs!31243 d!128875))

(assert (=> bs!31243 m!981385))

(assert (=> bs!31243 m!981383))

(declare-fun m!981505 () Bool)

(assert (=> bs!31243 m!981505))

(assert (=> bs!31243 m!981373))

(assert (=> b!1062633 d!128875))

(declare-fun b!1062786 () Bool)

(declare-fun e!605442 () Bool)

(declare-fun e!605444 () Bool)

(assert (=> b!1062786 (= e!605442 e!605444)))

(assert (=> b!1062786 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun res!709631 () Bool)

(declare-fun lt!468332 () ListLongMap!13991)

(assert (=> b!1062786 (= res!709631 (contains!6242 lt!468332 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062786 (=> (not res!709631) (not e!605444))))

(declare-fun b!1062787 () Bool)

(declare-fun res!709628 () Bool)

(declare-fun e!605440 () Bool)

(assert (=> b!1062787 (=> (not res!709628) (not e!605440))))

(assert (=> b!1062787 (= res!709628 (not (contains!6242 lt!468332 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1062788 () Bool)

(declare-fun e!605445 () ListLongMap!13991)

(declare-fun e!605443 () ListLongMap!13991)

(assert (=> b!1062788 (= e!605445 e!605443)))

(declare-fun c!107277 () Bool)

(assert (=> b!1062788 (= c!107277 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun call!44939 () ListLongMap!13991)

(declare-fun bm!44936 () Bool)

(assert (=> bm!44936 (= call!44939 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1062790 () Bool)

(assert (=> b!1062790 (= e!605443 call!44939)))

(declare-fun b!1062791 () Bool)

(declare-fun e!605441 () Bool)

(assert (=> b!1062791 (= e!605442 e!605441)))

(declare-fun c!107275 () Bool)

(assert (=> b!1062791 (= c!107275 (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun b!1062792 () Bool)

(assert (=> b!1062792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (=> b!1062792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32965 _values!955)))))

(assert (=> b!1062792 (= e!605444 (= (apply!919 lt!468332 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)) (get!16951 (select (arr!32429 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1062793 () Bool)

(declare-fun e!605446 () Bool)

(assert (=> b!1062793 (= e!605446 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062793 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!128877 () Bool)

(assert (=> d!128877 e!605440))

(declare-fun res!709629 () Bool)

(assert (=> d!128877 (=> (not res!709629) (not e!605440))))

(assert (=> d!128877 (= res!709629 (not (contains!6242 lt!468332 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128877 (= lt!468332 e!605445)))

(declare-fun c!107278 () Bool)

(assert (=> d!128877 (= c!107278 (bvsge #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (=> d!128877 (validMask!0 mask!1515)))

(assert (=> d!128877 (= (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468332)))

(declare-fun b!1062789 () Bool)

(assert (=> b!1062789 (= e!605441 (= lt!468332 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1062794 () Bool)

(assert (=> b!1062794 (= e!605445 (ListLongMap!13992 Nil!22600))))

(declare-fun b!1062795 () Bool)

(declare-fun isEmpty!937 (ListLongMap!13991) Bool)

(assert (=> b!1062795 (= e!605441 (isEmpty!937 lt!468332))))

(declare-fun b!1062796 () Bool)

(declare-fun lt!468333 () Unit!34820)

(declare-fun lt!468337 () Unit!34820)

(assert (=> b!1062796 (= lt!468333 lt!468337)))

(declare-fun lt!468336 () (_ BitVec 64))

(declare-fun lt!468335 () (_ BitVec 64))

(declare-fun lt!468334 () V!38763)

(declare-fun lt!468338 () ListLongMap!13991)

(assert (=> b!1062796 (not (contains!6242 (+!3117 lt!468338 (tuple2!16023 lt!468335 lt!468334)) lt!468336))))

(declare-fun addStillNotContains!247 (ListLongMap!13991 (_ BitVec 64) V!38763 (_ BitVec 64)) Unit!34820)

(assert (=> b!1062796 (= lt!468337 (addStillNotContains!247 lt!468338 lt!468335 lt!468334 lt!468336))))

(assert (=> b!1062796 (= lt!468336 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1062796 (= lt!468334 (get!16951 (select (arr!32429 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1062796 (= lt!468335 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1062796 (= lt!468338 call!44939)))

(assert (=> b!1062796 (= e!605443 (+!3117 call!44939 (tuple2!16023 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000) (get!16951 (select (arr!32429 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1062797 () Bool)

(assert (=> b!1062797 (= e!605440 e!605442)))

(declare-fun c!107276 () Bool)

(assert (=> b!1062797 (= c!107276 e!605446)))

(declare-fun res!709630 () Bool)

(assert (=> b!1062797 (=> (not res!709630) (not e!605446))))

(assert (=> b!1062797 (= res!709630 (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (= (and d!128877 c!107278) b!1062794))

(assert (= (and d!128877 (not c!107278)) b!1062788))

(assert (= (and b!1062788 c!107277) b!1062796))

(assert (= (and b!1062788 (not c!107277)) b!1062790))

(assert (= (or b!1062796 b!1062790) bm!44936))

(assert (= (and d!128877 res!709629) b!1062787))

(assert (= (and b!1062787 res!709628) b!1062797))

(assert (= (and b!1062797 res!709630) b!1062793))

(assert (= (and b!1062797 c!107276) b!1062786))

(assert (= (and b!1062797 (not c!107276)) b!1062791))

(assert (= (and b!1062786 res!709631) b!1062792))

(assert (= (and b!1062791 c!107275) b!1062789))

(assert (= (and b!1062791 (not c!107275)) b!1062795))

(declare-fun b_lambda!16463 () Bool)

(assert (=> (not b_lambda!16463) (not b!1062792)))

(assert (=> b!1062792 t!31918))

(declare-fun b_and!34139 () Bool)

(assert (= b_and!34137 (and (=> t!31918 result!14707) b_and!34139)))

(declare-fun b_lambda!16465 () Bool)

(assert (=> (not b_lambda!16465) (not b!1062796)))

(assert (=> b!1062796 t!31918))

(declare-fun b_and!34141 () Bool)

(assert (= b_and!34139 (and (=> t!31918 result!14707) b_and!34141)))

(declare-fun m!981507 () Bool)

(assert (=> bm!44936 m!981507))

(assert (=> b!1062786 m!981423))

(assert (=> b!1062786 m!981423))

(declare-fun m!981509 () Bool)

(assert (=> b!1062786 m!981509))

(assert (=> b!1062793 m!981423))

(assert (=> b!1062793 m!981423))

(assert (=> b!1062793 m!981431))

(assert (=> b!1062788 m!981423))

(assert (=> b!1062788 m!981423))

(assert (=> b!1062788 m!981431))

(declare-fun m!981511 () Bool)

(assert (=> b!1062795 m!981511))

(assert (=> b!1062789 m!981507))

(declare-fun m!981513 () Bool)

(assert (=> b!1062787 m!981513))

(declare-fun m!981515 () Bool)

(assert (=> b!1062796 m!981515))

(assert (=> b!1062796 m!981489))

(declare-fun m!981517 () Bool)

(assert (=> b!1062796 m!981517))

(declare-fun m!981519 () Bool)

(assert (=> b!1062796 m!981519))

(assert (=> b!1062796 m!981517))

(declare-fun m!981521 () Bool)

(assert (=> b!1062796 m!981521))

(assert (=> b!1062796 m!981489))

(assert (=> b!1062796 m!981491))

(assert (=> b!1062796 m!981493))

(assert (=> b!1062796 m!981423))

(assert (=> b!1062796 m!981491))

(assert (=> b!1062792 m!981423))

(declare-fun m!981523 () Bool)

(assert (=> b!1062792 m!981523))

(assert (=> b!1062792 m!981489))

(assert (=> b!1062792 m!981489))

(assert (=> b!1062792 m!981491))

(assert (=> b!1062792 m!981493))

(assert (=> b!1062792 m!981423))

(assert (=> b!1062792 m!981491))

(declare-fun m!981525 () Bool)

(assert (=> d!128877 m!981525))

(assert (=> d!128877 m!981373))

(assert (=> b!1062633 d!128877))

(declare-fun b!1062798 () Bool)

(declare-fun e!605449 () Bool)

(declare-fun e!605451 () Bool)

(assert (=> b!1062798 (= e!605449 e!605451)))

(assert (=> b!1062798 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun res!709635 () Bool)

(declare-fun lt!468339 () ListLongMap!13991)

(assert (=> b!1062798 (= res!709635 (contains!6242 lt!468339 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062798 (=> (not res!709635) (not e!605451))))

(declare-fun b!1062799 () Bool)

(declare-fun res!709632 () Bool)

(declare-fun e!605447 () Bool)

(assert (=> b!1062799 (=> (not res!709632) (not e!605447))))

(assert (=> b!1062799 (= res!709632 (not (contains!6242 lt!468339 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1062800 () Bool)

(declare-fun e!605452 () ListLongMap!13991)

(declare-fun e!605450 () ListLongMap!13991)

(assert (=> b!1062800 (= e!605452 e!605450)))

(declare-fun c!107281 () Bool)

(assert (=> b!1062800 (= c!107281 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun call!44940 () ListLongMap!13991)

(declare-fun bm!44937 () Bool)

(assert (=> bm!44937 (= call!44940 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1062802 () Bool)

(assert (=> b!1062802 (= e!605450 call!44940)))

(declare-fun b!1062803 () Bool)

(declare-fun e!605448 () Bool)

(assert (=> b!1062803 (= e!605449 e!605448)))

(declare-fun c!107279 () Bool)

(assert (=> b!1062803 (= c!107279 (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(declare-fun b!1062804 () Bool)

(assert (=> b!1062804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (=> b!1062804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32965 _values!955)))))

(assert (=> b!1062804 (= e!605451 (= (apply!919 lt!468339 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)) (get!16951 (select (arr!32429 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1062805 () Bool)

(declare-fun e!605453 () Bool)

(assert (=> b!1062805 (= e!605453 (validKeyInArray!0 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062805 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!128879 () Bool)

(assert (=> d!128879 e!605447))

(declare-fun res!709633 () Bool)

(assert (=> d!128879 (=> (not res!709633) (not e!605447))))

(assert (=> d!128879 (= res!709633 (not (contains!6242 lt!468339 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128879 (= lt!468339 e!605452)))

(declare-fun c!107282 () Bool)

(assert (=> d!128879 (= c!107282 (bvsge #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (=> d!128879 (validMask!0 mask!1515)))

(assert (=> d!128879 (= (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468339)))

(declare-fun b!1062801 () Bool)

(assert (=> b!1062801 (= e!605448 (= lt!468339 (getCurrentListMapNoExtraKeys!3605 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1062806 () Bool)

(assert (=> b!1062806 (= e!605452 (ListLongMap!13992 Nil!22600))))

(declare-fun b!1062807 () Bool)

(assert (=> b!1062807 (= e!605448 (isEmpty!937 lt!468339))))

(declare-fun b!1062808 () Bool)

(declare-fun lt!468340 () Unit!34820)

(declare-fun lt!468344 () Unit!34820)

(assert (=> b!1062808 (= lt!468340 lt!468344)))

(declare-fun lt!468341 () V!38763)

(declare-fun lt!468343 () (_ BitVec 64))

(declare-fun lt!468342 () (_ BitVec 64))

(declare-fun lt!468345 () ListLongMap!13991)

(assert (=> b!1062808 (not (contains!6242 (+!3117 lt!468345 (tuple2!16023 lt!468342 lt!468341)) lt!468343))))

(assert (=> b!1062808 (= lt!468344 (addStillNotContains!247 lt!468345 lt!468342 lt!468341 lt!468343))))

(assert (=> b!1062808 (= lt!468343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1062808 (= lt!468341 (get!16951 (select (arr!32429 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1062808 (= lt!468342 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1062808 (= lt!468345 call!44940)))

(assert (=> b!1062808 (= e!605450 (+!3117 call!44940 (tuple2!16023 (select (arr!32430 _keys!1163) #b00000000000000000000000000000000) (get!16951 (select (arr!32429 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1062809 () Bool)

(assert (=> b!1062809 (= e!605447 e!605449)))

(declare-fun c!107280 () Bool)

(assert (=> b!1062809 (= c!107280 e!605453)))

(declare-fun res!709634 () Bool)

(assert (=> b!1062809 (=> (not res!709634) (not e!605453))))

(assert (=> b!1062809 (= res!709634 (bvslt #b00000000000000000000000000000000 (size!32966 _keys!1163)))))

(assert (= (and d!128879 c!107282) b!1062806))

(assert (= (and d!128879 (not c!107282)) b!1062800))

(assert (= (and b!1062800 c!107281) b!1062808))

(assert (= (and b!1062800 (not c!107281)) b!1062802))

(assert (= (or b!1062808 b!1062802) bm!44937))

(assert (= (and d!128879 res!709633) b!1062799))

(assert (= (and b!1062799 res!709632) b!1062809))

(assert (= (and b!1062809 res!709634) b!1062805))

(assert (= (and b!1062809 c!107280) b!1062798))

(assert (= (and b!1062809 (not c!107280)) b!1062803))

(assert (= (and b!1062798 res!709635) b!1062804))

(assert (= (and b!1062803 c!107279) b!1062801))

(assert (= (and b!1062803 (not c!107279)) b!1062807))

(declare-fun b_lambda!16467 () Bool)

(assert (=> (not b_lambda!16467) (not b!1062804)))

(assert (=> b!1062804 t!31918))

(declare-fun b_and!34143 () Bool)

(assert (= b_and!34141 (and (=> t!31918 result!14707) b_and!34143)))

(declare-fun b_lambda!16469 () Bool)

(assert (=> (not b_lambda!16469) (not b!1062808)))

(assert (=> b!1062808 t!31918))

(declare-fun b_and!34145 () Bool)

(assert (= b_and!34143 (and (=> t!31918 result!14707) b_and!34145)))

(declare-fun m!981527 () Bool)

(assert (=> bm!44937 m!981527))

(assert (=> b!1062798 m!981423))

(assert (=> b!1062798 m!981423))

(declare-fun m!981529 () Bool)

(assert (=> b!1062798 m!981529))

(assert (=> b!1062805 m!981423))

(assert (=> b!1062805 m!981423))

(assert (=> b!1062805 m!981431))

(assert (=> b!1062800 m!981423))

(assert (=> b!1062800 m!981423))

(assert (=> b!1062800 m!981431))

(declare-fun m!981531 () Bool)

(assert (=> b!1062807 m!981531))

(assert (=> b!1062801 m!981527))

(declare-fun m!981533 () Bool)

(assert (=> b!1062799 m!981533))

(declare-fun m!981535 () Bool)

(assert (=> b!1062808 m!981535))

(assert (=> b!1062808 m!981489))

(declare-fun m!981537 () Bool)

(assert (=> b!1062808 m!981537))

(declare-fun m!981539 () Bool)

(assert (=> b!1062808 m!981539))

(assert (=> b!1062808 m!981537))

(declare-fun m!981541 () Bool)

(assert (=> b!1062808 m!981541))

(assert (=> b!1062808 m!981489))

(assert (=> b!1062808 m!981491))

(assert (=> b!1062808 m!981493))

(assert (=> b!1062808 m!981423))

(assert (=> b!1062808 m!981491))

(assert (=> b!1062804 m!981423))

(declare-fun m!981543 () Bool)

(assert (=> b!1062804 m!981543))

(assert (=> b!1062804 m!981489))

(assert (=> b!1062804 m!981489))

(assert (=> b!1062804 m!981491))

(assert (=> b!1062804 m!981493))

(assert (=> b!1062804 m!981423))

(assert (=> b!1062804 m!981491))

(declare-fun m!981545 () Bool)

(assert (=> d!128879 m!981545))

(assert (=> d!128879 m!981373))

(assert (=> b!1062633 d!128879))

(declare-fun d!128881 () Bool)

(assert (=> d!128881 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93952 d!128881))

(declare-fun d!128883 () Bool)

(assert (=> d!128883 (= (array_inv!25122 _values!955) (bvsge (size!32965 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93952 d!128883))

(declare-fun d!128885 () Bool)

(assert (=> d!128885 (= (array_inv!25123 _keys!1163) (bvsge (size!32966 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93952 d!128885))

(declare-fun mapIsEmpty!39511 () Bool)

(declare-fun mapRes!39511 () Bool)

(assert (=> mapIsEmpty!39511 mapRes!39511))

(declare-fun b!1062817 () Bool)

(declare-fun e!605458 () Bool)

(assert (=> b!1062817 (= e!605458 tp_is_empty!25221)))

(declare-fun condMapEmpty!39511 () Bool)

(declare-fun mapDefault!39511 () ValueCell!11907)

(assert (=> mapNonEmpty!39505 (= condMapEmpty!39511 (= mapRest!39505 ((as const (Array (_ BitVec 32) ValueCell!11907)) mapDefault!39511)))))

(assert (=> mapNonEmpty!39505 (= tp!75658 (and e!605458 mapRes!39511))))

(declare-fun b!1062816 () Bool)

(declare-fun e!605459 () Bool)

(assert (=> b!1062816 (= e!605459 tp_is_empty!25221)))

(declare-fun mapNonEmpty!39511 () Bool)

(declare-fun tp!75668 () Bool)

(assert (=> mapNonEmpty!39511 (= mapRes!39511 (and tp!75668 e!605459))))

(declare-fun mapKey!39511 () (_ BitVec 32))

(declare-fun mapRest!39511 () (Array (_ BitVec 32) ValueCell!11907))

(declare-fun mapValue!39511 () ValueCell!11907)

(assert (=> mapNonEmpty!39511 (= mapRest!39505 (store mapRest!39511 mapKey!39511 mapValue!39511))))

(assert (= (and mapNonEmpty!39505 condMapEmpty!39511) mapIsEmpty!39511))

(assert (= (and mapNonEmpty!39505 (not condMapEmpty!39511)) mapNonEmpty!39511))

(assert (= (and mapNonEmpty!39511 ((_ is ValueCellFull!11907) mapValue!39511)) b!1062816))

(assert (= (and mapNonEmpty!39505 ((_ is ValueCellFull!11907) mapDefault!39511)) b!1062817))

(declare-fun m!981547 () Bool)

(assert (=> mapNonEmpty!39511 m!981547))

(declare-fun b_lambda!16471 () Bool)

(assert (= b_lambda!16465 (or (and start!93952 b_free!21411) b_lambda!16471)))

(declare-fun b_lambda!16473 () Bool)

(assert (= b_lambda!16461 (or (and start!93952 b_free!21411) b_lambda!16473)))

(declare-fun b_lambda!16475 () Bool)

(assert (= b_lambda!16467 (or (and start!93952 b_free!21411) b_lambda!16475)))

(declare-fun b_lambda!16477 () Bool)

(assert (= b_lambda!16469 (or (and start!93952 b_free!21411) b_lambda!16477)))

(declare-fun b_lambda!16479 () Bool)

(assert (= b_lambda!16463 (or (and start!93952 b_free!21411) b_lambda!16479)))

(check-sat (not d!128867) (not b!1062801) (not b!1062795) (not b!1062734) (not b!1062798) (not b!1062679) (not b!1062796) (not b!1062793) (not b!1062761) (not b_lambda!16473) (not b!1062739) (not b_lambda!16475) (not b!1062789) (not bm!44926) (not b!1062669) (not b!1062808) (not bm!44933) (not b!1062726) (not bm!44937) (not b!1062799) (not d!128865) (not b!1062741) (not d!128869) (not d!128877) (not bm!44924) (not bm!44927) (not b!1062792) (not b!1062758) b_and!34145 (not b!1062786) (not mapNonEmpty!39511) (not d!128871) (not d!128875) (not b!1062800) (not bm!44930) (not b!1062728) (not b_lambda!16471) (not b_next!21411) (not b_lambda!16479) (not b!1062729) (not b!1062804) (not b!1062787) (not b!1062805) (not b!1062759) (not b!1062725) (not b!1062807) tp_is_empty!25221 (not bm!44936) (not b!1062788) (not d!128879) (not b!1062724) (not b!1062681) (not b!1062670) (not bm!44909) (not b_lambda!16477))
(check-sat b_and!34145 (not b_next!21411))
