; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38612 () Bool)

(assert start!38612)

(declare-fun b_free!9149 () Bool)

(declare-fun b_next!9149 () Bool)

(assert (=> start!38612 (= b_free!9149 (not b_next!9149))))

(declare-fun tp!32571 () Bool)

(declare-fun b_and!16535 () Bool)

(assert (=> start!38612 (= tp!32571 b_and!16535)))

(declare-fun mapNonEmpty!16668 () Bool)

(declare-fun mapRes!16668 () Bool)

(declare-fun tp!32570 () Bool)

(declare-fun e!241566 () Bool)

(assert (=> mapNonEmpty!16668 (= mapRes!16668 (and tp!32570 e!241566))))

(declare-datatypes ((V!14479 0))(
  ( (V!14480 (val!5060 Int)) )
))
(declare-datatypes ((ValueCell!4672 0))(
  ( (ValueCellFull!4672 (v!7307 V!14479)) (EmptyCell!4672) )
))
(declare-fun mapRest!16668 () (Array (_ BitVec 32) ValueCell!4672))

(declare-fun mapValue!16668 () ValueCell!4672)

(declare-fun mapKey!16668 () (_ BitVec 32))

(declare-datatypes ((array!23973 0))(
  ( (array!23974 (arr!11436 (Array (_ BitVec 32) ValueCell!4672)) (size!11788 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23973)

(assert (=> mapNonEmpty!16668 (= (arr!11436 _values!549) (store mapRest!16668 mapKey!16668 mapValue!16668))))

(declare-fun b!400258 () Bool)

(declare-fun e!241568 () Bool)

(declare-datatypes ((tuple2!6708 0))(
  ( (tuple2!6709 (_1!3365 (_ BitVec 64)) (_2!3365 V!14479)) )
))
(declare-datatypes ((List!6631 0))(
  ( (Nil!6628) (Cons!6627 (h!7483 tuple2!6708) (t!11805 List!6631)) )
))
(declare-datatypes ((ListLongMap!5621 0))(
  ( (ListLongMap!5622 (toList!2826 List!6631)) )
))
(declare-fun call!28112 () ListLongMap!5621)

(declare-fun call!28111 () ListLongMap!5621)

(assert (=> b!400258 (= e!241568 (= call!28112 call!28111))))

(declare-fun b!400259 () Bool)

(declare-fun e!241569 () Bool)

(declare-fun e!241572 () Bool)

(assert (=> b!400259 (= e!241569 (and e!241572 mapRes!16668))))

(declare-fun condMapEmpty!16668 () Bool)

(declare-fun mapDefault!16668 () ValueCell!4672)

