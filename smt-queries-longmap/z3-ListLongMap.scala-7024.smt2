; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89154 () Bool)

(assert start!89154)

(declare-fun b!1022051 () Bool)

(declare-fun b_free!20197 () Bool)

(declare-fun b_next!20197 () Bool)

(assert (=> b!1022051 (= b_free!20197 (not b_next!20197))))

(declare-fun tp!71626 () Bool)

(declare-fun b_and!32369 () Bool)

(assert (=> b!1022051 (= tp!71626 b_and!32369)))

(declare-fun b!1022047 () Bool)

(declare-fun e!575715 () Bool)

(assert (=> b!1022047 (= e!575715 false)))

(declare-fun lt!449989 () Bool)

(declare-datatypes ((V!36763 0))(
  ( (V!36764 (val!12009 Int)) )
))
(declare-datatypes ((ValueCell!11255 0))(
  ( (ValueCellFull!11255 (v!14577 V!36763)) (EmptyCell!11255) )
))
(declare-datatypes ((array!63817 0))(
  ( (array!63818 (arr!30720 (Array (_ BitVec 32) (_ BitVec 64))) (size!31233 (_ BitVec 32))) )
))
(declare-datatypes ((array!63819 0))(
  ( (array!63820 (arr!30721 (Array (_ BitVec 32) ValueCell!11255)) (size!31234 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5104 0))(
  ( (LongMapFixedSize!5105 (defaultEntry!5904 Int) (mask!29488 (_ BitVec 32)) (extraKeys!5636 (_ BitVec 32)) (zeroValue!5740 V!36763) (minValue!5740 V!36763) (_size!2607 (_ BitVec 32)) (_keys!11045 array!63817) (_values!5927 array!63819) (_vacant!2607 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5104)

(declare-datatypes ((List!21707 0))(
  ( (Nil!21704) (Cons!21703 (h!22901 (_ BitVec 64)) (t!30712 List!21707)) )
))
(declare-fun arrayNoDuplicates!0 (array!63817 (_ BitVec 32) List!21707) Bool)

(assert (=> b!1022047 (= lt!449989 (arrayNoDuplicates!0 (_keys!11045 thiss!1427) #b00000000000000000000000000000000 Nil!21704))))

(declare-fun b!1022048 () Bool)

(declare-fun e!575716 () Bool)

(declare-fun e!575717 () Bool)

(declare-fun mapRes!37293 () Bool)

(assert (=> b!1022048 (= e!575716 (and e!575717 mapRes!37293))))

(declare-fun condMapEmpty!37293 () Bool)

(declare-fun mapDefault!37293 () ValueCell!11255)

(assert (=> b!1022048 (= condMapEmpty!37293 (= (arr!30721 (_values!5927 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11255)) mapDefault!37293)))))

(declare-fun b!1022049 () Bool)

(declare-fun tp_is_empty!23917 () Bool)

(assert (=> b!1022049 (= e!575717 tp_is_empty!23917)))

(declare-fun b!1022050 () Bool)

(declare-fun res!684736 () Bool)

(assert (=> b!1022050 (=> (not res!684736) (not e!575715))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022050 (= res!684736 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!684737 () Bool)

(assert (=> start!89154 (=> (not res!684737) (not e!575715))))

(declare-fun valid!1946 (LongMapFixedSize!5104) Bool)

(assert (=> start!89154 (= res!684737 (valid!1946 thiss!1427))))

(assert (=> start!89154 e!575715))

(declare-fun e!575719 () Bool)

(assert (=> start!89154 e!575719))

(assert (=> start!89154 true))

(declare-fun array_inv!23833 (array!63817) Bool)

(declare-fun array_inv!23834 (array!63819) Bool)

(assert (=> b!1022051 (= e!575719 (and tp!71626 tp_is_empty!23917 (array_inv!23833 (_keys!11045 thiss!1427)) (array_inv!23834 (_values!5927 thiss!1427)) e!575716))))

(declare-fun b!1022052 () Bool)

(declare-fun res!684735 () Bool)

(assert (=> b!1022052 (=> (not res!684735) (not e!575715))))

(assert (=> b!1022052 (= res!684735 (and (= (size!31234 (_values!5927 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29488 thiss!1427))) (= (size!31233 (_keys!11045 thiss!1427)) (size!31234 (_values!5927 thiss!1427))) (bvsge (mask!29488 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5636 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5636 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5636 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37293 () Bool)

(declare-fun tp!71625 () Bool)

(declare-fun e!575720 () Bool)

(assert (=> mapNonEmpty!37293 (= mapRes!37293 (and tp!71625 e!575720))))

(declare-fun mapRest!37293 () (Array (_ BitVec 32) ValueCell!11255))

(declare-fun mapKey!37293 () (_ BitVec 32))

(declare-fun mapValue!37293 () ValueCell!11255)

(assert (=> mapNonEmpty!37293 (= (arr!30721 (_values!5927 thiss!1427)) (store mapRest!37293 mapKey!37293 mapValue!37293))))

(declare-fun b!1022053 () Bool)

(declare-fun res!684738 () Bool)

(assert (=> b!1022053 (=> (not res!684738) (not e!575715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022053 (= res!684738 (validMask!0 (mask!29488 thiss!1427)))))

(declare-fun b!1022054 () Bool)

(declare-fun res!684739 () Bool)

(assert (=> b!1022054 (=> (not res!684739) (not e!575715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63817 (_ BitVec 32)) Bool)

(assert (=> b!1022054 (= res!684739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11045 thiss!1427) (mask!29488 thiss!1427)))))

(declare-fun mapIsEmpty!37293 () Bool)

(assert (=> mapIsEmpty!37293 mapRes!37293))

(declare-fun b!1022055 () Bool)

(assert (=> b!1022055 (= e!575720 tp_is_empty!23917)))

(assert (= (and start!89154 res!684737) b!1022050))

(assert (= (and b!1022050 res!684736) b!1022053))

(assert (= (and b!1022053 res!684738) b!1022052))

(assert (= (and b!1022052 res!684735) b!1022054))

(assert (= (and b!1022054 res!684739) b!1022047))

(assert (= (and b!1022048 condMapEmpty!37293) mapIsEmpty!37293))

(assert (= (and b!1022048 (not condMapEmpty!37293)) mapNonEmpty!37293))

(get-info :version)

(assert (= (and mapNonEmpty!37293 ((_ is ValueCellFull!11255) mapValue!37293)) b!1022055))

(assert (= (and b!1022048 ((_ is ValueCellFull!11255) mapDefault!37293)) b!1022049))

(assert (= b!1022051 b!1022048))

(assert (= start!89154 b!1022051))

(declare-fun m!940743 () Bool)

(assert (=> b!1022053 m!940743))

(declare-fun m!940745 () Bool)

(assert (=> start!89154 m!940745))

(declare-fun m!940747 () Bool)

(assert (=> b!1022047 m!940747))

(declare-fun m!940749 () Bool)

(assert (=> b!1022051 m!940749))

(declare-fun m!940751 () Bool)

(assert (=> b!1022051 m!940751))

(declare-fun m!940753 () Bool)

(assert (=> mapNonEmpty!37293 m!940753))

(declare-fun m!940755 () Bool)

(assert (=> b!1022054 m!940755))

(check-sat (not b!1022053) (not b!1022047) (not mapNonEmpty!37293) (not b_next!20197) (not start!89154) (not b!1022051) (not b!1022054) b_and!32369 tp_is_empty!23917)
(check-sat b_and!32369 (not b_next!20197))
