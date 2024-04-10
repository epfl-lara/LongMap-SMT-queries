; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22022 () Bool)

(assert start!22022)

(declare-fun b!227003 () Bool)

(declare-fun b_free!6089 () Bool)

(declare-fun b_next!6089 () Bool)

(assert (=> b!227003 (= b_free!6089 (not b_next!6089))))

(declare-fun tp!21409 () Bool)

(declare-fun b_and!12987 () Bool)

(assert (=> b!227003 (= tp!21409 b_and!12987)))

(declare-fun b!226986 () Bool)

(declare-fun res!111748 () Bool)

(declare-fun e!147267 () Bool)

(assert (=> b!226986 (=> (not res!111748) (not e!147267))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!226986 (= res!111748 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226987 () Bool)

(declare-fun e!147269 () Bool)

(declare-fun tp_is_empty!5951 () Bool)

(assert (=> b!226987 (= e!147269 tp_is_empty!5951)))

(declare-fun b!226988 () Bool)

(declare-fun e!147256 () Bool)

(declare-fun e!147266 () Bool)

(assert (=> b!226988 (= e!147256 (not e!147266))))

(declare-fun res!111749 () Bool)

(assert (=> b!226988 (=> res!111749 e!147266)))

(declare-datatypes ((V!7581 0))(
  ( (V!7582 (val!3020 Int)) )
))
(declare-datatypes ((ValueCell!2632 0))(
  ( (ValueCellFull!2632 (v!5040 V!7581)) (EmptyCell!2632) )
))
(declare-datatypes ((array!11145 0))(
  ( (array!11146 (arr!5292 (Array (_ BitVec 32) ValueCell!2632)) (size!5625 (_ BitVec 32))) )
))
(declare-datatypes ((array!11147 0))(
  ( (array!11148 (arr!5293 (Array (_ BitVec 32) (_ BitVec 64))) (size!5626 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3164 0))(
  ( (LongMapFixedSize!3165 (defaultEntry!4241 Int) (mask!10097 (_ BitVec 32)) (extraKeys!3978 (_ BitVec 32)) (zeroValue!4082 V!7581) (minValue!4082 V!7581) (_size!1631 (_ BitVec 32)) (_keys!6295 array!11147) (_values!4224 array!11145) (_vacant!1631 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3164)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226988 (= res!111749 (not (validMask!0 (mask!10097 thiss!1504))))))

(declare-fun lt!114234 () array!11147)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11147 (_ BitVec 32)) Bool)

(assert (=> b!226988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114234 (mask!10097 thiss!1504))))

(declare-datatypes ((Unit!6878 0))(
  ( (Unit!6879) )
))
(declare-fun lt!114242 () Unit!6878)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11147 (_ BitVec 32) (_ BitVec 32)) Unit!6878)

(assert (=> b!226988 (= lt!114242 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6295 thiss!1504) index!297 (mask!10097 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11147 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226988 (= (arrayCountValidKeys!0 lt!114234 #b00000000000000000000000000000000 (size!5626 (_keys!6295 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6295 thiss!1504) #b00000000000000000000000000000000 (size!5626 (_keys!6295 thiss!1504)))))))

(declare-fun lt!114235 () Unit!6878)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11147 (_ BitVec 32) (_ BitVec 64)) Unit!6878)

(assert (=> b!226988 (= lt!114235 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6295 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3384 0))(
  ( (Nil!3381) (Cons!3380 (h!4028 (_ BitVec 64)) (t!8343 List!3384)) )
))
(declare-fun arrayNoDuplicates!0 (array!11147 (_ BitVec 32) List!3384) Bool)

(assert (=> b!226988 (arrayNoDuplicates!0 lt!114234 #b00000000000000000000000000000000 Nil!3381)))

(assert (=> b!226988 (= lt!114234 (array!11148 (store (arr!5293 (_keys!6295 thiss!1504)) index!297 key!932) (size!5626 (_keys!6295 thiss!1504))))))

(declare-fun lt!114237 () Unit!6878)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11147 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3384) Unit!6878)

(assert (=> b!226988 (= lt!114237 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6295 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3381))))

(declare-fun lt!114233 () Unit!6878)

(declare-fun e!147262 () Unit!6878)

(assert (=> b!226988 (= lt!114233 e!147262)))

(declare-fun c!37630 () Bool)

(declare-fun arrayContainsKey!0 (array!11147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226988 (= c!37630 (arrayContainsKey!0 (_keys!6295 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226989 () Bool)

(assert (=> b!226989 (= e!147266 true)))

(declare-fun lt!114232 () Bool)

(assert (=> b!226989 (= lt!114232 (arrayNoDuplicates!0 (_keys!6295 thiss!1504) #b00000000000000000000000000000000 Nil!3381))))

(declare-fun b!226990 () Bool)

(declare-fun e!147265 () Bool)

(declare-fun call!21101 () Bool)

(assert (=> b!226990 (= e!147265 (not call!21101))))

(declare-fun b!226991 () Bool)

(declare-fun e!147268 () Bool)

(declare-datatypes ((SeekEntryResult!890 0))(
  ( (MissingZero!890 (index!5730 (_ BitVec 32))) (Found!890 (index!5731 (_ BitVec 32))) (Intermediate!890 (undefined!1702 Bool) (index!5732 (_ BitVec 32)) (x!23254 (_ BitVec 32))) (Undefined!890) (MissingVacant!890 (index!5733 (_ BitVec 32))) )
))
(declare-fun lt!114239 () SeekEntryResult!890)

(assert (=> b!226991 (= e!147268 (is-Undefined!890 lt!114239))))

(declare-fun b!226992 () Bool)

(declare-fun e!147258 () Bool)

(declare-fun mapRes!10096 () Bool)

(assert (=> b!226992 (= e!147258 (and e!147269 mapRes!10096))))

(declare-fun condMapEmpty!10096 () Bool)

(declare-fun mapDefault!10096 () ValueCell!2632)

