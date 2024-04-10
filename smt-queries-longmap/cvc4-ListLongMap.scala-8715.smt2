; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105744 () Bool)

(assert start!105744)

(declare-fun b_free!27329 () Bool)

(declare-fun b_next!27329 () Bool)

(assert (=> start!105744 (= b_free!27329 (not b_next!27329))))

(declare-fun tp!95513 () Bool)

(declare-fun b_and!45213 () Bool)

(assert (=> start!105744 (= tp!95513 b_and!45213)))

(declare-fun b!1259670 () Bool)

(declare-datatypes ((V!48339 0))(
  ( (V!48340 (val!16178 Int)) )
))
(declare-datatypes ((tuple2!20918 0))(
  ( (tuple2!20919 (_1!10470 (_ BitVec 64)) (_2!10470 V!48339)) )
))
(declare-fun lt!570317 () tuple2!20918)

(declare-fun e!716664 () Bool)

(declare-datatypes ((List!28122 0))(
  ( (Nil!28119) (Cons!28118 (h!29327 tuple2!20918) (t!41617 List!28122)) )
))
(declare-datatypes ((ListLongMap!18791 0))(
  ( (ListLongMap!18792 (toList!9411 List!28122)) )
))
(declare-fun lt!570311 () ListLongMap!18791)

(declare-fun lt!570312 () ListLongMap!18791)

(declare-fun +!4215 (ListLongMap!18791 tuple2!20918) ListLongMap!18791)

(assert (=> b!1259670 (= e!716664 (= lt!570311 (+!4215 lt!570312 lt!570317)))))

(declare-fun mapIsEmpty!50143 () Bool)

(declare-fun mapRes!50143 () Bool)

(assert (=> mapIsEmpty!50143 mapRes!50143))

(declare-fun b!1259671 () Bool)

(declare-fun e!716668 () Bool)

(declare-datatypes ((array!82080 0))(
  ( (array!82081 (arr!39595 (Array (_ BitVec 32) (_ BitVec 64))) (size!40131 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82080)

(assert (=> b!1259671 (= e!716668 (bvsle #b00000000000000000000000000000000 (size!40131 _keys!1118)))))

(declare-fun b!1259672 () Bool)

(declare-fun res!839544 () Bool)

(declare-fun e!716665 () Bool)

(assert (=> b!1259672 (=> (not res!839544) (not e!716665))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82080 (_ BitVec 32)) Bool)

(assert (=> b!1259672 (= res!839544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50143 () Bool)

(declare-fun tp!95512 () Bool)

(declare-fun e!716663 () Bool)

(assert (=> mapNonEmpty!50143 (= mapRes!50143 (and tp!95512 e!716663))))

(declare-fun mapKey!50143 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15352 0))(
  ( (ValueCellFull!15352 (v!18880 V!48339)) (EmptyCell!15352) )
))
(declare-fun mapValue!50143 () ValueCell!15352)

(declare-fun mapRest!50143 () (Array (_ BitVec 32) ValueCell!15352))

(declare-datatypes ((array!82082 0))(
  ( (array!82083 (arr!39596 (Array (_ BitVec 32) ValueCell!15352)) (size!40132 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82082)

(assert (=> mapNonEmpty!50143 (= (arr!39596 _values!914) (store mapRest!50143 mapKey!50143 mapValue!50143))))

(declare-fun b!1259673 () Bool)

(declare-fun e!716669 () Bool)

(declare-fun tp_is_empty!32231 () Bool)

(assert (=> b!1259673 (= e!716669 tp_is_empty!32231)))

(declare-fun b!1259674 () Bool)

(declare-fun e!716667 () Bool)

(assert (=> b!1259674 (= e!716665 (not e!716667))))

(declare-fun res!839539 () Bool)

(assert (=> b!1259674 (=> res!839539 e!716667)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259674 (= res!839539 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!570310 () ListLongMap!18791)

(assert (=> b!1259674 (= lt!570310 lt!570312)))

(declare-fun minValueAfter!43 () V!48339)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48339)

(declare-fun minValueBefore!43 () V!48339)

(declare-datatypes ((Unit!42005 0))(
  ( (Unit!42006) )
))
(declare-fun lt!570316 () Unit!42005)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1151 (array!82080 array!82082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48339 V!48339 V!48339 V!48339 (_ BitVec 32) Int) Unit!42005)

(assert (=> b!1259674 (= lt!570316 (lemmaNoChangeToArrayThenSameMapNoExtras!1151 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5787 (array!82080 array!82082 (_ BitVec 32) (_ BitVec 32) V!48339 V!48339 (_ BitVec 32) Int) ListLongMap!18791)

(assert (=> b!1259674 (= lt!570312 (getCurrentListMapNoExtraKeys!5787 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259674 (= lt!570310 (getCurrentListMapNoExtraKeys!5787 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!839538 () Bool)

(assert (=> start!105744 (=> (not res!839538) (not e!716665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105744 (= res!839538 (validMask!0 mask!1466))))

(assert (=> start!105744 e!716665))

(assert (=> start!105744 true))

(assert (=> start!105744 tp!95513))

(assert (=> start!105744 tp_is_empty!32231))

(declare-fun array_inv!30147 (array!82080) Bool)

(assert (=> start!105744 (array_inv!30147 _keys!1118)))

(declare-fun e!716666 () Bool)

(declare-fun array_inv!30148 (array!82082) Bool)

(assert (=> start!105744 (and (array_inv!30148 _values!914) e!716666)))

(declare-fun b!1259675 () Bool)

(declare-fun res!839541 () Bool)

(assert (=> b!1259675 (=> (not res!839541) (not e!716665))))

(assert (=> b!1259675 (= res!839541 (and (= (size!40132 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40131 _keys!1118) (size!40132 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259676 () Bool)

(assert (=> b!1259676 (= e!716663 tp_is_empty!32231)))

(declare-fun b!1259677 () Bool)

(assert (=> b!1259677 (= e!716667 e!716668)))

(declare-fun res!839540 () Bool)

(assert (=> b!1259677 (=> res!839540 e!716668)))

(declare-fun lt!570313 () ListLongMap!18791)

(declare-fun -!2117 (ListLongMap!18791 (_ BitVec 64)) ListLongMap!18791)

(assert (=> b!1259677 (= res!839540 (not (= (-!2117 lt!570313 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570311)))))

(declare-fun lt!570314 () ListLongMap!18791)

(declare-fun lt!570315 () ListLongMap!18791)

(assert (=> b!1259677 (= (-!2117 lt!570314 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570315)))

(declare-fun lt!570309 () Unit!42005)

(declare-fun addThenRemoveForNewKeyIsSame!354 (ListLongMap!18791 (_ BitVec 64) V!48339) Unit!42005)

(assert (=> b!1259677 (= lt!570309 (addThenRemoveForNewKeyIsSame!354 lt!570315 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259677 e!716664))

(declare-fun res!839543 () Bool)

(assert (=> b!1259677 (=> (not res!839543) (not e!716664))))

(assert (=> b!1259677 (= res!839543 (= lt!570313 lt!570314))))

(assert (=> b!1259677 (= lt!570314 (+!4215 lt!570315 (tuple2!20919 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1259677 (= lt!570315 (+!4215 lt!570310 lt!570317))))

(assert (=> b!1259677 (= lt!570317 (tuple2!20919 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4608 (array!82080 array!82082 (_ BitVec 32) (_ BitVec 32) V!48339 V!48339 (_ BitVec 32) Int) ListLongMap!18791)

(assert (=> b!1259677 (= lt!570311 (getCurrentListMap!4608 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259677 (= lt!570313 (getCurrentListMap!4608 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259678 () Bool)

(assert (=> b!1259678 (= e!716666 (and e!716669 mapRes!50143))))

(declare-fun condMapEmpty!50143 () Bool)

(declare-fun mapDefault!50143 () ValueCell!15352)

