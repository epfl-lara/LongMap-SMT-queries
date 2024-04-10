; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75310 () Bool)

(assert start!75310)

(declare-fun b!887181 () Bool)

(declare-fun b_free!15509 () Bool)

(declare-fun b_next!15509 () Bool)

(assert (=> b!887181 (= b_free!15509 (not b_next!15509))))

(declare-fun tp!54461 () Bool)

(declare-fun b_and!25715 () Bool)

(assert (=> b!887181 (= tp!54461 b_and!25715)))

(declare-fun b!887178 () Bool)

(declare-fun e!494016 () Bool)

(declare-fun e!494010 () Bool)

(assert (=> b!887178 (= e!494016 e!494010)))

(declare-fun b!887179 () Bool)

(declare-fun e!494012 () Bool)

(declare-fun e!494011 () Bool)

(declare-fun mapRes!28275 () Bool)

(assert (=> b!887179 (= e!494012 (and e!494011 mapRes!28275))))

(declare-fun condMapEmpty!28275 () Bool)

(declare-datatypes ((V!28747 0))(
  ( (V!28748 (val!8969 Int)) )
))
(declare-datatypes ((ValueCell!8437 0))(
  ( (ValueCellFull!8437 (v!11418 V!28747)) (EmptyCell!8437) )
))
(declare-datatypes ((array!51634 0))(
  ( (array!51635 (arr!24833 (Array (_ BitVec 32) ValueCell!8437)) (size!25273 (_ BitVec 32))) )
))
(declare-datatypes ((array!51636 0))(
  ( (array!51637 (arr!24834 (Array (_ BitVec 32) (_ BitVec 64))) (size!25274 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3890 0))(
  ( (LongMapFixedSize!3891 (defaultEntry!5133 Int) (mask!25526 (_ BitVec 32)) (extraKeys!4826 (_ BitVec 32)) (zeroValue!4930 V!28747) (minValue!4930 V!28747) (_size!2000 (_ BitVec 32)) (_keys!9808 array!51636) (_values!5117 array!51634) (_vacant!2000 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1050 0))(
  ( (Cell!1051 (v!11419 LongMapFixedSize!3890)) )
))
(declare-datatypes ((LongMap!1050 0))(
  ( (LongMap!1051 (underlying!536 Cell!1050)) )
))
(declare-fun thiss!833 () LongMap!1050)

(declare-fun mapDefault!28275 () ValueCell!8437)

