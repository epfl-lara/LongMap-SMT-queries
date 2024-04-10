; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105872 () Bool)

(assert start!105872)

(declare-fun b_free!27413 () Bool)

(declare-fun b_next!27413 () Bool)

(assert (=> start!105872 (= b_free!27413 (not b_next!27413))))

(declare-fun tp!95770 () Bool)

(declare-fun b_and!45321 () Bool)

(assert (=> start!105872 (= tp!95770 b_and!45321)))

(declare-fun b!1261084 () Bool)

(declare-fun res!840373 () Bool)

(declare-fun e!717695 () Bool)

(assert (=> b!1261084 (=> (not res!840373) (not e!717695))))

(declare-datatypes ((array!82244 0))(
  ( (array!82245 (arr!39675 (Array (_ BitVec 32) (_ BitVec 64))) (size!40211 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82244)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82244 (_ BitVec 32)) Bool)

(assert (=> b!1261084 (= res!840373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261085 () Bool)

(declare-fun res!840371 () Bool)

(assert (=> b!1261085 (=> (not res!840371) (not e!717695))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48451 0))(
  ( (V!48452 (val!16220 Int)) )
))
(declare-datatypes ((ValueCell!15394 0))(
  ( (ValueCellFull!15394 (v!18924 V!48451)) (EmptyCell!15394) )
))
(declare-datatypes ((array!82246 0))(
  ( (array!82247 (arr!39676 (Array (_ BitVec 32) ValueCell!15394)) (size!40212 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82246)

(assert (=> b!1261085 (= res!840371 (and (= (size!40212 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40211 _keys!1118) (size!40212 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50275 () Bool)

(declare-fun mapRes!50275 () Bool)

(declare-fun tp!95771 () Bool)

(declare-fun e!717694 () Bool)

(assert (=> mapNonEmpty!50275 (= mapRes!50275 (and tp!95771 e!717694))))

(declare-fun mapKey!50275 () (_ BitVec 32))

(declare-fun mapValue!50275 () ValueCell!15394)

(declare-fun mapRest!50275 () (Array (_ BitVec 32) ValueCell!15394))

(assert (=> mapNonEmpty!50275 (= (arr!39676 _values!914) (store mapRest!50275 mapKey!50275 mapValue!50275))))

(declare-fun b!1261087 () Bool)

(declare-fun e!717692 () Bool)

(declare-fun tp_is_empty!32315 () Bool)

(assert (=> b!1261087 (= e!717692 tp_is_empty!32315)))

(declare-fun mapIsEmpty!50275 () Bool)

(assert (=> mapIsEmpty!50275 mapRes!50275))

(declare-fun b!1261088 () Bool)

(declare-fun res!840370 () Bool)

(assert (=> b!1261088 (=> (not res!840370) (not e!717695))))

(declare-datatypes ((List!28187 0))(
  ( (Nil!28184) (Cons!28183 (h!29392 (_ BitVec 64)) (t!41686 List!28187)) )
))
(declare-fun arrayNoDuplicates!0 (array!82244 (_ BitVec 32) List!28187) Bool)

(assert (=> b!1261088 (= res!840370 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28184))))

(declare-fun res!840372 () Bool)

(assert (=> start!105872 (=> (not res!840372) (not e!717695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105872 (= res!840372 (validMask!0 mask!1466))))

(assert (=> start!105872 e!717695))

(assert (=> start!105872 true))

(assert (=> start!105872 tp!95770))

(assert (=> start!105872 tp_is_empty!32315))

(declare-fun array_inv!30205 (array!82244) Bool)

(assert (=> start!105872 (array_inv!30205 _keys!1118)))

(declare-fun e!717693 () Bool)

(declare-fun array_inv!30206 (array!82246) Bool)

(assert (=> start!105872 (and (array_inv!30206 _values!914) e!717693)))

(declare-fun b!1261086 () Bool)

(assert (=> b!1261086 (= e!717694 tp_is_empty!32315)))

(declare-fun b!1261089 () Bool)

(assert (=> b!1261089 (= e!717695 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48451)

(declare-fun zeroValue!871 () V!48451)

(declare-datatypes ((tuple2!20990 0))(
  ( (tuple2!20991 (_1!10506 (_ BitVec 64)) (_2!10506 V!48451)) )
))
(declare-datatypes ((List!28188 0))(
  ( (Nil!28185) (Cons!28184 (h!29393 tuple2!20990) (t!41687 List!28188)) )
))
(declare-datatypes ((ListLongMap!18863 0))(
  ( (ListLongMap!18864 (toList!9447 List!28188)) )
))
(declare-fun lt!571527 () ListLongMap!18863)

(declare-fun getCurrentListMapNoExtraKeys!5815 (array!82244 array!82246 (_ BitVec 32) (_ BitVec 32) V!48451 V!48451 (_ BitVec 32) Int) ListLongMap!18863)

(assert (=> b!1261089 (= lt!571527 (getCurrentListMapNoExtraKeys!5815 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48451)

(declare-fun lt!571526 () ListLongMap!18863)

(assert (=> b!1261089 (= lt!571526 (getCurrentListMapNoExtraKeys!5815 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261090 () Bool)

(assert (=> b!1261090 (= e!717693 (and e!717692 mapRes!50275))))

(declare-fun condMapEmpty!50275 () Bool)

(declare-fun mapDefault!50275 () ValueCell!15394)

