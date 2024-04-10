; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105426 () Bool)

(assert start!105426)

(declare-fun b_free!27085 () Bool)

(declare-fun b_next!27085 () Bool)

(assert (=> start!105426 (= b_free!27085 (not b_next!27085))))

(declare-fun tp!94769 () Bool)

(declare-fun b_and!44931 () Bool)

(assert (=> start!105426 (= tp!94769 b_and!44931)))

(declare-fun b!1256064 () Bool)

(declare-fun e!713991 () Bool)

(declare-fun e!713990 () Bool)

(assert (=> b!1256064 (= e!713991 e!713990)))

(declare-fun res!837371 () Bool)

(assert (=> b!1256064 (=> res!837371 e!713990)))

(declare-datatypes ((V!48015 0))(
  ( (V!48016 (val!16056 Int)) )
))
(declare-datatypes ((tuple2!20740 0))(
  ( (tuple2!20741 (_1!10381 (_ BitVec 64)) (_2!10381 V!48015)) )
))
(declare-datatypes ((List!27957 0))(
  ( (Nil!27954) (Cons!27953 (h!29162 tuple2!20740) (t!41444 List!27957)) )
))
(declare-datatypes ((ListLongMap!18613 0))(
  ( (ListLongMap!18614 (toList!9322 List!27957)) )
))
(declare-fun lt!567912 () ListLongMap!18613)

(declare-fun contains!7539 (ListLongMap!18613 (_ BitVec 64)) Bool)

(assert (=> b!1256064 (= res!837371 (contains!7539 lt!567912 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48015)

(declare-datatypes ((array!81616 0))(
  ( (array!81617 (arr!39367 (Array (_ BitVec 32) (_ BitVec 64))) (size!39903 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81616)

(declare-datatypes ((ValueCell!15230 0))(
  ( (ValueCellFull!15230 (v!18756 V!48015)) (EmptyCell!15230) )
))
(declare-datatypes ((array!81618 0))(
  ( (array!81619 (arr!39368 (Array (_ BitVec 32) ValueCell!15230)) (size!39904 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81618)

(declare-fun minValueBefore!43 () V!48015)

(declare-fun getCurrentListMap!4545 (array!81616 array!81618 (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 (_ BitVec 32) Int) ListLongMap!18613)

(assert (=> b!1256064 (= lt!567912 (getCurrentListMap!4545 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49765 () Bool)

(declare-fun mapRes!49765 () Bool)

(declare-fun tp!94768 () Bool)

(declare-fun e!713989 () Bool)

(assert (=> mapNonEmpty!49765 (= mapRes!49765 (and tp!94768 e!713989))))

(declare-fun mapValue!49765 () ValueCell!15230)

(declare-fun mapKey!49765 () (_ BitVec 32))

(declare-fun mapRest!49765 () (Array (_ BitVec 32) ValueCell!15230))

(assert (=> mapNonEmpty!49765 (= (arr!39368 _values!914) (store mapRest!49765 mapKey!49765 mapValue!49765))))

(declare-fun res!837370 () Bool)

(declare-fun e!713988 () Bool)

(assert (=> start!105426 (=> (not res!837370) (not e!713988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105426 (= res!837370 (validMask!0 mask!1466))))

(assert (=> start!105426 e!713988))

(assert (=> start!105426 true))

(assert (=> start!105426 tp!94769))

(declare-fun tp_is_empty!31987 () Bool)

(assert (=> start!105426 tp_is_empty!31987))

(declare-fun array_inv!29993 (array!81616) Bool)

(assert (=> start!105426 (array_inv!29993 _keys!1118)))

(declare-fun e!713993 () Bool)

(declare-fun array_inv!29994 (array!81618) Bool)

(assert (=> start!105426 (and (array_inv!29994 _values!914) e!713993)))

(declare-fun b!1256065 () Bool)

(assert (=> b!1256065 (= e!713990 true)))

(declare-fun -!2074 (ListLongMap!18613 (_ BitVec 64)) ListLongMap!18613)

(assert (=> b!1256065 (= (-!2074 lt!567912 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567912)))

(declare-datatypes ((Unit!41828 0))(
  ( (Unit!41829) )
))
(declare-fun lt!567911 () Unit!41828)

(declare-fun removeNotPresentStillSame!127 (ListLongMap!18613 (_ BitVec 64)) Unit!41828)

(assert (=> b!1256065 (= lt!567911 (removeNotPresentStillSame!127 lt!567912 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1256066 () Bool)

(declare-fun e!713987 () Bool)

(assert (=> b!1256066 (= e!713987 tp_is_empty!31987)))

(declare-fun b!1256067 () Bool)

(assert (=> b!1256067 (= e!713989 tp_is_empty!31987)))

(declare-fun b!1256068 () Bool)

(declare-fun res!837366 () Bool)

(assert (=> b!1256068 (=> (not res!837366) (not e!713988))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256068 (= res!837366 (and (= (size!39904 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39903 _keys!1118) (size!39904 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49765 () Bool)

(assert (=> mapIsEmpty!49765 mapRes!49765))

(declare-fun b!1256069 () Bool)

(declare-fun res!837369 () Bool)

(assert (=> b!1256069 (=> (not res!837369) (not e!713988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81616 (_ BitVec 32)) Bool)

(assert (=> b!1256069 (= res!837369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256070 () Bool)

(assert (=> b!1256070 (= e!713988 (not e!713991))))

(declare-fun res!837368 () Bool)

(assert (=> b!1256070 (=> res!837368 e!713991)))

(assert (=> b!1256070 (= res!837368 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!567910 () ListLongMap!18613)

(declare-fun lt!567909 () ListLongMap!18613)

(assert (=> b!1256070 (= lt!567910 lt!567909)))

(declare-fun minValueAfter!43 () V!48015)

(declare-fun lt!567913 () Unit!41828)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1069 (array!81616 array!81618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 V!48015 V!48015 (_ BitVec 32) Int) Unit!41828)

(assert (=> b!1256070 (= lt!567913 (lemmaNoChangeToArrayThenSameMapNoExtras!1069 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5705 (array!81616 array!81618 (_ BitVec 32) (_ BitVec 32) V!48015 V!48015 (_ BitVec 32) Int) ListLongMap!18613)

(assert (=> b!1256070 (= lt!567909 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256070 (= lt!567910 (getCurrentListMapNoExtraKeys!5705 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256071 () Bool)

(assert (=> b!1256071 (= e!713993 (and e!713987 mapRes!49765))))

(declare-fun condMapEmpty!49765 () Bool)

(declare-fun mapDefault!49765 () ValueCell!15230)

