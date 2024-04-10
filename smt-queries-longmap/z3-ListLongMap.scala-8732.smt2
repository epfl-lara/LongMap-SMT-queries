; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105888 () Bool)

(assert start!105888)

(declare-fun b_free!27429 () Bool)

(declare-fun b_next!27429 () Bool)

(assert (=> start!105888 (= b_free!27429 (not b_next!27429))))

(declare-fun tp!95819 () Bool)

(declare-fun b_and!45337 () Bool)

(assert (=> start!105888 (= tp!95819 b_and!45337)))

(declare-fun b!1261252 () Bool)

(declare-fun e!717814 () Bool)

(assert (=> b!1261252 (= e!717814 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48473 0))(
  ( (V!48474 (val!16228 Int)) )
))
(declare-fun minValueAfter!43 () V!48473)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48473)

(declare-datatypes ((array!82276 0))(
  ( (array!82277 (arr!39691 (Array (_ BitVec 32) (_ BitVec 64))) (size!40227 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82276)

(declare-datatypes ((ValueCell!15402 0))(
  ( (ValueCellFull!15402 (v!18932 V!48473)) (EmptyCell!15402) )
))
(declare-datatypes ((array!82278 0))(
  ( (array!82279 (arr!39692 (Array (_ BitVec 32) ValueCell!15402)) (size!40228 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82278)

(declare-datatypes ((tuple2!21000 0))(
  ( (tuple2!21001 (_1!10511 (_ BitVec 64)) (_2!10511 V!48473)) )
))
(declare-datatypes ((List!28198 0))(
  ( (Nil!28195) (Cons!28194 (h!29403 tuple2!21000) (t!41697 List!28198)) )
))
(declare-datatypes ((ListLongMap!18873 0))(
  ( (ListLongMap!18874 (toList!9452 List!28198)) )
))
(declare-fun lt!571575 () ListLongMap!18873)

(declare-fun getCurrentListMapNoExtraKeys!5820 (array!82276 array!82278 (_ BitVec 32) (_ BitVec 32) V!48473 V!48473 (_ BitVec 32) Int) ListLongMap!18873)

(assert (=> b!1261252 (= lt!571575 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571574 () ListLongMap!18873)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48473)

(assert (=> b!1261252 (= lt!571574 (getCurrentListMapNoExtraKeys!5820 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261253 () Bool)

(declare-fun res!840467 () Bool)

(assert (=> b!1261253 (=> (not res!840467) (not e!717814))))

(assert (=> b!1261253 (= res!840467 (and (= (size!40228 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40227 _keys!1118) (size!40228 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261254 () Bool)

(declare-fun res!840466 () Bool)

(assert (=> b!1261254 (=> (not res!840466) (not e!717814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82276 (_ BitVec 32)) Bool)

(assert (=> b!1261254 (= res!840466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50299 () Bool)

(declare-fun mapRes!50299 () Bool)

(assert (=> mapIsEmpty!50299 mapRes!50299))

(declare-fun res!840468 () Bool)

(assert (=> start!105888 (=> (not res!840468) (not e!717814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105888 (= res!840468 (validMask!0 mask!1466))))

(assert (=> start!105888 e!717814))

(assert (=> start!105888 true))

(assert (=> start!105888 tp!95819))

(declare-fun tp_is_empty!32331 () Bool)

(assert (=> start!105888 tp_is_empty!32331))

(declare-fun array_inv!30217 (array!82276) Bool)

(assert (=> start!105888 (array_inv!30217 _keys!1118)))

(declare-fun e!717811 () Bool)

(declare-fun array_inv!30218 (array!82278) Bool)

(assert (=> start!105888 (and (array_inv!30218 _values!914) e!717811)))

(declare-fun mapNonEmpty!50299 () Bool)

(declare-fun tp!95818 () Bool)

(declare-fun e!717815 () Bool)

(assert (=> mapNonEmpty!50299 (= mapRes!50299 (and tp!95818 e!717815))))

(declare-fun mapRest!50299 () (Array (_ BitVec 32) ValueCell!15402))

(declare-fun mapValue!50299 () ValueCell!15402)

(declare-fun mapKey!50299 () (_ BitVec 32))

(assert (=> mapNonEmpty!50299 (= (arr!39692 _values!914) (store mapRest!50299 mapKey!50299 mapValue!50299))))

(declare-fun b!1261255 () Bool)

(declare-fun res!840469 () Bool)

(assert (=> b!1261255 (=> (not res!840469) (not e!717814))))

(declare-datatypes ((List!28199 0))(
  ( (Nil!28196) (Cons!28195 (h!29404 (_ BitVec 64)) (t!41698 List!28199)) )
))
(declare-fun arrayNoDuplicates!0 (array!82276 (_ BitVec 32) List!28199) Bool)

(assert (=> b!1261255 (= res!840469 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28196))))

(declare-fun b!1261256 () Bool)

(assert (=> b!1261256 (= e!717815 tp_is_empty!32331)))

(declare-fun b!1261257 () Bool)

(declare-fun e!717812 () Bool)

(assert (=> b!1261257 (= e!717811 (and e!717812 mapRes!50299))))

(declare-fun condMapEmpty!50299 () Bool)

(declare-fun mapDefault!50299 () ValueCell!15402)

(assert (=> b!1261257 (= condMapEmpty!50299 (= (arr!39692 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15402)) mapDefault!50299)))))

(declare-fun b!1261258 () Bool)

(assert (=> b!1261258 (= e!717812 tp_is_empty!32331)))

(assert (= (and start!105888 res!840468) b!1261253))

(assert (= (and b!1261253 res!840467) b!1261254))

(assert (= (and b!1261254 res!840466) b!1261255))

(assert (= (and b!1261255 res!840469) b!1261252))

(assert (= (and b!1261257 condMapEmpty!50299) mapIsEmpty!50299))

(assert (= (and b!1261257 (not condMapEmpty!50299)) mapNonEmpty!50299))

(get-info :version)

(assert (= (and mapNonEmpty!50299 ((_ is ValueCellFull!15402) mapValue!50299)) b!1261256))

(assert (= (and b!1261257 ((_ is ValueCellFull!15402) mapDefault!50299)) b!1261258))

(assert (= start!105888 b!1261257))

(declare-fun m!1161921 () Bool)

(assert (=> b!1261255 m!1161921))

(declare-fun m!1161923 () Bool)

(assert (=> mapNonEmpty!50299 m!1161923))

(declare-fun m!1161925 () Bool)

(assert (=> start!105888 m!1161925))

(declare-fun m!1161927 () Bool)

(assert (=> start!105888 m!1161927))

(declare-fun m!1161929 () Bool)

(assert (=> start!105888 m!1161929))

(declare-fun m!1161931 () Bool)

(assert (=> b!1261252 m!1161931))

(declare-fun m!1161933 () Bool)

(assert (=> b!1261252 m!1161933))

(declare-fun m!1161935 () Bool)

(assert (=> b!1261254 m!1161935))

(check-sat b_and!45337 (not b!1261255) (not start!105888) (not b_next!27429) tp_is_empty!32331 (not b!1261252) (not b!1261254) (not mapNonEmpty!50299))
(check-sat b_and!45337 (not b_next!27429))
