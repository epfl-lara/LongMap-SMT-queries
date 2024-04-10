; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94578 () Bool)

(assert start!94578)

(declare-fun b_free!21861 () Bool)

(declare-fun b_next!21861 () Bool)

(assert (=> start!94578 (= b_free!21861 (not b_next!21861))))

(declare-fun tp!77036 () Bool)

(declare-fun b_and!34673 () Bool)

(assert (=> start!94578 (= tp!77036 b_and!34673)))

(declare-fun b!1069428 () Bool)

(declare-fun res!713545 () Bool)

(declare-fun e!610313 () Bool)

(assert (=> b!1069428 (=> (not res!713545) (not e!610313))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39363 0))(
  ( (V!39364 (val!12886 Int)) )
))
(declare-datatypes ((ValueCell!12132 0))(
  ( (ValueCellFull!12132 (v!15502 V!39363)) (EmptyCell!12132) )
))
(declare-datatypes ((array!68321 0))(
  ( (array!68322 (arr!32858 (Array (_ BitVec 32) ValueCell!12132)) (size!33394 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68321)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68323 0))(
  ( (array!68324 (arr!32859 (Array (_ BitVec 32) (_ BitVec 64))) (size!33395 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68323)

(assert (=> b!1069428 (= res!713545 (and (= (size!33394 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33395 _keys!1163) (size!33394 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40207 () Bool)

(declare-fun mapRes!40207 () Bool)

(declare-fun tp!77035 () Bool)

(declare-fun e!610314 () Bool)

(assert (=> mapNonEmpty!40207 (= mapRes!40207 (and tp!77035 e!610314))))

(declare-fun mapValue!40207 () ValueCell!12132)

(declare-fun mapRest!40207 () (Array (_ BitVec 32) ValueCell!12132))

(declare-fun mapKey!40207 () (_ BitVec 32))

(assert (=> mapNonEmpty!40207 (= (arr!32858 _values!955) (store mapRest!40207 mapKey!40207 mapValue!40207))))

(declare-fun res!713546 () Bool)

(assert (=> start!94578 (=> (not res!713546) (not e!610313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94578 (= res!713546 (validMask!0 mask!1515))))

(assert (=> start!94578 e!610313))

(assert (=> start!94578 true))

(declare-fun tp_is_empty!25671 () Bool)

(assert (=> start!94578 tp_is_empty!25671))

(declare-fun e!610316 () Bool)

(declare-fun array_inv!25430 (array!68321) Bool)

(assert (=> start!94578 (and (array_inv!25430 _values!955) e!610316)))

(assert (=> start!94578 tp!77036))

(declare-fun array_inv!25431 (array!68323) Bool)

(assert (=> start!94578 (array_inv!25431 _keys!1163)))

(declare-fun b!1069429 () Bool)

(declare-fun e!610317 () Bool)

(assert (=> b!1069429 (= e!610316 (and e!610317 mapRes!40207))))

(declare-fun condMapEmpty!40207 () Bool)

(declare-fun mapDefault!40207 () ValueCell!12132)

(assert (=> b!1069429 (= condMapEmpty!40207 (= (arr!32858 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12132)) mapDefault!40207)))))

(declare-fun b!1069430 () Bool)

(assert (=> b!1069430 (= e!610313 (not true))))

(declare-datatypes ((tuple2!16380 0))(
  ( (tuple2!16381 (_1!8201 (_ BitVec 64)) (_2!8201 V!39363)) )
))
(declare-datatypes ((List!22924 0))(
  ( (Nil!22921) (Cons!22920 (h!24129 tuple2!16380) (t!32253 List!22924)) )
))
(declare-datatypes ((ListLongMap!14349 0))(
  ( (ListLongMap!14350 (toList!7190 List!22924)) )
))
(declare-fun lt!472607 () ListLongMap!14349)

(declare-fun lt!472606 () ListLongMap!14349)

(assert (=> b!1069430 (= lt!472607 lt!472606)))

(declare-fun zeroValueBefore!47 () V!39363)

(declare-fun minValue!907 () V!39363)

(declare-datatypes ((Unit!35179 0))(
  ( (Unit!35180) )
))
(declare-fun lt!472608 () Unit!35179)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39363)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!803 (array!68323 array!68321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39363 V!39363 V!39363 V!39363 (_ BitVec 32) Int) Unit!35179)

(assert (=> b!1069430 (= lt!472608 (lemmaNoChangeToArrayThenSameMapNoExtras!803 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3766 (array!68323 array!68321 (_ BitVec 32) (_ BitVec 32) V!39363 V!39363 (_ BitVec 32) Int) ListLongMap!14349)

(assert (=> b!1069430 (= lt!472606 (getCurrentListMapNoExtraKeys!3766 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069430 (= lt!472607 (getCurrentListMapNoExtraKeys!3766 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40207 () Bool)

(assert (=> mapIsEmpty!40207 mapRes!40207))

(declare-fun b!1069431 () Bool)

(declare-fun res!713544 () Bool)

(assert (=> b!1069431 (=> (not res!713544) (not e!610313))))

(declare-datatypes ((List!22925 0))(
  ( (Nil!22922) (Cons!22921 (h!24130 (_ BitVec 64)) (t!32254 List!22925)) )
))
(declare-fun arrayNoDuplicates!0 (array!68323 (_ BitVec 32) List!22925) Bool)

(assert (=> b!1069431 (= res!713544 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22922))))

(declare-fun b!1069432 () Bool)

(assert (=> b!1069432 (= e!610314 tp_is_empty!25671)))

(declare-fun b!1069433 () Bool)

(assert (=> b!1069433 (= e!610317 tp_is_empty!25671)))

(declare-fun b!1069434 () Bool)

(declare-fun res!713543 () Bool)

(assert (=> b!1069434 (=> (not res!713543) (not e!610313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68323 (_ BitVec 32)) Bool)

(assert (=> b!1069434 (= res!713543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94578 res!713546) b!1069428))

(assert (= (and b!1069428 res!713545) b!1069434))

(assert (= (and b!1069434 res!713543) b!1069431))

(assert (= (and b!1069431 res!713544) b!1069430))

(assert (= (and b!1069429 condMapEmpty!40207) mapIsEmpty!40207))

(assert (= (and b!1069429 (not condMapEmpty!40207)) mapNonEmpty!40207))

(get-info :version)

(assert (= (and mapNonEmpty!40207 ((_ is ValueCellFull!12132) mapValue!40207)) b!1069432))

(assert (= (and b!1069429 ((_ is ValueCellFull!12132) mapDefault!40207)) b!1069433))

(assert (= start!94578 b!1069429))

(declare-fun m!987939 () Bool)

(assert (=> b!1069434 m!987939))

(declare-fun m!987941 () Bool)

(assert (=> start!94578 m!987941))

(declare-fun m!987943 () Bool)

(assert (=> start!94578 m!987943))

(declare-fun m!987945 () Bool)

(assert (=> start!94578 m!987945))

(declare-fun m!987947 () Bool)

(assert (=> b!1069431 m!987947))

(declare-fun m!987949 () Bool)

(assert (=> b!1069430 m!987949))

(declare-fun m!987951 () Bool)

(assert (=> b!1069430 m!987951))

(declare-fun m!987953 () Bool)

(assert (=> b!1069430 m!987953))

(declare-fun m!987955 () Bool)

(assert (=> mapNonEmpty!40207 m!987955))

(check-sat (not b_next!21861) (not b!1069431) (not b!1069434) b_and!34673 (not b!1069430) (not start!94578) tp_is_empty!25671 (not mapNonEmpty!40207))
(check-sat b_and!34673 (not b_next!21861))
