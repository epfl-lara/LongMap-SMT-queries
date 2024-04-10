; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41508 () Bool)

(assert start!41508)

(declare-fun b_free!11175 () Bool)

(declare-fun b_next!11175 () Bool)

(assert (=> start!41508 (= b_free!11175 (not b_next!11175))))

(declare-fun tp!39523 () Bool)

(declare-fun b_and!19515 () Bool)

(assert (=> start!41508 (= tp!39523 b_and!19515)))

(declare-fun res!277241 () Bool)

(declare-fun e!270762 () Bool)

(assert (=> start!41508 (=> (not res!277241) (not e!270762))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41508 (= res!277241 (validMask!0 mask!1365))))

(assert (=> start!41508 e!270762))

(declare-fun tp_is_empty!12603 () Bool)

(assert (=> start!41508 tp_is_empty!12603))

(assert (=> start!41508 tp!39523))

(assert (=> start!41508 true))

(declare-datatypes ((array!28999 0))(
  ( (array!29000 (arr!13931 (Array (_ BitVec 32) (_ BitVec 64))) (size!14283 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28999)

(declare-fun array_inv!10068 (array!28999) Bool)

(assert (=> start!41508 (array_inv!10068 _keys!1025)))

(declare-datatypes ((V!17909 0))(
  ( (V!17910 (val!6346 Int)) )
))
(declare-datatypes ((ValueCell!5958 0))(
  ( (ValueCellFull!5958 (v!8633 V!17909)) (EmptyCell!5958) )
))
(declare-datatypes ((array!29001 0))(
  ( (array!29002 (arr!13932 (Array (_ BitVec 32) ValueCell!5958)) (size!14284 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29001)

(declare-fun e!270759 () Bool)

(declare-fun array_inv!10069 (array!29001) Bool)

(assert (=> start!41508 (and (array_inv!10069 _values!833) e!270759)))

(declare-fun mapIsEmpty!20581 () Bool)

(declare-fun mapRes!20581 () Bool)

(assert (=> mapIsEmpty!20581 mapRes!20581))

(declare-fun b!463684 () Bool)

(assert (=> b!463684 (= e!270762 false)))

(declare-fun zeroValue!794 () V!17909)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8312 0))(
  ( (tuple2!8313 (_1!4167 (_ BitVec 64)) (_2!4167 V!17909)) )
))
(declare-datatypes ((List!8406 0))(
  ( (Nil!8403) (Cons!8402 (h!9258 tuple2!8312) (t!14352 List!8406)) )
))
(declare-datatypes ((ListLongMap!7225 0))(
  ( (ListLongMap!7226 (toList!3628 List!8406)) )
))
(declare-fun lt!209450 () ListLongMap!7225)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17909)

(declare-fun getCurrentListMapNoExtraKeys!1808 (array!28999 array!29001 (_ BitVec 32) (_ BitVec 32) V!17909 V!17909 (_ BitVec 32) Int) ListLongMap!7225)

(assert (=> b!463684 (= lt!209450 (getCurrentListMapNoExtraKeys!1808 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17909)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209449 () ListLongMap!7225)

(assert (=> b!463684 (= lt!209449 (getCurrentListMapNoExtraKeys!1808 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463685 () Bool)

(declare-fun res!277244 () Bool)

(assert (=> b!463685 (=> (not res!277244) (not e!270762))))

(declare-datatypes ((List!8407 0))(
  ( (Nil!8404) (Cons!8403 (h!9259 (_ BitVec 64)) (t!14353 List!8407)) )
))
(declare-fun arrayNoDuplicates!0 (array!28999 (_ BitVec 32) List!8407) Bool)

(assert (=> b!463685 (= res!277244 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8404))))

(declare-fun b!463686 () Bool)

(declare-fun res!277243 () Bool)

(assert (=> b!463686 (=> (not res!277243) (not e!270762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28999 (_ BitVec 32)) Bool)

(assert (=> b!463686 (= res!277243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463687 () Bool)

(declare-fun e!270760 () Bool)

(assert (=> b!463687 (= e!270760 tp_is_empty!12603)))

(declare-fun b!463688 () Bool)

(declare-fun e!270758 () Bool)

(assert (=> b!463688 (= e!270759 (and e!270758 mapRes!20581))))

(declare-fun condMapEmpty!20581 () Bool)

(declare-fun mapDefault!20581 () ValueCell!5958)

(assert (=> b!463688 (= condMapEmpty!20581 (= (arr!13932 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5958)) mapDefault!20581)))))

(declare-fun b!463689 () Bool)

(declare-fun res!277242 () Bool)

(assert (=> b!463689 (=> (not res!277242) (not e!270762))))

(assert (=> b!463689 (= res!277242 (and (= (size!14284 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14283 _keys!1025) (size!14284 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463690 () Bool)

(assert (=> b!463690 (= e!270758 tp_is_empty!12603)))

(declare-fun mapNonEmpty!20581 () Bool)

(declare-fun tp!39522 () Bool)

(assert (=> mapNonEmpty!20581 (= mapRes!20581 (and tp!39522 e!270760))))

(declare-fun mapValue!20581 () ValueCell!5958)

(declare-fun mapKey!20581 () (_ BitVec 32))

(declare-fun mapRest!20581 () (Array (_ BitVec 32) ValueCell!5958))

(assert (=> mapNonEmpty!20581 (= (arr!13932 _values!833) (store mapRest!20581 mapKey!20581 mapValue!20581))))

(assert (= (and start!41508 res!277241) b!463689))

(assert (= (and b!463689 res!277242) b!463686))

(assert (= (and b!463686 res!277243) b!463685))

(assert (= (and b!463685 res!277244) b!463684))

(assert (= (and b!463688 condMapEmpty!20581) mapIsEmpty!20581))

(assert (= (and b!463688 (not condMapEmpty!20581)) mapNonEmpty!20581))

(get-info :version)

(assert (= (and mapNonEmpty!20581 ((_ is ValueCellFull!5958) mapValue!20581)) b!463687))

(assert (= (and b!463688 ((_ is ValueCellFull!5958) mapDefault!20581)) b!463690))

(assert (= start!41508 b!463688))

(declare-fun m!446217 () Bool)

(assert (=> b!463684 m!446217))

(declare-fun m!446219 () Bool)

(assert (=> b!463684 m!446219))

(declare-fun m!446221 () Bool)

(assert (=> start!41508 m!446221))

(declare-fun m!446223 () Bool)

(assert (=> start!41508 m!446223))

(declare-fun m!446225 () Bool)

(assert (=> start!41508 m!446225))

(declare-fun m!446227 () Bool)

(assert (=> b!463685 m!446227))

(declare-fun m!446229 () Bool)

(assert (=> mapNonEmpty!20581 m!446229))

(declare-fun m!446231 () Bool)

(assert (=> b!463686 m!446231))

(check-sat (not b!463684) (not b!463685) (not start!41508) b_and!19515 (not b_next!11175) (not b!463686) (not mapNonEmpty!20581) tp_is_empty!12603)
(check-sat b_and!19515 (not b_next!11175))
