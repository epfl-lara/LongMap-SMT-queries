; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16730 () Bool)

(assert start!16730)

(declare-fun b!167996 () Bool)

(declare-fun b_free!4035 () Bool)

(declare-fun b_next!4035 () Bool)

(assert (=> b!167996 (= b_free!4035 (not b_next!4035))))

(declare-fun tp!14706 () Bool)

(declare-fun b_and!10449 () Bool)

(assert (=> b!167996 (= tp!14706 b_and!10449)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!110393 () Bool)

(declare-datatypes ((V!4763 0))(
  ( (V!4764 (val!1963 Int)) )
))
(declare-datatypes ((ValueCell!1575 0))(
  ( (ValueCellFull!1575 (v!3828 V!4763)) (EmptyCell!1575) )
))
(declare-datatypes ((array!6771 0))(
  ( (array!6772 (arr!3221 (Array (_ BitVec 32) (_ BitVec 64))) (size!3509 (_ BitVec 32))) )
))
(declare-datatypes ((array!6773 0))(
  ( (array!6774 (arr!3222 (Array (_ BitVec 32) ValueCell!1575)) (size!3510 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2058 0))(
  ( (LongMapFixedSize!2059 (defaultEntry!3471 Int) (mask!8228 (_ BitVec 32)) (extraKeys!3212 (_ BitVec 32)) (zeroValue!3314 V!4763) (minValue!3314 V!4763) (_size!1078 (_ BitVec 32)) (_keys!5296 array!6771) (_values!3454 array!6773) (_vacant!1078 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2058)

(declare-datatypes ((SeekEntryResult!491 0))(
  ( (MissingZero!491 (index!4132 (_ BitVec 32))) (Found!491 (index!4133 (_ BitVec 32))) (Intermediate!491 (undefined!1303 Bool) (index!4134 (_ BitVec 32)) (x!18575 (_ BitVec 32))) (Undefined!491) (MissingVacant!491 (index!4135 (_ BitVec 32))) )
))
(declare-fun lt!83987 () SeekEntryResult!491)

(declare-fun b!167994 () Bool)

(assert (=> b!167994 (= e!110393 (= (select (arr!3221 (_keys!5296 thiss!1248)) (index!4133 lt!83987)) key!828))))

(declare-fun e!110391 () Bool)

(declare-fun tp_is_empty!3837 () Bool)

(declare-fun e!110394 () Bool)

(declare-fun array_inv!2071 (array!6771) Bool)

(declare-fun array_inv!2072 (array!6773) Bool)

(assert (=> b!167996 (= e!110391 (and tp!14706 tp_is_empty!3837 (array_inv!2071 (_keys!5296 thiss!1248)) (array_inv!2072 (_values!3454 thiss!1248)) e!110394))))

(declare-fun b!167997 () Bool)

(declare-fun e!110392 () Bool)

(assert (=> b!167997 (= e!110392 true)))

(declare-fun lt!83991 () Bool)

(declare-datatypes ((List!2145 0))(
  ( (Nil!2142) (Cons!2141 (h!2758 (_ BitVec 64)) (t!6947 List!2145)) )
))
(declare-fun arrayNoDuplicates!0 (array!6771 (_ BitVec 32) List!2145) Bool)

(assert (=> b!167997 (= lt!83991 (arrayNoDuplicates!0 (_keys!5296 thiss!1248) #b00000000000000000000000000000000 Nil!2142))))

(declare-fun b!167998 () Bool)

(declare-fun e!110399 () Bool)

(assert (=> b!167998 (= e!110399 tp_is_empty!3837)))

(declare-fun b!167999 () Bool)

(declare-fun res!79941 () Bool)

(assert (=> b!167999 (=> res!79941 e!110392)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6771 (_ BitVec 32)) Bool)

(assert (=> b!167999 (= res!79941 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5296 thiss!1248) (mask!8228 thiss!1248))))))

(declare-fun b!168000 () Bool)

(declare-fun e!110396 () Bool)

(declare-fun e!110395 () Bool)

(assert (=> b!168000 (= e!110396 e!110395)))

(declare-fun res!79944 () Bool)

(assert (=> b!168000 (=> (not res!79944) (not e!110395))))

(get-info :version)

(assert (=> b!168000 (= res!79944 (and (not ((_ is Undefined!491) lt!83987)) (not ((_ is MissingVacant!491) lt!83987)) (not ((_ is MissingZero!491) lt!83987)) ((_ is Found!491) lt!83987)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6771 (_ BitVec 32)) SeekEntryResult!491)

(assert (=> b!168000 (= lt!83987 (seekEntryOrOpen!0 key!828 (_keys!5296 thiss!1248) (mask!8228 thiss!1248)))))

(declare-fun b!168001 () Bool)

(declare-fun mapRes!6474 () Bool)

(assert (=> b!168001 (= e!110394 (and e!110399 mapRes!6474))))

(declare-fun condMapEmpty!6474 () Bool)

(declare-fun mapDefault!6474 () ValueCell!1575)

(assert (=> b!168001 (= condMapEmpty!6474 (= (arr!3222 (_values!3454 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1575)) mapDefault!6474)))))

(declare-fun b!168002 () Bool)

(declare-fun e!110390 () Bool)

(assert (=> b!168002 (= e!110390 tp_is_empty!3837)))

(declare-fun b!168003 () Bool)

(declare-fun res!79942 () Bool)

(assert (=> b!168003 (=> res!79942 e!110392)))

(assert (=> b!168003 (= res!79942 (or (not (= (size!3510 (_values!3454 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8228 thiss!1248)))) (not (= (size!3509 (_keys!5296 thiss!1248)) (size!3510 (_values!3454 thiss!1248)))) (bvslt (mask!8228 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3212 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3212 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168004 () Bool)

(declare-fun res!79939 () Bool)

(assert (=> b!168004 (=> (not res!79939) (not e!110396))))

(assert (=> b!168004 (= res!79939 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6474 () Bool)

(assert (=> mapIsEmpty!6474 mapRes!6474))

(declare-fun b!168005 () Bool)

(declare-datatypes ((Unit!5157 0))(
  ( (Unit!5158) )
))
(declare-fun e!110398 () Unit!5157)

(declare-fun Unit!5159 () Unit!5157)

(assert (=> b!168005 (= e!110398 Unit!5159)))

(declare-fun lt!83989 () Unit!5157)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!116 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4763 V!4763 (_ BitVec 64) Int) Unit!5157)

(assert (=> b!168005 (= lt!83989 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!116 (_keys!5296 thiss!1248) (_values!3454 thiss!1248) (mask!8228 thiss!1248) (extraKeys!3212 thiss!1248) (zeroValue!3314 thiss!1248) (minValue!3314 thiss!1248) key!828 (defaultEntry!3471 thiss!1248)))))

(assert (=> b!168005 false))

(declare-fun res!79938 () Bool)

(assert (=> start!16730 (=> (not res!79938) (not e!110396))))

(declare-fun valid!894 (LongMapFixedSize!2058) Bool)

(assert (=> start!16730 (= res!79938 (valid!894 thiss!1248))))

(assert (=> start!16730 e!110396))

(assert (=> start!16730 e!110391))

(assert (=> start!16730 true))

(assert (=> start!16730 tp_is_empty!3837))

(declare-fun b!167995 () Bool)

(assert (=> b!167995 (= e!110395 (not e!110392))))

(declare-fun res!79940 () Bool)

(assert (=> b!167995 (=> res!79940 e!110392)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167995 (= res!79940 (not (validMask!0 (mask!8228 thiss!1248))))))

(declare-datatypes ((tuple2!3156 0))(
  ( (tuple2!3157 (_1!1589 (_ BitVec 64)) (_2!1589 V!4763)) )
))
(declare-datatypes ((List!2146 0))(
  ( (Nil!2143) (Cons!2142 (h!2759 tuple2!3156) (t!6948 List!2146)) )
))
(declare-datatypes ((ListLongMap!2111 0))(
  ( (ListLongMap!2112 (toList!1071 List!2146)) )
))
(declare-fun lt!83992 () ListLongMap!2111)

(declare-fun v!309 () V!4763)

(declare-fun +!223 (ListLongMap!2111 tuple2!3156) ListLongMap!2111)

(declare-fun getCurrentListMap!729 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4763 V!4763 (_ BitVec 32) Int) ListLongMap!2111)

(assert (=> b!167995 (= (+!223 lt!83992 (tuple2!3157 key!828 v!309)) (getCurrentListMap!729 (_keys!5296 thiss!1248) (array!6774 (store (arr!3222 (_values!3454 thiss!1248)) (index!4133 lt!83987) (ValueCellFull!1575 v!309)) (size!3510 (_values!3454 thiss!1248))) (mask!8228 thiss!1248) (extraKeys!3212 thiss!1248) (zeroValue!3314 thiss!1248) (minValue!3314 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3471 thiss!1248)))))

(declare-fun lt!83990 () Unit!5157)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!78 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4763 V!4763 (_ BitVec 32) (_ BitVec 64) V!4763 Int) Unit!5157)

(assert (=> b!167995 (= lt!83990 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!78 (_keys!5296 thiss!1248) (_values!3454 thiss!1248) (mask!8228 thiss!1248) (extraKeys!3212 thiss!1248) (zeroValue!3314 thiss!1248) (minValue!3314 thiss!1248) (index!4133 lt!83987) key!828 v!309 (defaultEntry!3471 thiss!1248)))))

(declare-fun lt!83986 () Unit!5157)

(assert (=> b!167995 (= lt!83986 e!110398)))

(declare-fun c!30334 () Bool)

(declare-fun contains!1113 (ListLongMap!2111 (_ BitVec 64)) Bool)

(assert (=> b!167995 (= c!30334 (contains!1113 lt!83992 key!828))))

(assert (=> b!167995 (= lt!83992 (getCurrentListMap!729 (_keys!5296 thiss!1248) (_values!3454 thiss!1248) (mask!8228 thiss!1248) (extraKeys!3212 thiss!1248) (zeroValue!3314 thiss!1248) (minValue!3314 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3471 thiss!1248)))))

(declare-fun b!168006 () Bool)

(declare-fun lt!83988 () Unit!5157)

(assert (=> b!168006 (= e!110398 lt!83988)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!115 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4763 V!4763 (_ BitVec 64) Int) Unit!5157)

(assert (=> b!168006 (= lt!83988 (lemmaInListMapThenSeekEntryOrOpenFindsIt!115 (_keys!5296 thiss!1248) (_values!3454 thiss!1248) (mask!8228 thiss!1248) (extraKeys!3212 thiss!1248) (zeroValue!3314 thiss!1248) (minValue!3314 thiss!1248) key!828 (defaultEntry!3471 thiss!1248)))))

(declare-fun res!79943 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168006 (= res!79943 (inRange!0 (index!4133 lt!83987) (mask!8228 thiss!1248)))))

(assert (=> b!168006 (=> (not res!79943) (not e!110393))))

(assert (=> b!168006 e!110393))

(declare-fun mapNonEmpty!6474 () Bool)

(declare-fun tp!14705 () Bool)

(assert (=> mapNonEmpty!6474 (= mapRes!6474 (and tp!14705 e!110390))))

(declare-fun mapRest!6474 () (Array (_ BitVec 32) ValueCell!1575))

(declare-fun mapValue!6474 () ValueCell!1575)

(declare-fun mapKey!6474 () (_ BitVec 32))

(assert (=> mapNonEmpty!6474 (= (arr!3222 (_values!3454 thiss!1248)) (store mapRest!6474 mapKey!6474 mapValue!6474))))

(assert (= (and start!16730 res!79938) b!168004))

(assert (= (and b!168004 res!79939) b!168000))

(assert (= (and b!168000 res!79944) b!167995))

(assert (= (and b!167995 c!30334) b!168006))

(assert (= (and b!167995 (not c!30334)) b!168005))

(assert (= (and b!168006 res!79943) b!167994))

(assert (= (and b!167995 (not res!79940)) b!168003))

(assert (= (and b!168003 (not res!79942)) b!167999))

(assert (= (and b!167999 (not res!79941)) b!167997))

(assert (= (and b!168001 condMapEmpty!6474) mapIsEmpty!6474))

(assert (= (and b!168001 (not condMapEmpty!6474)) mapNonEmpty!6474))

(assert (= (and mapNonEmpty!6474 ((_ is ValueCellFull!1575) mapValue!6474)) b!168002))

(assert (= (and b!168001 ((_ is ValueCellFull!1575) mapDefault!6474)) b!167998))

(assert (= b!167996 b!168001))

(assert (= start!16730 b!167996))

(declare-fun m!197103 () Bool)

(assert (=> b!167995 m!197103))

(declare-fun m!197105 () Bool)

(assert (=> b!167995 m!197105))

(declare-fun m!197107 () Bool)

(assert (=> b!167995 m!197107))

(declare-fun m!197109 () Bool)

(assert (=> b!167995 m!197109))

(declare-fun m!197111 () Bool)

(assert (=> b!167995 m!197111))

(declare-fun m!197113 () Bool)

(assert (=> b!167995 m!197113))

(declare-fun m!197115 () Bool)

(assert (=> b!167995 m!197115))

(declare-fun m!197117 () Bool)

(assert (=> b!168006 m!197117))

(declare-fun m!197119 () Bool)

(assert (=> b!168006 m!197119))

(declare-fun m!197121 () Bool)

(assert (=> b!167994 m!197121))

(declare-fun m!197123 () Bool)

(assert (=> b!168000 m!197123))

(declare-fun m!197125 () Bool)

(assert (=> mapNonEmpty!6474 m!197125))

(declare-fun m!197127 () Bool)

(assert (=> b!167999 m!197127))

(declare-fun m!197129 () Bool)

(assert (=> b!167997 m!197129))

(declare-fun m!197131 () Bool)

(assert (=> b!168005 m!197131))

(declare-fun m!197133 () Bool)

(assert (=> b!167996 m!197133))

(declare-fun m!197135 () Bool)

(assert (=> b!167996 m!197135))

(declare-fun m!197137 () Bool)

(assert (=> start!16730 m!197137))

(check-sat (not b!167999) (not b!167997) b_and!10449 tp_is_empty!3837 (not b!167995) (not start!16730) (not b!168000) (not b_next!4035) (not b!167996) (not b!168006) (not mapNonEmpty!6474) (not b!168005))
(check-sat b_and!10449 (not b_next!4035))
