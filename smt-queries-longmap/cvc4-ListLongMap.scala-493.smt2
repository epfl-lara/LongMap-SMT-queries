; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11110 () Bool)

(assert start!11110)

(declare-fun b!90842 () Bool)

(declare-fun b_free!2313 () Bool)

(declare-fun b_next!2313 () Bool)

(assert (=> b!90842 (= b_free!2313 (not b_next!2313))))

(declare-fun tp!9187 () Bool)

(declare-fun b_and!5491 () Bool)

(assert (=> b!90842 (= tp!9187 b_and!5491)))

(declare-fun b!90848 () Bool)

(declare-fun b_free!2315 () Bool)

(declare-fun b_next!2315 () Bool)

(assert (=> b!90848 (= b_free!2315 (not b_next!2315))))

(declare-fun tp!9188 () Bool)

(declare-fun b_and!5493 () Bool)

(assert (=> b!90848 (= tp!9188 b_and!5493)))

(declare-fun b!90831 () Bool)

(declare-fun e!59226 () Bool)

(declare-fun tp_is_empty!2573 () Bool)

(assert (=> b!90831 (= e!59226 tp_is_empty!2573)))

(declare-fun b!90832 () Bool)

(declare-fun e!59229 () Bool)

(declare-fun e!59218 () Bool)

(assert (=> b!90832 (= e!59229 e!59218)))

(declare-fun res!46311 () Bool)

(assert (=> b!90832 (=> (not res!46311) (not e!59218))))

(declare-datatypes ((V!3077 0))(
  ( (V!3078 (val!1331 Int)) )
))
(declare-datatypes ((array!4113 0))(
  ( (array!4114 (arr!1957 (Array (_ BitVec 32) (_ BitVec 64))) (size!2204 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!943 0))(
  ( (ValueCellFull!943 (v!2708 V!3077)) (EmptyCell!943) )
))
(declare-datatypes ((array!4115 0))(
  ( (array!4116 (arr!1958 (Array (_ BitVec 32) ValueCell!943)) (size!2205 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!794 0))(
  ( (LongMapFixedSize!795 (defaultEntry!2398 Int) (mask!6454 (_ BitVec 32)) (extraKeys!2229 (_ BitVec 32)) (zeroValue!2286 V!3077) (minValue!2286 V!3077) (_size!446 (_ BitVec 32)) (_keys!4078 array!4113) (_values!2381 array!4115) (_vacant!446 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2246 0))(
  ( (tuple2!2247 (_1!1134 Bool) (_2!1134 LongMapFixedSize!794)) )
))
(declare-fun lt!44130 () tuple2!2246)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!90832 (= res!46311 (and (_1!1134 lt!44130) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2701 0))(
  ( (Unit!2702) )
))
(declare-fun lt!44131 () Unit!2701)

(declare-fun e!59227 () Unit!2701)

(assert (=> b!90832 (= lt!44131 e!59227)))

(declare-fun c!15080 () Bool)

(declare-datatypes ((tuple2!2248 0))(
  ( (tuple2!2249 (_1!1135 (_ BitVec 64)) (_2!1135 V!3077)) )
))
(declare-datatypes ((List!1544 0))(
  ( (Nil!1541) (Cons!1540 (h!2132 tuple2!2248) (t!5358 List!1544)) )
))
(declare-datatypes ((ListLongMap!1489 0))(
  ( (ListLongMap!1490 (toList!760 List!1544)) )
))
(declare-fun lt!44120 () ListLongMap!1489)

(declare-datatypes ((Cell!594 0))(
  ( (Cell!595 (v!2709 LongMapFixedSize!794)) )
))
(declare-datatypes ((LongMap!594 0))(
  ( (LongMap!595 (underlying!308 Cell!594)) )
))
(declare-fun thiss!992 () LongMap!594)

(declare-fun contains!771 (ListLongMap!1489 (_ BitVec 64)) Bool)

(assert (=> b!90832 (= c!15080 (contains!771 lt!44120 (select (arr!1957 (_keys!4078 (v!2709 (underlying!308 thiss!992)))) from!355)))))

(declare-fun lt!44121 () V!3077)

(declare-fun newMap!16 () LongMapFixedSize!794)

(declare-fun update!122 (LongMapFixedSize!794 (_ BitVec 64) V!3077) tuple2!2246)

(assert (=> b!90832 (= lt!44130 (update!122 newMap!16 (select (arr!1957 (_keys!4078 (v!2709 (underlying!308 thiss!992)))) from!355) lt!44121))))

(declare-fun b!90834 () Bool)

(declare-fun e!59224 () Bool)

(assert (=> b!90834 (= e!59224 tp_is_empty!2573)))

(declare-fun b!90835 () Bool)

(declare-fun res!46304 () Bool)

(declare-fun e!59223 () Bool)

(assert (=> b!90835 (=> (not res!46304) (not e!59223))))

(declare-fun valid!346 (LongMapFixedSize!794) Bool)

(assert (=> b!90835 (= res!46304 (valid!346 newMap!16))))

(declare-fun mapIsEmpty!3537 () Bool)

(declare-fun mapRes!3538 () Bool)

(assert (=> mapIsEmpty!3537 mapRes!3538))

(declare-fun b!90836 () Bool)

(declare-fun res!46308 () Bool)

(assert (=> b!90836 (=> (not res!46308) (not e!59223))))

(assert (=> b!90836 (= res!46308 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6454 newMap!16)) (_size!446 (v!2709 (underlying!308 thiss!992)))))))

(declare-fun mapIsEmpty!3538 () Bool)

(declare-fun mapRes!3537 () Bool)

(assert (=> mapIsEmpty!3538 mapRes!3537))

(declare-fun mapNonEmpty!3537 () Bool)

(declare-fun tp!9190 () Bool)

(declare-fun e!59220 () Bool)

(assert (=> mapNonEmpty!3537 (= mapRes!3538 (and tp!9190 e!59220))))

(declare-fun mapKey!3537 () (_ BitVec 32))

(declare-fun mapRest!3537 () (Array (_ BitVec 32) ValueCell!943))

(declare-fun mapValue!3537 () ValueCell!943)

(assert (=> mapNonEmpty!3537 (= (arr!1958 (_values!2381 (v!2709 (underlying!308 thiss!992)))) (store mapRest!3537 mapKey!3537 mapValue!3537))))

(declare-fun b!90837 () Bool)

(declare-fun e!59219 () Bool)

(assert (=> b!90837 (= e!59219 e!59229)))

(declare-fun res!46309 () Bool)

(assert (=> b!90837 (=> (not res!46309) (not e!59229))))

(assert (=> b!90837 (= res!46309 (and (not (= (select (arr!1957 (_keys!4078 (v!2709 (underlying!308 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1957 (_keys!4078 (v!2709 (underlying!308 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1229 (ValueCell!943 V!3077) V!3077)

(declare-fun dynLambda!352 (Int (_ BitVec 64)) V!3077)

(assert (=> b!90837 (= lt!44121 (get!1229 (select (arr!1958 (_values!2381 (v!2709 (underlying!308 thiss!992)))) from!355) (dynLambda!352 (defaultEntry!2398 (v!2709 (underlying!308 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90838 () Bool)

(assert (=> b!90838 (= e!59220 tp_is_empty!2573)))

(declare-fun b!90839 () Bool)

(declare-fun e!59231 () Bool)

(declare-fun e!59221 () Bool)

(assert (=> b!90839 (= e!59231 e!59221)))

(declare-fun res!46305 () Bool)

(assert (=> start!11110 (=> (not res!46305) (not e!59223))))

(declare-fun valid!347 (LongMap!594) Bool)

(assert (=> start!11110 (= res!46305 (valid!347 thiss!992))))

(assert (=> start!11110 e!59223))

(assert (=> start!11110 e!59231))

(assert (=> start!11110 true))

(declare-fun e!59225 () Bool)

(assert (=> start!11110 e!59225))

(declare-fun b!90833 () Bool)

(declare-fun e!59217 () Bool)

(assert (=> b!90833 (= e!59218 (not e!59217))))

(declare-fun res!46307 () Bool)

(assert (=> b!90833 (=> res!46307 e!59217)))

(declare-fun getCurrentListMap!452 (array!4113 array!4115 (_ BitVec 32) (_ BitVec 32) V!3077 V!3077 (_ BitVec 32) Int) ListLongMap!1489)

(declare-fun map!1213 (LongMapFixedSize!794) ListLongMap!1489)

(assert (=> b!90833 (= res!46307 (not (= (getCurrentListMap!452 (_keys!4078 (v!2709 (underlying!308 thiss!992))) (_values!2381 (v!2709 (underlying!308 thiss!992))) (mask!6454 (v!2709 (underlying!308 thiss!992))) (extraKeys!2229 (v!2709 (underlying!308 thiss!992))) (zeroValue!2286 (v!2709 (underlying!308 thiss!992))) (minValue!2286 (v!2709 (underlying!308 thiss!992))) from!355 (defaultEntry!2398 (v!2709 (underlying!308 thiss!992)))) (map!1213 (_2!1134 lt!44130)))))))

(declare-fun lt!44127 () tuple2!2248)

(declare-fun lt!44132 () ListLongMap!1489)

(declare-fun lt!44125 () ListLongMap!1489)

(declare-fun lt!44116 () tuple2!2248)

(declare-fun +!122 (ListLongMap!1489 tuple2!2248) ListLongMap!1489)

(assert (=> b!90833 (= (+!122 lt!44125 lt!44127) (+!122 (+!122 lt!44132 lt!44127) lt!44116))))

(assert (=> b!90833 (= lt!44127 (tuple2!2249 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2286 (v!2709 (underlying!308 thiss!992)))))))

(declare-fun lt!44133 () Unit!2701)

(declare-fun addCommutativeForDiffKeys!41 (ListLongMap!1489 (_ BitVec 64) V!3077 (_ BitVec 64) V!3077) Unit!2701)

(assert (=> b!90833 (= lt!44133 (addCommutativeForDiffKeys!41 lt!44132 (select (arr!1957 (_keys!4078 (v!2709 (underlying!308 thiss!992)))) from!355) lt!44121 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2286 (v!2709 (underlying!308 thiss!992)))))))

(declare-fun lt!44124 () ListLongMap!1489)

(assert (=> b!90833 (= lt!44124 lt!44125)))

(assert (=> b!90833 (= lt!44125 (+!122 lt!44132 lt!44116))))

(declare-fun lt!44123 () ListLongMap!1489)

(declare-fun lt!44128 () tuple2!2248)

(assert (=> b!90833 (= lt!44124 (+!122 lt!44123 lt!44128))))

(declare-fun lt!44117 () ListLongMap!1489)

(assert (=> b!90833 (= lt!44132 (+!122 lt!44117 lt!44128))))

(assert (=> b!90833 (= lt!44128 (tuple2!2249 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2286 (v!2709 (underlying!308 thiss!992)))))))

(assert (=> b!90833 (= lt!44123 (+!122 lt!44117 lt!44116))))

(assert (=> b!90833 (= lt!44116 (tuple2!2249 (select (arr!1957 (_keys!4078 (v!2709 (underlying!308 thiss!992)))) from!355) lt!44121))))

(declare-fun lt!44118 () Unit!2701)

(assert (=> b!90833 (= lt!44118 (addCommutativeForDiffKeys!41 lt!44117 (select (arr!1957 (_keys!4078 (v!2709 (underlying!308 thiss!992)))) from!355) lt!44121 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2286 (v!2709 (underlying!308 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!87 (array!4113 array!4115 (_ BitVec 32) (_ BitVec 32) V!3077 V!3077 (_ BitVec 32) Int) ListLongMap!1489)

(assert (=> b!90833 (= lt!44117 (getCurrentListMapNoExtraKeys!87 (_keys!4078 (v!2709 (underlying!308 thiss!992))) (_values!2381 (v!2709 (underlying!308 thiss!992))) (mask!6454 (v!2709 (underlying!308 thiss!992))) (extraKeys!2229 (v!2709 (underlying!308 thiss!992))) (zeroValue!2286 (v!2709 (underlying!308 thiss!992))) (minValue!2286 (v!2709 (underlying!308 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2398 (v!2709 (underlying!308 thiss!992)))))))

(declare-fun b!90840 () Bool)

(declare-fun e!59232 () Bool)

(declare-fun e!59222 () Bool)

(assert (=> b!90840 (= e!59232 (and e!59222 mapRes!3537))))

(declare-fun condMapEmpty!3538 () Bool)

(declare-fun mapDefault!3537 () ValueCell!943)

