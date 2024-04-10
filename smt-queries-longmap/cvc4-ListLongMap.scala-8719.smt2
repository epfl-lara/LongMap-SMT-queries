; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105790 () Bool)

(assert start!105790)

(declare-fun b_free!27353 () Bool)

(declare-fun b_next!27353 () Bool)

(assert (=> start!105790 (= b_free!27353 (not b_next!27353))))

(declare-fun tp!95587 () Bool)

(declare-fun b_and!45249 () Bool)

(assert (=> start!105790 (= tp!95587 b_and!45249)))

(declare-datatypes ((V!48371 0))(
  ( (V!48372 (val!16190 Int)) )
))
(declare-datatypes ((tuple2!20940 0))(
  ( (tuple2!20941 (_1!10481 (_ BitVec 64)) (_2!10481 V!48371)) )
))
(declare-datatypes ((List!28141 0))(
  ( (Nil!28138) (Cons!28137 (h!29346 tuple2!20940) (t!41638 List!28141)) )
))
(declare-datatypes ((ListLongMap!18813 0))(
  ( (ListLongMap!18814 (toList!9422 List!28141)) )
))
(declare-fun lt!570825 () ListLongMap!18813)

(declare-fun lt!570829 () ListLongMap!18813)

(declare-fun e!717029 () Bool)

(declare-fun b!1260174 () Bool)

(declare-fun lt!570831 () tuple2!20940)

(declare-fun +!4226 (ListLongMap!18813 tuple2!20940) ListLongMap!18813)

(assert (=> b!1260174 (= e!717029 (= lt!570829 (+!4226 lt!570825 lt!570831)))))

(declare-fun b!1260175 () Bool)

(declare-fun res!839835 () Bool)

(declare-fun e!717030 () Bool)

(assert (=> b!1260175 (=> (not res!839835) (not e!717030))))

(declare-datatypes ((array!82128 0))(
  ( (array!82129 (arr!39618 (Array (_ BitVec 32) (_ BitVec 64))) (size!40154 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82128)

(declare-datatypes ((List!28142 0))(
  ( (Nil!28139) (Cons!28138 (h!29347 (_ BitVec 64)) (t!41639 List!28142)) )
))
(declare-fun arrayNoDuplicates!0 (array!82128 (_ BitVec 32) List!28142) Bool)

(assert (=> b!1260175 (= res!839835 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28139))))

(declare-fun b!1260176 () Bool)

(declare-fun e!717028 () Bool)

(declare-fun tp_is_empty!32255 () Bool)

(assert (=> b!1260176 (= e!717028 tp_is_empty!32255)))

(declare-fun b!1260177 () Bool)

(declare-fun e!717031 () Bool)

(assert (=> b!1260177 (= e!717030 (not e!717031))))

(declare-fun res!839833 () Bool)

(assert (=> b!1260177 (=> res!839833 e!717031)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260177 (= res!839833 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570832 () ListLongMap!18813)

(assert (=> b!1260177 (= lt!570832 lt!570825)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!42029 0))(
  ( (Unit!42030) )
))
(declare-fun lt!570826 () Unit!42029)

(declare-fun minValueAfter!43 () V!48371)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48371)

(declare-datatypes ((ValueCell!15364 0))(
  ( (ValueCellFull!15364 (v!18893 V!48371)) (EmptyCell!15364) )
))
(declare-datatypes ((array!82130 0))(
  ( (array!82131 (arr!39619 (Array (_ BitVec 32) ValueCell!15364)) (size!40155 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82130)

(declare-fun minValueBefore!43 () V!48371)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1159 (array!82128 array!82130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48371 V!48371 V!48371 V!48371 (_ BitVec 32) Int) Unit!42029)

(assert (=> b!1260177 (= lt!570826 (lemmaNoChangeToArrayThenSameMapNoExtras!1159 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5795 (array!82128 array!82130 (_ BitVec 32) (_ BitVec 32) V!48371 V!48371 (_ BitVec 32) Int) ListLongMap!18813)

(assert (=> b!1260177 (= lt!570825 (getCurrentListMapNoExtraKeys!5795 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260177 (= lt!570832 (getCurrentListMapNoExtraKeys!5795 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839837 () Bool)

(assert (=> start!105790 (=> (not res!839837) (not e!717030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105790 (= res!839837 (validMask!0 mask!1466))))

(assert (=> start!105790 e!717030))

(assert (=> start!105790 true))

(assert (=> start!105790 tp!95587))

(assert (=> start!105790 tp_is_empty!32255))

(declare-fun array_inv!30163 (array!82128) Bool)

(assert (=> start!105790 (array_inv!30163 _keys!1118)))

(declare-fun e!717034 () Bool)

(declare-fun array_inv!30164 (array!82130) Bool)

(assert (=> start!105790 (and (array_inv!30164 _values!914) e!717034)))

(declare-fun mapNonEmpty!50182 () Bool)

(declare-fun mapRes!50182 () Bool)

(declare-fun tp!95588 () Bool)

(assert (=> mapNonEmpty!50182 (= mapRes!50182 (and tp!95588 e!717028))))

(declare-fun mapRest!50182 () (Array (_ BitVec 32) ValueCell!15364))

(declare-fun mapKey!50182 () (_ BitVec 32))

(declare-fun mapValue!50182 () ValueCell!15364)

(assert (=> mapNonEmpty!50182 (= (arr!39619 _values!914) (store mapRest!50182 mapKey!50182 mapValue!50182))))

(declare-fun mapIsEmpty!50182 () Bool)

(assert (=> mapIsEmpty!50182 mapRes!50182))

(declare-fun b!1260178 () Bool)

(declare-fun res!839834 () Bool)

(assert (=> b!1260178 (=> (not res!839834) (not e!717030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82128 (_ BitVec 32)) Bool)

(assert (=> b!1260178 (= res!839834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260179 () Bool)

(assert (=> b!1260179 (= e!717031 true)))

(declare-fun lt!570827 () ListLongMap!18813)

(declare-fun lt!570828 () ListLongMap!18813)

(declare-fun -!2128 (ListLongMap!18813 (_ BitVec 64)) ListLongMap!18813)

(assert (=> b!1260179 (= lt!570827 (-!2128 lt!570828 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570824 () ListLongMap!18813)

(declare-fun lt!570823 () ListLongMap!18813)

(assert (=> b!1260179 (= (-!2128 lt!570824 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570823)))

(declare-fun lt!570830 () Unit!42029)

(declare-fun addThenRemoveForNewKeyIsSame!365 (ListLongMap!18813 (_ BitVec 64) V!48371) Unit!42029)

(assert (=> b!1260179 (= lt!570830 (addThenRemoveForNewKeyIsSame!365 lt!570823 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1260179 e!717029))

(declare-fun res!839832 () Bool)

(assert (=> b!1260179 (=> (not res!839832) (not e!717029))))

(assert (=> b!1260179 (= res!839832 (= lt!570828 lt!570824))))

(assert (=> b!1260179 (= lt!570824 (+!4226 lt!570823 (tuple2!20941 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1260179 (= lt!570823 (+!4226 lt!570832 lt!570831))))

(assert (=> b!1260179 (= lt!570831 (tuple2!20941 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4619 (array!82128 array!82130 (_ BitVec 32) (_ BitVec 32) V!48371 V!48371 (_ BitVec 32) Int) ListLongMap!18813)

(assert (=> b!1260179 (= lt!570829 (getCurrentListMap!4619 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260179 (= lt!570828 (getCurrentListMap!4619 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260180 () Bool)

(declare-fun e!717032 () Bool)

(assert (=> b!1260180 (= e!717034 (and e!717032 mapRes!50182))))

(declare-fun condMapEmpty!50182 () Bool)

(declare-fun mapDefault!50182 () ValueCell!15364)

