; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105888 () Bool)

(assert start!105888)

(declare-fun b_free!27433 () Bool)

(declare-fun b_next!27433 () Bool)

(assert (=> start!105888 (= b_free!27433 (not b_next!27433))))

(declare-fun tp!95831 () Bool)

(declare-fun b_and!45323 () Bool)

(assert (=> start!105888 (= tp!95831 b_and!45323)))

(declare-fun b!1261212 () Bool)

(declare-fun e!717798 () Bool)

(declare-fun tp_is_empty!32335 () Bool)

(assert (=> b!1261212 (= e!717798 tp_is_empty!32335)))

(declare-fun b!1261213 () Bool)

(declare-fun res!840450 () Bool)

(declare-fun e!717800 () Bool)

(assert (=> b!1261213 (=> (not res!840450) (not e!717800))))

(declare-datatypes ((array!82209 0))(
  ( (array!82210 (arr!39658 (Array (_ BitVec 32) (_ BitVec 64))) (size!40196 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82209)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82209 (_ BitVec 32)) Bool)

(assert (=> b!1261213 (= res!840450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261214 () Bool)

(declare-fun res!840452 () Bool)

(assert (=> b!1261214 (=> (not res!840452) (not e!717800))))

(declare-datatypes ((List!28278 0))(
  ( (Nil!28275) (Cons!28274 (h!29483 (_ BitVec 64)) (t!41768 List!28278)) )
))
(declare-fun arrayNoDuplicates!0 (array!82209 (_ BitVec 32) List!28278) Bool)

(assert (=> b!1261214 (= res!840452 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28275))))

(declare-fun b!1261215 () Bool)

(assert (=> b!1261215 (= e!717800 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48479 0))(
  ( (V!48480 (val!16230 Int)) )
))
(declare-fun minValueAfter!43 () V!48479)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48479)

(declare-datatypes ((tuple2!21076 0))(
  ( (tuple2!21077 (_1!10549 (_ BitVec 64)) (_2!10549 V!48479)) )
))
(declare-datatypes ((List!28279 0))(
  ( (Nil!28276) (Cons!28275 (h!29484 tuple2!21076) (t!41769 List!28279)) )
))
(declare-datatypes ((ListLongMap!18949 0))(
  ( (ListLongMap!18950 (toList!9490 List!28279)) )
))
(declare-fun lt!571408 () ListLongMap!18949)

(declare-datatypes ((ValueCell!15404 0))(
  ( (ValueCellFull!15404 (v!18933 V!48479)) (EmptyCell!15404) )
))
(declare-datatypes ((array!82211 0))(
  ( (array!82212 (arr!39659 (Array (_ BitVec 32) ValueCell!15404)) (size!40197 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82211)

(declare-fun getCurrentListMapNoExtraKeys!5859 (array!82209 array!82211 (_ BitVec 32) (_ BitVec 32) V!48479 V!48479 (_ BitVec 32) Int) ListLongMap!18949)

(assert (=> b!1261215 (= lt!571408 (getCurrentListMapNoExtraKeys!5859 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48479)

(declare-fun lt!571407 () ListLongMap!18949)

(assert (=> b!1261215 (= lt!571407 (getCurrentListMapNoExtraKeys!5859 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261216 () Bool)

(declare-fun e!717797 () Bool)

(declare-fun e!717799 () Bool)

(declare-fun mapRes!50305 () Bool)

(assert (=> b!1261216 (= e!717797 (and e!717799 mapRes!50305))))

(declare-fun condMapEmpty!50305 () Bool)

(declare-fun mapDefault!50305 () ValueCell!15404)

(assert (=> b!1261216 (= condMapEmpty!50305 (= (arr!39659 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15404)) mapDefault!50305)))))

(declare-fun mapNonEmpty!50305 () Bool)

(declare-fun tp!95830 () Bool)

(assert (=> mapNonEmpty!50305 (= mapRes!50305 (and tp!95830 e!717798))))

(declare-fun mapRest!50305 () (Array (_ BitVec 32) ValueCell!15404))

(declare-fun mapKey!50305 () (_ BitVec 32))

(declare-fun mapValue!50305 () ValueCell!15404)

(assert (=> mapNonEmpty!50305 (= (arr!39659 _values!914) (store mapRest!50305 mapKey!50305 mapValue!50305))))

(declare-fun mapIsEmpty!50305 () Bool)

(assert (=> mapIsEmpty!50305 mapRes!50305))

(declare-fun res!840453 () Bool)

(assert (=> start!105888 (=> (not res!840453) (not e!717800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105888 (= res!840453 (validMask!0 mask!1466))))

(assert (=> start!105888 e!717800))

(assert (=> start!105888 true))

(assert (=> start!105888 tp!95831))

(assert (=> start!105888 tp_is_empty!32335))

(declare-fun array_inv!30341 (array!82209) Bool)

(assert (=> start!105888 (array_inv!30341 _keys!1118)))

(declare-fun array_inv!30342 (array!82211) Bool)

(assert (=> start!105888 (and (array_inv!30342 _values!914) e!717797)))

(declare-fun b!1261217 () Bool)

(declare-fun res!840451 () Bool)

(assert (=> b!1261217 (=> (not res!840451) (not e!717800))))

(assert (=> b!1261217 (= res!840451 (and (= (size!40197 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40196 _keys!1118) (size!40197 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261218 () Bool)

(assert (=> b!1261218 (= e!717799 tp_is_empty!32335)))

(assert (= (and start!105888 res!840453) b!1261217))

(assert (= (and b!1261217 res!840451) b!1261213))

(assert (= (and b!1261213 res!840450) b!1261214))

(assert (= (and b!1261214 res!840452) b!1261215))

(assert (= (and b!1261216 condMapEmpty!50305) mapIsEmpty!50305))

(assert (= (and b!1261216 (not condMapEmpty!50305)) mapNonEmpty!50305))

(get-info :version)

(assert (= (and mapNonEmpty!50305 ((_ is ValueCellFull!15404) mapValue!50305)) b!1261212))

(assert (= (and b!1261216 ((_ is ValueCellFull!15404) mapDefault!50305)) b!1261218))

(assert (= start!105888 b!1261216))

(declare-fun m!1161433 () Bool)

(assert (=> b!1261214 m!1161433))

(declare-fun m!1161435 () Bool)

(assert (=> b!1261213 m!1161435))

(declare-fun m!1161437 () Bool)

(assert (=> start!105888 m!1161437))

(declare-fun m!1161439 () Bool)

(assert (=> start!105888 m!1161439))

(declare-fun m!1161441 () Bool)

(assert (=> start!105888 m!1161441))

(declare-fun m!1161443 () Bool)

(assert (=> b!1261215 m!1161443))

(declare-fun m!1161445 () Bool)

(assert (=> b!1261215 m!1161445))

(declare-fun m!1161447 () Bool)

(assert (=> mapNonEmpty!50305 m!1161447))

(check-sat b_and!45323 (not b!1261215) (not b!1261213) (not b_next!27433) (not mapNonEmpty!50305) (not b!1261214) tp_is_empty!32335 (not start!105888))
(check-sat b_and!45323 (not b_next!27433))
