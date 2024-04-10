; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104950 () Bool)

(assert start!104950)

(declare-fun b_free!26719 () Bool)

(declare-fun b_next!26719 () Bool)

(assert (=> start!104950 (= b_free!26719 (not b_next!26719))))

(declare-fun tp!93652 () Bool)

(declare-fun b_and!44505 () Bool)

(assert (=> start!104950 (= tp!93652 b_and!44505)))

(declare-fun b!1250856 () Bool)

(declare-fun e!710184 () Bool)

(declare-fun e!710179 () Bool)

(assert (=> b!1250856 (= e!710184 (not e!710179))))

(declare-fun res!834305 () Bool)

(assert (=> b!1250856 (=> res!834305 e!710179)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250856 (= res!834305 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47527 0))(
  ( (V!47528 (val!15873 Int)) )
))
(declare-datatypes ((tuple2!20456 0))(
  ( (tuple2!20457 (_1!10239 (_ BitVec 64)) (_2!10239 V!47527)) )
))
(declare-datatypes ((List!27695 0))(
  ( (Nil!27692) (Cons!27691 (h!28900 tuple2!20456) (t!41170 List!27695)) )
))
(declare-datatypes ((ListLongMap!18329 0))(
  ( (ListLongMap!18330 (toList!9180 List!27695)) )
))
(declare-fun lt!564500 () ListLongMap!18329)

(declare-fun lt!564501 () ListLongMap!18329)

(assert (=> b!1250856 (= lt!564500 lt!564501)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47527)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47527)

(declare-datatypes ((array!80910 0))(
  ( (array!80911 (arr!39020 (Array (_ BitVec 32) (_ BitVec 64))) (size!39556 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80910)

(declare-datatypes ((ValueCell!15047 0))(
  ( (ValueCellFull!15047 (v!18570 V!47527)) (EmptyCell!15047) )
))
(declare-datatypes ((array!80912 0))(
  ( (array!80913 (arr!39021 (Array (_ BitVec 32) ValueCell!15047)) (size!39557 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80912)

(declare-fun minValueBefore!43 () V!47527)

(declare-datatypes ((Unit!41551 0))(
  ( (Unit!41552) )
))
(declare-fun lt!564499 () Unit!41551)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!944 (array!80910 array!80912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 V!47527 V!47527 (_ BitVec 32) Int) Unit!41551)

(assert (=> b!1250856 (= lt!564499 (lemmaNoChangeToArrayThenSameMapNoExtras!944 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5580 (array!80910 array!80912 (_ BitVec 32) (_ BitVec 32) V!47527 V!47527 (_ BitVec 32) Int) ListLongMap!18329)

(assert (=> b!1250856 (= lt!564501 (getCurrentListMapNoExtraKeys!5580 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250856 (= lt!564500 (getCurrentListMapNoExtraKeys!5580 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!834306 () Bool)

(assert (=> start!104950 (=> (not res!834306) (not e!710184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104950 (= res!834306 (validMask!0 mask!1466))))

(assert (=> start!104950 e!710184))

(assert (=> start!104950 true))

(assert (=> start!104950 tp!93652))

(declare-fun tp_is_empty!31621 () Bool)

(assert (=> start!104950 tp_is_empty!31621))

(declare-fun array_inv!29765 (array!80910) Bool)

(assert (=> start!104950 (array_inv!29765 _keys!1118)))

(declare-fun e!710183 () Bool)

(declare-fun array_inv!29766 (array!80912) Bool)

(assert (=> start!104950 (and (array_inv!29766 _values!914) e!710183)))

(declare-fun b!1250857 () Bool)

(declare-fun e!710181 () Bool)

(assert (=> b!1250857 (= e!710181 tp_is_empty!31621)))

(declare-fun b!1250858 () Bool)

(declare-fun e!710180 () Bool)

(assert (=> b!1250858 (= e!710180 true)))

(declare-fun lt!564497 () ListLongMap!18329)

(declare-fun -!2004 (ListLongMap!18329 (_ BitVec 64)) ListLongMap!18329)

(assert (=> b!1250858 (= (-!2004 lt!564497 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564497)))

(declare-fun lt!564498 () Unit!41551)

(declare-fun removeNotPresentStillSame!99 (ListLongMap!18329 (_ BitVec 64)) Unit!41551)

(assert (=> b!1250858 (= lt!564498 (removeNotPresentStillSame!99 lt!564497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250859 () Bool)

(declare-fun res!834307 () Bool)

(assert (=> b!1250859 (=> (not res!834307) (not e!710184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80910 (_ BitVec 32)) Bool)

(assert (=> b!1250859 (= res!834307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250860 () Bool)

(declare-fun e!710178 () Bool)

(assert (=> b!1250860 (= e!710178 tp_is_empty!31621)))

(declare-fun b!1250861 () Bool)

(declare-fun mapRes!49198 () Bool)

(assert (=> b!1250861 (= e!710183 (and e!710178 mapRes!49198))))

(declare-fun condMapEmpty!49198 () Bool)

(declare-fun mapDefault!49198 () ValueCell!15047)

