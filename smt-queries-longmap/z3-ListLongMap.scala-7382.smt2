; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94048 () Bool)

(assert start!94048)

(declare-fun b_free!21469 () Bool)

(declare-fun b_next!21469 () Bool)

(assert (=> start!94048 (= b_free!21469 (not b_next!21469))))

(declare-fun tp!75838 () Bool)

(declare-fun b_and!34185 () Bool)

(assert (=> start!94048 (= tp!75838 b_and!34185)))

(declare-fun mapIsEmpty!39598 () Bool)

(declare-fun mapRes!39598 () Bool)

(assert (=> mapIsEmpty!39598 mapRes!39598))

(declare-fun b!1063565 () Bool)

(declare-fun e!606048 () Bool)

(declare-fun tp_is_empty!25279 () Bool)

(assert (=> b!1063565 (= e!606048 tp_is_empty!25279)))

(declare-fun b!1063566 () Bool)

(declare-fun res!710123 () Bool)

(declare-fun e!606046 () Bool)

(assert (=> b!1063566 (=> (not res!710123) (not e!606046))))

(declare-datatypes ((array!67498 0))(
  ( (array!67499 (arr!32454 (Array (_ BitVec 32) (_ BitVec 64))) (size!32992 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67498)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67498 (_ BitVec 32)) Bool)

(assert (=> b!1063566 (= res!710123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063567 () Bool)

(declare-fun res!710124 () Bool)

(assert (=> b!1063567 (=> (not res!710124) (not e!606046))))

(declare-datatypes ((List!22678 0))(
  ( (Nil!22675) (Cons!22674 (h!23883 (_ BitVec 64)) (t!31984 List!22678)) )
))
(declare-fun arrayNoDuplicates!0 (array!67498 (_ BitVec 32) List!22678) Bool)

(assert (=> b!1063567 (= res!710124 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22675))))

(declare-fun res!710125 () Bool)

(assert (=> start!94048 (=> (not res!710125) (not e!606046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94048 (= res!710125 (validMask!0 mask!1515))))

(assert (=> start!94048 e!606046))

(assert (=> start!94048 true))

(assert (=> start!94048 tp_is_empty!25279))

(declare-datatypes ((V!38841 0))(
  ( (V!38842 (val!12690 Int)) )
))
(declare-datatypes ((ValueCell!11936 0))(
  ( (ValueCellFull!11936 (v!15301 V!38841)) (EmptyCell!11936) )
))
(declare-datatypes ((array!67500 0))(
  ( (array!67501 (arr!32455 (Array (_ BitVec 32) ValueCell!11936)) (size!32993 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67500)

(declare-fun e!606047 () Bool)

(declare-fun array_inv!25144 (array!67500) Bool)

(assert (=> start!94048 (and (array_inv!25144 _values!955) e!606047)))

(assert (=> start!94048 tp!75838))

(declare-fun array_inv!25145 (array!67498) Bool)

(assert (=> start!94048 (array_inv!25145 _keys!1163)))

(declare-fun b!1063568 () Bool)

(assert (=> b!1063568 (= e!606047 (and e!606048 mapRes!39598))))

(declare-fun condMapEmpty!39598 () Bool)

(declare-fun mapDefault!39598 () ValueCell!11936)

(assert (=> b!1063568 (= condMapEmpty!39598 (= (arr!32455 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11936)) mapDefault!39598)))))

(declare-fun b!1063569 () Bool)

(declare-fun res!710122 () Bool)

(assert (=> b!1063569 (=> (not res!710122) (not e!606046))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063569 (= res!710122 (and (= (size!32993 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32992 _keys!1163) (size!32993 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063570 () Bool)

(declare-fun e!606044 () Bool)

(assert (=> b!1063570 (= e!606044 tp_is_empty!25279)))

(declare-fun mapNonEmpty!39598 () Bool)

(declare-fun tp!75839 () Bool)

(assert (=> mapNonEmpty!39598 (= mapRes!39598 (and tp!75839 e!606044))))

(declare-fun mapRest!39598 () (Array (_ BitVec 32) ValueCell!11936))

(declare-fun mapKey!39598 () (_ BitVec 32))

(declare-fun mapValue!39598 () ValueCell!11936)

(assert (=> mapNonEmpty!39598 (= (arr!32455 _values!955) (store mapRest!39598 mapKey!39598 mapValue!39598))))

(declare-fun b!1063571 () Bool)

(assert (=> b!1063571 (= e!606046 (not true))))

(declare-datatypes ((tuple2!16130 0))(
  ( (tuple2!16131 (_1!8076 (_ BitVec 64)) (_2!8076 V!38841)) )
))
(declare-datatypes ((List!22679 0))(
  ( (Nil!22676) (Cons!22675 (h!23884 tuple2!16130) (t!31985 List!22679)) )
))
(declare-datatypes ((ListLongMap!14099 0))(
  ( (ListLongMap!14100 (toList!7065 List!22679)) )
))
(declare-fun lt!468682 () ListLongMap!14099)

(declare-fun lt!468683 () ListLongMap!14099)

(assert (=> b!1063571 (= lt!468682 lt!468683)))

(declare-fun zeroValueBefore!47 () V!38841)

(declare-datatypes ((Unit!34721 0))(
  ( (Unit!34722) )
))
(declare-fun lt!468681 () Unit!34721)

(declare-fun minValue!907 () V!38841)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38841)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!665 (array!67498 array!67500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38841 V!38841 V!38841 V!38841 (_ BitVec 32) Int) Unit!34721)

(assert (=> b!1063571 (= lt!468681 (lemmaNoChangeToArrayThenSameMapNoExtras!665 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3671 (array!67498 array!67500 (_ BitVec 32) (_ BitVec 32) V!38841 V!38841 (_ BitVec 32) Int) ListLongMap!14099)

(assert (=> b!1063571 (= lt!468683 (getCurrentListMapNoExtraKeys!3671 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063571 (= lt!468682 (getCurrentListMapNoExtraKeys!3671 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94048 res!710125) b!1063569))

(assert (= (and b!1063569 res!710122) b!1063566))

(assert (= (and b!1063566 res!710123) b!1063567))

(assert (= (and b!1063567 res!710124) b!1063571))

(assert (= (and b!1063568 condMapEmpty!39598) mapIsEmpty!39598))

(assert (= (and b!1063568 (not condMapEmpty!39598)) mapNonEmpty!39598))

(get-info :version)

(assert (= (and mapNonEmpty!39598 ((_ is ValueCellFull!11936) mapValue!39598)) b!1063570))

(assert (= (and b!1063568 ((_ is ValueCellFull!11936) mapDefault!39598)) b!1063565))

(assert (= start!94048 b!1063568))

(declare-fun m!981751 () Bool)

(assert (=> start!94048 m!981751))

(declare-fun m!981753 () Bool)

(assert (=> start!94048 m!981753))

(declare-fun m!981755 () Bool)

(assert (=> start!94048 m!981755))

(declare-fun m!981757 () Bool)

(assert (=> b!1063567 m!981757))

(declare-fun m!981759 () Bool)

(assert (=> b!1063566 m!981759))

(declare-fun m!981761 () Bool)

(assert (=> b!1063571 m!981761))

(declare-fun m!981763 () Bool)

(assert (=> b!1063571 m!981763))

(declare-fun m!981765 () Bool)

(assert (=> b!1063571 m!981765))

(declare-fun m!981767 () Bool)

(assert (=> mapNonEmpty!39598 m!981767))

(check-sat (not start!94048) (not b!1063571) (not mapNonEmpty!39598) (not b_next!21469) tp_is_empty!25279 (not b!1063566) b_and!34185 (not b!1063567))
(check-sat b_and!34185 (not b_next!21469))
