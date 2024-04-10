; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42210 () Bool)

(assert start!42210)

(declare-fun b_free!11729 () Bool)

(declare-fun b_next!11729 () Bool)

(assert (=> start!42210 (= b_free!11729 (not b_next!11729))))

(declare-fun tp!41212 () Bool)

(declare-fun b_and!20159 () Bool)

(assert (=> start!42210 (= tp!41212 b_and!20159)))

(declare-fun b!471120 () Bool)

(declare-fun res!281472 () Bool)

(declare-fun e!276077 () Bool)

(assert (=> b!471120 (=> (not res!281472) (not e!276077))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30079 0))(
  ( (array!30080 (arr!14462 (Array (_ BitVec 32) (_ BitVec 64))) (size!14814 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30079)

(declare-datatypes ((V!18647 0))(
  ( (V!18648 (val!6623 Int)) )
))
(declare-datatypes ((ValueCell!6235 0))(
  ( (ValueCellFull!6235 (v!8914 V!18647)) (EmptyCell!6235) )
))
(declare-datatypes ((array!30081 0))(
  ( (array!30082 (arr!14463 (Array (_ BitVec 32) ValueCell!6235)) (size!14815 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30081)

(assert (=> b!471120 (= res!281472 (and (= (size!14815 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14814 _keys!1025) (size!14815 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!281473 () Bool)

(assert (=> start!42210 (=> (not res!281473) (not e!276077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42210 (= res!281473 (validMask!0 mask!1365))))

(assert (=> start!42210 e!276077))

(declare-fun tp_is_empty!13157 () Bool)

(assert (=> start!42210 tp_is_empty!13157))

(assert (=> start!42210 tp!41212))

(assert (=> start!42210 true))

(declare-fun array_inv!10432 (array!30079) Bool)

(assert (=> start!42210 (array_inv!10432 _keys!1025)))

(declare-fun e!276079 () Bool)

(declare-fun array_inv!10433 (array!30081) Bool)

(assert (=> start!42210 (and (array_inv!10433 _values!833) e!276079)))

(declare-fun b!471121 () Bool)

(assert (=> b!471121 (= e!276077 (not true))))

(declare-datatypes ((tuple2!8722 0))(
  ( (tuple2!8723 (_1!4372 (_ BitVec 64)) (_2!4372 V!18647)) )
))
(declare-datatypes ((List!8801 0))(
  ( (Nil!8798) (Cons!8797 (h!9653 tuple2!8722) (t!14765 List!8801)) )
))
(declare-datatypes ((ListLongMap!7635 0))(
  ( (ListLongMap!7636 (toList!3833 List!8801)) )
))
(declare-fun lt!213749 () ListLongMap!7635)

(declare-fun lt!213751 () ListLongMap!7635)

(assert (=> b!471121 (= lt!213749 lt!213751)))

(declare-fun minValueBefore!38 () V!18647)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18647)

(declare-datatypes ((Unit!13825 0))(
  ( (Unit!13826) )
))
(declare-fun lt!213750 () Unit!13825)

(declare-fun minValueAfter!38 () V!18647)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!176 (array!30079 array!30081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18647 V!18647 V!18647 V!18647 (_ BitVec 32) Int) Unit!13825)

(assert (=> b!471121 (= lt!213750 (lemmaNoChangeToArrayThenSameMapNoExtras!176 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1996 (array!30079 array!30081 (_ BitVec 32) (_ BitVec 32) V!18647 V!18647 (_ BitVec 32) Int) ListLongMap!7635)

(assert (=> b!471121 (= lt!213751 (getCurrentListMapNoExtraKeys!1996 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471121 (= lt!213749 (getCurrentListMapNoExtraKeys!1996 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471122 () Bool)

(declare-fun res!281471 () Bool)

(assert (=> b!471122 (=> (not res!281471) (not e!276077))))

(declare-datatypes ((List!8802 0))(
  ( (Nil!8799) (Cons!8798 (h!9654 (_ BitVec 64)) (t!14766 List!8802)) )
))
(declare-fun arrayNoDuplicates!0 (array!30079 (_ BitVec 32) List!8802) Bool)

(assert (=> b!471122 (= res!281471 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8799))))

(declare-fun mapIsEmpty!21439 () Bool)

(declare-fun mapRes!21439 () Bool)

(assert (=> mapIsEmpty!21439 mapRes!21439))

(declare-fun b!471123 () Bool)

(declare-fun e!276080 () Bool)

(assert (=> b!471123 (= e!276080 tp_is_empty!13157)))

(declare-fun b!471124 () Bool)

(declare-fun e!276078 () Bool)

(assert (=> b!471124 (= e!276078 tp_is_empty!13157)))

(declare-fun b!471125 () Bool)

(declare-fun res!281470 () Bool)

(assert (=> b!471125 (=> (not res!281470) (not e!276077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30079 (_ BitVec 32)) Bool)

(assert (=> b!471125 (= res!281470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21439 () Bool)

(declare-fun tp!41211 () Bool)

(assert (=> mapNonEmpty!21439 (= mapRes!21439 (and tp!41211 e!276078))))

(declare-fun mapValue!21439 () ValueCell!6235)

(declare-fun mapKey!21439 () (_ BitVec 32))

(declare-fun mapRest!21439 () (Array (_ BitVec 32) ValueCell!6235))

(assert (=> mapNonEmpty!21439 (= (arr!14463 _values!833) (store mapRest!21439 mapKey!21439 mapValue!21439))))

(declare-fun b!471126 () Bool)

(assert (=> b!471126 (= e!276079 (and e!276080 mapRes!21439))))

(declare-fun condMapEmpty!21439 () Bool)

(declare-fun mapDefault!21439 () ValueCell!6235)

