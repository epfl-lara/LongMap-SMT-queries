; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94290 () Bool)

(assert start!94290)

(declare-fun b_free!21469 () Bool)

(declare-fun b_next!21469 () Bool)

(assert (=> start!94290 (= b_free!21469 (not b_next!21469))))

(declare-fun tp!75839 () Bool)

(declare-fun b_and!34221 () Bool)

(assert (=> start!94290 (= tp!75839 b_and!34221)))

(declare-fun b!1065045 () Bool)

(declare-fun e!606995 () Bool)

(assert (=> b!1065045 (= e!606995 (not true))))

(declare-datatypes ((V!38841 0))(
  ( (V!38842 (val!12690 Int)) )
))
(declare-datatypes ((tuple2!16058 0))(
  ( (tuple2!16059 (_1!8040 (_ BitVec 64)) (_2!8040 V!38841)) )
))
(declare-datatypes ((List!22630 0))(
  ( (Nil!22627) (Cons!22626 (h!23844 tuple2!16058) (t!31937 List!22630)) )
))
(declare-datatypes ((ListLongMap!14035 0))(
  ( (ListLongMap!14036 (toList!7033 List!22630)) )
))
(declare-fun lt!469396 () ListLongMap!14035)

(declare-fun lt!469398 () ListLongMap!14035)

(assert (=> b!1065045 (= lt!469396 lt!469398)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38841)

(declare-datatypes ((ValueCell!11936 0))(
  ( (ValueCellFull!11936 (v!15298 V!38841)) (EmptyCell!11936) )
))
(declare-datatypes ((array!67603 0))(
  ( (array!67604 (arr!32500 (Array (_ BitVec 32) ValueCell!11936)) (size!33037 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67603)

(declare-fun minValue!907 () V!38841)

(declare-datatypes ((Unit!34869 0))(
  ( (Unit!34870) )
))
(declare-fun lt!469397 () Unit!34869)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38841)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67605 0))(
  ( (array!67606 (arr!32501 (Array (_ BitVec 32) (_ BitVec 64))) (size!33038 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67605)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!670 (array!67605 array!67603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38841 V!38841 V!38841 V!38841 (_ BitVec 32) Int) Unit!34869)

(assert (=> b!1065045 (= lt!469397 (lemmaNoChangeToArrayThenSameMapNoExtras!670 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3667 (array!67605 array!67603 (_ BitVec 32) (_ BitVec 32) V!38841 V!38841 (_ BitVec 32) Int) ListLongMap!14035)

(assert (=> b!1065045 (= lt!469398 (getCurrentListMapNoExtraKeys!3667 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065045 (= lt!469396 (getCurrentListMapNoExtraKeys!3667 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065046 () Bool)

(declare-fun res!710715 () Bool)

(assert (=> b!1065046 (=> (not res!710715) (not e!606995))))

(assert (=> b!1065046 (= res!710715 (and (= (size!33037 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33038 _keys!1163) (size!33037 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065047 () Bool)

(declare-fun res!710713 () Bool)

(assert (=> b!1065047 (=> (not res!710713) (not e!606995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67605 (_ BitVec 32)) Bool)

(assert (=> b!1065047 (= res!710713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065048 () Bool)

(declare-fun res!710716 () Bool)

(assert (=> b!1065048 (=> (not res!710716) (not e!606995))))

(declare-datatypes ((List!22631 0))(
  ( (Nil!22628) (Cons!22627 (h!23845 (_ BitVec 64)) (t!31938 List!22631)) )
))
(declare-fun arrayNoDuplicates!0 (array!67605 (_ BitVec 32) List!22631) Bool)

(assert (=> b!1065048 (= res!710716 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22628))))

(declare-fun res!710714 () Bool)

(assert (=> start!94290 (=> (not res!710714) (not e!606995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94290 (= res!710714 (validMask!0 mask!1515))))

(assert (=> start!94290 e!606995))

(assert (=> start!94290 true))

(declare-fun tp_is_empty!25279 () Bool)

(assert (=> start!94290 tp_is_empty!25279))

(declare-fun e!606996 () Bool)

(declare-fun array_inv!25192 (array!67603) Bool)

(assert (=> start!94290 (and (array_inv!25192 _values!955) e!606996)))

(assert (=> start!94290 tp!75839))

(declare-fun array_inv!25193 (array!67605) Bool)

(assert (=> start!94290 (array_inv!25193 _keys!1163)))

(declare-fun b!1065049 () Bool)

(declare-fun e!606992 () Bool)

(assert (=> b!1065049 (= e!606992 tp_is_empty!25279)))

(declare-fun mapNonEmpty!39598 () Bool)

(declare-fun mapRes!39598 () Bool)

(declare-fun tp!75838 () Bool)

(assert (=> mapNonEmpty!39598 (= mapRes!39598 (and tp!75838 e!606992))))

(declare-fun mapValue!39598 () ValueCell!11936)

(declare-fun mapKey!39598 () (_ BitVec 32))

(declare-fun mapRest!39598 () (Array (_ BitVec 32) ValueCell!11936))

(assert (=> mapNonEmpty!39598 (= (arr!32500 _values!955) (store mapRest!39598 mapKey!39598 mapValue!39598))))

(declare-fun b!1065050 () Bool)

(declare-fun e!606993 () Bool)

(assert (=> b!1065050 (= e!606993 tp_is_empty!25279)))

(declare-fun mapIsEmpty!39598 () Bool)

(assert (=> mapIsEmpty!39598 mapRes!39598))

(declare-fun b!1065051 () Bool)

(assert (=> b!1065051 (= e!606996 (and e!606993 mapRes!39598))))

(declare-fun condMapEmpty!39598 () Bool)

(declare-fun mapDefault!39598 () ValueCell!11936)

(assert (=> b!1065051 (= condMapEmpty!39598 (= (arr!32500 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11936)) mapDefault!39598)))))

(assert (= (and start!94290 res!710714) b!1065046))

(assert (= (and b!1065046 res!710715) b!1065047))

(assert (= (and b!1065047 res!710713) b!1065048))

(assert (= (and b!1065048 res!710716) b!1065045))

(assert (= (and b!1065051 condMapEmpty!39598) mapIsEmpty!39598))

(assert (= (and b!1065051 (not condMapEmpty!39598)) mapNonEmpty!39598))

(get-info :version)

(assert (= (and mapNonEmpty!39598 ((_ is ValueCellFull!11936) mapValue!39598)) b!1065049))

(assert (= (and b!1065051 ((_ is ValueCellFull!11936) mapDefault!39598)) b!1065050))

(assert (= start!94290 b!1065051))

(declare-fun m!984049 () Bool)

(assert (=> start!94290 m!984049))

(declare-fun m!984051 () Bool)

(assert (=> start!94290 m!984051))

(declare-fun m!984053 () Bool)

(assert (=> start!94290 m!984053))

(declare-fun m!984055 () Bool)

(assert (=> mapNonEmpty!39598 m!984055))

(declare-fun m!984057 () Bool)

(assert (=> b!1065047 m!984057))

(declare-fun m!984059 () Bool)

(assert (=> b!1065048 m!984059))

(declare-fun m!984061 () Bool)

(assert (=> b!1065045 m!984061))

(declare-fun m!984063 () Bool)

(assert (=> b!1065045 m!984063))

(declare-fun m!984065 () Bool)

(assert (=> b!1065045 m!984065))

(check-sat (not b!1065048) (not b!1065047) (not b!1065045) (not b_next!21469) (not start!94290) b_and!34221 (not mapNonEmpty!39598) tp_is_empty!25279)
(check-sat b_and!34221 (not b_next!21469))
