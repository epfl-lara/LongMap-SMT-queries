; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105444 () Bool)

(assert start!105444)

(declare-fun b_free!27103 () Bool)

(declare-fun b_next!27103 () Bool)

(assert (=> start!105444 (= b_free!27103 (not b_next!27103))))

(declare-fun tp!94823 () Bool)

(declare-fun b_and!44949 () Bool)

(assert (=> start!105444 (= tp!94823 b_and!44949)))

(declare-fun mapNonEmpty!49792 () Bool)

(declare-fun mapRes!49792 () Bool)

(declare-fun tp!94822 () Bool)

(declare-fun e!714181 () Bool)

(assert (=> mapNonEmpty!49792 (= mapRes!49792 (and tp!94822 e!714181))))

(declare-fun mapKey!49792 () (_ BitVec 32))

(declare-datatypes ((V!48039 0))(
  ( (V!48040 (val!16065 Int)) )
))
(declare-datatypes ((ValueCell!15239 0))(
  ( (ValueCellFull!15239 (v!18765 V!48039)) (EmptyCell!15239) )
))
(declare-datatypes ((array!81650 0))(
  ( (array!81651 (arr!39384 (Array (_ BitVec 32) ValueCell!15239)) (size!39920 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81650)

(declare-fun mapRest!49792 () (Array (_ BitVec 32) ValueCell!15239))

(declare-fun mapValue!49792 () ValueCell!15239)

(assert (=> mapNonEmpty!49792 (= (arr!39384 _values!914) (store mapRest!49792 mapKey!49792 mapValue!49792))))

(declare-fun b!1256307 () Bool)

(declare-fun tp_is_empty!32005 () Bool)

(assert (=> b!1256307 (= e!714181 tp_is_empty!32005)))

(declare-fun mapIsEmpty!49792 () Bool)

(assert (=> mapIsEmpty!49792 mapRes!49792))

(declare-fun b!1256308 () Bool)

(declare-fun res!837528 () Bool)

(declare-fun e!714178 () Bool)

(assert (=> b!1256308 (=> (not res!837528) (not e!714178))))

(declare-datatypes ((array!81652 0))(
  ( (array!81653 (arr!39385 (Array (_ BitVec 32) (_ BitVec 64))) (size!39921 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81652)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81652 (_ BitVec 32)) Bool)

(assert (=> b!1256308 (= res!837528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256309 () Bool)

(declare-fun e!714177 () Bool)

(assert (=> b!1256309 (= e!714177 (bvsle #b00000000000000000000000000000000 (size!39921 _keys!1118)))))

(declare-datatypes ((tuple2!20754 0))(
  ( (tuple2!20755 (_1!10388 (_ BitVec 64)) (_2!10388 V!48039)) )
))
(declare-datatypes ((List!27971 0))(
  ( (Nil!27968) (Cons!27967 (h!29176 tuple2!20754) (t!41458 List!27971)) )
))
(declare-datatypes ((ListLongMap!18627 0))(
  ( (ListLongMap!18628 (toList!9329 List!27971)) )
))
(declare-fun lt!568047 () ListLongMap!18627)

(declare-fun -!2079 (ListLongMap!18627 (_ BitVec 64)) ListLongMap!18627)

(assert (=> b!1256309 (= (-!2079 lt!568047 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568047)))

(declare-datatypes ((Unit!41840 0))(
  ( (Unit!41841) )
))
(declare-fun lt!568048 () Unit!41840)

(declare-fun removeNotPresentStillSame!132 (ListLongMap!18627 (_ BitVec 64)) Unit!41840)

(assert (=> b!1256309 (= lt!568048 (removeNotPresentStillSame!132 lt!568047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!837529 () Bool)

(assert (=> start!105444 (=> (not res!837529) (not e!714178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105444 (= res!837529 (validMask!0 mask!1466))))

(assert (=> start!105444 e!714178))

(assert (=> start!105444 true))

(assert (=> start!105444 tp!94823))

(assert (=> start!105444 tp_is_empty!32005))

(declare-fun array_inv!30003 (array!81652) Bool)

(assert (=> start!105444 (array_inv!30003 _keys!1118)))

(declare-fun e!714180 () Bool)

(declare-fun array_inv!30004 (array!81650) Bool)

(assert (=> start!105444 (and (array_inv!30004 _values!914) e!714180)))

(declare-fun b!1256310 () Bool)

(declare-fun res!837533 () Bool)

(assert (=> b!1256310 (=> (not res!837533) (not e!714178))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1256310 (= res!837533 (and (= (size!39920 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39921 _keys!1118) (size!39920 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256311 () Bool)

(declare-fun e!714176 () Bool)

(assert (=> b!1256311 (= e!714178 (not e!714176))))

(declare-fun res!837531 () Bool)

(assert (=> b!1256311 (=> res!837531 e!714176)))

(assert (=> b!1256311 (= res!837531 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568044 () ListLongMap!18627)

(declare-fun lt!568046 () ListLongMap!18627)

(assert (=> b!1256311 (= lt!568044 lt!568046)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48039)

(declare-fun zeroValue!871 () V!48039)

(declare-fun minValueBefore!43 () V!48039)

(declare-fun lt!568045 () Unit!41840)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1075 (array!81652 array!81650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 V!48039 V!48039 (_ BitVec 32) Int) Unit!41840)

(assert (=> b!1256311 (= lt!568045 (lemmaNoChangeToArrayThenSameMapNoExtras!1075 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5711 (array!81652 array!81650 (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 (_ BitVec 32) Int) ListLongMap!18627)

(assert (=> b!1256311 (= lt!568046 (getCurrentListMapNoExtraKeys!5711 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256311 (= lt!568044 (getCurrentListMapNoExtraKeys!5711 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256312 () Bool)

(declare-fun e!714182 () Bool)

(assert (=> b!1256312 (= e!714182 tp_is_empty!32005)))

(declare-fun b!1256313 () Bool)

(declare-fun res!837532 () Bool)

(assert (=> b!1256313 (=> (not res!837532) (not e!714178))))

(declare-datatypes ((List!27972 0))(
  ( (Nil!27969) (Cons!27968 (h!29177 (_ BitVec 64)) (t!41459 List!27972)) )
))
(declare-fun arrayNoDuplicates!0 (array!81652 (_ BitVec 32) List!27972) Bool)

(assert (=> b!1256313 (= res!837532 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27969))))

(declare-fun b!1256314 () Bool)

(assert (=> b!1256314 (= e!714176 e!714177)))

(declare-fun res!837530 () Bool)

(assert (=> b!1256314 (=> res!837530 e!714177)))

(declare-fun contains!7546 (ListLongMap!18627 (_ BitVec 64)) Bool)

(assert (=> b!1256314 (= res!837530 (contains!7546 lt!568047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4552 (array!81652 array!81650 (_ BitVec 32) (_ BitVec 32) V!48039 V!48039 (_ BitVec 32) Int) ListLongMap!18627)

(assert (=> b!1256314 (= lt!568047 (getCurrentListMap!4552 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256315 () Bool)

(assert (=> b!1256315 (= e!714180 (and e!714182 mapRes!49792))))

(declare-fun condMapEmpty!49792 () Bool)

(declare-fun mapDefault!49792 () ValueCell!15239)

