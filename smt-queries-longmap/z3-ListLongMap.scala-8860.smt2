; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107508 () Bool)

(assert start!107508)

(declare-fun b!1273065 () Bool)

(declare-fun b_free!27703 () Bool)

(declare-fun b_next!27703 () Bool)

(assert (=> b!1273065 (= b_free!27703 (not b_next!27703))))

(declare-fun tp!97647 () Bool)

(declare-fun b_and!45741 () Bool)

(assert (=> b!1273065 (= tp!97647 b_and!45741)))

(declare-fun b!1273063 () Bool)

(declare-fun res!846673 () Bool)

(declare-fun e!726271 () Bool)

(assert (=> b!1273063 (=> (not res!846673) (not e!726271))))

(declare-datatypes ((V!49291 0))(
  ( (V!49292 (val!16611 Int)) )
))
(declare-datatypes ((ValueCell!15683 0))(
  ( (ValueCellFull!15683 (v!19247 V!49291)) (EmptyCell!15683) )
))
(declare-datatypes ((array!83311 0))(
  ( (array!83312 (arr!40184 (Array (_ BitVec 32) ValueCell!15683)) (size!40727 (_ BitVec 32))) )
))
(declare-datatypes ((array!83313 0))(
  ( (array!83314 (arr!40185 (Array (_ BitVec 32) (_ BitVec 64))) (size!40728 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6130 0))(
  ( (LongMapFixedSize!6131 (defaultEntry!6711 Int) (mask!34477 (_ BitVec 32)) (extraKeys!6390 (_ BitVec 32)) (zeroValue!6496 V!49291) (minValue!6496 V!49291) (_size!3120 (_ BitVec 32)) (_keys!12119 array!83313) (_values!6734 array!83311) (_vacant!3120 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6130)

(assert (=> b!1273063 (= res!846673 (and (= (size!40727 (_values!6734 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34477 thiss!1559))) (= (size!40728 (_keys!12119 thiss!1559)) (size!40727 (_values!6734 thiss!1559))) (bvsge (mask!34477 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6390 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6390 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1273064 () Bool)

(declare-fun res!846675 () Bool)

(assert (=> b!1273064 (=> (not res!846675) (not e!726271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273064 (= res!846675 (validMask!0 (mask!34477 thiss!1559)))))

(declare-fun e!726275 () Bool)

(declare-fun e!726274 () Bool)

(declare-fun tp_is_empty!33073 () Bool)

(declare-fun array_inv!30711 (array!83313) Bool)

(declare-fun array_inv!30712 (array!83311) Bool)

(assert (=> b!1273065 (= e!726274 (and tp!97647 tp_is_empty!33073 (array_inv!30711 (_keys!12119 thiss!1559)) (array_inv!30712 (_values!6734 thiss!1559)) e!726275))))

(declare-fun b!1273066 () Bool)

(declare-datatypes ((List!28637 0))(
  ( (Nil!28634) (Cons!28633 (h!29842 (_ BitVec 64)) (t!42162 List!28637)) )
))
(declare-fun arrayNoDuplicates!0 (array!83313 (_ BitVec 32) List!28637) Bool)

(assert (=> b!1273066 (= e!726271 (not (arrayNoDuplicates!0 (_keys!12119 thiss!1559) #b00000000000000000000000000000000 Nil!28634)))))

(declare-fun b!1273067 () Bool)

(declare-fun res!846674 () Bool)

(assert (=> b!1273067 (=> (not res!846674) (not e!726271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83313 (_ BitVec 32)) Bool)

(assert (=> b!1273067 (= res!846674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12119 thiss!1559) (mask!34477 thiss!1559)))))

(declare-fun mapNonEmpty!51222 () Bool)

(declare-fun mapRes!51222 () Bool)

(declare-fun tp!97648 () Bool)

(declare-fun e!726273 () Bool)

(assert (=> mapNonEmpty!51222 (= mapRes!51222 (and tp!97648 e!726273))))

(declare-fun mapKey!51222 () (_ BitVec 32))

(declare-fun mapValue!51222 () ValueCell!15683)

(declare-fun mapRest!51222 () (Array (_ BitVec 32) ValueCell!15683))

(assert (=> mapNonEmpty!51222 (= (arr!40184 (_values!6734 thiss!1559)) (store mapRest!51222 mapKey!51222 mapValue!51222))))

(declare-fun b!1273069 () Bool)

(declare-fun e!726276 () Bool)

(assert (=> b!1273069 (= e!726275 (and e!726276 mapRes!51222))))

(declare-fun condMapEmpty!51222 () Bool)

(declare-fun mapDefault!51222 () ValueCell!15683)

(assert (=> b!1273069 (= condMapEmpty!51222 (= (arr!40184 (_values!6734 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15683)) mapDefault!51222)))))

(declare-fun mapIsEmpty!51222 () Bool)

(assert (=> mapIsEmpty!51222 mapRes!51222))

(declare-fun b!1273070 () Bool)

(assert (=> b!1273070 (= e!726276 tp_is_empty!33073)))

(declare-fun res!846672 () Bool)

(assert (=> start!107508 (=> (not res!846672) (not e!726271))))

(declare-fun valid!2291 (LongMapFixedSize!6130) Bool)

(assert (=> start!107508 (= res!846672 (valid!2291 thiss!1559))))

(assert (=> start!107508 e!726271))

(assert (=> start!107508 e!726274))

(declare-fun b!1273068 () Bool)

(assert (=> b!1273068 (= e!726273 tp_is_empty!33073)))

(assert (= (and start!107508 res!846672) b!1273064))

(assert (= (and b!1273064 res!846675) b!1273063))

(assert (= (and b!1273063 res!846673) b!1273067))

(assert (= (and b!1273067 res!846674) b!1273066))

(assert (= (and b!1273069 condMapEmpty!51222) mapIsEmpty!51222))

(assert (= (and b!1273069 (not condMapEmpty!51222)) mapNonEmpty!51222))

(get-info :version)

(assert (= (and mapNonEmpty!51222 ((_ is ValueCellFull!15683) mapValue!51222)) b!1273068))

(assert (= (and b!1273069 ((_ is ValueCellFull!15683) mapDefault!51222)) b!1273070))

(assert (= b!1273065 b!1273069))

(assert (= start!107508 b!1273065))

(declare-fun m!1169965 () Bool)

(assert (=> b!1273064 m!1169965))

(declare-fun m!1169967 () Bool)

(assert (=> b!1273065 m!1169967))

(declare-fun m!1169969 () Bool)

(assert (=> b!1273065 m!1169969))

(declare-fun m!1169971 () Bool)

(assert (=> start!107508 m!1169971))

(declare-fun m!1169973 () Bool)

(assert (=> b!1273067 m!1169973))

(declare-fun m!1169975 () Bool)

(assert (=> b!1273066 m!1169975))

(declare-fun m!1169977 () Bool)

(assert (=> mapNonEmpty!51222 m!1169977))

(check-sat b_and!45741 tp_is_empty!33073 (not start!107508) (not b!1273064) (not b!1273066) (not b!1273065) (not mapNonEmpty!51222) (not b!1273067) (not b_next!27703))
(check-sat b_and!45741 (not b_next!27703))
(get-model)

(declare-fun d!139845 () Bool)

(assert (=> d!139845 (= (array_inv!30711 (_keys!12119 thiss!1559)) (bvsge (size!40728 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273065 d!139845))

(declare-fun d!139847 () Bool)

(assert (=> d!139847 (= (array_inv!30712 (_values!6734 thiss!1559)) (bvsge (size!40727 (_values!6734 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273065 d!139847))

(declare-fun d!139849 () Bool)

(declare-fun res!846706 () Bool)

(declare-fun e!726315 () Bool)

(assert (=> d!139849 (=> (not res!846706) (not e!726315))))

(declare-fun simpleValid!462 (LongMapFixedSize!6130) Bool)

(assert (=> d!139849 (= res!846706 (simpleValid!462 thiss!1559))))

(assert (=> d!139849 (= (valid!2291 thiss!1559) e!726315)))

(declare-fun b!1273125 () Bool)

(declare-fun res!846707 () Bool)

(assert (=> b!1273125 (=> (not res!846707) (not e!726315))))

(declare-fun arrayCountValidKeys!0 (array!83313 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273125 (= res!846707 (= (arrayCountValidKeys!0 (_keys!12119 thiss!1559) #b00000000000000000000000000000000 (size!40728 (_keys!12119 thiss!1559))) (_size!3120 thiss!1559)))))

(declare-fun b!1273126 () Bool)

(declare-fun res!846708 () Bool)

(assert (=> b!1273126 (=> (not res!846708) (not e!726315))))

(assert (=> b!1273126 (= res!846708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12119 thiss!1559) (mask!34477 thiss!1559)))))

(declare-fun b!1273127 () Bool)

(assert (=> b!1273127 (= e!726315 (arrayNoDuplicates!0 (_keys!12119 thiss!1559) #b00000000000000000000000000000000 Nil!28634))))

(assert (= (and d!139849 res!846706) b!1273125))

(assert (= (and b!1273125 res!846707) b!1273126))

(assert (= (and b!1273126 res!846708) b!1273127))

(declare-fun m!1170007 () Bool)

(assert (=> d!139849 m!1170007))

(declare-fun m!1170009 () Bool)

(assert (=> b!1273125 m!1170009))

(assert (=> b!1273126 m!1169973))

(assert (=> b!1273127 m!1169975))

(assert (=> start!107508 d!139849))

(declare-fun b!1273138 () Bool)

(declare-fun e!726326 () Bool)

(declare-fun e!726327 () Bool)

(assert (=> b!1273138 (= e!726326 e!726327)))

(declare-fun c!123734 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273138 (= c!123734 (validKeyInArray!0 (select (arr!40185 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273139 () Bool)

(declare-fun call!62569 () Bool)

(assert (=> b!1273139 (= e!726327 call!62569)))

(declare-fun b!1273140 () Bool)

(assert (=> b!1273140 (= e!726327 call!62569)))

(declare-fun bm!62566 () Bool)

(assert (=> bm!62566 (= call!62569 (arrayNoDuplicates!0 (_keys!12119 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123734 (Cons!28633 (select (arr!40185 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000) Nil!28634) Nil!28634)))))

(declare-fun d!139851 () Bool)

(declare-fun res!846717 () Bool)

(declare-fun e!726325 () Bool)

(assert (=> d!139851 (=> res!846717 e!726325)))

(assert (=> d!139851 (= res!846717 (bvsge #b00000000000000000000000000000000 (size!40728 (_keys!12119 thiss!1559))))))

(assert (=> d!139851 (= (arrayNoDuplicates!0 (_keys!12119 thiss!1559) #b00000000000000000000000000000000 Nil!28634) e!726325)))

(declare-fun b!1273141 () Bool)

(assert (=> b!1273141 (= e!726325 e!726326)))

(declare-fun res!846716 () Bool)

(assert (=> b!1273141 (=> (not res!846716) (not e!726326))))

(declare-fun e!726324 () Bool)

(assert (=> b!1273141 (= res!846716 (not e!726324))))

(declare-fun res!846715 () Bool)

(assert (=> b!1273141 (=> (not res!846715) (not e!726324))))

(assert (=> b!1273141 (= res!846715 (validKeyInArray!0 (select (arr!40185 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273142 () Bool)

(declare-fun contains!7642 (List!28637 (_ BitVec 64)) Bool)

(assert (=> b!1273142 (= e!726324 (contains!7642 Nil!28634 (select (arr!40185 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139851 (not res!846717)) b!1273141))

(assert (= (and b!1273141 res!846715) b!1273142))

(assert (= (and b!1273141 res!846716) b!1273138))

(assert (= (and b!1273138 c!123734) b!1273139))

(assert (= (and b!1273138 (not c!123734)) b!1273140))

(assert (= (or b!1273139 b!1273140) bm!62566))

(declare-fun m!1170011 () Bool)

(assert (=> b!1273138 m!1170011))

(assert (=> b!1273138 m!1170011))

(declare-fun m!1170013 () Bool)

(assert (=> b!1273138 m!1170013))

(assert (=> bm!62566 m!1170011))

(declare-fun m!1170015 () Bool)

(assert (=> bm!62566 m!1170015))

(assert (=> b!1273141 m!1170011))

(assert (=> b!1273141 m!1170011))

(assert (=> b!1273141 m!1170013))

(assert (=> b!1273142 m!1170011))

(assert (=> b!1273142 m!1170011))

(declare-fun m!1170017 () Bool)

(assert (=> b!1273142 m!1170017))

(assert (=> b!1273066 d!139851))

(declare-fun bm!62569 () Bool)

(declare-fun call!62572 () Bool)

(assert (=> bm!62569 (= call!62572 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12119 thiss!1559) (mask!34477 thiss!1559)))))

(declare-fun d!139853 () Bool)

(declare-fun res!846722 () Bool)

(declare-fun e!726336 () Bool)

(assert (=> d!139853 (=> res!846722 e!726336)))

(assert (=> d!139853 (= res!846722 (bvsge #b00000000000000000000000000000000 (size!40728 (_keys!12119 thiss!1559))))))

(assert (=> d!139853 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12119 thiss!1559) (mask!34477 thiss!1559)) e!726336)))

(declare-fun b!1273151 () Bool)

(declare-fun e!726334 () Bool)

(assert (=> b!1273151 (= e!726334 call!62572)))

(declare-fun b!1273152 () Bool)

(declare-fun e!726335 () Bool)

(assert (=> b!1273152 (= e!726334 e!726335)))

(declare-fun lt!574943 () (_ BitVec 64))

(assert (=> b!1273152 (= lt!574943 (select (arr!40185 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42176 0))(
  ( (Unit!42177) )
))
(declare-fun lt!574942 () Unit!42176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83313 (_ BitVec 64) (_ BitVec 32)) Unit!42176)

(assert (=> b!1273152 (= lt!574942 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12119 thiss!1559) lt!574943 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273152 (arrayContainsKey!0 (_keys!12119 thiss!1559) lt!574943 #b00000000000000000000000000000000)))

(declare-fun lt!574944 () Unit!42176)

(assert (=> b!1273152 (= lt!574944 lt!574942)))

(declare-fun res!846723 () Bool)

(declare-datatypes ((SeekEntryResult!9994 0))(
  ( (MissingZero!9994 (index!42347 (_ BitVec 32))) (Found!9994 (index!42348 (_ BitVec 32))) (Intermediate!9994 (undefined!10806 Bool) (index!42349 (_ BitVec 32)) (x!112548 (_ BitVec 32))) (Undefined!9994) (MissingVacant!9994 (index!42350 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83313 (_ BitVec 32)) SeekEntryResult!9994)

(assert (=> b!1273152 (= res!846723 (= (seekEntryOrOpen!0 (select (arr!40185 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000) (_keys!12119 thiss!1559) (mask!34477 thiss!1559)) (Found!9994 #b00000000000000000000000000000000)))))

(assert (=> b!1273152 (=> (not res!846723) (not e!726335))))

(declare-fun b!1273153 () Bool)

(assert (=> b!1273153 (= e!726336 e!726334)))

(declare-fun c!123737 () Bool)

(assert (=> b!1273153 (= c!123737 (validKeyInArray!0 (select (arr!40185 (_keys!12119 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273154 () Bool)

(assert (=> b!1273154 (= e!726335 call!62572)))

(assert (= (and d!139853 (not res!846722)) b!1273153))

(assert (= (and b!1273153 c!123737) b!1273152))

(assert (= (and b!1273153 (not c!123737)) b!1273151))

(assert (= (and b!1273152 res!846723) b!1273154))

(assert (= (or b!1273154 b!1273151) bm!62569))

(declare-fun m!1170019 () Bool)

(assert (=> bm!62569 m!1170019))

(assert (=> b!1273152 m!1170011))

(declare-fun m!1170021 () Bool)

(assert (=> b!1273152 m!1170021))

(declare-fun m!1170023 () Bool)

(assert (=> b!1273152 m!1170023))

(assert (=> b!1273152 m!1170011))

(declare-fun m!1170025 () Bool)

(assert (=> b!1273152 m!1170025))

(assert (=> b!1273153 m!1170011))

(assert (=> b!1273153 m!1170011))

(assert (=> b!1273153 m!1170013))

(assert (=> b!1273067 d!139853))

(declare-fun d!139855 () Bool)

(assert (=> d!139855 (= (validMask!0 (mask!34477 thiss!1559)) (and (or (= (mask!34477 thiss!1559) #b00000000000000000000000000000111) (= (mask!34477 thiss!1559) #b00000000000000000000000000001111) (= (mask!34477 thiss!1559) #b00000000000000000000000000011111) (= (mask!34477 thiss!1559) #b00000000000000000000000000111111) (= (mask!34477 thiss!1559) #b00000000000000000000000001111111) (= (mask!34477 thiss!1559) #b00000000000000000000000011111111) (= (mask!34477 thiss!1559) #b00000000000000000000000111111111) (= (mask!34477 thiss!1559) #b00000000000000000000001111111111) (= (mask!34477 thiss!1559) #b00000000000000000000011111111111) (= (mask!34477 thiss!1559) #b00000000000000000000111111111111) (= (mask!34477 thiss!1559) #b00000000000000000001111111111111) (= (mask!34477 thiss!1559) #b00000000000000000011111111111111) (= (mask!34477 thiss!1559) #b00000000000000000111111111111111) (= (mask!34477 thiss!1559) #b00000000000000001111111111111111) (= (mask!34477 thiss!1559) #b00000000000000011111111111111111) (= (mask!34477 thiss!1559) #b00000000000000111111111111111111) (= (mask!34477 thiss!1559) #b00000000000001111111111111111111) (= (mask!34477 thiss!1559) #b00000000000011111111111111111111) (= (mask!34477 thiss!1559) #b00000000000111111111111111111111) (= (mask!34477 thiss!1559) #b00000000001111111111111111111111) (= (mask!34477 thiss!1559) #b00000000011111111111111111111111) (= (mask!34477 thiss!1559) #b00000000111111111111111111111111) (= (mask!34477 thiss!1559) #b00000001111111111111111111111111) (= (mask!34477 thiss!1559) #b00000011111111111111111111111111) (= (mask!34477 thiss!1559) #b00000111111111111111111111111111) (= (mask!34477 thiss!1559) #b00001111111111111111111111111111) (= (mask!34477 thiss!1559) #b00011111111111111111111111111111) (= (mask!34477 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34477 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273064 d!139855))

(declare-fun condMapEmpty!51231 () Bool)

(declare-fun mapDefault!51231 () ValueCell!15683)

(assert (=> mapNonEmpty!51222 (= condMapEmpty!51231 (= mapRest!51222 ((as const (Array (_ BitVec 32) ValueCell!15683)) mapDefault!51231)))))

(declare-fun e!726342 () Bool)

(declare-fun mapRes!51231 () Bool)

(assert (=> mapNonEmpty!51222 (= tp!97648 (and e!726342 mapRes!51231))))

(declare-fun b!1273161 () Bool)

(declare-fun e!726341 () Bool)

(assert (=> b!1273161 (= e!726341 tp_is_empty!33073)))

(declare-fun mapNonEmpty!51231 () Bool)

(declare-fun tp!97663 () Bool)

(assert (=> mapNonEmpty!51231 (= mapRes!51231 (and tp!97663 e!726341))))

(declare-fun mapValue!51231 () ValueCell!15683)

(declare-fun mapRest!51231 () (Array (_ BitVec 32) ValueCell!15683))

(declare-fun mapKey!51231 () (_ BitVec 32))

(assert (=> mapNonEmpty!51231 (= mapRest!51222 (store mapRest!51231 mapKey!51231 mapValue!51231))))

(declare-fun mapIsEmpty!51231 () Bool)

(assert (=> mapIsEmpty!51231 mapRes!51231))

(declare-fun b!1273162 () Bool)

(assert (=> b!1273162 (= e!726342 tp_is_empty!33073)))

(assert (= (and mapNonEmpty!51222 condMapEmpty!51231) mapIsEmpty!51231))

(assert (= (and mapNonEmpty!51222 (not condMapEmpty!51231)) mapNonEmpty!51231))

(assert (= (and mapNonEmpty!51231 ((_ is ValueCellFull!15683) mapValue!51231)) b!1273161))

(assert (= (and mapNonEmpty!51222 ((_ is ValueCellFull!15683) mapDefault!51231)) b!1273162))

(declare-fun m!1170027 () Bool)

(assert (=> mapNonEmpty!51231 m!1170027))

(check-sat (not b_next!27703) b_and!45741 (not b!1273153) (not b!1273141) (not mapNonEmpty!51231) (not b!1273127) (not bm!62569) (not b!1273125) (not bm!62566) (not b!1273152) (not b!1273142) (not d!139849) tp_is_empty!33073 (not b!1273138) (not b!1273126))
(check-sat b_and!45741 (not b_next!27703))
