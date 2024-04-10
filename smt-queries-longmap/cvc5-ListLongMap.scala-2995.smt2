; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42274 () Bool)

(assert start!42274)

(declare-fun b_free!11779 () Bool)

(declare-fun b_next!11779 () Bool)

(assert (=> start!42274 (= b_free!11779 (not b_next!11779))))

(declare-fun tp!41365 () Bool)

(declare-fun b_and!20217 () Bool)

(assert (=> start!42274 (= tp!41365 b_and!20217)))

(declare-fun res!281802 () Bool)

(declare-fun e!276510 () Bool)

(assert (=> start!42274 (=> (not res!281802) (not e!276510))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42274 (= res!281802 (validMask!0 mask!1365))))

(assert (=> start!42274 e!276510))

(declare-fun tp_is_empty!13207 () Bool)

(assert (=> start!42274 tp_is_empty!13207))

(assert (=> start!42274 tp!41365))

(assert (=> start!42274 true))

(declare-datatypes ((array!30175 0))(
  ( (array!30176 (arr!14509 (Array (_ BitVec 32) (_ BitVec 64))) (size!14861 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30175)

(declare-fun array_inv!10458 (array!30175) Bool)

(assert (=> start!42274 (array_inv!10458 _keys!1025)))

(declare-datatypes ((V!18715 0))(
  ( (V!18716 (val!6648 Int)) )
))
(declare-datatypes ((ValueCell!6260 0))(
  ( (ValueCellFull!6260 (v!8939 V!18715)) (EmptyCell!6260) )
))
(declare-datatypes ((array!30177 0))(
  ( (array!30178 (arr!14510 (Array (_ BitVec 32) ValueCell!6260)) (size!14862 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30177)

(declare-fun e!276506 () Bool)

(declare-fun array_inv!10459 (array!30177) Bool)

(assert (=> start!42274 (and (array_inv!10459 _values!833) e!276506)))

(declare-fun b!471730 () Bool)

(declare-fun e!276507 () Bool)

(assert (=> b!471730 (= e!276507 tp_is_empty!13207)))

(declare-fun b!471731 () Bool)

(declare-fun res!281803 () Bool)

(assert (=> b!471731 (=> (not res!281803) (not e!276510))))

(declare-datatypes ((List!8833 0))(
  ( (Nil!8830) (Cons!8829 (h!9685 (_ BitVec 64)) (t!14799 List!8833)) )
))
(declare-fun arrayNoDuplicates!0 (array!30175 (_ BitVec 32) List!8833) Bool)

(assert (=> b!471731 (= res!281803 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8830))))

(declare-fun mapIsEmpty!21517 () Bool)

(declare-fun mapRes!21517 () Bool)

(assert (=> mapIsEmpty!21517 mapRes!21517))

(declare-fun b!471732 () Bool)

(assert (=> b!471732 (= e!276510 (not true))))

(declare-datatypes ((tuple2!8750 0))(
  ( (tuple2!8751 (_1!4386 (_ BitVec 64)) (_2!4386 V!18715)) )
))
(declare-datatypes ((List!8834 0))(
  ( (Nil!8831) (Cons!8830 (h!9686 tuple2!8750) (t!14800 List!8834)) )
))
(declare-datatypes ((ListLongMap!7663 0))(
  ( (ListLongMap!7664 (toList!3847 List!8834)) )
))
(declare-fun lt!214014 () ListLongMap!7663)

(declare-fun lt!214016 () ListLongMap!7663)

(assert (=> b!471732 (= lt!214014 lt!214016)))

(declare-fun minValueBefore!38 () V!18715)

(declare-fun zeroValue!794 () V!18715)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13853 0))(
  ( (Unit!13854) )
))
(declare-fun lt!214015 () Unit!13853)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18715)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!190 (array!30175 array!30177 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18715 V!18715 V!18715 V!18715 (_ BitVec 32) Int) Unit!13853)

(assert (=> b!471732 (= lt!214015 (lemmaNoChangeToArrayThenSameMapNoExtras!190 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2010 (array!30175 array!30177 (_ BitVec 32) (_ BitVec 32) V!18715 V!18715 (_ BitVec 32) Int) ListLongMap!7663)

(assert (=> b!471732 (= lt!214016 (getCurrentListMapNoExtraKeys!2010 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471732 (= lt!214014 (getCurrentListMapNoExtraKeys!2010 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21517 () Bool)

(declare-fun tp!41364 () Bool)

(assert (=> mapNonEmpty!21517 (= mapRes!21517 (and tp!41364 e!276507))))

(declare-fun mapKey!21517 () (_ BitVec 32))

(declare-fun mapRest!21517 () (Array (_ BitVec 32) ValueCell!6260))

(declare-fun mapValue!21517 () ValueCell!6260)

(assert (=> mapNonEmpty!21517 (= (arr!14510 _values!833) (store mapRest!21517 mapKey!21517 mapValue!21517))))

(declare-fun b!471733 () Bool)

(declare-fun res!281801 () Bool)

(assert (=> b!471733 (=> (not res!281801) (not e!276510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30175 (_ BitVec 32)) Bool)

(assert (=> b!471733 (= res!281801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471734 () Bool)

(declare-fun res!281804 () Bool)

(assert (=> b!471734 (=> (not res!281804) (not e!276510))))

(assert (=> b!471734 (= res!281804 (and (= (size!14862 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14861 _keys!1025) (size!14862 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471735 () Bool)

(declare-fun e!276508 () Bool)

(assert (=> b!471735 (= e!276506 (and e!276508 mapRes!21517))))

(declare-fun condMapEmpty!21517 () Bool)

(declare-fun mapDefault!21517 () ValueCell!6260)

