; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105702 () Bool)

(assert start!105702)

(declare-fun b_free!27287 () Bool)

(declare-fun b_next!27287 () Bool)

(assert (=> start!105702 (= b_free!27287 (not b_next!27287))))

(declare-fun tp!95387 () Bool)

(declare-fun b_and!45171 () Bool)

(assert (=> start!105702 (= tp!95387 b_and!45171)))

(declare-fun b!1259095 () Bool)

(declare-fun e!716215 () Bool)

(declare-fun e!716218 () Bool)

(assert (=> b!1259095 (= e!716215 (not e!716218))))

(declare-fun res!839156 () Bool)

(assert (=> b!1259095 (=> res!839156 e!716218)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259095 (= res!839156 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48283 0))(
  ( (V!48284 (val!16157 Int)) )
))
(declare-datatypes ((tuple2!20878 0))(
  ( (tuple2!20879 (_1!10450 (_ BitVec 64)) (_2!10450 V!48283)) )
))
(declare-datatypes ((List!28088 0))(
  ( (Nil!28085) (Cons!28084 (h!29293 tuple2!20878) (t!41583 List!28088)) )
))
(declare-datatypes ((ListLongMap!18751 0))(
  ( (ListLongMap!18752 (toList!9391 List!28088)) )
))
(declare-fun lt!569693 () ListLongMap!18751)

(declare-fun lt!569690 () ListLongMap!18751)

(assert (=> b!1259095 (= lt!569693 lt!569690)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41965 0))(
  ( (Unit!41966) )
))
(declare-fun lt!569691 () Unit!41965)

(declare-fun minValueAfter!43 () V!48283)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48283)

(declare-datatypes ((array!81996 0))(
  ( (array!81997 (arr!39553 (Array (_ BitVec 32) (_ BitVec 64))) (size!40089 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81996)

(declare-datatypes ((ValueCell!15331 0))(
  ( (ValueCellFull!15331 (v!18859 V!48283)) (EmptyCell!15331) )
))
(declare-datatypes ((array!81998 0))(
  ( (array!81999 (arr!39554 (Array (_ BitVec 32) ValueCell!15331)) (size!40090 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81998)

(declare-fun minValueBefore!43 () V!48283)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1132 (array!81996 array!81998 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48283 V!48283 V!48283 V!48283 (_ BitVec 32) Int) Unit!41965)

(assert (=> b!1259095 (= lt!569691 (lemmaNoChangeToArrayThenSameMapNoExtras!1132 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5768 (array!81996 array!81998 (_ BitVec 32) (_ BitVec 32) V!48283 V!48283 (_ BitVec 32) Int) ListLongMap!18751)

(assert (=> b!1259095 (= lt!569690 (getCurrentListMapNoExtraKeys!5768 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259095 (= lt!569693 (getCurrentListMapNoExtraKeys!5768 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259096 () Bool)

(declare-fun e!716219 () Bool)

(declare-fun lt!569692 () ListLongMap!18751)

(declare-fun lt!569688 () tuple2!20878)

(declare-fun +!4197 (ListLongMap!18751 tuple2!20878) ListLongMap!18751)

(assert (=> b!1259096 (= e!716219 (= lt!569692 (+!4197 lt!569690 lt!569688)))))

(declare-fun mapNonEmpty!50080 () Bool)

(declare-fun mapRes!50080 () Bool)

(declare-fun tp!95386 () Bool)

(declare-fun e!716220 () Bool)

(assert (=> mapNonEmpty!50080 (= mapRes!50080 (and tp!95386 e!716220))))

(declare-fun mapKey!50080 () (_ BitVec 32))

(declare-fun mapValue!50080 () ValueCell!15331)

(declare-fun mapRest!50080 () (Array (_ BitVec 32) ValueCell!15331))

(assert (=> mapNonEmpty!50080 (= (arr!39554 _values!914) (store mapRest!50080 mapKey!50080 mapValue!50080))))

(declare-fun res!839157 () Bool)

(assert (=> start!105702 (=> (not res!839157) (not e!716215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105702 (= res!839157 (validMask!0 mask!1466))))

(assert (=> start!105702 e!716215))

(assert (=> start!105702 true))

(assert (=> start!105702 tp!95387))

(declare-fun tp_is_empty!32189 () Bool)

(assert (=> start!105702 tp_is_empty!32189))

(declare-fun array_inv!30117 (array!81996) Bool)

(assert (=> start!105702 (array_inv!30117 _keys!1118)))

(declare-fun e!716214 () Bool)

(declare-fun array_inv!30118 (array!81998) Bool)

(assert (=> start!105702 (and (array_inv!30118 _values!914) e!716214)))

(declare-fun b!1259097 () Bool)

(declare-fun res!839154 () Bool)

(assert (=> b!1259097 (=> (not res!839154) (not e!716215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81996 (_ BitVec 32)) Bool)

(assert (=> b!1259097 (= res!839154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259098 () Bool)

(declare-fun res!839155 () Bool)

(assert (=> b!1259098 (=> (not res!839155) (not e!716215))))

(declare-datatypes ((List!28089 0))(
  ( (Nil!28086) (Cons!28085 (h!29294 (_ BitVec 64)) (t!41584 List!28089)) )
))
(declare-fun arrayNoDuplicates!0 (array!81996 (_ BitVec 32) List!28089) Bool)

(assert (=> b!1259098 (= res!839155 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28086))))

(declare-fun b!1259099 () Bool)

(declare-fun res!839152 () Bool)

(assert (=> b!1259099 (=> (not res!839152) (not e!716215))))

(assert (=> b!1259099 (= res!839152 (and (= (size!40090 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40089 _keys!1118) (size!40090 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259100 () Bool)

(assert (=> b!1259100 (= e!716220 tp_is_empty!32189)))

(declare-fun b!1259101 () Bool)

(declare-fun e!716216 () Bool)

(assert (=> b!1259101 (= e!716214 (and e!716216 mapRes!50080))))

(declare-fun condMapEmpty!50080 () Bool)

(declare-fun mapDefault!50080 () ValueCell!15331)

