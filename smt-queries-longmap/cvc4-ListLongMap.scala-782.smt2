; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18542 () Bool)

(assert start!18542)

(declare-fun b!183758 () Bool)

(declare-fun b_free!4535 () Bool)

(declare-fun b_next!4535 () Bool)

(assert (=> b!183758 (= b_free!4535 (not b_next!4535))))

(declare-fun tp!16380 () Bool)

(declare-fun b_and!11111 () Bool)

(assert (=> b!183758 (= tp!16380 b_and!11111)))

(declare-fun b!183750 () Bool)

(declare-fun res!86967 () Bool)

(declare-fun e!120972 () Bool)

(assert (=> b!183750 (=> (not res!86967) (not e!120972))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!183750 (= res!86967 (not (= key!828 (bvneg key!828))))))

(declare-fun b!183751 () Bool)

(declare-fun e!120971 () Bool)

(declare-datatypes ((V!5389 0))(
  ( (V!5390 (val!2198 Int)) )
))
(declare-datatypes ((ValueCell!1810 0))(
  ( (ValueCellFull!1810 (v!4102 V!5389)) (EmptyCell!1810) )
))
(declare-datatypes ((array!7809 0))(
  ( (array!7810 (arr!3691 (Array (_ BitVec 32) (_ BitVec 64))) (size!4004 (_ BitVec 32))) )
))
(declare-datatypes ((array!7811 0))(
  ( (array!7812 (arr!3692 (Array (_ BitVec 32) ValueCell!1810)) (size!4005 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2528 0))(
  ( (LongMapFixedSize!2529 (defaultEntry!3756 Int) (mask!8826 (_ BitVec 32)) (extraKeys!3493 (_ BitVec 32)) (zeroValue!3597 V!5389) (minValue!3597 V!5389) (_size!1313 (_ BitVec 32)) (_keys!5678 array!7809) (_values!3739 array!7811) (_vacant!1313 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2528)

(assert (=> b!183751 (= e!120971 (and (= (size!4005 (_values!3739 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8826 thiss!1248))) (not (= (size!4004 (_keys!5678 thiss!1248)) (size!4005 (_values!3739 thiss!1248))))))))

(declare-fun b!183752 () Bool)

(assert (=> b!183752 (= e!120972 e!120971)))

(declare-fun res!86965 () Bool)

(assert (=> b!183752 (=> (not res!86965) (not e!120971))))

(declare-datatypes ((SeekEntryResult!623 0))(
  ( (MissingZero!623 (index!4662 (_ BitVec 32))) (Found!623 (index!4663 (_ BitVec 32))) (Intermediate!623 (undefined!1435 Bool) (index!4664 (_ BitVec 32)) (x!20003 (_ BitVec 32))) (Undefined!623) (MissingVacant!623 (index!4665 (_ BitVec 32))) )
))
(declare-fun lt!90831 () SeekEntryResult!623)

(assert (=> b!183752 (= res!86965 (and (not (is-Undefined!623 lt!90831)) (not (is-MissingVacant!623 lt!90831)) (not (is-MissingZero!623 lt!90831)) (is-Found!623 lt!90831)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7809 (_ BitVec 32)) SeekEntryResult!623)

(assert (=> b!183752 (= lt!90831 (seekEntryOrOpen!0 key!828 (_keys!5678 thiss!1248) (mask!8826 thiss!1248)))))

(declare-fun res!86969 () Bool)

(assert (=> start!18542 (=> (not res!86969) (not e!120972))))

(declare-fun valid!1046 (LongMapFixedSize!2528) Bool)

(assert (=> start!18542 (= res!86969 (valid!1046 thiss!1248))))

(assert (=> start!18542 e!120972))

(declare-fun e!120974 () Bool)

(assert (=> start!18542 e!120974))

(assert (=> start!18542 true))

(declare-fun b!183753 () Bool)

(declare-fun e!120970 () Bool)

(declare-fun e!120975 () Bool)

(declare-fun mapRes!7398 () Bool)

(assert (=> b!183753 (= e!120970 (and e!120975 mapRes!7398))))

(declare-fun condMapEmpty!7398 () Bool)

(declare-fun mapDefault!7398 () ValueCell!1810)

