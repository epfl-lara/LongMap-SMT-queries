; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89244 () Bool)

(assert start!89244)

(declare-fun b!1023184 () Bool)

(declare-fun b_free!20287 () Bool)

(declare-fun b_next!20287 () Bool)

(assert (=> b!1023184 (= b_free!20287 (not b_next!20287))))

(declare-fun tp!71895 () Bool)

(declare-fun b_and!32483 () Bool)

(assert (=> b!1023184 (= tp!71895 b_and!32483)))

(declare-fun b!1023178 () Bool)

(declare-fun e!576525 () Bool)

(declare-fun tp_is_empty!24007 () Bool)

(assert (=> b!1023178 (= e!576525 tp_is_empty!24007)))

(declare-fun b!1023179 () Bool)

(declare-fun res!685304 () Bool)

(declare-fun e!576528 () Bool)

(assert (=> b!1023179 (=> (not res!685304) (not e!576528))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023179 (= res!685304 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023180 () Bool)

(declare-fun e!576526 () Bool)

(declare-fun e!576529 () Bool)

(declare-fun mapRes!37428 () Bool)

(assert (=> b!1023180 (= e!576526 (and e!576529 mapRes!37428))))

(declare-fun condMapEmpty!37428 () Bool)

(declare-datatypes ((V!36883 0))(
  ( (V!36884 (val!12054 Int)) )
))
(declare-datatypes ((ValueCell!11300 0))(
  ( (ValueCellFull!11300 (v!14622 V!36883)) (EmptyCell!11300) )
))
(declare-datatypes ((array!63997 0))(
  ( (array!63998 (arr!30810 (Array (_ BitVec 32) (_ BitVec 64))) (size!31323 (_ BitVec 32))) )
))
(declare-datatypes ((array!63999 0))(
  ( (array!64000 (arr!30811 (Array (_ BitVec 32) ValueCell!11300)) (size!31324 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5194 0))(
  ( (LongMapFixedSize!5195 (defaultEntry!5949 Int) (mask!29563 (_ BitVec 32)) (extraKeys!5681 (_ BitVec 32)) (zeroValue!5785 V!36883) (minValue!5785 V!36883) (_size!2652 (_ BitVec 32)) (_keys!11090 array!63997) (_values!5972 array!63999) (_vacant!2652 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5194)

(declare-fun mapDefault!37428 () ValueCell!11300)

(assert (=> b!1023180 (= condMapEmpty!37428 (= (arr!30811 (_values!5972 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11300)) mapDefault!37428)))))

(declare-fun mapIsEmpty!37428 () Bool)

(assert (=> mapIsEmpty!37428 mapRes!37428))

(declare-fun b!1023181 () Bool)

(declare-fun res!685302 () Bool)

(assert (=> b!1023181 (=> (not res!685302) (not e!576528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023181 (= res!685302 (validMask!0 (mask!29563 thiss!1427)))))

(declare-fun b!1023182 () Bool)

(declare-fun res!685305 () Bool)

(assert (=> b!1023182 (=> (not res!685305) (not e!576528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63997 (_ BitVec 32)) Bool)

(assert (=> b!1023182 (= res!685305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11090 thiss!1427) (mask!29563 thiss!1427)))))

(declare-fun b!1023183 () Bool)

(declare-fun res!685306 () Bool)

(assert (=> b!1023183 (=> (not res!685306) (not e!576528))))

(assert (=> b!1023183 (= res!685306 (and (= (size!31324 (_values!5972 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29563 thiss!1427))) (= (size!31323 (_keys!11090 thiss!1427)) (size!31324 (_values!5972 thiss!1427))) (bvsge (mask!29563 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5681 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5681 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5681 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!576530 () Bool)

(declare-fun array_inv!23891 (array!63997) Bool)

(declare-fun array_inv!23892 (array!63999) Bool)

(assert (=> b!1023184 (= e!576530 (and tp!71895 tp_is_empty!24007 (array_inv!23891 (_keys!11090 thiss!1427)) (array_inv!23892 (_values!5972 thiss!1427)) e!576526))))

(declare-fun b!1023185 () Bool)

(assert (=> b!1023185 (= e!576529 tp_is_empty!24007)))

(declare-fun res!685303 () Bool)

(assert (=> start!89244 (=> (not res!685303) (not e!576528))))

(declare-fun valid!1974 (LongMapFixedSize!5194) Bool)

(assert (=> start!89244 (= res!685303 (valid!1974 thiss!1427))))

(assert (=> start!89244 e!576528))

(assert (=> start!89244 e!576530))

(assert (=> start!89244 true))

(declare-fun b!1023186 () Bool)

(assert (=> b!1023186 (= e!576528 false)))

(declare-fun lt!450196 () Bool)

(declare-datatypes ((List!21737 0))(
  ( (Nil!21734) (Cons!21733 (h!22931 (_ BitVec 64)) (t!30766 List!21737)) )
))
(declare-fun arrayNoDuplicates!0 (array!63997 (_ BitVec 32) List!21737) Bool)

(assert (=> b!1023186 (= lt!450196 (arrayNoDuplicates!0 (_keys!11090 thiss!1427) #b00000000000000000000000000000000 Nil!21734))))

(declare-fun mapNonEmpty!37428 () Bool)

(declare-fun tp!71896 () Bool)

(assert (=> mapNonEmpty!37428 (= mapRes!37428 (and tp!71896 e!576525))))

(declare-fun mapKey!37428 () (_ BitVec 32))

(declare-fun mapRest!37428 () (Array (_ BitVec 32) ValueCell!11300))

(declare-fun mapValue!37428 () ValueCell!11300)

(assert (=> mapNonEmpty!37428 (= (arr!30811 (_values!5972 thiss!1427)) (store mapRest!37428 mapKey!37428 mapValue!37428))))

(assert (= (and start!89244 res!685303) b!1023179))

(assert (= (and b!1023179 res!685304) b!1023181))

(assert (= (and b!1023181 res!685302) b!1023183))

(assert (= (and b!1023183 res!685306) b!1023182))

(assert (= (and b!1023182 res!685305) b!1023186))

(assert (= (and b!1023180 condMapEmpty!37428) mapIsEmpty!37428))

(assert (= (and b!1023180 (not condMapEmpty!37428)) mapNonEmpty!37428))

(get-info :version)

(assert (= (and mapNonEmpty!37428 ((_ is ValueCellFull!11300) mapValue!37428)) b!1023178))

(assert (= (and b!1023180 ((_ is ValueCellFull!11300) mapDefault!37428)) b!1023185))

(assert (= b!1023184 b!1023180))

(assert (= start!89244 b!1023184))

(declare-fun m!941445 () Bool)

(assert (=> mapNonEmpty!37428 m!941445))

(declare-fun m!941447 () Bool)

(assert (=> start!89244 m!941447))

(declare-fun m!941449 () Bool)

(assert (=> b!1023184 m!941449))

(declare-fun m!941451 () Bool)

(assert (=> b!1023184 m!941451))

(declare-fun m!941453 () Bool)

(assert (=> b!1023182 m!941453))

(declare-fun m!941455 () Bool)

(assert (=> b!1023181 m!941455))

(declare-fun m!941457 () Bool)

(assert (=> b!1023186 m!941457))

(check-sat (not b!1023186) (not start!89244) (not b!1023181) tp_is_empty!24007 (not b_next!20287) (not b!1023182) (not b!1023184) b_and!32483 (not mapNonEmpty!37428))
(check-sat b_and!32483 (not b_next!20287))
