; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104878 () Bool)

(assert start!104878)

(declare-fun b_free!26669 () Bool)

(declare-fun b_next!26669 () Bool)

(assert (=> start!104878 (= b_free!26669 (not b_next!26669))))

(declare-fun tp!93499 () Bool)

(declare-fun b_and!44445 () Bool)

(assert (=> start!104878 (= tp!93499 b_and!44445)))

(declare-fun b!1250024 () Bool)

(declare-fun res!833795 () Bool)

(declare-fun e!709558 () Bool)

(assert (=> b!1250024 (=> (not res!833795) (not e!709558))))

(declare-datatypes ((array!80812 0))(
  ( (array!80813 (arr!38972 (Array (_ BitVec 32) (_ BitVec 64))) (size!39508 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80812)

(declare-datatypes ((List!27656 0))(
  ( (Nil!27653) (Cons!27652 (h!28861 (_ BitVec 64)) (t!41129 List!27656)) )
))
(declare-fun arrayNoDuplicates!0 (array!80812 (_ BitVec 32) List!27656) Bool)

(assert (=> b!1250024 (= res!833795 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27653))))

(declare-fun mapIsEmpty!49120 () Bool)

(declare-fun mapRes!49120 () Bool)

(assert (=> mapIsEmpty!49120 mapRes!49120))

(declare-fun b!1250025 () Bool)

(declare-fun e!709556 () Bool)

(declare-fun tp_is_empty!31571 () Bool)

(assert (=> b!1250025 (= e!709556 tp_is_empty!31571)))

(declare-fun b!1250026 () Bool)

(declare-fun e!709559 () Bool)

(assert (=> b!1250026 (= e!709558 (not e!709559))))

(declare-fun res!833793 () Bool)

(assert (=> b!1250026 (=> res!833793 e!709559)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250026 (= res!833793 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47459 0))(
  ( (V!47460 (val!15848 Int)) )
))
(declare-datatypes ((tuple2!20412 0))(
  ( (tuple2!20413 (_1!10217 (_ BitVec 64)) (_2!10217 V!47459)) )
))
(declare-datatypes ((List!27657 0))(
  ( (Nil!27654) (Cons!27653 (h!28862 tuple2!20412) (t!41130 List!27657)) )
))
(declare-datatypes ((ListLongMap!18285 0))(
  ( (ListLongMap!18286 (toList!9158 List!27657)) )
))
(declare-fun lt!564000 () ListLongMap!18285)

(declare-fun lt!563999 () ListLongMap!18285)

(assert (=> b!1250026 (= lt!564000 lt!563999)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47459)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47459)

(declare-datatypes ((ValueCell!15022 0))(
  ( (ValueCellFull!15022 (v!18544 V!47459)) (EmptyCell!15022) )
))
(declare-datatypes ((array!80814 0))(
  ( (array!80815 (arr!38973 (Array (_ BitVec 32) ValueCell!15022)) (size!39509 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80814)

(declare-datatypes ((Unit!41513 0))(
  ( (Unit!41514) )
))
(declare-fun lt!564001 () Unit!41513)

(declare-fun minValueBefore!43 () V!47459)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!929 (array!80812 array!80814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47459 V!47459 V!47459 V!47459 (_ BitVec 32) Int) Unit!41513)

(assert (=> b!1250026 (= lt!564001 (lemmaNoChangeToArrayThenSameMapNoExtras!929 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5565 (array!80812 array!80814 (_ BitVec 32) (_ BitVec 32) V!47459 V!47459 (_ BitVec 32) Int) ListLongMap!18285)

(assert (=> b!1250026 (= lt!563999 (getCurrentListMapNoExtraKeys!5565 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250026 (= lt!564000 (getCurrentListMapNoExtraKeys!5565 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250027 () Bool)

(declare-fun e!709557 () Bool)

(assert (=> b!1250027 (= e!709557 (and e!709556 mapRes!49120))))

(declare-fun condMapEmpty!49120 () Bool)

(declare-fun mapDefault!49120 () ValueCell!15022)

