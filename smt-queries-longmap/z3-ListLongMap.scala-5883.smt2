; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75996 () Bool)

(assert start!75996)

(declare-fun b!893029 () Bool)

(declare-fun b_free!15799 () Bool)

(declare-fun b_next!15799 () Bool)

(assert (=> b!893029 (= b_free!15799 (not b_next!15799))))

(declare-fun tp!55366 () Bool)

(declare-fun b_and!26049 () Bool)

(assert (=> b!893029 (= tp!55366 b_and!26049)))

(declare-fun b!893026 () Bool)

(declare-fun res!604767 () Bool)

(declare-fun e!498528 () Bool)

(assert (=> b!893026 (=> res!604767 e!498528)))

(declare-datatypes ((array!52273 0))(
  ( (array!52274 (arr!25138 (Array (_ BitVec 32) (_ BitVec 64))) (size!25583 (_ BitVec 32))) )
))
(declare-datatypes ((V!29135 0))(
  ( (V!29136 (val!9114 Int)) )
))
(declare-datatypes ((ValueCell!8582 0))(
  ( (ValueCellFull!8582 (v!11589 V!29135)) (EmptyCell!8582) )
))
(declare-datatypes ((array!52275 0))(
  ( (array!52276 (arr!25139 (Array (_ BitVec 32) ValueCell!8582)) (size!25584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4180 0))(
  ( (LongMapFixedSize!4181 (defaultEntry!5287 Int) (mask!25837 (_ BitVec 32)) (extraKeys!4981 (_ BitVec 32)) (zeroValue!5085 V!29135) (minValue!5085 V!29135) (_size!2145 (_ BitVec 32)) (_keys!9998 array!52273) (_values!5272 array!52275) (_vacant!2145 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4180)

(assert (=> b!893026 (= res!604767 (or (not (= (size!25584 (_values!5272 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25837 thiss!1181)))) (not (= (size!25583 (_keys!9998 thiss!1181)) (size!25584 (_values!5272 thiss!1181)))) (bvslt (mask!25837 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4981 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4981 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!893027 () Bool)

(declare-fun e!498532 () Bool)

(declare-fun e!498527 () Bool)

(assert (=> b!893027 (= e!498532 (not e!498527))))

(declare-fun res!604768 () Bool)

(assert (=> b!893027 (=> res!604768 e!498527)))

(declare-datatypes ((SeekEntryResult!8797 0))(
  ( (MissingZero!8797 (index!37559 (_ BitVec 32))) (Found!8797 (index!37560 (_ BitVec 32))) (Intermediate!8797 (undefined!9609 Bool) (index!37561 (_ BitVec 32)) (x!75787 (_ BitVec 32))) (Undefined!8797) (MissingVacant!8797 (index!37562 (_ BitVec 32))) )
))
(declare-fun lt!403395 () SeekEntryResult!8797)

(get-info :version)

(assert (=> b!893027 (= res!604768 (not ((_ is Found!8797) lt!403395)))))

(declare-fun e!498526 () Bool)

(assert (=> b!893027 e!498526))

(declare-fun res!604765 () Bool)

(assert (=> b!893027 (=> res!604765 e!498526)))

(assert (=> b!893027 (= res!604765 (not ((_ is Found!8797) lt!403395)))))

(declare-datatypes ((Unit!30362 0))(
  ( (Unit!30363) )
))
(declare-fun lt!403394 () Unit!30362)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!47 (array!52273 array!52275 (_ BitVec 32) (_ BitVec 32) V!29135 V!29135 (_ BitVec 64)) Unit!30362)

(assert (=> b!893027 (= lt!403394 (lemmaSeekEntryGivesInRangeIndex!47 (_keys!9998 thiss!1181) (_values!5272 thiss!1181) (mask!25837 thiss!1181) (extraKeys!4981 thiss!1181) (zeroValue!5085 thiss!1181) (minValue!5085 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52273 (_ BitVec 32)) SeekEntryResult!8797)

(assert (=> b!893027 (= lt!403395 (seekEntry!0 key!785 (_keys!9998 thiss!1181) (mask!25837 thiss!1181)))))

(declare-fun res!604764 () Bool)

(assert (=> start!75996 (=> (not res!604764) (not e!498532))))

(declare-fun valid!1629 (LongMapFixedSize!4180) Bool)

(assert (=> start!75996 (= res!604764 (valid!1629 thiss!1181))))

(assert (=> start!75996 e!498532))

(declare-fun e!498530 () Bool)

(assert (=> start!75996 e!498530))

(assert (=> start!75996 true))

(declare-fun b!893028 () Bool)

(declare-fun e!498534 () Bool)

(declare-fun tp_is_empty!18127 () Bool)

(assert (=> b!893028 (= e!498534 tp_is_empty!18127)))

(declare-fun e!498529 () Bool)

(declare-fun array_inv!19796 (array!52273) Bool)

(declare-fun array_inv!19797 (array!52275) Bool)

(assert (=> b!893029 (= e!498530 (and tp!55366 tp_is_empty!18127 (array_inv!19796 (_keys!9998 thiss!1181)) (array_inv!19797 (_values!5272 thiss!1181)) e!498529))))

(declare-fun b!893030 () Bool)

(declare-fun e!498533 () Bool)

(assert (=> b!893030 (= e!498533 tp_is_empty!18127)))

(declare-fun b!893031 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893031 (= e!498526 (inRange!0 (index!37560 lt!403395) (mask!25837 thiss!1181)))))

(declare-fun b!893032 () Bool)

(assert (=> b!893032 (= e!498527 e!498528)))

(declare-fun res!604766 () Bool)

(assert (=> b!893032 (=> res!604766 e!498528)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!893032 (= res!604766 (not (validMask!0 (mask!25837 thiss!1181))))))

(declare-datatypes ((tuple2!11900 0))(
  ( (tuple2!11901 (_1!5961 (_ BitVec 64)) (_2!5961 V!29135)) )
))
(declare-datatypes ((List!17726 0))(
  ( (Nil!17723) (Cons!17722 (h!18859 tuple2!11900) (t!25017 List!17726)) )
))
(declare-datatypes ((ListLongMap!10599 0))(
  ( (ListLongMap!10600 (toList!5315 List!17726)) )
))
(declare-fun lt!403397 () ListLongMap!10599)

(declare-fun contains!4328 (ListLongMap!10599 (_ BitVec 64)) Bool)

(assert (=> b!893032 (contains!4328 lt!403397 (select (arr!25138 (_keys!9998 thiss!1181)) (index!37560 lt!403395)))))

(declare-fun getCurrentListMap!2592 (array!52273 array!52275 (_ BitVec 32) (_ BitVec 32) V!29135 V!29135 (_ BitVec 32) Int) ListLongMap!10599)

(assert (=> b!893032 (= lt!403397 (getCurrentListMap!2592 (_keys!9998 thiss!1181) (_values!5272 thiss!1181) (mask!25837 thiss!1181) (extraKeys!4981 thiss!1181) (zeroValue!5085 thiss!1181) (minValue!5085 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5287 thiss!1181)))))

(declare-fun lt!403393 () Unit!30362)

(declare-fun lemmaValidKeyInArrayIsInListMap!222 (array!52273 array!52275 (_ BitVec 32) (_ BitVec 32) V!29135 V!29135 (_ BitVec 32) Int) Unit!30362)

(assert (=> b!893032 (= lt!403393 (lemmaValidKeyInArrayIsInListMap!222 (_keys!9998 thiss!1181) (_values!5272 thiss!1181) (mask!25837 thiss!1181) (extraKeys!4981 thiss!1181) (zeroValue!5085 thiss!1181) (minValue!5085 thiss!1181) (index!37560 lt!403395) (defaultEntry!5287 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!893032 (arrayContainsKey!0 (_keys!9998 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403392 () Unit!30362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52273 (_ BitVec 64) (_ BitVec 32)) Unit!30362)

(assert (=> b!893032 (= lt!403392 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9998 thiss!1181) key!785 (index!37560 lt!403395)))))

(declare-fun mapNonEmpty!28745 () Bool)

(declare-fun mapRes!28745 () Bool)

(declare-fun tp!55367 () Bool)

(assert (=> mapNonEmpty!28745 (= mapRes!28745 (and tp!55367 e!498534))))

(declare-fun mapRest!28745 () (Array (_ BitVec 32) ValueCell!8582))

(declare-fun mapKey!28745 () (_ BitVec 32))

(declare-fun mapValue!28745 () ValueCell!8582)

(assert (=> mapNonEmpty!28745 (= (arr!25139 (_values!5272 thiss!1181)) (store mapRest!28745 mapKey!28745 mapValue!28745))))

(declare-fun b!893033 () Bool)

(declare-fun res!604771 () Bool)

(assert (=> b!893033 (=> (not res!604771) (not e!498532))))

(assert (=> b!893033 (= res!604771 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893034 () Bool)

(assert (=> b!893034 (= e!498528 true)))

(declare-fun lt!403396 () Bool)

(assert (=> b!893034 (= lt!403396 (contains!4328 lt!403397 key!785))))

(declare-fun mapIsEmpty!28745 () Bool)

(assert (=> mapIsEmpty!28745 mapRes!28745))

(declare-fun b!893035 () Bool)

(declare-fun res!604770 () Bool)

(assert (=> b!893035 (=> res!604770 e!498528)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52273 (_ BitVec 32)) Bool)

(assert (=> b!893035 (= res!604770 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9998 thiss!1181) (mask!25837 thiss!1181))))))

(declare-fun b!893036 () Bool)

(assert (=> b!893036 (= e!498529 (and e!498533 mapRes!28745))))

(declare-fun condMapEmpty!28745 () Bool)

(declare-fun mapDefault!28745 () ValueCell!8582)

(assert (=> b!893036 (= condMapEmpty!28745 (= (arr!25139 (_values!5272 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8582)) mapDefault!28745)))))

(declare-fun b!893037 () Bool)

(declare-fun res!604769 () Bool)

(assert (=> b!893037 (=> res!604769 e!498528)))

(declare-datatypes ((List!17727 0))(
  ( (Nil!17724) (Cons!17723 (h!18860 (_ BitVec 64)) (t!25018 List!17727)) )
))
(declare-fun arrayNoDuplicates!0 (array!52273 (_ BitVec 32) List!17727) Bool)

(assert (=> b!893037 (= res!604769 (not (arrayNoDuplicates!0 (_keys!9998 thiss!1181) #b00000000000000000000000000000000 Nil!17724)))))

(assert (= (and start!75996 res!604764) b!893033))

(assert (= (and b!893033 res!604771) b!893027))

(assert (= (and b!893027 (not res!604765)) b!893031))

(assert (= (and b!893027 (not res!604768)) b!893032))

(assert (= (and b!893032 (not res!604766)) b!893026))

(assert (= (and b!893026 (not res!604767)) b!893035))

(assert (= (and b!893035 (not res!604770)) b!893037))

(assert (= (and b!893037 (not res!604769)) b!893034))

(assert (= (and b!893036 condMapEmpty!28745) mapIsEmpty!28745))

(assert (= (and b!893036 (not condMapEmpty!28745)) mapNonEmpty!28745))

(assert (= (and mapNonEmpty!28745 ((_ is ValueCellFull!8582) mapValue!28745)) b!893028))

(assert (= (and b!893036 ((_ is ValueCellFull!8582) mapDefault!28745)) b!893030))

(assert (= b!893029 b!893036))

(assert (= start!75996 b!893029))

(declare-fun m!831691 () Bool)

(assert (=> start!75996 m!831691))

(declare-fun m!831693 () Bool)

(assert (=> b!893031 m!831693))

(declare-fun m!831695 () Bool)

(assert (=> b!893035 m!831695))

(declare-fun m!831697 () Bool)

(assert (=> b!893027 m!831697))

(declare-fun m!831699 () Bool)

(assert (=> b!893027 m!831699))

(declare-fun m!831701 () Bool)

(assert (=> b!893034 m!831701))

(declare-fun m!831703 () Bool)

(assert (=> mapNonEmpty!28745 m!831703))

(declare-fun m!831705 () Bool)

(assert (=> b!893029 m!831705))

(declare-fun m!831707 () Bool)

(assert (=> b!893029 m!831707))

(declare-fun m!831709 () Bool)

(assert (=> b!893032 m!831709))

(declare-fun m!831711 () Bool)

(assert (=> b!893032 m!831711))

(declare-fun m!831713 () Bool)

(assert (=> b!893032 m!831713))

(declare-fun m!831715 () Bool)

(assert (=> b!893032 m!831715))

(declare-fun m!831717 () Bool)

(assert (=> b!893032 m!831717))

(assert (=> b!893032 m!831711))

(declare-fun m!831719 () Bool)

(assert (=> b!893032 m!831719))

(declare-fun m!831721 () Bool)

(assert (=> b!893032 m!831721))

(declare-fun m!831723 () Bool)

(assert (=> b!893037 m!831723))

(check-sat b_and!26049 (not mapNonEmpty!28745) (not start!75996) (not b!893031) tp_is_empty!18127 (not b!893035) (not b!893034) (not b!893029) (not b!893032) (not b!893027) (not b_next!15799) (not b!893037))
(check-sat b_and!26049 (not b_next!15799))
