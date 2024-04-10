; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89356 () Bool)

(assert start!89356)

(declare-fun b!1024256 () Bool)

(declare-fun b_free!20355 () Bool)

(declare-fun b_next!20355 () Bool)

(assert (=> b!1024256 (= b_free!20355 (not b_next!20355))))

(declare-fun tp!72110 () Bool)

(declare-fun b_and!32601 () Bool)

(assert (=> b!1024256 (= tp!72110 b_and!32601)))

(declare-fun b!1024251 () Bool)

(declare-fun e!577319 () Bool)

(assert (=> b!1024251 (= e!577319 false)))

(declare-datatypes ((SeekEntryResult!9591 0))(
  ( (MissingZero!9591 (index!40735 (_ BitVec 32))) (Found!9591 (index!40736 (_ BitVec 32))) (Intermediate!9591 (undefined!10403 Bool) (index!40737 (_ BitVec 32)) (x!91061 (_ BitVec 32))) (Undefined!9591) (MissingVacant!9591 (index!40738 (_ BitVec 32))) )
))
(declare-fun lt!450567 () SeekEntryResult!9591)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!36973 0))(
  ( (V!36974 (val!12088 Int)) )
))
(declare-datatypes ((ValueCell!11334 0))(
  ( (ValueCellFull!11334 (v!14657 V!36973)) (EmptyCell!11334) )
))
(declare-datatypes ((array!64200 0))(
  ( (array!64201 (arr!30909 (Array (_ BitVec 32) (_ BitVec 64))) (size!31422 (_ BitVec 32))) )
))
(declare-datatypes ((array!64202 0))(
  ( (array!64203 (arr!30910 (Array (_ BitVec 32) ValueCell!11334)) (size!31423 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5262 0))(
  ( (LongMapFixedSize!5263 (defaultEntry!5983 Int) (mask!29629 (_ BitVec 32)) (extraKeys!5715 (_ BitVec 32)) (zeroValue!5819 V!36973) (minValue!5819 V!36973) (_size!2686 (_ BitVec 32)) (_keys!11130 array!64200) (_values!6006 array!64202) (_vacant!2686 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5262)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64200 (_ BitVec 32)) SeekEntryResult!9591)

(assert (=> b!1024251 (= lt!450567 (seekEntry!0 key!909 (_keys!11130 thiss!1427) (mask!29629 thiss!1427)))))

(declare-fun mapIsEmpty!37541 () Bool)

(declare-fun mapRes!37541 () Bool)

(assert (=> mapIsEmpty!37541 mapRes!37541))

(declare-fun res!685784 () Bool)

(assert (=> start!89356 (=> (not res!685784) (not e!577319))))

(declare-fun valid!2004 (LongMapFixedSize!5262) Bool)

(assert (=> start!89356 (= res!685784 (valid!2004 thiss!1427))))

(assert (=> start!89356 e!577319))

(declare-fun e!577322 () Bool)

(assert (=> start!89356 e!577322))

(assert (=> start!89356 true))

(declare-fun mapNonEmpty!37541 () Bool)

(declare-fun tp!72111 () Bool)

(declare-fun e!577324 () Bool)

(assert (=> mapNonEmpty!37541 (= mapRes!37541 (and tp!72111 e!577324))))

(declare-fun mapRest!37541 () (Array (_ BitVec 32) ValueCell!11334))

(declare-fun mapValue!37541 () ValueCell!11334)

(declare-fun mapKey!37541 () (_ BitVec 32))

(assert (=> mapNonEmpty!37541 (= (arr!30910 (_values!6006 thiss!1427)) (store mapRest!37541 mapKey!37541 mapValue!37541))))

(declare-fun b!1024252 () Bool)

(declare-fun res!685783 () Bool)

(assert (=> b!1024252 (=> (not res!685783) (not e!577319))))

(assert (=> b!1024252 (= res!685783 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024253 () Bool)

(declare-fun e!577321 () Bool)

(declare-fun e!577323 () Bool)

(assert (=> b!1024253 (= e!577321 (and e!577323 mapRes!37541))))

(declare-fun condMapEmpty!37541 () Bool)

(declare-fun mapDefault!37541 () ValueCell!11334)

(assert (=> b!1024253 (= condMapEmpty!37541 (= (arr!30910 (_values!6006 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11334)) mapDefault!37541)))))

(declare-fun b!1024254 () Bool)

(declare-fun tp_is_empty!24075 () Bool)

(assert (=> b!1024254 (= e!577323 tp_is_empty!24075)))

(declare-fun b!1024255 () Bool)

(assert (=> b!1024255 (= e!577324 tp_is_empty!24075)))

(declare-fun array_inv!23947 (array!64200) Bool)

(declare-fun array_inv!23948 (array!64202) Bool)

(assert (=> b!1024256 (= e!577322 (and tp!72110 tp_is_empty!24075 (array_inv!23947 (_keys!11130 thiss!1427)) (array_inv!23948 (_values!6006 thiss!1427)) e!577321))))

(assert (= (and start!89356 res!685784) b!1024252))

(assert (= (and b!1024252 res!685783) b!1024251))

(assert (= (and b!1024253 condMapEmpty!37541) mapIsEmpty!37541))

(assert (= (and b!1024253 (not condMapEmpty!37541)) mapNonEmpty!37541))

(get-info :version)

(assert (= (and mapNonEmpty!37541 ((_ is ValueCellFull!11334) mapValue!37541)) b!1024255))

(assert (= (and b!1024253 ((_ is ValueCellFull!11334) mapDefault!37541)) b!1024254))

(assert (= b!1024256 b!1024253))

(assert (= start!89356 b!1024256))

(declare-fun m!942653 () Bool)

(assert (=> b!1024251 m!942653))

(declare-fun m!942655 () Bool)

(assert (=> start!89356 m!942655))

(declare-fun m!942657 () Bool)

(assert (=> mapNonEmpty!37541 m!942657))

(declare-fun m!942659 () Bool)

(assert (=> b!1024256 m!942659))

(declare-fun m!942661 () Bool)

(assert (=> b!1024256 m!942661))

(check-sat tp_is_empty!24075 (not b!1024256) (not mapNonEmpty!37541) (not start!89356) b_and!32601 (not b!1024251) (not b_next!20355))
(check-sat b_and!32601 (not b_next!20355))
