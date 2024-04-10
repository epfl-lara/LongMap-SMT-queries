; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105878 () Bool)

(assert start!105878)

(declare-fun b_free!27419 () Bool)

(declare-fun b_next!27419 () Bool)

(assert (=> start!105878 (= b_free!27419 (not b_next!27419))))

(declare-fun tp!95788 () Bool)

(declare-fun b_and!45327 () Bool)

(assert (=> start!105878 (= tp!95788 b_and!45327)))

(declare-fun b!1261147 () Bool)

(declare-fun res!840406 () Bool)

(declare-fun e!717739 () Bool)

(assert (=> b!1261147 (=> (not res!840406) (not e!717739))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82256 0))(
  ( (array!82257 (arr!39681 (Array (_ BitVec 32) (_ BitVec 64))) (size!40217 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82256)

(declare-datatypes ((V!48459 0))(
  ( (V!48460 (val!16223 Int)) )
))
(declare-datatypes ((ValueCell!15397 0))(
  ( (ValueCellFull!15397 (v!18927 V!48459)) (EmptyCell!15397) )
))
(declare-datatypes ((array!82258 0))(
  ( (array!82259 (arr!39682 (Array (_ BitVec 32) ValueCell!15397)) (size!40218 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82258)

(assert (=> b!1261147 (= res!840406 (and (= (size!40218 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40217 _keys!1118) (size!40218 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50284 () Bool)

(declare-fun mapRes!50284 () Bool)

(declare-fun tp!95789 () Bool)

(declare-fun e!717736 () Bool)

(assert (=> mapNonEmpty!50284 (= mapRes!50284 (and tp!95789 e!717736))))

(declare-fun mapKey!50284 () (_ BitVec 32))

(declare-fun mapValue!50284 () ValueCell!15397)

(declare-fun mapRest!50284 () (Array (_ BitVec 32) ValueCell!15397))

(assert (=> mapNonEmpty!50284 (= (arr!39682 _values!914) (store mapRest!50284 mapKey!50284 mapValue!50284))))

(declare-fun mapIsEmpty!50284 () Bool)

(assert (=> mapIsEmpty!50284 mapRes!50284))

(declare-fun b!1261149 () Bool)

(declare-fun tp_is_empty!32321 () Bool)

(assert (=> b!1261149 (= e!717736 tp_is_empty!32321)))

(declare-fun b!1261150 () Bool)

(assert (=> b!1261150 (= e!717739 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20994 0))(
  ( (tuple2!20995 (_1!10508 (_ BitVec 64)) (_2!10508 V!48459)) )
))
(declare-datatypes ((List!28192 0))(
  ( (Nil!28189) (Cons!28188 (h!29397 tuple2!20994) (t!41691 List!28192)) )
))
(declare-datatypes ((ListLongMap!18867 0))(
  ( (ListLongMap!18868 (toList!9449 List!28192)) )
))
(declare-fun lt!571545 () ListLongMap!18867)

(declare-fun zeroValue!871 () V!48459)

(declare-fun minValueAfter!43 () V!48459)

(declare-fun getCurrentListMapNoExtraKeys!5817 (array!82256 array!82258 (_ BitVec 32) (_ BitVec 32) V!48459 V!48459 (_ BitVec 32) Int) ListLongMap!18867)

(assert (=> b!1261150 (= lt!571545 (getCurrentListMapNoExtraKeys!5817 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571544 () ListLongMap!18867)

(declare-fun minValueBefore!43 () V!48459)

(assert (=> b!1261150 (= lt!571544 (getCurrentListMapNoExtraKeys!5817 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261151 () Bool)

(declare-fun res!840408 () Bool)

(assert (=> b!1261151 (=> (not res!840408) (not e!717739))))

(declare-datatypes ((List!28193 0))(
  ( (Nil!28190) (Cons!28189 (h!29398 (_ BitVec 64)) (t!41692 List!28193)) )
))
(declare-fun arrayNoDuplicates!0 (array!82256 (_ BitVec 32) List!28193) Bool)

(assert (=> b!1261151 (= res!840408 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28190))))

(declare-fun b!1261148 () Bool)

(declare-fun e!717740 () Bool)

(assert (=> b!1261148 (= e!717740 tp_is_empty!32321)))

(declare-fun res!840407 () Bool)

(assert (=> start!105878 (=> (not res!840407) (not e!717739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105878 (= res!840407 (validMask!0 mask!1466))))

(assert (=> start!105878 e!717739))

(assert (=> start!105878 true))

(assert (=> start!105878 tp!95788))

(assert (=> start!105878 tp_is_empty!32321))

(declare-fun array_inv!30211 (array!82256) Bool)

(assert (=> start!105878 (array_inv!30211 _keys!1118)))

(declare-fun e!717737 () Bool)

(declare-fun array_inv!30212 (array!82258) Bool)

(assert (=> start!105878 (and (array_inv!30212 _values!914) e!717737)))

(declare-fun b!1261152 () Bool)

(assert (=> b!1261152 (= e!717737 (and e!717740 mapRes!50284))))

(declare-fun condMapEmpty!50284 () Bool)

(declare-fun mapDefault!50284 () ValueCell!15397)

