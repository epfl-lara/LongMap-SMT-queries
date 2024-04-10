; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90270 () Bool)

(assert start!90270)

(declare-fun b!1033397 () Bool)

(declare-fun b_free!20789 () Bool)

(declare-fun b_next!20789 () Bool)

(assert (=> b!1033397 (= b_free!20789 (not b_next!20789))))

(declare-fun tp!73461 () Bool)

(declare-fun b_and!33257 () Bool)

(assert (=> b!1033397 (= tp!73461 b_and!33257)))

(declare-fun res!690484 () Bool)

(declare-fun e!584100 () Bool)

(assert (=> start!90270 (=> (not res!690484) (not e!584100))))

(declare-datatypes ((V!37551 0))(
  ( (V!37552 (val!12305 Int)) )
))
(declare-datatypes ((ValueCell!11551 0))(
  ( (ValueCellFull!11551 (v!14882 V!37551)) (EmptyCell!11551) )
))
(declare-datatypes ((array!65094 0))(
  ( (array!65095 (arr!31343 (Array (_ BitVec 32) (_ BitVec 64))) (size!31865 (_ BitVec 32))) )
))
(declare-datatypes ((array!65096 0))(
  ( (array!65097 (arr!31344 (Array (_ BitVec 32) ValueCell!11551)) (size!31866 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5696 0))(
  ( (LongMapFixedSize!5697 (defaultEntry!6222 Int) (mask!30071 (_ BitVec 32)) (extraKeys!5954 (_ BitVec 32)) (zeroValue!6058 V!37551) (minValue!6058 V!37551) (_size!2903 (_ BitVec 32)) (_keys!11400 array!65094) (_values!6245 array!65096) (_vacant!2903 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5696)

(declare-fun valid!2153 (LongMapFixedSize!5696) Bool)

(assert (=> start!90270 (= res!690484 (valid!2153 thiss!1427))))

(assert (=> start!90270 e!584100))

(declare-fun e!584097 () Bool)

(assert (=> start!90270 e!584097))

(assert (=> start!90270 true))

(declare-fun b!1033394 () Bool)

(declare-fun res!690485 () Bool)

(assert (=> b!1033394 (=> (not res!690485) (not e!584100))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033394 (= res!690485 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033395 () Bool)

(declare-fun res!690483 () Bool)

(assert (=> b!1033395 (=> (not res!690483) (not e!584100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033395 (= res!690483 (validMask!0 (mask!30071 thiss!1427)))))

(declare-fun b!1033396 () Bool)

(declare-fun e!584096 () Bool)

(declare-fun tp_is_empty!24509 () Bool)

(assert (=> b!1033396 (= e!584096 tp_is_empty!24509)))

(declare-fun e!584098 () Bool)

(declare-fun array_inv!24251 (array!65094) Bool)

(declare-fun array_inv!24252 (array!65096) Bool)

(assert (=> b!1033397 (= e!584097 (and tp!73461 tp_is_empty!24509 (array_inv!24251 (_keys!11400 thiss!1427)) (array_inv!24252 (_values!6245 thiss!1427)) e!584098))))

(declare-fun mapIsEmpty!38240 () Bool)

(declare-fun mapRes!38240 () Bool)

(assert (=> mapIsEmpty!38240 mapRes!38240))

(declare-fun mapNonEmpty!38240 () Bool)

(declare-fun tp!73460 () Bool)

(declare-fun e!584101 () Bool)

(assert (=> mapNonEmpty!38240 (= mapRes!38240 (and tp!73460 e!584101))))

(declare-fun mapKey!38240 () (_ BitVec 32))

(declare-fun mapRest!38240 () (Array (_ BitVec 32) ValueCell!11551))

(declare-fun mapValue!38240 () ValueCell!11551)

(assert (=> mapNonEmpty!38240 (= (arr!31344 (_values!6245 thiss!1427)) (store mapRest!38240 mapKey!38240 mapValue!38240))))

(declare-fun b!1033398 () Bool)

(assert (=> b!1033398 (= e!584101 tp_is_empty!24509)))

(declare-fun b!1033399 () Bool)

(declare-fun res!690482 () Bool)

(assert (=> b!1033399 (=> (not res!690482) (not e!584100))))

(assert (=> b!1033399 (= res!690482 (and (= (size!31866 (_values!6245 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30071 thiss!1427))) (= (size!31865 (_keys!11400 thiss!1427)) (size!31866 (_values!6245 thiss!1427))) (bvsge (mask!30071 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5954 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5954 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5954 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5954 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5954 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5954 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5954 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033400 () Bool)

(assert (=> b!1033400 (= e!584098 (and e!584096 mapRes!38240))))

(declare-fun condMapEmpty!38240 () Bool)

(declare-fun mapDefault!38240 () ValueCell!11551)

