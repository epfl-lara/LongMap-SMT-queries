; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41918 () Bool)

(assert start!41918)

(declare-fun b_free!11521 () Bool)

(declare-fun b_next!11521 () Bool)

(assert (=> start!41918 (= b_free!11521 (not b_next!11521))))

(declare-fun tp!40576 () Bool)

(declare-fun b_and!19883 () Bool)

(assert (=> start!41918 (= tp!40576 b_and!19883)))

(declare-fun mapIsEmpty!21115 () Bool)

(declare-fun mapRes!21115 () Bool)

(assert (=> mapIsEmpty!21115 mapRes!21115))

(declare-fun res!279664 () Bool)

(declare-fun e!273783 () Bool)

(assert (=> start!41918 (=> (not res!279664) (not e!273783))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41918 (= res!279664 (validMask!0 mask!1365))))

(assert (=> start!41918 e!273783))

(declare-fun tp_is_empty!12949 () Bool)

(assert (=> start!41918 tp_is_empty!12949))

(assert (=> start!41918 tp!40576))

(assert (=> start!41918 true))

(declare-datatypes ((array!29659 0))(
  ( (array!29660 (arr!14256 (Array (_ BitVec 32) (_ BitVec 64))) (size!14609 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29659)

(declare-fun array_inv!10372 (array!29659) Bool)

(assert (=> start!41918 (array_inv!10372 _keys!1025)))

(declare-datatypes ((V!18371 0))(
  ( (V!18372 (val!6519 Int)) )
))
(declare-datatypes ((ValueCell!6131 0))(
  ( (ValueCellFull!6131 (v!8802 V!18371)) (EmptyCell!6131) )
))
(declare-datatypes ((array!29661 0))(
  ( (array!29662 (arr!14257 (Array (_ BitVec 32) ValueCell!6131)) (size!14610 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29661)

(declare-fun e!273784 () Bool)

(declare-fun array_inv!10373 (array!29661) Bool)

(assert (=> start!41918 (and (array_inv!10373 _values!833) e!273784)))

(declare-fun b!467887 () Bool)

(declare-fun e!273785 () Bool)

(assert (=> b!467887 (= e!273785 tp_is_empty!12949)))

(declare-fun b!467888 () Bool)

(declare-fun e!273787 () Bool)

(assert (=> b!467888 (= e!273783 (not e!273787))))

(declare-fun res!279665 () Bool)

(assert (=> b!467888 (=> res!279665 e!273787)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!467888 (= res!279665 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8602 0))(
  ( (tuple2!8603 (_1!4312 (_ BitVec 64)) (_2!4312 V!18371)) )
))
(declare-datatypes ((List!8677 0))(
  ( (Nil!8674) (Cons!8673 (h!9529 tuple2!8602) (t!14624 List!8677)) )
))
(declare-datatypes ((ListLongMap!7505 0))(
  ( (ListLongMap!7506 (toList!3768 List!8677)) )
))
(declare-fun lt!211461 () ListLongMap!7505)

(declare-fun lt!211460 () ListLongMap!7505)

(assert (=> b!467888 (= lt!211461 lt!211460)))

(declare-fun minValueBefore!38 () V!18371)

(declare-fun zeroValue!794 () V!18371)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13636 0))(
  ( (Unit!13637) )
))
(declare-fun lt!211459 () Unit!13636)

(declare-fun minValueAfter!38 () V!18371)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!107 (array!29659 array!29661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18371 V!18371 V!18371 V!18371 (_ BitVec 32) Int) Unit!13636)

(assert (=> b!467888 (= lt!211459 (lemmaNoChangeToArrayThenSameMapNoExtras!107 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1950 (array!29659 array!29661 (_ BitVec 32) (_ BitVec 32) V!18371 V!18371 (_ BitVec 32) Int) ListLongMap!7505)

(assert (=> b!467888 (= lt!211460 (getCurrentListMapNoExtraKeys!1950 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467888 (= lt!211461 (getCurrentListMapNoExtraKeys!1950 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467889 () Bool)

(assert (=> b!467889 (= e!273784 (and e!273785 mapRes!21115))))

(declare-fun condMapEmpty!21115 () Bool)

(declare-fun mapDefault!21115 () ValueCell!6131)

(assert (=> b!467889 (= condMapEmpty!21115 (= (arr!14257 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6131)) mapDefault!21115)))))

(declare-fun b!467890 () Bool)

(declare-fun res!279667 () Bool)

(assert (=> b!467890 (=> (not res!279667) (not e!273783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29659 (_ BitVec 32)) Bool)

(assert (=> b!467890 (= res!279667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21115 () Bool)

(declare-fun tp!40575 () Bool)

(declare-fun e!273782 () Bool)

(assert (=> mapNonEmpty!21115 (= mapRes!21115 (and tp!40575 e!273782))))

(declare-fun mapRest!21115 () (Array (_ BitVec 32) ValueCell!6131))

(declare-fun mapKey!21115 () (_ BitVec 32))

(declare-fun mapValue!21115 () ValueCell!6131)

(assert (=> mapNonEmpty!21115 (= (arr!14257 _values!833) (store mapRest!21115 mapKey!21115 mapValue!21115))))

(declare-fun b!467891 () Bool)

(declare-fun res!279666 () Bool)

(assert (=> b!467891 (=> (not res!279666) (not e!273783))))

(assert (=> b!467891 (= res!279666 (and (= (size!14610 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14609 _keys!1025) (size!14610 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467892 () Bool)

(assert (=> b!467892 (= e!273782 tp_is_empty!12949)))

(declare-fun b!467893 () Bool)

(assert (=> b!467893 (= e!273787 true)))

(declare-fun lt!211458 () ListLongMap!7505)

(declare-fun getCurrentListMap!2138 (array!29659 array!29661 (_ BitVec 32) (_ BitVec 32) V!18371 V!18371 (_ BitVec 32) Int) ListLongMap!7505)

(assert (=> b!467893 (= lt!211458 (getCurrentListMap!2138 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467894 () Bool)

(declare-fun res!279663 () Bool)

(assert (=> b!467894 (=> (not res!279663) (not e!273783))))

(declare-datatypes ((List!8678 0))(
  ( (Nil!8675) (Cons!8674 (h!9530 (_ BitVec 64)) (t!14625 List!8678)) )
))
(declare-fun arrayNoDuplicates!0 (array!29659 (_ BitVec 32) List!8678) Bool)

(assert (=> b!467894 (= res!279663 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8675))))

(assert (= (and start!41918 res!279664) b!467891))

(assert (= (and b!467891 res!279666) b!467890))

(assert (= (and b!467890 res!279667) b!467894))

(assert (= (and b!467894 res!279663) b!467888))

(assert (= (and b!467888 (not res!279665)) b!467893))

(assert (= (and b!467889 condMapEmpty!21115) mapIsEmpty!21115))

(assert (= (and b!467889 (not condMapEmpty!21115)) mapNonEmpty!21115))

(get-info :version)

(assert (= (and mapNonEmpty!21115 ((_ is ValueCellFull!6131) mapValue!21115)) b!467892))

(assert (= (and b!467889 ((_ is ValueCellFull!6131) mapDefault!21115)) b!467887))

(assert (= start!41918 b!467889))

(declare-fun m!449455 () Bool)

(assert (=> start!41918 m!449455))

(declare-fun m!449457 () Bool)

(assert (=> start!41918 m!449457))

(declare-fun m!449459 () Bool)

(assert (=> start!41918 m!449459))

(declare-fun m!449461 () Bool)

(assert (=> b!467888 m!449461))

(declare-fun m!449463 () Bool)

(assert (=> b!467888 m!449463))

(declare-fun m!449465 () Bool)

(assert (=> b!467888 m!449465))

(declare-fun m!449467 () Bool)

(assert (=> b!467890 m!449467))

(declare-fun m!449469 () Bool)

(assert (=> b!467894 m!449469))

(declare-fun m!449471 () Bool)

(assert (=> b!467893 m!449471))

(declare-fun m!449473 () Bool)

(assert (=> mapNonEmpty!21115 m!449473))

(check-sat (not b!467893) (not mapNonEmpty!21115) (not b!467890) (not start!41918) (not b_next!11521) b_and!19883 (not b!467888) (not b!467894) tp_is_empty!12949)
(check-sat b_and!19883 (not b_next!11521))
