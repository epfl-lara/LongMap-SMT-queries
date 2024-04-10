; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16686 () Bool)

(assert start!16686)

(declare-fun b!167139 () Bool)

(declare-fun b_free!3991 () Bool)

(declare-fun b_next!3991 () Bool)

(assert (=> b!167139 (= b_free!3991 (not b_next!3991))))

(declare-fun tp!14574 () Bool)

(declare-fun b_and!10405 () Bool)

(assert (=> b!167139 (= tp!14574 b_and!10405)))

(declare-fun res!79478 () Bool)

(declare-fun e!109738 () Bool)

(assert (=> start!16686 (=> (not res!79478) (not e!109738))))

(declare-datatypes ((V!4705 0))(
  ( (V!4706 (val!1941 Int)) )
))
(declare-datatypes ((ValueCell!1553 0))(
  ( (ValueCellFull!1553 (v!3806 V!4705)) (EmptyCell!1553) )
))
(declare-datatypes ((array!6683 0))(
  ( (array!6684 (arr!3177 (Array (_ BitVec 32) (_ BitVec 64))) (size!3465 (_ BitVec 32))) )
))
(declare-datatypes ((array!6685 0))(
  ( (array!6686 (arr!3178 (Array (_ BitVec 32) ValueCell!1553)) (size!3466 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2014 0))(
  ( (LongMapFixedSize!2015 (defaultEntry!3449 Int) (mask!8192 (_ BitVec 32)) (extraKeys!3190 (_ BitVec 32)) (zeroValue!3292 V!4705) (minValue!3292 V!4705) (_size!1056 (_ BitVec 32)) (_keys!5274 array!6683) (_values!3432 array!6685) (_vacant!1056 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2014)

(declare-fun valid!882 (LongMapFixedSize!2014) Bool)

(assert (=> start!16686 (= res!79478 (valid!882 thiss!1248))))

(assert (=> start!16686 e!109738))

(declare-fun e!109731 () Bool)

(assert (=> start!16686 e!109731))

(assert (=> start!16686 true))

(declare-fun b!167136 () Bool)

(declare-fun e!109734 () Bool)

(assert (=> b!167136 (= e!109738 e!109734)))

(declare-fun res!79477 () Bool)

(assert (=> b!167136 (=> (not res!79477) (not e!109734))))

(declare-datatypes ((SeekEntryResult!472 0))(
  ( (MissingZero!472 (index!4056 (_ BitVec 32))) (Found!472 (index!4057 (_ BitVec 32))) (Intermediate!472 (undefined!1284 Bool) (index!4058 (_ BitVec 32)) (x!18500 (_ BitVec 32))) (Undefined!472) (MissingVacant!472 (index!4059 (_ BitVec 32))) )
))
(declare-fun lt!83576 () SeekEntryResult!472)

(assert (=> b!167136 (= res!79477 (and (not (is-Undefined!472 lt!83576)) (not (is-MissingVacant!472 lt!83576)) (not (is-MissingZero!472 lt!83576)) (is-Found!472 lt!83576)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6683 (_ BitVec 32)) SeekEntryResult!472)

(assert (=> b!167136 (= lt!83576 (seekEntryOrOpen!0 key!828 (_keys!5274 thiss!1248) (mask!8192 thiss!1248)))))

(declare-fun b!167137 () Bool)

(declare-fun e!109735 () Bool)

(declare-fun tp_is_empty!3793 () Bool)

(assert (=> b!167137 (= e!109735 tp_is_empty!3793)))

(declare-fun b!167138 () Bool)

(declare-fun e!109733 () Bool)

(assert (=> b!167138 (= e!109733 tp_is_empty!3793)))

(declare-fun e!109737 () Bool)

(declare-fun array_inv!2043 (array!6683) Bool)

(declare-fun array_inv!2044 (array!6685) Bool)

(assert (=> b!167139 (= e!109731 (and tp!14574 tp_is_empty!3793 (array_inv!2043 (_keys!5274 thiss!1248)) (array_inv!2044 (_values!3432 thiss!1248)) e!109737))))

(declare-fun b!167140 () Bool)

(declare-fun res!79480 () Bool)

(assert (=> b!167140 (=> (not res!79480) (not e!109738))))

(assert (=> b!167140 (= res!79480 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6408 () Bool)

(declare-fun mapRes!6408 () Bool)

(assert (=> mapIsEmpty!6408 mapRes!6408))

(declare-fun mapNonEmpty!6408 () Bool)

(declare-fun tp!14573 () Bool)

(assert (=> mapNonEmpty!6408 (= mapRes!6408 (and tp!14573 e!109735))))

(declare-fun mapRest!6408 () (Array (_ BitVec 32) ValueCell!1553))

(declare-fun mapValue!6408 () ValueCell!1553)

(declare-fun mapKey!6408 () (_ BitVec 32))

(assert (=> mapNonEmpty!6408 (= (arr!3178 (_values!3432 thiss!1248)) (store mapRest!6408 mapKey!6408 mapValue!6408))))

(declare-fun b!167141 () Bool)

(declare-datatypes ((Unit!5106 0))(
  ( (Unit!5107) )
))
(declare-fun e!109730 () Unit!5106)

(declare-fun Unit!5108 () Unit!5106)

(assert (=> b!167141 (= e!109730 Unit!5108)))

(declare-fun lt!83574 () Unit!5106)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!101 (array!6683 array!6685 (_ BitVec 32) (_ BitVec 32) V!4705 V!4705 (_ BitVec 64) Int) Unit!5106)

(assert (=> b!167141 (= lt!83574 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!101 (_keys!5274 thiss!1248) (_values!3432 thiss!1248) (mask!8192 thiss!1248) (extraKeys!3190 thiss!1248) (zeroValue!3292 thiss!1248) (minValue!3292 thiss!1248) key!828 (defaultEntry!3449 thiss!1248)))))

(assert (=> b!167141 false))

(declare-fun b!167142 () Bool)

(declare-fun e!109739 () Bool)

(assert (=> b!167142 (= e!109739 false)))

(declare-fun lt!83575 () Bool)

(declare-datatypes ((List!2118 0))(
  ( (Nil!2115) (Cons!2114 (h!2731 (_ BitVec 64)) (t!6920 List!2118)) )
))
(declare-fun arrayNoDuplicates!0 (array!6683 (_ BitVec 32) List!2118) Bool)

(assert (=> b!167142 (= lt!83575 (arrayNoDuplicates!0 (_keys!5274 thiss!1248) #b00000000000000000000000000000000 Nil!2115))))

(declare-fun b!167143 () Bool)

(assert (=> b!167143 (= e!109737 (and e!109733 mapRes!6408))))

(declare-fun condMapEmpty!6408 () Bool)

(declare-fun mapDefault!6408 () ValueCell!1553)

