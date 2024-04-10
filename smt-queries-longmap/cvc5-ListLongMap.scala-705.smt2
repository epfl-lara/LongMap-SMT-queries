; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16734 () Bool)

(assert start!16734)

(declare-fun b!168079 () Bool)

(declare-fun b_free!4039 () Bool)

(declare-fun b_next!4039 () Bool)

(assert (=> b!168079 (= b_free!4039 (not b_next!4039))))

(declare-fun tp!14718 () Bool)

(declare-fun b_and!10453 () Bool)

(assert (=> b!168079 (= tp!14718 b_and!10453)))

(declare-fun b!168072 () Bool)

(declare-fun res!79980 () Bool)

(declare-fun e!110458 () Bool)

(assert (=> b!168072 (=> res!79980 e!110458)))

(declare-datatypes ((V!4769 0))(
  ( (V!4770 (val!1965 Int)) )
))
(declare-datatypes ((ValueCell!1577 0))(
  ( (ValueCellFull!1577 (v!3830 V!4769)) (EmptyCell!1577) )
))
(declare-datatypes ((array!6779 0))(
  ( (array!6780 (arr!3225 (Array (_ BitVec 32) (_ BitVec 64))) (size!3513 (_ BitVec 32))) )
))
(declare-datatypes ((array!6781 0))(
  ( (array!6782 (arr!3226 (Array (_ BitVec 32) ValueCell!1577)) (size!3514 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2062 0))(
  ( (LongMapFixedSize!2063 (defaultEntry!3473 Int) (mask!8232 (_ BitVec 32)) (extraKeys!3214 (_ BitVec 32)) (zeroValue!3316 V!4769) (minValue!3316 V!4769) (_size!1080 (_ BitVec 32)) (_keys!5298 array!6779) (_values!3456 array!6781) (_vacant!1080 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2062)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6779 (_ BitVec 32)) Bool)

(assert (=> b!168072 (= res!79980 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5298 thiss!1248) (mask!8232 thiss!1248))))))

(declare-fun b!168073 () Bool)

(assert (=> b!168073 (= e!110458 true)))

(declare-fun lt!84032 () Bool)

(declare-datatypes ((List!2147 0))(
  ( (Nil!2144) (Cons!2143 (h!2760 (_ BitVec 64)) (t!6949 List!2147)) )
))
(declare-fun arrayNoDuplicates!0 (array!6779 (_ BitVec 32) List!2147) Bool)

(assert (=> b!168073 (= lt!84032 (arrayNoDuplicates!0 (_keys!5298 thiss!1248) #b00000000000000000000000000000000 Nil!2144))))

(declare-fun b!168074 () Bool)

(declare-fun e!110456 () Bool)

(declare-fun e!110453 () Bool)

(assert (=> b!168074 (= e!110456 e!110453)))

(declare-fun res!79982 () Bool)

(assert (=> b!168074 (=> (not res!79982) (not e!110453))))

(declare-datatypes ((SeekEntryResult!492 0))(
  ( (MissingZero!492 (index!4136 (_ BitVec 32))) (Found!492 (index!4137 (_ BitVec 32))) (Intermediate!492 (undefined!1304 Bool) (index!4138 (_ BitVec 32)) (x!18584 (_ BitVec 32))) (Undefined!492) (MissingVacant!492 (index!4139 (_ BitVec 32))) )
))
(declare-fun lt!84034 () SeekEntryResult!492)

(assert (=> b!168074 (= res!79982 (and (not (is-Undefined!492 lt!84034)) (not (is-MissingVacant!492 lt!84034)) (not (is-MissingZero!492 lt!84034)) (is-Found!492 lt!84034)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6779 (_ BitVec 32)) SeekEntryResult!492)

(assert (=> b!168074 (= lt!84034 (seekEntryOrOpen!0 key!828 (_keys!5298 thiss!1248) (mask!8232 thiss!1248)))))

(declare-fun e!110454 () Bool)

(declare-fun b!168075 () Bool)

(assert (=> b!168075 (= e!110454 (= (select (arr!3225 (_keys!5298 thiss!1248)) (index!4137 lt!84034)) key!828))))

(declare-fun b!168076 () Bool)

(declare-datatypes ((Unit!5160 0))(
  ( (Unit!5161) )
))
(declare-fun e!110451 () Unit!5160)

(declare-fun Unit!5162 () Unit!5160)

(assert (=> b!168076 (= e!110451 Unit!5162)))

(declare-fun lt!84030 () Unit!5160)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!117 (array!6779 array!6781 (_ BitVec 32) (_ BitVec 32) V!4769 V!4769 (_ BitVec 64) Int) Unit!5160)

(assert (=> b!168076 (= lt!84030 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!117 (_keys!5298 thiss!1248) (_values!3456 thiss!1248) (mask!8232 thiss!1248) (extraKeys!3214 thiss!1248) (zeroValue!3316 thiss!1248) (minValue!3316 thiss!1248) key!828 (defaultEntry!3473 thiss!1248)))))

(assert (=> b!168076 false))

(declare-fun b!168077 () Bool)

(declare-fun e!110450 () Bool)

(declare-fun e!110457 () Bool)

(declare-fun mapRes!6480 () Bool)

(assert (=> b!168077 (= e!110450 (and e!110457 mapRes!6480))))

(declare-fun condMapEmpty!6480 () Bool)

(declare-fun mapDefault!6480 () ValueCell!1577)

