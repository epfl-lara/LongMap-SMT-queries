; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94064 () Bool)

(assert start!94064)

(declare-fun b_free!21301 () Bool)

(declare-fun b_next!21301 () Bool)

(assert (=> start!94064 (= b_free!21301 (not b_next!21301))))

(declare-fun tp!75325 () Bool)

(declare-fun b_and!34025 () Bool)

(assert (=> start!94064 (= tp!75325 b_and!34025)))

(declare-fun mapIsEmpty!39337 () Bool)

(declare-fun mapRes!39337 () Bool)

(assert (=> mapIsEmpty!39337 mapRes!39337))

(declare-fun res!709219 () Bool)

(declare-fun e!605148 () Bool)

(assert (=> start!94064 (=> (not res!709219) (not e!605148))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94064 (= res!709219 (validMask!0 mask!1515))))

(assert (=> start!94064 e!605148))

(assert (=> start!94064 true))

(declare-fun tp_is_empty!25111 () Bool)

(assert (=> start!94064 tp_is_empty!25111))

(declare-datatypes ((V!38617 0))(
  ( (V!38618 (val!12606 Int)) )
))
(declare-datatypes ((ValueCell!11852 0))(
  ( (ValueCellFull!11852 (v!15212 V!38617)) (EmptyCell!11852) )
))
(declare-datatypes ((array!67277 0))(
  ( (array!67278 (arr!32340 (Array (_ BitVec 32) ValueCell!11852)) (size!32877 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67277)

(declare-fun e!605147 () Bool)

(declare-fun array_inv!25076 (array!67277) Bool)

(assert (=> start!94064 (and (array_inv!25076 _values!955) e!605147)))

(assert (=> start!94064 tp!75325))

(declare-datatypes ((array!67279 0))(
  ( (array!67280 (arr!32341 (Array (_ BitVec 32) (_ BitVec 64))) (size!32878 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67279)

(declare-fun array_inv!25077 (array!67279) Bool)

(assert (=> start!94064 (array_inv!25077 _keys!1163)))

(declare-fun b!1062549 () Bool)

(declare-fun res!709220 () Bool)

(assert (=> b!1062549 (=> (not res!709220) (not e!605148))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062549 (= res!709220 (and (= (size!32877 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32878 _keys!1163) (size!32877 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062550 () Bool)

(declare-fun e!605146 () Bool)

(assert (=> b!1062550 (= e!605146 tp_is_empty!25111)))

(declare-fun mapNonEmpty!39337 () Bool)

(declare-fun tp!75326 () Bool)

(declare-fun e!605145 () Bool)

(assert (=> mapNonEmpty!39337 (= mapRes!39337 (and tp!75326 e!605145))))

(declare-fun mapValue!39337 () ValueCell!11852)

(declare-fun mapKey!39337 () (_ BitVec 32))

(declare-fun mapRest!39337 () (Array (_ BitVec 32) ValueCell!11852))

(assert (=> mapNonEmpty!39337 (= (arr!32340 _values!955) (store mapRest!39337 mapKey!39337 mapValue!39337))))

(declare-fun b!1062551 () Bool)

(declare-fun res!709222 () Bool)

(assert (=> b!1062551 (=> (not res!709222) (not e!605148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67279 (_ BitVec 32)) Bool)

(assert (=> b!1062551 (= res!709222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062552 () Bool)

(declare-fun res!709221 () Bool)

(assert (=> b!1062552 (=> (not res!709221) (not e!605148))))

(declare-datatypes ((List!22506 0))(
  ( (Nil!22503) (Cons!22502 (h!23720 (_ BitVec 64)) (t!31807 List!22506)) )
))
(declare-fun arrayNoDuplicates!0 (array!67279 (_ BitVec 32) List!22506) Bool)

(assert (=> b!1062552 (= res!709221 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22503))))

(declare-fun b!1062553 () Bool)

(assert (=> b!1062553 (= e!605148 (not true))))

(declare-datatypes ((tuple2!15922 0))(
  ( (tuple2!15923 (_1!7972 (_ BitVec 64)) (_2!7972 V!38617)) )
))
(declare-datatypes ((List!22507 0))(
  ( (Nil!22504) (Cons!22503 (h!23721 tuple2!15922) (t!31808 List!22507)) )
))
(declare-datatypes ((ListLongMap!13899 0))(
  ( (ListLongMap!13900 (toList!6965 List!22507)) )
))
(declare-fun lt!468020 () ListLongMap!13899)

(declare-fun lt!468019 () ListLongMap!13899)

(assert (=> b!1062553 (= lt!468020 lt!468019)))

(declare-fun zeroValueBefore!47 () V!38617)

(declare-fun minValue!907 () V!38617)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38617)

(declare-datatypes ((Unit!34735 0))(
  ( (Unit!34736) )
))
(declare-fun lt!468021 () Unit!34735)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!616 (array!67279 array!67277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38617 V!38617 V!38617 V!38617 (_ BitVec 32) Int) Unit!34735)

(assert (=> b!1062553 (= lt!468021 (lemmaNoChangeToArrayThenSameMapNoExtras!616 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3613 (array!67279 array!67277 (_ BitVec 32) (_ BitVec 32) V!38617 V!38617 (_ BitVec 32) Int) ListLongMap!13899)

(assert (=> b!1062553 (= lt!468019 (getCurrentListMapNoExtraKeys!3613 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062553 (= lt!468020 (getCurrentListMapNoExtraKeys!3613 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062554 () Bool)

(assert (=> b!1062554 (= e!605147 (and e!605146 mapRes!39337))))

(declare-fun condMapEmpty!39337 () Bool)

(declare-fun mapDefault!39337 () ValueCell!11852)

(assert (=> b!1062554 (= condMapEmpty!39337 (= (arr!32340 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11852)) mapDefault!39337)))))

(declare-fun b!1062555 () Bool)

(assert (=> b!1062555 (= e!605145 tp_is_empty!25111)))

(assert (= (and start!94064 res!709219) b!1062549))

(assert (= (and b!1062549 res!709220) b!1062551))

(assert (= (and b!1062551 res!709222) b!1062552))

(assert (= (and b!1062552 res!709221) b!1062553))

(assert (= (and b!1062554 condMapEmpty!39337) mapIsEmpty!39337))

(assert (= (and b!1062554 (not condMapEmpty!39337)) mapNonEmpty!39337))

(get-info :version)

(assert (= (and mapNonEmpty!39337 ((_ is ValueCellFull!11852) mapValue!39337)) b!1062555))

(assert (= (and b!1062554 ((_ is ValueCellFull!11852) mapDefault!39337)) b!1062550))

(assert (= start!94064 b!1062554))

(declare-fun m!981775 () Bool)

(assert (=> b!1062552 m!981775))

(declare-fun m!981777 () Bool)

(assert (=> start!94064 m!981777))

(declare-fun m!981779 () Bool)

(assert (=> start!94064 m!981779))

(declare-fun m!981781 () Bool)

(assert (=> start!94064 m!981781))

(declare-fun m!981783 () Bool)

(assert (=> b!1062551 m!981783))

(declare-fun m!981785 () Bool)

(assert (=> mapNonEmpty!39337 m!981785))

(declare-fun m!981787 () Bool)

(assert (=> b!1062553 m!981787))

(declare-fun m!981789 () Bool)

(assert (=> b!1062553 m!981789))

(declare-fun m!981791 () Bool)

(assert (=> b!1062553 m!981791))

(check-sat tp_is_empty!25111 (not b!1062552) b_and!34025 (not b!1062553) (not b_next!21301) (not b!1062551) (not start!94064) (not mapNonEmpty!39337))
(check-sat b_and!34025 (not b_next!21301))
