; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104770 () Bool)

(assert start!104770)

(declare-fun b_free!26575 () Bool)

(declare-fun b_next!26575 () Bool)

(assert (=> start!104770 (= b_free!26575 (not b_next!26575))))

(declare-fun tp!93214 () Bool)

(declare-fun b_and!44343 () Bool)

(assert (=> start!104770 (= tp!93214 b_and!44343)))

(declare-fun b!1248927 () Bool)

(declare-fun res!833174 () Bool)

(declare-fun e!708771 () Bool)

(assert (=> b!1248927 (=> (not res!833174) (not e!708771))))

(declare-datatypes ((array!80640 0))(
  ( (array!80641 (arr!38887 (Array (_ BitVec 32) (_ BitVec 64))) (size!39423 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80640)

(declare-datatypes ((List!27597 0))(
  ( (Nil!27594) (Cons!27593 (h!28802 (_ BitVec 64)) (t!41068 List!27597)) )
))
(declare-fun arrayNoDuplicates!0 (array!80640 (_ BitVec 32) List!27597) Bool)

(assert (=> b!1248927 (= res!833174 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27594))))

(declare-fun b!1248928 () Bool)

(assert (=> b!1248928 (= e!708771 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47335 0))(
  ( (V!47336 (val!15801 Int)) )
))
(declare-fun zeroValue!871 () V!47335)

(declare-datatypes ((ValueCell!14975 0))(
  ( (ValueCellFull!14975 (v!18497 V!47335)) (EmptyCell!14975) )
))
(declare-datatypes ((array!80642 0))(
  ( (array!80643 (arr!38888 (Array (_ BitVec 32) ValueCell!14975)) (size!39424 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80642)

(declare-datatypes ((tuple2!20350 0))(
  ( (tuple2!20351 (_1!10186 (_ BitVec 64)) (_2!10186 V!47335)) )
))
(declare-datatypes ((List!27598 0))(
  ( (Nil!27595) (Cons!27594 (h!28803 tuple2!20350) (t!41069 List!27598)) )
))
(declare-datatypes ((ListLongMap!18223 0))(
  ( (ListLongMap!18224 (toList!9127 List!27598)) )
))
(declare-fun lt!563554 () ListLongMap!18223)

(declare-fun minValueAfter!43 () V!47335)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5534 (array!80640 array!80642 (_ BitVec 32) (_ BitVec 32) V!47335 V!47335 (_ BitVec 32) Int) ListLongMap!18223)

(assert (=> b!1248928 (= lt!563554 (getCurrentListMapNoExtraKeys!5534 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!563553 () ListLongMap!18223)

(declare-fun minValueBefore!43 () V!47335)

(assert (=> b!1248928 (= lt!563553 (getCurrentListMapNoExtraKeys!5534 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248929 () Bool)

(declare-fun e!708768 () Bool)

(declare-fun tp_is_empty!31477 () Bool)

(assert (=> b!1248929 (= e!708768 tp_is_empty!31477)))

(declare-fun mapIsEmpty!48976 () Bool)

(declare-fun mapRes!48976 () Bool)

(assert (=> mapIsEmpty!48976 mapRes!48976))

(declare-fun res!833172 () Bool)

(assert (=> start!104770 (=> (not res!833172) (not e!708771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104770 (= res!833172 (validMask!0 mask!1466))))

(assert (=> start!104770 e!708771))

(assert (=> start!104770 true))

(assert (=> start!104770 tp!93214))

(assert (=> start!104770 tp_is_empty!31477))

(declare-fun array_inv!29675 (array!80640) Bool)

(assert (=> start!104770 (array_inv!29675 _keys!1118)))

(declare-fun e!708770 () Bool)

(declare-fun array_inv!29676 (array!80642) Bool)

(assert (=> start!104770 (and (array_inv!29676 _values!914) e!708770)))

(declare-fun b!1248930 () Bool)

(declare-fun e!708769 () Bool)

(assert (=> b!1248930 (= e!708769 tp_is_empty!31477)))

(declare-fun b!1248931 () Bool)

(declare-fun res!833173 () Bool)

(assert (=> b!1248931 (=> (not res!833173) (not e!708771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80640 (_ BitVec 32)) Bool)

(assert (=> b!1248931 (= res!833173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48976 () Bool)

(declare-fun tp!93215 () Bool)

(assert (=> mapNonEmpty!48976 (= mapRes!48976 (and tp!93215 e!708769))))

(declare-fun mapValue!48976 () ValueCell!14975)

(declare-fun mapRest!48976 () (Array (_ BitVec 32) ValueCell!14975))

(declare-fun mapKey!48976 () (_ BitVec 32))

(assert (=> mapNonEmpty!48976 (= (arr!38888 _values!914) (store mapRest!48976 mapKey!48976 mapValue!48976))))

(declare-fun b!1248932 () Bool)

(assert (=> b!1248932 (= e!708770 (and e!708768 mapRes!48976))))

(declare-fun condMapEmpty!48976 () Bool)

(declare-fun mapDefault!48976 () ValueCell!14975)

