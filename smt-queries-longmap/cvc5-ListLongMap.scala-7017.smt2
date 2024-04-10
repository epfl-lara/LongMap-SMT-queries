; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89114 () Bool)

(assert start!89114)

(declare-fun b!1021639 () Bool)

(declare-fun b_free!20155 () Bool)

(declare-fun b_next!20155 () Bool)

(assert (=> b!1021639 (= b_free!20155 (not b_next!20155))))

(declare-fun tp!71500 () Bool)

(declare-fun b_and!32353 () Bool)

(assert (=> b!1021639 (= tp!71500 b_and!32353)))

(declare-fun b!1021631 () Bool)

(declare-fun e!575428 () Bool)

(declare-fun tp_is_empty!23875 () Bool)

(assert (=> b!1021631 (= e!575428 tp_is_empty!23875)))

(declare-fun b!1021632 () Bool)

(declare-fun res!684489 () Bool)

(declare-fun e!575433 () Bool)

(assert (=> b!1021632 (=> (not res!684489) (not e!575433))))

(declare-datatypes ((V!36707 0))(
  ( (V!36708 (val!11988 Int)) )
))
(declare-datatypes ((ValueCell!11234 0))(
  ( (ValueCellFull!11234 (v!14557 V!36707)) (EmptyCell!11234) )
))
(declare-datatypes ((array!63794 0))(
  ( (array!63795 (arr!30709 (Array (_ BitVec 32) (_ BitVec 64))) (size!31220 (_ BitVec 32))) )
))
(declare-datatypes ((array!63796 0))(
  ( (array!63797 (arr!30710 (Array (_ BitVec 32) ValueCell!11234)) (size!31221 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5062 0))(
  ( (LongMapFixedSize!5063 (defaultEntry!5883 Int) (mask!29458 (_ BitVec 32)) (extraKeys!5615 (_ BitVec 32)) (zeroValue!5719 V!36707) (minValue!5719 V!36707) (_size!2586 (_ BitVec 32)) (_keys!11028 array!63794) (_values!5906 array!63796) (_vacant!2586 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5062)

(assert (=> b!1021632 (= res!684489 (and (= (size!31221 (_values!5906 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29458 thiss!1427))) (= (size!31220 (_keys!11028 thiss!1427)) (size!31221 (_values!5906 thiss!1427))) (bvsge (mask!29458 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5615 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5615 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021633 () Bool)

(declare-fun res!684487 () Bool)

(assert (=> b!1021633 (=> (not res!684487) (not e!575433))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021633 (= res!684487 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021634 () Bool)

(declare-fun res!684491 () Bool)

(assert (=> b!1021634 (=> (not res!684491) (not e!575433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021634 (= res!684491 (validMask!0 (mask!29458 thiss!1427)))))

(declare-fun b!1021635 () Bool)

(declare-fun res!684490 () Bool)

(assert (=> b!1021635 (=> (not res!684490) (not e!575433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63794 (_ BitVec 32)) Bool)

(assert (=> b!1021635 (= res!684490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11028 thiss!1427) (mask!29458 thiss!1427)))))

(declare-fun res!684488 () Bool)

(assert (=> start!89114 (=> (not res!684488) (not e!575433))))

(declare-fun valid!1931 (LongMapFixedSize!5062) Bool)

(assert (=> start!89114 (= res!684488 (valid!1931 thiss!1427))))

(assert (=> start!89114 e!575433))

(declare-fun e!575432 () Bool)

(assert (=> start!89114 e!575432))

(assert (=> start!89114 true))

(declare-fun b!1021636 () Bool)

(declare-fun e!575430 () Bool)

(declare-fun mapRes!37230 () Bool)

(assert (=> b!1021636 (= e!575430 (and e!575428 mapRes!37230))))

(declare-fun condMapEmpty!37230 () Bool)

(declare-fun mapDefault!37230 () ValueCell!11234)

