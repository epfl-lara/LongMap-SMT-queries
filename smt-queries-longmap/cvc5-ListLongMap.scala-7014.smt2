; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89088 () Bool)

(assert start!89088)

(declare-fun b!1021385 () Bool)

(declare-fun b_free!20137 () Bool)

(declare-fun b_next!20137 () Bool)

(assert (=> b!1021385 (= b_free!20137 (not b_next!20137))))

(declare-fun tp!71443 () Bool)

(declare-fun b_and!32335 () Bool)

(assert (=> b!1021385 (= tp!71443 b_and!32335)))

(declare-datatypes ((array!63756 0))(
  ( (array!63757 (arr!30691 (Array (_ BitVec 32) (_ BitVec 64))) (size!31202 (_ BitVec 32))) )
))
(declare-datatypes ((V!36683 0))(
  ( (V!36684 (val!11979 Int)) )
))
(declare-datatypes ((ValueCell!11225 0))(
  ( (ValueCellFull!11225 (v!14545 V!36683)) (EmptyCell!11225) )
))
(declare-datatypes ((array!63758 0))(
  ( (array!63759 (arr!30692 (Array (_ BitVec 32) ValueCell!11225)) (size!31203 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5044 0))(
  ( (LongMapFixedSize!5045 (defaultEntry!5874 Int) (mask!29443 (_ BitVec 32)) (extraKeys!5606 (_ BitVec 32)) (zeroValue!5710 V!36683) (minValue!5710 V!36683) (_size!2577 (_ BitVec 32)) (_keys!11019 array!63756) (_values!5897 array!63758) (_vacant!2577 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1118 0))(
  ( (Cell!1119 (v!14546 LongMapFixedSize!5044)) )
))
(declare-datatypes ((LongMap!1118 0))(
  ( (LongMap!1119 (underlying!570 Cell!1118)) )
))
(declare-fun thiss!1120 () LongMap!1118)

(declare-fun e!575248 () Bool)

(declare-fun tp_is_empty!23857 () Bool)

(declare-fun e!575245 () Bool)

(declare-fun array_inv!23803 (array!63756) Bool)

(declare-fun array_inv!23804 (array!63758) Bool)

(assert (=> b!1021385 (= e!575248 (and tp!71443 tp_is_empty!23857 (array_inv!23803 (_keys!11019 (v!14546 (underlying!570 thiss!1120)))) (array_inv!23804 (_values!5897 (v!14546 (underlying!570 thiss!1120)))) e!575245))))

(declare-fun b!1021386 () Bool)

(declare-fun e!575244 () Bool)

(assert (=> b!1021386 (= e!575244 tp_is_empty!23857)))

(declare-fun b!1021387 () Bool)

(declare-fun e!575246 () Bool)

(assert (=> b!1021387 (= e!575246 e!575248)))

(declare-fun mapNonEmpty!37200 () Bool)

(declare-fun mapRes!37200 () Bool)

(declare-fun tp!71442 () Bool)

(assert (=> mapNonEmpty!37200 (= mapRes!37200 (and tp!71442 e!575244))))

(declare-fun mapRest!37200 () (Array (_ BitVec 32) ValueCell!11225))

(declare-fun mapKey!37200 () (_ BitVec 32))

(declare-fun mapValue!37200 () ValueCell!11225)

(assert (=> mapNonEmpty!37200 (= (arr!30692 (_values!5897 (v!14546 (underlying!570 thiss!1120)))) (store mapRest!37200 mapKey!37200 mapValue!37200))))

(declare-fun b!1021389 () Bool)

(declare-fun e!575250 () Bool)

(declare-fun valid!1922 (LongMapFixedSize!5044) Bool)

(assert (=> b!1021389 (= e!575250 (not (valid!1922 (v!14546 (underlying!570 thiss!1120)))))))

(declare-fun mapIsEmpty!37200 () Bool)

(assert (=> mapIsEmpty!37200 mapRes!37200))

(declare-fun b!1021390 () Bool)

(declare-fun e!575243 () Bool)

(assert (=> b!1021390 (= e!575245 (and e!575243 mapRes!37200))))

(declare-fun condMapEmpty!37200 () Bool)

(declare-fun mapDefault!37200 () ValueCell!11225)

