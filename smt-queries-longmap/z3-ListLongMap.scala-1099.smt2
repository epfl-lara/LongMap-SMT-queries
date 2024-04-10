; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22560 () Bool)

(assert start!22560)

(declare-fun b!235866 () Bool)

(declare-fun b_free!6345 () Bool)

(declare-fun b_next!6345 () Bool)

(assert (=> b!235866 (= b_free!6345 (not b_next!6345))))

(declare-fun tp!22207 () Bool)

(declare-fun b_and!13277 () Bool)

(assert (=> b!235866 (= tp!22207 b_and!13277)))

(declare-fun b!235865 () Bool)

(declare-fun res!115681 () Bool)

(declare-fun e!153176 () Bool)

(assert (=> b!235865 (=> (not res!115681) (not e!153176))))

(declare-datatypes ((V!7923 0))(
  ( (V!7924 (val!3148 Int)) )
))
(declare-datatypes ((ValueCell!2760 0))(
  ( (ValueCellFull!2760 (v!5177 V!7923)) (EmptyCell!2760) )
))
(declare-datatypes ((array!11675 0))(
  ( (array!11676 (arr!5548 (Array (_ BitVec 32) ValueCell!2760)) (size!5885 (_ BitVec 32))) )
))
(declare-datatypes ((array!11677 0))(
  ( (array!11678 (arr!5549 (Array (_ BitVec 32) (_ BitVec 64))) (size!5886 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3420 0))(
  ( (LongMapFixedSize!3421 (defaultEntry!4382 Int) (mask!10361 (_ BitVec 32)) (extraKeys!4119 (_ BitVec 32)) (zeroValue!4223 V!7923) (minValue!4223 V!7923) (_size!1759 (_ BitVec 32)) (_keys!6460 array!11677) (_values!4365 array!11675) (_vacant!1759 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3420)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4638 0))(
  ( (tuple2!4639 (_1!2330 (_ BitVec 64)) (_2!2330 V!7923)) )
))
(declare-datatypes ((List!3547 0))(
  ( (Nil!3544) (Cons!3543 (h!4195 tuple2!4638) (t!8524 List!3547)) )
))
(declare-datatypes ((ListLongMap!3551 0))(
  ( (ListLongMap!3552 (toList!1791 List!3547)) )
))
(declare-fun contains!1669 (ListLongMap!3551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1319 (array!11677 array!11675 (_ BitVec 32) (_ BitVec 32) V!7923 V!7923 (_ BitVec 32) Int) ListLongMap!3551)

(assert (=> b!235865 (= res!115681 (contains!1669 (getCurrentListMap!1319 (_keys!6460 thiss!1504) (_values!4365 thiss!1504) (mask!10361 thiss!1504) (extraKeys!4119 thiss!1504) (zeroValue!4223 thiss!1504) (minValue!4223 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4382 thiss!1504)) key!932))))

(declare-fun e!153175 () Bool)

(declare-fun tp_is_empty!6207 () Bool)

(declare-fun e!153171 () Bool)

(declare-fun array_inv!3661 (array!11677) Bool)

(declare-fun array_inv!3662 (array!11675) Bool)

(assert (=> b!235866 (= e!153175 (and tp!22207 tp_is_empty!6207 (array_inv!3661 (_keys!6460 thiss!1504)) (array_inv!3662 (_values!4365 thiss!1504)) e!153171))))

(declare-datatypes ((SeekEntryResult!995 0))(
  ( (MissingZero!995 (index!6150 (_ BitVec 32))) (Found!995 (index!6151 (_ BitVec 32))) (Intermediate!995 (undefined!1807 Bool) (index!6152 (_ BitVec 32)) (x!23825 (_ BitVec 32))) (Undefined!995) (MissingVacant!995 (index!6153 (_ BitVec 32))) )
))
(declare-fun lt!119266 () SeekEntryResult!995)

(declare-fun e!153172 () Bool)

(declare-fun b!235867 () Bool)

(assert (=> b!235867 (= e!153172 (= (select (arr!5549 (_keys!6460 thiss!1504)) (index!6151 lt!119266)) key!932))))

(declare-fun b!235868 () Bool)

(declare-fun e!153178 () Bool)

(assert (=> b!235868 (= e!153178 tp_is_empty!6207)))

(declare-fun res!115684 () Bool)

(declare-fun e!153174 () Bool)

(assert (=> start!22560 (=> (not res!115684) (not e!153174))))

(declare-fun valid!1352 (LongMapFixedSize!3420) Bool)

(assert (=> start!22560 (= res!115684 (valid!1352 thiss!1504))))

(assert (=> start!22560 e!153174))

(assert (=> start!22560 e!153175))

(assert (=> start!22560 true))

(declare-fun b!235869 () Bool)

(declare-fun res!115686 () Bool)

(assert (=> b!235869 (=> (not res!115686) (not e!153172))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235869 (= res!115686 (inRange!0 (index!6151 lt!119266) (mask!10361 thiss!1504)))))

(declare-fun b!235870 () Bool)

(assert (=> b!235870 (= e!153176 (not false))))

(assert (=> b!235870 e!153172))

(declare-fun res!115685 () Bool)

(assert (=> b!235870 (=> (not res!115685) (not e!153172))))

(get-info :version)

(assert (=> b!235870 (= res!115685 ((_ is Found!995) lt!119266))))

(declare-datatypes ((Unit!7264 0))(
  ( (Unit!7265) )
))
(declare-fun lt!119265 () Unit!7264)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!316 (array!11677 array!11675 (_ BitVec 32) (_ BitVec 32) V!7923 V!7923 (_ BitVec 64) Int) Unit!7264)

(assert (=> b!235870 (= lt!119265 (lemmaInListMapThenSeekEntryOrOpenFindsIt!316 (_keys!6460 thiss!1504) (_values!4365 thiss!1504) (mask!10361 thiss!1504) (extraKeys!4119 thiss!1504) (zeroValue!4223 thiss!1504) (minValue!4223 thiss!1504) key!932 (defaultEntry!4382 thiss!1504)))))

(declare-fun b!235871 () Bool)

(declare-fun res!115683 () Bool)

(assert (=> b!235871 (=> (not res!115683) (not e!153174))))

(assert (=> b!235871 (= res!115683 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235872 () Bool)

(assert (=> b!235872 (= e!153174 e!153176)))

(declare-fun res!115682 () Bool)

(assert (=> b!235872 (=> (not res!115682) (not e!153176))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235872 (= res!115682 (or (= lt!119266 (MissingZero!995 index!297)) (= lt!119266 (MissingVacant!995 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11677 (_ BitVec 32)) SeekEntryResult!995)

(assert (=> b!235872 (= lt!119266 (seekEntryOrOpen!0 key!932 (_keys!6460 thiss!1504) (mask!10361 thiss!1504)))))

(declare-fun b!235873 () Bool)

(declare-fun e!153173 () Bool)

(declare-fun mapRes!10511 () Bool)

(assert (=> b!235873 (= e!153171 (and e!153173 mapRes!10511))))

(declare-fun condMapEmpty!10511 () Bool)

(declare-fun mapDefault!10511 () ValueCell!2760)

(assert (=> b!235873 (= condMapEmpty!10511 (= (arr!5548 (_values!4365 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2760)) mapDefault!10511)))))

(declare-fun mapNonEmpty!10511 () Bool)

(declare-fun tp!22208 () Bool)

(assert (=> mapNonEmpty!10511 (= mapRes!10511 (and tp!22208 e!153178))))

(declare-fun mapKey!10511 () (_ BitVec 32))

(declare-fun mapRest!10511 () (Array (_ BitVec 32) ValueCell!2760))

(declare-fun mapValue!10511 () ValueCell!2760)

(assert (=> mapNonEmpty!10511 (= (arr!5548 (_values!4365 thiss!1504)) (store mapRest!10511 mapKey!10511 mapValue!10511))))

(declare-fun mapIsEmpty!10511 () Bool)

(assert (=> mapIsEmpty!10511 mapRes!10511))

(declare-fun b!235874 () Bool)

(assert (=> b!235874 (= e!153173 tp_is_empty!6207)))

(assert (= (and start!22560 res!115684) b!235871))

(assert (= (and b!235871 res!115683) b!235872))

(assert (= (and b!235872 res!115682) b!235865))

(assert (= (and b!235865 res!115681) b!235870))

(assert (= (and b!235870 res!115685) b!235869))

(assert (= (and b!235869 res!115686) b!235867))

(assert (= (and b!235873 condMapEmpty!10511) mapIsEmpty!10511))

(assert (= (and b!235873 (not condMapEmpty!10511)) mapNonEmpty!10511))

(assert (= (and mapNonEmpty!10511 ((_ is ValueCellFull!2760) mapValue!10511)) b!235868))

(assert (= (and b!235873 ((_ is ValueCellFull!2760) mapDefault!10511)) b!235874))

(assert (= b!235866 b!235873))

(assert (= start!22560 b!235866))

(declare-fun m!256837 () Bool)

(assert (=> b!235872 m!256837))

(declare-fun m!256839 () Bool)

(assert (=> b!235870 m!256839))

(declare-fun m!256841 () Bool)

(assert (=> b!235865 m!256841))

(assert (=> b!235865 m!256841))

(declare-fun m!256843 () Bool)

(assert (=> b!235865 m!256843))

(declare-fun m!256845 () Bool)

(assert (=> mapNonEmpty!10511 m!256845))

(declare-fun m!256847 () Bool)

(assert (=> b!235869 m!256847))

(declare-fun m!256849 () Bool)

(assert (=> b!235866 m!256849))

(declare-fun m!256851 () Bool)

(assert (=> b!235866 m!256851))

(declare-fun m!256853 () Bool)

(assert (=> b!235867 m!256853))

(declare-fun m!256855 () Bool)

(assert (=> start!22560 m!256855))

(check-sat (not b_next!6345) (not b!235865) (not start!22560) tp_is_empty!6207 (not b!235870) (not b!235872) (not b!235869) (not mapNonEmpty!10511) b_and!13277 (not b!235866))
(check-sat b_and!13277 (not b_next!6345))
