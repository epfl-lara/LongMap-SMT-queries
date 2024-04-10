; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3296 () Bool)

(assert start!3296)

(declare-fun b!20243 () Bool)

(declare-fun b_free!713 () Bool)

(declare-fun b_next!713 () Bool)

(assert (=> b!20243 (= b_free!713 (not b_next!713))))

(declare-fun tp!3367 () Bool)

(declare-fun b_and!1389 () Bool)

(assert (=> b!20243 (= tp!3367 b_and!1389)))

(declare-fun b!20235 () Bool)

(declare-datatypes ((V!1127 0))(
  ( (V!1128 (val!515 Int)) )
))
(declare-datatypes ((array!1179 0))(
  ( (array!1180 (arr!561 (Array (_ BitVec 32) (_ BitVec 64))) (size!654 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!289 0))(
  ( (ValueCellFull!289 (v!1547 V!1127)) (EmptyCell!289) )
))
(declare-datatypes ((array!1181 0))(
  ( (array!1182 (arr!562 (Array (_ BitVec 32) ValueCell!289)) (size!655 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!164 0))(
  ( (LongMapFixedSize!165 (defaultEntry!1705 Int) (mask!4667 (_ BitVec 32)) (extraKeys!1611 (_ BitVec 32)) (zeroValue!1635 V!1127) (minValue!1635 V!1127) (_size!120 (_ BitVec 32)) (_keys!3129 array!1179) (_values!1697 array!1181) (_vacant!120 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!164 0))(
  ( (Cell!165 (v!1548 LongMapFixedSize!164)) )
))
(declare-datatypes ((tuple2!846 0))(
  ( (tuple2!847 (_1!426 Bool) (_2!426 Cell!164)) )
))
(declare-fun e!13216 () tuple2!846)

(declare-fun lt!5907 () LongMapFixedSize!164)

(assert (=> b!20235 (= e!13216 (tuple2!847 true (Cell!165 lt!5907)))))

(declare-fun b!20236 () Bool)

(declare-fun e!13221 () Bool)

(declare-fun e!13220 () Bool)

(assert (=> b!20236 (= e!13221 e!13220)))

(declare-fun b!20237 () Bool)

(declare-fun c!2181 () Bool)

(declare-datatypes ((LongMap!164 0))(
  ( (LongMap!165 (underlying!93 Cell!164)) )
))
(declare-fun thiss!938 () LongMap!164)

(declare-fun lt!5906 () Bool)

(assert (=> b!20237 (= c!2181 (and (not (= (bvand (extraKeys!1611 (v!1548 (underlying!93 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5906))))

(declare-fun e!13222 () tuple2!846)

(assert (=> b!20237 (= e!13222 e!13216)))

(declare-fun b!20238 () Bool)

(declare-fun e!13219 () Bool)

(assert (=> b!20238 (= e!13219 false)))

(declare-fun lt!5909 () tuple2!846)

(declare-fun e!13217 () tuple2!846)

(assert (=> b!20238 (= lt!5909 e!13217)))

(declare-fun c!2180 () Bool)

(assert (=> b!20238 (= c!2180 (and (not lt!5906) (not (= (bvand (extraKeys!1611 (v!1548 (underlying!93 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20238 (= lt!5906 (= (bvand (extraKeys!1611 (v!1548 (underlying!93 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!21 ((_ BitVec 32) Int) LongMapFixedSize!164)

(declare-fun computeNewMask!17 (LongMap!164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20238 (= lt!5907 (getNewLongMapFixedSize!21 (computeNewMask!17 thiss!938 (mask!4667 (v!1548 (underlying!93 thiss!938))) (_vacant!120 (v!1548 (underlying!93 thiss!938))) (_size!120 (v!1548 (underlying!93 thiss!938)))) (defaultEntry!1705 (v!1548 (underlying!93 thiss!938)))))))

(declare-fun b!20239 () Bool)

(declare-fun e!13218 () Bool)

(assert (=> b!20239 (= e!13220 e!13218)))

(declare-fun b!20240 () Bool)

(declare-fun e!13223 () Bool)

(declare-fun tp_is_empty!977 () Bool)

(assert (=> b!20240 (= e!13223 tp_is_empty!977)))

(declare-fun c!2179 () Bool)

(declare-fun bm!990 () Bool)

(declare-datatypes ((tuple2!848 0))(
  ( (tuple2!849 (_1!427 Bool) (_2!427 LongMapFixedSize!164)) )
))
(declare-fun call!994 () tuple2!848)

(declare-fun update!17 (LongMapFixedSize!164 (_ BitVec 64) V!1127) tuple2!848)

(assert (=> bm!990 (= call!994 (update!17 lt!5907 (ite (or c!2180 c!2179) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2180 c!2179) (zeroValue!1635 (v!1548 (underlying!93 thiss!938))) (minValue!1635 (v!1548 (underlying!93 thiss!938))))))))

(declare-fun bm!991 () Bool)

(declare-fun call!993 () tuple2!848)

(assert (=> bm!991 (= call!993 call!994)))

(declare-fun b!20241 () Bool)

(declare-fun lt!5910 () tuple2!848)

(assert (=> b!20241 (= lt!5910 call!993)))

(assert (=> b!20241 (= e!13222 (tuple2!847 (_1!427 lt!5910) (Cell!165 (_2!427 lt!5910))))))

(declare-fun b!20242 () Bool)

(declare-fun lt!5904 () tuple2!848)

(assert (=> b!20242 (= e!13216 (tuple2!847 (_1!427 lt!5904) (Cell!165 (_2!427 lt!5904))))))

(assert (=> b!20242 (= lt!5904 call!993)))

(declare-fun res!13414 () Bool)

(assert (=> start!3296 (=> (not res!13414) (not e!13219))))

(declare-fun valid!81 (LongMap!164) Bool)

(assert (=> start!3296 (= res!13414 (valid!81 thiss!938))))

(assert (=> start!3296 e!13219))

(assert (=> start!3296 e!13221))

(declare-fun e!13224 () Bool)

(declare-fun array_inv!381 (array!1179) Bool)

(declare-fun array_inv!382 (array!1181) Bool)

(assert (=> b!20243 (= e!13218 (and tp!3367 tp_is_empty!977 (array_inv!381 (_keys!3129 (v!1548 (underlying!93 thiss!938)))) (array_inv!382 (_values!1697 (v!1548 (underlying!93 thiss!938)))) e!13224))))

(declare-fun mapIsEmpty!937 () Bool)

(declare-fun mapRes!937 () Bool)

(assert (=> mapIsEmpty!937 mapRes!937))

(declare-fun b!20244 () Bool)

(declare-fun lt!5905 () tuple2!848)

(declare-fun lt!5908 () tuple2!848)

(assert (=> b!20244 (= e!13217 (tuple2!847 (and (_1!427 lt!5905) (_1!427 lt!5908)) (Cell!165 (_2!427 lt!5908))))))

(assert (=> b!20244 (= lt!5905 call!994)))

(assert (=> b!20244 (= lt!5908 (update!17 (_2!427 lt!5905) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1635 (v!1548 (underlying!93 thiss!938)))))))

(declare-fun mapNonEmpty!937 () Bool)

(declare-fun tp!3366 () Bool)

(declare-fun e!13226 () Bool)

(assert (=> mapNonEmpty!937 (= mapRes!937 (and tp!3366 e!13226))))

(declare-fun mapKey!937 () (_ BitVec 32))

(declare-fun mapValue!937 () ValueCell!289)

(declare-fun mapRest!937 () (Array (_ BitVec 32) ValueCell!289))

(assert (=> mapNonEmpty!937 (= (arr!562 (_values!1697 (v!1548 (underlying!93 thiss!938)))) (store mapRest!937 mapKey!937 mapValue!937))))

(declare-fun b!20245 () Bool)

(assert (=> b!20245 (= e!13226 tp_is_empty!977)))

(declare-fun b!20246 () Bool)

(assert (=> b!20246 (= e!13217 e!13222)))

(assert (=> b!20246 (= c!2179 (and (not lt!5906) (= (bvand (extraKeys!1611 (v!1548 (underlying!93 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!20247 () Bool)

(assert (=> b!20247 (= e!13224 (and e!13223 mapRes!937))))

(declare-fun condMapEmpty!937 () Bool)

(declare-fun mapDefault!937 () ValueCell!289)

