; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106198 () Bool)

(assert start!106198)

(declare-fun b_free!27535 () Bool)

(declare-fun b_next!27535 () Bool)

(assert (=> start!106198 (= b_free!27535 (not b_next!27535))))

(declare-fun tp!96169 () Bool)

(declare-fun b_and!45567 () Bool)

(assert (=> start!106198 (= tp!96169 b_and!45567)))

(declare-fun mapNonEmpty!50491 () Bool)

(declare-fun mapRes!50491 () Bool)

(declare-fun tp!96170 () Bool)

(declare-fun e!719968 () Bool)

(assert (=> mapNonEmpty!50491 (= mapRes!50491 (and tp!96170 e!719968))))

(declare-datatypes ((V!48615 0))(
  ( (V!48616 (val!16281 Int)) )
))
(declare-datatypes ((ValueCell!15455 0))(
  ( (ValueCellFull!15455 (v!18995 V!48615)) (EmptyCell!15455) )
))
(declare-datatypes ((array!82502 0))(
  ( (array!82503 (arr!39793 (Array (_ BitVec 32) ValueCell!15455)) (size!40329 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82502)

(declare-fun mapKey!50491 () (_ BitVec 32))

(declare-fun mapValue!50491 () ValueCell!15455)

(declare-fun mapRest!50491 () (Array (_ BitVec 32) ValueCell!15455))

(assert (=> mapNonEmpty!50491 (= (arr!39793 _values!914) (store mapRest!50491 mapKey!50491 mapValue!50491))))

(declare-fun b!1264400 () Bool)

(declare-fun res!842055 () Bool)

(declare-fun e!719969 () Bool)

(assert (=> b!1264400 (=> (not res!842055) (not e!719969))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82504 0))(
  ( (array!82505 (arr!39794 (Array (_ BitVec 32) (_ BitVec 64))) (size!40330 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82504)

(declare-fun mask!1466 () (_ BitVec 32))

(assert (=> b!1264400 (= res!842055 (and (= (size!40329 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40330 _keys!1118) (size!40329 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264401 () Bool)

(declare-fun e!719971 () Bool)

(assert (=> b!1264401 (= e!719969 (not e!719971))))

(declare-fun res!842053 () Bool)

(assert (=> b!1264401 (=> res!842053 e!719971)))

(assert (=> b!1264401 (= res!842053 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21080 0))(
  ( (tuple2!21081 (_1!10551 (_ BitVec 64)) (_2!10551 V!48615)) )
))
(declare-datatypes ((List!28270 0))(
  ( (Nil!28267) (Cons!28266 (h!29475 tuple2!21080) (t!41791 List!28270)) )
))
(declare-datatypes ((ListLongMap!18953 0))(
  ( (ListLongMap!18954 (toList!9492 List!28270)) )
))
(declare-fun lt!573743 () ListLongMap!18953)

(declare-fun lt!573736 () ListLongMap!18953)

(assert (=> b!1264401 (= lt!573743 lt!573736)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48615)

(declare-datatypes ((Unit!42139 0))(
  ( (Unit!42140) )
))
(declare-fun lt!573737 () Unit!42139)

(declare-fun zeroValue!871 () V!48615)

(declare-fun minValueBefore!43 () V!48615)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1196 (array!82504 array!82502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 V!48615 V!48615 (_ BitVec 32) Int) Unit!42139)

(assert (=> b!1264401 (= lt!573737 (lemmaNoChangeToArrayThenSameMapNoExtras!1196 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5854 (array!82504 array!82502 (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 (_ BitVec 32) Int) ListLongMap!18953)

(assert (=> b!1264401 (= lt!573736 (getCurrentListMapNoExtraKeys!5854 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264401 (= lt!573743 (getCurrentListMapNoExtraKeys!5854 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264402 () Bool)

(declare-fun res!842056 () Bool)

(assert (=> b!1264402 (=> (not res!842056) (not e!719969))))

(declare-datatypes ((List!28271 0))(
  ( (Nil!28268) (Cons!28267 (h!29476 (_ BitVec 64)) (t!41792 List!28271)) )
))
(declare-fun arrayNoDuplicates!0 (array!82504 (_ BitVec 32) List!28271) Bool)

(assert (=> b!1264402 (= res!842056 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28268))))

(declare-fun mapIsEmpty!50491 () Bool)

(assert (=> mapIsEmpty!50491 mapRes!50491))

(declare-fun lt!573744 () tuple2!21080)

(declare-fun lt!573742 () ListLongMap!18953)

(declare-fun b!1264403 () Bool)

(declare-fun e!719970 () Bool)

(declare-fun +!4262 (ListLongMap!18953 tuple2!21080) ListLongMap!18953)

(assert (=> b!1264403 (= e!719970 (= lt!573742 (+!4262 lt!573736 lt!573744)))))

(declare-fun b!1264404 () Bool)

(assert (=> b!1264404 (= e!719971 true)))

(declare-fun lt!573738 () ListLongMap!18953)

(declare-fun lt!573741 () ListLongMap!18953)

(declare-fun -!2150 (ListLongMap!18953 (_ BitVec 64)) ListLongMap!18953)

(assert (=> b!1264404 (= lt!573738 (-!2150 lt!573741 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!573740 () ListLongMap!18953)

(declare-fun lt!573739 () ListLongMap!18953)

(assert (=> b!1264404 (= (-!2150 lt!573740 #b1000000000000000000000000000000000000000000000000000000000000000) lt!573739)))

(declare-fun lt!573735 () Unit!42139)

(declare-fun addThenRemoveForNewKeyIsSame!382 (ListLongMap!18953 (_ BitVec 64) V!48615) Unit!42139)

(assert (=> b!1264404 (= lt!573735 (addThenRemoveForNewKeyIsSame!382 lt!573739 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1264404 e!719970))

(declare-fun res!842054 () Bool)

(assert (=> b!1264404 (=> (not res!842054) (not e!719970))))

(assert (=> b!1264404 (= res!842054 (= lt!573741 lt!573740))))

(assert (=> b!1264404 (= lt!573740 (+!4262 lt!573739 (tuple2!21081 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1264404 (= lt!573739 (+!4262 lt!573743 lt!573744))))

(assert (=> b!1264404 (= lt!573744 (tuple2!21081 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4659 (array!82504 array!82502 (_ BitVec 32) (_ BitVec 32) V!48615 V!48615 (_ BitVec 32) Int) ListLongMap!18953)

(assert (=> b!1264404 (= lt!573742 (getCurrentListMap!4659 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264404 (= lt!573741 (getCurrentListMap!4659 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!842052 () Bool)

(assert (=> start!106198 (=> (not res!842052) (not e!719969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106198 (= res!842052 (validMask!0 mask!1466))))

(assert (=> start!106198 e!719969))

(assert (=> start!106198 true))

(assert (=> start!106198 tp!96169))

(declare-fun tp_is_empty!32437 () Bool)

(assert (=> start!106198 tp_is_empty!32437))

(declare-fun array_inv!30285 (array!82504) Bool)

(assert (=> start!106198 (array_inv!30285 _keys!1118)))

(declare-fun e!719967 () Bool)

(declare-fun array_inv!30286 (array!82502) Bool)

(assert (=> start!106198 (and (array_inv!30286 _values!914) e!719967)))

(declare-fun b!1264405 () Bool)

(declare-fun e!719966 () Bool)

(assert (=> b!1264405 (= e!719967 (and e!719966 mapRes!50491))))

(declare-fun condMapEmpty!50491 () Bool)

(declare-fun mapDefault!50491 () ValueCell!15455)

