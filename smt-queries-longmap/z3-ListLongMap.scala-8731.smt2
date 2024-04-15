; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105876 () Bool)

(assert start!105876)

(declare-fun b_free!27421 () Bool)

(declare-fun b_next!27421 () Bool)

(assert (=> start!105876 (= b_free!27421 (not b_next!27421))))

(declare-fun tp!95794 () Bool)

(declare-fun b_and!45311 () Bool)

(assert (=> start!105876 (= tp!95794 b_and!45311)))

(declare-fun b!1261086 () Bool)

(declare-fun res!840380 () Bool)

(declare-fun e!717709 () Bool)

(assert (=> b!1261086 (=> (not res!840380) (not e!717709))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82185 0))(
  ( (array!82186 (arr!39646 (Array (_ BitVec 32) (_ BitVec 64))) (size!40184 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82185)

(declare-datatypes ((V!48463 0))(
  ( (V!48464 (val!16224 Int)) )
))
(declare-datatypes ((ValueCell!15398 0))(
  ( (ValueCellFull!15398 (v!18927 V!48463)) (EmptyCell!15398) )
))
(declare-datatypes ((array!82187 0))(
  ( (array!82188 (arr!39647 (Array (_ BitVec 32) ValueCell!15398)) (size!40185 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82187)

(assert (=> b!1261086 (= res!840380 (and (= (size!40185 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40184 _keys!1118) (size!40185 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261087 () Bool)

(assert (=> b!1261087 (= e!717709 false)))

(declare-fun minValueAfter!43 () V!48463)

(declare-fun zeroValue!871 () V!48463)

(declare-datatypes ((tuple2!21066 0))(
  ( (tuple2!21067 (_1!10544 (_ BitVec 64)) (_2!10544 V!48463)) )
))
(declare-datatypes ((List!28268 0))(
  ( (Nil!28265) (Cons!28264 (h!29473 tuple2!21066) (t!41758 List!28268)) )
))
(declare-datatypes ((ListLongMap!18939 0))(
  ( (ListLongMap!18940 (toList!9485 List!28268)) )
))
(declare-fun lt!571371 () ListLongMap!18939)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5854 (array!82185 array!82187 (_ BitVec 32) (_ BitVec 32) V!48463 V!48463 (_ BitVec 32) Int) ListLongMap!18939)

(assert (=> b!1261087 (= lt!571371 (getCurrentListMapNoExtraKeys!5854 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571372 () ListLongMap!18939)

(declare-fun minValueBefore!43 () V!48463)

(assert (=> b!1261087 (= lt!571372 (getCurrentListMapNoExtraKeys!5854 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50287 () Bool)

(declare-fun mapRes!50287 () Bool)

(declare-fun tp!95795 () Bool)

(declare-fun e!717706 () Bool)

(assert (=> mapNonEmpty!50287 (= mapRes!50287 (and tp!95795 e!717706))))

(declare-fun mapValue!50287 () ValueCell!15398)

(declare-fun mapKey!50287 () (_ BitVec 32))

(declare-fun mapRest!50287 () (Array (_ BitVec 32) ValueCell!15398))

(assert (=> mapNonEmpty!50287 (= (arr!39647 _values!914) (store mapRest!50287 mapKey!50287 mapValue!50287))))

(declare-fun b!1261088 () Bool)

(declare-fun e!717707 () Bool)

(declare-fun e!717710 () Bool)

(assert (=> b!1261088 (= e!717707 (and e!717710 mapRes!50287))))

(declare-fun condMapEmpty!50287 () Bool)

(declare-fun mapDefault!50287 () ValueCell!15398)

(assert (=> b!1261088 (= condMapEmpty!50287 (= (arr!39647 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15398)) mapDefault!50287)))))

(declare-fun b!1261089 () Bool)

(declare-fun res!840378 () Bool)

(assert (=> b!1261089 (=> (not res!840378) (not e!717709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82185 (_ BitVec 32)) Bool)

(assert (=> b!1261089 (= res!840378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261090 () Bool)

(declare-fun tp_is_empty!32323 () Bool)

(assert (=> b!1261090 (= e!717710 tp_is_empty!32323)))

(declare-fun b!1261091 () Bool)

(assert (=> b!1261091 (= e!717706 tp_is_empty!32323)))

(declare-fun b!1261092 () Bool)

(declare-fun res!840381 () Bool)

(assert (=> b!1261092 (=> (not res!840381) (not e!717709))))

(declare-datatypes ((List!28269 0))(
  ( (Nil!28266) (Cons!28265 (h!29474 (_ BitVec 64)) (t!41759 List!28269)) )
))
(declare-fun arrayNoDuplicates!0 (array!82185 (_ BitVec 32) List!28269) Bool)

(assert (=> b!1261092 (= res!840381 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28266))))

(declare-fun mapIsEmpty!50287 () Bool)

(assert (=> mapIsEmpty!50287 mapRes!50287))

(declare-fun res!840379 () Bool)

(assert (=> start!105876 (=> (not res!840379) (not e!717709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105876 (= res!840379 (validMask!0 mask!1466))))

(assert (=> start!105876 e!717709))

(assert (=> start!105876 true))

(assert (=> start!105876 tp!95794))

(assert (=> start!105876 tp_is_empty!32323))

(declare-fun array_inv!30333 (array!82185) Bool)

(assert (=> start!105876 (array_inv!30333 _keys!1118)))

(declare-fun array_inv!30334 (array!82187) Bool)

(assert (=> start!105876 (and (array_inv!30334 _values!914) e!717707)))

(assert (= (and start!105876 res!840379) b!1261086))

(assert (= (and b!1261086 res!840380) b!1261089))

(assert (= (and b!1261089 res!840378) b!1261092))

(assert (= (and b!1261092 res!840381) b!1261087))

(assert (= (and b!1261088 condMapEmpty!50287) mapIsEmpty!50287))

(assert (= (and b!1261088 (not condMapEmpty!50287)) mapNonEmpty!50287))

(get-info :version)

(assert (= (and mapNonEmpty!50287 ((_ is ValueCellFull!15398) mapValue!50287)) b!1261091))

(assert (= (and b!1261088 ((_ is ValueCellFull!15398) mapDefault!50287)) b!1261090))

(assert (= start!105876 b!1261088))

(declare-fun m!1161337 () Bool)

(assert (=> b!1261092 m!1161337))

(declare-fun m!1161339 () Bool)

(assert (=> mapNonEmpty!50287 m!1161339))

(declare-fun m!1161341 () Bool)

(assert (=> start!105876 m!1161341))

(declare-fun m!1161343 () Bool)

(assert (=> start!105876 m!1161343))

(declare-fun m!1161345 () Bool)

(assert (=> start!105876 m!1161345))

(declare-fun m!1161347 () Bool)

(assert (=> b!1261089 m!1161347))

(declare-fun m!1161349 () Bool)

(assert (=> b!1261087 m!1161349))

(declare-fun m!1161351 () Bool)

(assert (=> b!1261087 m!1161351))

(check-sat (not start!105876) tp_is_empty!32323 (not b_next!27421) (not b!1261092) (not mapNonEmpty!50287) b_and!45311 (not b!1261087) (not b!1261089))
(check-sat b_and!45311 (not b_next!27421))
