; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90536 () Bool)

(assert start!90536)

(declare-fun b!1035616 () Bool)

(declare-fun b_free!20859 () Bool)

(declare-fun b_next!20859 () Bool)

(assert (=> b!1035616 (= b_free!20859 (not b_next!20859))))

(declare-fun tp!73704 () Bool)

(declare-fun b_and!33359 () Bool)

(assert (=> b!1035616 (= tp!73704 b_and!33359)))

(declare-fun b!1035610 () Bool)

(declare-fun e!585622 () Bool)

(declare-fun e!585620 () Bool)

(declare-fun mapRes!38379 () Bool)

(assert (=> b!1035610 (= e!585622 (and e!585620 mapRes!38379))))

(declare-fun condMapEmpty!38379 () Bool)

(declare-datatypes ((V!37645 0))(
  ( (V!37646 (val!12340 Int)) )
))
(declare-datatypes ((ValueCell!11586 0))(
  ( (ValueCellFull!11586 (v!14920 V!37645)) (EmptyCell!11586) )
))
(declare-datatypes ((array!65252 0))(
  ( (array!65253 (arr!31413 (Array (_ BitVec 32) (_ BitVec 64))) (size!31941 (_ BitVec 32))) )
))
(declare-datatypes ((array!65254 0))(
  ( (array!65255 (arr!31414 (Array (_ BitVec 32) ValueCell!11586)) (size!31942 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5766 0))(
  ( (LongMapFixedSize!5767 (defaultEntry!6261 Int) (mask!30152 (_ BitVec 32)) (extraKeys!5991 (_ BitVec 32)) (zeroValue!6095 V!37645) (minValue!6097 V!37645) (_size!2938 (_ BitVec 32)) (_keys!11448 array!65252) (_values!6284 array!65254) (_vacant!2938 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5766)

(declare-fun mapDefault!38379 () ValueCell!11586)

(assert (=> b!1035610 (= condMapEmpty!38379 (= (arr!31414 (_values!6284 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11586)) mapDefault!38379)))))

(declare-fun mapIsEmpty!38379 () Bool)

(assert (=> mapIsEmpty!38379 mapRes!38379))

(declare-fun mapNonEmpty!38379 () Bool)

(declare-fun tp!73705 () Bool)

(declare-fun e!585621 () Bool)

(assert (=> mapNonEmpty!38379 (= mapRes!38379 (and tp!73705 e!585621))))

(declare-fun mapRest!38379 () (Array (_ BitVec 32) ValueCell!11586))

(declare-fun mapValue!38379 () ValueCell!11586)

(declare-fun mapKey!38379 () (_ BitVec 32))

(assert (=> mapNonEmpty!38379 (= (arr!31414 (_values!6284 thiss!1427)) (store mapRest!38379 mapKey!38379 mapValue!38379))))

(declare-fun b!1035612 () Bool)

(declare-fun tp_is_empty!24579 () Bool)

(assert (=> b!1035612 (= e!585621 tp_is_empty!24579)))

(declare-fun b!1035613 () Bool)

(declare-fun res!691431 () Bool)

(declare-fun e!585625 () Bool)

(assert (=> b!1035613 (=> (not res!691431) (not e!585625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035613 (= res!691431 (validMask!0 (mask!30152 thiss!1427)))))

(declare-fun b!1035614 () Bool)

(assert (=> b!1035614 (= e!585625 (and (= (size!31942 (_values!6284 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30152 thiss!1427))) (= (size!31941 (_keys!11448 thiss!1427)) (size!31942 (_values!6284 thiss!1427))) (bvsge (mask!30152 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5991 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5991 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5991 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5991 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5991 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5991 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (not (= (bvand (bvand (extraKeys!5991 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1035615 () Bool)

(assert (=> b!1035615 (= e!585620 tp_is_empty!24579)))

(declare-fun e!585623 () Bool)

(declare-fun array_inv!24301 (array!65252) Bool)

(declare-fun array_inv!24302 (array!65254) Bool)

(assert (=> b!1035616 (= e!585623 (and tp!73704 tp_is_empty!24579 (array_inv!24301 (_keys!11448 thiss!1427)) (array_inv!24302 (_values!6284 thiss!1427)) e!585622))))

(declare-fun b!1035611 () Bool)

(declare-fun res!691432 () Bool)

(assert (=> b!1035611 (=> (not res!691432) (not e!585625))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035611 (= res!691432 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!691433 () Bool)

(assert (=> start!90536 (=> (not res!691433) (not e!585625))))

(declare-fun valid!2177 (LongMapFixedSize!5766) Bool)

(assert (=> start!90536 (= res!691433 (valid!2177 thiss!1427))))

(assert (=> start!90536 e!585625))

(assert (=> start!90536 e!585623))

(assert (=> start!90536 true))

(assert (= (and start!90536 res!691433) b!1035611))

(assert (= (and b!1035611 res!691432) b!1035613))

(assert (= (and b!1035613 res!691431) b!1035614))

(assert (= (and b!1035610 condMapEmpty!38379) mapIsEmpty!38379))

(assert (= (and b!1035610 (not condMapEmpty!38379)) mapNonEmpty!38379))

(get-info :version)

(assert (= (and mapNonEmpty!38379 ((_ is ValueCellFull!11586) mapValue!38379)) b!1035612))

(assert (= (and b!1035610 ((_ is ValueCellFull!11586) mapDefault!38379)) b!1035615))

(assert (= b!1035616 b!1035610))

(assert (= start!90536 b!1035616))

(declare-fun m!955463 () Bool)

(assert (=> mapNonEmpty!38379 m!955463))

(declare-fun m!955465 () Bool)

(assert (=> b!1035613 m!955465))

(declare-fun m!955467 () Bool)

(assert (=> b!1035616 m!955467))

(declare-fun m!955469 () Bool)

(assert (=> b!1035616 m!955469))

(declare-fun m!955471 () Bool)

(assert (=> start!90536 m!955471))

(check-sat (not b!1035613) (not mapNonEmpty!38379) (not b!1035616) (not start!90536) tp_is_empty!24579 (not b_next!20859) b_and!33359)
(check-sat b_and!33359 (not b_next!20859))
