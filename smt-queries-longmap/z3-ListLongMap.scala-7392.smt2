; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94130 () Bool)

(assert start!94130)

(declare-fun b_free!21531 () Bool)

(declare-fun b_next!21531 () Bool)

(assert (=> start!94130 (= b_free!21531 (not b_next!21531))))

(declare-fun tp!76028 () Bool)

(declare-fun b_and!34281 () Bool)

(assert (=> start!94130 (= tp!76028 b_and!34281)))

(declare-fun res!710608 () Bool)

(declare-fun e!606672 () Bool)

(assert (=> start!94130 (=> (not res!710608) (not e!606672))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94130 (= res!710608 (validMask!0 mask!1515))))

(assert (=> start!94130 e!606672))

(assert (=> start!94130 true))

(declare-fun tp_is_empty!25341 () Bool)

(assert (=> start!94130 tp_is_empty!25341))

(declare-datatypes ((V!38923 0))(
  ( (V!38924 (val!12721 Int)) )
))
(declare-datatypes ((ValueCell!11967 0))(
  ( (ValueCellFull!11967 (v!15333 V!38923)) (EmptyCell!11967) )
))
(declare-datatypes ((array!67671 0))(
  ( (array!67672 (arr!32539 (Array (_ BitVec 32) ValueCell!11967)) (size!33075 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67671)

(declare-fun e!606674 () Bool)

(declare-fun array_inv!25198 (array!67671) Bool)

(assert (=> start!94130 (and (array_inv!25198 _values!955) e!606674)))

(assert (=> start!94130 tp!76028))

(declare-datatypes ((array!67673 0))(
  ( (array!67674 (arr!32540 (Array (_ BitVec 32) (_ BitVec 64))) (size!33076 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67673)

(declare-fun array_inv!25199 (array!67673) Bool)

(assert (=> start!94130 (array_inv!25199 _keys!1163)))

(declare-fun b!1064468 () Bool)

(declare-fun e!606671 () Bool)

(assert (=> b!1064468 (= e!606671 tp_is_empty!25341)))

(declare-fun b!1064469 () Bool)

(declare-fun e!606673 () Bool)

(assert (=> b!1064469 (= e!606672 (not e!606673))))

(declare-fun res!710610 () Bool)

(assert (=> b!1064469 (=> res!710610 e!606673)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1064469 (= res!710610 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16108 0))(
  ( (tuple2!16109 (_1!8065 (_ BitVec 64)) (_2!8065 V!38923)) )
))
(declare-datatypes ((List!22682 0))(
  ( (Nil!22679) (Cons!22678 (h!23887 tuple2!16108) (t!31999 List!22682)) )
))
(declare-datatypes ((ListLongMap!14077 0))(
  ( (ListLongMap!14078 (toList!7054 List!22682)) )
))
(declare-fun lt!469214 () ListLongMap!14077)

(declare-fun lt!469217 () ListLongMap!14077)

(assert (=> b!1064469 (= lt!469214 lt!469217)))

(declare-fun zeroValueBefore!47 () V!38923)

(declare-datatypes ((Unit!34908 0))(
  ( (Unit!34909) )
))
(declare-fun lt!469216 () Unit!34908)

(declare-fun minValue!907 () V!38923)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38923)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!683 (array!67673 array!67671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38923 V!38923 V!38923 V!38923 (_ BitVec 32) Int) Unit!34908)

(assert (=> b!1064469 (= lt!469216 (lemmaNoChangeToArrayThenSameMapNoExtras!683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3646 (array!67673 array!67671 (_ BitVec 32) (_ BitVec 32) V!38923 V!38923 (_ BitVec 32) Int) ListLongMap!14077)

(assert (=> b!1064469 (= lt!469217 (getCurrentListMapNoExtraKeys!3646 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064469 (= lt!469214 (getCurrentListMapNoExtraKeys!3646 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39694 () Bool)

(declare-fun mapRes!39694 () Bool)

(assert (=> mapIsEmpty!39694 mapRes!39694))

(declare-fun b!1064470 () Bool)

(declare-fun e!606675 () Bool)

(assert (=> b!1064470 (= e!606675 tp_is_empty!25341)))

(declare-fun mapNonEmpty!39694 () Bool)

(declare-fun tp!76027 () Bool)

(assert (=> mapNonEmpty!39694 (= mapRes!39694 (and tp!76027 e!606671))))

(declare-fun mapValue!39694 () ValueCell!11967)

(declare-fun mapKey!39694 () (_ BitVec 32))

(declare-fun mapRest!39694 () (Array (_ BitVec 32) ValueCell!11967))

(assert (=> mapNonEmpty!39694 (= (arr!32539 _values!955) (store mapRest!39694 mapKey!39694 mapValue!39694))))

(declare-fun b!1064471 () Bool)

(assert (=> b!1064471 (= e!606674 (and e!606675 mapRes!39694))))

(declare-fun condMapEmpty!39694 () Bool)

(declare-fun mapDefault!39694 () ValueCell!11967)

(assert (=> b!1064471 (= condMapEmpty!39694 (= (arr!32539 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11967)) mapDefault!39694)))))

(declare-fun b!1064472 () Bool)

(declare-fun res!710612 () Bool)

(assert (=> b!1064472 (=> (not res!710612) (not e!606672))))

(declare-datatypes ((List!22683 0))(
  ( (Nil!22680) (Cons!22679 (h!23888 (_ BitVec 64)) (t!32000 List!22683)) )
))
(declare-fun arrayNoDuplicates!0 (array!67673 (_ BitVec 32) List!22683) Bool)

(assert (=> b!1064472 (= res!710612 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22680))))

(declare-fun b!1064473 () Bool)

(declare-fun res!710611 () Bool)

(assert (=> b!1064473 (=> (not res!710611) (not e!606672))))

(assert (=> b!1064473 (= res!710611 (and (= (size!33075 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33076 _keys!1163) (size!33075 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064474 () Bool)

(assert (=> b!1064474 (= e!606673 true)))

(declare-fun lt!469215 () ListLongMap!14077)

(declare-fun getCurrentListMap!4016 (array!67673 array!67671 (_ BitVec 32) (_ BitVec 32) V!38923 V!38923 (_ BitVec 32) Int) ListLongMap!14077)

(assert (=> b!1064474 (= lt!469215 (getCurrentListMap!4016 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064475 () Bool)

(declare-fun res!710609 () Bool)

(assert (=> b!1064475 (=> (not res!710609) (not e!606672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67673 (_ BitVec 32)) Bool)

(assert (=> b!1064475 (= res!710609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94130 res!710608) b!1064473))

(assert (= (and b!1064473 res!710611) b!1064475))

(assert (= (and b!1064475 res!710609) b!1064472))

(assert (= (and b!1064472 res!710612) b!1064469))

(assert (= (and b!1064469 (not res!710610)) b!1064474))

(assert (= (and b!1064471 condMapEmpty!39694) mapIsEmpty!39694))

(assert (= (and b!1064471 (not condMapEmpty!39694)) mapNonEmpty!39694))

(get-info :version)

(assert (= (and mapNonEmpty!39694 ((_ is ValueCellFull!11967) mapValue!39694)) b!1064468))

(assert (= (and b!1064471 ((_ is ValueCellFull!11967) mapDefault!39694)) b!1064470))

(assert (= start!94130 b!1064471))

(declare-fun m!983009 () Bool)

(assert (=> b!1064469 m!983009))

(declare-fun m!983011 () Bool)

(assert (=> b!1064469 m!983011))

(declare-fun m!983013 () Bool)

(assert (=> b!1064469 m!983013))

(declare-fun m!983015 () Bool)

(assert (=> b!1064475 m!983015))

(declare-fun m!983017 () Bool)

(assert (=> mapNonEmpty!39694 m!983017))

(declare-fun m!983019 () Bool)

(assert (=> b!1064474 m!983019))

(declare-fun m!983021 () Bool)

(assert (=> start!94130 m!983021))

(declare-fun m!983023 () Bool)

(assert (=> start!94130 m!983023))

(declare-fun m!983025 () Bool)

(assert (=> start!94130 m!983025))

(declare-fun m!983027 () Bool)

(assert (=> b!1064472 m!983027))

(check-sat tp_is_empty!25341 (not b!1064472) (not b_next!21531) b_and!34281 (not b!1064474) (not b!1064475) (not b!1064469) (not mapNonEmpty!39694) (not start!94130))
(check-sat b_and!34281 (not b_next!21531))
