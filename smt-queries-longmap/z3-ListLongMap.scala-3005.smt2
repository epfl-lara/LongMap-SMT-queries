; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42350 () Bool)

(assert start!42350)

(declare-fun b_free!11841 () Bool)

(declare-fun b_next!11841 () Bool)

(assert (=> start!42350 (= b_free!11841 (not b_next!11841))))

(declare-fun tp!41554 () Bool)

(declare-fun b_and!20287 () Bool)

(assert (=> start!42350 (= tp!41554 b_and!20287)))

(declare-fun b!472516 () Bool)

(declare-fun res!282256 () Bool)

(declare-fun e!277076 () Bool)

(assert (=> b!472516 (=> (not res!282256) (not e!277076))))

(declare-datatypes ((array!30295 0))(
  ( (array!30296 (arr!14568 (Array (_ BitVec 32) (_ BitVec 64))) (size!14920 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30295)

(declare-datatypes ((List!8878 0))(
  ( (Nil!8875) (Cons!8874 (h!9730 (_ BitVec 64)) (t!14846 List!8878)) )
))
(declare-fun arrayNoDuplicates!0 (array!30295 (_ BitVec 32) List!8878) Bool)

(assert (=> b!472516 (= res!282256 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8875))))

(declare-fun b!472517 () Bool)

(declare-fun e!277078 () Bool)

(declare-fun tp_is_empty!13269 () Bool)

(assert (=> b!472517 (= e!277078 tp_is_empty!13269)))

(declare-fun mapIsEmpty!21613 () Bool)

(declare-fun mapRes!21613 () Bool)

(assert (=> mapIsEmpty!21613 mapRes!21613))

(declare-fun b!472518 () Bool)

(declare-fun e!277077 () Bool)

(assert (=> b!472518 (= e!277077 (and e!277078 mapRes!21613))))

(declare-fun condMapEmpty!21613 () Bool)

(declare-datatypes ((V!18797 0))(
  ( (V!18798 (val!6679 Int)) )
))
(declare-datatypes ((ValueCell!6291 0))(
  ( (ValueCellFull!6291 (v!8970 V!18797)) (EmptyCell!6291) )
))
(declare-datatypes ((array!30297 0))(
  ( (array!30298 (arr!14569 (Array (_ BitVec 32) ValueCell!6291)) (size!14921 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30297)

(declare-fun mapDefault!21613 () ValueCell!6291)

(assert (=> b!472518 (= condMapEmpty!21613 (= (arr!14569 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6291)) mapDefault!21613)))))

(declare-fun mapNonEmpty!21613 () Bool)

(declare-fun tp!41553 () Bool)

(declare-fun e!277081 () Bool)

(assert (=> mapNonEmpty!21613 (= mapRes!21613 (and tp!41553 e!277081))))

(declare-fun mapKey!21613 () (_ BitVec 32))

(declare-fun mapValue!21613 () ValueCell!6291)

(declare-fun mapRest!21613 () (Array (_ BitVec 32) ValueCell!6291))

(assert (=> mapNonEmpty!21613 (= (arr!14569 _values!833) (store mapRest!21613 mapKey!21613 mapValue!21613))))

(declare-fun b!472519 () Bool)

(declare-fun res!282255 () Bool)

(assert (=> b!472519 (=> (not res!282255) (not e!277076))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472519 (= res!282255 (and (= (size!14921 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14920 _keys!1025) (size!14921 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472520 () Bool)

(declare-fun e!277079 () Bool)

(assert (=> b!472520 (= e!277079 true)))

(declare-fun minValueBefore!38 () V!18797)

(declare-fun zeroValue!794 () V!18797)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8796 0))(
  ( (tuple2!8797 (_1!4409 (_ BitVec 64)) (_2!4409 V!18797)) )
))
(declare-datatypes ((List!8879 0))(
  ( (Nil!8876) (Cons!8875 (h!9731 tuple2!8796) (t!14847 List!8879)) )
))
(declare-datatypes ((ListLongMap!7709 0))(
  ( (ListLongMap!7710 (toList!3870 List!8879)) )
))
(declare-fun lt!214384 () ListLongMap!7709)

(declare-fun getCurrentListMap!2240 (array!30295 array!30297 (_ BitVec 32) (_ BitVec 32) V!18797 V!18797 (_ BitVec 32) Int) ListLongMap!7709)

(assert (=> b!472520 (= lt!214384 (getCurrentListMap!2240 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472521 () Bool)

(assert (=> b!472521 (= e!277076 (not e!277079))))

(declare-fun res!282254 () Bool)

(assert (=> b!472521 (=> res!282254 e!277079)))

(assert (=> b!472521 (= res!282254 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214383 () ListLongMap!7709)

(declare-fun lt!214386 () ListLongMap!7709)

(assert (=> b!472521 (= lt!214383 lt!214386)))

(declare-datatypes ((Unit!13897 0))(
  ( (Unit!13898) )
))
(declare-fun lt!214385 () Unit!13897)

(declare-fun minValueAfter!38 () V!18797)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!212 (array!30295 array!30297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18797 V!18797 V!18797 V!18797 (_ BitVec 32) Int) Unit!13897)

(assert (=> b!472521 (= lt!214385 (lemmaNoChangeToArrayThenSameMapNoExtras!212 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2032 (array!30295 array!30297 (_ BitVec 32) (_ BitVec 32) V!18797 V!18797 (_ BitVec 32) Int) ListLongMap!7709)

(assert (=> b!472521 (= lt!214386 (getCurrentListMapNoExtraKeys!2032 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472521 (= lt!214383 (getCurrentListMapNoExtraKeys!2032 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282258 () Bool)

(assert (=> start!42350 (=> (not res!282258) (not e!277076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42350 (= res!282258 (validMask!0 mask!1365))))

(assert (=> start!42350 e!277076))

(assert (=> start!42350 tp_is_empty!13269))

(assert (=> start!42350 tp!41554))

(assert (=> start!42350 true))

(declare-fun array_inv!10504 (array!30295) Bool)

(assert (=> start!42350 (array_inv!10504 _keys!1025)))

(declare-fun array_inv!10505 (array!30297) Bool)

(assert (=> start!42350 (and (array_inv!10505 _values!833) e!277077)))

(declare-fun b!472522 () Bool)

(assert (=> b!472522 (= e!277081 tp_is_empty!13269)))

(declare-fun b!472523 () Bool)

(declare-fun res!282257 () Bool)

(assert (=> b!472523 (=> (not res!282257) (not e!277076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30295 (_ BitVec 32)) Bool)

(assert (=> b!472523 (= res!282257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42350 res!282258) b!472519))

(assert (= (and b!472519 res!282255) b!472523))

(assert (= (and b!472523 res!282257) b!472516))

(assert (= (and b!472516 res!282256) b!472521))

(assert (= (and b!472521 (not res!282254)) b!472520))

(assert (= (and b!472518 condMapEmpty!21613) mapIsEmpty!21613))

(assert (= (and b!472518 (not condMapEmpty!21613)) mapNonEmpty!21613))

(get-info :version)

(assert (= (and mapNonEmpty!21613 ((_ is ValueCellFull!6291) mapValue!21613)) b!472522))

(assert (= (and b!472518 ((_ is ValueCellFull!6291) mapDefault!21613)) b!472517))

(assert (= start!42350 b!472518))

(declare-fun m!454477 () Bool)

(assert (=> mapNonEmpty!21613 m!454477))

(declare-fun m!454479 () Bool)

(assert (=> start!42350 m!454479))

(declare-fun m!454481 () Bool)

(assert (=> start!42350 m!454481))

(declare-fun m!454483 () Bool)

(assert (=> start!42350 m!454483))

(declare-fun m!454485 () Bool)

(assert (=> b!472516 m!454485))

(declare-fun m!454487 () Bool)

(assert (=> b!472523 m!454487))

(declare-fun m!454489 () Bool)

(assert (=> b!472520 m!454489))

(declare-fun m!454491 () Bool)

(assert (=> b!472521 m!454491))

(declare-fun m!454493 () Bool)

(assert (=> b!472521 m!454493))

(declare-fun m!454495 () Bool)

(assert (=> b!472521 m!454495))

(check-sat (not b_next!11841) (not b!472523) tp_is_empty!13269 (not b!472516) (not b!472520) (not b!472521) (not start!42350) b_and!20287 (not mapNonEmpty!21613))
(check-sat b_and!20287 (not b_next!11841))
