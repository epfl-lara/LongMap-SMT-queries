; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42356 () Bool)

(assert start!42356)

(declare-fun b_free!11847 () Bool)

(declare-fun b_next!11847 () Bool)

(assert (=> start!42356 (= b_free!11847 (not b_next!11847))))

(declare-fun tp!41571 () Bool)

(declare-fun b_and!20293 () Bool)

(assert (=> start!42356 (= tp!41571 b_and!20293)))

(declare-fun mapNonEmpty!21622 () Bool)

(declare-fun mapRes!21622 () Bool)

(declare-fun tp!41572 () Bool)

(declare-fun e!277134 () Bool)

(assert (=> mapNonEmpty!21622 (= mapRes!21622 (and tp!41572 e!277134))))

(declare-fun mapKey!21622 () (_ BitVec 32))

(declare-datatypes ((V!18805 0))(
  ( (V!18806 (val!6682 Int)) )
))
(declare-datatypes ((ValueCell!6294 0))(
  ( (ValueCellFull!6294 (v!8973 V!18805)) (EmptyCell!6294) )
))
(declare-fun mapValue!21622 () ValueCell!6294)

(declare-fun mapRest!21622 () (Array (_ BitVec 32) ValueCell!6294))

(declare-datatypes ((array!30307 0))(
  ( (array!30308 (arr!14574 (Array (_ BitVec 32) ValueCell!6294)) (size!14926 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30307)

(assert (=> mapNonEmpty!21622 (= (arr!14574 _values!833) (store mapRest!21622 mapKey!21622 mapValue!21622))))

(declare-fun b!472588 () Bool)

(declare-fun res!282301 () Bool)

(declare-fun e!277135 () Bool)

(assert (=> b!472588 (=> (not res!282301) (not e!277135))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30309 0))(
  ( (array!30310 (arr!14575 (Array (_ BitVec 32) (_ BitVec 64))) (size!14927 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30309)

(assert (=> b!472588 (= res!282301 (and (= (size!14926 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14927 _keys!1025) (size!14926 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!282303 () Bool)

(assert (=> start!42356 (=> (not res!282303) (not e!277135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42356 (= res!282303 (validMask!0 mask!1365))))

(assert (=> start!42356 e!277135))

(declare-fun tp_is_empty!13275 () Bool)

(assert (=> start!42356 tp_is_empty!13275))

(assert (=> start!42356 tp!41571))

(assert (=> start!42356 true))

(declare-fun array_inv!10508 (array!30309) Bool)

(assert (=> start!42356 (array_inv!10508 _keys!1025)))

(declare-fun e!277132 () Bool)

(declare-fun array_inv!10509 (array!30307) Bool)

(assert (=> start!42356 (and (array_inv!10509 _values!833) e!277132)))

(declare-fun b!472589 () Bool)

(declare-fun e!277133 () Bool)

(assert (=> b!472589 (= e!277132 (and e!277133 mapRes!21622))))

(declare-fun condMapEmpty!21622 () Bool)

(declare-fun mapDefault!21622 () ValueCell!6294)

(assert (=> b!472589 (= condMapEmpty!21622 (= (arr!14574 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6294)) mapDefault!21622)))))

(declare-fun b!472590 () Bool)

(declare-fun res!282299 () Bool)

(assert (=> b!472590 (=> (not res!282299) (not e!277135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30309 (_ BitVec 32)) Bool)

(assert (=> b!472590 (= res!282299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21622 () Bool)

(assert (=> mapIsEmpty!21622 mapRes!21622))

(declare-fun b!472591 () Bool)

(declare-fun res!282300 () Bool)

(assert (=> b!472591 (=> (not res!282300) (not e!277135))))

(declare-datatypes ((List!8882 0))(
  ( (Nil!8879) (Cons!8878 (h!9734 (_ BitVec 64)) (t!14850 List!8882)) )
))
(declare-fun arrayNoDuplicates!0 (array!30309 (_ BitVec 32) List!8882) Bool)

(assert (=> b!472591 (= res!282300 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8879))))

(declare-fun b!472592 () Bool)

(assert (=> b!472592 (= e!277134 tp_is_empty!13275)))

(declare-fun b!472593 () Bool)

(declare-fun e!277130 () Bool)

(assert (=> b!472593 (= e!277135 (not e!277130))))

(declare-fun res!282302 () Bool)

(assert (=> b!472593 (=> res!282302 e!277130)))

(assert (=> b!472593 (= res!282302 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8800 0))(
  ( (tuple2!8801 (_1!4411 (_ BitVec 64)) (_2!4411 V!18805)) )
))
(declare-datatypes ((List!8883 0))(
  ( (Nil!8880) (Cons!8879 (h!9735 tuple2!8800) (t!14851 List!8883)) )
))
(declare-datatypes ((ListLongMap!7713 0))(
  ( (ListLongMap!7714 (toList!3872 List!8883)) )
))
(declare-fun lt!214420 () ListLongMap!7713)

(declare-fun lt!214421 () ListLongMap!7713)

(assert (=> b!472593 (= lt!214420 lt!214421)))

(declare-datatypes ((Unit!13899 0))(
  ( (Unit!13900) )
))
(declare-fun lt!214419 () Unit!13899)

(declare-fun minValueBefore!38 () V!18805)

(declare-fun zeroValue!794 () V!18805)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18805)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!213 (array!30309 array!30307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18805 V!18805 V!18805 V!18805 (_ BitVec 32) Int) Unit!13899)

(assert (=> b!472593 (= lt!214419 (lemmaNoChangeToArrayThenSameMapNoExtras!213 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2033 (array!30309 array!30307 (_ BitVec 32) (_ BitVec 32) V!18805 V!18805 (_ BitVec 32) Int) ListLongMap!7713)

(assert (=> b!472593 (= lt!214421 (getCurrentListMapNoExtraKeys!2033 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472593 (= lt!214420 (getCurrentListMapNoExtraKeys!2033 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472594 () Bool)

(assert (=> b!472594 (= e!277130 true)))

(declare-fun lt!214422 () ListLongMap!7713)

(declare-fun getCurrentListMap!2242 (array!30309 array!30307 (_ BitVec 32) (_ BitVec 32) V!18805 V!18805 (_ BitVec 32) Int) ListLongMap!7713)

(assert (=> b!472594 (= lt!214422 (getCurrentListMap!2242 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472595 () Bool)

(assert (=> b!472595 (= e!277133 tp_is_empty!13275)))

(assert (= (and start!42356 res!282303) b!472588))

(assert (= (and b!472588 res!282301) b!472590))

(assert (= (and b!472590 res!282299) b!472591))

(assert (= (and b!472591 res!282300) b!472593))

(assert (= (and b!472593 (not res!282302)) b!472594))

(assert (= (and b!472589 condMapEmpty!21622) mapIsEmpty!21622))

(assert (= (and b!472589 (not condMapEmpty!21622)) mapNonEmpty!21622))

(get-info :version)

(assert (= (and mapNonEmpty!21622 ((_ is ValueCellFull!6294) mapValue!21622)) b!472592))

(assert (= (and b!472589 ((_ is ValueCellFull!6294) mapDefault!21622)) b!472595))

(assert (= start!42356 b!472589))

(declare-fun m!454537 () Bool)

(assert (=> start!42356 m!454537))

(declare-fun m!454539 () Bool)

(assert (=> start!42356 m!454539))

(declare-fun m!454541 () Bool)

(assert (=> start!42356 m!454541))

(declare-fun m!454543 () Bool)

(assert (=> b!472591 m!454543))

(declare-fun m!454545 () Bool)

(assert (=> mapNonEmpty!21622 m!454545))

(declare-fun m!454547 () Bool)

(assert (=> b!472590 m!454547))

(declare-fun m!454549 () Bool)

(assert (=> b!472594 m!454549))

(declare-fun m!454551 () Bool)

(assert (=> b!472593 m!454551))

(declare-fun m!454553 () Bool)

(assert (=> b!472593 m!454553))

(declare-fun m!454555 () Bool)

(assert (=> b!472593 m!454555))

(check-sat (not b!472593) (not start!42356) (not b!472591) b_and!20293 (not b_next!11847) (not b!472590) (not b!472594) tp_is_empty!13275 (not mapNonEmpty!21622))
(check-sat b_and!20293 (not b_next!11847))
