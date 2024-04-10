; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77262 () Bool)

(assert start!77262)

(declare-fun b!901389 () Bool)

(declare-fun b_free!16075 () Bool)

(declare-fun b_next!16075 () Bool)

(assert (=> b!901389 (= b_free!16075 (not b_next!16075))))

(declare-fun tp!56324 () Bool)

(declare-fun b_and!26403 () Bool)

(assert (=> b!901389 (= tp!56324 b_and!26403)))

(declare-fun b!901379 () Bool)

(declare-fun e!504620 () Bool)

(declare-fun e!504625 () Bool)

(assert (=> b!901379 (= e!504620 e!504625)))

(declare-fun res!608603 () Bool)

(declare-datatypes ((array!52862 0))(
  ( (array!52863 (arr!25399 (Array (_ BitVec 32) (_ BitVec 64))) (size!25858 (_ BitVec 32))) )
))
(declare-datatypes ((V!29503 0))(
  ( (V!29504 (val!9252 Int)) )
))
(declare-datatypes ((ValueCell!8720 0))(
  ( (ValueCellFull!8720 (v!11752 V!29503)) (EmptyCell!8720) )
))
(declare-datatypes ((array!52864 0))(
  ( (array!52865 (arr!25400 (Array (_ BitVec 32) ValueCell!8720)) (size!25859 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4456 0))(
  ( (LongMapFixedSize!4457 (defaultEntry!5468 Int) (mask!26278 (_ BitVec 32)) (extraKeys!5197 (_ BitVec 32)) (zeroValue!5301 V!29503) (minValue!5301 V!29503) (_size!2283 (_ BitVec 32)) (_keys!10281 array!52862) (_values!5488 array!52864) (_vacant!2283 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4456)

(assert (=> b!901379 (= res!608603 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!901379 (=> (not res!608603) (not e!504625))))

(declare-fun b!901380 () Bool)

(declare-fun res!608600 () Bool)

(declare-fun e!504622 () Bool)

(assert (=> b!901380 (=> (not res!608600) (not e!504622))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!901380 (= res!608600 (not (= key!785 (bvneg key!785))))))

(declare-fun res!608599 () Bool)

(assert (=> start!77262 (=> (not res!608599) (not e!504622))))

(declare-fun valid!1710 (LongMapFixedSize!4456) Bool)

(assert (=> start!77262 (= res!608599 (valid!1710 thiss!1181))))

(assert (=> start!77262 e!504622))

(declare-fun e!504617 () Bool)

(assert (=> start!77262 e!504617))

(assert (=> start!77262 true))

(declare-fun mapIsEmpty!29290 () Bool)

(declare-fun mapRes!29290 () Bool)

(assert (=> mapIsEmpty!29290 mapRes!29290))

(declare-fun b!901381 () Bool)

(declare-fun e!504627 () Bool)

(declare-datatypes ((SeekEntryResult!8950 0))(
  ( (MissingZero!8950 (index!38171 (_ BitVec 32))) (Found!8950 (index!38172 (_ BitVec 32))) (Intermediate!8950 (undefined!9762 Bool) (index!38173 (_ BitVec 32)) (x!76801 (_ BitVec 32))) (Undefined!8950) (MissingVacant!8950 (index!38174 (_ BitVec 32))) )
))
(declare-fun lt!407397 () SeekEntryResult!8950)

(assert (=> b!901381 (= e!504627 (and (bvsge (index!38172 lt!407397) #b00000000000000000000000000000000) (bvslt (index!38172 lt!407397) (size!25859 (_values!5488 thiss!1181)))))))

(assert (=> b!901381 e!504620))

(declare-fun c!95461 () Bool)

(assert (=> b!901381 (= c!95461 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30614 0))(
  ( (Unit!30615) )
))
(declare-fun lt!407398 () Unit!30614)

(declare-fun lemmaKeyInListMapThenSameValueInArray!10 (array!52862 array!52864 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 64) (_ BitVec 32) Int) Unit!30614)

(assert (=> b!901381 (= lt!407398 (lemmaKeyInListMapThenSameValueInArray!10 (_keys!10281 thiss!1181) (_values!5488 thiss!1181) (mask!26278 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) key!785 (index!38172 lt!407397) (defaultEntry!5468 thiss!1181)))))

(declare-datatypes ((tuple2!12070 0))(
  ( (tuple2!12071 (_1!6046 (_ BitVec 64)) (_2!6046 V!29503)) )
))
(declare-datatypes ((List!17873 0))(
  ( (Nil!17870) (Cons!17869 (h!19015 tuple2!12070) (t!25234 List!17873)) )
))
(declare-datatypes ((ListLongMap!10767 0))(
  ( (ListLongMap!10768 (toList!5399 List!17873)) )
))
(declare-fun lt!407399 () ListLongMap!10767)

(declare-fun contains!4439 (ListLongMap!10767 (_ BitVec 64)) Bool)

(assert (=> b!901381 (contains!4439 lt!407399 (select (arr!25399 (_keys!10281 thiss!1181)) (index!38172 lt!407397)))))

(declare-fun getCurrentListMap!2669 (array!52862 array!52864 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) ListLongMap!10767)

(assert (=> b!901381 (= lt!407399 (getCurrentListMap!2669 (_keys!10281 thiss!1181) (_values!5488 thiss!1181) (mask!26278 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5468 thiss!1181)))))

(declare-fun lt!407401 () Unit!30614)

(declare-fun lemmaValidKeyInArrayIsInListMap!258 (array!52862 array!52864 (_ BitVec 32) (_ BitVec 32) V!29503 V!29503 (_ BitVec 32) Int) Unit!30614)

(assert (=> b!901381 (= lt!407401 (lemmaValidKeyInArrayIsInListMap!258 (_keys!10281 thiss!1181) (_values!5488 thiss!1181) (mask!26278 thiss!1181) (extraKeys!5197 thiss!1181) (zeroValue!5301 thiss!1181) (minValue!5301 thiss!1181) (index!38172 lt!407397) (defaultEntry!5468 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901381 (arrayContainsKey!0 (_keys!10281 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407402 () Unit!30614)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52862 (_ BitVec 64) (_ BitVec 32)) Unit!30614)

(assert (=> b!901381 (= lt!407402 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10281 thiss!1181) key!785 (index!38172 lt!407397)))))

(declare-fun b!901382 () Bool)

(declare-fun res!608604 () Bool)

(declare-fun e!504621 () Bool)

(assert (=> b!901382 (=> (not res!608604) (not e!504621))))

(assert (=> b!901382 (= res!608604 (not (= (bvand (extraKeys!5197 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!504626 () Bool)

(assert (=> b!901382 (= e!504626 e!504621)))

(declare-fun b!901383 () Bool)

(declare-fun e!504624 () Bool)

(declare-fun tp_is_empty!18403 () Bool)

(assert (=> b!901383 (= e!504624 tp_is_empty!18403)))

(declare-fun b!901384 () Bool)

(declare-fun call!40119 () V!29503)

(assert (=> b!901384 (= e!504621 (= call!40119 (minValue!5301 thiss!1181)))))

(declare-fun b!901385 () Bool)

(declare-fun e!504623 () Bool)

(assert (=> b!901385 (= e!504623 (and e!504624 mapRes!29290))))

(declare-fun condMapEmpty!29290 () Bool)

(declare-fun mapDefault!29290 () ValueCell!8720)

