; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42472 () Bool)

(assert start!42472)

(declare-fun b_free!11941 () Bool)

(declare-fun b_next!11941 () Bool)

(assert (=> start!42472 (= b_free!11941 (not b_next!11941))))

(declare-fun tp!41860 () Bool)

(declare-fun b_and!20383 () Bool)

(assert (=> start!42472 (= tp!41860 b_and!20383)))

(declare-fun b!473774 () Bool)

(declare-fun e!278010 () Bool)

(assert (=> b!473774 (= e!278010 true)))

(declare-datatypes ((V!18931 0))(
  ( (V!18932 (val!6729 Int)) )
))
(declare-datatypes ((tuple2!8926 0))(
  ( (tuple2!8927 (_1!4474 (_ BitVec 64)) (_2!4474 V!18931)) )
))
(declare-datatypes ((List!8990 0))(
  ( (Nil!8987) (Cons!8986 (h!9842 tuple2!8926) (t!14953 List!8990)) )
))
(declare-datatypes ((ListLongMap!7829 0))(
  ( (ListLongMap!7830 (toList!3930 List!8990)) )
))
(declare-fun lt!215490 () ListLongMap!7829)

(declare-fun lt!215493 () tuple2!8926)

(declare-fun minValueBefore!38 () V!18931)

(declare-fun +!1779 (ListLongMap!7829 tuple2!8926) ListLongMap!7829)

(assert (=> b!473774 (= (+!1779 lt!215490 lt!215493) (+!1779 (+!1779 lt!215490 (tuple2!8927 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215493))))

(declare-fun minValueAfter!38 () V!18931)

(assert (=> b!473774 (= lt!215493 (tuple2!8927 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13956 0))(
  ( (Unit!13957) )
))
(declare-fun lt!215488 () Unit!13956)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!158 (ListLongMap!7829 (_ BitVec 64) V!18931 V!18931) Unit!13956)

(assert (=> b!473774 (= lt!215488 (addSameAsAddTwiceSameKeyDiffValues!158 lt!215490 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215487 () ListLongMap!7829)

(declare-fun zeroValue!794 () V!18931)

(assert (=> b!473774 (= lt!215490 (+!1779 lt!215487 (tuple2!8927 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215486 () ListLongMap!7829)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30477 0))(
  ( (array!30478 (arr!14657 (Array (_ BitVec 32) (_ BitVec 64))) (size!15010 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30477)

(declare-datatypes ((ValueCell!6341 0))(
  ( (ValueCellFull!6341 (v!9015 V!18931)) (EmptyCell!6341) )
))
(declare-datatypes ((array!30479 0))(
  ( (array!30480 (arr!14658 (Array (_ BitVec 32) ValueCell!6341)) (size!15011 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30479)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2231 (array!30477 array!30479 (_ BitVec 32) (_ BitVec 32) V!18931 V!18931 (_ BitVec 32) Int) ListLongMap!7829)

(assert (=> b!473774 (= lt!215486 (getCurrentListMap!2231 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215492 () ListLongMap!7829)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473774 (= lt!215492 (getCurrentListMap!2231 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21769 () Bool)

(declare-fun mapRes!21769 () Bool)

(declare-fun tp!41859 () Bool)

(declare-fun e!278013 () Bool)

(assert (=> mapNonEmpty!21769 (= mapRes!21769 (and tp!41859 e!278013))))

(declare-fun mapRest!21769 () (Array (_ BitVec 32) ValueCell!6341))

(declare-fun mapValue!21769 () ValueCell!6341)

(declare-fun mapKey!21769 () (_ BitVec 32))

(assert (=> mapNonEmpty!21769 (= (arr!14658 _values!833) (store mapRest!21769 mapKey!21769 mapValue!21769))))

(declare-fun b!473775 () Bool)

(declare-fun e!278014 () Bool)

(declare-fun tp_is_empty!13369 () Bool)

(assert (=> b!473775 (= e!278014 tp_is_empty!13369)))

(declare-fun b!473776 () Bool)

(declare-fun res!283016 () Bool)

(declare-fun e!278012 () Bool)

(assert (=> b!473776 (=> (not res!283016) (not e!278012))))

(declare-datatypes ((List!8991 0))(
  ( (Nil!8988) (Cons!8987 (h!9843 (_ BitVec 64)) (t!14954 List!8991)) )
))
(declare-fun arrayNoDuplicates!0 (array!30477 (_ BitVec 32) List!8991) Bool)

(assert (=> b!473776 (= res!283016 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8988))))

(declare-fun b!473777 () Bool)

(assert (=> b!473777 (= e!278012 (not e!278010))))

(declare-fun res!283015 () Bool)

(assert (=> b!473777 (=> res!283015 e!278010)))

(assert (=> b!473777 (= res!283015 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215491 () ListLongMap!7829)

(assert (=> b!473777 (= lt!215487 lt!215491)))

(declare-fun lt!215489 () Unit!13956)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!254 (array!30477 array!30479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18931 V!18931 V!18931 V!18931 (_ BitVec 32) Int) Unit!13956)

(assert (=> b!473777 (= lt!215489 (lemmaNoChangeToArrayThenSameMapNoExtras!254 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2097 (array!30477 array!30479 (_ BitVec 32) (_ BitVec 32) V!18931 V!18931 (_ BitVec 32) Int) ListLongMap!7829)

(assert (=> b!473777 (= lt!215491 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473777 (= lt!215487 (getCurrentListMapNoExtraKeys!2097 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473778 () Bool)

(declare-fun e!278009 () Bool)

(assert (=> b!473778 (= e!278009 (and e!278014 mapRes!21769))))

(declare-fun condMapEmpty!21769 () Bool)

(declare-fun mapDefault!21769 () ValueCell!6341)

(assert (=> b!473778 (= condMapEmpty!21769 (= (arr!14658 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6341)) mapDefault!21769)))))

(declare-fun b!473779 () Bool)

(declare-fun res!283013 () Bool)

(assert (=> b!473779 (=> (not res!283013) (not e!278012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30477 (_ BitVec 32)) Bool)

(assert (=> b!473779 (= res!283013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!283012 () Bool)

(assert (=> start!42472 (=> (not res!283012) (not e!278012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42472 (= res!283012 (validMask!0 mask!1365))))

(assert (=> start!42472 e!278012))

(assert (=> start!42472 tp_is_empty!13369))

(assert (=> start!42472 tp!41860))

(assert (=> start!42472 true))

(declare-fun array_inv!10660 (array!30477) Bool)

(assert (=> start!42472 (array_inv!10660 _keys!1025)))

(declare-fun array_inv!10661 (array!30479) Bool)

(assert (=> start!42472 (and (array_inv!10661 _values!833) e!278009)))

(declare-fun b!473780 () Bool)

(declare-fun res!283014 () Bool)

(assert (=> b!473780 (=> (not res!283014) (not e!278012))))

(assert (=> b!473780 (= res!283014 (and (= (size!15011 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15010 _keys!1025) (size!15011 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21769 () Bool)

(assert (=> mapIsEmpty!21769 mapRes!21769))

(declare-fun b!473781 () Bool)

(assert (=> b!473781 (= e!278013 tp_is_empty!13369)))

(assert (= (and start!42472 res!283012) b!473780))

(assert (= (and b!473780 res!283014) b!473779))

(assert (= (and b!473779 res!283013) b!473776))

(assert (= (and b!473776 res!283016) b!473777))

(assert (= (and b!473777 (not res!283015)) b!473774))

(assert (= (and b!473778 condMapEmpty!21769) mapIsEmpty!21769))

(assert (= (and b!473778 (not condMapEmpty!21769)) mapNonEmpty!21769))

(get-info :version)

(assert (= (and mapNonEmpty!21769 ((_ is ValueCellFull!6341) mapValue!21769)) b!473781))

(assert (= (and b!473778 ((_ is ValueCellFull!6341) mapDefault!21769)) b!473775))

(assert (= start!42472 b!473778))

(declare-fun m!455535 () Bool)

(assert (=> start!42472 m!455535))

(declare-fun m!455537 () Bool)

(assert (=> start!42472 m!455537))

(declare-fun m!455539 () Bool)

(assert (=> start!42472 m!455539))

(declare-fun m!455541 () Bool)

(assert (=> b!473779 m!455541))

(declare-fun m!455543 () Bool)

(assert (=> b!473777 m!455543))

(declare-fun m!455545 () Bool)

(assert (=> b!473777 m!455545))

(declare-fun m!455547 () Bool)

(assert (=> b!473777 m!455547))

(declare-fun m!455549 () Bool)

(assert (=> b!473776 m!455549))

(declare-fun m!455551 () Bool)

(assert (=> b!473774 m!455551))

(declare-fun m!455553 () Bool)

(assert (=> b!473774 m!455553))

(declare-fun m!455555 () Bool)

(assert (=> b!473774 m!455555))

(assert (=> b!473774 m!455553))

(declare-fun m!455557 () Bool)

(assert (=> b!473774 m!455557))

(declare-fun m!455559 () Bool)

(assert (=> b!473774 m!455559))

(declare-fun m!455561 () Bool)

(assert (=> b!473774 m!455561))

(declare-fun m!455563 () Bool)

(assert (=> b!473774 m!455563))

(declare-fun m!455565 () Bool)

(assert (=> mapNonEmpty!21769 m!455565))

(check-sat b_and!20383 (not b_next!11941) (not b!473776) (not b!473777) tp_is_empty!13369 (not b!473774) (not start!42472) (not b!473779) (not mapNonEmpty!21769))
(check-sat b_and!20383 (not b_next!11941))
