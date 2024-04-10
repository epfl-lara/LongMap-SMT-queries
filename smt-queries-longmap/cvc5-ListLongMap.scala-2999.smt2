; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42298 () Bool)

(assert start!42298)

(declare-fun b_free!11803 () Bool)

(declare-fun b_next!11803 () Bool)

(assert (=> start!42298 (= b_free!11803 (not b_next!11803))))

(declare-fun tp!41436 () Bool)

(declare-fun b_and!20241 () Bool)

(assert (=> start!42298 (= tp!41436 b_and!20241)))

(declare-fun b!471982 () Bool)

(declare-fun e!276686 () Bool)

(declare-fun tp_is_empty!13231 () Bool)

(assert (=> b!471982 (= e!276686 tp_is_empty!13231)))

(declare-fun b!471983 () Bool)

(declare-fun res!281948 () Bool)

(declare-fun e!276690 () Bool)

(assert (=> b!471983 (=> (not res!281948) (not e!276690))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30219 0))(
  ( (array!30220 (arr!14531 (Array (_ BitVec 32) (_ BitVec 64))) (size!14883 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30219)

(declare-datatypes ((V!18747 0))(
  ( (V!18748 (val!6660 Int)) )
))
(declare-datatypes ((ValueCell!6272 0))(
  ( (ValueCellFull!6272 (v!8951 V!18747)) (EmptyCell!6272) )
))
(declare-datatypes ((array!30221 0))(
  ( (array!30222 (arr!14532 (Array (_ BitVec 32) ValueCell!6272)) (size!14884 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30221)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!471983 (= res!281948 (and (= (size!14884 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14883 _keys!1025) (size!14884 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!281945 () Bool)

(assert (=> start!42298 (=> (not res!281945) (not e!276690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42298 (= res!281945 (validMask!0 mask!1365))))

(assert (=> start!42298 e!276690))

(assert (=> start!42298 tp_is_empty!13231))

(assert (=> start!42298 tp!41436))

(assert (=> start!42298 true))

(declare-fun array_inv!10474 (array!30219) Bool)

(assert (=> start!42298 (array_inv!10474 _keys!1025)))

(declare-fun e!276688 () Bool)

(declare-fun array_inv!10475 (array!30221) Bool)

(assert (=> start!42298 (and (array_inv!10475 _values!833) e!276688)))

(declare-fun mapIsEmpty!21553 () Bool)

(declare-fun mapRes!21553 () Bool)

(assert (=> mapIsEmpty!21553 mapRes!21553))

(declare-fun b!471984 () Bool)

(assert (=> b!471984 (= e!276690 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!14883 _keys!1025)))))))

(declare-datatypes ((tuple2!8766 0))(
  ( (tuple2!8767 (_1!4394 (_ BitVec 64)) (_2!4394 V!18747)) )
))
(declare-datatypes ((List!8849 0))(
  ( (Nil!8846) (Cons!8845 (h!9701 tuple2!8766) (t!14815 List!8849)) )
))
(declare-datatypes ((ListLongMap!7679 0))(
  ( (ListLongMap!7680 (toList!3855 List!8849)) )
))
(declare-fun lt!214122 () ListLongMap!7679)

(declare-fun lt!214124 () ListLongMap!7679)

(assert (=> b!471984 (= lt!214122 lt!214124)))

(declare-fun minValueBefore!38 () V!18747)

(declare-fun zeroValue!794 () V!18747)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13869 0))(
  ( (Unit!13870) )
))
(declare-fun lt!214123 () Unit!13869)

(declare-fun minValueAfter!38 () V!18747)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!198 (array!30219 array!30221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 V!18747 V!18747 (_ BitVec 32) Int) Unit!13869)

(assert (=> b!471984 (= lt!214123 (lemmaNoChangeToArrayThenSameMapNoExtras!198 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2018 (array!30219 array!30221 (_ BitVec 32) (_ BitVec 32) V!18747 V!18747 (_ BitVec 32) Int) ListLongMap!7679)

(assert (=> b!471984 (= lt!214124 (getCurrentListMapNoExtraKeys!2018 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471984 (= lt!214122 (getCurrentListMapNoExtraKeys!2018 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471985 () Bool)

(declare-fun res!281947 () Bool)

(assert (=> b!471985 (=> (not res!281947) (not e!276690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30219 (_ BitVec 32)) Bool)

(assert (=> b!471985 (= res!281947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471986 () Bool)

(declare-fun res!281946 () Bool)

(assert (=> b!471986 (=> (not res!281946) (not e!276690))))

(declare-datatypes ((List!8850 0))(
  ( (Nil!8847) (Cons!8846 (h!9702 (_ BitVec 64)) (t!14816 List!8850)) )
))
(declare-fun arrayNoDuplicates!0 (array!30219 (_ BitVec 32) List!8850) Bool)

(assert (=> b!471986 (= res!281946 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8847))))

(declare-fun b!471987 () Bool)

(assert (=> b!471987 (= e!276688 (and e!276686 mapRes!21553))))

(declare-fun condMapEmpty!21553 () Bool)

(declare-fun mapDefault!21553 () ValueCell!6272)

