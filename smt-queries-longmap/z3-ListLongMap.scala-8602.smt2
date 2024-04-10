; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104844 () Bool)

(assert start!104844)

(declare-fun b_free!26649 () Bool)

(declare-fun b_next!26649 () Bool)

(assert (=> start!104844 (= b_free!26649 (not b_next!26649))))

(declare-fun tp!93436 () Bool)

(declare-fun b_and!44417 () Bool)

(assert (=> start!104844 (= tp!93436 b_and!44417)))

(declare-fun res!833617 () Bool)

(declare-fun e!709325 () Bool)

(assert (=> start!104844 (=> (not res!833617) (not e!709325))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104844 (= res!833617 (validMask!0 mask!1466))))

(assert (=> start!104844 e!709325))

(assert (=> start!104844 true))

(assert (=> start!104844 tp!93436))

(declare-fun tp_is_empty!31551 () Bool)

(assert (=> start!104844 tp_is_empty!31551))

(declare-datatypes ((array!80776 0))(
  ( (array!80777 (arr!38955 (Array (_ BitVec 32) (_ BitVec 64))) (size!39491 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80776)

(declare-fun array_inv!29725 (array!80776) Bool)

(assert (=> start!104844 (array_inv!29725 _keys!1118)))

(declare-datatypes ((V!47433 0))(
  ( (V!47434 (val!15838 Int)) )
))
(declare-datatypes ((ValueCell!15012 0))(
  ( (ValueCellFull!15012 (v!18534 V!47433)) (EmptyCell!15012) )
))
(declare-datatypes ((array!80778 0))(
  ( (array!80779 (arr!38956 (Array (_ BitVec 32) ValueCell!15012)) (size!39492 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80778)

(declare-fun e!709323 () Bool)

(declare-fun array_inv!29726 (array!80778) Bool)

(assert (=> start!104844 (and (array_inv!29726 _values!914) e!709323)))

(declare-fun b!1249704 () Bool)

(assert (=> b!1249704 (= e!709325 (not true))))

(declare-datatypes ((tuple2!20400 0))(
  ( (tuple2!20401 (_1!10211 (_ BitVec 64)) (_2!10211 V!47433)) )
))
(declare-datatypes ((List!27643 0))(
  ( (Nil!27640) (Cons!27639 (h!28848 tuple2!20400) (t!41114 List!27643)) )
))
(declare-datatypes ((ListLongMap!18273 0))(
  ( (ListLongMap!18274 (toList!9152 List!27643)) )
))
(declare-fun lt!563843 () ListLongMap!18273)

(declare-fun lt!563845 () ListLongMap!18273)

(assert (=> b!1249704 (= lt!563843 lt!563845)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47433)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47433)

(declare-fun minValueBefore!43 () V!47433)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((Unit!41501 0))(
  ( (Unit!41502) )
))
(declare-fun lt!563844 () Unit!41501)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!923 (array!80776 array!80778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47433 V!47433 V!47433 V!47433 (_ BitVec 32) Int) Unit!41501)

(assert (=> b!1249704 (= lt!563844 (lemmaNoChangeToArrayThenSameMapNoExtras!923 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5559 (array!80776 array!80778 (_ BitVec 32) (_ BitVec 32) V!47433 V!47433 (_ BitVec 32) Int) ListLongMap!18273)

(assert (=> b!1249704 (= lt!563845 (getCurrentListMapNoExtraKeys!5559 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249704 (= lt!563843 (getCurrentListMapNoExtraKeys!5559 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249705 () Bool)

(declare-fun res!833618 () Bool)

(assert (=> b!1249705 (=> (not res!833618) (not e!709325))))

(declare-datatypes ((List!27644 0))(
  ( (Nil!27641) (Cons!27640 (h!28849 (_ BitVec 64)) (t!41115 List!27644)) )
))
(declare-fun arrayNoDuplicates!0 (array!80776 (_ BitVec 32) List!27644) Bool)

(assert (=> b!1249705 (= res!833618 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27641))))

(declare-fun b!1249706 () Bool)

(declare-fun e!709327 () Bool)

(assert (=> b!1249706 (= e!709327 tp_is_empty!31551)))

(declare-fun b!1249707 () Bool)

(declare-fun res!833619 () Bool)

(assert (=> b!1249707 (=> (not res!833619) (not e!709325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80776 (_ BitVec 32)) Bool)

(assert (=> b!1249707 (= res!833619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49087 () Bool)

(declare-fun mapRes!49087 () Bool)

(declare-fun tp!93437 () Bool)

(declare-fun e!709326 () Bool)

(assert (=> mapNonEmpty!49087 (= mapRes!49087 (and tp!93437 e!709326))))

(declare-fun mapRest!49087 () (Array (_ BitVec 32) ValueCell!15012))

(declare-fun mapKey!49087 () (_ BitVec 32))

(declare-fun mapValue!49087 () ValueCell!15012)

(assert (=> mapNonEmpty!49087 (= (arr!38956 _values!914) (store mapRest!49087 mapKey!49087 mapValue!49087))))

(declare-fun b!1249708 () Bool)

(assert (=> b!1249708 (= e!709326 tp_is_empty!31551)))

(declare-fun b!1249709 () Bool)

(assert (=> b!1249709 (= e!709323 (and e!709327 mapRes!49087))))

(declare-fun condMapEmpty!49087 () Bool)

(declare-fun mapDefault!49087 () ValueCell!15012)

(assert (=> b!1249709 (= condMapEmpty!49087 (= (arr!38956 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15012)) mapDefault!49087)))))

(declare-fun mapIsEmpty!49087 () Bool)

(assert (=> mapIsEmpty!49087 mapRes!49087))

(declare-fun b!1249710 () Bool)

(declare-fun res!833616 () Bool)

(assert (=> b!1249710 (=> (not res!833616) (not e!709325))))

(assert (=> b!1249710 (= res!833616 (and (= (size!39492 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39491 _keys!1118) (size!39492 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!104844 res!833617) b!1249710))

(assert (= (and b!1249710 res!833616) b!1249707))

(assert (= (and b!1249707 res!833619) b!1249705))

(assert (= (and b!1249705 res!833618) b!1249704))

(assert (= (and b!1249709 condMapEmpty!49087) mapIsEmpty!49087))

(assert (= (and b!1249709 (not condMapEmpty!49087)) mapNonEmpty!49087))

(get-info :version)

(assert (= (and mapNonEmpty!49087 ((_ is ValueCellFull!15012) mapValue!49087)) b!1249708))

(assert (= (and b!1249709 ((_ is ValueCellFull!15012) mapDefault!49087)) b!1249706))

(assert (= start!104844 b!1249709))

(declare-fun m!1150595 () Bool)

(assert (=> b!1249707 m!1150595))

(declare-fun m!1150597 () Bool)

(assert (=> b!1249704 m!1150597))

(declare-fun m!1150599 () Bool)

(assert (=> b!1249704 m!1150599))

(declare-fun m!1150601 () Bool)

(assert (=> b!1249704 m!1150601))

(declare-fun m!1150603 () Bool)

(assert (=> mapNonEmpty!49087 m!1150603))

(declare-fun m!1150605 () Bool)

(assert (=> start!104844 m!1150605))

(declare-fun m!1150607 () Bool)

(assert (=> start!104844 m!1150607))

(declare-fun m!1150609 () Bool)

(assert (=> start!104844 m!1150609))

(declare-fun m!1150611 () Bool)

(assert (=> b!1249705 m!1150611))

(check-sat (not start!104844) (not b_next!26649) b_and!44417 tp_is_empty!31551 (not b!1249704) (not b!1249707) (not b!1249705) (not mapNonEmpty!49087))
(check-sat b_and!44417 (not b_next!26649))
