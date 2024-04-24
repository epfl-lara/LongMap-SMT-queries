; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70984 () Bool)

(assert start!70984)

(declare-fun b_free!13075 () Bool)

(declare-fun b_next!13075 () Bool)

(assert (=> start!70984 (= b_free!13075 (not b_next!13075))))

(declare-fun tp!45970 () Bool)

(declare-fun b_and!21957 () Bool)

(assert (=> start!70984 (= tp!45970 b_and!21957)))

(declare-fun b!823468 () Bool)

(declare-fun res!561383 () Bool)

(declare-fun e!457943 () Bool)

(assert (=> b!823468 (=> (not res!561383) (not e!457943))))

(declare-datatypes ((array!45765 0))(
  ( (array!45766 (arr!21928 (Array (_ BitVec 32) (_ BitVec 64))) (size!22348 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45765)

(declare-datatypes ((List!15535 0))(
  ( (Nil!15532) (Cons!15531 (h!16666 (_ BitVec 64)) (t!21864 List!15535)) )
))
(declare-fun arrayNoDuplicates!0 (array!45765 (_ BitVec 32) List!15535) Bool)

(assert (=> b!823468 (= res!561383 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15532))))

(declare-fun b!823469 () Bool)

(declare-fun res!561382 () Bool)

(assert (=> b!823469 (=> (not res!561382) (not e!457943))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24715 0))(
  ( (V!24716 (val!7440 Int)) )
))
(declare-datatypes ((ValueCell!6977 0))(
  ( (ValueCellFull!6977 (v!9871 V!24715)) (EmptyCell!6977) )
))
(declare-datatypes ((array!45767 0))(
  ( (array!45768 (arr!21929 (Array (_ BitVec 32) ValueCell!6977)) (size!22349 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45767)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823469 (= res!561382 (and (= (size!22349 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22348 _keys!976) (size!22349 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823470 () Bool)

(declare-fun e!457942 () Bool)

(declare-fun tp_is_empty!14785 () Bool)

(assert (=> b!823470 (= e!457942 tp_is_empty!14785)))

(declare-fun b!823471 () Bool)

(declare-fun e!457938 () Bool)

(assert (=> b!823471 (= e!457938 (bvsle #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-datatypes ((tuple2!9750 0))(
  ( (tuple2!9751 (_1!4886 (_ BitVec 64)) (_2!4886 V!24715)) )
))
(declare-datatypes ((List!15536 0))(
  ( (Nil!15533) (Cons!15532 (h!16667 tuple2!9750) (t!21865 List!15536)) )
))
(declare-datatypes ((ListLongMap!8575 0))(
  ( (ListLongMap!8576 (toList!4303 List!15536)) )
))
(declare-fun lt!370641 () ListLongMap!8575)

(declare-fun lt!370637 () ListLongMap!8575)

(declare-fun lt!370638 () tuple2!9750)

(declare-fun +!1892 (ListLongMap!8575 tuple2!9750) ListLongMap!8575)

(assert (=> b!823471 (= lt!370641 (+!1892 lt!370637 lt!370638))))

(declare-fun lt!370634 () ListLongMap!8575)

(declare-fun zeroValueAfter!34 () V!24715)

(declare-fun minValue!754 () V!24715)

(declare-datatypes ((Unit!28155 0))(
  ( (Unit!28156) )
))
(declare-fun lt!370636 () Unit!28155)

(declare-fun addCommutativeForDiffKeys!450 (ListLongMap!8575 (_ BitVec 64) V!24715 (_ BitVec 64) V!24715) Unit!28155)

(assert (=> b!823471 (= lt!370636 (addCommutativeForDiffKeys!450 lt!370634 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370632 () ListLongMap!8575)

(assert (=> b!823471 (= lt!370632 lt!370641)))

(declare-fun lt!370640 () tuple2!9750)

(assert (=> b!823471 (= lt!370641 (+!1892 (+!1892 lt!370634 lt!370638) lt!370640))))

(assert (=> b!823471 (= lt!370638 (tuple2!9751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370639 () ListLongMap!8575)

(assert (=> b!823471 (= lt!370639 lt!370637)))

(assert (=> b!823471 (= lt!370637 (+!1892 lt!370634 lt!370640))))

(assert (=> b!823471 (= lt!370640 (tuple2!9751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2456 (array!45765 array!45767 (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 (_ BitVec 32) Int) ListLongMap!8575)

(assert (=> b!823471 (= lt!370632 (getCurrentListMap!2456 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24715)

(assert (=> b!823471 (= lt!370639 (getCurrentListMap!2456 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823472 () Bool)

(declare-fun e!457941 () Bool)

(declare-fun e!457939 () Bool)

(declare-fun mapRes!23788 () Bool)

(assert (=> b!823472 (= e!457941 (and e!457939 mapRes!23788))))

(declare-fun condMapEmpty!23788 () Bool)

(declare-fun mapDefault!23788 () ValueCell!6977)

(assert (=> b!823472 (= condMapEmpty!23788 (= (arr!21929 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6977)) mapDefault!23788)))))

(declare-fun mapIsEmpty!23788 () Bool)

(assert (=> mapIsEmpty!23788 mapRes!23788))

(declare-fun b!823474 () Bool)

(declare-fun res!561385 () Bool)

(assert (=> b!823474 (=> (not res!561385) (not e!457943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45765 (_ BitVec 32)) Bool)

(assert (=> b!823474 (= res!561385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23788 () Bool)

(declare-fun tp!45969 () Bool)

(assert (=> mapNonEmpty!23788 (= mapRes!23788 (and tp!45969 e!457942))))

(declare-fun mapValue!23788 () ValueCell!6977)

(declare-fun mapRest!23788 () (Array (_ BitVec 32) ValueCell!6977))

(declare-fun mapKey!23788 () (_ BitVec 32))

(assert (=> mapNonEmpty!23788 (= (arr!21929 _values!788) (store mapRest!23788 mapKey!23788 mapValue!23788))))

(declare-fun b!823475 () Bool)

(assert (=> b!823475 (= e!457939 tp_is_empty!14785)))

(declare-fun b!823473 () Bool)

(assert (=> b!823473 (= e!457943 (not e!457938))))

(declare-fun res!561384 () Bool)

(assert (=> b!823473 (=> res!561384 e!457938)))

(assert (=> b!823473 (= res!561384 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370633 () ListLongMap!8575)

(assert (=> b!823473 (= lt!370634 lt!370633)))

(declare-fun lt!370635 () Unit!28155)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!476 (array!45765 array!45767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 V!24715 V!24715 (_ BitVec 32) Int) Unit!28155)

(assert (=> b!823473 (= lt!370635 (lemmaNoChangeToArrayThenSameMapNoExtras!476 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2388 (array!45765 array!45767 (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 (_ BitVec 32) Int) ListLongMap!8575)

(assert (=> b!823473 (= lt!370633 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823473 (= lt!370634 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561381 () Bool)

(assert (=> start!70984 (=> (not res!561381) (not e!457943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70984 (= res!561381 (validMask!0 mask!1312))))

(assert (=> start!70984 e!457943))

(assert (=> start!70984 tp_is_empty!14785))

(declare-fun array_inv!17543 (array!45765) Bool)

(assert (=> start!70984 (array_inv!17543 _keys!976)))

(assert (=> start!70984 true))

(declare-fun array_inv!17544 (array!45767) Bool)

(assert (=> start!70984 (and (array_inv!17544 _values!788) e!457941)))

(assert (=> start!70984 tp!45970))

(assert (= (and start!70984 res!561381) b!823469))

(assert (= (and b!823469 res!561382) b!823474))

(assert (= (and b!823474 res!561385) b!823468))

(assert (= (and b!823468 res!561383) b!823473))

(assert (= (and b!823473 (not res!561384)) b!823471))

(assert (= (and b!823472 condMapEmpty!23788) mapIsEmpty!23788))

(assert (= (and b!823472 (not condMapEmpty!23788)) mapNonEmpty!23788))

(get-info :version)

(assert (= (and mapNonEmpty!23788 ((_ is ValueCellFull!6977) mapValue!23788)) b!823470))

(assert (= (and b!823472 ((_ is ValueCellFull!6977) mapDefault!23788)) b!823475))

(assert (= start!70984 b!823472))

(declare-fun m!765755 () Bool)

(assert (=> start!70984 m!765755))

(declare-fun m!765757 () Bool)

(assert (=> start!70984 m!765757))

(declare-fun m!765759 () Bool)

(assert (=> start!70984 m!765759))

(declare-fun m!765761 () Bool)

(assert (=> b!823473 m!765761))

(declare-fun m!765763 () Bool)

(assert (=> b!823473 m!765763))

(declare-fun m!765765 () Bool)

(assert (=> b!823473 m!765765))

(declare-fun m!765767 () Bool)

(assert (=> b!823471 m!765767))

(declare-fun m!765769 () Bool)

(assert (=> b!823471 m!765769))

(declare-fun m!765771 () Bool)

(assert (=> b!823471 m!765771))

(declare-fun m!765773 () Bool)

(assert (=> b!823471 m!765773))

(declare-fun m!765775 () Bool)

(assert (=> b!823471 m!765775))

(assert (=> b!823471 m!765771))

(declare-fun m!765777 () Bool)

(assert (=> b!823471 m!765777))

(declare-fun m!765779 () Bool)

(assert (=> b!823471 m!765779))

(declare-fun m!765781 () Bool)

(assert (=> mapNonEmpty!23788 m!765781))

(declare-fun m!765783 () Bool)

(assert (=> b!823468 m!765783))

(declare-fun m!765785 () Bool)

(assert (=> b!823474 m!765785))

(check-sat (not mapNonEmpty!23788) (not b!823473) (not b_next!13075) (not start!70984) (not b!823471) (not b!823468) b_and!21957 (not b!823474) tp_is_empty!14785)
(check-sat b_and!21957 (not b_next!13075))
(get-model)

(declare-fun b!823532 () Bool)

(declare-fun e!457987 () Bool)

(declare-fun call!35801 () Bool)

(assert (=> b!823532 (= e!457987 call!35801)))

(declare-fun bm!35798 () Bool)

(assert (=> bm!35798 (= call!35801 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!823533 () Bool)

(declare-fun e!457986 () Bool)

(assert (=> b!823533 (= e!457986 e!457987)))

(declare-fun lt!370710 () (_ BitVec 64))

(assert (=> b!823533 (= lt!370710 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370708 () Unit!28155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45765 (_ BitVec 64) (_ BitVec 32)) Unit!28155)

(assert (=> b!823533 (= lt!370708 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!370710 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!823533 (arrayContainsKey!0 _keys!976 lt!370710 #b00000000000000000000000000000000)))

(declare-fun lt!370709 () Unit!28155)

(assert (=> b!823533 (= lt!370709 lt!370708)))

(declare-fun res!561421 () Bool)

(declare-datatypes ((SeekEntryResult!8681 0))(
  ( (MissingZero!8681 (index!37095 (_ BitVec 32))) (Found!8681 (index!37096 (_ BitVec 32))) (Intermediate!8681 (undefined!9493 Bool) (index!37097 (_ BitVec 32)) (x!69346 (_ BitVec 32))) (Undefined!8681) (MissingVacant!8681 (index!37098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45765 (_ BitVec 32)) SeekEntryResult!8681)

(assert (=> b!823533 (= res!561421 (= (seekEntryOrOpen!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8681 #b00000000000000000000000000000000)))))

(assert (=> b!823533 (=> (not res!561421) (not e!457987))))

(declare-fun d!105149 () Bool)

(declare-fun res!561420 () Bool)

(declare-fun e!457988 () Bool)

(assert (=> d!105149 (=> res!561420 e!457988)))

(assert (=> d!105149 (= res!561420 (bvsge #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> d!105149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!457988)))

(declare-fun b!823534 () Bool)

(assert (=> b!823534 (= e!457986 call!35801)))

(declare-fun b!823535 () Bool)

(assert (=> b!823535 (= e!457988 e!457986)))

(declare-fun c!89556 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!823535 (= c!89556 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105149 (not res!561420)) b!823535))

(assert (= (and b!823535 c!89556) b!823533))

(assert (= (and b!823535 (not c!89556)) b!823534))

(assert (= (and b!823533 res!561421) b!823532))

(assert (= (or b!823532 b!823534) bm!35798))

(declare-fun m!765851 () Bool)

(assert (=> bm!35798 m!765851))

(declare-fun m!765853 () Bool)

(assert (=> b!823533 m!765853))

(declare-fun m!765855 () Bool)

(assert (=> b!823533 m!765855))

(declare-fun m!765857 () Bool)

(assert (=> b!823533 m!765857))

(assert (=> b!823533 m!765853))

(declare-fun m!765859 () Bool)

(assert (=> b!823533 m!765859))

(assert (=> b!823535 m!765853))

(assert (=> b!823535 m!765853))

(declare-fun m!765861 () Bool)

(assert (=> b!823535 m!765861))

(assert (=> b!823474 d!105149))

(declare-fun d!105151 () Bool)

(assert (=> d!105151 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70984 d!105151))

(declare-fun d!105153 () Bool)

(assert (=> d!105153 (= (array_inv!17543 _keys!976) (bvsge (size!22348 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70984 d!105153))

(declare-fun d!105155 () Bool)

(assert (=> d!105155 (= (array_inv!17544 _values!788) (bvsge (size!22349 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70984 d!105155))

(declare-fun d!105157 () Bool)

(declare-fun e!457991 () Bool)

(assert (=> d!105157 e!457991))

(declare-fun res!561426 () Bool)

(assert (=> d!105157 (=> (not res!561426) (not e!457991))))

(declare-fun lt!370721 () ListLongMap!8575)

(declare-fun contains!4147 (ListLongMap!8575 (_ BitVec 64)) Bool)

(assert (=> d!105157 (= res!561426 (contains!4147 lt!370721 (_1!4886 lt!370640)))))

(declare-fun lt!370720 () List!15536)

(assert (=> d!105157 (= lt!370721 (ListLongMap!8576 lt!370720))))

(declare-fun lt!370719 () Unit!28155)

(declare-fun lt!370722 () Unit!28155)

(assert (=> d!105157 (= lt!370719 lt!370722)))

(declare-datatypes ((Option!411 0))(
  ( (Some!410 (v!9874 V!24715)) (None!409) )
))
(declare-fun getValueByKey!405 (List!15536 (_ BitVec 64)) Option!411)

(assert (=> d!105157 (= (getValueByKey!405 lt!370720 (_1!4886 lt!370640)) (Some!410 (_2!4886 lt!370640)))))

(declare-fun lemmaContainsTupThenGetReturnValue!219 (List!15536 (_ BitVec 64) V!24715) Unit!28155)

(assert (=> d!105157 (= lt!370722 (lemmaContainsTupThenGetReturnValue!219 lt!370720 (_1!4886 lt!370640) (_2!4886 lt!370640)))))

(declare-fun insertStrictlySorted!258 (List!15536 (_ BitVec 64) V!24715) List!15536)

(assert (=> d!105157 (= lt!370720 (insertStrictlySorted!258 (toList!4303 lt!370634) (_1!4886 lt!370640) (_2!4886 lt!370640)))))

(assert (=> d!105157 (= (+!1892 lt!370634 lt!370640) lt!370721)))

(declare-fun b!823540 () Bool)

(declare-fun res!561427 () Bool)

(assert (=> b!823540 (=> (not res!561427) (not e!457991))))

(assert (=> b!823540 (= res!561427 (= (getValueByKey!405 (toList!4303 lt!370721) (_1!4886 lt!370640)) (Some!410 (_2!4886 lt!370640))))))

(declare-fun b!823541 () Bool)

(declare-fun contains!4148 (List!15536 tuple2!9750) Bool)

(assert (=> b!823541 (= e!457991 (contains!4148 (toList!4303 lt!370721) lt!370640))))

(assert (= (and d!105157 res!561426) b!823540))

(assert (= (and b!823540 res!561427) b!823541))

(declare-fun m!765863 () Bool)

(assert (=> d!105157 m!765863))

(declare-fun m!765865 () Bool)

(assert (=> d!105157 m!765865))

(declare-fun m!765867 () Bool)

(assert (=> d!105157 m!765867))

(declare-fun m!765869 () Bool)

(assert (=> d!105157 m!765869))

(declare-fun m!765871 () Bool)

(assert (=> b!823540 m!765871))

(declare-fun m!765873 () Bool)

(assert (=> b!823541 m!765873))

(assert (=> b!823471 d!105157))

(declare-fun d!105159 () Bool)

(assert (=> d!105159 (= (+!1892 (+!1892 lt!370634 (tuple2!9751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (tuple2!9751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (+!1892 (+!1892 lt!370634 (tuple2!9751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (tuple2!9751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!370725 () Unit!28155)

(declare-fun choose!1405 (ListLongMap!8575 (_ BitVec 64) V!24715 (_ BitVec 64) V!24715) Unit!28155)

(assert (=> d!105159 (= lt!370725 (choose!1405 lt!370634 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> d!105159 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105159 (= (addCommutativeForDiffKeys!450 lt!370634 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754) lt!370725)))

(declare-fun bs!22971 () Bool)

(assert (= bs!22971 d!105159))

(declare-fun m!765875 () Bool)

(assert (=> bs!22971 m!765875))

(declare-fun m!765877 () Bool)

(assert (=> bs!22971 m!765877))

(declare-fun m!765879 () Bool)

(assert (=> bs!22971 m!765879))

(declare-fun m!765881 () Bool)

(assert (=> bs!22971 m!765881))

(assert (=> bs!22971 m!765879))

(assert (=> bs!22971 m!765877))

(declare-fun m!765883 () Bool)

(assert (=> bs!22971 m!765883))

(assert (=> b!823471 d!105159))

(declare-fun bm!35813 () Bool)

(declare-fun call!35816 () ListLongMap!8575)

(declare-fun call!35819 () ListLongMap!8575)

(assert (=> bm!35813 (= call!35816 call!35819)))

(declare-fun b!823584 () Bool)

(declare-fun e!458029 () ListLongMap!8575)

(declare-fun e!458024 () ListLongMap!8575)

(assert (=> b!823584 (= e!458029 e!458024)))

(declare-fun c!89570 () Bool)

(assert (=> b!823584 (= c!89570 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35814 () Bool)

(declare-fun call!35818 () ListLongMap!8575)

(declare-fun call!35820 () ListLongMap!8575)

(assert (=> bm!35814 (= call!35818 call!35820)))

(declare-fun b!823585 () Bool)

(declare-fun e!458025 () Bool)

(declare-fun e!458021 () Bool)

(assert (=> b!823585 (= e!458025 e!458021)))

(declare-fun res!561454 () Bool)

(declare-fun call!35822 () Bool)

(assert (=> b!823585 (= res!561454 call!35822)))

(assert (=> b!823585 (=> (not res!561454) (not e!458021))))

(declare-fun b!823586 () Bool)

(declare-fun e!458019 () Bool)

(assert (=> b!823586 (= e!458019 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823587 () Bool)

(declare-fun res!561451 () Bool)

(declare-fun e!458018 () Bool)

(assert (=> b!823587 (=> (not res!561451) (not e!458018))))

(declare-fun e!458030 () Bool)

(assert (=> b!823587 (= res!561451 e!458030)))

(declare-fun res!561449 () Bool)

(assert (=> b!823587 (=> res!561449 e!458030)))

(declare-fun e!458020 () Bool)

(assert (=> b!823587 (= res!561449 (not e!458020))))

(declare-fun res!561447 () Bool)

(assert (=> b!823587 (=> (not res!561447) (not e!458020))))

(assert (=> b!823587 (= res!561447 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823588 () Bool)

(declare-fun e!458027 () ListLongMap!8575)

(assert (=> b!823588 (= e!458027 call!35816)))

(declare-fun b!823589 () Bool)

(assert (=> b!823589 (= e!458029 (+!1892 call!35820 (tuple2!9751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun d!105161 () Bool)

(assert (=> d!105161 e!458018))

(declare-fun res!561448 () Bool)

(assert (=> d!105161 (=> (not res!561448) (not e!458018))))

(assert (=> d!105161 (= res!561448 (or (bvsge #b00000000000000000000000000000000 (size!22348 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))))

(declare-fun lt!370775 () ListLongMap!8575)

(declare-fun lt!370784 () ListLongMap!8575)

(assert (=> d!105161 (= lt!370775 lt!370784)))

(declare-fun lt!370790 () Unit!28155)

(declare-fun e!458023 () Unit!28155)

(assert (=> d!105161 (= lt!370790 e!458023)))

(declare-fun c!89573 () Bool)

(assert (=> d!105161 (= c!89573 e!458019)))

(declare-fun res!561452 () Bool)

(assert (=> d!105161 (=> (not res!561452) (not e!458019))))

(assert (=> d!105161 (= res!561452 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> d!105161 (= lt!370784 e!458029)))

(declare-fun c!89571 () Bool)

(assert (=> d!105161 (= c!89571 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105161 (validMask!0 mask!1312)))

(assert (=> d!105161 (= (getCurrentListMap!2456 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370775)))

(declare-fun b!823590 () Bool)

(declare-fun Unit!28157 () Unit!28155)

(assert (=> b!823590 (= e!458023 Unit!28157)))

(declare-fun b!823591 () Bool)

(assert (=> b!823591 (= e!458025 (not call!35822))))

(declare-fun b!823592 () Bool)

(assert (=> b!823592 (= e!458020 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823593 () Bool)

(declare-fun e!458028 () Bool)

(declare-fun e!458026 () Bool)

(assert (=> b!823593 (= e!458028 e!458026)))

(declare-fun res!561450 () Bool)

(declare-fun call!35821 () Bool)

(assert (=> b!823593 (= res!561450 call!35821)))

(assert (=> b!823593 (=> (not res!561450) (not e!458026))))

(declare-fun call!35817 () ListLongMap!8575)

(declare-fun bm!35815 () Bool)

(assert (=> bm!35815 (= call!35817 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35816 () Bool)

(assert (=> bm!35816 (= call!35822 (contains!4147 lt!370775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823594 () Bool)

(declare-fun res!561446 () Bool)

(assert (=> b!823594 (=> (not res!561446) (not e!458018))))

(assert (=> b!823594 (= res!561446 e!458025)))

(declare-fun c!89574 () Bool)

(assert (=> b!823594 (= c!89574 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!823595 () Bool)

(declare-fun c!89572 () Bool)

(assert (=> b!823595 (= c!89572 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!823595 (= e!458024 e!458027)))

(declare-fun b!823596 () Bool)

(assert (=> b!823596 (= e!458028 (not call!35821))))

(declare-fun b!823597 () Bool)

(declare-fun apply!358 (ListLongMap!8575 (_ BitVec 64)) V!24715)

(assert (=> b!823597 (= e!458021 (= (apply!358 lt!370775 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!35817 () Bool)

(assert (=> bm!35817 (= call!35820 (+!1892 (ite c!89571 call!35817 (ite c!89570 call!35819 call!35816)) (ite (or c!89571 c!89570) (tuple2!9751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!823598 () Bool)

(assert (=> b!823598 (= e!458026 (= (apply!358 lt!370775 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!823599 () Bool)

(assert (=> b!823599 (= e!458024 call!35818)))

(declare-fun b!823600 () Bool)

(assert (=> b!823600 (= e!458027 call!35818)))

(declare-fun b!823601 () Bool)

(declare-fun lt!370779 () Unit!28155)

(assert (=> b!823601 (= e!458023 lt!370779)))

(declare-fun lt!370776 () ListLongMap!8575)

(assert (=> b!823601 (= lt!370776 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370771 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370771 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370789 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370789 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370774 () Unit!28155)

(declare-fun addStillContains!311 (ListLongMap!8575 (_ BitVec 64) V!24715 (_ BitVec 64)) Unit!28155)

(assert (=> b!823601 (= lt!370774 (addStillContains!311 lt!370776 lt!370771 zeroValueBefore!34 lt!370789))))

(assert (=> b!823601 (contains!4147 (+!1892 lt!370776 (tuple2!9751 lt!370771 zeroValueBefore!34)) lt!370789)))

(declare-fun lt!370788 () Unit!28155)

(assert (=> b!823601 (= lt!370788 lt!370774)))

(declare-fun lt!370772 () ListLongMap!8575)

(assert (=> b!823601 (= lt!370772 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370791 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370791 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370787 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370787 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370780 () Unit!28155)

(declare-fun addApplyDifferent!311 (ListLongMap!8575 (_ BitVec 64) V!24715 (_ BitVec 64)) Unit!28155)

(assert (=> b!823601 (= lt!370780 (addApplyDifferent!311 lt!370772 lt!370791 minValue!754 lt!370787))))

(assert (=> b!823601 (= (apply!358 (+!1892 lt!370772 (tuple2!9751 lt!370791 minValue!754)) lt!370787) (apply!358 lt!370772 lt!370787))))

(declare-fun lt!370778 () Unit!28155)

(assert (=> b!823601 (= lt!370778 lt!370780)))

(declare-fun lt!370781 () ListLongMap!8575)

(assert (=> b!823601 (= lt!370781 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370783 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370770 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370770 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370782 () Unit!28155)

(assert (=> b!823601 (= lt!370782 (addApplyDifferent!311 lt!370781 lt!370783 zeroValueBefore!34 lt!370770))))

(assert (=> b!823601 (= (apply!358 (+!1892 lt!370781 (tuple2!9751 lt!370783 zeroValueBefore!34)) lt!370770) (apply!358 lt!370781 lt!370770))))

(declare-fun lt!370773 () Unit!28155)

(assert (=> b!823601 (= lt!370773 lt!370782)))

(declare-fun lt!370786 () ListLongMap!8575)

(assert (=> b!823601 (= lt!370786 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370785 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370777 () (_ BitVec 64))

(assert (=> b!823601 (= lt!370777 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823601 (= lt!370779 (addApplyDifferent!311 lt!370786 lt!370785 minValue!754 lt!370777))))

(assert (=> b!823601 (= (apply!358 (+!1892 lt!370786 (tuple2!9751 lt!370785 minValue!754)) lt!370777) (apply!358 lt!370786 lt!370777))))

(declare-fun b!823602 () Bool)

(assert (=> b!823602 (= e!458018 e!458028)))

(declare-fun c!89569 () Bool)

(assert (=> b!823602 (= c!89569 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35818 () Bool)

(assert (=> bm!35818 (= call!35821 (contains!4147 lt!370775 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823603 () Bool)

(declare-fun e!458022 () Bool)

(assert (=> b!823603 (= e!458030 e!458022)))

(declare-fun res!561453 () Bool)

(assert (=> b!823603 (=> (not res!561453) (not e!458022))))

(assert (=> b!823603 (= res!561453 (contains!4147 lt!370775 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823604 () Bool)

(declare-fun get!11666 (ValueCell!6977 V!24715) V!24715)

(declare-fun dynLambda!966 (Int (_ BitVec 64)) V!24715)

(assert (=> b!823604 (= e!458022 (= (apply!358 lt!370775 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)) (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!823604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22349 _values!788)))))

(assert (=> b!823604 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun bm!35819 () Bool)

(assert (=> bm!35819 (= call!35819 call!35817)))

(assert (= (and d!105161 c!89571) b!823589))

(assert (= (and d!105161 (not c!89571)) b!823584))

(assert (= (and b!823584 c!89570) b!823599))

(assert (= (and b!823584 (not c!89570)) b!823595))

(assert (= (and b!823595 c!89572) b!823600))

(assert (= (and b!823595 (not c!89572)) b!823588))

(assert (= (or b!823600 b!823588) bm!35813))

(assert (= (or b!823599 bm!35813) bm!35819))

(assert (= (or b!823599 b!823600) bm!35814))

(assert (= (or b!823589 bm!35819) bm!35815))

(assert (= (or b!823589 bm!35814) bm!35817))

(assert (= (and d!105161 res!561452) b!823586))

(assert (= (and d!105161 c!89573) b!823601))

(assert (= (and d!105161 (not c!89573)) b!823590))

(assert (= (and d!105161 res!561448) b!823587))

(assert (= (and b!823587 res!561447) b!823592))

(assert (= (and b!823587 (not res!561449)) b!823603))

(assert (= (and b!823603 res!561453) b!823604))

(assert (= (and b!823587 res!561451) b!823594))

(assert (= (and b!823594 c!89574) b!823585))

(assert (= (and b!823594 (not c!89574)) b!823591))

(assert (= (and b!823585 res!561454) b!823597))

(assert (= (or b!823585 b!823591) bm!35816))

(assert (= (and b!823594 res!561446) b!823602))

(assert (= (and b!823602 c!89569) b!823593))

(assert (= (and b!823602 (not c!89569)) b!823596))

(assert (= (and b!823593 res!561450) b!823598))

(assert (= (or b!823593 b!823596) bm!35818))

(declare-fun b_lambda!11045 () Bool)

(assert (=> (not b_lambda!11045) (not b!823604)))

(declare-fun t!21869 () Bool)

(declare-fun tb!4189 () Bool)

(assert (=> (and start!70984 (= defaultEntry!796 defaultEntry!796) t!21869) tb!4189))

(declare-fun result!7923 () Bool)

(assert (=> tb!4189 (= result!7923 tp_is_empty!14785)))

(assert (=> b!823604 t!21869))

(declare-fun b_and!21963 () Bool)

(assert (= b_and!21957 (and (=> t!21869 result!7923) b_and!21963)))

(declare-fun m!765885 () Bool)

(assert (=> bm!35818 m!765885))

(assert (=> b!823604 m!765853))

(declare-fun m!765887 () Bool)

(assert (=> b!823604 m!765887))

(declare-fun m!765889 () Bool)

(assert (=> b!823604 m!765889))

(declare-fun m!765891 () Bool)

(assert (=> b!823604 m!765891))

(assert (=> b!823604 m!765853))

(declare-fun m!765893 () Bool)

(assert (=> b!823604 m!765893))

(assert (=> b!823604 m!765889))

(assert (=> b!823604 m!765887))

(declare-fun m!765895 () Bool)

(assert (=> b!823597 m!765895))

(assert (=> b!823592 m!765853))

(assert (=> b!823592 m!765853))

(assert (=> b!823592 m!765861))

(declare-fun m!765897 () Bool)

(assert (=> bm!35816 m!765897))

(declare-fun m!765899 () Bool)

(assert (=> b!823598 m!765899))

(assert (=> b!823603 m!765853))

(assert (=> b!823603 m!765853))

(declare-fun m!765901 () Bool)

(assert (=> b!823603 m!765901))

(declare-fun m!765903 () Bool)

(assert (=> b!823601 m!765903))

(declare-fun m!765905 () Bool)

(assert (=> b!823601 m!765905))

(assert (=> b!823601 m!765853))

(declare-fun m!765907 () Bool)

(assert (=> b!823601 m!765907))

(declare-fun m!765909 () Bool)

(assert (=> b!823601 m!765909))

(assert (=> b!823601 m!765765))

(declare-fun m!765911 () Bool)

(assert (=> b!823601 m!765911))

(declare-fun m!765913 () Bool)

(assert (=> b!823601 m!765913))

(assert (=> b!823601 m!765907))

(declare-fun m!765915 () Bool)

(assert (=> b!823601 m!765915))

(declare-fun m!765917 () Bool)

(assert (=> b!823601 m!765917))

(declare-fun m!765919 () Bool)

(assert (=> b!823601 m!765919))

(assert (=> b!823601 m!765911))

(declare-fun m!765921 () Bool)

(assert (=> b!823601 m!765921))

(assert (=> b!823601 m!765917))

(declare-fun m!765923 () Bool)

(assert (=> b!823601 m!765923))

(declare-fun m!765925 () Bool)

(assert (=> b!823601 m!765925))

(declare-fun m!765927 () Bool)

(assert (=> b!823601 m!765927))

(assert (=> b!823601 m!765905))

(declare-fun m!765929 () Bool)

(assert (=> b!823601 m!765929))

(declare-fun m!765931 () Bool)

(assert (=> b!823601 m!765931))

(declare-fun m!765933 () Bool)

(assert (=> bm!35817 m!765933))

(assert (=> b!823586 m!765853))

(assert (=> b!823586 m!765853))

(assert (=> b!823586 m!765861))

(declare-fun m!765935 () Bool)

(assert (=> b!823589 m!765935))

(assert (=> bm!35815 m!765765))

(assert (=> d!105161 m!765755))

(assert (=> b!823471 d!105161))

(declare-fun bm!35820 () Bool)

(declare-fun call!35823 () ListLongMap!8575)

(declare-fun call!35826 () ListLongMap!8575)

(assert (=> bm!35820 (= call!35823 call!35826)))

(declare-fun b!823607 () Bool)

(declare-fun e!458042 () ListLongMap!8575)

(declare-fun e!458037 () ListLongMap!8575)

(assert (=> b!823607 (= e!458042 e!458037)))

(declare-fun c!89576 () Bool)

(assert (=> b!823607 (= c!89576 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35821 () Bool)

(declare-fun call!35825 () ListLongMap!8575)

(declare-fun call!35827 () ListLongMap!8575)

(assert (=> bm!35821 (= call!35825 call!35827)))

(declare-fun b!823608 () Bool)

(declare-fun e!458038 () Bool)

(declare-fun e!458034 () Bool)

(assert (=> b!823608 (= e!458038 e!458034)))

(declare-fun res!561463 () Bool)

(declare-fun call!35829 () Bool)

(assert (=> b!823608 (= res!561463 call!35829)))

(assert (=> b!823608 (=> (not res!561463) (not e!458034))))

(declare-fun b!823609 () Bool)

(declare-fun e!458032 () Bool)

(assert (=> b!823609 (= e!458032 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823610 () Bool)

(declare-fun res!561460 () Bool)

(declare-fun e!458031 () Bool)

(assert (=> b!823610 (=> (not res!561460) (not e!458031))))

(declare-fun e!458043 () Bool)

(assert (=> b!823610 (= res!561460 e!458043)))

(declare-fun res!561458 () Bool)

(assert (=> b!823610 (=> res!561458 e!458043)))

(declare-fun e!458033 () Bool)

(assert (=> b!823610 (= res!561458 (not e!458033))))

(declare-fun res!561456 () Bool)

(assert (=> b!823610 (=> (not res!561456) (not e!458033))))

(assert (=> b!823610 (= res!561456 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823611 () Bool)

(declare-fun e!458040 () ListLongMap!8575)

(assert (=> b!823611 (= e!458040 call!35823)))

(declare-fun b!823612 () Bool)

(assert (=> b!823612 (= e!458042 (+!1892 call!35827 (tuple2!9751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun d!105163 () Bool)

(assert (=> d!105163 e!458031))

(declare-fun res!561457 () Bool)

(assert (=> d!105163 (=> (not res!561457) (not e!458031))))

(assert (=> d!105163 (= res!561457 (or (bvsge #b00000000000000000000000000000000 (size!22348 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))))

(declare-fun lt!370797 () ListLongMap!8575)

(declare-fun lt!370806 () ListLongMap!8575)

(assert (=> d!105163 (= lt!370797 lt!370806)))

(declare-fun lt!370812 () Unit!28155)

(declare-fun e!458036 () Unit!28155)

(assert (=> d!105163 (= lt!370812 e!458036)))

(declare-fun c!89579 () Bool)

(assert (=> d!105163 (= c!89579 e!458032)))

(declare-fun res!561461 () Bool)

(assert (=> d!105163 (=> (not res!561461) (not e!458032))))

(assert (=> d!105163 (= res!561461 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> d!105163 (= lt!370806 e!458042)))

(declare-fun c!89577 () Bool)

(assert (=> d!105163 (= c!89577 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105163 (validMask!0 mask!1312)))

(assert (=> d!105163 (= (getCurrentListMap!2456 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370797)))

(declare-fun b!823613 () Bool)

(declare-fun Unit!28158 () Unit!28155)

(assert (=> b!823613 (= e!458036 Unit!28158)))

(declare-fun b!823614 () Bool)

(assert (=> b!823614 (= e!458038 (not call!35829))))

(declare-fun b!823615 () Bool)

(assert (=> b!823615 (= e!458033 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823616 () Bool)

(declare-fun e!458041 () Bool)

(declare-fun e!458039 () Bool)

(assert (=> b!823616 (= e!458041 e!458039)))

(declare-fun res!561459 () Bool)

(declare-fun call!35828 () Bool)

(assert (=> b!823616 (= res!561459 call!35828)))

(assert (=> b!823616 (=> (not res!561459) (not e!458039))))

(declare-fun call!35824 () ListLongMap!8575)

(declare-fun bm!35822 () Bool)

(assert (=> bm!35822 (= call!35824 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35823 () Bool)

(assert (=> bm!35823 (= call!35829 (contains!4147 lt!370797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823617 () Bool)

(declare-fun res!561455 () Bool)

(assert (=> b!823617 (=> (not res!561455) (not e!458031))))

(assert (=> b!823617 (= res!561455 e!458038)))

(declare-fun c!89580 () Bool)

(assert (=> b!823617 (= c!89580 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!823618 () Bool)

(declare-fun c!89578 () Bool)

(assert (=> b!823618 (= c!89578 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!823618 (= e!458037 e!458040)))

(declare-fun b!823619 () Bool)

(assert (=> b!823619 (= e!458041 (not call!35828))))

(declare-fun b!823620 () Bool)

(assert (=> b!823620 (= e!458034 (= (apply!358 lt!370797 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!35824 () Bool)

(assert (=> bm!35824 (= call!35827 (+!1892 (ite c!89577 call!35824 (ite c!89576 call!35826 call!35823)) (ite (or c!89577 c!89576) (tuple2!9751 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9751 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!823621 () Bool)

(assert (=> b!823621 (= e!458039 (= (apply!358 lt!370797 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!823622 () Bool)

(assert (=> b!823622 (= e!458037 call!35825)))

(declare-fun b!823623 () Bool)

(assert (=> b!823623 (= e!458040 call!35825)))

(declare-fun b!823624 () Bool)

(declare-fun lt!370801 () Unit!28155)

(assert (=> b!823624 (= e!458036 lt!370801)))

(declare-fun lt!370798 () ListLongMap!8575)

(assert (=> b!823624 (= lt!370798 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370793 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370793 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370811 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370811 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370796 () Unit!28155)

(assert (=> b!823624 (= lt!370796 (addStillContains!311 lt!370798 lt!370793 zeroValueAfter!34 lt!370811))))

(assert (=> b!823624 (contains!4147 (+!1892 lt!370798 (tuple2!9751 lt!370793 zeroValueAfter!34)) lt!370811)))

(declare-fun lt!370810 () Unit!28155)

(assert (=> b!823624 (= lt!370810 lt!370796)))

(declare-fun lt!370794 () ListLongMap!8575)

(assert (=> b!823624 (= lt!370794 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370813 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370813 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370809 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370809 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370802 () Unit!28155)

(assert (=> b!823624 (= lt!370802 (addApplyDifferent!311 lt!370794 lt!370813 minValue!754 lt!370809))))

(assert (=> b!823624 (= (apply!358 (+!1892 lt!370794 (tuple2!9751 lt!370813 minValue!754)) lt!370809) (apply!358 lt!370794 lt!370809))))

(declare-fun lt!370800 () Unit!28155)

(assert (=> b!823624 (= lt!370800 lt!370802)))

(declare-fun lt!370803 () ListLongMap!8575)

(assert (=> b!823624 (= lt!370803 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370805 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370792 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370792 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!370804 () Unit!28155)

(assert (=> b!823624 (= lt!370804 (addApplyDifferent!311 lt!370803 lt!370805 zeroValueAfter!34 lt!370792))))

(assert (=> b!823624 (= (apply!358 (+!1892 lt!370803 (tuple2!9751 lt!370805 zeroValueAfter!34)) lt!370792) (apply!358 lt!370803 lt!370792))))

(declare-fun lt!370795 () Unit!28155)

(assert (=> b!823624 (= lt!370795 lt!370804)))

(declare-fun lt!370808 () ListLongMap!8575)

(assert (=> b!823624 (= lt!370808 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370807 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!370799 () (_ BitVec 64))

(assert (=> b!823624 (= lt!370799 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823624 (= lt!370801 (addApplyDifferent!311 lt!370808 lt!370807 minValue!754 lt!370799))))

(assert (=> b!823624 (= (apply!358 (+!1892 lt!370808 (tuple2!9751 lt!370807 minValue!754)) lt!370799) (apply!358 lt!370808 lt!370799))))

(declare-fun b!823625 () Bool)

(assert (=> b!823625 (= e!458031 e!458041)))

(declare-fun c!89575 () Bool)

(assert (=> b!823625 (= c!89575 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35825 () Bool)

(assert (=> bm!35825 (= call!35828 (contains!4147 lt!370797 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!823626 () Bool)

(declare-fun e!458035 () Bool)

(assert (=> b!823626 (= e!458043 e!458035)))

(declare-fun res!561462 () Bool)

(assert (=> b!823626 (=> (not res!561462) (not e!458035))))

(assert (=> b!823626 (= res!561462 (contains!4147 lt!370797 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823626 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823627 () Bool)

(assert (=> b!823627 (= e!458035 (= (apply!358 lt!370797 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)) (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!823627 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22349 _values!788)))))

(assert (=> b!823627 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun bm!35826 () Bool)

(assert (=> bm!35826 (= call!35826 call!35824)))

(assert (= (and d!105163 c!89577) b!823612))

(assert (= (and d!105163 (not c!89577)) b!823607))

(assert (= (and b!823607 c!89576) b!823622))

(assert (= (and b!823607 (not c!89576)) b!823618))

(assert (= (and b!823618 c!89578) b!823623))

(assert (= (and b!823618 (not c!89578)) b!823611))

(assert (= (or b!823623 b!823611) bm!35820))

(assert (= (or b!823622 bm!35820) bm!35826))

(assert (= (or b!823622 b!823623) bm!35821))

(assert (= (or b!823612 bm!35826) bm!35822))

(assert (= (or b!823612 bm!35821) bm!35824))

(assert (= (and d!105163 res!561461) b!823609))

(assert (= (and d!105163 c!89579) b!823624))

(assert (= (and d!105163 (not c!89579)) b!823613))

(assert (= (and d!105163 res!561457) b!823610))

(assert (= (and b!823610 res!561456) b!823615))

(assert (= (and b!823610 (not res!561458)) b!823626))

(assert (= (and b!823626 res!561462) b!823627))

(assert (= (and b!823610 res!561460) b!823617))

(assert (= (and b!823617 c!89580) b!823608))

(assert (= (and b!823617 (not c!89580)) b!823614))

(assert (= (and b!823608 res!561463) b!823620))

(assert (= (or b!823608 b!823614) bm!35823))

(assert (= (and b!823617 res!561455) b!823625))

(assert (= (and b!823625 c!89575) b!823616))

(assert (= (and b!823625 (not c!89575)) b!823619))

(assert (= (and b!823616 res!561459) b!823621))

(assert (= (or b!823616 b!823619) bm!35825))

(declare-fun b_lambda!11047 () Bool)

(assert (=> (not b_lambda!11047) (not b!823627)))

(assert (=> b!823627 t!21869))

(declare-fun b_and!21965 () Bool)

(assert (= b_and!21963 (and (=> t!21869 result!7923) b_and!21965)))

(declare-fun m!765937 () Bool)

(assert (=> bm!35825 m!765937))

(assert (=> b!823627 m!765853))

(assert (=> b!823627 m!765887))

(assert (=> b!823627 m!765889))

(assert (=> b!823627 m!765891))

(assert (=> b!823627 m!765853))

(declare-fun m!765939 () Bool)

(assert (=> b!823627 m!765939))

(assert (=> b!823627 m!765889))

(assert (=> b!823627 m!765887))

(declare-fun m!765941 () Bool)

(assert (=> b!823620 m!765941))

(assert (=> b!823615 m!765853))

(assert (=> b!823615 m!765853))

(assert (=> b!823615 m!765861))

(declare-fun m!765943 () Bool)

(assert (=> bm!35823 m!765943))

(declare-fun m!765945 () Bool)

(assert (=> b!823621 m!765945))

(assert (=> b!823626 m!765853))

(assert (=> b!823626 m!765853))

(declare-fun m!765947 () Bool)

(assert (=> b!823626 m!765947))

(declare-fun m!765949 () Bool)

(assert (=> b!823624 m!765949))

(declare-fun m!765951 () Bool)

(assert (=> b!823624 m!765951))

(assert (=> b!823624 m!765853))

(declare-fun m!765953 () Bool)

(assert (=> b!823624 m!765953))

(declare-fun m!765955 () Bool)

(assert (=> b!823624 m!765955))

(assert (=> b!823624 m!765763))

(declare-fun m!765957 () Bool)

(assert (=> b!823624 m!765957))

(declare-fun m!765959 () Bool)

(assert (=> b!823624 m!765959))

(assert (=> b!823624 m!765953))

(declare-fun m!765961 () Bool)

(assert (=> b!823624 m!765961))

(declare-fun m!765963 () Bool)

(assert (=> b!823624 m!765963))

(declare-fun m!765965 () Bool)

(assert (=> b!823624 m!765965))

(assert (=> b!823624 m!765957))

(declare-fun m!765967 () Bool)

(assert (=> b!823624 m!765967))

(assert (=> b!823624 m!765963))

(declare-fun m!765969 () Bool)

(assert (=> b!823624 m!765969))

(declare-fun m!765971 () Bool)

(assert (=> b!823624 m!765971))

(declare-fun m!765973 () Bool)

(assert (=> b!823624 m!765973))

(assert (=> b!823624 m!765951))

(declare-fun m!765975 () Bool)

(assert (=> b!823624 m!765975))

(declare-fun m!765977 () Bool)

(assert (=> b!823624 m!765977))

(declare-fun m!765979 () Bool)

(assert (=> bm!35824 m!765979))

(assert (=> b!823609 m!765853))

(assert (=> b!823609 m!765853))

(assert (=> b!823609 m!765861))

(declare-fun m!765981 () Bool)

(assert (=> b!823612 m!765981))

(assert (=> bm!35822 m!765763))

(assert (=> d!105163 m!765755))

(assert (=> b!823471 d!105163))

(declare-fun d!105165 () Bool)

(declare-fun e!458044 () Bool)

(assert (=> d!105165 e!458044))

(declare-fun res!561464 () Bool)

(assert (=> d!105165 (=> (not res!561464) (not e!458044))))

(declare-fun lt!370816 () ListLongMap!8575)

(assert (=> d!105165 (= res!561464 (contains!4147 lt!370816 (_1!4886 lt!370638)))))

(declare-fun lt!370815 () List!15536)

(assert (=> d!105165 (= lt!370816 (ListLongMap!8576 lt!370815))))

(declare-fun lt!370814 () Unit!28155)

(declare-fun lt!370817 () Unit!28155)

(assert (=> d!105165 (= lt!370814 lt!370817)))

(assert (=> d!105165 (= (getValueByKey!405 lt!370815 (_1!4886 lt!370638)) (Some!410 (_2!4886 lt!370638)))))

(assert (=> d!105165 (= lt!370817 (lemmaContainsTupThenGetReturnValue!219 lt!370815 (_1!4886 lt!370638) (_2!4886 lt!370638)))))

(assert (=> d!105165 (= lt!370815 (insertStrictlySorted!258 (toList!4303 lt!370637) (_1!4886 lt!370638) (_2!4886 lt!370638)))))

(assert (=> d!105165 (= (+!1892 lt!370637 lt!370638) lt!370816)))

(declare-fun b!823628 () Bool)

(declare-fun res!561465 () Bool)

(assert (=> b!823628 (=> (not res!561465) (not e!458044))))

(assert (=> b!823628 (= res!561465 (= (getValueByKey!405 (toList!4303 lt!370816) (_1!4886 lt!370638)) (Some!410 (_2!4886 lt!370638))))))

(declare-fun b!823629 () Bool)

(assert (=> b!823629 (= e!458044 (contains!4148 (toList!4303 lt!370816) lt!370638))))

(assert (= (and d!105165 res!561464) b!823628))

(assert (= (and b!823628 res!561465) b!823629))

(declare-fun m!765983 () Bool)

(assert (=> d!105165 m!765983))

(declare-fun m!765985 () Bool)

(assert (=> d!105165 m!765985))

(declare-fun m!765987 () Bool)

(assert (=> d!105165 m!765987))

(declare-fun m!765989 () Bool)

(assert (=> d!105165 m!765989))

(declare-fun m!765991 () Bool)

(assert (=> b!823628 m!765991))

(declare-fun m!765993 () Bool)

(assert (=> b!823629 m!765993))

(assert (=> b!823471 d!105165))

(declare-fun d!105167 () Bool)

(declare-fun e!458045 () Bool)

(assert (=> d!105167 e!458045))

(declare-fun res!561466 () Bool)

(assert (=> d!105167 (=> (not res!561466) (not e!458045))))

(declare-fun lt!370820 () ListLongMap!8575)

(assert (=> d!105167 (= res!561466 (contains!4147 lt!370820 (_1!4886 lt!370640)))))

(declare-fun lt!370819 () List!15536)

(assert (=> d!105167 (= lt!370820 (ListLongMap!8576 lt!370819))))

(declare-fun lt!370818 () Unit!28155)

(declare-fun lt!370821 () Unit!28155)

(assert (=> d!105167 (= lt!370818 lt!370821)))

(assert (=> d!105167 (= (getValueByKey!405 lt!370819 (_1!4886 lt!370640)) (Some!410 (_2!4886 lt!370640)))))

(assert (=> d!105167 (= lt!370821 (lemmaContainsTupThenGetReturnValue!219 lt!370819 (_1!4886 lt!370640) (_2!4886 lt!370640)))))

(assert (=> d!105167 (= lt!370819 (insertStrictlySorted!258 (toList!4303 (+!1892 lt!370634 lt!370638)) (_1!4886 lt!370640) (_2!4886 lt!370640)))))

(assert (=> d!105167 (= (+!1892 (+!1892 lt!370634 lt!370638) lt!370640) lt!370820)))

(declare-fun b!823630 () Bool)

(declare-fun res!561467 () Bool)

(assert (=> b!823630 (=> (not res!561467) (not e!458045))))

(assert (=> b!823630 (= res!561467 (= (getValueByKey!405 (toList!4303 lt!370820) (_1!4886 lt!370640)) (Some!410 (_2!4886 lt!370640))))))

(declare-fun b!823631 () Bool)

(assert (=> b!823631 (= e!458045 (contains!4148 (toList!4303 lt!370820) lt!370640))))

(assert (= (and d!105167 res!561466) b!823630))

(assert (= (and b!823630 res!561467) b!823631))

(declare-fun m!765995 () Bool)

(assert (=> d!105167 m!765995))

(declare-fun m!765997 () Bool)

(assert (=> d!105167 m!765997))

(declare-fun m!765999 () Bool)

(assert (=> d!105167 m!765999))

(declare-fun m!766001 () Bool)

(assert (=> d!105167 m!766001))

(declare-fun m!766003 () Bool)

(assert (=> b!823630 m!766003))

(declare-fun m!766005 () Bool)

(assert (=> b!823631 m!766005))

(assert (=> b!823471 d!105167))

(declare-fun d!105169 () Bool)

(declare-fun e!458046 () Bool)

(assert (=> d!105169 e!458046))

(declare-fun res!561468 () Bool)

(assert (=> d!105169 (=> (not res!561468) (not e!458046))))

(declare-fun lt!370824 () ListLongMap!8575)

(assert (=> d!105169 (= res!561468 (contains!4147 lt!370824 (_1!4886 lt!370638)))))

(declare-fun lt!370823 () List!15536)

(assert (=> d!105169 (= lt!370824 (ListLongMap!8576 lt!370823))))

(declare-fun lt!370822 () Unit!28155)

(declare-fun lt!370825 () Unit!28155)

(assert (=> d!105169 (= lt!370822 lt!370825)))

(assert (=> d!105169 (= (getValueByKey!405 lt!370823 (_1!4886 lt!370638)) (Some!410 (_2!4886 lt!370638)))))

(assert (=> d!105169 (= lt!370825 (lemmaContainsTupThenGetReturnValue!219 lt!370823 (_1!4886 lt!370638) (_2!4886 lt!370638)))))

(assert (=> d!105169 (= lt!370823 (insertStrictlySorted!258 (toList!4303 lt!370634) (_1!4886 lt!370638) (_2!4886 lt!370638)))))

(assert (=> d!105169 (= (+!1892 lt!370634 lt!370638) lt!370824)))

(declare-fun b!823632 () Bool)

(declare-fun res!561469 () Bool)

(assert (=> b!823632 (=> (not res!561469) (not e!458046))))

(assert (=> b!823632 (= res!561469 (= (getValueByKey!405 (toList!4303 lt!370824) (_1!4886 lt!370638)) (Some!410 (_2!4886 lt!370638))))))

(declare-fun b!823633 () Bool)

(assert (=> b!823633 (= e!458046 (contains!4148 (toList!4303 lt!370824) lt!370638))))

(assert (= (and d!105169 res!561468) b!823632))

(assert (= (and b!823632 res!561469) b!823633))

(declare-fun m!766007 () Bool)

(assert (=> d!105169 m!766007))

(declare-fun m!766009 () Bool)

(assert (=> d!105169 m!766009))

(declare-fun m!766011 () Bool)

(assert (=> d!105169 m!766011))

(declare-fun m!766013 () Bool)

(assert (=> d!105169 m!766013))

(declare-fun m!766015 () Bool)

(assert (=> b!823632 m!766015))

(declare-fun m!766017 () Bool)

(assert (=> b!823633 m!766017))

(assert (=> b!823471 d!105169))

(declare-fun d!105171 () Bool)

(assert (=> d!105171 (= (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!370828 () Unit!28155)

(declare-fun choose!1406 (array!45765 array!45767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24715 V!24715 V!24715 V!24715 (_ BitVec 32) Int) Unit!28155)

(assert (=> d!105171 (= lt!370828 (choose!1406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105171 (validMask!0 mask!1312)))

(assert (=> d!105171 (= (lemmaNoChangeToArrayThenSameMapNoExtras!476 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370828)))

(declare-fun bs!22972 () Bool)

(assert (= bs!22972 d!105171))

(assert (=> bs!22972 m!765765))

(assert (=> bs!22972 m!765763))

(declare-fun m!766019 () Bool)

(assert (=> bs!22972 m!766019))

(assert (=> bs!22972 m!765755))

(assert (=> b!823473 d!105171))

(declare-fun d!105173 () Bool)

(declare-fun e!458066 () Bool)

(assert (=> d!105173 e!458066))

(declare-fun res!561480 () Bool)

(assert (=> d!105173 (=> (not res!561480) (not e!458066))))

(declare-fun lt!370848 () ListLongMap!8575)

(assert (=> d!105173 (= res!561480 (not (contains!4147 lt!370848 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!458062 () ListLongMap!8575)

(assert (=> d!105173 (= lt!370848 e!458062)))

(declare-fun c!89590 () Bool)

(assert (=> d!105173 (= c!89590 (bvsge #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> d!105173 (validMask!0 mask!1312)))

(assert (=> d!105173 (= (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370848)))

(declare-fun call!35832 () ListLongMap!8575)

(declare-fun bm!35829 () Bool)

(assert (=> bm!35829 (= call!35832 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun e!458063 () Bool)

(declare-fun b!823658 () Bool)

(assert (=> b!823658 (= e!458063 (= lt!370848 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!823659 () Bool)

(declare-fun e!458067 () ListLongMap!8575)

(assert (=> b!823659 (= e!458067 call!35832)))

(declare-fun b!823660 () Bool)

(declare-fun e!458061 () Bool)

(assert (=> b!823660 (= e!458061 e!458063)))

(declare-fun c!89591 () Bool)

(assert (=> b!823660 (= c!89591 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823661 () Bool)

(assert (=> b!823661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> b!823661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22349 _values!788)))))

(declare-fun e!458064 () Bool)

(assert (=> b!823661 (= e!458064 (= (apply!358 lt!370848 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)) (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!823662 () Bool)

(assert (=> b!823662 (= e!458062 (ListLongMap!8576 Nil!15533))))

(declare-fun b!823663 () Bool)

(declare-fun res!561478 () Bool)

(assert (=> b!823663 (=> (not res!561478) (not e!458066))))

(assert (=> b!823663 (= res!561478 (not (contains!4147 lt!370848 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!823664 () Bool)

(declare-fun e!458065 () Bool)

(assert (=> b!823664 (= e!458065 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823664 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!823665 () Bool)

(declare-fun lt!370843 () Unit!28155)

(declare-fun lt!370847 () Unit!28155)

(assert (=> b!823665 (= lt!370843 lt!370847)))

(declare-fun lt!370845 () (_ BitVec 64))

(declare-fun lt!370846 () (_ BitVec 64))

(declare-fun lt!370849 () V!24715)

(declare-fun lt!370844 () ListLongMap!8575)

(assert (=> b!823665 (not (contains!4147 (+!1892 lt!370844 (tuple2!9751 lt!370845 lt!370849)) lt!370846))))

(declare-fun addStillNotContains!185 (ListLongMap!8575 (_ BitVec 64) V!24715 (_ BitVec 64)) Unit!28155)

(assert (=> b!823665 (= lt!370847 (addStillNotContains!185 lt!370844 lt!370845 lt!370849 lt!370846))))

(assert (=> b!823665 (= lt!370846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!823665 (= lt!370849 (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!823665 (= lt!370845 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823665 (= lt!370844 call!35832)))

(assert (=> b!823665 (= e!458067 (+!1892 call!35832 (tuple2!9751 (select (arr!21928 _keys!976) #b00000000000000000000000000000000) (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!823666 () Bool)

(assert (=> b!823666 (= e!458062 e!458067)))

(declare-fun c!89589 () Bool)

(assert (=> b!823666 (= c!89589 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823667 () Bool)

(assert (=> b!823667 (= e!458066 e!458061)))

(declare-fun c!89592 () Bool)

(assert (=> b!823667 (= c!89592 e!458065)))

(declare-fun res!561481 () Bool)

(assert (=> b!823667 (=> (not res!561481) (not e!458065))))

(assert (=> b!823667 (= res!561481 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823668 () Bool)

(declare-fun isEmpty!646 (ListLongMap!8575) Bool)

(assert (=> b!823668 (= e!458063 (isEmpty!646 lt!370848))))

(declare-fun b!823669 () Bool)

(assert (=> b!823669 (= e!458061 e!458064)))

(assert (=> b!823669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun res!561479 () Bool)

(assert (=> b!823669 (= res!561479 (contains!4147 lt!370848 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823669 (=> (not res!561479) (not e!458064))))

(assert (= (and d!105173 c!89590) b!823662))

(assert (= (and d!105173 (not c!89590)) b!823666))

(assert (= (and b!823666 c!89589) b!823665))

(assert (= (and b!823666 (not c!89589)) b!823659))

(assert (= (or b!823665 b!823659) bm!35829))

(assert (= (and d!105173 res!561480) b!823663))

(assert (= (and b!823663 res!561478) b!823667))

(assert (= (and b!823667 res!561481) b!823664))

(assert (= (and b!823667 c!89592) b!823669))

(assert (= (and b!823667 (not c!89592)) b!823660))

(assert (= (and b!823669 res!561479) b!823661))

(assert (= (and b!823660 c!89591) b!823658))

(assert (= (and b!823660 (not c!89591)) b!823668))

(declare-fun b_lambda!11049 () Bool)

(assert (=> (not b_lambda!11049) (not b!823661)))

(assert (=> b!823661 t!21869))

(declare-fun b_and!21967 () Bool)

(assert (= b_and!21965 (and (=> t!21869 result!7923) b_and!21967)))

(declare-fun b_lambda!11051 () Bool)

(assert (=> (not b_lambda!11051) (not b!823665)))

(assert (=> b!823665 t!21869))

(declare-fun b_and!21969 () Bool)

(assert (= b_and!21967 (and (=> t!21869 result!7923) b_and!21969)))

(assert (=> b!823661 m!765887))

(assert (=> b!823661 m!765853))

(assert (=> b!823661 m!765887))

(assert (=> b!823661 m!765889))

(assert (=> b!823661 m!765891))

(assert (=> b!823661 m!765889))

(assert (=> b!823661 m!765853))

(declare-fun m!766021 () Bool)

(assert (=> b!823661 m!766021))

(declare-fun m!766023 () Bool)

(assert (=> b!823668 m!766023))

(assert (=> b!823665 m!765887))

(assert (=> b!823665 m!765853))

(declare-fun m!766025 () Bool)

(assert (=> b!823665 m!766025))

(assert (=> b!823665 m!765889))

(declare-fun m!766027 () Bool)

(assert (=> b!823665 m!766027))

(declare-fun m!766029 () Bool)

(assert (=> b!823665 m!766029))

(declare-fun m!766031 () Bool)

(assert (=> b!823665 m!766031))

(assert (=> b!823665 m!765887))

(assert (=> b!823665 m!765889))

(assert (=> b!823665 m!765891))

(assert (=> b!823665 m!766027))

(assert (=> b!823669 m!765853))

(assert (=> b!823669 m!765853))

(declare-fun m!766033 () Bool)

(assert (=> b!823669 m!766033))

(declare-fun m!766035 () Bool)

(assert (=> b!823663 m!766035))

(declare-fun m!766037 () Bool)

(assert (=> b!823658 m!766037))

(assert (=> b!823666 m!765853))

(assert (=> b!823666 m!765853))

(assert (=> b!823666 m!765861))

(assert (=> b!823664 m!765853))

(assert (=> b!823664 m!765853))

(assert (=> b!823664 m!765861))

(declare-fun m!766039 () Bool)

(assert (=> d!105173 m!766039))

(assert (=> d!105173 m!765755))

(assert (=> bm!35829 m!766037))

(assert (=> b!823473 d!105173))

(declare-fun d!105175 () Bool)

(declare-fun e!458073 () Bool)

(assert (=> d!105175 e!458073))

(declare-fun res!561484 () Bool)

(assert (=> d!105175 (=> (not res!561484) (not e!458073))))

(declare-fun lt!370855 () ListLongMap!8575)

(assert (=> d!105175 (= res!561484 (not (contains!4147 lt!370855 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!458069 () ListLongMap!8575)

(assert (=> d!105175 (= lt!370855 e!458069)))

(declare-fun c!89594 () Bool)

(assert (=> d!105175 (= c!89594 (bvsge #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> d!105175 (validMask!0 mask!1312)))

(assert (=> d!105175 (= (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!370855)))

(declare-fun bm!35830 () Bool)

(declare-fun call!35833 () ListLongMap!8575)

(assert (=> bm!35830 (= call!35833 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!823670 () Bool)

(declare-fun e!458070 () Bool)

(assert (=> b!823670 (= e!458070 (= lt!370855 (getCurrentListMapNoExtraKeys!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!823671 () Bool)

(declare-fun e!458074 () ListLongMap!8575)

(assert (=> b!823671 (= e!458074 call!35833)))

(declare-fun b!823672 () Bool)

(declare-fun e!458068 () Bool)

(assert (=> b!823672 (= e!458068 e!458070)))

(declare-fun c!89595 () Bool)

(assert (=> b!823672 (= c!89595 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823673 () Bool)

(assert (=> b!823673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> b!823673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22349 _values!788)))))

(declare-fun e!458071 () Bool)

(assert (=> b!823673 (= e!458071 (= (apply!358 lt!370855 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)) (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!823674 () Bool)

(assert (=> b!823674 (= e!458069 (ListLongMap!8576 Nil!15533))))

(declare-fun b!823675 () Bool)

(declare-fun res!561482 () Bool)

(assert (=> b!823675 (=> (not res!561482) (not e!458073))))

(assert (=> b!823675 (= res!561482 (not (contains!4147 lt!370855 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!823676 () Bool)

(declare-fun e!458072 () Bool)

(assert (=> b!823676 (= e!458072 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823676 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!823677 () Bool)

(declare-fun lt!370850 () Unit!28155)

(declare-fun lt!370854 () Unit!28155)

(assert (=> b!823677 (= lt!370850 lt!370854)))

(declare-fun lt!370852 () (_ BitVec 64))

(declare-fun lt!370853 () (_ BitVec 64))

(declare-fun lt!370856 () V!24715)

(declare-fun lt!370851 () ListLongMap!8575)

(assert (=> b!823677 (not (contains!4147 (+!1892 lt!370851 (tuple2!9751 lt!370852 lt!370856)) lt!370853))))

(assert (=> b!823677 (= lt!370854 (addStillNotContains!185 lt!370851 lt!370852 lt!370856 lt!370853))))

(assert (=> b!823677 (= lt!370853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!823677 (= lt!370856 (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!823677 (= lt!370852 (select (arr!21928 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!823677 (= lt!370851 call!35833)))

(assert (=> b!823677 (= e!458074 (+!1892 call!35833 (tuple2!9751 (select (arr!21928 _keys!976) #b00000000000000000000000000000000) (get!11666 (select (arr!21929 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!823678 () Bool)

(assert (=> b!823678 (= e!458069 e!458074)))

(declare-fun c!89593 () Bool)

(assert (=> b!823678 (= c!89593 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823679 () Bool)

(assert (=> b!823679 (= e!458073 e!458068)))

(declare-fun c!89596 () Bool)

(assert (=> b!823679 (= c!89596 e!458072)))

(declare-fun res!561485 () Bool)

(assert (=> b!823679 (=> (not res!561485) (not e!458072))))

(assert (=> b!823679 (= res!561485 (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun b!823680 () Bool)

(assert (=> b!823680 (= e!458070 (isEmpty!646 lt!370855))))

(declare-fun b!823681 () Bool)

(assert (=> b!823681 (= e!458068 e!458071)))

(assert (=> b!823681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(declare-fun res!561483 () Bool)

(assert (=> b!823681 (= res!561483 (contains!4147 lt!370855 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!823681 (=> (not res!561483) (not e!458071))))

(assert (= (and d!105175 c!89594) b!823674))

(assert (= (and d!105175 (not c!89594)) b!823678))

(assert (= (and b!823678 c!89593) b!823677))

(assert (= (and b!823678 (not c!89593)) b!823671))

(assert (= (or b!823677 b!823671) bm!35830))

(assert (= (and d!105175 res!561484) b!823675))

(assert (= (and b!823675 res!561482) b!823679))

(assert (= (and b!823679 res!561485) b!823676))

(assert (= (and b!823679 c!89596) b!823681))

(assert (= (and b!823679 (not c!89596)) b!823672))

(assert (= (and b!823681 res!561483) b!823673))

(assert (= (and b!823672 c!89595) b!823670))

(assert (= (and b!823672 (not c!89595)) b!823680))

(declare-fun b_lambda!11053 () Bool)

(assert (=> (not b_lambda!11053) (not b!823673)))

(assert (=> b!823673 t!21869))

(declare-fun b_and!21971 () Bool)

(assert (= b_and!21969 (and (=> t!21869 result!7923) b_and!21971)))

(declare-fun b_lambda!11055 () Bool)

(assert (=> (not b_lambda!11055) (not b!823677)))

(assert (=> b!823677 t!21869))

(declare-fun b_and!21973 () Bool)

(assert (= b_and!21971 (and (=> t!21869 result!7923) b_and!21973)))

(assert (=> b!823673 m!765887))

(assert (=> b!823673 m!765853))

(assert (=> b!823673 m!765887))

(assert (=> b!823673 m!765889))

(assert (=> b!823673 m!765891))

(assert (=> b!823673 m!765889))

(assert (=> b!823673 m!765853))

(declare-fun m!766041 () Bool)

(assert (=> b!823673 m!766041))

(declare-fun m!766043 () Bool)

(assert (=> b!823680 m!766043))

(assert (=> b!823677 m!765887))

(assert (=> b!823677 m!765853))

(declare-fun m!766045 () Bool)

(assert (=> b!823677 m!766045))

(assert (=> b!823677 m!765889))

(declare-fun m!766047 () Bool)

(assert (=> b!823677 m!766047))

(declare-fun m!766049 () Bool)

(assert (=> b!823677 m!766049))

(declare-fun m!766051 () Bool)

(assert (=> b!823677 m!766051))

(assert (=> b!823677 m!765887))

(assert (=> b!823677 m!765889))

(assert (=> b!823677 m!765891))

(assert (=> b!823677 m!766047))

(assert (=> b!823681 m!765853))

(assert (=> b!823681 m!765853))

(declare-fun m!766053 () Bool)

(assert (=> b!823681 m!766053))

(declare-fun m!766055 () Bool)

(assert (=> b!823675 m!766055))

(declare-fun m!766057 () Bool)

(assert (=> b!823670 m!766057))

(assert (=> b!823678 m!765853))

(assert (=> b!823678 m!765853))

(assert (=> b!823678 m!765861))

(assert (=> b!823676 m!765853))

(assert (=> b!823676 m!765853))

(assert (=> b!823676 m!765861))

(declare-fun m!766059 () Bool)

(assert (=> d!105175 m!766059))

(assert (=> d!105175 m!765755))

(assert (=> bm!35830 m!766057))

(assert (=> b!823473 d!105175))

(declare-fun b!823692 () Bool)

(declare-fun e!458083 () Bool)

(declare-fun call!35836 () Bool)

(assert (=> b!823692 (= e!458083 call!35836)))

(declare-fun b!823693 () Bool)

(assert (=> b!823693 (= e!458083 call!35836)))

(declare-fun b!823694 () Bool)

(declare-fun e!458085 () Bool)

(declare-fun e!458084 () Bool)

(assert (=> b!823694 (= e!458085 e!458084)))

(declare-fun res!561493 () Bool)

(assert (=> b!823694 (=> (not res!561493) (not e!458084))))

(declare-fun e!458086 () Bool)

(assert (=> b!823694 (= res!561493 (not e!458086))))

(declare-fun res!561494 () Bool)

(assert (=> b!823694 (=> (not res!561494) (not e!458086))))

(assert (=> b!823694 (= res!561494 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823695 () Bool)

(declare-fun contains!4149 (List!15535 (_ BitVec 64)) Bool)

(assert (=> b!823695 (= e!458086 (contains!4149 Nil!15532 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35833 () Bool)

(declare-fun c!89599 () Bool)

(assert (=> bm!35833 (= call!35836 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89599 (Cons!15531 (select (arr!21928 _keys!976) #b00000000000000000000000000000000) Nil!15532) Nil!15532)))))

(declare-fun d!105177 () Bool)

(declare-fun res!561492 () Bool)

(assert (=> d!105177 (=> res!561492 e!458085)))

(assert (=> d!105177 (= res!561492 (bvsge #b00000000000000000000000000000000 (size!22348 _keys!976)))))

(assert (=> d!105177 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15532) e!458085)))

(declare-fun b!823696 () Bool)

(assert (=> b!823696 (= e!458084 e!458083)))

(assert (=> b!823696 (= c!89599 (validKeyInArray!0 (select (arr!21928 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105177 (not res!561492)) b!823694))

(assert (= (and b!823694 res!561494) b!823695))

(assert (= (and b!823694 res!561493) b!823696))

(assert (= (and b!823696 c!89599) b!823693))

(assert (= (and b!823696 (not c!89599)) b!823692))

(assert (= (or b!823693 b!823692) bm!35833))

(assert (=> b!823694 m!765853))

(assert (=> b!823694 m!765853))

(assert (=> b!823694 m!765861))

(assert (=> b!823695 m!765853))

(assert (=> b!823695 m!765853))

(declare-fun m!766061 () Bool)

(assert (=> b!823695 m!766061))

(assert (=> bm!35833 m!765853))

(declare-fun m!766063 () Bool)

(assert (=> bm!35833 m!766063))

(assert (=> b!823696 m!765853))

(assert (=> b!823696 m!765853))

(assert (=> b!823696 m!765861))

(assert (=> b!823468 d!105177))

(declare-fun mapNonEmpty!23797 () Bool)

(declare-fun mapRes!23797 () Bool)

(declare-fun tp!45985 () Bool)

(declare-fun e!458092 () Bool)

(assert (=> mapNonEmpty!23797 (= mapRes!23797 (and tp!45985 e!458092))))

(declare-fun mapKey!23797 () (_ BitVec 32))

(declare-fun mapRest!23797 () (Array (_ BitVec 32) ValueCell!6977))

(declare-fun mapValue!23797 () ValueCell!6977)

(assert (=> mapNonEmpty!23797 (= mapRest!23788 (store mapRest!23797 mapKey!23797 mapValue!23797))))

(declare-fun b!823704 () Bool)

(declare-fun e!458091 () Bool)

(assert (=> b!823704 (= e!458091 tp_is_empty!14785)))

(declare-fun b!823703 () Bool)

(assert (=> b!823703 (= e!458092 tp_is_empty!14785)))

(declare-fun mapIsEmpty!23797 () Bool)

(assert (=> mapIsEmpty!23797 mapRes!23797))

(declare-fun condMapEmpty!23797 () Bool)

(declare-fun mapDefault!23797 () ValueCell!6977)

(assert (=> mapNonEmpty!23788 (= condMapEmpty!23797 (= mapRest!23788 ((as const (Array (_ BitVec 32) ValueCell!6977)) mapDefault!23797)))))

(assert (=> mapNonEmpty!23788 (= tp!45969 (and e!458091 mapRes!23797))))

(assert (= (and mapNonEmpty!23788 condMapEmpty!23797) mapIsEmpty!23797))

(assert (= (and mapNonEmpty!23788 (not condMapEmpty!23797)) mapNonEmpty!23797))

(assert (= (and mapNonEmpty!23797 ((_ is ValueCellFull!6977) mapValue!23797)) b!823703))

(assert (= (and mapNonEmpty!23788 ((_ is ValueCellFull!6977) mapDefault!23797)) b!823704))

(declare-fun m!766065 () Bool)

(assert (=> mapNonEmpty!23797 m!766065))

(declare-fun b_lambda!11057 () Bool)

(assert (= b_lambda!11053 (or (and start!70984 b_free!13075) b_lambda!11057)))

(declare-fun b_lambda!11059 () Bool)

(assert (= b_lambda!11047 (or (and start!70984 b_free!13075) b_lambda!11059)))

(declare-fun b_lambda!11061 () Bool)

(assert (= b_lambda!11049 (or (and start!70984 b_free!13075) b_lambda!11061)))

(declare-fun b_lambda!11063 () Bool)

(assert (= b_lambda!11055 (or (and start!70984 b_free!13075) b_lambda!11063)))

(declare-fun b_lambda!11065 () Bool)

(assert (= b_lambda!11045 (or (and start!70984 b_free!13075) b_lambda!11065)))

(declare-fun b_lambda!11067 () Bool)

(assert (= b_lambda!11051 (or (and start!70984 b_free!13075) b_lambda!11067)))

(check-sat (not b!823612) (not bm!35822) (not b_lambda!11065) (not b!823658) (not d!105159) (not b!823540) (not bm!35830) (not d!105175) (not b!823615) (not b!823592) (not b_lambda!11063) (not mapNonEmpty!23797) (not b!823598) (not b!823633) (not b!823668) (not b!823666) (not b!823675) (not b!823661) (not b!823680) (not bm!35823) (not b!823670) (not b_lambda!11061) (not b_next!13075) (not d!105165) (not b!823664) (not bm!35833) (not b_lambda!11059) (not d!105173) (not d!105163) (not b!823677) (not b!823669) (not b!823631) (not b!823626) (not b!823630) (not d!105169) (not bm!35816) (not b!823629) (not b!823678) (not b!823681) (not b_lambda!11067) b_and!21973 (not b!823533) (not b!823604) (not b!823624) (not bm!35798) (not b!823597) (not b_lambda!11057) (not b!823628) (not d!105157) (not b!823665) (not b!823603) (not bm!35824) (not b!823663) (not bm!35815) (not b!823694) (not b!823620) (not b!823589) (not b!823586) (not b!823609) (not d!105171) (not bm!35818) (not b!823627) (not bm!35825) (not d!105161) (not b!823673) (not b!823535) (not b!823632) (not d!105167) (not b!823695) (not bm!35817) (not b!823696) (not bm!35829) (not b!823676) (not b!823621) (not b!823541) (not b!823601) tp_is_empty!14785)
(check-sat b_and!21973 (not b_next!13075))
