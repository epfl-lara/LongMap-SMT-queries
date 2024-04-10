; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33746 () Bool)

(assert start!33746)

(declare-fun b_free!6981 () Bool)

(declare-fun b_next!6981 () Bool)

(assert (=> start!33746 (= b_free!6981 (not b_next!6981))))

(declare-fun tp!24446 () Bool)

(declare-fun b_and!14161 () Bool)

(assert (=> start!33746 (= tp!24446 b_and!14161)))

(declare-fun b!335691 () Bool)

(declare-fun e!206066 () Bool)

(assert (=> b!335691 (= e!206066 (not true))))

(declare-datatypes ((V!10221 0))(
  ( (V!10222 (val!3511 Int)) )
))
(declare-datatypes ((tuple2!5102 0))(
  ( (tuple2!5103 (_1!2562 (_ BitVec 64)) (_2!2562 V!10221)) )
))
(declare-datatypes ((List!4719 0))(
  ( (Nil!4716) (Cons!4715 (h!5571 tuple2!5102) (t!9807 List!4719)) )
))
(declare-datatypes ((ListLongMap!4015 0))(
  ( (ListLongMap!4016 (toList!2023 List!4719)) )
))
(declare-fun lt!159924 () ListLongMap!4015)

(declare-datatypes ((array!17459 0))(
  ( (array!17460 (arr!8260 (Array (_ BitVec 32) (_ BitVec 64))) (size!8612 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17459)

(declare-datatypes ((SeekEntryResult!3194 0))(
  ( (MissingZero!3194 (index!14955 (_ BitVec 32))) (Found!3194 (index!14956 (_ BitVec 32))) (Intermediate!3194 (undefined!4006 Bool) (index!14957 (_ BitVec 32)) (x!33456 (_ BitVec 32))) (Undefined!3194) (MissingVacant!3194 (index!14958 (_ BitVec 32))) )
))
(declare-fun lt!159923 () SeekEntryResult!3194)

(declare-fun contains!2067 (ListLongMap!4015 (_ BitVec 64)) Bool)

(assert (=> b!335691 (contains!2067 lt!159924 (select (arr!8260 _keys!1895) (index!14956 lt!159923)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((Unit!10451 0))(
  ( (Unit!10452) )
))
(declare-fun lt!159925 () Unit!10451)

(declare-fun zeroValue!1467 () V!10221)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3123 0))(
  ( (ValueCellFull!3123 (v!5673 V!10221)) (EmptyCell!3123) )
))
(declare-datatypes ((array!17461 0))(
  ( (array!17462 (arr!8261 (Array (_ BitVec 32) ValueCell!3123)) (size!8613 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17461)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10221)

(declare-fun lemmaValidKeyInArrayIsInListMap!172 (array!17459 array!17461 (_ BitVec 32) (_ BitVec 32) V!10221 V!10221 (_ BitVec 32) Int) Unit!10451)

(assert (=> b!335691 (= lt!159925 (lemmaValidKeyInArrayIsInListMap!172 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14956 lt!159923) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335691 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159922 () Unit!10451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17459 (_ BitVec 64) (_ BitVec 32)) Unit!10451)

(assert (=> b!335691 (= lt!159922 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14956 lt!159923)))))

(declare-fun mapIsEmpty!11796 () Bool)

(declare-fun mapRes!11796 () Bool)

(assert (=> mapIsEmpty!11796 mapRes!11796))

(declare-fun mapNonEmpty!11796 () Bool)

(declare-fun tp!24447 () Bool)

(declare-fun e!206064 () Bool)

(assert (=> mapNonEmpty!11796 (= mapRes!11796 (and tp!24447 e!206064))))

(declare-fun mapKey!11796 () (_ BitVec 32))

(declare-fun mapRest!11796 () (Array (_ BitVec 32) ValueCell!3123))

(declare-fun mapValue!11796 () ValueCell!3123)

(assert (=> mapNonEmpty!11796 (= (arr!8261 _values!1525) (store mapRest!11796 mapKey!11796 mapValue!11796))))

(declare-fun b!335692 () Bool)

(declare-fun e!206070 () Bool)

(declare-fun e!206067 () Bool)

(assert (=> b!335692 (= e!206070 (and e!206067 mapRes!11796))))

(declare-fun condMapEmpty!11796 () Bool)

(declare-fun mapDefault!11796 () ValueCell!3123)

(assert (=> b!335692 (= condMapEmpty!11796 (= (arr!8261 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3123)) mapDefault!11796)))))

(declare-fun b!335694 () Bool)

(declare-fun res!185284 () Bool)

(declare-fun e!206069 () Bool)

(assert (=> b!335694 (=> (not res!185284) (not e!206069))))

(declare-datatypes ((List!4720 0))(
  ( (Nil!4717) (Cons!4716 (h!5572 (_ BitVec 64)) (t!9808 List!4720)) )
))
(declare-fun arrayNoDuplicates!0 (array!17459 (_ BitVec 32) List!4720) Bool)

(assert (=> b!335694 (= res!185284 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4717))))

(declare-fun b!335695 () Bool)

(declare-fun tp_is_empty!6933 () Bool)

(assert (=> b!335695 (= e!206067 tp_is_empty!6933)))

(declare-fun b!335696 () Bool)

(declare-fun res!185287 () Bool)

(assert (=> b!335696 (=> (not res!185287) (not e!206069))))

(assert (=> b!335696 (= res!185287 (and (= (size!8613 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8612 _keys!1895) (size!8613 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335697 () Bool)

(declare-fun e!206065 () Bool)

(assert (=> b!335697 (= e!206069 e!206065)))

(declare-fun res!185289 () Bool)

(assert (=> b!335697 (=> (not res!185289) (not e!206065))))

(assert (=> b!335697 (= res!185289 (not (contains!2067 lt!159924 k0!1348)))))

(declare-fun getCurrentListMap!1545 (array!17459 array!17461 (_ BitVec 32) (_ BitVec 32) V!10221 V!10221 (_ BitVec 32) Int) ListLongMap!4015)

(assert (=> b!335697 (= lt!159924 (getCurrentListMap!1545 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335698 () Bool)

(declare-fun res!185288 () Bool)

(assert (=> b!335698 (=> (not res!185288) (not e!206069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17459 (_ BitVec 32)) Bool)

(assert (=> b!335698 (= res!185288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335699 () Bool)

(declare-fun res!185285 () Bool)

(assert (=> b!335699 (=> (not res!185285) (not e!206069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335699 (= res!185285 (validKeyInArray!0 k0!1348))))

(declare-fun res!185291 () Bool)

(assert (=> start!33746 (=> (not res!185291) (not e!206069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33746 (= res!185291 (validMask!0 mask!2385))))

(assert (=> start!33746 e!206069))

(assert (=> start!33746 true))

(assert (=> start!33746 tp_is_empty!6933))

(assert (=> start!33746 tp!24446))

(declare-fun array_inv!6134 (array!17461) Bool)

(assert (=> start!33746 (and (array_inv!6134 _values!1525) e!206070)))

(declare-fun array_inv!6135 (array!17459) Bool)

(assert (=> start!33746 (array_inv!6135 _keys!1895)))

(declare-fun b!335693 () Bool)

(assert (=> b!335693 (= e!206064 tp_is_empty!6933)))

(declare-fun b!335700 () Bool)

(assert (=> b!335700 (= e!206065 e!206066)))

(declare-fun res!185290 () Bool)

(assert (=> b!335700 (=> (not res!185290) (not e!206066))))

(get-info :version)

(assert (=> b!335700 (= res!185290 (and ((_ is Found!3194) lt!159923) (= (select (arr!8260 _keys!1895) (index!14956 lt!159923)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17459 (_ BitVec 32)) SeekEntryResult!3194)

(assert (=> b!335700 (= lt!159923 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335701 () Bool)

(declare-fun res!185286 () Bool)

(assert (=> b!335701 (=> (not res!185286) (not e!206066))))

(assert (=> b!335701 (= res!185286 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14956 lt!159923)))))

(assert (= (and start!33746 res!185291) b!335696))

(assert (= (and b!335696 res!185287) b!335698))

(assert (= (and b!335698 res!185288) b!335694))

(assert (= (and b!335694 res!185284) b!335699))

(assert (= (and b!335699 res!185285) b!335697))

(assert (= (and b!335697 res!185289) b!335700))

(assert (= (and b!335700 res!185290) b!335701))

(assert (= (and b!335701 res!185286) b!335691))

(assert (= (and b!335692 condMapEmpty!11796) mapIsEmpty!11796))

(assert (= (and b!335692 (not condMapEmpty!11796)) mapNonEmpty!11796))

(assert (= (and mapNonEmpty!11796 ((_ is ValueCellFull!3123) mapValue!11796)) b!335693))

(assert (= (and b!335692 ((_ is ValueCellFull!3123) mapDefault!11796)) b!335695))

(assert (= start!33746 b!335692))

(declare-fun m!339677 () Bool)

(assert (=> b!335691 m!339677))

(declare-fun m!339679 () Bool)

(assert (=> b!335691 m!339679))

(declare-fun m!339681 () Bool)

(assert (=> b!335691 m!339681))

(declare-fun m!339683 () Bool)

(assert (=> b!335691 m!339683))

(assert (=> b!335691 m!339683))

(declare-fun m!339685 () Bool)

(assert (=> b!335691 m!339685))

(declare-fun m!339687 () Bool)

(assert (=> start!33746 m!339687))

(declare-fun m!339689 () Bool)

(assert (=> start!33746 m!339689))

(declare-fun m!339691 () Bool)

(assert (=> start!33746 m!339691))

(assert (=> b!335700 m!339683))

(declare-fun m!339693 () Bool)

(assert (=> b!335700 m!339693))

(declare-fun m!339695 () Bool)

(assert (=> b!335698 m!339695))

(declare-fun m!339697 () Bool)

(assert (=> b!335694 m!339697))

(declare-fun m!339699 () Bool)

(assert (=> b!335701 m!339699))

(declare-fun m!339701 () Bool)

(assert (=> mapNonEmpty!11796 m!339701))

(declare-fun m!339703 () Bool)

(assert (=> b!335697 m!339703))

(declare-fun m!339705 () Bool)

(assert (=> b!335697 m!339705))

(declare-fun m!339707 () Bool)

(assert (=> b!335699 m!339707))

(check-sat b_and!14161 tp_is_empty!6933 (not mapNonEmpty!11796) (not start!33746) (not b!335701) (not b_next!6981) (not b!335697) (not b!335691) (not b!335699) (not b!335700) (not b!335694) (not b!335698))
(check-sat b_and!14161 (not b_next!6981))
