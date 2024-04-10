; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41556 () Bool)

(assert start!41556)

(declare-fun b_free!11223 () Bool)

(declare-fun b_next!11223 () Bool)

(assert (=> start!41556 (= b_free!11223 (not b_next!11223))))

(declare-fun tp!39667 () Bool)

(declare-fun b_and!19563 () Bool)

(assert (=> start!41556 (= tp!39667 b_and!19563)))

(declare-fun mapIsEmpty!20653 () Bool)

(declare-fun mapRes!20653 () Bool)

(assert (=> mapIsEmpty!20653 mapRes!20653))

(declare-fun b!464188 () Bool)

(declare-fun e!271118 () Bool)

(assert (=> b!464188 (= e!271118 (not true))))

(declare-datatypes ((V!17973 0))(
  ( (V!17974 (val!6370 Int)) )
))
(declare-datatypes ((tuple2!8344 0))(
  ( (tuple2!8345 (_1!4183 (_ BitVec 64)) (_2!4183 V!17973)) )
))
(declare-datatypes ((List!8438 0))(
  ( (Nil!8435) (Cons!8434 (h!9290 tuple2!8344) (t!14384 List!8438)) )
))
(declare-datatypes ((ListLongMap!7257 0))(
  ( (ListLongMap!7258 (toList!3644 List!8438)) )
))
(declare-fun lt!209607 () ListLongMap!7257)

(declare-fun lt!209609 () ListLongMap!7257)

(assert (=> b!464188 (= lt!209607 lt!209609)))

(declare-fun minValueBefore!38 () V!17973)

(declare-fun zeroValue!794 () V!17973)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29091 0))(
  ( (array!29092 (arr!13977 (Array (_ BitVec 32) (_ BitVec 64))) (size!14329 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29091)

(declare-datatypes ((ValueCell!5982 0))(
  ( (ValueCellFull!5982 (v!8657 V!17973)) (EmptyCell!5982) )
))
(declare-datatypes ((array!29093 0))(
  ( (array!29094 (arr!13978 (Array (_ BitVec 32) ValueCell!5982)) (size!14330 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29093)

(declare-fun minValueAfter!38 () V!17973)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13456 0))(
  ( (Unit!13457) )
))
(declare-fun lt!209608 () Unit!13456)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!4 (array!29091 array!29093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17973 V!17973 V!17973 V!17973 (_ BitVec 32) Int) Unit!13456)

(assert (=> b!464188 (= lt!209608 (lemmaNoChangeToArrayThenSameMapNoExtras!4 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1824 (array!29091 array!29093 (_ BitVec 32) (_ BitVec 32) V!17973 V!17973 (_ BitVec 32) Int) ListLongMap!7257)

(assert (=> b!464188 (= lt!209609 (getCurrentListMapNoExtraKeys!1824 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464188 (= lt!209607 (getCurrentListMapNoExtraKeys!1824 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20653 () Bool)

(declare-fun tp!39666 () Bool)

(declare-fun e!271122 () Bool)

(assert (=> mapNonEmpty!20653 (= mapRes!20653 (and tp!39666 e!271122))))

(declare-fun mapValue!20653 () ValueCell!5982)

(declare-fun mapRest!20653 () (Array (_ BitVec 32) ValueCell!5982))

(declare-fun mapKey!20653 () (_ BitVec 32))

(assert (=> mapNonEmpty!20653 (= (arr!13978 _values!833) (store mapRest!20653 mapKey!20653 mapValue!20653))))

(declare-fun b!464189 () Bool)

(declare-fun res!277531 () Bool)

(assert (=> b!464189 (=> (not res!277531) (not e!271118))))

(assert (=> b!464189 (= res!277531 (and (= (size!14330 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14329 _keys!1025) (size!14330 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277532 () Bool)

(assert (=> start!41556 (=> (not res!277532) (not e!271118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41556 (= res!277532 (validMask!0 mask!1365))))

(assert (=> start!41556 e!271118))

(declare-fun tp_is_empty!12651 () Bool)

(assert (=> start!41556 tp_is_empty!12651))

(assert (=> start!41556 tp!39667))

(assert (=> start!41556 true))

(declare-fun array_inv!10098 (array!29091) Bool)

(assert (=> start!41556 (array_inv!10098 _keys!1025)))

(declare-fun e!271120 () Bool)

(declare-fun array_inv!10099 (array!29093) Bool)

(assert (=> start!41556 (and (array_inv!10099 _values!833) e!271120)))

(declare-fun b!464190 () Bool)

(declare-fun res!277529 () Bool)

(assert (=> b!464190 (=> (not res!277529) (not e!271118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29091 (_ BitVec 32)) Bool)

(assert (=> b!464190 (= res!277529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464191 () Bool)

(declare-fun e!271121 () Bool)

(assert (=> b!464191 (= e!271120 (and e!271121 mapRes!20653))))

(declare-fun condMapEmpty!20653 () Bool)

(declare-fun mapDefault!20653 () ValueCell!5982)

(assert (=> b!464191 (= condMapEmpty!20653 (= (arr!13978 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5982)) mapDefault!20653)))))

(declare-fun b!464192 () Bool)

(assert (=> b!464192 (= e!271121 tp_is_empty!12651)))

(declare-fun b!464193 () Bool)

(assert (=> b!464193 (= e!271122 tp_is_empty!12651)))

(declare-fun b!464194 () Bool)

(declare-fun res!277530 () Bool)

(assert (=> b!464194 (=> (not res!277530) (not e!271118))))

(declare-datatypes ((List!8439 0))(
  ( (Nil!8436) (Cons!8435 (h!9291 (_ BitVec 64)) (t!14385 List!8439)) )
))
(declare-fun arrayNoDuplicates!0 (array!29091 (_ BitVec 32) List!8439) Bool)

(assert (=> b!464194 (= res!277530 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8436))))

(assert (= (and start!41556 res!277532) b!464189))

(assert (= (and b!464189 res!277531) b!464190))

(assert (= (and b!464190 res!277529) b!464194))

(assert (= (and b!464194 res!277530) b!464188))

(assert (= (and b!464191 condMapEmpty!20653) mapIsEmpty!20653))

(assert (= (and b!464191 (not condMapEmpty!20653)) mapNonEmpty!20653))

(get-info :version)

(assert (= (and mapNonEmpty!20653 ((_ is ValueCellFull!5982) mapValue!20653)) b!464193))

(assert (= (and b!464191 ((_ is ValueCellFull!5982) mapDefault!20653)) b!464192))

(assert (= start!41556 b!464191))

(declare-fun m!446609 () Bool)

(assert (=> start!41556 m!446609))

(declare-fun m!446611 () Bool)

(assert (=> start!41556 m!446611))

(declare-fun m!446613 () Bool)

(assert (=> start!41556 m!446613))

(declare-fun m!446615 () Bool)

(assert (=> b!464194 m!446615))

(declare-fun m!446617 () Bool)

(assert (=> b!464190 m!446617))

(declare-fun m!446619 () Bool)

(assert (=> mapNonEmpty!20653 m!446619))

(declare-fun m!446621 () Bool)

(assert (=> b!464188 m!446621))

(declare-fun m!446623 () Bool)

(assert (=> b!464188 m!446623))

(declare-fun m!446625 () Bool)

(assert (=> b!464188 m!446625))

(check-sat (not b!464190) (not start!41556) (not mapNonEmpty!20653) tp_is_empty!12651 b_and!19563 (not b_next!11223) (not b!464188) (not b!464194))
(check-sat b_and!19563 (not b_next!11223))
