; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105734 () Bool)

(assert start!105734)

(declare-fun b_free!27319 () Bool)

(declare-fun b_next!27319 () Bool)

(assert (=> start!105734 (= b_free!27319 (not b_next!27319))))

(declare-fun tp!95483 () Bool)

(declare-fun b_and!45203 () Bool)

(assert (=> start!105734 (= tp!95483 b_and!45203)))

(declare-fun b!1259527 () Bool)

(declare-fun res!839440 () Bool)

(declare-fun e!716552 () Bool)

(assert (=> b!1259527 (=> (not res!839440) (not e!716552))))

(declare-datatypes ((array!82060 0))(
  ( (array!82061 (arr!39585 (Array (_ BitVec 32) (_ BitVec 64))) (size!40121 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82060)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82060 (_ BitVec 32)) Bool)

(assert (=> b!1259527 (= res!839440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50128 () Bool)

(declare-fun mapRes!50128 () Bool)

(assert (=> mapIsEmpty!50128 mapRes!50128))

(declare-fun b!1259528 () Bool)

(declare-fun e!716551 () Bool)

(assert (=> b!1259528 (= e!716552 (not e!716551))))

(declare-fun res!839445 () Bool)

(assert (=> b!1259528 (=> res!839445 e!716551)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259528 (= res!839445 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48327 0))(
  ( (V!48328 (val!16173 Int)) )
))
(declare-datatypes ((tuple2!20908 0))(
  ( (tuple2!20909 (_1!10465 (_ BitVec 64)) (_2!10465 V!48327)) )
))
(declare-datatypes ((List!28114 0))(
  ( (Nil!28111) (Cons!28110 (h!29319 tuple2!20908) (t!41609 List!28114)) )
))
(declare-datatypes ((ListLongMap!18781 0))(
  ( (ListLongMap!18782 (toList!9406 List!28114)) )
))
(declare-fun lt!570172 () ListLongMap!18781)

(declare-fun lt!570171 () ListLongMap!18781)

(assert (=> b!1259528 (= lt!570172 lt!570171)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48327)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15347 0))(
  ( (ValueCellFull!15347 (v!18875 V!48327)) (EmptyCell!15347) )
))
(declare-datatypes ((array!82062 0))(
  ( (array!82063 (arr!39586 (Array (_ BitVec 32) ValueCell!15347)) (size!40122 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82062)

(declare-fun minValueBefore!43 () V!48327)

(declare-fun zeroValue!871 () V!48327)

(declare-datatypes ((Unit!41995 0))(
  ( (Unit!41996) )
))
(declare-fun lt!570174 () Unit!41995)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1146 (array!82060 array!82062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 V!48327 V!48327 (_ BitVec 32) Int) Unit!41995)

(assert (=> b!1259528 (= lt!570174 (lemmaNoChangeToArrayThenSameMapNoExtras!1146 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5782 (array!82060 array!82062 (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 (_ BitVec 32) Int) ListLongMap!18781)

(assert (=> b!1259528 (= lt!570171 (getCurrentListMapNoExtraKeys!5782 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259528 (= lt!570172 (getCurrentListMapNoExtraKeys!5782 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259529 () Bool)

(declare-fun res!839444 () Bool)

(assert (=> b!1259529 (=> (not res!839444) (not e!716552))))

(assert (=> b!1259529 (= res!839444 (and (= (size!40122 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40121 _keys!1118) (size!40122 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259530 () Bool)

(declare-fun e!716555 () Bool)

(declare-fun tp_is_empty!32221 () Bool)

(assert (=> b!1259530 (= e!716555 tp_is_empty!32221)))

(declare-fun lt!570175 () tuple2!20908)

(declare-fun e!716556 () Bool)

(declare-fun b!1259531 () Bool)

(declare-fun lt!570173 () ListLongMap!18781)

(declare-fun +!4210 (ListLongMap!18781 tuple2!20908) ListLongMap!18781)

(assert (=> b!1259531 (= e!716556 (= lt!570173 (+!4210 lt!570171 lt!570175)))))

(declare-fun b!1259532 () Bool)

(declare-fun e!716550 () Bool)

(assert (=> b!1259532 (= e!716550 tp_is_empty!32221)))

(declare-fun res!839443 () Bool)

(assert (=> start!105734 (=> (not res!839443) (not e!716552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105734 (= res!839443 (validMask!0 mask!1466))))

(assert (=> start!105734 e!716552))

(assert (=> start!105734 true))

(assert (=> start!105734 tp!95483))

(assert (=> start!105734 tp_is_empty!32221))

(declare-fun array_inv!30139 (array!82060) Bool)

(assert (=> start!105734 (array_inv!30139 _keys!1118)))

(declare-fun e!716554 () Bool)

(declare-fun array_inv!30140 (array!82062) Bool)

(assert (=> start!105734 (and (array_inv!30140 _values!914) e!716554)))

(declare-fun mapNonEmpty!50128 () Bool)

(declare-fun tp!95482 () Bool)

(assert (=> mapNonEmpty!50128 (= mapRes!50128 (and tp!95482 e!716555))))

(declare-fun mapKey!50128 () (_ BitVec 32))

(declare-fun mapRest!50128 () (Array (_ BitVec 32) ValueCell!15347))

(declare-fun mapValue!50128 () ValueCell!15347)

(assert (=> mapNonEmpty!50128 (= (arr!39586 _values!914) (store mapRest!50128 mapKey!50128 mapValue!50128))))

(declare-fun b!1259533 () Bool)

(assert (=> b!1259533 (= e!716551 true)))

(declare-fun lt!570170 () ListLongMap!18781)

(declare-fun lt!570167 () ListLongMap!18781)

(declare-fun -!2112 (ListLongMap!18781 (_ BitVec 64)) ListLongMap!18781)

(assert (=> b!1259533 (= lt!570170 (-!2112 lt!570167 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570169 () ListLongMap!18781)

(declare-fun lt!570168 () ListLongMap!18781)

(assert (=> b!1259533 (= (-!2112 lt!570169 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570168)))

(declare-fun lt!570176 () Unit!41995)

(declare-fun addThenRemoveForNewKeyIsSame!349 (ListLongMap!18781 (_ BitVec 64) V!48327) Unit!41995)

(assert (=> b!1259533 (= lt!570176 (addThenRemoveForNewKeyIsSame!349 lt!570168 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> b!1259533 e!716556))

(declare-fun res!839441 () Bool)

(assert (=> b!1259533 (=> (not res!839441) (not e!716556))))

(assert (=> b!1259533 (= res!839441 (= lt!570167 lt!570169))))

(assert (=> b!1259533 (= lt!570169 (+!4210 lt!570168 (tuple2!20909 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (=> b!1259533 (= lt!570168 (+!4210 lt!570172 lt!570175))))

(assert (=> b!1259533 (= lt!570175 (tuple2!20909 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4603 (array!82060 array!82062 (_ BitVec 32) (_ BitVec 32) V!48327 V!48327 (_ BitVec 32) Int) ListLongMap!18781)

(assert (=> b!1259533 (= lt!570173 (getCurrentListMap!4603 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259533 (= lt!570167 (getCurrentListMap!4603 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259534 () Bool)

(assert (=> b!1259534 (= e!716554 (and e!716550 mapRes!50128))))

(declare-fun condMapEmpty!50128 () Bool)

(declare-fun mapDefault!50128 () ValueCell!15347)

