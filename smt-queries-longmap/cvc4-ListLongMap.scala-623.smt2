; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16090 () Bool)

(assert start!16090)

(declare-fun b!159892 () Bool)

(declare-fun b_free!3551 () Bool)

(declare-fun b_next!3551 () Bool)

(assert (=> b!159892 (= b_free!3551 (not b_next!3551))))

(declare-fun tp!13223 () Bool)

(declare-fun b_and!9965 () Bool)

(assert (=> b!159892 (= tp!13223 b_and!9965)))

(declare-fun b!159891 () Bool)

(declare-fun res!75617 () Bool)

(declare-fun e!104605 () Bool)

(assert (=> b!159891 (=> (not res!75617) (not e!104605))))

(declare-datatypes ((V!4117 0))(
  ( (V!4118 (val!1721 Int)) )
))
(declare-datatypes ((ValueCell!1333 0))(
  ( (ValueCellFull!1333 (v!3586 V!4117)) (EmptyCell!1333) )
))
(declare-datatypes ((array!5785 0))(
  ( (array!5786 (arr!2737 (Array (_ BitVec 32) (_ BitVec 64))) (size!3021 (_ BitVec 32))) )
))
(declare-datatypes ((array!5787 0))(
  ( (array!5788 (arr!2738 (Array (_ BitVec 32) ValueCell!1333)) (size!3022 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1574 0))(
  ( (LongMapFixedSize!1575 (defaultEntry!3229 Int) (mask!7787 (_ BitVec 32)) (extraKeys!2970 (_ BitVec 32)) (zeroValue!3072 V!4117) (minValue!3072 V!4117) (_size!836 (_ BitVec 32)) (_keys!5030 array!5785) (_values!3212 array!5787) (_vacant!836 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1574)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5785 (_ BitVec 32)) Bool)

(assert (=> b!159891 (= res!75617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5030 thiss!1248) (mask!7787 thiss!1248)))))

(declare-fun e!104609 () Bool)

(declare-fun tp_is_empty!3353 () Bool)

(declare-fun e!104607 () Bool)

(declare-fun array_inv!1741 (array!5785) Bool)

(declare-fun array_inv!1742 (array!5787) Bool)

(assert (=> b!159892 (= e!104607 (and tp!13223 tp_is_empty!3353 (array_inv!1741 (_keys!5030 thiss!1248)) (array_inv!1742 (_values!3212 thiss!1248)) e!104609))))

(declare-fun mapIsEmpty!5717 () Bool)

(declare-fun mapRes!5717 () Bool)

(assert (=> mapIsEmpty!5717 mapRes!5717))

(declare-fun res!75621 () Bool)

(assert (=> start!16090 (=> (not res!75621) (not e!104605))))

(declare-fun valid!734 (LongMapFixedSize!1574) Bool)

(assert (=> start!16090 (= res!75621 (valid!734 thiss!1248))))

(assert (=> start!16090 e!104605))

(assert (=> start!16090 e!104607))

(assert (=> start!16090 true))

(declare-fun b!159893 () Bool)

(declare-fun res!75619 () Bool)

(assert (=> b!159893 (=> (not res!75619) (not e!104605))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!319 0))(
  ( (MissingZero!319 (index!3444 (_ BitVec 32))) (Found!319 (index!3445 (_ BitVec 32))) (Intermediate!319 (undefined!1131 Bool) (index!3446 (_ BitVec 32)) (x!17647 (_ BitVec 32))) (Undefined!319) (MissingVacant!319 (index!3447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5785 (_ BitVec 32)) SeekEntryResult!319)

(assert (=> b!159893 (= res!75619 (is-Undefined!319 (seekEntryOrOpen!0 key!828 (_keys!5030 thiss!1248) (mask!7787 thiss!1248))))))

(declare-fun b!159894 () Bool)

(declare-fun e!104610 () Bool)

(assert (=> b!159894 (= e!104610 tp_is_empty!3353)))

(declare-fun b!159895 () Bool)

(declare-fun e!104608 () Bool)

(assert (=> b!159895 (= e!104608 tp_is_empty!3353)))

(declare-fun b!159896 () Bool)

(declare-fun res!75622 () Bool)

(assert (=> b!159896 (=> (not res!75622) (not e!104605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!159896 (= res!75622 (validMask!0 (mask!7787 thiss!1248)))))

(declare-fun mapNonEmpty!5717 () Bool)

(declare-fun tp!13222 () Bool)

(assert (=> mapNonEmpty!5717 (= mapRes!5717 (and tp!13222 e!104610))))

(declare-fun mapKey!5717 () (_ BitVec 32))

(declare-fun mapValue!5717 () ValueCell!1333)

(declare-fun mapRest!5717 () (Array (_ BitVec 32) ValueCell!1333))

(assert (=> mapNonEmpty!5717 (= (arr!2738 (_values!3212 thiss!1248)) (store mapRest!5717 mapKey!5717 mapValue!5717))))

(declare-fun b!159897 () Bool)

(assert (=> b!159897 (= e!104609 (and e!104608 mapRes!5717))))

(declare-fun condMapEmpty!5717 () Bool)

(declare-fun mapDefault!5717 () ValueCell!1333)

