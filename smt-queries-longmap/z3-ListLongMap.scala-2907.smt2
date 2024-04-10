; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41586 () Bool)

(assert start!41586)

(declare-fun b_free!11253 () Bool)

(declare-fun b_next!11253 () Bool)

(assert (=> start!41586 (= b_free!11253 (not b_next!11253))))

(declare-fun tp!39756 () Bool)

(declare-fun b_and!19593 () Bool)

(assert (=> start!41586 (= tp!39756 b_and!19593)))

(declare-fun mapNonEmpty!20698 () Bool)

(declare-fun mapRes!20698 () Bool)

(declare-fun tp!39757 () Bool)

(declare-fun e!271345 () Bool)

(assert (=> mapNonEmpty!20698 (= mapRes!20698 (and tp!39757 e!271345))))

(declare-datatypes ((V!18013 0))(
  ( (V!18014 (val!6385 Int)) )
))
(declare-datatypes ((ValueCell!5997 0))(
  ( (ValueCellFull!5997 (v!8672 V!18013)) (EmptyCell!5997) )
))
(declare-fun mapValue!20698 () ValueCell!5997)

(declare-datatypes ((array!29149 0))(
  ( (array!29150 (arr!14006 (Array (_ BitVec 32) ValueCell!5997)) (size!14358 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29149)

(declare-fun mapKey!20698 () (_ BitVec 32))

(declare-fun mapRest!20698 () (Array (_ BitVec 32) ValueCell!5997))

(assert (=> mapNonEmpty!20698 (= (arr!14006 _values!833) (store mapRest!20698 mapKey!20698 mapValue!20698))))

(declare-fun b!464503 () Bool)

(declare-fun res!277710 () Bool)

(declare-fun e!271347 () Bool)

(assert (=> b!464503 (=> (not res!277710) (not e!271347))))

(declare-datatypes ((array!29151 0))(
  ( (array!29152 (arr!14007 (Array (_ BitVec 32) (_ BitVec 64))) (size!14359 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29151)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29151 (_ BitVec 32)) Bool)

(assert (=> b!464503 (= res!277710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464504 () Bool)

(declare-fun res!277712 () Bool)

(assert (=> b!464504 (=> (not res!277712) (not e!271347))))

(declare-datatypes ((List!8457 0))(
  ( (Nil!8454) (Cons!8453 (h!9309 (_ BitVec 64)) (t!14403 List!8457)) )
))
(declare-fun arrayNoDuplicates!0 (array!29151 (_ BitVec 32) List!8457) Bool)

(assert (=> b!464504 (= res!277712 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8454))))

(declare-fun b!464505 () Bool)

(declare-fun res!277709 () Bool)

(assert (=> b!464505 (=> (not res!277709) (not e!271347))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464505 (= res!277709 (and (= (size!14358 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14359 _keys!1025) (size!14358 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464506 () Bool)

(declare-fun e!271346 () Bool)

(declare-fun tp_is_empty!12681 () Bool)

(assert (=> b!464506 (= e!271346 tp_is_empty!12681)))

(declare-fun b!464507 () Bool)

(declare-fun e!271343 () Bool)

(assert (=> b!464507 (= e!271343 (and e!271346 mapRes!20698))))

(declare-fun condMapEmpty!20698 () Bool)

(declare-fun mapDefault!20698 () ValueCell!5997)

(assert (=> b!464507 (= condMapEmpty!20698 (= (arr!14006 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5997)) mapDefault!20698)))))

(declare-fun mapIsEmpty!20698 () Bool)

(assert (=> mapIsEmpty!20698 mapRes!20698))

(declare-fun res!277711 () Bool)

(assert (=> start!41586 (=> (not res!277711) (not e!271347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41586 (= res!277711 (validMask!0 mask!1365))))

(assert (=> start!41586 e!271347))

(assert (=> start!41586 tp_is_empty!12681))

(assert (=> start!41586 tp!39756))

(assert (=> start!41586 true))

(declare-fun array_inv!10116 (array!29151) Bool)

(assert (=> start!41586 (array_inv!10116 _keys!1025)))

(declare-fun array_inv!10117 (array!29149) Bool)

(assert (=> start!41586 (and (array_inv!10117 _values!833) e!271343)))

(declare-fun b!464508 () Bool)

(assert (=> b!464508 (= e!271345 tp_is_empty!12681)))

(declare-fun b!464509 () Bool)

(assert (=> b!464509 (= e!271347 (not true))))

(declare-datatypes ((tuple2!8362 0))(
  ( (tuple2!8363 (_1!4192 (_ BitVec 64)) (_2!4192 V!18013)) )
))
(declare-datatypes ((List!8458 0))(
  ( (Nil!8455) (Cons!8454 (h!9310 tuple2!8362) (t!14404 List!8458)) )
))
(declare-datatypes ((ListLongMap!7275 0))(
  ( (ListLongMap!7276 (toList!3653 List!8458)) )
))
(declare-fun lt!209742 () ListLongMap!7275)

(declare-fun lt!209744 () ListLongMap!7275)

(assert (=> b!464509 (= lt!209742 lt!209744)))

(declare-fun minValueBefore!38 () V!18013)

(declare-fun zeroValue!794 () V!18013)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13474 0))(
  ( (Unit!13475) )
))
(declare-fun lt!209743 () Unit!13474)

(declare-fun minValueAfter!38 () V!18013)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!13 (array!29151 array!29149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18013 V!18013 V!18013 V!18013 (_ BitVec 32) Int) Unit!13474)

(assert (=> b!464509 (= lt!209743 (lemmaNoChangeToArrayThenSameMapNoExtras!13 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1833 (array!29151 array!29149 (_ BitVec 32) (_ BitVec 32) V!18013 V!18013 (_ BitVec 32) Int) ListLongMap!7275)

(assert (=> b!464509 (= lt!209744 (getCurrentListMapNoExtraKeys!1833 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464509 (= lt!209742 (getCurrentListMapNoExtraKeys!1833 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41586 res!277711) b!464505))

(assert (= (and b!464505 res!277709) b!464503))

(assert (= (and b!464503 res!277710) b!464504))

(assert (= (and b!464504 res!277712) b!464509))

(assert (= (and b!464507 condMapEmpty!20698) mapIsEmpty!20698))

(assert (= (and b!464507 (not condMapEmpty!20698)) mapNonEmpty!20698))

(get-info :version)

(assert (= (and mapNonEmpty!20698 ((_ is ValueCellFull!5997) mapValue!20698)) b!464508))

(assert (= (and b!464507 ((_ is ValueCellFull!5997) mapDefault!20698)) b!464506))

(assert (= start!41586 b!464507))

(declare-fun m!446879 () Bool)

(assert (=> b!464504 m!446879))

(declare-fun m!446881 () Bool)

(assert (=> mapNonEmpty!20698 m!446881))

(declare-fun m!446883 () Bool)

(assert (=> b!464503 m!446883))

(declare-fun m!446885 () Bool)

(assert (=> start!41586 m!446885))

(declare-fun m!446887 () Bool)

(assert (=> start!41586 m!446887))

(declare-fun m!446889 () Bool)

(assert (=> start!41586 m!446889))

(declare-fun m!446891 () Bool)

(assert (=> b!464509 m!446891))

(declare-fun m!446893 () Bool)

(assert (=> b!464509 m!446893))

(declare-fun m!446895 () Bool)

(assert (=> b!464509 m!446895))

(check-sat (not b!464504) (not mapNonEmpty!20698) (not b_next!11253) (not b!464503) (not b!464509) (not start!41586) b_and!19593 tp_is_empty!12681)
(check-sat b_and!19593 (not b_next!11253))
