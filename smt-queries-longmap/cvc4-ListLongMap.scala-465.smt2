; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8720 () Bool)

(assert start!8720)

(declare-fun b!60477 () Bool)

(declare-fun b_free!1977 () Bool)

(declare-fun b_next!1977 () Bool)

(assert (=> b!60477 (= b_free!1977 (not b_next!1977))))

(declare-fun tp!8051 () Bool)

(declare-fun b_and!3675 () Bool)

(assert (=> b!60477 (= tp!8051 b_and!3675)))

(declare-fun b!60476 () Bool)

(declare-fun b_free!1979 () Bool)

(declare-fun b_next!1979 () Bool)

(assert (=> b!60476 (= b_free!1979 (not b_next!1979))))

(declare-fun tp!8052 () Bool)

(declare-fun b_and!3677 () Bool)

(assert (=> b!60476 (= tp!8052 b_and!3677)))

(declare-fun b!60472 () Bool)

(declare-fun e!39747 () Bool)

(declare-fun e!39759 () Bool)

(assert (=> b!60472 (= e!39747 e!39759)))

(declare-fun res!33440 () Bool)

(assert (=> b!60472 (=> (not res!33440) (not e!39759))))

(declare-datatypes ((V!2853 0))(
  ( (V!2854 (val!1247 Int)) )
))
(declare-datatypes ((array!3739 0))(
  ( (array!3740 (arr!1789 (Array (_ BitVec 32) (_ BitVec 64))) (size!2020 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!859 0))(
  ( (ValueCellFull!859 (v!2399 V!2853)) (EmptyCell!859) )
))
(declare-datatypes ((array!3741 0))(
  ( (array!3742 (arr!1790 (Array (_ BitVec 32) ValueCell!859)) (size!2021 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!626 0))(
  ( (LongMapFixedSize!627 (defaultEntry!2065 Int) (mask!5959 (_ BitVec 32)) (extraKeys!1948 (_ BitVec 32)) (zeroValue!1979 V!2853) (minValue!1979 V!2853) (_size!362 (_ BitVec 32)) (_keys!3693 array!3739) (_values!2048 array!3741) (_vacant!362 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!436 0))(
  ( (Cell!437 (v!2400 LongMapFixedSize!626)) )
))
(declare-datatypes ((LongMap!436 0))(
  ( (LongMap!437 (underlying!229 Cell!436)) )
))
(declare-fun thiss!992 () LongMap!436)

(declare-datatypes ((tuple2!2028 0))(
  ( (tuple2!2029 (_1!1025 (_ BitVec 64)) (_2!1025 V!2853)) )
))
(declare-datatypes ((List!1434 0))(
  ( (Nil!1431) (Cons!1430 (h!2012 tuple2!2028) (t!4796 List!1434)) )
))
(declare-datatypes ((ListLongMap!1367 0))(
  ( (ListLongMap!1368 (toList!699 List!1434)) )
))
(declare-fun lt!24781 () ListLongMap!1367)

(declare-fun lt!24784 () ListLongMap!1367)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!60472 (= res!33440 (and (= lt!24781 lt!24784) (not (= (select (arr!1789 (_keys!3693 (v!2400 (underlying!229 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1789 (_keys!3693 (v!2400 (underlying!229 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!626)

(declare-fun map!1109 (LongMapFixedSize!626) ListLongMap!1367)

(assert (=> b!60472 (= lt!24784 (map!1109 newMap!16))))

(declare-fun getCurrentListMap!404 (array!3739 array!3741 (_ BitVec 32) (_ BitVec 32) V!2853 V!2853 (_ BitVec 32) Int) ListLongMap!1367)

(assert (=> b!60472 (= lt!24781 (getCurrentListMap!404 (_keys!3693 (v!2400 (underlying!229 thiss!992))) (_values!2048 (v!2400 (underlying!229 thiss!992))) (mask!5959 (v!2400 (underlying!229 thiss!992))) (extraKeys!1948 (v!2400 (underlying!229 thiss!992))) (zeroValue!1979 (v!2400 (underlying!229 thiss!992))) (minValue!1979 (v!2400 (underlying!229 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2065 (v!2400 (underlying!229 thiss!992)))))))

(declare-fun b!60473 () Bool)

(declare-datatypes ((Unit!1621 0))(
  ( (Unit!1622) )
))
(declare-fun e!39760 () Unit!1621)

(declare-fun Unit!1623 () Unit!1621)

(assert (=> b!60473 (= e!39760 Unit!1623)))

(declare-fun lt!24785 () Unit!1621)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!32 (array!3739 array!3741 (_ BitVec 32) (_ BitVec 32) V!2853 V!2853 (_ BitVec 64) (_ BitVec 32) Int) Unit!1621)

(assert (=> b!60473 (= lt!24785 (lemmaListMapContainsThenArrayContainsFrom!32 (_keys!3693 (v!2400 (underlying!229 thiss!992))) (_values!2048 (v!2400 (underlying!229 thiss!992))) (mask!5959 (v!2400 (underlying!229 thiss!992))) (extraKeys!1948 (v!2400 (underlying!229 thiss!992))) (zeroValue!1979 (v!2400 (underlying!229 thiss!992))) (minValue!1979 (v!2400 (underlying!229 thiss!992))) (select (arr!1789 (_keys!3693 (v!2400 (underlying!229 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2065 (v!2400 (underlying!229 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!60473 (arrayContainsKey!0 (_keys!3693 (v!2400 (underlying!229 thiss!992))) (select (arr!1789 (_keys!3693 (v!2400 (underlying!229 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!24782 () Unit!1621)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3739 (_ BitVec 32) (_ BitVec 32)) Unit!1621)

(assert (=> b!60473 (= lt!24782 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3693 (v!2400 (underlying!229 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1435 0))(
  ( (Nil!1432) (Cons!1431 (h!2013 (_ BitVec 64)) (t!4797 List!1435)) )
))
(declare-fun arrayNoDuplicates!0 (array!3739 (_ BitVec 32) List!1435) Bool)

(assert (=> b!60473 (arrayNoDuplicates!0 (_keys!3693 (v!2400 (underlying!229 thiss!992))) from!355 Nil!1432)))

(declare-fun lt!24779 () Unit!1621)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3739 (_ BitVec 32) (_ BitVec 64) List!1435) Unit!1621)

(assert (=> b!60473 (= lt!24779 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3693 (v!2400 (underlying!229 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1789 (_keys!3693 (v!2400 (underlying!229 thiss!992)))) from!355) (Cons!1431 (select (arr!1789 (_keys!3693 (v!2400 (underlying!229 thiss!992)))) from!355) Nil!1432)))))

(assert (=> b!60473 false))

(declare-fun b!60474 () Bool)

(declare-fun res!33445 () Bool)

(assert (=> b!60474 (=> (not res!33445) (not e!39747))))

(declare-fun valid!259 (LongMapFixedSize!626) Bool)

(assert (=> b!60474 (= res!33445 (valid!259 newMap!16))))

(declare-fun mapIsEmpty!2905 () Bool)

(declare-fun mapRes!2905 () Bool)

(assert (=> mapIsEmpty!2905 mapRes!2905))

(declare-fun b!60475 () Bool)

(declare-fun e!39761 () Bool)

(declare-fun tp_is_empty!2405 () Bool)

(assert (=> b!60475 (= e!39761 tp_is_empty!2405)))

(declare-fun mapIsEmpty!2906 () Bool)

(declare-fun mapRes!2906 () Bool)

(assert (=> mapIsEmpty!2906 mapRes!2906))

(declare-fun e!39757 () Bool)

(declare-fun e!39750 () Bool)

(declare-fun array_inv!1107 (array!3739) Bool)

(declare-fun array_inv!1108 (array!3741) Bool)

(assert (=> b!60477 (= e!39750 (and tp!8051 tp_is_empty!2405 (array_inv!1107 (_keys!3693 (v!2400 (underlying!229 thiss!992)))) (array_inv!1108 (_values!2048 (v!2400 (underlying!229 thiss!992)))) e!39757))))

(declare-fun b!60478 () Bool)

(declare-fun res!33444 () Bool)

(declare-fun e!39756 () Bool)

(assert (=> b!60478 (=> (not res!33444) (not e!39756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!60478 (= res!33444 (validMask!0 (mask!5959 (v!2400 (underlying!229 thiss!992)))))))

(declare-fun b!60479 () Bool)

(declare-fun e!39748 () Bool)

(declare-fun e!39758 () Bool)

(assert (=> b!60479 (= e!39748 e!39758)))

(declare-fun b!60480 () Bool)

(declare-fun Unit!1624 () Unit!1621)

(assert (=> b!60480 (= e!39760 Unit!1624)))

(declare-fun b!60481 () Bool)

(declare-fun e!39762 () Bool)

(assert (=> b!60481 (= e!39757 (and e!39762 mapRes!2906))))

(declare-fun condMapEmpty!2906 () Bool)

(declare-fun mapDefault!2906 () ValueCell!859)

