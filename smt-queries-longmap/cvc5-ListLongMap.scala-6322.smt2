; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81296 () Bool)

(assert start!81296)

(declare-fun b!950904 () Bool)

(declare-fun b_free!18253 () Bool)

(declare-fun b_next!18253 () Bool)

(assert (=> b!950904 (= b_free!18253 (not b_next!18253))))

(declare-fun tp!63361 () Bool)

(declare-fun b_and!29717 () Bool)

(assert (=> b!950904 (= tp!63361 b_and!29717)))

(declare-fun b!950902 () Bool)

(declare-fun res!637402 () Bool)

(declare-fun e!535404 () Bool)

(assert (=> b!950902 (=> (not res!637402) (not e!535404))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32647 0))(
  ( (V!32648 (val!10431 Int)) )
))
(declare-datatypes ((ValueCell!9899 0))(
  ( (ValueCellFull!9899 (v!12976 V!32647)) (EmptyCell!9899) )
))
(declare-datatypes ((array!57544 0))(
  ( (array!57545 (arr!27670 (Array (_ BitVec 32) ValueCell!9899)) (size!28148 (_ BitVec 32))) )
))
(declare-datatypes ((array!57546 0))(
  ( (array!57547 (arr!27671 (Array (_ BitVec 32) (_ BitVec 64))) (size!28149 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4948 0))(
  ( (LongMapFixedSize!4949 (defaultEntry!5791 Int) (mask!27603 (_ BitVec 32)) (extraKeys!5523 (_ BitVec 32)) (zeroValue!5627 V!32647) (minValue!5627 V!32647) (_size!2529 (_ BitVec 32)) (_keys!10732 array!57546) (_values!5814 array!57544) (_vacant!2529 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4948)

(declare-datatypes ((SeekEntryResult!9146 0))(
  ( (MissingZero!9146 (index!38955 (_ BitVec 32))) (Found!9146 (index!38956 (_ BitVec 32))) (Intermediate!9146 (undefined!9958 Bool) (index!38957 (_ BitVec 32)) (x!81808 (_ BitVec 32))) (Undefined!9146) (MissingVacant!9146 (index!38958 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57546 (_ BitVec 32)) SeekEntryResult!9146)

(assert (=> b!950902 (= res!637402 (not (is-Found!9146 (seekEntry!0 key!756 (_keys!10732 thiss!1141) (mask!27603 thiss!1141)))))))

(declare-fun b!950903 () Bool)

(declare-fun res!637403 () Bool)

(assert (=> b!950903 (=> (not res!637403) (not e!535404))))

(declare-datatypes ((tuple2!13556 0))(
  ( (tuple2!13557 (_1!6789 (_ BitVec 64)) (_2!6789 V!32647)) )
))
(declare-datatypes ((List!19345 0))(
  ( (Nil!19342) (Cons!19341 (h!20502 tuple2!13556) (t!27688 List!19345)) )
))
(declare-datatypes ((ListLongMap!12253 0))(
  ( (ListLongMap!12254 (toList!6142 List!19345)) )
))
(declare-fun contains!5235 (ListLongMap!12253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3375 (array!57546 array!57544 (_ BitVec 32) (_ BitVec 32) V!32647 V!32647 (_ BitVec 32) Int) ListLongMap!12253)

(assert (=> b!950903 (= res!637403 (contains!5235 (getCurrentListMap!3375 (_keys!10732 thiss!1141) (_values!5814 thiss!1141) (mask!27603 thiss!1141) (extraKeys!5523 thiss!1141) (zeroValue!5627 thiss!1141) (minValue!5627 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5791 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!33060 () Bool)

(declare-fun mapRes!33060 () Bool)

(assert (=> mapIsEmpty!33060 mapRes!33060))

(declare-fun e!535408 () Bool)

(declare-fun tp_is_empty!20761 () Bool)

(declare-fun e!535407 () Bool)

(declare-fun array_inv!21478 (array!57546) Bool)

(declare-fun array_inv!21479 (array!57544) Bool)

(assert (=> b!950904 (= e!535407 (and tp!63361 tp_is_empty!20761 (array_inv!21478 (_keys!10732 thiss!1141)) (array_inv!21479 (_values!5814 thiss!1141)) e!535408))))

(declare-fun b!950905 () Bool)

(declare-fun e!535409 () Bool)

(assert (=> b!950905 (= e!535409 tp_is_empty!20761)))

(declare-fun res!637401 () Bool)

(assert (=> start!81296 (=> (not res!637401) (not e!535404))))

(declare-fun valid!1881 (LongMapFixedSize!4948) Bool)

(assert (=> start!81296 (= res!637401 (valid!1881 thiss!1141))))

(assert (=> start!81296 e!535404))

(assert (=> start!81296 e!535407))

(assert (=> start!81296 true))

(declare-fun b!950906 () Bool)

(declare-fun e!535406 () Bool)

(assert (=> b!950906 (= e!535406 tp_is_empty!20761)))

(declare-fun b!950907 () Bool)

(declare-fun e!535403 () Bool)

(assert (=> b!950907 (= e!535403 (or (not (= (size!28149 (_keys!10732 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27603 thiss!1141)))) (bvsle #b00000000000000000000000000000000 (size!28149 (_keys!10732 thiss!1141)))))))

(declare-fun b!950908 () Bool)

(declare-fun res!637400 () Bool)

(assert (=> b!950908 (=> (not res!637400) (not e!535404))))

(assert (=> b!950908 (= res!637400 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!33060 () Bool)

(declare-fun tp!63362 () Bool)

(assert (=> mapNonEmpty!33060 (= mapRes!33060 (and tp!63362 e!535409))))

(declare-fun mapValue!33060 () ValueCell!9899)

(declare-fun mapKey!33060 () (_ BitVec 32))

(declare-fun mapRest!33060 () (Array (_ BitVec 32) ValueCell!9899))

(assert (=> mapNonEmpty!33060 (= (arr!27670 (_values!5814 thiss!1141)) (store mapRest!33060 mapKey!33060 mapValue!33060))))

(declare-fun b!950909 () Bool)

(assert (=> b!950909 (= e!535408 (and e!535406 mapRes!33060))))

(declare-fun condMapEmpty!33060 () Bool)

(declare-fun mapDefault!33060 () ValueCell!9899)

