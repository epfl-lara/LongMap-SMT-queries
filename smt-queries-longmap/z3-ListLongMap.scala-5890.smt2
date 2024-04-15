; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75888 () Bool)

(assert start!75888)

(declare-fun b!892863 () Bool)

(declare-fun b_free!15841 () Bool)

(declare-fun b_next!15841 () Bool)

(assert (=> b!892863 (= b_free!15841 (not b_next!15841))))

(declare-fun tp!55496 () Bool)

(declare-fun b_and!26077 () Bool)

(assert (=> b!892863 (= tp!55496 b_and!26077)))

(declare-fun b!892856 () Bool)

(declare-fun e!498552 () Bool)

(declare-fun tp_is_empty!18169 () Bool)

(assert (=> b!892856 (= e!498552 tp_is_empty!18169)))

(declare-fun b!892857 () Bool)

(declare-fun e!498547 () Bool)

(assert (=> b!892857 (= e!498547 true)))

(declare-fun lt!403290 () Bool)

(declare-datatypes ((array!52303 0))(
  ( (array!52304 (arr!25157 (Array (_ BitVec 32) (_ BitVec 64))) (size!25603 (_ BitVec 32))) )
))
(declare-datatypes ((V!29191 0))(
  ( (V!29192 (val!9135 Int)) )
))
(declare-datatypes ((ValueCell!8603 0))(
  ( (ValueCellFull!8603 (v!11610 V!29191)) (EmptyCell!8603) )
))
(declare-datatypes ((array!52305 0))(
  ( (array!52306 (arr!25158 (Array (_ BitVec 32) ValueCell!8603)) (size!25604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4222 0))(
  ( (LongMapFixedSize!4223 (defaultEntry!5311 Int) (mask!25828 (_ BitVec 32)) (extraKeys!5006 (_ BitVec 32)) (zeroValue!5110 V!29191) (minValue!5110 V!29191) (_size!2166 (_ BitVec 32)) (_keys!9991 array!52303) (_values!5297 array!52305) (_vacant!2166 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4222)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4347 (LongMapFixedSize!4222 (_ BitVec 64)) Bool)

(assert (=> b!892857 (= lt!403290 (contains!4347 thiss!1181 key!785))))

(declare-fun mapIsEmpty!28811 () Bool)

(declare-fun mapRes!28811 () Bool)

(assert (=> mapIsEmpty!28811 mapRes!28811))

(declare-fun b!892858 () Bool)

(declare-fun res!604776 () Bool)

(declare-fun e!498551 () Bool)

(assert (=> b!892858 (=> (not res!604776) (not e!498551))))

(assert (=> b!892858 (= res!604776 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892859 () Bool)

(declare-fun e!498553 () Bool)

(declare-datatypes ((SeekEntryResult!8864 0))(
  ( (MissingZero!8864 (index!37827 (_ BitVec 32))) (Found!8864 (index!37828 (_ BitVec 32))) (Intermediate!8864 (undefined!9676 Bool) (index!37829 (_ BitVec 32)) (x!75919 (_ BitVec 32))) (Undefined!8864) (MissingVacant!8864 (index!37830 (_ BitVec 32))) )
))
(declare-fun lt!403292 () SeekEntryResult!8864)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892859 (= e!498553 (inRange!0 (index!37828 lt!403292) (mask!25828 thiss!1181)))))

(declare-fun b!892860 () Bool)

(assert (=> b!892860 (= e!498551 (not e!498547))))

(declare-fun res!604779 () Bool)

(assert (=> b!892860 (=> res!604779 e!498547)))

(get-info :version)

(assert (=> b!892860 (= res!604779 ((_ is Found!8864) lt!403292))))

(assert (=> b!892860 e!498553))

(declare-fun res!604777 () Bool)

(assert (=> b!892860 (=> res!604777 e!498553)))

(assert (=> b!892860 (= res!604777 (not ((_ is Found!8864) lt!403292)))))

(declare-datatypes ((Unit!30358 0))(
  ( (Unit!30359) )
))
(declare-fun lt!403291 () Unit!30358)

(declare-fun lemmaSeekEntryGivesInRangeIndex!60 (array!52303 array!52305 (_ BitVec 32) (_ BitVec 32) V!29191 V!29191 (_ BitVec 64)) Unit!30358)

(assert (=> b!892860 (= lt!403291 (lemmaSeekEntryGivesInRangeIndex!60 (_keys!9991 thiss!1181) (_values!5297 thiss!1181) (mask!25828 thiss!1181) (extraKeys!5006 thiss!1181) (zeroValue!5110 thiss!1181) (minValue!5110 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52303 (_ BitVec 32)) SeekEntryResult!8864)

(assert (=> b!892860 (= lt!403292 (seekEntry!0 key!785 (_keys!9991 thiss!1181) (mask!25828 thiss!1181)))))

(declare-fun b!892861 () Bool)

(declare-fun e!498550 () Bool)

(declare-fun e!498549 () Bool)

(assert (=> b!892861 (= e!498550 (and e!498549 mapRes!28811))))

(declare-fun condMapEmpty!28811 () Bool)

(declare-fun mapDefault!28811 () ValueCell!8603)

(assert (=> b!892861 (= condMapEmpty!28811 (= (arr!25158 (_values!5297 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8603)) mapDefault!28811)))))

(declare-fun res!604778 () Bool)

(assert (=> start!75888 (=> (not res!604778) (not e!498551))))

(declare-fun valid!1637 (LongMapFixedSize!4222) Bool)

(assert (=> start!75888 (= res!604778 (valid!1637 thiss!1181))))

(assert (=> start!75888 e!498551))

(declare-fun e!498548 () Bool)

(assert (=> start!75888 e!498548))

(assert (=> start!75888 true))

(declare-fun b!892862 () Bool)

(assert (=> b!892862 (= e!498549 tp_is_empty!18169)))

(declare-fun mapNonEmpty!28811 () Bool)

(declare-fun tp!55495 () Bool)

(assert (=> mapNonEmpty!28811 (= mapRes!28811 (and tp!55495 e!498552))))

(declare-fun mapRest!28811 () (Array (_ BitVec 32) ValueCell!8603))

(declare-fun mapKey!28811 () (_ BitVec 32))

(declare-fun mapValue!28811 () ValueCell!8603)

(assert (=> mapNonEmpty!28811 (= (arr!25158 (_values!5297 thiss!1181)) (store mapRest!28811 mapKey!28811 mapValue!28811))))

(declare-fun array_inv!19816 (array!52303) Bool)

(declare-fun array_inv!19817 (array!52305) Bool)

(assert (=> b!892863 (= e!498548 (and tp!55496 tp_is_empty!18169 (array_inv!19816 (_keys!9991 thiss!1181)) (array_inv!19817 (_values!5297 thiss!1181)) e!498550))))

(assert (= (and start!75888 res!604778) b!892858))

(assert (= (and b!892858 res!604776) b!892860))

(assert (= (and b!892860 (not res!604777)) b!892859))

(assert (= (and b!892860 (not res!604779)) b!892857))

(assert (= (and b!892861 condMapEmpty!28811) mapIsEmpty!28811))

(assert (= (and b!892861 (not condMapEmpty!28811)) mapNonEmpty!28811))

(assert (= (and mapNonEmpty!28811 ((_ is ValueCellFull!8603) mapValue!28811)) b!892856))

(assert (= (and b!892861 ((_ is ValueCellFull!8603) mapDefault!28811)) b!892862))

(assert (= b!892863 b!892861))

(assert (= start!75888 b!892863))

(declare-fun m!830475 () Bool)

(assert (=> start!75888 m!830475))

(declare-fun m!830477 () Bool)

(assert (=> b!892859 m!830477))

(declare-fun m!830479 () Bool)

(assert (=> b!892857 m!830479))

(declare-fun m!830481 () Bool)

(assert (=> b!892860 m!830481))

(declare-fun m!830483 () Bool)

(assert (=> b!892860 m!830483))

(declare-fun m!830485 () Bool)

(assert (=> mapNonEmpty!28811 m!830485))

(declare-fun m!830487 () Bool)

(assert (=> b!892863 m!830487))

(declare-fun m!830489 () Bool)

(assert (=> b!892863 m!830489))

(check-sat tp_is_empty!18169 (not b!892859) (not start!75888) b_and!26077 (not b!892863) (not b!892857) (not b_next!15841) (not mapNonEmpty!28811) (not b!892860))
(check-sat b_and!26077 (not b_next!15841))
