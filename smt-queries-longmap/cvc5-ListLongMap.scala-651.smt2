; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16254 () Bool)

(assert start!16254)

(declare-fun b!162175 () Bool)

(declare-fun b_free!3715 () Bool)

(declare-fun b_next!3715 () Bool)

(assert (=> b!162175 (= b_free!3715 (not b_next!3715))))

(declare-fun tp!13715 () Bool)

(declare-fun b_and!10129 () Bool)

(assert (=> b!162175 (= tp!13715 b_and!10129)))

(declare-fun b!162173 () Bool)

(declare-fun e!106190 () Bool)

(assert (=> b!162173 (= e!106190 false)))

(declare-datatypes ((SeekEntryResult!374 0))(
  ( (MissingZero!374 (index!3664 (_ BitVec 32))) (Found!374 (index!3665 (_ BitVec 32))) (Intermediate!374 (undefined!1186 Bool) (index!3666 (_ BitVec 32)) (x!17926 (_ BitVec 32))) (Undefined!374) (MissingVacant!374 (index!3667 (_ BitVec 32))) )
))
(declare-fun lt!82393 () SeekEntryResult!374)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4337 0))(
  ( (V!4338 (val!1803 Int)) )
))
(declare-datatypes ((ValueCell!1415 0))(
  ( (ValueCellFull!1415 (v!3668 V!4337)) (EmptyCell!1415) )
))
(declare-datatypes ((array!6113 0))(
  ( (array!6114 (arr!2901 (Array (_ BitVec 32) (_ BitVec 64))) (size!3185 (_ BitVec 32))) )
))
(declare-datatypes ((array!6115 0))(
  ( (array!6116 (arr!2902 (Array (_ BitVec 32) ValueCell!1415)) (size!3186 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1738 0))(
  ( (LongMapFixedSize!1739 (defaultEntry!3311 Int) (mask!7925 (_ BitVec 32)) (extraKeys!3052 (_ BitVec 32)) (zeroValue!3154 V!4337) (minValue!3154 V!4337) (_size!918 (_ BitVec 32)) (_keys!5112 array!6113) (_values!3294 array!6115) (_vacant!918 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1738)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6113 (_ BitVec 32)) SeekEntryResult!374)

(assert (=> b!162173 (= lt!82393 (seekEntryOrOpen!0 key!828 (_keys!5112 thiss!1248) (mask!7925 thiss!1248)))))

(declare-fun b!162174 () Bool)

(declare-fun e!106189 () Bool)

(declare-fun e!106193 () Bool)

(declare-fun mapRes!5963 () Bool)

(assert (=> b!162174 (= e!106189 (and e!106193 mapRes!5963))))

(declare-fun condMapEmpty!5963 () Bool)

(declare-fun mapDefault!5963 () ValueCell!1415)

