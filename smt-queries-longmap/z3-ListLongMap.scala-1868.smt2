; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33628 () Bool)

(assert start!33628)

(declare-fun b_free!6877 () Bool)

(declare-fun b_next!6877 () Bool)

(assert (=> start!33628 (= b_free!6877 (not b_next!6877))))

(declare-fun tp!24134 () Bool)

(declare-fun b_and!14071 () Bool)

(assert (=> start!33628 (= tp!24134 b_and!14071)))

(declare-fun res!184035 () Bool)

(declare-fun e!205010 () Bool)

(assert (=> start!33628 (=> (not res!184035) (not e!205010))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33628 (= res!184035 (validMask!0 mask!2385))))

(assert (=> start!33628 e!205010))

(assert (=> start!33628 true))

(declare-fun tp_is_empty!6829 () Bool)

(assert (=> start!33628 tp_is_empty!6829))

(assert (=> start!33628 tp!24134))

(declare-datatypes ((V!10083 0))(
  ( (V!10084 (val!3459 Int)) )
))
(declare-datatypes ((ValueCell!3071 0))(
  ( (ValueCellFull!3071 (v!5622 V!10083)) (EmptyCell!3071) )
))
(declare-datatypes ((array!17246 0))(
  ( (array!17247 (arr!8153 (Array (_ BitVec 32) ValueCell!3071)) (size!8505 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17246)

(declare-fun e!205013 () Bool)

(declare-fun array_inv!6068 (array!17246) Bool)

(assert (=> start!33628 (and (array_inv!6068 _values!1525) e!205013)))

(declare-datatypes ((array!17248 0))(
  ( (array!17249 (arr!8154 (Array (_ BitVec 32) (_ BitVec 64))) (size!8506 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17248)

(declare-fun array_inv!6069 (array!17248) Bool)

(assert (=> start!33628 (array_inv!6069 _keys!1895)))

(declare-fun b!333922 () Bool)

(declare-fun res!184038 () Bool)

(declare-fun e!205008 () Bool)

(assert (=> b!333922 (=> (not res!184038) (not e!205008))))

(declare-datatypes ((SeekEntryResult!3115 0))(
  ( (MissingZero!3115 (index!14639 (_ BitVec 32))) (Found!3115 (index!14640 (_ BitVec 32))) (Intermediate!3115 (undefined!3927 Bool) (index!14641 (_ BitVec 32)) (x!33238 (_ BitVec 32))) (Undefined!3115) (MissingVacant!3115 (index!14642 (_ BitVec 32))) )
))
(declare-fun lt!159456 () SeekEntryResult!3115)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333922 (= res!184038 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14640 lt!159456)))))

(declare-fun b!333923 () Bool)

(declare-fun res!184034 () Bool)

(assert (=> b!333923 (=> (not res!184034) (not e!205010))))

(declare-datatypes ((List!4563 0))(
  ( (Nil!4560) (Cons!4559 (h!5415 (_ BitVec 64)) (t!9643 List!4563)) )
))
(declare-fun arrayNoDuplicates!0 (array!17248 (_ BitVec 32) List!4563) Bool)

(assert (=> b!333923 (= res!184034 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4560))))

(declare-fun mapIsEmpty!11640 () Bool)

(declare-fun mapRes!11640 () Bool)

(assert (=> mapIsEmpty!11640 mapRes!11640))

(declare-fun b!333924 () Bool)

(assert (=> b!333924 (= e!205010 e!205008)))

(declare-fun res!184033 () Bool)

(assert (=> b!333924 (=> (not res!184033) (not e!205008))))

(get-info :version)

(assert (=> b!333924 (= res!184033 (and ((_ is Found!3115) lt!159456) (= (select (arr!8154 _keys!1895) (index!14640 lt!159456)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17248 (_ BitVec 32)) SeekEntryResult!3115)

(assert (=> b!333924 (= lt!159456 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333925 () Bool)

(declare-fun res!184036 () Bool)

(assert (=> b!333925 (=> (not res!184036) (not e!205010))))

(declare-fun zeroValue!1467 () V!10083)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10083)

(declare-datatypes ((tuple2!4946 0))(
  ( (tuple2!4947 (_1!2484 (_ BitVec 64)) (_2!2484 V!10083)) )
))
(declare-datatypes ((List!4564 0))(
  ( (Nil!4561) (Cons!4560 (h!5416 tuple2!4946) (t!9644 List!4564)) )
))
(declare-datatypes ((ListLongMap!3861 0))(
  ( (ListLongMap!3862 (toList!1946 List!4564)) )
))
(declare-fun contains!2009 (ListLongMap!3861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1478 (array!17248 array!17246 (_ BitVec 32) (_ BitVec 32) V!10083 V!10083 (_ BitVec 32) Int) ListLongMap!3861)

(assert (=> b!333925 (= res!184036 (not (contains!2009 (getCurrentListMap!1478 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!333926 () Bool)

(declare-fun res!184039 () Bool)

(assert (=> b!333926 (=> (not res!184039) (not e!205010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17248 (_ BitVec 32)) Bool)

(assert (=> b!333926 (= res!184039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333927 () Bool)

(declare-fun res!184037 () Bool)

(assert (=> b!333927 (=> (not res!184037) (not e!205010))))

(assert (=> b!333927 (= res!184037 (and (= (size!8505 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8506 _keys!1895) (size!8505 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333928 () Bool)

(declare-fun e!205012 () Bool)

(assert (=> b!333928 (= e!205012 tp_is_empty!6829)))

(declare-fun b!333929 () Bool)

(assert (=> b!333929 (= e!205008 (not true))))

(assert (=> b!333929 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10359 0))(
  ( (Unit!10360) )
))
(declare-fun lt!159457 () Unit!10359)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17248 (_ BitVec 64) (_ BitVec 32)) Unit!10359)

(assert (=> b!333929 (= lt!159457 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14640 lt!159456)))))

(declare-fun b!333930 () Bool)

(declare-fun e!205011 () Bool)

(assert (=> b!333930 (= e!205013 (and e!205011 mapRes!11640))))

(declare-fun condMapEmpty!11640 () Bool)

(declare-fun mapDefault!11640 () ValueCell!3071)

(assert (=> b!333930 (= condMapEmpty!11640 (= (arr!8153 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3071)) mapDefault!11640)))))

(declare-fun b!333931 () Bool)

(assert (=> b!333931 (= e!205011 tp_is_empty!6829)))

(declare-fun mapNonEmpty!11640 () Bool)

(declare-fun tp!24135 () Bool)

(assert (=> mapNonEmpty!11640 (= mapRes!11640 (and tp!24135 e!205012))))

(declare-fun mapRest!11640 () (Array (_ BitVec 32) ValueCell!3071))

(declare-fun mapKey!11640 () (_ BitVec 32))

(declare-fun mapValue!11640 () ValueCell!3071)

(assert (=> mapNonEmpty!11640 (= (arr!8153 _values!1525) (store mapRest!11640 mapKey!11640 mapValue!11640))))

(declare-fun b!333932 () Bool)

(declare-fun res!184040 () Bool)

(assert (=> b!333932 (=> (not res!184040) (not e!205010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333932 (= res!184040 (validKeyInArray!0 k0!1348))))

(assert (= (and start!33628 res!184035) b!333927))

(assert (= (and b!333927 res!184037) b!333926))

(assert (= (and b!333926 res!184039) b!333923))

(assert (= (and b!333923 res!184034) b!333932))

(assert (= (and b!333932 res!184040) b!333925))

(assert (= (and b!333925 res!184036) b!333924))

(assert (= (and b!333924 res!184033) b!333922))

(assert (= (and b!333922 res!184038) b!333929))

(assert (= (and b!333930 condMapEmpty!11640) mapIsEmpty!11640))

(assert (= (and b!333930 (not condMapEmpty!11640)) mapNonEmpty!11640))

(assert (= (and mapNonEmpty!11640 ((_ is ValueCellFull!3071) mapValue!11640)) b!333928))

(assert (= (and b!333930 ((_ is ValueCellFull!3071) mapDefault!11640)) b!333931))

(assert (= start!33628 b!333930))

(declare-fun m!338333 () Bool)

(assert (=> b!333929 m!338333))

(declare-fun m!338335 () Bool)

(assert (=> b!333929 m!338335))

(declare-fun m!338337 () Bool)

(assert (=> b!333925 m!338337))

(assert (=> b!333925 m!338337))

(declare-fun m!338339 () Bool)

(assert (=> b!333925 m!338339))

(declare-fun m!338341 () Bool)

(assert (=> mapNonEmpty!11640 m!338341))

(declare-fun m!338343 () Bool)

(assert (=> b!333924 m!338343))

(declare-fun m!338345 () Bool)

(assert (=> b!333924 m!338345))

(declare-fun m!338347 () Bool)

(assert (=> start!33628 m!338347))

(declare-fun m!338349 () Bool)

(assert (=> start!33628 m!338349))

(declare-fun m!338351 () Bool)

(assert (=> start!33628 m!338351))

(declare-fun m!338353 () Bool)

(assert (=> b!333923 m!338353))

(declare-fun m!338355 () Bool)

(assert (=> b!333926 m!338355))

(declare-fun m!338357 () Bool)

(assert (=> b!333932 m!338357))

(declare-fun m!338359 () Bool)

(assert (=> b!333922 m!338359))

(check-sat (not b!333925) (not b_next!6877) b_and!14071 (not b!333932) (not b!333926) (not b!333929) tp_is_empty!6829 (not b!333922) (not start!33628) (not b!333924) (not b!333923) (not mapNonEmpty!11640))
(check-sat b_and!14071 (not b_next!6877))
