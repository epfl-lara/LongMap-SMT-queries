; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21646 () Bool)

(assert start!21646)

(declare-fun b!216917 () Bool)

(declare-fun b_free!5791 () Bool)

(declare-fun b_next!5791 () Bool)

(assert (=> b!216917 (= b_free!5791 (not b_next!5791))))

(declare-fun tp!20508 () Bool)

(declare-fun b_and!12655 () Bool)

(assert (=> b!216917 (= tp!20508 b_and!12655)))

(declare-fun b!216916 () Bool)

(declare-fun e!141114 () Bool)

(declare-fun tp_is_empty!5653 () Bool)

(assert (=> b!216916 (= e!141114 tp_is_empty!5653)))

(declare-fun b!216918 () Bool)

(declare-fun res!106135 () Bool)

(declare-fun e!141115 () Bool)

(assert (=> b!216918 (=> (not res!106135) (not e!141115))))

(declare-datatypes ((V!7185 0))(
  ( (V!7186 (val!2871 Int)) )
))
(declare-datatypes ((ValueCell!2483 0))(
  ( (ValueCellFull!2483 (v!4883 V!7185)) (EmptyCell!2483) )
))
(declare-datatypes ((array!10537 0))(
  ( (array!10538 (arr!4989 (Array (_ BitVec 32) ValueCell!2483)) (size!5322 (_ BitVec 32))) )
))
(declare-datatypes ((array!10539 0))(
  ( (array!10540 (arr!4990 (Array (_ BitVec 32) (_ BitVec 64))) (size!5323 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2866 0))(
  ( (LongMapFixedSize!2867 (defaultEntry!4083 Int) (mask!9831 (_ BitVec 32)) (extraKeys!3820 (_ BitVec 32)) (zeroValue!3924 V!7185) (minValue!3924 V!7185) (_size!1482 (_ BitVec 32)) (_keys!6131 array!10539) (_values!4066 array!10537) (_vacant!1482 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2866)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4232 0))(
  ( (tuple2!4233 (_1!2127 (_ BitVec 64)) (_2!2127 V!7185)) )
))
(declare-datatypes ((List!3157 0))(
  ( (Nil!3154) (Cons!3153 (h!3800 tuple2!4232) (t!8103 List!3157)) )
))
(declare-datatypes ((ListLongMap!3135 0))(
  ( (ListLongMap!3136 (toList!1583 List!3157)) )
))
(declare-fun contains!1424 (ListLongMap!3135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1092 (array!10539 array!10537 (_ BitVec 32) (_ BitVec 32) V!7185 V!7185 (_ BitVec 32) Int) ListLongMap!3135)

(assert (=> b!216918 (= res!106135 (contains!1424 (getCurrentListMap!1092 (_keys!6131 thiss!1504) (_values!4066 thiss!1504) (mask!9831 thiss!1504) (extraKeys!3820 thiss!1504) (zeroValue!3924 thiss!1504) (minValue!3924 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4083 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!9642 () Bool)

(declare-fun mapRes!9642 () Bool)

(declare-fun tp!20507 () Bool)

(declare-fun e!141116 () Bool)

(assert (=> mapNonEmpty!9642 (= mapRes!9642 (and tp!20507 e!141116))))

(declare-fun mapValue!9642 () ValueCell!2483)

(declare-fun mapRest!9642 () (Array (_ BitVec 32) ValueCell!2483))

(declare-fun mapKey!9642 () (_ BitVec 32))

(assert (=> mapNonEmpty!9642 (= (arr!4989 (_values!4066 thiss!1504)) (store mapRest!9642 mapKey!9642 mapValue!9642))))

(declare-fun b!216919 () Bool)

(declare-fun res!106137 () Bool)

(assert (=> b!216919 (=> (not res!106137) (not e!141115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!216919 (= res!106137 (validMask!0 (mask!9831 thiss!1504)))))

(declare-fun b!216920 () Bool)

(declare-fun e!141113 () Bool)

(assert (=> b!216920 (= e!141113 (and e!141114 mapRes!9642))))

(declare-fun condMapEmpty!9642 () Bool)

(declare-fun mapDefault!9642 () ValueCell!2483)

(assert (=> b!216920 (= condMapEmpty!9642 (= (arr!4989 (_values!4066 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2483)) mapDefault!9642)))))

(declare-fun b!216921 () Bool)

(declare-fun res!106141 () Bool)

(assert (=> b!216921 (=> (not res!106141) (not e!141115))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10539 (_ BitVec 32)) Bool)

(assert (=> b!216921 (= res!106141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6131 thiss!1504) (mask!9831 thiss!1504)))))

(declare-fun b!216922 () Bool)

(assert (=> b!216922 (= e!141115 false)))

(declare-fun lt!111098 () Bool)

(declare-datatypes ((List!3158 0))(
  ( (Nil!3155) (Cons!3154 (h!3801 (_ BitVec 64)) (t!8104 List!3158)) )
))
(declare-fun arrayNoDuplicates!0 (array!10539 (_ BitVec 32) List!3158) Bool)

(assert (=> b!216922 (= lt!111098 (arrayNoDuplicates!0 (_keys!6131 thiss!1504) #b00000000000000000000000000000000 Nil!3155))))

(declare-fun b!216923 () Bool)

(declare-fun e!141119 () Bool)

(assert (=> b!216923 (= e!141119 e!141115)))

(declare-fun res!106136 () Bool)

(assert (=> b!216923 (=> (not res!106136) (not e!141115))))

(declare-datatypes ((SeekEntryResult!752 0))(
  ( (MissingZero!752 (index!5178 (_ BitVec 32))) (Found!752 (index!5179 (_ BitVec 32))) (Intermediate!752 (undefined!1564 Bool) (index!5180 (_ BitVec 32)) (x!22695 (_ BitVec 32))) (Undefined!752) (MissingVacant!752 (index!5181 (_ BitVec 32))) )
))
(declare-fun lt!111097 () SeekEntryResult!752)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!216923 (= res!106136 (or (= lt!111097 (MissingZero!752 index!297)) (= lt!111097 (MissingVacant!752 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10539 (_ BitVec 32)) SeekEntryResult!752)

(assert (=> b!216923 (= lt!111097 (seekEntryOrOpen!0 key!932 (_keys!6131 thiss!1504) (mask!9831 thiss!1504)))))

(declare-fun b!216924 () Bool)

(declare-fun res!106140 () Bool)

(assert (=> b!216924 (=> (not res!106140) (not e!141119))))

(assert (=> b!216924 (= res!106140 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!216925 () Bool)

(assert (=> b!216925 (= e!141116 tp_is_empty!5653)))

(declare-fun mapIsEmpty!9642 () Bool)

(assert (=> mapIsEmpty!9642 mapRes!9642))

(declare-fun b!216926 () Bool)

(declare-fun res!106138 () Bool)

(assert (=> b!216926 (=> (not res!106138) (not e!141115))))

(assert (=> b!216926 (= res!106138 (and (= (size!5322 (_values!4066 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9831 thiss!1504))) (= (size!5323 (_keys!6131 thiss!1504)) (size!5322 (_values!4066 thiss!1504))) (bvsge (mask!9831 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3820 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3820 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun e!141118 () Bool)

(declare-fun array_inv!3285 (array!10539) Bool)

(declare-fun array_inv!3286 (array!10537) Bool)

(assert (=> b!216917 (= e!141118 (and tp!20508 tp_is_empty!5653 (array_inv!3285 (_keys!6131 thiss!1504)) (array_inv!3286 (_values!4066 thiss!1504)) e!141113))))

(declare-fun res!106139 () Bool)

(assert (=> start!21646 (=> (not res!106139) (not e!141119))))

(declare-fun valid!1181 (LongMapFixedSize!2866) Bool)

(assert (=> start!21646 (= res!106139 (valid!1181 thiss!1504))))

(assert (=> start!21646 e!141119))

(assert (=> start!21646 e!141118))

(assert (=> start!21646 true))

(assert (= (and start!21646 res!106139) b!216924))

(assert (= (and b!216924 res!106140) b!216923))

(assert (= (and b!216923 res!106136) b!216918))

(assert (= (and b!216918 res!106135) b!216919))

(assert (= (and b!216919 res!106137) b!216926))

(assert (= (and b!216926 res!106138) b!216921))

(assert (= (and b!216921 res!106141) b!216922))

(assert (= (and b!216920 condMapEmpty!9642) mapIsEmpty!9642))

(assert (= (and b!216920 (not condMapEmpty!9642)) mapNonEmpty!9642))

(get-info :version)

(assert (= (and mapNonEmpty!9642 ((_ is ValueCellFull!2483) mapValue!9642)) b!216925))

(assert (= (and b!216920 ((_ is ValueCellFull!2483) mapDefault!9642)) b!216916))

(assert (= b!216917 b!216920))

(assert (= start!21646 b!216917))

(declare-fun m!242913 () Bool)

(assert (=> b!216917 m!242913))

(declare-fun m!242915 () Bool)

(assert (=> b!216917 m!242915))

(declare-fun m!242917 () Bool)

(assert (=> b!216922 m!242917))

(declare-fun m!242919 () Bool)

(assert (=> mapNonEmpty!9642 m!242919))

(declare-fun m!242921 () Bool)

(assert (=> b!216921 m!242921))

(declare-fun m!242923 () Bool)

(assert (=> b!216923 m!242923))

(declare-fun m!242925 () Bool)

(assert (=> start!21646 m!242925))

(declare-fun m!242927 () Bool)

(assert (=> b!216918 m!242927))

(assert (=> b!216918 m!242927))

(declare-fun m!242929 () Bool)

(assert (=> b!216918 m!242929))

(declare-fun m!242931 () Bool)

(assert (=> b!216919 m!242931))

(check-sat b_and!12655 (not b!216923) (not b!216922) (not b_next!5791) (not b!216917) (not mapNonEmpty!9642) (not b!216919) (not start!21646) (not b!216921) tp_is_empty!5653 (not b!216918))
(check-sat b_and!12655 (not b_next!5791))
