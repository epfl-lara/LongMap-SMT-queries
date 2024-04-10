; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71368 () Bool)

(assert start!71368)

(declare-fun b_free!13449 () Bool)

(declare-fun b_next!13449 () Bool)

(assert (=> start!71368 (= b_free!13449 (not b_next!13449))))

(declare-fun tp!47121 () Bool)

(declare-fun b_and!22431 () Bool)

(assert (=> start!71368 (= tp!47121 b_and!22431)))

(declare-fun b!828839 () Bool)

(declare-fun e!461907 () Bool)

(declare-fun tp_is_empty!15159 () Bool)

(assert (=> b!828839 (= e!461907 tp_is_empty!15159)))

(declare-fun b!828840 () Bool)

(declare-fun res!564705 () Bool)

(declare-fun e!461909 () Bool)

(assert (=> b!828840 (=> (not res!564705) (not e!461909))))

(declare-datatypes ((array!46484 0))(
  ( (array!46485 (arr!22282 (Array (_ BitVec 32) (_ BitVec 64))) (size!22703 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46484)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46484 (_ BitVec 32)) Bool)

(assert (=> b!828840 (= res!564705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564709 () Bool)

(assert (=> start!71368 (=> (not res!564709) (not e!461909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71368 (= res!564709 (validMask!0 mask!1312))))

(assert (=> start!71368 e!461909))

(assert (=> start!71368 tp_is_empty!15159))

(declare-fun array_inv!17751 (array!46484) Bool)

(assert (=> start!71368 (array_inv!17751 _keys!976)))

(assert (=> start!71368 true))

(declare-datatypes ((V!25213 0))(
  ( (V!25214 (val!7627 Int)) )
))
(declare-datatypes ((ValueCell!7164 0))(
  ( (ValueCellFull!7164 (v!10065 V!25213)) (EmptyCell!7164) )
))
(declare-datatypes ((array!46486 0))(
  ( (array!46487 (arr!22283 (Array (_ BitVec 32) ValueCell!7164)) (size!22704 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46486)

(declare-fun e!461906 () Bool)

(declare-fun array_inv!17752 (array!46486) Bool)

(assert (=> start!71368 (and (array_inv!17752 _values!788) e!461906)))

(assert (=> start!71368 tp!47121))

(declare-fun e!461908 () Bool)

(declare-datatypes ((tuple2!10114 0))(
  ( (tuple2!10115 (_1!5068 (_ BitVec 64)) (_2!5068 V!25213)) )
))
(declare-fun lt!375674 () tuple2!10114)

(declare-datatypes ((List!15906 0))(
  ( (Nil!15903) (Cons!15902 (h!17031 tuple2!10114) (t!22263 List!15906)) )
))
(declare-datatypes ((ListLongMap!8937 0))(
  ( (ListLongMap!8938 (toList!4484 List!15906)) )
))
(declare-fun lt!375675 () ListLongMap!8937)

(declare-fun lt!375672 () tuple2!10114)

(declare-fun lt!375679 () ListLongMap!8937)

(declare-fun b!828841 () Bool)

(declare-fun +!1965 (ListLongMap!8937 tuple2!10114) ListLongMap!8937)

(assert (=> b!828841 (= e!461908 (= lt!375679 (+!1965 (+!1965 lt!375675 lt!375672) lt!375674)))))

(declare-fun lt!375676 () ListLongMap!8937)

(declare-fun lt!375677 () ListLongMap!8937)

(assert (=> b!828841 (= (+!1965 lt!375676 lt!375674) (+!1965 lt!375677 lt!375674))))

(declare-fun zeroValueBefore!34 () V!25213)

(declare-fun zeroValueAfter!34 () V!25213)

(declare-datatypes ((Unit!28389 0))(
  ( (Unit!28390) )
))
(declare-fun lt!375673 () Unit!28389)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!237 (ListLongMap!8937 (_ BitVec 64) V!25213 V!25213) Unit!28389)

(assert (=> b!828841 (= lt!375673 (addSameAsAddTwiceSameKeyDiffValues!237 lt!375676 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!828841 (= lt!375674 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!461910 () Bool)

(assert (=> b!828841 e!461910))

(declare-fun res!564707 () Bool)

(assert (=> b!828841 (=> (not res!564707) (not e!461910))))

(declare-fun lt!375678 () ListLongMap!8937)

(assert (=> b!828841 (= res!564707 (= lt!375678 lt!375677))))

(assert (=> b!828841 (= lt!375677 (+!1965 lt!375676 lt!375672))))

(assert (=> b!828841 (= lt!375672 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!25213)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2584 (array!46484 array!46486 (_ BitVec 32) (_ BitVec 32) V!25213 V!25213 (_ BitVec 32) Int) ListLongMap!8937)

(assert (=> b!828841 (= lt!375679 (getCurrentListMap!2584 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828841 (= lt!375678 (getCurrentListMap!2584 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24379 () Bool)

(declare-fun mapRes!24379 () Bool)

(declare-fun tp!47122 () Bool)

(assert (=> mapNonEmpty!24379 (= mapRes!24379 (and tp!47122 e!461907))))

(declare-fun mapRest!24379 () (Array (_ BitVec 32) ValueCell!7164))

(declare-fun mapKey!24379 () (_ BitVec 32))

(declare-fun mapValue!24379 () ValueCell!7164)

(assert (=> mapNonEmpty!24379 (= (arr!22283 _values!788) (store mapRest!24379 mapKey!24379 mapValue!24379))))

(declare-fun b!828842 () Bool)

(declare-fun res!564708 () Bool)

(assert (=> b!828842 (=> (not res!564708) (not e!461909))))

(assert (=> b!828842 (= res!564708 (and (= (size!22704 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22703 _keys!976) (size!22704 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24379 () Bool)

(assert (=> mapIsEmpty!24379 mapRes!24379))

(declare-fun b!828843 () Bool)

(assert (=> b!828843 (= e!461910 (= lt!375679 (+!1965 lt!375675 (tuple2!10115 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!828844 () Bool)

(declare-fun e!461911 () Bool)

(assert (=> b!828844 (= e!461906 (and e!461911 mapRes!24379))))

(declare-fun condMapEmpty!24379 () Bool)

(declare-fun mapDefault!24379 () ValueCell!7164)

(assert (=> b!828844 (= condMapEmpty!24379 (= (arr!22283 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7164)) mapDefault!24379)))))

(declare-fun b!828845 () Bool)

(declare-fun res!564710 () Bool)

(assert (=> b!828845 (=> (not res!564710) (not e!461909))))

(declare-datatypes ((List!15907 0))(
  ( (Nil!15904) (Cons!15903 (h!17032 (_ BitVec 64)) (t!22264 List!15907)) )
))
(declare-fun arrayNoDuplicates!0 (array!46484 (_ BitVec 32) List!15907) Bool)

(assert (=> b!828845 (= res!564710 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15904))))

(declare-fun b!828846 () Bool)

(assert (=> b!828846 (= e!461911 tp_is_empty!15159)))

(declare-fun b!828847 () Bool)

(assert (=> b!828847 (= e!461909 (not e!461908))))

(declare-fun res!564706 () Bool)

(assert (=> b!828847 (=> res!564706 e!461908)))

(assert (=> b!828847 (= res!564706 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828847 (= lt!375676 lt!375675)))

(declare-fun lt!375671 () Unit!28389)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!573 (array!46484 array!46486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25213 V!25213 V!25213 V!25213 (_ BitVec 32) Int) Unit!28389)

(assert (=> b!828847 (= lt!375671 (lemmaNoChangeToArrayThenSameMapNoExtras!573 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2485 (array!46484 array!46486 (_ BitVec 32) (_ BitVec 32) V!25213 V!25213 (_ BitVec 32) Int) ListLongMap!8937)

(assert (=> b!828847 (= lt!375675 (getCurrentListMapNoExtraKeys!2485 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828847 (= lt!375676 (getCurrentListMapNoExtraKeys!2485 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71368 res!564709) b!828842))

(assert (= (and b!828842 res!564708) b!828840))

(assert (= (and b!828840 res!564705) b!828845))

(assert (= (and b!828845 res!564710) b!828847))

(assert (= (and b!828847 (not res!564706)) b!828841))

(assert (= (and b!828841 res!564707) b!828843))

(assert (= (and b!828844 condMapEmpty!24379) mapIsEmpty!24379))

(assert (= (and b!828844 (not condMapEmpty!24379)) mapNonEmpty!24379))

(get-info :version)

(assert (= (and mapNonEmpty!24379 ((_ is ValueCellFull!7164) mapValue!24379)) b!828839))

(assert (= (and b!828844 ((_ is ValueCellFull!7164) mapDefault!24379)) b!828846))

(assert (= start!71368 b!828844))

(declare-fun m!771779 () Bool)

(assert (=> b!828840 m!771779))

(declare-fun m!771781 () Bool)

(assert (=> start!71368 m!771781))

(declare-fun m!771783 () Bool)

(assert (=> start!71368 m!771783))

(declare-fun m!771785 () Bool)

(assert (=> start!71368 m!771785))

(declare-fun m!771787 () Bool)

(assert (=> b!828841 m!771787))

(declare-fun m!771789 () Bool)

(assert (=> b!828841 m!771789))

(declare-fun m!771791 () Bool)

(assert (=> b!828841 m!771791))

(declare-fun m!771793 () Bool)

(assert (=> b!828841 m!771793))

(declare-fun m!771795 () Bool)

(assert (=> b!828841 m!771795))

(assert (=> b!828841 m!771787))

(declare-fun m!771797 () Bool)

(assert (=> b!828841 m!771797))

(declare-fun m!771799 () Bool)

(assert (=> b!828841 m!771799))

(declare-fun m!771801 () Bool)

(assert (=> b!828841 m!771801))

(declare-fun m!771803 () Bool)

(assert (=> b!828847 m!771803))

(declare-fun m!771805 () Bool)

(assert (=> b!828847 m!771805))

(declare-fun m!771807 () Bool)

(assert (=> b!828847 m!771807))

(declare-fun m!771809 () Bool)

(assert (=> b!828845 m!771809))

(declare-fun m!771811 () Bool)

(assert (=> mapNonEmpty!24379 m!771811))

(declare-fun m!771813 () Bool)

(assert (=> b!828843 m!771813))

(check-sat (not b!828845) (not b_next!13449) (not start!71368) (not b!828841) (not b!828847) b_and!22431 (not b!828840) (not b!828843) (not mapNonEmpty!24379) tp_is_empty!15159)
(check-sat b_and!22431 (not b_next!13449))
