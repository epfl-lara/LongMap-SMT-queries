; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93944 () Bool)

(assert start!93944)

(declare-fun b_free!21409 () Bool)

(declare-fun b_next!21409 () Bool)

(assert (=> start!93944 (= b_free!21409 (not b_next!21409))))

(declare-fun tp!75652 () Bool)

(declare-fun b_and!34105 () Bool)

(assert (=> start!93944 (= tp!75652 b_and!34105)))

(declare-fun b!1062445 () Bool)

(declare-fun e!605222 () Bool)

(declare-fun tp_is_empty!25219 () Bool)

(assert (=> b!1062445 (= e!605222 tp_is_empty!25219)))

(declare-fun b!1062446 () Bool)

(declare-fun res!709468 () Bool)

(declare-fun e!605220 () Bool)

(assert (=> b!1062446 (=> (not res!709468) (not e!605220))))

(declare-datatypes ((array!67386 0))(
  ( (array!67387 (arr!32400 (Array (_ BitVec 32) (_ BitVec 64))) (size!32938 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67386)

(declare-datatypes ((List!22637 0))(
  ( (Nil!22634) (Cons!22633 (h!23842 (_ BitVec 64)) (t!31939 List!22637)) )
))
(declare-fun arrayNoDuplicates!0 (array!67386 (_ BitVec 32) List!22637) Bool)

(assert (=> b!1062446 (= res!709468 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22634))))

(declare-fun res!709464 () Bool)

(assert (=> start!93944 (=> (not res!709464) (not e!605220))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93944 (= res!709464 (validMask!0 mask!1515))))

(assert (=> start!93944 e!605220))

(assert (=> start!93944 true))

(assert (=> start!93944 tp_is_empty!25219))

(declare-datatypes ((V!38761 0))(
  ( (V!38762 (val!12660 Int)) )
))
(declare-datatypes ((ValueCell!11906 0))(
  ( (ValueCellFull!11906 (v!15269 V!38761)) (EmptyCell!11906) )
))
(declare-datatypes ((array!67388 0))(
  ( (array!67389 (arr!32401 (Array (_ BitVec 32) ValueCell!11906)) (size!32939 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67388)

(declare-fun e!605218 () Bool)

(declare-fun array_inv!25104 (array!67388) Bool)

(assert (=> start!93944 (and (array_inv!25104 _values!955) e!605218)))

(assert (=> start!93944 tp!75652))

(declare-fun array_inv!25105 (array!67386) Bool)

(assert (=> start!93944 (array_inv!25105 _keys!1163)))

(declare-fun mapNonEmpty!39502 () Bool)

(declare-fun mapRes!39502 () Bool)

(declare-fun tp!75653 () Bool)

(assert (=> mapNonEmpty!39502 (= mapRes!39502 (and tp!75653 e!605222))))

(declare-fun mapRest!39502 () (Array (_ BitVec 32) ValueCell!11906))

(declare-fun mapKey!39502 () (_ BitVec 32))

(declare-fun mapValue!39502 () ValueCell!11906)

(assert (=> mapNonEmpty!39502 (= (arr!32401 _values!955) (store mapRest!39502 mapKey!39502 mapValue!39502))))

(declare-fun b!1062447 () Bool)

(declare-fun e!605224 () Bool)

(declare-fun e!605221 () Bool)

(assert (=> b!1062447 (= e!605224 e!605221)))

(declare-fun res!709469 () Bool)

(assert (=> b!1062447 (=> res!709469 e!605221)))

(declare-datatypes ((tuple2!16086 0))(
  ( (tuple2!16087 (_1!8054 (_ BitVec 64)) (_2!8054 V!38761)) )
))
(declare-datatypes ((List!22638 0))(
  ( (Nil!22635) (Cons!22634 (h!23843 tuple2!16086) (t!31940 List!22638)) )
))
(declare-datatypes ((ListLongMap!14055 0))(
  ( (ListLongMap!14056 (toList!7043 List!22638)) )
))
(declare-fun lt!467990 () ListLongMap!14055)

(declare-fun contains!6211 (ListLongMap!14055 (_ BitVec 64)) Bool)

(assert (=> b!1062447 (= res!709469 (contains!6211 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38761)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38761)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3943 (array!67386 array!67388 (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 (_ BitVec 32) Int) ListLongMap!14055)

(assert (=> b!1062447 (= lt!467990 (getCurrentListMap!3943 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062448 () Bool)

(assert (=> b!1062448 (= e!605221 (bvsle #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun -!563 (ListLongMap!14055 (_ BitVec 64)) ListLongMap!14055)

(assert (=> b!1062448 (= (-!563 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467990)))

(declare-datatypes ((Unit!34677 0))(
  ( (Unit!34678) )
))
(declare-fun lt!467988 () Unit!34677)

(declare-fun removeNotPresentStillSame!15 (ListLongMap!14055 (_ BitVec 64)) Unit!34677)

(assert (=> b!1062448 (= lt!467988 (removeNotPresentStillSame!15 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062449 () Bool)

(declare-fun e!605223 () Bool)

(assert (=> b!1062449 (= e!605223 tp_is_empty!25219)))

(declare-fun b!1062450 () Bool)

(declare-fun res!709465 () Bool)

(assert (=> b!1062450 (=> (not res!709465) (not e!605220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67386 (_ BitVec 32)) Bool)

(assert (=> b!1062450 (= res!709465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39502 () Bool)

(assert (=> mapIsEmpty!39502 mapRes!39502))

(declare-fun b!1062451 () Bool)

(assert (=> b!1062451 (= e!605220 (not e!605224))))

(declare-fun res!709466 () Bool)

(assert (=> b!1062451 (=> res!709466 e!605224)))

(assert (=> b!1062451 (= res!709466 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467991 () ListLongMap!14055)

(declare-fun lt!467987 () ListLongMap!14055)

(assert (=> b!1062451 (= lt!467991 lt!467987)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38761)

(declare-fun lt!467989 () Unit!34677)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!647 (array!67386 array!67388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 V!38761 V!38761 (_ BitVec 32) Int) Unit!34677)

(assert (=> b!1062451 (= lt!467989 (lemmaNoChangeToArrayThenSameMapNoExtras!647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3653 (array!67386 array!67388 (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 (_ BitVec 32) Int) ListLongMap!14055)

(assert (=> b!1062451 (= lt!467987 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062451 (= lt!467991 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062452 () Bool)

(assert (=> b!1062452 (= e!605218 (and e!605223 mapRes!39502))))

(declare-fun condMapEmpty!39502 () Bool)

(declare-fun mapDefault!39502 () ValueCell!11906)

(assert (=> b!1062452 (= condMapEmpty!39502 (= (arr!32401 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11906)) mapDefault!39502)))))

(declare-fun b!1062453 () Bool)

(declare-fun res!709467 () Bool)

(assert (=> b!1062453 (=> (not res!709467) (not e!605220))))

(assert (=> b!1062453 (= res!709467 (and (= (size!32939 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32938 _keys!1163) (size!32939 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93944 res!709464) b!1062453))

(assert (= (and b!1062453 res!709467) b!1062450))

(assert (= (and b!1062450 res!709465) b!1062446))

(assert (= (and b!1062446 res!709468) b!1062451))

(assert (= (and b!1062451 (not res!709466)) b!1062447))

(assert (= (and b!1062447 (not res!709469)) b!1062448))

(assert (= (and b!1062452 condMapEmpty!39502) mapIsEmpty!39502))

(assert (= (and b!1062452 (not condMapEmpty!39502)) mapNonEmpty!39502))

(get-info :version)

(assert (= (and mapNonEmpty!39502 ((_ is ValueCellFull!11906) mapValue!39502)) b!1062445))

(assert (= (and b!1062452 ((_ is ValueCellFull!11906) mapDefault!39502)) b!1062449))

(assert (= start!93944 b!1062452))

(declare-fun m!980719 () Bool)

(assert (=> b!1062451 m!980719))

(declare-fun m!980721 () Bool)

(assert (=> b!1062451 m!980721))

(declare-fun m!980723 () Bool)

(assert (=> b!1062451 m!980723))

(declare-fun m!980725 () Bool)

(assert (=> start!93944 m!980725))

(declare-fun m!980727 () Bool)

(assert (=> start!93944 m!980727))

(declare-fun m!980729 () Bool)

(assert (=> start!93944 m!980729))

(declare-fun m!980731 () Bool)

(assert (=> b!1062448 m!980731))

(declare-fun m!980733 () Bool)

(assert (=> b!1062448 m!980733))

(declare-fun m!980735 () Bool)

(assert (=> mapNonEmpty!39502 m!980735))

(declare-fun m!980737 () Bool)

(assert (=> b!1062450 m!980737))

(declare-fun m!980739 () Bool)

(assert (=> b!1062446 m!980739))

(declare-fun m!980741 () Bool)

(assert (=> b!1062447 m!980741))

(declare-fun m!980743 () Bool)

(assert (=> b!1062447 m!980743))

(check-sat (not b_next!21409) b_and!34105 (not b!1062448) (not start!93944) (not b!1062451) tp_is_empty!25219 (not b!1062450) (not mapNonEmpty!39502) (not b!1062447) (not b!1062446))
(check-sat b_and!34105 (not b_next!21409))
(get-model)

(declare-fun d!128707 () Bool)

(assert (=> d!128707 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93944 d!128707))

(declare-fun d!128709 () Bool)

(assert (=> d!128709 (= (array_inv!25104 _values!955) (bvsge (size!32939 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93944 d!128709))

(declare-fun d!128711 () Bool)

(assert (=> d!128711 (= (array_inv!25105 _keys!1163) (bvsge (size!32938 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93944 d!128711))

(declare-fun d!128713 () Bool)

(declare-fun lt!468024 () ListLongMap!14055)

(assert (=> d!128713 (not (contains!6211 lt!468024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!67 (List!22638 (_ BitVec 64)) List!22638)

(assert (=> d!128713 (= lt!468024 (ListLongMap!14056 (removeStrictlySorted!67 (toList!7043 lt!467990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128713 (= (-!563 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468024)))

(declare-fun bs!31212 () Bool)

(assert (= bs!31212 d!128713))

(declare-fun m!980797 () Bool)

(assert (=> bs!31212 m!980797))

(declare-fun m!980799 () Bool)

(assert (=> bs!31212 m!980799))

(assert (=> b!1062448 d!128713))

(declare-fun d!128715 () Bool)

(assert (=> d!128715 (= (-!563 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467990)))

(declare-fun lt!468027 () Unit!34677)

(declare-fun choose!1731 (ListLongMap!14055 (_ BitVec 64)) Unit!34677)

(assert (=> d!128715 (= lt!468027 (choose!1731 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128715 (not (contains!6211 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128715 (= (removeNotPresentStillSame!15 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468027)))

(declare-fun bs!31213 () Bool)

(assert (= bs!31213 d!128715))

(assert (=> bs!31213 m!980731))

(declare-fun m!980801 () Bool)

(assert (=> bs!31213 m!980801))

(assert (=> bs!31213 m!980741))

(assert (=> b!1062448 d!128715))

(declare-fun d!128717 () Bool)

(declare-fun res!709511 () Bool)

(declare-fun e!605274 () Bool)

(assert (=> d!128717 (=> res!709511 e!605274)))

(assert (=> d!128717 (= res!709511 (bvsge #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(assert (=> d!128717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!605274)))

(declare-fun b!1062516 () Bool)

(declare-fun e!605273 () Bool)

(declare-fun e!605275 () Bool)

(assert (=> b!1062516 (= e!605273 e!605275)))

(declare-fun lt!468035 () (_ BitVec 64))

(assert (=> b!1062516 (= lt!468035 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468036 () Unit!34677)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67386 (_ BitVec 64) (_ BitVec 32)) Unit!34677)

(assert (=> b!1062516 (= lt!468036 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!468035 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1062516 (arrayContainsKey!0 _keys!1163 lt!468035 #b00000000000000000000000000000000)))

(declare-fun lt!468034 () Unit!34677)

(assert (=> b!1062516 (= lt!468034 lt!468036)))

(declare-fun res!709510 () Bool)

(declare-datatypes ((SeekEntryResult!9871 0))(
  ( (MissingZero!9871 (index!41855 (_ BitVec 32))) (Found!9871 (index!41856 (_ BitVec 32))) (Intermediate!9871 (undefined!10683 Bool) (index!41857 (_ BitVec 32)) (x!95074 (_ BitVec 32))) (Undefined!9871) (MissingVacant!9871 (index!41858 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67386 (_ BitVec 32)) SeekEntryResult!9871)

(assert (=> b!1062516 (= res!709510 (= (seekEntryOrOpen!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9871 #b00000000000000000000000000000000)))))

(assert (=> b!1062516 (=> (not res!709510) (not e!605275))))

(declare-fun b!1062517 () Bool)

(declare-fun call!44889 () Bool)

(assert (=> b!1062517 (= e!605275 call!44889)))

(declare-fun bm!44886 () Bool)

(assert (=> bm!44886 (= call!44889 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1062518 () Bool)

(assert (=> b!1062518 (= e!605274 e!605273)))

(declare-fun c!107203 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1062518 (= c!107203 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062519 () Bool)

(assert (=> b!1062519 (= e!605273 call!44889)))

(assert (= (and d!128717 (not res!709511)) b!1062518))

(assert (= (and b!1062518 c!107203) b!1062516))

(assert (= (and b!1062518 (not c!107203)) b!1062519))

(assert (= (and b!1062516 res!709510) b!1062517))

(assert (= (or b!1062517 b!1062519) bm!44886))

(declare-fun m!980803 () Bool)

(assert (=> b!1062516 m!980803))

(declare-fun m!980805 () Bool)

(assert (=> b!1062516 m!980805))

(declare-fun m!980807 () Bool)

(assert (=> b!1062516 m!980807))

(assert (=> b!1062516 m!980803))

(declare-fun m!980809 () Bool)

(assert (=> b!1062516 m!980809))

(declare-fun m!980811 () Bool)

(assert (=> bm!44886 m!980811))

(assert (=> b!1062518 m!980803))

(assert (=> b!1062518 m!980803))

(declare-fun m!980813 () Bool)

(assert (=> b!1062518 m!980813))

(assert (=> b!1062450 d!128717))

(declare-fun b!1062530 () Bool)

(declare-fun e!605285 () Bool)

(declare-fun contains!6213 (List!22637 (_ BitVec 64)) Bool)

(assert (=> b!1062530 (= e!605285 (contains!6213 Nil!22634 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062531 () Bool)

(declare-fun e!605286 () Bool)

(declare-fun call!44892 () Bool)

(assert (=> b!1062531 (= e!605286 call!44892)))

(declare-fun bm!44889 () Bool)

(declare-fun c!107206 () Bool)

(assert (=> bm!44889 (= call!44892 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107206 (Cons!22633 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000) Nil!22634) Nil!22634)))))

(declare-fun b!1062532 () Bool)

(assert (=> b!1062532 (= e!605286 call!44892)))

(declare-fun b!1062533 () Bool)

(declare-fun e!605287 () Bool)

(declare-fun e!605284 () Bool)

(assert (=> b!1062533 (= e!605287 e!605284)))

(declare-fun res!709520 () Bool)

(assert (=> b!1062533 (=> (not res!709520) (not e!605284))))

(assert (=> b!1062533 (= res!709520 (not e!605285))))

(declare-fun res!709518 () Bool)

(assert (=> b!1062533 (=> (not res!709518) (not e!605285))))

(assert (=> b!1062533 (= res!709518 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128719 () Bool)

(declare-fun res!709519 () Bool)

(assert (=> d!128719 (=> res!709519 e!605287)))

(assert (=> d!128719 (= res!709519 (bvsge #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(assert (=> d!128719 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22634) e!605287)))

(declare-fun b!1062534 () Bool)

(assert (=> b!1062534 (= e!605284 e!605286)))

(assert (=> b!1062534 (= c!107206 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128719 (not res!709519)) b!1062533))

(assert (= (and b!1062533 res!709518) b!1062530))

(assert (= (and b!1062533 res!709520) b!1062534))

(assert (= (and b!1062534 c!107206) b!1062532))

(assert (= (and b!1062534 (not c!107206)) b!1062531))

(assert (= (or b!1062532 b!1062531) bm!44889))

(assert (=> b!1062530 m!980803))

(assert (=> b!1062530 m!980803))

(declare-fun m!980815 () Bool)

(assert (=> b!1062530 m!980815))

(assert (=> bm!44889 m!980803))

(declare-fun m!980817 () Bool)

(assert (=> bm!44889 m!980817))

(assert (=> b!1062533 m!980803))

(assert (=> b!1062533 m!980803))

(assert (=> b!1062533 m!980813))

(assert (=> b!1062534 m!980803))

(assert (=> b!1062534 m!980803))

(assert (=> b!1062534 m!980813))

(assert (=> b!1062446 d!128719))

(declare-fun d!128721 () Bool)

(assert (=> d!128721 (= (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468039 () Unit!34677)

(declare-fun choose!1732 (array!67386 array!67388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 V!38761 V!38761 (_ BitVec 32) Int) Unit!34677)

(assert (=> d!128721 (= lt!468039 (choose!1732 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128721 (validMask!0 mask!1515)))

(assert (=> d!128721 (= (lemmaNoChangeToArrayThenSameMapNoExtras!647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468039)))

(declare-fun bs!31214 () Bool)

(assert (= bs!31214 d!128721))

(assert (=> bs!31214 m!980723))

(assert (=> bs!31214 m!980721))

(declare-fun m!980819 () Bool)

(assert (=> bs!31214 m!980819))

(assert (=> bs!31214 m!980725))

(assert (=> b!1062451 d!128721))

(declare-fun b!1062559 () Bool)

(declare-fun lt!468055 () Unit!34677)

(declare-fun lt!468058 () Unit!34677)

(assert (=> b!1062559 (= lt!468055 lt!468058)))

(declare-fun lt!468054 () ListLongMap!14055)

(declare-fun lt!468057 () V!38761)

(declare-fun lt!468056 () (_ BitVec 64))

(declare-fun lt!468060 () (_ BitVec 64))

(declare-fun +!3143 (ListLongMap!14055 tuple2!16086) ListLongMap!14055)

(assert (=> b!1062559 (not (contains!6211 (+!3143 lt!468054 (tuple2!16087 lt!468056 lt!468057)) lt!468060))))

(declare-fun addStillNotContains!248 (ListLongMap!14055 (_ BitVec 64) V!38761 (_ BitVec 64)) Unit!34677)

(assert (=> b!1062559 (= lt!468058 (addStillNotContains!248 lt!468054 lt!468056 lt!468057 lt!468060))))

(assert (=> b!1062559 (= lt!468060 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!16946 (ValueCell!11906 V!38761) V!38761)

(declare-fun dynLambda!2011 (Int (_ BitVec 64)) V!38761)

(assert (=> b!1062559 (= lt!468057 (get!16946 (select (arr!32401 _values!955) #b00000000000000000000000000000000) (dynLambda!2011 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1062559 (= lt!468056 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44895 () ListLongMap!14055)

(assert (=> b!1062559 (= lt!468054 call!44895)))

(declare-fun e!605304 () ListLongMap!14055)

(assert (=> b!1062559 (= e!605304 (+!3143 call!44895 (tuple2!16087 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000) (get!16946 (select (arr!32401 _values!955) #b00000000000000000000000000000000) (dynLambda!2011 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1062560 () Bool)

(assert (=> b!1062560 (= e!605304 call!44895)))

(declare-fun b!1062561 () Bool)

(declare-fun e!605307 () ListLongMap!14055)

(assert (=> b!1062561 (= e!605307 e!605304)))

(declare-fun c!107216 () Bool)

(assert (=> b!1062561 (= c!107216 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062562 () Bool)

(declare-fun res!709531 () Bool)

(declare-fun e!605306 () Bool)

(assert (=> b!1062562 (=> (not res!709531) (not e!605306))))

(declare-fun lt!468059 () ListLongMap!14055)

(assert (=> b!1062562 (= res!709531 (not (contains!6211 lt!468059 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!128723 () Bool)

(assert (=> d!128723 e!605306))

(declare-fun res!709532 () Bool)

(assert (=> d!128723 (=> (not res!709532) (not e!605306))))

(assert (=> d!128723 (= res!709532 (not (contains!6211 lt!468059 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128723 (= lt!468059 e!605307)))

(declare-fun c!107218 () Bool)

(assert (=> d!128723 (= c!107218 (bvsge #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(assert (=> d!128723 (validMask!0 mask!1515)))

(assert (=> d!128723 (= (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468059)))

(declare-fun b!1062563 () Bool)

(declare-fun e!605308 () Bool)

(assert (=> b!1062563 (= e!605308 (= lt!468059 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!44892 () Bool)

(assert (=> bm!44892 (= call!44895 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1062564 () Bool)

(declare-fun e!605303 () Bool)

(assert (=> b!1062564 (= e!605303 e!605308)))

(declare-fun c!107215 () Bool)

(assert (=> b!1062564 (= c!107215 (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun b!1062565 () Bool)

(declare-fun e!605305 () Bool)

(assert (=> b!1062565 (= e!605303 e!605305)))

(assert (=> b!1062565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun res!709529 () Bool)

(assert (=> b!1062565 (= res!709529 (contains!6211 lt!468059 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062565 (=> (not res!709529) (not e!605305))))

(declare-fun b!1062566 () Bool)

(declare-fun e!605302 () Bool)

(assert (=> b!1062566 (= e!605302 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062566 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1062567 () Bool)

(assert (=> b!1062567 (= e!605307 (ListLongMap!14056 Nil!22635))))

(declare-fun b!1062568 () Bool)

(assert (=> b!1062568 (= e!605306 e!605303)))

(declare-fun c!107217 () Bool)

(assert (=> b!1062568 (= c!107217 e!605302)))

(declare-fun res!709530 () Bool)

(assert (=> b!1062568 (=> (not res!709530) (not e!605302))))

(assert (=> b!1062568 (= res!709530 (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun b!1062569 () Bool)

(assert (=> b!1062569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(assert (=> b!1062569 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32939 _values!955)))))

(declare-fun apply!912 (ListLongMap!14055 (_ BitVec 64)) V!38761)

(assert (=> b!1062569 (= e!605305 (= (apply!912 lt!468059 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)) (get!16946 (select (arr!32401 _values!955) #b00000000000000000000000000000000) (dynLambda!2011 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1062570 () Bool)

(declare-fun isEmpty!942 (ListLongMap!14055) Bool)

(assert (=> b!1062570 (= e!605308 (isEmpty!942 lt!468059))))

(assert (= (and d!128723 c!107218) b!1062567))

(assert (= (and d!128723 (not c!107218)) b!1062561))

(assert (= (and b!1062561 c!107216) b!1062559))

(assert (= (and b!1062561 (not c!107216)) b!1062560))

(assert (= (or b!1062559 b!1062560) bm!44892))

(assert (= (and d!128723 res!709532) b!1062562))

(assert (= (and b!1062562 res!709531) b!1062568))

(assert (= (and b!1062568 res!709530) b!1062566))

(assert (= (and b!1062568 c!107217) b!1062565))

(assert (= (and b!1062568 (not c!107217)) b!1062564))

(assert (= (and b!1062565 res!709529) b!1062569))

(assert (= (and b!1062564 c!107215) b!1062563))

(assert (= (and b!1062564 (not c!107215)) b!1062570))

(declare-fun b_lambda!16439 () Bool)

(assert (=> (not b_lambda!16439) (not b!1062559)))

(declare-fun t!31944 () Bool)

(declare-fun tb!7125 () Bool)

(assert (=> (and start!93944 (= defaultEntry!963 defaultEntry!963) t!31944) tb!7125))

(declare-fun result!14699 () Bool)

(assert (=> tb!7125 (= result!14699 tp_is_empty!25219)))

(assert (=> b!1062559 t!31944))

(declare-fun b_and!34111 () Bool)

(assert (= b_and!34105 (and (=> t!31944 result!14699) b_and!34111)))

(declare-fun b_lambda!16441 () Bool)

(assert (=> (not b_lambda!16441) (not b!1062569)))

(assert (=> b!1062569 t!31944))

(declare-fun b_and!34113 () Bool)

(assert (= b_and!34111 (and (=> t!31944 result!14699) b_and!34113)))

(declare-fun m!980821 () Bool)

(assert (=> d!128723 m!980821))

(assert (=> d!128723 m!980725))

(declare-fun m!980823 () Bool)

(assert (=> b!1062563 m!980823))

(declare-fun m!980825 () Bool)

(assert (=> b!1062559 m!980825))

(declare-fun m!980827 () Bool)

(assert (=> b!1062559 m!980827))

(declare-fun m!980829 () Bool)

(assert (=> b!1062559 m!980829))

(declare-fun m!980831 () Bool)

(assert (=> b!1062559 m!980831))

(assert (=> b!1062559 m!980825))

(declare-fun m!980833 () Bool)

(assert (=> b!1062559 m!980833))

(declare-fun m!980835 () Bool)

(assert (=> b!1062559 m!980835))

(assert (=> b!1062559 m!980827))

(assert (=> b!1062559 m!980803))

(declare-fun m!980837 () Bool)

(assert (=> b!1062559 m!980837))

(assert (=> b!1062559 m!980829))

(assert (=> b!1062569 m!980827))

(assert (=> b!1062569 m!980829))

(assert (=> b!1062569 m!980831))

(assert (=> b!1062569 m!980827))

(assert (=> b!1062569 m!980803))

(declare-fun m!980839 () Bool)

(assert (=> b!1062569 m!980839))

(assert (=> b!1062569 m!980803))

(assert (=> b!1062569 m!980829))

(assert (=> bm!44892 m!980823))

(declare-fun m!980841 () Bool)

(assert (=> b!1062570 m!980841))

(assert (=> b!1062565 m!980803))

(assert (=> b!1062565 m!980803))

(declare-fun m!980843 () Bool)

(assert (=> b!1062565 m!980843))

(assert (=> b!1062566 m!980803))

(assert (=> b!1062566 m!980803))

(assert (=> b!1062566 m!980813))

(assert (=> b!1062561 m!980803))

(assert (=> b!1062561 m!980803))

(assert (=> b!1062561 m!980813))

(declare-fun m!980845 () Bool)

(assert (=> b!1062562 m!980845))

(assert (=> b!1062451 d!128723))

(declare-fun b!1062573 () Bool)

(declare-fun lt!468062 () Unit!34677)

(declare-fun lt!468065 () Unit!34677)

(assert (=> b!1062573 (= lt!468062 lt!468065)))

(declare-fun lt!468067 () (_ BitVec 64))

(declare-fun lt!468063 () (_ BitVec 64))

(declare-fun lt!468061 () ListLongMap!14055)

(declare-fun lt!468064 () V!38761)

(assert (=> b!1062573 (not (contains!6211 (+!3143 lt!468061 (tuple2!16087 lt!468063 lt!468064)) lt!468067))))

(assert (=> b!1062573 (= lt!468065 (addStillNotContains!248 lt!468061 lt!468063 lt!468064 lt!468067))))

(assert (=> b!1062573 (= lt!468067 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1062573 (= lt!468064 (get!16946 (select (arr!32401 _values!955) #b00000000000000000000000000000000) (dynLambda!2011 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1062573 (= lt!468063 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44896 () ListLongMap!14055)

(assert (=> b!1062573 (= lt!468061 call!44896)))

(declare-fun e!605311 () ListLongMap!14055)

(assert (=> b!1062573 (= e!605311 (+!3143 call!44896 (tuple2!16087 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000) (get!16946 (select (arr!32401 _values!955) #b00000000000000000000000000000000) (dynLambda!2011 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1062574 () Bool)

(assert (=> b!1062574 (= e!605311 call!44896)))

(declare-fun b!1062575 () Bool)

(declare-fun e!605314 () ListLongMap!14055)

(assert (=> b!1062575 (= e!605314 e!605311)))

(declare-fun c!107220 () Bool)

(assert (=> b!1062575 (= c!107220 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062576 () Bool)

(declare-fun res!709535 () Bool)

(declare-fun e!605313 () Bool)

(assert (=> b!1062576 (=> (not res!709535) (not e!605313))))

(declare-fun lt!468066 () ListLongMap!14055)

(assert (=> b!1062576 (= res!709535 (not (contains!6211 lt!468066 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!128725 () Bool)

(assert (=> d!128725 e!605313))

(declare-fun res!709536 () Bool)

(assert (=> d!128725 (=> (not res!709536) (not e!605313))))

(assert (=> d!128725 (= res!709536 (not (contains!6211 lt!468066 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128725 (= lt!468066 e!605314)))

(declare-fun c!107222 () Bool)

(assert (=> d!128725 (= c!107222 (bvsge #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(assert (=> d!128725 (validMask!0 mask!1515)))

(assert (=> d!128725 (= (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468066)))

(declare-fun b!1062577 () Bool)

(declare-fun e!605315 () Bool)

(assert (=> b!1062577 (= e!605315 (= lt!468066 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!44893 () Bool)

(assert (=> bm!44893 (= call!44896 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1062578 () Bool)

(declare-fun e!605310 () Bool)

(assert (=> b!1062578 (= e!605310 e!605315)))

(declare-fun c!107219 () Bool)

(assert (=> b!1062578 (= c!107219 (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun b!1062579 () Bool)

(declare-fun e!605312 () Bool)

(assert (=> b!1062579 (= e!605310 e!605312)))

(assert (=> b!1062579 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun res!709533 () Bool)

(assert (=> b!1062579 (= res!709533 (contains!6211 lt!468066 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062579 (=> (not res!709533) (not e!605312))))

(declare-fun b!1062580 () Bool)

(declare-fun e!605309 () Bool)

(assert (=> b!1062580 (= e!605309 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062580 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1062581 () Bool)

(assert (=> b!1062581 (= e!605314 (ListLongMap!14056 Nil!22635))))

(declare-fun b!1062582 () Bool)

(assert (=> b!1062582 (= e!605313 e!605310)))

(declare-fun c!107221 () Bool)

(assert (=> b!1062582 (= c!107221 e!605309)))

(declare-fun res!709534 () Bool)

(assert (=> b!1062582 (=> (not res!709534) (not e!605309))))

(assert (=> b!1062582 (= res!709534 (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun b!1062583 () Bool)

(assert (=> b!1062583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(assert (=> b!1062583 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32939 _values!955)))))

(assert (=> b!1062583 (= e!605312 (= (apply!912 lt!468066 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)) (get!16946 (select (arr!32401 _values!955) #b00000000000000000000000000000000) (dynLambda!2011 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1062584 () Bool)

(assert (=> b!1062584 (= e!605315 (isEmpty!942 lt!468066))))

(assert (= (and d!128725 c!107222) b!1062581))

(assert (= (and d!128725 (not c!107222)) b!1062575))

(assert (= (and b!1062575 c!107220) b!1062573))

(assert (= (and b!1062575 (not c!107220)) b!1062574))

(assert (= (or b!1062573 b!1062574) bm!44893))

(assert (= (and d!128725 res!709536) b!1062576))

(assert (= (and b!1062576 res!709535) b!1062582))

(assert (= (and b!1062582 res!709534) b!1062580))

(assert (= (and b!1062582 c!107221) b!1062579))

(assert (= (and b!1062582 (not c!107221)) b!1062578))

(assert (= (and b!1062579 res!709533) b!1062583))

(assert (= (and b!1062578 c!107219) b!1062577))

(assert (= (and b!1062578 (not c!107219)) b!1062584))

(declare-fun b_lambda!16443 () Bool)

(assert (=> (not b_lambda!16443) (not b!1062573)))

(assert (=> b!1062573 t!31944))

(declare-fun b_and!34115 () Bool)

(assert (= b_and!34113 (and (=> t!31944 result!14699) b_and!34115)))

(declare-fun b_lambda!16445 () Bool)

(assert (=> (not b_lambda!16445) (not b!1062583)))

(assert (=> b!1062583 t!31944))

(declare-fun b_and!34117 () Bool)

(assert (= b_and!34115 (and (=> t!31944 result!14699) b_and!34117)))

(declare-fun m!980847 () Bool)

(assert (=> d!128725 m!980847))

(assert (=> d!128725 m!980725))

(declare-fun m!980849 () Bool)

(assert (=> b!1062577 m!980849))

(declare-fun m!980851 () Bool)

(assert (=> b!1062573 m!980851))

(assert (=> b!1062573 m!980827))

(assert (=> b!1062573 m!980829))

(assert (=> b!1062573 m!980831))

(assert (=> b!1062573 m!980851))

(declare-fun m!980853 () Bool)

(assert (=> b!1062573 m!980853))

(declare-fun m!980855 () Bool)

(assert (=> b!1062573 m!980855))

(assert (=> b!1062573 m!980827))

(assert (=> b!1062573 m!980803))

(declare-fun m!980857 () Bool)

(assert (=> b!1062573 m!980857))

(assert (=> b!1062573 m!980829))

(assert (=> b!1062583 m!980827))

(assert (=> b!1062583 m!980829))

(assert (=> b!1062583 m!980831))

(assert (=> b!1062583 m!980827))

(assert (=> b!1062583 m!980803))

(declare-fun m!980859 () Bool)

(assert (=> b!1062583 m!980859))

(assert (=> b!1062583 m!980803))

(assert (=> b!1062583 m!980829))

(assert (=> bm!44893 m!980849))

(declare-fun m!980861 () Bool)

(assert (=> b!1062584 m!980861))

(assert (=> b!1062579 m!980803))

(assert (=> b!1062579 m!980803))

(declare-fun m!980863 () Bool)

(assert (=> b!1062579 m!980863))

(assert (=> b!1062580 m!980803))

(assert (=> b!1062580 m!980803))

(assert (=> b!1062580 m!980813))

(assert (=> b!1062575 m!980803))

(assert (=> b!1062575 m!980803))

(assert (=> b!1062575 m!980813))

(declare-fun m!980865 () Bool)

(assert (=> b!1062576 m!980865))

(assert (=> b!1062451 d!128725))

(declare-fun d!128727 () Bool)

(declare-fun e!605320 () Bool)

(assert (=> d!128727 e!605320))

(declare-fun res!709539 () Bool)

(assert (=> d!128727 (=> res!709539 e!605320)))

(declare-fun lt!468077 () Bool)

(assert (=> d!128727 (= res!709539 (not lt!468077))))

(declare-fun lt!468079 () Bool)

(assert (=> d!128727 (= lt!468077 lt!468079)))

(declare-fun lt!468076 () Unit!34677)

(declare-fun e!605321 () Unit!34677)

(assert (=> d!128727 (= lt!468076 e!605321)))

(declare-fun c!107225 () Bool)

(assert (=> d!128727 (= c!107225 lt!468079)))

(declare-fun containsKey!572 (List!22638 (_ BitVec 64)) Bool)

(assert (=> d!128727 (= lt!468079 (containsKey!572 (toList!7043 lt!467990) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128727 (= (contains!6211 lt!467990 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468077)))

(declare-fun b!1062591 () Bool)

(declare-fun lt!468078 () Unit!34677)

(assert (=> b!1062591 (= e!605321 lt!468078)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!404 (List!22638 (_ BitVec 64)) Unit!34677)

(assert (=> b!1062591 (= lt!468078 (lemmaContainsKeyImpliesGetValueByKeyDefined!404 (toList!7043 lt!467990) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!650 0))(
  ( (Some!649 (v!15272 V!38761)) (None!648) )
))
(declare-fun isDefined!447 (Option!650) Bool)

(declare-fun getValueByKey!599 (List!22638 (_ BitVec 64)) Option!650)

(assert (=> b!1062591 (isDefined!447 (getValueByKey!599 (toList!7043 lt!467990) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062592 () Bool)

(declare-fun Unit!34681 () Unit!34677)

(assert (=> b!1062592 (= e!605321 Unit!34681)))

(declare-fun b!1062593 () Bool)

(assert (=> b!1062593 (= e!605320 (isDefined!447 (getValueByKey!599 (toList!7043 lt!467990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128727 c!107225) b!1062591))

(assert (= (and d!128727 (not c!107225)) b!1062592))

(assert (= (and d!128727 (not res!709539)) b!1062593))

(declare-fun m!980867 () Bool)

(assert (=> d!128727 m!980867))

(declare-fun m!980869 () Bool)

(assert (=> b!1062591 m!980869))

(declare-fun m!980871 () Bool)

(assert (=> b!1062591 m!980871))

(assert (=> b!1062591 m!980871))

(declare-fun m!980873 () Bool)

(assert (=> b!1062591 m!980873))

(assert (=> b!1062593 m!980871))

(assert (=> b!1062593 m!980871))

(assert (=> b!1062593 m!980873))

(assert (=> b!1062447 d!128727))

(declare-fun lt!468139 () ListLongMap!14055)

(declare-fun e!605352 () Bool)

(declare-fun b!1062636 () Bool)

(assert (=> b!1062636 (= e!605352 (= (apply!912 lt!468139 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)) (get!16946 (select (arr!32401 _values!955) #b00000000000000000000000000000000) (dynLambda!2011 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1062636 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32939 _values!955)))))

(assert (=> b!1062636 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun b!1062637 () Bool)

(declare-fun e!605356 () Bool)

(declare-fun e!605348 () Bool)

(assert (=> b!1062637 (= e!605356 e!605348)))

(declare-fun c!107239 () Bool)

(assert (=> b!1062637 (= c!107239 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44908 () Bool)

(declare-fun call!44913 () ListLongMap!14055)

(declare-fun c!107238 () Bool)

(declare-fun call!44911 () ListLongMap!14055)

(declare-fun call!44914 () ListLongMap!14055)

(declare-fun c!107241 () Bool)

(declare-fun call!44916 () ListLongMap!14055)

(assert (=> bm!44908 (= call!44911 (+!3143 (ite c!107241 call!44916 (ite c!107238 call!44913 call!44914)) (ite (or c!107241 c!107238) (tuple2!16087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!44909 () Bool)

(declare-fun call!44912 () Bool)

(assert (=> bm!44909 (= call!44912 (contains!6211 lt!468139 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062638 () Bool)

(declare-fun e!605358 () Unit!34677)

(declare-fun lt!468129 () Unit!34677)

(assert (=> b!1062638 (= e!605358 lt!468129)))

(declare-fun lt!468138 () ListLongMap!14055)

(assert (=> b!1062638 (= lt!468138 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468127 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468127 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468130 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468130 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468137 () Unit!34677)

(declare-fun addStillContains!629 (ListLongMap!14055 (_ BitVec 64) V!38761 (_ BitVec 64)) Unit!34677)

(assert (=> b!1062638 (= lt!468137 (addStillContains!629 lt!468138 lt!468127 zeroValueBefore!47 lt!468130))))

(assert (=> b!1062638 (contains!6211 (+!3143 lt!468138 (tuple2!16087 lt!468127 zeroValueBefore!47)) lt!468130)))

(declare-fun lt!468140 () Unit!34677)

(assert (=> b!1062638 (= lt!468140 lt!468137)))

(declare-fun lt!468131 () ListLongMap!14055)

(assert (=> b!1062638 (= lt!468131 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468132 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468132 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468133 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468133 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468135 () Unit!34677)

(declare-fun addApplyDifferent!485 (ListLongMap!14055 (_ BitVec 64) V!38761 (_ BitVec 64)) Unit!34677)

(assert (=> b!1062638 (= lt!468135 (addApplyDifferent!485 lt!468131 lt!468132 minValue!907 lt!468133))))

(assert (=> b!1062638 (= (apply!912 (+!3143 lt!468131 (tuple2!16087 lt!468132 minValue!907)) lt!468133) (apply!912 lt!468131 lt!468133))))

(declare-fun lt!468144 () Unit!34677)

(assert (=> b!1062638 (= lt!468144 lt!468135)))

(declare-fun lt!468126 () ListLongMap!14055)

(assert (=> b!1062638 (= lt!468126 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468143 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468136 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468136 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468142 () Unit!34677)

(assert (=> b!1062638 (= lt!468142 (addApplyDifferent!485 lt!468126 lt!468143 zeroValueBefore!47 lt!468136))))

(assert (=> b!1062638 (= (apply!912 (+!3143 lt!468126 (tuple2!16087 lt!468143 zeroValueBefore!47)) lt!468136) (apply!912 lt!468126 lt!468136))))

(declare-fun lt!468141 () Unit!34677)

(assert (=> b!1062638 (= lt!468141 lt!468142)))

(declare-fun lt!468134 () ListLongMap!14055)

(assert (=> b!1062638 (= lt!468134 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468145 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468125 () (_ BitVec 64))

(assert (=> b!1062638 (= lt!468125 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1062638 (= lt!468129 (addApplyDifferent!485 lt!468134 lt!468145 minValue!907 lt!468125))))

(assert (=> b!1062638 (= (apply!912 (+!3143 lt!468134 (tuple2!16087 lt!468145 minValue!907)) lt!468125) (apply!912 lt!468134 lt!468125))))

(declare-fun b!1062639 () Bool)

(declare-fun res!709558 () Bool)

(assert (=> b!1062639 (=> (not res!709558) (not e!605356))))

(declare-fun e!605355 () Bool)

(assert (=> b!1062639 (= res!709558 e!605355)))

(declare-fun c!107243 () Bool)

(assert (=> b!1062639 (= c!107243 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062640 () Bool)

(declare-fun e!605357 () ListLongMap!14055)

(declare-fun e!605360 () ListLongMap!14055)

(assert (=> b!1062640 (= e!605357 e!605360)))

(assert (=> b!1062640 (= c!107238 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!44910 () Bool)

(declare-fun call!44917 () ListLongMap!14055)

(assert (=> bm!44910 (= call!44917 call!44911)))

(declare-fun bm!44911 () Bool)

(assert (=> bm!44911 (= call!44913 call!44916)))

(declare-fun b!1062641 () Bool)

(declare-fun e!605350 () Bool)

(assert (=> b!1062641 (= e!605350 (= (apply!912 lt!468139 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!44912 () Bool)

(declare-fun call!44915 () Bool)

(assert (=> bm!44912 (= call!44915 (contains!6211 lt!468139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062642 () Bool)

(assert (=> b!1062642 (= e!605355 (not call!44915))))

(declare-fun b!1062643 () Bool)

(assert (=> b!1062643 (= e!605348 (not call!44912))))

(declare-fun b!1062644 () Bool)

(declare-fun res!709560 () Bool)

(assert (=> b!1062644 (=> (not res!709560) (not e!605356))))

(declare-fun e!605353 () Bool)

(assert (=> b!1062644 (= res!709560 e!605353)))

(declare-fun res!709559 () Bool)

(assert (=> b!1062644 (=> res!709559 e!605353)))

(declare-fun e!605359 () Bool)

(assert (=> b!1062644 (= res!709559 (not e!605359))))

(declare-fun res!709562 () Bool)

(assert (=> b!1062644 (=> (not res!709562) (not e!605359))))

(assert (=> b!1062644 (= res!709562 (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun b!1062645 () Bool)

(declare-fun Unit!34682 () Unit!34677)

(assert (=> b!1062645 (= e!605358 Unit!34682)))

(declare-fun d!128729 () Bool)

(assert (=> d!128729 e!605356))

(declare-fun res!709564 () Bool)

(assert (=> d!128729 (=> (not res!709564) (not e!605356))))

(assert (=> d!128729 (= res!709564 (or (bvsge #b00000000000000000000000000000000 (size!32938 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))))

(declare-fun lt!468124 () ListLongMap!14055)

(assert (=> d!128729 (= lt!468139 lt!468124)))

(declare-fun lt!468128 () Unit!34677)

(assert (=> d!128729 (= lt!468128 e!605358)))

(declare-fun c!107240 () Bool)

(declare-fun e!605349 () Bool)

(assert (=> d!128729 (= c!107240 e!605349)))

(declare-fun res!709563 () Bool)

(assert (=> d!128729 (=> (not res!709563) (not e!605349))))

(assert (=> d!128729 (= res!709563 (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(assert (=> d!128729 (= lt!468124 e!605357)))

(assert (=> d!128729 (= c!107241 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128729 (validMask!0 mask!1515)))

(assert (=> d!128729 (= (getCurrentListMap!3943 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468139)))

(declare-fun b!1062646 () Bool)

(declare-fun e!605351 () ListLongMap!14055)

(assert (=> b!1062646 (= e!605351 call!44917)))

(declare-fun b!1062647 () Bool)

(declare-fun c!107242 () Bool)

(assert (=> b!1062647 (= c!107242 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1062647 (= e!605360 e!605351)))

(declare-fun b!1062648 () Bool)

(assert (=> b!1062648 (= e!605359 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062649 () Bool)

(assert (=> b!1062649 (= e!605360 call!44917)))

(declare-fun bm!44913 () Bool)

(assert (=> bm!44913 (= call!44914 call!44913)))

(declare-fun b!1062650 () Bool)

(assert (=> b!1062650 (= e!605351 call!44914)))

(declare-fun bm!44914 () Bool)

(assert (=> bm!44914 (= call!44916 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062651 () Bool)

(assert (=> b!1062651 (= e!605357 (+!3143 call!44911 (tuple2!16087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1062652 () Bool)

(declare-fun e!605354 () Bool)

(assert (=> b!1062652 (= e!605348 e!605354)))

(declare-fun res!709566 () Bool)

(assert (=> b!1062652 (= res!709566 call!44912)))

(assert (=> b!1062652 (=> (not res!709566) (not e!605354))))

(declare-fun b!1062653 () Bool)

(assert (=> b!1062653 (= e!605353 e!605352)))

(declare-fun res!709561 () Bool)

(assert (=> b!1062653 (=> (not res!709561) (not e!605352))))

(assert (=> b!1062653 (= res!709561 (contains!6211 lt!468139 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1062653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32938 _keys!1163)))))

(declare-fun b!1062654 () Bool)

(assert (=> b!1062654 (= e!605349 (validKeyInArray!0 (select (arr!32400 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1062655 () Bool)

(assert (=> b!1062655 (= e!605354 (= (apply!912 lt!468139 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1062656 () Bool)

(assert (=> b!1062656 (= e!605355 e!605350)))

(declare-fun res!709565 () Bool)

(assert (=> b!1062656 (= res!709565 call!44915)))

(assert (=> b!1062656 (=> (not res!709565) (not e!605350))))

(assert (= (and d!128729 c!107241) b!1062651))

(assert (= (and d!128729 (not c!107241)) b!1062640))

(assert (= (and b!1062640 c!107238) b!1062649))

(assert (= (and b!1062640 (not c!107238)) b!1062647))

(assert (= (and b!1062647 c!107242) b!1062646))

(assert (= (and b!1062647 (not c!107242)) b!1062650))

(assert (= (or b!1062646 b!1062650) bm!44913))

(assert (= (or b!1062649 bm!44913) bm!44911))

(assert (= (or b!1062649 b!1062646) bm!44910))

(assert (= (or b!1062651 bm!44911) bm!44914))

(assert (= (or b!1062651 bm!44910) bm!44908))

(assert (= (and d!128729 res!709563) b!1062654))

(assert (= (and d!128729 c!107240) b!1062638))

(assert (= (and d!128729 (not c!107240)) b!1062645))

(assert (= (and d!128729 res!709564) b!1062644))

(assert (= (and b!1062644 res!709562) b!1062648))

(assert (= (and b!1062644 (not res!709559)) b!1062653))

(assert (= (and b!1062653 res!709561) b!1062636))

(assert (= (and b!1062644 res!709560) b!1062639))

(assert (= (and b!1062639 c!107243) b!1062656))

(assert (= (and b!1062639 (not c!107243)) b!1062642))

(assert (= (and b!1062656 res!709565) b!1062641))

(assert (= (or b!1062656 b!1062642) bm!44912))

(assert (= (and b!1062639 res!709558) b!1062637))

(assert (= (and b!1062637 c!107239) b!1062652))

(assert (= (and b!1062637 (not c!107239)) b!1062643))

(assert (= (and b!1062652 res!709566) b!1062655))

(assert (= (or b!1062652 b!1062643) bm!44909))

(declare-fun b_lambda!16447 () Bool)

(assert (=> (not b_lambda!16447) (not b!1062636)))

(assert (=> b!1062636 t!31944))

(declare-fun b_and!34119 () Bool)

(assert (= b_and!34117 (and (=> t!31944 result!14699) b_and!34119)))

(declare-fun m!980875 () Bool)

(assert (=> b!1062641 m!980875))

(assert (=> d!128729 m!980725))

(declare-fun m!980877 () Bool)

(assert (=> b!1062655 m!980877))

(assert (=> b!1062636 m!980829))

(assert (=> b!1062636 m!980803))

(declare-fun m!980879 () Bool)

(assert (=> b!1062636 m!980879))

(assert (=> b!1062636 m!980827))

(assert (=> b!1062636 m!980829))

(assert (=> b!1062636 m!980831))

(assert (=> b!1062636 m!980803))

(assert (=> b!1062636 m!980827))

(declare-fun m!980881 () Bool)

(assert (=> bm!44908 m!980881))

(assert (=> b!1062654 m!980803))

(assert (=> b!1062654 m!980803))

(assert (=> b!1062654 m!980813))

(declare-fun m!980883 () Bool)

(assert (=> bm!44912 m!980883))

(assert (=> b!1062653 m!980803))

(assert (=> b!1062653 m!980803))

(declare-fun m!980885 () Bool)

(assert (=> b!1062653 m!980885))

(assert (=> bm!44914 m!980723))

(declare-fun m!980887 () Bool)

(assert (=> b!1062638 m!980887))

(declare-fun m!980889 () Bool)

(assert (=> b!1062638 m!980889))

(declare-fun m!980891 () Bool)

(assert (=> b!1062638 m!980891))

(declare-fun m!980893 () Bool)

(assert (=> b!1062638 m!980893))

(assert (=> b!1062638 m!980723))

(assert (=> b!1062638 m!980891))

(declare-fun m!980895 () Bool)

(assert (=> b!1062638 m!980895))

(declare-fun m!980897 () Bool)

(assert (=> b!1062638 m!980897))

(assert (=> b!1062638 m!980897))

(declare-fun m!980899 () Bool)

(assert (=> b!1062638 m!980899))

(assert (=> b!1062638 m!980803))

(declare-fun m!980901 () Bool)

(assert (=> b!1062638 m!980901))

(declare-fun m!980903 () Bool)

(assert (=> b!1062638 m!980903))

(assert (=> b!1062638 m!980901))

(declare-fun m!980905 () Bool)

(assert (=> b!1062638 m!980905))

(declare-fun m!980907 () Bool)

(assert (=> b!1062638 m!980907))

(declare-fun m!980909 () Bool)

(assert (=> b!1062638 m!980909))

(declare-fun m!980911 () Bool)

(assert (=> b!1062638 m!980911))

(declare-fun m!980913 () Bool)

(assert (=> b!1062638 m!980913))

(declare-fun m!980915 () Bool)

(assert (=> b!1062638 m!980915))

(assert (=> b!1062638 m!980887))

(declare-fun m!980917 () Bool)

(assert (=> b!1062651 m!980917))

(assert (=> b!1062648 m!980803))

(assert (=> b!1062648 m!980803))

(assert (=> b!1062648 m!980813))

(declare-fun m!980919 () Bool)

(assert (=> bm!44909 m!980919))

(assert (=> b!1062447 d!128729))

(declare-fun condMapEmpty!39511 () Bool)

(declare-fun mapDefault!39511 () ValueCell!11906)

(assert (=> mapNonEmpty!39502 (= condMapEmpty!39511 (= mapRest!39502 ((as const (Array (_ BitVec 32) ValueCell!11906)) mapDefault!39511)))))

(declare-fun e!605365 () Bool)

(declare-fun mapRes!39511 () Bool)

(assert (=> mapNonEmpty!39502 (= tp!75653 (and e!605365 mapRes!39511))))

(declare-fun b!1062663 () Bool)

(declare-fun e!605366 () Bool)

(assert (=> b!1062663 (= e!605366 tp_is_empty!25219)))

(declare-fun b!1062664 () Bool)

(assert (=> b!1062664 (= e!605365 tp_is_empty!25219)))

(declare-fun mapIsEmpty!39511 () Bool)

(assert (=> mapIsEmpty!39511 mapRes!39511))

(declare-fun mapNonEmpty!39511 () Bool)

(declare-fun tp!75668 () Bool)

(assert (=> mapNonEmpty!39511 (= mapRes!39511 (and tp!75668 e!605366))))

(declare-fun mapRest!39511 () (Array (_ BitVec 32) ValueCell!11906))

(declare-fun mapKey!39511 () (_ BitVec 32))

(declare-fun mapValue!39511 () ValueCell!11906)

(assert (=> mapNonEmpty!39511 (= mapRest!39502 (store mapRest!39511 mapKey!39511 mapValue!39511))))

(assert (= (and mapNonEmpty!39502 condMapEmpty!39511) mapIsEmpty!39511))

(assert (= (and mapNonEmpty!39502 (not condMapEmpty!39511)) mapNonEmpty!39511))

(assert (= (and mapNonEmpty!39511 ((_ is ValueCellFull!11906) mapValue!39511)) b!1062663))

(assert (= (and mapNonEmpty!39502 ((_ is ValueCellFull!11906) mapDefault!39511)) b!1062664))

(declare-fun m!980921 () Bool)

(assert (=> mapNonEmpty!39511 m!980921))

(declare-fun b_lambda!16449 () Bool)

(assert (= b_lambda!16443 (or (and start!93944 b_free!21409) b_lambda!16449)))

(declare-fun b_lambda!16451 () Bool)

(assert (= b_lambda!16445 (or (and start!93944 b_free!21409) b_lambda!16451)))

(declare-fun b_lambda!16453 () Bool)

(assert (= b_lambda!16441 (or (and start!93944 b_free!21409) b_lambda!16453)))

(declare-fun b_lambda!16455 () Bool)

(assert (= b_lambda!16447 (or (and start!93944 b_free!21409) b_lambda!16455)))

(declare-fun b_lambda!16457 () Bool)

(assert (= b_lambda!16439 (or (and start!93944 b_free!21409) b_lambda!16457)))

(check-sat (not b!1062566) (not bm!44914) (not b_lambda!16455) (not bm!44912) (not d!128723) (not bm!44909) (not b!1062636) (not b!1062569) (not b!1062591) (not b!1062579) (not b!1062570) (not b!1062562) (not b!1062573) (not d!128715) (not b!1062576) (not b!1062653) (not bm!44893) (not b_next!21409) (not b!1062583) (not b!1062641) (not b!1062580) (not b_lambda!16449) (not b!1062518) (not b!1062559) (not b!1062530) (not b!1062533) (not bm!44892) (not b_lambda!16453) tp_is_empty!25219 (not d!128729) (not b!1062648) (not bm!44886) b_and!34119 (not b_lambda!16457) (not b!1062575) (not d!128727) (not b!1062534) (not b!1062593) (not mapNonEmpty!39511) (not b!1062651) (not bm!44908) (not b!1062584) (not b_lambda!16451) (not d!128721) (not b!1062563) (not d!128713) (not d!128725) (not b!1062638) (not b!1062561) (not bm!44889) (not b!1062565) (not b!1062654) (not b!1062577) (not b!1062655) (not b!1062516))
(check-sat b_and!34119 (not b_next!21409))
