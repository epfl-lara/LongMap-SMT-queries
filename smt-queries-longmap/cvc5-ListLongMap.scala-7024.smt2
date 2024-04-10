; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89156 () Bool)

(assert start!89156)

(declare-fun b!1022201 () Bool)

(declare-fun b_free!20197 () Bool)

(declare-fun b_next!20197 () Bool)

(assert (=> b!1022201 (= b_free!20197 (not b_next!20197))))

(declare-fun tp!71625 () Bool)

(declare-fun b_and!32395 () Bool)

(assert (=> b!1022201 (= tp!71625 b_and!32395)))

(declare-fun mapIsEmpty!37293 () Bool)

(declare-fun mapRes!37293 () Bool)

(assert (=> mapIsEmpty!37293 mapRes!37293))

(declare-fun b!1022198 () Bool)

(declare-fun res!684802 () Bool)

(declare-fun e!575810 () Bool)

(assert (=> b!1022198 (=> (not res!684802) (not e!575810))))

(declare-datatypes ((V!36763 0))(
  ( (V!36764 (val!12009 Int)) )
))
(declare-datatypes ((ValueCell!11255 0))(
  ( (ValueCellFull!11255 (v!14578 V!36763)) (EmptyCell!11255) )
))
(declare-datatypes ((array!63878 0))(
  ( (array!63879 (arr!30751 (Array (_ BitVec 32) (_ BitVec 64))) (size!31262 (_ BitVec 32))) )
))
(declare-datatypes ((array!63880 0))(
  ( (array!63881 (arr!30752 (Array (_ BitVec 32) ValueCell!11255)) (size!31263 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5104 0))(
  ( (LongMapFixedSize!5105 (defaultEntry!5904 Int) (mask!29493 (_ BitVec 32)) (extraKeys!5636 (_ BitVec 32)) (zeroValue!5740 V!36763) (minValue!5740 V!36763) (_size!2607 (_ BitVec 32)) (_keys!11049 array!63878) (_values!5927 array!63880) (_vacant!2607 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5104)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63878 (_ BitVec 32)) Bool)

(assert (=> b!1022198 (= res!684802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11049 thiss!1427) (mask!29493 thiss!1427)))))

(declare-fun mapNonEmpty!37293 () Bool)

(declare-fun tp!71626 () Bool)

(declare-fun e!575806 () Bool)

(assert (=> mapNonEmpty!37293 (= mapRes!37293 (and tp!71626 e!575806))))

(declare-fun mapKey!37293 () (_ BitVec 32))

(declare-fun mapValue!37293 () ValueCell!11255)

(declare-fun mapRest!37293 () (Array (_ BitVec 32) ValueCell!11255))

(assert (=> mapNonEmpty!37293 (= (arr!30752 (_values!5927 thiss!1427)) (store mapRest!37293 mapKey!37293 mapValue!37293))))

(declare-fun b!1022199 () Bool)

(assert (=> b!1022199 (= e!575810 false)))

(declare-fun lt!450189 () Bool)

(declare-datatypes ((List!21675 0))(
  ( (Nil!21672) (Cons!21671 (h!22869 (_ BitVec 64)) (t!30689 List!21675)) )
))
(declare-fun arrayNoDuplicates!0 (array!63878 (_ BitVec 32) List!21675) Bool)

(assert (=> b!1022199 (= lt!450189 (arrayNoDuplicates!0 (_keys!11049 thiss!1427) #b00000000000000000000000000000000 Nil!21672))))

(declare-fun b!1022200 () Bool)

(declare-fun res!684803 () Bool)

(assert (=> b!1022200 (=> (not res!684803) (not e!575810))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022200 (= res!684803 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022202 () Bool)

(declare-fun res!684806 () Bool)

(assert (=> b!1022202 (=> (not res!684806) (not e!575810))))

(assert (=> b!1022202 (= res!684806 (and (= (size!31263 (_values!5927 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29493 thiss!1427))) (= (size!31262 (_keys!11049 thiss!1427)) (size!31263 (_values!5927 thiss!1427))) (bvsge (mask!29493 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5636 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5636 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022203 () Bool)

(declare-fun e!575809 () Bool)

(declare-fun e!575811 () Bool)

(assert (=> b!1022203 (= e!575809 (and e!575811 mapRes!37293))))

(declare-fun condMapEmpty!37293 () Bool)

(declare-fun mapDefault!37293 () ValueCell!11255)

