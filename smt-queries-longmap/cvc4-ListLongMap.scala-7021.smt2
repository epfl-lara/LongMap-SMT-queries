; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89142 () Bool)

(assert start!89142)

(declare-fun b!1022014 () Bool)

(declare-fun b_free!20183 () Bool)

(declare-fun b_next!20183 () Bool)

(assert (=> b!1022014 (= b_free!20183 (not b_next!20183))))

(declare-fun tp!71584 () Bool)

(declare-fun b_and!32381 () Bool)

(assert (=> b!1022014 (= tp!71584 b_and!32381)))

(declare-fun b!1022009 () Bool)

(declare-fun e!575680 () Bool)

(declare-fun tp_is_empty!23903 () Bool)

(assert (=> b!1022009 (= e!575680 tp_is_empty!23903)))

(declare-fun b!1022010 () Bool)

(declare-fun res!684699 () Bool)

(declare-fun e!575685 () Bool)

(assert (=> b!1022010 (=> (not res!684699) (not e!575685))))

(declare-datatypes ((V!36743 0))(
  ( (V!36744 (val!12002 Int)) )
))
(declare-datatypes ((ValueCell!11248 0))(
  ( (ValueCellFull!11248 (v!14571 V!36743)) (EmptyCell!11248) )
))
(declare-datatypes ((array!63850 0))(
  ( (array!63851 (arr!30737 (Array (_ BitVec 32) (_ BitVec 64))) (size!31248 (_ BitVec 32))) )
))
(declare-datatypes ((array!63852 0))(
  ( (array!63853 (arr!30738 (Array (_ BitVec 32) ValueCell!11248)) (size!31249 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5090 0))(
  ( (LongMapFixedSize!5091 (defaultEntry!5897 Int) (mask!29480 (_ BitVec 32)) (extraKeys!5629 (_ BitVec 32)) (zeroValue!5733 V!36743) (minValue!5733 V!36743) (_size!2600 (_ BitVec 32)) (_keys!11042 array!63850) (_values!5920 array!63852) (_vacant!2600 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5090)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63850 (_ BitVec 32)) Bool)

(assert (=> b!1022010 (= res!684699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11042 thiss!1427) (mask!29480 thiss!1427)))))

(declare-fun b!1022011 () Bool)

(declare-fun res!684698 () Bool)

(assert (=> b!1022011 (=> (not res!684698) (not e!575685))))

(assert (=> b!1022011 (= res!684698 (and (= (size!31249 (_values!5920 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29480 thiss!1427))) (= (size!31248 (_keys!11042 thiss!1427)) (size!31249 (_values!5920 thiss!1427))) (bvsge (mask!29480 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5629 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5629 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5629 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5629 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5629 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5629 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5629 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022012 () Bool)

(declare-fun res!684701 () Bool)

(assert (=> b!1022012 (=> (not res!684701) (not e!575685))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022012 (= res!684701 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022013 () Bool)

(declare-fun e!575683 () Bool)

(assert (=> b!1022013 (= e!575683 tp_is_empty!23903)))

(declare-fun e!575681 () Bool)

(declare-fun e!575684 () Bool)

(declare-fun array_inv!23831 (array!63850) Bool)

(declare-fun array_inv!23832 (array!63852) Bool)

(assert (=> b!1022014 (= e!575681 (and tp!71584 tp_is_empty!23903 (array_inv!23831 (_keys!11042 thiss!1427)) (array_inv!23832 (_values!5920 thiss!1427)) e!575684))))

(declare-fun b!1022015 () Bool)

(declare-fun res!684700 () Bool)

(assert (=> b!1022015 (=> (not res!684700) (not e!575685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022015 (= res!684700 (validMask!0 (mask!29480 thiss!1427)))))

(declare-fun res!684697 () Bool)

(assert (=> start!89142 (=> (not res!684697) (not e!575685))))

(declare-fun valid!1941 (LongMapFixedSize!5090) Bool)

(assert (=> start!89142 (= res!684697 (valid!1941 thiss!1427))))

(assert (=> start!89142 e!575685))

(assert (=> start!89142 e!575681))

(assert (=> start!89142 true))

(declare-fun mapNonEmpty!37272 () Bool)

(declare-fun mapRes!37272 () Bool)

(declare-fun tp!71583 () Bool)

(assert (=> mapNonEmpty!37272 (= mapRes!37272 (and tp!71583 e!575683))))

(declare-fun mapRest!37272 () (Array (_ BitVec 32) ValueCell!11248))

(declare-fun mapKey!37272 () (_ BitVec 32))

(declare-fun mapValue!37272 () ValueCell!11248)

(assert (=> mapNonEmpty!37272 (= (arr!30738 (_values!5920 thiss!1427)) (store mapRest!37272 mapKey!37272 mapValue!37272))))

(declare-fun b!1022016 () Bool)

(assert (=> b!1022016 (= e!575685 false)))

(declare-fun lt!450168 () Bool)

(declare-datatypes ((List!21670 0))(
  ( (Nil!21667) (Cons!21666 (h!22864 (_ BitVec 64)) (t!30684 List!21670)) )
))
(declare-fun arrayNoDuplicates!0 (array!63850 (_ BitVec 32) List!21670) Bool)

(assert (=> b!1022016 (= lt!450168 (arrayNoDuplicates!0 (_keys!11042 thiss!1427) #b00000000000000000000000000000000 Nil!21667))))

(declare-fun mapIsEmpty!37272 () Bool)

(assert (=> mapIsEmpty!37272 mapRes!37272))

(declare-fun b!1022017 () Bool)

(assert (=> b!1022017 (= e!575684 (and e!575680 mapRes!37272))))

(declare-fun condMapEmpty!37272 () Bool)

(declare-fun mapDefault!37272 () ValueCell!11248)

