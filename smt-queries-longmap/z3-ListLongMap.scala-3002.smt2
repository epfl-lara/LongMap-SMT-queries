; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42316 () Bool)

(assert start!42316)

(declare-fun b_free!11821 () Bool)

(declare-fun b_next!11821 () Bool)

(assert (=> start!42316 (= b_free!11821 (not b_next!11821))))

(declare-fun tp!41494 () Bool)

(declare-fun b_and!20241 () Bool)

(assert (=> start!42316 (= tp!41494 b_and!20241)))

(declare-fun b!472005 () Bool)

(declare-fun e!276725 () Bool)

(assert (=> b!472005 (= e!276725 true)))

(declare-datatypes ((V!18771 0))(
  ( (V!18772 (val!6669 Int)) )
))
(declare-fun minValueBefore!38 () V!18771)

(declare-datatypes ((tuple2!8822 0))(
  ( (tuple2!8823 (_1!4422 (_ BitVec 64)) (_2!4422 V!18771)) )
))
(declare-datatypes ((List!8895 0))(
  ( (Nil!8892) (Cons!8891 (h!9747 tuple2!8822) (t!14854 List!8895)) )
))
(declare-datatypes ((ListLongMap!7725 0))(
  ( (ListLongMap!7726 (toList!3878 List!8895)) )
))
(declare-fun lt!214030 () ListLongMap!7725)

(declare-fun zeroValue!794 () V!18771)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30243 0))(
  ( (array!30244 (arr!14542 (Array (_ BitVec 32) (_ BitVec 64))) (size!14895 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30243)

(declare-datatypes ((ValueCell!6281 0))(
  ( (ValueCellFull!6281 (v!8954 V!18771)) (EmptyCell!6281) )
))
(declare-datatypes ((array!30245 0))(
  ( (array!30246 (arr!14543 (Array (_ BitVec 32) ValueCell!6281)) (size!14896 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30245)

(declare-fun getCurrentListMap!2186 (array!30243 array!30245 (_ BitVec 32) (_ BitVec 32) V!18771 V!18771 (_ BitVec 32) Int) ListLongMap!7725)

(assert (=> b!472005 (= lt!214030 (getCurrentListMap!2186 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472006 () Bool)

(declare-fun res!281976 () Bool)

(declare-fun e!276722 () Bool)

(assert (=> b!472006 (=> (not res!281976) (not e!276722))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472006 (= res!281976 (and (= (size!14896 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14895 _keys!1025) (size!14896 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472007 () Bool)

(declare-fun res!281975 () Bool)

(assert (=> b!472007 (=> (not res!281975) (not e!276722))))

(declare-datatypes ((List!8896 0))(
  ( (Nil!8893) (Cons!8892 (h!9748 (_ BitVec 64)) (t!14855 List!8896)) )
))
(declare-fun arrayNoDuplicates!0 (array!30243 (_ BitVec 32) List!8896) Bool)

(assert (=> b!472007 (= res!281975 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8893))))

(declare-fun b!472008 () Bool)

(declare-fun e!276724 () Bool)

(declare-fun e!276726 () Bool)

(declare-fun mapRes!21583 () Bool)

(assert (=> b!472008 (= e!276724 (and e!276726 mapRes!21583))))

(declare-fun condMapEmpty!21583 () Bool)

(declare-fun mapDefault!21583 () ValueCell!6281)

(assert (=> b!472008 (= condMapEmpty!21583 (= (arr!14543 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6281)) mapDefault!21583)))))

(declare-fun b!472009 () Bool)

(declare-fun res!281977 () Bool)

(assert (=> b!472009 (=> (not res!281977) (not e!276722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30243 (_ BitVec 32)) Bool)

(assert (=> b!472009 (= res!281977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472010 () Bool)

(assert (=> b!472010 (= e!276722 (not e!276725))))

(declare-fun res!281979 () Bool)

(assert (=> b!472010 (=> res!281979 e!276725)))

(assert (=> b!472010 (= res!281979 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214029 () ListLongMap!7725)

(declare-fun lt!214032 () ListLongMap!7725)

(assert (=> b!472010 (= lt!214029 lt!214032)))

(declare-datatypes ((Unit!13853 0))(
  ( (Unit!13854) )
))
(declare-fun lt!214031 () Unit!13853)

(declare-fun minValueAfter!38 () V!18771)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!208 (array!30243 array!30245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18771 V!18771 V!18771 V!18771 (_ BitVec 32) Int) Unit!13853)

(assert (=> b!472010 (= lt!214031 (lemmaNoChangeToArrayThenSameMapNoExtras!208 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2051 (array!30243 array!30245 (_ BitVec 32) (_ BitVec 32) V!18771 V!18771 (_ BitVec 32) Int) ListLongMap!7725)

(assert (=> b!472010 (= lt!214032 (getCurrentListMapNoExtraKeys!2051 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472010 (= lt!214029 (getCurrentListMapNoExtraKeys!2051 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281978 () Bool)

(assert (=> start!42316 (=> (not res!281978) (not e!276722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42316 (= res!281978 (validMask!0 mask!1365))))

(assert (=> start!42316 e!276722))

(declare-fun tp_is_empty!13249 () Bool)

(assert (=> start!42316 tp_is_empty!13249))

(assert (=> start!42316 tp!41494))

(assert (=> start!42316 true))

(declare-fun array_inv!10574 (array!30243) Bool)

(assert (=> start!42316 (array_inv!10574 _keys!1025)))

(declare-fun array_inv!10575 (array!30245) Bool)

(assert (=> start!42316 (and (array_inv!10575 _values!833) e!276724)))

(declare-fun mapIsEmpty!21583 () Bool)

(assert (=> mapIsEmpty!21583 mapRes!21583))

(declare-fun b!472011 () Bool)

(declare-fun e!276723 () Bool)

(assert (=> b!472011 (= e!276723 tp_is_empty!13249)))

(declare-fun b!472012 () Bool)

(assert (=> b!472012 (= e!276726 tp_is_empty!13249)))

(declare-fun mapNonEmpty!21583 () Bool)

(declare-fun tp!41493 () Bool)

(assert (=> mapNonEmpty!21583 (= mapRes!21583 (and tp!41493 e!276723))))

(declare-fun mapValue!21583 () ValueCell!6281)

(declare-fun mapRest!21583 () (Array (_ BitVec 32) ValueCell!6281))

(declare-fun mapKey!21583 () (_ BitVec 32))

(assert (=> mapNonEmpty!21583 (= (arr!14543 _values!833) (store mapRest!21583 mapKey!21583 mapValue!21583))))

(assert (= (and start!42316 res!281978) b!472006))

(assert (= (and b!472006 res!281976) b!472009))

(assert (= (and b!472009 res!281977) b!472007))

(assert (= (and b!472007 res!281975) b!472010))

(assert (= (and b!472010 (not res!281979)) b!472005))

(assert (= (and b!472008 condMapEmpty!21583) mapIsEmpty!21583))

(assert (= (and b!472008 (not condMapEmpty!21583)) mapNonEmpty!21583))

(get-info :version)

(assert (= (and mapNonEmpty!21583 ((_ is ValueCellFull!6281) mapValue!21583)) b!472011))

(assert (= (and b!472008 ((_ is ValueCellFull!6281) mapDefault!21583)) b!472012))

(assert (= start!42316 b!472008))

(declare-fun m!453543 () Bool)

(assert (=> b!472010 m!453543))

(declare-fun m!453545 () Bool)

(assert (=> b!472010 m!453545))

(declare-fun m!453547 () Bool)

(assert (=> b!472010 m!453547))

(declare-fun m!453549 () Bool)

(assert (=> b!472007 m!453549))

(declare-fun m!453551 () Bool)

(assert (=> b!472005 m!453551))

(declare-fun m!453553 () Bool)

(assert (=> start!42316 m!453553))

(declare-fun m!453555 () Bool)

(assert (=> start!42316 m!453555))

(declare-fun m!453557 () Bool)

(assert (=> start!42316 m!453557))

(declare-fun m!453559 () Bool)

(assert (=> b!472009 m!453559))

(declare-fun m!453561 () Bool)

(assert (=> mapNonEmpty!21583 m!453561))

(check-sat b_and!20241 (not b!472010) (not mapNonEmpty!21583) (not b!472007) tp_is_empty!13249 (not b!472009) (not start!42316) (not b!472005) (not b_next!11821))
(check-sat b_and!20241 (not b_next!11821))
