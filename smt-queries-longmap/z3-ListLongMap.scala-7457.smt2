; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94644 () Bool)

(assert start!94644)

(declare-fun b_free!21919 () Bool)

(declare-fun b_next!21919 () Bool)

(assert (=> start!94644 (= b_free!21919 (not b_next!21919))))

(declare-fun tp!77212 () Bool)

(declare-fun b_and!34713 () Bool)

(assert (=> start!94644 (= tp!77212 b_and!34713)))

(declare-fun b!1069980 () Bool)

(declare-fun e!610725 () Bool)

(declare-fun tp_is_empty!25729 () Bool)

(assert (=> b!1069980 (= e!610725 tp_is_empty!25729)))

(declare-fun b!1069981 () Bool)

(declare-fun e!610722 () Bool)

(assert (=> b!1069981 (= e!610722 tp_is_empty!25729)))

(declare-fun res!713866 () Bool)

(declare-fun e!610723 () Bool)

(assert (=> start!94644 (=> (not res!713866) (not e!610723))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94644 (= res!713866 (validMask!0 mask!1515))))

(assert (=> start!94644 e!610723))

(assert (=> start!94644 true))

(assert (=> start!94644 tp_is_empty!25729))

(declare-datatypes ((V!39441 0))(
  ( (V!39442 (val!12915 Int)) )
))
(declare-datatypes ((ValueCell!12161 0))(
  ( (ValueCellFull!12161 (v!15530 V!39441)) (EmptyCell!12161) )
))
(declare-datatypes ((array!68374 0))(
  ( (array!68375 (arr!32884 (Array (_ BitVec 32) ValueCell!12161)) (size!33422 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68374)

(declare-fun e!610724 () Bool)

(declare-fun array_inv!25444 (array!68374) Bool)

(assert (=> start!94644 (and (array_inv!25444 _values!955) e!610724)))

(assert (=> start!94644 tp!77212))

(declare-datatypes ((array!68376 0))(
  ( (array!68377 (arr!32885 (Array (_ BitVec 32) (_ BitVec 64))) (size!33423 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68376)

(declare-fun array_inv!25445 (array!68376) Bool)

(assert (=> start!94644 (array_inv!25445 _keys!1163)))

(declare-fun b!1069982 () Bool)

(declare-fun e!610721 () Bool)

(assert (=> b!1069982 (= e!610721 true)))

(declare-fun zeroValueBefore!47 () V!39441)

(declare-datatypes ((tuple2!16476 0))(
  ( (tuple2!16477 (_1!8249 (_ BitVec 64)) (_2!8249 V!39441)) )
))
(declare-datatypes ((List!23004 0))(
  ( (Nil!23001) (Cons!23000 (h!24209 tuple2!16476) (t!32326 List!23004)) )
))
(declare-datatypes ((ListLongMap!14445 0))(
  ( (ListLongMap!14446 (toList!7238 List!23004)) )
))
(declare-fun lt!472719 () ListLongMap!14445)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39441)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4054 (array!68376 array!68374 (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 (_ BitVec 32) Int) ListLongMap!14445)

(assert (=> b!1069982 (= lt!472719 (getCurrentListMap!4054 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069983 () Bool)

(declare-fun res!713865 () Bool)

(assert (=> b!1069983 (=> (not res!713865) (not e!610723))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1069983 (= res!713865 (and (= (size!33422 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33423 _keys!1163) (size!33422 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069984 () Bool)

(declare-fun mapRes!40297 () Bool)

(assert (=> b!1069984 (= e!610724 (and e!610722 mapRes!40297))))

(declare-fun condMapEmpty!40297 () Bool)

(declare-fun mapDefault!40297 () ValueCell!12161)

(assert (=> b!1069984 (= condMapEmpty!40297 (= (arr!32884 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12161)) mapDefault!40297)))))

(declare-fun mapIsEmpty!40297 () Bool)

(assert (=> mapIsEmpty!40297 mapRes!40297))

(declare-fun b!1069985 () Bool)

(assert (=> b!1069985 (= e!610723 (not e!610721))))

(declare-fun res!713867 () Bool)

(assert (=> b!1069985 (=> res!713867 e!610721)))

(assert (=> b!1069985 (= res!713867 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472718 () ListLongMap!14445)

(declare-fun lt!472720 () ListLongMap!14445)

(assert (=> b!1069985 (= lt!472718 lt!472720)))

(declare-fun zeroValueAfter!47 () V!39441)

(declare-datatypes ((Unit!35062 0))(
  ( (Unit!35063) )
))
(declare-fun lt!472721 () Unit!35062)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!820 (array!68376 array!68374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 V!39441 V!39441 (_ BitVec 32) Int) Unit!35062)

(assert (=> b!1069985 (= lt!472721 (lemmaNoChangeToArrayThenSameMapNoExtras!820 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3826 (array!68376 array!68374 (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 (_ BitVec 32) Int) ListLongMap!14445)

(assert (=> b!1069985 (= lt!472720 (getCurrentListMapNoExtraKeys!3826 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069985 (= lt!472718 (getCurrentListMapNoExtraKeys!3826 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069986 () Bool)

(declare-fun res!713864 () Bool)

(assert (=> b!1069986 (=> (not res!713864) (not e!610723))))

(declare-datatypes ((List!23005 0))(
  ( (Nil!23002) (Cons!23001 (h!24210 (_ BitVec 64)) (t!32327 List!23005)) )
))
(declare-fun arrayNoDuplicates!0 (array!68376 (_ BitVec 32) List!23005) Bool)

(assert (=> b!1069986 (= res!713864 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23002))))

(declare-fun mapNonEmpty!40297 () Bool)

(declare-fun tp!77213 () Bool)

(assert (=> mapNonEmpty!40297 (= mapRes!40297 (and tp!77213 e!610725))))

(declare-fun mapValue!40297 () ValueCell!12161)

(declare-fun mapRest!40297 () (Array (_ BitVec 32) ValueCell!12161))

(declare-fun mapKey!40297 () (_ BitVec 32))

(assert (=> mapNonEmpty!40297 (= (arr!32884 _values!955) (store mapRest!40297 mapKey!40297 mapValue!40297))))

(declare-fun b!1069987 () Bool)

(declare-fun res!713868 () Bool)

(assert (=> b!1069987 (=> (not res!713868) (not e!610723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68376 (_ BitVec 32)) Bool)

(assert (=> b!1069987 (= res!713868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94644 res!713866) b!1069983))

(assert (= (and b!1069983 res!713865) b!1069987))

(assert (= (and b!1069987 res!713868) b!1069986))

(assert (= (and b!1069986 res!713864) b!1069985))

(assert (= (and b!1069985 (not res!713867)) b!1069982))

(assert (= (and b!1069984 condMapEmpty!40297) mapIsEmpty!40297))

(assert (= (and b!1069984 (not condMapEmpty!40297)) mapNonEmpty!40297))

(get-info :version)

(assert (= (and mapNonEmpty!40297 ((_ is ValueCellFull!12161) mapValue!40297)) b!1069980))

(assert (= (and b!1069984 ((_ is ValueCellFull!12161) mapDefault!40297)) b!1069981))

(assert (= start!94644 b!1069984))

(declare-fun m!987907 () Bool)

(assert (=> mapNonEmpty!40297 m!987907))

(declare-fun m!987909 () Bool)

(assert (=> b!1069982 m!987909))

(declare-fun m!987911 () Bool)

(assert (=> b!1069986 m!987911))

(declare-fun m!987913 () Bool)

(assert (=> b!1069985 m!987913))

(declare-fun m!987915 () Bool)

(assert (=> b!1069985 m!987915))

(declare-fun m!987917 () Bool)

(assert (=> b!1069985 m!987917))

(declare-fun m!987919 () Bool)

(assert (=> start!94644 m!987919))

(declare-fun m!987921 () Bool)

(assert (=> start!94644 m!987921))

(declare-fun m!987923 () Bool)

(assert (=> start!94644 m!987923))

(declare-fun m!987925 () Bool)

(assert (=> b!1069987 m!987925))

(check-sat (not b_next!21919) (not mapNonEmpty!40297) b_and!34713 (not b!1069987) (not b!1069982) (not b!1069985) (not b!1069986) tp_is_empty!25729 (not start!94644))
(check-sat b_and!34713 (not b_next!21919))
