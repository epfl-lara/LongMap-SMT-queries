; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16176 () Bool)

(assert start!16176)

(declare-fun b!161291 () Bool)

(declare-fun b_free!3637 () Bool)

(declare-fun b_next!3637 () Bool)

(assert (=> b!161291 (= b_free!3637 (not b_next!3637))))

(declare-fun tp!13481 () Bool)

(declare-fun b_and!10051 () Bool)

(assert (=> b!161291 (= tp!13481 b_and!10051)))

(declare-fun b!161288 () Bool)

(declare-fun e!105392 () Bool)

(declare-fun tp_is_empty!3439 () Bool)

(assert (=> b!161288 (= e!105392 tp_is_empty!3439)))

(declare-fun b!161289 () Bool)

(declare-fun res!76478 () Bool)

(declare-fun e!105391 () Bool)

(assert (=> b!161289 (=> (not res!76478) (not e!105391))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!161289 (= res!76478 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!5846 () Bool)

(declare-fun mapRes!5846 () Bool)

(declare-fun tp!13480 () Bool)

(assert (=> mapNonEmpty!5846 (= mapRes!5846 (and tp!13480 e!105392))))

(declare-datatypes ((V!4233 0))(
  ( (V!4234 (val!1764 Int)) )
))
(declare-datatypes ((ValueCell!1376 0))(
  ( (ValueCellFull!1376 (v!3629 V!4233)) (EmptyCell!1376) )
))
(declare-fun mapRest!5846 () (Array (_ BitVec 32) ValueCell!1376))

(declare-fun mapKey!5846 () (_ BitVec 32))

(declare-datatypes ((array!5957 0))(
  ( (array!5958 (arr!2823 (Array (_ BitVec 32) (_ BitVec 64))) (size!3107 (_ BitVec 32))) )
))
(declare-datatypes ((array!5959 0))(
  ( (array!5960 (arr!2824 (Array (_ BitVec 32) ValueCell!1376)) (size!3108 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1660 0))(
  ( (LongMapFixedSize!1661 (defaultEntry!3272 Int) (mask!7860 (_ BitVec 32)) (extraKeys!3013 (_ BitVec 32)) (zeroValue!3115 V!4233) (minValue!3115 V!4233) (_size!879 (_ BitVec 32)) (_keys!5073 array!5957) (_values!3255 array!5959) (_vacant!879 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1660)

(declare-fun mapValue!5846 () ValueCell!1376)

(assert (=> mapNonEmpty!5846 (= (arr!2824 (_values!3255 thiss!1248)) (store mapRest!5846 mapKey!5846 mapValue!5846))))

(declare-fun b!161290 () Bool)

(declare-datatypes ((Unit!5004 0))(
  ( (Unit!5005) )
))
(declare-fun e!105390 () Unit!5004)

(declare-fun Unit!5006 () Unit!5004)

(assert (=> b!161290 (= e!105390 Unit!5006)))

(declare-fun lt!82180 () Unit!5004)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!74 (array!5957 array!5959 (_ BitVec 32) (_ BitVec 32) V!4233 V!4233 (_ BitVec 64) Int) Unit!5004)

(assert (=> b!161290 (= lt!82180 (lemmaInListMapThenSeekEntryOrOpenFindsIt!74 (_keys!5073 thiss!1248) (_values!3255 thiss!1248) (mask!7860 thiss!1248) (extraKeys!3013 thiss!1248) (zeroValue!3115 thiss!1248) (minValue!3115 thiss!1248) key!828 (defaultEntry!3272 thiss!1248)))))

(assert (=> b!161290 false))

(declare-fun e!105394 () Bool)

(declare-fun e!105396 () Bool)

(declare-fun array_inv!1805 (array!5957) Bool)

(declare-fun array_inv!1806 (array!5959) Bool)

(assert (=> b!161291 (= e!105396 (and tp!13481 tp_is_empty!3439 (array_inv!1805 (_keys!5073 thiss!1248)) (array_inv!1806 (_values!3255 thiss!1248)) e!105394))))

(declare-fun b!161292 () Bool)

(declare-fun res!76476 () Bool)

(assert (=> b!161292 (=> (not res!76476) (not e!105391))))

(declare-datatypes ((SeekEntryResult!351 0))(
  ( (MissingZero!351 (index!3572 (_ BitVec 32))) (Found!351 (index!3573 (_ BitVec 32))) (Intermediate!351 (undefined!1163 Bool) (index!3574 (_ BitVec 32)) (x!17799 (_ BitVec 32))) (Undefined!351) (MissingVacant!351 (index!3575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5957 (_ BitVec 32)) SeekEntryResult!351)

(assert (=> b!161292 (= res!76476 (is-Undefined!351 (seekEntryOrOpen!0 key!828 (_keys!5073 thiss!1248) (mask!7860 thiss!1248))))))

(declare-fun b!161293 () Bool)

(declare-fun e!105395 () Bool)

(assert (=> b!161293 (= e!105395 tp_is_empty!3439)))

(declare-fun res!76477 () Bool)

(assert (=> start!16176 (=> (not res!76477) (not e!105391))))

(declare-fun valid!762 (LongMapFixedSize!1660) Bool)

(assert (=> start!16176 (= res!76477 (valid!762 thiss!1248))))

(assert (=> start!16176 e!105391))

(assert (=> start!16176 e!105396))

(assert (=> start!16176 true))

(declare-fun b!161294 () Bool)

(assert (=> b!161294 (= e!105394 (and e!105395 mapRes!5846))))

(declare-fun condMapEmpty!5846 () Bool)

(declare-fun mapDefault!5846 () ValueCell!1376)

