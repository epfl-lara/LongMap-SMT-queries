; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89030 () Bool)

(assert start!89030)

(declare-fun b!1020759 () Bool)

(declare-fun b_free!20101 () Bool)

(declare-fun b_next!20101 () Bool)

(assert (=> b!1020759 (= b_free!20101 (not b_next!20101))))

(declare-fun tp!71329 () Bool)

(declare-fun b_and!32263 () Bool)

(assert (=> b!1020759 (= tp!71329 b_and!32263)))

(declare-fun b!1020757 () Bool)

(declare-fun e!574667 () Bool)

(declare-fun tp_is_empty!23821 () Bool)

(assert (=> b!1020757 (= e!574667 tp_is_empty!23821)))

(declare-fun mapIsEmpty!37140 () Bool)

(declare-fun mapRes!37140 () Bool)

(assert (=> mapIsEmpty!37140 mapRes!37140))

(declare-fun b!1020758 () Bool)

(declare-fun e!574663 () Bool)

(declare-datatypes ((V!36635 0))(
  ( (V!36636 (val!11961 Int)) )
))
(declare-datatypes ((array!63619 0))(
  ( (array!63620 (arr!30624 (Array (_ BitVec 32) (_ BitVec 64))) (size!31137 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11207 0))(
  ( (ValueCellFull!11207 (v!14508 V!36635)) (EmptyCell!11207) )
))
(declare-datatypes ((array!63621 0))(
  ( (array!63622 (arr!30625 (Array (_ BitVec 32) ValueCell!11207)) (size!31138 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5008 0))(
  ( (LongMapFixedSize!5009 (defaultEntry!5856 Int) (mask!29408 (_ BitVec 32)) (extraKeys!5588 (_ BitVec 32)) (zeroValue!5692 V!36635) (minValue!5692 V!36635) (_size!2559 (_ BitVec 32)) (_keys!10997 array!63619) (_values!5879 array!63621) (_vacant!2559 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1074 0))(
  ( (Cell!1075 (v!14509 LongMapFixedSize!5008)) )
))
(declare-datatypes ((LongMap!1074 0))(
  ( (LongMap!1075 (underlying!548 Cell!1074)) )
))
(declare-fun thiss!908 () LongMap!1074)

(declare-fun valid!1910 (LongMapFixedSize!5008) Bool)

(assert (=> b!1020758 (= e!574663 (not (valid!1910 (v!14509 (underlying!548 thiss!908)))))))

(declare-fun e!574665 () Bool)

(declare-fun e!574668 () Bool)

(declare-fun array_inv!23767 (array!63619) Bool)

(declare-fun array_inv!23768 (array!63621) Bool)

(assert (=> b!1020759 (= e!574668 (and tp!71329 tp_is_empty!23821 (array_inv!23767 (_keys!10997 (v!14509 (underlying!548 thiss!908)))) (array_inv!23768 (_values!5879 (v!14509 (underlying!548 thiss!908)))) e!574665))))

(declare-fun b!1020760 () Bool)

(declare-fun e!574664 () Bool)

(declare-fun e!574669 () Bool)

(assert (=> b!1020760 (= e!574664 e!574669)))

(declare-fun mapNonEmpty!37140 () Bool)

(declare-fun tp!71328 () Bool)

(assert (=> mapNonEmpty!37140 (= mapRes!37140 (and tp!71328 e!574667))))

(declare-fun mapValue!37140 () ValueCell!11207)

(declare-fun mapRest!37140 () (Array (_ BitVec 32) ValueCell!11207))

(declare-fun mapKey!37140 () (_ BitVec 32))

(assert (=> mapNonEmpty!37140 (= (arr!30625 (_values!5879 (v!14509 (underlying!548 thiss!908)))) (store mapRest!37140 mapKey!37140 mapValue!37140))))

(declare-fun b!1020761 () Bool)

(assert (=> b!1020761 (= e!574669 e!574668)))

(declare-fun res!684229 () Bool)

(assert (=> start!89030 (=> (not res!684229) (not e!574663))))

(declare-fun valid!1911 (LongMap!1074) Bool)

(assert (=> start!89030 (= res!684229 (valid!1911 thiss!908))))

(assert (=> start!89030 e!574663))

(assert (=> start!89030 e!574664))

(declare-fun b!1020762 () Bool)

(declare-fun e!574670 () Bool)

(assert (=> b!1020762 (= e!574665 (and e!574670 mapRes!37140))))

(declare-fun condMapEmpty!37140 () Bool)

(declare-fun mapDefault!37140 () ValueCell!11207)

(assert (=> b!1020762 (= condMapEmpty!37140 (= (arr!30625 (_values!5879 (v!14509 (underlying!548 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11207)) mapDefault!37140)))))

(declare-fun b!1020763 () Bool)

(assert (=> b!1020763 (= e!574670 tp_is_empty!23821)))

(assert (= (and start!89030 res!684229) b!1020758))

(assert (= (and b!1020762 condMapEmpty!37140) mapIsEmpty!37140))

(assert (= (and b!1020762 (not condMapEmpty!37140)) mapNonEmpty!37140))

(get-info :version)

(assert (= (and mapNonEmpty!37140 ((_ is ValueCellFull!11207) mapValue!37140)) b!1020757))

(assert (= (and b!1020762 ((_ is ValueCellFull!11207) mapDefault!37140)) b!1020763))

(assert (= b!1020759 b!1020762))

(assert (= b!1020761 b!1020759))

(assert (= b!1020760 b!1020761))

(assert (= start!89030 b!1020760))

(declare-fun m!940013 () Bool)

(assert (=> b!1020758 m!940013))

(declare-fun m!940015 () Bool)

(assert (=> b!1020759 m!940015))

(declare-fun m!940017 () Bool)

(assert (=> b!1020759 m!940017))

(declare-fun m!940019 () Bool)

(assert (=> mapNonEmpty!37140 m!940019))

(declare-fun m!940021 () Bool)

(assert (=> start!89030 m!940021))

(check-sat (not start!89030) (not b!1020758) tp_is_empty!23821 (not b_next!20101) (not b!1020759) (not mapNonEmpty!37140) b_and!32263)
(check-sat b_and!32263 (not b_next!20101))
(get-model)

(declare-fun d!122327 () Bool)

(assert (=> d!122327 (= (valid!1911 thiss!908) (valid!1910 (v!14509 (underlying!548 thiss!908))))))

(declare-fun bs!29720 () Bool)

(assert (= bs!29720 d!122327))

(assert (=> bs!29720 m!940013))

(assert (=> start!89030 d!122327))

(declare-fun d!122329 () Bool)

(declare-fun res!684242 () Bool)

(declare-fun e!574721 () Bool)

(assert (=> d!122329 (=> (not res!684242) (not e!574721))))

(declare-fun simpleValid!385 (LongMapFixedSize!5008) Bool)

(assert (=> d!122329 (= res!684242 (simpleValid!385 (v!14509 (underlying!548 thiss!908))))))

(assert (=> d!122329 (= (valid!1910 (v!14509 (underlying!548 thiss!908))) e!574721)))

(declare-fun b!1020812 () Bool)

(declare-fun res!684243 () Bool)

(assert (=> b!1020812 (=> (not res!684243) (not e!574721))))

(declare-fun arrayCountValidKeys!0 (array!63619 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1020812 (= res!684243 (= (arrayCountValidKeys!0 (_keys!10997 (v!14509 (underlying!548 thiss!908))) #b00000000000000000000000000000000 (size!31137 (_keys!10997 (v!14509 (underlying!548 thiss!908))))) (_size!2559 (v!14509 (underlying!548 thiss!908)))))))

(declare-fun b!1020813 () Bool)

(declare-fun res!684244 () Bool)

(assert (=> b!1020813 (=> (not res!684244) (not e!574721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63619 (_ BitVec 32)) Bool)

(assert (=> b!1020813 (= res!684244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10997 (v!14509 (underlying!548 thiss!908))) (mask!29408 (v!14509 (underlying!548 thiss!908)))))))

(declare-fun b!1020814 () Bool)

(declare-datatypes ((List!21684 0))(
  ( (Nil!21681) (Cons!21680 (h!22878 (_ BitVec 64)) (t!30685 List!21684)) )
))
(declare-fun arrayNoDuplicates!0 (array!63619 (_ BitVec 32) List!21684) Bool)

(assert (=> b!1020814 (= e!574721 (arrayNoDuplicates!0 (_keys!10997 (v!14509 (underlying!548 thiss!908))) #b00000000000000000000000000000000 Nil!21681))))

(assert (= (and d!122329 res!684242) b!1020812))

(assert (= (and b!1020812 res!684243) b!1020813))

(assert (= (and b!1020813 res!684244) b!1020814))

(declare-fun m!940043 () Bool)

(assert (=> d!122329 m!940043))

(declare-fun m!940045 () Bool)

(assert (=> b!1020812 m!940045))

(declare-fun m!940047 () Bool)

(assert (=> b!1020813 m!940047))

(declare-fun m!940049 () Bool)

(assert (=> b!1020814 m!940049))

(assert (=> b!1020758 d!122329))

(declare-fun d!122331 () Bool)

(assert (=> d!122331 (= (array_inv!23767 (_keys!10997 (v!14509 (underlying!548 thiss!908)))) (bvsge (size!31137 (_keys!10997 (v!14509 (underlying!548 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1020759 d!122331))

(declare-fun d!122333 () Bool)

(assert (=> d!122333 (= (array_inv!23768 (_values!5879 (v!14509 (underlying!548 thiss!908)))) (bvsge (size!31138 (_values!5879 (v!14509 (underlying!548 thiss!908)))) #b00000000000000000000000000000000))))

(assert (=> b!1020759 d!122333))

(declare-fun mapIsEmpty!37149 () Bool)

(declare-fun mapRes!37149 () Bool)

(assert (=> mapIsEmpty!37149 mapRes!37149))

(declare-fun mapNonEmpty!37149 () Bool)

(declare-fun tp!71344 () Bool)

(declare-fun e!574727 () Bool)

(assert (=> mapNonEmpty!37149 (= mapRes!37149 (and tp!71344 e!574727))))

(declare-fun mapKey!37149 () (_ BitVec 32))

(declare-fun mapValue!37149 () ValueCell!11207)

(declare-fun mapRest!37149 () (Array (_ BitVec 32) ValueCell!11207))

(assert (=> mapNonEmpty!37149 (= mapRest!37140 (store mapRest!37149 mapKey!37149 mapValue!37149))))

(declare-fun b!1020822 () Bool)

(declare-fun e!574726 () Bool)

(assert (=> b!1020822 (= e!574726 tp_is_empty!23821)))

(declare-fun condMapEmpty!37149 () Bool)

(declare-fun mapDefault!37149 () ValueCell!11207)

(assert (=> mapNonEmpty!37140 (= condMapEmpty!37149 (= mapRest!37140 ((as const (Array (_ BitVec 32) ValueCell!11207)) mapDefault!37149)))))

(assert (=> mapNonEmpty!37140 (= tp!71328 (and e!574726 mapRes!37149))))

(declare-fun b!1020821 () Bool)

(assert (=> b!1020821 (= e!574727 tp_is_empty!23821)))

(assert (= (and mapNonEmpty!37140 condMapEmpty!37149) mapIsEmpty!37149))

(assert (= (and mapNonEmpty!37140 (not condMapEmpty!37149)) mapNonEmpty!37149))

(assert (= (and mapNonEmpty!37149 ((_ is ValueCellFull!11207) mapValue!37149)) b!1020821))

(assert (= (and mapNonEmpty!37140 ((_ is ValueCellFull!11207) mapDefault!37149)) b!1020822))

(declare-fun m!940051 () Bool)

(assert (=> mapNonEmpty!37149 m!940051))

(check-sat (not d!122329) tp_is_empty!23821 (not b_next!20101) (not mapNonEmpty!37149) (not d!122327) (not b!1020813) (not b!1020814) (not b!1020812) b_and!32263)
(check-sat b_and!32263 (not b_next!20101))
