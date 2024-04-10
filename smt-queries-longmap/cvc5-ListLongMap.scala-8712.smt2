; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105722 () Bool)

(assert start!105722)

(declare-fun b_free!27307 () Bool)

(declare-fun b_next!27307 () Bool)

(assert (=> start!105722 (= b_free!27307 (not b_next!27307))))

(declare-fun tp!95446 () Bool)

(declare-fun b_and!45191 () Bool)

(assert (=> start!105722 (= tp!95446 b_and!45191)))

(declare-fun b!1259365 () Bool)

(declare-fun res!839332 () Bool)

(declare-fun e!716425 () Bool)

(assert (=> b!1259365 (=> (not res!839332) (not e!716425))))

(declare-datatypes ((array!82036 0))(
  ( (array!82037 (arr!39573 (Array (_ BitVec 32) (_ BitVec 64))) (size!40109 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82036)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82036 (_ BitVec 32)) Bool)

(assert (=> b!1259365 (= res!839332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1259366 () Bool)

(declare-fun res!839334 () Bool)

(assert (=> b!1259366 (=> (not res!839334) (not e!716425))))

(declare-datatypes ((List!28104 0))(
  ( (Nil!28101) (Cons!28100 (h!29309 (_ BitVec 64)) (t!41599 List!28104)) )
))
(declare-fun arrayNoDuplicates!0 (array!82036 (_ BitVec 32) List!28104) Bool)

(assert (=> b!1259366 (= res!839334 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28101))))

(declare-fun mapNonEmpty!50110 () Bool)

(declare-fun mapRes!50110 () Bool)

(declare-fun tp!95447 () Bool)

(declare-fun e!716430 () Bool)

(assert (=> mapNonEmpty!50110 (= mapRes!50110 (and tp!95447 e!716430))))

(declare-datatypes ((V!48311 0))(
  ( (V!48312 (val!16167 Int)) )
))
(declare-datatypes ((ValueCell!15341 0))(
  ( (ValueCellFull!15341 (v!18869 V!48311)) (EmptyCell!15341) )
))
(declare-fun mapValue!50110 () ValueCell!15341)

(declare-fun mapKey!50110 () (_ BitVec 32))

(declare-fun mapRest!50110 () (Array (_ BitVec 32) ValueCell!15341))

(declare-datatypes ((array!82038 0))(
  ( (array!82039 (arr!39574 (Array (_ BitVec 32) ValueCell!15341)) (size!40110 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82038)

(assert (=> mapNonEmpty!50110 (= (arr!39574 _values!914) (store mapRest!50110 mapKey!50110 mapValue!50110))))

(declare-fun b!1259367 () Bool)

(declare-fun tp_is_empty!32209 () Bool)

(assert (=> b!1259367 (= e!716430 tp_is_empty!32209)))

(declare-fun b!1259368 () Bool)

(declare-fun e!716427 () Bool)

(assert (=> b!1259368 (= e!716427 true)))

(declare-datatypes ((tuple2!20896 0))(
  ( (tuple2!20897 (_1!10459 (_ BitVec 64)) (_2!10459 V!48311)) )
))
(declare-datatypes ((List!28105 0))(
  ( (Nil!28102) (Cons!28101 (h!29310 tuple2!20896) (t!41600 List!28105)) )
))
(declare-datatypes ((ListLongMap!18769 0))(
  ( (ListLongMap!18770 (toList!9400 List!28105)) )
))
(declare-fun lt!569990 () ListLongMap!18769)

(declare-fun lt!569987 () ListLongMap!18769)

(declare-fun -!2107 (ListLongMap!18769 (_ BitVec 64)) ListLongMap!18769)

(assert (=> b!1259368 (= lt!569990 (-!2107 lt!569987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!569993 () ListLongMap!18769)

(declare-fun lt!569995 () ListLongMap!18769)

(assert (=> b!1259368 (= (-!2107 lt!569993 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569995)))

(declare-datatypes ((Unit!41983 0))(
  ( (Unit!41984) )
))
(declare-fun lt!569996 () Unit!41983)

(declare-fun minValueBefore!43 () V!48311)

(declare-fun addThenRemoveForNewKeyIsSame!344 (ListLongMap!18769 (_ BitVec 64) V!48311) Unit!41983)

(assert (=> b!1259368 (= lt!569996 (addThenRemoveForNewKeyIsSame!344 lt!569995 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!716428 () Bool)

(assert (=> b!1259368 e!716428))

(declare-fun res!839335 () Bool)

(assert (=> b!1259368 (=> (not res!839335) (not e!716428))))

(assert (=> b!1259368 (= res!839335 (= lt!569987 lt!569993))))

(declare-fun +!4205 (ListLongMap!18769 tuple2!20896) ListLongMap!18769)

(assert (=> b!1259368 (= lt!569993 (+!4205 lt!569995 (tuple2!20897 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!569992 () ListLongMap!18769)

(declare-fun lt!569991 () tuple2!20896)

(assert (=> b!1259368 (= lt!569995 (+!4205 lt!569992 lt!569991))))

(declare-fun zeroValue!871 () V!48311)

(assert (=> b!1259368 (= lt!569991 (tuple2!20897 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48311)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lt!569988 () ListLongMap!18769)

(declare-fun getCurrentListMap!4598 (array!82036 array!82038 (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 (_ BitVec 32) Int) ListLongMap!18769)

(assert (=> b!1259368 (= lt!569988 (getCurrentListMap!4598 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259368 (= lt!569987 (getCurrentListMap!4598 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50110 () Bool)

(assert (=> mapIsEmpty!50110 mapRes!50110))

(declare-fun res!839336 () Bool)

(assert (=> start!105722 (=> (not res!839336) (not e!716425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105722 (= res!839336 (validMask!0 mask!1466))))

(assert (=> start!105722 e!716425))

(assert (=> start!105722 true))

(assert (=> start!105722 tp!95446))

(assert (=> start!105722 tp_is_empty!32209))

(declare-fun array_inv!30129 (array!82036) Bool)

(assert (=> start!105722 (array_inv!30129 _keys!1118)))

(declare-fun e!716424 () Bool)

(declare-fun array_inv!30130 (array!82038) Bool)

(assert (=> start!105722 (and (array_inv!30130 _values!914) e!716424)))

(declare-fun b!1259369 () Bool)

(declare-fun e!716429 () Bool)

(assert (=> b!1259369 (= e!716429 tp_is_empty!32209)))

(declare-fun b!1259370 () Bool)

(assert (=> b!1259370 (= e!716425 (not e!716427))))

(declare-fun res!839333 () Bool)

(assert (=> b!1259370 (=> res!839333 e!716427)))

(assert (=> b!1259370 (= res!839333 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!569989 () ListLongMap!18769)

(assert (=> b!1259370 (= lt!569992 lt!569989)))

(declare-fun lt!569994 () Unit!41983)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1140 (array!82036 array!82038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 V!48311 V!48311 (_ BitVec 32) Int) Unit!41983)

(assert (=> b!1259370 (= lt!569994 (lemmaNoChangeToArrayThenSameMapNoExtras!1140 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5776 (array!82036 array!82038 (_ BitVec 32) (_ BitVec 32) V!48311 V!48311 (_ BitVec 32) Int) ListLongMap!18769)

(assert (=> b!1259370 (= lt!569989 (getCurrentListMapNoExtraKeys!5776 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259370 (= lt!569992 (getCurrentListMapNoExtraKeys!5776 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259371 () Bool)

(declare-fun res!839337 () Bool)

(assert (=> b!1259371 (=> (not res!839337) (not e!716425))))

(assert (=> b!1259371 (= res!839337 (and (= (size!40110 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40109 _keys!1118) (size!40110 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259372 () Bool)

(assert (=> b!1259372 (= e!716428 (= lt!569988 (+!4205 lt!569989 lt!569991)))))

(declare-fun b!1259373 () Bool)

(assert (=> b!1259373 (= e!716424 (and e!716429 mapRes!50110))))

(declare-fun condMapEmpty!50110 () Bool)

(declare-fun mapDefault!50110 () ValueCell!15341)

