; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81344 () Bool)

(assert start!81344)

(declare-fun b!950862 () Bool)

(declare-fun b_free!18229 () Bool)

(declare-fun b_next!18229 () Bool)

(assert (=> b!950862 (= b_free!18229 (not b_next!18229))))

(declare-fun tp!63281 () Bool)

(declare-fun b_and!29693 () Bool)

(assert (=> b!950862 (= tp!63281 b_and!29693)))

(declare-datatypes ((V!32615 0))(
  ( (V!32616 (val!10419 Int)) )
))
(declare-datatypes ((ValueCell!9887 0))(
  ( (ValueCellFull!9887 (v!12958 V!32615)) (EmptyCell!9887) )
))
(declare-datatypes ((array!57541 0))(
  ( (array!57542 (arr!27667 (Array (_ BitVec 32) ValueCell!9887)) (size!28145 (_ BitVec 32))) )
))
(declare-datatypes ((array!57543 0))(
  ( (array!57544 (arr!27668 (Array (_ BitVec 32) (_ BitVec 64))) (size!28146 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4924 0))(
  ( (LongMapFixedSize!4925 (defaultEntry!5772 Int) (mask!27608 (_ BitVec 32)) (extraKeys!5504 (_ BitVec 32)) (zeroValue!5608 V!32615) (minValue!5608 V!32615) (_size!2517 (_ BitVec 32)) (_keys!10734 array!57543) (_values!5795 array!57541) (_vacant!2517 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4924)

(declare-fun tp_is_empty!20737 () Bool)

(declare-fun e!535402 () Bool)

(declare-fun e!535404 () Bool)

(declare-fun array_inv!21556 (array!57543) Bool)

(declare-fun array_inv!21557 (array!57541) Bool)

(assert (=> b!950862 (= e!535404 (and tp!63281 tp_is_empty!20737 (array_inv!21556 (_keys!10734 thiss!1141)) (array_inv!21557 (_values!5795 thiss!1141)) e!535402))))

(declare-fun b!950863 () Bool)

(declare-fun e!535406 () Bool)

(declare-datatypes ((List!19321 0))(
  ( (Nil!19318) (Cons!19317 (h!20483 (_ BitVec 64)) (t!27650 List!19321)) )
))
(declare-fun arrayNoDuplicates!0 (array!57543 (_ BitVec 32) List!19321) Bool)

(assert (=> b!950863 (= e!535406 (not (arrayNoDuplicates!0 (_keys!10734 thiss!1141) #b00000000000000000000000000000000 Nil!19318)))))

(declare-fun b!950864 () Bool)

(declare-fun res!637314 () Bool)

(assert (=> b!950864 (=> (not res!637314) (not e!535406))))

(assert (=> b!950864 (= res!637314 (and (= (size!28145 (_values!5795 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27608 thiss!1141))) (= (size!28146 (_keys!10734 thiss!1141)) (size!28145 (_values!5795 thiss!1141))) (bvsge (mask!27608 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5504 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5504 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!950865 () Bool)

(declare-fun res!637312 () Bool)

(assert (=> b!950865 (=> (not res!637312) (not e!535406))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9098 0))(
  ( (MissingZero!9098 (index!38763 (_ BitVec 32))) (Found!9098 (index!38764 (_ BitVec 32))) (Intermediate!9098 (undefined!9910 Bool) (index!38765 (_ BitVec 32)) (x!81704 (_ BitVec 32))) (Undefined!9098) (MissingVacant!9098 (index!38766 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57543 (_ BitVec 32)) SeekEntryResult!9098)

(assert (=> b!950865 (= res!637312 (not ((_ is Found!9098) (seekEntry!0 key!756 (_keys!10734 thiss!1141) (mask!27608 thiss!1141)))))))

(declare-fun res!637317 () Bool)

(assert (=> start!81344 (=> (not res!637317) (not e!535406))))

(declare-fun valid!1886 (LongMapFixedSize!4924) Bool)

(assert (=> start!81344 (= res!637317 (valid!1886 thiss!1141))))

(assert (=> start!81344 e!535406))

(assert (=> start!81344 e!535404))

(assert (=> start!81344 true))

(declare-fun b!950866 () Bool)

(declare-fun res!637311 () Bool)

(assert (=> b!950866 (=> (not res!637311) (not e!535406))))

(assert (=> b!950866 (= res!637311 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950867 () Bool)

(declare-fun e!535403 () Bool)

(assert (=> b!950867 (= e!535403 tp_is_empty!20737)))

(declare-fun b!950868 () Bool)

(declare-fun res!637313 () Bool)

(assert (=> b!950868 (=> (not res!637313) (not e!535406))))

(declare-datatypes ((tuple2!13528 0))(
  ( (tuple2!13529 (_1!6775 (_ BitVec 64)) (_2!6775 V!32615)) )
))
(declare-datatypes ((List!19322 0))(
  ( (Nil!19319) (Cons!19318 (h!20484 tuple2!13528) (t!27651 List!19322)) )
))
(declare-datatypes ((ListLongMap!12227 0))(
  ( (ListLongMap!12228 (toList!6129 List!19322)) )
))
(declare-fun contains!5230 (ListLongMap!12227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3362 (array!57543 array!57541 (_ BitVec 32) (_ BitVec 32) V!32615 V!32615 (_ BitVec 32) Int) ListLongMap!12227)

(assert (=> b!950868 (= res!637313 (contains!5230 (getCurrentListMap!3362 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!33014 () Bool)

(declare-fun mapRes!33014 () Bool)

(assert (=> mapIsEmpty!33014 mapRes!33014))

(declare-fun b!950869 () Bool)

(declare-fun e!535405 () Bool)

(assert (=> b!950869 (= e!535405 tp_is_empty!20737)))

(declare-fun mapNonEmpty!33014 () Bool)

(declare-fun tp!63280 () Bool)

(assert (=> mapNonEmpty!33014 (= mapRes!33014 (and tp!63280 e!535403))))

(declare-fun mapRest!33014 () (Array (_ BitVec 32) ValueCell!9887))

(declare-fun mapKey!33014 () (_ BitVec 32))

(declare-fun mapValue!33014 () ValueCell!9887)

(assert (=> mapNonEmpty!33014 (= (arr!27667 (_values!5795 thiss!1141)) (store mapRest!33014 mapKey!33014 mapValue!33014))))

(declare-fun b!950870 () Bool)

(declare-fun res!637315 () Bool)

(assert (=> b!950870 (=> (not res!637315) (not e!535406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57543 (_ BitVec 32)) Bool)

(assert (=> b!950870 (= res!637315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10734 thiss!1141) (mask!27608 thiss!1141)))))

(declare-fun b!950871 () Bool)

(declare-fun res!637316 () Bool)

(assert (=> b!950871 (=> (not res!637316) (not e!535406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950871 (= res!637316 (validMask!0 (mask!27608 thiss!1141)))))

(declare-fun b!950872 () Bool)

(assert (=> b!950872 (= e!535402 (and e!535405 mapRes!33014))))

(declare-fun condMapEmpty!33014 () Bool)

(declare-fun mapDefault!33014 () ValueCell!9887)

(assert (=> b!950872 (= condMapEmpty!33014 (= (arr!27667 (_values!5795 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9887)) mapDefault!33014)))))

(assert (= (and start!81344 res!637317) b!950866))

(assert (= (and b!950866 res!637311) b!950865))

(assert (= (and b!950865 res!637312) b!950868))

(assert (= (and b!950868 res!637313) b!950871))

(assert (= (and b!950871 res!637316) b!950864))

(assert (= (and b!950864 res!637314) b!950870))

(assert (= (and b!950870 res!637315) b!950863))

(assert (= (and b!950872 condMapEmpty!33014) mapIsEmpty!33014))

(assert (= (and b!950872 (not condMapEmpty!33014)) mapNonEmpty!33014))

(assert (= (and mapNonEmpty!33014 ((_ is ValueCellFull!9887) mapValue!33014)) b!950867))

(assert (= (and b!950872 ((_ is ValueCellFull!9887) mapDefault!33014)) b!950869))

(assert (= b!950862 b!950872))

(assert (= start!81344 b!950862))

(declare-fun m!883811 () Bool)

(assert (=> b!950870 m!883811))

(declare-fun m!883813 () Bool)

(assert (=> mapNonEmpty!33014 m!883813))

(declare-fun m!883815 () Bool)

(assert (=> start!81344 m!883815))

(declare-fun m!883817 () Bool)

(assert (=> b!950871 m!883817))

(declare-fun m!883819 () Bool)

(assert (=> b!950863 m!883819))

(declare-fun m!883821 () Bool)

(assert (=> b!950865 m!883821))

(declare-fun m!883823 () Bool)

(assert (=> b!950868 m!883823))

(assert (=> b!950868 m!883823))

(declare-fun m!883825 () Bool)

(assert (=> b!950868 m!883825))

(declare-fun m!883827 () Bool)

(assert (=> b!950862 m!883827))

(declare-fun m!883829 () Bool)

(assert (=> b!950862 m!883829))

(check-sat (not b!950868) (not b!950862) (not b!950871) (not b_next!18229) (not mapNonEmpty!33014) tp_is_empty!20737 (not start!81344) (not b!950865) (not b!950870) (not b!950863) b_and!29693)
(check-sat b_and!29693 (not b_next!18229))
(get-model)

(declare-fun d!115467 () Bool)

(declare-fun res!637366 () Bool)

(declare-fun e!535446 () Bool)

(assert (=> d!115467 (=> (not res!637366) (not e!535446))))

(declare-fun simpleValid!373 (LongMapFixedSize!4924) Bool)

(assert (=> d!115467 (= res!637366 (simpleValid!373 thiss!1141))))

(assert (=> d!115467 (= (valid!1886 thiss!1141) e!535446)))

(declare-fun b!950945 () Bool)

(declare-fun res!637367 () Bool)

(assert (=> b!950945 (=> (not res!637367) (not e!535446))))

(declare-fun arrayCountValidKeys!0 (array!57543 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950945 (= res!637367 (= (arrayCountValidKeys!0 (_keys!10734 thiss!1141) #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))) (_size!2517 thiss!1141)))))

(declare-fun b!950946 () Bool)

(declare-fun res!637368 () Bool)

(assert (=> b!950946 (=> (not res!637368) (not e!535446))))

(assert (=> b!950946 (= res!637368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10734 thiss!1141) (mask!27608 thiss!1141)))))

(declare-fun b!950947 () Bool)

(assert (=> b!950947 (= e!535446 (arrayNoDuplicates!0 (_keys!10734 thiss!1141) #b00000000000000000000000000000000 Nil!19318))))

(assert (= (and d!115467 res!637366) b!950945))

(assert (= (and b!950945 res!637367) b!950946))

(assert (= (and b!950946 res!637368) b!950947))

(declare-fun m!883871 () Bool)

(assert (=> d!115467 m!883871))

(declare-fun m!883873 () Bool)

(assert (=> b!950945 m!883873))

(assert (=> b!950946 m!883811))

(assert (=> b!950947 m!883819))

(assert (=> start!81344 d!115467))

(declare-fun d!115469 () Bool)

(declare-fun res!637374 () Bool)

(declare-fun e!535454 () Bool)

(assert (=> d!115469 (=> res!637374 e!535454)))

(assert (=> d!115469 (= res!637374 (bvsge #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))))))

(assert (=> d!115469 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10734 thiss!1141) (mask!27608 thiss!1141)) e!535454)))

(declare-fun bm!41388 () Bool)

(declare-fun call!41391 () Bool)

(assert (=> bm!41388 (= call!41391 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10734 thiss!1141) (mask!27608 thiss!1141)))))

(declare-fun b!950956 () Bool)

(declare-fun e!535453 () Bool)

(assert (=> b!950956 (= e!535453 call!41391)))

(declare-fun b!950957 () Bool)

(declare-fun e!535455 () Bool)

(assert (=> b!950957 (= e!535454 e!535455)))

(declare-fun c!99466 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950957 (= c!99466 (validKeyInArray!0 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950958 () Bool)

(assert (=> b!950958 (= e!535455 call!41391)))

(declare-fun b!950959 () Bool)

(assert (=> b!950959 (= e!535455 e!535453)))

(declare-fun lt!428198 () (_ BitVec 64))

(assert (=> b!950959 (= lt!428198 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31966 0))(
  ( (Unit!31967) )
))
(declare-fun lt!428199 () Unit!31966)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57543 (_ BitVec 64) (_ BitVec 32)) Unit!31966)

(assert (=> b!950959 (= lt!428199 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10734 thiss!1141) lt!428198 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950959 (arrayContainsKey!0 (_keys!10734 thiss!1141) lt!428198 #b00000000000000000000000000000000)))

(declare-fun lt!428200 () Unit!31966)

(assert (=> b!950959 (= lt!428200 lt!428199)))

(declare-fun res!637373 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57543 (_ BitVec 32)) SeekEntryResult!9098)

(assert (=> b!950959 (= res!637373 (= (seekEntryOrOpen!0 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000) (_keys!10734 thiss!1141) (mask!27608 thiss!1141)) (Found!9098 #b00000000000000000000000000000000)))))

(assert (=> b!950959 (=> (not res!637373) (not e!535453))))

(assert (= (and d!115469 (not res!637374)) b!950957))

(assert (= (and b!950957 c!99466) b!950959))

(assert (= (and b!950957 (not c!99466)) b!950958))

(assert (= (and b!950959 res!637373) b!950956))

(assert (= (or b!950956 b!950958) bm!41388))

(declare-fun m!883875 () Bool)

(assert (=> bm!41388 m!883875))

(declare-fun m!883877 () Bool)

(assert (=> b!950957 m!883877))

(assert (=> b!950957 m!883877))

(declare-fun m!883879 () Bool)

(assert (=> b!950957 m!883879))

(assert (=> b!950959 m!883877))

(declare-fun m!883881 () Bool)

(assert (=> b!950959 m!883881))

(declare-fun m!883883 () Bool)

(assert (=> b!950959 m!883883))

(assert (=> b!950959 m!883877))

(declare-fun m!883885 () Bool)

(assert (=> b!950959 m!883885))

(assert (=> b!950870 d!115469))

(declare-fun d!115471 () Bool)

(assert (=> d!115471 (= (validMask!0 (mask!27608 thiss!1141)) (and (or (= (mask!27608 thiss!1141) #b00000000000000000000000000000111) (= (mask!27608 thiss!1141) #b00000000000000000000000000001111) (= (mask!27608 thiss!1141) #b00000000000000000000000000011111) (= (mask!27608 thiss!1141) #b00000000000000000000000000111111) (= (mask!27608 thiss!1141) #b00000000000000000000000001111111) (= (mask!27608 thiss!1141) #b00000000000000000000000011111111) (= (mask!27608 thiss!1141) #b00000000000000000000000111111111) (= (mask!27608 thiss!1141) #b00000000000000000000001111111111) (= (mask!27608 thiss!1141) #b00000000000000000000011111111111) (= (mask!27608 thiss!1141) #b00000000000000000000111111111111) (= (mask!27608 thiss!1141) #b00000000000000000001111111111111) (= (mask!27608 thiss!1141) #b00000000000000000011111111111111) (= (mask!27608 thiss!1141) #b00000000000000000111111111111111) (= (mask!27608 thiss!1141) #b00000000000000001111111111111111) (= (mask!27608 thiss!1141) #b00000000000000011111111111111111) (= (mask!27608 thiss!1141) #b00000000000000111111111111111111) (= (mask!27608 thiss!1141) #b00000000000001111111111111111111) (= (mask!27608 thiss!1141) #b00000000000011111111111111111111) (= (mask!27608 thiss!1141) #b00000000000111111111111111111111) (= (mask!27608 thiss!1141) #b00000000001111111111111111111111) (= (mask!27608 thiss!1141) #b00000000011111111111111111111111) (= (mask!27608 thiss!1141) #b00000000111111111111111111111111) (= (mask!27608 thiss!1141) #b00000001111111111111111111111111) (= (mask!27608 thiss!1141) #b00000011111111111111111111111111) (= (mask!27608 thiss!1141) #b00000111111111111111111111111111) (= (mask!27608 thiss!1141) #b00001111111111111111111111111111) (= (mask!27608 thiss!1141) #b00011111111111111111111111111111) (= (mask!27608 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27608 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950871 d!115471))

(declare-fun d!115473 () Bool)

(assert (=> d!115473 (= (array_inv!21556 (_keys!10734 thiss!1141)) (bvsge (size!28146 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950862 d!115473))

(declare-fun d!115475 () Bool)

(assert (=> d!115475 (= (array_inv!21557 (_values!5795 thiss!1141)) (bvsge (size!28145 (_values!5795 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950862 d!115475))

(declare-fun b!950970 () Bool)

(declare-fun e!535467 () Bool)

(declare-fun call!41394 () Bool)

(assert (=> b!950970 (= e!535467 call!41394)))

(declare-fun bm!41391 () Bool)

(declare-fun c!99469 () Bool)

(assert (=> bm!41391 (= call!41394 (arrayNoDuplicates!0 (_keys!10734 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99469 (Cons!19317 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000) Nil!19318) Nil!19318)))))

(declare-fun d!115477 () Bool)

(declare-fun res!637383 () Bool)

(declare-fun e!535465 () Bool)

(assert (=> d!115477 (=> res!637383 e!535465)))

(assert (=> d!115477 (= res!637383 (bvsge #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))))))

(assert (=> d!115477 (= (arrayNoDuplicates!0 (_keys!10734 thiss!1141) #b00000000000000000000000000000000 Nil!19318) e!535465)))

(declare-fun b!950971 () Bool)

(declare-fun e!535466 () Bool)

(assert (=> b!950971 (= e!535465 e!535466)))

(declare-fun res!637382 () Bool)

(assert (=> b!950971 (=> (not res!637382) (not e!535466))))

(declare-fun e!535464 () Bool)

(assert (=> b!950971 (= res!637382 (not e!535464))))

(declare-fun res!637381 () Bool)

(assert (=> b!950971 (=> (not res!637381) (not e!535464))))

(assert (=> b!950971 (= res!637381 (validKeyInArray!0 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950972 () Bool)

(declare-fun contains!5231 (List!19321 (_ BitVec 64)) Bool)

(assert (=> b!950972 (= e!535464 (contains!5231 Nil!19318 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950973 () Bool)

(assert (=> b!950973 (= e!535466 e!535467)))

(assert (=> b!950973 (= c!99469 (validKeyInArray!0 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950974 () Bool)

(assert (=> b!950974 (= e!535467 call!41394)))

(assert (= (and d!115477 (not res!637383)) b!950971))

(assert (= (and b!950971 res!637381) b!950972))

(assert (= (and b!950971 res!637382) b!950973))

(assert (= (and b!950973 c!99469) b!950974))

(assert (= (and b!950973 (not c!99469)) b!950970))

(assert (= (or b!950974 b!950970) bm!41391))

(assert (=> bm!41391 m!883877))

(declare-fun m!883887 () Bool)

(assert (=> bm!41391 m!883887))

(assert (=> b!950971 m!883877))

(assert (=> b!950971 m!883877))

(assert (=> b!950971 m!883879))

(assert (=> b!950972 m!883877))

(assert (=> b!950972 m!883877))

(declare-fun m!883889 () Bool)

(assert (=> b!950972 m!883889))

(assert (=> b!950973 m!883877))

(assert (=> b!950973 m!883877))

(assert (=> b!950973 m!883879))

(assert (=> b!950863 d!115477))

(declare-fun d!115479 () Bool)

(declare-fun e!535473 () Bool)

(assert (=> d!115479 e!535473))

(declare-fun res!637386 () Bool)

(assert (=> d!115479 (=> res!637386 e!535473)))

(declare-fun lt!428210 () Bool)

(assert (=> d!115479 (= res!637386 (not lt!428210))))

(declare-fun lt!428212 () Bool)

(assert (=> d!115479 (= lt!428210 lt!428212)))

(declare-fun lt!428211 () Unit!31966)

(declare-fun e!535472 () Unit!31966)

(assert (=> d!115479 (= lt!428211 e!535472)))

(declare-fun c!99472 () Bool)

(assert (=> d!115479 (= c!99472 lt!428212)))

(declare-fun containsKey!465 (List!19322 (_ BitVec 64)) Bool)

(assert (=> d!115479 (= lt!428212 (containsKey!465 (toList!6129 (getCurrentListMap!3362 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756))))

(assert (=> d!115479 (= (contains!5230 (getCurrentListMap!3362 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)) key!756) lt!428210)))

(declare-fun b!950981 () Bool)

(declare-fun lt!428209 () Unit!31966)

(assert (=> b!950981 (= e!535472 lt!428209)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!359 (List!19322 (_ BitVec 64)) Unit!31966)

(assert (=> b!950981 (= lt!428209 (lemmaContainsKeyImpliesGetValueByKeyDefined!359 (toList!6129 (getCurrentListMap!3362 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756))))

(declare-datatypes ((Option!500 0))(
  ( (Some!499 (v!12961 V!32615)) (None!498) )
))
(declare-fun isDefined!367 (Option!500) Bool)

(declare-fun getValueByKey!494 (List!19322 (_ BitVec 64)) Option!500)

(assert (=> b!950981 (isDefined!367 (getValueByKey!494 (toList!6129 (getCurrentListMap!3362 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756))))

(declare-fun b!950982 () Bool)

(declare-fun Unit!31968 () Unit!31966)

(assert (=> b!950982 (= e!535472 Unit!31968)))

(declare-fun b!950983 () Bool)

(assert (=> b!950983 (= e!535473 (isDefined!367 (getValueByKey!494 (toList!6129 (getCurrentListMap!3362 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141))) key!756)))))

(assert (= (and d!115479 c!99472) b!950981))

(assert (= (and d!115479 (not c!99472)) b!950982))

(assert (= (and d!115479 (not res!637386)) b!950983))

(declare-fun m!883891 () Bool)

(assert (=> d!115479 m!883891))

(declare-fun m!883893 () Bool)

(assert (=> b!950981 m!883893))

(declare-fun m!883895 () Bool)

(assert (=> b!950981 m!883895))

(assert (=> b!950981 m!883895))

(declare-fun m!883897 () Bool)

(assert (=> b!950981 m!883897))

(assert (=> b!950983 m!883895))

(assert (=> b!950983 m!883895))

(assert (=> b!950983 m!883897))

(assert (=> b!950868 d!115479))

(declare-fun b!951026 () Bool)

(declare-fun e!535504 () Bool)

(declare-fun call!41415 () Bool)

(assert (=> b!951026 (= e!535504 (not call!41415))))

(declare-fun bm!41406 () Bool)

(declare-fun call!41412 () ListLongMap!12227)

(declare-fun getCurrentListMapNoExtraKeys!3360 (array!57543 array!57541 (_ BitVec 32) (_ BitVec 32) V!32615 V!32615 (_ BitVec 32) Int) ListLongMap!12227)

(assert (=> bm!41406 (= call!41412 (getCurrentListMapNoExtraKeys!3360 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun b!951027 () Bool)

(declare-fun e!535507 () Bool)

(declare-fun e!535502 () Bool)

(assert (=> b!951027 (= e!535507 e!535502)))

(declare-fun res!637408 () Bool)

(assert (=> b!951027 (=> (not res!637408) (not e!535502))))

(declare-fun lt!428266 () ListLongMap!12227)

(assert (=> b!951027 (= res!637408 (contains!5230 lt!428266 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951027 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))))))

(declare-fun b!951028 () Bool)

(declare-fun e!535511 () Bool)

(declare-fun apply!886 (ListLongMap!12227 (_ BitVec 64)) V!32615)

(assert (=> b!951028 (= e!535511 (= (apply!886 lt!428266 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5608 thiss!1141)))))

(declare-fun b!951029 () Bool)

(declare-fun e!535500 () Unit!31966)

(declare-fun Unit!31969 () Unit!31966)

(assert (=> b!951029 (= e!535500 Unit!31969)))

(declare-fun bm!41407 () Bool)

(declare-fun call!41414 () ListLongMap!12227)

(assert (=> bm!41407 (= call!41414 call!41412)))

(declare-fun b!951030 () Bool)

(declare-fun e!535512 () Bool)

(declare-fun e!535501 () Bool)

(assert (=> b!951030 (= e!535512 e!535501)))

(declare-fun c!99489 () Bool)

(assert (=> b!951030 (= c!99489 (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951031 () Bool)

(declare-fun e!535508 () ListLongMap!12227)

(declare-fun call!41410 () ListLongMap!12227)

(assert (=> b!951031 (= e!535508 call!41410)))

(declare-fun b!951032 () Bool)

(declare-fun e!535506 () ListLongMap!12227)

(assert (=> b!951032 (= e!535506 e!535508)))

(declare-fun c!99487 () Bool)

(assert (=> b!951032 (= c!99487 (and (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41409 () Bool)

(declare-fun call!41409 () Bool)

(assert (=> bm!41409 (= call!41409 (contains!5230 lt!428266 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951033 () Bool)

(declare-fun e!535505 () Bool)

(assert (=> b!951033 (= e!535505 (validKeyInArray!0 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41410 () Bool)

(assert (=> bm!41410 (= call!41415 (contains!5230 lt!428266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951034 () Bool)

(declare-fun get!14553 (ValueCell!9887 V!32615) V!32615)

(declare-fun dynLambda!1669 (Int (_ BitVec 64)) V!32615)

(assert (=> b!951034 (= e!535502 (= (apply!886 lt!428266 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)) (get!14553 (select (arr!27667 (_values!5795 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1669 (defaultEntry!5772 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951034 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28145 (_values!5795 thiss!1141))))))

(assert (=> b!951034 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))))))

(declare-fun b!951035 () Bool)

(declare-fun e!535510 () ListLongMap!12227)

(assert (=> b!951035 (= e!535510 call!41410)))

(declare-fun b!951036 () Bool)

(assert (=> b!951036 (= e!535504 e!535511)))

(declare-fun res!637407 () Bool)

(assert (=> b!951036 (= res!637407 call!41415)))

(assert (=> b!951036 (=> (not res!637407) (not e!535511))))

(declare-fun b!951037 () Bool)

(declare-fun call!41413 () ListLongMap!12227)

(declare-fun +!2872 (ListLongMap!12227 tuple2!13528) ListLongMap!12227)

(assert (=> b!951037 (= e!535506 (+!2872 call!41413 (tuple2!13529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5608 thiss!1141))))))

(declare-fun b!951038 () Bool)

(declare-fun e!535503 () Bool)

(assert (=> b!951038 (= e!535501 e!535503)))

(declare-fun res!637413 () Bool)

(assert (=> b!951038 (= res!637413 call!41409)))

(assert (=> b!951038 (=> (not res!637413) (not e!535503))))

(declare-fun b!951039 () Bool)

(assert (=> b!951039 (= e!535501 (not call!41409))))

(declare-fun b!951040 () Bool)

(declare-fun lt!428270 () Unit!31966)

(assert (=> b!951040 (= e!535500 lt!428270)))

(declare-fun lt!428262 () ListLongMap!12227)

(assert (=> b!951040 (= lt!428262 (getCurrentListMapNoExtraKeys!3360 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!428261 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428275 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428275 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428276 () Unit!31966)

(declare-fun addStillContains!575 (ListLongMap!12227 (_ BitVec 64) V!32615 (_ BitVec 64)) Unit!31966)

(assert (=> b!951040 (= lt!428276 (addStillContains!575 lt!428262 lt!428261 (zeroValue!5608 thiss!1141) lt!428275))))

(assert (=> b!951040 (contains!5230 (+!2872 lt!428262 (tuple2!13529 lt!428261 (zeroValue!5608 thiss!1141))) lt!428275)))

(declare-fun lt!428274 () Unit!31966)

(assert (=> b!951040 (= lt!428274 lt!428276)))

(declare-fun lt!428269 () ListLongMap!12227)

(assert (=> b!951040 (= lt!428269 (getCurrentListMapNoExtraKeys!3360 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!428265 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428265 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428258 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428258 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428268 () Unit!31966)

(declare-fun addApplyDifferent!456 (ListLongMap!12227 (_ BitVec 64) V!32615 (_ BitVec 64)) Unit!31966)

(assert (=> b!951040 (= lt!428268 (addApplyDifferent!456 lt!428269 lt!428265 (minValue!5608 thiss!1141) lt!428258))))

(assert (=> b!951040 (= (apply!886 (+!2872 lt!428269 (tuple2!13529 lt!428265 (minValue!5608 thiss!1141))) lt!428258) (apply!886 lt!428269 lt!428258))))

(declare-fun lt!428264 () Unit!31966)

(assert (=> b!951040 (= lt!428264 lt!428268)))

(declare-fun lt!428271 () ListLongMap!12227)

(assert (=> b!951040 (= lt!428271 (getCurrentListMapNoExtraKeys!3360 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!428277 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428272 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428272 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428257 () Unit!31966)

(assert (=> b!951040 (= lt!428257 (addApplyDifferent!456 lt!428271 lt!428277 (zeroValue!5608 thiss!1141) lt!428272))))

(assert (=> b!951040 (= (apply!886 (+!2872 lt!428271 (tuple2!13529 lt!428277 (zeroValue!5608 thiss!1141))) lt!428272) (apply!886 lt!428271 lt!428272))))

(declare-fun lt!428278 () Unit!31966)

(assert (=> b!951040 (= lt!428278 lt!428257)))

(declare-fun lt!428273 () ListLongMap!12227)

(assert (=> b!951040 (= lt!428273 (getCurrentListMapNoExtraKeys!3360 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)))))

(declare-fun lt!428263 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428263 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428260 () (_ BitVec 64))

(assert (=> b!951040 (= lt!428260 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951040 (= lt!428270 (addApplyDifferent!456 lt!428273 lt!428263 (minValue!5608 thiss!1141) lt!428260))))

(assert (=> b!951040 (= (apply!886 (+!2872 lt!428273 (tuple2!13529 lt!428263 (minValue!5608 thiss!1141))) lt!428260) (apply!886 lt!428273 lt!428260))))

(declare-fun b!951041 () Bool)

(declare-fun res!637409 () Bool)

(assert (=> b!951041 (=> (not res!637409) (not e!535512))))

(assert (=> b!951041 (= res!637409 e!535507)))

(declare-fun res!637410 () Bool)

(assert (=> b!951041 (=> res!637410 e!535507)))

(declare-fun e!535509 () Bool)

(assert (=> b!951041 (= res!637410 (not e!535509))))

(declare-fun res!637412 () Bool)

(assert (=> b!951041 (=> (not res!637412) (not e!535509))))

(assert (=> b!951041 (= res!637412 (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))))))

(declare-fun bm!41411 () Bool)

(assert (=> bm!41411 (= call!41410 call!41413)))

(declare-fun b!951042 () Bool)

(declare-fun res!637406 () Bool)

(assert (=> b!951042 (=> (not res!637406) (not e!535512))))

(assert (=> b!951042 (= res!637406 e!535504)))

(declare-fun c!99486 () Bool)

(assert (=> b!951042 (= c!99486 (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951043 () Bool)

(declare-fun c!99490 () Bool)

(assert (=> b!951043 (= c!99490 (and (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951043 (= e!535508 e!535510)))

(declare-fun bm!41408 () Bool)

(declare-fun call!41411 () ListLongMap!12227)

(declare-fun c!99488 () Bool)

(assert (=> bm!41408 (= call!41413 (+!2872 (ite c!99488 call!41412 (ite c!99487 call!41414 call!41411)) (ite (or c!99488 c!99487) (tuple2!13529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5608 thiss!1141)) (tuple2!13529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5608 thiss!1141)))))))

(declare-fun d!115481 () Bool)

(assert (=> d!115481 e!535512))

(declare-fun res!637411 () Bool)

(assert (=> d!115481 (=> (not res!637411) (not e!535512))))

(assert (=> d!115481 (= res!637411 (or (bvsge #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))))))))

(declare-fun lt!428259 () ListLongMap!12227)

(assert (=> d!115481 (= lt!428266 lt!428259)))

(declare-fun lt!428267 () Unit!31966)

(assert (=> d!115481 (= lt!428267 e!535500)))

(declare-fun c!99485 () Bool)

(assert (=> d!115481 (= c!99485 e!535505)))

(declare-fun res!637405 () Bool)

(assert (=> d!115481 (=> (not res!637405) (not e!535505))))

(assert (=> d!115481 (= res!637405 (bvslt #b00000000000000000000000000000000 (size!28146 (_keys!10734 thiss!1141))))))

(assert (=> d!115481 (= lt!428259 e!535506)))

(assert (=> d!115481 (= c!99488 (and (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5504 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115481 (validMask!0 (mask!27608 thiss!1141))))

(assert (=> d!115481 (= (getCurrentListMap!3362 (_keys!10734 thiss!1141) (_values!5795 thiss!1141) (mask!27608 thiss!1141) (extraKeys!5504 thiss!1141) (zeroValue!5608 thiss!1141) (minValue!5608 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5772 thiss!1141)) lt!428266)))

(declare-fun b!951044 () Bool)

(assert (=> b!951044 (= e!535510 call!41411)))

(declare-fun b!951045 () Bool)

(assert (=> b!951045 (= e!535509 (validKeyInArray!0 (select (arr!27668 (_keys!10734 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41412 () Bool)

(assert (=> bm!41412 (= call!41411 call!41414)))

(declare-fun b!951046 () Bool)

(assert (=> b!951046 (= e!535503 (= (apply!886 lt!428266 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5608 thiss!1141)))))

(assert (= (and d!115481 c!99488) b!951037))

(assert (= (and d!115481 (not c!99488)) b!951032))

(assert (= (and b!951032 c!99487) b!951031))

(assert (= (and b!951032 (not c!99487)) b!951043))

(assert (= (and b!951043 c!99490) b!951035))

(assert (= (and b!951043 (not c!99490)) b!951044))

(assert (= (or b!951035 b!951044) bm!41412))

(assert (= (or b!951031 bm!41412) bm!41407))

(assert (= (or b!951031 b!951035) bm!41411))

(assert (= (or b!951037 bm!41407) bm!41406))

(assert (= (or b!951037 bm!41411) bm!41408))

(assert (= (and d!115481 res!637405) b!951033))

(assert (= (and d!115481 c!99485) b!951040))

(assert (= (and d!115481 (not c!99485)) b!951029))

(assert (= (and d!115481 res!637411) b!951041))

(assert (= (and b!951041 res!637412) b!951045))

(assert (= (and b!951041 (not res!637410)) b!951027))

(assert (= (and b!951027 res!637408) b!951034))

(assert (= (and b!951041 res!637409) b!951042))

(assert (= (and b!951042 c!99486) b!951036))

(assert (= (and b!951042 (not c!99486)) b!951026))

(assert (= (and b!951036 res!637407) b!951028))

(assert (= (or b!951036 b!951026) bm!41410))

(assert (= (and b!951042 res!637406) b!951030))

(assert (= (and b!951030 c!99489) b!951038))

(assert (= (and b!951030 (not c!99489)) b!951039))

(assert (= (and b!951038 res!637413) b!951046))

(assert (= (or b!951038 b!951039) bm!41409))

(declare-fun b_lambda!14377 () Bool)

(assert (=> (not b_lambda!14377) (not b!951034)))

(declare-fun t!27654 () Bool)

(declare-fun tb!6181 () Bool)

(assert (=> (and b!950862 (= (defaultEntry!5772 thiss!1141) (defaultEntry!5772 thiss!1141)) t!27654) tb!6181))

(declare-fun result!12281 () Bool)

(assert (=> tb!6181 (= result!12281 tp_is_empty!20737)))

(assert (=> b!951034 t!27654))

(declare-fun b_and!29699 () Bool)

(assert (= b_and!29693 (and (=> t!27654 result!12281) b_and!29699)))

(declare-fun m!883899 () Bool)

(assert (=> bm!41410 m!883899))

(declare-fun m!883901 () Bool)

(assert (=> b!951046 m!883901))

(declare-fun m!883903 () Bool)

(assert (=> b!951037 m!883903))

(declare-fun m!883905 () Bool)

(assert (=> bm!41408 m!883905))

(assert (=> b!951033 m!883877))

(assert (=> b!951033 m!883877))

(assert (=> b!951033 m!883879))

(declare-fun m!883907 () Bool)

(assert (=> b!951028 m!883907))

(assert (=> b!951045 m!883877))

(assert (=> b!951045 m!883877))

(assert (=> b!951045 m!883879))

(assert (=> d!115481 m!883817))

(declare-fun m!883909 () Bool)

(assert (=> bm!41406 m!883909))

(declare-fun m!883911 () Bool)

(assert (=> b!951040 m!883911))

(declare-fun m!883913 () Bool)

(assert (=> b!951040 m!883913))

(declare-fun m!883915 () Bool)

(assert (=> b!951040 m!883915))

(declare-fun m!883917 () Bool)

(assert (=> b!951040 m!883917))

(declare-fun m!883919 () Bool)

(assert (=> b!951040 m!883919))

(declare-fun m!883921 () Bool)

(assert (=> b!951040 m!883921))

(assert (=> b!951040 m!883909))

(declare-fun m!883923 () Bool)

(assert (=> b!951040 m!883923))

(declare-fun m!883925 () Bool)

(assert (=> b!951040 m!883925))

(assert (=> b!951040 m!883877))

(assert (=> b!951040 m!883919))

(declare-fun m!883927 () Bool)

(assert (=> b!951040 m!883927))

(declare-fun m!883929 () Bool)

(assert (=> b!951040 m!883929))

(assert (=> b!951040 m!883915))

(declare-fun m!883931 () Bool)

(assert (=> b!951040 m!883931))

(declare-fun m!883933 () Bool)

(assert (=> b!951040 m!883933))

(declare-fun m!883935 () Bool)

(assert (=> b!951040 m!883935))

(assert (=> b!951040 m!883935))

(declare-fun m!883937 () Bool)

(assert (=> b!951040 m!883937))

(assert (=> b!951040 m!883913))

(declare-fun m!883939 () Bool)

(assert (=> b!951040 m!883939))

(declare-fun m!883941 () Bool)

(assert (=> bm!41409 m!883941))

(assert (=> b!951027 m!883877))

(assert (=> b!951027 m!883877))

(declare-fun m!883943 () Bool)

(assert (=> b!951027 m!883943))

(declare-fun m!883945 () Bool)

(assert (=> b!951034 m!883945))

(declare-fun m!883947 () Bool)

(assert (=> b!951034 m!883947))

(declare-fun m!883949 () Bool)

(assert (=> b!951034 m!883949))

(assert (=> b!951034 m!883877))

(declare-fun m!883951 () Bool)

(assert (=> b!951034 m!883951))

(assert (=> b!951034 m!883947))

(assert (=> b!951034 m!883945))

(assert (=> b!951034 m!883877))

(assert (=> b!950868 d!115481))

(declare-fun b!951061 () Bool)

(declare-fun e!535520 () SeekEntryResult!9098)

(declare-fun lt!428288 () SeekEntryResult!9098)

(assert (=> b!951061 (= e!535520 (MissingZero!9098 (index!38765 lt!428288)))))

(declare-fun d!115483 () Bool)

(declare-fun lt!428290 () SeekEntryResult!9098)

(assert (=> d!115483 (and (or ((_ is MissingVacant!9098) lt!428290) (not ((_ is Found!9098) lt!428290)) (and (bvsge (index!38764 lt!428290) #b00000000000000000000000000000000) (bvslt (index!38764 lt!428290) (size!28146 (_keys!10734 thiss!1141))))) (not ((_ is MissingVacant!9098) lt!428290)) (or (not ((_ is Found!9098) lt!428290)) (= (select (arr!27668 (_keys!10734 thiss!1141)) (index!38764 lt!428290)) key!756)))))

(declare-fun e!535521 () SeekEntryResult!9098)

(assert (=> d!115483 (= lt!428290 e!535521)))

(declare-fun c!99497 () Bool)

(assert (=> d!115483 (= c!99497 (and ((_ is Intermediate!9098) lt!428288) (undefined!9910 lt!428288)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57543 (_ BitVec 32)) SeekEntryResult!9098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115483 (= lt!428288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27608 thiss!1141)) key!756 (_keys!10734 thiss!1141) (mask!27608 thiss!1141)))))

(assert (=> d!115483 (validMask!0 (mask!27608 thiss!1141))))

(assert (=> d!115483 (= (seekEntry!0 key!756 (_keys!10734 thiss!1141) (mask!27608 thiss!1141)) lt!428290)))

(declare-fun b!951062 () Bool)

(assert (=> b!951062 (= e!535521 Undefined!9098)))

(declare-fun b!951063 () Bool)

(declare-fun lt!428287 () SeekEntryResult!9098)

(assert (=> b!951063 (= e!535520 (ite ((_ is MissingVacant!9098) lt!428287) (MissingZero!9098 (index!38766 lt!428287)) lt!428287))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57543 (_ BitVec 32)) SeekEntryResult!9098)

(assert (=> b!951063 (= lt!428287 (seekKeyOrZeroReturnVacant!0 (x!81704 lt!428288) (index!38765 lt!428288) (index!38765 lt!428288) key!756 (_keys!10734 thiss!1141) (mask!27608 thiss!1141)))))

(declare-fun b!951064 () Bool)

(declare-fun c!99499 () Bool)

(declare-fun lt!428289 () (_ BitVec 64))

(assert (=> b!951064 (= c!99499 (= lt!428289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535519 () SeekEntryResult!9098)

(assert (=> b!951064 (= e!535519 e!535520)))

(declare-fun b!951065 () Bool)

(assert (=> b!951065 (= e!535521 e!535519)))

(assert (=> b!951065 (= lt!428289 (select (arr!27668 (_keys!10734 thiss!1141)) (index!38765 lt!428288)))))

(declare-fun c!99498 () Bool)

(assert (=> b!951065 (= c!99498 (= lt!428289 key!756))))

(declare-fun b!951066 () Bool)

(assert (=> b!951066 (= e!535519 (Found!9098 (index!38765 lt!428288)))))

(assert (= (and d!115483 c!99497) b!951062))

(assert (= (and d!115483 (not c!99497)) b!951065))

(assert (= (and b!951065 c!99498) b!951066))

(assert (= (and b!951065 (not c!99498)) b!951064))

(assert (= (and b!951064 c!99499) b!951061))

(assert (= (and b!951064 (not c!99499)) b!951063))

(declare-fun m!883953 () Bool)

(assert (=> d!115483 m!883953))

(declare-fun m!883955 () Bool)

(assert (=> d!115483 m!883955))

(assert (=> d!115483 m!883955))

(declare-fun m!883957 () Bool)

(assert (=> d!115483 m!883957))

(assert (=> d!115483 m!883817))

(declare-fun m!883959 () Bool)

(assert (=> b!951063 m!883959))

(declare-fun m!883961 () Bool)

(assert (=> b!951065 m!883961))

(assert (=> b!950865 d!115483))

(declare-fun mapIsEmpty!33023 () Bool)

(declare-fun mapRes!33023 () Bool)

(assert (=> mapIsEmpty!33023 mapRes!33023))

(declare-fun b!951073 () Bool)

(declare-fun e!535527 () Bool)

(assert (=> b!951073 (= e!535527 tp_is_empty!20737)))

(declare-fun condMapEmpty!33023 () Bool)

(declare-fun mapDefault!33023 () ValueCell!9887)

(assert (=> mapNonEmpty!33014 (= condMapEmpty!33023 (= mapRest!33014 ((as const (Array (_ BitVec 32) ValueCell!9887)) mapDefault!33023)))))

(declare-fun e!535526 () Bool)

(assert (=> mapNonEmpty!33014 (= tp!63280 (and e!535526 mapRes!33023))))

(declare-fun mapNonEmpty!33023 () Bool)

(declare-fun tp!63296 () Bool)

(assert (=> mapNonEmpty!33023 (= mapRes!33023 (and tp!63296 e!535527))))

(declare-fun mapKey!33023 () (_ BitVec 32))

(declare-fun mapValue!33023 () ValueCell!9887)

(declare-fun mapRest!33023 () (Array (_ BitVec 32) ValueCell!9887))

(assert (=> mapNonEmpty!33023 (= mapRest!33014 (store mapRest!33023 mapKey!33023 mapValue!33023))))

(declare-fun b!951074 () Bool)

(assert (=> b!951074 (= e!535526 tp_is_empty!20737)))

(assert (= (and mapNonEmpty!33014 condMapEmpty!33023) mapIsEmpty!33023))

(assert (= (and mapNonEmpty!33014 (not condMapEmpty!33023)) mapNonEmpty!33023))

(assert (= (and mapNonEmpty!33023 ((_ is ValueCellFull!9887) mapValue!33023)) b!951073))

(assert (= (and mapNonEmpty!33014 ((_ is ValueCellFull!9887) mapDefault!33023)) b!951074))

(declare-fun m!883963 () Bool)

(assert (=> mapNonEmpty!33023 m!883963))

(declare-fun b_lambda!14379 () Bool)

(assert (= b_lambda!14377 (or (and b!950862 b_free!18229) b_lambda!14379)))

(check-sat (not bm!41406) (not d!115481) (not b!951063) (not b!950973) (not b_next!18229) (not bm!41388) (not b!951028) (not b!951034) (not b!950972) (not d!115467) (not b!951033) tp_is_empty!20737 (not b!951027) (not b!951037) (not b!950946) b_and!29699 (not b!951040) (not b_lambda!14379) (not bm!41408) (not b!951045) (not b!950981) (not bm!41391) (not d!115479) (not b!950957) (not b!950983) (not mapNonEmpty!33023) (not d!115483) (not bm!41409) (not b!951046) (not b!950971) (not b!950947) (not bm!41410) (not b!950959) (not b!950945))
(check-sat b_and!29699 (not b_next!18229))
