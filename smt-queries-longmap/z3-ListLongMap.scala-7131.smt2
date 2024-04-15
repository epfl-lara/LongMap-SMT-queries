; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90514 () Bool)

(assert start!90514)

(declare-fun b!1035253 () Bool)

(declare-fun b_free!20839 () Bool)

(declare-fun b_next!20839 () Bool)

(assert (=> b!1035253 (= b_free!20839 (not b_next!20839))))

(declare-fun tp!73645 () Bool)

(declare-fun b_and!33313 () Bool)

(assert (=> b!1035253 (= tp!73645 b_and!33313)))

(declare-fun b!1035249 () Bool)

(declare-fun e!585350 () Bool)

(declare-fun tp_is_empty!24559 () Bool)

(assert (=> b!1035249 (= e!585350 tp_is_empty!24559)))

(declare-fun b!1035250 () Bool)

(declare-fun e!585351 () Bool)

(declare-fun e!585354 () Bool)

(declare-fun mapRes!38349 () Bool)

(assert (=> b!1035250 (= e!585351 (and e!585354 mapRes!38349))))

(declare-fun condMapEmpty!38349 () Bool)

(declare-datatypes ((V!37619 0))(
  ( (V!37620 (val!12330 Int)) )
))
(declare-datatypes ((ValueCell!11576 0))(
  ( (ValueCellFull!11576 (v!14909 V!37619)) (EmptyCell!11576) )
))
(declare-datatypes ((array!65151 0))(
  ( (array!65152 (arr!31362 (Array (_ BitVec 32) (_ BitVec 64))) (size!31892 (_ BitVec 32))) )
))
(declare-datatypes ((array!65153 0))(
  ( (array!65154 (arr!31363 (Array (_ BitVec 32) ValueCell!11576)) (size!31893 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5746 0))(
  ( (LongMapFixedSize!5747 (defaultEntry!6251 Int) (mask!30131 (_ BitVec 32)) (extraKeys!5981 (_ BitVec 32)) (zeroValue!6085 V!37619) (minValue!6087 V!37619) (_size!2928 (_ BitVec 32)) (_keys!11434 array!65151) (_values!6274 array!65153) (_vacant!2928 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5746)

(declare-fun mapDefault!38349 () ValueCell!11576)

(assert (=> b!1035250 (= condMapEmpty!38349 (= (arr!31363 (_values!6274 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11576)) mapDefault!38349)))))

(declare-fun b!1035251 () Bool)

(declare-fun res!691274 () Bool)

(declare-fun e!585352 () Bool)

(assert (=> b!1035251 (=> (not res!691274) (not e!585352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035251 (= res!691274 (validMask!0 (mask!30131 thiss!1427)))))

(declare-fun b!1035252 () Bool)

(assert (=> b!1035252 (= e!585354 tp_is_empty!24559)))

(declare-fun mapNonEmpty!38349 () Bool)

(declare-fun tp!73644 () Bool)

(assert (=> mapNonEmpty!38349 (= mapRes!38349 (and tp!73644 e!585350))))

(declare-fun mapRest!38349 () (Array (_ BitVec 32) ValueCell!11576))

(declare-fun mapKey!38349 () (_ BitVec 32))

(declare-fun mapValue!38349 () ValueCell!11576)

(assert (=> mapNonEmpty!38349 (= (arr!31363 (_values!6274 thiss!1427)) (store mapRest!38349 mapKey!38349 mapValue!38349))))

(declare-fun e!585353 () Bool)

(declare-fun array_inv!24257 (array!65151) Bool)

(declare-fun array_inv!24258 (array!65153) Bool)

(assert (=> b!1035253 (= e!585353 (and tp!73645 tp_is_empty!24559 (array_inv!24257 (_keys!11434 thiss!1427)) (array_inv!24258 (_values!6274 thiss!1427)) e!585351))))

(declare-fun b!1035254 () Bool)

(assert (=> b!1035254 (= e!585352 (and (= (size!31893 (_values!6274 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30131 thiss!1427))) (= (size!31892 (_keys!11434 thiss!1427)) (size!31893 (_values!6274 thiss!1427))) (bvsge (mask!30131 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5981 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5981 thiss!1427) #b00000000000000000000000000000011) (bvslt (bvand (extraKeys!5981 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!691276 () Bool)

(assert (=> start!90514 (=> (not res!691276) (not e!585352))))

(declare-fun valid!2159 (LongMapFixedSize!5746) Bool)

(assert (=> start!90514 (= res!691276 (valid!2159 thiss!1427))))

(assert (=> start!90514 e!585352))

(assert (=> start!90514 e!585353))

(assert (=> start!90514 true))

(declare-fun b!1035255 () Bool)

(declare-fun res!691275 () Bool)

(assert (=> b!1035255 (=> (not res!691275) (not e!585352))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035255 (= res!691275 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!38349 () Bool)

(assert (=> mapIsEmpty!38349 mapRes!38349))

(assert (= (and start!90514 res!691276) b!1035255))

(assert (= (and b!1035255 res!691275) b!1035251))

(assert (= (and b!1035251 res!691274) b!1035254))

(assert (= (and b!1035250 condMapEmpty!38349) mapIsEmpty!38349))

(assert (= (and b!1035250 (not condMapEmpty!38349)) mapNonEmpty!38349))

(get-info :version)

(assert (= (and mapNonEmpty!38349 ((_ is ValueCellFull!11576) mapValue!38349)) b!1035249))

(assert (= (and b!1035250 ((_ is ValueCellFull!11576) mapDefault!38349)) b!1035252))

(assert (= b!1035253 b!1035250))

(assert (= start!90514 b!1035253))

(declare-fun m!954743 () Bool)

(assert (=> b!1035251 m!954743))

(declare-fun m!954745 () Bool)

(assert (=> mapNonEmpty!38349 m!954745))

(declare-fun m!954747 () Bool)

(assert (=> b!1035253 m!954747))

(declare-fun m!954749 () Bool)

(assert (=> b!1035253 m!954749))

(declare-fun m!954751 () Bool)

(assert (=> start!90514 m!954751))

(check-sat (not b_next!20839) (not start!90514) b_and!33313 (not b!1035253) (not b!1035251) tp_is_empty!24559 (not mapNonEmpty!38349))
(check-sat b_and!33313 (not b_next!20839))
