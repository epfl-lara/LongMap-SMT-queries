; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89238 () Bool)

(assert start!89238)

(declare-fun b!1023103 () Bool)

(declare-fun b_free!20281 () Bool)

(declare-fun b_next!20281 () Bool)

(assert (=> b!1023103 (= b_free!20281 (not b_next!20281))))

(declare-fun tp!71877 () Bool)

(declare-fun b_and!32477 () Bool)

(assert (=> b!1023103 (= tp!71877 b_and!32477)))

(declare-fun b!1023097 () Bool)

(declare-fun e!576474 () Bool)

(declare-fun e!576476 () Bool)

(declare-fun mapRes!37419 () Bool)

(assert (=> b!1023097 (= e!576474 (and e!576476 mapRes!37419))))

(declare-fun condMapEmpty!37419 () Bool)

(declare-datatypes ((V!36875 0))(
  ( (V!36876 (val!12051 Int)) )
))
(declare-datatypes ((ValueCell!11297 0))(
  ( (ValueCellFull!11297 (v!14619 V!36875)) (EmptyCell!11297) )
))
(declare-datatypes ((array!63985 0))(
  ( (array!63986 (arr!30804 (Array (_ BitVec 32) (_ BitVec 64))) (size!31317 (_ BitVec 32))) )
))
(declare-datatypes ((array!63987 0))(
  ( (array!63988 (arr!30805 (Array (_ BitVec 32) ValueCell!11297)) (size!31318 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5188 0))(
  ( (LongMapFixedSize!5189 (defaultEntry!5946 Int) (mask!29558 (_ BitVec 32)) (extraKeys!5678 (_ BitVec 32)) (zeroValue!5782 V!36875) (minValue!5782 V!36875) (_size!2649 (_ BitVec 32)) (_keys!11087 array!63985) (_values!5969 array!63987) (_vacant!2649 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5188)

(declare-fun mapDefault!37419 () ValueCell!11297)

(assert (=> b!1023097 (= condMapEmpty!37419 (= (arr!30805 (_values!5969 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11297)) mapDefault!37419)))))

(declare-fun mapIsEmpty!37419 () Bool)

(assert (=> mapIsEmpty!37419 mapRes!37419))

(declare-fun b!1023098 () Bool)

(declare-fun tp_is_empty!24001 () Bool)

(assert (=> b!1023098 (= e!576476 tp_is_empty!24001)))

(declare-fun b!1023099 () Bool)

(declare-fun res!685258 () Bool)

(declare-fun e!576473 () Bool)

(assert (=> b!1023099 (=> (not res!685258) (not e!576473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023099 (= res!685258 (validMask!0 (mask!29558 thiss!1427)))))

(declare-fun b!1023100 () Bool)

(declare-fun res!685261 () Bool)

(assert (=> b!1023100 (=> (not res!685261) (not e!576473))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023100 (= res!685261 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023101 () Bool)

(declare-fun res!685259 () Bool)

(assert (=> b!1023101 (=> (not res!685259) (not e!576473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63985 (_ BitVec 32)) Bool)

(assert (=> b!1023101 (= res!685259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11087 thiss!1427) (mask!29558 thiss!1427)))))

(declare-fun b!1023102 () Bool)

(assert (=> b!1023102 (= e!576473 false)))

(declare-fun lt!450187 () Bool)

(declare-datatypes ((List!21735 0))(
  ( (Nil!21732) (Cons!21731 (h!22929 (_ BitVec 64)) (t!30764 List!21735)) )
))
(declare-fun arrayNoDuplicates!0 (array!63985 (_ BitVec 32) List!21735) Bool)

(assert (=> b!1023102 (= lt!450187 (arrayNoDuplicates!0 (_keys!11087 thiss!1427) #b00000000000000000000000000000000 Nil!21732))))

(declare-fun e!576475 () Bool)

(declare-fun array_inv!23887 (array!63985) Bool)

(declare-fun array_inv!23888 (array!63987) Bool)

(assert (=> b!1023103 (= e!576475 (and tp!71877 tp_is_empty!24001 (array_inv!23887 (_keys!11087 thiss!1427)) (array_inv!23888 (_values!5969 thiss!1427)) e!576474))))

(declare-fun mapNonEmpty!37419 () Bool)

(declare-fun tp!71878 () Bool)

(declare-fun e!576471 () Bool)

(assert (=> mapNonEmpty!37419 (= mapRes!37419 (and tp!71878 e!576471))))

(declare-fun mapRest!37419 () (Array (_ BitVec 32) ValueCell!11297))

(declare-fun mapValue!37419 () ValueCell!11297)

(declare-fun mapKey!37419 () (_ BitVec 32))

(assert (=> mapNonEmpty!37419 (= (arr!30805 (_values!5969 thiss!1427)) (store mapRest!37419 mapKey!37419 mapValue!37419))))

(declare-fun b!1023104 () Bool)

(declare-fun res!685260 () Bool)

(assert (=> b!1023104 (=> (not res!685260) (not e!576473))))

(assert (=> b!1023104 (= res!685260 (and (= (size!31318 (_values!5969 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29558 thiss!1427))) (= (size!31317 (_keys!11087 thiss!1427)) (size!31318 (_values!5969 thiss!1427))) (bvsge (mask!29558 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5678 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5678 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5678 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1023105 () Bool)

(assert (=> b!1023105 (= e!576471 tp_is_empty!24001)))

(declare-fun res!685257 () Bool)

(assert (=> start!89238 (=> (not res!685257) (not e!576473))))

(declare-fun valid!1973 (LongMapFixedSize!5188) Bool)

(assert (=> start!89238 (= res!685257 (valid!1973 thiss!1427))))

(assert (=> start!89238 e!576473))

(assert (=> start!89238 e!576475))

(assert (=> start!89238 true))

(assert (= (and start!89238 res!685257) b!1023100))

(assert (= (and b!1023100 res!685261) b!1023099))

(assert (= (and b!1023099 res!685258) b!1023104))

(assert (= (and b!1023104 res!685260) b!1023101))

(assert (= (and b!1023101 res!685259) b!1023102))

(assert (= (and b!1023097 condMapEmpty!37419) mapIsEmpty!37419))

(assert (= (and b!1023097 (not condMapEmpty!37419)) mapNonEmpty!37419))

(get-info :version)

(assert (= (and mapNonEmpty!37419 ((_ is ValueCellFull!11297) mapValue!37419)) b!1023105))

(assert (= (and b!1023097 ((_ is ValueCellFull!11297) mapDefault!37419)) b!1023098))

(assert (= b!1023103 b!1023097))

(assert (= start!89238 b!1023103))

(declare-fun m!941403 () Bool)

(assert (=> b!1023099 m!941403))

(declare-fun m!941405 () Bool)

(assert (=> start!89238 m!941405))

(declare-fun m!941407 () Bool)

(assert (=> b!1023101 m!941407))

(declare-fun m!941409 () Bool)

(assert (=> mapNonEmpty!37419 m!941409))

(declare-fun m!941411 () Bool)

(assert (=> b!1023103 m!941411))

(declare-fun m!941413 () Bool)

(assert (=> b!1023103 m!941413))

(declare-fun m!941415 () Bool)

(assert (=> b!1023102 m!941415))

(check-sat tp_is_empty!24001 b_and!32477 (not start!89238) (not mapNonEmpty!37419) (not b!1023103) (not b!1023102) (not b_next!20281) (not b!1023101) (not b!1023099))
(check-sat b_and!32477 (not b_next!20281))
