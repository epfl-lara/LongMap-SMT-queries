; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42334 () Bool)

(assert start!42334)

(declare-fun b_free!11825 () Bool)

(declare-fun b_next!11825 () Bool)

(assert (=> start!42334 (= b_free!11825 (not b_next!11825))))

(declare-fun tp!41506 () Bool)

(declare-fun b_and!20271 () Bool)

(assert (=> start!42334 (= tp!41506 b_and!20271)))

(declare-fun mapIsEmpty!21589 () Bool)

(declare-fun mapRes!21589 () Bool)

(assert (=> mapIsEmpty!21589 mapRes!21589))

(declare-fun b!472324 () Bool)

(declare-fun e!276932 () Bool)

(assert (=> b!472324 (= e!276932 true)))

(declare-datatypes ((V!18775 0))(
  ( (V!18776 (val!6671 Int)) )
))
(declare-fun minValueBefore!38 () V!18775)

(declare-datatypes ((tuple2!8784 0))(
  ( (tuple2!8785 (_1!4403 (_ BitVec 64)) (_2!4403 V!18775)) )
))
(declare-datatypes ((List!8866 0))(
  ( (Nil!8863) (Cons!8862 (h!9718 tuple2!8784) (t!14834 List!8866)) )
))
(declare-datatypes ((ListLongMap!7697 0))(
  ( (ListLongMap!7698 (toList!3864 List!8866)) )
))
(declare-fun lt!214289 () ListLongMap!7697)

(declare-fun zeroValue!794 () V!18775)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30263 0))(
  ( (array!30264 (arr!14552 (Array (_ BitVec 32) (_ BitVec 64))) (size!14904 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30263)

(declare-datatypes ((ValueCell!6283 0))(
  ( (ValueCellFull!6283 (v!8962 V!18775)) (EmptyCell!6283) )
))
(declare-datatypes ((array!30265 0))(
  ( (array!30266 (arr!14553 (Array (_ BitVec 32) ValueCell!6283)) (size!14905 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30265)

(declare-fun getCurrentListMap!2235 (array!30263 array!30265 (_ BitVec 32) (_ BitVec 32) V!18775 V!18775 (_ BitVec 32) Int) ListLongMap!7697)

(assert (=> b!472324 (= lt!214289 (getCurrentListMap!2235 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472325 () Bool)

(declare-fun e!276935 () Bool)

(assert (=> b!472325 (= e!276935 (not e!276932))))

(declare-fun res!282135 () Bool)

(assert (=> b!472325 (=> res!282135 e!276932)))

(assert (=> b!472325 (= res!282135 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214287 () ListLongMap!7697)

(declare-fun lt!214288 () ListLongMap!7697)

(assert (=> b!472325 (= lt!214287 lt!214288)))

(declare-datatypes ((Unit!13885 0))(
  ( (Unit!13886) )
))
(declare-fun lt!214290 () Unit!13885)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18775)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!206 (array!30263 array!30265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18775 V!18775 V!18775 V!18775 (_ BitVec 32) Int) Unit!13885)

(assert (=> b!472325 (= lt!214290 (lemmaNoChangeToArrayThenSameMapNoExtras!206 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2026 (array!30263 array!30265 (_ BitVec 32) (_ BitVec 32) V!18775 V!18775 (_ BitVec 32) Int) ListLongMap!7697)

(assert (=> b!472325 (= lt!214288 (getCurrentListMapNoExtraKeys!2026 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472325 (= lt!214287 (getCurrentListMapNoExtraKeys!2026 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282137 () Bool)

(assert (=> start!42334 (=> (not res!282137) (not e!276935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42334 (= res!282137 (validMask!0 mask!1365))))

(assert (=> start!42334 e!276935))

(declare-fun tp_is_empty!13253 () Bool)

(assert (=> start!42334 tp_is_empty!13253))

(assert (=> start!42334 tp!41506))

(assert (=> start!42334 true))

(declare-fun array_inv!10492 (array!30263) Bool)

(assert (=> start!42334 (array_inv!10492 _keys!1025)))

(declare-fun e!276934 () Bool)

(declare-fun array_inv!10493 (array!30265) Bool)

(assert (=> start!42334 (and (array_inv!10493 _values!833) e!276934)))

(declare-fun b!472326 () Bool)

(declare-fun res!282134 () Bool)

(assert (=> b!472326 (=> (not res!282134) (not e!276935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30263 (_ BitVec 32)) Bool)

(assert (=> b!472326 (= res!282134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472327 () Bool)

(declare-fun e!276937 () Bool)

(assert (=> b!472327 (= e!276937 tp_is_empty!13253)))

(declare-fun b!472328 () Bool)

(declare-fun e!276933 () Bool)

(assert (=> b!472328 (= e!276934 (and e!276933 mapRes!21589))))

(declare-fun condMapEmpty!21589 () Bool)

(declare-fun mapDefault!21589 () ValueCell!6283)

