; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105860 () Bool)

(assert start!105860)

(declare-fun b_free!27401 () Bool)

(declare-fun b_next!27401 () Bool)

(assert (=> start!105860 (= b_free!27401 (not b_next!27401))))

(declare-fun tp!95734 () Bool)

(declare-fun b_and!45309 () Bool)

(assert (=> start!105860 (= tp!95734 b_and!45309)))

(declare-fun mapIsEmpty!50257 () Bool)

(declare-fun mapRes!50257 () Bool)

(assert (=> mapIsEmpty!50257 mapRes!50257))

(declare-fun res!840298 () Bool)

(declare-fun e!717605 () Bool)

(assert (=> start!105860 (=> (not res!840298) (not e!717605))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105860 (= res!840298 (validMask!0 mask!1466))))

(assert (=> start!105860 e!717605))

(assert (=> start!105860 true))

(assert (=> start!105860 tp!95734))

(declare-fun tp_is_empty!32303 () Bool)

(assert (=> start!105860 tp_is_empty!32303))

(declare-datatypes ((array!82222 0))(
  ( (array!82223 (arr!39664 (Array (_ BitVec 32) (_ BitVec 64))) (size!40200 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82222)

(declare-fun array_inv!30195 (array!82222) Bool)

(assert (=> start!105860 (array_inv!30195 _keys!1118)))

(declare-datatypes ((V!48435 0))(
  ( (V!48436 (val!16214 Int)) )
))
(declare-datatypes ((ValueCell!15388 0))(
  ( (ValueCellFull!15388 (v!18918 V!48435)) (EmptyCell!15388) )
))
(declare-datatypes ((array!82224 0))(
  ( (array!82225 (arr!39665 (Array (_ BitVec 32) ValueCell!15388)) (size!40201 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82224)

(declare-fun e!717603 () Bool)

(declare-fun array_inv!30196 (array!82224) Bool)

(assert (=> start!105860 (and (array_inv!30196 _values!914) e!717603)))

(declare-fun b!1260958 () Bool)

(declare-fun res!840300 () Bool)

(assert (=> b!1260958 (=> (not res!840300) (not e!717605))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1260958 (= res!840300 (and (= (size!40201 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40200 _keys!1118) (size!40201 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260959 () Bool)

(declare-fun res!840301 () Bool)

(assert (=> b!1260959 (=> (not res!840301) (not e!717605))))

(declare-datatypes ((List!28179 0))(
  ( (Nil!28176) (Cons!28175 (h!29384 (_ BitVec 64)) (t!41678 List!28179)) )
))
(declare-fun arrayNoDuplicates!0 (array!82222 (_ BitVec 32) List!28179) Bool)

(assert (=> b!1260959 (= res!840301 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28176))))

(declare-fun b!1260960 () Bool)

(assert (=> b!1260960 (= e!717605 false)))

(declare-datatypes ((tuple2!20982 0))(
  ( (tuple2!20983 (_1!10502 (_ BitVec 64)) (_2!10502 V!48435)) )
))
(declare-datatypes ((List!28180 0))(
  ( (Nil!28177) (Cons!28176 (h!29385 tuple2!20982) (t!41679 List!28180)) )
))
(declare-datatypes ((ListLongMap!18855 0))(
  ( (ListLongMap!18856 (toList!9443 List!28180)) )
))
(declare-fun lt!571490 () ListLongMap!18855)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48435)

(declare-fun zeroValue!871 () V!48435)

(declare-fun getCurrentListMapNoExtraKeys!5811 (array!82222 array!82224 (_ BitVec 32) (_ BitVec 32) V!48435 V!48435 (_ BitVec 32) Int) ListLongMap!18855)

(assert (=> b!1260960 (= lt!571490 (getCurrentListMapNoExtraKeys!5811 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571491 () ListLongMap!18855)

(declare-fun minValueBefore!43 () V!48435)

(assert (=> b!1260960 (= lt!571491 (getCurrentListMapNoExtraKeys!5811 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260961 () Bool)

(declare-fun res!840299 () Bool)

(assert (=> b!1260961 (=> (not res!840299) (not e!717605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82222 (_ BitVec 32)) Bool)

(assert (=> b!1260961 (= res!840299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260962 () Bool)

(declare-fun e!717604 () Bool)

(assert (=> b!1260962 (= e!717604 tp_is_empty!32303)))

(declare-fun b!1260963 () Bool)

(declare-fun e!717601 () Bool)

(assert (=> b!1260963 (= e!717603 (and e!717601 mapRes!50257))))

(declare-fun condMapEmpty!50257 () Bool)

(declare-fun mapDefault!50257 () ValueCell!15388)

