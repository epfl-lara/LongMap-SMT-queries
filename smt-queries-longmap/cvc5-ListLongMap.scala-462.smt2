; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8384 () Bool)

(assert start!8384)

(declare-fun b!56674 () Bool)

(declare-fun b_free!1933 () Bool)

(declare-fun b_next!1933 () Bool)

(assert (=> b!56674 (= b_free!1933 (not b_next!1933))))

(declare-fun tp!7899 () Bool)

(declare-fun b_and!3407 () Bool)

(assert (=> b!56674 (= tp!7899 b_and!3407)))

(declare-fun b!56676 () Bool)

(declare-fun b_free!1935 () Bool)

(declare-fun b_next!1935 () Bool)

(assert (=> b!56676 (= b_free!1935 (not b_next!1935))))

(declare-fun tp!7902 () Bool)

(declare-fun b_and!3409 () Bool)

(assert (=> b!56676 (= tp!7902 b_and!3409)))

(declare-fun mapNonEmpty!2819 () Bool)

(declare-fun mapRes!2819 () Bool)

(declare-fun tp!7901 () Bool)

(declare-fun e!37330 () Bool)

(assert (=> mapNonEmpty!2819 (= mapRes!2819 (and tp!7901 e!37330))))

(declare-datatypes ((V!2825 0))(
  ( (V!2826 (val!1236 Int)) )
))
(declare-datatypes ((array!3689 0))(
  ( (array!3690 (arr!1767 (Array (_ BitVec 32) (_ BitVec 64))) (size!1996 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!848 0))(
  ( (ValueCellFull!848 (v!2357 V!2825)) (EmptyCell!848) )
))
(declare-datatypes ((array!3691 0))(
  ( (array!3692 (arr!1768 (Array (_ BitVec 32) ValueCell!848)) (size!1997 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!604 0))(
  ( (LongMapFixedSize!605 (defaultEntry!2016 Int) (mask!5887 (_ BitVec 32)) (extraKeys!1907 (_ BitVec 32)) (zeroValue!1934 V!2825) (minValue!1934 V!2825) (_size!351 (_ BitVec 32)) (_keys!3636 array!3689) (_values!1999 array!3691) (_vacant!351 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!418 0))(
  ( (Cell!419 (v!2358 LongMapFixedSize!604)) )
))
(declare-datatypes ((LongMap!418 0))(
  ( (LongMap!419 (underlying!220 Cell!418)) )
))
(declare-fun thiss!992 () LongMap!418)

(declare-fun mapKey!2819 () (_ BitVec 32))

(declare-fun mapRest!2819 () (Array (_ BitVec 32) ValueCell!848))

(declare-fun mapValue!2820 () ValueCell!848)

(assert (=> mapNonEmpty!2819 (= (arr!1768 (_values!1999 (v!2358 (underlying!220 thiss!992)))) (store mapRest!2819 mapKey!2819 mapValue!2820))))

(declare-fun b!56664 () Bool)

(declare-fun e!37337 () Bool)

(declare-fun tp_is_empty!2383 () Bool)

(assert (=> b!56664 (= e!37337 tp_is_empty!2383)))

(declare-fun res!31843 () Bool)

(declare-fun e!37341 () Bool)

(assert (=> start!8384 (=> (not res!31843) (not e!37341))))

(declare-fun valid!246 (LongMap!418) Bool)

(assert (=> start!8384 (= res!31843 (valid!246 thiss!992))))

(assert (=> start!8384 e!37341))

(declare-fun e!37329 () Bool)

(assert (=> start!8384 e!37329))

(assert (=> start!8384 true))

(declare-fun e!37331 () Bool)

(assert (=> start!8384 e!37331))

(declare-fun b!56665 () Bool)

(declare-datatypes ((Unit!1471 0))(
  ( (Unit!1472) )
))
(declare-fun e!37343 () Unit!1471)

(declare-fun Unit!1473 () Unit!1471)

(assert (=> b!56665 (= e!37343 Unit!1473)))

(declare-fun lt!22338 () Unit!1471)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!25 (array!3689 array!3691 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 64) (_ BitVec 32) Int) Unit!1471)

(assert (=> b!56665 (= lt!22338 (lemmaListMapContainsThenArrayContainsFrom!25 (_keys!3636 (v!2358 (underlying!220 thiss!992))) (_values!1999 (v!2358 (underlying!220 thiss!992))) (mask!5887 (v!2358 (underlying!220 thiss!992))) (extraKeys!1907 (v!2358 (underlying!220 thiss!992))) (zeroValue!1934 (v!2358 (underlying!220 thiss!992))) (minValue!1934 (v!2358 (underlying!220 thiss!992))) (select (arr!1767 (_keys!3636 (v!2358 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!220 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!56665 (arrayContainsKey!0 (_keys!3636 (v!2358 (underlying!220 thiss!992))) (select (arr!1767 (_keys!3636 (v!2358 (underlying!220 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22335 () Unit!1471)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3689 (_ BitVec 32) (_ BitVec 32)) Unit!1471)

(assert (=> b!56665 (= lt!22335 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3636 (v!2358 (underlying!220 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1420 0))(
  ( (Nil!1417) (Cons!1416 (h!1996 (_ BitVec 64)) (t!4722 List!1420)) )
))
(declare-fun arrayNoDuplicates!0 (array!3689 (_ BitVec 32) List!1420) Bool)

(assert (=> b!56665 (arrayNoDuplicates!0 (_keys!3636 (v!2358 (underlying!220 thiss!992))) from!355 Nil!1417)))

(declare-fun lt!22340 () Unit!1471)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3689 (_ BitVec 32) (_ BitVec 64) List!1420) Unit!1471)

(assert (=> b!56665 (= lt!22340 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3636 (v!2358 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1767 (_keys!3636 (v!2358 (underlying!220 thiss!992)))) from!355) (Cons!1416 (select (arr!1767 (_keys!3636 (v!2358 (underlying!220 thiss!992)))) from!355) Nil!1417)))))

(assert (=> b!56665 false))

(declare-fun mapIsEmpty!2819 () Bool)

(assert (=> mapIsEmpty!2819 mapRes!2819))

(declare-fun b!56666 () Bool)

(declare-fun e!37328 () Bool)

(declare-fun e!37333 () Bool)

(assert (=> b!56666 (= e!37328 e!37333)))

(declare-fun b!56667 () Bool)

(declare-fun res!31841 () Bool)

(assert (=> b!56667 (=> (not res!31841) (not e!37341))))

(assert (=> b!56667 (= res!31841 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1996 (_keys!3636 (v!2358 (underlying!220 thiss!992)))))))))

(declare-fun b!56668 () Bool)

(declare-fun e!37334 () Bool)

(assert (=> b!56668 (= e!37341 e!37334)))

(declare-fun res!31842 () Bool)

(assert (=> b!56668 (=> (not res!31842) (not e!37334))))

(declare-datatypes ((tuple2!2004 0))(
  ( (tuple2!2005 (_1!1013 (_ BitVec 64)) (_2!1013 V!2825)) )
))
(declare-datatypes ((List!1421 0))(
  ( (Nil!1418) (Cons!1417 (h!1997 tuple2!2004) (t!4723 List!1421)) )
))
(declare-datatypes ((ListLongMap!1353 0))(
  ( (ListLongMap!1354 (toList!692 List!1421)) )
))
(declare-fun lt!22341 () ListLongMap!1353)

(declare-fun lt!22336 () ListLongMap!1353)

(assert (=> b!56668 (= res!31842 (and (= lt!22341 lt!22336) (not (= (select (arr!1767 (_keys!3636 (v!2358 (underlying!220 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1767 (_keys!3636 (v!2358 (underlying!220 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!604)

(declare-fun map!1097 (LongMapFixedSize!604) ListLongMap!1353)

(assert (=> b!56668 (= lt!22336 (map!1097 newMap!16))))

(declare-fun getCurrentListMap!398 (array!3689 array!3691 (_ BitVec 32) (_ BitVec 32) V!2825 V!2825 (_ BitVec 32) Int) ListLongMap!1353)

(assert (=> b!56668 (= lt!22341 (getCurrentListMap!398 (_keys!3636 (v!2358 (underlying!220 thiss!992))) (_values!1999 (v!2358 (underlying!220 thiss!992))) (mask!5887 (v!2358 (underlying!220 thiss!992))) (extraKeys!1907 (v!2358 (underlying!220 thiss!992))) (zeroValue!1934 (v!2358 (underlying!220 thiss!992))) (minValue!1934 (v!2358 (underlying!220 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2016 (v!2358 (underlying!220 thiss!992)))))))

(declare-fun b!56669 () Bool)

(declare-fun Unit!1474 () Unit!1471)

(assert (=> b!56669 (= e!37343 Unit!1474)))

(declare-fun b!56670 () Bool)

(declare-fun res!31844 () Bool)

(assert (=> b!56670 (=> (not res!31844) (not e!37341))))

(assert (=> b!56670 (= res!31844 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5887 newMap!16)) (_size!351 (v!2358 (underlying!220 thiss!992)))))))

(declare-fun b!56671 () Bool)

(declare-fun e!37338 () Bool)

(declare-fun e!37339 () Bool)

(declare-fun mapRes!2820 () Bool)

(assert (=> b!56671 (= e!37338 (and e!37339 mapRes!2820))))

(declare-fun condMapEmpty!2820 () Bool)

(declare-fun mapDefault!2820 () ValueCell!848)

