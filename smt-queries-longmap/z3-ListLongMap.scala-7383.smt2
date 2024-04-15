; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94054 () Bool)

(assert start!94054)

(declare-fun b_free!21475 () Bool)

(declare-fun b_next!21475 () Bool)

(assert (=> start!94054 (= b_free!21475 (not b_next!21475))))

(declare-fun tp!75856 () Bool)

(declare-fun b_and!34191 () Bool)

(assert (=> start!94054 (= tp!75856 b_and!34191)))

(declare-fun b!1063628 () Bool)

(declare-fun res!710159 () Bool)

(declare-fun e!606089 () Bool)

(assert (=> b!1063628 (=> (not res!710159) (not e!606089))))

(declare-datatypes ((array!67510 0))(
  ( (array!67511 (arr!32460 (Array (_ BitVec 32) (_ BitVec 64))) (size!32998 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67510)

(declare-datatypes ((List!22683 0))(
  ( (Nil!22680) (Cons!22679 (h!23888 (_ BitVec 64)) (t!31989 List!22683)) )
))
(declare-fun arrayNoDuplicates!0 (array!67510 (_ BitVec 32) List!22683) Bool)

(assert (=> b!1063628 (= res!710159 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22680))))

(declare-fun mapNonEmpty!39607 () Bool)

(declare-fun mapRes!39607 () Bool)

(declare-fun tp!75857 () Bool)

(declare-fun e!606090 () Bool)

(assert (=> mapNonEmpty!39607 (= mapRes!39607 (and tp!75857 e!606090))))

(declare-fun mapKey!39607 () (_ BitVec 32))

(declare-datatypes ((V!38849 0))(
  ( (V!38850 (val!12693 Int)) )
))
(declare-datatypes ((ValueCell!11939 0))(
  ( (ValueCellFull!11939 (v!15304 V!38849)) (EmptyCell!11939) )
))
(declare-fun mapRest!39607 () (Array (_ BitVec 32) ValueCell!11939))

(declare-fun mapValue!39607 () ValueCell!11939)

(declare-datatypes ((array!67512 0))(
  ( (array!67513 (arr!32461 (Array (_ BitVec 32) ValueCell!11939)) (size!32999 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67512)

(assert (=> mapNonEmpty!39607 (= (arr!32461 _values!955) (store mapRest!39607 mapKey!39607 mapValue!39607))))

(declare-fun res!710160 () Bool)

(assert (=> start!94054 (=> (not res!710160) (not e!606089))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94054 (= res!710160 (validMask!0 mask!1515))))

(assert (=> start!94054 e!606089))

(assert (=> start!94054 true))

(declare-fun tp_is_empty!25285 () Bool)

(assert (=> start!94054 tp_is_empty!25285))

(declare-fun e!606092 () Bool)

(declare-fun array_inv!25148 (array!67512) Bool)

(assert (=> start!94054 (and (array_inv!25148 _values!955) e!606092)))

(assert (=> start!94054 tp!75856))

(declare-fun array_inv!25149 (array!67510) Bool)

(assert (=> start!94054 (array_inv!25149 _keys!1163)))

(declare-fun b!1063629 () Bool)

(declare-fun e!606091 () Bool)

(assert (=> b!1063629 (= e!606091 tp_is_empty!25285)))

(declare-fun b!1063630 () Bool)

(assert (=> b!1063630 (= e!606090 tp_is_empty!25285)))

(declare-fun b!1063631 () Bool)

(assert (=> b!1063631 (= e!606092 (and e!606091 mapRes!39607))))

(declare-fun condMapEmpty!39607 () Bool)

(declare-fun mapDefault!39607 () ValueCell!11939)

(assert (=> b!1063631 (= condMapEmpty!39607 (= (arr!32461 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11939)) mapDefault!39607)))))

(declare-fun b!1063632 () Bool)

(declare-fun res!710161 () Bool)

(assert (=> b!1063632 (=> (not res!710161) (not e!606089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67510 (_ BitVec 32)) Bool)

(assert (=> b!1063632 (= res!710161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063633 () Bool)

(assert (=> b!1063633 (= e!606089 (not true))))

(declare-datatypes ((tuple2!16134 0))(
  ( (tuple2!16135 (_1!8078 (_ BitVec 64)) (_2!8078 V!38849)) )
))
(declare-datatypes ((List!22684 0))(
  ( (Nil!22681) (Cons!22680 (h!23889 tuple2!16134) (t!31990 List!22684)) )
))
(declare-datatypes ((ListLongMap!14103 0))(
  ( (ListLongMap!14104 (toList!7067 List!22684)) )
))
(declare-fun lt!468709 () ListLongMap!14103)

(declare-fun lt!468708 () ListLongMap!14103)

(assert (=> b!1063633 (= lt!468709 lt!468708)))

(declare-fun zeroValueBefore!47 () V!38849)

(declare-fun minValue!907 () V!38849)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38849)

(declare-datatypes ((Unit!34725 0))(
  ( (Unit!34726) )
))
(declare-fun lt!468710 () Unit!34725)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!667 (array!67510 array!67512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38849 V!38849 V!38849 V!38849 (_ BitVec 32) Int) Unit!34725)

(assert (=> b!1063633 (= lt!468710 (lemmaNoChangeToArrayThenSameMapNoExtras!667 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3673 (array!67510 array!67512 (_ BitVec 32) (_ BitVec 32) V!38849 V!38849 (_ BitVec 32) Int) ListLongMap!14103)

(assert (=> b!1063633 (= lt!468708 (getCurrentListMapNoExtraKeys!3673 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063633 (= lt!468709 (getCurrentListMapNoExtraKeys!3673 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063634 () Bool)

(declare-fun res!710158 () Bool)

(assert (=> b!1063634 (=> (not res!710158) (not e!606089))))

(assert (=> b!1063634 (= res!710158 (and (= (size!32999 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32998 _keys!1163) (size!32999 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39607 () Bool)

(assert (=> mapIsEmpty!39607 mapRes!39607))

(assert (= (and start!94054 res!710160) b!1063634))

(assert (= (and b!1063634 res!710158) b!1063632))

(assert (= (and b!1063632 res!710161) b!1063628))

(assert (= (and b!1063628 res!710159) b!1063633))

(assert (= (and b!1063631 condMapEmpty!39607) mapIsEmpty!39607))

(assert (= (and b!1063631 (not condMapEmpty!39607)) mapNonEmpty!39607))

(get-info :version)

(assert (= (and mapNonEmpty!39607 ((_ is ValueCellFull!11939) mapValue!39607)) b!1063630))

(assert (= (and b!1063631 ((_ is ValueCellFull!11939) mapDefault!39607)) b!1063629))

(assert (= start!94054 b!1063631))

(declare-fun m!981805 () Bool)

(assert (=> mapNonEmpty!39607 m!981805))

(declare-fun m!981807 () Bool)

(assert (=> b!1063628 m!981807))

(declare-fun m!981809 () Bool)

(assert (=> b!1063633 m!981809))

(declare-fun m!981811 () Bool)

(assert (=> b!1063633 m!981811))

(declare-fun m!981813 () Bool)

(assert (=> b!1063633 m!981813))

(declare-fun m!981815 () Bool)

(assert (=> start!94054 m!981815))

(declare-fun m!981817 () Bool)

(assert (=> start!94054 m!981817))

(declare-fun m!981819 () Bool)

(assert (=> start!94054 m!981819))

(declare-fun m!981821 () Bool)

(assert (=> b!1063632 m!981821))

(check-sat b_and!34191 (not mapNonEmpty!39607) (not b!1063633) (not start!94054) (not b!1063628) (not b_next!21475) tp_is_empty!25285 (not b!1063632))
(check-sat b_and!34191 (not b_next!21475))
