; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41754 () Bool)

(assert start!41754)

(declare-fun b_free!11389 () Bool)

(declare-fun b_next!11389 () Bool)

(assert (=> start!41754 (= b_free!11389 (not b_next!11389))))

(declare-fun tp!40173 () Bool)

(declare-fun b_and!19731 () Bool)

(assert (=> start!41754 (= tp!40173 b_and!19731)))

(declare-fun b!466115 () Bool)

(declare-fun e!272512 () Bool)

(assert (=> b!466115 (= e!272512 true)))

(declare-datatypes ((V!18195 0))(
  ( (V!18196 (val!6453 Int)) )
))
(declare-datatypes ((tuple2!8506 0))(
  ( (tuple2!8507 (_1!4264 (_ BitVec 64)) (_2!4264 V!18195)) )
))
(declare-datatypes ((List!8590 0))(
  ( (Nil!8587) (Cons!8586 (h!9442 tuple2!8506) (t!14533 List!8590)) )
))
(declare-datatypes ((ListLongMap!7409 0))(
  ( (ListLongMap!7410 (toList!3720 List!8590)) )
))
(declare-fun lt!210528 () ListLongMap!7409)

(declare-fun zeroValue!794 () V!18195)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29413 0))(
  ( (array!29414 (arr!14135 (Array (_ BitVec 32) (_ BitVec 64))) (size!14488 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29413)

(declare-datatypes ((ValueCell!6065 0))(
  ( (ValueCellFull!6065 (v!8735 V!18195)) (EmptyCell!6065) )
))
(declare-datatypes ((array!29415 0))(
  ( (array!29416 (arr!14136 (Array (_ BitVec 32) ValueCell!6065)) (size!14489 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29415)

(declare-fun minValueAfter!38 () V!18195)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2111 (array!29413 array!29415 (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 (_ BitVec 32) Int) ListLongMap!7409)

(assert (=> b!466115 (= lt!210528 (getCurrentListMap!2111 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18195)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210526 () ListLongMap!7409)

(declare-fun +!1692 (ListLongMap!7409 tuple2!8506) ListLongMap!7409)

(assert (=> b!466115 (= lt!210526 (+!1692 (getCurrentListMap!2111 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8507 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapIsEmpty!20911 () Bool)

(declare-fun mapRes!20911 () Bool)

(assert (=> mapIsEmpty!20911 mapRes!20911))

(declare-fun b!466116 () Bool)

(declare-fun e!272510 () Bool)

(declare-fun tp_is_empty!12817 () Bool)

(assert (=> b!466116 (= e!272510 tp_is_empty!12817)))

(declare-fun b!466117 () Bool)

(declare-fun res!278642 () Bool)

(declare-fun e!272513 () Bool)

(assert (=> b!466117 (=> (not res!278642) (not e!272513))))

(assert (=> b!466117 (= res!278642 (and (= (size!14489 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14488 _keys!1025) (size!14489 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466118 () Bool)

(declare-fun e!272515 () Bool)

(declare-fun e!272514 () Bool)

(assert (=> b!466118 (= e!272515 (and e!272514 mapRes!20911))))

(declare-fun condMapEmpty!20911 () Bool)

(declare-fun mapDefault!20911 () ValueCell!6065)

(assert (=> b!466118 (= condMapEmpty!20911 (= (arr!14136 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6065)) mapDefault!20911)))))

(declare-fun mapNonEmpty!20911 () Bool)

(declare-fun tp!40174 () Bool)

(assert (=> mapNonEmpty!20911 (= mapRes!20911 (and tp!40174 e!272510))))

(declare-fun mapRest!20911 () (Array (_ BitVec 32) ValueCell!6065))

(declare-fun mapValue!20911 () ValueCell!6065)

(declare-fun mapKey!20911 () (_ BitVec 32))

(assert (=> mapNonEmpty!20911 (= (arr!14136 _values!833) (store mapRest!20911 mapKey!20911 mapValue!20911))))

(declare-fun b!466119 () Bool)

(assert (=> b!466119 (= e!272514 tp_is_empty!12817)))

(declare-fun b!466120 () Bool)

(declare-fun res!278645 () Bool)

(assert (=> b!466120 (=> (not res!278645) (not e!272513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29413 (_ BitVec 32)) Bool)

(assert (=> b!466120 (= res!278645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278643 () Bool)

(assert (=> start!41754 (=> (not res!278643) (not e!272513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41754 (= res!278643 (validMask!0 mask!1365))))

(assert (=> start!41754 e!272513))

(assert (=> start!41754 tp_is_empty!12817))

(assert (=> start!41754 tp!40173))

(assert (=> start!41754 true))

(declare-fun array_inv!10292 (array!29413) Bool)

(assert (=> start!41754 (array_inv!10292 _keys!1025)))

(declare-fun array_inv!10293 (array!29415) Bool)

(assert (=> start!41754 (and (array_inv!10293 _values!833) e!272515)))

(declare-fun b!466121 () Bool)

(declare-fun res!278644 () Bool)

(assert (=> b!466121 (=> (not res!278644) (not e!272513))))

(declare-datatypes ((List!8591 0))(
  ( (Nil!8588) (Cons!8587 (h!9443 (_ BitVec 64)) (t!14534 List!8591)) )
))
(declare-fun arrayNoDuplicates!0 (array!29413 (_ BitVec 32) List!8591) Bool)

(assert (=> b!466121 (= res!278644 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8588))))

(declare-fun b!466122 () Bool)

(assert (=> b!466122 (= e!272513 (not e!272512))))

(declare-fun res!278641 () Bool)

(assert (=> b!466122 (=> res!278641 e!272512)))

(assert (=> b!466122 (= res!278641 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210527 () ListLongMap!7409)

(declare-fun lt!210524 () ListLongMap!7409)

(assert (=> b!466122 (= lt!210527 lt!210524)))

(declare-datatypes ((Unit!13546 0))(
  ( (Unit!13547) )
))
(declare-fun lt!210525 () Unit!13546)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!63 (array!29413 array!29415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 V!18195 V!18195 (_ BitVec 32) Int) Unit!13546)

(assert (=> b!466122 (= lt!210525 (lemmaNoChangeToArrayThenSameMapNoExtras!63 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1906 (array!29413 array!29415 (_ BitVec 32) (_ BitVec 32) V!18195 V!18195 (_ BitVec 32) Int) ListLongMap!7409)

(assert (=> b!466122 (= lt!210524 (getCurrentListMapNoExtraKeys!1906 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466122 (= lt!210527 (getCurrentListMapNoExtraKeys!1906 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!41754 res!278643) b!466117))

(assert (= (and b!466117 res!278642) b!466120))

(assert (= (and b!466120 res!278645) b!466121))

(assert (= (and b!466121 res!278644) b!466122))

(assert (= (and b!466122 (not res!278641)) b!466115))

(assert (= (and b!466118 condMapEmpty!20911) mapIsEmpty!20911))

(assert (= (and b!466118 (not condMapEmpty!20911)) mapNonEmpty!20911))

(get-info :version)

(assert (= (and mapNonEmpty!20911 ((_ is ValueCellFull!6065) mapValue!20911)) b!466116))

(assert (= (and b!466118 ((_ is ValueCellFull!6065) mapDefault!20911)) b!466119))

(assert (= start!41754 b!466118))

(declare-fun m!447869 () Bool)

(assert (=> b!466115 m!447869))

(declare-fun m!447871 () Bool)

(assert (=> b!466115 m!447871))

(assert (=> b!466115 m!447871))

(declare-fun m!447873 () Bool)

(assert (=> b!466115 m!447873))

(declare-fun m!447875 () Bool)

(assert (=> b!466120 m!447875))

(declare-fun m!447877 () Bool)

(assert (=> b!466121 m!447877))

(declare-fun m!447879 () Bool)

(assert (=> start!41754 m!447879))

(declare-fun m!447881 () Bool)

(assert (=> start!41754 m!447881))

(declare-fun m!447883 () Bool)

(assert (=> start!41754 m!447883))

(declare-fun m!447885 () Bool)

(assert (=> mapNonEmpty!20911 m!447885))

(declare-fun m!447887 () Bool)

(assert (=> b!466122 m!447887))

(declare-fun m!447889 () Bool)

(assert (=> b!466122 m!447889))

(declare-fun m!447891 () Bool)

(assert (=> b!466122 m!447891))

(check-sat (not b!466120) (not b!466122) (not b_next!11389) b_and!19731 (not mapNonEmpty!20911) tp_is_empty!12817 (not start!41754) (not b!466115) (not b!466121))
(check-sat b_and!19731 (not b_next!11389))
