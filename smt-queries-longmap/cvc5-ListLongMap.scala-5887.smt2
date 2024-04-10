; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75852 () Bool)

(assert start!75852)

(declare-fun b!892586 () Bool)

(declare-fun b_free!15823 () Bool)

(declare-fun b_next!15823 () Bool)

(assert (=> b!892586 (= b_free!15823 (not b_next!15823))))

(declare-fun tp!55437 () Bool)

(declare-fun b_and!26069 () Bool)

(assert (=> b!892586 (= tp!55437 b_and!26069)))

(declare-datatypes ((array!52282 0))(
  ( (array!52283 (arr!25147 (Array (_ BitVec 32) (_ BitVec 64))) (size!25591 (_ BitVec 32))) )
))
(declare-datatypes ((V!29167 0))(
  ( (V!29168 (val!9126 Int)) )
))
(declare-datatypes ((ValueCell!8594 0))(
  ( (ValueCellFull!8594 (v!11604 V!29167)) (EmptyCell!8594) )
))
(declare-datatypes ((array!52284 0))(
  ( (array!52285 (arr!25148 (Array (_ BitVec 32) ValueCell!8594)) (size!25592 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4204 0))(
  ( (LongMapFixedSize!4205 (defaultEntry!5299 Int) (mask!25814 (_ BitVec 32)) (extraKeys!4993 (_ BitVec 32)) (zeroValue!5097 V!29167) (minValue!5097 V!29167) (_size!2157 (_ BitVec 32)) (_keys!9982 array!52282) (_values!5284 array!52284) (_vacant!2157 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4204)

(declare-fun call!39533 () V!29167)

(declare-fun b!892583 () Bool)

(declare-fun e!498310 () Bool)

(declare-datatypes ((SeekEntryResult!8851 0))(
  ( (MissingZero!8851 (index!37775 (_ BitVec 32))) (Found!8851 (index!37776 (_ BitVec 32))) (Intermediate!8851 (undefined!9663 Bool) (index!37777 (_ BitVec 32)) (x!75867 (_ BitVec 32))) (Undefined!8851) (MissingVacant!8851 (index!37778 (_ BitVec 32))) )
))
(declare-fun lt!403255 () SeekEntryResult!8851)

(declare-fun get!13237 (ValueCell!8594 V!29167) V!29167)

(declare-fun dynLambda!1293 (Int (_ BitVec 64)) V!29167)

(assert (=> b!892583 (= e!498310 (= call!39533 (get!13237 (select (arr!25148 (_values!5284 thiss!1181)) (index!37776 lt!403255)) (dynLambda!1293 (defaultEntry!5299 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!604690 () Bool)

(declare-fun e!498302 () Bool)

(assert (=> start!75852 (=> (not res!604690) (not e!498302))))

(declare-fun valid!1626 (LongMapFixedSize!4204) Bool)

(assert (=> start!75852 (= res!604690 (valid!1626 thiss!1181))))

(assert (=> start!75852 e!498302))

(declare-fun e!498301 () Bool)

(assert (=> start!75852 e!498301))

(assert (=> start!75852 true))

(declare-fun b!892584 () Bool)

(declare-fun e!498308 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892584 (= e!498308 (inRange!0 (index!37776 lt!403255) (mask!25814 thiss!1181)))))

(declare-fun b!892585 () Bool)

(declare-fun e!498312 () Bool)

(assert (=> b!892585 (= e!498302 (not e!498312))))

(declare-fun res!604691 () Bool)

(assert (=> b!892585 (=> res!604691 e!498312)))

(assert (=> b!892585 (= res!604691 (not (is-Found!8851 lt!403255)))))

(assert (=> b!892585 e!498308))

(declare-fun res!604688 () Bool)

(assert (=> b!892585 (=> res!604688 e!498308)))

(assert (=> b!892585 (= res!604688 (not (is-Found!8851 lt!403255)))))

(declare-datatypes ((Unit!30396 0))(
  ( (Unit!30397) )
))
(declare-fun lt!403252 () Unit!30396)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!50 (array!52282 array!52284 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 64)) Unit!30396)

(assert (=> b!892585 (= lt!403252 (lemmaSeekEntryGivesInRangeIndex!50 (_keys!9982 thiss!1181) (_values!5284 thiss!1181) (mask!25814 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52282 (_ BitVec 32)) SeekEntryResult!8851)

(assert (=> b!892585 (= lt!403255 (seekEntry!0 key!785 (_keys!9982 thiss!1181) (mask!25814 thiss!1181)))))

(declare-fun e!498309 () Bool)

(declare-fun tp_is_empty!18151 () Bool)

(declare-fun array_inv!19750 (array!52282) Bool)

(declare-fun array_inv!19751 (array!52284) Bool)

(assert (=> b!892586 (= e!498301 (and tp!55437 tp_is_empty!18151 (array_inv!19750 (_keys!9982 thiss!1181)) (array_inv!19751 (_values!5284 thiss!1181)) e!498309))))

(declare-fun b!892587 () Bool)

(declare-fun res!604687 () Bool)

(declare-fun e!498304 () Bool)

(assert (=> b!892587 (=> (not res!604687) (not e!498304))))

(assert (=> b!892587 (= res!604687 (not (= (bvand (extraKeys!4993 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892587 (= e!498310 e!498304)))

(declare-fun b!892588 () Bool)

(declare-fun res!604686 () Bool)

(assert (=> b!892588 (=> (not res!604686) (not e!498302))))

(assert (=> b!892588 (= res!604686 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892589 () Bool)

(assert (=> b!892589 (= e!498312 true)))

(declare-fun lt!403253 () Bool)

(declare-fun contains!4367 (LongMapFixedSize!4204 (_ BitVec 64)) Bool)

(assert (=> b!892589 (= lt!403253 (contains!4367 thiss!1181 key!785))))

(declare-fun e!498311 () Bool)

(assert (=> b!892589 e!498311))

(declare-fun c!93968 () Bool)

(assert (=> b!892589 (= c!93968 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403254 () Unit!30396)

(declare-fun lemmaKeyInListMapThenSameValueInArray!6 (array!52282 array!52284 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 64) (_ BitVec 32) Int) Unit!30396)

(assert (=> b!892589 (= lt!403254 (lemmaKeyInListMapThenSameValueInArray!6 (_keys!9982 thiss!1181) (_values!5284 thiss!1181) (mask!25814 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) key!785 (index!37776 lt!403255) (defaultEntry!5299 thiss!1181)))))

(declare-datatypes ((tuple2!12002 0))(
  ( (tuple2!12003 (_1!6012 (_ BitVec 64)) (_2!6012 V!29167)) )
))
(declare-datatypes ((List!17788 0))(
  ( (Nil!17785) (Cons!17784 (h!18915 tuple2!12002) (t!25095 List!17788)) )
))
(declare-datatypes ((ListLongMap!10699 0))(
  ( (ListLongMap!10700 (toList!5365 List!17788)) )
))
(declare-fun lt!403251 () ListLongMap!10699)

(declare-fun contains!4368 (ListLongMap!10699 (_ BitVec 64)) Bool)

(assert (=> b!892589 (contains!4368 lt!403251 (select (arr!25147 (_keys!9982 thiss!1181)) (index!37776 lt!403255)))))

(declare-fun getCurrentListMap!2645 (array!52282 array!52284 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 32) Int) ListLongMap!10699)

(assert (=> b!892589 (= lt!403251 (getCurrentListMap!2645 (_keys!9982 thiss!1181) (_values!5284 thiss!1181) (mask!25814 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5299 thiss!1181)))))

(declare-fun lt!403250 () Unit!30396)

(declare-fun lemmaValidKeyInArrayIsInListMap!234 (array!52282 array!52284 (_ BitVec 32) (_ BitVec 32) V!29167 V!29167 (_ BitVec 32) Int) Unit!30396)

(assert (=> b!892589 (= lt!403250 (lemmaValidKeyInArrayIsInListMap!234 (_keys!9982 thiss!1181) (_values!5284 thiss!1181) (mask!25814 thiss!1181) (extraKeys!4993 thiss!1181) (zeroValue!5097 thiss!1181) (minValue!5097 thiss!1181) (index!37776 lt!403255) (defaultEntry!5299 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892589 (arrayContainsKey!0 (_keys!9982 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403249 () Unit!30396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52282 (_ BitVec 64) (_ BitVec 32)) Unit!30396)

(assert (=> b!892589 (= lt!403249 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9982 thiss!1181) key!785 (index!37776 lt!403255)))))

(declare-fun b!892590 () Bool)

(declare-fun e!498307 () Bool)

(declare-fun call!39534 () V!29167)

(assert (=> b!892590 (= e!498307 (= call!39534 (zeroValue!5097 thiss!1181)))))

(declare-fun bm!39530 () Bool)

(assert (=> bm!39530 (= call!39533 call!39534)))

(declare-fun mapIsEmpty!28781 () Bool)

(declare-fun mapRes!28781 () Bool)

(assert (=> mapIsEmpty!28781 mapRes!28781))

(declare-fun bm!39531 () Bool)

(declare-fun apply!403 (ListLongMap!10699 (_ BitVec 64)) V!29167)

(assert (=> bm!39531 (= call!39534 (apply!403 lt!403251 key!785))))

(declare-fun b!892591 () Bool)

(assert (=> b!892591 (= e!498311 e!498307)))

(declare-fun res!604689 () Bool)

(assert (=> b!892591 (= res!604689 (not (= (bvand (extraKeys!4993 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892591 (=> (not res!604689) (not e!498307))))

(declare-fun b!892592 () Bool)

(assert (=> b!892592 (= e!498311 e!498310)))

(declare-fun c!93969 () Bool)

(assert (=> b!892592 (= c!93969 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!892593 () Bool)

(assert (=> b!892593 (= e!498304 (= call!39533 (minValue!5097 thiss!1181)))))

(declare-fun b!892594 () Bool)

(declare-fun e!498305 () Bool)

(assert (=> b!892594 (= e!498305 tp_is_empty!18151)))

(declare-fun mapNonEmpty!28781 () Bool)

(declare-fun tp!55438 () Bool)

(declare-fun e!498303 () Bool)

(assert (=> mapNonEmpty!28781 (= mapRes!28781 (and tp!55438 e!498303))))

(declare-fun mapRest!28781 () (Array (_ BitVec 32) ValueCell!8594))

(declare-fun mapKey!28781 () (_ BitVec 32))

(declare-fun mapValue!28781 () ValueCell!8594)

(assert (=> mapNonEmpty!28781 (= (arr!25148 (_values!5284 thiss!1181)) (store mapRest!28781 mapKey!28781 mapValue!28781))))

(declare-fun b!892595 () Bool)

(assert (=> b!892595 (= e!498303 tp_is_empty!18151)))

(declare-fun b!892596 () Bool)

(assert (=> b!892596 (= e!498309 (and e!498305 mapRes!28781))))

(declare-fun condMapEmpty!28781 () Bool)

(declare-fun mapDefault!28781 () ValueCell!8594)

