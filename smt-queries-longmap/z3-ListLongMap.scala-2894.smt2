; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41492 () Bool)

(assert start!41492)

(declare-fun b_free!11173 () Bool)

(declare-fun b_next!11173 () Bool)

(assert (=> start!41492 (= b_free!11173 (not b_next!11173))))

(declare-fun tp!39516 () Bool)

(declare-fun b_and!19523 () Bool)

(assert (=> start!41492 (= tp!39516 b_and!19523)))

(declare-fun b!463602 () Bool)

(declare-fun res!277223 () Bool)

(declare-fun e!270705 () Bool)

(assert (=> b!463602 (=> (not res!277223) (not e!270705))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28996 0))(
  ( (array!28997 (arr!13929 (Array (_ BitVec 32) (_ BitVec 64))) (size!14281 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28996)

(declare-datatypes ((V!17907 0))(
  ( (V!17908 (val!6345 Int)) )
))
(declare-datatypes ((ValueCell!5957 0))(
  ( (ValueCellFull!5957 (v!8633 V!17907)) (EmptyCell!5957) )
))
(declare-datatypes ((array!28998 0))(
  ( (array!28999 (arr!13930 (Array (_ BitVec 32) ValueCell!5957)) (size!14282 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28998)

(assert (=> b!463602 (= res!277223 (and (= (size!14282 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14281 _keys!1025) (size!14282 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463603 () Bool)

(declare-fun e!270707 () Bool)

(declare-fun tp_is_empty!12601 () Bool)

(assert (=> b!463603 (= e!270707 tp_is_empty!12601)))

(declare-fun b!463604 () Bool)

(declare-fun e!270708 () Bool)

(assert (=> b!463604 (= e!270708 tp_is_empty!12601)))

(declare-fun b!463605 () Bool)

(assert (=> b!463605 (= e!270705 false)))

(declare-fun zeroValue!794 () V!17907)

(declare-datatypes ((tuple2!8254 0))(
  ( (tuple2!8255 (_1!4138 (_ BitVec 64)) (_2!4138 V!17907)) )
))
(declare-datatypes ((List!8335 0))(
  ( (Nil!8332) (Cons!8331 (h!9187 tuple2!8254) (t!14273 List!8335)) )
))
(declare-datatypes ((ListLongMap!7169 0))(
  ( (ListLongMap!7170 (toList!3600 List!8335)) )
))
(declare-fun lt!209456 () ListLongMap!7169)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17907)

(declare-fun getCurrentListMapNoExtraKeys!1827 (array!28996 array!28998 (_ BitVec 32) (_ BitVec 32) V!17907 V!17907 (_ BitVec 32) Int) ListLongMap!7169)

(assert (=> b!463605 (= lt!209456 (getCurrentListMapNoExtraKeys!1827 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209455 () ListLongMap!7169)

(declare-fun minValueBefore!38 () V!17907)

(assert (=> b!463605 (= lt!209455 (getCurrentListMapNoExtraKeys!1827 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463606 () Bool)

(declare-fun res!277225 () Bool)

(assert (=> b!463606 (=> (not res!277225) (not e!270705))))

(declare-datatypes ((List!8336 0))(
  ( (Nil!8333) (Cons!8332 (h!9188 (_ BitVec 64)) (t!14274 List!8336)) )
))
(declare-fun arrayNoDuplicates!0 (array!28996 (_ BitVec 32) List!8336) Bool)

(assert (=> b!463606 (= res!277225 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8333))))

(declare-fun b!463607 () Bool)

(declare-fun res!277224 () Bool)

(assert (=> b!463607 (=> (not res!277224) (not e!270705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28996 (_ BitVec 32)) Bool)

(assert (=> b!463607 (= res!277224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!277222 () Bool)

(assert (=> start!41492 (=> (not res!277222) (not e!270705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41492 (= res!277222 (validMask!0 mask!1365))))

(assert (=> start!41492 e!270705))

(assert (=> start!41492 tp_is_empty!12601))

(assert (=> start!41492 tp!39516))

(assert (=> start!41492 true))

(declare-fun array_inv!10152 (array!28996) Bool)

(assert (=> start!41492 (array_inv!10152 _keys!1025)))

(declare-fun e!270706 () Bool)

(declare-fun array_inv!10153 (array!28998) Bool)

(assert (=> start!41492 (and (array_inv!10153 _values!833) e!270706)))

(declare-fun b!463608 () Bool)

(declare-fun mapRes!20578 () Bool)

(assert (=> b!463608 (= e!270706 (and e!270708 mapRes!20578))))

(declare-fun condMapEmpty!20578 () Bool)

(declare-fun mapDefault!20578 () ValueCell!5957)

(assert (=> b!463608 (= condMapEmpty!20578 (= (arr!13930 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5957)) mapDefault!20578)))))

(declare-fun mapNonEmpty!20578 () Bool)

(declare-fun tp!39517 () Bool)

(assert (=> mapNonEmpty!20578 (= mapRes!20578 (and tp!39517 e!270707))))

(declare-fun mapRest!20578 () (Array (_ BitVec 32) ValueCell!5957))

(declare-fun mapKey!20578 () (_ BitVec 32))

(declare-fun mapValue!20578 () ValueCell!5957)

(assert (=> mapNonEmpty!20578 (= (arr!13930 _values!833) (store mapRest!20578 mapKey!20578 mapValue!20578))))

(declare-fun mapIsEmpty!20578 () Bool)

(assert (=> mapIsEmpty!20578 mapRes!20578))

(assert (= (and start!41492 res!277222) b!463602))

(assert (= (and b!463602 res!277223) b!463607))

(assert (= (and b!463607 res!277224) b!463606))

(assert (= (and b!463606 res!277225) b!463605))

(assert (= (and b!463608 condMapEmpty!20578) mapIsEmpty!20578))

(assert (= (and b!463608 (not condMapEmpty!20578)) mapNonEmpty!20578))

(get-info :version)

(assert (= (and mapNonEmpty!20578 ((_ is ValueCellFull!5957) mapValue!20578)) b!463603))

(assert (= (and b!463608 ((_ is ValueCellFull!5957) mapDefault!20578)) b!463604))

(assert (= start!41492 b!463608))

(declare-fun m!446383 () Bool)

(assert (=> b!463605 m!446383))

(declare-fun m!446385 () Bool)

(assert (=> b!463605 m!446385))

(declare-fun m!446387 () Bool)

(assert (=> mapNonEmpty!20578 m!446387))

(declare-fun m!446389 () Bool)

(assert (=> b!463606 m!446389))

(declare-fun m!446391 () Bool)

(assert (=> start!41492 m!446391))

(declare-fun m!446393 () Bool)

(assert (=> start!41492 m!446393))

(declare-fun m!446395 () Bool)

(assert (=> start!41492 m!446395))

(declare-fun m!446397 () Bool)

(assert (=> b!463607 m!446397))

(check-sat (not start!41492) (not b!463605) (not b!463607) b_and!19523 tp_is_empty!12601 (not b!463606) (not b_next!11173) (not mapNonEmpty!20578))
(check-sat b_and!19523 (not b_next!11173))
