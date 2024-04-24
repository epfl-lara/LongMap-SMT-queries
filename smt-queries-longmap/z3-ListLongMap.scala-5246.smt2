; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70742 () Bool)

(assert start!70742)

(declare-fun b_free!12883 () Bool)

(declare-fun b_next!12883 () Bool)

(assert (=> start!70742 (= b_free!12883 (not b_next!12883))))

(declare-fun tp!45384 () Bool)

(declare-fun b_and!21735 () Bool)

(assert (=> start!70742 (= tp!45384 b_and!21735)))

(declare-fun b!820766 () Bool)

(declare-fun e!455970 () Bool)

(declare-fun e!455972 () Bool)

(assert (=> b!820766 (= e!455970 (not e!455972))))

(declare-fun res!559791 () Bool)

(assert (=> b!820766 (=> res!559791 e!455972)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820766 (= res!559791 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24459 0))(
  ( (V!24460 (val!7344 Int)) )
))
(declare-datatypes ((tuple2!9582 0))(
  ( (tuple2!9583 (_1!4802 (_ BitVec 64)) (_2!4802 V!24459)) )
))
(declare-datatypes ((List!15384 0))(
  ( (Nil!15381) (Cons!15380 (h!16515 tuple2!9582) (t!21707 List!15384)) )
))
(declare-datatypes ((ListLongMap!8407 0))(
  ( (ListLongMap!8408 (toList!4219 List!15384)) )
))
(declare-fun lt!368546 () ListLongMap!8407)

(declare-fun lt!368545 () ListLongMap!8407)

(assert (=> b!820766 (= lt!368546 lt!368545)))

(declare-fun zeroValueBefore!34 () V!24459)

(declare-datatypes ((array!45387 0))(
  ( (array!45388 (arr!21742 (Array (_ BitVec 32) (_ BitVec 64))) (size!22162 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45387)

(declare-datatypes ((Unit!27988 0))(
  ( (Unit!27989) )
))
(declare-fun lt!368544 () Unit!27988)

(declare-fun zeroValueAfter!34 () V!24459)

(declare-fun minValue!754 () V!24459)

(declare-datatypes ((ValueCell!6881 0))(
  ( (ValueCellFull!6881 (v!9774 V!24459)) (EmptyCell!6881) )
))
(declare-datatypes ((array!45389 0))(
  ( (array!45390 (arr!21743 (Array (_ BitVec 32) ValueCell!6881)) (size!22163 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45389)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!400 (array!45387 array!45389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 V!24459 V!24459 (_ BitVec 32) Int) Unit!27988)

(assert (=> b!820766 (= lt!368544 (lemmaNoChangeToArrayThenSameMapNoExtras!400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2312 (array!45387 array!45389 (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 (_ BitVec 32) Int) ListLongMap!8407)

(assert (=> b!820766 (= lt!368545 (getCurrentListMapNoExtraKeys!2312 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820766 (= lt!368546 (getCurrentListMapNoExtraKeys!2312 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820767 () Bool)

(declare-fun res!559792 () Bool)

(assert (=> b!820767 (=> (not res!559792) (not e!455970))))

(declare-datatypes ((List!15385 0))(
  ( (Nil!15382) (Cons!15381 (h!16516 (_ BitVec 64)) (t!21708 List!15385)) )
))
(declare-fun arrayNoDuplicates!0 (array!45387 (_ BitVec 32) List!15385) Bool)

(assert (=> b!820767 (= res!559792 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15382))))

(declare-fun lt!368542 () ListLongMap!8407)

(declare-fun b!820768 () Bool)

(declare-fun e!455971 () Bool)

(declare-fun +!1855 (ListLongMap!8407 tuple2!9582) ListLongMap!8407)

(assert (=> b!820768 (= e!455971 (= lt!368542 (+!1855 lt!368545 (tuple2!9583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820769 () Bool)

(declare-fun e!455969 () Bool)

(declare-fun e!455968 () Bool)

(declare-fun mapRes!23491 () Bool)

(assert (=> b!820769 (= e!455969 (and e!455968 mapRes!23491))))

(declare-fun condMapEmpty!23491 () Bool)

(declare-fun mapDefault!23491 () ValueCell!6881)

(assert (=> b!820769 (= condMapEmpty!23491 (= (arr!21743 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6881)) mapDefault!23491)))))

(declare-fun b!820770 () Bool)

(declare-fun tp_is_empty!14593 () Bool)

(assert (=> b!820770 (= e!455968 tp_is_empty!14593)))

(declare-fun mapNonEmpty!23491 () Bool)

(declare-fun tp!45385 () Bool)

(declare-fun e!455967 () Bool)

(assert (=> mapNonEmpty!23491 (= mapRes!23491 (and tp!45385 e!455967))))

(declare-fun mapKey!23491 () (_ BitVec 32))

(declare-fun mapValue!23491 () ValueCell!6881)

(declare-fun mapRest!23491 () (Array (_ BitVec 32) ValueCell!6881))

(assert (=> mapNonEmpty!23491 (= (arr!21743 _values!788) (store mapRest!23491 mapKey!23491 mapValue!23491))))

(declare-fun b!820771 () Bool)

(declare-fun res!559789 () Bool)

(assert (=> b!820771 (=> (not res!559789) (not e!455970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45387 (_ BitVec 32)) Bool)

(assert (=> b!820771 (= res!559789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820773 () Bool)

(assert (=> b!820773 (= e!455967 tp_is_empty!14593)))

(declare-fun b!820774 () Bool)

(assert (=> b!820774 (= e!455972 true)))

(declare-fun lt!368550 () ListLongMap!8407)

(declare-fun lt!368548 () tuple2!9582)

(declare-fun lt!368547 () tuple2!9582)

(assert (=> b!820774 (= lt!368550 (+!1855 (+!1855 lt!368545 lt!368548) lt!368547))))

(declare-fun lt!368541 () ListLongMap!8407)

(assert (=> b!820774 (= (+!1855 lt!368546 lt!368547) (+!1855 lt!368541 lt!368547))))

(declare-fun lt!368549 () Unit!27988)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!192 (ListLongMap!8407 (_ BitVec 64) V!24459 V!24459) Unit!27988)

(assert (=> b!820774 (= lt!368549 (addSameAsAddTwiceSameKeyDiffValues!192 lt!368546 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820774 (= lt!368547 (tuple2!9583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820774 e!455971))

(declare-fun res!559790 () Bool)

(assert (=> b!820774 (=> (not res!559790) (not e!455971))))

(declare-fun lt!368543 () ListLongMap!8407)

(assert (=> b!820774 (= res!559790 (= lt!368543 lt!368541))))

(assert (=> b!820774 (= lt!368541 (+!1855 lt!368546 lt!368548))))

(assert (=> b!820774 (= lt!368548 (tuple2!9583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2405 (array!45387 array!45389 (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 (_ BitVec 32) Int) ListLongMap!8407)

(assert (=> b!820774 (= lt!368542 (getCurrentListMap!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820774 (= lt!368543 (getCurrentListMap!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23491 () Bool)

(assert (=> mapIsEmpty!23491 mapRes!23491))

(declare-fun b!820772 () Bool)

(declare-fun res!559793 () Bool)

(assert (=> b!820772 (=> (not res!559793) (not e!455970))))

(assert (=> b!820772 (= res!559793 (and (= (size!22163 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22162 _keys!976) (size!22163 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!559794 () Bool)

(assert (=> start!70742 (=> (not res!559794) (not e!455970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70742 (= res!559794 (validMask!0 mask!1312))))

(assert (=> start!70742 e!455970))

(assert (=> start!70742 tp_is_empty!14593))

(declare-fun array_inv!17411 (array!45387) Bool)

(assert (=> start!70742 (array_inv!17411 _keys!976)))

(assert (=> start!70742 true))

(declare-fun array_inv!17412 (array!45389) Bool)

(assert (=> start!70742 (and (array_inv!17412 _values!788) e!455969)))

(assert (=> start!70742 tp!45384))

(assert (= (and start!70742 res!559794) b!820772))

(assert (= (and b!820772 res!559793) b!820771))

(assert (= (and b!820771 res!559789) b!820767))

(assert (= (and b!820767 res!559792) b!820766))

(assert (= (and b!820766 (not res!559791)) b!820774))

(assert (= (and b!820774 res!559790) b!820768))

(assert (= (and b!820769 condMapEmpty!23491) mapIsEmpty!23491))

(assert (= (and b!820769 (not condMapEmpty!23491)) mapNonEmpty!23491))

(get-info :version)

(assert (= (and mapNonEmpty!23491 ((_ is ValueCellFull!6881) mapValue!23491)) b!820773))

(assert (= (and b!820769 ((_ is ValueCellFull!6881) mapDefault!23491)) b!820770))

(assert (= start!70742 b!820769))

(declare-fun m!762921 () Bool)

(assert (=> mapNonEmpty!23491 m!762921))

(declare-fun m!762923 () Bool)

(assert (=> b!820771 m!762923))

(declare-fun m!762925 () Bool)

(assert (=> b!820767 m!762925))

(declare-fun m!762927 () Bool)

(assert (=> b!820774 m!762927))

(declare-fun m!762929 () Bool)

(assert (=> b!820774 m!762929))

(declare-fun m!762931 () Bool)

(assert (=> b!820774 m!762931))

(declare-fun m!762933 () Bool)

(assert (=> b!820774 m!762933))

(declare-fun m!762935 () Bool)

(assert (=> b!820774 m!762935))

(assert (=> b!820774 m!762929))

(declare-fun m!762937 () Bool)

(assert (=> b!820774 m!762937))

(declare-fun m!762939 () Bool)

(assert (=> b!820774 m!762939))

(declare-fun m!762941 () Bool)

(assert (=> b!820774 m!762941))

(declare-fun m!762943 () Bool)

(assert (=> b!820766 m!762943))

(declare-fun m!762945 () Bool)

(assert (=> b!820766 m!762945))

(declare-fun m!762947 () Bool)

(assert (=> b!820766 m!762947))

(declare-fun m!762949 () Bool)

(assert (=> start!70742 m!762949))

(declare-fun m!762951 () Bool)

(assert (=> start!70742 m!762951))

(declare-fun m!762953 () Bool)

(assert (=> start!70742 m!762953))

(declare-fun m!762955 () Bool)

(assert (=> b!820768 m!762955))

(check-sat tp_is_empty!14593 (not b!820768) (not b!820774) (not b!820771) (not b!820767) (not b!820766) (not start!70742) b_and!21735 (not mapNonEmpty!23491) (not b_next!12883))
(check-sat b_and!21735 (not b_next!12883))
