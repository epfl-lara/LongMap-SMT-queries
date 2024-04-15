; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104676 () Bool)

(assert start!104676)

(declare-fun b_free!26497 () Bool)

(declare-fun b_next!26497 () Bool)

(assert (=> start!104676 (= b_free!26497 (not b_next!26497))))

(declare-fun tp!92977 () Bool)

(declare-fun b_and!44243 () Bool)

(assert (=> start!104676 (= tp!92977 b_and!44243)))

(declare-fun b!1247953 () Bool)

(declare-fun e!708094 () Bool)

(declare-fun tp_is_empty!31399 () Bool)

(assert (=> b!1247953 (= e!708094 tp_is_empty!31399)))

(declare-fun b!1247954 () Bool)

(declare-fun res!832639 () Bool)

(declare-fun e!708093 () Bool)

(assert (=> b!1247954 (=> (not res!832639) (not e!708093))))

(declare-datatypes ((array!80413 0))(
  ( (array!80414 (arr!38775 (Array (_ BitVec 32) (_ BitVec 64))) (size!39313 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80413)

(declare-datatypes ((List!27614 0))(
  ( (Nil!27611) (Cons!27610 (h!28819 (_ BitVec 64)) (t!41074 List!27614)) )
))
(declare-fun arrayNoDuplicates!0 (array!80413 (_ BitVec 32) List!27614) Bool)

(assert (=> b!1247954 (= res!832639 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27611))))

(declare-fun b!1247955 () Bool)

(declare-fun e!708090 () Bool)

(assert (=> b!1247955 (= e!708090 tp_is_empty!31399)))

(declare-fun b!1247956 () Bool)

(declare-fun res!832638 () Bool)

(assert (=> b!1247956 (=> (not res!832638) (not e!708093))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80413 (_ BitVec 32)) Bool)

(assert (=> b!1247956 (= res!832638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48856 () Bool)

(declare-fun mapRes!48856 () Bool)

(assert (=> mapIsEmpty!48856 mapRes!48856))

(declare-fun b!1247957 () Bool)

(assert (=> b!1247957 (= e!708093 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((V!47231 0))(
  ( (V!47232 (val!15762 Int)) )
))
(declare-fun zeroValue!871 () V!47231)

(declare-datatypes ((ValueCell!14936 0))(
  ( (ValueCellFull!14936 (v!18457 V!47231)) (EmptyCell!14936) )
))
(declare-datatypes ((array!80415 0))(
  ( (array!80416 (arr!38776 (Array (_ BitVec 32) ValueCell!14936)) (size!39314 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80415)

(declare-fun minValueBefore!43 () V!47231)

(declare-datatypes ((tuple2!20388 0))(
  ( (tuple2!20389 (_1!10205 (_ BitVec 64)) (_2!10205 V!47231)) )
))
(declare-datatypes ((List!27615 0))(
  ( (Nil!27612) (Cons!27611 (h!28820 tuple2!20388) (t!41075 List!27615)) )
))
(declare-datatypes ((ListLongMap!18261 0))(
  ( (ListLongMap!18262 (toList!9146 List!27615)) )
))
(declare-fun lt!563171 () ListLongMap!18261)

(declare-fun getCurrentListMapNoExtraKeys!5563 (array!80413 array!80415 (_ BitVec 32) (_ BitVec 32) V!47231 V!47231 (_ BitVec 32) Int) ListLongMap!18261)

(assert (=> b!1247957 (= lt!563171 (getCurrentListMapNoExtraKeys!5563 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1247958 () Bool)

(declare-fun e!708091 () Bool)

(assert (=> b!1247958 (= e!708091 (and e!708090 mapRes!48856))))

(declare-fun condMapEmpty!48856 () Bool)

(declare-fun mapDefault!48856 () ValueCell!14936)

(assert (=> b!1247958 (= condMapEmpty!48856 (= (arr!38776 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14936)) mapDefault!48856)))))

(declare-fun b!1247959 () Bool)

(declare-fun res!832637 () Bool)

(assert (=> b!1247959 (=> (not res!832637) (not e!708093))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247959 (= res!832637 (and (= (size!39314 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39313 _keys!1118) (size!39314 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!48856 () Bool)

(declare-fun tp!92978 () Bool)

(assert (=> mapNonEmpty!48856 (= mapRes!48856 (and tp!92978 e!708094))))

(declare-fun mapValue!48856 () ValueCell!14936)

(declare-fun mapRest!48856 () (Array (_ BitVec 32) ValueCell!14936))

(declare-fun mapKey!48856 () (_ BitVec 32))

(assert (=> mapNonEmpty!48856 (= (arr!38776 _values!914) (store mapRest!48856 mapKey!48856 mapValue!48856))))

(declare-fun res!832640 () Bool)

(assert (=> start!104676 (=> (not res!832640) (not e!708093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104676 (= res!832640 (validMask!0 mask!1466))))

(assert (=> start!104676 e!708093))

(assert (=> start!104676 true))

(assert (=> start!104676 tp!92977))

(assert (=> start!104676 tp_is_empty!31399))

(declare-fun array_inv!29731 (array!80413) Bool)

(assert (=> start!104676 (array_inv!29731 _keys!1118)))

(declare-fun array_inv!29732 (array!80415) Bool)

(assert (=> start!104676 (and (array_inv!29732 _values!914) e!708091)))

(assert (= (and start!104676 res!832640) b!1247959))

(assert (= (and b!1247959 res!832637) b!1247956))

(assert (= (and b!1247956 res!832638) b!1247954))

(assert (= (and b!1247954 res!832639) b!1247957))

(assert (= (and b!1247958 condMapEmpty!48856) mapIsEmpty!48856))

(assert (= (and b!1247958 (not condMapEmpty!48856)) mapNonEmpty!48856))

(get-info :version)

(assert (= (and mapNonEmpty!48856 ((_ is ValueCellFull!14936) mapValue!48856)) b!1247953))

(assert (= (and b!1247958 ((_ is ValueCellFull!14936) mapDefault!48856)) b!1247955))

(assert (= start!104676 b!1247958))

(declare-fun m!1148813 () Bool)

(assert (=> mapNonEmpty!48856 m!1148813))

(declare-fun m!1148815 () Bool)

(assert (=> start!104676 m!1148815))

(declare-fun m!1148817 () Bool)

(assert (=> start!104676 m!1148817))

(declare-fun m!1148819 () Bool)

(assert (=> start!104676 m!1148819))

(declare-fun m!1148821 () Bool)

(assert (=> b!1247956 m!1148821))

(declare-fun m!1148823 () Bool)

(assert (=> b!1247957 m!1148823))

(declare-fun m!1148825 () Bool)

(assert (=> b!1247954 m!1148825))

(check-sat b_and!44243 (not b!1247957) (not b_next!26497) (not start!104676) (not b!1247954) (not b!1247956) tp_is_empty!31399 (not mapNonEmpty!48856))
(check-sat b_and!44243 (not b_next!26497))
