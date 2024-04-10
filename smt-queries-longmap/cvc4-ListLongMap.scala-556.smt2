; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15066 () Bool)

(assert start!15066)

(declare-fun b!144701 () Bool)

(declare-fun b_free!3069 () Bool)

(declare-fun b_next!3069 () Bool)

(assert (=> b!144701 (= b_free!3069 (not b_next!3069))))

(declare-fun tp!11699 () Bool)

(declare-fun b_and!9023 () Bool)

(assert (=> b!144701 (= tp!11699 b_and!9023)))

(declare-fun b!144705 () Bool)

(declare-fun b_free!3071 () Bool)

(declare-fun b_next!3071 () Bool)

(assert (=> b!144705 (= b_free!3071 (not b_next!3071))))

(declare-fun tp!11702 () Bool)

(declare-fun b_and!9025 () Bool)

(assert (=> b!144705 (= tp!11702 b_and!9025)))

(declare-fun b!144687 () Bool)

(declare-fun e!94303 () Bool)

(declare-fun e!94315 () Bool)

(assert (=> b!144687 (= e!94303 e!94315)))

(declare-fun b!144688 () Bool)

(declare-fun res!68927 () Bool)

(declare-fun e!94306 () Bool)

(assert (=> b!144688 (=> res!68927 e!94306)))

(declare-datatypes ((List!1760 0))(
  ( (Nil!1757) (Cons!1756 (h!2364 (_ BitVec 64)) (t!6409 List!1760)) )
))
(declare-fun lt!75972 () List!1760)

(declare-fun contains!938 (List!1760 (_ BitVec 64)) Bool)

(assert (=> b!144688 (= res!68927 (contains!938 lt!75972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!4915 () Bool)

(declare-fun mapRes!4916 () Bool)

(declare-fun tp!11701 () Bool)

(declare-fun e!94316 () Bool)

(assert (=> mapNonEmpty!4915 (= mapRes!4916 (and tp!11701 e!94316))))

(declare-fun mapKey!4915 () (_ BitVec 32))

(declare-datatypes ((V!3581 0))(
  ( (V!3582 (val!1520 Int)) )
))
(declare-datatypes ((ValueCell!1132 0))(
  ( (ValueCellFull!1132 (v!3321 V!3581)) (EmptyCell!1132) )
))
(declare-fun mapValue!4915 () ValueCell!1132)

(declare-fun mapRest!4916 () (Array (_ BitVec 32) ValueCell!1132))

(declare-datatypes ((array!4943 0))(
  ( (array!4944 (arr!2335 (Array (_ BitVec 32) (_ BitVec 64))) (size!2610 (_ BitVec 32))) )
))
(declare-datatypes ((array!4945 0))(
  ( (array!4946 (arr!2336 (Array (_ BitVec 32) ValueCell!1132)) (size!2611 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1172 0))(
  ( (LongMapFixedSize!1173 (defaultEntry!2990 Int) (mask!7354 (_ BitVec 32)) (extraKeys!2737 (_ BitVec 32)) (zeroValue!2836 V!3581) (minValue!2836 V!3581) (_size!635 (_ BitVec 32)) (_keys!4757 array!4943) (_values!2973 array!4945) (_vacant!635 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!956 0))(
  ( (Cell!957 (v!3322 LongMapFixedSize!1172)) )
))
(declare-datatypes ((LongMap!956 0))(
  ( (LongMap!957 (underlying!489 Cell!956)) )
))
(declare-fun thiss!992 () LongMap!956)

(assert (=> mapNonEmpty!4915 (= (arr!2336 (_values!2973 (v!3322 (underlying!489 thiss!992)))) (store mapRest!4916 mapKey!4915 mapValue!4915))))

(declare-fun res!68924 () Bool)

(declare-fun e!94309 () Bool)

(assert (=> start!15066 (=> (not res!68924) (not e!94309))))

(declare-fun valid!567 (LongMap!956) Bool)

(assert (=> start!15066 (= res!68924 (valid!567 thiss!992))))

(assert (=> start!15066 e!94309))

(declare-fun e!94307 () Bool)

(assert (=> start!15066 e!94307))

(assert (=> start!15066 true))

(declare-fun e!94314 () Bool)

(assert (=> start!15066 e!94314))

(declare-fun b!144689 () Bool)

(declare-fun e!94302 () Bool)

(declare-fun tp_is_empty!2951 () Bool)

(assert (=> b!144689 (= e!94302 tp_is_empty!2951)))

(declare-fun b!144690 () Bool)

(assert (=> b!144690 (= e!94307 e!94303)))

(declare-fun b!144691 () Bool)

(declare-fun res!68922 () Bool)

(assert (=> b!144691 (=> res!68922 e!94306)))

(assert (=> b!144691 (= res!68922 (contains!938 lt!75972 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144692 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!4943 (_ BitVec 32) List!1760) Bool)

(assert (=> b!144692 (= e!94306 (arrayNoDuplicates!0 (_keys!4757 (v!3322 (underlying!489 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!75972))))

(declare-fun b!144693 () Bool)

(declare-fun e!94313 () Bool)

(assert (=> b!144693 (= e!94313 (not e!94306))))

(declare-fun res!68923 () Bool)

(assert (=> b!144693 (=> res!68923 e!94306)))

(assert (=> b!144693 (= res!68923 (or (bvsge (size!2610 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2610 (_keys!4757 (v!3322 (underlying!489 thiss!992)))))))))

(assert (=> b!144693 (= lt!75972 (Cons!1756 (select (arr!2335 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) from!355) Nil!1757))))

(assert (=> b!144693 (arrayNoDuplicates!0 (_keys!4757 (v!3322 (underlying!489 thiss!992))) from!355 Nil!1757)))

(declare-datatypes ((Unit!4580 0))(
  ( (Unit!4581) )
))
(declare-fun lt!75973 () Unit!4580)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4943 (_ BitVec 32) (_ BitVec 32)) Unit!4580)

(assert (=> b!144693 (= lt!75973 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4757 (v!3322 (underlying!489 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144693 (arrayContainsKey!0 (_keys!4757 (v!3322 (underlying!489 thiss!992))) (select (arr!2335 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75975 () Unit!4580)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!146 (array!4943 array!4945 (_ BitVec 32) (_ BitVec 32) V!3581 V!3581 (_ BitVec 64) (_ BitVec 32) Int) Unit!4580)

(assert (=> b!144693 (= lt!75975 (lemmaListMapContainsThenArrayContainsFrom!146 (_keys!4757 (v!3322 (underlying!489 thiss!992))) (_values!2973 (v!3322 (underlying!489 thiss!992))) (mask!7354 (v!3322 (underlying!489 thiss!992))) (extraKeys!2737 (v!3322 (underlying!489 thiss!992))) (zeroValue!2836 (v!3322 (underlying!489 thiss!992))) (minValue!2836 (v!3322 (underlying!489 thiss!992))) (select (arr!2335 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2990 (v!3322 (underlying!489 thiss!992)))))))

(declare-fun mapNonEmpty!4916 () Bool)

(declare-fun mapRes!4915 () Bool)

(declare-fun tp!11700 () Bool)

(assert (=> mapNonEmpty!4916 (= mapRes!4915 (and tp!11700 e!94302))))

(declare-fun mapKey!4916 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!1172)

(declare-fun mapValue!4916 () ValueCell!1132)

(declare-fun mapRest!4915 () (Array (_ BitVec 32) ValueCell!1132))

(assert (=> mapNonEmpty!4916 (= (arr!2336 (_values!2973 newMap!16)) (store mapRest!4915 mapKey!4916 mapValue!4916))))

(declare-fun mapIsEmpty!4915 () Bool)

(assert (=> mapIsEmpty!4915 mapRes!4915))

(declare-fun b!144694 () Bool)

(declare-fun e!94304 () Bool)

(assert (=> b!144694 (= e!94309 e!94304)))

(declare-fun res!68919 () Bool)

(assert (=> b!144694 (=> (not res!68919) (not e!94304))))

(declare-datatypes ((tuple2!2726 0))(
  ( (tuple2!2727 (_1!1374 (_ BitVec 64)) (_2!1374 V!3581)) )
))
(declare-datatypes ((List!1761 0))(
  ( (Nil!1758) (Cons!1757 (h!2365 tuple2!2726) (t!6410 List!1761)) )
))
(declare-datatypes ((ListLongMap!1759 0))(
  ( (ListLongMap!1760 (toList!895 List!1761)) )
))
(declare-fun lt!75974 () ListLongMap!1759)

(declare-fun lt!75976 () ListLongMap!1759)

(assert (=> b!144694 (= res!68919 (and (= lt!75976 lt!75974) (not (= (select (arr!2335 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2335 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1452 (LongMapFixedSize!1172) ListLongMap!1759)

(assert (=> b!144694 (= lt!75974 (map!1452 newMap!16))))

(declare-fun getCurrentListMap!565 (array!4943 array!4945 (_ BitVec 32) (_ BitVec 32) V!3581 V!3581 (_ BitVec 32) Int) ListLongMap!1759)

(assert (=> b!144694 (= lt!75976 (getCurrentListMap!565 (_keys!4757 (v!3322 (underlying!489 thiss!992))) (_values!2973 (v!3322 (underlying!489 thiss!992))) (mask!7354 (v!3322 (underlying!489 thiss!992))) (extraKeys!2737 (v!3322 (underlying!489 thiss!992))) (zeroValue!2836 (v!3322 (underlying!489 thiss!992))) (minValue!2836 (v!3322 (underlying!489 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2990 (v!3322 (underlying!489 thiss!992)))))))

(declare-fun b!144695 () Bool)

(declare-fun e!94310 () Bool)

(assert (=> b!144695 (= e!94310 tp_is_empty!2951)))

(declare-fun b!144696 () Bool)

(assert (=> b!144696 (= e!94304 e!94313)))

(declare-fun res!68926 () Bool)

(assert (=> b!144696 (=> (not res!68926) (not e!94313))))

(declare-fun contains!939 (ListLongMap!1759 (_ BitVec 64)) Bool)

(assert (=> b!144696 (= res!68926 (contains!939 lt!75974 (select (arr!2335 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2728 0))(
  ( (tuple2!2729 (_1!1375 Bool) (_2!1375 LongMapFixedSize!1172)) )
))
(declare-fun lt!75971 () tuple2!2728)

(declare-fun update!218 (LongMapFixedSize!1172 (_ BitVec 64) V!3581) tuple2!2728)

(declare-fun get!1550 (ValueCell!1132 V!3581) V!3581)

(declare-fun dynLambda!449 (Int (_ BitVec 64)) V!3581)

(assert (=> b!144696 (= lt!75971 (update!218 newMap!16 (select (arr!2335 (_keys!4757 (v!3322 (underlying!489 thiss!992)))) from!355) (get!1550 (select (arr!2336 (_values!2973 (v!3322 (underlying!489 thiss!992)))) from!355) (dynLambda!449 (defaultEntry!2990 (v!3322 (underlying!489 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!144697 () Bool)

(declare-fun res!68928 () Bool)

(assert (=> b!144697 (=> (not res!68928) (not e!94309))))

(assert (=> b!144697 (= res!68928 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7354 newMap!16)) (_size!635 (v!3322 (underlying!489 thiss!992)))))))

(declare-fun b!144698 () Bool)

(assert (=> b!144698 (= e!94316 tp_is_empty!2951)))

(declare-fun b!144699 () Bool)

(declare-fun e!94305 () Bool)

(declare-fun e!94301 () Bool)

(assert (=> b!144699 (= e!94305 (and e!94301 mapRes!4915))))

(declare-fun condMapEmpty!4916 () Bool)

(declare-fun mapDefault!4916 () ValueCell!1132)

