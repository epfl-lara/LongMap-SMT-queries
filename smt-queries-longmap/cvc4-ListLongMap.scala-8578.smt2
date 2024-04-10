; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104690 () Bool)

(assert start!104690)

(declare-fun b_free!26507 () Bool)

(declare-fun b_next!26507 () Bool)

(assert (=> start!104690 (= b_free!26507 (not b_next!26507))))

(declare-fun tp!93007 () Bool)

(declare-fun b_and!44271 () Bool)

(assert (=> start!104690 (= tp!93007 b_and!44271)))

(declare-fun b!1248140 () Bool)

(declare-fun e!708214 () Bool)

(assert (=> b!1248140 (= e!708214 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47243 0))(
  ( (V!47244 (val!15767 Int)) )
))
(declare-datatypes ((tuple2!20308 0))(
  ( (tuple2!20309 (_1!10165 (_ BitVec 64)) (_2!10165 V!47243)) )
))
(declare-datatypes ((List!27556 0))(
  ( (Nil!27553) (Cons!27552 (h!28761 tuple2!20308) (t!41025 List!27556)) )
))
(declare-datatypes ((ListLongMap!18181 0))(
  ( (ListLongMap!18182 (toList!9106 List!27556)) )
))
(declare-fun lt!563365 () ListLongMap!18181)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47243)

(declare-datatypes ((array!80510 0))(
  ( (array!80511 (arr!38823 (Array (_ BitVec 32) (_ BitVec 64))) (size!39359 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80510)

(declare-datatypes ((ValueCell!14941 0))(
  ( (ValueCellFull!14941 (v!18463 V!47243)) (EmptyCell!14941) )
))
(declare-datatypes ((array!80512 0))(
  ( (array!80513 (arr!38824 (Array (_ BitVec 32) ValueCell!14941)) (size!39360 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80512)

(declare-fun minValueBefore!43 () V!47243)

(declare-fun getCurrentListMapNoExtraKeys!5513 (array!80510 array!80512 (_ BitVec 32) (_ BitVec 32) V!47243 V!47243 (_ BitVec 32) Int) ListLongMap!18181)

(assert (=> b!1248140 (= lt!563365 (getCurrentListMapNoExtraKeys!5513 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248141 () Bool)

(declare-fun res!832738 () Bool)

(assert (=> b!1248141 (=> (not res!832738) (not e!708214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80510 (_ BitVec 32)) Bool)

(assert (=> b!1248141 (= res!832738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248142 () Bool)

(declare-fun e!708212 () Bool)

(declare-fun tp_is_empty!31409 () Bool)

(assert (=> b!1248142 (= e!708212 tp_is_empty!31409)))

(declare-fun mapNonEmpty!48871 () Bool)

(declare-fun mapRes!48871 () Bool)

(declare-fun tp!93008 () Bool)

(assert (=> mapNonEmpty!48871 (= mapRes!48871 (and tp!93008 e!708212))))

(declare-fun mapValue!48871 () ValueCell!14941)

(declare-fun mapRest!48871 () (Array (_ BitVec 32) ValueCell!14941))

(declare-fun mapKey!48871 () (_ BitVec 32))

(assert (=> mapNonEmpty!48871 (= (arr!38824 _values!914) (store mapRest!48871 mapKey!48871 mapValue!48871))))

(declare-fun b!1248143 () Bool)

(declare-fun res!832737 () Bool)

(assert (=> b!1248143 (=> (not res!832737) (not e!708214))))

(declare-datatypes ((List!27557 0))(
  ( (Nil!27554) (Cons!27553 (h!28762 (_ BitVec 64)) (t!41026 List!27557)) )
))
(declare-fun arrayNoDuplicates!0 (array!80510 (_ BitVec 32) List!27557) Bool)

(assert (=> b!1248143 (= res!832737 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27554))))

(declare-fun b!1248144 () Bool)

(declare-fun e!708211 () Bool)

(declare-fun e!708210 () Bool)

(assert (=> b!1248144 (= e!708211 (and e!708210 mapRes!48871))))

(declare-fun condMapEmpty!48871 () Bool)

(declare-fun mapDefault!48871 () ValueCell!14941)

