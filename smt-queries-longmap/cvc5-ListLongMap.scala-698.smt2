; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16692 () Bool)

(assert start!16692)

(declare-fun b!167253 () Bool)

(declare-fun b_free!3997 () Bool)

(declare-fun b_next!3997 () Bool)

(assert (=> b!167253 (= b_free!3997 (not b_next!3997))))

(declare-fun tp!14591 () Bool)

(declare-fun b_and!10411 () Bool)

(assert (=> b!167253 (= tp!14591 b_and!10411)))

(declare-fun e!109820 () Bool)

(declare-fun e!109824 () Bool)

(declare-datatypes ((V!4713 0))(
  ( (V!4714 (val!1944 Int)) )
))
(declare-datatypes ((ValueCell!1556 0))(
  ( (ValueCellFull!1556 (v!3809 V!4713)) (EmptyCell!1556) )
))
(declare-datatypes ((array!6695 0))(
  ( (array!6696 (arr!3183 (Array (_ BitVec 32) (_ BitVec 64))) (size!3471 (_ BitVec 32))) )
))
(declare-datatypes ((array!6697 0))(
  ( (array!6698 (arr!3184 (Array (_ BitVec 32) ValueCell!1556)) (size!3472 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2020 0))(
  ( (LongMapFixedSize!2021 (defaultEntry!3452 Int) (mask!8197 (_ BitVec 32)) (extraKeys!3193 (_ BitVec 32)) (zeroValue!3295 V!4713) (minValue!3295 V!4713) (_size!1059 (_ BitVec 32)) (_keys!5277 array!6695) (_values!3435 array!6697) (_vacant!1059 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2020)

(declare-fun tp_is_empty!3799 () Bool)

(declare-fun array_inv!2049 (array!6695) Bool)

(declare-fun array_inv!2050 (array!6697) Bool)

(assert (=> b!167253 (= e!109824 (and tp!14591 tp_is_empty!3799 (array_inv!2049 (_keys!5277 thiss!1248)) (array_inv!2050 (_values!3435 thiss!1248)) e!109820))))

(declare-fun b!167254 () Bool)

(declare-fun e!109822 () Bool)

(declare-fun e!109828 () Bool)

(assert (=> b!167254 (= e!109822 e!109828)))

(declare-fun res!79543 () Bool)

(assert (=> b!167254 (=> (not res!79543) (not e!109828))))

(declare-datatypes ((SeekEntryResult!475 0))(
  ( (MissingZero!475 (index!4068 (_ BitVec 32))) (Found!475 (index!4069 (_ BitVec 32))) (Intermediate!475 (undefined!1287 Bool) (index!4070 (_ BitVec 32)) (x!18511 (_ BitVec 32))) (Undefined!475) (MissingVacant!475 (index!4071 (_ BitVec 32))) )
))
(declare-fun lt!83619 () SeekEntryResult!475)

(assert (=> b!167254 (= res!79543 (and (not (is-Undefined!475 lt!83619)) (not (is-MissingVacant!475 lt!83619)) (not (is-MissingZero!475 lt!83619)) (is-Found!475 lt!83619)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6695 (_ BitVec 32)) SeekEntryResult!475)

(assert (=> b!167254 (= lt!83619 (seekEntryOrOpen!0 key!828 (_keys!5277 thiss!1248) (mask!8197 thiss!1248)))))

(declare-fun mapIsEmpty!6417 () Bool)

(declare-fun mapRes!6417 () Bool)

(assert (=> mapIsEmpty!6417 mapRes!6417))

(declare-fun b!167255 () Bool)

(declare-fun res!79544 () Bool)

(assert (=> b!167255 (=> (not res!79544) (not e!109822))))

(assert (=> b!167255 (= res!79544 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167256 () Bool)

(declare-fun e!109826 () Bool)

(assert (=> b!167256 (= e!109826 false)))

(declare-fun lt!83622 () Bool)

(declare-datatypes ((List!2122 0))(
  ( (Nil!2119) (Cons!2118 (h!2735 (_ BitVec 64)) (t!6924 List!2122)) )
))
(declare-fun arrayNoDuplicates!0 (array!6695 (_ BitVec 32) List!2122) Bool)

(assert (=> b!167256 (= lt!83622 (arrayNoDuplicates!0 (_keys!5277 thiss!1248) #b00000000000000000000000000000000 Nil!2119))))

(declare-fun b!167257 () Bool)

(declare-datatypes ((Unit!5115 0))(
  ( (Unit!5116) )
))
(declare-fun e!109829 () Unit!5115)

(declare-fun lt!83621 () Unit!5115)

(assert (=> b!167257 (= e!109829 lt!83621)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!102 (array!6695 array!6697 (_ BitVec 32) (_ BitVec 32) V!4713 V!4713 (_ BitVec 64) Int) Unit!5115)

(assert (=> b!167257 (= lt!83621 (lemmaInListMapThenSeekEntryOrOpenFindsIt!102 (_keys!5277 thiss!1248) (_values!3435 thiss!1248) (mask!8197 thiss!1248) (extraKeys!3193 thiss!1248) (zeroValue!3295 thiss!1248) (minValue!3295 thiss!1248) key!828 (defaultEntry!3452 thiss!1248)))))

(declare-fun res!79540 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167257 (= res!79540 (inRange!0 (index!4069 lt!83619) (mask!8197 thiss!1248)))))

(declare-fun e!109825 () Bool)

(assert (=> b!167257 (=> (not res!79540) (not e!109825))))

(assert (=> b!167257 e!109825))

(declare-fun b!167258 () Bool)

(declare-fun e!109821 () Bool)

(assert (=> b!167258 (= e!109820 (and e!109821 mapRes!6417))))

(declare-fun condMapEmpty!6417 () Bool)

(declare-fun mapDefault!6417 () ValueCell!1556)

