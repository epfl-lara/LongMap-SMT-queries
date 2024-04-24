; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16774 () Bool)

(assert start!16774)

(declare-fun b!168799 () Bool)

(declare-fun b_free!4075 () Bool)

(declare-fun b_next!4075 () Bool)

(assert (=> b!168799 (= b_free!4075 (not b_next!4075))))

(declare-fun tp!14826 () Bool)

(declare-fun b_and!10503 () Bool)

(assert (=> b!168799 (= tp!14826 b_and!10503)))

(declare-fun mapIsEmpty!6534 () Bool)

(declare-fun mapRes!6534 () Bool)

(assert (=> mapIsEmpty!6534 mapRes!6534))

(declare-fun res!80349 () Bool)

(declare-fun e!111011 () Bool)

(assert (=> start!16774 (=> (not res!80349) (not e!111011))))

(declare-datatypes ((V!4817 0))(
  ( (V!4818 (val!1983 Int)) )
))
(declare-datatypes ((ValueCell!1595 0))(
  ( (ValueCellFull!1595 (v!3849 V!4817)) (EmptyCell!1595) )
))
(declare-datatypes ((array!6837 0))(
  ( (array!6838 (arr!3254 (Array (_ BitVec 32) (_ BitVec 64))) (size!3542 (_ BitVec 32))) )
))
(declare-datatypes ((array!6839 0))(
  ( (array!6840 (arr!3255 (Array (_ BitVec 32) ValueCell!1595)) (size!3543 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2098 0))(
  ( (LongMapFixedSize!2099 (defaultEntry!3491 Int) (mask!8262 (_ BitVec 32)) (extraKeys!3232 (_ BitVec 32)) (zeroValue!3334 V!4817) (minValue!3334 V!4817) (_size!1098 (_ BitVec 32)) (_keys!5316 array!6837) (_values!3474 array!6839) (_vacant!1098 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2098)

(declare-fun valid!918 (LongMapFixedSize!2098) Bool)

(assert (=> start!16774 (= res!80349 (valid!918 thiss!1248))))

(assert (=> start!16774 e!111011))

(declare-fun e!111008 () Bool)

(assert (=> start!16774 e!111008))

(assert (=> start!16774 true))

(declare-fun tp_is_empty!3877 () Bool)

(assert (=> start!16774 tp_is_empty!3877))

(declare-fun b!168790 () Bool)

(declare-datatypes ((Unit!5213 0))(
  ( (Unit!5214) )
))
(declare-fun e!111007 () Unit!5213)

(declare-fun lt!84514 () Unit!5213)

(assert (=> b!168790 (= e!111007 lt!84514)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!130 (array!6837 array!6839 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 64) Int) Unit!5213)

(assert (=> b!168790 (= lt!84514 (lemmaInListMapThenSeekEntryOrOpenFindsIt!130 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) key!828 (defaultEntry!3491 thiss!1248)))))

(declare-fun res!80352 () Bool)

(declare-datatypes ((SeekEntryResult!502 0))(
  ( (MissingZero!502 (index!4176 (_ BitVec 32))) (Found!502 (index!4177 (_ BitVec 32))) (Intermediate!502 (undefined!1314 Bool) (index!4178 (_ BitVec 32)) (x!18642 (_ BitVec 32))) (Undefined!502) (MissingVacant!502 (index!4179 (_ BitVec 32))) )
))
(declare-fun lt!84519 () SeekEntryResult!502)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168790 (= res!80352 (inRange!0 (index!4177 lt!84519) (mask!8262 thiss!1248)))))

(declare-fun e!111009 () Bool)

(assert (=> b!168790 (=> (not res!80352) (not e!111009))))

(assert (=> b!168790 e!111009))

(declare-fun b!168791 () Bool)

(declare-fun Unit!5215 () Unit!5213)

(assert (=> b!168791 (= e!111007 Unit!5215)))

(declare-fun lt!84521 () Unit!5213)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!123 (array!6837 array!6839 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 64) Int) Unit!5213)

(assert (=> b!168791 (= lt!84521 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!123 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) key!828 (defaultEntry!3491 thiss!1248)))))

(assert (=> b!168791 false))

(declare-fun b!168792 () Bool)

(declare-fun res!80351 () Bool)

(assert (=> b!168792 (=> (not res!80351) (not e!111011))))

(assert (=> b!168792 (= res!80351 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168793 () Bool)

(declare-fun e!111013 () Bool)

(declare-fun e!111010 () Bool)

(assert (=> b!168793 (= e!111013 (and e!111010 mapRes!6534))))

(declare-fun condMapEmpty!6534 () Bool)

(declare-fun mapDefault!6534 () ValueCell!1595)

(assert (=> b!168793 (= condMapEmpty!6534 (= (arr!3255 (_values!3474 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1595)) mapDefault!6534)))))

(declare-fun b!168794 () Bool)

(declare-fun e!111012 () Bool)

(declare-fun e!111006 () Bool)

(assert (=> b!168794 (= e!111012 (not e!111006))))

(declare-fun res!80350 () Bool)

(assert (=> b!168794 (=> res!80350 e!111006)))

(declare-fun lt!84522 () LongMapFixedSize!2098)

(assert (=> b!168794 (= res!80350 (not (valid!918 lt!84522)))))

(declare-datatypes ((tuple2!3144 0))(
  ( (tuple2!3145 (_1!1583 (_ BitVec 64)) (_2!1583 V!4817)) )
))
(declare-datatypes ((List!2153 0))(
  ( (Nil!2150) (Cons!2149 (h!2766 tuple2!3144) (t!6947 List!2153)) )
))
(declare-datatypes ((ListLongMap!2105 0))(
  ( (ListLongMap!2106 (toList!1068 List!2153)) )
))
(declare-fun lt!84511 () ListLongMap!2105)

(declare-fun contains!1120 (ListLongMap!2105 (_ BitVec 64)) Bool)

(assert (=> b!168794 (contains!1120 lt!84511 (select (arr!3254 (_keys!5316 thiss!1248)) (index!4177 lt!84519)))))

(declare-fun lt!84516 () Unit!5213)

(declare-fun lt!84517 () array!6839)

(declare-fun lemmaValidKeyInArrayIsInListMap!134 (array!6837 array!6839 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) Int) Unit!5213)

(assert (=> b!168794 (= lt!84516 (lemmaValidKeyInArrayIsInListMap!134 (_keys!5316 thiss!1248) lt!84517 (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (index!4177 lt!84519) (defaultEntry!3491 thiss!1248)))))

(assert (=> b!168794 (= lt!84522 (LongMapFixedSize!2099 (defaultEntry!3491 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (_size!1098 thiss!1248) (_keys!5316 thiss!1248) lt!84517 (_vacant!1098 thiss!1248)))))

(declare-fun lt!84513 () ListLongMap!2105)

(assert (=> b!168794 (= lt!84513 lt!84511)))

(declare-fun getCurrentListMap!730 (array!6837 array!6839 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) Int) ListLongMap!2105)

(assert (=> b!168794 (= lt!84511 (getCurrentListMap!730 (_keys!5316 thiss!1248) lt!84517 (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3491 thiss!1248)))))

(declare-fun v!309 () V!4817)

(declare-fun lt!84518 () ListLongMap!2105)

(declare-fun +!236 (ListLongMap!2105 tuple2!3144) ListLongMap!2105)

(assert (=> b!168794 (= lt!84513 (+!236 lt!84518 (tuple2!3145 key!828 v!309)))))

(assert (=> b!168794 (= lt!84517 (array!6840 (store (arr!3255 (_values!3474 thiss!1248)) (index!4177 lt!84519) (ValueCellFull!1595 v!309)) (size!3543 (_values!3474 thiss!1248))))))

(declare-fun lt!84520 () Unit!5213)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!94 (array!6837 array!6839 (_ BitVec 32) (_ BitVec 32) V!4817 V!4817 (_ BitVec 32) (_ BitVec 64) V!4817 Int) Unit!5213)

(assert (=> b!168794 (= lt!84520 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!94 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) (index!4177 lt!84519) key!828 v!309 (defaultEntry!3491 thiss!1248)))))

(declare-fun lt!84512 () Unit!5213)

(assert (=> b!168794 (= lt!84512 e!111007)))

(declare-fun c!30407 () Bool)

(assert (=> b!168794 (= c!30407 (contains!1120 lt!84518 key!828))))

(assert (=> b!168794 (= lt!84518 (getCurrentListMap!730 (_keys!5316 thiss!1248) (_values!3474 thiss!1248) (mask!8262 thiss!1248) (extraKeys!3232 thiss!1248) (zeroValue!3334 thiss!1248) (minValue!3334 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3491 thiss!1248)))))

(declare-fun b!168795 () Bool)

(assert (=> b!168795 (= e!111010 tp_is_empty!3877)))

(declare-fun b!168796 () Bool)

(assert (=> b!168796 (= e!111011 e!111012)))

(declare-fun res!80348 () Bool)

(assert (=> b!168796 (=> (not res!80348) (not e!111012))))

(get-info :version)

(assert (=> b!168796 (= res!80348 (and (not ((_ is Undefined!502) lt!84519)) (not ((_ is MissingVacant!502) lt!84519)) (not ((_ is MissingZero!502) lt!84519)) ((_ is Found!502) lt!84519)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6837 (_ BitVec 32)) SeekEntryResult!502)

(assert (=> b!168796 (= lt!84519 (seekEntryOrOpen!0 key!828 (_keys!5316 thiss!1248) (mask!8262 thiss!1248)))))

(declare-fun b!168797 () Bool)

(assert (=> b!168797 (= e!111006 true)))

(declare-fun lt!84515 () Bool)

(declare-fun map!1796 (LongMapFixedSize!2098) ListLongMap!2105)

(assert (=> b!168797 (= lt!84515 (contains!1120 (map!1796 lt!84522) key!828))))

(declare-fun b!168798 () Bool)

(assert (=> b!168798 (= e!111009 (= (select (arr!3254 (_keys!5316 thiss!1248)) (index!4177 lt!84519)) key!828))))

(declare-fun array_inv!2087 (array!6837) Bool)

(declare-fun array_inv!2088 (array!6839) Bool)

(assert (=> b!168799 (= e!111008 (and tp!14826 tp_is_empty!3877 (array_inv!2087 (_keys!5316 thiss!1248)) (array_inv!2088 (_values!3474 thiss!1248)) e!111013))))

(declare-fun mapNonEmpty!6534 () Bool)

(declare-fun tp!14825 () Bool)

(declare-fun e!111014 () Bool)

(assert (=> mapNonEmpty!6534 (= mapRes!6534 (and tp!14825 e!111014))))

(declare-fun mapValue!6534 () ValueCell!1595)

(declare-fun mapKey!6534 () (_ BitVec 32))

(declare-fun mapRest!6534 () (Array (_ BitVec 32) ValueCell!1595))

(assert (=> mapNonEmpty!6534 (= (arr!3255 (_values!3474 thiss!1248)) (store mapRest!6534 mapKey!6534 mapValue!6534))))

(declare-fun b!168800 () Bool)

(assert (=> b!168800 (= e!111014 tp_is_empty!3877)))

(assert (= (and start!16774 res!80349) b!168792))

(assert (= (and b!168792 res!80351) b!168796))

(assert (= (and b!168796 res!80348) b!168794))

(assert (= (and b!168794 c!30407) b!168790))

(assert (= (and b!168794 (not c!30407)) b!168791))

(assert (= (and b!168790 res!80352) b!168798))

(assert (= (and b!168794 (not res!80350)) b!168797))

(assert (= (and b!168793 condMapEmpty!6534) mapIsEmpty!6534))

(assert (= (and b!168793 (not condMapEmpty!6534)) mapNonEmpty!6534))

(assert (= (and mapNonEmpty!6534 ((_ is ValueCellFull!1595) mapValue!6534)) b!168800))

(assert (= (and b!168793 ((_ is ValueCellFull!1595) mapDefault!6534)) b!168795))

(assert (= b!168799 b!168793))

(assert (= start!16774 b!168799))

(declare-fun m!198005 () Bool)

(assert (=> mapNonEmpty!6534 m!198005))

(declare-fun m!198007 () Bool)

(assert (=> b!168790 m!198007))

(declare-fun m!198009 () Bool)

(assert (=> b!168790 m!198009))

(declare-fun m!198011 () Bool)

(assert (=> b!168796 m!198011))

(declare-fun m!198013 () Bool)

(assert (=> b!168791 m!198013))

(declare-fun m!198015 () Bool)

(assert (=> b!168797 m!198015))

(assert (=> b!168797 m!198015))

(declare-fun m!198017 () Bool)

(assert (=> b!168797 m!198017))

(declare-fun m!198019 () Bool)

(assert (=> b!168794 m!198019))

(declare-fun m!198021 () Bool)

(assert (=> b!168794 m!198021))

(declare-fun m!198023 () Bool)

(assert (=> b!168794 m!198023))

(declare-fun m!198025 () Bool)

(assert (=> b!168794 m!198025))

(declare-fun m!198027 () Bool)

(assert (=> b!168794 m!198027))

(declare-fun m!198029 () Bool)

(assert (=> b!168794 m!198029))

(declare-fun m!198031 () Bool)

(assert (=> b!168794 m!198031))

(declare-fun m!198033 () Bool)

(assert (=> b!168794 m!198033))

(assert (=> b!168794 m!198021))

(declare-fun m!198035 () Bool)

(assert (=> b!168794 m!198035))

(declare-fun m!198037 () Bool)

(assert (=> b!168794 m!198037))

(declare-fun m!198039 () Bool)

(assert (=> start!16774 m!198039))

(assert (=> b!168798 m!198021))

(declare-fun m!198041 () Bool)

(assert (=> b!168799 m!198041))

(declare-fun m!198043 () Bool)

(assert (=> b!168799 m!198043))

(check-sat (not b!168796) tp_is_empty!3877 (not b!168794) (not mapNonEmpty!6534) (not b_next!4075) (not b!168790) (not b!168797) (not start!16774) (not b!168799) (not b!168791) b_and!10503)
(check-sat b_and!10503 (not b_next!4075))
