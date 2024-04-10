; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19226 () Bool)

(assert start!19226)

(declare-fun b!189202 () Bool)

(declare-fun b_free!4643 () Bool)

(declare-fun b_next!4643 () Bool)

(assert (=> b!189202 (= b_free!4643 (not b_next!4643))))

(declare-fun tp!16759 () Bool)

(declare-fun b_and!11279 () Bool)

(assert (=> b!189202 (= tp!16759 b_and!11279)))

(declare-fun b!189188 () Bool)

(declare-fun res!89455 () Bool)

(declare-fun e!124511 () Bool)

(assert (=> b!189188 (=> (not res!89455) (not e!124511))))

(declare-datatypes ((V!5533 0))(
  ( (V!5534 (val!2252 Int)) )
))
(declare-datatypes ((ValueCell!1864 0))(
  ( (ValueCellFull!1864 (v!4172 V!5533)) (EmptyCell!1864) )
))
(declare-datatypes ((array!8057 0))(
  ( (array!8058 (arr!3799 (Array (_ BitVec 32) (_ BitVec 64))) (size!4119 (_ BitVec 32))) )
))
(declare-datatypes ((array!8059 0))(
  ( (array!8060 (arr!3800 (Array (_ BitVec 32) ValueCell!1864)) (size!4120 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2636 0))(
  ( (LongMapFixedSize!2637 (defaultEntry!3859 Int) (mask!9040 (_ BitVec 32)) (extraKeys!3596 (_ BitVec 32)) (zeroValue!3700 V!5533) (minValue!3700 V!5533) (_size!1367 (_ BitVec 32)) (_keys!5824 array!8057) (_values!3842 array!8059) (_vacant!1367 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2636)

(declare-datatypes ((List!2405 0))(
  ( (Nil!2402) (Cons!2401 (h!3038 (_ BitVec 64)) (t!7307 List!2405)) )
))
(declare-fun arrayNoDuplicates!0 (array!8057 (_ BitVec 32) List!2405) Bool)

(assert (=> b!189188 (= res!89455 (arrayNoDuplicates!0 (_keys!5824 thiss!1248) #b00000000000000000000000000000000 Nil!2402))))

(declare-fun b!189189 () Bool)

(declare-datatypes ((Unit!5706 0))(
  ( (Unit!5707) )
))
(declare-fun e!124510 () Unit!5706)

(declare-fun Unit!5708 () Unit!5706)

(assert (=> b!189189 (= e!124510 Unit!5708)))

(declare-fun lt!93626 () Unit!5706)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!165 (array!8057 array!8059 (_ BitVec 32) (_ BitVec 32) V!5533 V!5533 (_ BitVec 64) Int) Unit!5706)

(assert (=> b!189189 (= lt!93626 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!165 (_keys!5824 thiss!1248) (_values!3842 thiss!1248) (mask!9040 thiss!1248) (extraKeys!3596 thiss!1248) (zeroValue!3700 thiss!1248) (minValue!3700 thiss!1248) key!828 (defaultEntry!3859 thiss!1248)))))

(assert (=> b!189189 false))

(declare-fun mapIsEmpty!7615 () Bool)

(declare-fun mapRes!7615 () Bool)

(assert (=> mapIsEmpty!7615 mapRes!7615))

(declare-fun b!189190 () Bool)

(declare-fun res!89452 () Bool)

(assert (=> b!189190 (=> (not res!89452) (not e!124511))))

(declare-datatypes ((SeekEntryResult!661 0))(
  ( (MissingZero!661 (index!4814 (_ BitVec 32))) (Found!661 (index!4815 (_ BitVec 32))) (Intermediate!661 (undefined!1473 Bool) (index!4816 (_ BitVec 32)) (x!20401 (_ BitVec 32))) (Undefined!661) (MissingVacant!661 (index!4817 (_ BitVec 32))) )
))
(declare-fun lt!93629 () SeekEntryResult!661)

(assert (=> b!189190 (= res!89452 (and (bvsge (index!4815 lt!93629) #b00000000000000000000000000000000) (bvslt (index!4815 lt!93629) (size!4119 (_keys!5824 thiss!1248)))))))

(declare-fun b!189191 () Bool)

(declare-fun e!124507 () Bool)

(declare-fun e!124509 () Bool)

(assert (=> b!189191 (= e!124507 (and e!124509 mapRes!7615))))

(declare-fun condMapEmpty!7615 () Bool)

(declare-fun mapDefault!7615 () ValueCell!1864)

