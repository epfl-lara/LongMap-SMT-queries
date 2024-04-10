; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7978 () Bool)

(assert start!7978)

(declare-fun b!50031 () Bool)

(declare-fun b_free!1529 () Bool)

(declare-fun b_next!1529 () Bool)

(assert (=> b!50031 (= b_free!1529 (not b_next!1529))))

(declare-fun tp!6638 () Bool)

(declare-fun b_and!2739 () Bool)

(assert (=> b!50031 (= tp!6638 b_and!2739)))

(declare-fun b!50035 () Bool)

(declare-fun b_free!1531 () Bool)

(declare-fun b_next!1531 () Bool)

(assert (=> b!50035 (= b_free!1531 (not b_next!1531))))

(declare-fun tp!6635 () Bool)

(declare-fun b_and!2741 () Bool)

(assert (=> b!50035 (= tp!6635 b_and!2741)))

(declare-fun b!50029 () Bool)

(declare-fun e!32291 () Bool)

(declare-fun tp_is_empty!2181 () Bool)

(assert (=> b!50029 (= e!32291 tp_is_empty!2181)))

(declare-fun mapNonEmpty!2161 () Bool)

(declare-fun mapRes!2161 () Bool)

(declare-fun tp!6637 () Bool)

(declare-fun e!32281 () Bool)

(assert (=> mapNonEmpty!2161 (= mapRes!2161 (and tp!6637 e!32281))))

(declare-datatypes ((V!2555 0))(
  ( (V!2556 (val!1135 Int)) )
))
(declare-datatypes ((array!3271 0))(
  ( (array!3272 (arr!1565 (Array (_ BitVec 32) (_ BitVec 64))) (size!1787 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!747 0))(
  ( (ValueCellFull!747 (v!2155 V!2555)) (EmptyCell!747) )
))
(declare-datatypes ((array!3273 0))(
  ( (array!3274 (arr!1566 (Array (_ BitVec 32) ValueCell!747)) (size!1788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!402 0))(
  ( (LongMapFixedSize!403 (defaultEntry!1915 Int) (mask!5697 (_ BitVec 32)) (extraKeys!1806 (_ BitVec 32)) (zeroValue!1833 V!2555) (minValue!1833 V!2555) (_size!250 (_ BitVec 32)) (_keys!3521 array!3271) (_values!1898 array!3273) (_vacant!250 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!228 0))(
  ( (Cell!229 (v!2156 LongMapFixedSize!402)) )
))
(declare-datatypes ((LongMap!228 0))(
  ( (LongMap!229 (underlying!125 Cell!228)) )
))
(declare-fun thiss!992 () LongMap!228)

(declare-fun mapValue!2161 () ValueCell!747)

(declare-fun mapKey!2161 () (_ BitVec 32))

(declare-fun mapRest!2161 () (Array (_ BitVec 32) ValueCell!747))

(assert (=> mapNonEmpty!2161 (= (arr!1566 (_values!1898 (v!2156 (underlying!125 thiss!992)))) (store mapRest!2161 mapKey!2161 mapValue!2161))))

(declare-fun b!50030 () Bool)

(declare-fun e!32285 () Bool)

(declare-fun e!32293 () Bool)

(assert (=> b!50030 (= e!32285 (and e!32293 mapRes!2161))))

(declare-fun condMapEmpty!2161 () Bool)

(declare-fun mapDefault!2161 () ValueCell!747)

(assert (=> b!50030 (= condMapEmpty!2161 (= (arr!1566 (_values!1898 (v!2156 (underlying!125 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2161)))))

(declare-fun e!32286 () Bool)

(declare-fun array_inv!957 (array!3271) Bool)

(declare-fun array_inv!958 (array!3273) Bool)

(assert (=> b!50031 (= e!32286 (and tp!6638 tp_is_empty!2181 (array_inv!957 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) (array_inv!958 (_values!1898 (v!2156 (underlying!125 thiss!992)))) e!32285))))

(declare-fun b!50032 () Bool)

(assert (=> b!50032 (= e!32293 tp_is_empty!2181)))

(declare-fun res!28875 () Bool)

(declare-fun e!32292 () Bool)

(assert (=> start!7978 (=> (not res!28875) (not e!32292))))

(declare-fun valid!130 (LongMap!228) Bool)

(assert (=> start!7978 (= res!28875 (valid!130 thiss!992))))

(assert (=> start!7978 e!32292))

(declare-fun e!32282 () Bool)

(assert (=> start!7978 e!32282))

(assert (=> start!7978 true))

(declare-fun e!32283 () Bool)

(assert (=> start!7978 e!32283))

(declare-fun b!50033 () Bool)

(declare-fun e!32290 () Bool)

(assert (=> b!50033 (= e!32282 e!32290)))

(declare-fun b!50034 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!50034 (= e!32292 (not (validMask!0 (mask!5697 (v!2156 (underlying!125 thiss!992))))))))

(declare-fun mapIsEmpty!2161 () Bool)

(declare-fun mapRes!2162 () Bool)

(assert (=> mapIsEmpty!2161 mapRes!2162))

(declare-fun mapNonEmpty!2162 () Bool)

(declare-fun tp!6636 () Bool)

(assert (=> mapNonEmpty!2162 (= mapRes!2162 (and tp!6636 e!32291))))

(declare-fun mapRest!2162 () (Array (_ BitVec 32) ValueCell!747))

(declare-fun newMap!16 () LongMapFixedSize!402)

(declare-fun mapKey!2162 () (_ BitVec 32))

(declare-fun mapValue!2162 () ValueCell!747)

(assert (=> mapNonEmpty!2162 (= (arr!1566 (_values!1898 newMap!16)) (store mapRest!2162 mapKey!2162 mapValue!2162))))

(declare-fun e!32287 () Bool)

(assert (=> b!50035 (= e!32283 (and tp!6635 tp_is_empty!2181 (array_inv!957 (_keys!3521 newMap!16)) (array_inv!958 (_values!1898 newMap!16)) e!32287))))

(declare-fun b!50036 () Bool)

(declare-fun res!28874 () Bool)

(assert (=> b!50036 (=> (not res!28874) (not e!32292))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!50036 (= res!28874 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992)))))))))

(declare-fun b!50037 () Bool)

(assert (=> b!50037 (= e!32281 tp_is_empty!2181)))

(declare-fun b!50038 () Bool)

(declare-fun e!32289 () Bool)

(assert (=> b!50038 (= e!32287 (and e!32289 mapRes!2162))))

(declare-fun condMapEmpty!2162 () Bool)

(declare-fun mapDefault!2162 () ValueCell!747)

(assert (=> b!50038 (= condMapEmpty!2162 (= (arr!1566 (_values!1898 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2162)))))

(declare-fun b!50039 () Bool)

(assert (=> b!50039 (= e!32290 e!32286)))

(declare-fun b!50040 () Bool)

(declare-fun res!28877 () Bool)

(assert (=> b!50040 (=> (not res!28877) (not e!32292))))

(declare-fun valid!131 (LongMapFixedSize!402) Bool)

(assert (=> b!50040 (= res!28877 (valid!131 newMap!16))))

(declare-fun mapIsEmpty!2162 () Bool)

(assert (=> mapIsEmpty!2162 mapRes!2161))

(declare-fun b!50041 () Bool)

(declare-fun res!28876 () Bool)

(assert (=> b!50041 (=> (not res!28876) (not e!32292))))

(assert (=> b!50041 (= res!28876 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5697 newMap!16)) (_size!250 (v!2156 (underlying!125 thiss!992)))))))

(declare-fun b!50042 () Bool)

(assert (=> b!50042 (= e!32289 tp_is_empty!2181)))

(assert (= (and start!7978 res!28875) b!50036))

(assert (= (and b!50036 res!28874) b!50040))

(assert (= (and b!50040 res!28877) b!50041))

(assert (= (and b!50041 res!28876) b!50034))

(assert (= (and b!50030 condMapEmpty!2161) mapIsEmpty!2162))

(assert (= (and b!50030 (not condMapEmpty!2161)) mapNonEmpty!2161))

(get-info :version)

(assert (= (and mapNonEmpty!2161 ((_ is ValueCellFull!747) mapValue!2161)) b!50037))

(assert (= (and b!50030 ((_ is ValueCellFull!747) mapDefault!2161)) b!50032))

(assert (= b!50031 b!50030))

(assert (= b!50039 b!50031))

(assert (= b!50033 b!50039))

(assert (= start!7978 b!50033))

(assert (= (and b!50038 condMapEmpty!2162) mapIsEmpty!2161))

(assert (= (and b!50038 (not condMapEmpty!2162)) mapNonEmpty!2162))

(assert (= (and mapNonEmpty!2162 ((_ is ValueCellFull!747) mapValue!2162)) b!50029))

(assert (= (and b!50038 ((_ is ValueCellFull!747) mapDefault!2162)) b!50042))

(assert (= b!50035 b!50038))

(assert (= start!7978 b!50035))

(declare-fun m!43461 () Bool)

(assert (=> start!7978 m!43461))

(declare-fun m!43463 () Bool)

(assert (=> b!50031 m!43463))

(declare-fun m!43465 () Bool)

(assert (=> b!50031 m!43465))

(declare-fun m!43467 () Bool)

(assert (=> b!50034 m!43467))

(declare-fun m!43469 () Bool)

(assert (=> mapNonEmpty!2161 m!43469))

(declare-fun m!43471 () Bool)

(assert (=> b!50035 m!43471))

(declare-fun m!43473 () Bool)

(assert (=> b!50035 m!43473))

(declare-fun m!43475 () Bool)

(assert (=> b!50040 m!43475))

(declare-fun m!43477 () Bool)

(assert (=> mapNonEmpty!2162 m!43477))

(check-sat (not b!50031) tp_is_empty!2181 (not b!50034) (not b_next!1529) b_and!2741 (not start!7978) (not b!50040) b_and!2739 (not b_next!1531) (not b!50035) (not mapNonEmpty!2162) (not mapNonEmpty!2161))
(check-sat b_and!2739 b_and!2741 (not b_next!1529) (not b_next!1531))
(get-model)

(declare-fun d!10087 () Bool)

(assert (=> d!10087 (= (array_inv!957 (_keys!3521 newMap!16)) (bvsge (size!1787 (_keys!3521 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50035 d!10087))

(declare-fun d!10089 () Bool)

(assert (=> d!10089 (= (array_inv!958 (_values!1898 newMap!16)) (bvsge (size!1788 (_values!1898 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!50035 d!10089))

(declare-fun d!10091 () Bool)

(declare-fun res!28896 () Bool)

(declare-fun e!32335 () Bool)

(assert (=> d!10091 (=> (not res!28896) (not e!32335))))

(declare-fun simpleValid!33 (LongMapFixedSize!402) Bool)

(assert (=> d!10091 (= res!28896 (simpleValid!33 newMap!16))))

(assert (=> d!10091 (= (valid!131 newMap!16) e!32335)))

(declare-fun b!50091 () Bool)

(declare-fun res!28897 () Bool)

(assert (=> b!50091 (=> (not res!28897) (not e!32335))))

(declare-fun arrayCountValidKeys!0 (array!3271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!50091 (= res!28897 (= (arrayCountValidKeys!0 (_keys!3521 newMap!16) #b00000000000000000000000000000000 (size!1787 (_keys!3521 newMap!16))) (_size!250 newMap!16)))))

(declare-fun b!50092 () Bool)

(declare-fun res!28898 () Bool)

(assert (=> b!50092 (=> (not res!28898) (not e!32335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3271 (_ BitVec 32)) Bool)

(assert (=> b!50092 (= res!28898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3521 newMap!16) (mask!5697 newMap!16)))))

(declare-fun b!50093 () Bool)

(declare-datatypes ((List!1328 0))(
  ( (Nil!1325) (Cons!1324 (h!1904 (_ BitVec 64)) (t!4362 List!1328)) )
))
(declare-fun arrayNoDuplicates!0 (array!3271 (_ BitVec 32) List!1328) Bool)

(assert (=> b!50093 (= e!32335 (arrayNoDuplicates!0 (_keys!3521 newMap!16) #b00000000000000000000000000000000 Nil!1325))))

(assert (= (and d!10091 res!28896) b!50091))

(assert (= (and b!50091 res!28897) b!50092))

(assert (= (and b!50092 res!28898) b!50093))

(declare-fun m!43497 () Bool)

(assert (=> d!10091 m!43497))

(declare-fun m!43499 () Bool)

(assert (=> b!50091 m!43499))

(declare-fun m!43501 () Bool)

(assert (=> b!50092 m!43501))

(declare-fun m!43503 () Bool)

(assert (=> b!50093 m!43503))

(assert (=> b!50040 d!10091))

(declare-fun d!10093 () Bool)

(assert (=> d!10093 (= (array_inv!957 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) (bvsge (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50031 d!10093))

(declare-fun d!10095 () Bool)

(assert (=> d!10095 (= (array_inv!958 (_values!1898 (v!2156 (underlying!125 thiss!992)))) (bvsge (size!1788 (_values!1898 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!50031 d!10095))

(declare-fun d!10097 () Bool)

(assert (=> d!10097 (= (validMask!0 (mask!5697 (v!2156 (underlying!125 thiss!992)))) (and (or (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000001111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000011111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000001111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000011111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000001111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000011111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000001111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000011111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000001111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000011111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000001111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000011111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000001111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000011111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000111111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000001111111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000011111111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000111111111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00001111111111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00011111111111111111111111111111) (= (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!50034 d!10097))

(declare-fun d!10099 () Bool)

(assert (=> d!10099 (= (valid!130 thiss!992) (valid!131 (v!2156 (underlying!125 thiss!992))))))

(declare-fun bs!2353 () Bool)

(assert (= bs!2353 d!10099))

(declare-fun m!43505 () Bool)

(assert (=> bs!2353 m!43505))

(assert (=> start!7978 d!10099))

(declare-fun b!50100 () Bool)

(declare-fun e!32340 () Bool)

(assert (=> b!50100 (= e!32340 tp_is_empty!2181)))

(declare-fun mapNonEmpty!2171 () Bool)

(declare-fun mapRes!2171 () Bool)

(declare-fun tp!6653 () Bool)

(assert (=> mapNonEmpty!2171 (= mapRes!2171 (and tp!6653 e!32340))))

(declare-fun mapKey!2171 () (_ BitVec 32))

(declare-fun mapValue!2171 () ValueCell!747)

(declare-fun mapRest!2171 () (Array (_ BitVec 32) ValueCell!747))

(assert (=> mapNonEmpty!2171 (= mapRest!2162 (store mapRest!2171 mapKey!2171 mapValue!2171))))

(declare-fun b!50101 () Bool)

(declare-fun e!32341 () Bool)

(assert (=> b!50101 (= e!32341 tp_is_empty!2181)))

(declare-fun mapIsEmpty!2171 () Bool)

(assert (=> mapIsEmpty!2171 mapRes!2171))

(declare-fun condMapEmpty!2171 () Bool)

(declare-fun mapDefault!2171 () ValueCell!747)

(assert (=> mapNonEmpty!2162 (= condMapEmpty!2171 (= mapRest!2162 ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2171)))))

(assert (=> mapNonEmpty!2162 (= tp!6636 (and e!32341 mapRes!2171))))

(assert (= (and mapNonEmpty!2162 condMapEmpty!2171) mapIsEmpty!2171))

(assert (= (and mapNonEmpty!2162 (not condMapEmpty!2171)) mapNonEmpty!2171))

(assert (= (and mapNonEmpty!2171 ((_ is ValueCellFull!747) mapValue!2171)) b!50100))

(assert (= (and mapNonEmpty!2162 ((_ is ValueCellFull!747) mapDefault!2171)) b!50101))

(declare-fun m!43507 () Bool)

(assert (=> mapNonEmpty!2171 m!43507))

(declare-fun b!50102 () Bool)

(declare-fun e!32342 () Bool)

(assert (=> b!50102 (= e!32342 tp_is_empty!2181)))

(declare-fun mapNonEmpty!2172 () Bool)

(declare-fun mapRes!2172 () Bool)

(declare-fun tp!6654 () Bool)

(assert (=> mapNonEmpty!2172 (= mapRes!2172 (and tp!6654 e!32342))))

(declare-fun mapKey!2172 () (_ BitVec 32))

(declare-fun mapValue!2172 () ValueCell!747)

(declare-fun mapRest!2172 () (Array (_ BitVec 32) ValueCell!747))

(assert (=> mapNonEmpty!2172 (= mapRest!2161 (store mapRest!2172 mapKey!2172 mapValue!2172))))

(declare-fun b!50103 () Bool)

(declare-fun e!32343 () Bool)

(assert (=> b!50103 (= e!32343 tp_is_empty!2181)))

(declare-fun mapIsEmpty!2172 () Bool)

(assert (=> mapIsEmpty!2172 mapRes!2172))

(declare-fun condMapEmpty!2172 () Bool)

(declare-fun mapDefault!2172 () ValueCell!747)

(assert (=> mapNonEmpty!2161 (= condMapEmpty!2172 (= mapRest!2161 ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2172)))))

(assert (=> mapNonEmpty!2161 (= tp!6637 (and e!32343 mapRes!2172))))

(assert (= (and mapNonEmpty!2161 condMapEmpty!2172) mapIsEmpty!2172))

(assert (= (and mapNonEmpty!2161 (not condMapEmpty!2172)) mapNonEmpty!2172))

(assert (= (and mapNonEmpty!2172 ((_ is ValueCellFull!747) mapValue!2172)) b!50102))

(assert (= (and mapNonEmpty!2161 ((_ is ValueCellFull!747) mapDefault!2172)) b!50103))

(declare-fun m!43509 () Bool)

(assert (=> mapNonEmpty!2172 m!43509))

(check-sat (not mapNonEmpty!2172) tp_is_empty!2181 (not b_next!1529) b_and!2741 (not d!10099) (not b!50091) (not b!50093) (not b!50092) (not mapNonEmpty!2171) b_and!2739 (not d!10091) (not b_next!1531))
(check-sat b_and!2739 b_and!2741 (not b_next!1529) (not b_next!1531))
(get-model)

(declare-fun d!10101 () Bool)

(declare-fun res!28899 () Bool)

(declare-fun e!32344 () Bool)

(assert (=> d!10101 (=> (not res!28899) (not e!32344))))

(assert (=> d!10101 (= res!28899 (simpleValid!33 (v!2156 (underlying!125 thiss!992))))))

(assert (=> d!10101 (= (valid!131 (v!2156 (underlying!125 thiss!992))) e!32344)))

(declare-fun b!50104 () Bool)

(declare-fun res!28900 () Bool)

(assert (=> b!50104 (=> (not res!28900) (not e!32344))))

(assert (=> b!50104 (= res!28900 (= (arrayCountValidKeys!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000000 (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))) (_size!250 (v!2156 (underlying!125 thiss!992)))))))

(declare-fun b!50105 () Bool)

(declare-fun res!28901 () Bool)

(assert (=> b!50105 (=> (not res!28901) (not e!32344))))

(assert (=> b!50105 (= res!28901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3521 (v!2156 (underlying!125 thiss!992))) (mask!5697 (v!2156 (underlying!125 thiss!992)))))))

(declare-fun b!50106 () Bool)

(assert (=> b!50106 (= e!32344 (arrayNoDuplicates!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000000 Nil!1325))))

(assert (= (and d!10101 res!28899) b!50104))

(assert (= (and b!50104 res!28900) b!50105))

(assert (= (and b!50105 res!28901) b!50106))

(declare-fun m!43511 () Bool)

(assert (=> d!10101 m!43511))

(declare-fun m!43513 () Bool)

(assert (=> b!50104 m!43513))

(declare-fun m!43515 () Bool)

(assert (=> b!50105 m!43515))

(declare-fun m!43517 () Bool)

(assert (=> b!50106 m!43517))

(assert (=> d!10099 d!10101))

(declare-fun d!10103 () Bool)

(declare-fun lt!21014 () (_ BitVec 32))

(assert (=> d!10103 (and (bvsge lt!21014 #b00000000000000000000000000000000) (bvsle lt!21014 (bvsub (size!1787 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32349 () (_ BitVec 32))

(assert (=> d!10103 (= lt!21014 e!32349)))

(declare-fun c!6765 () Bool)

(assert (=> d!10103 (= c!6765 (bvsge #b00000000000000000000000000000000 (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10103 (and (bvsle #b00000000000000000000000000000000 (size!1787 (_keys!3521 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1787 (_keys!3521 newMap!16)) (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10103 (= (arrayCountValidKeys!0 (_keys!3521 newMap!16) #b00000000000000000000000000000000 (size!1787 (_keys!3521 newMap!16))) lt!21014)))

(declare-fun b!50115 () Bool)

(declare-fun e!32350 () (_ BitVec 32))

(declare-fun call!3874 () (_ BitVec 32))

(assert (=> b!50115 (= e!32350 call!3874)))

(declare-fun b!50116 () Bool)

(assert (=> b!50116 (= e!32349 e!32350)))

(declare-fun c!6764 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!50116 (= c!6764 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50117 () Bool)

(assert (=> b!50117 (= e!32349 #b00000000000000000000000000000000)))

(declare-fun b!50118 () Bool)

(assert (=> b!50118 (= e!32350 (bvadd #b00000000000000000000000000000001 call!3874))))

(declare-fun bm!3871 () Bool)

(assert (=> bm!3871 (= call!3874 (arrayCountValidKeys!0 (_keys!3521 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))))))

(assert (= (and d!10103 c!6765) b!50117))

(assert (= (and d!10103 (not c!6765)) b!50116))

(assert (= (and b!50116 c!6764) b!50118))

(assert (= (and b!50116 (not c!6764)) b!50115))

(assert (= (or b!50118 b!50115) bm!3871))

(declare-fun m!43519 () Bool)

(assert (=> b!50116 m!43519))

(assert (=> b!50116 m!43519))

(declare-fun m!43521 () Bool)

(assert (=> b!50116 m!43521))

(declare-fun m!43523 () Bool)

(assert (=> bm!3871 m!43523))

(assert (=> b!50091 d!10103))

(declare-fun b!50127 () Bool)

(declare-fun res!28913 () Bool)

(declare-fun e!32353 () Bool)

(assert (=> b!50127 (=> (not res!28913) (not e!32353))))

(assert (=> b!50127 (= res!28913 (and (= (size!1788 (_values!1898 newMap!16)) (bvadd (mask!5697 newMap!16) #b00000000000000000000000000000001)) (= (size!1787 (_keys!3521 newMap!16)) (size!1788 (_values!1898 newMap!16))) (bvsge (_size!250 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!250 newMap!16) (bvadd (mask!5697 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!50128 () Bool)

(declare-fun res!28912 () Bool)

(assert (=> b!50128 (=> (not res!28912) (not e!32353))))

(declare-fun size!1791 (LongMapFixedSize!402) (_ BitVec 32))

(assert (=> b!50128 (= res!28912 (bvsge (size!1791 newMap!16) (_size!250 newMap!16)))))

(declare-fun d!10105 () Bool)

(declare-fun res!28910 () Bool)

(assert (=> d!10105 (=> (not res!28910) (not e!32353))))

(assert (=> d!10105 (= res!28910 (validMask!0 (mask!5697 newMap!16)))))

(assert (=> d!10105 (= (simpleValid!33 newMap!16) e!32353)))

(declare-fun b!50130 () Bool)

(assert (=> b!50130 (= e!32353 (and (bvsge (extraKeys!1806 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1806 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!250 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!50129 () Bool)

(declare-fun res!28911 () Bool)

(assert (=> b!50129 (=> (not res!28911) (not e!32353))))

(assert (=> b!50129 (= res!28911 (= (size!1791 newMap!16) (bvadd (_size!250 newMap!16) (bvsdiv (bvadd (extraKeys!1806 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10105 res!28910) b!50127))

(assert (= (and b!50127 res!28913) b!50128))

(assert (= (and b!50128 res!28912) b!50129))

(assert (= (and b!50129 res!28911) b!50130))

(declare-fun m!43525 () Bool)

(assert (=> b!50128 m!43525))

(declare-fun m!43527 () Bool)

(assert (=> d!10105 m!43527))

(assert (=> b!50129 m!43525))

(assert (=> d!10091 d!10105))

(declare-fun b!50139 () Bool)

(declare-fun e!32362 () Bool)

(declare-fun e!32360 () Bool)

(assert (=> b!50139 (= e!32362 e!32360)))

(declare-fun c!6768 () Bool)

(assert (=> b!50139 (= c!6768 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10107 () Bool)

(declare-fun res!28919 () Bool)

(assert (=> d!10107 (=> res!28919 e!32362)))

(assert (=> d!10107 (= res!28919 (bvsge #b00000000000000000000000000000000 (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3521 newMap!16) (mask!5697 newMap!16)) e!32362)))

(declare-fun b!50140 () Bool)

(declare-fun call!3877 () Bool)

(assert (=> b!50140 (= e!32360 call!3877)))

(declare-fun b!50141 () Bool)

(declare-fun e!32361 () Bool)

(assert (=> b!50141 (= e!32360 e!32361)))

(declare-fun lt!21021 () (_ BitVec 64))

(assert (=> b!50141 (= lt!21021 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1417 0))(
  ( (Unit!1418) )
))
(declare-fun lt!21023 () Unit!1417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3271 (_ BitVec 64) (_ BitVec 32)) Unit!1417)

(assert (=> b!50141 (= lt!21023 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3521 newMap!16) lt!21021 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!50141 (arrayContainsKey!0 (_keys!3521 newMap!16) lt!21021 #b00000000000000000000000000000000)))

(declare-fun lt!21022 () Unit!1417)

(assert (=> b!50141 (= lt!21022 lt!21023)))

(declare-fun res!28918 () Bool)

(declare-datatypes ((SeekEntryResult!218 0))(
  ( (MissingZero!218 (index!2994 (_ BitVec 32))) (Found!218 (index!2995 (_ BitVec 32))) (Intermediate!218 (undefined!1030 Bool) (index!2996 (_ BitVec 32)) (x!9158 (_ BitVec 32))) (Undefined!218) (MissingVacant!218 (index!2997 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3271 (_ BitVec 32)) SeekEntryResult!218)

(assert (=> b!50141 (= res!28918 (= (seekEntryOrOpen!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) (_keys!3521 newMap!16) (mask!5697 newMap!16)) (Found!218 #b00000000000000000000000000000000)))))

(assert (=> b!50141 (=> (not res!28918) (not e!32361))))

(declare-fun bm!3874 () Bool)

(assert (=> bm!3874 (= call!3877 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3521 newMap!16) (mask!5697 newMap!16)))))

(declare-fun b!50142 () Bool)

(assert (=> b!50142 (= e!32361 call!3877)))

(assert (= (and d!10107 (not res!28919)) b!50139))

(assert (= (and b!50139 c!6768) b!50141))

(assert (= (and b!50139 (not c!6768)) b!50140))

(assert (= (and b!50141 res!28918) b!50142))

(assert (= (or b!50142 b!50140) bm!3874))

(assert (=> b!50139 m!43519))

(assert (=> b!50139 m!43519))

(assert (=> b!50139 m!43521))

(assert (=> b!50141 m!43519))

(declare-fun m!43529 () Bool)

(assert (=> b!50141 m!43529))

(declare-fun m!43531 () Bool)

(assert (=> b!50141 m!43531))

(assert (=> b!50141 m!43519))

(declare-fun m!43533 () Bool)

(assert (=> b!50141 m!43533))

(declare-fun m!43535 () Bool)

(assert (=> bm!3874 m!43535))

(assert (=> b!50092 d!10107))

(declare-fun b!50153 () Bool)

(declare-fun e!32373 () Bool)

(declare-fun e!32372 () Bool)

(assert (=> b!50153 (= e!32373 e!32372)))

(declare-fun res!28926 () Bool)

(assert (=> b!50153 (=> (not res!28926) (not e!32372))))

(declare-fun e!32374 () Bool)

(assert (=> b!50153 (= res!28926 (not e!32374))))

(declare-fun res!28927 () Bool)

(assert (=> b!50153 (=> (not res!28927) (not e!32374))))

(assert (=> b!50153 (= res!28927 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!3877 () Bool)

(declare-fun call!3880 () Bool)

(declare-fun c!6771 () Bool)

(assert (=> bm!3877 (= call!3880 (arrayNoDuplicates!0 (_keys!3521 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6771 (Cons!1324 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325)))))

(declare-fun b!50154 () Bool)

(declare-fun contains!618 (List!1328 (_ BitVec 64)) Bool)

(assert (=> b!50154 (= e!32374 (contains!618 Nil!1325 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10109 () Bool)

(declare-fun res!28928 () Bool)

(assert (=> d!10109 (=> res!28928 e!32373)))

(assert (=> d!10109 (= res!28928 (bvsge #b00000000000000000000000000000000 (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10109 (= (arrayNoDuplicates!0 (_keys!3521 newMap!16) #b00000000000000000000000000000000 Nil!1325) e!32373)))

(declare-fun b!50155 () Bool)

(declare-fun e!32371 () Bool)

(assert (=> b!50155 (= e!32372 e!32371)))

(assert (=> b!50155 (= c!6771 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50156 () Bool)

(assert (=> b!50156 (= e!32371 call!3880)))

(declare-fun b!50157 () Bool)

(assert (=> b!50157 (= e!32371 call!3880)))

(assert (= (and d!10109 (not res!28928)) b!50153))

(assert (= (and b!50153 res!28927) b!50154))

(assert (= (and b!50153 res!28926) b!50155))

(assert (= (and b!50155 c!6771) b!50157))

(assert (= (and b!50155 (not c!6771)) b!50156))

(assert (= (or b!50157 b!50156) bm!3877))

(assert (=> b!50153 m!43519))

(assert (=> b!50153 m!43519))

(assert (=> b!50153 m!43521))

(assert (=> bm!3877 m!43519))

(declare-fun m!43537 () Bool)

(assert (=> bm!3877 m!43537))

(assert (=> b!50154 m!43519))

(assert (=> b!50154 m!43519))

(declare-fun m!43539 () Bool)

(assert (=> b!50154 m!43539))

(assert (=> b!50155 m!43519))

(assert (=> b!50155 m!43519))

(assert (=> b!50155 m!43521))

(assert (=> b!50093 d!10109))

(declare-fun b!50158 () Bool)

(declare-fun e!32375 () Bool)

(assert (=> b!50158 (= e!32375 tp_is_empty!2181)))

(declare-fun mapNonEmpty!2173 () Bool)

(declare-fun mapRes!2173 () Bool)

(declare-fun tp!6655 () Bool)

(assert (=> mapNonEmpty!2173 (= mapRes!2173 (and tp!6655 e!32375))))

(declare-fun mapValue!2173 () ValueCell!747)

(declare-fun mapRest!2173 () (Array (_ BitVec 32) ValueCell!747))

(declare-fun mapKey!2173 () (_ BitVec 32))

(assert (=> mapNonEmpty!2173 (= mapRest!2172 (store mapRest!2173 mapKey!2173 mapValue!2173))))

(declare-fun b!50159 () Bool)

(declare-fun e!32376 () Bool)

(assert (=> b!50159 (= e!32376 tp_is_empty!2181)))

(declare-fun mapIsEmpty!2173 () Bool)

(assert (=> mapIsEmpty!2173 mapRes!2173))

(declare-fun condMapEmpty!2173 () Bool)

(declare-fun mapDefault!2173 () ValueCell!747)

(assert (=> mapNonEmpty!2172 (= condMapEmpty!2173 (= mapRest!2172 ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2173)))))

(assert (=> mapNonEmpty!2172 (= tp!6654 (and e!32376 mapRes!2173))))

(assert (= (and mapNonEmpty!2172 condMapEmpty!2173) mapIsEmpty!2173))

(assert (= (and mapNonEmpty!2172 (not condMapEmpty!2173)) mapNonEmpty!2173))

(assert (= (and mapNonEmpty!2173 ((_ is ValueCellFull!747) mapValue!2173)) b!50158))

(assert (= (and mapNonEmpty!2172 ((_ is ValueCellFull!747) mapDefault!2173)) b!50159))

(declare-fun m!43541 () Bool)

(assert (=> mapNonEmpty!2173 m!43541))

(declare-fun b!50160 () Bool)

(declare-fun e!32377 () Bool)

(assert (=> b!50160 (= e!32377 tp_is_empty!2181)))

(declare-fun mapNonEmpty!2174 () Bool)

(declare-fun mapRes!2174 () Bool)

(declare-fun tp!6656 () Bool)

(assert (=> mapNonEmpty!2174 (= mapRes!2174 (and tp!6656 e!32377))))

(declare-fun mapKey!2174 () (_ BitVec 32))

(declare-fun mapValue!2174 () ValueCell!747)

(declare-fun mapRest!2174 () (Array (_ BitVec 32) ValueCell!747))

(assert (=> mapNonEmpty!2174 (= mapRest!2171 (store mapRest!2174 mapKey!2174 mapValue!2174))))

(declare-fun b!50161 () Bool)

(declare-fun e!32378 () Bool)

(assert (=> b!50161 (= e!32378 tp_is_empty!2181)))

(declare-fun mapIsEmpty!2174 () Bool)

(assert (=> mapIsEmpty!2174 mapRes!2174))

(declare-fun condMapEmpty!2174 () Bool)

(declare-fun mapDefault!2174 () ValueCell!747)

(assert (=> mapNonEmpty!2171 (= condMapEmpty!2174 (= mapRest!2171 ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2174)))))

(assert (=> mapNonEmpty!2171 (= tp!6653 (and e!32378 mapRes!2174))))

(assert (= (and mapNonEmpty!2171 condMapEmpty!2174) mapIsEmpty!2174))

(assert (= (and mapNonEmpty!2171 (not condMapEmpty!2174)) mapNonEmpty!2174))

(assert (= (and mapNonEmpty!2174 ((_ is ValueCellFull!747) mapValue!2174)) b!50160))

(assert (= (and mapNonEmpty!2171 ((_ is ValueCellFull!747) mapDefault!2174)) b!50161))

(declare-fun m!43543 () Bool)

(assert (=> mapNonEmpty!2174 m!43543))

(check-sat (not bm!3874) tp_is_empty!2181 (not b_next!1529) (not bm!3877) (not bm!3871) (not b!50128) (not b!50116) (not b!50154) (not b!50141) b_and!2739 (not d!10101) (not mapNonEmpty!2174) (not b!50106) (not b!50155) (not b!50129) (not b!50153) (not b!50104) b_and!2741 (not b!50105) (not b_next!1531) (not b!50139) (not mapNonEmpty!2173) (not d!10105))
(check-sat b_and!2739 b_and!2741 (not b_next!1529) (not b_next!1531))
(get-model)

(declare-fun b!50162 () Bool)

(declare-fun e!32381 () Bool)

(declare-fun e!32380 () Bool)

(assert (=> b!50162 (= e!32381 e!32380)))

(declare-fun res!28929 () Bool)

(assert (=> b!50162 (=> (not res!28929) (not e!32380))))

(declare-fun e!32382 () Bool)

(assert (=> b!50162 (= res!28929 (not e!32382))))

(declare-fun res!28930 () Bool)

(assert (=> b!50162 (=> (not res!28930) (not e!32382))))

(assert (=> b!50162 (= res!28930 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3878 () Bool)

(declare-fun c!6772 () Bool)

(declare-fun call!3881 () Bool)

(assert (=> bm!3878 (= call!3881 (arrayNoDuplicates!0 (_keys!3521 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6772 (Cons!1324 (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6771 (Cons!1324 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325)) (ite c!6771 (Cons!1324 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325))))))

(declare-fun b!50163 () Bool)

(assert (=> b!50163 (= e!32382 (contains!618 (ite c!6771 (Cons!1324 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325) (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10111 () Bool)

(declare-fun res!28931 () Bool)

(assert (=> d!10111 (=> res!28931 e!32381)))

(assert (=> d!10111 (= res!28931 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10111 (= (arrayNoDuplicates!0 (_keys!3521 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6771 (Cons!1324 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) Nil!1325) Nil!1325)) e!32381)))

(declare-fun b!50164 () Bool)

(declare-fun e!32379 () Bool)

(assert (=> b!50164 (= e!32380 e!32379)))

(assert (=> b!50164 (= c!6772 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50165 () Bool)

(assert (=> b!50165 (= e!32379 call!3881)))

(declare-fun b!50166 () Bool)

(assert (=> b!50166 (= e!32379 call!3881)))

(assert (= (and d!10111 (not res!28931)) b!50162))

(assert (= (and b!50162 res!28930) b!50163))

(assert (= (and b!50162 res!28929) b!50164))

(assert (= (and b!50164 c!6772) b!50166))

(assert (= (and b!50164 (not c!6772)) b!50165))

(assert (= (or b!50166 b!50165) bm!3878))

(declare-fun m!43545 () Bool)

(assert (=> b!50162 m!43545))

(assert (=> b!50162 m!43545))

(declare-fun m!43547 () Bool)

(assert (=> b!50162 m!43547))

(assert (=> bm!3878 m!43545))

(declare-fun m!43549 () Bool)

(assert (=> bm!3878 m!43549))

(assert (=> b!50163 m!43545))

(assert (=> b!50163 m!43545))

(declare-fun m!43551 () Bool)

(assert (=> b!50163 m!43551))

(assert (=> b!50164 m!43545))

(assert (=> b!50164 m!43545))

(assert (=> b!50164 m!43547))

(assert (=> bm!3877 d!10111))

(declare-fun d!10113 () Bool)

(assert (=> d!10113 (= (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!50155 d!10113))

(declare-fun d!10115 () Bool)

(declare-fun lt!21026 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!55 (List!1328) (InoxSet (_ BitVec 64)))

(assert (=> d!10115 (= lt!21026 (select (content!55 Nil!1325) (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!32387 () Bool)

(assert (=> d!10115 (= lt!21026 e!32387)))

(declare-fun res!28936 () Bool)

(assert (=> d!10115 (=> (not res!28936) (not e!32387))))

(assert (=> d!10115 (= res!28936 ((_ is Cons!1324) Nil!1325))))

(assert (=> d!10115 (= (contains!618 Nil!1325 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)) lt!21026)))

(declare-fun b!50171 () Bool)

(declare-fun e!32388 () Bool)

(assert (=> b!50171 (= e!32387 e!32388)))

(declare-fun res!28937 () Bool)

(assert (=> b!50171 (=> res!28937 e!32388)))

(assert (=> b!50171 (= res!28937 (= (h!1904 Nil!1325) (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50172 () Bool)

(assert (=> b!50172 (= e!32388 (contains!618 (t!4362 Nil!1325) (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10115 res!28936) b!50171))

(assert (= (and b!50171 (not res!28937)) b!50172))

(declare-fun m!43553 () Bool)

(assert (=> d!10115 m!43553))

(assert (=> d!10115 m!43519))

(declare-fun m!43555 () Bool)

(assert (=> d!10115 m!43555))

(assert (=> b!50172 m!43519))

(declare-fun m!43557 () Bool)

(assert (=> b!50172 m!43557))

(assert (=> b!50154 d!10115))

(declare-fun d!10117 () Bool)

(assert (=> d!10117 (= (size!1791 newMap!16) (bvadd (_size!250 newMap!16) (bvsdiv (bvadd (extraKeys!1806 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!50128 d!10117))

(declare-fun d!10119 () Bool)

(declare-fun lt!21027 () (_ BitVec 32))

(assert (=> d!10119 (and (bvsge lt!21027 #b00000000000000000000000000000000) (bvsle lt!21027 (bvsub (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!32389 () (_ BitVec 32))

(assert (=> d!10119 (= lt!21027 e!32389)))

(declare-fun c!6774 () Bool)

(assert (=> d!10119 (= c!6774 (bvsge #b00000000000000000000000000000000 (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))))))

(assert (=> d!10119 (and (bvsle #b00000000000000000000000000000000 (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))))))

(assert (=> d!10119 (= (arrayCountValidKeys!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000000 (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))) lt!21027)))

(declare-fun b!50173 () Bool)

(declare-fun e!32390 () (_ BitVec 32))

(declare-fun call!3882 () (_ BitVec 32))

(assert (=> b!50173 (= e!32390 call!3882)))

(declare-fun b!50174 () Bool)

(assert (=> b!50174 (= e!32389 e!32390)))

(declare-fun c!6773 () Bool)

(assert (=> b!50174 (= c!6773 (validKeyInArray!0 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50175 () Bool)

(assert (=> b!50175 (= e!32389 #b00000000000000000000000000000000)))

(declare-fun b!50176 () Bool)

(assert (=> b!50176 (= e!32390 (bvadd #b00000000000000000000000000000001 call!3882))))

(declare-fun bm!3879 () Bool)

(assert (=> bm!3879 (= call!3882 (arrayCountValidKeys!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))))))

(assert (= (and d!10119 c!6774) b!50175))

(assert (= (and d!10119 (not c!6774)) b!50174))

(assert (= (and b!50174 c!6773) b!50176))

(assert (= (and b!50174 (not c!6773)) b!50173))

(assert (= (or b!50176 b!50173) bm!3879))

(declare-fun m!43559 () Bool)

(assert (=> b!50174 m!43559))

(assert (=> b!50174 m!43559))

(declare-fun m!43561 () Bool)

(assert (=> b!50174 m!43561))

(declare-fun m!43563 () Bool)

(assert (=> bm!3879 m!43563))

(assert (=> b!50104 d!10119))

(assert (=> b!50129 d!10117))

(declare-fun b!50177 () Bool)

(declare-fun e!32393 () Bool)

(declare-fun e!32392 () Bool)

(assert (=> b!50177 (= e!32393 e!32392)))

(declare-fun res!28938 () Bool)

(assert (=> b!50177 (=> (not res!28938) (not e!32392))))

(declare-fun e!32394 () Bool)

(assert (=> b!50177 (= res!28938 (not e!32394))))

(declare-fun res!28939 () Bool)

(assert (=> b!50177 (=> (not res!28939) (not e!32394))))

(assert (=> b!50177 (= res!28939 (validKeyInArray!0 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!3880 () Bool)

(declare-fun call!3883 () Bool)

(declare-fun c!6775 () Bool)

(assert (=> bm!3880 (= call!3883 (arrayNoDuplicates!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6775 (Cons!1324 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000) Nil!1325) Nil!1325)))))

(declare-fun b!50178 () Bool)

(assert (=> b!50178 (= e!32394 (contains!618 Nil!1325 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10121 () Bool)

(declare-fun res!28940 () Bool)

(assert (=> d!10121 (=> res!28940 e!32393)))

(assert (=> d!10121 (= res!28940 (bvsge #b00000000000000000000000000000000 (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))))))

(assert (=> d!10121 (= (arrayNoDuplicates!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000000 Nil!1325) e!32393)))

(declare-fun b!50179 () Bool)

(declare-fun e!32391 () Bool)

(assert (=> b!50179 (= e!32392 e!32391)))

(assert (=> b!50179 (= c!6775 (validKeyInArray!0 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!50180 () Bool)

(assert (=> b!50180 (= e!32391 call!3883)))

(declare-fun b!50181 () Bool)

(assert (=> b!50181 (= e!32391 call!3883)))

(assert (= (and d!10121 (not res!28940)) b!50177))

(assert (= (and b!50177 res!28939) b!50178))

(assert (= (and b!50177 res!28938) b!50179))

(assert (= (and b!50179 c!6775) b!50181))

(assert (= (and b!50179 (not c!6775)) b!50180))

(assert (= (or b!50181 b!50180) bm!3880))

(assert (=> b!50177 m!43559))

(assert (=> b!50177 m!43559))

(assert (=> b!50177 m!43561))

(assert (=> bm!3880 m!43559))

(declare-fun m!43565 () Bool)

(assert (=> bm!3880 m!43565))

(assert (=> b!50178 m!43559))

(assert (=> b!50178 m!43559))

(declare-fun m!43567 () Bool)

(assert (=> b!50178 m!43567))

(assert (=> b!50179 m!43559))

(assert (=> b!50179 m!43559))

(assert (=> b!50179 m!43561))

(assert (=> b!50106 d!10121))

(declare-fun b!50182 () Bool)

(declare-fun e!32397 () Bool)

(declare-fun e!32395 () Bool)

(assert (=> b!50182 (= e!32397 e!32395)))

(declare-fun c!6776 () Bool)

(assert (=> b!50182 (= c!6776 (validKeyInArray!0 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10123 () Bool)

(declare-fun res!28942 () Bool)

(assert (=> d!10123 (=> res!28942 e!32397)))

(assert (=> d!10123 (= res!28942 (bvsge #b00000000000000000000000000000000 (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992))))))))

(assert (=> d!10123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3521 (v!2156 (underlying!125 thiss!992))) (mask!5697 (v!2156 (underlying!125 thiss!992)))) e!32397)))

(declare-fun b!50183 () Bool)

(declare-fun call!3884 () Bool)

(assert (=> b!50183 (= e!32395 call!3884)))

(declare-fun b!50184 () Bool)

(declare-fun e!32396 () Bool)

(assert (=> b!50184 (= e!32395 e!32396)))

(declare-fun lt!21028 () (_ BitVec 64))

(assert (=> b!50184 (= lt!21028 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21030 () Unit!1417)

(assert (=> b!50184 (= lt!21030 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) lt!21028 #b00000000000000000000000000000000))))

(assert (=> b!50184 (arrayContainsKey!0 (_keys!3521 (v!2156 (underlying!125 thiss!992))) lt!21028 #b00000000000000000000000000000000)))

(declare-fun lt!21029 () Unit!1417)

(assert (=> b!50184 (= lt!21029 lt!21030)))

(declare-fun res!28941 () Bool)

(assert (=> b!50184 (= res!28941 (= (seekEntryOrOpen!0 (select (arr!1565 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) #b00000000000000000000000000000000) (_keys!3521 (v!2156 (underlying!125 thiss!992))) (mask!5697 (v!2156 (underlying!125 thiss!992)))) (Found!218 #b00000000000000000000000000000000)))))

(assert (=> b!50184 (=> (not res!28941) (not e!32396))))

(declare-fun bm!3881 () Bool)

(assert (=> bm!3881 (= call!3884 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3521 (v!2156 (underlying!125 thiss!992))) (mask!5697 (v!2156 (underlying!125 thiss!992)))))))

(declare-fun b!50185 () Bool)

(assert (=> b!50185 (= e!32396 call!3884)))

(assert (= (and d!10123 (not res!28942)) b!50182))

(assert (= (and b!50182 c!6776) b!50184))

(assert (= (and b!50182 (not c!6776)) b!50183))

(assert (= (and b!50184 res!28941) b!50185))

(assert (= (or b!50185 b!50183) bm!3881))

(assert (=> b!50182 m!43559))

(assert (=> b!50182 m!43559))

(assert (=> b!50182 m!43561))

(assert (=> b!50184 m!43559))

(declare-fun m!43569 () Bool)

(assert (=> b!50184 m!43569))

(declare-fun m!43571 () Bool)

(assert (=> b!50184 m!43571))

(assert (=> b!50184 m!43559))

(declare-fun m!43573 () Bool)

(assert (=> b!50184 m!43573))

(declare-fun m!43575 () Bool)

(assert (=> bm!3881 m!43575))

(assert (=> b!50105 d!10123))

(assert (=> b!50139 d!10113))

(declare-fun d!10125 () Bool)

(assert (=> d!10125 (arrayContainsKey!0 (_keys!3521 newMap!16) lt!21021 #b00000000000000000000000000000000)))

(declare-fun lt!21033 () Unit!1417)

(declare-fun choose!13 (array!3271 (_ BitVec 64) (_ BitVec 32)) Unit!1417)

(assert (=> d!10125 (= lt!21033 (choose!13 (_keys!3521 newMap!16) lt!21021 #b00000000000000000000000000000000))))

(assert (=> d!10125 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10125 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3521 newMap!16) lt!21021 #b00000000000000000000000000000000) lt!21033)))

(declare-fun bs!2354 () Bool)

(assert (= bs!2354 d!10125))

(assert (=> bs!2354 m!43531))

(declare-fun m!43577 () Bool)

(assert (=> bs!2354 m!43577))

(assert (=> b!50141 d!10125))

(declare-fun d!10127 () Bool)

(declare-fun res!28947 () Bool)

(declare-fun e!32402 () Bool)

(assert (=> d!10127 (=> res!28947 e!32402)))

(assert (=> d!10127 (= res!28947 (= (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) lt!21021))))

(assert (=> d!10127 (= (arrayContainsKey!0 (_keys!3521 newMap!16) lt!21021 #b00000000000000000000000000000000) e!32402)))

(declare-fun b!50190 () Bool)

(declare-fun e!32403 () Bool)

(assert (=> b!50190 (= e!32402 e!32403)))

(declare-fun res!28948 () Bool)

(assert (=> b!50190 (=> (not res!28948) (not e!32403))))

(assert (=> b!50190 (= res!28948 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))))))

(declare-fun b!50191 () Bool)

(assert (=> b!50191 (= e!32403 (arrayContainsKey!0 (_keys!3521 newMap!16) lt!21021 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10127 (not res!28947)) b!50190))

(assert (= (and b!50190 res!28948) b!50191))

(assert (=> d!10127 m!43519))

(declare-fun m!43579 () Bool)

(assert (=> b!50191 m!43579))

(assert (=> b!50141 d!10127))

(declare-fun b!50204 () Bool)

(declare-fun e!32410 () SeekEntryResult!218)

(assert (=> b!50204 (= e!32410 Undefined!218)))

(declare-fun b!50205 () Bool)

(declare-fun e!32412 () SeekEntryResult!218)

(declare-fun lt!21040 () SeekEntryResult!218)

(assert (=> b!50205 (= e!32412 (Found!218 (index!2996 lt!21040)))))

(declare-fun b!50206 () Bool)

(assert (=> b!50206 (= e!32410 e!32412)))

(declare-fun lt!21042 () (_ BitVec 64))

(assert (=> b!50206 (= lt!21042 (select (arr!1565 (_keys!3521 newMap!16)) (index!2996 lt!21040)))))

(declare-fun c!6783 () Bool)

(assert (=> b!50206 (= c!6783 (= lt!21042 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!50207 () Bool)

(declare-fun e!32411 () SeekEntryResult!218)

(assert (=> b!50207 (= e!32411 (MissingZero!218 (index!2996 lt!21040)))))

(declare-fun d!10129 () Bool)

(declare-fun lt!21041 () SeekEntryResult!218)

(assert (=> d!10129 (and (or ((_ is Undefined!218) lt!21041) (not ((_ is Found!218) lt!21041)) (and (bvsge (index!2995 lt!21041) #b00000000000000000000000000000000) (bvslt (index!2995 lt!21041) (size!1787 (_keys!3521 newMap!16))))) (or ((_ is Undefined!218) lt!21041) ((_ is Found!218) lt!21041) (not ((_ is MissingZero!218) lt!21041)) (and (bvsge (index!2994 lt!21041) #b00000000000000000000000000000000) (bvslt (index!2994 lt!21041) (size!1787 (_keys!3521 newMap!16))))) (or ((_ is Undefined!218) lt!21041) ((_ is Found!218) lt!21041) ((_ is MissingZero!218) lt!21041) (not ((_ is MissingVacant!218) lt!21041)) (and (bvsge (index!2997 lt!21041) #b00000000000000000000000000000000) (bvslt (index!2997 lt!21041) (size!1787 (_keys!3521 newMap!16))))) (or ((_ is Undefined!218) lt!21041) (ite ((_ is Found!218) lt!21041) (= (select (arr!1565 (_keys!3521 newMap!16)) (index!2995 lt!21041)) (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!218) lt!21041) (= (select (arr!1565 (_keys!3521 newMap!16)) (index!2994 lt!21041)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!218) lt!21041) (= (select (arr!1565 (_keys!3521 newMap!16)) (index!2997 lt!21041)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10129 (= lt!21041 e!32410)))

(declare-fun c!6784 () Bool)

(assert (=> d!10129 (= c!6784 (and ((_ is Intermediate!218) lt!21040) (undefined!1030 lt!21040)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3271 (_ BitVec 32)) SeekEntryResult!218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10129 (= lt!21040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) (mask!5697 newMap!16)) (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) (_keys!3521 newMap!16) (mask!5697 newMap!16)))))

(assert (=> d!10129 (validMask!0 (mask!5697 newMap!16))))

(assert (=> d!10129 (= (seekEntryOrOpen!0 (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) (_keys!3521 newMap!16) (mask!5697 newMap!16)) lt!21041)))

(declare-fun b!50208 () Bool)

(declare-fun c!6785 () Bool)

(assert (=> b!50208 (= c!6785 (= lt!21042 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!50208 (= e!32412 e!32411)))

(declare-fun b!50209 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3271 (_ BitVec 32)) SeekEntryResult!218)

(assert (=> b!50209 (= e!32411 (seekKeyOrZeroReturnVacant!0 (x!9158 lt!21040) (index!2996 lt!21040) (index!2996 lt!21040) (select (arr!1565 (_keys!3521 newMap!16)) #b00000000000000000000000000000000) (_keys!3521 newMap!16) (mask!5697 newMap!16)))))

(assert (= (and d!10129 c!6784) b!50204))

(assert (= (and d!10129 (not c!6784)) b!50206))

(assert (= (and b!50206 c!6783) b!50205))

(assert (= (and b!50206 (not c!6783)) b!50208))

(assert (= (and b!50208 c!6785) b!50207))

(assert (= (and b!50208 (not c!6785)) b!50209))

(declare-fun m!43581 () Bool)

(assert (=> b!50206 m!43581))

(declare-fun m!43583 () Bool)

(assert (=> d!10129 m!43583))

(assert (=> d!10129 m!43527))

(declare-fun m!43585 () Bool)

(assert (=> d!10129 m!43585))

(declare-fun m!43587 () Bool)

(assert (=> d!10129 m!43587))

(declare-fun m!43589 () Bool)

(assert (=> d!10129 m!43589))

(assert (=> d!10129 m!43519))

(declare-fun m!43591 () Bool)

(assert (=> d!10129 m!43591))

(assert (=> d!10129 m!43519))

(assert (=> d!10129 m!43589))

(assert (=> b!50209 m!43519))

(declare-fun m!43593 () Bool)

(assert (=> b!50209 m!43593))

(assert (=> b!50141 d!10129))

(declare-fun b!50210 () Bool)

(declare-fun e!32415 () Bool)

(declare-fun e!32413 () Bool)

(assert (=> b!50210 (= e!32415 e!32413)))

(declare-fun c!6786 () Bool)

(assert (=> b!50210 (= c!6786 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10131 () Bool)

(declare-fun res!28950 () Bool)

(assert (=> d!10131 (=> res!28950 e!32415)))

(assert (=> d!10131 (= res!28950 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10131 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3521 newMap!16) (mask!5697 newMap!16)) e!32415)))

(declare-fun b!50211 () Bool)

(declare-fun call!3885 () Bool)

(assert (=> b!50211 (= e!32413 call!3885)))

(declare-fun b!50212 () Bool)

(declare-fun e!32414 () Bool)

(assert (=> b!50212 (= e!32413 e!32414)))

(declare-fun lt!21043 () (_ BitVec 64))

(assert (=> b!50212 (= lt!21043 (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21045 () Unit!1417)

(assert (=> b!50212 (= lt!21045 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3521 newMap!16) lt!21043 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!50212 (arrayContainsKey!0 (_keys!3521 newMap!16) lt!21043 #b00000000000000000000000000000000)))

(declare-fun lt!21044 () Unit!1417)

(assert (=> b!50212 (= lt!21044 lt!21045)))

(declare-fun res!28949 () Bool)

(assert (=> b!50212 (= res!28949 (= (seekEntryOrOpen!0 (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3521 newMap!16) (mask!5697 newMap!16)) (Found!218 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!50212 (=> (not res!28949) (not e!32414))))

(declare-fun bm!3882 () Bool)

(assert (=> bm!3882 (= call!3885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3521 newMap!16) (mask!5697 newMap!16)))))

(declare-fun b!50213 () Bool)

(assert (=> b!50213 (= e!32414 call!3885)))

(assert (= (and d!10131 (not res!28950)) b!50210))

(assert (= (and b!50210 c!6786) b!50212))

(assert (= (and b!50210 (not c!6786)) b!50211))

(assert (= (and b!50212 res!28949) b!50213))

(assert (= (or b!50213 b!50211) bm!3882))

(assert (=> b!50210 m!43545))

(assert (=> b!50210 m!43545))

(assert (=> b!50210 m!43547))

(assert (=> b!50212 m!43545))

(declare-fun m!43595 () Bool)

(assert (=> b!50212 m!43595))

(declare-fun m!43597 () Bool)

(assert (=> b!50212 m!43597))

(assert (=> b!50212 m!43545))

(declare-fun m!43599 () Bool)

(assert (=> b!50212 m!43599))

(declare-fun m!43601 () Bool)

(assert (=> bm!3882 m!43601))

(assert (=> bm!3874 d!10131))

(assert (=> b!50116 d!10113))

(declare-fun d!10133 () Bool)

(assert (=> d!10133 (= (validMask!0 (mask!5697 newMap!16)) (and (or (= (mask!5697 newMap!16) #b00000000000000000000000000000111) (= (mask!5697 newMap!16) #b00000000000000000000000000001111) (= (mask!5697 newMap!16) #b00000000000000000000000000011111) (= (mask!5697 newMap!16) #b00000000000000000000000000111111) (= (mask!5697 newMap!16) #b00000000000000000000000001111111) (= (mask!5697 newMap!16) #b00000000000000000000000011111111) (= (mask!5697 newMap!16) #b00000000000000000000000111111111) (= (mask!5697 newMap!16) #b00000000000000000000001111111111) (= (mask!5697 newMap!16) #b00000000000000000000011111111111) (= (mask!5697 newMap!16) #b00000000000000000000111111111111) (= (mask!5697 newMap!16) #b00000000000000000001111111111111) (= (mask!5697 newMap!16) #b00000000000000000011111111111111) (= (mask!5697 newMap!16) #b00000000000000000111111111111111) (= (mask!5697 newMap!16) #b00000000000000001111111111111111) (= (mask!5697 newMap!16) #b00000000000000011111111111111111) (= (mask!5697 newMap!16) #b00000000000000111111111111111111) (= (mask!5697 newMap!16) #b00000000000001111111111111111111) (= (mask!5697 newMap!16) #b00000000000011111111111111111111) (= (mask!5697 newMap!16) #b00000000000111111111111111111111) (= (mask!5697 newMap!16) #b00000000001111111111111111111111) (= (mask!5697 newMap!16) #b00000000011111111111111111111111) (= (mask!5697 newMap!16) #b00000000111111111111111111111111) (= (mask!5697 newMap!16) #b00000001111111111111111111111111) (= (mask!5697 newMap!16) #b00000011111111111111111111111111) (= (mask!5697 newMap!16) #b00000111111111111111111111111111) (= (mask!5697 newMap!16) #b00001111111111111111111111111111) (= (mask!5697 newMap!16) #b00011111111111111111111111111111) (= (mask!5697 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5697 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10105 d!10133))

(declare-fun b!50214 () Bool)

(declare-fun res!28954 () Bool)

(declare-fun e!32416 () Bool)

(assert (=> b!50214 (=> (not res!28954) (not e!32416))))

(assert (=> b!50214 (= res!28954 (and (= (size!1788 (_values!1898 (v!2156 (underlying!125 thiss!992)))) (bvadd (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000001)) (= (size!1787 (_keys!3521 (v!2156 (underlying!125 thiss!992)))) (size!1788 (_values!1898 (v!2156 (underlying!125 thiss!992))))) (bvsge (_size!250 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!250 (v!2156 (underlying!125 thiss!992))) (bvadd (mask!5697 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!50215 () Bool)

(declare-fun res!28953 () Bool)

(assert (=> b!50215 (=> (not res!28953) (not e!32416))))

(assert (=> b!50215 (= res!28953 (bvsge (size!1791 (v!2156 (underlying!125 thiss!992))) (_size!250 (v!2156 (underlying!125 thiss!992)))))))

(declare-fun d!10135 () Bool)

(declare-fun res!28951 () Bool)

(assert (=> d!10135 (=> (not res!28951) (not e!32416))))

(assert (=> d!10135 (= res!28951 (validMask!0 (mask!5697 (v!2156 (underlying!125 thiss!992)))))))

(assert (=> d!10135 (= (simpleValid!33 (v!2156 (underlying!125 thiss!992))) e!32416)))

(declare-fun b!50217 () Bool)

(assert (=> b!50217 (= e!32416 (and (bvsge (extraKeys!1806 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1806 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!250 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!50216 () Bool)

(declare-fun res!28952 () Bool)

(assert (=> b!50216 (=> (not res!28952) (not e!32416))))

(assert (=> b!50216 (= res!28952 (= (size!1791 (v!2156 (underlying!125 thiss!992))) (bvadd (_size!250 (v!2156 (underlying!125 thiss!992))) (bvsdiv (bvadd (extraKeys!1806 (v!2156 (underlying!125 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!10135 res!28951) b!50214))

(assert (= (and b!50214 res!28954) b!50215))

(assert (= (and b!50215 res!28953) b!50216))

(assert (= (and b!50216 res!28952) b!50217))

(declare-fun m!43603 () Bool)

(assert (=> b!50215 m!43603))

(assert (=> d!10135 m!43467))

(assert (=> b!50216 m!43603))

(assert (=> d!10101 d!10135))

(assert (=> b!50153 d!10113))

(declare-fun d!10137 () Bool)

(declare-fun lt!21046 () (_ BitVec 32))

(assert (=> d!10137 (and (bvsge lt!21046 #b00000000000000000000000000000000) (bvsle lt!21046 (bvsub (size!1787 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!32417 () (_ BitVec 32))

(assert (=> d!10137 (= lt!21046 e!32417)))

(declare-fun c!6788 () Bool)

(assert (=> d!10137 (= c!6788 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10137 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1787 (_keys!3521 newMap!16)) (size!1787 (_keys!3521 newMap!16))))))

(assert (=> d!10137 (= (arrayCountValidKeys!0 (_keys!3521 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))) lt!21046)))

(declare-fun b!50218 () Bool)

(declare-fun e!32418 () (_ BitVec 32))

(declare-fun call!3886 () (_ BitVec 32))

(assert (=> b!50218 (= e!32418 call!3886)))

(declare-fun b!50219 () Bool)

(assert (=> b!50219 (= e!32417 e!32418)))

(declare-fun c!6787 () Bool)

(assert (=> b!50219 (= c!6787 (validKeyInArray!0 (select (arr!1565 (_keys!3521 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!50220 () Bool)

(assert (=> b!50220 (= e!32417 #b00000000000000000000000000000000)))

(declare-fun b!50221 () Bool)

(assert (=> b!50221 (= e!32418 (bvadd #b00000000000000000000000000000001 call!3886))))

(declare-fun bm!3883 () Bool)

(assert (=> bm!3883 (= call!3886 (arrayCountValidKeys!0 (_keys!3521 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1787 (_keys!3521 newMap!16))))))

(assert (= (and d!10137 c!6788) b!50220))

(assert (= (and d!10137 (not c!6788)) b!50219))

(assert (= (and b!50219 c!6787) b!50221))

(assert (= (and b!50219 (not c!6787)) b!50218))

(assert (= (or b!50221 b!50218) bm!3883))

(assert (=> b!50219 m!43545))

(assert (=> b!50219 m!43545))

(assert (=> b!50219 m!43547))

(declare-fun m!43605 () Bool)

(assert (=> bm!3883 m!43605))

(assert (=> bm!3871 d!10137))

(declare-fun b!50222 () Bool)

(declare-fun e!32419 () Bool)

(assert (=> b!50222 (= e!32419 tp_is_empty!2181)))

(declare-fun mapNonEmpty!2175 () Bool)

(declare-fun mapRes!2175 () Bool)

(declare-fun tp!6657 () Bool)

(assert (=> mapNonEmpty!2175 (= mapRes!2175 (and tp!6657 e!32419))))

(declare-fun mapKey!2175 () (_ BitVec 32))

(declare-fun mapRest!2175 () (Array (_ BitVec 32) ValueCell!747))

(declare-fun mapValue!2175 () ValueCell!747)

(assert (=> mapNonEmpty!2175 (= mapRest!2174 (store mapRest!2175 mapKey!2175 mapValue!2175))))

(declare-fun b!50223 () Bool)

(declare-fun e!32420 () Bool)

(assert (=> b!50223 (= e!32420 tp_is_empty!2181)))

(declare-fun mapIsEmpty!2175 () Bool)

(assert (=> mapIsEmpty!2175 mapRes!2175))

(declare-fun condMapEmpty!2175 () Bool)

(declare-fun mapDefault!2175 () ValueCell!747)

(assert (=> mapNonEmpty!2174 (= condMapEmpty!2175 (= mapRest!2174 ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2175)))))

(assert (=> mapNonEmpty!2174 (= tp!6656 (and e!32420 mapRes!2175))))

(assert (= (and mapNonEmpty!2174 condMapEmpty!2175) mapIsEmpty!2175))

(assert (= (and mapNonEmpty!2174 (not condMapEmpty!2175)) mapNonEmpty!2175))

(assert (= (and mapNonEmpty!2175 ((_ is ValueCellFull!747) mapValue!2175)) b!50222))

(assert (= (and mapNonEmpty!2174 ((_ is ValueCellFull!747) mapDefault!2175)) b!50223))

(declare-fun m!43607 () Bool)

(assert (=> mapNonEmpty!2175 m!43607))

(declare-fun b!50224 () Bool)

(declare-fun e!32421 () Bool)

(assert (=> b!50224 (= e!32421 tp_is_empty!2181)))

(declare-fun mapNonEmpty!2176 () Bool)

(declare-fun mapRes!2176 () Bool)

(declare-fun tp!6658 () Bool)

(assert (=> mapNonEmpty!2176 (= mapRes!2176 (and tp!6658 e!32421))))

(declare-fun mapRest!2176 () (Array (_ BitVec 32) ValueCell!747))

(declare-fun mapValue!2176 () ValueCell!747)

(declare-fun mapKey!2176 () (_ BitVec 32))

(assert (=> mapNonEmpty!2176 (= mapRest!2173 (store mapRest!2176 mapKey!2176 mapValue!2176))))

(declare-fun b!50225 () Bool)

(declare-fun e!32422 () Bool)

(assert (=> b!50225 (= e!32422 tp_is_empty!2181)))

(declare-fun mapIsEmpty!2176 () Bool)

(assert (=> mapIsEmpty!2176 mapRes!2176))

(declare-fun condMapEmpty!2176 () Bool)

(declare-fun mapDefault!2176 () ValueCell!747)

(assert (=> mapNonEmpty!2173 (= condMapEmpty!2176 (= mapRest!2173 ((as const (Array (_ BitVec 32) ValueCell!747)) mapDefault!2176)))))

(assert (=> mapNonEmpty!2173 (= tp!6655 (and e!32422 mapRes!2176))))

(assert (= (and mapNonEmpty!2173 condMapEmpty!2176) mapIsEmpty!2176))

(assert (= (and mapNonEmpty!2173 (not condMapEmpty!2176)) mapNonEmpty!2176))

(assert (= (and mapNonEmpty!2176 ((_ is ValueCellFull!747) mapValue!2176)) b!50224))

(assert (= (and mapNonEmpty!2173 ((_ is ValueCellFull!747) mapDefault!2176)) b!50225))

(declare-fun m!43609 () Bool)

(assert (=> mapNonEmpty!2176 m!43609))

(check-sat (not d!10135) b_and!2741 (not b!50191) (not b!50179) (not b!50174) (not b!50219) (not bm!3879) (not b!50209) (not b!50162) (not b!50184) (not b!50215) (not b!50172) (not bm!3882) (not bm!3881) tp_is_empty!2181 (not mapNonEmpty!2176) (not b!50164) (not b_next!1529) (not b!50210) (not b!50177) (not d!10125) (not bm!3880) (not b!50182) (not b!50163) b_and!2739 (not b!50178) (not d!10129) (not bm!3878) (not mapNonEmpty!2175) (not b_next!1531) (not bm!3883) (not b!50216) (not d!10115) (not b!50212))
(check-sat b_and!2739 b_and!2741 (not b_next!1529) (not b_next!1531))
