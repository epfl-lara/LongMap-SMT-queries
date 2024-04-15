; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89250 () Bool)

(assert start!89250)

(declare-fun b!1023264 () Bool)

(declare-fun b_free!20293 () Bool)

(declare-fun b_next!20293 () Bool)

(assert (=> b!1023264 (= b_free!20293 (not b_next!20293))))

(declare-fun tp!71913 () Bool)

(declare-fun b_and!32489 () Bool)

(assert (=> b!1023264 (= tp!71913 b_and!32489)))

(declare-fun mapNonEmpty!37437 () Bool)

(declare-fun mapRes!37437 () Bool)

(declare-fun tp!71914 () Bool)

(declare-fun e!576583 () Bool)

(assert (=> mapNonEmpty!37437 (= mapRes!37437 (and tp!71914 e!576583))))

(declare-datatypes ((V!36891 0))(
  ( (V!36892 (val!12057 Int)) )
))
(declare-datatypes ((ValueCell!11303 0))(
  ( (ValueCellFull!11303 (v!14625 V!36891)) (EmptyCell!11303) )
))
(declare-fun mapValue!37437 () ValueCell!11303)

(declare-datatypes ((array!64009 0))(
  ( (array!64010 (arr!30816 (Array (_ BitVec 32) (_ BitVec 64))) (size!31329 (_ BitVec 32))) )
))
(declare-datatypes ((array!64011 0))(
  ( (array!64012 (arr!30817 (Array (_ BitVec 32) ValueCell!11303)) (size!31330 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5200 0))(
  ( (LongMapFixedSize!5201 (defaultEntry!5952 Int) (mask!29568 (_ BitVec 32)) (extraKeys!5684 (_ BitVec 32)) (zeroValue!5788 V!36891) (minValue!5788 V!36891) (_size!2655 (_ BitVec 32)) (_keys!11093 array!64009) (_values!5975 array!64011) (_vacant!2655 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5200)

(declare-fun mapKey!37437 () (_ BitVec 32))

(declare-fun mapRest!37437 () (Array (_ BitVec 32) ValueCell!11303))

(assert (=> mapNonEmpty!37437 (= (arr!30817 (_values!5975 thiss!1427)) (store mapRest!37437 mapKey!37437 mapValue!37437))))

(declare-fun mapIsEmpty!37437 () Bool)

(assert (=> mapIsEmpty!37437 mapRes!37437))

(declare-fun b!1023259 () Bool)

(declare-fun res!685348 () Bool)

(declare-fun e!576582 () Bool)

(assert (=> b!1023259 (=> (not res!685348) (not e!576582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023259 (= res!685348 (validMask!0 (mask!29568 thiss!1427)))))

(declare-fun res!685349 () Bool)

(assert (=> start!89250 (=> (not res!685349) (not e!576582))))

(declare-fun valid!1977 (LongMapFixedSize!5200) Bool)

(assert (=> start!89250 (= res!685349 (valid!1977 thiss!1427))))

(assert (=> start!89250 e!576582))

(declare-fun e!576579 () Bool)

(assert (=> start!89250 e!576579))

(assert (=> start!89250 true))

(declare-fun b!1023260 () Bool)

(declare-fun e!576581 () Bool)

(declare-fun tp_is_empty!24013 () Bool)

(assert (=> b!1023260 (= e!576581 tp_is_empty!24013)))

(declare-fun b!1023261 () Bool)

(declare-fun res!685350 () Bool)

(assert (=> b!1023261 (=> (not res!685350) (not e!576582))))

(assert (=> b!1023261 (= res!685350 (and (= (size!31330 (_values!5975 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29568 thiss!1427))) (= (size!31329 (_keys!11093 thiss!1427)) (size!31330 (_values!5975 thiss!1427))) (bvsge (mask!29568 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5684 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5684 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5684 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023262 () Bool)

(declare-fun e!576584 () Bool)

(assert (=> b!1023262 (= e!576584 (and e!576581 mapRes!37437))))

(declare-fun condMapEmpty!37437 () Bool)

(declare-fun mapDefault!37437 () ValueCell!11303)

(assert (=> b!1023262 (= condMapEmpty!37437 (= (arr!30817 (_values!5975 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11303)) mapDefault!37437)))))

(declare-fun b!1023263 () Bool)

(assert (=> b!1023263 (= e!576583 tp_is_empty!24013)))

(declare-fun array_inv!23895 (array!64009) Bool)

(declare-fun array_inv!23896 (array!64011) Bool)

(assert (=> b!1023264 (= e!576579 (and tp!71913 tp_is_empty!24013 (array_inv!23895 (_keys!11093 thiss!1427)) (array_inv!23896 (_values!5975 thiss!1427)) e!576584))))

(declare-fun b!1023265 () Bool)

(assert (=> b!1023265 (= e!576582 false)))

(declare-fun lt!450205 () Bool)

(declare-datatypes ((List!21740 0))(
  ( (Nil!21737) (Cons!21736 (h!22934 (_ BitVec 64)) (t!30769 List!21740)) )
))
(declare-fun arrayNoDuplicates!0 (array!64009 (_ BitVec 32) List!21740) Bool)

(assert (=> b!1023265 (= lt!450205 (arrayNoDuplicates!0 (_keys!11093 thiss!1427) #b00000000000000000000000000000000 Nil!21737))))

(declare-fun b!1023266 () Bool)

(declare-fun res!685347 () Bool)

(assert (=> b!1023266 (=> (not res!685347) (not e!576582))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023266 (= res!685347 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023267 () Bool)

(declare-fun res!685351 () Bool)

(assert (=> b!1023267 (=> (not res!685351) (not e!576582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64009 (_ BitVec 32)) Bool)

(assert (=> b!1023267 (= res!685351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11093 thiss!1427) (mask!29568 thiss!1427)))))

(assert (= (and start!89250 res!685349) b!1023266))

(assert (= (and b!1023266 res!685347) b!1023259))

(assert (= (and b!1023259 res!685348) b!1023261))

(assert (= (and b!1023261 res!685350) b!1023267))

(assert (= (and b!1023267 res!685351) b!1023265))

(assert (= (and b!1023262 condMapEmpty!37437) mapIsEmpty!37437))

(assert (= (and b!1023262 (not condMapEmpty!37437)) mapNonEmpty!37437))

(get-info :version)

(assert (= (and mapNonEmpty!37437 ((_ is ValueCellFull!11303) mapValue!37437)) b!1023263))

(assert (= (and b!1023262 ((_ is ValueCellFull!11303) mapDefault!37437)) b!1023260))

(assert (= b!1023264 b!1023262))

(assert (= start!89250 b!1023264))

(declare-fun m!941487 () Bool)

(assert (=> mapNonEmpty!37437 m!941487))

(declare-fun m!941489 () Bool)

(assert (=> b!1023267 m!941489))

(declare-fun m!941491 () Bool)

(assert (=> b!1023259 m!941491))

(declare-fun m!941493 () Bool)

(assert (=> b!1023264 m!941493))

(declare-fun m!941495 () Bool)

(assert (=> b!1023264 m!941495))

(declare-fun m!941497 () Bool)

(assert (=> b!1023265 m!941497))

(declare-fun m!941499 () Bool)

(assert (=> start!89250 m!941499))

(check-sat b_and!32489 (not b!1023265) (not b!1023267) (not start!89250) tp_is_empty!24013 (not b_next!20293) (not b!1023264) (not b!1023259) (not mapNonEmpty!37437))
(check-sat b_and!32489 (not b_next!20293))
