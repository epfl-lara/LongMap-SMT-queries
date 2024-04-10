; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15268 () Bool)

(assert start!15268)

(declare-fun b!147455 () Bool)

(declare-fun b_free!3169 () Bool)

(declare-fun b_next!3169 () Bool)

(assert (=> b!147455 (= b_free!3169 (not b_next!3169))))

(declare-fun tp!12013 () Bool)

(declare-fun b_and!9275 () Bool)

(assert (=> b!147455 (= tp!12013 b_and!9275)))

(declare-fun b!147454 () Bool)

(declare-fun b_free!3171 () Bool)

(declare-fun b_next!3171 () Bool)

(assert (=> b!147454 (= b_free!3171 (not b_next!3171))))

(declare-fun tp!12016 () Bool)

(declare-fun b_and!9277 () Bool)

(assert (=> b!147454 (= tp!12016 b_and!9277)))

(declare-fun res!70055 () Bool)

(declare-fun e!96343 () Bool)

(assert (=> start!15268 (=> (not res!70055) (not e!96343))))

(declare-datatypes ((V!3649 0))(
  ( (V!3650 (val!1545 Int)) )
))
(declare-datatypes ((array!5049 0))(
  ( (array!5050 (arr!2385 (Array (_ BitVec 32) (_ BitVec 64))) (size!2661 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1157 0))(
  ( (ValueCellFull!1157 (v!3381 V!3649)) (EmptyCell!1157) )
))
(declare-datatypes ((array!5051 0))(
  ( (array!5052 (arr!2386 (Array (_ BitVec 32) ValueCell!1157)) (size!2662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1222 0))(
  ( (LongMapFixedSize!1223 (defaultEntry!3030 Int) (mask!7416 (_ BitVec 32)) (extraKeys!2775 (_ BitVec 32)) (zeroValue!2875 V!3649) (minValue!2875 V!3649) (_size!660 (_ BitVec 32)) (_keys!4799 array!5049) (_values!3013 array!5051) (_vacant!660 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1004 0))(
  ( (Cell!1005 (v!3382 LongMapFixedSize!1222)) )
))
(declare-datatypes ((LongMap!1004 0))(
  ( (LongMap!1005 (underlying!513 Cell!1004)) )
))
(declare-fun thiss!992 () LongMap!1004)

(declare-fun valid!598 (LongMap!1004) Bool)

(assert (=> start!15268 (= res!70055 (valid!598 thiss!992))))

(assert (=> start!15268 e!96343))

(declare-fun e!96345 () Bool)

(assert (=> start!15268 e!96345))

(assert (=> start!15268 true))

(declare-fun e!96346 () Bool)

(assert (=> start!15268 e!96346))

(declare-fun b!147451 () Bool)

(declare-fun res!70061 () Bool)

(assert (=> b!147451 (=> (not res!70061) (not e!96343))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!147451 (= res!70061 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2661 (_keys!4799 (v!3382 (underlying!513 thiss!992)))))))))

(declare-fun b!147452 () Bool)

(declare-fun e!96338 () Bool)

(declare-fun tp_is_empty!3001 () Bool)

(assert (=> b!147452 (= e!96338 tp_is_empty!3001)))

(declare-fun b!147453 () Bool)

(declare-fun e!96344 () Bool)

(assert (=> b!147453 (= e!96345 e!96344)))

(declare-fun e!96348 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1222)

(declare-fun array_inv!1501 (array!5049) Bool)

(declare-fun array_inv!1502 (array!5051) Bool)

(assert (=> b!147454 (= e!96346 (and tp!12016 tp_is_empty!3001 (array_inv!1501 (_keys!4799 newMap!16)) (array_inv!1502 (_values!3013 newMap!16)) e!96348))))

(declare-fun e!96342 () Bool)

(declare-fun e!96335 () Bool)

(assert (=> b!147455 (= e!96335 (and tp!12013 tp_is_empty!3001 (array_inv!1501 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) (array_inv!1502 (_values!3013 (v!3382 (underlying!513 thiss!992)))) e!96342))))

(declare-fun b!147456 () Bool)

(declare-fun e!96337 () Bool)

(declare-fun e!96347 () Bool)

(assert (=> b!147456 (= e!96337 e!96347)))

(declare-fun res!70062 () Bool)

(assert (=> b!147456 (=> (not res!70062) (not e!96347))))

(declare-datatypes ((tuple2!2794 0))(
  ( (tuple2!2795 (_1!1408 Bool) (_2!1408 LongMapFixedSize!1222)) )
))
(declare-fun lt!77835 () tuple2!2794)

(assert (=> b!147456 (= res!70062 (and (_1!1408 lt!77835) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!4664 0))(
  ( (Unit!4665) )
))
(declare-fun lt!77830 () Unit!4664)

(declare-fun e!96334 () Unit!4664)

(assert (=> b!147456 (= lt!77830 e!96334)))

(declare-fun c!27773 () Bool)

(declare-datatypes ((tuple2!2796 0))(
  ( (tuple2!2797 (_1!1409 (_ BitVec 64)) (_2!1409 V!3649)) )
))
(declare-datatypes ((List!1793 0))(
  ( (Nil!1790) (Cons!1789 (h!2397 tuple2!2796) (t!6546 List!1793)) )
))
(declare-datatypes ((ListLongMap!1797 0))(
  ( (ListLongMap!1798 (toList!914 List!1793)) )
))
(declare-fun lt!77832 () ListLongMap!1797)

(declare-fun contains!959 (ListLongMap!1797 (_ BitVec 64)) Bool)

(assert (=> b!147456 (= c!27773 (contains!959 lt!77832 (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355)))))

(declare-fun lt!77844 () V!3649)

(declare-fun update!232 (LongMapFixedSize!1222 (_ BitVec 64) V!3649) tuple2!2794)

(assert (=> b!147456 (= lt!77835 (update!232 newMap!16 (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355) lt!77844))))

(declare-fun mapIsEmpty!5079 () Bool)

(declare-fun mapRes!5080 () Bool)

(assert (=> mapIsEmpty!5079 mapRes!5080))

(declare-fun b!147457 () Bool)

(declare-fun e!96350 () Bool)

(assert (=> b!147457 (= e!96350 tp_is_empty!3001)))

(declare-fun b!147458 () Bool)

(declare-fun Unit!4666 () Unit!4664)

(assert (=> b!147458 (= e!96334 Unit!4666)))

(declare-fun lt!77841 () Unit!4664)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!159 (array!5049 array!5051 (_ BitVec 32) (_ BitVec 32) V!3649 V!3649 (_ BitVec 64) (_ BitVec 32) Int) Unit!4664)

(assert (=> b!147458 (= lt!77841 (lemmaListMapContainsThenArrayContainsFrom!159 (_keys!4799 (v!3382 (underlying!513 thiss!992))) (_values!3013 (v!3382 (underlying!513 thiss!992))) (mask!7416 (v!3382 (underlying!513 thiss!992))) (extraKeys!2775 (v!3382 (underlying!513 thiss!992))) (zeroValue!2875 (v!3382 (underlying!513 thiss!992))) (minValue!2875 (v!3382 (underlying!513 thiss!992))) (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3030 (v!3382 (underlying!513 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147458 (arrayContainsKey!0 (_keys!4799 (v!3382 (underlying!513 thiss!992))) (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77834 () Unit!4664)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5049 (_ BitVec 32) (_ BitVec 32)) Unit!4664)

(assert (=> b!147458 (= lt!77834 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4799 (v!3382 (underlying!513 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1794 0))(
  ( (Nil!1791) (Cons!1790 (h!2398 (_ BitVec 64)) (t!6547 List!1794)) )
))
(declare-fun arrayNoDuplicates!0 (array!5049 (_ BitVec 32) List!1794) Bool)

(assert (=> b!147458 (arrayNoDuplicates!0 (_keys!4799 (v!3382 (underlying!513 thiss!992))) from!355 Nil!1791)))

(declare-fun lt!77839 () Unit!4664)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5049 (_ BitVec 32) (_ BitVec 64) List!1794) Unit!4664)

(assert (=> b!147458 (= lt!77839 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4799 (v!3382 (underlying!513 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355) (Cons!1790 (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355) Nil!1791)))))

(assert (=> b!147458 false))

(declare-fun b!147459 () Bool)

(declare-fun e!96339 () Bool)

(assert (=> b!147459 (= e!96343 e!96339)))

(declare-fun res!70060 () Bool)

(assert (=> b!147459 (=> (not res!70060) (not e!96339))))

(declare-fun lt!77840 () ListLongMap!1797)

(assert (=> b!147459 (= res!70060 (= lt!77840 lt!77832))))

(declare-fun map!1487 (LongMapFixedSize!1222) ListLongMap!1797)

(assert (=> b!147459 (= lt!77832 (map!1487 newMap!16))))

(declare-fun getCurrentListMap!581 (array!5049 array!5051 (_ BitVec 32) (_ BitVec 32) V!3649 V!3649 (_ BitVec 32) Int) ListLongMap!1797)

(assert (=> b!147459 (= lt!77840 (getCurrentListMap!581 (_keys!4799 (v!3382 (underlying!513 thiss!992))) (_values!3013 (v!3382 (underlying!513 thiss!992))) (mask!7416 (v!3382 (underlying!513 thiss!992))) (extraKeys!2775 (v!3382 (underlying!513 thiss!992))) (zeroValue!2875 (v!3382 (underlying!513 thiss!992))) (minValue!2875 (v!3382 (underlying!513 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3030 (v!3382 (underlying!513 thiss!992)))))))

(declare-fun b!147460 () Bool)

(assert (=> b!147460 (= e!96344 e!96335)))

(declare-fun b!147461 () Bool)

(assert (=> b!147461 (= e!96339 e!96337)))

(declare-fun res!70057 () Bool)

(assert (=> b!147461 (=> (not res!70057) (not e!96337))))

(assert (=> b!147461 (= res!70057 (and (not (= (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2385 (_keys!4799 (v!3382 (underlying!513 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1591 (ValueCell!1157 V!3649) V!3649)

(declare-fun dynLambda!465 (Int (_ BitVec 64)) V!3649)

(assert (=> b!147461 (= lt!77844 (get!1591 (select (arr!2386 (_values!3013 (v!3382 (underlying!513 thiss!992)))) from!355) (dynLambda!465 (defaultEntry!3030 (v!3382 (underlying!513 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!147462 () Bool)

(declare-fun res!70058 () Bool)

(assert (=> b!147462 (=> (not res!70058) (not e!96343))))

(assert (=> b!147462 (= res!70058 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7416 newMap!16)) (_size!660 (v!3382 (underlying!513 thiss!992)))))))

(declare-fun b!147463 () Bool)

(declare-fun mapRes!5079 () Bool)

(assert (=> b!147463 (= e!96342 (and e!96338 mapRes!5079))))

(declare-fun condMapEmpty!5079 () Bool)

(declare-fun mapDefault!5080 () ValueCell!1157)

