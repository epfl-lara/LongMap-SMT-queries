; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80566 () Bool)

(assert start!80566)

(declare-fun b!945704 () Bool)

(declare-fun b_free!18121 () Bool)

(declare-fun b_next!18121 () Bool)

(assert (=> b!945704 (= b_free!18121 (not b_next!18121))))

(declare-fun tp!62894 () Bool)

(declare-fun b_and!29517 () Bool)

(assert (=> b!945704 (= tp!62894 b_and!29517)))

(declare-fun res!635050 () Bool)

(declare-fun e!531992 () Bool)

(assert (=> start!80566 (=> (not res!635050) (not e!531992))))

(declare-datatypes ((V!32471 0))(
  ( (V!32472 (val!10365 Int)) )
))
(declare-datatypes ((ValueCell!9833 0))(
  ( (ValueCellFull!9833 (v!12898 V!32471)) (EmptyCell!9833) )
))
(declare-datatypes ((array!57203 0))(
  ( (array!57204 (arr!27521 (Array (_ BitVec 32) ValueCell!9833)) (size!27992 (_ BitVec 32))) )
))
(declare-datatypes ((array!57205 0))(
  ( (array!57206 (arr!27522 (Array (_ BitVec 32) (_ BitVec 64))) (size!27993 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4816 0))(
  ( (LongMapFixedSize!4817 (defaultEntry!5705 Int) (mask!27383 (_ BitVec 32)) (extraKeys!5437 (_ BitVec 32)) (zeroValue!5541 V!32471) (minValue!5541 V!32471) (_size!2463 (_ BitVec 32)) (_keys!10587 array!57205) (_values!5728 array!57203) (_vacant!2463 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4816)

(declare-fun valid!1841 (LongMapFixedSize!4816) Bool)

(assert (=> start!80566 (= res!635050 (valid!1841 thiss!1141))))

(assert (=> start!80566 e!531992))

(declare-fun e!531996 () Bool)

(assert (=> start!80566 e!531996))

(assert (=> start!80566 true))

(declare-fun b!945698 () Bool)

(declare-fun e!531991 () Bool)

(assert (=> b!945698 (= e!531992 e!531991)))

(declare-fun res!635051 () Bool)

(assert (=> b!945698 (=> (not res!635051) (not e!531991))))

(declare-datatypes ((SeekEntryResult!9091 0))(
  ( (MissingZero!9091 (index!38735 (_ BitVec 32))) (Found!9091 (index!38736 (_ BitVec 32))) (Intermediate!9091 (undefined!9903 Bool) (index!38737 (_ BitVec 32)) (x!81306 (_ BitVec 32))) (Undefined!9091) (MissingVacant!9091 (index!38738 (_ BitVec 32))) )
))
(declare-fun lt!425907 () SeekEntryResult!9091)

(get-info :version)

(assert (=> b!945698 (= res!635051 ((_ is Found!9091) lt!425907))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57205 (_ BitVec 32)) SeekEntryResult!9091)

(assert (=> b!945698 (= lt!425907 (seekEntry!0 key!756 (_keys!10587 thiss!1141) (mask!27383 thiss!1141)))))

(declare-fun mapIsEmpty!32790 () Bool)

(declare-fun mapRes!32790 () Bool)

(assert (=> mapIsEmpty!32790 mapRes!32790))

(declare-fun b!945699 () Bool)

(declare-fun e!531994 () Bool)

(declare-fun tp_is_empty!20629 () Bool)

(assert (=> b!945699 (= e!531994 tp_is_empty!20629)))

(declare-fun b!945700 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945700 (= e!531991 (not (validMask!0 (mask!27383 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945700 (arrayContainsKey!0 (_keys!10587 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31766 0))(
  ( (Unit!31767) )
))
(declare-fun lt!425908 () Unit!31766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57205 (_ BitVec 64) (_ BitVec 32)) Unit!31766)

(assert (=> b!945700 (= lt!425908 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10587 thiss!1141) key!756 (index!38736 lt!425907)))))

(declare-fun mapNonEmpty!32790 () Bool)

(declare-fun tp!62895 () Bool)

(assert (=> mapNonEmpty!32790 (= mapRes!32790 (and tp!62895 e!531994))))

(declare-fun mapValue!32790 () ValueCell!9833)

(declare-fun mapRest!32790 () (Array (_ BitVec 32) ValueCell!9833))

(declare-fun mapKey!32790 () (_ BitVec 32))

(assert (=> mapNonEmpty!32790 (= (arr!27521 (_values!5728 thiss!1141)) (store mapRest!32790 mapKey!32790 mapValue!32790))))

(declare-fun b!945701 () Bool)

(declare-fun res!635049 () Bool)

(assert (=> b!945701 (=> (not res!635049) (not e!531992))))

(assert (=> b!945701 (= res!635049 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945702 () Bool)

(declare-fun e!531993 () Bool)

(assert (=> b!945702 (= e!531993 tp_is_empty!20629)))

(declare-fun b!945703 () Bool)

(declare-fun e!531995 () Bool)

(assert (=> b!945703 (= e!531995 (and e!531993 mapRes!32790))))

(declare-fun condMapEmpty!32790 () Bool)

(declare-fun mapDefault!32790 () ValueCell!9833)

(assert (=> b!945703 (= condMapEmpty!32790 (= (arr!27521 (_values!5728 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9833)) mapDefault!32790)))))

(declare-fun array_inv!21430 (array!57205) Bool)

(declare-fun array_inv!21431 (array!57203) Bool)

(assert (=> b!945704 (= e!531996 (and tp!62894 tp_is_empty!20629 (array_inv!21430 (_keys!10587 thiss!1141)) (array_inv!21431 (_values!5728 thiss!1141)) e!531995))))

(assert (= (and start!80566 res!635050) b!945701))

(assert (= (and b!945701 res!635049) b!945698))

(assert (= (and b!945698 res!635051) b!945700))

(assert (= (and b!945703 condMapEmpty!32790) mapIsEmpty!32790))

(assert (= (and b!945703 (not condMapEmpty!32790)) mapNonEmpty!32790))

(assert (= (and mapNonEmpty!32790 ((_ is ValueCellFull!9833) mapValue!32790)) b!945699))

(assert (= (and b!945703 ((_ is ValueCellFull!9833) mapDefault!32790)) b!945702))

(assert (= b!945704 b!945703))

(assert (= start!80566 b!945704))

(declare-fun m!878765 () Bool)

(assert (=> mapNonEmpty!32790 m!878765))

(declare-fun m!878767 () Bool)

(assert (=> b!945698 m!878767))

(declare-fun m!878769 () Bool)

(assert (=> start!80566 m!878769))

(declare-fun m!878771 () Bool)

(assert (=> b!945700 m!878771))

(declare-fun m!878773 () Bool)

(assert (=> b!945700 m!878773))

(declare-fun m!878775 () Bool)

(assert (=> b!945700 m!878775))

(declare-fun m!878777 () Bool)

(assert (=> b!945704 m!878777))

(declare-fun m!878779 () Bool)

(assert (=> b!945704 m!878779))

(check-sat b_and!29517 (not start!80566) (not b!945698) tp_is_empty!20629 (not mapNonEmpty!32790) (not b!945700) (not b!945704) (not b_next!18121))
(check-sat b_and!29517 (not b_next!18121))
(get-model)

(declare-fun d!114265 () Bool)

(assert (=> d!114265 (= (array_inv!21430 (_keys!10587 thiss!1141)) (bvsge (size!27993 (_keys!10587 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945704 d!114265))

(declare-fun d!114267 () Bool)

(assert (=> d!114267 (= (array_inv!21431 (_values!5728 thiss!1141)) (bvsge (size!27992 (_values!5728 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945704 d!114267))

(declare-fun d!114269 () Bool)

(assert (=> d!114269 (= (validMask!0 (mask!27383 thiss!1141)) (and (or (= (mask!27383 thiss!1141) #b00000000000000000000000000000111) (= (mask!27383 thiss!1141) #b00000000000000000000000000001111) (= (mask!27383 thiss!1141) #b00000000000000000000000000011111) (= (mask!27383 thiss!1141) #b00000000000000000000000000111111) (= (mask!27383 thiss!1141) #b00000000000000000000000001111111) (= (mask!27383 thiss!1141) #b00000000000000000000000011111111) (= (mask!27383 thiss!1141) #b00000000000000000000000111111111) (= (mask!27383 thiss!1141) #b00000000000000000000001111111111) (= (mask!27383 thiss!1141) #b00000000000000000000011111111111) (= (mask!27383 thiss!1141) #b00000000000000000000111111111111) (= (mask!27383 thiss!1141) #b00000000000000000001111111111111) (= (mask!27383 thiss!1141) #b00000000000000000011111111111111) (= (mask!27383 thiss!1141) #b00000000000000000111111111111111) (= (mask!27383 thiss!1141) #b00000000000000001111111111111111) (= (mask!27383 thiss!1141) #b00000000000000011111111111111111) (= (mask!27383 thiss!1141) #b00000000000000111111111111111111) (= (mask!27383 thiss!1141) #b00000000000001111111111111111111) (= (mask!27383 thiss!1141) #b00000000000011111111111111111111) (= (mask!27383 thiss!1141) #b00000000000111111111111111111111) (= (mask!27383 thiss!1141) #b00000000001111111111111111111111) (= (mask!27383 thiss!1141) #b00000000011111111111111111111111) (= (mask!27383 thiss!1141) #b00000000111111111111111111111111) (= (mask!27383 thiss!1141) #b00000001111111111111111111111111) (= (mask!27383 thiss!1141) #b00000011111111111111111111111111) (= (mask!27383 thiss!1141) #b00000111111111111111111111111111) (= (mask!27383 thiss!1141) #b00001111111111111111111111111111) (= (mask!27383 thiss!1141) #b00011111111111111111111111111111) (= (mask!27383 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27383 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!945700 d!114269))

(declare-fun d!114271 () Bool)

(declare-fun res!635074 () Bool)

(declare-fun e!532043 () Bool)

(assert (=> d!114271 (=> res!635074 e!532043)))

(assert (=> d!114271 (= res!635074 (= (select (arr!27522 (_keys!10587 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114271 (= (arrayContainsKey!0 (_keys!10587 thiss!1141) key!756 #b00000000000000000000000000000000) e!532043)))

(declare-fun b!945751 () Bool)

(declare-fun e!532044 () Bool)

(assert (=> b!945751 (= e!532043 e!532044)))

(declare-fun res!635075 () Bool)

(assert (=> b!945751 (=> (not res!635075) (not e!532044))))

(assert (=> b!945751 (= res!635075 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27993 (_keys!10587 thiss!1141))))))

(declare-fun b!945752 () Bool)

(assert (=> b!945752 (= e!532044 (arrayContainsKey!0 (_keys!10587 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114271 (not res!635074)) b!945751))

(assert (= (and b!945751 res!635075) b!945752))

(declare-fun m!878813 () Bool)

(assert (=> d!114271 m!878813))

(declare-fun m!878815 () Bool)

(assert (=> b!945752 m!878815))

(assert (=> b!945700 d!114271))

(declare-fun d!114273 () Bool)

(assert (=> d!114273 (arrayContainsKey!0 (_keys!10587 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425923 () Unit!31766)

(declare-fun choose!13 (array!57205 (_ BitVec 64) (_ BitVec 32)) Unit!31766)

(assert (=> d!114273 (= lt!425923 (choose!13 (_keys!10587 thiss!1141) key!756 (index!38736 lt!425907)))))

(assert (=> d!114273 (bvsge (index!38736 lt!425907) #b00000000000000000000000000000000)))

(assert (=> d!114273 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10587 thiss!1141) key!756 (index!38736 lt!425907)) lt!425923)))

(declare-fun bs!26559 () Bool)

(assert (= bs!26559 d!114273))

(assert (=> bs!26559 m!878773))

(declare-fun m!878817 () Bool)

(assert (=> bs!26559 m!878817))

(assert (=> b!945700 d!114273))

(declare-fun b!945765 () Bool)

(declare-fun e!532051 () SeekEntryResult!9091)

(declare-fun e!532053 () SeekEntryResult!9091)

(assert (=> b!945765 (= e!532051 e!532053)))

(declare-fun lt!425933 () (_ BitVec 64))

(declare-fun lt!425935 () SeekEntryResult!9091)

(assert (=> b!945765 (= lt!425933 (select (arr!27522 (_keys!10587 thiss!1141)) (index!38737 lt!425935)))))

(declare-fun c!98430 () Bool)

(assert (=> b!945765 (= c!98430 (= lt!425933 key!756))))

(declare-fun b!945766 () Bool)

(assert (=> b!945766 (= e!532053 (Found!9091 (index!38737 lt!425935)))))

(declare-fun b!945767 () Bool)

(assert (=> b!945767 (= e!532051 Undefined!9091)))

(declare-fun b!945768 () Bool)

(declare-fun c!98428 () Bool)

(assert (=> b!945768 (= c!98428 (= lt!425933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532052 () SeekEntryResult!9091)

(assert (=> b!945768 (= e!532053 e!532052)))

(declare-fun b!945769 () Bool)

(declare-fun lt!425934 () SeekEntryResult!9091)

(assert (=> b!945769 (= e!532052 (ite ((_ is MissingVacant!9091) lt!425934) (MissingZero!9091 (index!38738 lt!425934)) lt!425934))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57205 (_ BitVec 32)) SeekEntryResult!9091)

(assert (=> b!945769 (= lt!425934 (seekKeyOrZeroReturnVacant!0 (x!81306 lt!425935) (index!38737 lt!425935) (index!38737 lt!425935) key!756 (_keys!10587 thiss!1141) (mask!27383 thiss!1141)))))

(declare-fun d!114275 () Bool)

(declare-fun lt!425932 () SeekEntryResult!9091)

(assert (=> d!114275 (and (or ((_ is MissingVacant!9091) lt!425932) (not ((_ is Found!9091) lt!425932)) (and (bvsge (index!38736 lt!425932) #b00000000000000000000000000000000) (bvslt (index!38736 lt!425932) (size!27993 (_keys!10587 thiss!1141))))) (not ((_ is MissingVacant!9091) lt!425932)) (or (not ((_ is Found!9091) lt!425932)) (= (select (arr!27522 (_keys!10587 thiss!1141)) (index!38736 lt!425932)) key!756)))))

(assert (=> d!114275 (= lt!425932 e!532051)))

(declare-fun c!98429 () Bool)

(assert (=> d!114275 (= c!98429 (and ((_ is Intermediate!9091) lt!425935) (undefined!9903 lt!425935)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57205 (_ BitVec 32)) SeekEntryResult!9091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114275 (= lt!425935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27383 thiss!1141)) key!756 (_keys!10587 thiss!1141) (mask!27383 thiss!1141)))))

(assert (=> d!114275 (validMask!0 (mask!27383 thiss!1141))))

(assert (=> d!114275 (= (seekEntry!0 key!756 (_keys!10587 thiss!1141) (mask!27383 thiss!1141)) lt!425932)))

(declare-fun b!945770 () Bool)

(assert (=> b!945770 (= e!532052 (MissingZero!9091 (index!38737 lt!425935)))))

(assert (= (and d!114275 c!98429) b!945767))

(assert (= (and d!114275 (not c!98429)) b!945765))

(assert (= (and b!945765 c!98430) b!945766))

(assert (= (and b!945765 (not c!98430)) b!945768))

(assert (= (and b!945768 c!98428) b!945770))

(assert (= (and b!945768 (not c!98428)) b!945769))

(declare-fun m!878819 () Bool)

(assert (=> b!945765 m!878819))

(declare-fun m!878821 () Bool)

(assert (=> b!945769 m!878821))

(declare-fun m!878823 () Bool)

(assert (=> d!114275 m!878823))

(declare-fun m!878825 () Bool)

(assert (=> d!114275 m!878825))

(assert (=> d!114275 m!878825))

(declare-fun m!878827 () Bool)

(assert (=> d!114275 m!878827))

(assert (=> d!114275 m!878771))

(assert (=> b!945698 d!114275))

(declare-fun d!114277 () Bool)

(declare-fun res!635082 () Bool)

(declare-fun e!532056 () Bool)

(assert (=> d!114277 (=> (not res!635082) (not e!532056))))

(declare-fun simpleValid!355 (LongMapFixedSize!4816) Bool)

(assert (=> d!114277 (= res!635082 (simpleValid!355 thiss!1141))))

(assert (=> d!114277 (= (valid!1841 thiss!1141) e!532056)))

(declare-fun b!945777 () Bool)

(declare-fun res!635083 () Bool)

(assert (=> b!945777 (=> (not res!635083) (not e!532056))))

(declare-fun arrayCountValidKeys!0 (array!57205 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945777 (= res!635083 (= (arrayCountValidKeys!0 (_keys!10587 thiss!1141) #b00000000000000000000000000000000 (size!27993 (_keys!10587 thiss!1141))) (_size!2463 thiss!1141)))))

(declare-fun b!945778 () Bool)

(declare-fun res!635084 () Bool)

(assert (=> b!945778 (=> (not res!635084) (not e!532056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57205 (_ BitVec 32)) Bool)

(assert (=> b!945778 (= res!635084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10587 thiss!1141) (mask!27383 thiss!1141)))))

(declare-fun b!945779 () Bool)

(declare-datatypes ((List!19300 0))(
  ( (Nil!19297) (Cons!19296 (h!20448 (_ BitVec 64)) (t!27612 List!19300)) )
))
(declare-fun arrayNoDuplicates!0 (array!57205 (_ BitVec 32) List!19300) Bool)

(assert (=> b!945779 (= e!532056 (arrayNoDuplicates!0 (_keys!10587 thiss!1141) #b00000000000000000000000000000000 Nil!19297))))

(assert (= (and d!114277 res!635082) b!945777))

(assert (= (and b!945777 res!635083) b!945778))

(assert (= (and b!945778 res!635084) b!945779))

(declare-fun m!878829 () Bool)

(assert (=> d!114277 m!878829))

(declare-fun m!878831 () Bool)

(assert (=> b!945777 m!878831))

(declare-fun m!878833 () Bool)

(assert (=> b!945778 m!878833))

(declare-fun m!878835 () Bool)

(assert (=> b!945779 m!878835))

(assert (=> start!80566 d!114277))

(declare-fun b!945787 () Bool)

(declare-fun e!532062 () Bool)

(assert (=> b!945787 (= e!532062 tp_is_empty!20629)))

(declare-fun condMapEmpty!32799 () Bool)

(declare-fun mapDefault!32799 () ValueCell!9833)

(assert (=> mapNonEmpty!32790 (= condMapEmpty!32799 (= mapRest!32790 ((as const (Array (_ BitVec 32) ValueCell!9833)) mapDefault!32799)))))

(declare-fun mapRes!32799 () Bool)

(assert (=> mapNonEmpty!32790 (= tp!62895 (and e!532062 mapRes!32799))))

(declare-fun mapIsEmpty!32799 () Bool)

(assert (=> mapIsEmpty!32799 mapRes!32799))

(declare-fun mapNonEmpty!32799 () Bool)

(declare-fun tp!62910 () Bool)

(declare-fun e!532061 () Bool)

(assert (=> mapNonEmpty!32799 (= mapRes!32799 (and tp!62910 e!532061))))

(declare-fun mapKey!32799 () (_ BitVec 32))

(declare-fun mapValue!32799 () ValueCell!9833)

(declare-fun mapRest!32799 () (Array (_ BitVec 32) ValueCell!9833))

(assert (=> mapNonEmpty!32799 (= mapRest!32790 (store mapRest!32799 mapKey!32799 mapValue!32799))))

(declare-fun b!945786 () Bool)

(assert (=> b!945786 (= e!532061 tp_is_empty!20629)))

(assert (= (and mapNonEmpty!32790 condMapEmpty!32799) mapIsEmpty!32799))

(assert (= (and mapNonEmpty!32790 (not condMapEmpty!32799)) mapNonEmpty!32799))

(assert (= (and mapNonEmpty!32799 ((_ is ValueCellFull!9833) mapValue!32799)) b!945786))

(assert (= (and mapNonEmpty!32790 ((_ is ValueCellFull!9833) mapDefault!32799)) b!945787))

(declare-fun m!878837 () Bool)

(assert (=> mapNonEmpty!32799 m!878837))

(check-sat b_and!29517 (not d!114273) tp_is_empty!20629 (not mapNonEmpty!32799) (not b!945778) (not b!945777) (not b_next!18121) (not b!945769) (not d!114277) (not b!945752) (not d!114275) (not b!945779))
(check-sat b_and!29517 (not b_next!18121))
