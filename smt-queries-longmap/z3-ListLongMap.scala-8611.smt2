; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104912 () Bool)

(assert start!104912)

(declare-fun b_free!26703 () Bool)

(declare-fun b_next!26703 () Bool)

(assert (=> start!104912 (= b_free!26703 (not b_next!26703))))

(declare-fun tp!93601 () Bool)

(declare-fun b_and!44479 () Bool)

(assert (=> start!104912 (= tp!93601 b_and!44479)))

(declare-fun b!1250483 () Bool)

(declare-fun res!834103 () Bool)

(declare-fun e!709914 () Bool)

(assert (=> b!1250483 (=> (not res!834103) (not e!709914))))

(declare-datatypes ((array!80878 0))(
  ( (array!80879 (arr!39005 (Array (_ BitVec 32) (_ BitVec 64))) (size!39541 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80878)

(declare-datatypes ((List!27682 0))(
  ( (Nil!27679) (Cons!27678 (h!28887 (_ BitVec 64)) (t!41155 List!27682)) )
))
(declare-fun arrayNoDuplicates!0 (array!80878 (_ BitVec 32) List!27682) Bool)

(assert (=> b!1250483 (= res!834103 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27679))))

(declare-fun b!1250484 () Bool)

(declare-fun res!834102 () Bool)

(assert (=> b!1250484 (=> (not res!834102) (not e!709914))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80878 (_ BitVec 32)) Bool)

(assert (=> b!1250484 (= res!834102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!834098 () Bool)

(assert (=> start!104912 (=> (not res!834098) (not e!709914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104912 (= res!834098 (validMask!0 mask!1466))))

(assert (=> start!104912 e!709914))

(assert (=> start!104912 true))

(assert (=> start!104912 tp!93601))

(declare-fun tp_is_empty!31605 () Bool)

(assert (=> start!104912 tp_is_empty!31605))

(declare-fun array_inv!29755 (array!80878) Bool)

(assert (=> start!104912 (array_inv!29755 _keys!1118)))

(declare-datatypes ((V!47505 0))(
  ( (V!47506 (val!15865 Int)) )
))
(declare-datatypes ((ValueCell!15039 0))(
  ( (ValueCellFull!15039 (v!18561 V!47505)) (EmptyCell!15039) )
))
(declare-datatypes ((array!80880 0))(
  ( (array!80881 (arr!39006 (Array (_ BitVec 32) ValueCell!15039)) (size!39542 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80880)

(declare-fun e!709915 () Bool)

(declare-fun array_inv!29756 (array!80880) Bool)

(assert (=> start!104912 (and (array_inv!29756 _values!914) e!709915)))

(declare-fun b!1250485 () Bool)

(declare-fun e!709911 () Bool)

(assert (=> b!1250485 (= e!709911 true)))

(declare-datatypes ((tuple2!20442 0))(
  ( (tuple2!20443 (_1!10232 (_ BitVec 64)) (_2!10232 V!47505)) )
))
(declare-datatypes ((List!27683 0))(
  ( (Nil!27680) (Cons!27679 (h!28888 tuple2!20442) (t!41156 List!27683)) )
))
(declare-datatypes ((ListLongMap!18315 0))(
  ( (ListLongMap!18316 (toList!9173 List!27683)) )
))
(declare-fun lt!564254 () ListLongMap!18315)

(declare-fun -!1999 (ListLongMap!18315 (_ BitVec 64)) ListLongMap!18315)

(assert (=> b!1250485 (= (-!1999 lt!564254 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564254)))

(declare-datatypes ((Unit!41537 0))(
  ( (Unit!41538) )
))
(declare-fun lt!564255 () Unit!41537)

(declare-fun removeNotPresentStillSame!94 (ListLongMap!18315 (_ BitVec 64)) Unit!41537)

(assert (=> b!1250485 (= lt!564255 (removeNotPresentStillSame!94 lt!564254 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250486 () Bool)

(declare-fun e!709910 () Bool)

(assert (=> b!1250486 (= e!709910 tp_is_empty!31605)))

(declare-fun b!1250487 () Bool)

(declare-fun res!834101 () Bool)

(assert (=> b!1250487 (=> (not res!834101) (not e!709914))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250487 (= res!834101 (and (= (size!39542 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39541 _keys!1118) (size!39542 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250488 () Bool)

(declare-fun e!709912 () Bool)

(assert (=> b!1250488 (= e!709914 (not e!709912))))

(declare-fun res!834099 () Bool)

(assert (=> b!1250488 (=> res!834099 e!709912)))

(assert (=> b!1250488 (= res!834099 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564253 () ListLongMap!18315)

(declare-fun lt!564256 () ListLongMap!18315)

(assert (=> b!1250488 (= lt!564253 lt!564256)))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!564257 () Unit!41537)

(declare-fun minValueAfter!43 () V!47505)

(declare-fun zeroValue!871 () V!47505)

(declare-fun minValueBefore!43 () V!47505)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!940 (array!80878 array!80880 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47505 V!47505 V!47505 V!47505 (_ BitVec 32) Int) Unit!41537)

(assert (=> b!1250488 (= lt!564257 (lemmaNoChangeToArrayThenSameMapNoExtras!940 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5576 (array!80878 array!80880 (_ BitVec 32) (_ BitVec 32) V!47505 V!47505 (_ BitVec 32) Int) ListLongMap!18315)

(assert (=> b!1250488 (= lt!564256 (getCurrentListMapNoExtraKeys!5576 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250488 (= lt!564253 (getCurrentListMapNoExtraKeys!5576 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49171 () Bool)

(declare-fun mapRes!49171 () Bool)

(declare-fun tp!93602 () Bool)

(declare-fun e!709916 () Bool)

(assert (=> mapNonEmpty!49171 (= mapRes!49171 (and tp!93602 e!709916))))

(declare-fun mapValue!49171 () ValueCell!15039)

(declare-fun mapKey!49171 () (_ BitVec 32))

(declare-fun mapRest!49171 () (Array (_ BitVec 32) ValueCell!15039))

(assert (=> mapNonEmpty!49171 (= (arr!39006 _values!914) (store mapRest!49171 mapKey!49171 mapValue!49171))))

(declare-fun b!1250489 () Bool)

(assert (=> b!1250489 (= e!709915 (and e!709910 mapRes!49171))))

(declare-fun condMapEmpty!49171 () Bool)

(declare-fun mapDefault!49171 () ValueCell!15039)

(assert (=> b!1250489 (= condMapEmpty!49171 (= (arr!39006 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15039)) mapDefault!49171)))))

(declare-fun b!1250490 () Bool)

(assert (=> b!1250490 (= e!709916 tp_is_empty!31605)))

(declare-fun b!1250491 () Bool)

(assert (=> b!1250491 (= e!709912 e!709911)))

(declare-fun res!834100 () Bool)

(assert (=> b!1250491 (=> res!834100 e!709911)))

(declare-fun contains!7487 (ListLongMap!18315 (_ BitVec 64)) Bool)

(assert (=> b!1250491 (= res!834100 (contains!7487 lt!564254 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4448 (array!80878 array!80880 (_ BitVec 32) (_ BitVec 32) V!47505 V!47505 (_ BitVec 32) Int) ListLongMap!18315)

(assert (=> b!1250491 (= lt!564254 (getCurrentListMap!4448 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49171 () Bool)

(assert (=> mapIsEmpty!49171 mapRes!49171))

(assert (= (and start!104912 res!834098) b!1250487))

(assert (= (and b!1250487 res!834101) b!1250484))

(assert (= (and b!1250484 res!834102) b!1250483))

(assert (= (and b!1250483 res!834103) b!1250488))

(assert (= (and b!1250488 (not res!834099)) b!1250491))

(assert (= (and b!1250491 (not res!834100)) b!1250485))

(assert (= (and b!1250489 condMapEmpty!49171) mapIsEmpty!49171))

(assert (= (and b!1250489 (not condMapEmpty!49171)) mapNonEmpty!49171))

(get-info :version)

(assert (= (and mapNonEmpty!49171 ((_ is ValueCellFull!15039) mapValue!49171)) b!1250490))

(assert (= (and b!1250489 ((_ is ValueCellFull!15039) mapDefault!49171)) b!1250486))

(assert (= start!104912 b!1250489))

(declare-fun m!1151311 () Bool)

(assert (=> b!1250488 m!1151311))

(declare-fun m!1151313 () Bool)

(assert (=> b!1250488 m!1151313))

(declare-fun m!1151315 () Bool)

(assert (=> b!1250488 m!1151315))

(declare-fun m!1151317 () Bool)

(assert (=> mapNonEmpty!49171 m!1151317))

(declare-fun m!1151319 () Bool)

(assert (=> b!1250485 m!1151319))

(declare-fun m!1151321 () Bool)

(assert (=> b!1250485 m!1151321))

(declare-fun m!1151323 () Bool)

(assert (=> b!1250491 m!1151323))

(declare-fun m!1151325 () Bool)

(assert (=> b!1250491 m!1151325))

(declare-fun m!1151327 () Bool)

(assert (=> b!1250483 m!1151327))

(declare-fun m!1151329 () Bool)

(assert (=> start!104912 m!1151329))

(declare-fun m!1151331 () Bool)

(assert (=> start!104912 m!1151331))

(declare-fun m!1151333 () Bool)

(assert (=> start!104912 m!1151333))

(declare-fun m!1151335 () Bool)

(assert (=> b!1250484 m!1151335))

(check-sat (not b!1250483) (not start!104912) tp_is_empty!31605 (not b!1250485) b_and!44479 (not b_next!26703) (not b!1250484) (not mapNonEmpty!49171) (not b!1250491) (not b!1250488))
(check-sat b_and!44479 (not b_next!26703))
