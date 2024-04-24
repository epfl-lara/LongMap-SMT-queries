; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37434 () Bool)

(assert start!37434)

(declare-fun b_free!8575 () Bool)

(declare-fun b_next!8575 () Bool)

(assert (=> start!37434 (= b_free!8575 (not b_next!8575))))

(declare-fun tp!30440 () Bool)

(declare-fun b_and!15831 () Bool)

(assert (=> start!37434 (= tp!30440 b_and!15831)))

(declare-fun b!381303 () Bool)

(declare-fun res!216667 () Bool)

(declare-fun e!231828 () Bool)

(assert (=> b!381303 (=> (not res!216667) (not e!231828))))

(declare-datatypes ((array!22346 0))(
  ( (array!22347 (arr!10641 (Array (_ BitVec 32) (_ BitVec 64))) (size!10993 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22346)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381303 (= res!216667 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381305 () Bool)

(declare-fun e!231830 () Bool)

(assert (=> b!381305 (= e!231828 e!231830)))

(declare-fun res!216672 () Bool)

(assert (=> b!381305 (=> (not res!216672) (not e!231830))))

(declare-fun lt!178746 () array!22346)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22346 (_ BitVec 32)) Bool)

(assert (=> b!381305 (= res!216672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178746 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381305 (= lt!178746 (array!22347 (store (arr!10641 _keys!658) i!548 k0!778) (size!10993 _keys!658)))))

(declare-fun b!381306 () Bool)

(declare-fun res!216675 () Bool)

(assert (=> b!381306 (=> (not res!216675) (not e!231828))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13403 0))(
  ( (V!13404 (val!4656 Int)) )
))
(declare-datatypes ((ValueCell!4268 0))(
  ( (ValueCellFull!4268 (v!6854 V!13403)) (EmptyCell!4268) )
))
(declare-datatypes ((array!22348 0))(
  ( (array!22349 (arr!10642 (Array (_ BitVec 32) ValueCell!4268)) (size!10994 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22348)

(assert (=> b!381306 (= res!216675 (and (= (size!10994 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10993 _keys!658) (size!10994 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381307 () Bool)

(declare-fun e!231831 () Bool)

(declare-fun tp_is_empty!9223 () Bool)

(assert (=> b!381307 (= e!231831 tp_is_empty!9223)))

(declare-fun b!381308 () Bool)

(declare-fun res!216668 () Bool)

(assert (=> b!381308 (=> (not res!216668) (not e!231828))))

(assert (=> b!381308 (= res!216668 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10993 _keys!658))))))

(declare-fun mapNonEmpty!15399 () Bool)

(declare-fun mapRes!15399 () Bool)

(declare-fun tp!30441 () Bool)

(assert (=> mapNonEmpty!15399 (= mapRes!15399 (and tp!30441 e!231831))))

(declare-fun mapKey!15399 () (_ BitVec 32))

(declare-fun mapValue!15399 () ValueCell!4268)

(declare-fun mapRest!15399 () (Array (_ BitVec 32) ValueCell!4268))

(assert (=> mapNonEmpty!15399 (= (arr!10642 _values!506) (store mapRest!15399 mapKey!15399 mapValue!15399))))

(declare-fun b!381309 () Bool)

(declare-fun e!231825 () Bool)

(assert (=> b!381309 (= e!231825 true)))

(declare-datatypes ((tuple2!6130 0))(
  ( (tuple2!6131 (_1!3076 (_ BitVec 64)) (_2!3076 V!13403)) )
))
(declare-datatypes ((List!5964 0))(
  ( (Nil!5961) (Cons!5960 (h!6816 tuple2!6130) (t!11106 List!5964)) )
))
(declare-datatypes ((ListLongMap!5045 0))(
  ( (ListLongMap!5046 (toList!2538 List!5964)) )
))
(declare-fun lt!178742 () ListLongMap!5045)

(declare-fun lt!178749 () ListLongMap!5045)

(assert (=> b!381309 (= lt!178742 lt!178749)))

(declare-fun b!381310 () Bool)

(declare-fun res!216676 () Bool)

(assert (=> b!381310 (=> (not res!216676) (not e!231828))))

(assert (=> b!381310 (= res!216676 (or (= (select (arr!10641 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10641 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381311 () Bool)

(assert (=> b!381311 (= e!231830 (not e!231825))))

(declare-fun res!216673 () Bool)

(assert (=> b!381311 (=> res!216673 e!231825)))

(declare-fun lt!178748 () Bool)

(assert (=> b!381311 (= res!216673 (or (and (not lt!178748) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178748) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178748)))))

(assert (=> b!381311 (= lt!178748 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!178744 () ListLongMap!5045)

(declare-fun zeroValue!472 () V!13403)

(declare-fun minValue!472 () V!13403)

(declare-fun getCurrentListMap!1976 (array!22346 array!22348 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) Int) ListLongMap!5045)

(assert (=> b!381311 (= lt!178744 (getCurrentListMap!1976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178745 () array!22348)

(assert (=> b!381311 (= lt!178742 (getCurrentListMap!1976 lt!178746 lt!178745 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178743 () ListLongMap!5045)

(assert (=> b!381311 (and (= lt!178749 lt!178743) (= lt!178743 lt!178749))))

(declare-fun v!373 () V!13403)

(declare-fun lt!178750 () ListLongMap!5045)

(declare-fun +!934 (ListLongMap!5045 tuple2!6130) ListLongMap!5045)

(assert (=> b!381311 (= lt!178743 (+!934 lt!178750 (tuple2!6131 k0!778 v!373)))))

(declare-datatypes ((Unit!11747 0))(
  ( (Unit!11748) )
))
(declare-fun lt!178747 () Unit!11747)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!163 (array!22346 array!22348 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) (_ BitVec 64) V!13403 (_ BitVec 32) Int) Unit!11747)

(assert (=> b!381311 (= lt!178747 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!163 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!823 (array!22346 array!22348 (_ BitVec 32) (_ BitVec 32) V!13403 V!13403 (_ BitVec 32) Int) ListLongMap!5045)

(assert (=> b!381311 (= lt!178749 (getCurrentListMapNoExtraKeys!823 lt!178746 lt!178745 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381311 (= lt!178745 (array!22349 (store (arr!10642 _values!506) i!548 (ValueCellFull!4268 v!373)) (size!10994 _values!506)))))

(assert (=> b!381311 (= lt!178750 (getCurrentListMapNoExtraKeys!823 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381304 () Bool)

(declare-fun res!216677 () Bool)

(assert (=> b!381304 (=> (not res!216677) (not e!231828))))

(declare-datatypes ((List!5965 0))(
  ( (Nil!5962) (Cons!5961 (h!6817 (_ BitVec 64)) (t!11107 List!5965)) )
))
(declare-fun arrayNoDuplicates!0 (array!22346 (_ BitVec 32) List!5965) Bool)

(assert (=> b!381304 (= res!216677 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5962))))

(declare-fun res!216671 () Bool)

(assert (=> start!37434 (=> (not res!216671) (not e!231828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37434 (= res!216671 (validMask!0 mask!970))))

(assert (=> start!37434 e!231828))

(declare-fun e!231827 () Bool)

(declare-fun array_inv!7878 (array!22348) Bool)

(assert (=> start!37434 (and (array_inv!7878 _values!506) e!231827)))

(assert (=> start!37434 tp!30440))

(assert (=> start!37434 true))

(assert (=> start!37434 tp_is_empty!9223))

(declare-fun array_inv!7879 (array!22346) Bool)

(assert (=> start!37434 (array_inv!7879 _keys!658)))

(declare-fun b!381312 () Bool)

(declare-fun e!231826 () Bool)

(assert (=> b!381312 (= e!231827 (and e!231826 mapRes!15399))))

(declare-fun condMapEmpty!15399 () Bool)

(declare-fun mapDefault!15399 () ValueCell!4268)

(assert (=> b!381312 (= condMapEmpty!15399 (= (arr!10642 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4268)) mapDefault!15399)))))

(declare-fun b!381313 () Bool)

(declare-fun res!216669 () Bool)

(assert (=> b!381313 (=> (not res!216669) (not e!231828))))

(assert (=> b!381313 (= res!216669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381314 () Bool)

(declare-fun res!216670 () Bool)

(assert (=> b!381314 (=> (not res!216670) (not e!231830))))

(assert (=> b!381314 (= res!216670 (arrayNoDuplicates!0 lt!178746 #b00000000000000000000000000000000 Nil!5962))))

(declare-fun b!381315 () Bool)

(assert (=> b!381315 (= e!231826 tp_is_empty!9223)))

(declare-fun b!381316 () Bool)

(declare-fun res!216674 () Bool)

(assert (=> b!381316 (=> (not res!216674) (not e!231828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381316 (= res!216674 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!15399 () Bool)

(assert (=> mapIsEmpty!15399 mapRes!15399))

(assert (= (and start!37434 res!216671) b!381306))

(assert (= (and b!381306 res!216675) b!381313))

(assert (= (and b!381313 res!216669) b!381304))

(assert (= (and b!381304 res!216677) b!381308))

(assert (= (and b!381308 res!216668) b!381316))

(assert (= (and b!381316 res!216674) b!381310))

(assert (= (and b!381310 res!216676) b!381303))

(assert (= (and b!381303 res!216667) b!381305))

(assert (= (and b!381305 res!216672) b!381314))

(assert (= (and b!381314 res!216670) b!381311))

(assert (= (and b!381311 (not res!216673)) b!381309))

(assert (= (and b!381312 condMapEmpty!15399) mapIsEmpty!15399))

(assert (= (and b!381312 (not condMapEmpty!15399)) mapNonEmpty!15399))

(get-info :version)

(assert (= (and mapNonEmpty!15399 ((_ is ValueCellFull!4268) mapValue!15399)) b!381307))

(assert (= (and b!381312 ((_ is ValueCellFull!4268) mapDefault!15399)) b!381315))

(assert (= start!37434 b!381312))

(declare-fun m!378509 () Bool)

(assert (=> b!381313 m!378509))

(declare-fun m!378511 () Bool)

(assert (=> b!381311 m!378511))

(declare-fun m!378513 () Bool)

(assert (=> b!381311 m!378513))

(declare-fun m!378515 () Bool)

(assert (=> b!381311 m!378515))

(declare-fun m!378517 () Bool)

(assert (=> b!381311 m!378517))

(declare-fun m!378519 () Bool)

(assert (=> b!381311 m!378519))

(declare-fun m!378521 () Bool)

(assert (=> b!381311 m!378521))

(declare-fun m!378523 () Bool)

(assert (=> b!381311 m!378523))

(declare-fun m!378525 () Bool)

(assert (=> b!381314 m!378525))

(declare-fun m!378527 () Bool)

(assert (=> start!37434 m!378527))

(declare-fun m!378529 () Bool)

(assert (=> start!37434 m!378529))

(declare-fun m!378531 () Bool)

(assert (=> start!37434 m!378531))

(declare-fun m!378533 () Bool)

(assert (=> b!381316 m!378533))

(declare-fun m!378535 () Bool)

(assert (=> mapNonEmpty!15399 m!378535))

(declare-fun m!378537 () Bool)

(assert (=> b!381303 m!378537))

(declare-fun m!378539 () Bool)

(assert (=> b!381305 m!378539))

(declare-fun m!378541 () Bool)

(assert (=> b!381305 m!378541))

(declare-fun m!378543 () Bool)

(assert (=> b!381304 m!378543))

(declare-fun m!378545 () Bool)

(assert (=> b!381310 m!378545))

(check-sat (not b!381305) (not b!381314) (not b!381316) tp_is_empty!9223 (not start!37434) (not b!381313) (not b_next!8575) (not b!381311) (not b!381303) (not mapNonEmpty!15399) b_and!15831 (not b!381304))
(check-sat b_and!15831 (not b_next!8575))
