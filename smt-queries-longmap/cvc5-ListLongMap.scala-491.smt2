; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11060 () Bool)

(assert start!11060)

(declare-fun b!90065 () Bool)

(declare-fun b_free!2281 () Bool)

(declare-fun b_next!2281 () Bool)

(assert (=> b!90065 (= b_free!2281 (not b_next!2281))))

(declare-fun tp!9090 () Bool)

(declare-fun b_and!5415 () Bool)

(assert (=> b!90065 (= tp!9090 b_and!5415)))

(declare-fun b!90064 () Bool)

(declare-fun b_free!2283 () Bool)

(declare-fun b_next!2283 () Bool)

(assert (=> b!90064 (= b_free!2283 (not b_next!2283))))

(declare-fun tp!9088 () Bool)

(declare-fun b_and!5417 () Bool)

(assert (=> b!90064 (= tp!9088 b_and!5417)))

(declare-fun b!90050 () Bool)

(declare-datatypes ((Unit!2676 0))(
  ( (Unit!2677) )
))
(declare-fun e!58633 () Unit!2676)

(declare-fun Unit!2678 () Unit!2676)

(assert (=> b!90050 (= e!58633 Unit!2678)))

(declare-fun b!90051 () Bool)

(declare-fun e!58643 () Bool)

(declare-fun tp_is_empty!2557 () Bool)

(assert (=> b!90051 (= e!58643 tp_is_empty!2557)))

(declare-fun mapIsEmpty!3485 () Bool)

(declare-fun mapRes!3486 () Bool)

(assert (=> mapIsEmpty!3485 mapRes!3486))

(declare-fun b!90052 () Bool)

(declare-fun e!58637 () Bool)

(declare-fun e!58635 () Bool)

(assert (=> b!90052 (= e!58637 e!58635)))

(declare-fun res!46002 () Bool)

(assert (=> b!90052 (=> (not res!46002) (not e!58635))))

(declare-datatypes ((V!3057 0))(
  ( (V!3058 (val!1323 Int)) )
))
(declare-datatypes ((array!4079 0))(
  ( (array!4080 (arr!1941 (Array (_ BitVec 32) (_ BitVec 64))) (size!2188 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!935 0))(
  ( (ValueCellFull!935 (v!2690 V!3057)) (EmptyCell!935) )
))
(declare-datatypes ((array!4081 0))(
  ( (array!4082 (arr!1942 (Array (_ BitVec 32) ValueCell!935)) (size!2189 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!778 0))(
  ( (LongMapFixedSize!779 (defaultEntry!2387 Int) (mask!6439 (_ BitVec 32)) (extraKeys!2218 (_ BitVec 32)) (zeroValue!2275 V!3057) (minValue!2275 V!3057) (_size!438 (_ BitVec 32)) (_keys!4067 array!4079) (_values!2370 array!4081) (_vacant!438 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2222 0))(
  ( (tuple2!2223 (_1!1122 Bool) (_2!1122 LongMapFixedSize!778)) )
))
(declare-fun lt!43445 () tuple2!2222)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!90052 (= res!46002 (and (_1!1122 lt!43445) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43444 () Unit!2676)

(assert (=> b!90052 (= lt!43444 e!58633)))

(declare-datatypes ((tuple2!2224 0))(
  ( (tuple2!2225 (_1!1123 (_ BitVec 64)) (_2!1123 V!3057)) )
))
(declare-datatypes ((List!1534 0))(
  ( (Nil!1531) (Cons!1530 (h!2122 tuple2!2224) (t!5316 List!1534)) )
))
(declare-datatypes ((ListLongMap!1477 0))(
  ( (ListLongMap!1478 (toList!754 List!1534)) )
))
(declare-fun lt!43442 () ListLongMap!1477)

(declare-fun c!14975 () Bool)

(declare-datatypes ((Cell!578 0))(
  ( (Cell!579 (v!2691 LongMapFixedSize!778)) )
))
(declare-datatypes ((LongMap!578 0))(
  ( (LongMap!579 (underlying!300 Cell!578)) )
))
(declare-fun thiss!992 () LongMap!578)

(declare-fun contains!764 (ListLongMap!1477 (_ BitVec 64)) Bool)

(assert (=> b!90052 (= c!14975 (contains!764 lt!43442 (select (arr!1941 (_keys!4067 (v!2691 (underlying!300 thiss!992)))) from!355)))))

(declare-fun lt!43452 () V!3057)

(declare-fun newMap!16 () LongMapFixedSize!778)

(declare-fun update!117 (LongMapFixedSize!778 (_ BitVec 64) V!3057) tuple2!2222)

(assert (=> b!90052 (= lt!43445 (update!117 newMap!16 (select (arr!1941 (_keys!4067 (v!2691 (underlying!300 thiss!992)))) from!355) lt!43452))))

(declare-fun b!90053 () Bool)

(declare-fun res!46001 () Bool)

(declare-fun e!58638 () Bool)

(assert (=> b!90053 (=> (not res!46001) (not e!58638))))

(declare-fun valid!337 (LongMapFixedSize!778) Bool)

(assert (=> b!90053 (= res!46001 (valid!337 newMap!16))))

(declare-fun b!90054 () Bool)

(declare-fun e!58627 () Bool)

(declare-fun e!58642 () Bool)

(assert (=> b!90054 (= e!58627 (and e!58642 mapRes!3486))))

(declare-fun condMapEmpty!3486 () Bool)

(declare-fun mapDefault!3485 () ValueCell!935)

