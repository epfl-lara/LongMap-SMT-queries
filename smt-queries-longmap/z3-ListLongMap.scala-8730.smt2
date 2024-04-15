; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105870 () Bool)

(assert start!105870)

(declare-fun b_free!27415 () Bool)

(declare-fun b_next!27415 () Bool)

(assert (=> start!105870 (= b_free!27415 (not b_next!27415))))

(declare-fun tp!95777 () Bool)

(declare-fun b_and!45305 () Bool)

(assert (=> start!105870 (= tp!95777 b_and!45305)))

(declare-fun b!1261023 () Bool)

(declare-fun e!717664 () Bool)

(declare-fun tp_is_empty!32317 () Bool)

(assert (=> b!1261023 (= e!717664 tp_is_empty!32317)))

(declare-fun mapIsEmpty!50278 () Bool)

(declare-fun mapRes!50278 () Bool)

(assert (=> mapIsEmpty!50278 mapRes!50278))

(declare-fun b!1261024 () Bool)

(declare-fun res!840345 () Bool)

(declare-fun e!717661 () Bool)

(assert (=> b!1261024 (=> (not res!840345) (not e!717661))))

(declare-datatypes ((array!82175 0))(
  ( (array!82176 (arr!39641 (Array (_ BitVec 32) (_ BitVec 64))) (size!40179 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82175)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82175 (_ BitVec 32)) Bool)

(assert (=> b!1261024 (= res!840345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!840344 () Bool)

(assert (=> start!105870 (=> (not res!840344) (not e!717661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105870 (= res!840344 (validMask!0 mask!1466))))

(assert (=> start!105870 e!717661))

(assert (=> start!105870 true))

(assert (=> start!105870 tp!95777))

(assert (=> start!105870 tp_is_empty!32317))

(declare-fun array_inv!30329 (array!82175) Bool)

(assert (=> start!105870 (array_inv!30329 _keys!1118)))

(declare-datatypes ((V!48455 0))(
  ( (V!48456 (val!16221 Int)) )
))
(declare-datatypes ((ValueCell!15395 0))(
  ( (ValueCellFull!15395 (v!18924 V!48455)) (EmptyCell!15395) )
))
(declare-datatypes ((array!82177 0))(
  ( (array!82178 (arr!39642 (Array (_ BitVec 32) ValueCell!15395)) (size!40180 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82177)

(declare-fun e!717663 () Bool)

(declare-fun array_inv!30330 (array!82177) Bool)

(assert (=> start!105870 (and (array_inv!30330 _values!914) e!717663)))

(declare-fun b!1261025 () Bool)

(assert (=> b!1261025 (= e!717661 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48455)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48455)

(declare-datatypes ((tuple2!21064 0))(
  ( (tuple2!21065 (_1!10543 (_ BitVec 64)) (_2!10543 V!48455)) )
))
(declare-datatypes ((List!28265 0))(
  ( (Nil!28262) (Cons!28261 (h!29470 tuple2!21064) (t!41755 List!28265)) )
))
(declare-datatypes ((ListLongMap!18937 0))(
  ( (ListLongMap!18938 (toList!9484 List!28265)) )
))
(declare-fun lt!571353 () ListLongMap!18937)

(declare-fun getCurrentListMapNoExtraKeys!5853 (array!82175 array!82177 (_ BitVec 32) (_ BitVec 32) V!48455 V!48455 (_ BitVec 32) Int) ListLongMap!18937)

(assert (=> b!1261025 (= lt!571353 (getCurrentListMapNoExtraKeys!5853 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571354 () ListLongMap!18937)

(declare-fun minValueBefore!43 () V!48455)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261025 (= lt!571354 (getCurrentListMapNoExtraKeys!5853 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261026 () Bool)

(declare-fun e!717665 () Bool)

(assert (=> b!1261026 (= e!717663 (and e!717665 mapRes!50278))))

(declare-fun condMapEmpty!50278 () Bool)

(declare-fun mapDefault!50278 () ValueCell!15395)

(assert (=> b!1261026 (= condMapEmpty!50278 (= (arr!39642 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15395)) mapDefault!50278)))))

(declare-fun mapNonEmpty!50278 () Bool)

(declare-fun tp!95776 () Bool)

(assert (=> mapNonEmpty!50278 (= mapRes!50278 (and tp!95776 e!717664))))

(declare-fun mapValue!50278 () ValueCell!15395)

(declare-fun mapRest!50278 () (Array (_ BitVec 32) ValueCell!15395))

(declare-fun mapKey!50278 () (_ BitVec 32))

(assert (=> mapNonEmpty!50278 (= (arr!39642 _values!914) (store mapRest!50278 mapKey!50278 mapValue!50278))))

(declare-fun b!1261027 () Bool)

(declare-fun res!840342 () Bool)

(assert (=> b!1261027 (=> (not res!840342) (not e!717661))))

(declare-datatypes ((List!28266 0))(
  ( (Nil!28263) (Cons!28262 (h!29471 (_ BitVec 64)) (t!41756 List!28266)) )
))
(declare-fun arrayNoDuplicates!0 (array!82175 (_ BitVec 32) List!28266) Bool)

(assert (=> b!1261027 (= res!840342 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28263))))

(declare-fun b!1261028 () Bool)

(assert (=> b!1261028 (= e!717665 tp_is_empty!32317)))

(declare-fun b!1261029 () Bool)

(declare-fun res!840343 () Bool)

(assert (=> b!1261029 (=> (not res!840343) (not e!717661))))

(assert (=> b!1261029 (= res!840343 (and (= (size!40180 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40179 _keys!1118) (size!40180 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105870 res!840344) b!1261029))

(assert (= (and b!1261029 res!840343) b!1261024))

(assert (= (and b!1261024 res!840345) b!1261027))

(assert (= (and b!1261027 res!840342) b!1261025))

(assert (= (and b!1261026 condMapEmpty!50278) mapIsEmpty!50278))

(assert (= (and b!1261026 (not condMapEmpty!50278)) mapNonEmpty!50278))

(get-info :version)

(assert (= (and mapNonEmpty!50278 ((_ is ValueCellFull!15395) mapValue!50278)) b!1261023))

(assert (= (and b!1261026 ((_ is ValueCellFull!15395) mapDefault!50278)) b!1261028))

(assert (= start!105870 b!1261026))

(declare-fun m!1161289 () Bool)

(assert (=> b!1261024 m!1161289))

(declare-fun m!1161291 () Bool)

(assert (=> mapNonEmpty!50278 m!1161291))

(declare-fun m!1161293 () Bool)

(assert (=> b!1261025 m!1161293))

(declare-fun m!1161295 () Bool)

(assert (=> b!1261025 m!1161295))

(declare-fun m!1161297 () Bool)

(assert (=> start!105870 m!1161297))

(declare-fun m!1161299 () Bool)

(assert (=> start!105870 m!1161299))

(declare-fun m!1161301 () Bool)

(assert (=> start!105870 m!1161301))

(declare-fun m!1161303 () Bool)

(assert (=> b!1261027 m!1161303))

(check-sat b_and!45305 (not b!1261025) tp_is_empty!32317 (not mapNonEmpty!50278) (not start!105870) (not b_next!27415) (not b!1261027) (not b!1261024))
(check-sat b_and!45305 (not b_next!27415))
