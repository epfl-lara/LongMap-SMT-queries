; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14096 () Bool)

(assert start!14096)

(declare-fun b!130721 () Bool)

(declare-fun b_free!2893 () Bool)

(declare-fun b_next!2893 () Bool)

(assert (=> b!130721 (= b_free!2893 (not b_next!2893))))

(declare-fun tp!11112 () Bool)

(declare-fun b_and!8091 () Bool)

(assert (=> b!130721 (= tp!11112 b_and!8091)))

(declare-fun b!130724 () Bool)

(declare-fun b_free!2895 () Bool)

(declare-fun b_next!2895 () Bool)

(assert (=> b!130724 (= b_free!2895 (not b_next!2895))))

(declare-fun tp!11110 () Bool)

(declare-fun b_and!8093 () Bool)

(assert (=> b!130724 (= tp!11110 b_and!8093)))

(declare-fun b!130717 () Bool)

(declare-fun res!63027 () Bool)

(declare-fun e!85271 () Bool)

(assert (=> b!130717 (=> (not res!63027) (not e!85271))))

(declare-datatypes ((V!3465 0))(
  ( (V!3466 (val!1476 Int)) )
))
(declare-datatypes ((array!4749 0))(
  ( (array!4750 (arr!2247 (Array (_ BitVec 32) (_ BitVec 64))) (size!2514 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1088 0))(
  ( (ValueCellFull!1088 (v!3174 V!3465)) (EmptyCell!1088) )
))
(declare-datatypes ((array!4751 0))(
  ( (array!4752 (arr!2248 (Array (_ BitVec 32) ValueCell!1088)) (size!2515 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1084 0))(
  ( (LongMapFixedSize!1085 (defaultEntry!2842 Int) (mask!7130 (_ BitVec 32)) (extraKeys!2611 (_ BitVec 32)) (zeroValue!2699 V!3465) (minValue!2699 V!3465) (_size!591 (_ BitVec 32)) (_keys!4587 array!4749) (_values!2825 array!4751) (_vacant!591 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!876 0))(
  ( (Cell!877 (v!3175 LongMapFixedSize!1084)) )
))
(declare-datatypes ((LongMap!876 0))(
  ( (LongMap!877 (underlying!449 Cell!876)) )
))
(declare-fun thiss!992 () LongMap!876)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!130717 (= res!63027 (validMask!0 (mask!7130 (v!3175 (underlying!449 thiss!992)))))))

(declare-fun b!130718 () Bool)

(declare-fun res!63024 () Bool)

(assert (=> b!130718 (=> (not res!63024) (not e!85271))))

(assert (=> b!130718 (= res!63024 (and (= (size!2515 (_values!2825 (v!3175 (underlying!449 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7130 (v!3175 (underlying!449 thiss!992))))) (= (size!2514 (_keys!4587 (v!3175 (underlying!449 thiss!992)))) (size!2515 (_values!2825 (v!3175 (underlying!449 thiss!992))))) (bvsge (mask!7130 (v!3175 (underlying!449 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2611 (v!3175 (underlying!449 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2611 (v!3175 (underlying!449 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!4589 () Bool)

(declare-fun mapRes!4590 () Bool)

(declare-fun tp!11111 () Bool)

(declare-fun e!85278 () Bool)

(assert (=> mapNonEmpty!4589 (= mapRes!4590 (and tp!11111 e!85278))))

(declare-fun mapValue!4589 () ValueCell!1088)

(declare-fun mapKey!4589 () (_ BitVec 32))

(declare-fun mapRest!4590 () (Array (_ BitVec 32) ValueCell!1088))

(assert (=> mapNonEmpty!4589 (= (arr!2248 (_values!2825 (v!3175 (underlying!449 thiss!992)))) (store mapRest!4590 mapKey!4589 mapValue!4589))))

(declare-fun b!130719 () Bool)

(declare-fun tp_is_empty!2863 () Bool)

(assert (=> b!130719 (= e!85278 tp_is_empty!2863)))

(declare-fun mapIsEmpty!4589 () Bool)

(declare-fun mapRes!4589 () Bool)

(assert (=> mapIsEmpty!4589 mapRes!4589))

(declare-fun e!85267 () Bool)

(declare-fun e!85279 () Bool)

(declare-fun array_inv!1413 (array!4749) Bool)

(declare-fun array_inv!1414 (array!4751) Bool)

(assert (=> b!130721 (= e!85279 (and tp!11112 tp_is_empty!2863 (array_inv!1413 (_keys!4587 (v!3175 (underlying!449 thiss!992)))) (array_inv!1414 (_values!2825 (v!3175 (underlying!449 thiss!992)))) e!85267))))

(declare-fun mapIsEmpty!4590 () Bool)

(assert (=> mapIsEmpty!4590 mapRes!4590))

(declare-fun b!130722 () Bool)

(declare-fun e!85272 () Bool)

(assert (=> b!130722 (= e!85267 (and e!85272 mapRes!4590))))

(declare-fun condMapEmpty!4590 () Bool)

(declare-fun mapDefault!4589 () ValueCell!1088)

