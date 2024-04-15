; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70556 () Bool)

(assert start!70556)

(declare-fun b_free!12883 () Bool)

(declare-fun b_next!12883 () Bool)

(assert (=> start!70556 (= b_free!12883 (not b_next!12883))))

(declare-fun tp!45385 () Bool)

(declare-fun b_and!21699 () Bool)

(assert (=> start!70556 (= tp!45385 b_and!21699)))

(declare-fun b!819626 () Bool)

(declare-fun res!559339 () Bool)

(declare-fun e!455242 () Bool)

(assert (=> b!819626 (=> (not res!559339) (not e!455242))))

(declare-datatypes ((array!45357 0))(
  ( (array!45358 (arr!21732 (Array (_ BitVec 32) (_ BitVec 64))) (size!22153 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45357)

(declare-datatypes ((List!15507 0))(
  ( (Nil!15504) (Cons!15503 (h!16632 (_ BitVec 64)) (t!21829 List!15507)) )
))
(declare-fun arrayNoDuplicates!0 (array!45357 (_ BitVec 32) List!15507) Bool)

(assert (=> b!819626 (= res!559339 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15504))))

(declare-fun res!559341 () Bool)

(assert (=> start!70556 (=> (not res!559341) (not e!455242))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70556 (= res!559341 (validMask!0 mask!1312))))

(assert (=> start!70556 e!455242))

(declare-fun tp_is_empty!14593 () Bool)

(assert (=> start!70556 tp_is_empty!14593))

(declare-fun array_inv!17439 (array!45357) Bool)

(assert (=> start!70556 (array_inv!17439 _keys!976)))

(assert (=> start!70556 true))

(declare-datatypes ((V!24459 0))(
  ( (V!24460 (val!7344 Int)) )
))
(declare-datatypes ((ValueCell!6881 0))(
  ( (ValueCellFull!6881 (v!9768 V!24459)) (EmptyCell!6881) )
))
(declare-datatypes ((array!45359 0))(
  ( (array!45360 (arr!21733 (Array (_ BitVec 32) ValueCell!6881)) (size!22154 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45359)

(declare-fun e!455238 () Bool)

(declare-fun array_inv!17440 (array!45359) Bool)

(assert (=> start!70556 (and (array_inv!17440 _values!788) e!455238)))

(assert (=> start!70556 tp!45385))

(declare-fun b!819627 () Bool)

(declare-fun e!455244 () Bool)

(declare-fun mapRes!23491 () Bool)

(assert (=> b!819627 (= e!455238 (and e!455244 mapRes!23491))))

(declare-fun condMapEmpty!23491 () Bool)

(declare-fun mapDefault!23491 () ValueCell!6881)

(assert (=> b!819627 (= condMapEmpty!23491 (= (arr!21733 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6881)) mapDefault!23491)))))

(declare-fun b!819628 () Bool)

(declare-fun e!455240 () Bool)

(assert (=> b!819628 (= e!455240 true)))

(declare-datatypes ((tuple2!9688 0))(
  ( (tuple2!9689 (_1!4855 (_ BitVec 64)) (_2!4855 V!24459)) )
))
(declare-fun lt!367948 () tuple2!9688)

(declare-datatypes ((List!15508 0))(
  ( (Nil!15505) (Cons!15504 (h!16633 tuple2!9688) (t!21830 List!15508)) )
))
(declare-datatypes ((ListLongMap!8501 0))(
  ( (ListLongMap!8502 (toList!4266 List!15508)) )
))
(declare-fun lt!367944 () ListLongMap!8501)

(declare-fun lt!367945 () ListLongMap!8501)

(declare-fun lt!367949 () tuple2!9688)

(declare-fun +!1887 (ListLongMap!8501 tuple2!9688) ListLongMap!8501)

(assert (=> b!819628 (= lt!367944 (+!1887 (+!1887 lt!367945 lt!367948) lt!367949))))

(declare-fun lt!367951 () ListLongMap!8501)

(declare-fun lt!367947 () ListLongMap!8501)

(assert (=> b!819628 (= (+!1887 lt!367951 lt!367949) (+!1887 lt!367947 lt!367949))))

(declare-fun zeroValueAfter!34 () V!24459)

(declare-datatypes ((Unit!27959 0))(
  ( (Unit!27960) )
))
(declare-fun lt!367946 () Unit!27959)

(declare-fun zeroValueBefore!34 () V!24459)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!202 (ListLongMap!8501 (_ BitVec 64) V!24459 V!24459) Unit!27959)

(assert (=> b!819628 (= lt!367946 (addSameAsAddTwiceSameKeyDiffValues!202 lt!367951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819628 (= lt!367949 (tuple2!9689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455243 () Bool)

(assert (=> b!819628 e!455243))

(declare-fun res!559337 () Bool)

(assert (=> b!819628 (=> (not res!559337) (not e!455243))))

(declare-fun lt!367952 () ListLongMap!8501)

(assert (=> b!819628 (= res!559337 (= lt!367952 lt!367947))))

(assert (=> b!819628 (= lt!367947 (+!1887 lt!367951 lt!367948))))

(assert (=> b!819628 (= lt!367948 (tuple2!9689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!24459)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lt!367950 () ListLongMap!8501)

(declare-fun getCurrentListMap!2415 (array!45357 array!45359 (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 (_ BitVec 32) Int) ListLongMap!8501)

(assert (=> b!819628 (= lt!367950 (getCurrentListMap!2415 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819628 (= lt!367952 (getCurrentListMap!2415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819629 () Bool)

(assert (=> b!819629 (= e!455244 tp_is_empty!14593)))

(declare-fun mapIsEmpty!23491 () Bool)

(assert (=> mapIsEmpty!23491 mapRes!23491))

(declare-fun mapNonEmpty!23491 () Bool)

(declare-fun tp!45384 () Bool)

(declare-fun e!455241 () Bool)

(assert (=> mapNonEmpty!23491 (= mapRes!23491 (and tp!45384 e!455241))))

(declare-fun mapRest!23491 () (Array (_ BitVec 32) ValueCell!6881))

(declare-fun mapKey!23491 () (_ BitVec 32))

(declare-fun mapValue!23491 () ValueCell!6881)

(assert (=> mapNonEmpty!23491 (= (arr!21733 _values!788) (store mapRest!23491 mapKey!23491 mapValue!23491))))

(declare-fun b!819630 () Bool)

(assert (=> b!819630 (= e!455243 (= lt!367950 (+!1887 lt!367945 (tuple2!9689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819631 () Bool)

(assert (=> b!819631 (= e!455242 (not e!455240))))

(declare-fun res!559338 () Bool)

(assert (=> b!819631 (=> res!559338 e!455240)))

(assert (=> b!819631 (= res!559338 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819631 (= lt!367951 lt!367945)))

(declare-fun lt!367953 () Unit!27959)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!413 (array!45357 array!45359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 V!24459 V!24459 (_ BitVec 32) Int) Unit!27959)

(assert (=> b!819631 (= lt!367953 (lemmaNoChangeToArrayThenSameMapNoExtras!413 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2320 (array!45357 array!45359 (_ BitVec 32) (_ BitVec 32) V!24459 V!24459 (_ BitVec 32) Int) ListLongMap!8501)

(assert (=> b!819631 (= lt!367945 (getCurrentListMapNoExtraKeys!2320 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819631 (= lt!367951 (getCurrentListMapNoExtraKeys!2320 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819632 () Bool)

(declare-fun res!559342 () Bool)

(assert (=> b!819632 (=> (not res!559342) (not e!455242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45357 (_ BitVec 32)) Bool)

(assert (=> b!819632 (= res!559342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819633 () Bool)

(assert (=> b!819633 (= e!455241 tp_is_empty!14593)))

(declare-fun b!819634 () Bool)

(declare-fun res!559340 () Bool)

(assert (=> b!819634 (=> (not res!559340) (not e!455242))))

(assert (=> b!819634 (= res!559340 (and (= (size!22154 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22153 _keys!976) (size!22154 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70556 res!559341) b!819634))

(assert (= (and b!819634 res!559340) b!819632))

(assert (= (and b!819632 res!559342) b!819626))

(assert (= (and b!819626 res!559339) b!819631))

(assert (= (and b!819631 (not res!559338)) b!819628))

(assert (= (and b!819628 res!559337) b!819630))

(assert (= (and b!819627 condMapEmpty!23491) mapIsEmpty!23491))

(assert (= (and b!819627 (not condMapEmpty!23491)) mapNonEmpty!23491))

(get-info :version)

(assert (= (and mapNonEmpty!23491 ((_ is ValueCellFull!6881) mapValue!23491)) b!819633))

(assert (= (and b!819627 ((_ is ValueCellFull!6881) mapDefault!23491)) b!819629))

(assert (= start!70556 b!819627))

(declare-fun m!760887 () Bool)

(assert (=> start!70556 m!760887))

(declare-fun m!760889 () Bool)

(assert (=> start!70556 m!760889))

(declare-fun m!760891 () Bool)

(assert (=> start!70556 m!760891))

(declare-fun m!760893 () Bool)

(assert (=> b!819632 m!760893))

(declare-fun m!760895 () Bool)

(assert (=> b!819630 m!760895))

(declare-fun m!760897 () Bool)

(assert (=> mapNonEmpty!23491 m!760897))

(declare-fun m!760899 () Bool)

(assert (=> b!819628 m!760899))

(declare-fun m!760901 () Bool)

(assert (=> b!819628 m!760901))

(declare-fun m!760903 () Bool)

(assert (=> b!819628 m!760903))

(declare-fun m!760905 () Bool)

(assert (=> b!819628 m!760905))

(declare-fun m!760907 () Bool)

(assert (=> b!819628 m!760907))

(declare-fun m!760909 () Bool)

(assert (=> b!819628 m!760909))

(declare-fun m!760911 () Bool)

(assert (=> b!819628 m!760911))

(assert (=> b!819628 m!760905))

(declare-fun m!760913 () Bool)

(assert (=> b!819628 m!760913))

(declare-fun m!760915 () Bool)

(assert (=> b!819626 m!760915))

(declare-fun m!760917 () Bool)

(assert (=> b!819631 m!760917))

(declare-fun m!760919 () Bool)

(assert (=> b!819631 m!760919))

(declare-fun m!760921 () Bool)

(assert (=> b!819631 m!760921))

(check-sat (not b!819632) (not b!819631) b_and!21699 (not b!819628) (not b!819626) (not mapNonEmpty!23491) (not start!70556) tp_is_empty!14593 (not b!819630) (not b_next!12883))
(check-sat b_and!21699 (not b_next!12883))
