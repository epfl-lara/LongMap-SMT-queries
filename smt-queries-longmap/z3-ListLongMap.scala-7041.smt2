; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89256 () Bool)

(assert start!89256)

(declare-fun b!1023344 () Bool)

(declare-fun b_free!20299 () Bool)

(declare-fun b_next!20299 () Bool)

(assert (=> b!1023344 (= b_free!20299 (not b_next!20299))))

(declare-fun tp!71932 () Bool)

(declare-fun b_and!32495 () Bool)

(assert (=> b!1023344 (= tp!71932 b_and!32495)))

(declare-fun b!1023340 () Bool)

(declare-fun e!576637 () Bool)

(declare-fun tp_is_empty!24019 () Bool)

(assert (=> b!1023340 (= e!576637 tp_is_empty!24019)))

(declare-fun b!1023341 () Bool)

(declare-fun res!685393 () Bool)

(declare-fun e!576634 () Bool)

(assert (=> b!1023341 (=> (not res!685393) (not e!576634))))

(declare-datatypes ((V!36899 0))(
  ( (V!36900 (val!12060 Int)) )
))
(declare-datatypes ((ValueCell!11306 0))(
  ( (ValueCellFull!11306 (v!14628 V!36899)) (EmptyCell!11306) )
))
(declare-datatypes ((array!64021 0))(
  ( (array!64022 (arr!30822 (Array (_ BitVec 32) (_ BitVec 64))) (size!31335 (_ BitVec 32))) )
))
(declare-datatypes ((array!64023 0))(
  ( (array!64024 (arr!30823 (Array (_ BitVec 32) ValueCell!11306)) (size!31336 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5206 0))(
  ( (LongMapFixedSize!5207 (defaultEntry!5955 Int) (mask!29573 (_ BitVec 32)) (extraKeys!5687 (_ BitVec 32)) (zeroValue!5791 V!36899) (minValue!5791 V!36899) (_size!2658 (_ BitVec 32)) (_keys!11096 array!64021) (_values!5978 array!64023) (_vacant!2658 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5206)

(assert (=> b!1023341 (= res!685393 (and (= (size!31336 (_values!5978 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29573 thiss!1427))) (= (size!31335 (_keys!11096 thiss!1427)) (size!31336 (_values!5978 thiss!1427))) (bvsge (mask!29573 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5687 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5687 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5687 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023342 () Bool)

(declare-fun e!576635 () Bool)

(declare-fun mapRes!37446 () Bool)

(assert (=> b!1023342 (= e!576635 (and e!576637 mapRes!37446))))

(declare-fun condMapEmpty!37446 () Bool)

(declare-fun mapDefault!37446 () ValueCell!11306)

(assert (=> b!1023342 (= condMapEmpty!37446 (= (arr!30823 (_values!5978 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11306)) mapDefault!37446)))))

(declare-fun b!1023343 () Bool)

(declare-fun res!685396 () Bool)

(assert (=> b!1023343 (=> (not res!685396) (not e!576634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023343 (= res!685396 (validMask!0 (mask!29573 thiss!1427)))))

(declare-fun mapNonEmpty!37446 () Bool)

(declare-fun tp!71931 () Bool)

(declare-fun e!576636 () Bool)

(assert (=> mapNonEmpty!37446 (= mapRes!37446 (and tp!71931 e!576636))))

(declare-fun mapRest!37446 () (Array (_ BitVec 32) ValueCell!11306))

(declare-fun mapValue!37446 () ValueCell!11306)

(declare-fun mapKey!37446 () (_ BitVec 32))

(assert (=> mapNonEmpty!37446 (= (arr!30823 (_values!5978 thiss!1427)) (store mapRest!37446 mapKey!37446 mapValue!37446))))

(declare-fun res!685395 () Bool)

(assert (=> start!89256 (=> (not res!685395) (not e!576634))))

(declare-fun valid!1980 (LongMapFixedSize!5206) Bool)

(assert (=> start!89256 (= res!685395 (valid!1980 thiss!1427))))

(assert (=> start!89256 e!576634))

(declare-fun e!576633 () Bool)

(assert (=> start!89256 e!576633))

(assert (=> start!89256 true))

(declare-fun array_inv!23899 (array!64021) Bool)

(declare-fun array_inv!23900 (array!64023) Bool)

(assert (=> b!1023344 (= e!576633 (and tp!71932 tp_is_empty!24019 (array_inv!23899 (_keys!11096 thiss!1427)) (array_inv!23900 (_values!5978 thiss!1427)) e!576635))))

(declare-fun b!1023345 () Bool)

(assert (=> b!1023345 (= e!576636 tp_is_empty!24019)))

(declare-fun b!1023346 () Bool)

(declare-fun res!685394 () Bool)

(assert (=> b!1023346 (=> (not res!685394) (not e!576634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64021 (_ BitVec 32)) Bool)

(assert (=> b!1023346 (= res!685394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11096 thiss!1427) (mask!29573 thiss!1427)))))

(declare-fun b!1023347 () Bool)

(assert (=> b!1023347 (= e!576634 false)))

(declare-fun lt!450214 () Bool)

(declare-datatypes ((List!21743 0))(
  ( (Nil!21740) (Cons!21739 (h!22937 (_ BitVec 64)) (t!30772 List!21743)) )
))
(declare-fun arrayNoDuplicates!0 (array!64021 (_ BitVec 32) List!21743) Bool)

(assert (=> b!1023347 (= lt!450214 (arrayNoDuplicates!0 (_keys!11096 thiss!1427) #b00000000000000000000000000000000 Nil!21740))))

(declare-fun b!1023348 () Bool)

(declare-fun res!685392 () Bool)

(assert (=> b!1023348 (=> (not res!685392) (not e!576634))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023348 (= res!685392 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!37446 () Bool)

(assert (=> mapIsEmpty!37446 mapRes!37446))

(assert (= (and start!89256 res!685395) b!1023348))

(assert (= (and b!1023348 res!685392) b!1023343))

(assert (= (and b!1023343 res!685396) b!1023341))

(assert (= (and b!1023341 res!685393) b!1023346))

(assert (= (and b!1023346 res!685394) b!1023347))

(assert (= (and b!1023342 condMapEmpty!37446) mapIsEmpty!37446))

(assert (= (and b!1023342 (not condMapEmpty!37446)) mapNonEmpty!37446))

(get-info :version)

(assert (= (and mapNonEmpty!37446 ((_ is ValueCellFull!11306) mapValue!37446)) b!1023345))

(assert (= (and b!1023342 ((_ is ValueCellFull!11306) mapDefault!37446)) b!1023340))

(assert (= b!1023344 b!1023342))

(assert (= start!89256 b!1023344))

(declare-fun m!941529 () Bool)

(assert (=> b!1023343 m!941529))

(declare-fun m!941531 () Bool)

(assert (=> mapNonEmpty!37446 m!941531))

(declare-fun m!941533 () Bool)

(assert (=> b!1023347 m!941533))

(declare-fun m!941535 () Bool)

(assert (=> b!1023346 m!941535))

(declare-fun m!941537 () Bool)

(assert (=> b!1023344 m!941537))

(declare-fun m!941539 () Bool)

(assert (=> b!1023344 m!941539))

(declare-fun m!941541 () Bool)

(assert (=> start!89256 m!941541))

(check-sat tp_is_empty!24019 b_and!32495 (not b!1023346) (not b!1023347) (not start!89256) (not mapNonEmpty!37446) (not b_next!20299) (not b!1023344) (not b!1023343))
(check-sat b_and!32495 (not b_next!20299))
