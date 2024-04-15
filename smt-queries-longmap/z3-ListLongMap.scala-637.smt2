; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16174 () Bool)

(assert start!16174)

(declare-fun b!161060 () Bool)

(declare-fun b_free!3631 () Bool)

(declare-fun b_next!3631 () Bool)

(assert (=> b!161060 (= b_free!3631 (not b_next!3631))))

(declare-fun tp!13462 () Bool)

(declare-fun b_and!10019 () Bool)

(assert (=> b!161060 (= tp!13462 b_and!10019)))

(declare-fun e!105231 () Bool)

(declare-datatypes ((V!4225 0))(
  ( (V!4226 (val!1761 Int)) )
))
(declare-datatypes ((ValueCell!1373 0))(
  ( (ValueCellFull!1373 (v!3620 V!4225)) (EmptyCell!1373) )
))
(declare-datatypes ((array!5925 0))(
  ( (array!5926 (arr!2806 (Array (_ BitVec 32) (_ BitVec 64))) (size!3091 (_ BitVec 32))) )
))
(declare-datatypes ((array!5927 0))(
  ( (array!5928 (arr!2807 (Array (_ BitVec 32) ValueCell!1373)) (size!3092 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1654 0))(
  ( (LongMapFixedSize!1655 (defaultEntry!3269 Int) (mask!7854 (_ BitVec 32)) (extraKeys!3010 (_ BitVec 32)) (zeroValue!3112 V!4225) (minValue!3112 V!4225) (_size!876 (_ BitVec 32)) (_keys!5069 array!5925) (_values!3252 array!5927) (_vacant!876 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1654)

(declare-fun e!105230 () Bool)

(declare-fun tp_is_empty!3433 () Bool)

(declare-fun array_inv!1805 (array!5925) Bool)

(declare-fun array_inv!1806 (array!5927) Bool)

(assert (=> b!161060 (= e!105230 (and tp!13462 tp_is_empty!3433 (array_inv!1805 (_keys!5069 thiss!1248)) (array_inv!1806 (_values!3252 thiss!1248)) e!105231))))

(declare-fun b!161061 () Bool)

(declare-datatypes ((Unit!4972 0))(
  ( (Unit!4973) )
))
(declare-fun e!105226 () Unit!4972)

(declare-fun Unit!4974 () Unit!4972)

(assert (=> b!161061 (= e!105226 Unit!4974)))

(declare-fun lt!81981 () Unit!4972)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!72 (array!5925 array!5927 (_ BitVec 32) (_ BitVec 32) V!4225 V!4225 (_ BitVec 64) Int) Unit!4972)

(assert (=> b!161061 (= lt!81981 (lemmaInListMapThenSeekEntryOrOpenFindsIt!72 (_keys!5069 thiss!1248) (_values!3252 thiss!1248) (mask!7854 thiss!1248) (extraKeys!3010 thiss!1248) (zeroValue!3112 thiss!1248) (minValue!3112 thiss!1248) key!828 (defaultEntry!3269 thiss!1248)))))

(assert (=> b!161061 false))

(declare-fun res!76354 () Bool)

(declare-fun e!105232 () Bool)

(assert (=> start!16174 (=> (not res!76354) (not e!105232))))

(declare-fun valid!761 (LongMapFixedSize!1654) Bool)

(assert (=> start!16174 (= res!76354 (valid!761 thiss!1248))))

(assert (=> start!16174 e!105232))

(assert (=> start!16174 e!105230))

(assert (=> start!16174 true))

(declare-fun b!161062 () Bool)

(declare-fun e!105229 () Bool)

(assert (=> b!161062 (= e!105229 tp_is_empty!3433)))

(declare-fun b!161063 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!72 (array!5925 array!5927 (_ BitVec 32) (_ BitVec 32) V!4225 V!4225 (_ BitVec 64) Int) Unit!4972)

(assert (=> b!161063 (= e!105226 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!72 (_keys!5069 thiss!1248) (_values!3252 thiss!1248) (mask!7854 thiss!1248) (extraKeys!3010 thiss!1248) (zeroValue!3112 thiss!1248) (minValue!3112 thiss!1248) key!828 (defaultEntry!3269 thiss!1248)))))

(declare-fun b!161064 () Bool)

(assert (=> b!161064 (= e!105232 false)))

(declare-fun lt!81980 () Unit!4972)

(assert (=> b!161064 (= lt!81980 e!105226)))

(declare-fun c!29909 () Bool)

(declare-datatypes ((tuple2!2922 0))(
  ( (tuple2!2923 (_1!1472 (_ BitVec 64)) (_2!1472 V!4225)) )
))
(declare-datatypes ((List!1974 0))(
  ( (Nil!1971) (Cons!1970 (h!2583 tuple2!2922) (t!6767 List!1974)) )
))
(declare-datatypes ((ListLongMap!1909 0))(
  ( (ListLongMap!1910 (toList!970 List!1974)) )
))
(declare-fun contains!1009 (ListLongMap!1909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!620 (array!5925 array!5927 (_ BitVec 32) (_ BitVec 32) V!4225 V!4225 (_ BitVec 32) Int) ListLongMap!1909)

(assert (=> b!161064 (= c!29909 (contains!1009 (getCurrentListMap!620 (_keys!5069 thiss!1248) (_values!3252 thiss!1248) (mask!7854 thiss!1248) (extraKeys!3010 thiss!1248) (zeroValue!3112 thiss!1248) (minValue!3112 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3269 thiss!1248)) key!828))))

(declare-fun b!161065 () Bool)

(declare-fun res!76355 () Bool)

(assert (=> b!161065 (=> (not res!76355) (not e!105232))))

(assert (=> b!161065 (= res!76355 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5837 () Bool)

(declare-fun mapRes!5837 () Bool)

(declare-fun tp!13463 () Bool)

(assert (=> mapNonEmpty!5837 (= mapRes!5837 (and tp!13463 e!105229))))

(declare-fun mapRest!5837 () (Array (_ BitVec 32) ValueCell!1373))

(declare-fun mapValue!5837 () ValueCell!1373)

(declare-fun mapKey!5837 () (_ BitVec 32))

(assert (=> mapNonEmpty!5837 (= (arr!2807 (_values!3252 thiss!1248)) (store mapRest!5837 mapKey!5837 mapValue!5837))))

(declare-fun b!161066 () Bool)

(declare-fun res!76356 () Bool)

(assert (=> b!161066 (=> (not res!76356) (not e!105232))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!354 0))(
  ( (MissingZero!354 (index!3584 (_ BitVec 32))) (Found!354 (index!3585 (_ BitVec 32))) (Intermediate!354 (undefined!1166 Bool) (index!3586 (_ BitVec 32)) (x!17793 (_ BitVec 32))) (Undefined!354) (MissingVacant!354 (index!3587 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5925 (_ BitVec 32)) SeekEntryResult!354)

(assert (=> b!161066 (= res!76356 ((_ is Undefined!354) (seekEntryOrOpen!0 key!828 (_keys!5069 thiss!1248) (mask!7854 thiss!1248))))))

(declare-fun b!161067 () Bool)

(declare-fun e!105228 () Bool)

(assert (=> b!161067 (= e!105228 tp_is_empty!3433)))

(declare-fun mapIsEmpty!5837 () Bool)

(assert (=> mapIsEmpty!5837 mapRes!5837))

(declare-fun b!161068 () Bool)

(assert (=> b!161068 (= e!105231 (and e!105228 mapRes!5837))))

(declare-fun condMapEmpty!5837 () Bool)

(declare-fun mapDefault!5837 () ValueCell!1373)

(assert (=> b!161068 (= condMapEmpty!5837 (= (arr!2807 (_values!3252 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1373)) mapDefault!5837)))))

(assert (= (and start!16174 res!76354) b!161065))

(assert (= (and b!161065 res!76355) b!161066))

(assert (= (and b!161066 res!76356) b!161064))

(assert (= (and b!161064 c!29909) b!161061))

(assert (= (and b!161064 (not c!29909)) b!161063))

(assert (= (and b!161068 condMapEmpty!5837) mapIsEmpty!5837))

(assert (= (and b!161068 (not condMapEmpty!5837)) mapNonEmpty!5837))

(assert (= (and mapNonEmpty!5837 ((_ is ValueCellFull!1373) mapValue!5837)) b!161062))

(assert (= (and b!161068 ((_ is ValueCellFull!1373) mapDefault!5837)) b!161067))

(assert (= b!161060 b!161068))

(assert (= start!16174 b!161060))

(declare-fun m!192157 () Bool)

(assert (=> b!161066 m!192157))

(declare-fun m!192159 () Bool)

(assert (=> start!16174 m!192159))

(declare-fun m!192161 () Bool)

(assert (=> b!161063 m!192161))

(declare-fun m!192163 () Bool)

(assert (=> b!161061 m!192163))

(declare-fun m!192165 () Bool)

(assert (=> b!161064 m!192165))

(assert (=> b!161064 m!192165))

(declare-fun m!192167 () Bool)

(assert (=> b!161064 m!192167))

(declare-fun m!192169 () Bool)

(assert (=> b!161060 m!192169))

(declare-fun m!192171 () Bool)

(assert (=> b!161060 m!192171))

(declare-fun m!192173 () Bool)

(assert (=> mapNonEmpty!5837 m!192173))

(check-sat (not b!161066) (not b!161060) b_and!10019 (not b!161061) (not b_next!3631) (not b!161064) (not b!161063) tp_is_empty!3433 (not mapNonEmpty!5837) (not start!16174))
(check-sat b_and!10019 (not b_next!3631))
