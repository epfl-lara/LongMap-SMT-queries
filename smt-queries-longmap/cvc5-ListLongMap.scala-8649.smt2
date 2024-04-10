; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105212 () Bool)

(assert start!105212)

(declare-fun b_free!26929 () Bool)

(declare-fun b_next!26929 () Bool)

(assert (=> start!105212 (= b_free!26929 (not b_next!26929))))

(declare-fun tp!94291 () Bool)

(declare-fun b_and!44743 () Bool)

(assert (=> start!105212 (= tp!94291 b_and!44743)))

(declare-fun b!1253773 () Bool)

(declare-fun e!712326 () Bool)

(assert (=> b!1253773 (= e!712326 true)))

(declare-datatypes ((V!47807 0))(
  ( (V!47808 (val!15978 Int)) )
))
(declare-datatypes ((tuple2!20622 0))(
  ( (tuple2!20623 (_1!10322 (_ BitVec 64)) (_2!10322 V!47807)) )
))
(declare-datatypes ((List!27851 0))(
  ( (Nil!27848) (Cons!27847 (h!29056 tuple2!20622) (t!41332 List!27851)) )
))
(declare-datatypes ((ListLongMap!18495 0))(
  ( (ListLongMap!18496 (toList!9263 List!27851)) )
))
(declare-fun lt!566310 () ListLongMap!18495)

(declare-fun lt!566304 () ListLongMap!18495)

(declare-fun -!2036 (ListLongMap!18495 (_ BitVec 64)) ListLongMap!18495)

(assert (=> b!1253773 (= lt!566310 (-!2036 lt!566304 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566305 () ListLongMap!18495)

(declare-fun lt!566306 () ListLongMap!18495)

(assert (=> b!1253773 (= (-!2036 lt!566305 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566306)))

(declare-datatypes ((Unit!41708 0))(
  ( (Unit!41709) )
))
(declare-fun lt!566309 () Unit!41708)

(declare-fun minValueBefore!43 () V!47807)

(declare-fun addThenRemoveForNewKeyIsSame!306 (ListLongMap!18495 (_ BitVec 64) V!47807) Unit!41708)

(assert (=> b!1253773 (= lt!566309 (addThenRemoveForNewKeyIsSame!306 lt!566306 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566308 () ListLongMap!18495)

(declare-fun lt!566307 () ListLongMap!18495)

(assert (=> b!1253773 (and (= lt!566304 lt!566305) (= lt!566308 lt!566307))))

(declare-fun +!4159 (ListLongMap!18495 tuple2!20622) ListLongMap!18495)

(assert (=> b!1253773 (= lt!566305 (+!4159 lt!566306 (tuple2!20623 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47807)

(declare-datatypes ((array!81318 0))(
  ( (array!81319 (arr!39221 (Array (_ BitVec 32) (_ BitVec 64))) (size!39757 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81318)

(declare-datatypes ((ValueCell!15152 0))(
  ( (ValueCellFull!15152 (v!18676 V!47807)) (EmptyCell!15152) )
))
(declare-datatypes ((array!81320 0))(
  ( (array!81321 (arr!39222 (Array (_ BitVec 32) ValueCell!15152)) (size!39758 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81320)

(declare-fun minValueAfter!43 () V!47807)

(declare-fun getCurrentListMap!4507 (array!81318 array!81320 (_ BitVec 32) (_ BitVec 32) V!47807 V!47807 (_ BitVec 32) Int) ListLongMap!18495)

(assert (=> b!1253773 (= lt!566308 (getCurrentListMap!4507 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253773 (= lt!566304 (getCurrentListMap!4507 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836038 () Bool)

(declare-fun e!712327 () Bool)

(assert (=> start!105212 (=> (not res!836038) (not e!712327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105212 (= res!836038 (validMask!0 mask!1466))))

(assert (=> start!105212 e!712327))

(assert (=> start!105212 true))

(assert (=> start!105212 tp!94291))

(declare-fun tp_is_empty!31831 () Bool)

(assert (=> start!105212 tp_is_empty!31831))

(declare-fun array_inv!29899 (array!81318) Bool)

(assert (=> start!105212 (array_inv!29899 _keys!1118)))

(declare-fun e!712324 () Bool)

(declare-fun array_inv!29900 (array!81320) Bool)

(assert (=> start!105212 (and (array_inv!29900 _values!914) e!712324)))

(declare-fun b!1253774 () Bool)

(declare-fun e!712329 () Bool)

(declare-fun mapRes!49522 () Bool)

(assert (=> b!1253774 (= e!712324 (and e!712329 mapRes!49522))))

(declare-fun condMapEmpty!49522 () Bool)

(declare-fun mapDefault!49522 () ValueCell!15152)

