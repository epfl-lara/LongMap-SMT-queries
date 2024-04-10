; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21974 () Bool)

(assert start!21974)

(declare-fun b!225218 () Bool)

(declare-fun b_free!6041 () Bool)

(declare-fun b_next!6041 () Bool)

(assert (=> b!225218 (= b_free!6041 (not b_next!6041))))

(declare-fun tp!21264 () Bool)

(declare-fun b_and!12939 () Bool)

(assert (=> b!225218 (= tp!21264 b_and!12939)))

(declare-fun b!225202 () Bool)

(declare-fun c!37341 () Bool)

(declare-datatypes ((SeekEntryResult!866 0))(
  ( (MissingZero!866 (index!5634 (_ BitVec 32))) (Found!866 (index!5635 (_ BitVec 32))) (Intermediate!866 (undefined!1678 Bool) (index!5636 (_ BitVec 32)) (x!23166 (_ BitVec 32))) (Undefined!866) (MissingVacant!866 (index!5637 (_ BitVec 32))) )
))
(declare-fun lt!113447 () SeekEntryResult!866)

(assert (=> b!225202 (= c!37341 (is-MissingVacant!866 lt!113447))))

(declare-fun e!146179 () Bool)

(declare-fun e!146180 () Bool)

(assert (=> b!225202 (= e!146179 e!146180)))

(declare-fun mapIsEmpty!10024 () Bool)

(declare-fun mapRes!10024 () Bool)

(assert (=> mapIsEmpty!10024 mapRes!10024))

(declare-fun b!225204 () Bool)

(declare-fun res!110835 () Bool)

(declare-fun e!146175 () Bool)

(assert (=> b!225204 (=> res!110835 e!146175)))

(declare-datatypes ((V!7517 0))(
  ( (V!7518 (val!2996 Int)) )
))
(declare-datatypes ((ValueCell!2608 0))(
  ( (ValueCellFull!2608 (v!5016 V!7517)) (EmptyCell!2608) )
))
(declare-datatypes ((array!11049 0))(
  ( (array!11050 (arr!5244 (Array (_ BitVec 32) ValueCell!2608)) (size!5577 (_ BitVec 32))) )
))
(declare-datatypes ((array!11051 0))(
  ( (array!11052 (arr!5245 (Array (_ BitVec 32) (_ BitVec 64))) (size!5578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3116 0))(
  ( (LongMapFixedSize!3117 (defaultEntry!4217 Int) (mask!10057 (_ BitVec 32)) (extraKeys!3954 (_ BitVec 32)) (zeroValue!4058 V!7517) (minValue!4058 V!7517) (_size!1607 (_ BitVec 32)) (_keys!6271 array!11051) (_values!4200 array!11049) (_vacant!1607 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3116)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11051 (_ BitVec 32)) Bool)

(assert (=> b!225204 (= res!110835 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6271 thiss!1504) (mask!10057 thiss!1504))))))

(declare-fun b!225205 () Bool)

(declare-fun e!146189 () Bool)

(declare-fun tp_is_empty!5903 () Bool)

(assert (=> b!225205 (= e!146189 tp_is_empty!5903)))

(declare-fun b!225206 () Bool)

(assert (=> b!225206 (= e!146180 (is-Undefined!866 lt!113447))))

(declare-fun b!225207 () Bool)

(declare-fun e!146185 () Bool)

(assert (=> b!225207 (= e!146185 (not e!146175))))

(declare-fun res!110828 () Bool)

(assert (=> b!225207 (=> res!110828 e!146175)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225207 (= res!110828 (not (validMask!0 (mask!10057 thiss!1504))))))

(declare-fun lt!113450 () array!11051)

(declare-fun arrayCountValidKeys!0 (array!11051 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225207 (= (arrayCountValidKeys!0 lt!113450 #b00000000000000000000000000000000 (size!5578 (_keys!6271 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6271 thiss!1504) #b00000000000000000000000000000000 (size!5578 (_keys!6271 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!6790 0))(
  ( (Unit!6791) )
))
(declare-fun lt!113445 () Unit!6790)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11051 (_ BitVec 32) (_ BitVec 64)) Unit!6790)

(assert (=> b!225207 (= lt!113445 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6271 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3352 0))(
  ( (Nil!3349) (Cons!3348 (h!3996 (_ BitVec 64)) (t!8311 List!3352)) )
))
(declare-fun arrayNoDuplicates!0 (array!11051 (_ BitVec 32) List!3352) Bool)

(assert (=> b!225207 (arrayNoDuplicates!0 lt!113450 #b00000000000000000000000000000000 Nil!3349)))

(assert (=> b!225207 (= lt!113450 (array!11052 (store (arr!5245 (_keys!6271 thiss!1504)) index!297 key!932) (size!5578 (_keys!6271 thiss!1504))))))

(declare-fun lt!113443 () Unit!6790)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11051 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3352) Unit!6790)

(assert (=> b!225207 (= lt!113443 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6271 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3349))))

(declare-fun lt!113442 () Unit!6790)

(declare-fun e!146188 () Unit!6790)

(assert (=> b!225207 (= lt!113442 e!146188)))

(declare-fun c!37344 () Bool)

(declare-fun lt!113448 () Bool)

(assert (=> b!225207 (= c!37344 lt!113448)))

(declare-fun arrayContainsKey!0 (array!11051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225207 (= lt!113448 (arrayContainsKey!0 (_keys!6271 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225208 () Bool)

(declare-fun e!146176 () Bool)

(declare-fun e!146187 () Bool)

(assert (=> b!225208 (= e!146176 (and e!146187 mapRes!10024))))

(declare-fun condMapEmpty!10024 () Bool)

(declare-fun mapDefault!10024 () ValueCell!2608)

