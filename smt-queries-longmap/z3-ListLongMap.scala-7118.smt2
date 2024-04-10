; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90244 () Bool)

(assert start!90244)

(declare-fun b!1033114 () Bool)

(declare-fun b_free!20763 () Bool)

(declare-fun b_next!20763 () Bool)

(assert (=> b!1033114 (= b_free!20763 (not b_next!20763))))

(declare-fun tp!73382 () Bool)

(declare-fun b_and!33231 () Bool)

(assert (=> b!1033114 (= tp!73382 b_and!33231)))

(declare-fun b!1033113 () Bool)

(declare-fun res!690358 () Bool)

(declare-fun e!583867 () Bool)

(assert (=> b!1033113 (=> (not res!690358) (not e!583867))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033113 (= res!690358 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38201 () Bool)

(declare-fun mapRes!38201 () Bool)

(declare-fun tp!73383 () Bool)

(declare-fun e!583862 () Bool)

(assert (=> mapNonEmpty!38201 (= mapRes!38201 (and tp!73383 e!583862))))

(declare-datatypes ((V!37517 0))(
  ( (V!37518 (val!12292 Int)) )
))
(declare-datatypes ((ValueCell!11538 0))(
  ( (ValueCellFull!11538 (v!14869 V!37517)) (EmptyCell!11538) )
))
(declare-fun mapRest!38201 () (Array (_ BitVec 32) ValueCell!11538))

(declare-datatypes ((array!65042 0))(
  ( (array!65043 (arr!31317 (Array (_ BitVec 32) (_ BitVec 64))) (size!31839 (_ BitVec 32))) )
))
(declare-datatypes ((array!65044 0))(
  ( (array!65045 (arr!31318 (Array (_ BitVec 32) ValueCell!11538)) (size!31840 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5670 0))(
  ( (LongMapFixedSize!5671 (defaultEntry!6209 Int) (mask!30050 (_ BitVec 32)) (extraKeys!5941 (_ BitVec 32)) (zeroValue!6045 V!37517) (minValue!6045 V!37517) (_size!2890 (_ BitVec 32)) (_keys!11387 array!65042) (_values!6232 array!65044) (_vacant!2890 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5670)

(declare-fun mapKey!38201 () (_ BitVec 32))

(declare-fun mapValue!38201 () ValueCell!11538)

(assert (=> mapNonEmpty!38201 (= (arr!31318 (_values!6232 thiss!1427)) (store mapRest!38201 mapKey!38201 mapValue!38201))))

(declare-fun e!583864 () Bool)

(declare-fun tp_is_empty!24483 () Bool)

(declare-fun e!583863 () Bool)

(declare-fun array_inv!24235 (array!65042) Bool)

(declare-fun array_inv!24236 (array!65044) Bool)

(assert (=> b!1033114 (= e!583863 (and tp!73382 tp_is_empty!24483 (array_inv!24235 (_keys!11387 thiss!1427)) (array_inv!24236 (_values!6232 thiss!1427)) e!583864))))

(declare-fun b!1033115 () Bool)

(assert (=> b!1033115 (= e!583867 (and (= (size!31840 (_values!6232 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30050 thiss!1427))) (= (size!31839 (_keys!11387 thiss!1427)) (size!31840 (_values!6232 thiss!1427))) (bvsge (mask!30050 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5941 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5941 thiss!1427) #b00000000000000000000000000000011) (bvslt (bvand (extraKeys!5941 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033116 () Bool)

(declare-fun e!583866 () Bool)

(assert (=> b!1033116 (= e!583866 tp_is_empty!24483)))

(declare-fun mapIsEmpty!38201 () Bool)

(assert (=> mapIsEmpty!38201 mapRes!38201))

(declare-fun b!1033117 () Bool)

(assert (=> b!1033117 (= e!583864 (and e!583866 mapRes!38201))))

(declare-fun condMapEmpty!38201 () Bool)

(declare-fun mapDefault!38201 () ValueCell!11538)

(assert (=> b!1033117 (= condMapEmpty!38201 (= (arr!31318 (_values!6232 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11538)) mapDefault!38201)))))

(declare-fun res!690359 () Bool)

(assert (=> start!90244 (=> (not res!690359) (not e!583867))))

(declare-fun valid!2143 (LongMapFixedSize!5670) Bool)

(assert (=> start!90244 (= res!690359 (valid!2143 thiss!1427))))

(assert (=> start!90244 e!583867))

(assert (=> start!90244 e!583863))

(assert (=> start!90244 true))

(declare-fun b!1033118 () Bool)

(declare-fun res!690357 () Bool)

(assert (=> b!1033118 (=> (not res!690357) (not e!583867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033118 (= res!690357 (validMask!0 (mask!30050 thiss!1427)))))

(declare-fun b!1033119 () Bool)

(assert (=> b!1033119 (= e!583862 tp_is_empty!24483)))

(assert (= (and start!90244 res!690359) b!1033113))

(assert (= (and b!1033113 res!690358) b!1033118))

(assert (= (and b!1033118 res!690357) b!1033115))

(assert (= (and b!1033117 condMapEmpty!38201) mapIsEmpty!38201))

(assert (= (and b!1033117 (not condMapEmpty!38201)) mapNonEmpty!38201))

(get-info :version)

(assert (= (and mapNonEmpty!38201 ((_ is ValueCellFull!11538) mapValue!38201)) b!1033119))

(assert (= (and b!1033117 ((_ is ValueCellFull!11538) mapDefault!38201)) b!1033116))

(assert (= b!1033114 b!1033117))

(assert (= start!90244 b!1033114))

(declare-fun m!953037 () Bool)

(assert (=> mapNonEmpty!38201 m!953037))

(declare-fun m!953039 () Bool)

(assert (=> b!1033114 m!953039))

(declare-fun m!953041 () Bool)

(assert (=> b!1033114 m!953041))

(declare-fun m!953043 () Bool)

(assert (=> start!90244 m!953043))

(declare-fun m!953045 () Bool)

(assert (=> b!1033118 m!953045))

(check-sat (not b!1033118) b_and!33231 (not b!1033114) (not b_next!20763) tp_is_empty!24483 (not start!90244) (not mapNonEmpty!38201))
(check-sat b_and!33231 (not b_next!20763))
