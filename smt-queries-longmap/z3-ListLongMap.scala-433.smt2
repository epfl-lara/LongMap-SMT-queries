; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8130 () Bool)

(assert start!8130)

(declare-fun b!51166 () Bool)

(declare-fun b_free!1585 () Bool)

(declare-fun b_next!1585 () Bool)

(assert (=> b!51166 (= b_free!1585 (not b_next!1585))))

(declare-fun tp!6835 () Bool)

(declare-fun b_and!2797 () Bool)

(assert (=> b!51166 (= tp!6835 b_and!2797)))

(declare-fun b!51154 () Bool)

(declare-fun b_free!1587 () Bool)

(declare-fun b_next!1587 () Bool)

(assert (=> b!51154 (= b_free!1587 (not b_next!1587))))

(declare-fun tp!6837 () Bool)

(declare-fun b_and!2799 () Bool)

(assert (=> b!51154 (= tp!6837 b_and!2799)))

(declare-fun mapNonEmpty!2277 () Bool)

(declare-fun mapRes!2277 () Bool)

(declare-fun tp!6836 () Bool)

(declare-fun e!33147 () Bool)

(assert (=> mapNonEmpty!2277 (= mapRes!2277 (and tp!6836 e!33147))))

(declare-datatypes ((V!2593 0))(
  ( (V!2594 (val!1149 Int)) )
))
(declare-datatypes ((array!3315 0))(
  ( (array!3316 (arr!1582 (Array (_ BitVec 32) (_ BitVec 64))) (size!1809 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!761 0))(
  ( (ValueCellFull!761 (v!2184 V!2593)) (EmptyCell!761) )
))
(declare-datatypes ((array!3317 0))(
  ( (array!3318 (arr!1583 (Array (_ BitVec 32) ValueCell!761)) (size!1810 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!430 0))(
  ( (LongMapFixedSize!431 (defaultEntry!1929 Int) (mask!5732 (_ BitVec 32)) (extraKeys!1820 (_ BitVec 32)) (zeroValue!1847 V!2593) (minValue!1847 V!2593) (_size!264 (_ BitVec 32)) (_keys!3542 array!3315) (_values!1912 array!3317) (_vacant!264 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!254 0))(
  ( (Cell!255 (v!2185 LongMapFixedSize!430)) )
))
(declare-datatypes ((LongMap!254 0))(
  ( (LongMap!255 (underlying!138 Cell!254)) )
))
(declare-fun thiss!992 () LongMap!254)

(declare-fun mapKey!2278 () (_ BitVec 32))

(declare-fun mapValue!2278 () ValueCell!761)

(declare-fun mapRest!2277 () (Array (_ BitVec 32) ValueCell!761))

(assert (=> mapNonEmpty!2277 (= (arr!1583 (_values!1912 (v!2185 (underlying!138 thiss!992)))) (store mapRest!2277 mapKey!2278 mapValue!2278))))

(declare-fun b!51153 () Bool)

(declare-fun e!33153 () Bool)

(declare-fun e!33145 () Bool)

(declare-fun mapRes!2278 () Bool)

(assert (=> b!51153 (= e!33153 (and e!33145 mapRes!2278))))

(declare-fun condMapEmpty!2277 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!430)

(declare-fun mapDefault!2278 () ValueCell!761)

(assert (=> b!51153 (= condMapEmpty!2277 (= (arr!1583 (_values!1912 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2278)))))

(declare-fun tp_is_empty!2209 () Bool)

(declare-fun e!33154 () Bool)

(declare-fun array_inv!967 (array!3315) Bool)

(declare-fun array_inv!968 (array!3317) Bool)

(assert (=> b!51154 (= e!33154 (and tp!6837 tp_is_empty!2209 (array_inv!967 (_keys!3542 newMap!16)) (array_inv!968 (_values!1912 newMap!16)) e!33153))))

(declare-fun b!51155 () Bool)

(declare-fun res!29322 () Bool)

(declare-fun e!33150 () Bool)

(assert (=> b!51155 (=> (not res!29322) (not e!33150))))

(declare-fun valid!157 (LongMapFixedSize!430) Bool)

(assert (=> b!51155 (= res!29322 (valid!157 newMap!16))))

(declare-fun b!51156 () Bool)

(declare-fun e!33144 () Bool)

(assert (=> b!51156 (= e!33144 tp_is_empty!2209)))

(declare-fun mapIsEmpty!2277 () Bool)

(assert (=> mapIsEmpty!2277 mapRes!2277))

(declare-fun mapIsEmpty!2278 () Bool)

(assert (=> mapIsEmpty!2278 mapRes!2278))

(declare-fun b!51157 () Bool)

(declare-fun res!29324 () Bool)

(assert (=> b!51157 (=> (not res!29324) (not e!33150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51157 (= res!29324 (validMask!0 (mask!5732 (v!2185 (underlying!138 thiss!992)))))))

(declare-fun b!51158 () Bool)

(assert (=> b!51158 (= e!33150 (and (= (size!1810 (_values!1912 (v!2185 (underlying!138 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5732 (v!2185 (underlying!138 thiss!992))))) (= (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) (size!1810 (_values!1912 (v!2185 (underlying!138 thiss!992))))) (bvsge (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1820 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!1820 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51159 () Bool)

(declare-fun res!29321 () Bool)

(assert (=> b!51159 (=> (not res!29321) (not e!33150))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51159 (= res!29321 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992)))))))))

(declare-fun b!51160 () Bool)

(assert (=> b!51160 (= e!33145 tp_is_empty!2209)))

(declare-fun b!51161 () Bool)

(declare-fun e!33156 () Bool)

(declare-fun e!33155 () Bool)

(assert (=> b!51161 (= e!33156 e!33155)))

(declare-fun b!51162 () Bool)

(declare-fun e!33151 () Bool)

(assert (=> b!51162 (= e!33151 tp_is_empty!2209)))

(declare-fun res!29323 () Bool)

(assert (=> start!8130 (=> (not res!29323) (not e!33150))))

(declare-fun valid!158 (LongMap!254) Bool)

(assert (=> start!8130 (= res!29323 (valid!158 thiss!992))))

(assert (=> start!8130 e!33150))

(assert (=> start!8130 e!33156))

(assert (=> start!8130 true))

(assert (=> start!8130 e!33154))

(declare-fun b!51163 () Bool)

(declare-fun e!33149 () Bool)

(assert (=> b!51163 (= e!33155 e!33149)))

(declare-fun b!51164 () Bool)

(declare-fun e!33152 () Bool)

(assert (=> b!51164 (= e!33152 (and e!33151 mapRes!2277))))

(declare-fun condMapEmpty!2278 () Bool)

(declare-fun mapDefault!2277 () ValueCell!761)

(assert (=> b!51164 (= condMapEmpty!2278 (= (arr!1583 (_values!1912 (v!2185 (underlying!138 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2277)))))

(declare-fun b!51165 () Bool)

(assert (=> b!51165 (= e!33147 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2278 () Bool)

(declare-fun tp!6838 () Bool)

(assert (=> mapNonEmpty!2278 (= mapRes!2278 (and tp!6838 e!33144))))

(declare-fun mapValue!2277 () ValueCell!761)

(declare-fun mapKey!2277 () (_ BitVec 32))

(declare-fun mapRest!2278 () (Array (_ BitVec 32) ValueCell!761))

(assert (=> mapNonEmpty!2278 (= (arr!1583 (_values!1912 newMap!16)) (store mapRest!2278 mapKey!2277 mapValue!2277))))

(assert (=> b!51166 (= e!33149 (and tp!6835 tp_is_empty!2209 (array_inv!967 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) (array_inv!968 (_values!1912 (v!2185 (underlying!138 thiss!992)))) e!33152))))

(declare-fun b!51167 () Bool)

(declare-fun res!29320 () Bool)

(assert (=> b!51167 (=> (not res!29320) (not e!33150))))

(assert (=> b!51167 (= res!29320 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5732 newMap!16)) (_size!264 (v!2185 (underlying!138 thiss!992)))))))

(assert (= (and start!8130 res!29323) b!51159))

(assert (= (and b!51159 res!29321) b!51155))

(assert (= (and b!51155 res!29322) b!51167))

(assert (= (and b!51167 res!29320) b!51157))

(assert (= (and b!51157 res!29324) b!51158))

(assert (= (and b!51164 condMapEmpty!2278) mapIsEmpty!2277))

(assert (= (and b!51164 (not condMapEmpty!2278)) mapNonEmpty!2277))

(get-info :version)

(assert (= (and mapNonEmpty!2277 ((_ is ValueCellFull!761) mapValue!2278)) b!51165))

(assert (= (and b!51164 ((_ is ValueCellFull!761) mapDefault!2277)) b!51162))

(assert (= b!51166 b!51164))

(assert (= b!51163 b!51166))

(assert (= b!51161 b!51163))

(assert (= start!8130 b!51161))

(assert (= (and b!51153 condMapEmpty!2277) mapIsEmpty!2278))

(assert (= (and b!51153 (not condMapEmpty!2277)) mapNonEmpty!2278))

(assert (= (and mapNonEmpty!2278 ((_ is ValueCellFull!761) mapValue!2277)) b!51156))

(assert (= (and b!51153 ((_ is ValueCellFull!761) mapDefault!2278)) b!51160))

(assert (= b!51154 b!51153))

(assert (= start!8130 b!51154))

(declare-fun m!44087 () Bool)

(assert (=> mapNonEmpty!2278 m!44087))

(declare-fun m!44089 () Bool)

(assert (=> b!51154 m!44089))

(declare-fun m!44091 () Bool)

(assert (=> b!51154 m!44091))

(declare-fun m!44093 () Bool)

(assert (=> start!8130 m!44093))

(declare-fun m!44095 () Bool)

(assert (=> b!51155 m!44095))

(declare-fun m!44097 () Bool)

(assert (=> b!51157 m!44097))

(declare-fun m!44099 () Bool)

(assert (=> mapNonEmpty!2277 m!44099))

(declare-fun m!44101 () Bool)

(assert (=> b!51166 m!44101))

(declare-fun m!44103 () Bool)

(assert (=> b!51166 m!44103))

(check-sat (not b!51154) (not mapNonEmpty!2278) tp_is_empty!2209 b_and!2797 (not mapNonEmpty!2277) (not b!51157) b_and!2799 (not b_next!1587) (not b!51155) (not b_next!1585) (not b!51166) (not start!8130))
(check-sat b_and!2797 b_and!2799 (not b_next!1585) (not b_next!1587))
(get-model)

(declare-fun d!10281 () Bool)

(declare-fun res!29361 () Bool)

(declare-fun e!33237 () Bool)

(assert (=> d!10281 (=> (not res!29361) (not e!33237))))

(declare-fun simpleValid!37 (LongMapFixedSize!430) Bool)

(assert (=> d!10281 (= res!29361 (simpleValid!37 newMap!16))))

(assert (=> d!10281 (= (valid!157 newMap!16) e!33237)))

(declare-fun b!51264 () Bool)

(declare-fun res!29362 () Bool)

(assert (=> b!51264 (=> (not res!29362) (not e!33237))))

(declare-fun arrayCountValidKeys!0 (array!3315 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51264 (= res!29362 (= (arrayCountValidKeys!0 (_keys!3542 newMap!16) #b00000000000000000000000000000000 (size!1809 (_keys!3542 newMap!16))) (_size!264 newMap!16)))))

(declare-fun b!51265 () Bool)

(declare-fun res!29363 () Bool)

(assert (=> b!51265 (=> (not res!29363) (not e!33237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3315 (_ BitVec 32)) Bool)

(assert (=> b!51265 (= res!29363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3542 newMap!16) (mask!5732 newMap!16)))))

(declare-fun b!51266 () Bool)

(declare-datatypes ((List!1328 0))(
  ( (Nil!1325) (Cons!1324 (h!1904 (_ BitVec 64)) (t!4361 List!1328)) )
))
(declare-fun arrayNoDuplicates!0 (array!3315 (_ BitVec 32) List!1328) Bool)

(assert (=> b!51266 (= e!33237 (arrayNoDuplicates!0 (_keys!3542 newMap!16) #b00000000000000000000000000000000 Nil!1325))))

(assert (= (and d!10281 res!29361) b!51264))

(assert (= (and b!51264 res!29362) b!51265))

(assert (= (and b!51265 res!29363) b!51266))

(declare-fun m!44141 () Bool)

(assert (=> d!10281 m!44141))

(declare-fun m!44143 () Bool)

(assert (=> b!51264 m!44143))

(declare-fun m!44145 () Bool)

(assert (=> b!51265 m!44145))

(declare-fun m!44147 () Bool)

(assert (=> b!51266 m!44147))

(assert (=> b!51155 d!10281))

(declare-fun d!10283 () Bool)

(assert (=> d!10283 (= (validMask!0 (mask!5732 (v!2185 (underlying!138 thiss!992)))) (and (or (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000001111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000011111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000001111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000011111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000001111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000011111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000001111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000011111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000001111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000011111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000001111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000011111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000001111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000011111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000111111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000001111111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000011111111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000111111111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00001111111111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00011111111111111111111111111111) (= (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51157 d!10283))

(declare-fun d!10285 () Bool)

(assert (=> d!10285 (= (array_inv!967 (_keys!3542 newMap!16)) (bvsge (size!1809 (_keys!3542 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51154 d!10285))

(declare-fun d!10287 () Bool)

(assert (=> d!10287 (= (array_inv!968 (_values!1912 newMap!16)) (bvsge (size!1810 (_values!1912 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51154 d!10287))

(declare-fun d!10289 () Bool)

(assert (=> d!10289 (= (array_inv!967 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) (bvsge (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51166 d!10289))

(declare-fun d!10291 () Bool)

(assert (=> d!10291 (= (array_inv!968 (_values!1912 (v!2185 (underlying!138 thiss!992)))) (bvsge (size!1810 (_values!1912 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51166 d!10291))

(declare-fun d!10293 () Bool)

(assert (=> d!10293 (= (valid!158 thiss!992) (valid!157 (v!2185 (underlying!138 thiss!992))))))

(declare-fun bs!2375 () Bool)

(assert (= bs!2375 d!10293))

(declare-fun m!44149 () Bool)

(assert (=> bs!2375 m!44149))

(assert (=> start!8130 d!10293))

(declare-fun condMapEmpty!2293 () Bool)

(declare-fun mapDefault!2293 () ValueCell!761)

(assert (=> mapNonEmpty!2277 (= condMapEmpty!2293 (= mapRest!2277 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2293)))))

(declare-fun e!33242 () Bool)

(declare-fun mapRes!2293 () Bool)

(assert (=> mapNonEmpty!2277 (= tp!6836 (and e!33242 mapRes!2293))))

(declare-fun b!51274 () Bool)

(assert (=> b!51274 (= e!33242 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2293 () Bool)

(declare-fun tp!6865 () Bool)

(declare-fun e!33243 () Bool)

(assert (=> mapNonEmpty!2293 (= mapRes!2293 (and tp!6865 e!33243))))

(declare-fun mapValue!2293 () ValueCell!761)

(declare-fun mapRest!2293 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapKey!2293 () (_ BitVec 32))

(assert (=> mapNonEmpty!2293 (= mapRest!2277 (store mapRest!2293 mapKey!2293 mapValue!2293))))

(declare-fun b!51273 () Bool)

(assert (=> b!51273 (= e!33243 tp_is_empty!2209)))

(declare-fun mapIsEmpty!2293 () Bool)

(assert (=> mapIsEmpty!2293 mapRes!2293))

(assert (= (and mapNonEmpty!2277 condMapEmpty!2293) mapIsEmpty!2293))

(assert (= (and mapNonEmpty!2277 (not condMapEmpty!2293)) mapNonEmpty!2293))

(assert (= (and mapNonEmpty!2293 ((_ is ValueCellFull!761) mapValue!2293)) b!51273))

(assert (= (and mapNonEmpty!2277 ((_ is ValueCellFull!761) mapDefault!2293)) b!51274))

(declare-fun m!44151 () Bool)

(assert (=> mapNonEmpty!2293 m!44151))

(declare-fun condMapEmpty!2294 () Bool)

(declare-fun mapDefault!2294 () ValueCell!761)

(assert (=> mapNonEmpty!2278 (= condMapEmpty!2294 (= mapRest!2278 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2294)))))

(declare-fun e!33244 () Bool)

(declare-fun mapRes!2294 () Bool)

(assert (=> mapNonEmpty!2278 (= tp!6838 (and e!33244 mapRes!2294))))

(declare-fun b!51276 () Bool)

(assert (=> b!51276 (= e!33244 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2294 () Bool)

(declare-fun tp!6866 () Bool)

(declare-fun e!33245 () Bool)

(assert (=> mapNonEmpty!2294 (= mapRes!2294 (and tp!6866 e!33245))))

(declare-fun mapRest!2294 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapKey!2294 () (_ BitVec 32))

(declare-fun mapValue!2294 () ValueCell!761)

(assert (=> mapNonEmpty!2294 (= mapRest!2278 (store mapRest!2294 mapKey!2294 mapValue!2294))))

(declare-fun b!51275 () Bool)

(assert (=> b!51275 (= e!33245 tp_is_empty!2209)))

(declare-fun mapIsEmpty!2294 () Bool)

(assert (=> mapIsEmpty!2294 mapRes!2294))

(assert (= (and mapNonEmpty!2278 condMapEmpty!2294) mapIsEmpty!2294))

(assert (= (and mapNonEmpty!2278 (not condMapEmpty!2294)) mapNonEmpty!2294))

(assert (= (and mapNonEmpty!2294 ((_ is ValueCellFull!761) mapValue!2294)) b!51275))

(assert (= (and mapNonEmpty!2278 ((_ is ValueCellFull!761) mapDefault!2294)) b!51276))

(declare-fun m!44153 () Bool)

(assert (=> mapNonEmpty!2294 m!44153))

(check-sat tp_is_empty!2209 (not mapNonEmpty!2294) (not mapNonEmpty!2293) (not d!10293) b_and!2799 (not b_next!1587) (not b!51266) (not b_next!1585) (not b!51265) (not b!51264) b_and!2797 (not d!10281))
(check-sat b_and!2797 b_and!2799 (not b_next!1585) (not b_next!1587))
(get-model)

(declare-fun b!51285 () Bool)

(declare-fun e!33250 () (_ BitVec 32))

(declare-fun call!3933 () (_ BitVec 32))

(assert (=> b!51285 (= e!33250 call!3933)))

(declare-fun bm!3930 () Bool)

(assert (=> bm!3930 (= call!3933 (arrayCountValidKeys!0 (_keys!3542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))))))

(declare-fun d!10295 () Bool)

(declare-fun lt!21138 () (_ BitVec 32))

(assert (=> d!10295 (and (bvsge lt!21138 #b00000000000000000000000000000000) (bvsle lt!21138 (bvsub (size!1809 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33251 () (_ BitVec 32))

(assert (=> d!10295 (= lt!21138 e!33251)))

(declare-fun c!6857 () Bool)

(assert (=> d!10295 (= c!6857 (bvsge #b00000000000000000000000000000000 (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10295 (and (bvsle #b00000000000000000000000000000000 (size!1809 (_keys!3542 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1809 (_keys!3542 newMap!16)) (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10295 (= (arrayCountValidKeys!0 (_keys!3542 newMap!16) #b00000000000000000000000000000000 (size!1809 (_keys!3542 newMap!16))) lt!21138)))

(declare-fun b!51286 () Bool)

(assert (=> b!51286 (= e!33250 (bvadd #b00000000000000000000000000000001 call!3933))))

(declare-fun b!51287 () Bool)

(assert (=> b!51287 (= e!33251 e!33250)))

(declare-fun c!6858 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51287 (= c!6858 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51288 () Bool)

(assert (=> b!51288 (= e!33251 #b00000000000000000000000000000000)))

(assert (= (and d!10295 c!6857) b!51288))

(assert (= (and d!10295 (not c!6857)) b!51287))

(assert (= (and b!51287 c!6858) b!51286))

(assert (= (and b!51287 (not c!6858)) b!51285))

(assert (= (or b!51286 b!51285) bm!3930))

(declare-fun m!44155 () Bool)

(assert (=> bm!3930 m!44155))

(declare-fun m!44157 () Bool)

(assert (=> b!51287 m!44157))

(assert (=> b!51287 m!44157))

(declare-fun m!44159 () Bool)

(assert (=> b!51287 m!44159))

(assert (=> b!51264 d!10295))

(declare-fun d!10297 () Bool)

(declare-fun res!29364 () Bool)

(declare-fun e!33252 () Bool)

(assert (=> d!10297 (=> (not res!29364) (not e!33252))))

(assert (=> d!10297 (= res!29364 (simpleValid!37 (v!2185 (underlying!138 thiss!992))))))

(assert (=> d!10297 (= (valid!157 (v!2185 (underlying!138 thiss!992))) e!33252)))

(declare-fun b!51289 () Bool)

(declare-fun res!29365 () Bool)

(assert (=> b!51289 (=> (not res!29365) (not e!33252))))

(assert (=> b!51289 (= res!29365 (= (arrayCountValidKeys!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000 (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))) (_size!264 (v!2185 (underlying!138 thiss!992)))))))

(declare-fun b!51290 () Bool)

(declare-fun res!29366 () Bool)

(assert (=> b!51290 (=> (not res!29366) (not e!33252))))

(assert (=> b!51290 (= res!29366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3542 (v!2185 (underlying!138 thiss!992))) (mask!5732 (v!2185 (underlying!138 thiss!992)))))))

(declare-fun b!51291 () Bool)

(assert (=> b!51291 (= e!33252 (arrayNoDuplicates!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000 Nil!1325))))

(assert (= (and d!10297 res!29364) b!51289))

(assert (= (and b!51289 res!29365) b!51290))

(assert (= (and b!51290 res!29366) b!51291))

(declare-fun m!44161 () Bool)

(assert (=> d!10297 m!44161))

(declare-fun m!44163 () Bool)

(assert (=> b!51289 m!44163))

(declare-fun m!44165 () Bool)

(assert (=> b!51290 m!44165))

(declare-fun m!44167 () Bool)

(assert (=> b!51291 m!44167))

(assert (=> d!10293 d!10297))

(declare-fun b!51301 () Bool)

(declare-fun res!29375 () Bool)

(declare-fun e!33255 () Bool)

(assert (=> b!51301 (=> (not res!29375) (not e!33255))))

(declare-fun size!1815 (LongMapFixedSize!430) (_ BitVec 32))

(assert (=> b!51301 (= res!29375 (bvsge (size!1815 newMap!16) (_size!264 newMap!16)))))

(declare-fun d!10299 () Bool)

(declare-fun res!29376 () Bool)

(assert (=> d!10299 (=> (not res!29376) (not e!33255))))

(assert (=> d!10299 (= res!29376 (validMask!0 (mask!5732 newMap!16)))))

(assert (=> d!10299 (= (simpleValid!37 newMap!16) e!33255)))

(declare-fun b!51300 () Bool)

(declare-fun res!29377 () Bool)

(assert (=> b!51300 (=> (not res!29377) (not e!33255))))

(assert (=> b!51300 (= res!29377 (and (= (size!1810 (_values!1912 newMap!16)) (bvadd (mask!5732 newMap!16) #b00000000000000000000000000000001)) (= (size!1809 (_keys!3542 newMap!16)) (size!1810 (_values!1912 newMap!16))) (bvsge (_size!264 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!264 newMap!16) (bvadd (mask!5732 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!51302 () Bool)

(declare-fun res!29378 () Bool)

(assert (=> b!51302 (=> (not res!29378) (not e!33255))))

(assert (=> b!51302 (= res!29378 (= (size!1815 newMap!16) (bvadd (_size!264 newMap!16) (bvsdiv (bvadd (extraKeys!1820 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51303 () Bool)

(assert (=> b!51303 (= e!33255 (and (bvsge (extraKeys!1820 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1820 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!264 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!10299 res!29376) b!51300))

(assert (= (and b!51300 res!29377) b!51301))

(assert (= (and b!51301 res!29375) b!51302))

(assert (= (and b!51302 res!29378) b!51303))

(declare-fun m!44169 () Bool)

(assert (=> b!51301 m!44169))

(declare-fun m!44171 () Bool)

(assert (=> d!10299 m!44171))

(assert (=> b!51302 m!44169))

(assert (=> d!10281 d!10299))

(declare-fun b!51312 () Bool)

(declare-fun e!33264 () Bool)

(declare-fun e!33262 () Bool)

(assert (=> b!51312 (= e!33264 e!33262)))

(declare-fun c!6861 () Bool)

(assert (=> b!51312 (= c!6861 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3933 () Bool)

(declare-fun call!3936 () Bool)

(assert (=> bm!3933 (= call!3936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3542 newMap!16) (mask!5732 newMap!16)))))

(declare-fun b!51314 () Bool)

(declare-fun e!33263 () Bool)

(assert (=> b!51314 (= e!33263 call!3936)))

(declare-fun b!51315 () Bool)

(assert (=> b!51315 (= e!33262 e!33263)))

(declare-fun lt!21147 () (_ BitVec 64))

(assert (=> b!51315 (= lt!21147 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1430 0))(
  ( (Unit!1431) )
))
(declare-fun lt!21145 () Unit!1430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3315 (_ BitVec 64) (_ BitVec 32)) Unit!1430)

(assert (=> b!51315 (= lt!21145 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3542 newMap!16) lt!21147 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51315 (arrayContainsKey!0 (_keys!3542 newMap!16) lt!21147 #b00000000000000000000000000000000)))

(declare-fun lt!21146 () Unit!1430)

(assert (=> b!51315 (= lt!21146 lt!21145)))

(declare-fun res!29383 () Bool)

(declare-datatypes ((SeekEntryResult!225 0))(
  ( (MissingZero!225 (index!3022 (_ BitVec 32))) (Found!225 (index!3023 (_ BitVec 32))) (Intermediate!225 (undefined!1037 Bool) (index!3024 (_ BitVec 32)) (x!9356 (_ BitVec 32))) (Undefined!225) (MissingVacant!225 (index!3025 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3315 (_ BitVec 32)) SeekEntryResult!225)

(assert (=> b!51315 (= res!29383 (= (seekEntryOrOpen!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) (_keys!3542 newMap!16) (mask!5732 newMap!16)) (Found!225 #b00000000000000000000000000000000)))))

(assert (=> b!51315 (=> (not res!29383) (not e!33263))))

(declare-fun d!10301 () Bool)

(declare-fun res!29384 () Bool)

(assert (=> d!10301 (=> res!29384 e!33264)))

(assert (=> d!10301 (= res!29384 (bvsge #b00000000000000000000000000000000 (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3542 newMap!16) (mask!5732 newMap!16)) e!33264)))

(declare-fun b!51313 () Bool)

(assert (=> b!51313 (= e!33262 call!3936)))

(assert (= (and d!10301 (not res!29384)) b!51312))

(assert (= (and b!51312 c!6861) b!51315))

(assert (= (and b!51312 (not c!6861)) b!51313))

(assert (= (and b!51315 res!29383) b!51314))

(assert (= (or b!51314 b!51313) bm!3933))

(assert (=> b!51312 m!44157))

(assert (=> b!51312 m!44157))

(assert (=> b!51312 m!44159))

(declare-fun m!44173 () Bool)

(assert (=> bm!3933 m!44173))

(assert (=> b!51315 m!44157))

(declare-fun m!44175 () Bool)

(assert (=> b!51315 m!44175))

(declare-fun m!44177 () Bool)

(assert (=> b!51315 m!44177))

(assert (=> b!51315 m!44157))

(declare-fun m!44179 () Bool)

(assert (=> b!51315 m!44179))

(assert (=> b!51265 d!10301))

(declare-fun b!51327 () Bool)

(declare-fun e!33275 () Bool)

(declare-fun contains!618 (List!1328 (_ BitVec 64)) Bool)

(assert (=> b!51327 (= e!33275 (contains!618 Nil!1325 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51328 () Bool)

(declare-fun e!33274 () Bool)

(declare-fun call!3939 () Bool)

(assert (=> b!51328 (= e!33274 call!3939)))

(declare-fun bm!3936 () Bool)

(declare-fun c!6864 () Bool)

(assert (=> bm!3936 (= call!3939 (arrayNoDuplicates!0 (_keys!3542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6864 (Cons!1324 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325)))))

(declare-fun b!51329 () Bool)

(assert (=> b!51329 (= e!33274 call!3939)))

(declare-fun b!51330 () Bool)

(declare-fun e!33276 () Bool)

(assert (=> b!51330 (= e!33276 e!33274)))

(assert (=> b!51330 (= c!6864 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10303 () Bool)

(declare-fun res!29393 () Bool)

(declare-fun e!33273 () Bool)

(assert (=> d!10303 (=> res!29393 e!33273)))

(assert (=> d!10303 (= res!29393 (bvsge #b00000000000000000000000000000000 (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10303 (= (arrayNoDuplicates!0 (_keys!3542 newMap!16) #b00000000000000000000000000000000 Nil!1325) e!33273)))

(declare-fun b!51326 () Bool)

(assert (=> b!51326 (= e!33273 e!33276)))

(declare-fun res!29391 () Bool)

(assert (=> b!51326 (=> (not res!29391) (not e!33276))))

(assert (=> b!51326 (= res!29391 (not e!33275))))

(declare-fun res!29392 () Bool)

(assert (=> b!51326 (=> (not res!29392) (not e!33275))))

(assert (=> b!51326 (= res!29392 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10303 (not res!29393)) b!51326))

(assert (= (and b!51326 res!29392) b!51327))

(assert (= (and b!51326 res!29391) b!51330))

(assert (= (and b!51330 c!6864) b!51329))

(assert (= (and b!51330 (not c!6864)) b!51328))

(assert (= (or b!51329 b!51328) bm!3936))

(assert (=> b!51327 m!44157))

(assert (=> b!51327 m!44157))

(declare-fun m!44181 () Bool)

(assert (=> b!51327 m!44181))

(assert (=> bm!3936 m!44157))

(declare-fun m!44183 () Bool)

(assert (=> bm!3936 m!44183))

(assert (=> b!51330 m!44157))

(assert (=> b!51330 m!44157))

(assert (=> b!51330 m!44159))

(assert (=> b!51326 m!44157))

(assert (=> b!51326 m!44157))

(assert (=> b!51326 m!44159))

(assert (=> b!51266 d!10303))

(declare-fun condMapEmpty!2295 () Bool)

(declare-fun mapDefault!2295 () ValueCell!761)

(assert (=> mapNonEmpty!2293 (= condMapEmpty!2295 (= mapRest!2293 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2295)))))

(declare-fun e!33277 () Bool)

(declare-fun mapRes!2295 () Bool)

(assert (=> mapNonEmpty!2293 (= tp!6865 (and e!33277 mapRes!2295))))

(declare-fun b!51332 () Bool)

(assert (=> b!51332 (= e!33277 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2295 () Bool)

(declare-fun tp!6867 () Bool)

(declare-fun e!33278 () Bool)

(assert (=> mapNonEmpty!2295 (= mapRes!2295 (and tp!6867 e!33278))))

(declare-fun mapKey!2295 () (_ BitVec 32))

(declare-fun mapValue!2295 () ValueCell!761)

(declare-fun mapRest!2295 () (Array (_ BitVec 32) ValueCell!761))

(assert (=> mapNonEmpty!2295 (= mapRest!2293 (store mapRest!2295 mapKey!2295 mapValue!2295))))

(declare-fun b!51331 () Bool)

(assert (=> b!51331 (= e!33278 tp_is_empty!2209)))

(declare-fun mapIsEmpty!2295 () Bool)

(assert (=> mapIsEmpty!2295 mapRes!2295))

(assert (= (and mapNonEmpty!2293 condMapEmpty!2295) mapIsEmpty!2295))

(assert (= (and mapNonEmpty!2293 (not condMapEmpty!2295)) mapNonEmpty!2295))

(assert (= (and mapNonEmpty!2295 ((_ is ValueCellFull!761) mapValue!2295)) b!51331))

(assert (= (and mapNonEmpty!2293 ((_ is ValueCellFull!761) mapDefault!2295)) b!51332))

(declare-fun m!44185 () Bool)

(assert (=> mapNonEmpty!2295 m!44185))

(declare-fun condMapEmpty!2296 () Bool)

(declare-fun mapDefault!2296 () ValueCell!761)

(assert (=> mapNonEmpty!2294 (= condMapEmpty!2296 (= mapRest!2294 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2296)))))

(declare-fun e!33279 () Bool)

(declare-fun mapRes!2296 () Bool)

(assert (=> mapNonEmpty!2294 (= tp!6866 (and e!33279 mapRes!2296))))

(declare-fun b!51334 () Bool)

(assert (=> b!51334 (= e!33279 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2296 () Bool)

(declare-fun tp!6868 () Bool)

(declare-fun e!33280 () Bool)

(assert (=> mapNonEmpty!2296 (= mapRes!2296 (and tp!6868 e!33280))))

(declare-fun mapKey!2296 () (_ BitVec 32))

(declare-fun mapRest!2296 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapValue!2296 () ValueCell!761)

(assert (=> mapNonEmpty!2296 (= mapRest!2294 (store mapRest!2296 mapKey!2296 mapValue!2296))))

(declare-fun b!51333 () Bool)

(assert (=> b!51333 (= e!33280 tp_is_empty!2209)))

(declare-fun mapIsEmpty!2296 () Bool)

(assert (=> mapIsEmpty!2296 mapRes!2296))

(assert (= (and mapNonEmpty!2294 condMapEmpty!2296) mapIsEmpty!2296))

(assert (= (and mapNonEmpty!2294 (not condMapEmpty!2296)) mapNonEmpty!2296))

(assert (= (and mapNonEmpty!2296 ((_ is ValueCellFull!761) mapValue!2296)) b!51333))

(assert (= (and mapNonEmpty!2294 ((_ is ValueCellFull!761) mapDefault!2296)) b!51334))

(declare-fun m!44187 () Bool)

(assert (=> mapNonEmpty!2296 m!44187))

(check-sat (not d!10297) (not bm!3933) tp_is_empty!2209 (not b!51315) (not bm!3930) (not b_next!1587) (not b!51289) (not bm!3936) (not mapNonEmpty!2295) (not mapNonEmpty!2296) (not b_next!1585) (not b!51287) (not b!51302) (not b!51290) (not b!51326) (not b!51291) (not d!10299) (not b!51301) b_and!2797 (not b!51327) b_and!2799 (not b!51312) (not b!51330))
(check-sat b_and!2797 b_and!2799 (not b_next!1585) (not b_next!1587))
(get-model)

(declare-fun d!10305 () Bool)

(assert (=> d!10305 (= (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51287 d!10305))

(declare-fun d!10307 () Bool)

(assert (=> d!10307 (= (size!1815 newMap!16) (bvadd (_size!264 newMap!16) (bvsdiv (bvadd (extraKeys!1820 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!51301 d!10307))

(declare-fun b!51336 () Bool)

(declare-fun res!29394 () Bool)

(declare-fun e!33281 () Bool)

(assert (=> b!51336 (=> (not res!29394) (not e!33281))))

(assert (=> b!51336 (= res!29394 (bvsge (size!1815 (v!2185 (underlying!138 thiss!992))) (_size!264 (v!2185 (underlying!138 thiss!992)))))))

(declare-fun d!10309 () Bool)

(declare-fun res!29395 () Bool)

(assert (=> d!10309 (=> (not res!29395) (not e!33281))))

(assert (=> d!10309 (= res!29395 (validMask!0 (mask!5732 (v!2185 (underlying!138 thiss!992)))))))

(assert (=> d!10309 (= (simpleValid!37 (v!2185 (underlying!138 thiss!992))) e!33281)))

(declare-fun b!51335 () Bool)

(declare-fun res!29396 () Bool)

(assert (=> b!51335 (=> (not res!29396) (not e!33281))))

(assert (=> b!51335 (= res!29396 (and (= (size!1810 (_values!1912 (v!2185 (underlying!138 thiss!992)))) (bvadd (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000001)) (= (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) (size!1810 (_values!1912 (v!2185 (underlying!138 thiss!992))))) (bvsge (_size!264 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!264 (v!2185 (underlying!138 thiss!992))) (bvadd (mask!5732 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!51337 () Bool)

(declare-fun res!29397 () Bool)

(assert (=> b!51337 (=> (not res!29397) (not e!33281))))

(assert (=> b!51337 (= res!29397 (= (size!1815 (v!2185 (underlying!138 thiss!992))) (bvadd (_size!264 (v!2185 (underlying!138 thiss!992))) (bvsdiv (bvadd (extraKeys!1820 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51338 () Bool)

(assert (=> b!51338 (= e!33281 (and (bvsge (extraKeys!1820 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1820 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!264 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!10309 res!29395) b!51335))

(assert (= (and b!51335 res!29396) b!51336))

(assert (= (and b!51336 res!29394) b!51337))

(assert (= (and b!51337 res!29397) b!51338))

(declare-fun m!44189 () Bool)

(assert (=> b!51336 m!44189))

(assert (=> d!10309 m!44097))

(assert (=> b!51337 m!44189))

(assert (=> d!10297 d!10309))

(declare-fun b!51340 () Bool)

(declare-fun e!33284 () Bool)

(assert (=> b!51340 (= e!33284 (contains!618 (ite c!6864 (Cons!1324 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325) (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51341 () Bool)

(declare-fun e!33283 () Bool)

(declare-fun call!3940 () Bool)

(assert (=> b!51341 (= e!33283 call!3940)))

(declare-fun c!6865 () Bool)

(declare-fun bm!3937 () Bool)

(assert (=> bm!3937 (= call!3940 (arrayNoDuplicates!0 (_keys!3542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6865 (Cons!1324 (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6864 (Cons!1324 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325)) (ite c!6864 (Cons!1324 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325))))))

(declare-fun b!51342 () Bool)

(assert (=> b!51342 (= e!33283 call!3940)))

(declare-fun b!51343 () Bool)

(declare-fun e!33285 () Bool)

(assert (=> b!51343 (= e!33285 e!33283)))

(assert (=> b!51343 (= c!6865 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10311 () Bool)

(declare-fun res!29400 () Bool)

(declare-fun e!33282 () Bool)

(assert (=> d!10311 (=> res!29400 e!33282)))

(assert (=> d!10311 (= res!29400 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10311 (= (arrayNoDuplicates!0 (_keys!3542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6864 (Cons!1324 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325)) e!33282)))

(declare-fun b!51339 () Bool)

(assert (=> b!51339 (= e!33282 e!33285)))

(declare-fun res!29398 () Bool)

(assert (=> b!51339 (=> (not res!29398) (not e!33285))))

(assert (=> b!51339 (= res!29398 (not e!33284))))

(declare-fun res!29399 () Bool)

(assert (=> b!51339 (=> (not res!29399) (not e!33284))))

(assert (=> b!51339 (= res!29399 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10311 (not res!29400)) b!51339))

(assert (= (and b!51339 res!29399) b!51340))

(assert (= (and b!51339 res!29398) b!51343))

(assert (= (and b!51343 c!6865) b!51342))

(assert (= (and b!51343 (not c!6865)) b!51341))

(assert (= (or b!51342 b!51341) bm!3937))

(declare-fun m!44191 () Bool)

(assert (=> b!51340 m!44191))

(assert (=> b!51340 m!44191))

(declare-fun m!44193 () Bool)

(assert (=> b!51340 m!44193))

(assert (=> bm!3937 m!44191))

(declare-fun m!44195 () Bool)

(assert (=> bm!3937 m!44195))

(assert (=> b!51343 m!44191))

(assert (=> b!51343 m!44191))

(declare-fun m!44197 () Bool)

(assert (=> b!51343 m!44197))

(assert (=> b!51339 m!44191))

(assert (=> b!51339 m!44191))

(assert (=> b!51339 m!44197))

(assert (=> bm!3936 d!10311))

(declare-fun d!10313 () Bool)

(declare-fun lt!21150 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!59 (List!1328) (InoxSet (_ BitVec 64)))

(assert (=> d!10313 (= lt!21150 (select (content!59 Nil!1325) (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33290 () Bool)

(assert (=> d!10313 (= lt!21150 e!33290)))

(declare-fun res!29405 () Bool)

(assert (=> d!10313 (=> (not res!29405) (not e!33290))))

(assert (=> d!10313 (= res!29405 ((_ is Cons!1324) Nil!1325))))

(assert (=> d!10313 (= (contains!618 Nil!1325 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)) lt!21150)))

(declare-fun b!51348 () Bool)

(declare-fun e!33291 () Bool)

(assert (=> b!51348 (= e!33290 e!33291)))

(declare-fun res!29406 () Bool)

(assert (=> b!51348 (=> res!29406 e!33291)))

(assert (=> b!51348 (= res!29406 (= (h!1904 Nil!1325) (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51349 () Bool)

(assert (=> b!51349 (= e!33291 (contains!618 (t!4361 Nil!1325) (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10313 res!29405) b!51348))

(assert (= (and b!51348 (not res!29406)) b!51349))

(declare-fun m!44199 () Bool)

(assert (=> d!10313 m!44199))

(assert (=> d!10313 m!44157))

(declare-fun m!44201 () Bool)

(assert (=> d!10313 m!44201))

(assert (=> b!51349 m!44157))

(declare-fun m!44203 () Bool)

(assert (=> b!51349 m!44203))

(assert (=> b!51327 d!10313))

(declare-fun b!51350 () Bool)

(declare-fun e!33292 () (_ BitVec 32))

(declare-fun call!3941 () (_ BitVec 32))

(assert (=> b!51350 (= e!33292 call!3941)))

(declare-fun bm!3938 () Bool)

(assert (=> bm!3938 (= call!3941 (arrayCountValidKeys!0 (_keys!3542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))))))

(declare-fun d!10315 () Bool)

(declare-fun lt!21151 () (_ BitVec 32))

(assert (=> d!10315 (and (bvsge lt!21151 #b00000000000000000000000000000000) (bvsle lt!21151 (bvsub (size!1809 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!33293 () (_ BitVec 32))

(assert (=> d!10315 (= lt!21151 e!33293)))

(declare-fun c!6866 () Bool)

(assert (=> d!10315 (= c!6866 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10315 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1809 (_keys!3542 newMap!16)) (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10315 (= (arrayCountValidKeys!0 (_keys!3542 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))) lt!21151)))

(declare-fun b!51351 () Bool)

(assert (=> b!51351 (= e!33292 (bvadd #b00000000000000000000000000000001 call!3941))))

(declare-fun b!51352 () Bool)

(assert (=> b!51352 (= e!33293 e!33292)))

(declare-fun c!6867 () Bool)

(assert (=> b!51352 (= c!6867 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51353 () Bool)

(assert (=> b!51353 (= e!33293 #b00000000000000000000000000000000)))

(assert (= (and d!10315 c!6866) b!51353))

(assert (= (and d!10315 (not c!6866)) b!51352))

(assert (= (and b!51352 c!6867) b!51351))

(assert (= (and b!51352 (not c!6867)) b!51350))

(assert (= (or b!51351 b!51350) bm!3938))

(declare-fun m!44205 () Bool)

(assert (=> bm!3938 m!44205))

(assert (=> b!51352 m!44191))

(assert (=> b!51352 m!44191))

(assert (=> b!51352 m!44197))

(assert (=> bm!3930 d!10315))

(assert (=> b!51326 d!10305))

(declare-fun d!10317 () Bool)

(assert (=> d!10317 (arrayContainsKey!0 (_keys!3542 newMap!16) lt!21147 #b00000000000000000000000000000000)))

(declare-fun lt!21154 () Unit!1430)

(declare-fun choose!13 (array!3315 (_ BitVec 64) (_ BitVec 32)) Unit!1430)

(assert (=> d!10317 (= lt!21154 (choose!13 (_keys!3542 newMap!16) lt!21147 #b00000000000000000000000000000000))))

(assert (=> d!10317 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10317 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3542 newMap!16) lt!21147 #b00000000000000000000000000000000) lt!21154)))

(declare-fun bs!2376 () Bool)

(assert (= bs!2376 d!10317))

(assert (=> bs!2376 m!44177))

(declare-fun m!44207 () Bool)

(assert (=> bs!2376 m!44207))

(assert (=> b!51315 d!10317))

(declare-fun d!10319 () Bool)

(declare-fun res!29411 () Bool)

(declare-fun e!33298 () Bool)

(assert (=> d!10319 (=> res!29411 e!33298)))

(assert (=> d!10319 (= res!29411 (= (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) lt!21147))))

(assert (=> d!10319 (= (arrayContainsKey!0 (_keys!3542 newMap!16) lt!21147 #b00000000000000000000000000000000) e!33298)))

(declare-fun b!51358 () Bool)

(declare-fun e!33299 () Bool)

(assert (=> b!51358 (= e!33298 e!33299)))

(declare-fun res!29412 () Bool)

(assert (=> b!51358 (=> (not res!29412) (not e!33299))))

(assert (=> b!51358 (= res!29412 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))))))

(declare-fun b!51359 () Bool)

(assert (=> b!51359 (= e!33299 (arrayContainsKey!0 (_keys!3542 newMap!16) lt!21147 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10319 (not res!29411)) b!51358))

(assert (= (and b!51358 res!29412) b!51359))

(assert (=> d!10319 m!44157))

(declare-fun m!44209 () Bool)

(assert (=> b!51359 m!44209))

(assert (=> b!51315 d!10319))

(declare-fun b!51372 () Bool)

(declare-fun e!33307 () SeekEntryResult!225)

(declare-fun e!33308 () SeekEntryResult!225)

(assert (=> b!51372 (= e!33307 e!33308)))

(declare-fun lt!21162 () (_ BitVec 64))

(declare-fun lt!21161 () SeekEntryResult!225)

(assert (=> b!51372 (= lt!21162 (select (arr!1582 (_keys!3542 newMap!16)) (index!3024 lt!21161)))))

(declare-fun c!6874 () Bool)

(assert (=> b!51372 (= c!6874 (= lt!21162 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51373 () Bool)

(assert (=> b!51373 (= e!33307 Undefined!225)))

(declare-fun b!51374 () Bool)

(declare-fun c!6875 () Bool)

(assert (=> b!51374 (= c!6875 (= lt!21162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33306 () SeekEntryResult!225)

(assert (=> b!51374 (= e!33308 e!33306)))

(declare-fun d!10321 () Bool)

(declare-fun lt!21163 () SeekEntryResult!225)

(assert (=> d!10321 (and (or ((_ is Undefined!225) lt!21163) (not ((_ is Found!225) lt!21163)) (and (bvsge (index!3023 lt!21163) #b00000000000000000000000000000000) (bvslt (index!3023 lt!21163) (size!1809 (_keys!3542 newMap!16))))) (or ((_ is Undefined!225) lt!21163) ((_ is Found!225) lt!21163) (not ((_ is MissingZero!225) lt!21163)) (and (bvsge (index!3022 lt!21163) #b00000000000000000000000000000000) (bvslt (index!3022 lt!21163) (size!1809 (_keys!3542 newMap!16))))) (or ((_ is Undefined!225) lt!21163) ((_ is Found!225) lt!21163) ((_ is MissingZero!225) lt!21163) (not ((_ is MissingVacant!225) lt!21163)) (and (bvsge (index!3025 lt!21163) #b00000000000000000000000000000000) (bvslt (index!3025 lt!21163) (size!1809 (_keys!3542 newMap!16))))) (or ((_ is Undefined!225) lt!21163) (ite ((_ is Found!225) lt!21163) (= (select (arr!1582 (_keys!3542 newMap!16)) (index!3023 lt!21163)) (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!225) lt!21163) (= (select (arr!1582 (_keys!3542 newMap!16)) (index!3022 lt!21163)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!225) lt!21163) (= (select (arr!1582 (_keys!3542 newMap!16)) (index!3025 lt!21163)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10321 (= lt!21163 e!33307)))

(declare-fun c!6876 () Bool)

(assert (=> d!10321 (= c!6876 (and ((_ is Intermediate!225) lt!21161) (undefined!1037 lt!21161)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3315 (_ BitVec 32)) SeekEntryResult!225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10321 (= lt!21161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) (mask!5732 newMap!16)) (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) (_keys!3542 newMap!16) (mask!5732 newMap!16)))))

(assert (=> d!10321 (validMask!0 (mask!5732 newMap!16))))

(assert (=> d!10321 (= (seekEntryOrOpen!0 (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) (_keys!3542 newMap!16) (mask!5732 newMap!16)) lt!21163)))

(declare-fun b!51375 () Bool)

(assert (=> b!51375 (= e!33306 (MissingZero!225 (index!3024 lt!21161)))))

(declare-fun b!51376 () Bool)

(assert (=> b!51376 (= e!33308 (Found!225 (index!3024 lt!21161)))))

(declare-fun b!51377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3315 (_ BitVec 32)) SeekEntryResult!225)

(assert (=> b!51377 (= e!33306 (seekKeyOrZeroReturnVacant!0 (x!9356 lt!21161) (index!3024 lt!21161) (index!3024 lt!21161) (select (arr!1582 (_keys!3542 newMap!16)) #b00000000000000000000000000000000) (_keys!3542 newMap!16) (mask!5732 newMap!16)))))

(assert (= (and d!10321 c!6876) b!51373))

(assert (= (and d!10321 (not c!6876)) b!51372))

(assert (= (and b!51372 c!6874) b!51376))

(assert (= (and b!51372 (not c!6874)) b!51374))

(assert (= (and b!51374 c!6875) b!51375))

(assert (= (and b!51374 (not c!6875)) b!51377))

(declare-fun m!44211 () Bool)

(assert (=> b!51372 m!44211))

(assert (=> d!10321 m!44171))

(declare-fun m!44213 () Bool)

(assert (=> d!10321 m!44213))

(assert (=> d!10321 m!44157))

(declare-fun m!44215 () Bool)

(assert (=> d!10321 m!44215))

(assert (=> d!10321 m!44157))

(assert (=> d!10321 m!44213))

(declare-fun m!44217 () Bool)

(assert (=> d!10321 m!44217))

(declare-fun m!44219 () Bool)

(assert (=> d!10321 m!44219))

(declare-fun m!44221 () Bool)

(assert (=> d!10321 m!44221))

(assert (=> b!51377 m!44157))

(declare-fun m!44223 () Bool)

(assert (=> b!51377 m!44223))

(assert (=> b!51315 d!10321))

(declare-fun b!51379 () Bool)

(declare-fun e!33311 () Bool)

(assert (=> b!51379 (= e!33311 (contains!618 Nil!1325 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51380 () Bool)

(declare-fun e!33310 () Bool)

(declare-fun call!3942 () Bool)

(assert (=> b!51380 (= e!33310 call!3942)))

(declare-fun bm!3939 () Bool)

(declare-fun c!6877 () Bool)

(assert (=> bm!3939 (= call!3942 (arrayNoDuplicates!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6877 (Cons!1324 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000) Nil!1325) Nil!1325)))))

(declare-fun b!51381 () Bool)

(assert (=> b!51381 (= e!33310 call!3942)))

(declare-fun b!51382 () Bool)

(declare-fun e!33312 () Bool)

(assert (=> b!51382 (= e!33312 e!33310)))

(assert (=> b!51382 (= c!6877 (validKeyInArray!0 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10323 () Bool)

(declare-fun res!29415 () Bool)

(declare-fun e!33309 () Bool)

(assert (=> d!10323 (=> res!29415 e!33309)))

(assert (=> d!10323 (= res!29415 (bvsge #b00000000000000000000000000000000 (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))))))

(assert (=> d!10323 (= (arrayNoDuplicates!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000 Nil!1325) e!33309)))

(declare-fun b!51378 () Bool)

(assert (=> b!51378 (= e!33309 e!33312)))

(declare-fun res!29413 () Bool)

(assert (=> b!51378 (=> (not res!29413) (not e!33312))))

(assert (=> b!51378 (= res!29413 (not e!33311))))

(declare-fun res!29414 () Bool)

(assert (=> b!51378 (=> (not res!29414) (not e!33311))))

(assert (=> b!51378 (= res!29414 (validKeyInArray!0 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10323 (not res!29415)) b!51378))

(assert (= (and b!51378 res!29414) b!51379))

(assert (= (and b!51378 res!29413) b!51382))

(assert (= (and b!51382 c!6877) b!51381))

(assert (= (and b!51382 (not c!6877)) b!51380))

(assert (= (or b!51381 b!51380) bm!3939))

(declare-fun m!44225 () Bool)

(assert (=> b!51379 m!44225))

(assert (=> b!51379 m!44225))

(declare-fun m!44227 () Bool)

(assert (=> b!51379 m!44227))

(assert (=> bm!3939 m!44225))

(declare-fun m!44229 () Bool)

(assert (=> bm!3939 m!44229))

(assert (=> b!51382 m!44225))

(assert (=> b!51382 m!44225))

(declare-fun m!44231 () Bool)

(assert (=> b!51382 m!44231))

(assert (=> b!51378 m!44225))

(assert (=> b!51378 m!44225))

(assert (=> b!51378 m!44231))

(assert (=> b!51291 d!10323))

(declare-fun b!51383 () Bool)

(declare-fun e!33315 () Bool)

(declare-fun e!33313 () Bool)

(assert (=> b!51383 (= e!33315 e!33313)))

(declare-fun c!6878 () Bool)

(assert (=> b!51383 (= c!6878 (validKeyInArray!0 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3940 () Bool)

(declare-fun call!3943 () Bool)

(assert (=> bm!3940 (= call!3943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3542 (v!2185 (underlying!138 thiss!992))) (mask!5732 (v!2185 (underlying!138 thiss!992)))))))

(declare-fun b!51385 () Bool)

(declare-fun e!33314 () Bool)

(assert (=> b!51385 (= e!33314 call!3943)))

(declare-fun b!51386 () Bool)

(assert (=> b!51386 (= e!33313 e!33314)))

(declare-fun lt!21166 () (_ BitVec 64))

(assert (=> b!51386 (= lt!21166 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21164 () Unit!1430)

(assert (=> b!51386 (= lt!21164 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) lt!21166 #b00000000000000000000000000000000))))

(assert (=> b!51386 (arrayContainsKey!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) lt!21166 #b00000000000000000000000000000000)))

(declare-fun lt!21165 () Unit!1430)

(assert (=> b!51386 (= lt!21165 lt!21164)))

(declare-fun res!29416 () Bool)

(assert (=> b!51386 (= res!29416 (= (seekEntryOrOpen!0 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000) (_keys!3542 (v!2185 (underlying!138 thiss!992))) (mask!5732 (v!2185 (underlying!138 thiss!992)))) (Found!225 #b00000000000000000000000000000000)))))

(assert (=> b!51386 (=> (not res!29416) (not e!33314))))

(declare-fun d!10325 () Bool)

(declare-fun res!29417 () Bool)

(assert (=> d!10325 (=> res!29417 e!33315)))

(assert (=> d!10325 (= res!29417 (bvsge #b00000000000000000000000000000000 (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))))))

(assert (=> d!10325 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3542 (v!2185 (underlying!138 thiss!992))) (mask!5732 (v!2185 (underlying!138 thiss!992)))) e!33315)))

(declare-fun b!51384 () Bool)

(assert (=> b!51384 (= e!33313 call!3943)))

(assert (= (and d!10325 (not res!29417)) b!51383))

(assert (= (and b!51383 c!6878) b!51386))

(assert (= (and b!51383 (not c!6878)) b!51384))

(assert (= (and b!51386 res!29416) b!51385))

(assert (= (or b!51385 b!51384) bm!3940))

(assert (=> b!51383 m!44225))

(assert (=> b!51383 m!44225))

(assert (=> b!51383 m!44231))

(declare-fun m!44233 () Bool)

(assert (=> bm!3940 m!44233))

(assert (=> b!51386 m!44225))

(declare-fun m!44235 () Bool)

(assert (=> b!51386 m!44235))

(declare-fun m!44237 () Bool)

(assert (=> b!51386 m!44237))

(assert (=> b!51386 m!44225))

(declare-fun m!44239 () Bool)

(assert (=> b!51386 m!44239))

(assert (=> b!51290 d!10325))

(declare-fun d!10327 () Bool)

(assert (=> d!10327 (= (validMask!0 (mask!5732 newMap!16)) (and (or (= (mask!5732 newMap!16) #b00000000000000000000000000000111) (= (mask!5732 newMap!16) #b00000000000000000000000000001111) (= (mask!5732 newMap!16) #b00000000000000000000000000011111) (= (mask!5732 newMap!16) #b00000000000000000000000000111111) (= (mask!5732 newMap!16) #b00000000000000000000000001111111) (= (mask!5732 newMap!16) #b00000000000000000000000011111111) (= (mask!5732 newMap!16) #b00000000000000000000000111111111) (= (mask!5732 newMap!16) #b00000000000000000000001111111111) (= (mask!5732 newMap!16) #b00000000000000000000011111111111) (= (mask!5732 newMap!16) #b00000000000000000000111111111111) (= (mask!5732 newMap!16) #b00000000000000000001111111111111) (= (mask!5732 newMap!16) #b00000000000000000011111111111111) (= (mask!5732 newMap!16) #b00000000000000000111111111111111) (= (mask!5732 newMap!16) #b00000000000000001111111111111111) (= (mask!5732 newMap!16) #b00000000000000011111111111111111) (= (mask!5732 newMap!16) #b00000000000000111111111111111111) (= (mask!5732 newMap!16) #b00000000000001111111111111111111) (= (mask!5732 newMap!16) #b00000000000011111111111111111111) (= (mask!5732 newMap!16) #b00000000000111111111111111111111) (= (mask!5732 newMap!16) #b00000000001111111111111111111111) (= (mask!5732 newMap!16) #b00000000011111111111111111111111) (= (mask!5732 newMap!16) #b00000000111111111111111111111111) (= (mask!5732 newMap!16) #b00000001111111111111111111111111) (= (mask!5732 newMap!16) #b00000011111111111111111111111111) (= (mask!5732 newMap!16) #b00000111111111111111111111111111) (= (mask!5732 newMap!16) #b00001111111111111111111111111111) (= (mask!5732 newMap!16) #b00011111111111111111111111111111) (= (mask!5732 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5732 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10299 d!10327))

(declare-fun b!51387 () Bool)

(declare-fun e!33318 () Bool)

(declare-fun e!33316 () Bool)

(assert (=> b!51387 (= e!33318 e!33316)))

(declare-fun c!6879 () Bool)

(assert (=> b!51387 (= c!6879 (validKeyInArray!0 (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3941 () Bool)

(declare-fun call!3944 () Bool)

(assert (=> bm!3941 (= call!3944 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3542 newMap!16) (mask!5732 newMap!16)))))

(declare-fun b!51389 () Bool)

(declare-fun e!33317 () Bool)

(assert (=> b!51389 (= e!33317 call!3944)))

(declare-fun b!51390 () Bool)

(assert (=> b!51390 (= e!33316 e!33317)))

(declare-fun lt!21169 () (_ BitVec 64))

(assert (=> b!51390 (= lt!21169 (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21167 () Unit!1430)

(assert (=> b!51390 (= lt!21167 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3542 newMap!16) lt!21169 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51390 (arrayContainsKey!0 (_keys!3542 newMap!16) lt!21169 #b00000000000000000000000000000000)))

(declare-fun lt!21168 () Unit!1430)

(assert (=> b!51390 (= lt!21168 lt!21167)))

(declare-fun res!29418 () Bool)

(assert (=> b!51390 (= res!29418 (= (seekEntryOrOpen!0 (select (arr!1582 (_keys!3542 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3542 newMap!16) (mask!5732 newMap!16)) (Found!225 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51390 (=> (not res!29418) (not e!33317))))

(declare-fun d!10329 () Bool)

(declare-fun res!29419 () Bool)

(assert (=> d!10329 (=> res!29419 e!33318)))

(assert (=> d!10329 (= res!29419 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 newMap!16))))))

(assert (=> d!10329 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3542 newMap!16) (mask!5732 newMap!16)) e!33318)))

(declare-fun b!51388 () Bool)

(assert (=> b!51388 (= e!33316 call!3944)))

(assert (= (and d!10329 (not res!29419)) b!51387))

(assert (= (and b!51387 c!6879) b!51390))

(assert (= (and b!51387 (not c!6879)) b!51388))

(assert (= (and b!51390 res!29418) b!51389))

(assert (= (or b!51389 b!51388) bm!3941))

(assert (=> b!51387 m!44191))

(assert (=> b!51387 m!44191))

(assert (=> b!51387 m!44197))

(declare-fun m!44241 () Bool)

(assert (=> bm!3941 m!44241))

(assert (=> b!51390 m!44191))

(declare-fun m!44243 () Bool)

(assert (=> b!51390 m!44243))

(declare-fun m!44245 () Bool)

(assert (=> b!51390 m!44245))

(assert (=> b!51390 m!44191))

(declare-fun m!44247 () Bool)

(assert (=> b!51390 m!44247))

(assert (=> bm!3933 d!10329))

(declare-fun b!51391 () Bool)

(declare-fun e!33319 () (_ BitVec 32))

(declare-fun call!3945 () (_ BitVec 32))

(assert (=> b!51391 (= e!33319 call!3945)))

(declare-fun bm!3942 () Bool)

(assert (=> bm!3942 (= call!3945 (arrayCountValidKeys!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))))))

(declare-fun d!10331 () Bool)

(declare-fun lt!21170 () (_ BitVec 32))

(assert (=> d!10331 (and (bvsge lt!21170 #b00000000000000000000000000000000) (bvsle lt!21170 (bvsub (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!33320 () (_ BitVec 32))

(assert (=> d!10331 (= lt!21170 e!33320)))

(declare-fun c!6880 () Bool)

(assert (=> d!10331 (= c!6880 (bvsge #b00000000000000000000000000000000 (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))))))

(assert (=> d!10331 (and (bvsle #b00000000000000000000000000000000 (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))))))

(assert (=> d!10331 (= (arrayCountValidKeys!0 (_keys!3542 (v!2185 (underlying!138 thiss!992))) #b00000000000000000000000000000000 (size!1809 (_keys!3542 (v!2185 (underlying!138 thiss!992))))) lt!21170)))

(declare-fun b!51392 () Bool)

(assert (=> b!51392 (= e!33319 (bvadd #b00000000000000000000000000000001 call!3945))))

(declare-fun b!51393 () Bool)

(assert (=> b!51393 (= e!33320 e!33319)))

(declare-fun c!6881 () Bool)

(assert (=> b!51393 (= c!6881 (validKeyInArray!0 (select (arr!1582 (_keys!3542 (v!2185 (underlying!138 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51394 () Bool)

(assert (=> b!51394 (= e!33320 #b00000000000000000000000000000000)))

(assert (= (and d!10331 c!6880) b!51394))

(assert (= (and d!10331 (not c!6880)) b!51393))

(assert (= (and b!51393 c!6881) b!51392))

(assert (= (and b!51393 (not c!6881)) b!51391))

(assert (= (or b!51392 b!51391) bm!3942))

(declare-fun m!44249 () Bool)

(assert (=> bm!3942 m!44249))

(assert (=> b!51393 m!44225))

(assert (=> b!51393 m!44225))

(assert (=> b!51393 m!44231))

(assert (=> b!51289 d!10331))

(assert (=> b!51312 d!10305))

(assert (=> b!51330 d!10305))

(assert (=> b!51302 d!10307))

(declare-fun condMapEmpty!2297 () Bool)

(declare-fun mapDefault!2297 () ValueCell!761)

(assert (=> mapNonEmpty!2295 (= condMapEmpty!2297 (= mapRest!2295 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2297)))))

(declare-fun e!33321 () Bool)

(declare-fun mapRes!2297 () Bool)

(assert (=> mapNonEmpty!2295 (= tp!6867 (and e!33321 mapRes!2297))))

(declare-fun b!51396 () Bool)

(assert (=> b!51396 (= e!33321 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2297 () Bool)

(declare-fun tp!6869 () Bool)

(declare-fun e!33322 () Bool)

(assert (=> mapNonEmpty!2297 (= mapRes!2297 (and tp!6869 e!33322))))

(declare-fun mapRest!2297 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapKey!2297 () (_ BitVec 32))

(declare-fun mapValue!2297 () ValueCell!761)

(assert (=> mapNonEmpty!2297 (= mapRest!2295 (store mapRest!2297 mapKey!2297 mapValue!2297))))

(declare-fun b!51395 () Bool)

(assert (=> b!51395 (= e!33322 tp_is_empty!2209)))

(declare-fun mapIsEmpty!2297 () Bool)

(assert (=> mapIsEmpty!2297 mapRes!2297))

(assert (= (and mapNonEmpty!2295 condMapEmpty!2297) mapIsEmpty!2297))

(assert (= (and mapNonEmpty!2295 (not condMapEmpty!2297)) mapNonEmpty!2297))

(assert (= (and mapNonEmpty!2297 ((_ is ValueCellFull!761) mapValue!2297)) b!51395))

(assert (= (and mapNonEmpty!2295 ((_ is ValueCellFull!761) mapDefault!2297)) b!51396))

(declare-fun m!44251 () Bool)

(assert (=> mapNonEmpty!2297 m!44251))

(declare-fun condMapEmpty!2298 () Bool)

(declare-fun mapDefault!2298 () ValueCell!761)

(assert (=> mapNonEmpty!2296 (= condMapEmpty!2298 (= mapRest!2296 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2298)))))

(declare-fun e!33323 () Bool)

(declare-fun mapRes!2298 () Bool)

(assert (=> mapNonEmpty!2296 (= tp!6868 (and e!33323 mapRes!2298))))

(declare-fun b!51398 () Bool)

(assert (=> b!51398 (= e!33323 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2298 () Bool)

(declare-fun tp!6870 () Bool)

(declare-fun e!33324 () Bool)

(assert (=> mapNonEmpty!2298 (= mapRes!2298 (and tp!6870 e!33324))))

(declare-fun mapRest!2298 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapKey!2298 () (_ BitVec 32))

(declare-fun mapValue!2298 () ValueCell!761)

(assert (=> mapNonEmpty!2298 (= mapRest!2296 (store mapRest!2298 mapKey!2298 mapValue!2298))))

(declare-fun b!51397 () Bool)

(assert (=> b!51397 (= e!33324 tp_is_empty!2209)))

(declare-fun mapIsEmpty!2298 () Bool)

(assert (=> mapIsEmpty!2298 mapRes!2298))

(assert (= (and mapNonEmpty!2296 condMapEmpty!2298) mapIsEmpty!2298))

(assert (= (and mapNonEmpty!2296 (not condMapEmpty!2298)) mapNonEmpty!2298))

(assert (= (and mapNonEmpty!2298 ((_ is ValueCellFull!761) mapValue!2298)) b!51397))

(assert (= (and mapNonEmpty!2296 ((_ is ValueCellFull!761) mapDefault!2298)) b!51398))

(declare-fun m!44253 () Bool)

(assert (=> mapNonEmpty!2298 m!44253))

(check-sat (not b!51339) b_and!2797 (not mapNonEmpty!2297) (not d!10321) b_and!2799 (not b_next!1587) (not b!51382) (not b!51337) (not bm!3939) (not bm!3941) (not b!51386) (not bm!3938) tp_is_empty!2209 (not b!51383) (not b!51359) (not b!51393) (not bm!3940) (not b!51343) (not mapNonEmpty!2298) (not b!51352) (not b!51336) (not b!51379) (not b!51349) (not b!51390) (not b!51340) (not d!10313) (not b!51378) (not d!10317) (not b!51377) (not b!51387) (not bm!3942) (not d!10309) (not bm!3937) (not b_next!1585))
(check-sat b_and!2797 b_and!2799 (not b_next!1585) (not b_next!1587))
