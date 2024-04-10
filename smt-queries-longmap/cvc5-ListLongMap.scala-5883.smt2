; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75828 () Bool)

(assert start!75828)

(declare-fun b!892133 () Bool)

(declare-fun b_free!15799 () Bool)

(declare-fun b_next!15799 () Bool)

(assert (=> b!892133 (= b_free!15799 (not b_next!15799))))

(declare-fun tp!55366 () Bool)

(declare-fun b_and!26039 () Bool)

(assert (=> b!892133 (= tp!55366 b_and!26039)))

(declare-fun b!892123 () Bool)

(declare-fun e!497946 () Bool)

(assert (=> b!892123 (= e!497946 true)))

(declare-fun lt!403031 () Bool)

(declare-datatypes ((V!29135 0))(
  ( (V!29136 (val!9114 Int)) )
))
(declare-datatypes ((tuple2!11984 0))(
  ( (tuple2!11985 (_1!6003 (_ BitVec 64)) (_2!6003 V!29135)) )
))
(declare-datatypes ((List!17774 0))(
  ( (Nil!17771) (Cons!17770 (h!18901 tuple2!11984) (t!25073 List!17774)) )
))
(declare-datatypes ((ListLongMap!10681 0))(
  ( (ListLongMap!10682 (toList!5356 List!17774)) )
))
(declare-fun lt!403035 () ListLongMap!10681)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4358 (ListLongMap!10681 (_ BitVec 64)) Bool)

(assert (=> b!892123 (= lt!403031 (contains!4358 lt!403035 key!785))))

(declare-fun mapNonEmpty!28745 () Bool)

(declare-fun mapRes!28745 () Bool)

(declare-fun tp!55365 () Bool)

(declare-fun e!497951 () Bool)

(assert (=> mapNonEmpty!28745 (= mapRes!28745 (and tp!55365 e!497951))))

(declare-datatypes ((ValueCell!8582 0))(
  ( (ValueCellFull!8582 (v!11592 V!29135)) (EmptyCell!8582) )
))
(declare-fun mapRest!28745 () (Array (_ BitVec 32) ValueCell!8582))

(declare-datatypes ((array!52234 0))(
  ( (array!52235 (arr!25123 (Array (_ BitVec 32) (_ BitVec 64))) (size!25567 (_ BitVec 32))) )
))
(declare-datatypes ((array!52236 0))(
  ( (array!52237 (arr!25124 (Array (_ BitVec 32) ValueCell!8582)) (size!25568 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4180 0))(
  ( (LongMapFixedSize!4181 (defaultEntry!5287 Int) (mask!25794 (_ BitVec 32)) (extraKeys!4981 (_ BitVec 32)) (zeroValue!5085 V!29135) (minValue!5085 V!29135) (_size!2145 (_ BitVec 32)) (_keys!9970 array!52234) (_values!5272 array!52236) (_vacant!2145 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4180)

(declare-fun mapValue!28745 () ValueCell!8582)

(declare-fun mapKey!28745 () (_ BitVec 32))

(assert (=> mapNonEmpty!28745 (= (arr!25124 (_values!5272 thiss!1181)) (store mapRest!28745 mapKey!28745 mapValue!28745))))

(declare-fun b!892124 () Bool)

(declare-fun tp_is_empty!18127 () Bool)

(assert (=> b!892124 (= e!497951 tp_is_empty!18127)))

(declare-fun b!892126 () Bool)

(declare-fun e!497945 () Bool)

(declare-fun e!497947 () Bool)

(assert (=> b!892126 (= e!497945 (not e!497947))))

(declare-fun res!604421 () Bool)

(assert (=> b!892126 (=> res!604421 e!497947)))

(declare-datatypes ((SeekEntryResult!8841 0))(
  ( (MissingZero!8841 (index!37735 (_ BitVec 32))) (Found!8841 (index!37736 (_ BitVec 32))) (Intermediate!8841 (undefined!9653 Bool) (index!37737 (_ BitVec 32)) (x!75817 (_ BitVec 32))) (Undefined!8841) (MissingVacant!8841 (index!37738 (_ BitVec 32))) )
))
(declare-fun lt!403036 () SeekEntryResult!8841)

(assert (=> b!892126 (= res!604421 (not (is-Found!8841 lt!403036)))))

(declare-fun e!497952 () Bool)

(assert (=> b!892126 e!497952))

(declare-fun res!604427 () Bool)

(assert (=> b!892126 (=> res!604427 e!497952)))

(assert (=> b!892126 (= res!604427 (not (is-Found!8841 lt!403036)))))

(declare-datatypes ((Unit!30378 0))(
  ( (Unit!30379) )
))
(declare-fun lt!403032 () Unit!30378)

(declare-fun lemmaSeekEntryGivesInRangeIndex!41 (array!52234 array!52236 (_ BitVec 32) (_ BitVec 32) V!29135 V!29135 (_ BitVec 64)) Unit!30378)

(assert (=> b!892126 (= lt!403032 (lemmaSeekEntryGivesInRangeIndex!41 (_keys!9970 thiss!1181) (_values!5272 thiss!1181) (mask!25794 thiss!1181) (extraKeys!4981 thiss!1181) (zeroValue!5085 thiss!1181) (minValue!5085 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52234 (_ BitVec 32)) SeekEntryResult!8841)

(assert (=> b!892126 (= lt!403036 (seekEntry!0 key!785 (_keys!9970 thiss!1181) (mask!25794 thiss!1181)))))

(declare-fun b!892127 () Bool)

(declare-fun res!604424 () Bool)

(assert (=> b!892127 (=> res!604424 e!497946)))

(assert (=> b!892127 (= res!604424 (or (not (= (size!25568 (_values!5272 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25794 thiss!1181)))) (not (= (size!25567 (_keys!9970 thiss!1181)) (size!25568 (_values!5272 thiss!1181)))) (bvslt (mask!25794 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4981 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4981 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892128 () Bool)

(declare-fun e!497948 () Bool)

(declare-fun e!497949 () Bool)

(assert (=> b!892128 (= e!497948 (and e!497949 mapRes!28745))))

(declare-fun condMapEmpty!28745 () Bool)

(declare-fun mapDefault!28745 () ValueCell!8582)

