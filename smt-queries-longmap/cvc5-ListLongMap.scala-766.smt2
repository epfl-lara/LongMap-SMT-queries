; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18064 () Bool)

(assert start!18064)

(declare-fun b!179853 () Bool)

(declare-fun b_free!4435 () Bool)

(declare-fun b_next!4435 () Bool)

(assert (=> b!179853 (= b_free!4435 (not b_next!4435))))

(declare-fun tp!16036 () Bool)

(declare-fun b_and!10969 () Bool)

(assert (=> b!179853 (= tp!16036 b_and!10969)))

(declare-fun mapIsEmpty!7204 () Bool)

(declare-fun mapRes!7204 () Bool)

(assert (=> mapIsEmpty!7204 mapRes!7204))

(declare-fun b!179843 () Bool)

(declare-fun res!85190 () Bool)

(declare-fun e!118450 () Bool)

(assert (=> b!179843 (=> (not res!85190) (not e!118450))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5257 0))(
  ( (V!5258 (val!2148 Int)) )
))
(declare-datatypes ((ValueCell!1760 0))(
  ( (ValueCellFull!1760 (v!4037 V!5257)) (EmptyCell!1760) )
))
(declare-datatypes ((array!7583 0))(
  ( (array!7584 (arr!3591 (Array (_ BitVec 32) (_ BitVec 64))) (size!3899 (_ BitVec 32))) )
))
(declare-datatypes ((array!7585 0))(
  ( (array!7586 (arr!3592 (Array (_ BitVec 32) ValueCell!1760)) (size!3900 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2428 0))(
  ( (LongMapFixedSize!2429 (defaultEntry!3690 Int) (mask!8681 (_ BitVec 32)) (extraKeys!3427 (_ BitVec 32)) (zeroValue!3531 V!5257) (minValue!3531 V!5257) (_size!1263 (_ BitVec 32)) (_keys!5581 array!7583) (_values!3673 array!7585) (_vacant!1263 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2428)

(declare-datatypes ((SeekEntryResult!584 0))(
  ( (MissingZero!584 (index!4504 (_ BitVec 32))) (Found!584 (index!4505 (_ BitVec 32))) (Intermediate!584 (undefined!1396 Bool) (index!4506 (_ BitVec 32)) (x!19658 (_ BitVec 32))) (Undefined!584) (MissingVacant!584 (index!4507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7583 (_ BitVec 32)) SeekEntryResult!584)

(assert (=> b!179843 (= res!85190 (is-Undefined!584 (seekEntryOrOpen!0 key!828 (_keys!5581 thiss!1248) (mask!8681 thiss!1248))))))

(declare-fun b!179844 () Bool)

(declare-fun res!85193 () Bool)

(assert (=> b!179844 (=> (not res!85193) (not e!118450))))

(assert (=> b!179844 (= res!85193 (and (= (size!3900 (_values!3673 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8681 thiss!1248))) (= (size!3899 (_keys!5581 thiss!1248)) (size!3900 (_values!3673 thiss!1248))) (bvsge (mask!8681 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3427 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3427 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!179845 () Bool)

(declare-fun res!85194 () Bool)

(assert (=> b!179845 (=> (not res!85194) (not e!118450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7583 (_ BitVec 32)) Bool)

(assert (=> b!179845 (= res!85194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5581 thiss!1248) (mask!8681 thiss!1248)))))

(declare-fun b!179846 () Bool)

(assert (=> b!179846 (= e!118450 false)))

(declare-fun lt!88838 () Bool)

(declare-datatypes ((List!2281 0))(
  ( (Nil!2278) (Cons!2277 (h!2902 (_ BitVec 64)) (t!7129 List!2281)) )
))
(declare-fun arrayNoDuplicates!0 (array!7583 (_ BitVec 32) List!2281) Bool)

(assert (=> b!179846 (= lt!88838 (arrayNoDuplicates!0 (_keys!5581 thiss!1248) #b00000000000000000000000000000000 Nil!2278))))

(declare-fun b!179847 () Bool)

(declare-fun e!118447 () Bool)

(declare-fun tp_is_empty!4207 () Bool)

(assert (=> b!179847 (= e!118447 tp_is_empty!4207)))

(declare-fun b!179848 () Bool)

(declare-fun res!85195 () Bool)

(assert (=> b!179848 (=> (not res!85195) (not e!118450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179848 (= res!85195 (validMask!0 (mask!8681 thiss!1248)))))

(declare-fun b!179849 () Bool)

(declare-fun e!118446 () Bool)

(assert (=> b!179849 (= e!118446 tp_is_empty!4207)))

(declare-fun b!179850 () Bool)

(declare-fun e!118448 () Bool)

(assert (=> b!179850 (= e!118448 (and e!118446 mapRes!7204))))

(declare-fun condMapEmpty!7204 () Bool)

(declare-fun mapDefault!7204 () ValueCell!1760)

