; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12354 () Bool)

(assert start!12354)

(declare-fun b!105352 () Bool)

(declare-fun b_free!2529 () Bool)

(declare-fun b_next!2529 () Bool)

(assert (=> b!105352 (= b_free!2529 (not b_next!2529))))

(declare-fun tp!9910 () Bool)

(declare-fun b_and!6511 () Bool)

(assert (=> b!105352 (= tp!9910 b_and!6511)))

(declare-fun b!105365 () Bool)

(declare-fun b_free!2531 () Bool)

(declare-fun b_next!2531 () Bool)

(assert (=> b!105365 (= b_free!2531 (not b_next!2531))))

(declare-fun tp!9909 () Bool)

(declare-fun b_and!6513 () Bool)

(assert (=> b!105365 (= tp!9909 b_and!6513)))

(declare-fun mapNonEmpty!3935 () Bool)

(declare-fun mapRes!3935 () Bool)

(declare-fun tp!9912 () Bool)

(declare-fun e!68622 () Bool)

(assert (=> mapNonEmpty!3935 (= mapRes!3935 (and tp!9912 e!68622))))

(declare-datatypes ((V!3221 0))(
  ( (V!3222 (val!1385 Int)) )
))
(declare-datatypes ((ValueCell!997 0))(
  ( (ValueCellFull!997 (v!2893 V!3221)) (EmptyCell!997) )
))
(declare-fun mapValue!3936 () ValueCell!997)

(declare-fun mapKey!3936 () (_ BitVec 32))

(declare-fun mapRest!3935 () (Array (_ BitVec 32) ValueCell!997))

(declare-datatypes ((array!4353 0))(
  ( (array!4354 (arr!2065 (Array (_ BitVec 32) (_ BitVec 64))) (size!2320 (_ BitVec 32))) )
))
(declare-datatypes ((array!4355 0))(
  ( (array!4356 (arr!2066 (Array (_ BitVec 32) ValueCell!997)) (size!2321 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!902 0))(
  ( (LongMapFixedSize!903 (defaultEntry!2583 Int) (mask!6729 (_ BitVec 32)) (extraKeys!2388 (_ BitVec 32)) (zeroValue!2458 V!3221) (minValue!2458 V!3221) (_size!500 (_ BitVec 32)) (_keys!4289 array!4353) (_values!2566 array!4355) (_vacant!500 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!702 0))(
  ( (Cell!703 (v!2894 LongMapFixedSize!902)) )
))
(declare-datatypes ((LongMap!702 0))(
  ( (LongMap!703 (underlying!362 Cell!702)) )
))
(declare-fun thiss!992 () LongMap!702)

(assert (=> mapNonEmpty!3935 (= (arr!2066 (_values!2566 (v!2894 (underlying!362 thiss!992)))) (store mapRest!3935 mapKey!3936 mapValue!3936))))

(declare-fun b!105346 () Bool)

(declare-fun tp_is_empty!2681 () Bool)

(assert (=> b!105346 (= e!68622 tp_is_empty!2681)))

(declare-fun b!105347 () Bool)

(declare-fun e!68624 () Bool)

(declare-fun e!68610 () Bool)

(assert (=> b!105347 (= e!68624 e!68610)))

(declare-fun b!105348 () Bool)

(declare-fun e!68607 () Bool)

(declare-fun e!68611 () Bool)

(assert (=> b!105348 (= e!68607 (not e!68611))))

(declare-fun res!52465 () Bool)

(assert (=> b!105348 (=> res!52465 e!68611)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!105348 (= res!52465 (not (validMask!0 (mask!6729 (v!2894 (underlying!362 thiss!992))))))))

(declare-datatypes ((tuple2!2414 0))(
  ( (tuple2!2415 (_1!1218 (_ BitVec 64)) (_2!1218 V!3221)) )
))
(declare-datatypes ((List!1618 0))(
  ( (Nil!1615) (Cons!1614 (h!2211 tuple2!2414) (t!5705 List!1618)) )
))
(declare-datatypes ((ListLongMap!1577 0))(
  ( (ListLongMap!1578 (toList!804 List!1618)) )
))
(declare-fun lt!53848 () ListLongMap!1577)

(declare-fun lt!53841 () tuple2!2414)

(declare-fun lt!53846 () tuple2!2414)

(declare-fun +!145 (ListLongMap!1577 tuple2!2414) ListLongMap!1577)

(assert (=> b!105348 (= (+!145 (+!145 lt!53848 lt!53841) lt!53846) (+!145 (+!145 lt!53848 lt!53846) lt!53841))))

(assert (=> b!105348 (= lt!53846 (tuple2!2415 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2458 (v!2894 (underlying!362 thiss!992)))))))

(declare-fun lt!53850 () V!3221)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!105348 (= lt!53841 (tuple2!2415 (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) lt!53850))))

(declare-datatypes ((Unit!3236 0))(
  ( (Unit!3237) )
))
(declare-fun lt!53845 () Unit!3236)

(declare-fun addCommutativeForDiffKeys!57 (ListLongMap!1577 (_ BitVec 64) V!3221 (_ BitVec 64) V!3221) Unit!3236)

(assert (=> b!105348 (= lt!53845 (addCommutativeForDiffKeys!57 lt!53848 (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) lt!53850 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2458 (v!2894 (underlying!362 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!111 (array!4353 array!4355 (_ BitVec 32) (_ BitVec 32) V!3221 V!3221 (_ BitVec 32) Int) ListLongMap!1577)

(assert (=> b!105348 (= lt!53848 (getCurrentListMapNoExtraKeys!111 (_keys!4289 (v!2894 (underlying!362 thiss!992))) (_values!2566 (v!2894 (underlying!362 thiss!992))) (mask!6729 (v!2894 (underlying!362 thiss!992))) (extraKeys!2388 (v!2894 (underlying!362 thiss!992))) (zeroValue!2458 (v!2894 (underlying!362 thiss!992))) (minValue!2458 (v!2894 (underlying!362 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2583 (v!2894 (underlying!362 thiss!992)))))))

(declare-fun b!105349 () Bool)

(declare-fun e!68623 () Bool)

(assert (=> b!105349 (= e!68623 tp_is_empty!2681)))

(declare-fun b!105350 () Bool)

(declare-fun e!68619 () Bool)

(declare-fun e!68615 () Bool)

(assert (=> b!105350 (= e!68619 e!68615)))

(declare-fun res!52459 () Bool)

(assert (=> b!105350 (=> (not res!52459) (not e!68615))))

(assert (=> b!105350 (= res!52459 (and (not (= (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1331 (ValueCell!997 V!3221) V!3221)

(declare-fun dynLambda!386 (Int (_ BitVec 64)) V!3221)

(assert (=> b!105350 (= lt!53850 (get!1331 (select (arr!2066 (_values!2566 (v!2894 (underlying!362 thiss!992)))) from!355) (dynLambda!386 (defaultEntry!2583 (v!2894 (underlying!362 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!105351 () Bool)

(declare-fun e!68608 () Bool)

(assert (=> b!105351 (= e!68608 tp_is_empty!2681)))

(declare-fun e!68621 () Bool)

(declare-fun array_inv!1301 (array!4353) Bool)

(declare-fun array_inv!1302 (array!4355) Bool)

(assert (=> b!105352 (= e!68610 (and tp!9910 tp_is_empty!2681 (array_inv!1301 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) (array_inv!1302 (_values!2566 (v!2894 (underlying!362 thiss!992)))) e!68621))))

(declare-fun mapNonEmpty!3936 () Bool)

(declare-fun mapRes!3936 () Bool)

(declare-fun tp!9911 () Bool)

(assert (=> mapNonEmpty!3936 (= mapRes!3936 (and tp!9911 e!68608))))

(declare-fun mapKey!3935 () (_ BitVec 32))

(declare-fun mapRest!3936 () (Array (_ BitVec 32) ValueCell!997))

(declare-fun mapValue!3935 () ValueCell!997)

(declare-fun newMap!16 () LongMapFixedSize!902)

(assert (=> mapNonEmpty!3936 (= (arr!2066 (_values!2566 newMap!16)) (store mapRest!3936 mapKey!3935 mapValue!3935))))

(declare-fun res!52466 () Bool)

(declare-fun e!68613 () Bool)

(assert (=> start!12354 (=> (not res!52466) (not e!68613))))

(declare-fun valid!422 (LongMap!702) Bool)

(assert (=> start!12354 (= res!52466 (valid!422 thiss!992))))

(assert (=> start!12354 e!68613))

(declare-fun e!68620 () Bool)

(assert (=> start!12354 e!68620))

(assert (=> start!12354 true))

(declare-fun e!68614 () Bool)

(assert (=> start!12354 e!68614))

(declare-fun b!105353 () Bool)

(declare-fun res!52461 () Bool)

(assert (=> b!105353 (=> (not res!52461) (not e!68613))))

(assert (=> b!105353 (= res!52461 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2320 (_keys!4289 (v!2894 (underlying!362 thiss!992)))))))))

(declare-fun mapIsEmpty!3935 () Bool)

(assert (=> mapIsEmpty!3935 mapRes!3935))

(declare-fun b!105354 () Bool)

(declare-fun e!68609 () Unit!3236)

(declare-fun Unit!3238 () Unit!3236)

(assert (=> b!105354 (= e!68609 Unit!3238)))

(declare-fun b!105355 () Bool)

(declare-fun e!68616 () Bool)

(assert (=> b!105355 (= e!68616 tp_is_empty!2681)))

(declare-fun b!105356 () Bool)

(declare-fun Unit!3239 () Unit!3236)

(assert (=> b!105356 (= e!68609 Unit!3239)))

(declare-fun lt!53843 () Unit!3236)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!106 (array!4353 array!4355 (_ BitVec 32) (_ BitVec 32) V!3221 V!3221 (_ BitVec 64) (_ BitVec 32) Int) Unit!3236)

(assert (=> b!105356 (= lt!53843 (lemmaListMapContainsThenArrayContainsFrom!106 (_keys!4289 (v!2894 (underlying!362 thiss!992))) (_values!2566 (v!2894 (underlying!362 thiss!992))) (mask!6729 (v!2894 (underlying!362 thiss!992))) (extraKeys!2388 (v!2894 (underlying!362 thiss!992))) (zeroValue!2458 (v!2894 (underlying!362 thiss!992))) (minValue!2458 (v!2894 (underlying!362 thiss!992))) (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2583 (v!2894 (underlying!362 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!105356 (arrayContainsKey!0 (_keys!4289 (v!2894 (underlying!362 thiss!992))) (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!53842 () Unit!3236)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4353 (_ BitVec 32) (_ BitVec 32)) Unit!3236)

(assert (=> b!105356 (= lt!53842 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4289 (v!2894 (underlying!362 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1619 0))(
  ( (Nil!1616) (Cons!1615 (h!2212 (_ BitVec 64)) (t!5706 List!1619)) )
))
(declare-fun arrayNoDuplicates!0 (array!4353 (_ BitVec 32) List!1619) Bool)

(assert (=> b!105356 (arrayNoDuplicates!0 (_keys!4289 (v!2894 (underlying!362 thiss!992))) from!355 Nil!1616)))

(declare-fun lt!53851 () Unit!3236)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4353 (_ BitVec 32) (_ BitVec 64) List!1619) Unit!3236)

(assert (=> b!105356 (= lt!53851 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4289 (v!2894 (underlying!362 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) (Cons!1615 (select (arr!2065 (_keys!4289 (v!2894 (underlying!362 thiss!992)))) from!355) Nil!1616)))))

(assert (=> b!105356 false))

(declare-fun b!105357 () Bool)

(assert (=> b!105357 (= e!68620 e!68624)))

(declare-fun b!105358 () Bool)

(assert (=> b!105358 (= e!68621 (and e!68616 mapRes!3935))))

(declare-fun condMapEmpty!3935 () Bool)

(declare-fun mapDefault!3936 () ValueCell!997)

