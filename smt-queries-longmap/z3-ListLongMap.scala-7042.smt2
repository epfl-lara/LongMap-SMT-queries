; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89266 () Bool)

(assert start!89266)

(declare-fun b!1023600 () Bool)

(declare-fun b_free!20307 () Bool)

(declare-fun b_next!20307 () Bool)

(assert (=> b!1023600 (= b_free!20307 (not b_next!20307))))

(declare-fun tp!71956 () Bool)

(declare-fun b_and!32529 () Bool)

(assert (=> b!1023600 (= tp!71956 b_and!32529)))

(declare-fun mapNonEmpty!37458 () Bool)

(declare-fun mapRes!37458 () Bool)

(declare-fun tp!71955 () Bool)

(declare-fun e!576796 () Bool)

(assert (=> mapNonEmpty!37458 (= mapRes!37458 (and tp!71955 e!576796))))

(declare-datatypes ((V!36909 0))(
  ( (V!36910 (val!12064 Int)) )
))
(declare-datatypes ((ValueCell!11310 0))(
  ( (ValueCellFull!11310 (v!14633 V!36909)) (EmptyCell!11310) )
))
(declare-fun mapValue!37458 () ValueCell!11310)

(declare-datatypes ((array!64098 0))(
  ( (array!64099 (arr!30861 (Array (_ BitVec 32) (_ BitVec 64))) (size!31372 (_ BitVec 32))) )
))
(declare-datatypes ((array!64100 0))(
  ( (array!64101 (arr!30862 (Array (_ BitVec 32) ValueCell!11310)) (size!31373 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5214 0))(
  ( (LongMapFixedSize!5215 (defaultEntry!5959 Int) (mask!29584 (_ BitVec 32)) (extraKeys!5691 (_ BitVec 32)) (zeroValue!5795 V!36909) (minValue!5795 V!36909) (_size!2662 (_ BitVec 32)) (_keys!11104 array!64098) (_values!5982 array!64100) (_vacant!2662 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5214)

(declare-fun mapRest!37458 () (Array (_ BitVec 32) ValueCell!11310))

(declare-fun mapKey!37458 () (_ BitVec 32))

(assert (=> mapNonEmpty!37458 (= (arr!30862 (_values!5982 thiss!1427)) (store mapRest!37458 mapKey!37458 mapValue!37458))))

(declare-fun b!1023599 () Bool)

(declare-fun res!685523 () Bool)

(declare-fun e!576801 () Bool)

(assert (=> b!1023599 (=> (not res!685523) (not e!576801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023599 (= res!685523 (validMask!0 (mask!29584 thiss!1427)))))

(declare-fun mapIsEmpty!37458 () Bool)

(assert (=> mapIsEmpty!37458 mapRes!37458))

(declare-fun e!576798 () Bool)

(declare-fun tp_is_empty!24027 () Bool)

(declare-fun e!576799 () Bool)

(declare-fun array_inv!23911 (array!64098) Bool)

(declare-fun array_inv!23912 (array!64100) Bool)

(assert (=> b!1023600 (= e!576798 (and tp!71956 tp_is_empty!24027 (array_inv!23911 (_keys!11104 thiss!1427)) (array_inv!23912 (_values!5982 thiss!1427)) e!576799))))

(declare-fun b!1023601 () Bool)

(declare-fun res!685519 () Bool)

(assert (=> b!1023601 (=> (not res!685519) (not e!576801))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023601 (= res!685519 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023602 () Bool)

(assert (=> b!1023602 (= e!576796 tp_is_empty!24027)))

(declare-fun res!685521 () Bool)

(assert (=> start!89266 (=> (not res!685521) (not e!576801))))

(declare-fun valid!1986 (LongMapFixedSize!5214) Bool)

(assert (=> start!89266 (= res!685521 (valid!1986 thiss!1427))))

(assert (=> start!89266 e!576801))

(assert (=> start!89266 e!576798))

(assert (=> start!89266 true))

(declare-fun b!1023603 () Bool)

(assert (=> b!1023603 (= e!576801 false)))

(declare-fun lt!450426 () Bool)

(declare-datatypes ((List!21717 0))(
  ( (Nil!21714) (Cons!21713 (h!22911 (_ BitVec 64)) (t!30755 List!21717)) )
))
(declare-fun arrayNoDuplicates!0 (array!64098 (_ BitVec 32) List!21717) Bool)

(assert (=> b!1023603 (= lt!450426 (arrayNoDuplicates!0 (_keys!11104 thiss!1427) #b00000000000000000000000000000000 Nil!21714))))

(declare-fun b!1023604 () Bool)

(declare-fun e!576800 () Bool)

(assert (=> b!1023604 (= e!576800 tp_is_empty!24027)))

(declare-fun b!1023605 () Bool)

(declare-fun res!685520 () Bool)

(assert (=> b!1023605 (=> (not res!685520) (not e!576801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64098 (_ BitVec 32)) Bool)

(assert (=> b!1023605 (= res!685520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11104 thiss!1427) (mask!29584 thiss!1427)))))

(declare-fun b!1023606 () Bool)

(assert (=> b!1023606 (= e!576799 (and e!576800 mapRes!37458))))

(declare-fun condMapEmpty!37458 () Bool)

(declare-fun mapDefault!37458 () ValueCell!11310)

(assert (=> b!1023606 (= condMapEmpty!37458 (= (arr!30862 (_values!5982 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11310)) mapDefault!37458)))))

(declare-fun b!1023607 () Bool)

(declare-fun res!685522 () Bool)

(assert (=> b!1023607 (=> (not res!685522) (not e!576801))))

(assert (=> b!1023607 (= res!685522 (and (= (size!31373 (_values!5982 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29584 thiss!1427))) (= (size!31372 (_keys!11104 thiss!1427)) (size!31373 (_values!5982 thiss!1427))) (bvsge (mask!29584 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5691 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5691 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5691 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5691 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5691 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5691 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5691 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!89266 res!685521) b!1023601))

(assert (= (and b!1023601 res!685519) b!1023599))

(assert (= (and b!1023599 res!685523) b!1023607))

(assert (= (and b!1023607 res!685522) b!1023605))

(assert (= (and b!1023605 res!685520) b!1023603))

(assert (= (and b!1023606 condMapEmpty!37458) mapIsEmpty!37458))

(assert (= (and b!1023606 (not condMapEmpty!37458)) mapNonEmpty!37458))

(get-info :version)

(assert (= (and mapNonEmpty!37458 ((_ is ValueCellFull!11310) mapValue!37458)) b!1023602))

(assert (= (and b!1023606 ((_ is ValueCellFull!11310) mapDefault!37458)) b!1023604))

(assert (= b!1023600 b!1023606))

(assert (= start!89266 b!1023600))

(declare-fun m!942205 () Bool)

(assert (=> b!1023605 m!942205))

(declare-fun m!942207 () Bool)

(assert (=> b!1023600 m!942207))

(declare-fun m!942209 () Bool)

(assert (=> b!1023600 m!942209))

(declare-fun m!942211 () Bool)

(assert (=> b!1023603 m!942211))

(declare-fun m!942213 () Bool)

(assert (=> start!89266 m!942213))

(declare-fun m!942215 () Bool)

(assert (=> mapNonEmpty!37458 m!942215))

(declare-fun m!942217 () Bool)

(assert (=> b!1023599 m!942217))

(check-sat b_and!32529 (not b!1023599) (not b!1023603) (not b!1023600) (not b!1023605) tp_is_empty!24027 (not mapNonEmpty!37458) (not start!89266) (not b_next!20307))
(check-sat b_and!32529 (not b_next!20307))
