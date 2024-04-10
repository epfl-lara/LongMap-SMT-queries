; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13960 () Bool)

(assert start!13960)

(declare-fun b!129170 () Bool)

(declare-fun b_free!2881 () Bool)

(declare-fun b_next!2881 () Bool)

(assert (=> b!129170 (= b_free!2881 (not b_next!2881))))

(declare-fun tp!11066 () Bool)

(declare-fun b_and!7983 () Bool)

(assert (=> b!129170 (= tp!11066 b_and!7983)))

(declare-fun b!129169 () Bool)

(declare-fun b_free!2883 () Bool)

(declare-fun b_next!2883 () Bool)

(assert (=> b!129169 (= b_free!2883 (not b_next!2883))))

(declare-fun tp!11068 () Bool)

(declare-fun b_and!7985 () Bool)

(assert (=> b!129169 (= tp!11068 b_and!7985)))

(declare-fun mapNonEmpty!4563 () Bool)

(declare-fun mapRes!4563 () Bool)

(declare-fun tp!11065 () Bool)

(declare-fun e!84312 () Bool)

(assert (=> mapNonEmpty!4563 (= mapRes!4563 (and tp!11065 e!84312))))

(declare-datatypes ((V!3457 0))(
  ( (V!3458 (val!1473 Int)) )
))
(declare-datatypes ((ValueCell!1085 0))(
  ( (ValueCellFull!1085 (v!3159 V!3457)) (EmptyCell!1085) )
))
(declare-fun mapValue!4564 () ValueCell!1085)

(declare-datatypes ((array!4735 0))(
  ( (array!4736 (arr!2241 (Array (_ BitVec 32) (_ BitVec 64))) (size!2507 (_ BitVec 32))) )
))
(declare-datatypes ((array!4737 0))(
  ( (array!4738 (arr!2242 (Array (_ BitVec 32) ValueCell!1085)) (size!2508 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1078 0))(
  ( (LongMapFixedSize!1079 (defaultEntry!2823 Int) (mask!7101 (_ BitVec 32)) (extraKeys!2596 (_ BitVec 32)) (zeroValue!2682 V!3457) (minValue!2682 V!3457) (_size!588 (_ BitVec 32)) (_keys!4564 array!4735) (_values!2806 array!4737) (_vacant!588 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1078)

(declare-fun mapRest!4563 () (Array (_ BitVec 32) ValueCell!1085))

(declare-fun mapKey!4563 () (_ BitVec 32))

(assert (=> mapNonEmpty!4563 (= (arr!2242 (_values!2806 newMap!16)) (store mapRest!4563 mapKey!4563 mapValue!4564))))

(declare-fun b!129156 () Bool)

(declare-fun e!84309 () Bool)

(declare-fun e!84306 () Bool)

(assert (=> b!129156 (= e!84309 e!84306)))

(declare-fun b!129157 () Bool)

(declare-fun e!84308 () Bool)

(declare-fun e!84304 () Bool)

(assert (=> b!129157 (= e!84308 e!84304)))

(declare-fun res!62347 () Bool)

(assert (=> b!129157 (=> (not res!62347) (not e!84304))))

(declare-datatypes ((tuple2!2604 0))(
  ( (tuple2!2605 (_1!1313 (_ BitVec 64)) (_2!1313 V!3457)) )
))
(declare-datatypes ((List!1707 0))(
  ( (Nil!1704) (Cons!1703 (h!2307 tuple2!2604) (t!6102 List!1707)) )
))
(declare-datatypes ((ListLongMap!1695 0))(
  ( (ListLongMap!1696 (toList!863 List!1707)) )
))
(declare-fun lt!66997 () ListLongMap!1695)

(declare-datatypes ((Cell!872 0))(
  ( (Cell!873 (v!3160 LongMapFixedSize!1078)) )
))
(declare-datatypes ((LongMap!872 0))(
  ( (LongMap!873 (underlying!447 Cell!872)) )
))
(declare-fun thiss!992 () LongMap!872)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!66998 () ListLongMap!1695)

(assert (=> b!129157 (= res!62347 (and (= lt!66998 lt!66997) (not (= (select (arr!2241 (_keys!4564 (v!3160 (underlying!447 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2241 (_keys!4564 (v!3160 (underlying!447 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1397 (LongMapFixedSize!1078) ListLongMap!1695)

(assert (=> b!129157 (= lt!66997 (map!1397 newMap!16))))

(declare-fun getCurrentListMap!540 (array!4735 array!4737 (_ BitVec 32) (_ BitVec 32) V!3457 V!3457 (_ BitVec 32) Int) ListLongMap!1695)

(assert (=> b!129157 (= lt!66998 (getCurrentListMap!540 (_keys!4564 (v!3160 (underlying!447 thiss!992))) (_values!2806 (v!3160 (underlying!447 thiss!992))) (mask!7101 (v!3160 (underlying!447 thiss!992))) (extraKeys!2596 (v!3160 (underlying!447 thiss!992))) (zeroValue!2682 (v!3160 (underlying!447 thiss!992))) (minValue!2682 (v!3160 (underlying!447 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2823 (v!3160 (underlying!447 thiss!992)))))))

(declare-fun mapIsEmpty!4563 () Bool)

(assert (=> mapIsEmpty!4563 mapRes!4563))

(declare-fun mapNonEmpty!4564 () Bool)

(declare-fun mapRes!4564 () Bool)

(declare-fun tp!11067 () Bool)

(declare-fun e!84307 () Bool)

(assert (=> mapNonEmpty!4564 (= mapRes!4564 (and tp!11067 e!84307))))

(declare-fun mapRest!4564 () (Array (_ BitVec 32) ValueCell!1085))

(declare-fun mapKey!4564 () (_ BitVec 32))

(declare-fun mapValue!4563 () ValueCell!1085)

(assert (=> mapNonEmpty!4564 (= (arr!2242 (_values!2806 (v!3160 (underlying!447 thiss!992)))) (store mapRest!4564 mapKey!4564 mapValue!4563))))

(declare-fun b!129158 () Bool)

(declare-fun e!84303 () Bool)

(assert (=> b!129158 (= e!84304 e!84303)))

(declare-fun res!62351 () Bool)

(assert (=> b!129158 (=> (not res!62351) (not e!84303))))

(declare-fun contains!888 (ListLongMap!1695 (_ BitVec 64)) Bool)

(assert (=> b!129158 (= res!62351 (contains!888 lt!66997 (select (arr!2241 (_keys!4564 (v!3160 (underlying!447 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2606 0))(
  ( (tuple2!2607 (_1!1314 Bool) (_2!1314 LongMapFixedSize!1078)) )
))
(declare-fun lt!66996 () tuple2!2606)

(declare-fun update!189 (LongMapFixedSize!1078 (_ BitVec 64) V!3457) tuple2!2606)

(declare-fun get!1462 (ValueCell!1085 V!3457) V!3457)

(declare-fun dynLambda!420 (Int (_ BitVec 64)) V!3457)

(assert (=> b!129158 (= lt!66996 (update!189 newMap!16 (select (arr!2241 (_keys!4564 (v!3160 (underlying!447 thiss!992)))) from!355) (get!1462 (select (arr!2242 (_values!2806 (v!3160 (underlying!447 thiss!992)))) from!355) (dynLambda!420 (defaultEntry!2823 (v!3160 (underlying!447 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129159 () Bool)

(declare-fun e!84305 () Bool)

(assert (=> b!129159 (= e!84305 e!84309)))

(declare-fun b!129160 () Bool)

(declare-fun e!84311 () Bool)

(declare-fun e!84299 () Bool)

(assert (=> b!129160 (= e!84311 (and e!84299 mapRes!4563))))

(declare-fun condMapEmpty!4564 () Bool)

(declare-fun mapDefault!4564 () ValueCell!1085)

