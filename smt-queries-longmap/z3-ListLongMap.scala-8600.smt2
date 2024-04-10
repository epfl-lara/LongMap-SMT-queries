; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104832 () Bool)

(assert start!104832)

(declare-fun b_free!26637 () Bool)

(declare-fun b_next!26637 () Bool)

(assert (=> start!104832 (= b_free!26637 (not b_next!26637))))

(declare-fun tp!93400 () Bool)

(declare-fun b_and!44405 () Bool)

(assert (=> start!104832 (= tp!93400 b_and!44405)))

(declare-fun b!1249578 () Bool)

(declare-fun res!833546 () Bool)

(declare-fun e!709235 () Bool)

(assert (=> b!1249578 (=> (not res!833546) (not e!709235))))

(declare-datatypes ((array!80756 0))(
  ( (array!80757 (arr!38945 (Array (_ BitVec 32) (_ BitVec 64))) (size!39481 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80756)

(declare-datatypes ((List!27637 0))(
  ( (Nil!27634) (Cons!27633 (h!28842 (_ BitVec 64)) (t!41108 List!27637)) )
))
(declare-fun arrayNoDuplicates!0 (array!80756 (_ BitVec 32) List!27637) Bool)

(assert (=> b!1249578 (= res!833546 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27634))))

(declare-fun b!1249579 () Bool)

(assert (=> b!1249579 (= e!709235 (not true))))

(declare-datatypes ((V!47417 0))(
  ( (V!47418 (val!15832 Int)) )
))
(declare-datatypes ((tuple2!20394 0))(
  ( (tuple2!20395 (_1!10208 (_ BitVec 64)) (_2!10208 V!47417)) )
))
(declare-datatypes ((List!27638 0))(
  ( (Nil!27635) (Cons!27634 (h!28843 tuple2!20394) (t!41109 List!27638)) )
))
(declare-datatypes ((ListLongMap!18267 0))(
  ( (ListLongMap!18268 (toList!9149 List!27638)) )
))
(declare-fun lt!563789 () ListLongMap!18267)

(declare-fun lt!563791 () ListLongMap!18267)

(assert (=> b!1249579 (= lt!563789 lt!563791)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47417)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41495 0))(
  ( (Unit!41496) )
))
(declare-fun lt!563790 () Unit!41495)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47417)

(declare-datatypes ((ValueCell!15006 0))(
  ( (ValueCellFull!15006 (v!18528 V!47417)) (EmptyCell!15006) )
))
(declare-datatypes ((array!80758 0))(
  ( (array!80759 (arr!38946 (Array (_ BitVec 32) ValueCell!15006)) (size!39482 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80758)

(declare-fun minValueBefore!43 () V!47417)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!920 (array!80756 array!80758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47417 V!47417 V!47417 V!47417 (_ BitVec 32) Int) Unit!41495)

(assert (=> b!1249579 (= lt!563790 (lemmaNoChangeToArrayThenSameMapNoExtras!920 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5556 (array!80756 array!80758 (_ BitVec 32) (_ BitVec 32) V!47417 V!47417 (_ BitVec 32) Int) ListLongMap!18267)

(assert (=> b!1249579 (= lt!563791 (getCurrentListMapNoExtraKeys!5556 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249579 (= lt!563789 (getCurrentListMapNoExtraKeys!5556 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49069 () Bool)

(declare-fun mapRes!49069 () Bool)

(declare-fun tp!93401 () Bool)

(declare-fun e!709237 () Bool)

(assert (=> mapNonEmpty!49069 (= mapRes!49069 (and tp!93401 e!709237))))

(declare-fun mapValue!49069 () ValueCell!15006)

(declare-fun mapRest!49069 () (Array (_ BitVec 32) ValueCell!15006))

(declare-fun mapKey!49069 () (_ BitVec 32))

(assert (=> mapNonEmpty!49069 (= (arr!38946 _values!914) (store mapRest!49069 mapKey!49069 mapValue!49069))))

(declare-fun mapIsEmpty!49069 () Bool)

(assert (=> mapIsEmpty!49069 mapRes!49069))

(declare-fun b!1249580 () Bool)

(declare-fun e!709236 () Bool)

(declare-fun e!709233 () Bool)

(assert (=> b!1249580 (= e!709236 (and e!709233 mapRes!49069))))

(declare-fun condMapEmpty!49069 () Bool)

(declare-fun mapDefault!49069 () ValueCell!15006)

(assert (=> b!1249580 (= condMapEmpty!49069 (= (arr!38946 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15006)) mapDefault!49069)))))

(declare-fun res!833547 () Bool)

(assert (=> start!104832 (=> (not res!833547) (not e!709235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104832 (= res!833547 (validMask!0 mask!1466))))

(assert (=> start!104832 e!709235))

(assert (=> start!104832 true))

(assert (=> start!104832 tp!93400))

(declare-fun tp_is_empty!31539 () Bool)

(assert (=> start!104832 tp_is_empty!31539))

(declare-fun array_inv!29719 (array!80756) Bool)

(assert (=> start!104832 (array_inv!29719 _keys!1118)))

(declare-fun array_inv!29720 (array!80758) Bool)

(assert (=> start!104832 (and (array_inv!29720 _values!914) e!709236)))

(declare-fun b!1249581 () Bool)

(declare-fun res!833544 () Bool)

(assert (=> b!1249581 (=> (not res!833544) (not e!709235))))

(assert (=> b!1249581 (= res!833544 (and (= (size!39482 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39481 _keys!1118) (size!39482 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249582 () Bool)

(assert (=> b!1249582 (= e!709233 tp_is_empty!31539)))

(declare-fun b!1249583 () Bool)

(assert (=> b!1249583 (= e!709237 tp_is_empty!31539)))

(declare-fun b!1249584 () Bool)

(declare-fun res!833545 () Bool)

(assert (=> b!1249584 (=> (not res!833545) (not e!709235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80756 (_ BitVec 32)) Bool)

(assert (=> b!1249584 (= res!833545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!104832 res!833547) b!1249581))

(assert (= (and b!1249581 res!833544) b!1249584))

(assert (= (and b!1249584 res!833545) b!1249578))

(assert (= (and b!1249578 res!833546) b!1249579))

(assert (= (and b!1249580 condMapEmpty!49069) mapIsEmpty!49069))

(assert (= (and b!1249580 (not condMapEmpty!49069)) mapNonEmpty!49069))

(get-info :version)

(assert (= (and mapNonEmpty!49069 ((_ is ValueCellFull!15006) mapValue!49069)) b!1249583))

(assert (= (and b!1249580 ((_ is ValueCellFull!15006) mapDefault!49069)) b!1249582))

(assert (= start!104832 b!1249580))

(declare-fun m!1150487 () Bool)

(assert (=> b!1249578 m!1150487))

(declare-fun m!1150489 () Bool)

(assert (=> start!104832 m!1150489))

(declare-fun m!1150491 () Bool)

(assert (=> start!104832 m!1150491))

(declare-fun m!1150493 () Bool)

(assert (=> start!104832 m!1150493))

(declare-fun m!1150495 () Bool)

(assert (=> mapNonEmpty!49069 m!1150495))

(declare-fun m!1150497 () Bool)

(assert (=> b!1249584 m!1150497))

(declare-fun m!1150499 () Bool)

(assert (=> b!1249579 m!1150499))

(declare-fun m!1150501 () Bool)

(assert (=> b!1249579 m!1150501))

(declare-fun m!1150503 () Bool)

(assert (=> b!1249579 m!1150503))

(check-sat (not b!1249578) (not b!1249584) b_and!44405 tp_is_empty!31539 (not b!1249579) (not mapNonEmpty!49069) (not start!104832) (not b_next!26637))
(check-sat b_and!44405 (not b_next!26637))
