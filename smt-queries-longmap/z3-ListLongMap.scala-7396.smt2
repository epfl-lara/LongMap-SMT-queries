; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94154 () Bool)

(assert start!94154)

(declare-fun b_free!21555 () Bool)

(declare-fun b_next!21555 () Bool)

(assert (=> start!94154 (= b_free!21555 (not b_next!21555))))

(declare-fun tp!76099 () Bool)

(declare-fun b_and!34305 () Bool)

(assert (=> start!94154 (= tp!76099 b_and!34305)))

(declare-fun res!710792 () Bool)

(declare-fun e!606888 () Bool)

(assert (=> start!94154 (=> (not res!710792) (not e!606888))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94154 (= res!710792 (validMask!0 mask!1515))))

(assert (=> start!94154 e!606888))

(assert (=> start!94154 true))

(declare-fun tp_is_empty!25365 () Bool)

(assert (=> start!94154 tp_is_empty!25365))

(declare-datatypes ((V!38955 0))(
  ( (V!38956 (val!12733 Int)) )
))
(declare-datatypes ((ValueCell!11979 0))(
  ( (ValueCellFull!11979 (v!15345 V!38955)) (EmptyCell!11979) )
))
(declare-datatypes ((array!67715 0))(
  ( (array!67716 (arr!32561 (Array (_ BitVec 32) ValueCell!11979)) (size!33097 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67715)

(declare-fun e!606891 () Bool)

(declare-fun array_inv!25214 (array!67715) Bool)

(assert (=> start!94154 (and (array_inv!25214 _values!955) e!606891)))

(assert (=> start!94154 tp!76099))

(declare-datatypes ((array!67717 0))(
  ( (array!67718 (arr!32562 (Array (_ BitVec 32) (_ BitVec 64))) (size!33098 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67717)

(declare-fun array_inv!25215 (array!67717) Bool)

(assert (=> start!94154 (array_inv!25215 _keys!1163)))

(declare-fun b!1064756 () Bool)

(declare-fun res!710790 () Bool)

(assert (=> b!1064756 (=> (not res!710790) (not e!606888))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064756 (= res!710790 (and (= (size!33097 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33098 _keys!1163) (size!33097 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064757 () Bool)

(declare-fun e!606887 () Bool)

(assert (=> b!1064757 (= e!606888 (not e!606887))))

(declare-fun res!710789 () Bool)

(assert (=> b!1064757 (=> res!710789 e!606887)))

(assert (=> b!1064757 (= res!710789 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16128 0))(
  ( (tuple2!16129 (_1!8075 (_ BitVec 64)) (_2!8075 V!38955)) )
))
(declare-datatypes ((List!22698 0))(
  ( (Nil!22695) (Cons!22694 (h!23903 tuple2!16128) (t!32015 List!22698)) )
))
(declare-datatypes ((ListLongMap!14097 0))(
  ( (ListLongMap!14098 (toList!7064 List!22698)) )
))
(declare-fun lt!469358 () ListLongMap!14097)

(declare-fun lt!469361 () ListLongMap!14097)

(assert (=> b!1064757 (= lt!469358 lt!469361)))

(declare-fun zeroValueBefore!47 () V!38955)

(declare-datatypes ((Unit!34922 0))(
  ( (Unit!34923) )
))
(declare-fun lt!469359 () Unit!34922)

(declare-fun minValue!907 () V!38955)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38955)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!690 (array!67717 array!67715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38955 V!38955 V!38955 V!38955 (_ BitVec 32) Int) Unit!34922)

(assert (=> b!1064757 (= lt!469359 (lemmaNoChangeToArrayThenSameMapNoExtras!690 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3653 (array!67717 array!67715 (_ BitVec 32) (_ BitVec 32) V!38955 V!38955 (_ BitVec 32) Int) ListLongMap!14097)

(assert (=> b!1064757 (= lt!469361 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064757 (= lt!469358 (getCurrentListMapNoExtraKeys!3653 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39730 () Bool)

(declare-fun mapRes!39730 () Bool)

(declare-fun tp!76100 () Bool)

(declare-fun e!606890 () Bool)

(assert (=> mapNonEmpty!39730 (= mapRes!39730 (and tp!76100 e!606890))))

(declare-fun mapKey!39730 () (_ BitVec 32))

(declare-fun mapValue!39730 () ValueCell!11979)

(declare-fun mapRest!39730 () (Array (_ BitVec 32) ValueCell!11979))

(assert (=> mapNonEmpty!39730 (= (arr!32561 _values!955) (store mapRest!39730 mapKey!39730 mapValue!39730))))

(declare-fun b!1064758 () Bool)

(assert (=> b!1064758 (= e!606887 true)))

(declare-fun lt!469360 () ListLongMap!14097)

(declare-fun getCurrentListMap!4024 (array!67717 array!67715 (_ BitVec 32) (_ BitVec 32) V!38955 V!38955 (_ BitVec 32) Int) ListLongMap!14097)

(assert (=> b!1064758 (= lt!469360 (getCurrentListMap!4024 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064759 () Bool)

(declare-fun e!606889 () Bool)

(assert (=> b!1064759 (= e!606889 tp_is_empty!25365)))

(declare-fun b!1064760 () Bool)

(assert (=> b!1064760 (= e!606890 tp_is_empty!25365)))

(declare-fun b!1064761 () Bool)

(declare-fun res!710791 () Bool)

(assert (=> b!1064761 (=> (not res!710791) (not e!606888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67717 (_ BitVec 32)) Bool)

(assert (=> b!1064761 (= res!710791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064762 () Bool)

(assert (=> b!1064762 (= e!606891 (and e!606889 mapRes!39730))))

(declare-fun condMapEmpty!39730 () Bool)

(declare-fun mapDefault!39730 () ValueCell!11979)

(assert (=> b!1064762 (= condMapEmpty!39730 (= (arr!32561 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11979)) mapDefault!39730)))))

(declare-fun b!1064763 () Bool)

(declare-fun res!710788 () Bool)

(assert (=> b!1064763 (=> (not res!710788) (not e!606888))))

(declare-datatypes ((List!22699 0))(
  ( (Nil!22696) (Cons!22695 (h!23904 (_ BitVec 64)) (t!32016 List!22699)) )
))
(declare-fun arrayNoDuplicates!0 (array!67717 (_ BitVec 32) List!22699) Bool)

(assert (=> b!1064763 (= res!710788 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22696))))

(declare-fun mapIsEmpty!39730 () Bool)

(assert (=> mapIsEmpty!39730 mapRes!39730))

(assert (= (and start!94154 res!710792) b!1064756))

(assert (= (and b!1064756 res!710790) b!1064761))

(assert (= (and b!1064761 res!710791) b!1064763))

(assert (= (and b!1064763 res!710788) b!1064757))

(assert (= (and b!1064757 (not res!710789)) b!1064758))

(assert (= (and b!1064762 condMapEmpty!39730) mapIsEmpty!39730))

(assert (= (and b!1064762 (not condMapEmpty!39730)) mapNonEmpty!39730))

(get-info :version)

(assert (= (and mapNonEmpty!39730 ((_ is ValueCellFull!11979) mapValue!39730)) b!1064760))

(assert (= (and b!1064762 ((_ is ValueCellFull!11979) mapDefault!39730)) b!1064759))

(assert (= start!94154 b!1064762))

(declare-fun m!983249 () Bool)

(assert (=> b!1064761 m!983249))

(declare-fun m!983251 () Bool)

(assert (=> b!1064758 m!983251))

(declare-fun m!983253 () Bool)

(assert (=> mapNonEmpty!39730 m!983253))

(declare-fun m!983255 () Bool)

(assert (=> start!94154 m!983255))

(declare-fun m!983257 () Bool)

(assert (=> start!94154 m!983257))

(declare-fun m!983259 () Bool)

(assert (=> start!94154 m!983259))

(declare-fun m!983261 () Bool)

(assert (=> b!1064757 m!983261))

(declare-fun m!983263 () Bool)

(assert (=> b!1064757 m!983263))

(declare-fun m!983265 () Bool)

(assert (=> b!1064757 m!983265))

(declare-fun m!983267 () Bool)

(assert (=> b!1064763 m!983267))

(check-sat b_and!34305 (not b_next!21555) tp_is_empty!25365 (not b!1064763) (not mapNonEmpty!39730) (not b!1064758) (not b!1064757) (not b!1064761) (not start!94154))
(check-sat b_and!34305 (not b_next!21555))
