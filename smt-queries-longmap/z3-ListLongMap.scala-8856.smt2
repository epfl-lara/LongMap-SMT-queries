; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107658 () Bool)

(assert start!107658)

(declare-fun b!1274019 () Bool)

(declare-fun b_free!27679 () Bool)

(declare-fun b_next!27679 () Bool)

(assert (=> b!1274019 (= b_free!27679 (not b_next!27679))))

(declare-fun tp!97561 () Bool)

(declare-fun b_and!45737 () Bool)

(assert (=> b!1274019 (= tp!97561 b_and!45737)))

(declare-fun res!847038 () Bool)

(declare-fun e!726825 () Bool)

(assert (=> start!107658 (=> (not res!847038) (not e!726825))))

(declare-datatypes ((V!49259 0))(
  ( (V!49260 (val!16599 Int)) )
))
(declare-datatypes ((ValueCell!15671 0))(
  ( (ValueCellFull!15671 (v!19231 V!49259)) (EmptyCell!15671) )
))
(declare-datatypes ((array!83373 0))(
  ( (array!83374 (arr!40214 (Array (_ BitVec 32) ValueCell!15671)) (size!40754 (_ BitVec 32))) )
))
(declare-datatypes ((array!83375 0))(
  ( (array!83376 (arr!40215 (Array (_ BitVec 32) (_ BitVec 64))) (size!40755 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6106 0))(
  ( (LongMapFixedSize!6107 (defaultEntry!6699 Int) (mask!34515 (_ BitVec 32)) (extraKeys!6378 (_ BitVec 32)) (zeroValue!6484 V!49259) (minValue!6484 V!49259) (_size!3108 (_ BitVec 32)) (_keys!12146 array!83375) (_values!6722 array!83373) (_vacant!3108 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6106)

(declare-fun valid!2294 (LongMapFixedSize!6106) Bool)

(assert (=> start!107658 (= res!847038 (valid!2294 thiss!1559))))

(assert (=> start!107658 e!726825))

(declare-fun e!726824 () Bool)

(assert (=> start!107658 e!726824))

(declare-fun b!1274017 () Bool)

(declare-fun e!726826 () Bool)

(declare-fun tp_is_empty!33049 () Bool)

(assert (=> b!1274017 (= e!726826 tp_is_empty!33049)))

(declare-fun b!1274018 () Bool)

(declare-fun e!726827 () Bool)

(assert (=> b!1274018 (= e!726827 tp_is_empty!33049)))

(declare-fun e!726822 () Bool)

(declare-fun array_inv!30751 (array!83375) Bool)

(declare-fun array_inv!30752 (array!83373) Bool)

(assert (=> b!1274019 (= e!726824 (and tp!97561 tp_is_empty!33049 (array_inv!30751 (_keys!12146 thiss!1559)) (array_inv!30752 (_values!6722 thiss!1559)) e!726822))))

(declare-fun b!1274020 () Bool)

(declare-fun mapRes!51172 () Bool)

(assert (=> b!1274020 (= e!726822 (and e!726827 mapRes!51172))))

(declare-fun condMapEmpty!51172 () Bool)

(declare-fun mapDefault!51172 () ValueCell!15671)

(assert (=> b!1274020 (= condMapEmpty!51172 (= (arr!40214 (_values!6722 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15671)) mapDefault!51172)))))

(declare-fun b!1274021 () Bool)

(assert (=> b!1274021 (= e!726825 (and (= (size!40754 (_values!6722 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34515 thiss!1559))) (= (size!40755 (_keys!12146 thiss!1559)) (size!40754 (_values!6722 thiss!1559))) (bvslt (mask!34515 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!51172 () Bool)

(declare-fun tp!97560 () Bool)

(assert (=> mapNonEmpty!51172 (= mapRes!51172 (and tp!97560 e!726826))))

(declare-fun mapRest!51172 () (Array (_ BitVec 32) ValueCell!15671))

(declare-fun mapKey!51172 () (_ BitVec 32))

(declare-fun mapValue!51172 () ValueCell!15671)

(assert (=> mapNonEmpty!51172 (= (arr!40214 (_values!6722 thiss!1559)) (store mapRest!51172 mapKey!51172 mapValue!51172))))

(declare-fun b!1274022 () Bool)

(declare-fun res!847039 () Bool)

(assert (=> b!1274022 (=> (not res!847039) (not e!726825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274022 (= res!847039 (validMask!0 (mask!34515 thiss!1559)))))

(declare-fun mapIsEmpty!51172 () Bool)

(assert (=> mapIsEmpty!51172 mapRes!51172))

(assert (= (and start!107658 res!847038) b!1274022))

(assert (= (and b!1274022 res!847039) b!1274021))

(assert (= (and b!1274020 condMapEmpty!51172) mapIsEmpty!51172))

(assert (= (and b!1274020 (not condMapEmpty!51172)) mapNonEmpty!51172))

(get-info :version)

(assert (= (and mapNonEmpty!51172 ((_ is ValueCellFull!15671) mapValue!51172)) b!1274017))

(assert (= (and b!1274020 ((_ is ValueCellFull!15671) mapDefault!51172)) b!1274018))

(assert (= b!1274019 b!1274020))

(assert (= start!107658 b!1274019))

(declare-fun m!1171857 () Bool)

(assert (=> start!107658 m!1171857))

(declare-fun m!1171859 () Bool)

(assert (=> b!1274019 m!1171859))

(declare-fun m!1171861 () Bool)

(assert (=> b!1274019 m!1171861))

(declare-fun m!1171863 () Bool)

(assert (=> mapNonEmpty!51172 m!1171863))

(declare-fun m!1171865 () Bool)

(assert (=> b!1274022 m!1171865))

(check-sat (not start!107658) (not b!1274019) tp_is_empty!33049 (not mapNonEmpty!51172) (not b!1274022) b_and!45737 (not b_next!27679))
(check-sat b_and!45737 (not b_next!27679))
(get-model)

(declare-fun d!140347 () Bool)

(assert (=> d!140347 (= (array_inv!30751 (_keys!12146 thiss!1559)) (bvsge (size!40755 (_keys!12146 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274019 d!140347))

(declare-fun d!140349 () Bool)

(assert (=> d!140349 (= (array_inv!30752 (_values!6722 thiss!1559)) (bvsge (size!40754 (_values!6722 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274019 d!140349))

(declare-fun d!140351 () Bool)

(declare-fun res!847058 () Bool)

(declare-fun e!726866 () Bool)

(assert (=> d!140351 (=> (not res!847058) (not e!726866))))

(declare-fun simpleValid!458 (LongMapFixedSize!6106) Bool)

(assert (=> d!140351 (= res!847058 (simpleValid!458 thiss!1559))))

(assert (=> d!140351 (= (valid!2294 thiss!1559) e!726866)))

(declare-fun b!1274065 () Bool)

(declare-fun res!847059 () Bool)

(assert (=> b!1274065 (=> (not res!847059) (not e!726866))))

(declare-fun arrayCountValidKeys!0 (array!83375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274065 (= res!847059 (= (arrayCountValidKeys!0 (_keys!12146 thiss!1559) #b00000000000000000000000000000000 (size!40755 (_keys!12146 thiss!1559))) (_size!3108 thiss!1559)))))

(declare-fun b!1274066 () Bool)

(declare-fun res!847060 () Bool)

(assert (=> b!1274066 (=> (not res!847060) (not e!726866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83375 (_ BitVec 32)) Bool)

(assert (=> b!1274066 (= res!847060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12146 thiss!1559) (mask!34515 thiss!1559)))))

(declare-fun b!1274067 () Bool)

(declare-datatypes ((List!28587 0))(
  ( (Nil!28584) (Cons!28583 (h!29801 (_ BitVec 64)) (t!42112 List!28587)) )
))
(declare-fun arrayNoDuplicates!0 (array!83375 (_ BitVec 32) List!28587) Bool)

(assert (=> b!1274067 (= e!726866 (arrayNoDuplicates!0 (_keys!12146 thiss!1559) #b00000000000000000000000000000000 Nil!28584))))

(assert (= (and d!140351 res!847058) b!1274065))

(assert (= (and b!1274065 res!847059) b!1274066))

(assert (= (and b!1274066 res!847060) b!1274067))

(declare-fun m!1171887 () Bool)

(assert (=> d!140351 m!1171887))

(declare-fun m!1171889 () Bool)

(assert (=> b!1274065 m!1171889))

(declare-fun m!1171891 () Bool)

(assert (=> b!1274066 m!1171891))

(declare-fun m!1171893 () Bool)

(assert (=> b!1274067 m!1171893))

(assert (=> start!107658 d!140351))

(declare-fun d!140353 () Bool)

(assert (=> d!140353 (= (validMask!0 (mask!34515 thiss!1559)) (and (or (= (mask!34515 thiss!1559) #b00000000000000000000000000000111) (= (mask!34515 thiss!1559) #b00000000000000000000000000001111) (= (mask!34515 thiss!1559) #b00000000000000000000000000011111) (= (mask!34515 thiss!1559) #b00000000000000000000000000111111) (= (mask!34515 thiss!1559) #b00000000000000000000000001111111) (= (mask!34515 thiss!1559) #b00000000000000000000000011111111) (= (mask!34515 thiss!1559) #b00000000000000000000000111111111) (= (mask!34515 thiss!1559) #b00000000000000000000001111111111) (= (mask!34515 thiss!1559) #b00000000000000000000011111111111) (= (mask!34515 thiss!1559) #b00000000000000000000111111111111) (= (mask!34515 thiss!1559) #b00000000000000000001111111111111) (= (mask!34515 thiss!1559) #b00000000000000000011111111111111) (= (mask!34515 thiss!1559) #b00000000000000000111111111111111) (= (mask!34515 thiss!1559) #b00000000000000001111111111111111) (= (mask!34515 thiss!1559) #b00000000000000011111111111111111) (= (mask!34515 thiss!1559) #b00000000000000111111111111111111) (= (mask!34515 thiss!1559) #b00000000000001111111111111111111) (= (mask!34515 thiss!1559) #b00000000000011111111111111111111) (= (mask!34515 thiss!1559) #b00000000000111111111111111111111) (= (mask!34515 thiss!1559) #b00000000001111111111111111111111) (= (mask!34515 thiss!1559) #b00000000011111111111111111111111) (= (mask!34515 thiss!1559) #b00000000111111111111111111111111) (= (mask!34515 thiss!1559) #b00000001111111111111111111111111) (= (mask!34515 thiss!1559) #b00000011111111111111111111111111) (= (mask!34515 thiss!1559) #b00000111111111111111111111111111) (= (mask!34515 thiss!1559) #b00001111111111111111111111111111) (= (mask!34515 thiss!1559) #b00011111111111111111111111111111) (= (mask!34515 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34515 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1274022 d!140353))

(declare-fun condMapEmpty!51181 () Bool)

(declare-fun mapDefault!51181 () ValueCell!15671)

(assert (=> mapNonEmpty!51172 (= condMapEmpty!51181 (= mapRest!51172 ((as const (Array (_ BitVec 32) ValueCell!15671)) mapDefault!51181)))))

(declare-fun e!726871 () Bool)

(declare-fun mapRes!51181 () Bool)

(assert (=> mapNonEmpty!51172 (= tp!97560 (and e!726871 mapRes!51181))))

(declare-fun mapNonEmpty!51181 () Bool)

(declare-fun tp!97576 () Bool)

(declare-fun e!726872 () Bool)

(assert (=> mapNonEmpty!51181 (= mapRes!51181 (and tp!97576 e!726872))))

(declare-fun mapKey!51181 () (_ BitVec 32))

(declare-fun mapValue!51181 () ValueCell!15671)

(declare-fun mapRest!51181 () (Array (_ BitVec 32) ValueCell!15671))

(assert (=> mapNonEmpty!51181 (= mapRest!51172 (store mapRest!51181 mapKey!51181 mapValue!51181))))

(declare-fun mapIsEmpty!51181 () Bool)

(assert (=> mapIsEmpty!51181 mapRes!51181))

(declare-fun b!1274075 () Bool)

(assert (=> b!1274075 (= e!726871 tp_is_empty!33049)))

(declare-fun b!1274074 () Bool)

(assert (=> b!1274074 (= e!726872 tp_is_empty!33049)))

(assert (= (and mapNonEmpty!51172 condMapEmpty!51181) mapIsEmpty!51181))

(assert (= (and mapNonEmpty!51172 (not condMapEmpty!51181)) mapNonEmpty!51181))

(assert (= (and mapNonEmpty!51181 ((_ is ValueCellFull!15671) mapValue!51181)) b!1274074))

(assert (= (and mapNonEmpty!51172 ((_ is ValueCellFull!15671) mapDefault!51181)) b!1274075))

(declare-fun m!1171895 () Bool)

(assert (=> mapNonEmpty!51181 m!1171895))

(check-sat (not mapNonEmpty!51181) b_and!45737 (not b!1274066) (not d!140351) (not b!1274067) tp_is_empty!33049 (not b!1274065) (not b_next!27679))
(check-sat b_and!45737 (not b_next!27679))
