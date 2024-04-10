; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75408 () Bool)

(assert start!75408)

(declare-fun b!887838 () Bool)

(declare-fun b_free!15535 () Bool)

(declare-fun b_next!15535 () Bool)

(assert (=> b!887838 (= b_free!15535 (not b_next!15535))))

(declare-fun tp!54548 () Bool)

(declare-fun b_and!25771 () Bool)

(assert (=> b!887838 (= tp!54548 b_and!25771)))

(declare-fun mapIsEmpty!28324 () Bool)

(declare-fun mapRes!28324 () Bool)

(assert (=> mapIsEmpty!28324 mapRes!28324))

(declare-fun b!887833 () Bool)

(declare-fun e!494549 () Bool)

(declare-fun tp_is_empty!17863 () Bool)

(assert (=> b!887833 (= e!494549 tp_is_empty!17863)))

(declare-fun b!887834 () Bool)

(declare-fun e!494548 () Bool)

(declare-fun e!494553 () Bool)

(assert (=> b!887834 (= e!494548 e!494553)))

(declare-fun b!887835 () Bool)

(declare-fun e!494555 () Bool)

(assert (=> b!887835 (= e!494555 tp_is_empty!17863)))

(declare-fun b!887836 () Bool)

(declare-fun e!494551 () Bool)

(assert (=> b!887836 (= e!494551 (and e!494549 mapRes!28324))))

(declare-fun condMapEmpty!28324 () Bool)

(declare-datatypes ((V!28783 0))(
  ( (V!28784 (val!8982 Int)) )
))
(declare-datatypes ((array!51692 0))(
  ( (array!51693 (arr!24859 (Array (_ BitVec 32) (_ BitVec 64))) (size!25299 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8450 0))(
  ( (ValueCellFull!8450 (v!11450 V!28783)) (EmptyCell!8450) )
))
(declare-datatypes ((array!51694 0))(
  ( (array!51695 (arr!24860 (Array (_ BitVec 32) ValueCell!8450)) (size!25300 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3916 0))(
  ( (LongMapFixedSize!3917 (defaultEntry!5149 Int) (mask!25555 (_ BitVec 32)) (extraKeys!4843 (_ BitVec 32)) (zeroValue!4947 V!28783) (minValue!4947 V!28783) (_size!2013 (_ BitVec 32)) (_keys!9826 array!51692) (_values!5134 array!51694) (_vacant!2013 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1076 0))(
  ( (Cell!1077 (v!11451 LongMapFixedSize!3916)) )
))
(declare-datatypes ((LongMap!1076 0))(
  ( (LongMap!1077 (underlying!549 Cell!1076)) )
))
(declare-fun thiss!821 () LongMap!1076)

(declare-fun mapDefault!28324 () ValueCell!8450)

