; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105804 () Bool)

(assert start!105804)

(declare-fun b_free!27367 () Bool)

(declare-fun b_next!27367 () Bool)

(assert (=> start!105804 (= b_free!27367 (not b_next!27367))))

(declare-fun tp!95629 () Bool)

(declare-fun b_and!45263 () Bool)

(assert (=> start!105804 (= tp!95629 b_and!45263)))

(declare-fun b!1260363 () Bool)

(declare-fun e!717176 () Bool)

(assert (=> b!1260363 (= e!717176 true)))

(declare-datatypes ((V!48391 0))(
  ( (V!48392 (val!16197 Int)) )
))
(declare-datatypes ((tuple2!20954 0))(
  ( (tuple2!20955 (_1!10488 (_ BitVec 64)) (_2!10488 V!48391)) )
))
(declare-datatypes ((List!28152 0))(
  ( (Nil!28149) (Cons!28148 (h!29357 tuple2!20954) (t!41649 List!28152)) )
))
(declare-datatypes ((ListLongMap!18827 0))(
  ( (ListLongMap!18828 (toList!9429 List!28152)) )
))
(declare-fun lt!571035 () ListLongMap!18827)

(declare-fun lt!571037 () ListLongMap!18827)

(declare-fun -!2133 (ListLongMap!18827 (_ BitVec 64)) ListLongMap!18827)

(assert (=> b!1260363 (= lt!571035 (-!2133 lt!571037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571034 () ListLongMap!18827)

(declare-fun lt!571041 () ListLongMap!18827)

(assert (=> b!1260363 (= (-!2133 lt!571034 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571041)))

(declare-datatypes ((Unit!42041 0))(
  ( (Unit!42042) )
))
(declare-fun lt!571042 () Unit!42041)

(declare-fun minValueBefore!43 () V!48391)

(declare-fun addThenRemoveForNewKeyIsSame!370 (ListLongMap!18827 (_ BitVec 64) V!48391) Unit!42041)

(assert (=> b!1260363 (= lt!571042 (addThenRemoveForNewKeyIsSame!370 lt!571041 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717179 () Bool)

(assert (=> b!1260363 e!717179))

(declare-fun res!839960 () Bool)

(assert (=> b!1260363 (=> (not res!839960) (not e!717179))))

(assert (=> b!1260363 (= res!839960 (= lt!571037 lt!571034))))

(declare-fun +!4232 (ListLongMap!18827 tuple2!20954) ListLongMap!18827)

(assert (=> b!1260363 (= lt!571034 (+!4232 lt!571041 (tuple2!20955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571038 () ListLongMap!18827)

(declare-fun lt!571040 () tuple2!20954)

(assert (=> b!1260363 (= lt!571041 (+!4232 lt!571038 lt!571040))))

(declare-fun zeroValue!871 () V!48391)

(assert (=> b!1260363 (= lt!571040 (tuple2!20955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82156 0))(
  ( (array!82157 (arr!39632 (Array (_ BitVec 32) (_ BitVec 64))) (size!40168 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82156)

(declare-datatypes ((ValueCell!15371 0))(
  ( (ValueCellFull!15371 (v!18900 V!48391)) (EmptyCell!15371) )
))
(declare-datatypes ((array!82158 0))(
  ( (array!82159 (arr!39633 (Array (_ BitVec 32) ValueCell!15371)) (size!40169 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82158)

(declare-fun minValueAfter!43 () V!48391)

(declare-fun lt!571039 () ListLongMap!18827)

(declare-fun getCurrentListMap!4624 (array!82156 array!82158 (_ BitVec 32) (_ BitVec 32) V!48391 V!48391 (_ BitVec 32) Int) ListLongMap!18827)

(assert (=> b!1260363 (= lt!571039 (getCurrentListMap!4624 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260363 (= lt!571037 (getCurrentListMap!4624 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839958 () Bool)

(declare-fun e!717178 () Bool)

(assert (=> start!105804 (=> (not res!839958) (not e!717178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105804 (= res!839958 (validMask!0 mask!1466))))

(assert (=> start!105804 e!717178))

(assert (=> start!105804 true))

(assert (=> start!105804 tp!95629))

(declare-fun tp_is_empty!32269 () Bool)

(assert (=> start!105804 tp_is_empty!32269))

(declare-fun array_inv!30173 (array!82156) Bool)

(assert (=> start!105804 (array_inv!30173 _keys!1118)))

(declare-fun e!717177 () Bool)

(declare-fun array_inv!30174 (array!82158) Bool)

(assert (=> start!105804 (and (array_inv!30174 _values!914) e!717177)))

(declare-fun mapIsEmpty!50203 () Bool)

(declare-fun mapRes!50203 () Bool)

(assert (=> mapIsEmpty!50203 mapRes!50203))

(declare-fun b!1260364 () Bool)

(declare-fun res!839959 () Bool)

(assert (=> b!1260364 (=> (not res!839959) (not e!717178))))

(declare-datatypes ((List!28153 0))(
  ( (Nil!28150) (Cons!28149 (h!29358 (_ BitVec 64)) (t!41650 List!28153)) )
))
(declare-fun arrayNoDuplicates!0 (array!82156 (_ BitVec 32) List!28153) Bool)

(assert (=> b!1260364 (= res!839959 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28150))))

(declare-fun b!1260365 () Bool)

(declare-fun lt!571036 () ListLongMap!18827)

(assert (=> b!1260365 (= e!717179 (= lt!571039 (+!4232 lt!571036 lt!571040)))))

(declare-fun b!1260366 () Bool)

(declare-fun e!717180 () Bool)

(assert (=> b!1260366 (= e!717177 (and e!717180 mapRes!50203))))

(declare-fun condMapEmpty!50203 () Bool)

(declare-fun mapDefault!50203 () ValueCell!15371)

