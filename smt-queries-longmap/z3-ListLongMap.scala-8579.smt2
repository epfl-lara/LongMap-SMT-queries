; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104916 () Bool)

(assert start!104916)

(declare-fun b_free!26509 () Bool)

(declare-fun b_next!26509 () Bool)

(assert (=> start!104916 (= b_free!26509 (not b_next!26509))))

(declare-fun tp!93013 () Bool)

(declare-fun b_and!44275 () Bool)

(assert (=> start!104916 (= tp!93013 b_and!44275)))

(declare-fun mapNonEmpty!48874 () Bool)

(declare-fun mapRes!48874 () Bool)

(declare-fun tp!93014 () Bool)

(declare-fun e!709072 () Bool)

(assert (=> mapNonEmpty!48874 (= mapRes!48874 (and tp!93014 e!709072))))

(declare-fun mapKey!48874 () (_ BitVec 32))

(declare-datatypes ((V!47247 0))(
  ( (V!47248 (val!15768 Int)) )
))
(declare-datatypes ((ValueCell!14942 0))(
  ( (ValueCellFull!14942 (v!18460 V!47247)) (EmptyCell!14942) )
))
(declare-fun mapValue!48874 () ValueCell!14942)

(declare-datatypes ((array!80547 0))(
  ( (array!80548 (arr!38837 (Array (_ BitVec 32) ValueCell!14942)) (size!39374 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80547)

(declare-fun mapRest!48874 () (Array (_ BitVec 32) ValueCell!14942))

(assert (=> mapNonEmpty!48874 (= (arr!38837 _values!914) (store mapRest!48874 mapKey!48874 mapValue!48874))))

(declare-fun b!1249466 () Bool)

(declare-fun res!833269 () Bool)

(declare-fun e!709073 () Bool)

(assert (=> b!1249466 (=> (not res!833269) (not e!709073))))

(declare-datatypes ((array!80549 0))(
  ( (array!80550 (arr!38838 (Array (_ BitVec 32) (_ BitVec 64))) (size!39375 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80549)

(declare-datatypes ((List!27583 0))(
  ( (Nil!27580) (Cons!27579 (h!28797 (_ BitVec 64)) (t!41044 List!27583)) )
))
(declare-fun arrayNoDuplicates!0 (array!80549 (_ BitVec 32) List!27583) Bool)

(assert (=> b!1249466 (= res!833269 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27580))))

(declare-fun b!1249468 () Bool)

(assert (=> b!1249468 (= e!709073 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47247)

(declare-datatypes ((tuple2!20328 0))(
  ( (tuple2!20329 (_1!10175 (_ BitVec 64)) (_2!10175 V!47247)) )
))
(declare-datatypes ((List!27584 0))(
  ( (Nil!27581) (Cons!27580 (h!28798 tuple2!20328) (t!41045 List!27584)) )
))
(declare-datatypes ((ListLongMap!18209 0))(
  ( (ListLongMap!18210 (toList!9120 List!27584)) )
))
(declare-fun lt!563852 () ListLongMap!18209)

(declare-fun minValueBefore!43 () V!47247)

(declare-fun getCurrentListMapNoExtraKeys!5555 (array!80549 array!80547 (_ BitVec 32) (_ BitVec 32) V!47247 V!47247 (_ BitVec 32) Int) ListLongMap!18209)

(assert (=> b!1249468 (= lt!563852 (getCurrentListMapNoExtraKeys!5555 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249469 () Bool)

(declare-fun res!833270 () Bool)

(assert (=> b!1249469 (=> (not res!833270) (not e!709073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80549 (_ BitVec 32)) Bool)

(assert (=> b!1249469 (= res!833270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48874 () Bool)

(assert (=> mapIsEmpty!48874 mapRes!48874))

(declare-fun b!1249470 () Bool)

(declare-fun tp_is_empty!31411 () Bool)

(assert (=> b!1249470 (= e!709072 tp_is_empty!31411)))

(declare-fun b!1249471 () Bool)

(declare-fun e!709074 () Bool)

(assert (=> b!1249471 (= e!709074 tp_is_empty!31411)))

(declare-fun b!1249472 () Bool)

(declare-fun e!709076 () Bool)

(assert (=> b!1249472 (= e!709076 (and e!709074 mapRes!48874))))

(declare-fun condMapEmpty!48874 () Bool)

(declare-fun mapDefault!48874 () ValueCell!14942)

(assert (=> b!1249472 (= condMapEmpty!48874 (= (arr!38837 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14942)) mapDefault!48874)))))

(declare-fun b!1249467 () Bool)

(declare-fun res!833271 () Bool)

(assert (=> b!1249467 (=> (not res!833271) (not e!709073))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249467 (= res!833271 (and (= (size!39374 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39375 _keys!1118) (size!39374 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833272 () Bool)

(assert (=> start!104916 (=> (not res!833272) (not e!709073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104916 (= res!833272 (validMask!0 mask!1466))))

(assert (=> start!104916 e!709073))

(assert (=> start!104916 true))

(assert (=> start!104916 tp!93013))

(assert (=> start!104916 tp_is_empty!31411))

(declare-fun array_inv!29749 (array!80549) Bool)

(assert (=> start!104916 (array_inv!29749 _keys!1118)))

(declare-fun array_inv!29750 (array!80547) Bool)

(assert (=> start!104916 (and (array_inv!29750 _values!914) e!709076)))

(assert (= (and start!104916 res!833272) b!1249467))

(assert (= (and b!1249467 res!833271) b!1249469))

(assert (= (and b!1249469 res!833270) b!1249466))

(assert (= (and b!1249466 res!833269) b!1249468))

(assert (= (and b!1249472 condMapEmpty!48874) mapIsEmpty!48874))

(assert (= (and b!1249472 (not condMapEmpty!48874)) mapNonEmpty!48874))

(get-info :version)

(assert (= (and mapNonEmpty!48874 ((_ is ValueCellFull!14942) mapValue!48874)) b!1249470))

(assert (= (and b!1249472 ((_ is ValueCellFull!14942) mapDefault!48874)) b!1249471))

(assert (= start!104916 b!1249472))

(declare-fun m!1151029 () Bool)

(assert (=> mapNonEmpty!48874 m!1151029))

(declare-fun m!1151031 () Bool)

(assert (=> b!1249468 m!1151031))

(declare-fun m!1151033 () Bool)

(assert (=> start!104916 m!1151033))

(declare-fun m!1151035 () Bool)

(assert (=> start!104916 m!1151035))

(declare-fun m!1151037 () Bool)

(assert (=> start!104916 m!1151037))

(declare-fun m!1151039 () Bool)

(assert (=> b!1249469 m!1151039))

(declare-fun m!1151041 () Bool)

(assert (=> b!1249466 m!1151041))

(check-sat (not b_next!26509) (not mapNonEmpty!48874) tp_is_empty!31411 (not b!1249468) (not b!1249466) (not start!104916) (not b!1249469) b_and!44275)
(check-sat b_and!44275 (not b_next!26509))
