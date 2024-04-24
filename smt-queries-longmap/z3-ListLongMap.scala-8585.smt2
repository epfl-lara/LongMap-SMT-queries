; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104964 () Bool)

(assert start!104964)

(declare-fun b_free!26545 () Bool)

(declare-fun b_next!26545 () Bool)

(assert (=> start!104964 (= b_free!26545 (not b_next!26545))))

(declare-fun tp!93125 () Bool)

(declare-fun b_and!44315 () Bool)

(assert (=> start!104964 (= tp!93125 b_and!44315)))

(declare-fun b!1249917 () Bool)

(declare-fun res!833515 () Bool)

(declare-fun e!709392 () Bool)

(assert (=> b!1249917 (=> (not res!833515) (not e!709392))))

(declare-datatypes ((array!80619 0))(
  ( (array!80620 (arr!38872 (Array (_ BitVec 32) (_ BitVec 64))) (size!39409 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80619)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80619 (_ BitVec 32)) Bool)

(assert (=> b!1249917 (= res!833515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249918 () Bool)

(declare-fun res!833514 () Bool)

(assert (=> b!1249918 (=> (not res!833514) (not e!709392))))

(declare-datatypes ((List!27610 0))(
  ( (Nil!27607) (Cons!27606 (h!28824 (_ BitVec 64)) (t!41073 List!27610)) )
))
(declare-fun arrayNoDuplicates!0 (array!80619 (_ BitVec 32) List!27610) Bool)

(assert (=> b!1249918 (= res!833514 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27607))))

(declare-fun b!1249919 () Bool)

(declare-fun res!833513 () Bool)

(assert (=> b!1249919 (=> (not res!833513) (not e!709392))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47295 0))(
  ( (V!47296 (val!15786 Int)) )
))
(declare-datatypes ((ValueCell!14960 0))(
  ( (ValueCellFull!14960 (v!18478 V!47295)) (EmptyCell!14960) )
))
(declare-datatypes ((array!80621 0))(
  ( (array!80622 (arr!38873 (Array (_ BitVec 32) ValueCell!14960)) (size!39410 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80621)

(assert (=> b!1249919 (= res!833513 (and (= (size!39410 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39409 _keys!1118) (size!39410 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833512 () Bool)

(assert (=> start!104964 (=> (not res!833512) (not e!709392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104964 (= res!833512 (validMask!0 mask!1466))))

(assert (=> start!104964 e!709392))

(assert (=> start!104964 true))

(assert (=> start!104964 tp!93125))

(declare-fun tp_is_empty!31447 () Bool)

(assert (=> start!104964 tp_is_empty!31447))

(declare-fun array_inv!29777 (array!80619) Bool)

(assert (=> start!104964 (array_inv!29777 _keys!1118)))

(declare-fun e!709394 () Bool)

(declare-fun array_inv!29778 (array!80621) Bool)

(assert (=> start!104964 (and (array_inv!29778 _values!914) e!709394)))

(declare-fun b!1249920 () Bool)

(declare-fun e!709390 () Bool)

(declare-fun mapRes!48931 () Bool)

(assert (=> b!1249920 (= e!709394 (and e!709390 mapRes!48931))))

(declare-fun condMapEmpty!48931 () Bool)

(declare-fun mapDefault!48931 () ValueCell!14960)

(assert (=> b!1249920 (= condMapEmpty!48931 (= (arr!38873 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14960)) mapDefault!48931)))))

(declare-fun b!1249921 () Bool)

(assert (=> b!1249921 (= e!709392 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47295)

(declare-fun zeroValue!871 () V!47295)

(declare-datatypes ((tuple2!20354 0))(
  ( (tuple2!20355 (_1!10188 (_ BitVec 64)) (_2!10188 V!47295)) )
))
(declare-datatypes ((List!27611 0))(
  ( (Nil!27608) (Cons!27607 (h!28825 tuple2!20354) (t!41074 List!27611)) )
))
(declare-datatypes ((ListLongMap!18235 0))(
  ( (ListLongMap!18236 (toList!9133 List!27611)) )
))
(declare-fun lt!563948 () ListLongMap!18235)

(declare-fun getCurrentListMapNoExtraKeys!5568 (array!80619 array!80621 (_ BitVec 32) (_ BitVec 32) V!47295 V!47295 (_ BitVec 32) Int) ListLongMap!18235)

(assert (=> b!1249921 (= lt!563948 (getCurrentListMapNoExtraKeys!5568 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563947 () ListLongMap!18235)

(declare-fun minValueBefore!43 () V!47295)

(assert (=> b!1249921 (= lt!563947 (getCurrentListMapNoExtraKeys!5568 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48931 () Bool)

(declare-fun tp!93124 () Bool)

(declare-fun e!709393 () Bool)

(assert (=> mapNonEmpty!48931 (= mapRes!48931 (and tp!93124 e!709393))))

(declare-fun mapValue!48931 () ValueCell!14960)

(declare-fun mapKey!48931 () (_ BitVec 32))

(declare-fun mapRest!48931 () (Array (_ BitVec 32) ValueCell!14960))

(assert (=> mapNonEmpty!48931 (= (arr!38873 _values!914) (store mapRest!48931 mapKey!48931 mapValue!48931))))

(declare-fun b!1249922 () Bool)

(assert (=> b!1249922 (= e!709390 tp_is_empty!31447)))

(declare-fun mapIsEmpty!48931 () Bool)

(assert (=> mapIsEmpty!48931 mapRes!48931))

(declare-fun b!1249923 () Bool)

(assert (=> b!1249923 (= e!709393 tp_is_empty!31447)))

(assert (= (and start!104964 res!833512) b!1249919))

(assert (= (and b!1249919 res!833513) b!1249917))

(assert (= (and b!1249917 res!833515) b!1249918))

(assert (= (and b!1249918 res!833514) b!1249921))

(assert (= (and b!1249920 condMapEmpty!48931) mapIsEmpty!48931))

(assert (= (and b!1249920 (not condMapEmpty!48931)) mapNonEmpty!48931))

(get-info :version)

(assert (= (and mapNonEmpty!48931 ((_ is ValueCellFull!14960) mapValue!48931)) b!1249923))

(assert (= (and b!1249920 ((_ is ValueCellFull!14960) mapDefault!48931)) b!1249922))

(assert (= start!104964 b!1249920))

(declare-fun m!1151331 () Bool)

(assert (=> b!1249921 m!1151331))

(declare-fun m!1151333 () Bool)

(assert (=> b!1249921 m!1151333))

(declare-fun m!1151335 () Bool)

(assert (=> b!1249917 m!1151335))

(declare-fun m!1151337 () Bool)

(assert (=> start!104964 m!1151337))

(declare-fun m!1151339 () Bool)

(assert (=> start!104964 m!1151339))

(declare-fun m!1151341 () Bool)

(assert (=> start!104964 m!1151341))

(declare-fun m!1151343 () Bool)

(assert (=> b!1249918 m!1151343))

(declare-fun m!1151345 () Bool)

(assert (=> mapNonEmpty!48931 m!1151345))

(check-sat (not b!1249917) (not mapNonEmpty!48931) (not start!104964) tp_is_empty!31447 (not b!1249918) (not b_next!26545) (not b!1249921) b_and!44315)
(check-sat b_and!44315 (not b_next!26545))
