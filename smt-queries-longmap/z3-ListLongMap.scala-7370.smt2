; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94174 () Bool)

(assert start!94174)

(declare-fun b_free!21397 () Bool)

(declare-fun b_next!21397 () Bool)

(assert (=> start!94174 (= b_free!21397 (not b_next!21397))))

(declare-fun tp!75616 () Bool)

(declare-fun b_and!34129 () Bool)

(assert (=> start!94174 (= tp!75616 b_and!34129)))

(declare-fun b!1063763 () Bool)

(declare-fun e!606041 () Bool)

(declare-fun e!606046 () Bool)

(assert (=> b!1063763 (= e!606041 (not e!606046))))

(declare-fun res!709952 () Bool)

(assert (=> b!1063763 (=> res!709952 e!606046)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063763 (= res!709952 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38745 0))(
  ( (V!38746 (val!12654 Int)) )
))
(declare-datatypes ((tuple2!15990 0))(
  ( (tuple2!15991 (_1!8006 (_ BitVec 64)) (_2!8006 V!38745)) )
))
(declare-datatypes ((List!22574 0))(
  ( (Nil!22571) (Cons!22570 (h!23788 tuple2!15990) (t!31877 List!22574)) )
))
(declare-datatypes ((ListLongMap!13967 0))(
  ( (ListLongMap!13968 (toList!6999 List!22574)) )
))
(declare-fun lt!468614 () ListLongMap!13967)

(declare-fun lt!468613 () ListLongMap!13967)

(assert (=> b!1063763 (= lt!468614 lt!468613)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11900 0))(
  ( (ValueCellFull!11900 (v!15260 V!38745)) (EmptyCell!11900) )
))
(declare-datatypes ((array!67459 0))(
  ( (array!67460 (arr!32430 (Array (_ BitVec 32) ValueCell!11900)) (size!32967 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67459)

(declare-fun minValue!907 () V!38745)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38745)

(declare-datatypes ((Unit!34803 0))(
  ( (Unit!34804) )
))
(declare-fun lt!468615 () Unit!34803)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38745)

(declare-datatypes ((array!67461 0))(
  ( (array!67462 (arr!32431 (Array (_ BitVec 32) (_ BitVec 64))) (size!32968 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67461)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!646 (array!67461 array!67459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38745 V!38745 V!38745 V!38745 (_ BitVec 32) Int) Unit!34803)

(assert (=> b!1063763 (= lt!468615 (lemmaNoChangeToArrayThenSameMapNoExtras!646 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3643 (array!67461 array!67459 (_ BitVec 32) (_ BitVec 32) V!38745 V!38745 (_ BitVec 32) Int) ListLongMap!13967)

(assert (=> b!1063763 (= lt!468613 (getCurrentListMapNoExtraKeys!3643 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063763 (= lt!468614 (getCurrentListMapNoExtraKeys!3643 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063764 () Bool)

(declare-fun e!606040 () Bool)

(assert (=> b!1063764 (= e!606046 e!606040)))

(declare-fun res!709951 () Bool)

(assert (=> b!1063764 (=> res!709951 e!606040)))

(declare-fun lt!468616 () ListLongMap!13967)

(declare-fun contains!6255 (ListLongMap!13967 (_ BitVec 64)) Bool)

(assert (=> b!1063764 (= res!709951 (contains!6255 lt!468616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3981 (array!67461 array!67459 (_ BitVec 32) (_ BitVec 32) V!38745 V!38745 (_ BitVec 32) Int) ListLongMap!13967)

(assert (=> b!1063764 (= lt!468616 (getCurrentListMap!3981 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39484 () Bool)

(declare-fun mapRes!39484 () Bool)

(declare-fun tp!75617 () Bool)

(declare-fun e!606045 () Bool)

(assert (=> mapNonEmpty!39484 (= mapRes!39484 (and tp!75617 e!606045))))

(declare-fun mapValue!39484 () ValueCell!11900)

(declare-fun mapKey!39484 () (_ BitVec 32))

(declare-fun mapRest!39484 () (Array (_ BitVec 32) ValueCell!11900))

(assert (=> mapNonEmpty!39484 (= (arr!32430 _values!955) (store mapRest!39484 mapKey!39484 mapValue!39484))))

(declare-fun mapIsEmpty!39484 () Bool)

(assert (=> mapIsEmpty!39484 mapRes!39484))

(declare-fun b!1063765 () Bool)

(declare-fun e!606044 () Bool)

(declare-fun tp_is_empty!25207 () Bool)

(assert (=> b!1063765 (= e!606044 tp_is_empty!25207)))

(declare-fun b!1063767 () Bool)

(assert (=> b!1063767 (= e!606045 tp_is_empty!25207)))

(declare-fun b!1063768 () Bool)

(declare-fun res!709949 () Bool)

(assert (=> b!1063768 (=> (not res!709949) (not e!606041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67461 (_ BitVec 32)) Bool)

(assert (=> b!1063768 (= res!709949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063769 () Bool)

(declare-fun res!709948 () Bool)

(assert (=> b!1063769 (=> (not res!709948) (not e!606041))))

(declare-datatypes ((List!22575 0))(
  ( (Nil!22572) (Cons!22571 (h!23789 (_ BitVec 64)) (t!31878 List!22575)) )
))
(declare-fun arrayNoDuplicates!0 (array!67461 (_ BitVec 32) List!22575) Bool)

(assert (=> b!1063769 (= res!709948 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22572))))

(declare-fun b!1063770 () Bool)

(declare-fun res!709947 () Bool)

(assert (=> b!1063770 (=> (not res!709947) (not e!606041))))

(assert (=> b!1063770 (= res!709947 (and (= (size!32967 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32968 _keys!1163) (size!32967 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063771 () Bool)

(declare-fun e!606043 () Bool)

(assert (=> b!1063771 (= e!606043 (and e!606044 mapRes!39484))))

(declare-fun condMapEmpty!39484 () Bool)

(declare-fun mapDefault!39484 () ValueCell!11900)

(assert (=> b!1063771 (= condMapEmpty!39484 (= (arr!32430 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11900)) mapDefault!39484)))))

(declare-fun res!709950 () Bool)

(assert (=> start!94174 (=> (not res!709950) (not e!606041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94174 (= res!709950 (validMask!0 mask!1515))))

(assert (=> start!94174 e!606041))

(assert (=> start!94174 true))

(assert (=> start!94174 tp_is_empty!25207))

(declare-fun array_inv!25140 (array!67459) Bool)

(assert (=> start!94174 (and (array_inv!25140 _values!955) e!606043)))

(assert (=> start!94174 tp!75616))

(declare-fun array_inv!25141 (array!67461) Bool)

(assert (=> start!94174 (array_inv!25141 _keys!1163)))

(declare-fun b!1063766 () Bool)

(assert (=> b!1063766 (= e!606040 true)))

(declare-fun -!564 (ListLongMap!13967 (_ BitVec 64)) ListLongMap!13967)

(assert (=> b!1063766 (= (-!564 lt!468616 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468616)))

(declare-fun lt!468612 () Unit!34803)

(declare-fun removeNotPresentStillSame!15 (ListLongMap!13967 (_ BitVec 64)) Unit!34803)

(assert (=> b!1063766 (= lt!468612 (removeNotPresentStillSame!15 lt!468616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!94174 res!709950) b!1063770))

(assert (= (and b!1063770 res!709947) b!1063768))

(assert (= (and b!1063768 res!709949) b!1063769))

(assert (= (and b!1063769 res!709948) b!1063763))

(assert (= (and b!1063763 (not res!709952)) b!1063764))

(assert (= (and b!1063764 (not res!709951)) b!1063766))

(assert (= (and b!1063771 condMapEmpty!39484) mapIsEmpty!39484))

(assert (= (and b!1063771 (not condMapEmpty!39484)) mapNonEmpty!39484))

(get-info :version)

(assert (= (and mapNonEmpty!39484 ((_ is ValueCellFull!11900) mapValue!39484)) b!1063767))

(assert (= (and b!1063771 ((_ is ValueCellFull!11900) mapDefault!39484)) b!1063765))

(assert (= start!94174 b!1063771))

(declare-fun m!982861 () Bool)

(assert (=> mapNonEmpty!39484 m!982861))

(declare-fun m!982863 () Bool)

(assert (=> b!1063768 m!982863))

(declare-fun m!982865 () Bool)

(assert (=> start!94174 m!982865))

(declare-fun m!982867 () Bool)

(assert (=> start!94174 m!982867))

(declare-fun m!982869 () Bool)

(assert (=> start!94174 m!982869))

(declare-fun m!982871 () Bool)

(assert (=> b!1063763 m!982871))

(declare-fun m!982873 () Bool)

(assert (=> b!1063763 m!982873))

(declare-fun m!982875 () Bool)

(assert (=> b!1063763 m!982875))

(declare-fun m!982877 () Bool)

(assert (=> b!1063769 m!982877))

(declare-fun m!982879 () Bool)

(assert (=> b!1063766 m!982879))

(declare-fun m!982881 () Bool)

(assert (=> b!1063766 m!982881))

(declare-fun m!982883 () Bool)

(assert (=> b!1063764 m!982883))

(declare-fun m!982885 () Bool)

(assert (=> b!1063764 m!982885))

(check-sat b_and!34129 (not b!1063763) (not mapNonEmpty!39484) (not start!94174) (not b_next!21397) (not b!1063766) (not b!1063764) (not b!1063768) tp_is_empty!25207 (not b!1063769))
(check-sat b_and!34129 (not b_next!21397))
