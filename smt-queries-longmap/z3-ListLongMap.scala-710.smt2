; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16768 () Bool)

(assert start!16768)

(declare-fun b!168699 () Bool)

(declare-fun b_free!4069 () Bool)

(declare-fun b_next!4069 () Bool)

(assert (=> b!168699 (= b_free!4069 (not b_next!4069))))

(declare-fun tp!14807 () Bool)

(declare-fun b_and!10497 () Bool)

(assert (=> b!168699 (= tp!14807 b_and!10497)))

(declare-fun b!168698 () Bool)

(declare-fun e!110924 () Bool)

(declare-fun tp_is_empty!3871 () Bool)

(assert (=> b!168698 (= e!110924 tp_is_empty!3871)))

(declare-fun e!110928 () Bool)

(declare-datatypes ((V!4809 0))(
  ( (V!4810 (val!1980 Int)) )
))
(declare-datatypes ((ValueCell!1592 0))(
  ( (ValueCellFull!1592 (v!3846 V!4809)) (EmptyCell!1592) )
))
(declare-datatypes ((array!6825 0))(
  ( (array!6826 (arr!3248 (Array (_ BitVec 32) (_ BitVec 64))) (size!3536 (_ BitVec 32))) )
))
(declare-datatypes ((array!6827 0))(
  ( (array!6828 (arr!3249 (Array (_ BitVec 32) ValueCell!1592)) (size!3537 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2092 0))(
  ( (LongMapFixedSize!2093 (defaultEntry!3488 Int) (mask!8257 (_ BitVec 32)) (extraKeys!3229 (_ BitVec 32)) (zeroValue!3331 V!4809) (minValue!3331 V!4809) (_size!1095 (_ BitVec 32)) (_keys!5313 array!6825) (_values!3471 array!6827) (_vacant!1095 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2092)

(declare-fun e!110929 () Bool)

(declare-fun array_inv!2083 (array!6825) Bool)

(declare-fun array_inv!2084 (array!6827) Bool)

(assert (=> b!168699 (= e!110928 (and tp!14807 tp_is_empty!3871 (array_inv!2083 (_keys!5313 thiss!1248)) (array_inv!2084 (_values!3471 thiss!1248)) e!110929))))

(declare-fun mapIsEmpty!6525 () Bool)

(declare-fun mapRes!6525 () Bool)

(assert (=> mapIsEmpty!6525 mapRes!6525))

(declare-fun b!168700 () Bool)

(declare-fun e!110927 () Bool)

(assert (=> b!168700 (= e!110929 (and e!110927 mapRes!6525))))

(declare-fun condMapEmpty!6525 () Bool)

(declare-fun mapDefault!6525 () ValueCell!1592)

(assert (=> b!168700 (= condMapEmpty!6525 (= (arr!3249 (_values!3471 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1592)) mapDefault!6525)))))

(declare-fun b!168702 () Bool)

(declare-fun res!80312 () Bool)

(declare-fun e!110923 () Bool)

(assert (=> b!168702 (=> (not res!80312) (not e!110923))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168702 (= res!80312 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168703 () Bool)

(declare-fun e!110922 () Bool)

(assert (=> b!168703 (= e!110923 e!110922)))

(declare-fun res!80313 () Bool)

(assert (=> b!168703 (=> (not res!80313) (not e!110922))))

(declare-datatypes ((SeekEntryResult!499 0))(
  ( (MissingZero!499 (index!4164 (_ BitVec 32))) (Found!499 (index!4165 (_ BitVec 32))) (Intermediate!499 (undefined!1311 Bool) (index!4166 (_ BitVec 32)) (x!18631 (_ BitVec 32))) (Undefined!499) (MissingVacant!499 (index!4167 (_ BitVec 32))) )
))
(declare-fun lt!84419 () SeekEntryResult!499)

(get-info :version)

(assert (=> b!168703 (= res!80313 (and (not ((_ is Undefined!499) lt!84419)) (not ((_ is MissingVacant!499) lt!84419)) (not ((_ is MissingZero!499) lt!84419)) ((_ is Found!499) lt!84419)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6825 (_ BitVec 32)) SeekEntryResult!499)

(assert (=> b!168703 (= lt!84419 (seekEntryOrOpen!0 key!828 (_keys!5313 thiss!1248) (mask!8257 thiss!1248)))))

(declare-fun b!168704 () Bool)

(assert (=> b!168704 (= e!110922 (not true))))

(declare-fun lt!84416 () Bool)

(declare-fun lt!84414 () array!6827)

(declare-fun valid!916 (LongMapFixedSize!2092) Bool)

(assert (=> b!168704 (= lt!84416 (valid!916 (LongMapFixedSize!2093 (defaultEntry!3488 thiss!1248) (mask!8257 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) (_size!1095 thiss!1248) (_keys!5313 thiss!1248) lt!84414 (_vacant!1095 thiss!1248))))))

(declare-datatypes ((tuple2!3140 0))(
  ( (tuple2!3141 (_1!1581 (_ BitVec 64)) (_2!1581 V!4809)) )
))
(declare-datatypes ((List!2151 0))(
  ( (Nil!2148) (Cons!2147 (h!2764 tuple2!3140) (t!6945 List!2151)) )
))
(declare-datatypes ((ListLongMap!2101 0))(
  ( (ListLongMap!2102 (toList!1066 List!2151)) )
))
(declare-fun lt!84412 () ListLongMap!2101)

(declare-fun contains!1118 (ListLongMap!2101 (_ BitVec 64)) Bool)

(assert (=> b!168704 (contains!1118 lt!84412 (select (arr!3248 (_keys!5313 thiss!1248)) (index!4165 lt!84419)))))

(declare-datatypes ((Unit!5204 0))(
  ( (Unit!5205) )
))
(declare-fun lt!84415 () Unit!5204)

(declare-fun lemmaValidKeyInArrayIsInListMap!132 (array!6825 array!6827 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 32) Int) Unit!5204)

(assert (=> b!168704 (= lt!84415 (lemmaValidKeyInArrayIsInListMap!132 (_keys!5313 thiss!1248) lt!84414 (mask!8257 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) (index!4165 lt!84419) (defaultEntry!3488 thiss!1248)))))

(declare-fun lt!84411 () ListLongMap!2101)

(assert (=> b!168704 (= lt!84411 lt!84412)))

(declare-fun getCurrentListMap!728 (array!6825 array!6827 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 32) Int) ListLongMap!2101)

(assert (=> b!168704 (= lt!84412 (getCurrentListMap!728 (_keys!5313 thiss!1248) lt!84414 (mask!8257 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3488 thiss!1248)))))

(declare-fun lt!84420 () ListLongMap!2101)

(declare-fun v!309 () V!4809)

(declare-fun +!234 (ListLongMap!2101 tuple2!3140) ListLongMap!2101)

(assert (=> b!168704 (= lt!84411 (+!234 lt!84420 (tuple2!3141 key!828 v!309)))))

(assert (=> b!168704 (= lt!84414 (array!6828 (store (arr!3249 (_values!3471 thiss!1248)) (index!4165 lt!84419) (ValueCellFull!1592 v!309)) (size!3537 (_values!3471 thiss!1248))))))

(declare-fun lt!84417 () Unit!5204)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!92 (array!6825 array!6827 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 32) (_ BitVec 64) V!4809 Int) Unit!5204)

(assert (=> b!168704 (= lt!84417 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!92 (_keys!5313 thiss!1248) (_values!3471 thiss!1248) (mask!8257 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) (index!4165 lt!84419) key!828 v!309 (defaultEntry!3488 thiss!1248)))))

(declare-fun lt!84410 () Unit!5204)

(declare-fun e!110930 () Unit!5204)

(assert (=> b!168704 (= lt!84410 e!110930)))

(declare-fun c!30398 () Bool)

(assert (=> b!168704 (= c!30398 (contains!1118 lt!84420 key!828))))

(assert (=> b!168704 (= lt!84420 (getCurrentListMap!728 (_keys!5313 thiss!1248) (_values!3471 thiss!1248) (mask!8257 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3488 thiss!1248)))))

(declare-fun b!168705 () Bool)

(assert (=> b!168705 (= e!110927 tp_is_empty!3871)))

(declare-fun mapNonEmpty!6525 () Bool)

(declare-fun tp!14808 () Bool)

(assert (=> mapNonEmpty!6525 (= mapRes!6525 (and tp!14808 e!110924))))

(declare-fun mapKey!6525 () (_ BitVec 32))

(declare-fun mapValue!6525 () ValueCell!1592)

(declare-fun mapRest!6525 () (Array (_ BitVec 32) ValueCell!1592))

(assert (=> mapNonEmpty!6525 (= (arr!3249 (_values!3471 thiss!1248)) (store mapRest!6525 mapKey!6525 mapValue!6525))))

(declare-fun b!168706 () Bool)

(declare-fun Unit!5206 () Unit!5204)

(assert (=> b!168706 (= e!110930 Unit!5206)))

(declare-fun lt!84413 () Unit!5204)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!120 (array!6825 array!6827 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 64) Int) Unit!5204)

(assert (=> b!168706 (= lt!84413 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!120 (_keys!5313 thiss!1248) (_values!3471 thiss!1248) (mask!8257 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) key!828 (defaultEntry!3488 thiss!1248)))))

(assert (=> b!168706 false))

(declare-fun b!168707 () Bool)

(declare-fun lt!84418 () Unit!5204)

(assert (=> b!168707 (= e!110930 lt!84418)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!128 (array!6825 array!6827 (_ BitVec 32) (_ BitVec 32) V!4809 V!4809 (_ BitVec 64) Int) Unit!5204)

(assert (=> b!168707 (= lt!84418 (lemmaInListMapThenSeekEntryOrOpenFindsIt!128 (_keys!5313 thiss!1248) (_values!3471 thiss!1248) (mask!8257 thiss!1248) (extraKeys!3229 thiss!1248) (zeroValue!3331 thiss!1248) (minValue!3331 thiss!1248) key!828 (defaultEntry!3488 thiss!1248)))))

(declare-fun res!80310 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168707 (= res!80310 (inRange!0 (index!4165 lt!84419) (mask!8257 thiss!1248)))))

(declare-fun e!110925 () Bool)

(assert (=> b!168707 (=> (not res!80310) (not e!110925))))

(assert (=> b!168707 e!110925))

(declare-fun res!80311 () Bool)

(assert (=> start!16768 (=> (not res!80311) (not e!110923))))

(assert (=> start!16768 (= res!80311 (valid!916 thiss!1248))))

(assert (=> start!16768 e!110923))

(assert (=> start!16768 e!110928))

(assert (=> start!16768 true))

(assert (=> start!16768 tp_is_empty!3871))

(declare-fun b!168701 () Bool)

(assert (=> b!168701 (= e!110925 (= (select (arr!3248 (_keys!5313 thiss!1248)) (index!4165 lt!84419)) key!828))))

(assert (= (and start!16768 res!80311) b!168702))

(assert (= (and b!168702 res!80312) b!168703))

(assert (= (and b!168703 res!80313) b!168704))

(assert (= (and b!168704 c!30398) b!168707))

(assert (= (and b!168704 (not c!30398)) b!168706))

(assert (= (and b!168707 res!80310) b!168701))

(assert (= (and b!168700 condMapEmpty!6525) mapIsEmpty!6525))

(assert (= (and b!168700 (not condMapEmpty!6525)) mapNonEmpty!6525))

(assert (= (and mapNonEmpty!6525 ((_ is ValueCellFull!1592) mapValue!6525)) b!168698))

(assert (= (and b!168700 ((_ is ValueCellFull!1592) mapDefault!6525)) b!168705))

(assert (= b!168699 b!168700))

(assert (= start!16768 b!168699))

(declare-fun m!197897 () Bool)

(assert (=> mapNonEmpty!6525 m!197897))

(declare-fun m!197899 () Bool)

(assert (=> start!16768 m!197899))

(declare-fun m!197901 () Bool)

(assert (=> b!168701 m!197901))

(declare-fun m!197903 () Bool)

(assert (=> b!168703 m!197903))

(declare-fun m!197905 () Bool)

(assert (=> b!168706 m!197905))

(declare-fun m!197907 () Bool)

(assert (=> b!168699 m!197907))

(declare-fun m!197909 () Bool)

(assert (=> b!168699 m!197909))

(declare-fun m!197911 () Bool)

(assert (=> b!168707 m!197911))

(declare-fun m!197913 () Bool)

(assert (=> b!168707 m!197913))

(assert (=> b!168704 m!197901))

(declare-fun m!197915 () Bool)

(assert (=> b!168704 m!197915))

(assert (=> b!168704 m!197901))

(declare-fun m!197917 () Bool)

(assert (=> b!168704 m!197917))

(declare-fun m!197919 () Bool)

(assert (=> b!168704 m!197919))

(declare-fun m!197921 () Bool)

(assert (=> b!168704 m!197921))

(declare-fun m!197923 () Bool)

(assert (=> b!168704 m!197923))

(declare-fun m!197925 () Bool)

(assert (=> b!168704 m!197925))

(declare-fun m!197927 () Bool)

(assert (=> b!168704 m!197927))

(declare-fun m!197929 () Bool)

(assert (=> b!168704 m!197929))

(declare-fun m!197931 () Bool)

(assert (=> b!168704 m!197931))

(check-sat tp_is_empty!3871 (not b!168707) (not mapNonEmpty!6525) (not b!168706) (not b!168699) (not start!16768) (not b!168704) b_and!10497 (not b!168703) (not b_next!4069))
(check-sat b_and!10497 (not b_next!4069))
