; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11152 () Bool)

(assert start!11152)

(declare-fun b!91428 () Bool)

(declare-fun b_free!2329 () Bool)

(declare-fun b_next!2329 () Bool)

(assert (=> b!91428 (= b_free!2329 (not b_next!2329))))

(declare-fun tp!9240 () Bool)

(declare-fun b_and!5539 () Bool)

(assert (=> b!91428 (= tp!9240 b_and!5539)))

(declare-fun b!91432 () Bool)

(declare-fun b_free!2331 () Bool)

(declare-fun b_next!2331 () Bool)

(assert (=> b!91432 (= b_free!2331 (not b_next!2331))))

(declare-fun tp!9239 () Bool)

(declare-fun b_and!5541 () Bool)

(assert (=> b!91432 (= tp!9239 b_and!5541)))

(declare-fun b!91414 () Bool)

(declare-fun res!46552 () Bool)

(declare-fun e!59636 () Bool)

(assert (=> b!91414 (=> res!46552 e!59636)))

(declare-datatypes ((V!3089 0))(
  ( (V!3090 (val!1335 Int)) )
))
(declare-datatypes ((array!4131 0))(
  ( (array!4132 (arr!1965 (Array (_ BitVec 32) (_ BitVec 64))) (size!2212 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!947 0))(
  ( (ValueCellFull!947 (v!2718 V!3089)) (EmptyCell!947) )
))
(declare-datatypes ((array!4133 0))(
  ( (array!4134 (arr!1966 (Array (_ BitVec 32) ValueCell!947)) (size!2213 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!802 0))(
  ( (LongMapFixedSize!803 (defaultEntry!2405 Int) (mask!6465 (_ BitVec 32)) (extraKeys!2236 (_ BitVec 32)) (zeroValue!2293 V!3089) (minValue!2293 V!3089) (_size!450 (_ BitVec 32)) (_keys!4085 array!4131) (_values!2388 array!4133) (_vacant!450 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2262 0))(
  ( (tuple2!2263 (_1!1142 Bool) (_2!1142 LongMapFixedSize!802)) )
))
(declare-fun lt!44588 () tuple2!2262)

(declare-fun valid!352 (LongMapFixedSize!802) Bool)

(assert (=> b!91414 (= res!46552 (not (valid!352 (_2!1142 lt!44588))))))

(declare-fun b!91416 () Bool)

(declare-fun e!59627 () Bool)

(declare-fun e!59621 () Bool)

(assert (=> b!91416 (= e!59627 e!59621)))

(declare-fun res!46551 () Bool)

(assert (=> b!91416 (=> (not res!46551) (not e!59621))))

(declare-datatypes ((tuple2!2264 0))(
  ( (tuple2!2265 (_1!1143 (_ BitVec 64)) (_2!1143 V!3089)) )
))
(declare-datatypes ((List!1550 0))(
  ( (Nil!1547) (Cons!1546 (h!2138 tuple2!2264) (t!5380 List!1550)) )
))
(declare-datatypes ((ListLongMap!1497 0))(
  ( (ListLongMap!1498 (toList!764 List!1550)) )
))
(declare-fun lt!44595 () ListLongMap!1497)

(declare-fun lt!44590 () ListLongMap!1497)

(assert (=> b!91416 (= res!46551 (= lt!44595 lt!44590))))

(declare-fun newMap!16 () LongMapFixedSize!802)

(declare-fun map!1221 (LongMapFixedSize!802) ListLongMap!1497)

(assert (=> b!91416 (= lt!44590 (map!1221 newMap!16))))

(declare-datatypes ((Cell!602 0))(
  ( (Cell!603 (v!2719 LongMapFixedSize!802)) )
))
(declare-datatypes ((LongMap!602 0))(
  ( (LongMap!603 (underlying!312 Cell!602)) )
))
(declare-fun thiss!992 () LongMap!602)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!456 (array!4131 array!4133 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) ListLongMap!1497)

(assert (=> b!91416 (= lt!44595 (getCurrentListMap!456 (_keys!4085 (v!2719 (underlying!312 thiss!992))) (_values!2388 (v!2719 (underlying!312 thiss!992))) (mask!6465 (v!2719 (underlying!312 thiss!992))) (extraKeys!2236 (v!2719 (underlying!312 thiss!992))) (zeroValue!2293 (v!2719 (underlying!312 thiss!992))) (minValue!2293 (v!2719 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2719 (underlying!312 thiss!992)))))))

(declare-fun mapNonEmpty!3565 () Bool)

(declare-fun mapRes!3566 () Bool)

(declare-fun tp!9242 () Bool)

(declare-fun e!59630 () Bool)

(assert (=> mapNonEmpty!3565 (= mapRes!3566 (and tp!9242 e!59630))))

(declare-fun mapKey!3566 () (_ BitVec 32))

(declare-fun mapRest!3566 () (Array (_ BitVec 32) ValueCell!947))

(declare-fun mapValue!3565 () ValueCell!947)

(assert (=> mapNonEmpty!3565 (= (arr!1966 (_values!2388 (v!2719 (underlying!312 thiss!992)))) (store mapRest!3566 mapKey!3566 mapValue!3565))))

(declare-fun b!91417 () Bool)

(declare-datatypes ((Unit!2717 0))(
  ( (Unit!2718) )
))
(declare-fun e!59637 () Unit!2717)

(declare-fun Unit!2719 () Unit!2717)

(assert (=> b!91417 (= e!59637 Unit!2719)))

(declare-fun b!91418 () Bool)

(declare-fun e!59632 () Bool)

(assert (=> b!91418 (= e!59632 (not e!59636))))

(declare-fun res!46558 () Bool)

(assert (=> b!91418 (=> res!46558 e!59636)))

(assert (=> b!91418 (= res!46558 (not (= (getCurrentListMap!456 (_keys!4085 (v!2719 (underlying!312 thiss!992))) (_values!2388 (v!2719 (underlying!312 thiss!992))) (mask!6465 (v!2719 (underlying!312 thiss!992))) (extraKeys!2236 (v!2719 (underlying!312 thiss!992))) (zeroValue!2293 (v!2719 (underlying!312 thiss!992))) (minValue!2293 (v!2719 (underlying!312 thiss!992))) from!355 (defaultEntry!2405 (v!2719 (underlying!312 thiss!992)))) (map!1221 (_2!1142 lt!44588)))))))

(declare-fun lt!44594 () ListLongMap!1497)

(declare-fun lt!44585 () tuple2!2264)

(declare-fun lt!44597 () tuple2!2264)

(declare-fun lt!44589 () ListLongMap!1497)

(declare-fun +!126 (ListLongMap!1497 tuple2!2264) ListLongMap!1497)

(assert (=> b!91418 (= (+!126 lt!44589 lt!44585) (+!126 (+!126 lt!44594 lt!44585) lt!44597))))

(assert (=> b!91418 (= lt!44585 (tuple2!2265 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2719 (underlying!312 thiss!992)))))))

(declare-fun lt!44598 () V!3089)

(declare-fun lt!44586 () Unit!2717)

(declare-fun addCommutativeForDiffKeys!45 (ListLongMap!1497 (_ BitVec 64) V!3089 (_ BitVec 64) V!3089) Unit!2717)

(assert (=> b!91418 (= lt!44586 (addCommutativeForDiffKeys!45 lt!44594 (select (arr!1965 (_keys!4085 (v!2719 (underlying!312 thiss!992)))) from!355) lt!44598 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2293 (v!2719 (underlying!312 thiss!992)))))))

(declare-fun lt!44584 () ListLongMap!1497)

(assert (=> b!91418 (= lt!44584 lt!44589)))

(assert (=> b!91418 (= lt!44589 (+!126 lt!44594 lt!44597))))

(declare-fun lt!44583 () ListLongMap!1497)

(declare-fun lt!44591 () tuple2!2264)

(assert (=> b!91418 (= lt!44584 (+!126 lt!44583 lt!44591))))

(declare-fun lt!44592 () ListLongMap!1497)

(assert (=> b!91418 (= lt!44594 (+!126 lt!44592 lt!44591))))

(assert (=> b!91418 (= lt!44591 (tuple2!2265 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2719 (underlying!312 thiss!992)))))))

(assert (=> b!91418 (= lt!44583 (+!126 lt!44592 lt!44597))))

(assert (=> b!91418 (= lt!44597 (tuple2!2265 (select (arr!1965 (_keys!4085 (v!2719 (underlying!312 thiss!992)))) from!355) lt!44598))))

(declare-fun lt!44599 () Unit!2717)

(assert (=> b!91418 (= lt!44599 (addCommutativeForDiffKeys!45 lt!44592 (select (arr!1965 (_keys!4085 (v!2719 (underlying!312 thiss!992)))) from!355) lt!44598 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2293 (v!2719 (underlying!312 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!91 (array!4131 array!4133 (_ BitVec 32) (_ BitVec 32) V!3089 V!3089 (_ BitVec 32) Int) ListLongMap!1497)

(assert (=> b!91418 (= lt!44592 (getCurrentListMapNoExtraKeys!91 (_keys!4085 (v!2719 (underlying!312 thiss!992))) (_values!2388 (v!2719 (underlying!312 thiss!992))) (mask!6465 (v!2719 (underlying!312 thiss!992))) (extraKeys!2236 (v!2719 (underlying!312 thiss!992))) (zeroValue!2293 (v!2719 (underlying!312 thiss!992))) (minValue!2293 (v!2719 (underlying!312 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2405 (v!2719 (underlying!312 thiss!992)))))))

(declare-fun b!91419 () Bool)

(declare-fun e!59631 () Bool)

(declare-fun e!59635 () Bool)

(assert (=> b!91419 (= e!59631 (and e!59635 mapRes!3566))))

(declare-fun condMapEmpty!3566 () Bool)

(declare-fun mapDefault!3566 () ValueCell!947)

