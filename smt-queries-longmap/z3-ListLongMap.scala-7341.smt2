; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93732 () Bool)

(assert start!93732)

(declare-fun b_free!21223 () Bool)

(declare-fun b_next!21223 () Bool)

(assert (=> start!93732 (= b_free!21223 (not b_next!21223))))

(declare-fun tp!75088 () Bool)

(declare-fun b_and!33907 () Bool)

(assert (=> start!93732 (= tp!75088 b_and!33907)))

(declare-fun b!1060177 () Bool)

(declare-fun res!708134 () Bool)

(declare-fun e!603563 () Bool)

(assert (=> b!1060177 (=> (not res!708134) (not e!603563))))

(declare-datatypes ((array!67024 0))(
  ( (array!67025 (arr!32221 (Array (_ BitVec 32) (_ BitVec 64))) (size!32759 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67024)

(declare-datatypes ((List!22497 0))(
  ( (Nil!22494) (Cons!22493 (h!23702 (_ BitVec 64)) (t!31795 List!22497)) )
))
(declare-fun arrayNoDuplicates!0 (array!67024 (_ BitVec 32) List!22497) Bool)

(assert (=> b!1060177 (= res!708134 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22494))))

(declare-fun b!1060178 () Bool)

(assert (=> b!1060178 (= e!603563 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38513 0))(
  ( (V!38514 (val!12567 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38513)

(declare-datatypes ((ValueCell!11813 0))(
  ( (ValueCellFull!11813 (v!15176 V!38513)) (EmptyCell!11813) )
))
(declare-datatypes ((array!67026 0))(
  ( (array!67027 (arr!32222 (Array (_ BitVec 32) ValueCell!11813)) (size!32760 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67026)

(declare-datatypes ((tuple2!15942 0))(
  ( (tuple2!15943 (_1!7982 (_ BitVec 64)) (_2!7982 V!38513)) )
))
(declare-datatypes ((List!22498 0))(
  ( (Nil!22495) (Cons!22494 (h!23703 tuple2!15942) (t!31796 List!22498)) )
))
(declare-datatypes ((ListLongMap!13911 0))(
  ( (ListLongMap!13912 (toList!6971 List!22498)) )
))
(declare-fun lt!467054 () ListLongMap!13911)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38513)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3588 (array!67024 array!67026 (_ BitVec 32) (_ BitVec 32) V!38513 V!38513 (_ BitVec 32) Int) ListLongMap!13911)

(assert (=> b!1060178 (= lt!467054 (getCurrentListMapNoExtraKeys!3588 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060179 () Bool)

(declare-fun res!708133 () Bool)

(assert (=> b!1060179 (=> (not res!708133) (not e!603563))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060179 (= res!708133 (and (= (size!32760 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32759 _keys!1163) (size!32760 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060180 () Bool)

(declare-fun res!708135 () Bool)

(assert (=> b!1060180 (=> (not res!708135) (not e!603563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67024 (_ BitVec 32)) Bool)

(assert (=> b!1060180 (= res!708135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060181 () Bool)

(declare-fun e!603565 () Bool)

(declare-fun tp_is_empty!25033 () Bool)

(assert (=> b!1060181 (= e!603565 tp_is_empty!25033)))

(declare-fun mapNonEmpty!39217 () Bool)

(declare-fun mapRes!39217 () Bool)

(declare-fun tp!75089 () Bool)

(assert (=> mapNonEmpty!39217 (= mapRes!39217 (and tp!75089 e!603565))))

(declare-fun mapValue!39217 () ValueCell!11813)

(declare-fun mapRest!39217 () (Array (_ BitVec 32) ValueCell!11813))

(declare-fun mapKey!39217 () (_ BitVec 32))

(assert (=> mapNonEmpty!39217 (= (arr!32222 _values!955) (store mapRest!39217 mapKey!39217 mapValue!39217))))

(declare-fun mapIsEmpty!39217 () Bool)

(assert (=> mapIsEmpty!39217 mapRes!39217))

(declare-fun b!1060183 () Bool)

(declare-fun e!603564 () Bool)

(assert (=> b!1060183 (= e!603564 tp_is_empty!25033)))

(declare-fun res!708136 () Bool)

(assert (=> start!93732 (=> (not res!708136) (not e!603563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93732 (= res!708136 (validMask!0 mask!1515))))

(assert (=> start!93732 e!603563))

(assert (=> start!93732 true))

(assert (=> start!93732 tp_is_empty!25033))

(declare-fun e!603566 () Bool)

(declare-fun array_inv!24972 (array!67026) Bool)

(assert (=> start!93732 (and (array_inv!24972 _values!955) e!603566)))

(assert (=> start!93732 tp!75088))

(declare-fun array_inv!24973 (array!67024) Bool)

(assert (=> start!93732 (array_inv!24973 _keys!1163)))

(declare-fun b!1060182 () Bool)

(assert (=> b!1060182 (= e!603566 (and e!603564 mapRes!39217))))

(declare-fun condMapEmpty!39217 () Bool)

(declare-fun mapDefault!39217 () ValueCell!11813)

(assert (=> b!1060182 (= condMapEmpty!39217 (= (arr!32222 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11813)) mapDefault!39217)))))

(assert (= (and start!93732 res!708136) b!1060179))

(assert (= (and b!1060179 res!708133) b!1060180))

(assert (= (and b!1060180 res!708135) b!1060177))

(assert (= (and b!1060177 res!708134) b!1060178))

(assert (= (and b!1060182 condMapEmpty!39217) mapIsEmpty!39217))

(assert (= (and b!1060182 (not condMapEmpty!39217)) mapNonEmpty!39217))

(get-info :version)

(assert (= (and mapNonEmpty!39217 ((_ is ValueCellFull!11813) mapValue!39217)) b!1060181))

(assert (= (and b!1060182 ((_ is ValueCellFull!11813) mapDefault!39217)) b!1060183))

(assert (= start!93732 b!1060182))

(declare-fun m!978821 () Bool)

(assert (=> b!1060180 m!978821))

(declare-fun m!978823 () Bool)

(assert (=> mapNonEmpty!39217 m!978823))

(declare-fun m!978825 () Bool)

(assert (=> b!1060178 m!978825))

(declare-fun m!978827 () Bool)

(assert (=> b!1060177 m!978827))

(declare-fun m!978829 () Bool)

(assert (=> start!93732 m!978829))

(declare-fun m!978831 () Bool)

(assert (=> start!93732 m!978831))

(declare-fun m!978833 () Bool)

(assert (=> start!93732 m!978833))

(check-sat (not start!93732) (not mapNonEmpty!39217) (not b!1060180) (not b_next!21223) tp_is_empty!25033 (not b!1060177) (not b!1060178) b_and!33907)
(check-sat b_and!33907 (not b_next!21223))
