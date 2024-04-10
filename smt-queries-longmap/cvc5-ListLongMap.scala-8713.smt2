; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105728 () Bool)

(assert start!105728)

(declare-fun b_free!27313 () Bool)

(declare-fun b_next!27313 () Bool)

(assert (=> start!105728 (= b_free!27313 (not b_next!27313))))

(declare-fun tp!95464 () Bool)

(declare-fun b_and!45197 () Bool)

(assert (=> start!105728 (= tp!95464 b_and!45197)))

(declare-fun b!1259446 () Bool)

(declare-fun res!839389 () Bool)

(declare-fun e!716489 () Bool)

(assert (=> b!1259446 (=> (not res!839389) (not e!716489))))

(declare-datatypes ((array!82048 0))(
  ( (array!82049 (arr!39579 (Array (_ BitVec 32) (_ BitVec 64))) (size!40115 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82048)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82048 (_ BitVec 32)) Bool)

(assert (=> b!1259446 (= res!839389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259447 () Bool)

(declare-fun e!716492 () Bool)

(declare-fun tp_is_empty!32215 () Bool)

(assert (=> b!1259447 (= e!716492 tp_is_empty!32215)))

(declare-fun b!1259448 () Bool)

(declare-fun res!839391 () Bool)

(assert (=> b!1259448 (=> (not res!839391) (not e!716489))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48319 0))(
  ( (V!48320 (val!16170 Int)) )
))
(declare-datatypes ((ValueCell!15344 0))(
  ( (ValueCellFull!15344 (v!18872 V!48319)) (EmptyCell!15344) )
))
(declare-datatypes ((array!82050 0))(
  ( (array!82051 (arr!39580 (Array (_ BitVec 32) ValueCell!15344)) (size!40116 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82050)

(assert (=> b!1259448 (= res!839391 (and (= (size!40116 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40115 _keys!1118) (size!40116 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50119 () Bool)

(declare-fun mapRes!50119 () Bool)

(assert (=> mapIsEmpty!50119 mapRes!50119))

(declare-fun b!1259449 () Bool)

(declare-fun e!716490 () Bool)

(assert (=> b!1259449 (= e!716489 (not e!716490))))

(declare-fun res!839388 () Bool)

(assert (=> b!1259449 (=> res!839388 e!716490)))

(assert (=> b!1259449 (= res!839388 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20902 0))(
  ( (tuple2!20903 (_1!10462 (_ BitVec 64)) (_2!10462 V!48319)) )
))
(declare-datatypes ((List!28109 0))(
  ( (Nil!28106) (Cons!28105 (h!29314 tuple2!20902) (t!41604 List!28109)) )
))
(declare-datatypes ((ListLongMap!18775 0))(
  ( (ListLongMap!18776 (toList!9403 List!28109)) )
))
(declare-fun lt!570077 () ListLongMap!18775)

(declare-fun lt!570078 () ListLongMap!18775)

(assert (=> b!1259449 (= lt!570077 lt!570078)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48319)

(declare-datatypes ((Unit!41989 0))(
  ( (Unit!41990) )
))
(declare-fun lt!570084 () Unit!41989)

(declare-fun zeroValue!871 () V!48319)

(declare-fun minValueBefore!43 () V!48319)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1143 (array!82048 array!82050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 V!48319 V!48319 (_ BitVec 32) Int) Unit!41989)

(assert (=> b!1259449 (= lt!570084 (lemmaNoChangeToArrayThenSameMapNoExtras!1143 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5779 (array!82048 array!82050 (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 (_ BitVec 32) Int) ListLongMap!18775)

(assert (=> b!1259449 (= lt!570078 (getCurrentListMapNoExtraKeys!5779 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259449 (= lt!570077 (getCurrentListMapNoExtraKeys!5779 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259450 () Bool)

(declare-fun e!716487 () Bool)

(assert (=> b!1259450 (= e!716487 tp_is_empty!32215)))

(declare-fun b!1259451 () Bool)

(assert (=> b!1259451 (= e!716490 true)))

(declare-fun lt!570086 () ListLongMap!18775)

(declare-fun lt!570083 () ListLongMap!18775)

(declare-fun -!2110 (ListLongMap!18775 (_ BitVec 64)) ListLongMap!18775)

(assert (=> b!1259451 (= lt!570086 (-!2110 lt!570083 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!570085 () ListLongMap!18775)

(declare-fun lt!570082 () ListLongMap!18775)

(assert (=> b!1259451 (= (-!2110 lt!570085 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570082)))

(declare-fun lt!570079 () Unit!41989)

(declare-fun addThenRemoveForNewKeyIsSame!347 (ListLongMap!18775 (_ BitVec 64) V!48319) Unit!41989)

(assert (=> b!1259451 (= lt!570079 (addThenRemoveForNewKeyIsSame!347 lt!570082 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716491 () Bool)

(assert (=> b!1259451 e!716491))

(declare-fun res!839386 () Bool)

(assert (=> b!1259451 (=> (not res!839386) (not e!716491))))

(assert (=> b!1259451 (= res!839386 (= lt!570083 lt!570085))))

(declare-fun +!4208 (ListLongMap!18775 tuple2!20902) ListLongMap!18775)

(assert (=> b!1259451 (= lt!570085 (+!4208 lt!570082 (tuple2!20903 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570081 () tuple2!20902)

(assert (=> b!1259451 (= lt!570082 (+!4208 lt!570077 lt!570081))))

(assert (=> b!1259451 (= lt!570081 (tuple2!20903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun lt!570080 () ListLongMap!18775)

(declare-fun getCurrentListMap!4601 (array!82048 array!82050 (_ BitVec 32) (_ BitVec 32) V!48319 V!48319 (_ BitVec 32) Int) ListLongMap!18775)

(assert (=> b!1259451 (= lt!570080 (getCurrentListMap!4601 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259451 (= lt!570083 (getCurrentListMap!4601 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259452 () Bool)

(declare-fun res!839390 () Bool)

(assert (=> b!1259452 (=> (not res!839390) (not e!716489))))

(declare-datatypes ((List!28110 0))(
  ( (Nil!28107) (Cons!28106 (h!29315 (_ BitVec 64)) (t!41605 List!28110)) )
))
(declare-fun arrayNoDuplicates!0 (array!82048 (_ BitVec 32) List!28110) Bool)

(assert (=> b!1259452 (= res!839390 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28107))))

(declare-fun mapNonEmpty!50119 () Bool)

(declare-fun tp!95465 () Bool)

(assert (=> mapNonEmpty!50119 (= mapRes!50119 (and tp!95465 e!716487))))

(declare-fun mapRest!50119 () (Array (_ BitVec 32) ValueCell!15344))

(declare-fun mapValue!50119 () ValueCell!15344)

(declare-fun mapKey!50119 () (_ BitVec 32))

(assert (=> mapNonEmpty!50119 (= (arr!39580 _values!914) (store mapRest!50119 mapKey!50119 mapValue!50119))))

(declare-fun b!1259453 () Bool)

(declare-fun e!716488 () Bool)

(assert (=> b!1259453 (= e!716488 (and e!716492 mapRes!50119))))

(declare-fun condMapEmpty!50119 () Bool)

(declare-fun mapDefault!50119 () ValueCell!15344)

