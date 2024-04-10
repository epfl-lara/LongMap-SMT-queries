; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19474 () Bool)

(assert start!19474)

(declare-fun b!191245 () Bool)

(declare-fun b_free!4675 () Bool)

(declare-fun b_next!4675 () Bool)

(assert (=> b!191245 (= b_free!4675 (not b_next!4675))))

(declare-fun tp!16871 () Bool)

(declare-fun b_and!11345 () Bool)

(assert (=> b!191245 (= tp!16871 b_and!11345)))

(declare-fun b!191237 () Bool)

(declare-fun e!125835 () Bool)

(declare-fun tp_is_empty!4447 () Bool)

(assert (=> b!191237 (= e!125835 tp_is_empty!4447)))

(declare-fun res!90391 () Bool)

(declare-fun e!125842 () Bool)

(assert (=> start!19474 (=> (not res!90391) (not e!125842))))

(declare-datatypes ((V!5577 0))(
  ( (V!5578 (val!2268 Int)) )
))
(declare-datatypes ((ValueCell!1880 0))(
  ( (ValueCellFull!1880 (v!4205 V!5577)) (EmptyCell!1880) )
))
(declare-datatypes ((array!8131 0))(
  ( (array!8132 (arr!3831 (Array (_ BitVec 32) (_ BitVec 64))) (size!4153 (_ BitVec 32))) )
))
(declare-datatypes ((array!8133 0))(
  ( (array!8134 (arr!3832 (Array (_ BitVec 32) ValueCell!1880)) (size!4154 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2668 0))(
  ( (LongMapFixedSize!2669 (defaultEntry!3902 Int) (mask!9118 (_ BitVec 32)) (extraKeys!3639 (_ BitVec 32)) (zeroValue!3743 V!5577) (minValue!3743 V!5577) (_size!1383 (_ BitVec 32)) (_keys!5879 array!8131) (_values!3885 array!8133) (_vacant!1383 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2668)

(declare-fun valid!1095 (LongMapFixedSize!2668) Bool)

(assert (=> start!19474 (= res!90391 (valid!1095 thiss!1248))))

(assert (=> start!19474 e!125842))

(declare-fun e!125838 () Bool)

(assert (=> start!19474 e!125838))

(assert (=> start!19474 true))

(assert (=> start!19474 tp_is_empty!4447))

(declare-fun b!191238 () Bool)

(declare-fun res!90389 () Bool)

(assert (=> b!191238 (=> (not res!90389) (not e!125842))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!191238 (= res!90389 (not (= key!828 (bvneg key!828))))))

(declare-fun b!191239 () Bool)

(declare-fun e!125836 () Bool)

(assert (=> b!191239 (= e!125836 (or (not (= (size!4154 (_values!3885 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9118 thiss!1248)))) (not (= (size!4153 (_keys!5879 thiss!1248)) (size!4154 (_values!3885 thiss!1248)))) (bvsge (mask!9118 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191240 () Bool)

(declare-fun e!125839 () Bool)

(assert (=> b!191240 (= e!125839 (not e!125836))))

(declare-fun res!90387 () Bool)

(assert (=> b!191240 (=> res!90387 e!125836)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191240 (= res!90387 (not (validMask!0 (mask!9118 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!676 0))(
  ( (MissingZero!676 (index!4874 (_ BitVec 32))) (Found!676 (index!4875 (_ BitVec 32))) (Intermediate!676 (undefined!1488 Bool) (index!4876 (_ BitVec 32)) (x!20530 (_ BitVec 32))) (Undefined!676) (MissingVacant!676 (index!4877 (_ BitVec 32))) )
))
(declare-fun lt!94898 () SeekEntryResult!676)

(declare-fun v!309 () V!5577)

(declare-datatypes ((tuple2!3526 0))(
  ( (tuple2!3527 (_1!1774 (_ BitVec 64)) (_2!1774 V!5577)) )
))
(declare-datatypes ((List!2421 0))(
  ( (Nil!2418) (Cons!2417 (h!3056 tuple2!3526) (t!7333 List!2421)) )
))
(declare-datatypes ((ListLongMap!2443 0))(
  ( (ListLongMap!2444 (toList!1237 List!2421)) )
))
(declare-fun lt!94903 () ListLongMap!2443)

(declare-fun +!305 (ListLongMap!2443 tuple2!3526) ListLongMap!2443)

(declare-fun getCurrentListMap!885 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) Int) ListLongMap!2443)

(assert (=> b!191240 (= (+!305 lt!94903 (tuple2!3527 key!828 v!309)) (getCurrentListMap!885 (_keys!5879 thiss!1248) (array!8134 (store (arr!3832 (_values!3885 thiss!1248)) (index!4875 lt!94898) (ValueCellFull!1880 v!309)) (size!4154 (_values!3885 thiss!1248))) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-datatypes ((Unit!5782 0))(
  ( (Unit!5783) )
))
(declare-fun lt!94899 () Unit!5782)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!106 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5577 V!5577 (_ BitVec 32) (_ BitVec 64) V!5577 Int) Unit!5782)

(assert (=> b!191240 (= lt!94899 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!106 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) (index!4875 lt!94898) key!828 v!309 (defaultEntry!3902 thiss!1248)))))

(declare-fun lt!94900 () Unit!5782)

(declare-fun e!125841 () Unit!5782)

(assert (=> b!191240 (= lt!94900 e!125841)))

(declare-fun c!34427 () Bool)

(declare-fun contains!1350 (ListLongMap!2443 (_ BitVec 64)) Bool)

(assert (=> b!191240 (= c!34427 (contains!1350 lt!94903 key!828))))

(assert (=> b!191240 (= lt!94903 (getCurrentListMap!885 (_keys!5879 thiss!1248) (_values!3885 thiss!1248) (mask!9118 thiss!1248) (extraKeys!3639 thiss!1248) (zeroValue!3743 thiss!1248) (minValue!3743 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3902 thiss!1248)))))

(declare-fun b!191241 () Bool)

(assert (=> b!191241 (= e!125842 e!125839)))

(declare-fun res!90388 () Bool)

(assert (=> b!191241 (=> (not res!90388) (not e!125839))))

(assert (=> b!191241 (= res!90388 (and (not (is-Undefined!676 lt!94898)) (not (is-MissingVacant!676 lt!94898)) (not (is-MissingZero!676 lt!94898)) (is-Found!676 lt!94898)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8131 (_ BitVec 32)) SeekEntryResult!676)

(assert (=> b!191241 (= lt!94898 (seekEntryOrOpen!0 key!828 (_keys!5879 thiss!1248) (mask!9118 thiss!1248)))))

(declare-fun mapNonEmpty!7680 () Bool)

(declare-fun mapRes!7680 () Bool)

(declare-fun tp!16872 () Bool)

(declare-fun e!125834 () Bool)

(assert (=> mapNonEmpty!7680 (= mapRes!7680 (and tp!16872 e!125834))))

(declare-fun mapKey!7680 () (_ BitVec 32))

(declare-fun mapValue!7680 () ValueCell!1880)

(declare-fun mapRest!7680 () (Array (_ BitVec 32) ValueCell!1880))

(assert (=> mapNonEmpty!7680 (= (arr!3832 (_values!3885 thiss!1248)) (store mapRest!7680 mapKey!7680 mapValue!7680))))

(declare-fun b!191242 () Bool)

(declare-fun e!125837 () Bool)

(assert (=> b!191242 (= e!125837 (and e!125835 mapRes!7680))))

(declare-fun condMapEmpty!7680 () Bool)

(declare-fun mapDefault!7680 () ValueCell!1880)

