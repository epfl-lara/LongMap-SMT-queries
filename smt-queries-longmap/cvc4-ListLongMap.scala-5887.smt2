; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75856 () Bool)

(assert start!75856)

(declare-fun b!892673 () Bool)

(declare-fun b_free!15827 () Bool)

(declare-fun b_next!15827 () Bool)

(assert (=> b!892673 (= b_free!15827 (not b_next!15827))))

(declare-fun tp!55450 () Bool)

(declare-fun b_and!26077 () Bool)

(assert (=> b!892673 (= tp!55450 b_and!26077)))

(declare-fun b!892671 () Bool)

(declare-fun e!498379 () Bool)

(declare-fun e!498384 () Bool)

(assert (=> b!892671 (= e!498379 (not e!498384))))

(declare-fun res!604725 () Bool)

(assert (=> b!892671 (=> res!604725 e!498384)))

(declare-datatypes ((SeekEntryResult!8853 0))(
  ( (MissingZero!8853 (index!37783 (_ BitVec 32))) (Found!8853 (index!37784 (_ BitVec 32))) (Intermediate!8853 (undefined!9665 Bool) (index!37785 (_ BitVec 32)) (x!75873 (_ BitVec 32))) (Undefined!8853) (MissingVacant!8853 (index!37786 (_ BitVec 32))) )
))
(declare-fun lt!403296 () SeekEntryResult!8853)

(assert (=> b!892671 (= res!604725 (not (is-Found!8853 lt!403296)))))

(declare-fun e!498383 () Bool)

(assert (=> b!892671 e!498383))

(declare-fun res!604724 () Bool)

(assert (=> b!892671 (=> res!604724 e!498383)))

(assert (=> b!892671 (= res!604724 (not (is-Found!8853 lt!403296)))))

(declare-datatypes ((Unit!30400 0))(
  ( (Unit!30401) )
))
(declare-fun lt!403295 () Unit!30400)

(declare-datatypes ((array!52290 0))(
  ( (array!52291 (arr!25151 (Array (_ BitVec 32) (_ BitVec 64))) (size!25595 (_ BitVec 32))) )
))
(declare-datatypes ((V!29171 0))(
  ( (V!29172 (val!9128 Int)) )
))
(declare-datatypes ((ValueCell!8596 0))(
  ( (ValueCellFull!8596 (v!11606 V!29171)) (EmptyCell!8596) )
))
(declare-datatypes ((array!52292 0))(
  ( (array!52293 (arr!25152 (Array (_ BitVec 32) ValueCell!8596)) (size!25596 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4208 0))(
  ( (LongMapFixedSize!4209 (defaultEntry!5301 Int) (mask!25816 (_ BitVec 32)) (extraKeys!4995 (_ BitVec 32)) (zeroValue!5099 V!29171) (minValue!5099 V!29171) (_size!2159 (_ BitVec 32)) (_keys!9984 array!52290) (_values!5286 array!52292) (_vacant!2159 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4208)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!52 (array!52290 array!52292 (_ BitVec 32) (_ BitVec 32) V!29171 V!29171 (_ BitVec 64)) Unit!30400)

(assert (=> b!892671 (= lt!403295 (lemmaSeekEntryGivesInRangeIndex!52 (_keys!9984 thiss!1181) (_values!5286 thiss!1181) (mask!25816 thiss!1181) (extraKeys!4995 thiss!1181) (zeroValue!5099 thiss!1181) (minValue!5099 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52290 (_ BitVec 32)) SeekEntryResult!8853)

(assert (=> b!892671 (= lt!403296 (seekEntry!0 key!785 (_keys!9984 thiss!1181) (mask!25816 thiss!1181)))))

(declare-fun b!892672 () Bool)

(declare-fun e!498374 () Bool)

(declare-fun call!39545 () V!29171)

(declare-fun get!13239 (ValueCell!8596 V!29171) V!29171)

(declare-fun dynLambda!1295 (Int (_ BitVec 64)) V!29171)

(assert (=> b!892672 (= e!498374 (= call!39545 (get!13239 (select (arr!25152 (_values!5286 thiss!1181)) (index!37784 lt!403296)) (dynLambda!1295 (defaultEntry!5301 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!39542 () Bool)

(declare-fun call!39546 () V!29171)

(assert (=> bm!39542 (= call!39545 call!39546)))

(declare-fun e!498381 () Bool)

(declare-fun e!498380 () Bool)

(declare-fun tp_is_empty!18155 () Bool)

(declare-fun array_inv!19754 (array!52290) Bool)

(declare-fun array_inv!19755 (array!52292) Bool)

(assert (=> b!892673 (= e!498381 (and tp!55450 tp_is_empty!18155 (array_inv!19754 (_keys!9984 thiss!1181)) (array_inv!19755 (_values!5286 thiss!1181)) e!498380))))

(declare-fun b!892674 () Bool)

(declare-fun res!604726 () Bool)

(assert (=> b!892674 (=> (not res!604726) (not e!498379))))

(assert (=> b!892674 (= res!604726 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892675 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892675 (= e!498383 (inRange!0 (index!37784 lt!403296) (mask!25816 thiss!1181)))))

(declare-fun b!892676 () Bool)

(declare-fun e!498378 () Bool)

(assert (=> b!892676 (= e!498378 tp_is_empty!18155)))

(declare-fun b!892677 () Bool)

(assert (=> b!892677 (= e!498384 true)))

(declare-fun lt!403297 () Bool)

(declare-fun contains!4371 (LongMapFixedSize!4208 (_ BitVec 64)) Bool)

(assert (=> b!892677 (= lt!403297 (contains!4371 thiss!1181 key!785))))

(declare-fun e!498373 () Bool)

(assert (=> b!892677 e!498373))

(declare-fun c!93980 () Bool)

(assert (=> b!892677 (= c!93980 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!403294 () Unit!30400)

(declare-fun lemmaKeyInListMapThenSameValueInArray!8 (array!52290 array!52292 (_ BitVec 32) (_ BitVec 32) V!29171 V!29171 (_ BitVec 64) (_ BitVec 32) Int) Unit!30400)

(assert (=> b!892677 (= lt!403294 (lemmaKeyInListMapThenSameValueInArray!8 (_keys!9984 thiss!1181) (_values!5286 thiss!1181) (mask!25816 thiss!1181) (extraKeys!4995 thiss!1181) (zeroValue!5099 thiss!1181) (minValue!5099 thiss!1181) key!785 (index!37784 lt!403296) (defaultEntry!5301 thiss!1181)))))

(declare-datatypes ((tuple2!12006 0))(
  ( (tuple2!12007 (_1!6014 (_ BitVec 64)) (_2!6014 V!29171)) )
))
(declare-datatypes ((List!17790 0))(
  ( (Nil!17787) (Cons!17786 (h!18917 tuple2!12006) (t!25101 List!17790)) )
))
(declare-datatypes ((ListLongMap!10703 0))(
  ( (ListLongMap!10704 (toList!5367 List!17790)) )
))
(declare-fun lt!403291 () ListLongMap!10703)

(declare-fun contains!4372 (ListLongMap!10703 (_ BitVec 64)) Bool)

(assert (=> b!892677 (contains!4372 lt!403291 (select (arr!25151 (_keys!9984 thiss!1181)) (index!37784 lt!403296)))))

(declare-fun getCurrentListMap!2647 (array!52290 array!52292 (_ BitVec 32) (_ BitVec 32) V!29171 V!29171 (_ BitVec 32) Int) ListLongMap!10703)

(assert (=> b!892677 (= lt!403291 (getCurrentListMap!2647 (_keys!9984 thiss!1181) (_values!5286 thiss!1181) (mask!25816 thiss!1181) (extraKeys!4995 thiss!1181) (zeroValue!5099 thiss!1181) (minValue!5099 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5301 thiss!1181)))))

(declare-fun lt!403292 () Unit!30400)

(declare-fun lemmaValidKeyInArrayIsInListMap!236 (array!52290 array!52292 (_ BitVec 32) (_ BitVec 32) V!29171 V!29171 (_ BitVec 32) Int) Unit!30400)

(assert (=> b!892677 (= lt!403292 (lemmaValidKeyInArrayIsInListMap!236 (_keys!9984 thiss!1181) (_values!5286 thiss!1181) (mask!25816 thiss!1181) (extraKeys!4995 thiss!1181) (zeroValue!5099 thiss!1181) (minValue!5099 thiss!1181) (index!37784 lt!403296) (defaultEntry!5301 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892677 (arrayContainsKey!0 (_keys!9984 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403293 () Unit!30400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52290 (_ BitVec 64) (_ BitVec 32)) Unit!30400)

(assert (=> b!892677 (= lt!403293 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9984 thiss!1181) key!785 (index!37784 lt!403296)))))

(declare-fun b!892678 () Bool)

(declare-fun res!604723 () Bool)

(declare-fun e!498377 () Bool)

(assert (=> b!892678 (=> (not res!604723) (not e!498377))))

(assert (=> b!892678 (= res!604723 (not (= (bvand (extraKeys!4995 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!892678 (= e!498374 e!498377)))

(declare-fun b!892679 () Bool)

(declare-fun e!498375 () Bool)

(declare-fun mapRes!28787 () Bool)

(assert (=> b!892679 (= e!498380 (and e!498375 mapRes!28787))))

(declare-fun condMapEmpty!28787 () Bool)

(declare-fun mapDefault!28787 () ValueCell!8596)

