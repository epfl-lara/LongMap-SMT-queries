; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80046 () Bool)

(assert start!80046)

(declare-fun b!941157 () Bool)

(declare-fun b_free!17901 () Bool)

(declare-fun b_next!17901 () Bool)

(assert (=> b!941157 (= b_free!17901 (not b_next!17901))))

(declare-fun tp!62178 () Bool)

(declare-fun b_and!29313 () Bool)

(assert (=> b!941157 (= tp!62178 b_and!29313)))

(declare-fun b!941154 () Bool)

(declare-fun e!529084 () Bool)

(declare-fun tp_is_empty!20409 () Bool)

(assert (=> b!941154 (= e!529084 tp_is_empty!20409)))

(declare-fun b!941155 () Bool)

(declare-fun res!632762 () Bool)

(declare-fun e!529087 () Bool)

(assert (=> b!941155 (=> (not res!632762) (not e!529087))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32177 0))(
  ( (V!32178 (val!10255 Int)) )
))
(declare-datatypes ((ValueCell!9723 0))(
  ( (ValueCellFull!9723 (v!12786 V!32177)) (EmptyCell!9723) )
))
(declare-datatypes ((array!56766 0))(
  ( (array!56767 (arr!27318 (Array (_ BitVec 32) ValueCell!9723)) (size!27779 (_ BitVec 32))) )
))
(declare-datatypes ((array!56768 0))(
  ( (array!56769 (arr!27319 (Array (_ BitVec 32) (_ BitVec 64))) (size!27780 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4596 0))(
  ( (LongMapFixedSize!4597 (defaultEntry!5589 Int) (mask!27146 (_ BitVec 32)) (extraKeys!5321 (_ BitVec 32)) (zeroValue!5425 V!32177) (minValue!5425 V!32177) (_size!2353 (_ BitVec 32)) (_keys!10439 array!56768) (_values!5612 array!56766) (_vacant!2353 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4596)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9018 0))(
  ( (MissingZero!9018 (index!38443 (_ BitVec 32))) (Found!9018 (index!38444 (_ BitVec 32))) (Intermediate!9018 (undefined!9830 Bool) (index!38445 (_ BitVec 32)) (x!80743 (_ BitVec 32))) (Undefined!9018) (MissingVacant!9018 (index!38446 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56768 (_ BitVec 32)) SeekEntryResult!9018)

(assert (=> b!941155 (= res!632762 (not ((_ is Found!9018) (seekEntry!0 key!756 (_keys!10439 thiss!1141) (mask!27146 thiss!1141)))))))

(declare-fun mapIsEmpty!32404 () Bool)

(declare-fun mapRes!32404 () Bool)

(assert (=> mapIsEmpty!32404 mapRes!32404))

(declare-fun mapNonEmpty!32404 () Bool)

(declare-fun tp!62177 () Bool)

(declare-fun e!529085 () Bool)

(assert (=> mapNonEmpty!32404 (= mapRes!32404 (and tp!62177 e!529085))))

(declare-fun mapKey!32404 () (_ BitVec 32))

(declare-fun mapValue!32404 () ValueCell!9723)

(declare-fun mapRest!32404 () (Array (_ BitVec 32) ValueCell!9723))

(assert (=> mapNonEmpty!32404 (= (arr!27318 (_values!5612 thiss!1141)) (store mapRest!32404 mapKey!32404 mapValue!32404))))

(declare-fun b!941156 () Bool)

(declare-fun res!632763 () Bool)

(assert (=> b!941156 (=> (not res!632763) (not e!529087))))

(assert (=> b!941156 (= res!632763 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!529086 () Bool)

(declare-fun e!529083 () Bool)

(declare-fun array_inv!21230 (array!56768) Bool)

(declare-fun array_inv!21231 (array!56766) Bool)

(assert (=> b!941157 (= e!529083 (and tp!62178 tp_is_empty!20409 (array_inv!21230 (_keys!10439 thiss!1141)) (array_inv!21231 (_values!5612 thiss!1141)) e!529086))))

(declare-fun b!941158 () Bool)

(assert (=> b!941158 (= e!529085 tp_is_empty!20409)))

(declare-fun res!632764 () Bool)

(assert (=> start!80046 (=> (not res!632764) (not e!529087))))

(declare-fun valid!1760 (LongMapFixedSize!4596) Bool)

(assert (=> start!80046 (= res!632764 (valid!1760 thiss!1141))))

(assert (=> start!80046 e!529087))

(assert (=> start!80046 e!529083))

(assert (=> start!80046 true))

(declare-fun b!941159 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941159 (= e!529087 (not (validMask!0 (mask!27146 thiss!1141))))))

(declare-fun b!941160 () Bool)

(assert (=> b!941160 (= e!529086 (and e!529084 mapRes!32404))))

(declare-fun condMapEmpty!32404 () Bool)

(declare-fun mapDefault!32404 () ValueCell!9723)

(assert (=> b!941160 (= condMapEmpty!32404 (= (arr!27318 (_values!5612 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9723)) mapDefault!32404)))))

(assert (= (and start!80046 res!632764) b!941156))

(assert (= (and b!941156 res!632763) b!941155))

(assert (= (and b!941155 res!632762) b!941159))

(assert (= (and b!941160 condMapEmpty!32404) mapIsEmpty!32404))

(assert (= (and b!941160 (not condMapEmpty!32404)) mapNonEmpty!32404))

(assert (= (and mapNonEmpty!32404 ((_ is ValueCellFull!9723) mapValue!32404)) b!941158))

(assert (= (and b!941160 ((_ is ValueCellFull!9723) mapDefault!32404)) b!941154))

(assert (= b!941157 b!941160))

(assert (= start!80046 b!941157))

(declare-fun m!876391 () Bool)

(assert (=> start!80046 m!876391))

(declare-fun m!876393 () Bool)

(assert (=> b!941155 m!876393))

(declare-fun m!876395 () Bool)

(assert (=> mapNonEmpty!32404 m!876395))

(declare-fun m!876397 () Bool)

(assert (=> b!941157 m!876397))

(declare-fun m!876399 () Bool)

(assert (=> b!941157 m!876399))

(declare-fun m!876401 () Bool)

(assert (=> b!941159 m!876401))

(check-sat (not b!941157) tp_is_empty!20409 b_and!29313 (not b!941155) (not mapNonEmpty!32404) (not start!80046) (not b!941159) (not b_next!17901))
(check-sat b_and!29313 (not b_next!17901))
(get-model)

(declare-fun d!114031 () Bool)

(declare-fun res!632780 () Bool)

(declare-fun e!529108 () Bool)

(assert (=> d!114031 (=> (not res!632780) (not e!529108))))

(declare-fun simpleValid!339 (LongMapFixedSize!4596) Bool)

(assert (=> d!114031 (= res!632780 (simpleValid!339 thiss!1141))))

(assert (=> d!114031 (= (valid!1760 thiss!1141) e!529108)))

(declare-fun b!941188 () Bool)

(declare-fun res!632781 () Bool)

(assert (=> b!941188 (=> (not res!632781) (not e!529108))))

(declare-fun arrayCountValidKeys!0 (array!56768 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941188 (= res!632781 (= (arrayCountValidKeys!0 (_keys!10439 thiss!1141) #b00000000000000000000000000000000 (size!27780 (_keys!10439 thiss!1141))) (_size!2353 thiss!1141)))))

(declare-fun b!941189 () Bool)

(declare-fun res!632782 () Bool)

(assert (=> b!941189 (=> (not res!632782) (not e!529108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56768 (_ BitVec 32)) Bool)

(assert (=> b!941189 (= res!632782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10439 thiss!1141) (mask!27146 thiss!1141)))))

(declare-fun b!941190 () Bool)

(declare-datatypes ((List!19204 0))(
  ( (Nil!19201) (Cons!19200 (h!20346 (_ BitVec 64)) (t!27519 List!19204)) )
))
(declare-fun arrayNoDuplicates!0 (array!56768 (_ BitVec 32) List!19204) Bool)

(assert (=> b!941190 (= e!529108 (arrayNoDuplicates!0 (_keys!10439 thiss!1141) #b00000000000000000000000000000000 Nil!19201))))

(assert (= (and d!114031 res!632780) b!941188))

(assert (= (and b!941188 res!632781) b!941189))

(assert (= (and b!941189 res!632782) b!941190))

(declare-fun m!876415 () Bool)

(assert (=> d!114031 m!876415))

(declare-fun m!876417 () Bool)

(assert (=> b!941188 m!876417))

(declare-fun m!876419 () Bool)

(assert (=> b!941189 m!876419))

(declare-fun m!876421 () Bool)

(assert (=> b!941190 m!876421))

(assert (=> start!80046 d!114031))

(declare-fun d!114033 () Bool)

(assert (=> d!114033 (= (array_inv!21230 (_keys!10439 thiss!1141)) (bvsge (size!27780 (_keys!10439 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941157 d!114033))

(declare-fun d!114035 () Bool)

(assert (=> d!114035 (= (array_inv!21231 (_values!5612 thiss!1141)) (bvsge (size!27779 (_values!5612 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941157 d!114035))

(declare-fun b!941203 () Bool)

(declare-fun e!529116 () SeekEntryResult!9018)

(declare-fun lt!424931 () SeekEntryResult!9018)

(assert (=> b!941203 (= e!529116 (Found!9018 (index!38445 lt!424931)))))

(declare-fun b!941204 () Bool)

(declare-fun e!529117 () SeekEntryResult!9018)

(assert (=> b!941204 (= e!529117 e!529116)))

(declare-fun lt!424930 () (_ BitVec 64))

(assert (=> b!941204 (= lt!424930 (select (arr!27319 (_keys!10439 thiss!1141)) (index!38445 lt!424931)))))

(declare-fun c!98033 () Bool)

(assert (=> b!941204 (= c!98033 (= lt!424930 key!756))))

(declare-fun b!941205 () Bool)

(assert (=> b!941205 (= e!529117 Undefined!9018)))

(declare-fun d!114037 () Bool)

(declare-fun lt!424932 () SeekEntryResult!9018)

(assert (=> d!114037 (and (or ((_ is MissingVacant!9018) lt!424932) (not ((_ is Found!9018) lt!424932)) (and (bvsge (index!38444 lt!424932) #b00000000000000000000000000000000) (bvslt (index!38444 lt!424932) (size!27780 (_keys!10439 thiss!1141))))) (not ((_ is MissingVacant!9018) lt!424932)) (or (not ((_ is Found!9018) lt!424932)) (= (select (arr!27319 (_keys!10439 thiss!1141)) (index!38444 lt!424932)) key!756)))))

(assert (=> d!114037 (= lt!424932 e!529117)))

(declare-fun c!98034 () Bool)

(assert (=> d!114037 (= c!98034 (and ((_ is Intermediate!9018) lt!424931) (undefined!9830 lt!424931)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56768 (_ BitVec 32)) SeekEntryResult!9018)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114037 (= lt!424931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27146 thiss!1141)) key!756 (_keys!10439 thiss!1141) (mask!27146 thiss!1141)))))

(assert (=> d!114037 (validMask!0 (mask!27146 thiss!1141))))

(assert (=> d!114037 (= (seekEntry!0 key!756 (_keys!10439 thiss!1141) (mask!27146 thiss!1141)) lt!424932)))

(declare-fun b!941206 () Bool)

(declare-fun e!529115 () SeekEntryResult!9018)

(declare-fun lt!424933 () SeekEntryResult!9018)

(assert (=> b!941206 (= e!529115 (ite ((_ is MissingVacant!9018) lt!424933) (MissingZero!9018 (index!38446 lt!424933)) lt!424933))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56768 (_ BitVec 32)) SeekEntryResult!9018)

(assert (=> b!941206 (= lt!424933 (seekKeyOrZeroReturnVacant!0 (x!80743 lt!424931) (index!38445 lt!424931) (index!38445 lt!424931) key!756 (_keys!10439 thiss!1141) (mask!27146 thiss!1141)))))

(declare-fun b!941207 () Bool)

(declare-fun c!98035 () Bool)

(assert (=> b!941207 (= c!98035 (= lt!424930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!941207 (= e!529116 e!529115)))

(declare-fun b!941208 () Bool)

(assert (=> b!941208 (= e!529115 (MissingZero!9018 (index!38445 lt!424931)))))

(assert (= (and d!114037 c!98034) b!941205))

(assert (= (and d!114037 (not c!98034)) b!941204))

(assert (= (and b!941204 c!98033) b!941203))

(assert (= (and b!941204 (not c!98033)) b!941207))

(assert (= (and b!941207 c!98035) b!941208))

(assert (= (and b!941207 (not c!98035)) b!941206))

(declare-fun m!876423 () Bool)

(assert (=> b!941204 m!876423))

(declare-fun m!876425 () Bool)

(assert (=> d!114037 m!876425))

(declare-fun m!876427 () Bool)

(assert (=> d!114037 m!876427))

(assert (=> d!114037 m!876427))

(declare-fun m!876429 () Bool)

(assert (=> d!114037 m!876429))

(assert (=> d!114037 m!876401))

(declare-fun m!876431 () Bool)

(assert (=> b!941206 m!876431))

(assert (=> b!941155 d!114037))

(declare-fun d!114039 () Bool)

(assert (=> d!114039 (= (validMask!0 (mask!27146 thiss!1141)) (and (or (= (mask!27146 thiss!1141) #b00000000000000000000000000000111) (= (mask!27146 thiss!1141) #b00000000000000000000000000001111) (= (mask!27146 thiss!1141) #b00000000000000000000000000011111) (= (mask!27146 thiss!1141) #b00000000000000000000000000111111) (= (mask!27146 thiss!1141) #b00000000000000000000000001111111) (= (mask!27146 thiss!1141) #b00000000000000000000000011111111) (= (mask!27146 thiss!1141) #b00000000000000000000000111111111) (= (mask!27146 thiss!1141) #b00000000000000000000001111111111) (= (mask!27146 thiss!1141) #b00000000000000000000011111111111) (= (mask!27146 thiss!1141) #b00000000000000000000111111111111) (= (mask!27146 thiss!1141) #b00000000000000000001111111111111) (= (mask!27146 thiss!1141) #b00000000000000000011111111111111) (= (mask!27146 thiss!1141) #b00000000000000000111111111111111) (= (mask!27146 thiss!1141) #b00000000000000001111111111111111) (= (mask!27146 thiss!1141) #b00000000000000011111111111111111) (= (mask!27146 thiss!1141) #b00000000000000111111111111111111) (= (mask!27146 thiss!1141) #b00000000000001111111111111111111) (= (mask!27146 thiss!1141) #b00000000000011111111111111111111) (= (mask!27146 thiss!1141) #b00000000000111111111111111111111) (= (mask!27146 thiss!1141) #b00000000001111111111111111111111) (= (mask!27146 thiss!1141) #b00000000011111111111111111111111) (= (mask!27146 thiss!1141) #b00000000111111111111111111111111) (= (mask!27146 thiss!1141) #b00000001111111111111111111111111) (= (mask!27146 thiss!1141) #b00000011111111111111111111111111) (= (mask!27146 thiss!1141) #b00000111111111111111111111111111) (= (mask!27146 thiss!1141) #b00001111111111111111111111111111) (= (mask!27146 thiss!1141) #b00011111111111111111111111111111) (= (mask!27146 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27146 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941159 d!114039))

(declare-fun b!941215 () Bool)

(declare-fun e!529123 () Bool)

(assert (=> b!941215 (= e!529123 tp_is_empty!20409)))

(declare-fun b!941216 () Bool)

(declare-fun e!529122 () Bool)

(assert (=> b!941216 (= e!529122 tp_is_empty!20409)))

(declare-fun mapNonEmpty!32410 () Bool)

(declare-fun mapRes!32410 () Bool)

(declare-fun tp!62187 () Bool)

(assert (=> mapNonEmpty!32410 (= mapRes!32410 (and tp!62187 e!529123))))

(declare-fun mapValue!32410 () ValueCell!9723)

(declare-fun mapRest!32410 () (Array (_ BitVec 32) ValueCell!9723))

(declare-fun mapKey!32410 () (_ BitVec 32))

(assert (=> mapNonEmpty!32410 (= mapRest!32404 (store mapRest!32410 mapKey!32410 mapValue!32410))))

(declare-fun mapIsEmpty!32410 () Bool)

(assert (=> mapIsEmpty!32410 mapRes!32410))

(declare-fun condMapEmpty!32410 () Bool)

(declare-fun mapDefault!32410 () ValueCell!9723)

(assert (=> mapNonEmpty!32404 (= condMapEmpty!32410 (= mapRest!32404 ((as const (Array (_ BitVec 32) ValueCell!9723)) mapDefault!32410)))))

(assert (=> mapNonEmpty!32404 (= tp!62177 (and e!529122 mapRes!32410))))

(assert (= (and mapNonEmpty!32404 condMapEmpty!32410) mapIsEmpty!32410))

(assert (= (and mapNonEmpty!32404 (not condMapEmpty!32410)) mapNonEmpty!32410))

(assert (= (and mapNonEmpty!32410 ((_ is ValueCellFull!9723) mapValue!32410)) b!941215))

(assert (= (and mapNonEmpty!32404 ((_ is ValueCellFull!9723) mapDefault!32410)) b!941216))

(declare-fun m!876433 () Bool)

(assert (=> mapNonEmpty!32410 m!876433))

(check-sat tp_is_empty!20409 (not b_next!17901) (not mapNonEmpty!32410) b_and!29313 (not d!114031) (not d!114037) (not b!941190) (not b!941188) (not b!941206) (not b!941189))
(check-sat b_and!29313 (not b_next!17901))
