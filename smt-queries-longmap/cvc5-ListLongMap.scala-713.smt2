; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16782 () Bool)

(assert start!16782)

(declare-fun b!168948 () Bool)

(declare-fun b_free!4087 () Bool)

(declare-fun b_next!4087 () Bool)

(assert (=> b!168948 (= b_free!4087 (not b_next!4087))))

(declare-fun tp!14862 () Bool)

(declare-fun b_and!10501 () Bool)

(assert (=> b!168948 (= tp!14862 b_and!10501)))

(declare-fun b!168939 () Bool)

(declare-datatypes ((SeekEntryResult!514 0))(
  ( (MissingZero!514 (index!4224 (_ BitVec 32))) (Found!514 (index!4225 (_ BitVec 32))) (Intermediate!514 (undefined!1326 Bool) (index!4226 (_ BitVec 32)) (x!18670 (_ BitVec 32))) (Undefined!514) (MissingVacant!514 (index!4227 (_ BitVec 32))) )
))
(declare-fun lt!84667 () SeekEntryResult!514)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4833 0))(
  ( (V!4834 (val!1989 Int)) )
))
(declare-datatypes ((ValueCell!1601 0))(
  ( (ValueCellFull!1601 (v!3854 V!4833)) (EmptyCell!1601) )
))
(declare-datatypes ((array!6875 0))(
  ( (array!6876 (arr!3273 (Array (_ BitVec 32) (_ BitVec 64))) (size!3561 (_ BitVec 32))) )
))
(declare-datatypes ((array!6877 0))(
  ( (array!6878 (arr!3274 (Array (_ BitVec 32) ValueCell!1601)) (size!3562 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2110 0))(
  ( (LongMapFixedSize!2111 (defaultEntry!3497 Int) (mask!8272 (_ BitVec 32)) (extraKeys!3238 (_ BitVec 32)) (zeroValue!3340 V!4833) (minValue!3340 V!4833) (_size!1104 (_ BitVec 32)) (_keys!5322 array!6875) (_values!3480 array!6877) (_vacant!1104 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2110)

(declare-fun e!111159 () Bool)

(assert (=> b!168939 (= e!111159 (= (select (arr!3273 (_keys!5322 thiss!1248)) (index!4225 lt!84667)) key!828))))

(declare-fun b!168940 () Bool)

(declare-fun res!80417 () Bool)

(declare-fun e!111161 () Bool)

(assert (=> b!168940 (=> (not res!80417) (not e!111161))))

(assert (=> b!168940 (= res!80417 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6552 () Bool)

(declare-fun mapRes!6552 () Bool)

(assert (=> mapIsEmpty!6552 mapRes!6552))

(declare-fun b!168941 () Bool)

(declare-fun e!111162 () Bool)

(declare-fun tp_is_empty!3889 () Bool)

(assert (=> b!168941 (= e!111162 tp_is_empty!3889)))

(declare-fun res!80418 () Bool)

(assert (=> start!16782 (=> (not res!80418) (not e!111161))))

(declare-fun valid!914 (LongMapFixedSize!2110) Bool)

(assert (=> start!16782 (= res!80418 (valid!914 thiss!1248))))

(assert (=> start!16782 e!111161))

(declare-fun e!111166 () Bool)

(assert (=> start!16782 e!111166))

(assert (=> start!16782 true))

(assert (=> start!16782 tp_is_empty!3889))

(declare-fun b!168942 () Bool)

(declare-datatypes ((Unit!5221 0))(
  ( (Unit!5222) )
))
(declare-fun e!111164 () Unit!5221)

(declare-fun lt!84666 () Unit!5221)

(assert (=> b!168942 (= e!111164 lt!84666)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!132 (array!6875 array!6877 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 64) Int) Unit!5221)

(assert (=> b!168942 (= lt!84666 (lemmaInListMapThenSeekEntryOrOpenFindsIt!132 (_keys!5322 thiss!1248) (_values!3480 thiss!1248) (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) key!828 (defaultEntry!3497 thiss!1248)))))

(declare-fun res!80415 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168942 (= res!80415 (inRange!0 (index!4225 lt!84667) (mask!8272 thiss!1248)))))

(assert (=> b!168942 (=> (not res!80415) (not e!111159))))

(assert (=> b!168942 e!111159))

(declare-fun b!168943 () Bool)

(declare-fun Unit!5223 () Unit!5221)

(assert (=> b!168943 (= e!111164 Unit!5223)))

(declare-fun lt!84673 () Unit!5221)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!134 (array!6875 array!6877 (_ BitVec 32) (_ BitVec 32) V!4833 V!4833 (_ BitVec 64) Int) Unit!5221)

(assert (=> b!168943 (= lt!84673 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!134 (_keys!5322 thiss!1248) (_values!3480 thiss!1248) (mask!8272 thiss!1248) (extraKeys!3238 thiss!1248) (zeroValue!3340 thiss!1248) (minValue!3340 thiss!1248) key!828 (defaultEntry!3497 thiss!1248)))))

(assert (=> b!168943 false))

(declare-fun b!168944 () Bool)

(declare-fun e!111167 () Bool)

(assert (=> b!168944 (= e!111161 e!111167)))

(declare-fun res!80416 () Bool)

(assert (=> b!168944 (=> (not res!80416) (not e!111167))))

(assert (=> b!168944 (= res!80416 (and (not (is-Undefined!514 lt!84667)) (not (is-MissingVacant!514 lt!84667)) (not (is-MissingZero!514 lt!84667)) (is-Found!514 lt!84667)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6875 (_ BitVec 32)) SeekEntryResult!514)

(assert (=> b!168944 (= lt!84667 (seekEntryOrOpen!0 key!828 (_keys!5322 thiss!1248) (mask!8272 thiss!1248)))))

(declare-fun mapNonEmpty!6552 () Bool)

(declare-fun tp!14861 () Bool)

(declare-fun e!111163 () Bool)

(assert (=> mapNonEmpty!6552 (= mapRes!6552 (and tp!14861 e!111163))))

(declare-fun mapRest!6552 () (Array (_ BitVec 32) ValueCell!1601))

(declare-fun mapValue!6552 () ValueCell!1601)

(declare-fun mapKey!6552 () (_ BitVec 32))

(assert (=> mapNonEmpty!6552 (= (arr!3274 (_values!3480 thiss!1248)) (store mapRest!6552 mapKey!6552 mapValue!6552))))

(declare-fun b!168945 () Bool)

(declare-fun e!111165 () Bool)

(assert (=> b!168945 (= e!111165 (and e!111162 mapRes!6552))))

(declare-fun condMapEmpty!6552 () Bool)

(declare-fun mapDefault!6552 () ValueCell!1601)

