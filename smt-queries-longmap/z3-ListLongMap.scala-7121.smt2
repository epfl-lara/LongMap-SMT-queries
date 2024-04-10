; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90262 () Bool)

(assert start!90262)

(declare-fun b!1033305 () Bool)

(declare-fun b_free!20781 () Bool)

(declare-fun b_next!20781 () Bool)

(assert (=> b!1033305 (= b_free!20781 (not b_next!20781))))

(declare-fun tp!73436 () Bool)

(declare-fun b_and!33249 () Bool)

(assert (=> b!1033305 (= tp!73436 b_and!33249)))

(declare-fun mapNonEmpty!38228 () Bool)

(declare-fun mapRes!38228 () Bool)

(declare-fun tp!73437 () Bool)

(declare-fun e!584029 () Bool)

(assert (=> mapNonEmpty!38228 (= mapRes!38228 (and tp!73437 e!584029))))

(declare-fun mapKey!38228 () (_ BitVec 32))

(declare-datatypes ((V!37541 0))(
  ( (V!37542 (val!12301 Int)) )
))
(declare-datatypes ((ValueCell!11547 0))(
  ( (ValueCellFull!11547 (v!14878 V!37541)) (EmptyCell!11547) )
))
(declare-datatypes ((array!65078 0))(
  ( (array!65079 (arr!31335 (Array (_ BitVec 32) (_ BitVec 64))) (size!31857 (_ BitVec 32))) )
))
(declare-datatypes ((array!65080 0))(
  ( (array!65081 (arr!31336 (Array (_ BitVec 32) ValueCell!11547)) (size!31858 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5688 0))(
  ( (LongMapFixedSize!5689 (defaultEntry!6218 Int) (mask!30065 (_ BitVec 32)) (extraKeys!5950 (_ BitVec 32)) (zeroValue!6054 V!37541) (minValue!6054 V!37541) (_size!2899 (_ BitVec 32)) (_keys!11396 array!65078) (_values!6241 array!65080) (_vacant!2899 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5688)

(declare-fun mapRest!38228 () (Array (_ BitVec 32) ValueCell!11547))

(declare-fun mapValue!38228 () ValueCell!11547)

(assert (=> mapNonEmpty!38228 (= (arr!31336 (_values!6241 thiss!1427)) (store mapRest!38228 mapKey!38228 mapValue!38228))))

(declare-fun b!1033302 () Bool)

(declare-fun res!690440 () Bool)

(declare-fun e!584024 () Bool)

(assert (=> b!1033302 (=> (not res!690440) (not e!584024))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033302 (= res!690440 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!690439 () Bool)

(assert (=> start!90262 (=> (not res!690439) (not e!584024))))

(declare-fun valid!2149 (LongMapFixedSize!5688) Bool)

(assert (=> start!90262 (= res!690439 (valid!2149 thiss!1427))))

(assert (=> start!90262 e!584024))

(declare-fun e!584025 () Bool)

(assert (=> start!90262 e!584025))

(assert (=> start!90262 true))

(declare-fun b!1033303 () Bool)

(declare-fun res!690438 () Bool)

(assert (=> b!1033303 (=> (not res!690438) (not e!584024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033303 (= res!690438 (validMask!0 (mask!30065 thiss!1427)))))

(declare-fun b!1033304 () Bool)

(assert (=> b!1033304 (= e!584024 (and (= (size!31858 (_values!6241 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30065 thiss!1427))) (= (size!31857 (_keys!11396 thiss!1427)) (size!31858 (_values!6241 thiss!1427))) (bvsge (mask!30065 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5950 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5950 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5950 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5950 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5950 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5950 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (not (= (bvand (bvand (extraKeys!5950 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!38228 () Bool)

(assert (=> mapIsEmpty!38228 mapRes!38228))

(declare-fun e!584026 () Bool)

(declare-fun tp_is_empty!24501 () Bool)

(declare-fun array_inv!24245 (array!65078) Bool)

(declare-fun array_inv!24246 (array!65080) Bool)

(assert (=> b!1033305 (= e!584025 (and tp!73436 tp_is_empty!24501 (array_inv!24245 (_keys!11396 thiss!1427)) (array_inv!24246 (_values!6241 thiss!1427)) e!584026))))

(declare-fun b!1033306 () Bool)

(declare-fun e!584027 () Bool)

(assert (=> b!1033306 (= e!584027 tp_is_empty!24501)))

(declare-fun b!1033307 () Bool)

(assert (=> b!1033307 (= e!584026 (and e!584027 mapRes!38228))))

(declare-fun condMapEmpty!38228 () Bool)

(declare-fun mapDefault!38228 () ValueCell!11547)

(assert (=> b!1033307 (= condMapEmpty!38228 (= (arr!31336 (_values!6241 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11547)) mapDefault!38228)))))

(declare-fun b!1033308 () Bool)

(assert (=> b!1033308 (= e!584029 tp_is_empty!24501)))

(assert (= (and start!90262 res!690439) b!1033302))

(assert (= (and b!1033302 res!690440) b!1033303))

(assert (= (and b!1033303 res!690438) b!1033304))

(assert (= (and b!1033307 condMapEmpty!38228) mapIsEmpty!38228))

(assert (= (and b!1033307 (not condMapEmpty!38228)) mapNonEmpty!38228))

(get-info :version)

(assert (= (and mapNonEmpty!38228 ((_ is ValueCellFull!11547) mapValue!38228)) b!1033308))

(assert (= (and b!1033307 ((_ is ValueCellFull!11547) mapDefault!38228)) b!1033306))

(assert (= b!1033305 b!1033307))

(assert (= start!90262 b!1033305))

(declare-fun m!953127 () Bool)

(assert (=> mapNonEmpty!38228 m!953127))

(declare-fun m!953129 () Bool)

(assert (=> start!90262 m!953129))

(declare-fun m!953131 () Bool)

(assert (=> b!1033303 m!953131))

(declare-fun m!953133 () Bool)

(assert (=> b!1033305 m!953133))

(declare-fun m!953135 () Bool)

(assert (=> b!1033305 m!953135))

(check-sat (not mapNonEmpty!38228) (not b_next!20781) (not b!1033305) (not start!90262) (not b!1033303) b_and!33249 tp_is_empty!24501)
(check-sat b_and!33249 (not b_next!20781))
