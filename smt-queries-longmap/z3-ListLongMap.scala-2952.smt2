; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41918 () Bool)

(assert start!41918)

(declare-fun b_free!11521 () Bool)

(declare-fun b_next!11521 () Bool)

(assert (=> start!41918 (= b_free!11521 (not b_next!11521))))

(declare-fun tp!40576 () Bool)

(declare-fun b_and!19919 () Bool)

(assert (=> start!41918 (= tp!40576 b_and!19919)))

(declare-fun res!279786 () Bool)

(declare-fun e!273920 () Bool)

(assert (=> start!41918 (=> (not res!279786) (not e!273920))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41918 (= res!279786 (validMask!0 mask!1365))))

(assert (=> start!41918 e!273920))

(declare-fun tp_is_empty!12949 () Bool)

(assert (=> start!41918 tp_is_empty!12949))

(assert (=> start!41918 tp!40576))

(assert (=> start!41918 true))

(declare-datatypes ((array!29664 0))(
  ( (array!29665 (arr!14258 (Array (_ BitVec 32) (_ BitVec 64))) (size!14610 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29664)

(declare-fun array_inv!10384 (array!29664) Bool)

(assert (=> start!41918 (array_inv!10384 _keys!1025)))

(declare-datatypes ((V!18371 0))(
  ( (V!18372 (val!6519 Int)) )
))
(declare-datatypes ((ValueCell!6131 0))(
  ( (ValueCellFull!6131 (v!8809 V!18371)) (EmptyCell!6131) )
))
(declare-datatypes ((array!29666 0))(
  ( (array!29667 (arr!14259 (Array (_ BitVec 32) ValueCell!6131)) (size!14611 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29666)

(declare-fun e!273921 () Bool)

(declare-fun array_inv!10385 (array!29666) Bool)

(assert (=> start!41918 (and (array_inv!10385 _values!833) e!273921)))

(declare-fun b!468097 () Bool)

(declare-fun e!273917 () Bool)

(declare-fun mapRes!21115 () Bool)

(assert (=> b!468097 (= e!273921 (and e!273917 mapRes!21115))))

(declare-fun condMapEmpty!21115 () Bool)

(declare-fun mapDefault!21115 () ValueCell!6131)

(assert (=> b!468097 (= condMapEmpty!21115 (= (arr!14259 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6131)) mapDefault!21115)))))

(declare-fun b!468098 () Bool)

(declare-fun res!279789 () Bool)

(assert (=> b!468098 (=> (not res!279789) (not e!273920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29664 (_ BitVec 32)) Bool)

(assert (=> b!468098 (= res!279789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468099 () Bool)

(declare-fun e!273918 () Bool)

(assert (=> b!468099 (= e!273918 true)))

(declare-fun zeroValue!794 () V!18371)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!18371)

(declare-datatypes ((tuple2!8490 0))(
  ( (tuple2!8491 (_1!4256 (_ BitVec 64)) (_2!4256 V!18371)) )
))
(declare-datatypes ((List!8570 0))(
  ( (Nil!8567) (Cons!8566 (h!9422 tuple2!8490) (t!14518 List!8570)) )
))
(declare-datatypes ((ListLongMap!7405 0))(
  ( (ListLongMap!7406 (toList!3718 List!8570)) )
))
(declare-fun lt!211704 () ListLongMap!7405)

(declare-fun getCurrentListMap!2147 (array!29664 array!29666 (_ BitVec 32) (_ BitVec 32) V!18371 V!18371 (_ BitVec 32) Int) ListLongMap!7405)

(assert (=> b!468099 (= lt!211704 (getCurrentListMap!2147 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468100 () Bool)

(assert (=> b!468100 (= e!273917 tp_is_empty!12949)))

(declare-fun b!468101 () Bool)

(declare-fun e!273922 () Bool)

(assert (=> b!468101 (= e!273922 tp_is_empty!12949)))

(declare-fun b!468102 () Bool)

(assert (=> b!468102 (= e!273920 (not e!273918))))

(declare-fun res!279787 () Bool)

(assert (=> b!468102 (=> res!279787 e!273918)))

(assert (=> b!468102 (= res!279787 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211705 () ListLongMap!7405)

(declare-fun lt!211706 () ListLongMap!7405)

(assert (=> b!468102 (= lt!211705 lt!211706)))

(declare-datatypes ((Unit!13644 0))(
  ( (Unit!13645) )
))
(declare-fun lt!211707 () Unit!13644)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18371)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!98 (array!29664 array!29666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18371 V!18371 V!18371 V!18371 (_ BitVec 32) Int) Unit!13644)

(assert (=> b!468102 (= lt!211707 (lemmaNoChangeToArrayThenSameMapNoExtras!98 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1938 (array!29664 array!29666 (_ BitVec 32) (_ BitVec 32) V!18371 V!18371 (_ BitVec 32) Int) ListLongMap!7405)

(assert (=> b!468102 (= lt!211706 (getCurrentListMapNoExtraKeys!1938 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468102 (= lt!211705 (getCurrentListMapNoExtraKeys!1938 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21115 () Bool)

(assert (=> mapIsEmpty!21115 mapRes!21115))

(declare-fun mapNonEmpty!21115 () Bool)

(declare-fun tp!40575 () Bool)

(assert (=> mapNonEmpty!21115 (= mapRes!21115 (and tp!40575 e!273922))))

(declare-fun mapKey!21115 () (_ BitVec 32))

(declare-fun mapValue!21115 () ValueCell!6131)

(declare-fun mapRest!21115 () (Array (_ BitVec 32) ValueCell!6131))

(assert (=> mapNonEmpty!21115 (= (arr!14259 _values!833) (store mapRest!21115 mapKey!21115 mapValue!21115))))

(declare-fun b!468103 () Bool)

(declare-fun res!279788 () Bool)

(assert (=> b!468103 (=> (not res!279788) (not e!273920))))

(declare-datatypes ((List!8571 0))(
  ( (Nil!8568) (Cons!8567 (h!9423 (_ BitVec 64)) (t!14519 List!8571)) )
))
(declare-fun arrayNoDuplicates!0 (array!29664 (_ BitVec 32) List!8571) Bool)

(assert (=> b!468103 (= res!279788 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8568))))

(declare-fun b!468104 () Bool)

(declare-fun res!279785 () Bool)

(assert (=> b!468104 (=> (not res!279785) (not e!273920))))

(assert (=> b!468104 (= res!279785 (and (= (size!14611 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14610 _keys!1025) (size!14611 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41918 res!279786) b!468104))

(assert (= (and b!468104 res!279785) b!468098))

(assert (= (and b!468098 res!279789) b!468103))

(assert (= (and b!468103 res!279788) b!468102))

(assert (= (and b!468102 (not res!279787)) b!468099))

(assert (= (and b!468097 condMapEmpty!21115) mapIsEmpty!21115))

(assert (= (and b!468097 (not condMapEmpty!21115)) mapNonEmpty!21115))

(get-info :version)

(assert (= (and mapNonEmpty!21115 ((_ is ValueCellFull!6131) mapValue!21115)) b!468101))

(assert (= (and b!468097 ((_ is ValueCellFull!6131) mapDefault!21115)) b!468100))

(assert (= start!41918 b!468097))

(declare-fun m!450371 () Bool)

(assert (=> b!468103 m!450371))

(declare-fun m!450373 () Bool)

(assert (=> b!468102 m!450373))

(declare-fun m!450375 () Bool)

(assert (=> b!468102 m!450375))

(declare-fun m!450377 () Bool)

(assert (=> b!468102 m!450377))

(declare-fun m!450379 () Bool)

(assert (=> b!468098 m!450379))

(declare-fun m!450381 () Bool)

(assert (=> start!41918 m!450381))

(declare-fun m!450383 () Bool)

(assert (=> start!41918 m!450383))

(declare-fun m!450385 () Bool)

(assert (=> start!41918 m!450385))

(declare-fun m!450387 () Bool)

(assert (=> mapNonEmpty!21115 m!450387))

(declare-fun m!450389 () Bool)

(assert (=> b!468099 m!450389))

(check-sat (not mapNonEmpty!21115) (not b!468099) (not start!41918) (not b!468103) tp_is_empty!12949 (not b!468102) (not b_next!11521) b_and!19919 (not b!468098))
(check-sat b_and!19919 (not b_next!11521))
