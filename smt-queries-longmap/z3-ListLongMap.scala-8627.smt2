; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105274 () Bool)

(assert start!105274)

(declare-fun b_free!26797 () Bool)

(declare-fun b_next!26797 () Bool)

(assert (=> start!105274 (= b_free!26797 (not b_next!26797))))

(declare-fun tp!93889 () Bool)

(declare-fun b_and!44595 () Bool)

(assert (=> start!105274 (= tp!93889 b_and!44595)))

(declare-fun b!1253295 () Bool)

(declare-fun e!711868 () Bool)

(assert (=> b!1253295 (= e!711868 (not true))))

(declare-datatypes ((V!47631 0))(
  ( (V!47632 (val!15912 Int)) )
))
(declare-datatypes ((tuple2!20546 0))(
  ( (tuple2!20547 (_1!10284 (_ BitVec 64)) (_2!10284 V!47631)) )
))
(declare-datatypes ((List!27790 0))(
  ( (Nil!27787) (Cons!27786 (h!29004 tuple2!20546) (t!41259 List!27790)) )
))
(declare-datatypes ((ListLongMap!18427 0))(
  ( (ListLongMap!18428 (toList!9229 List!27790)) )
))
(declare-fun lt!565614 () ListLongMap!18427)

(declare-fun lt!565615 () ListLongMap!18427)

(assert (=> b!1253295 (= lt!565614 lt!565615)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47631)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47631)

(declare-datatypes ((array!81109 0))(
  ( (array!81110 (arr!39114 (Array (_ BitVec 32) (_ BitVec 64))) (size!39651 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81109)

(declare-datatypes ((ValueCell!15086 0))(
  ( (ValueCellFull!15086 (v!18606 V!47631)) (EmptyCell!15086) )
))
(declare-datatypes ((array!81111 0))(
  ( (array!81112 (arr!39115 (Array (_ BitVec 32) ValueCell!15086)) (size!39652 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81111)

(declare-fun minValueBefore!43 () V!47631)

(declare-datatypes ((Unit!41596 0))(
  ( (Unit!41597) )
))
(declare-fun lt!565616 () Unit!41596)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!970 (array!81109 array!81111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47631 V!47631 V!47631 V!47631 (_ BitVec 32) Int) Unit!41596)

(assert (=> b!1253295 (= lt!565616 (lemmaNoChangeToArrayThenSameMapNoExtras!970 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5656 (array!81109 array!81111 (_ BitVec 32) (_ BitVec 32) V!47631 V!47631 (_ BitVec 32) Int) ListLongMap!18427)

(assert (=> b!1253295 (= lt!565615 (getCurrentListMapNoExtraKeys!5656 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253295 (= lt!565614 (getCurrentListMapNoExtraKeys!5656 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49318 () Bool)

(declare-fun mapRes!49318 () Bool)

(assert (=> mapIsEmpty!49318 mapRes!49318))

(declare-fun b!1253296 () Bool)

(declare-fun res!835513 () Bool)

(assert (=> b!1253296 (=> (not res!835513) (not e!711868))))

(declare-datatypes ((List!27791 0))(
  ( (Nil!27788) (Cons!27787 (h!29005 (_ BitVec 64)) (t!41260 List!27791)) )
))
(declare-fun arrayNoDuplicates!0 (array!81109 (_ BitVec 32) List!27791) Bool)

(assert (=> b!1253296 (= res!835513 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27788))))

(declare-fun b!1253297 () Bool)

(declare-fun res!835512 () Bool)

(assert (=> b!1253297 (=> (not res!835512) (not e!711868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81109 (_ BitVec 32)) Bool)

(assert (=> b!1253297 (= res!835512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49318 () Bool)

(declare-fun tp!93890 () Bool)

(declare-fun e!711869 () Bool)

(assert (=> mapNonEmpty!49318 (= mapRes!49318 (and tp!93890 e!711869))))

(declare-fun mapValue!49318 () ValueCell!15086)

(declare-fun mapRest!49318 () (Array (_ BitVec 32) ValueCell!15086))

(declare-fun mapKey!49318 () (_ BitVec 32))

(assert (=> mapNonEmpty!49318 (= (arr!39115 _values!914) (store mapRest!49318 mapKey!49318 mapValue!49318))))

(declare-fun res!835510 () Bool)

(assert (=> start!105274 (=> (not res!835510) (not e!711868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105274 (= res!835510 (validMask!0 mask!1466))))

(assert (=> start!105274 e!711868))

(assert (=> start!105274 true))

(assert (=> start!105274 tp!93889))

(declare-fun tp_is_empty!31699 () Bool)

(assert (=> start!105274 tp_is_empty!31699))

(declare-fun array_inv!29945 (array!81109) Bool)

(assert (=> start!105274 (array_inv!29945 _keys!1118)))

(declare-fun e!711871 () Bool)

(declare-fun array_inv!29946 (array!81111) Bool)

(assert (=> start!105274 (and (array_inv!29946 _values!914) e!711871)))

(declare-fun b!1253298 () Bool)

(declare-fun e!711872 () Bool)

(assert (=> b!1253298 (= e!711872 tp_is_empty!31699)))

(declare-fun b!1253299 () Bool)

(assert (=> b!1253299 (= e!711869 tp_is_empty!31699)))

(declare-fun b!1253300 () Bool)

(assert (=> b!1253300 (= e!711871 (and e!711872 mapRes!49318))))

(declare-fun condMapEmpty!49318 () Bool)

(declare-fun mapDefault!49318 () ValueCell!15086)

(assert (=> b!1253300 (= condMapEmpty!49318 (= (arr!39115 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15086)) mapDefault!49318)))))

(declare-fun b!1253301 () Bool)

(declare-fun res!835511 () Bool)

(assert (=> b!1253301 (=> (not res!835511) (not e!711868))))

(assert (=> b!1253301 (= res!835511 (and (= (size!39652 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39651 _keys!1118) (size!39652 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105274 res!835510) b!1253301))

(assert (= (and b!1253301 res!835511) b!1253297))

(assert (= (and b!1253297 res!835512) b!1253296))

(assert (= (and b!1253296 res!835513) b!1253295))

(assert (= (and b!1253300 condMapEmpty!49318) mapIsEmpty!49318))

(assert (= (and b!1253300 (not condMapEmpty!49318)) mapNonEmpty!49318))

(get-info :version)

(assert (= (and mapNonEmpty!49318 ((_ is ValueCellFull!15086) mapValue!49318)) b!1253299))

(assert (= (and b!1253300 ((_ is ValueCellFull!15086) mapDefault!49318)) b!1253298))

(assert (= start!105274 b!1253300))

(declare-fun m!1154301 () Bool)

(assert (=> b!1253296 m!1154301))

(declare-fun m!1154303 () Bool)

(assert (=> start!105274 m!1154303))

(declare-fun m!1154305 () Bool)

(assert (=> start!105274 m!1154305))

(declare-fun m!1154307 () Bool)

(assert (=> start!105274 m!1154307))

(declare-fun m!1154309 () Bool)

(assert (=> b!1253295 m!1154309))

(declare-fun m!1154311 () Bool)

(assert (=> b!1253295 m!1154311))

(declare-fun m!1154313 () Bool)

(assert (=> b!1253295 m!1154313))

(declare-fun m!1154315 () Bool)

(assert (=> b!1253297 m!1154315))

(declare-fun m!1154317 () Bool)

(assert (=> mapNonEmpty!49318 m!1154317))

(check-sat (not b!1253295) (not mapNonEmpty!49318) (not b!1253297) b_and!44595 (not start!105274) tp_is_empty!31699 (not b!1253296) (not b_next!26797))
(check-sat b_and!44595 (not b_next!26797))
