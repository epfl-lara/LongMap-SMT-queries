; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105704 () Bool)

(assert start!105704)

(declare-fun b_free!27289 () Bool)

(declare-fun b_next!27289 () Bool)

(assert (=> start!105704 (= b_free!27289 (not b_next!27289))))

(declare-fun tp!95392 () Bool)

(declare-fun b_and!45173 () Bool)

(assert (=> start!105704 (= tp!95392 b_and!45173)))

(declare-fun res!839175 () Bool)

(declare-fun e!716238 () Bool)

(assert (=> start!105704 (=> (not res!839175) (not e!716238))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105704 (= res!839175 (validMask!0 mask!1466))))

(assert (=> start!105704 e!716238))

(assert (=> start!105704 true))

(assert (=> start!105704 tp!95392))

(declare-fun tp_is_empty!32191 () Bool)

(assert (=> start!105704 tp_is_empty!32191))

(declare-datatypes ((array!82000 0))(
  ( (array!82001 (arr!39555 (Array (_ BitVec 32) (_ BitVec 64))) (size!40091 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82000)

(declare-fun array_inv!30119 (array!82000) Bool)

(assert (=> start!105704 (array_inv!30119 _keys!1118)))

(declare-datatypes ((V!48287 0))(
  ( (V!48288 (val!16158 Int)) )
))
(declare-datatypes ((ValueCell!15332 0))(
  ( (ValueCellFull!15332 (v!18860 V!48287)) (EmptyCell!15332) )
))
(declare-datatypes ((array!82002 0))(
  ( (array!82003 (arr!39556 (Array (_ BitVec 32) ValueCell!15332)) (size!40092 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82002)

(declare-fun e!716236 () Bool)

(declare-fun array_inv!30120 (array!82002) Bool)

(assert (=> start!105704 (and (array_inv!30120 _values!914) e!716236)))

(declare-fun b!1259122 () Bool)

(declare-fun e!716240 () Bool)

(assert (=> b!1259122 (= e!716240 tp_is_empty!32191)))

(declare-fun b!1259123 () Bool)

(declare-fun res!839174 () Bool)

(assert (=> b!1259123 (=> (not res!839174) (not e!716238))))

(declare-datatypes ((List!28090 0))(
  ( (Nil!28087) (Cons!28086 (h!29295 (_ BitVec 64)) (t!41585 List!28090)) )
))
(declare-fun arrayNoDuplicates!0 (array!82000 (_ BitVec 32) List!28090) Bool)

(assert (=> b!1259123 (= res!839174 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28087))))

(declare-fun b!1259124 () Bool)

(declare-fun e!716239 () Bool)

(assert (=> b!1259124 (= e!716239 true)))

(declare-datatypes ((tuple2!20880 0))(
  ( (tuple2!20881 (_1!10451 (_ BitVec 64)) (_2!10451 V!48287)) )
))
(declare-datatypes ((List!28091 0))(
  ( (Nil!28088) (Cons!28087 (h!29296 tuple2!20880) (t!41586 List!28091)) )
))
(declare-datatypes ((ListLongMap!18753 0))(
  ( (ListLongMap!18754 (toList!9392 List!28091)) )
))
(declare-fun lt!569719 () ListLongMap!18753)

(declare-fun lt!569722 () ListLongMap!18753)

(declare-fun -!2100 (ListLongMap!18753 (_ BitVec 64)) ListLongMap!18753)

(assert (=> b!1259124 (= lt!569719 (-!2100 lt!569722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569717 () ListLongMap!18753)

(declare-fun lt!569721 () ListLongMap!18753)

(assert (=> b!1259124 (= (-!2100 lt!569717 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569721)))

(declare-datatypes ((Unit!41967 0))(
  ( (Unit!41968) )
))
(declare-fun lt!569720 () Unit!41967)

(declare-fun minValueBefore!43 () V!48287)

(declare-fun addThenRemoveForNewKeyIsSame!337 (ListLongMap!18753 (_ BitVec 64) V!48287) Unit!41967)

(assert (=> b!1259124 (= lt!569720 (addThenRemoveForNewKeyIsSame!337 lt!569721 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716241 () Bool)

(assert (=> b!1259124 e!716241))

(declare-fun res!839171 () Bool)

(assert (=> b!1259124 (=> (not res!839171) (not e!716241))))

(assert (=> b!1259124 (= res!839171 (= lt!569722 lt!569717))))

(declare-fun +!4198 (ListLongMap!18753 tuple2!20880) ListLongMap!18753)

(assert (=> b!1259124 (= lt!569717 (+!4198 lt!569721 (tuple2!20881 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569726 () ListLongMap!18753)

(declare-fun lt!569723 () tuple2!20880)

(assert (=> b!1259124 (= lt!569721 (+!4198 lt!569726 lt!569723))))

(declare-fun zeroValue!871 () V!48287)

(assert (=> b!1259124 (= lt!569723 (tuple2!20881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48287)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!569718 () ListLongMap!18753)

(declare-fun getCurrentListMap!4591 (array!82000 array!82002 (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 (_ BitVec 32) Int) ListLongMap!18753)

(assert (=> b!1259124 (= lt!569718 (getCurrentListMap!4591 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259124 (= lt!569722 (getCurrentListMap!4591 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259125 () Bool)

(assert (=> b!1259125 (= e!716238 (not e!716239))))

(declare-fun res!839170 () Bool)

(assert (=> b!1259125 (=> res!839170 e!716239)))

(assert (=> b!1259125 (= res!839170 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569725 () ListLongMap!18753)

(assert (=> b!1259125 (= lt!569726 lt!569725)))

(declare-fun lt!569724 () Unit!41967)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1133 (array!82000 array!82002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 V!48287 V!48287 (_ BitVec 32) Int) Unit!41967)

(assert (=> b!1259125 (= lt!569724 (lemmaNoChangeToArrayThenSameMapNoExtras!1133 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5769 (array!82000 array!82002 (_ BitVec 32) (_ BitVec 32) V!48287 V!48287 (_ BitVec 32) Int) ListLongMap!18753)

(assert (=> b!1259125 (= lt!569725 (getCurrentListMapNoExtraKeys!5769 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259125 (= lt!569726 (getCurrentListMapNoExtraKeys!5769 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50083 () Bool)

(declare-fun mapRes!50083 () Bool)

(assert (=> mapIsEmpty!50083 mapRes!50083))

(declare-fun b!1259126 () Bool)

(declare-fun res!839173 () Bool)

(assert (=> b!1259126 (=> (not res!839173) (not e!716238))))

(assert (=> b!1259126 (= res!839173 (and (= (size!40092 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40091 _keys!1118) (size!40092 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50083 () Bool)

(declare-fun tp!95393 () Bool)

(assert (=> mapNonEmpty!50083 (= mapRes!50083 (and tp!95393 e!716240))))

(declare-fun mapKey!50083 () (_ BitVec 32))

(declare-fun mapRest!50083 () (Array (_ BitVec 32) ValueCell!15332))

(declare-fun mapValue!50083 () ValueCell!15332)

(assert (=> mapNonEmpty!50083 (= (arr!39556 _values!914) (store mapRest!50083 mapKey!50083 mapValue!50083))))

(declare-fun b!1259127 () Bool)

(declare-fun e!716237 () Bool)

(assert (=> b!1259127 (= e!716236 (and e!716237 mapRes!50083))))

(declare-fun condMapEmpty!50083 () Bool)

(declare-fun mapDefault!50083 () ValueCell!15332)

