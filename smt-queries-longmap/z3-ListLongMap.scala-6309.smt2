; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81006 () Bool)

(assert start!81006)

(declare-fun b!948388 () Bool)

(declare-fun b_free!18175 () Bool)

(declare-fun b_next!18175 () Bool)

(assert (=> b!948388 (= b_free!18175 (not b_next!18175))))

(declare-fun tp!63088 () Bool)

(declare-fun b_and!29607 () Bool)

(assert (=> b!948388 (= tp!63088 b_and!29607)))

(declare-fun b!948378 () Bool)

(declare-fun e!533860 () Bool)

(declare-fun e!533866 () Bool)

(declare-fun mapRes!32902 () Bool)

(assert (=> b!948378 (= e!533860 (and e!533866 mapRes!32902))))

(declare-fun condMapEmpty!32902 () Bool)

(declare-datatypes ((V!32543 0))(
  ( (V!32544 (val!10392 Int)) )
))
(declare-datatypes ((ValueCell!9860 0))(
  ( (ValueCellFull!9860 (v!12923 V!32543)) (EmptyCell!9860) )
))
(declare-datatypes ((array!57415 0))(
  ( (array!57416 (arr!27613 (Array (_ BitVec 32) ValueCell!9860)) (size!28087 (_ BitVec 32))) )
))
(declare-datatypes ((array!57417 0))(
  ( (array!57418 (arr!27614 (Array (_ BitVec 32) (_ BitVec 64))) (size!28088 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4870 0))(
  ( (LongMapFixedSize!4871 (defaultEntry!5732 Int) (mask!27515 (_ BitVec 32)) (extraKeys!5464 (_ BitVec 32)) (zeroValue!5568 V!32543) (minValue!5568 V!32543) (_size!2490 (_ BitVec 32)) (_keys!10671 array!57417) (_values!5755 array!57415) (_vacant!2490 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4870)

(declare-fun mapDefault!32902 () ValueCell!9860)

(assert (=> b!948378 (= condMapEmpty!32902 (= (arr!27613 (_values!5755 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9860)) mapDefault!32902)))))

(declare-fun b!948379 () Bool)

(declare-fun e!533867 () Bool)

(declare-datatypes ((SeekEntryResult!9078 0))(
  ( (MissingZero!9078 (index!38683 (_ BitVec 32))) (Found!9078 (index!38684 (_ BitVec 32))) (Intermediate!9078 (undefined!9890 Bool) (index!38685 (_ BitVec 32)) (x!81492 (_ BitVec 32))) (Undefined!9078) (MissingVacant!9078 (index!38686 (_ BitVec 32))) )
))
(declare-fun lt!426949 () SeekEntryResult!9078)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948379 (= e!533867 (validKeyInArray!0 (select (arr!27614 (_keys!10671 thiss!1141)) (index!38684 lt!426949))))))

(declare-fun b!948380 () Bool)

(declare-fun res!636212 () Bool)

(declare-fun e!533862 () Bool)

(assert (=> b!948380 (=> (not res!636212) (not e!533862))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!948380 (= res!636212 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948381 () Bool)

(declare-fun e!533863 () Bool)

(assert (=> b!948381 (= e!533862 e!533863)))

(declare-fun res!636214 () Bool)

(assert (=> b!948381 (=> (not res!636214) (not e!533863))))

(get-info :version)

(assert (=> b!948381 (= res!636214 ((_ is Found!9078) lt!426949))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57417 (_ BitVec 32)) SeekEntryResult!9078)

(assert (=> b!948381 (= lt!426949 (seekEntry!0 key!756 (_keys!10671 thiss!1141) (mask!27515 thiss!1141)))))

(declare-fun res!636216 () Bool)

(assert (=> start!81006 (=> (not res!636216) (not e!533862))))

(declare-fun valid!1867 (LongMapFixedSize!4870) Bool)

(assert (=> start!81006 (= res!636216 (valid!1867 thiss!1141))))

(assert (=> start!81006 e!533862))

(declare-fun e!533861 () Bool)

(assert (=> start!81006 e!533861))

(assert (=> start!81006 true))

(declare-fun b!948382 () Bool)

(assert (=> b!948382 (= e!533863 (not e!533867))))

(declare-fun res!636209 () Bool)

(assert (=> b!948382 (=> res!636209 e!533867)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948382 (= res!636209 (not (validMask!0 (mask!27515 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948382 (arrayContainsKey!0 (_keys!10671 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31909 0))(
  ( (Unit!31910) )
))
(declare-fun lt!426948 () Unit!31909)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57417 (_ BitVec 64) (_ BitVec 32)) Unit!31909)

(assert (=> b!948382 (= lt!426948 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10671 thiss!1141) key!756 (index!38684 lt!426949)))))

(declare-fun b!948383 () Bool)

(declare-fun res!636211 () Bool)

(assert (=> b!948383 (=> res!636211 e!533867)))

(declare-datatypes ((List!19291 0))(
  ( (Nil!19288) (Cons!19287 (h!20449 (_ BitVec 64)) (t!27604 List!19291)) )
))
(declare-fun arrayNoDuplicates!0 (array!57417 (_ BitVec 32) List!19291) Bool)

(assert (=> b!948383 (= res!636211 (not (arrayNoDuplicates!0 (_keys!10671 thiss!1141) #b00000000000000000000000000000000 Nil!19288)))))

(declare-fun b!948384 () Bool)

(declare-fun tp_is_empty!20683 () Bool)

(assert (=> b!948384 (= e!533866 tp_is_empty!20683)))

(declare-fun b!948385 () Bool)

(declare-fun res!636215 () Bool)

(assert (=> b!948385 (=> res!636215 e!533867)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57417 (_ BitVec 32)) Bool)

(assert (=> b!948385 (= res!636215 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10671 thiss!1141) (mask!27515 thiss!1141))))))

(declare-fun b!948386 () Bool)

(declare-fun res!636210 () Bool)

(assert (=> b!948386 (=> res!636210 e!533867)))

(assert (=> b!948386 (= res!636210 (or (not (= (size!28087 (_values!5755 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27515 thiss!1141)))) (not (= (size!28088 (_keys!10671 thiss!1141)) (size!28087 (_values!5755 thiss!1141)))) (bvslt (mask!27515 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5464 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5464 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32902 () Bool)

(assert (=> mapIsEmpty!32902 mapRes!32902))

(declare-fun b!948387 () Bool)

(declare-fun e!533864 () Bool)

(assert (=> b!948387 (= e!533864 tp_is_empty!20683)))

(declare-fun array_inv!21526 (array!57417) Bool)

(declare-fun array_inv!21527 (array!57415) Bool)

(assert (=> b!948388 (= e!533861 (and tp!63088 tp_is_empty!20683 (array_inv!21526 (_keys!10671 thiss!1141)) (array_inv!21527 (_values!5755 thiss!1141)) e!533860))))

(declare-fun mapNonEmpty!32902 () Bool)

(declare-fun tp!63087 () Bool)

(assert (=> mapNonEmpty!32902 (= mapRes!32902 (and tp!63087 e!533864))))

(declare-fun mapRest!32902 () (Array (_ BitVec 32) ValueCell!9860))

(declare-fun mapValue!32902 () ValueCell!9860)

(declare-fun mapKey!32902 () (_ BitVec 32))

(assert (=> mapNonEmpty!32902 (= (arr!27613 (_values!5755 thiss!1141)) (store mapRest!32902 mapKey!32902 mapValue!32902))))

(declare-fun b!948389 () Bool)

(declare-fun res!636213 () Bool)

(assert (=> b!948389 (=> res!636213 e!533867)))

(assert (=> b!948389 (= res!636213 (or (bvslt (index!38684 lt!426949) #b00000000000000000000000000000000) (bvsge (index!38684 lt!426949) (size!28088 (_keys!10671 thiss!1141)))))))

(assert (= (and start!81006 res!636216) b!948380))

(assert (= (and b!948380 res!636212) b!948381))

(assert (= (and b!948381 res!636214) b!948382))

(assert (= (and b!948382 (not res!636209)) b!948386))

(assert (= (and b!948386 (not res!636210)) b!948385))

(assert (= (and b!948385 (not res!636215)) b!948383))

(assert (= (and b!948383 (not res!636211)) b!948389))

(assert (= (and b!948389 (not res!636213)) b!948379))

(assert (= (and b!948378 condMapEmpty!32902) mapIsEmpty!32902))

(assert (= (and b!948378 (not condMapEmpty!32902)) mapNonEmpty!32902))

(assert (= (and mapNonEmpty!32902 ((_ is ValueCellFull!9860) mapValue!32902)) b!948387))

(assert (= (and b!948378 ((_ is ValueCellFull!9860) mapDefault!32902)) b!948384))

(assert (= b!948388 b!948378))

(assert (= start!81006 b!948388))

(declare-fun m!881701 () Bool)

(assert (=> start!81006 m!881701))

(declare-fun m!881703 () Bool)

(assert (=> b!948382 m!881703))

(declare-fun m!881705 () Bool)

(assert (=> b!948382 m!881705))

(declare-fun m!881707 () Bool)

(assert (=> b!948382 m!881707))

(declare-fun m!881709 () Bool)

(assert (=> b!948383 m!881709))

(declare-fun m!881711 () Bool)

(assert (=> b!948379 m!881711))

(assert (=> b!948379 m!881711))

(declare-fun m!881713 () Bool)

(assert (=> b!948379 m!881713))

(declare-fun m!881715 () Bool)

(assert (=> b!948381 m!881715))

(declare-fun m!881717 () Bool)

(assert (=> b!948388 m!881717))

(declare-fun m!881719 () Bool)

(assert (=> b!948388 m!881719))

(declare-fun m!881721 () Bool)

(assert (=> b!948385 m!881721))

(declare-fun m!881723 () Bool)

(assert (=> mapNonEmpty!32902 m!881723))

(check-sat (not b!948383) (not b!948385) (not start!81006) (not b!948388) b_and!29607 (not mapNonEmpty!32902) (not b!948379) tp_is_empty!20683 (not b_next!18175) (not b!948381) (not b!948382))
(check-sat b_and!29607 (not b_next!18175))
(get-model)

(declare-fun b!948471 () Bool)

(declare-fun e!533923 () Bool)

(declare-fun call!41166 () Bool)

(assert (=> b!948471 (= e!533923 call!41166)))

(declare-fun b!948472 () Bool)

(declare-fun e!533922 () Bool)

(declare-fun e!533924 () Bool)

(assert (=> b!948472 (= e!533922 e!533924)))

(declare-fun c!98987 () Bool)

(assert (=> b!948472 (= c!98987 (validKeyInArray!0 (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41163 () Bool)

(assert (=> bm!41163 (= call!41166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10671 thiss!1141) (mask!27515 thiss!1141)))))

(declare-fun b!948473 () Bool)

(assert (=> b!948473 (= e!533924 e!533923)))

(declare-fun lt!426969 () (_ BitVec 64))

(assert (=> b!948473 (= lt!426969 (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426970 () Unit!31909)

(assert (=> b!948473 (= lt!426970 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10671 thiss!1141) lt!426969 #b00000000000000000000000000000000))))

(assert (=> b!948473 (arrayContainsKey!0 (_keys!10671 thiss!1141) lt!426969 #b00000000000000000000000000000000)))

(declare-fun lt!426968 () Unit!31909)

(assert (=> b!948473 (= lt!426968 lt!426970)))

(declare-fun res!636269 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57417 (_ BitVec 32)) SeekEntryResult!9078)

(assert (=> b!948473 (= res!636269 (= (seekEntryOrOpen!0 (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000) (_keys!10671 thiss!1141) (mask!27515 thiss!1141)) (Found!9078 #b00000000000000000000000000000000)))))

(assert (=> b!948473 (=> (not res!636269) (not e!533923))))

(declare-fun b!948470 () Bool)

(assert (=> b!948470 (= e!533924 call!41166)))

(declare-fun d!115011 () Bool)

(declare-fun res!636270 () Bool)

(assert (=> d!115011 (=> res!636270 e!533922)))

(assert (=> d!115011 (= res!636270 (bvsge #b00000000000000000000000000000000 (size!28088 (_keys!10671 thiss!1141))))))

(assert (=> d!115011 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10671 thiss!1141) (mask!27515 thiss!1141)) e!533922)))

(assert (= (and d!115011 (not res!636270)) b!948472))

(assert (= (and b!948472 c!98987) b!948473))

(assert (= (and b!948472 (not c!98987)) b!948470))

(assert (= (and b!948473 res!636269) b!948471))

(assert (= (or b!948471 b!948470) bm!41163))

(declare-fun m!881773 () Bool)

(assert (=> b!948472 m!881773))

(assert (=> b!948472 m!881773))

(declare-fun m!881775 () Bool)

(assert (=> b!948472 m!881775))

(declare-fun m!881777 () Bool)

(assert (=> bm!41163 m!881777))

(assert (=> b!948473 m!881773))

(declare-fun m!881779 () Bool)

(assert (=> b!948473 m!881779))

(declare-fun m!881781 () Bool)

(assert (=> b!948473 m!881781))

(assert (=> b!948473 m!881773))

(declare-fun m!881783 () Bool)

(assert (=> b!948473 m!881783))

(assert (=> b!948385 d!115011))

(declare-fun d!115013 () Bool)

(assert (=> d!115013 (= (validKeyInArray!0 (select (arr!27614 (_keys!10671 thiss!1141)) (index!38684 lt!426949))) (and (not (= (select (arr!27614 (_keys!10671 thiss!1141)) (index!38684 lt!426949)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27614 (_keys!10671 thiss!1141)) (index!38684 lt!426949)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948379 d!115013))

(declare-fun d!115015 () Bool)

(assert (=> d!115015 (= (array_inv!21526 (_keys!10671 thiss!1141)) (bvsge (size!28088 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948388 d!115015))

(declare-fun d!115017 () Bool)

(assert (=> d!115017 (= (array_inv!21527 (_values!5755 thiss!1141)) (bvsge (size!28087 (_values!5755 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948388 d!115017))

(declare-fun d!115019 () Bool)

(declare-fun res!636278 () Bool)

(declare-fun e!533936 () Bool)

(assert (=> d!115019 (=> res!636278 e!533936)))

(assert (=> d!115019 (= res!636278 (bvsge #b00000000000000000000000000000000 (size!28088 (_keys!10671 thiss!1141))))))

(assert (=> d!115019 (= (arrayNoDuplicates!0 (_keys!10671 thiss!1141) #b00000000000000000000000000000000 Nil!19288) e!533936)))

(declare-fun b!948484 () Bool)

(declare-fun e!533933 () Bool)

(declare-fun call!41169 () Bool)

(assert (=> b!948484 (= e!533933 call!41169)))

(declare-fun b!948485 () Bool)

(declare-fun e!533934 () Bool)

(assert (=> b!948485 (= e!533934 e!533933)))

(declare-fun c!98990 () Bool)

(assert (=> b!948485 (= c!98990 (validKeyInArray!0 (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948486 () Bool)

(assert (=> b!948486 (= e!533936 e!533934)))

(declare-fun res!636277 () Bool)

(assert (=> b!948486 (=> (not res!636277) (not e!533934))))

(declare-fun e!533935 () Bool)

(assert (=> b!948486 (= res!636277 (not e!533935))))

(declare-fun res!636279 () Bool)

(assert (=> b!948486 (=> (not res!636279) (not e!533935))))

(assert (=> b!948486 (= res!636279 (validKeyInArray!0 (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948487 () Bool)

(assert (=> b!948487 (= e!533933 call!41169)))

(declare-fun bm!41166 () Bool)

(assert (=> bm!41166 (= call!41169 (arrayNoDuplicates!0 (_keys!10671 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98990 (Cons!19287 (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000) Nil!19288) Nil!19288)))))

(declare-fun b!948488 () Bool)

(declare-fun contains!5202 (List!19291 (_ BitVec 64)) Bool)

(assert (=> b!948488 (= e!533935 (contains!5202 Nil!19288 (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115019 (not res!636278)) b!948486))

(assert (= (and b!948486 res!636279) b!948488))

(assert (= (and b!948486 res!636277) b!948485))

(assert (= (and b!948485 c!98990) b!948484))

(assert (= (and b!948485 (not c!98990)) b!948487))

(assert (= (or b!948484 b!948487) bm!41166))

(assert (=> b!948485 m!881773))

(assert (=> b!948485 m!881773))

(assert (=> b!948485 m!881775))

(assert (=> b!948486 m!881773))

(assert (=> b!948486 m!881773))

(assert (=> b!948486 m!881775))

(assert (=> bm!41166 m!881773))

(declare-fun m!881785 () Bool)

(assert (=> bm!41166 m!881785))

(assert (=> b!948488 m!881773))

(assert (=> b!948488 m!881773))

(declare-fun m!881787 () Bool)

(assert (=> b!948488 m!881787))

(assert (=> b!948383 d!115019))

(declare-fun d!115021 () Bool)

(assert (=> d!115021 (= (validMask!0 (mask!27515 thiss!1141)) (and (or (= (mask!27515 thiss!1141) #b00000000000000000000000000000111) (= (mask!27515 thiss!1141) #b00000000000000000000000000001111) (= (mask!27515 thiss!1141) #b00000000000000000000000000011111) (= (mask!27515 thiss!1141) #b00000000000000000000000000111111) (= (mask!27515 thiss!1141) #b00000000000000000000000001111111) (= (mask!27515 thiss!1141) #b00000000000000000000000011111111) (= (mask!27515 thiss!1141) #b00000000000000000000000111111111) (= (mask!27515 thiss!1141) #b00000000000000000000001111111111) (= (mask!27515 thiss!1141) #b00000000000000000000011111111111) (= (mask!27515 thiss!1141) #b00000000000000000000111111111111) (= (mask!27515 thiss!1141) #b00000000000000000001111111111111) (= (mask!27515 thiss!1141) #b00000000000000000011111111111111) (= (mask!27515 thiss!1141) #b00000000000000000111111111111111) (= (mask!27515 thiss!1141) #b00000000000000001111111111111111) (= (mask!27515 thiss!1141) #b00000000000000011111111111111111) (= (mask!27515 thiss!1141) #b00000000000000111111111111111111) (= (mask!27515 thiss!1141) #b00000000000001111111111111111111) (= (mask!27515 thiss!1141) #b00000000000011111111111111111111) (= (mask!27515 thiss!1141) #b00000000000111111111111111111111) (= (mask!27515 thiss!1141) #b00000000001111111111111111111111) (= (mask!27515 thiss!1141) #b00000000011111111111111111111111) (= (mask!27515 thiss!1141) #b00000000111111111111111111111111) (= (mask!27515 thiss!1141) #b00000001111111111111111111111111) (= (mask!27515 thiss!1141) #b00000011111111111111111111111111) (= (mask!27515 thiss!1141) #b00000111111111111111111111111111) (= (mask!27515 thiss!1141) #b00001111111111111111111111111111) (= (mask!27515 thiss!1141) #b00011111111111111111111111111111) (= (mask!27515 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27515 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948382 d!115021))

(declare-fun d!115023 () Bool)

(declare-fun res!636284 () Bool)

(declare-fun e!533941 () Bool)

(assert (=> d!115023 (=> res!636284 e!533941)))

(assert (=> d!115023 (= res!636284 (= (select (arr!27614 (_keys!10671 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115023 (= (arrayContainsKey!0 (_keys!10671 thiss!1141) key!756 #b00000000000000000000000000000000) e!533941)))

(declare-fun b!948493 () Bool)

(declare-fun e!533942 () Bool)

(assert (=> b!948493 (= e!533941 e!533942)))

(declare-fun res!636285 () Bool)

(assert (=> b!948493 (=> (not res!636285) (not e!533942))))

(assert (=> b!948493 (= res!636285 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28088 (_keys!10671 thiss!1141))))))

(declare-fun b!948494 () Bool)

(assert (=> b!948494 (= e!533942 (arrayContainsKey!0 (_keys!10671 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115023 (not res!636284)) b!948493))

(assert (= (and b!948493 res!636285) b!948494))

(assert (=> d!115023 m!881773))

(declare-fun m!881789 () Bool)

(assert (=> b!948494 m!881789))

(assert (=> b!948382 d!115023))

(declare-fun d!115025 () Bool)

(assert (=> d!115025 (arrayContainsKey!0 (_keys!10671 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426973 () Unit!31909)

(declare-fun choose!13 (array!57417 (_ BitVec 64) (_ BitVec 32)) Unit!31909)

(assert (=> d!115025 (= lt!426973 (choose!13 (_keys!10671 thiss!1141) key!756 (index!38684 lt!426949)))))

(assert (=> d!115025 (bvsge (index!38684 lt!426949) #b00000000000000000000000000000000)))

(assert (=> d!115025 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10671 thiss!1141) key!756 (index!38684 lt!426949)) lt!426973)))

(declare-fun bs!26645 () Bool)

(assert (= bs!26645 d!115025))

(assert (=> bs!26645 m!881705))

(declare-fun m!881791 () Bool)

(assert (=> bs!26645 m!881791))

(assert (=> b!948382 d!115025))

(declare-fun b!948507 () Bool)

(declare-fun e!533950 () SeekEntryResult!9078)

(declare-fun lt!426983 () SeekEntryResult!9078)

(assert (=> b!948507 (= e!533950 (Found!9078 (index!38685 lt!426983)))))

(declare-fun b!948508 () Bool)

(declare-fun e!533951 () SeekEntryResult!9078)

(assert (=> b!948508 (= e!533951 e!533950)))

(declare-fun lt!426985 () (_ BitVec 64))

(assert (=> b!948508 (= lt!426985 (select (arr!27614 (_keys!10671 thiss!1141)) (index!38685 lt!426983)))))

(declare-fun c!98998 () Bool)

(assert (=> b!948508 (= c!98998 (= lt!426985 key!756))))

(declare-fun b!948509 () Bool)

(declare-fun e!533949 () SeekEntryResult!9078)

(assert (=> b!948509 (= e!533949 (MissingZero!9078 (index!38685 lt!426983)))))

(declare-fun b!948510 () Bool)

(declare-fun lt!426984 () SeekEntryResult!9078)

(assert (=> b!948510 (= e!533949 (ite ((_ is MissingVacant!9078) lt!426984) (MissingZero!9078 (index!38686 lt!426984)) lt!426984))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57417 (_ BitVec 32)) SeekEntryResult!9078)

(assert (=> b!948510 (= lt!426984 (seekKeyOrZeroReturnVacant!0 (x!81492 lt!426983) (index!38685 lt!426983) (index!38685 lt!426983) key!756 (_keys!10671 thiss!1141) (mask!27515 thiss!1141)))))

(declare-fun d!115027 () Bool)

(declare-fun lt!426982 () SeekEntryResult!9078)

(assert (=> d!115027 (and (or ((_ is MissingVacant!9078) lt!426982) (not ((_ is Found!9078) lt!426982)) (and (bvsge (index!38684 lt!426982) #b00000000000000000000000000000000) (bvslt (index!38684 lt!426982) (size!28088 (_keys!10671 thiss!1141))))) (not ((_ is MissingVacant!9078) lt!426982)) (or (not ((_ is Found!9078) lt!426982)) (= (select (arr!27614 (_keys!10671 thiss!1141)) (index!38684 lt!426982)) key!756)))))

(assert (=> d!115027 (= lt!426982 e!533951)))

(declare-fun c!98997 () Bool)

(assert (=> d!115027 (= c!98997 (and ((_ is Intermediate!9078) lt!426983) (undefined!9890 lt!426983)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57417 (_ BitVec 32)) SeekEntryResult!9078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115027 (= lt!426983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27515 thiss!1141)) key!756 (_keys!10671 thiss!1141) (mask!27515 thiss!1141)))))

(assert (=> d!115027 (validMask!0 (mask!27515 thiss!1141))))

(assert (=> d!115027 (= (seekEntry!0 key!756 (_keys!10671 thiss!1141) (mask!27515 thiss!1141)) lt!426982)))

(declare-fun b!948511 () Bool)

(assert (=> b!948511 (= e!533951 Undefined!9078)))

(declare-fun b!948512 () Bool)

(declare-fun c!98999 () Bool)

(assert (=> b!948512 (= c!98999 (= lt!426985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948512 (= e!533950 e!533949)))

(assert (= (and d!115027 c!98997) b!948511))

(assert (= (and d!115027 (not c!98997)) b!948508))

(assert (= (and b!948508 c!98998) b!948507))

(assert (= (and b!948508 (not c!98998)) b!948512))

(assert (= (and b!948512 c!98999) b!948509))

(assert (= (and b!948512 (not c!98999)) b!948510))

(declare-fun m!881793 () Bool)

(assert (=> b!948508 m!881793))

(declare-fun m!881795 () Bool)

(assert (=> b!948510 m!881795))

(declare-fun m!881797 () Bool)

(assert (=> d!115027 m!881797))

(declare-fun m!881799 () Bool)

(assert (=> d!115027 m!881799))

(assert (=> d!115027 m!881799))

(declare-fun m!881801 () Bool)

(assert (=> d!115027 m!881801))

(assert (=> d!115027 m!881703))

(assert (=> b!948381 d!115027))

(declare-fun d!115029 () Bool)

(declare-fun res!636292 () Bool)

(declare-fun e!533954 () Bool)

(assert (=> d!115029 (=> (not res!636292) (not e!533954))))

(declare-fun simpleValid!364 (LongMapFixedSize!4870) Bool)

(assert (=> d!115029 (= res!636292 (simpleValid!364 thiss!1141))))

(assert (=> d!115029 (= (valid!1867 thiss!1141) e!533954)))

(declare-fun b!948519 () Bool)

(declare-fun res!636293 () Bool)

(assert (=> b!948519 (=> (not res!636293) (not e!533954))))

(declare-fun arrayCountValidKeys!0 (array!57417 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948519 (= res!636293 (= (arrayCountValidKeys!0 (_keys!10671 thiss!1141) #b00000000000000000000000000000000 (size!28088 (_keys!10671 thiss!1141))) (_size!2490 thiss!1141)))))

(declare-fun b!948520 () Bool)

(declare-fun res!636294 () Bool)

(assert (=> b!948520 (=> (not res!636294) (not e!533954))))

(assert (=> b!948520 (= res!636294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10671 thiss!1141) (mask!27515 thiss!1141)))))

(declare-fun b!948521 () Bool)

(assert (=> b!948521 (= e!533954 (arrayNoDuplicates!0 (_keys!10671 thiss!1141) #b00000000000000000000000000000000 Nil!19288))))

(assert (= (and d!115029 res!636292) b!948519))

(assert (= (and b!948519 res!636293) b!948520))

(assert (= (and b!948520 res!636294) b!948521))

(declare-fun m!881803 () Bool)

(assert (=> d!115029 m!881803))

(declare-fun m!881805 () Bool)

(assert (=> b!948519 m!881805))

(assert (=> b!948520 m!881721))

(assert (=> b!948521 m!881709))

(assert (=> start!81006 d!115029))

(declare-fun b!948529 () Bool)

(declare-fun e!533960 () Bool)

(assert (=> b!948529 (= e!533960 tp_is_empty!20683)))

(declare-fun mapNonEmpty!32911 () Bool)

(declare-fun mapRes!32911 () Bool)

(declare-fun tp!63103 () Bool)

(declare-fun e!533959 () Bool)

(assert (=> mapNonEmpty!32911 (= mapRes!32911 (and tp!63103 e!533959))))

(declare-fun mapKey!32911 () (_ BitVec 32))

(declare-fun mapValue!32911 () ValueCell!9860)

(declare-fun mapRest!32911 () (Array (_ BitVec 32) ValueCell!9860))

(assert (=> mapNonEmpty!32911 (= mapRest!32902 (store mapRest!32911 mapKey!32911 mapValue!32911))))

(declare-fun mapIsEmpty!32911 () Bool)

(assert (=> mapIsEmpty!32911 mapRes!32911))

(declare-fun b!948528 () Bool)

(assert (=> b!948528 (= e!533959 tp_is_empty!20683)))

(declare-fun condMapEmpty!32911 () Bool)

(declare-fun mapDefault!32911 () ValueCell!9860)

(assert (=> mapNonEmpty!32902 (= condMapEmpty!32911 (= mapRest!32902 ((as const (Array (_ BitVec 32) ValueCell!9860)) mapDefault!32911)))))

(assert (=> mapNonEmpty!32902 (= tp!63087 (and e!533960 mapRes!32911))))

(assert (= (and mapNonEmpty!32902 condMapEmpty!32911) mapIsEmpty!32911))

(assert (= (and mapNonEmpty!32902 (not condMapEmpty!32911)) mapNonEmpty!32911))

(assert (= (and mapNonEmpty!32911 ((_ is ValueCellFull!9860) mapValue!32911)) b!948528))

(assert (= (and mapNonEmpty!32902 ((_ is ValueCellFull!9860) mapDefault!32911)) b!948529))

(declare-fun m!881807 () Bool)

(assert (=> mapNonEmpty!32911 m!881807))

(check-sat (not b!948520) (not b!948485) (not mapNonEmpty!32911) (not b!948472) (not b!948510) (not b!948488) (not bm!41166) (not b!948486) (not bm!41163) (not b!948473) (not d!115027) (not b!948494) (not b!948519) tp_is_empty!20683 (not b_next!18175) (not d!115029) (not d!115025) (not b!948521) b_and!29607)
(check-sat b_and!29607 (not b_next!18175))
