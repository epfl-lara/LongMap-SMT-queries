; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16720 () Bool)

(assert start!16720)

(declare-fun b!167775 () Bool)

(declare-fun b_free!4021 () Bool)

(declare-fun b_next!4021 () Bool)

(assert (=> b!167775 (= b_free!4021 (not b_next!4021))))

(declare-fun tp!14663 () Bool)

(declare-fun b_and!10449 () Bool)

(assert (=> b!167775 (= tp!14663 b_and!10449)))

(declare-datatypes ((SeekEntryResult!479 0))(
  ( (MissingZero!479 (index!4084 (_ BitVec 32))) (Found!479 (index!4085 (_ BitVec 32))) (Intermediate!479 (undefined!1291 Bool) (index!4086 (_ BitVec 32)) (x!18547 (_ BitVec 32))) (Undefined!479) (MissingVacant!479 (index!4087 (_ BitVec 32))) )
))
(declare-fun lt!83904 () SeekEntryResult!479)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!110209 () Bool)

(declare-fun b!167768 () Bool)

(declare-datatypes ((V!4745 0))(
  ( (V!4746 (val!1956 Int)) )
))
(declare-datatypes ((ValueCell!1568 0))(
  ( (ValueCellFull!1568 (v!3822 V!4745)) (EmptyCell!1568) )
))
(declare-datatypes ((array!6729 0))(
  ( (array!6730 (arr!3200 (Array (_ BitVec 32) (_ BitVec 64))) (size!3488 (_ BitVec 32))) )
))
(declare-datatypes ((array!6731 0))(
  ( (array!6732 (arr!3201 (Array (_ BitVec 32) ValueCell!1568)) (size!3489 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2044 0))(
  ( (LongMapFixedSize!2045 (defaultEntry!3464 Int) (mask!8217 (_ BitVec 32)) (extraKeys!3205 (_ BitVec 32)) (zeroValue!3307 V!4745) (minValue!3307 V!4745) (_size!1071 (_ BitVec 32)) (_keys!5289 array!6729) (_values!3447 array!6731) (_vacant!1071 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2044)

(assert (=> b!167768 (= e!110209 (= (select (arr!3200 (_keys!5289 thiss!1248)) (index!4085 lt!83904)) key!828))))

(declare-fun b!167769 () Bool)

(declare-fun e!110205 () Bool)

(declare-fun e!110206 () Bool)

(assert (=> b!167769 (= e!110205 (not e!110206))))

(declare-fun res!79816 () Bool)

(assert (=> b!167769 (=> res!79816 e!110206)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167769 (= res!79816 (not (validMask!0 (mask!8217 thiss!1248))))))

(declare-datatypes ((tuple2!3108 0))(
  ( (tuple2!3109 (_1!1565 (_ BitVec 64)) (_2!1565 V!4745)) )
))
(declare-datatypes ((List!2123 0))(
  ( (Nil!2120) (Cons!2119 (h!2736 tuple2!3108) (t!6917 List!2123)) )
))
(declare-datatypes ((ListLongMap!2069 0))(
  ( (ListLongMap!2070 (toList!1050 List!2123)) )
))
(declare-fun lt!83903 () ListLongMap!2069)

(declare-fun v!309 () V!4745)

(declare-fun +!218 (ListLongMap!2069 tuple2!3108) ListLongMap!2069)

(declare-fun getCurrentListMap!712 (array!6729 array!6731 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 32) Int) ListLongMap!2069)

(assert (=> b!167769 (= (+!218 lt!83903 (tuple2!3109 key!828 v!309)) (getCurrentListMap!712 (_keys!5289 thiss!1248) (array!6732 (store (arr!3201 (_values!3447 thiss!1248)) (index!4085 lt!83904) (ValueCellFull!1568 v!309)) (size!3489 (_values!3447 thiss!1248))) (mask!8217 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3464 thiss!1248)))))

(declare-datatypes ((Unit!5154 0))(
  ( (Unit!5155) )
))
(declare-fun lt!83902 () Unit!5154)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!76 (array!6729 array!6731 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 32) (_ BitVec 64) V!4745 Int) Unit!5154)

(assert (=> b!167769 (= lt!83902 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!76 (_keys!5289 thiss!1248) (_values!3447 thiss!1248) (mask!8217 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) (index!4085 lt!83904) key!828 v!309 (defaultEntry!3464 thiss!1248)))))

(declare-fun lt!83899 () Unit!5154)

(declare-fun e!110213 () Unit!5154)

(assert (=> b!167769 (= lt!83899 e!110213)))

(declare-fun c!30326 () Bool)

(declare-fun contains!1102 (ListLongMap!2069 (_ BitVec 64)) Bool)

(assert (=> b!167769 (= c!30326 (contains!1102 lt!83903 key!828))))

(assert (=> b!167769 (= lt!83903 (getCurrentListMap!712 (_keys!5289 thiss!1248) (_values!3447 thiss!1248) (mask!8217 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3464 thiss!1248)))))

(declare-fun b!167770 () Bool)

(declare-fun res!79817 () Bool)

(declare-fun e!110211 () Bool)

(assert (=> b!167770 (=> (not res!79817) (not e!110211))))

(assert (=> b!167770 (= res!79817 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167771 () Bool)

(declare-fun res!79818 () Bool)

(assert (=> b!167771 (=> res!79818 e!110206)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6729 (_ BitVec 32)) Bool)

(assert (=> b!167771 (= res!79818 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5289 thiss!1248) (mask!8217 thiss!1248))))))

(declare-fun b!167772 () Bool)

(declare-fun res!79813 () Bool)

(assert (=> b!167772 (=> res!79813 e!110206)))

(assert (=> b!167772 (= res!79813 (or (not (= (size!3489 (_values!3447 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8217 thiss!1248)))) (not (= (size!3488 (_keys!5289 thiss!1248)) (size!3489 (_values!3447 thiss!1248)))) (bvslt (mask!8217 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3205 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3205 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6453 () Bool)

(declare-fun mapRes!6453 () Bool)

(declare-fun tp!14664 () Bool)

(declare-fun e!110208 () Bool)

(assert (=> mapNonEmpty!6453 (= mapRes!6453 (and tp!14664 e!110208))))

(declare-fun mapValue!6453 () ValueCell!1568)

(declare-fun mapRest!6453 () (Array (_ BitVec 32) ValueCell!1568))

(declare-fun mapKey!6453 () (_ BitVec 32))

(assert (=> mapNonEmpty!6453 (= (arr!3201 (_values!3447 thiss!1248)) (store mapRest!6453 mapKey!6453 mapValue!6453))))

(declare-fun b!167773 () Bool)

(declare-fun tp_is_empty!3823 () Bool)

(assert (=> b!167773 (= e!110208 tp_is_empty!3823)))

(declare-fun b!167774 () Bool)

(declare-fun lt!83898 () Unit!5154)

(assert (=> b!167774 (= e!110213 lt!83898)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!115 (array!6729 array!6731 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 64) Int) Unit!5154)

(assert (=> b!167774 (= lt!83898 (lemmaInListMapThenSeekEntryOrOpenFindsIt!115 (_keys!5289 thiss!1248) (_values!3447 thiss!1248) (mask!8217 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) key!828 (defaultEntry!3464 thiss!1248)))))

(declare-fun res!79812 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167774 (= res!79812 (inRange!0 (index!4085 lt!83904) (mask!8217 thiss!1248)))))

(assert (=> b!167774 (=> (not res!79812) (not e!110209))))

(assert (=> b!167774 e!110209))

(declare-fun e!110207 () Bool)

(declare-fun e!110204 () Bool)

(declare-fun array_inv!2047 (array!6729) Bool)

(declare-fun array_inv!2048 (array!6731) Bool)

(assert (=> b!167775 (= e!110204 (and tp!14663 tp_is_empty!3823 (array_inv!2047 (_keys!5289 thiss!1248)) (array_inv!2048 (_values!3447 thiss!1248)) e!110207))))

(declare-fun res!79815 () Bool)

(assert (=> start!16720 (=> (not res!79815) (not e!110211))))

(declare-fun valid!901 (LongMapFixedSize!2044) Bool)

(assert (=> start!16720 (= res!79815 (valid!901 thiss!1248))))

(assert (=> start!16720 e!110211))

(assert (=> start!16720 e!110204))

(assert (=> start!16720 true))

(assert (=> start!16720 tp_is_empty!3823))

(declare-fun b!167776 () Bool)

(declare-fun e!110212 () Bool)

(assert (=> b!167776 (= e!110207 (and e!110212 mapRes!6453))))

(declare-fun condMapEmpty!6453 () Bool)

(declare-fun mapDefault!6453 () ValueCell!1568)

(assert (=> b!167776 (= condMapEmpty!6453 (= (arr!3201 (_values!3447 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1568)) mapDefault!6453)))))

(declare-fun b!167777 () Bool)

(assert (=> b!167777 (= e!110211 e!110205)))

(declare-fun res!79814 () Bool)

(assert (=> b!167777 (=> (not res!79814) (not e!110205))))

(get-info :version)

(assert (=> b!167777 (= res!79814 (and (not ((_ is Undefined!479) lt!83904)) (not ((_ is MissingVacant!479) lt!83904)) (not ((_ is MissingZero!479) lt!83904)) ((_ is Found!479) lt!83904)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6729 (_ BitVec 32)) SeekEntryResult!479)

(assert (=> b!167777 (= lt!83904 (seekEntryOrOpen!0 key!828 (_keys!5289 thiss!1248) (mask!8217 thiss!1248)))))

(declare-fun mapIsEmpty!6453 () Bool)

(assert (=> mapIsEmpty!6453 mapRes!6453))

(declare-fun b!167778 () Bool)

(assert (=> b!167778 (= e!110206 true)))

(declare-fun lt!83900 () Bool)

(declare-datatypes ((List!2124 0))(
  ( (Nil!2121) (Cons!2120 (h!2737 (_ BitVec 64)) (t!6918 List!2124)) )
))
(declare-fun arrayNoDuplicates!0 (array!6729 (_ BitVec 32) List!2124) Bool)

(assert (=> b!167778 (= lt!83900 (arrayNoDuplicates!0 (_keys!5289 thiss!1248) #b00000000000000000000000000000000 Nil!2121))))

(declare-fun b!167779 () Bool)

(assert (=> b!167779 (= e!110212 tp_is_empty!3823)))

(declare-fun b!167780 () Bool)

(declare-fun Unit!5156 () Unit!5154)

(assert (=> b!167780 (= e!110213 Unit!5156)))

(declare-fun lt!83901 () Unit!5154)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!106 (array!6729 array!6731 (_ BitVec 32) (_ BitVec 32) V!4745 V!4745 (_ BitVec 64) Int) Unit!5154)

(assert (=> b!167780 (= lt!83901 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!106 (_keys!5289 thiss!1248) (_values!3447 thiss!1248) (mask!8217 thiss!1248) (extraKeys!3205 thiss!1248) (zeroValue!3307 thiss!1248) (minValue!3307 thiss!1248) key!828 (defaultEntry!3464 thiss!1248)))))

(assert (=> b!167780 false))

(assert (= (and start!16720 res!79815) b!167770))

(assert (= (and b!167770 res!79817) b!167777))

(assert (= (and b!167777 res!79814) b!167769))

(assert (= (and b!167769 c!30326) b!167774))

(assert (= (and b!167769 (not c!30326)) b!167780))

(assert (= (and b!167774 res!79812) b!167768))

(assert (= (and b!167769 (not res!79816)) b!167772))

(assert (= (and b!167772 (not res!79813)) b!167771))

(assert (= (and b!167771 (not res!79818)) b!167778))

(assert (= (and b!167776 condMapEmpty!6453) mapIsEmpty!6453))

(assert (= (and b!167776 (not condMapEmpty!6453)) mapNonEmpty!6453))

(assert (= (and mapNonEmpty!6453 ((_ is ValueCellFull!1568) mapValue!6453)) b!167773))

(assert (= (and b!167776 ((_ is ValueCellFull!1568) mapDefault!6453)) b!167779))

(assert (= b!167775 b!167776))

(assert (= start!16720 b!167775))

(declare-fun m!197033 () Bool)

(assert (=> b!167768 m!197033))

(declare-fun m!197035 () Bool)

(assert (=> b!167778 m!197035))

(declare-fun m!197037 () Bool)

(assert (=> b!167774 m!197037))

(declare-fun m!197039 () Bool)

(assert (=> b!167774 m!197039))

(declare-fun m!197041 () Bool)

(assert (=> b!167769 m!197041))

(declare-fun m!197043 () Bool)

(assert (=> b!167769 m!197043))

(declare-fun m!197045 () Bool)

(assert (=> b!167769 m!197045))

(declare-fun m!197047 () Bool)

(assert (=> b!167769 m!197047))

(declare-fun m!197049 () Bool)

(assert (=> b!167769 m!197049))

(declare-fun m!197051 () Bool)

(assert (=> b!167769 m!197051))

(declare-fun m!197053 () Bool)

(assert (=> b!167769 m!197053))

(declare-fun m!197055 () Bool)

(assert (=> mapNonEmpty!6453 m!197055))

(declare-fun m!197057 () Bool)

(assert (=> start!16720 m!197057))

(declare-fun m!197059 () Bool)

(assert (=> b!167771 m!197059))

(declare-fun m!197061 () Bool)

(assert (=> b!167780 m!197061))

(declare-fun m!197063 () Bool)

(assert (=> b!167777 m!197063))

(declare-fun m!197065 () Bool)

(assert (=> b!167775 m!197065))

(declare-fun m!197067 () Bool)

(assert (=> b!167775 m!197067))

(check-sat (not b_next!4021) tp_is_empty!3823 (not mapNonEmpty!6453) (not b!167775) (not b!167771) (not b!167778) (not b!167769) (not start!16720) (not b!167777) b_and!10449 (not b!167780) (not b!167774))
(check-sat b_and!10449 (not b_next!4021))
