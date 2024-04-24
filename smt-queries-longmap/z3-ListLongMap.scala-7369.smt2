; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94168 () Bool)

(assert start!94168)

(declare-fun b_free!21391 () Bool)

(declare-fun b_next!21391 () Bool)

(assert (=> start!94168 (= b_free!21391 (not b_next!21391))))

(declare-fun tp!75598 () Bool)

(declare-fun b_and!34123 () Bool)

(assert (=> start!94168 (= tp!75598 b_and!34123)))

(declare-fun b!1063682 () Bool)

(declare-fun e!605981 () Bool)

(declare-fun tp_is_empty!25201 () Bool)

(assert (=> b!1063682 (= e!605981 tp_is_empty!25201)))

(declare-fun b!1063683 () Bool)

(declare-fun e!605978 () Bool)

(declare-fun e!605977 () Bool)

(declare-fun mapRes!39475 () Bool)

(assert (=> b!1063683 (= e!605978 (and e!605977 mapRes!39475))))

(declare-fun condMapEmpty!39475 () Bool)

(declare-datatypes ((V!38737 0))(
  ( (V!38738 (val!12651 Int)) )
))
(declare-datatypes ((ValueCell!11897 0))(
  ( (ValueCellFull!11897 (v!15257 V!38737)) (EmptyCell!11897) )
))
(declare-datatypes ((array!67447 0))(
  ( (array!67448 (arr!32424 (Array (_ BitVec 32) ValueCell!11897)) (size!32961 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67447)

(declare-fun mapDefault!39475 () ValueCell!11897)

(assert (=> b!1063683 (= condMapEmpty!39475 (= (arr!32424 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11897)) mapDefault!39475)))))

(declare-fun b!1063684 () Bool)

(declare-fun res!709895 () Bool)

(declare-fun e!605979 () Bool)

(assert (=> b!1063684 (=> (not res!709895) (not e!605979))))

(declare-datatypes ((array!67449 0))(
  ( (array!67450 (arr!32425 (Array (_ BitVec 32) (_ BitVec 64))) (size!32962 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67449)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67449 (_ BitVec 32)) Bool)

(assert (=> b!1063684 (= res!709895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39475 () Bool)

(declare-fun tp!75599 () Bool)

(assert (=> mapNonEmpty!39475 (= mapRes!39475 (and tp!75599 e!605981))))

(declare-fun mapRest!39475 () (Array (_ BitVec 32) ValueCell!11897))

(declare-fun mapKey!39475 () (_ BitVec 32))

(declare-fun mapValue!39475 () ValueCell!11897)

(assert (=> mapNonEmpty!39475 (= (arr!32424 _values!955) (store mapRest!39475 mapKey!39475 mapValue!39475))))

(declare-fun b!1063685 () Bool)

(declare-fun e!605980 () Bool)

(declare-fun e!605983 () Bool)

(assert (=> b!1063685 (= e!605980 e!605983)))

(declare-fun res!709896 () Bool)

(assert (=> b!1063685 (=> res!709896 e!605983)))

(declare-datatypes ((tuple2!15986 0))(
  ( (tuple2!15987 (_1!8004 (_ BitVec 64)) (_2!8004 V!38737)) )
))
(declare-datatypes ((List!22570 0))(
  ( (Nil!22567) (Cons!22566 (h!23784 tuple2!15986) (t!31873 List!22570)) )
))
(declare-datatypes ((ListLongMap!13963 0))(
  ( (ListLongMap!13964 (toList!6997 List!22570)) )
))
(declare-fun lt!468570 () ListLongMap!13963)

(declare-fun contains!6253 (ListLongMap!13963 (_ BitVec 64)) Bool)

(assert (=> b!1063685 (= res!709896 (contains!6253 lt!468570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38737)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38737)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3979 (array!67449 array!67447 (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 (_ BitVec 32) Int) ListLongMap!13963)

(assert (=> b!1063685 (= lt!468570 (getCurrentListMap!3979 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39475 () Bool)

(assert (=> mapIsEmpty!39475 mapRes!39475))

(declare-fun b!1063686 () Bool)

(assert (=> b!1063686 (= e!605983 true)))

(declare-fun -!562 (ListLongMap!13963 (_ BitVec 64)) ListLongMap!13963)

(assert (=> b!1063686 (= (-!562 lt!468570 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468570)))

(declare-datatypes ((Unit!34799 0))(
  ( (Unit!34800) )
))
(declare-fun lt!468569 () Unit!34799)

(declare-fun removeNotPresentStillSame!13 (ListLongMap!13963 (_ BitVec 64)) Unit!34799)

(assert (=> b!1063686 (= lt!468569 (removeNotPresentStillSame!13 lt!468570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!709894 () Bool)

(assert (=> start!94168 (=> (not res!709894) (not e!605979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94168 (= res!709894 (validMask!0 mask!1515))))

(assert (=> start!94168 e!605979))

(assert (=> start!94168 true))

(assert (=> start!94168 tp_is_empty!25201))

(declare-fun array_inv!25136 (array!67447) Bool)

(assert (=> start!94168 (and (array_inv!25136 _values!955) e!605978)))

(assert (=> start!94168 tp!75598))

(declare-fun array_inv!25137 (array!67449) Bool)

(assert (=> start!94168 (array_inv!25137 _keys!1163)))

(declare-fun b!1063687 () Bool)

(declare-fun res!709893 () Bool)

(assert (=> b!1063687 (=> (not res!709893) (not e!605979))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1063687 (= res!709893 (and (= (size!32961 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32962 _keys!1163) (size!32961 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063688 () Bool)

(assert (=> b!1063688 (= e!605979 (not e!605980))))

(declare-fun res!709897 () Bool)

(assert (=> b!1063688 (=> res!709897 e!605980)))

(assert (=> b!1063688 (= res!709897 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468571 () ListLongMap!13963)

(declare-fun lt!468568 () ListLongMap!13963)

(assert (=> b!1063688 (= lt!468571 lt!468568)))

(declare-fun zeroValueAfter!47 () V!38737)

(declare-fun lt!468567 () Unit!34799)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!644 (array!67449 array!67447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 V!38737 V!38737 (_ BitVec 32) Int) Unit!34799)

(assert (=> b!1063688 (= lt!468567 (lemmaNoChangeToArrayThenSameMapNoExtras!644 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3641 (array!67449 array!67447 (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 (_ BitVec 32) Int) ListLongMap!13963)

(assert (=> b!1063688 (= lt!468568 (getCurrentListMapNoExtraKeys!3641 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063688 (= lt!468571 (getCurrentListMapNoExtraKeys!3641 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063689 () Bool)

(declare-fun res!709898 () Bool)

(assert (=> b!1063689 (=> (not res!709898) (not e!605979))))

(declare-datatypes ((List!22571 0))(
  ( (Nil!22568) (Cons!22567 (h!23785 (_ BitVec 64)) (t!31874 List!22571)) )
))
(declare-fun arrayNoDuplicates!0 (array!67449 (_ BitVec 32) List!22571) Bool)

(assert (=> b!1063689 (= res!709898 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22568))))

(declare-fun b!1063690 () Bool)

(assert (=> b!1063690 (= e!605977 tp_is_empty!25201)))

(assert (= (and start!94168 res!709894) b!1063687))

(assert (= (and b!1063687 res!709893) b!1063684))

(assert (= (and b!1063684 res!709895) b!1063689))

(assert (= (and b!1063689 res!709898) b!1063688))

(assert (= (and b!1063688 (not res!709897)) b!1063685))

(assert (= (and b!1063685 (not res!709896)) b!1063686))

(assert (= (and b!1063683 condMapEmpty!39475) mapIsEmpty!39475))

(assert (= (and b!1063683 (not condMapEmpty!39475)) mapNonEmpty!39475))

(get-info :version)

(assert (= (and mapNonEmpty!39475 ((_ is ValueCellFull!11897) mapValue!39475)) b!1063682))

(assert (= (and b!1063683 ((_ is ValueCellFull!11897) mapDefault!39475)) b!1063690))

(assert (= start!94168 b!1063683))

(declare-fun m!982783 () Bool)

(assert (=> mapNonEmpty!39475 m!982783))

(declare-fun m!982785 () Bool)

(assert (=> b!1063689 m!982785))

(declare-fun m!982787 () Bool)

(assert (=> b!1063686 m!982787))

(declare-fun m!982789 () Bool)

(assert (=> b!1063686 m!982789))

(declare-fun m!982791 () Bool)

(assert (=> start!94168 m!982791))

(declare-fun m!982793 () Bool)

(assert (=> start!94168 m!982793))

(declare-fun m!982795 () Bool)

(assert (=> start!94168 m!982795))

(declare-fun m!982797 () Bool)

(assert (=> b!1063688 m!982797))

(declare-fun m!982799 () Bool)

(assert (=> b!1063688 m!982799))

(declare-fun m!982801 () Bool)

(assert (=> b!1063688 m!982801))

(declare-fun m!982803 () Bool)

(assert (=> b!1063685 m!982803))

(declare-fun m!982805 () Bool)

(assert (=> b!1063685 m!982805))

(declare-fun m!982807 () Bool)

(assert (=> b!1063684 m!982807))

(check-sat (not start!94168) b_and!34123 (not b!1063688) (not b!1063686) (not b!1063689) (not mapNonEmpty!39475) tp_is_empty!25201 (not b_next!21391) (not b!1063685) (not b!1063684))
(check-sat b_and!34123 (not b_next!21391))
