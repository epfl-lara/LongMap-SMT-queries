; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42324 () Bool)

(assert start!42324)

(declare-fun b_free!11815 () Bool)

(declare-fun b_next!11815 () Bool)

(assert (=> start!42324 (= b_free!11815 (not b_next!11815))))

(declare-fun tp!41475 () Bool)

(declare-fun b_and!20261 () Bool)

(assert (=> start!42324 (= tp!41475 b_and!20261)))

(declare-fun mapNonEmpty!21574 () Bool)

(declare-fun mapRes!21574 () Bool)

(declare-fun tp!41476 () Bool)

(declare-fun e!276842 () Bool)

(assert (=> mapNonEmpty!21574 (= mapRes!21574 (and tp!41476 e!276842))))

(declare-datatypes ((V!18763 0))(
  ( (V!18764 (val!6666 Int)) )
))
(declare-datatypes ((ValueCell!6278 0))(
  ( (ValueCellFull!6278 (v!8957 V!18763)) (EmptyCell!6278) )
))
(declare-fun mapValue!21574 () ValueCell!6278)

(declare-datatypes ((array!30243 0))(
  ( (array!30244 (arr!14542 (Array (_ BitVec 32) ValueCell!6278)) (size!14894 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30243)

(declare-fun mapRest!21574 () (Array (_ BitVec 32) ValueCell!6278))

(declare-fun mapKey!21574 () (_ BitVec 32))

(assert (=> mapNonEmpty!21574 (= (arr!14542 _values!833) (store mapRest!21574 mapKey!21574 mapValue!21574))))

(declare-fun b!472204 () Bool)

(declare-fun res!282061 () Bool)

(declare-fun e!276845 () Bool)

(assert (=> b!472204 (=> (not res!282061) (not e!276845))))

(declare-datatypes ((array!30245 0))(
  ( (array!30246 (arr!14543 (Array (_ BitVec 32) (_ BitVec 64))) (size!14895 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30245)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30245 (_ BitVec 32)) Bool)

(assert (=> b!472204 (= res!282061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472205 () Bool)

(declare-fun e!276843 () Bool)

(assert (=> b!472205 (= e!276843 true)))

(declare-fun minValueBefore!38 () V!18763)

(declare-fun zeroValue!794 () V!18763)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8774 0))(
  ( (tuple2!8775 (_1!4398 (_ BitVec 64)) (_2!4398 V!18763)) )
))
(declare-datatypes ((List!8857 0))(
  ( (Nil!8854) (Cons!8853 (h!9709 tuple2!8774) (t!14825 List!8857)) )
))
(declare-datatypes ((ListLongMap!7687 0))(
  ( (ListLongMap!7688 (toList!3859 List!8857)) )
))
(declare-fun lt!214227 () ListLongMap!7687)

(declare-fun getCurrentListMap!2230 (array!30245 array!30243 (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 (_ BitVec 32) Int) ListLongMap!7687)

(assert (=> b!472205 (= lt!214227 (getCurrentListMap!2230 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472206 () Bool)

(declare-fun tp_is_empty!13243 () Bool)

(assert (=> b!472206 (= e!276842 tp_is_empty!13243)))

(declare-fun res!282059 () Bool)

(assert (=> start!42324 (=> (not res!282059) (not e!276845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42324 (= res!282059 (validMask!0 mask!1365))))

(assert (=> start!42324 e!276845))

(assert (=> start!42324 tp_is_empty!13243))

(assert (=> start!42324 tp!41475))

(assert (=> start!42324 true))

(declare-fun array_inv!10482 (array!30245) Bool)

(assert (=> start!42324 (array_inv!10482 _keys!1025)))

(declare-fun e!276846 () Bool)

(declare-fun array_inv!10483 (array!30243) Bool)

(assert (=> start!42324 (and (array_inv!10483 _values!833) e!276846)))

(declare-fun b!472207 () Bool)

(declare-fun res!282063 () Bool)

(assert (=> b!472207 (=> (not res!282063) (not e!276845))))

(declare-datatypes ((List!8858 0))(
  ( (Nil!8855) (Cons!8854 (h!9710 (_ BitVec 64)) (t!14826 List!8858)) )
))
(declare-fun arrayNoDuplicates!0 (array!30245 (_ BitVec 32) List!8858) Bool)

(assert (=> b!472207 (= res!282063 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8855))))

(declare-fun b!472208 () Bool)

(declare-fun e!276844 () Bool)

(assert (=> b!472208 (= e!276844 tp_is_empty!13243)))

(declare-fun mapIsEmpty!21574 () Bool)

(assert (=> mapIsEmpty!21574 mapRes!21574))

(declare-fun b!472209 () Bool)

(assert (=> b!472209 (= e!276845 (not e!276843))))

(declare-fun res!282062 () Bool)

(assert (=> b!472209 (=> res!282062 e!276843)))

(assert (=> b!472209 (= res!282062 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214229 () ListLongMap!7687)

(declare-fun lt!214230 () ListLongMap!7687)

(assert (=> b!472209 (= lt!214229 lt!214230)))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13877 0))(
  ( (Unit!13878) )
))
(declare-fun lt!214228 () Unit!13877)

(declare-fun minValueAfter!38 () V!18763)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!202 (array!30245 array!30243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 V!18763 V!18763 (_ BitVec 32) Int) Unit!13877)

(assert (=> b!472209 (= lt!214228 (lemmaNoChangeToArrayThenSameMapNoExtras!202 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2022 (array!30245 array!30243 (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 (_ BitVec 32) Int) ListLongMap!7687)

(assert (=> b!472209 (= lt!214230 (getCurrentListMapNoExtraKeys!2022 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472209 (= lt!214229 (getCurrentListMapNoExtraKeys!2022 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472210 () Bool)

(declare-fun res!282060 () Bool)

(assert (=> b!472210 (=> (not res!282060) (not e!276845))))

(assert (=> b!472210 (= res!282060 (and (= (size!14894 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14895 _keys!1025) (size!14894 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472211 () Bool)

(assert (=> b!472211 (= e!276846 (and e!276844 mapRes!21574))))

(declare-fun condMapEmpty!21574 () Bool)

(declare-fun mapDefault!21574 () ValueCell!6278)

