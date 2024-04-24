; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75924 () Bool)

(assert start!75924)

(declare-fun b!891768 () Bool)

(declare-fun b_free!15727 () Bool)

(declare-fun b_next!15727 () Bool)

(assert (=> b!891768 (= b_free!15727 (not b_next!15727))))

(declare-fun tp!55151 () Bool)

(declare-fun b_and!25977 () Bool)

(assert (=> b!891768 (= tp!55151 b_and!25977)))

(declare-fun b!891764 () Bool)

(declare-fun res!603936 () Bool)

(declare-fun e!497554 () Bool)

(assert (=> b!891764 (=> res!603936 e!497554)))

(declare-datatypes ((array!52129 0))(
  ( (array!52130 (arr!25066 (Array (_ BitVec 32) (_ BitVec 64))) (size!25511 (_ BitVec 32))) )
))
(declare-datatypes ((V!29039 0))(
  ( (V!29040 (val!9078 Int)) )
))
(declare-datatypes ((ValueCell!8546 0))(
  ( (ValueCellFull!8546 (v!11553 V!29039)) (EmptyCell!8546) )
))
(declare-datatypes ((array!52131 0))(
  ( (array!52132 (arr!25067 (Array (_ BitVec 32) ValueCell!8546)) (size!25512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4108 0))(
  ( (LongMapFixedSize!4109 (defaultEntry!5251 Int) (mask!25777 (_ BitVec 32)) (extraKeys!4945 (_ BitVec 32)) (zeroValue!5049 V!29039) (minValue!5049 V!29039) (_size!2109 (_ BitVec 32)) (_keys!9962 array!52129) (_values!5236 array!52131) (_vacant!2109 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4108)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52129 (_ BitVec 32)) Bool)

(assert (=> b!891764 (= res!603936 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9962 thiss!1181) (mask!25777 thiss!1181))))))

(declare-fun b!891765 () Bool)

(declare-fun e!497559 () Bool)

(declare-fun e!497562 () Bool)

(declare-fun mapRes!28637 () Bool)

(assert (=> b!891765 (= e!497559 (and e!497562 mapRes!28637))))

(declare-fun condMapEmpty!28637 () Bool)

(declare-fun mapDefault!28637 () ValueCell!8546)

(assert (=> b!891765 (= condMapEmpty!28637 (= (arr!25067 (_values!5236 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8546)) mapDefault!28637)))))

(declare-fun b!891766 () Bool)

(declare-fun tp_is_empty!18055 () Bool)

(assert (=> b!891766 (= e!497562 tp_is_empty!18055)))

(declare-fun b!891767 () Bool)

(assert (=> b!891767 (= e!497554 true)))

(declare-fun lt!402813 () Bool)

(declare-datatypes ((List!17683 0))(
  ( (Nil!17680) (Cons!17679 (h!18816 (_ BitVec 64)) (t!24974 List!17683)) )
))
(declare-fun arrayNoDuplicates!0 (array!52129 (_ BitVec 32) List!17683) Bool)

(assert (=> b!891767 (= lt!402813 (arrayNoDuplicates!0 (_keys!9962 thiss!1181) #b00000000000000000000000000000000 Nil!17680))))

(declare-fun mapNonEmpty!28637 () Bool)

(declare-fun tp!55150 () Bool)

(declare-fun e!497561 () Bool)

(assert (=> mapNonEmpty!28637 (= mapRes!28637 (and tp!55150 e!497561))))

(declare-fun mapKey!28637 () (_ BitVec 32))

(declare-fun mapRest!28637 () (Array (_ BitVec 32) ValueCell!8546))

(declare-fun mapValue!28637 () ValueCell!8546)

(assert (=> mapNonEmpty!28637 (= (arr!25067 (_values!5236 thiss!1181)) (store mapRest!28637 mapKey!28637 mapValue!28637))))

(declare-fun e!497558 () Bool)

(declare-fun array_inv!19750 (array!52129) Bool)

(declare-fun array_inv!19751 (array!52131) Bool)

(assert (=> b!891768 (= e!497558 (and tp!55151 tp_is_empty!18055 (array_inv!19750 (_keys!9962 thiss!1181)) (array_inv!19751 (_values!5236 thiss!1181)) e!497559))))

(declare-fun mapIsEmpty!28637 () Bool)

(assert (=> mapIsEmpty!28637 mapRes!28637))

(declare-fun b!891769 () Bool)

(declare-fun e!497555 () Bool)

(assert (=> b!891769 (= e!497555 e!497554)))

(declare-fun res!603934 () Bool)

(assert (=> b!891769 (=> res!603934 e!497554)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891769 (= res!603934 (not (validMask!0 (mask!25777 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891769 (arrayContainsKey!0 (_keys!9962 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8767 0))(
  ( (MissingZero!8767 (index!37439 (_ BitVec 32))) (Found!8767 (index!37440 (_ BitVec 32))) (Intermediate!8767 (undefined!9579 Bool) (index!37441 (_ BitVec 32)) (x!75661 (_ BitVec 32))) (Undefined!8767) (MissingVacant!8767 (index!37442 (_ BitVec 32))) )
))
(declare-fun lt!402812 () SeekEntryResult!8767)

(declare-datatypes ((Unit!30304 0))(
  ( (Unit!30305) )
))
(declare-fun lt!402815 () Unit!30304)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52129 (_ BitVec 64) (_ BitVec 32)) Unit!30304)

(assert (=> b!891769 (= lt!402815 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9962 thiss!1181) key!785 (index!37440 lt!402812)))))

(declare-fun b!891770 () Bool)

(declare-fun res!603938 () Bool)

(assert (=> b!891770 (=> res!603938 e!497554)))

(assert (=> b!891770 (= res!603938 (or (not (= (size!25512 (_values!5236 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25777 thiss!1181)))) (not (= (size!25511 (_keys!9962 thiss!1181)) (size!25512 (_values!5236 thiss!1181)))) (bvslt (mask!25777 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4945 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4945 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891771 () Bool)

(assert (=> b!891771 (= e!497561 tp_is_empty!18055)))

(declare-fun b!891772 () Bool)

(declare-fun res!603937 () Bool)

(declare-fun e!497560 () Bool)

(assert (=> b!891772 (=> (not res!603937) (not e!497560))))

(assert (=> b!891772 (= res!603937 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891773 () Bool)

(assert (=> b!891773 (= e!497560 (not e!497555))))

(declare-fun res!603940 () Bool)

(assert (=> b!891773 (=> res!603940 e!497555)))

(get-info :version)

(assert (=> b!891773 (= res!603940 (not ((_ is Found!8767) lt!402812)))))

(declare-fun e!497556 () Bool)

(assert (=> b!891773 e!497556))

(declare-fun res!603935 () Bool)

(assert (=> b!891773 (=> res!603935 e!497556)))

(assert (=> b!891773 (= res!603935 (not ((_ is Found!8767) lt!402812)))))

(declare-fun lt!402814 () Unit!30304)

(declare-fun lemmaSeekEntryGivesInRangeIndex!23 (array!52129 array!52131 (_ BitVec 32) (_ BitVec 32) V!29039 V!29039 (_ BitVec 64)) Unit!30304)

(assert (=> b!891773 (= lt!402814 (lemmaSeekEntryGivesInRangeIndex!23 (_keys!9962 thiss!1181) (_values!5236 thiss!1181) (mask!25777 thiss!1181) (extraKeys!4945 thiss!1181) (zeroValue!5049 thiss!1181) (minValue!5049 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52129 (_ BitVec 32)) SeekEntryResult!8767)

(assert (=> b!891773 (= lt!402812 (seekEntry!0 key!785 (_keys!9962 thiss!1181) (mask!25777 thiss!1181)))))

(declare-fun b!891774 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891774 (= e!497556 (inRange!0 (index!37440 lt!402812) (mask!25777 thiss!1181)))))

(declare-fun res!603939 () Bool)

(assert (=> start!75924 (=> (not res!603939) (not e!497560))))

(declare-fun valid!1605 (LongMapFixedSize!4108) Bool)

(assert (=> start!75924 (= res!603939 (valid!1605 thiss!1181))))

(assert (=> start!75924 e!497560))

(assert (=> start!75924 e!497558))

(assert (=> start!75924 true))

(assert (= (and start!75924 res!603939) b!891772))

(assert (= (and b!891772 res!603937) b!891773))

(assert (= (and b!891773 (not res!603935)) b!891774))

(assert (= (and b!891773 (not res!603940)) b!891769))

(assert (= (and b!891769 (not res!603934)) b!891770))

(assert (= (and b!891770 (not res!603938)) b!891764))

(assert (= (and b!891764 (not res!603936)) b!891767))

(assert (= (and b!891765 condMapEmpty!28637) mapIsEmpty!28637))

(assert (= (and b!891765 (not condMapEmpty!28637)) mapNonEmpty!28637))

(assert (= (and mapNonEmpty!28637 ((_ is ValueCellFull!8546) mapValue!28637)) b!891771))

(assert (= (and b!891765 ((_ is ValueCellFull!8546) mapDefault!28637)) b!891766))

(assert (= b!891768 b!891765))

(assert (= start!75924 b!891768))

(declare-fun m!830587 () Bool)

(assert (=> b!891764 m!830587))

(declare-fun m!830589 () Bool)

(assert (=> b!891773 m!830589))

(declare-fun m!830591 () Bool)

(assert (=> b!891773 m!830591))

(declare-fun m!830593 () Bool)

(assert (=> b!891767 m!830593))

(declare-fun m!830595 () Bool)

(assert (=> mapNonEmpty!28637 m!830595))

(declare-fun m!830597 () Bool)

(assert (=> b!891768 m!830597))

(declare-fun m!830599 () Bool)

(assert (=> b!891768 m!830599))

(declare-fun m!830601 () Bool)

(assert (=> b!891774 m!830601))

(declare-fun m!830603 () Bool)

(assert (=> start!75924 m!830603))

(declare-fun m!830605 () Bool)

(assert (=> b!891769 m!830605))

(declare-fun m!830607 () Bool)

(assert (=> b!891769 m!830607))

(declare-fun m!830609 () Bool)

(assert (=> b!891769 m!830609))

(check-sat (not b!891767) (not b_next!15727) b_and!25977 (not start!75924) (not b!891769) (not b!891774) (not b!891773) (not b!891764) (not mapNonEmpty!28637) (not b!891768) tp_is_empty!18055)
(check-sat b_and!25977 (not b_next!15727))
