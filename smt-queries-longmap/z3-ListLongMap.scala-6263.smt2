; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80026 () Bool)

(assert start!80026)

(declare-fun b!940894 () Bool)

(declare-fun b_free!17899 () Bool)

(declare-fun b_next!17899 () Bool)

(assert (=> b!940894 (= b_free!17899 (not b_next!17899))))

(declare-fun tp!62172 () Bool)

(declare-fun b_and!29285 () Bool)

(assert (=> b!940894 (= tp!62172 b_and!29285)))

(declare-fun e!528916 () Bool)

(declare-fun tp_is_empty!20407 () Bool)

(declare-fun e!528917 () Bool)

(declare-datatypes ((V!32175 0))(
  ( (V!32176 (val!10254 Int)) )
))
(declare-datatypes ((ValueCell!9722 0))(
  ( (ValueCellFull!9722 (v!12784 V!32175)) (EmptyCell!9722) )
))
(declare-datatypes ((array!56727 0))(
  ( (array!56728 (arr!27299 (Array (_ BitVec 32) ValueCell!9722)) (size!27762 (_ BitVec 32))) )
))
(declare-datatypes ((array!56729 0))(
  ( (array!56730 (arr!27300 (Array (_ BitVec 32) (_ BitVec 64))) (size!27763 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4594 0))(
  ( (LongMapFixedSize!4595 (defaultEntry!5588 Int) (mask!27138 (_ BitVec 32)) (extraKeys!5320 (_ BitVec 32)) (zeroValue!5424 V!32175) (minValue!5424 V!32175) (_size!2352 (_ BitVec 32)) (_keys!10433 array!56729) (_values!5611 array!56727) (_vacant!2352 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4594)

(declare-fun array_inv!21282 (array!56729) Bool)

(declare-fun array_inv!21283 (array!56727) Bool)

(assert (=> b!940894 (= e!528917 (and tp!62172 tp_is_empty!20407 (array_inv!21282 (_keys!10433 thiss!1141)) (array_inv!21283 (_values!5611 thiss!1141)) e!528916))))

(declare-fun mapNonEmpty!32401 () Bool)

(declare-fun mapRes!32401 () Bool)

(declare-fun tp!62173 () Bool)

(declare-fun e!528918 () Bool)

(assert (=> mapNonEmpty!32401 (= mapRes!32401 (and tp!62173 e!528918))))

(declare-fun mapRest!32401 () (Array (_ BitVec 32) ValueCell!9722))

(declare-fun mapValue!32401 () ValueCell!9722)

(declare-fun mapKey!32401 () (_ BitVec 32))

(assert (=> mapNonEmpty!32401 (= (arr!27299 (_values!5611 thiss!1141)) (store mapRest!32401 mapKey!32401 mapValue!32401))))

(declare-fun b!940895 () Bool)

(declare-fun e!528919 () Bool)

(assert (=> b!940895 (= e!528916 (and e!528919 mapRes!32401))))

(declare-fun condMapEmpty!32401 () Bool)

(declare-fun mapDefault!32401 () ValueCell!9722)

(assert (=> b!940895 (= condMapEmpty!32401 (= (arr!27299 (_values!5611 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9722)) mapDefault!32401)))))

(declare-fun b!940896 () Bool)

(declare-fun res!632644 () Bool)

(declare-fun e!528920 () Bool)

(assert (=> b!940896 (=> (not res!632644) (not e!528920))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9016 0))(
  ( (MissingZero!9016 (index!38435 (_ BitVec 32))) (Found!9016 (index!38436 (_ BitVec 32))) (Intermediate!9016 (undefined!9828 Bool) (index!38437 (_ BitVec 32)) (x!80736 (_ BitVec 32))) (Undefined!9016) (MissingVacant!9016 (index!38438 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56729 (_ BitVec 32)) SeekEntryResult!9016)

(assert (=> b!940896 (= res!632644 (not ((_ is Found!9016) (seekEntry!0 key!756 (_keys!10433 thiss!1141) (mask!27138 thiss!1141)))))))

(declare-fun mapIsEmpty!32401 () Bool)

(assert (=> mapIsEmpty!32401 mapRes!32401))

(declare-fun res!632643 () Bool)

(assert (=> start!80026 (=> (not res!632643) (not e!528920))))

(declare-fun valid!1768 (LongMapFixedSize!4594) Bool)

(assert (=> start!80026 (= res!632643 (valid!1768 thiss!1141))))

(assert (=> start!80026 e!528920))

(assert (=> start!80026 e!528917))

(assert (=> start!80026 true))

(declare-fun b!940897 () Bool)

(assert (=> b!940897 (= e!528919 tp_is_empty!20407)))

(declare-fun b!940898 () Bool)

(declare-fun res!632645 () Bool)

(assert (=> b!940898 (=> (not res!632645) (not e!528920))))

(assert (=> b!940898 (= res!632645 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940899 () Bool)

(assert (=> b!940899 (= e!528918 tp_is_empty!20407)))

(declare-fun b!940900 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940900 (= e!528920 (not (validMask!0 (mask!27138 thiss!1141))))))

(assert (= (and start!80026 res!632643) b!940898))

(assert (= (and b!940898 res!632645) b!940896))

(assert (= (and b!940896 res!632644) b!940900))

(assert (= (and b!940895 condMapEmpty!32401) mapIsEmpty!32401))

(assert (= (and b!940895 (not condMapEmpty!32401)) mapNonEmpty!32401))

(assert (= (and mapNonEmpty!32401 ((_ is ValueCellFull!9722) mapValue!32401)) b!940899))

(assert (= (and b!940895 ((_ is ValueCellFull!9722) mapDefault!32401)) b!940897))

(assert (= b!940894 b!940895))

(assert (= start!80026 b!940894))

(declare-fun m!875621 () Bool)

(assert (=> b!940896 m!875621))

(declare-fun m!875623 () Bool)

(assert (=> b!940894 m!875623))

(declare-fun m!875625 () Bool)

(assert (=> b!940894 m!875625))

(declare-fun m!875627 () Bool)

(assert (=> mapNonEmpty!32401 m!875627))

(declare-fun m!875629 () Bool)

(assert (=> start!80026 m!875629))

(declare-fun m!875631 () Bool)

(assert (=> b!940900 m!875631))

(check-sat (not start!80026) (not b!940896) tp_is_empty!20407 b_and!29285 (not mapNonEmpty!32401) (not b!940894) (not b_next!17899) (not b!940900))
(check-sat b_and!29285 (not b_next!17899))
(get-model)

(declare-fun d!113833 () Bool)

(assert (=> d!113833 (= (array_inv!21282 (_keys!10433 thiss!1141)) (bvsge (size!27763 (_keys!10433 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940894 d!113833))

(declare-fun d!113835 () Bool)

(assert (=> d!113835 (= (array_inv!21283 (_values!5611 thiss!1141)) (bvsge (size!27762 (_values!5611 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!940894 d!113835))

(declare-fun d!113837 () Bool)

(declare-fun lt!424697 () SeekEntryResult!9016)

(assert (=> d!113837 (and (or ((_ is MissingVacant!9016) lt!424697) (not ((_ is Found!9016) lt!424697)) (and (bvsge (index!38436 lt!424697) #b00000000000000000000000000000000) (bvslt (index!38436 lt!424697) (size!27763 (_keys!10433 thiss!1141))))) (not ((_ is MissingVacant!9016) lt!424697)) (or (not ((_ is Found!9016) lt!424697)) (= (select (arr!27300 (_keys!10433 thiss!1141)) (index!38436 lt!424697)) key!756)))))

(declare-fun e!528965 () SeekEntryResult!9016)

(assert (=> d!113837 (= lt!424697 e!528965)))

(declare-fun c!97969 () Bool)

(declare-fun lt!424696 () SeekEntryResult!9016)

(assert (=> d!113837 (= c!97969 (and ((_ is Intermediate!9016) lt!424696) (undefined!9828 lt!424696)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56729 (_ BitVec 32)) SeekEntryResult!9016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!113837 (= lt!424696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27138 thiss!1141)) key!756 (_keys!10433 thiss!1141) (mask!27138 thiss!1141)))))

(assert (=> d!113837 (validMask!0 (mask!27138 thiss!1141))))

(assert (=> d!113837 (= (seekEntry!0 key!756 (_keys!10433 thiss!1141) (mask!27138 thiss!1141)) lt!424697)))

(declare-fun b!940955 () Bool)

(declare-fun c!97968 () Bool)

(declare-fun lt!424694 () (_ BitVec 64))

(assert (=> b!940955 (= c!97968 (= lt!424694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!528964 () SeekEntryResult!9016)

(declare-fun e!528966 () SeekEntryResult!9016)

(assert (=> b!940955 (= e!528964 e!528966)))

(declare-fun b!940956 () Bool)

(assert (=> b!940956 (= e!528966 (MissingZero!9016 (index!38437 lt!424696)))))

(declare-fun b!940957 () Bool)

(assert (=> b!940957 (= e!528965 e!528964)))

(assert (=> b!940957 (= lt!424694 (select (arr!27300 (_keys!10433 thiss!1141)) (index!38437 lt!424696)))))

(declare-fun c!97970 () Bool)

(assert (=> b!940957 (= c!97970 (= lt!424694 key!756))))

(declare-fun b!940958 () Bool)

(declare-fun lt!424695 () SeekEntryResult!9016)

(assert (=> b!940958 (= e!528966 (ite ((_ is MissingVacant!9016) lt!424695) (MissingZero!9016 (index!38438 lt!424695)) lt!424695))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56729 (_ BitVec 32)) SeekEntryResult!9016)

(assert (=> b!940958 (= lt!424695 (seekKeyOrZeroReturnVacant!0 (x!80736 lt!424696) (index!38437 lt!424696) (index!38437 lt!424696) key!756 (_keys!10433 thiss!1141) (mask!27138 thiss!1141)))))

(declare-fun b!940959 () Bool)

(assert (=> b!940959 (= e!528965 Undefined!9016)))

(declare-fun b!940960 () Bool)

(assert (=> b!940960 (= e!528964 (Found!9016 (index!38437 lt!424696)))))

(assert (= (and d!113837 c!97969) b!940959))

(assert (= (and d!113837 (not c!97969)) b!940957))

(assert (= (and b!940957 c!97970) b!940960))

(assert (= (and b!940957 (not c!97970)) b!940955))

(assert (= (and b!940955 c!97968) b!940956))

(assert (= (and b!940955 (not c!97968)) b!940958))

(declare-fun m!875657 () Bool)

(assert (=> d!113837 m!875657))

(declare-fun m!875659 () Bool)

(assert (=> d!113837 m!875659))

(assert (=> d!113837 m!875659))

(declare-fun m!875661 () Bool)

(assert (=> d!113837 m!875661))

(assert (=> d!113837 m!875631))

(declare-fun m!875663 () Bool)

(assert (=> b!940957 m!875663))

(declare-fun m!875665 () Bool)

(assert (=> b!940958 m!875665))

(assert (=> b!940896 d!113837))

(declare-fun d!113839 () Bool)

(assert (=> d!113839 (= (validMask!0 (mask!27138 thiss!1141)) (and (or (= (mask!27138 thiss!1141) #b00000000000000000000000000000111) (= (mask!27138 thiss!1141) #b00000000000000000000000000001111) (= (mask!27138 thiss!1141) #b00000000000000000000000000011111) (= (mask!27138 thiss!1141) #b00000000000000000000000000111111) (= (mask!27138 thiss!1141) #b00000000000000000000000001111111) (= (mask!27138 thiss!1141) #b00000000000000000000000011111111) (= (mask!27138 thiss!1141) #b00000000000000000000000111111111) (= (mask!27138 thiss!1141) #b00000000000000000000001111111111) (= (mask!27138 thiss!1141) #b00000000000000000000011111111111) (= (mask!27138 thiss!1141) #b00000000000000000000111111111111) (= (mask!27138 thiss!1141) #b00000000000000000001111111111111) (= (mask!27138 thiss!1141) #b00000000000000000011111111111111) (= (mask!27138 thiss!1141) #b00000000000000000111111111111111) (= (mask!27138 thiss!1141) #b00000000000000001111111111111111) (= (mask!27138 thiss!1141) #b00000000000000011111111111111111) (= (mask!27138 thiss!1141) #b00000000000000111111111111111111) (= (mask!27138 thiss!1141) #b00000000000001111111111111111111) (= (mask!27138 thiss!1141) #b00000000000011111111111111111111) (= (mask!27138 thiss!1141) #b00000000000111111111111111111111) (= (mask!27138 thiss!1141) #b00000000001111111111111111111111) (= (mask!27138 thiss!1141) #b00000000011111111111111111111111) (= (mask!27138 thiss!1141) #b00000000111111111111111111111111) (= (mask!27138 thiss!1141) #b00000001111111111111111111111111) (= (mask!27138 thiss!1141) #b00000011111111111111111111111111) (= (mask!27138 thiss!1141) #b00000111111111111111111111111111) (= (mask!27138 thiss!1141) #b00001111111111111111111111111111) (= (mask!27138 thiss!1141) #b00011111111111111111111111111111) (= (mask!27138 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27138 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!940900 d!113839))

(declare-fun d!113841 () Bool)

(declare-fun res!632670 () Bool)

(declare-fun e!528969 () Bool)

(assert (=> d!113841 (=> (not res!632670) (not e!528969))))

(declare-fun simpleValid!339 (LongMapFixedSize!4594) Bool)

(assert (=> d!113841 (= res!632670 (simpleValid!339 thiss!1141))))

(assert (=> d!113841 (= (valid!1768 thiss!1141) e!528969)))

(declare-fun b!940967 () Bool)

(declare-fun res!632671 () Bool)

(assert (=> b!940967 (=> (not res!632671) (not e!528969))))

(declare-fun arrayCountValidKeys!0 (array!56729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!940967 (= res!632671 (= (arrayCountValidKeys!0 (_keys!10433 thiss!1141) #b00000000000000000000000000000000 (size!27763 (_keys!10433 thiss!1141))) (_size!2352 thiss!1141)))))

(declare-fun b!940968 () Bool)

(declare-fun res!632672 () Bool)

(assert (=> b!940968 (=> (not res!632672) (not e!528969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56729 (_ BitVec 32)) Bool)

(assert (=> b!940968 (= res!632672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10433 thiss!1141) (mask!27138 thiss!1141)))))

(declare-fun b!940969 () Bool)

(declare-datatypes ((List!19215 0))(
  ( (Nil!19212) (Cons!19211 (h!20357 (_ BitVec 64)) (t!27521 List!19215)) )
))
(declare-fun arrayNoDuplicates!0 (array!56729 (_ BitVec 32) List!19215) Bool)

(assert (=> b!940969 (= e!528969 (arrayNoDuplicates!0 (_keys!10433 thiss!1141) #b00000000000000000000000000000000 Nil!19212))))

(assert (= (and d!113841 res!632670) b!940967))

(assert (= (and b!940967 res!632671) b!940968))

(assert (= (and b!940968 res!632672) b!940969))

(declare-fun m!875667 () Bool)

(assert (=> d!113841 m!875667))

(declare-fun m!875669 () Bool)

(assert (=> b!940967 m!875669))

(declare-fun m!875671 () Bool)

(assert (=> b!940968 m!875671))

(declare-fun m!875673 () Bool)

(assert (=> b!940969 m!875673))

(assert (=> start!80026 d!113841))

(declare-fun mapNonEmpty!32410 () Bool)

(declare-fun mapRes!32410 () Bool)

(declare-fun tp!62188 () Bool)

(declare-fun e!528974 () Bool)

(assert (=> mapNonEmpty!32410 (= mapRes!32410 (and tp!62188 e!528974))))

(declare-fun mapRest!32410 () (Array (_ BitVec 32) ValueCell!9722))

(declare-fun mapKey!32410 () (_ BitVec 32))

(declare-fun mapValue!32410 () ValueCell!9722)

(assert (=> mapNonEmpty!32410 (= mapRest!32401 (store mapRest!32410 mapKey!32410 mapValue!32410))))

(declare-fun b!940977 () Bool)

(declare-fun e!528975 () Bool)

(assert (=> b!940977 (= e!528975 tp_is_empty!20407)))

(declare-fun mapIsEmpty!32410 () Bool)

(assert (=> mapIsEmpty!32410 mapRes!32410))

(declare-fun condMapEmpty!32410 () Bool)

(declare-fun mapDefault!32410 () ValueCell!9722)

(assert (=> mapNonEmpty!32401 (= condMapEmpty!32410 (= mapRest!32401 ((as const (Array (_ BitVec 32) ValueCell!9722)) mapDefault!32410)))))

(assert (=> mapNonEmpty!32401 (= tp!62173 (and e!528975 mapRes!32410))))

(declare-fun b!940976 () Bool)

(assert (=> b!940976 (= e!528974 tp_is_empty!20407)))

(assert (= (and mapNonEmpty!32401 condMapEmpty!32410) mapIsEmpty!32410))

(assert (= (and mapNonEmpty!32401 (not condMapEmpty!32410)) mapNonEmpty!32410))

(assert (= (and mapNonEmpty!32410 ((_ is ValueCellFull!9722) mapValue!32410)) b!940976))

(assert (= (and mapNonEmpty!32401 ((_ is ValueCellFull!9722) mapDefault!32410)) b!940977))

(declare-fun m!875675 () Bool)

(assert (=> mapNonEmpty!32410 m!875675))

(check-sat (not d!113837) (not d!113841) tp_is_empty!20407 (not b!940967) b_and!29285 (not b!940968) (not b!940958) (not b!940969) (not mapNonEmpty!32410) (not b_next!17899))
(check-sat b_and!29285 (not b_next!17899))
