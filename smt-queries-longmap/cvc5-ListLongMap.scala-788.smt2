; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18772 () Bool)

(assert start!18772)

(declare-fun b!185502 () Bool)

(declare-fun b_free!4567 () Bool)

(declare-fun b_next!4567 () Bool)

(assert (=> b!185502 (= b_free!4567 (not b_next!4567))))

(declare-fun tp!16496 () Bool)

(declare-fun b_and!11167 () Bool)

(assert (=> b!185502 (= tp!16496 b_and!11167)))

(declare-fun b!185496 () Bool)

(declare-fun e!122065 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185496 (= e!122065 (not (validKeyInArray!0 key!828)))))

(declare-fun b!185497 () Bool)

(declare-fun res!87743 () Bool)

(assert (=> b!185497 (=> (not res!87743) (not e!122065))))

(declare-datatypes ((V!5433 0))(
  ( (V!5434 (val!2214 Int)) )
))
(declare-datatypes ((ValueCell!1826 0))(
  ( (ValueCellFull!1826 (v!4124 V!5433)) (EmptyCell!1826) )
))
(declare-datatypes ((array!7885 0))(
  ( (array!7886 (arr!3723 (Array (_ BitVec 32) (_ BitVec 64))) (size!4039 (_ BitVec 32))) )
))
(declare-datatypes ((array!7887 0))(
  ( (array!7888 (arr!3724 (Array (_ BitVec 32) ValueCell!1826)) (size!4040 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2560 0))(
  ( (LongMapFixedSize!2561 (defaultEntry!3781 Int) (mask!8889 (_ BitVec 32)) (extraKeys!3518 (_ BitVec 32)) (zeroValue!3622 V!5433) (minValue!3622 V!5433) (_size!1329 (_ BitVec 32)) (_keys!5720 array!7885) (_values!3764 array!7887) (_vacant!1329 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2560)

(declare-datatypes ((List!2360 0))(
  ( (Nil!2357) (Cons!2356 (h!2989 (_ BitVec 64)) (t!7242 List!2360)) )
))
(declare-fun arrayNoDuplicates!0 (array!7885 (_ BitVec 32) List!2360) Bool)

(assert (=> b!185497 (= res!87743 (arrayNoDuplicates!0 (_keys!5720 thiss!1248) #b00000000000000000000000000000000 Nil!2357))))

(declare-fun mapIsEmpty!7467 () Bool)

(declare-fun mapRes!7467 () Bool)

(assert (=> mapIsEmpty!7467 mapRes!7467))

(declare-fun b!185498 () Bool)

(declare-fun res!87746 () Bool)

(assert (=> b!185498 (=> (not res!87746) (not e!122065))))

(assert (=> b!185498 (= res!87746 (and (= (size!4040 (_values!3764 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8889 thiss!1248))) (= (size!4039 (_keys!5720 thiss!1248)) (size!4040 (_values!3764 thiss!1248))) (bvsge (mask!8889 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3518 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3518 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!185499 () Bool)

(declare-fun e!122067 () Bool)

(declare-fun tp_is_empty!4339 () Bool)

(assert (=> b!185499 (= e!122067 tp_is_empty!4339)))

(declare-fun res!87749 () Bool)

(declare-fun e!122064 () Bool)

(assert (=> start!18772 (=> (not res!87749) (not e!122064))))

(declare-fun valid!1056 (LongMapFixedSize!2560) Bool)

(assert (=> start!18772 (= res!87749 (valid!1056 thiss!1248))))

(assert (=> start!18772 e!122064))

(declare-fun e!122063 () Bool)

(assert (=> start!18772 e!122063))

(assert (=> start!18772 true))

(declare-fun b!185500 () Bool)

(declare-fun res!87745 () Bool)

(assert (=> b!185500 (=> (not res!87745) (not e!122065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7885 (_ BitVec 32)) Bool)

(assert (=> b!185500 (= res!87745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(declare-fun mapNonEmpty!7467 () Bool)

(declare-fun tp!16497 () Bool)

(assert (=> mapNonEmpty!7467 (= mapRes!7467 (and tp!16497 e!122067))))

(declare-fun mapValue!7467 () ValueCell!1826)

(declare-fun mapKey!7467 () (_ BitVec 32))

(declare-fun mapRest!7467 () (Array (_ BitVec 32) ValueCell!1826))

(assert (=> mapNonEmpty!7467 (= (arr!3724 (_values!3764 thiss!1248)) (store mapRest!7467 mapKey!7467 mapValue!7467))))

(declare-fun b!185501 () Bool)

(declare-fun e!122062 () Bool)

(assert (=> b!185501 (= e!122062 tp_is_empty!4339)))

(declare-fun e!122066 () Bool)

(declare-fun array_inv!2409 (array!7885) Bool)

(declare-fun array_inv!2410 (array!7887) Bool)

(assert (=> b!185502 (= e!122063 (and tp!16496 tp_is_empty!4339 (array_inv!2409 (_keys!5720 thiss!1248)) (array_inv!2410 (_values!3764 thiss!1248)) e!122066))))

(declare-fun b!185503 () Bool)

(assert (=> b!185503 (= e!122064 e!122065)))

(declare-fun res!87747 () Bool)

(assert (=> b!185503 (=> (not res!87747) (not e!122065))))

(declare-datatypes ((SeekEntryResult!633 0))(
  ( (MissingZero!633 (index!4702 (_ BitVec 32))) (Found!633 (index!4703 (_ BitVec 32))) (Intermediate!633 (undefined!1445 Bool) (index!4704 (_ BitVec 32)) (x!20145 (_ BitVec 32))) (Undefined!633) (MissingVacant!633 (index!4705 (_ BitVec 32))) )
))
(declare-fun lt!91749 () SeekEntryResult!633)

(assert (=> b!185503 (= res!87747 (and (not (is-Undefined!633 lt!91749)) (not (is-MissingVacant!633 lt!91749)) (not (is-MissingZero!633 lt!91749)) (is-Found!633 lt!91749)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7885 (_ BitVec 32)) SeekEntryResult!633)

(assert (=> b!185503 (= lt!91749 (seekEntryOrOpen!0 key!828 (_keys!5720 thiss!1248) (mask!8889 thiss!1248)))))

(declare-fun b!185504 () Bool)

(declare-fun res!87748 () Bool)

(assert (=> b!185504 (=> (not res!87748) (not e!122065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185504 (= res!87748 (validMask!0 (mask!8889 thiss!1248)))))

(declare-fun b!185505 () Bool)

(assert (=> b!185505 (= e!122066 (and e!122062 mapRes!7467))))

(declare-fun condMapEmpty!7467 () Bool)

(declare-fun mapDefault!7467 () ValueCell!1826)

