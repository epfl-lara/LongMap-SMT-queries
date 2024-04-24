; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80106 () Bool)

(assert start!80106)

(declare-fun b!940773 () Bool)

(declare-fun b_free!17803 () Bool)

(declare-fun b_next!17803 () Bool)

(assert (=> b!940773 (= b_free!17803 (not b_next!17803))))

(declare-fun tp!61881 () Bool)

(declare-fun b_and!29225 () Bool)

(assert (=> b!940773 (= tp!61881 b_and!29225)))

(declare-fun mapNonEmpty!32254 () Bool)

(declare-fun mapRes!32254 () Bool)

(declare-fun tp!61882 () Bool)

(declare-fun e!528584 () Bool)

(assert (=> mapNonEmpty!32254 (= mapRes!32254 (and tp!61882 e!528584))))

(declare-datatypes ((V!32047 0))(
  ( (V!32048 (val!10206 Int)) )
))
(declare-datatypes ((ValueCell!9674 0))(
  ( (ValueCellFull!9674 (v!12734 V!32047)) (EmptyCell!9674) )
))
(declare-fun mapValue!32254 () ValueCell!9674)

(declare-datatypes ((array!56619 0))(
  ( (array!56620 (arr!27241 (Array (_ BitVec 32) ValueCell!9674)) (size!27703 (_ BitVec 32))) )
))
(declare-datatypes ((array!56621 0))(
  ( (array!56622 (arr!27242 (Array (_ BitVec 32) (_ BitVec 64))) (size!27704 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4498 0))(
  ( (LongMapFixedSize!4499 (defaultEntry!5540 Int) (mask!27107 (_ BitVec 32)) (extraKeys!5272 (_ BitVec 32)) (zeroValue!5376 V!32047) (minValue!5376 V!32047) (_size!2304 (_ BitVec 32)) (_keys!10418 array!56621) (_values!5563 array!56619) (_vacant!2304 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4498)

(declare-fun mapRest!32254 () (Array (_ BitVec 32) ValueCell!9674))

(declare-fun mapKey!32254 () (_ BitVec 32))

(assert (=> mapNonEmpty!32254 (= (arr!27241 (_values!5563 thiss!1141)) (store mapRest!32254 mapKey!32254 mapValue!32254))))

(declare-fun b!940770 () Bool)

(declare-fun res!632417 () Bool)

(declare-fun e!528589 () Bool)

(assert (=> b!940770 (=> (not res!632417) (not e!528589))))

(assert (=> b!940770 (= res!632417 (= (size!27704 (_keys!10418 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27107 thiss!1141))))))

(declare-fun b!940771 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!940771 (= e!528589 (not (validKeyInArray!0 key!756)))))

(declare-fun b!940772 () Bool)

(declare-fun e!528586 () Bool)

(declare-fun e!528588 () Bool)

(assert (=> b!940772 (= e!528586 (and e!528588 mapRes!32254))))

(declare-fun condMapEmpty!32254 () Bool)

(declare-fun mapDefault!32254 () ValueCell!9674)

(assert (=> b!940772 (= condMapEmpty!32254 (= (arr!27241 (_values!5563 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9674)) mapDefault!32254)))))

(declare-fun tp_is_empty!20311 () Bool)

(declare-fun e!528585 () Bool)

(declare-fun array_inv!21270 (array!56621) Bool)

(declare-fun array_inv!21271 (array!56619) Bool)

(assert (=> b!940773 (= e!528585 (and tp!61881 tp_is_empty!20311 (array_inv!21270 (_keys!10418 thiss!1141)) (array_inv!21271 (_values!5563 thiss!1141)) e!528586))))

(declare-fun b!940774 () Bool)

(assert (=> b!940774 (= e!528584 tp_is_empty!20311)))

(declare-fun b!940775 () Bool)

(declare-fun res!632416 () Bool)

(assert (=> b!940775 (=> (not res!632416) (not e!528589))))

(assert (=> b!940775 (= res!632416 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632415 () Bool)

(assert (=> start!80106 (=> (not res!632415) (not e!528589))))

(declare-fun valid!1735 (LongMapFixedSize!4498) Bool)

(assert (=> start!80106 (= res!632415 (valid!1735 thiss!1141))))

(assert (=> start!80106 e!528589))

(assert (=> start!80106 e!528585))

(assert (=> start!80106 true))

(declare-fun mapIsEmpty!32254 () Bool)

(assert (=> mapIsEmpty!32254 mapRes!32254))

(declare-fun b!940776 () Bool)

(declare-fun res!632418 () Bool)

(assert (=> b!940776 (=> (not res!632418) (not e!528589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940776 (= res!632418 (validMask!0 (mask!27107 thiss!1141)))))

(declare-fun b!940777 () Bool)

(assert (=> b!940777 (= e!528588 tp_is_empty!20311)))

(assert (= (and start!80106 res!632415) b!940775))

(assert (= (and b!940775 res!632416) b!940776))

(assert (= (and b!940776 res!632418) b!940770))

(assert (= (and b!940770 res!632417) b!940771))

(assert (= (and b!940772 condMapEmpty!32254) mapIsEmpty!32254))

(assert (= (and b!940772 (not condMapEmpty!32254)) mapNonEmpty!32254))

(get-info :version)

(assert (= (and mapNonEmpty!32254 ((_ is ValueCellFull!9674) mapValue!32254)) b!940774))

(assert (= (and b!940772 ((_ is ValueCellFull!9674) mapDefault!32254)) b!940777))

(assert (= b!940773 b!940772))

(assert (= start!80106 b!940773))

(declare-fun m!876841 () Bool)

(assert (=> start!80106 m!876841))

(declare-fun m!876843 () Bool)

(assert (=> b!940771 m!876843))

(declare-fun m!876845 () Bool)

(assert (=> b!940773 m!876845))

(declare-fun m!876847 () Bool)

(assert (=> b!940773 m!876847))

(declare-fun m!876849 () Bool)

(assert (=> mapNonEmpty!32254 m!876849))

(declare-fun m!876851 () Bool)

(assert (=> b!940776 m!876851))

(check-sat tp_is_empty!20311 (not mapNonEmpty!32254) (not start!80106) (not b!940771) b_and!29225 (not b!940776) (not b_next!17803) (not b!940773))
(check-sat b_and!29225 (not b_next!17803))
(get-model)

(declare-fun d!114311 () Bool)

(assert (=> d!114311 (= (array_inv!21270 (_keys!10418 thiss!1141)) (bvsge (size!27704 (_keys!10418 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940773 d!114311))

(declare-fun d!114313 () Bool)

(assert (=> d!114313 (= (array_inv!21271 (_values!5563 thiss!1141)) (bvsge (size!27703 (_values!5563 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940773 d!114313))

(declare-fun d!114315 () Bool)

(declare-fun res!632449 () Bool)

(declare-fun e!528628 () Bool)

(assert (=> d!114315 (=> (not res!632449) (not e!528628))))

(declare-fun simpleValid!338 (LongMapFixedSize!4498) Bool)

(assert (=> d!114315 (= res!632449 (simpleValid!338 thiss!1141))))

(assert (=> d!114315 (= (valid!1735 thiss!1141) e!528628)))

(declare-fun b!940832 () Bool)

(declare-fun res!632450 () Bool)

(assert (=> b!940832 (=> (not res!632450) (not e!528628))))

(declare-fun arrayCountValidKeys!0 (array!56621 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!940832 (= res!632450 (= (arrayCountValidKeys!0 (_keys!10418 thiss!1141) #b00000000000000000000000000000000 (size!27704 (_keys!10418 thiss!1141))) (_size!2304 thiss!1141)))))

(declare-fun b!940833 () Bool)

(declare-fun res!632451 () Bool)

(assert (=> b!940833 (=> (not res!632451) (not e!528628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56621 (_ BitVec 32)) Bool)

(assert (=> b!940833 (= res!632451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10418 thiss!1141) (mask!27107 thiss!1141)))))

(declare-fun b!940834 () Bool)

(declare-datatypes ((List!19167 0))(
  ( (Nil!19164) (Cons!19163 (h!20315 (_ BitVec 64)) (t!27474 List!19167)) )
))
(declare-fun arrayNoDuplicates!0 (array!56621 (_ BitVec 32) List!19167) Bool)

(assert (=> b!940834 (= e!528628 (arrayNoDuplicates!0 (_keys!10418 thiss!1141) #b00000000000000000000000000000000 Nil!19164))))

(assert (= (and d!114315 res!632449) b!940832))

(assert (= (and b!940832 res!632450) b!940833))

(assert (= (and b!940833 res!632451) b!940834))

(declare-fun m!876877 () Bool)

(assert (=> d!114315 m!876877))

(declare-fun m!876879 () Bool)

(assert (=> b!940832 m!876879))

(declare-fun m!876881 () Bool)

(assert (=> b!940833 m!876881))

(declare-fun m!876883 () Bool)

(assert (=> b!940834 m!876883))

(assert (=> start!80106 d!114315))

(declare-fun d!114317 () Bool)

(assert (=> d!114317 (= (validMask!0 (mask!27107 thiss!1141)) (and (or (= (mask!27107 thiss!1141) #b00000000000000000000000000000111) (= (mask!27107 thiss!1141) #b00000000000000000000000000001111) (= (mask!27107 thiss!1141) #b00000000000000000000000000011111) (= (mask!27107 thiss!1141) #b00000000000000000000000000111111) (= (mask!27107 thiss!1141) #b00000000000000000000000001111111) (= (mask!27107 thiss!1141) #b00000000000000000000000011111111) (= (mask!27107 thiss!1141) #b00000000000000000000000111111111) (= (mask!27107 thiss!1141) #b00000000000000000000001111111111) (= (mask!27107 thiss!1141) #b00000000000000000000011111111111) (= (mask!27107 thiss!1141) #b00000000000000000000111111111111) (= (mask!27107 thiss!1141) #b00000000000000000001111111111111) (= (mask!27107 thiss!1141) #b00000000000000000011111111111111) (= (mask!27107 thiss!1141) #b00000000000000000111111111111111) (= (mask!27107 thiss!1141) #b00000000000000001111111111111111) (= (mask!27107 thiss!1141) #b00000000000000011111111111111111) (= (mask!27107 thiss!1141) #b00000000000000111111111111111111) (= (mask!27107 thiss!1141) #b00000000000001111111111111111111) (= (mask!27107 thiss!1141) #b00000000000011111111111111111111) (= (mask!27107 thiss!1141) #b00000000000111111111111111111111) (= (mask!27107 thiss!1141) #b00000000001111111111111111111111) (= (mask!27107 thiss!1141) #b00000000011111111111111111111111) (= (mask!27107 thiss!1141) #b00000000111111111111111111111111) (= (mask!27107 thiss!1141) #b00000001111111111111111111111111) (= (mask!27107 thiss!1141) #b00000011111111111111111111111111) (= (mask!27107 thiss!1141) #b00000111111111111111111111111111) (= (mask!27107 thiss!1141) #b00001111111111111111111111111111) (= (mask!27107 thiss!1141) #b00011111111111111111111111111111) (= (mask!27107 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27107 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!940776 d!114317))

(declare-fun d!114319 () Bool)

(assert (=> d!114319 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!940771 d!114319))

(declare-fun mapNonEmpty!32263 () Bool)

(declare-fun mapRes!32263 () Bool)

(declare-fun tp!61897 () Bool)

(declare-fun e!528633 () Bool)

(assert (=> mapNonEmpty!32263 (= mapRes!32263 (and tp!61897 e!528633))))

(declare-fun mapKey!32263 () (_ BitVec 32))

(declare-fun mapRest!32263 () (Array (_ BitVec 32) ValueCell!9674))

(declare-fun mapValue!32263 () ValueCell!9674)

(assert (=> mapNonEmpty!32263 (= mapRest!32254 (store mapRest!32263 mapKey!32263 mapValue!32263))))

(declare-fun b!940842 () Bool)

(declare-fun e!528634 () Bool)

(assert (=> b!940842 (= e!528634 tp_is_empty!20311)))

(declare-fun condMapEmpty!32263 () Bool)

(declare-fun mapDefault!32263 () ValueCell!9674)

(assert (=> mapNonEmpty!32254 (= condMapEmpty!32263 (= mapRest!32254 ((as const (Array (_ BitVec 32) ValueCell!9674)) mapDefault!32263)))))

(assert (=> mapNonEmpty!32254 (= tp!61882 (and e!528634 mapRes!32263))))

(declare-fun mapIsEmpty!32263 () Bool)

(assert (=> mapIsEmpty!32263 mapRes!32263))

(declare-fun b!940841 () Bool)

(assert (=> b!940841 (= e!528633 tp_is_empty!20311)))

(assert (= (and mapNonEmpty!32254 condMapEmpty!32263) mapIsEmpty!32263))

(assert (= (and mapNonEmpty!32254 (not condMapEmpty!32263)) mapNonEmpty!32263))

(assert (= (and mapNonEmpty!32263 ((_ is ValueCellFull!9674) mapValue!32263)) b!940841))

(assert (= (and mapNonEmpty!32254 ((_ is ValueCellFull!9674) mapDefault!32263)) b!940842))

(declare-fun m!876885 () Bool)

(assert (=> mapNonEmpty!32263 m!876885))

(check-sat tp_is_empty!20311 (not b!940832) (not mapNonEmpty!32263) (not b!940833) b_and!29225 (not b_next!17803) (not d!114315) (not b!940834))
(check-sat b_and!29225 (not b_next!17803))
