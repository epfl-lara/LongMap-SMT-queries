; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106170 () Bool)

(assert start!106170)

(declare-fun b_free!27527 () Bool)

(declare-fun b_next!27527 () Bool)

(assert (=> start!106170 (= b_free!27527 (not b_next!27527))))

(declare-fun tp!96142 () Bool)

(declare-fun b_and!45547 () Bool)

(assert (=> start!106170 (= tp!96142 b_and!45547)))

(declare-fun b!1264104 () Bool)

(declare-fun e!719765 () Bool)

(declare-fun tp_is_empty!32429 () Bool)

(assert (=> b!1264104 (= e!719765 tp_is_empty!32429)))

(declare-fun mapIsEmpty!50476 () Bool)

(declare-fun mapRes!50476 () Bool)

(assert (=> mapIsEmpty!50476 mapRes!50476))

(declare-fun b!1264105 () Bool)

(declare-fun res!841900 () Bool)

(declare-fun e!719770 () Bool)

(assert (=> b!1264105 (=> (not res!841900) (not e!719770))))

(declare-datatypes ((array!82484 0))(
  ( (array!82485 (arr!39785 (Array (_ BitVec 32) (_ BitVec 64))) (size!40321 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82484)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82484 (_ BitVec 32)) Bool)

(assert (=> b!1264105 (= res!841900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50476 () Bool)

(declare-fun tp!96143 () Bool)

(assert (=> mapNonEmpty!50476 (= mapRes!50476 (and tp!96143 e!719765))))

(declare-datatypes ((V!48603 0))(
  ( (V!48604 (val!16277 Int)) )
))
(declare-datatypes ((ValueCell!15451 0))(
  ( (ValueCellFull!15451 (v!18990 V!48603)) (EmptyCell!15451) )
))
(declare-fun mapRest!50476 () (Array (_ BitVec 32) ValueCell!15451))

(declare-fun mapKey!50476 () (_ BitVec 32))

(declare-fun mapValue!50476 () ValueCell!15451)

(declare-datatypes ((array!82486 0))(
  ( (array!82487 (arr!39786 (Array (_ BitVec 32) ValueCell!15451)) (size!40322 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82486)

(assert (=> mapNonEmpty!50476 (= (arr!39786 _values!914) (store mapRest!50476 mapKey!50476 mapValue!50476))))

(declare-fun b!1264106 () Bool)

(declare-fun e!719766 () Bool)

(declare-datatypes ((tuple2!21076 0))(
  ( (tuple2!21077 (_1!10549 (_ BitVec 64)) (_2!10549 V!48603)) )
))
(declare-datatypes ((List!28266 0))(
  ( (Nil!28263) (Cons!28262 (h!29471 tuple2!21076) (t!41785 List!28266)) )
))
(declare-datatypes ((ListLongMap!18949 0))(
  ( (ListLongMap!18950 (toList!9490 List!28266)) )
))
(declare-fun lt!573470 () ListLongMap!18949)

(declare-fun contains!7613 (ListLongMap!18949 (_ BitVec 64)) Bool)

(assert (=> b!1264106 (= e!719766 (not (contains!7613 lt!573470 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!719769 () Bool)

(assert (=> b!1264106 e!719769))

(declare-fun res!841903 () Bool)

(assert (=> b!1264106 (=> (not res!841903) (not e!719769))))

(declare-fun minValueBefore!43 () V!48603)

(declare-fun lt!573468 () ListLongMap!18949)

(declare-fun +!4260 (ListLongMap!18949 tuple2!21076) ListLongMap!18949)

(assert (=> b!1264106 (= res!841903 (= lt!573468 (+!4260 lt!573470 (tuple2!21077 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573467 () ListLongMap!18949)

(declare-fun lt!573471 () tuple2!21076)

(assert (=> b!1264106 (= lt!573470 (+!4260 lt!573467 lt!573471))))

(declare-fun zeroValue!871 () V!48603)

(assert (=> b!1264106 (= lt!573471 (tuple2!21077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48603)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!573469 () ListLongMap!18949)

(declare-fun getCurrentListMap!4657 (array!82484 array!82486 (_ BitVec 32) (_ BitVec 32) V!48603 V!48603 (_ BitVec 32) Int) ListLongMap!18949)

(assert (=> b!1264106 (= lt!573469 (getCurrentListMap!4657 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264106 (= lt!573468 (getCurrentListMap!4657 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841902 () Bool)

(assert (=> start!106170 (=> (not res!841902) (not e!719770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106170 (= res!841902 (validMask!0 mask!1466))))

(assert (=> start!106170 e!719770))

(assert (=> start!106170 true))

(assert (=> start!106170 tp!96142))

(assert (=> start!106170 tp_is_empty!32429))

(declare-fun array_inv!30279 (array!82484) Bool)

(assert (=> start!106170 (array_inv!30279 _keys!1118)))

(declare-fun e!719767 () Bool)

(declare-fun array_inv!30280 (array!82486) Bool)

(assert (=> start!106170 (and (array_inv!30280 _values!914) e!719767)))

(declare-fun b!1264107 () Bool)

(declare-fun res!841904 () Bool)

(assert (=> b!1264107 (=> (not res!841904) (not e!719770))))

(assert (=> b!1264107 (= res!841904 (and (= (size!40322 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40321 _keys!1118) (size!40322 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264108 () Bool)

(assert (=> b!1264108 (= e!719770 (not e!719766))))

(declare-fun res!841901 () Bool)

(assert (=> b!1264108 (=> res!841901 e!719766)))

(assert (=> b!1264108 (= res!841901 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!573473 () ListLongMap!18949)

(assert (=> b!1264108 (= lt!573467 lt!573473)))

(declare-datatypes ((Unit!42132 0))(
  ( (Unit!42133) )
))
(declare-fun lt!573472 () Unit!42132)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1194 (array!82484 array!82486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48603 V!48603 V!48603 V!48603 (_ BitVec 32) Int) Unit!42132)

(assert (=> b!1264108 (= lt!573472 (lemmaNoChangeToArrayThenSameMapNoExtras!1194 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5852 (array!82484 array!82486 (_ BitVec 32) (_ BitVec 32) V!48603 V!48603 (_ BitVec 32) Int) ListLongMap!18949)

(assert (=> b!1264108 (= lt!573473 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264108 (= lt!573467 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264109 () Bool)

(assert (=> b!1264109 (= e!719769 (= lt!573469 (+!4260 lt!573473 lt!573471)))))

(declare-fun b!1264110 () Bool)

(declare-fun e!719768 () Bool)

(assert (=> b!1264110 (= e!719767 (and e!719768 mapRes!50476))))

(declare-fun condMapEmpty!50476 () Bool)

(declare-fun mapDefault!50476 () ValueCell!15451)

