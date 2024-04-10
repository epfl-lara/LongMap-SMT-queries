; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106202 () Bool)

(assert start!106202)

(declare-fun b_free!27539 () Bool)

(declare-fun b_next!27539 () Bool)

(assert (=> start!106202 (= b_free!27539 (not b_next!27539))))

(declare-fun tp!96181 () Bool)

(declare-fun b_and!45571 () Bool)

(assert (=> start!106202 (= tp!96181 b_and!45571)))

(declare-fun b!1264454 () Bool)

(declare-fun res!842092 () Bool)

(declare-fun e!720009 () Bool)

(assert (=> b!1264454 (=> (not res!842092) (not e!720009))))

(declare-datatypes ((array!82510 0))(
  ( (array!82511 (arr!39797 (Array (_ BitVec 32) (_ BitVec 64))) (size!40333 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82510)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82510 (_ BitVec 32)) Bool)

(assert (=> b!1264454 (= res!842092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-datatypes ((V!48619 0))(
  ( (V!48620 (val!16283 Int)) )
))
(declare-datatypes ((tuple2!21084 0))(
  ( (tuple2!21085 (_1!10553 (_ BitVec 64)) (_2!10553 V!48619)) )
))
(declare-datatypes ((List!28274 0))(
  ( (Nil!28271) (Cons!28270 (h!29479 tuple2!21084) (t!41795 List!28274)) )
))
(declare-datatypes ((ListLongMap!18957 0))(
  ( (ListLongMap!18958 (toList!9494 List!28274)) )
))
(declare-fun lt!573803 () ListLongMap!18957)

(declare-fun b!1264455 () Bool)

(declare-fun lt!573799 () tuple2!21084)

(declare-fun e!720010 () Bool)

(declare-fun lt!573801 () ListLongMap!18957)

(declare-fun +!4264 (ListLongMap!18957 tuple2!21084) ListLongMap!18957)

(assert (=> b!1264455 (= e!720010 (= lt!573801 (+!4264 lt!573803 lt!573799)))))

(declare-fun b!1264456 () Bool)

(declare-fun e!720013 () Bool)

(assert (=> b!1264456 (= e!720009 (not e!720013))))

(declare-fun res!842090 () Bool)

(assert (=> b!1264456 (=> res!842090 e!720013)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264456 (= res!842090 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!573796 () ListLongMap!18957)

(assert (=> b!1264456 (= lt!573796 lt!573803)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48619)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48619)

(declare-fun minValueBefore!43 () V!48619)

(declare-datatypes ((Unit!42143 0))(
  ( (Unit!42144) )
))
(declare-fun lt!573797 () Unit!42143)

(declare-datatypes ((ValueCell!15457 0))(
  ( (ValueCellFull!15457 (v!18997 V!48619)) (EmptyCell!15457) )
))
(declare-datatypes ((array!82512 0))(
  ( (array!82513 (arr!39798 (Array (_ BitVec 32) ValueCell!15457)) (size!40334 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82512)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1198 (array!82510 array!82512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48619 V!48619 V!48619 V!48619 (_ BitVec 32) Int) Unit!42143)

(assert (=> b!1264456 (= lt!573797 (lemmaNoChangeToArrayThenSameMapNoExtras!1198 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5856 (array!82510 array!82512 (_ BitVec 32) (_ BitVec 32) V!48619 V!48619 (_ BitVec 32) Int) ListLongMap!18957)

(assert (=> b!1264456 (= lt!573803 (getCurrentListMapNoExtraKeys!5856 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1264456 (= lt!573796 (getCurrentListMapNoExtraKeys!5856 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1264457 () Bool)

(declare-fun res!842089 () Bool)

(assert (=> b!1264457 (=> (not res!842089) (not e!720009))))

(assert (=> b!1264457 (= res!842089 (and (= (size!40334 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40333 _keys!1118) (size!40334 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264458 () Bool)

(declare-fun e!720012 () Bool)

(declare-fun tp_is_empty!32441 () Bool)

(assert (=> b!1264458 (= e!720012 tp_is_empty!32441)))

(declare-fun mapNonEmpty!50497 () Bool)

(declare-fun mapRes!50497 () Bool)

(declare-fun tp!96182 () Bool)

(assert (=> mapNonEmpty!50497 (= mapRes!50497 (and tp!96182 e!720012))))

(declare-fun mapRest!50497 () (Array (_ BitVec 32) ValueCell!15457))

(declare-fun mapValue!50497 () ValueCell!15457)

(declare-fun mapKey!50497 () (_ BitVec 32))

(assert (=> mapNonEmpty!50497 (= (arr!39798 _values!914) (store mapRest!50497 mapKey!50497 mapValue!50497))))

(declare-fun b!1264459 () Bool)

(declare-fun res!842091 () Bool)

(assert (=> b!1264459 (=> (not res!842091) (not e!720009))))

(declare-datatypes ((List!28275 0))(
  ( (Nil!28272) (Cons!28271 (h!29480 (_ BitVec 64)) (t!41796 List!28275)) )
))
(declare-fun arrayNoDuplicates!0 (array!82510 (_ BitVec 32) List!28275) Bool)

(assert (=> b!1264459 (= res!842091 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28272))))

(declare-fun b!1264461 () Bool)

(declare-fun e!720008 () Bool)

(declare-fun e!720011 () Bool)

(assert (=> b!1264461 (= e!720008 (and e!720011 mapRes!50497))))

(declare-fun condMapEmpty!50497 () Bool)

(declare-fun mapDefault!50497 () ValueCell!15457)

