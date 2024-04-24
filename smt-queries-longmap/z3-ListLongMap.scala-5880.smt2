; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75978 () Bool)

(assert start!75978)

(declare-fun b!892704 () Bool)

(declare-fun b_free!15781 () Bool)

(declare-fun b_next!15781 () Bool)

(assert (=> b!892704 (= b_free!15781 (not b_next!15781))))

(declare-fun tp!55312 () Bool)

(declare-fun b_and!26031 () Bool)

(assert (=> b!892704 (= tp!55312 b_and!26031)))

(declare-fun b!892702 () Bool)

(declare-fun e!498286 () Bool)

(declare-datatypes ((SeekEntryResult!8790 0))(
  ( (MissingZero!8790 (index!37531 (_ BitVec 32))) (Found!8790 (index!37532 (_ BitVec 32))) (Intermediate!8790 (undefined!9602 Bool) (index!37533 (_ BitVec 32)) (x!75756 (_ BitVec 32))) (Undefined!8790) (MissingVacant!8790 (index!37534 (_ BitVec 32))) )
))
(declare-fun lt!403233 () SeekEntryResult!8790)

(declare-datatypes ((array!52237 0))(
  ( (array!52238 (arr!25120 (Array (_ BitVec 32) (_ BitVec 64))) (size!25565 (_ BitVec 32))) )
))
(declare-datatypes ((V!29111 0))(
  ( (V!29112 (val!9105 Int)) )
))
(declare-datatypes ((ValueCell!8573 0))(
  ( (ValueCellFull!8573 (v!11580 V!29111)) (EmptyCell!8573) )
))
(declare-datatypes ((array!52239 0))(
  ( (array!52240 (arr!25121 (Array (_ BitVec 32) ValueCell!8573)) (size!25566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4162 0))(
  ( (LongMapFixedSize!4163 (defaultEntry!5278 Int) (mask!25822 (_ BitVec 32)) (extraKeys!4972 (_ BitVec 32)) (zeroValue!5076 V!29111) (minValue!5076 V!29111) (_size!2136 (_ BitVec 32)) (_keys!9989 array!52237) (_values!5263 array!52239) (_vacant!2136 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4162)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892702 (= e!498286 (inRange!0 (index!37532 lt!403233) (mask!25822 thiss!1181)))))

(declare-fun res!604551 () Bool)

(declare-fun e!498288 () Bool)

(assert (=> start!75978 (=> (not res!604551) (not e!498288))))

(declare-fun valid!1623 (LongMapFixedSize!4162) Bool)

(assert (=> start!75978 (= res!604551 (valid!1623 thiss!1181))))

(assert (=> start!75978 e!498288))

(declare-fun e!498287 () Bool)

(assert (=> start!75978 e!498287))

(assert (=> start!75978 true))

(declare-fun mapIsEmpty!28718 () Bool)

(declare-fun mapRes!28718 () Bool)

(assert (=> mapIsEmpty!28718 mapRes!28718))

(declare-fun b!892703 () Bool)

(declare-fun e!498289 () Bool)

(assert (=> b!892703 (= e!498288 (not e!498289))))

(declare-fun res!604548 () Bool)

(assert (=> b!892703 (=> res!604548 e!498289)))

(get-info :version)

(assert (=> b!892703 (= res!604548 (not ((_ is Found!8790) lt!403233)))))

(assert (=> b!892703 e!498286))

(declare-fun res!604553 () Bool)

(assert (=> b!892703 (=> res!604553 e!498286)))

(assert (=> b!892703 (= res!604553 (not ((_ is Found!8790) lt!403233)))))

(declare-datatypes ((Unit!30350 0))(
  ( (Unit!30351) )
))
(declare-fun lt!403234 () Unit!30350)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!42 (array!52237 array!52239 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 64)) Unit!30350)

(assert (=> b!892703 (= lt!403234 (lemmaSeekEntryGivesInRangeIndex!42 (_keys!9989 thiss!1181) (_values!5263 thiss!1181) (mask!25822 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52237 (_ BitVec 32)) SeekEntryResult!8790)

(assert (=> b!892703 (= lt!403233 (seekEntry!0 key!785 (_keys!9989 thiss!1181) (mask!25822 thiss!1181)))))

(declare-fun e!498284 () Bool)

(declare-fun tp_is_empty!18109 () Bool)

(declare-fun array_inv!19786 (array!52237) Bool)

(declare-fun array_inv!19787 (array!52239) Bool)

(assert (=> b!892704 (= e!498287 (and tp!55312 tp_is_empty!18109 (array_inv!19786 (_keys!9989 thiss!1181)) (array_inv!19787 (_values!5263 thiss!1181)) e!498284))))

(declare-fun b!892705 () Bool)

(declare-fun res!604554 () Bool)

(declare-fun e!498290 () Bool)

(assert (=> b!892705 (=> res!604554 e!498290)))

(assert (=> b!892705 (= res!604554 (or (not (= (size!25566 (_values!5263 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25822 thiss!1181)))) (not (= (size!25565 (_keys!9989 thiss!1181)) (size!25566 (_values!5263 thiss!1181)))) (bvslt (mask!25822 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4972 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4972 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28718 () Bool)

(declare-fun tp!55313 () Bool)

(declare-fun e!498291 () Bool)

(assert (=> mapNonEmpty!28718 (= mapRes!28718 (and tp!55313 e!498291))))

(declare-fun mapValue!28718 () ValueCell!8573)

(declare-fun mapRest!28718 () (Array (_ BitVec 32) ValueCell!8573))

(declare-fun mapKey!28718 () (_ BitVec 32))

(assert (=> mapNonEmpty!28718 (= (arr!25121 (_values!5263 thiss!1181)) (store mapRest!28718 mapKey!28718 mapValue!28718))))

(declare-fun b!892706 () Bool)

(declare-fun e!498285 () Bool)

(assert (=> b!892706 (= e!498285 tp_is_empty!18109)))

(declare-fun b!892707 () Bool)

(declare-fun res!604555 () Bool)

(assert (=> b!892707 (=> (not res!604555) (not e!498288))))

(assert (=> b!892707 (= res!604555 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892708 () Bool)

(assert (=> b!892708 (= e!498284 (and e!498285 mapRes!28718))))

(declare-fun condMapEmpty!28718 () Bool)

(declare-fun mapDefault!28718 () ValueCell!8573)

(assert (=> b!892708 (= condMapEmpty!28718 (= (arr!25121 (_values!5263 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8573)) mapDefault!28718)))))

(declare-fun b!892709 () Bool)

(declare-fun res!604550 () Bool)

(assert (=> b!892709 (=> res!604550 e!498290)))

(declare-datatypes ((List!17714 0))(
  ( (Nil!17711) (Cons!17710 (h!18847 (_ BitVec 64)) (t!25005 List!17714)) )
))
(declare-fun arrayNoDuplicates!0 (array!52237 (_ BitVec 32) List!17714) Bool)

(assert (=> b!892709 (= res!604550 (not (arrayNoDuplicates!0 (_keys!9989 thiss!1181) #b00000000000000000000000000000000 Nil!17711)))))

(declare-fun b!892710 () Bool)

(assert (=> b!892710 (= e!498291 tp_is_empty!18109)))

(declare-fun b!892711 () Bool)

(declare-fun res!604549 () Bool)

(assert (=> b!892711 (=> res!604549 e!498290)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52237 (_ BitVec 32)) Bool)

(assert (=> b!892711 (= res!604549 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9989 thiss!1181) (mask!25822 thiss!1181))))))

(declare-fun b!892712 () Bool)

(assert (=> b!892712 (= e!498289 e!498290)))

(declare-fun res!604552 () Bool)

(assert (=> b!892712 (=> res!604552 e!498290)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892712 (= res!604552 (not (validMask!0 (mask!25822 thiss!1181))))))

(declare-datatypes ((tuple2!11888 0))(
  ( (tuple2!11889 (_1!5955 (_ BitVec 64)) (_2!5955 V!29111)) )
))
(declare-datatypes ((List!17715 0))(
  ( (Nil!17712) (Cons!17711 (h!18848 tuple2!11888) (t!25006 List!17715)) )
))
(declare-datatypes ((ListLongMap!10587 0))(
  ( (ListLongMap!10588 (toList!5309 List!17715)) )
))
(declare-fun lt!403231 () ListLongMap!10587)

(declare-fun contains!4322 (ListLongMap!10587 (_ BitVec 64)) Bool)

(assert (=> b!892712 (contains!4322 lt!403231 (select (arr!25120 (_keys!9989 thiss!1181)) (index!37532 lt!403233)))))

(declare-fun getCurrentListMap!2587 (array!52237 array!52239 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 32) Int) ListLongMap!10587)

(assert (=> b!892712 (= lt!403231 (getCurrentListMap!2587 (_keys!9989 thiss!1181) (_values!5263 thiss!1181) (mask!25822 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5278 thiss!1181)))))

(declare-fun lt!403230 () Unit!30350)

(declare-fun lemmaValidKeyInArrayIsInListMap!217 (array!52237 array!52239 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 32) Int) Unit!30350)

(assert (=> b!892712 (= lt!403230 (lemmaValidKeyInArrayIsInListMap!217 (_keys!9989 thiss!1181) (_values!5263 thiss!1181) (mask!25822 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) (index!37532 lt!403233) (defaultEntry!5278 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892712 (arrayContainsKey!0 (_keys!9989 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403235 () Unit!30350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52237 (_ BitVec 64) (_ BitVec 32)) Unit!30350)

(assert (=> b!892712 (= lt!403235 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9989 thiss!1181) key!785 (index!37532 lt!403233)))))

(declare-fun b!892713 () Bool)

(assert (=> b!892713 (= e!498290 true)))

(declare-fun lt!403232 () Bool)

(assert (=> b!892713 (= lt!403232 (contains!4322 lt!403231 key!785))))

(assert (= (and start!75978 res!604551) b!892707))

(assert (= (and b!892707 res!604555) b!892703))

(assert (= (and b!892703 (not res!604553)) b!892702))

(assert (= (and b!892703 (not res!604548)) b!892712))

(assert (= (and b!892712 (not res!604552)) b!892705))

(assert (= (and b!892705 (not res!604554)) b!892711))

(assert (= (and b!892711 (not res!604549)) b!892709))

(assert (= (and b!892709 (not res!604550)) b!892713))

(assert (= (and b!892708 condMapEmpty!28718) mapIsEmpty!28718))

(assert (= (and b!892708 (not condMapEmpty!28718)) mapNonEmpty!28718))

(assert (= (and mapNonEmpty!28718 ((_ is ValueCellFull!8573) mapValue!28718)) b!892710))

(assert (= (and b!892708 ((_ is ValueCellFull!8573) mapDefault!28718)) b!892706))

(assert (= b!892704 b!892708))

(assert (= start!75978 b!892704))

(declare-fun m!831385 () Bool)

(assert (=> b!892713 m!831385))

(declare-fun m!831387 () Bool)

(assert (=> b!892702 m!831387))

(declare-fun m!831389 () Bool)

(assert (=> b!892711 m!831389))

(declare-fun m!831391 () Bool)

(assert (=> b!892703 m!831391))

(declare-fun m!831393 () Bool)

(assert (=> b!892703 m!831393))

(declare-fun m!831395 () Bool)

(assert (=> b!892709 m!831395))

(declare-fun m!831397 () Bool)

(assert (=> b!892704 m!831397))

(declare-fun m!831399 () Bool)

(assert (=> b!892704 m!831399))

(declare-fun m!831401 () Bool)

(assert (=> start!75978 m!831401))

(declare-fun m!831403 () Bool)

(assert (=> b!892712 m!831403))

(declare-fun m!831405 () Bool)

(assert (=> b!892712 m!831405))

(declare-fun m!831407 () Bool)

(assert (=> b!892712 m!831407))

(assert (=> b!892712 m!831405))

(declare-fun m!831409 () Bool)

(assert (=> b!892712 m!831409))

(declare-fun m!831411 () Bool)

(assert (=> b!892712 m!831411))

(declare-fun m!831413 () Bool)

(assert (=> b!892712 m!831413))

(declare-fun m!831415 () Bool)

(assert (=> b!892712 m!831415))

(declare-fun m!831417 () Bool)

(assert (=> mapNonEmpty!28718 m!831417))

(check-sat b_and!26031 (not b!892712) (not b!892703) (not b_next!15781) (not b!892709) (not start!75978) (not b!892711) (not b!892702) (not b!892704) (not mapNonEmpty!28718) (not b!892713) tp_is_empty!18109)
(check-sat b_and!26031 (not b_next!15781))
