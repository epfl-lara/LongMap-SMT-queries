; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16296 () Bool)

(assert start!16296)

(declare-fun b!162620 () Bool)

(declare-fun b_free!3757 () Bool)

(declare-fun b_next!3757 () Bool)

(assert (=> b!162620 (= b_free!3757 (not b_next!3757))))

(declare-fun tp!13840 () Bool)

(declare-fun b_and!10171 () Bool)

(assert (=> b!162620 (= tp!13840 b_and!10171)))

(declare-fun b!162616 () Bool)

(declare-fun e!106618 () Bool)

(declare-fun e!106619 () Bool)

(assert (=> b!162616 (= e!106618 e!106619)))

(declare-fun res!77016 () Bool)

(assert (=> b!162616 (=> (not res!77016) (not e!106619))))

(declare-datatypes ((SeekEntryResult!386 0))(
  ( (MissingZero!386 (index!3712 (_ BitVec 32))) (Found!386 (index!3713 (_ BitVec 32))) (Intermediate!386 (undefined!1198 Bool) (index!3714 (_ BitVec 32)) (x!17994 (_ BitVec 32))) (Undefined!386) (MissingVacant!386 (index!3715 (_ BitVec 32))) )
))
(declare-fun lt!82503 () SeekEntryResult!386)

(assert (=> b!162616 (= res!77016 (and (not (is-Undefined!386 lt!82503)) (not (is-MissingVacant!386 lt!82503)) (is-MissingZero!386 lt!82503)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4393 0))(
  ( (V!4394 (val!1824 Int)) )
))
(declare-datatypes ((ValueCell!1436 0))(
  ( (ValueCellFull!1436 (v!3689 V!4393)) (EmptyCell!1436) )
))
(declare-datatypes ((array!6197 0))(
  ( (array!6198 (arr!2943 (Array (_ BitVec 32) (_ BitVec 64))) (size!3227 (_ BitVec 32))) )
))
(declare-datatypes ((array!6199 0))(
  ( (array!6200 (arr!2944 (Array (_ BitVec 32) ValueCell!1436)) (size!3228 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1780 0))(
  ( (LongMapFixedSize!1781 (defaultEntry!3332 Int) (mask!7960 (_ BitVec 32)) (extraKeys!3073 (_ BitVec 32)) (zeroValue!3175 V!4393) (minValue!3175 V!4393) (_size!939 (_ BitVec 32)) (_keys!5133 array!6197) (_values!3315 array!6199) (_vacant!939 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1780)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6197 (_ BitVec 32)) SeekEntryResult!386)

(assert (=> b!162616 (= lt!82503 (seekEntryOrOpen!0 key!828 (_keys!5133 thiss!1248) (mask!7960 thiss!1248)))))

(declare-fun mapIsEmpty!6026 () Bool)

(declare-fun mapRes!6026 () Bool)

(assert (=> mapIsEmpty!6026 mapRes!6026))

(declare-fun b!162617 () Bool)

(declare-fun e!106616 () Bool)

(declare-fun e!106617 () Bool)

(assert (=> b!162617 (= e!106616 (and e!106617 mapRes!6026))))

(declare-fun condMapEmpty!6026 () Bool)

(declare-fun mapDefault!6026 () ValueCell!1436)

