; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16652 () Bool)

(assert start!16652)

(declare-fun b!166475 () Bool)

(declare-fun b_free!3957 () Bool)

(declare-fun b_next!3957 () Bool)

(assert (=> b!166475 (= b_free!3957 (not b_next!3957))))

(declare-fun tp!14471 () Bool)

(declare-fun b_and!10371 () Bool)

(assert (=> b!166475 (= tp!14471 b_and!10371)))

(declare-fun b!166473 () Bool)

(declare-fun e!109221 () Bool)

(declare-fun tp_is_empty!3759 () Bool)

(assert (=> b!166473 (= e!109221 tp_is_empty!3759)))

(declare-fun b!166474 () Bool)

(declare-datatypes ((Unit!5063 0))(
  ( (Unit!5064) )
))
(declare-fun e!109220 () Unit!5063)

(declare-fun Unit!5065 () Unit!5063)

(assert (=> b!166474 (= e!109220 Unit!5065)))

(declare-fun lt!83321 () Unit!5063)

(declare-datatypes ((V!4659 0))(
  ( (V!4660 (val!1924 Int)) )
))
(declare-datatypes ((ValueCell!1536 0))(
  ( (ValueCellFull!1536 (v!3789 V!4659)) (EmptyCell!1536) )
))
(declare-datatypes ((array!6615 0))(
  ( (array!6616 (arr!3143 (Array (_ BitVec 32) (_ BitVec 64))) (size!3431 (_ BitVec 32))) )
))
(declare-datatypes ((array!6617 0))(
  ( (array!6618 (arr!3144 (Array (_ BitVec 32) ValueCell!1536)) (size!3432 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1980 0))(
  ( (LongMapFixedSize!1981 (defaultEntry!3432 Int) (mask!8163 (_ BitVec 32)) (extraKeys!3173 (_ BitVec 32)) (zeroValue!3275 V!4659) (minValue!3275 V!4659) (_size!1039 (_ BitVec 32)) (_keys!5257 array!6615) (_values!3415 array!6617) (_vacant!1039 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1980)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!88 (array!6615 array!6617 (_ BitVec 32) (_ BitVec 32) V!4659 V!4659 (_ BitVec 64) Int) Unit!5063)

(assert (=> b!166474 (= lt!83321 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!88 (_keys!5257 thiss!1248) (_values!3415 thiss!1248) (mask!8163 thiss!1248) (extraKeys!3173 thiss!1248) (zeroValue!3275 thiss!1248) (minValue!3275 thiss!1248) key!828 (defaultEntry!3432 thiss!1248)))))

(assert (=> b!166474 false))

(declare-fun e!109229 () Bool)

(declare-fun e!109227 () Bool)

(declare-fun array_inv!2017 (array!6615) Bool)

(declare-fun array_inv!2018 (array!6617) Bool)

(assert (=> b!166475 (= e!109229 (and tp!14471 tp_is_empty!3759 (array_inv!2017 (_keys!5257 thiss!1248)) (array_inv!2018 (_values!3415 thiss!1248)) e!109227))))

(declare-fun b!166476 () Bool)

(declare-fun res!79122 () Bool)

(declare-fun e!109224 () Bool)

(assert (=> b!166476 (=> (not res!79122) (not e!109224))))

(assert (=> b!166476 (= res!79122 (and (= (size!3432 (_values!3415 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8163 thiss!1248))) (= (size!3431 (_keys!5257 thiss!1248)) (size!3432 (_values!3415 thiss!1248))) (bvsge (mask!8163 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3173 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3173 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166477 () Bool)

(declare-fun e!109228 () Bool)

(declare-fun e!109226 () Bool)

(assert (=> b!166477 (= e!109228 e!109226)))

(declare-fun res!79120 () Bool)

(assert (=> b!166477 (=> (not res!79120) (not e!109226))))

(declare-datatypes ((SeekEntryResult!457 0))(
  ( (MissingZero!457 (index!3996 (_ BitVec 32))) (Found!457 (index!3997 (_ BitVec 32))) (Intermediate!457 (undefined!1269 Bool) (index!3998 (_ BitVec 32)) (x!18437 (_ BitVec 32))) (Undefined!457) (MissingVacant!457 (index!3999 (_ BitVec 32))) )
))
(declare-fun lt!83323 () SeekEntryResult!457)

(get-info :version)

(assert (=> b!166477 (= res!79120 (and (not ((_ is Undefined!457) lt!83323)) (not ((_ is MissingVacant!457) lt!83323)) (not ((_ is MissingZero!457) lt!83323)) ((_ is Found!457) lt!83323)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6615 (_ BitVec 32)) SeekEntryResult!457)

(assert (=> b!166477 (= lt!83323 (seekEntryOrOpen!0 key!828 (_keys!5257 thiss!1248) (mask!8163 thiss!1248)))))

(declare-fun b!166478 () Bool)

(declare-fun e!109222 () Bool)

(assert (=> b!166478 (= e!109222 tp_is_empty!3759)))

(declare-fun mapIsEmpty!6357 () Bool)

(declare-fun mapRes!6357 () Bool)

(assert (=> mapIsEmpty!6357 mapRes!6357))

(declare-fun res!79125 () Bool)

(assert (=> start!16652 (=> (not res!79125) (not e!109228))))

(declare-fun valid!869 (LongMapFixedSize!1980) Bool)

(assert (=> start!16652 (= res!79125 (valid!869 thiss!1248))))

(assert (=> start!16652 e!109228))

(assert (=> start!16652 e!109229))

(assert (=> start!16652 true))

(declare-fun b!166479 () Bool)

(assert (=> b!166479 (= e!109226 e!109224)))

(declare-fun res!79119 () Bool)

(assert (=> b!166479 (=> (not res!79119) (not e!109224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166479 (= res!79119 (validMask!0 (mask!8163 thiss!1248)))))

(declare-fun lt!83320 () Unit!5063)

(assert (=> b!166479 (= lt!83320 e!109220)))

(declare-fun c!30217 () Bool)

(declare-datatypes ((tuple2!3106 0))(
  ( (tuple2!3107 (_1!1564 (_ BitVec 64)) (_2!1564 V!4659)) )
))
(declare-datatypes ((List!2093 0))(
  ( (Nil!2090) (Cons!2089 (h!2706 tuple2!3106) (t!6895 List!2093)) )
))
(declare-datatypes ((ListLongMap!2061 0))(
  ( (ListLongMap!2062 (toList!1046 List!2093)) )
))
(declare-fun contains!1088 (ListLongMap!2061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!704 (array!6615 array!6617 (_ BitVec 32) (_ BitVec 32) V!4659 V!4659 (_ BitVec 32) Int) ListLongMap!2061)

(assert (=> b!166479 (= c!30217 (contains!1088 (getCurrentListMap!704 (_keys!5257 thiss!1248) (_values!3415 thiss!1248) (mask!8163 thiss!1248) (extraKeys!3173 thiss!1248) (zeroValue!3275 thiss!1248) (minValue!3275 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3432 thiss!1248)) key!828))))

(declare-fun b!166480 () Bool)

(declare-fun e!109223 () Bool)

(assert (=> b!166480 (= e!109223 (= (select (arr!3143 (_keys!5257 thiss!1248)) (index!3997 lt!83323)) key!828))))

(declare-fun b!166481 () Bool)

(assert (=> b!166481 (= e!109227 (and e!109222 mapRes!6357))))

(declare-fun condMapEmpty!6357 () Bool)

(declare-fun mapDefault!6357 () ValueCell!1536)

(assert (=> b!166481 (= condMapEmpty!6357 (= (arr!3144 (_values!3415 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1536)) mapDefault!6357)))))

(declare-fun b!166482 () Bool)

(declare-fun res!79123 () Bool)

(assert (=> b!166482 (=> (not res!79123) (not e!109224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6615 (_ BitVec 32)) Bool)

(assert (=> b!166482 (= res!79123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5257 thiss!1248) (mask!8163 thiss!1248)))))

(declare-fun b!166483 () Bool)

(declare-fun lt!83319 () Unit!5063)

(assert (=> b!166483 (= e!109220 lt!83319)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!88 (array!6615 array!6617 (_ BitVec 32) (_ BitVec 32) V!4659 V!4659 (_ BitVec 64) Int) Unit!5063)

(assert (=> b!166483 (= lt!83319 (lemmaInListMapThenSeekEntryOrOpenFindsIt!88 (_keys!5257 thiss!1248) (_values!3415 thiss!1248) (mask!8163 thiss!1248) (extraKeys!3173 thiss!1248) (zeroValue!3275 thiss!1248) (minValue!3275 thiss!1248) key!828 (defaultEntry!3432 thiss!1248)))))

(declare-fun res!79121 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166483 (= res!79121 (inRange!0 (index!3997 lt!83323) (mask!8163 thiss!1248)))))

(assert (=> b!166483 (=> (not res!79121) (not e!109223))))

(assert (=> b!166483 e!109223))

(declare-fun b!166484 () Bool)

(declare-fun res!79124 () Bool)

(assert (=> b!166484 (=> (not res!79124) (not e!109228))))

(assert (=> b!166484 (= res!79124 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166485 () Bool)

(assert (=> b!166485 (= e!109224 false)))

(declare-fun lt!83322 () Bool)

(declare-datatypes ((List!2094 0))(
  ( (Nil!2091) (Cons!2090 (h!2707 (_ BitVec 64)) (t!6896 List!2094)) )
))
(declare-fun arrayNoDuplicates!0 (array!6615 (_ BitVec 32) List!2094) Bool)

(assert (=> b!166485 (= lt!83322 (arrayNoDuplicates!0 (_keys!5257 thiss!1248) #b00000000000000000000000000000000 Nil!2091))))

(declare-fun mapNonEmpty!6357 () Bool)

(declare-fun tp!14472 () Bool)

(assert (=> mapNonEmpty!6357 (= mapRes!6357 (and tp!14472 e!109221))))

(declare-fun mapValue!6357 () ValueCell!1536)

(declare-fun mapKey!6357 () (_ BitVec 32))

(declare-fun mapRest!6357 () (Array (_ BitVec 32) ValueCell!1536))

(assert (=> mapNonEmpty!6357 (= (arr!3144 (_values!3415 thiss!1248)) (store mapRest!6357 mapKey!6357 mapValue!6357))))

(assert (= (and start!16652 res!79125) b!166484))

(assert (= (and b!166484 res!79124) b!166477))

(assert (= (and b!166477 res!79120) b!166479))

(assert (= (and b!166479 c!30217) b!166483))

(assert (= (and b!166479 (not c!30217)) b!166474))

(assert (= (and b!166483 res!79121) b!166480))

(assert (= (and b!166479 res!79119) b!166476))

(assert (= (and b!166476 res!79122) b!166482))

(assert (= (and b!166482 res!79123) b!166485))

(assert (= (and b!166481 condMapEmpty!6357) mapIsEmpty!6357))

(assert (= (and b!166481 (not condMapEmpty!6357)) mapNonEmpty!6357))

(assert (= (and mapNonEmpty!6357 ((_ is ValueCellFull!1536) mapValue!6357)) b!166473))

(assert (= (and b!166481 ((_ is ValueCellFull!1536) mapDefault!6357)) b!166478))

(assert (= b!166475 b!166481))

(assert (= start!16652 b!166475))

(declare-fun m!195907 () Bool)

(assert (=> start!16652 m!195907))

(declare-fun m!195909 () Bool)

(assert (=> b!166482 m!195909))

(declare-fun m!195911 () Bool)

(assert (=> b!166479 m!195911))

(declare-fun m!195913 () Bool)

(assert (=> b!166479 m!195913))

(assert (=> b!166479 m!195913))

(declare-fun m!195915 () Bool)

(assert (=> b!166479 m!195915))

(declare-fun m!195917 () Bool)

(assert (=> b!166483 m!195917))

(declare-fun m!195919 () Bool)

(assert (=> b!166483 m!195919))

(declare-fun m!195921 () Bool)

(assert (=> b!166480 m!195921))

(declare-fun m!195923 () Bool)

(assert (=> b!166475 m!195923))

(declare-fun m!195925 () Bool)

(assert (=> b!166475 m!195925))

(declare-fun m!195927 () Bool)

(assert (=> b!166477 m!195927))

(declare-fun m!195929 () Bool)

(assert (=> b!166474 m!195929))

(declare-fun m!195931 () Bool)

(assert (=> mapNonEmpty!6357 m!195931))

(declare-fun m!195933 () Bool)

(assert (=> b!166485 m!195933))

(check-sat tp_is_empty!3759 (not start!16652) (not mapNonEmpty!6357) b_and!10371 (not b!166485) (not b_next!3957) (not b!166482) (not b!166477) (not b!166475) (not b!166479) (not b!166483) (not b!166474))
(check-sat b_and!10371 (not b_next!3957))
