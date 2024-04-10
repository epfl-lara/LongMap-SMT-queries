; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18670 () Bool)

(assert start!18670)

(declare-fun b!184664 () Bool)

(declare-fun b_free!4549 () Bool)

(declare-fun b_next!4549 () Bool)

(assert (=> b!184664 (= b_free!4549 (not b_next!4549))))

(declare-fun tp!16433 () Bool)

(declare-fun b_and!11139 () Bool)

(assert (=> b!184664 (= tp!16433 b_and!11139)))

(declare-fun b!184659 () Bool)

(declare-fun res!87357 () Bool)

(declare-fun e!121544 () Bool)

(assert (=> b!184659 (=> (not res!87357) (not e!121544))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!184659 (= res!87357 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184660 () Bool)

(declare-fun e!121539 () Bool)

(declare-fun tp_is_empty!4321 () Bool)

(assert (=> b!184660 (= e!121539 tp_is_empty!4321)))

(declare-fun mapIsEmpty!7430 () Bool)

(declare-fun mapRes!7430 () Bool)

(assert (=> mapIsEmpty!7430 mapRes!7430))

(declare-fun b!184661 () Bool)

(declare-fun e!121540 () Bool)

(assert (=> b!184661 (= e!121540 (and e!121539 mapRes!7430))))

(declare-fun condMapEmpty!7430 () Bool)

(declare-datatypes ((V!5409 0))(
  ( (V!5410 (val!2205 Int)) )
))
(declare-datatypes ((ValueCell!1817 0))(
  ( (ValueCellFull!1817 (v!4112 V!5409)) (EmptyCell!1817) )
))
(declare-datatypes ((array!7843 0))(
  ( (array!7844 (arr!3705 (Array (_ BitVec 32) (_ BitVec 64))) (size!4020 (_ BitVec 32))) )
))
(declare-datatypes ((array!7845 0))(
  ( (array!7846 (arr!3706 (Array (_ BitVec 32) ValueCell!1817)) (size!4021 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2542 0))(
  ( (LongMapFixedSize!2543 (defaultEntry!3768 Int) (mask!8858 (_ BitVec 32)) (extraKeys!3505 (_ BitVec 32)) (zeroValue!3609 V!5409) (minValue!3609 V!5409) (_size!1320 (_ BitVec 32)) (_keys!5699 array!7843) (_values!3751 array!7845) (_vacant!1320 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2542)

(declare-fun mapDefault!7430 () ValueCell!1817)

