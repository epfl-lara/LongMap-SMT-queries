; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105898 () Bool)

(assert start!105898)

(declare-fun b_free!27439 () Bool)

(declare-fun b_next!27439 () Bool)

(assert (=> start!105898 (= b_free!27439 (not b_next!27439))))

(declare-fun tp!95848 () Bool)

(declare-fun b_and!45347 () Bool)

(assert (=> start!105898 (= tp!95848 b_and!45347)))

(declare-fun res!840527 () Bool)

(declare-fun e!717890 () Bool)

(assert (=> start!105898 (=> (not res!840527) (not e!717890))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105898 (= res!840527 (validMask!0 mask!1466))))

(assert (=> start!105898 e!717890))

(assert (=> start!105898 true))

(assert (=> start!105898 tp!95848))

(declare-fun tp_is_empty!32341 () Bool)

(assert (=> start!105898 tp_is_empty!32341))

(declare-datatypes ((array!82296 0))(
  ( (array!82297 (arr!39701 (Array (_ BitVec 32) (_ BitVec 64))) (size!40237 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82296)

(declare-fun array_inv!30227 (array!82296) Bool)

(assert (=> start!105898 (array_inv!30227 _keys!1118)))

(declare-datatypes ((V!48487 0))(
  ( (V!48488 (val!16233 Int)) )
))
(declare-datatypes ((ValueCell!15407 0))(
  ( (ValueCellFull!15407 (v!18937 V!48487)) (EmptyCell!15407) )
))
(declare-datatypes ((array!82298 0))(
  ( (array!82299 (arr!39702 (Array (_ BitVec 32) ValueCell!15407)) (size!40238 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82298)

(declare-fun e!717887 () Bool)

(declare-fun array_inv!30228 (array!82298) Bool)

(assert (=> start!105898 (and (array_inv!30228 _values!914) e!717887)))

(declare-fun b!1261357 () Bool)

(assert (=> b!1261357 (= e!717890 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48487)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48487)

(declare-datatypes ((tuple2!21008 0))(
  ( (tuple2!21009 (_1!10515 (_ BitVec 64)) (_2!10515 V!48487)) )
))
(declare-datatypes ((List!28205 0))(
  ( (Nil!28202) (Cons!28201 (h!29410 tuple2!21008) (t!41704 List!28205)) )
))
(declare-datatypes ((ListLongMap!18881 0))(
  ( (ListLongMap!18882 (toList!9456 List!28205)) )
))
(declare-fun lt!571604 () ListLongMap!18881)

(declare-fun getCurrentListMapNoExtraKeys!5824 (array!82296 array!82298 (_ BitVec 32) (_ BitVec 32) V!48487 V!48487 (_ BitVec 32) Int) ListLongMap!18881)

(assert (=> b!1261357 (= lt!571604 (getCurrentListMapNoExtraKeys!5824 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48487)

(declare-fun lt!571605 () ListLongMap!18881)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261357 (= lt!571605 (getCurrentListMapNoExtraKeys!5824 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261358 () Bool)

(declare-fun res!840529 () Bool)

(assert (=> b!1261358 (=> (not res!840529) (not e!717890))))

(assert (=> b!1261358 (= res!840529 (and (= (size!40238 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40237 _keys!1118) (size!40238 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261359 () Bool)

(declare-fun e!717888 () Bool)

(declare-fun mapRes!50314 () Bool)

(assert (=> b!1261359 (= e!717887 (and e!717888 mapRes!50314))))

(declare-fun condMapEmpty!50314 () Bool)

(declare-fun mapDefault!50314 () ValueCell!15407)

