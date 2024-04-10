; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8092 () Bool)

(assert start!8092)

(declare-fun b!50997 () Bool)

(declare-fun b_free!1577 () Bool)

(declare-fun b_next!1577 () Bool)

(assert (=> b!50997 (= b_free!1577 (not b_next!1577))))

(declare-fun tp!6806 () Bool)

(declare-fun b_and!2787 () Bool)

(assert (=> b!50997 (= tp!6806 b_and!2787)))

(declare-fun b!50990 () Bool)

(declare-fun b_free!1579 () Bool)

(declare-fun b_next!1579 () Bool)

(assert (=> b!50990 (= b_free!1579 (not b_next!1579))))

(declare-fun tp!6805 () Bool)

(declare-fun b_and!2789 () Bool)

(assert (=> b!50990 (= tp!6805 b_and!2789)))

(declare-fun b!50988 () Bool)

(declare-fun e!33028 () Bool)

(declare-fun tp_is_empty!2205 () Bool)

(assert (=> b!50988 (= e!33028 tp_is_empty!2205)))

(declare-fun b!50989 () Bool)

(declare-fun res!29247 () Bool)

(declare-fun e!33030 () Bool)

(assert (=> b!50989 (=> (not res!29247) (not e!33030))))

(declare-datatypes ((V!2587 0))(
  ( (V!2588 (val!1147 Int)) )
))
(declare-datatypes ((array!3325 0))(
  ( (array!3326 (arr!1589 (Array (_ BitVec 32) (_ BitVec 64))) (size!1814 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!759 0))(
  ( (ValueCellFull!759 (v!2181 V!2587)) (EmptyCell!759) )
))
(declare-datatypes ((array!3327 0))(
  ( (array!3328 (arr!1590 (Array (_ BitVec 32) ValueCell!759)) (size!1815 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!426 0))(
  ( (LongMapFixedSize!427 (defaultEntry!1927 Int) (mask!5726 (_ BitVec 32)) (extraKeys!1818 (_ BitVec 32)) (zeroValue!1845 V!2587) (minValue!1845 V!2587) (_size!262 (_ BitVec 32)) (_keys!3539 array!3325) (_values!1910 array!3327) (_vacant!262 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!426)

(declare-fun valid!144 (LongMapFixedSize!426) Bool)

(assert (=> b!50989 (= res!29247 (valid!144 newMap!16))))

(declare-fun e!33022 () Bool)

(declare-fun e!33024 () Bool)

(declare-fun array_inv!975 (array!3325) Bool)

(declare-fun array_inv!976 (array!3327) Bool)

(assert (=> b!50990 (= e!33022 (and tp!6805 tp_is_empty!2205 (array_inv!975 (_keys!3539 newMap!16)) (array_inv!976 (_values!1910 newMap!16)) e!33024))))

(declare-fun b!50991 () Bool)

(declare-fun e!33020 () Bool)

(assert (=> b!50991 (= e!33020 tp_is_empty!2205)))

(declare-fun b!50992 () Bool)

(declare-fun e!33019 () Bool)

(declare-fun e!33029 () Bool)

(assert (=> b!50992 (= e!33019 e!33029)))

(declare-fun b!50993 () Bool)

(declare-fun res!29246 () Bool)

(assert (=> b!50993 (=> (not res!29246) (not e!33030))))

(declare-datatypes ((Cell!250 0))(
  ( (Cell!251 (v!2182 LongMapFixedSize!426)) )
))
(declare-datatypes ((LongMap!250 0))(
  ( (LongMap!251 (underlying!136 Cell!250)) )
))
(declare-fun thiss!992 () LongMap!250)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50993 (= res!29246 (validMask!0 (mask!5726 (v!2182 (underlying!136 thiss!992)))))))

(declare-fun b!50994 () Bool)

(declare-fun e!33031 () Bool)

(assert (=> b!50994 (= e!33031 tp_is_empty!2205)))

(declare-fun b!50995 () Bool)

(declare-fun e!33023 () Bool)

(declare-fun mapRes!2257 () Bool)

(assert (=> b!50995 (= e!33023 (and e!33028 mapRes!2257))))

(declare-fun condMapEmpty!2257 () Bool)

(declare-fun mapDefault!2258 () ValueCell!759)

(assert (=> b!50995 (= condMapEmpty!2257 (= (arr!1590 (_values!1910 (v!2182 (underlying!136 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2258)))))

(declare-fun b!50996 () Bool)

(declare-fun res!29248 () Bool)

(assert (=> b!50996 (=> (not res!29248) (not e!33030))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50996 (= res!29248 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992)))))))))

(assert (=> b!50997 (= e!33029 (and tp!6806 tp_is_empty!2205 (array_inv!975 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) (array_inv!976 (_values!1910 (v!2182 (underlying!136 thiss!992)))) e!33023))))

(declare-fun b!50999 () Bool)

(declare-fun res!29249 () Bool)

(assert (=> b!50999 (=> (not res!29249) (not e!33030))))

(assert (=> b!50999 (= res!29249 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5726 newMap!16)) (_size!262 (v!2182 (underlying!136 thiss!992)))))))

(declare-fun mapNonEmpty!2257 () Bool)

(declare-fun tp!6803 () Bool)

(assert (=> mapNonEmpty!2257 (= mapRes!2257 (and tp!6803 e!33031))))

(declare-fun mapKey!2258 () (_ BitVec 32))

(declare-fun mapRest!2258 () (Array (_ BitVec 32) ValueCell!759))

(declare-fun mapValue!2257 () ValueCell!759)

(assert (=> mapNonEmpty!2257 (= (arr!1590 (_values!1910 (v!2182 (underlying!136 thiss!992)))) (store mapRest!2258 mapKey!2258 mapValue!2257))))

(declare-fun mapIsEmpty!2257 () Bool)

(assert (=> mapIsEmpty!2257 mapRes!2257))

(declare-fun mapIsEmpty!2258 () Bool)

(declare-fun mapRes!2258 () Bool)

(assert (=> mapIsEmpty!2258 mapRes!2258))

(declare-fun mapNonEmpty!2258 () Bool)

(declare-fun tp!6804 () Bool)

(declare-fun e!33025 () Bool)

(assert (=> mapNonEmpty!2258 (= mapRes!2258 (and tp!6804 e!33025))))

(declare-fun mapValue!2258 () ValueCell!759)

(declare-fun mapKey!2257 () (_ BitVec 32))

(declare-fun mapRest!2257 () (Array (_ BitVec 32) ValueCell!759))

(assert (=> mapNonEmpty!2258 (= (arr!1590 (_values!1910 newMap!16)) (store mapRest!2257 mapKey!2257 mapValue!2258))))

(declare-fun b!51000 () Bool)

(assert (=> b!51000 (= e!33025 tp_is_empty!2205)))

(declare-fun b!51001 () Bool)

(assert (=> b!51001 (= e!33030 (and (= (size!1815 (_values!1910 (v!2182 (underlying!136 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5726 (v!2182 (underlying!136 thiss!992))))) (= (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) (size!1815 (_values!1910 (v!2182 (underlying!136 thiss!992))))) (bvsge (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!1818 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!51002 () Bool)

(assert (=> b!51002 (= e!33024 (and e!33020 mapRes!2258))))

(declare-fun condMapEmpty!2258 () Bool)

(declare-fun mapDefault!2257 () ValueCell!759)

(assert (=> b!51002 (= condMapEmpty!2258 (= (arr!1590 (_values!1910 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2257)))))

(declare-fun b!50998 () Bool)

(declare-fun e!33027 () Bool)

(assert (=> b!50998 (= e!33027 e!33019)))

(declare-fun res!29245 () Bool)

(assert (=> start!8092 (=> (not res!29245) (not e!33030))))

(declare-fun valid!145 (LongMap!250) Bool)

(assert (=> start!8092 (= res!29245 (valid!145 thiss!992))))

(assert (=> start!8092 e!33030))

(assert (=> start!8092 e!33027))

(assert (=> start!8092 true))

(assert (=> start!8092 e!33022))

(assert (= (and start!8092 res!29245) b!50996))

(assert (= (and b!50996 res!29248) b!50989))

(assert (= (and b!50989 res!29247) b!50999))

(assert (= (and b!50999 res!29249) b!50993))

(assert (= (and b!50993 res!29246) b!51001))

(assert (= (and b!50995 condMapEmpty!2257) mapIsEmpty!2257))

(assert (= (and b!50995 (not condMapEmpty!2257)) mapNonEmpty!2257))

(get-info :version)

(assert (= (and mapNonEmpty!2257 ((_ is ValueCellFull!759) mapValue!2257)) b!50994))

(assert (= (and b!50995 ((_ is ValueCellFull!759) mapDefault!2258)) b!50988))

(assert (= b!50997 b!50995))

(assert (= b!50992 b!50997))

(assert (= b!50998 b!50992))

(assert (= start!8092 b!50998))

(assert (= (and b!51002 condMapEmpty!2258) mapIsEmpty!2258))

(assert (= (and b!51002 (not condMapEmpty!2258)) mapNonEmpty!2258))

(assert (= (and mapNonEmpty!2258 ((_ is ValueCellFull!759) mapValue!2258)) b!51000))

(assert (= (and b!51002 ((_ is ValueCellFull!759) mapDefault!2257)) b!50991))

(assert (= b!50990 b!51002))

(assert (= start!8092 b!50990))

(declare-fun m!44019 () Bool)

(assert (=> start!8092 m!44019))

(declare-fun m!44021 () Bool)

(assert (=> mapNonEmpty!2258 m!44021))

(declare-fun m!44023 () Bool)

(assert (=> b!50989 m!44023))

(declare-fun m!44025 () Bool)

(assert (=> b!50993 m!44025))

(declare-fun m!44027 () Bool)

(assert (=> b!50990 m!44027))

(declare-fun m!44029 () Bool)

(assert (=> b!50990 m!44029))

(declare-fun m!44031 () Bool)

(assert (=> b!50997 m!44031))

(declare-fun m!44033 () Bool)

(assert (=> b!50997 m!44033))

(declare-fun m!44035 () Bool)

(assert (=> mapNonEmpty!2257 m!44035))

(check-sat (not b_next!1579) (not b!50993) (not mapNonEmpty!2258) (not b!50990) (not b!50997) (not b_next!1577) b_and!2789 (not b!50989) tp_is_empty!2205 (not mapNonEmpty!2257) (not start!8092) b_and!2787)
(check-sat b_and!2787 b_and!2789 (not b_next!1577) (not b_next!1579))
(get-model)

(declare-fun d!10251 () Bool)

(assert (=> d!10251 (= (validMask!0 (mask!5726 (v!2182 (underlying!136 thiss!992)))) (and (or (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000001111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000011111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000001111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000011111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000001111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000011111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000001111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000011111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000001111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000011111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000001111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000011111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000001111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000011111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000111111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000001111111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000011111111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000111111111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00001111111111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00011111111111111111111111111111) (= (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50993 d!10251))

(declare-fun d!10253 () Bool)

(assert (=> d!10253 (= (array_inv!975 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) (bvsge (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50997 d!10253))

(declare-fun d!10255 () Bool)

(assert (=> d!10255 (= (array_inv!976 (_values!1910 (v!2182 (underlying!136 thiss!992)))) (bvsge (size!1815 (_values!1910 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50997 d!10255))

(declare-fun d!10257 () Bool)

(assert (=> d!10257 (= (array_inv!975 (_keys!3539 newMap!16)) (bvsge (size!1814 (_keys!3539 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50990 d!10257))

(declare-fun d!10259 () Bool)

(assert (=> d!10259 (= (array_inv!976 (_values!1910 newMap!16)) (bvsge (size!1815 (_values!1910 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50990 d!10259))

(declare-fun d!10261 () Bool)

(declare-fun res!29271 () Bool)

(declare-fun e!33073 () Bool)

(assert (=> d!10261 (=> (not res!29271) (not e!33073))))

(declare-fun simpleValid!36 (LongMapFixedSize!426) Bool)

(assert (=> d!10261 (= res!29271 (simpleValid!36 newMap!16))))

(assert (=> d!10261 (= (valid!144 newMap!16) e!33073)))

(declare-fun b!51054 () Bool)

(declare-fun res!29272 () Bool)

(assert (=> b!51054 (=> (not res!29272) (not e!33073))))

(declare-fun arrayCountValidKeys!0 (array!3325 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51054 (= res!29272 (= (arrayCountValidKeys!0 (_keys!3539 newMap!16) #b00000000000000000000000000000000 (size!1814 (_keys!3539 newMap!16))) (_size!262 newMap!16)))))

(declare-fun b!51055 () Bool)

(declare-fun res!29273 () Bool)

(assert (=> b!51055 (=> (not res!29273) (not e!33073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3325 (_ BitVec 32)) Bool)

(assert (=> b!51055 (= res!29273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3539 newMap!16) (mask!5726 newMap!16)))))

(declare-fun b!51056 () Bool)

(declare-datatypes ((List!1331 0))(
  ( (Nil!1328) (Cons!1327 (h!1907 (_ BitVec 64)) (t!4365 List!1331)) )
))
(declare-fun arrayNoDuplicates!0 (array!3325 (_ BitVec 32) List!1331) Bool)

(assert (=> b!51056 (= e!33073 (arrayNoDuplicates!0 (_keys!3539 newMap!16) #b00000000000000000000000000000000 Nil!1328))))

(assert (= (and d!10261 res!29271) b!51054))

(assert (= (and b!51054 res!29272) b!51055))

(assert (= (and b!51055 res!29273) b!51056))

(declare-fun m!44055 () Bool)

(assert (=> d!10261 m!44055))

(declare-fun m!44057 () Bool)

(assert (=> b!51054 m!44057))

(declare-fun m!44059 () Bool)

(assert (=> b!51055 m!44059))

(declare-fun m!44061 () Bool)

(assert (=> b!51056 m!44061))

(assert (=> b!50989 d!10261))

(declare-fun d!10263 () Bool)

(assert (=> d!10263 (= (valid!145 thiss!992) (valid!144 (v!2182 (underlying!136 thiss!992))))))

(declare-fun bs!2371 () Bool)

(assert (= bs!2371 d!10263))

(declare-fun m!44063 () Bool)

(assert (=> bs!2371 m!44063))

(assert (=> start!8092 d!10263))

(declare-fun mapNonEmpty!2267 () Bool)

(declare-fun mapRes!2267 () Bool)

(declare-fun tp!6821 () Bool)

(declare-fun e!33078 () Bool)

(assert (=> mapNonEmpty!2267 (= mapRes!2267 (and tp!6821 e!33078))))

(declare-fun mapRest!2267 () (Array (_ BitVec 32) ValueCell!759))

(declare-fun mapValue!2267 () ValueCell!759)

(declare-fun mapKey!2267 () (_ BitVec 32))

(assert (=> mapNonEmpty!2267 (= mapRest!2257 (store mapRest!2267 mapKey!2267 mapValue!2267))))

(declare-fun condMapEmpty!2267 () Bool)

(declare-fun mapDefault!2267 () ValueCell!759)

(assert (=> mapNonEmpty!2258 (= condMapEmpty!2267 (= mapRest!2257 ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2267)))))

(declare-fun e!33079 () Bool)

(assert (=> mapNonEmpty!2258 (= tp!6804 (and e!33079 mapRes!2267))))

(declare-fun mapIsEmpty!2267 () Bool)

(assert (=> mapIsEmpty!2267 mapRes!2267))

(declare-fun b!51064 () Bool)

(assert (=> b!51064 (= e!33079 tp_is_empty!2205)))

(declare-fun b!51063 () Bool)

(assert (=> b!51063 (= e!33078 tp_is_empty!2205)))

(assert (= (and mapNonEmpty!2258 condMapEmpty!2267) mapIsEmpty!2267))

(assert (= (and mapNonEmpty!2258 (not condMapEmpty!2267)) mapNonEmpty!2267))

(assert (= (and mapNonEmpty!2267 ((_ is ValueCellFull!759) mapValue!2267)) b!51063))

(assert (= (and mapNonEmpty!2258 ((_ is ValueCellFull!759) mapDefault!2267)) b!51064))

(declare-fun m!44065 () Bool)

(assert (=> mapNonEmpty!2267 m!44065))

(declare-fun mapNonEmpty!2268 () Bool)

(declare-fun mapRes!2268 () Bool)

(declare-fun tp!6822 () Bool)

(declare-fun e!33080 () Bool)

(assert (=> mapNonEmpty!2268 (= mapRes!2268 (and tp!6822 e!33080))))

(declare-fun mapRest!2268 () (Array (_ BitVec 32) ValueCell!759))

(declare-fun mapKey!2268 () (_ BitVec 32))

(declare-fun mapValue!2268 () ValueCell!759)

(assert (=> mapNonEmpty!2268 (= mapRest!2258 (store mapRest!2268 mapKey!2268 mapValue!2268))))

(declare-fun condMapEmpty!2268 () Bool)

(declare-fun mapDefault!2268 () ValueCell!759)

(assert (=> mapNonEmpty!2257 (= condMapEmpty!2268 (= mapRest!2258 ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2268)))))

(declare-fun e!33081 () Bool)

(assert (=> mapNonEmpty!2257 (= tp!6803 (and e!33081 mapRes!2268))))

(declare-fun mapIsEmpty!2268 () Bool)

(assert (=> mapIsEmpty!2268 mapRes!2268))

(declare-fun b!51066 () Bool)

(assert (=> b!51066 (= e!33081 tp_is_empty!2205)))

(declare-fun b!51065 () Bool)

(assert (=> b!51065 (= e!33080 tp_is_empty!2205)))

(assert (= (and mapNonEmpty!2257 condMapEmpty!2268) mapIsEmpty!2268))

(assert (= (and mapNonEmpty!2257 (not condMapEmpty!2268)) mapNonEmpty!2268))

(assert (= (and mapNonEmpty!2268 ((_ is ValueCellFull!759) mapValue!2268)) b!51065))

(assert (= (and mapNonEmpty!2257 ((_ is ValueCellFull!759) mapDefault!2268)) b!51066))

(declare-fun m!44067 () Bool)

(assert (=> mapNonEmpty!2268 m!44067))

(check-sat (not b_next!1579) (not mapNonEmpty!2268) (not b!51055) b_and!2789 tp_is_empty!2205 (not b!51056) (not d!10263) (not d!10261) (not b!51054) b_and!2787 (not b_next!1577) (not mapNonEmpty!2267))
(check-sat b_and!2787 b_and!2789 (not b_next!1577) (not b_next!1579))
(get-model)

(declare-fun b!51075 () Bool)

(declare-fun res!29283 () Bool)

(declare-fun e!33084 () Bool)

(assert (=> b!51075 (=> (not res!29283) (not e!33084))))

(assert (=> b!51075 (= res!29283 (and (= (size!1815 (_values!1910 newMap!16)) (bvadd (mask!5726 newMap!16) #b00000000000000000000000000000001)) (= (size!1814 (_keys!3539 newMap!16)) (size!1815 (_values!1910 newMap!16))) (bvsge (_size!262 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!262 newMap!16) (bvadd (mask!5726 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!51078 () Bool)

(assert (=> b!51078 (= e!33084 (and (bvsge (extraKeys!1818 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1818 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!262 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51076 () Bool)

(declare-fun res!29285 () Bool)

(assert (=> b!51076 (=> (not res!29285) (not e!33084))))

(declare-fun size!1818 (LongMapFixedSize!426) (_ BitVec 32))

(assert (=> b!51076 (= res!29285 (bvsge (size!1818 newMap!16) (_size!262 newMap!16)))))

(declare-fun b!51077 () Bool)

(declare-fun res!29282 () Bool)

(assert (=> b!51077 (=> (not res!29282) (not e!33084))))

(assert (=> b!51077 (= res!29282 (= (size!1818 newMap!16) (bvadd (_size!262 newMap!16) (bvsdiv (bvadd (extraKeys!1818 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10265 () Bool)

(declare-fun res!29284 () Bool)

(assert (=> d!10265 (=> (not res!29284) (not e!33084))))

(assert (=> d!10265 (= res!29284 (validMask!0 (mask!5726 newMap!16)))))

(assert (=> d!10265 (= (simpleValid!36 newMap!16) e!33084)))

(assert (= (and d!10265 res!29284) b!51075))

(assert (= (and b!51075 res!29283) b!51076))

(assert (= (and b!51076 res!29285) b!51077))

(assert (= (and b!51077 res!29282) b!51078))

(declare-fun m!44069 () Bool)

(assert (=> b!51076 m!44069))

(assert (=> b!51077 m!44069))

(declare-fun m!44071 () Bool)

(assert (=> d!10265 m!44071))

(assert (=> d!10261 d!10265))

(declare-fun bm!3916 () Bool)

(declare-fun call!3919 () (_ BitVec 32))

(assert (=> bm!3916 (= call!3919 (arrayCountValidKeys!0 (_keys!3539 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))))))

(declare-fun d!10267 () Bool)

(declare-fun lt!21119 () (_ BitVec 32))

(assert (=> d!10267 (and (bvsge lt!21119 #b00000000000000000000000000000000) (bvsle lt!21119 (bvsub (size!1814 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33089 () (_ BitVec 32))

(assert (=> d!10267 (= lt!21119 e!33089)))

(declare-fun c!6852 () Bool)

(assert (=> d!10267 (= c!6852 (bvsge #b00000000000000000000000000000000 (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10267 (and (bvsle #b00000000000000000000000000000000 (size!1814 (_keys!3539 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1814 (_keys!3539 newMap!16)) (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10267 (= (arrayCountValidKeys!0 (_keys!3539 newMap!16) #b00000000000000000000000000000000 (size!1814 (_keys!3539 newMap!16))) lt!21119)))

(declare-fun b!51087 () Bool)

(declare-fun e!33090 () (_ BitVec 32))

(assert (=> b!51087 (= e!33090 (bvadd #b00000000000000000000000000000001 call!3919))))

(declare-fun b!51088 () Bool)

(assert (=> b!51088 (= e!33089 #b00000000000000000000000000000000)))

(declare-fun b!51089 () Bool)

(assert (=> b!51089 (= e!33090 call!3919)))

(declare-fun b!51090 () Bool)

(assert (=> b!51090 (= e!33089 e!33090)))

(declare-fun c!6851 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51090 (= c!6851 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10267 c!6852) b!51088))

(assert (= (and d!10267 (not c!6852)) b!51090))

(assert (= (and b!51090 c!6851) b!51087))

(assert (= (and b!51090 (not c!6851)) b!51089))

(assert (= (or b!51087 b!51089) bm!3916))

(declare-fun m!44073 () Bool)

(assert (=> bm!3916 m!44073))

(declare-fun m!44075 () Bool)

(assert (=> b!51090 m!44075))

(assert (=> b!51090 m!44075))

(declare-fun m!44077 () Bool)

(assert (=> b!51090 m!44077))

(assert (=> b!51054 d!10267))

(declare-fun d!10269 () Bool)

(declare-fun res!29293 () Bool)

(declare-fun e!33102 () Bool)

(assert (=> d!10269 (=> res!29293 e!33102)))

(assert (=> d!10269 (= res!29293 (bvsge #b00000000000000000000000000000000 (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10269 (= (arrayNoDuplicates!0 (_keys!3539 newMap!16) #b00000000000000000000000000000000 Nil!1328) e!33102)))

(declare-fun b!51101 () Bool)

(declare-fun e!33100 () Bool)

(declare-fun call!3922 () Bool)

(assert (=> b!51101 (= e!33100 call!3922)))

(declare-fun b!51102 () Bool)

(declare-fun e!33099 () Bool)

(assert (=> b!51102 (= e!33099 e!33100)))

(declare-fun c!6855 () Bool)

(assert (=> b!51102 (= c!6855 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3919 () Bool)

(assert (=> bm!3919 (= call!3922 (arrayNoDuplicates!0 (_keys!3539 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6855 (Cons!1327 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) Nil!1328) Nil!1328)))))

(declare-fun b!51103 () Bool)

(declare-fun e!33101 () Bool)

(declare-fun contains!621 (List!1331 (_ BitVec 64)) Bool)

(assert (=> b!51103 (= e!33101 (contains!621 Nil!1328 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51104 () Bool)

(assert (=> b!51104 (= e!33100 call!3922)))

(declare-fun b!51105 () Bool)

(assert (=> b!51105 (= e!33102 e!33099)))

(declare-fun res!29294 () Bool)

(assert (=> b!51105 (=> (not res!29294) (not e!33099))))

(assert (=> b!51105 (= res!29294 (not e!33101))))

(declare-fun res!29292 () Bool)

(assert (=> b!51105 (=> (not res!29292) (not e!33101))))

(assert (=> b!51105 (= res!29292 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10269 (not res!29293)) b!51105))

(assert (= (and b!51105 res!29292) b!51103))

(assert (= (and b!51105 res!29294) b!51102))

(assert (= (and b!51102 c!6855) b!51101))

(assert (= (and b!51102 (not c!6855)) b!51104))

(assert (= (or b!51101 b!51104) bm!3919))

(assert (=> b!51102 m!44075))

(assert (=> b!51102 m!44075))

(assert (=> b!51102 m!44077))

(assert (=> bm!3919 m!44075))

(declare-fun m!44079 () Bool)

(assert (=> bm!3919 m!44079))

(assert (=> b!51103 m!44075))

(assert (=> b!51103 m!44075))

(declare-fun m!44081 () Bool)

(assert (=> b!51103 m!44081))

(assert (=> b!51105 m!44075))

(assert (=> b!51105 m!44075))

(assert (=> b!51105 m!44077))

(assert (=> b!51056 d!10269))

(declare-fun bm!3922 () Bool)

(declare-fun call!3925 () Bool)

(assert (=> bm!3922 (= call!3925 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3539 newMap!16) (mask!5726 newMap!16)))))

(declare-fun d!10271 () Bool)

(declare-fun res!29300 () Bool)

(declare-fun e!33110 () Bool)

(assert (=> d!10271 (=> res!29300 e!33110)))

(assert (=> d!10271 (= res!29300 (bvsge #b00000000000000000000000000000000 (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3539 newMap!16) (mask!5726 newMap!16)) e!33110)))

(declare-fun b!51114 () Bool)

(declare-fun e!33111 () Bool)

(declare-fun e!33109 () Bool)

(assert (=> b!51114 (= e!33111 e!33109)))

(declare-fun lt!21128 () (_ BitVec 64))

(assert (=> b!51114 (= lt!21128 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1423 0))(
  ( (Unit!1424) )
))
(declare-fun lt!21126 () Unit!1423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3325 (_ BitVec 64) (_ BitVec 32)) Unit!1423)

(assert (=> b!51114 (= lt!21126 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3539 newMap!16) lt!21128 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51114 (arrayContainsKey!0 (_keys!3539 newMap!16) lt!21128 #b00000000000000000000000000000000)))

(declare-fun lt!21127 () Unit!1423)

(assert (=> b!51114 (= lt!21127 lt!21126)))

(declare-fun res!29299 () Bool)

(declare-datatypes ((SeekEntryResult!221 0))(
  ( (MissingZero!221 (index!3006 (_ BitVec 32))) (Found!221 (index!3007 (_ BitVec 32))) (Intermediate!221 (undefined!1033 Bool) (index!3008 (_ BitVec 32)) (x!9307 (_ BitVec 32))) (Undefined!221) (MissingVacant!221 (index!3009 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3325 (_ BitVec 32)) SeekEntryResult!221)

(assert (=> b!51114 (= res!29299 (= (seekEntryOrOpen!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) (_keys!3539 newMap!16) (mask!5726 newMap!16)) (Found!221 #b00000000000000000000000000000000)))))

(assert (=> b!51114 (=> (not res!29299) (not e!33109))))

(declare-fun b!51115 () Bool)

(assert (=> b!51115 (= e!33111 call!3925)))

(declare-fun b!51116 () Bool)

(assert (=> b!51116 (= e!33109 call!3925)))

(declare-fun b!51117 () Bool)

(assert (=> b!51117 (= e!33110 e!33111)))

(declare-fun c!6858 () Bool)

(assert (=> b!51117 (= c!6858 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10271 (not res!29300)) b!51117))

(assert (= (and b!51117 c!6858) b!51114))

(assert (= (and b!51117 (not c!6858)) b!51115))

(assert (= (and b!51114 res!29299) b!51116))

(assert (= (or b!51116 b!51115) bm!3922))

(declare-fun m!44083 () Bool)

(assert (=> bm!3922 m!44083))

(assert (=> b!51114 m!44075))

(declare-fun m!44085 () Bool)

(assert (=> b!51114 m!44085))

(declare-fun m!44087 () Bool)

(assert (=> b!51114 m!44087))

(assert (=> b!51114 m!44075))

(declare-fun m!44089 () Bool)

(assert (=> b!51114 m!44089))

(assert (=> b!51117 m!44075))

(assert (=> b!51117 m!44075))

(assert (=> b!51117 m!44077))

(assert (=> b!51055 d!10271))

(declare-fun d!10273 () Bool)

(declare-fun res!29301 () Bool)

(declare-fun e!33112 () Bool)

(assert (=> d!10273 (=> (not res!29301) (not e!33112))))

(assert (=> d!10273 (= res!29301 (simpleValid!36 (v!2182 (underlying!136 thiss!992))))))

(assert (=> d!10273 (= (valid!144 (v!2182 (underlying!136 thiss!992))) e!33112)))

(declare-fun b!51118 () Bool)

(declare-fun res!29302 () Bool)

(assert (=> b!51118 (=> (not res!29302) (not e!33112))))

(assert (=> b!51118 (= res!29302 (= (arrayCountValidKeys!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000 (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))) (_size!262 (v!2182 (underlying!136 thiss!992)))))))

(declare-fun b!51119 () Bool)

(declare-fun res!29303 () Bool)

(assert (=> b!51119 (=> (not res!29303) (not e!33112))))

(assert (=> b!51119 (= res!29303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3539 (v!2182 (underlying!136 thiss!992))) (mask!5726 (v!2182 (underlying!136 thiss!992)))))))

(declare-fun b!51120 () Bool)

(assert (=> b!51120 (= e!33112 (arrayNoDuplicates!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000 Nil!1328))))

(assert (= (and d!10273 res!29301) b!51118))

(assert (= (and b!51118 res!29302) b!51119))

(assert (= (and b!51119 res!29303) b!51120))

(declare-fun m!44091 () Bool)

(assert (=> d!10273 m!44091))

(declare-fun m!44093 () Bool)

(assert (=> b!51118 m!44093))

(declare-fun m!44095 () Bool)

(assert (=> b!51119 m!44095))

(declare-fun m!44097 () Bool)

(assert (=> b!51120 m!44097))

(assert (=> d!10263 d!10273))

(declare-fun mapNonEmpty!2269 () Bool)

(declare-fun mapRes!2269 () Bool)

(declare-fun tp!6823 () Bool)

(declare-fun e!33113 () Bool)

(assert (=> mapNonEmpty!2269 (= mapRes!2269 (and tp!6823 e!33113))))

(declare-fun mapValue!2269 () ValueCell!759)

(declare-fun mapRest!2269 () (Array (_ BitVec 32) ValueCell!759))

(declare-fun mapKey!2269 () (_ BitVec 32))

(assert (=> mapNonEmpty!2269 (= mapRest!2267 (store mapRest!2269 mapKey!2269 mapValue!2269))))

(declare-fun condMapEmpty!2269 () Bool)

(declare-fun mapDefault!2269 () ValueCell!759)

(assert (=> mapNonEmpty!2267 (= condMapEmpty!2269 (= mapRest!2267 ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2269)))))

(declare-fun e!33114 () Bool)

(assert (=> mapNonEmpty!2267 (= tp!6821 (and e!33114 mapRes!2269))))

(declare-fun mapIsEmpty!2269 () Bool)

(assert (=> mapIsEmpty!2269 mapRes!2269))

(declare-fun b!51122 () Bool)

(assert (=> b!51122 (= e!33114 tp_is_empty!2205)))

(declare-fun b!51121 () Bool)

(assert (=> b!51121 (= e!33113 tp_is_empty!2205)))

(assert (= (and mapNonEmpty!2267 condMapEmpty!2269) mapIsEmpty!2269))

(assert (= (and mapNonEmpty!2267 (not condMapEmpty!2269)) mapNonEmpty!2269))

(assert (= (and mapNonEmpty!2269 ((_ is ValueCellFull!759) mapValue!2269)) b!51121))

(assert (= (and mapNonEmpty!2267 ((_ is ValueCellFull!759) mapDefault!2269)) b!51122))

(declare-fun m!44099 () Bool)

(assert (=> mapNonEmpty!2269 m!44099))

(declare-fun mapNonEmpty!2270 () Bool)

(declare-fun mapRes!2270 () Bool)

(declare-fun tp!6824 () Bool)

(declare-fun e!33115 () Bool)

(assert (=> mapNonEmpty!2270 (= mapRes!2270 (and tp!6824 e!33115))))

(declare-fun mapValue!2270 () ValueCell!759)

(declare-fun mapRest!2270 () (Array (_ BitVec 32) ValueCell!759))

(declare-fun mapKey!2270 () (_ BitVec 32))

(assert (=> mapNonEmpty!2270 (= mapRest!2268 (store mapRest!2270 mapKey!2270 mapValue!2270))))

(declare-fun condMapEmpty!2270 () Bool)

(declare-fun mapDefault!2270 () ValueCell!759)

(assert (=> mapNonEmpty!2268 (= condMapEmpty!2270 (= mapRest!2268 ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2270)))))

(declare-fun e!33116 () Bool)

(assert (=> mapNonEmpty!2268 (= tp!6822 (and e!33116 mapRes!2270))))

(declare-fun mapIsEmpty!2270 () Bool)

(assert (=> mapIsEmpty!2270 mapRes!2270))

(declare-fun b!51124 () Bool)

(assert (=> b!51124 (= e!33116 tp_is_empty!2205)))

(declare-fun b!51123 () Bool)

(assert (=> b!51123 (= e!33115 tp_is_empty!2205)))

(assert (= (and mapNonEmpty!2268 condMapEmpty!2270) mapIsEmpty!2270))

(assert (= (and mapNonEmpty!2268 (not condMapEmpty!2270)) mapNonEmpty!2270))

(assert (= (and mapNonEmpty!2270 ((_ is ValueCellFull!759) mapValue!2270)) b!51123))

(assert (= (and mapNonEmpty!2268 ((_ is ValueCellFull!759) mapDefault!2270)) b!51124))

(declare-fun m!44101 () Bool)

(assert (=> mapNonEmpty!2270 m!44101))

(check-sat (not d!10265) (not b!51077) b_and!2789 (not b!51119) (not bm!3916) (not b!51076) (not b!51102) (not b!51114) (not mapNonEmpty!2269) b_and!2787 (not bm!3922) (not b_next!1577) (not b!51103) (not bm!3919) (not b_next!1579) (not mapNonEmpty!2270) (not b!51105) (not d!10273) tp_is_empty!2205 (not b!51117) (not b!51118) (not b!51090) (not b!51120))
(check-sat b_and!2787 b_and!2789 (not b_next!1577) (not b_next!1579))
(get-model)

(declare-fun d!10275 () Bool)

(assert (=> d!10275 (= (size!1818 newMap!16) (bvadd (_size!262 newMap!16) (bvsdiv (bvadd (extraKeys!1818 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!51077 d!10275))

(declare-fun b!51125 () Bool)

(declare-fun res!29305 () Bool)

(declare-fun e!33117 () Bool)

(assert (=> b!51125 (=> (not res!29305) (not e!33117))))

(assert (=> b!51125 (= res!29305 (and (= (size!1815 (_values!1910 (v!2182 (underlying!136 thiss!992)))) (bvadd (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000001)) (= (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) (size!1815 (_values!1910 (v!2182 (underlying!136 thiss!992))))) (bvsge (_size!262 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!262 (v!2182 (underlying!136 thiss!992))) (bvadd (mask!5726 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!51128 () Bool)

(assert (=> b!51128 (= e!33117 (and (bvsge (extraKeys!1818 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1818 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!262 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!51126 () Bool)

(declare-fun res!29307 () Bool)

(assert (=> b!51126 (=> (not res!29307) (not e!33117))))

(assert (=> b!51126 (= res!29307 (bvsge (size!1818 (v!2182 (underlying!136 thiss!992))) (_size!262 (v!2182 (underlying!136 thiss!992)))))))

(declare-fun b!51127 () Bool)

(declare-fun res!29304 () Bool)

(assert (=> b!51127 (=> (not res!29304) (not e!33117))))

(assert (=> b!51127 (= res!29304 (= (size!1818 (v!2182 (underlying!136 thiss!992))) (bvadd (_size!262 (v!2182 (underlying!136 thiss!992))) (bvsdiv (bvadd (extraKeys!1818 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!10277 () Bool)

(declare-fun res!29306 () Bool)

(assert (=> d!10277 (=> (not res!29306) (not e!33117))))

(assert (=> d!10277 (= res!29306 (validMask!0 (mask!5726 (v!2182 (underlying!136 thiss!992)))))))

(assert (=> d!10277 (= (simpleValid!36 (v!2182 (underlying!136 thiss!992))) e!33117)))

(assert (= (and d!10277 res!29306) b!51125))

(assert (= (and b!51125 res!29305) b!51126))

(assert (= (and b!51126 res!29307) b!51127))

(assert (= (and b!51127 res!29304) b!51128))

(declare-fun m!44103 () Bool)

(assert (=> b!51126 m!44103))

(assert (=> b!51127 m!44103))

(assert (=> d!10277 m!44025))

(assert (=> d!10273 d!10277))

(declare-fun bm!3923 () Bool)

(declare-fun call!3926 () (_ BitVec 32))

(assert (=> bm!3923 (= call!3926 (arrayCountValidKeys!0 (_keys!3539 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))))))

(declare-fun d!10279 () Bool)

(declare-fun lt!21129 () (_ BitVec 32))

(assert (=> d!10279 (and (bvsge lt!21129 #b00000000000000000000000000000000) (bvsle lt!21129 (bvsub (size!1814 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!33118 () (_ BitVec 32))

(assert (=> d!10279 (= lt!21129 e!33118)))

(declare-fun c!6860 () Bool)

(assert (=> d!10279 (= c!6860 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10279 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1814 (_keys!3539 newMap!16)) (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10279 (= (arrayCountValidKeys!0 (_keys!3539 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))) lt!21129)))

(declare-fun b!51129 () Bool)

(declare-fun e!33119 () (_ BitVec 32))

(assert (=> b!51129 (= e!33119 (bvadd #b00000000000000000000000000000001 call!3926))))

(declare-fun b!51130 () Bool)

(assert (=> b!51130 (= e!33118 #b00000000000000000000000000000000)))

(declare-fun b!51131 () Bool)

(assert (=> b!51131 (= e!33119 call!3926)))

(declare-fun b!51132 () Bool)

(assert (=> b!51132 (= e!33118 e!33119)))

(declare-fun c!6859 () Bool)

(assert (=> b!51132 (= c!6859 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10279 c!6860) b!51130))

(assert (= (and d!10279 (not c!6860)) b!51132))

(assert (= (and b!51132 c!6859) b!51129))

(assert (= (and b!51132 (not c!6859)) b!51131))

(assert (= (or b!51129 b!51131) bm!3923))

(declare-fun m!44105 () Bool)

(assert (=> bm!3923 m!44105))

(declare-fun m!44107 () Bool)

(assert (=> b!51132 m!44107))

(assert (=> b!51132 m!44107))

(declare-fun m!44109 () Bool)

(assert (=> b!51132 m!44109))

(assert (=> bm!3916 d!10279))

(declare-fun d!10281 () Bool)

(assert (=> d!10281 (= (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51117 d!10281))

(assert (=> b!51076 d!10275))

(declare-fun d!10283 () Bool)

(assert (=> d!10283 (arrayContainsKey!0 (_keys!3539 newMap!16) lt!21128 #b00000000000000000000000000000000)))

(declare-fun lt!21132 () Unit!1423)

(declare-fun choose!13 (array!3325 (_ BitVec 64) (_ BitVec 32)) Unit!1423)

(assert (=> d!10283 (= lt!21132 (choose!13 (_keys!3539 newMap!16) lt!21128 #b00000000000000000000000000000000))))

(assert (=> d!10283 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10283 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3539 newMap!16) lt!21128 #b00000000000000000000000000000000) lt!21132)))

(declare-fun bs!2372 () Bool)

(assert (= bs!2372 d!10283))

(assert (=> bs!2372 m!44087))

(declare-fun m!44111 () Bool)

(assert (=> bs!2372 m!44111))

(assert (=> b!51114 d!10283))

(declare-fun d!10285 () Bool)

(declare-fun res!29312 () Bool)

(declare-fun e!33124 () Bool)

(assert (=> d!10285 (=> res!29312 e!33124)))

(assert (=> d!10285 (= res!29312 (= (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) lt!21128))))

(assert (=> d!10285 (= (arrayContainsKey!0 (_keys!3539 newMap!16) lt!21128 #b00000000000000000000000000000000) e!33124)))

(declare-fun b!51137 () Bool)

(declare-fun e!33125 () Bool)

(assert (=> b!51137 (= e!33124 e!33125)))

(declare-fun res!29313 () Bool)

(assert (=> b!51137 (=> (not res!29313) (not e!33125))))

(assert (=> b!51137 (= res!29313 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))))))

(declare-fun b!51138 () Bool)

(assert (=> b!51138 (= e!33125 (arrayContainsKey!0 (_keys!3539 newMap!16) lt!21128 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10285 (not res!29312)) b!51137))

(assert (= (and b!51137 res!29313) b!51138))

(assert (=> d!10285 m!44075))

(declare-fun m!44113 () Bool)

(assert (=> b!51138 m!44113))

(assert (=> b!51114 d!10285))

(declare-fun b!51151 () Bool)

(declare-fun e!33134 () SeekEntryResult!221)

(declare-fun e!33133 () SeekEntryResult!221)

(assert (=> b!51151 (= e!33134 e!33133)))

(declare-fun lt!21139 () (_ BitVec 64))

(declare-fun lt!21141 () SeekEntryResult!221)

(assert (=> b!51151 (= lt!21139 (select (arr!1589 (_keys!3539 newMap!16)) (index!3008 lt!21141)))))

(declare-fun c!6869 () Bool)

(assert (=> b!51151 (= c!6869 (= lt!21139 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51152 () Bool)

(assert (=> b!51152 (= e!33133 (Found!221 (index!3008 lt!21141)))))

(declare-fun d!10287 () Bool)

(declare-fun lt!21140 () SeekEntryResult!221)

(assert (=> d!10287 (and (or ((_ is Undefined!221) lt!21140) (not ((_ is Found!221) lt!21140)) (and (bvsge (index!3007 lt!21140) #b00000000000000000000000000000000) (bvslt (index!3007 lt!21140) (size!1814 (_keys!3539 newMap!16))))) (or ((_ is Undefined!221) lt!21140) ((_ is Found!221) lt!21140) (not ((_ is MissingZero!221) lt!21140)) (and (bvsge (index!3006 lt!21140) #b00000000000000000000000000000000) (bvslt (index!3006 lt!21140) (size!1814 (_keys!3539 newMap!16))))) (or ((_ is Undefined!221) lt!21140) ((_ is Found!221) lt!21140) ((_ is MissingZero!221) lt!21140) (not ((_ is MissingVacant!221) lt!21140)) (and (bvsge (index!3009 lt!21140) #b00000000000000000000000000000000) (bvslt (index!3009 lt!21140) (size!1814 (_keys!3539 newMap!16))))) (or ((_ is Undefined!221) lt!21140) (ite ((_ is Found!221) lt!21140) (= (select (arr!1589 (_keys!3539 newMap!16)) (index!3007 lt!21140)) (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!221) lt!21140) (= (select (arr!1589 (_keys!3539 newMap!16)) (index!3006 lt!21140)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!221) lt!21140) (= (select (arr!1589 (_keys!3539 newMap!16)) (index!3009 lt!21140)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10287 (= lt!21140 e!33134)))

(declare-fun c!6868 () Bool)

(assert (=> d!10287 (= c!6868 (and ((_ is Intermediate!221) lt!21141) (undefined!1033 lt!21141)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3325 (_ BitVec 32)) SeekEntryResult!221)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10287 (= lt!21141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) (mask!5726 newMap!16)) (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) (_keys!3539 newMap!16) (mask!5726 newMap!16)))))

(assert (=> d!10287 (validMask!0 (mask!5726 newMap!16))))

(assert (=> d!10287 (= (seekEntryOrOpen!0 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) (_keys!3539 newMap!16) (mask!5726 newMap!16)) lt!21140)))

(declare-fun b!51153 () Bool)

(declare-fun e!33132 () SeekEntryResult!221)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3325 (_ BitVec 32)) SeekEntryResult!221)

(assert (=> b!51153 (= e!33132 (seekKeyOrZeroReturnVacant!0 (x!9307 lt!21141) (index!3008 lt!21141) (index!3008 lt!21141) (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) (_keys!3539 newMap!16) (mask!5726 newMap!16)))))

(declare-fun b!51154 () Bool)

(assert (=> b!51154 (= e!33134 Undefined!221)))

(declare-fun b!51155 () Bool)

(assert (=> b!51155 (= e!33132 (MissingZero!221 (index!3008 lt!21141)))))

(declare-fun b!51156 () Bool)

(declare-fun c!6867 () Bool)

(assert (=> b!51156 (= c!6867 (= lt!21139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51156 (= e!33133 e!33132)))

(assert (= (and d!10287 c!6868) b!51154))

(assert (= (and d!10287 (not c!6868)) b!51151))

(assert (= (and b!51151 c!6869) b!51152))

(assert (= (and b!51151 (not c!6869)) b!51156))

(assert (= (and b!51156 c!6867) b!51155))

(assert (= (and b!51156 (not c!6867)) b!51153))

(declare-fun m!44115 () Bool)

(assert (=> b!51151 m!44115))

(declare-fun m!44117 () Bool)

(assert (=> d!10287 m!44117))

(assert (=> d!10287 m!44075))

(declare-fun m!44119 () Bool)

(assert (=> d!10287 m!44119))

(assert (=> d!10287 m!44071))

(assert (=> d!10287 m!44075))

(assert (=> d!10287 m!44117))

(declare-fun m!44121 () Bool)

(assert (=> d!10287 m!44121))

(declare-fun m!44123 () Bool)

(assert (=> d!10287 m!44123))

(declare-fun m!44125 () Bool)

(assert (=> d!10287 m!44125))

(assert (=> b!51153 m!44075))

(declare-fun m!44127 () Bool)

(assert (=> b!51153 m!44127))

(assert (=> b!51114 d!10287))

(assert (=> b!51105 d!10281))

(declare-fun d!10289 () Bool)

(declare-fun res!29315 () Bool)

(declare-fun e!33138 () Bool)

(assert (=> d!10289 (=> res!29315 e!33138)))

(assert (=> d!10289 (= res!29315 (bvsge #b00000000000000000000000000000000 (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))))))

(assert (=> d!10289 (= (arrayNoDuplicates!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000 Nil!1328) e!33138)))

(declare-fun b!51157 () Bool)

(declare-fun e!33136 () Bool)

(declare-fun call!3927 () Bool)

(assert (=> b!51157 (= e!33136 call!3927)))

(declare-fun b!51158 () Bool)

(declare-fun e!33135 () Bool)

(assert (=> b!51158 (= e!33135 e!33136)))

(declare-fun c!6870 () Bool)

(assert (=> b!51158 (= c!6870 (validKeyInArray!0 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3924 () Bool)

(assert (=> bm!3924 (= call!3927 (arrayNoDuplicates!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6870 (Cons!1327 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000) Nil!1328) Nil!1328)))))

(declare-fun b!51159 () Bool)

(declare-fun e!33137 () Bool)

(assert (=> b!51159 (= e!33137 (contains!621 Nil!1328 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51160 () Bool)

(assert (=> b!51160 (= e!33136 call!3927)))

(declare-fun b!51161 () Bool)

(assert (=> b!51161 (= e!33138 e!33135)))

(declare-fun res!29316 () Bool)

(assert (=> b!51161 (=> (not res!29316) (not e!33135))))

(assert (=> b!51161 (= res!29316 (not e!33137))))

(declare-fun res!29314 () Bool)

(assert (=> b!51161 (=> (not res!29314) (not e!33137))))

(assert (=> b!51161 (= res!29314 (validKeyInArray!0 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10289 (not res!29315)) b!51161))

(assert (= (and b!51161 res!29314) b!51159))

(assert (= (and b!51161 res!29316) b!51158))

(assert (= (and b!51158 c!6870) b!51157))

(assert (= (and b!51158 (not c!6870)) b!51160))

(assert (= (or b!51157 b!51160) bm!3924))

(declare-fun m!44129 () Bool)

(assert (=> b!51158 m!44129))

(assert (=> b!51158 m!44129))

(declare-fun m!44131 () Bool)

(assert (=> b!51158 m!44131))

(assert (=> bm!3924 m!44129))

(declare-fun m!44133 () Bool)

(assert (=> bm!3924 m!44133))

(assert (=> b!51159 m!44129))

(assert (=> b!51159 m!44129))

(declare-fun m!44135 () Bool)

(assert (=> b!51159 m!44135))

(assert (=> b!51161 m!44129))

(assert (=> b!51161 m!44129))

(assert (=> b!51161 m!44131))

(assert (=> b!51120 d!10289))

(declare-fun d!10291 () Bool)

(declare-fun lt!21144 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!58 (List!1331) (InoxSet (_ BitVec 64)))

(assert (=> d!10291 (= lt!21144 (select (content!58 Nil!1328) (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33144 () Bool)

(assert (=> d!10291 (= lt!21144 e!33144)))

(declare-fun res!29322 () Bool)

(assert (=> d!10291 (=> (not res!29322) (not e!33144))))

(assert (=> d!10291 (= res!29322 ((_ is Cons!1327) Nil!1328))))

(assert (=> d!10291 (= (contains!621 Nil!1328 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)) lt!21144)))

(declare-fun b!51166 () Bool)

(declare-fun e!33143 () Bool)

(assert (=> b!51166 (= e!33144 e!33143)))

(declare-fun res!29321 () Bool)

(assert (=> b!51166 (=> res!29321 e!33143)))

(assert (=> b!51166 (= res!29321 (= (h!1907 Nil!1328) (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51167 () Bool)

(assert (=> b!51167 (= e!33143 (contains!621 (t!4365 Nil!1328) (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10291 res!29322) b!51166))

(assert (= (and b!51166 (not res!29321)) b!51167))

(declare-fun m!44137 () Bool)

(assert (=> d!10291 m!44137))

(assert (=> d!10291 m!44075))

(declare-fun m!44139 () Bool)

(assert (=> d!10291 m!44139))

(assert (=> b!51167 m!44075))

(declare-fun m!44141 () Bool)

(assert (=> b!51167 m!44141))

(assert (=> b!51103 d!10291))

(declare-fun bm!3925 () Bool)

(declare-fun call!3928 () Bool)

(assert (=> bm!3925 (= call!3928 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3539 newMap!16) (mask!5726 newMap!16)))))

(declare-fun d!10293 () Bool)

(declare-fun res!29324 () Bool)

(declare-fun e!33146 () Bool)

(assert (=> d!10293 (=> res!29324 e!33146)))

(assert (=> d!10293 (= res!29324 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10293 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3539 newMap!16) (mask!5726 newMap!16)) e!33146)))

(declare-fun b!51168 () Bool)

(declare-fun e!33147 () Bool)

(declare-fun e!33145 () Bool)

(assert (=> b!51168 (= e!33147 e!33145)))

(declare-fun lt!21147 () (_ BitVec 64))

(assert (=> b!51168 (= lt!21147 (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21145 () Unit!1423)

(assert (=> b!51168 (= lt!21145 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3539 newMap!16) lt!21147 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51168 (arrayContainsKey!0 (_keys!3539 newMap!16) lt!21147 #b00000000000000000000000000000000)))

(declare-fun lt!21146 () Unit!1423)

(assert (=> b!51168 (= lt!21146 lt!21145)))

(declare-fun res!29323 () Bool)

(assert (=> b!51168 (= res!29323 (= (seekEntryOrOpen!0 (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3539 newMap!16) (mask!5726 newMap!16)) (Found!221 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51168 (=> (not res!29323) (not e!33145))))

(declare-fun b!51169 () Bool)

(assert (=> b!51169 (= e!33147 call!3928)))

(declare-fun b!51170 () Bool)

(assert (=> b!51170 (= e!33145 call!3928)))

(declare-fun b!51171 () Bool)

(assert (=> b!51171 (= e!33146 e!33147)))

(declare-fun c!6871 () Bool)

(assert (=> b!51171 (= c!6871 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10293 (not res!29324)) b!51171))

(assert (= (and b!51171 c!6871) b!51168))

(assert (= (and b!51171 (not c!6871)) b!51169))

(assert (= (and b!51168 res!29323) b!51170))

(assert (= (or b!51170 b!51169) bm!3925))

(declare-fun m!44143 () Bool)

(assert (=> bm!3925 m!44143))

(assert (=> b!51168 m!44107))

(declare-fun m!44145 () Bool)

(assert (=> b!51168 m!44145))

(declare-fun m!44147 () Bool)

(assert (=> b!51168 m!44147))

(assert (=> b!51168 m!44107))

(declare-fun m!44149 () Bool)

(assert (=> b!51168 m!44149))

(assert (=> b!51171 m!44107))

(assert (=> b!51171 m!44107))

(assert (=> b!51171 m!44109))

(assert (=> bm!3922 d!10293))

(declare-fun d!10295 () Bool)

(declare-fun res!29326 () Bool)

(declare-fun e!33151 () Bool)

(assert (=> d!10295 (=> res!29326 e!33151)))

(assert (=> d!10295 (= res!29326 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 newMap!16))))))

(assert (=> d!10295 (= (arrayNoDuplicates!0 (_keys!3539 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6855 (Cons!1327 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) Nil!1328) Nil!1328)) e!33151)))

(declare-fun b!51172 () Bool)

(declare-fun e!33149 () Bool)

(declare-fun call!3929 () Bool)

(assert (=> b!51172 (= e!33149 call!3929)))

(declare-fun b!51173 () Bool)

(declare-fun e!33148 () Bool)

(assert (=> b!51173 (= e!33148 e!33149)))

(declare-fun c!6872 () Bool)

(assert (=> b!51173 (= c!6872 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3926 () Bool)

(assert (=> bm!3926 (= call!3929 (arrayNoDuplicates!0 (_keys!3539 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6872 (Cons!1327 (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6855 (Cons!1327 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) Nil!1328) Nil!1328)) (ite c!6855 (Cons!1327 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) Nil!1328) Nil!1328))))))

(declare-fun b!51174 () Bool)

(declare-fun e!33150 () Bool)

(assert (=> b!51174 (= e!33150 (contains!621 (ite c!6855 (Cons!1327 (select (arr!1589 (_keys!3539 newMap!16)) #b00000000000000000000000000000000) Nil!1328) Nil!1328) (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51175 () Bool)

(assert (=> b!51175 (= e!33149 call!3929)))

(declare-fun b!51176 () Bool)

(assert (=> b!51176 (= e!33151 e!33148)))

(declare-fun res!29327 () Bool)

(assert (=> b!51176 (=> (not res!29327) (not e!33148))))

(assert (=> b!51176 (= res!29327 (not e!33150))))

(declare-fun res!29325 () Bool)

(assert (=> b!51176 (=> (not res!29325) (not e!33150))))

(assert (=> b!51176 (= res!29325 (validKeyInArray!0 (select (arr!1589 (_keys!3539 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10295 (not res!29326)) b!51176))

(assert (= (and b!51176 res!29325) b!51174))

(assert (= (and b!51176 res!29327) b!51173))

(assert (= (and b!51173 c!6872) b!51172))

(assert (= (and b!51173 (not c!6872)) b!51175))

(assert (= (or b!51172 b!51175) bm!3926))

(assert (=> b!51173 m!44107))

(assert (=> b!51173 m!44107))

(assert (=> b!51173 m!44109))

(assert (=> bm!3926 m!44107))

(declare-fun m!44151 () Bool)

(assert (=> bm!3926 m!44151))

(assert (=> b!51174 m!44107))

(assert (=> b!51174 m!44107))

(declare-fun m!44153 () Bool)

(assert (=> b!51174 m!44153))

(assert (=> b!51176 m!44107))

(assert (=> b!51176 m!44107))

(assert (=> b!51176 m!44109))

(assert (=> bm!3919 d!10295))

(declare-fun bm!3927 () Bool)

(declare-fun call!3930 () Bool)

(assert (=> bm!3927 (= call!3930 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3539 (v!2182 (underlying!136 thiss!992))) (mask!5726 (v!2182 (underlying!136 thiss!992)))))))

(declare-fun d!10297 () Bool)

(declare-fun res!29329 () Bool)

(declare-fun e!33153 () Bool)

(assert (=> d!10297 (=> res!29329 e!33153)))

(assert (=> d!10297 (= res!29329 (bvsge #b00000000000000000000000000000000 (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))))))

(assert (=> d!10297 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3539 (v!2182 (underlying!136 thiss!992))) (mask!5726 (v!2182 (underlying!136 thiss!992)))) e!33153)))

(declare-fun b!51177 () Bool)

(declare-fun e!33154 () Bool)

(declare-fun e!33152 () Bool)

(assert (=> b!51177 (= e!33154 e!33152)))

(declare-fun lt!21150 () (_ BitVec 64))

(assert (=> b!51177 (= lt!21150 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21148 () Unit!1423)

(assert (=> b!51177 (= lt!21148 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) lt!21150 #b00000000000000000000000000000000))))

(assert (=> b!51177 (arrayContainsKey!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) lt!21150 #b00000000000000000000000000000000)))

(declare-fun lt!21149 () Unit!1423)

(assert (=> b!51177 (= lt!21149 lt!21148)))

(declare-fun res!29328 () Bool)

(assert (=> b!51177 (= res!29328 (= (seekEntryOrOpen!0 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000) (_keys!3539 (v!2182 (underlying!136 thiss!992))) (mask!5726 (v!2182 (underlying!136 thiss!992)))) (Found!221 #b00000000000000000000000000000000)))))

(assert (=> b!51177 (=> (not res!29328) (not e!33152))))

(declare-fun b!51178 () Bool)

(assert (=> b!51178 (= e!33154 call!3930)))

(declare-fun b!51179 () Bool)

(assert (=> b!51179 (= e!33152 call!3930)))

(declare-fun b!51180 () Bool)

(assert (=> b!51180 (= e!33153 e!33154)))

(declare-fun c!6873 () Bool)

(assert (=> b!51180 (= c!6873 (validKeyInArray!0 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10297 (not res!29329)) b!51180))

(assert (= (and b!51180 c!6873) b!51177))

(assert (= (and b!51180 (not c!6873)) b!51178))

(assert (= (and b!51177 res!29328) b!51179))

(assert (= (or b!51179 b!51178) bm!3927))

(declare-fun m!44155 () Bool)

(assert (=> bm!3927 m!44155))

(assert (=> b!51177 m!44129))

(declare-fun m!44157 () Bool)

(assert (=> b!51177 m!44157))

(declare-fun m!44159 () Bool)

(assert (=> b!51177 m!44159))

(assert (=> b!51177 m!44129))

(declare-fun m!44161 () Bool)

(assert (=> b!51177 m!44161))

(assert (=> b!51180 m!44129))

(assert (=> b!51180 m!44129))

(assert (=> b!51180 m!44131))

(assert (=> b!51119 d!10297))

(assert (=> b!51090 d!10281))

(declare-fun bm!3928 () Bool)

(declare-fun call!3931 () (_ BitVec 32))

(assert (=> bm!3928 (= call!3931 (arrayCountValidKeys!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))))))

(declare-fun d!10299 () Bool)

(declare-fun lt!21151 () (_ BitVec 32))

(assert (=> d!10299 (and (bvsge lt!21151 #b00000000000000000000000000000000) (bvsle lt!21151 (bvsub (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!33155 () (_ BitVec 32))

(assert (=> d!10299 (= lt!21151 e!33155)))

(declare-fun c!6875 () Bool)

(assert (=> d!10299 (= c!6875 (bvsge #b00000000000000000000000000000000 (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))))))

(assert (=> d!10299 (and (bvsle #b00000000000000000000000000000000 (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))))))

(assert (=> d!10299 (= (arrayCountValidKeys!0 (_keys!3539 (v!2182 (underlying!136 thiss!992))) #b00000000000000000000000000000000 (size!1814 (_keys!3539 (v!2182 (underlying!136 thiss!992))))) lt!21151)))

(declare-fun b!51181 () Bool)

(declare-fun e!33156 () (_ BitVec 32))

(assert (=> b!51181 (= e!33156 (bvadd #b00000000000000000000000000000001 call!3931))))

(declare-fun b!51182 () Bool)

(assert (=> b!51182 (= e!33155 #b00000000000000000000000000000000)))

(declare-fun b!51183 () Bool)

(assert (=> b!51183 (= e!33156 call!3931)))

(declare-fun b!51184 () Bool)

(assert (=> b!51184 (= e!33155 e!33156)))

(declare-fun c!6874 () Bool)

(assert (=> b!51184 (= c!6874 (validKeyInArray!0 (select (arr!1589 (_keys!3539 (v!2182 (underlying!136 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10299 c!6875) b!51182))

(assert (= (and d!10299 (not c!6875)) b!51184))

(assert (= (and b!51184 c!6874) b!51181))

(assert (= (and b!51184 (not c!6874)) b!51183))

(assert (= (or b!51181 b!51183) bm!3928))

(declare-fun m!44163 () Bool)

(assert (=> bm!3928 m!44163))

(assert (=> b!51184 m!44129))

(assert (=> b!51184 m!44129))

(assert (=> b!51184 m!44131))

(assert (=> b!51118 d!10299))

(assert (=> b!51102 d!10281))

(declare-fun d!10301 () Bool)

(assert (=> d!10301 (= (validMask!0 (mask!5726 newMap!16)) (and (or (= (mask!5726 newMap!16) #b00000000000000000000000000000111) (= (mask!5726 newMap!16) #b00000000000000000000000000001111) (= (mask!5726 newMap!16) #b00000000000000000000000000011111) (= (mask!5726 newMap!16) #b00000000000000000000000000111111) (= (mask!5726 newMap!16) #b00000000000000000000000001111111) (= (mask!5726 newMap!16) #b00000000000000000000000011111111) (= (mask!5726 newMap!16) #b00000000000000000000000111111111) (= (mask!5726 newMap!16) #b00000000000000000000001111111111) (= (mask!5726 newMap!16) #b00000000000000000000011111111111) (= (mask!5726 newMap!16) #b00000000000000000000111111111111) (= (mask!5726 newMap!16) #b00000000000000000001111111111111) (= (mask!5726 newMap!16) #b00000000000000000011111111111111) (= (mask!5726 newMap!16) #b00000000000000000111111111111111) (= (mask!5726 newMap!16) #b00000000000000001111111111111111) (= (mask!5726 newMap!16) #b00000000000000011111111111111111) (= (mask!5726 newMap!16) #b00000000000000111111111111111111) (= (mask!5726 newMap!16) #b00000000000001111111111111111111) (= (mask!5726 newMap!16) #b00000000000011111111111111111111) (= (mask!5726 newMap!16) #b00000000000111111111111111111111) (= (mask!5726 newMap!16) #b00000000001111111111111111111111) (= (mask!5726 newMap!16) #b00000000011111111111111111111111) (= (mask!5726 newMap!16) #b00000000111111111111111111111111) (= (mask!5726 newMap!16) #b00000001111111111111111111111111) (= (mask!5726 newMap!16) #b00000011111111111111111111111111) (= (mask!5726 newMap!16) #b00000111111111111111111111111111) (= (mask!5726 newMap!16) #b00001111111111111111111111111111) (= (mask!5726 newMap!16) #b00011111111111111111111111111111) (= (mask!5726 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5726 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10265 d!10301))

(declare-fun mapNonEmpty!2271 () Bool)

(declare-fun mapRes!2271 () Bool)

(declare-fun tp!6825 () Bool)

(declare-fun e!33157 () Bool)

(assert (=> mapNonEmpty!2271 (= mapRes!2271 (and tp!6825 e!33157))))

(declare-fun mapRest!2271 () (Array (_ BitVec 32) ValueCell!759))

(declare-fun mapValue!2271 () ValueCell!759)

(declare-fun mapKey!2271 () (_ BitVec 32))

(assert (=> mapNonEmpty!2271 (= mapRest!2269 (store mapRest!2271 mapKey!2271 mapValue!2271))))

(declare-fun condMapEmpty!2271 () Bool)

(declare-fun mapDefault!2271 () ValueCell!759)

(assert (=> mapNonEmpty!2269 (= condMapEmpty!2271 (= mapRest!2269 ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2271)))))

(declare-fun e!33158 () Bool)

(assert (=> mapNonEmpty!2269 (= tp!6823 (and e!33158 mapRes!2271))))

(declare-fun mapIsEmpty!2271 () Bool)

(assert (=> mapIsEmpty!2271 mapRes!2271))

(declare-fun b!51186 () Bool)

(assert (=> b!51186 (= e!33158 tp_is_empty!2205)))

(declare-fun b!51185 () Bool)

(assert (=> b!51185 (= e!33157 tp_is_empty!2205)))

(assert (= (and mapNonEmpty!2269 condMapEmpty!2271) mapIsEmpty!2271))

(assert (= (and mapNonEmpty!2269 (not condMapEmpty!2271)) mapNonEmpty!2271))

(assert (= (and mapNonEmpty!2271 ((_ is ValueCellFull!759) mapValue!2271)) b!51185))

(assert (= (and mapNonEmpty!2269 ((_ is ValueCellFull!759) mapDefault!2271)) b!51186))

(declare-fun m!44165 () Bool)

(assert (=> mapNonEmpty!2271 m!44165))

(declare-fun mapNonEmpty!2272 () Bool)

(declare-fun mapRes!2272 () Bool)

(declare-fun tp!6826 () Bool)

(declare-fun e!33159 () Bool)

(assert (=> mapNonEmpty!2272 (= mapRes!2272 (and tp!6826 e!33159))))

(declare-fun mapValue!2272 () ValueCell!759)

(declare-fun mapRest!2272 () (Array (_ BitVec 32) ValueCell!759))

(declare-fun mapKey!2272 () (_ BitVec 32))

(assert (=> mapNonEmpty!2272 (= mapRest!2270 (store mapRest!2272 mapKey!2272 mapValue!2272))))

(declare-fun condMapEmpty!2272 () Bool)

(declare-fun mapDefault!2272 () ValueCell!759)

(assert (=> mapNonEmpty!2270 (= condMapEmpty!2272 (= mapRest!2270 ((as const (Array (_ BitVec 32) ValueCell!759)) mapDefault!2272)))))

(declare-fun e!33160 () Bool)

(assert (=> mapNonEmpty!2270 (= tp!6824 (and e!33160 mapRes!2272))))

(declare-fun mapIsEmpty!2272 () Bool)

(assert (=> mapIsEmpty!2272 mapRes!2272))

(declare-fun b!51188 () Bool)

(assert (=> b!51188 (= e!33160 tp_is_empty!2205)))

(declare-fun b!51187 () Bool)

(assert (=> b!51187 (= e!33159 tp_is_empty!2205)))

(assert (= (and mapNonEmpty!2270 condMapEmpty!2272) mapIsEmpty!2272))

(assert (= (and mapNonEmpty!2270 (not condMapEmpty!2272)) mapNonEmpty!2272))

(assert (= (and mapNonEmpty!2272 ((_ is ValueCellFull!759) mapValue!2272)) b!51187))

(assert (= (and mapNonEmpty!2270 ((_ is ValueCellFull!759) mapDefault!2272)) b!51188))

(declare-fun m!44167 () Bool)

(assert (=> mapNonEmpty!2272 m!44167))

(check-sat (not d!10283) (not b!51184) (not bm!3928) b_and!2789 (not bm!3923) (not b!51126) (not d!10277) (not b!51174) (not b!51161) (not b!51159) (not b_next!1577) (not bm!3927) (not b_next!1579) (not mapNonEmpty!2272) (not b!51158) (not b!51138) (not b!51127) (not b!51168) (not b!51171) (not bm!3924) tp_is_empty!2205 (not b!51167) (not b!51153) (not d!10291) (not mapNonEmpty!2271) (not b!51177) (not bm!3925) (not b!51180) (not bm!3926) (not d!10287) (not b!51173) (not b!51132) b_and!2787 (not b!51176))
(check-sat b_and!2787 b_and!2789 (not b_next!1577) (not b_next!1579))
