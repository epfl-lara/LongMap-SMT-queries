; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7980 () Bool)

(assert start!7980)

(declare-fun b!49930 () Bool)

(declare-fun b_free!1525 () Bool)

(declare-fun b_next!1525 () Bool)

(assert (=> b!49930 (= b_free!1525 (not b_next!1525))))

(declare-fun tp!6625 () Bool)

(declare-fun b_and!2737 () Bool)

(assert (=> b!49930 (= tp!6625 b_and!2737)))

(declare-fun b!49931 () Bool)

(declare-fun b_free!1527 () Bool)

(declare-fun b_next!1527 () Bool)

(assert (=> b!49931 (= b_free!1527 (not b_next!1527))))

(declare-fun tp!6623 () Bool)

(declare-fun b_and!2739 () Bool)

(assert (=> b!49931 (= tp!6623 b_and!2739)))

(declare-fun b!49922 () Bool)

(declare-fun res!28842 () Bool)

(declare-fun e!32204 () Bool)

(assert (=> b!49922 (=> (not res!28842) (not e!32204))))

(declare-datatypes ((V!2553 0))(
  ( (V!2554 (val!1134 Int)) )
))
(declare-datatypes ((array!3247 0))(
  ( (array!3248 (arr!1552 (Array (_ BitVec 32) (_ BitVec 64))) (size!1775 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!746 0))(
  ( (ValueCellFull!746 (v!2151 V!2553)) (EmptyCell!746) )
))
(declare-datatypes ((array!3249 0))(
  ( (array!3250 (arr!1553 (Array (_ BitVec 32) ValueCell!746)) (size!1776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!400 0))(
  ( (LongMapFixedSize!401 (defaultEntry!1914 Int) (mask!5695 (_ BitVec 32)) (extraKeys!1805 (_ BitVec 32)) (zeroValue!1832 V!2553) (minValue!1832 V!2553) (_size!249 (_ BitVec 32)) (_keys!3519 array!3247) (_values!1897 array!3249) (_vacant!249 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!400)

(declare-fun valid!140 (LongMapFixedSize!400) Bool)

(assert (=> b!49922 (= res!28842 (valid!140 newMap!16))))

(declare-fun b!49923 () Bool)

(declare-fun res!28845 () Bool)

(assert (=> b!49923 (=> (not res!28845) (not e!32204))))

(declare-datatypes ((Cell!226 0))(
  ( (Cell!227 (v!2152 LongMapFixedSize!400)) )
))
(declare-datatypes ((LongMap!226 0))(
  ( (LongMap!227 (underlying!124 Cell!226)) )
))
(declare-fun thiss!992 () LongMap!226)

(assert (=> b!49923 (= res!28845 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5695 newMap!16)) (_size!249 (v!2152 (underlying!124 thiss!992)))))))

(declare-fun b!49924 () Bool)

(declare-fun e!32209 () Bool)

(declare-fun e!32205 () Bool)

(declare-fun mapRes!2156 () Bool)

(assert (=> b!49924 (= e!32209 (and e!32205 mapRes!2156))))

(declare-fun condMapEmpty!2155 () Bool)

(declare-fun mapDefault!2156 () ValueCell!746)

(assert (=> b!49924 (= condMapEmpty!2155 (= (arr!1553 (_values!1897 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2156)))))

(declare-fun mapIsEmpty!2155 () Bool)

(assert (=> mapIsEmpty!2155 mapRes!2156))

(declare-fun b!49925 () Bool)

(declare-fun e!32201 () Bool)

(declare-fun e!32202 () Bool)

(assert (=> b!49925 (= e!32201 e!32202)))

(declare-fun b!49926 () Bool)

(declare-fun e!32206 () Bool)

(declare-fun e!32207 () Bool)

(declare-fun mapRes!2155 () Bool)

(assert (=> b!49926 (= e!32206 (and e!32207 mapRes!2155))))

(declare-fun condMapEmpty!2156 () Bool)

(declare-fun mapDefault!2155 () ValueCell!746)

(assert (=> b!49926 (= condMapEmpty!2156 (= (arr!1553 (_values!1897 (v!2152 (underlying!124 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2155)))))

(declare-fun mapNonEmpty!2155 () Bool)

(declare-fun tp!6624 () Bool)

(declare-fun e!32210 () Bool)

(assert (=> mapNonEmpty!2155 (= mapRes!2155 (and tp!6624 e!32210))))

(declare-fun mapKey!2155 () (_ BitVec 32))

(declare-fun mapValue!2155 () ValueCell!746)

(declare-fun mapRest!2156 () (Array (_ BitVec 32) ValueCell!746))

(assert (=> mapNonEmpty!2155 (= (arr!1553 (_values!1897 (v!2152 (underlying!124 thiss!992)))) (store mapRest!2156 mapKey!2155 mapValue!2155))))

(declare-fun b!49927 () Bool)

(declare-fun e!32208 () Bool)

(assert (=> b!49927 (= e!32202 e!32208)))

(declare-fun b!49928 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!49928 (= e!32204 (not (validMask!0 (mask!5695 (v!2152 (underlying!124 thiss!992))))))))

(declare-fun b!49929 () Bool)

(declare-fun tp_is_empty!2179 () Bool)

(assert (=> b!49929 (= e!32207 tp_is_empty!2179)))

(declare-fun mapNonEmpty!2156 () Bool)

(declare-fun tp!6626 () Bool)

(declare-fun e!32200 () Bool)

(assert (=> mapNonEmpty!2156 (= mapRes!2156 (and tp!6626 e!32200))))

(declare-fun mapValue!2156 () ValueCell!746)

(declare-fun mapRest!2155 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapKey!2156 () (_ BitVec 32))

(assert (=> mapNonEmpty!2156 (= (arr!1553 (_values!1897 newMap!16)) (store mapRest!2155 mapKey!2156 mapValue!2156))))

(declare-fun array_inv!947 (array!3247) Bool)

(declare-fun array_inv!948 (array!3249) Bool)

(assert (=> b!49930 (= e!32208 (and tp!6625 tp_is_empty!2179 (array_inv!947 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) (array_inv!948 (_values!1897 (v!2152 (underlying!124 thiss!992)))) e!32206))))

(declare-fun e!32203 () Bool)

(assert (=> b!49931 (= e!32203 (and tp!6623 tp_is_empty!2179 (array_inv!947 (_keys!3519 newMap!16)) (array_inv!948 (_values!1897 newMap!16)) e!32209))))

(declare-fun res!28843 () Bool)

(assert (=> start!7980 (=> (not res!28843) (not e!32204))))

(declare-fun valid!141 (LongMap!226) Bool)

(assert (=> start!7980 (= res!28843 (valid!141 thiss!992))))

(assert (=> start!7980 e!32204))

(assert (=> start!7980 e!32201))

(assert (=> start!7980 true))

(assert (=> start!7980 e!32203))

(declare-fun b!49921 () Bool)

(declare-fun res!28844 () Bool)

(assert (=> b!49921 (=> (not res!28844) (not e!32204))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!49921 (= res!28844 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992)))))))))

(declare-fun b!49932 () Bool)

(assert (=> b!49932 (= e!32200 tp_is_empty!2179)))

(declare-fun b!49933 () Bool)

(assert (=> b!49933 (= e!32210 tp_is_empty!2179)))

(declare-fun mapIsEmpty!2156 () Bool)

(assert (=> mapIsEmpty!2156 mapRes!2155))

(declare-fun b!49934 () Bool)

(assert (=> b!49934 (= e!32205 tp_is_empty!2179)))

(assert (= (and start!7980 res!28843) b!49921))

(assert (= (and b!49921 res!28844) b!49922))

(assert (= (and b!49922 res!28842) b!49923))

(assert (= (and b!49923 res!28845) b!49928))

(assert (= (and b!49926 condMapEmpty!2156) mapIsEmpty!2156))

(assert (= (and b!49926 (not condMapEmpty!2156)) mapNonEmpty!2155))

(get-info :version)

(assert (= (and mapNonEmpty!2155 ((_ is ValueCellFull!746) mapValue!2155)) b!49933))

(assert (= (and b!49926 ((_ is ValueCellFull!746) mapDefault!2155)) b!49929))

(assert (= b!49930 b!49926))

(assert (= b!49927 b!49930))

(assert (= b!49925 b!49927))

(assert (= start!7980 b!49925))

(assert (= (and b!49924 condMapEmpty!2155) mapIsEmpty!2155))

(assert (= (and b!49924 (not condMapEmpty!2155)) mapNonEmpty!2156))

(assert (= (and mapNonEmpty!2156 ((_ is ValueCellFull!746) mapValue!2156)) b!49932))

(assert (= (and b!49924 ((_ is ValueCellFull!746) mapDefault!2156)) b!49934))

(assert (= b!49931 b!49924))

(assert (= start!7980 b!49931))

(declare-fun m!43361 () Bool)

(assert (=> b!49931 m!43361))

(declare-fun m!43363 () Bool)

(assert (=> b!49931 m!43363))

(declare-fun m!43365 () Bool)

(assert (=> b!49928 m!43365))

(declare-fun m!43367 () Bool)

(assert (=> start!7980 m!43367))

(declare-fun m!43369 () Bool)

(assert (=> mapNonEmpty!2156 m!43369))

(declare-fun m!43371 () Bool)

(assert (=> mapNonEmpty!2155 m!43371))

(declare-fun m!43373 () Bool)

(assert (=> b!49930 m!43373))

(declare-fun m!43375 () Bool)

(assert (=> b!49930 m!43375))

(declare-fun m!43377 () Bool)

(assert (=> b!49922 m!43377))

(check-sat (not b!49930) (not b_next!1525) (not b!49928) (not mapNonEmpty!2155) (not b_next!1527) (not b!49931) (not start!7980) b_and!2737 b_and!2739 (not mapNonEmpty!2156) (not b!49922) tp_is_empty!2179)
(check-sat b_and!2737 b_and!2739 (not b_next!1525) (not b_next!1527))
(get-model)

(declare-fun d!10063 () Bool)

(assert (=> d!10063 (= (array_inv!947 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) (bvsge (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!49930 d!10063))

(declare-fun d!10065 () Bool)

(assert (=> d!10065 (= (array_inv!948 (_values!1897 (v!2152 (underlying!124 thiss!992)))) (bvsge (size!1776 (_values!1897 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!49930 d!10065))

(declare-fun d!10067 () Bool)

(declare-fun res!28876 () Bool)

(declare-fun e!32292 () Bool)

(assert (=> d!10067 (=> (not res!28876) (not e!32292))))

(declare-fun simpleValid!33 (LongMapFixedSize!400) Bool)

(assert (=> d!10067 (= res!28876 (simpleValid!33 newMap!16))))

(assert (=> d!10067 (= (valid!140 newMap!16) e!32292)))

(declare-fun b!50025 () Bool)

(declare-fun res!28877 () Bool)

(assert (=> b!50025 (=> (not res!28877) (not e!32292))))

(declare-fun arrayCountValidKeys!0 (array!3247 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50025 (= res!28877 (= (arrayCountValidKeys!0 (_keys!3519 newMap!16) #b00000000000000000000000000000000 (size!1775 (_keys!3519 newMap!16))) (_size!249 newMap!16)))))

(declare-fun b!50026 () Bool)

(declare-fun res!28878 () Bool)

(assert (=> b!50026 (=> (not res!28878) (not e!32292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3247 (_ BitVec 32)) Bool)

(assert (=> b!50026 (= res!28878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3519 newMap!16) (mask!5695 newMap!16)))))

(declare-fun b!50027 () Bool)

(declare-datatypes ((List!1324 0))(
  ( (Nil!1321) (Cons!1320 (h!1900 (_ BitVec 64)) (t!4357 List!1324)) )
))
(declare-fun arrayNoDuplicates!0 (array!3247 (_ BitVec 32) List!1324) Bool)

(assert (=> b!50027 (= e!32292 (arrayNoDuplicates!0 (_keys!3519 newMap!16) #b00000000000000000000000000000000 Nil!1321))))

(assert (= (and d!10067 res!28876) b!50025))

(assert (= (and b!50025 res!28877) b!50026))

(assert (= (and b!50026 res!28878) b!50027))

(declare-fun m!43415 () Bool)

(assert (=> d!10067 m!43415))

(declare-fun m!43417 () Bool)

(assert (=> b!50025 m!43417))

(declare-fun m!43419 () Bool)

(assert (=> b!50026 m!43419))

(declare-fun m!43421 () Bool)

(assert (=> b!50027 m!43421))

(assert (=> b!49922 d!10067))

(declare-fun d!10069 () Bool)

(assert (=> d!10069 (= (valid!141 thiss!992) (valid!140 (v!2152 (underlying!124 thiss!992))))))

(declare-fun bs!2352 () Bool)

(assert (= bs!2352 d!10069))

(declare-fun m!43423 () Bool)

(assert (=> bs!2352 m!43423))

(assert (=> start!7980 d!10069))

(declare-fun d!10071 () Bool)

(assert (=> d!10071 (= (array_inv!947 (_keys!3519 newMap!16)) (bvsge (size!1775 (_keys!3519 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!49931 d!10071))

(declare-fun d!10073 () Bool)

(assert (=> d!10073 (= (array_inv!948 (_values!1897 newMap!16)) (bvsge (size!1776 (_values!1897 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!49931 d!10073))

(declare-fun d!10075 () Bool)

(assert (=> d!10075 (= (validMask!0 (mask!5695 (v!2152 (underlying!124 thiss!992)))) (and (or (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000001111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000011111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000001111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000011111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000001111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000011111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000001111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000011111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000001111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000011111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000001111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000011111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000001111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000011111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000111111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000001111111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000011111111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000111111111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00001111111111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00011111111111111111111111111111) (= (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!49928 d!10075))

(declare-fun mapNonEmpty!2171 () Bool)

(declare-fun mapRes!2171 () Bool)

(declare-fun tp!6653 () Bool)

(declare-fun e!32297 () Bool)

(assert (=> mapNonEmpty!2171 (= mapRes!2171 (and tp!6653 e!32297))))

(declare-fun mapValue!2171 () ValueCell!746)

(declare-fun mapKey!2171 () (_ BitVec 32))

(declare-fun mapRest!2171 () (Array (_ BitVec 32) ValueCell!746))

(assert (=> mapNonEmpty!2171 (= mapRest!2155 (store mapRest!2171 mapKey!2171 mapValue!2171))))

(declare-fun condMapEmpty!2171 () Bool)

(declare-fun mapDefault!2171 () ValueCell!746)

(assert (=> mapNonEmpty!2156 (= condMapEmpty!2171 (= mapRest!2155 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2171)))))

(declare-fun e!32298 () Bool)

(assert (=> mapNonEmpty!2156 (= tp!6626 (and e!32298 mapRes!2171))))

(declare-fun b!50034 () Bool)

(assert (=> b!50034 (= e!32297 tp_is_empty!2179)))

(declare-fun mapIsEmpty!2171 () Bool)

(assert (=> mapIsEmpty!2171 mapRes!2171))

(declare-fun b!50035 () Bool)

(assert (=> b!50035 (= e!32298 tp_is_empty!2179)))

(assert (= (and mapNonEmpty!2156 condMapEmpty!2171) mapIsEmpty!2171))

(assert (= (and mapNonEmpty!2156 (not condMapEmpty!2171)) mapNonEmpty!2171))

(assert (= (and mapNonEmpty!2171 ((_ is ValueCellFull!746) mapValue!2171)) b!50034))

(assert (= (and mapNonEmpty!2156 ((_ is ValueCellFull!746) mapDefault!2171)) b!50035))

(declare-fun m!43425 () Bool)

(assert (=> mapNonEmpty!2171 m!43425))

(declare-fun mapNonEmpty!2172 () Bool)

(declare-fun mapRes!2172 () Bool)

(declare-fun tp!6654 () Bool)

(declare-fun e!32299 () Bool)

(assert (=> mapNonEmpty!2172 (= mapRes!2172 (and tp!6654 e!32299))))

(declare-fun mapRest!2172 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapValue!2172 () ValueCell!746)

(declare-fun mapKey!2172 () (_ BitVec 32))

(assert (=> mapNonEmpty!2172 (= mapRest!2156 (store mapRest!2172 mapKey!2172 mapValue!2172))))

(declare-fun condMapEmpty!2172 () Bool)

(declare-fun mapDefault!2172 () ValueCell!746)

(assert (=> mapNonEmpty!2155 (= condMapEmpty!2172 (= mapRest!2156 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2172)))))

(declare-fun e!32300 () Bool)

(assert (=> mapNonEmpty!2155 (= tp!6624 (and e!32300 mapRes!2172))))

(declare-fun b!50036 () Bool)

(assert (=> b!50036 (= e!32299 tp_is_empty!2179)))

(declare-fun mapIsEmpty!2172 () Bool)

(assert (=> mapIsEmpty!2172 mapRes!2172))

(declare-fun b!50037 () Bool)

(assert (=> b!50037 (= e!32300 tp_is_empty!2179)))

(assert (= (and mapNonEmpty!2155 condMapEmpty!2172) mapIsEmpty!2172))

(assert (= (and mapNonEmpty!2155 (not condMapEmpty!2172)) mapNonEmpty!2172))

(assert (= (and mapNonEmpty!2172 ((_ is ValueCellFull!746) mapValue!2172)) b!50036))

(assert (= (and mapNonEmpty!2155 ((_ is ValueCellFull!746) mapDefault!2172)) b!50037))

(declare-fun m!43427 () Bool)

(assert (=> mapNonEmpty!2172 m!43427))

(check-sat b_and!2739 (not b!50026) (not b_next!1527) (not b!50025) (not d!10067) (not mapNonEmpty!2171) (not d!10069) (not b_next!1525) (not b!50027) tp_is_empty!2179 (not mapNonEmpty!2172) b_and!2737)
(check-sat b_and!2737 b_and!2739 (not b_next!1525) (not b_next!1527))
(get-model)

(declare-fun b!50046 () Bool)

(declare-fun e!32308 () Bool)

(declare-fun e!32309 () Bool)

(assert (=> b!50046 (= e!32308 e!32309)))

(declare-fun c!6739 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50046 (= c!6739 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3870 () Bool)

(declare-fun call!3873 () Bool)

(assert (=> bm!3870 (= call!3873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3519 newMap!16) (mask!5695 newMap!16)))))

(declare-fun d!10077 () Bool)

(declare-fun res!28883 () Bool)

(assert (=> d!10077 (=> res!28883 e!32308)))

(assert (=> d!10077 (= res!28883 (bvsge #b00000000000000000000000000000000 (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3519 newMap!16) (mask!5695 newMap!16)) e!32308)))

(declare-fun b!50047 () Bool)

(assert (=> b!50047 (= e!32309 call!3873)))

(declare-fun b!50048 () Bool)

(declare-fun e!32307 () Bool)

(assert (=> b!50048 (= e!32309 e!32307)))

(declare-fun lt!21004 () (_ BitVec 64))

(assert (=> b!50048 (= lt!21004 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1422 0))(
  ( (Unit!1423) )
))
(declare-fun lt!21002 () Unit!1422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3247 (_ BitVec 64) (_ BitVec 32)) Unit!1422)

(assert (=> b!50048 (= lt!21002 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3519 newMap!16) lt!21004 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50048 (arrayContainsKey!0 (_keys!3519 newMap!16) lt!21004 #b00000000000000000000000000000000)))

(declare-fun lt!21003 () Unit!1422)

(assert (=> b!50048 (= lt!21003 lt!21002)))

(declare-fun res!28884 () Bool)

(declare-datatypes ((SeekEntryResult!221 0))(
  ( (MissingZero!221 (index!3006 (_ BitVec 32))) (Found!221 (index!3007 (_ BitVec 32))) (Intermediate!221 (undefined!1033 Bool) (index!3008 (_ BitVec 32)) (x!9160 (_ BitVec 32))) (Undefined!221) (MissingVacant!221 (index!3009 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3247 (_ BitVec 32)) SeekEntryResult!221)

(assert (=> b!50048 (= res!28884 (= (seekEntryOrOpen!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) (_keys!3519 newMap!16) (mask!5695 newMap!16)) (Found!221 #b00000000000000000000000000000000)))))

(assert (=> b!50048 (=> (not res!28884) (not e!32307))))

(declare-fun b!50049 () Bool)

(assert (=> b!50049 (= e!32307 call!3873)))

(assert (= (and d!10077 (not res!28883)) b!50046))

(assert (= (and b!50046 c!6739) b!50048))

(assert (= (and b!50046 (not c!6739)) b!50047))

(assert (= (and b!50048 res!28884) b!50049))

(assert (= (or b!50049 b!50047) bm!3870))

(declare-fun m!43429 () Bool)

(assert (=> b!50046 m!43429))

(assert (=> b!50046 m!43429))

(declare-fun m!43431 () Bool)

(assert (=> b!50046 m!43431))

(declare-fun m!43433 () Bool)

(assert (=> bm!3870 m!43433))

(assert (=> b!50048 m!43429))

(declare-fun m!43435 () Bool)

(assert (=> b!50048 m!43435))

(declare-fun m!43437 () Bool)

(assert (=> b!50048 m!43437))

(assert (=> b!50048 m!43429))

(declare-fun m!43439 () Bool)

(assert (=> b!50048 m!43439))

(assert (=> b!50026 d!10077))

(declare-fun b!50058 () Bool)

(declare-fun e!32315 () (_ BitVec 32))

(assert (=> b!50058 (= e!32315 #b00000000000000000000000000000000)))

(declare-fun bm!3873 () Bool)

(declare-fun call!3876 () (_ BitVec 32))

(assert (=> bm!3873 (= call!3876 (arrayCountValidKeys!0 (_keys!3519 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))))))

(declare-fun d!10079 () Bool)

(declare-fun lt!21007 () (_ BitVec 32))

(assert (=> d!10079 (and (bvsge lt!21007 #b00000000000000000000000000000000) (bvsle lt!21007 (bvsub (size!1775 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10079 (= lt!21007 e!32315)))

(declare-fun c!6744 () Bool)

(assert (=> d!10079 (= c!6744 (bvsge #b00000000000000000000000000000000 (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10079 (and (bvsle #b00000000000000000000000000000000 (size!1775 (_keys!3519 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1775 (_keys!3519 newMap!16)) (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10079 (= (arrayCountValidKeys!0 (_keys!3519 newMap!16) #b00000000000000000000000000000000 (size!1775 (_keys!3519 newMap!16))) lt!21007)))

(declare-fun b!50059 () Bool)

(declare-fun e!32314 () (_ BitVec 32))

(assert (=> b!50059 (= e!32314 (bvadd #b00000000000000000000000000000001 call!3876))))

(declare-fun b!50060 () Bool)

(assert (=> b!50060 (= e!32315 e!32314)))

(declare-fun c!6745 () Bool)

(assert (=> b!50060 (= c!6745 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50061 () Bool)

(assert (=> b!50061 (= e!32314 call!3876)))

(assert (= (and d!10079 c!6744) b!50058))

(assert (= (and d!10079 (not c!6744)) b!50060))

(assert (= (and b!50060 c!6745) b!50059))

(assert (= (and b!50060 (not c!6745)) b!50061))

(assert (= (or b!50059 b!50061) bm!3873))

(declare-fun m!43441 () Bool)

(assert (=> bm!3873 m!43441))

(assert (=> b!50060 m!43429))

(assert (=> b!50060 m!43429))

(assert (=> b!50060 m!43431))

(assert (=> b!50025 d!10079))

(declare-fun b!50072 () Bool)

(declare-fun e!32326 () Bool)

(declare-fun call!3879 () Bool)

(assert (=> b!50072 (= e!32326 call!3879)))

(declare-fun d!10081 () Bool)

(declare-fun res!28893 () Bool)

(declare-fun e!32324 () Bool)

(assert (=> d!10081 (=> res!28893 e!32324)))

(assert (=> d!10081 (= res!28893 (bvsge #b00000000000000000000000000000000 (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10081 (= (arrayNoDuplicates!0 (_keys!3519 newMap!16) #b00000000000000000000000000000000 Nil!1321) e!32324)))

(declare-fun b!50073 () Bool)

(assert (=> b!50073 (= e!32326 call!3879)))

(declare-fun b!50074 () Bool)

(declare-fun e!32327 () Bool)

(declare-fun contains!614 (List!1324 (_ BitVec 64)) Bool)

(assert (=> b!50074 (= e!32327 (contains!614 Nil!1321 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50075 () Bool)

(declare-fun e!32325 () Bool)

(assert (=> b!50075 (= e!32325 e!32326)))

(declare-fun c!6748 () Bool)

(assert (=> b!50075 (= c!6748 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50076 () Bool)

(assert (=> b!50076 (= e!32324 e!32325)))

(declare-fun res!28891 () Bool)

(assert (=> b!50076 (=> (not res!28891) (not e!32325))))

(assert (=> b!50076 (= res!28891 (not e!32327))))

(declare-fun res!28892 () Bool)

(assert (=> b!50076 (=> (not res!28892) (not e!32327))))

(assert (=> b!50076 (= res!28892 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3876 () Bool)

(assert (=> bm!3876 (= call!3879 (arrayNoDuplicates!0 (_keys!3519 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6748 (Cons!1320 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) Nil!1321) Nil!1321)))))

(assert (= (and d!10081 (not res!28893)) b!50076))

(assert (= (and b!50076 res!28892) b!50074))

(assert (= (and b!50076 res!28891) b!50075))

(assert (= (and b!50075 c!6748) b!50073))

(assert (= (and b!50075 (not c!6748)) b!50072))

(assert (= (or b!50073 b!50072) bm!3876))

(assert (=> b!50074 m!43429))

(assert (=> b!50074 m!43429))

(declare-fun m!43443 () Bool)

(assert (=> b!50074 m!43443))

(assert (=> b!50075 m!43429))

(assert (=> b!50075 m!43429))

(assert (=> b!50075 m!43431))

(assert (=> b!50076 m!43429))

(assert (=> b!50076 m!43429))

(assert (=> b!50076 m!43431))

(assert (=> bm!3876 m!43429))

(declare-fun m!43445 () Bool)

(assert (=> bm!3876 m!43445))

(assert (=> b!50027 d!10081))

(declare-fun d!10083 () Bool)

(declare-fun res!28894 () Bool)

(declare-fun e!32328 () Bool)

(assert (=> d!10083 (=> (not res!28894) (not e!32328))))

(assert (=> d!10083 (= res!28894 (simpleValid!33 (v!2152 (underlying!124 thiss!992))))))

(assert (=> d!10083 (= (valid!140 (v!2152 (underlying!124 thiss!992))) e!32328)))

(declare-fun b!50077 () Bool)

(declare-fun res!28895 () Bool)

(assert (=> b!50077 (=> (not res!28895) (not e!32328))))

(assert (=> b!50077 (= res!28895 (= (arrayCountValidKeys!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000000 (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))) (_size!249 (v!2152 (underlying!124 thiss!992)))))))

(declare-fun b!50078 () Bool)

(declare-fun res!28896 () Bool)

(assert (=> b!50078 (=> (not res!28896) (not e!32328))))

(assert (=> b!50078 (= res!28896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3519 (v!2152 (underlying!124 thiss!992))) (mask!5695 (v!2152 (underlying!124 thiss!992)))))))

(declare-fun b!50079 () Bool)

(assert (=> b!50079 (= e!32328 (arrayNoDuplicates!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000000 Nil!1321))))

(assert (= (and d!10083 res!28894) b!50077))

(assert (= (and b!50077 res!28895) b!50078))

(assert (= (and b!50078 res!28896) b!50079))

(declare-fun m!43447 () Bool)

(assert (=> d!10083 m!43447))

(declare-fun m!43449 () Bool)

(assert (=> b!50077 m!43449))

(declare-fun m!43451 () Bool)

(assert (=> b!50078 m!43451))

(declare-fun m!43453 () Bool)

(assert (=> b!50079 m!43453))

(assert (=> d!10069 d!10083))

(declare-fun b!50091 () Bool)

(declare-fun e!32331 () Bool)

(assert (=> b!50091 (= e!32331 (and (bvsge (extraKeys!1805 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1805 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!249 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!50089 () Bool)

(declare-fun res!28908 () Bool)

(assert (=> b!50089 (=> (not res!28908) (not e!32331))))

(declare-fun size!1781 (LongMapFixedSize!400) (_ BitVec 32))

(assert (=> b!50089 (= res!28908 (bvsge (size!1781 newMap!16) (_size!249 newMap!16)))))

(declare-fun b!50088 () Bool)

(declare-fun res!28906 () Bool)

(assert (=> b!50088 (=> (not res!28906) (not e!32331))))

(assert (=> b!50088 (= res!28906 (and (= (size!1776 (_values!1897 newMap!16)) (bvadd (mask!5695 newMap!16) #b00000000000000000000000000000001)) (= (size!1775 (_keys!3519 newMap!16)) (size!1776 (_values!1897 newMap!16))) (bvsge (_size!249 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!249 newMap!16) (bvadd (mask!5695 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!10085 () Bool)

(declare-fun res!28907 () Bool)

(assert (=> d!10085 (=> (not res!28907) (not e!32331))))

(assert (=> d!10085 (= res!28907 (validMask!0 (mask!5695 newMap!16)))))

(assert (=> d!10085 (= (simpleValid!33 newMap!16) e!32331)))

(declare-fun b!50090 () Bool)

(declare-fun res!28905 () Bool)

(assert (=> b!50090 (=> (not res!28905) (not e!32331))))

(assert (=> b!50090 (= res!28905 (= (size!1781 newMap!16) (bvadd (_size!249 newMap!16) (bvsdiv (bvadd (extraKeys!1805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10085 res!28907) b!50088))

(assert (= (and b!50088 res!28906) b!50089))

(assert (= (and b!50089 res!28908) b!50090))

(assert (= (and b!50090 res!28905) b!50091))

(declare-fun m!43455 () Bool)

(assert (=> b!50089 m!43455))

(declare-fun m!43457 () Bool)

(assert (=> d!10085 m!43457))

(assert (=> b!50090 m!43455))

(assert (=> d!10067 d!10085))

(declare-fun mapNonEmpty!2173 () Bool)

(declare-fun mapRes!2173 () Bool)

(declare-fun tp!6655 () Bool)

(declare-fun e!32332 () Bool)

(assert (=> mapNonEmpty!2173 (= mapRes!2173 (and tp!6655 e!32332))))

(declare-fun mapKey!2173 () (_ BitVec 32))

(declare-fun mapRest!2173 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapValue!2173 () ValueCell!746)

(assert (=> mapNonEmpty!2173 (= mapRest!2171 (store mapRest!2173 mapKey!2173 mapValue!2173))))

(declare-fun condMapEmpty!2173 () Bool)

(declare-fun mapDefault!2173 () ValueCell!746)

(assert (=> mapNonEmpty!2171 (= condMapEmpty!2173 (= mapRest!2171 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2173)))))

(declare-fun e!32333 () Bool)

(assert (=> mapNonEmpty!2171 (= tp!6653 (and e!32333 mapRes!2173))))

(declare-fun b!50092 () Bool)

(assert (=> b!50092 (= e!32332 tp_is_empty!2179)))

(declare-fun mapIsEmpty!2173 () Bool)

(assert (=> mapIsEmpty!2173 mapRes!2173))

(declare-fun b!50093 () Bool)

(assert (=> b!50093 (= e!32333 tp_is_empty!2179)))

(assert (= (and mapNonEmpty!2171 condMapEmpty!2173) mapIsEmpty!2173))

(assert (= (and mapNonEmpty!2171 (not condMapEmpty!2173)) mapNonEmpty!2173))

(assert (= (and mapNonEmpty!2173 ((_ is ValueCellFull!746) mapValue!2173)) b!50092))

(assert (= (and mapNonEmpty!2171 ((_ is ValueCellFull!746) mapDefault!2173)) b!50093))

(declare-fun m!43459 () Bool)

(assert (=> mapNonEmpty!2173 m!43459))

(declare-fun mapNonEmpty!2174 () Bool)

(declare-fun mapRes!2174 () Bool)

(declare-fun tp!6656 () Bool)

(declare-fun e!32334 () Bool)

(assert (=> mapNonEmpty!2174 (= mapRes!2174 (and tp!6656 e!32334))))

(declare-fun mapRest!2174 () (Array (_ BitVec 32) ValueCell!746))

(declare-fun mapKey!2174 () (_ BitVec 32))

(declare-fun mapValue!2174 () ValueCell!746)

(assert (=> mapNonEmpty!2174 (= mapRest!2172 (store mapRest!2174 mapKey!2174 mapValue!2174))))

(declare-fun condMapEmpty!2174 () Bool)

(declare-fun mapDefault!2174 () ValueCell!746)

(assert (=> mapNonEmpty!2172 (= condMapEmpty!2174 (= mapRest!2172 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2174)))))

(declare-fun e!32335 () Bool)

(assert (=> mapNonEmpty!2172 (= tp!6654 (and e!32335 mapRes!2174))))

(declare-fun b!50094 () Bool)

(assert (=> b!50094 (= e!32334 tp_is_empty!2179)))

(declare-fun mapIsEmpty!2174 () Bool)

(assert (=> mapIsEmpty!2174 mapRes!2174))

(declare-fun b!50095 () Bool)

(assert (=> b!50095 (= e!32335 tp_is_empty!2179)))

(assert (= (and mapNonEmpty!2172 condMapEmpty!2174) mapIsEmpty!2174))

(assert (= (and mapNonEmpty!2172 (not condMapEmpty!2174)) mapNonEmpty!2174))

(assert (= (and mapNonEmpty!2174 ((_ is ValueCellFull!746) mapValue!2174)) b!50094))

(assert (= (and mapNonEmpty!2172 ((_ is ValueCellFull!746) mapDefault!2174)) b!50095))

(declare-fun m!43461 () Bool)

(assert (=> mapNonEmpty!2174 m!43461))

(check-sat (not mapNonEmpty!2174) b_and!2739 (not b!50076) (not b!50079) (not b_next!1525) (not b!50060) (not d!10085) tp_is_empty!2179 (not b!50078) (not b_next!1527) (not mapNonEmpty!2173) (not b!50090) (not bm!3876) (not b!50074) b_and!2737 (not d!10083) (not bm!3873) (not b!50046) (not b!50089) (not b!50075) (not b!50077) (not b!50048) (not bm!3870))
(check-sat b_and!2737 b_and!2739 (not b_next!1525) (not b_next!1527))
(get-model)

(declare-fun b!50099 () Bool)

(declare-fun e!32336 () Bool)

(assert (=> b!50099 (= e!32336 (and (bvsge (extraKeys!1805 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1805 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!249 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50097 () Bool)

(declare-fun res!28912 () Bool)

(assert (=> b!50097 (=> (not res!28912) (not e!32336))))

(assert (=> b!50097 (= res!28912 (bvsge (size!1781 (v!2152 (underlying!124 thiss!992))) (_size!249 (v!2152 (underlying!124 thiss!992)))))))

(declare-fun b!50096 () Bool)

(declare-fun res!28910 () Bool)

(assert (=> b!50096 (=> (not res!28910) (not e!32336))))

(assert (=> b!50096 (= res!28910 (and (= (size!1776 (_values!1897 (v!2152 (underlying!124 thiss!992)))) (bvadd (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000001)) (= (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) (size!1776 (_values!1897 (v!2152 (underlying!124 thiss!992))))) (bvsge (_size!249 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!249 (v!2152 (underlying!124 thiss!992))) (bvadd (mask!5695 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!10087 () Bool)

(declare-fun res!28911 () Bool)

(assert (=> d!10087 (=> (not res!28911) (not e!32336))))

(assert (=> d!10087 (= res!28911 (validMask!0 (mask!5695 (v!2152 (underlying!124 thiss!992)))))))

(assert (=> d!10087 (= (simpleValid!33 (v!2152 (underlying!124 thiss!992))) e!32336)))

(declare-fun b!50098 () Bool)

(declare-fun res!28909 () Bool)

(assert (=> b!50098 (=> (not res!28909) (not e!32336))))

(assert (=> b!50098 (= res!28909 (= (size!1781 (v!2152 (underlying!124 thiss!992))) (bvadd (_size!249 (v!2152 (underlying!124 thiss!992))) (bvsdiv (bvadd (extraKeys!1805 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10087 res!28911) b!50096))

(assert (= (and b!50096 res!28910) b!50097))

(assert (= (and b!50097 res!28912) b!50098))

(assert (= (and b!50098 res!28909) b!50099))

(declare-fun m!43463 () Bool)

(assert (=> b!50097 m!43463))

(assert (=> d!10087 m!43365))

(assert (=> b!50098 m!43463))

(assert (=> d!10083 d!10087))

(declare-fun d!10089 () Bool)

(declare-fun lt!21010 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!55 (List!1324) (InoxSet (_ BitVec 64)))

(assert (=> d!10089 (= lt!21010 (select (content!55 Nil!1321) (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32341 () Bool)

(assert (=> d!10089 (= lt!21010 e!32341)))

(declare-fun res!28918 () Bool)

(assert (=> d!10089 (=> (not res!28918) (not e!32341))))

(assert (=> d!10089 (= res!28918 ((_ is Cons!1320) Nil!1321))))

(assert (=> d!10089 (= (contains!614 Nil!1321 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)) lt!21010)))

(declare-fun b!50104 () Bool)

(declare-fun e!32342 () Bool)

(assert (=> b!50104 (= e!32341 e!32342)))

(declare-fun res!28917 () Bool)

(assert (=> b!50104 (=> res!28917 e!32342)))

(assert (=> b!50104 (= res!28917 (= (h!1900 Nil!1321) (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50105 () Bool)

(assert (=> b!50105 (= e!32342 (contains!614 (t!4357 Nil!1321) (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10089 res!28918) b!50104))

(assert (= (and b!50104 (not res!28917)) b!50105))

(declare-fun m!43465 () Bool)

(assert (=> d!10089 m!43465))

(assert (=> d!10089 m!43429))

(declare-fun m!43467 () Bool)

(assert (=> d!10089 m!43467))

(assert (=> b!50105 m!43429))

(declare-fun m!43469 () Bool)

(assert (=> b!50105 m!43469))

(assert (=> b!50074 d!10089))

(declare-fun d!10091 () Bool)

(assert (=> d!10091 (= (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50046 d!10091))

(declare-fun b!50106 () Bool)

(declare-fun e!32344 () (_ BitVec 32))

(assert (=> b!50106 (= e!32344 #b00000000000000000000000000000000)))

(declare-fun bm!3877 () Bool)

(declare-fun call!3880 () (_ BitVec 32))

(assert (=> bm!3877 (= call!3880 (arrayCountValidKeys!0 (_keys!3519 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))))))

(declare-fun d!10093 () Bool)

(declare-fun lt!21011 () (_ BitVec 32))

(assert (=> d!10093 (and (bvsge lt!21011 #b00000000000000000000000000000000) (bvsle lt!21011 (bvsub (size!1775 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10093 (= lt!21011 e!32344)))

(declare-fun c!6749 () Bool)

(assert (=> d!10093 (= c!6749 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10093 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1775 (_keys!3519 newMap!16)) (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10093 (= (arrayCountValidKeys!0 (_keys!3519 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))) lt!21011)))

(declare-fun b!50107 () Bool)

(declare-fun e!32343 () (_ BitVec 32))

(assert (=> b!50107 (= e!32343 (bvadd #b00000000000000000000000000000001 call!3880))))

(declare-fun b!50108 () Bool)

(assert (=> b!50108 (= e!32344 e!32343)))

(declare-fun c!6750 () Bool)

(assert (=> b!50108 (= c!6750 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50109 () Bool)

(assert (=> b!50109 (= e!32343 call!3880)))

(assert (= (and d!10093 c!6749) b!50106))

(assert (= (and d!10093 (not c!6749)) b!50108))

(assert (= (and b!50108 c!6750) b!50107))

(assert (= (and b!50108 (not c!6750)) b!50109))

(assert (= (or b!50107 b!50109) bm!3877))

(declare-fun m!43471 () Bool)

(assert (=> bm!3877 m!43471))

(declare-fun m!43473 () Bool)

(assert (=> b!50108 m!43473))

(assert (=> b!50108 m!43473))

(declare-fun m!43475 () Bool)

(assert (=> b!50108 m!43475))

(assert (=> bm!3873 d!10093))

(assert (=> b!50060 d!10091))

(declare-fun d!10095 () Bool)

(assert (=> d!10095 (= (size!1781 newMap!16) (bvadd (_size!249 newMap!16) (bvsdiv (bvadd (extraKeys!1805 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50090 d!10095))

(assert (=> b!50075 d!10091))

(assert (=> b!50089 d!10095))

(declare-fun b!50110 () Bool)

(declare-fun e!32346 () Bool)

(declare-fun e!32347 () Bool)

(assert (=> b!50110 (= e!32346 e!32347)))

(declare-fun c!6751 () Bool)

(assert (=> b!50110 (= c!6751 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3878 () Bool)

(declare-fun call!3881 () Bool)

(assert (=> bm!3878 (= call!3881 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3519 newMap!16) (mask!5695 newMap!16)))))

(declare-fun d!10097 () Bool)

(declare-fun res!28919 () Bool)

(assert (=> d!10097 (=> res!28919 e!32346)))

(assert (=> d!10097 (= res!28919 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10097 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3519 newMap!16) (mask!5695 newMap!16)) e!32346)))

(declare-fun b!50111 () Bool)

(assert (=> b!50111 (= e!32347 call!3881)))

(declare-fun b!50112 () Bool)

(declare-fun e!32345 () Bool)

(assert (=> b!50112 (= e!32347 e!32345)))

(declare-fun lt!21014 () (_ BitVec 64))

(assert (=> b!50112 (= lt!21014 (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21012 () Unit!1422)

(assert (=> b!50112 (= lt!21012 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3519 newMap!16) lt!21014 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50112 (arrayContainsKey!0 (_keys!3519 newMap!16) lt!21014 #b00000000000000000000000000000000)))

(declare-fun lt!21013 () Unit!1422)

(assert (=> b!50112 (= lt!21013 lt!21012)))

(declare-fun res!28920 () Bool)

(assert (=> b!50112 (= res!28920 (= (seekEntryOrOpen!0 (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3519 newMap!16) (mask!5695 newMap!16)) (Found!221 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50112 (=> (not res!28920) (not e!32345))))

(declare-fun b!50113 () Bool)

(assert (=> b!50113 (= e!32345 call!3881)))

(assert (= (and d!10097 (not res!28919)) b!50110))

(assert (= (and b!50110 c!6751) b!50112))

(assert (= (and b!50110 (not c!6751)) b!50111))

(assert (= (and b!50112 res!28920) b!50113))

(assert (= (or b!50113 b!50111) bm!3878))

(assert (=> b!50110 m!43473))

(assert (=> b!50110 m!43473))

(assert (=> b!50110 m!43475))

(declare-fun m!43477 () Bool)

(assert (=> bm!3878 m!43477))

(assert (=> b!50112 m!43473))

(declare-fun m!43479 () Bool)

(assert (=> b!50112 m!43479))

(declare-fun m!43481 () Bool)

(assert (=> b!50112 m!43481))

(assert (=> b!50112 m!43473))

(declare-fun m!43483 () Bool)

(assert (=> b!50112 m!43483))

(assert (=> bm!3870 d!10097))

(declare-fun b!50114 () Bool)

(declare-fun e!32350 () Bool)

(declare-fun call!3882 () Bool)

(assert (=> b!50114 (= e!32350 call!3882)))

(declare-fun d!10099 () Bool)

(declare-fun res!28923 () Bool)

(declare-fun e!32348 () Bool)

(assert (=> d!10099 (=> res!28923 e!32348)))

(assert (=> d!10099 (= res!28923 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))))))

(assert (=> d!10099 (= (arrayNoDuplicates!0 (_keys!3519 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6748 (Cons!1320 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) Nil!1321) Nil!1321)) e!32348)))

(declare-fun b!50115 () Bool)

(assert (=> b!50115 (= e!32350 call!3882)))

(declare-fun b!50116 () Bool)

(declare-fun e!32351 () Bool)

(assert (=> b!50116 (= e!32351 (contains!614 (ite c!6748 (Cons!1320 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) Nil!1321) Nil!1321) (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50117 () Bool)

(declare-fun e!32349 () Bool)

(assert (=> b!50117 (= e!32349 e!32350)))

(declare-fun c!6752 () Bool)

(assert (=> b!50117 (= c!6752 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50118 () Bool)

(assert (=> b!50118 (= e!32348 e!32349)))

(declare-fun res!28921 () Bool)

(assert (=> b!50118 (=> (not res!28921) (not e!32349))))

(assert (=> b!50118 (= res!28921 (not e!32351))))

(declare-fun res!28922 () Bool)

(assert (=> b!50118 (=> (not res!28922) (not e!32351))))

(assert (=> b!50118 (= res!28922 (validKeyInArray!0 (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3879 () Bool)

(assert (=> bm!3879 (= call!3882 (arrayNoDuplicates!0 (_keys!3519 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6752 (Cons!1320 (select (arr!1552 (_keys!3519 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6748 (Cons!1320 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) Nil!1321) Nil!1321)) (ite c!6748 (Cons!1320 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) Nil!1321) Nil!1321))))))

(assert (= (and d!10099 (not res!28923)) b!50118))

(assert (= (and b!50118 res!28922) b!50116))

(assert (= (and b!50118 res!28921) b!50117))

(assert (= (and b!50117 c!6752) b!50115))

(assert (= (and b!50117 (not c!6752)) b!50114))

(assert (= (or b!50115 b!50114) bm!3879))

(assert (=> b!50116 m!43473))

(assert (=> b!50116 m!43473))

(declare-fun m!43485 () Bool)

(assert (=> b!50116 m!43485))

(assert (=> b!50117 m!43473))

(assert (=> b!50117 m!43473))

(assert (=> b!50117 m!43475))

(assert (=> b!50118 m!43473))

(assert (=> b!50118 m!43473))

(assert (=> b!50118 m!43475))

(assert (=> bm!3879 m!43473))

(declare-fun m!43487 () Bool)

(assert (=> bm!3879 m!43487))

(assert (=> bm!3876 d!10099))

(declare-fun d!10101 () Bool)

(assert (=> d!10101 (arrayContainsKey!0 (_keys!3519 newMap!16) lt!21004 #b00000000000000000000000000000000)))

(declare-fun lt!21017 () Unit!1422)

(declare-fun choose!13 (array!3247 (_ BitVec 64) (_ BitVec 32)) Unit!1422)

(assert (=> d!10101 (= lt!21017 (choose!13 (_keys!3519 newMap!16) lt!21004 #b00000000000000000000000000000000))))

(assert (=> d!10101 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10101 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3519 newMap!16) lt!21004 #b00000000000000000000000000000000) lt!21017)))

(declare-fun bs!2353 () Bool)

(assert (= bs!2353 d!10101))

(assert (=> bs!2353 m!43437))

(declare-fun m!43489 () Bool)

(assert (=> bs!2353 m!43489))

(assert (=> b!50048 d!10101))

(declare-fun d!10103 () Bool)

(declare-fun res!28928 () Bool)

(declare-fun e!32356 () Bool)

(assert (=> d!10103 (=> res!28928 e!32356)))

(assert (=> d!10103 (= res!28928 (= (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) lt!21004))))

(assert (=> d!10103 (= (arrayContainsKey!0 (_keys!3519 newMap!16) lt!21004 #b00000000000000000000000000000000) e!32356)))

(declare-fun b!50123 () Bool)

(declare-fun e!32357 () Bool)

(assert (=> b!50123 (= e!32356 e!32357)))

(declare-fun res!28929 () Bool)

(assert (=> b!50123 (=> (not res!28929) (not e!32357))))

(assert (=> b!50123 (= res!28929 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 newMap!16))))))

(declare-fun b!50124 () Bool)

(assert (=> b!50124 (= e!32357 (arrayContainsKey!0 (_keys!3519 newMap!16) lt!21004 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10103 (not res!28928)) b!50123))

(assert (= (and b!50123 res!28929) b!50124))

(assert (=> d!10103 m!43429))

(declare-fun m!43491 () Bool)

(assert (=> b!50124 m!43491))

(assert (=> b!50048 d!10103))

(declare-fun b!50137 () Bool)

(declare-fun e!32366 () SeekEntryResult!221)

(declare-fun lt!21024 () SeekEntryResult!221)

(assert (=> b!50137 (= e!32366 (Found!221 (index!3008 lt!21024)))))

(declare-fun b!50138 () Bool)

(declare-fun e!32364 () SeekEntryResult!221)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3247 (_ BitVec 32)) SeekEntryResult!221)

(assert (=> b!50138 (= e!32364 (seekKeyOrZeroReturnVacant!0 (x!9160 lt!21024) (index!3008 lt!21024) (index!3008 lt!21024) (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) (_keys!3519 newMap!16) (mask!5695 newMap!16)))))

(declare-fun b!50139 () Bool)

(declare-fun e!32365 () SeekEntryResult!221)

(assert (=> b!50139 (= e!32365 e!32366)))

(declare-fun lt!21026 () (_ BitVec 64))

(assert (=> b!50139 (= lt!21026 (select (arr!1552 (_keys!3519 newMap!16)) (index!3008 lt!21024)))))

(declare-fun c!6759 () Bool)

(assert (=> b!50139 (= c!6759 (= lt!21026 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10105 () Bool)

(declare-fun lt!21025 () SeekEntryResult!221)

(assert (=> d!10105 (and (or ((_ is Undefined!221) lt!21025) (not ((_ is Found!221) lt!21025)) (and (bvsge (index!3007 lt!21025) #b00000000000000000000000000000000) (bvslt (index!3007 lt!21025) (size!1775 (_keys!3519 newMap!16))))) (or ((_ is Undefined!221) lt!21025) ((_ is Found!221) lt!21025) (not ((_ is MissingZero!221) lt!21025)) (and (bvsge (index!3006 lt!21025) #b00000000000000000000000000000000) (bvslt (index!3006 lt!21025) (size!1775 (_keys!3519 newMap!16))))) (or ((_ is Undefined!221) lt!21025) ((_ is Found!221) lt!21025) ((_ is MissingZero!221) lt!21025) (not ((_ is MissingVacant!221) lt!21025)) (and (bvsge (index!3009 lt!21025) #b00000000000000000000000000000000) (bvslt (index!3009 lt!21025) (size!1775 (_keys!3519 newMap!16))))) (or ((_ is Undefined!221) lt!21025) (ite ((_ is Found!221) lt!21025) (= (select (arr!1552 (_keys!3519 newMap!16)) (index!3007 lt!21025)) (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!221) lt!21025) (= (select (arr!1552 (_keys!3519 newMap!16)) (index!3006 lt!21025)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!221) lt!21025) (= (select (arr!1552 (_keys!3519 newMap!16)) (index!3009 lt!21025)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10105 (= lt!21025 e!32365)))

(declare-fun c!6760 () Bool)

(assert (=> d!10105 (= c!6760 (and ((_ is Intermediate!221) lt!21024) (undefined!1033 lt!21024)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3247 (_ BitVec 32)) SeekEntryResult!221)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10105 (= lt!21024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) (mask!5695 newMap!16)) (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) (_keys!3519 newMap!16) (mask!5695 newMap!16)))))

(assert (=> d!10105 (validMask!0 (mask!5695 newMap!16))))

(assert (=> d!10105 (= (seekEntryOrOpen!0 (select (arr!1552 (_keys!3519 newMap!16)) #b00000000000000000000000000000000) (_keys!3519 newMap!16) (mask!5695 newMap!16)) lt!21025)))

(declare-fun b!50140 () Bool)

(assert (=> b!50140 (= e!32365 Undefined!221)))

(declare-fun b!50141 () Bool)

(assert (=> b!50141 (= e!32364 (MissingZero!221 (index!3008 lt!21024)))))

(declare-fun b!50142 () Bool)

(declare-fun c!6761 () Bool)

(assert (=> b!50142 (= c!6761 (= lt!21026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50142 (= e!32366 e!32364)))

(assert (= (and d!10105 c!6760) b!50140))

(assert (= (and d!10105 (not c!6760)) b!50139))

(assert (= (and b!50139 c!6759) b!50137))

(assert (= (and b!50139 (not c!6759)) b!50142))

(assert (= (and b!50142 c!6761) b!50141))

(assert (= (and b!50142 (not c!6761)) b!50138))

(assert (=> b!50138 m!43429))

(declare-fun m!43493 () Bool)

(assert (=> b!50138 m!43493))

(declare-fun m!43495 () Bool)

(assert (=> b!50139 m!43495))

(declare-fun m!43497 () Bool)

(assert (=> d!10105 m!43497))

(assert (=> d!10105 m!43429))

(declare-fun m!43499 () Bool)

(assert (=> d!10105 m!43499))

(assert (=> d!10105 m!43457))

(assert (=> d!10105 m!43499))

(assert (=> d!10105 m!43429))

(declare-fun m!43501 () Bool)

(assert (=> d!10105 m!43501))

(declare-fun m!43503 () Bool)

(assert (=> d!10105 m!43503))

(declare-fun m!43505 () Bool)

(assert (=> d!10105 m!43505))

(assert (=> b!50048 d!10105))

(assert (=> b!50076 d!10091))

(declare-fun b!50143 () Bool)

(declare-fun e!32368 () Bool)

(declare-fun e!32369 () Bool)

(assert (=> b!50143 (= e!32368 e!32369)))

(declare-fun c!6762 () Bool)

(assert (=> b!50143 (= c!6762 (validKeyInArray!0 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3880 () Bool)

(declare-fun call!3883 () Bool)

(assert (=> bm!3880 (= call!3883 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3519 (v!2152 (underlying!124 thiss!992))) (mask!5695 (v!2152 (underlying!124 thiss!992)))))))

(declare-fun d!10107 () Bool)

(declare-fun res!28930 () Bool)

(assert (=> d!10107 (=> res!28930 e!32368)))

(assert (=> d!10107 (= res!28930 (bvsge #b00000000000000000000000000000000 (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))))))

(assert (=> d!10107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3519 (v!2152 (underlying!124 thiss!992))) (mask!5695 (v!2152 (underlying!124 thiss!992)))) e!32368)))

(declare-fun b!50144 () Bool)

(assert (=> b!50144 (= e!32369 call!3883)))

(declare-fun b!50145 () Bool)

(declare-fun e!32367 () Bool)

(assert (=> b!50145 (= e!32369 e!32367)))

(declare-fun lt!21029 () (_ BitVec 64))

(assert (=> b!50145 (= lt!21029 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21027 () Unit!1422)

(assert (=> b!50145 (= lt!21027 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) lt!21029 #b00000000000000000000000000000000))))

(assert (=> b!50145 (arrayContainsKey!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) lt!21029 #b00000000000000000000000000000000)))

(declare-fun lt!21028 () Unit!1422)

(assert (=> b!50145 (= lt!21028 lt!21027)))

(declare-fun res!28931 () Bool)

(assert (=> b!50145 (= res!28931 (= (seekEntryOrOpen!0 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000) (_keys!3519 (v!2152 (underlying!124 thiss!992))) (mask!5695 (v!2152 (underlying!124 thiss!992)))) (Found!221 #b00000000000000000000000000000000)))))

(assert (=> b!50145 (=> (not res!28931) (not e!32367))))

(declare-fun b!50146 () Bool)

(assert (=> b!50146 (= e!32367 call!3883)))

(assert (= (and d!10107 (not res!28930)) b!50143))

(assert (= (and b!50143 c!6762) b!50145))

(assert (= (and b!50143 (not c!6762)) b!50144))

(assert (= (and b!50145 res!28931) b!50146))

(assert (= (or b!50146 b!50144) bm!3880))

(declare-fun m!43507 () Bool)

(assert (=> b!50143 m!43507))

(assert (=> b!50143 m!43507))

(declare-fun m!43509 () Bool)

(assert (=> b!50143 m!43509))

(declare-fun m!43511 () Bool)

(assert (=> bm!3880 m!43511))

(assert (=> b!50145 m!43507))

(declare-fun m!43513 () Bool)

(assert (=> b!50145 m!43513))

(declare-fun m!43515 () Bool)

(assert (=> b!50145 m!43515))

(assert (=> b!50145 m!43507))

(declare-fun m!43517 () Bool)

(assert (=> b!50145 m!43517))

(assert (=> b!50078 d!10107))

(declare-fun b!50147 () Bool)

(declare-fun e!32371 () (_ BitVec 32))

(assert (=> b!50147 (= e!32371 #b00000000000000000000000000000000)))

(declare-fun bm!3881 () Bool)

(declare-fun call!3884 () (_ BitVec 32))

(assert (=> bm!3881 (= call!3884 (arrayCountValidKeys!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))))))

(declare-fun d!10109 () Bool)

(declare-fun lt!21030 () (_ BitVec 32))

(assert (=> d!10109 (and (bvsge lt!21030 #b00000000000000000000000000000000) (bvsle lt!21030 (bvsub (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10109 (= lt!21030 e!32371)))

(declare-fun c!6763 () Bool)

(assert (=> d!10109 (= c!6763 (bvsge #b00000000000000000000000000000000 (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))))))

(assert (=> d!10109 (and (bvsle #b00000000000000000000000000000000 (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))))))

(assert (=> d!10109 (= (arrayCountValidKeys!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000000 (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))) lt!21030)))

(declare-fun b!50148 () Bool)

(declare-fun e!32370 () (_ BitVec 32))

(assert (=> b!50148 (= e!32370 (bvadd #b00000000000000000000000000000001 call!3884))))

(declare-fun b!50149 () Bool)

(assert (=> b!50149 (= e!32371 e!32370)))

(declare-fun c!6764 () Bool)

(assert (=> b!50149 (= c!6764 (validKeyInArray!0 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50150 () Bool)

(assert (=> b!50150 (= e!32370 call!3884)))

(assert (= (and d!10109 c!6763) b!50147))

(assert (= (and d!10109 (not c!6763)) b!50149))

(assert (= (and b!50149 c!6764) b!50148))

(assert (= (and b!50149 (not c!6764)) b!50150))

(assert (= (or b!50148 b!50150) bm!3881))

(declare-fun m!43519 () Bool)

(assert (=> bm!3881 m!43519))

(assert (=> b!50149 m!43507))

(assert (=> b!50149 m!43507))

(assert (=> b!50149 m!43509))

(assert (=> b!50077 d!10109))

(declare-fun b!50151 () Bool)

(declare-fun e!32374 () Bool)

(declare-fun call!3885 () Bool)

(assert (=> b!50151 (= e!32374 call!3885)))

(declare-fun d!10111 () Bool)

(declare-fun res!28934 () Bool)

(declare-fun e!32372 () Bool)

(assert (=> d!10111 (=> res!28934 e!32372)))

(assert (=> d!10111 (= res!28934 (bvsge #b00000000000000000000000000000000 (size!1775 (_keys!3519 (v!2152 (underlying!124 thiss!992))))))))

(assert (=> d!10111 (= (arrayNoDuplicates!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) #b00000000000000000000000000000000 Nil!1321) e!32372)))

(declare-fun b!50152 () Bool)

(assert (=> b!50152 (= e!32374 call!3885)))

(declare-fun b!50153 () Bool)

(declare-fun e!32375 () Bool)

(assert (=> b!50153 (= e!32375 (contains!614 Nil!1321 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50154 () Bool)

(declare-fun e!32373 () Bool)

(assert (=> b!50154 (= e!32373 e!32374)))

(declare-fun c!6765 () Bool)

(assert (=> b!50154 (= c!6765 (validKeyInArray!0 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50155 () Bool)

(assert (=> b!50155 (= e!32372 e!32373)))

(declare-fun res!28932 () Bool)

(assert (=> b!50155 (=> (not res!28932) (not e!32373))))

(assert (=> b!50155 (= res!28932 (not e!32375))))

(declare-fun res!28933 () Bool)

(assert (=> b!50155 (=> (not res!28933) (not e!32375))))

(assert (=> b!50155 (= res!28933 (validKeyInArray!0 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3882 () Bool)

(assert (=> bm!3882 (= call!3885 (arrayNoDuplicates!0 (_keys!3519 (v!2152 (underlying!124 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6765 (Cons!1320 (select (arr!1552 (_keys!3519 (v!2152 (underlying!124 thiss!992)))) #b00000000000000000000000000000000) Nil!1321) Nil!1321)))))

(assert (= (and d!10111 (not res!28934)) b!50155))

(assert (= (and b!50155 res!28933) b!50153))

(assert (= (and b!50155 res!28932) b!50154))

(assert (= (and b!50154 c!6765) b!50152))

(assert (= (and b!50154 (not c!6765)) b!50151))

(assert (= (or b!50152 b!50151) bm!3882))

(assert (=> b!50153 m!43507))

(assert (=> b!50153 m!43507))

(declare-fun m!43521 () Bool)

(assert (=> b!50153 m!43521))

(assert (=> b!50154 m!43507))

(assert (=> b!50154 m!43507))

(assert (=> b!50154 m!43509))

(assert (=> b!50155 m!43507))

(assert (=> b!50155 m!43507))

(assert (=> b!50155 m!43509))

(assert (=> bm!3882 m!43507))

(declare-fun m!43523 () Bool)

(assert (=> bm!3882 m!43523))

(assert (=> b!50079 d!10111))

(declare-fun d!10113 () Bool)

(assert (=> d!10113 (= (validMask!0 (mask!5695 newMap!16)) (and (or (= (mask!5695 newMap!16) #b00000000000000000000000000000111) (= (mask!5695 newMap!16) #b00000000000000000000000000001111) (= (mask!5695 newMap!16) #b00000000000000000000000000011111) (= (mask!5695 newMap!16) #b00000000000000000000000000111111) (= (mask!5695 newMap!16) #b00000000000000000000000001111111) (= (mask!5695 newMap!16) #b00000000000000000000000011111111) (= (mask!5695 newMap!16) #b00000000000000000000000111111111) (= (mask!5695 newMap!16) #b00000000000000000000001111111111) (= (mask!5695 newMap!16) #b00000000000000000000011111111111) (= (mask!5695 newMap!16) #b00000000000000000000111111111111) (= (mask!5695 newMap!16) #b00000000000000000001111111111111) (= (mask!5695 newMap!16) #b00000000000000000011111111111111) (= (mask!5695 newMap!16) #b00000000000000000111111111111111) (= (mask!5695 newMap!16) #b00000000000000001111111111111111) (= (mask!5695 newMap!16) #b00000000000000011111111111111111) (= (mask!5695 newMap!16) #b00000000000000111111111111111111) (= (mask!5695 newMap!16) #b00000000000001111111111111111111) (= (mask!5695 newMap!16) #b00000000000011111111111111111111) (= (mask!5695 newMap!16) #b00000000000111111111111111111111) (= (mask!5695 newMap!16) #b00000000001111111111111111111111) (= (mask!5695 newMap!16) #b00000000011111111111111111111111) (= (mask!5695 newMap!16) #b00000000111111111111111111111111) (= (mask!5695 newMap!16) #b00000001111111111111111111111111) (= (mask!5695 newMap!16) #b00000011111111111111111111111111) (= (mask!5695 newMap!16) #b00000111111111111111111111111111) (= (mask!5695 newMap!16) #b00001111111111111111111111111111) (= (mask!5695 newMap!16) #b00011111111111111111111111111111) (= (mask!5695 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5695 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10085 d!10113))

(declare-fun mapNonEmpty!2175 () Bool)

(declare-fun mapRes!2175 () Bool)

(declare-fun tp!6657 () Bool)

(declare-fun e!32376 () Bool)

(assert (=> mapNonEmpty!2175 (= mapRes!2175 (and tp!6657 e!32376))))

(declare-fun mapValue!2175 () ValueCell!746)

(declare-fun mapKey!2175 () (_ BitVec 32))

(declare-fun mapRest!2175 () (Array (_ BitVec 32) ValueCell!746))

(assert (=> mapNonEmpty!2175 (= mapRest!2173 (store mapRest!2175 mapKey!2175 mapValue!2175))))

(declare-fun condMapEmpty!2175 () Bool)

(declare-fun mapDefault!2175 () ValueCell!746)

(assert (=> mapNonEmpty!2173 (= condMapEmpty!2175 (= mapRest!2173 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2175)))))

(declare-fun e!32377 () Bool)

(assert (=> mapNonEmpty!2173 (= tp!6655 (and e!32377 mapRes!2175))))

(declare-fun b!50156 () Bool)

(assert (=> b!50156 (= e!32376 tp_is_empty!2179)))

(declare-fun mapIsEmpty!2175 () Bool)

(assert (=> mapIsEmpty!2175 mapRes!2175))

(declare-fun b!50157 () Bool)

(assert (=> b!50157 (= e!32377 tp_is_empty!2179)))

(assert (= (and mapNonEmpty!2173 condMapEmpty!2175) mapIsEmpty!2175))

(assert (= (and mapNonEmpty!2173 (not condMapEmpty!2175)) mapNonEmpty!2175))

(assert (= (and mapNonEmpty!2175 ((_ is ValueCellFull!746) mapValue!2175)) b!50156))

(assert (= (and mapNonEmpty!2173 ((_ is ValueCellFull!746) mapDefault!2175)) b!50157))

(declare-fun m!43525 () Bool)

(assert (=> mapNonEmpty!2175 m!43525))

(declare-fun mapNonEmpty!2176 () Bool)

(declare-fun mapRes!2176 () Bool)

(declare-fun tp!6658 () Bool)

(declare-fun e!32378 () Bool)

(assert (=> mapNonEmpty!2176 (= mapRes!2176 (and tp!6658 e!32378))))

(declare-fun mapValue!2176 () ValueCell!746)

(declare-fun mapKey!2176 () (_ BitVec 32))

(declare-fun mapRest!2176 () (Array (_ BitVec 32) ValueCell!746))

(assert (=> mapNonEmpty!2176 (= mapRest!2174 (store mapRest!2176 mapKey!2176 mapValue!2176))))

(declare-fun condMapEmpty!2176 () Bool)

(declare-fun mapDefault!2176 () ValueCell!746)

(assert (=> mapNonEmpty!2174 (= condMapEmpty!2176 (= mapRest!2174 ((as const (Array (_ BitVec 32) ValueCell!746)) mapDefault!2176)))))

(declare-fun e!32379 () Bool)

(assert (=> mapNonEmpty!2174 (= tp!6656 (and e!32379 mapRes!2176))))

(declare-fun b!50158 () Bool)

(assert (=> b!50158 (= e!32378 tp_is_empty!2179)))

(declare-fun mapIsEmpty!2176 () Bool)

(assert (=> mapIsEmpty!2176 mapRes!2176))

(declare-fun b!50159 () Bool)

(assert (=> b!50159 (= e!32379 tp_is_empty!2179)))

(assert (= (and mapNonEmpty!2174 condMapEmpty!2176) mapIsEmpty!2176))

(assert (= (and mapNonEmpty!2174 (not condMapEmpty!2176)) mapNonEmpty!2176))

(assert (= (and mapNonEmpty!2176 ((_ is ValueCellFull!746) mapValue!2176)) b!50158))

(assert (= (and mapNonEmpty!2174 ((_ is ValueCellFull!746) mapDefault!2176)) b!50159))

(declare-fun m!43527 () Bool)

(assert (=> mapNonEmpty!2176 m!43527))

(check-sat (not d!10105) (not b!50124) (not b_next!1525) (not b!50149) (not d!10087) (not mapNonEmpty!2175) tp_is_empty!2179 (not bm!3881) (not b_next!1527) (not b!50153) b_and!2737 b_and!2739 (not b!50108) (not b!50112) (not b!50154) (not bm!3877) (not d!10089) (not mapNonEmpty!2176) (not bm!3882) (not b!50145) (not b!50097) (not b!50110) (not bm!3879) (not b!50105) (not b!50138) (not b!50116) (not b!50117) (not bm!3878) (not b!50098) (not b!50118) (not b!50143) (not d!10101) (not b!50155) (not bm!3880))
(check-sat b_and!2737 b_and!2739 (not b_next!1525) (not b_next!1527))
