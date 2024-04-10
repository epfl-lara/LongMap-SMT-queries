; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16676 () Bool)

(assert start!16676)

(declare-fun b!166953 () Bool)

(declare-fun b_free!3981 () Bool)

(declare-fun b_next!3981 () Bool)

(assert (=> b!166953 (= b_free!3981 (not b_next!3981))))

(declare-fun tp!14544 () Bool)

(declare-fun b_and!10395 () Bool)

(assert (=> b!166953 (= tp!14544 b_and!10395)))

(declare-fun mapIsEmpty!6393 () Bool)

(declare-fun mapRes!6393 () Bool)

(assert (=> mapIsEmpty!6393 mapRes!6393))

(declare-fun b!166941 () Bool)

(declare-datatypes ((Unit!5093 0))(
  ( (Unit!5094) )
))
(declare-fun e!109580 () Unit!5093)

(declare-fun Unit!5095 () Unit!5093)

(assert (=> b!166941 (= e!109580 Unit!5095)))

(declare-fun lt!83503 () Unit!5093)

(declare-datatypes ((V!4691 0))(
  ( (V!4692 (val!1936 Int)) )
))
(declare-datatypes ((ValueCell!1548 0))(
  ( (ValueCellFull!1548 (v!3801 V!4691)) (EmptyCell!1548) )
))
(declare-datatypes ((array!6663 0))(
  ( (array!6664 (arr!3167 (Array (_ BitVec 32) (_ BitVec 64))) (size!3455 (_ BitVec 32))) )
))
(declare-datatypes ((array!6665 0))(
  ( (array!6666 (arr!3168 (Array (_ BitVec 32) ValueCell!1548)) (size!3456 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2004 0))(
  ( (LongMapFixedSize!2005 (defaultEntry!3444 Int) (mask!8183 (_ BitVec 32)) (extraKeys!3185 (_ BitVec 32)) (zeroValue!3287 V!4691) (minValue!3287 V!4691) (_size!1051 (_ BitVec 32)) (_keys!5269 array!6663) (_values!3427 array!6665) (_vacant!1051 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2004)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!98 (array!6663 array!6665 (_ BitVec 32) (_ BitVec 32) V!4691 V!4691 (_ BitVec 64) Int) Unit!5093)

(assert (=> b!166941 (= lt!83503 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!98 (_keys!5269 thiss!1248) (_values!3427 thiss!1248) (mask!8183 thiss!1248) (extraKeys!3185 thiss!1248) (zeroValue!3287 thiss!1248) (minValue!3287 thiss!1248) key!828 (defaultEntry!3444 thiss!1248)))))

(assert (=> b!166941 false))

(declare-fun res!79374 () Bool)

(declare-fun e!109588 () Bool)

(assert (=> start!16676 (=> (not res!79374) (not e!109588))))

(declare-fun valid!878 (LongMapFixedSize!2004) Bool)

(assert (=> start!16676 (= res!79374 (valid!878 thiss!1248))))

(assert (=> start!16676 e!109588))

(declare-fun e!109589 () Bool)

(assert (=> start!16676 e!109589))

(assert (=> start!16676 true))

(declare-fun b!166942 () Bool)

(declare-fun res!79372 () Bool)

(declare-fun e!109581 () Bool)

(assert (=> b!166942 (=> (not res!79372) (not e!109581))))

(assert (=> b!166942 (= res!79372 (and (= (size!3456 (_values!3427 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8183 thiss!1248))) (= (size!3455 (_keys!5269 thiss!1248)) (size!3456 (_values!3427 thiss!1248))) (bvsge (mask!8183 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3185 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3185 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166943 () Bool)

(declare-fun e!109585 () Bool)

(assert (=> b!166943 (= e!109585 e!109581)))

(declare-fun res!79375 () Bool)

(assert (=> b!166943 (=> (not res!79375) (not e!109581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166943 (= res!79375 (validMask!0 (mask!8183 thiss!1248)))))

(declare-fun lt!83499 () Unit!5093)

(assert (=> b!166943 (= lt!83499 e!109580)))

(declare-fun c!30253 () Bool)

(declare-datatypes ((tuple2!3122 0))(
  ( (tuple2!3123 (_1!1572 (_ BitVec 64)) (_2!1572 V!4691)) )
))
(declare-datatypes ((List!2109 0))(
  ( (Nil!2106) (Cons!2105 (h!2722 tuple2!3122) (t!6911 List!2109)) )
))
(declare-datatypes ((ListLongMap!2077 0))(
  ( (ListLongMap!2078 (toList!1054 List!2109)) )
))
(declare-fun contains!1096 (ListLongMap!2077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!712 (array!6663 array!6665 (_ BitVec 32) (_ BitVec 32) V!4691 V!4691 (_ BitVec 32) Int) ListLongMap!2077)

(assert (=> b!166943 (= c!30253 (contains!1096 (getCurrentListMap!712 (_keys!5269 thiss!1248) (_values!3427 thiss!1248) (mask!8183 thiss!1248) (extraKeys!3185 thiss!1248) (zeroValue!3287 thiss!1248) (minValue!3287 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3444 thiss!1248)) key!828))))

(declare-fun b!166944 () Bool)

(assert (=> b!166944 (= e!109588 e!109585)))

(declare-fun res!79376 () Bool)

(assert (=> b!166944 (=> (not res!79376) (not e!109585))))

(declare-datatypes ((SeekEntryResult!467 0))(
  ( (MissingZero!467 (index!4036 (_ BitVec 32))) (Found!467 (index!4037 (_ BitVec 32))) (Intermediate!467 (undefined!1279 Bool) (index!4038 (_ BitVec 32)) (x!18479 (_ BitVec 32))) (Undefined!467) (MissingVacant!467 (index!4039 (_ BitVec 32))) )
))
(declare-fun lt!83500 () SeekEntryResult!467)

(get-info :version)

(assert (=> b!166944 (= res!79376 (and (not ((_ is Undefined!467) lt!83500)) (not ((_ is MissingVacant!467) lt!83500)) (not ((_ is MissingZero!467) lt!83500)) ((_ is Found!467) lt!83500)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6663 (_ BitVec 32)) SeekEntryResult!467)

(assert (=> b!166944 (= lt!83500 (seekEntryOrOpen!0 key!828 (_keys!5269 thiss!1248) (mask!8183 thiss!1248)))))

(declare-fun b!166945 () Bool)

(declare-fun e!109582 () Bool)

(declare-fun e!109587 () Bool)

(assert (=> b!166945 (= e!109582 (and e!109587 mapRes!6393))))

(declare-fun condMapEmpty!6393 () Bool)

(declare-fun mapDefault!6393 () ValueCell!1548)

(assert (=> b!166945 (= condMapEmpty!6393 (= (arr!3168 (_values!3427 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1548)) mapDefault!6393)))))

(declare-fun b!166946 () Bool)

(declare-fun tp_is_empty!3783 () Bool)

(assert (=> b!166946 (= e!109587 tp_is_empty!3783)))

(declare-fun b!166947 () Bool)

(declare-fun e!109586 () Bool)

(assert (=> b!166947 (= e!109586 tp_is_empty!3783)))

(declare-fun b!166948 () Bool)

(assert (=> b!166948 (= e!109581 false)))

(declare-fun lt!83502 () Bool)

(declare-datatypes ((List!2110 0))(
  ( (Nil!2107) (Cons!2106 (h!2723 (_ BitVec 64)) (t!6912 List!2110)) )
))
(declare-fun arrayNoDuplicates!0 (array!6663 (_ BitVec 32) List!2110) Bool)

(assert (=> b!166948 (= lt!83502 (arrayNoDuplicates!0 (_keys!5269 thiss!1248) #b00000000000000000000000000000000 Nil!2107))))

(declare-fun b!166949 () Bool)

(declare-fun res!79373 () Bool)

(assert (=> b!166949 (=> (not res!79373) (not e!109588))))

(assert (=> b!166949 (= res!79373 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6393 () Bool)

(declare-fun tp!14543 () Bool)

(assert (=> mapNonEmpty!6393 (= mapRes!6393 (and tp!14543 e!109586))))

(declare-fun mapKey!6393 () (_ BitVec 32))

(declare-fun mapRest!6393 () (Array (_ BitVec 32) ValueCell!1548))

(declare-fun mapValue!6393 () ValueCell!1548)

(assert (=> mapNonEmpty!6393 (= (arr!3168 (_values!3427 thiss!1248)) (store mapRest!6393 mapKey!6393 mapValue!6393))))

(declare-fun b!166950 () Bool)

(declare-fun res!79371 () Bool)

(assert (=> b!166950 (=> (not res!79371) (not e!109581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6663 (_ BitVec 32)) Bool)

(assert (=> b!166950 (= res!79371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5269 thiss!1248) (mask!8183 thiss!1248)))))

(declare-fun e!109584 () Bool)

(declare-fun b!166951 () Bool)

(assert (=> b!166951 (= e!109584 (= (select (arr!3167 (_keys!5269 thiss!1248)) (index!4037 lt!83500)) key!828))))

(declare-fun b!166952 () Bool)

(declare-fun lt!83501 () Unit!5093)

(assert (=> b!166952 (= e!109580 lt!83501)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!95 (array!6663 array!6665 (_ BitVec 32) (_ BitVec 32) V!4691 V!4691 (_ BitVec 64) Int) Unit!5093)

(assert (=> b!166952 (= lt!83501 (lemmaInListMapThenSeekEntryOrOpenFindsIt!95 (_keys!5269 thiss!1248) (_values!3427 thiss!1248) (mask!8183 thiss!1248) (extraKeys!3185 thiss!1248) (zeroValue!3287 thiss!1248) (minValue!3287 thiss!1248) key!828 (defaultEntry!3444 thiss!1248)))))

(declare-fun res!79377 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166952 (= res!79377 (inRange!0 (index!4037 lt!83500) (mask!8183 thiss!1248)))))

(assert (=> b!166952 (=> (not res!79377) (not e!109584))))

(assert (=> b!166952 e!109584))

(declare-fun array_inv!2033 (array!6663) Bool)

(declare-fun array_inv!2034 (array!6665) Bool)

(assert (=> b!166953 (= e!109589 (and tp!14544 tp_is_empty!3783 (array_inv!2033 (_keys!5269 thiss!1248)) (array_inv!2034 (_values!3427 thiss!1248)) e!109582))))

(assert (= (and start!16676 res!79374) b!166949))

(assert (= (and b!166949 res!79373) b!166944))

(assert (= (and b!166944 res!79376) b!166943))

(assert (= (and b!166943 c!30253) b!166952))

(assert (= (and b!166943 (not c!30253)) b!166941))

(assert (= (and b!166952 res!79377) b!166951))

(assert (= (and b!166943 res!79375) b!166942))

(assert (= (and b!166942 res!79372) b!166950))

(assert (= (and b!166950 res!79371) b!166948))

(assert (= (and b!166945 condMapEmpty!6393) mapIsEmpty!6393))

(assert (= (and b!166945 (not condMapEmpty!6393)) mapNonEmpty!6393))

(assert (= (and mapNonEmpty!6393 ((_ is ValueCellFull!1548) mapValue!6393)) b!166947))

(assert (= (and b!166945 ((_ is ValueCellFull!1548) mapDefault!6393)) b!166946))

(assert (= b!166953 b!166945))

(assert (= start!16676 b!166953))

(declare-fun m!196243 () Bool)

(assert (=> b!166951 m!196243))

(declare-fun m!196245 () Bool)

(assert (=> b!166941 m!196245))

(declare-fun m!196247 () Bool)

(assert (=> b!166953 m!196247))

(declare-fun m!196249 () Bool)

(assert (=> b!166953 m!196249))

(declare-fun m!196251 () Bool)

(assert (=> mapNonEmpty!6393 m!196251))

(declare-fun m!196253 () Bool)

(assert (=> b!166952 m!196253))

(declare-fun m!196255 () Bool)

(assert (=> b!166952 m!196255))

(declare-fun m!196257 () Bool)

(assert (=> b!166944 m!196257))

(declare-fun m!196259 () Bool)

(assert (=> start!16676 m!196259))

(declare-fun m!196261 () Bool)

(assert (=> b!166950 m!196261))

(declare-fun m!196263 () Bool)

(assert (=> b!166948 m!196263))

(declare-fun m!196265 () Bool)

(assert (=> b!166943 m!196265))

(declare-fun m!196267 () Bool)

(assert (=> b!166943 m!196267))

(assert (=> b!166943 m!196267))

(declare-fun m!196269 () Bool)

(assert (=> b!166943 m!196269))

(check-sat (not b!166948) (not b!166950) (not b!166944) (not b!166952) (not b_next!3981) (not start!16676) (not mapNonEmpty!6393) (not b!166953) b_and!10395 (not b!166941) tp_is_empty!3783 (not b!166943))
(check-sat b_and!10395 (not b_next!3981))
