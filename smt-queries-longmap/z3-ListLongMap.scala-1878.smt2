; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33704 () Bool)

(assert start!33704)

(declare-fun b_free!6939 () Bool)

(declare-fun b_next!6939 () Bool)

(assert (=> start!33704 (= b_free!6939 (not b_next!6939))))

(declare-fun tp!24320 () Bool)

(declare-fun b_and!14119 () Bool)

(assert (=> start!33704 (= tp!24320 b_and!14119)))

(declare-fun b!334998 () Bool)

(declare-fun res!184784 () Bool)

(declare-fun e!205625 () Bool)

(assert (=> b!334998 (=> (not res!184784) (not e!205625))))

(declare-datatypes ((array!17375 0))(
  ( (array!17376 (arr!8218 (Array (_ BitVec 32) (_ BitVec 64))) (size!8570 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17375)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17375 (_ BitVec 32)) Bool)

(assert (=> b!334998 (= res!184784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334999 () Bool)

(declare-fun e!205623 () Bool)

(declare-fun tp_is_empty!6891 () Bool)

(assert (=> b!334999 (= e!205623 tp_is_empty!6891)))

(declare-fun b!335000 () Bool)

(declare-fun e!205626 () Bool)

(declare-fun e!205629 () Bool)

(assert (=> b!335000 (= e!205626 e!205629)))

(declare-fun res!184781 () Bool)

(assert (=> b!335000 (=> (not res!184781) (not e!205629))))

(declare-datatypes ((SeekEntryResult!3176 0))(
  ( (MissingZero!3176 (index!14883 (_ BitVec 32))) (Found!3176 (index!14884 (_ BitVec 32))) (Intermediate!3176 (undefined!3988 Bool) (index!14885 (_ BitVec 32)) (x!33382 (_ BitVec 32))) (Undefined!3176) (MissingVacant!3176 (index!14886 (_ BitVec 32))) )
))
(declare-fun lt!159670 () SeekEntryResult!3176)

(declare-fun k0!1348 () (_ BitVec 64))

(get-info :version)

(assert (=> b!335000 (= res!184781 (and ((_ is Found!3176) lt!159670) (= (select (arr!8218 _keys!1895) (index!14884 lt!159670)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17375 (_ BitVec 32)) SeekEntryResult!3176)

(assert (=> b!335000 (= lt!159670 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335001 () Bool)

(declare-fun res!184786 () Bool)

(assert (=> b!335001 (=> (not res!184786) (not e!205629))))

(declare-fun arrayContainsKey!0 (array!17375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335001 (= res!184786 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14884 lt!159670)))))

(declare-fun b!335003 () Bool)

(declare-fun e!205628 () Bool)

(assert (=> b!335003 (= e!205628 tp_is_empty!6891)))

(declare-fun b!335004 () Bool)

(assert (=> b!335004 (= e!205629 (not true))))

(declare-datatypes ((V!10165 0))(
  ( (V!10166 (val!3490 Int)) )
))
(declare-datatypes ((tuple2!5066 0))(
  ( (tuple2!5067 (_1!2544 (_ BitVec 64)) (_2!2544 V!10165)) )
))
(declare-datatypes ((List!4690 0))(
  ( (Nil!4687) (Cons!4686 (h!5542 tuple2!5066) (t!9778 List!4690)) )
))
(declare-datatypes ((ListLongMap!3979 0))(
  ( (ListLongMap!3980 (toList!2005 List!4690)) )
))
(declare-fun lt!159671 () ListLongMap!3979)

(declare-fun contains!2049 (ListLongMap!3979 (_ BitVec 64)) Bool)

(assert (=> b!335004 (contains!2049 lt!159671 (select (arr!8218 _keys!1895) (index!14884 lt!159670)))))

(declare-datatypes ((Unit!10421 0))(
  ( (Unit!10422) )
))
(declare-fun lt!159673 () Unit!10421)

(declare-fun zeroValue!1467 () V!10165)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10165)

(declare-datatypes ((ValueCell!3102 0))(
  ( (ValueCellFull!3102 (v!5652 V!10165)) (EmptyCell!3102) )
))
(declare-datatypes ((array!17377 0))(
  ( (array!17378 (arr!8219 (Array (_ BitVec 32) ValueCell!3102)) (size!8571 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17377)

(declare-fun lemmaValidKeyInArrayIsInListMap!157 (array!17375 array!17377 (_ BitVec 32) (_ BitVec 32) V!10165 V!10165 (_ BitVec 32) Int) Unit!10421)

(assert (=> b!335004 (= lt!159673 (lemmaValidKeyInArrayIsInListMap!157 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14884 lt!159670) defaultEntry!1528))))

(assert (=> b!335004 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159672 () Unit!10421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17375 (_ BitVec 64) (_ BitVec 32)) Unit!10421)

(assert (=> b!335004 (= lt!159672 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14884 lt!159670)))))

(declare-fun b!335005 () Bool)

(declare-fun res!184780 () Bool)

(assert (=> b!335005 (=> (not res!184780) (not e!205625))))

(declare-datatypes ((List!4691 0))(
  ( (Nil!4688) (Cons!4687 (h!5543 (_ BitVec 64)) (t!9779 List!4691)) )
))
(declare-fun arrayNoDuplicates!0 (array!17375 (_ BitVec 32) List!4691) Bool)

(assert (=> b!335005 (= res!184780 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4688))))

(declare-fun b!335006 () Bool)

(declare-fun res!184785 () Bool)

(assert (=> b!335006 (=> (not res!184785) (not e!205625))))

(assert (=> b!335006 (= res!184785 (and (= (size!8571 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8570 _keys!1895) (size!8571 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335007 () Bool)

(declare-fun res!184783 () Bool)

(assert (=> b!335007 (=> (not res!184783) (not e!205625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335007 (= res!184783 (validKeyInArray!0 k0!1348))))

(declare-fun res!184787 () Bool)

(assert (=> start!33704 (=> (not res!184787) (not e!205625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33704 (= res!184787 (validMask!0 mask!2385))))

(assert (=> start!33704 e!205625))

(assert (=> start!33704 true))

(assert (=> start!33704 tp_is_empty!6891))

(assert (=> start!33704 tp!24320))

(declare-fun e!205627 () Bool)

(declare-fun array_inv!6108 (array!17377) Bool)

(assert (=> start!33704 (and (array_inv!6108 _values!1525) e!205627)))

(declare-fun array_inv!6109 (array!17375) Bool)

(assert (=> start!33704 (array_inv!6109 _keys!1895)))

(declare-fun b!335002 () Bool)

(declare-fun mapRes!11733 () Bool)

(assert (=> b!335002 (= e!205627 (and e!205628 mapRes!11733))))

(declare-fun condMapEmpty!11733 () Bool)

(declare-fun mapDefault!11733 () ValueCell!3102)

(assert (=> b!335002 (= condMapEmpty!11733 (= (arr!8219 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3102)) mapDefault!11733)))))

(declare-fun mapNonEmpty!11733 () Bool)

(declare-fun tp!24321 () Bool)

(assert (=> mapNonEmpty!11733 (= mapRes!11733 (and tp!24321 e!205623))))

(declare-fun mapValue!11733 () ValueCell!3102)

(declare-fun mapRest!11733 () (Array (_ BitVec 32) ValueCell!3102))

(declare-fun mapKey!11733 () (_ BitVec 32))

(assert (=> mapNonEmpty!11733 (= (arr!8219 _values!1525) (store mapRest!11733 mapKey!11733 mapValue!11733))))

(declare-fun mapIsEmpty!11733 () Bool)

(assert (=> mapIsEmpty!11733 mapRes!11733))

(declare-fun b!335008 () Bool)

(assert (=> b!335008 (= e!205625 e!205626)))

(declare-fun res!184782 () Bool)

(assert (=> b!335008 (=> (not res!184782) (not e!205626))))

(assert (=> b!335008 (= res!184782 (not (contains!2049 lt!159671 k0!1348)))))

(declare-fun getCurrentListMap!1532 (array!17375 array!17377 (_ BitVec 32) (_ BitVec 32) V!10165 V!10165 (_ BitVec 32) Int) ListLongMap!3979)

(assert (=> b!335008 (= lt!159671 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(assert (= (and start!33704 res!184787) b!335006))

(assert (= (and b!335006 res!184785) b!334998))

(assert (= (and b!334998 res!184784) b!335005))

(assert (= (and b!335005 res!184780) b!335007))

(assert (= (and b!335007 res!184783) b!335008))

(assert (= (and b!335008 res!184782) b!335000))

(assert (= (and b!335000 res!184781) b!335001))

(assert (= (and b!335001 res!184786) b!335004))

(assert (= (and b!335002 condMapEmpty!11733) mapIsEmpty!11733))

(assert (= (and b!335002 (not condMapEmpty!11733)) mapNonEmpty!11733))

(assert (= (and mapNonEmpty!11733 ((_ is ValueCellFull!3102) mapValue!11733)) b!334999))

(assert (= (and b!335002 ((_ is ValueCellFull!3102) mapDefault!11733)) b!335003))

(assert (= start!33704 b!335002))

(declare-fun m!339005 () Bool)

(assert (=> b!334998 m!339005))

(declare-fun m!339007 () Bool)

(assert (=> b!335007 m!339007))

(declare-fun m!339009 () Bool)

(assert (=> mapNonEmpty!11733 m!339009))

(declare-fun m!339011 () Bool)

(assert (=> b!335004 m!339011))

(declare-fun m!339013 () Bool)

(assert (=> b!335004 m!339013))

(declare-fun m!339015 () Bool)

(assert (=> b!335004 m!339015))

(assert (=> b!335004 m!339013))

(declare-fun m!339017 () Bool)

(assert (=> b!335004 m!339017))

(declare-fun m!339019 () Bool)

(assert (=> b!335004 m!339019))

(declare-fun m!339021 () Bool)

(assert (=> start!33704 m!339021))

(declare-fun m!339023 () Bool)

(assert (=> start!33704 m!339023))

(declare-fun m!339025 () Bool)

(assert (=> start!33704 m!339025))

(declare-fun m!339027 () Bool)

(assert (=> b!335001 m!339027))

(declare-fun m!339029 () Bool)

(assert (=> b!335008 m!339029))

(declare-fun m!339031 () Bool)

(assert (=> b!335008 m!339031))

(declare-fun m!339033 () Bool)

(assert (=> b!335005 m!339033))

(assert (=> b!335000 m!339013))

(declare-fun m!339035 () Bool)

(assert (=> b!335000 m!339035))

(check-sat (not b!335007) tp_is_empty!6891 (not b!335005) (not b!335001) (not b!335004) (not b!335000) b_and!14119 (not b!335008) (not mapNonEmpty!11733) (not start!33704) (not b_next!6939) (not b!334998))
(check-sat b_and!14119 (not b_next!6939))
