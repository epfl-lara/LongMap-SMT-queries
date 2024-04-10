; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105708 () Bool)

(assert start!105708)

(declare-fun b_free!27293 () Bool)

(declare-fun b_next!27293 () Bool)

(assert (=> start!105708 (= b_free!27293 (not b_next!27293))))

(declare-fun tp!95404 () Bool)

(declare-fun b_and!45177 () Bool)

(assert (=> start!105708 (= tp!95404 b_and!45177)))

(declare-fun b!1259176 () Bool)

(declare-fun e!716283 () Bool)

(declare-fun e!716281 () Bool)

(assert (=> b!1259176 (= e!716283 (not e!716281))))

(declare-fun res!839210 () Bool)

(assert (=> b!1259176 (=> res!839210 e!716281)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1259176 (= res!839210 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48291 0))(
  ( (V!48292 (val!16160 Int)) )
))
(declare-datatypes ((tuple2!20884 0))(
  ( (tuple2!20885 (_1!10453 (_ BitVec 64)) (_2!10453 V!48291)) )
))
(declare-datatypes ((List!28094 0))(
  ( (Nil!28091) (Cons!28090 (h!29299 tuple2!20884) (t!41589 List!28094)) )
))
(declare-datatypes ((ListLongMap!18757 0))(
  ( (ListLongMap!18758 (toList!9394 List!28094)) )
))
(declare-fun lt!569785 () ListLongMap!18757)

(declare-fun lt!569782 () ListLongMap!18757)

(assert (=> b!1259176 (= lt!569785 lt!569782)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48291)

(declare-datatypes ((Unit!41971 0))(
  ( (Unit!41972) )
))
(declare-fun lt!569780 () Unit!41971)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48291)

(declare-datatypes ((array!82008 0))(
  ( (array!82009 (arr!39559 (Array (_ BitVec 32) (_ BitVec 64))) (size!40095 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82008)

(declare-datatypes ((ValueCell!15334 0))(
  ( (ValueCellFull!15334 (v!18862 V!48291)) (EmptyCell!15334) )
))
(declare-datatypes ((array!82010 0))(
  ( (array!82011 (arr!39560 (Array (_ BitVec 32) ValueCell!15334)) (size!40096 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82010)

(declare-fun minValueBefore!43 () V!48291)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1135 (array!82008 array!82010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48291 V!48291 V!48291 V!48291 (_ BitVec 32) Int) Unit!41971)

(assert (=> b!1259176 (= lt!569780 (lemmaNoChangeToArrayThenSameMapNoExtras!1135 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5771 (array!82008 array!82010 (_ BitVec 32) (_ BitVec 32) V!48291 V!48291 (_ BitVec 32) Int) ListLongMap!18757)

(assert (=> b!1259176 (= lt!569782 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259176 (= lt!569785 (getCurrentListMapNoExtraKeys!5771 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259177 () Bool)

(declare-fun e!716280 () Bool)

(declare-fun tp_is_empty!32195 () Bool)

(assert (=> b!1259177 (= e!716280 tp_is_empty!32195)))

(declare-fun mapNonEmpty!50089 () Bool)

(declare-fun mapRes!50089 () Bool)

(declare-fun tp!95405 () Bool)

(declare-fun e!716277 () Bool)

(assert (=> mapNonEmpty!50089 (= mapRes!50089 (and tp!95405 e!716277))))

(declare-fun mapKey!50089 () (_ BitVec 32))

(declare-fun mapRest!50089 () (Array (_ BitVec 32) ValueCell!15334))

(declare-fun mapValue!50089 () ValueCell!15334)

(assert (=> mapNonEmpty!50089 (= (arr!39560 _values!914) (store mapRest!50089 mapKey!50089 mapValue!50089))))

(declare-fun b!1259178 () Bool)

(declare-fun e!716279 () Bool)

(assert (=> b!1259178 (= e!716279 (and e!716280 mapRes!50089))))

(declare-fun condMapEmpty!50089 () Bool)

(declare-fun mapDefault!50089 () ValueCell!15334)

