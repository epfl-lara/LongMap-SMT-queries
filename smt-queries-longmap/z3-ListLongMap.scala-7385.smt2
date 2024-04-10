; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94074 () Bool)

(assert start!94074)

(declare-fun b_free!21489 () Bool)

(declare-fun b_next!21489 () Bool)

(assert (=> start!94074 (= b_free!21489 (not b_next!21489))))

(declare-fun tp!75898 () Bool)

(declare-fun b_and!34231 () Bool)

(assert (=> start!94074 (= tp!75898 b_and!34231)))

(declare-fun b!1063928 () Bool)

(declare-fun e!606289 () Bool)

(declare-fun tp_is_empty!25299 () Bool)

(assert (=> b!1063928 (= e!606289 tp_is_empty!25299)))

(declare-fun b!1063929 () Bool)

(declare-fun e!606288 () Bool)

(declare-fun mapRes!39628 () Bool)

(assert (=> b!1063929 (= e!606288 (and e!606289 mapRes!39628))))

(declare-fun condMapEmpty!39628 () Bool)

(declare-datatypes ((V!38867 0))(
  ( (V!38868 (val!12700 Int)) )
))
(declare-datatypes ((ValueCell!11946 0))(
  ( (ValueCellFull!11946 (v!15312 V!38867)) (EmptyCell!11946) )
))
(declare-datatypes ((array!67597 0))(
  ( (array!67598 (arr!32503 (Array (_ BitVec 32) ValueCell!11946)) (size!33039 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67597)

(declare-fun mapDefault!39628 () ValueCell!11946)

(assert (=> b!1063929 (= condMapEmpty!39628 (= (arr!32503 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11946)) mapDefault!39628)))))

(declare-fun mapIsEmpty!39628 () Bool)

(assert (=> mapIsEmpty!39628 mapRes!39628))

(declare-fun b!1063930 () Bool)

(declare-fun res!710313 () Bool)

(declare-fun e!606287 () Bool)

(assert (=> b!1063930 (=> (not res!710313) (not e!606287))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67599 0))(
  ( (array!67600 (arr!32504 (Array (_ BitVec 32) (_ BitVec 64))) (size!33040 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67599)

(assert (=> b!1063930 (= res!710313 (and (= (size!33039 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33040 _keys!1163) (size!33039 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063931 () Bool)

(declare-fun e!606291 () Bool)

(assert (=> b!1063931 (= e!606291 tp_is_empty!25299)))

(declare-fun mapNonEmpty!39628 () Bool)

(declare-fun tp!75899 () Bool)

(assert (=> mapNonEmpty!39628 (= mapRes!39628 (and tp!75899 e!606291))))

(declare-fun mapKey!39628 () (_ BitVec 32))

(declare-fun mapValue!39628 () ValueCell!11946)

(declare-fun mapRest!39628 () (Array (_ BitVec 32) ValueCell!11946))

(assert (=> mapNonEmpty!39628 (= (arr!32503 _values!955) (store mapRest!39628 mapKey!39628 mapValue!39628))))

(declare-fun res!710311 () Bool)

(assert (=> start!94074 (=> (not res!710311) (not e!606287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94074 (= res!710311 (validMask!0 mask!1515))))

(assert (=> start!94074 e!606287))

(assert (=> start!94074 true))

(assert (=> start!94074 tp_is_empty!25299))

(declare-fun array_inv!25174 (array!67597) Bool)

(assert (=> start!94074 (and (array_inv!25174 _values!955) e!606288)))

(assert (=> start!94074 tp!75898))

(declare-fun array_inv!25175 (array!67599) Bool)

(assert (=> start!94074 (array_inv!25175 _keys!1163)))

(declare-fun b!1063932 () Bool)

(declare-fun res!710314 () Bool)

(assert (=> b!1063932 (=> (not res!710314) (not e!606287))))

(declare-datatypes ((List!22658 0))(
  ( (Nil!22655) (Cons!22654 (h!23863 (_ BitVec 64)) (t!31973 List!22658)) )
))
(declare-fun arrayNoDuplicates!0 (array!67599 (_ BitVec 32) List!22658) Bool)

(assert (=> b!1063932 (= res!710314 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22655))))

(declare-fun b!1063933 () Bool)

(assert (=> b!1063933 (= e!606287 (not true))))

(declare-datatypes ((tuple2!16082 0))(
  ( (tuple2!16083 (_1!8052 (_ BitVec 64)) (_2!8052 V!38867)) )
))
(declare-datatypes ((List!22659 0))(
  ( (Nil!22656) (Cons!22655 (h!23864 tuple2!16082) (t!31974 List!22659)) )
))
(declare-datatypes ((ListLongMap!14051 0))(
  ( (ListLongMap!14052 (toList!7041 List!22659)) )
))
(declare-fun lt!468971 () ListLongMap!14051)

(declare-fun lt!468973 () ListLongMap!14051)

(assert (=> b!1063933 (= lt!468971 lt!468973)))

(declare-fun zeroValueBefore!47 () V!38867)

(declare-datatypes ((Unit!34882 0))(
  ( (Unit!34883) )
))
(declare-fun lt!468972 () Unit!34882)

(declare-fun minValue!907 () V!38867)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38867)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!670 (array!67599 array!67597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38867 V!38867 V!38867 V!38867 (_ BitVec 32) Int) Unit!34882)

(assert (=> b!1063933 (= lt!468972 (lemmaNoChangeToArrayThenSameMapNoExtras!670 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3633 (array!67599 array!67597 (_ BitVec 32) (_ BitVec 32) V!38867 V!38867 (_ BitVec 32) Int) ListLongMap!14051)

(assert (=> b!1063933 (= lt!468973 (getCurrentListMapNoExtraKeys!3633 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063933 (= lt!468971 (getCurrentListMapNoExtraKeys!3633 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063934 () Bool)

(declare-fun res!710312 () Bool)

(assert (=> b!1063934 (=> (not res!710312) (not e!606287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67599 (_ BitVec 32)) Bool)

(assert (=> b!1063934 (= res!710312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94074 res!710311) b!1063930))

(assert (= (and b!1063930 res!710313) b!1063934))

(assert (= (and b!1063934 res!710312) b!1063932))

(assert (= (and b!1063932 res!710314) b!1063933))

(assert (= (and b!1063929 condMapEmpty!39628) mapIsEmpty!39628))

(assert (= (and b!1063929 (not condMapEmpty!39628)) mapNonEmpty!39628))

(get-info :version)

(assert (= (and mapNonEmpty!39628 ((_ is ValueCellFull!11946) mapValue!39628)) b!1063931))

(assert (= (and b!1063929 ((_ is ValueCellFull!11946) mapDefault!39628)) b!1063928))

(assert (= start!94074 b!1063929))

(declare-fun m!982557 () Bool)

(assert (=> b!1063933 m!982557))

(declare-fun m!982559 () Bool)

(assert (=> b!1063933 m!982559))

(declare-fun m!982561 () Bool)

(assert (=> b!1063933 m!982561))

(declare-fun m!982563 () Bool)

(assert (=> mapNonEmpty!39628 m!982563))

(declare-fun m!982565 () Bool)

(assert (=> b!1063932 m!982565))

(declare-fun m!982567 () Bool)

(assert (=> start!94074 m!982567))

(declare-fun m!982569 () Bool)

(assert (=> start!94074 m!982569))

(declare-fun m!982571 () Bool)

(assert (=> start!94074 m!982571))

(declare-fun m!982573 () Bool)

(assert (=> b!1063934 m!982573))

(check-sat (not b!1063932) (not b!1063934) (not mapNonEmpty!39628) (not start!94074) (not b_next!21489) b_and!34231 (not b!1063933) tp_is_empty!25299)
(check-sat b_and!34231 (not b_next!21489))
