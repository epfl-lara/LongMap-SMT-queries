; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90286 () Bool)

(assert start!90286)

(declare-fun b!1033507 () Bool)

(declare-fun b_free!20795 () Bool)

(declare-fun b_next!20795 () Bool)

(assert (=> b!1033507 (= b_free!20795 (not b_next!20795))))

(declare-fun tp!73482 () Bool)

(declare-fun b_and!33263 () Bool)

(assert (=> b!1033507 (= tp!73482 b_and!33263)))

(declare-fun b!1033503 () Bool)

(declare-fun res!690542 () Bool)

(declare-fun e!584168 () Bool)

(assert (=> b!1033503 (=> (not res!690542) (not e!584168))))

(declare-datatypes ((V!37559 0))(
  ( (V!37560 (val!12308 Int)) )
))
(declare-datatypes ((ValueCell!11554 0))(
  ( (ValueCellFull!11554 (v!14885 V!37559)) (EmptyCell!11554) )
))
(declare-datatypes ((array!65108 0))(
  ( (array!65109 (arr!31349 (Array (_ BitVec 32) (_ BitVec 64))) (size!31871 (_ BitVec 32))) )
))
(declare-datatypes ((array!65110 0))(
  ( (array!65111 (arr!31350 (Array (_ BitVec 32) ValueCell!11554)) (size!31872 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5702 0))(
  ( (LongMapFixedSize!5703 (defaultEntry!6225 Int) (mask!30078 (_ BitVec 32)) (extraKeys!5957 (_ BitVec 32)) (zeroValue!6061 V!37559) (minValue!6061 V!37559) (_size!2906 (_ BitVec 32)) (_keys!11404 array!65108) (_values!6248 array!65110) (_vacant!2906 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5702)

(assert (=> b!1033503 (= res!690542 (and (= (size!31872 (_values!6248 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30078 thiss!1427))) (= (size!31871 (_keys!11404 thiss!1427)) (size!31872 (_values!6248 thiss!1427))) (bvsge (mask!30078 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5957 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5957 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5957 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5957 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5957 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5957 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5957 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033504 () Bool)

(declare-fun res!690543 () Bool)

(assert (=> b!1033504 (=> (not res!690543) (not e!584168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65108 (_ BitVec 32)) Bool)

(assert (=> b!1033504 (= res!690543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11404 thiss!1427) (mask!30078 thiss!1427)))))

(declare-fun mapIsEmpty!38252 () Bool)

(declare-fun mapRes!38252 () Bool)

(assert (=> mapIsEmpty!38252 mapRes!38252))

(declare-fun b!1033505 () Bool)

(declare-fun res!690544 () Bool)

(assert (=> b!1033505 (=> (not res!690544) (not e!584168))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033505 (= res!690544 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033506 () Bool)

(declare-fun res!690545 () Bool)

(assert (=> b!1033506 (=> (not res!690545) (not e!584168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033506 (= res!690545 (validMask!0 (mask!30078 thiss!1427)))))

(declare-fun mapNonEmpty!38252 () Bool)

(declare-fun tp!73481 () Bool)

(declare-fun e!584169 () Bool)

(assert (=> mapNonEmpty!38252 (= mapRes!38252 (and tp!73481 e!584169))))

(declare-fun mapKey!38252 () (_ BitVec 32))

(declare-fun mapRest!38252 () (Array (_ BitVec 32) ValueCell!11554))

(declare-fun mapValue!38252 () ValueCell!11554)

(assert (=> mapNonEmpty!38252 (= (arr!31350 (_values!6248 thiss!1427)) (store mapRest!38252 mapKey!38252 mapValue!38252))))

(declare-fun b!1033508 () Bool)

(declare-datatypes ((List!21903 0))(
  ( (Nil!21900) (Cons!21899 (h!23101 (_ BitVec 64)) (t!31097 List!21903)) )
))
(declare-fun arrayNoDuplicates!0 (array!65108 (_ BitVec 32) List!21903) Bool)

(assert (=> b!1033508 (= e!584168 (not (arrayNoDuplicates!0 (_keys!11404 thiss!1427) #b00000000000000000000000000000000 Nil!21900)))))

(declare-fun b!1033509 () Bool)

(declare-fun e!584171 () Bool)

(declare-fun e!584172 () Bool)

(assert (=> b!1033509 (= e!584171 (and e!584172 mapRes!38252))))

(declare-fun condMapEmpty!38252 () Bool)

(declare-fun mapDefault!38252 () ValueCell!11554)

