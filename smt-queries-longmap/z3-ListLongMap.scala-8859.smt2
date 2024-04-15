; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107492 () Bool)

(assert start!107492)

(declare-fun b!1272974 () Bool)

(declare-fun b_free!27697 () Bool)

(declare-fun b_next!27697 () Bool)

(assert (=> b!1272974 (= b_free!27697 (not b_next!27697))))

(declare-fun tp!97626 () Bool)

(declare-fun b_and!45735 () Bool)

(assert (=> b!1272974 (= tp!97626 b_and!45735)))

(declare-fun res!846629 () Bool)

(declare-fun e!726201 () Bool)

(assert (=> start!107492 (=> (not res!846629) (not e!726201))))

(declare-datatypes ((V!49283 0))(
  ( (V!49284 (val!16608 Int)) )
))
(declare-datatypes ((ValueCell!15680 0))(
  ( (ValueCellFull!15680 (v!19244 V!49283)) (EmptyCell!15680) )
))
(declare-datatypes ((array!83297 0))(
  ( (array!83298 (arr!40178 (Array (_ BitVec 32) ValueCell!15680)) (size!40721 (_ BitVec 32))) )
))
(declare-datatypes ((array!83299 0))(
  ( (array!83300 (arr!40179 (Array (_ BitVec 32) (_ BitVec 64))) (size!40722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6124 0))(
  ( (LongMapFixedSize!6125 (defaultEntry!6708 Int) (mask!34470 (_ BitVec 32)) (extraKeys!6387 (_ BitVec 32)) (zeroValue!6493 V!49283) (minValue!6493 V!49283) (_size!3117 (_ BitVec 32)) (_keys!12115 array!83299) (_values!6731 array!83297) (_vacant!3117 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6124)

(declare-fun valid!2289 (LongMapFixedSize!6124) Bool)

(assert (=> start!107492 (= res!846629 (valid!2289 thiss!1559))))

(assert (=> start!107492 e!726201))

(declare-fun e!726202 () Bool)

(assert (=> start!107492 e!726202))

(declare-fun b!1272969 () Bool)

(declare-fun e!726200 () Bool)

(declare-fun e!726204 () Bool)

(declare-fun mapRes!51210 () Bool)

(assert (=> b!1272969 (= e!726200 (and e!726204 mapRes!51210))))

(declare-fun condMapEmpty!51210 () Bool)

(declare-fun mapDefault!51210 () ValueCell!15680)

(assert (=> b!1272969 (= condMapEmpty!51210 (= (arr!40178 (_values!6731 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15680)) mapDefault!51210)))))

(declare-fun b!1272970 () Bool)

(declare-fun res!846628 () Bool)

(assert (=> b!1272970 (=> (not res!846628) (not e!726201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272970 (= res!846628 (validMask!0 (mask!34470 thiss!1559)))))

(declare-fun b!1272971 () Bool)

(declare-fun res!846630 () Bool)

(assert (=> b!1272971 (=> (not res!846630) (not e!726201))))

(assert (=> b!1272971 (= res!846630 (and (= (size!40721 (_values!6731 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34470 thiss!1559))) (= (size!40722 (_keys!12115 thiss!1559)) (size!40721 (_values!6731 thiss!1559))) (bvsge (mask!34470 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6387 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6387 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun b!1272972 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83299 (_ BitVec 32)) Bool)

(assert (=> b!1272972 (= e!726201 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12115 thiss!1559) (mask!34470 thiss!1559))))))

(declare-fun b!1272973 () Bool)

(declare-fun tp_is_empty!33067 () Bool)

(assert (=> b!1272973 (= e!726204 tp_is_empty!33067)))

(declare-fun mapNonEmpty!51210 () Bool)

(declare-fun tp!97627 () Bool)

(declare-fun e!726203 () Bool)

(assert (=> mapNonEmpty!51210 (= mapRes!51210 (and tp!97627 e!726203))))

(declare-fun mapRest!51210 () (Array (_ BitVec 32) ValueCell!15680))

(declare-fun mapValue!51210 () ValueCell!15680)

(declare-fun mapKey!51210 () (_ BitVec 32))

(assert (=> mapNonEmpty!51210 (= (arr!40178 (_values!6731 thiss!1559)) (store mapRest!51210 mapKey!51210 mapValue!51210))))

(declare-fun array_inv!30707 (array!83299) Bool)

(declare-fun array_inv!30708 (array!83297) Bool)

(assert (=> b!1272974 (= e!726202 (and tp!97626 tp_is_empty!33067 (array_inv!30707 (_keys!12115 thiss!1559)) (array_inv!30708 (_values!6731 thiss!1559)) e!726200))))

(declare-fun b!1272975 () Bool)

(assert (=> b!1272975 (= e!726203 tp_is_empty!33067)))

(declare-fun mapIsEmpty!51210 () Bool)

(assert (=> mapIsEmpty!51210 mapRes!51210))

(assert (= (and start!107492 res!846629) b!1272970))

(assert (= (and b!1272970 res!846628) b!1272971))

(assert (= (and b!1272971 res!846630) b!1272972))

(assert (= (and b!1272969 condMapEmpty!51210) mapIsEmpty!51210))

(assert (= (and b!1272969 (not condMapEmpty!51210)) mapNonEmpty!51210))

(get-info :version)

(assert (= (and mapNonEmpty!51210 ((_ is ValueCellFull!15680) mapValue!51210)) b!1272975))

(assert (= (and b!1272969 ((_ is ValueCellFull!15680) mapDefault!51210)) b!1272973))

(assert (= b!1272974 b!1272969))

(assert (= start!107492 b!1272974))

(declare-fun m!1169909 () Bool)

(assert (=> start!107492 m!1169909))

(declare-fun m!1169911 () Bool)

(assert (=> mapNonEmpty!51210 m!1169911))

(declare-fun m!1169913 () Bool)

(assert (=> b!1272972 m!1169913))

(declare-fun m!1169915 () Bool)

(assert (=> b!1272970 m!1169915))

(declare-fun m!1169917 () Bool)

(assert (=> b!1272974 m!1169917))

(declare-fun m!1169919 () Bool)

(assert (=> b!1272974 m!1169919))

(check-sat (not b!1272972) (not b_next!27697) (not b!1272974) (not mapNonEmpty!51210) (not b!1272970) b_and!45735 (not start!107492) tp_is_empty!33067)
(check-sat b_and!45735 (not b_next!27697))
(get-model)

(declare-fun d!139833 () Bool)

(assert (=> d!139833 (= (array_inv!30707 (_keys!12115 thiss!1559)) (bvsge (size!40722 (_keys!12115 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272974 d!139833))

(declare-fun d!139835 () Bool)

(assert (=> d!139835 (= (array_inv!30708 (_values!6731 thiss!1559)) (bvsge (size!40721 (_values!6731 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272974 d!139835))

(declare-fun d!139837 () Bool)

(assert (=> d!139837 (= (validMask!0 (mask!34470 thiss!1559)) (and (or (= (mask!34470 thiss!1559) #b00000000000000000000000000000111) (= (mask!34470 thiss!1559) #b00000000000000000000000000001111) (= (mask!34470 thiss!1559) #b00000000000000000000000000011111) (= (mask!34470 thiss!1559) #b00000000000000000000000000111111) (= (mask!34470 thiss!1559) #b00000000000000000000000001111111) (= (mask!34470 thiss!1559) #b00000000000000000000000011111111) (= (mask!34470 thiss!1559) #b00000000000000000000000111111111) (= (mask!34470 thiss!1559) #b00000000000000000000001111111111) (= (mask!34470 thiss!1559) #b00000000000000000000011111111111) (= (mask!34470 thiss!1559) #b00000000000000000000111111111111) (= (mask!34470 thiss!1559) #b00000000000000000001111111111111) (= (mask!34470 thiss!1559) #b00000000000000000011111111111111) (= (mask!34470 thiss!1559) #b00000000000000000111111111111111) (= (mask!34470 thiss!1559) #b00000000000000001111111111111111) (= (mask!34470 thiss!1559) #b00000000000000011111111111111111) (= (mask!34470 thiss!1559) #b00000000000000111111111111111111) (= (mask!34470 thiss!1559) #b00000000000001111111111111111111) (= (mask!34470 thiss!1559) #b00000000000011111111111111111111) (= (mask!34470 thiss!1559) #b00000000000111111111111111111111) (= (mask!34470 thiss!1559) #b00000000001111111111111111111111) (= (mask!34470 thiss!1559) #b00000000011111111111111111111111) (= (mask!34470 thiss!1559) #b00000000111111111111111111111111) (= (mask!34470 thiss!1559) #b00000001111111111111111111111111) (= (mask!34470 thiss!1559) #b00000011111111111111111111111111) (= (mask!34470 thiss!1559) #b00000111111111111111111111111111) (= (mask!34470 thiss!1559) #b00001111111111111111111111111111) (= (mask!34470 thiss!1559) #b00011111111111111111111111111111) (= (mask!34470 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34470 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272970 d!139837))

(declare-fun d!139839 () Bool)

(declare-fun res!846655 () Bool)

(declare-fun e!726243 () Bool)

(assert (=> d!139839 (=> (not res!846655) (not e!726243))))

(declare-fun simpleValid!461 (LongMapFixedSize!6124) Bool)

(assert (=> d!139839 (= res!846655 (simpleValid!461 thiss!1559))))

(assert (=> d!139839 (= (valid!2289 thiss!1559) e!726243)))

(declare-fun b!1273024 () Bool)

(declare-fun res!846656 () Bool)

(assert (=> b!1273024 (=> (not res!846656) (not e!726243))))

(declare-fun arrayCountValidKeys!0 (array!83299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273024 (= res!846656 (= (arrayCountValidKeys!0 (_keys!12115 thiss!1559) #b00000000000000000000000000000000 (size!40722 (_keys!12115 thiss!1559))) (_size!3117 thiss!1559)))))

(declare-fun b!1273025 () Bool)

(declare-fun res!846657 () Bool)

(assert (=> b!1273025 (=> (not res!846657) (not e!726243))))

(assert (=> b!1273025 (= res!846657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12115 thiss!1559) (mask!34470 thiss!1559)))))

(declare-fun b!1273026 () Bool)

(declare-datatypes ((List!28636 0))(
  ( (Nil!28633) (Cons!28632 (h!29841 (_ BitVec 64)) (t!42161 List!28636)) )
))
(declare-fun arrayNoDuplicates!0 (array!83299 (_ BitVec 32) List!28636) Bool)

(assert (=> b!1273026 (= e!726243 (arrayNoDuplicates!0 (_keys!12115 thiss!1559) #b00000000000000000000000000000000 Nil!28633))))

(assert (= (and d!139839 res!846655) b!1273024))

(assert (= (and b!1273024 res!846656) b!1273025))

(assert (= (and b!1273025 res!846657) b!1273026))

(declare-fun m!1169945 () Bool)

(assert (=> d!139839 m!1169945))

(declare-fun m!1169947 () Bool)

(assert (=> b!1273024 m!1169947))

(assert (=> b!1273025 m!1169913))

(declare-fun m!1169949 () Bool)

(assert (=> b!1273026 m!1169949))

(assert (=> start!107492 d!139839))

(declare-fun d!139841 () Bool)

(declare-fun res!846663 () Bool)

(declare-fun e!726251 () Bool)

(assert (=> d!139841 (=> res!846663 e!726251)))

(assert (=> d!139841 (= res!846663 (bvsge #b00000000000000000000000000000000 (size!40722 (_keys!12115 thiss!1559))))))

(assert (=> d!139841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12115 thiss!1559) (mask!34470 thiss!1559)) e!726251)))

(declare-fun b!1273035 () Bool)

(declare-fun e!726252 () Bool)

(declare-fun e!726250 () Bool)

(assert (=> b!1273035 (= e!726252 e!726250)))

(declare-fun lt!574935 () (_ BitVec 64))

(assert (=> b!1273035 (= lt!574935 (select (arr!40179 (_keys!12115 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42174 0))(
  ( (Unit!42175) )
))
(declare-fun lt!574934 () Unit!42174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83299 (_ BitVec 64) (_ BitVec 32)) Unit!42174)

(assert (=> b!1273035 (= lt!574934 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12115 thiss!1559) lt!574935 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273035 (arrayContainsKey!0 (_keys!12115 thiss!1559) lt!574935 #b00000000000000000000000000000000)))

(declare-fun lt!574933 () Unit!42174)

(assert (=> b!1273035 (= lt!574933 lt!574934)))

(declare-fun res!846662 () Bool)

(declare-datatypes ((SeekEntryResult!9993 0))(
  ( (MissingZero!9993 (index!42343 (_ BitVec 32))) (Found!9993 (index!42344 (_ BitVec 32))) (Intermediate!9993 (undefined!10805 Bool) (index!42345 (_ BitVec 32)) (x!112531 (_ BitVec 32))) (Undefined!9993) (MissingVacant!9993 (index!42346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83299 (_ BitVec 32)) SeekEntryResult!9993)

(assert (=> b!1273035 (= res!846662 (= (seekEntryOrOpen!0 (select (arr!40179 (_keys!12115 thiss!1559)) #b00000000000000000000000000000000) (_keys!12115 thiss!1559) (mask!34470 thiss!1559)) (Found!9993 #b00000000000000000000000000000000)))))

(assert (=> b!1273035 (=> (not res!846662) (not e!726250))))

(declare-fun b!1273036 () Bool)

(declare-fun call!62566 () Bool)

(assert (=> b!1273036 (= e!726252 call!62566)))

(declare-fun b!1273037 () Bool)

(assert (=> b!1273037 (= e!726250 call!62566)))

(declare-fun b!1273038 () Bool)

(assert (=> b!1273038 (= e!726251 e!726252)))

(declare-fun c!123731 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273038 (= c!123731 (validKeyInArray!0 (select (arr!40179 (_keys!12115 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62563 () Bool)

(assert (=> bm!62563 (= call!62566 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12115 thiss!1559) (mask!34470 thiss!1559)))))

(assert (= (and d!139841 (not res!846663)) b!1273038))

(assert (= (and b!1273038 c!123731) b!1273035))

(assert (= (and b!1273038 (not c!123731)) b!1273036))

(assert (= (and b!1273035 res!846662) b!1273037))

(assert (= (or b!1273037 b!1273036) bm!62563))

(declare-fun m!1169951 () Bool)

(assert (=> b!1273035 m!1169951))

(declare-fun m!1169953 () Bool)

(assert (=> b!1273035 m!1169953))

(declare-fun m!1169955 () Bool)

(assert (=> b!1273035 m!1169955))

(assert (=> b!1273035 m!1169951))

(declare-fun m!1169957 () Bool)

(assert (=> b!1273035 m!1169957))

(assert (=> b!1273038 m!1169951))

(assert (=> b!1273038 m!1169951))

(declare-fun m!1169959 () Bool)

(assert (=> b!1273038 m!1169959))

(declare-fun m!1169961 () Bool)

(assert (=> bm!62563 m!1169961))

(assert (=> b!1272972 d!139841))

(declare-fun condMapEmpty!51219 () Bool)

(declare-fun mapDefault!51219 () ValueCell!15680)

(assert (=> mapNonEmpty!51210 (= condMapEmpty!51219 (= mapRest!51210 ((as const (Array (_ BitVec 32) ValueCell!15680)) mapDefault!51219)))))

(declare-fun e!726258 () Bool)

(declare-fun mapRes!51219 () Bool)

(assert (=> mapNonEmpty!51210 (= tp!97627 (and e!726258 mapRes!51219))))

(declare-fun mapIsEmpty!51219 () Bool)

(assert (=> mapIsEmpty!51219 mapRes!51219))

(declare-fun mapNonEmpty!51219 () Bool)

(declare-fun tp!97642 () Bool)

(declare-fun e!726257 () Bool)

(assert (=> mapNonEmpty!51219 (= mapRes!51219 (and tp!97642 e!726257))))

(declare-fun mapKey!51219 () (_ BitVec 32))

(declare-fun mapRest!51219 () (Array (_ BitVec 32) ValueCell!15680))

(declare-fun mapValue!51219 () ValueCell!15680)

(assert (=> mapNonEmpty!51219 (= mapRest!51210 (store mapRest!51219 mapKey!51219 mapValue!51219))))

(declare-fun b!1273046 () Bool)

(assert (=> b!1273046 (= e!726258 tp_is_empty!33067)))

(declare-fun b!1273045 () Bool)

(assert (=> b!1273045 (= e!726257 tp_is_empty!33067)))

(assert (= (and mapNonEmpty!51210 condMapEmpty!51219) mapIsEmpty!51219))

(assert (= (and mapNonEmpty!51210 (not condMapEmpty!51219)) mapNonEmpty!51219))

(assert (= (and mapNonEmpty!51219 ((_ is ValueCellFull!15680) mapValue!51219)) b!1273045))

(assert (= (and mapNonEmpty!51210 ((_ is ValueCellFull!15680) mapDefault!51219)) b!1273046))

(declare-fun m!1169963 () Bool)

(assert (=> mapNonEmpty!51219 m!1169963))

(check-sat (not b!1273035) (not b_next!27697) (not d!139839) (not b!1273026) (not b!1273024) b_and!45735 (not mapNonEmpty!51219) (not bm!62563) tp_is_empty!33067 (not b!1273025) (not b!1273038))
(check-sat b_and!45735 (not b_next!27697))
