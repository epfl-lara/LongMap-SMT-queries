; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33628 () Bool)

(assert start!33628)

(declare-fun b_free!6877 () Bool)

(declare-fun b_next!6877 () Bool)

(assert (=> start!33628 (= b_free!6877 (not b_next!6877))))

(declare-fun tp!24134 () Bool)

(declare-fun b_and!14031 () Bool)

(assert (=> start!33628 (= tp!24134 b_and!14031)))

(declare-fun b!333700 () Bool)

(declare-fun res!183907 () Bool)

(declare-fun e!204869 () Bool)

(assert (=> b!333700 (=> (not res!183907) (not e!204869))))

(declare-datatypes ((array!17233 0))(
  ( (array!17234 (arr!8147 (Array (_ BitVec 32) (_ BitVec 64))) (size!8500 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17233)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17233 (_ BitVec 32)) Bool)

(assert (=> b!333700 (= res!183907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333701 () Bool)

(declare-fun e!204871 () Bool)

(declare-fun e!204867 () Bool)

(declare-fun mapRes!11640 () Bool)

(assert (=> b!333701 (= e!204871 (and e!204867 mapRes!11640))))

(declare-fun condMapEmpty!11640 () Bool)

(declare-datatypes ((V!10083 0))(
  ( (V!10084 (val!3459 Int)) )
))
(declare-datatypes ((ValueCell!3071 0))(
  ( (ValueCellFull!3071 (v!5615 V!10083)) (EmptyCell!3071) )
))
(declare-datatypes ((array!17235 0))(
  ( (array!17236 (arr!8148 (Array (_ BitVec 32) ValueCell!3071)) (size!8501 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17235)

(declare-fun mapDefault!11640 () ValueCell!3071)

(assert (=> b!333701 (= condMapEmpty!11640 (= (arr!8148 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3071)) mapDefault!11640)))))

(declare-fun b!333702 () Bool)

(declare-fun res!183914 () Bool)

(assert (=> b!333702 (=> (not res!183914) (not e!204869))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333702 (= res!183914 (validKeyInArray!0 k0!1348))))

(declare-fun res!183912 () Bool)

(assert (=> start!33628 (=> (not res!183912) (not e!204869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33628 (= res!183912 (validMask!0 mask!2385))))

(assert (=> start!33628 e!204869))

(assert (=> start!33628 true))

(declare-fun tp_is_empty!6829 () Bool)

(assert (=> start!33628 tp_is_empty!6829))

(assert (=> start!33628 tp!24134))

(declare-fun array_inv!6078 (array!17235) Bool)

(assert (=> start!33628 (and (array_inv!6078 _values!1525) e!204871)))

(declare-fun array_inv!6079 (array!17233) Bool)

(assert (=> start!33628 (array_inv!6079 _keys!1895)))

(declare-fun b!333703 () Bool)

(assert (=> b!333703 (= e!204867 tp_is_empty!6829)))

(declare-fun mapIsEmpty!11640 () Bool)

(assert (=> mapIsEmpty!11640 mapRes!11640))

(declare-fun b!333704 () Bool)

(declare-fun res!183910 () Bool)

(assert (=> b!333704 (=> (not res!183910) (not e!204869))))

(declare-datatypes ((List!4611 0))(
  ( (Nil!4608) (Cons!4607 (h!5463 (_ BitVec 64)) (t!9690 List!4611)) )
))
(declare-fun arrayNoDuplicates!0 (array!17233 (_ BitVec 32) List!4611) Bool)

(assert (=> b!333704 (= res!183910 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4608))))

(declare-fun b!333705 () Bool)

(declare-fun e!204870 () Bool)

(assert (=> b!333705 (= e!204869 e!204870)))

(declare-fun res!183913 () Bool)

(assert (=> b!333705 (=> (not res!183913) (not e!204870))))

(declare-datatypes ((SeekEntryResult!3147 0))(
  ( (MissingZero!3147 (index!14767 (_ BitVec 32))) (Found!3147 (index!14768 (_ BitVec 32))) (Intermediate!3147 (undefined!3959 Bool) (index!14769 (_ BitVec 32)) (x!33268 (_ BitVec 32))) (Undefined!3147) (MissingVacant!3147 (index!14770 (_ BitVec 32))) )
))
(declare-fun lt!159203 () SeekEntryResult!3147)

(get-info :version)

(assert (=> b!333705 (= res!183913 (and ((_ is Found!3147) lt!159203) (= (select (arr!8147 _keys!1895) (index!14768 lt!159203)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17233 (_ BitVec 32)) SeekEntryResult!3147)

(assert (=> b!333705 (= lt!159203 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!333706 () Bool)

(declare-fun res!183911 () Bool)

(assert (=> b!333706 (=> (not res!183911) (not e!204870))))

(declare-fun arrayContainsKey!0 (array!17233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333706 (= res!183911 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14768 lt!159203)))))

(declare-fun b!333707 () Bool)

(declare-fun res!183909 () Bool)

(assert (=> b!333707 (=> (not res!183909) (not e!204869))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333707 (= res!183909 (and (= (size!8501 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8500 _keys!1895) (size!8501 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333708 () Bool)

(assert (=> b!333708 (= e!204870 (not true))))

(assert (=> b!333708 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10358 0))(
  ( (Unit!10359) )
))
(declare-fun lt!159204 () Unit!10358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17233 (_ BitVec 64) (_ BitVec 32)) Unit!10358)

(assert (=> b!333708 (= lt!159204 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14768 lt!159203)))))

(declare-fun mapNonEmpty!11640 () Bool)

(declare-fun tp!24135 () Bool)

(declare-fun e!204868 () Bool)

(assert (=> mapNonEmpty!11640 (= mapRes!11640 (and tp!24135 e!204868))))

(declare-fun mapRest!11640 () (Array (_ BitVec 32) ValueCell!3071))

(declare-fun mapKey!11640 () (_ BitVec 32))

(declare-fun mapValue!11640 () ValueCell!3071)

(assert (=> mapNonEmpty!11640 (= (arr!8148 _values!1525) (store mapRest!11640 mapKey!11640 mapValue!11640))))

(declare-fun b!333709 () Bool)

(assert (=> b!333709 (= e!204868 tp_is_empty!6829)))

(declare-fun b!333710 () Bool)

(declare-fun res!183908 () Bool)

(assert (=> b!333710 (=> (not res!183908) (not e!204869))))

(declare-fun zeroValue!1467 () V!10083)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10083)

(declare-datatypes ((tuple2!4970 0))(
  ( (tuple2!4971 (_1!2496 (_ BitVec 64)) (_2!2496 V!10083)) )
))
(declare-datatypes ((List!4612 0))(
  ( (Nil!4609) (Cons!4608 (h!5464 tuple2!4970) (t!9691 List!4612)) )
))
(declare-datatypes ((ListLongMap!3873 0))(
  ( (ListLongMap!3874 (toList!1952 List!4612)) )
))
(declare-fun contains!2007 (ListLongMap!3873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1461 (array!17233 array!17235 (_ BitVec 32) (_ BitVec 32) V!10083 V!10083 (_ BitVec 32) Int) ListLongMap!3873)

(assert (=> b!333710 (= res!183908 (not (contains!2007 (getCurrentListMap!1461 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33628 res!183912) b!333707))

(assert (= (and b!333707 res!183909) b!333700))

(assert (= (and b!333700 res!183907) b!333704))

(assert (= (and b!333704 res!183910) b!333702))

(assert (= (and b!333702 res!183914) b!333710))

(assert (= (and b!333710 res!183908) b!333705))

(assert (= (and b!333705 res!183913) b!333706))

(assert (= (and b!333706 res!183911) b!333708))

(assert (= (and b!333701 condMapEmpty!11640) mapIsEmpty!11640))

(assert (= (and b!333701 (not condMapEmpty!11640)) mapNonEmpty!11640))

(assert (= (and mapNonEmpty!11640 ((_ is ValueCellFull!3071) mapValue!11640)) b!333709))

(assert (= (and b!333701 ((_ is ValueCellFull!3071) mapDefault!11640)) b!333703))

(assert (= start!33628 b!333701))

(declare-fun m!337379 () Bool)

(assert (=> b!333705 m!337379))

(declare-fun m!337381 () Bool)

(assert (=> b!333705 m!337381))

(declare-fun m!337383 () Bool)

(assert (=> b!333702 m!337383))

(declare-fun m!337385 () Bool)

(assert (=> start!33628 m!337385))

(declare-fun m!337387 () Bool)

(assert (=> start!33628 m!337387))

(declare-fun m!337389 () Bool)

(assert (=> start!33628 m!337389))

(declare-fun m!337391 () Bool)

(assert (=> b!333704 m!337391))

(declare-fun m!337393 () Bool)

(assert (=> b!333708 m!337393))

(declare-fun m!337395 () Bool)

(assert (=> b!333708 m!337395))

(declare-fun m!337397 () Bool)

(assert (=> mapNonEmpty!11640 m!337397))

(declare-fun m!337399 () Bool)

(assert (=> b!333700 m!337399))

(declare-fun m!337401 () Bool)

(assert (=> b!333706 m!337401))

(declare-fun m!337403 () Bool)

(assert (=> b!333710 m!337403))

(assert (=> b!333710 m!337403))

(declare-fun m!337405 () Bool)

(assert (=> b!333710 m!337405))

(check-sat (not b!333702) (not b!333705) (not b!333710) b_and!14031 (not b!333706) tp_is_empty!6829 (not start!33628) (not mapNonEmpty!11640) (not b!333708) (not b!333700) (not b_next!6877) (not b!333704))
(check-sat b_and!14031 (not b_next!6877))
