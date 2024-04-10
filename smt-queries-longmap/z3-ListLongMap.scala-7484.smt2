; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94854 () Bool)

(assert start!94854)

(declare-fun b_free!22083 () Bool)

(declare-fun b_next!22083 () Bool)

(assert (=> start!94854 (= b_free!22083 (not b_next!22083))))

(declare-fun tp!77711 () Bool)

(declare-fun b_and!34925 () Bool)

(assert (=> start!94854 (= tp!77711 b_and!34925)))

(declare-datatypes ((V!39659 0))(
  ( (V!39660 (val!12997 Int)) )
))
(declare-datatypes ((tuple2!16554 0))(
  ( (tuple2!16555 (_1!8288 (_ BitVec 64)) (_2!8288 V!39659)) )
))
(declare-datatypes ((List!23088 0))(
  ( (Nil!23085) (Cons!23084 (h!24293 tuple2!16554) (t!32423 List!23088)) )
))
(declare-datatypes ((ListLongMap!14523 0))(
  ( (ListLongMap!14524 (toList!7277 List!23088)) )
))
(declare-fun lt!475660 () ListLongMap!14523)

(declare-fun b!1072622 () Bool)

(declare-fun lt!475659 () tuple2!16554)

(declare-fun lt!475662 () ListLongMap!14523)

(declare-fun e!612688 () Bool)

(declare-fun +!3211 (ListLongMap!14523 tuple2!16554) ListLongMap!14523)

(assert (=> b!1072622 (= e!612688 (= lt!475662 (+!3211 lt!475660 lt!475659)))))

(declare-fun b!1072623 () Bool)

(declare-fun e!612695 () Bool)

(declare-fun tp_is_empty!25893 () Bool)

(assert (=> b!1072623 (= e!612695 tp_is_empty!25893)))

(declare-fun b!1072624 () Bool)

(declare-fun e!612691 () Bool)

(declare-datatypes ((array!68753 0))(
  ( (array!68754 (arr!33071 (Array (_ BitVec 32) (_ BitVec 64))) (size!33607 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68753)

(assert (=> b!1072624 (= e!612691 (bvsle #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun mapNonEmpty!40549 () Bool)

(declare-fun mapRes!40549 () Bool)

(declare-fun tp!77710 () Bool)

(declare-fun e!612690 () Bool)

(assert (=> mapNonEmpty!40549 (= mapRes!40549 (and tp!77710 e!612690))))

(declare-datatypes ((ValueCell!12243 0))(
  ( (ValueCellFull!12243 (v!15614 V!39659)) (EmptyCell!12243) )
))
(declare-fun mapRest!40549 () (Array (_ BitVec 32) ValueCell!12243))

(declare-fun mapValue!40549 () ValueCell!12243)

(declare-datatypes ((array!68755 0))(
  ( (array!68756 (arr!33072 (Array (_ BitVec 32) ValueCell!12243)) (size!33608 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68755)

(declare-fun mapKey!40549 () (_ BitVec 32))

(assert (=> mapNonEmpty!40549 (= (arr!33072 _values!955) (store mapRest!40549 mapKey!40549 mapValue!40549))))

(declare-fun b!1072625 () Bool)

(declare-fun e!612693 () Bool)

(assert (=> b!1072625 (= e!612693 e!612691)))

(declare-fun res!715498 () Bool)

(assert (=> b!1072625 (=> res!715498 e!612691)))

(declare-fun lt!475663 () ListLongMap!14523)

(declare-fun -!705 (ListLongMap!14523 (_ BitVec 64)) ListLongMap!14523)

(assert (=> b!1072625 (= res!715498 (not (= (-!705 lt!475663 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475662)))))

(declare-fun lt!475656 () ListLongMap!14523)

(declare-fun lt!475661 () ListLongMap!14523)

(assert (=> b!1072625 (= lt!475656 lt!475661)))

(declare-fun zeroValueBefore!47 () V!39659)

(declare-fun lt!475665 () ListLongMap!14523)

(declare-fun minValue!907 () V!39659)

(declare-datatypes ((Unit!35348 0))(
  ( (Unit!35349) )
))
(declare-fun lt!475664 () Unit!35348)

(declare-fun addCommutativeForDiffKeys!750 (ListLongMap!14523 (_ BitVec 64) V!39659 (_ BitVec 64) V!39659) Unit!35348)

(assert (=> b!1072625 (= lt!475664 (addCommutativeForDiffKeys!750 lt!475665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475658 () ListLongMap!14523)

(assert (=> b!1072625 (= (-!705 lt!475661 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475658)))

(declare-fun lt!475657 () tuple2!16554)

(assert (=> b!1072625 (= lt!475661 (+!3211 lt!475658 lt!475657))))

(declare-fun lt!475654 () Unit!35348)

(declare-fun addThenRemoveForNewKeyIsSame!75 (ListLongMap!14523 (_ BitVec 64) V!39659) Unit!35348)

(assert (=> b!1072625 (= lt!475654 (addThenRemoveForNewKeyIsSame!75 lt!475658 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1072625 (= lt!475658 (+!3211 lt!475665 lt!475659))))

(assert (=> b!1072625 e!612688))

(declare-fun res!715495 () Bool)

(assert (=> b!1072625 (=> (not res!715495) (not e!612688))))

(assert (=> b!1072625 (= res!715495 (= lt!475663 lt!475656))))

(assert (=> b!1072625 (= lt!475656 (+!3211 (+!3211 lt!475665 lt!475657) lt!475659))))

(assert (=> b!1072625 (= lt!475659 (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072625 (= lt!475657 (tuple2!16555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39659)

(declare-fun getCurrentListMap!4171 (array!68753 array!68755 (_ BitVec 32) (_ BitVec 32) V!39659 V!39659 (_ BitVec 32) Int) ListLongMap!14523)

(assert (=> b!1072625 (= lt!475662 (getCurrentListMap!4171 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072625 (= lt!475663 (getCurrentListMap!4171 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072626 () Bool)

(declare-fun e!612694 () Bool)

(assert (=> b!1072626 (= e!612694 (not e!612693))))

(declare-fun res!715493 () Bool)

(assert (=> b!1072626 (=> res!715493 e!612693)))

(assert (=> b!1072626 (= res!715493 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1072626 (= lt!475665 lt!475660)))

(declare-fun lt!475655 () Unit!35348)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!878 (array!68753 array!68755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39659 V!39659 V!39659 V!39659 (_ BitVec 32) Int) Unit!35348)

(assert (=> b!1072626 (= lt!475655 (lemmaNoChangeToArrayThenSameMapNoExtras!878 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3841 (array!68753 array!68755 (_ BitVec 32) (_ BitVec 32) V!39659 V!39659 (_ BitVec 32) Int) ListLongMap!14523)

(assert (=> b!1072626 (= lt!475660 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072626 (= lt!475665 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40549 () Bool)

(assert (=> mapIsEmpty!40549 mapRes!40549))

(declare-fun b!1072627 () Bool)

(declare-fun e!612692 () Bool)

(assert (=> b!1072627 (= e!612692 (and e!612695 mapRes!40549))))

(declare-fun condMapEmpty!40549 () Bool)

(declare-fun mapDefault!40549 () ValueCell!12243)

(assert (=> b!1072627 (= condMapEmpty!40549 (= (arr!33072 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12243)) mapDefault!40549)))))

(declare-fun b!1072628 () Bool)

(assert (=> b!1072628 (= e!612690 tp_is_empty!25893)))

(declare-fun b!1072629 () Bool)

(declare-fun res!715492 () Bool)

(assert (=> b!1072629 (=> (not res!715492) (not e!612694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68753 (_ BitVec 32)) Bool)

(assert (=> b!1072629 (= res!715492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072630 () Bool)

(declare-fun res!715496 () Bool)

(assert (=> b!1072630 (=> (not res!715496) (not e!612694))))

(assert (=> b!1072630 (= res!715496 (and (= (size!33608 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33607 _keys!1163) (size!33608 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072631 () Bool)

(declare-fun res!715494 () Bool)

(assert (=> b!1072631 (=> (not res!715494) (not e!612694))))

(declare-datatypes ((List!23089 0))(
  ( (Nil!23086) (Cons!23085 (h!24294 (_ BitVec 64)) (t!32424 List!23089)) )
))
(declare-fun arrayNoDuplicates!0 (array!68753 (_ BitVec 32) List!23089) Bool)

(assert (=> b!1072631 (= res!715494 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23086))))

(declare-fun res!715497 () Bool)

(assert (=> start!94854 (=> (not res!715497) (not e!612694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94854 (= res!715497 (validMask!0 mask!1515))))

(assert (=> start!94854 e!612694))

(assert (=> start!94854 true))

(assert (=> start!94854 tp_is_empty!25893))

(declare-fun array_inv!25564 (array!68755) Bool)

(assert (=> start!94854 (and (array_inv!25564 _values!955) e!612692)))

(assert (=> start!94854 tp!77711))

(declare-fun array_inv!25565 (array!68753) Bool)

(assert (=> start!94854 (array_inv!25565 _keys!1163)))

(assert (= (and start!94854 res!715497) b!1072630))

(assert (= (and b!1072630 res!715496) b!1072629))

(assert (= (and b!1072629 res!715492) b!1072631))

(assert (= (and b!1072631 res!715494) b!1072626))

(assert (= (and b!1072626 (not res!715493)) b!1072625))

(assert (= (and b!1072625 res!715495) b!1072622))

(assert (= (and b!1072625 (not res!715498)) b!1072624))

(assert (= (and b!1072627 condMapEmpty!40549) mapIsEmpty!40549))

(assert (= (and b!1072627 (not condMapEmpty!40549)) mapNonEmpty!40549))

(get-info :version)

(assert (= (and mapNonEmpty!40549 ((_ is ValueCellFull!12243) mapValue!40549)) b!1072628))

(assert (= (and b!1072627 ((_ is ValueCellFull!12243) mapDefault!40549)) b!1072623))

(assert (= start!94854 b!1072627))

(declare-fun m!991653 () Bool)

(assert (=> b!1072625 m!991653))

(declare-fun m!991655 () Bool)

(assert (=> b!1072625 m!991655))

(declare-fun m!991657 () Bool)

(assert (=> b!1072625 m!991657))

(declare-fun m!991659 () Bool)

(assert (=> b!1072625 m!991659))

(declare-fun m!991661 () Bool)

(assert (=> b!1072625 m!991661))

(assert (=> b!1072625 m!991659))

(declare-fun m!991663 () Bool)

(assert (=> b!1072625 m!991663))

(declare-fun m!991665 () Bool)

(assert (=> b!1072625 m!991665))

(declare-fun m!991667 () Bool)

(assert (=> b!1072625 m!991667))

(declare-fun m!991669 () Bool)

(assert (=> b!1072625 m!991669))

(declare-fun m!991671 () Bool)

(assert (=> b!1072625 m!991671))

(declare-fun m!991673 () Bool)

(assert (=> b!1072631 m!991673))

(declare-fun m!991675 () Bool)

(assert (=> b!1072622 m!991675))

(declare-fun m!991677 () Bool)

(assert (=> b!1072626 m!991677))

(declare-fun m!991679 () Bool)

(assert (=> b!1072626 m!991679))

(declare-fun m!991681 () Bool)

(assert (=> b!1072626 m!991681))

(declare-fun m!991683 () Bool)

(assert (=> b!1072629 m!991683))

(declare-fun m!991685 () Bool)

(assert (=> mapNonEmpty!40549 m!991685))

(declare-fun m!991687 () Bool)

(assert (=> start!94854 m!991687))

(declare-fun m!991689 () Bool)

(assert (=> start!94854 m!991689))

(declare-fun m!991691 () Bool)

(assert (=> start!94854 m!991691))

(check-sat (not b_next!22083) (not mapNonEmpty!40549) (not b!1072622) tp_is_empty!25893 (not b!1072629) (not b!1072625) (not b!1072631) b_and!34925 (not b!1072626) (not start!94854))
(check-sat b_and!34925 (not b_next!22083))
(get-model)

(declare-fun b!1072672 () Bool)

(declare-fun e!612730 () Bool)

(declare-fun call!45242 () Bool)

(assert (=> b!1072672 (= e!612730 call!45242)))

(declare-fun b!1072673 () Bool)

(declare-fun e!612729 () Bool)

(declare-fun contains!6325 (List!23089 (_ BitVec 64)) Bool)

(assert (=> b!1072673 (= e!612729 (contains!6325 Nil!23086 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072674 () Bool)

(assert (=> b!1072674 (= e!612730 call!45242)))

(declare-fun b!1072675 () Bool)

(declare-fun e!612728 () Bool)

(assert (=> b!1072675 (= e!612728 e!612730)))

(declare-fun c!107698 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1072675 (= c!107698 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072676 () Bool)

(declare-fun e!612731 () Bool)

(assert (=> b!1072676 (= e!612731 e!612728)))

(declare-fun res!715527 () Bool)

(assert (=> b!1072676 (=> (not res!715527) (not e!612728))))

(assert (=> b!1072676 (= res!715527 (not e!612729))))

(declare-fun res!715526 () Bool)

(assert (=> b!1072676 (=> (not res!715526) (not e!612729))))

(assert (=> b!1072676 (= res!715526 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45239 () Bool)

(assert (=> bm!45239 (= call!45242 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107698 (Cons!23085 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000) Nil!23086) Nil!23086)))))

(declare-fun d!129361 () Bool)

(declare-fun res!715528 () Bool)

(assert (=> d!129361 (=> res!715528 e!612731)))

(assert (=> d!129361 (= res!715528 (bvsge #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> d!129361 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23086) e!612731)))

(assert (= (and d!129361 (not res!715528)) b!1072676))

(assert (= (and b!1072676 res!715526) b!1072673))

(assert (= (and b!1072676 res!715527) b!1072675))

(assert (= (and b!1072675 c!107698) b!1072672))

(assert (= (and b!1072675 (not c!107698)) b!1072674))

(assert (= (or b!1072672 b!1072674) bm!45239))

(declare-fun m!991733 () Bool)

(assert (=> b!1072673 m!991733))

(assert (=> b!1072673 m!991733))

(declare-fun m!991735 () Bool)

(assert (=> b!1072673 m!991735))

(assert (=> b!1072675 m!991733))

(assert (=> b!1072675 m!991733))

(declare-fun m!991737 () Bool)

(assert (=> b!1072675 m!991737))

(assert (=> b!1072676 m!991733))

(assert (=> b!1072676 m!991733))

(assert (=> b!1072676 m!991737))

(assert (=> bm!45239 m!991733))

(declare-fun m!991739 () Bool)

(assert (=> bm!45239 m!991739))

(assert (=> b!1072631 d!129361))

(declare-fun d!129363 () Bool)

(declare-fun e!612734 () Bool)

(assert (=> d!129363 e!612734))

(declare-fun res!715533 () Bool)

(assert (=> d!129363 (=> (not res!715533) (not e!612734))))

(declare-fun lt!475711 () ListLongMap!14523)

(declare-fun contains!6326 (ListLongMap!14523 (_ BitVec 64)) Bool)

(assert (=> d!129363 (= res!715533 (contains!6326 lt!475711 (_1!8288 lt!475659)))))

(declare-fun lt!475713 () List!23088)

(assert (=> d!129363 (= lt!475711 (ListLongMap!14524 lt!475713))))

(declare-fun lt!475712 () Unit!35348)

(declare-fun lt!475710 () Unit!35348)

(assert (=> d!129363 (= lt!475712 lt!475710)))

(declare-datatypes ((Option!655 0))(
  ( (Some!654 (v!15616 V!39659)) (None!653) )
))
(declare-fun getValueByKey!604 (List!23088 (_ BitVec 64)) Option!655)

(assert (=> d!129363 (= (getValueByKey!604 lt!475713 (_1!8288 lt!475659)) (Some!654 (_2!8288 lt!475659)))))

(declare-fun lemmaContainsTupThenGetReturnValue!285 (List!23088 (_ BitVec 64) V!39659) Unit!35348)

(assert (=> d!129363 (= lt!475710 (lemmaContainsTupThenGetReturnValue!285 lt!475713 (_1!8288 lt!475659) (_2!8288 lt!475659)))))

(declare-fun insertStrictlySorted!378 (List!23088 (_ BitVec 64) V!39659) List!23088)

(assert (=> d!129363 (= lt!475713 (insertStrictlySorted!378 (toList!7277 lt!475660) (_1!8288 lt!475659) (_2!8288 lt!475659)))))

(assert (=> d!129363 (= (+!3211 lt!475660 lt!475659) lt!475711)))

(declare-fun b!1072681 () Bool)

(declare-fun res!715534 () Bool)

(assert (=> b!1072681 (=> (not res!715534) (not e!612734))))

(assert (=> b!1072681 (= res!715534 (= (getValueByKey!604 (toList!7277 lt!475711) (_1!8288 lt!475659)) (Some!654 (_2!8288 lt!475659))))))

(declare-fun b!1072682 () Bool)

(declare-fun contains!6327 (List!23088 tuple2!16554) Bool)

(assert (=> b!1072682 (= e!612734 (contains!6327 (toList!7277 lt!475711) lt!475659))))

(assert (= (and d!129363 res!715533) b!1072681))

(assert (= (and b!1072681 res!715534) b!1072682))

(declare-fun m!991741 () Bool)

(assert (=> d!129363 m!991741))

(declare-fun m!991743 () Bool)

(assert (=> d!129363 m!991743))

(declare-fun m!991745 () Bool)

(assert (=> d!129363 m!991745))

(declare-fun m!991747 () Bool)

(assert (=> d!129363 m!991747))

(declare-fun m!991749 () Bool)

(assert (=> b!1072681 m!991749))

(declare-fun m!991751 () Bool)

(assert (=> b!1072682 m!991751))

(assert (=> b!1072622 d!129363))

(declare-fun d!129365 () Bool)

(assert (=> d!129365 (= (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475716 () Unit!35348)

(declare-fun choose!1744 (array!68753 array!68755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39659 V!39659 V!39659 V!39659 (_ BitVec 32) Int) Unit!35348)

(assert (=> d!129365 (= lt!475716 (choose!1744 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129365 (validMask!0 mask!1515)))

(assert (=> d!129365 (= (lemmaNoChangeToArrayThenSameMapNoExtras!878 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475716)))

(declare-fun bs!31607 () Bool)

(assert (= bs!31607 d!129365))

(assert (=> bs!31607 m!991681))

(assert (=> bs!31607 m!991679))

(declare-fun m!991753 () Bool)

(assert (=> bs!31607 m!991753))

(assert (=> bs!31607 m!991687))

(assert (=> b!1072626 d!129365))

(declare-fun b!1072707 () Bool)

(declare-fun e!612751 () Bool)

(declare-fun lt!475736 () ListLongMap!14523)

(declare-fun isEmpty!949 (ListLongMap!14523) Bool)

(assert (=> b!1072707 (= e!612751 (isEmpty!949 lt!475736))))

(declare-fun b!1072708 () Bool)

(declare-fun e!612754 () ListLongMap!14523)

(assert (=> b!1072708 (= e!612754 (ListLongMap!14524 Nil!23085))))

(declare-fun b!1072709 () Bool)

(declare-fun lt!475731 () Unit!35348)

(declare-fun lt!475735 () Unit!35348)

(assert (=> b!1072709 (= lt!475731 lt!475735)))

(declare-fun lt!475734 () V!39659)

(declare-fun lt!475733 () ListLongMap!14523)

(declare-fun lt!475737 () (_ BitVec 64))

(declare-fun lt!475732 () (_ BitVec 64))

(assert (=> b!1072709 (not (contains!6326 (+!3211 lt!475733 (tuple2!16555 lt!475737 lt!475734)) lt!475732))))

(declare-fun addStillNotContains!259 (ListLongMap!14523 (_ BitVec 64) V!39659 (_ BitVec 64)) Unit!35348)

(assert (=> b!1072709 (= lt!475735 (addStillNotContains!259 lt!475733 lt!475737 lt!475734 lt!475732))))

(assert (=> b!1072709 (= lt!475732 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17187 (ValueCell!12243 V!39659) V!39659)

(declare-fun dynLambda!2038 (Int (_ BitVec 64)) V!39659)

(assert (=> b!1072709 (= lt!475734 (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1072709 (= lt!475737 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45245 () ListLongMap!14523)

(assert (=> b!1072709 (= lt!475733 call!45245)))

(declare-fun e!612753 () ListLongMap!14523)

(assert (=> b!1072709 (= e!612753 (+!3211 call!45245 (tuple2!16555 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000) (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1072710 () Bool)

(declare-fun e!612749 () Bool)

(declare-fun e!612750 () Bool)

(assert (=> b!1072710 (= e!612749 e!612750)))

(assert (=> b!1072710 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun res!715543 () Bool)

(assert (=> b!1072710 (= res!715543 (contains!6326 lt!475736 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072710 (=> (not res!715543) (not e!612750))))

(declare-fun b!1072711 () Bool)

(assert (=> b!1072711 (= e!612751 (= lt!475736 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1072712 () Bool)

(declare-fun res!715544 () Bool)

(declare-fun e!612752 () Bool)

(assert (=> b!1072712 (=> (not res!715544) (not e!612752))))

(assert (=> b!1072712 (= res!715544 (not (contains!6326 lt!475736 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129367 () Bool)

(assert (=> d!129367 e!612752))

(declare-fun res!715545 () Bool)

(assert (=> d!129367 (=> (not res!715545) (not e!612752))))

(assert (=> d!129367 (= res!715545 (not (contains!6326 lt!475736 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129367 (= lt!475736 e!612754)))

(declare-fun c!107709 () Bool)

(assert (=> d!129367 (= c!107709 (bvsge #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> d!129367 (validMask!0 mask!1515)))

(assert (=> d!129367 (= (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475736)))

(declare-fun b!1072713 () Bool)

(assert (=> b!1072713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> b!1072713 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33608 _values!955)))))

(declare-fun apply!931 (ListLongMap!14523 (_ BitVec 64)) V!39659)

(assert (=> b!1072713 (= e!612750 (= (apply!931 lt!475736 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)) (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1072714 () Bool)

(assert (=> b!1072714 (= e!612752 e!612749)))

(declare-fun c!107708 () Bool)

(declare-fun e!612755 () Bool)

(assert (=> b!1072714 (= c!107708 e!612755)))

(declare-fun res!715546 () Bool)

(assert (=> b!1072714 (=> (not res!715546) (not e!612755))))

(assert (=> b!1072714 (= res!715546 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun bm!45242 () Bool)

(assert (=> bm!45242 (= call!45245 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1072715 () Bool)

(assert (=> b!1072715 (= e!612754 e!612753)))

(declare-fun c!107710 () Bool)

(assert (=> b!1072715 (= c!107710 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072716 () Bool)

(assert (=> b!1072716 (= e!612753 call!45245)))

(declare-fun b!1072717 () Bool)

(assert (=> b!1072717 (= e!612755 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072717 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1072718 () Bool)

(assert (=> b!1072718 (= e!612749 e!612751)))

(declare-fun c!107707 () Bool)

(assert (=> b!1072718 (= c!107707 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (= (and d!129367 c!107709) b!1072708))

(assert (= (and d!129367 (not c!107709)) b!1072715))

(assert (= (and b!1072715 c!107710) b!1072709))

(assert (= (and b!1072715 (not c!107710)) b!1072716))

(assert (= (or b!1072709 b!1072716) bm!45242))

(assert (= (and d!129367 res!715545) b!1072712))

(assert (= (and b!1072712 res!715544) b!1072714))

(assert (= (and b!1072714 res!715546) b!1072717))

(assert (= (and b!1072714 c!107708) b!1072710))

(assert (= (and b!1072714 (not c!107708)) b!1072718))

(assert (= (and b!1072710 res!715543) b!1072713))

(assert (= (and b!1072718 c!107707) b!1072711))

(assert (= (and b!1072718 (not c!107707)) b!1072707))

(declare-fun b_lambda!16701 () Bool)

(assert (=> (not b_lambda!16701) (not b!1072709)))

(declare-fun t!32427 () Bool)

(declare-fun tb!7157 () Bool)

(assert (=> (and start!94854 (= defaultEntry!963 defaultEntry!963) t!32427) tb!7157))

(declare-fun result!14779 () Bool)

(assert (=> tb!7157 (= result!14779 tp_is_empty!25893)))

(assert (=> b!1072709 t!32427))

(declare-fun b_and!34929 () Bool)

(assert (= b_and!34925 (and (=> t!32427 result!14779) b_and!34929)))

(declare-fun b_lambda!16703 () Bool)

(assert (=> (not b_lambda!16703) (not b!1072713)))

(assert (=> b!1072713 t!32427))

(declare-fun b_and!34931 () Bool)

(assert (= b_and!34929 (and (=> t!32427 result!14779) b_and!34931)))

(assert (=> b!1072715 m!991733))

(assert (=> b!1072715 m!991733))

(assert (=> b!1072715 m!991737))

(declare-fun m!991755 () Bool)

(assert (=> d!129367 m!991755))

(assert (=> d!129367 m!991687))

(declare-fun m!991757 () Bool)

(assert (=> b!1072709 m!991757))

(assert (=> b!1072709 m!991733))

(declare-fun m!991759 () Bool)

(assert (=> b!1072709 m!991759))

(declare-fun m!991761 () Bool)

(assert (=> b!1072709 m!991761))

(declare-fun m!991763 () Bool)

(assert (=> b!1072709 m!991763))

(declare-fun m!991765 () Bool)

(assert (=> b!1072709 m!991765))

(assert (=> b!1072709 m!991757))

(declare-fun m!991767 () Bool)

(assert (=> b!1072709 m!991767))

(assert (=> b!1072709 m!991761))

(declare-fun m!991769 () Bool)

(assert (=> b!1072709 m!991769))

(assert (=> b!1072709 m!991763))

(declare-fun m!991771 () Bool)

(assert (=> b!1072712 m!991771))

(declare-fun m!991773 () Bool)

(assert (=> bm!45242 m!991773))

(assert (=> b!1072710 m!991733))

(assert (=> b!1072710 m!991733))

(declare-fun m!991775 () Bool)

(assert (=> b!1072710 m!991775))

(assert (=> b!1072717 m!991733))

(assert (=> b!1072717 m!991733))

(assert (=> b!1072717 m!991737))

(assert (=> b!1072711 m!991773))

(assert (=> b!1072713 m!991733))

(assert (=> b!1072713 m!991733))

(declare-fun m!991777 () Bool)

(assert (=> b!1072713 m!991777))

(assert (=> b!1072713 m!991763))

(assert (=> b!1072713 m!991761))

(assert (=> b!1072713 m!991763))

(assert (=> b!1072713 m!991765))

(assert (=> b!1072713 m!991761))

(declare-fun m!991779 () Bool)

(assert (=> b!1072707 m!991779))

(assert (=> b!1072626 d!129367))

(declare-fun b!1072721 () Bool)

(declare-fun e!612758 () Bool)

(declare-fun lt!475743 () ListLongMap!14523)

(assert (=> b!1072721 (= e!612758 (isEmpty!949 lt!475743))))

(declare-fun b!1072722 () Bool)

(declare-fun e!612761 () ListLongMap!14523)

(assert (=> b!1072722 (= e!612761 (ListLongMap!14524 Nil!23085))))

(declare-fun b!1072723 () Bool)

(declare-fun lt!475738 () Unit!35348)

(declare-fun lt!475742 () Unit!35348)

(assert (=> b!1072723 (= lt!475738 lt!475742)))

(declare-fun lt!475740 () ListLongMap!14523)

(declare-fun lt!475744 () (_ BitVec 64))

(declare-fun lt!475741 () V!39659)

(declare-fun lt!475739 () (_ BitVec 64))

(assert (=> b!1072723 (not (contains!6326 (+!3211 lt!475740 (tuple2!16555 lt!475744 lt!475741)) lt!475739))))

(assert (=> b!1072723 (= lt!475742 (addStillNotContains!259 lt!475740 lt!475744 lt!475741 lt!475739))))

(assert (=> b!1072723 (= lt!475739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1072723 (= lt!475741 (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1072723 (= lt!475744 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45246 () ListLongMap!14523)

(assert (=> b!1072723 (= lt!475740 call!45246)))

(declare-fun e!612760 () ListLongMap!14523)

(assert (=> b!1072723 (= e!612760 (+!3211 call!45246 (tuple2!16555 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000) (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1072724 () Bool)

(declare-fun e!612756 () Bool)

(declare-fun e!612757 () Bool)

(assert (=> b!1072724 (= e!612756 e!612757)))

(assert (=> b!1072724 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun res!715547 () Bool)

(assert (=> b!1072724 (= res!715547 (contains!6326 lt!475743 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072724 (=> (not res!715547) (not e!612757))))

(declare-fun b!1072725 () Bool)

(assert (=> b!1072725 (= e!612758 (= lt!475743 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1072726 () Bool)

(declare-fun res!715548 () Bool)

(declare-fun e!612759 () Bool)

(assert (=> b!1072726 (=> (not res!715548) (not e!612759))))

(assert (=> b!1072726 (= res!715548 (not (contains!6326 lt!475743 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129369 () Bool)

(assert (=> d!129369 e!612759))

(declare-fun res!715549 () Bool)

(assert (=> d!129369 (=> (not res!715549) (not e!612759))))

(assert (=> d!129369 (= res!715549 (not (contains!6326 lt!475743 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129369 (= lt!475743 e!612761)))

(declare-fun c!107713 () Bool)

(assert (=> d!129369 (= c!107713 (bvsge #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> d!129369 (validMask!0 mask!1515)))

(assert (=> d!129369 (= (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475743)))

(declare-fun b!1072727 () Bool)

(assert (=> b!1072727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> b!1072727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33608 _values!955)))))

(assert (=> b!1072727 (= e!612757 (= (apply!931 lt!475743 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)) (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1072728 () Bool)

(assert (=> b!1072728 (= e!612759 e!612756)))

(declare-fun c!107712 () Bool)

(declare-fun e!612762 () Bool)

(assert (=> b!1072728 (= c!107712 e!612762)))

(declare-fun res!715550 () Bool)

(assert (=> b!1072728 (=> (not res!715550) (not e!612762))))

(assert (=> b!1072728 (= res!715550 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun bm!45243 () Bool)

(assert (=> bm!45243 (= call!45246 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1072729 () Bool)

(assert (=> b!1072729 (= e!612761 e!612760)))

(declare-fun c!107714 () Bool)

(assert (=> b!1072729 (= c!107714 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072730 () Bool)

(assert (=> b!1072730 (= e!612760 call!45246)))

(declare-fun b!1072731 () Bool)

(assert (=> b!1072731 (= e!612762 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072731 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1072732 () Bool)

(assert (=> b!1072732 (= e!612756 e!612758)))

(declare-fun c!107711 () Bool)

(assert (=> b!1072732 (= c!107711 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (= (and d!129369 c!107713) b!1072722))

(assert (= (and d!129369 (not c!107713)) b!1072729))

(assert (= (and b!1072729 c!107714) b!1072723))

(assert (= (and b!1072729 (not c!107714)) b!1072730))

(assert (= (or b!1072723 b!1072730) bm!45243))

(assert (= (and d!129369 res!715549) b!1072726))

(assert (= (and b!1072726 res!715548) b!1072728))

(assert (= (and b!1072728 res!715550) b!1072731))

(assert (= (and b!1072728 c!107712) b!1072724))

(assert (= (and b!1072728 (not c!107712)) b!1072732))

(assert (= (and b!1072724 res!715547) b!1072727))

(assert (= (and b!1072732 c!107711) b!1072725))

(assert (= (and b!1072732 (not c!107711)) b!1072721))

(declare-fun b_lambda!16705 () Bool)

(assert (=> (not b_lambda!16705) (not b!1072723)))

(assert (=> b!1072723 t!32427))

(declare-fun b_and!34933 () Bool)

(assert (= b_and!34931 (and (=> t!32427 result!14779) b_and!34933)))

(declare-fun b_lambda!16707 () Bool)

(assert (=> (not b_lambda!16707) (not b!1072727)))

(assert (=> b!1072727 t!32427))

(declare-fun b_and!34935 () Bool)

(assert (= b_and!34933 (and (=> t!32427 result!14779) b_and!34935)))

(assert (=> b!1072729 m!991733))

(assert (=> b!1072729 m!991733))

(assert (=> b!1072729 m!991737))

(declare-fun m!991781 () Bool)

(assert (=> d!129369 m!991781))

(assert (=> d!129369 m!991687))

(declare-fun m!991783 () Bool)

(assert (=> b!1072723 m!991783))

(assert (=> b!1072723 m!991733))

(declare-fun m!991785 () Bool)

(assert (=> b!1072723 m!991785))

(assert (=> b!1072723 m!991761))

(assert (=> b!1072723 m!991763))

(assert (=> b!1072723 m!991765))

(assert (=> b!1072723 m!991783))

(declare-fun m!991787 () Bool)

(assert (=> b!1072723 m!991787))

(assert (=> b!1072723 m!991761))

(declare-fun m!991789 () Bool)

(assert (=> b!1072723 m!991789))

(assert (=> b!1072723 m!991763))

(declare-fun m!991791 () Bool)

(assert (=> b!1072726 m!991791))

(declare-fun m!991793 () Bool)

(assert (=> bm!45243 m!991793))

(assert (=> b!1072724 m!991733))

(assert (=> b!1072724 m!991733))

(declare-fun m!991795 () Bool)

(assert (=> b!1072724 m!991795))

(assert (=> b!1072731 m!991733))

(assert (=> b!1072731 m!991733))

(assert (=> b!1072731 m!991737))

(assert (=> b!1072725 m!991793))

(assert (=> b!1072727 m!991733))

(assert (=> b!1072727 m!991733))

(declare-fun m!991797 () Bool)

(assert (=> b!1072727 m!991797))

(assert (=> b!1072727 m!991763))

(assert (=> b!1072727 m!991761))

(assert (=> b!1072727 m!991763))

(assert (=> b!1072727 m!991765))

(assert (=> b!1072727 m!991761))

(declare-fun m!991799 () Bool)

(assert (=> b!1072721 m!991799))

(assert (=> b!1072626 d!129369))

(declare-fun d!129371 () Bool)

(declare-fun lt!475747 () ListLongMap!14523)

(assert (=> d!129371 (not (contains!6326 lt!475747 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!74 (List!23088 (_ BitVec 64)) List!23088)

(assert (=> d!129371 (= lt!475747 (ListLongMap!14524 (removeStrictlySorted!74 (toList!7277 lt!475663) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129371 (= (-!705 lt!475663 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475747)))

(declare-fun bs!31608 () Bool)

(assert (= bs!31608 d!129371))

(declare-fun m!991801 () Bool)

(assert (=> bs!31608 m!991801))

(declare-fun m!991803 () Bool)

(assert (=> bs!31608 m!991803))

(assert (=> b!1072625 d!129371))

(declare-fun d!129373 () Bool)

(declare-fun e!612763 () Bool)

(assert (=> d!129373 e!612763))

(declare-fun res!715551 () Bool)

(assert (=> d!129373 (=> (not res!715551) (not e!612763))))

(declare-fun lt!475749 () ListLongMap!14523)

(assert (=> d!129373 (= res!715551 (contains!6326 lt!475749 (_1!8288 lt!475657)))))

(declare-fun lt!475751 () List!23088)

(assert (=> d!129373 (= lt!475749 (ListLongMap!14524 lt!475751))))

(declare-fun lt!475750 () Unit!35348)

(declare-fun lt!475748 () Unit!35348)

(assert (=> d!129373 (= lt!475750 lt!475748)))

(assert (=> d!129373 (= (getValueByKey!604 lt!475751 (_1!8288 lt!475657)) (Some!654 (_2!8288 lt!475657)))))

(assert (=> d!129373 (= lt!475748 (lemmaContainsTupThenGetReturnValue!285 lt!475751 (_1!8288 lt!475657) (_2!8288 lt!475657)))))

(assert (=> d!129373 (= lt!475751 (insertStrictlySorted!378 (toList!7277 lt!475658) (_1!8288 lt!475657) (_2!8288 lt!475657)))))

(assert (=> d!129373 (= (+!3211 lt!475658 lt!475657) lt!475749)))

(declare-fun b!1072733 () Bool)

(declare-fun res!715552 () Bool)

(assert (=> b!1072733 (=> (not res!715552) (not e!612763))))

(assert (=> b!1072733 (= res!715552 (= (getValueByKey!604 (toList!7277 lt!475749) (_1!8288 lt!475657)) (Some!654 (_2!8288 lt!475657))))))

(declare-fun b!1072734 () Bool)

(assert (=> b!1072734 (= e!612763 (contains!6327 (toList!7277 lt!475749) lt!475657))))

(assert (= (and d!129373 res!715551) b!1072733))

(assert (= (and b!1072733 res!715552) b!1072734))

(declare-fun m!991805 () Bool)

(assert (=> d!129373 m!991805))

(declare-fun m!991807 () Bool)

(assert (=> d!129373 m!991807))

(declare-fun m!991809 () Bool)

(assert (=> d!129373 m!991809))

(declare-fun m!991811 () Bool)

(assert (=> d!129373 m!991811))

(declare-fun m!991813 () Bool)

(assert (=> b!1072733 m!991813))

(declare-fun m!991815 () Bool)

(assert (=> b!1072734 m!991815))

(assert (=> b!1072625 d!129373))

(declare-fun d!129375 () Bool)

(declare-fun lt!475752 () ListLongMap!14523)

(assert (=> d!129375 (not (contains!6326 lt!475752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129375 (= lt!475752 (ListLongMap!14524 (removeStrictlySorted!74 (toList!7277 lt!475661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129375 (= (-!705 lt!475661 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475752)))

(declare-fun bs!31609 () Bool)

(assert (= bs!31609 d!129375))

(declare-fun m!991817 () Bool)

(assert (=> bs!31609 m!991817))

(declare-fun m!991819 () Bool)

(assert (=> bs!31609 m!991819))

(assert (=> b!1072625 d!129375))

(declare-fun d!129377 () Bool)

(declare-fun e!612764 () Bool)

(assert (=> d!129377 e!612764))

(declare-fun res!715553 () Bool)

(assert (=> d!129377 (=> (not res!715553) (not e!612764))))

(declare-fun lt!475754 () ListLongMap!14523)

(assert (=> d!129377 (= res!715553 (contains!6326 lt!475754 (_1!8288 lt!475659)))))

(declare-fun lt!475756 () List!23088)

(assert (=> d!129377 (= lt!475754 (ListLongMap!14524 lt!475756))))

(declare-fun lt!475755 () Unit!35348)

(declare-fun lt!475753 () Unit!35348)

(assert (=> d!129377 (= lt!475755 lt!475753)))

(assert (=> d!129377 (= (getValueByKey!604 lt!475756 (_1!8288 lt!475659)) (Some!654 (_2!8288 lt!475659)))))

(assert (=> d!129377 (= lt!475753 (lemmaContainsTupThenGetReturnValue!285 lt!475756 (_1!8288 lt!475659) (_2!8288 lt!475659)))))

(assert (=> d!129377 (= lt!475756 (insertStrictlySorted!378 (toList!7277 (+!3211 lt!475665 lt!475657)) (_1!8288 lt!475659) (_2!8288 lt!475659)))))

(assert (=> d!129377 (= (+!3211 (+!3211 lt!475665 lt!475657) lt!475659) lt!475754)))

(declare-fun b!1072735 () Bool)

(declare-fun res!715554 () Bool)

(assert (=> b!1072735 (=> (not res!715554) (not e!612764))))

(assert (=> b!1072735 (= res!715554 (= (getValueByKey!604 (toList!7277 lt!475754) (_1!8288 lt!475659)) (Some!654 (_2!8288 lt!475659))))))

(declare-fun b!1072736 () Bool)

(assert (=> b!1072736 (= e!612764 (contains!6327 (toList!7277 lt!475754) lt!475659))))

(assert (= (and d!129377 res!715553) b!1072735))

(assert (= (and b!1072735 res!715554) b!1072736))

(declare-fun m!991821 () Bool)

(assert (=> d!129377 m!991821))

(declare-fun m!991823 () Bool)

(assert (=> d!129377 m!991823))

(declare-fun m!991825 () Bool)

(assert (=> d!129377 m!991825))

(declare-fun m!991827 () Bool)

(assert (=> d!129377 m!991827))

(declare-fun m!991829 () Bool)

(assert (=> b!1072735 m!991829))

(declare-fun m!991831 () Bool)

(assert (=> b!1072736 m!991831))

(assert (=> b!1072625 d!129377))

(declare-fun b!1072779 () Bool)

(declare-fun e!612795 () ListLongMap!14523)

(declare-fun call!45266 () ListLongMap!14523)

(assert (=> b!1072779 (= e!612795 (+!3211 call!45266 (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1072780 () Bool)

(declare-fun e!612800 () Bool)

(declare-fun e!612798 () Bool)

(assert (=> b!1072780 (= e!612800 e!612798)))

(declare-fun res!715578 () Bool)

(assert (=> b!1072780 (=> (not res!715578) (not e!612798))))

(declare-fun lt!475804 () ListLongMap!14523)

(assert (=> b!1072780 (= res!715578 (contains!6326 lt!475804 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun call!45263 () ListLongMap!14523)

(declare-fun call!45267 () ListLongMap!14523)

(declare-fun bm!45258 () Bool)

(declare-fun c!107731 () Bool)

(declare-fun c!107730 () Bool)

(declare-fun call!45264 () ListLongMap!14523)

(assert (=> bm!45258 (= call!45266 (+!3211 (ite c!107730 call!45263 (ite c!107731 call!45267 call!45264)) (ite (or c!107730 c!107731) (tuple2!16555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1072781 () Bool)

(declare-fun e!612796 () Bool)

(declare-fun e!612802 () Bool)

(assert (=> b!1072781 (= e!612796 e!612802)))

(declare-fun res!715581 () Bool)

(declare-fun call!45265 () Bool)

(assert (=> b!1072781 (= res!715581 call!45265)))

(assert (=> b!1072781 (=> (not res!715581) (not e!612802))))

(declare-fun bm!45259 () Bool)

(declare-fun call!45262 () ListLongMap!14523)

(assert (=> bm!45259 (= call!45262 call!45266)))

(declare-fun b!1072782 () Bool)

(assert (=> b!1072782 (= e!612798 (= (apply!931 lt!475804 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)) (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1072782 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33608 _values!955)))))

(assert (=> b!1072782 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun b!1072783 () Bool)

(declare-fun e!612799 () Bool)

(assert (=> b!1072783 (= e!612799 (= (apply!931 lt!475804 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1072784 () Bool)

(declare-fun e!612793 () Bool)

(declare-fun call!45261 () Bool)

(assert (=> b!1072784 (= e!612793 (not call!45261))))

(declare-fun d!129379 () Bool)

(declare-fun e!612801 () Bool)

(assert (=> d!129379 e!612801))

(declare-fun res!715575 () Bool)

(assert (=> d!129379 (=> (not res!715575) (not e!612801))))

(assert (=> d!129379 (= res!715575 (or (bvsge #b00000000000000000000000000000000 (size!33607 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))))

(declare-fun lt!475821 () ListLongMap!14523)

(assert (=> d!129379 (= lt!475804 lt!475821)))

(declare-fun lt!475801 () Unit!35348)

(declare-fun e!612794 () Unit!35348)

(assert (=> d!129379 (= lt!475801 e!612794)))

(declare-fun c!107732 () Bool)

(declare-fun e!612803 () Bool)

(assert (=> d!129379 (= c!107732 e!612803)))

(declare-fun res!715577 () Bool)

(assert (=> d!129379 (=> (not res!715577) (not e!612803))))

(assert (=> d!129379 (= res!715577 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> d!129379 (= lt!475821 e!612795)))

(assert (=> d!129379 (= c!107730 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129379 (validMask!0 mask!1515)))

(assert (=> d!129379 (= (getCurrentListMap!4171 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475804)))

(declare-fun b!1072785 () Bool)

(declare-fun res!715580 () Bool)

(assert (=> b!1072785 (=> (not res!715580) (not e!612801))))

(assert (=> b!1072785 (= res!715580 e!612793)))

(declare-fun c!107727 () Bool)

(assert (=> b!1072785 (= c!107727 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072786 () Bool)

(assert (=> b!1072786 (= e!612793 e!612799)))

(declare-fun res!715573 () Bool)

(assert (=> b!1072786 (= res!715573 call!45261)))

(assert (=> b!1072786 (=> (not res!715573) (not e!612799))))

(declare-fun bm!45260 () Bool)

(assert (=> bm!45260 (= call!45263 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072787 () Bool)

(declare-fun c!107728 () Bool)

(assert (=> b!1072787 (= c!107728 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!612792 () ListLongMap!14523)

(declare-fun e!612791 () ListLongMap!14523)

(assert (=> b!1072787 (= e!612792 e!612791)))

(declare-fun b!1072788 () Bool)

(assert (=> b!1072788 (= e!612791 call!45264)))

(declare-fun b!1072789 () Bool)

(declare-fun Unit!35350 () Unit!35348)

(assert (=> b!1072789 (= e!612794 Unit!35350)))

(declare-fun b!1072790 () Bool)

(assert (=> b!1072790 (= e!612803 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072791 () Bool)

(assert (=> b!1072791 (= e!612795 e!612792)))

(assert (=> b!1072791 (= c!107731 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1072792 () Bool)

(declare-fun lt!475818 () Unit!35348)

(assert (=> b!1072792 (= e!612794 lt!475818)))

(declare-fun lt!475822 () ListLongMap!14523)

(assert (=> b!1072792 (= lt!475822 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475811 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475807 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475807 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475819 () Unit!35348)

(declare-fun addStillContains!645 (ListLongMap!14523 (_ BitVec 64) V!39659 (_ BitVec 64)) Unit!35348)

(assert (=> b!1072792 (= lt!475819 (addStillContains!645 lt!475822 lt!475811 zeroValueAfter!47 lt!475807))))

(assert (=> b!1072792 (contains!6326 (+!3211 lt!475822 (tuple2!16555 lt!475811 zeroValueAfter!47)) lt!475807)))

(declare-fun lt!475802 () Unit!35348)

(assert (=> b!1072792 (= lt!475802 lt!475819)))

(declare-fun lt!475813 () ListLongMap!14523)

(assert (=> b!1072792 (= lt!475813 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475815 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475815 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475817 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475817 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475812 () Unit!35348)

(declare-fun addApplyDifferent!505 (ListLongMap!14523 (_ BitVec 64) V!39659 (_ BitVec 64)) Unit!35348)

(assert (=> b!1072792 (= lt!475812 (addApplyDifferent!505 lt!475813 lt!475815 minValue!907 lt!475817))))

(assert (=> b!1072792 (= (apply!931 (+!3211 lt!475813 (tuple2!16555 lt!475815 minValue!907)) lt!475817) (apply!931 lt!475813 lt!475817))))

(declare-fun lt!475814 () Unit!35348)

(assert (=> b!1072792 (= lt!475814 lt!475812)))

(declare-fun lt!475806 () ListLongMap!14523)

(assert (=> b!1072792 (= lt!475806 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475805 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475816 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475816 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475809 () Unit!35348)

(assert (=> b!1072792 (= lt!475809 (addApplyDifferent!505 lt!475806 lt!475805 zeroValueAfter!47 lt!475816))))

(assert (=> b!1072792 (= (apply!931 (+!3211 lt!475806 (tuple2!16555 lt!475805 zeroValueAfter!47)) lt!475816) (apply!931 lt!475806 lt!475816))))

(declare-fun lt!475820 () Unit!35348)

(assert (=> b!1072792 (= lt!475820 lt!475809)))

(declare-fun lt!475810 () ListLongMap!14523)

(assert (=> b!1072792 (= lt!475810 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475808 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475803 () (_ BitVec 64))

(assert (=> b!1072792 (= lt!475803 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1072792 (= lt!475818 (addApplyDifferent!505 lt!475810 lt!475808 minValue!907 lt!475803))))

(assert (=> b!1072792 (= (apply!931 (+!3211 lt!475810 (tuple2!16555 lt!475808 minValue!907)) lt!475803) (apply!931 lt!475810 lt!475803))))

(declare-fun bm!45261 () Bool)

(assert (=> bm!45261 (= call!45265 (contains!6326 lt!475804 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072793 () Bool)

(assert (=> b!1072793 (= e!612801 e!612796)))

(declare-fun c!107729 () Bool)

(assert (=> b!1072793 (= c!107729 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45262 () Bool)

(assert (=> bm!45262 (= call!45261 (contains!6326 lt!475804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072794 () Bool)

(assert (=> b!1072794 (= e!612792 call!45262)))

(declare-fun b!1072795 () Bool)

(declare-fun res!715574 () Bool)

(assert (=> b!1072795 (=> (not res!715574) (not e!612801))))

(assert (=> b!1072795 (= res!715574 e!612800)))

(declare-fun res!715579 () Bool)

(assert (=> b!1072795 (=> res!715579 e!612800)))

(declare-fun e!612797 () Bool)

(assert (=> b!1072795 (= res!715579 (not e!612797))))

(declare-fun res!715576 () Bool)

(assert (=> b!1072795 (=> (not res!715576) (not e!612797))))

(assert (=> b!1072795 (= res!715576 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun b!1072796 () Bool)

(assert (=> b!1072796 (= e!612791 call!45262)))

(declare-fun bm!45263 () Bool)

(assert (=> bm!45263 (= call!45267 call!45263)))

(declare-fun b!1072797 () Bool)

(assert (=> b!1072797 (= e!612802 (= (apply!931 lt!475804 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45264 () Bool)

(assert (=> bm!45264 (= call!45264 call!45267)))

(declare-fun b!1072798 () Bool)

(assert (=> b!1072798 (= e!612796 (not call!45265))))

(declare-fun b!1072799 () Bool)

(assert (=> b!1072799 (= e!612797 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129379 c!107730) b!1072779))

(assert (= (and d!129379 (not c!107730)) b!1072791))

(assert (= (and b!1072791 c!107731) b!1072794))

(assert (= (and b!1072791 (not c!107731)) b!1072787))

(assert (= (and b!1072787 c!107728) b!1072796))

(assert (= (and b!1072787 (not c!107728)) b!1072788))

(assert (= (or b!1072796 b!1072788) bm!45264))

(assert (= (or b!1072794 bm!45264) bm!45263))

(assert (= (or b!1072794 b!1072796) bm!45259))

(assert (= (or b!1072779 bm!45263) bm!45260))

(assert (= (or b!1072779 bm!45259) bm!45258))

(assert (= (and d!129379 res!715577) b!1072790))

(assert (= (and d!129379 c!107732) b!1072792))

(assert (= (and d!129379 (not c!107732)) b!1072789))

(assert (= (and d!129379 res!715575) b!1072795))

(assert (= (and b!1072795 res!715576) b!1072799))

(assert (= (and b!1072795 (not res!715579)) b!1072780))

(assert (= (and b!1072780 res!715578) b!1072782))

(assert (= (and b!1072795 res!715574) b!1072785))

(assert (= (and b!1072785 c!107727) b!1072786))

(assert (= (and b!1072785 (not c!107727)) b!1072784))

(assert (= (and b!1072786 res!715573) b!1072783))

(assert (= (or b!1072786 b!1072784) bm!45262))

(assert (= (and b!1072785 res!715580) b!1072793))

(assert (= (and b!1072793 c!107729) b!1072781))

(assert (= (and b!1072793 (not c!107729)) b!1072798))

(assert (= (and b!1072781 res!715581) b!1072797))

(assert (= (or b!1072781 b!1072798) bm!45261))

(declare-fun b_lambda!16709 () Bool)

(assert (=> (not b_lambda!16709) (not b!1072782)))

(assert (=> b!1072782 t!32427))

(declare-fun b_and!34937 () Bool)

(assert (= b_and!34935 (and (=> t!32427 result!14779) b_and!34937)))

(declare-fun m!991833 () Bool)

(assert (=> bm!45258 m!991833))

(declare-fun m!991835 () Bool)

(assert (=> bm!45262 m!991835))

(declare-fun m!991837 () Bool)

(assert (=> b!1072779 m!991837))

(declare-fun m!991839 () Bool)

(assert (=> b!1072783 m!991839))

(assert (=> d!129379 m!991687))

(declare-fun m!991841 () Bool)

(assert (=> b!1072792 m!991841))

(declare-fun m!991843 () Bool)

(assert (=> b!1072792 m!991843))

(declare-fun m!991845 () Bool)

(assert (=> b!1072792 m!991845))

(declare-fun m!991847 () Bool)

(assert (=> b!1072792 m!991847))

(declare-fun m!991849 () Bool)

(assert (=> b!1072792 m!991849))

(declare-fun m!991851 () Bool)

(assert (=> b!1072792 m!991851))

(declare-fun m!991853 () Bool)

(assert (=> b!1072792 m!991853))

(assert (=> b!1072792 m!991679))

(declare-fun m!991855 () Bool)

(assert (=> b!1072792 m!991855))

(assert (=> b!1072792 m!991843))

(declare-fun m!991857 () Bool)

(assert (=> b!1072792 m!991857))

(declare-fun m!991859 () Bool)

(assert (=> b!1072792 m!991859))

(assert (=> b!1072792 m!991849))

(declare-fun m!991861 () Bool)

(assert (=> b!1072792 m!991861))

(declare-fun m!991863 () Bool)

(assert (=> b!1072792 m!991863))

(assert (=> b!1072792 m!991861))

(declare-fun m!991865 () Bool)

(assert (=> b!1072792 m!991865))

(assert (=> b!1072792 m!991733))

(declare-fun m!991867 () Bool)

(assert (=> b!1072792 m!991867))

(assert (=> b!1072792 m!991845))

(declare-fun m!991869 () Bool)

(assert (=> b!1072792 m!991869))

(assert (=> b!1072780 m!991733))

(assert (=> b!1072780 m!991733))

(declare-fun m!991871 () Bool)

(assert (=> b!1072780 m!991871))

(declare-fun m!991873 () Bool)

(assert (=> bm!45261 m!991873))

(assert (=> bm!45260 m!991679))

(assert (=> b!1072799 m!991733))

(assert (=> b!1072799 m!991733))

(assert (=> b!1072799 m!991737))

(assert (=> b!1072790 m!991733))

(assert (=> b!1072790 m!991733))

(assert (=> b!1072790 m!991737))

(assert (=> b!1072782 m!991733))

(declare-fun m!991875 () Bool)

(assert (=> b!1072782 m!991875))

(assert (=> b!1072782 m!991763))

(assert (=> b!1072782 m!991761))

(assert (=> b!1072782 m!991763))

(assert (=> b!1072782 m!991765))

(assert (=> b!1072782 m!991733))

(assert (=> b!1072782 m!991761))

(declare-fun m!991877 () Bool)

(assert (=> b!1072797 m!991877))

(assert (=> b!1072625 d!129379))

(declare-fun d!129381 () Bool)

(declare-fun e!612804 () Bool)

(assert (=> d!129381 e!612804))

(declare-fun res!715582 () Bool)

(assert (=> d!129381 (=> (not res!715582) (not e!612804))))

(declare-fun lt!475824 () ListLongMap!14523)

(assert (=> d!129381 (= res!715582 (contains!6326 lt!475824 (_1!8288 lt!475659)))))

(declare-fun lt!475826 () List!23088)

(assert (=> d!129381 (= lt!475824 (ListLongMap!14524 lt!475826))))

(declare-fun lt!475825 () Unit!35348)

(declare-fun lt!475823 () Unit!35348)

(assert (=> d!129381 (= lt!475825 lt!475823)))

(assert (=> d!129381 (= (getValueByKey!604 lt!475826 (_1!8288 lt!475659)) (Some!654 (_2!8288 lt!475659)))))

(assert (=> d!129381 (= lt!475823 (lemmaContainsTupThenGetReturnValue!285 lt!475826 (_1!8288 lt!475659) (_2!8288 lt!475659)))))

(assert (=> d!129381 (= lt!475826 (insertStrictlySorted!378 (toList!7277 lt!475665) (_1!8288 lt!475659) (_2!8288 lt!475659)))))

(assert (=> d!129381 (= (+!3211 lt!475665 lt!475659) lt!475824)))

(declare-fun b!1072800 () Bool)

(declare-fun res!715583 () Bool)

(assert (=> b!1072800 (=> (not res!715583) (not e!612804))))

(assert (=> b!1072800 (= res!715583 (= (getValueByKey!604 (toList!7277 lt!475824) (_1!8288 lt!475659)) (Some!654 (_2!8288 lt!475659))))))

(declare-fun b!1072801 () Bool)

(assert (=> b!1072801 (= e!612804 (contains!6327 (toList!7277 lt!475824) lt!475659))))

(assert (= (and d!129381 res!715582) b!1072800))

(assert (= (and b!1072800 res!715583) b!1072801))

(declare-fun m!991879 () Bool)

(assert (=> d!129381 m!991879))

(declare-fun m!991881 () Bool)

(assert (=> d!129381 m!991881))

(declare-fun m!991883 () Bool)

(assert (=> d!129381 m!991883))

(declare-fun m!991885 () Bool)

(assert (=> d!129381 m!991885))

(declare-fun m!991887 () Bool)

(assert (=> b!1072800 m!991887))

(declare-fun m!991889 () Bool)

(assert (=> b!1072801 m!991889))

(assert (=> b!1072625 d!129381))

(declare-fun b!1072802 () Bool)

(declare-fun e!612809 () ListLongMap!14523)

(declare-fun call!45273 () ListLongMap!14523)

(assert (=> b!1072802 (= e!612809 (+!3211 call!45273 (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1072803 () Bool)

(declare-fun e!612814 () Bool)

(declare-fun e!612812 () Bool)

(assert (=> b!1072803 (= e!612814 e!612812)))

(declare-fun res!715589 () Bool)

(assert (=> b!1072803 (=> (not res!715589) (not e!612812))))

(declare-fun lt!475830 () ListLongMap!14523)

(assert (=> b!1072803 (= res!715589 (contains!6326 lt!475830 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1072803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun bm!45265 () Bool)

(declare-fun call!45271 () ListLongMap!14523)

(declare-fun call!45274 () ListLongMap!14523)

(declare-fun c!107736 () Bool)

(declare-fun call!45270 () ListLongMap!14523)

(declare-fun c!107737 () Bool)

(assert (=> bm!45265 (= call!45273 (+!3211 (ite c!107736 call!45270 (ite c!107737 call!45274 call!45271)) (ite (or c!107736 c!107737) (tuple2!16555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1072804 () Bool)

(declare-fun e!612810 () Bool)

(declare-fun e!612816 () Bool)

(assert (=> b!1072804 (= e!612810 e!612816)))

(declare-fun res!715592 () Bool)

(declare-fun call!45272 () Bool)

(assert (=> b!1072804 (= res!715592 call!45272)))

(assert (=> b!1072804 (=> (not res!715592) (not e!612816))))

(declare-fun bm!45266 () Bool)

(declare-fun call!45269 () ListLongMap!14523)

(assert (=> bm!45266 (= call!45269 call!45273)))

(declare-fun b!1072805 () Bool)

(assert (=> b!1072805 (= e!612812 (= (apply!931 lt!475830 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)) (get!17187 (select (arr!33072 _values!955) #b00000000000000000000000000000000) (dynLambda!2038 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1072805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33608 _values!955)))))

(assert (=> b!1072805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun b!1072806 () Bool)

(declare-fun e!612813 () Bool)

(assert (=> b!1072806 (= e!612813 (= (apply!931 lt!475830 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1072807 () Bool)

(declare-fun e!612807 () Bool)

(declare-fun call!45268 () Bool)

(assert (=> b!1072807 (= e!612807 (not call!45268))))

(declare-fun d!129383 () Bool)

(declare-fun e!612815 () Bool)

(assert (=> d!129383 e!612815))

(declare-fun res!715586 () Bool)

(assert (=> d!129383 (=> (not res!715586) (not e!612815))))

(assert (=> d!129383 (= res!715586 (or (bvsge #b00000000000000000000000000000000 (size!33607 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))))

(declare-fun lt!475847 () ListLongMap!14523)

(assert (=> d!129383 (= lt!475830 lt!475847)))

(declare-fun lt!475827 () Unit!35348)

(declare-fun e!612808 () Unit!35348)

(assert (=> d!129383 (= lt!475827 e!612808)))

(declare-fun c!107738 () Bool)

(declare-fun e!612817 () Bool)

(assert (=> d!129383 (= c!107738 e!612817)))

(declare-fun res!715588 () Bool)

(assert (=> d!129383 (=> (not res!715588) (not e!612817))))

(assert (=> d!129383 (= res!715588 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> d!129383 (= lt!475847 e!612809)))

(assert (=> d!129383 (= c!107736 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129383 (validMask!0 mask!1515)))

(assert (=> d!129383 (= (getCurrentListMap!4171 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475830)))

(declare-fun b!1072808 () Bool)

(declare-fun res!715591 () Bool)

(assert (=> b!1072808 (=> (not res!715591) (not e!612815))))

(assert (=> b!1072808 (= res!715591 e!612807)))

(declare-fun c!107733 () Bool)

(assert (=> b!1072808 (= c!107733 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1072809 () Bool)

(assert (=> b!1072809 (= e!612807 e!612813)))

(declare-fun res!715584 () Bool)

(assert (=> b!1072809 (= res!715584 call!45268)))

(assert (=> b!1072809 (=> (not res!715584) (not e!612813))))

(declare-fun bm!45267 () Bool)

(assert (=> bm!45267 (= call!45270 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1072810 () Bool)

(declare-fun c!107734 () Bool)

(assert (=> b!1072810 (= c!107734 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!612806 () ListLongMap!14523)

(declare-fun e!612805 () ListLongMap!14523)

(assert (=> b!1072810 (= e!612806 e!612805)))

(declare-fun b!1072811 () Bool)

(assert (=> b!1072811 (= e!612805 call!45271)))

(declare-fun b!1072812 () Bool)

(declare-fun Unit!35351 () Unit!35348)

(assert (=> b!1072812 (= e!612808 Unit!35351)))

(declare-fun b!1072813 () Bool)

(assert (=> b!1072813 (= e!612817 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1072814 () Bool)

(assert (=> b!1072814 (= e!612809 e!612806)))

(assert (=> b!1072814 (= c!107737 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1072815 () Bool)

(declare-fun lt!475844 () Unit!35348)

(assert (=> b!1072815 (= e!612808 lt!475844)))

(declare-fun lt!475848 () ListLongMap!14523)

(assert (=> b!1072815 (= lt!475848 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475837 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475833 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475833 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475845 () Unit!35348)

(assert (=> b!1072815 (= lt!475845 (addStillContains!645 lt!475848 lt!475837 zeroValueBefore!47 lt!475833))))

(assert (=> b!1072815 (contains!6326 (+!3211 lt!475848 (tuple2!16555 lt!475837 zeroValueBefore!47)) lt!475833)))

(declare-fun lt!475828 () Unit!35348)

(assert (=> b!1072815 (= lt!475828 lt!475845)))

(declare-fun lt!475839 () ListLongMap!14523)

(assert (=> b!1072815 (= lt!475839 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475841 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475841 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475843 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475843 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475838 () Unit!35348)

(assert (=> b!1072815 (= lt!475838 (addApplyDifferent!505 lt!475839 lt!475841 minValue!907 lt!475843))))

(assert (=> b!1072815 (= (apply!931 (+!3211 lt!475839 (tuple2!16555 lt!475841 minValue!907)) lt!475843) (apply!931 lt!475839 lt!475843))))

(declare-fun lt!475840 () Unit!35348)

(assert (=> b!1072815 (= lt!475840 lt!475838)))

(declare-fun lt!475832 () ListLongMap!14523)

(assert (=> b!1072815 (= lt!475832 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475831 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475842 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475842 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475835 () Unit!35348)

(assert (=> b!1072815 (= lt!475835 (addApplyDifferent!505 lt!475832 lt!475831 zeroValueBefore!47 lt!475842))))

(assert (=> b!1072815 (= (apply!931 (+!3211 lt!475832 (tuple2!16555 lt!475831 zeroValueBefore!47)) lt!475842) (apply!931 lt!475832 lt!475842))))

(declare-fun lt!475846 () Unit!35348)

(assert (=> b!1072815 (= lt!475846 lt!475835)))

(declare-fun lt!475836 () ListLongMap!14523)

(assert (=> b!1072815 (= lt!475836 (getCurrentListMapNoExtraKeys!3841 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!475834 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475834 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!475829 () (_ BitVec 64))

(assert (=> b!1072815 (= lt!475829 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1072815 (= lt!475844 (addApplyDifferent!505 lt!475836 lt!475834 minValue!907 lt!475829))))

(assert (=> b!1072815 (= (apply!931 (+!3211 lt!475836 (tuple2!16555 lt!475834 minValue!907)) lt!475829) (apply!931 lt!475836 lt!475829))))

(declare-fun bm!45268 () Bool)

(assert (=> bm!45268 (= call!45272 (contains!6326 lt!475830 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072816 () Bool)

(assert (=> b!1072816 (= e!612815 e!612810)))

(declare-fun c!107735 () Bool)

(assert (=> b!1072816 (= c!107735 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45269 () Bool)

(assert (=> bm!45269 (= call!45268 (contains!6326 lt!475830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1072817 () Bool)

(assert (=> b!1072817 (= e!612806 call!45269)))

(declare-fun b!1072818 () Bool)

(declare-fun res!715585 () Bool)

(assert (=> b!1072818 (=> (not res!715585) (not e!612815))))

(assert (=> b!1072818 (= res!715585 e!612814)))

(declare-fun res!715590 () Bool)

(assert (=> b!1072818 (=> res!715590 e!612814)))

(declare-fun e!612811 () Bool)

(assert (=> b!1072818 (= res!715590 (not e!612811))))

(declare-fun res!715587 () Bool)

(assert (=> b!1072818 (=> (not res!715587) (not e!612811))))

(assert (=> b!1072818 (= res!715587 (bvslt #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(declare-fun b!1072819 () Bool)

(assert (=> b!1072819 (= e!612805 call!45269)))

(declare-fun bm!45270 () Bool)

(assert (=> bm!45270 (= call!45274 call!45270)))

(declare-fun b!1072820 () Bool)

(assert (=> b!1072820 (= e!612816 (= (apply!931 lt!475830 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45271 () Bool)

(assert (=> bm!45271 (= call!45271 call!45274)))

(declare-fun b!1072821 () Bool)

(assert (=> b!1072821 (= e!612810 (not call!45272))))

(declare-fun b!1072822 () Bool)

(assert (=> b!1072822 (= e!612811 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129383 c!107736) b!1072802))

(assert (= (and d!129383 (not c!107736)) b!1072814))

(assert (= (and b!1072814 c!107737) b!1072817))

(assert (= (and b!1072814 (not c!107737)) b!1072810))

(assert (= (and b!1072810 c!107734) b!1072819))

(assert (= (and b!1072810 (not c!107734)) b!1072811))

(assert (= (or b!1072819 b!1072811) bm!45271))

(assert (= (or b!1072817 bm!45271) bm!45270))

(assert (= (or b!1072817 b!1072819) bm!45266))

(assert (= (or b!1072802 bm!45270) bm!45267))

(assert (= (or b!1072802 bm!45266) bm!45265))

(assert (= (and d!129383 res!715588) b!1072813))

(assert (= (and d!129383 c!107738) b!1072815))

(assert (= (and d!129383 (not c!107738)) b!1072812))

(assert (= (and d!129383 res!715586) b!1072818))

(assert (= (and b!1072818 res!715587) b!1072822))

(assert (= (and b!1072818 (not res!715590)) b!1072803))

(assert (= (and b!1072803 res!715589) b!1072805))

(assert (= (and b!1072818 res!715585) b!1072808))

(assert (= (and b!1072808 c!107733) b!1072809))

(assert (= (and b!1072808 (not c!107733)) b!1072807))

(assert (= (and b!1072809 res!715584) b!1072806))

(assert (= (or b!1072809 b!1072807) bm!45269))

(assert (= (and b!1072808 res!715591) b!1072816))

(assert (= (and b!1072816 c!107735) b!1072804))

(assert (= (and b!1072816 (not c!107735)) b!1072821))

(assert (= (and b!1072804 res!715592) b!1072820))

(assert (= (or b!1072804 b!1072821) bm!45268))

(declare-fun b_lambda!16711 () Bool)

(assert (=> (not b_lambda!16711) (not b!1072805)))

(assert (=> b!1072805 t!32427))

(declare-fun b_and!34939 () Bool)

(assert (= b_and!34937 (and (=> t!32427 result!14779) b_and!34939)))

(declare-fun m!991891 () Bool)

(assert (=> bm!45265 m!991891))

(declare-fun m!991893 () Bool)

(assert (=> bm!45269 m!991893))

(declare-fun m!991895 () Bool)

(assert (=> b!1072802 m!991895))

(declare-fun m!991897 () Bool)

(assert (=> b!1072806 m!991897))

(assert (=> d!129383 m!991687))

(declare-fun m!991899 () Bool)

(assert (=> b!1072815 m!991899))

(declare-fun m!991901 () Bool)

(assert (=> b!1072815 m!991901))

(declare-fun m!991903 () Bool)

(assert (=> b!1072815 m!991903))

(declare-fun m!991905 () Bool)

(assert (=> b!1072815 m!991905))

(declare-fun m!991907 () Bool)

(assert (=> b!1072815 m!991907))

(declare-fun m!991909 () Bool)

(assert (=> b!1072815 m!991909))

(declare-fun m!991911 () Bool)

(assert (=> b!1072815 m!991911))

(assert (=> b!1072815 m!991681))

(declare-fun m!991913 () Bool)

(assert (=> b!1072815 m!991913))

(assert (=> b!1072815 m!991901))

(declare-fun m!991915 () Bool)

(assert (=> b!1072815 m!991915))

(declare-fun m!991917 () Bool)

(assert (=> b!1072815 m!991917))

(assert (=> b!1072815 m!991907))

(declare-fun m!991919 () Bool)

(assert (=> b!1072815 m!991919))

(declare-fun m!991921 () Bool)

(assert (=> b!1072815 m!991921))

(assert (=> b!1072815 m!991919))

(declare-fun m!991923 () Bool)

(assert (=> b!1072815 m!991923))

(assert (=> b!1072815 m!991733))

(declare-fun m!991925 () Bool)

(assert (=> b!1072815 m!991925))

(assert (=> b!1072815 m!991903))

(declare-fun m!991927 () Bool)

(assert (=> b!1072815 m!991927))

(assert (=> b!1072803 m!991733))

(assert (=> b!1072803 m!991733))

(declare-fun m!991929 () Bool)

(assert (=> b!1072803 m!991929))

(declare-fun m!991931 () Bool)

(assert (=> bm!45268 m!991931))

(assert (=> bm!45267 m!991681))

(assert (=> b!1072822 m!991733))

(assert (=> b!1072822 m!991733))

(assert (=> b!1072822 m!991737))

(assert (=> b!1072813 m!991733))

(assert (=> b!1072813 m!991733))

(assert (=> b!1072813 m!991737))

(assert (=> b!1072805 m!991733))

(declare-fun m!991933 () Bool)

(assert (=> b!1072805 m!991933))

(assert (=> b!1072805 m!991763))

(assert (=> b!1072805 m!991761))

(assert (=> b!1072805 m!991763))

(assert (=> b!1072805 m!991765))

(assert (=> b!1072805 m!991733))

(assert (=> b!1072805 m!991761))

(declare-fun m!991935 () Bool)

(assert (=> b!1072820 m!991935))

(assert (=> b!1072625 d!129383))

(declare-fun d!129385 () Bool)

(assert (=> d!129385 (= (-!705 (+!3211 lt!475658 (tuple2!16555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!475658)))

(declare-fun lt!475851 () Unit!35348)

(declare-fun choose!1745 (ListLongMap!14523 (_ BitVec 64) V!39659) Unit!35348)

(assert (=> d!129385 (= lt!475851 (choose!1745 lt!475658 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129385 (not (contains!6326 lt!475658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129385 (= (addThenRemoveForNewKeyIsSame!75 lt!475658 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!475851)))

(declare-fun bs!31610 () Bool)

(assert (= bs!31610 d!129385))

(declare-fun m!991937 () Bool)

(assert (=> bs!31610 m!991937))

(assert (=> bs!31610 m!991937))

(declare-fun m!991939 () Bool)

(assert (=> bs!31610 m!991939))

(declare-fun m!991941 () Bool)

(assert (=> bs!31610 m!991941))

(declare-fun m!991943 () Bool)

(assert (=> bs!31610 m!991943))

(assert (=> b!1072625 d!129385))

(declare-fun d!129387 () Bool)

(assert (=> d!129387 (= (+!3211 (+!3211 lt!475665 (tuple2!16555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (+!3211 (+!3211 lt!475665 (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (tuple2!16555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun lt!475854 () Unit!35348)

(declare-fun choose!1746 (ListLongMap!14523 (_ BitVec 64) V!39659 (_ BitVec 64) V!39659) Unit!35348)

(assert (=> d!129387 (= lt!475854 (choose!1746 lt!475665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> d!129387 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129387 (= (addCommutativeForDiffKeys!750 lt!475665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907) lt!475854)))

(declare-fun bs!31611 () Bool)

(assert (= bs!31611 d!129387))

(declare-fun m!991945 () Bool)

(assert (=> bs!31611 m!991945))

(declare-fun m!991947 () Bool)

(assert (=> bs!31611 m!991947))

(assert (=> bs!31611 m!991947))

(declare-fun m!991949 () Bool)

(assert (=> bs!31611 m!991949))

(declare-fun m!991951 () Bool)

(assert (=> bs!31611 m!991951))

(declare-fun m!991953 () Bool)

(assert (=> bs!31611 m!991953))

(assert (=> bs!31611 m!991951))

(assert (=> b!1072625 d!129387))

(declare-fun d!129389 () Bool)

(declare-fun e!612818 () Bool)

(assert (=> d!129389 e!612818))

(declare-fun res!715593 () Bool)

(assert (=> d!129389 (=> (not res!715593) (not e!612818))))

(declare-fun lt!475856 () ListLongMap!14523)

(assert (=> d!129389 (= res!715593 (contains!6326 lt!475856 (_1!8288 lt!475657)))))

(declare-fun lt!475858 () List!23088)

(assert (=> d!129389 (= lt!475856 (ListLongMap!14524 lt!475858))))

(declare-fun lt!475857 () Unit!35348)

(declare-fun lt!475855 () Unit!35348)

(assert (=> d!129389 (= lt!475857 lt!475855)))

(assert (=> d!129389 (= (getValueByKey!604 lt!475858 (_1!8288 lt!475657)) (Some!654 (_2!8288 lt!475657)))))

(assert (=> d!129389 (= lt!475855 (lemmaContainsTupThenGetReturnValue!285 lt!475858 (_1!8288 lt!475657) (_2!8288 lt!475657)))))

(assert (=> d!129389 (= lt!475858 (insertStrictlySorted!378 (toList!7277 lt!475665) (_1!8288 lt!475657) (_2!8288 lt!475657)))))

(assert (=> d!129389 (= (+!3211 lt!475665 lt!475657) lt!475856)))

(declare-fun b!1072823 () Bool)

(declare-fun res!715594 () Bool)

(assert (=> b!1072823 (=> (not res!715594) (not e!612818))))

(assert (=> b!1072823 (= res!715594 (= (getValueByKey!604 (toList!7277 lt!475856) (_1!8288 lt!475657)) (Some!654 (_2!8288 lt!475657))))))

(declare-fun b!1072824 () Bool)

(assert (=> b!1072824 (= e!612818 (contains!6327 (toList!7277 lt!475856) lt!475657))))

(assert (= (and d!129389 res!715593) b!1072823))

(assert (= (and b!1072823 res!715594) b!1072824))

(declare-fun m!991955 () Bool)

(assert (=> d!129389 m!991955))

(declare-fun m!991957 () Bool)

(assert (=> d!129389 m!991957))

(declare-fun m!991959 () Bool)

(assert (=> d!129389 m!991959))

(declare-fun m!991961 () Bool)

(assert (=> d!129389 m!991961))

(declare-fun m!991963 () Bool)

(assert (=> b!1072823 m!991963))

(declare-fun m!991965 () Bool)

(assert (=> b!1072824 m!991965))

(assert (=> b!1072625 d!129389))

(declare-fun b!1072833 () Bool)

(declare-fun e!612826 () Bool)

(declare-fun call!45277 () Bool)

(assert (=> b!1072833 (= e!612826 call!45277)))

(declare-fun b!1072834 () Bool)

(declare-fun e!612825 () Bool)

(assert (=> b!1072834 (= e!612825 e!612826)))

(declare-fun c!107741 () Bool)

(assert (=> b!1072834 (= c!107741 (validKeyInArray!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129391 () Bool)

(declare-fun res!715599 () Bool)

(assert (=> d!129391 (=> res!715599 e!612825)))

(assert (=> d!129391 (= res!715599 (bvsge #b00000000000000000000000000000000 (size!33607 _keys!1163)))))

(assert (=> d!129391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!612825)))

(declare-fun bm!45274 () Bool)

(assert (=> bm!45274 (= call!45277 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1072835 () Bool)

(declare-fun e!612827 () Bool)

(assert (=> b!1072835 (= e!612826 e!612827)))

(declare-fun lt!475867 () (_ BitVec 64))

(assert (=> b!1072835 (= lt!475867 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475866 () Unit!35348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68753 (_ BitVec 64) (_ BitVec 32)) Unit!35348)

(assert (=> b!1072835 (= lt!475866 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!475867 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1072835 (arrayContainsKey!0 _keys!1163 lt!475867 #b00000000000000000000000000000000)))

(declare-fun lt!475865 () Unit!35348)

(assert (=> b!1072835 (= lt!475865 lt!475866)))

(declare-fun res!715600 () Bool)

(declare-datatypes ((SeekEntryResult!9884 0))(
  ( (MissingZero!9884 (index!41907 (_ BitVec 32))) (Found!9884 (index!41908 (_ BitVec 32))) (Intermediate!9884 (undefined!10696 Bool) (index!41909 (_ BitVec 32)) (x!96118 (_ BitVec 32))) (Undefined!9884) (MissingVacant!9884 (index!41910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68753 (_ BitVec 32)) SeekEntryResult!9884)

(assert (=> b!1072835 (= res!715600 (= (seekEntryOrOpen!0 (select (arr!33071 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9884 #b00000000000000000000000000000000)))))

(assert (=> b!1072835 (=> (not res!715600) (not e!612827))))

(declare-fun b!1072836 () Bool)

(assert (=> b!1072836 (= e!612827 call!45277)))

(assert (= (and d!129391 (not res!715599)) b!1072834))

(assert (= (and b!1072834 c!107741) b!1072835))

(assert (= (and b!1072834 (not c!107741)) b!1072833))

(assert (= (and b!1072835 res!715600) b!1072836))

(assert (= (or b!1072836 b!1072833) bm!45274))

(assert (=> b!1072834 m!991733))

(assert (=> b!1072834 m!991733))

(assert (=> b!1072834 m!991737))

(declare-fun m!991967 () Bool)

(assert (=> bm!45274 m!991967))

(assert (=> b!1072835 m!991733))

(declare-fun m!991969 () Bool)

(assert (=> b!1072835 m!991969))

(declare-fun m!991971 () Bool)

(assert (=> b!1072835 m!991971))

(assert (=> b!1072835 m!991733))

(declare-fun m!991973 () Bool)

(assert (=> b!1072835 m!991973))

(assert (=> b!1072629 d!129391))

(declare-fun d!129393 () Bool)

(assert (=> d!129393 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94854 d!129393))

(declare-fun d!129395 () Bool)

(assert (=> d!129395 (= (array_inv!25564 _values!955) (bvsge (size!33608 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94854 d!129395))

(declare-fun d!129397 () Bool)

(assert (=> d!129397 (= (array_inv!25565 _keys!1163) (bvsge (size!33607 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94854 d!129397))

(declare-fun mapIsEmpty!40555 () Bool)

(declare-fun mapRes!40555 () Bool)

(assert (=> mapIsEmpty!40555 mapRes!40555))

(declare-fun condMapEmpty!40555 () Bool)

(declare-fun mapDefault!40555 () ValueCell!12243)

(assert (=> mapNonEmpty!40549 (= condMapEmpty!40555 (= mapRest!40549 ((as const (Array (_ BitVec 32) ValueCell!12243)) mapDefault!40555)))))

(declare-fun e!612832 () Bool)

(assert (=> mapNonEmpty!40549 (= tp!77710 (and e!612832 mapRes!40555))))

(declare-fun mapNonEmpty!40555 () Bool)

(declare-fun tp!77720 () Bool)

(declare-fun e!612833 () Bool)

(assert (=> mapNonEmpty!40555 (= mapRes!40555 (and tp!77720 e!612833))))

(declare-fun mapRest!40555 () (Array (_ BitVec 32) ValueCell!12243))

(declare-fun mapValue!40555 () ValueCell!12243)

(declare-fun mapKey!40555 () (_ BitVec 32))

(assert (=> mapNonEmpty!40555 (= mapRest!40549 (store mapRest!40555 mapKey!40555 mapValue!40555))))

(declare-fun b!1072844 () Bool)

(assert (=> b!1072844 (= e!612832 tp_is_empty!25893)))

(declare-fun b!1072843 () Bool)

(assert (=> b!1072843 (= e!612833 tp_is_empty!25893)))

(assert (= (and mapNonEmpty!40549 condMapEmpty!40555) mapIsEmpty!40555))

(assert (= (and mapNonEmpty!40549 (not condMapEmpty!40555)) mapNonEmpty!40555))

(assert (= (and mapNonEmpty!40555 ((_ is ValueCellFull!12243) mapValue!40555)) b!1072843))

(assert (= (and mapNonEmpty!40549 ((_ is ValueCellFull!12243) mapDefault!40555)) b!1072844))

(declare-fun m!991975 () Bool)

(assert (=> mapNonEmpty!40555 m!991975))

(declare-fun b_lambda!16713 () Bool)

(assert (= b_lambda!16711 (or (and start!94854 b_free!22083) b_lambda!16713)))

(declare-fun b_lambda!16715 () Bool)

(assert (= b_lambda!16709 (or (and start!94854 b_free!22083) b_lambda!16715)))

(declare-fun b_lambda!16717 () Bool)

(assert (= b_lambda!16703 (or (and start!94854 b_free!22083) b_lambda!16717)))

(declare-fun b_lambda!16719 () Bool)

(assert (= b_lambda!16707 (or (and start!94854 b_free!22083) b_lambda!16719)))

(declare-fun b_lambda!16721 () Bool)

(assert (= b_lambda!16701 (or (and start!94854 b_free!22083) b_lambda!16721)))

(declare-fun b_lambda!16723 () Bool)

(assert (= b_lambda!16705 (or (and start!94854 b_free!22083) b_lambda!16723)))

(check-sat (not d!129375) (not b!1072792) (not b_lambda!16713) (not bm!45239) (not b!1072673) (not b!1072709) (not d!129387) (not bm!45260) (not b_next!22083) (not d!129383) (not b!1072731) (not b!1072723) (not bm!45243) (not b!1072824) (not b!1072676) (not bm!45268) tp_is_empty!25893 (not b!1072820) (not b!1072802) (not b!1072834) (not b!1072729) (not d!129385) (not bm!45265) (not b!1072822) (not b!1072733) (not b!1072803) (not d!129379) (not d!129363) (not b_lambda!16721) (not bm!45267) (not b!1072783) (not d!129365) (not bm!45269) (not bm!45262) b_and!34939 (not b!1072736) (not b!1072707) (not b!1072801) (not b!1072682) (not b!1072710) (not b!1072779) (not b!1072823) (not bm!45258) (not b!1072715) (not b!1072717) (not b!1072721) (not b!1072675) (not b!1072712) (not b!1072681) (not bm!45242) (not b!1072805) (not b_lambda!16723) (not d!129369) (not b_lambda!16717) (not d!129367) (not d!129389) (not b!1072726) (not b!1072800) (not b_lambda!16715) (not d!129373) (not b!1072734) (not b!1072724) (not b!1072727) (not mapNonEmpty!40555) (not b!1072735) (not b!1072725) (not b!1072813) (not b!1072711) (not b!1072713) (not d!129381) (not b!1072790) (not d!129371) (not b!1072815) (not b_lambda!16719) (not d!129377) (not b!1072780) (not b!1072835) (not b!1072799) (not bm!45261) (not b!1072806) (not bm!45274) (not b!1072782) (not b!1072797))
(check-sat b_and!34939 (not b_next!22083))
