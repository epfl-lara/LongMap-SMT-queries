; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89438 () Bool)

(assert start!89438)

(declare-fun b!1024082 () Bool)

(declare-fun b_free!20245 () Bool)

(declare-fun b_next!20245 () Bool)

(assert (=> b!1024082 (= b_free!20245 (not b_next!20245))))

(declare-fun tp!71769 () Bool)

(declare-fun b_and!32477 () Bool)

(assert (=> b!1024082 (= tp!71769 b_and!32477)))

(declare-fun mapNonEmpty!37365 () Bool)

(declare-fun mapRes!37365 () Bool)

(declare-fun tp!71770 () Bool)

(declare-fun e!577086 () Bool)

(assert (=> mapNonEmpty!37365 (= mapRes!37365 (and tp!71770 e!577086))))

(declare-datatypes ((V!36827 0))(
  ( (V!36828 (val!12033 Int)) )
))
(declare-datatypes ((ValueCell!11279 0))(
  ( (ValueCellFull!11279 (v!14598 V!36827)) (EmptyCell!11279) )
))
(declare-fun mapRest!37365 () (Array (_ BitVec 32) ValueCell!11279))

(declare-fun mapKey!37365 () (_ BitVec 32))

(declare-fun mapValue!37365 () ValueCell!11279)

(declare-datatypes ((array!64023 0))(
  ( (array!64024 (arr!30817 (Array (_ BitVec 32) (_ BitVec 64))) (size!31329 (_ BitVec 32))) )
))
(declare-datatypes ((array!64025 0))(
  ( (array!64026 (arr!30818 (Array (_ BitVec 32) ValueCell!11279)) (size!31330 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5152 0))(
  ( (LongMapFixedSize!5153 (defaultEntry!5928 Int) (mask!29593 (_ BitVec 32)) (extraKeys!5660 (_ BitVec 32)) (zeroValue!5764 V!36827) (minValue!5764 V!36827) (_size!2631 (_ BitVec 32)) (_keys!11111 array!64023) (_values!5951 array!64025) (_vacant!2631 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5152)

(assert (=> mapNonEmpty!37365 (= (arr!30818 (_values!5951 thiss!1427)) (store mapRest!37365 mapKey!37365 mapValue!37365))))

(declare-fun b!1024077 () Bool)

(declare-fun res!685566 () Bool)

(declare-fun e!577083 () Bool)

(assert (=> b!1024077 (=> (not res!685566) (not e!577083))))

(assert (=> b!1024077 (= res!685566 (and (= (size!31330 (_values!5951 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29593 thiss!1427))) (= (size!31329 (_keys!11111 thiss!1427)) (size!31330 (_values!5951 thiss!1427))) (bvsge (mask!29593 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5660 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5660 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1024078 () Bool)

(declare-fun res!685568 () Bool)

(assert (=> b!1024078 (=> (not res!685568) (not e!577083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64023 (_ BitVec 32)) Bool)

(assert (=> b!1024078 (= res!685568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11111 thiss!1427) (mask!29593 thiss!1427)))))

(declare-fun b!1024079 () Bool)

(declare-fun tp_is_empty!23965 () Bool)

(assert (=> b!1024079 (= e!577086 tp_is_empty!23965)))

(declare-fun mapIsEmpty!37365 () Bool)

(assert (=> mapIsEmpty!37365 mapRes!37365))

(declare-fun b!1024080 () Bool)

(declare-fun res!685565 () Bool)

(assert (=> b!1024080 (=> (not res!685565) (not e!577083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024080 (= res!685565 (validMask!0 (mask!29593 thiss!1427)))))

(declare-fun e!577085 () Bool)

(declare-fun e!577084 () Bool)

(declare-fun array_inv!23903 (array!64023) Bool)

(declare-fun array_inv!23904 (array!64025) Bool)

(assert (=> b!1024082 (= e!577085 (and tp!71769 tp_is_empty!23965 (array_inv!23903 (_keys!11111 thiss!1427)) (array_inv!23904 (_values!5951 thiss!1427)) e!577084))))

(declare-fun b!1024083 () Bool)

(assert (=> b!1024083 (= e!577083 false)))

(declare-fun lt!450848 () Bool)

(declare-datatypes ((List!21680 0))(
  ( (Nil!21677) (Cons!21676 (h!22883 (_ BitVec 64)) (t!30710 List!21680)) )
))
(declare-fun arrayNoDuplicates!0 (array!64023 (_ BitVec 32) List!21680) Bool)

(assert (=> b!1024083 (= lt!450848 (arrayNoDuplicates!0 (_keys!11111 thiss!1427) #b00000000000000000000000000000000 Nil!21677))))

(declare-fun b!1024084 () Bool)

(declare-fun res!685564 () Bool)

(assert (=> b!1024084 (=> (not res!685564) (not e!577083))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024084 (= res!685564 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1024085 () Bool)

(declare-fun e!577082 () Bool)

(assert (=> b!1024085 (= e!577082 tp_is_empty!23965)))

(declare-fun res!685567 () Bool)

(assert (=> start!89438 (=> (not res!685567) (not e!577083))))

(declare-fun valid!1969 (LongMapFixedSize!5152) Bool)

(assert (=> start!89438 (= res!685567 (valid!1969 thiss!1427))))

(assert (=> start!89438 e!577083))

(assert (=> start!89438 e!577085))

(assert (=> start!89438 true))

(declare-fun b!1024081 () Bool)

(assert (=> b!1024081 (= e!577084 (and e!577082 mapRes!37365))))

(declare-fun condMapEmpty!37365 () Bool)

(declare-fun mapDefault!37365 () ValueCell!11279)

(assert (=> b!1024081 (= condMapEmpty!37365 (= (arr!30818 (_values!5951 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11279)) mapDefault!37365)))))

(assert (= (and start!89438 res!685567) b!1024084))

(assert (= (and b!1024084 res!685564) b!1024080))

(assert (= (and b!1024080 res!685565) b!1024077))

(assert (= (and b!1024077 res!685566) b!1024078))

(assert (= (and b!1024078 res!685568) b!1024083))

(assert (= (and b!1024081 condMapEmpty!37365) mapIsEmpty!37365))

(assert (= (and b!1024081 (not condMapEmpty!37365)) mapNonEmpty!37365))

(get-info :version)

(assert (= (and mapNonEmpty!37365 ((_ is ValueCellFull!11279) mapValue!37365)) b!1024079))

(assert (= (and b!1024081 ((_ is ValueCellFull!11279) mapDefault!37365)) b!1024085))

(assert (= b!1024082 b!1024081))

(assert (= start!89438 b!1024082))

(declare-fun m!943435 () Bool)

(assert (=> b!1024083 m!943435))

(declare-fun m!943437 () Bool)

(assert (=> mapNonEmpty!37365 m!943437))

(declare-fun m!943439 () Bool)

(assert (=> b!1024082 m!943439))

(declare-fun m!943441 () Bool)

(assert (=> b!1024082 m!943441))

(declare-fun m!943443 () Bool)

(assert (=> b!1024080 m!943443))

(declare-fun m!943445 () Bool)

(assert (=> start!89438 m!943445))

(declare-fun m!943447 () Bool)

(assert (=> b!1024078 m!943447))

(check-sat (not b!1024083) tp_is_empty!23965 (not mapNonEmpty!37365) (not b!1024080) (not b_next!20245) b_and!32477 (not start!89438) (not b!1024078) (not b!1024082))
(check-sat b_and!32477 (not b_next!20245))
