; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90762 () Bool)

(assert start!90762)

(declare-fun b!1036843 () Bool)

(declare-fun b_free!20851 () Bool)

(declare-fun b_next!20851 () Bool)

(assert (=> b!1036843 (= b_free!20851 (not b_next!20851))))

(declare-fun tp!73680 () Bool)

(declare-fun b_and!33361 () Bool)

(assert (=> b!1036843 (= tp!73680 b_and!33361)))

(declare-fun b!1036841 () Bool)

(declare-fun e!586396 () Bool)

(declare-datatypes ((V!37635 0))(
  ( (V!37636 (val!12336 Int)) )
))
(declare-datatypes ((ValueCell!11582 0))(
  ( (ValueCellFull!11582 (v!14912 V!37635)) (EmptyCell!11582) )
))
(declare-datatypes ((array!65285 0))(
  ( (array!65286 (arr!31423 (Array (_ BitVec 32) (_ BitVec 64))) (size!31952 (_ BitVec 32))) )
))
(declare-datatypes ((array!65287 0))(
  ( (array!65288 (arr!31424 (Array (_ BitVec 32) ValueCell!11582)) (size!31953 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5758 0))(
  ( (LongMapFixedSize!5759 (defaultEntry!6257 Int) (mask!30206 (_ BitVec 32)) (extraKeys!5987 (_ BitVec 32)) (zeroValue!6091 V!37635) (minValue!6093 V!37635) (_size!2934 (_ BitVec 32)) (_keys!11482 array!65285) (_values!6280 array!65287) (_vacant!2934 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5758)

(assert (=> b!1036841 (= e!586396 (and (= (size!31953 (_values!6280 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30206 thiss!1427))) (= (size!31952 (_keys!11482 thiss!1427)) (size!31953 (_values!6280 thiss!1427))) (bvsge (mask!30206 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5987 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5987 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5987 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))))

(declare-fun mapIsEmpty!38367 () Bool)

(declare-fun mapRes!38367 () Bool)

(assert (=> mapIsEmpty!38367 mapRes!38367))

(declare-fun res!691906 () Bool)

(assert (=> start!90762 (=> (not res!691906) (not e!586396))))

(declare-fun valid!2180 (LongMapFixedSize!5758) Bool)

(assert (=> start!90762 (= res!691906 (valid!2180 thiss!1427))))

(assert (=> start!90762 e!586396))

(declare-fun e!586393 () Bool)

(assert (=> start!90762 e!586393))

(assert (=> start!90762 true))

(declare-fun b!1036842 () Bool)

(declare-fun e!586392 () Bool)

(declare-fun tp_is_empty!24571 () Bool)

(assert (=> b!1036842 (= e!586392 tp_is_empty!24571)))

(declare-fun e!586391 () Bool)

(declare-fun array_inv!24317 (array!65285) Bool)

(declare-fun array_inv!24318 (array!65287) Bool)

(assert (=> b!1036843 (= e!586393 (and tp!73680 tp_is_empty!24571 (array_inv!24317 (_keys!11482 thiss!1427)) (array_inv!24318 (_values!6280 thiss!1427)) e!586391))))

(declare-fun b!1036844 () Bool)

(declare-fun e!586394 () Bool)

(assert (=> b!1036844 (= e!586394 tp_is_empty!24571)))

(declare-fun b!1036845 () Bool)

(assert (=> b!1036845 (= e!586391 (and e!586394 mapRes!38367))))

(declare-fun condMapEmpty!38367 () Bool)

(declare-fun mapDefault!38367 () ValueCell!11582)

(assert (=> b!1036845 (= condMapEmpty!38367 (= (arr!31424 (_values!6280 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11582)) mapDefault!38367)))))

(declare-fun b!1036846 () Bool)

(declare-fun res!691907 () Bool)

(assert (=> b!1036846 (=> (not res!691907) (not e!586396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036846 (= res!691907 (validMask!0 (mask!30206 thiss!1427)))))

(declare-fun b!1036847 () Bool)

(declare-fun res!691905 () Bool)

(assert (=> b!1036847 (=> (not res!691905) (not e!586396))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036847 (= res!691905 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!38367 () Bool)

(declare-fun tp!73681 () Bool)

(assert (=> mapNonEmpty!38367 (= mapRes!38367 (and tp!73681 e!586392))))

(declare-fun mapKey!38367 () (_ BitVec 32))

(declare-fun mapValue!38367 () ValueCell!11582)

(declare-fun mapRest!38367 () (Array (_ BitVec 32) ValueCell!11582))

(assert (=> mapNonEmpty!38367 (= (arr!31424 (_values!6280 thiss!1427)) (store mapRest!38367 mapKey!38367 mapValue!38367))))

(assert (= (and start!90762 res!691906) b!1036847))

(assert (= (and b!1036847 res!691905) b!1036846))

(assert (= (and b!1036846 res!691907) b!1036841))

(assert (= (and b!1036845 condMapEmpty!38367) mapIsEmpty!38367))

(assert (= (and b!1036845 (not condMapEmpty!38367)) mapNonEmpty!38367))

(get-info :version)

(assert (= (and mapNonEmpty!38367 ((_ is ValueCellFull!11582) mapValue!38367)) b!1036842))

(assert (= (and b!1036845 ((_ is ValueCellFull!11582) mapDefault!38367)) b!1036844))

(assert (= b!1036843 b!1036845))

(assert (= start!90762 b!1036843))

(declare-fun m!957087 () Bool)

(assert (=> start!90762 m!957087))

(declare-fun m!957089 () Bool)

(assert (=> b!1036843 m!957089))

(declare-fun m!957091 () Bool)

(assert (=> b!1036843 m!957091))

(declare-fun m!957093 () Bool)

(assert (=> b!1036846 m!957093))

(declare-fun m!957095 () Bool)

(assert (=> mapNonEmpty!38367 m!957095))

(check-sat (not mapNonEmpty!38367) (not start!90762) (not b!1036843) b_and!33361 tp_is_empty!24571 (not b!1036846) (not b_next!20851))
(check-sat b_and!33361 (not b_next!20851))
