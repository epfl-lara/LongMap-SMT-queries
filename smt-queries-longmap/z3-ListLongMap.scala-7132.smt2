; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90520 () Bool)

(assert start!90520)

(declare-fun b!1035318 () Bool)

(declare-fun b_free!20845 () Bool)

(declare-fun b_next!20845 () Bool)

(assert (=> b!1035318 (= b_free!20845 (not b_next!20845))))

(declare-fun tp!73662 () Bool)

(declare-fun b_and!33319 () Bool)

(assert (=> b!1035318 (= tp!73662 b_and!33319)))

(declare-fun b!1035312 () Bool)

(declare-fun e!585403 () Bool)

(declare-fun tp_is_empty!24565 () Bool)

(assert (=> b!1035312 (= e!585403 tp_is_empty!24565)))

(declare-fun b!1035313 () Bool)

(declare-fun e!585406 () Bool)

(declare-datatypes ((V!37627 0))(
  ( (V!37628 (val!12333 Int)) )
))
(declare-datatypes ((ValueCell!11579 0))(
  ( (ValueCellFull!11579 (v!14912 V!37627)) (EmptyCell!11579) )
))
(declare-datatypes ((array!65163 0))(
  ( (array!65164 (arr!31368 (Array (_ BitVec 32) (_ BitVec 64))) (size!31898 (_ BitVec 32))) )
))
(declare-datatypes ((array!65165 0))(
  ( (array!65166 (arr!31369 (Array (_ BitVec 32) ValueCell!11579)) (size!31899 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5752 0))(
  ( (LongMapFixedSize!5753 (defaultEntry!6254 Int) (mask!30136 (_ BitVec 32)) (extraKeys!5984 (_ BitVec 32)) (zeroValue!6088 V!37627) (minValue!6090 V!37627) (_size!2931 (_ BitVec 32)) (_keys!11437 array!65163) (_values!6277 array!65165) (_vacant!2931 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5752)

(assert (=> b!1035313 (= e!585406 (and (= (size!31899 (_values!6277 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30136 thiss!1427))) (= (size!31898 (_keys!11437 thiss!1427)) (size!31899 (_values!6277 thiss!1427))) (bvsge (mask!30136 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5984 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5984 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5984 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5984 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38358 () Bool)

(declare-fun mapRes!38358 () Bool)

(assert (=> mapIsEmpty!38358 mapRes!38358))

(declare-fun b!1035314 () Bool)

(declare-fun res!691302 () Bool)

(assert (=> b!1035314 (=> (not res!691302) (not e!585406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035314 (= res!691302 (validMask!0 (mask!30136 thiss!1427)))))

(declare-fun b!1035315 () Bool)

(declare-fun e!585407 () Bool)

(assert (=> b!1035315 (= e!585407 tp_is_empty!24565)))

(declare-fun res!691301 () Bool)

(assert (=> start!90520 (=> (not res!691301) (not e!585406))))

(declare-fun valid!2161 (LongMapFixedSize!5752) Bool)

(assert (=> start!90520 (= res!691301 (valid!2161 thiss!1427))))

(assert (=> start!90520 e!585406))

(declare-fun e!585405 () Bool)

(assert (=> start!90520 e!585405))

(assert (=> start!90520 true))

(declare-fun b!1035316 () Bool)

(declare-fun e!585408 () Bool)

(assert (=> b!1035316 (= e!585408 (and e!585403 mapRes!38358))))

(declare-fun condMapEmpty!38358 () Bool)

(declare-fun mapDefault!38358 () ValueCell!11579)

(assert (=> b!1035316 (= condMapEmpty!38358 (= (arr!31369 (_values!6277 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11579)) mapDefault!38358)))))

(declare-fun mapNonEmpty!38358 () Bool)

(declare-fun tp!73663 () Bool)

(assert (=> mapNonEmpty!38358 (= mapRes!38358 (and tp!73663 e!585407))))

(declare-fun mapValue!38358 () ValueCell!11579)

(declare-fun mapRest!38358 () (Array (_ BitVec 32) ValueCell!11579))

(declare-fun mapKey!38358 () (_ BitVec 32))

(assert (=> mapNonEmpty!38358 (= (arr!31369 (_values!6277 thiss!1427)) (store mapRest!38358 mapKey!38358 mapValue!38358))))

(declare-fun b!1035317 () Bool)

(declare-fun res!691303 () Bool)

(assert (=> b!1035317 (=> (not res!691303) (not e!585406))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035317 (= res!691303 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!24261 (array!65163) Bool)

(declare-fun array_inv!24262 (array!65165) Bool)

(assert (=> b!1035318 (= e!585405 (and tp!73662 tp_is_empty!24565 (array_inv!24261 (_keys!11437 thiss!1427)) (array_inv!24262 (_values!6277 thiss!1427)) e!585408))))

(assert (= (and start!90520 res!691301) b!1035317))

(assert (= (and b!1035317 res!691303) b!1035314))

(assert (= (and b!1035314 res!691302) b!1035313))

(assert (= (and b!1035316 condMapEmpty!38358) mapIsEmpty!38358))

(assert (= (and b!1035316 (not condMapEmpty!38358)) mapNonEmpty!38358))

(get-info :version)

(assert (= (and mapNonEmpty!38358 ((_ is ValueCellFull!11579) mapValue!38358)) b!1035315))

(assert (= (and b!1035316 ((_ is ValueCellFull!11579) mapDefault!38358)) b!1035312))

(assert (= b!1035318 b!1035316))

(assert (= start!90520 b!1035318))

(declare-fun m!954773 () Bool)

(assert (=> b!1035314 m!954773))

(declare-fun m!954775 () Bool)

(assert (=> start!90520 m!954775))

(declare-fun m!954777 () Bool)

(assert (=> mapNonEmpty!38358 m!954777))

(declare-fun m!954779 () Bool)

(assert (=> b!1035318 m!954779))

(declare-fun m!954781 () Bool)

(assert (=> b!1035318 m!954781))

(check-sat b_and!33319 (not mapNonEmpty!38358) (not b!1035318) tp_is_empty!24565 (not b_next!20845) (not start!90520) (not b!1035314))
(check-sat b_and!33319 (not b_next!20845))
