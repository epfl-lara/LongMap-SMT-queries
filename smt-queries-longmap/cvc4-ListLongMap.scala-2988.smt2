; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42222 () Bool)

(assert start!42222)

(declare-fun b_free!11741 () Bool)

(declare-fun b_next!11741 () Bool)

(assert (=> start!42222 (= b_free!11741 (not b_next!11741))))

(declare-fun tp!41248 () Bool)

(declare-fun b_and!20171 () Bool)

(assert (=> start!42222 (= tp!41248 b_and!20171)))

(declare-fun b!471246 () Bool)

(declare-fun res!281542 () Bool)

(declare-fun e!276166 () Bool)

(assert (=> b!471246 (=> (not res!281542) (not e!276166))))

(declare-datatypes ((array!30103 0))(
  ( (array!30104 (arr!14474 (Array (_ BitVec 32) (_ BitVec 64))) (size!14826 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30103)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30103 (_ BitVec 32)) Bool)

(assert (=> b!471246 (= res!281542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!281543 () Bool)

(assert (=> start!42222 (=> (not res!281543) (not e!276166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42222 (= res!281543 (validMask!0 mask!1365))))

(assert (=> start!42222 e!276166))

(declare-fun tp_is_empty!13169 () Bool)

(assert (=> start!42222 tp_is_empty!13169))

(assert (=> start!42222 tp!41248))

(assert (=> start!42222 true))

(declare-fun array_inv!10440 (array!30103) Bool)

(assert (=> start!42222 (array_inv!10440 _keys!1025)))

(declare-datatypes ((V!18663 0))(
  ( (V!18664 (val!6629 Int)) )
))
(declare-datatypes ((ValueCell!6241 0))(
  ( (ValueCellFull!6241 (v!8920 V!18663)) (EmptyCell!6241) )
))
(declare-datatypes ((array!30105 0))(
  ( (array!30106 (arr!14475 (Array (_ BitVec 32) ValueCell!6241)) (size!14827 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30105)

(declare-fun e!276168 () Bool)

(declare-fun array_inv!10441 (array!30105) Bool)

(assert (=> start!42222 (and (array_inv!10441 _values!833) e!276168)))

(declare-fun b!471247 () Bool)

(assert (=> b!471247 (= e!276166 (not true))))

(declare-datatypes ((tuple2!8730 0))(
  ( (tuple2!8731 (_1!4376 (_ BitVec 64)) (_2!4376 V!18663)) )
))
(declare-datatypes ((List!8811 0))(
  ( (Nil!8808) (Cons!8807 (h!9663 tuple2!8730) (t!14775 List!8811)) )
))
(declare-datatypes ((ListLongMap!7643 0))(
  ( (ListLongMap!7644 (toList!3837 List!8811)) )
))
(declare-fun lt!213804 () ListLongMap!7643)

(declare-fun lt!213803 () ListLongMap!7643)

(assert (=> b!471247 (= lt!213804 lt!213803)))

(declare-fun minValueBefore!38 () V!18663)

(declare-fun zeroValue!794 () V!18663)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13833 0))(
  ( (Unit!13834) )
))
(declare-fun lt!213805 () Unit!13833)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18663)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!180 (array!30103 array!30105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18663 V!18663 V!18663 V!18663 (_ BitVec 32) Int) Unit!13833)

(assert (=> b!471247 (= lt!213805 (lemmaNoChangeToArrayThenSameMapNoExtras!180 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2000 (array!30103 array!30105 (_ BitVec 32) (_ BitVec 32) V!18663 V!18663 (_ BitVec 32) Int) ListLongMap!7643)

(assert (=> b!471247 (= lt!213803 (getCurrentListMapNoExtraKeys!2000 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471247 (= lt!213804 (getCurrentListMapNoExtraKeys!2000 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471248 () Bool)

(declare-fun res!281545 () Bool)

(assert (=> b!471248 (=> (not res!281545) (not e!276166))))

(declare-datatypes ((List!8812 0))(
  ( (Nil!8809) (Cons!8808 (h!9664 (_ BitVec 64)) (t!14776 List!8812)) )
))
(declare-fun arrayNoDuplicates!0 (array!30103 (_ BitVec 32) List!8812) Bool)

(assert (=> b!471248 (= res!281545 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8809))))

(declare-fun b!471249 () Bool)

(declare-fun e!276167 () Bool)

(declare-fun mapRes!21457 () Bool)

(assert (=> b!471249 (= e!276168 (and e!276167 mapRes!21457))))

(declare-fun condMapEmpty!21457 () Bool)

(declare-fun mapDefault!21457 () ValueCell!6241)

