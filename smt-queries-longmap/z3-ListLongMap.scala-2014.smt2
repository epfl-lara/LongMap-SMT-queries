; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35094 () Bool)

(assert start!35094)

(declare-fun b_free!7753 () Bool)

(declare-fun b_next!7753 () Bool)

(assert (=> start!35094 (= b_free!7753 (not b_next!7753))))

(declare-fun tp!26843 () Bool)

(declare-fun b_and!14961 () Bool)

(assert (=> start!35094 (= tp!26843 b_and!14961)))

(declare-fun b!351693 () Bool)

(declare-datatypes ((Unit!10863 0))(
  ( (Unit!10864) )
))
(declare-fun e!215360 () Unit!10863)

(declare-fun Unit!10865 () Unit!10863)

(assert (=> b!351693 (= e!215360 Unit!10865)))

(declare-fun mapNonEmpty!13035 () Bool)

(declare-fun mapRes!13035 () Bool)

(declare-fun tp!26844 () Bool)

(declare-fun e!215358 () Bool)

(assert (=> mapNonEmpty!13035 (= mapRes!13035 (and tp!26844 e!215358))))

(declare-datatypes ((V!11251 0))(
  ( (V!11252 (val!3897 Int)) )
))
(declare-datatypes ((ValueCell!3509 0))(
  ( (ValueCellFull!3509 (v!6080 V!11251)) (EmptyCell!3509) )
))
(declare-fun mapRest!13035 () (Array (_ BitVec 32) ValueCell!3509))

(declare-datatypes ((array!18979 0))(
  ( (array!18980 (arr!8993 (Array (_ BitVec 32) ValueCell!3509)) (size!9346 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18979)

(declare-fun mapKey!13035 () (_ BitVec 32))

(declare-fun mapValue!13035 () ValueCell!3509)

(assert (=> mapNonEmpty!13035 (= (arr!8993 _values!1525) (store mapRest!13035 mapKey!13035 mapValue!13035))))

(declare-fun b!351694 () Bool)

(declare-fun res!195064 () Bool)

(declare-fun e!215356 () Bool)

(assert (=> b!351694 (=> (not res!195064) (not e!215356))))

(declare-datatypes ((array!18981 0))(
  ( (array!18982 (arr!8994 (Array (_ BitVec 32) (_ BitVec 64))) (size!9347 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18981)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18981 (_ BitVec 32)) Bool)

(assert (=> b!351694 (= res!195064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351695 () Bool)

(declare-fun e!215357 () Bool)

(declare-fun tp_is_empty!7705 () Bool)

(assert (=> b!351695 (= e!215357 tp_is_empty!7705)))

(declare-fun b!351696 () Bool)

(declare-fun res!195068 () Bool)

(assert (=> b!351696 (=> (not res!195068) (not e!215356))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351696 (= res!195068 (and (= (size!9346 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9347 _keys!1895) (size!9346 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351697 () Bool)

(declare-fun e!215361 () Bool)

(assert (=> b!351697 (= e!215361 (and e!215357 mapRes!13035))))

(declare-fun condMapEmpty!13035 () Bool)

(declare-fun mapDefault!13035 () ValueCell!3509)

(assert (=> b!351697 (= condMapEmpty!13035 (= (arr!8993 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3509)) mapDefault!13035)))))

(declare-fun b!351698 () Bool)

(assert (=> b!351698 (= e!215358 tp_is_empty!7705)))

(declare-fun b!351699 () Bool)

(declare-fun res!195065 () Bool)

(assert (=> b!351699 (=> (not res!195065) (not e!215356))))

(declare-datatypes ((List!5210 0))(
  ( (Nil!5207) (Cons!5206 (h!6062 (_ BitVec 64)) (t!10343 List!5210)) )
))
(declare-fun arrayNoDuplicates!0 (array!18981 (_ BitVec 32) List!5210) Bool)

(assert (=> b!351699 (= res!195065 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5207))))

(declare-fun b!351700 () Bool)

(declare-fun e!215359 () Bool)

(assert (=> b!351700 (= e!215356 e!215359)))

(declare-fun res!195066 () Bool)

(assert (=> b!351700 (=> (not res!195066) (not e!215359))))

(declare-datatypes ((SeekEntryResult!3463 0))(
  ( (MissingZero!3463 (index!16031 (_ BitVec 32))) (Found!3463 (index!16032 (_ BitVec 32))) (Intermediate!3463 (undefined!4275 Bool) (index!16033 (_ BitVec 32)) (x!35022 (_ BitVec 32))) (Undefined!3463) (MissingVacant!3463 (index!16034 (_ BitVec 32))) )
))
(declare-fun lt!164789 () SeekEntryResult!3463)

(get-info :version)

(assert (=> b!351700 (= res!195066 (and (not ((_ is Found!3463) lt!164789)) (not ((_ is MissingZero!3463) lt!164789)) ((_ is MissingVacant!3463) lt!164789)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18981 (_ BitVec 32)) SeekEntryResult!3463)

(assert (=> b!351700 (= lt!164789 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351701 () Bool)

(declare-fun res!195063 () Bool)

(assert (=> b!351701 (=> (not res!195063) (not e!215356))))

(declare-fun zeroValue!1467 () V!11251)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11251)

(declare-datatypes ((tuple2!5596 0))(
  ( (tuple2!5597 (_1!2809 (_ BitVec 64)) (_2!2809 V!11251)) )
))
(declare-datatypes ((List!5211 0))(
  ( (Nil!5208) (Cons!5207 (h!6063 tuple2!5596) (t!10344 List!5211)) )
))
(declare-datatypes ((ListLongMap!4499 0))(
  ( (ListLongMap!4500 (toList!2265 List!5211)) )
))
(declare-fun contains!2347 (ListLongMap!4499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1770 (array!18981 array!18979 (_ BitVec 32) (_ BitVec 32) V!11251 V!11251 (_ BitVec 32) Int) ListLongMap!4499)

(assert (=> b!351701 (= res!195063 (not (contains!2347 (getCurrentListMap!1770 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351702 () Bool)

(declare-fun res!195067 () Bool)

(assert (=> b!351702 (=> (not res!195067) (not e!215356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351702 (= res!195067 (validKeyInArray!0 k0!1348))))

(declare-fun res!195062 () Bool)

(assert (=> start!35094 (=> (not res!195062) (not e!215356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35094 (= res!195062 (validMask!0 mask!2385))))

(assert (=> start!35094 e!215356))

(assert (=> start!35094 true))

(assert (=> start!35094 tp_is_empty!7705))

(assert (=> start!35094 tp!26843))

(declare-fun array_inv!6662 (array!18979) Bool)

(assert (=> start!35094 (and (array_inv!6662 _values!1525) e!215361)))

(declare-fun array_inv!6663 (array!18981) Bool)

(assert (=> start!35094 (array_inv!6663 _keys!1895)))

(declare-fun mapIsEmpty!13035 () Bool)

(assert (=> mapIsEmpty!13035 mapRes!13035))

(declare-fun b!351703 () Bool)

(assert (=> b!351703 (= e!215359 false)))

(declare-fun lt!164788 () Unit!10863)

(assert (=> b!351703 (= lt!164788 e!215360)))

(declare-fun c!53435 () Bool)

(declare-fun arrayContainsKey!0 (array!18981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351703 (= c!53435 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351704 () Bool)

(declare-fun Unit!10866 () Unit!10863)

(assert (=> b!351704 (= e!215360 Unit!10866)))

(declare-fun lt!164790 () Unit!10863)

(declare-fun lemmaArrayContainsKeyThenInListMap!332 (array!18981 array!18979 (_ BitVec 32) (_ BitVec 32) V!11251 V!11251 (_ BitVec 64) (_ BitVec 32) Int) Unit!10863)

(declare-fun arrayScanForKey!0 (array!18981 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351704 (= lt!164790 (lemmaArrayContainsKeyThenInListMap!332 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!351704 false))

(assert (= (and start!35094 res!195062) b!351696))

(assert (= (and b!351696 res!195068) b!351694))

(assert (= (and b!351694 res!195064) b!351699))

(assert (= (and b!351699 res!195065) b!351702))

(assert (= (and b!351702 res!195067) b!351701))

(assert (= (and b!351701 res!195063) b!351700))

(assert (= (and b!351700 res!195066) b!351703))

(assert (= (and b!351703 c!53435) b!351704))

(assert (= (and b!351703 (not c!53435)) b!351693))

(assert (= (and b!351697 condMapEmpty!13035) mapIsEmpty!13035))

(assert (= (and b!351697 (not condMapEmpty!13035)) mapNonEmpty!13035))

(assert (= (and mapNonEmpty!13035 ((_ is ValueCellFull!3509) mapValue!13035)) b!351698))

(assert (= (and b!351697 ((_ is ValueCellFull!3509) mapDefault!13035)) b!351695))

(assert (= start!35094 b!351697))

(declare-fun m!351021 () Bool)

(assert (=> b!351702 m!351021))

(declare-fun m!351023 () Bool)

(assert (=> b!351704 m!351023))

(assert (=> b!351704 m!351023))

(declare-fun m!351025 () Bool)

(assert (=> b!351704 m!351025))

(declare-fun m!351027 () Bool)

(assert (=> b!351699 m!351027))

(declare-fun m!351029 () Bool)

(assert (=> b!351694 m!351029))

(declare-fun m!351031 () Bool)

(assert (=> b!351701 m!351031))

(assert (=> b!351701 m!351031))

(declare-fun m!351033 () Bool)

(assert (=> b!351701 m!351033))

(declare-fun m!351035 () Bool)

(assert (=> start!35094 m!351035))

(declare-fun m!351037 () Bool)

(assert (=> start!35094 m!351037))

(declare-fun m!351039 () Bool)

(assert (=> start!35094 m!351039))

(declare-fun m!351041 () Bool)

(assert (=> b!351703 m!351041))

(declare-fun m!351043 () Bool)

(assert (=> mapNonEmpty!13035 m!351043))

(declare-fun m!351045 () Bool)

(assert (=> b!351700 m!351045))

(check-sat (not b!351702) (not mapNonEmpty!13035) (not b_next!7753) (not b!351700) (not b!351694) tp_is_empty!7705 (not b!351704) b_and!14961 (not b!351701) (not b!351703) (not start!35094) (not b!351699))
(check-sat b_and!14961 (not b_next!7753))
