; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104904 () Bool)

(assert start!104904)

(declare-fun b_free!26497 () Bool)

(declare-fun b_next!26497 () Bool)

(assert (=> start!104904 (= b_free!26497 (not b_next!26497))))

(declare-fun tp!92978 () Bool)

(declare-fun b_and!44263 () Bool)

(assert (=> start!104904 (= tp!92978 b_and!44263)))

(declare-fun b!1249340 () Bool)

(declare-fun e!708986 () Bool)

(assert (=> b!1249340 (= e!708986 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47231 0))(
  ( (V!47232 (val!15762 Int)) )
))
(declare-fun zeroValue!871 () V!47231)

(declare-datatypes ((array!80523 0))(
  ( (array!80524 (arr!38825 (Array (_ BitVec 32) (_ BitVec 64))) (size!39362 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80523)

(declare-datatypes ((ValueCell!14936 0))(
  ( (ValueCellFull!14936 (v!18454 V!47231)) (EmptyCell!14936) )
))
(declare-datatypes ((array!80525 0))(
  ( (array!80526 (arr!38826 (Array (_ BitVec 32) ValueCell!14936)) (size!39363 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80525)

(declare-datatypes ((tuple2!20316 0))(
  ( (tuple2!20317 (_1!10169 (_ BitVec 64)) (_2!10169 V!47231)) )
))
(declare-datatypes ((List!27572 0))(
  ( (Nil!27569) (Cons!27568 (h!28786 tuple2!20316) (t!41033 List!27572)) )
))
(declare-datatypes ((ListLongMap!18197 0))(
  ( (ListLongMap!18198 (toList!9114 List!27572)) )
))
(declare-fun lt!563834 () ListLongMap!18197)

(declare-fun minValueBefore!43 () V!47231)

(declare-fun getCurrentListMapNoExtraKeys!5549 (array!80523 array!80525 (_ BitVec 32) (_ BitVec 32) V!47231 V!47231 (_ BitVec 32) Int) ListLongMap!18197)

(assert (=> b!1249340 (= lt!563834 (getCurrentListMapNoExtraKeys!5549 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!48856 () Bool)

(declare-fun mapRes!48856 () Bool)

(assert (=> mapIsEmpty!48856 mapRes!48856))

(declare-fun mapNonEmpty!48856 () Bool)

(declare-fun tp!92977 () Bool)

(declare-fun e!708985 () Bool)

(assert (=> mapNonEmpty!48856 (= mapRes!48856 (and tp!92977 e!708985))))

(declare-fun mapKey!48856 () (_ BitVec 32))

(declare-fun mapRest!48856 () (Array (_ BitVec 32) ValueCell!14936))

(declare-fun mapValue!48856 () ValueCell!14936)

(assert (=> mapNonEmpty!48856 (= (arr!38826 _values!914) (store mapRest!48856 mapKey!48856 mapValue!48856))))

(declare-fun b!1249341 () Bool)

(declare-fun e!708982 () Bool)

(declare-fun tp_is_empty!31399 () Bool)

(assert (=> b!1249341 (= e!708982 tp_is_empty!31399)))

(declare-fun b!1249342 () Bool)

(assert (=> b!1249342 (= e!708985 tp_is_empty!31399)))

(declare-fun b!1249343 () Bool)

(declare-fun res!833199 () Bool)

(assert (=> b!1249343 (=> (not res!833199) (not e!708986))))

(declare-datatypes ((List!27573 0))(
  ( (Nil!27570) (Cons!27569 (h!28787 (_ BitVec 64)) (t!41034 List!27573)) )
))
(declare-fun arrayNoDuplicates!0 (array!80523 (_ BitVec 32) List!27573) Bool)

(assert (=> b!1249343 (= res!833199 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27570))))

(declare-fun b!1249344 () Bool)

(declare-fun res!833198 () Bool)

(assert (=> b!1249344 (=> (not res!833198) (not e!708986))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249344 (= res!833198 (and (= (size!39363 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39362 _keys!1118) (size!39363 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833200 () Bool)

(assert (=> start!104904 (=> (not res!833200) (not e!708986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104904 (= res!833200 (validMask!0 mask!1466))))

(assert (=> start!104904 e!708986))

(assert (=> start!104904 true))

(assert (=> start!104904 tp!92978))

(assert (=> start!104904 tp_is_empty!31399))

(declare-fun array_inv!29739 (array!80523) Bool)

(assert (=> start!104904 (array_inv!29739 _keys!1118)))

(declare-fun e!708984 () Bool)

(declare-fun array_inv!29740 (array!80525) Bool)

(assert (=> start!104904 (and (array_inv!29740 _values!914) e!708984)))

(declare-fun b!1249345 () Bool)

(declare-fun res!833197 () Bool)

(assert (=> b!1249345 (=> (not res!833197) (not e!708986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80523 (_ BitVec 32)) Bool)

(assert (=> b!1249345 (= res!833197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249346 () Bool)

(assert (=> b!1249346 (= e!708984 (and e!708982 mapRes!48856))))

(declare-fun condMapEmpty!48856 () Bool)

(declare-fun mapDefault!48856 () ValueCell!14936)

(assert (=> b!1249346 (= condMapEmpty!48856 (= (arr!38826 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14936)) mapDefault!48856)))))

(assert (= (and start!104904 res!833200) b!1249344))

(assert (= (and b!1249344 res!833198) b!1249345))

(assert (= (and b!1249345 res!833197) b!1249343))

(assert (= (and b!1249343 res!833199) b!1249340))

(assert (= (and b!1249346 condMapEmpty!48856) mapIsEmpty!48856))

(assert (= (and b!1249346 (not condMapEmpty!48856)) mapNonEmpty!48856))

(get-info :version)

(assert (= (and mapNonEmpty!48856 ((_ is ValueCellFull!14936) mapValue!48856)) b!1249342))

(assert (= (and b!1249346 ((_ is ValueCellFull!14936) mapDefault!48856)) b!1249341))

(assert (= start!104904 b!1249346))

(declare-fun m!1150945 () Bool)

(assert (=> b!1249343 m!1150945))

(declare-fun m!1150947 () Bool)

(assert (=> b!1249345 m!1150947))

(declare-fun m!1150949 () Bool)

(assert (=> start!104904 m!1150949))

(declare-fun m!1150951 () Bool)

(assert (=> start!104904 m!1150951))

(declare-fun m!1150953 () Bool)

(assert (=> start!104904 m!1150953))

(declare-fun m!1150955 () Bool)

(assert (=> mapNonEmpty!48856 m!1150955))

(declare-fun m!1150957 () Bool)

(assert (=> b!1249340 m!1150957))

(check-sat tp_is_empty!31399 (not mapNonEmpty!48856) (not b!1249343) b_and!44263 (not b!1249345) (not b!1249340) (not start!104904) (not b_next!26497))
(check-sat b_and!44263 (not b_next!26497))
