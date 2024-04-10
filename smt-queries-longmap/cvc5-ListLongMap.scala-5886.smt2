; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75846 () Bool)

(assert start!75846)

(declare-fun b!892457 () Bool)

(declare-fun b_free!15817 () Bool)

(declare-fun b_next!15817 () Bool)

(assert (=> b!892457 (= b_free!15817 (not b_next!15817))))

(declare-fun tp!55420 () Bool)

(declare-fun b_and!26057 () Bool)

(assert (=> b!892457 (= tp!55420 b_and!26057)))

(declare-fun b!892451 () Bool)

(declare-fun e!498197 () Bool)

(declare-datatypes ((V!29159 0))(
  ( (V!29160 (val!9123 Int)) )
))
(declare-fun call!39515 () V!29159)

(declare-datatypes ((array!52270 0))(
  ( (array!52271 (arr!25141 (Array (_ BitVec 32) (_ BitVec 64))) (size!25585 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8591 0))(
  ( (ValueCellFull!8591 (v!11601 V!29159)) (EmptyCell!8591) )
))
(declare-datatypes ((array!52272 0))(
  ( (array!52273 (arr!25142 (Array (_ BitVec 32) ValueCell!8591)) (size!25586 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4198 0))(
  ( (LongMapFixedSize!4199 (defaultEntry!5296 Int) (mask!25809 (_ BitVec 32)) (extraKeys!4990 (_ BitVec 32)) (zeroValue!5094 V!29159) (minValue!5094 V!29159) (_size!2154 (_ BitVec 32)) (_keys!9979 array!52270) (_values!5281 array!52272) (_vacant!2154 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4198)

(assert (=> b!892451 (= e!498197 (= call!39515 (zeroValue!5094 thiss!1181)))))

(declare-fun b!892452 () Bool)

(declare-fun e!498198 () Bool)

(assert (=> b!892452 (= e!498198 true)))

(declare-fun e!498201 () Bool)

(assert (=> b!892452 e!498201))

(declare-fun c!93951 () Bool)

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892452 (= c!93951 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!30390 0))(
  ( (Unit!30391) )
))
(declare-fun lt!403195 () Unit!30390)

(declare-datatypes ((SeekEntryResult!8848 0))(
  ( (MissingZero!8848 (index!37763 (_ BitVec 32))) (Found!8848 (index!37764 (_ BitVec 32))) (Intermediate!8848 (undefined!9660 Bool) (index!37765 (_ BitVec 32)) (x!75850 (_ BitVec 32))) (Undefined!8848) (MissingVacant!8848 (index!37766 (_ BitVec 32))) )
))
(declare-fun lt!403197 () SeekEntryResult!8848)

(declare-fun lemmaKeyInListMapThenSameValueInArray!3 (array!52270 array!52272 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 64) (_ BitVec 32) Int) Unit!30390)

(assert (=> b!892452 (= lt!403195 (lemmaKeyInListMapThenSameValueInArray!3 (_keys!9979 thiss!1181) (_values!5281 thiss!1181) (mask!25809 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) key!785 (index!37764 lt!403197) (defaultEntry!5296 thiss!1181)))))

(declare-datatypes ((tuple2!11996 0))(
  ( (tuple2!11997 (_1!6009 (_ BitVec 64)) (_2!6009 V!29159)) )
))
(declare-datatypes ((List!17785 0))(
  ( (Nil!17782) (Cons!17781 (h!18912 tuple2!11996) (t!25086 List!17785)) )
))
(declare-datatypes ((ListLongMap!10693 0))(
  ( (ListLongMap!10694 (toList!5362 List!17785)) )
))
(declare-fun lt!403194 () ListLongMap!10693)

(declare-fun contains!4364 (ListLongMap!10693 (_ BitVec 64)) Bool)

(assert (=> b!892452 (contains!4364 lt!403194 (select (arr!25141 (_keys!9979 thiss!1181)) (index!37764 lt!403197)))))

(declare-fun getCurrentListMap!2642 (array!52270 array!52272 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 32) Int) ListLongMap!10693)

(assert (=> b!892452 (= lt!403194 (getCurrentListMap!2642 (_keys!9979 thiss!1181) (_values!5281 thiss!1181) (mask!25809 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5296 thiss!1181)))))

(declare-fun lt!403193 () Unit!30390)

(declare-fun lemmaValidKeyInArrayIsInListMap!231 (array!52270 array!52272 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 32) Int) Unit!30390)

(assert (=> b!892452 (= lt!403193 (lemmaValidKeyInArrayIsInListMap!231 (_keys!9979 thiss!1181) (_values!5281 thiss!1181) (mask!25809 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) (index!37764 lt!403197) (defaultEntry!5296 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892452 (arrayContainsKey!0 (_keys!9979 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403196 () Unit!30390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52270 (_ BitVec 64) (_ BitVec 32)) Unit!30390)

(assert (=> b!892452 (= lt!403196 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9979 thiss!1181) key!785 (index!37764 lt!403197)))))

(declare-fun b!892453 () Bool)

(declare-fun e!498204 () Bool)

(assert (=> b!892453 (= e!498204 (not e!498198))))

(declare-fun res!604637 () Bool)

(assert (=> b!892453 (=> res!604637 e!498198)))

(assert (=> b!892453 (= res!604637 (not (is-Found!8848 lt!403197)))))

(declare-fun e!498194 () Bool)

(assert (=> b!892453 e!498194))

(declare-fun res!604636 () Bool)

(assert (=> b!892453 (=> res!604636 e!498194)))

(assert (=> b!892453 (= res!604636 (not (is-Found!8848 lt!403197)))))

(declare-fun lt!403198 () Unit!30390)

(declare-fun lemmaSeekEntryGivesInRangeIndex!47 (array!52270 array!52272 (_ BitVec 32) (_ BitVec 32) V!29159 V!29159 (_ BitVec 64)) Unit!30390)

(assert (=> b!892453 (= lt!403198 (lemmaSeekEntryGivesInRangeIndex!47 (_keys!9979 thiss!1181) (_values!5281 thiss!1181) (mask!25809 thiss!1181) (extraKeys!4990 thiss!1181) (zeroValue!5094 thiss!1181) (minValue!5094 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52270 (_ BitVec 32)) SeekEntryResult!8848)

(assert (=> b!892453 (= lt!403197 (seekEntry!0 key!785 (_keys!9979 thiss!1181) (mask!25809 thiss!1181)))))

(declare-fun res!604634 () Bool)

(assert (=> start!75846 (=> (not res!604634) (not e!498204))))

(declare-fun valid!1623 (LongMapFixedSize!4198) Bool)

(assert (=> start!75846 (= res!604634 (valid!1623 thiss!1181))))

(assert (=> start!75846 e!498204))

(declare-fun e!498203 () Bool)

(assert (=> start!75846 e!498203))

(assert (=> start!75846 true))

(declare-fun bm!39512 () Bool)

(declare-fun apply!400 (ListLongMap!10693 (_ BitVec 64)) V!29159)

(assert (=> bm!39512 (= call!39515 (apply!400 lt!403194 key!785))))

(declare-fun b!892454 () Bool)

(assert (=> b!892454 (= e!498201 e!498197)))

(declare-fun res!604635 () Bool)

(assert (=> b!892454 (= res!604635 (not (= (bvand (extraKeys!4990 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!892454 (=> (not res!604635) (not e!498197))))

(declare-fun b!892455 () Bool)

(declare-fun e!498199 () Bool)

(declare-fun e!498200 () Bool)

(declare-fun mapRes!28772 () Bool)

(assert (=> b!892455 (= e!498199 (and e!498200 mapRes!28772))))

(declare-fun condMapEmpty!28772 () Bool)

(declare-fun mapDefault!28772 () ValueCell!8591)

