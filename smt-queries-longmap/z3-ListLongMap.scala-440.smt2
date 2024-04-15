; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8256 () Bool)

(assert start!8256)

(declare-fun b!52508 () Bool)

(declare-fun b_free!1669 () Bool)

(declare-fun b_next!1669 () Bool)

(assert (=> b!52508 (= b_free!1669 (not b_next!1669))))

(declare-fun tp!7108 () Bool)

(declare-fun b_and!2881 () Bool)

(assert (=> b!52508 (= tp!7108 b_and!2881)))

(declare-fun b!52495 () Bool)

(declare-fun b_free!1671 () Bool)

(declare-fun b_next!1671 () Bool)

(assert (=> b!52495 (= b_free!1671 (not b_next!1671))))

(declare-fun tp!7109 () Bool)

(declare-fun b_and!2883 () Bool)

(assert (=> b!52495 (= tp!7109 b_and!2883)))

(declare-fun b!52494 () Bool)

(declare-fun res!29835 () Bool)

(declare-fun e!34209 () Bool)

(assert (=> b!52494 (=> (not res!29835) (not e!34209))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2649 0))(
  ( (V!2650 (val!1170 Int)) )
))
(declare-datatypes ((array!3405 0))(
  ( (array!3406 (arr!1624 (Array (_ BitVec 32) (_ BitVec 64))) (size!1854 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!782 0))(
  ( (ValueCellFull!782 (v!2226 V!2649)) (EmptyCell!782) )
))
(declare-datatypes ((array!3407 0))(
  ( (array!3408 (arr!1625 (Array (_ BitVec 32) ValueCell!782)) (size!1855 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!472 0))(
  ( (LongMapFixedSize!473 (defaultEntry!1950 Int) (mask!5776 (_ BitVec 32)) (extraKeys!1841 (_ BitVec 32)) (zeroValue!1868 V!2649) (minValue!1868 V!2649) (_size!285 (_ BitVec 32)) (_keys!3569 array!3405) (_values!1933 array!3407) (_vacant!285 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!292 0))(
  ( (Cell!293 (v!2227 LongMapFixedSize!472)) )
))
(declare-datatypes ((LongMap!292 0))(
  ( (LongMap!293 (underlying!157 Cell!292)) )
))
(declare-fun thiss!992 () LongMap!292)

(assert (=> b!52494 (= res!29835 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1854 (_keys!3569 (v!2227 (underlying!157 thiss!992)))))))))

(declare-fun tp_is_empty!2251 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!472)

(declare-fun e!34208 () Bool)

(declare-fun e!34218 () Bool)

(declare-fun array_inv!991 (array!3405) Bool)

(declare-fun array_inv!992 (array!3407) Bool)

(assert (=> b!52495 (= e!34208 (and tp!7109 tp_is_empty!2251 (array_inv!991 (_keys!3569 newMap!16)) (array_inv!992 (_values!1933 newMap!16)) e!34218))))

(declare-fun b!52496 () Bool)

(declare-fun res!29834 () Bool)

(assert (=> b!52496 (=> (not res!29834) (not e!34209))))

(assert (=> b!52496 (= res!29834 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5776 newMap!16)) (_size!285 (v!2227 (underlying!157 thiss!992)))))))

(declare-fun b!52497 () Bool)

(declare-fun e!34213 () Bool)

(assert (=> b!52497 (= e!34213 tp_is_empty!2251)))

(declare-fun b!52498 () Bool)

(declare-fun e!34214 () Bool)

(declare-fun e!34219 () Bool)

(assert (=> b!52498 (= e!34214 e!34219)))

(declare-fun res!29839 () Bool)

(assert (=> b!52498 (=> (not res!29839) (not e!34219))))

(declare-datatypes ((tuple2!1854 0))(
  ( (tuple2!1855 (_1!938 (_ BitVec 64)) (_2!938 V!2649)) )
))
(declare-datatypes ((List!1337 0))(
  ( (Nil!1334) (Cons!1333 (h!1913 tuple2!1854) (t!4374 List!1337)) )
))
(declare-datatypes ((ListLongMap!1257 0))(
  ( (ListLongMap!1258 (toList!644 List!1337)) )
))
(declare-fun lt!21287 () ListLongMap!1257)

(declare-fun contains!621 (ListLongMap!1257 (_ BitVec 64)) Bool)

(assert (=> b!52498 (= res!29839 (contains!621 lt!21287 (select (arr!1624 (_keys!3569 (v!2227 (underlying!157 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1856 0))(
  ( (tuple2!1857 (_1!939 Bool) (_2!939 LongMapFixedSize!472)) )
))
(declare-fun lt!21289 () tuple2!1856)

(declare-fun update!43 (LongMapFixedSize!472 (_ BitVec 64) V!2649) tuple2!1856)

(declare-fun get!979 (ValueCell!782 V!2649) V!2649)

(declare-fun dynLambda!267 (Int (_ BitVec 64)) V!2649)

(assert (=> b!52498 (= lt!21289 (update!43 newMap!16 (select (arr!1624 (_keys!3569 (v!2227 (underlying!157 thiss!992)))) from!355) (get!979 (select (arr!1625 (_values!1933 (v!2227 (underlying!157 thiss!992)))) from!355) (dynLambda!267 (defaultEntry!1950 (v!2227 (underlying!157 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!52499 () Bool)

(declare-fun e!34216 () Bool)

(declare-fun e!34205 () Bool)

(assert (=> b!52499 (= e!34216 e!34205)))

(declare-fun b!52500 () Bool)

(declare-fun res!29831 () Bool)

(assert (=> b!52500 (=> (not res!29831) (not e!34219))))

(assert (=> b!52500 (= res!29831 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1854 (_keys!3569 (v!2227 (underlying!157 thiss!992)))))))))

(declare-fun b!52501 () Bool)

(assert (=> b!52501 (= e!34219 false)))

(declare-fun lt!21290 () Bool)

(declare-fun lt!21288 () ListLongMap!1257)

(assert (=> b!52501 (= lt!21290 (contains!621 lt!21288 (select (arr!1624 (_keys!3569 (v!2227 (underlying!157 thiss!992)))) from!355)))))

(declare-fun b!52502 () Bool)

(declare-fun res!29836 () Bool)

(assert (=> b!52502 (=> (not res!29836) (not e!34219))))

(declare-datatypes ((List!1338 0))(
  ( (Nil!1335) (Cons!1334 (h!1914 (_ BitVec 64)) (t!4375 List!1338)) )
))
(declare-fun arrayNoDuplicates!0 (array!3405 (_ BitVec 32) List!1338) Bool)

(assert (=> b!52502 (= res!29836 (arrayNoDuplicates!0 (_keys!3569 (v!2227 (underlying!157 thiss!992))) #b00000000000000000000000000000000 Nil!1335))))

(declare-fun res!29840 () Bool)

(assert (=> start!8256 (=> (not res!29840) (not e!34209))))

(declare-fun valid!179 (LongMap!292) Bool)

(assert (=> start!8256 (= res!29840 (valid!179 thiss!992))))

(assert (=> start!8256 e!34209))

(assert (=> start!8256 e!34216))

(assert (=> start!8256 true))

(assert (=> start!8256 e!34208))

(declare-fun mapNonEmpty!2423 () Bool)

(declare-fun mapRes!2424 () Bool)

(declare-fun tp!7110 () Bool)

(declare-fun e!34210 () Bool)

(assert (=> mapNonEmpty!2423 (= mapRes!2424 (and tp!7110 e!34210))))

(declare-fun mapValue!2424 () ValueCell!782)

(declare-fun mapRest!2424 () (Array (_ BitVec 32) ValueCell!782))

(declare-fun mapKey!2423 () (_ BitVec 32))

(assert (=> mapNonEmpty!2423 (= (arr!1625 (_values!1933 newMap!16)) (store mapRest!2424 mapKey!2423 mapValue!2424))))

(declare-fun b!52503 () Bool)

(declare-fun e!34217 () Bool)

(declare-fun mapRes!2423 () Bool)

(assert (=> b!52503 (= e!34217 (and e!34213 mapRes!2423))))

(declare-fun condMapEmpty!2424 () Bool)

(declare-fun mapDefault!2423 () ValueCell!782)

(assert (=> b!52503 (= condMapEmpty!2424 (= (arr!1625 (_values!1933 (v!2227 (underlying!157 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!782)) mapDefault!2423)))))

(declare-fun b!52504 () Bool)

(assert (=> b!52504 (= e!34209 e!34214)))

(declare-fun res!29841 () Bool)

(assert (=> b!52504 (=> (not res!29841) (not e!34214))))

(assert (=> b!52504 (= res!29841 (and (= lt!21288 lt!21287) (not (= (select (arr!1624 (_keys!3569 (v!2227 (underlying!157 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1624 (_keys!3569 (v!2227 (underlying!157 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1017 (LongMapFixedSize!472) ListLongMap!1257)

(assert (=> b!52504 (= lt!21287 (map!1017 newMap!16))))

(declare-fun getCurrentListMap!351 (array!3405 array!3407 (_ BitVec 32) (_ BitVec 32) V!2649 V!2649 (_ BitVec 32) Int) ListLongMap!1257)

(assert (=> b!52504 (= lt!21288 (getCurrentListMap!351 (_keys!3569 (v!2227 (underlying!157 thiss!992))) (_values!1933 (v!2227 (underlying!157 thiss!992))) (mask!5776 (v!2227 (underlying!157 thiss!992))) (extraKeys!1841 (v!2227 (underlying!157 thiss!992))) (zeroValue!1868 (v!2227 (underlying!157 thiss!992))) (minValue!1868 (v!2227 (underlying!157 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1950 (v!2227 (underlying!157 thiss!992)))))))

(declare-fun b!52505 () Bool)

(declare-fun e!34211 () Bool)

(assert (=> b!52505 (= e!34211 tp_is_empty!2251)))

(declare-fun mapNonEmpty!2424 () Bool)

(declare-fun tp!7107 () Bool)

(declare-fun e!34212 () Bool)

(assert (=> mapNonEmpty!2424 (= mapRes!2423 (and tp!7107 e!34212))))

(declare-fun mapRest!2423 () (Array (_ BitVec 32) ValueCell!782))

(declare-fun mapKey!2424 () (_ BitVec 32))

(declare-fun mapValue!2423 () ValueCell!782)

(assert (=> mapNonEmpty!2424 (= (arr!1625 (_values!1933 (v!2227 (underlying!157 thiss!992)))) (store mapRest!2423 mapKey!2424 mapValue!2423))))

(declare-fun b!52506 () Bool)

(assert (=> b!52506 (= e!34212 tp_is_empty!2251)))

(declare-fun b!52507 () Bool)

(declare-fun res!29833 () Bool)

(assert (=> b!52507 (=> (not res!29833) (not e!34209))))

(declare-fun valid!180 (LongMapFixedSize!472) Bool)

(assert (=> b!52507 (= res!29833 (valid!180 newMap!16))))

(declare-fun mapIsEmpty!2423 () Bool)

(assert (=> mapIsEmpty!2423 mapRes!2423))

(declare-fun e!34207 () Bool)

(assert (=> b!52508 (= e!34207 (and tp!7108 tp_is_empty!2251 (array_inv!991 (_keys!3569 (v!2227 (underlying!157 thiss!992)))) (array_inv!992 (_values!1933 (v!2227 (underlying!157 thiss!992)))) e!34217))))

(declare-fun b!52509 () Bool)

(declare-fun res!29837 () Bool)

(assert (=> b!52509 (=> (not res!29837) (not e!34219))))

(assert (=> b!52509 (= res!29837 (and (= (size!1855 (_values!1933 (v!2227 (underlying!157 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5776 (v!2227 (underlying!157 thiss!992))))) (= (size!1854 (_keys!3569 (v!2227 (underlying!157 thiss!992)))) (size!1855 (_values!1933 (v!2227 (underlying!157 thiss!992))))) (bvsge (mask!5776 (v!2227 (underlying!157 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1841 (v!2227 (underlying!157 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1841 (v!2227 (underlying!157 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!52510 () Bool)

(assert (=> b!52510 (= e!34205 e!34207)))

(declare-fun b!52511 () Bool)

(assert (=> b!52511 (= e!34210 tp_is_empty!2251)))

(declare-fun b!52512 () Bool)

(declare-fun res!29832 () Bool)

(assert (=> b!52512 (=> (not res!29832) (not e!34219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3405 (_ BitVec 32)) Bool)

(assert (=> b!52512 (= res!29832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3569 (v!2227 (underlying!157 thiss!992))) (mask!5776 (v!2227 (underlying!157 thiss!992)))))))

(declare-fun b!52513 () Bool)

(assert (=> b!52513 (= e!34218 (and e!34211 mapRes!2424))))

(declare-fun condMapEmpty!2423 () Bool)

(declare-fun mapDefault!2424 () ValueCell!782)

(assert (=> b!52513 (= condMapEmpty!2423 (= (arr!1625 (_values!1933 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!782)) mapDefault!2424)))))

(declare-fun mapIsEmpty!2424 () Bool)

(assert (=> mapIsEmpty!2424 mapRes!2424))

(declare-fun b!52514 () Bool)

(declare-fun res!29838 () Bool)

(assert (=> b!52514 (=> (not res!29838) (not e!34219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52514 (= res!29838 (validMask!0 (mask!5776 (v!2227 (underlying!157 thiss!992)))))))

(assert (= (and start!8256 res!29840) b!52494))

(assert (= (and b!52494 res!29835) b!52507))

(assert (= (and b!52507 res!29833) b!52496))

(assert (= (and b!52496 res!29834) b!52504))

(assert (= (and b!52504 res!29841) b!52498))

(assert (= (and b!52498 res!29839) b!52514))

(assert (= (and b!52514 res!29838) b!52509))

(assert (= (and b!52509 res!29837) b!52512))

(assert (= (and b!52512 res!29832) b!52502))

(assert (= (and b!52502 res!29836) b!52500))

(assert (= (and b!52500 res!29831) b!52501))

(assert (= (and b!52503 condMapEmpty!2424) mapIsEmpty!2423))

(assert (= (and b!52503 (not condMapEmpty!2424)) mapNonEmpty!2424))

(get-info :version)

(assert (= (and mapNonEmpty!2424 ((_ is ValueCellFull!782) mapValue!2423)) b!52506))

(assert (= (and b!52503 ((_ is ValueCellFull!782) mapDefault!2423)) b!52497))

(assert (= b!52508 b!52503))

(assert (= b!52510 b!52508))

(assert (= b!52499 b!52510))

(assert (= start!8256 b!52499))

(assert (= (and b!52513 condMapEmpty!2423) mapIsEmpty!2424))

(assert (= (and b!52513 (not condMapEmpty!2423)) mapNonEmpty!2423))

(assert (= (and mapNonEmpty!2423 ((_ is ValueCellFull!782) mapValue!2424)) b!52511))

(assert (= (and b!52513 ((_ is ValueCellFull!782) mapDefault!2424)) b!52505))

(assert (= b!52495 b!52513))

(assert (= start!8256 b!52495))

(declare-fun b_lambda!2349 () Bool)

(assert (=> (not b_lambda!2349) (not b!52498)))

(declare-fun t!4371 () Bool)

(declare-fun tb!1013 () Bool)

(assert (=> (and b!52508 (= (defaultEntry!1950 (v!2227 (underlying!157 thiss!992))) (defaultEntry!1950 (v!2227 (underlying!157 thiss!992)))) t!4371) tb!1013))

(declare-fun result!1917 () Bool)

(assert (=> tb!1013 (= result!1917 tp_is_empty!2251)))

(assert (=> b!52498 t!4371))

(declare-fun b_and!2885 () Bool)

(assert (= b_and!2881 (and (=> t!4371 result!1917) b_and!2885)))

(declare-fun t!4373 () Bool)

(declare-fun tb!1015 () Bool)

(assert (=> (and b!52495 (= (defaultEntry!1950 newMap!16) (defaultEntry!1950 (v!2227 (underlying!157 thiss!992)))) t!4373) tb!1015))

(declare-fun result!1921 () Bool)

(assert (= result!1921 result!1917))

(assert (=> b!52498 t!4373))

(declare-fun b_and!2887 () Bool)

(assert (= b_and!2883 (and (=> t!4373 result!1921) b_and!2887)))

(declare-fun m!44803 () Bool)

(assert (=> mapNonEmpty!2424 m!44803))

(declare-fun m!44805 () Bool)

(assert (=> b!52504 m!44805))

(declare-fun m!44807 () Bool)

(assert (=> b!52504 m!44807))

(declare-fun m!44809 () Bool)

(assert (=> b!52504 m!44809))

(declare-fun m!44811 () Bool)

(assert (=> start!8256 m!44811))

(declare-fun m!44813 () Bool)

(assert (=> b!52514 m!44813))

(declare-fun m!44815 () Bool)

(assert (=> b!52502 m!44815))

(declare-fun m!44817 () Bool)

(assert (=> mapNonEmpty!2423 m!44817))

(assert (=> b!52501 m!44805))

(assert (=> b!52501 m!44805))

(declare-fun m!44819 () Bool)

(assert (=> b!52501 m!44819))

(declare-fun m!44821 () Bool)

(assert (=> b!52507 m!44821))

(declare-fun m!44823 () Bool)

(assert (=> b!52508 m!44823))

(declare-fun m!44825 () Bool)

(assert (=> b!52508 m!44825))

(assert (=> b!52498 m!44805))

(declare-fun m!44827 () Bool)

(assert (=> b!52498 m!44827))

(declare-fun m!44829 () Bool)

(assert (=> b!52498 m!44829))

(declare-fun m!44831 () Bool)

(assert (=> b!52498 m!44831))

(declare-fun m!44833 () Bool)

(assert (=> b!52498 m!44833))

(assert (=> b!52498 m!44805))

(assert (=> b!52498 m!44831))

(assert (=> b!52498 m!44805))

(assert (=> b!52498 m!44833))

(declare-fun m!44835 () Bool)

(assert (=> b!52498 m!44835))

(assert (=> b!52498 m!44829))

(declare-fun m!44837 () Bool)

(assert (=> b!52512 m!44837))

(declare-fun m!44839 () Bool)

(assert (=> b!52495 m!44839))

(declare-fun m!44841 () Bool)

(assert (=> b!52495 m!44841))

(check-sat (not b!52512) (not b_lambda!2349) (not b!52504) (not b!52495) (not mapNonEmpty!2423) (not b!52514) (not b!52502) (not mapNonEmpty!2424) b_and!2885 (not b!52501) tp_is_empty!2251 (not start!8256) (not b_next!1669) (not b!52498) (not b!52508) b_and!2887 (not b_next!1671) (not b!52507))
(check-sat b_and!2885 b_and!2887 (not b_next!1669) (not b_next!1671))
