; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13828 () Bool)

(assert start!13828)

(declare-fun b!127705 () Bool)

(declare-fun b_free!2877 () Bool)

(declare-fun b_next!2877 () Bool)

(assert (=> b!127705 (= b_free!2877 (not b_next!2877))))

(declare-fun tp!11047 () Bool)

(declare-fun b_and!7891 () Bool)

(assert (=> b!127705 (= tp!11047 b_and!7891)))

(declare-fun b!127702 () Bool)

(declare-fun b_free!2879 () Bool)

(declare-fun b_next!2879 () Bool)

(assert (=> b!127702 (= b_free!2879 (not b_next!2879))))

(declare-fun tp!11048 () Bool)

(declare-fun b_and!7893 () Bool)

(assert (=> b!127702 (= tp!11048 b_and!7893)))

(declare-fun mapNonEmpty!4549 () Bool)

(declare-fun mapRes!4550 () Bool)

(declare-fun tp!11046 () Bool)

(declare-fun e!83433 () Bool)

(assert (=> mapNonEmpty!4549 (= mapRes!4550 (and tp!11046 e!83433))))

(declare-datatypes ((V!3453 0))(
  ( (V!3454 (val!1472 Int)) )
))
(declare-datatypes ((ValueCell!1084 0))(
  ( (ValueCellFull!1084 (v!3147 V!3453)) (EmptyCell!1084) )
))
(declare-fun mapRest!4549 () (Array (_ BitVec 32) ValueCell!1084))

(declare-fun mapKey!4549 () (_ BitVec 32))

(declare-datatypes ((array!4729 0))(
  ( (array!4730 (arr!2239 (Array (_ BitVec 32) (_ BitVec 64))) (size!2504 (_ BitVec 32))) )
))
(declare-datatypes ((array!4731 0))(
  ( (array!4732 (arr!2240 (Array (_ BitVec 32) ValueCell!1084)) (size!2505 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1076 0))(
  ( (LongMapFixedSize!1077 (defaultEntry!2806 Int) (mask!7074 (_ BitVec 32)) (extraKeys!2583 (_ BitVec 32)) (zeroValue!2667 V!3453) (minValue!2667 V!3453) (_size!587 (_ BitVec 32)) (_keys!4543 array!4729) (_values!2789 array!4731) (_vacant!587 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1076)

(declare-fun mapValue!4549 () ValueCell!1084)

(assert (=> mapNonEmpty!4549 (= (arr!2240 (_values!2789 newMap!16)) (store mapRest!4549 mapKey!4549 mapValue!4549))))

(declare-fun b!127697 () Bool)

(declare-fun res!61717 () Bool)

(declare-fun e!83419 () Bool)

(assert (=> b!127697 (=> (not res!61717) (not e!83419))))

(declare-datatypes ((Cell!870 0))(
  ( (Cell!871 (v!3148 LongMapFixedSize!1076)) )
))
(declare-datatypes ((LongMap!870 0))(
  ( (LongMap!871 (underlying!446 Cell!870)) )
))
(declare-fun thiss!992 () LongMap!870)

(assert (=> b!127697 (= res!61717 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7074 newMap!16)) (_size!587 (v!3148 (underlying!446 thiss!992)))))))

(declare-fun b!127699 () Bool)

(declare-fun e!83430 () Bool)

(declare-fun tp_is_empty!2855 () Bool)

(assert (=> b!127699 (= e!83430 tp_is_empty!2855)))

(declare-fun b!127700 () Bool)

(declare-fun e!83431 () Bool)

(assert (=> b!127700 (= e!83431 (and (= (size!2505 (_values!2789 (v!3148 (underlying!446 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7074 (v!3148 (underlying!446 thiss!992))))) (= (size!2504 (_keys!4543 (v!3148 (underlying!446 thiss!992)))) (size!2505 (_values!2789 (v!3148 (underlying!446 thiss!992))))) (bvsge (mask!7074 (v!3148 (underlying!446 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2583 (v!3148 (underlying!446 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!4549 () Bool)

(assert (=> mapIsEmpty!4549 mapRes!4550))

(declare-fun b!127701 () Bool)

(assert (=> b!127701 (= e!83433 tp_is_empty!2855)))

(declare-fun e!83425 () Bool)

(declare-fun e!83420 () Bool)

(declare-fun array_inv!1409 (array!4729) Bool)

(declare-fun array_inv!1410 (array!4731) Bool)

(assert (=> b!127702 (= e!83425 (and tp!11048 tp_is_empty!2855 (array_inv!1409 (_keys!4543 newMap!16)) (array_inv!1410 (_values!2789 newMap!16)) e!83420))))

(declare-fun b!127703 () Bool)

(declare-fun res!61720 () Bool)

(assert (=> b!127703 (=> (not res!61720) (not e!83431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127703 (= res!61720 (validMask!0 (mask!7074 (v!3148 (underlying!446 thiss!992)))))))

(declare-fun b!127704 () Bool)

(declare-fun e!83424 () Bool)

(assert (=> b!127704 (= e!83424 e!83431)))

(declare-fun res!61718 () Bool)

(assert (=> b!127704 (=> (not res!61718) (not e!83431))))

(declare-datatypes ((tuple2!2600 0))(
  ( (tuple2!2601 (_1!1311 (_ BitVec 64)) (_2!1311 V!3453)) )
))
(declare-datatypes ((List!1705 0))(
  ( (Nil!1702) (Cons!1701 (h!2304 tuple2!2600) (t!6088 List!1705)) )
))
(declare-datatypes ((ListLongMap!1693 0))(
  ( (ListLongMap!1694 (toList!862 List!1705)) )
))
(declare-fun lt!66001 () ListLongMap!1693)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!885 (ListLongMap!1693 (_ BitVec 64)) Bool)

(assert (=> b!127704 (= res!61718 (contains!885 lt!66001 (select (arr!2239 (_keys!4543 (v!3148 (underlying!446 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2602 0))(
  ( (tuple2!2603 (_1!1312 Bool) (_2!1312 LongMapFixedSize!1076)) )
))
(declare-fun lt!66000 () tuple2!2602)

(declare-fun update!188 (LongMapFixedSize!1076 (_ BitVec 64) V!3453) tuple2!2602)

(declare-fun get!1456 (ValueCell!1084 V!3453) V!3453)

(declare-fun dynLambda!419 (Int (_ BitVec 64)) V!3453)

(assert (=> b!127704 (= lt!66000 (update!188 newMap!16 (select (arr!2239 (_keys!4543 (v!3148 (underlying!446 thiss!992)))) from!355) (get!1456 (select (arr!2240 (_values!2789 (v!3148 (underlying!446 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2806 (v!3148 (underlying!446 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!83428 () Bool)

(declare-fun e!83429 () Bool)

(assert (=> b!127705 (= e!83428 (and tp!11047 tp_is_empty!2855 (array_inv!1409 (_keys!4543 (v!3148 (underlying!446 thiss!992)))) (array_inv!1410 (_values!2789 (v!3148 (underlying!446 thiss!992)))) e!83429))))

(declare-fun b!127706 () Bool)

(declare-fun e!83421 () Bool)

(assert (=> b!127706 (= e!83420 (and e!83421 mapRes!4550))))

(declare-fun condMapEmpty!4549 () Bool)

(declare-fun mapDefault!4549 () ValueCell!1084)

