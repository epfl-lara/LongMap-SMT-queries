; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16756 () Bool)

(assert start!16756)

(declare-fun b!168508 () Bool)

(declare-fun b_free!4061 () Bool)

(declare-fun b_next!4061 () Bool)

(assert (=> b!168508 (= b_free!4061 (not b_next!4061))))

(declare-fun tp!14784 () Bool)

(declare-fun b_and!10475 () Bool)

(assert (=> b!168508 (= tp!14784 b_and!10475)))

(declare-fun b!168501 () Bool)

(declare-fun e!110780 () Bool)

(declare-fun e!110784 () Bool)

(assert (=> b!168501 (= e!110780 e!110784)))

(declare-fun res!80213 () Bool)

(assert (=> b!168501 (=> (not res!80213) (not e!110784))))

(declare-datatypes ((SeekEntryResult!502 0))(
  ( (MissingZero!502 (index!4176 (_ BitVec 32))) (Found!502 (index!4177 (_ BitVec 32))) (Intermediate!502 (undefined!1314 Bool) (index!4178 (_ BitVec 32)) (x!18618 (_ BitVec 32))) (Undefined!502) (MissingVacant!502 (index!4179 (_ BitVec 32))) )
))
(declare-fun lt!84259 () SeekEntryResult!502)

(assert (=> b!168501 (= res!80213 (and (not (is-Undefined!502 lt!84259)) (not (is-MissingVacant!502 lt!84259)) (not (is-MissingZero!502 lt!84259)) (is-Found!502 lt!84259)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4797 0))(
  ( (V!4798 (val!1976 Int)) )
))
(declare-datatypes ((ValueCell!1588 0))(
  ( (ValueCellFull!1588 (v!3841 V!4797)) (EmptyCell!1588) )
))
(declare-datatypes ((array!6823 0))(
  ( (array!6824 (arr!3247 (Array (_ BitVec 32) (_ BitVec 64))) (size!3535 (_ BitVec 32))) )
))
(declare-datatypes ((array!6825 0))(
  ( (array!6826 (arr!3248 (Array (_ BitVec 32) ValueCell!1588)) (size!3536 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2084 0))(
  ( (LongMapFixedSize!2085 (defaultEntry!3484 Int) (mask!8249 (_ BitVec 32)) (extraKeys!3225 (_ BitVec 32)) (zeroValue!3327 V!4797) (minValue!3327 V!4797) (_size!1091 (_ BitVec 32)) (_keys!5309 array!6823) (_values!3467 array!6825) (_vacant!1091 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2084)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6823 (_ BitVec 32)) SeekEntryResult!502)

(assert (=> b!168501 (= lt!84259 (seekEntryOrOpen!0 key!828 (_keys!5309 thiss!1248) (mask!8249 thiss!1248)))))

(declare-fun b!168502 () Bool)

(declare-fun res!80215 () Bool)

(declare-fun e!110787 () Bool)

(assert (=> b!168502 (=> res!80215 e!110787)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6823 (_ BitVec 32)) Bool)

(assert (=> b!168502 (= res!80215 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5309 thiss!1248) (mask!8249 thiss!1248))))))

(declare-fun b!168503 () Bool)

(assert (=> b!168503 (= e!110787 true)))

(declare-fun lt!84262 () Bool)

(declare-datatypes ((List!2162 0))(
  ( (Nil!2159) (Cons!2158 (h!2775 (_ BitVec 64)) (t!6964 List!2162)) )
))
(declare-fun arrayNoDuplicates!0 (array!6823 (_ BitVec 32) List!2162) Bool)

(assert (=> b!168503 (= lt!84262 (arrayNoDuplicates!0 (_keys!5309 thiss!1248) #b00000000000000000000000000000000 Nil!2159))))

(declare-fun mapNonEmpty!6513 () Bool)

(declare-fun mapRes!6513 () Bool)

(declare-fun tp!14783 () Bool)

(declare-fun e!110782 () Bool)

(assert (=> mapNonEmpty!6513 (= mapRes!6513 (and tp!14783 e!110782))))

(declare-fun mapKey!6513 () (_ BitVec 32))

(declare-fun mapValue!6513 () ValueCell!1588)

(declare-fun mapRest!6513 () (Array (_ BitVec 32) ValueCell!1588))

(assert (=> mapNonEmpty!6513 (= (arr!3248 (_values!3467 thiss!1248)) (store mapRest!6513 mapKey!6513 mapValue!6513))))

(declare-fun b!168504 () Bool)

(declare-datatypes ((Unit!5189 0))(
  ( (Unit!5190) )
))
(declare-fun e!110785 () Unit!5189)

(declare-fun lt!84260 () Unit!5189)

(assert (=> b!168504 (= e!110785 lt!84260)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!123 (array!6823 array!6825 (_ BitVec 32) (_ BitVec 32) V!4797 V!4797 (_ BitVec 64) Int) Unit!5189)

(assert (=> b!168504 (= lt!84260 (lemmaInListMapThenSeekEntryOrOpenFindsIt!123 (_keys!5309 thiss!1248) (_values!3467 thiss!1248) (mask!8249 thiss!1248) (extraKeys!3225 thiss!1248) (zeroValue!3327 thiss!1248) (minValue!3327 thiss!1248) key!828 (defaultEntry!3484 thiss!1248)))))

(declare-fun res!80214 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168504 (= res!80214 (inRange!0 (index!4177 lt!84259) (mask!8249 thiss!1248)))))

(declare-fun e!110786 () Bool)

(assert (=> b!168504 (=> (not res!80214) (not e!110786))))

(assert (=> b!168504 e!110786))

(declare-fun b!168505 () Bool)

(declare-fun e!110788 () Bool)

(declare-fun e!110781 () Bool)

(assert (=> b!168505 (= e!110788 (and e!110781 mapRes!6513))))

(declare-fun condMapEmpty!6513 () Bool)

(declare-fun mapDefault!6513 () ValueCell!1588)

