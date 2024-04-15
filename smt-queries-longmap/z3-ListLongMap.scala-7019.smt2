; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89124 () Bool)

(assert start!89124)

(declare-fun b!1021648 () Bool)

(declare-fun b_free!20167 () Bool)

(declare-fun b_next!20167 () Bool)

(assert (=> b!1021648 (= b_free!20167 (not b_next!20167))))

(declare-fun tp!71536 () Bool)

(declare-fun b_and!32339 () Bool)

(assert (=> b!1021648 (= tp!71536 b_and!32339)))

(declare-fun b!1021642 () Bool)

(declare-fun res!684514 () Bool)

(declare-fun e!575448 () Bool)

(assert (=> b!1021642 (=> (not res!684514) (not e!575448))))

(declare-datatypes ((V!36723 0))(
  ( (V!36724 (val!11994 Int)) )
))
(declare-datatypes ((ValueCell!11240 0))(
  ( (ValueCellFull!11240 (v!14562 V!36723)) (EmptyCell!11240) )
))
(declare-datatypes ((array!63757 0))(
  ( (array!63758 (arr!30690 (Array (_ BitVec 32) (_ BitVec 64))) (size!31203 (_ BitVec 32))) )
))
(declare-datatypes ((array!63759 0))(
  ( (array!63760 (arr!30691 (Array (_ BitVec 32) ValueCell!11240)) (size!31204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5074 0))(
  ( (LongMapFixedSize!5075 (defaultEntry!5889 Int) (mask!29463 (_ BitVec 32)) (extraKeys!5621 (_ BitVec 32)) (zeroValue!5725 V!36723) (minValue!5725 V!36723) (_size!2592 (_ BitVec 32)) (_keys!11030 array!63757) (_values!5912 array!63759) (_vacant!2592 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5074)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63757 (_ BitVec 32)) Bool)

(assert (=> b!1021642 (= res!684514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11030 thiss!1427) (mask!29463 thiss!1427)))))

(declare-fun mapIsEmpty!37248 () Bool)

(declare-fun mapRes!37248 () Bool)

(assert (=> mapIsEmpty!37248 mapRes!37248))

(declare-fun res!684510 () Bool)

(assert (=> start!89124 (=> (not res!684510) (not e!575448))))

(declare-fun valid!1936 (LongMapFixedSize!5074) Bool)

(assert (=> start!89124 (= res!684510 (valid!1936 thiss!1427))))

(assert (=> start!89124 e!575448))

(declare-fun e!575446 () Bool)

(assert (=> start!89124 e!575446))

(assert (=> start!89124 true))

(declare-fun b!1021643 () Bool)

(declare-fun res!684512 () Bool)

(assert (=> b!1021643 (=> (not res!684512) (not e!575448))))

(assert (=> b!1021643 (= res!684512 (and (= (size!31204 (_values!5912 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29463 thiss!1427))) (= (size!31203 (_keys!11030 thiss!1427)) (size!31204 (_values!5912 thiss!1427))) (bvsge (mask!29463 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5621 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5621 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37248 () Bool)

(declare-fun tp!71535 () Bool)

(declare-fun e!575449 () Bool)

(assert (=> mapNonEmpty!37248 (= mapRes!37248 (and tp!71535 e!575449))))

(declare-fun mapValue!37248 () ValueCell!11240)

(declare-fun mapRest!37248 () (Array (_ BitVec 32) ValueCell!11240))

(declare-fun mapKey!37248 () (_ BitVec 32))

(assert (=> mapNonEmpty!37248 (= (arr!30691 (_values!5912 thiss!1427)) (store mapRest!37248 mapKey!37248 mapValue!37248))))

(declare-fun b!1021644 () Bool)

(declare-fun res!684511 () Bool)

(assert (=> b!1021644 (=> (not res!684511) (not e!575448))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021644 (= res!684511 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021645 () Bool)

(declare-fun res!684513 () Bool)

(assert (=> b!1021645 (=> (not res!684513) (not e!575448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021645 (= res!684513 (validMask!0 (mask!29463 thiss!1427)))))

(declare-fun b!1021646 () Bool)

(declare-fun e!575450 () Bool)

(declare-fun tp_is_empty!23887 () Bool)

(assert (=> b!1021646 (= e!575450 tp_is_empty!23887)))

(declare-fun b!1021647 () Bool)

(assert (=> b!1021647 (= e!575449 tp_is_empty!23887)))

(declare-fun e!575445 () Bool)

(declare-fun array_inv!23811 (array!63757) Bool)

(declare-fun array_inv!23812 (array!63759) Bool)

(assert (=> b!1021648 (= e!575446 (and tp!71536 tp_is_empty!23887 (array_inv!23811 (_keys!11030 thiss!1427)) (array_inv!23812 (_values!5912 thiss!1427)) e!575445))))

(declare-fun b!1021649 () Bool)

(assert (=> b!1021649 (= e!575445 (and e!575450 mapRes!37248))))

(declare-fun condMapEmpty!37248 () Bool)

(declare-fun mapDefault!37248 () ValueCell!11240)

(assert (=> b!1021649 (= condMapEmpty!37248 (= (arr!30691 (_values!5912 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11240)) mapDefault!37248)))))

(declare-fun b!1021650 () Bool)

(assert (=> b!1021650 (= e!575448 false)))

(declare-fun lt!449944 () Bool)

(declare-datatypes ((List!21696 0))(
  ( (Nil!21693) (Cons!21692 (h!22890 (_ BitVec 64)) (t!30701 List!21696)) )
))
(declare-fun arrayNoDuplicates!0 (array!63757 (_ BitVec 32) List!21696) Bool)

(assert (=> b!1021650 (= lt!449944 (arrayNoDuplicates!0 (_keys!11030 thiss!1427) #b00000000000000000000000000000000 Nil!21693))))

(assert (= (and start!89124 res!684510) b!1021644))

(assert (= (and b!1021644 res!684511) b!1021645))

(assert (= (and b!1021645 res!684513) b!1021643))

(assert (= (and b!1021643 res!684512) b!1021642))

(assert (= (and b!1021642 res!684514) b!1021650))

(assert (= (and b!1021649 condMapEmpty!37248) mapIsEmpty!37248))

(assert (= (and b!1021649 (not condMapEmpty!37248)) mapNonEmpty!37248))

(get-info :version)

(assert (= (and mapNonEmpty!37248 ((_ is ValueCellFull!11240) mapValue!37248)) b!1021647))

(assert (= (and b!1021649 ((_ is ValueCellFull!11240) mapDefault!37248)) b!1021646))

(assert (= b!1021648 b!1021649))

(assert (= start!89124 b!1021648))

(declare-fun m!940533 () Bool)

(assert (=> b!1021642 m!940533))

(declare-fun m!940535 () Bool)

(assert (=> b!1021645 m!940535))

(declare-fun m!940537 () Bool)

(assert (=> b!1021648 m!940537))

(declare-fun m!940539 () Bool)

(assert (=> b!1021648 m!940539))

(declare-fun m!940541 () Bool)

(assert (=> b!1021650 m!940541))

(declare-fun m!940543 () Bool)

(assert (=> mapNonEmpty!37248 m!940543))

(declare-fun m!940545 () Bool)

(assert (=> start!89124 m!940545))

(check-sat (not start!89124) b_and!32339 (not b!1021648) (not b_next!20167) (not b!1021650) (not b!1021645) (not mapNonEmpty!37248) tp_is_empty!23887 (not b!1021642))
(check-sat b_and!32339 (not b_next!20167))
