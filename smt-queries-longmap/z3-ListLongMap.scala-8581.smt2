; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104928 () Bool)

(assert start!104928)

(declare-fun b_free!26521 () Bool)

(declare-fun b_next!26521 () Bool)

(assert (=> start!104928 (= b_free!26521 (not b_next!26521))))

(declare-fun tp!93050 () Bool)

(declare-fun b_and!44287 () Bool)

(assert (=> start!104928 (= tp!93050 b_and!44287)))

(declare-fun mapIsEmpty!48892 () Bool)

(declare-fun mapRes!48892 () Bool)

(assert (=> mapIsEmpty!48892 mapRes!48892))

(declare-fun res!833344 () Bool)

(declare-fun e!709162 () Bool)

(assert (=> start!104928 (=> (not res!833344) (not e!709162))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104928 (= res!833344 (validMask!0 mask!1466))))

(assert (=> start!104928 e!709162))

(assert (=> start!104928 true))

(assert (=> start!104928 tp!93050))

(declare-fun tp_is_empty!31423 () Bool)

(assert (=> start!104928 tp_is_empty!31423))

(declare-datatypes ((array!80571 0))(
  ( (array!80572 (arr!38849 (Array (_ BitVec 32) (_ BitVec 64))) (size!39386 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80571)

(declare-fun array_inv!29759 (array!80571) Bool)

(assert (=> start!104928 (array_inv!29759 _keys!1118)))

(declare-datatypes ((V!47263 0))(
  ( (V!47264 (val!15774 Int)) )
))
(declare-datatypes ((ValueCell!14948 0))(
  ( (ValueCellFull!14948 (v!18466 V!47263)) (EmptyCell!14948) )
))
(declare-datatypes ((array!80573 0))(
  ( (array!80574 (arr!38850 (Array (_ BitVec 32) ValueCell!14948)) (size!39387 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80573)

(declare-fun e!709163 () Bool)

(declare-fun array_inv!29760 (array!80573) Bool)

(assert (=> start!104928 (and (array_inv!29760 _values!914) e!709163)))

(declare-fun b!1249592 () Bool)

(assert (=> b!1249592 (= e!709162 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((tuple2!20336 0))(
  ( (tuple2!20337 (_1!10179 (_ BitVec 64)) (_2!10179 V!47263)) )
))
(declare-datatypes ((List!27593 0))(
  ( (Nil!27590) (Cons!27589 (h!28807 tuple2!20336) (t!41054 List!27593)) )
))
(declare-datatypes ((ListLongMap!18217 0))(
  ( (ListLongMap!18218 (toList!9124 List!27593)) )
))
(declare-fun lt!563870 () ListLongMap!18217)

(declare-fun zeroValue!871 () V!47263)

(declare-fun minValueBefore!43 () V!47263)

(declare-fun getCurrentListMapNoExtraKeys!5559 (array!80571 array!80573 (_ BitVec 32) (_ BitVec 32) V!47263 V!47263 (_ BitVec 32) Int) ListLongMap!18217)

(assert (=> b!1249592 (= lt!563870 (getCurrentListMapNoExtraKeys!5559 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48892 () Bool)

(declare-fun tp!93049 () Bool)

(declare-fun e!709164 () Bool)

(assert (=> mapNonEmpty!48892 (= mapRes!48892 (and tp!93049 e!709164))))

(declare-fun mapValue!48892 () ValueCell!14948)

(declare-fun mapRest!48892 () (Array (_ BitVec 32) ValueCell!14948))

(declare-fun mapKey!48892 () (_ BitVec 32))

(assert (=> mapNonEmpty!48892 (= (arr!38850 _values!914) (store mapRest!48892 mapKey!48892 mapValue!48892))))

(declare-fun b!1249593 () Bool)

(declare-fun res!833342 () Bool)

(assert (=> b!1249593 (=> (not res!833342) (not e!709162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80571 (_ BitVec 32)) Bool)

(assert (=> b!1249593 (= res!833342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249594 () Bool)

(declare-fun e!709166 () Bool)

(assert (=> b!1249594 (= e!709166 tp_is_empty!31423)))

(declare-fun b!1249595 () Bool)

(declare-fun res!833341 () Bool)

(assert (=> b!1249595 (=> (not res!833341) (not e!709162))))

(declare-datatypes ((List!27594 0))(
  ( (Nil!27591) (Cons!27590 (h!28808 (_ BitVec 64)) (t!41055 List!27594)) )
))
(declare-fun arrayNoDuplicates!0 (array!80571 (_ BitVec 32) List!27594) Bool)

(assert (=> b!1249595 (= res!833341 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27591))))

(declare-fun b!1249596 () Bool)

(declare-fun res!833343 () Bool)

(assert (=> b!1249596 (=> (not res!833343) (not e!709162))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249596 (= res!833343 (and (= (size!39387 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39386 _keys!1118) (size!39387 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249597 () Bool)

(assert (=> b!1249597 (= e!709164 tp_is_empty!31423)))

(declare-fun b!1249598 () Bool)

(assert (=> b!1249598 (= e!709163 (and e!709166 mapRes!48892))))

(declare-fun condMapEmpty!48892 () Bool)

(declare-fun mapDefault!48892 () ValueCell!14948)

(assert (=> b!1249598 (= condMapEmpty!48892 (= (arr!38850 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14948)) mapDefault!48892)))))

(assert (= (and start!104928 res!833344) b!1249596))

(assert (= (and b!1249596 res!833343) b!1249593))

(assert (= (and b!1249593 res!833342) b!1249595))

(assert (= (and b!1249595 res!833341) b!1249592))

(assert (= (and b!1249598 condMapEmpty!48892) mapIsEmpty!48892))

(assert (= (and b!1249598 (not condMapEmpty!48892)) mapNonEmpty!48892))

(get-info :version)

(assert (= (and mapNonEmpty!48892 ((_ is ValueCellFull!14948) mapValue!48892)) b!1249597))

(assert (= (and b!1249598 ((_ is ValueCellFull!14948) mapDefault!48892)) b!1249594))

(assert (= start!104928 b!1249598))

(declare-fun m!1151113 () Bool)

(assert (=> b!1249593 m!1151113))

(declare-fun m!1151115 () Bool)

(assert (=> b!1249595 m!1151115))

(declare-fun m!1151117 () Bool)

(assert (=> start!104928 m!1151117))

(declare-fun m!1151119 () Bool)

(assert (=> start!104928 m!1151119))

(declare-fun m!1151121 () Bool)

(assert (=> start!104928 m!1151121))

(declare-fun m!1151123 () Bool)

(assert (=> mapNonEmpty!48892 m!1151123))

(declare-fun m!1151125 () Bool)

(assert (=> b!1249592 m!1151125))

(check-sat b_and!44287 (not b!1249592) (not b_next!26521) tp_is_empty!31423 (not mapNonEmpty!48892) (not start!104928) (not b!1249595) (not b!1249593))
(check-sat b_and!44287 (not b_next!26521))
