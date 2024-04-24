; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94842 () Bool)

(assert start!94842)

(declare-fun b_free!21889 () Bool)

(declare-fun b_next!21889 () Bool)

(assert (=> start!94842 (= b_free!21889 (not b_next!21889))))

(declare-fun tp!77120 () Bool)

(declare-fun b_and!34711 () Bool)

(assert (=> start!94842 (= tp!77120 b_and!34711)))

(declare-fun b!1071049 () Bool)

(declare-fun e!611378 () Bool)

(declare-fun e!611380 () Bool)

(declare-fun mapRes!40249 () Bool)

(assert (=> b!1071049 (= e!611378 (and e!611380 mapRes!40249))))

(declare-fun condMapEmpty!40249 () Bool)

(declare-datatypes ((V!39401 0))(
  ( (V!39402 (val!12900 Int)) )
))
(declare-datatypes ((ValueCell!12146 0))(
  ( (ValueCellFull!12146 (v!15512 V!39401)) (EmptyCell!12146) )
))
(declare-datatypes ((array!68411 0))(
  ( (array!68412 (arr!32897 (Array (_ BitVec 32) ValueCell!12146)) (size!33434 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68411)

(declare-fun mapDefault!40249 () ValueCell!12146)

(assert (=> b!1071049 (= condMapEmpty!40249 (= (arr!32897 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12146)) mapDefault!40249)))))

(declare-fun mapNonEmpty!40249 () Bool)

(declare-fun tp!77119 () Bool)

(declare-fun e!611382 () Bool)

(assert (=> mapNonEmpty!40249 (= mapRes!40249 (and tp!77119 e!611382))))

(declare-fun mapKey!40249 () (_ BitVec 32))

(declare-fun mapValue!40249 () ValueCell!12146)

(declare-fun mapRest!40249 () (Array (_ BitVec 32) ValueCell!12146))

(assert (=> mapNonEmpty!40249 (= (arr!32897 _values!955) (store mapRest!40249 mapKey!40249 mapValue!40249))))

(declare-fun b!1071050 () Bool)

(declare-fun res!714234 () Bool)

(declare-fun e!611379 () Bool)

(assert (=> b!1071050 (=> (not res!714234) (not e!611379))))

(declare-datatypes ((array!68413 0))(
  ( (array!68414 (arr!32898 (Array (_ BitVec 32) (_ BitVec 64))) (size!33435 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68413)

(declare-datatypes ((List!22933 0))(
  ( (Nil!22930) (Cons!22929 (h!24147 (_ BitVec 64)) (t!32254 List!22933)) )
))
(declare-fun arrayNoDuplicates!0 (array!68413 (_ BitVec 32) List!22933) Bool)

(assert (=> b!1071050 (= res!714234 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22930))))

(declare-fun b!1071051 () Bool)

(assert (=> b!1071051 (= e!611379 (not true))))

(declare-datatypes ((tuple2!16366 0))(
  ( (tuple2!16367 (_1!8194 (_ BitVec 64)) (_2!8194 V!39401)) )
))
(declare-datatypes ((List!22934 0))(
  ( (Nil!22931) (Cons!22930 (h!24148 tuple2!16366) (t!32255 List!22934)) )
))
(declare-datatypes ((ListLongMap!14343 0))(
  ( (ListLongMap!14344 (toList!7187 List!22934)) )
))
(declare-fun lt!473248 () ListLongMap!14343)

(declare-fun lt!473247 () ListLongMap!14343)

(assert (=> b!1071051 (= lt!473248 lt!473247)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((Unit!35168 0))(
  ( (Unit!35169) )
))
(declare-fun lt!473249 () Unit!35168)

(declare-fun minValue!907 () V!39401)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39401)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39401)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!802 (array!68413 array!68411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39401 V!39401 V!39401 V!39401 (_ BitVec 32) Int) Unit!35168)

(assert (=> b!1071051 (= lt!473249 (lemmaNoChangeToArrayThenSameMapNoExtras!802 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3799 (array!68413 array!68411 (_ BitVec 32) (_ BitVec 32) V!39401 V!39401 (_ BitVec 32) Int) ListLongMap!14343)

(assert (=> b!1071051 (= lt!473247 (getCurrentListMapNoExtraKeys!3799 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071051 (= lt!473248 (getCurrentListMapNoExtraKeys!3799 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071052 () Bool)

(declare-fun tp_is_empty!25699 () Bool)

(assert (=> b!1071052 (= e!611380 tp_is_empty!25699)))

(declare-fun b!1071053 () Bool)

(declare-fun res!714233 () Bool)

(assert (=> b!1071053 (=> (not res!714233) (not e!611379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68413 (_ BitVec 32)) Bool)

(assert (=> b!1071053 (= res!714233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071054 () Bool)

(assert (=> b!1071054 (= e!611382 tp_is_empty!25699)))

(declare-fun b!1071055 () Bool)

(declare-fun res!714235 () Bool)

(assert (=> b!1071055 (=> (not res!714235) (not e!611379))))

(assert (=> b!1071055 (= res!714235 (and (= (size!33434 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33435 _keys!1163) (size!33434 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40249 () Bool)

(assert (=> mapIsEmpty!40249 mapRes!40249))

(declare-fun res!714236 () Bool)

(assert (=> start!94842 (=> (not res!714236) (not e!611379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94842 (= res!714236 (validMask!0 mask!1515))))

(assert (=> start!94842 e!611379))

(assert (=> start!94842 true))

(assert (=> start!94842 tp_is_empty!25699))

(declare-fun array_inv!25478 (array!68411) Bool)

(assert (=> start!94842 (and (array_inv!25478 _values!955) e!611378)))

(assert (=> start!94842 tp!77120))

(declare-fun array_inv!25479 (array!68413) Bool)

(assert (=> start!94842 (array_inv!25479 _keys!1163)))

(assert (= (and start!94842 res!714236) b!1071055))

(assert (= (and b!1071055 res!714235) b!1071053))

(assert (= (and b!1071053 res!714233) b!1071050))

(assert (= (and b!1071050 res!714234) b!1071051))

(assert (= (and b!1071049 condMapEmpty!40249) mapIsEmpty!40249))

(assert (= (and b!1071049 (not condMapEmpty!40249)) mapNonEmpty!40249))

(get-info :version)

(assert (= (and mapNonEmpty!40249 ((_ is ValueCellFull!12146) mapValue!40249)) b!1071054))

(assert (= (and b!1071049 ((_ is ValueCellFull!12146) mapDefault!40249)) b!1071052))

(assert (= start!94842 b!1071049))

(declare-fun m!989863 () Bool)

(assert (=> b!1071051 m!989863))

(declare-fun m!989865 () Bool)

(assert (=> b!1071051 m!989865))

(declare-fun m!989867 () Bool)

(assert (=> b!1071051 m!989867))

(declare-fun m!989869 () Bool)

(assert (=> start!94842 m!989869))

(declare-fun m!989871 () Bool)

(assert (=> start!94842 m!989871))

(declare-fun m!989873 () Bool)

(assert (=> start!94842 m!989873))

(declare-fun m!989875 () Bool)

(assert (=> b!1071050 m!989875))

(declare-fun m!989877 () Bool)

(assert (=> mapNonEmpty!40249 m!989877))

(declare-fun m!989879 () Bool)

(assert (=> b!1071053 m!989879))

(check-sat (not b!1071050) (not b_next!21889) (not b!1071053) (not start!94842) tp_is_empty!25699 (not b!1071051) b_and!34711 (not mapNonEmpty!40249))
(check-sat b_and!34711 (not b_next!21889))
