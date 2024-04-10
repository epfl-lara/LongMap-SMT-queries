; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90108 () Bool)

(assert start!90108)

(declare-fun b!1032268 () Bool)

(declare-fun b_free!20715 () Bool)

(declare-fun b_next!20715 () Bool)

(assert (=> b!1032268 (= b_free!20715 (not b_next!20715))))

(declare-fun tp!73215 () Bool)

(declare-fun b_and!33183 () Bool)

(assert (=> b!1032268 (= tp!73215 b_and!33183)))

(declare-fun res!689975 () Bool)

(declare-fun e!583220 () Bool)

(assert (=> start!90108 (=> (not res!689975) (not e!583220))))

(declare-datatypes ((V!37453 0))(
  ( (V!37454 (val!12268 Int)) )
))
(declare-datatypes ((ValueCell!11514 0))(
  ( (ValueCellFull!11514 (v!14845 V!37453)) (EmptyCell!11514) )
))
(declare-datatypes ((array!64934 0))(
  ( (array!64935 (arr!31269 (Array (_ BitVec 32) (_ BitVec 64))) (size!31786 (_ BitVec 32))) )
))
(declare-datatypes ((array!64936 0))(
  ( (array!64937 (arr!31270 (Array (_ BitVec 32) ValueCell!11514)) (size!31787 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5622 0))(
  ( (LongMapFixedSize!5623 (defaultEntry!6185 Int) (mask!29999 (_ BitVec 32)) (extraKeys!5917 (_ BitVec 32)) (zeroValue!6021 V!37453) (minValue!6021 V!37453) (_size!2866 (_ BitVec 32)) (_keys!11358 array!64934) (_values!6208 array!64936) (_vacant!2866 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5622)

(declare-fun valid!2128 (LongMapFixedSize!5622) Bool)

(assert (=> start!90108 (= res!689975 (valid!2128 thiss!1427))))

(assert (=> start!90108 e!583220))

(declare-fun e!583219 () Bool)

(assert (=> start!90108 e!583219))

(assert (=> start!90108 true))

(declare-fun b!1032264 () Bool)

(declare-fun e!583221 () Bool)

(declare-fun tp_is_empty!24435 () Bool)

(assert (=> b!1032264 (= e!583221 tp_is_empty!24435)))

(declare-fun mapIsEmpty!38106 () Bool)

(declare-fun mapRes!38106 () Bool)

(assert (=> mapIsEmpty!38106 mapRes!38106))

(declare-fun b!1032265 () Bool)

(assert (=> b!1032265 (= e!583220 false)))

(declare-datatypes ((SeekEntryResult!9727 0))(
  ( (MissingZero!9727 (index!41279 (_ BitVec 32))) (Found!9727 (index!41280 (_ BitVec 32))) (Intermediate!9727 (undefined!10539 Bool) (index!41281 (_ BitVec 32)) (x!91975 (_ BitVec 32))) (Undefined!9727) (MissingVacant!9727 (index!41282 (_ BitVec 32))) )
))
(declare-fun lt!456017 () SeekEntryResult!9727)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64934 (_ BitVec 32)) SeekEntryResult!9727)

(assert (=> b!1032265 (= lt!456017 (seekEntry!0 key!909 (_keys!11358 thiss!1427) (mask!29999 thiss!1427)))))

(declare-fun mapNonEmpty!38106 () Bool)

(declare-fun tp!73216 () Bool)

(assert (=> mapNonEmpty!38106 (= mapRes!38106 (and tp!73216 e!583221))))

(declare-fun mapValue!38106 () ValueCell!11514)

(declare-fun mapKey!38106 () (_ BitVec 32))

(declare-fun mapRest!38106 () (Array (_ BitVec 32) ValueCell!11514))

(assert (=> mapNonEmpty!38106 (= (arr!31270 (_values!6208 thiss!1427)) (store mapRest!38106 mapKey!38106 mapValue!38106))))

(declare-fun b!1032266 () Bool)

(declare-fun e!583217 () Bool)

(declare-fun e!583216 () Bool)

(assert (=> b!1032266 (= e!583217 (and e!583216 mapRes!38106))))

(declare-fun condMapEmpty!38106 () Bool)

(declare-fun mapDefault!38106 () ValueCell!11514)

(assert (=> b!1032266 (= condMapEmpty!38106 (= (arr!31270 (_values!6208 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11514)) mapDefault!38106)))))

(declare-fun b!1032267 () Bool)

(declare-fun res!689974 () Bool)

(assert (=> b!1032267 (=> (not res!689974) (not e!583220))))

(assert (=> b!1032267 (= res!689974 (not (= key!909 (bvneg key!909))))))

(declare-fun array_inv!24203 (array!64934) Bool)

(declare-fun array_inv!24204 (array!64936) Bool)

(assert (=> b!1032268 (= e!583219 (and tp!73215 tp_is_empty!24435 (array_inv!24203 (_keys!11358 thiss!1427)) (array_inv!24204 (_values!6208 thiss!1427)) e!583217))))

(declare-fun b!1032269 () Bool)

(assert (=> b!1032269 (= e!583216 tp_is_empty!24435)))

(assert (= (and start!90108 res!689975) b!1032267))

(assert (= (and b!1032267 res!689974) b!1032265))

(assert (= (and b!1032266 condMapEmpty!38106) mapIsEmpty!38106))

(assert (= (and b!1032266 (not condMapEmpty!38106)) mapNonEmpty!38106))

(get-info :version)

(assert (= (and mapNonEmpty!38106 ((_ is ValueCellFull!11514) mapValue!38106)) b!1032264))

(assert (= (and b!1032266 ((_ is ValueCellFull!11514) mapDefault!38106)) b!1032269))

(assert (= b!1032268 b!1032266))

(assert (= start!90108 b!1032268))

(declare-fun m!952627 () Bool)

(assert (=> start!90108 m!952627))

(declare-fun m!952629 () Bool)

(assert (=> b!1032265 m!952629))

(declare-fun m!952631 () Bool)

(assert (=> mapNonEmpty!38106 m!952631))

(declare-fun m!952633 () Bool)

(assert (=> b!1032268 m!952633))

(declare-fun m!952635 () Bool)

(assert (=> b!1032268 m!952635))

(check-sat (not b!1032268) (not b!1032265) (not start!90108) (not b_next!20715) b_and!33183 (not mapNonEmpty!38106) tp_is_empty!24435)
(check-sat b_and!33183 (not b_next!20715))
