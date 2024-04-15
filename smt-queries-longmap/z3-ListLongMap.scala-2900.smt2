; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41528 () Bool)

(assert start!41528)

(declare-fun b_free!11209 () Bool)

(declare-fun b_next!11209 () Bool)

(assert (=> start!41528 (= b_free!11209 (not b_next!11209))))

(declare-fun tp!39625 () Bool)

(declare-fun b_and!19523 () Bool)

(assert (=> start!41528 (= tp!39625 b_and!19523)))

(declare-fun res!277319 () Bool)

(declare-fun e!270840 () Bool)

(assert (=> start!41528 (=> (not res!277319) (not e!270840))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41528 (= res!277319 (validMask!0 mask!1365))))

(assert (=> start!41528 e!270840))

(declare-fun tp_is_empty!12637 () Bool)

(assert (=> start!41528 tp_is_empty!12637))

(assert (=> start!41528 tp!39625))

(assert (=> start!41528 true))

(declare-datatypes ((array!29063 0))(
  ( (array!29064 (arr!13963 (Array (_ BitVec 32) (_ BitVec 64))) (size!14316 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29063)

(declare-fun array_inv!10160 (array!29063) Bool)

(assert (=> start!41528 (array_inv!10160 _keys!1025)))

(declare-datatypes ((V!17955 0))(
  ( (V!17956 (val!6363 Int)) )
))
(declare-datatypes ((ValueCell!5975 0))(
  ( (ValueCellFull!5975 (v!8644 V!17955)) (EmptyCell!5975) )
))
(declare-datatypes ((array!29065 0))(
  ( (array!29066 (arr!13964 (Array (_ BitVec 32) ValueCell!5975)) (size!14317 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29065)

(declare-fun e!270843 () Bool)

(declare-fun array_inv!10161 (array!29065) Bool)

(assert (=> start!41528 (and (array_inv!10161 _values!833) e!270843)))

(declare-fun mapIsEmpty!20632 () Bool)

(declare-fun mapRes!20632 () Bool)

(assert (=> mapIsEmpty!20632 mapRes!20632))

(declare-fun b!463770 () Bool)

(declare-fun e!270841 () Bool)

(assert (=> b!463770 (= e!270843 (and e!270841 mapRes!20632))))

(declare-fun condMapEmpty!20632 () Bool)

(declare-fun mapDefault!20632 () ValueCell!5975)

(assert (=> b!463770 (= condMapEmpty!20632 (= (arr!13964 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5975)) mapDefault!20632)))))

(declare-fun b!463771 () Bool)

(assert (=> b!463771 (= e!270841 tp_is_empty!12637)))

(declare-fun b!463772 () Bool)

(declare-fun res!277317 () Bool)

(assert (=> b!463772 (=> (not res!277317) (not e!270840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29063 (_ BitVec 32)) Bool)

(assert (=> b!463772 (= res!277317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463773 () Bool)

(assert (=> b!463773 (= e!270840 false)))

(declare-fun zeroValue!794 () V!17955)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((tuple2!8366 0))(
  ( (tuple2!8367 (_1!4194 (_ BitVec 64)) (_2!4194 V!17955)) )
))
(declare-datatypes ((List!8453 0))(
  ( (Nil!8450) (Cons!8449 (h!9305 tuple2!8366) (t!14390 List!8453)) )
))
(declare-datatypes ((ListLongMap!7269 0))(
  ( (ListLongMap!7270 (toList!3650 List!8453)) )
))
(declare-fun lt!209317 () ListLongMap!7269)

(declare-fun minValueAfter!38 () V!17955)

(declare-fun getCurrentListMapNoExtraKeys!1842 (array!29063 array!29065 (_ BitVec 32) (_ BitVec 32) V!17955 V!17955 (_ BitVec 32) Int) ListLongMap!7269)

(assert (=> b!463773 (= lt!209317 (getCurrentListMapNoExtraKeys!1842 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!17955)

(declare-fun lt!209318 () ListLongMap!7269)

(assert (=> b!463773 (= lt!209318 (getCurrentListMapNoExtraKeys!1842 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463774 () Bool)

(declare-fun res!277318 () Bool)

(assert (=> b!463774 (=> (not res!277318) (not e!270840))))

(assert (=> b!463774 (= res!277318 (and (= (size!14317 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14316 _keys!1025) (size!14317 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463775 () Bool)

(declare-fun res!277316 () Bool)

(assert (=> b!463775 (=> (not res!277316) (not e!270840))))

(declare-datatypes ((List!8454 0))(
  ( (Nil!8451) (Cons!8450 (h!9306 (_ BitVec 64)) (t!14391 List!8454)) )
))
(declare-fun arrayNoDuplicates!0 (array!29063 (_ BitVec 32) List!8454) Bool)

(assert (=> b!463775 (= res!277316 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8451))))

(declare-fun mapNonEmpty!20632 () Bool)

(declare-fun tp!39624 () Bool)

(declare-fun e!270842 () Bool)

(assert (=> mapNonEmpty!20632 (= mapRes!20632 (and tp!39624 e!270842))))

(declare-fun mapRest!20632 () (Array (_ BitVec 32) ValueCell!5975))

(declare-fun mapValue!20632 () ValueCell!5975)

(declare-fun mapKey!20632 () (_ BitVec 32))

(assert (=> mapNonEmpty!20632 (= (arr!13964 _values!833) (store mapRest!20632 mapKey!20632 mapValue!20632))))

(declare-fun b!463776 () Bool)

(assert (=> b!463776 (= e!270842 tp_is_empty!12637)))

(assert (= (and start!41528 res!277319) b!463774))

(assert (= (and b!463774 res!277318) b!463772))

(assert (= (and b!463772 res!277317) b!463775))

(assert (= (and b!463775 res!277316) b!463773))

(assert (= (and b!463770 condMapEmpty!20632) mapIsEmpty!20632))

(assert (= (and b!463770 (not condMapEmpty!20632)) mapNonEmpty!20632))

(get-info :version)

(assert (= (and mapNonEmpty!20632 ((_ is ValueCellFull!5975) mapValue!20632)) b!463776))

(assert (= (and b!463770 ((_ is ValueCellFull!5975) mapDefault!20632)) b!463771))

(assert (= start!41528 b!463770))

(declare-fun m!445755 () Bool)

(assert (=> mapNonEmpty!20632 m!445755))

(declare-fun m!445757 () Bool)

(assert (=> b!463773 m!445757))

(declare-fun m!445759 () Bool)

(assert (=> b!463773 m!445759))

(declare-fun m!445761 () Bool)

(assert (=> b!463772 m!445761))

(declare-fun m!445763 () Bool)

(assert (=> b!463775 m!445763))

(declare-fun m!445765 () Bool)

(assert (=> start!41528 m!445765))

(declare-fun m!445767 () Bool)

(assert (=> start!41528 m!445767))

(declare-fun m!445769 () Bool)

(assert (=> start!41528 m!445769))

(check-sat tp_is_empty!12637 (not b_next!11209) (not b!463775) (not mapNonEmpty!20632) b_and!19523 (not b!463772) (not b!463773) (not start!41528))
(check-sat b_and!19523 (not b_next!11209))
