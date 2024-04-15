; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105342 () Bool)

(assert start!105342)

(declare-fun b_free!27019 () Bool)

(declare-fun b_next!27019 () Bool)

(assert (=> start!105342 (= b_free!27019 (not b_next!27019))))

(declare-fun tp!94567 () Bool)

(declare-fun b_and!44839 () Bool)

(assert (=> start!105342 (= tp!94567 b_and!44839)))

(declare-fun b!1255101 () Bool)

(declare-fun res!836799 () Bool)

(declare-fun e!713291 () Bool)

(assert (=> b!1255101 (=> (not res!836799) (not e!713291))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81419 0))(
  ( (array!81420 (arr!39270 (Array (_ BitVec 32) (_ BitVec 64))) (size!39808 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81419)

(declare-datatypes ((V!47927 0))(
  ( (V!47928 (val!16023 Int)) )
))
(declare-datatypes ((ValueCell!15197 0))(
  ( (ValueCellFull!15197 (v!18722 V!47927)) (EmptyCell!15197) )
))
(declare-datatypes ((array!81421 0))(
  ( (array!81422 (arr!39271 (Array (_ BitVec 32) ValueCell!15197)) (size!39809 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81421)

(assert (=> b!1255101 (= res!836799 (and (= (size!39809 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39808 _keys!1118) (size!39809 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255102 () Bool)

(assert (=> b!1255102 (= e!713291 (not true))))

(declare-datatypes ((tuple2!20770 0))(
  ( (tuple2!20771 (_1!10396 (_ BitVec 64)) (_2!10396 V!47927)) )
))
(declare-datatypes ((List!27980 0))(
  ( (Nil!27977) (Cons!27976 (h!29185 tuple2!20770) (t!41456 List!27980)) )
))
(declare-datatypes ((ListLongMap!18643 0))(
  ( (ListLongMap!18644 (toList!9337 List!27980)) )
))
(declare-fun lt!567291 () ListLongMap!18643)

(declare-fun lt!567290 () ListLongMap!18643)

(assert (=> b!1255102 (= lt!567291 lt!567290)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47927)

(declare-fun zeroValue!871 () V!47927)

(declare-datatypes ((Unit!41641 0))(
  ( (Unit!41642) )
))
(declare-fun lt!567292 () Unit!41641)

(declare-fun minValueBefore!43 () V!47927)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1054 (array!81419 array!81421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47927 V!47927 V!47927 V!47927 (_ BitVec 32) Int) Unit!41641)

(assert (=> b!1255102 (= lt!567292 (lemmaNoChangeToArrayThenSameMapNoExtras!1054 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5732 (array!81419 array!81421 (_ BitVec 32) (_ BitVec 32) V!47927 V!47927 (_ BitVec 32) Int) ListLongMap!18643)

(assert (=> b!1255102 (= lt!567290 (getCurrentListMapNoExtraKeys!5732 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255102 (= lt!567291 (getCurrentListMapNoExtraKeys!5732 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255103 () Bool)

(declare-fun res!836797 () Bool)

(assert (=> b!1255103 (=> (not res!836797) (not e!713291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81419 (_ BitVec 32)) Bool)

(assert (=> b!1255103 (= res!836797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255105 () Bool)

(declare-fun e!713289 () Bool)

(declare-fun tp_is_empty!31921 () Bool)

(assert (=> b!1255105 (= e!713289 tp_is_empty!31921)))

(declare-fun b!1255106 () Bool)

(declare-fun e!713293 () Bool)

(assert (=> b!1255106 (= e!713293 tp_is_empty!31921)))

(declare-fun mapIsEmpty!49663 () Bool)

(declare-fun mapRes!49663 () Bool)

(assert (=> mapIsEmpty!49663 mapRes!49663))

(declare-fun b!1255104 () Bool)

(declare-fun e!713290 () Bool)

(assert (=> b!1255104 (= e!713290 (and e!713289 mapRes!49663))))

(declare-fun condMapEmpty!49663 () Bool)

(declare-fun mapDefault!49663 () ValueCell!15197)

(assert (=> b!1255104 (= condMapEmpty!49663 (= (arr!39271 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15197)) mapDefault!49663)))))

(declare-fun res!836798 () Bool)

(assert (=> start!105342 (=> (not res!836798) (not e!713291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105342 (= res!836798 (validMask!0 mask!1466))))

(assert (=> start!105342 e!713291))

(assert (=> start!105342 true))

(assert (=> start!105342 tp!94567))

(assert (=> start!105342 tp_is_empty!31921))

(declare-fun array_inv!30061 (array!81419) Bool)

(assert (=> start!105342 (array_inv!30061 _keys!1118)))

(declare-fun array_inv!30062 (array!81421) Bool)

(assert (=> start!105342 (and (array_inv!30062 _values!914) e!713290)))

(declare-fun mapNonEmpty!49663 () Bool)

(declare-fun tp!94568 () Bool)

(assert (=> mapNonEmpty!49663 (= mapRes!49663 (and tp!94568 e!713293))))

(declare-fun mapRest!49663 () (Array (_ BitVec 32) ValueCell!15197))

(declare-fun mapValue!49663 () ValueCell!15197)

(declare-fun mapKey!49663 () (_ BitVec 32))

(assert (=> mapNonEmpty!49663 (= (arr!39271 _values!914) (store mapRest!49663 mapKey!49663 mapValue!49663))))

(declare-fun b!1255107 () Bool)

(declare-fun res!836796 () Bool)

(assert (=> b!1255107 (=> (not res!836796) (not e!713291))))

(declare-datatypes ((List!27981 0))(
  ( (Nil!27978) (Cons!27977 (h!29186 (_ BitVec 64)) (t!41457 List!27981)) )
))
(declare-fun arrayNoDuplicates!0 (array!81419 (_ BitVec 32) List!27981) Bool)

(assert (=> b!1255107 (= res!836796 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27978))))

(assert (= (and start!105342 res!836798) b!1255101))

(assert (= (and b!1255101 res!836799) b!1255103))

(assert (= (and b!1255103 res!836797) b!1255107))

(assert (= (and b!1255107 res!836796) b!1255102))

(assert (= (and b!1255104 condMapEmpty!49663) mapIsEmpty!49663))

(assert (= (and b!1255104 (not condMapEmpty!49663)) mapNonEmpty!49663))

(get-info :version)

(assert (= (and mapNonEmpty!49663 ((_ is ValueCellFull!15197) mapValue!49663)) b!1255106))

(assert (= (and b!1255104 ((_ is ValueCellFull!15197) mapDefault!49663)) b!1255105))

(assert (= start!105342 b!1255104))

(declare-fun m!1155439 () Bool)

(assert (=> mapNonEmpty!49663 m!1155439))

(declare-fun m!1155441 () Bool)

(assert (=> b!1255107 m!1155441))

(declare-fun m!1155443 () Bool)

(assert (=> b!1255102 m!1155443))

(declare-fun m!1155445 () Bool)

(assert (=> b!1255102 m!1155445))

(declare-fun m!1155447 () Bool)

(assert (=> b!1255102 m!1155447))

(declare-fun m!1155449 () Bool)

(assert (=> start!105342 m!1155449))

(declare-fun m!1155451 () Bool)

(assert (=> start!105342 m!1155451))

(declare-fun m!1155453 () Bool)

(assert (=> start!105342 m!1155453))

(declare-fun m!1155455 () Bool)

(assert (=> b!1255103 m!1155455))

(check-sat (not b!1255103) (not start!105342) tp_is_empty!31921 (not b!1255107) (not mapNonEmpty!49663) (not b_next!27019) (not b!1255102) b_and!44839)
(check-sat b_and!44839 (not b_next!27019))
