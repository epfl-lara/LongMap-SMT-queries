; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105578 () Bool)

(assert start!105578)

(declare-fun b_free!27193 () Bool)

(declare-fun b_next!27193 () Bool)

(assert (=> start!105578 (= b_free!27193 (not b_next!27193))))

(declare-fun tp!95099 () Bool)

(declare-fun b_and!45059 () Bool)

(assert (=> start!105578 (= tp!95099 b_and!45059)))

(declare-fun b!1257742 () Bool)

(declare-fun e!715230 () Bool)

(declare-fun tp_is_empty!32095 () Bool)

(assert (=> b!1257742 (= e!715230 tp_is_empty!32095)))

(declare-fun res!838366 () Bool)

(declare-fun e!715228 () Bool)

(assert (=> start!105578 (=> (not res!838366) (not e!715228))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105578 (= res!838366 (validMask!0 mask!1466))))

(assert (=> start!105578 e!715228))

(assert (=> start!105578 true))

(assert (=> start!105578 tp!95099))

(assert (=> start!105578 tp_is_empty!32095))

(declare-datatypes ((array!81822 0))(
  ( (array!81823 (arr!39468 (Array (_ BitVec 32) (_ BitVec 64))) (size!40004 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81822)

(declare-fun array_inv!30063 (array!81822) Bool)

(assert (=> start!105578 (array_inv!30063 _keys!1118)))

(declare-datatypes ((V!48159 0))(
  ( (V!48160 (val!16110 Int)) )
))
(declare-datatypes ((ValueCell!15284 0))(
  ( (ValueCellFull!15284 (v!18812 V!48159)) (EmptyCell!15284) )
))
(declare-datatypes ((array!81824 0))(
  ( (array!81825 (arr!39469 (Array (_ BitVec 32) ValueCell!15284)) (size!40005 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81824)

(declare-fun e!715229 () Bool)

(declare-fun array_inv!30064 (array!81824) Bool)

(assert (=> start!105578 (and (array_inv!30064 _values!914) e!715229)))

(declare-fun b!1257743 () Bool)

(assert (=> b!1257743 (= e!715228 (not true))))

(declare-datatypes ((tuple2!20816 0))(
  ( (tuple2!20817 (_1!10419 (_ BitVec 64)) (_2!10419 V!48159)) )
))
(declare-datatypes ((List!28030 0))(
  ( (Nil!28027) (Cons!28026 (h!29235 tuple2!20816) (t!41521 List!28030)) )
))
(declare-datatypes ((ListLongMap!18689 0))(
  ( (ListLongMap!18690 (toList!9360 List!28030)) )
))
(declare-fun lt!568873 () ListLongMap!18689)

(declare-fun lt!568874 () ListLongMap!18689)

(assert (=> b!1257743 (= lt!568873 lt!568874)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41904 0))(
  ( (Unit!41905) )
))
(declare-fun lt!568875 () Unit!41904)

(declare-fun minValueAfter!43 () V!48159)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48159)

(declare-fun minValueBefore!43 () V!48159)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1102 (array!81822 array!81824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48159 V!48159 V!48159 V!48159 (_ BitVec 32) Int) Unit!41904)

(assert (=> b!1257743 (= lt!568875 (lemmaNoChangeToArrayThenSameMapNoExtras!1102 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5738 (array!81822 array!81824 (_ BitVec 32) (_ BitVec 32) V!48159 V!48159 (_ BitVec 32) Int) ListLongMap!18689)

(assert (=> b!1257743 (= lt!568874 (getCurrentListMapNoExtraKeys!5738 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257743 (= lt!568873 (getCurrentListMapNoExtraKeys!5738 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257744 () Bool)

(declare-fun e!715231 () Bool)

(declare-fun mapRes!49933 () Bool)

(assert (=> b!1257744 (= e!715229 (and e!715231 mapRes!49933))))

(declare-fun condMapEmpty!49933 () Bool)

(declare-fun mapDefault!49933 () ValueCell!15284)

