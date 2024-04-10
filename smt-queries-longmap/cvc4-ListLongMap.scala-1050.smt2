; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21986 () Bool)

(assert start!21986)

(declare-fun b!225673 () Bool)

(declare-fun b_free!6053 () Bool)

(declare-fun b_next!6053 () Bool)

(assert (=> b!225673 (= b_free!6053 (not b_next!6053))))

(declare-fun tp!21301 () Bool)

(declare-fun b_and!12951 () Bool)

(assert (=> b!225673 (= tp!21301 b_and!12951)))

(declare-fun b!225652 () Bool)

(declare-fun e!146457 () Bool)

(assert (=> b!225652 (= e!146457 true)))

(declare-fun lt!113641 () Bool)

(declare-datatypes ((V!7533 0))(
  ( (V!7534 (val!3002 Int)) )
))
(declare-datatypes ((ValueCell!2614 0))(
  ( (ValueCellFull!2614 (v!5022 V!7533)) (EmptyCell!2614) )
))
(declare-datatypes ((array!11073 0))(
  ( (array!11074 (arr!5256 (Array (_ BitVec 32) ValueCell!2614)) (size!5589 (_ BitVec 32))) )
))
(declare-datatypes ((array!11075 0))(
  ( (array!11076 (arr!5257 (Array (_ BitVec 32) (_ BitVec 64))) (size!5590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3128 0))(
  ( (LongMapFixedSize!3129 (defaultEntry!4223 Int) (mask!10067 (_ BitVec 32)) (extraKeys!3960 (_ BitVec 32)) (zeroValue!4064 V!7533) (minValue!4064 V!7533) (_size!1613 (_ BitVec 32)) (_keys!6277 array!11075) (_values!4206 array!11073) (_vacant!1613 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3128)

(declare-datatypes ((List!3359 0))(
  ( (Nil!3356) (Cons!3355 (h!4003 (_ BitVec 64)) (t!8318 List!3359)) )
))
(declare-fun arrayNoDuplicates!0 (array!11075 (_ BitVec 32) List!3359) Bool)

(assert (=> b!225652 (= lt!113641 (arrayNoDuplicates!0 (_keys!6277 thiss!1504) #b00000000000000000000000000000000 Nil!3356))))

(declare-fun b!225653 () Bool)

(declare-fun res!111062 () Bool)

(assert (=> b!225653 (=> res!111062 e!146457)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225653 (= res!111062 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225654 () Bool)

(declare-fun res!111063 () Bool)

(declare-fun e!146454 () Bool)

(assert (=> b!225654 (=> (not res!111063) (not e!146454))))

(assert (=> b!225654 (= res!111063 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!225655 () Bool)

(declare-fun c!37415 () Bool)

(declare-datatypes ((SeekEntryResult!872 0))(
  ( (MissingZero!872 (index!5658 (_ BitVec 32))) (Found!872 (index!5659 (_ BitVec 32))) (Intermediate!872 (undefined!1684 Bool) (index!5660 (_ BitVec 32)) (x!23188 (_ BitVec 32))) (Undefined!872) (MissingVacant!872 (index!5661 (_ BitVec 32))) )
))
(declare-fun lt!113645 () SeekEntryResult!872)

(assert (=> b!225655 (= c!37415 (is-MissingVacant!872 lt!113645))))

(declare-fun e!146453 () Bool)

(declare-fun e!146449 () Bool)

(assert (=> b!225655 (= e!146453 e!146449)))

(declare-fun res!111068 () Bool)

(assert (=> start!21986 (=> (not res!111068) (not e!146454))))

(declare-fun valid!1260 (LongMapFixedSize!3128) Bool)

(assert (=> start!21986 (= res!111068 (valid!1260 thiss!1504))))

(assert (=> start!21986 e!146454))

(declare-fun e!146446 () Bool)

(assert (=> start!21986 e!146446))

(assert (=> start!21986 true))

(declare-fun bm!20990 () Bool)

(declare-fun call!20993 () Bool)

(declare-fun arrayContainsKey!0 (array!11075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20990 (= call!20993 (arrayContainsKey!0 (_keys!6277 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225656 () Bool)

(declare-fun e!146456 () Bool)

(declare-fun e!146455 () Bool)

(declare-fun mapRes!10042 () Bool)

(assert (=> b!225656 (= e!146456 (and e!146455 mapRes!10042))))

(declare-fun condMapEmpty!10042 () Bool)

(declare-fun mapDefault!10042 () ValueCell!2614)

