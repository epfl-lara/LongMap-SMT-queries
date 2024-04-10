; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16092 () Bool)

(assert start!16092)

(declare-fun b!159927 () Bool)

(declare-fun b_free!3553 () Bool)

(declare-fun b_next!3553 () Bool)

(assert (=> b!159927 (= b_free!3553 (not b_next!3553))))

(declare-fun tp!13229 () Bool)

(declare-fun b_and!9967 () Bool)

(assert (=> b!159927 (= tp!13229 b_and!9967)))

(declare-fun b!159924 () Bool)

(declare-fun res!75640 () Bool)

(declare-fun e!104628 () Bool)

(assert (=> b!159924 (=> (not res!75640) (not e!104628))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4121 0))(
  ( (V!4122 (val!1722 Int)) )
))
(declare-datatypes ((ValueCell!1334 0))(
  ( (ValueCellFull!1334 (v!3587 V!4121)) (EmptyCell!1334) )
))
(declare-datatypes ((array!5789 0))(
  ( (array!5790 (arr!2739 (Array (_ BitVec 32) (_ BitVec 64))) (size!3023 (_ BitVec 32))) )
))
(declare-datatypes ((array!5791 0))(
  ( (array!5792 (arr!2740 (Array (_ BitVec 32) ValueCell!1334)) (size!3024 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1576 0))(
  ( (LongMapFixedSize!1577 (defaultEntry!3230 Int) (mask!7790 (_ BitVec 32)) (extraKeys!2971 (_ BitVec 32)) (zeroValue!3073 V!4121) (minValue!3073 V!4121) (_size!837 (_ BitVec 32)) (_keys!5031 array!5789) (_values!3213 array!5791) (_vacant!837 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1576)

(declare-datatypes ((SeekEntryResult!320 0))(
  ( (MissingZero!320 (index!3448 (_ BitVec 32))) (Found!320 (index!3449 (_ BitVec 32))) (Intermediate!320 (undefined!1132 Bool) (index!3450 (_ BitVec 32)) (x!17656 (_ BitVec 32))) (Undefined!320) (MissingVacant!320 (index!3451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5789 (_ BitVec 32)) SeekEntryResult!320)

(assert (=> b!159924 (= res!75640 (is-Undefined!320 (seekEntryOrOpen!0 key!828 (_keys!5031 thiss!1248) (mask!7790 thiss!1248))))))

(declare-fun b!159925 () Bool)

(declare-fun res!75642 () Bool)

(assert (=> b!159925 (=> (not res!75642) (not e!104628))))

(assert (=> b!159925 (= res!75642 (and (= (size!3024 (_values!3213 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7790 thiss!1248))) (= (size!3023 (_keys!5031 thiss!1248)) (size!3024 (_values!3213 thiss!1248))) (bvsge (mask!7790 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2971 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2971 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!5720 () Bool)

(declare-fun mapRes!5720 () Bool)

(declare-fun tp!13228 () Bool)

(declare-fun e!104625 () Bool)

(assert (=> mapNonEmpty!5720 (= mapRes!5720 (and tp!13228 e!104625))))

(declare-fun mapRest!5720 () (Array (_ BitVec 32) ValueCell!1334))

(declare-fun mapValue!5720 () ValueCell!1334)

(declare-fun mapKey!5720 () (_ BitVec 32))

(assert (=> mapNonEmpty!5720 (= (arr!2740 (_values!3213 thiss!1248)) (store mapRest!5720 mapKey!5720 mapValue!5720))))

(declare-fun b!159926 () Bool)

(declare-fun tp_is_empty!3355 () Bool)

(assert (=> b!159926 (= e!104625 tp_is_empty!3355)))

(declare-fun e!104623 () Bool)

(declare-fun e!104627 () Bool)

(declare-fun array_inv!1743 (array!5789) Bool)

(declare-fun array_inv!1744 (array!5791) Bool)

(assert (=> b!159927 (= e!104627 (and tp!13229 tp_is_empty!3355 (array_inv!1743 (_keys!5031 thiss!1248)) (array_inv!1744 (_values!3213 thiss!1248)) e!104623))))

(declare-fun b!159928 () Bool)

(assert (=> b!159928 (= e!104628 false)))

(declare-fun lt!82042 () Bool)

(declare-datatypes ((List!1923 0))(
  ( (Nil!1920) (Cons!1919 (h!2532 (_ BitVec 64)) (t!6725 List!1923)) )
))
(declare-fun arrayNoDuplicates!0 (array!5789 (_ BitVec 32) List!1923) Bool)

(assert (=> b!159928 (= lt!82042 (arrayNoDuplicates!0 (_keys!5031 thiss!1248) #b00000000000000000000000000000000 Nil!1920))))

(declare-fun b!159929 () Bool)

(declare-fun e!104624 () Bool)

(assert (=> b!159929 (= e!104624 tp_is_empty!3355)))

(declare-fun b!159930 () Bool)

(declare-fun res!75639 () Bool)

(assert (=> b!159930 (=> (not res!75639) (not e!104628))))

(assert (=> b!159930 (= res!75639 (not (= key!828 (bvneg key!828))))))

(declare-fun b!159931 () Bool)

(assert (=> b!159931 (= e!104623 (and e!104624 mapRes!5720))))

(declare-fun condMapEmpty!5720 () Bool)

(declare-fun mapDefault!5720 () ValueCell!1334)

