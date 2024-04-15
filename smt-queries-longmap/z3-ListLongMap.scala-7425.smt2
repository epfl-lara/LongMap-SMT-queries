; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94380 () Bool)

(assert start!94380)

(declare-fun b_free!21727 () Bool)

(declare-fun b_next!21727 () Bool)

(assert (=> start!94380 (= b_free!21727 (not b_next!21727))))

(declare-fun tp!76624 () Bool)

(declare-fun b_and!34485 () Bool)

(assert (=> start!94380 (= tp!76624 b_and!34485)))

(declare-fun mapNonEmpty!39997 () Bool)

(declare-fun mapRes!39997 () Bool)

(declare-fun tp!76625 () Bool)

(declare-fun e!608630 () Bool)

(assert (=> mapNonEmpty!39997 (= mapRes!39997 (and tp!76625 e!608630))))

(declare-datatypes ((V!39185 0))(
  ( (V!39186 (val!12819 Int)) )
))
(declare-datatypes ((ValueCell!12065 0))(
  ( (ValueCellFull!12065 (v!15432 V!39185)) (EmptyCell!12065) )
))
(declare-fun mapValue!39997 () ValueCell!12065)

(declare-datatypes ((array!68002 0))(
  ( (array!68003 (arr!32702 (Array (_ BitVec 32) ValueCell!12065)) (size!33240 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68002)

(declare-fun mapKey!39997 () (_ BitVec 32))

(declare-fun mapRest!39997 () (Array (_ BitVec 32) ValueCell!12065))

(assert (=> mapNonEmpty!39997 (= (arr!32702 _values!955) (store mapRest!39997 mapKey!39997 mapValue!39997))))

(declare-fun b!1067136 () Bool)

(declare-fun e!608628 () Bool)

(declare-fun e!608629 () Bool)

(assert (=> b!1067136 (= e!608628 (and e!608629 mapRes!39997))))

(declare-fun condMapEmpty!39997 () Bool)

(declare-fun mapDefault!39997 () ValueCell!12065)

(assert (=> b!1067136 (= condMapEmpty!39997 (= (arr!32702 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12065)) mapDefault!39997)))))

(declare-fun b!1067137 () Bool)

(declare-fun e!608631 () Bool)

(assert (=> b!1067137 (= e!608631 (not true))))

(declare-datatypes ((tuple2!16320 0))(
  ( (tuple2!16321 (_1!8171 (_ BitVec 64)) (_2!8171 V!39185)) )
))
(declare-datatypes ((List!22864 0))(
  ( (Nil!22861) (Cons!22860 (h!24069 tuple2!16320) (t!32178 List!22864)) )
))
(declare-datatypes ((ListLongMap!14289 0))(
  ( (ListLongMap!14290 (toList!7160 List!22864)) )
))
(declare-fun lt!471182 () ListLongMap!14289)

(declare-fun lt!471184 () ListLongMap!14289)

(assert (=> b!1067137 (= lt!471182 lt!471184)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39185)

(declare-datatypes ((Unit!34910 0))(
  ( (Unit!34911) )
))
(declare-fun lt!471183 () Unit!34910)

(declare-fun minValue!907 () V!39185)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39185)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68004 0))(
  ( (array!68005 (arr!32703 (Array (_ BitVec 32) (_ BitVec 64))) (size!33241 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68004)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!750 (array!68004 array!68002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39185 V!39185 V!39185 V!39185 (_ BitVec 32) Int) Unit!34910)

(assert (=> b!1067137 (= lt!471183 (lemmaNoChangeToArrayThenSameMapNoExtras!750 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3756 (array!68004 array!68002 (_ BitVec 32) (_ BitVec 32) V!39185 V!39185 (_ BitVec 32) Int) ListLongMap!14289)

(assert (=> b!1067137 (= lt!471184 (getCurrentListMapNoExtraKeys!3756 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067137 (= lt!471182 (getCurrentListMapNoExtraKeys!3756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067138 () Bool)

(declare-fun res!712185 () Bool)

(assert (=> b!1067138 (=> (not res!712185) (not e!608631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68004 (_ BitVec 32)) Bool)

(assert (=> b!1067138 (= res!712185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067139 () Bool)

(declare-fun res!712184 () Bool)

(assert (=> b!1067139 (=> (not res!712184) (not e!608631))))

(assert (=> b!1067139 (= res!712184 (and (= (size!33240 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33241 _keys!1163) (size!33240 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!712186 () Bool)

(assert (=> start!94380 (=> (not res!712186) (not e!608631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94380 (= res!712186 (validMask!0 mask!1515))))

(assert (=> start!94380 e!608631))

(assert (=> start!94380 true))

(declare-fun tp_is_empty!25537 () Bool)

(assert (=> start!94380 tp_is_empty!25537))

(declare-fun array_inv!25316 (array!68002) Bool)

(assert (=> start!94380 (and (array_inv!25316 _values!955) e!608628)))

(assert (=> start!94380 tp!76624))

(declare-fun array_inv!25317 (array!68004) Bool)

(assert (=> start!94380 (array_inv!25317 _keys!1163)))

(declare-fun mapIsEmpty!39997 () Bool)

(assert (=> mapIsEmpty!39997 mapRes!39997))

(declare-fun b!1067140 () Bool)

(declare-fun res!712187 () Bool)

(assert (=> b!1067140 (=> (not res!712187) (not e!608631))))

(declare-datatypes ((List!22865 0))(
  ( (Nil!22862) (Cons!22861 (h!24070 (_ BitVec 64)) (t!32179 List!22865)) )
))
(declare-fun arrayNoDuplicates!0 (array!68004 (_ BitVec 32) List!22865) Bool)

(assert (=> b!1067140 (= res!712187 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22862))))

(declare-fun b!1067141 () Bool)

(assert (=> b!1067141 (= e!608630 tp_is_empty!25537)))

(declare-fun b!1067142 () Bool)

(assert (=> b!1067142 (= e!608629 tp_is_empty!25537)))

(assert (= (and start!94380 res!712186) b!1067139))

(assert (= (and b!1067139 res!712184) b!1067138))

(assert (= (and b!1067138 res!712185) b!1067140))

(assert (= (and b!1067140 res!712187) b!1067137))

(assert (= (and b!1067136 condMapEmpty!39997) mapIsEmpty!39997))

(assert (= (and b!1067136 (not condMapEmpty!39997)) mapNonEmpty!39997))

(get-info :version)

(assert (= (and mapNonEmpty!39997 ((_ is ValueCellFull!12065) mapValue!39997)) b!1067141))

(assert (= (and b!1067136 ((_ is ValueCellFull!12065) mapDefault!39997)) b!1067142))

(assert (= start!94380 b!1067136))

(declare-fun m!985345 () Bool)

(assert (=> b!1067138 m!985345))

(declare-fun m!985347 () Bool)

(assert (=> b!1067137 m!985347))

(declare-fun m!985349 () Bool)

(assert (=> b!1067137 m!985349))

(declare-fun m!985351 () Bool)

(assert (=> b!1067137 m!985351))

(declare-fun m!985353 () Bool)

(assert (=> start!94380 m!985353))

(declare-fun m!985355 () Bool)

(assert (=> start!94380 m!985355))

(declare-fun m!985357 () Bool)

(assert (=> start!94380 m!985357))

(declare-fun m!985359 () Bool)

(assert (=> b!1067140 m!985359))

(declare-fun m!985361 () Bool)

(assert (=> mapNonEmpty!39997 m!985361))

(check-sat (not start!94380) b_and!34485 (not b!1067138) (not b_next!21727) (not mapNonEmpty!39997) (not b!1067140) tp_is_empty!25537 (not b!1067137))
(check-sat b_and!34485 (not b_next!21727))
