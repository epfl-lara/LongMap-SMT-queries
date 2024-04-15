; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16666 () Bool)

(assert start!16666)

(declare-fun b!166527 () Bool)

(declare-fun b_free!3967 () Bool)

(declare-fun b_next!3967 () Bool)

(assert (=> b!166527 (= b_free!3967 (not b_next!3967))))

(declare-fun tp!14502 () Bool)

(declare-fun b_and!10355 () Bool)

(assert (=> b!166527 (= tp!14502 b_and!10355)))

(declare-fun res!79133 () Bool)

(declare-fun e!109274 () Bool)

(assert (=> start!16666 (=> (not res!79133) (not e!109274))))

(declare-datatypes ((V!4673 0))(
  ( (V!4674 (val!1929 Int)) )
))
(declare-datatypes ((ValueCell!1541 0))(
  ( (ValueCellFull!1541 (v!3788 V!4673)) (EmptyCell!1541) )
))
(declare-datatypes ((array!6615 0))(
  ( (array!6616 (arr!3142 (Array (_ BitVec 32) (_ BitVec 64))) (size!3431 (_ BitVec 32))) )
))
(declare-datatypes ((array!6617 0))(
  ( (array!6618 (arr!3143 (Array (_ BitVec 32) ValueCell!1541)) (size!3432 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1990 0))(
  ( (LongMapFixedSize!1991 (defaultEntry!3437 Int) (mask!8171 (_ BitVec 32)) (extraKeys!3178 (_ BitVec 32)) (zeroValue!3280 V!4673) (minValue!3280 V!4673) (_size!1044 (_ BitVec 32)) (_keys!5261 array!6615) (_values!3420 array!6617) (_vacant!1044 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1990)

(declare-fun valid!880 (LongMapFixedSize!1990) Bool)

(assert (=> start!16666 (= res!79133 (valid!880 thiss!1248))))

(assert (=> start!16666 e!109274))

(declare-fun e!109277 () Bool)

(assert (=> start!16666 e!109277))

(assert (=> start!16666 true))

(declare-fun b!166521 () Bool)

(declare-fun e!109275 () Bool)

(declare-fun e!109278 () Bool)

(declare-fun mapRes!6372 () Bool)

(assert (=> b!166521 (= e!109275 (and e!109278 mapRes!6372))))

(declare-fun condMapEmpty!6372 () Bool)

(declare-fun mapDefault!6372 () ValueCell!1541)

(assert (=> b!166521 (= condMapEmpty!6372 (= (arr!3143 (_values!3420 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1541)) mapDefault!6372)))))

(declare-fun mapIsEmpty!6372 () Bool)

(assert (=> mapIsEmpty!6372 mapRes!6372))

(declare-fun b!166522 () Bool)

(declare-fun tp_is_empty!3769 () Bool)

(assert (=> b!166522 (= e!109278 tp_is_empty!3769)))

(declare-fun b!166523 () Bool)

(declare-fun e!109276 () Bool)

(assert (=> b!166523 (= e!109276 tp_is_empty!3769)))

(declare-fun b!166524 () Bool)

(declare-datatypes ((Unit!5046 0))(
  ( (Unit!5047) )
))
(declare-fun e!109273 () Unit!5046)

(declare-fun lt!83217 () Unit!5046)

(assert (=> b!166524 (= e!109273 lt!83217)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!89 (array!6615 array!6617 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 64) Int) Unit!5046)

(assert (=> b!166524 (= lt!83217 (lemmaInListMapThenSeekEntryOrOpenFindsIt!89 (_keys!5261 thiss!1248) (_values!3420 thiss!1248) (mask!8171 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) key!828 (defaultEntry!3437 thiss!1248)))))

(declare-fun res!79129 () Bool)

(declare-datatypes ((SeekEntryResult!470 0))(
  ( (MissingZero!470 (index!4048 (_ BitVec 32))) (Found!470 (index!4049 (_ BitVec 32))) (Intermediate!470 (undefined!1282 Bool) (index!4050 (_ BitVec 32)) (x!18465 (_ BitVec 32))) (Undefined!470) (MissingVacant!470 (index!4051 (_ BitVec 32))) )
))
(declare-fun lt!83213 () SeekEntryResult!470)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166524 (= res!79129 (inRange!0 (index!4049 lt!83213) (mask!8171 thiss!1248)))))

(declare-fun e!109271 () Bool)

(assert (=> b!166524 (=> (not res!79129) (not e!109271))))

(assert (=> b!166524 e!109271))

(declare-fun b!166525 () Bool)

(declare-fun Unit!5048 () Unit!5046)

(assert (=> b!166525 (= e!109273 Unit!5048)))

(declare-fun lt!83215 () Unit!5046)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!86 (array!6615 array!6617 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 64) Int) Unit!5046)

(assert (=> b!166525 (= lt!83215 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!86 (_keys!5261 thiss!1248) (_values!3420 thiss!1248) (mask!8171 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) key!828 (defaultEntry!3437 thiss!1248)))))

(assert (=> b!166525 false))

(declare-fun b!166526 () Bool)

(declare-fun e!109270 () Bool)

(assert (=> b!166526 (= e!109274 e!109270)))

(declare-fun res!79132 () Bool)

(assert (=> b!166526 (=> (not res!79132) (not e!109270))))

(get-info :version)

(assert (=> b!166526 (= res!79132 (and (not ((_ is Undefined!470) lt!83213)) (not ((_ is MissingVacant!470) lt!83213)) (not ((_ is MissingZero!470) lt!83213)) ((_ is Found!470) lt!83213)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6615 (_ BitVec 32)) SeekEntryResult!470)

(assert (=> b!166526 (= lt!83213 (seekEntryOrOpen!0 key!828 (_keys!5261 thiss!1248) (mask!8171 thiss!1248)))))

(declare-fun array_inv!2021 (array!6615) Bool)

(declare-fun array_inv!2022 (array!6617) Bool)

(assert (=> b!166527 (= e!109277 (and tp!14502 tp_is_empty!3769 (array_inv!2021 (_keys!5261 thiss!1248)) (array_inv!2022 (_values!3420 thiss!1248)) e!109275))))

(declare-fun b!166528 () Bool)

(assert (=> b!166528 (= e!109271 (= (select (arr!3142 (_keys!5261 thiss!1248)) (index!4049 lt!83213)) key!828))))

(declare-fun b!166529 () Bool)

(declare-fun e!109272 () Bool)

(assert (=> b!166529 (= e!109272 false)))

(declare-fun lt!83216 () Bool)

(declare-datatypes ((List!2100 0))(
  ( (Nil!2097) (Cons!2096 (h!2713 (_ BitVec 64)) (t!6893 List!2100)) )
))
(declare-fun arrayNoDuplicates!0 (array!6615 (_ BitVec 32) List!2100) Bool)

(assert (=> b!166529 (= lt!83216 (arrayNoDuplicates!0 (_keys!5261 thiss!1248) #b00000000000000000000000000000000 Nil!2097))))

(declare-fun b!166530 () Bool)

(declare-fun res!79134 () Bool)

(assert (=> b!166530 (=> (not res!79134) (not e!109272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6615 (_ BitVec 32)) Bool)

(assert (=> b!166530 (= res!79134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5261 thiss!1248) (mask!8171 thiss!1248)))))

(declare-fun b!166531 () Bool)

(declare-fun res!79131 () Bool)

(assert (=> b!166531 (=> (not res!79131) (not e!109272))))

(assert (=> b!166531 (= res!79131 (and (= (size!3432 (_values!3420 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8171 thiss!1248))) (= (size!3431 (_keys!5261 thiss!1248)) (size!3432 (_values!3420 thiss!1248))) (bvsge (mask!8171 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3178 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3178 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166532 () Bool)

(assert (=> b!166532 (= e!109270 e!109272)))

(declare-fun res!79130 () Bool)

(assert (=> b!166532 (=> (not res!79130) (not e!109272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166532 (= res!79130 (validMask!0 (mask!8171 thiss!1248)))))

(declare-fun lt!83214 () Unit!5046)

(assert (=> b!166532 (= lt!83214 e!109273)))

(declare-fun c!30206 () Bool)

(declare-datatypes ((tuple2!3098 0))(
  ( (tuple2!3099 (_1!1560 (_ BitVec 64)) (_2!1560 V!4673)) )
))
(declare-datatypes ((List!2101 0))(
  ( (Nil!2098) (Cons!2097 (h!2714 tuple2!3098) (t!6894 List!2101)) )
))
(declare-datatypes ((ListLongMap!2041 0))(
  ( (ListLongMap!2042 (toList!1036 List!2101)) )
))
(declare-fun contains!1081 (ListLongMap!2041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!678 (array!6615 array!6617 (_ BitVec 32) (_ BitVec 32) V!4673 V!4673 (_ BitVec 32) Int) ListLongMap!2041)

(assert (=> b!166532 (= c!30206 (contains!1081 (getCurrentListMap!678 (_keys!5261 thiss!1248) (_values!3420 thiss!1248) (mask!8171 thiss!1248) (extraKeys!3178 thiss!1248) (zeroValue!3280 thiss!1248) (minValue!3280 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3437 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!6372 () Bool)

(declare-fun tp!14501 () Bool)

(assert (=> mapNonEmpty!6372 (= mapRes!6372 (and tp!14501 e!109276))))

(declare-fun mapValue!6372 () ValueCell!1541)

(declare-fun mapKey!6372 () (_ BitVec 32))

(declare-fun mapRest!6372 () (Array (_ BitVec 32) ValueCell!1541))

(assert (=> mapNonEmpty!6372 (= (arr!3143 (_values!3420 thiss!1248)) (store mapRest!6372 mapKey!6372 mapValue!6372))))

(declare-fun b!166533 () Bool)

(declare-fun res!79135 () Bool)

(assert (=> b!166533 (=> (not res!79135) (not e!109274))))

(assert (=> b!166533 (= res!79135 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16666 res!79133) b!166533))

(assert (= (and b!166533 res!79135) b!166526))

(assert (= (and b!166526 res!79132) b!166532))

(assert (= (and b!166532 c!30206) b!166524))

(assert (= (and b!166532 (not c!30206)) b!166525))

(assert (= (and b!166524 res!79129) b!166528))

(assert (= (and b!166532 res!79130) b!166531))

(assert (= (and b!166531 res!79131) b!166530))

(assert (= (and b!166530 res!79134) b!166529))

(assert (= (and b!166521 condMapEmpty!6372) mapIsEmpty!6372))

(assert (= (and b!166521 (not condMapEmpty!6372)) mapNonEmpty!6372))

(assert (= (and mapNonEmpty!6372 ((_ is ValueCellFull!1541) mapValue!6372)) b!166523))

(assert (= (and b!166521 ((_ is ValueCellFull!1541) mapDefault!6372)) b!166522))

(assert (= b!166527 b!166521))

(assert (= start!16666 b!166527))

(declare-fun m!195427 () Bool)

(assert (=> b!166532 m!195427))

(declare-fun m!195429 () Bool)

(assert (=> b!166532 m!195429))

(assert (=> b!166532 m!195429))

(declare-fun m!195431 () Bool)

(assert (=> b!166532 m!195431))

(declare-fun m!195433 () Bool)

(assert (=> start!16666 m!195433))

(declare-fun m!195435 () Bool)

(assert (=> b!166525 m!195435))

(declare-fun m!195437 () Bool)

(assert (=> mapNonEmpty!6372 m!195437))

(declare-fun m!195439 () Bool)

(assert (=> b!166524 m!195439))

(declare-fun m!195441 () Bool)

(assert (=> b!166524 m!195441))

(declare-fun m!195443 () Bool)

(assert (=> b!166526 m!195443))

(declare-fun m!195445 () Bool)

(assert (=> b!166527 m!195445))

(declare-fun m!195447 () Bool)

(assert (=> b!166527 m!195447))

(declare-fun m!195449 () Bool)

(assert (=> b!166528 m!195449))

(declare-fun m!195451 () Bool)

(assert (=> b!166530 m!195451))

(declare-fun m!195453 () Bool)

(assert (=> b!166529 m!195453))

(check-sat (not b!166526) (not b!166525) (not b!166524) b_and!10355 (not start!16666) (not b!166529) (not b!166532) tp_is_empty!3769 (not b!166530) (not mapNonEmpty!6372) (not b!166527) (not b_next!3967))
(check-sat b_and!10355 (not b_next!3967))
