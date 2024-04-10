; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16746 () Bool)

(assert start!16746)

(declare-fun b!168307 () Bool)

(declare-fun b_free!4051 () Bool)

(declare-fun b_next!4051 () Bool)

(assert (=> b!168307 (= b_free!4051 (not b_next!4051))))

(declare-fun tp!14753 () Bool)

(declare-fun b_and!10465 () Bool)

(assert (=> b!168307 (= tp!14753 b_and!10465)))

(declare-fun b!168306 () Bool)

(declare-fun e!110630 () Bool)

(assert (=> b!168306 (= e!110630 true)))

(declare-fun lt!84154 () Bool)

(declare-datatypes ((V!4785 0))(
  ( (V!4786 (val!1971 Int)) )
))
(declare-datatypes ((ValueCell!1583 0))(
  ( (ValueCellFull!1583 (v!3836 V!4785)) (EmptyCell!1583) )
))
(declare-datatypes ((array!6803 0))(
  ( (array!6804 (arr!3237 (Array (_ BitVec 32) (_ BitVec 64))) (size!3525 (_ BitVec 32))) )
))
(declare-datatypes ((array!6805 0))(
  ( (array!6806 (arr!3238 (Array (_ BitVec 32) ValueCell!1583)) (size!3526 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2074 0))(
  ( (LongMapFixedSize!2075 (defaultEntry!3479 Int) (mask!8242 (_ BitVec 32)) (extraKeys!3220 (_ BitVec 32)) (zeroValue!3322 V!4785) (minValue!3322 V!4785) (_size!1086 (_ BitVec 32)) (_keys!5304 array!6803) (_values!3462 array!6805) (_vacant!1086 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2074)

(declare-datatypes ((List!2156 0))(
  ( (Nil!2153) (Cons!2152 (h!2769 (_ BitVec 64)) (t!6958 List!2156)) )
))
(declare-fun arrayNoDuplicates!0 (array!6803 (_ BitVec 32) List!2156) Bool)

(assert (=> b!168306 (= lt!84154 (arrayNoDuplicates!0 (_keys!5304 thiss!1248) #b00000000000000000000000000000000 Nil!2153))))

(declare-fun tp_is_empty!3853 () Bool)

(declare-fun e!110633 () Bool)

(declare-fun e!110635 () Bool)

(declare-fun array_inv!2081 (array!6803) Bool)

(declare-fun array_inv!2082 (array!6805) Bool)

(assert (=> b!168307 (= e!110635 (and tp!14753 tp_is_empty!3853 (array_inv!2081 (_keys!5304 thiss!1248)) (array_inv!2082 (_values!3462 thiss!1248)) e!110633))))

(declare-fun b!168308 () Bool)

(declare-fun e!110639 () Bool)

(declare-fun e!110637 () Bool)

(assert (=> b!168308 (= e!110639 e!110637)))

(declare-fun res!80111 () Bool)

(assert (=> b!168308 (=> (not res!80111) (not e!110637))))

(declare-datatypes ((SeekEntryResult!497 0))(
  ( (MissingZero!497 (index!4156 (_ BitVec 32))) (Found!497 (index!4157 (_ BitVec 32))) (Intermediate!497 (undefined!1309 Bool) (index!4158 (_ BitVec 32)) (x!18605 (_ BitVec 32))) (Undefined!497) (MissingVacant!497 (index!4159 (_ BitVec 32))) )
))
(declare-fun lt!84160 () SeekEntryResult!497)

(assert (=> b!168308 (= res!80111 (and (not (is-Undefined!497 lt!84160)) (not (is-MissingVacant!497 lt!84160)) (not (is-MissingZero!497 lt!84160)) (is-Found!497 lt!84160)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6803 (_ BitVec 32)) SeekEntryResult!497)

(assert (=> b!168308 (= lt!84160 (seekEntryOrOpen!0 key!828 (_keys!5304 thiss!1248) (mask!8242 thiss!1248)))))

(declare-fun b!168309 () Bool)

(declare-datatypes ((Unit!5175 0))(
  ( (Unit!5176) )
))
(declare-fun e!110636 () Unit!5175)

(declare-fun lt!84156 () Unit!5175)

(assert (=> b!168309 (= e!110636 lt!84156)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!120 (array!6803 array!6805 (_ BitVec 32) (_ BitVec 32) V!4785 V!4785 (_ BitVec 64) Int) Unit!5175)

(assert (=> b!168309 (= lt!84156 (lemmaInListMapThenSeekEntryOrOpenFindsIt!120 (_keys!5304 thiss!1248) (_values!3462 thiss!1248) (mask!8242 thiss!1248) (extraKeys!3220 thiss!1248) (zeroValue!3322 thiss!1248) (minValue!3322 thiss!1248) key!828 (defaultEntry!3479 thiss!1248)))))

(declare-fun res!80110 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168309 (= res!80110 (inRange!0 (index!4157 lt!84160) (mask!8242 thiss!1248)))))

(declare-fun e!110631 () Bool)

(assert (=> b!168309 (=> (not res!80110) (not e!110631))))

(assert (=> b!168309 e!110631))

(declare-fun b!168310 () Bool)

(declare-fun e!110632 () Bool)

(declare-fun mapRes!6498 () Bool)

(assert (=> b!168310 (= e!110633 (and e!110632 mapRes!6498))))

(declare-fun condMapEmpty!6498 () Bool)

(declare-fun mapDefault!6498 () ValueCell!1583)

