; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105714 () Bool)

(assert start!105714)

(declare-fun b_free!27299 () Bool)

(declare-fun b_next!27299 () Bool)

(assert (=> start!105714 (= b_free!27299 (not b_next!27299))))

(declare-fun tp!95422 () Bool)

(declare-fun b_and!45183 () Bool)

(assert (=> start!105714 (= tp!95422 b_and!45183)))

(declare-fun b!1259257 () Bool)

(declare-fun e!716346 () Bool)

(assert (=> b!1259257 (= e!716346 true)))

(declare-datatypes ((V!48299 0))(
  ( (V!48300 (val!16163 Int)) )
))
(declare-datatypes ((tuple2!20890 0))(
  ( (tuple2!20891 (_1!10456 (_ BitVec 64)) (_2!10456 V!48299)) )
))
(declare-datatypes ((List!28098 0))(
  ( (Nil!28095) (Cons!28094 (h!29303 tuple2!20890) (t!41593 List!28098)) )
))
(declare-datatypes ((ListLongMap!18763 0))(
  ( (ListLongMap!18764 (toList!9397 List!28098)) )
))
(declare-fun lt!569873 () ListLongMap!18763)

(declare-fun lt!569874 () ListLongMap!18763)

(declare-fun -!2104 (ListLongMap!18763 (_ BitVec 64)) ListLongMap!18763)

(assert (=> b!1259257 (= lt!569873 (-!2104 lt!569874 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569867 () ListLongMap!18763)

(declare-fun lt!569870 () ListLongMap!18763)

(assert (=> b!1259257 (= (-!2104 lt!569867 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569870)))

(declare-datatypes ((Unit!41977 0))(
  ( (Unit!41978) )
))
(declare-fun lt!569871 () Unit!41977)

(declare-fun minValueBefore!43 () V!48299)

(declare-fun addThenRemoveForNewKeyIsSame!341 (ListLongMap!18763 (_ BitVec 64) V!48299) Unit!41977)

(assert (=> b!1259257 (= lt!569871 (addThenRemoveForNewKeyIsSame!341 lt!569870 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716344 () Bool)

(assert (=> b!1259257 e!716344))

(declare-fun res!839265 () Bool)

(assert (=> b!1259257 (=> (not res!839265) (not e!716344))))

(assert (=> b!1259257 (= res!839265 (= lt!569874 lt!569867))))

(declare-fun +!4202 (ListLongMap!18763 tuple2!20890) ListLongMap!18763)

(assert (=> b!1259257 (= lt!569867 (+!4202 lt!569870 (tuple2!20891 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569872 () ListLongMap!18763)

(declare-fun lt!569869 () tuple2!20890)

(assert (=> b!1259257 (= lt!569870 (+!4202 lt!569872 lt!569869))))

(declare-fun zeroValue!871 () V!48299)

(assert (=> b!1259257 (= lt!569869 (tuple2!20891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48299)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82020 0))(
  ( (array!82021 (arr!39565 (Array (_ BitVec 32) (_ BitVec 64))) (size!40101 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82020)

(declare-datatypes ((ValueCell!15337 0))(
  ( (ValueCellFull!15337 (v!18865 V!48299)) (EmptyCell!15337) )
))
(declare-datatypes ((array!82022 0))(
  ( (array!82023 (arr!39566 (Array (_ BitVec 32) ValueCell!15337)) (size!40102 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82022)

(declare-fun lt!569868 () ListLongMap!18763)

(declare-fun getCurrentListMap!4595 (array!82020 array!82022 (_ BitVec 32) (_ BitVec 32) V!48299 V!48299 (_ BitVec 32) Int) ListLongMap!18763)

(assert (=> b!1259257 (= lt!569868 (getCurrentListMap!4595 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259257 (= lt!569874 (getCurrentListMap!4595 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259258 () Bool)

(declare-fun e!716342 () Bool)

(assert (=> b!1259258 (= e!716342 (not e!716346))))

(declare-fun res!839263 () Bool)

(assert (=> b!1259258 (=> res!839263 e!716346)))

(assert (=> b!1259258 (= res!839263 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569875 () ListLongMap!18763)

(assert (=> b!1259258 (= lt!569872 lt!569875)))

(declare-fun lt!569876 () Unit!41977)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1137 (array!82020 array!82022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48299 V!48299 V!48299 V!48299 (_ BitVec 32) Int) Unit!41977)

(assert (=> b!1259258 (= lt!569876 (lemmaNoChangeToArrayThenSameMapNoExtras!1137 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5773 (array!82020 array!82022 (_ BitVec 32) (_ BitVec 32) V!48299 V!48299 (_ BitVec 32) Int) ListLongMap!18763)

(assert (=> b!1259258 (= lt!569875 (getCurrentListMapNoExtraKeys!5773 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259258 (= lt!569872 (getCurrentListMapNoExtraKeys!5773 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259259 () Bool)

(declare-fun e!716341 () Bool)

(declare-fun tp_is_empty!32201 () Bool)

(assert (=> b!1259259 (= e!716341 tp_is_empty!32201)))

(declare-fun mapNonEmpty!50098 () Bool)

(declare-fun mapRes!50098 () Bool)

(declare-fun tp!95423 () Bool)

(declare-fun e!716340 () Bool)

(assert (=> mapNonEmpty!50098 (= mapRes!50098 (and tp!95423 e!716340))))

(declare-fun mapRest!50098 () (Array (_ BitVec 32) ValueCell!15337))

(declare-fun mapValue!50098 () ValueCell!15337)

(declare-fun mapKey!50098 () (_ BitVec 32))

(assert (=> mapNonEmpty!50098 (= (arr!39566 _values!914) (store mapRest!50098 mapKey!50098 mapValue!50098))))

(declare-fun b!1259260 () Bool)

(declare-fun res!839261 () Bool)

(assert (=> b!1259260 (=> (not res!839261) (not e!716342))))

(declare-datatypes ((List!28099 0))(
  ( (Nil!28096) (Cons!28095 (h!29304 (_ BitVec 64)) (t!41594 List!28099)) )
))
(declare-fun arrayNoDuplicates!0 (array!82020 (_ BitVec 32) List!28099) Bool)

(assert (=> b!1259260 (= res!839261 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28096))))

(declare-fun mapIsEmpty!50098 () Bool)

(assert (=> mapIsEmpty!50098 mapRes!50098))

(declare-fun b!1259261 () Bool)

(declare-fun res!839260 () Bool)

(assert (=> b!1259261 (=> (not res!839260) (not e!716342))))

(assert (=> b!1259261 (= res!839260 (and (= (size!40102 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40101 _keys!1118) (size!40102 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!839264 () Bool)

(assert (=> start!105714 (=> (not res!839264) (not e!716342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105714 (= res!839264 (validMask!0 mask!1466))))

(assert (=> start!105714 e!716342))

(assert (=> start!105714 true))

(assert (=> start!105714 tp!95422))

(assert (=> start!105714 tp_is_empty!32201))

(declare-fun array_inv!30125 (array!82020) Bool)

(assert (=> start!105714 (array_inv!30125 _keys!1118)))

(declare-fun e!716343 () Bool)

(declare-fun array_inv!30126 (array!82022) Bool)

(assert (=> start!105714 (and (array_inv!30126 _values!914) e!716343)))

(declare-fun b!1259262 () Bool)

(assert (=> b!1259262 (= e!716340 tp_is_empty!32201)))

(declare-fun b!1259263 () Bool)

(assert (=> b!1259263 (= e!716343 (and e!716341 mapRes!50098))))

(declare-fun condMapEmpty!50098 () Bool)

(declare-fun mapDefault!50098 () ValueCell!15337)

