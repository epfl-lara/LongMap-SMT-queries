; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106142 () Bool)

(assert start!106142)

(declare-fun b_free!27517 () Bool)

(declare-fun b_next!27517 () Bool)

(assert (=> start!106142 (= b_free!27517 (not b_next!27517))))

(declare-fun tp!96110 () Bool)

(declare-fun b_and!45525 () Bool)

(assert (=> start!106142 (= tp!96110 b_and!45525)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((V!48591 0))(
  ( (V!48592 (val!16272 Int)) )
))
(declare-fun minValueAfter!43 () V!48591)

(declare-fun b!1263783 () Bool)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48591)

(declare-datatypes ((array!82464 0))(
  ( (array!82465 (arr!39776 (Array (_ BitVec 32) (_ BitVec 64))) (size!40312 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82464)

(declare-datatypes ((ValueCell!15446 0))(
  ( (ValueCellFull!15446 (v!18984 V!48591)) (EmptyCell!15446) )
))
(declare-datatypes ((array!82466 0))(
  ( (array!82467 (arr!39777 (Array (_ BitVec 32) ValueCell!15446)) (size!40313 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82466)

(declare-datatypes ((tuple2!21068 0))(
  ( (tuple2!21069 (_1!10545 (_ BitVec 64)) (_2!10545 V!48591)) )
))
(declare-datatypes ((List!28259 0))(
  ( (Nil!28256) (Cons!28255 (h!29464 tuple2!21068) (t!41776 List!28259)) )
))
(declare-datatypes ((ListLongMap!18941 0))(
  ( (ListLongMap!18942 (toList!9486 List!28259)) )
))
(declare-fun lt!573243 () ListLongMap!18941)

(declare-fun e!719546 () Bool)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4653 (array!82464 array!82466 (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 (_ BitVec 32) Int) ListLongMap!18941)

(declare-fun +!4256 (ListLongMap!18941 tuple2!21068) ListLongMap!18941)

(assert (=> b!1263783 (= e!719546 (= (getCurrentListMap!4653 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4256 lt!573243 (tuple2!21069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun b!1263784 () Bool)

(declare-fun res!841725 () Bool)

(declare-fun e!719547 () Bool)

(assert (=> b!1263784 (=> (not res!841725) (not e!719547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82464 (_ BitVec 32)) Bool)

(assert (=> b!1263784 (= res!841725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50458 () Bool)

(declare-fun mapRes!50458 () Bool)

(declare-fun tp!96109 () Bool)

(declare-fun e!719542 () Bool)

(assert (=> mapNonEmpty!50458 (= mapRes!50458 (and tp!96109 e!719542))))

(declare-fun mapValue!50458 () ValueCell!15446)

(declare-fun mapKey!50458 () (_ BitVec 32))

(declare-fun mapRest!50458 () (Array (_ BitVec 32) ValueCell!15446))

(assert (=> mapNonEmpty!50458 (= (arr!39777 _values!914) (store mapRest!50458 mapKey!50458 mapValue!50458))))

(declare-fun b!1263785 () Bool)

(declare-fun tp_is_empty!32419 () Bool)

(assert (=> b!1263785 (= e!719542 tp_is_empty!32419)))

(declare-fun b!1263786 () Bool)

(declare-fun e!719540 () Bool)

(declare-fun e!719543 () Bool)

(assert (=> b!1263786 (= e!719540 e!719543)))

(declare-fun res!841727 () Bool)

(assert (=> b!1263786 (=> res!841727 e!719543)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1263786 (= res!841727 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263787 () Bool)

(assert (=> b!1263787 (= e!719547 (not e!719546))))

(declare-fun res!841730 () Bool)

(assert (=> b!1263787 (=> res!841730 e!719546)))

(assert (=> b!1263787 (= res!841730 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1263787 e!719540))

(declare-fun res!841731 () Bool)

(assert (=> b!1263787 (=> (not res!841731) (not e!719540))))

(declare-fun lt!573244 () ListLongMap!18941)

(assert (=> b!1263787 (= res!841731 (= lt!573244 lt!573243))))

(declare-datatypes ((Unit!42124 0))(
  ( (Unit!42125) )
))
(declare-fun lt!573242 () Unit!42124)

(declare-fun minValueBefore!43 () V!48591)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1191 (array!82464 array!82466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 V!48591 V!48591 (_ BitVec 32) Int) Unit!42124)

(assert (=> b!1263787 (= lt!573242 (lemmaNoChangeToArrayThenSameMapNoExtras!1191 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5849 (array!82464 array!82466 (_ BitVec 32) (_ BitVec 32) V!48591 V!48591 (_ BitVec 32) Int) ListLongMap!18941)

(assert (=> b!1263787 (= lt!573243 (getCurrentListMapNoExtraKeys!5849 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263787 (= lt!573244 (getCurrentListMapNoExtraKeys!5849 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263788 () Bool)

(declare-fun res!841729 () Bool)

(assert (=> b!1263788 (=> (not res!841729) (not e!719547))))

(declare-datatypes ((List!28260 0))(
  ( (Nil!28257) (Cons!28256 (h!29465 (_ BitVec 64)) (t!41777 List!28260)) )
))
(declare-fun arrayNoDuplicates!0 (array!82464 (_ BitVec 32) List!28260) Bool)

(assert (=> b!1263788 (= res!841729 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28257))))

(declare-fun mapIsEmpty!50458 () Bool)

(assert (=> mapIsEmpty!50458 mapRes!50458))

(declare-fun b!1263789 () Bool)

(declare-fun e!719544 () Bool)

(assert (=> b!1263789 (= e!719544 tp_is_empty!32419)))

(declare-fun b!1263790 () Bool)

(declare-fun e!719545 () Bool)

(assert (=> b!1263790 (= e!719545 (and e!719544 mapRes!50458))))

(declare-fun condMapEmpty!50458 () Bool)

(declare-fun mapDefault!50458 () ValueCell!15446)

