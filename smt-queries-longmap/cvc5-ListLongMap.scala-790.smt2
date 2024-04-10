; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18804 () Bool)

(assert start!18804)

(declare-fun b!185838 () Bool)

(declare-fun b_free!4579 () Bool)

(declare-fun b_next!4579 () Bool)

(assert (=> b!185838 (= b_free!4579 (not b_next!4579))))

(declare-fun tp!16535 () Bool)

(declare-fun b_and!11181 () Bool)

(assert (=> b!185838 (= tp!16535 b_and!11181)))

(declare-fun b!185831 () Bool)

(declare-fun res!87924 () Bool)

(declare-fun e!122273 () Bool)

(assert (=> b!185831 (=> (not res!87924) (not e!122273))))

(declare-datatypes ((V!5449 0))(
  ( (V!5450 (val!2220 Int)) )
))
(declare-datatypes ((ValueCell!1832 0))(
  ( (ValueCellFull!1832 (v!4131 V!5449)) (EmptyCell!1832) )
))
(declare-datatypes ((array!7911 0))(
  ( (array!7912 (arr!3735 (Array (_ BitVec 32) (_ BitVec 64))) (size!4051 (_ BitVec 32))) )
))
(declare-datatypes ((array!7913 0))(
  ( (array!7914 (arr!3736 (Array (_ BitVec 32) ValueCell!1832)) (size!4052 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2572 0))(
  ( (LongMapFixedSize!2573 (defaultEntry!3788 Int) (mask!8903 (_ BitVec 32)) (extraKeys!3525 (_ BitVec 32)) (zeroValue!3629 V!5449) (minValue!3629 V!5449) (_size!1335 (_ BitVec 32)) (_keys!5729 array!7911) (_values!3771 array!7913) (_vacant!1335 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2572)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3458 0))(
  ( (tuple2!3459 (_1!1740 (_ BitVec 64)) (_2!1740 V!5449)) )
))
(declare-datatypes ((List!2368 0))(
  ( (Nil!2365) (Cons!2364 (h!2997 tuple2!3458) (t!7252 List!2368)) )
))
(declare-datatypes ((ListLongMap!2375 0))(
  ( (ListLongMap!2376 (toList!1203 List!2368)) )
))
(declare-fun contains!1299 (ListLongMap!2375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!851 (array!7911 array!7913 (_ BitVec 32) (_ BitVec 32) V!5449 V!5449 (_ BitVec 32) Int) ListLongMap!2375)

(assert (=> b!185831 (= res!87924 (not (contains!1299 (getCurrentListMap!851 (_keys!5729 thiss!1248) (_values!3771 thiss!1248) (mask!8903 thiss!1248) (extraKeys!3525 thiss!1248) (zeroValue!3629 thiss!1248) (minValue!3629 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3788 thiss!1248)) key!828)))))

(declare-fun b!185832 () Bool)

(assert (=> b!185832 (= e!122273 (not true))))

(assert (=> b!185832 false))

(declare-datatypes ((Unit!5596 0))(
  ( (Unit!5597) )
))
(declare-fun lt!91875 () Unit!5596)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (array!7911 array!7913 (_ BitVec 32) (_ BitVec 32) V!5449 V!5449 (_ BitVec 64) Int) Unit!5596)

(assert (=> b!185832 (= lt!91875 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!143 (_keys!5729 thiss!1248) (_values!3771 thiss!1248) (mask!8903 thiss!1248) (extraKeys!3525 thiss!1248) (zeroValue!3629 thiss!1248) (minValue!3629 thiss!1248) key!828 (defaultEntry!3788 thiss!1248)))))

(declare-fun b!185833 () Bool)

(declare-fun e!122275 () Bool)

(declare-fun tp_is_empty!4351 () Bool)

(assert (=> b!185833 (= e!122275 tp_is_empty!4351)))

(declare-fun b!185834 () Bool)

(declare-fun e!122277 () Bool)

(declare-fun e!122272 () Bool)

(declare-fun mapRes!7488 () Bool)

(assert (=> b!185834 (= e!122277 (and e!122272 mapRes!7488))))

(declare-fun condMapEmpty!7488 () Bool)

(declare-fun mapDefault!7488 () ValueCell!1832)

