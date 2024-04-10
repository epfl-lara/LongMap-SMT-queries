; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71094 () Bool)

(assert start!71094)

(declare-fun b_free!13281 () Bool)

(declare-fun b_next!13281 () Bool)

(assert (=> start!71094 (= b_free!13281 (not b_next!13281))))

(declare-fun tp!46600 () Bool)

(declare-fun b_and!22195 () Bool)

(assert (=> start!71094 (= tp!46600 b_and!22195)))

(declare-fun mapIsEmpty!24109 () Bool)

(declare-fun mapRes!24109 () Bool)

(assert (=> mapIsEmpty!24109 mapRes!24109))

(declare-datatypes ((V!24989 0))(
  ( (V!24990 (val!7543 Int)) )
))
(declare-datatypes ((tuple2!9986 0))(
  ( (tuple2!9987 (_1!5004 (_ BitVec 64)) (_2!5004 V!24989)) )
))
(declare-fun lt!373020 () tuple2!9986)

(declare-fun b!825678 () Bool)

(declare-datatypes ((List!15789 0))(
  ( (Nil!15786) (Cons!15785 (h!16914 tuple2!9986) (t!22134 List!15789)) )
))
(declare-datatypes ((ListLongMap!8809 0))(
  ( (ListLongMap!8810 (toList!4420 List!15789)) )
))
(declare-fun lt!373009 () ListLongMap!8809)

(declare-fun e!459629 () Bool)

(declare-fun lt!373017 () ListLongMap!8809)

(declare-fun lt!373013 () tuple2!9986)

(declare-fun +!1927 (ListLongMap!8809 tuple2!9986) ListLongMap!8809)

(assert (=> b!825678 (= e!459629 (= lt!373009 (+!1927 (+!1927 lt!373017 lt!373013) lt!373020)))))

(declare-fun b!825679 () Bool)

(declare-fun res!562867 () Bool)

(declare-fun e!459628 () Bool)

(assert (=> b!825679 (=> (not res!562867) (not e!459628))))

(declare-datatypes ((array!46164 0))(
  ( (array!46165 (arr!22128 (Array (_ BitVec 32) (_ BitVec 64))) (size!22549 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46164)

(declare-datatypes ((List!15790 0))(
  ( (Nil!15787) (Cons!15786 (h!16915 (_ BitVec 64)) (t!22135 List!15790)) )
))
(declare-fun arrayNoDuplicates!0 (array!46164 (_ BitVec 32) List!15790) Bool)

(assert (=> b!825679 (= res!562867 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15787))))

(declare-fun mapNonEmpty!24109 () Bool)

(declare-fun tp!46599 () Bool)

(declare-fun e!459626 () Bool)

(assert (=> mapNonEmpty!24109 (= mapRes!24109 (and tp!46599 e!459626))))

(declare-datatypes ((ValueCell!7080 0))(
  ( (ValueCellFull!7080 (v!9976 V!24989)) (EmptyCell!7080) )
))
(declare-fun mapRest!24109 () (Array (_ BitVec 32) ValueCell!7080))

(declare-datatypes ((array!46166 0))(
  ( (array!46167 (arr!22129 (Array (_ BitVec 32) ValueCell!7080)) (size!22550 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46166)

(declare-fun mapKey!24109 () (_ BitVec 32))

(declare-fun mapValue!24109 () ValueCell!7080)

(assert (=> mapNonEmpty!24109 (= (arr!22129 _values!788) (store mapRest!24109 mapKey!24109 mapValue!24109))))

(declare-fun b!825680 () Bool)

(declare-fun tp_is_empty!14991 () Bool)

(assert (=> b!825680 (= e!459626 tp_is_empty!14991)))

(declare-fun zeroValueAfter!34 () V!24989)

(declare-fun b!825681 () Bool)

(declare-fun e!459631 () Bool)

(assert (=> b!825681 (= e!459631 (= lt!373009 (+!1927 (+!1927 lt!373017 (tuple2!9987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373013)))))

(declare-fun b!825682 () Bool)

(declare-fun e!459627 () Bool)

(assert (=> b!825682 (= e!459628 (not e!459627))))

(declare-fun res!562869 () Bool)

(assert (=> b!825682 (=> res!562869 e!459627)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825682 (= res!562869 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373018 () ListLongMap!8809)

(assert (=> b!825682 (= lt!373018 lt!373017)))

(declare-fun zeroValueBefore!34 () V!24989)

(declare-fun minValue!754 () V!24989)

(declare-datatypes ((Unit!28301 0))(
  ( (Unit!28302) )
))
(declare-fun lt!373011 () Unit!28301)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!540 (array!46164 array!46166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24989 V!24989 V!24989 V!24989 (_ BitVec 32) Int) Unit!28301)

(assert (=> b!825682 (= lt!373011 (lemmaNoChangeToArrayThenSameMapNoExtras!540 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2430 (array!46164 array!46166 (_ BitVec 32) (_ BitVec 32) V!24989 V!24989 (_ BitVec 32) Int) ListLongMap!8809)

(assert (=> b!825682 (= lt!373017 (getCurrentListMapNoExtraKeys!2430 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825682 (= lt!373018 (getCurrentListMapNoExtraKeys!2430 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825683 () Bool)

(declare-fun res!562870 () Bool)

(assert (=> b!825683 (=> (not res!562870) (not e!459628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46164 (_ BitVec 32)) Bool)

(assert (=> b!825683 (= res!562870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825684 () Bool)

(declare-fun res!562868 () Bool)

(assert (=> b!825684 (=> (not res!562868) (not e!459628))))

(assert (=> b!825684 (= res!562868 (and (= (size!22550 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22549 _keys!976) (size!22550 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825685 () Bool)

(assert (=> b!825685 (= e!459627 true)))

(declare-fun lt!373016 () ListLongMap!8809)

(assert (=> b!825685 (= lt!373016 (+!1927 (+!1927 lt!373018 lt!373020) lt!373013))))

(declare-fun lt!373008 () ListLongMap!8809)

(declare-fun lt!373015 () ListLongMap!8809)

(assert (=> b!825685 (and (= lt!373008 lt!373015) (= lt!373009 lt!373015) (= lt!373009 lt!373008))))

(declare-fun lt!373007 () ListLongMap!8809)

(assert (=> b!825685 (= lt!373015 (+!1927 lt!373007 lt!373020))))

(declare-fun lt!373019 () ListLongMap!8809)

(assert (=> b!825685 (= lt!373008 (+!1927 lt!373019 lt!373020))))

(declare-fun lt!373010 () Unit!28301)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!211 (ListLongMap!8809 (_ BitVec 64) V!24989 V!24989) Unit!28301)

(assert (=> b!825685 (= lt!373010 (addSameAsAddTwiceSameKeyDiffValues!211 lt!373019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825685 e!459629))

(declare-fun res!562865 () Bool)

(assert (=> b!825685 (=> (not res!562865) (not e!459629))))

(declare-fun lt!373014 () ListLongMap!8809)

(assert (=> b!825685 (= res!562865 (= lt!373014 lt!373007))))

(declare-fun lt!373012 () tuple2!9986)

(assert (=> b!825685 (= lt!373007 (+!1927 lt!373019 lt!373012))))

(assert (=> b!825685 (= lt!373019 (+!1927 lt!373018 lt!373013))))

(assert (=> b!825685 (= lt!373020 (tuple2!9987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825685 e!459631))

(declare-fun res!562866 () Bool)

(assert (=> b!825685 (=> (not res!562866) (not e!459631))))

(assert (=> b!825685 (= res!562866 (= lt!373014 (+!1927 (+!1927 lt!373018 lt!373012) lt!373013)))))

(assert (=> b!825685 (= lt!373013 (tuple2!9987 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825685 (= lt!373012 (tuple2!9987 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2551 (array!46164 array!46166 (_ BitVec 32) (_ BitVec 32) V!24989 V!24989 (_ BitVec 32) Int) ListLongMap!8809)

(assert (=> b!825685 (= lt!373009 (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825685 (= lt!373014 (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825687 () Bool)

(declare-fun e!459632 () Bool)

(assert (=> b!825687 (= e!459632 tp_is_empty!14991)))

(declare-fun b!825686 () Bool)

(declare-fun e!459633 () Bool)

(assert (=> b!825686 (= e!459633 (and e!459632 mapRes!24109))))

(declare-fun condMapEmpty!24109 () Bool)

(declare-fun mapDefault!24109 () ValueCell!7080)

(assert (=> b!825686 (= condMapEmpty!24109 (= (arr!22129 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7080)) mapDefault!24109)))))

(declare-fun res!562864 () Bool)

(assert (=> start!71094 (=> (not res!562864) (not e!459628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71094 (= res!562864 (validMask!0 mask!1312))))

(assert (=> start!71094 e!459628))

(assert (=> start!71094 tp_is_empty!14991))

(declare-fun array_inv!17641 (array!46164) Bool)

(assert (=> start!71094 (array_inv!17641 _keys!976)))

(assert (=> start!71094 true))

(declare-fun array_inv!17642 (array!46166) Bool)

(assert (=> start!71094 (and (array_inv!17642 _values!788) e!459633)))

(assert (=> start!71094 tp!46600))

(assert (= (and start!71094 res!562864) b!825684))

(assert (= (and b!825684 res!562868) b!825683))

(assert (= (and b!825683 res!562870) b!825679))

(assert (= (and b!825679 res!562867) b!825682))

(assert (= (and b!825682 (not res!562869)) b!825685))

(assert (= (and b!825685 res!562866) b!825681))

(assert (= (and b!825685 res!562865) b!825678))

(assert (= (and b!825686 condMapEmpty!24109) mapIsEmpty!24109))

(assert (= (and b!825686 (not condMapEmpty!24109)) mapNonEmpty!24109))

(get-info :version)

(assert (= (and mapNonEmpty!24109 ((_ is ValueCellFull!7080) mapValue!24109)) b!825680))

(assert (= (and b!825686 ((_ is ValueCellFull!7080) mapDefault!24109)) b!825687))

(assert (= start!71094 b!825686))

(declare-fun m!767981 () Bool)

(assert (=> b!825682 m!767981))

(declare-fun m!767983 () Bool)

(assert (=> b!825682 m!767983))

(declare-fun m!767985 () Bool)

(assert (=> b!825682 m!767985))

(declare-fun m!767987 () Bool)

(assert (=> b!825683 m!767987))

(declare-fun m!767989 () Bool)

(assert (=> b!825678 m!767989))

(assert (=> b!825678 m!767989))

(declare-fun m!767991 () Bool)

(assert (=> b!825678 m!767991))

(declare-fun m!767993 () Bool)

(assert (=> b!825681 m!767993))

(assert (=> b!825681 m!767993))

(declare-fun m!767995 () Bool)

(assert (=> b!825681 m!767995))

(declare-fun m!767997 () Bool)

(assert (=> b!825685 m!767997))

(declare-fun m!767999 () Bool)

(assert (=> b!825685 m!767999))

(declare-fun m!768001 () Bool)

(assert (=> b!825685 m!768001))

(declare-fun m!768003 () Bool)

(assert (=> b!825685 m!768003))

(declare-fun m!768005 () Bool)

(assert (=> b!825685 m!768005))

(declare-fun m!768007 () Bool)

(assert (=> b!825685 m!768007))

(declare-fun m!768009 () Bool)

(assert (=> b!825685 m!768009))

(declare-fun m!768011 () Bool)

(assert (=> b!825685 m!768011))

(assert (=> b!825685 m!768011))

(declare-fun m!768013 () Bool)

(assert (=> b!825685 m!768013))

(declare-fun m!768015 () Bool)

(assert (=> b!825685 m!768015))

(assert (=> b!825685 m!768015))

(declare-fun m!768017 () Bool)

(assert (=> b!825685 m!768017))

(declare-fun m!768019 () Bool)

(assert (=> mapNonEmpty!24109 m!768019))

(declare-fun m!768021 () Bool)

(assert (=> start!71094 m!768021))

(declare-fun m!768023 () Bool)

(assert (=> start!71094 m!768023))

(declare-fun m!768025 () Bool)

(assert (=> start!71094 m!768025))

(declare-fun m!768027 () Bool)

(assert (=> b!825679 m!768027))

(check-sat (not b!825683) (not b!825678) (not b!825679) (not b!825685) (not start!71094) (not b!825681) (not b_next!13281) b_and!22195 (not mapNonEmpty!24109) (not b!825682) tp_is_empty!14991)
(check-sat b_and!22195 (not b_next!13281))
