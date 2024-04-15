; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90532 () Bool)

(assert start!90532)

(declare-fun b!1035442 () Bool)

(declare-fun b_free!20857 () Bool)

(declare-fun b_next!20857 () Bool)

(assert (=> b!1035442 (= b_free!20857 (not b_next!20857))))

(declare-fun tp!73699 () Bool)

(declare-fun b_and!33331 () Bool)

(assert (=> b!1035442 (= tp!73699 b_and!33331)))

(declare-fun b!1035438 () Bool)

(declare-fun res!691356 () Bool)

(declare-fun e!585515 () Bool)

(assert (=> b!1035438 (=> (not res!691356) (not e!585515))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035438 (= res!691356 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!38376 () Bool)

(declare-fun mapRes!38376 () Bool)

(assert (=> mapIsEmpty!38376 mapRes!38376))

(declare-fun b!1035439 () Bool)

(declare-fun res!691355 () Bool)

(assert (=> b!1035439 (=> (not res!691355) (not e!585515))))

(declare-datatypes ((V!37643 0))(
  ( (V!37644 (val!12339 Int)) )
))
(declare-datatypes ((ValueCell!11585 0))(
  ( (ValueCellFull!11585 (v!14918 V!37643)) (EmptyCell!11585) )
))
(declare-datatypes ((array!65187 0))(
  ( (array!65188 (arr!31380 (Array (_ BitVec 32) (_ BitVec 64))) (size!31910 (_ BitVec 32))) )
))
(declare-datatypes ((array!65189 0))(
  ( (array!65190 (arr!31381 (Array (_ BitVec 32) ValueCell!11585)) (size!31911 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5764 0))(
  ( (LongMapFixedSize!5765 (defaultEntry!6260 Int) (mask!30146 (_ BitVec 32)) (extraKeys!5990 (_ BitVec 32)) (zeroValue!6094 V!37643) (minValue!6096 V!37643) (_size!2937 (_ BitVec 32)) (_keys!11443 array!65187) (_values!6283 array!65189) (_vacant!2937 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5764)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035439 (= res!691355 (validMask!0 (mask!30146 thiss!1427)))))

(declare-fun b!1035440 () Bool)

(assert (=> b!1035440 (= e!585515 (and (= (size!31911 (_values!6283 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30146 thiss!1427))) (= (size!31910 (_keys!11443 thiss!1427)) (size!31911 (_values!6283 thiss!1427))) (bvsge (mask!30146 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5990 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5990 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (not (= (bvand (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!691357 () Bool)

(assert (=> start!90532 (=> (not res!691357) (not e!585515))))

(declare-fun valid!2165 (LongMapFixedSize!5764) Bool)

(assert (=> start!90532 (= res!691357 (valid!2165 thiss!1427))))

(assert (=> start!90532 e!585515))

(declare-fun e!585511 () Bool)

(assert (=> start!90532 e!585511))

(assert (=> start!90532 true))

(declare-fun b!1035441 () Bool)

(declare-fun e!585513 () Bool)

(declare-fun tp_is_empty!24577 () Bool)

(assert (=> b!1035441 (= e!585513 tp_is_empty!24577)))

(declare-fun e!585514 () Bool)

(declare-fun array_inv!24273 (array!65187) Bool)

(declare-fun array_inv!24274 (array!65189) Bool)

(assert (=> b!1035442 (= e!585511 (and tp!73699 tp_is_empty!24577 (array_inv!24273 (_keys!11443 thiss!1427)) (array_inv!24274 (_values!6283 thiss!1427)) e!585514))))

(declare-fun b!1035443 () Bool)

(declare-fun e!585516 () Bool)

(assert (=> b!1035443 (= e!585514 (and e!585516 mapRes!38376))))

(declare-fun condMapEmpty!38376 () Bool)

(declare-fun mapDefault!38376 () ValueCell!11585)

(assert (=> b!1035443 (= condMapEmpty!38376 (= (arr!31381 (_values!6283 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11585)) mapDefault!38376)))))

(declare-fun b!1035444 () Bool)

(assert (=> b!1035444 (= e!585516 tp_is_empty!24577)))

(declare-fun mapNonEmpty!38376 () Bool)

(declare-fun tp!73698 () Bool)

(assert (=> mapNonEmpty!38376 (= mapRes!38376 (and tp!73698 e!585513))))

(declare-fun mapValue!38376 () ValueCell!11585)

(declare-fun mapRest!38376 () (Array (_ BitVec 32) ValueCell!11585))

(declare-fun mapKey!38376 () (_ BitVec 32))

(assert (=> mapNonEmpty!38376 (= (arr!31381 (_values!6283 thiss!1427)) (store mapRest!38376 mapKey!38376 mapValue!38376))))

(assert (= (and start!90532 res!691357) b!1035438))

(assert (= (and b!1035438 res!691356) b!1035439))

(assert (= (and b!1035439 res!691355) b!1035440))

(assert (= (and b!1035443 condMapEmpty!38376) mapIsEmpty!38376))

(assert (= (and b!1035443 (not condMapEmpty!38376)) mapNonEmpty!38376))

(get-info :version)

(assert (= (and mapNonEmpty!38376 ((_ is ValueCellFull!11585) mapValue!38376)) b!1035441))

(assert (= (and b!1035443 ((_ is ValueCellFull!11585) mapDefault!38376)) b!1035444))

(assert (= b!1035442 b!1035443))

(assert (= start!90532 b!1035442))

(declare-fun m!954833 () Bool)

(assert (=> b!1035439 m!954833))

(declare-fun m!954835 () Bool)

(assert (=> start!90532 m!954835))

(declare-fun m!954837 () Bool)

(assert (=> b!1035442 m!954837))

(declare-fun m!954839 () Bool)

(assert (=> b!1035442 m!954839))

(declare-fun m!954841 () Bool)

(assert (=> mapNonEmpty!38376 m!954841))

(check-sat (not start!90532) (not b!1035442) (not b!1035439) b_and!33331 (not b_next!20857) (not mapNonEmpty!38376) tp_is_empty!24577)
(check-sat b_and!33331 (not b_next!20857))
