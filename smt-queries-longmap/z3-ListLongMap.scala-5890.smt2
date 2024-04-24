; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76074 () Bool)

(assert start!76074)

(declare-fun b!894004 () Bool)

(declare-fun b_free!15841 () Bool)

(declare-fun b_next!15841 () Bool)

(assert (=> b!894004 (= b_free!15841 (not b_next!15841))))

(declare-fun tp!55495 () Bool)

(declare-fun b_and!26113 () Bool)

(assert (=> b!894004 (= tp!55495 b_and!26113)))

(declare-fun b!893998 () Bool)

(declare-fun res!605232 () Bool)

(declare-fun e!499284 () Bool)

(assert (=> b!893998 (=> (not res!605232) (not e!499284))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!893998 (= res!605232 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893999 () Bool)

(declare-fun e!499280 () Bool)

(declare-fun tp_is_empty!18169 () Bool)

(assert (=> b!893999 (= e!499280 tp_is_empty!18169)))

(declare-fun b!894000 () Bool)

(declare-fun e!499279 () Bool)

(assert (=> b!894000 (= e!499279 tp_is_empty!18169)))

(declare-fun b!894001 () Bool)

(declare-fun e!499281 () Bool)

(declare-fun mapRes!28811 () Bool)

(assert (=> b!894001 (= e!499281 (and e!499280 mapRes!28811))))

(declare-fun condMapEmpty!28811 () Bool)

(declare-datatypes ((array!52359 0))(
  ( (array!52360 (arr!25180 (Array (_ BitVec 32) (_ BitVec 64))) (size!25625 (_ BitVec 32))) )
))
(declare-datatypes ((V!29191 0))(
  ( (V!29192 (val!9135 Int)) )
))
(declare-datatypes ((ValueCell!8603 0))(
  ( (ValueCellFull!8603 (v!11611 V!29191)) (EmptyCell!8603) )
))
(declare-datatypes ((array!52361 0))(
  ( (array!52362 (arr!25181 (Array (_ BitVec 32) ValueCell!8603)) (size!25626 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4222 0))(
  ( (LongMapFixedSize!4223 (defaultEntry!5311 Int) (mask!25878 (_ BitVec 32)) (extraKeys!5006 (_ BitVec 32)) (zeroValue!5110 V!29191) (minValue!5110 V!29191) (_size!2166 (_ BitVec 32)) (_keys!10024 array!52359) (_values!5297 array!52361) (_vacant!2166 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4222)

(declare-fun mapDefault!28811 () ValueCell!8603)

(assert (=> b!894001 (= condMapEmpty!28811 (= (arr!25181 (_values!5297 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8603)) mapDefault!28811)))))

(declare-fun b!894002 () Bool)

(declare-fun e!499283 () Bool)

(assert (=> b!894002 (= e!499284 (not e!499283))))

(declare-fun res!605231 () Bool)

(assert (=> b!894002 (=> res!605231 e!499283)))

(declare-datatypes ((SeekEntryResult!8814 0))(
  ( (MissingZero!8814 (index!37627 (_ BitVec 32))) (Found!8814 (index!37628 (_ BitVec 32))) (Intermediate!8814 (undefined!9626 Bool) (index!37629 (_ BitVec 32)) (x!75888 (_ BitVec 32))) (Undefined!8814) (MissingVacant!8814 (index!37630 (_ BitVec 32))) )
))
(declare-fun lt!403889 () SeekEntryResult!8814)

(get-info :version)

(assert (=> b!894002 (= res!605231 ((_ is Found!8814) lt!403889))))

(declare-fun e!499282 () Bool)

(assert (=> b!894002 e!499282))

(declare-fun res!605233 () Bool)

(assert (=> b!894002 (=> res!605233 e!499282)))

(assert (=> b!894002 (= res!605233 (not ((_ is Found!8814) lt!403889)))))

(declare-datatypes ((Unit!30400 0))(
  ( (Unit!30401) )
))
(declare-fun lt!403887 () Unit!30400)

(declare-fun lemmaSeekEntryGivesInRangeIndex!63 (array!52359 array!52361 (_ BitVec 32) (_ BitVec 32) V!29191 V!29191 (_ BitVec 64)) Unit!30400)

(assert (=> b!894002 (= lt!403887 (lemmaSeekEntryGivesInRangeIndex!63 (_keys!10024 thiss!1181) (_values!5297 thiss!1181) (mask!25878 thiss!1181) (extraKeys!5006 thiss!1181) (zeroValue!5110 thiss!1181) (minValue!5110 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52359 (_ BitVec 32)) SeekEntryResult!8814)

(assert (=> b!894002 (= lt!403889 (seekEntry!0 key!785 (_keys!10024 thiss!1181) (mask!25878 thiss!1181)))))

(declare-fun b!894003 () Bool)

(assert (=> b!894003 (= e!499283 true)))

(declare-fun lt!403888 () Bool)

(declare-fun contains!4346 (LongMapFixedSize!4222 (_ BitVec 64)) Bool)

(assert (=> b!894003 (= lt!403888 (contains!4346 thiss!1181 key!785))))

(declare-fun e!499277 () Bool)

(declare-fun array_inv!19826 (array!52359) Bool)

(declare-fun array_inv!19827 (array!52361) Bool)

(assert (=> b!894004 (= e!499277 (and tp!55495 tp_is_empty!18169 (array_inv!19826 (_keys!10024 thiss!1181)) (array_inv!19827 (_values!5297 thiss!1181)) e!499281))))

(declare-fun b!894005 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!894005 (= e!499282 (inRange!0 (index!37628 lt!403889) (mask!25878 thiss!1181)))))

(declare-fun res!605230 () Bool)

(assert (=> start!76074 (=> (not res!605230) (not e!499284))))

(declare-fun valid!1644 (LongMapFixedSize!4222) Bool)

(assert (=> start!76074 (= res!605230 (valid!1644 thiss!1181))))

(assert (=> start!76074 e!499284))

(assert (=> start!76074 e!499277))

(assert (=> start!76074 true))

(declare-fun mapNonEmpty!28811 () Bool)

(declare-fun tp!55496 () Bool)

(assert (=> mapNonEmpty!28811 (= mapRes!28811 (and tp!55496 e!499279))))

(declare-fun mapKey!28811 () (_ BitVec 32))

(declare-fun mapRest!28811 () (Array (_ BitVec 32) ValueCell!8603))

(declare-fun mapValue!28811 () ValueCell!8603)

(assert (=> mapNonEmpty!28811 (= (arr!25181 (_values!5297 thiss!1181)) (store mapRest!28811 mapKey!28811 mapValue!28811))))

(declare-fun mapIsEmpty!28811 () Bool)

(assert (=> mapIsEmpty!28811 mapRes!28811))

(assert (= (and start!76074 res!605230) b!893998))

(assert (= (and b!893998 res!605232) b!894002))

(assert (= (and b!894002 (not res!605233)) b!894005))

(assert (= (and b!894002 (not res!605231)) b!894003))

(assert (= (and b!894001 condMapEmpty!28811) mapIsEmpty!28811))

(assert (= (and b!894001 (not condMapEmpty!28811)) mapNonEmpty!28811))

(assert (= (and mapNonEmpty!28811 ((_ is ValueCellFull!8603) mapValue!28811)) b!894000))

(assert (= (and b!894001 ((_ is ValueCellFull!8603) mapDefault!28811)) b!893999))

(assert (= b!894004 b!894001))

(assert (= start!76074 b!894004))

(declare-fun m!832527 () Bool)

(assert (=> b!894004 m!832527))

(declare-fun m!832529 () Bool)

(assert (=> b!894004 m!832529))

(declare-fun m!832531 () Bool)

(assert (=> start!76074 m!832531))

(declare-fun m!832533 () Bool)

(assert (=> b!894005 m!832533))

(declare-fun m!832535 () Bool)

(assert (=> b!894002 m!832535))

(declare-fun m!832537 () Bool)

(assert (=> b!894002 m!832537))

(declare-fun m!832539 () Bool)

(assert (=> b!894003 m!832539))

(declare-fun m!832541 () Bool)

(assert (=> mapNonEmpty!28811 m!832541))

(check-sat (not b_next!15841) (not b!894004) (not mapNonEmpty!28811) (not b!894005) (not b!894002) tp_is_empty!18169 (not start!76074) (not b!894003) b_and!26113)
(check-sat b_and!26113 (not b_next!15841))
