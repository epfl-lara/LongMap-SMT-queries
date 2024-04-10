; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105856 () Bool)

(assert start!105856)

(declare-fun b_free!27397 () Bool)

(declare-fun b_next!27397 () Bool)

(assert (=> start!105856 (= b_free!27397 (not b_next!27397))))

(declare-fun tp!95723 () Bool)

(declare-fun b_and!45305 () Bool)

(assert (=> start!105856 (= tp!95723 b_and!45305)))

(declare-fun mapNonEmpty!50251 () Bool)

(declare-fun mapRes!50251 () Bool)

(declare-fun tp!95722 () Bool)

(declare-fun e!717575 () Bool)

(assert (=> mapNonEmpty!50251 (= mapRes!50251 (and tp!95722 e!717575))))

(declare-datatypes ((V!48431 0))(
  ( (V!48432 (val!16212 Int)) )
))
(declare-datatypes ((ValueCell!15386 0))(
  ( (ValueCellFull!15386 (v!18916 V!48431)) (EmptyCell!15386) )
))
(declare-fun mapValue!50251 () ValueCell!15386)

(declare-datatypes ((array!82214 0))(
  ( (array!82215 (arr!39660 (Array (_ BitVec 32) ValueCell!15386)) (size!40196 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82214)

(declare-fun mapKey!50251 () (_ BitVec 32))

(declare-fun mapRest!50251 () (Array (_ BitVec 32) ValueCell!15386))

(assert (=> mapNonEmpty!50251 (= (arr!39660 _values!914) (store mapRest!50251 mapKey!50251 mapValue!50251))))

(declare-fun res!840276 () Bool)

(declare-fun e!717572 () Bool)

(assert (=> start!105856 (=> (not res!840276) (not e!717572))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105856 (= res!840276 (validMask!0 mask!1466))))

(assert (=> start!105856 e!717572))

(assert (=> start!105856 true))

(assert (=> start!105856 tp!95723))

(declare-fun tp_is_empty!32299 () Bool)

(assert (=> start!105856 tp_is_empty!32299))

(declare-datatypes ((array!82216 0))(
  ( (array!82217 (arr!39661 (Array (_ BitVec 32) (_ BitVec 64))) (size!40197 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82216)

(declare-fun array_inv!30191 (array!82216) Bool)

(assert (=> start!105856 (array_inv!30191 _keys!1118)))

(declare-fun e!717571 () Bool)

(declare-fun array_inv!30192 (array!82214) Bool)

(assert (=> start!105856 (and (array_inv!30192 _values!914) e!717571)))

(declare-fun b!1260916 () Bool)

(assert (=> b!1260916 (= e!717575 tp_is_empty!32299)))

(declare-fun b!1260917 () Bool)

(declare-fun res!840274 () Bool)

(assert (=> b!1260917 (=> (not res!840274) (not e!717572))))

(declare-datatypes ((List!28175 0))(
  ( (Nil!28172) (Cons!28171 (h!29380 (_ BitVec 64)) (t!41674 List!28175)) )
))
(declare-fun arrayNoDuplicates!0 (array!82216 (_ BitVec 32) List!28175) Bool)

(assert (=> b!1260917 (= res!840274 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28172))))

(declare-fun mapIsEmpty!50251 () Bool)

(assert (=> mapIsEmpty!50251 mapRes!50251))

(declare-fun b!1260918 () Bool)

(declare-fun e!717574 () Bool)

(assert (=> b!1260918 (= e!717574 tp_is_empty!32299)))

(declare-fun b!1260919 () Bool)

(declare-fun res!840277 () Bool)

(assert (=> b!1260919 (=> (not res!840277) (not e!717572))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1260919 (= res!840277 (and (= (size!40196 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40197 _keys!1118) (size!40196 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260920 () Bool)

(assert (=> b!1260920 (= e!717572 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48431)

(declare-fun zeroValue!871 () V!48431)

(declare-datatypes ((tuple2!20978 0))(
  ( (tuple2!20979 (_1!10500 (_ BitVec 64)) (_2!10500 V!48431)) )
))
(declare-datatypes ((List!28176 0))(
  ( (Nil!28173) (Cons!28172 (h!29381 tuple2!20978) (t!41675 List!28176)) )
))
(declare-datatypes ((ListLongMap!18851 0))(
  ( (ListLongMap!18852 (toList!9441 List!28176)) )
))
(declare-fun lt!571479 () ListLongMap!18851)

(declare-fun getCurrentListMapNoExtraKeys!5809 (array!82216 array!82214 (_ BitVec 32) (_ BitVec 32) V!48431 V!48431 (_ BitVec 32) Int) ListLongMap!18851)

(assert (=> b!1260920 (= lt!571479 (getCurrentListMapNoExtraKeys!5809 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571478 () ListLongMap!18851)

(declare-fun minValueBefore!43 () V!48431)

(assert (=> b!1260920 (= lt!571478 (getCurrentListMapNoExtraKeys!5809 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260921 () Bool)

(assert (=> b!1260921 (= e!717571 (and e!717574 mapRes!50251))))

(declare-fun condMapEmpty!50251 () Bool)

(declare-fun mapDefault!50251 () ValueCell!15386)

