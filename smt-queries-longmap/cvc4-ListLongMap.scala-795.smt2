; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19002 () Bool)

(assert start!19002)

(declare-fun b!187382 () Bool)

(declare-fun b_free!4613 () Bool)

(declare-fun b_next!4613 () Bool)

(assert (=> b!187382 (= b_free!4613 (not b_next!4613))))

(declare-fun tp!16652 () Bool)

(declare-fun b_and!11231 () Bool)

(assert (=> b!187382 (= tp!16652 b_and!11231)))

(declare-fun res!88607 () Bool)

(declare-fun e!123342 () Bool)

(assert (=> start!19002 (=> (not res!88607) (not e!123342))))

(declare-datatypes ((V!5493 0))(
  ( (V!5494 (val!2237 Int)) )
))
(declare-datatypes ((ValueCell!1849 0))(
  ( (ValueCellFull!1849 (v!4152 V!5493)) (EmptyCell!1849) )
))
(declare-datatypes ((array!7987 0))(
  ( (array!7988 (arr!3769 (Array (_ BitVec 32) (_ BitVec 64))) (size!4087 (_ BitVec 32))) )
))
(declare-datatypes ((array!7989 0))(
  ( (array!7990 (arr!3770 (Array (_ BitVec 32) ValueCell!1849)) (size!4088 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2606 0))(
  ( (LongMapFixedSize!2607 (defaultEntry!3823 Int) (mask!8968 (_ BitVec 32)) (extraKeys!3560 (_ BitVec 32)) (zeroValue!3664 V!5493) (minValue!3664 V!5493) (_size!1352 (_ BitVec 32)) (_keys!5774 array!7987) (_values!3806 array!7989) (_vacant!1352 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2606)

(declare-fun valid!1072 (LongMapFixedSize!2606) Bool)

(assert (=> start!19002 (= res!88607 (valid!1072 thiss!1248))))

(assert (=> start!19002 e!123342))

(declare-fun e!123340 () Bool)

(assert (=> start!19002 e!123340))

(assert (=> start!19002 true))

(declare-fun e!123347 () Bool)

(declare-fun tp_is_empty!4385 () Bool)

(declare-fun array_inv!2439 (array!7987) Bool)

(declare-fun array_inv!2440 (array!7989) Bool)

(assert (=> b!187382 (= e!123340 (and tp!16652 tp_is_empty!4385 (array_inv!2439 (_keys!5774 thiss!1248)) (array_inv!2440 (_values!3806 thiss!1248)) e!123347))))

(declare-fun b!187383 () Bool)

(declare-fun e!123338 () Bool)

(assert (=> b!187383 (= e!123338 (and (= (size!4088 (_values!3806 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8968 thiss!1248))) (= (size!4087 (_keys!5774 thiss!1248)) (size!4088 (_values!3806 thiss!1248))) (bvsge (mask!8968 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3560 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!187384 () Bool)

(declare-fun e!123344 () Bool)

(assert (=> b!187384 (= e!123344 tp_is_empty!4385)))

(declare-fun mapNonEmpty!7553 () Bool)

(declare-fun mapRes!7553 () Bool)

(declare-fun tp!16651 () Bool)

(assert (=> mapNonEmpty!7553 (= mapRes!7553 (and tp!16651 e!123344))))

(declare-fun mapKey!7553 () (_ BitVec 32))

(declare-fun mapRest!7553 () (Array (_ BitVec 32) ValueCell!1849))

(declare-fun mapValue!7553 () ValueCell!1849)

(assert (=> mapNonEmpty!7553 (= (arr!3770 (_values!3806 thiss!1248)) (store mapRest!7553 mapKey!7553 mapValue!7553))))

(declare-fun e!123346 () Bool)

(declare-fun b!187385 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!648 0))(
  ( (MissingZero!648 (index!4762 (_ BitVec 32))) (Found!648 (index!4763 (_ BitVec 32))) (Intermediate!648 (undefined!1460 Bool) (index!4764 (_ BitVec 32)) (x!20282 (_ BitVec 32))) (Undefined!648) (MissingVacant!648 (index!4765 (_ BitVec 32))) )
))
(declare-fun lt!92694 () SeekEntryResult!648)

(assert (=> b!187385 (= e!123346 (= (select (arr!3769 (_keys!5774 thiss!1248)) (index!4763 lt!92694)) key!828))))

(declare-fun mapIsEmpty!7553 () Bool)

(assert (=> mapIsEmpty!7553 mapRes!7553))

(declare-fun b!187386 () Bool)

(declare-datatypes ((Unit!5649 0))(
  ( (Unit!5650) )
))
(declare-fun e!123341 () Unit!5649)

(declare-fun lt!92693 () Unit!5649)

(assert (=> b!187386 (= e!123341 lt!92693)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!150 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5493 V!5493 (_ BitVec 64) Int) Unit!5649)

(assert (=> b!187386 (= lt!92693 (lemmaInListMapThenSeekEntryOrOpenFindsIt!150 (_keys!5774 thiss!1248) (_values!3806 thiss!1248) (mask!8968 thiss!1248) (extraKeys!3560 thiss!1248) (zeroValue!3664 thiss!1248) (minValue!3664 thiss!1248) key!828 (defaultEntry!3823 thiss!1248)))))

(declare-fun res!88604 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187386 (= res!88604 (inRange!0 (index!4763 lt!92694) (mask!8968 thiss!1248)))))

(assert (=> b!187386 (=> (not res!88604) (not e!123346))))

(assert (=> b!187386 e!123346))

(declare-fun b!187387 () Bool)

(declare-fun e!123339 () Bool)

(assert (=> b!187387 (= e!123342 e!123339)))

(declare-fun res!88605 () Bool)

(assert (=> b!187387 (=> (not res!88605) (not e!123339))))

(assert (=> b!187387 (= res!88605 (and (not (is-Undefined!648 lt!92694)) (not (is-MissingVacant!648 lt!92694)) (not (is-MissingZero!648 lt!92694)) (is-Found!648 lt!92694)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7987 (_ BitVec 32)) SeekEntryResult!648)

(assert (=> b!187387 (= lt!92694 (seekEntryOrOpen!0 key!828 (_keys!5774 thiss!1248) (mask!8968 thiss!1248)))))

(declare-fun b!187388 () Bool)

(declare-fun res!88606 () Bool)

(assert (=> b!187388 (=> (not res!88606) (not e!123342))))

(assert (=> b!187388 (= res!88606 (not (= key!828 (bvneg key!828))))))

(declare-fun b!187389 () Bool)

(declare-fun e!123343 () Bool)

(assert (=> b!187389 (= e!123343 tp_is_empty!4385)))

(declare-fun b!187390 () Bool)

(declare-fun Unit!5651 () Unit!5649)

(assert (=> b!187390 (= e!123341 Unit!5651)))

(declare-fun lt!92695 () Unit!5649)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (array!7987 array!7989 (_ BitVec 32) (_ BitVec 32) V!5493 V!5493 (_ BitVec 64) Int) Unit!5649)

(assert (=> b!187390 (= lt!92695 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!154 (_keys!5774 thiss!1248) (_values!3806 thiss!1248) (mask!8968 thiss!1248) (extraKeys!3560 thiss!1248) (zeroValue!3664 thiss!1248) (minValue!3664 thiss!1248) key!828 (defaultEntry!3823 thiss!1248)))))

(assert (=> b!187390 false))

(declare-fun b!187391 () Bool)

(assert (=> b!187391 (= e!123347 (and e!123343 mapRes!7553))))

(declare-fun condMapEmpty!7553 () Bool)

(declare-fun mapDefault!7553 () ValueCell!1849)

