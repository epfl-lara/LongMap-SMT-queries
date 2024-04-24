; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8094 () Bool)

(assert start!8094)

(declare-fun b!50886 () Bool)

(declare-fun b_free!1573 () Bool)

(declare-fun b_next!1573 () Bool)

(assert (=> b!50886 (= b_free!1573 (not b_next!1573))))

(declare-fun tp!6792 () Bool)

(declare-fun b_and!2781 () Bool)

(assert (=> b!50886 (= tp!6792 b_and!2781)))

(declare-fun b!50891 () Bool)

(declare-fun b_free!1575 () Bool)

(declare-fun b_next!1575 () Bool)

(assert (=> b!50891 (= b_free!1575 (not b_next!1575))))

(declare-fun tp!6794 () Bool)

(declare-fun b_and!2783 () Bool)

(assert (=> b!50891 (= tp!6794 b_and!2783)))

(declare-datatypes ((V!2585 0))(
  ( (V!2586 (val!1146 Int)) )
))
(declare-datatypes ((array!3307 0))(
  ( (array!3308 (arr!1580 (Array (_ BitVec 32) (_ BitVec 64))) (size!1805 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!758 0))(
  ( (ValueCellFull!758 (v!2180 V!2585)) (EmptyCell!758) )
))
(declare-datatypes ((array!3309 0))(
  ( (array!3310 (arr!1581 (Array (_ BitVec 32) ValueCell!758)) (size!1806 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!424 0))(
  ( (LongMapFixedSize!425 (defaultEntry!1926 Int) (mask!5725 (_ BitVec 32)) (extraKeys!1817 (_ BitVec 32)) (zeroValue!1844 V!2585) (minValue!1844 V!2585) (_size!261 (_ BitVec 32)) (_keys!3538 array!3307) (_values!1909 array!3309) (_vacant!261 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!248 0))(
  ( (Cell!249 (v!2181 LongMapFixedSize!424)) )
))
(declare-datatypes ((LongMap!248 0))(
  ( (LongMap!249 (underlying!135 Cell!248)) )
))
(declare-fun thiss!992 () LongMap!248)

(declare-fun e!32946 () Bool)

(declare-fun tp_is_empty!2203 () Bool)

(declare-fun e!32947 () Bool)

(declare-fun array_inv!949 (array!3307) Bool)

(declare-fun array_inv!950 (array!3309) Bool)

(assert (=> b!50886 (= e!32947 (and tp!6792 tp_is_empty!2203 (array_inv!949 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) (array_inv!950 (_values!1909 (v!2181 (underlying!135 thiss!992)))) e!32946))))

(declare-fun b!50887 () Bool)

(declare-fun e!32945 () Bool)

(assert (=> b!50887 (= e!32945 e!32947)))

(declare-fun mapNonEmpty!2251 () Bool)

(declare-fun mapRes!2252 () Bool)

(declare-fun tp!6791 () Bool)

(declare-fun e!32949 () Bool)

(assert (=> mapNonEmpty!2251 (= mapRes!2252 (and tp!6791 e!32949))))

(declare-fun mapRest!2252 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapValue!2252 () ValueCell!758)

(declare-fun mapKey!2252 () (_ BitVec 32))

(assert (=> mapNonEmpty!2251 (= (arr!1581 (_values!1909 (v!2181 (underlying!135 thiss!992)))) (store mapRest!2252 mapKey!2252 mapValue!2252))))

(declare-fun b!50888 () Bool)

(declare-fun e!32955 () Bool)

(assert (=> b!50888 (= e!32955 tp_is_empty!2203)))

(declare-fun b!50889 () Bool)

(assert (=> b!50889 (= e!32949 tp_is_empty!2203)))

(declare-fun b!50890 () Bool)

(declare-fun res!29209 () Bool)

(declare-fun e!32944 () Bool)

(assert (=> b!50890 (=> (not res!29209) (not e!32944))))

(declare-fun newMap!16 () LongMapFixedSize!424)

(declare-fun valid!157 (LongMapFixedSize!424) Bool)

(assert (=> b!50890 (= res!29209 (valid!157 newMap!16))))

(declare-fun e!32952 () Bool)

(declare-fun e!32953 () Bool)

(assert (=> b!50891 (= e!32953 (and tp!6794 tp_is_empty!2203 (array_inv!949 (_keys!3538 newMap!16)) (array_inv!950 (_values!1909 newMap!16)) e!32952))))

(declare-fun b!50892 () Bool)

(declare-fun res!29207 () Bool)

(assert (=> b!50892 (=> (not res!29207) (not e!32944))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50892 (= res!29207 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992)))))))))

(declare-fun b!50893 () Bool)

(declare-fun e!32948 () Bool)

(assert (=> b!50893 (= e!32948 e!32945)))

(declare-fun b!50894 () Bool)

(declare-fun res!29205 () Bool)

(assert (=> b!50894 (=> (not res!29205) (not e!32944))))

(assert (=> b!50894 (= res!29205 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5725 newMap!16)) (_size!261 (v!2181 (underlying!135 thiss!992)))))))

(declare-fun b!50895 () Bool)

(declare-fun e!32950 () Bool)

(declare-fun mapRes!2251 () Bool)

(assert (=> b!50895 (= e!32952 (and e!32950 mapRes!2251))))

(declare-fun condMapEmpty!2251 () Bool)

(declare-fun mapDefault!2252 () ValueCell!758)

(assert (=> b!50895 (= condMapEmpty!2251 (= (arr!1581 (_values!1909 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2252)))))

(declare-fun b!50896 () Bool)

(declare-fun e!32954 () Bool)

(assert (=> b!50896 (= e!32954 tp_is_empty!2203)))

(declare-fun mapIsEmpty!2251 () Bool)

(assert (=> mapIsEmpty!2251 mapRes!2252))

(declare-fun mapNonEmpty!2252 () Bool)

(declare-fun tp!6793 () Bool)

(assert (=> mapNonEmpty!2252 (= mapRes!2251 (and tp!6793 e!32954))))

(declare-fun mapValue!2251 () ValueCell!758)

(declare-fun mapKey!2251 () (_ BitVec 32))

(declare-fun mapRest!2251 () (Array (_ BitVec 32) ValueCell!758))

(assert (=> mapNonEmpty!2252 (= (arr!1581 (_values!1909 newMap!16)) (store mapRest!2251 mapKey!2251 mapValue!2251))))

(declare-fun b!50897 () Bool)

(assert (=> b!50897 (= e!32950 tp_is_empty!2203)))

(declare-fun res!29206 () Bool)

(assert (=> start!8094 (=> (not res!29206) (not e!32944))))

(declare-fun valid!158 (LongMap!248) Bool)

(assert (=> start!8094 (= res!29206 (valid!158 thiss!992))))

(assert (=> start!8094 e!32944))

(assert (=> start!8094 e!32948))

(assert (=> start!8094 true))

(assert (=> start!8094 e!32953))

(declare-fun mapIsEmpty!2252 () Bool)

(assert (=> mapIsEmpty!2252 mapRes!2251))

(declare-fun b!50898 () Bool)

(assert (=> b!50898 (= e!32946 (and e!32955 mapRes!2252))))

(declare-fun condMapEmpty!2252 () Bool)

(declare-fun mapDefault!2251 () ValueCell!758)

(assert (=> b!50898 (= condMapEmpty!2252 (= (arr!1581 (_values!1909 (v!2181 (underlying!135 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2251)))))

(declare-fun b!50899 () Bool)

(assert (=> b!50899 (= e!32944 (and (= (size!1806 (_values!1909 (v!2181 (underlying!135 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5725 (v!2181 (underlying!135 thiss!992))))) (= (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) (size!1806 (_values!1909 (v!2181 (underlying!135 thiss!992))))) (bvsge (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!1817 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50900 () Bool)

(declare-fun res!29208 () Bool)

(assert (=> b!50900 (=> (not res!29208) (not e!32944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50900 (= res!29208 (validMask!0 (mask!5725 (v!2181 (underlying!135 thiss!992)))))))

(assert (= (and start!8094 res!29206) b!50892))

(assert (= (and b!50892 res!29207) b!50890))

(assert (= (and b!50890 res!29209) b!50894))

(assert (= (and b!50894 res!29205) b!50900))

(assert (= (and b!50900 res!29208) b!50899))

(assert (= (and b!50898 condMapEmpty!2252) mapIsEmpty!2251))

(assert (= (and b!50898 (not condMapEmpty!2252)) mapNonEmpty!2251))

(get-info :version)

(assert (= (and mapNonEmpty!2251 ((_ is ValueCellFull!758) mapValue!2252)) b!50889))

(assert (= (and b!50898 ((_ is ValueCellFull!758) mapDefault!2251)) b!50888))

(assert (= b!50886 b!50898))

(assert (= b!50887 b!50886))

(assert (= b!50893 b!50887))

(assert (= start!8094 b!50893))

(assert (= (and b!50895 condMapEmpty!2251) mapIsEmpty!2252))

(assert (= (and b!50895 (not condMapEmpty!2251)) mapNonEmpty!2252))

(assert (= (and mapNonEmpty!2252 ((_ is ValueCellFull!758) mapValue!2251)) b!50896))

(assert (= (and b!50895 ((_ is ValueCellFull!758) mapDefault!2252)) b!50897))

(assert (= b!50891 b!50895))

(assert (= start!8094 b!50891))

(declare-fun m!43877 () Bool)

(assert (=> mapNonEmpty!2251 m!43877))

(declare-fun m!43879 () Bool)

(assert (=> b!50900 m!43879))

(declare-fun m!43881 () Bool)

(assert (=> b!50890 m!43881))

(declare-fun m!43883 () Bool)

(assert (=> mapNonEmpty!2252 m!43883))

(declare-fun m!43885 () Bool)

(assert (=> b!50891 m!43885))

(declare-fun m!43887 () Bool)

(assert (=> b!50891 m!43887))

(declare-fun m!43889 () Bool)

(assert (=> start!8094 m!43889))

(declare-fun m!43891 () Bool)

(assert (=> b!50886 m!43891))

(declare-fun m!43893 () Bool)

(assert (=> b!50886 m!43893))

(check-sat b_and!2783 (not mapNonEmpty!2251) (not b!50886) (not b!50900) (not b_next!1575) (not start!8094) (not b_next!1573) b_and!2781 tp_is_empty!2203 (not b!50890) (not mapNonEmpty!2252) (not b!50891))
(check-sat b_and!2781 b_and!2783 (not b_next!1573) (not b_next!1575))
(get-model)

(declare-fun d!10237 () Bool)

(assert (=> d!10237 (= (validMask!0 (mask!5725 (v!2181 (underlying!135 thiss!992)))) (and (or (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000001111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000011111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000001111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000011111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000001111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000011111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000001111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000011111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000001111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000011111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000001111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000011111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000001111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000011111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000111111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000001111111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000011111111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000111111111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00001111111111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00011111111111111111111111111111) (= (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50900 d!10237))

(declare-fun d!10239 () Bool)

(assert (=> d!10239 (= (valid!158 thiss!992) (valid!157 (v!2181 (underlying!135 thiss!992))))))

(declare-fun bs!2371 () Bool)

(assert (= bs!2371 d!10239))

(declare-fun m!43931 () Bool)

(assert (=> bs!2371 m!43931))

(assert (=> start!8094 d!10239))

(declare-fun d!10241 () Bool)

(assert (=> d!10241 (= (array_inv!949 (_keys!3538 newMap!16)) (bvsge (size!1805 (_keys!3538 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50891 d!10241))

(declare-fun d!10243 () Bool)

(assert (=> d!10243 (= (array_inv!950 (_values!1909 newMap!16)) (bvsge (size!1806 (_values!1909 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50891 d!10243))

(declare-fun d!10245 () Bool)

(declare-fun res!29246 () Bool)

(declare-fun e!33036 () Bool)

(assert (=> d!10245 (=> (not res!29246) (not e!33036))))

(declare-fun simpleValid!36 (LongMapFixedSize!424) Bool)

(assert (=> d!10245 (= res!29246 (simpleValid!36 newMap!16))))

(assert (=> d!10245 (= (valid!157 newMap!16) e!33036)))

(declare-fun b!50997 () Bool)

(declare-fun res!29247 () Bool)

(assert (=> b!50997 (=> (not res!29247) (not e!33036))))

(declare-fun arrayCountValidKeys!0 (array!3307 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50997 (= res!29247 (= (arrayCountValidKeys!0 (_keys!3538 newMap!16) #b00000000000000000000000000000000 (size!1805 (_keys!3538 newMap!16))) (_size!261 newMap!16)))))

(declare-fun b!50998 () Bool)

(declare-fun res!29248 () Bool)

(assert (=> b!50998 (=> (not res!29248) (not e!33036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3307 (_ BitVec 32)) Bool)

(assert (=> b!50998 (= res!29248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3538 newMap!16) (mask!5725 newMap!16)))))

(declare-fun b!50999 () Bool)

(declare-datatypes ((List!1317 0))(
  ( (Nil!1314) (Cons!1313 (h!1893 (_ BitVec 64)) (t!4351 List!1317)) )
))
(declare-fun arrayNoDuplicates!0 (array!3307 (_ BitVec 32) List!1317) Bool)

(assert (=> b!50999 (= e!33036 (arrayNoDuplicates!0 (_keys!3538 newMap!16) #b00000000000000000000000000000000 Nil!1314))))

(assert (= (and d!10245 res!29246) b!50997))

(assert (= (and b!50997 res!29247) b!50998))

(assert (= (and b!50998 res!29248) b!50999))

(declare-fun m!43933 () Bool)

(assert (=> d!10245 m!43933))

(declare-fun m!43935 () Bool)

(assert (=> b!50997 m!43935))

(declare-fun m!43937 () Bool)

(assert (=> b!50998 m!43937))

(declare-fun m!43939 () Bool)

(assert (=> b!50999 m!43939))

(assert (=> b!50890 d!10245))

(declare-fun d!10247 () Bool)

(assert (=> d!10247 (= (array_inv!949 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) (bvsge (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50886 d!10247))

(declare-fun d!10249 () Bool)

(assert (=> d!10249 (= (array_inv!950 (_values!1909 (v!2181 (underlying!135 thiss!992)))) (bvsge (size!1806 (_values!1909 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50886 d!10249))

(declare-fun mapIsEmpty!2267 () Bool)

(declare-fun mapRes!2267 () Bool)

(assert (=> mapIsEmpty!2267 mapRes!2267))

(declare-fun b!51006 () Bool)

(declare-fun e!33042 () Bool)

(assert (=> b!51006 (= e!33042 tp_is_empty!2203)))

(declare-fun condMapEmpty!2267 () Bool)

(declare-fun mapDefault!2267 () ValueCell!758)

(assert (=> mapNonEmpty!2252 (= condMapEmpty!2267 (= mapRest!2251 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2267)))))

(declare-fun e!33041 () Bool)

(assert (=> mapNonEmpty!2252 (= tp!6793 (and e!33041 mapRes!2267))))

(declare-fun mapNonEmpty!2267 () Bool)

(declare-fun tp!6821 () Bool)

(assert (=> mapNonEmpty!2267 (= mapRes!2267 (and tp!6821 e!33042))))

(declare-fun mapValue!2267 () ValueCell!758)

(declare-fun mapRest!2267 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapKey!2267 () (_ BitVec 32))

(assert (=> mapNonEmpty!2267 (= mapRest!2251 (store mapRest!2267 mapKey!2267 mapValue!2267))))

(declare-fun b!51007 () Bool)

(assert (=> b!51007 (= e!33041 tp_is_empty!2203)))

(assert (= (and mapNonEmpty!2252 condMapEmpty!2267) mapIsEmpty!2267))

(assert (= (and mapNonEmpty!2252 (not condMapEmpty!2267)) mapNonEmpty!2267))

(assert (= (and mapNonEmpty!2267 ((_ is ValueCellFull!758) mapValue!2267)) b!51006))

(assert (= (and mapNonEmpty!2252 ((_ is ValueCellFull!758) mapDefault!2267)) b!51007))

(declare-fun m!43941 () Bool)

(assert (=> mapNonEmpty!2267 m!43941))

(declare-fun mapIsEmpty!2268 () Bool)

(declare-fun mapRes!2268 () Bool)

(assert (=> mapIsEmpty!2268 mapRes!2268))

(declare-fun b!51008 () Bool)

(declare-fun e!33044 () Bool)

(assert (=> b!51008 (= e!33044 tp_is_empty!2203)))

(declare-fun condMapEmpty!2268 () Bool)

(declare-fun mapDefault!2268 () ValueCell!758)

(assert (=> mapNonEmpty!2251 (= condMapEmpty!2268 (= mapRest!2252 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2268)))))

(declare-fun e!33043 () Bool)

(assert (=> mapNonEmpty!2251 (= tp!6791 (and e!33043 mapRes!2268))))

(declare-fun mapNonEmpty!2268 () Bool)

(declare-fun tp!6822 () Bool)

(assert (=> mapNonEmpty!2268 (= mapRes!2268 (and tp!6822 e!33044))))

(declare-fun mapRest!2268 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapValue!2268 () ValueCell!758)

(declare-fun mapKey!2268 () (_ BitVec 32))

(assert (=> mapNonEmpty!2268 (= mapRest!2252 (store mapRest!2268 mapKey!2268 mapValue!2268))))

(declare-fun b!51009 () Bool)

(assert (=> b!51009 (= e!33043 tp_is_empty!2203)))

(assert (= (and mapNonEmpty!2251 condMapEmpty!2268) mapIsEmpty!2268))

(assert (= (and mapNonEmpty!2251 (not condMapEmpty!2268)) mapNonEmpty!2268))

(assert (= (and mapNonEmpty!2268 ((_ is ValueCellFull!758) mapValue!2268)) b!51008))

(assert (= (and mapNonEmpty!2251 ((_ is ValueCellFull!758) mapDefault!2268)) b!51009))

(declare-fun m!43943 () Bool)

(assert (=> mapNonEmpty!2268 m!43943))

(check-sat (not b!50997) (not d!10239) tp_is_empty!2203 (not d!10245) (not b!50999) (not b_next!1575) (not mapNonEmpty!2267) (not b!50998) (not b_next!1573) b_and!2781 b_and!2783 (not mapNonEmpty!2268))
(check-sat b_and!2781 b_and!2783 (not b_next!1573) (not b_next!1575))
(get-model)

(declare-fun d!10251 () Bool)

(declare-fun res!29249 () Bool)

(declare-fun e!33045 () Bool)

(assert (=> d!10251 (=> (not res!29249) (not e!33045))))

(assert (=> d!10251 (= res!29249 (simpleValid!36 (v!2181 (underlying!135 thiss!992))))))

(assert (=> d!10251 (= (valid!157 (v!2181 (underlying!135 thiss!992))) e!33045)))

(declare-fun b!51010 () Bool)

(declare-fun res!29250 () Bool)

(assert (=> b!51010 (=> (not res!29250) (not e!33045))))

(assert (=> b!51010 (= res!29250 (= (arrayCountValidKeys!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000 (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))) (_size!261 (v!2181 (underlying!135 thiss!992)))))))

(declare-fun b!51011 () Bool)

(declare-fun res!29251 () Bool)

(assert (=> b!51011 (=> (not res!29251) (not e!33045))))

(assert (=> b!51011 (= res!29251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3538 (v!2181 (underlying!135 thiss!992))) (mask!5725 (v!2181 (underlying!135 thiss!992)))))))

(declare-fun b!51012 () Bool)

(assert (=> b!51012 (= e!33045 (arrayNoDuplicates!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000 Nil!1314))))

(assert (= (and d!10251 res!29249) b!51010))

(assert (= (and b!51010 res!29250) b!51011))

(assert (= (and b!51011 res!29251) b!51012))

(declare-fun m!43945 () Bool)

(assert (=> d!10251 m!43945))

(declare-fun m!43947 () Bool)

(assert (=> b!51010 m!43947))

(declare-fun m!43949 () Bool)

(assert (=> b!51011 m!43949))

(declare-fun m!43951 () Bool)

(assert (=> b!51012 m!43951))

(assert (=> d!10239 d!10251))

(declare-fun b!51023 () Bool)

(declare-fun e!33057 () Bool)

(declare-fun contains!612 (List!1317 (_ BitVec 64)) Bool)

(assert (=> b!51023 (= e!33057 (contains!612 Nil!1314 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51024 () Bool)

(declare-fun e!33054 () Bool)

(declare-fun e!33056 () Bool)

(assert (=> b!51024 (= e!33054 e!33056)))

(declare-fun c!6833 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51024 (= c!6833 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51025 () Bool)

(declare-fun call!3905 () Bool)

(assert (=> b!51025 (= e!33056 call!3905)))

(declare-fun bm!3902 () Bool)

(assert (=> bm!3902 (= call!3905 (arrayNoDuplicates!0 (_keys!3538 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6833 (Cons!1313 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) Nil!1314) Nil!1314)))))

(declare-fun b!51026 () Bool)

(declare-fun e!33055 () Bool)

(assert (=> b!51026 (= e!33055 e!33054)))

(declare-fun res!29260 () Bool)

(assert (=> b!51026 (=> (not res!29260) (not e!33054))))

(assert (=> b!51026 (= res!29260 (not e!33057))))

(declare-fun res!29259 () Bool)

(assert (=> b!51026 (=> (not res!29259) (not e!33057))))

(assert (=> b!51026 (= res!29259 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51027 () Bool)

(assert (=> b!51027 (= e!33056 call!3905)))

(declare-fun d!10253 () Bool)

(declare-fun res!29258 () Bool)

(assert (=> d!10253 (=> res!29258 e!33055)))

(assert (=> d!10253 (= res!29258 (bvsge #b00000000000000000000000000000000 (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10253 (= (arrayNoDuplicates!0 (_keys!3538 newMap!16) #b00000000000000000000000000000000 Nil!1314) e!33055)))

(assert (= (and d!10253 (not res!29258)) b!51026))

(assert (= (and b!51026 res!29259) b!51023))

(assert (= (and b!51026 res!29260) b!51024))

(assert (= (and b!51024 c!6833) b!51025))

(assert (= (and b!51024 (not c!6833)) b!51027))

(assert (= (or b!51025 b!51027) bm!3902))

(declare-fun m!43953 () Bool)

(assert (=> b!51023 m!43953))

(assert (=> b!51023 m!43953))

(declare-fun m!43955 () Bool)

(assert (=> b!51023 m!43955))

(assert (=> b!51024 m!43953))

(assert (=> b!51024 m!43953))

(declare-fun m!43957 () Bool)

(assert (=> b!51024 m!43957))

(assert (=> bm!3902 m!43953))

(declare-fun m!43959 () Bool)

(assert (=> bm!3902 m!43959))

(assert (=> b!51026 m!43953))

(assert (=> b!51026 m!43953))

(assert (=> b!51026 m!43957))

(assert (=> b!50999 d!10253))

(declare-fun bm!3905 () Bool)

(declare-fun call!3908 () Bool)

(assert (=> bm!3905 (= call!3908 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3538 newMap!16) (mask!5725 newMap!16)))))

(declare-fun b!51036 () Bool)

(declare-fun e!33066 () Bool)

(assert (=> b!51036 (= e!33066 call!3908)))

(declare-fun d!10255 () Bool)

(declare-fun res!29265 () Bool)

(declare-fun e!33064 () Bool)

(assert (=> d!10255 (=> res!29265 e!33064)))

(assert (=> d!10255 (= res!29265 (bvsge #b00000000000000000000000000000000 (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10255 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3538 newMap!16) (mask!5725 newMap!16)) e!33064)))

(declare-fun b!51037 () Bool)

(declare-fun e!33065 () Bool)

(assert (=> b!51037 (= e!33065 call!3908)))

(declare-fun b!51038 () Bool)

(assert (=> b!51038 (= e!33064 e!33065)))

(declare-fun c!6836 () Bool)

(assert (=> b!51038 (= c!6836 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51039 () Bool)

(assert (=> b!51039 (= e!33065 e!33066)))

(declare-fun lt!21081 () (_ BitVec 64))

(assert (=> b!51039 (= lt!21081 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1434 0))(
  ( (Unit!1435) )
))
(declare-fun lt!21082 () Unit!1434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3307 (_ BitVec 64) (_ BitVec 32)) Unit!1434)

(assert (=> b!51039 (= lt!21082 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3538 newMap!16) lt!21081 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51039 (arrayContainsKey!0 (_keys!3538 newMap!16) lt!21081 #b00000000000000000000000000000000)))

(declare-fun lt!21080 () Unit!1434)

(assert (=> b!51039 (= lt!21080 lt!21082)))

(declare-fun res!29266 () Bool)

(declare-datatypes ((SeekEntryResult!215 0))(
  ( (MissingZero!215 (index!2982 (_ BitVec 32))) (Found!215 (index!2983 (_ BitVec 32))) (Intermediate!215 (undefined!1027 Bool) (index!2984 (_ BitVec 32)) (x!9301 (_ BitVec 32))) (Undefined!215) (MissingVacant!215 (index!2985 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3307 (_ BitVec 32)) SeekEntryResult!215)

(assert (=> b!51039 (= res!29266 (= (seekEntryOrOpen!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) (_keys!3538 newMap!16) (mask!5725 newMap!16)) (Found!215 #b00000000000000000000000000000000)))))

(assert (=> b!51039 (=> (not res!29266) (not e!33066))))

(assert (= (and d!10255 (not res!29265)) b!51038))

(assert (= (and b!51038 c!6836) b!51039))

(assert (= (and b!51038 (not c!6836)) b!51037))

(assert (= (and b!51039 res!29266) b!51036))

(assert (= (or b!51036 b!51037) bm!3905))

(declare-fun m!43961 () Bool)

(assert (=> bm!3905 m!43961))

(assert (=> b!51038 m!43953))

(assert (=> b!51038 m!43953))

(assert (=> b!51038 m!43957))

(assert (=> b!51039 m!43953))

(declare-fun m!43963 () Bool)

(assert (=> b!51039 m!43963))

(declare-fun m!43965 () Bool)

(assert (=> b!51039 m!43965))

(assert (=> b!51039 m!43953))

(declare-fun m!43967 () Bool)

(assert (=> b!51039 m!43967))

(assert (=> b!50998 d!10255))

(declare-fun b!51048 () Bool)

(declare-fun e!33072 () (_ BitVec 32))

(declare-fun call!3911 () (_ BitVec 32))

(assert (=> b!51048 (= e!33072 (bvadd #b00000000000000000000000000000001 call!3911))))

(declare-fun b!51049 () Bool)

(declare-fun e!33071 () (_ BitVec 32))

(assert (=> b!51049 (= e!33071 e!33072)))

(declare-fun c!6841 () Bool)

(assert (=> b!51049 (= c!6841 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51050 () Bool)

(assert (=> b!51050 (= e!33072 call!3911)))

(declare-fun b!51051 () Bool)

(assert (=> b!51051 (= e!33071 #b00000000000000000000000000000000)))

(declare-fun bm!3908 () Bool)

(assert (=> bm!3908 (= call!3911 (arrayCountValidKeys!0 (_keys!3538 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))))))

(declare-fun d!10257 () Bool)

(declare-fun lt!21085 () (_ BitVec 32))

(assert (=> d!10257 (and (bvsge lt!21085 #b00000000000000000000000000000000) (bvsle lt!21085 (bvsub (size!1805 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!10257 (= lt!21085 e!33071)))

(declare-fun c!6842 () Bool)

(assert (=> d!10257 (= c!6842 (bvsge #b00000000000000000000000000000000 (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10257 (and (bvsle #b00000000000000000000000000000000 (size!1805 (_keys!3538 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1805 (_keys!3538 newMap!16)) (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10257 (= (arrayCountValidKeys!0 (_keys!3538 newMap!16) #b00000000000000000000000000000000 (size!1805 (_keys!3538 newMap!16))) lt!21085)))

(assert (= (and d!10257 c!6842) b!51051))

(assert (= (and d!10257 (not c!6842)) b!51049))

(assert (= (and b!51049 c!6841) b!51048))

(assert (= (and b!51049 (not c!6841)) b!51050))

(assert (= (or b!51048 b!51050) bm!3908))

(assert (=> b!51049 m!43953))

(assert (=> b!51049 m!43953))

(assert (=> b!51049 m!43957))

(declare-fun m!43969 () Bool)

(assert (=> bm!3908 m!43969))

(assert (=> b!50997 d!10257))

(declare-fun b!51063 () Bool)

(declare-fun e!33075 () Bool)

(assert (=> b!51063 (= e!33075 (and (bvsge (extraKeys!1817 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1817 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!261 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!51060 () Bool)

(declare-fun res!29275 () Bool)

(assert (=> b!51060 (=> (not res!29275) (not e!33075))))

(assert (=> b!51060 (= res!29275 (and (= (size!1806 (_values!1909 newMap!16)) (bvadd (mask!5725 newMap!16) #b00000000000000000000000000000001)) (= (size!1805 (_keys!3538 newMap!16)) (size!1806 (_values!1909 newMap!16))) (bvsge (_size!261 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!261 newMap!16) (bvadd (mask!5725 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!10259 () Bool)

(declare-fun res!29276 () Bool)

(assert (=> d!10259 (=> (not res!29276) (not e!33075))))

(assert (=> d!10259 (= res!29276 (validMask!0 (mask!5725 newMap!16)))))

(assert (=> d!10259 (= (simpleValid!36 newMap!16) e!33075)))

(declare-fun b!51061 () Bool)

(declare-fun res!29277 () Bool)

(assert (=> b!51061 (=> (not res!29277) (not e!33075))))

(declare-fun size!1811 (LongMapFixedSize!424) (_ BitVec 32))

(assert (=> b!51061 (= res!29277 (bvsge (size!1811 newMap!16) (_size!261 newMap!16)))))

(declare-fun b!51062 () Bool)

(declare-fun res!29278 () Bool)

(assert (=> b!51062 (=> (not res!29278) (not e!33075))))

(assert (=> b!51062 (= res!29278 (= (size!1811 newMap!16) (bvadd (_size!261 newMap!16) (bvsdiv (bvadd (extraKeys!1817 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10259 res!29276) b!51060))

(assert (= (and b!51060 res!29275) b!51061))

(assert (= (and b!51061 res!29277) b!51062))

(assert (= (and b!51062 res!29278) b!51063))

(declare-fun m!43971 () Bool)

(assert (=> d!10259 m!43971))

(declare-fun m!43973 () Bool)

(assert (=> b!51061 m!43973))

(assert (=> b!51062 m!43973))

(assert (=> d!10245 d!10259))

(declare-fun mapIsEmpty!2269 () Bool)

(declare-fun mapRes!2269 () Bool)

(assert (=> mapIsEmpty!2269 mapRes!2269))

(declare-fun b!51064 () Bool)

(declare-fun e!33077 () Bool)

(assert (=> b!51064 (= e!33077 tp_is_empty!2203)))

(declare-fun condMapEmpty!2269 () Bool)

(declare-fun mapDefault!2269 () ValueCell!758)

(assert (=> mapNonEmpty!2268 (= condMapEmpty!2269 (= mapRest!2268 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2269)))))

(declare-fun e!33076 () Bool)

(assert (=> mapNonEmpty!2268 (= tp!6822 (and e!33076 mapRes!2269))))

(declare-fun mapNonEmpty!2269 () Bool)

(declare-fun tp!6823 () Bool)

(assert (=> mapNonEmpty!2269 (= mapRes!2269 (and tp!6823 e!33077))))

(declare-fun mapRest!2269 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapKey!2269 () (_ BitVec 32))

(declare-fun mapValue!2269 () ValueCell!758)

(assert (=> mapNonEmpty!2269 (= mapRest!2268 (store mapRest!2269 mapKey!2269 mapValue!2269))))

(declare-fun b!51065 () Bool)

(assert (=> b!51065 (= e!33076 tp_is_empty!2203)))

(assert (= (and mapNonEmpty!2268 condMapEmpty!2269) mapIsEmpty!2269))

(assert (= (and mapNonEmpty!2268 (not condMapEmpty!2269)) mapNonEmpty!2269))

(assert (= (and mapNonEmpty!2269 ((_ is ValueCellFull!758) mapValue!2269)) b!51064))

(assert (= (and mapNonEmpty!2268 ((_ is ValueCellFull!758) mapDefault!2269)) b!51065))

(declare-fun m!43975 () Bool)

(assert (=> mapNonEmpty!2269 m!43975))

(declare-fun mapIsEmpty!2270 () Bool)

(declare-fun mapRes!2270 () Bool)

(assert (=> mapIsEmpty!2270 mapRes!2270))

(declare-fun b!51066 () Bool)

(declare-fun e!33079 () Bool)

(assert (=> b!51066 (= e!33079 tp_is_empty!2203)))

(declare-fun condMapEmpty!2270 () Bool)

(declare-fun mapDefault!2270 () ValueCell!758)

(assert (=> mapNonEmpty!2267 (= condMapEmpty!2270 (= mapRest!2267 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2270)))))

(declare-fun e!33078 () Bool)

(assert (=> mapNonEmpty!2267 (= tp!6821 (and e!33078 mapRes!2270))))

(declare-fun mapNonEmpty!2270 () Bool)

(declare-fun tp!6824 () Bool)

(assert (=> mapNonEmpty!2270 (= mapRes!2270 (and tp!6824 e!33079))))

(declare-fun mapKey!2270 () (_ BitVec 32))

(declare-fun mapRest!2270 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapValue!2270 () ValueCell!758)

(assert (=> mapNonEmpty!2270 (= mapRest!2267 (store mapRest!2270 mapKey!2270 mapValue!2270))))

(declare-fun b!51067 () Bool)

(assert (=> b!51067 (= e!33078 tp_is_empty!2203)))

(assert (= (and mapNonEmpty!2267 condMapEmpty!2270) mapIsEmpty!2270))

(assert (= (and mapNonEmpty!2267 (not condMapEmpty!2270)) mapNonEmpty!2270))

(assert (= (and mapNonEmpty!2270 ((_ is ValueCellFull!758) mapValue!2270)) b!51066))

(assert (= (and mapNonEmpty!2267 ((_ is ValueCellFull!758) mapDefault!2270)) b!51067))

(declare-fun m!43977 () Bool)

(assert (=> mapNonEmpty!2270 m!43977))

(check-sat b_and!2783 (not b!51062) (not d!10259) (not b!51049) tp_is_empty!2203 (not b!51038) (not b!51061) (not d!10251) (not b!51023) (not b!51011) (not b_next!1573) (not bm!3902) (not b!51039) (not b!51026) (not bm!3908) (not b!51024) (not b!51010) (not mapNonEmpty!2270) (not b!51012) (not b_next!1575) b_and!2781 (not mapNonEmpty!2269) (not bm!3905))
(check-sat b_and!2781 b_and!2783 (not b_next!1573) (not b_next!1575))
(get-model)

(declare-fun d!10261 () Bool)

(assert (=> d!10261 (= (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51024 d!10261))

(declare-fun d!10263 () Bool)

(assert (=> d!10263 (arrayContainsKey!0 (_keys!3538 newMap!16) lt!21081 #b00000000000000000000000000000000)))

(declare-fun lt!21088 () Unit!1434)

(declare-fun choose!13 (array!3307 (_ BitVec 64) (_ BitVec 32)) Unit!1434)

(assert (=> d!10263 (= lt!21088 (choose!13 (_keys!3538 newMap!16) lt!21081 #b00000000000000000000000000000000))))

(assert (=> d!10263 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10263 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3538 newMap!16) lt!21081 #b00000000000000000000000000000000) lt!21088)))

(declare-fun bs!2372 () Bool)

(assert (= bs!2372 d!10263))

(assert (=> bs!2372 m!43965))

(declare-fun m!43979 () Bool)

(assert (=> bs!2372 m!43979))

(assert (=> b!51039 d!10263))

(declare-fun d!10265 () Bool)

(declare-fun res!29283 () Bool)

(declare-fun e!33084 () Bool)

(assert (=> d!10265 (=> res!29283 e!33084)))

(assert (=> d!10265 (= res!29283 (= (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) lt!21081))))

(assert (=> d!10265 (= (arrayContainsKey!0 (_keys!3538 newMap!16) lt!21081 #b00000000000000000000000000000000) e!33084)))

(declare-fun b!51072 () Bool)

(declare-fun e!33085 () Bool)

(assert (=> b!51072 (= e!33084 e!33085)))

(declare-fun res!29284 () Bool)

(assert (=> b!51072 (=> (not res!29284) (not e!33085))))

(assert (=> b!51072 (= res!29284 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))))))

(declare-fun b!51073 () Bool)

(assert (=> b!51073 (= e!33085 (arrayContainsKey!0 (_keys!3538 newMap!16) lt!21081 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10265 (not res!29283)) b!51072))

(assert (= (and b!51072 res!29284) b!51073))

(assert (=> d!10265 m!43953))

(declare-fun m!43981 () Bool)

(assert (=> b!51073 m!43981))

(assert (=> b!51039 d!10265))

(declare-fun b!51086 () Bool)

(declare-fun e!33092 () SeekEntryResult!215)

(declare-fun lt!21095 () SeekEntryResult!215)

(assert (=> b!51086 (= e!33092 (Found!215 (index!2984 lt!21095)))))

(declare-fun b!51087 () Bool)

(declare-fun e!33093 () SeekEntryResult!215)

(assert (=> b!51087 (= e!33093 Undefined!215)))

(declare-fun b!51088 () Bool)

(declare-fun e!33094 () SeekEntryResult!215)

(assert (=> b!51088 (= e!33094 (MissingZero!215 (index!2984 lt!21095)))))

(declare-fun d!10267 () Bool)

(declare-fun lt!21096 () SeekEntryResult!215)

(assert (=> d!10267 (and (or ((_ is Undefined!215) lt!21096) (not ((_ is Found!215) lt!21096)) (and (bvsge (index!2983 lt!21096) #b00000000000000000000000000000000) (bvslt (index!2983 lt!21096) (size!1805 (_keys!3538 newMap!16))))) (or ((_ is Undefined!215) lt!21096) ((_ is Found!215) lt!21096) (not ((_ is MissingZero!215) lt!21096)) (and (bvsge (index!2982 lt!21096) #b00000000000000000000000000000000) (bvslt (index!2982 lt!21096) (size!1805 (_keys!3538 newMap!16))))) (or ((_ is Undefined!215) lt!21096) ((_ is Found!215) lt!21096) ((_ is MissingZero!215) lt!21096) (not ((_ is MissingVacant!215) lt!21096)) (and (bvsge (index!2985 lt!21096) #b00000000000000000000000000000000) (bvslt (index!2985 lt!21096) (size!1805 (_keys!3538 newMap!16))))) (or ((_ is Undefined!215) lt!21096) (ite ((_ is Found!215) lt!21096) (= (select (arr!1580 (_keys!3538 newMap!16)) (index!2983 lt!21096)) (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!215) lt!21096) (= (select (arr!1580 (_keys!3538 newMap!16)) (index!2982 lt!21096)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!215) lt!21096) (= (select (arr!1580 (_keys!3538 newMap!16)) (index!2985 lt!21096)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10267 (= lt!21096 e!33093)))

(declare-fun c!6849 () Bool)

(assert (=> d!10267 (= c!6849 (and ((_ is Intermediate!215) lt!21095) (undefined!1027 lt!21095)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3307 (_ BitVec 32)) SeekEntryResult!215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10267 (= lt!21095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) (mask!5725 newMap!16)) (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) (_keys!3538 newMap!16) (mask!5725 newMap!16)))))

(assert (=> d!10267 (validMask!0 (mask!5725 newMap!16))))

(assert (=> d!10267 (= (seekEntryOrOpen!0 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) (_keys!3538 newMap!16) (mask!5725 newMap!16)) lt!21096)))

(declare-fun b!51089 () Bool)

(declare-fun c!6851 () Bool)

(declare-fun lt!21097 () (_ BitVec 64))

(assert (=> b!51089 (= c!6851 (= lt!21097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51089 (= e!33092 e!33094)))

(declare-fun b!51090 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3307 (_ BitVec 32)) SeekEntryResult!215)

(assert (=> b!51090 (= e!33094 (seekKeyOrZeroReturnVacant!0 (x!9301 lt!21095) (index!2984 lt!21095) (index!2984 lt!21095) (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) (_keys!3538 newMap!16) (mask!5725 newMap!16)))))

(declare-fun b!51091 () Bool)

(assert (=> b!51091 (= e!33093 e!33092)))

(assert (=> b!51091 (= lt!21097 (select (arr!1580 (_keys!3538 newMap!16)) (index!2984 lt!21095)))))

(declare-fun c!6850 () Bool)

(assert (=> b!51091 (= c!6850 (= lt!21097 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10267 c!6849) b!51087))

(assert (= (and d!10267 (not c!6849)) b!51091))

(assert (= (and b!51091 c!6850) b!51086))

(assert (= (and b!51091 (not c!6850)) b!51089))

(assert (= (and b!51089 c!6851) b!51088))

(assert (= (and b!51089 (not c!6851)) b!51090))

(assert (=> d!10267 m!43971))

(assert (=> d!10267 m!43953))

(declare-fun m!43983 () Bool)

(assert (=> d!10267 m!43983))

(assert (=> d!10267 m!43983))

(assert (=> d!10267 m!43953))

(declare-fun m!43985 () Bool)

(assert (=> d!10267 m!43985))

(declare-fun m!43987 () Bool)

(assert (=> d!10267 m!43987))

(declare-fun m!43989 () Bool)

(assert (=> d!10267 m!43989))

(declare-fun m!43991 () Bool)

(assert (=> d!10267 m!43991))

(assert (=> b!51090 m!43953))

(declare-fun m!43993 () Bool)

(assert (=> b!51090 m!43993))

(declare-fun m!43995 () Bool)

(assert (=> b!51091 m!43995))

(assert (=> b!51039 d!10267))

(declare-fun d!10269 () Bool)

(assert (=> d!10269 (= (validMask!0 (mask!5725 newMap!16)) (and (or (= (mask!5725 newMap!16) #b00000000000000000000000000000111) (= (mask!5725 newMap!16) #b00000000000000000000000000001111) (= (mask!5725 newMap!16) #b00000000000000000000000000011111) (= (mask!5725 newMap!16) #b00000000000000000000000000111111) (= (mask!5725 newMap!16) #b00000000000000000000000001111111) (= (mask!5725 newMap!16) #b00000000000000000000000011111111) (= (mask!5725 newMap!16) #b00000000000000000000000111111111) (= (mask!5725 newMap!16) #b00000000000000000000001111111111) (= (mask!5725 newMap!16) #b00000000000000000000011111111111) (= (mask!5725 newMap!16) #b00000000000000000000111111111111) (= (mask!5725 newMap!16) #b00000000000000000001111111111111) (= (mask!5725 newMap!16) #b00000000000000000011111111111111) (= (mask!5725 newMap!16) #b00000000000000000111111111111111) (= (mask!5725 newMap!16) #b00000000000000001111111111111111) (= (mask!5725 newMap!16) #b00000000000000011111111111111111) (= (mask!5725 newMap!16) #b00000000000000111111111111111111) (= (mask!5725 newMap!16) #b00000000000001111111111111111111) (= (mask!5725 newMap!16) #b00000000000011111111111111111111) (= (mask!5725 newMap!16) #b00000000000111111111111111111111) (= (mask!5725 newMap!16) #b00000000001111111111111111111111) (= (mask!5725 newMap!16) #b00000000011111111111111111111111) (= (mask!5725 newMap!16) #b00000000111111111111111111111111) (= (mask!5725 newMap!16) #b00000001111111111111111111111111) (= (mask!5725 newMap!16) #b00000011111111111111111111111111) (= (mask!5725 newMap!16) #b00000111111111111111111111111111) (= (mask!5725 newMap!16) #b00001111111111111111111111111111) (= (mask!5725 newMap!16) #b00011111111111111111111111111111) (= (mask!5725 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5725 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10259 d!10269))

(declare-fun d!10271 () Bool)

(declare-fun lt!21100 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!59 (List!1317) (InoxSet (_ BitVec 64)))

(assert (=> d!10271 (= lt!21100 (select (content!59 Nil!1314) (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33099 () Bool)

(assert (=> d!10271 (= lt!21100 e!33099)))

(declare-fun res!29290 () Bool)

(assert (=> d!10271 (=> (not res!29290) (not e!33099))))

(assert (=> d!10271 (= res!29290 ((_ is Cons!1313) Nil!1314))))

(assert (=> d!10271 (= (contains!612 Nil!1314 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)) lt!21100)))

(declare-fun b!51096 () Bool)

(declare-fun e!33100 () Bool)

(assert (=> b!51096 (= e!33099 e!33100)))

(declare-fun res!29289 () Bool)

(assert (=> b!51096 (=> res!29289 e!33100)))

(assert (=> b!51096 (= res!29289 (= (h!1893 Nil!1314) (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51097 () Bool)

(assert (=> b!51097 (= e!33100 (contains!612 (t!4351 Nil!1314) (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10271 res!29290) b!51096))

(assert (= (and b!51096 (not res!29289)) b!51097))

(declare-fun m!43997 () Bool)

(assert (=> d!10271 m!43997))

(assert (=> d!10271 m!43953))

(declare-fun m!43999 () Bool)

(assert (=> d!10271 m!43999))

(assert (=> b!51097 m!43953))

(declare-fun m!44001 () Bool)

(assert (=> b!51097 m!44001))

(assert (=> b!51023 d!10271))

(assert (=> b!51038 d!10261))

(declare-fun b!51098 () Bool)

(declare-fun e!33104 () Bool)

(assert (=> b!51098 (= e!33104 (contains!612 Nil!1314 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51099 () Bool)

(declare-fun e!33101 () Bool)

(declare-fun e!33103 () Bool)

(assert (=> b!51099 (= e!33101 e!33103)))

(declare-fun c!6852 () Bool)

(assert (=> b!51099 (= c!6852 (validKeyInArray!0 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51100 () Bool)

(declare-fun call!3912 () Bool)

(assert (=> b!51100 (= e!33103 call!3912)))

(declare-fun bm!3909 () Bool)

(assert (=> bm!3909 (= call!3912 (arrayNoDuplicates!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6852 (Cons!1313 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000) Nil!1314) Nil!1314)))))

(declare-fun b!51101 () Bool)

(declare-fun e!33102 () Bool)

(assert (=> b!51101 (= e!33102 e!33101)))

(declare-fun res!29293 () Bool)

(assert (=> b!51101 (=> (not res!29293) (not e!33101))))

(assert (=> b!51101 (= res!29293 (not e!33104))))

(declare-fun res!29292 () Bool)

(assert (=> b!51101 (=> (not res!29292) (not e!33104))))

(assert (=> b!51101 (= res!29292 (validKeyInArray!0 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51102 () Bool)

(assert (=> b!51102 (= e!33103 call!3912)))

(declare-fun d!10273 () Bool)

(declare-fun res!29291 () Bool)

(assert (=> d!10273 (=> res!29291 e!33102)))

(assert (=> d!10273 (= res!29291 (bvsge #b00000000000000000000000000000000 (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))))))

(assert (=> d!10273 (= (arrayNoDuplicates!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000 Nil!1314) e!33102)))

(assert (= (and d!10273 (not res!29291)) b!51101))

(assert (= (and b!51101 res!29292) b!51098))

(assert (= (and b!51101 res!29293) b!51099))

(assert (= (and b!51099 c!6852) b!51100))

(assert (= (and b!51099 (not c!6852)) b!51102))

(assert (= (or b!51100 b!51102) bm!3909))

(declare-fun m!44003 () Bool)

(assert (=> b!51098 m!44003))

(assert (=> b!51098 m!44003))

(declare-fun m!44005 () Bool)

(assert (=> b!51098 m!44005))

(assert (=> b!51099 m!44003))

(assert (=> b!51099 m!44003))

(declare-fun m!44007 () Bool)

(assert (=> b!51099 m!44007))

(assert (=> bm!3909 m!44003))

(declare-fun m!44009 () Bool)

(assert (=> bm!3909 m!44009))

(assert (=> b!51101 m!44003))

(assert (=> b!51101 m!44003))

(assert (=> b!51101 m!44007))

(assert (=> b!51012 d!10273))

(declare-fun bm!3910 () Bool)

(declare-fun call!3913 () Bool)

(assert (=> bm!3910 (= call!3913 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3538 newMap!16) (mask!5725 newMap!16)))))

(declare-fun b!51103 () Bool)

(declare-fun e!33107 () Bool)

(assert (=> b!51103 (= e!33107 call!3913)))

(declare-fun d!10275 () Bool)

(declare-fun res!29294 () Bool)

(declare-fun e!33105 () Bool)

(assert (=> d!10275 (=> res!29294 e!33105)))

(assert (=> d!10275 (= res!29294 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10275 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3538 newMap!16) (mask!5725 newMap!16)) e!33105)))

(declare-fun b!51104 () Bool)

(declare-fun e!33106 () Bool)

(assert (=> b!51104 (= e!33106 call!3913)))

(declare-fun b!51105 () Bool)

(assert (=> b!51105 (= e!33105 e!33106)))

(declare-fun c!6853 () Bool)

(assert (=> b!51105 (= c!6853 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51106 () Bool)

(assert (=> b!51106 (= e!33106 e!33107)))

(declare-fun lt!21102 () (_ BitVec 64))

(assert (=> b!51106 (= lt!21102 (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21103 () Unit!1434)

(assert (=> b!51106 (= lt!21103 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3538 newMap!16) lt!21102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51106 (arrayContainsKey!0 (_keys!3538 newMap!16) lt!21102 #b00000000000000000000000000000000)))

(declare-fun lt!21101 () Unit!1434)

(assert (=> b!51106 (= lt!21101 lt!21103)))

(declare-fun res!29295 () Bool)

(assert (=> b!51106 (= res!29295 (= (seekEntryOrOpen!0 (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3538 newMap!16) (mask!5725 newMap!16)) (Found!215 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51106 (=> (not res!29295) (not e!33107))))

(assert (= (and d!10275 (not res!29294)) b!51105))

(assert (= (and b!51105 c!6853) b!51106))

(assert (= (and b!51105 (not c!6853)) b!51104))

(assert (= (and b!51106 res!29295) b!51103))

(assert (= (or b!51103 b!51104) bm!3910))

(declare-fun m!44011 () Bool)

(assert (=> bm!3910 m!44011))

(declare-fun m!44013 () Bool)

(assert (=> b!51105 m!44013))

(assert (=> b!51105 m!44013))

(declare-fun m!44015 () Bool)

(assert (=> b!51105 m!44015))

(assert (=> b!51106 m!44013))

(declare-fun m!44017 () Bool)

(assert (=> b!51106 m!44017))

(declare-fun m!44019 () Bool)

(assert (=> b!51106 m!44019))

(assert (=> b!51106 m!44013))

(declare-fun m!44021 () Bool)

(assert (=> b!51106 m!44021))

(assert (=> bm!3905 d!10275))

(declare-fun bm!3911 () Bool)

(declare-fun call!3914 () Bool)

(assert (=> bm!3911 (= call!3914 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3538 (v!2181 (underlying!135 thiss!992))) (mask!5725 (v!2181 (underlying!135 thiss!992)))))))

(declare-fun b!51107 () Bool)

(declare-fun e!33110 () Bool)

(assert (=> b!51107 (= e!33110 call!3914)))

(declare-fun d!10277 () Bool)

(declare-fun res!29296 () Bool)

(declare-fun e!33108 () Bool)

(assert (=> d!10277 (=> res!29296 e!33108)))

(assert (=> d!10277 (= res!29296 (bvsge #b00000000000000000000000000000000 (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))))))

(assert (=> d!10277 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3538 (v!2181 (underlying!135 thiss!992))) (mask!5725 (v!2181 (underlying!135 thiss!992)))) e!33108)))

(declare-fun b!51108 () Bool)

(declare-fun e!33109 () Bool)

(assert (=> b!51108 (= e!33109 call!3914)))

(declare-fun b!51109 () Bool)

(assert (=> b!51109 (= e!33108 e!33109)))

(declare-fun c!6854 () Bool)

(assert (=> b!51109 (= c!6854 (validKeyInArray!0 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51110 () Bool)

(assert (=> b!51110 (= e!33109 e!33110)))

(declare-fun lt!21105 () (_ BitVec 64))

(assert (=> b!51110 (= lt!21105 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21106 () Unit!1434)

(assert (=> b!51110 (= lt!21106 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) lt!21105 #b00000000000000000000000000000000))))

(assert (=> b!51110 (arrayContainsKey!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) lt!21105 #b00000000000000000000000000000000)))

(declare-fun lt!21104 () Unit!1434)

(assert (=> b!51110 (= lt!21104 lt!21106)))

(declare-fun res!29297 () Bool)

(assert (=> b!51110 (= res!29297 (= (seekEntryOrOpen!0 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000) (_keys!3538 (v!2181 (underlying!135 thiss!992))) (mask!5725 (v!2181 (underlying!135 thiss!992)))) (Found!215 #b00000000000000000000000000000000)))))

(assert (=> b!51110 (=> (not res!29297) (not e!33110))))

(assert (= (and d!10277 (not res!29296)) b!51109))

(assert (= (and b!51109 c!6854) b!51110))

(assert (= (and b!51109 (not c!6854)) b!51108))

(assert (= (and b!51110 res!29297) b!51107))

(assert (= (or b!51107 b!51108) bm!3911))

(declare-fun m!44023 () Bool)

(assert (=> bm!3911 m!44023))

(assert (=> b!51109 m!44003))

(assert (=> b!51109 m!44003))

(assert (=> b!51109 m!44007))

(assert (=> b!51110 m!44003))

(declare-fun m!44025 () Bool)

(assert (=> b!51110 m!44025))

(declare-fun m!44027 () Bool)

(assert (=> b!51110 m!44027))

(assert (=> b!51110 m!44003))

(declare-fun m!44029 () Bool)

(assert (=> b!51110 m!44029))

(assert (=> b!51011 d!10277))

(declare-fun b!51111 () Bool)

(declare-fun e!33112 () (_ BitVec 32))

(declare-fun call!3915 () (_ BitVec 32))

(assert (=> b!51111 (= e!33112 (bvadd #b00000000000000000000000000000001 call!3915))))

(declare-fun b!51112 () Bool)

(declare-fun e!33111 () (_ BitVec 32))

(assert (=> b!51112 (= e!33111 e!33112)))

(declare-fun c!6855 () Bool)

(assert (=> b!51112 (= c!6855 (validKeyInArray!0 (select (arr!1580 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51113 () Bool)

(assert (=> b!51113 (= e!33112 call!3915)))

(declare-fun b!51114 () Bool)

(assert (=> b!51114 (= e!33111 #b00000000000000000000000000000000)))

(declare-fun bm!3912 () Bool)

(assert (=> bm!3912 (= call!3915 (arrayCountValidKeys!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))))))

(declare-fun d!10279 () Bool)

(declare-fun lt!21107 () (_ BitVec 32))

(assert (=> d!10279 (and (bvsge lt!21107 #b00000000000000000000000000000000) (bvsle lt!21107 (bvsub (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!10279 (= lt!21107 e!33111)))

(declare-fun c!6856 () Bool)

(assert (=> d!10279 (= c!6856 (bvsge #b00000000000000000000000000000000 (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))))))

(assert (=> d!10279 (and (bvsle #b00000000000000000000000000000000 (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))))))

(assert (=> d!10279 (= (arrayCountValidKeys!0 (_keys!3538 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000 (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992))))) lt!21107)))

(assert (= (and d!10279 c!6856) b!51114))

(assert (= (and d!10279 (not c!6856)) b!51112))

(assert (= (and b!51112 c!6855) b!51111))

(assert (= (and b!51112 (not c!6855)) b!51113))

(assert (= (or b!51111 b!51113) bm!3912))

(assert (=> b!51112 m!44003))

(assert (=> b!51112 m!44003))

(assert (=> b!51112 m!44007))

(declare-fun m!44031 () Bool)

(assert (=> bm!3912 m!44031))

(assert (=> b!51010 d!10279))

(declare-fun d!10281 () Bool)

(assert (=> d!10281 (= (size!1811 newMap!16) (bvadd (_size!261 newMap!16) (bvsdiv (bvadd (extraKeys!1817 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!51062 d!10281))

(assert (=> b!51061 d!10281))

(declare-fun b!51115 () Bool)

(declare-fun e!33114 () (_ BitVec 32))

(declare-fun call!3916 () (_ BitVec 32))

(assert (=> b!51115 (= e!33114 (bvadd #b00000000000000000000000000000001 call!3916))))

(declare-fun b!51116 () Bool)

(declare-fun e!33113 () (_ BitVec 32))

(assert (=> b!51116 (= e!33113 e!33114)))

(declare-fun c!6857 () Bool)

(assert (=> b!51116 (= c!6857 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51117 () Bool)

(assert (=> b!51117 (= e!33114 call!3916)))

(declare-fun b!51118 () Bool)

(assert (=> b!51118 (= e!33113 #b00000000000000000000000000000000)))

(declare-fun bm!3913 () Bool)

(assert (=> bm!3913 (= call!3916 (arrayCountValidKeys!0 (_keys!3538 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))))))

(declare-fun d!10283 () Bool)

(declare-fun lt!21108 () (_ BitVec 32))

(assert (=> d!10283 (and (bvsge lt!21108 #b00000000000000000000000000000000) (bvsle lt!21108 (bvsub (size!1805 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!10283 (= lt!21108 e!33113)))

(declare-fun c!6858 () Bool)

(assert (=> d!10283 (= c!6858 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10283 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1805 (_keys!3538 newMap!16)) (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10283 (= (arrayCountValidKeys!0 (_keys!3538 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))) lt!21108)))

(assert (= (and d!10283 c!6858) b!51118))

(assert (= (and d!10283 (not c!6858)) b!51116))

(assert (= (and b!51116 c!6857) b!51115))

(assert (= (and b!51116 (not c!6857)) b!51117))

(assert (= (or b!51115 b!51117) bm!3913))

(assert (=> b!51116 m!44013))

(assert (=> b!51116 m!44013))

(assert (=> b!51116 m!44015))

(declare-fun m!44033 () Bool)

(assert (=> bm!3913 m!44033))

(assert (=> bm!3908 d!10283))

(assert (=> b!51026 d!10261))

(declare-fun b!51119 () Bool)

(declare-fun e!33118 () Bool)

(assert (=> b!51119 (= e!33118 (contains!612 (ite c!6833 (Cons!1313 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) Nil!1314) Nil!1314) (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51120 () Bool)

(declare-fun e!33115 () Bool)

(declare-fun e!33117 () Bool)

(assert (=> b!51120 (= e!33115 e!33117)))

(declare-fun c!6859 () Bool)

(assert (=> b!51120 (= c!6859 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51121 () Bool)

(declare-fun call!3917 () Bool)

(assert (=> b!51121 (= e!33117 call!3917)))

(declare-fun bm!3914 () Bool)

(assert (=> bm!3914 (= call!3917 (arrayNoDuplicates!0 (_keys!3538 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6859 (Cons!1313 (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6833 (Cons!1313 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) Nil!1314) Nil!1314)) (ite c!6833 (Cons!1313 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) Nil!1314) Nil!1314))))))

(declare-fun b!51122 () Bool)

(declare-fun e!33116 () Bool)

(assert (=> b!51122 (= e!33116 e!33115)))

(declare-fun res!29300 () Bool)

(assert (=> b!51122 (=> (not res!29300) (not e!33115))))

(assert (=> b!51122 (= res!29300 (not e!33118))))

(declare-fun res!29299 () Bool)

(assert (=> b!51122 (=> (not res!29299) (not e!33118))))

(assert (=> b!51122 (= res!29299 (validKeyInArray!0 (select (arr!1580 (_keys!3538 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51123 () Bool)

(assert (=> b!51123 (= e!33117 call!3917)))

(declare-fun d!10285 () Bool)

(declare-fun res!29298 () Bool)

(assert (=> d!10285 (=> res!29298 e!33116)))

(assert (=> d!10285 (= res!29298 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1805 (_keys!3538 newMap!16))))))

(assert (=> d!10285 (= (arrayNoDuplicates!0 (_keys!3538 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6833 (Cons!1313 (select (arr!1580 (_keys!3538 newMap!16)) #b00000000000000000000000000000000) Nil!1314) Nil!1314)) e!33116)))

(assert (= (and d!10285 (not res!29298)) b!51122))

(assert (= (and b!51122 res!29299) b!51119))

(assert (= (and b!51122 res!29300) b!51120))

(assert (= (and b!51120 c!6859) b!51121))

(assert (= (and b!51120 (not c!6859)) b!51123))

(assert (= (or b!51121 b!51123) bm!3914))

(assert (=> b!51119 m!44013))

(assert (=> b!51119 m!44013))

(declare-fun m!44035 () Bool)

(assert (=> b!51119 m!44035))

(assert (=> b!51120 m!44013))

(assert (=> b!51120 m!44013))

(assert (=> b!51120 m!44015))

(assert (=> bm!3914 m!44013))

(declare-fun m!44037 () Bool)

(assert (=> bm!3914 m!44037))

(assert (=> b!51122 m!44013))

(assert (=> b!51122 m!44013))

(assert (=> b!51122 m!44015))

(assert (=> bm!3902 d!10285))

(assert (=> b!51049 d!10261))

(declare-fun b!51127 () Bool)

(declare-fun e!33119 () Bool)

(assert (=> b!51127 (= e!33119 (and (bvsge (extraKeys!1817 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1817 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!261 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!51124 () Bool)

(declare-fun res!29301 () Bool)

(assert (=> b!51124 (=> (not res!29301) (not e!33119))))

(assert (=> b!51124 (= res!29301 (and (= (size!1806 (_values!1909 (v!2181 (underlying!135 thiss!992)))) (bvadd (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000001)) (= (size!1805 (_keys!3538 (v!2181 (underlying!135 thiss!992)))) (size!1806 (_values!1909 (v!2181 (underlying!135 thiss!992))))) (bvsge (_size!261 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!261 (v!2181 (underlying!135 thiss!992))) (bvadd (mask!5725 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!10287 () Bool)

(declare-fun res!29302 () Bool)

(assert (=> d!10287 (=> (not res!29302) (not e!33119))))

(assert (=> d!10287 (= res!29302 (validMask!0 (mask!5725 (v!2181 (underlying!135 thiss!992)))))))

(assert (=> d!10287 (= (simpleValid!36 (v!2181 (underlying!135 thiss!992))) e!33119)))

(declare-fun b!51125 () Bool)

(declare-fun res!29303 () Bool)

(assert (=> b!51125 (=> (not res!29303) (not e!33119))))

(assert (=> b!51125 (= res!29303 (bvsge (size!1811 (v!2181 (underlying!135 thiss!992))) (_size!261 (v!2181 (underlying!135 thiss!992)))))))

(declare-fun b!51126 () Bool)

(declare-fun res!29304 () Bool)

(assert (=> b!51126 (=> (not res!29304) (not e!33119))))

(assert (=> b!51126 (= res!29304 (= (size!1811 (v!2181 (underlying!135 thiss!992))) (bvadd (_size!261 (v!2181 (underlying!135 thiss!992))) (bvsdiv (bvadd (extraKeys!1817 (v!2181 (underlying!135 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10287 res!29302) b!51124))

(assert (= (and b!51124 res!29301) b!51125))

(assert (= (and b!51125 res!29303) b!51126))

(assert (= (and b!51126 res!29304) b!51127))

(assert (=> d!10287 m!43879))

(declare-fun m!44039 () Bool)

(assert (=> b!51125 m!44039))

(assert (=> b!51126 m!44039))

(assert (=> d!10251 d!10287))

(declare-fun mapIsEmpty!2271 () Bool)

(declare-fun mapRes!2271 () Bool)

(assert (=> mapIsEmpty!2271 mapRes!2271))

(declare-fun b!51128 () Bool)

(declare-fun e!33121 () Bool)

(assert (=> b!51128 (= e!33121 tp_is_empty!2203)))

(declare-fun condMapEmpty!2271 () Bool)

(declare-fun mapDefault!2271 () ValueCell!758)

(assert (=> mapNonEmpty!2270 (= condMapEmpty!2271 (= mapRest!2270 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2271)))))

(declare-fun e!33120 () Bool)

(assert (=> mapNonEmpty!2270 (= tp!6824 (and e!33120 mapRes!2271))))

(declare-fun mapNonEmpty!2271 () Bool)

(declare-fun tp!6825 () Bool)

(assert (=> mapNonEmpty!2271 (= mapRes!2271 (and tp!6825 e!33121))))

(declare-fun mapValue!2271 () ValueCell!758)

(declare-fun mapKey!2271 () (_ BitVec 32))

(declare-fun mapRest!2271 () (Array (_ BitVec 32) ValueCell!758))

(assert (=> mapNonEmpty!2271 (= mapRest!2270 (store mapRest!2271 mapKey!2271 mapValue!2271))))

(declare-fun b!51129 () Bool)

(assert (=> b!51129 (= e!33120 tp_is_empty!2203)))

(assert (= (and mapNonEmpty!2270 condMapEmpty!2271) mapIsEmpty!2271))

(assert (= (and mapNonEmpty!2270 (not condMapEmpty!2271)) mapNonEmpty!2271))

(assert (= (and mapNonEmpty!2271 ((_ is ValueCellFull!758) mapValue!2271)) b!51128))

(assert (= (and mapNonEmpty!2270 ((_ is ValueCellFull!758) mapDefault!2271)) b!51129))

(declare-fun m!44041 () Bool)

(assert (=> mapNonEmpty!2271 m!44041))

(declare-fun mapIsEmpty!2272 () Bool)

(declare-fun mapRes!2272 () Bool)

(assert (=> mapIsEmpty!2272 mapRes!2272))

(declare-fun b!51130 () Bool)

(declare-fun e!33123 () Bool)

(assert (=> b!51130 (= e!33123 tp_is_empty!2203)))

(declare-fun condMapEmpty!2272 () Bool)

(declare-fun mapDefault!2272 () ValueCell!758)

(assert (=> mapNonEmpty!2269 (= condMapEmpty!2272 (= mapRest!2269 ((as const (Array (_ BitVec 32) ValueCell!758)) mapDefault!2272)))))

(declare-fun e!33122 () Bool)

(assert (=> mapNonEmpty!2269 (= tp!6823 (and e!33122 mapRes!2272))))

(declare-fun mapNonEmpty!2272 () Bool)

(declare-fun tp!6826 () Bool)

(assert (=> mapNonEmpty!2272 (= mapRes!2272 (and tp!6826 e!33123))))

(declare-fun mapRest!2272 () (Array (_ BitVec 32) ValueCell!758))

(declare-fun mapValue!2272 () ValueCell!758)

(declare-fun mapKey!2272 () (_ BitVec 32))

(assert (=> mapNonEmpty!2272 (= mapRest!2269 (store mapRest!2272 mapKey!2272 mapValue!2272))))

(declare-fun b!51131 () Bool)

(assert (=> b!51131 (= e!33122 tp_is_empty!2203)))

(assert (= (and mapNonEmpty!2269 condMapEmpty!2272) mapIsEmpty!2272))

(assert (= (and mapNonEmpty!2269 (not condMapEmpty!2272)) mapNonEmpty!2272))

(assert (= (and mapNonEmpty!2272 ((_ is ValueCellFull!758) mapValue!2272)) b!51130))

(assert (= (and mapNonEmpty!2269 ((_ is ValueCellFull!758) mapDefault!2272)) b!51131))

(declare-fun m!44043 () Bool)

(assert (=> mapNonEmpty!2272 m!44043))

(check-sat (not d!10287) (not bm!3913) (not b!51120) (not b!51112) (not b!51119) (not b!51116) (not d!10267) (not b!51097) (not d!10263) (not b_next!1573) (not b!51126) (not b!51098) b_and!2783 (not bm!3910) (not bm!3911) (not b!51109) (not b!51105) (not b!51101) (not mapNonEmpty!2271) (not b!51099) (not d!10271) (not bm!3914) tp_is_empty!2203 (not b!51122) (not b!51125) (not bm!3912) (not b!51073) (not b_next!1575) (not b!51110) (not mapNonEmpty!2272) (not b!51106) (not b!51090) b_and!2781 (not bm!3909))
(check-sat b_and!2781 b_and!2783 (not b_next!1573) (not b_next!1575))
