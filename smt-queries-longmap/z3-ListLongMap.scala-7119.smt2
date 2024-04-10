; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90250 () Bool)

(assert start!90250)

(declare-fun b!1033182 () Bool)

(declare-fun b_free!20769 () Bool)

(declare-fun b_next!20769 () Bool)

(assert (=> b!1033182 (= b_free!20769 (not b_next!20769))))

(declare-fun tp!73400 () Bool)

(declare-fun b_and!33237 () Bool)

(assert (=> b!1033182 (= tp!73400 b_and!33237)))

(declare-fun mapIsEmpty!38210 () Bool)

(declare-fun mapRes!38210 () Bool)

(assert (=> mapIsEmpty!38210 mapRes!38210))

(declare-fun b!1033176 () Bool)

(declare-fun e!583919 () Bool)

(declare-fun tp_is_empty!24489 () Bool)

(assert (=> b!1033176 (= e!583919 tp_is_empty!24489)))

(declare-fun b!1033177 () Bool)

(declare-fun e!583917 () Bool)

(declare-datatypes ((V!37525 0))(
  ( (V!37526 (val!12295 Int)) )
))
(declare-datatypes ((ValueCell!11541 0))(
  ( (ValueCellFull!11541 (v!14872 V!37525)) (EmptyCell!11541) )
))
(declare-datatypes ((array!65054 0))(
  ( (array!65055 (arr!31323 (Array (_ BitVec 32) (_ BitVec 64))) (size!31845 (_ BitVec 32))) )
))
(declare-datatypes ((array!65056 0))(
  ( (array!65057 (arr!31324 (Array (_ BitVec 32) ValueCell!11541)) (size!31846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5676 0))(
  ( (LongMapFixedSize!5677 (defaultEntry!6212 Int) (mask!30055 (_ BitVec 32)) (extraKeys!5944 (_ BitVec 32)) (zeroValue!6048 V!37525) (minValue!6048 V!37525) (_size!2893 (_ BitVec 32)) (_keys!11390 array!65054) (_values!6235 array!65056) (_vacant!2893 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5676)

(assert (=> b!1033177 (= e!583917 (and (= (size!31846 (_values!6235 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30055 thiss!1427))) (= (size!31845 (_keys!11390 thiss!1427)) (size!31846 (_values!6235 thiss!1427))) (bvsge (mask!30055 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5944 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5944 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5944 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsgt (bvand (extraKeys!5944 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011)))))

(declare-fun res!690385 () Bool)

(assert (=> start!90250 (=> (not res!690385) (not e!583917))))

(declare-fun valid!2145 (LongMapFixedSize!5676) Bool)

(assert (=> start!90250 (= res!690385 (valid!2145 thiss!1427))))

(assert (=> start!90250 e!583917))

(declare-fun e!583918 () Bool)

(assert (=> start!90250 e!583918))

(assert (=> start!90250 true))

(declare-fun b!1033178 () Bool)

(declare-fun e!583921 () Bool)

(assert (=> b!1033178 (= e!583921 (and e!583919 mapRes!38210))))

(declare-fun condMapEmpty!38210 () Bool)

(declare-fun mapDefault!38210 () ValueCell!11541)

(assert (=> b!1033178 (= condMapEmpty!38210 (= (arr!31324 (_values!6235 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11541)) mapDefault!38210)))))

(declare-fun b!1033179 () Bool)

(declare-fun res!690384 () Bool)

(assert (=> b!1033179 (=> (not res!690384) (not e!583917))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033179 (= res!690384 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38210 () Bool)

(declare-fun tp!73401 () Bool)

(declare-fun e!583920 () Bool)

(assert (=> mapNonEmpty!38210 (= mapRes!38210 (and tp!73401 e!583920))))

(declare-fun mapValue!38210 () ValueCell!11541)

(declare-fun mapKey!38210 () (_ BitVec 32))

(declare-fun mapRest!38210 () (Array (_ BitVec 32) ValueCell!11541))

(assert (=> mapNonEmpty!38210 (= (arr!31324 (_values!6235 thiss!1427)) (store mapRest!38210 mapKey!38210 mapValue!38210))))

(declare-fun b!1033180 () Bool)

(assert (=> b!1033180 (= e!583920 tp_is_empty!24489)))

(declare-fun b!1033181 () Bool)

(declare-fun res!690386 () Bool)

(assert (=> b!1033181 (=> (not res!690386) (not e!583917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1033181 (= res!690386 (validMask!0 (mask!30055 thiss!1427)))))

(declare-fun array_inv!24237 (array!65054) Bool)

(declare-fun array_inv!24238 (array!65056) Bool)

(assert (=> b!1033182 (= e!583918 (and tp!73400 tp_is_empty!24489 (array_inv!24237 (_keys!11390 thiss!1427)) (array_inv!24238 (_values!6235 thiss!1427)) e!583921))))

(assert (= (and start!90250 res!690385) b!1033179))

(assert (= (and b!1033179 res!690384) b!1033181))

(assert (= (and b!1033181 res!690386) b!1033177))

(assert (= (and b!1033178 condMapEmpty!38210) mapIsEmpty!38210))

(assert (= (and b!1033178 (not condMapEmpty!38210)) mapNonEmpty!38210))

(get-info :version)

(assert (= (and mapNonEmpty!38210 ((_ is ValueCellFull!11541) mapValue!38210)) b!1033180))

(assert (= (and b!1033178 ((_ is ValueCellFull!11541) mapDefault!38210)) b!1033176))

(assert (= b!1033182 b!1033178))

(assert (= start!90250 b!1033182))

(declare-fun m!953067 () Bool)

(assert (=> start!90250 m!953067))

(declare-fun m!953069 () Bool)

(assert (=> mapNonEmpty!38210 m!953069))

(declare-fun m!953071 () Bool)

(assert (=> b!1033181 m!953071))

(declare-fun m!953073 () Bool)

(assert (=> b!1033182 m!953073))

(declare-fun m!953075 () Bool)

(assert (=> b!1033182 m!953075))

(check-sat (not b!1033181) b_and!33237 (not start!90250) (not b_next!20769) (not mapNonEmpty!38210) (not b!1033182) tp_is_empty!24489)
(check-sat b_and!33237 (not b_next!20769))
