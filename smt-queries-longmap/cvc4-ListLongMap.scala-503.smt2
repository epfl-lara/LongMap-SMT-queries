; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11654 () Bool)

(assert start!11654)

(declare-fun b!97537 () Bool)

(declare-fun b_free!2433 () Bool)

(declare-fun b_next!2433 () Bool)

(assert (=> b!97537 (= b_free!2433 (not b_next!2433))))

(declare-fun tp!9582 () Bool)

(declare-fun b_and!5995 () Bool)

(assert (=> b!97537 (= tp!9582 b_and!5995)))

(declare-fun b!97530 () Bool)

(declare-fun b_free!2435 () Bool)

(declare-fun b_next!2435 () Bool)

(assert (=> b!97530 (= b_free!2435 (not b_next!2435))))

(declare-fun tp!9584 () Bool)

(declare-fun b_and!5997 () Bool)

(assert (=> b!97530 (= tp!9584 b_and!5997)))

(declare-fun b!97525 () Bool)

(declare-fun e!63630 () Bool)

(declare-datatypes ((V!3157 0))(
  ( (V!3158 (val!1361 Int)) )
))
(declare-datatypes ((array!4245 0))(
  ( (array!4246 (arr!2017 (Array (_ BitVec 32) (_ BitVec 64))) (size!2267 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!973 0))(
  ( (ValueCellFull!973 (v!2801 V!3157)) (EmptyCell!973) )
))
(declare-datatypes ((array!4247 0))(
  ( (array!4248 (arr!2018 (Array (_ BitVec 32) ValueCell!973)) (size!2268 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!854 0))(
  ( (LongMapFixedSize!855 (defaultEntry!2482 Int) (mask!6579 (_ BitVec 32)) (extraKeys!2303 (_ BitVec 32)) (zeroValue!2365 V!3157) (minValue!2365 V!3157) (_size!476 (_ BitVec 32)) (_keys!4172 array!4245) (_values!2465 array!4247) (_vacant!476 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!654 0))(
  ( (Cell!655 (v!2802 LongMapFixedSize!854)) )
))
(declare-datatypes ((LongMap!654 0))(
  ( (LongMap!655 (underlying!338 Cell!654)) )
))
(declare-fun thiss!992 () LongMap!654)

(assert (=> b!97525 (= e!63630 (and (= (size!2268 (_values!2465 (v!2802 (underlying!338 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6579 (v!2802 (underlying!338 thiss!992))))) (= (size!2267 (_keys!4172 (v!2802 (underlying!338 thiss!992)))) (size!2268 (_values!2465 (v!2802 (underlying!338 thiss!992))))) (bvsge (mask!6579 (v!2802 (underlying!338 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2303 (v!2802 (underlying!338 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!97526 () Bool)

(declare-fun e!63621 () Bool)

(declare-fun e!63620 () Bool)

(assert (=> b!97526 (= e!63621 e!63620)))

(declare-fun res!49137 () Bool)

(assert (=> b!97526 (=> (not res!49137) (not e!63620))))

(declare-datatypes ((tuple2!2342 0))(
  ( (tuple2!2343 (_1!1182 (_ BitVec 64)) (_2!1182 V!3157)) )
))
(declare-datatypes ((List!1582 0))(
  ( (Nil!1579) (Cons!1578 (h!2172 tuple2!2342) (t!5540 List!1582)) )
))
(declare-datatypes ((ListLongMap!1537 0))(
  ( (ListLongMap!1538 (toList!784 List!1582)) )
))
(declare-fun lt!48842 () ListLongMap!1537)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!48839 () ListLongMap!1537)

(assert (=> b!97526 (= res!49137 (and (= lt!48842 lt!48839) (not (= (select (arr!2017 (_keys!4172 (v!2802 (underlying!338 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2017 (_keys!4172 (v!2802 (underlying!338 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!854)

(declare-fun map!1256 (LongMapFixedSize!854) ListLongMap!1537)

(assert (=> b!97526 (= lt!48839 (map!1256 newMap!16))))

(declare-fun getCurrentListMap!475 (array!4245 array!4247 (_ BitVec 32) (_ BitVec 32) V!3157 V!3157 (_ BitVec 32) Int) ListLongMap!1537)

(assert (=> b!97526 (= lt!48842 (getCurrentListMap!475 (_keys!4172 (v!2802 (underlying!338 thiss!992))) (_values!2465 (v!2802 (underlying!338 thiss!992))) (mask!6579 (v!2802 (underlying!338 thiss!992))) (extraKeys!2303 (v!2802 (underlying!338 thiss!992))) (zeroValue!2365 (v!2802 (underlying!338 thiss!992))) (minValue!2365 (v!2802 (underlying!338 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2482 (v!2802 (underlying!338 thiss!992)))))))

(declare-fun b!97527 () Bool)

(declare-fun res!49134 () Bool)

(assert (=> b!97527 (=> (not res!49134) (not e!63621))))

(declare-fun valid!386 (LongMapFixedSize!854) Bool)

(assert (=> b!97527 (= res!49134 (valid!386 newMap!16))))

(declare-fun b!97528 () Bool)

(assert (=> b!97528 (= e!63620 e!63630)))

(declare-fun res!49135 () Bool)

(assert (=> b!97528 (=> (not res!49135) (not e!63630))))

(declare-datatypes ((tuple2!2344 0))(
  ( (tuple2!2345 (_1!1183 Bool) (_2!1183 LongMapFixedSize!854)) )
))
(declare-fun lt!48838 () tuple2!2344)

(assert (=> b!97528 (= res!49135 (and (_1!1183 lt!48838) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2941 0))(
  ( (Unit!2942) )
))
(declare-fun lt!48836 () Unit!2941)

(declare-fun e!63618 () Unit!2941)

(assert (=> b!97528 (= lt!48836 e!63618)))

(declare-fun c!16488 () Bool)

(declare-fun contains!801 (ListLongMap!1537 (_ BitVec 64)) Bool)

(assert (=> b!97528 (= c!16488 (contains!801 lt!48839 (select (arr!2017 (_keys!4172 (v!2802 (underlying!338 thiss!992)))) from!355)))))

(declare-fun update!141 (LongMapFixedSize!854 (_ BitVec 64) V!3157) tuple2!2344)

(declare-fun get!1281 (ValueCell!973 V!3157) V!3157)

(declare-fun dynLambda!369 (Int (_ BitVec 64)) V!3157)

(assert (=> b!97528 (= lt!48838 (update!141 newMap!16 (select (arr!2017 (_keys!4172 (v!2802 (underlying!338 thiss!992)))) from!355) (get!1281 (select (arr!2018 (_values!2465 (v!2802 (underlying!338 thiss!992)))) from!355) (dynLambda!369 (defaultEntry!2482 (v!2802 (underlying!338 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!97529 () Bool)

(declare-fun Unit!2943 () Unit!2941)

(assert (=> b!97529 (= e!63618 Unit!2943)))

(declare-fun e!63617 () Bool)

(declare-fun tp_is_empty!2633 () Bool)

(declare-fun e!63624 () Bool)

(declare-fun array_inv!1257 (array!4245) Bool)

(declare-fun array_inv!1258 (array!4247) Bool)

(assert (=> b!97530 (= e!63617 (and tp!9584 tp_is_empty!2633 (array_inv!1257 (_keys!4172 newMap!16)) (array_inv!1258 (_values!2465 newMap!16)) e!63624))))

(declare-fun b!97532 () Bool)

(declare-fun e!63616 () Bool)

(assert (=> b!97532 (= e!63616 tp_is_empty!2633)))

(declare-fun b!97533 () Bool)

(declare-fun e!63627 () Bool)

(declare-fun mapRes!3752 () Bool)

(assert (=> b!97533 (= e!63627 (and e!63616 mapRes!3752))))

(declare-fun condMapEmpty!3751 () Bool)

(declare-fun mapDefault!3752 () ValueCell!973)

