; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79920 () Bool)

(assert start!79920)

(declare-fun b!939634 () Bool)

(declare-fun b_free!17803 () Bool)

(declare-fun b_next!17803 () Bool)

(assert (=> b!939634 (= b_free!17803 (not b_next!17803))))

(declare-fun tp!61882 () Bool)

(declare-fun b_and!29189 () Bool)

(assert (=> b!939634 (= tp!61882 b_and!29189)))

(declare-fun b!939628 () Bool)

(declare-fun e!527857 () Bool)

(declare-fun tp_is_empty!20311 () Bool)

(assert (=> b!939628 (= e!527857 tp_is_empty!20311)))

(declare-fun mapNonEmpty!32254 () Bool)

(declare-fun mapRes!32254 () Bool)

(declare-fun tp!61881 () Bool)

(declare-fun e!527854 () Bool)

(assert (=> mapNonEmpty!32254 (= mapRes!32254 (and tp!61881 e!527854))))

(declare-datatypes ((V!32047 0))(
  ( (V!32048 (val!10206 Int)) )
))
(declare-datatypes ((ValueCell!9674 0))(
  ( (ValueCellFull!9674 (v!12736 V!32047)) (EmptyCell!9674) )
))
(declare-fun mapRest!32254 () (Array (_ BitVec 32) ValueCell!9674))

(declare-datatypes ((array!56533 0))(
  ( (array!56534 (arr!27203 (Array (_ BitVec 32) ValueCell!9674)) (size!27666 (_ BitVec 32))) )
))
(declare-datatypes ((array!56535 0))(
  ( (array!56536 (arr!27204 (Array (_ BitVec 32) (_ BitVec 64))) (size!27667 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4498 0))(
  ( (LongMapFixedSize!4499 (defaultEntry!5540 Int) (mask!27057 (_ BitVec 32)) (extraKeys!5272 (_ BitVec 32)) (zeroValue!5376 V!32047) (minValue!5376 V!32047) (_size!2304 (_ BitVec 32)) (_keys!10385 array!56535) (_values!5563 array!56533) (_vacant!2304 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4498)

(declare-fun mapValue!32254 () ValueCell!9674)

(declare-fun mapKey!32254 () (_ BitVec 32))

(assert (=> mapNonEmpty!32254 (= (arr!27203 (_values!5563 thiss!1141)) (store mapRest!32254 mapKey!32254 mapValue!32254))))

(declare-fun b!939629 () Bool)

(declare-fun res!631964 () Bool)

(declare-fun e!527855 () Bool)

(assert (=> b!939629 (=> (not res!631964) (not e!527855))))

(assert (=> b!939629 (= res!631964 (= (size!27667 (_keys!10385 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27057 thiss!1141))))))

(declare-fun b!939630 () Bool)

(declare-fun e!527859 () Bool)

(assert (=> b!939630 (= e!527859 (and e!527857 mapRes!32254))))

(declare-fun condMapEmpty!32254 () Bool)

(declare-fun mapDefault!32254 () ValueCell!9674)

(assert (=> b!939630 (= condMapEmpty!32254 (= (arr!27203 (_values!5563 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9674)) mapDefault!32254)))))

(declare-fun b!939631 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!939631 (= e!527855 (not (validKeyInArray!0 key!756)))))

(declare-fun mapIsEmpty!32254 () Bool)

(assert (=> mapIsEmpty!32254 mapRes!32254))

(declare-fun res!631963 () Bool)

(assert (=> start!79920 (=> (not res!631963) (not e!527855))))

(declare-fun valid!1736 (LongMapFixedSize!4498) Bool)

(assert (=> start!79920 (= res!631963 (valid!1736 thiss!1141))))

(assert (=> start!79920 e!527855))

(declare-fun e!527856 () Bool)

(assert (=> start!79920 e!527856))

(assert (=> start!79920 true))

(declare-fun b!939632 () Bool)

(assert (=> b!939632 (= e!527854 tp_is_empty!20311)))

(declare-fun b!939633 () Bool)

(declare-fun res!631962 () Bool)

(assert (=> b!939633 (=> (not res!631962) (not e!527855))))

(assert (=> b!939633 (= res!631962 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun array_inv!21222 (array!56535) Bool)

(declare-fun array_inv!21223 (array!56533) Bool)

(assert (=> b!939634 (= e!527856 (and tp!61882 tp_is_empty!20311 (array_inv!21222 (_keys!10385 thiss!1141)) (array_inv!21223 (_values!5563 thiss!1141)) e!527859))))

(declare-fun b!939635 () Bool)

(declare-fun res!631961 () Bool)

(assert (=> b!939635 (=> (not res!631961) (not e!527855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939635 (= res!631961 (validMask!0 (mask!27057 thiss!1141)))))

(assert (= (and start!79920 res!631963) b!939633))

(assert (= (and b!939633 res!631962) b!939635))

(assert (= (and b!939635 res!631961) b!939629))

(assert (= (and b!939629 res!631964) b!939631))

(assert (= (and b!939630 condMapEmpty!32254) mapIsEmpty!32254))

(assert (= (and b!939630 (not condMapEmpty!32254)) mapNonEmpty!32254))

(get-info :version)

(assert (= (and mapNonEmpty!32254 ((_ is ValueCellFull!9674) mapValue!32254)) b!939632))

(assert (= (and b!939630 ((_ is ValueCellFull!9674) mapDefault!32254)) b!939628))

(assert (= b!939634 b!939630))

(assert (= start!79920 b!939634))

(declare-fun m!874789 () Bool)

(assert (=> start!79920 m!874789))

(declare-fun m!874791 () Bool)

(assert (=> b!939631 m!874791))

(declare-fun m!874793 () Bool)

(assert (=> b!939635 m!874793))

(declare-fun m!874795 () Bool)

(assert (=> mapNonEmpty!32254 m!874795))

(declare-fun m!874797 () Bool)

(assert (=> b!939634 m!874797))

(declare-fun m!874799 () Bool)

(assert (=> b!939634 m!874799))

(check-sat tp_is_empty!20311 (not b_next!17803) (not start!79920) b_and!29189 (not mapNonEmpty!32254) (not b!939631) (not b!939634) (not b!939635))
(check-sat b_and!29189 (not b_next!17803))
(get-model)

(declare-fun d!113791 () Bool)

(declare-fun res!631995 () Bool)

(declare-fun e!527898 () Bool)

(assert (=> d!113791 (=> (not res!631995) (not e!527898))))

(declare-fun simpleValid!338 (LongMapFixedSize!4498) Bool)

(assert (=> d!113791 (= res!631995 (simpleValid!338 thiss!1141))))

(assert (=> d!113791 (= (valid!1736 thiss!1141) e!527898)))

(declare-fun b!939690 () Bool)

(declare-fun res!631996 () Bool)

(assert (=> b!939690 (=> (not res!631996) (not e!527898))))

(declare-fun arrayCountValidKeys!0 (array!56535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!939690 (= res!631996 (= (arrayCountValidKeys!0 (_keys!10385 thiss!1141) #b00000000000000000000000000000000 (size!27667 (_keys!10385 thiss!1141))) (_size!2304 thiss!1141)))))

(declare-fun b!939691 () Bool)

(declare-fun res!631997 () Bool)

(assert (=> b!939691 (=> (not res!631997) (not e!527898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56535 (_ BitVec 32)) Bool)

(assert (=> b!939691 (= res!631997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10385 thiss!1141) (mask!27057 thiss!1141)))))

(declare-fun b!939692 () Bool)

(declare-datatypes ((List!19196 0))(
  ( (Nil!19193) (Cons!19192 (h!20338 (_ BitVec 64)) (t!27502 List!19196)) )
))
(declare-fun arrayNoDuplicates!0 (array!56535 (_ BitVec 32) List!19196) Bool)

(assert (=> b!939692 (= e!527898 (arrayNoDuplicates!0 (_keys!10385 thiss!1141) #b00000000000000000000000000000000 Nil!19193))))

(assert (= (and d!113791 res!631995) b!939690))

(assert (= (and b!939690 res!631996) b!939691))

(assert (= (and b!939691 res!631997) b!939692))

(declare-fun m!874825 () Bool)

(assert (=> d!113791 m!874825))

(declare-fun m!874827 () Bool)

(assert (=> b!939690 m!874827))

(declare-fun m!874829 () Bool)

(assert (=> b!939691 m!874829))

(declare-fun m!874831 () Bool)

(assert (=> b!939692 m!874831))

(assert (=> start!79920 d!113791))

(declare-fun d!113793 () Bool)

(assert (=> d!113793 (= (array_inv!21222 (_keys!10385 thiss!1141)) (bvsge (size!27667 (_keys!10385 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939634 d!113793))

(declare-fun d!113795 () Bool)

(assert (=> d!113795 (= (array_inv!21223 (_values!5563 thiss!1141)) (bvsge (size!27666 (_values!5563 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!939634 d!113795))

(declare-fun d!113797 () Bool)

(assert (=> d!113797 (= (validMask!0 (mask!27057 thiss!1141)) (and (or (= (mask!27057 thiss!1141) #b00000000000000000000000000000111) (= (mask!27057 thiss!1141) #b00000000000000000000000000001111) (= (mask!27057 thiss!1141) #b00000000000000000000000000011111) (= (mask!27057 thiss!1141) #b00000000000000000000000000111111) (= (mask!27057 thiss!1141) #b00000000000000000000000001111111) (= (mask!27057 thiss!1141) #b00000000000000000000000011111111) (= (mask!27057 thiss!1141) #b00000000000000000000000111111111) (= (mask!27057 thiss!1141) #b00000000000000000000001111111111) (= (mask!27057 thiss!1141) #b00000000000000000000011111111111) (= (mask!27057 thiss!1141) #b00000000000000000000111111111111) (= (mask!27057 thiss!1141) #b00000000000000000001111111111111) (= (mask!27057 thiss!1141) #b00000000000000000011111111111111) (= (mask!27057 thiss!1141) #b00000000000000000111111111111111) (= (mask!27057 thiss!1141) #b00000000000000001111111111111111) (= (mask!27057 thiss!1141) #b00000000000000011111111111111111) (= (mask!27057 thiss!1141) #b00000000000000111111111111111111) (= (mask!27057 thiss!1141) #b00000000000001111111111111111111) (= (mask!27057 thiss!1141) #b00000000000011111111111111111111) (= (mask!27057 thiss!1141) #b00000000000111111111111111111111) (= (mask!27057 thiss!1141) #b00000000001111111111111111111111) (= (mask!27057 thiss!1141) #b00000000011111111111111111111111) (= (mask!27057 thiss!1141) #b00000000111111111111111111111111) (= (mask!27057 thiss!1141) #b00000001111111111111111111111111) (= (mask!27057 thiss!1141) #b00000011111111111111111111111111) (= (mask!27057 thiss!1141) #b00000111111111111111111111111111) (= (mask!27057 thiss!1141) #b00001111111111111111111111111111) (= (mask!27057 thiss!1141) #b00011111111111111111111111111111) (= (mask!27057 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27057 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!939635 d!113797))

(declare-fun d!113799 () Bool)

(assert (=> d!113799 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!939631 d!113799))

(declare-fun mapIsEmpty!32263 () Bool)

(declare-fun mapRes!32263 () Bool)

(assert (=> mapIsEmpty!32263 mapRes!32263))

(declare-fun mapNonEmpty!32263 () Bool)

(declare-fun tp!61897 () Bool)

(declare-fun e!527903 () Bool)

(assert (=> mapNonEmpty!32263 (= mapRes!32263 (and tp!61897 e!527903))))

(declare-fun mapKey!32263 () (_ BitVec 32))

(declare-fun mapValue!32263 () ValueCell!9674)

(declare-fun mapRest!32263 () (Array (_ BitVec 32) ValueCell!9674))

(assert (=> mapNonEmpty!32263 (= mapRest!32254 (store mapRest!32263 mapKey!32263 mapValue!32263))))

(declare-fun condMapEmpty!32263 () Bool)

(declare-fun mapDefault!32263 () ValueCell!9674)

(assert (=> mapNonEmpty!32254 (= condMapEmpty!32263 (= mapRest!32254 ((as const (Array (_ BitVec 32) ValueCell!9674)) mapDefault!32263)))))

(declare-fun e!527904 () Bool)

(assert (=> mapNonEmpty!32254 (= tp!61881 (and e!527904 mapRes!32263))))

(declare-fun b!939700 () Bool)

(assert (=> b!939700 (= e!527904 tp_is_empty!20311)))

(declare-fun b!939699 () Bool)

(assert (=> b!939699 (= e!527903 tp_is_empty!20311)))

(assert (= (and mapNonEmpty!32254 condMapEmpty!32263) mapIsEmpty!32263))

(assert (= (and mapNonEmpty!32254 (not condMapEmpty!32263)) mapNonEmpty!32263))

(assert (= (and mapNonEmpty!32263 ((_ is ValueCellFull!9674) mapValue!32263)) b!939699))

(assert (= (and mapNonEmpty!32254 ((_ is ValueCellFull!9674) mapDefault!32263)) b!939700))

(declare-fun m!874833 () Bool)

(assert (=> mapNonEmpty!32263 m!874833))

(check-sat tp_is_empty!20311 (not d!113791) (not b!939690) (not mapNonEmpty!32263) b_and!29189 (not b!939692) (not b_next!17803) (not b!939691))
(check-sat b_and!29189 (not b_next!17803))
