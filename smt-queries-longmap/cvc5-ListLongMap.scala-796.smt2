; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19066 () Bool)

(assert start!19066)

(declare-fun b!187789 () Bool)

(declare-fun b_free!4615 () Bool)

(declare-fun b_next!4615 () Bool)

(assert (=> b!187789 (= b_free!4615 (not b_next!4615))))

(declare-fun tp!16661 () Bool)

(declare-fun b_and!11239 () Bool)

(assert (=> b!187789 (= tp!16661 b_and!11239)))

(declare-fun res!88787 () Bool)

(declare-fun e!123588 () Bool)

(assert (=> start!19066 (=> (not res!88787) (not e!123588))))

(declare-datatypes ((V!5497 0))(
  ( (V!5498 (val!2238 Int)) )
))
(declare-datatypes ((ValueCell!1850 0))(
  ( (ValueCellFull!1850 (v!4154 V!5497)) (EmptyCell!1850) )
))
(declare-datatypes ((array!7993 0))(
  ( (array!7994 (arr!3771 (Array (_ BitVec 32) (_ BitVec 64))) (size!4090 (_ BitVec 32))) )
))
(declare-datatypes ((array!7995 0))(
  ( (array!7996 (arr!3772 (Array (_ BitVec 32) ValueCell!1850)) (size!4091 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2608 0))(
  ( (LongMapFixedSize!2609 (defaultEntry!3830 Int) (mask!8984 (_ BitVec 32)) (extraKeys!3567 (_ BitVec 32)) (zeroValue!3671 V!5497) (minValue!3671 V!5497) (_size!1353 (_ BitVec 32)) (_keys!5785 array!7993) (_values!3813 array!7995) (_vacant!1353 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2608)

(declare-fun valid!1073 (LongMapFixedSize!2608) Bool)

(assert (=> start!19066 (= res!88787 (valid!1073 thiss!1248))))

(assert (=> start!19066 e!123588))

(declare-fun e!123591 () Bool)

(assert (=> start!19066 e!123591))

(assert (=> start!19066 true))

(declare-fun b!187786 () Bool)

(declare-datatypes ((Unit!5658 0))(
  ( (Unit!5659) )
))
(declare-fun e!123590 () Unit!5658)

(declare-fun lt!92921 () Unit!5658)

(assert (=> b!187786 (= e!123590 lt!92921)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!151 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5658)

(assert (=> b!187786 (= lt!92921 (lemmaInListMapThenSeekEntryOrOpenFindsIt!151 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(declare-fun res!88786 () Bool)

(declare-datatypes ((SeekEntryResult!649 0))(
  ( (MissingZero!649 (index!4766 (_ BitVec 32))) (Found!649 (index!4767 (_ BitVec 32))) (Intermediate!649 (undefined!1461 Bool) (index!4768 (_ BitVec 32)) (x!20309 (_ BitVec 32))) (Undefined!649) (MissingVacant!649 (index!4769 (_ BitVec 32))) )
))
(declare-fun lt!92922 () SeekEntryResult!649)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187786 (= res!88786 (inRange!0 (index!4767 lt!92922) (mask!8984 thiss!1248)))))

(declare-fun e!123586 () Bool)

(assert (=> b!187786 (=> (not res!88786) (not e!123586))))

(assert (=> b!187786 e!123586))

(declare-fun mapIsEmpty!7560 () Bool)

(declare-fun mapRes!7560 () Bool)

(assert (=> mapIsEmpty!7560 mapRes!7560))

(declare-fun b!187787 () Bool)

(assert (=> b!187787 (= e!123586 (= (select (arr!3771 (_keys!5785 thiss!1248)) (index!4767 lt!92922)) key!828))))

(declare-fun b!187788 () Bool)

(declare-fun Unit!5660 () Unit!5658)

(assert (=> b!187788 (= e!123590 Unit!5660)))

(declare-fun lt!92920 () Unit!5658)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!155 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5658)

(assert (=> b!187788 (= lt!92920 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!155 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(assert (=> b!187788 false))

(declare-fun tp_is_empty!4387 () Bool)

(declare-fun e!123584 () Bool)

(declare-fun array_inv!2441 (array!7993) Bool)

(declare-fun array_inv!2442 (array!7995) Bool)

(assert (=> b!187789 (= e!123591 (and tp!16661 tp_is_empty!4387 (array_inv!2441 (_keys!5785 thiss!1248)) (array_inv!2442 (_values!3813 thiss!1248)) e!123584))))

(declare-fun b!187790 () Bool)

(declare-fun e!123589 () Bool)

(assert (=> b!187790 (= e!123589 tp_is_empty!4387)))

(declare-fun b!187791 () Bool)

(declare-fun e!123585 () Bool)

(declare-fun e!123592 () Bool)

(assert (=> b!187791 (= e!123585 e!123592)))

(declare-fun res!88783 () Bool)

(assert (=> b!187791 (=> (not res!88783) (not e!123592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187791 (= res!88783 (validMask!0 (mask!8984 thiss!1248)))))

(declare-fun lt!92919 () Unit!5658)

(assert (=> b!187791 (= lt!92919 e!123590)))

(declare-fun c!33733 () Bool)

(declare-datatypes ((tuple2!3480 0))(
  ( (tuple2!3481 (_1!1751 (_ BitVec 64)) (_2!1751 V!5497)) )
))
(declare-datatypes ((List!2384 0))(
  ( (Nil!2381) (Cons!2380 (h!3016 tuple2!3480) (t!7278 List!2384)) )
))
(declare-datatypes ((ListLongMap!2397 0))(
  ( (ListLongMap!2398 (toList!1214 List!2384)) )
))
(declare-fun contains!1316 (ListLongMap!2397 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!862 (array!7993 array!7995 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 32) Int) ListLongMap!2397)

(assert (=> b!187791 (= c!33733 (contains!1316 (getCurrentListMap!862 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) key!828))))

(declare-fun b!187792 () Bool)

(declare-fun e!123587 () Bool)

(assert (=> b!187792 (= e!123584 (and e!123587 mapRes!7560))))

(declare-fun condMapEmpty!7560 () Bool)

(declare-fun mapDefault!7560 () ValueCell!1850)

