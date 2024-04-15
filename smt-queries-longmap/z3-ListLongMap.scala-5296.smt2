; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70946 () Bool)

(assert start!70946)

(declare-fun b_free!13183 () Bool)

(declare-fun b_next!13183 () Bool)

(assert (=> start!70946 (= b_free!13183 (not b_next!13183))))

(declare-fun tp!46300 () Bool)

(declare-fun b_and!22053 () Bool)

(assert (=> start!70946 (= tp!46300 b_and!22053)))

(declare-fun b!823912 () Bool)

(declare-fun res!561823 () Bool)

(declare-fun e!458338 () Bool)

(assert (=> b!823912 (=> (not res!561823) (not e!458338))))

(declare-datatypes ((array!45943 0))(
  ( (array!45944 (arr!22020 (Array (_ BitVec 32) (_ BitVec 64))) (size!22441 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45943)

(declare-datatypes ((List!15718 0))(
  ( (Nil!15715) (Cons!15714 (h!16843 (_ BitVec 64)) (t!22050 List!15718)) )
))
(declare-fun arrayNoDuplicates!0 (array!45943 (_ BitVec 32) List!15718) Bool)

(assert (=> b!823912 (= res!561823 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15715))))

(declare-fun res!561825 () Bool)

(assert (=> start!70946 (=> (not res!561825) (not e!458338))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70946 (= res!561825 (validMask!0 mask!1312))))

(assert (=> start!70946 e!458338))

(declare-fun tp_is_empty!14893 () Bool)

(assert (=> start!70946 tp_is_empty!14893))

(declare-fun array_inv!17637 (array!45943) Bool)

(assert (=> start!70946 (array_inv!17637 _keys!976)))

(assert (=> start!70946 true))

(declare-datatypes ((V!24859 0))(
  ( (V!24860 (val!7494 Int)) )
))
(declare-datatypes ((ValueCell!7031 0))(
  ( (ValueCellFull!7031 (v!9921 V!24859)) (EmptyCell!7031) )
))
(declare-datatypes ((array!45945 0))(
  ( (array!45946 (arr!22021 (Array (_ BitVec 32) ValueCell!7031)) (size!22442 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45945)

(declare-fun e!458337 () Bool)

(declare-fun array_inv!17638 (array!45945) Bool)

(assert (=> start!70946 (and (array_inv!17638 _values!788) e!458337)))

(assert (=> start!70946 tp!46300))

(declare-fun b!823913 () Bool)

(declare-fun res!561824 () Bool)

(assert (=> b!823913 (=> (not res!561824) (not e!458338))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823913 (= res!561824 (and (= (size!22442 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22441 _keys!976) (size!22442 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823914 () Bool)

(declare-fun e!458336 () Bool)

(assert (=> b!823914 (= e!458336 tp_is_empty!14893)))

(declare-fun mapIsEmpty!23956 () Bool)

(declare-fun mapRes!23956 () Bool)

(assert (=> mapIsEmpty!23956 mapRes!23956))

(declare-fun mapNonEmpty!23956 () Bool)

(declare-fun tp!46299 () Bool)

(assert (=> mapNonEmpty!23956 (= mapRes!23956 (and tp!46299 e!458336))))

(declare-fun mapRest!23956 () (Array (_ BitVec 32) ValueCell!7031))

(declare-fun mapKey!23956 () (_ BitVec 32))

(declare-fun mapValue!23956 () ValueCell!7031)

(assert (=> mapNonEmpty!23956 (= (arr!22021 _values!788) (store mapRest!23956 mapKey!23956 mapValue!23956))))

(declare-fun b!823915 () Bool)

(declare-fun e!458335 () Bool)

(assert (=> b!823915 (= e!458337 (and e!458335 mapRes!23956))))

(declare-fun condMapEmpty!23956 () Bool)

(declare-fun mapDefault!23956 () ValueCell!7031)

(assert (=> b!823915 (= condMapEmpty!23956 (= (arr!22021 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7031)) mapDefault!23956)))))

(declare-fun b!823916 () Bool)

(assert (=> b!823916 (= e!458335 tp_is_empty!14893)))

(declare-fun b!823917 () Bool)

(declare-fun res!561826 () Bool)

(assert (=> b!823917 (=> (not res!561826) (not e!458338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45943 (_ BitVec 32)) Bool)

(assert (=> b!823917 (= res!561826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823918 () Bool)

(assert (=> b!823918 (= e!458338 (not (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!22441 _keys!976)))))))

(declare-datatypes ((tuple2!9918 0))(
  ( (tuple2!9919 (_1!4970 (_ BitVec 64)) (_2!4970 V!24859)) )
))
(declare-datatypes ((List!15719 0))(
  ( (Nil!15716) (Cons!15715 (h!16844 tuple2!9918) (t!22051 List!15719)) )
))
(declare-datatypes ((ListLongMap!8731 0))(
  ( (ListLongMap!8732 (toList!4381 List!15719)) )
))
(declare-fun lt!371448 () ListLongMap!8731)

(declare-fun lt!371449 () ListLongMap!8731)

(assert (=> b!823918 (= lt!371448 lt!371449)))

(declare-fun zeroValueBefore!34 () V!24859)

(declare-fun zeroValueAfter!34 () V!24859)

(declare-fun minValue!754 () V!24859)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28186 0))(
  ( (Unit!28187) )
))
(declare-fun lt!371447 () Unit!28186)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!518 (array!45943 array!45945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 V!24859 V!24859 (_ BitVec 32) Int) Unit!28186)

(assert (=> b!823918 (= lt!371447 (lemmaNoChangeToArrayThenSameMapNoExtras!518 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2425 (array!45943 array!45945 (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 (_ BitVec 32) Int) ListLongMap!8731)

(assert (=> b!823918 (= lt!371449 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823918 (= lt!371448 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70946 res!561825) b!823913))

(assert (= (and b!823913 res!561824) b!823917))

(assert (= (and b!823917 res!561826) b!823912))

(assert (= (and b!823912 res!561823) b!823918))

(assert (= (and b!823915 condMapEmpty!23956) mapIsEmpty!23956))

(assert (= (and b!823915 (not condMapEmpty!23956)) mapNonEmpty!23956))

(get-info :version)

(assert (= (and mapNonEmpty!23956 ((_ is ValueCellFull!7031) mapValue!23956)) b!823914))

(assert (= (and b!823915 ((_ is ValueCellFull!7031) mapDefault!23956)) b!823916))

(assert (= start!70946 b!823915))

(declare-fun m!765545 () Bool)

(assert (=> b!823918 m!765545))

(declare-fun m!765547 () Bool)

(assert (=> b!823918 m!765547))

(declare-fun m!765549 () Bool)

(assert (=> b!823918 m!765549))

(declare-fun m!765551 () Bool)

(assert (=> mapNonEmpty!23956 m!765551))

(declare-fun m!765553 () Bool)

(assert (=> b!823912 m!765553))

(declare-fun m!765555 () Bool)

(assert (=> b!823917 m!765555))

(declare-fun m!765557 () Bool)

(assert (=> start!70946 m!765557))

(declare-fun m!765559 () Bool)

(assert (=> start!70946 m!765559))

(declare-fun m!765561 () Bool)

(assert (=> start!70946 m!765561))

(check-sat (not start!70946) (not b!823918) (not b!823917) (not mapNonEmpty!23956) (not b!823912) b_and!22053 (not b_next!13183) tp_is_empty!14893)
(check-sat b_and!22053 (not b_next!13183))
(get-model)

(declare-fun b!823971 () Bool)

(declare-fun e!458379 () Bool)

(declare-fun e!458380 () Bool)

(assert (=> b!823971 (= e!458379 e!458380)))

(declare-fun c!89301 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!823971 (= c!89301 (validKeyInArray!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823972 () Bool)

(declare-fun e!458378 () Bool)

(assert (=> b!823972 (= e!458378 e!458379)))

(declare-fun res!561858 () Bool)

(assert (=> b!823972 (=> (not res!561858) (not e!458379))))

(declare-fun e!458377 () Bool)

(assert (=> b!823972 (= res!561858 (not e!458377))))

(declare-fun res!561859 () Bool)

(assert (=> b!823972 (=> (not res!561859) (not e!458377))))

(assert (=> b!823972 (= res!561859 (validKeyInArray!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104729 () Bool)

(declare-fun res!561857 () Bool)

(assert (=> d!104729 (=> res!561857 e!458378)))

(assert (=> d!104729 (= res!561857 (bvsge #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(assert (=> d!104729 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15715) e!458378)))

(declare-fun bm!35803 () Bool)

(declare-fun call!35806 () Bool)

(assert (=> bm!35803 (= call!35806 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89301 (Cons!15714 (select (arr!22020 _keys!976) #b00000000000000000000000000000000) Nil!15715) Nil!15715)))))

(declare-fun b!823973 () Bool)

(declare-fun contains!4154 (List!15718 (_ BitVec 64)) Bool)

(assert (=> b!823973 (= e!458377 (contains!4154 Nil!15715 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!823974 () Bool)

(assert (=> b!823974 (= e!458380 call!35806)))

(declare-fun b!823975 () Bool)

(assert (=> b!823975 (= e!458380 call!35806)))

(assert (= (and d!104729 (not res!561857)) b!823972))

(assert (= (and b!823972 res!561859) b!823973))

(assert (= (and b!823972 res!561858) b!823971))

(assert (= (and b!823971 c!89301) b!823975))

(assert (= (and b!823971 (not c!89301)) b!823974))

(assert (= (or b!823975 b!823974) bm!35803))

(declare-fun m!765599 () Bool)

(assert (=> b!823971 m!765599))

(assert (=> b!823971 m!765599))

(declare-fun m!765601 () Bool)

(assert (=> b!823971 m!765601))

(assert (=> b!823972 m!765599))

(assert (=> b!823972 m!765599))

(assert (=> b!823972 m!765601))

(assert (=> bm!35803 m!765599))

(declare-fun m!765603 () Bool)

(assert (=> bm!35803 m!765603))

(assert (=> b!823973 m!765599))

(assert (=> b!823973 m!765599))

(declare-fun m!765605 () Bool)

(assert (=> b!823973 m!765605))

(assert (=> b!823912 d!104729))

(declare-fun b!823984 () Bool)

(declare-fun e!458387 () Bool)

(declare-fun e!458388 () Bool)

(assert (=> b!823984 (= e!458387 e!458388)))

(declare-fun c!89304 () Bool)

(assert (=> b!823984 (= c!89304 (validKeyInArray!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35806 () Bool)

(declare-fun call!35809 () Bool)

(assert (=> bm!35806 (= call!35809 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!823985 () Bool)

(declare-fun e!458389 () Bool)

(assert (=> b!823985 (= e!458388 e!458389)))

(declare-fun lt!371475 () (_ BitVec 64))

(assert (=> b!823985 (= lt!371475 (select (arr!22020 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!371476 () Unit!28186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45943 (_ BitVec 64) (_ BitVec 32)) Unit!28186)

(assert (=> b!823985 (= lt!371476 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!371475 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!823985 (arrayContainsKey!0 _keys!976 lt!371475 #b00000000000000000000000000000000)))

(declare-fun lt!371474 () Unit!28186)

(assert (=> b!823985 (= lt!371474 lt!371476)))

(declare-fun res!561864 () Bool)

(declare-datatypes ((SeekEntryResult!8728 0))(
  ( (MissingZero!8728 (index!37283 (_ BitVec 32))) (Found!8728 (index!37284 (_ BitVec 32))) (Intermediate!8728 (undefined!9540 Bool) (index!37285 (_ BitVec 32)) (x!69540 (_ BitVec 32))) (Undefined!8728) (MissingVacant!8728 (index!37286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45943 (_ BitVec 32)) SeekEntryResult!8728)

(assert (=> b!823985 (= res!561864 (= (seekEntryOrOpen!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8728 #b00000000000000000000000000000000)))))

(assert (=> b!823985 (=> (not res!561864) (not e!458389))))

(declare-fun d!104731 () Bool)

(declare-fun res!561865 () Bool)

(assert (=> d!104731 (=> res!561865 e!458387)))

(assert (=> d!104731 (= res!561865 (bvsge #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(assert (=> d!104731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!458387)))

(declare-fun b!823986 () Bool)

(assert (=> b!823986 (= e!458389 call!35809)))

(declare-fun b!823987 () Bool)

(assert (=> b!823987 (= e!458388 call!35809)))

(assert (= (and d!104731 (not res!561865)) b!823984))

(assert (= (and b!823984 c!89304) b!823985))

(assert (= (and b!823984 (not c!89304)) b!823987))

(assert (= (and b!823985 res!561864) b!823986))

(assert (= (or b!823986 b!823987) bm!35806))

(assert (=> b!823984 m!765599))

(assert (=> b!823984 m!765599))

(assert (=> b!823984 m!765601))

(declare-fun m!765607 () Bool)

(assert (=> bm!35806 m!765607))

(assert (=> b!823985 m!765599))

(declare-fun m!765609 () Bool)

(assert (=> b!823985 m!765609))

(declare-fun m!765611 () Bool)

(assert (=> b!823985 m!765611))

(assert (=> b!823985 m!765599))

(declare-fun m!765613 () Bool)

(assert (=> b!823985 m!765613))

(assert (=> b!823917 d!104731))

(declare-fun d!104733 () Bool)

(assert (=> d!104733 (= (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!371479 () Unit!28186)

(declare-fun choose!1412 (array!45943 array!45945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24859 V!24859 V!24859 V!24859 (_ BitVec 32) Int) Unit!28186)

(assert (=> d!104733 (= lt!371479 (choose!1412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104733 (validMask!0 mask!1312)))

(assert (=> d!104733 (= (lemmaNoChangeToArrayThenSameMapNoExtras!518 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371479)))

(declare-fun bs!22983 () Bool)

(assert (= bs!22983 d!104733))

(assert (=> bs!22983 m!765549))

(assert (=> bs!22983 m!765547))

(declare-fun m!765615 () Bool)

(assert (=> bs!22983 m!765615))

(assert (=> bs!22983 m!765557))

(assert (=> b!823918 d!104733))

(declare-fun b!824012 () Bool)

(declare-fun lt!371494 () Unit!28186)

(declare-fun lt!371498 () Unit!28186)

(assert (=> b!824012 (= lt!371494 lt!371498)))

(declare-fun lt!371495 () ListLongMap!8731)

(declare-fun lt!371499 () V!24859)

(declare-fun lt!371500 () (_ BitVec 64))

(declare-fun lt!371497 () (_ BitVec 64))

(declare-fun contains!4155 (ListLongMap!8731 (_ BitVec 64)) Bool)

(declare-fun +!1937 (ListLongMap!8731 tuple2!9918) ListLongMap!8731)

(assert (=> b!824012 (not (contains!4155 (+!1937 lt!371495 (tuple2!9919 lt!371497 lt!371499)) lt!371500))))

(declare-fun addStillNotContains!186 (ListLongMap!8731 (_ BitVec 64) V!24859 (_ BitVec 64)) Unit!28186)

(assert (=> b!824012 (= lt!371498 (addStillNotContains!186 lt!371495 lt!371497 lt!371499 lt!371500))))

(assert (=> b!824012 (= lt!371500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11707 (ValueCell!7031 V!24859) V!24859)

(declare-fun dynLambda!974 (Int (_ BitVec 64)) V!24859)

(assert (=> b!824012 (= lt!371499 (get!11707 (select (arr!22021 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824012 (= lt!371497 (select (arr!22020 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35812 () ListLongMap!8731)

(assert (=> b!824012 (= lt!371495 call!35812)))

(declare-fun e!458404 () ListLongMap!8731)

(assert (=> b!824012 (= e!458404 (+!1937 call!35812 (tuple2!9919 (select (arr!22020 _keys!976) #b00000000000000000000000000000000) (get!11707 (select (arr!22021 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824013 () Bool)

(declare-fun e!458405 () Bool)

(assert (=> b!824013 (= e!458405 (validKeyInArray!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824013 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824014 () Bool)

(declare-fun e!458409 () Bool)

(declare-fun e!458410 () Bool)

(assert (=> b!824014 (= e!458409 e!458410)))

(declare-fun c!89316 () Bool)

(assert (=> b!824014 (= c!89316 e!458405)))

(declare-fun res!561875 () Bool)

(assert (=> b!824014 (=> (not res!561875) (not e!458405))))

(assert (=> b!824014 (= res!561875 (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(declare-fun b!824015 () Bool)

(declare-fun e!458407 () Bool)

(assert (=> b!824015 (= e!458410 e!458407)))

(declare-fun c!89314 () Bool)

(assert (=> b!824015 (= c!89314 (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(declare-fun lt!371496 () ListLongMap!8731)

(declare-fun b!824016 () Bool)

(assert (=> b!824016 (= e!458407 (= lt!371496 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!824017 () Bool)

(assert (=> b!824017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(assert (=> b!824017 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22442 _values!788)))))

(declare-fun e!458406 () Bool)

(declare-fun apply!360 (ListLongMap!8731 (_ BitVec 64)) V!24859)

(assert (=> b!824017 (= e!458406 (= (apply!360 lt!371496 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)) (get!11707 (select (arr!22021 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!824019 () Bool)

(declare-fun res!561876 () Bool)

(assert (=> b!824019 (=> (not res!561876) (not e!458409))))

(assert (=> b!824019 (= res!561876 (not (contains!4155 lt!371496 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!824020 () Bool)

(declare-fun e!458408 () ListLongMap!8731)

(assert (=> b!824020 (= e!458408 e!458404)))

(declare-fun c!89313 () Bool)

(assert (=> b!824020 (= c!89313 (validKeyInArray!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824021 () Bool)

(assert (=> b!824021 (= e!458404 call!35812)))

(declare-fun bm!35809 () Bool)

(assert (=> bm!35809 (= call!35812 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!824022 () Bool)

(assert (=> b!824022 (= e!458410 e!458406)))

(assert (=> b!824022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(declare-fun res!561877 () Bool)

(assert (=> b!824022 (= res!561877 (contains!4155 lt!371496 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824022 (=> (not res!561877) (not e!458406))))

(declare-fun b!824023 () Bool)

(assert (=> b!824023 (= e!458408 (ListLongMap!8732 Nil!15716))))

(declare-fun d!104735 () Bool)

(assert (=> d!104735 e!458409))

(declare-fun res!561874 () Bool)

(assert (=> d!104735 (=> (not res!561874) (not e!458409))))

(assert (=> d!104735 (= res!561874 (not (contains!4155 lt!371496 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104735 (= lt!371496 e!458408)))

(declare-fun c!89315 () Bool)

(assert (=> d!104735 (= c!89315 (bvsge #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(assert (=> d!104735 (validMask!0 mask!1312)))

(assert (=> d!104735 (= (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371496)))

(declare-fun b!824018 () Bool)

(declare-fun isEmpty!647 (ListLongMap!8731) Bool)

(assert (=> b!824018 (= e!458407 (isEmpty!647 lt!371496))))

(assert (= (and d!104735 c!89315) b!824023))

(assert (= (and d!104735 (not c!89315)) b!824020))

(assert (= (and b!824020 c!89313) b!824012))

(assert (= (and b!824020 (not c!89313)) b!824021))

(assert (= (or b!824012 b!824021) bm!35809))

(assert (= (and d!104735 res!561874) b!824019))

(assert (= (and b!824019 res!561876) b!824014))

(assert (= (and b!824014 res!561875) b!824013))

(assert (= (and b!824014 c!89316) b!824022))

(assert (= (and b!824014 (not c!89316)) b!824015))

(assert (= (and b!824022 res!561877) b!824017))

(assert (= (and b!824015 c!89314) b!824016))

(assert (= (and b!824015 (not c!89314)) b!824018))

(declare-fun b_lambda!11061 () Bool)

(assert (=> (not b_lambda!11061) (not b!824012)))

(declare-fun t!22055 () Bool)

(declare-fun tb!4193 () Bool)

(assert (=> (and start!70946 (= defaultEntry!796 defaultEntry!796) t!22055) tb!4193))

(declare-fun result!7935 () Bool)

(assert (=> tb!4193 (= result!7935 tp_is_empty!14893)))

(assert (=> b!824012 t!22055))

(declare-fun b_and!22059 () Bool)

(assert (= b_and!22053 (and (=> t!22055 result!7935) b_and!22059)))

(declare-fun b_lambda!11063 () Bool)

(assert (=> (not b_lambda!11063) (not b!824017)))

(assert (=> b!824017 t!22055))

(declare-fun b_and!22061 () Bool)

(assert (= b_and!22059 (and (=> t!22055 result!7935) b_and!22061)))

(assert (=> b!824013 m!765599))

(assert (=> b!824013 m!765599))

(assert (=> b!824013 m!765601))

(declare-fun m!765617 () Bool)

(assert (=> bm!35809 m!765617))

(declare-fun m!765619 () Bool)

(assert (=> b!824019 m!765619))

(assert (=> b!824016 m!765617))

(declare-fun m!765621 () Bool)

(assert (=> b!824018 m!765621))

(assert (=> b!824022 m!765599))

(assert (=> b!824022 m!765599))

(declare-fun m!765623 () Bool)

(assert (=> b!824022 m!765623))

(declare-fun m!765625 () Bool)

(assert (=> b!824017 m!765625))

(declare-fun m!765627 () Bool)

(assert (=> b!824017 m!765627))

(declare-fun m!765629 () Bool)

(assert (=> b!824017 m!765629))

(assert (=> b!824017 m!765627))

(assert (=> b!824017 m!765599))

(declare-fun m!765631 () Bool)

(assert (=> b!824017 m!765631))

(assert (=> b!824017 m!765625))

(assert (=> b!824017 m!765599))

(assert (=> b!824020 m!765599))

(assert (=> b!824020 m!765599))

(assert (=> b!824020 m!765601))

(declare-fun m!765633 () Bool)

(assert (=> b!824012 m!765633))

(declare-fun m!765635 () Bool)

(assert (=> b!824012 m!765635))

(assert (=> b!824012 m!765625))

(assert (=> b!824012 m!765627))

(assert (=> b!824012 m!765629))

(assert (=> b!824012 m!765627))

(declare-fun m!765637 () Bool)

(assert (=> b!824012 m!765637))

(assert (=> b!824012 m!765633))

(declare-fun m!765639 () Bool)

(assert (=> b!824012 m!765639))

(assert (=> b!824012 m!765625))

(assert (=> b!824012 m!765599))

(declare-fun m!765641 () Bool)

(assert (=> d!104735 m!765641))

(assert (=> d!104735 m!765557))

(assert (=> b!823918 d!104735))

(declare-fun b!824026 () Bool)

(declare-fun lt!371501 () Unit!28186)

(declare-fun lt!371505 () Unit!28186)

(assert (=> b!824026 (= lt!371501 lt!371505)))

(declare-fun lt!371502 () ListLongMap!8731)

(declare-fun lt!371506 () V!24859)

(declare-fun lt!371507 () (_ BitVec 64))

(declare-fun lt!371504 () (_ BitVec 64))

(assert (=> b!824026 (not (contains!4155 (+!1937 lt!371502 (tuple2!9919 lt!371504 lt!371506)) lt!371507))))

(assert (=> b!824026 (= lt!371505 (addStillNotContains!186 lt!371502 lt!371504 lt!371506 lt!371507))))

(assert (=> b!824026 (= lt!371507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!824026 (= lt!371506 (get!11707 (select (arr!22021 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!824026 (= lt!371504 (select (arr!22020 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35813 () ListLongMap!8731)

(assert (=> b!824026 (= lt!371502 call!35813)))

(declare-fun e!458411 () ListLongMap!8731)

(assert (=> b!824026 (= e!458411 (+!1937 call!35813 (tuple2!9919 (select (arr!22020 _keys!976) #b00000000000000000000000000000000) (get!11707 (select (arr!22021 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!824027 () Bool)

(declare-fun e!458412 () Bool)

(assert (=> b!824027 (= e!458412 (validKeyInArray!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824027 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!824028 () Bool)

(declare-fun e!458416 () Bool)

(declare-fun e!458417 () Bool)

(assert (=> b!824028 (= e!458416 e!458417)))

(declare-fun c!89320 () Bool)

(assert (=> b!824028 (= c!89320 e!458412)))

(declare-fun res!561879 () Bool)

(assert (=> b!824028 (=> (not res!561879) (not e!458412))))

(assert (=> b!824028 (= res!561879 (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(declare-fun b!824029 () Bool)

(declare-fun e!458414 () Bool)

(assert (=> b!824029 (= e!458417 e!458414)))

(declare-fun c!89318 () Bool)

(assert (=> b!824029 (= c!89318 (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(declare-fun b!824030 () Bool)

(declare-fun lt!371503 () ListLongMap!8731)

(assert (=> b!824030 (= e!458414 (= lt!371503 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!824031 () Bool)

(assert (=> b!824031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(assert (=> b!824031 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22442 _values!788)))))

(declare-fun e!458413 () Bool)

(assert (=> b!824031 (= e!458413 (= (apply!360 lt!371503 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)) (get!11707 (select (arr!22021 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!824033 () Bool)

(declare-fun res!561880 () Bool)

(assert (=> b!824033 (=> (not res!561880) (not e!458416))))

(assert (=> b!824033 (= res!561880 (not (contains!4155 lt!371503 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!824034 () Bool)

(declare-fun e!458415 () ListLongMap!8731)

(assert (=> b!824034 (= e!458415 e!458411)))

(declare-fun c!89317 () Bool)

(assert (=> b!824034 (= c!89317 (validKeyInArray!0 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!824035 () Bool)

(assert (=> b!824035 (= e!458411 call!35813)))

(declare-fun bm!35810 () Bool)

(assert (=> bm!35810 (= call!35813 (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!824036 () Bool)

(assert (=> b!824036 (= e!458417 e!458413)))

(assert (=> b!824036 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(declare-fun res!561881 () Bool)

(assert (=> b!824036 (= res!561881 (contains!4155 lt!371503 (select (arr!22020 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!824036 (=> (not res!561881) (not e!458413))))

(declare-fun b!824037 () Bool)

(assert (=> b!824037 (= e!458415 (ListLongMap!8732 Nil!15716))))

(declare-fun d!104737 () Bool)

(assert (=> d!104737 e!458416))

(declare-fun res!561878 () Bool)

(assert (=> d!104737 (=> (not res!561878) (not e!458416))))

(assert (=> d!104737 (= res!561878 (not (contains!4155 lt!371503 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104737 (= lt!371503 e!458415)))

(declare-fun c!89319 () Bool)

(assert (=> d!104737 (= c!89319 (bvsge #b00000000000000000000000000000000 (size!22441 _keys!976)))))

(assert (=> d!104737 (validMask!0 mask!1312)))

(assert (=> d!104737 (= (getCurrentListMapNoExtraKeys!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!371503)))

(declare-fun b!824032 () Bool)

(assert (=> b!824032 (= e!458414 (isEmpty!647 lt!371503))))

(assert (= (and d!104737 c!89319) b!824037))

(assert (= (and d!104737 (not c!89319)) b!824034))

(assert (= (and b!824034 c!89317) b!824026))

(assert (= (and b!824034 (not c!89317)) b!824035))

(assert (= (or b!824026 b!824035) bm!35810))

(assert (= (and d!104737 res!561878) b!824033))

(assert (= (and b!824033 res!561880) b!824028))

(assert (= (and b!824028 res!561879) b!824027))

(assert (= (and b!824028 c!89320) b!824036))

(assert (= (and b!824028 (not c!89320)) b!824029))

(assert (= (and b!824036 res!561881) b!824031))

(assert (= (and b!824029 c!89318) b!824030))

(assert (= (and b!824029 (not c!89318)) b!824032))

(declare-fun b_lambda!11065 () Bool)

(assert (=> (not b_lambda!11065) (not b!824026)))

(assert (=> b!824026 t!22055))

(declare-fun b_and!22063 () Bool)

(assert (= b_and!22061 (and (=> t!22055 result!7935) b_and!22063)))

(declare-fun b_lambda!11067 () Bool)

(assert (=> (not b_lambda!11067) (not b!824031)))

(assert (=> b!824031 t!22055))

(declare-fun b_and!22065 () Bool)

(assert (= b_and!22063 (and (=> t!22055 result!7935) b_and!22065)))

(assert (=> b!824027 m!765599))

(assert (=> b!824027 m!765599))

(assert (=> b!824027 m!765601))

(declare-fun m!765643 () Bool)

(assert (=> bm!35810 m!765643))

(declare-fun m!765645 () Bool)

(assert (=> b!824033 m!765645))

(assert (=> b!824030 m!765643))

(declare-fun m!765647 () Bool)

(assert (=> b!824032 m!765647))

(assert (=> b!824036 m!765599))

(assert (=> b!824036 m!765599))

(declare-fun m!765649 () Bool)

(assert (=> b!824036 m!765649))

(assert (=> b!824031 m!765625))

(assert (=> b!824031 m!765627))

(assert (=> b!824031 m!765629))

(assert (=> b!824031 m!765627))

(assert (=> b!824031 m!765599))

(declare-fun m!765651 () Bool)

(assert (=> b!824031 m!765651))

(assert (=> b!824031 m!765625))

(assert (=> b!824031 m!765599))

(assert (=> b!824034 m!765599))

(assert (=> b!824034 m!765599))

(assert (=> b!824034 m!765601))

(declare-fun m!765653 () Bool)

(assert (=> b!824026 m!765653))

(declare-fun m!765655 () Bool)

(assert (=> b!824026 m!765655))

(assert (=> b!824026 m!765625))

(assert (=> b!824026 m!765627))

(assert (=> b!824026 m!765629))

(assert (=> b!824026 m!765627))

(declare-fun m!765657 () Bool)

(assert (=> b!824026 m!765657))

(assert (=> b!824026 m!765653))

(declare-fun m!765659 () Bool)

(assert (=> b!824026 m!765659))

(assert (=> b!824026 m!765625))

(assert (=> b!824026 m!765599))

(declare-fun m!765661 () Bool)

(assert (=> d!104737 m!765661))

(assert (=> d!104737 m!765557))

(assert (=> b!823918 d!104737))

(declare-fun d!104739 () Bool)

(assert (=> d!104739 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70946 d!104739))

(declare-fun d!104741 () Bool)

(assert (=> d!104741 (= (array_inv!17637 _keys!976) (bvsge (size!22441 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70946 d!104741))

(declare-fun d!104743 () Bool)

(assert (=> d!104743 (= (array_inv!17638 _values!788) (bvsge (size!22442 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70946 d!104743))

(declare-fun condMapEmpty!23965 () Bool)

(declare-fun mapDefault!23965 () ValueCell!7031)

(assert (=> mapNonEmpty!23956 (= condMapEmpty!23965 (= mapRest!23956 ((as const (Array (_ BitVec 32) ValueCell!7031)) mapDefault!23965)))))

(declare-fun e!458422 () Bool)

(declare-fun mapRes!23965 () Bool)

(assert (=> mapNonEmpty!23956 (= tp!46299 (and e!458422 mapRes!23965))))

(declare-fun mapNonEmpty!23965 () Bool)

(declare-fun tp!46315 () Bool)

(declare-fun e!458423 () Bool)

(assert (=> mapNonEmpty!23965 (= mapRes!23965 (and tp!46315 e!458423))))

(declare-fun mapRest!23965 () (Array (_ BitVec 32) ValueCell!7031))

(declare-fun mapValue!23965 () ValueCell!7031)

(declare-fun mapKey!23965 () (_ BitVec 32))

(assert (=> mapNonEmpty!23965 (= mapRest!23956 (store mapRest!23965 mapKey!23965 mapValue!23965))))

(declare-fun b!824045 () Bool)

(assert (=> b!824045 (= e!458422 tp_is_empty!14893)))

(declare-fun b!824044 () Bool)

(assert (=> b!824044 (= e!458423 tp_is_empty!14893)))

(declare-fun mapIsEmpty!23965 () Bool)

(assert (=> mapIsEmpty!23965 mapRes!23965))

(assert (= (and mapNonEmpty!23956 condMapEmpty!23965) mapIsEmpty!23965))

(assert (= (and mapNonEmpty!23956 (not condMapEmpty!23965)) mapNonEmpty!23965))

(assert (= (and mapNonEmpty!23965 ((_ is ValueCellFull!7031) mapValue!23965)) b!824044))

(assert (= (and mapNonEmpty!23956 ((_ is ValueCellFull!7031) mapDefault!23965)) b!824045))

(declare-fun m!765663 () Bool)

(assert (=> mapNonEmpty!23965 m!765663))

(declare-fun b_lambda!11069 () Bool)

(assert (= b_lambda!11063 (or (and start!70946 b_free!13183) b_lambda!11069)))

(declare-fun b_lambda!11071 () Bool)

(assert (= b_lambda!11067 (or (and start!70946 b_free!13183) b_lambda!11071)))

(declare-fun b_lambda!11073 () Bool)

(assert (= b_lambda!11065 (or (and start!70946 b_free!13183) b_lambda!11073)))

(declare-fun b_lambda!11075 () Bool)

(assert (= b_lambda!11061 (or (and start!70946 b_free!13183) b_lambda!11075)))

(check-sat (not b!824027) (not b!823984) b_and!22065 (not b!824017) (not b!824019) (not b_lambda!11075) (not b!824016) (not b!824020) (not b!824012) (not b!824030) (not b!823971) (not bm!35803) (not b_lambda!11073) (not b!824034) (not d!104737) (not b!824018) (not b!824022) (not d!104735) (not mapNonEmpty!23965) (not b_lambda!11071) (not b!824031) (not b_lambda!11069) (not bm!35809) (not b!824013) (not d!104733) (not b!824033) (not b!823972) (not b!824032) (not b!823973) (not b!824036) (not b!824026) (not b!823985) (not bm!35810) (not b_next!13183) tp_is_empty!14893 (not bm!35806))
(check-sat b_and!22065 (not b_next!13183))
