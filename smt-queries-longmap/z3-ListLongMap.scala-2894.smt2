; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41492 () Bool)

(assert start!41492)

(declare-fun b_free!11173 () Bool)

(declare-fun b_next!11173 () Bool)

(assert (=> start!41492 (= b_free!11173 (not b_next!11173))))

(declare-fun tp!39517 () Bool)

(declare-fun b_and!19487 () Bool)

(assert (=> start!41492 (= tp!39517 b_and!19487)))

(declare-fun res!277101 () Bool)

(declare-fun e!270571 () Bool)

(assert (=> start!41492 (=> (not res!277101) (not e!270571))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41492 (= res!277101 (validMask!0 mask!1365))))

(assert (=> start!41492 e!270571))

(declare-fun tp_is_empty!12601 () Bool)

(assert (=> start!41492 tp_is_empty!12601))

(assert (=> start!41492 tp!39517))

(assert (=> start!41492 true))

(declare-datatypes ((array!28995 0))(
  ( (array!28996 (arr!13929 (Array (_ BitVec 32) (_ BitVec 64))) (size!14282 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28995)

(declare-fun array_inv!10136 (array!28995) Bool)

(assert (=> start!41492 (array_inv!10136 _keys!1025)))

(declare-datatypes ((V!17907 0))(
  ( (V!17908 (val!6345 Int)) )
))
(declare-datatypes ((ValueCell!5957 0))(
  ( (ValueCellFull!5957 (v!8626 V!17907)) (EmptyCell!5957) )
))
(declare-datatypes ((array!28997 0))(
  ( (array!28998 (arr!13930 (Array (_ BitVec 32) ValueCell!5957)) (size!14283 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28997)

(declare-fun e!270570 () Bool)

(declare-fun array_inv!10137 (array!28997) Bool)

(assert (=> start!41492 (and (array_inv!10137 _values!833) e!270570)))

(declare-fun b!463392 () Bool)

(declare-fun e!270569 () Bool)

(declare-fun mapRes!20578 () Bool)

(assert (=> b!463392 (= e!270570 (and e!270569 mapRes!20578))))

(declare-fun condMapEmpty!20578 () Bool)

(declare-fun mapDefault!20578 () ValueCell!5957)

(assert (=> b!463392 (= condMapEmpty!20578 (= (arr!13930 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5957)) mapDefault!20578)))))

(declare-fun mapNonEmpty!20578 () Bool)

(declare-fun tp!39516 () Bool)

(declare-fun e!270572 () Bool)

(assert (=> mapNonEmpty!20578 (= mapRes!20578 (and tp!39516 e!270572))))

(declare-fun mapValue!20578 () ValueCell!5957)

(declare-fun mapKey!20578 () (_ BitVec 32))

(declare-fun mapRest!20578 () (Array (_ BitVec 32) ValueCell!5957))

(assert (=> mapNonEmpty!20578 (= (arr!13930 _values!833) (store mapRest!20578 mapKey!20578 mapValue!20578))))

(declare-fun b!463393 () Bool)

(declare-fun res!277102 () Bool)

(assert (=> b!463393 (=> (not res!277102) (not e!270571))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463393 (= res!277102 (and (= (size!14283 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14282 _keys!1025) (size!14283 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463394 () Bool)

(declare-fun res!277103 () Bool)

(assert (=> b!463394 (=> (not res!277103) (not e!270571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28995 (_ BitVec 32)) Bool)

(assert (=> b!463394 (= res!277103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463395 () Bool)

(assert (=> b!463395 (= e!270572 tp_is_empty!12601)))

(declare-fun b!463396 () Bool)

(assert (=> b!463396 (= e!270569 tp_is_empty!12601)))

(declare-fun b!463397 () Bool)

(assert (=> b!463397 (= e!270571 false)))

(declare-fun zeroValue!794 () V!17907)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8344 0))(
  ( (tuple2!8345 (_1!4183 (_ BitVec 64)) (_2!4183 V!17907)) )
))
(declare-datatypes ((List!8429 0))(
  ( (Nil!8426) (Cons!8425 (h!9281 tuple2!8344) (t!14366 List!8429)) )
))
(declare-datatypes ((ListLongMap!7247 0))(
  ( (ListLongMap!7248 (toList!3639 List!8429)) )
))
(declare-fun lt!209210 () ListLongMap!7247)

(declare-fun minValueAfter!38 () V!17907)

(declare-fun getCurrentListMapNoExtraKeys!1831 (array!28995 array!28997 (_ BitVec 32) (_ BitVec 32) V!17907 V!17907 (_ BitVec 32) Int) ListLongMap!7247)

(assert (=> b!463397 (= lt!209210 (getCurrentListMapNoExtraKeys!1831 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17907)

(declare-fun lt!209209 () ListLongMap!7247)

(assert (=> b!463397 (= lt!209209 (getCurrentListMapNoExtraKeys!1831 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20578 () Bool)

(assert (=> mapIsEmpty!20578 mapRes!20578))

(declare-fun b!463398 () Bool)

(declare-fun res!277100 () Bool)

(assert (=> b!463398 (=> (not res!277100) (not e!270571))))

(declare-datatypes ((List!8430 0))(
  ( (Nil!8427) (Cons!8426 (h!9282 (_ BitVec 64)) (t!14367 List!8430)) )
))
(declare-fun arrayNoDuplicates!0 (array!28995 (_ BitVec 32) List!8430) Bool)

(assert (=> b!463398 (= res!277100 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8427))))

(assert (= (and start!41492 res!277101) b!463393))

(assert (= (and b!463393 res!277102) b!463394))

(assert (= (and b!463394 res!277103) b!463398))

(assert (= (and b!463398 res!277100) b!463397))

(assert (= (and b!463392 condMapEmpty!20578) mapIsEmpty!20578))

(assert (= (and b!463392 (not condMapEmpty!20578)) mapNonEmpty!20578))

(get-info :version)

(assert (= (and mapNonEmpty!20578 ((_ is ValueCellFull!5957) mapValue!20578)) b!463395))

(assert (= (and b!463392 ((_ is ValueCellFull!5957) mapDefault!20578)) b!463396))

(assert (= start!41492 b!463392))

(declare-fun m!445467 () Bool)

(assert (=> mapNonEmpty!20578 m!445467))

(declare-fun m!445469 () Bool)

(assert (=> start!41492 m!445469))

(declare-fun m!445471 () Bool)

(assert (=> start!41492 m!445471))

(declare-fun m!445473 () Bool)

(assert (=> start!41492 m!445473))

(declare-fun m!445475 () Bool)

(assert (=> b!463394 m!445475))

(declare-fun m!445477 () Bool)

(assert (=> b!463397 m!445477))

(declare-fun m!445479 () Bool)

(assert (=> b!463397 m!445479))

(declare-fun m!445481 () Bool)

(assert (=> b!463398 m!445481))

(check-sat tp_is_empty!12601 (not b_next!11173) (not mapNonEmpty!20578) (not b!463394) b_and!19487 (not start!41492) (not b!463397) (not b!463398))
(check-sat b_and!19487 (not b_next!11173))
