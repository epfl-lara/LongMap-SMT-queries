; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90114 () Bool)

(assert start!90114)

(declare-fun b!1032321 () Bool)

(declare-fun b_free!20721 () Bool)

(declare-fun b_next!20721 () Bool)

(assert (=> b!1032321 (= b_free!20721 (not b_next!20721))))

(declare-fun tp!73234 () Bool)

(declare-fun b_and!33189 () Bool)

(assert (=> b!1032321 (= tp!73234 b_and!33189)))

(declare-fun mapNonEmpty!38115 () Bool)

(declare-fun mapRes!38115 () Bool)

(declare-fun tp!73233 () Bool)

(declare-fun e!583275 () Bool)

(assert (=> mapNonEmpty!38115 (= mapRes!38115 (and tp!73233 e!583275))))

(declare-datatypes ((V!37461 0))(
  ( (V!37462 (val!12271 Int)) )
))
(declare-datatypes ((ValueCell!11517 0))(
  ( (ValueCellFull!11517 (v!14848 V!37461)) (EmptyCell!11517) )
))
(declare-fun mapRest!38115 () (Array (_ BitVec 32) ValueCell!11517))

(declare-fun mapKey!38115 () (_ BitVec 32))

(declare-fun mapValue!38115 () ValueCell!11517)

(declare-datatypes ((array!64946 0))(
  ( (array!64947 (arr!31275 (Array (_ BitVec 32) (_ BitVec 64))) (size!31792 (_ BitVec 32))) )
))
(declare-datatypes ((array!64948 0))(
  ( (array!64949 (arr!31276 (Array (_ BitVec 32) ValueCell!11517)) (size!31793 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5628 0))(
  ( (LongMapFixedSize!5629 (defaultEntry!6188 Int) (mask!30004 (_ BitVec 32)) (extraKeys!5920 (_ BitVec 32)) (zeroValue!6024 V!37461) (minValue!6024 V!37461) (_size!2869 (_ BitVec 32)) (_keys!11361 array!64946) (_values!6211 array!64948) (_vacant!2869 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5628)

(assert (=> mapNonEmpty!38115 (= (arr!31276 (_values!6211 thiss!1427)) (store mapRest!38115 mapKey!38115 mapValue!38115))))

(declare-fun mapIsEmpty!38115 () Bool)

(assert (=> mapIsEmpty!38115 mapRes!38115))

(declare-fun b!1032318 () Bool)

(declare-fun res!689993 () Bool)

(declare-fun e!583271 () Bool)

(assert (=> b!1032318 (=> (not res!689993) (not e!583271))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032318 (= res!689993 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1032319 () Bool)

(declare-fun e!583274 () Bool)

(declare-fun tp_is_empty!24441 () Bool)

(assert (=> b!1032319 (= e!583274 tp_is_empty!24441)))

(declare-fun b!1032320 () Bool)

(assert (=> b!1032320 (= e!583275 tp_is_empty!24441)))

(declare-fun res!689992 () Bool)

(assert (=> start!90114 (=> (not res!689992) (not e!583271))))

(declare-fun valid!2130 (LongMapFixedSize!5628) Bool)

(assert (=> start!90114 (= res!689992 (valid!2130 thiss!1427))))

(assert (=> start!90114 e!583271))

(declare-fun e!583272 () Bool)

(assert (=> start!90114 e!583272))

(assert (=> start!90114 true))

(declare-fun e!583273 () Bool)

(declare-fun array_inv!24207 (array!64946) Bool)

(declare-fun array_inv!24208 (array!64948) Bool)

(assert (=> b!1032321 (= e!583272 (and tp!73234 tp_is_empty!24441 (array_inv!24207 (_keys!11361 thiss!1427)) (array_inv!24208 (_values!6211 thiss!1427)) e!583273))))

(declare-fun b!1032322 () Bool)

(assert (=> b!1032322 (= e!583273 (and e!583274 mapRes!38115))))

(declare-fun condMapEmpty!38115 () Bool)

(declare-fun mapDefault!38115 () ValueCell!11517)

(assert (=> b!1032322 (= condMapEmpty!38115 (= (arr!31276 (_values!6211 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11517)) mapDefault!38115)))))

(declare-fun b!1032323 () Bool)

(assert (=> b!1032323 (= e!583271 false)))

(declare-datatypes ((SeekEntryResult!9730 0))(
  ( (MissingZero!9730 (index!41291 (_ BitVec 32))) (Found!9730 (index!41292 (_ BitVec 32))) (Intermediate!9730 (undefined!10542 Bool) (index!41293 (_ BitVec 32)) (x!91986 (_ BitVec 32))) (Undefined!9730) (MissingVacant!9730 (index!41294 (_ BitVec 32))) )
))
(declare-fun lt!456026 () SeekEntryResult!9730)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64946 (_ BitVec 32)) SeekEntryResult!9730)

(assert (=> b!1032323 (= lt!456026 (seekEntry!0 key!909 (_keys!11361 thiss!1427) (mask!30004 thiss!1427)))))

(assert (= (and start!90114 res!689992) b!1032318))

(assert (= (and b!1032318 res!689993) b!1032323))

(assert (= (and b!1032322 condMapEmpty!38115) mapIsEmpty!38115))

(assert (= (and b!1032322 (not condMapEmpty!38115)) mapNonEmpty!38115))

(get-info :version)

(assert (= (and mapNonEmpty!38115 ((_ is ValueCellFull!11517) mapValue!38115)) b!1032320))

(assert (= (and b!1032322 ((_ is ValueCellFull!11517) mapDefault!38115)) b!1032319))

(assert (= b!1032321 b!1032322))

(assert (= start!90114 b!1032321))

(declare-fun m!952657 () Bool)

(assert (=> mapNonEmpty!38115 m!952657))

(declare-fun m!952659 () Bool)

(assert (=> start!90114 m!952659))

(declare-fun m!952661 () Bool)

(assert (=> b!1032321 m!952661))

(declare-fun m!952663 () Bool)

(assert (=> b!1032321 m!952663))

(declare-fun m!952665 () Bool)

(assert (=> b!1032323 m!952665))

(check-sat b_and!33189 (not mapNonEmpty!38115) (not b_next!20721) tp_is_empty!24441 (not start!90114) (not b!1032323) (not b!1032321))
(check-sat b_and!33189 (not b_next!20721))
