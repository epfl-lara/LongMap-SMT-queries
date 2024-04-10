; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105698 () Bool)

(assert start!105698)

(declare-fun b_free!27283 () Bool)

(declare-fun b_next!27283 () Bool)

(assert (=> start!105698 (= b_free!27283 (not b_next!27283))))

(declare-fun tp!95375 () Bool)

(declare-fun b_and!45167 () Bool)

(assert (=> start!105698 (= tp!95375 b_and!45167)))

(declare-fun res!839119 () Bool)

(declare-fun e!716174 () Bool)

(assert (=> start!105698 (=> (not res!839119) (not e!716174))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105698 (= res!839119 (validMask!0 mask!1466))))

(assert (=> start!105698 e!716174))

(assert (=> start!105698 true))

(assert (=> start!105698 tp!95375))

(declare-fun tp_is_empty!32185 () Bool)

(assert (=> start!105698 tp_is_empty!32185))

(declare-datatypes ((array!81988 0))(
  ( (array!81989 (arr!39549 (Array (_ BitVec 32) (_ BitVec 64))) (size!40085 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81988)

(declare-fun array_inv!30113 (array!81988) Bool)

(assert (=> start!105698 (array_inv!30113 _keys!1118)))

(declare-datatypes ((V!48279 0))(
  ( (V!48280 (val!16155 Int)) )
))
(declare-datatypes ((ValueCell!15329 0))(
  ( (ValueCellFull!15329 (v!18857 V!48279)) (EmptyCell!15329) )
))
(declare-datatypes ((array!81990 0))(
  ( (array!81991 (arr!39550 (Array (_ BitVec 32) ValueCell!15329)) (size!40086 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81990)

(declare-fun e!716172 () Bool)

(declare-fun array_inv!30114 (array!81990) Bool)

(assert (=> start!105698 (and (array_inv!30114 _values!914) e!716172)))

(declare-fun b!1259041 () Bool)

(declare-fun e!716175 () Bool)

(assert (=> b!1259041 (= e!716174 (not e!716175))))

(declare-fun res!839120 () Bool)

(assert (=> b!1259041 (=> res!839120 e!716175)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259041 (= res!839120 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20874 0))(
  ( (tuple2!20875 (_1!10448 (_ BitVec 64)) (_2!10448 V!48279)) )
))
(declare-datatypes ((List!28084 0))(
  ( (Nil!28081) (Cons!28080 (h!29289 tuple2!20874) (t!41579 List!28084)) )
))
(declare-datatypes ((ListLongMap!18747 0))(
  ( (ListLongMap!18748 (toList!9389 List!28084)) )
))
(declare-fun lt!569628 () ListLongMap!18747)

(declare-fun lt!569629 () ListLongMap!18747)

(assert (=> b!1259041 (= lt!569628 lt!569629)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48279)

(declare-fun minValueBefore!43 () V!48279)

(declare-datatypes ((Unit!41961 0))(
  ( (Unit!41962) )
))
(declare-fun lt!569632 () Unit!41961)

(declare-fun minValueAfter!43 () V!48279)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1130 (array!81988 array!81990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 V!48279 V!48279 (_ BitVec 32) Int) Unit!41961)

(assert (=> b!1259041 (= lt!569632 (lemmaNoChangeToArrayThenSameMapNoExtras!1130 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5766 (array!81988 array!81990 (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 (_ BitVec 32) Int) ListLongMap!18747)

(assert (=> b!1259041 (= lt!569629 (getCurrentListMapNoExtraKeys!5766 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259041 (= lt!569628 (getCurrentListMapNoExtraKeys!5766 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259042 () Bool)

(declare-fun e!716178 () Bool)

(assert (=> b!1259042 (= e!716178 tp_is_empty!32185)))

(declare-fun b!1259043 () Bool)

(assert (=> b!1259043 (= e!716175 true)))

(declare-fun lt!569634 () ListLongMap!18747)

(declare-fun lt!569630 () ListLongMap!18747)

(declare-fun -!2098 (ListLongMap!18747 (_ BitVec 64)) ListLongMap!18747)

(assert (=> b!1259043 (= lt!569634 (-!2098 lt!569630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569636 () ListLongMap!18747)

(declare-fun lt!569635 () ListLongMap!18747)

(assert (=> b!1259043 (= (-!2098 lt!569636 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569635)))

(declare-fun lt!569633 () Unit!41961)

(declare-fun addThenRemoveForNewKeyIsSame!335 (ListLongMap!18747 (_ BitVec 64) V!48279) Unit!41961)

(assert (=> b!1259043 (= lt!569633 (addThenRemoveForNewKeyIsSame!335 lt!569635 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716177 () Bool)

(assert (=> b!1259043 e!716177))

(declare-fun res!839117 () Bool)

(assert (=> b!1259043 (=> (not res!839117) (not e!716177))))

(assert (=> b!1259043 (= res!839117 (= lt!569630 lt!569636))))

(declare-fun +!4195 (ListLongMap!18747 tuple2!20874) ListLongMap!18747)

(assert (=> b!1259043 (= lt!569636 (+!4195 lt!569635 (tuple2!20875 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569631 () tuple2!20874)

(assert (=> b!1259043 (= lt!569635 (+!4195 lt!569628 lt!569631))))

(assert (=> b!1259043 (= lt!569631 (tuple2!20875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!569627 () ListLongMap!18747)

(declare-fun getCurrentListMap!4589 (array!81988 array!81990 (_ BitVec 32) (_ BitVec 32) V!48279 V!48279 (_ BitVec 32) Int) ListLongMap!18747)

(assert (=> b!1259043 (= lt!569627 (getCurrentListMap!4589 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259043 (= lt!569630 (getCurrentListMap!4589 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50074 () Bool)

(declare-fun mapRes!50074 () Bool)

(declare-fun tp!95374 () Bool)

(assert (=> mapNonEmpty!50074 (= mapRes!50074 (and tp!95374 e!716178))))

(declare-fun mapKey!50074 () (_ BitVec 32))

(declare-fun mapRest!50074 () (Array (_ BitVec 32) ValueCell!15329))

(declare-fun mapValue!50074 () ValueCell!15329)

(assert (=> mapNonEmpty!50074 (= (arr!39550 _values!914) (store mapRest!50074 mapKey!50074 mapValue!50074))))

(declare-fun b!1259044 () Bool)

(declare-fun res!839121 () Bool)

(assert (=> b!1259044 (=> (not res!839121) (not e!716174))))

(declare-datatypes ((List!28085 0))(
  ( (Nil!28082) (Cons!28081 (h!29290 (_ BitVec 64)) (t!41580 List!28085)) )
))
(declare-fun arrayNoDuplicates!0 (array!81988 (_ BitVec 32) List!28085) Bool)

(assert (=> b!1259044 (= res!839121 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28082))))

(declare-fun b!1259045 () Bool)

(declare-fun e!716176 () Bool)

(assert (=> b!1259045 (= e!716172 (and e!716176 mapRes!50074))))

(declare-fun condMapEmpty!50074 () Bool)

(declare-fun mapDefault!50074 () ValueCell!15329)

