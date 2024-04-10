; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14180 () Bool)

(assert start!14180)

(declare-fun b!131588 () Bool)

(declare-fun b_free!2913 () Bool)

(declare-fun b_next!2913 () Bool)

(assert (=> b!131588 (= b_free!2913 (not b_next!2913))))

(declare-fun tp!11176 () Bool)

(declare-fun b_and!8155 () Bool)

(assert (=> b!131588 (= tp!11176 b_and!8155)))

(declare-fun b!131595 () Bool)

(declare-fun b_free!2915 () Bool)

(declare-fun b_next!2915 () Bool)

(assert (=> b!131595 (= b_free!2915 (not b_next!2915))))

(declare-fun tp!11175 () Bool)

(declare-fun b_and!8157 () Bool)

(assert (=> b!131595 (= tp!11175 b_and!8157)))

(declare-fun mapIsEmpty!4625 () Bool)

(declare-fun mapRes!4625 () Bool)

(assert (=> mapIsEmpty!4625 mapRes!4625))

(declare-fun b!131580 () Bool)

(declare-fun e!85829 () Bool)

(declare-fun e!85835 () Bool)

(assert (=> b!131580 (= e!85829 e!85835)))

(declare-fun res!63411 () Bool)

(assert (=> b!131580 (=> (not res!63411) (not e!85835))))

(declare-datatypes ((V!3477 0))(
  ( (V!3478 (val!1481 Int)) )
))
(declare-datatypes ((array!4771 0))(
  ( (array!4772 (arr!2257 (Array (_ BitVec 32) (_ BitVec 64))) (size!2525 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1093 0))(
  ( (ValueCellFull!1093 (v!3188 V!3477)) (EmptyCell!1093) )
))
(declare-datatypes ((array!4773 0))(
  ( (array!4774 (arr!2258 (Array (_ BitVec 32) ValueCell!1093)) (size!2526 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1094 0))(
  ( (LongMapFixedSize!1095 (defaultEntry!2855 Int) (mask!7149 (_ BitVec 32)) (extraKeys!2622 (_ BitVec 32)) (zeroValue!2711 V!3477) (minValue!2711 V!3477) (_size!596 (_ BitVec 32)) (_keys!4602 array!4771) (_values!2838 array!4773) (_vacant!596 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!884 0))(
  ( (Cell!885 (v!3189 LongMapFixedSize!1094)) )
))
(declare-datatypes ((LongMap!884 0))(
  ( (LongMap!885 (underlying!453 Cell!884)) )
))
(declare-fun thiss!992 () LongMap!884)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2622 0))(
  ( (tuple2!2623 (_1!1322 (_ BitVec 64)) (_2!1322 V!3477)) )
))
(declare-datatypes ((List!1715 0))(
  ( (Nil!1712) (Cons!1711 (h!2316 tuple2!2622) (t!6154 List!1715)) )
))
(declare-datatypes ((ListLongMap!1705 0))(
  ( (ListLongMap!1706 (toList!868 List!1715)) )
))
(declare-fun lt!68530 () ListLongMap!1705)

(declare-fun contains!896 (ListLongMap!1705 (_ BitVec 64)) Bool)

(assert (=> b!131580 (= res!63411 (contains!896 lt!68530 (select (arr!2257 (_keys!4602 (v!3189 (underlying!453 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!1094)

(declare-datatypes ((tuple2!2624 0))(
  ( (tuple2!2625 (_1!1323 Bool) (_2!1323 LongMapFixedSize!1094)) )
))
(declare-fun lt!68528 () tuple2!2624)

(declare-fun update!193 (LongMapFixedSize!1094 (_ BitVec 64) V!3477) tuple2!2624)

(declare-fun get!1476 (ValueCell!1093 V!3477) V!3477)

(declare-fun dynLambda!424 (Int (_ BitVec 64)) V!3477)

(assert (=> b!131580 (= lt!68528 (update!193 newMap!16 (select (arr!2257 (_keys!4602 (v!3189 (underlying!453 thiss!992)))) from!355) (get!1476 (select (arr!2258 (_values!2838 (v!3189 (underlying!453 thiss!992)))) from!355) (dynLambda!424 (defaultEntry!2855 (v!3189 (underlying!453 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!63408 () Bool)

(declare-fun e!85830 () Bool)

(assert (=> start!14180 (=> (not res!63408) (not e!85830))))

(declare-fun valid!521 (LongMap!884) Bool)

(assert (=> start!14180 (= res!63408 (valid!521 thiss!992))))

(assert (=> start!14180 e!85830))

(declare-fun e!85825 () Bool)

(assert (=> start!14180 e!85825))

(assert (=> start!14180 true))

(declare-fun e!85839 () Bool)

(assert (=> start!14180 e!85839))

(declare-fun mapIsEmpty!4626 () Bool)

(declare-fun mapRes!4626 () Bool)

(assert (=> mapIsEmpty!4626 mapRes!4626))

(declare-fun b!131581 () Bool)

(declare-fun res!63407 () Bool)

(assert (=> b!131581 (=> (not res!63407) (not e!85835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!131581 (= res!63407 (validMask!0 (mask!7149 (v!3189 (underlying!453 thiss!992)))))))

(declare-fun b!131582 () Bool)

(assert (=> b!131582 (= e!85830 e!85829)))

(declare-fun res!63414 () Bool)

(assert (=> b!131582 (=> (not res!63414) (not e!85829))))

(declare-fun lt!68529 () ListLongMap!1705)

(assert (=> b!131582 (= res!63414 (and (= lt!68529 lt!68530) (not (= (select (arr!2257 (_keys!4602 (v!3189 (underlying!453 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2257 (_keys!4602 (v!3189 (underlying!453 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1406 (LongMapFixedSize!1094) ListLongMap!1705)

(assert (=> b!131582 (= lt!68530 (map!1406 newMap!16))))

(declare-fun getCurrentListMap!545 (array!4771 array!4773 (_ BitVec 32) (_ BitVec 32) V!3477 V!3477 (_ BitVec 32) Int) ListLongMap!1705)

(assert (=> b!131582 (= lt!68529 (getCurrentListMap!545 (_keys!4602 (v!3189 (underlying!453 thiss!992))) (_values!2838 (v!3189 (underlying!453 thiss!992))) (mask!7149 (v!3189 (underlying!453 thiss!992))) (extraKeys!2622 (v!3189 (underlying!453 thiss!992))) (zeroValue!2711 (v!3189 (underlying!453 thiss!992))) (minValue!2711 (v!3189 (underlying!453 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2855 (v!3189 (underlying!453 thiss!992)))))))

(declare-fun b!131583 () Bool)

(declare-fun e!85833 () Bool)

(assert (=> b!131583 (= e!85825 e!85833)))

(declare-fun b!131584 () Bool)

(declare-fun e!85827 () Bool)

(declare-fun e!85836 () Bool)

(assert (=> b!131584 (= e!85827 (and e!85836 mapRes!4626))))

(declare-fun condMapEmpty!4626 () Bool)

(declare-fun mapDefault!4626 () ValueCell!1093)

