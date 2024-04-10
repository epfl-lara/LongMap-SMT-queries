; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104884 () Bool)

(assert start!104884)

(declare-fun b_free!26675 () Bool)

(declare-fun b_next!26675 () Bool)

(assert (=> start!104884 (= b_free!26675 (not b_next!26675))))

(declare-fun tp!93518 () Bool)

(declare-fun b_and!44451 () Bool)

(assert (=> start!104884 (= tp!93518 b_and!44451)))

(declare-fun b!1250105 () Bool)

(declare-fun e!709622 () Bool)

(declare-fun e!709617 () Bool)

(assert (=> b!1250105 (= e!709622 (not e!709617))))

(declare-fun res!833849 () Bool)

(assert (=> b!1250105 (=> res!833849 e!709617)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1250105 (= res!833849 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47467 0))(
  ( (V!47468 (val!15851 Int)) )
))
(declare-datatypes ((tuple2!20418 0))(
  ( (tuple2!20419 (_1!10220 (_ BitVec 64)) (_2!10220 V!47467)) )
))
(declare-datatypes ((List!27662 0))(
  ( (Nil!27659) (Cons!27658 (h!28867 tuple2!20418) (t!41135 List!27662)) )
))
(declare-datatypes ((ListLongMap!18291 0))(
  ( (ListLongMap!18292 (toList!9161 List!27662)) )
))
(declare-fun lt!564044 () ListLongMap!18291)

(declare-fun lt!564043 () ListLongMap!18291)

(assert (=> b!1250105 (= lt!564044 lt!564043)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47467)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47467)

(declare-datatypes ((array!80824 0))(
  ( (array!80825 (arr!38978 (Array (_ BitVec 32) (_ BitVec 64))) (size!39514 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80824)

(declare-fun minValueBefore!43 () V!47467)

(declare-datatypes ((Unit!41519 0))(
  ( (Unit!41520) )
))
(declare-fun lt!564045 () Unit!41519)

(declare-datatypes ((ValueCell!15025 0))(
  ( (ValueCellFull!15025 (v!18547 V!47467)) (EmptyCell!15025) )
))
(declare-datatypes ((array!80826 0))(
  ( (array!80827 (arr!38979 (Array (_ BitVec 32) ValueCell!15025)) (size!39515 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80826)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!932 (array!80824 array!80826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47467 V!47467 V!47467 V!47467 (_ BitVec 32) Int) Unit!41519)

(assert (=> b!1250105 (= lt!564045 (lemmaNoChangeToArrayThenSameMapNoExtras!932 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5568 (array!80824 array!80826 (_ BitVec 32) (_ BitVec 32) V!47467 V!47467 (_ BitVec 32) Int) ListLongMap!18291)

(assert (=> b!1250105 (= lt!564043 (getCurrentListMapNoExtraKeys!5568 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1250105 (= lt!564044 (getCurrentListMapNoExtraKeys!5568 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250106 () Bool)

(declare-fun res!833850 () Bool)

(assert (=> b!1250106 (=> (not res!833850) (not e!709622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80824 (_ BitVec 32)) Bool)

(assert (=> b!1250106 (= res!833850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49129 () Bool)

(declare-fun mapRes!49129 () Bool)

(assert (=> mapIsEmpty!49129 mapRes!49129))

(declare-fun mapNonEmpty!49129 () Bool)

(declare-fun tp!93517 () Bool)

(declare-fun e!709620 () Bool)

(assert (=> mapNonEmpty!49129 (= mapRes!49129 (and tp!93517 e!709620))))

(declare-fun mapValue!49129 () ValueCell!15025)

(declare-fun mapRest!49129 () (Array (_ BitVec 32) ValueCell!15025))

(declare-fun mapKey!49129 () (_ BitVec 32))

(assert (=> mapNonEmpty!49129 (= (arr!38979 _values!914) (store mapRest!49129 mapKey!49129 mapValue!49129))))

(declare-fun res!833847 () Bool)

(assert (=> start!104884 (=> (not res!833847) (not e!709622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104884 (= res!833847 (validMask!0 mask!1466))))

(assert (=> start!104884 e!709622))

(assert (=> start!104884 true))

(assert (=> start!104884 tp!93518))

(declare-fun tp_is_empty!31577 () Bool)

(assert (=> start!104884 tp_is_empty!31577))

(declare-fun array_inv!29741 (array!80824) Bool)

(assert (=> start!104884 (array_inv!29741 _keys!1118)))

(declare-fun e!709616 () Bool)

(declare-fun array_inv!29742 (array!80826) Bool)

(assert (=> start!104884 (and (array_inv!29742 _values!914) e!709616)))

(declare-fun b!1250107 () Bool)

(declare-fun e!709618 () Bool)

(assert (=> b!1250107 (= e!709618 true)))

(declare-fun lt!564047 () ListLongMap!18291)

(declare-fun -!1992 (ListLongMap!18291 (_ BitVec 64)) ListLongMap!18291)

(assert (=> b!1250107 (= (-!1992 lt!564047 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564047)))

(declare-fun lt!564046 () Unit!41519)

(declare-fun removeNotPresentStillSame!87 (ListLongMap!18291 (_ BitVec 64)) Unit!41519)

(assert (=> b!1250107 (= lt!564046 (removeNotPresentStillSame!87 lt!564047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250108 () Bool)

(assert (=> b!1250108 (= e!709617 e!709618)))

(declare-fun res!833846 () Bool)

(assert (=> b!1250108 (=> res!833846 e!709618)))

(declare-fun contains!7477 (ListLongMap!18291 (_ BitVec 64)) Bool)

(assert (=> b!1250108 (= res!833846 (contains!7477 lt!564047 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4438 (array!80824 array!80826 (_ BitVec 32) (_ BitVec 32) V!47467 V!47467 (_ BitVec 32) Int) ListLongMap!18291)

(assert (=> b!1250108 (= lt!564047 (getCurrentListMap!4438 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250109 () Bool)

(declare-fun res!833848 () Bool)

(assert (=> b!1250109 (=> (not res!833848) (not e!709622))))

(assert (=> b!1250109 (= res!833848 (and (= (size!39515 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39514 _keys!1118) (size!39515 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1250110 () Bool)

(declare-fun e!709621 () Bool)

(assert (=> b!1250110 (= e!709621 tp_is_empty!31577)))

(declare-fun b!1250111 () Bool)

(declare-fun res!833851 () Bool)

(assert (=> b!1250111 (=> (not res!833851) (not e!709622))))

(declare-datatypes ((List!27663 0))(
  ( (Nil!27660) (Cons!27659 (h!28868 (_ BitVec 64)) (t!41136 List!27663)) )
))
(declare-fun arrayNoDuplicates!0 (array!80824 (_ BitVec 32) List!27663) Bool)

(assert (=> b!1250111 (= res!833851 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27660))))

(declare-fun b!1250112 () Bool)

(assert (=> b!1250112 (= e!709616 (and e!709621 mapRes!49129))))

(declare-fun condMapEmpty!49129 () Bool)

(declare-fun mapDefault!49129 () ValueCell!15025)

