; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94846 () Bool)

(assert start!94846)

(declare-fun b_free!22081 () Bool)

(declare-fun b_next!22081 () Bool)

(assert (=> start!94846 (= b_free!22081 (not b_next!22081))))

(declare-fun tp!77704 () Bool)

(declare-fun b_and!34897 () Bool)

(assert (=> start!94846 (= tp!77704 b_and!34897)))

(declare-fun mapNonEmpty!40546 () Bool)

(declare-fun mapRes!40546 () Bool)

(declare-fun tp!77705 () Bool)

(declare-fun e!612577 () Bool)

(assert (=> mapNonEmpty!40546 (= mapRes!40546 (and tp!77705 e!612577))))

(declare-datatypes ((V!39657 0))(
  ( (V!39658 (val!12996 Int)) )
))
(declare-datatypes ((ValueCell!12242 0))(
  ( (ValueCellFull!12242 (v!15612 V!39657)) (EmptyCell!12242) )
))
(declare-fun mapRest!40546 () (Array (_ BitVec 32) ValueCell!12242))

(declare-fun mapKey!40546 () (_ BitVec 32))

(declare-datatypes ((array!68688 0))(
  ( (array!68689 (arr!33039 (Array (_ BitVec 32) ValueCell!12242)) (size!33577 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68688)

(declare-fun mapValue!40546 () ValueCell!12242)

(assert (=> mapNonEmpty!40546 (= (arr!33039 _values!955) (store mapRest!40546 mapKey!40546 mapValue!40546))))

(declare-fun b!1072440 () Bool)

(declare-fun res!715406 () Bool)

(declare-fun e!612576 () Bool)

(assert (=> b!1072440 (=> (not res!715406) (not e!612576))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68690 0))(
  ( (array!68691 (arr!33040 (Array (_ BitVec 32) (_ BitVec 64))) (size!33578 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68690)

(assert (=> b!1072440 (= res!715406 (and (= (size!33577 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33578 _keys!1163) (size!33577 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072441 () Bool)

(declare-fun e!612572 () Bool)

(assert (=> b!1072441 (= e!612576 (not e!612572))))

(declare-fun res!715408 () Bool)

(assert (=> b!1072441 (=> res!715408 e!612572)))

(assert (=> b!1072441 (= res!715408 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16608 0))(
  ( (tuple2!16609 (_1!8315 (_ BitVec 64)) (_2!8315 V!39657)) )
))
(declare-datatypes ((List!23131 0))(
  ( (Nil!23128) (Cons!23127 (h!24336 tuple2!16608) (t!32457 List!23131)) )
))
(declare-datatypes ((ListLongMap!14577 0))(
  ( (ListLongMap!14578 (toList!7304 List!23131)) )
))
(declare-fun lt!475428 () ListLongMap!14577)

(declare-fun lt!475424 () ListLongMap!14577)

(assert (=> b!1072441 (= lt!475428 lt!475424)))

(declare-fun zeroValueBefore!47 () V!39657)

(declare-datatypes ((Unit!35183 0))(
  ( (Unit!35184) )
))
(declare-fun lt!475418 () Unit!35183)

(declare-fun minValue!907 () V!39657)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39657)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!878 (array!68690 array!68688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 V!39657 V!39657 (_ BitVec 32) Int) Unit!35183)

(assert (=> b!1072441 (= lt!475418 (lemmaNoChangeToArrayThenSameMapNoExtras!878 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3884 (array!68690 array!68688 (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 (_ BitVec 32) Int) ListLongMap!14577)

(assert (=> b!1072441 (= lt!475424 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072441 (= lt!475428 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072442 () Bool)

(declare-fun tp_is_empty!25891 () Bool)

(assert (=> b!1072442 (= e!612577 tp_is_empty!25891)))

(declare-fun mapIsEmpty!40546 () Bool)

(assert (=> mapIsEmpty!40546 mapRes!40546))

(declare-fun b!1072443 () Bool)

(declare-fun res!715404 () Bool)

(assert (=> b!1072443 (=> (not res!715404) (not e!612576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68690 (_ BitVec 32)) Bool)

(assert (=> b!1072443 (= res!715404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072444 () Bool)

(declare-fun e!612571 () Bool)

(assert (=> b!1072444 (= e!612571 tp_is_empty!25891)))

(declare-fun e!612573 () Bool)

(declare-fun lt!475420 () ListLongMap!14577)

(declare-fun b!1072445 () Bool)

(declare-fun lt!475426 () tuple2!16608)

(declare-fun +!3236 (ListLongMap!14577 tuple2!16608) ListLongMap!14577)

(assert (=> b!1072445 (= e!612573 (= lt!475420 (+!3236 lt!475424 lt!475426)))))

(declare-fun b!1072446 () Bool)

(declare-fun e!612578 () Bool)

(assert (=> b!1072446 (= e!612578 (bvsle #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun res!715407 () Bool)

(assert (=> start!94846 (=> (not res!715407) (not e!612576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94846 (= res!715407 (validMask!0 mask!1515))))

(assert (=> start!94846 e!612576))

(assert (=> start!94846 true))

(assert (=> start!94846 tp_is_empty!25891))

(declare-fun e!612574 () Bool)

(declare-fun array_inv!25562 (array!68688) Bool)

(assert (=> start!94846 (and (array_inv!25562 _values!955) e!612574)))

(assert (=> start!94846 tp!77704))

(declare-fun array_inv!25563 (array!68690) Bool)

(assert (=> start!94846 (array_inv!25563 _keys!1163)))

(declare-fun b!1072439 () Bool)

(assert (=> b!1072439 (= e!612574 (and e!612571 mapRes!40546))))

(declare-fun condMapEmpty!40546 () Bool)

(declare-fun mapDefault!40546 () ValueCell!12242)

(assert (=> b!1072439 (= condMapEmpty!40546 (= (arr!33039 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12242)) mapDefault!40546)))))

(declare-fun b!1072447 () Bool)

(declare-fun res!715403 () Bool)

(assert (=> b!1072447 (=> (not res!715403) (not e!612576))))

(declare-datatypes ((List!23132 0))(
  ( (Nil!23129) (Cons!23128 (h!24337 (_ BitVec 64)) (t!32458 List!23132)) )
))
(declare-fun arrayNoDuplicates!0 (array!68690 (_ BitVec 32) List!23132) Bool)

(assert (=> b!1072447 (= res!715403 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23129))))

(declare-fun b!1072448 () Bool)

(assert (=> b!1072448 (= e!612572 e!612578)))

(declare-fun res!715405 () Bool)

(assert (=> b!1072448 (=> res!715405 e!612578)))

(declare-fun lt!475422 () ListLongMap!14577)

(declare-fun -!690 (ListLongMap!14577 (_ BitVec 64)) ListLongMap!14577)

(assert (=> b!1072448 (= res!715405 (not (= (-!690 lt!475422 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475420)))))

(declare-fun lt!475427 () ListLongMap!14577)

(declare-fun lt!475429 () ListLongMap!14577)

(assert (=> b!1072448 (= lt!475427 lt!475429)))

(declare-fun lt!475419 () Unit!35183)

(declare-fun addCommutativeForDiffKeys!748 (ListLongMap!14577 (_ BitVec 64) V!39657 (_ BitVec 64) V!39657) Unit!35183)

(assert (=> b!1072448 (= lt!475419 (addCommutativeForDiffKeys!748 lt!475428 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475423 () ListLongMap!14577)

(assert (=> b!1072448 (= (-!690 lt!475429 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475423)))

(declare-fun lt!475421 () tuple2!16608)

(assert (=> b!1072448 (= lt!475429 (+!3236 lt!475423 lt!475421))))

(declare-fun lt!475425 () Unit!35183)

(declare-fun addThenRemoveForNewKeyIsSame!71 (ListLongMap!14577 (_ BitVec 64) V!39657) Unit!35183)

(assert (=> b!1072448 (= lt!475425 (addThenRemoveForNewKeyIsSame!71 lt!475423 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072448 (= lt!475423 (+!3236 lt!475428 lt!475426))))

(assert (=> b!1072448 e!612573))

(declare-fun res!715402 () Bool)

(assert (=> b!1072448 (=> (not res!715402) (not e!612573))))

(assert (=> b!1072448 (= res!715402 (= lt!475422 lt!475427))))

(assert (=> b!1072448 (= lt!475427 (+!3236 (+!3236 lt!475428 lt!475421) lt!475426))))

(assert (=> b!1072448 (= lt!475426 (tuple2!16609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072448 (= lt!475421 (tuple2!16609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4103 (array!68690 array!68688 (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 (_ BitVec 32) Int) ListLongMap!14577)

(assert (=> b!1072448 (= lt!475420 (getCurrentListMap!4103 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072448 (= lt!475422 (getCurrentListMap!4103 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94846 res!715407) b!1072440))

(assert (= (and b!1072440 res!715406) b!1072443))

(assert (= (and b!1072443 res!715404) b!1072447))

(assert (= (and b!1072447 res!715403) b!1072441))

(assert (= (and b!1072441 (not res!715408)) b!1072448))

(assert (= (and b!1072448 res!715402) b!1072445))

(assert (= (and b!1072448 (not res!715405)) b!1072446))

(assert (= (and b!1072439 condMapEmpty!40546) mapIsEmpty!40546))

(assert (= (and b!1072439 (not condMapEmpty!40546)) mapNonEmpty!40546))

(get-info :version)

(assert (= (and mapNonEmpty!40546 ((_ is ValueCellFull!12242) mapValue!40546)) b!1072442))

(assert (= (and b!1072439 ((_ is ValueCellFull!12242) mapDefault!40546)) b!1072444))

(assert (= start!94846 b!1072439))

(declare-fun m!990987 () Bool)

(assert (=> b!1072443 m!990987))

(declare-fun m!990989 () Bool)

(assert (=> b!1072448 m!990989))

(declare-fun m!990991 () Bool)

(assert (=> b!1072448 m!990991))

(declare-fun m!990993 () Bool)

(assert (=> b!1072448 m!990993))

(declare-fun m!990995 () Bool)

(assert (=> b!1072448 m!990995))

(declare-fun m!990997 () Bool)

(assert (=> b!1072448 m!990997))

(declare-fun m!990999 () Bool)

(assert (=> b!1072448 m!990999))

(assert (=> b!1072448 m!990997))

(declare-fun m!991001 () Bool)

(assert (=> b!1072448 m!991001))

(declare-fun m!991003 () Bool)

(assert (=> b!1072448 m!991003))

(declare-fun m!991005 () Bool)

(assert (=> b!1072448 m!991005))

(declare-fun m!991007 () Bool)

(assert (=> b!1072448 m!991007))

(declare-fun m!991009 () Bool)

(assert (=> b!1072441 m!991009))

(declare-fun m!991011 () Bool)

(assert (=> b!1072441 m!991011))

(declare-fun m!991013 () Bool)

(assert (=> b!1072441 m!991013))

(declare-fun m!991015 () Bool)

(assert (=> b!1072445 m!991015))

(declare-fun m!991017 () Bool)

(assert (=> start!94846 m!991017))

(declare-fun m!991019 () Bool)

(assert (=> start!94846 m!991019))

(declare-fun m!991021 () Bool)

(assert (=> start!94846 m!991021))

(declare-fun m!991023 () Bool)

(assert (=> b!1072447 m!991023))

(declare-fun m!991025 () Bool)

(assert (=> mapNonEmpty!40546 m!991025))

(check-sat (not b!1072443) (not b!1072445) (not mapNonEmpty!40546) (not b!1072448) (not b!1072441) tp_is_empty!25891 b_and!34897 (not b!1072447) (not start!94846) (not b_next!22081))
(check-sat b_and!34897 (not b_next!22081))
(get-model)

(declare-fun b!1072519 () Bool)

(declare-fun e!612636 () Bool)

(declare-fun e!612635 () Bool)

(assert (=> b!1072519 (= e!612636 e!612635)))

(declare-fun res!715457 () Bool)

(assert (=> b!1072519 (=> (not res!715457) (not e!612635))))

(declare-fun e!612638 () Bool)

(assert (=> b!1072519 (= res!715457 (not e!612638))))

(declare-fun res!715458 () Bool)

(assert (=> b!1072519 (=> (not res!715458) (not e!612638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1072519 (= res!715458 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072520 () Bool)

(declare-fun e!612637 () Bool)

(assert (=> b!1072520 (= e!612635 e!612637)))

(declare-fun c!107659 () Bool)

(assert (=> b!1072520 (= c!107659 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129205 () Bool)

(declare-fun res!715459 () Bool)

(assert (=> d!129205 (=> res!715459 e!612636)))

(assert (=> d!129205 (= res!715459 (bvsge #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (=> d!129205 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23129) e!612636)))

(declare-fun bm!45216 () Bool)

(declare-fun call!45219 () Bool)

(assert (=> bm!45216 (= call!45219 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107659 (Cons!23128 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000) Nil!23129) Nil!23129)))))

(declare-fun b!1072521 () Bool)

(assert (=> b!1072521 (= e!612637 call!45219)))

(declare-fun b!1072522 () Bool)

(assert (=> b!1072522 (= e!612637 call!45219)))

(declare-fun b!1072523 () Bool)

(declare-fun contains!6293 (List!23132 (_ BitVec 64)) Bool)

(assert (=> b!1072523 (= e!612638 (contains!6293 Nil!23129 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129205 (not res!715459)) b!1072519))

(assert (= (and b!1072519 res!715458) b!1072523))

(assert (= (and b!1072519 res!715457) b!1072520))

(assert (= (and b!1072520 c!107659) b!1072522))

(assert (= (and b!1072520 (not c!107659)) b!1072521))

(assert (= (or b!1072522 b!1072521) bm!45216))

(declare-fun m!991107 () Bool)

(assert (=> b!1072519 m!991107))

(assert (=> b!1072519 m!991107))

(declare-fun m!991109 () Bool)

(assert (=> b!1072519 m!991109))

(assert (=> b!1072520 m!991107))

(assert (=> b!1072520 m!991107))

(assert (=> b!1072520 m!991109))

(assert (=> bm!45216 m!991107))

(declare-fun m!991111 () Bool)

(assert (=> bm!45216 m!991111))

(assert (=> b!1072523 m!991107))

(assert (=> b!1072523 m!991107))

(declare-fun m!991113 () Bool)

(assert (=> b!1072523 m!991113))

(assert (=> b!1072447 d!129205))

(declare-fun b!1072532 () Bool)

(declare-fun e!612645 () Bool)

(declare-fun e!612646 () Bool)

(assert (=> b!1072532 (= e!612645 e!612646)))

(declare-fun lt!475510 () (_ BitVec 64))

(assert (=> b!1072532 (= lt!475510 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475509 () Unit!35183)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68690 (_ BitVec 64) (_ BitVec 32)) Unit!35183)

(assert (=> b!1072532 (= lt!475509 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!475510 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1072532 (arrayContainsKey!0 _keys!1163 lt!475510 #b00000000000000000000000000000000)))

(declare-fun lt!475508 () Unit!35183)

(assert (=> b!1072532 (= lt!475508 lt!475509)))

(declare-fun res!715465 () Bool)

(declare-datatypes ((SeekEntryResult!9883 0))(
  ( (MissingZero!9883 (index!41903 (_ BitVec 32))) (Found!9883 (index!41904 (_ BitVec 32))) (Intermediate!9883 (undefined!10695 Bool) (index!41905 (_ BitVec 32)) (x!96114 (_ BitVec 32))) (Undefined!9883) (MissingVacant!9883 (index!41906 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68690 (_ BitVec 32)) SeekEntryResult!9883)

(assert (=> b!1072532 (= res!715465 (= (seekEntryOrOpen!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9883 #b00000000000000000000000000000000)))))

(assert (=> b!1072532 (=> (not res!715465) (not e!612646))))

(declare-fun b!1072533 () Bool)

(declare-fun e!612647 () Bool)

(assert (=> b!1072533 (= e!612647 e!612645)))

(declare-fun c!107662 () Bool)

(assert (=> b!1072533 (= c!107662 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129207 () Bool)

(declare-fun res!715464 () Bool)

(assert (=> d!129207 (=> res!715464 e!612647)))

(assert (=> d!129207 (= res!715464 (bvsge #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (=> d!129207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!612647)))

(declare-fun b!1072534 () Bool)

(declare-fun call!45222 () Bool)

(assert (=> b!1072534 (= e!612646 call!45222)))

(declare-fun b!1072535 () Bool)

(assert (=> b!1072535 (= e!612645 call!45222)))

(declare-fun bm!45219 () Bool)

(assert (=> bm!45219 (= call!45222 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129207 (not res!715464)) b!1072533))

(assert (= (and b!1072533 c!107662) b!1072532))

(assert (= (and b!1072533 (not c!107662)) b!1072535))

(assert (= (and b!1072532 res!715465) b!1072534))

(assert (= (or b!1072534 b!1072535) bm!45219))

(assert (=> b!1072532 m!991107))

(declare-fun m!991115 () Bool)

(assert (=> b!1072532 m!991115))

(declare-fun m!991117 () Bool)

(assert (=> b!1072532 m!991117))

(assert (=> b!1072532 m!991107))

(declare-fun m!991119 () Bool)

(assert (=> b!1072532 m!991119))

(assert (=> b!1072533 m!991107))

(assert (=> b!1072533 m!991107))

(assert (=> b!1072533 m!991109))

(declare-fun m!991121 () Bool)

(assert (=> bm!45219 m!991121))

(assert (=> b!1072443 d!129207))

(declare-fun d!129209 () Bool)

(assert (=> d!129209 (= (+!3236 (+!3236 lt!475428 (tuple2!16609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (+!3236 (+!3236 lt!475428 (tuple2!16609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (tuple2!16609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun lt!475513 () Unit!35183)

(declare-fun choose!1751 (ListLongMap!14577 (_ BitVec 64) V!39657 (_ BitVec 64) V!39657) Unit!35183)

(assert (=> d!129209 (= lt!475513 (choose!1751 lt!475428 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> d!129209 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129209 (= (addCommutativeForDiffKeys!748 lt!475428 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907) lt!475513)))

(declare-fun bs!31578 () Bool)

(assert (= bs!31578 d!129209))

(declare-fun m!991123 () Bool)

(assert (=> bs!31578 m!991123))

(assert (=> bs!31578 m!991123))

(declare-fun m!991125 () Bool)

(assert (=> bs!31578 m!991125))

(declare-fun m!991127 () Bool)

(assert (=> bs!31578 m!991127))

(declare-fun m!991129 () Bool)

(assert (=> bs!31578 m!991129))

(assert (=> bs!31578 m!991127))

(declare-fun m!991131 () Bool)

(assert (=> bs!31578 m!991131))

(assert (=> b!1072448 d!129209))

(declare-fun d!129211 () Bool)

(assert (=> d!129211 (= (-!690 (+!3236 lt!475423 (tuple2!16609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!475423)))

(declare-fun lt!475516 () Unit!35183)

(declare-fun choose!1752 (ListLongMap!14577 (_ BitVec 64) V!39657) Unit!35183)

(assert (=> d!129211 (= lt!475516 (choose!1752 lt!475423 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun contains!6294 (ListLongMap!14577 (_ BitVec 64)) Bool)

(assert (=> d!129211 (not (contains!6294 lt!475423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129211 (= (addThenRemoveForNewKeyIsSame!71 lt!475423 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!475516)))

(declare-fun bs!31579 () Bool)

(assert (= bs!31579 d!129211))

(declare-fun m!991133 () Bool)

(assert (=> bs!31579 m!991133))

(assert (=> bs!31579 m!991133))

(declare-fun m!991135 () Bool)

(assert (=> bs!31579 m!991135))

(declare-fun m!991137 () Bool)

(assert (=> bs!31579 m!991137))

(declare-fun m!991139 () Bool)

(assert (=> bs!31579 m!991139))

(assert (=> b!1072448 d!129211))

(declare-fun b!1072578 () Bool)

(declare-fun res!715488 () Bool)

(declare-fun e!612681 () Bool)

(assert (=> b!1072578 (=> (not res!715488) (not e!612681))))

(declare-fun e!612674 () Bool)

(assert (=> b!1072578 (= res!715488 e!612674)))

(declare-fun c!107676 () Bool)

(assert (=> b!1072578 (= c!107676 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!129213 () Bool)

(assert (=> d!129213 e!612681))

(declare-fun res!715485 () Bool)

(assert (=> d!129213 (=> (not res!715485) (not e!612681))))

(assert (=> d!129213 (= res!715485 (or (bvsge #b00000000000000000000000000000000 (size!33578 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))))

(declare-fun lt!475572 () ListLongMap!14577)

(declare-fun lt!475573 () ListLongMap!14577)

(assert (=> d!129213 (= lt!475572 lt!475573)))

(declare-fun lt!475568 () Unit!35183)

(declare-fun e!612685 () Unit!35183)

(assert (=> d!129213 (= lt!475568 e!612685)))

(declare-fun c!107677 () Bool)

(declare-fun e!612680 () Bool)

(assert (=> d!129213 (= c!107677 e!612680)))

(declare-fun res!715490 () Bool)

(assert (=> d!129213 (=> (not res!715490) (not e!612680))))

(assert (=> d!129213 (= res!715490 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun e!612682 () ListLongMap!14577)

(assert (=> d!129213 (= lt!475573 e!612682)))

(declare-fun c!107675 () Bool)

(assert (=> d!129213 (= c!107675 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129213 (validMask!0 mask!1515)))

(assert (=> d!129213 (= (getCurrentListMap!4103 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475572)))

(declare-fun b!1072579 () Bool)

(declare-fun e!612683 () ListLongMap!14577)

(assert (=> b!1072579 (= e!612682 e!612683)))

(declare-fun c!107678 () Bool)

(assert (=> b!1072579 (= c!107678 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1072580 () Bool)

(declare-fun e!612686 () ListLongMap!14577)

(declare-fun call!45237 () ListLongMap!14577)

(assert (=> b!1072580 (= e!612686 call!45237)))

(declare-fun b!1072581 () Bool)

(declare-fun call!45239 () Bool)

(assert (=> b!1072581 (= e!612674 (not call!45239))))

(declare-fun b!1072582 () Bool)

(declare-fun e!612677 () Bool)

(declare-fun e!612676 () Bool)

(assert (=> b!1072582 (= e!612677 e!612676)))

(declare-fun res!715484 () Bool)

(declare-fun call!45243 () Bool)

(assert (=> b!1072582 (= res!715484 call!45243)))

(assert (=> b!1072582 (=> (not res!715484) (not e!612676))))

(declare-fun bm!45234 () Bool)

(declare-fun call!45241 () ListLongMap!14577)

(declare-fun call!45238 () ListLongMap!14577)

(assert (=> bm!45234 (= call!45241 call!45238)))

(declare-fun b!1072583 () Bool)

(declare-fun c!107680 () Bool)

(assert (=> b!1072583 (= c!107680 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072583 (= e!612683 e!612686)))

(declare-fun b!1072584 () Bool)

(assert (=> b!1072584 (= e!612683 call!45241)))

(declare-fun b!1072585 () Bool)

(declare-fun e!612675 () Bool)

(declare-fun apply!924 (ListLongMap!14577 (_ BitVec 64)) V!39657)

(assert (=> b!1072585 (= e!612675 (= (apply!924 lt!475572 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1072586 () Bool)

(assert (=> b!1072586 (= e!612682 (+!3236 call!45238 (tuple2!16609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1072587 () Bool)

(declare-fun e!612678 () Bool)

(assert (=> b!1072587 (= e!612678 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072588 () Bool)

(assert (=> b!1072588 (= e!612674 e!612675)))

(declare-fun res!715487 () Bool)

(assert (=> b!1072588 (= res!715487 call!45239)))

(assert (=> b!1072588 (=> (not res!715487) (not e!612675))))

(declare-fun b!1072589 () Bool)

(assert (=> b!1072589 (= e!612681 e!612677)))

(declare-fun c!107679 () Bool)

(assert (=> b!1072589 (= c!107679 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45235 () Bool)

(declare-fun call!45240 () ListLongMap!14577)

(assert (=> bm!45235 (= call!45240 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072590 () Bool)

(assert (=> b!1072590 (= e!612680 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072591 () Bool)

(declare-fun res!715492 () Bool)

(assert (=> b!1072591 (=> (not res!715492) (not e!612681))))

(declare-fun e!612679 () Bool)

(assert (=> b!1072591 (= res!715492 e!612679)))

(declare-fun res!715486 () Bool)

(assert (=> b!1072591 (=> res!715486 e!612679)))

(assert (=> b!1072591 (= res!715486 (not e!612678))))

(declare-fun res!715491 () Bool)

(assert (=> b!1072591 (=> (not res!715491) (not e!612678))))

(assert (=> b!1072591 (= res!715491 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun b!1072592 () Bool)

(assert (=> b!1072592 (= e!612677 (not call!45243))))

(declare-fun bm!45236 () Bool)

(declare-fun call!45242 () ListLongMap!14577)

(assert (=> bm!45236 (= call!45242 call!45240)))

(declare-fun bm!45237 () Bool)

(assert (=> bm!45237 (= call!45238 (+!3236 (ite c!107675 call!45240 (ite c!107678 call!45242 call!45237)) (ite (or c!107675 c!107678) (tuple2!16609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1072593 () Bool)

(declare-fun lt!475565 () Unit!35183)

(assert (=> b!1072593 (= e!612685 lt!475565)))

(declare-fun lt!475567 () ListLongMap!14577)

(assert (=> b!1072593 (= lt!475567 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475581 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475566 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475566 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475561 () Unit!35183)

(declare-fun addStillContains!638 (ListLongMap!14577 (_ BitVec 64) V!39657 (_ BitVec 64)) Unit!35183)

(assert (=> b!1072593 (= lt!475561 (addStillContains!638 lt!475567 lt!475581 zeroValueAfter!47 lt!475566))))

(assert (=> b!1072593 (contains!6294 (+!3236 lt!475567 (tuple2!16609 lt!475581 zeroValueAfter!47)) lt!475566)))

(declare-fun lt!475580 () Unit!35183)

(assert (=> b!1072593 (= lt!475580 lt!475561)))

(declare-fun lt!475577 () ListLongMap!14577)

(assert (=> b!1072593 (= lt!475577 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475582 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475582 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475575 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475575 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475563 () Unit!35183)

(declare-fun addApplyDifferent!494 (ListLongMap!14577 (_ BitVec 64) V!39657 (_ BitVec 64)) Unit!35183)

(assert (=> b!1072593 (= lt!475563 (addApplyDifferent!494 lt!475577 lt!475582 minValue!907 lt!475575))))

(assert (=> b!1072593 (= (apply!924 (+!3236 lt!475577 (tuple2!16609 lt!475582 minValue!907)) lt!475575) (apply!924 lt!475577 lt!475575))))

(declare-fun lt!475571 () Unit!35183)

(assert (=> b!1072593 (= lt!475571 lt!475563)))

(declare-fun lt!475576 () ListLongMap!14577)

(assert (=> b!1072593 (= lt!475576 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475570 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475562 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475562 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475564 () Unit!35183)

(assert (=> b!1072593 (= lt!475564 (addApplyDifferent!494 lt!475576 lt!475570 zeroValueAfter!47 lt!475562))))

(assert (=> b!1072593 (= (apply!924 (+!3236 lt!475576 (tuple2!16609 lt!475570 zeroValueAfter!47)) lt!475562) (apply!924 lt!475576 lt!475562))))

(declare-fun lt!475579 () Unit!35183)

(assert (=> b!1072593 (= lt!475579 lt!475564)))

(declare-fun lt!475569 () ListLongMap!14577)

(assert (=> b!1072593 (= lt!475569 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475574 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475574 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475578 () (_ BitVec 64))

(assert (=> b!1072593 (= lt!475578 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1072593 (= lt!475565 (addApplyDifferent!494 lt!475569 lt!475574 minValue!907 lt!475578))))

(assert (=> b!1072593 (= (apply!924 (+!3236 lt!475569 (tuple2!16609 lt!475574 minValue!907)) lt!475578) (apply!924 lt!475569 lt!475578))))

(declare-fun bm!45238 () Bool)

(assert (=> bm!45238 (= call!45243 (contains!6294 lt!475572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072594 () Bool)

(declare-fun Unit!35187 () Unit!35183)

(assert (=> b!1072594 (= e!612685 Unit!35187)))

(declare-fun b!1072595 () Bool)

(assert (=> b!1072595 (= e!612686 call!45241)))

(declare-fun e!612684 () Bool)

(declare-fun b!1072596 () Bool)

(declare-fun get!17182 (ValueCell!12242 V!39657) V!39657)

(declare-fun dynLambda!2023 (Int (_ BitVec 64)) V!39657)

(assert (=> b!1072596 (= e!612684 (= (apply!924 lt!475572 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)) (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1072596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33577 _values!955)))))

(assert (=> b!1072596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun bm!45239 () Bool)

(assert (=> bm!45239 (= call!45237 call!45242)))

(declare-fun b!1072597 () Bool)

(assert (=> b!1072597 (= e!612676 (= (apply!924 lt!475572 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45240 () Bool)

(assert (=> bm!45240 (= call!45239 (contains!6294 lt!475572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072598 () Bool)

(assert (=> b!1072598 (= e!612679 e!612684)))

(declare-fun res!715489 () Bool)

(assert (=> b!1072598 (=> (not res!715489) (not e!612684))))

(assert (=> b!1072598 (= res!715489 (contains!6294 lt!475572 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072598 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (= (and d!129213 c!107675) b!1072586))

(assert (= (and d!129213 (not c!107675)) b!1072579))

(assert (= (and b!1072579 c!107678) b!1072584))

(assert (= (and b!1072579 (not c!107678)) b!1072583))

(assert (= (and b!1072583 c!107680) b!1072595))

(assert (= (and b!1072583 (not c!107680)) b!1072580))

(assert (= (or b!1072595 b!1072580) bm!45239))

(assert (= (or b!1072584 bm!45239) bm!45236))

(assert (= (or b!1072584 b!1072595) bm!45234))

(assert (= (or b!1072586 bm!45236) bm!45235))

(assert (= (or b!1072586 bm!45234) bm!45237))

(assert (= (and d!129213 res!715490) b!1072590))

(assert (= (and d!129213 c!107677) b!1072593))

(assert (= (and d!129213 (not c!107677)) b!1072594))

(assert (= (and d!129213 res!715485) b!1072591))

(assert (= (and b!1072591 res!715491) b!1072587))

(assert (= (and b!1072591 (not res!715486)) b!1072598))

(assert (= (and b!1072598 res!715489) b!1072596))

(assert (= (and b!1072591 res!715492) b!1072578))

(assert (= (and b!1072578 c!107676) b!1072588))

(assert (= (and b!1072578 (not c!107676)) b!1072581))

(assert (= (and b!1072588 res!715487) b!1072585))

(assert (= (or b!1072588 b!1072581) bm!45240))

(assert (= (and b!1072578 res!715488) b!1072589))

(assert (= (and b!1072589 c!107679) b!1072582))

(assert (= (and b!1072589 (not c!107679)) b!1072592))

(assert (= (and b!1072582 res!715484) b!1072597))

(assert (= (or b!1072582 b!1072592) bm!45238))

(declare-fun b_lambda!16679 () Bool)

(assert (=> (not b_lambda!16679) (not b!1072596)))

(declare-fun t!32462 () Bool)

(declare-fun tb!7149 () Bool)

(assert (=> (and start!94846 (= defaultEntry!963 defaultEntry!963) t!32462) tb!7149))

(declare-fun result!14771 () Bool)

(assert (=> tb!7149 (= result!14771 tp_is_empty!25891)))

(assert (=> b!1072596 t!32462))

(declare-fun b_and!34903 () Bool)

(assert (= b_and!34897 (and (=> t!32462 result!14771) b_and!34903)))

(assert (=> b!1072590 m!991107))

(assert (=> b!1072590 m!991107))

(assert (=> b!1072590 m!991109))

(assert (=> d!129213 m!991017))

(assert (=> bm!45235 m!991011))

(declare-fun m!991141 () Bool)

(assert (=> bm!45238 m!991141))

(assert (=> b!1072587 m!991107))

(assert (=> b!1072587 m!991107))

(assert (=> b!1072587 m!991109))

(declare-fun m!991143 () Bool)

(assert (=> b!1072596 m!991143))

(declare-fun m!991145 () Bool)

(assert (=> b!1072596 m!991145))

(assert (=> b!1072596 m!991107))

(assert (=> b!1072596 m!991145))

(assert (=> b!1072596 m!991143))

(declare-fun m!991147 () Bool)

(assert (=> b!1072596 m!991147))

(assert (=> b!1072596 m!991107))

(declare-fun m!991149 () Bool)

(assert (=> b!1072596 m!991149))

(declare-fun m!991151 () Bool)

(assert (=> b!1072597 m!991151))

(declare-fun m!991153 () Bool)

(assert (=> b!1072593 m!991153))

(declare-fun m!991155 () Bool)

(assert (=> b!1072593 m!991155))

(declare-fun m!991157 () Bool)

(assert (=> b!1072593 m!991157))

(declare-fun m!991159 () Bool)

(assert (=> b!1072593 m!991159))

(declare-fun m!991161 () Bool)

(assert (=> b!1072593 m!991161))

(declare-fun m!991163 () Bool)

(assert (=> b!1072593 m!991163))

(declare-fun m!991165 () Bool)

(assert (=> b!1072593 m!991165))

(declare-fun m!991167 () Bool)

(assert (=> b!1072593 m!991167))

(declare-fun m!991169 () Bool)

(assert (=> b!1072593 m!991169))

(assert (=> b!1072593 m!991107))

(assert (=> b!1072593 m!991157))

(declare-fun m!991171 () Bool)

(assert (=> b!1072593 m!991171))

(assert (=> b!1072593 m!991159))

(assert (=> b!1072593 m!991011))

(declare-fun m!991173 () Bool)

(assert (=> b!1072593 m!991173))

(declare-fun m!991175 () Bool)

(assert (=> b!1072593 m!991175))

(declare-fun m!991177 () Bool)

(assert (=> b!1072593 m!991177))

(declare-fun m!991179 () Bool)

(assert (=> b!1072593 m!991179))

(declare-fun m!991181 () Bool)

(assert (=> b!1072593 m!991181))

(assert (=> b!1072593 m!991153))

(assert (=> b!1072593 m!991173))

(declare-fun m!991183 () Bool)

(assert (=> bm!45240 m!991183))

(declare-fun m!991185 () Bool)

(assert (=> bm!45237 m!991185))

(declare-fun m!991187 () Bool)

(assert (=> b!1072585 m!991187))

(assert (=> b!1072598 m!991107))

(assert (=> b!1072598 m!991107))

(declare-fun m!991189 () Bool)

(assert (=> b!1072598 m!991189))

(declare-fun m!991191 () Bool)

(assert (=> b!1072586 m!991191))

(assert (=> b!1072448 d!129213))

(declare-fun d!129215 () Bool)

(declare-fun lt!475585 () ListLongMap!14577)

(assert (=> d!129215 (not (contains!6294 lt!475585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!74 (List!23131 (_ BitVec 64)) List!23131)

(assert (=> d!129215 (= lt!475585 (ListLongMap!14578 (removeStrictlySorted!74 (toList!7304 lt!475422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129215 (= (-!690 lt!475422 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475585)))

(declare-fun bs!31580 () Bool)

(assert (= bs!31580 d!129215))

(declare-fun m!991193 () Bool)

(assert (=> bs!31580 m!991193))

(declare-fun m!991195 () Bool)

(assert (=> bs!31580 m!991195))

(assert (=> b!1072448 d!129215))

(declare-fun d!129217 () Bool)

(declare-fun e!612689 () Bool)

(assert (=> d!129217 e!612689))

(declare-fun res!715497 () Bool)

(assert (=> d!129217 (=> (not res!715497) (not e!612689))))

(declare-fun lt!475594 () ListLongMap!14577)

(assert (=> d!129217 (= res!715497 (contains!6294 lt!475594 (_1!8315 lt!475426)))))

(declare-fun lt!475595 () List!23131)

(assert (=> d!129217 (= lt!475594 (ListLongMap!14578 lt!475595))))

(declare-fun lt!475596 () Unit!35183)

(declare-fun lt!475597 () Unit!35183)

(assert (=> d!129217 (= lt!475596 lt!475597)))

(declare-datatypes ((Option!657 0))(
  ( (Some!656 (v!15615 V!39657)) (None!655) )
))
(declare-fun getValueByKey!606 (List!23131 (_ BitVec 64)) Option!657)

(assert (=> d!129217 (= (getValueByKey!606 lt!475595 (_1!8315 lt!475426)) (Some!656 (_2!8315 lt!475426)))))

(declare-fun lemmaContainsTupThenGetReturnValue!286 (List!23131 (_ BitVec 64) V!39657) Unit!35183)

(assert (=> d!129217 (= lt!475597 (lemmaContainsTupThenGetReturnValue!286 lt!475595 (_1!8315 lt!475426) (_2!8315 lt!475426)))))

(declare-fun insertStrictlySorted!379 (List!23131 (_ BitVec 64) V!39657) List!23131)

(assert (=> d!129217 (= lt!475595 (insertStrictlySorted!379 (toList!7304 (+!3236 lt!475428 lt!475421)) (_1!8315 lt!475426) (_2!8315 lt!475426)))))

(assert (=> d!129217 (= (+!3236 (+!3236 lt!475428 lt!475421) lt!475426) lt!475594)))

(declare-fun b!1072605 () Bool)

(declare-fun res!715498 () Bool)

(assert (=> b!1072605 (=> (not res!715498) (not e!612689))))

(assert (=> b!1072605 (= res!715498 (= (getValueByKey!606 (toList!7304 lt!475594) (_1!8315 lt!475426)) (Some!656 (_2!8315 lt!475426))))))

(declare-fun b!1072606 () Bool)

(declare-fun contains!6295 (List!23131 tuple2!16608) Bool)

(assert (=> b!1072606 (= e!612689 (contains!6295 (toList!7304 lt!475594) lt!475426))))

(assert (= (and d!129217 res!715497) b!1072605))

(assert (= (and b!1072605 res!715498) b!1072606))

(declare-fun m!991197 () Bool)

(assert (=> d!129217 m!991197))

(declare-fun m!991199 () Bool)

(assert (=> d!129217 m!991199))

(declare-fun m!991201 () Bool)

(assert (=> d!129217 m!991201))

(declare-fun m!991203 () Bool)

(assert (=> d!129217 m!991203))

(declare-fun m!991205 () Bool)

(assert (=> b!1072605 m!991205))

(declare-fun m!991207 () Bool)

(assert (=> b!1072606 m!991207))

(assert (=> b!1072448 d!129217))

(declare-fun d!129219 () Bool)

(declare-fun lt!475598 () ListLongMap!14577)

(assert (=> d!129219 (not (contains!6294 lt!475598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129219 (= lt!475598 (ListLongMap!14578 (removeStrictlySorted!74 (toList!7304 lt!475429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129219 (= (-!690 lt!475429 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475598)))

(declare-fun bs!31581 () Bool)

(assert (= bs!31581 d!129219))

(declare-fun m!991209 () Bool)

(assert (=> bs!31581 m!991209))

(declare-fun m!991211 () Bool)

(assert (=> bs!31581 m!991211))

(assert (=> b!1072448 d!129219))

(declare-fun d!129221 () Bool)

(declare-fun e!612690 () Bool)

(assert (=> d!129221 e!612690))

(declare-fun res!715499 () Bool)

(assert (=> d!129221 (=> (not res!715499) (not e!612690))))

(declare-fun lt!475599 () ListLongMap!14577)

(assert (=> d!129221 (= res!715499 (contains!6294 lt!475599 (_1!8315 lt!475421)))))

(declare-fun lt!475600 () List!23131)

(assert (=> d!129221 (= lt!475599 (ListLongMap!14578 lt!475600))))

(declare-fun lt!475601 () Unit!35183)

(declare-fun lt!475602 () Unit!35183)

(assert (=> d!129221 (= lt!475601 lt!475602)))

(assert (=> d!129221 (= (getValueByKey!606 lt!475600 (_1!8315 lt!475421)) (Some!656 (_2!8315 lt!475421)))))

(assert (=> d!129221 (= lt!475602 (lemmaContainsTupThenGetReturnValue!286 lt!475600 (_1!8315 lt!475421) (_2!8315 lt!475421)))))

(assert (=> d!129221 (= lt!475600 (insertStrictlySorted!379 (toList!7304 lt!475423) (_1!8315 lt!475421) (_2!8315 lt!475421)))))

(assert (=> d!129221 (= (+!3236 lt!475423 lt!475421) lt!475599)))

(declare-fun b!1072607 () Bool)

(declare-fun res!715500 () Bool)

(assert (=> b!1072607 (=> (not res!715500) (not e!612690))))

(assert (=> b!1072607 (= res!715500 (= (getValueByKey!606 (toList!7304 lt!475599) (_1!8315 lt!475421)) (Some!656 (_2!8315 lt!475421))))))

(declare-fun b!1072608 () Bool)

(assert (=> b!1072608 (= e!612690 (contains!6295 (toList!7304 lt!475599) lt!475421))))

(assert (= (and d!129221 res!715499) b!1072607))

(assert (= (and b!1072607 res!715500) b!1072608))

(declare-fun m!991213 () Bool)

(assert (=> d!129221 m!991213))

(declare-fun m!991215 () Bool)

(assert (=> d!129221 m!991215))

(declare-fun m!991217 () Bool)

(assert (=> d!129221 m!991217))

(declare-fun m!991219 () Bool)

(assert (=> d!129221 m!991219))

(declare-fun m!991221 () Bool)

(assert (=> b!1072607 m!991221))

(declare-fun m!991223 () Bool)

(assert (=> b!1072608 m!991223))

(assert (=> b!1072448 d!129221))

(declare-fun d!129223 () Bool)

(declare-fun e!612691 () Bool)

(assert (=> d!129223 e!612691))

(declare-fun res!715501 () Bool)

(assert (=> d!129223 (=> (not res!715501) (not e!612691))))

(declare-fun lt!475603 () ListLongMap!14577)

(assert (=> d!129223 (= res!715501 (contains!6294 lt!475603 (_1!8315 lt!475426)))))

(declare-fun lt!475604 () List!23131)

(assert (=> d!129223 (= lt!475603 (ListLongMap!14578 lt!475604))))

(declare-fun lt!475605 () Unit!35183)

(declare-fun lt!475606 () Unit!35183)

(assert (=> d!129223 (= lt!475605 lt!475606)))

(assert (=> d!129223 (= (getValueByKey!606 lt!475604 (_1!8315 lt!475426)) (Some!656 (_2!8315 lt!475426)))))

(assert (=> d!129223 (= lt!475606 (lemmaContainsTupThenGetReturnValue!286 lt!475604 (_1!8315 lt!475426) (_2!8315 lt!475426)))))

(assert (=> d!129223 (= lt!475604 (insertStrictlySorted!379 (toList!7304 lt!475428) (_1!8315 lt!475426) (_2!8315 lt!475426)))))

(assert (=> d!129223 (= (+!3236 lt!475428 lt!475426) lt!475603)))

(declare-fun b!1072609 () Bool)

(declare-fun res!715502 () Bool)

(assert (=> b!1072609 (=> (not res!715502) (not e!612691))))

(assert (=> b!1072609 (= res!715502 (= (getValueByKey!606 (toList!7304 lt!475603) (_1!8315 lt!475426)) (Some!656 (_2!8315 lt!475426))))))

(declare-fun b!1072610 () Bool)

(assert (=> b!1072610 (= e!612691 (contains!6295 (toList!7304 lt!475603) lt!475426))))

(assert (= (and d!129223 res!715501) b!1072609))

(assert (= (and b!1072609 res!715502) b!1072610))

(declare-fun m!991225 () Bool)

(assert (=> d!129223 m!991225))

(declare-fun m!991227 () Bool)

(assert (=> d!129223 m!991227))

(declare-fun m!991229 () Bool)

(assert (=> d!129223 m!991229))

(declare-fun m!991231 () Bool)

(assert (=> d!129223 m!991231))

(declare-fun m!991233 () Bool)

(assert (=> b!1072609 m!991233))

(declare-fun m!991235 () Bool)

(assert (=> b!1072610 m!991235))

(assert (=> b!1072448 d!129223))

(declare-fun b!1072611 () Bool)

(declare-fun res!715507 () Bool)

(declare-fun e!612699 () Bool)

(assert (=> b!1072611 (=> (not res!715507) (not e!612699))))

(declare-fun e!612692 () Bool)

(assert (=> b!1072611 (= res!715507 e!612692)))

(declare-fun c!107682 () Bool)

(assert (=> b!1072611 (= c!107682 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!129225 () Bool)

(assert (=> d!129225 e!612699))

(declare-fun res!715504 () Bool)

(assert (=> d!129225 (=> (not res!715504) (not e!612699))))

(assert (=> d!129225 (= res!715504 (or (bvsge #b00000000000000000000000000000000 (size!33578 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))))

(declare-fun lt!475618 () ListLongMap!14577)

(declare-fun lt!475619 () ListLongMap!14577)

(assert (=> d!129225 (= lt!475618 lt!475619)))

(declare-fun lt!475614 () Unit!35183)

(declare-fun e!612703 () Unit!35183)

(assert (=> d!129225 (= lt!475614 e!612703)))

(declare-fun c!107683 () Bool)

(declare-fun e!612698 () Bool)

(assert (=> d!129225 (= c!107683 e!612698)))

(declare-fun res!715509 () Bool)

(assert (=> d!129225 (=> (not res!715509) (not e!612698))))

(assert (=> d!129225 (= res!715509 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun e!612700 () ListLongMap!14577)

(assert (=> d!129225 (= lt!475619 e!612700)))

(declare-fun c!107681 () Bool)

(assert (=> d!129225 (= c!107681 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129225 (validMask!0 mask!1515)))

(assert (=> d!129225 (= (getCurrentListMap!4103 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475618)))

(declare-fun b!1072612 () Bool)

(declare-fun e!612701 () ListLongMap!14577)

(assert (=> b!1072612 (= e!612700 e!612701)))

(declare-fun c!107684 () Bool)

(assert (=> b!1072612 (= c!107684 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1072613 () Bool)

(declare-fun e!612704 () ListLongMap!14577)

(declare-fun call!45244 () ListLongMap!14577)

(assert (=> b!1072613 (= e!612704 call!45244)))

(declare-fun b!1072614 () Bool)

(declare-fun call!45246 () Bool)

(assert (=> b!1072614 (= e!612692 (not call!45246))))

(declare-fun b!1072615 () Bool)

(declare-fun e!612695 () Bool)

(declare-fun e!612694 () Bool)

(assert (=> b!1072615 (= e!612695 e!612694)))

(declare-fun res!715503 () Bool)

(declare-fun call!45250 () Bool)

(assert (=> b!1072615 (= res!715503 call!45250)))

(assert (=> b!1072615 (=> (not res!715503) (not e!612694))))

(declare-fun bm!45241 () Bool)

(declare-fun call!45248 () ListLongMap!14577)

(declare-fun call!45245 () ListLongMap!14577)

(assert (=> bm!45241 (= call!45248 call!45245)))

(declare-fun b!1072616 () Bool)

(declare-fun c!107686 () Bool)

(assert (=> b!1072616 (= c!107686 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072616 (= e!612701 e!612704)))

(declare-fun b!1072617 () Bool)

(assert (=> b!1072617 (= e!612701 call!45248)))

(declare-fun b!1072618 () Bool)

(declare-fun e!612693 () Bool)

(assert (=> b!1072618 (= e!612693 (= (apply!924 lt!475618 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1072619 () Bool)

(assert (=> b!1072619 (= e!612700 (+!3236 call!45245 (tuple2!16609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1072620 () Bool)

(declare-fun e!612696 () Bool)

(assert (=> b!1072620 (= e!612696 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072621 () Bool)

(assert (=> b!1072621 (= e!612692 e!612693)))

(declare-fun res!715506 () Bool)

(assert (=> b!1072621 (= res!715506 call!45246)))

(assert (=> b!1072621 (=> (not res!715506) (not e!612693))))

(declare-fun b!1072622 () Bool)

(assert (=> b!1072622 (= e!612699 e!612695)))

(declare-fun c!107685 () Bool)

(assert (=> b!1072622 (= c!107685 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45242 () Bool)

(declare-fun call!45247 () ListLongMap!14577)

(assert (=> bm!45242 (= call!45247 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072623 () Bool)

(assert (=> b!1072623 (= e!612698 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072624 () Bool)

(declare-fun res!715511 () Bool)

(assert (=> b!1072624 (=> (not res!715511) (not e!612699))))

(declare-fun e!612697 () Bool)

(assert (=> b!1072624 (= res!715511 e!612697)))

(declare-fun res!715505 () Bool)

(assert (=> b!1072624 (=> res!715505 e!612697)))

(assert (=> b!1072624 (= res!715505 (not e!612696))))

(declare-fun res!715510 () Bool)

(assert (=> b!1072624 (=> (not res!715510) (not e!612696))))

(assert (=> b!1072624 (= res!715510 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun b!1072625 () Bool)

(assert (=> b!1072625 (= e!612695 (not call!45250))))

(declare-fun bm!45243 () Bool)

(declare-fun call!45249 () ListLongMap!14577)

(assert (=> bm!45243 (= call!45249 call!45247)))

(declare-fun bm!45244 () Bool)

(assert (=> bm!45244 (= call!45245 (+!3236 (ite c!107681 call!45247 (ite c!107684 call!45249 call!45244)) (ite (or c!107681 c!107684) (tuple2!16609 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1072626 () Bool)

(declare-fun lt!475611 () Unit!35183)

(assert (=> b!1072626 (= e!612703 lt!475611)))

(declare-fun lt!475613 () ListLongMap!14577)

(assert (=> b!1072626 (= lt!475613 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475627 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475627 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475612 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475612 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475607 () Unit!35183)

(assert (=> b!1072626 (= lt!475607 (addStillContains!638 lt!475613 lt!475627 zeroValueBefore!47 lt!475612))))

(assert (=> b!1072626 (contains!6294 (+!3236 lt!475613 (tuple2!16609 lt!475627 zeroValueBefore!47)) lt!475612)))

(declare-fun lt!475626 () Unit!35183)

(assert (=> b!1072626 (= lt!475626 lt!475607)))

(declare-fun lt!475623 () ListLongMap!14577)

(assert (=> b!1072626 (= lt!475623 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475628 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475628 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475621 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475621 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475609 () Unit!35183)

(assert (=> b!1072626 (= lt!475609 (addApplyDifferent!494 lt!475623 lt!475628 minValue!907 lt!475621))))

(assert (=> b!1072626 (= (apply!924 (+!3236 lt!475623 (tuple2!16609 lt!475628 minValue!907)) lt!475621) (apply!924 lt!475623 lt!475621))))

(declare-fun lt!475617 () Unit!35183)

(assert (=> b!1072626 (= lt!475617 lt!475609)))

(declare-fun lt!475622 () ListLongMap!14577)

(assert (=> b!1072626 (= lt!475622 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475616 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475608 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475608 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475610 () Unit!35183)

(assert (=> b!1072626 (= lt!475610 (addApplyDifferent!494 lt!475622 lt!475616 zeroValueBefore!47 lt!475608))))

(assert (=> b!1072626 (= (apply!924 (+!3236 lt!475622 (tuple2!16609 lt!475616 zeroValueBefore!47)) lt!475608) (apply!924 lt!475622 lt!475608))))

(declare-fun lt!475625 () Unit!35183)

(assert (=> b!1072626 (= lt!475625 lt!475610)))

(declare-fun lt!475615 () ListLongMap!14577)

(assert (=> b!1072626 (= lt!475615 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475620 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475620 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475624 () (_ BitVec 64))

(assert (=> b!1072626 (= lt!475624 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1072626 (= lt!475611 (addApplyDifferent!494 lt!475615 lt!475620 minValue!907 lt!475624))))

(assert (=> b!1072626 (= (apply!924 (+!3236 lt!475615 (tuple2!16609 lt!475620 minValue!907)) lt!475624) (apply!924 lt!475615 lt!475624))))

(declare-fun bm!45245 () Bool)

(assert (=> bm!45245 (= call!45250 (contains!6294 lt!475618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072627 () Bool)

(declare-fun Unit!35188 () Unit!35183)

(assert (=> b!1072627 (= e!612703 Unit!35188)))

(declare-fun b!1072628 () Bool)

(assert (=> b!1072628 (= e!612704 call!45248)))

(declare-fun e!612702 () Bool)

(declare-fun b!1072629 () Bool)

(assert (=> b!1072629 (= e!612702 (= (apply!924 lt!475618 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)) (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1072629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33577 _values!955)))))

(assert (=> b!1072629 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun bm!45246 () Bool)

(assert (=> bm!45246 (= call!45244 call!45249)))

(declare-fun b!1072630 () Bool)

(assert (=> b!1072630 (= e!612694 (= (apply!924 lt!475618 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45247 () Bool)

(assert (=> bm!45247 (= call!45246 (contains!6294 lt!475618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072631 () Bool)

(assert (=> b!1072631 (= e!612697 e!612702)))

(declare-fun res!715508 () Bool)

(assert (=> b!1072631 (=> (not res!715508) (not e!612702))))

(assert (=> b!1072631 (= res!715508 (contains!6294 lt!475618 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (= (and d!129225 c!107681) b!1072619))

(assert (= (and d!129225 (not c!107681)) b!1072612))

(assert (= (and b!1072612 c!107684) b!1072617))

(assert (= (and b!1072612 (not c!107684)) b!1072616))

(assert (= (and b!1072616 c!107686) b!1072628))

(assert (= (and b!1072616 (not c!107686)) b!1072613))

(assert (= (or b!1072628 b!1072613) bm!45246))

(assert (= (or b!1072617 bm!45246) bm!45243))

(assert (= (or b!1072617 b!1072628) bm!45241))

(assert (= (or b!1072619 bm!45243) bm!45242))

(assert (= (or b!1072619 bm!45241) bm!45244))

(assert (= (and d!129225 res!715509) b!1072623))

(assert (= (and d!129225 c!107683) b!1072626))

(assert (= (and d!129225 (not c!107683)) b!1072627))

(assert (= (and d!129225 res!715504) b!1072624))

(assert (= (and b!1072624 res!715510) b!1072620))

(assert (= (and b!1072624 (not res!715505)) b!1072631))

(assert (= (and b!1072631 res!715508) b!1072629))

(assert (= (and b!1072624 res!715511) b!1072611))

(assert (= (and b!1072611 c!107682) b!1072621))

(assert (= (and b!1072611 (not c!107682)) b!1072614))

(assert (= (and b!1072621 res!715506) b!1072618))

(assert (= (or b!1072621 b!1072614) bm!45247))

(assert (= (and b!1072611 res!715507) b!1072622))

(assert (= (and b!1072622 c!107685) b!1072615))

(assert (= (and b!1072622 (not c!107685)) b!1072625))

(assert (= (and b!1072615 res!715503) b!1072630))

(assert (= (or b!1072615 b!1072625) bm!45245))

(declare-fun b_lambda!16681 () Bool)

(assert (=> (not b_lambda!16681) (not b!1072629)))

(assert (=> b!1072629 t!32462))

(declare-fun b_and!34905 () Bool)

(assert (= b_and!34903 (and (=> t!32462 result!14771) b_and!34905)))

(assert (=> b!1072623 m!991107))

(assert (=> b!1072623 m!991107))

(assert (=> b!1072623 m!991109))

(assert (=> d!129225 m!991017))

(assert (=> bm!45242 m!991013))

(declare-fun m!991237 () Bool)

(assert (=> bm!45245 m!991237))

(assert (=> b!1072620 m!991107))

(assert (=> b!1072620 m!991107))

(assert (=> b!1072620 m!991109))

(assert (=> b!1072629 m!991143))

(assert (=> b!1072629 m!991145))

(assert (=> b!1072629 m!991107))

(assert (=> b!1072629 m!991145))

(assert (=> b!1072629 m!991143))

(assert (=> b!1072629 m!991147))

(assert (=> b!1072629 m!991107))

(declare-fun m!991239 () Bool)

(assert (=> b!1072629 m!991239))

(declare-fun m!991241 () Bool)

(assert (=> b!1072630 m!991241))

(declare-fun m!991243 () Bool)

(assert (=> b!1072626 m!991243))

(declare-fun m!991245 () Bool)

(assert (=> b!1072626 m!991245))

(declare-fun m!991247 () Bool)

(assert (=> b!1072626 m!991247))

(declare-fun m!991249 () Bool)

(assert (=> b!1072626 m!991249))

(declare-fun m!991251 () Bool)

(assert (=> b!1072626 m!991251))

(declare-fun m!991253 () Bool)

(assert (=> b!1072626 m!991253))

(declare-fun m!991255 () Bool)

(assert (=> b!1072626 m!991255))

(declare-fun m!991257 () Bool)

(assert (=> b!1072626 m!991257))

(declare-fun m!991259 () Bool)

(assert (=> b!1072626 m!991259))

(assert (=> b!1072626 m!991107))

(assert (=> b!1072626 m!991247))

(declare-fun m!991261 () Bool)

(assert (=> b!1072626 m!991261))

(assert (=> b!1072626 m!991249))

(assert (=> b!1072626 m!991013))

(declare-fun m!991263 () Bool)

(assert (=> b!1072626 m!991263))

(declare-fun m!991265 () Bool)

(assert (=> b!1072626 m!991265))

(declare-fun m!991267 () Bool)

(assert (=> b!1072626 m!991267))

(declare-fun m!991269 () Bool)

(assert (=> b!1072626 m!991269))

(declare-fun m!991271 () Bool)

(assert (=> b!1072626 m!991271))

(assert (=> b!1072626 m!991243))

(assert (=> b!1072626 m!991263))

(declare-fun m!991273 () Bool)

(assert (=> bm!45247 m!991273))

(declare-fun m!991275 () Bool)

(assert (=> bm!45244 m!991275))

(declare-fun m!991277 () Bool)

(assert (=> b!1072618 m!991277))

(assert (=> b!1072631 m!991107))

(assert (=> b!1072631 m!991107))

(declare-fun m!991279 () Bool)

(assert (=> b!1072631 m!991279))

(declare-fun m!991281 () Bool)

(assert (=> b!1072619 m!991281))

(assert (=> b!1072448 d!129225))

(declare-fun d!129227 () Bool)

(declare-fun e!612705 () Bool)

(assert (=> d!129227 e!612705))

(declare-fun res!715512 () Bool)

(assert (=> d!129227 (=> (not res!715512) (not e!612705))))

(declare-fun lt!475629 () ListLongMap!14577)

(assert (=> d!129227 (= res!715512 (contains!6294 lt!475629 (_1!8315 lt!475421)))))

(declare-fun lt!475630 () List!23131)

(assert (=> d!129227 (= lt!475629 (ListLongMap!14578 lt!475630))))

(declare-fun lt!475631 () Unit!35183)

(declare-fun lt!475632 () Unit!35183)

(assert (=> d!129227 (= lt!475631 lt!475632)))

(assert (=> d!129227 (= (getValueByKey!606 lt!475630 (_1!8315 lt!475421)) (Some!656 (_2!8315 lt!475421)))))

(assert (=> d!129227 (= lt!475632 (lemmaContainsTupThenGetReturnValue!286 lt!475630 (_1!8315 lt!475421) (_2!8315 lt!475421)))))

(assert (=> d!129227 (= lt!475630 (insertStrictlySorted!379 (toList!7304 lt!475428) (_1!8315 lt!475421) (_2!8315 lt!475421)))))

(assert (=> d!129227 (= (+!3236 lt!475428 lt!475421) lt!475629)))

(declare-fun b!1072632 () Bool)

(declare-fun res!715513 () Bool)

(assert (=> b!1072632 (=> (not res!715513) (not e!612705))))

(assert (=> b!1072632 (= res!715513 (= (getValueByKey!606 (toList!7304 lt!475629) (_1!8315 lt!475421)) (Some!656 (_2!8315 lt!475421))))))

(declare-fun b!1072633 () Bool)

(assert (=> b!1072633 (= e!612705 (contains!6295 (toList!7304 lt!475629) lt!475421))))

(assert (= (and d!129227 res!715512) b!1072632))

(assert (= (and b!1072632 res!715513) b!1072633))

(declare-fun m!991283 () Bool)

(assert (=> d!129227 m!991283))

(declare-fun m!991285 () Bool)

(assert (=> d!129227 m!991285))

(declare-fun m!991287 () Bool)

(assert (=> d!129227 m!991287))

(declare-fun m!991289 () Bool)

(assert (=> d!129227 m!991289))

(declare-fun m!991291 () Bool)

(assert (=> b!1072632 m!991291))

(declare-fun m!991293 () Bool)

(assert (=> b!1072633 m!991293))

(assert (=> b!1072448 d!129227))

(declare-fun d!129229 () Bool)

(assert (=> d!129229 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94846 d!129229))

(declare-fun d!129231 () Bool)

(assert (=> d!129231 (= (array_inv!25562 _values!955) (bvsge (size!33577 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94846 d!129231))

(declare-fun d!129233 () Bool)

(assert (=> d!129233 (= (array_inv!25563 _keys!1163) (bvsge (size!33578 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94846 d!129233))

(declare-fun d!129235 () Bool)

(declare-fun e!612706 () Bool)

(assert (=> d!129235 e!612706))

(declare-fun res!715514 () Bool)

(assert (=> d!129235 (=> (not res!715514) (not e!612706))))

(declare-fun lt!475633 () ListLongMap!14577)

(assert (=> d!129235 (= res!715514 (contains!6294 lt!475633 (_1!8315 lt!475426)))))

(declare-fun lt!475634 () List!23131)

(assert (=> d!129235 (= lt!475633 (ListLongMap!14578 lt!475634))))

(declare-fun lt!475635 () Unit!35183)

(declare-fun lt!475636 () Unit!35183)

(assert (=> d!129235 (= lt!475635 lt!475636)))

(assert (=> d!129235 (= (getValueByKey!606 lt!475634 (_1!8315 lt!475426)) (Some!656 (_2!8315 lt!475426)))))

(assert (=> d!129235 (= lt!475636 (lemmaContainsTupThenGetReturnValue!286 lt!475634 (_1!8315 lt!475426) (_2!8315 lt!475426)))))

(assert (=> d!129235 (= lt!475634 (insertStrictlySorted!379 (toList!7304 lt!475424) (_1!8315 lt!475426) (_2!8315 lt!475426)))))

(assert (=> d!129235 (= (+!3236 lt!475424 lt!475426) lt!475633)))

(declare-fun b!1072634 () Bool)

(declare-fun res!715515 () Bool)

(assert (=> b!1072634 (=> (not res!715515) (not e!612706))))

(assert (=> b!1072634 (= res!715515 (= (getValueByKey!606 (toList!7304 lt!475633) (_1!8315 lt!475426)) (Some!656 (_2!8315 lt!475426))))))

(declare-fun b!1072635 () Bool)

(assert (=> b!1072635 (= e!612706 (contains!6295 (toList!7304 lt!475633) lt!475426))))

(assert (= (and d!129235 res!715514) b!1072634))

(assert (= (and b!1072634 res!715515) b!1072635))

(declare-fun m!991295 () Bool)

(assert (=> d!129235 m!991295))

(declare-fun m!991297 () Bool)

(assert (=> d!129235 m!991297))

(declare-fun m!991299 () Bool)

(assert (=> d!129235 m!991299))

(declare-fun m!991301 () Bool)

(assert (=> d!129235 m!991301))

(declare-fun m!991303 () Bool)

(assert (=> b!1072634 m!991303))

(declare-fun m!991305 () Bool)

(assert (=> b!1072635 m!991305))

(assert (=> b!1072445 d!129235))

(declare-fun d!129237 () Bool)

(assert (=> d!129237 (= (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475639 () Unit!35183)

(declare-fun choose!1753 (array!68690 array!68688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39657 V!39657 V!39657 V!39657 (_ BitVec 32) Int) Unit!35183)

(assert (=> d!129237 (= lt!475639 (choose!1753 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129237 (validMask!0 mask!1515)))

(assert (=> d!129237 (= (lemmaNoChangeToArrayThenSameMapNoExtras!878 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475639)))

(declare-fun bs!31582 () Bool)

(assert (= bs!31582 d!129237))

(assert (=> bs!31582 m!991013))

(assert (=> bs!31582 m!991011))

(declare-fun m!991307 () Bool)

(assert (=> bs!31582 m!991307))

(assert (=> bs!31582 m!991017))

(assert (=> b!1072441 d!129237))

(declare-fun b!1072660 () Bool)

(declare-fun e!612723 () Bool)

(declare-fun lt!475660 () ListLongMap!14577)

(declare-fun isEmpty!954 (ListLongMap!14577) Bool)

(assert (=> b!1072660 (= e!612723 (isEmpty!954 lt!475660))))

(declare-fun b!1072661 () Bool)

(declare-fun res!715525 () Bool)

(declare-fun e!612721 () Bool)

(assert (=> b!1072661 (=> (not res!715525) (not e!612721))))

(assert (=> b!1072661 (= res!715525 (not (contains!6294 lt!475660 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1072662 () Bool)

(declare-fun e!612724 () Bool)

(assert (=> b!1072662 (= e!612721 e!612724)))

(declare-fun c!107697 () Bool)

(declare-fun e!612722 () Bool)

(assert (=> b!1072662 (= c!107697 e!612722)))

(declare-fun res!715527 () Bool)

(assert (=> b!1072662 (=> (not res!715527) (not e!612722))))

(assert (=> b!1072662 (= res!715527 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun bm!45250 () Bool)

(declare-fun call!45253 () ListLongMap!14577)

(assert (=> bm!45250 (= call!45253 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1072663 () Bool)

(declare-fun e!612725 () ListLongMap!14577)

(assert (=> b!1072663 (= e!612725 call!45253)))

(declare-fun b!1072664 () Bool)

(declare-fun e!612727 () Bool)

(assert (=> b!1072664 (= e!612724 e!612727)))

(assert (=> b!1072664 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun res!715524 () Bool)

(assert (=> b!1072664 (= res!715524 (contains!6294 lt!475660 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072664 (=> (not res!715524) (not e!612727))))

(declare-fun d!129239 () Bool)

(assert (=> d!129239 e!612721))

(declare-fun res!715526 () Bool)

(assert (=> d!129239 (=> (not res!715526) (not e!612721))))

(assert (=> d!129239 (= res!715526 (not (contains!6294 lt!475660 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!612726 () ListLongMap!14577)

(assert (=> d!129239 (= lt!475660 e!612726)))

(declare-fun c!107696 () Bool)

(assert (=> d!129239 (= c!107696 (bvsge #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (=> d!129239 (validMask!0 mask!1515)))

(assert (=> d!129239 (= (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475660)))

(declare-fun b!1072665 () Bool)

(assert (=> b!1072665 (= e!612726 (ListLongMap!14578 Nil!23128))))

(declare-fun b!1072666 () Bool)

(assert (=> b!1072666 (= e!612723 (= lt!475660 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1072667 () Bool)

(assert (=> b!1072667 (= e!612724 e!612723)))

(declare-fun c!107695 () Bool)

(assert (=> b!1072667 (= c!107695 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun b!1072668 () Bool)

(assert (=> b!1072668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (=> b!1072668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33577 _values!955)))))

(assert (=> b!1072668 (= e!612727 (= (apply!924 lt!475660 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)) (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1072669 () Bool)

(assert (=> b!1072669 (= e!612722 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072669 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1072670 () Bool)

(assert (=> b!1072670 (= e!612726 e!612725)))

(declare-fun c!107698 () Bool)

(assert (=> b!1072670 (= c!107698 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072671 () Bool)

(declare-fun lt!475654 () Unit!35183)

(declare-fun lt!475657 () Unit!35183)

(assert (=> b!1072671 (= lt!475654 lt!475657)))

(declare-fun lt!475658 () V!39657)

(declare-fun lt!475656 () ListLongMap!14577)

(declare-fun lt!475655 () (_ BitVec 64))

(declare-fun lt!475659 () (_ BitVec 64))

(assert (=> b!1072671 (not (contains!6294 (+!3236 lt!475656 (tuple2!16609 lt!475655 lt!475658)) lt!475659))))

(declare-fun addStillNotContains!260 (ListLongMap!14577 (_ BitVec 64) V!39657 (_ BitVec 64)) Unit!35183)

(assert (=> b!1072671 (= lt!475657 (addStillNotContains!260 lt!475656 lt!475655 lt!475658 lt!475659))))

(assert (=> b!1072671 (= lt!475659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1072671 (= lt!475658 (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1072671 (= lt!475655 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1072671 (= lt!475656 call!45253)))

(assert (=> b!1072671 (= e!612725 (+!3236 call!45253 (tuple2!16609 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000) (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!129239 c!107696) b!1072665))

(assert (= (and d!129239 (not c!107696)) b!1072670))

(assert (= (and b!1072670 c!107698) b!1072671))

(assert (= (and b!1072670 (not c!107698)) b!1072663))

(assert (= (or b!1072671 b!1072663) bm!45250))

(assert (= (and d!129239 res!715526) b!1072661))

(assert (= (and b!1072661 res!715525) b!1072662))

(assert (= (and b!1072662 res!715527) b!1072669))

(assert (= (and b!1072662 c!107697) b!1072664))

(assert (= (and b!1072662 (not c!107697)) b!1072667))

(assert (= (and b!1072664 res!715524) b!1072668))

(assert (= (and b!1072667 c!107695) b!1072666))

(assert (= (and b!1072667 (not c!107695)) b!1072660))

(declare-fun b_lambda!16683 () Bool)

(assert (=> (not b_lambda!16683) (not b!1072668)))

(assert (=> b!1072668 t!32462))

(declare-fun b_and!34907 () Bool)

(assert (= b_and!34905 (and (=> t!32462 result!14771) b_and!34907)))

(declare-fun b_lambda!16685 () Bool)

(assert (=> (not b_lambda!16685) (not b!1072671)))

(assert (=> b!1072671 t!32462))

(declare-fun b_and!34909 () Bool)

(assert (= b_and!34907 (and (=> t!32462 result!14771) b_and!34909)))

(assert (=> b!1072670 m!991107))

(assert (=> b!1072670 m!991107))

(assert (=> b!1072670 m!991109))

(declare-fun m!991309 () Bool)

(assert (=> b!1072666 m!991309))

(assert (=> b!1072664 m!991107))

(assert (=> b!1072664 m!991107))

(declare-fun m!991311 () Bool)

(assert (=> b!1072664 m!991311))

(assert (=> bm!45250 m!991309))

(declare-fun m!991313 () Bool)

(assert (=> b!1072671 m!991313))

(assert (=> b!1072671 m!991145))

(assert (=> b!1072671 m!991143))

(assert (=> b!1072671 m!991147))

(declare-fun m!991315 () Bool)

(assert (=> b!1072671 m!991315))

(assert (=> b!1072671 m!991107))

(declare-fun m!991317 () Bool)

(assert (=> b!1072671 m!991317))

(assert (=> b!1072671 m!991145))

(assert (=> b!1072671 m!991317))

(declare-fun m!991319 () Bool)

(assert (=> b!1072671 m!991319))

(assert (=> b!1072671 m!991143))

(assert (=> b!1072668 m!991107))

(declare-fun m!991321 () Bool)

(assert (=> b!1072668 m!991321))

(assert (=> b!1072668 m!991145))

(assert (=> b!1072668 m!991143))

(assert (=> b!1072668 m!991147))

(assert (=> b!1072668 m!991107))

(assert (=> b!1072668 m!991145))

(assert (=> b!1072668 m!991143))

(declare-fun m!991323 () Bool)

(assert (=> b!1072660 m!991323))

(declare-fun m!991325 () Bool)

(assert (=> b!1072661 m!991325))

(declare-fun m!991327 () Bool)

(assert (=> d!129239 m!991327))

(assert (=> d!129239 m!991017))

(assert (=> b!1072669 m!991107))

(assert (=> b!1072669 m!991107))

(assert (=> b!1072669 m!991109))

(assert (=> b!1072441 d!129239))

(declare-fun b!1072672 () Bool)

(declare-fun e!612730 () Bool)

(declare-fun lt!475667 () ListLongMap!14577)

(assert (=> b!1072672 (= e!612730 (isEmpty!954 lt!475667))))

(declare-fun b!1072673 () Bool)

(declare-fun res!715529 () Bool)

(declare-fun e!612728 () Bool)

(assert (=> b!1072673 (=> (not res!715529) (not e!612728))))

(assert (=> b!1072673 (= res!715529 (not (contains!6294 lt!475667 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1072674 () Bool)

(declare-fun e!612731 () Bool)

(assert (=> b!1072674 (= e!612728 e!612731)))

(declare-fun c!107701 () Bool)

(declare-fun e!612729 () Bool)

(assert (=> b!1072674 (= c!107701 e!612729)))

(declare-fun res!715531 () Bool)

(assert (=> b!1072674 (=> (not res!715531) (not e!612729))))

(assert (=> b!1072674 (= res!715531 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun call!45254 () ListLongMap!14577)

(declare-fun bm!45251 () Bool)

(assert (=> bm!45251 (= call!45254 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1072675 () Bool)

(declare-fun e!612732 () ListLongMap!14577)

(assert (=> b!1072675 (= e!612732 call!45254)))

(declare-fun b!1072676 () Bool)

(declare-fun e!612734 () Bool)

(assert (=> b!1072676 (= e!612731 e!612734)))

(assert (=> b!1072676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun res!715528 () Bool)

(assert (=> b!1072676 (= res!715528 (contains!6294 lt!475667 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072676 (=> (not res!715528) (not e!612734))))

(declare-fun d!129241 () Bool)

(assert (=> d!129241 e!612728))

(declare-fun res!715530 () Bool)

(assert (=> d!129241 (=> (not res!715530) (not e!612728))))

(assert (=> d!129241 (= res!715530 (not (contains!6294 lt!475667 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!612733 () ListLongMap!14577)

(assert (=> d!129241 (= lt!475667 e!612733)))

(declare-fun c!107700 () Bool)

(assert (=> d!129241 (= c!107700 (bvsge #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (=> d!129241 (validMask!0 mask!1515)))

(assert (=> d!129241 (= (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475667)))

(declare-fun b!1072677 () Bool)

(assert (=> b!1072677 (= e!612733 (ListLongMap!14578 Nil!23128))))

(declare-fun b!1072678 () Bool)

(assert (=> b!1072678 (= e!612730 (= lt!475667 (getCurrentListMapNoExtraKeys!3884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1072679 () Bool)

(assert (=> b!1072679 (= e!612731 e!612730)))

(declare-fun c!107699 () Bool)

(assert (=> b!1072679 (= c!107699 (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(declare-fun b!1072680 () Bool)

(assert (=> b!1072680 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33578 _keys!1163)))))

(assert (=> b!1072680 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33577 _values!955)))))

(assert (=> b!1072680 (= e!612734 (= (apply!924 lt!475667 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)) (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1072681 () Bool)

(assert (=> b!1072681 (= e!612729 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072681 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1072682 () Bool)

(assert (=> b!1072682 (= e!612733 e!612732)))

(declare-fun c!107702 () Bool)

(assert (=> b!1072682 (= c!107702 (validKeyInArray!0 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072683 () Bool)

(declare-fun lt!475661 () Unit!35183)

(declare-fun lt!475664 () Unit!35183)

(assert (=> b!1072683 (= lt!475661 lt!475664)))

(declare-fun lt!475666 () (_ BitVec 64))

(declare-fun lt!475665 () V!39657)

(declare-fun lt!475663 () ListLongMap!14577)

(declare-fun lt!475662 () (_ BitVec 64))

(assert (=> b!1072683 (not (contains!6294 (+!3236 lt!475663 (tuple2!16609 lt!475662 lt!475665)) lt!475666))))

(assert (=> b!1072683 (= lt!475664 (addStillNotContains!260 lt!475663 lt!475662 lt!475665 lt!475666))))

(assert (=> b!1072683 (= lt!475666 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1072683 (= lt!475665 (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1072683 (= lt!475662 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1072683 (= lt!475663 call!45254)))

(assert (=> b!1072683 (= e!612732 (+!3236 call!45254 (tuple2!16609 (select (arr!33040 _keys!1163) #b00000000000000000000000000000000) (get!17182 (select (arr!33039 _values!955) #b00000000000000000000000000000000) (dynLambda!2023 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!129241 c!107700) b!1072677))

(assert (= (and d!129241 (not c!107700)) b!1072682))

(assert (= (and b!1072682 c!107702) b!1072683))

(assert (= (and b!1072682 (not c!107702)) b!1072675))

(assert (= (or b!1072683 b!1072675) bm!45251))

(assert (= (and d!129241 res!715530) b!1072673))

(assert (= (and b!1072673 res!715529) b!1072674))

(assert (= (and b!1072674 res!715531) b!1072681))

(assert (= (and b!1072674 c!107701) b!1072676))

(assert (= (and b!1072674 (not c!107701)) b!1072679))

(assert (= (and b!1072676 res!715528) b!1072680))

(assert (= (and b!1072679 c!107699) b!1072678))

(assert (= (and b!1072679 (not c!107699)) b!1072672))

(declare-fun b_lambda!16687 () Bool)

(assert (=> (not b_lambda!16687) (not b!1072680)))

(assert (=> b!1072680 t!32462))

(declare-fun b_and!34911 () Bool)

(assert (= b_and!34909 (and (=> t!32462 result!14771) b_and!34911)))

(declare-fun b_lambda!16689 () Bool)

(assert (=> (not b_lambda!16689) (not b!1072683)))

(assert (=> b!1072683 t!32462))

(declare-fun b_and!34913 () Bool)

(assert (= b_and!34911 (and (=> t!32462 result!14771) b_and!34913)))

(assert (=> b!1072682 m!991107))

(assert (=> b!1072682 m!991107))

(assert (=> b!1072682 m!991109))

(declare-fun m!991329 () Bool)

(assert (=> b!1072678 m!991329))

(assert (=> b!1072676 m!991107))

(assert (=> b!1072676 m!991107))

(declare-fun m!991331 () Bool)

(assert (=> b!1072676 m!991331))

(assert (=> bm!45251 m!991329))

(declare-fun m!991333 () Bool)

(assert (=> b!1072683 m!991333))

(assert (=> b!1072683 m!991145))

(assert (=> b!1072683 m!991143))

(assert (=> b!1072683 m!991147))

(declare-fun m!991335 () Bool)

(assert (=> b!1072683 m!991335))

(assert (=> b!1072683 m!991107))

(declare-fun m!991337 () Bool)

(assert (=> b!1072683 m!991337))

(assert (=> b!1072683 m!991145))

(assert (=> b!1072683 m!991337))

(declare-fun m!991339 () Bool)

(assert (=> b!1072683 m!991339))

(assert (=> b!1072683 m!991143))

(assert (=> b!1072680 m!991107))

(declare-fun m!991341 () Bool)

(assert (=> b!1072680 m!991341))

(assert (=> b!1072680 m!991145))

(assert (=> b!1072680 m!991143))

(assert (=> b!1072680 m!991147))

(assert (=> b!1072680 m!991107))

(assert (=> b!1072680 m!991145))

(assert (=> b!1072680 m!991143))

(declare-fun m!991343 () Bool)

(assert (=> b!1072672 m!991343))

(declare-fun m!991345 () Bool)

(assert (=> b!1072673 m!991345))

(declare-fun m!991347 () Bool)

(assert (=> d!129241 m!991347))

(assert (=> d!129241 m!991017))

(assert (=> b!1072681 m!991107))

(assert (=> b!1072681 m!991107))

(assert (=> b!1072681 m!991109))

(assert (=> b!1072441 d!129241))

(declare-fun mapNonEmpty!40555 () Bool)

(declare-fun mapRes!40555 () Bool)

(declare-fun tp!77720 () Bool)

(declare-fun e!612739 () Bool)

(assert (=> mapNonEmpty!40555 (= mapRes!40555 (and tp!77720 e!612739))))

(declare-fun mapRest!40555 () (Array (_ BitVec 32) ValueCell!12242))

(declare-fun mapKey!40555 () (_ BitVec 32))

(declare-fun mapValue!40555 () ValueCell!12242)

(assert (=> mapNonEmpty!40555 (= mapRest!40546 (store mapRest!40555 mapKey!40555 mapValue!40555))))

(declare-fun condMapEmpty!40555 () Bool)

(declare-fun mapDefault!40555 () ValueCell!12242)

(assert (=> mapNonEmpty!40546 (= condMapEmpty!40555 (= mapRest!40546 ((as const (Array (_ BitVec 32) ValueCell!12242)) mapDefault!40555)))))

(declare-fun e!612740 () Bool)

(assert (=> mapNonEmpty!40546 (= tp!77705 (and e!612740 mapRes!40555))))

(declare-fun b!1072690 () Bool)

(assert (=> b!1072690 (= e!612739 tp_is_empty!25891)))

(declare-fun b!1072691 () Bool)

(assert (=> b!1072691 (= e!612740 tp_is_empty!25891)))

(declare-fun mapIsEmpty!40555 () Bool)

(assert (=> mapIsEmpty!40555 mapRes!40555))

(assert (= (and mapNonEmpty!40546 condMapEmpty!40555) mapIsEmpty!40555))

(assert (= (and mapNonEmpty!40546 (not condMapEmpty!40555)) mapNonEmpty!40555))

(assert (= (and mapNonEmpty!40555 ((_ is ValueCellFull!12242) mapValue!40555)) b!1072690))

(assert (= (and mapNonEmpty!40546 ((_ is ValueCellFull!12242) mapDefault!40555)) b!1072691))

(declare-fun m!991349 () Bool)

(assert (=> mapNonEmpty!40555 m!991349))

(declare-fun b_lambda!16691 () Bool)

(assert (= b_lambda!16687 (or (and start!94846 b_free!22081) b_lambda!16691)))

(declare-fun b_lambda!16693 () Bool)

(assert (= b_lambda!16685 (or (and start!94846 b_free!22081) b_lambda!16693)))

(declare-fun b_lambda!16695 () Bool)

(assert (= b_lambda!16683 (or (and start!94846 b_free!22081) b_lambda!16695)))

(declare-fun b_lambda!16697 () Bool)

(assert (= b_lambda!16681 (or (and start!94846 b_free!22081) b_lambda!16697)))

(declare-fun b_lambda!16699 () Bool)

(assert (= b_lambda!16689 (or (and start!94846 b_free!22081) b_lambda!16699)))

(declare-fun b_lambda!16701 () Bool)

(assert (= b_lambda!16679 (or (and start!94846 b_free!22081) b_lambda!16701)))

(check-sat (not b!1072618) (not bm!45237) (not bm!45250) (not b_lambda!16699) (not b!1072587) (not b!1072619) (not b!1072668) (not b!1072682) (not b_lambda!16691) (not b!1072635) (not b!1072605) (not d!129227) (not d!129223) (not b!1072672) (not b!1072633) (not b!1072629) (not b!1072666) (not b!1072660) (not b!1072683) (not b!1072608) (not b!1072673) (not b!1072669) (not b!1072532) (not b!1072593) (not bm!45238) (not b!1072632) (not bm!45242) (not b!1072597) (not b_lambda!16701) (not b!1072519) (not b!1072623) (not b!1072585) (not d!129237) (not b!1072596) (not d!129217) (not b!1072671) (not d!129225) (not b!1072520) (not b!1072523) (not b_next!22081) b_and!34913 (not b!1072607) (not b!1072678) (not b!1072586) (not b!1072681) (not b!1072598) (not b!1072626) (not b_lambda!16695) (not bm!45244) tp_is_empty!25891 (not b!1072676) (not b!1072670) (not d!129211) (not bm!45240) (not bm!45235) (not b!1072533) (not d!129235) (not b!1072606) (not b!1072680) (not d!129221) (not b!1072631) (not b!1072590) (not d!129215) (not d!129219) (not b!1072634) (not b!1072620) (not mapNonEmpty!40555) (not b!1072630) (not b_lambda!16697) (not d!129239) (not d!129209) (not d!129213) (not b!1072661) (not bm!45251) (not b!1072664) (not b!1072609) (not bm!45245) (not b_lambda!16693) (not b!1072610) (not d!129241) (not bm!45219) (not bm!45216) (not bm!45247))
(check-sat b_and!34913 (not b_next!22081))
