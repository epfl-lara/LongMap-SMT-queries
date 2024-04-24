; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8130 () Bool)

(assert start!8130)

(declare-fun b!51167 () Bool)

(declare-fun b_free!1585 () Bool)

(declare-fun b_next!1585 () Bool)

(assert (=> b!51167 (= b_free!1585 (not b_next!1585))))

(declare-fun tp!6835 () Bool)

(declare-fun b_and!2793 () Bool)

(assert (=> b!51167 (= tp!6835 b_and!2793)))

(declare-fun b!51171 () Bool)

(declare-fun b_free!1587 () Bool)

(declare-fun b_next!1587 () Bool)

(assert (=> b!51171 (= b_free!1587 (not b_next!1587))))

(declare-fun tp!6836 () Bool)

(declare-fun b_and!2795 () Bool)

(assert (=> b!51171 (= tp!6836 b_and!2795)))

(declare-fun b!51162 () Bool)

(declare-fun res!29316 () Bool)

(declare-fun e!33160 () Bool)

(assert (=> b!51162 (=> (not res!29316) (not e!33160))))

(declare-datatypes ((V!2593 0))(
  ( (V!2594 (val!1149 Int)) )
))
(declare-datatypes ((array!3321 0))(
  ( (array!3322 (arr!1586 (Array (_ BitVec 32) (_ BitVec 64))) (size!1812 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!761 0))(
  ( (ValueCellFull!761 (v!2186 V!2593)) (EmptyCell!761) )
))
(declare-datatypes ((array!3323 0))(
  ( (array!3324 (arr!1587 (Array (_ BitVec 32) ValueCell!761)) (size!1813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!430 0))(
  ( (LongMapFixedSize!431 (defaultEntry!1929 Int) (mask!5733 (_ BitVec 32)) (extraKeys!1820 (_ BitVec 32)) (zeroValue!1847 V!2593) (minValue!1847 V!2593) (_size!264 (_ BitVec 32)) (_keys!3543 array!3321) (_values!1912 array!3323) (_vacant!264 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!430)

(declare-datatypes ((Cell!252 0))(
  ( (Cell!253 (v!2187 LongMapFixedSize!430)) )
))
(declare-datatypes ((LongMap!252 0))(
  ( (LongMap!253 (underlying!137 Cell!252)) )
))
(declare-fun thiss!992 () LongMap!252)

(assert (=> b!51162 (= res!29316 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5733 newMap!16)) (_size!264 (v!2187 (underlying!137 thiss!992)))))))

(declare-fun res!29319 () Bool)

(assert (=> start!8130 (=> (not res!29319) (not e!33160))))

(declare-fun valid!160 (LongMap!252) Bool)

(assert (=> start!8130 (= res!29319 (valid!160 thiss!992))))

(assert (=> start!8130 e!33160))

(declare-fun e!33156 () Bool)

(assert (=> start!8130 e!33156))

(assert (=> start!8130 true))

(declare-fun e!33161 () Bool)

(assert (=> start!8130 e!33161))

(declare-fun b!51163 () Bool)

(declare-fun res!29315 () Bool)

(assert (=> b!51163 (=> (not res!29315) (not e!33160))))

(declare-fun valid!161 (LongMapFixedSize!430) Bool)

(assert (=> b!51163 (= res!29315 (valid!161 newMap!16))))

(declare-fun b!51164 () Bool)

(declare-fun e!33162 () Bool)

(declare-fun tp_is_empty!2209 () Bool)

(assert (=> b!51164 (= e!33162 tp_is_empty!2209)))

(declare-fun b!51165 () Bool)

(declare-fun e!33150 () Bool)

(assert (=> b!51165 (= e!33150 tp_is_empty!2209)))

(declare-fun b!51166 () Bool)

(declare-fun res!29318 () Bool)

(assert (=> b!51166 (=> (not res!29318) (not e!33160))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51166 (= res!29318 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992)))))))))

(declare-fun e!33153 () Bool)

(declare-fun e!33158 () Bool)

(declare-fun array_inv!951 (array!3321) Bool)

(declare-fun array_inv!952 (array!3323) Bool)

(assert (=> b!51167 (= e!33153 (and tp!6835 tp_is_empty!2209 (array_inv!951 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) (array_inv!952 (_values!1912 (v!2187 (underlying!137 thiss!992)))) e!33158))))

(declare-fun b!51168 () Bool)

(declare-fun mapRes!2277 () Bool)

(assert (=> b!51168 (= e!33158 (and e!33162 mapRes!2277))))

(declare-fun condMapEmpty!2277 () Bool)

(declare-fun mapDefault!2277 () ValueCell!761)

(assert (=> b!51168 (= condMapEmpty!2277 (= (arr!1587 (_values!1912 (v!2187 (underlying!137 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2277)))))

(declare-fun b!51169 () Bool)

(declare-fun e!33159 () Bool)

(assert (=> b!51169 (= e!33159 tp_is_empty!2209)))

(declare-fun b!51170 () Bool)

(declare-fun e!33155 () Bool)

(assert (=> b!51170 (= e!33156 e!33155)))

(declare-fun e!33151 () Bool)

(assert (=> b!51171 (= e!33161 (and tp!6836 tp_is_empty!2209 (array_inv!951 (_keys!3543 newMap!16)) (array_inv!952 (_values!1912 newMap!16)) e!33151))))

(declare-fun b!51172 () Bool)

(declare-fun mapRes!2278 () Bool)

(assert (=> b!51172 (= e!33151 (and e!33150 mapRes!2278))))

(declare-fun condMapEmpty!2278 () Bool)

(declare-fun mapDefault!2278 () ValueCell!761)

(assert (=> b!51172 (= condMapEmpty!2278 (= (arr!1587 (_values!1912 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2278)))))

(declare-fun b!51173 () Bool)

(declare-fun res!29317 () Bool)

(assert (=> b!51173 (=> (not res!29317) (not e!33160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51173 (= res!29317 (validMask!0 (mask!5733 (v!2187 (underlying!137 thiss!992)))))))

(declare-fun b!51174 () Bool)

(assert (=> b!51174 (= e!33160 (and (= (size!1813 (_values!1912 (v!2187 (underlying!137 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5733 (v!2187 (underlying!137 thiss!992))))) (= (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) (size!1813 (_values!1912 (v!2187 (underlying!137 thiss!992))))) (bvsge (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1820 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!1820 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!2277 () Bool)

(declare-fun tp!6837 () Bool)

(assert (=> mapNonEmpty!2277 (= mapRes!2277 (and tp!6837 e!33159))))

(declare-fun mapValue!2278 () ValueCell!761)

(declare-fun mapKey!2278 () (_ BitVec 32))

(declare-fun mapRest!2277 () (Array (_ BitVec 32) ValueCell!761))

(assert (=> mapNonEmpty!2277 (= (arr!1587 (_values!1912 (v!2187 (underlying!137 thiss!992)))) (store mapRest!2277 mapKey!2278 mapValue!2278))))

(declare-fun mapIsEmpty!2277 () Bool)

(assert (=> mapIsEmpty!2277 mapRes!2277))

(declare-fun b!51175 () Bool)

(assert (=> b!51175 (= e!33155 e!33153)))

(declare-fun mapIsEmpty!2278 () Bool)

(assert (=> mapIsEmpty!2278 mapRes!2278))

(declare-fun mapNonEmpty!2278 () Bool)

(declare-fun tp!6838 () Bool)

(declare-fun e!33154 () Bool)

(assert (=> mapNonEmpty!2278 (= mapRes!2278 (and tp!6838 e!33154))))

(declare-fun mapKey!2277 () (_ BitVec 32))

(declare-fun mapValue!2277 () ValueCell!761)

(declare-fun mapRest!2278 () (Array (_ BitVec 32) ValueCell!761))

(assert (=> mapNonEmpty!2278 (= (arr!1587 (_values!1912 newMap!16)) (store mapRest!2278 mapKey!2277 mapValue!2277))))

(declare-fun b!51176 () Bool)

(assert (=> b!51176 (= e!33154 tp_is_empty!2209)))

(assert (= (and start!8130 res!29319) b!51166))

(assert (= (and b!51166 res!29318) b!51163))

(assert (= (and b!51163 res!29315) b!51162))

(assert (= (and b!51162 res!29316) b!51173))

(assert (= (and b!51173 res!29317) b!51174))

(assert (= (and b!51168 condMapEmpty!2277) mapIsEmpty!2277))

(assert (= (and b!51168 (not condMapEmpty!2277)) mapNonEmpty!2277))

(get-info :version)

(assert (= (and mapNonEmpty!2277 ((_ is ValueCellFull!761) mapValue!2278)) b!51169))

(assert (= (and b!51168 ((_ is ValueCellFull!761) mapDefault!2277)) b!51164))

(assert (= b!51167 b!51168))

(assert (= b!51175 b!51167))

(assert (= b!51170 b!51175))

(assert (= start!8130 b!51170))

(assert (= (and b!51172 condMapEmpty!2278) mapIsEmpty!2278))

(assert (= (and b!51172 (not condMapEmpty!2278)) mapNonEmpty!2278))

(assert (= (and mapNonEmpty!2278 ((_ is ValueCellFull!761) mapValue!2277)) b!51176))

(assert (= (and b!51172 ((_ is ValueCellFull!761) mapDefault!2278)) b!51165))

(assert (= b!51171 b!51172))

(assert (= start!8130 b!51171))

(declare-fun m!44045 () Bool)

(assert (=> mapNonEmpty!2277 m!44045))

(declare-fun m!44047 () Bool)

(assert (=> b!51167 m!44047))

(declare-fun m!44049 () Bool)

(assert (=> b!51167 m!44049))

(declare-fun m!44051 () Bool)

(assert (=> start!8130 m!44051))

(declare-fun m!44053 () Bool)

(assert (=> b!51171 m!44053))

(declare-fun m!44055 () Bool)

(assert (=> b!51171 m!44055))

(declare-fun m!44057 () Bool)

(assert (=> b!51163 m!44057))

(declare-fun m!44059 () Bool)

(assert (=> mapNonEmpty!2278 m!44059))

(declare-fun m!44061 () Bool)

(assert (=> b!51173 m!44061))

(check-sat b_and!2793 (not b_next!1587) (not b_next!1585) (not b!51171) b_and!2795 (not b!51173) (not mapNonEmpty!2277) (not start!8130) (not b!51167) (not mapNonEmpty!2278) (not b!51163) tp_is_empty!2209)
(check-sat b_and!2793 b_and!2795 (not b_next!1585) (not b_next!1587))
(get-model)

(declare-fun d!10291 () Bool)

(assert (=> d!10291 (= (array_inv!951 (_keys!3543 newMap!16)) (bvsge (size!1812 (_keys!3543 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51171 d!10291))

(declare-fun d!10293 () Bool)

(assert (=> d!10293 (= (array_inv!952 (_values!1912 newMap!16)) (bvsge (size!1813 (_values!1912 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51171 d!10293))

(declare-fun d!10295 () Bool)

(assert (=> d!10295 (= (validMask!0 (mask!5733 (v!2187 (underlying!137 thiss!992)))) (and (or (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000001111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000011111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000001111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000011111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000001111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000011111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000001111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000011111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000001111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000011111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000001111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000011111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000001111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000011111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000111111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000001111111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000011111111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000111111111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00001111111111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00011111111111111111111111111111) (= (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51173 d!10295))

(declare-fun d!10297 () Bool)

(declare-fun res!29356 () Bool)

(declare-fun e!33243 () Bool)

(assert (=> d!10297 (=> (not res!29356) (not e!33243))))

(declare-fun simpleValid!37 (LongMapFixedSize!430) Bool)

(assert (=> d!10297 (= res!29356 (simpleValid!37 newMap!16))))

(assert (=> d!10297 (= (valid!161 newMap!16) e!33243)))

(declare-fun b!51273 () Bool)

(declare-fun res!29357 () Bool)

(assert (=> b!51273 (=> (not res!29357) (not e!33243))))

(declare-fun arrayCountValidKeys!0 (array!3321 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51273 (= res!29357 (= (arrayCountValidKeys!0 (_keys!3543 newMap!16) #b00000000000000000000000000000000 (size!1812 (_keys!3543 newMap!16))) (_size!264 newMap!16)))))

(declare-fun b!51274 () Bool)

(declare-fun res!29358 () Bool)

(assert (=> b!51274 (=> (not res!29358) (not e!33243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3321 (_ BitVec 32)) Bool)

(assert (=> b!51274 (= res!29358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3543 newMap!16) (mask!5733 newMap!16)))))

(declare-fun b!51275 () Bool)

(declare-datatypes ((List!1318 0))(
  ( (Nil!1315) (Cons!1314 (h!1894 (_ BitVec 64)) (t!4352 List!1318)) )
))
(declare-fun arrayNoDuplicates!0 (array!3321 (_ BitVec 32) List!1318) Bool)

(assert (=> b!51275 (= e!33243 (arrayNoDuplicates!0 (_keys!3543 newMap!16) #b00000000000000000000000000000000 Nil!1315))))

(assert (= (and d!10297 res!29356) b!51273))

(assert (= (and b!51273 res!29357) b!51274))

(assert (= (and b!51274 res!29358) b!51275))

(declare-fun m!44099 () Bool)

(assert (=> d!10297 m!44099))

(declare-fun m!44101 () Bool)

(assert (=> b!51273 m!44101))

(declare-fun m!44103 () Bool)

(assert (=> b!51274 m!44103))

(declare-fun m!44105 () Bool)

(assert (=> b!51275 m!44105))

(assert (=> b!51163 d!10297))

(declare-fun d!10299 () Bool)

(assert (=> d!10299 (= (valid!160 thiss!992) (valid!161 (v!2187 (underlying!137 thiss!992))))))

(declare-fun bs!2376 () Bool)

(assert (= bs!2376 d!10299))

(declare-fun m!44107 () Bool)

(assert (=> bs!2376 m!44107))

(assert (=> start!8130 d!10299))

(declare-fun d!10301 () Bool)

(assert (=> d!10301 (= (array_inv!951 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) (bvsge (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51167 d!10301))

(declare-fun d!10303 () Bool)

(assert (=> d!10303 (= (array_inv!952 (_values!1912 (v!2187 (underlying!137 thiss!992)))) (bvsge (size!1813 (_values!1912 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51167 d!10303))

(declare-fun condMapEmpty!2293 () Bool)

(declare-fun mapDefault!2293 () ValueCell!761)

(assert (=> mapNonEmpty!2277 (= condMapEmpty!2293 (= mapRest!2277 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2293)))))

(declare-fun e!33249 () Bool)

(declare-fun mapRes!2293 () Bool)

(assert (=> mapNonEmpty!2277 (= tp!6837 (and e!33249 mapRes!2293))))

(declare-fun mapIsEmpty!2293 () Bool)

(assert (=> mapIsEmpty!2293 mapRes!2293))

(declare-fun b!51282 () Bool)

(declare-fun e!33248 () Bool)

(assert (=> b!51282 (= e!33248 tp_is_empty!2209)))

(declare-fun b!51283 () Bool)

(assert (=> b!51283 (= e!33249 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2293 () Bool)

(declare-fun tp!6865 () Bool)

(assert (=> mapNonEmpty!2293 (= mapRes!2293 (and tp!6865 e!33248))))

(declare-fun mapRest!2293 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapValue!2293 () ValueCell!761)

(declare-fun mapKey!2293 () (_ BitVec 32))

(assert (=> mapNonEmpty!2293 (= mapRest!2277 (store mapRest!2293 mapKey!2293 mapValue!2293))))

(assert (= (and mapNonEmpty!2277 condMapEmpty!2293) mapIsEmpty!2293))

(assert (= (and mapNonEmpty!2277 (not condMapEmpty!2293)) mapNonEmpty!2293))

(assert (= (and mapNonEmpty!2293 ((_ is ValueCellFull!761) mapValue!2293)) b!51282))

(assert (= (and mapNonEmpty!2277 ((_ is ValueCellFull!761) mapDefault!2293)) b!51283))

(declare-fun m!44109 () Bool)

(assert (=> mapNonEmpty!2293 m!44109))

(declare-fun condMapEmpty!2294 () Bool)

(declare-fun mapDefault!2294 () ValueCell!761)

(assert (=> mapNonEmpty!2278 (= condMapEmpty!2294 (= mapRest!2278 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2294)))))

(declare-fun e!33251 () Bool)

(declare-fun mapRes!2294 () Bool)

(assert (=> mapNonEmpty!2278 (= tp!6838 (and e!33251 mapRes!2294))))

(declare-fun mapIsEmpty!2294 () Bool)

(assert (=> mapIsEmpty!2294 mapRes!2294))

(declare-fun b!51284 () Bool)

(declare-fun e!33250 () Bool)

(assert (=> b!51284 (= e!33250 tp_is_empty!2209)))

(declare-fun b!51285 () Bool)

(assert (=> b!51285 (= e!33251 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2294 () Bool)

(declare-fun tp!6866 () Bool)

(assert (=> mapNonEmpty!2294 (= mapRes!2294 (and tp!6866 e!33250))))

(declare-fun mapRest!2294 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapKey!2294 () (_ BitVec 32))

(declare-fun mapValue!2294 () ValueCell!761)

(assert (=> mapNonEmpty!2294 (= mapRest!2278 (store mapRest!2294 mapKey!2294 mapValue!2294))))

(assert (= (and mapNonEmpty!2278 condMapEmpty!2294) mapIsEmpty!2294))

(assert (= (and mapNonEmpty!2278 (not condMapEmpty!2294)) mapNonEmpty!2294))

(assert (= (and mapNonEmpty!2294 ((_ is ValueCellFull!761) mapValue!2294)) b!51284))

(assert (= (and mapNonEmpty!2278 ((_ is ValueCellFull!761) mapDefault!2294)) b!51285))

(declare-fun m!44111 () Bool)

(assert (=> mapNonEmpty!2294 m!44111))

(check-sat (not mapNonEmpty!2294) b_and!2793 (not b_next!1587) (not b!51273) (not b!51275) (not d!10299) (not mapNonEmpty!2293) tp_is_empty!2209 (not b_next!1585) (not b!51274) b_and!2795 (not d!10297))
(check-sat b_and!2793 b_and!2795 (not b_next!1585) (not b_next!1587))
(get-model)

(declare-fun bm!3917 () Bool)

(declare-fun call!3920 () Bool)

(assert (=> bm!3917 (= call!3920 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3543 newMap!16) (mask!5733 newMap!16)))))

(declare-fun b!51294 () Bool)

(declare-fun e!33259 () Bool)

(assert (=> b!51294 (= e!33259 call!3920)))

(declare-fun b!51295 () Bool)

(declare-fun e!33258 () Bool)

(assert (=> b!51295 (= e!33258 e!33259)))

(declare-fun c!6862 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51295 (= c!6862 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51297 () Bool)

(declare-fun e!33260 () Bool)

(assert (=> b!51297 (= e!33259 e!33260)))

(declare-fun lt!21116 () (_ BitVec 64))

(assert (=> b!51297 (= lt!21116 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1436 0))(
  ( (Unit!1437) )
))
(declare-fun lt!21115 () Unit!1436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3321 (_ BitVec 64) (_ BitVec 32)) Unit!1436)

(assert (=> b!51297 (= lt!21115 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3543 newMap!16) lt!21116 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51297 (arrayContainsKey!0 (_keys!3543 newMap!16) lt!21116 #b00000000000000000000000000000000)))

(declare-fun lt!21117 () Unit!1436)

(assert (=> b!51297 (= lt!21117 lt!21115)))

(declare-fun res!29363 () Bool)

(declare-datatypes ((SeekEntryResult!216 0))(
  ( (MissingZero!216 (index!2986 (_ BitVec 32))) (Found!216 (index!2987 (_ BitVec 32))) (Intermediate!216 (undefined!1028 Bool) (index!2988 (_ BitVec 32)) (x!9348 (_ BitVec 32))) (Undefined!216) (MissingVacant!216 (index!2989 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3321 (_ BitVec 32)) SeekEntryResult!216)

(assert (=> b!51297 (= res!29363 (= (seekEntryOrOpen!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) (_keys!3543 newMap!16) (mask!5733 newMap!16)) (Found!216 #b00000000000000000000000000000000)))))

(assert (=> b!51297 (=> (not res!29363) (not e!33260))))

(declare-fun d!10305 () Bool)

(declare-fun res!29364 () Bool)

(assert (=> d!10305 (=> res!29364 e!33258)))

(assert (=> d!10305 (= res!29364 (bvsge #b00000000000000000000000000000000 (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3543 newMap!16) (mask!5733 newMap!16)) e!33258)))

(declare-fun b!51296 () Bool)

(assert (=> b!51296 (= e!33260 call!3920)))

(assert (= (and d!10305 (not res!29364)) b!51295))

(assert (= (and b!51295 c!6862) b!51297))

(assert (= (and b!51295 (not c!6862)) b!51294))

(assert (= (and b!51297 res!29363) b!51296))

(assert (= (or b!51296 b!51294) bm!3917))

(declare-fun m!44113 () Bool)

(assert (=> bm!3917 m!44113))

(declare-fun m!44115 () Bool)

(assert (=> b!51295 m!44115))

(assert (=> b!51295 m!44115))

(declare-fun m!44117 () Bool)

(assert (=> b!51295 m!44117))

(assert (=> b!51297 m!44115))

(declare-fun m!44119 () Bool)

(assert (=> b!51297 m!44119))

(declare-fun m!44121 () Bool)

(assert (=> b!51297 m!44121))

(assert (=> b!51297 m!44115))

(declare-fun m!44123 () Bool)

(assert (=> b!51297 m!44123))

(assert (=> b!51274 d!10305))

(declare-fun d!10307 () Bool)

(declare-fun res!29365 () Bool)

(declare-fun e!33261 () Bool)

(assert (=> d!10307 (=> (not res!29365) (not e!33261))))

(assert (=> d!10307 (= res!29365 (simpleValid!37 (v!2187 (underlying!137 thiss!992))))))

(assert (=> d!10307 (= (valid!161 (v!2187 (underlying!137 thiss!992))) e!33261)))

(declare-fun b!51298 () Bool)

(declare-fun res!29366 () Bool)

(assert (=> b!51298 (=> (not res!29366) (not e!33261))))

(assert (=> b!51298 (= res!29366 (= (arrayCountValidKeys!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000 (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))) (_size!264 (v!2187 (underlying!137 thiss!992)))))))

(declare-fun b!51299 () Bool)

(declare-fun res!29367 () Bool)

(assert (=> b!51299 (=> (not res!29367) (not e!33261))))

(assert (=> b!51299 (= res!29367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3543 (v!2187 (underlying!137 thiss!992))) (mask!5733 (v!2187 (underlying!137 thiss!992)))))))

(declare-fun b!51300 () Bool)

(assert (=> b!51300 (= e!33261 (arrayNoDuplicates!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000 Nil!1315))))

(assert (= (and d!10307 res!29365) b!51298))

(assert (= (and b!51298 res!29366) b!51299))

(assert (= (and b!51299 res!29367) b!51300))

(declare-fun m!44125 () Bool)

(assert (=> d!10307 m!44125))

(declare-fun m!44127 () Bool)

(assert (=> b!51298 m!44127))

(declare-fun m!44129 () Bool)

(assert (=> b!51299 m!44129))

(declare-fun m!44131 () Bool)

(assert (=> b!51300 m!44131))

(assert (=> d!10299 d!10307))

(declare-fun b!51311 () Bool)

(declare-fun e!33271 () Bool)

(declare-fun e!33272 () Bool)

(assert (=> b!51311 (= e!33271 e!33272)))

(declare-fun c!6865 () Bool)

(assert (=> b!51311 (= c!6865 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10309 () Bool)

(declare-fun res!29376 () Bool)

(declare-fun e!33273 () Bool)

(assert (=> d!10309 (=> res!29376 e!33273)))

(assert (=> d!10309 (= res!29376 (bvsge #b00000000000000000000000000000000 (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10309 (= (arrayNoDuplicates!0 (_keys!3543 newMap!16) #b00000000000000000000000000000000 Nil!1315) e!33273)))

(declare-fun bm!3920 () Bool)

(declare-fun call!3923 () Bool)

(assert (=> bm!3920 (= call!3923 (arrayNoDuplicates!0 (_keys!3543 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6865 (Cons!1314 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) Nil!1315) Nil!1315)))))

(declare-fun b!51312 () Bool)

(declare-fun e!33270 () Bool)

(declare-fun contains!613 (List!1318 (_ BitVec 64)) Bool)

(assert (=> b!51312 (= e!33270 (contains!613 Nil!1315 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51313 () Bool)

(assert (=> b!51313 (= e!33272 call!3923)))

(declare-fun b!51314 () Bool)

(assert (=> b!51314 (= e!33272 call!3923)))

(declare-fun b!51315 () Bool)

(assert (=> b!51315 (= e!33273 e!33271)))

(declare-fun res!29375 () Bool)

(assert (=> b!51315 (=> (not res!29375) (not e!33271))))

(assert (=> b!51315 (= res!29375 (not e!33270))))

(declare-fun res!29374 () Bool)

(assert (=> b!51315 (=> (not res!29374) (not e!33270))))

(assert (=> b!51315 (= res!29374 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10309 (not res!29376)) b!51315))

(assert (= (and b!51315 res!29374) b!51312))

(assert (= (and b!51315 res!29375) b!51311))

(assert (= (and b!51311 c!6865) b!51314))

(assert (= (and b!51311 (not c!6865)) b!51313))

(assert (= (or b!51314 b!51313) bm!3920))

(assert (=> b!51311 m!44115))

(assert (=> b!51311 m!44115))

(assert (=> b!51311 m!44117))

(assert (=> bm!3920 m!44115))

(declare-fun m!44133 () Bool)

(assert (=> bm!3920 m!44133))

(assert (=> b!51312 m!44115))

(assert (=> b!51312 m!44115))

(declare-fun m!44135 () Bool)

(assert (=> b!51312 m!44135))

(assert (=> b!51315 m!44115))

(assert (=> b!51315 m!44115))

(assert (=> b!51315 m!44117))

(assert (=> b!51275 d!10309))

(declare-fun bm!3923 () Bool)

(declare-fun call!3926 () (_ BitVec 32))

(assert (=> bm!3923 (= call!3926 (arrayCountValidKeys!0 (_keys!3543 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))))))

(declare-fun b!51324 () Bool)

(declare-fun e!33278 () (_ BitVec 32))

(assert (=> b!51324 (= e!33278 #b00000000000000000000000000000000)))

(declare-fun b!51325 () Bool)

(declare-fun e!33279 () (_ BitVec 32))

(assert (=> b!51325 (= e!33278 e!33279)))

(declare-fun c!6871 () Bool)

(assert (=> b!51325 (= c!6871 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51326 () Bool)

(assert (=> b!51326 (= e!33279 (bvadd #b00000000000000000000000000000001 call!3926))))

(declare-fun b!51327 () Bool)

(assert (=> b!51327 (= e!33279 call!3926)))

(declare-fun d!10311 () Bool)

(declare-fun lt!21120 () (_ BitVec 32))

(assert (=> d!10311 (and (bvsge lt!21120 #b00000000000000000000000000000000) (bvsle lt!21120 (bvsub (size!1812 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10311 (= lt!21120 e!33278)))

(declare-fun c!6870 () Bool)

(assert (=> d!10311 (= c!6870 (bvsge #b00000000000000000000000000000000 (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10311 (and (bvsle #b00000000000000000000000000000000 (size!1812 (_keys!3543 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1812 (_keys!3543 newMap!16)) (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10311 (= (arrayCountValidKeys!0 (_keys!3543 newMap!16) #b00000000000000000000000000000000 (size!1812 (_keys!3543 newMap!16))) lt!21120)))

(assert (= (and d!10311 c!6870) b!51324))

(assert (= (and d!10311 (not c!6870)) b!51325))

(assert (= (and b!51325 c!6871) b!51326))

(assert (= (and b!51325 (not c!6871)) b!51327))

(assert (= (or b!51326 b!51327) bm!3923))

(declare-fun m!44137 () Bool)

(assert (=> bm!3923 m!44137))

(assert (=> b!51325 m!44115))

(assert (=> b!51325 m!44115))

(assert (=> b!51325 m!44117))

(assert (=> b!51273 d!10311))

(declare-fun b!51337 () Bool)

(declare-fun res!29386 () Bool)

(declare-fun e!33282 () Bool)

(assert (=> b!51337 (=> (not res!29386) (not e!33282))))

(declare-fun size!1818 (LongMapFixedSize!430) (_ BitVec 32))

(assert (=> b!51337 (= res!29386 (bvsge (size!1818 newMap!16) (_size!264 newMap!16)))))

(declare-fun d!10313 () Bool)

(declare-fun res!29385 () Bool)

(assert (=> d!10313 (=> (not res!29385) (not e!33282))))

(assert (=> d!10313 (= res!29385 (validMask!0 (mask!5733 newMap!16)))))

(assert (=> d!10313 (= (simpleValid!37 newMap!16) e!33282)))

(declare-fun b!51338 () Bool)

(declare-fun res!29388 () Bool)

(assert (=> b!51338 (=> (not res!29388) (not e!33282))))

(assert (=> b!51338 (= res!29388 (= (size!1818 newMap!16) (bvadd (_size!264 newMap!16) (bvsdiv (bvadd (extraKeys!1820 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51339 () Bool)

(assert (=> b!51339 (= e!33282 (and (bvsge (extraKeys!1820 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1820 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!264 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51336 () Bool)

(declare-fun res!29387 () Bool)

(assert (=> b!51336 (=> (not res!29387) (not e!33282))))

(assert (=> b!51336 (= res!29387 (and (= (size!1813 (_values!1912 newMap!16)) (bvadd (mask!5733 newMap!16) #b00000000000000000000000000000001)) (= (size!1812 (_keys!3543 newMap!16)) (size!1813 (_values!1912 newMap!16))) (bvsge (_size!264 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!264 newMap!16) (bvadd (mask!5733 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!10313 res!29385) b!51336))

(assert (= (and b!51336 res!29387) b!51337))

(assert (= (and b!51337 res!29386) b!51338))

(assert (= (and b!51338 res!29388) b!51339))

(declare-fun m!44139 () Bool)

(assert (=> b!51337 m!44139))

(declare-fun m!44141 () Bool)

(assert (=> d!10313 m!44141))

(assert (=> b!51338 m!44139))

(assert (=> d!10297 d!10313))

(declare-fun condMapEmpty!2295 () Bool)

(declare-fun mapDefault!2295 () ValueCell!761)

(assert (=> mapNonEmpty!2293 (= condMapEmpty!2295 (= mapRest!2293 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2295)))))

(declare-fun e!33284 () Bool)

(declare-fun mapRes!2295 () Bool)

(assert (=> mapNonEmpty!2293 (= tp!6865 (and e!33284 mapRes!2295))))

(declare-fun mapIsEmpty!2295 () Bool)

(assert (=> mapIsEmpty!2295 mapRes!2295))

(declare-fun b!51340 () Bool)

(declare-fun e!33283 () Bool)

(assert (=> b!51340 (= e!33283 tp_is_empty!2209)))

(declare-fun b!51341 () Bool)

(assert (=> b!51341 (= e!33284 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2295 () Bool)

(declare-fun tp!6867 () Bool)

(assert (=> mapNonEmpty!2295 (= mapRes!2295 (and tp!6867 e!33283))))

(declare-fun mapRest!2295 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapKey!2295 () (_ BitVec 32))

(declare-fun mapValue!2295 () ValueCell!761)

(assert (=> mapNonEmpty!2295 (= mapRest!2293 (store mapRest!2295 mapKey!2295 mapValue!2295))))

(assert (= (and mapNonEmpty!2293 condMapEmpty!2295) mapIsEmpty!2295))

(assert (= (and mapNonEmpty!2293 (not condMapEmpty!2295)) mapNonEmpty!2295))

(assert (= (and mapNonEmpty!2295 ((_ is ValueCellFull!761) mapValue!2295)) b!51340))

(assert (= (and mapNonEmpty!2293 ((_ is ValueCellFull!761) mapDefault!2295)) b!51341))

(declare-fun m!44143 () Bool)

(assert (=> mapNonEmpty!2295 m!44143))

(declare-fun condMapEmpty!2296 () Bool)

(declare-fun mapDefault!2296 () ValueCell!761)

(assert (=> mapNonEmpty!2294 (= condMapEmpty!2296 (= mapRest!2294 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2296)))))

(declare-fun e!33286 () Bool)

(declare-fun mapRes!2296 () Bool)

(assert (=> mapNonEmpty!2294 (= tp!6866 (and e!33286 mapRes!2296))))

(declare-fun mapIsEmpty!2296 () Bool)

(assert (=> mapIsEmpty!2296 mapRes!2296))

(declare-fun b!51342 () Bool)

(declare-fun e!33285 () Bool)

(assert (=> b!51342 (= e!33285 tp_is_empty!2209)))

(declare-fun b!51343 () Bool)

(assert (=> b!51343 (= e!33286 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2296 () Bool)

(declare-fun tp!6868 () Bool)

(assert (=> mapNonEmpty!2296 (= mapRes!2296 (and tp!6868 e!33285))))

(declare-fun mapKey!2296 () (_ BitVec 32))

(declare-fun mapValue!2296 () ValueCell!761)

(declare-fun mapRest!2296 () (Array (_ BitVec 32) ValueCell!761))

(assert (=> mapNonEmpty!2296 (= mapRest!2294 (store mapRest!2296 mapKey!2296 mapValue!2296))))

(assert (= (and mapNonEmpty!2294 condMapEmpty!2296) mapIsEmpty!2296))

(assert (= (and mapNonEmpty!2294 (not condMapEmpty!2296)) mapNonEmpty!2296))

(assert (= (and mapNonEmpty!2296 ((_ is ValueCellFull!761) mapValue!2296)) b!51342))

(assert (= (and mapNonEmpty!2294 ((_ is ValueCellFull!761) mapDefault!2296)) b!51343))

(declare-fun m!44145 () Bool)

(assert (=> mapNonEmpty!2296 m!44145))

(check-sat (not b!51315) (not bm!3923) (not d!10313) (not b!51325) (not b!51297) b_and!2795 (not d!10307) (not b!51311) (not b!51337) (not b!51300) (not bm!3920) (not b!51295) (not b!51338) tp_is_empty!2209 (not mapNonEmpty!2296) (not mapNonEmpty!2295) b_and!2793 (not b!51299) (not b_next!1587) (not b!51298) (not b_next!1585) (not b!51312) (not bm!3917))
(check-sat b_and!2793 b_and!2795 (not b_next!1585) (not b_next!1587))
(get-model)

(declare-fun b!51345 () Bool)

(declare-fun res!29390 () Bool)

(declare-fun e!33287 () Bool)

(assert (=> b!51345 (=> (not res!29390) (not e!33287))))

(assert (=> b!51345 (= res!29390 (bvsge (size!1818 (v!2187 (underlying!137 thiss!992))) (_size!264 (v!2187 (underlying!137 thiss!992)))))))

(declare-fun d!10315 () Bool)

(declare-fun res!29389 () Bool)

(assert (=> d!10315 (=> (not res!29389) (not e!33287))))

(assert (=> d!10315 (= res!29389 (validMask!0 (mask!5733 (v!2187 (underlying!137 thiss!992)))))))

(assert (=> d!10315 (= (simpleValid!37 (v!2187 (underlying!137 thiss!992))) e!33287)))

(declare-fun b!51346 () Bool)

(declare-fun res!29392 () Bool)

(assert (=> b!51346 (=> (not res!29392) (not e!33287))))

(assert (=> b!51346 (= res!29392 (= (size!1818 (v!2187 (underlying!137 thiss!992))) (bvadd (_size!264 (v!2187 (underlying!137 thiss!992))) (bvsdiv (bvadd (extraKeys!1820 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51347 () Bool)

(assert (=> b!51347 (= e!33287 (and (bvsge (extraKeys!1820 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1820 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!264 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!51344 () Bool)

(declare-fun res!29391 () Bool)

(assert (=> b!51344 (=> (not res!29391) (not e!33287))))

(assert (=> b!51344 (= res!29391 (and (= (size!1813 (_values!1912 (v!2187 (underlying!137 thiss!992)))) (bvadd (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000001)) (= (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) (size!1813 (_values!1912 (v!2187 (underlying!137 thiss!992))))) (bvsge (_size!264 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!264 (v!2187 (underlying!137 thiss!992))) (bvadd (mask!5733 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000001))))))

(assert (= (and d!10315 res!29389) b!51344))

(assert (= (and b!51344 res!29391) b!51345))

(assert (= (and b!51345 res!29390) b!51346))

(assert (= (and b!51346 res!29392) b!51347))

(declare-fun m!44147 () Bool)

(assert (=> b!51345 m!44147))

(assert (=> d!10315 m!44061))

(assert (=> b!51346 m!44147))

(assert (=> d!10307 d!10315))

(declare-fun d!10317 () Bool)

(declare-fun lt!21123 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!60 (List!1318) (InoxSet (_ BitVec 64)))

(assert (=> d!10317 (= lt!21123 (select (content!60 Nil!1315) (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33293 () Bool)

(assert (=> d!10317 (= lt!21123 e!33293)))

(declare-fun res!29397 () Bool)

(assert (=> d!10317 (=> (not res!29397) (not e!33293))))

(assert (=> d!10317 (= res!29397 ((_ is Cons!1314) Nil!1315))))

(assert (=> d!10317 (= (contains!613 Nil!1315 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)) lt!21123)))

(declare-fun b!51352 () Bool)

(declare-fun e!33292 () Bool)

(assert (=> b!51352 (= e!33293 e!33292)))

(declare-fun res!29398 () Bool)

(assert (=> b!51352 (=> res!29398 e!33292)))

(assert (=> b!51352 (= res!29398 (= (h!1894 Nil!1315) (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51353 () Bool)

(assert (=> b!51353 (= e!33292 (contains!613 (t!4352 Nil!1315) (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10317 res!29397) b!51352))

(assert (= (and b!51352 (not res!29398)) b!51353))

(declare-fun m!44149 () Bool)

(assert (=> d!10317 m!44149))

(assert (=> d!10317 m!44115))

(declare-fun m!44151 () Bool)

(assert (=> d!10317 m!44151))

(assert (=> b!51353 m!44115))

(declare-fun m!44153 () Bool)

(assert (=> b!51353 m!44153))

(assert (=> b!51312 d!10317))

(declare-fun bm!3924 () Bool)

(declare-fun call!3927 () (_ BitVec 32))

(assert (=> bm!3924 (= call!3927 (arrayCountValidKeys!0 (_keys!3543 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))))))

(declare-fun b!51354 () Bool)

(declare-fun e!33294 () (_ BitVec 32))

(assert (=> b!51354 (= e!33294 #b00000000000000000000000000000000)))

(declare-fun b!51355 () Bool)

(declare-fun e!33295 () (_ BitVec 32))

(assert (=> b!51355 (= e!33294 e!33295)))

(declare-fun c!6873 () Bool)

(assert (=> b!51355 (= c!6873 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51356 () Bool)

(assert (=> b!51356 (= e!33295 (bvadd #b00000000000000000000000000000001 call!3927))))

(declare-fun b!51357 () Bool)

(assert (=> b!51357 (= e!33295 call!3927)))

(declare-fun d!10319 () Bool)

(declare-fun lt!21124 () (_ BitVec 32))

(assert (=> d!10319 (and (bvsge lt!21124 #b00000000000000000000000000000000) (bvsle lt!21124 (bvsub (size!1812 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10319 (= lt!21124 e!33294)))

(declare-fun c!6872 () Bool)

(assert (=> d!10319 (= c!6872 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10319 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1812 (_keys!3543 newMap!16)) (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10319 (= (arrayCountValidKeys!0 (_keys!3543 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))) lt!21124)))

(assert (= (and d!10319 c!6872) b!51354))

(assert (= (and d!10319 (not c!6872)) b!51355))

(assert (= (and b!51355 c!6873) b!51356))

(assert (= (and b!51355 (not c!6873)) b!51357))

(assert (= (or b!51356 b!51357) bm!3924))

(declare-fun m!44155 () Bool)

(assert (=> bm!3924 m!44155))

(declare-fun m!44157 () Bool)

(assert (=> b!51355 m!44157))

(assert (=> b!51355 m!44157))

(declare-fun m!44159 () Bool)

(assert (=> b!51355 m!44159))

(assert (=> bm!3923 d!10319))

(declare-fun b!51358 () Bool)

(declare-fun e!33297 () Bool)

(declare-fun e!33298 () Bool)

(assert (=> b!51358 (= e!33297 e!33298)))

(declare-fun c!6874 () Bool)

(assert (=> b!51358 (= c!6874 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10321 () Bool)

(declare-fun res!29401 () Bool)

(declare-fun e!33299 () Bool)

(assert (=> d!10321 (=> res!29401 e!33299)))

(assert (=> d!10321 (= res!29401 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10321 (= (arrayNoDuplicates!0 (_keys!3543 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6865 (Cons!1314 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) Nil!1315) Nil!1315)) e!33299)))

(declare-fun bm!3925 () Bool)

(declare-fun call!3928 () Bool)

(assert (=> bm!3925 (= call!3928 (arrayNoDuplicates!0 (_keys!3543 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6874 (Cons!1314 (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6865 (Cons!1314 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) Nil!1315) Nil!1315)) (ite c!6865 (Cons!1314 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) Nil!1315) Nil!1315))))))

(declare-fun b!51359 () Bool)

(declare-fun e!33296 () Bool)

(assert (=> b!51359 (= e!33296 (contains!613 (ite c!6865 (Cons!1314 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) Nil!1315) Nil!1315) (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51360 () Bool)

(assert (=> b!51360 (= e!33298 call!3928)))

(declare-fun b!51361 () Bool)

(assert (=> b!51361 (= e!33298 call!3928)))

(declare-fun b!51362 () Bool)

(assert (=> b!51362 (= e!33299 e!33297)))

(declare-fun res!29400 () Bool)

(assert (=> b!51362 (=> (not res!29400) (not e!33297))))

(assert (=> b!51362 (= res!29400 (not e!33296))))

(declare-fun res!29399 () Bool)

(assert (=> b!51362 (=> (not res!29399) (not e!33296))))

(assert (=> b!51362 (= res!29399 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10321 (not res!29401)) b!51362))

(assert (= (and b!51362 res!29399) b!51359))

(assert (= (and b!51362 res!29400) b!51358))

(assert (= (and b!51358 c!6874) b!51361))

(assert (= (and b!51358 (not c!6874)) b!51360))

(assert (= (or b!51361 b!51360) bm!3925))

(assert (=> b!51358 m!44157))

(assert (=> b!51358 m!44157))

(assert (=> b!51358 m!44159))

(assert (=> bm!3925 m!44157))

(declare-fun m!44161 () Bool)

(assert (=> bm!3925 m!44161))

(assert (=> b!51359 m!44157))

(assert (=> b!51359 m!44157))

(declare-fun m!44163 () Bool)

(assert (=> b!51359 m!44163))

(assert (=> b!51362 m!44157))

(assert (=> b!51362 m!44157))

(assert (=> b!51362 m!44159))

(assert (=> bm!3920 d!10321))

(declare-fun d!10323 () Bool)

(assert (=> d!10323 (= (validMask!0 (mask!5733 newMap!16)) (and (or (= (mask!5733 newMap!16) #b00000000000000000000000000000111) (= (mask!5733 newMap!16) #b00000000000000000000000000001111) (= (mask!5733 newMap!16) #b00000000000000000000000000011111) (= (mask!5733 newMap!16) #b00000000000000000000000000111111) (= (mask!5733 newMap!16) #b00000000000000000000000001111111) (= (mask!5733 newMap!16) #b00000000000000000000000011111111) (= (mask!5733 newMap!16) #b00000000000000000000000111111111) (= (mask!5733 newMap!16) #b00000000000000000000001111111111) (= (mask!5733 newMap!16) #b00000000000000000000011111111111) (= (mask!5733 newMap!16) #b00000000000000000000111111111111) (= (mask!5733 newMap!16) #b00000000000000000001111111111111) (= (mask!5733 newMap!16) #b00000000000000000011111111111111) (= (mask!5733 newMap!16) #b00000000000000000111111111111111) (= (mask!5733 newMap!16) #b00000000000000001111111111111111) (= (mask!5733 newMap!16) #b00000000000000011111111111111111) (= (mask!5733 newMap!16) #b00000000000000111111111111111111) (= (mask!5733 newMap!16) #b00000000000001111111111111111111) (= (mask!5733 newMap!16) #b00000000000011111111111111111111) (= (mask!5733 newMap!16) #b00000000000111111111111111111111) (= (mask!5733 newMap!16) #b00000000001111111111111111111111) (= (mask!5733 newMap!16) #b00000000011111111111111111111111) (= (mask!5733 newMap!16) #b00000000111111111111111111111111) (= (mask!5733 newMap!16) #b00000001111111111111111111111111) (= (mask!5733 newMap!16) #b00000011111111111111111111111111) (= (mask!5733 newMap!16) #b00000111111111111111111111111111) (= (mask!5733 newMap!16) #b00001111111111111111111111111111) (= (mask!5733 newMap!16) #b00011111111111111111111111111111) (= (mask!5733 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5733 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10313 d!10323))

(declare-fun d!10325 () Bool)

(assert (=> d!10325 (= (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51311 d!10325))

(declare-fun b!51363 () Bool)

(declare-fun e!33301 () Bool)

(declare-fun e!33302 () Bool)

(assert (=> b!51363 (= e!33301 e!33302)))

(declare-fun c!6875 () Bool)

(assert (=> b!51363 (= c!6875 (validKeyInArray!0 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10327 () Bool)

(declare-fun res!29404 () Bool)

(declare-fun e!33303 () Bool)

(assert (=> d!10327 (=> res!29404 e!33303)))

(assert (=> d!10327 (= res!29404 (bvsge #b00000000000000000000000000000000 (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))))))

(assert (=> d!10327 (= (arrayNoDuplicates!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000 Nil!1315) e!33303)))

(declare-fun bm!3926 () Bool)

(declare-fun call!3929 () Bool)

(assert (=> bm!3926 (= call!3929 (arrayNoDuplicates!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6875 (Cons!1314 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000) Nil!1315) Nil!1315)))))

(declare-fun b!51364 () Bool)

(declare-fun e!33300 () Bool)

(assert (=> b!51364 (= e!33300 (contains!613 Nil!1315 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51365 () Bool)

(assert (=> b!51365 (= e!33302 call!3929)))

(declare-fun b!51366 () Bool)

(assert (=> b!51366 (= e!33302 call!3929)))

(declare-fun b!51367 () Bool)

(assert (=> b!51367 (= e!33303 e!33301)))

(declare-fun res!29403 () Bool)

(assert (=> b!51367 (=> (not res!29403) (not e!33301))))

(assert (=> b!51367 (= res!29403 (not e!33300))))

(declare-fun res!29402 () Bool)

(assert (=> b!51367 (=> (not res!29402) (not e!33300))))

(assert (=> b!51367 (= res!29402 (validKeyInArray!0 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10327 (not res!29404)) b!51367))

(assert (= (and b!51367 res!29402) b!51364))

(assert (= (and b!51367 res!29403) b!51363))

(assert (= (and b!51363 c!6875) b!51366))

(assert (= (and b!51363 (not c!6875)) b!51365))

(assert (= (or b!51366 b!51365) bm!3926))

(declare-fun m!44165 () Bool)

(assert (=> b!51363 m!44165))

(assert (=> b!51363 m!44165))

(declare-fun m!44167 () Bool)

(assert (=> b!51363 m!44167))

(assert (=> bm!3926 m!44165))

(declare-fun m!44169 () Bool)

(assert (=> bm!3926 m!44169))

(assert (=> b!51364 m!44165))

(assert (=> b!51364 m!44165))

(declare-fun m!44171 () Bool)

(assert (=> b!51364 m!44171))

(assert (=> b!51367 m!44165))

(assert (=> b!51367 m!44165))

(assert (=> b!51367 m!44167))

(assert (=> b!51300 d!10327))

(declare-fun d!10329 () Bool)

(assert (=> d!10329 (arrayContainsKey!0 (_keys!3543 newMap!16) lt!21116 #b00000000000000000000000000000000)))

(declare-fun lt!21127 () Unit!1436)

(declare-fun choose!13 (array!3321 (_ BitVec 64) (_ BitVec 32)) Unit!1436)

(assert (=> d!10329 (= lt!21127 (choose!13 (_keys!3543 newMap!16) lt!21116 #b00000000000000000000000000000000))))

(assert (=> d!10329 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10329 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3543 newMap!16) lt!21116 #b00000000000000000000000000000000) lt!21127)))

(declare-fun bs!2377 () Bool)

(assert (= bs!2377 d!10329))

(assert (=> bs!2377 m!44121))

(declare-fun m!44173 () Bool)

(assert (=> bs!2377 m!44173))

(assert (=> b!51297 d!10329))

(declare-fun d!10331 () Bool)

(declare-fun res!29409 () Bool)

(declare-fun e!33308 () Bool)

(assert (=> d!10331 (=> res!29409 e!33308)))

(assert (=> d!10331 (= res!29409 (= (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) lt!21116))))

(assert (=> d!10331 (= (arrayContainsKey!0 (_keys!3543 newMap!16) lt!21116 #b00000000000000000000000000000000) e!33308)))

(declare-fun b!51372 () Bool)

(declare-fun e!33309 () Bool)

(assert (=> b!51372 (= e!33308 e!33309)))

(declare-fun res!29410 () Bool)

(assert (=> b!51372 (=> (not res!29410) (not e!33309))))

(assert (=> b!51372 (= res!29410 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))))))

(declare-fun b!51373 () Bool)

(assert (=> b!51373 (= e!33309 (arrayContainsKey!0 (_keys!3543 newMap!16) lt!21116 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10331 (not res!29409)) b!51372))

(assert (= (and b!51372 res!29410) b!51373))

(assert (=> d!10331 m!44115))

(declare-fun m!44175 () Bool)

(assert (=> b!51373 m!44175))

(assert (=> b!51297 d!10331))

(declare-fun b!51386 () Bool)

(declare-fun e!33316 () SeekEntryResult!216)

(declare-fun lt!21136 () SeekEntryResult!216)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3321 (_ BitVec 32)) SeekEntryResult!216)

(assert (=> b!51386 (= e!33316 (seekKeyOrZeroReturnVacant!0 (x!9348 lt!21136) (index!2988 lt!21136) (index!2988 lt!21136) (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) (_keys!3543 newMap!16) (mask!5733 newMap!16)))))

(declare-fun d!10333 () Bool)

(declare-fun lt!21135 () SeekEntryResult!216)

(assert (=> d!10333 (and (or ((_ is Undefined!216) lt!21135) (not ((_ is Found!216) lt!21135)) (and (bvsge (index!2987 lt!21135) #b00000000000000000000000000000000) (bvslt (index!2987 lt!21135) (size!1812 (_keys!3543 newMap!16))))) (or ((_ is Undefined!216) lt!21135) ((_ is Found!216) lt!21135) (not ((_ is MissingZero!216) lt!21135)) (and (bvsge (index!2986 lt!21135) #b00000000000000000000000000000000) (bvslt (index!2986 lt!21135) (size!1812 (_keys!3543 newMap!16))))) (or ((_ is Undefined!216) lt!21135) ((_ is Found!216) lt!21135) ((_ is MissingZero!216) lt!21135) (not ((_ is MissingVacant!216) lt!21135)) (and (bvsge (index!2989 lt!21135) #b00000000000000000000000000000000) (bvslt (index!2989 lt!21135) (size!1812 (_keys!3543 newMap!16))))) (or ((_ is Undefined!216) lt!21135) (ite ((_ is Found!216) lt!21135) (= (select (arr!1586 (_keys!3543 newMap!16)) (index!2987 lt!21135)) (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!216) lt!21135) (= (select (arr!1586 (_keys!3543 newMap!16)) (index!2986 lt!21135)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!216) lt!21135) (= (select (arr!1586 (_keys!3543 newMap!16)) (index!2989 lt!21135)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!33317 () SeekEntryResult!216)

(assert (=> d!10333 (= lt!21135 e!33317)))

(declare-fun c!6882 () Bool)

(assert (=> d!10333 (= c!6882 (and ((_ is Intermediate!216) lt!21136) (undefined!1028 lt!21136)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3321 (_ BitVec 32)) SeekEntryResult!216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10333 (= lt!21136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) (mask!5733 newMap!16)) (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) (_keys!3543 newMap!16) (mask!5733 newMap!16)))))

(assert (=> d!10333 (validMask!0 (mask!5733 newMap!16))))

(assert (=> d!10333 (= (seekEntryOrOpen!0 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000) (_keys!3543 newMap!16) (mask!5733 newMap!16)) lt!21135)))

(declare-fun b!51387 () Bool)

(declare-fun e!33318 () SeekEntryResult!216)

(assert (=> b!51387 (= e!33317 e!33318)))

(declare-fun lt!21134 () (_ BitVec 64))

(assert (=> b!51387 (= lt!21134 (select (arr!1586 (_keys!3543 newMap!16)) (index!2988 lt!21136)))))

(declare-fun c!6883 () Bool)

(assert (=> b!51387 (= c!6883 (= lt!21134 (select (arr!1586 (_keys!3543 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51388 () Bool)

(assert (=> b!51388 (= e!33317 Undefined!216)))

(declare-fun b!51389 () Bool)

(assert (=> b!51389 (= e!33316 (MissingZero!216 (index!2988 lt!21136)))))

(declare-fun b!51390 () Bool)

(declare-fun c!6884 () Bool)

(assert (=> b!51390 (= c!6884 (= lt!21134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51390 (= e!33318 e!33316)))

(declare-fun b!51391 () Bool)

(assert (=> b!51391 (= e!33318 (Found!216 (index!2988 lt!21136)))))

(assert (= (and d!10333 c!6882) b!51388))

(assert (= (and d!10333 (not c!6882)) b!51387))

(assert (= (and b!51387 c!6883) b!51391))

(assert (= (and b!51387 (not c!6883)) b!51390))

(assert (= (and b!51390 c!6884) b!51389))

(assert (= (and b!51390 (not c!6884)) b!51386))

(assert (=> b!51386 m!44115))

(declare-fun m!44177 () Bool)

(assert (=> b!51386 m!44177))

(declare-fun m!44179 () Bool)

(assert (=> d!10333 m!44179))

(declare-fun m!44181 () Bool)

(assert (=> d!10333 m!44181))

(declare-fun m!44183 () Bool)

(assert (=> d!10333 m!44183))

(assert (=> d!10333 m!44115))

(declare-fun m!44185 () Bool)

(assert (=> d!10333 m!44185))

(declare-fun m!44187 () Bool)

(assert (=> d!10333 m!44187))

(assert (=> d!10333 m!44141))

(assert (=> d!10333 m!44115))

(assert (=> d!10333 m!44183))

(declare-fun m!44189 () Bool)

(assert (=> b!51387 m!44189))

(assert (=> b!51297 d!10333))

(declare-fun bm!3927 () Bool)

(declare-fun call!3930 () (_ BitVec 32))

(assert (=> bm!3927 (= call!3930 (arrayCountValidKeys!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))))))

(declare-fun b!51392 () Bool)

(declare-fun e!33319 () (_ BitVec 32))

(assert (=> b!51392 (= e!33319 #b00000000000000000000000000000000)))

(declare-fun b!51393 () Bool)

(declare-fun e!33320 () (_ BitVec 32))

(assert (=> b!51393 (= e!33319 e!33320)))

(declare-fun c!6886 () Bool)

(assert (=> b!51393 (= c!6886 (validKeyInArray!0 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51394 () Bool)

(assert (=> b!51394 (= e!33320 (bvadd #b00000000000000000000000000000001 call!3930))))

(declare-fun b!51395 () Bool)

(assert (=> b!51395 (= e!33320 call!3930)))

(declare-fun d!10335 () Bool)

(declare-fun lt!21137 () (_ BitVec 32))

(assert (=> d!10335 (and (bvsge lt!21137 #b00000000000000000000000000000000) (bvsle lt!21137 (bvsub (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10335 (= lt!21137 e!33319)))

(declare-fun c!6885 () Bool)

(assert (=> d!10335 (= c!6885 (bvsge #b00000000000000000000000000000000 (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))))))

(assert (=> d!10335 (and (bvsle #b00000000000000000000000000000000 (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))))))

(assert (=> d!10335 (= (arrayCountValidKeys!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) #b00000000000000000000000000000000 (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))) lt!21137)))

(assert (= (and d!10335 c!6885) b!51392))

(assert (= (and d!10335 (not c!6885)) b!51393))

(assert (= (and b!51393 c!6886) b!51394))

(assert (= (and b!51393 (not c!6886)) b!51395))

(assert (= (or b!51394 b!51395) bm!3927))

(declare-fun m!44191 () Bool)

(assert (=> bm!3927 m!44191))

(assert (=> b!51393 m!44165))

(assert (=> b!51393 m!44165))

(assert (=> b!51393 m!44167))

(assert (=> b!51298 d!10335))

(declare-fun d!10337 () Bool)

(assert (=> d!10337 (= (size!1818 newMap!16) (bvadd (_size!264 newMap!16) (bvsdiv (bvadd (extraKeys!1820 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!51338 d!10337))

(assert (=> b!51295 d!10325))

(declare-fun bm!3928 () Bool)

(declare-fun call!3931 () Bool)

(assert (=> bm!3928 (= call!3931 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3543 (v!2187 (underlying!137 thiss!992))) (mask!5733 (v!2187 (underlying!137 thiss!992)))))))

(declare-fun b!51396 () Bool)

(declare-fun e!33322 () Bool)

(assert (=> b!51396 (= e!33322 call!3931)))

(declare-fun b!51397 () Bool)

(declare-fun e!33321 () Bool)

(assert (=> b!51397 (= e!33321 e!33322)))

(declare-fun c!6887 () Bool)

(assert (=> b!51397 (= c!6887 (validKeyInArray!0 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51399 () Bool)

(declare-fun e!33323 () Bool)

(assert (=> b!51399 (= e!33322 e!33323)))

(declare-fun lt!21139 () (_ BitVec 64))

(assert (=> b!51399 (= lt!21139 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21138 () Unit!1436)

(assert (=> b!51399 (= lt!21138 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) lt!21139 #b00000000000000000000000000000000))))

(assert (=> b!51399 (arrayContainsKey!0 (_keys!3543 (v!2187 (underlying!137 thiss!992))) lt!21139 #b00000000000000000000000000000000)))

(declare-fun lt!21140 () Unit!1436)

(assert (=> b!51399 (= lt!21140 lt!21138)))

(declare-fun res!29411 () Bool)

(assert (=> b!51399 (= res!29411 (= (seekEntryOrOpen!0 (select (arr!1586 (_keys!3543 (v!2187 (underlying!137 thiss!992)))) #b00000000000000000000000000000000) (_keys!3543 (v!2187 (underlying!137 thiss!992))) (mask!5733 (v!2187 (underlying!137 thiss!992)))) (Found!216 #b00000000000000000000000000000000)))))

(assert (=> b!51399 (=> (not res!29411) (not e!33323))))

(declare-fun d!10339 () Bool)

(declare-fun res!29412 () Bool)

(assert (=> d!10339 (=> res!29412 e!33321)))

(assert (=> d!10339 (= res!29412 (bvsge #b00000000000000000000000000000000 (size!1812 (_keys!3543 (v!2187 (underlying!137 thiss!992))))))))

(assert (=> d!10339 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3543 (v!2187 (underlying!137 thiss!992))) (mask!5733 (v!2187 (underlying!137 thiss!992)))) e!33321)))

(declare-fun b!51398 () Bool)

(assert (=> b!51398 (= e!33323 call!3931)))

(assert (= (and d!10339 (not res!29412)) b!51397))

(assert (= (and b!51397 c!6887) b!51399))

(assert (= (and b!51397 (not c!6887)) b!51396))

(assert (= (and b!51399 res!29411) b!51398))

(assert (= (or b!51398 b!51396) bm!3928))

(declare-fun m!44193 () Bool)

(assert (=> bm!3928 m!44193))

(assert (=> b!51397 m!44165))

(assert (=> b!51397 m!44165))

(assert (=> b!51397 m!44167))

(assert (=> b!51399 m!44165))

(declare-fun m!44195 () Bool)

(assert (=> b!51399 m!44195))

(declare-fun m!44197 () Bool)

(assert (=> b!51399 m!44197))

(assert (=> b!51399 m!44165))

(declare-fun m!44199 () Bool)

(assert (=> b!51399 m!44199))

(assert (=> b!51299 d!10339))

(assert (=> b!51337 d!10337))

(assert (=> b!51325 d!10325))

(assert (=> b!51315 d!10325))

(declare-fun bm!3929 () Bool)

(declare-fun call!3932 () Bool)

(assert (=> bm!3929 (= call!3932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3543 newMap!16) (mask!5733 newMap!16)))))

(declare-fun b!51400 () Bool)

(declare-fun e!33325 () Bool)

(assert (=> b!51400 (= e!33325 call!3932)))

(declare-fun b!51401 () Bool)

(declare-fun e!33324 () Bool)

(assert (=> b!51401 (= e!33324 e!33325)))

(declare-fun c!6888 () Bool)

(assert (=> b!51401 (= c!6888 (validKeyInArray!0 (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51403 () Bool)

(declare-fun e!33326 () Bool)

(assert (=> b!51403 (= e!33325 e!33326)))

(declare-fun lt!21142 () (_ BitVec 64))

(assert (=> b!51403 (= lt!21142 (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21141 () Unit!1436)

(assert (=> b!51403 (= lt!21141 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3543 newMap!16) lt!21142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51403 (arrayContainsKey!0 (_keys!3543 newMap!16) lt!21142 #b00000000000000000000000000000000)))

(declare-fun lt!21143 () Unit!1436)

(assert (=> b!51403 (= lt!21143 lt!21141)))

(declare-fun res!29413 () Bool)

(assert (=> b!51403 (= res!29413 (= (seekEntryOrOpen!0 (select (arr!1586 (_keys!3543 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3543 newMap!16) (mask!5733 newMap!16)) (Found!216 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51403 (=> (not res!29413) (not e!33326))))

(declare-fun d!10341 () Bool)

(declare-fun res!29414 () Bool)

(assert (=> d!10341 (=> res!29414 e!33324)))

(assert (=> d!10341 (= res!29414 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1812 (_keys!3543 newMap!16))))))

(assert (=> d!10341 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3543 newMap!16) (mask!5733 newMap!16)) e!33324)))

(declare-fun b!51402 () Bool)

(assert (=> b!51402 (= e!33326 call!3932)))

(assert (= (and d!10341 (not res!29414)) b!51401))

(assert (= (and b!51401 c!6888) b!51403))

(assert (= (and b!51401 (not c!6888)) b!51400))

(assert (= (and b!51403 res!29413) b!51402))

(assert (= (or b!51402 b!51400) bm!3929))

(declare-fun m!44201 () Bool)

(assert (=> bm!3929 m!44201))

(assert (=> b!51401 m!44157))

(assert (=> b!51401 m!44157))

(assert (=> b!51401 m!44159))

(assert (=> b!51403 m!44157))

(declare-fun m!44203 () Bool)

(assert (=> b!51403 m!44203))

(declare-fun m!44205 () Bool)

(assert (=> b!51403 m!44205))

(assert (=> b!51403 m!44157))

(declare-fun m!44207 () Bool)

(assert (=> b!51403 m!44207))

(assert (=> bm!3917 d!10341))

(declare-fun condMapEmpty!2297 () Bool)

(declare-fun mapDefault!2297 () ValueCell!761)

(assert (=> mapNonEmpty!2295 (= condMapEmpty!2297 (= mapRest!2295 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2297)))))

(declare-fun e!33328 () Bool)

(declare-fun mapRes!2297 () Bool)

(assert (=> mapNonEmpty!2295 (= tp!6867 (and e!33328 mapRes!2297))))

(declare-fun mapIsEmpty!2297 () Bool)

(assert (=> mapIsEmpty!2297 mapRes!2297))

(declare-fun b!51404 () Bool)

(declare-fun e!33327 () Bool)

(assert (=> b!51404 (= e!33327 tp_is_empty!2209)))

(declare-fun b!51405 () Bool)

(assert (=> b!51405 (= e!33328 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2297 () Bool)

(declare-fun tp!6869 () Bool)

(assert (=> mapNonEmpty!2297 (= mapRes!2297 (and tp!6869 e!33327))))

(declare-fun mapValue!2297 () ValueCell!761)

(declare-fun mapKey!2297 () (_ BitVec 32))

(declare-fun mapRest!2297 () (Array (_ BitVec 32) ValueCell!761))

(assert (=> mapNonEmpty!2297 (= mapRest!2295 (store mapRest!2297 mapKey!2297 mapValue!2297))))

(assert (= (and mapNonEmpty!2295 condMapEmpty!2297) mapIsEmpty!2297))

(assert (= (and mapNonEmpty!2295 (not condMapEmpty!2297)) mapNonEmpty!2297))

(assert (= (and mapNonEmpty!2297 ((_ is ValueCellFull!761) mapValue!2297)) b!51404))

(assert (= (and mapNonEmpty!2295 ((_ is ValueCellFull!761) mapDefault!2297)) b!51405))

(declare-fun m!44209 () Bool)

(assert (=> mapNonEmpty!2297 m!44209))

(declare-fun condMapEmpty!2298 () Bool)

(declare-fun mapDefault!2298 () ValueCell!761)

(assert (=> mapNonEmpty!2296 (= condMapEmpty!2298 (= mapRest!2296 ((as const (Array (_ BitVec 32) ValueCell!761)) mapDefault!2298)))))

(declare-fun e!33330 () Bool)

(declare-fun mapRes!2298 () Bool)

(assert (=> mapNonEmpty!2296 (= tp!6868 (and e!33330 mapRes!2298))))

(declare-fun mapIsEmpty!2298 () Bool)

(assert (=> mapIsEmpty!2298 mapRes!2298))

(declare-fun b!51406 () Bool)

(declare-fun e!33329 () Bool)

(assert (=> b!51406 (= e!33329 tp_is_empty!2209)))

(declare-fun b!51407 () Bool)

(assert (=> b!51407 (= e!33330 tp_is_empty!2209)))

(declare-fun mapNonEmpty!2298 () Bool)

(declare-fun tp!6870 () Bool)

(assert (=> mapNonEmpty!2298 (= mapRes!2298 (and tp!6870 e!33329))))

(declare-fun mapKey!2298 () (_ BitVec 32))

(declare-fun mapRest!2298 () (Array (_ BitVec 32) ValueCell!761))

(declare-fun mapValue!2298 () ValueCell!761)

(assert (=> mapNonEmpty!2298 (= mapRest!2296 (store mapRest!2298 mapKey!2298 mapValue!2298))))

(assert (= (and mapNonEmpty!2296 condMapEmpty!2298) mapIsEmpty!2298))

(assert (= (and mapNonEmpty!2296 (not condMapEmpty!2298)) mapNonEmpty!2298))

(assert (= (and mapNonEmpty!2298 ((_ is ValueCellFull!761) mapValue!2298)) b!51406))

(assert (= (and mapNonEmpty!2296 ((_ is ValueCellFull!761) mapDefault!2298)) b!51407))

(declare-fun m!44211 () Bool)

(assert (=> mapNonEmpty!2298 m!44211))

(check-sat b_and!2793 (not b_next!1587) (not b_next!1585) (not b!51346) (not bm!3929) (not b!51363) b_and!2795 (not b!51364) (not b!51401) (not b!51362) (not bm!3925) (not d!10317) (not bm!3926) (not b!51386) tp_is_empty!2209 (not mapNonEmpty!2297) (not b!51345) (not b!51397) (not d!10315) (not d!10333) (not bm!3924) (not b!51355) (not b!51359) (not b!51403) (not mapNonEmpty!2298) (not b!51373) (not bm!3927) (not d!10329) (not b!51353) (not bm!3928) (not b!51367) (not b!51399) (not b!51358) (not b!51393))
(check-sat b_and!2793 b_and!2795 (not b_next!1585) (not b_next!1587))
