; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94950 () Bool)

(assert start!94950)

(declare-fun b_free!22155 () Bool)

(declare-fun b_next!22155 () Bool)

(assert (=> start!94950 (= b_free!22155 (not b_next!22155))))

(declare-fun tp!77929 () Bool)

(declare-fun b_and!35009 () Bool)

(assert (=> start!94950 (= tp!77929 b_and!35009)))

(declare-fun b!1073573 () Bool)

(declare-fun e!613356 () Bool)

(declare-fun tp_is_empty!25965 () Bool)

(assert (=> b!1073573 (= e!613356 tp_is_empty!25965)))

(declare-fun res!716019 () Bool)

(declare-fun e!613358 () Bool)

(assert (=> start!94950 (=> (not res!716019) (not e!613358))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94950 (= res!716019 (validMask!0 mask!1515))))

(assert (=> start!94950 e!613358))

(assert (=> start!94950 true))

(assert (=> start!94950 tp_is_empty!25965))

(declare-datatypes ((V!39755 0))(
  ( (V!39756 (val!13033 Int)) )
))
(declare-datatypes ((ValueCell!12279 0))(
  ( (ValueCellFull!12279 (v!15651 V!39755)) (EmptyCell!12279) )
))
(declare-datatypes ((array!68891 0))(
  ( (array!68892 (arr!33139 (Array (_ BitVec 32) ValueCell!12279)) (size!33675 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68891)

(declare-fun e!613354 () Bool)

(declare-fun array_inv!25612 (array!68891) Bool)

(assert (=> start!94950 (and (array_inv!25612 _values!955) e!613354)))

(assert (=> start!94950 tp!77929))

(declare-datatypes ((array!68893 0))(
  ( (array!68894 (arr!33140 (Array (_ BitVec 32) (_ BitVec 64))) (size!33676 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68893)

(declare-fun array_inv!25613 (array!68893) Bool)

(assert (=> start!94950 (array_inv!25613 _keys!1163)))

(declare-fun b!1073574 () Bool)

(declare-fun res!716018 () Bool)

(assert (=> b!1073574 (=> (not res!716018) (not e!613358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68893 (_ BitVec 32)) Bool)

(assert (=> b!1073574 (= res!716018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40660 () Bool)

(declare-fun mapRes!40660 () Bool)

(assert (=> mapIsEmpty!40660 mapRes!40660))

(declare-fun b!1073575 () Bool)

(declare-fun e!613357 () Bool)

(assert (=> b!1073575 (= e!613357 tp_is_empty!25965)))

(declare-fun b!1073576 () Bool)

(assert (=> b!1073576 (= e!613358 (bvsgt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(declare-datatypes ((tuple2!16596 0))(
  ( (tuple2!16597 (_1!8309 (_ BitVec 64)) (_2!8309 V!39755)) )
))
(declare-datatypes ((List!23134 0))(
  ( (Nil!23131) (Cons!23130 (h!24339 tuple2!16596) (t!32471 List!23134)) )
))
(declare-datatypes ((ListLongMap!14565 0))(
  ( (ListLongMap!14566 (toList!7298 List!23134)) )
))
(declare-fun lt!476086 () ListLongMap!14565)

(declare-fun minValue!907 () V!39755)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39755)

(declare-fun getCurrentListMapNoExtraKeys!3862 (array!68893 array!68891 (_ BitVec 32) (_ BitVec 32) V!39755 V!39755 (_ BitVec 32) Int) ListLongMap!14565)

(assert (=> b!1073576 (= lt!476086 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39755)

(declare-fun lt!476085 () ListLongMap!14565)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073576 (= lt!476085 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073577 () Bool)

(declare-fun res!716020 () Bool)

(assert (=> b!1073577 (=> (not res!716020) (not e!613358))))

(assert (=> b!1073577 (= res!716020 (and (= (size!33675 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33676 _keys!1163) (size!33675 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40660 () Bool)

(declare-fun tp!77930 () Bool)

(assert (=> mapNonEmpty!40660 (= mapRes!40660 (and tp!77930 e!613357))))

(declare-fun mapValue!40660 () ValueCell!12279)

(declare-fun mapRest!40660 () (Array (_ BitVec 32) ValueCell!12279))

(declare-fun mapKey!40660 () (_ BitVec 32))

(assert (=> mapNonEmpty!40660 (= (arr!33139 _values!955) (store mapRest!40660 mapKey!40660 mapValue!40660))))

(declare-fun b!1073578 () Bool)

(declare-fun res!716017 () Bool)

(assert (=> b!1073578 (=> (not res!716017) (not e!613358))))

(declare-datatypes ((List!23135 0))(
  ( (Nil!23132) (Cons!23131 (h!24340 (_ BitVec 64)) (t!32472 List!23135)) )
))
(declare-fun arrayNoDuplicates!0 (array!68893 (_ BitVec 32) List!23135) Bool)

(assert (=> b!1073578 (= res!716017 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23132))))

(declare-fun b!1073579 () Bool)

(assert (=> b!1073579 (= e!613354 (and e!613356 mapRes!40660))))

(declare-fun condMapEmpty!40660 () Bool)

(declare-fun mapDefault!40660 () ValueCell!12279)

(assert (=> b!1073579 (= condMapEmpty!40660 (= (arr!33139 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12279)) mapDefault!40660)))))

(assert (= (and start!94950 res!716019) b!1073577))

(assert (= (and b!1073577 res!716020) b!1073574))

(assert (= (and b!1073574 res!716018) b!1073578))

(assert (= (and b!1073578 res!716017) b!1073576))

(assert (= (and b!1073579 condMapEmpty!40660) mapIsEmpty!40660))

(assert (= (and b!1073579 (not condMapEmpty!40660)) mapNonEmpty!40660))

(get-info :version)

(assert (= (and mapNonEmpty!40660 ((_ is ValueCellFull!12279) mapValue!40660)) b!1073575))

(assert (= (and b!1073579 ((_ is ValueCellFull!12279) mapDefault!40660)) b!1073573))

(assert (= start!94950 b!1073579))

(declare-fun m!992527 () Bool)

(assert (=> start!94950 m!992527))

(declare-fun m!992529 () Bool)

(assert (=> start!94950 m!992529))

(declare-fun m!992531 () Bool)

(assert (=> start!94950 m!992531))

(declare-fun m!992533 () Bool)

(assert (=> b!1073578 m!992533))

(declare-fun m!992535 () Bool)

(assert (=> mapNonEmpty!40660 m!992535))

(declare-fun m!992537 () Bool)

(assert (=> b!1073576 m!992537))

(declare-fun m!992539 () Bool)

(assert (=> b!1073576 m!992539))

(declare-fun m!992541 () Bool)

(assert (=> b!1073574 m!992541))

(check-sat b_and!35009 tp_is_empty!25965 (not mapNonEmpty!40660) (not start!94950) (not b!1073574) (not b_next!22155) (not b!1073578) (not b!1073576))
(check-sat b_and!35009 (not b_next!22155))
(get-model)

(declare-fun b!1073609 () Bool)

(declare-fun e!613381 () Bool)

(declare-fun call!45280 () Bool)

(assert (=> b!1073609 (= e!613381 call!45280)))

(declare-fun d!129423 () Bool)

(declare-fun res!716037 () Bool)

(declare-fun e!613382 () Bool)

(assert (=> d!129423 (=> res!716037 e!613382)))

(assert (=> d!129423 (= res!716037 (bvsge #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(assert (=> d!129423 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613382)))

(declare-fun b!1073610 () Bool)

(declare-fun e!613380 () Bool)

(assert (=> b!1073610 (= e!613381 e!613380)))

(declare-fun lt!476099 () (_ BitVec 64))

(assert (=> b!1073610 (= lt!476099 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35354 0))(
  ( (Unit!35355) )
))
(declare-fun lt!476100 () Unit!35354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68893 (_ BitVec 64) (_ BitVec 32)) Unit!35354)

(assert (=> b!1073610 (= lt!476100 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476099 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1073610 (arrayContainsKey!0 _keys!1163 lt!476099 #b00000000000000000000000000000000)))

(declare-fun lt!476101 () Unit!35354)

(assert (=> b!1073610 (= lt!476101 lt!476100)))

(declare-fun res!716038 () Bool)

(declare-datatypes ((SeekEntryResult!9885 0))(
  ( (MissingZero!9885 (index!41911 (_ BitVec 32))) (Found!9885 (index!41912 (_ BitVec 32))) (Intermediate!9885 (undefined!10697 Bool) (index!41913 (_ BitVec 32)) (x!96226 (_ BitVec 32))) (Undefined!9885) (MissingVacant!9885 (index!41914 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68893 (_ BitVec 32)) SeekEntryResult!9885)

(assert (=> b!1073610 (= res!716038 (= (seekEntryOrOpen!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9885 #b00000000000000000000000000000000)))))

(assert (=> b!1073610 (=> (not res!716038) (not e!613380))))

(declare-fun bm!45277 () Bool)

(assert (=> bm!45277 (= call!45280 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1073611 () Bool)

(assert (=> b!1073611 (= e!613382 e!613381)))

(declare-fun c!107744 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1073611 (= c!107744 (validKeyInArray!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073612 () Bool)

(assert (=> b!1073612 (= e!613380 call!45280)))

(assert (= (and d!129423 (not res!716037)) b!1073611))

(assert (= (and b!1073611 c!107744) b!1073610))

(assert (= (and b!1073611 (not c!107744)) b!1073609))

(assert (= (and b!1073610 res!716038) b!1073612))

(assert (= (or b!1073612 b!1073609) bm!45277))

(declare-fun m!992559 () Bool)

(assert (=> b!1073610 m!992559))

(declare-fun m!992561 () Bool)

(assert (=> b!1073610 m!992561))

(declare-fun m!992563 () Bool)

(assert (=> b!1073610 m!992563))

(assert (=> b!1073610 m!992559))

(declare-fun m!992565 () Bool)

(assert (=> b!1073610 m!992565))

(declare-fun m!992567 () Bool)

(assert (=> bm!45277 m!992567))

(assert (=> b!1073611 m!992559))

(assert (=> b!1073611 m!992559))

(declare-fun m!992569 () Bool)

(assert (=> b!1073611 m!992569))

(assert (=> b!1073574 d!129423))

(declare-fun b!1073623 () Bool)

(declare-fun e!613392 () Bool)

(declare-fun e!613394 () Bool)

(assert (=> b!1073623 (= e!613392 e!613394)))

(declare-fun res!716047 () Bool)

(assert (=> b!1073623 (=> (not res!716047) (not e!613394))))

(declare-fun e!613393 () Bool)

(assert (=> b!1073623 (= res!716047 (not e!613393))))

(declare-fun res!716045 () Bool)

(assert (=> b!1073623 (=> (not res!716045) (not e!613393))))

(assert (=> b!1073623 (= res!716045 (validKeyInArray!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45280 () Bool)

(declare-fun call!45283 () Bool)

(declare-fun c!107747 () Bool)

(assert (=> bm!45280 (= call!45283 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107747 (Cons!23131 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000) Nil!23132) Nil!23132)))))

(declare-fun b!1073624 () Bool)

(declare-fun e!613391 () Bool)

(assert (=> b!1073624 (= e!613391 call!45283)))

(declare-fun d!129425 () Bool)

(declare-fun res!716046 () Bool)

(assert (=> d!129425 (=> res!716046 e!613392)))

(assert (=> d!129425 (= res!716046 (bvsge #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(assert (=> d!129425 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23132) e!613392)))

(declare-fun b!1073625 () Bool)

(assert (=> b!1073625 (= e!613391 call!45283)))

(declare-fun b!1073626 () Bool)

(assert (=> b!1073626 (= e!613394 e!613391)))

(assert (=> b!1073626 (= c!107747 (validKeyInArray!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073627 () Bool)

(declare-fun contains!6328 (List!23135 (_ BitVec 64)) Bool)

(assert (=> b!1073627 (= e!613393 (contains!6328 Nil!23132 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129425 (not res!716046)) b!1073623))

(assert (= (and b!1073623 res!716045) b!1073627))

(assert (= (and b!1073623 res!716047) b!1073626))

(assert (= (and b!1073626 c!107747) b!1073625))

(assert (= (and b!1073626 (not c!107747)) b!1073624))

(assert (= (or b!1073625 b!1073624) bm!45280))

(assert (=> b!1073623 m!992559))

(assert (=> b!1073623 m!992559))

(assert (=> b!1073623 m!992569))

(assert (=> bm!45280 m!992559))

(declare-fun m!992571 () Bool)

(assert (=> bm!45280 m!992571))

(assert (=> b!1073626 m!992559))

(assert (=> b!1073626 m!992559))

(assert (=> b!1073626 m!992569))

(assert (=> b!1073627 m!992559))

(assert (=> b!1073627 m!992559))

(declare-fun m!992573 () Bool)

(assert (=> b!1073627 m!992573))

(assert (=> b!1073578 d!129425))

(declare-fun d!129427 () Bool)

(assert (=> d!129427 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94950 d!129427))

(declare-fun d!129429 () Bool)

(assert (=> d!129429 (= (array_inv!25612 _values!955) (bvsge (size!33675 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94950 d!129429))

(declare-fun d!129431 () Bool)

(assert (=> d!129431 (= (array_inv!25613 _keys!1163) (bvsge (size!33676 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94950 d!129431))

(declare-fun b!1073652 () Bool)

(declare-fun e!613412 () Bool)

(declare-fun e!613413 () Bool)

(assert (=> b!1073652 (= e!613412 e!613413)))

(assert (=> b!1073652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(declare-fun res!716056 () Bool)

(declare-fun lt!476120 () ListLongMap!14565)

(declare-fun contains!6329 (ListLongMap!14565 (_ BitVec 64)) Bool)

(assert (=> b!1073652 (= res!716056 (contains!6329 lt!476120 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073652 (=> (not res!716056) (not e!613413))))

(declare-fun bm!45283 () Bool)

(declare-fun call!45286 () ListLongMap!14565)

(assert (=> bm!45283 (= call!45286 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073653 () Bool)

(declare-fun e!613409 () ListLongMap!14565)

(assert (=> b!1073653 (= e!613409 call!45286)))

(declare-fun b!1073654 () Bool)

(declare-fun e!613410 () ListLongMap!14565)

(assert (=> b!1073654 (= e!613410 e!613409)))

(declare-fun c!107759 () Bool)

(assert (=> b!1073654 (= c!107759 (validKeyInArray!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129433 () Bool)

(declare-fun e!613414 () Bool)

(assert (=> d!129433 e!613414))

(declare-fun res!716057 () Bool)

(assert (=> d!129433 (=> (not res!716057) (not e!613414))))

(assert (=> d!129433 (= res!716057 (not (contains!6329 lt!476120 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129433 (= lt!476120 e!613410)))

(declare-fun c!107757 () Bool)

(assert (=> d!129433 (= c!107757 (bvsge #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(assert (=> d!129433 (validMask!0 mask!1515)))

(assert (=> d!129433 (= (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476120)))

(declare-fun b!1073655 () Bool)

(assert (=> b!1073655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(assert (=> b!1073655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33675 _values!955)))))

(declare-fun apply!932 (ListLongMap!14565 (_ BitVec 64)) V!39755)

(declare-fun get!17212 (ValueCell!12279 V!39755) V!39755)

(declare-fun dynLambda!2039 (Int (_ BitVec 64)) V!39755)

(assert (=> b!1073655 (= e!613413 (= (apply!932 lt!476120 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)) (get!17212 (select (arr!33139 _values!955) #b00000000000000000000000000000000) (dynLambda!2039 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073656 () Bool)

(assert (=> b!1073656 (= e!613410 (ListLongMap!14566 Nil!23131))))

(declare-fun b!1073657 () Bool)

(declare-fun e!613415 () Bool)

(declare-fun isEmpty!950 (ListLongMap!14565) Bool)

(assert (=> b!1073657 (= e!613415 (isEmpty!950 lt!476120))))

(declare-fun b!1073658 () Bool)

(declare-fun e!613411 () Bool)

(assert (=> b!1073658 (= e!613411 (validKeyInArray!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073658 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073659 () Bool)

(assert (=> b!1073659 (= e!613412 e!613415)))

(declare-fun c!107756 () Bool)

(assert (=> b!1073659 (= c!107756 (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(declare-fun b!1073660 () Bool)

(declare-fun lt!476118 () Unit!35354)

(declare-fun lt!476117 () Unit!35354)

(assert (=> b!1073660 (= lt!476118 lt!476117)))

(declare-fun lt!476121 () (_ BitVec 64))

(declare-fun lt!476122 () V!39755)

(declare-fun lt!476116 () ListLongMap!14565)

(declare-fun lt!476119 () (_ BitVec 64))

(declare-fun +!3212 (ListLongMap!14565 tuple2!16596) ListLongMap!14565)

(assert (=> b!1073660 (not (contains!6329 (+!3212 lt!476116 (tuple2!16597 lt!476121 lt!476122)) lt!476119))))

(declare-fun addStillNotContains!260 (ListLongMap!14565 (_ BitVec 64) V!39755 (_ BitVec 64)) Unit!35354)

(assert (=> b!1073660 (= lt!476117 (addStillNotContains!260 lt!476116 lt!476121 lt!476122 lt!476119))))

(assert (=> b!1073660 (= lt!476119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073660 (= lt!476122 (get!17212 (select (arr!33139 _values!955) #b00000000000000000000000000000000) (dynLambda!2039 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073660 (= lt!476121 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073660 (= lt!476116 call!45286)))

(assert (=> b!1073660 (= e!613409 (+!3212 call!45286 (tuple2!16597 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000) (get!17212 (select (arr!33139 _values!955) #b00000000000000000000000000000000) (dynLambda!2039 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073661 () Bool)

(assert (=> b!1073661 (= e!613414 e!613412)))

(declare-fun c!107758 () Bool)

(assert (=> b!1073661 (= c!107758 e!613411)))

(declare-fun res!716058 () Bool)

(assert (=> b!1073661 (=> (not res!716058) (not e!613411))))

(assert (=> b!1073661 (= res!716058 (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(declare-fun b!1073662 () Bool)

(assert (=> b!1073662 (= e!613415 (= lt!476120 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073663 () Bool)

(declare-fun res!716059 () Bool)

(assert (=> b!1073663 (=> (not res!716059) (not e!613414))))

(assert (=> b!1073663 (= res!716059 (not (contains!6329 lt!476120 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129433 c!107757) b!1073656))

(assert (= (and d!129433 (not c!107757)) b!1073654))

(assert (= (and b!1073654 c!107759) b!1073660))

(assert (= (and b!1073654 (not c!107759)) b!1073653))

(assert (= (or b!1073660 b!1073653) bm!45283))

(assert (= (and d!129433 res!716057) b!1073663))

(assert (= (and b!1073663 res!716059) b!1073661))

(assert (= (and b!1073661 res!716058) b!1073658))

(assert (= (and b!1073661 c!107758) b!1073652))

(assert (= (and b!1073661 (not c!107758)) b!1073659))

(assert (= (and b!1073652 res!716056) b!1073655))

(assert (= (and b!1073659 c!107756) b!1073662))

(assert (= (and b!1073659 (not c!107756)) b!1073657))

(declare-fun b_lambda!16725 () Bool)

(assert (=> (not b_lambda!16725) (not b!1073655)))

(declare-fun t!32476 () Bool)

(declare-fun tb!7159 () Bool)

(assert (=> (and start!94950 (= defaultEntry!963 defaultEntry!963) t!32476) tb!7159))

(declare-fun result!14785 () Bool)

(assert (=> tb!7159 (= result!14785 tp_is_empty!25965)))

(assert (=> b!1073655 t!32476))

(declare-fun b_and!35013 () Bool)

(assert (= b_and!35009 (and (=> t!32476 result!14785) b_and!35013)))

(declare-fun b_lambda!16727 () Bool)

(assert (=> (not b_lambda!16727) (not b!1073660)))

(assert (=> b!1073660 t!32476))

(declare-fun b_and!35015 () Bool)

(assert (= b_and!35013 (and (=> t!32476 result!14785) b_and!35015)))

(assert (=> b!1073654 m!992559))

(assert (=> b!1073654 m!992559))

(assert (=> b!1073654 m!992569))

(declare-fun m!992575 () Bool)

(assert (=> b!1073663 m!992575))

(declare-fun m!992577 () Bool)

(assert (=> b!1073657 m!992577))

(assert (=> b!1073652 m!992559))

(assert (=> b!1073652 m!992559))

(declare-fun m!992579 () Bool)

(assert (=> b!1073652 m!992579))

(declare-fun m!992581 () Bool)

(assert (=> bm!45283 m!992581))

(declare-fun m!992583 () Bool)

(assert (=> b!1073660 m!992583))

(declare-fun m!992585 () Bool)

(assert (=> b!1073660 m!992585))

(declare-fun m!992587 () Bool)

(assert (=> b!1073660 m!992587))

(assert (=> b!1073660 m!992587))

(assert (=> b!1073660 m!992585))

(declare-fun m!992589 () Bool)

(assert (=> b!1073660 m!992589))

(declare-fun m!992591 () Bool)

(assert (=> b!1073660 m!992591))

(declare-fun m!992593 () Bool)

(assert (=> b!1073660 m!992593))

(assert (=> b!1073660 m!992591))

(assert (=> b!1073660 m!992559))

(declare-fun m!992595 () Bool)

(assert (=> b!1073660 m!992595))

(assert (=> b!1073655 m!992559))

(declare-fun m!992597 () Bool)

(assert (=> b!1073655 m!992597))

(assert (=> b!1073655 m!992585))

(assert (=> b!1073655 m!992587))

(assert (=> b!1073655 m!992587))

(assert (=> b!1073655 m!992585))

(assert (=> b!1073655 m!992589))

(assert (=> b!1073655 m!992559))

(assert (=> b!1073658 m!992559))

(assert (=> b!1073658 m!992559))

(assert (=> b!1073658 m!992569))

(assert (=> b!1073662 m!992581))

(declare-fun m!992599 () Bool)

(assert (=> d!129433 m!992599))

(assert (=> d!129433 m!992527))

(assert (=> b!1073576 d!129433))

(declare-fun b!1073666 () Bool)

(declare-fun e!613419 () Bool)

(declare-fun e!613420 () Bool)

(assert (=> b!1073666 (= e!613419 e!613420)))

(assert (=> b!1073666 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(declare-fun res!716060 () Bool)

(declare-fun lt!476127 () ListLongMap!14565)

(assert (=> b!1073666 (= res!716060 (contains!6329 lt!476127 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073666 (=> (not res!716060) (not e!613420))))

(declare-fun bm!45284 () Bool)

(declare-fun call!45287 () ListLongMap!14565)

(assert (=> bm!45284 (= call!45287 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073667 () Bool)

(declare-fun e!613416 () ListLongMap!14565)

(assert (=> b!1073667 (= e!613416 call!45287)))

(declare-fun b!1073668 () Bool)

(declare-fun e!613417 () ListLongMap!14565)

(assert (=> b!1073668 (= e!613417 e!613416)))

(declare-fun c!107763 () Bool)

(assert (=> b!1073668 (= c!107763 (validKeyInArray!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129435 () Bool)

(declare-fun e!613421 () Bool)

(assert (=> d!129435 e!613421))

(declare-fun res!716061 () Bool)

(assert (=> d!129435 (=> (not res!716061) (not e!613421))))

(assert (=> d!129435 (= res!716061 (not (contains!6329 lt!476127 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129435 (= lt!476127 e!613417)))

(declare-fun c!107761 () Bool)

(assert (=> d!129435 (= c!107761 (bvsge #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(assert (=> d!129435 (validMask!0 mask!1515)))

(assert (=> d!129435 (= (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476127)))

(declare-fun b!1073669 () Bool)

(assert (=> b!1073669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(assert (=> b!1073669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33675 _values!955)))))

(assert (=> b!1073669 (= e!613420 (= (apply!932 lt!476127 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)) (get!17212 (select (arr!33139 _values!955) #b00000000000000000000000000000000) (dynLambda!2039 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073670 () Bool)

(assert (=> b!1073670 (= e!613417 (ListLongMap!14566 Nil!23131))))

(declare-fun b!1073671 () Bool)

(declare-fun e!613422 () Bool)

(assert (=> b!1073671 (= e!613422 (isEmpty!950 lt!476127))))

(declare-fun b!1073672 () Bool)

(declare-fun e!613418 () Bool)

(assert (=> b!1073672 (= e!613418 (validKeyInArray!0 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073672 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073673 () Bool)

(assert (=> b!1073673 (= e!613419 e!613422)))

(declare-fun c!107760 () Bool)

(assert (=> b!1073673 (= c!107760 (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(declare-fun b!1073674 () Bool)

(declare-fun lt!476125 () Unit!35354)

(declare-fun lt!476124 () Unit!35354)

(assert (=> b!1073674 (= lt!476125 lt!476124)))

(declare-fun lt!476123 () ListLongMap!14565)

(declare-fun lt!476126 () (_ BitVec 64))

(declare-fun lt!476129 () V!39755)

(declare-fun lt!476128 () (_ BitVec 64))

(assert (=> b!1073674 (not (contains!6329 (+!3212 lt!476123 (tuple2!16597 lt!476128 lt!476129)) lt!476126))))

(assert (=> b!1073674 (= lt!476124 (addStillNotContains!260 lt!476123 lt!476128 lt!476129 lt!476126))))

(assert (=> b!1073674 (= lt!476126 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073674 (= lt!476129 (get!17212 (select (arr!33139 _values!955) #b00000000000000000000000000000000) (dynLambda!2039 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073674 (= lt!476128 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073674 (= lt!476123 call!45287)))

(assert (=> b!1073674 (= e!613416 (+!3212 call!45287 (tuple2!16597 (select (arr!33140 _keys!1163) #b00000000000000000000000000000000) (get!17212 (select (arr!33139 _values!955) #b00000000000000000000000000000000) (dynLambda!2039 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073675 () Bool)

(assert (=> b!1073675 (= e!613421 e!613419)))

(declare-fun c!107762 () Bool)

(assert (=> b!1073675 (= c!107762 e!613418)))

(declare-fun res!716062 () Bool)

(assert (=> b!1073675 (=> (not res!716062) (not e!613418))))

(assert (=> b!1073675 (= res!716062 (bvslt #b00000000000000000000000000000000 (size!33676 _keys!1163)))))

(declare-fun b!1073676 () Bool)

(assert (=> b!1073676 (= e!613422 (= lt!476127 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073677 () Bool)

(declare-fun res!716063 () Bool)

(assert (=> b!1073677 (=> (not res!716063) (not e!613421))))

(assert (=> b!1073677 (= res!716063 (not (contains!6329 lt!476127 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129435 c!107761) b!1073670))

(assert (= (and d!129435 (not c!107761)) b!1073668))

(assert (= (and b!1073668 c!107763) b!1073674))

(assert (= (and b!1073668 (not c!107763)) b!1073667))

(assert (= (or b!1073674 b!1073667) bm!45284))

(assert (= (and d!129435 res!716061) b!1073677))

(assert (= (and b!1073677 res!716063) b!1073675))

(assert (= (and b!1073675 res!716062) b!1073672))

(assert (= (and b!1073675 c!107762) b!1073666))

(assert (= (and b!1073675 (not c!107762)) b!1073673))

(assert (= (and b!1073666 res!716060) b!1073669))

(assert (= (and b!1073673 c!107760) b!1073676))

(assert (= (and b!1073673 (not c!107760)) b!1073671))

(declare-fun b_lambda!16729 () Bool)

(assert (=> (not b_lambda!16729) (not b!1073669)))

(assert (=> b!1073669 t!32476))

(declare-fun b_and!35017 () Bool)

(assert (= b_and!35015 (and (=> t!32476 result!14785) b_and!35017)))

(declare-fun b_lambda!16731 () Bool)

(assert (=> (not b_lambda!16731) (not b!1073674)))

(assert (=> b!1073674 t!32476))

(declare-fun b_and!35019 () Bool)

(assert (= b_and!35017 (and (=> t!32476 result!14785) b_and!35019)))

(assert (=> b!1073668 m!992559))

(assert (=> b!1073668 m!992559))

(assert (=> b!1073668 m!992569))

(declare-fun m!992601 () Bool)

(assert (=> b!1073677 m!992601))

(declare-fun m!992603 () Bool)

(assert (=> b!1073671 m!992603))

(assert (=> b!1073666 m!992559))

(assert (=> b!1073666 m!992559))

(declare-fun m!992605 () Bool)

(assert (=> b!1073666 m!992605))

(declare-fun m!992607 () Bool)

(assert (=> bm!45284 m!992607))

(declare-fun m!992609 () Bool)

(assert (=> b!1073674 m!992609))

(assert (=> b!1073674 m!992585))

(assert (=> b!1073674 m!992587))

(assert (=> b!1073674 m!992587))

(assert (=> b!1073674 m!992585))

(assert (=> b!1073674 m!992589))

(declare-fun m!992611 () Bool)

(assert (=> b!1073674 m!992611))

(declare-fun m!992613 () Bool)

(assert (=> b!1073674 m!992613))

(assert (=> b!1073674 m!992611))

(assert (=> b!1073674 m!992559))

(declare-fun m!992615 () Bool)

(assert (=> b!1073674 m!992615))

(assert (=> b!1073669 m!992559))

(declare-fun m!992617 () Bool)

(assert (=> b!1073669 m!992617))

(assert (=> b!1073669 m!992585))

(assert (=> b!1073669 m!992587))

(assert (=> b!1073669 m!992587))

(assert (=> b!1073669 m!992585))

(assert (=> b!1073669 m!992589))

(assert (=> b!1073669 m!992559))

(assert (=> b!1073672 m!992559))

(assert (=> b!1073672 m!992559))

(assert (=> b!1073672 m!992569))

(assert (=> b!1073676 m!992607))

(declare-fun m!992619 () Bool)

(assert (=> d!129435 m!992619))

(assert (=> d!129435 m!992527))

(assert (=> b!1073576 d!129435))

(declare-fun mapIsEmpty!40666 () Bool)

(declare-fun mapRes!40666 () Bool)

(assert (=> mapIsEmpty!40666 mapRes!40666))

(declare-fun b!1073684 () Bool)

(declare-fun e!613428 () Bool)

(assert (=> b!1073684 (= e!613428 tp_is_empty!25965)))

(declare-fun mapNonEmpty!40666 () Bool)

(declare-fun tp!77939 () Bool)

(assert (=> mapNonEmpty!40666 (= mapRes!40666 (and tp!77939 e!613428))))

(declare-fun mapValue!40666 () ValueCell!12279)

(declare-fun mapKey!40666 () (_ BitVec 32))

(declare-fun mapRest!40666 () (Array (_ BitVec 32) ValueCell!12279))

(assert (=> mapNonEmpty!40666 (= mapRest!40660 (store mapRest!40666 mapKey!40666 mapValue!40666))))

(declare-fun b!1073685 () Bool)

(declare-fun e!613427 () Bool)

(assert (=> b!1073685 (= e!613427 tp_is_empty!25965)))

(declare-fun condMapEmpty!40666 () Bool)

(declare-fun mapDefault!40666 () ValueCell!12279)

(assert (=> mapNonEmpty!40660 (= condMapEmpty!40666 (= mapRest!40660 ((as const (Array (_ BitVec 32) ValueCell!12279)) mapDefault!40666)))))

(assert (=> mapNonEmpty!40660 (= tp!77930 (and e!613427 mapRes!40666))))

(assert (= (and mapNonEmpty!40660 condMapEmpty!40666) mapIsEmpty!40666))

(assert (= (and mapNonEmpty!40660 (not condMapEmpty!40666)) mapNonEmpty!40666))

(assert (= (and mapNonEmpty!40666 ((_ is ValueCellFull!12279) mapValue!40666)) b!1073684))

(assert (= (and mapNonEmpty!40660 ((_ is ValueCellFull!12279) mapDefault!40666)) b!1073685))

(declare-fun m!992621 () Bool)

(assert (=> mapNonEmpty!40666 m!992621))

(declare-fun b_lambda!16733 () Bool)

(assert (= b_lambda!16729 (or (and start!94950 b_free!22155) b_lambda!16733)))

(declare-fun b_lambda!16735 () Bool)

(assert (= b_lambda!16731 (or (and start!94950 b_free!22155) b_lambda!16735)))

(declare-fun b_lambda!16737 () Bool)

(assert (= b_lambda!16725 (or (and start!94950 b_free!22155) b_lambda!16737)))

(declare-fun b_lambda!16739 () Bool)

(assert (= b_lambda!16727 (or (and start!94950 b_free!22155) b_lambda!16739)))

(check-sat (not b!1073655) (not b_lambda!16737) (not b!1073658) (not b_lambda!16735) (not mapNonEmpty!40666) (not bm!45284) (not b!1073663) (not b!1073668) (not b!1073610) (not b!1073666) (not b!1073674) (not b_next!22155) (not bm!45280) (not b!1073657) (not b!1073671) b_and!35019 (not bm!45283) (not b!1073623) (not b!1073676) (not b!1073662) (not d!129433) (not d!129435) (not b!1073677) (not b!1073611) (not b!1073669) (not b_lambda!16733) (not b!1073660) (not b!1073672) (not b!1073627) (not b!1073626) (not bm!45277) (not b!1073654) tp_is_empty!25965 (not b_lambda!16739) (not b!1073652))
(check-sat b_and!35019 (not b_next!22155))
