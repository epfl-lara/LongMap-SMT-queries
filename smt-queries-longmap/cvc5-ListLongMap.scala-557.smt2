; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15154 () Bool)

(assert start!15154)

(declare-fun b!145419 () Bool)

(declare-fun b_free!3073 () Bool)

(declare-fun b_next!3073 () Bool)

(assert (=> b!145419 (= b_free!3073 (not b_next!3073))))

(declare-fun tp!11719 () Bool)

(declare-fun b_and!9059 () Bool)

(assert (=> b!145419 (= tp!11719 b_and!9059)))

(declare-fun b!145401 () Bool)

(declare-fun b_free!3075 () Bool)

(declare-fun b_next!3075 () Bool)

(assert (=> b!145401 (= b_free!3075 (not b_next!3075))))

(declare-fun tp!11720 () Bool)

(declare-fun b_and!9061 () Bool)

(assert (=> b!145401 (= tp!11720 b_and!9061)))

(declare-datatypes ((V!3585 0))(
  ( (V!3586 (val!1521 Int)) )
))
(declare-datatypes ((array!4949 0))(
  ( (array!4950 (arr!2337 (Array (_ BitVec 32) (_ BitVec 64))) (size!2613 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1133 0))(
  ( (ValueCellFull!1133 (v!3329 V!3585)) (EmptyCell!1133) )
))
(declare-datatypes ((array!4951 0))(
  ( (array!4952 (arr!2338 (Array (_ BitVec 32) ValueCell!1133)) (size!2614 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1174 0))(
  ( (LongMapFixedSize!1175 (defaultEntry!3001 Int) (mask!7371 (_ BitVec 32)) (extraKeys!2746 (_ BitVec 32)) (zeroValue!2846 V!3585) (minValue!2846 V!3585) (_size!636 (_ BitVec 32)) (_keys!4770 array!4949) (_values!2984 array!4951) (_vacant!636 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!958 0))(
  ( (Cell!959 (v!3330 LongMapFixedSize!1174)) )
))
(declare-datatypes ((LongMap!958 0))(
  ( (LongMap!959 (underlying!490 Cell!958)) )
))
(declare-fun thiss!992 () LongMap!958)

(declare-fun e!94750 () Bool)

(declare-datatypes ((List!1762 0))(
  ( (Nil!1759) (Cons!1758 (h!2366 (_ BitVec 64)) (t!6419 List!1762)) )
))
(declare-fun lt!76487 () List!1762)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun b!145399 () Bool)

(declare-fun contains!941 (List!1762 (_ BitVec 64)) Bool)

(assert (=> b!145399 (= e!94750 (contains!941 lt!76487 (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355)))))

(declare-fun b!145400 () Bool)

(declare-fun e!94747 () Bool)

(declare-fun e!94740 () Bool)

(assert (=> b!145400 (= e!94747 e!94740)))

(declare-fun e!94741 () Bool)

(declare-fun e!94755 () Bool)

(declare-fun tp_is_empty!2953 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1174)

(declare-fun array_inv!1471 (array!4949) Bool)

(declare-fun array_inv!1472 (array!4951) Bool)

(assert (=> b!145401 (= e!94741 (and tp!11720 tp_is_empty!2953 (array_inv!1471 (_keys!4770 newMap!16)) (array_inv!1472 (_values!2984 newMap!16)) e!94755))))

(declare-fun b!145402 () Bool)

(declare-fun e!94746 () Bool)

(declare-fun e!94748 () Bool)

(assert (=> b!145402 (= e!94746 e!94748)))

(declare-fun res!69260 () Bool)

(assert (=> b!145402 (=> (not res!69260) (not e!94748))))

(declare-datatypes ((tuple2!2730 0))(
  ( (tuple2!2731 (_1!1376 (_ BitVec 64)) (_2!1376 V!3585)) )
))
(declare-datatypes ((List!1763 0))(
  ( (Nil!1760) (Cons!1759 (h!2367 tuple2!2730) (t!6420 List!1763)) )
))
(declare-datatypes ((ListLongMap!1761 0))(
  ( (ListLongMap!1762 (toList!896 List!1763)) )
))
(declare-fun lt!76486 () ListLongMap!1761)

(declare-fun lt!76488 () ListLongMap!1761)

(assert (=> b!145402 (= res!69260 (and (= lt!76486 lt!76488) (not (= (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1455 (LongMapFixedSize!1174) ListLongMap!1761)

(assert (=> b!145402 (= lt!76488 (map!1455 newMap!16))))

(declare-fun getCurrentListMap!566 (array!4949 array!4951 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 32) Int) ListLongMap!1761)

(assert (=> b!145402 (= lt!76486 (getCurrentListMap!566 (_keys!4770 (v!3330 (underlying!490 thiss!992))) (_values!2984 (v!3330 (underlying!490 thiss!992))) (mask!7371 (v!3330 (underlying!490 thiss!992))) (extraKeys!2746 (v!3330 (underlying!490 thiss!992))) (zeroValue!2846 (v!3330 (underlying!490 thiss!992))) (minValue!2846 (v!3330 (underlying!490 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3330 (underlying!490 thiss!992)))))))

(declare-fun b!145403 () Bool)

(declare-fun e!94742 () Bool)

(assert (=> b!145403 (= e!94740 e!94742)))

(declare-fun b!145404 () Bool)

(declare-fun e!94745 () Bool)

(assert (=> b!145404 (= e!94745 (not e!94750))))

(declare-fun res!69263 () Bool)

(assert (=> b!145404 (=> res!69263 e!94750)))

(assert (=> b!145404 (= res!69263 (or (bvsge (size!2613 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2613 (_keys!4770 (v!3330 (underlying!490 thiss!992)))))))))

(assert (=> b!145404 (= lt!76487 (Cons!1758 (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355) Nil!1759))))

(declare-fun arrayNoDuplicates!0 (array!4949 (_ BitVec 32) List!1762) Bool)

(assert (=> b!145404 (arrayNoDuplicates!0 (_keys!4770 (v!3330 (underlying!490 thiss!992))) from!355 Nil!1759)))

(declare-datatypes ((Unit!4600 0))(
  ( (Unit!4601) )
))
(declare-fun lt!76491 () Unit!4600)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4949 (_ BitVec 32) (_ BitVec 32)) Unit!4600)

(assert (=> b!145404 (= lt!76491 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4770 (v!3330 (underlying!490 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145404 (arrayContainsKey!0 (_keys!4770 (v!3330 (underlying!490 thiss!992))) (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!76490 () Unit!4600)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!147 (array!4949 array!4951 (_ BitVec 32) (_ BitVec 32) V!3585 V!3585 (_ BitVec 64) (_ BitVec 32) Int) Unit!4600)

(assert (=> b!145404 (= lt!76490 (lemmaListMapContainsThenArrayContainsFrom!147 (_keys!4770 (v!3330 (underlying!490 thiss!992))) (_values!2984 (v!3330 (underlying!490 thiss!992))) (mask!7371 (v!3330 (underlying!490 thiss!992))) (extraKeys!2746 (v!3330 (underlying!490 thiss!992))) (zeroValue!2846 (v!3330 (underlying!490 thiss!992))) (minValue!2846 (v!3330 (underlying!490 thiss!992))) (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3001 (v!3330 (underlying!490 thiss!992)))))))

(declare-fun mapIsEmpty!4927 () Bool)

(declare-fun mapRes!4927 () Bool)

(assert (=> mapIsEmpty!4927 mapRes!4927))

(declare-fun mapNonEmpty!4927 () Bool)

(declare-fun tp!11718 () Bool)

(declare-fun e!94754 () Bool)

(assert (=> mapNonEmpty!4927 (= mapRes!4927 (and tp!11718 e!94754))))

(declare-fun mapKey!4928 () (_ BitVec 32))

(declare-fun mapRest!4928 () (Array (_ BitVec 32) ValueCell!1133))

(declare-fun mapValue!4927 () ValueCell!1133)

(assert (=> mapNonEmpty!4927 (= (arr!2338 (_values!2984 newMap!16)) (store mapRest!4928 mapKey!4928 mapValue!4927))))

(declare-fun res!69262 () Bool)

(assert (=> start!15154 (=> (not res!69262) (not e!94746))))

(declare-fun valid!568 (LongMap!958) Bool)

(assert (=> start!15154 (= res!69262 (valid!568 thiss!992))))

(assert (=> start!15154 e!94746))

(assert (=> start!15154 e!94747))

(assert (=> start!15154 true))

(assert (=> start!15154 e!94741))

(declare-fun mapNonEmpty!4928 () Bool)

(declare-fun mapRes!4928 () Bool)

(declare-fun tp!11717 () Bool)

(declare-fun e!94743 () Bool)

(assert (=> mapNonEmpty!4928 (= mapRes!4928 (and tp!11717 e!94743))))

(declare-fun mapValue!4928 () ValueCell!1133)

(declare-fun mapRest!4927 () (Array (_ BitVec 32) ValueCell!1133))

(declare-fun mapKey!4927 () (_ BitVec 32))

(assert (=> mapNonEmpty!4928 (= (arr!2338 (_values!2984 (v!3330 (underlying!490 thiss!992)))) (store mapRest!4927 mapKey!4927 mapValue!4928))))

(declare-fun b!145405 () Bool)

(declare-fun e!94749 () Bool)

(assert (=> b!145405 (= e!94749 tp_is_empty!2953)))

(declare-fun b!145406 () Bool)

(declare-fun res!69259 () Bool)

(assert (=> b!145406 (=> (not res!69259) (not e!94746))))

(assert (=> b!145406 (= res!69259 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7371 newMap!16)) (_size!636 (v!3330 (underlying!490 thiss!992)))))))

(declare-fun b!145407 () Bool)

(declare-fun res!69261 () Bool)

(assert (=> b!145407 (=> (not res!69261) (not e!94746))))

(assert (=> b!145407 (= res!69261 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2613 (_keys!4770 (v!3330 (underlying!490 thiss!992)))))))))

(declare-fun b!145408 () Bool)

(assert (=> b!145408 (= e!94754 tp_is_empty!2953)))

(declare-fun mapIsEmpty!4928 () Bool)

(assert (=> mapIsEmpty!4928 mapRes!4928))

(declare-fun b!145409 () Bool)

(declare-fun res!69256 () Bool)

(assert (=> b!145409 (=> res!69256 e!94750)))

(assert (=> b!145409 (= res!69256 (contains!941 lt!76487 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145410 () Bool)

(declare-fun e!94751 () Bool)

(assert (=> b!145410 (= e!94751 tp_is_empty!2953)))

(declare-fun b!145411 () Bool)

(assert (=> b!145411 (= e!94748 e!94745)))

(declare-fun res!69254 () Bool)

(assert (=> b!145411 (=> (not res!69254) (not e!94745))))

(declare-fun contains!942 (ListLongMap!1761 (_ BitVec 64)) Bool)

(assert (=> b!145411 (= res!69254 (contains!942 lt!76488 (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2732 0))(
  ( (tuple2!2733 (_1!1377 Bool) (_2!1377 LongMapFixedSize!1174)) )
))
(declare-fun lt!76489 () tuple2!2732)

(declare-fun update!219 (LongMapFixedSize!1174 (_ BitVec 64) V!3585) tuple2!2732)

(declare-fun get!1556 (ValueCell!1133 V!3585) V!3585)

(declare-fun dynLambda!450 (Int (_ BitVec 64)) V!3585)

(assert (=> b!145411 (= lt!76489 (update!219 newMap!16 (select (arr!2337 (_keys!4770 (v!3330 (underlying!490 thiss!992)))) from!355) (get!1556 (select (arr!2338 (_values!2984 (v!3330 (underlying!490 thiss!992)))) from!355) (dynLambda!450 (defaultEntry!3001 (v!3330 (underlying!490 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!145412 () Bool)

(declare-fun res!69257 () Bool)

(assert (=> b!145412 (=> res!69257 e!94750)))

(assert (=> b!145412 (= res!69257 (contains!941 lt!76487 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145413 () Bool)

(declare-fun res!69258 () Bool)

(assert (=> b!145413 (=> (not res!69258) (not e!94746))))

(declare-fun valid!569 (LongMapFixedSize!1174) Bool)

(assert (=> b!145413 (= res!69258 (valid!569 newMap!16))))

(declare-fun b!145414 () Bool)

(declare-fun e!94752 () Bool)

(assert (=> b!145414 (= e!94752 (and e!94751 mapRes!4928))))

(declare-fun condMapEmpty!4928 () Bool)

(declare-fun mapDefault!4927 () ValueCell!1133)

