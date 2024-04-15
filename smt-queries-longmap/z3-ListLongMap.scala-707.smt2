; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16750 () Bool)

(assert start!16750)

(declare-fun b!168171 () Bool)

(declare-fun b_free!4051 () Bool)

(declare-fun b_next!4051 () Bool)

(assert (=> b!168171 (= b_free!4051 (not b_next!4051))))

(declare-fun tp!14753 () Bool)

(declare-fun b_and!10439 () Bool)

(assert (=> b!168171 (= tp!14753 b_and!10439)))

(declare-fun b!168159 () Bool)

(declare-fun e!110529 () Bool)

(assert (=> b!168159 (= e!110529 true)))

(declare-fun lt!83973 () Bool)

(declare-datatypes ((V!4785 0))(
  ( (V!4786 (val!1971 Int)) )
))
(declare-datatypes ((ValueCell!1583 0))(
  ( (ValueCellFull!1583 (v!3830 V!4785)) (EmptyCell!1583) )
))
(declare-datatypes ((array!6783 0))(
  ( (array!6784 (arr!3226 (Array (_ BitVec 32) (_ BitVec 64))) (size!3515 (_ BitVec 32))) )
))
(declare-datatypes ((array!6785 0))(
  ( (array!6786 (arr!3227 (Array (_ BitVec 32) ValueCell!1583)) (size!3516 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2074 0))(
  ( (LongMapFixedSize!2075 (defaultEntry!3479 Int) (mask!8241 (_ BitVec 32)) (extraKeys!3220 (_ BitVec 32)) (zeroValue!3322 V!4785) (minValue!3322 V!4785) (_size!1086 (_ BitVec 32)) (_keys!5303 array!6783) (_values!3462 array!6785) (_vacant!1086 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2074)

(declare-datatypes ((List!2165 0))(
  ( (Nil!2162) (Cons!2161 (h!2778 (_ BitVec 64)) (t!6958 List!2165)) )
))
(declare-fun arrayNoDuplicates!0 (array!6783 (_ BitVec 32) List!2165) Bool)

(assert (=> b!168159 (= lt!83973 (arrayNoDuplicates!0 (_keys!5303 thiss!1248) #b00000000000000000000000000000000 Nil!2162))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!110533 () Bool)

(declare-fun b!168160 () Bool)

(declare-datatypes ((SeekEntryResult!509 0))(
  ( (MissingZero!509 (index!4204 (_ BitVec 32))) (Found!509 (index!4205 (_ BitVec 32))) (Intermediate!509 (undefined!1321 Bool) (index!4206 (_ BitVec 32)) (x!18616 (_ BitVec 32))) (Undefined!509) (MissingVacant!509 (index!4207 (_ BitVec 32))) )
))
(declare-fun lt!83978 () SeekEntryResult!509)

(assert (=> b!168160 (= e!110533 (= (select (arr!3226 (_keys!5303 thiss!1248)) (index!4205 lt!83978)) key!828))))

(declare-fun b!168161 () Bool)

(declare-fun e!110531 () Bool)

(declare-fun e!110538 () Bool)

(declare-fun mapRes!6498 () Bool)

(assert (=> b!168161 (= e!110531 (and e!110538 mapRes!6498))))

(declare-fun condMapEmpty!6498 () Bool)

(declare-fun mapDefault!6498 () ValueCell!1583)

(assert (=> b!168161 (= condMapEmpty!6498 (= (arr!3227 (_values!3462 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1583)) mapDefault!6498)))))

(declare-fun b!168162 () Bool)

(declare-fun e!110537 () Bool)

(assert (=> b!168162 (= e!110537 (not e!110529))))

(declare-fun res!80011 () Bool)

(assert (=> b!168162 (=> res!80011 e!110529)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168162 (= res!80011 (not (validMask!0 (mask!8241 thiss!1248))))))

(declare-datatypes ((tuple2!3162 0))(
  ( (tuple2!3163 (_1!1592 (_ BitVec 64)) (_2!1592 V!4785)) )
))
(declare-datatypes ((List!2166 0))(
  ( (Nil!2163) (Cons!2162 (h!2779 tuple2!3162) (t!6959 List!2166)) )
))
(declare-datatypes ((ListLongMap!2105 0))(
  ( (ListLongMap!2106 (toList!1068 List!2166)) )
))
(declare-fun lt!83979 () ListLongMap!2105)

(declare-fun v!309 () V!4785)

(declare-fun +!219 (ListLongMap!2105 tuple2!3162) ListLongMap!2105)

(declare-fun getCurrentListMap!710 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 32) Int) ListLongMap!2105)

(assert (=> b!168162 (= (+!219 lt!83979 (tuple2!3163 key!828 v!309)) (getCurrentListMap!710 (_keys!5303 thiss!1248) (array!6786 (store (arr!3227 (_values!3462 thiss!1248)) (index!4205 lt!83978) (ValueCellFull!1583 v!309)) (size!3516 (_values!3462 thiss!1248))) (mask!8241 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3479 thiss!1248)))))

(declare-datatypes ((Unit!5152 0))(
  ( (Unit!5153) )
))
(declare-fun lt!83977 () Unit!5152)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!91 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 32) (_ BitVec 64) V!4785 Int) Unit!5152)

(assert (=> b!168162 (= lt!83977 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!91 (_keys!5303 thiss!1248) (_values!3462 thiss!1248) (mask!8241 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) (index!4205 lt!83978) key!828 v!309 (defaultEntry!3479 thiss!1248)))))

(declare-fun lt!83974 () Unit!5152)

(declare-fun e!110535 () Unit!5152)

(assert (=> b!168162 (= lt!83974 e!110535)))

(declare-fun c!30332 () Bool)

(declare-fun contains!1113 (ListLongMap!2105 (_ BitVec 64)) Bool)

(assert (=> b!168162 (= c!30332 (contains!1113 lt!83979 key!828))))

(assert (=> b!168162 (= lt!83979 (getCurrentListMap!710 (_keys!5303 thiss!1248) (_values!3462 thiss!1248) (mask!8241 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3479 thiss!1248)))))

(declare-fun b!168163 () Bool)

(declare-fun e!110530 () Bool)

(declare-fun tp_is_empty!3853 () Bool)

(assert (=> b!168163 (= e!110530 tp_is_empty!3853)))

(declare-fun mapIsEmpty!6498 () Bool)

(assert (=> mapIsEmpty!6498 mapRes!6498))

(declare-fun res!80016 () Bool)

(declare-fun e!110534 () Bool)

(assert (=> start!16750 (=> (not res!80016) (not e!110534))))

(declare-fun valid!913 (LongMapFixedSize!2074) Bool)

(assert (=> start!16750 (= res!80016 (valid!913 thiss!1248))))

(assert (=> start!16750 e!110534))

(declare-fun e!110536 () Bool)

(assert (=> start!16750 e!110536))

(assert (=> start!16750 true))

(assert (=> start!16750 tp_is_empty!3853))

(declare-fun b!168164 () Bool)

(declare-fun res!80014 () Bool)

(assert (=> b!168164 (=> res!80014 e!110529)))

(assert (=> b!168164 (= res!80014 (or (not (= (size!3516 (_values!3462 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8241 thiss!1248)))) (not (= (size!3515 (_keys!5303 thiss!1248)) (size!3516 (_values!3462 thiss!1248)))) (bvslt (mask!8241 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3220 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3220 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168165 () Bool)

(assert (=> b!168165 (= e!110534 e!110537)))

(declare-fun res!80015 () Bool)

(assert (=> b!168165 (=> (not res!80015) (not e!110537))))

(get-info :version)

(assert (=> b!168165 (= res!80015 (and (not ((_ is Undefined!509) lt!83978)) (not ((_ is MissingVacant!509) lt!83978)) (not ((_ is MissingZero!509) lt!83978)) ((_ is Found!509) lt!83978)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6783 (_ BitVec 32)) SeekEntryResult!509)

(assert (=> b!168165 (= lt!83978 (seekEntryOrOpen!0 key!828 (_keys!5303 thiss!1248) (mask!8241 thiss!1248)))))

(declare-fun b!168166 () Bool)

(declare-fun lt!83975 () Unit!5152)

(assert (=> b!168166 (= e!110535 lt!83975)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!119 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 64) Int) Unit!5152)

(assert (=> b!168166 (= lt!83975 (lemmaInListMapThenSeekEntryOrOpenFindsIt!119 (_keys!5303 thiss!1248) (_values!3462 thiss!1248) (mask!8241 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) key!828 (defaultEntry!3479 thiss!1248)))))

(declare-fun res!80012 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168166 (= res!80012 (inRange!0 (index!4205 lt!83978) (mask!8241 thiss!1248)))))

(assert (=> b!168166 (=> (not res!80012) (not e!110533))))

(assert (=> b!168166 e!110533))

(declare-fun b!168167 () Bool)

(assert (=> b!168167 (= e!110538 tp_is_empty!3853)))

(declare-fun mapNonEmpty!6498 () Bool)

(declare-fun tp!14754 () Bool)

(assert (=> mapNonEmpty!6498 (= mapRes!6498 (and tp!14754 e!110530))))

(declare-fun mapRest!6498 () (Array (_ BitVec 32) ValueCell!1583))

(declare-fun mapKey!6498 () (_ BitVec 32))

(declare-fun mapValue!6498 () ValueCell!1583)

(assert (=> mapNonEmpty!6498 (= (arr!3227 (_values!3462 thiss!1248)) (store mapRest!6498 mapKey!6498 mapValue!6498))))

(declare-fun b!168168 () Bool)

(declare-fun res!80017 () Bool)

(assert (=> b!168168 (=> (not res!80017) (not e!110534))))

(assert (=> b!168168 (= res!80017 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168169 () Bool)

(declare-fun res!80013 () Bool)

(assert (=> b!168169 (=> res!80013 e!110529)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6783 (_ BitVec 32)) Bool)

(assert (=> b!168169 (= res!80013 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5303 thiss!1248) (mask!8241 thiss!1248))))))

(declare-fun b!168170 () Bool)

(declare-fun Unit!5154 () Unit!5152)

(assert (=> b!168170 (= e!110535 Unit!5154)))

(declare-fun lt!83976 () Unit!5152)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!118 (array!6783 array!6785 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 64) Int) Unit!5152)

(assert (=> b!168170 (= lt!83976 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!118 (_keys!5303 thiss!1248) (_values!3462 thiss!1248) (mask!8241 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) key!828 (defaultEntry!3479 thiss!1248)))))

(assert (=> b!168170 false))

(declare-fun array_inv!2077 (array!6783) Bool)

(declare-fun array_inv!2078 (array!6785) Bool)

(assert (=> b!168171 (= e!110536 (and tp!14753 tp_is_empty!3853 (array_inv!2077 (_keys!5303 thiss!1248)) (array_inv!2078 (_values!3462 thiss!1248)) e!110531))))

(assert (= (and start!16750 res!80016) b!168168))

(assert (= (and b!168168 res!80017) b!168165))

(assert (= (and b!168165 res!80015) b!168162))

(assert (= (and b!168162 c!30332) b!168166))

(assert (= (and b!168162 (not c!30332)) b!168170))

(assert (= (and b!168166 res!80012) b!168160))

(assert (= (and b!168162 (not res!80011)) b!168164))

(assert (= (and b!168164 (not res!80014)) b!168169))

(assert (= (and b!168169 (not res!80013)) b!168159))

(assert (= (and b!168161 condMapEmpty!6498) mapIsEmpty!6498))

(assert (= (and b!168161 (not condMapEmpty!6498)) mapNonEmpty!6498))

(assert (= (and mapNonEmpty!6498 ((_ is ValueCellFull!1583) mapValue!6498)) b!168163))

(assert (= (and b!168161 ((_ is ValueCellFull!1583) mapDefault!6498)) b!168167))

(assert (= b!168171 b!168161))

(assert (= start!16750 b!168171))

(declare-fun m!196771 () Bool)

(assert (=> b!168171 m!196771))

(declare-fun m!196773 () Bool)

(assert (=> b!168171 m!196773))

(declare-fun m!196775 () Bool)

(assert (=> b!168170 m!196775))

(declare-fun m!196777 () Bool)

(assert (=> b!168160 m!196777))

(declare-fun m!196779 () Bool)

(assert (=> b!168159 m!196779))

(declare-fun m!196781 () Bool)

(assert (=> b!168166 m!196781))

(declare-fun m!196783 () Bool)

(assert (=> b!168166 m!196783))

(declare-fun m!196785 () Bool)

(assert (=> start!16750 m!196785))

(declare-fun m!196787 () Bool)

(assert (=> mapNonEmpty!6498 m!196787))

(declare-fun m!196789 () Bool)

(assert (=> b!168162 m!196789))

(declare-fun m!196791 () Bool)

(assert (=> b!168162 m!196791))

(declare-fun m!196793 () Bool)

(assert (=> b!168162 m!196793))

(declare-fun m!196795 () Bool)

(assert (=> b!168162 m!196795))

(declare-fun m!196797 () Bool)

(assert (=> b!168162 m!196797))

(declare-fun m!196799 () Bool)

(assert (=> b!168162 m!196799))

(declare-fun m!196801 () Bool)

(assert (=> b!168162 m!196801))

(declare-fun m!196803 () Bool)

(assert (=> b!168169 m!196803))

(declare-fun m!196805 () Bool)

(assert (=> b!168165 m!196805))

(check-sat tp_is_empty!3853 (not mapNonEmpty!6498) (not b!168171) (not b_next!4051) (not b!168170) (not b!168166) (not b!168169) (not b!168162) b_and!10439 (not b!168165) (not b!168159) (not start!16750))
(check-sat b_and!10439 (not b_next!4051))
