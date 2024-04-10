; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105520 () Bool)

(assert start!105520)

(declare-fun b_free!27157 () Bool)

(declare-fun b_next!27157 () Bool)

(assert (=> start!105520 (= b_free!27157 (not b_next!27157))))

(declare-fun tp!94988 () Bool)

(declare-fun b_and!45013 () Bool)

(assert (=> start!105520 (= tp!94988 b_and!45013)))

(declare-fun b!1257193 () Bool)

(declare-fun res!838075 () Bool)

(declare-fun e!714846 () Bool)

(assert (=> b!1257193 (=> (not res!838075) (not e!714846))))

(declare-datatypes ((array!81752 0))(
  ( (array!81753 (arr!39434 (Array (_ BitVec 32) (_ BitVec 64))) (size!39970 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81752)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81752 (_ BitVec 32)) Bool)

(assert (=> b!1257193 (= res!838075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49876 () Bool)

(declare-fun mapRes!49876 () Bool)

(declare-fun tp!94987 () Bool)

(declare-fun e!714843 () Bool)

(assert (=> mapNonEmpty!49876 (= mapRes!49876 (and tp!94987 e!714843))))

(declare-datatypes ((V!48111 0))(
  ( (V!48112 (val!16092 Int)) )
))
(declare-datatypes ((ValueCell!15266 0))(
  ( (ValueCellFull!15266 (v!18793 V!48111)) (EmptyCell!15266) )
))
(declare-fun mapRest!49876 () (Array (_ BitVec 32) ValueCell!15266))

(declare-datatypes ((array!81754 0))(
  ( (array!81755 (arr!39435 (Array (_ BitVec 32) ValueCell!15266)) (size!39971 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81754)

(declare-fun mapValue!49876 () ValueCell!15266)

(declare-fun mapKey!49876 () (_ BitVec 32))

(assert (=> mapNonEmpty!49876 (= (arr!39435 _values!914) (store mapRest!49876 mapKey!49876 mapValue!49876))))

(declare-fun b!1257194 () Bool)

(declare-fun e!714848 () Bool)

(declare-fun e!714847 () Bool)

(assert (=> b!1257194 (= e!714848 e!714847)))

(declare-fun res!838077 () Bool)

(assert (=> b!1257194 (=> res!838077 e!714847)))

(declare-datatypes ((tuple2!20790 0))(
  ( (tuple2!20791 (_1!10406 (_ BitVec 64)) (_2!10406 V!48111)) )
))
(declare-datatypes ((List!28005 0))(
  ( (Nil!28002) (Cons!28001 (h!29210 tuple2!20790) (t!41494 List!28005)) )
))
(declare-datatypes ((ListLongMap!18663 0))(
  ( (ListLongMap!18664 (toList!9347 List!28005)) )
))
(declare-fun lt!568573 () ListLongMap!18663)

(declare-fun contains!7563 (ListLongMap!18663 (_ BitVec 64)) Bool)

(assert (=> b!1257194 (= res!838077 (contains!7563 lt!568573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48111)

(declare-fun minValueBefore!43 () V!48111)

(declare-fun getCurrentListMap!4568 (array!81752 array!81754 (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 (_ BitVec 32) Int) ListLongMap!18663)

(assert (=> b!1257194 (= lt!568573 (getCurrentListMap!4568 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838078 () Bool)

(assert (=> start!105520 (=> (not res!838078) (not e!714846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105520 (= res!838078 (validMask!0 mask!1466))))

(assert (=> start!105520 e!714846))

(assert (=> start!105520 true))

(assert (=> start!105520 tp!94988))

(declare-fun tp_is_empty!32059 () Bool)

(assert (=> start!105520 tp_is_empty!32059))

(declare-fun array_inv!30039 (array!81752) Bool)

(assert (=> start!105520 (array_inv!30039 _keys!1118)))

(declare-fun e!714849 () Bool)

(declare-fun array_inv!30040 (array!81754) Bool)

(assert (=> start!105520 (and (array_inv!30040 _values!914) e!714849)))

(declare-fun b!1257195 () Bool)

(assert (=> b!1257195 (= e!714846 (not e!714848))))

(declare-fun res!838076 () Bool)

(assert (=> b!1257195 (=> res!838076 e!714848)))

(assert (=> b!1257195 (= res!838076 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568577 () ListLongMap!18663)

(declare-fun lt!568576 () ListLongMap!18663)

(assert (=> b!1257195 (= lt!568577 lt!568576)))

(declare-datatypes ((Unit!41878 0))(
  ( (Unit!41879) )
))
(declare-fun lt!568575 () Unit!41878)

(declare-fun minValueAfter!43 () V!48111)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1090 (array!81752 array!81754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 V!48111 V!48111 (_ BitVec 32) Int) Unit!41878)

(assert (=> b!1257195 (= lt!568575 (lemmaNoChangeToArrayThenSameMapNoExtras!1090 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5726 (array!81752 array!81754 (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 (_ BitVec 32) Int) ListLongMap!18663)

(assert (=> b!1257195 (= lt!568576 (getCurrentListMapNoExtraKeys!5726 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257195 (= lt!568577 (getCurrentListMapNoExtraKeys!5726 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257196 () Bool)

(assert (=> b!1257196 (= e!714847 (bvsle #b00000000000000000000000000000000 (size!39970 _keys!1118)))))

(declare-fun -!2094 (ListLongMap!18663 (_ BitVec 64)) ListLongMap!18663)

(assert (=> b!1257196 (= (-!2094 lt!568573 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568573)))

(declare-fun lt!568574 () Unit!41878)

(declare-fun removeNotPresentStillSame!147 (ListLongMap!18663 (_ BitVec 64)) Unit!41878)

(assert (=> b!1257196 (= lt!568574 (removeNotPresentStillSame!147 lt!568573 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257197 () Bool)

(declare-fun e!714844 () Bool)

(assert (=> b!1257197 (= e!714849 (and e!714844 mapRes!49876))))

(declare-fun condMapEmpty!49876 () Bool)

(declare-fun mapDefault!49876 () ValueCell!15266)

