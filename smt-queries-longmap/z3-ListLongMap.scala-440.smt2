; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8256 () Bool)

(assert start!8256)

(declare-fun b!52506 () Bool)

(declare-fun b_free!1669 () Bool)

(declare-fun b_next!1669 () Bool)

(assert (=> b!52506 (= b_free!1669 (not b_next!1669))))

(declare-fun tp!7107 () Bool)

(declare-fun b_and!2877 () Bool)

(assert (=> b!52506 (= tp!7107 b_and!2877)))

(declare-fun b!52522 () Bool)

(declare-fun b_free!1671 () Bool)

(declare-fun b_next!1671 () Bool)

(assert (=> b!52522 (= b_free!1671 (not b_next!1671))))

(declare-fun tp!7109 () Bool)

(declare-fun b_and!2879 () Bool)

(assert (=> b!52522 (= tp!7109 b_and!2879)))

(declare-fun b!52503 () Bool)

(declare-fun e!34216 () Bool)

(declare-fun e!34218 () Bool)

(assert (=> b!52503 (= e!34216 e!34218)))

(declare-fun res!29834 () Bool)

(assert (=> b!52503 (=> (not res!29834) (not e!34218))))

(declare-datatypes ((V!2649 0))(
  ( (V!2650 (val!1170 Int)) )
))
(declare-datatypes ((array!3411 0))(
  ( (array!3412 (arr!1628 (Array (_ BitVec 32) (_ BitVec 64))) (size!1857 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!782 0))(
  ( (ValueCellFull!782 (v!2229 V!2649)) (EmptyCell!782) )
))
(declare-datatypes ((array!3413 0))(
  ( (array!3414 (arr!1629 (Array (_ BitVec 32) ValueCell!782)) (size!1858 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!472 0))(
  ( (LongMapFixedSize!473 (defaultEntry!1950 Int) (mask!5777 (_ BitVec 32)) (extraKeys!1841 (_ BitVec 32)) (zeroValue!1868 V!2649) (minValue!1868 V!2649) (_size!285 (_ BitVec 32)) (_keys!3570 array!3411) (_values!1933 array!3413) (_vacant!285 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!292 0))(
  ( (Cell!293 (v!2230 LongMapFixedSize!472)) )
))
(declare-datatypes ((LongMap!292 0))(
  ( (LongMap!293 (underlying!157 Cell!292)) )
))
(declare-fun thiss!992 () LongMap!292)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1832 0))(
  ( (tuple2!1833 (_1!927 (_ BitVec 64)) (_2!927 V!2649)) )
))
(declare-datatypes ((List!1325 0))(
  ( (Nil!1322) (Cons!1321 (h!1901 tuple2!1832) (t!4363 List!1325)) )
))
(declare-datatypes ((ListLongMap!1241 0))(
  ( (ListLongMap!1242 (toList!636 List!1325)) )
))
(declare-fun lt!21262 () ListLongMap!1241)

(declare-fun contains!616 (ListLongMap!1241 (_ BitVec 64)) Bool)

(assert (=> b!52503 (= res!29834 (contains!616 lt!21262 (select (arr!1628 (_keys!3570 (v!2230 (underlying!157 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!472)

(declare-datatypes ((tuple2!1834 0))(
  ( (tuple2!1835 (_1!928 Bool) (_2!928 LongMapFixedSize!472)) )
))
(declare-fun lt!21260 () tuple2!1834)

(declare-fun update!46 (LongMapFixedSize!472 (_ BitVec 64) V!2649) tuple2!1834)

(declare-fun get!979 (ValueCell!782 V!2649) V!2649)

(declare-fun dynLambda!264 (Int (_ BitVec 64)) V!2649)

(assert (=> b!52503 (= lt!21260 (update!46 newMap!16 (select (arr!1628 (_keys!3570 (v!2230 (underlying!157 thiss!992)))) from!355) (get!979 (select (arr!1629 (_values!1933 (v!2230 (underlying!157 thiss!992)))) from!355) (dynLambda!264 (defaultEntry!1950 (v!2230 (underlying!157 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!52504 () Bool)

(declare-fun e!34220 () Bool)

(declare-fun tp_is_empty!2251 () Bool)

(assert (=> b!52504 (= e!34220 tp_is_empty!2251)))

(declare-fun b!52505 () Bool)

(declare-fun e!34219 () Bool)

(assert (=> b!52505 (= e!34219 e!34216)))

(declare-fun res!29828 () Bool)

(assert (=> b!52505 (=> (not res!29828) (not e!34216))))

(declare-fun lt!21263 () ListLongMap!1241)

(assert (=> b!52505 (= res!29828 (and (= lt!21263 lt!21262) (not (= (select (arr!1628 (_keys!3570 (v!2230 (underlying!157 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1628 (_keys!3570 (v!2230 (underlying!157 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1016 (LongMapFixedSize!472) ListLongMap!1241)

(assert (=> b!52505 (= lt!21262 (map!1016 newMap!16))))

(declare-fun getCurrentListMap!344 (array!3411 array!3413 (_ BitVec 32) (_ BitVec 32) V!2649 V!2649 (_ BitVec 32) Int) ListLongMap!1241)

(assert (=> b!52505 (= lt!21263 (getCurrentListMap!344 (_keys!3570 (v!2230 (underlying!157 thiss!992))) (_values!1933 (v!2230 (underlying!157 thiss!992))) (mask!5777 (v!2230 (underlying!157 thiss!992))) (extraKeys!1841 (v!2230 (underlying!157 thiss!992))) (zeroValue!1868 (v!2230 (underlying!157 thiss!992))) (minValue!1868 (v!2230 (underlying!157 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1950 (v!2230 (underlying!157 thiss!992)))))))

(declare-fun e!34221 () Bool)

(declare-fun e!34214 () Bool)

(declare-fun array_inv!987 (array!3411) Bool)

(declare-fun array_inv!988 (array!3413) Bool)

(assert (=> b!52506 (= e!34214 (and tp!7107 tp_is_empty!2251 (array_inv!987 (_keys!3570 (v!2230 (underlying!157 thiss!992)))) (array_inv!988 (_values!1933 (v!2230 (underlying!157 thiss!992)))) e!34221))))

(declare-fun b!52507 () Bool)

(declare-fun e!34215 () Bool)

(declare-fun e!34222 () Bool)

(declare-fun mapRes!2423 () Bool)

(assert (=> b!52507 (= e!34215 (and e!34222 mapRes!2423))))

(declare-fun condMapEmpty!2424 () Bool)

(declare-fun mapDefault!2423 () ValueCell!782)

(assert (=> b!52507 (= condMapEmpty!2424 (= (arr!1629 (_values!1933 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!782)) mapDefault!2423)))))

(declare-fun mapNonEmpty!2423 () Bool)

(declare-fun mapRes!2424 () Bool)

(declare-fun tp!7110 () Bool)

(declare-fun e!34223 () Bool)

(assert (=> mapNonEmpty!2423 (= mapRes!2424 (and tp!7110 e!34223))))

(declare-fun mapValue!2423 () ValueCell!782)

(declare-fun mapRest!2423 () (Array (_ BitVec 32) ValueCell!782))

(declare-fun mapKey!2423 () (_ BitVec 32))

(assert (=> mapNonEmpty!2423 (= (arr!1629 (_values!1933 (v!2230 (underlying!157 thiss!992)))) (store mapRest!2423 mapKey!2423 mapValue!2423))))

(declare-fun b!52508 () Bool)

(assert (=> b!52508 (= e!34218 false)))

(declare-fun lt!21261 () Bool)

(assert (=> b!52508 (= lt!21261 (contains!616 lt!21263 (select (arr!1628 (_keys!3570 (v!2230 (underlying!157 thiss!992)))) from!355)))))

(declare-fun b!52509 () Bool)

(declare-fun e!34217 () Bool)

(assert (=> b!52509 (= e!34217 e!34214)))

(declare-fun b!52510 () Bool)

(declare-fun res!29829 () Bool)

(assert (=> b!52510 (=> (not res!29829) (not e!34218))))

(assert (=> b!52510 (= res!29829 (and (= (size!1858 (_values!1933 (v!2230 (underlying!157 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5777 (v!2230 (underlying!157 thiss!992))))) (= (size!1857 (_keys!3570 (v!2230 (underlying!157 thiss!992)))) (size!1858 (_values!1933 (v!2230 (underlying!157 thiss!992))))) (bvsge (mask!5777 (v!2230 (underlying!157 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1841 (v!2230 (underlying!157 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1841 (v!2230 (underlying!157 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!52511 () Bool)

(declare-fun e!34224 () Bool)

(assert (=> b!52511 (= e!34221 (and e!34224 mapRes!2424))))

(declare-fun condMapEmpty!2423 () Bool)

(declare-fun mapDefault!2424 () ValueCell!782)

(assert (=> b!52511 (= condMapEmpty!2423 (= (arr!1629 (_values!1933 (v!2230 (underlying!157 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!782)) mapDefault!2424)))))

(declare-fun b!52512 () Bool)

(declare-fun res!29831 () Bool)

(assert (=> b!52512 (=> (not res!29831) (not e!34218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52512 (= res!29831 (validMask!0 (mask!5777 (v!2230 (underlying!157 thiss!992)))))))

(declare-fun b!52513 () Bool)

(declare-fun res!29827 () Bool)

(assert (=> b!52513 (=> (not res!29827) (not e!34219))))

(assert (=> b!52513 (= res!29827 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5777 newMap!16)) (_size!285 (v!2230 (underlying!157 thiss!992)))))))

(declare-fun mapNonEmpty!2424 () Bool)

(declare-fun tp!7108 () Bool)

(assert (=> mapNonEmpty!2424 (= mapRes!2423 (and tp!7108 e!34220))))

(declare-fun mapKey!2424 () (_ BitVec 32))

(declare-fun mapValue!2424 () ValueCell!782)

(declare-fun mapRest!2424 () (Array (_ BitVec 32) ValueCell!782))

(assert (=> mapNonEmpty!2424 (= (arr!1629 (_values!1933 newMap!16)) (store mapRest!2424 mapKey!2424 mapValue!2424))))

(declare-fun b!52515 () Bool)

(declare-fun e!34211 () Bool)

(assert (=> b!52515 (= e!34211 e!34217)))

(declare-fun b!52516 () Bool)

(declare-fun res!29830 () Bool)

(assert (=> b!52516 (=> (not res!29830) (not e!34218))))

(declare-datatypes ((List!1326 0))(
  ( (Nil!1323) (Cons!1322 (h!1902 (_ BitVec 64)) (t!4364 List!1326)) )
))
(declare-fun arrayNoDuplicates!0 (array!3411 (_ BitVec 32) List!1326) Bool)

(assert (=> b!52516 (= res!29830 (arrayNoDuplicates!0 (_keys!3570 (v!2230 (underlying!157 thiss!992))) #b00000000000000000000000000000000 Nil!1323))))

(declare-fun b!52517 () Bool)

(assert (=> b!52517 (= e!34224 tp_is_empty!2251)))

(declare-fun b!52518 () Bool)

(declare-fun res!29826 () Bool)

(assert (=> b!52518 (=> (not res!29826) (not e!34218))))

(assert (=> b!52518 (= res!29826 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1857 (_keys!3570 (v!2230 (underlying!157 thiss!992)))))))))

(declare-fun b!52519 () Bool)

(assert (=> b!52519 (= e!34222 tp_is_empty!2251)))

(declare-fun b!52520 () Bool)

(declare-fun res!29833 () Bool)

(assert (=> b!52520 (=> (not res!29833) (not e!34219))))

(assert (=> b!52520 (= res!29833 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1857 (_keys!3570 (v!2230 (underlying!157 thiss!992)))))))))

(declare-fun b!52521 () Bool)

(declare-fun res!29835 () Bool)

(assert (=> b!52521 (=> (not res!29835) (not e!34219))))

(declare-fun valid!177 (LongMapFixedSize!472) Bool)

(assert (=> b!52521 (= res!29835 (valid!177 newMap!16))))

(declare-fun mapIsEmpty!2423 () Bool)

(assert (=> mapIsEmpty!2423 mapRes!2424))

(declare-fun mapIsEmpty!2424 () Bool)

(assert (=> mapIsEmpty!2424 mapRes!2423))

(declare-fun e!34212 () Bool)

(assert (=> b!52522 (= e!34212 (and tp!7109 tp_is_empty!2251 (array_inv!987 (_keys!3570 newMap!16)) (array_inv!988 (_values!1933 newMap!16)) e!34215))))

(declare-fun b!52523 () Bool)

(assert (=> b!52523 (= e!34223 tp_is_empty!2251)))

(declare-fun b!52514 () Bool)

(declare-fun res!29832 () Bool)

(assert (=> b!52514 (=> (not res!29832) (not e!34218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3411 (_ BitVec 32)) Bool)

(assert (=> b!52514 (= res!29832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3570 (v!2230 (underlying!157 thiss!992))) (mask!5777 (v!2230 (underlying!157 thiss!992)))))))

(declare-fun res!29836 () Bool)

(assert (=> start!8256 (=> (not res!29836) (not e!34219))))

(declare-fun valid!178 (LongMap!292) Bool)

(assert (=> start!8256 (= res!29836 (valid!178 thiss!992))))

(assert (=> start!8256 e!34219))

(assert (=> start!8256 e!34211))

(assert (=> start!8256 true))

(assert (=> start!8256 e!34212))

(assert (= (and start!8256 res!29836) b!52520))

(assert (= (and b!52520 res!29833) b!52521))

(assert (= (and b!52521 res!29835) b!52513))

(assert (= (and b!52513 res!29827) b!52505))

(assert (= (and b!52505 res!29828) b!52503))

(assert (= (and b!52503 res!29834) b!52512))

(assert (= (and b!52512 res!29831) b!52510))

(assert (= (and b!52510 res!29829) b!52514))

(assert (= (and b!52514 res!29832) b!52516))

(assert (= (and b!52516 res!29830) b!52518))

(assert (= (and b!52518 res!29826) b!52508))

(assert (= (and b!52511 condMapEmpty!2423) mapIsEmpty!2423))

(assert (= (and b!52511 (not condMapEmpty!2423)) mapNonEmpty!2423))

(get-info :version)

(assert (= (and mapNonEmpty!2423 ((_ is ValueCellFull!782) mapValue!2423)) b!52523))

(assert (= (and b!52511 ((_ is ValueCellFull!782) mapDefault!2424)) b!52517))

(assert (= b!52506 b!52511))

(assert (= b!52509 b!52506))

(assert (= b!52515 b!52509))

(assert (= start!8256 b!52515))

(assert (= (and b!52507 condMapEmpty!2424) mapIsEmpty!2424))

(assert (= (and b!52507 (not condMapEmpty!2424)) mapNonEmpty!2424))

(assert (= (and mapNonEmpty!2424 ((_ is ValueCellFull!782) mapValue!2424)) b!52504))

(assert (= (and b!52507 ((_ is ValueCellFull!782) mapDefault!2423)) b!52519))

(assert (= b!52522 b!52507))

(assert (= start!8256 b!52522))

(declare-fun b_lambda!2345 () Bool)

(assert (=> (not b_lambda!2345) (not b!52503)))

(declare-fun t!4360 () Bool)

(declare-fun tb!1013 () Bool)

(assert (=> (and b!52506 (= (defaultEntry!1950 (v!2230 (underlying!157 thiss!992))) (defaultEntry!1950 (v!2230 (underlying!157 thiss!992)))) t!4360) tb!1013))

(declare-fun result!1917 () Bool)

(assert (=> tb!1013 (= result!1917 tp_is_empty!2251)))

(assert (=> b!52503 t!4360))

(declare-fun b_and!2881 () Bool)

(assert (= b_and!2877 (and (=> t!4360 result!1917) b_and!2881)))

(declare-fun t!4362 () Bool)

(declare-fun tb!1015 () Bool)

(assert (=> (and b!52522 (= (defaultEntry!1950 newMap!16) (defaultEntry!1950 (v!2230 (underlying!157 thiss!992)))) t!4362) tb!1015))

(declare-fun result!1921 () Bool)

(assert (= result!1921 result!1917))

(assert (=> b!52503 t!4362))

(declare-fun b_and!2883 () Bool)

(assert (= b_and!2879 (and (=> t!4362 result!1921) b_and!2883)))

(declare-fun m!44761 () Bool)

(assert (=> b!52516 m!44761))

(declare-fun m!44763 () Bool)

(assert (=> b!52506 m!44763))

(declare-fun m!44765 () Bool)

(assert (=> b!52506 m!44765))

(declare-fun m!44767 () Bool)

(assert (=> start!8256 m!44767))

(declare-fun m!44769 () Bool)

(assert (=> b!52505 m!44769))

(declare-fun m!44771 () Bool)

(assert (=> b!52505 m!44771))

(declare-fun m!44773 () Bool)

(assert (=> b!52505 m!44773))

(declare-fun m!44775 () Bool)

(assert (=> b!52512 m!44775))

(declare-fun m!44777 () Bool)

(assert (=> mapNonEmpty!2423 m!44777))

(declare-fun m!44779 () Bool)

(assert (=> b!52514 m!44779))

(declare-fun m!44781 () Bool)

(assert (=> mapNonEmpty!2424 m!44781))

(declare-fun m!44783 () Bool)

(assert (=> b!52521 m!44783))

(assert (=> b!52508 m!44769))

(assert (=> b!52508 m!44769))

(declare-fun m!44785 () Bool)

(assert (=> b!52508 m!44785))

(declare-fun m!44787 () Bool)

(assert (=> b!52503 m!44787))

(declare-fun m!44789 () Bool)

(assert (=> b!52503 m!44789))

(declare-fun m!44791 () Bool)

(assert (=> b!52503 m!44791))

(assert (=> b!52503 m!44789))

(assert (=> b!52503 m!44769))

(assert (=> b!52503 m!44791))

(declare-fun m!44793 () Bool)

(assert (=> b!52503 m!44793))

(assert (=> b!52503 m!44787))

(assert (=> b!52503 m!44769))

(declare-fun m!44795 () Bool)

(assert (=> b!52503 m!44795))

(assert (=> b!52503 m!44769))

(declare-fun m!44797 () Bool)

(assert (=> b!52522 m!44797))

(declare-fun m!44799 () Bool)

(assert (=> b!52522 m!44799))

(check-sat (not b!52508) b_and!2883 (not b!52503) (not b!52521) (not b_next!1669) (not b!52505) tp_is_empty!2251 (not start!8256) (not b!52512) (not b!52506) (not b!52522) (not b_next!1671) (not b!52514) (not mapNonEmpty!2423) (not b_lambda!2345) b_and!2881 (not b!52516) (not mapNonEmpty!2424))
(check-sat b_and!2881 b_and!2883 (not b_next!1669) (not b_next!1671))
