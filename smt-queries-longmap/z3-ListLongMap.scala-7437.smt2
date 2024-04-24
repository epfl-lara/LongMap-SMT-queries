; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94708 () Bool)

(assert start!94708)

(declare-fun b_free!21799 () Bool)

(declare-fun b_next!21799 () Bool)

(assert (=> start!94708 (= b_free!21799 (not b_next!21799))))

(declare-fun tp!76844 () Bool)

(declare-fun b_and!34601 () Bool)

(assert (=> start!94708 (= tp!76844 b_and!34601)))

(declare-fun mapNonEmpty!40108 () Bool)

(declare-fun mapRes!40108 () Bool)

(declare-fun tp!76843 () Bool)

(declare-fun e!610328 () Bool)

(assert (=> mapNonEmpty!40108 (= mapRes!40108 (and tp!76843 e!610328))))

(declare-datatypes ((V!39281 0))(
  ( (V!39282 (val!12855 Int)) )
))
(declare-datatypes ((ValueCell!12101 0))(
  ( (ValueCellFull!12101 (v!15465 V!39281)) (EmptyCell!12101) )
))
(declare-fun mapRest!40108 () (Array (_ BitVec 32) ValueCell!12101))

(declare-fun mapKey!40108 () (_ BitVec 32))

(declare-datatypes ((array!68243 0))(
  ( (array!68244 (arr!32815 (Array (_ BitVec 32) ValueCell!12101)) (size!33352 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68243)

(declare-fun mapValue!40108 () ValueCell!12101)

(assert (=> mapNonEmpty!40108 (= (arr!32815 _values!955) (store mapRest!40108 mapKey!40108 mapValue!40108))))

(declare-fun b!1069614 () Bool)

(declare-fun res!713396 () Bool)

(declare-fun e!610330 () Bool)

(assert (=> b!1069614 (=> (not res!713396) (not e!610330))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68245 0))(
  ( (array!68246 (arr!32816 (Array (_ BitVec 32) (_ BitVec 64))) (size!33353 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68245)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1069614 (= res!713396 (and (= (size!33352 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33353 _keys!1163) (size!33352 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069615 () Bool)

(declare-fun tp_is_empty!25609 () Bool)

(assert (=> b!1069615 (= e!610328 tp_is_empty!25609)))

(declare-fun b!1069616 () Bool)

(declare-fun res!713397 () Bool)

(assert (=> b!1069616 (=> (not res!713397) (not e!610330))))

(declare-datatypes ((List!22874 0))(
  ( (Nil!22871) (Cons!22870 (h!24088 (_ BitVec 64)) (t!32191 List!22874)) )
))
(declare-fun arrayNoDuplicates!0 (array!68245 (_ BitVec 32) List!22874) Bool)

(assert (=> b!1069616 (= res!713397 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22871))))

(declare-fun mapIsEmpty!40108 () Bool)

(assert (=> mapIsEmpty!40108 mapRes!40108))

(declare-fun res!713399 () Bool)

(assert (=> start!94708 (=> (not res!713399) (not e!610330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94708 (= res!713399 (validMask!0 mask!1515))))

(assert (=> start!94708 e!610330))

(assert (=> start!94708 true))

(assert (=> start!94708 tp_is_empty!25609))

(declare-fun e!610333 () Bool)

(declare-fun array_inv!25422 (array!68243) Bool)

(assert (=> start!94708 (and (array_inv!25422 _values!955) e!610333)))

(assert (=> start!94708 tp!76844))

(declare-fun array_inv!25423 (array!68245) Bool)

(assert (=> start!94708 (array_inv!25423 _keys!1163)))

(declare-fun b!1069617 () Bool)

(declare-fun e!610329 () Bool)

(assert (=> b!1069617 (= e!610330 (not e!610329))))

(declare-fun res!713395 () Bool)

(assert (=> b!1069617 (=> res!713395 e!610329)))

(assert (=> b!1069617 (= res!713395 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16306 0))(
  ( (tuple2!16307 (_1!8164 (_ BitVec 64)) (_2!8164 V!39281)) )
))
(declare-datatypes ((List!22875 0))(
  ( (Nil!22872) (Cons!22871 (h!24089 tuple2!16306) (t!32192 List!22875)) )
))
(declare-datatypes ((ListLongMap!14283 0))(
  ( (ListLongMap!14284 (toList!7157 List!22875)) )
))
(declare-fun lt!472419 () ListLongMap!14283)

(declare-fun lt!472422 () ListLongMap!14283)

(assert (=> b!1069617 (= lt!472419 lt!472422)))

(declare-fun minValue!907 () V!39281)

(declare-datatypes ((Unit!35106 0))(
  ( (Unit!35107) )
))
(declare-fun lt!472421 () Unit!35106)

(declare-fun zeroValueBefore!47 () V!39281)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39281)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!774 (array!68245 array!68243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 V!39281 V!39281 (_ BitVec 32) Int) Unit!35106)

(assert (=> b!1069617 (= lt!472421 (lemmaNoChangeToArrayThenSameMapNoExtras!774 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3771 (array!68245 array!68243 (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 (_ BitVec 32) Int) ListLongMap!14283)

(assert (=> b!1069617 (= lt!472422 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069617 (= lt!472419 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069618 () Bool)

(declare-fun e!610331 () Bool)

(assert (=> b!1069618 (= e!610329 e!610331)))

(declare-fun res!713398 () Bool)

(assert (=> b!1069618 (=> res!713398 e!610331)))

(declare-fun lt!472420 () ListLongMap!14283)

(declare-fun contains!6317 (ListLongMap!14283 (_ BitVec 64)) Bool)

(assert (=> b!1069618 (= res!713398 (contains!6317 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4080 (array!68245 array!68243 (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 (_ BitVec 32) Int) ListLongMap!14283)

(assert (=> b!1069618 (= lt!472420 (getCurrentListMap!4080 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069619 () Bool)

(declare-fun res!713400 () Bool)

(assert (=> b!1069619 (=> (not res!713400) (not e!610330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68245 (_ BitVec 32)) Bool)

(assert (=> b!1069619 (= res!713400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069620 () Bool)

(assert (=> b!1069620 (= e!610331 (bvsle #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun -!641 (ListLongMap!14283 (_ BitVec 64)) ListLongMap!14283)

(assert (=> b!1069620 (= (-!641 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472420)))

(declare-fun lt!472418 () Unit!35106)

(declare-fun removeNotPresentStillSame!58 (ListLongMap!14283 (_ BitVec 64)) Unit!35106)

(assert (=> b!1069620 (= lt!472418 (removeNotPresentStillSame!58 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069621 () Bool)

(declare-fun e!610327 () Bool)

(assert (=> b!1069621 (= e!610333 (and e!610327 mapRes!40108))))

(declare-fun condMapEmpty!40108 () Bool)

(declare-fun mapDefault!40108 () ValueCell!12101)

(assert (=> b!1069621 (= condMapEmpty!40108 (= (arr!32815 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12101)) mapDefault!40108)))))

(declare-fun b!1069622 () Bool)

(assert (=> b!1069622 (= e!610327 tp_is_empty!25609)))

(assert (= (and start!94708 res!713399) b!1069614))

(assert (= (and b!1069614 res!713396) b!1069619))

(assert (= (and b!1069619 res!713400) b!1069616))

(assert (= (and b!1069616 res!713397) b!1069617))

(assert (= (and b!1069617 (not res!713395)) b!1069618))

(assert (= (and b!1069618 (not res!713398)) b!1069620))

(assert (= (and b!1069621 condMapEmpty!40108) mapIsEmpty!40108))

(assert (= (and b!1069621 (not condMapEmpty!40108)) mapNonEmpty!40108))

(get-info :version)

(assert (= (and mapNonEmpty!40108 ((_ is ValueCellFull!12101) mapValue!40108)) b!1069615))

(assert (= (and b!1069621 ((_ is ValueCellFull!12101) mapDefault!40108)) b!1069622))

(assert (= start!94708 b!1069621))

(declare-fun m!988561 () Bool)

(assert (=> b!1069618 m!988561))

(declare-fun m!988563 () Bool)

(assert (=> b!1069618 m!988563))

(declare-fun m!988565 () Bool)

(assert (=> b!1069619 m!988565))

(declare-fun m!988567 () Bool)

(assert (=> b!1069617 m!988567))

(declare-fun m!988569 () Bool)

(assert (=> b!1069617 m!988569))

(declare-fun m!988571 () Bool)

(assert (=> b!1069617 m!988571))

(declare-fun m!988573 () Bool)

(assert (=> b!1069620 m!988573))

(declare-fun m!988575 () Bool)

(assert (=> b!1069620 m!988575))

(declare-fun m!988577 () Bool)

(assert (=> mapNonEmpty!40108 m!988577))

(declare-fun m!988579 () Bool)

(assert (=> b!1069616 m!988579))

(declare-fun m!988581 () Bool)

(assert (=> start!94708 m!988581))

(declare-fun m!988583 () Bool)

(assert (=> start!94708 m!988583))

(declare-fun m!988585 () Bool)

(assert (=> start!94708 m!988585))

(check-sat (not mapNonEmpty!40108) b_and!34601 (not b!1069616) (not start!94708) tp_is_empty!25609 (not b_next!21799) (not b!1069617) (not b!1069619) (not b!1069618) (not b!1069620))
(check-sat b_and!34601 (not b_next!21799))
(get-model)

(declare-fun b!1069687 () Bool)

(declare-fun e!610385 () Bool)

(declare-fun call!45168 () Bool)

(assert (=> b!1069687 (= e!610385 call!45168)))

(declare-fun b!1069688 () Bool)

(declare-fun e!610384 () Bool)

(declare-fun e!610387 () Bool)

(assert (=> b!1069688 (= e!610384 e!610387)))

(declare-fun res!713444 () Bool)

(assert (=> b!1069688 (=> (not res!713444) (not e!610387))))

(declare-fun e!610386 () Bool)

(assert (=> b!1069688 (= res!713444 (not e!610386))))

(declare-fun res!713443 () Bool)

(assert (=> b!1069688 (=> (not res!713443) (not e!610386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1069688 (= res!713443 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129611 () Bool)

(declare-fun res!713445 () Bool)

(assert (=> d!129611 (=> res!713445 e!610384)))

(assert (=> d!129611 (= res!713445 (bvsge #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(assert (=> d!129611 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22871) e!610384)))

(declare-fun bm!45165 () Bool)

(declare-fun c!107914 () Bool)

(assert (=> bm!45165 (= call!45168 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107914 (Cons!22870 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000) Nil!22871) Nil!22871)))))

(declare-fun b!1069689 () Bool)

(assert (=> b!1069689 (= e!610387 e!610385)))

(assert (=> b!1069689 (= c!107914 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069690 () Bool)

(assert (=> b!1069690 (= e!610385 call!45168)))

(declare-fun b!1069691 () Bool)

(declare-fun contains!6320 (List!22874 (_ BitVec 64)) Bool)

(assert (=> b!1069691 (= e!610386 (contains!6320 Nil!22871 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129611 (not res!713445)) b!1069688))

(assert (= (and b!1069688 res!713443) b!1069691))

(assert (= (and b!1069688 res!713444) b!1069689))

(assert (= (and b!1069689 c!107914) b!1069687))

(assert (= (and b!1069689 (not c!107914)) b!1069690))

(assert (= (or b!1069687 b!1069690) bm!45165))

(declare-fun m!988639 () Bool)

(assert (=> b!1069688 m!988639))

(assert (=> b!1069688 m!988639))

(declare-fun m!988641 () Bool)

(assert (=> b!1069688 m!988641))

(assert (=> bm!45165 m!988639))

(declare-fun m!988643 () Bool)

(assert (=> bm!45165 m!988643))

(assert (=> b!1069689 m!988639))

(assert (=> b!1069689 m!988639))

(assert (=> b!1069689 m!988641))

(assert (=> b!1069691 m!988639))

(assert (=> b!1069691 m!988639))

(declare-fun m!988645 () Bool)

(assert (=> b!1069691 m!988645))

(assert (=> b!1069616 d!129611))

(declare-fun d!129613 () Bool)

(assert (=> d!129613 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94708 d!129613))

(declare-fun d!129615 () Bool)

(assert (=> d!129615 (= (array_inv!25422 _values!955) (bvsge (size!33352 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94708 d!129615))

(declare-fun d!129617 () Bool)

(assert (=> d!129617 (= (array_inv!25423 _keys!1163) (bvsge (size!33353 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94708 d!129617))

(declare-fun b!1069700 () Bool)

(declare-fun e!610395 () Bool)

(declare-fun e!610396 () Bool)

(assert (=> b!1069700 (= e!610395 e!610396)))

(declare-fun lt!472460 () (_ BitVec 64))

(assert (=> b!1069700 (= lt!472460 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472461 () Unit!35106)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68245 (_ BitVec 64) (_ BitVec 32)) Unit!35106)

(assert (=> b!1069700 (= lt!472461 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!472460 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1069700 (arrayContainsKey!0 _keys!1163 lt!472460 #b00000000000000000000000000000000)))

(declare-fun lt!472459 () Unit!35106)

(assert (=> b!1069700 (= lt!472459 lt!472461)))

(declare-fun res!713450 () Bool)

(declare-datatypes ((SeekEntryResult!9835 0))(
  ( (MissingZero!9835 (index!41711 (_ BitVec 32))) (Found!9835 (index!41712 (_ BitVec 32))) (Intermediate!9835 (undefined!10647 Bool) (index!41713 (_ BitVec 32)) (x!95660 (_ BitVec 32))) (Undefined!9835) (MissingVacant!9835 (index!41714 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68245 (_ BitVec 32)) SeekEntryResult!9835)

(assert (=> b!1069700 (= res!713450 (= (seekEntryOrOpen!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9835 #b00000000000000000000000000000000)))))

(assert (=> b!1069700 (=> (not res!713450) (not e!610396))))

(declare-fun b!1069701 () Bool)

(declare-fun e!610394 () Bool)

(assert (=> b!1069701 (= e!610394 e!610395)))

(declare-fun c!107917 () Bool)

(assert (=> b!1069701 (= c!107917 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45168 () Bool)

(declare-fun call!45171 () Bool)

(assert (=> bm!45168 (= call!45171 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1069703 () Bool)

(assert (=> b!1069703 (= e!610395 call!45171)))

(declare-fun d!129619 () Bool)

(declare-fun res!713451 () Bool)

(assert (=> d!129619 (=> res!713451 e!610394)))

(assert (=> d!129619 (= res!713451 (bvsge #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(assert (=> d!129619 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!610394)))

(declare-fun b!1069702 () Bool)

(assert (=> b!1069702 (= e!610396 call!45171)))

(assert (= (and d!129619 (not res!713451)) b!1069701))

(assert (= (and b!1069701 c!107917) b!1069700))

(assert (= (and b!1069701 (not c!107917)) b!1069703))

(assert (= (and b!1069700 res!713450) b!1069702))

(assert (= (or b!1069702 b!1069703) bm!45168))

(assert (=> b!1069700 m!988639))

(declare-fun m!988647 () Bool)

(assert (=> b!1069700 m!988647))

(declare-fun m!988649 () Bool)

(assert (=> b!1069700 m!988649))

(assert (=> b!1069700 m!988639))

(declare-fun m!988651 () Bool)

(assert (=> b!1069700 m!988651))

(assert (=> b!1069701 m!988639))

(assert (=> b!1069701 m!988639))

(assert (=> b!1069701 m!988641))

(declare-fun m!988653 () Bool)

(assert (=> bm!45168 m!988653))

(assert (=> b!1069619 d!129619))

(declare-fun d!129621 () Bool)

(declare-fun lt!472464 () ListLongMap!14283)

(assert (=> d!129621 (not (contains!6317 lt!472464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!70 (List!22875 (_ BitVec 64)) List!22875)

(assert (=> d!129621 (= lt!472464 (ListLongMap!14284 (removeStrictlySorted!70 (toList!7157 lt!472420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129621 (= (-!641 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472464)))

(declare-fun bs!31473 () Bool)

(assert (= bs!31473 d!129621))

(declare-fun m!988655 () Bool)

(assert (=> bs!31473 m!988655))

(declare-fun m!988657 () Bool)

(assert (=> bs!31473 m!988657))

(assert (=> b!1069620 d!129621))

(declare-fun d!129623 () Bool)

(assert (=> d!129623 (= (-!641 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472420)))

(declare-fun lt!472467 () Unit!35106)

(declare-fun choose!1739 (ListLongMap!14283 (_ BitVec 64)) Unit!35106)

(assert (=> d!129623 (= lt!472467 (choose!1739 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129623 (not (contains!6317 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129623 (= (removeNotPresentStillSame!58 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472467)))

(declare-fun bs!31474 () Bool)

(assert (= bs!31474 d!129623))

(assert (=> bs!31474 m!988573))

(declare-fun m!988659 () Bool)

(assert (=> bs!31474 m!988659))

(assert (=> bs!31474 m!988561))

(assert (=> b!1069620 d!129623))

(declare-fun d!129625 () Bool)

(declare-fun e!610402 () Bool)

(assert (=> d!129625 e!610402))

(declare-fun res!713454 () Bool)

(assert (=> d!129625 (=> res!713454 e!610402)))

(declare-fun lt!472478 () Bool)

(assert (=> d!129625 (= res!713454 (not lt!472478))))

(declare-fun lt!472477 () Bool)

(assert (=> d!129625 (= lt!472478 lt!472477)))

(declare-fun lt!472479 () Unit!35106)

(declare-fun e!610401 () Unit!35106)

(assert (=> d!129625 (= lt!472479 e!610401)))

(declare-fun c!107920 () Bool)

(assert (=> d!129625 (= c!107920 lt!472477)))

(declare-fun containsKey!576 (List!22875 (_ BitVec 64)) Bool)

(assert (=> d!129625 (= lt!472477 (containsKey!576 (toList!7157 lt!472420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129625 (= (contains!6317 lt!472420 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472478)))

(declare-fun b!1069710 () Bool)

(declare-fun lt!472476 () Unit!35106)

(assert (=> b!1069710 (= e!610401 lt!472476)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!407 (List!22875 (_ BitVec 64)) Unit!35106)

(assert (=> b!1069710 (= lt!472476 (lemmaContainsKeyImpliesGetValueByKeyDefined!407 (toList!7157 lt!472420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!648 0))(
  ( (Some!647 (v!15468 V!39281)) (None!646) )
))
(declare-fun isDefined!445 (Option!648) Bool)

(declare-fun getValueByKey!597 (List!22875 (_ BitVec 64)) Option!648)

(assert (=> b!1069710 (isDefined!445 (getValueByKey!597 (toList!7157 lt!472420) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069711 () Bool)

(declare-fun Unit!35112 () Unit!35106)

(assert (=> b!1069711 (= e!610401 Unit!35112)))

(declare-fun b!1069712 () Bool)

(assert (=> b!1069712 (= e!610402 (isDefined!445 (getValueByKey!597 (toList!7157 lt!472420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129625 c!107920) b!1069710))

(assert (= (and d!129625 (not c!107920)) b!1069711))

(assert (= (and d!129625 (not res!713454)) b!1069712))

(declare-fun m!988661 () Bool)

(assert (=> d!129625 m!988661))

(declare-fun m!988663 () Bool)

(assert (=> b!1069710 m!988663))

(declare-fun m!988665 () Bool)

(assert (=> b!1069710 m!988665))

(assert (=> b!1069710 m!988665))

(declare-fun m!988667 () Bool)

(assert (=> b!1069710 m!988667))

(assert (=> b!1069712 m!988665))

(assert (=> b!1069712 m!988665))

(assert (=> b!1069712 m!988667))

(assert (=> b!1069618 d!129625))

(declare-fun bm!45183 () Bool)

(declare-fun call!45190 () Bool)

(declare-fun lt!472526 () ListLongMap!14283)

(assert (=> bm!45183 (= call!45190 (contains!6317 lt!472526 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069755 () Bool)

(declare-fun e!610441 () Bool)

(declare-fun e!610431 () Bool)

(assert (=> b!1069755 (= e!610441 e!610431)))

(declare-fun res!713475 () Bool)

(assert (=> b!1069755 (=> (not res!713475) (not e!610431))))

(assert (=> b!1069755 (= res!713475 (contains!6317 lt!472526 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069755 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun b!1069756 () Bool)

(declare-fun c!107936 () Bool)

(assert (=> b!1069756 (= c!107936 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!610429 () ListLongMap!14283)

(declare-fun e!610436 () ListLongMap!14283)

(assert (=> b!1069756 (= e!610429 e!610436)))

(declare-fun b!1069757 () Bool)

(declare-fun e!610433 () Unit!35106)

(declare-fun lt!472536 () Unit!35106)

(assert (=> b!1069757 (= e!610433 lt!472536)))

(declare-fun lt!472528 () ListLongMap!14283)

(assert (=> b!1069757 (= lt!472528 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472538 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472538 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472529 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472529 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472540 () Unit!35106)

(declare-fun addStillContains!641 (ListLongMap!14283 (_ BitVec 64) V!39281 (_ BitVec 64)) Unit!35106)

(assert (=> b!1069757 (= lt!472540 (addStillContains!641 lt!472528 lt!472538 zeroValueBefore!47 lt!472529))))

(declare-fun +!3179 (ListLongMap!14283 tuple2!16306) ListLongMap!14283)

(assert (=> b!1069757 (contains!6317 (+!3179 lt!472528 (tuple2!16307 lt!472538 zeroValueBefore!47)) lt!472529)))

(declare-fun lt!472533 () Unit!35106)

(assert (=> b!1069757 (= lt!472533 lt!472540)))

(declare-fun lt!472545 () ListLongMap!14283)

(assert (=> b!1069757 (= lt!472545 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472524 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472524 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472535 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472535 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472539 () Unit!35106)

(declare-fun addApplyDifferent!497 (ListLongMap!14283 (_ BitVec 64) V!39281 (_ BitVec 64)) Unit!35106)

(assert (=> b!1069757 (= lt!472539 (addApplyDifferent!497 lt!472545 lt!472524 minValue!907 lt!472535))))

(declare-fun apply!935 (ListLongMap!14283 (_ BitVec 64)) V!39281)

(assert (=> b!1069757 (= (apply!935 (+!3179 lt!472545 (tuple2!16307 lt!472524 minValue!907)) lt!472535) (apply!935 lt!472545 lt!472535))))

(declare-fun lt!472532 () Unit!35106)

(assert (=> b!1069757 (= lt!472532 lt!472539)))

(declare-fun lt!472543 () ListLongMap!14283)

(assert (=> b!1069757 (= lt!472543 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472534 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472530 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472530 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472542 () Unit!35106)

(assert (=> b!1069757 (= lt!472542 (addApplyDifferent!497 lt!472543 lt!472534 zeroValueBefore!47 lt!472530))))

(assert (=> b!1069757 (= (apply!935 (+!3179 lt!472543 (tuple2!16307 lt!472534 zeroValueBefore!47)) lt!472530) (apply!935 lt!472543 lt!472530))))

(declare-fun lt!472541 () Unit!35106)

(assert (=> b!1069757 (= lt!472541 lt!472542)))

(declare-fun lt!472537 () ListLongMap!14283)

(assert (=> b!1069757 (= lt!472537 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472525 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472525 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!472527 () (_ BitVec 64))

(assert (=> b!1069757 (= lt!472527 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1069757 (= lt!472536 (addApplyDifferent!497 lt!472537 lt!472525 minValue!907 lt!472527))))

(assert (=> b!1069757 (= (apply!935 (+!3179 lt!472537 (tuple2!16307 lt!472525 minValue!907)) lt!472527) (apply!935 lt!472537 lt!472527))))

(declare-fun bm!45184 () Bool)

(declare-fun call!45189 () ListLongMap!14283)

(declare-fun call!45191 () ListLongMap!14283)

(assert (=> bm!45184 (= call!45189 call!45191)))

(declare-fun b!1069758 () Bool)

(declare-fun e!610432 () Bool)

(assert (=> b!1069758 (= e!610432 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069759 () Bool)

(declare-fun e!610437 () Bool)

(declare-fun e!610435 () Bool)

(assert (=> b!1069759 (= e!610437 e!610435)))

(declare-fun res!713479 () Bool)

(declare-fun call!45186 () Bool)

(assert (=> b!1069759 (= res!713479 call!45186)))

(assert (=> b!1069759 (=> (not res!713479) (not e!610435))))

(declare-fun b!1069760 () Bool)

(declare-fun get!17117 (ValueCell!12101 V!39281) V!39281)

(declare-fun dynLambda!2050 (Int (_ BitVec 64)) V!39281)

(assert (=> b!1069760 (= e!610431 (= (apply!935 lt!472526 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)) (get!17117 (select (arr!32815 _values!955) #b00000000000000000000000000000000) (dynLambda!2050 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1069760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33352 _values!955)))))

(assert (=> b!1069760 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun b!1069761 () Bool)

(declare-fun e!610430 () Bool)

(assert (=> b!1069761 (= e!610430 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069762 () Bool)

(declare-fun e!610434 () Bool)

(assert (=> b!1069762 (= e!610434 (= (apply!935 lt!472526 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1069763 () Bool)

(declare-fun res!713480 () Bool)

(declare-fun e!610439 () Bool)

(assert (=> b!1069763 (=> (not res!713480) (not e!610439))))

(assert (=> b!1069763 (= res!713480 e!610441)))

(declare-fun res!713474 () Bool)

(assert (=> b!1069763 (=> res!713474 e!610441)))

(assert (=> b!1069763 (= res!713474 (not e!610432))))

(declare-fun res!713476 () Bool)

(assert (=> b!1069763 (=> (not res!713476) (not e!610432))))

(assert (=> b!1069763 (= res!713476 (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun b!1069764 () Bool)

(declare-fun res!713477 () Bool)

(assert (=> b!1069764 (=> (not res!713477) (not e!610439))))

(assert (=> b!1069764 (= res!713477 e!610437)))

(declare-fun c!107933 () Bool)

(assert (=> b!1069764 (= c!107933 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!129627 () Bool)

(assert (=> d!129627 e!610439))

(declare-fun res!713481 () Bool)

(assert (=> d!129627 (=> (not res!713481) (not e!610439))))

(assert (=> d!129627 (= res!713481 (or (bvsge #b00000000000000000000000000000000 (size!33353 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))))

(declare-fun lt!472531 () ListLongMap!14283)

(assert (=> d!129627 (= lt!472526 lt!472531)))

(declare-fun lt!472544 () Unit!35106)

(assert (=> d!129627 (= lt!472544 e!610433)))

(declare-fun c!107937 () Bool)

(assert (=> d!129627 (= c!107937 e!610430)))

(declare-fun res!713473 () Bool)

(assert (=> d!129627 (=> (not res!713473) (not e!610430))))

(assert (=> d!129627 (= res!713473 (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun e!610440 () ListLongMap!14283)

(assert (=> d!129627 (= lt!472531 e!610440)))

(declare-fun c!107938 () Bool)

(assert (=> d!129627 (= c!107938 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129627 (validMask!0 mask!1515)))

(assert (=> d!129627 (= (getCurrentListMap!4080 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472526)))

(declare-fun b!1069765 () Bool)

(declare-fun e!610438 () Bool)

(assert (=> b!1069765 (= e!610438 (not call!45190))))

(declare-fun b!1069766 () Bool)

(assert (=> b!1069766 (= e!610438 e!610434)))

(declare-fun res!713478 () Bool)

(assert (=> b!1069766 (= res!713478 call!45190)))

(assert (=> b!1069766 (=> (not res!713478) (not e!610434))))

(declare-fun b!1069767 () Bool)

(declare-fun Unit!35113 () Unit!35106)

(assert (=> b!1069767 (= e!610433 Unit!35113)))

(declare-fun b!1069768 () Bool)

(assert (=> b!1069768 (= e!610435 (= (apply!935 lt!472526 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1069769 () Bool)

(assert (=> b!1069769 (= e!610440 e!610429)))

(declare-fun c!107934 () Bool)

(assert (=> b!1069769 (= c!107934 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1069770 () Bool)

(declare-fun call!45187 () ListLongMap!14283)

(assert (=> b!1069770 (= e!610429 call!45187)))

(declare-fun call!45192 () ListLongMap!14283)

(declare-fun bm!45185 () Bool)

(assert (=> bm!45185 (= call!45192 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45186 () Bool)

(assert (=> bm!45186 (= call!45186 (contains!6317 lt!472526 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069771 () Bool)

(assert (=> b!1069771 (= e!610436 call!45189)))

(declare-fun bm!45187 () Bool)

(assert (=> bm!45187 (= call!45191 call!45192)))

(declare-fun bm!45188 () Bool)

(declare-fun call!45188 () ListLongMap!14283)

(assert (=> bm!45188 (= call!45188 (+!3179 (ite c!107938 call!45192 (ite c!107934 call!45191 call!45189)) (ite (or c!107938 c!107934) (tuple2!16307 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1069772 () Bool)

(assert (=> b!1069772 (= e!610440 (+!3179 call!45188 (tuple2!16307 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1069773 () Bool)

(assert (=> b!1069773 (= e!610439 e!610438)))

(declare-fun c!107935 () Bool)

(assert (=> b!1069773 (= c!107935 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1069774 () Bool)

(assert (=> b!1069774 (= e!610436 call!45187)))

(declare-fun bm!45189 () Bool)

(assert (=> bm!45189 (= call!45187 call!45188)))

(declare-fun b!1069775 () Bool)

(assert (=> b!1069775 (= e!610437 (not call!45186))))

(assert (= (and d!129627 c!107938) b!1069772))

(assert (= (and d!129627 (not c!107938)) b!1069769))

(assert (= (and b!1069769 c!107934) b!1069770))

(assert (= (and b!1069769 (not c!107934)) b!1069756))

(assert (= (and b!1069756 c!107936) b!1069774))

(assert (= (and b!1069756 (not c!107936)) b!1069771))

(assert (= (or b!1069774 b!1069771) bm!45184))

(assert (= (or b!1069770 bm!45184) bm!45187))

(assert (= (or b!1069770 b!1069774) bm!45189))

(assert (= (or b!1069772 bm!45187) bm!45185))

(assert (= (or b!1069772 bm!45189) bm!45188))

(assert (= (and d!129627 res!713473) b!1069761))

(assert (= (and d!129627 c!107937) b!1069757))

(assert (= (and d!129627 (not c!107937)) b!1069767))

(assert (= (and d!129627 res!713481) b!1069763))

(assert (= (and b!1069763 res!713476) b!1069758))

(assert (= (and b!1069763 (not res!713474)) b!1069755))

(assert (= (and b!1069755 res!713475) b!1069760))

(assert (= (and b!1069763 res!713480) b!1069764))

(assert (= (and b!1069764 c!107933) b!1069759))

(assert (= (and b!1069764 (not c!107933)) b!1069775))

(assert (= (and b!1069759 res!713479) b!1069768))

(assert (= (or b!1069759 b!1069775) bm!45186))

(assert (= (and b!1069764 res!713477) b!1069773))

(assert (= (and b!1069773 c!107935) b!1069766))

(assert (= (and b!1069773 (not c!107935)) b!1069765))

(assert (= (and b!1069766 res!713478) b!1069762))

(assert (= (or b!1069766 b!1069765) bm!45183))

(declare-fun b_lambda!16611 () Bool)

(assert (=> (not b_lambda!16611) (not b!1069760)))

(declare-fun t!32198 () Bool)

(declare-fun tb!7139 () Bool)

(assert (=> (and start!94708 (= defaultEntry!963 defaultEntry!963) t!32198) tb!7139))

(declare-fun result!14741 () Bool)

(assert (=> tb!7139 (= result!14741 tp_is_empty!25609)))

(assert (=> b!1069760 t!32198))

(declare-fun b_and!34607 () Bool)

(assert (= b_and!34601 (and (=> t!32198 result!14741) b_and!34607)))

(declare-fun m!988669 () Bool)

(assert (=> b!1069760 m!988669))

(declare-fun m!988671 () Bool)

(assert (=> b!1069760 m!988671))

(declare-fun m!988673 () Bool)

(assert (=> b!1069760 m!988673))

(assert (=> b!1069760 m!988639))

(declare-fun m!988675 () Bool)

(assert (=> b!1069760 m!988675))

(assert (=> b!1069760 m!988669))

(assert (=> b!1069760 m!988639))

(assert (=> b!1069760 m!988671))

(declare-fun m!988677 () Bool)

(assert (=> b!1069757 m!988677))

(declare-fun m!988679 () Bool)

(assert (=> b!1069757 m!988679))

(declare-fun m!988681 () Bool)

(assert (=> b!1069757 m!988681))

(declare-fun m!988683 () Bool)

(assert (=> b!1069757 m!988683))

(assert (=> b!1069757 m!988571))

(assert (=> b!1069757 m!988639))

(declare-fun m!988685 () Bool)

(assert (=> b!1069757 m!988685))

(declare-fun m!988687 () Bool)

(assert (=> b!1069757 m!988687))

(declare-fun m!988689 () Bool)

(assert (=> b!1069757 m!988689))

(declare-fun m!988691 () Bool)

(assert (=> b!1069757 m!988691))

(declare-fun m!988693 () Bool)

(assert (=> b!1069757 m!988693))

(declare-fun m!988695 () Bool)

(assert (=> b!1069757 m!988695))

(declare-fun m!988697 () Bool)

(assert (=> b!1069757 m!988697))

(assert (=> b!1069757 m!988689))

(assert (=> b!1069757 m!988685))

(assert (=> b!1069757 m!988695))

(declare-fun m!988699 () Bool)

(assert (=> b!1069757 m!988699))

(assert (=> b!1069757 m!988683))

(declare-fun m!988701 () Bool)

(assert (=> b!1069757 m!988701))

(declare-fun m!988703 () Bool)

(assert (=> b!1069757 m!988703))

(declare-fun m!988705 () Bool)

(assert (=> b!1069757 m!988705))

(assert (=> b!1069761 m!988639))

(assert (=> b!1069761 m!988639))

(assert (=> b!1069761 m!988641))

(declare-fun m!988707 () Bool)

(assert (=> b!1069772 m!988707))

(declare-fun m!988709 () Bool)

(assert (=> bm!45186 m!988709))

(assert (=> d!129627 m!988581))

(assert (=> b!1069758 m!988639))

(assert (=> b!1069758 m!988639))

(assert (=> b!1069758 m!988641))

(declare-fun m!988711 () Bool)

(assert (=> b!1069768 m!988711))

(declare-fun m!988713 () Bool)

(assert (=> b!1069762 m!988713))

(declare-fun m!988715 () Bool)

(assert (=> bm!45188 m!988715))

(declare-fun m!988717 () Bool)

(assert (=> bm!45183 m!988717))

(assert (=> bm!45185 m!988571))

(assert (=> b!1069755 m!988639))

(assert (=> b!1069755 m!988639))

(declare-fun m!988719 () Bool)

(assert (=> b!1069755 m!988719))

(assert (=> b!1069618 d!129627))

(declare-fun d!129629 () Bool)

(assert (=> d!129629 (= (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472548 () Unit!35106)

(declare-fun choose!1740 (array!68245 array!68243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39281 V!39281 V!39281 V!39281 (_ BitVec 32) Int) Unit!35106)

(assert (=> d!129629 (= lt!472548 (choose!1740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129629 (validMask!0 mask!1515)))

(assert (=> d!129629 (= (lemmaNoChangeToArrayThenSameMapNoExtras!774 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472548)))

(declare-fun bs!31475 () Bool)

(assert (= bs!31475 d!129629))

(assert (=> bs!31475 m!988571))

(assert (=> bs!31475 m!988569))

(declare-fun m!988721 () Bool)

(assert (=> bs!31475 m!988721))

(assert (=> bs!31475 m!988581))

(assert (=> b!1069617 d!129629))

(declare-fun b!1069802 () Bool)

(declare-fun e!610462 () Bool)

(declare-fun e!610461 () Bool)

(assert (=> b!1069802 (= e!610462 e!610461)))

(assert (=> b!1069802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun res!713492 () Bool)

(declare-fun lt!472565 () ListLongMap!14283)

(assert (=> b!1069802 (= res!713492 (contains!6317 lt!472565 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069802 (=> (not res!713492) (not e!610461))))

(declare-fun b!1069803 () Bool)

(declare-fun e!610458 () Bool)

(assert (=> b!1069803 (= e!610462 e!610458)))

(declare-fun c!107947 () Bool)

(assert (=> b!1069803 (= c!107947 (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun b!1069804 () Bool)

(assert (=> b!1069804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(assert (=> b!1069804 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33352 _values!955)))))

(assert (=> b!1069804 (= e!610461 (= (apply!935 lt!472565 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)) (get!17117 (select (arr!32815 _values!955) #b00000000000000000000000000000000) (dynLambda!2050 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069805 () Bool)

(declare-fun lt!472564 () Unit!35106)

(declare-fun lt!472566 () Unit!35106)

(assert (=> b!1069805 (= lt!472564 lt!472566)))

(declare-fun lt!472569 () V!39281)

(declare-fun lt!472568 () (_ BitVec 64))

(declare-fun lt!472563 () (_ BitVec 64))

(declare-fun lt!472567 () ListLongMap!14283)

(assert (=> b!1069805 (not (contains!6317 (+!3179 lt!472567 (tuple2!16307 lt!472568 lt!472569)) lt!472563))))

(declare-fun addStillNotContains!256 (ListLongMap!14283 (_ BitVec 64) V!39281 (_ BitVec 64)) Unit!35106)

(assert (=> b!1069805 (= lt!472566 (addStillNotContains!256 lt!472567 lt!472568 lt!472569 lt!472563))))

(assert (=> b!1069805 (= lt!472563 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1069805 (= lt!472569 (get!17117 (select (arr!32815 _values!955) #b00000000000000000000000000000000) (dynLambda!2050 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069805 (= lt!472568 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45195 () ListLongMap!14283)

(assert (=> b!1069805 (= lt!472567 call!45195)))

(declare-fun e!610456 () ListLongMap!14283)

(assert (=> b!1069805 (= e!610456 (+!3179 call!45195 (tuple2!16307 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000) (get!17117 (select (arr!32815 _values!955) #b00000000000000000000000000000000) (dynLambda!2050 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1069806 () Bool)

(assert (=> b!1069806 (= e!610456 call!45195)))

(declare-fun b!1069807 () Bool)

(declare-fun e!610457 () ListLongMap!14283)

(assert (=> b!1069807 (= e!610457 (ListLongMap!14284 Nil!22872))))

(declare-fun b!1069809 () Bool)

(assert (=> b!1069809 (= e!610458 (= lt!472565 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45192 () Bool)

(assert (=> bm!45192 (= call!45195 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1069810 () Bool)

(declare-fun isEmpty!948 (ListLongMap!14283) Bool)

(assert (=> b!1069810 (= e!610458 (isEmpty!948 lt!472565))))

(declare-fun d!129631 () Bool)

(declare-fun e!610459 () Bool)

(assert (=> d!129631 e!610459))

(declare-fun res!713490 () Bool)

(assert (=> d!129631 (=> (not res!713490) (not e!610459))))

(assert (=> d!129631 (= res!713490 (not (contains!6317 lt!472565 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129631 (= lt!472565 e!610457)))

(declare-fun c!107950 () Bool)

(assert (=> d!129631 (= c!107950 (bvsge #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(assert (=> d!129631 (validMask!0 mask!1515)))

(assert (=> d!129631 (= (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472565)))

(declare-fun b!1069808 () Bool)

(assert (=> b!1069808 (= e!610459 e!610462)))

(declare-fun c!107948 () Bool)

(declare-fun e!610460 () Bool)

(assert (=> b!1069808 (= c!107948 e!610460)))

(declare-fun res!713491 () Bool)

(assert (=> b!1069808 (=> (not res!713491) (not e!610460))))

(assert (=> b!1069808 (= res!713491 (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun b!1069811 () Bool)

(assert (=> b!1069811 (= e!610460 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069811 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1069812 () Bool)

(assert (=> b!1069812 (= e!610457 e!610456)))

(declare-fun c!107949 () Bool)

(assert (=> b!1069812 (= c!107949 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069813 () Bool)

(declare-fun res!713493 () Bool)

(assert (=> b!1069813 (=> (not res!713493) (not e!610459))))

(assert (=> b!1069813 (= res!713493 (not (contains!6317 lt!472565 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129631 c!107950) b!1069807))

(assert (= (and d!129631 (not c!107950)) b!1069812))

(assert (= (and b!1069812 c!107949) b!1069805))

(assert (= (and b!1069812 (not c!107949)) b!1069806))

(assert (= (or b!1069805 b!1069806) bm!45192))

(assert (= (and d!129631 res!713490) b!1069813))

(assert (= (and b!1069813 res!713493) b!1069808))

(assert (= (and b!1069808 res!713491) b!1069811))

(assert (= (and b!1069808 c!107948) b!1069802))

(assert (= (and b!1069808 (not c!107948)) b!1069803))

(assert (= (and b!1069802 res!713492) b!1069804))

(assert (= (and b!1069803 c!107947) b!1069809))

(assert (= (and b!1069803 (not c!107947)) b!1069810))

(declare-fun b_lambda!16613 () Bool)

(assert (=> (not b_lambda!16613) (not b!1069804)))

(assert (=> b!1069804 t!32198))

(declare-fun b_and!34609 () Bool)

(assert (= b_and!34607 (and (=> t!32198 result!14741) b_and!34609)))

(declare-fun b_lambda!16615 () Bool)

(assert (=> (not b_lambda!16615) (not b!1069805)))

(assert (=> b!1069805 t!32198))

(declare-fun b_and!34611 () Bool)

(assert (= b_and!34609 (and (=> t!32198 result!14741) b_and!34611)))

(declare-fun m!988723 () Bool)

(assert (=> b!1069813 m!988723))

(assert (=> b!1069802 m!988639))

(assert (=> b!1069802 m!988639))

(declare-fun m!988725 () Bool)

(assert (=> b!1069802 m!988725))

(assert (=> b!1069804 m!988671))

(assert (=> b!1069804 m!988639))

(declare-fun m!988727 () Bool)

(assert (=> b!1069804 m!988727))

(assert (=> b!1069804 m!988669))

(assert (=> b!1069804 m!988639))

(assert (=> b!1069804 m!988669))

(assert (=> b!1069804 m!988671))

(assert (=> b!1069804 m!988673))

(declare-fun m!988729 () Bool)

(assert (=> bm!45192 m!988729))

(assert (=> b!1069809 m!988729))

(assert (=> b!1069812 m!988639))

(assert (=> b!1069812 m!988639))

(assert (=> b!1069812 m!988641))

(declare-fun m!988731 () Bool)

(assert (=> b!1069805 m!988731))

(assert (=> b!1069805 m!988669))

(assert (=> b!1069805 m!988639))

(assert (=> b!1069805 m!988669))

(assert (=> b!1069805 m!988671))

(assert (=> b!1069805 m!988673))

(declare-fun m!988733 () Bool)

(assert (=> b!1069805 m!988733))

(declare-fun m!988735 () Bool)

(assert (=> b!1069805 m!988735))

(declare-fun m!988737 () Bool)

(assert (=> b!1069805 m!988737))

(assert (=> b!1069805 m!988733))

(assert (=> b!1069805 m!988671))

(declare-fun m!988739 () Bool)

(assert (=> b!1069810 m!988739))

(declare-fun m!988741 () Bool)

(assert (=> d!129631 m!988741))

(assert (=> d!129631 m!988581))

(assert (=> b!1069811 m!988639))

(assert (=> b!1069811 m!988639))

(assert (=> b!1069811 m!988641))

(assert (=> b!1069617 d!129631))

(declare-fun b!1069814 () Bool)

(declare-fun e!610469 () Bool)

(declare-fun e!610468 () Bool)

(assert (=> b!1069814 (= e!610469 e!610468)))

(assert (=> b!1069814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun res!713496 () Bool)

(declare-fun lt!472572 () ListLongMap!14283)

(assert (=> b!1069814 (= res!713496 (contains!6317 lt!472572 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069814 (=> (not res!713496) (not e!610468))))

(declare-fun b!1069815 () Bool)

(declare-fun e!610465 () Bool)

(assert (=> b!1069815 (= e!610469 e!610465)))

(declare-fun c!107951 () Bool)

(assert (=> b!1069815 (= c!107951 (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun b!1069816 () Bool)

(assert (=> b!1069816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(assert (=> b!1069816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33352 _values!955)))))

(assert (=> b!1069816 (= e!610468 (= (apply!935 lt!472572 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)) (get!17117 (select (arr!32815 _values!955) #b00000000000000000000000000000000) (dynLambda!2050 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069817 () Bool)

(declare-fun lt!472571 () Unit!35106)

(declare-fun lt!472573 () Unit!35106)

(assert (=> b!1069817 (= lt!472571 lt!472573)))

(declare-fun lt!472576 () V!39281)

(declare-fun lt!472570 () (_ BitVec 64))

(declare-fun lt!472574 () ListLongMap!14283)

(declare-fun lt!472575 () (_ BitVec 64))

(assert (=> b!1069817 (not (contains!6317 (+!3179 lt!472574 (tuple2!16307 lt!472575 lt!472576)) lt!472570))))

(assert (=> b!1069817 (= lt!472573 (addStillNotContains!256 lt!472574 lt!472575 lt!472576 lt!472570))))

(assert (=> b!1069817 (= lt!472570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1069817 (= lt!472576 (get!17117 (select (arr!32815 _values!955) #b00000000000000000000000000000000) (dynLambda!2050 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069817 (= lt!472575 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45196 () ListLongMap!14283)

(assert (=> b!1069817 (= lt!472574 call!45196)))

(declare-fun e!610463 () ListLongMap!14283)

(assert (=> b!1069817 (= e!610463 (+!3179 call!45196 (tuple2!16307 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000) (get!17117 (select (arr!32815 _values!955) #b00000000000000000000000000000000) (dynLambda!2050 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1069818 () Bool)

(assert (=> b!1069818 (= e!610463 call!45196)))

(declare-fun b!1069819 () Bool)

(declare-fun e!610464 () ListLongMap!14283)

(assert (=> b!1069819 (= e!610464 (ListLongMap!14284 Nil!22872))))

(declare-fun b!1069821 () Bool)

(assert (=> b!1069821 (= e!610465 (= lt!472572 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45193 () Bool)

(assert (=> bm!45193 (= call!45196 (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1069822 () Bool)

(assert (=> b!1069822 (= e!610465 (isEmpty!948 lt!472572))))

(declare-fun d!129633 () Bool)

(declare-fun e!610466 () Bool)

(assert (=> d!129633 e!610466))

(declare-fun res!713494 () Bool)

(assert (=> d!129633 (=> (not res!713494) (not e!610466))))

(assert (=> d!129633 (= res!713494 (not (contains!6317 lt!472572 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129633 (= lt!472572 e!610464)))

(declare-fun c!107954 () Bool)

(assert (=> d!129633 (= c!107954 (bvsge #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(assert (=> d!129633 (validMask!0 mask!1515)))

(assert (=> d!129633 (= (getCurrentListMapNoExtraKeys!3771 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472572)))

(declare-fun b!1069820 () Bool)

(assert (=> b!1069820 (= e!610466 e!610469)))

(declare-fun c!107952 () Bool)

(declare-fun e!610467 () Bool)

(assert (=> b!1069820 (= c!107952 e!610467)))

(declare-fun res!713495 () Bool)

(assert (=> b!1069820 (=> (not res!713495) (not e!610467))))

(assert (=> b!1069820 (= res!713495 (bvslt #b00000000000000000000000000000000 (size!33353 _keys!1163)))))

(declare-fun b!1069823 () Bool)

(assert (=> b!1069823 (= e!610467 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069823 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1069824 () Bool)

(assert (=> b!1069824 (= e!610464 e!610463)))

(declare-fun c!107953 () Bool)

(assert (=> b!1069824 (= c!107953 (validKeyInArray!0 (select (arr!32816 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069825 () Bool)

(declare-fun res!713497 () Bool)

(assert (=> b!1069825 (=> (not res!713497) (not e!610466))))

(assert (=> b!1069825 (= res!713497 (not (contains!6317 lt!472572 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129633 c!107954) b!1069819))

(assert (= (and d!129633 (not c!107954)) b!1069824))

(assert (= (and b!1069824 c!107953) b!1069817))

(assert (= (and b!1069824 (not c!107953)) b!1069818))

(assert (= (or b!1069817 b!1069818) bm!45193))

(assert (= (and d!129633 res!713494) b!1069825))

(assert (= (and b!1069825 res!713497) b!1069820))

(assert (= (and b!1069820 res!713495) b!1069823))

(assert (= (and b!1069820 c!107952) b!1069814))

(assert (= (and b!1069820 (not c!107952)) b!1069815))

(assert (= (and b!1069814 res!713496) b!1069816))

(assert (= (and b!1069815 c!107951) b!1069821))

(assert (= (and b!1069815 (not c!107951)) b!1069822))

(declare-fun b_lambda!16617 () Bool)

(assert (=> (not b_lambda!16617) (not b!1069816)))

(assert (=> b!1069816 t!32198))

(declare-fun b_and!34613 () Bool)

(assert (= b_and!34611 (and (=> t!32198 result!14741) b_and!34613)))

(declare-fun b_lambda!16619 () Bool)

(assert (=> (not b_lambda!16619) (not b!1069817)))

(assert (=> b!1069817 t!32198))

(declare-fun b_and!34615 () Bool)

(assert (= b_and!34613 (and (=> t!32198 result!14741) b_and!34615)))

(declare-fun m!988743 () Bool)

(assert (=> b!1069825 m!988743))

(assert (=> b!1069814 m!988639))

(assert (=> b!1069814 m!988639))

(declare-fun m!988745 () Bool)

(assert (=> b!1069814 m!988745))

(assert (=> b!1069816 m!988671))

(assert (=> b!1069816 m!988639))

(declare-fun m!988747 () Bool)

(assert (=> b!1069816 m!988747))

(assert (=> b!1069816 m!988669))

(assert (=> b!1069816 m!988639))

(assert (=> b!1069816 m!988669))

(assert (=> b!1069816 m!988671))

(assert (=> b!1069816 m!988673))

(declare-fun m!988749 () Bool)

(assert (=> bm!45193 m!988749))

(assert (=> b!1069821 m!988749))

(assert (=> b!1069824 m!988639))

(assert (=> b!1069824 m!988639))

(assert (=> b!1069824 m!988641))

(declare-fun m!988751 () Bool)

(assert (=> b!1069817 m!988751))

(assert (=> b!1069817 m!988669))

(assert (=> b!1069817 m!988639))

(assert (=> b!1069817 m!988669))

(assert (=> b!1069817 m!988671))

(assert (=> b!1069817 m!988673))

(declare-fun m!988753 () Bool)

(assert (=> b!1069817 m!988753))

(declare-fun m!988755 () Bool)

(assert (=> b!1069817 m!988755))

(declare-fun m!988757 () Bool)

(assert (=> b!1069817 m!988757))

(assert (=> b!1069817 m!988753))

(assert (=> b!1069817 m!988671))

(declare-fun m!988759 () Bool)

(assert (=> b!1069822 m!988759))

(declare-fun m!988761 () Bool)

(assert (=> d!129633 m!988761))

(assert (=> d!129633 m!988581))

(assert (=> b!1069823 m!988639))

(assert (=> b!1069823 m!988639))

(assert (=> b!1069823 m!988641))

(assert (=> b!1069617 d!129633))

(declare-fun mapNonEmpty!40117 () Bool)

(declare-fun mapRes!40117 () Bool)

(declare-fun tp!76859 () Bool)

(declare-fun e!610474 () Bool)

(assert (=> mapNonEmpty!40117 (= mapRes!40117 (and tp!76859 e!610474))))

(declare-fun mapRest!40117 () (Array (_ BitVec 32) ValueCell!12101))

(declare-fun mapKey!40117 () (_ BitVec 32))

(declare-fun mapValue!40117 () ValueCell!12101)

(assert (=> mapNonEmpty!40117 (= mapRest!40108 (store mapRest!40117 mapKey!40117 mapValue!40117))))

(declare-fun mapIsEmpty!40117 () Bool)

(assert (=> mapIsEmpty!40117 mapRes!40117))

(declare-fun b!1069833 () Bool)

(declare-fun e!610475 () Bool)

(assert (=> b!1069833 (= e!610475 tp_is_empty!25609)))

(declare-fun condMapEmpty!40117 () Bool)

(declare-fun mapDefault!40117 () ValueCell!12101)

(assert (=> mapNonEmpty!40108 (= condMapEmpty!40117 (= mapRest!40108 ((as const (Array (_ BitVec 32) ValueCell!12101)) mapDefault!40117)))))

(assert (=> mapNonEmpty!40108 (= tp!76843 (and e!610475 mapRes!40117))))

(declare-fun b!1069832 () Bool)

(assert (=> b!1069832 (= e!610474 tp_is_empty!25609)))

(assert (= (and mapNonEmpty!40108 condMapEmpty!40117) mapIsEmpty!40117))

(assert (= (and mapNonEmpty!40108 (not condMapEmpty!40117)) mapNonEmpty!40117))

(assert (= (and mapNonEmpty!40117 ((_ is ValueCellFull!12101) mapValue!40117)) b!1069832))

(assert (= (and mapNonEmpty!40108 ((_ is ValueCellFull!12101) mapDefault!40117)) b!1069833))

(declare-fun m!988763 () Bool)

(assert (=> mapNonEmpty!40117 m!988763))

(declare-fun b_lambda!16621 () Bool)

(assert (= b_lambda!16617 (or (and start!94708 b_free!21799) b_lambda!16621)))

(declare-fun b_lambda!16623 () Bool)

(assert (= b_lambda!16613 (or (and start!94708 b_free!21799) b_lambda!16623)))

(declare-fun b_lambda!16625 () Bool)

(assert (= b_lambda!16611 (or (and start!94708 b_free!21799) b_lambda!16625)))

(declare-fun b_lambda!16627 () Bool)

(assert (= b_lambda!16615 (or (and start!94708 b_free!21799) b_lambda!16627)))

(declare-fun b_lambda!16629 () Bool)

(assert (= b_lambda!16619 (or (and start!94708 b_free!21799) b_lambda!16629)))

(check-sat (not b!1069760) (not b!1069768) (not bm!45185) (not b_lambda!16623) (not b!1069804) (not d!129625) (not b_lambda!16625) (not bm!45188) (not bm!45168) (not b!1069688) (not d!129623) (not d!129633) (not b!1069810) (not d!129621) (not b!1069809) (not bm!45193) (not b!1069761) (not b!1069814) tp_is_empty!25609 (not b!1069691) (not b_next!21799) (not b!1069812) (not d!129631) (not b!1069772) (not b!1069811) (not b!1069822) (not bm!45192) (not b!1069757) (not b!1069802) (not b!1069755) (not b!1069813) (not b_lambda!16629) (not b!1069701) (not b!1069821) (not b!1069710) (not b!1069824) (not mapNonEmpty!40117) b_and!34615 (not b!1069700) (not d!129627) (not b_lambda!16621) (not b!1069805) (not b!1069689) (not bm!45186) (not d!129629) (not b!1069823) (not b!1069817) (not b!1069825) (not bm!45165) (not b!1069816) (not b!1069712) (not bm!45183) (not b!1069758) (not b!1069762) (not b_lambda!16627))
(check-sat b_and!34615 (not b_next!21799))
