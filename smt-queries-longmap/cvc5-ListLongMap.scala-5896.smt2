; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76158 () Bool)

(assert start!76158)

(declare-fun b!894586 () Bool)

(declare-fun b_free!15877 () Bool)

(declare-fun b_next!15877 () Bool)

(assert (=> b!894586 (= b_free!15877 (not b_next!15877))))

(declare-fun tp!55621 () Bool)

(declare-fun b_and!26169 () Bool)

(assert (=> b!894586 (= tp!55621 b_and!26169)))

(declare-fun mapNonEmpty!28884 () Bool)

(declare-fun mapRes!28884 () Bool)

(declare-fun tp!55622 () Bool)

(declare-fun e!499695 () Bool)

(assert (=> mapNonEmpty!28884 (= mapRes!28884 (and tp!55622 e!499695))))

(declare-datatypes ((V!29239 0))(
  ( (V!29240 (val!9153 Int)) )
))
(declare-datatypes ((ValueCell!8621 0))(
  ( (ValueCellFull!8621 (v!11643 V!29239)) (EmptyCell!8621) )
))
(declare-fun mapRest!28884 () (Array (_ BitVec 32) ValueCell!8621))

(declare-fun mapValue!28884 () ValueCell!8621)

(declare-fun mapKey!28884 () (_ BitVec 32))

(declare-datatypes ((array!52402 0))(
  ( (array!52403 (arr!25201 (Array (_ BitVec 32) (_ BitVec 64))) (size!25647 (_ BitVec 32))) )
))
(declare-datatypes ((array!52404 0))(
  ( (array!52405 (arr!25202 (Array (_ BitVec 32) ValueCell!8621)) (size!25648 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4258 0))(
  ( (LongMapFixedSize!4259 (defaultEntry!5341 Int) (mask!25904 (_ BitVec 32)) (extraKeys!5037 (_ BitVec 32)) (zeroValue!5141 V!29239) (minValue!5141 V!29239) (_size!2184 (_ BitVec 32)) (_keys!10039 array!52402) (_values!5328 array!52404) (_vacant!2184 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4258)

(assert (=> mapNonEmpty!28884 (= (arr!25202 (_values!5328 thiss!1181)) (store mapRest!28884 mapKey!28884 mapValue!28884))))

(declare-fun mapIsEmpty!28884 () Bool)

(assert (=> mapIsEmpty!28884 mapRes!28884))

(declare-fun b!894583 () Bool)

(declare-fun tp_is_empty!18205 () Bool)

(assert (=> b!894583 (= e!499695 tp_is_empty!18205)))

(declare-fun res!605391 () Bool)

(declare-fun e!499701 () Bool)

(assert (=> start!76158 (=> (not res!605391) (not e!499701))))

(declare-fun valid!1643 (LongMapFixedSize!4258) Bool)

(assert (=> start!76158 (= res!605391 (valid!1643 thiss!1181))))

(assert (=> start!76158 e!499701))

(declare-fun e!499697 () Bool)

(assert (=> start!76158 e!499697))

(assert (=> start!76158 true))

(declare-fun b!894584 () Bool)

(declare-fun e!499700 () Bool)

(assert (=> b!894584 (= e!499701 e!499700)))

(declare-fun res!605392 () Bool)

(assert (=> b!894584 (=> (not res!605392) (not e!499700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894584 (= res!605392 (validMask!0 (mask!25904 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8868 0))(
  ( (MissingZero!8868 (index!37843 (_ BitVec 32))) (Found!8868 (index!37844 (_ BitVec 32))) (Intermediate!8868 (undefined!9680 Bool) (index!37845 (_ BitVec 32)) (x!76064 (_ BitVec 32))) (Undefined!8868) (MissingVacant!8868 (index!37846 (_ BitVec 32))) )
))
(declare-fun lt!404308 () SeekEntryResult!8868)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52402 (_ BitVec 32)) SeekEntryResult!8868)

(assert (=> b!894584 (= lt!404308 (seekEntry!0 key!785 (_keys!10039 thiss!1181) (mask!25904 thiss!1181)))))

(declare-fun b!894585 () Bool)

(assert (=> b!894585 (= e!499700 (not (= (size!25648 (_values!5328 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25904 thiss!1181)))))))

(declare-fun e!499698 () Bool)

(declare-fun array_inv!19786 (array!52402) Bool)

(declare-fun array_inv!19787 (array!52404) Bool)

(assert (=> b!894586 (= e!499697 (and tp!55621 tp_is_empty!18205 (array_inv!19786 (_keys!10039 thiss!1181)) (array_inv!19787 (_values!5328 thiss!1181)) e!499698))))

(declare-fun b!894587 () Bool)

(declare-fun e!499699 () Bool)

(assert (=> b!894587 (= e!499698 (and e!499699 mapRes!28884))))

(declare-fun condMapEmpty!28884 () Bool)

(declare-fun mapDefault!28884 () ValueCell!8621)

