; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105892 () Bool)

(assert start!105892)

(declare-fun b_free!27433 () Bool)

(declare-fun b_next!27433 () Bool)

(assert (=> start!105892 (= b_free!27433 (not b_next!27433))))

(declare-fun tp!95831 () Bool)

(declare-fun b_and!45341 () Bool)

(assert (=> start!105892 (= tp!95831 b_and!45341)))

(declare-fun b!1261294 () Bool)

(declare-fun e!717842 () Bool)

(declare-fun tp_is_empty!32335 () Bool)

(assert (=> b!1261294 (= e!717842 tp_is_empty!32335)))

(declare-fun res!840493 () Bool)

(declare-fun e!717844 () Bool)

(assert (=> start!105892 (=> (not res!840493) (not e!717844))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105892 (= res!840493 (validMask!0 mask!1466))))

(assert (=> start!105892 e!717844))

(assert (=> start!105892 true))

(assert (=> start!105892 tp!95831))

(assert (=> start!105892 tp_is_empty!32335))

(declare-datatypes ((array!82284 0))(
  ( (array!82285 (arr!39695 (Array (_ BitVec 32) (_ BitVec 64))) (size!40231 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82284)

(declare-fun array_inv!30221 (array!82284) Bool)

(assert (=> start!105892 (array_inv!30221 _keys!1118)))

(declare-datatypes ((V!48479 0))(
  ( (V!48480 (val!16230 Int)) )
))
(declare-datatypes ((ValueCell!15404 0))(
  ( (ValueCellFull!15404 (v!18934 V!48479)) (EmptyCell!15404) )
))
(declare-datatypes ((array!82286 0))(
  ( (array!82287 (arr!39696 (Array (_ BitVec 32) ValueCell!15404)) (size!40232 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82286)

(declare-fun e!717841 () Bool)

(declare-fun array_inv!30222 (array!82286) Bool)

(assert (=> start!105892 (and (array_inv!30222 _values!914) e!717841)))

(declare-fun mapIsEmpty!50305 () Bool)

(declare-fun mapRes!50305 () Bool)

(assert (=> mapIsEmpty!50305 mapRes!50305))

(declare-fun mapNonEmpty!50305 () Bool)

(declare-fun tp!95830 () Bool)

(assert (=> mapNonEmpty!50305 (= mapRes!50305 (and tp!95830 e!717842))))

(declare-fun mapKey!50305 () (_ BitVec 32))

(declare-fun mapValue!50305 () ValueCell!15404)

(declare-fun mapRest!50305 () (Array (_ BitVec 32) ValueCell!15404))

(assert (=> mapNonEmpty!50305 (= (arr!39696 _values!914) (store mapRest!50305 mapKey!50305 mapValue!50305))))

(declare-fun b!1261295 () Bool)

(declare-fun res!840492 () Bool)

(assert (=> b!1261295 (=> (not res!840492) (not e!717844))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261295 (= res!840492 (and (= (size!40232 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40231 _keys!1118) (size!40232 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261296 () Bool)

(declare-fun e!717843 () Bool)

(assert (=> b!1261296 (= e!717843 tp_is_empty!32335)))

(declare-fun b!1261297 () Bool)

(declare-fun res!840490 () Bool)

(assert (=> b!1261297 (=> (not res!840490) (not e!717844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82284 (_ BitVec 32)) Bool)

(assert (=> b!1261297 (= res!840490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261298 () Bool)

(declare-fun res!840491 () Bool)

(assert (=> b!1261298 (=> (not res!840491) (not e!717844))))

(declare-datatypes ((List!28200 0))(
  ( (Nil!28197) (Cons!28196 (h!29405 (_ BitVec 64)) (t!41699 List!28200)) )
))
(declare-fun arrayNoDuplicates!0 (array!82284 (_ BitVec 32) List!28200) Bool)

(assert (=> b!1261298 (= res!840491 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28197))))

(declare-fun b!1261299 () Bool)

(assert (=> b!1261299 (= e!717844 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48479)

(declare-fun zeroValue!871 () V!48479)

(declare-datatypes ((tuple2!21002 0))(
  ( (tuple2!21003 (_1!10512 (_ BitVec 64)) (_2!10512 V!48479)) )
))
(declare-datatypes ((List!28201 0))(
  ( (Nil!28198) (Cons!28197 (h!29406 tuple2!21002) (t!41700 List!28201)) )
))
(declare-datatypes ((ListLongMap!18875 0))(
  ( (ListLongMap!18876 (toList!9453 List!28201)) )
))
(declare-fun lt!571587 () ListLongMap!18875)

(declare-fun getCurrentListMapNoExtraKeys!5821 (array!82284 array!82286 (_ BitVec 32) (_ BitVec 32) V!48479 V!48479 (_ BitVec 32) Int) ListLongMap!18875)

(assert (=> b!1261299 (= lt!571587 (getCurrentListMapNoExtraKeys!5821 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48479)

(declare-fun lt!571586 () ListLongMap!18875)

(assert (=> b!1261299 (= lt!571586 (getCurrentListMapNoExtraKeys!5821 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261300 () Bool)

(assert (=> b!1261300 (= e!717841 (and e!717843 mapRes!50305))))

(declare-fun condMapEmpty!50305 () Bool)

(declare-fun mapDefault!50305 () ValueCell!15404)

