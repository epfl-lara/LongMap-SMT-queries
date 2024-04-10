; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105738 () Bool)

(assert start!105738)

(declare-fun b_free!27323 () Bool)

(declare-fun b_next!27323 () Bool)

(assert (=> start!105738 (= b_free!27323 (not b_next!27323))))

(declare-fun tp!95494 () Bool)

(declare-fun b_and!45207 () Bool)

(assert (=> start!105738 (= tp!95494 b_and!45207)))

(declare-fun b!1259581 () Bool)

(declare-fun e!716592 () Bool)

(assert (=> b!1259581 (= e!716592 true)))

(declare-datatypes ((V!48331 0))(
  ( (V!48332 (val!16175 Int)) )
))
(declare-datatypes ((tuple2!20912 0))(
  ( (tuple2!20913 (_1!10467 (_ BitVec 64)) (_2!10467 V!48331)) )
))
(declare-datatypes ((List!28117 0))(
  ( (Nil!28114) (Cons!28113 (h!29322 tuple2!20912) (t!41612 List!28117)) )
))
(declare-datatypes ((ListLongMap!18785 0))(
  ( (ListLongMap!18786 (toList!9408 List!28117)) )
))
(declare-fun lt!570233 () ListLongMap!18785)

(declare-fun lt!570235 () ListLongMap!18785)

(declare-fun -!2114 (ListLongMap!18785 (_ BitVec 64)) ListLongMap!18785)

(assert (=> b!1259581 (= lt!570233 (-!2114 lt!570235 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570230 () ListLongMap!18785)

(declare-fun lt!570227 () ListLongMap!18785)

(assert (=> b!1259581 (= (-!2114 lt!570230 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570227)))

(declare-datatypes ((Unit!41999 0))(
  ( (Unit!42000) )
))
(declare-fun lt!570234 () Unit!41999)

(declare-fun minValueBefore!43 () V!48331)

(declare-fun addThenRemoveForNewKeyIsSame!351 (ListLongMap!18785 (_ BitVec 64) V!48331) Unit!41999)

(assert (=> b!1259581 (= lt!570234 (addThenRemoveForNewKeyIsSame!351 lt!570227 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716595 () Bool)

(assert (=> b!1259581 e!716595))

(declare-fun res!839476 () Bool)

(assert (=> b!1259581 (=> (not res!839476) (not e!716595))))

(assert (=> b!1259581 (= res!839476 (= lt!570235 lt!570230))))

(declare-fun +!4212 (ListLongMap!18785 tuple2!20912) ListLongMap!18785)

(assert (=> b!1259581 (= lt!570230 (+!4212 lt!570227 (tuple2!20913 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570228 () ListLongMap!18785)

(declare-fun lt!570231 () tuple2!20912)

(assert (=> b!1259581 (= lt!570227 (+!4212 lt!570228 lt!570231))))

(declare-fun zeroValue!871 () V!48331)

(assert (=> b!1259581 (= lt!570231 (tuple2!20913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!570236 () ListLongMap!18785)

(declare-fun minValueAfter!43 () V!48331)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82068 0))(
  ( (array!82069 (arr!39589 (Array (_ BitVec 32) (_ BitVec 64))) (size!40125 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82068)

(declare-datatypes ((ValueCell!15349 0))(
  ( (ValueCellFull!15349 (v!18877 V!48331)) (EmptyCell!15349) )
))
(declare-datatypes ((array!82070 0))(
  ( (array!82071 (arr!39590 (Array (_ BitVec 32) ValueCell!15349)) (size!40126 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82070)

(declare-fun getCurrentListMap!4605 (array!82068 array!82070 (_ BitVec 32) (_ BitVec 32) V!48331 V!48331 (_ BitVec 32) Int) ListLongMap!18785)

(assert (=> b!1259581 (= lt!570236 (getCurrentListMap!4605 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259581 (= lt!570235 (getCurrentListMap!4605 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259582 () Bool)

(declare-fun lt!570229 () ListLongMap!18785)

(assert (=> b!1259582 (= e!716595 (= lt!570236 (+!4212 lt!570229 lt!570231)))))

(declare-fun mapIsEmpty!50134 () Bool)

(declare-fun mapRes!50134 () Bool)

(assert (=> mapIsEmpty!50134 mapRes!50134))

(declare-fun b!1259583 () Bool)

(declare-fun e!716594 () Bool)

(assert (=> b!1259583 (= e!716594 (not e!716592))))

(declare-fun res!839480 () Bool)

(assert (=> b!1259583 (=> res!839480 e!716592)))

(assert (=> b!1259583 (= res!839480 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1259583 (= lt!570228 lt!570229)))

(declare-fun lt!570232 () Unit!41999)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1148 (array!82068 array!82070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48331 V!48331 V!48331 V!48331 (_ BitVec 32) Int) Unit!41999)

(assert (=> b!1259583 (= lt!570232 (lemmaNoChangeToArrayThenSameMapNoExtras!1148 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5784 (array!82068 array!82070 (_ BitVec 32) (_ BitVec 32) V!48331 V!48331 (_ BitVec 32) Int) ListLongMap!18785)

(assert (=> b!1259583 (= lt!570229 (getCurrentListMapNoExtraKeys!5784 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259583 (= lt!570228 (getCurrentListMapNoExtraKeys!5784 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50134 () Bool)

(declare-fun tp!95495 () Bool)

(declare-fun e!716596 () Bool)

(assert (=> mapNonEmpty!50134 (= mapRes!50134 (and tp!95495 e!716596))))

(declare-fun mapValue!50134 () ValueCell!15349)

(declare-fun mapRest!50134 () (Array (_ BitVec 32) ValueCell!15349))

(declare-fun mapKey!50134 () (_ BitVec 32))

(assert (=> mapNonEmpty!50134 (= (arr!39590 _values!914) (store mapRest!50134 mapKey!50134 mapValue!50134))))

(declare-fun b!1259584 () Bool)

(declare-fun tp_is_empty!32225 () Bool)

(assert (=> b!1259584 (= e!716596 tp_is_empty!32225)))

(declare-fun b!1259585 () Bool)

(declare-fun e!716598 () Bool)

(declare-fun e!716597 () Bool)

(assert (=> b!1259585 (= e!716598 (and e!716597 mapRes!50134))))

(declare-fun condMapEmpty!50134 () Bool)

(declare-fun mapDefault!50134 () ValueCell!15349)

