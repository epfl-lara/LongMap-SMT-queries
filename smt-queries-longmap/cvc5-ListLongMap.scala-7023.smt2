; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89150 () Bool)

(assert start!89150)

(declare-fun b!1022120 () Bool)

(declare-fun b_free!20191 () Bool)

(declare-fun b_next!20191 () Bool)

(assert (=> b!1022120 (= b_free!20191 (not b_next!20191))))

(declare-fun tp!71608 () Bool)

(declare-fun b_and!32389 () Bool)

(assert (=> b!1022120 (= tp!71608 b_and!32389)))

(declare-fun b!1022117 () Bool)

(declare-fun res!684760 () Bool)

(declare-fun e!575757 () Bool)

(assert (=> b!1022117 (=> (not res!684760) (not e!575757))))

(declare-datatypes ((V!36755 0))(
  ( (V!36756 (val!12006 Int)) )
))
(declare-datatypes ((ValueCell!11252 0))(
  ( (ValueCellFull!11252 (v!14575 V!36755)) (EmptyCell!11252) )
))
(declare-datatypes ((array!63866 0))(
  ( (array!63867 (arr!30745 (Array (_ BitVec 32) (_ BitVec 64))) (size!31256 (_ BitVec 32))) )
))
(declare-datatypes ((array!63868 0))(
  ( (array!63869 (arr!30746 (Array (_ BitVec 32) ValueCell!11252)) (size!31257 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5098 0))(
  ( (LongMapFixedSize!5099 (defaultEntry!5901 Int) (mask!29488 (_ BitVec 32)) (extraKeys!5633 (_ BitVec 32)) (zeroValue!5737 V!36755) (minValue!5737 V!36755) (_size!2604 (_ BitVec 32)) (_keys!11046 array!63866) (_values!5924 array!63868) (_vacant!2604 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5098)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022117 (= res!684760 (validMask!0 (mask!29488 thiss!1427)))))

(declare-fun mapIsEmpty!37284 () Bool)

(declare-fun mapRes!37284 () Bool)

(assert (=> mapIsEmpty!37284 mapRes!37284))

(declare-fun b!1022119 () Bool)

(declare-fun res!684761 () Bool)

(assert (=> b!1022119 (=> (not res!684761) (not e!575757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63866 (_ BitVec 32)) Bool)

(assert (=> b!1022119 (= res!684761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11046 thiss!1427) (mask!29488 thiss!1427)))))

(declare-fun tp_is_empty!23911 () Bool)

(declare-fun e!575755 () Bool)

(declare-fun e!575752 () Bool)

(declare-fun array_inv!23839 (array!63866) Bool)

(declare-fun array_inv!23840 (array!63868) Bool)

(assert (=> b!1022120 (= e!575755 (and tp!71608 tp_is_empty!23911 (array_inv!23839 (_keys!11046 thiss!1427)) (array_inv!23840 (_values!5924 thiss!1427)) e!575752))))

(declare-fun b!1022121 () Bool)

(declare-fun e!575753 () Bool)

(assert (=> b!1022121 (= e!575753 tp_is_empty!23911)))

(declare-fun b!1022122 () Bool)

(declare-fun res!684759 () Bool)

(assert (=> b!1022122 (=> (not res!684759) (not e!575757))))

(assert (=> b!1022122 (= res!684759 (and (= (size!31257 (_values!5924 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29488 thiss!1427))) (= (size!31256 (_keys!11046 thiss!1427)) (size!31257 (_values!5924 thiss!1427))) (bvsge (mask!29488 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5633 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5633 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022123 () Bool)

(declare-fun e!575754 () Bool)

(assert (=> b!1022123 (= e!575754 tp_is_empty!23911)))

(declare-fun b!1022124 () Bool)

(declare-fun res!684757 () Bool)

(assert (=> b!1022124 (=> (not res!684757) (not e!575757))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022124 (= res!684757 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022125 () Bool)

(assert (=> b!1022125 (= e!575757 false)))

(declare-fun lt!450180 () Bool)

(declare-datatypes ((List!21672 0))(
  ( (Nil!21669) (Cons!21668 (h!22866 (_ BitVec 64)) (t!30686 List!21672)) )
))
(declare-fun arrayNoDuplicates!0 (array!63866 (_ BitVec 32) List!21672) Bool)

(assert (=> b!1022125 (= lt!450180 (arrayNoDuplicates!0 (_keys!11046 thiss!1427) #b00000000000000000000000000000000 Nil!21669))))

(declare-fun mapNonEmpty!37284 () Bool)

(declare-fun tp!71607 () Bool)

(assert (=> mapNonEmpty!37284 (= mapRes!37284 (and tp!71607 e!575753))))

(declare-fun mapKey!37284 () (_ BitVec 32))

(declare-fun mapRest!37284 () (Array (_ BitVec 32) ValueCell!11252))

(declare-fun mapValue!37284 () ValueCell!11252)

(assert (=> mapNonEmpty!37284 (= (arr!30746 (_values!5924 thiss!1427)) (store mapRest!37284 mapKey!37284 mapValue!37284))))

(declare-fun b!1022118 () Bool)

(assert (=> b!1022118 (= e!575752 (and e!575754 mapRes!37284))))

(declare-fun condMapEmpty!37284 () Bool)

(declare-fun mapDefault!37284 () ValueCell!11252)

