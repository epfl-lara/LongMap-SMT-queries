; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105768 () Bool)

(assert start!105768)

(declare-fun b_free!27331 () Bool)

(declare-fun b_next!27331 () Bool)

(assert (=> start!105768 (= b_free!27331 (not b_next!27331))))

(declare-fun tp!95521 () Bool)

(declare-fun b_and!45227 () Bool)

(assert (=> start!105768 (= tp!95521 b_and!45227)))

(declare-fun b!1259877 () Bool)

(declare-fun res!839636 () Bool)

(declare-fun e!716803 () Bool)

(assert (=> b!1259877 (=> (not res!839636) (not e!716803))))

(declare-datatypes ((array!82086 0))(
  ( (array!82087 (arr!39597 (Array (_ BitVec 32) (_ BitVec 64))) (size!40133 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82086)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82086 (_ BitVec 32)) Bool)

(assert (=> b!1259877 (= res!839636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259878 () Bool)

(declare-fun e!716798 () Bool)

(assert (=> b!1259878 (= e!716798 true)))

(declare-datatypes ((V!48343 0))(
  ( (V!48344 (val!16179 Int)) )
))
(declare-datatypes ((tuple2!20920 0))(
  ( (tuple2!20921 (_1!10471 (_ BitVec 64)) (_2!10471 V!48343)) )
))
(declare-datatypes ((List!28123 0))(
  ( (Nil!28120) (Cons!28119 (h!29328 tuple2!20920) (t!41620 List!28123)) )
))
(declare-datatypes ((ListLongMap!18793 0))(
  ( (ListLongMap!18794 (toList!9412 List!28123)) )
))
(declare-fun lt!570502 () ListLongMap!18793)

(declare-fun lt!570496 () ListLongMap!18793)

(declare-fun -!2118 (ListLongMap!18793 (_ BitVec 64)) ListLongMap!18793)

(assert (=> b!1259878 (= lt!570502 (-!2118 lt!570496 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570498 () ListLongMap!18793)

(declare-fun lt!570495 () ListLongMap!18793)

(assert (=> b!1259878 (= (-!2118 lt!570498 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570495)))

(declare-datatypes ((Unit!42009 0))(
  ( (Unit!42010) )
))
(declare-fun lt!570499 () Unit!42009)

(declare-fun minValueBefore!43 () V!48343)

(declare-fun addThenRemoveForNewKeyIsSame!355 (ListLongMap!18793 (_ BitVec 64) V!48343) Unit!42009)

(assert (=> b!1259878 (= lt!570499 (addThenRemoveForNewKeyIsSame!355 lt!570495 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716797 () Bool)

(assert (=> b!1259878 e!716797))

(declare-fun res!839637 () Bool)

(assert (=> b!1259878 (=> (not res!839637) (not e!716797))))

(assert (=> b!1259878 (= res!839637 (= lt!570496 lt!570498))))

(declare-fun +!4216 (ListLongMap!18793 tuple2!20920) ListLongMap!18793)

(assert (=> b!1259878 (= lt!570498 (+!4216 lt!570495 (tuple2!20921 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570501 () ListLongMap!18793)

(declare-fun lt!570497 () tuple2!20920)

(assert (=> b!1259878 (= lt!570495 (+!4216 lt!570501 lt!570497))))

(declare-fun zeroValue!871 () V!48343)

(assert (=> b!1259878 (= lt!570497 (tuple2!20921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48343)

(declare-datatypes ((ValueCell!15353 0))(
  ( (ValueCellFull!15353 (v!18882 V!48343)) (EmptyCell!15353) )
))
(declare-datatypes ((array!82088 0))(
  ( (array!82089 (arr!39598 (Array (_ BitVec 32) ValueCell!15353)) (size!40134 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82088)

(declare-fun lt!570493 () ListLongMap!18793)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMap!4609 (array!82086 array!82088 (_ BitVec 32) (_ BitVec 32) V!48343 V!48343 (_ BitVec 32) Int) ListLongMap!18793)

(assert (=> b!1259878 (= lt!570493 (getCurrentListMap!4609 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259878 (= lt!570496 (getCurrentListMap!4609 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259879 () Bool)

(declare-fun e!716802 () Bool)

(declare-fun tp_is_empty!32233 () Bool)

(assert (=> b!1259879 (= e!716802 tp_is_empty!32233)))

(declare-fun b!1259881 () Bool)

(declare-fun lt!570494 () ListLongMap!18793)

(assert (=> b!1259881 (= e!716797 (= lt!570493 (+!4216 lt!570494 lt!570497)))))

(declare-fun b!1259882 () Bool)

(declare-fun res!839635 () Bool)

(assert (=> b!1259882 (=> (not res!839635) (not e!716803))))

(declare-datatypes ((List!28124 0))(
  ( (Nil!28121) (Cons!28120 (h!29329 (_ BitVec 64)) (t!41621 List!28124)) )
))
(declare-fun arrayNoDuplicates!0 (array!82086 (_ BitVec 32) List!28124) Bool)

(assert (=> b!1259882 (= res!839635 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28121))))

(declare-fun mapIsEmpty!50149 () Bool)

(declare-fun mapRes!50149 () Bool)

(assert (=> mapIsEmpty!50149 mapRes!50149))

(declare-fun b!1259883 () Bool)

(declare-fun e!716800 () Bool)

(assert (=> b!1259883 (= e!716800 (and e!716802 mapRes!50149))))

(declare-fun condMapEmpty!50149 () Bool)

(declare-fun mapDefault!50149 () ValueCell!15353)

