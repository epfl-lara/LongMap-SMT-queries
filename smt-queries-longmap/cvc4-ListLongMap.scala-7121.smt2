; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90264 () Bool)

(assert start!90264)

(declare-fun b!1033328 () Bool)

(declare-fun b_free!20783 () Bool)

(declare-fun b_next!20783 () Bool)

(assert (=> b!1033328 (= b_free!20783 (not b_next!20783))))

(declare-fun tp!73443 () Bool)

(declare-fun b_and!33251 () Bool)

(assert (=> b!1033328 (= tp!73443 b_and!33251)))

(declare-fun b!1033323 () Bool)

(declare-fun res!690449 () Bool)

(declare-fun e!584045 () Bool)

(assert (=> b!1033323 (=> (not res!690449) (not e!584045))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033323 (= res!690449 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!690447 () Bool)

(assert (=> start!90264 (=> (not res!690447) (not e!584045))))

(declare-datatypes ((V!37543 0))(
  ( (V!37544 (val!12302 Int)) )
))
(declare-datatypes ((ValueCell!11548 0))(
  ( (ValueCellFull!11548 (v!14879 V!37543)) (EmptyCell!11548) )
))
(declare-datatypes ((array!65082 0))(
  ( (array!65083 (arr!31337 (Array (_ BitVec 32) (_ BitVec 64))) (size!31859 (_ BitVec 32))) )
))
(declare-datatypes ((array!65084 0))(
  ( (array!65085 (arr!31338 (Array (_ BitVec 32) ValueCell!11548)) (size!31860 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5690 0))(
  ( (LongMapFixedSize!5691 (defaultEntry!6219 Int) (mask!30066 (_ BitVec 32)) (extraKeys!5951 (_ BitVec 32)) (zeroValue!6055 V!37543) (minValue!6055 V!37543) (_size!2900 (_ BitVec 32)) (_keys!11397 array!65082) (_values!6242 array!65084) (_vacant!2900 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5690)

(declare-fun valid!2150 (LongMapFixedSize!5690) Bool)

(assert (=> start!90264 (= res!690447 (valid!2150 thiss!1427))))

(assert (=> start!90264 e!584045))

(declare-fun e!584046 () Bool)

(assert (=> start!90264 e!584046))

(assert (=> start!90264 true))

(declare-fun b!1033324 () Bool)

(assert (=> b!1033324 (= e!584045 (and (= (size!31860 (_values!6242 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30066 thiss!1427))) (= (size!31859 (_keys!11397 thiss!1427)) (size!31860 (_values!6242 thiss!1427))) (bvsge (mask!30066 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5951 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5951 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5951 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5951 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5951 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5951 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (not (= (bvand (bvand (extraKeys!5951 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1033325 () Bool)

(declare-fun res!690448 () Bool)

(assert (=> b!1033325 (=> (not res!690448) (not e!584045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033325 (= res!690448 (validMask!0 (mask!30066 thiss!1427)))))

(declare-fun b!1033326 () Bool)

(declare-fun e!584042 () Bool)

(declare-fun e!584043 () Bool)

(declare-fun mapRes!38231 () Bool)

(assert (=> b!1033326 (= e!584042 (and e!584043 mapRes!38231))))

(declare-fun condMapEmpty!38231 () Bool)

(declare-fun mapDefault!38231 () ValueCell!11548)

