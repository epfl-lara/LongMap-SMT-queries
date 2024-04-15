; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89148 () Bool)

(assert start!89148)

(declare-fun b!1021974 () Bool)

(declare-fun b_free!20191 () Bool)

(declare-fun b_next!20191 () Bool)

(assert (=> b!1021974 (= b_free!20191 (not b_next!20191))))

(declare-fun tp!71608 () Bool)

(declare-fun b_and!32363 () Bool)

(assert (=> b!1021974 (= tp!71608 b_and!32363)))

(declare-fun b!1021966 () Bool)

(declare-fun res!684691 () Bool)

(declare-fun e!575666 () Bool)

(assert (=> b!1021966 (=> (not res!684691) (not e!575666))))

(declare-datatypes ((V!36755 0))(
  ( (V!36756 (val!12006 Int)) )
))
(declare-datatypes ((ValueCell!11252 0))(
  ( (ValueCellFull!11252 (v!14574 V!36755)) (EmptyCell!11252) )
))
(declare-datatypes ((array!63805 0))(
  ( (array!63806 (arr!30714 (Array (_ BitVec 32) (_ BitVec 64))) (size!31227 (_ BitVec 32))) )
))
(declare-datatypes ((array!63807 0))(
  ( (array!63808 (arr!30715 (Array (_ BitVec 32) ValueCell!11252)) (size!31228 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5098 0))(
  ( (LongMapFixedSize!5099 (defaultEntry!5901 Int) (mask!29483 (_ BitVec 32)) (extraKeys!5633 (_ BitVec 32)) (zeroValue!5737 V!36755) (minValue!5737 V!36755) (_size!2604 (_ BitVec 32)) (_keys!11042 array!63805) (_values!5924 array!63807) (_vacant!2604 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5098)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63805 (_ BitVec 32)) Bool)

(assert (=> b!1021966 (= res!684691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11042 thiss!1427) (mask!29483 thiss!1427)))))

(declare-fun b!1021967 () Bool)

(declare-fun res!684694 () Bool)

(assert (=> b!1021967 (=> (not res!684694) (not e!575666))))

(assert (=> b!1021967 (= res!684694 (and (= (size!31228 (_values!5924 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29483 thiss!1427))) (= (size!31227 (_keys!11042 thiss!1427)) (size!31228 (_values!5924 thiss!1427))) (bvsge (mask!29483 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5633 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5633 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5633 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021968 () Bool)

(declare-fun res!684693 () Bool)

(assert (=> b!1021968 (=> (not res!684693) (not e!575666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021968 (= res!684693 (validMask!0 (mask!29483 thiss!1427)))))

(declare-fun mapIsEmpty!37284 () Bool)

(declare-fun mapRes!37284 () Bool)

(assert (=> mapIsEmpty!37284 mapRes!37284))

(declare-fun b!1021969 () Bool)

(assert (=> b!1021969 (= e!575666 false)))

(declare-fun lt!449980 () Bool)

(declare-datatypes ((List!21704 0))(
  ( (Nil!21701) (Cons!21700 (h!22898 (_ BitVec 64)) (t!30709 List!21704)) )
))
(declare-fun arrayNoDuplicates!0 (array!63805 (_ BitVec 32) List!21704) Bool)

(assert (=> b!1021969 (= lt!449980 (arrayNoDuplicates!0 (_keys!11042 thiss!1427) #b00000000000000000000000000000000 Nil!21701))))

(declare-fun b!1021970 () Bool)

(declare-fun res!684690 () Bool)

(assert (=> b!1021970 (=> (not res!684690) (not e!575666))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021970 (= res!684690 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!684692 () Bool)

(assert (=> start!89148 (=> (not res!684692) (not e!575666))))

(declare-fun valid!1943 (LongMapFixedSize!5098) Bool)

(assert (=> start!89148 (= res!684692 (valid!1943 thiss!1427))))

(assert (=> start!89148 e!575666))

(declare-fun e!575665 () Bool)

(assert (=> start!89148 e!575665))

(assert (=> start!89148 true))

(declare-fun b!1021971 () Bool)

(declare-fun e!575664 () Bool)

(declare-fun tp_is_empty!23911 () Bool)

(assert (=> b!1021971 (= e!575664 tp_is_empty!23911)))

(declare-fun b!1021972 () Bool)

(declare-fun e!575662 () Bool)

(assert (=> b!1021972 (= e!575662 tp_is_empty!23911)))

(declare-fun mapNonEmpty!37284 () Bool)

(declare-fun tp!71607 () Bool)

(assert (=> mapNonEmpty!37284 (= mapRes!37284 (and tp!71607 e!575664))))

(declare-fun mapRest!37284 () (Array (_ BitVec 32) ValueCell!11252))

(declare-fun mapValue!37284 () ValueCell!11252)

(declare-fun mapKey!37284 () (_ BitVec 32))

(assert (=> mapNonEmpty!37284 (= (arr!30715 (_values!5924 thiss!1427)) (store mapRest!37284 mapKey!37284 mapValue!37284))))

(declare-fun b!1021973 () Bool)

(declare-fun e!575663 () Bool)

(assert (=> b!1021973 (= e!575663 (and e!575662 mapRes!37284))))

(declare-fun condMapEmpty!37284 () Bool)

(declare-fun mapDefault!37284 () ValueCell!11252)

(assert (=> b!1021973 (= condMapEmpty!37284 (= (arr!30715 (_values!5924 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11252)) mapDefault!37284)))))

(declare-fun array_inv!23829 (array!63805) Bool)

(declare-fun array_inv!23830 (array!63807) Bool)

(assert (=> b!1021974 (= e!575665 (and tp!71608 tp_is_empty!23911 (array_inv!23829 (_keys!11042 thiss!1427)) (array_inv!23830 (_values!5924 thiss!1427)) e!575663))))

(assert (= (and start!89148 res!684692) b!1021970))

(assert (= (and b!1021970 res!684690) b!1021968))

(assert (= (and b!1021968 res!684693) b!1021967))

(assert (= (and b!1021967 res!684694) b!1021966))

(assert (= (and b!1021966 res!684691) b!1021969))

(assert (= (and b!1021973 condMapEmpty!37284) mapIsEmpty!37284))

(assert (= (and b!1021973 (not condMapEmpty!37284)) mapNonEmpty!37284))

(get-info :version)

(assert (= (and mapNonEmpty!37284 ((_ is ValueCellFull!11252) mapValue!37284)) b!1021971))

(assert (= (and b!1021973 ((_ is ValueCellFull!11252) mapDefault!37284)) b!1021972))

(assert (= b!1021974 b!1021973))

(assert (= start!89148 b!1021974))

(declare-fun m!940701 () Bool)

(assert (=> b!1021969 m!940701))

(declare-fun m!940703 () Bool)

(assert (=> b!1021968 m!940703))

(declare-fun m!940705 () Bool)

(assert (=> b!1021974 m!940705))

(declare-fun m!940707 () Bool)

(assert (=> b!1021974 m!940707))

(declare-fun m!940709 () Bool)

(assert (=> mapNonEmpty!37284 m!940709))

(declare-fun m!940711 () Bool)

(assert (=> start!89148 m!940711))

(declare-fun m!940713 () Bool)

(assert (=> b!1021966 m!940713))

(check-sat (not b!1021969) tp_is_empty!23911 b_and!32363 (not b!1021966) (not b_next!20191) (not start!89148) (not b!1021968) (not mapNonEmpty!37284) (not b!1021974))
(check-sat b_and!32363 (not b_next!20191))
