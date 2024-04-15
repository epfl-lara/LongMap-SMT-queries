; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16126 () Bool)

(assert start!16126)

(declare-fun b!160276 () Bool)

(declare-fun b_free!3583 () Bool)

(declare-fun b_next!3583 () Bool)

(assert (=> b!160276 (= b_free!3583 (not b_next!3583))))

(declare-fun tp!13318 () Bool)

(declare-fun b_and!9971 () Bool)

(assert (=> b!160276 (= tp!13318 b_and!9971)))

(declare-fun mapNonEmpty!5765 () Bool)

(declare-fun mapRes!5765 () Bool)

(declare-fun tp!13319 () Bool)

(declare-fun e!104795 () Bool)

(assert (=> mapNonEmpty!5765 (= mapRes!5765 (and tp!13319 e!104795))))

(declare-datatypes ((V!4161 0))(
  ( (V!4162 (val!1737 Int)) )
))
(declare-datatypes ((ValueCell!1349 0))(
  ( (ValueCellFull!1349 (v!3596 V!4161)) (EmptyCell!1349) )
))
(declare-fun mapRest!5765 () (Array (_ BitVec 32) ValueCell!1349))

(declare-fun mapKey!5765 () (_ BitVec 32))

(declare-datatypes ((array!5829 0))(
  ( (array!5830 (arr!2758 (Array (_ BitVec 32) (_ BitVec 64))) (size!3043 (_ BitVec 32))) )
))
(declare-datatypes ((array!5831 0))(
  ( (array!5832 (arr!2759 (Array (_ BitVec 32) ValueCell!1349)) (size!3044 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1606 0))(
  ( (LongMapFixedSize!1607 (defaultEntry!3245 Int) (mask!7814 (_ BitVec 32)) (extraKeys!2986 (_ BitVec 32)) (zeroValue!3088 V!4161) (minValue!3088 V!4161) (_size!852 (_ BitVec 32)) (_keys!5045 array!5829) (_values!3228 array!5831) (_vacant!852 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1606)

(declare-fun mapValue!5765 () ValueCell!1349)

(assert (=> mapNonEmpty!5765 (= (arr!2759 (_values!3228 thiss!1248)) (store mapRest!5765 mapKey!5765 mapValue!5765))))

(declare-fun b!160272 () Bool)

(declare-fun e!104797 () Bool)

(declare-fun e!104794 () Bool)

(assert (=> b!160272 (= e!104797 (and e!104794 mapRes!5765))))

(declare-fun condMapEmpty!5765 () Bool)

(declare-fun mapDefault!5765 () ValueCell!1349)

(assert (=> b!160272 (= condMapEmpty!5765 (= (arr!2759 (_values!3228 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1349)) mapDefault!5765)))))

(declare-fun b!160273 () Bool)

(declare-fun res!75863 () Bool)

(declare-fun e!104793 () Bool)

(assert (=> b!160273 (=> (not res!75863) (not e!104793))))

(assert (=> b!160273 (= res!75863 (and (= (size!3044 (_values!3228 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7814 thiss!1248))) (= (size!3043 (_keys!5045 thiss!1248)) (size!3044 (_values!3228 thiss!1248))) (bvsge (mask!7814 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2986 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2986 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160274 () Bool)

(declare-fun res!75860 () Bool)

(assert (=> b!160274 (=> (not res!75860) (not e!104793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160274 (= res!75860 (validMask!0 (mask!7814 thiss!1248)))))

(declare-fun b!160275 () Bool)

(declare-fun res!75861 () Bool)

(assert (=> b!160275 (=> (not res!75861) (not e!104793))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2888 0))(
  ( (tuple2!2889 (_1!1455 (_ BitVec 64)) (_2!1455 V!4161)) )
))
(declare-datatypes ((List!1939 0))(
  ( (Nil!1936) (Cons!1935 (h!2548 tuple2!2888) (t!6732 List!1939)) )
))
(declare-datatypes ((ListLongMap!1875 0))(
  ( (ListLongMap!1876 (toList!953 List!1939)) )
))
(declare-fun contains!992 (ListLongMap!1875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!603 (array!5829 array!5831 (_ BitVec 32) (_ BitVec 32) V!4161 V!4161 (_ BitVec 32) Int) ListLongMap!1875)

(assert (=> b!160275 (= res!75861 (not (contains!992 (getCurrentListMap!603 (_keys!5045 thiss!1248) (_values!3228 thiss!1248) (mask!7814 thiss!1248) (extraKeys!2986 thiss!1248) (zeroValue!3088 thiss!1248) (minValue!3088 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3245 thiss!1248)) key!828)))))

(declare-fun e!104796 () Bool)

(declare-fun tp_is_empty!3385 () Bool)

(declare-fun array_inv!1769 (array!5829) Bool)

(declare-fun array_inv!1770 (array!5831) Bool)

(assert (=> b!160276 (= e!104796 (and tp!13318 tp_is_empty!3385 (array_inv!1769 (_keys!5045 thiss!1248)) (array_inv!1770 (_values!3228 thiss!1248)) e!104797))))

(declare-fun b!160277 () Bool)

(declare-fun res!75858 () Bool)

(assert (=> b!160277 (=> (not res!75858) (not e!104793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5829 (_ BitVec 32)) Bool)

(assert (=> b!160277 (= res!75858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5045 thiss!1248) (mask!7814 thiss!1248)))))

(declare-fun b!160278 () Bool)

(assert (=> b!160278 (= e!104793 false)))

(declare-fun lt!81906 () Bool)

(declare-datatypes ((List!1940 0))(
  ( (Nil!1937) (Cons!1936 (h!2549 (_ BitVec 64)) (t!6733 List!1940)) )
))
(declare-fun arrayNoDuplicates!0 (array!5829 (_ BitVec 32) List!1940) Bool)

(assert (=> b!160278 (= lt!81906 (arrayNoDuplicates!0 (_keys!5045 thiss!1248) #b00000000000000000000000000000000 Nil!1937))))

(declare-fun b!160279 () Bool)

(declare-fun res!75859 () Bool)

(assert (=> b!160279 (=> (not res!75859) (not e!104793))))

(assert (=> b!160279 (= res!75859 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160280 () Bool)

(declare-fun res!75864 () Bool)

(assert (=> b!160280 (=> (not res!75864) (not e!104793))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!337 0))(
  ( (MissingZero!337 (index!3516 (_ BitVec 32))) (Found!337 (index!3517 (_ BitVec 32))) (Intermediate!337 (undefined!1149 Bool) (index!3518 (_ BitVec 32)) (x!17712 (_ BitVec 32))) (Undefined!337) (MissingVacant!337 (index!3519 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5829 (_ BitVec 32)) SeekEntryResult!337)

(assert (=> b!160280 (= res!75864 ((_ is Undefined!337) (seekEntryOrOpen!0 key!828 (_keys!5045 thiss!1248) (mask!7814 thiss!1248))))))

(declare-fun b!160281 () Bool)

(assert (=> b!160281 (= e!104795 tp_is_empty!3385)))

(declare-fun b!160282 () Bool)

(assert (=> b!160282 (= e!104794 tp_is_empty!3385)))

(declare-fun res!75862 () Bool)

(assert (=> start!16126 (=> (not res!75862) (not e!104793))))

(declare-fun valid!744 (LongMapFixedSize!1606) Bool)

(assert (=> start!16126 (= res!75862 (valid!744 thiss!1248))))

(assert (=> start!16126 e!104793))

(assert (=> start!16126 e!104796))

(assert (=> start!16126 true))

(declare-fun mapIsEmpty!5765 () Bool)

(assert (=> mapIsEmpty!5765 mapRes!5765))

(assert (= (and start!16126 res!75862) b!160279))

(assert (= (and b!160279 res!75859) b!160280))

(assert (= (and b!160280 res!75864) b!160275))

(assert (= (and b!160275 res!75861) b!160274))

(assert (= (and b!160274 res!75860) b!160273))

(assert (= (and b!160273 res!75863) b!160277))

(assert (= (and b!160277 res!75858) b!160278))

(assert (= (and b!160272 condMapEmpty!5765) mapIsEmpty!5765))

(assert (= (and b!160272 (not condMapEmpty!5765)) mapNonEmpty!5765))

(assert (= (and mapNonEmpty!5765 ((_ is ValueCellFull!1349) mapValue!5765)) b!160281))

(assert (= (and b!160272 ((_ is ValueCellFull!1349) mapDefault!5765)) b!160282))

(assert (= b!160276 b!160272))

(assert (= start!16126 b!160276))

(declare-fun m!191677 () Bool)

(assert (=> b!160276 m!191677))

(declare-fun m!191679 () Bool)

(assert (=> b!160276 m!191679))

(declare-fun m!191681 () Bool)

(assert (=> b!160280 m!191681))

(declare-fun m!191683 () Bool)

(assert (=> b!160278 m!191683))

(declare-fun m!191685 () Bool)

(assert (=> b!160277 m!191685))

(declare-fun m!191687 () Bool)

(assert (=> b!160274 m!191687))

(declare-fun m!191689 () Bool)

(assert (=> start!16126 m!191689))

(declare-fun m!191691 () Bool)

(assert (=> mapNonEmpty!5765 m!191691))

(declare-fun m!191693 () Bool)

(assert (=> b!160275 m!191693))

(assert (=> b!160275 m!191693))

(declare-fun m!191695 () Bool)

(assert (=> b!160275 m!191695))

(check-sat b_and!9971 (not mapNonEmpty!5765) (not b!160275) (not b!160274) (not b_next!3583) (not start!16126) (not b!160278) (not b!160280) (not b!160276) (not b!160277) tp_is_empty!3385)
(check-sat b_and!9971 (not b_next!3583))
