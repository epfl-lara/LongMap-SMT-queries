; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90246 () Bool)

(assert start!90246)

(declare-fun b!1033004 () Bool)

(declare-fun b_free!20767 () Bool)

(declare-fun b_next!20767 () Bool)

(assert (=> b!1033004 (= b_free!20767 (not b_next!20767))))

(declare-fun tp!73395 () Bool)

(declare-fun b_and!33209 () Bool)

(assert (=> b!1033004 (= tp!73395 b_and!33209)))

(declare-fun e!583808 () Bool)

(declare-fun tp_is_empty!24487 () Bool)

(declare-datatypes ((V!37523 0))(
  ( (V!37524 (val!12294 Int)) )
))
(declare-datatypes ((ValueCell!11540 0))(
  ( (ValueCellFull!11540 (v!14870 V!37523)) (EmptyCell!11540) )
))
(declare-datatypes ((array!64989 0))(
  ( (array!64990 (arr!31290 (Array (_ BitVec 32) (_ BitVec 64))) (size!31814 (_ BitVec 32))) )
))
(declare-datatypes ((array!64991 0))(
  ( (array!64992 (arr!31291 (Array (_ BitVec 32) ValueCell!11540)) (size!31815 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5674 0))(
  ( (LongMapFixedSize!5675 (defaultEntry!6211 Int) (mask!30049 (_ BitVec 32)) (extraKeys!5943 (_ BitVec 32)) (zeroValue!6047 V!37523) (minValue!6047 V!37523) (_size!2892 (_ BitVec 32)) (_keys!11385 array!64989) (_values!6234 array!64991) (_vacant!2892 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5674)

(declare-fun e!583807 () Bool)

(declare-fun array_inv!24213 (array!64989) Bool)

(declare-fun array_inv!24214 (array!64991) Bool)

(assert (=> b!1033004 (= e!583808 (and tp!73395 tp_is_empty!24487 (array_inv!24213 (_keys!11385 thiss!1427)) (array_inv!24214 (_values!6234 thiss!1427)) e!583807))))

(declare-fun res!690308 () Bool)

(declare-fun e!583812 () Bool)

(assert (=> start!90246 (=> (not res!690308) (not e!583812))))

(declare-fun valid!2135 (LongMapFixedSize!5674) Bool)

(assert (=> start!90246 (= res!690308 (valid!2135 thiss!1427))))

(assert (=> start!90246 e!583812))

(assert (=> start!90246 e!583808))

(assert (=> start!90246 true))

(declare-fun b!1033005 () Bool)

(declare-fun e!583810 () Bool)

(assert (=> b!1033005 (= e!583810 tp_is_empty!24487)))

(declare-fun b!1033006 () Bool)

(declare-fun e!583809 () Bool)

(declare-fun mapRes!38207 () Bool)

(assert (=> b!1033006 (= e!583807 (and e!583809 mapRes!38207))))

(declare-fun condMapEmpty!38207 () Bool)

(declare-fun mapDefault!38207 () ValueCell!11540)

(assert (=> b!1033006 (= condMapEmpty!38207 (= (arr!31291 (_values!6234 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11540)) mapDefault!38207)))))

(declare-fun b!1033007 () Bool)

(assert (=> b!1033007 (= e!583809 tp_is_empty!24487)))

(declare-fun b!1033008 () Bool)

(declare-fun res!690310 () Bool)

(assert (=> b!1033008 (=> (not res!690310) (not e!583812))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033008 (= res!690310 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38207 () Bool)

(assert (=> mapIsEmpty!38207 mapRes!38207))

(declare-fun mapNonEmpty!38207 () Bool)

(declare-fun tp!73394 () Bool)

(assert (=> mapNonEmpty!38207 (= mapRes!38207 (and tp!73394 e!583810))))

(declare-fun mapRest!38207 () (Array (_ BitVec 32) ValueCell!11540))

(declare-fun mapKey!38207 () (_ BitVec 32))

(declare-fun mapValue!38207 () ValueCell!11540)

(assert (=> mapNonEmpty!38207 (= (arr!31291 (_values!6234 thiss!1427)) (store mapRest!38207 mapKey!38207 mapValue!38207))))

(declare-fun b!1033009 () Bool)

(declare-fun res!690309 () Bool)

(assert (=> b!1033009 (=> (not res!690309) (not e!583812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033009 (= res!690309 (validMask!0 (mask!30049 thiss!1427)))))

(declare-fun b!1033010 () Bool)

(assert (=> b!1033010 (= e!583812 (and (= (size!31815 (_values!6234 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30049 thiss!1427))) (= (size!31814 (_keys!11385 thiss!1427)) (size!31815 (_values!6234 thiss!1427))) (bvsge (mask!30049 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5943 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5943 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5943 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5943 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011)))))

(assert (= (and start!90246 res!690308) b!1033008))

(assert (= (and b!1033008 res!690310) b!1033009))

(assert (= (and b!1033009 res!690309) b!1033010))

(assert (= (and b!1033006 condMapEmpty!38207) mapIsEmpty!38207))

(assert (= (and b!1033006 (not condMapEmpty!38207)) mapNonEmpty!38207))

(get-info :version)

(assert (= (and mapNonEmpty!38207 ((_ is ValueCellFull!11540) mapValue!38207)) b!1033005))

(assert (= (and b!1033006 ((_ is ValueCellFull!11540) mapDefault!38207)) b!1033007))

(assert (= b!1033004 b!1033006))

(assert (= start!90246 b!1033004))

(declare-fun m!952437 () Bool)

(assert (=> b!1033004 m!952437))

(declare-fun m!952439 () Bool)

(assert (=> b!1033004 m!952439))

(declare-fun m!952441 () Bool)

(assert (=> start!90246 m!952441))

(declare-fun m!952443 () Bool)

(assert (=> mapNonEmpty!38207 m!952443))

(declare-fun m!952445 () Bool)

(assert (=> b!1033009 m!952445))

(check-sat (not b!1033004) (not start!90246) b_and!33209 tp_is_empty!24487 (not b!1033009) (not mapNonEmpty!38207) (not b_next!20767))
(check-sat b_and!33209 (not b_next!20767))
