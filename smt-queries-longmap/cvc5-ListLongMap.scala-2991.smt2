; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42250 () Bool)

(assert start!42250)

(declare-fun b_free!11755 () Bool)

(declare-fun b_next!11755 () Bool)

(assert (=> start!42250 (= b_free!11755 (not b_next!11755))))

(declare-fun tp!41292 () Bool)

(declare-fun b_and!20193 () Bool)

(assert (=> start!42250 (= tp!41292 b_and!20193)))

(declare-fun mapNonEmpty!21481 () Bool)

(declare-fun mapRes!21481 () Bool)

(declare-fun tp!41293 () Bool)

(declare-fun e!276327 () Bool)

(assert (=> mapNonEmpty!21481 (= mapRes!21481 (and tp!41293 e!276327))))

(declare-datatypes ((V!18683 0))(
  ( (V!18684 (val!6636 Int)) )
))
(declare-datatypes ((ValueCell!6248 0))(
  ( (ValueCellFull!6248 (v!8927 V!18683)) (EmptyCell!6248) )
))
(declare-fun mapRest!21481 () (Array (_ BitVec 32) ValueCell!6248))

(declare-fun mapValue!21481 () ValueCell!6248)

(declare-datatypes ((array!30129 0))(
  ( (array!30130 (arr!14486 (Array (_ BitVec 32) ValueCell!6248)) (size!14838 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30129)

(declare-fun mapKey!21481 () (_ BitVec 32))

(assert (=> mapNonEmpty!21481 (= (arr!14486 _values!833) (store mapRest!21481 mapKey!21481 mapValue!21481))))

(declare-fun b!471479 () Bool)

(declare-fun res!281659 () Bool)

(declare-fun e!276330 () Bool)

(assert (=> b!471479 (=> (not res!281659) (not e!276330))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30131 0))(
  ( (array!30132 (arr!14487 (Array (_ BitVec 32) (_ BitVec 64))) (size!14839 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30131)

(assert (=> b!471479 (= res!281659 (and (= (size!14838 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14839 _keys!1025) (size!14838 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471480 () Bool)

(assert (=> b!471480 (= e!276330 (not true))))

(declare-datatypes ((tuple2!8736 0))(
  ( (tuple2!8737 (_1!4379 (_ BitVec 64)) (_2!4379 V!18683)) )
))
(declare-datatypes ((List!8818 0))(
  ( (Nil!8815) (Cons!8814 (h!9670 tuple2!8736) (t!14784 List!8818)) )
))
(declare-datatypes ((ListLongMap!7649 0))(
  ( (ListLongMap!7650 (toList!3840 List!8818)) )
))
(declare-fun lt!213908 () ListLongMap!7649)

(declare-fun lt!213906 () ListLongMap!7649)

(assert (=> b!471480 (= lt!213908 lt!213906)))

(declare-fun minValueBefore!38 () V!18683)

(declare-fun zeroValue!794 () V!18683)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18683)

(declare-datatypes ((Unit!13839 0))(
  ( (Unit!13840) )
))
(declare-fun lt!213907 () Unit!13839)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!183 (array!30131 array!30129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18683 V!18683 V!18683 V!18683 (_ BitVec 32) Int) Unit!13839)

(assert (=> b!471480 (= lt!213907 (lemmaNoChangeToArrayThenSameMapNoExtras!183 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2003 (array!30131 array!30129 (_ BitVec 32) (_ BitVec 32) V!18683 V!18683 (_ BitVec 32) Int) ListLongMap!7649)

(assert (=> b!471480 (= lt!213906 (getCurrentListMapNoExtraKeys!2003 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471480 (= lt!213908 (getCurrentListMapNoExtraKeys!2003 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471481 () Bool)

(declare-fun e!276329 () Bool)

(declare-fun e!276326 () Bool)

(assert (=> b!471481 (= e!276329 (and e!276326 mapRes!21481))))

(declare-fun condMapEmpty!21481 () Bool)

(declare-fun mapDefault!21481 () ValueCell!6248)

