; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104742 () Bool)

(assert start!104742)

(declare-fun b_free!26551 () Bool)

(declare-fun b_next!26551 () Bool)

(assert (=> start!104742 (= b_free!26551 (not b_next!26551))))

(declare-fun tp!93143 () Bool)

(declare-fun b_and!44301 () Bool)

(assert (=> start!104742 (= tp!93143 b_and!44301)))

(declare-fun b!1248593 () Bool)

(declare-fun e!708547 () Bool)

(assert (=> b!1248593 (= e!708547 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47303 0))(
  ( (V!47304 (val!15789 Int)) )
))
(declare-fun minValueAfter!43 () V!47303)

(declare-datatypes ((tuple2!20414 0))(
  ( (tuple2!20415 (_1!10218 (_ BitVec 64)) (_2!10218 V!47303)) )
))
(declare-datatypes ((List!27645 0))(
  ( (Nil!27642) (Cons!27641 (h!28850 tuple2!20414) (t!41107 List!27645)) )
))
(declare-datatypes ((ListLongMap!18287 0))(
  ( (ListLongMap!18288 (toList!9159 List!27645)) )
))
(declare-fun lt!563303 () ListLongMap!18287)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47303)

(declare-datatypes ((array!80509 0))(
  ( (array!80510 (arr!38822 (Array (_ BitVec 32) (_ BitVec 64))) (size!39360 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80509)

(declare-datatypes ((ValueCell!14963 0))(
  ( (ValueCellFull!14963 (v!18484 V!47303)) (EmptyCell!14963) )
))
(declare-datatypes ((array!80511 0))(
  ( (array!80512 (arr!38823 (Array (_ BitVec 32) ValueCell!14963)) (size!39361 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80511)

(declare-fun getCurrentListMapNoExtraKeys!5576 (array!80509 array!80511 (_ BitVec 32) (_ BitVec 32) V!47303 V!47303 (_ BitVec 32) Int) ListLongMap!18287)

(assert (=> b!1248593 (= lt!563303 (getCurrentListMapNoExtraKeys!5576 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563302 () ListLongMap!18287)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47303)

(assert (=> b!1248593 (= lt!563302 (getCurrentListMapNoExtraKeys!5576 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248594 () Bool)

(declare-fun res!832991 () Bool)

(assert (=> b!1248594 (=> (not res!832991) (not e!708547))))

(declare-datatypes ((List!27646 0))(
  ( (Nil!27643) (Cons!27642 (h!28851 (_ BitVec 64)) (t!41108 List!27646)) )
))
(declare-fun arrayNoDuplicates!0 (array!80509 (_ BitVec 32) List!27646) Bool)

(assert (=> b!1248594 (= res!832991 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27643))))

(declare-fun b!1248595 () Bool)

(declare-fun res!832990 () Bool)

(assert (=> b!1248595 (=> (not res!832990) (not e!708547))))

(assert (=> b!1248595 (= res!832990 (and (= (size!39361 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39360 _keys!1118) (size!39361 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248596 () Bool)

(declare-fun e!708546 () Bool)

(declare-fun tp_is_empty!31453 () Bool)

(assert (=> b!1248596 (= e!708546 tp_is_empty!31453)))

(declare-fun res!832988 () Bool)

(assert (=> start!104742 (=> (not res!832988) (not e!708547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104742 (= res!832988 (validMask!0 mask!1466))))

(assert (=> start!104742 e!708547))

(assert (=> start!104742 true))

(assert (=> start!104742 tp!93143))

(assert (=> start!104742 tp_is_empty!31453))

(declare-fun array_inv!29763 (array!80509) Bool)

(assert (=> start!104742 (array_inv!29763 _keys!1118)))

(declare-fun e!708543 () Bool)

(declare-fun array_inv!29764 (array!80511) Bool)

(assert (=> start!104742 (and (array_inv!29764 _values!914) e!708543)))

(declare-fun b!1248597 () Bool)

(declare-fun res!832989 () Bool)

(assert (=> b!1248597 (=> (not res!832989) (not e!708547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80509 (_ BitVec 32)) Bool)

(assert (=> b!1248597 (= res!832989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48940 () Bool)

(declare-fun mapRes!48940 () Bool)

(declare-fun tp!93142 () Bool)

(declare-fun e!708545 () Bool)

(assert (=> mapNonEmpty!48940 (= mapRes!48940 (and tp!93142 e!708545))))

(declare-fun mapValue!48940 () ValueCell!14963)

(declare-fun mapRest!48940 () (Array (_ BitVec 32) ValueCell!14963))

(declare-fun mapKey!48940 () (_ BitVec 32))

(assert (=> mapNonEmpty!48940 (= (arr!38823 _values!914) (store mapRest!48940 mapKey!48940 mapValue!48940))))

(declare-fun b!1248598 () Bool)

(assert (=> b!1248598 (= e!708543 (and e!708546 mapRes!48940))))

(declare-fun condMapEmpty!48940 () Bool)

(declare-fun mapDefault!48940 () ValueCell!14963)

(assert (=> b!1248598 (= condMapEmpty!48940 (= (arr!38823 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14963)) mapDefault!48940)))))

(declare-fun b!1248599 () Bool)

(assert (=> b!1248599 (= e!708545 tp_is_empty!31453)))

(declare-fun mapIsEmpty!48940 () Bool)

(assert (=> mapIsEmpty!48940 mapRes!48940))

(assert (= (and start!104742 res!832988) b!1248595))

(assert (= (and b!1248595 res!832990) b!1248597))

(assert (= (and b!1248597 res!832989) b!1248594))

(assert (= (and b!1248594 res!832991) b!1248593))

(assert (= (and b!1248598 condMapEmpty!48940) mapIsEmpty!48940))

(assert (= (and b!1248598 (not condMapEmpty!48940)) mapNonEmpty!48940))

(get-info :version)

(assert (= (and mapNonEmpty!48940 ((_ is ValueCellFull!14963) mapValue!48940)) b!1248599))

(assert (= (and b!1248598 ((_ is ValueCellFull!14963) mapDefault!48940)) b!1248596))

(assert (= start!104742 b!1248598))

(declare-fun m!1149247 () Bool)

(assert (=> b!1248597 m!1149247))

(declare-fun m!1149249 () Bool)

(assert (=> start!104742 m!1149249))

(declare-fun m!1149251 () Bool)

(assert (=> start!104742 m!1149251))

(declare-fun m!1149253 () Bool)

(assert (=> start!104742 m!1149253))

(declare-fun m!1149255 () Bool)

(assert (=> b!1248593 m!1149255))

(declare-fun m!1149257 () Bool)

(assert (=> b!1248593 m!1149257))

(declare-fun m!1149259 () Bool)

(assert (=> b!1248594 m!1149259))

(declare-fun m!1149261 () Bool)

(assert (=> mapNonEmpty!48940 m!1149261))

(check-sat (not b!1248597) tp_is_empty!31453 b_and!44301 (not mapNonEmpty!48940) (not b!1248593) (not b_next!26551) (not start!104742) (not b!1248594))
(check-sat b_and!44301 (not b_next!26551))
