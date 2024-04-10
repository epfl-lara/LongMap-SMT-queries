; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104886 () Bool)

(assert start!104886)

(declare-fun b_free!26677 () Bool)

(declare-fun b_next!26677 () Bool)

(assert (=> start!104886 (= b_free!26677 (not b_next!26677))))

(declare-fun tp!93524 () Bool)

(declare-fun b_and!44453 () Bool)

(assert (=> start!104886 (= tp!93524 b_and!44453)))

(declare-fun b!1250132 () Bool)

(declare-fun e!709641 () Bool)

(declare-fun e!709642 () Bool)

(assert (=> b!1250132 (= e!709641 e!709642)))

(declare-fun res!833864 () Bool)

(assert (=> b!1250132 (=> res!833864 e!709642)))

(declare-datatypes ((V!47471 0))(
  ( (V!47472 (val!15852 Int)) )
))
(declare-datatypes ((tuple2!20420 0))(
  ( (tuple2!20421 (_1!10221 (_ BitVec 64)) (_2!10221 V!47471)) )
))
(declare-datatypes ((List!27664 0))(
  ( (Nil!27661) (Cons!27660 (h!28869 tuple2!20420) (t!41137 List!27664)) )
))
(declare-datatypes ((ListLongMap!18293 0))(
  ( (ListLongMap!18294 (toList!9162 List!27664)) )
))
(declare-fun lt!564059 () ListLongMap!18293)

(declare-fun contains!7478 (ListLongMap!18293 (_ BitVec 64)) Bool)

(assert (=> b!1250132 (= res!833864 (contains!7478 lt!564059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47471)

(declare-datatypes ((array!80828 0))(
  ( (array!80829 (arr!38980 (Array (_ BitVec 32) (_ BitVec 64))) (size!39516 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80828)

(declare-datatypes ((ValueCell!15026 0))(
  ( (ValueCellFull!15026 (v!18548 V!47471)) (EmptyCell!15026) )
))
(declare-datatypes ((array!80830 0))(
  ( (array!80831 (arr!38981 (Array (_ BitVec 32) ValueCell!15026)) (size!39517 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80830)

(declare-fun minValueBefore!43 () V!47471)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4439 (array!80828 array!80830 (_ BitVec 32) (_ BitVec 32) V!47471 V!47471 (_ BitVec 32) Int) ListLongMap!18293)

(assert (=> b!1250132 (= lt!564059 (getCurrentListMap!4439 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250133 () Bool)

(declare-fun e!709639 () Bool)

(declare-fun tp_is_empty!31579 () Bool)

(assert (=> b!1250133 (= e!709639 tp_is_empty!31579)))

(declare-fun mapIsEmpty!49132 () Bool)

(declare-fun mapRes!49132 () Bool)

(assert (=> mapIsEmpty!49132 mapRes!49132))

(declare-fun b!1250134 () Bool)

(declare-fun e!709643 () Bool)

(assert (=> b!1250134 (= e!709643 tp_is_empty!31579)))

(declare-fun b!1250135 () Bool)

(declare-fun res!833866 () Bool)

(declare-fun e!709640 () Bool)

(assert (=> b!1250135 (=> (not res!833866) (not e!709640))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250135 (= res!833866 (and (= (size!39517 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39516 _keys!1118) (size!39517 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49132 () Bool)

(declare-fun tp!93523 () Bool)

(assert (=> mapNonEmpty!49132 (= mapRes!49132 (and tp!93523 e!709643))))

(declare-fun mapValue!49132 () ValueCell!15026)

(declare-fun mapRest!49132 () (Array (_ BitVec 32) ValueCell!15026))

(declare-fun mapKey!49132 () (_ BitVec 32))

(assert (=> mapNonEmpty!49132 (= (arr!38981 _values!914) (store mapRest!49132 mapKey!49132 mapValue!49132))))

(declare-fun b!1250136 () Bool)

(declare-fun e!709637 () Bool)

(assert (=> b!1250136 (= e!709637 (and e!709639 mapRes!49132))))

(declare-fun condMapEmpty!49132 () Bool)

(declare-fun mapDefault!49132 () ValueCell!15026)

