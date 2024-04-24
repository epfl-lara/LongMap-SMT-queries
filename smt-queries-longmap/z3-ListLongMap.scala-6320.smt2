; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81374 () Bool)

(assert start!81374)

(declare-fun b!951190 () Bool)

(declare-fun b_free!18241 () Bool)

(declare-fun b_next!18241 () Bool)

(assert (=> b!951190 (= b_free!18241 (not b_next!18241))))

(declare-fun tp!63320 () Bool)

(declare-fun b_and!29707 () Bool)

(assert (=> b!951190 (= tp!63320 b_and!29707)))

(declare-fun tp_is_empty!20749 () Bool)

(declare-fun e!535595 () Bool)

(declare-fun e!535594 () Bool)

(declare-datatypes ((V!32631 0))(
  ( (V!32632 (val!10425 Int)) )
))
(declare-datatypes ((ValueCell!9893 0))(
  ( (ValueCellFull!9893 (v!12965 V!32631)) (EmptyCell!9893) )
))
(declare-datatypes ((array!57567 0))(
  ( (array!57568 (arr!27679 (Array (_ BitVec 32) ValueCell!9893)) (size!28157 (_ BitVec 32))) )
))
(declare-datatypes ((array!57569 0))(
  ( (array!57570 (arr!27680 (Array (_ BitVec 32) (_ BitVec 64))) (size!28158 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4936 0))(
  ( (LongMapFixedSize!4937 (defaultEntry!5779 Int) (mask!27622 (_ BitVec 32)) (extraKeys!5511 (_ BitVec 32)) (zeroValue!5615 V!32631) (minValue!5615 V!32631) (_size!2523 (_ BitVec 32)) (_keys!10743 array!57569) (_values!5802 array!57567) (_vacant!2523 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4936)

(declare-fun array_inv!21566 (array!57569) Bool)

(declare-fun array_inv!21567 (array!57567) Bool)

(assert (=> b!951190 (= e!535595 (and tp!63320 tp_is_empty!20749 (array_inv!21566 (_keys!10743 thiss!1141)) (array_inv!21567 (_values!5802 thiss!1141)) e!535594))))

(declare-fun b!951191 () Bool)

(declare-fun res!637488 () Bool)

(declare-fun e!535596 () Bool)

(assert (=> b!951191 (=> (not res!637488) (not e!535596))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9102 0))(
  ( (MissingZero!9102 (index!38779 (_ BitVec 32))) (Found!9102 (index!38780 (_ BitVec 32))) (Intermediate!9102 (undefined!9914 Bool) (index!38781 (_ BitVec 32)) (x!81734 (_ BitVec 32))) (Undefined!9102) (MissingVacant!9102 (index!38782 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57569 (_ BitVec 32)) SeekEntryResult!9102)

(assert (=> b!951191 (= res!637488 (not ((_ is Found!9102) (seekEntry!0 key!756 (_keys!10743 thiss!1141) (mask!27622 thiss!1141)))))))

(declare-fun b!951192 () Bool)

(declare-fun e!535598 () Bool)

(assert (=> b!951192 (= e!535598 tp_is_empty!20749)))

(declare-fun b!951193 () Bool)

(declare-fun res!637485 () Bool)

(assert (=> b!951193 (=> (not res!637485) (not e!535596))))

(declare-datatypes ((tuple2!13534 0))(
  ( (tuple2!13535 (_1!6778 (_ BitVec 64)) (_2!6778 V!32631)) )
))
(declare-datatypes ((List!19329 0))(
  ( (Nil!19326) (Cons!19325 (h!20491 tuple2!13534) (t!27660 List!19329)) )
))
(declare-datatypes ((ListLongMap!12233 0))(
  ( (ListLongMap!12234 (toList!6132 List!19329)) )
))
(declare-fun contains!5234 (ListLongMap!12233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3365 (array!57569 array!57567 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 32) Int) ListLongMap!12233)

(assert (=> b!951193 (= res!637485 (contains!5234 (getCurrentListMap!3365 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)) key!756))))

(declare-fun b!951194 () Bool)

(declare-fun res!637486 () Bool)

(assert (=> b!951194 (=> (not res!637486) (not e!535596))))

(assert (=> b!951194 (= res!637486 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!33035 () Bool)

(declare-fun mapRes!33035 () Bool)

(declare-fun tp!63319 () Bool)

(assert (=> mapNonEmpty!33035 (= mapRes!33035 (and tp!63319 e!535598))))

(declare-fun mapKey!33035 () (_ BitVec 32))

(declare-fun mapRest!33035 () (Array (_ BitVec 32) ValueCell!9893))

(declare-fun mapValue!33035 () ValueCell!9893)

(assert (=> mapNonEmpty!33035 (= (arr!27679 (_values!5802 thiss!1141)) (store mapRest!33035 mapKey!33035 mapValue!33035))))

(declare-fun b!951195 () Bool)

(declare-fun e!535597 () Bool)

(assert (=> b!951195 (= e!535597 tp_is_empty!20749)))

(declare-fun b!951196 () Bool)

(assert (=> b!951196 (= e!535594 (and e!535597 mapRes!33035))))

(declare-fun condMapEmpty!33035 () Bool)

(declare-fun mapDefault!33035 () ValueCell!9893)

(assert (=> b!951196 (= condMapEmpty!33035 (= (arr!27679 (_values!5802 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9893)) mapDefault!33035)))))

(declare-fun b!951197 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951197 (= e!535596 (not (validMask!0 (mask!27622 thiss!1141))))))

(declare-fun lt!428305 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57569 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951197 (= lt!428305 (arrayScanForKey!0 (_keys!10743 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951197 (arrayContainsKey!0 (_keys!10743 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31970 0))(
  ( (Unit!31971) )
))
(declare-fun lt!428304 () Unit!31970)

(declare-fun lemmaKeyInListMapIsInArray!317 (array!57569 array!57567 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 64) Int) Unit!31970)

(assert (=> b!951197 (= lt!428304 (lemmaKeyInListMapIsInArray!317 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) key!756 (defaultEntry!5779 thiss!1141)))))

(declare-fun mapIsEmpty!33035 () Bool)

(assert (=> mapIsEmpty!33035 mapRes!33035))

(declare-fun res!637487 () Bool)

(assert (=> start!81374 (=> (not res!637487) (not e!535596))))

(declare-fun valid!1890 (LongMapFixedSize!4936) Bool)

(assert (=> start!81374 (= res!637487 (valid!1890 thiss!1141))))

(assert (=> start!81374 e!535596))

(assert (=> start!81374 e!535595))

(assert (=> start!81374 true))

(assert (= (and start!81374 res!637487) b!951194))

(assert (= (and b!951194 res!637486) b!951191))

(assert (= (and b!951191 res!637488) b!951193))

(assert (= (and b!951193 res!637485) b!951197))

(assert (= (and b!951196 condMapEmpty!33035) mapIsEmpty!33035))

(assert (= (and b!951196 (not condMapEmpty!33035)) mapNonEmpty!33035))

(assert (= (and mapNonEmpty!33035 ((_ is ValueCellFull!9893) mapValue!33035)) b!951192))

(assert (= (and b!951196 ((_ is ValueCellFull!9893) mapDefault!33035)) b!951195))

(assert (= b!951190 b!951196))

(assert (= start!81374 b!951190))

(declare-fun m!884025 () Bool)

(assert (=> b!951190 m!884025))

(declare-fun m!884027 () Bool)

(assert (=> b!951190 m!884027))

(declare-fun m!884029 () Bool)

(assert (=> b!951197 m!884029))

(declare-fun m!884031 () Bool)

(assert (=> b!951197 m!884031))

(declare-fun m!884033 () Bool)

(assert (=> b!951197 m!884033))

(declare-fun m!884035 () Bool)

(assert (=> b!951197 m!884035))

(declare-fun m!884037 () Bool)

(assert (=> b!951191 m!884037))

(declare-fun m!884039 () Bool)

(assert (=> start!81374 m!884039))

(declare-fun m!884041 () Bool)

(assert (=> mapNonEmpty!33035 m!884041))

(declare-fun m!884043 () Bool)

(assert (=> b!951193 m!884043))

(assert (=> b!951193 m!884043))

(declare-fun m!884045 () Bool)

(assert (=> b!951193 m!884045))

(check-sat tp_is_empty!20749 (not b!951193) (not b!951190) (not start!81374) b_and!29707 (not b_next!18241) (not mapNonEmpty!33035) (not b!951191) (not b!951197))
(check-sat b_and!29707 (not b_next!18241))
(get-model)

(declare-fun b!951258 () Bool)

(declare-fun e!535644 () SeekEntryResult!9102)

(assert (=> b!951258 (= e!535644 Undefined!9102)))

(declare-fun b!951259 () Bool)

(declare-fun e!535642 () SeekEntryResult!9102)

(assert (=> b!951259 (= e!535644 e!535642)))

(declare-fun lt!428327 () (_ BitVec 64))

(declare-fun lt!428328 () SeekEntryResult!9102)

(assert (=> b!951259 (= lt!428327 (select (arr!27680 (_keys!10743 thiss!1141)) (index!38781 lt!428328)))))

(declare-fun c!99507 () Bool)

(assert (=> b!951259 (= c!99507 (= lt!428327 key!756))))

(declare-fun b!951260 () Bool)

(declare-fun e!535643 () SeekEntryResult!9102)

(assert (=> b!951260 (= e!535643 (MissingZero!9102 (index!38781 lt!428328)))))

(declare-fun b!951261 () Bool)

(declare-fun c!99506 () Bool)

(assert (=> b!951261 (= c!99506 (= lt!428327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951261 (= e!535642 e!535643)))

(declare-fun b!951262 () Bool)

(assert (=> b!951262 (= e!535642 (Found!9102 (index!38781 lt!428328)))))

(declare-fun b!951263 () Bool)

(declare-fun lt!428326 () SeekEntryResult!9102)

(assert (=> b!951263 (= e!535643 (ite ((_ is MissingVacant!9102) lt!428326) (MissingZero!9102 (index!38782 lt!428326)) lt!428326))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57569 (_ BitVec 32)) SeekEntryResult!9102)

(assert (=> b!951263 (= lt!428326 (seekKeyOrZeroReturnVacant!0 (x!81734 lt!428328) (index!38781 lt!428328) (index!38781 lt!428328) key!756 (_keys!10743 thiss!1141) (mask!27622 thiss!1141)))))

(declare-fun d!115489 () Bool)

(declare-fun lt!428329 () SeekEntryResult!9102)

(assert (=> d!115489 (and (or ((_ is MissingVacant!9102) lt!428329) (not ((_ is Found!9102) lt!428329)) (and (bvsge (index!38780 lt!428329) #b00000000000000000000000000000000) (bvslt (index!38780 lt!428329) (size!28158 (_keys!10743 thiss!1141))))) (not ((_ is MissingVacant!9102) lt!428329)) (or (not ((_ is Found!9102) lt!428329)) (= (select (arr!27680 (_keys!10743 thiss!1141)) (index!38780 lt!428329)) key!756)))))

(assert (=> d!115489 (= lt!428329 e!535644)))

(declare-fun c!99508 () Bool)

(assert (=> d!115489 (= c!99508 (and ((_ is Intermediate!9102) lt!428328) (undefined!9914 lt!428328)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57569 (_ BitVec 32)) SeekEntryResult!9102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115489 (= lt!428328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27622 thiss!1141)) key!756 (_keys!10743 thiss!1141) (mask!27622 thiss!1141)))))

(assert (=> d!115489 (validMask!0 (mask!27622 thiss!1141))))

(assert (=> d!115489 (= (seekEntry!0 key!756 (_keys!10743 thiss!1141) (mask!27622 thiss!1141)) lt!428329)))

(assert (= (and d!115489 c!99508) b!951258))

(assert (= (and d!115489 (not c!99508)) b!951259))

(assert (= (and b!951259 c!99507) b!951262))

(assert (= (and b!951259 (not c!99507)) b!951261))

(assert (= (and b!951261 c!99506) b!951260))

(assert (= (and b!951261 (not c!99506)) b!951263))

(declare-fun m!884091 () Bool)

(assert (=> b!951259 m!884091))

(declare-fun m!884093 () Bool)

(assert (=> b!951263 m!884093))

(declare-fun m!884095 () Bool)

(assert (=> d!115489 m!884095))

(declare-fun m!884097 () Bool)

(assert (=> d!115489 m!884097))

(assert (=> d!115489 m!884097))

(declare-fun m!884099 () Bool)

(assert (=> d!115489 m!884099))

(assert (=> d!115489 m!884029))

(assert (=> b!951191 d!115489))

(declare-fun d!115491 () Bool)

(assert (=> d!115491 (= (array_inv!21566 (_keys!10743 thiss!1141)) (bvsge (size!28158 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951190 d!115491))

(declare-fun d!115493 () Bool)

(assert (=> d!115493 (= (array_inv!21567 (_values!5802 thiss!1141)) (bvsge (size!28157 (_values!5802 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951190 d!115493))

(declare-fun d!115495 () Bool)

(assert (=> d!115495 (= (validMask!0 (mask!27622 thiss!1141)) (and (or (= (mask!27622 thiss!1141) #b00000000000000000000000000000111) (= (mask!27622 thiss!1141) #b00000000000000000000000000001111) (= (mask!27622 thiss!1141) #b00000000000000000000000000011111) (= (mask!27622 thiss!1141) #b00000000000000000000000000111111) (= (mask!27622 thiss!1141) #b00000000000000000000000001111111) (= (mask!27622 thiss!1141) #b00000000000000000000000011111111) (= (mask!27622 thiss!1141) #b00000000000000000000000111111111) (= (mask!27622 thiss!1141) #b00000000000000000000001111111111) (= (mask!27622 thiss!1141) #b00000000000000000000011111111111) (= (mask!27622 thiss!1141) #b00000000000000000000111111111111) (= (mask!27622 thiss!1141) #b00000000000000000001111111111111) (= (mask!27622 thiss!1141) #b00000000000000000011111111111111) (= (mask!27622 thiss!1141) #b00000000000000000111111111111111) (= (mask!27622 thiss!1141) #b00000000000000001111111111111111) (= (mask!27622 thiss!1141) #b00000000000000011111111111111111) (= (mask!27622 thiss!1141) #b00000000000000111111111111111111) (= (mask!27622 thiss!1141) #b00000000000001111111111111111111) (= (mask!27622 thiss!1141) #b00000000000011111111111111111111) (= (mask!27622 thiss!1141) #b00000000000111111111111111111111) (= (mask!27622 thiss!1141) #b00000000001111111111111111111111) (= (mask!27622 thiss!1141) #b00000000011111111111111111111111) (= (mask!27622 thiss!1141) #b00000000111111111111111111111111) (= (mask!27622 thiss!1141) #b00000001111111111111111111111111) (= (mask!27622 thiss!1141) #b00000011111111111111111111111111) (= (mask!27622 thiss!1141) #b00000111111111111111111111111111) (= (mask!27622 thiss!1141) #b00001111111111111111111111111111) (= (mask!27622 thiss!1141) #b00011111111111111111111111111111) (= (mask!27622 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27622 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951197 d!115495))

(declare-fun d!115497 () Bool)

(declare-fun lt!428332 () (_ BitVec 32))

(assert (=> d!115497 (and (or (bvslt lt!428332 #b00000000000000000000000000000000) (bvsge lt!428332 (size!28158 (_keys!10743 thiss!1141))) (and (bvsge lt!428332 #b00000000000000000000000000000000) (bvslt lt!428332 (size!28158 (_keys!10743 thiss!1141))))) (bvsge lt!428332 #b00000000000000000000000000000000) (bvslt lt!428332 (size!28158 (_keys!10743 thiss!1141))) (= (select (arr!27680 (_keys!10743 thiss!1141)) lt!428332) key!756))))

(declare-fun e!535647 () (_ BitVec 32))

(assert (=> d!115497 (= lt!428332 e!535647)))

(declare-fun c!99511 () Bool)

(assert (=> d!115497 (= c!99511 (= (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))) (bvslt (size!28158 (_keys!10743 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115497 (= (arrayScanForKey!0 (_keys!10743 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428332)))

(declare-fun b!951268 () Bool)

(assert (=> b!951268 (= e!535647 #b00000000000000000000000000000000)))

(declare-fun b!951269 () Bool)

(assert (=> b!951269 (= e!535647 (arrayScanForKey!0 (_keys!10743 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115497 c!99511) b!951268))

(assert (= (and d!115497 (not c!99511)) b!951269))

(declare-fun m!884101 () Bool)

(assert (=> d!115497 m!884101))

(declare-fun m!884103 () Bool)

(assert (=> d!115497 m!884103))

(declare-fun m!884105 () Bool)

(assert (=> b!951269 m!884105))

(assert (=> b!951197 d!115497))

(declare-fun d!115499 () Bool)

(declare-fun res!637517 () Bool)

(declare-fun e!535652 () Bool)

(assert (=> d!115499 (=> res!637517 e!535652)))

(assert (=> d!115499 (= res!637517 (= (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115499 (= (arrayContainsKey!0 (_keys!10743 thiss!1141) key!756 #b00000000000000000000000000000000) e!535652)))

(declare-fun b!951274 () Bool)

(declare-fun e!535653 () Bool)

(assert (=> b!951274 (= e!535652 e!535653)))

(declare-fun res!637518 () Bool)

(assert (=> b!951274 (=> (not res!637518) (not e!535653))))

(assert (=> b!951274 (= res!637518 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28158 (_keys!10743 thiss!1141))))))

(declare-fun b!951275 () Bool)

(assert (=> b!951275 (= e!535653 (arrayContainsKey!0 (_keys!10743 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115499 (not res!637517)) b!951274))

(assert (= (and b!951274 res!637518) b!951275))

(assert (=> d!115499 m!884103))

(declare-fun m!884107 () Bool)

(assert (=> b!951275 m!884107))

(assert (=> b!951197 d!115499))

(declare-fun d!115501 () Bool)

(declare-fun e!535656 () Bool)

(assert (=> d!115501 e!535656))

(declare-fun c!99514 () Bool)

(assert (=> d!115501 (= c!99514 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428335 () Unit!31970)

(declare-fun choose!1590 (array!57569 array!57567 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 64) Int) Unit!31970)

(assert (=> d!115501 (= lt!428335 (choose!1590 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) key!756 (defaultEntry!5779 thiss!1141)))))

(assert (=> d!115501 (validMask!0 (mask!27622 thiss!1141))))

(assert (=> d!115501 (= (lemmaKeyInListMapIsInArray!317 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) key!756 (defaultEntry!5779 thiss!1141)) lt!428335)))

(declare-fun b!951280 () Bool)

(assert (=> b!951280 (= e!535656 (arrayContainsKey!0 (_keys!10743 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951281 () Bool)

(assert (=> b!951281 (= e!535656 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115501 c!99514) b!951280))

(assert (= (and d!115501 (not c!99514)) b!951281))

(declare-fun m!884109 () Bool)

(assert (=> d!115501 m!884109))

(assert (=> d!115501 m!884029))

(assert (=> b!951280 m!884033))

(assert (=> b!951197 d!115501))

(declare-fun d!115503 () Bool)

(declare-fun e!535662 () Bool)

(assert (=> d!115503 e!535662))

(declare-fun res!637521 () Bool)

(assert (=> d!115503 (=> res!637521 e!535662)))

(declare-fun lt!428346 () Bool)

(assert (=> d!115503 (= res!637521 (not lt!428346))))

(declare-fun lt!428347 () Bool)

(assert (=> d!115503 (= lt!428346 lt!428347)))

(declare-fun lt!428344 () Unit!31970)

(declare-fun e!535661 () Unit!31970)

(assert (=> d!115503 (= lt!428344 e!535661)))

(declare-fun c!99517 () Bool)

(assert (=> d!115503 (= c!99517 lt!428347)))

(declare-fun containsKey!466 (List!19329 (_ BitVec 64)) Bool)

(assert (=> d!115503 (= lt!428347 (containsKey!466 (toList!6132 (getCurrentListMap!3365 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756))))

(assert (=> d!115503 (= (contains!5234 (getCurrentListMap!3365 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)) key!756) lt!428346)))

(declare-fun b!951288 () Bool)

(declare-fun lt!428345 () Unit!31970)

(assert (=> b!951288 (= e!535661 lt!428345)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!360 (List!19329 (_ BitVec 64)) Unit!31970)

(assert (=> b!951288 (= lt!428345 (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6132 (getCurrentListMap!3365 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756))))

(declare-datatypes ((Option!501 0))(
  ( (Some!500 (v!12968 V!32631)) (None!499) )
))
(declare-fun isDefined!368 (Option!501) Bool)

(declare-fun getValueByKey!495 (List!19329 (_ BitVec 64)) Option!501)

(assert (=> b!951288 (isDefined!368 (getValueByKey!495 (toList!6132 (getCurrentListMap!3365 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756))))

(declare-fun b!951289 () Bool)

(declare-fun Unit!31974 () Unit!31970)

(assert (=> b!951289 (= e!535661 Unit!31974)))

(declare-fun b!951290 () Bool)

(assert (=> b!951290 (= e!535662 (isDefined!368 (getValueByKey!495 (toList!6132 (getCurrentListMap!3365 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756)))))

(assert (= (and d!115503 c!99517) b!951288))

(assert (= (and d!115503 (not c!99517)) b!951289))

(assert (= (and d!115503 (not res!637521)) b!951290))

(declare-fun m!884111 () Bool)

(assert (=> d!115503 m!884111))

(declare-fun m!884113 () Bool)

(assert (=> b!951288 m!884113))

(declare-fun m!884115 () Bool)

(assert (=> b!951288 m!884115))

(assert (=> b!951288 m!884115))

(declare-fun m!884117 () Bool)

(assert (=> b!951288 m!884117))

(assert (=> b!951290 m!884115))

(assert (=> b!951290 m!884115))

(assert (=> b!951290 m!884117))

(assert (=> b!951193 d!115503))

(declare-fun b!951333 () Bool)

(declare-fun e!535699 () Bool)

(declare-fun e!535694 () Bool)

(assert (=> b!951333 (= e!535699 e!535694)))

(declare-fun res!637545 () Bool)

(declare-fun call!41436 () Bool)

(assert (=> b!951333 (= res!637545 call!41436)))

(assert (=> b!951333 (=> (not res!637545) (not e!535694))))

(declare-fun b!951334 () Bool)

(declare-fun e!535695 () Bool)

(declare-fun e!535701 () Bool)

(assert (=> b!951334 (= e!535695 e!535701)))

(declare-fun res!637547 () Bool)

(declare-fun call!41434 () Bool)

(assert (=> b!951334 (= res!637547 call!41434)))

(assert (=> b!951334 (=> (not res!637547) (not e!535701))))

(declare-fun b!951335 () Bool)

(assert (=> b!951335 (= e!535695 (not call!41434))))

(declare-fun b!951336 () Bool)

(assert (=> b!951336 (= e!535699 (not call!41436))))

(declare-fun b!951337 () Bool)

(declare-fun e!535696 () ListLongMap!12233)

(declare-fun call!41435 () ListLongMap!12233)

(declare-fun +!2873 (ListLongMap!12233 tuple2!13534) ListLongMap!12233)

(assert (=> b!951337 (= e!535696 (+!2873 call!41435 (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5615 thiss!1141))))))

(declare-fun b!951338 () Bool)

(declare-fun e!535700 () Unit!31970)

(declare-fun lt!428400 () Unit!31970)

(assert (=> b!951338 (= e!535700 lt!428400)))

(declare-fun lt!428407 () ListLongMap!12233)

(declare-fun getCurrentListMapNoExtraKeys!3361 (array!57569 array!57567 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 32) Int) ListLongMap!12233)

(assert (=> b!951338 (= lt!428407 (getCurrentListMapNoExtraKeys!3361 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!428397 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428404 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428404 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428410 () Unit!31970)

(declare-fun addStillContains!576 (ListLongMap!12233 (_ BitVec 64) V!32631 (_ BitVec 64)) Unit!31970)

(assert (=> b!951338 (= lt!428410 (addStillContains!576 lt!428407 lt!428397 (zeroValue!5615 thiss!1141) lt!428404))))

(assert (=> b!951338 (contains!5234 (+!2873 lt!428407 (tuple2!13535 lt!428397 (zeroValue!5615 thiss!1141))) lt!428404)))

(declare-fun lt!428392 () Unit!31970)

(assert (=> b!951338 (= lt!428392 lt!428410)))

(declare-fun lt!428401 () ListLongMap!12233)

(assert (=> b!951338 (= lt!428401 (getCurrentListMapNoExtraKeys!3361 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!428413 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428413 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428406 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428406 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428409 () Unit!31970)

(declare-fun addApplyDifferent!457 (ListLongMap!12233 (_ BitVec 64) V!32631 (_ BitVec 64)) Unit!31970)

(assert (=> b!951338 (= lt!428409 (addApplyDifferent!457 lt!428401 lt!428413 (minValue!5615 thiss!1141) lt!428406))))

(declare-fun apply!887 (ListLongMap!12233 (_ BitVec 64)) V!32631)

(assert (=> b!951338 (= (apply!887 (+!2873 lt!428401 (tuple2!13535 lt!428413 (minValue!5615 thiss!1141))) lt!428406) (apply!887 lt!428401 lt!428406))))

(declare-fun lt!428395 () Unit!31970)

(assert (=> b!951338 (= lt!428395 lt!428409)))

(declare-fun lt!428393 () ListLongMap!12233)

(assert (=> b!951338 (= lt!428393 (getCurrentListMapNoExtraKeys!3361 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!428398 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428399 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428399 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428394 () Unit!31970)

(assert (=> b!951338 (= lt!428394 (addApplyDifferent!457 lt!428393 lt!428398 (zeroValue!5615 thiss!1141) lt!428399))))

(assert (=> b!951338 (= (apply!887 (+!2873 lt!428393 (tuple2!13535 lt!428398 (zeroValue!5615 thiss!1141))) lt!428399) (apply!887 lt!428393 lt!428399))))

(declare-fun lt!428411 () Unit!31970)

(assert (=> b!951338 (= lt!428411 lt!428394)))

(declare-fun lt!428396 () ListLongMap!12233)

(assert (=> b!951338 (= lt!428396 (getCurrentListMapNoExtraKeys!3361 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!428408 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428408 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428405 () (_ BitVec 64))

(assert (=> b!951338 (= lt!428405 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951338 (= lt!428400 (addApplyDifferent!457 lt!428396 lt!428408 (minValue!5615 thiss!1141) lt!428405))))

(assert (=> b!951338 (= (apply!887 (+!2873 lt!428396 (tuple2!13535 lt!428408 (minValue!5615 thiss!1141))) lt!428405) (apply!887 lt!428396 lt!428405))))

(declare-fun b!951339 () Bool)

(declare-fun e!535693 () ListLongMap!12233)

(declare-fun call!41432 () ListLongMap!12233)

(assert (=> b!951339 (= e!535693 call!41432)))

(declare-fun bm!41427 () Bool)

(declare-fun lt!428403 () ListLongMap!12233)

(assert (=> bm!41427 (= call!41436 (contains!5234 lt!428403 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951340 () Bool)

(declare-fun Unit!31975 () Unit!31970)

(assert (=> b!951340 (= e!535700 Unit!31975)))

(declare-fun bm!41428 () Bool)

(assert (=> bm!41428 (= call!41434 (contains!5234 lt!428403 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951342 () Bool)

(declare-fun res!637546 () Bool)

(declare-fun e!535692 () Bool)

(assert (=> b!951342 (=> (not res!637546) (not e!535692))))

(assert (=> b!951342 (= res!637546 e!535695)))

(declare-fun c!99533 () Bool)

(assert (=> b!951342 (= c!99533 (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41429 () Bool)

(declare-fun call!41430 () ListLongMap!12233)

(declare-fun call!41433 () ListLongMap!12233)

(assert (=> bm!41429 (= call!41430 call!41433)))

(declare-fun b!951343 () Bool)

(declare-fun e!535691 () ListLongMap!12233)

(assert (=> b!951343 (= e!535691 call!41430)))

(declare-fun b!951344 () Bool)

(assert (=> b!951344 (= e!535692 e!535699)))

(declare-fun c!99534 () Bool)

(assert (=> b!951344 (= c!99534 (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951345 () Bool)

(assert (=> b!951345 (= e!535694 (= (apply!887 lt!428403 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5615 thiss!1141)))))

(declare-fun bm!41430 () Bool)

(declare-fun call!41431 () ListLongMap!12233)

(assert (=> bm!41430 (= call!41431 (getCurrentListMapNoExtraKeys!3361 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun bm!41431 () Bool)

(assert (=> bm!41431 (= call!41433 call!41431)))

(declare-fun b!951346 () Bool)

(assert (=> b!951346 (= e!535701 (= (apply!887 lt!428403 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5615 thiss!1141)))))

(declare-fun b!951347 () Bool)

(declare-fun e!535689 () Bool)

(declare-fun e!535690 () Bool)

(assert (=> b!951347 (= e!535689 e!535690)))

(declare-fun res!637542 () Bool)

(assert (=> b!951347 (=> (not res!637542) (not e!535690))))

(assert (=> b!951347 (= res!637542 (contains!5234 lt!428403 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951347 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))))))

(declare-fun b!951348 () Bool)

(assert (=> b!951348 (= e!535691 call!41432)))

(declare-fun b!951349 () Bool)

(assert (=> b!951349 (= e!535696 e!535693)))

(declare-fun c!99531 () Bool)

(assert (=> b!951349 (= c!99531 (and (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41432 () Bool)

(assert (=> bm!41432 (= call!41432 call!41435)))

(declare-fun c!99532 () Bool)

(declare-fun bm!41433 () Bool)

(assert (=> bm!41433 (= call!41435 (+!2873 (ite c!99532 call!41431 (ite c!99531 call!41433 call!41430)) (ite (or c!99532 c!99531) (tuple2!13535 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5615 thiss!1141)) (tuple2!13535 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5615 thiss!1141)))))))

(declare-fun b!951350 () Bool)

(declare-fun e!535697 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951350 (= e!535697 (validKeyInArray!0 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951351 () Bool)

(declare-fun res!637548 () Bool)

(assert (=> b!951351 (=> (not res!637548) (not e!535692))))

(assert (=> b!951351 (= res!637548 e!535689)))

(declare-fun res!637541 () Bool)

(assert (=> b!951351 (=> res!637541 e!535689)))

(declare-fun e!535698 () Bool)

(assert (=> b!951351 (= res!637541 (not e!535698))))

(declare-fun res!637540 () Bool)

(assert (=> b!951351 (=> (not res!637540) (not e!535698))))

(assert (=> b!951351 (= res!637540 (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))))))

(declare-fun b!951352 () Bool)

(assert (=> b!951352 (= e!535698 (validKeyInArray!0 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951353 () Bool)

(declare-fun c!99530 () Bool)

(assert (=> b!951353 (= c!99530 (and (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951353 (= e!535693 e!535691)))

(declare-fun b!951341 () Bool)

(declare-fun get!14558 (ValueCell!9893 V!32631) V!32631)

(declare-fun dynLambda!1670 (Int (_ BitVec 64)) V!32631)

(assert (=> b!951341 (= e!535690 (= (apply!887 lt!428403 (select (arr!27680 (_keys!10743 thiss!1141)) #b00000000000000000000000000000000)) (get!14558 (select (arr!27679 (_values!5802 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1670 (defaultEntry!5779 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28157 (_values!5802 thiss!1141))))))

(assert (=> b!951341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))))))

(declare-fun d!115505 () Bool)

(assert (=> d!115505 e!535692))

(declare-fun res!637543 () Bool)

(assert (=> d!115505 (=> (not res!637543) (not e!535692))))

(assert (=> d!115505 (= res!637543 (or (bvsge #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))))))))

(declare-fun lt!428402 () ListLongMap!12233)

(assert (=> d!115505 (= lt!428403 lt!428402)))

(declare-fun lt!428412 () Unit!31970)

(assert (=> d!115505 (= lt!428412 e!535700)))

(declare-fun c!99535 () Bool)

(assert (=> d!115505 (= c!99535 e!535697)))

(declare-fun res!637544 () Bool)

(assert (=> d!115505 (=> (not res!637544) (not e!535697))))

(assert (=> d!115505 (= res!637544 (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))))))

(assert (=> d!115505 (= lt!428402 e!535696)))

(assert (=> d!115505 (= c!99532 (and (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115505 (validMask!0 (mask!27622 thiss!1141))))

(assert (=> d!115505 (= (getCurrentListMap!3365 (_keys!10743 thiss!1141) (_values!5802 thiss!1141) (mask!27622 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)) lt!428403)))

(assert (= (and d!115505 c!99532) b!951337))

(assert (= (and d!115505 (not c!99532)) b!951349))

(assert (= (and b!951349 c!99531) b!951339))

(assert (= (and b!951349 (not c!99531)) b!951353))

(assert (= (and b!951353 c!99530) b!951348))

(assert (= (and b!951353 (not c!99530)) b!951343))

(assert (= (or b!951348 b!951343) bm!41429))

(assert (= (or b!951339 bm!41429) bm!41431))

(assert (= (or b!951339 b!951348) bm!41432))

(assert (= (or b!951337 bm!41431) bm!41430))

(assert (= (or b!951337 bm!41432) bm!41433))

(assert (= (and d!115505 res!637544) b!951350))

(assert (= (and d!115505 c!99535) b!951338))

(assert (= (and d!115505 (not c!99535)) b!951340))

(assert (= (and d!115505 res!637543) b!951351))

(assert (= (and b!951351 res!637540) b!951352))

(assert (= (and b!951351 (not res!637541)) b!951347))

(assert (= (and b!951347 res!637542) b!951341))

(assert (= (and b!951351 res!637548) b!951342))

(assert (= (and b!951342 c!99533) b!951334))

(assert (= (and b!951342 (not c!99533)) b!951335))

(assert (= (and b!951334 res!637547) b!951346))

(assert (= (or b!951334 b!951335) bm!41428))

(assert (= (and b!951342 res!637546) b!951344))

(assert (= (and b!951344 c!99534) b!951333))

(assert (= (and b!951344 (not c!99534)) b!951336))

(assert (= (and b!951333 res!637545) b!951345))

(assert (= (or b!951333 b!951336) bm!41427))

(declare-fun b_lambda!14381 () Bool)

(assert (=> (not b_lambda!14381) (not b!951341)))

(declare-fun t!27663 () Bool)

(declare-fun tb!6183 () Bool)

(assert (=> (and b!951190 (= (defaultEntry!5779 thiss!1141) (defaultEntry!5779 thiss!1141)) t!27663) tb!6183))

(declare-fun result!12287 () Bool)

(assert (=> tb!6183 (= result!12287 tp_is_empty!20749)))

(assert (=> b!951341 t!27663))

(declare-fun b_and!29713 () Bool)

(assert (= b_and!29707 (and (=> t!27663 result!12287) b_and!29713)))

(assert (=> d!115505 m!884029))

(declare-fun m!884119 () Bool)

(assert (=> bm!41430 m!884119))

(assert (=> b!951338 m!884119))

(declare-fun m!884121 () Bool)

(assert (=> b!951338 m!884121))

(declare-fun m!884123 () Bool)

(assert (=> b!951338 m!884123))

(declare-fun m!884125 () Bool)

(assert (=> b!951338 m!884125))

(declare-fun m!884127 () Bool)

(assert (=> b!951338 m!884127))

(declare-fun m!884129 () Bool)

(assert (=> b!951338 m!884129))

(declare-fun m!884131 () Bool)

(assert (=> b!951338 m!884131))

(declare-fun m!884133 () Bool)

(assert (=> b!951338 m!884133))

(declare-fun m!884135 () Bool)

(assert (=> b!951338 m!884135))

(declare-fun m!884137 () Bool)

(assert (=> b!951338 m!884137))

(assert (=> b!951338 m!884135))

(declare-fun m!884139 () Bool)

(assert (=> b!951338 m!884139))

(declare-fun m!884141 () Bool)

(assert (=> b!951338 m!884141))

(assert (=> b!951338 m!884103))

(assert (=> b!951338 m!884141))

(declare-fun m!884143 () Bool)

(assert (=> b!951338 m!884143))

(assert (=> b!951338 m!884129))

(declare-fun m!884145 () Bool)

(assert (=> b!951338 m!884145))

(assert (=> b!951338 m!884125))

(declare-fun m!884147 () Bool)

(assert (=> b!951338 m!884147))

(declare-fun m!884149 () Bool)

(assert (=> b!951338 m!884149))

(declare-fun m!884151 () Bool)

(assert (=> b!951346 m!884151))

(assert (=> b!951350 m!884103))

(assert (=> b!951350 m!884103))

(declare-fun m!884153 () Bool)

(assert (=> b!951350 m!884153))

(assert (=> b!951341 m!884103))

(assert (=> b!951341 m!884103))

(declare-fun m!884155 () Bool)

(assert (=> b!951341 m!884155))

(declare-fun m!884157 () Bool)

(assert (=> b!951341 m!884157))

(declare-fun m!884159 () Bool)

(assert (=> b!951341 m!884159))

(declare-fun m!884161 () Bool)

(assert (=> b!951341 m!884161))

(assert (=> b!951341 m!884157))

(assert (=> b!951341 m!884159))

(declare-fun m!884163 () Bool)

(assert (=> b!951337 m!884163))

(declare-fun m!884165 () Bool)

(assert (=> bm!41433 m!884165))

(assert (=> b!951352 m!884103))

(assert (=> b!951352 m!884103))

(assert (=> b!951352 m!884153))

(declare-fun m!884167 () Bool)

(assert (=> b!951345 m!884167))

(declare-fun m!884169 () Bool)

(assert (=> bm!41427 m!884169))

(declare-fun m!884171 () Bool)

(assert (=> bm!41428 m!884171))

(assert (=> b!951347 m!884103))

(assert (=> b!951347 m!884103))

(declare-fun m!884173 () Bool)

(assert (=> b!951347 m!884173))

(assert (=> b!951193 d!115505))

(declare-fun d!115507 () Bool)

(declare-fun res!637555 () Bool)

(declare-fun e!535704 () Bool)

(assert (=> d!115507 (=> (not res!637555) (not e!535704))))

(declare-fun simpleValid!374 (LongMapFixedSize!4936) Bool)

(assert (=> d!115507 (= res!637555 (simpleValid!374 thiss!1141))))

(assert (=> d!115507 (= (valid!1890 thiss!1141) e!535704)))

(declare-fun b!951362 () Bool)

(declare-fun res!637556 () Bool)

(assert (=> b!951362 (=> (not res!637556) (not e!535704))))

(declare-fun arrayCountValidKeys!0 (array!57569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951362 (= res!637556 (= (arrayCountValidKeys!0 (_keys!10743 thiss!1141) #b00000000000000000000000000000000 (size!28158 (_keys!10743 thiss!1141))) (_size!2523 thiss!1141)))))

(declare-fun b!951363 () Bool)

(declare-fun res!637557 () Bool)

(assert (=> b!951363 (=> (not res!637557) (not e!535704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57569 (_ BitVec 32)) Bool)

(assert (=> b!951363 (= res!637557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10743 thiss!1141) (mask!27622 thiss!1141)))))

(declare-fun b!951364 () Bool)

(declare-datatypes ((List!19331 0))(
  ( (Nil!19328) (Cons!19327 (h!20493 (_ BitVec 64)) (t!27664 List!19331)) )
))
(declare-fun arrayNoDuplicates!0 (array!57569 (_ BitVec 32) List!19331) Bool)

(assert (=> b!951364 (= e!535704 (arrayNoDuplicates!0 (_keys!10743 thiss!1141) #b00000000000000000000000000000000 Nil!19328))))

(assert (= (and d!115507 res!637555) b!951362))

(assert (= (and b!951362 res!637556) b!951363))

(assert (= (and b!951363 res!637557) b!951364))

(declare-fun m!884175 () Bool)

(assert (=> d!115507 m!884175))

(declare-fun m!884177 () Bool)

(assert (=> b!951362 m!884177))

(declare-fun m!884179 () Bool)

(assert (=> b!951363 m!884179))

(declare-fun m!884181 () Bool)

(assert (=> b!951364 m!884181))

(assert (=> start!81374 d!115507))

(declare-fun condMapEmpty!33044 () Bool)

(declare-fun mapDefault!33044 () ValueCell!9893)

(assert (=> mapNonEmpty!33035 (= condMapEmpty!33044 (= mapRest!33035 ((as const (Array (_ BitVec 32) ValueCell!9893)) mapDefault!33044)))))

(declare-fun e!535710 () Bool)

(declare-fun mapRes!33044 () Bool)

(assert (=> mapNonEmpty!33035 (= tp!63319 (and e!535710 mapRes!33044))))

(declare-fun b!951371 () Bool)

(declare-fun e!535709 () Bool)

(assert (=> b!951371 (= e!535709 tp_is_empty!20749)))

(declare-fun mapIsEmpty!33044 () Bool)

(assert (=> mapIsEmpty!33044 mapRes!33044))

(declare-fun b!951372 () Bool)

(assert (=> b!951372 (= e!535710 tp_is_empty!20749)))

(declare-fun mapNonEmpty!33044 () Bool)

(declare-fun tp!63335 () Bool)

(assert (=> mapNonEmpty!33044 (= mapRes!33044 (and tp!63335 e!535709))))

(declare-fun mapRest!33044 () (Array (_ BitVec 32) ValueCell!9893))

(declare-fun mapKey!33044 () (_ BitVec 32))

(declare-fun mapValue!33044 () ValueCell!9893)

(assert (=> mapNonEmpty!33044 (= mapRest!33035 (store mapRest!33044 mapKey!33044 mapValue!33044))))

(assert (= (and mapNonEmpty!33035 condMapEmpty!33044) mapIsEmpty!33044))

(assert (= (and mapNonEmpty!33035 (not condMapEmpty!33044)) mapNonEmpty!33044))

(assert (= (and mapNonEmpty!33044 ((_ is ValueCellFull!9893) mapValue!33044)) b!951371))

(assert (= (and mapNonEmpty!33035 ((_ is ValueCellFull!9893) mapDefault!33044)) b!951372))

(declare-fun m!884183 () Bool)

(assert (=> mapNonEmpty!33044 m!884183))

(declare-fun b_lambda!14383 () Bool)

(assert (= b_lambda!14381 (or (and b!951190 b_free!18241) b_lambda!14383)))

(check-sat (not d!115489) tp_is_empty!20749 (not b!951290) (not b!951280) (not d!115501) (not b!951269) (not b!951350) (not b!951288) (not b!951352) b_and!29713 (not b_next!18241) (not d!115503) (not b_lambda!14383) (not b!951362) (not b!951337) (not bm!41433) (not b!951345) (not b!951338) (not bm!41428) (not b!951347) (not bm!41430) (not d!115507) (not b!951275) (not b!951263) (not b!951363) (not b!951341) (not b!951364) (not bm!41427) (not d!115505) (not b!951346) (not mapNonEmpty!33044))
(check-sat b_and!29713 (not b_next!18241))
