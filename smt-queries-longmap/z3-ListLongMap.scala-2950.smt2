; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41906 () Bool)

(assert start!41906)

(declare-fun b_free!11509 () Bool)

(declare-fun b_next!11509 () Bool)

(assert (=> start!41906 (= b_free!11509 (not b_next!11509))))

(declare-fun tp!40540 () Bool)

(declare-fun b_and!19871 () Bool)

(assert (=> start!41906 (= tp!40540 b_and!19871)))

(declare-fun b!467743 () Bool)

(declare-fun e!273676 () Bool)

(declare-fun e!273675 () Bool)

(declare-fun mapRes!21097 () Bool)

(assert (=> b!467743 (= e!273676 (and e!273675 mapRes!21097))))

(declare-fun condMapEmpty!21097 () Bool)

(declare-datatypes ((V!18355 0))(
  ( (V!18356 (val!6513 Int)) )
))
(declare-datatypes ((ValueCell!6125 0))(
  ( (ValueCellFull!6125 (v!8796 V!18355)) (EmptyCell!6125) )
))
(declare-datatypes ((array!29635 0))(
  ( (array!29636 (arr!14244 (Array (_ BitVec 32) ValueCell!6125)) (size!14597 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29635)

(declare-fun mapDefault!21097 () ValueCell!6125)

(assert (=> b!467743 (= condMapEmpty!21097 (= (arr!14244 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6125)) mapDefault!21097)))))

(declare-fun mapNonEmpty!21097 () Bool)

(declare-fun tp!40539 () Bool)

(declare-fun e!273679 () Bool)

(assert (=> mapNonEmpty!21097 (= mapRes!21097 (and tp!40539 e!273679))))

(declare-fun mapValue!21097 () ValueCell!6125)

(declare-fun mapRest!21097 () (Array (_ BitVec 32) ValueCell!6125))

(declare-fun mapKey!21097 () (_ BitVec 32))

(assert (=> mapNonEmpty!21097 (= (arr!14244 _values!833) (store mapRest!21097 mapKey!21097 mapValue!21097))))

(declare-fun b!467744 () Bool)

(declare-fun res!279573 () Bool)

(declare-fun e!273677 () Bool)

(assert (=> b!467744 (=> (not res!279573) (not e!273677))))

(declare-datatypes ((array!29637 0))(
  ( (array!29638 (arr!14245 (Array (_ BitVec 32) (_ BitVec 64))) (size!14598 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29637)

(declare-datatypes ((List!8666 0))(
  ( (Nil!8663) (Cons!8662 (h!9518 (_ BitVec 64)) (t!14613 List!8666)) )
))
(declare-fun arrayNoDuplicates!0 (array!29637 (_ BitVec 32) List!8666) Bool)

(assert (=> b!467744 (= res!279573 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8663))))

(declare-fun b!467745 () Bool)

(declare-fun res!279576 () Bool)

(assert (=> b!467745 (=> (not res!279576) (not e!273677))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29637 (_ BitVec 32)) Bool)

(assert (=> b!467745 (= res!279576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467746 () Bool)

(declare-fun res!279577 () Bool)

(assert (=> b!467746 (=> (not res!279577) (not e!273677))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!467746 (= res!279577 (and (= (size!14597 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14598 _keys!1025) (size!14597 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467747 () Bool)

(declare-fun e!273678 () Bool)

(assert (=> b!467747 (= e!273677 (not e!273678))))

(declare-fun res!279574 () Bool)

(assert (=> b!467747 (=> res!279574 e!273678)))

(assert (=> b!467747 (= res!279574 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8590 0))(
  ( (tuple2!8591 (_1!4306 (_ BitVec 64)) (_2!4306 V!18355)) )
))
(declare-datatypes ((List!8667 0))(
  ( (Nil!8664) (Cons!8663 (h!9519 tuple2!8590) (t!14614 List!8667)) )
))
(declare-datatypes ((ListLongMap!7493 0))(
  ( (ListLongMap!7494 (toList!3762 List!8667)) )
))
(declare-fun lt!211387 () ListLongMap!7493)

(declare-fun lt!211388 () ListLongMap!7493)

(assert (=> b!467747 (= lt!211387 lt!211388)))

(declare-fun minValueBefore!38 () V!18355)

(declare-fun zeroValue!794 () V!18355)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13626 0))(
  ( (Unit!13627) )
))
(declare-fun lt!211389 () Unit!13626)

(declare-fun minValueAfter!38 () V!18355)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!102 (array!29637 array!29635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 V!18355 V!18355 (_ BitVec 32) Int) Unit!13626)

(assert (=> b!467747 (= lt!211389 (lemmaNoChangeToArrayThenSameMapNoExtras!102 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1945 (array!29637 array!29635 (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 (_ BitVec 32) Int) ListLongMap!7493)

(assert (=> b!467747 (= lt!211388 (getCurrentListMapNoExtraKeys!1945 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467747 (= lt!211387 (getCurrentListMapNoExtraKeys!1945 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279575 () Bool)

(assert (=> start!41906 (=> (not res!279575) (not e!273677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41906 (= res!279575 (validMask!0 mask!1365))))

(assert (=> start!41906 e!273677))

(declare-fun tp_is_empty!12937 () Bool)

(assert (=> start!41906 tp_is_empty!12937))

(assert (=> start!41906 tp!40540))

(assert (=> start!41906 true))

(declare-fun array_inv!10362 (array!29637) Bool)

(assert (=> start!41906 (array_inv!10362 _keys!1025)))

(declare-fun array_inv!10363 (array!29635) Bool)

(assert (=> start!41906 (and (array_inv!10363 _values!833) e!273676)))

(declare-fun b!467748 () Bool)

(assert (=> b!467748 (= e!273678 true)))

(declare-fun lt!211386 () ListLongMap!7493)

(declare-fun getCurrentListMap!2133 (array!29637 array!29635 (_ BitVec 32) (_ BitVec 32) V!18355 V!18355 (_ BitVec 32) Int) ListLongMap!7493)

(assert (=> b!467748 (= lt!211386 (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467749 () Bool)

(assert (=> b!467749 (= e!273675 tp_is_empty!12937)))

(declare-fun mapIsEmpty!21097 () Bool)

(assert (=> mapIsEmpty!21097 mapRes!21097))

(declare-fun b!467750 () Bool)

(assert (=> b!467750 (= e!273679 tp_is_empty!12937)))

(assert (= (and start!41906 res!279575) b!467746))

(assert (= (and b!467746 res!279577) b!467745))

(assert (= (and b!467745 res!279576) b!467744))

(assert (= (and b!467744 res!279573) b!467747))

(assert (= (and b!467747 (not res!279574)) b!467748))

(assert (= (and b!467743 condMapEmpty!21097) mapIsEmpty!21097))

(assert (= (and b!467743 (not condMapEmpty!21097)) mapNonEmpty!21097))

(get-info :version)

(assert (= (and mapNonEmpty!21097 ((_ is ValueCellFull!6125) mapValue!21097)) b!467750))

(assert (= (and b!467743 ((_ is ValueCellFull!6125) mapDefault!21097)) b!467749))

(assert (= start!41906 b!467743))

(declare-fun m!449335 () Bool)

(assert (=> mapNonEmpty!21097 m!449335))

(declare-fun m!449337 () Bool)

(assert (=> b!467748 m!449337))

(declare-fun m!449339 () Bool)

(assert (=> b!467747 m!449339))

(declare-fun m!449341 () Bool)

(assert (=> b!467747 m!449341))

(declare-fun m!449343 () Bool)

(assert (=> b!467747 m!449343))

(declare-fun m!449345 () Bool)

(assert (=> b!467745 m!449345))

(declare-fun m!449347 () Bool)

(assert (=> b!467744 m!449347))

(declare-fun m!449349 () Bool)

(assert (=> start!41906 m!449349))

(declare-fun m!449351 () Bool)

(assert (=> start!41906 m!449351))

(declare-fun m!449353 () Bool)

(assert (=> start!41906 m!449353))

(check-sat b_and!19871 tp_is_empty!12937 (not b_next!11509) (not mapNonEmpty!21097) (not b!467745) (not b!467748) (not start!41906) (not b!467747) (not b!467744))
(check-sat b_and!19871 (not b_next!11509))
