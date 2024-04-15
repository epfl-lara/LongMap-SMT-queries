; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14974 () Bool)

(assert start!14974)

(declare-fun b!143872 () Bool)

(declare-fun b_free!3049 () Bool)

(declare-fun b_next!3049 () Bool)

(assert (=> b!143872 (= b_free!3049 (not b_next!3049))))

(declare-fun tp!11635 () Bool)

(declare-fun b_and!8941 () Bool)

(assert (=> b!143872 (= tp!11635 b_and!8941)))

(declare-fun b!143864 () Bool)

(declare-fun b_free!3051 () Bool)

(declare-fun b_next!3051 () Bool)

(assert (=> b!143864 (= b_free!3051 (not b_next!3051))))

(declare-fun tp!11633 () Bool)

(declare-fun b_and!8943 () Bool)

(assert (=> b!143864 (= tp!11633 b_and!8943)))

(declare-fun b!143861 () Bool)

(declare-fun e!93728 () Bool)

(declare-fun tp_is_empty!2941 () Bool)

(assert (=> b!143861 (= e!93728 tp_is_empty!2941)))

(declare-fun res!68471 () Bool)

(declare-fun e!93740 () Bool)

(assert (=> start!14974 (=> (not res!68471) (not e!93740))))

(declare-datatypes ((V!3569 0))(
  ( (V!3570 (val!1515 Int)) )
))
(declare-datatypes ((array!4901 0))(
  ( (array!4902 (arr!2314 (Array (_ BitVec 32) (_ BitVec 64))) (size!2589 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1127 0))(
  ( (ValueCellFull!1127 (v!3301 V!3569)) (EmptyCell!1127) )
))
(declare-datatypes ((array!4903 0))(
  ( (array!4904 (arr!2315 (Array (_ BitVec 32) ValueCell!1127)) (size!2590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1162 0))(
  ( (LongMapFixedSize!1163 (defaultEntry!2975 Int) (mask!7332 (_ BitVec 32)) (extraKeys!2724 (_ BitVec 32)) (zeroValue!2822 V!3569) (minValue!2822 V!3569) (_size!630 (_ BitVec 32)) (_keys!4739 array!4901) (_values!2958 array!4903) (_vacant!630 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!942 0))(
  ( (Cell!943 (v!3302 LongMapFixedSize!1162)) )
))
(declare-datatypes ((LongMap!942 0))(
  ( (LongMap!943 (underlying!482 Cell!942)) )
))
(declare-fun thiss!992 () LongMap!942)

(declare-fun valid!566 (LongMap!942) Bool)

(assert (=> start!14974 (= res!68471 (valid!566 thiss!992))))

(assert (=> start!14974 e!93740))

(declare-fun e!93738 () Bool)

(assert (=> start!14974 e!93738))

(assert (=> start!14974 true))

(declare-fun e!93730 () Bool)

(assert (=> start!14974 e!93730))

(declare-fun b!143862 () Bool)

(declare-fun e!93741 () Bool)

(declare-fun e!93729 () Bool)

(declare-fun mapRes!4879 () Bool)

(assert (=> b!143862 (= e!93741 (and e!93729 mapRes!4879))))

(declare-fun condMapEmpty!4880 () Bool)

(declare-fun mapDefault!4880 () ValueCell!1127)

(assert (=> b!143862 (= condMapEmpty!4880 (= (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4880)))))

(declare-fun b!143863 () Bool)

(declare-fun e!93742 () Bool)

(declare-fun e!93734 () Bool)

(assert (=> b!143863 (= e!93742 e!93734)))

(declare-fun res!68477 () Bool)

(assert (=> b!143863 (=> (not res!68477) (not e!93734))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2676 0))(
  ( (tuple2!2677 (_1!1349 (_ BitVec 64)) (_2!1349 V!3569)) )
))
(declare-datatypes ((List!1749 0))(
  ( (Nil!1746) (Cons!1745 (h!2353 tuple2!2676) (t!6365 List!1749)) )
))
(declare-datatypes ((ListLongMap!1721 0))(
  ( (ListLongMap!1722 (toList!876 List!1749)) )
))
(declare-fun lt!75328 () ListLongMap!1721)

(declare-fun contains!919 (ListLongMap!1721 (_ BitVec 64)) Bool)

(assert (=> b!143863 (= res!68477 (contains!919 lt!75328 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2678 0))(
  ( (tuple2!2679 (_1!1350 Bool) (_2!1350 LongMapFixedSize!1162)) )
))
(declare-fun lt!75330 () tuple2!2678)

(declare-fun newMap!16 () LongMapFixedSize!1162)

(declare-fun update!213 (LongMapFixedSize!1162 (_ BitVec 64) V!3569) tuple2!2678)

(declare-fun get!1538 (ValueCell!1127 V!3569) V!3569)

(declare-fun dynLambda!439 (Int (_ BitVec 64)) V!3569)

(assert (=> b!143863 (= lt!75330 (update!213 newMap!16 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!4879 () Bool)

(declare-fun mapRes!4880 () Bool)

(assert (=> mapIsEmpty!4879 mapRes!4880))

(declare-fun e!93727 () Bool)

(declare-fun array_inv!1479 (array!4901) Bool)

(declare-fun array_inv!1480 (array!4903) Bool)

(assert (=> b!143864 (= e!93730 (and tp!11633 tp_is_empty!2941 (array_inv!1479 (_keys!4739 newMap!16)) (array_inv!1480 (_values!2958 newMap!16)) e!93727))))

(declare-fun b!143865 () Bool)

(declare-fun e!93743 () Bool)

(assert (=> b!143865 (= e!93734 (not e!93743))))

(declare-fun res!68474 () Bool)

(assert (=> b!143865 (=> res!68474 e!93743)))

(assert (=> b!143865 (= res!68474 (or (bvsge (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992)))))))))

(declare-datatypes ((List!1750 0))(
  ( (Nil!1747) (Cons!1746 (h!2354 (_ BitVec 64)) (t!6366 List!1750)) )
))
(declare-fun lt!75327 () List!1750)

(assert (=> b!143865 (= lt!75327 (Cons!1746 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) Nil!1747))))

(declare-fun arrayNoDuplicates!0 (array!4901 (_ BitVec 32) List!1750) Bool)

(assert (=> b!143865 (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) from!355 Nil!1747)))

(declare-datatypes ((Unit!4559 0))(
  ( (Unit!4560) )
))
(declare-fun lt!75326 () Unit!4559)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4901 (_ BitVec 32) (_ BitVec 32)) Unit!4559)

(assert (=> b!143865 (= lt!75326 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143865 (arrayContainsKey!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75325 () Unit!4559)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!149 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) (_ BitVec 32) Int) Unit!4559)

(assert (=> b!143865 (= lt!75325 (lemmaListMapContainsThenArrayContainsFrom!149 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun b!143866 () Bool)

(assert (=> b!143866 (= e!93727 (and e!93728 mapRes!4880))))

(declare-fun condMapEmpty!4879 () Bool)

(declare-fun mapDefault!4879 () ValueCell!1127)

(assert (=> b!143866 (= condMapEmpty!4879 (= (arr!2315 (_values!2958 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4879)))))

(declare-fun b!143867 () Bool)

(declare-fun res!68475 () Bool)

(assert (=> b!143867 (=> (not res!68475) (not e!93740))))

(declare-fun valid!567 (LongMapFixedSize!1162) Bool)

(assert (=> b!143867 (= res!68475 (valid!567 newMap!16))))

(declare-fun b!143868 () Bool)

(declare-fun e!93736 () Bool)

(assert (=> b!143868 (= e!93736 tp_is_empty!2941)))

(declare-fun b!143869 () Bool)

(declare-fun res!68473 () Bool)

(assert (=> b!143869 (=> (not res!68473) (not e!93740))))

(assert (=> b!143869 (= res!68473 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7332 newMap!16)) (_size!630 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun mapIsEmpty!4880 () Bool)

(assert (=> mapIsEmpty!4880 mapRes!4879))

(declare-fun b!143870 () Bool)

(declare-fun e!93733 () Bool)

(assert (=> b!143870 (= e!93738 e!93733)))

(declare-fun b!143871 () Bool)

(declare-fun e!93732 () Bool)

(assert (=> b!143871 (= e!93733 e!93732)))

(assert (=> b!143872 (= e!93732 (and tp!11635 tp_is_empty!2941 (array_inv!1479 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (array_inv!1480 (_values!2958 (v!3302 (underlying!482 thiss!992)))) e!93741))))

(declare-fun b!143873 () Bool)

(declare-fun res!68478 () Bool)

(assert (=> b!143873 (=> res!68478 e!93743)))

(declare-fun noDuplicate!53 (List!1750) Bool)

(assert (=> b!143873 (= res!68478 (not (noDuplicate!53 lt!75327)))))

(declare-fun b!143874 () Bool)

(declare-fun res!68472 () Bool)

(assert (=> b!143874 (=> (not res!68472) (not e!93740))))

(assert (=> b!143874 (= res!68472 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun b!143875 () Bool)

(declare-fun e!93731 () Bool)

(assert (=> b!143875 (= e!93731 tp_is_empty!2941)))

(declare-fun mapNonEmpty!4879 () Bool)

(declare-fun tp!11636 () Bool)

(assert (=> mapNonEmpty!4879 (= mapRes!4880 (and tp!11636 e!93736))))

(declare-fun mapRest!4879 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapKey!4879 () (_ BitVec 32))

(declare-fun mapValue!4879 () ValueCell!1127)

(assert (=> mapNonEmpty!4879 (= (arr!2315 (_values!2958 newMap!16)) (store mapRest!4879 mapKey!4879 mapValue!4879))))

(declare-fun b!143876 () Bool)

(assert (=> b!143876 (= e!93729 tp_is_empty!2941)))

(declare-fun b!143877 () Bool)

(declare-fun e!93737 () Bool)

(declare-fun contains!920 (List!1750 (_ BitVec 64)) Bool)

(assert (=> b!143877 (= e!93737 (not (contains!920 lt!75327 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143878 () Bool)

(assert (=> b!143878 (= e!93740 e!93742)))

(declare-fun res!68476 () Bool)

(assert (=> b!143878 (=> (not res!68476) (not e!93742))))

(declare-fun lt!75329 () ListLongMap!1721)

(assert (=> b!143878 (= res!68476 (and (= lt!75329 lt!75328) (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1430 (LongMapFixedSize!1162) ListLongMap!1721)

(assert (=> b!143878 (= lt!75328 (map!1430 newMap!16))))

(declare-fun getCurrentListMap!536 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) ListLongMap!1721)

(assert (=> b!143878 (= lt!75329 (getCurrentListMap!536 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun b!143879 () Bool)

(assert (=> b!143879 (= e!93743 e!93737)))

(declare-fun res!68479 () Bool)

(assert (=> b!143879 (=> (not res!68479) (not e!93737))))

(assert (=> b!143879 (= res!68479 (not (contains!920 lt!75327 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!4880 () Bool)

(declare-fun tp!11634 () Bool)

(assert (=> mapNonEmpty!4880 (= mapRes!4879 (and tp!11634 e!93731))))

(declare-fun mapRest!4880 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapKey!4880 () (_ BitVec 32))

(declare-fun mapValue!4880 () ValueCell!1127)

(assert (=> mapNonEmpty!4880 (= (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (store mapRest!4880 mapKey!4880 mapValue!4880))))

(assert (= (and start!14974 res!68471) b!143874))

(assert (= (and b!143874 res!68472) b!143867))

(assert (= (and b!143867 res!68475) b!143869))

(assert (= (and b!143869 res!68473) b!143878))

(assert (= (and b!143878 res!68476) b!143863))

(assert (= (and b!143863 res!68477) b!143865))

(assert (= (and b!143865 (not res!68474)) b!143873))

(assert (= (and b!143873 (not res!68478)) b!143879))

(assert (= (and b!143879 res!68479) b!143877))

(assert (= (and b!143862 condMapEmpty!4880) mapIsEmpty!4880))

(assert (= (and b!143862 (not condMapEmpty!4880)) mapNonEmpty!4880))

(get-info :version)

(assert (= (and mapNonEmpty!4880 ((_ is ValueCellFull!1127) mapValue!4880)) b!143875))

(assert (= (and b!143862 ((_ is ValueCellFull!1127) mapDefault!4880)) b!143876))

(assert (= b!143872 b!143862))

(assert (= b!143871 b!143872))

(assert (= b!143870 b!143871))

(assert (= start!14974 b!143870))

(assert (= (and b!143866 condMapEmpty!4879) mapIsEmpty!4879))

(assert (= (and b!143866 (not condMapEmpty!4879)) mapNonEmpty!4879))

(assert (= (and mapNonEmpty!4879 ((_ is ValueCellFull!1127) mapValue!4879)) b!143868))

(assert (= (and b!143866 ((_ is ValueCellFull!1127) mapDefault!4879)) b!143861))

(assert (= b!143864 b!143866))

(assert (= start!14974 b!143864))

(declare-fun b_lambda!6445 () Bool)

(assert (=> (not b_lambda!6445) (not b!143863)))

(declare-fun t!6362 () Bool)

(declare-fun tb!2577 () Bool)

(assert (=> (and b!143872 (= (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))) t!6362) tb!2577))

(declare-fun result!4223 () Bool)

(assert (=> tb!2577 (= result!4223 tp_is_empty!2941)))

(assert (=> b!143863 t!6362))

(declare-fun b_and!8945 () Bool)

(assert (= b_and!8941 (and (=> t!6362 result!4223) b_and!8945)))

(declare-fun t!6364 () Bool)

(declare-fun tb!2579 () Bool)

(assert (=> (and b!143864 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))) t!6364) tb!2579))

(declare-fun result!4227 () Bool)

(assert (= result!4227 result!4223))

(assert (=> b!143863 t!6364))

(declare-fun b_and!8947 () Bool)

(assert (= b_and!8943 (and (=> t!6364 result!4227) b_and!8947)))

(declare-fun m!173303 () Bool)

(assert (=> b!143879 m!173303))

(declare-fun m!173305 () Bool)

(assert (=> b!143865 m!173305))

(declare-fun m!173307 () Bool)

(assert (=> b!143865 m!173307))

(declare-fun m!173309 () Bool)

(assert (=> b!143865 m!173309))

(declare-fun m!173311 () Bool)

(assert (=> b!143865 m!173311))

(assert (=> b!143865 m!173309))

(assert (=> b!143865 m!173309))

(declare-fun m!173313 () Bool)

(assert (=> b!143865 m!173313))

(declare-fun m!173315 () Bool)

(assert (=> mapNonEmpty!4879 m!173315))

(declare-fun m!173317 () Bool)

(assert (=> b!143863 m!173317))

(declare-fun m!173319 () Bool)

(assert (=> b!143863 m!173319))

(declare-fun m!173321 () Bool)

(assert (=> b!143863 m!173321))

(assert (=> b!143863 m!173309))

(assert (=> b!143863 m!173319))

(assert (=> b!143863 m!173309))

(declare-fun m!173323 () Bool)

(assert (=> b!143863 m!173323))

(assert (=> b!143863 m!173309))

(assert (=> b!143863 m!173321))

(declare-fun m!173325 () Bool)

(assert (=> b!143863 m!173325))

(assert (=> b!143863 m!173317))

(declare-fun m!173327 () Bool)

(assert (=> start!14974 m!173327))

(declare-fun m!173329 () Bool)

(assert (=> b!143867 m!173329))

(declare-fun m!173331 () Bool)

(assert (=> b!143872 m!173331))

(declare-fun m!173333 () Bool)

(assert (=> b!143872 m!173333))

(declare-fun m!173335 () Bool)

(assert (=> b!143877 m!173335))

(declare-fun m!173337 () Bool)

(assert (=> b!143864 m!173337))

(declare-fun m!173339 () Bool)

(assert (=> b!143864 m!173339))

(declare-fun m!173341 () Bool)

(assert (=> b!143873 m!173341))

(declare-fun m!173343 () Bool)

(assert (=> mapNonEmpty!4880 m!173343))

(assert (=> b!143878 m!173309))

(declare-fun m!173345 () Bool)

(assert (=> b!143878 m!173345))

(declare-fun m!173347 () Bool)

(assert (=> b!143878 m!173347))

(check-sat (not b!143878) (not b_lambda!6445) tp_is_empty!2941 (not b!143863) b_and!8945 b_and!8947 (not mapNonEmpty!4879) (not b!143872) (not b!143879) (not b!143864) (not b!143867) (not b_next!3049) (not start!14974) (not b!143877) (not mapNonEmpty!4880) (not b_next!3051) (not b!143865) (not b!143873))
(check-sat b_and!8945 b_and!8947 (not b_next!3049) (not b_next!3051))
(get-model)

(declare-fun b_lambda!6451 () Bool)

(assert (= b_lambda!6445 (or (and b!143872 b_free!3049) (and b!143864 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))))) b_lambda!6451)))

(check-sat (not b!143878) tp_is_empty!2941 (not b!143863) b_and!8945 b_and!8947 (not mapNonEmpty!4879) (not b!143872) (not b_lambda!6451) (not b!143879) (not b!143864) (not b!143867) (not b_next!3049) (not start!14974) (not b!143877) (not mapNonEmpty!4880) (not b_next!3051) (not b!143865) (not b!143873))
(check-sat b_and!8945 b_and!8947 (not b_next!3049) (not b_next!3051))
(get-model)

(declare-fun d!45947 () Bool)

(declare-fun lt!75369 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!140 (List!1750) (InoxSet (_ BitVec 64)))

(assert (=> d!45947 (= lt!75369 (select (content!140 lt!75327) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93850 () Bool)

(assert (=> d!45947 (= lt!75369 e!93850)))

(declare-fun res!68539 () Bool)

(assert (=> d!45947 (=> (not res!68539) (not e!93850))))

(assert (=> d!45947 (= res!68539 ((_ is Cons!1746) lt!75327))))

(assert (=> d!45947 (= (contains!920 lt!75327 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75369)))

(declare-fun b!144004 () Bool)

(declare-fun e!93851 () Bool)

(assert (=> b!144004 (= e!93850 e!93851)))

(declare-fun res!68538 () Bool)

(assert (=> b!144004 (=> res!68538 e!93851)))

(assert (=> b!144004 (= res!68538 (= (h!2354 lt!75327) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144005 () Bool)

(assert (=> b!144005 (= e!93851 (contains!920 (t!6366 lt!75327) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45947 res!68539) b!144004))

(assert (= (and b!144004 (not res!68538)) b!144005))

(declare-fun m!173441 () Bool)

(assert (=> d!45947 m!173441))

(declare-fun m!173443 () Bool)

(assert (=> d!45947 m!173443))

(declare-fun m!173445 () Bool)

(assert (=> b!144005 m!173445))

(assert (=> b!143879 d!45947))

(declare-fun b!144016 () Bool)

(declare-fun e!93861 () Bool)

(assert (=> b!144016 (= e!93861 (contains!920 Nil!1747 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun bm!15941 () Bool)

(declare-fun call!15944 () Bool)

(declare-fun c!27278 () Bool)

(assert (=> bm!15941 (= call!15944 (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27278 (Cons!1746 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) Nil!1747) Nil!1747)))))

(declare-fun b!144018 () Bool)

(declare-fun e!93863 () Bool)

(assert (=> b!144018 (= e!93863 call!15944)))

(declare-fun b!144019 () Bool)

(declare-fun e!93860 () Bool)

(assert (=> b!144019 (= e!93860 e!93863)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!144019 (= c!27278 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144020 () Bool)

(declare-fun e!93862 () Bool)

(assert (=> b!144020 (= e!93862 e!93860)))

(declare-fun res!68547 () Bool)

(assert (=> b!144020 (=> (not res!68547) (not e!93860))))

(assert (=> b!144020 (= res!68547 (not e!93861))))

(declare-fun res!68546 () Bool)

(assert (=> b!144020 (=> (not res!68546) (not e!93861))))

(assert (=> b!144020 (= res!68546 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144017 () Bool)

(assert (=> b!144017 (= e!93863 call!15944)))

(declare-fun d!45949 () Bool)

(declare-fun res!68548 () Bool)

(assert (=> d!45949 (=> res!68548 e!93862)))

(assert (=> d!45949 (= res!68548 (bvsge from!355 (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(assert (=> d!45949 (= (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) from!355 Nil!1747) e!93862)))

(assert (= (and d!45949 (not res!68548)) b!144020))

(assert (= (and b!144020 res!68546) b!144016))

(assert (= (and b!144020 res!68547) b!144019))

(assert (= (and b!144019 c!27278) b!144018))

(assert (= (and b!144019 (not c!27278)) b!144017))

(assert (= (or b!144018 b!144017) bm!15941))

(assert (=> b!144016 m!173309))

(assert (=> b!144016 m!173309))

(declare-fun m!173447 () Bool)

(assert (=> b!144016 m!173447))

(assert (=> bm!15941 m!173309))

(declare-fun m!173449 () Bool)

(assert (=> bm!15941 m!173449))

(assert (=> b!144019 m!173309))

(assert (=> b!144019 m!173309))

(declare-fun m!173451 () Bool)

(assert (=> b!144019 m!173451))

(assert (=> b!144020 m!173309))

(assert (=> b!144020 m!173309))

(assert (=> b!144020 m!173451))

(assert (=> b!143865 d!45949))

(declare-fun d!45951 () Bool)

(assert (=> d!45951 (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) from!355 Nil!1747)))

(declare-fun lt!75372 () Unit!4559)

(declare-fun choose!39 (array!4901 (_ BitVec 32) (_ BitVec 32)) Unit!4559)

(assert (=> d!45951 (= lt!75372 (choose!39 (_keys!4739 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!45951 (bvslt (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!45951 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355) lt!75372)))

(declare-fun bs!6069 () Bool)

(assert (= bs!6069 d!45951))

(assert (=> bs!6069 m!173307))

(declare-fun m!173453 () Bool)

(assert (=> bs!6069 m!173453))

(assert (=> b!143865 d!45951))

(declare-fun d!45953 () Bool)

(declare-fun res!68553 () Bool)

(declare-fun e!93868 () Bool)

(assert (=> d!45953 (=> res!68553 e!93868)))

(assert (=> d!45953 (= res!68553 (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45953 (= (arrayContainsKey!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!93868)))

(declare-fun b!144025 () Bool)

(declare-fun e!93869 () Bool)

(assert (=> b!144025 (= e!93868 e!93869)))

(declare-fun res!68554 () Bool)

(assert (=> b!144025 (=> (not res!68554) (not e!93869))))

(assert (=> b!144025 (= res!68554 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun b!144026 () Bool)

(assert (=> b!144026 (= e!93869 (arrayContainsKey!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!45953 (not res!68553)) b!144025))

(assert (= (and b!144025 res!68554) b!144026))

(declare-fun m!173455 () Bool)

(assert (=> d!45953 m!173455))

(assert (=> b!144026 m!173309))

(declare-fun m!173457 () Bool)

(assert (=> b!144026 m!173457))

(assert (=> b!143865 d!45953))

(declare-fun d!45955 () Bool)

(declare-fun e!93872 () Bool)

(assert (=> d!45955 e!93872))

(declare-fun c!27281 () Bool)

(assert (=> d!45955 (= c!27281 (and (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!75375 () Unit!4559)

(declare-fun choose!886 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) (_ BitVec 32) Int) Unit!4559)

(assert (=> d!45955 (= lt!75375 (choose!886 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!45955 (validMask!0 (mask!7332 (v!3302 (underlying!482 thiss!992))))))

(assert (=> d!45955 (= (lemmaListMapContainsThenArrayContainsFrom!149 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))) lt!75375)))

(declare-fun b!144031 () Bool)

(assert (=> b!144031 (= e!93872 (arrayContainsKey!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144032 () Bool)

(assert (=> b!144032 (= e!93872 (ite (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45955 c!27281) b!144031))

(assert (= (and d!45955 (not c!27281)) b!144032))

(assert (=> d!45955 m!173309))

(declare-fun m!173459 () Bool)

(assert (=> d!45955 m!173459))

(declare-fun m!173461 () Bool)

(assert (=> d!45955 m!173461))

(assert (=> b!144031 m!173309))

(assert (=> b!144031 m!173313))

(assert (=> b!143865 d!45955))

(declare-fun d!45957 () Bool)

(declare-fun res!68559 () Bool)

(declare-fun e!93877 () Bool)

(assert (=> d!45957 (=> res!68559 e!93877)))

(assert (=> d!45957 (= res!68559 ((_ is Nil!1747) lt!75327))))

(assert (=> d!45957 (= (noDuplicate!53 lt!75327) e!93877)))

(declare-fun b!144037 () Bool)

(declare-fun e!93878 () Bool)

(assert (=> b!144037 (= e!93877 e!93878)))

(declare-fun res!68560 () Bool)

(assert (=> b!144037 (=> (not res!68560) (not e!93878))))

(assert (=> b!144037 (= res!68560 (not (contains!920 (t!6366 lt!75327) (h!2354 lt!75327))))))

(declare-fun b!144038 () Bool)

(assert (=> b!144038 (= e!93878 (noDuplicate!53 (t!6366 lt!75327)))))

(assert (= (and d!45957 (not res!68559)) b!144037))

(assert (= (and b!144037 res!68560) b!144038))

(declare-fun m!173463 () Bool)

(assert (=> b!144037 m!173463))

(declare-fun m!173465 () Bool)

(assert (=> b!144038 m!173465))

(assert (=> b!143873 d!45957))

(declare-fun d!45959 () Bool)

(assert (=> d!45959 (= (map!1430 newMap!16) (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bs!6070 () Bool)

(assert (= bs!6070 d!45959))

(declare-fun m!173467 () Bool)

(assert (=> bs!6070 m!173467))

(assert (=> b!143878 d!45959))

(declare-fun c!27294 () Bool)

(declare-fun bm!15956 () Bool)

(declare-fun call!15963 () ListLongMap!1721)

(declare-fun c!27298 () Bool)

(declare-fun call!15960 () ListLongMap!1721)

(declare-fun call!15965 () ListLongMap!1721)

(declare-fun call!15961 () ListLongMap!1721)

(declare-fun +!169 (ListLongMap!1721 tuple2!2676) ListLongMap!1721)

(assert (=> bm!15956 (= call!15965 (+!169 (ite c!27294 call!15961 (ite c!27298 call!15963 call!15960)) (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun b!144081 () Bool)

(declare-fun e!93916 () ListLongMap!1721)

(declare-fun call!15959 () ListLongMap!1721)

(assert (=> b!144081 (= e!93916 call!15959)))

(declare-fun b!144082 () Bool)

(declare-fun e!93913 () Bool)

(declare-fun e!93911 () Bool)

(assert (=> b!144082 (= e!93913 e!93911)))

(declare-fun c!27297 () Bool)

(assert (=> b!144082 (= c!27297 (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144083 () Bool)

(declare-fun e!93907 () Bool)

(assert (=> b!144083 (= e!93911 e!93907)))

(declare-fun res!68582 () Bool)

(declare-fun call!15962 () Bool)

(assert (=> b!144083 (= res!68582 call!15962)))

(assert (=> b!144083 (=> (not res!68582) (not e!93907))))

(declare-fun bm!15957 () Bool)

(assert (=> bm!15957 (= call!15960 call!15963)))

(declare-fun b!144084 () Bool)

(declare-fun c!27299 () Bool)

(assert (=> b!144084 (= c!27299 (and (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!93905 () ListLongMap!1721)

(assert (=> b!144084 (= e!93916 e!93905)))

(declare-fun b!144085 () Bool)

(assert (=> b!144085 (= e!93911 (not call!15962))))

(declare-fun d!45961 () Bool)

(assert (=> d!45961 e!93913))

(declare-fun res!68586 () Bool)

(assert (=> d!45961 (=> (not res!68586) (not e!93913))))

(assert (=> d!45961 (= res!68586 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))))

(declare-fun lt!75431 () ListLongMap!1721)

(declare-fun lt!75433 () ListLongMap!1721)

(assert (=> d!45961 (= lt!75431 lt!75433)))

(declare-fun lt!75434 () Unit!4559)

(declare-fun e!93915 () Unit!4559)

(assert (=> d!45961 (= lt!75434 e!93915)))

(declare-fun c!27295 () Bool)

(declare-fun e!93912 () Bool)

(assert (=> d!45961 (= c!27295 e!93912)))

(declare-fun res!68583 () Bool)

(assert (=> d!45961 (=> (not res!68583) (not e!93912))))

(assert (=> d!45961 (= res!68583 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun e!93906 () ListLongMap!1721)

(assert (=> d!45961 (= lt!75433 e!93906)))

(assert (=> d!45961 (= c!27294 (and (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45961 (validMask!0 (mask!7332 (v!3302 (underlying!482 thiss!992))))))

(assert (=> d!45961 (= (getCurrentListMap!536 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))) lt!75431)))

(declare-fun b!144086 () Bool)

(declare-fun e!93914 () Bool)

(declare-fun e!93917 () Bool)

(assert (=> b!144086 (= e!93914 e!93917)))

(declare-fun res!68580 () Bool)

(declare-fun call!15964 () Bool)

(assert (=> b!144086 (= res!68580 call!15964)))

(assert (=> b!144086 (=> (not res!68580) (not e!93917))))

(declare-fun b!144087 () Bool)

(declare-fun Unit!4563 () Unit!4559)

(assert (=> b!144087 (= e!93915 Unit!4563)))

(declare-fun bm!15958 () Bool)

(assert (=> bm!15958 (= call!15959 call!15965)))

(declare-fun b!144088 () Bool)

(declare-fun apply!122 (ListLongMap!1721 (_ BitVec 64)) V!3569)

(assert (=> b!144088 (= e!93917 (= (apply!122 lt!75431 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun b!144089 () Bool)

(assert (=> b!144089 (= e!93905 call!15959)))

(declare-fun bm!15959 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!134 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) ListLongMap!1721)

(assert (=> bm!15959 (= call!15961 (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun bm!15960 () Bool)

(assert (=> bm!15960 (= call!15964 (contains!919 lt!75431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144090 () Bool)

(assert (=> b!144090 (= e!93914 (not call!15964))))

(declare-fun b!144091 () Bool)

(assert (=> b!144091 (= e!93907 (= (apply!122 lt!75431 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun b!144092 () Bool)

(assert (=> b!144092 (= e!93905 call!15960)))

(declare-fun bm!15961 () Bool)

(assert (=> bm!15961 (= call!15962 (contains!919 lt!75431 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144093 () Bool)

(declare-fun e!93910 () Bool)

(declare-fun e!93908 () Bool)

(assert (=> b!144093 (= e!93910 e!93908)))

(declare-fun res!68585 () Bool)

(assert (=> b!144093 (=> (not res!68585) (not e!93908))))

(assert (=> b!144093 (= res!68585 (contains!919 lt!75431 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun b!144094 () Bool)

(assert (=> b!144094 (= e!93912 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144095 () Bool)

(assert (=> b!144095 (= e!93908 (= (apply!122 lt!75431 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2590 (_values!2958 (v!3302 (underlying!482 thiss!992))))))))

(assert (=> b!144095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun bm!15962 () Bool)

(assert (=> bm!15962 (= call!15963 call!15961)))

(declare-fun b!144096 () Bool)

(declare-fun e!93909 () Bool)

(assert (=> b!144096 (= e!93909 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144097 () Bool)

(declare-fun lt!75430 () Unit!4559)

(assert (=> b!144097 (= e!93915 lt!75430)))

(declare-fun lt!75425 () ListLongMap!1721)

(assert (=> b!144097 (= lt!75425 (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun lt!75438 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75438 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75441 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75441 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75429 () Unit!4559)

(declare-fun addStillContains!98 (ListLongMap!1721 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4559)

(assert (=> b!144097 (= lt!75429 (addStillContains!98 lt!75425 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75441))))

(assert (=> b!144097 (contains!919 (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75441)))

(declare-fun lt!75423 () Unit!4559)

(assert (=> b!144097 (= lt!75423 lt!75429)))

(declare-fun lt!75432 () ListLongMap!1721)

(assert (=> b!144097 (= lt!75432 (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun lt!75420 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75420 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75436 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75436 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75437 () Unit!4559)

(declare-fun addApplyDifferent!98 (ListLongMap!1721 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4559)

(assert (=> b!144097 (= lt!75437 (addApplyDifferent!98 lt!75432 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75436))))

(assert (=> b!144097 (= (apply!122 (+!169 lt!75432 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75436) (apply!122 lt!75432 lt!75436))))

(declare-fun lt!75424 () Unit!4559)

(assert (=> b!144097 (= lt!75424 lt!75437)))

(declare-fun lt!75427 () ListLongMap!1721)

(assert (=> b!144097 (= lt!75427 (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun lt!75440 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75422 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75422 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75435 () Unit!4559)

(assert (=> b!144097 (= lt!75435 (addApplyDifferent!98 lt!75427 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75422))))

(assert (=> b!144097 (= (apply!122 (+!169 lt!75427 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75422) (apply!122 lt!75427 lt!75422))))

(declare-fun lt!75428 () Unit!4559)

(assert (=> b!144097 (= lt!75428 lt!75435)))

(declare-fun lt!75426 () ListLongMap!1721)

(assert (=> b!144097 (= lt!75426 (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun lt!75439 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75439 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75421 () (_ BitVec 64))

(assert (=> b!144097 (= lt!75421 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!144097 (= lt!75430 (addApplyDifferent!98 lt!75426 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75421))))

(assert (=> b!144097 (= (apply!122 (+!169 lt!75426 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75421) (apply!122 lt!75426 lt!75421))))

(declare-fun b!144098 () Bool)

(declare-fun res!68581 () Bool)

(assert (=> b!144098 (=> (not res!68581) (not e!93913))))

(assert (=> b!144098 (= res!68581 e!93910)))

(declare-fun res!68579 () Bool)

(assert (=> b!144098 (=> res!68579 e!93910)))

(assert (=> b!144098 (= res!68579 (not e!93909))))

(declare-fun res!68587 () Bool)

(assert (=> b!144098 (=> (not res!68587) (not e!93909))))

(assert (=> b!144098 (= res!68587 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun b!144099 () Bool)

(assert (=> b!144099 (= e!93906 e!93916)))

(assert (=> b!144099 (= c!27298 (and (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144100 () Bool)

(assert (=> b!144100 (= e!93906 (+!169 call!15965 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun b!144101 () Bool)

(declare-fun res!68584 () Bool)

(assert (=> b!144101 (=> (not res!68584) (not e!93913))))

(assert (=> b!144101 (= res!68584 e!93914)))

(declare-fun c!27296 () Bool)

(assert (=> b!144101 (= c!27296 (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!45961 c!27294) b!144100))

(assert (= (and d!45961 (not c!27294)) b!144099))

(assert (= (and b!144099 c!27298) b!144081))

(assert (= (and b!144099 (not c!27298)) b!144084))

(assert (= (and b!144084 c!27299) b!144089))

(assert (= (and b!144084 (not c!27299)) b!144092))

(assert (= (or b!144089 b!144092) bm!15957))

(assert (= (or b!144081 bm!15957) bm!15962))

(assert (= (or b!144081 b!144089) bm!15958))

(assert (= (or b!144100 bm!15962) bm!15959))

(assert (= (or b!144100 bm!15958) bm!15956))

(assert (= (and d!45961 res!68583) b!144094))

(assert (= (and d!45961 c!27295) b!144097))

(assert (= (and d!45961 (not c!27295)) b!144087))

(assert (= (and d!45961 res!68586) b!144098))

(assert (= (and b!144098 res!68587) b!144096))

(assert (= (and b!144098 (not res!68579)) b!144093))

(assert (= (and b!144093 res!68585) b!144095))

(assert (= (and b!144098 res!68581) b!144101))

(assert (= (and b!144101 c!27296) b!144086))

(assert (= (and b!144101 (not c!27296)) b!144090))

(assert (= (and b!144086 res!68580) b!144088))

(assert (= (or b!144086 b!144090) bm!15960))

(assert (= (and b!144101 res!68584) b!144082))

(assert (= (and b!144082 c!27297) b!144083))

(assert (= (and b!144082 (not c!27297)) b!144085))

(assert (= (and b!144083 res!68582) b!144091))

(assert (= (or b!144083 b!144085) bm!15961))

(declare-fun b_lambda!6453 () Bool)

(assert (=> (not b_lambda!6453) (not b!144095)))

(assert (=> b!144095 t!6362))

(declare-fun b_and!8965 () Bool)

(assert (= b_and!8945 (and (=> t!6362 result!4223) b_and!8965)))

(assert (=> b!144095 t!6364))

(declare-fun b_and!8967 () Bool)

(assert (= b_and!8947 (and (=> t!6364 result!4227) b_and!8967)))

(declare-fun m!173469 () Bool)

(assert (=> b!144091 m!173469))

(assert (=> b!144094 m!173455))

(assert (=> b!144094 m!173455))

(declare-fun m!173471 () Bool)

(assert (=> b!144094 m!173471))

(declare-fun m!173473 () Bool)

(assert (=> bm!15959 m!173473))

(assert (=> b!144093 m!173455))

(assert (=> b!144093 m!173455))

(declare-fun m!173475 () Bool)

(assert (=> b!144093 m!173475))

(declare-fun m!173477 () Bool)

(assert (=> b!144088 m!173477))

(declare-fun m!173479 () Bool)

(assert (=> bm!15956 m!173479))

(declare-fun m!173481 () Bool)

(assert (=> b!144100 m!173481))

(assert (=> d!45961 m!173461))

(declare-fun m!173483 () Bool)

(assert (=> b!144097 m!173483))

(assert (=> b!144097 m!173473))

(declare-fun m!173485 () Bool)

(assert (=> b!144097 m!173485))

(declare-fun m!173487 () Bool)

(assert (=> b!144097 m!173487))

(declare-fun m!173489 () Bool)

(assert (=> b!144097 m!173489))

(declare-fun m!173491 () Bool)

(assert (=> b!144097 m!173491))

(declare-fun m!173493 () Bool)

(assert (=> b!144097 m!173493))

(assert (=> b!144097 m!173455))

(assert (=> b!144097 m!173485))

(declare-fun m!173495 () Bool)

(assert (=> b!144097 m!173495))

(assert (=> b!144097 m!173489))

(declare-fun m!173497 () Bool)

(assert (=> b!144097 m!173497))

(declare-fun m!173499 () Bool)

(assert (=> b!144097 m!173499))

(declare-fun m!173501 () Bool)

(assert (=> b!144097 m!173501))

(declare-fun m!173503 () Bool)

(assert (=> b!144097 m!173503))

(declare-fun m!173505 () Bool)

(assert (=> b!144097 m!173505))

(declare-fun m!173507 () Bool)

(assert (=> b!144097 m!173507))

(declare-fun m!173509 () Bool)

(assert (=> b!144097 m!173509))

(declare-fun m!173511 () Bool)

(assert (=> b!144097 m!173511))

(assert (=> b!144097 m!173497))

(assert (=> b!144097 m!173501))

(assert (=> b!144095 m!173455))

(declare-fun m!173513 () Bool)

(assert (=> b!144095 m!173513))

(declare-fun m!173515 () Bool)

(assert (=> b!144095 m!173515))

(assert (=> b!144095 m!173319))

(declare-fun m!173517 () Bool)

(assert (=> b!144095 m!173517))

(assert (=> b!144095 m!173455))

(assert (=> b!144095 m!173515))

(assert (=> b!144095 m!173319))

(assert (=> b!144096 m!173455))

(assert (=> b!144096 m!173455))

(assert (=> b!144096 m!173471))

(declare-fun m!173519 () Bool)

(assert (=> bm!15961 m!173519))

(declare-fun m!173521 () Bool)

(assert (=> bm!15960 m!173521))

(assert (=> b!143878 d!45961))

(declare-fun d!45963 () Bool)

(assert (=> d!45963 (= (array_inv!1479 (_keys!4739 newMap!16)) (bvsge (size!2589 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143864 d!45963))

(declare-fun d!45965 () Bool)

(assert (=> d!45965 (= (array_inv!1480 (_values!2958 newMap!16)) (bvsge (size!2590 (_values!2958 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143864 d!45965))

(declare-fun d!45967 () Bool)

(assert (=> d!45967 (= (valid!566 thiss!992) (valid!567 (v!3302 (underlying!482 thiss!992))))))

(declare-fun bs!6071 () Bool)

(assert (= bs!6071 d!45967))

(declare-fun m!173523 () Bool)

(assert (=> bs!6071 m!173523))

(assert (=> start!14974 d!45967))

(declare-fun d!45969 () Bool)

(declare-fun e!93923 () Bool)

(assert (=> d!45969 e!93923))

(declare-fun res!68590 () Bool)

(assert (=> d!45969 (=> res!68590 e!93923)))

(declare-fun lt!75452 () Bool)

(assert (=> d!45969 (= res!68590 (not lt!75452))))

(declare-fun lt!75450 () Bool)

(assert (=> d!45969 (= lt!75452 lt!75450)))

(declare-fun lt!75451 () Unit!4559)

(declare-fun e!93922 () Unit!4559)

(assert (=> d!45969 (= lt!75451 e!93922)))

(declare-fun c!27302 () Bool)

(assert (=> d!45969 (= c!27302 lt!75450)))

(declare-fun containsKey!180 (List!1749 (_ BitVec 64)) Bool)

(assert (=> d!45969 (= lt!75450 (containsKey!180 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45969 (= (contains!919 lt!75328 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) lt!75452)))

(declare-fun b!144108 () Bool)

(declare-fun lt!75453 () Unit!4559)

(assert (=> b!144108 (= e!93922 lt!75453)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!129 (List!1749 (_ BitVec 64)) Unit!4559)

(assert (=> b!144108 (= lt!75453 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-datatypes ((Option!182 0))(
  ( (Some!181 (v!3309 V!3569)) (None!180) )
))
(declare-fun isDefined!130 (Option!182) Bool)

(declare-fun getValueByKey!176 (List!1749 (_ BitVec 64)) Option!182)

(assert (=> b!144108 (isDefined!130 (getValueByKey!176 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144109 () Bool)

(declare-fun Unit!4564 () Unit!4559)

(assert (=> b!144109 (= e!93922 Unit!4564)))

(declare-fun b!144110 () Bool)

(assert (=> b!144110 (= e!93923 (isDefined!130 (getValueByKey!176 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))))

(assert (= (and d!45969 c!27302) b!144108))

(assert (= (and d!45969 (not c!27302)) b!144109))

(assert (= (and d!45969 (not res!68590)) b!144110))

(assert (=> d!45969 m!173309))

(declare-fun m!173525 () Bool)

(assert (=> d!45969 m!173525))

(assert (=> b!144108 m!173309))

(declare-fun m!173527 () Bool)

(assert (=> b!144108 m!173527))

(assert (=> b!144108 m!173309))

(declare-fun m!173529 () Bool)

(assert (=> b!144108 m!173529))

(assert (=> b!144108 m!173529))

(declare-fun m!173531 () Bool)

(assert (=> b!144108 m!173531))

(assert (=> b!144110 m!173309))

(assert (=> b!144110 m!173529))

(assert (=> b!144110 m!173529))

(assert (=> b!144110 m!173531))

(assert (=> b!143863 d!45969))

(declare-fun bm!16011 () Bool)

(declare-fun call!16033 () Bool)

(declare-fun call!16017 () Bool)

(assert (=> bm!16011 (= call!16033 call!16017)))

(declare-fun bm!16012 () Bool)

(declare-fun c!27333 () Bool)

(declare-fun c!27337 () Bool)

(assert (=> bm!16012 (= c!27333 c!27337)))

(declare-fun e!93978 () ListLongMap!1721)

(declare-fun call!16027 () Bool)

(assert (=> bm!16012 (= call!16027 (contains!919 e!93978 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun bm!16014 () Bool)

(declare-fun call!16020 () ListLongMap!1721)

(declare-fun call!16024 () ListLongMap!1721)

(assert (=> bm!16014 (= call!16020 call!16024)))

(declare-fun b!144191 () Bool)

(declare-fun res!68631 () Bool)

(declare-datatypes ((SeekEntryResult!284 0))(
  ( (MissingZero!284 (index!3301 (_ BitVec 32))) (Found!284 (index!3302 (_ BitVec 32))) (Intermediate!284 (undefined!1096 Bool) (index!3303 (_ BitVec 32)) (x!16426 (_ BitVec 32))) (Undefined!284) (MissingVacant!284 (index!3304 (_ BitVec 32))) )
))
(declare-fun lt!75516 () SeekEntryResult!284)

(assert (=> b!144191 (= res!68631 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3304 lt!75516)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93967 () Bool)

(assert (=> b!144191 (=> (not res!68631) (not e!93967))))

(declare-fun b!144192 () Bool)

(declare-fun res!68626 () Bool)

(declare-fun call!16028 () Bool)

(assert (=> b!144192 (= res!68626 call!16028)))

(declare-fun e!93969 () Bool)

(assert (=> b!144192 (=> (not res!68626) (not e!93969))))

(declare-fun b!144193 () Bool)

(declare-fun lt!75518 () Unit!4559)

(declare-fun lt!75533 () Unit!4559)

(assert (=> b!144193 (= lt!75518 lt!75533)))

(declare-fun call!16015 () ListLongMap!1721)

(assert (=> b!144193 (= call!16020 call!16015)))

(declare-fun lt!75513 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!67 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4559)

(assert (=> b!144193 (= lt!75533 (lemmaChangeZeroKeyThenAddPairToListMap!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) lt!75513 (zeroValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144193 (= lt!75513 (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!93984 () tuple2!2678)

(assert (=> b!144193 (= e!93984 (tuple2!2679 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7332 newMap!16) (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (_size!630 newMap!16) (_keys!4739 newMap!16) (_values!2958 newMap!16) (_vacant!630 newMap!16))))))

(declare-fun b!144194 () Bool)

(declare-fun e!93970 () Unit!4559)

(declare-fun lt!75508 () Unit!4559)

(assert (=> b!144194 (= e!93970 lt!75508)))

(declare-fun call!16016 () Unit!4559)

(assert (=> b!144194 (= lt!75508 call!16016)))

(declare-fun lt!75520 () SeekEntryResult!284)

(declare-fun call!16025 () SeekEntryResult!284)

(assert (=> b!144194 (= lt!75520 call!16025)))

(declare-fun res!68622 () Bool)

(assert (=> b!144194 (= res!68622 ((_ is Found!284) lt!75520))))

(declare-fun e!93979 () Bool)

(assert (=> b!144194 (=> (not res!68622) (not e!93979))))

(assert (=> b!144194 e!93979))

(declare-fun b!144195 () Bool)

(declare-fun call!16014 () ListLongMap!1721)

(assert (=> b!144195 (= e!93978 call!16014)))

(declare-fun b!144196 () Bool)

(declare-fun e!93975 () Unit!4559)

(declare-fun lt!75528 () Unit!4559)

(assert (=> b!144196 (= e!93975 lt!75528)))

(declare-fun call!16034 () Unit!4559)

(assert (=> b!144196 (= lt!75528 call!16034)))

(declare-fun call!16021 () SeekEntryResult!284)

(assert (=> b!144196 (= lt!75516 call!16021)))

(declare-fun c!27332 () Bool)

(assert (=> b!144196 (= c!27332 ((_ is MissingZero!284) lt!75516))))

(declare-fun e!93971 () Bool)

(assert (=> b!144196 e!93971))

(declare-fun bm!16015 () Bool)

(declare-fun call!16030 () ListLongMap!1721)

(assert (=> bm!16015 (= call!16015 call!16030)))

(declare-fun bm!16016 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4559)

(assert (=> bm!16016 (= call!16034 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(declare-fun call!16022 () ListLongMap!1721)

(declare-fun call!16035 () ListLongMap!1721)

(declare-fun bm!16017 () Bool)

(declare-fun c!27340 () Bool)

(declare-fun c!27329 () Bool)

(assert (=> bm!16017 (= call!16024 (+!169 (ite c!27329 (ite c!27340 call!16022 call!16015) call!16035) (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!144197 () Bool)

(declare-fun res!68629 () Bool)

(declare-fun e!93982 () Bool)

(assert (=> b!144197 (=> (not res!68629) (not e!93982))))

(declare-fun call!16031 () Bool)

(assert (=> b!144197 (= res!68629 call!16031)))

(assert (=> b!144197 (= e!93971 e!93982)))

(declare-fun b!144198 () Bool)

(assert (=> b!144198 (= e!93979 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75520)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144199 () Bool)

(declare-fun res!68624 () Bool)

(declare-fun e!93976 () Bool)

(assert (=> b!144199 (=> (not res!68624) (not e!93976))))

(declare-fun lt!75527 () SeekEntryResult!284)

(assert (=> b!144199 (= res!68624 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3301 lt!75527)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144200 () Bool)

(declare-fun Unit!4565 () Unit!4559)

(assert (=> b!144200 (= e!93970 Unit!4565)))

(declare-fun lt!75519 () Unit!4559)

(assert (=> b!144200 (= lt!75519 call!16034)))

(assert (=> b!144200 (= lt!75527 call!16025)))

(declare-fun c!27331 () Bool)

(assert (=> b!144200 (= c!27331 ((_ is MissingZero!284) lt!75527))))

(declare-fun e!93966 () Bool)

(assert (=> b!144200 e!93966))

(declare-fun lt!75529 () Unit!4559)

(assert (=> b!144200 (= lt!75529 lt!75519)))

(assert (=> b!144200 false))

(declare-fun b!144201 () Bool)

(declare-fun e!93972 () tuple2!2678)

(declare-fun e!93983 () tuple2!2678)

(assert (=> b!144201 (= e!93972 e!93983)))

(declare-fun lt!75532 () SeekEntryResult!284)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4901 (_ BitVec 32)) SeekEntryResult!284)

(assert (=> b!144201 (= lt!75532 (seekEntryOrOpen!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(assert (=> b!144201 (= c!27337 ((_ is Undefined!284) lt!75532))))

(declare-fun b!144202 () Bool)

(declare-fun e!93974 () Bool)

(declare-fun call!16036 () Bool)

(assert (=> b!144202 (= e!93974 (not call!16036))))

(declare-fun bm!16018 () Bool)

(declare-fun call!16026 () Bool)

(assert (=> bm!16018 (= call!16026 (arrayContainsKey!0 (_keys!4739 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144203 () Bool)

(declare-fun e!93985 () Bool)

(declare-fun e!93981 () Bool)

(assert (=> b!144203 (= e!93985 e!93981)))

(declare-fun res!68621 () Bool)

(declare-fun call!16032 () ListLongMap!1721)

(assert (=> b!144203 (= res!68621 (contains!919 call!16032 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!144203 (=> (not res!68621) (not e!93981))))

(declare-fun bm!16019 () Bool)

(declare-fun lt!75530 () array!4903)

(assert (=> bm!16019 (= call!16030 (getCurrentListMap!536 (_keys!4739 newMap!16) (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530) (mask!7332 newMap!16) (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bm!16020 () Bool)

(declare-fun call!16019 () Bool)

(assert (=> bm!16020 (= call!16019 call!16026)))

(declare-fun bm!16021 () Bool)

(declare-fun call!16018 () SeekEntryResult!284)

(assert (=> bm!16021 (= call!16021 call!16018)))

(declare-fun b!144204 () Bool)

(declare-fun res!68630 () Bool)

(assert (=> b!144204 (=> (not res!68630) (not e!93982))))

(assert (=> b!144204 (= res!68630 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3301 lt!75516)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144205 () Bool)

(declare-fun Unit!4566 () Unit!4559)

(assert (=> b!144205 (= e!93975 Unit!4566)))

(declare-fun lt!75511 () Unit!4559)

(assert (=> b!144205 (= lt!75511 call!16016)))

(declare-fun lt!75526 () SeekEntryResult!284)

(assert (=> b!144205 (= lt!75526 call!16021)))

(declare-fun res!68627 () Bool)

(assert (=> b!144205 (= res!68627 ((_ is Found!284) lt!75526))))

(assert (=> b!144205 (=> (not res!68627) (not e!93969))))

(assert (=> b!144205 e!93969))

(declare-fun lt!75510 () Unit!4559)

(assert (=> b!144205 (= lt!75510 lt!75511)))

(assert (=> b!144205 false))

(declare-fun b!144206 () Bool)

(declare-fun lt!75525 () Unit!4559)

(assert (=> b!144206 (= lt!75525 e!93975)))

(declare-fun c!27335 () Bool)

(assert (=> b!144206 (= c!27335 call!16027)))

(assert (=> b!144206 (= e!93983 (tuple2!2679 false newMap!16))))

(declare-fun bm!16022 () Bool)

(assert (=> bm!16022 (= call!16036 call!16026)))

(declare-fun bm!16023 () Bool)

(assert (=> bm!16023 (= call!16031 call!16028)))

(declare-fun b!144207 () Bool)

(assert (=> b!144207 (= e!93976 (not call!16036))))

(declare-fun b!144208 () Bool)

(declare-fun c!27338 () Bool)

(assert (=> b!144208 (= c!27338 ((_ is MissingVacant!284) lt!75527))))

(declare-fun e!93986 () Bool)

(assert (=> b!144208 (= e!93966 e!93986)))

(declare-fun b!144209 () Bool)

(declare-fun c!27330 () Bool)

(assert (=> b!144209 (= c!27330 ((_ is MissingVacant!284) lt!75516))))

(declare-fun e!93980 () Bool)

(assert (=> b!144209 (= e!93971 e!93980)))

(declare-fun bm!16024 () Bool)

(declare-fun call!16029 () Bool)

(assert (=> bm!16024 (= call!16029 call!16033)))

(declare-fun b!144210 () Bool)

(assert (=> b!144210 (= e!93969 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75526)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144211 () Bool)

(assert (=> b!144211 (= e!93980 e!93967)))

(declare-fun res!68619 () Bool)

(assert (=> b!144211 (= res!68619 call!16031)))

(assert (=> b!144211 (=> (not res!68619) (not e!93967))))

(declare-fun b!144212 () Bool)

(declare-fun lt!75515 () Unit!4559)

(declare-fun lt!75521 () Unit!4559)

(assert (=> b!144212 (= lt!75515 lt!75521)))

(assert (=> b!144212 (= call!16020 call!16022)))

(declare-fun lt!75517 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4559)

(assert (=> b!144212 (= lt!75521 (lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) lt!75517 (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144212 (= lt!75517 (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!144212 (= e!93984 (tuple2!2679 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7332 newMap!16) (bvor (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) (zeroValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!630 newMap!16) (_keys!4739 newMap!16) (_values!2958 newMap!16) (_vacant!630 newMap!16))))))

(declare-fun c!27341 () Bool)

(declare-fun call!16023 () tuple2!2678)

(declare-fun bm!16025 () Bool)

(declare-fun updateHelperNewKey!67 (LongMapFixedSize!1162 (_ BitVec 64) V!3569 (_ BitVec 32)) tuple2!2678)

(assert (=> bm!16025 (= call!16023 (updateHelperNewKey!67 newMap!16 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532))))))

(declare-fun b!144213 () Bool)

(declare-fun call!16037 () ListLongMap!1721)

(assert (=> b!144213 (= e!93985 (= call!16032 call!16037))))

(declare-fun b!144214 () Bool)

(assert (=> b!144214 (= e!93982 (not call!16019))))

(declare-fun b!144215 () Bool)

(assert (=> b!144215 (= e!93972 e!93984)))

(assert (=> b!144215 (= c!27340 (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16026 () Bool)

(assert (=> bm!16026 (= call!16018 (seekEntryOrOpen!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(declare-fun b!144216 () Bool)

(assert (=> b!144216 (= e!93981 (= call!16032 (+!169 call!16037 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!16027 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4559)

(assert (=> bm!16027 (= call!16016 (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(declare-fun b!144217 () Bool)

(declare-fun lt!75514 () tuple2!2678)

(assert (=> b!144217 (= lt!75514 call!16023)))

(declare-fun e!93968 () tuple2!2678)

(assert (=> b!144217 (= e!93968 (tuple2!2679 (_1!1350 lt!75514) (_2!1350 lt!75514)))))

(declare-fun b!144218 () Bool)

(declare-fun e!93973 () Bool)

(assert (=> b!144218 (= e!93973 e!93985)))

(declare-fun c!27334 () Bool)

(declare-fun lt!75509 () tuple2!2678)

(assert (=> b!144218 (= c!27334 (_1!1350 lt!75509))))

(declare-fun bm!16013 () Bool)

(assert (=> bm!16013 (= call!16022 call!16035)))

(declare-fun d!45971 () Bool)

(assert (=> d!45971 e!93973))

(declare-fun res!68625 () Bool)

(assert (=> d!45971 (=> (not res!68625) (not e!93973))))

(assert (=> d!45971 (= res!68625 (valid!567 (_2!1350 lt!75509)))))

(assert (=> d!45971 (= lt!75509 e!93972)))

(assert (=> d!45971 (= c!27329 (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvneg (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))))

(assert (=> d!45971 (valid!567 newMap!16)))

(assert (=> d!45971 (= (update!213 newMap!16 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!75509)))

(declare-fun b!144219 () Bool)

(declare-fun e!93977 () tuple2!2678)

(assert (=> b!144219 (= e!93977 e!93968)))

(declare-fun c!27336 () Bool)

(assert (=> b!144219 (= c!27336 ((_ is MissingZero!284) lt!75532))))

(declare-fun b!144220 () Bool)

(assert (=> b!144220 (= c!27341 ((_ is MissingVacant!284) lt!75532))))

(assert (=> b!144220 (= e!93983 e!93977)))

(declare-fun b!144221 () Bool)

(assert (=> b!144221 (= e!93980 ((_ is Undefined!284) lt!75516))))

(declare-fun b!144222 () Bool)

(declare-fun res!68620 () Bool)

(assert (=> b!144222 (=> (not res!68620) (not e!93976))))

(assert (=> b!144222 (= res!68620 call!16029)))

(assert (=> b!144222 (= e!93966 e!93976)))

(declare-fun b!144223 () Bool)

(assert (=> b!144223 (= e!93986 e!93974)))

(declare-fun res!68628 () Bool)

(assert (=> b!144223 (= res!68628 call!16029)))

(assert (=> b!144223 (=> (not res!68628) (not e!93974))))

(declare-fun bm!16028 () Bool)

(assert (=> bm!16028 (= call!16032 (map!1430 (_2!1350 lt!75509)))))

(declare-fun b!144224 () Bool)

(assert (=> b!144224 (= e!93986 ((_ is Undefined!284) lt!75527))))

(declare-fun b!144225 () Bool)

(declare-fun lt!75522 () Unit!4559)

(declare-fun lt!75524 () Unit!4559)

(assert (=> b!144225 (= lt!75522 lt!75524)))

(assert (=> b!144225 (contains!919 call!16014 (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75532)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!126 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) Unit!4559)

(assert (=> b!144225 (= lt!75524 (lemmaValidKeyInArrayIsInListMap!126 (_keys!4739 newMap!16) lt!75530 (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3302 lt!75532) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144225 (= lt!75530 (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))))))

(declare-fun lt!75534 () Unit!4559)

(declare-fun lt!75512 () Unit!4559)

(assert (=> b!144225 (= lt!75534 lt!75512)))

(assert (=> b!144225 (= call!16024 (getCurrentListMap!536 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) (_ BitVec 64) V!3569 Int) Unit!4559)

(assert (=> b!144225 (= lt!75512 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3302 lt!75532) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75523 () Unit!4559)

(assert (=> b!144225 (= lt!75523 e!93970)))

(declare-fun c!27339 () Bool)

(assert (=> b!144225 (= c!27339 call!16027)))

(assert (=> b!144225 (= e!93968 (tuple2!2679 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (_size!630 newMap!16) (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (_vacant!630 newMap!16))))))

(declare-fun bm!16029 () Bool)

(assert (=> bm!16029 (= call!16025 call!16018)))

(declare-fun b!144226 () Bool)

(assert (=> b!144226 (= e!93978 call!16035)))

(declare-fun bm!16030 () Bool)

(assert (=> bm!16030 (= call!16028 call!16017)))

(declare-fun bm!16031 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16031 (= call!16017 (inRange!0 (ite c!27337 (ite c!27335 (index!3302 lt!75526) (ite c!27332 (index!3301 lt!75516) (index!3304 lt!75516))) (ite c!27339 (index!3302 lt!75520) (ite c!27331 (index!3301 lt!75527) (index!3304 lt!75527)))) (mask!7332 newMap!16)))))

(declare-fun b!144227 () Bool)

(declare-fun res!68632 () Bool)

(assert (=> b!144227 (= res!68632 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3304 lt!75527)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144227 (=> (not res!68632) (not e!93974))))

(declare-fun bm!16032 () Bool)

(assert (=> bm!16032 (= call!16014 call!16030)))

(declare-fun bm!16033 () Bool)

(assert (=> bm!16033 (= call!16037 (map!1430 newMap!16))))

(declare-fun bm!16034 () Bool)

(assert (=> bm!16034 (= call!16035 (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) (zeroValue!2822 newMap!16) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun b!144228 () Bool)

(declare-fun lt!75531 () tuple2!2678)

(assert (=> b!144228 (= e!93977 (tuple2!2679 (_1!1350 lt!75531) (_2!1350 lt!75531)))))

(assert (=> b!144228 (= lt!75531 call!16023)))

(declare-fun b!144229 () Bool)

(declare-fun res!68623 () Bool)

(assert (=> b!144229 (= res!68623 call!16033)))

(assert (=> b!144229 (=> (not res!68623) (not e!93979))))

(declare-fun b!144230 () Bool)

(assert (=> b!144230 (= e!93967 (not call!16019))))

(assert (= (and d!45971 c!27329) b!144215))

(assert (= (and d!45971 (not c!27329)) b!144201))

(assert (= (and b!144215 c!27340) b!144193))

(assert (= (and b!144215 (not c!27340)) b!144212))

(assert (= (or b!144193 b!144212) bm!16015))

(assert (= (or b!144193 b!144212) bm!16013))

(assert (= (or b!144193 b!144212) bm!16014))

(assert (= (and b!144201 c!27337) b!144206))

(assert (= (and b!144201 (not c!27337)) b!144220))

(assert (= (and b!144206 c!27335) b!144205))

(assert (= (and b!144206 (not c!27335)) b!144196))

(assert (= (and b!144205 res!68627) b!144192))

(assert (= (and b!144192 res!68626) b!144210))

(assert (= (and b!144196 c!27332) b!144197))

(assert (= (and b!144196 (not c!27332)) b!144209))

(assert (= (and b!144197 res!68629) b!144204))

(assert (= (and b!144204 res!68630) b!144214))

(assert (= (and b!144209 c!27330) b!144211))

(assert (= (and b!144209 (not c!27330)) b!144221))

(assert (= (and b!144211 res!68619) b!144191))

(assert (= (and b!144191 res!68631) b!144230))

(assert (= (or b!144197 b!144211) bm!16023))

(assert (= (or b!144214 b!144230) bm!16020))

(assert (= (or b!144192 bm!16023) bm!16030))

(assert (= (or b!144205 b!144196) bm!16021))

(assert (= (and b!144220 c!27341) b!144228))

(assert (= (and b!144220 (not c!27341)) b!144219))

(assert (= (and b!144219 c!27336) b!144217))

(assert (= (and b!144219 (not c!27336)) b!144225))

(assert (= (and b!144225 c!27339) b!144194))

(assert (= (and b!144225 (not c!27339)) b!144200))

(assert (= (and b!144194 res!68622) b!144229))

(assert (= (and b!144229 res!68623) b!144198))

(assert (= (and b!144200 c!27331) b!144222))

(assert (= (and b!144200 (not c!27331)) b!144208))

(assert (= (and b!144222 res!68620) b!144199))

(assert (= (and b!144199 res!68624) b!144207))

(assert (= (and b!144208 c!27338) b!144223))

(assert (= (and b!144208 (not c!27338)) b!144224))

(assert (= (and b!144223 res!68628) b!144227))

(assert (= (and b!144227 res!68632) b!144202))

(assert (= (or b!144222 b!144223) bm!16024))

(assert (= (or b!144207 b!144202) bm!16022))

(assert (= (or b!144229 bm!16024) bm!16011))

(assert (= (or b!144194 b!144200) bm!16029))

(assert (= (or b!144228 b!144217) bm!16025))

(assert (= (or b!144206 b!144225) bm!16032))

(assert (= (or bm!16020 bm!16022) bm!16018))

(assert (= (or bm!16030 bm!16011) bm!16031))

(assert (= (or b!144196 b!144200) bm!16016))

(assert (= (or bm!16021 bm!16029) bm!16026))

(assert (= (or b!144205 b!144194) bm!16027))

(assert (= (or b!144206 b!144225) bm!16012))

(assert (= (and bm!16012 c!27333) b!144195))

(assert (= (and bm!16012 (not c!27333)) b!144226))

(assert (= (or bm!16013 b!144225 b!144226) bm!16034))

(assert (= (or bm!16015 bm!16032) bm!16019))

(assert (= (or bm!16014 b!144225) bm!16017))

(assert (= (and d!45971 res!68625) b!144218))

(assert (= (and b!144218 c!27334) b!144203))

(assert (= (and b!144218 (not c!27334)) b!144213))

(assert (= (and b!144203 res!68621) b!144216))

(assert (= (or b!144203 b!144216 b!144213) bm!16028))

(assert (= (or b!144216 b!144213) bm!16033))

(declare-fun m!173533 () Bool)

(assert (=> bm!16017 m!173533))

(declare-fun m!173535 () Bool)

(assert (=> b!144199 m!173535))

(assert (=> b!144212 m!173321))

(declare-fun m!173537 () Bool)

(assert (=> b!144212 m!173537))

(assert (=> bm!16016 m!173309))

(declare-fun m!173539 () Bool)

(assert (=> bm!16016 m!173539))

(assert (=> bm!16027 m!173309))

(declare-fun m!173541 () Bool)

(assert (=> bm!16027 m!173541))

(assert (=> bm!16012 m!173309))

(declare-fun m!173543 () Bool)

(assert (=> bm!16012 m!173543))

(declare-fun m!173545 () Bool)

(assert (=> bm!16034 m!173545))

(declare-fun m!173547 () Bool)

(assert (=> b!144198 m!173547))

(assert (=> bm!16025 m!173309))

(assert (=> bm!16025 m!173321))

(declare-fun m!173549 () Bool)

(assert (=> bm!16025 m!173549))

(assert (=> bm!16033 m!173345))

(declare-fun m!173551 () Bool)

(assert (=> b!144204 m!173551))

(assert (=> bm!16026 m!173309))

(declare-fun m!173553 () Bool)

(assert (=> bm!16026 m!173553))

(declare-fun m!173555 () Bool)

(assert (=> b!144227 m!173555))

(assert (=> bm!16018 m!173309))

(declare-fun m!173557 () Bool)

(assert (=> bm!16018 m!173557))

(declare-fun m!173559 () Bool)

(assert (=> bm!16019 m!173559))

(declare-fun m!173561 () Bool)

(assert (=> bm!16031 m!173561))

(declare-fun m!173563 () Bool)

(assert (=> d!45971 m!173563))

(assert (=> d!45971 m!173329))

(declare-fun m!173565 () Bool)

(assert (=> b!144210 m!173565))

(assert (=> b!144201 m!173309))

(assert (=> b!144201 m!173553))

(declare-fun m!173567 () Bool)

(assert (=> bm!16028 m!173567))

(declare-fun m!173569 () Bool)

(assert (=> b!144216 m!173569))

(assert (=> b!144225 m!173309))

(assert (=> b!144225 m!173321))

(declare-fun m!173571 () Bool)

(assert (=> b!144225 m!173571))

(declare-fun m!173573 () Bool)

(assert (=> b!144225 m!173573))

(declare-fun m!173575 () Bool)

(assert (=> b!144225 m!173575))

(assert (=> b!144225 m!173573))

(declare-fun m!173577 () Bool)

(assert (=> b!144225 m!173577))

(declare-fun m!173579 () Bool)

(assert (=> b!144225 m!173579))

(declare-fun m!173581 () Bool)

(assert (=> b!144225 m!173581))

(assert (=> b!144193 m!173321))

(declare-fun m!173583 () Bool)

(assert (=> b!144193 m!173583))

(assert (=> b!144203 m!173309))

(declare-fun m!173585 () Bool)

(assert (=> b!144203 m!173585))

(declare-fun m!173587 () Bool)

(assert (=> b!144191 m!173587))

(assert (=> b!143863 d!45971))

(declare-fun d!45973 () Bool)

(declare-fun c!27344 () Bool)

(assert (=> d!45973 (= c!27344 ((_ is ValueCellFull!1127) (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun e!93989 () V!3569)

(assert (=> d!45973 (= (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93989)))

(declare-fun b!144235 () Bool)

(declare-fun get!1540 (ValueCell!1127 V!3569) V!3569)

(assert (=> b!144235 (= e!93989 (get!1540 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144236 () Bool)

(declare-fun get!1541 (ValueCell!1127 V!3569) V!3569)

(assert (=> b!144236 (= e!93989 (get!1541 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45973 c!27344) b!144235))

(assert (= (and d!45973 (not c!27344)) b!144236))

(assert (=> b!144235 m!173317))

(assert (=> b!144235 m!173319))

(declare-fun m!173589 () Bool)

(assert (=> b!144235 m!173589))

(assert (=> b!144236 m!173317))

(assert (=> b!144236 m!173319))

(declare-fun m!173591 () Bool)

(assert (=> b!144236 m!173591))

(assert (=> b!143863 d!45973))

(declare-fun d!45975 () Bool)

(assert (=> d!45975 (= (array_inv!1479 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvsge (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143872 d!45975))

(declare-fun d!45977 () Bool)

(assert (=> d!45977 (= (array_inv!1480 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvsge (size!2590 (_values!2958 (v!3302 (underlying!482 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143872 d!45977))

(declare-fun d!45979 () Bool)

(declare-fun lt!75535 () Bool)

(assert (=> d!45979 (= lt!75535 (select (content!140 lt!75327) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93990 () Bool)

(assert (=> d!45979 (= lt!75535 e!93990)))

(declare-fun res!68634 () Bool)

(assert (=> d!45979 (=> (not res!68634) (not e!93990))))

(assert (=> d!45979 (= res!68634 ((_ is Cons!1746) lt!75327))))

(assert (=> d!45979 (= (contains!920 lt!75327 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75535)))

(declare-fun b!144237 () Bool)

(declare-fun e!93991 () Bool)

(assert (=> b!144237 (= e!93990 e!93991)))

(declare-fun res!68633 () Bool)

(assert (=> b!144237 (=> res!68633 e!93991)))

(assert (=> b!144237 (= res!68633 (= (h!2354 lt!75327) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144238 () Bool)

(assert (=> b!144238 (= e!93991 (contains!920 (t!6366 lt!75327) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!45979 res!68634) b!144237))

(assert (= (and b!144237 (not res!68633)) b!144238))

(assert (=> d!45979 m!173441))

(declare-fun m!173593 () Bool)

(assert (=> d!45979 m!173593))

(declare-fun m!173595 () Bool)

(assert (=> b!144238 m!173595))

(assert (=> b!143877 d!45979))

(declare-fun d!45981 () Bool)

(declare-fun res!68641 () Bool)

(declare-fun e!93994 () Bool)

(assert (=> d!45981 (=> (not res!68641) (not e!93994))))

(declare-fun simpleValid!98 (LongMapFixedSize!1162) Bool)

(assert (=> d!45981 (= res!68641 (simpleValid!98 newMap!16))))

(assert (=> d!45981 (= (valid!567 newMap!16) e!93994)))

(declare-fun b!144245 () Bool)

(declare-fun res!68642 () Bool)

(assert (=> b!144245 (=> (not res!68642) (not e!93994))))

(declare-fun arrayCountValidKeys!0 (array!4901 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!144245 (= res!68642 (= (arrayCountValidKeys!0 (_keys!4739 newMap!16) #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) (_size!630 newMap!16)))))

(declare-fun b!144246 () Bool)

(declare-fun res!68643 () Bool)

(assert (=> b!144246 (=> (not res!68643) (not e!93994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4901 (_ BitVec 32)) Bool)

(assert (=> b!144246 (= res!68643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(declare-fun b!144247 () Bool)

(assert (=> b!144247 (= e!93994 (arrayNoDuplicates!0 (_keys!4739 newMap!16) #b00000000000000000000000000000000 Nil!1747))))

(assert (= (and d!45981 res!68641) b!144245))

(assert (= (and b!144245 res!68642) b!144246))

(assert (= (and b!144246 res!68643) b!144247))

(declare-fun m!173597 () Bool)

(assert (=> d!45981 m!173597))

(declare-fun m!173599 () Bool)

(assert (=> b!144245 m!173599))

(declare-fun m!173601 () Bool)

(assert (=> b!144246 m!173601))

(declare-fun m!173603 () Bool)

(assert (=> b!144247 m!173603))

(assert (=> b!143867 d!45981))

(declare-fun mapIsEmpty!4895 () Bool)

(declare-fun mapRes!4895 () Bool)

(assert (=> mapIsEmpty!4895 mapRes!4895))

(declare-fun b!144255 () Bool)

(declare-fun e!93999 () Bool)

(assert (=> b!144255 (= e!93999 tp_is_empty!2941)))

(declare-fun condMapEmpty!4895 () Bool)

(declare-fun mapDefault!4895 () ValueCell!1127)

(assert (=> mapNonEmpty!4880 (= condMapEmpty!4895 (= mapRest!4880 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4895)))))

(assert (=> mapNonEmpty!4880 (= tp!11634 (and e!93999 mapRes!4895))))

(declare-fun mapNonEmpty!4895 () Bool)

(declare-fun tp!11663 () Bool)

(declare-fun e!94000 () Bool)

(assert (=> mapNonEmpty!4895 (= mapRes!4895 (and tp!11663 e!94000))))

(declare-fun mapValue!4895 () ValueCell!1127)

(declare-fun mapKey!4895 () (_ BitVec 32))

(declare-fun mapRest!4895 () (Array (_ BitVec 32) ValueCell!1127))

(assert (=> mapNonEmpty!4895 (= mapRest!4880 (store mapRest!4895 mapKey!4895 mapValue!4895))))

(declare-fun b!144254 () Bool)

(assert (=> b!144254 (= e!94000 tp_is_empty!2941)))

(assert (= (and mapNonEmpty!4880 condMapEmpty!4895) mapIsEmpty!4895))

(assert (= (and mapNonEmpty!4880 (not condMapEmpty!4895)) mapNonEmpty!4895))

(assert (= (and mapNonEmpty!4895 ((_ is ValueCellFull!1127) mapValue!4895)) b!144254))

(assert (= (and mapNonEmpty!4880 ((_ is ValueCellFull!1127) mapDefault!4895)) b!144255))

(declare-fun m!173605 () Bool)

(assert (=> mapNonEmpty!4895 m!173605))

(declare-fun mapIsEmpty!4896 () Bool)

(declare-fun mapRes!4896 () Bool)

(assert (=> mapIsEmpty!4896 mapRes!4896))

(declare-fun b!144257 () Bool)

(declare-fun e!94001 () Bool)

(assert (=> b!144257 (= e!94001 tp_is_empty!2941)))

(declare-fun condMapEmpty!4896 () Bool)

(declare-fun mapDefault!4896 () ValueCell!1127)

(assert (=> mapNonEmpty!4879 (= condMapEmpty!4896 (= mapRest!4879 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4896)))))

(assert (=> mapNonEmpty!4879 (= tp!11636 (and e!94001 mapRes!4896))))

(declare-fun mapNonEmpty!4896 () Bool)

(declare-fun tp!11664 () Bool)

(declare-fun e!94002 () Bool)

(assert (=> mapNonEmpty!4896 (= mapRes!4896 (and tp!11664 e!94002))))

(declare-fun mapKey!4896 () (_ BitVec 32))

(declare-fun mapRest!4896 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapValue!4896 () ValueCell!1127)

(assert (=> mapNonEmpty!4896 (= mapRest!4879 (store mapRest!4896 mapKey!4896 mapValue!4896))))

(declare-fun b!144256 () Bool)

(assert (=> b!144256 (= e!94002 tp_is_empty!2941)))

(assert (= (and mapNonEmpty!4879 condMapEmpty!4896) mapIsEmpty!4896))

(assert (= (and mapNonEmpty!4879 (not condMapEmpty!4896)) mapNonEmpty!4896))

(assert (= (and mapNonEmpty!4896 ((_ is ValueCellFull!1127) mapValue!4896)) b!144256))

(assert (= (and mapNonEmpty!4879 ((_ is ValueCellFull!1127) mapDefault!4896)) b!144257))

(declare-fun m!173607 () Bool)

(assert (=> mapNonEmpty!4896 m!173607))

(declare-fun b_lambda!6455 () Bool)

(assert (= b_lambda!6453 (or (and b!143872 b_free!3049) (and b!143864 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))))) b_lambda!6455)))

(check-sat (not b_next!3051) (not b!144245) (not b!144020) (not d!45959) (not b!144038) (not bm!15941) (not b!144026) (not bm!16034) (not bm!16027) (not d!45967) (not b!144037) (not d!45955) (not b!144212) (not bm!16018) (not b!144088) (not d!45947) (not b!144096) b_and!8967 (not b!144238) (not bm!16019) (not b!144247) (not bm!15961) tp_is_empty!2941 (not mapNonEmpty!4895) (not d!45961) (not b!144246) (not b!144031) (not b!144091) (not d!45979) (not bm!15956) (not b!144193) (not b!144019) (not b!144016) (not d!45969) (not bm!16025) (not b!144216) (not d!45971) b_and!8965 (not bm!16031) (not bm!16016) (not b_lambda!6451) (not b!144094) (not b!144203) (not b!144225) (not b!144095) (not b!144201) (not b!144097) (not b!144110) (not d!45981) (not bm!15960) (not bm!16012) (not b_next!3049) (not b!144093) (not b!144100) (not bm!16028) (not bm!16017) (not d!45951) (not b!144108) (not mapNonEmpty!4896) (not bm!16033) (not b!144235) (not b_lambda!6455) (not bm!15959) (not bm!16026) (not b!144236) (not b!144005))
(check-sat b_and!8965 b_and!8967 (not b_next!3049) (not b_next!3051))
(get-model)

(declare-fun d!45983 () Bool)

(declare-fun res!68644 () Bool)

(declare-fun e!94003 () Bool)

(assert (=> d!45983 (=> (not res!68644) (not e!94003))))

(assert (=> d!45983 (= res!68644 (simpleValid!98 (_2!1350 lt!75509)))))

(assert (=> d!45983 (= (valid!567 (_2!1350 lt!75509)) e!94003)))

(declare-fun b!144258 () Bool)

(declare-fun res!68645 () Bool)

(assert (=> b!144258 (=> (not res!68645) (not e!94003))))

(assert (=> b!144258 (= res!68645 (= (arrayCountValidKeys!0 (_keys!4739 (_2!1350 lt!75509)) #b00000000000000000000000000000000 (size!2589 (_keys!4739 (_2!1350 lt!75509)))) (_size!630 (_2!1350 lt!75509))))))

(declare-fun b!144259 () Bool)

(declare-fun res!68646 () Bool)

(assert (=> b!144259 (=> (not res!68646) (not e!94003))))

(assert (=> b!144259 (= res!68646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4739 (_2!1350 lt!75509)) (mask!7332 (_2!1350 lt!75509))))))

(declare-fun b!144260 () Bool)

(assert (=> b!144260 (= e!94003 (arrayNoDuplicates!0 (_keys!4739 (_2!1350 lt!75509)) #b00000000000000000000000000000000 Nil!1747))))

(assert (= (and d!45983 res!68644) b!144258))

(assert (= (and b!144258 res!68645) b!144259))

(assert (= (and b!144259 res!68646) b!144260))

(declare-fun m!173609 () Bool)

(assert (=> d!45983 m!173609))

(declare-fun m!173611 () Bool)

(assert (=> b!144258 m!173611))

(declare-fun m!173613 () Bool)

(assert (=> b!144259 m!173613))

(declare-fun m!173615 () Bool)

(assert (=> b!144260 m!173615))

(assert (=> d!45971 d!45983))

(assert (=> d!45971 d!45981))

(declare-fun d!45985 () Bool)

(declare-fun e!94006 () Bool)

(assert (=> d!45985 e!94006))

(declare-fun res!68651 () Bool)

(assert (=> d!45985 (=> (not res!68651) (not e!94006))))

(declare-fun lt!75544 () ListLongMap!1721)

(assert (=> d!45985 (= res!68651 (contains!919 lt!75544 (_1!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun lt!75546 () List!1749)

(assert (=> d!45985 (= lt!75544 (ListLongMap!1722 lt!75546))))

(declare-fun lt!75545 () Unit!4559)

(declare-fun lt!75547 () Unit!4559)

(assert (=> d!45985 (= lt!75545 lt!75547)))

(assert (=> d!45985 (= (getValueByKey!176 lt!75546 (_1!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!93 (List!1749 (_ BitVec 64) V!3569) Unit!4559)

(assert (=> d!45985 (= lt!75547 (lemmaContainsTupThenGetReturnValue!93 lt!75546 (_1!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun insertStrictlySorted!96 (List!1749 (_ BitVec 64) V!3569) List!1749)

(assert (=> d!45985 (= lt!75546 (insertStrictlySorted!96 (toList!876 call!15965) (_1!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!45985 (= (+!169 call!15965 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75544)))

(declare-fun b!144265 () Bool)

(declare-fun res!68652 () Bool)

(assert (=> b!144265 (=> (not res!68652) (not e!94006))))

(assert (=> b!144265 (= res!68652 (= (getValueByKey!176 (toList!876 lt!75544) (_1!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(declare-fun b!144266 () Bool)

(declare-fun contains!922 (List!1749 tuple2!2676) Bool)

(assert (=> b!144266 (= e!94006 (contains!922 (toList!876 lt!75544) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))

(assert (= (and d!45985 res!68651) b!144265))

(assert (= (and b!144265 res!68652) b!144266))

(declare-fun m!173617 () Bool)

(assert (=> d!45985 m!173617))

(declare-fun m!173619 () Bool)

(assert (=> d!45985 m!173619))

(declare-fun m!173621 () Bool)

(assert (=> d!45985 m!173621))

(declare-fun m!173623 () Bool)

(assert (=> d!45985 m!173623))

(declare-fun m!173625 () Bool)

(assert (=> b!144265 m!173625))

(declare-fun m!173627 () Bool)

(assert (=> b!144266 m!173627))

(assert (=> b!144100 d!45985))

(declare-fun call!16039 () ListLongMap!1721)

(declare-fun call!16040 () ListLongMap!1721)

(declare-fun call!16044 () ListLongMap!1721)

(declare-fun c!27345 () Bool)

(declare-fun c!27349 () Bool)

(declare-fun bm!16035 () Bool)

(declare-fun call!16042 () ListLongMap!1721)

(assert (=> bm!16035 (= call!16044 (+!169 (ite c!27345 call!16040 (ite c!27349 call!16042 call!16039)) (ite (or c!27345 c!27349) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 newMap!16)) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16))))))))

(declare-fun b!144267 () Bool)

(declare-fun e!94018 () ListLongMap!1721)

(declare-fun call!16038 () ListLongMap!1721)

(assert (=> b!144267 (= e!94018 call!16038)))

(declare-fun b!144268 () Bool)

(declare-fun e!94015 () Bool)

(declare-fun e!94013 () Bool)

(assert (=> b!144268 (= e!94015 e!94013)))

(declare-fun c!27348 () Bool)

(assert (=> b!144268 (= c!27348 (not (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144269 () Bool)

(declare-fun e!94009 () Bool)

(assert (=> b!144269 (= e!94013 e!94009)))

(declare-fun res!68656 () Bool)

(declare-fun call!16041 () Bool)

(assert (=> b!144269 (= res!68656 call!16041)))

(assert (=> b!144269 (=> (not res!68656) (not e!94009))))

(declare-fun bm!16036 () Bool)

(assert (=> bm!16036 (= call!16039 call!16042)))

(declare-fun c!27350 () Bool)

(declare-fun b!144270 () Bool)

(assert (=> b!144270 (= c!27350 (and (not (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94007 () ListLongMap!1721)

(assert (=> b!144270 (= e!94018 e!94007)))

(declare-fun b!144271 () Bool)

(assert (=> b!144271 (= e!94013 (not call!16041))))

(declare-fun d!45987 () Bool)

(assert (=> d!45987 e!94015))

(declare-fun res!68660 () Bool)

(assert (=> d!45987 (=> (not res!68660) (not e!94015))))

(assert (=> d!45987 (= res!68660 (or (bvsge #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))))

(declare-fun lt!75559 () ListLongMap!1721)

(declare-fun lt!75561 () ListLongMap!1721)

(assert (=> d!45987 (= lt!75559 lt!75561)))

(declare-fun lt!75562 () Unit!4559)

(declare-fun e!94017 () Unit!4559)

(assert (=> d!45987 (= lt!75562 e!94017)))

(declare-fun c!27346 () Bool)

(declare-fun e!94014 () Bool)

(assert (=> d!45987 (= c!27346 e!94014)))

(declare-fun res!68657 () Bool)

(assert (=> d!45987 (=> (not res!68657) (not e!94014))))

(assert (=> d!45987 (= res!68657 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun e!94008 () ListLongMap!1721)

(assert (=> d!45987 (= lt!75561 e!94008)))

(assert (=> d!45987 (= c!27345 (and (not (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45987 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!45987 (= (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) (zeroValue!2822 newMap!16) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) lt!75559)))

(declare-fun b!144272 () Bool)

(declare-fun e!94016 () Bool)

(declare-fun e!94019 () Bool)

(assert (=> b!144272 (= e!94016 e!94019)))

(declare-fun res!68654 () Bool)

(declare-fun call!16043 () Bool)

(assert (=> b!144272 (= res!68654 call!16043)))

(assert (=> b!144272 (=> (not res!68654) (not e!94019))))

(declare-fun b!144273 () Bool)

(declare-fun Unit!4567 () Unit!4559)

(assert (=> b!144273 (= e!94017 Unit!4567)))

(declare-fun bm!16037 () Bool)

(assert (=> bm!16037 (= call!16038 call!16044)))

(declare-fun b!144274 () Bool)

(assert (=> b!144274 (= e!94019 (= (apply!122 lt!75559 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2822 newMap!16)))))

(declare-fun b!144275 () Bool)

(assert (=> b!144275 (= e!94007 call!16038)))

(declare-fun bm!16038 () Bool)

(assert (=> bm!16038 (= call!16040 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) (zeroValue!2822 newMap!16) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bm!16039 () Bool)

(assert (=> bm!16039 (= call!16043 (contains!919 lt!75559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144276 () Bool)

(assert (=> b!144276 (= e!94016 (not call!16043))))

(declare-fun b!144277 () Bool)

(assert (=> b!144277 (= e!94009 (= (apply!122 lt!75559 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16))))))

(declare-fun b!144278 () Bool)

(assert (=> b!144278 (= e!94007 call!16039)))

(declare-fun bm!16040 () Bool)

(assert (=> bm!16040 (= call!16041 (contains!919 lt!75559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144279 () Bool)

(declare-fun e!94012 () Bool)

(declare-fun e!94010 () Bool)

(assert (=> b!144279 (= e!94012 e!94010)))

(declare-fun res!68659 () Bool)

(assert (=> b!144279 (=> (not res!68659) (not e!94010))))

(assert (=> b!144279 (= res!68659 (contains!919 lt!75559 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144280 () Bool)

(assert (=> b!144280 (= e!94014 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144281 () Bool)

(assert (=> b!144281 (= e!94010 (= (apply!122 lt!75559 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)) (get!1538 (select (arr!2315 (_values!2958 newMap!16)) #b00000000000000000000000000000000) (dynLambda!439 (defaultEntry!2975 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2590 (_values!2958 newMap!16))))))

(assert (=> b!144281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun bm!16041 () Bool)

(assert (=> bm!16041 (= call!16042 call!16040)))

(declare-fun b!144282 () Bool)

(declare-fun e!94011 () Bool)

(assert (=> b!144282 (= e!94011 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144283 () Bool)

(declare-fun lt!75558 () Unit!4559)

(assert (=> b!144283 (= e!94017 lt!75558)))

(declare-fun lt!75553 () ListLongMap!1721)

(assert (=> b!144283 (= lt!75553 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) (zeroValue!2822 newMap!16) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75566 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75569 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75569 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75557 () Unit!4559)

(assert (=> b!144283 (= lt!75557 (addStillContains!98 lt!75553 lt!75566 (zeroValue!2822 newMap!16) lt!75569))))

(assert (=> b!144283 (contains!919 (+!169 lt!75553 (tuple2!2677 lt!75566 (zeroValue!2822 newMap!16))) lt!75569)))

(declare-fun lt!75551 () Unit!4559)

(assert (=> b!144283 (= lt!75551 lt!75557)))

(declare-fun lt!75560 () ListLongMap!1721)

(assert (=> b!144283 (= lt!75560 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) (zeroValue!2822 newMap!16) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75548 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75548 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75564 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75564 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75565 () Unit!4559)

(assert (=> b!144283 (= lt!75565 (addApplyDifferent!98 lt!75560 lt!75548 (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) lt!75564))))

(assert (=> b!144283 (= (apply!122 (+!169 lt!75560 (tuple2!2677 lt!75548 (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)))) lt!75564) (apply!122 lt!75560 lt!75564))))

(declare-fun lt!75552 () Unit!4559)

(assert (=> b!144283 (= lt!75552 lt!75565)))

(declare-fun lt!75555 () ListLongMap!1721)

(assert (=> b!144283 (= lt!75555 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) (zeroValue!2822 newMap!16) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75568 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75550 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75550 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75563 () Unit!4559)

(assert (=> b!144283 (= lt!75563 (addApplyDifferent!98 lt!75555 lt!75568 (zeroValue!2822 newMap!16) lt!75550))))

(assert (=> b!144283 (= (apply!122 (+!169 lt!75555 (tuple2!2677 lt!75568 (zeroValue!2822 newMap!16))) lt!75550) (apply!122 lt!75555 lt!75550))))

(declare-fun lt!75556 () Unit!4559)

(assert (=> b!144283 (= lt!75556 lt!75563)))

(declare-fun lt!75554 () ListLongMap!1721)

(assert (=> b!144283 (= lt!75554 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) (zeroValue!2822 newMap!16) (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75567 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75549 () (_ BitVec 64))

(assert (=> b!144283 (= lt!75549 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144283 (= lt!75558 (addApplyDifferent!98 lt!75554 lt!75567 (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)) lt!75549))))

(assert (=> b!144283 (= (apply!122 (+!169 lt!75554 (tuple2!2677 lt!75567 (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)))) lt!75549) (apply!122 lt!75554 lt!75549))))

(declare-fun b!144284 () Bool)

(declare-fun res!68655 () Bool)

(assert (=> b!144284 (=> (not res!68655) (not e!94015))))

(assert (=> b!144284 (= res!68655 e!94012)))

(declare-fun res!68653 () Bool)

(assert (=> b!144284 (=> res!68653 e!94012)))

(assert (=> b!144284 (= res!68653 (not e!94011))))

(declare-fun res!68661 () Bool)

(assert (=> b!144284 (=> (not res!68661) (not e!94011))))

(assert (=> b!144284 (= res!68661 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144285 () Bool)

(assert (=> b!144285 (= e!94008 e!94018)))

(assert (=> b!144285 (= c!27349 (and (not (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144286 () Bool)

(assert (=> b!144286 (= e!94008 (+!169 call!16044 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27329 (ite c!27340 (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2822 newMap!16)))))))

(declare-fun b!144287 () Bool)

(declare-fun res!68658 () Bool)

(assert (=> b!144287 (=> (not res!68658) (not e!94015))))

(assert (=> b!144287 (= res!68658 e!94016)))

(declare-fun c!27347 () Bool)

(assert (=> b!144287 (= c!27347 (not (= (bvand (ite c!27329 (ite c!27340 (extraKeys!2724 newMap!16) lt!75517) (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!45987 c!27345) b!144286))

(assert (= (and d!45987 (not c!27345)) b!144285))

(assert (= (and b!144285 c!27349) b!144267))

(assert (= (and b!144285 (not c!27349)) b!144270))

(assert (= (and b!144270 c!27350) b!144275))

(assert (= (and b!144270 (not c!27350)) b!144278))

(assert (= (or b!144275 b!144278) bm!16036))

(assert (= (or b!144267 bm!16036) bm!16041))

(assert (= (or b!144267 b!144275) bm!16037))

(assert (= (or b!144286 bm!16041) bm!16038))

(assert (= (or b!144286 bm!16037) bm!16035))

(assert (= (and d!45987 res!68657) b!144280))

(assert (= (and d!45987 c!27346) b!144283))

(assert (= (and d!45987 (not c!27346)) b!144273))

(assert (= (and d!45987 res!68660) b!144284))

(assert (= (and b!144284 res!68661) b!144282))

(assert (= (and b!144284 (not res!68653)) b!144279))

(assert (= (and b!144279 res!68659) b!144281))

(assert (= (and b!144284 res!68655) b!144287))

(assert (= (and b!144287 c!27347) b!144272))

(assert (= (and b!144287 (not c!27347)) b!144276))

(assert (= (and b!144272 res!68654) b!144274))

(assert (= (or b!144272 b!144276) bm!16039))

(assert (= (and b!144287 res!68658) b!144268))

(assert (= (and b!144268 c!27348) b!144269))

(assert (= (and b!144268 (not c!27348)) b!144271))

(assert (= (and b!144269 res!68656) b!144277))

(assert (= (or b!144269 b!144271) bm!16040))

(declare-fun b_lambda!6457 () Bool)

(assert (=> (not b_lambda!6457) (not b!144281)))

(declare-fun tb!2589 () Bool)

(declare-fun t!6379 () Bool)

(assert (=> (and b!143872 (= (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) (defaultEntry!2975 newMap!16)) t!6379) tb!2589))

(declare-fun result!4243 () Bool)

(assert (=> tb!2589 (= result!4243 tp_is_empty!2941)))

(assert (=> b!144281 t!6379))

(declare-fun b_and!8969 () Bool)

(assert (= b_and!8965 (and (=> t!6379 result!4243) b_and!8969)))

(declare-fun t!6381 () Bool)

(declare-fun tb!2591 () Bool)

(assert (=> (and b!143864 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 newMap!16)) t!6381) tb!2591))

(declare-fun result!4245 () Bool)

(assert (= result!4245 result!4243))

(assert (=> b!144281 t!6381))

(declare-fun b_and!8971 () Bool)

(assert (= b_and!8967 (and (=> t!6381 result!4245) b_and!8971)))

(declare-fun m!173629 () Bool)

(assert (=> b!144277 m!173629))

(declare-fun m!173631 () Bool)

(assert (=> b!144280 m!173631))

(assert (=> b!144280 m!173631))

(declare-fun m!173633 () Bool)

(assert (=> b!144280 m!173633))

(declare-fun m!173635 () Bool)

(assert (=> bm!16038 m!173635))

(assert (=> b!144279 m!173631))

(assert (=> b!144279 m!173631))

(declare-fun m!173637 () Bool)

(assert (=> b!144279 m!173637))

(declare-fun m!173639 () Bool)

(assert (=> b!144274 m!173639))

(declare-fun m!173641 () Bool)

(assert (=> bm!16035 m!173641))

(declare-fun m!173643 () Bool)

(assert (=> b!144286 m!173643))

(declare-fun m!173645 () Bool)

(assert (=> d!45987 m!173645))

(declare-fun m!173647 () Bool)

(assert (=> b!144283 m!173647))

(assert (=> b!144283 m!173635))

(declare-fun m!173649 () Bool)

(assert (=> b!144283 m!173649))

(declare-fun m!173651 () Bool)

(assert (=> b!144283 m!173651))

(declare-fun m!173653 () Bool)

(assert (=> b!144283 m!173653))

(declare-fun m!173655 () Bool)

(assert (=> b!144283 m!173655))

(declare-fun m!173657 () Bool)

(assert (=> b!144283 m!173657))

(assert (=> b!144283 m!173631))

(assert (=> b!144283 m!173649))

(declare-fun m!173659 () Bool)

(assert (=> b!144283 m!173659))

(assert (=> b!144283 m!173653))

(declare-fun m!173661 () Bool)

(assert (=> b!144283 m!173661))

(declare-fun m!173663 () Bool)

(assert (=> b!144283 m!173663))

(declare-fun m!173665 () Bool)

(assert (=> b!144283 m!173665))

(declare-fun m!173667 () Bool)

(assert (=> b!144283 m!173667))

(declare-fun m!173669 () Bool)

(assert (=> b!144283 m!173669))

(declare-fun m!173671 () Bool)

(assert (=> b!144283 m!173671))

(declare-fun m!173673 () Bool)

(assert (=> b!144283 m!173673))

(declare-fun m!173675 () Bool)

(assert (=> b!144283 m!173675))

(assert (=> b!144283 m!173661))

(assert (=> b!144283 m!173665))

(assert (=> b!144281 m!173631))

(declare-fun m!173677 () Bool)

(assert (=> b!144281 m!173677))

(declare-fun m!173679 () Bool)

(assert (=> b!144281 m!173679))

(declare-fun m!173681 () Bool)

(assert (=> b!144281 m!173681))

(declare-fun m!173683 () Bool)

(assert (=> b!144281 m!173683))

(assert (=> b!144281 m!173631))

(assert (=> b!144281 m!173679))

(assert (=> b!144281 m!173681))

(assert (=> b!144282 m!173631))

(assert (=> b!144282 m!173631))

(assert (=> b!144282 m!173633))

(declare-fun m!173685 () Bool)

(assert (=> bm!16040 m!173685))

(declare-fun m!173687 () Bool)

(assert (=> bm!16039 m!173687))

(assert (=> bm!16034 d!45987))

(declare-fun d!45989 () Bool)

(declare-fun e!94020 () Bool)

(assert (=> d!45989 e!94020))

(declare-fun res!68662 () Bool)

(assert (=> d!45989 (=> (not res!68662) (not e!94020))))

(declare-fun lt!75570 () ListLongMap!1721)

(assert (=> d!45989 (= res!68662 (contains!919 lt!75570 (_1!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!75572 () List!1749)

(assert (=> d!45989 (= lt!75570 (ListLongMap!1722 lt!75572))))

(declare-fun lt!75571 () Unit!4559)

(declare-fun lt!75573 () Unit!4559)

(assert (=> d!45989 (= lt!75571 lt!75573)))

(assert (=> d!45989 (= (getValueByKey!176 lt!75572 (_1!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!181 (_2!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45989 (= lt!75573 (lemmaContainsTupThenGetReturnValue!93 lt!75572 (_1!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45989 (= lt!75572 (insertStrictlySorted!96 (toList!876 call!16037) (_1!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45989 (= (+!169 call!16037 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!75570)))

(declare-fun b!144288 () Bool)

(declare-fun res!68663 () Bool)

(assert (=> b!144288 (=> (not res!68663) (not e!94020))))

(assert (=> b!144288 (= res!68663 (= (getValueByKey!176 (toList!876 lt!75570) (_1!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!181 (_2!1349 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!144289 () Bool)

(assert (=> b!144289 (= e!94020 (contains!922 (toList!876 lt!75570) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!45989 res!68662) b!144288))

(assert (= (and b!144288 res!68663) b!144289))

(declare-fun m!173689 () Bool)

(assert (=> d!45989 m!173689))

(declare-fun m!173691 () Bool)

(assert (=> d!45989 m!173691))

(declare-fun m!173693 () Bool)

(assert (=> d!45989 m!173693))

(declare-fun m!173695 () Bool)

(assert (=> d!45989 m!173695))

(declare-fun m!173697 () Bool)

(assert (=> b!144288 m!173697))

(declare-fun m!173699 () Bool)

(assert (=> b!144289 m!173699))

(assert (=> b!144216 d!45989))

(declare-fun d!45991 () Bool)

(declare-fun e!94022 () Bool)

(assert (=> d!45991 e!94022))

(declare-fun res!68664 () Bool)

(assert (=> d!45991 (=> res!68664 e!94022)))

(declare-fun lt!75576 () Bool)

(assert (=> d!45991 (= res!68664 (not lt!75576))))

(declare-fun lt!75574 () Bool)

(assert (=> d!45991 (= lt!75576 lt!75574)))

(declare-fun lt!75575 () Unit!4559)

(declare-fun e!94021 () Unit!4559)

(assert (=> d!45991 (= lt!75575 e!94021)))

(declare-fun c!27351 () Bool)

(assert (=> d!45991 (= c!27351 lt!75574)))

(assert (=> d!45991 (= lt!75574 (containsKey!180 (toList!876 call!16032) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!45991 (= (contains!919 call!16032 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) lt!75576)))

(declare-fun b!144290 () Bool)

(declare-fun lt!75577 () Unit!4559)

(assert (=> b!144290 (= e!94021 lt!75577)))

(assert (=> b!144290 (= lt!75577 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 call!16032) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!144290 (isDefined!130 (getValueByKey!176 (toList!876 call!16032) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144291 () Bool)

(declare-fun Unit!4568 () Unit!4559)

(assert (=> b!144291 (= e!94021 Unit!4568)))

(declare-fun b!144292 () Bool)

(assert (=> b!144292 (= e!94022 (isDefined!130 (getValueByKey!176 (toList!876 call!16032) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))))

(assert (= (and d!45991 c!27351) b!144290))

(assert (= (and d!45991 (not c!27351)) b!144291))

(assert (= (and d!45991 (not res!68664)) b!144292))

(assert (=> d!45991 m!173309))

(declare-fun m!173701 () Bool)

(assert (=> d!45991 m!173701))

(assert (=> b!144290 m!173309))

(declare-fun m!173703 () Bool)

(assert (=> b!144290 m!173703))

(assert (=> b!144290 m!173309))

(declare-fun m!173705 () Bool)

(assert (=> b!144290 m!173705))

(assert (=> b!144290 m!173705))

(declare-fun m!173707 () Bool)

(assert (=> b!144290 m!173707))

(assert (=> b!144292 m!173309))

(assert (=> b!144292 m!173705))

(assert (=> b!144292 m!173705))

(assert (=> b!144292 m!173707))

(assert (=> b!144203 d!45991))

(declare-fun d!45993 () Bool)

(assert (=> d!45993 (= (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (and (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144019 d!45993))

(declare-fun d!45995 () Bool)

(declare-fun e!94023 () Bool)

(assert (=> d!45995 e!94023))

(declare-fun res!68665 () Bool)

(assert (=> d!45995 (=> (not res!68665) (not e!94023))))

(declare-fun lt!75578 () ListLongMap!1721)

(assert (=> d!45995 (= res!68665 (contains!919 lt!75578 (_1!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!75580 () List!1749)

(assert (=> d!45995 (= lt!75578 (ListLongMap!1722 lt!75580))))

(declare-fun lt!75579 () Unit!4559)

(declare-fun lt!75581 () Unit!4559)

(assert (=> d!45995 (= lt!75579 lt!75581)))

(assert (=> d!45995 (= (getValueByKey!176 lt!75580 (_1!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!181 (_2!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45995 (= lt!75581 (lemmaContainsTupThenGetReturnValue!93 lt!75580 (_1!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45995 (= lt!75580 (insertStrictlySorted!96 (toList!876 (ite c!27329 (ite c!27340 call!16022 call!16015) call!16035)) (_1!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45995 (= (+!169 (ite c!27329 (ite c!27340 call!16022 call!16015) call!16035) (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!75578)))

(declare-fun b!144293 () Bool)

(declare-fun res!68666 () Bool)

(assert (=> b!144293 (=> (not res!68666) (not e!94023))))

(assert (=> b!144293 (= res!68666 (= (getValueByKey!176 (toList!876 lt!75578) (_1!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!181 (_2!1349 (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!144294 () Bool)

(assert (=> b!144294 (= e!94023 (contains!922 (toList!876 lt!75578) (ite c!27329 (ite c!27340 (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!45995 res!68665) b!144293))

(assert (= (and b!144293 res!68666) b!144294))

(declare-fun m!173709 () Bool)

(assert (=> d!45995 m!173709))

(declare-fun m!173711 () Bool)

(assert (=> d!45995 m!173711))

(declare-fun m!173713 () Bool)

(assert (=> d!45995 m!173713))

(declare-fun m!173715 () Bool)

(assert (=> d!45995 m!173715))

(declare-fun m!173717 () Bool)

(assert (=> b!144293 m!173717))

(declare-fun m!173719 () Bool)

(assert (=> b!144294 m!173719))

(assert (=> bm!16017 d!45995))

(declare-fun d!45997 () Bool)

(declare-fun get!1542 (Option!182) V!3569)

(assert (=> d!45997 (= (apply!122 lt!75431 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1542 (getValueByKey!176 (toList!876 lt!75431) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6072 () Bool)

(assert (= bs!6072 d!45997))

(assert (=> bs!6072 m!173455))

(declare-fun m!173721 () Bool)

(assert (=> bs!6072 m!173721))

(assert (=> bs!6072 m!173721))

(declare-fun m!173723 () Bool)

(assert (=> bs!6072 m!173723))

(assert (=> b!144095 d!45997))

(declare-fun d!45999 () Bool)

(declare-fun c!27352 () Bool)

(assert (=> d!45999 (= c!27352 ((_ is ValueCellFull!1127) (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94024 () V!3569)

(assert (=> d!45999 (= (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94024)))

(declare-fun b!144295 () Bool)

(assert (=> b!144295 (= e!94024 (get!1540 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144296 () Bool)

(assert (=> b!144296 (= e!94024 (get!1541 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45999 c!27352) b!144295))

(assert (= (and d!45999 (not c!27352)) b!144296))

(assert (=> b!144295 m!173515))

(assert (=> b!144295 m!173319))

(declare-fun m!173725 () Bool)

(assert (=> b!144295 m!173725))

(assert (=> b!144296 m!173515))

(assert (=> b!144296 m!173319))

(declare-fun m!173727 () Bool)

(assert (=> b!144296 m!173727))

(assert (=> b!144095 d!45999))

(declare-fun b!144305 () Bool)

(declare-fun e!94030 () (_ BitVec 32))

(declare-fun call!16047 () (_ BitVec 32))

(assert (=> b!144305 (= e!94030 call!16047)))

(declare-fun b!144306 () Bool)

(declare-fun e!94029 () (_ BitVec 32))

(assert (=> b!144306 (= e!94029 e!94030)))

(declare-fun c!27357 () Bool)

(assert (=> b!144306 (= c!27357 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!46001 () Bool)

(declare-fun lt!75584 () (_ BitVec 32))

(assert (=> d!46001 (and (bvsge lt!75584 #b00000000000000000000000000000000) (bvsle lt!75584 (bvsub (size!2589 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!46001 (= lt!75584 e!94029)))

(declare-fun c!27358 () Bool)

(assert (=> d!46001 (= c!27358 (bvsge #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(assert (=> d!46001 (and (bvsle #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2589 (_keys!4739 newMap!16)) (size!2589 (_keys!4739 newMap!16))))))

(assert (=> d!46001 (= (arrayCountValidKeys!0 (_keys!4739 newMap!16) #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) lt!75584)))

(declare-fun bm!16044 () Bool)

(assert (=> bm!16044 (= call!16047 (arrayCountValidKeys!0 (_keys!4739 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144307 () Bool)

(assert (=> b!144307 (= e!94030 (bvadd #b00000000000000000000000000000001 call!16047))))

(declare-fun b!144308 () Bool)

(assert (=> b!144308 (= e!94029 #b00000000000000000000000000000000)))

(assert (= (and d!46001 c!27358) b!144308))

(assert (= (and d!46001 (not c!27358)) b!144306))

(assert (= (and b!144306 c!27357) b!144307))

(assert (= (and b!144306 (not c!27357)) b!144305))

(assert (= (or b!144307 b!144305) bm!16044))

(assert (=> b!144306 m!173631))

(assert (=> b!144306 m!173631))

(assert (=> b!144306 m!173633))

(declare-fun m!173729 () Bool)

(assert (=> bm!16044 m!173729))

(assert (=> b!144245 d!46001))

(declare-fun d!46003 () Bool)

(assert (=> d!46003 (= (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144096 d!46003))

(declare-fun b!144309 () Bool)

(declare-fun e!94032 () Bool)

(assert (=> b!144309 (= e!94032 (contains!920 Nil!1747 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16045 () Bool)

(declare-fun call!16048 () Bool)

(declare-fun c!27359 () Bool)

(assert (=> bm!16045 (= call!16048 (arrayNoDuplicates!0 (_keys!4739 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27359 (Cons!1746 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000) Nil!1747) Nil!1747)))))

(declare-fun b!144311 () Bool)

(declare-fun e!94034 () Bool)

(assert (=> b!144311 (= e!94034 call!16048)))

(declare-fun b!144312 () Bool)

(declare-fun e!94031 () Bool)

(assert (=> b!144312 (= e!94031 e!94034)))

(assert (=> b!144312 (= c!27359 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144313 () Bool)

(declare-fun e!94033 () Bool)

(assert (=> b!144313 (= e!94033 e!94031)))

(declare-fun res!68668 () Bool)

(assert (=> b!144313 (=> (not res!68668) (not e!94031))))

(assert (=> b!144313 (= res!68668 (not e!94032))))

(declare-fun res!68667 () Bool)

(assert (=> b!144313 (=> (not res!68667) (not e!94032))))

(assert (=> b!144313 (= res!68667 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144310 () Bool)

(assert (=> b!144310 (= e!94034 call!16048)))

(declare-fun d!46005 () Bool)

(declare-fun res!68669 () Bool)

(assert (=> d!46005 (=> res!68669 e!94033)))

(assert (=> d!46005 (= res!68669 (bvsge #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(assert (=> d!46005 (= (arrayNoDuplicates!0 (_keys!4739 newMap!16) #b00000000000000000000000000000000 Nil!1747) e!94033)))

(assert (= (and d!46005 (not res!68669)) b!144313))

(assert (= (and b!144313 res!68667) b!144309))

(assert (= (and b!144313 res!68668) b!144312))

(assert (= (and b!144312 c!27359) b!144311))

(assert (= (and b!144312 (not c!27359)) b!144310))

(assert (= (or b!144311 b!144310) bm!16045))

(assert (=> b!144309 m!173631))

(assert (=> b!144309 m!173631))

(declare-fun m!173731 () Bool)

(assert (=> b!144309 m!173731))

(assert (=> bm!16045 m!173631))

(declare-fun m!173733 () Bool)

(assert (=> bm!16045 m!173733))

(assert (=> b!144312 m!173631))

(assert (=> b!144312 m!173631))

(assert (=> b!144312 m!173633))

(assert (=> b!144313 m!173631))

(assert (=> b!144313 m!173631))

(assert (=> b!144313 m!173633))

(assert (=> b!144247 d!46005))

(declare-fun d!46007 () Bool)

(assert (=> d!46007 (= (inRange!0 (ite c!27337 (ite c!27335 (index!3302 lt!75526) (ite c!27332 (index!3301 lt!75516) (index!3304 lt!75516))) (ite c!27339 (index!3302 lt!75520) (ite c!27331 (index!3301 lt!75527) (index!3304 lt!75527)))) (mask!7332 newMap!16)) (and (bvsge (ite c!27337 (ite c!27335 (index!3302 lt!75526) (ite c!27332 (index!3301 lt!75516) (index!3304 lt!75516))) (ite c!27339 (index!3302 lt!75520) (ite c!27331 (index!3301 lt!75527) (index!3304 lt!75527)))) #b00000000000000000000000000000000) (bvslt (ite c!27337 (ite c!27335 (index!3302 lt!75526) (ite c!27332 (index!3301 lt!75516) (index!3304 lt!75516))) (ite c!27339 (index!3302 lt!75520) (ite c!27331 (index!3301 lt!75527) (index!3304 lt!75527)))) (bvadd (mask!7332 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!16031 d!46007))

(declare-fun d!46009 () Bool)

(assert (=> d!46009 (= (+!169 (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) lt!75517 (zeroValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75587 () Unit!4559)

(declare-fun choose!887 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4559)

(assert (=> d!46009 (= lt!75587 (choose!887 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) lt!75517 (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46009 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46009 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) lt!75517 (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)) lt!75587)))

(declare-fun bs!6073 () Bool)

(assert (= bs!6073 d!46009))

(assert (=> bs!6073 m!173467))

(assert (=> bs!6073 m!173467))

(declare-fun m!173735 () Bool)

(assert (=> bs!6073 m!173735))

(assert (=> bs!6073 m!173321))

(declare-fun m!173737 () Bool)

(assert (=> bs!6073 m!173737))

(assert (=> bs!6073 m!173321))

(declare-fun m!173739 () Bool)

(assert (=> bs!6073 m!173739))

(assert (=> bs!6073 m!173645))

(assert (=> b!144212 d!46009))

(declare-fun d!46011 () Bool)

(declare-fun lt!75588 () Bool)

(assert (=> d!46011 (= lt!75588 (select (content!140 (t!6366 lt!75327)) (h!2354 lt!75327)))))

(declare-fun e!94035 () Bool)

(assert (=> d!46011 (= lt!75588 e!94035)))

(declare-fun res!68671 () Bool)

(assert (=> d!46011 (=> (not res!68671) (not e!94035))))

(assert (=> d!46011 (= res!68671 ((_ is Cons!1746) (t!6366 lt!75327)))))

(assert (=> d!46011 (= (contains!920 (t!6366 lt!75327) (h!2354 lt!75327)) lt!75588)))

(declare-fun b!144314 () Bool)

(declare-fun e!94036 () Bool)

(assert (=> b!144314 (= e!94035 e!94036)))

(declare-fun res!68670 () Bool)

(assert (=> b!144314 (=> res!68670 e!94036)))

(assert (=> b!144314 (= res!68670 (= (h!2354 (t!6366 lt!75327)) (h!2354 lt!75327)))))

(declare-fun b!144315 () Bool)

(assert (=> b!144315 (= e!94036 (contains!920 (t!6366 (t!6366 lt!75327)) (h!2354 lt!75327)))))

(assert (= (and d!46011 res!68671) b!144314))

(assert (= (and b!144314 (not res!68670)) b!144315))

(declare-fun m!173741 () Bool)

(assert (=> d!46011 m!173741))

(declare-fun m!173743 () Bool)

(assert (=> d!46011 m!173743))

(declare-fun m!173745 () Bool)

(assert (=> b!144315 m!173745))

(assert (=> b!144037 d!46011))

(declare-fun d!46013 () Bool)

(declare-fun lt!75589 () Bool)

(assert (=> d!46013 (= lt!75589 (select (content!140 Nil!1747) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun e!94037 () Bool)

(assert (=> d!46013 (= lt!75589 e!94037)))

(declare-fun res!68673 () Bool)

(assert (=> d!46013 (=> (not res!68673) (not e!94037))))

(assert (=> d!46013 (= res!68673 ((_ is Cons!1746) Nil!1747))))

(assert (=> d!46013 (= (contains!920 Nil!1747 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) lt!75589)))

(declare-fun b!144316 () Bool)

(declare-fun e!94038 () Bool)

(assert (=> b!144316 (= e!94037 e!94038)))

(declare-fun res!68672 () Bool)

(assert (=> b!144316 (=> res!68672 e!94038)))

(assert (=> b!144316 (= res!68672 (= (h!2354 Nil!1747) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144317 () Bool)

(assert (=> b!144317 (= e!94038 (contains!920 (t!6366 Nil!1747) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!46013 res!68673) b!144316))

(assert (= (and b!144316 (not res!68672)) b!144317))

(declare-fun m!173747 () Bool)

(assert (=> d!46013 m!173747))

(assert (=> d!46013 m!173309))

(declare-fun m!173749 () Bool)

(assert (=> d!46013 m!173749))

(assert (=> b!144317 m!173309))

(declare-fun m!173751 () Bool)

(assert (=> b!144317 m!173751))

(assert (=> b!144016 d!46013))

(declare-fun d!46015 () Bool)

(assert (=> d!46015 (= (apply!122 lt!75431 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1542 (getValueByKey!176 (toList!876 lt!75431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6074 () Bool)

(assert (= bs!6074 d!46015))

(declare-fun m!173753 () Bool)

(assert (=> bs!6074 m!173753))

(assert (=> bs!6074 m!173753))

(declare-fun m!173755 () Bool)

(assert (=> bs!6074 m!173755))

(assert (=> b!144091 d!46015))

(declare-fun d!46017 () Bool)

(declare-fun e!94040 () Bool)

(assert (=> d!46017 e!94040))

(declare-fun res!68674 () Bool)

(assert (=> d!46017 (=> res!68674 e!94040)))

(declare-fun lt!75592 () Bool)

(assert (=> d!46017 (= res!68674 (not lt!75592))))

(declare-fun lt!75590 () Bool)

(assert (=> d!46017 (= lt!75592 lt!75590)))

(declare-fun lt!75591 () Unit!4559)

(declare-fun e!94039 () Unit!4559)

(assert (=> d!46017 (= lt!75591 e!94039)))

(declare-fun c!27360 () Bool)

(assert (=> d!46017 (= c!27360 lt!75590)))

(assert (=> d!46017 (= lt!75590 (containsKey!180 (toList!876 lt!75431) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46017 (= (contains!919 lt!75431 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75592)))

(declare-fun b!144318 () Bool)

(declare-fun lt!75593 () Unit!4559)

(assert (=> b!144318 (= e!94039 lt!75593)))

(assert (=> b!144318 (= lt!75593 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 lt!75431) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144318 (isDefined!130 (getValueByKey!176 (toList!876 lt!75431) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144319 () Bool)

(declare-fun Unit!4569 () Unit!4559)

(assert (=> b!144319 (= e!94039 Unit!4569)))

(declare-fun b!144320 () Bool)

(assert (=> b!144320 (= e!94040 (isDefined!130 (getValueByKey!176 (toList!876 lt!75431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46017 c!27360) b!144318))

(assert (= (and d!46017 (not c!27360)) b!144319))

(assert (= (and d!46017 (not res!68674)) b!144320))

(declare-fun m!173757 () Bool)

(assert (=> d!46017 m!173757))

(declare-fun m!173759 () Bool)

(assert (=> b!144318 m!173759))

(assert (=> b!144318 m!173753))

(assert (=> b!144318 m!173753))

(declare-fun m!173761 () Bool)

(assert (=> b!144318 m!173761))

(assert (=> b!144320 m!173753))

(assert (=> b!144320 m!173753))

(assert (=> b!144320 m!173761))

(assert (=> bm!15961 d!46017))

(declare-fun d!46019 () Bool)

(assert (=> d!46019 (= (get!1541 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144236 d!46019))

(declare-fun b!144332 () Bool)

(declare-fun e!94043 () Bool)

(assert (=> b!144332 (= e!94043 (and (bvsge (extraKeys!2724 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2724 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!630 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!144331 () Bool)

(declare-fun res!68686 () Bool)

(assert (=> b!144331 (=> (not res!68686) (not e!94043))))

(declare-fun size!2595 (LongMapFixedSize!1162) (_ BitVec 32))

(assert (=> b!144331 (= res!68686 (= (size!2595 newMap!16) (bvadd (_size!630 newMap!16) (bvsdiv (bvadd (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!144330 () Bool)

(declare-fun res!68683 () Bool)

(assert (=> b!144330 (=> (not res!68683) (not e!94043))))

(assert (=> b!144330 (= res!68683 (bvsge (size!2595 newMap!16) (_size!630 newMap!16)))))

(declare-fun d!46021 () Bool)

(declare-fun res!68685 () Bool)

(assert (=> d!46021 (=> (not res!68685) (not e!94043))))

(assert (=> d!46021 (= res!68685 (validMask!0 (mask!7332 newMap!16)))))

(assert (=> d!46021 (= (simpleValid!98 newMap!16) e!94043)))

(declare-fun b!144329 () Bool)

(declare-fun res!68684 () Bool)

(assert (=> b!144329 (=> (not res!68684) (not e!94043))))

(assert (=> b!144329 (= res!68684 (and (= (size!2590 (_values!2958 newMap!16)) (bvadd (mask!7332 newMap!16) #b00000000000000000000000000000001)) (= (size!2589 (_keys!4739 newMap!16)) (size!2590 (_values!2958 newMap!16))) (bvsge (_size!630 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!630 newMap!16) (bvadd (mask!7332 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!46021 res!68685) b!144329))

(assert (= (and b!144329 res!68684) b!144330))

(assert (= (and b!144330 res!68683) b!144331))

(assert (= (and b!144331 res!68686) b!144332))

(declare-fun m!173763 () Bool)

(assert (=> b!144331 m!173763))

(assert (=> b!144330 m!173763))

(assert (=> d!46021 m!173645))

(assert (=> d!45981 d!46021))

(assert (=> b!144094 d!46003))

(declare-fun d!46023 () Bool)

(declare-fun e!94045 () Bool)

(assert (=> d!46023 e!94045))

(declare-fun res!68687 () Bool)

(assert (=> d!46023 (=> res!68687 e!94045)))

(declare-fun lt!75596 () Bool)

(assert (=> d!46023 (= res!68687 (not lt!75596))))

(declare-fun lt!75594 () Bool)

(assert (=> d!46023 (= lt!75596 lt!75594)))

(declare-fun lt!75595 () Unit!4559)

(declare-fun e!94044 () Unit!4559)

(assert (=> d!46023 (= lt!75595 e!94044)))

(declare-fun c!27361 () Bool)

(assert (=> d!46023 (= c!27361 lt!75594)))

(assert (=> d!46023 (= lt!75594 (containsKey!180 (toList!876 e!93978) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!46023 (= (contains!919 e!93978 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) lt!75596)))

(declare-fun b!144333 () Bool)

(declare-fun lt!75597 () Unit!4559)

(assert (=> b!144333 (= e!94044 lt!75597)))

(assert (=> b!144333 (= lt!75597 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 e!93978) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!144333 (isDefined!130 (getValueByKey!176 (toList!876 e!93978) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144334 () Bool)

(declare-fun Unit!4570 () Unit!4559)

(assert (=> b!144334 (= e!94044 Unit!4570)))

(declare-fun b!144335 () Bool)

(assert (=> b!144335 (= e!94045 (isDefined!130 (getValueByKey!176 (toList!876 e!93978) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))))

(assert (= (and d!46023 c!27361) b!144333))

(assert (= (and d!46023 (not c!27361)) b!144334))

(assert (= (and d!46023 (not res!68687)) b!144335))

(assert (=> d!46023 m!173309))

(declare-fun m!173765 () Bool)

(assert (=> d!46023 m!173765))

(assert (=> b!144333 m!173309))

(declare-fun m!173767 () Bool)

(assert (=> b!144333 m!173767))

(assert (=> b!144333 m!173309))

(declare-fun m!173769 () Bool)

(assert (=> b!144333 m!173769))

(assert (=> b!144333 m!173769))

(declare-fun m!173771 () Bool)

(assert (=> b!144333 m!173771))

(assert (=> b!144335 m!173309))

(assert (=> b!144335 m!173769))

(assert (=> b!144335 m!173769))

(assert (=> b!144335 m!173771))

(assert (=> bm!16012 d!46023))

(declare-fun d!46025 () Bool)

(declare-fun c!27364 () Bool)

(assert (=> d!46025 (= c!27364 ((_ is Nil!1747) lt!75327))))

(declare-fun e!94048 () (InoxSet (_ BitVec 64)))

(assert (=> d!46025 (= (content!140 lt!75327) e!94048)))

(declare-fun b!144340 () Bool)

(assert (=> b!144340 (= e!94048 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!144341 () Bool)

(assert (=> b!144341 (= e!94048 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!2354 lt!75327) true) (content!140 (t!6366 lt!75327))))))

(assert (= (and d!46025 c!27364) b!144340))

(assert (= (and d!46025 (not c!27364)) b!144341))

(declare-fun m!173773 () Bool)

(assert (=> b!144341 m!173773))

(assert (=> b!144341 m!173741))

(assert (=> d!45947 d!46025))

(declare-fun d!46027 () Bool)

(declare-fun e!94050 () Bool)

(assert (=> d!46027 e!94050))

(declare-fun res!68688 () Bool)

(assert (=> d!46027 (=> res!68688 e!94050)))

(declare-fun lt!75600 () Bool)

(assert (=> d!46027 (= res!68688 (not lt!75600))))

(declare-fun lt!75598 () Bool)

(assert (=> d!46027 (= lt!75600 lt!75598)))

(declare-fun lt!75599 () Unit!4559)

(declare-fun e!94049 () Unit!4559)

(assert (=> d!46027 (= lt!75599 e!94049)))

(declare-fun c!27365 () Bool)

(assert (=> d!46027 (= c!27365 lt!75598)))

(assert (=> d!46027 (= lt!75598 (containsKey!180 (toList!876 lt!75431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46027 (= (contains!919 lt!75431 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75600)))

(declare-fun b!144342 () Bool)

(declare-fun lt!75601 () Unit!4559)

(assert (=> b!144342 (= e!94049 lt!75601)))

(assert (=> b!144342 (= lt!75601 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 lt!75431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144342 (isDefined!130 (getValueByKey!176 (toList!876 lt!75431) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144343 () Bool)

(declare-fun Unit!4571 () Unit!4559)

(assert (=> b!144343 (= e!94049 Unit!4571)))

(declare-fun b!144344 () Bool)

(assert (=> b!144344 (= e!94050 (isDefined!130 (getValueByKey!176 (toList!876 lt!75431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46027 c!27365) b!144342))

(assert (= (and d!46027 (not c!27365)) b!144343))

(assert (= (and d!46027 (not res!68688)) b!144344))

(declare-fun m!173775 () Bool)

(assert (=> d!46027 m!173775))

(declare-fun m!173777 () Bool)

(assert (=> b!144342 m!173777))

(declare-fun m!173779 () Bool)

(assert (=> b!144342 m!173779))

(assert (=> b!144342 m!173779))

(declare-fun m!173781 () Bool)

(assert (=> b!144342 m!173781))

(assert (=> b!144344 m!173779))

(assert (=> b!144344 m!173779))

(assert (=> b!144344 m!173781))

(assert (=> bm!15960 d!46027))

(declare-fun d!46029 () Bool)

(declare-fun res!68689 () Bool)

(declare-fun e!94051 () Bool)

(assert (=> d!46029 (=> (not res!68689) (not e!94051))))

(assert (=> d!46029 (= res!68689 (simpleValid!98 (v!3302 (underlying!482 thiss!992))))))

(assert (=> d!46029 (= (valid!567 (v!3302 (underlying!482 thiss!992))) e!94051)))

(declare-fun b!144345 () Bool)

(declare-fun res!68690 () Bool)

(assert (=> b!144345 (=> (not res!68690) (not e!94051))))

(assert (=> b!144345 (= res!68690 (= (arrayCountValidKeys!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000000 (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))) (_size!630 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun b!144346 () Bool)

(declare-fun res!68691 () Bool)

(assert (=> b!144346 (=> (not res!68691) (not e!94051))))

(assert (=> b!144346 (= res!68691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun b!144347 () Bool)

(assert (=> b!144347 (= e!94051 (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000000 Nil!1747))))

(assert (= (and d!46029 res!68689) b!144345))

(assert (= (and b!144345 res!68690) b!144346))

(assert (= (and b!144346 res!68691) b!144347))

(declare-fun m!173783 () Bool)

(assert (=> d!46029 m!173783))

(declare-fun m!173785 () Bool)

(assert (=> b!144345 m!173785))

(declare-fun m!173787 () Bool)

(assert (=> b!144346 m!173787))

(declare-fun m!173789 () Bool)

(assert (=> b!144347 m!173789))

(assert (=> d!45967 d!46029))

(declare-fun d!46031 () Bool)

(declare-fun lt!75602 () Bool)

(assert (=> d!46031 (= lt!75602 (select (content!140 (t!6366 lt!75327)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94052 () Bool)

(assert (=> d!46031 (= lt!75602 e!94052)))

(declare-fun res!68693 () Bool)

(assert (=> d!46031 (=> (not res!68693) (not e!94052))))

(assert (=> d!46031 (= res!68693 ((_ is Cons!1746) (t!6366 lt!75327)))))

(assert (=> d!46031 (= (contains!920 (t!6366 lt!75327) #b0000000000000000000000000000000000000000000000000000000000000000) lt!75602)))

(declare-fun b!144348 () Bool)

(declare-fun e!94053 () Bool)

(assert (=> b!144348 (= e!94052 e!94053)))

(declare-fun res!68692 () Bool)

(assert (=> b!144348 (=> res!68692 e!94053)))

(assert (=> b!144348 (= res!68692 (= (h!2354 (t!6366 lt!75327)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144349 () Bool)

(assert (=> b!144349 (= e!94053 (contains!920 (t!6366 (t!6366 lt!75327)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46031 res!68693) b!144348))

(assert (= (and b!144348 (not res!68692)) b!144349))

(assert (=> d!46031 m!173741))

(declare-fun m!173791 () Bool)

(assert (=> d!46031 m!173791))

(declare-fun m!173793 () Bool)

(assert (=> b!144349 m!173793))

(assert (=> b!144005 d!46031))

(declare-fun d!46033 () Bool)

(declare-fun lt!75603 () Bool)

(assert (=> d!46033 (= lt!75603 (select (content!140 (t!6366 lt!75327)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94054 () Bool)

(assert (=> d!46033 (= lt!75603 e!94054)))

(declare-fun res!68695 () Bool)

(assert (=> d!46033 (=> (not res!68695) (not e!94054))))

(assert (=> d!46033 (= res!68695 ((_ is Cons!1746) (t!6366 lt!75327)))))

(assert (=> d!46033 (= (contains!920 (t!6366 lt!75327) #b1000000000000000000000000000000000000000000000000000000000000000) lt!75603)))

(declare-fun b!144350 () Bool)

(declare-fun e!94055 () Bool)

(assert (=> b!144350 (= e!94054 e!94055)))

(declare-fun res!68694 () Bool)

(assert (=> b!144350 (=> res!68694 e!94055)))

(assert (=> b!144350 (= res!68694 (= (h!2354 (t!6366 lt!75327)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144351 () Bool)

(assert (=> b!144351 (= e!94055 (contains!920 (t!6366 (t!6366 lt!75327)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46033 res!68695) b!144350))

(assert (= (and b!144350 (not res!68694)) b!144351))

(assert (=> d!46033 m!173741))

(declare-fun m!173795 () Bool)

(assert (=> d!46033 m!173795))

(declare-fun m!173797 () Bool)

(assert (=> b!144351 m!173797))

(assert (=> b!144238 d!46033))

(declare-fun e!94063 () SeekEntryResult!284)

(declare-fun b!144364 () Bool)

(declare-fun lt!75610 () SeekEntryResult!284)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4901 (_ BitVec 32)) SeekEntryResult!284)

(assert (=> b!144364 (= e!94063 (seekKeyOrZeroReturnVacant!0 (x!16426 lt!75610) (index!3303 lt!75610) (index!3303 lt!75610) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(declare-fun b!144365 () Bool)

(declare-fun e!94062 () SeekEntryResult!284)

(assert (=> b!144365 (= e!94062 (Found!284 (index!3303 lt!75610)))))

(declare-fun b!144366 () Bool)

(declare-fun e!94064 () SeekEntryResult!284)

(assert (=> b!144366 (= e!94064 e!94062)))

(declare-fun lt!75612 () (_ BitVec 64))

(assert (=> b!144366 (= lt!75612 (select (arr!2314 (_keys!4739 newMap!16)) (index!3303 lt!75610)))))

(declare-fun c!27372 () Bool)

(assert (=> b!144366 (= c!27372 (= lt!75612 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144367 () Bool)

(assert (=> b!144367 (= e!94063 (MissingZero!284 (index!3303 lt!75610)))))

(declare-fun lt!75611 () SeekEntryResult!284)

(declare-fun d!46035 () Bool)

(assert (=> d!46035 (and (or ((_ is Undefined!284) lt!75611) (not ((_ is Found!284) lt!75611)) (and (bvsge (index!3302 lt!75611) #b00000000000000000000000000000000) (bvslt (index!3302 lt!75611) (size!2589 (_keys!4739 newMap!16))))) (or ((_ is Undefined!284) lt!75611) ((_ is Found!284) lt!75611) (not ((_ is MissingZero!284) lt!75611)) (and (bvsge (index!3301 lt!75611) #b00000000000000000000000000000000) (bvslt (index!3301 lt!75611) (size!2589 (_keys!4739 newMap!16))))) (or ((_ is Undefined!284) lt!75611) ((_ is Found!284) lt!75611) ((_ is MissingZero!284) lt!75611) (not ((_ is MissingVacant!284) lt!75611)) (and (bvsge (index!3304 lt!75611) #b00000000000000000000000000000000) (bvslt (index!3304 lt!75611) (size!2589 (_keys!4739 newMap!16))))) (or ((_ is Undefined!284) lt!75611) (ite ((_ is Found!284) lt!75611) (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75611)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (ite ((_ is MissingZero!284) lt!75611) (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3301 lt!75611)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!284) lt!75611) (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3304 lt!75611)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46035 (= lt!75611 e!94064)))

(declare-fun c!27374 () Bool)

(assert (=> d!46035 (= c!27374 (and ((_ is Intermediate!284) lt!75610) (undefined!1096 lt!75610)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4901 (_ BitVec 32)) SeekEntryResult!284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!46035 (= lt!75610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (mask!7332 newMap!16)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(assert (=> d!46035 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46035 (= (seekEntryOrOpen!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)) lt!75611)))

(declare-fun b!144368 () Bool)

(assert (=> b!144368 (= e!94064 Undefined!284)))

(declare-fun b!144369 () Bool)

(declare-fun c!27373 () Bool)

(assert (=> b!144369 (= c!27373 (= lt!75612 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144369 (= e!94062 e!94063)))

(assert (= (and d!46035 c!27374) b!144368))

(assert (= (and d!46035 (not c!27374)) b!144366))

(assert (= (and b!144366 c!27372) b!144365))

(assert (= (and b!144366 (not c!27372)) b!144369))

(assert (= (and b!144369 c!27373) b!144367))

(assert (= (and b!144369 (not c!27373)) b!144364))

(assert (=> b!144364 m!173309))

(declare-fun m!173799 () Bool)

(assert (=> b!144364 m!173799))

(declare-fun m!173801 () Bool)

(assert (=> b!144366 m!173801))

(assert (=> d!46035 m!173645))

(assert (=> d!46035 m!173309))

(declare-fun m!173803 () Bool)

(assert (=> d!46035 m!173803))

(declare-fun m!173805 () Bool)

(assert (=> d!46035 m!173805))

(declare-fun m!173807 () Bool)

(assert (=> d!46035 m!173807))

(assert (=> d!46035 m!173803))

(assert (=> d!46035 m!173309))

(declare-fun m!173809 () Bool)

(assert (=> d!46035 m!173809))

(declare-fun m!173811 () Bool)

(assert (=> d!46035 m!173811))

(assert (=> b!144201 d!46035))

(assert (=> bm!16033 d!45959))

(declare-fun d!46037 () Bool)

(declare-fun res!68696 () Bool)

(declare-fun e!94065 () Bool)

(assert (=> d!46037 (=> res!68696 e!94065)))

(assert (=> d!46037 (= res!68696 ((_ is Nil!1747) (t!6366 lt!75327)))))

(assert (=> d!46037 (= (noDuplicate!53 (t!6366 lt!75327)) e!94065)))

(declare-fun b!144370 () Bool)

(declare-fun e!94066 () Bool)

(assert (=> b!144370 (= e!94065 e!94066)))

(declare-fun res!68697 () Bool)

(assert (=> b!144370 (=> (not res!68697) (not e!94066))))

(assert (=> b!144370 (= res!68697 (not (contains!920 (t!6366 (t!6366 lt!75327)) (h!2354 (t!6366 lt!75327)))))))

(declare-fun b!144371 () Bool)

(assert (=> b!144371 (= e!94066 (noDuplicate!53 (t!6366 (t!6366 lt!75327))))))

(assert (= (and d!46037 (not res!68696)) b!144370))

(assert (= (and b!144370 res!68697) b!144371))

(declare-fun m!173813 () Bool)

(assert (=> b!144370 m!173813))

(declare-fun m!173815 () Bool)

(assert (=> b!144371 m!173815))

(assert (=> b!144038 d!46037))

(assert (=> bm!16026 d!46035))

(assert (=> b!144020 d!45993))

(assert (=> d!45979 d!46025))

(declare-fun d!46039 () Bool)

(declare-fun res!68698 () Bool)

(declare-fun e!94067 () Bool)

(assert (=> d!46039 (=> res!68698 e!94067)))

(assert (=> d!46039 (= res!68698 (= (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!46039 (= (arrayContainsKey!0 (_keys!4739 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000) e!94067)))

(declare-fun b!144372 () Bool)

(declare-fun e!94068 () Bool)

(assert (=> b!144372 (= e!94067 e!94068)))

(declare-fun res!68699 () Bool)

(assert (=> b!144372 (=> (not res!68699) (not e!94068))))

(assert (=> b!144372 (= res!68699 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144373 () Bool)

(assert (=> b!144373 (= e!94068 (arrayContainsKey!0 (_keys!4739 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!46039 (not res!68698)) b!144372))

(assert (= (and b!144372 res!68699) b!144373))

(assert (=> d!46039 m!173631))

(assert (=> b!144373 m!173309))

(declare-fun m!173817 () Bool)

(assert (=> b!144373 m!173817))

(assert (=> bm!16018 d!46039))

(declare-fun d!46041 () Bool)

(declare-fun res!68700 () Bool)

(declare-fun e!94069 () Bool)

(assert (=> d!46041 (=> res!68700 e!94069)))

(assert (=> d!46041 (= res!68700 (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!46041 (= (arrayContainsKey!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!94069)))

(declare-fun b!144374 () Bool)

(declare-fun e!94070 () Bool)

(assert (=> b!144374 (= e!94069 e!94070)))

(declare-fun res!68701 () Bool)

(assert (=> b!144374 (=> (not res!68701) (not e!94070))))

(assert (=> b!144374 (= res!68701 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun b!144375 () Bool)

(assert (=> b!144375 (= e!94070 (arrayContainsKey!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!46041 (not res!68700)) b!144374))

(assert (= (and b!144374 res!68701) b!144375))

(declare-fun m!173819 () Bool)

(assert (=> d!46041 m!173819))

(assert (=> b!144375 m!173309))

(declare-fun m!173821 () Bool)

(assert (=> b!144375 m!173821))

(assert (=> b!144026 d!46041))

(declare-fun call!16055 () ListLongMap!1721)

(declare-fun c!27375 () Bool)

(declare-fun call!16053 () ListLongMap!1721)

(declare-fun bm!16046 () Bool)

(declare-fun call!16051 () ListLongMap!1721)

(declare-fun c!27379 () Bool)

(declare-fun call!16050 () ListLongMap!1721)

(assert (=> bm!16046 (= call!16055 (+!169 (ite c!27375 call!16051 (ite c!27379 call!16053 call!16050)) (ite (or c!27375 c!27379) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16)))))))

(declare-fun b!144376 () Bool)

(declare-fun e!94082 () ListLongMap!1721)

(declare-fun call!16049 () ListLongMap!1721)

(assert (=> b!144376 (= e!94082 call!16049)))

(declare-fun b!144377 () Bool)

(declare-fun e!94079 () Bool)

(declare-fun e!94077 () Bool)

(assert (=> b!144377 (= e!94079 e!94077)))

(declare-fun c!27378 () Bool)

(assert (=> b!144377 (= c!27378 (not (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144378 () Bool)

(declare-fun e!94073 () Bool)

(assert (=> b!144378 (= e!94077 e!94073)))

(declare-fun res!68705 () Bool)

(declare-fun call!16052 () Bool)

(assert (=> b!144378 (= res!68705 call!16052)))

(assert (=> b!144378 (=> (not res!68705) (not e!94073))))

(declare-fun bm!16047 () Bool)

(assert (=> bm!16047 (= call!16050 call!16053)))

(declare-fun b!144379 () Bool)

(declare-fun c!27380 () Bool)

(assert (=> b!144379 (= c!27380 (and (not (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94071 () ListLongMap!1721)

(assert (=> b!144379 (= e!94082 e!94071)))

(declare-fun b!144380 () Bool)

(assert (=> b!144380 (= e!94077 (not call!16052))))

(declare-fun d!46043 () Bool)

(assert (=> d!46043 e!94079))

(declare-fun res!68709 () Bool)

(assert (=> d!46043 (=> (not res!68709) (not e!94079))))

(assert (=> d!46043 (= res!68709 (or (bvsge #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))))

(declare-fun lt!75624 () ListLongMap!1721)

(declare-fun lt!75626 () ListLongMap!1721)

(assert (=> d!46043 (= lt!75624 lt!75626)))

(declare-fun lt!75627 () Unit!4559)

(declare-fun e!94081 () Unit!4559)

(assert (=> d!46043 (= lt!75627 e!94081)))

(declare-fun c!27376 () Bool)

(declare-fun e!94078 () Bool)

(assert (=> d!46043 (= c!27376 e!94078)))

(declare-fun res!68706 () Bool)

(assert (=> d!46043 (=> (not res!68706) (not e!94078))))

(assert (=> d!46043 (= res!68706 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun e!94072 () ListLongMap!1721)

(assert (=> d!46043 (= lt!75626 e!94072)))

(assert (=> d!46043 (= c!27375 (and (not (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46043 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46043 (= (getCurrentListMap!536 (_keys!4739 newMap!16) (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530) (mask!7332 newMap!16) (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) lt!75624)))

(declare-fun b!144381 () Bool)

(declare-fun e!94080 () Bool)

(declare-fun e!94083 () Bool)

(assert (=> b!144381 (= e!94080 e!94083)))

(declare-fun res!68703 () Bool)

(declare-fun call!16054 () Bool)

(assert (=> b!144381 (= res!68703 call!16054)))

(assert (=> b!144381 (=> (not res!68703) (not e!94083))))

(declare-fun b!144382 () Bool)

(declare-fun Unit!4572 () Unit!4559)

(assert (=> b!144382 (= e!94081 Unit!4572)))

(declare-fun bm!16048 () Bool)

(assert (=> bm!16048 (= call!16049 call!16055)))

(declare-fun b!144383 () Bool)

(assert (=> b!144383 (= e!94083 (= (apply!122 lt!75624 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16))))))

(declare-fun b!144384 () Bool)

(assert (=> b!144384 (= e!94071 call!16049)))

(declare-fun bm!16049 () Bool)

(assert (=> bm!16049 (= call!16051 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530) (mask!7332 newMap!16) (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bm!16050 () Bool)

(assert (=> bm!16050 (= call!16054 (contains!919 lt!75624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144385 () Bool)

(assert (=> b!144385 (= e!94080 (not call!16054))))

(declare-fun b!144386 () Bool)

(assert (=> b!144386 (= e!94073 (= (apply!122 lt!75624 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2822 newMap!16)))))

(declare-fun b!144387 () Bool)

(assert (=> b!144387 (= e!94071 call!16050)))

(declare-fun bm!16051 () Bool)

(assert (=> bm!16051 (= call!16052 (contains!919 lt!75624 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144388 () Bool)

(declare-fun e!94076 () Bool)

(declare-fun e!94074 () Bool)

(assert (=> b!144388 (= e!94076 e!94074)))

(declare-fun res!68708 () Bool)

(assert (=> b!144388 (=> (not res!68708) (not e!94074))))

(assert (=> b!144388 (= res!68708 (contains!919 lt!75624 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144389 () Bool)

(assert (=> b!144389 (= e!94078 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144390 () Bool)

(assert (=> b!144390 (= e!94074 (= (apply!122 lt!75624 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)) (get!1538 (select (arr!2315 (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530)) #b00000000000000000000000000000000) (dynLambda!439 (defaultEntry!2975 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2590 (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530))))))

(assert (=> b!144390 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun bm!16052 () Bool)

(assert (=> bm!16052 (= call!16053 call!16051)))

(declare-fun b!144391 () Bool)

(declare-fun e!94075 () Bool)

(assert (=> b!144391 (= e!94075 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144392 () Bool)

(declare-fun lt!75623 () Unit!4559)

(assert (=> b!144392 (= e!94081 lt!75623)))

(declare-fun lt!75618 () ListLongMap!1721)

(assert (=> b!144392 (= lt!75618 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530) (mask!7332 newMap!16) (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75631 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75631 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75634 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75634 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75622 () Unit!4559)

(assert (=> b!144392 (= lt!75622 (addStillContains!98 lt!75618 lt!75631 (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) lt!75634))))

(assert (=> b!144392 (contains!919 (+!169 lt!75618 (tuple2!2677 lt!75631 (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)))) lt!75634)))

(declare-fun lt!75616 () Unit!4559)

(assert (=> b!144392 (= lt!75616 lt!75622)))

(declare-fun lt!75625 () ListLongMap!1721)

(assert (=> b!144392 (= lt!75625 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530) (mask!7332 newMap!16) (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75613 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75613 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75629 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75629 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75630 () Unit!4559)

(assert (=> b!144392 (= lt!75630 (addApplyDifferent!98 lt!75625 lt!75613 (minValue!2822 newMap!16) lt!75629))))

(assert (=> b!144392 (= (apply!122 (+!169 lt!75625 (tuple2!2677 lt!75613 (minValue!2822 newMap!16))) lt!75629) (apply!122 lt!75625 lt!75629))))

(declare-fun lt!75617 () Unit!4559)

(assert (=> b!144392 (= lt!75617 lt!75630)))

(declare-fun lt!75620 () ListLongMap!1721)

(assert (=> b!144392 (= lt!75620 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530) (mask!7332 newMap!16) (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75633 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75615 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75615 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75628 () Unit!4559)

(assert (=> b!144392 (= lt!75628 (addApplyDifferent!98 lt!75620 lt!75633 (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) lt!75615))))

(assert (=> b!144392 (= (apply!122 (+!169 lt!75620 (tuple2!2677 lt!75633 (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)))) lt!75615) (apply!122 lt!75620 lt!75615))))

(declare-fun lt!75621 () Unit!4559)

(assert (=> b!144392 (= lt!75621 lt!75628)))

(declare-fun lt!75619 () ListLongMap!1721)

(assert (=> b!144392 (= lt!75619 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (ite (or c!27329 c!27337) (_values!2958 newMap!16) lt!75530) (mask!7332 newMap!16) (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) (ite (and c!27329 c!27340) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2822 newMap!16)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75632 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75632 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75614 () (_ BitVec 64))

(assert (=> b!144392 (= lt!75614 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144392 (= lt!75623 (addApplyDifferent!98 lt!75619 lt!75632 (minValue!2822 newMap!16) lt!75614))))

(assert (=> b!144392 (= (apply!122 (+!169 lt!75619 (tuple2!2677 lt!75632 (minValue!2822 newMap!16))) lt!75614) (apply!122 lt!75619 lt!75614))))

(declare-fun b!144393 () Bool)

(declare-fun res!68704 () Bool)

(assert (=> b!144393 (=> (not res!68704) (not e!94079))))

(assert (=> b!144393 (= res!68704 e!94076)))

(declare-fun res!68702 () Bool)

(assert (=> b!144393 (=> res!68702 e!94076)))

(assert (=> b!144393 (= res!68702 (not e!94075))))

(declare-fun res!68710 () Bool)

(assert (=> b!144393 (=> (not res!68710) (not e!94075))))

(assert (=> b!144393 (= res!68710 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144394 () Bool)

(assert (=> b!144394 (= e!94072 e!94082)))

(assert (=> b!144394 (= c!27379 (and (not (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144395 () Bool)

(assert (=> b!144395 (= e!94072 (+!169 call!16055 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16))))))

(declare-fun b!144396 () Bool)

(declare-fun res!68707 () Bool)

(assert (=> b!144396 (=> (not res!68707) (not e!94079))))

(assert (=> b!144396 (= res!68707 e!94080)))

(declare-fun c!27377 () Bool)

(assert (=> b!144396 (= c!27377 (not (= (bvand (ite (and c!27329 c!27340) lt!75513 (extraKeys!2724 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!46043 c!27375) b!144395))

(assert (= (and d!46043 (not c!27375)) b!144394))

(assert (= (and b!144394 c!27379) b!144376))

(assert (= (and b!144394 (not c!27379)) b!144379))

(assert (= (and b!144379 c!27380) b!144384))

(assert (= (and b!144379 (not c!27380)) b!144387))

(assert (= (or b!144384 b!144387) bm!16047))

(assert (= (or b!144376 bm!16047) bm!16052))

(assert (= (or b!144376 b!144384) bm!16048))

(assert (= (or b!144395 bm!16052) bm!16049))

(assert (= (or b!144395 bm!16048) bm!16046))

(assert (= (and d!46043 res!68706) b!144389))

(assert (= (and d!46043 c!27376) b!144392))

(assert (= (and d!46043 (not c!27376)) b!144382))

(assert (= (and d!46043 res!68709) b!144393))

(assert (= (and b!144393 res!68710) b!144391))

(assert (= (and b!144393 (not res!68702)) b!144388))

(assert (= (and b!144388 res!68708) b!144390))

(assert (= (and b!144393 res!68704) b!144396))

(assert (= (and b!144396 c!27377) b!144381))

(assert (= (and b!144396 (not c!27377)) b!144385))

(assert (= (and b!144381 res!68703) b!144383))

(assert (= (or b!144381 b!144385) bm!16050))

(assert (= (and b!144396 res!68707) b!144377))

(assert (= (and b!144377 c!27378) b!144378))

(assert (= (and b!144377 (not c!27378)) b!144380))

(assert (= (and b!144378 res!68705) b!144386))

(assert (= (or b!144378 b!144380) bm!16051))

(declare-fun b_lambda!6459 () Bool)

(assert (=> (not b_lambda!6459) (not b!144390)))

(assert (=> b!144390 t!6379))

(declare-fun b_and!8973 () Bool)

(assert (= b_and!8969 (and (=> t!6379 result!4243) b_and!8973)))

(assert (=> b!144390 t!6381))

(declare-fun b_and!8975 () Bool)

(assert (= b_and!8971 (and (=> t!6381 result!4245) b_and!8975)))

(declare-fun m!173823 () Bool)

(assert (=> b!144386 m!173823))

(assert (=> b!144389 m!173631))

(assert (=> b!144389 m!173631))

(assert (=> b!144389 m!173633))

(declare-fun m!173825 () Bool)

(assert (=> bm!16049 m!173825))

(assert (=> b!144388 m!173631))

(assert (=> b!144388 m!173631))

(declare-fun m!173827 () Bool)

(assert (=> b!144388 m!173827))

(declare-fun m!173829 () Bool)

(assert (=> b!144383 m!173829))

(declare-fun m!173831 () Bool)

(assert (=> bm!16046 m!173831))

(declare-fun m!173833 () Bool)

(assert (=> b!144395 m!173833))

(assert (=> d!46043 m!173645))

(declare-fun m!173835 () Bool)

(assert (=> b!144392 m!173835))

(assert (=> b!144392 m!173825))

(declare-fun m!173837 () Bool)

(assert (=> b!144392 m!173837))

(declare-fun m!173839 () Bool)

(assert (=> b!144392 m!173839))

(declare-fun m!173841 () Bool)

(assert (=> b!144392 m!173841))

(declare-fun m!173843 () Bool)

(assert (=> b!144392 m!173843))

(declare-fun m!173845 () Bool)

(assert (=> b!144392 m!173845))

(assert (=> b!144392 m!173631))

(assert (=> b!144392 m!173837))

(declare-fun m!173847 () Bool)

(assert (=> b!144392 m!173847))

(assert (=> b!144392 m!173841))

(declare-fun m!173849 () Bool)

(assert (=> b!144392 m!173849))

(declare-fun m!173851 () Bool)

(assert (=> b!144392 m!173851))

(declare-fun m!173853 () Bool)

(assert (=> b!144392 m!173853))

(declare-fun m!173855 () Bool)

(assert (=> b!144392 m!173855))

(declare-fun m!173857 () Bool)

(assert (=> b!144392 m!173857))

(declare-fun m!173859 () Bool)

(assert (=> b!144392 m!173859))

(declare-fun m!173861 () Bool)

(assert (=> b!144392 m!173861))

(declare-fun m!173863 () Bool)

(assert (=> b!144392 m!173863))

(assert (=> b!144392 m!173849))

(assert (=> b!144392 m!173853))

(assert (=> b!144390 m!173631))

(declare-fun m!173865 () Bool)

(assert (=> b!144390 m!173865))

(declare-fun m!173867 () Bool)

(assert (=> b!144390 m!173867))

(assert (=> b!144390 m!173681))

(declare-fun m!173869 () Bool)

(assert (=> b!144390 m!173869))

(assert (=> b!144390 m!173631))

(assert (=> b!144390 m!173867))

(assert (=> b!144390 m!173681))

(assert (=> b!144391 m!173631))

(assert (=> b!144391 m!173631))

(assert (=> b!144391 m!173633))

(declare-fun m!173871 () Bool)

(assert (=> bm!16051 m!173871))

(declare-fun m!173873 () Bool)

(assert (=> bm!16050 m!173873))

(assert (=> bm!16019 d!46043))

(declare-fun d!46045 () Bool)

(declare-fun e!94086 () Bool)

(assert (=> d!46045 e!94086))

(declare-fun res!68716 () Bool)

(assert (=> d!46045 (=> (not res!68716) (not e!94086))))

(declare-fun lt!75640 () SeekEntryResult!284)

(assert (=> d!46045 (= res!68716 ((_ is Found!284) lt!75640))))

(assert (=> d!46045 (= lt!75640 (seekEntryOrOpen!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(declare-fun lt!75639 () Unit!4559)

(declare-fun choose!888 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4559)

(assert (=> d!46045 (= lt!75639 (choose!888 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46045 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46045 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)) lt!75639)))

(declare-fun b!144401 () Bool)

(declare-fun res!68715 () Bool)

(assert (=> b!144401 (=> (not res!68715) (not e!94086))))

(assert (=> b!144401 (= res!68715 (inRange!0 (index!3302 lt!75640) (mask!7332 newMap!16)))))

(declare-fun b!144402 () Bool)

(assert (=> b!144402 (= e!94086 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75640)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!144402 (and (bvsge (index!3302 lt!75640) #b00000000000000000000000000000000) (bvslt (index!3302 lt!75640) (size!2589 (_keys!4739 newMap!16))))))

(assert (= (and d!46045 res!68716) b!144401))

(assert (= (and b!144401 res!68715) b!144402))

(assert (=> d!46045 m!173309))

(assert (=> d!46045 m!173553))

(assert (=> d!46045 m!173309))

(declare-fun m!173875 () Bool)

(assert (=> d!46045 m!173875))

(assert (=> d!46045 m!173645))

(declare-fun m!173877 () Bool)

(assert (=> b!144401 m!173877))

(declare-fun m!173879 () Bool)

(assert (=> b!144402 m!173879))

(assert (=> bm!16027 d!46045))

(declare-fun b!144419 () Bool)

(declare-fun e!94097 () Bool)

(declare-fun e!94095 () Bool)

(assert (=> b!144419 (= e!94097 e!94095)))

(declare-fun res!68728 () Bool)

(declare-fun call!16060 () Bool)

(assert (=> b!144419 (= res!68728 call!16060)))

(assert (=> b!144419 (=> (not res!68728) (not e!94095))))

(declare-fun b!144420 () Bool)

(declare-fun lt!75645 () SeekEntryResult!284)

(assert (=> b!144420 (and (bvsge (index!3301 lt!75645) #b00000000000000000000000000000000) (bvslt (index!3301 lt!75645) (size!2589 (_keys!4739 newMap!16))))))

(declare-fun res!68725 () Bool)

(assert (=> b!144420 (= res!68725 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3301 lt!75645)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144420 (=> (not res!68725) (not e!94095))))

(declare-fun bm!16057 () Bool)

(declare-fun call!16061 () Bool)

(assert (=> bm!16057 (= call!16061 (arrayContainsKey!0 (_keys!4739 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144421 () Bool)

(declare-fun res!68727 () Bool)

(declare-fun e!94096 () Bool)

(assert (=> b!144421 (=> (not res!68727) (not e!94096))))

(assert (=> b!144421 (= res!68727 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3304 lt!75645)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144421 (and (bvsge (index!3304 lt!75645) #b00000000000000000000000000000000) (bvslt (index!3304 lt!75645) (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144422 () Bool)

(assert (=> b!144422 (= e!94096 (not call!16061))))

(declare-fun bm!16058 () Bool)

(declare-fun c!27386 () Bool)

(assert (=> bm!16058 (= call!16060 (inRange!0 (ite c!27386 (index!3301 lt!75645) (index!3304 lt!75645)) (mask!7332 newMap!16)))))

(declare-fun b!144424 () Bool)

(declare-fun e!94098 () Bool)

(assert (=> b!144424 (= e!94098 ((_ is Undefined!284) lt!75645))))

(declare-fun b!144425 () Bool)

(assert (=> b!144425 (= e!94095 (not call!16061))))

(declare-fun b!144426 () Bool)

(assert (=> b!144426 (= e!94097 e!94098)))

(declare-fun c!27385 () Bool)

(assert (=> b!144426 (= c!27385 ((_ is MissingVacant!284) lt!75645))))

(declare-fun d!46047 () Bool)

(assert (=> d!46047 e!94097))

(assert (=> d!46047 (= c!27386 ((_ is MissingZero!284) lt!75645))))

(assert (=> d!46047 (= lt!75645 (seekEntryOrOpen!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(declare-fun lt!75646 () Unit!4559)

(declare-fun choose!889 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) Int) Unit!4559)

(assert (=> d!46047 (= lt!75646 (choose!889 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46047 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46047 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)) lt!75646)))

(declare-fun b!144423 () Bool)

(declare-fun res!68726 () Bool)

(assert (=> b!144423 (=> (not res!68726) (not e!94096))))

(assert (=> b!144423 (= res!68726 call!16060)))

(assert (=> b!144423 (= e!94098 e!94096)))

(assert (= (and d!46047 c!27386) b!144419))

(assert (= (and d!46047 (not c!27386)) b!144426))

(assert (= (and b!144419 res!68728) b!144420))

(assert (= (and b!144420 res!68725) b!144425))

(assert (= (and b!144426 c!27385) b!144423))

(assert (= (and b!144426 (not c!27385)) b!144424))

(assert (= (and b!144423 res!68726) b!144421))

(assert (= (and b!144421 res!68727) b!144422))

(assert (= (or b!144419 b!144423) bm!16058))

(assert (= (or b!144425 b!144422) bm!16057))

(declare-fun m!173881 () Bool)

(assert (=> b!144420 m!173881))

(assert (=> bm!16057 m!173309))

(assert (=> bm!16057 m!173557))

(declare-fun m!173883 () Bool)

(assert (=> bm!16058 m!173883))

(declare-fun m!173885 () Bool)

(assert (=> b!144421 m!173885))

(assert (=> d!46047 m!173309))

(assert (=> d!46047 m!173553))

(assert (=> d!46047 m!173309))

(declare-fun m!173887 () Bool)

(assert (=> d!46047 m!173887))

(assert (=> d!46047 m!173645))

(assert (=> bm!16016 d!46047))

(declare-fun d!46049 () Bool)

(declare-fun res!68733 () Bool)

(declare-fun e!94103 () Bool)

(assert (=> d!46049 (=> res!68733 e!94103)))

(assert (=> d!46049 (= res!68733 (and ((_ is Cons!1745) (toList!876 lt!75328)) (= (_1!1349 (h!2353 (toList!876 lt!75328))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))))

(assert (=> d!46049 (= (containsKey!180 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) e!94103)))

(declare-fun b!144431 () Bool)

(declare-fun e!94104 () Bool)

(assert (=> b!144431 (= e!94103 e!94104)))

(declare-fun res!68734 () Bool)

(assert (=> b!144431 (=> (not res!68734) (not e!94104))))

(assert (=> b!144431 (= res!68734 (and (or (not ((_ is Cons!1745) (toList!876 lt!75328))) (bvsle (_1!1349 (h!2353 (toList!876 lt!75328))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))) ((_ is Cons!1745) (toList!876 lt!75328)) (bvslt (_1!1349 (h!2353 (toList!876 lt!75328))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))))

(declare-fun b!144432 () Bool)

(assert (=> b!144432 (= e!94104 (containsKey!180 (t!6365 (toList!876 lt!75328)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!46049 (not res!68733)) b!144431))

(assert (= (and b!144431 res!68734) b!144432))

(assert (=> b!144432 m!173309))

(declare-fun m!173889 () Bool)

(assert (=> b!144432 m!173889))

(assert (=> d!45969 d!46049))

(declare-fun b!144441 () Bool)

(declare-fun e!94113 () Bool)

(declare-fun call!16064 () Bool)

(assert (=> b!144441 (= e!94113 call!16064)))

(declare-fun bm!16061 () Bool)

(assert (=> bm!16061 (= call!16064 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(declare-fun b!144442 () Bool)

(declare-fun e!94111 () Bool)

(assert (=> b!144442 (= e!94111 e!94113)))

(declare-fun c!27389 () Bool)

(assert (=> b!144442 (= c!27389 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144443 () Bool)

(declare-fun e!94112 () Bool)

(assert (=> b!144443 (= e!94113 e!94112)))

(declare-fun lt!75653 () (_ BitVec 64))

(assert (=> b!144443 (= lt!75653 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75654 () Unit!4559)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4901 (_ BitVec 64) (_ BitVec 32)) Unit!4559)

(assert (=> b!144443 (= lt!75654 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4739 newMap!16) lt!75653 #b00000000000000000000000000000000))))

(assert (=> b!144443 (arrayContainsKey!0 (_keys!4739 newMap!16) lt!75653 #b00000000000000000000000000000000)))

(declare-fun lt!75655 () Unit!4559)

(assert (=> b!144443 (= lt!75655 lt!75654)))

(declare-fun res!68740 () Bool)

(assert (=> b!144443 (= res!68740 (= (seekEntryOrOpen!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000) (_keys!4739 newMap!16) (mask!7332 newMap!16)) (Found!284 #b00000000000000000000000000000000)))))

(assert (=> b!144443 (=> (not res!68740) (not e!94112))))

(declare-fun b!144444 () Bool)

(assert (=> b!144444 (= e!94112 call!16064)))

(declare-fun d!46051 () Bool)

(declare-fun res!68739 () Bool)

(assert (=> d!46051 (=> res!68739 e!94111)))

(assert (=> d!46051 (= res!68739 (bvsge #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(assert (=> d!46051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4739 newMap!16) (mask!7332 newMap!16)) e!94111)))

(assert (= (and d!46051 (not res!68739)) b!144442))

(assert (= (and b!144442 c!27389) b!144443))

(assert (= (and b!144442 (not c!27389)) b!144441))

(assert (= (and b!144443 res!68740) b!144444))

(assert (= (or b!144444 b!144441) bm!16061))

(declare-fun m!173891 () Bool)

(assert (=> bm!16061 m!173891))

(assert (=> b!144442 m!173631))

(assert (=> b!144442 m!173631))

(assert (=> b!144442 m!173633))

(assert (=> b!144443 m!173631))

(declare-fun m!173893 () Bool)

(assert (=> b!144443 m!173893))

(declare-fun m!173895 () Bool)

(assert (=> b!144443 m!173895))

(assert (=> b!144443 m!173631))

(declare-fun m!173897 () Bool)

(assert (=> b!144443 m!173897))

(assert (=> b!144246 d!46051))

(declare-fun d!46053 () Bool)

(declare-fun e!94114 () Bool)

(assert (=> d!46053 e!94114))

(declare-fun res!68741 () Bool)

(assert (=> d!46053 (=> (not res!68741) (not e!94114))))

(declare-fun lt!75656 () ListLongMap!1721)

(assert (=> d!46053 (= res!68741 (contains!919 lt!75656 (_1!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(declare-fun lt!75658 () List!1749)

(assert (=> d!46053 (= lt!75656 (ListLongMap!1722 lt!75658))))

(declare-fun lt!75657 () Unit!4559)

(declare-fun lt!75659 () Unit!4559)

(assert (=> d!46053 (= lt!75657 lt!75659)))

(assert (=> d!46053 (= (getValueByKey!176 lt!75658 (_1!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))) (Some!181 (_2!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(assert (=> d!46053 (= lt!75659 (lemmaContainsTupThenGetReturnValue!93 lt!75658 (_1!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (_2!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(assert (=> d!46053 (= lt!75658 (insertStrictlySorted!96 (toList!876 (ite c!27294 call!15961 (ite c!27298 call!15963 call!15960))) (_1!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (_2!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(assert (=> d!46053 (= (+!169 (ite c!27294 call!15961 (ite c!27298 call!15963 call!15960)) (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75656)))

(declare-fun b!144445 () Bool)

(declare-fun res!68742 () Bool)

(assert (=> b!144445 (=> (not res!68742) (not e!94114))))

(assert (=> b!144445 (= res!68742 (= (getValueByKey!176 (toList!876 lt!75656) (_1!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))) (Some!181 (_2!1349 (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))))

(declare-fun b!144446 () Bool)

(assert (=> b!144446 (= e!94114 (contains!922 (toList!876 lt!75656) (ite (or c!27294 c!27298) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (= (and d!46053 res!68741) b!144445))

(assert (= (and b!144445 res!68742) b!144446))

(declare-fun m!173899 () Bool)

(assert (=> d!46053 m!173899))

(declare-fun m!173901 () Bool)

(assert (=> d!46053 m!173901))

(declare-fun m!173903 () Bool)

(assert (=> d!46053 m!173903))

(declare-fun m!173905 () Bool)

(assert (=> d!46053 m!173905))

(declare-fun m!173907 () Bool)

(assert (=> b!144445 m!173907))

(declare-fun m!173909 () Bool)

(assert (=> b!144446 m!173909))

(assert (=> bm!15956 d!46053))

(declare-fun b!144481 () Bool)

(declare-fun e!94132 () Bool)

(declare-fun lt!75736 () SeekEntryResult!284)

(assert (=> b!144481 (= e!94132 ((_ is Undefined!284) lt!75736))))

(declare-fun lt!75733 () tuple2!2678)

(declare-fun e!94134 () Bool)

(declare-fun b!144482 () Bool)

(assert (=> b!144482 (= e!94134 (= (map!1430 (_2!1350 lt!75733)) (+!169 (map!1430 newMap!16) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!144483 () Bool)

(declare-fun e!94131 () Bool)

(declare-fun call!16073 () Bool)

(assert (=> b!144483 (= e!94131 (not call!16073))))

(declare-fun d!46055 () Bool)

(assert (=> d!46055 e!94134))

(declare-fun res!68764 () Bool)

(assert (=> d!46055 (=> (not res!68764) (not e!94134))))

(assert (=> d!46055 (= res!68764 (_1!1350 lt!75733))))

(assert (=> d!46055 (= lt!75733 (tuple2!2679 true (LongMapFixedSize!1163 (defaultEntry!2975 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (bvadd (_size!630 newMap!16) #b00000000000000000000000000000001) (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (_vacant!630 newMap!16))))))

(declare-fun lt!75740 () Unit!4559)

(declare-fun lt!75744 () Unit!4559)

(assert (=> d!46055 (= lt!75740 lt!75744)))

(declare-fun lt!75743 () array!4903)

(declare-fun lt!75737 () array!4901)

(assert (=> d!46055 (contains!919 (getCurrentListMap!536 lt!75737 lt!75743 (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532))))))

(assert (=> d!46055 (= lt!75744 (lemmaValidKeyInArrayIsInListMap!126 lt!75737 lt!75743 (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46055 (= lt!75743 (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))))))

(assert (=> d!46055 (= lt!75737 (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))))))

(declare-fun lt!75726 () Unit!4559)

(declare-fun lt!75749 () Unit!4559)

(assert (=> d!46055 (= lt!75726 lt!75749)))

(declare-fun lt!75730 () array!4901)

(assert (=> d!46055 (= (arrayCountValidKeys!0 lt!75730 (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (bvadd (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4901 (_ BitVec 32)) Unit!4559)

(assert (=> d!46055 (= lt!75749 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!75730 (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532))))))

(assert (=> d!46055 (= lt!75730 (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))))))

(declare-fun lt!75729 () Unit!4559)

(declare-fun lt!75720 () Unit!4559)

(assert (=> d!46055 (= lt!75729 lt!75720)))

(declare-fun lt!75738 () array!4901)

(assert (=> d!46055 (arrayContainsKey!0 lt!75738 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!46055 (= lt!75720 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!75738 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532))))))

(assert (=> d!46055 (= lt!75738 (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))))))

(declare-fun lt!75739 () Unit!4559)

(declare-fun lt!75722 () Unit!4559)

(assert (=> d!46055 (= lt!75739 lt!75722)))

(assert (=> d!46055 (= (+!169 (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!47 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) (_ BitVec 64) V!3569 Int) Unit!4559)

(assert (=> d!46055 (= lt!75722 (lemmaAddValidKeyToArrayThenAddPairToListMap!47 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75735 () Unit!4559)

(declare-fun lt!75747 () Unit!4559)

(assert (=> d!46055 (= lt!75735 lt!75747)))

(assert (=> d!46055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))) (mask!7332 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4901 (_ BitVec 32) (_ BitVec 32)) Unit!4559)

(assert (=> d!46055 (= lt!75747 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (mask!7332 newMap!16)))))

(declare-fun lt!75732 () Unit!4559)

(declare-fun lt!75734 () Unit!4559)

(assert (=> d!46055 (= lt!75732 lt!75734)))

(assert (=> d!46055 (= (arrayCountValidKeys!0 (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))) #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4739 newMap!16) #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4901 (_ BitVec 32) (_ BitVec 64)) Unit!4559)

(assert (=> d!46055 (= lt!75734 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4739 newMap!16) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun lt!75742 () Unit!4559)

(declare-fun lt!75725 () Unit!4559)

(assert (=> d!46055 (= lt!75742 lt!75725)))

(declare-fun lt!75745 () (_ BitVec 32))

(declare-fun lt!75746 () List!1750)

(assert (=> d!46055 (arrayNoDuplicates!0 (array!4902 (store (arr!2314 (_keys!4739 newMap!16)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) (size!2589 (_keys!4739 newMap!16))) lt!75745 lt!75746)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4901 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1750) Unit!4559)

(assert (=> d!46055 (= lt!75725 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4739 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532)) lt!75745 lt!75746))))

(assert (=> d!46055 (= lt!75746 Nil!1747)))

(assert (=> d!46055 (= lt!75745 #b00000000000000000000000000000000)))

(declare-fun lt!75723 () Unit!4559)

(declare-fun e!94138 () Unit!4559)

(assert (=> d!46055 (= lt!75723 e!94138)))

(declare-fun c!27399 () Bool)

(assert (=> d!46055 (= c!27399 (arrayContainsKey!0 (_keys!4739 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!75728 () Unit!4559)

(declare-fun e!94137 () Unit!4559)

(assert (=> d!46055 (= lt!75728 e!94137)))

(declare-fun c!27401 () Bool)

(assert (=> d!46055 (= c!27401 (contains!919 (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> d!46055 (valid!567 newMap!16)))

(assert (=> d!46055 (= (updateHelperNewKey!67 newMap!16 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27341 (index!3304 lt!75532) (index!3301 lt!75532))) lt!75733)))

(declare-fun b!144484 () Bool)

(declare-fun c!27400 () Bool)

(assert (=> b!144484 (= c!27400 ((_ is MissingVacant!284) lt!75736))))

(declare-fun e!94133 () Bool)

(assert (=> b!144484 (= e!94133 e!94132)))

(declare-fun bm!16070 () Bool)

(assert (=> bm!16070 (= call!16073 (arrayContainsKey!0 (_keys!4739 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun e!94136 () Bool)

(declare-fun b!144485 () Bool)

(declare-fun lt!75748 () SeekEntryResult!284)

(assert (=> b!144485 (= e!94136 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75748)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144486 () Bool)

(declare-fun Unit!4573 () Unit!4559)

(assert (=> b!144486 (= e!94137 Unit!4573)))

(declare-fun lt!75721 () Unit!4559)

(assert (=> b!144486 (= lt!75721 (lemmaInListMapThenSeekEntryOrOpenFindsIt!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(declare-fun call!16074 () SeekEntryResult!284)

(assert (=> b!144486 (= lt!75748 call!16074)))

(declare-fun res!68768 () Bool)

(assert (=> b!144486 (= res!68768 ((_ is Found!284) lt!75748))))

(assert (=> b!144486 (=> (not res!68768) (not e!94136))))

(assert (=> b!144486 e!94136))

(declare-fun lt!75741 () Unit!4559)

(assert (=> b!144486 (= lt!75741 lt!75721)))

(assert (=> b!144486 false))

(declare-fun b!144487 () Bool)

(declare-fun res!68766 () Bool)

(assert (=> b!144487 (=> (not res!68766) (not e!94134))))

(assert (=> b!144487 (= res!68766 (contains!919 (map!1430 (_2!1350 lt!75733)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun b!144488 () Bool)

(declare-fun res!68767 () Bool)

(declare-fun e!94135 () Bool)

(assert (=> b!144488 (=> (not res!68767) (not e!94135))))

(assert (=> b!144488 (= res!68767 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3301 lt!75736)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16071 () Bool)

(declare-fun call!16075 () Bool)

(declare-fun call!16076 () Bool)

(assert (=> bm!16071 (= call!16075 call!16076)))

(declare-fun b!144489 () Bool)

(declare-fun lt!75724 () Unit!4559)

(assert (=> b!144489 (= e!94137 lt!75724)))

(assert (=> b!144489 (= lt!75724 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (defaultEntry!2975 newMap!16)))))

(assert (=> b!144489 (= lt!75736 call!16074)))

(declare-fun c!27398 () Bool)

(assert (=> b!144489 (= c!27398 ((_ is MissingZero!284) lt!75736))))

(assert (=> b!144489 e!94133))

(declare-fun b!144490 () Bool)

(assert (=> b!144490 (= e!94135 (not call!16073))))

(declare-fun b!144491 () Bool)

(declare-fun res!68762 () Bool)

(assert (=> b!144491 (=> (not res!68762) (not e!94135))))

(assert (=> b!144491 (= res!68762 call!16075)))

(assert (=> b!144491 (= e!94133 e!94135)))

(declare-fun bm!16072 () Bool)

(assert (=> bm!16072 (= call!16076 (inRange!0 (ite c!27401 (index!3302 lt!75748) (ite c!27398 (index!3301 lt!75736) (index!3304 lt!75736))) (mask!7332 newMap!16)))))

(declare-fun b!144492 () Bool)

(declare-fun Unit!4574 () Unit!4559)

(assert (=> b!144492 (= e!94138 Unit!4574)))

(declare-fun lt!75727 () Unit!4559)

(declare-fun lemmaArrayContainsKeyThenInListMap!47 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 64) (_ BitVec 32) Int) Unit!4559)

(assert (=> b!144492 (= lt!75727 (lemmaArrayContainsKeyThenInListMap!47 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(assert (=> b!144492 (contains!919 (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))

(declare-fun lt!75731 () Unit!4559)

(assert (=> b!144492 (= lt!75731 lt!75727)))

(assert (=> b!144492 false))

(declare-fun b!144493 () Bool)

(declare-fun Unit!4575 () Unit!4559)

(assert (=> b!144493 (= e!94138 Unit!4575)))

(declare-fun b!144494 () Bool)

(declare-fun res!68761 () Bool)

(assert (=> b!144494 (=> (not res!68761) (not e!94134))))

(assert (=> b!144494 (= res!68761 (valid!567 (_2!1350 lt!75733)))))

(declare-fun b!144495 () Bool)

(assert (=> b!144495 (= e!94132 e!94131)))

(declare-fun res!68765 () Bool)

(assert (=> b!144495 (= res!68765 call!16075)))

(assert (=> b!144495 (=> (not res!68765) (not e!94131))))

(declare-fun b!144496 () Bool)

(declare-fun res!68763 () Bool)

(assert (=> b!144496 (= res!68763 call!16076)))

(assert (=> b!144496 (=> (not res!68763) (not e!94136))))

(declare-fun bm!16073 () Bool)

(assert (=> bm!16073 (= call!16074 (seekEntryOrOpen!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (_keys!4739 newMap!16) (mask!7332 newMap!16)))))

(declare-fun b!144497 () Bool)

(declare-fun res!68769 () Bool)

(assert (=> b!144497 (= res!68769 (= (select (arr!2314 (_keys!4739 newMap!16)) (index!3304 lt!75736)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144497 (=> (not res!68769) (not e!94131))))

(assert (= (and d!46055 c!27401) b!144486))

(assert (= (and d!46055 (not c!27401)) b!144489))

(assert (= (and b!144486 res!68768) b!144496))

(assert (= (and b!144496 res!68763) b!144485))

(assert (= (and b!144489 c!27398) b!144491))

(assert (= (and b!144489 (not c!27398)) b!144484))

(assert (= (and b!144491 res!68762) b!144488))

(assert (= (and b!144488 res!68767) b!144490))

(assert (= (and b!144484 c!27400) b!144495))

(assert (= (and b!144484 (not c!27400)) b!144481))

(assert (= (and b!144495 res!68765) b!144497))

(assert (= (and b!144497 res!68769) b!144483))

(assert (= (or b!144491 b!144495) bm!16071))

(assert (= (or b!144490 b!144483) bm!16070))

(assert (= (or b!144496 bm!16071) bm!16072))

(assert (= (or b!144486 b!144489) bm!16073))

(assert (= (and d!46055 c!27399) b!144492))

(assert (= (and d!46055 (not c!27399)) b!144493))

(assert (= (and d!46055 res!68764) b!144494))

(assert (= (and b!144494 res!68761) b!144487))

(assert (= (and b!144487 res!68766) b!144482))

(declare-fun m!173911 () Bool)

(assert (=> bm!16072 m!173911))

(declare-fun m!173913 () Bool)

(assert (=> d!46055 m!173913))

(declare-fun m!173915 () Bool)

(assert (=> d!46055 m!173915))

(declare-fun m!173917 () Bool)

(assert (=> d!46055 m!173917))

(declare-fun m!173919 () Bool)

(assert (=> d!46055 m!173919))

(declare-fun m!173921 () Bool)

(assert (=> d!46055 m!173921))

(assert (=> d!46055 m!173467))

(assert (=> d!46055 m!173309))

(declare-fun m!173923 () Bool)

(assert (=> d!46055 m!173923))

(declare-fun m!173925 () Bool)

(assert (=> d!46055 m!173925))

(assert (=> d!46055 m!173467))

(declare-fun m!173927 () Bool)

(assert (=> d!46055 m!173927))

(assert (=> d!46055 m!173309))

(declare-fun m!173929 () Bool)

(assert (=> d!46055 m!173929))

(assert (=> d!46055 m!173309))

(assert (=> d!46055 m!173321))

(declare-fun m!173931 () Bool)

(assert (=> d!46055 m!173931))

(assert (=> d!46055 m!173329))

(assert (=> d!46055 m!173467))

(assert (=> d!46055 m!173309))

(declare-fun m!173933 () Bool)

(assert (=> d!46055 m!173933))

(assert (=> d!46055 m!173913))

(declare-fun m!173935 () Bool)

(assert (=> d!46055 m!173935))

(declare-fun m!173937 () Bool)

(assert (=> d!46055 m!173937))

(assert (=> d!46055 m!173309))

(assert (=> d!46055 m!173557))

(assert (=> d!46055 m!173309))

(declare-fun m!173939 () Bool)

(assert (=> d!46055 m!173939))

(assert (=> d!46055 m!173599))

(declare-fun m!173941 () Bool)

(assert (=> d!46055 m!173941))

(declare-fun m!173943 () Bool)

(assert (=> d!46055 m!173943))

(declare-fun m!173945 () Bool)

(assert (=> d!46055 m!173945))

(assert (=> d!46055 m!173915))

(assert (=> d!46055 m!173309))

(declare-fun m!173947 () Bool)

(assert (=> d!46055 m!173947))

(assert (=> d!46055 m!173309))

(declare-fun m!173949 () Bool)

(assert (=> d!46055 m!173949))

(declare-fun m!173951 () Bool)

(assert (=> d!46055 m!173951))

(declare-fun m!173953 () Bool)

(assert (=> b!144488 m!173953))

(declare-fun m!173955 () Bool)

(assert (=> b!144485 m!173955))

(assert (=> b!144486 m!173309))

(assert (=> b!144486 m!173541))

(assert (=> bm!16073 m!173309))

(assert (=> bm!16073 m!173553))

(assert (=> b!144492 m!173309))

(declare-fun m!173957 () Bool)

(assert (=> b!144492 m!173957))

(assert (=> b!144492 m!173467))

(assert (=> b!144492 m!173467))

(assert (=> b!144492 m!173309))

(assert (=> b!144492 m!173933))

(declare-fun m!173959 () Bool)

(assert (=> b!144497 m!173959))

(assert (=> bm!16070 m!173309))

(assert (=> bm!16070 m!173557))

(assert (=> b!144489 m!173309))

(assert (=> b!144489 m!173539))

(declare-fun m!173961 () Bool)

(assert (=> b!144494 m!173961))

(declare-fun m!173963 () Bool)

(assert (=> b!144482 m!173963))

(assert (=> b!144482 m!173345))

(assert (=> b!144482 m!173345))

(declare-fun m!173965 () Bool)

(assert (=> b!144482 m!173965))

(assert (=> b!144487 m!173963))

(assert (=> b!144487 m!173963))

(assert (=> b!144487 m!173309))

(declare-fun m!173967 () Bool)

(assert (=> b!144487 m!173967))

(assert (=> bm!16025 d!46055))

(declare-fun d!46057 () Bool)

(declare-fun e!94140 () Bool)

(assert (=> d!46057 e!94140))

(declare-fun res!68770 () Bool)

(assert (=> d!46057 (=> res!68770 e!94140)))

(declare-fun lt!75752 () Bool)

(assert (=> d!46057 (= res!68770 (not lt!75752))))

(declare-fun lt!75750 () Bool)

(assert (=> d!46057 (= lt!75752 lt!75750)))

(declare-fun lt!75751 () Unit!4559)

(declare-fun e!94139 () Unit!4559)

(assert (=> d!46057 (= lt!75751 e!94139)))

(declare-fun c!27402 () Bool)

(assert (=> d!46057 (= c!27402 lt!75750)))

(assert (=> d!46057 (= lt!75750 (containsKey!180 (toList!876 (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75441))))

(assert (=> d!46057 (= (contains!919 (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75441) lt!75752)))

(declare-fun b!144498 () Bool)

(declare-fun lt!75753 () Unit!4559)

(assert (=> b!144498 (= e!94139 lt!75753)))

(assert (=> b!144498 (= lt!75753 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75441))))

(assert (=> b!144498 (isDefined!130 (getValueByKey!176 (toList!876 (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75441))))

(declare-fun b!144499 () Bool)

(declare-fun Unit!4576 () Unit!4559)

(assert (=> b!144499 (= e!94139 Unit!4576)))

(declare-fun b!144500 () Bool)

(assert (=> b!144500 (= e!94140 (isDefined!130 (getValueByKey!176 (toList!876 (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75441)))))

(assert (= (and d!46057 c!27402) b!144498))

(assert (= (and d!46057 (not c!27402)) b!144499))

(assert (= (and d!46057 (not res!68770)) b!144500))

(declare-fun m!173969 () Bool)

(assert (=> d!46057 m!173969))

(declare-fun m!173971 () Bool)

(assert (=> b!144498 m!173971))

(declare-fun m!173973 () Bool)

(assert (=> b!144498 m!173973))

(assert (=> b!144498 m!173973))

(declare-fun m!173975 () Bool)

(assert (=> b!144498 m!173975))

(assert (=> b!144500 m!173973))

(assert (=> b!144500 m!173973))

(assert (=> b!144500 m!173975))

(assert (=> b!144097 d!46057))

(declare-fun d!46059 () Bool)

(declare-fun e!94141 () Bool)

(assert (=> d!46059 e!94141))

(declare-fun res!68771 () Bool)

(assert (=> d!46059 (=> (not res!68771) (not e!94141))))

(declare-fun lt!75754 () ListLongMap!1721)

(assert (=> d!46059 (= res!68771 (contains!919 lt!75754 (_1!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun lt!75756 () List!1749)

(assert (=> d!46059 (= lt!75754 (ListLongMap!1722 lt!75756))))

(declare-fun lt!75755 () Unit!4559)

(declare-fun lt!75757 () Unit!4559)

(assert (=> d!46059 (= lt!75755 lt!75757)))

(assert (=> d!46059 (= (getValueByKey!176 lt!75756 (_1!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46059 (= lt!75757 (lemmaContainsTupThenGetReturnValue!93 lt!75756 (_1!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46059 (= lt!75756 (insertStrictlySorted!96 (toList!876 lt!75427) (_1!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46059 (= (+!169 lt!75427 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75754)))

(declare-fun b!144501 () Bool)

(declare-fun res!68772 () Bool)

(assert (=> b!144501 (=> (not res!68772) (not e!94141))))

(assert (=> b!144501 (= res!68772 (= (getValueByKey!176 (toList!876 lt!75754) (_1!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(declare-fun b!144502 () Bool)

(assert (=> b!144502 (= e!94141 (contains!922 (toList!876 lt!75754) (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))))))

(assert (= (and d!46059 res!68771) b!144501))

(assert (= (and b!144501 res!68772) b!144502))

(declare-fun m!173977 () Bool)

(assert (=> d!46059 m!173977))

(declare-fun m!173979 () Bool)

(assert (=> d!46059 m!173979))

(declare-fun m!173981 () Bool)

(assert (=> d!46059 m!173981))

(declare-fun m!173983 () Bool)

(assert (=> d!46059 m!173983))

(declare-fun m!173985 () Bool)

(assert (=> b!144501 m!173985))

(declare-fun m!173987 () Bool)

(assert (=> b!144502 m!173987))

(assert (=> b!144097 d!46059))

(declare-fun d!46061 () Bool)

(assert (=> d!46061 (= (apply!122 (+!169 lt!75426 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75421) (apply!122 lt!75426 lt!75421))))

(declare-fun lt!75760 () Unit!4559)

(declare-fun choose!890 (ListLongMap!1721 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4559)

(assert (=> d!46061 (= lt!75760 (choose!890 lt!75426 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75421))))

(declare-fun e!94144 () Bool)

(assert (=> d!46061 e!94144))

(declare-fun res!68775 () Bool)

(assert (=> d!46061 (=> (not res!68775) (not e!94144))))

(assert (=> d!46061 (= res!68775 (contains!919 lt!75426 lt!75421))))

(assert (=> d!46061 (= (addApplyDifferent!98 lt!75426 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75421) lt!75760)))

(declare-fun b!144506 () Bool)

(assert (=> b!144506 (= e!94144 (not (= lt!75421 lt!75439)))))

(assert (= (and d!46061 res!68775) b!144506))

(assert (=> d!46061 m!173485))

(declare-fun m!173989 () Bool)

(assert (=> d!46061 m!173989))

(declare-fun m!173991 () Bool)

(assert (=> d!46061 m!173991))

(assert (=> d!46061 m!173485))

(assert (=> d!46061 m!173495))

(assert (=> d!46061 m!173511))

(assert (=> b!144097 d!46061))

(declare-fun d!46063 () Bool)

(declare-fun e!94145 () Bool)

(assert (=> d!46063 e!94145))

(declare-fun res!68776 () Bool)

(assert (=> d!46063 (=> (not res!68776) (not e!94145))))

(declare-fun lt!75761 () ListLongMap!1721)

(assert (=> d!46063 (= res!68776 (contains!919 lt!75761 (_1!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun lt!75763 () List!1749)

(assert (=> d!46063 (= lt!75761 (ListLongMap!1722 lt!75763))))

(declare-fun lt!75762 () Unit!4559)

(declare-fun lt!75764 () Unit!4559)

(assert (=> d!46063 (= lt!75762 lt!75764)))

(assert (=> d!46063 (= (getValueByKey!176 lt!75763 (_1!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46063 (= lt!75764 (lemmaContainsTupThenGetReturnValue!93 lt!75763 (_1!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46063 (= lt!75763 (insertStrictlySorted!96 (toList!876 lt!75426) (_1!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46063 (= (+!169 lt!75426 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75761)))

(declare-fun b!144507 () Bool)

(declare-fun res!68777 () Bool)

(assert (=> b!144507 (=> (not res!68777) (not e!94145))))

(assert (=> b!144507 (= res!68777 (= (getValueByKey!176 (toList!876 lt!75761) (_1!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(declare-fun b!144508 () Bool)

(assert (=> b!144508 (= e!94145 (contains!922 (toList!876 lt!75761) (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))

(assert (= (and d!46063 res!68776) b!144507))

(assert (= (and b!144507 res!68777) b!144508))

(declare-fun m!173993 () Bool)

(assert (=> d!46063 m!173993))

(declare-fun m!173995 () Bool)

(assert (=> d!46063 m!173995))

(declare-fun m!173997 () Bool)

(assert (=> d!46063 m!173997))

(declare-fun m!173999 () Bool)

(assert (=> d!46063 m!173999))

(declare-fun m!174001 () Bool)

(assert (=> b!144507 m!174001))

(declare-fun m!174003 () Bool)

(assert (=> b!144508 m!174003))

(assert (=> b!144097 d!46063))

(declare-fun b!144533 () Bool)

(declare-fun e!94161 () Bool)

(declare-fun e!94163 () Bool)

(assert (=> b!144533 (= e!94161 e!94163)))

(declare-fun c!27414 () Bool)

(assert (=> b!144533 (= c!27414 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun lt!75784 () ListLongMap!1721)

(declare-fun b!144534 () Bool)

(assert (=> b!144534 (= e!94163 (= lt!75784 (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun b!144535 () Bool)

(declare-fun lt!75785 () Unit!4559)

(declare-fun lt!75783 () Unit!4559)

(assert (=> b!144535 (= lt!75785 lt!75783)))

(declare-fun lt!75779 () (_ BitVec 64))

(declare-fun lt!75780 () ListLongMap!1721)

(declare-fun lt!75781 () V!3569)

(declare-fun lt!75782 () (_ BitVec 64))

(assert (=> b!144535 (not (contains!919 (+!169 lt!75780 (tuple2!2677 lt!75782 lt!75781)) lt!75779))))

(declare-fun addStillNotContains!67 (ListLongMap!1721 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4559)

(assert (=> b!144535 (= lt!75783 (addStillNotContains!67 lt!75780 lt!75782 lt!75781 lt!75779))))

(assert (=> b!144535 (= lt!75779 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!144535 (= lt!75781 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144535 (= lt!75782 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!16079 () ListLongMap!1721)

(assert (=> b!144535 (= lt!75780 call!16079)))

(declare-fun e!94164 () ListLongMap!1721)

(assert (=> b!144535 (= e!94164 (+!169 call!16079 (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!16076 () Bool)

(assert (=> bm!16076 (= call!16079 (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))))))

(declare-fun b!144536 () Bool)

(declare-fun isEmpty!426 (ListLongMap!1721) Bool)

(assert (=> b!144536 (= e!94163 (isEmpty!426 lt!75784))))

(declare-fun b!144537 () Bool)

(declare-fun e!94162 () ListLongMap!1721)

(assert (=> b!144537 (= e!94162 (ListLongMap!1722 Nil!1746))))

(declare-fun d!46065 () Bool)

(declare-fun e!94165 () Bool)

(assert (=> d!46065 e!94165))

(declare-fun res!68788 () Bool)

(assert (=> d!46065 (=> (not res!68788) (not e!94165))))

(assert (=> d!46065 (= res!68788 (not (contains!919 lt!75784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46065 (= lt!75784 e!94162)))

(declare-fun c!27412 () Bool)

(assert (=> d!46065 (= c!27412 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(assert (=> d!46065 (validMask!0 (mask!7332 (v!3302 (underlying!482 thiss!992))))))

(assert (=> d!46065 (= (getCurrentListMapNoExtraKeys!134 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))) lt!75784)))

(declare-fun b!144538 () Bool)

(declare-fun e!94166 () Bool)

(assert (=> b!144538 (= e!94166 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144538 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!144539 () Bool)

(assert (=> b!144539 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(assert (=> b!144539 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2590 (_values!2958 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun e!94160 () Bool)

(assert (=> b!144539 (= e!94160 (= (apply!122 lt!75784 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!144540 () Bool)

(assert (=> b!144540 (= e!94162 e!94164)))

(declare-fun c!27411 () Bool)

(assert (=> b!144540 (= c!27411 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144541 () Bool)

(assert (=> b!144541 (= e!94161 e!94160)))

(assert (=> b!144541 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun res!68786 () Bool)

(assert (=> b!144541 (= res!68786 (contains!919 lt!75784 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144541 (=> (not res!68786) (not e!94160))))

(declare-fun b!144542 () Bool)

(declare-fun res!68789 () Bool)

(assert (=> b!144542 (=> (not res!68789) (not e!94165))))

(assert (=> b!144542 (= res!68789 (not (contains!919 lt!75784 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144543 () Bool)

(assert (=> b!144543 (= e!94165 e!94161)))

(declare-fun c!27413 () Bool)

(assert (=> b!144543 (= c!27413 e!94166)))

(declare-fun res!68787 () Bool)

(assert (=> b!144543 (=> (not res!68787) (not e!94166))))

(assert (=> b!144543 (= res!68787 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(declare-fun b!144544 () Bool)

(assert (=> b!144544 (= e!94164 call!16079)))

(assert (= (and d!46065 c!27412) b!144537))

(assert (= (and d!46065 (not c!27412)) b!144540))

(assert (= (and b!144540 c!27411) b!144535))

(assert (= (and b!144540 (not c!27411)) b!144544))

(assert (= (or b!144535 b!144544) bm!16076))

(assert (= (and d!46065 res!68788) b!144542))

(assert (= (and b!144542 res!68789) b!144543))

(assert (= (and b!144543 res!68787) b!144538))

(assert (= (and b!144543 c!27413) b!144541))

(assert (= (and b!144543 (not c!27413)) b!144533))

(assert (= (and b!144541 res!68786) b!144539))

(assert (= (and b!144533 c!27414) b!144534))

(assert (= (and b!144533 (not c!27414)) b!144536))

(declare-fun b_lambda!6461 () Bool)

(assert (=> (not b_lambda!6461) (not b!144535)))

(assert (=> b!144535 t!6362))

(declare-fun b_and!8977 () Bool)

(assert (= b_and!8973 (and (=> t!6362 result!4223) b_and!8977)))

(assert (=> b!144535 t!6364))

(declare-fun b_and!8979 () Bool)

(assert (= b_and!8975 (and (=> t!6364 result!4227) b_and!8979)))

(declare-fun b_lambda!6463 () Bool)

(assert (=> (not b_lambda!6463) (not b!144539)))

(assert (=> b!144539 t!6362))

(declare-fun b_and!8981 () Bool)

(assert (= b_and!8977 (and (=> t!6362 result!4223) b_and!8981)))

(assert (=> b!144539 t!6364))

(declare-fun b_and!8983 () Bool)

(assert (= b_and!8979 (and (=> t!6364 result!4227) b_and!8983)))

(declare-fun m!174005 () Bool)

(assert (=> d!46065 m!174005))

(assert (=> d!46065 m!173461))

(assert (=> b!144535 m!173515))

(assert (=> b!144535 m!173455))

(assert (=> b!144535 m!173319))

(declare-fun m!174007 () Bool)

(assert (=> b!144535 m!174007))

(declare-fun m!174009 () Bool)

(assert (=> b!144535 m!174009))

(declare-fun m!174011 () Bool)

(assert (=> b!144535 m!174011))

(assert (=> b!144535 m!173515))

(assert (=> b!144535 m!173319))

(assert (=> b!144535 m!173517))

(assert (=> b!144535 m!174011))

(declare-fun m!174013 () Bool)

(assert (=> b!144535 m!174013))

(assert (=> b!144540 m!173455))

(assert (=> b!144540 m!173455))

(assert (=> b!144540 m!173471))

(assert (=> b!144539 m!173515))

(assert (=> b!144539 m!173455))

(assert (=> b!144539 m!173319))

(assert (=> b!144539 m!173455))

(declare-fun m!174015 () Bool)

(assert (=> b!144539 m!174015))

(assert (=> b!144539 m!173515))

(assert (=> b!144539 m!173319))

(assert (=> b!144539 m!173517))

(declare-fun m!174017 () Bool)

(assert (=> bm!16076 m!174017))

(assert (=> b!144541 m!173455))

(assert (=> b!144541 m!173455))

(declare-fun m!174019 () Bool)

(assert (=> b!144541 m!174019))

(declare-fun m!174021 () Bool)

(assert (=> b!144542 m!174021))

(assert (=> b!144538 m!173455))

(assert (=> b!144538 m!173455))

(assert (=> b!144538 m!173471))

(assert (=> b!144534 m!174017))

(declare-fun m!174023 () Bool)

(assert (=> b!144536 m!174023))

(assert (=> b!144097 d!46065))

(declare-fun d!46067 () Bool)

(assert (=> d!46067 (= (apply!122 lt!75426 lt!75421) (get!1542 (getValueByKey!176 (toList!876 lt!75426) lt!75421)))))

(declare-fun bs!6075 () Bool)

(assert (= bs!6075 d!46067))

(declare-fun m!174025 () Bool)

(assert (=> bs!6075 m!174025))

(assert (=> bs!6075 m!174025))

(declare-fun m!174027 () Bool)

(assert (=> bs!6075 m!174027))

(assert (=> b!144097 d!46067))

(declare-fun d!46069 () Bool)

(declare-fun e!94167 () Bool)

(assert (=> d!46069 e!94167))

(declare-fun res!68790 () Bool)

(assert (=> d!46069 (=> (not res!68790) (not e!94167))))

(declare-fun lt!75786 () ListLongMap!1721)

(assert (=> d!46069 (= res!68790 (contains!919 lt!75786 (_1!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun lt!75788 () List!1749)

(assert (=> d!46069 (= lt!75786 (ListLongMap!1722 lt!75788))))

(declare-fun lt!75787 () Unit!4559)

(declare-fun lt!75789 () Unit!4559)

(assert (=> d!46069 (= lt!75787 lt!75789)))

(assert (=> d!46069 (= (getValueByKey!176 lt!75788 (_1!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46069 (= lt!75789 (lemmaContainsTupThenGetReturnValue!93 lt!75788 (_1!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46069 (= lt!75788 (insertStrictlySorted!96 (toList!876 lt!75425) (_1!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46069 (= (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75786)))

(declare-fun b!144545 () Bool)

(declare-fun res!68791 () Bool)

(assert (=> b!144545 (=> (not res!68791) (not e!94167))))

(assert (=> b!144545 (= res!68791 (= (getValueByKey!176 (toList!876 lt!75786) (_1!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(declare-fun b!144546 () Bool)

(assert (=> b!144546 (= e!94167 (contains!922 (toList!876 lt!75786) (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))))))

(assert (= (and d!46069 res!68790) b!144545))

(assert (= (and b!144545 res!68791) b!144546))

(declare-fun m!174029 () Bool)

(assert (=> d!46069 m!174029))

(declare-fun m!174031 () Bool)

(assert (=> d!46069 m!174031))

(declare-fun m!174033 () Bool)

(assert (=> d!46069 m!174033))

(declare-fun m!174035 () Bool)

(assert (=> d!46069 m!174035))

(declare-fun m!174037 () Bool)

(assert (=> b!144545 m!174037))

(declare-fun m!174039 () Bool)

(assert (=> b!144546 m!174039))

(assert (=> b!144097 d!46069))

(declare-fun d!46071 () Bool)

(assert (=> d!46071 (= (apply!122 (+!169 lt!75427 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75422) (get!1542 (getValueByKey!176 (toList!876 (+!169 lt!75427 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75422)))))

(declare-fun bs!6076 () Bool)

(assert (= bs!6076 d!46071))

(declare-fun m!174041 () Bool)

(assert (=> bs!6076 m!174041))

(assert (=> bs!6076 m!174041))

(declare-fun m!174043 () Bool)

(assert (=> bs!6076 m!174043))

(assert (=> b!144097 d!46071))

(declare-fun d!46073 () Bool)

(assert (=> d!46073 (= (apply!122 (+!169 lt!75432 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75436) (apply!122 lt!75432 lt!75436))))

(declare-fun lt!75790 () Unit!4559)

(assert (=> d!46073 (= lt!75790 (choose!890 lt!75432 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75436))))

(declare-fun e!94168 () Bool)

(assert (=> d!46073 e!94168))

(declare-fun res!68792 () Bool)

(assert (=> d!46073 (=> (not res!68792) (not e!94168))))

(assert (=> d!46073 (= res!68792 (contains!919 lt!75432 lt!75436))))

(assert (=> d!46073 (= (addApplyDifferent!98 lt!75432 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75436) lt!75790)))

(declare-fun b!144547 () Bool)

(assert (=> b!144547 (= e!94168 (not (= lt!75436 lt!75420)))))

(assert (= (and d!46073 res!68792) b!144547))

(assert (=> d!46073 m!173497))

(declare-fun m!174045 () Bool)

(assert (=> d!46073 m!174045))

(declare-fun m!174047 () Bool)

(assert (=> d!46073 m!174047))

(assert (=> d!46073 m!173497))

(assert (=> d!46073 m!173499))

(assert (=> d!46073 m!173483))

(assert (=> b!144097 d!46073))

(declare-fun d!46075 () Bool)

(assert (=> d!46075 (= (apply!122 (+!169 lt!75427 (tuple2!2677 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75422) (apply!122 lt!75427 lt!75422))))

(declare-fun lt!75791 () Unit!4559)

(assert (=> d!46075 (= lt!75791 (choose!890 lt!75427 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75422))))

(declare-fun e!94169 () Bool)

(assert (=> d!46075 e!94169))

(declare-fun res!68793 () Bool)

(assert (=> d!46075 (=> (not res!68793) (not e!94169))))

(assert (=> d!46075 (= res!68793 (contains!919 lt!75427 lt!75422))))

(assert (=> d!46075 (= (addApplyDifferent!98 lt!75427 lt!75440 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75422) lt!75791)))

(declare-fun b!144548 () Bool)

(assert (=> b!144548 (= e!94169 (not (= lt!75422 lt!75440)))))

(assert (= (and d!46075 res!68793) b!144548))

(assert (=> d!46075 m!173501))

(declare-fun m!174049 () Bool)

(assert (=> d!46075 m!174049))

(declare-fun m!174051 () Bool)

(assert (=> d!46075 m!174051))

(assert (=> d!46075 m!173501))

(assert (=> d!46075 m!173503))

(assert (=> d!46075 m!173487))

(assert (=> b!144097 d!46075))

(declare-fun d!46077 () Bool)

(assert (=> d!46077 (= (apply!122 lt!75427 lt!75422) (get!1542 (getValueByKey!176 (toList!876 lt!75427) lt!75422)))))

(declare-fun bs!6077 () Bool)

(assert (= bs!6077 d!46077))

(declare-fun m!174053 () Bool)

(assert (=> bs!6077 m!174053))

(assert (=> bs!6077 m!174053))

(declare-fun m!174055 () Bool)

(assert (=> bs!6077 m!174055))

(assert (=> b!144097 d!46077))

(declare-fun d!46079 () Bool)

(declare-fun e!94170 () Bool)

(assert (=> d!46079 e!94170))

(declare-fun res!68794 () Bool)

(assert (=> d!46079 (=> (not res!68794) (not e!94170))))

(declare-fun lt!75792 () ListLongMap!1721)

(assert (=> d!46079 (= res!68794 (contains!919 lt!75792 (_1!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(declare-fun lt!75794 () List!1749)

(assert (=> d!46079 (= lt!75792 (ListLongMap!1722 lt!75794))))

(declare-fun lt!75793 () Unit!4559)

(declare-fun lt!75795 () Unit!4559)

(assert (=> d!46079 (= lt!75793 lt!75795)))

(assert (=> d!46079 (= (getValueByKey!176 lt!75794 (_1!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46079 (= lt!75795 (lemmaContainsTupThenGetReturnValue!93 lt!75794 (_1!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46079 (= lt!75794 (insertStrictlySorted!96 (toList!876 lt!75432) (_1!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) (_2!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))))))

(assert (=> d!46079 (= (+!169 lt!75432 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75792)))

(declare-fun b!144549 () Bool)

(declare-fun res!68795 () Bool)

(assert (=> b!144549 (=> (not res!68795) (not e!94170))))

(assert (=> b!144549 (= res!68795 (= (getValueByKey!176 (toList!876 lt!75792) (_1!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) (Some!181 (_2!1349 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))))

(declare-fun b!144550 () Bool)

(assert (=> b!144550 (= e!94170 (contains!922 (toList!876 lt!75792) (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))))))

(assert (= (and d!46079 res!68794) b!144549))

(assert (= (and b!144549 res!68795) b!144550))

(declare-fun m!174057 () Bool)

(assert (=> d!46079 m!174057))

(declare-fun m!174059 () Bool)

(assert (=> d!46079 m!174059))

(declare-fun m!174061 () Bool)

(assert (=> d!46079 m!174061))

(declare-fun m!174063 () Bool)

(assert (=> d!46079 m!174063))

(declare-fun m!174065 () Bool)

(assert (=> b!144549 m!174065))

(declare-fun m!174067 () Bool)

(assert (=> b!144550 m!174067))

(assert (=> b!144097 d!46079))

(declare-fun d!46081 () Bool)

(assert (=> d!46081 (contains!919 (+!169 lt!75425 (tuple2!2677 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75441)))

(declare-fun lt!75798 () Unit!4559)

(declare-fun choose!891 (ListLongMap!1721 (_ BitVec 64) V!3569 (_ BitVec 64)) Unit!4559)

(assert (=> d!46081 (= lt!75798 (choose!891 lt!75425 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75441))))

(assert (=> d!46081 (contains!919 lt!75425 lt!75441)))

(assert (=> d!46081 (= (addStillContains!98 lt!75425 lt!75438 (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) lt!75441) lt!75798)))

(declare-fun bs!6078 () Bool)

(assert (= bs!6078 d!46081))

(assert (=> bs!6078 m!173489))

(assert (=> bs!6078 m!173489))

(assert (=> bs!6078 m!173491))

(declare-fun m!174069 () Bool)

(assert (=> bs!6078 m!174069))

(declare-fun m!174071 () Bool)

(assert (=> bs!6078 m!174071))

(assert (=> b!144097 d!46081))

(declare-fun d!46083 () Bool)

(assert (=> d!46083 (= (apply!122 (+!169 lt!75426 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75421) (get!1542 (getValueByKey!176 (toList!876 (+!169 lt!75426 (tuple2!2677 lt!75439 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75421)))))

(declare-fun bs!6079 () Bool)

(assert (= bs!6079 d!46083))

(declare-fun m!174073 () Bool)

(assert (=> bs!6079 m!174073))

(assert (=> bs!6079 m!174073))

(declare-fun m!174075 () Bool)

(assert (=> bs!6079 m!174075))

(assert (=> b!144097 d!46083))

(declare-fun d!46085 () Bool)

(assert (=> d!46085 (= (apply!122 lt!75432 lt!75436) (get!1542 (getValueByKey!176 (toList!876 lt!75432) lt!75436)))))

(declare-fun bs!6080 () Bool)

(assert (= bs!6080 d!46085))

(declare-fun m!174077 () Bool)

(assert (=> bs!6080 m!174077))

(assert (=> bs!6080 m!174077))

(declare-fun m!174079 () Bool)

(assert (=> bs!6080 m!174079))

(assert (=> b!144097 d!46085))

(declare-fun d!46087 () Bool)

(assert (=> d!46087 (= (apply!122 (+!169 lt!75432 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992))))) lt!75436) (get!1542 (getValueByKey!176 (toList!876 (+!169 lt!75432 (tuple2!2677 lt!75420 (minValue!2822 (v!3302 (underlying!482 thiss!992)))))) lt!75436)))))

(declare-fun bs!6081 () Bool)

(assert (= bs!6081 d!46087))

(declare-fun m!174081 () Bool)

(assert (=> bs!6081 m!174081))

(assert (=> bs!6081 m!174081))

(declare-fun m!174083 () Bool)

(assert (=> bs!6081 m!174083))

(assert (=> b!144097 d!46087))

(declare-fun b!144552 () Bool)

(declare-fun e!94172 () Bool)

(assert (=> b!144552 (= e!94172 (contains!920 (ite c!27278 (Cons!1746 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) Nil!1747) Nil!1747) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun call!16080 () Bool)

(declare-fun bm!16077 () Bool)

(declare-fun c!27415 () Bool)

(assert (=> bm!16077 (= call!16080 (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27415 (Cons!1746 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27278 (Cons!1746 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) Nil!1747) Nil!1747)) (ite c!27278 (Cons!1746 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) Nil!1747) Nil!1747))))))

(declare-fun b!144554 () Bool)

(declare-fun e!94174 () Bool)

(assert (=> b!144554 (= e!94174 call!16080)))

(declare-fun b!144555 () Bool)

(declare-fun e!94171 () Bool)

(assert (=> b!144555 (= e!94171 e!94174)))

(assert (=> b!144555 (= c!27415 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!144556 () Bool)

(declare-fun e!94173 () Bool)

(assert (=> b!144556 (= e!94173 e!94171)))

(declare-fun res!68797 () Bool)

(assert (=> b!144556 (=> (not res!68797) (not e!94171))))

(assert (=> b!144556 (= res!68797 (not e!94172))))

(declare-fun res!68796 () Bool)

(assert (=> b!144556 (=> (not res!68796) (not e!94172))))

(assert (=> b!144556 (= res!68796 (validKeyInArray!0 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!144553 () Bool)

(assert (=> b!144553 (= e!94174 call!16080)))

(declare-fun d!46089 () Bool)

(declare-fun res!68798 () Bool)

(assert (=> d!46089 (=> res!68798 e!94173)))

(assert (=> d!46089 (= res!68798 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2589 (_keys!4739 (v!3302 (underlying!482 thiss!992))))))))

(assert (=> d!46089 (= (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27278 (Cons!1746 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) Nil!1747) Nil!1747)) e!94173)))

(assert (= (and d!46089 (not res!68798)) b!144556))

(assert (= (and b!144556 res!68796) b!144552))

(assert (= (and b!144556 res!68797) b!144555))

(assert (= (and b!144555 c!27415) b!144554))

(assert (= (and b!144555 (not c!27415)) b!144553))

(assert (= (or b!144554 b!144553) bm!16077))

(declare-fun m!174085 () Bool)

(assert (=> b!144552 m!174085))

(assert (=> b!144552 m!174085))

(declare-fun m!174087 () Bool)

(assert (=> b!144552 m!174087))

(assert (=> bm!16077 m!174085))

(declare-fun m!174089 () Bool)

(assert (=> bm!16077 m!174089))

(assert (=> b!144555 m!174085))

(assert (=> b!144555 m!174085))

(declare-fun m!174091 () Bool)

(assert (=> b!144555 m!174091))

(assert (=> b!144556 m!174085))

(assert (=> b!144556 m!174085))

(assert (=> b!144556 m!174091))

(assert (=> bm!15941 d!46089))

(assert (=> d!45951 d!45949))

(declare-fun d!46091 () Bool)

(assert (=> d!46091 (arrayNoDuplicates!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) from!355 Nil!1747)))

(assert (=> d!46091 true))

(declare-fun _$71!171 () Unit!4559)

(assert (=> d!46091 (= (choose!39 (_keys!4739 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!171)))

(declare-fun bs!6082 () Bool)

(assert (= bs!6082 d!46091))

(assert (=> bs!6082 m!173307))

(assert (=> d!45951 d!46091))

(declare-fun d!46093 () Bool)

(declare-fun e!94177 () Bool)

(assert (=> d!46093 e!94177))

(declare-fun c!27418 () Bool)

(assert (=> d!46093 (= c!27418 (and (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!46093 true))

(declare-fun _$29!171 () Unit!4559)

(assert (=> d!46093 (= (choose!886 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (_values!2958 (v!3302 (underlying!482 thiss!992))) (mask!7332 (v!3302 (underlying!482 thiss!992))) (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) (zeroValue!2822 (v!3302 (underlying!482 thiss!992))) (minValue!2822 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992)))) _$29!171)))

(declare-fun b!144561 () Bool)

(assert (=> b!144561 (= e!94177 (arrayContainsKey!0 (_keys!4739 (v!3302 (underlying!482 thiss!992))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144562 () Bool)

(assert (=> b!144562 (= e!94177 (ite (= (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46093 c!27418) b!144561))

(assert (= (and d!46093 (not c!27418)) b!144562))

(assert (=> b!144561 m!173309))

(assert (=> b!144561 m!173313))

(assert (=> d!45955 d!46093))

(declare-fun d!46095 () Bool)

(assert (=> d!46095 (= (validMask!0 (mask!7332 (v!3302 (underlying!482 thiss!992)))) (and (or (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000000111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000001111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000011111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000000111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000001111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000011111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000000111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000001111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000011111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000000111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000001111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000011111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000000111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000001111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000011111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000000111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000001111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000011111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000000111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000001111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000011111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000000111111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000001111111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000011111111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00000111111111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00001111111111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00011111111111111111111111111111) (= (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7332 (v!3302 (underlying!482 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!45955 d!46095))

(declare-fun d!46097 () Bool)

(assert (=> d!46097 (= (+!169 (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) lt!75513 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75801 () Unit!4559)

(declare-fun choose!892 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 V!3569 Int) Unit!4559)

(assert (=> d!46097 (= lt!75801 (choose!892 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) lt!75513 (zeroValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46097 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46097 (= (lemmaChangeZeroKeyThenAddPairToListMap!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) lt!75513 (zeroValue!2822 newMap!16) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2822 newMap!16) (defaultEntry!2975 newMap!16)) lt!75801)))

(declare-fun bs!6083 () Bool)

(assert (= bs!6083 d!46097))

(assert (=> bs!6083 m!173467))

(assert (=> bs!6083 m!173645))

(assert (=> bs!6083 m!173321))

(declare-fun m!174093 () Bool)

(assert (=> bs!6083 m!174093))

(assert (=> bs!6083 m!173321))

(declare-fun m!174095 () Bool)

(assert (=> bs!6083 m!174095))

(assert (=> bs!6083 m!173467))

(declare-fun m!174097 () Bool)

(assert (=> bs!6083 m!174097))

(assert (=> b!144193 d!46097))

(declare-fun d!46099 () Bool)

(assert (=> d!46099 (= (get!1540 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3301 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (=> b!144235 d!46099))

(declare-fun d!46101 () Bool)

(declare-fun isEmpty!427 (Option!182) Bool)

(assert (=> d!46101 (= (isDefined!130 (getValueByKey!176 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))) (not (isEmpty!427 (getValueByKey!176 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))))

(declare-fun bs!6084 () Bool)

(assert (= bs!6084 d!46101))

(assert (=> bs!6084 m!173529))

(declare-fun m!174099 () Bool)

(assert (=> bs!6084 m!174099))

(assert (=> b!144110 d!46101))

(declare-fun b!144572 () Bool)

(declare-fun e!94182 () Option!182)

(declare-fun e!94183 () Option!182)

(assert (=> b!144572 (= e!94182 e!94183)))

(declare-fun c!27424 () Bool)

(assert (=> b!144572 (= c!27424 (and ((_ is Cons!1745) (toList!876 lt!75328)) (not (= (_1!1349 (h!2353 (toList!876 lt!75328))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))))

(declare-fun b!144573 () Bool)

(assert (=> b!144573 (= e!94183 (getValueByKey!176 (t!6365 (toList!876 lt!75328)) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun d!46103 () Bool)

(declare-fun c!27423 () Bool)

(assert (=> d!46103 (= c!27423 (and ((_ is Cons!1745) (toList!876 lt!75328)) (= (_1!1349 (h!2353 (toList!876 lt!75328))) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355))))))

(assert (=> d!46103 (= (getValueByKey!176 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) e!94182)))

(declare-fun b!144571 () Bool)

(assert (=> b!144571 (= e!94182 (Some!181 (_2!1349 (h!2353 (toList!876 lt!75328)))))))

(declare-fun b!144574 () Bool)

(assert (=> b!144574 (= e!94183 None!180)))

(assert (= (and d!46103 c!27423) b!144571))

(assert (= (and d!46103 (not c!27423)) b!144572))

(assert (= (and b!144572 c!27424) b!144573))

(assert (= (and b!144572 (not c!27424)) b!144574))

(assert (=> b!144573 m!173309))

(declare-fun m!174101 () Bool)

(assert (=> b!144573 m!174101))

(assert (=> b!144110 d!46103))

(declare-fun d!46105 () Bool)

(assert (=> d!46105 (= (map!1430 (_2!1350 lt!75509)) (getCurrentListMap!536 (_keys!4739 (_2!1350 lt!75509)) (_values!2958 (_2!1350 lt!75509)) (mask!7332 (_2!1350 lt!75509)) (extraKeys!2724 (_2!1350 lt!75509)) (zeroValue!2822 (_2!1350 lt!75509)) (minValue!2822 (_2!1350 lt!75509)) #b00000000000000000000000000000000 (defaultEntry!2975 (_2!1350 lt!75509))))))

(declare-fun bs!6085 () Bool)

(assert (= bs!6085 d!46105))

(declare-fun m!174103 () Bool)

(assert (=> bs!6085 m!174103))

(assert (=> bm!16028 d!46105))

(declare-fun d!46107 () Bool)

(declare-fun e!94185 () Bool)

(assert (=> d!46107 e!94185))

(declare-fun res!68799 () Bool)

(assert (=> d!46107 (=> res!68799 e!94185)))

(declare-fun lt!75804 () Bool)

(assert (=> d!46107 (= res!68799 (not lt!75804))))

(declare-fun lt!75802 () Bool)

(assert (=> d!46107 (= lt!75804 lt!75802)))

(declare-fun lt!75803 () Unit!4559)

(declare-fun e!94184 () Unit!4559)

(assert (=> d!46107 (= lt!75803 e!94184)))

(declare-fun c!27425 () Bool)

(assert (=> d!46107 (= c!27425 lt!75802)))

(assert (=> d!46107 (= lt!75802 (containsKey!180 (toList!876 lt!75431) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!46107 (= (contains!919 lt!75431 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!75804)))

(declare-fun b!144575 () Bool)

(declare-fun lt!75805 () Unit!4559)

(assert (=> b!144575 (= e!94184 lt!75805)))

(assert (=> b!144575 (= lt!75805 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 lt!75431) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144575 (isDefined!130 (getValueByKey!176 (toList!876 lt!75431) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144576 () Bool)

(declare-fun Unit!4577 () Unit!4559)

(assert (=> b!144576 (= e!94184 Unit!4577)))

(declare-fun b!144577 () Bool)

(assert (=> b!144577 (= e!94185 (isDefined!130 (getValueByKey!176 (toList!876 lt!75431) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!46107 c!27425) b!144575))

(assert (= (and d!46107 (not c!27425)) b!144576))

(assert (= (and d!46107 (not res!68799)) b!144577))

(assert (=> d!46107 m!173455))

(declare-fun m!174105 () Bool)

(assert (=> d!46107 m!174105))

(assert (=> b!144575 m!173455))

(declare-fun m!174107 () Bool)

(assert (=> b!144575 m!174107))

(assert (=> b!144575 m!173455))

(assert (=> b!144575 m!173721))

(assert (=> b!144575 m!173721))

(declare-fun m!174109 () Bool)

(assert (=> b!144575 m!174109))

(assert (=> b!144577 m!173455))

(assert (=> b!144577 m!173721))

(assert (=> b!144577 m!173721))

(assert (=> b!144577 m!174109))

(assert (=> b!144093 d!46107))

(assert (=> d!45961 d!46095))

(declare-fun d!46109 () Bool)

(declare-fun e!94187 () Bool)

(assert (=> d!46109 e!94187))

(declare-fun res!68800 () Bool)

(assert (=> d!46109 (=> res!68800 e!94187)))

(declare-fun lt!75808 () Bool)

(assert (=> d!46109 (= res!68800 (not lt!75808))))

(declare-fun lt!75806 () Bool)

(assert (=> d!46109 (= lt!75808 lt!75806)))

(declare-fun lt!75807 () Unit!4559)

(declare-fun e!94186 () Unit!4559)

(assert (=> d!46109 (= lt!75807 e!94186)))

(declare-fun c!27426 () Bool)

(assert (=> d!46109 (= c!27426 lt!75806)))

(assert (=> d!46109 (= lt!75806 (containsKey!180 (toList!876 call!16014) (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75532))))))

(assert (=> d!46109 (= (contains!919 call!16014 (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75532))) lt!75808)))

(declare-fun b!144578 () Bool)

(declare-fun lt!75809 () Unit!4559)

(assert (=> b!144578 (= e!94186 lt!75809)))

(assert (=> b!144578 (= lt!75809 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 call!16014) (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75532))))))

(assert (=> b!144578 (isDefined!130 (getValueByKey!176 (toList!876 call!16014) (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75532))))))

(declare-fun b!144579 () Bool)

(declare-fun Unit!4578 () Unit!4559)

(assert (=> b!144579 (= e!94186 Unit!4578)))

(declare-fun b!144580 () Bool)

(assert (=> b!144580 (= e!94187 (isDefined!130 (getValueByKey!176 (toList!876 call!16014) (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75532)))))))

(assert (= (and d!46109 c!27426) b!144578))

(assert (= (and d!46109 (not c!27426)) b!144579))

(assert (= (and d!46109 (not res!68800)) b!144580))

(assert (=> d!46109 m!173573))

(declare-fun m!174111 () Bool)

(assert (=> d!46109 m!174111))

(assert (=> b!144578 m!173573))

(declare-fun m!174113 () Bool)

(assert (=> b!144578 m!174113))

(assert (=> b!144578 m!173573))

(declare-fun m!174115 () Bool)

(assert (=> b!144578 m!174115))

(assert (=> b!144578 m!174115))

(declare-fun m!174117 () Bool)

(assert (=> b!144578 m!174117))

(assert (=> b!144580 m!173573))

(assert (=> b!144580 m!174115))

(assert (=> b!144580 m!174115))

(assert (=> b!144580 m!174117))

(assert (=> b!144225 d!46109))

(declare-fun d!46111 () Bool)

(declare-fun e!94190 () Bool)

(assert (=> d!46111 e!94190))

(declare-fun res!68803 () Bool)

(assert (=> d!46111 (=> (not res!68803) (not e!94190))))

(assert (=> d!46111 (= res!68803 (and (bvsge (index!3302 lt!75532) #b00000000000000000000000000000000) (bvslt (index!3302 lt!75532) (size!2589 (_keys!4739 newMap!16)))))))

(declare-fun lt!75812 () Unit!4559)

(declare-fun choose!893 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) Int) Unit!4559)

(assert (=> d!46111 (= lt!75812 (choose!893 (_keys!4739 newMap!16) lt!75530 (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3302 lt!75532) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46111 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46111 (= (lemmaValidKeyInArrayIsInListMap!126 (_keys!4739 newMap!16) lt!75530 (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3302 lt!75532) (defaultEntry!2975 newMap!16)) lt!75812)))

(declare-fun b!144583 () Bool)

(assert (=> b!144583 (= e!94190 (contains!919 (getCurrentListMap!536 (_keys!4739 newMap!16) lt!75530 (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (select (arr!2314 (_keys!4739 newMap!16)) (index!3302 lt!75532))))))

(assert (= (and d!46111 res!68803) b!144583))

(declare-fun m!174119 () Bool)

(assert (=> d!46111 m!174119))

(assert (=> d!46111 m!173645))

(declare-fun m!174121 () Bool)

(assert (=> b!144583 m!174121))

(assert (=> b!144583 m!173573))

(assert (=> b!144583 m!174121))

(assert (=> b!144583 m!173573))

(declare-fun m!174123 () Bool)

(assert (=> b!144583 m!174123))

(assert (=> b!144225 d!46111))

(declare-fun c!27427 () Bool)

(declare-fun bm!16078 () Bool)

(declare-fun call!16083 () ListLongMap!1721)

(declare-fun call!16085 () ListLongMap!1721)

(declare-fun call!16087 () ListLongMap!1721)

(declare-fun call!16082 () ListLongMap!1721)

(declare-fun c!27431 () Bool)

(assert (=> bm!16078 (= call!16087 (+!169 (ite c!27427 call!16083 (ite c!27431 call!16085 call!16082)) (ite (or c!27427 c!27431) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 newMap!16)) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16)))))))

(declare-fun b!144584 () Bool)

(declare-fun e!94202 () ListLongMap!1721)

(declare-fun call!16081 () ListLongMap!1721)

(assert (=> b!144584 (= e!94202 call!16081)))

(declare-fun b!144585 () Bool)

(declare-fun e!94199 () Bool)

(declare-fun e!94197 () Bool)

(assert (=> b!144585 (= e!94199 e!94197)))

(declare-fun c!27430 () Bool)

(assert (=> b!144585 (= c!27430 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144586 () Bool)

(declare-fun e!94193 () Bool)

(assert (=> b!144586 (= e!94197 e!94193)))

(declare-fun res!68807 () Bool)

(declare-fun call!16084 () Bool)

(assert (=> b!144586 (= res!68807 call!16084)))

(assert (=> b!144586 (=> (not res!68807) (not e!94193))))

(declare-fun bm!16079 () Bool)

(assert (=> bm!16079 (= call!16082 call!16085)))

(declare-fun b!144587 () Bool)

(declare-fun c!27432 () Bool)

(assert (=> b!144587 (= c!27432 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94191 () ListLongMap!1721)

(assert (=> b!144587 (= e!94202 e!94191)))

(declare-fun b!144588 () Bool)

(assert (=> b!144588 (= e!94197 (not call!16084))))

(declare-fun d!46113 () Bool)

(assert (=> d!46113 e!94199))

(declare-fun res!68811 () Bool)

(assert (=> d!46113 (=> (not res!68811) (not e!94199))))

(assert (=> d!46113 (= res!68811 (or (bvsge #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))))

(declare-fun lt!75824 () ListLongMap!1721)

(declare-fun lt!75826 () ListLongMap!1721)

(assert (=> d!46113 (= lt!75824 lt!75826)))

(declare-fun lt!75827 () Unit!4559)

(declare-fun e!94201 () Unit!4559)

(assert (=> d!46113 (= lt!75827 e!94201)))

(declare-fun c!27428 () Bool)

(declare-fun e!94198 () Bool)

(assert (=> d!46113 (= c!27428 e!94198)))

(declare-fun res!68808 () Bool)

(assert (=> d!46113 (=> (not res!68808) (not e!94198))))

(assert (=> d!46113 (= res!68808 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun e!94192 () ListLongMap!1721)

(assert (=> d!46113 (= lt!75826 e!94192)))

(assert (=> d!46113 (= c!27427 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46113 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46113 (= (getCurrentListMap!536 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) lt!75824)))

(declare-fun b!144589 () Bool)

(declare-fun e!94200 () Bool)

(declare-fun e!94203 () Bool)

(assert (=> b!144589 (= e!94200 e!94203)))

(declare-fun res!68805 () Bool)

(declare-fun call!16086 () Bool)

(assert (=> b!144589 (= res!68805 call!16086)))

(assert (=> b!144589 (=> (not res!68805) (not e!94203))))

(declare-fun b!144590 () Bool)

(declare-fun Unit!4579 () Unit!4559)

(assert (=> b!144590 (= e!94201 Unit!4579)))

(declare-fun bm!16080 () Bool)

(assert (=> bm!16080 (= call!16081 call!16087)))

(declare-fun b!144591 () Bool)

(assert (=> b!144591 (= e!94203 (= (apply!122 lt!75824 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2822 newMap!16)))))

(declare-fun b!144592 () Bool)

(assert (=> b!144592 (= e!94191 call!16081)))

(declare-fun bm!16081 () Bool)

(assert (=> bm!16081 (= call!16083 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bm!16082 () Bool)

(assert (=> bm!16082 (= call!16086 (contains!919 lt!75824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144593 () Bool)

(assert (=> b!144593 (= e!94200 (not call!16086))))

(declare-fun b!144594 () Bool)

(assert (=> b!144594 (= e!94193 (= (apply!122 lt!75824 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2822 newMap!16)))))

(declare-fun b!144595 () Bool)

(assert (=> b!144595 (= e!94191 call!16082)))

(declare-fun bm!16083 () Bool)

(assert (=> bm!16083 (= call!16084 (contains!919 lt!75824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144596 () Bool)

(declare-fun e!94196 () Bool)

(declare-fun e!94194 () Bool)

(assert (=> b!144596 (= e!94196 e!94194)))

(declare-fun res!68810 () Bool)

(assert (=> b!144596 (=> (not res!68810) (not e!94194))))

(assert (=> b!144596 (= res!68810 (contains!919 lt!75824 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144597 () Bool)

(assert (=> b!144597 (= e!94198 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144598 () Bool)

(assert (=> b!144598 (= e!94194 (= (apply!122 lt!75824 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)) (get!1538 (select (arr!2315 (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!439 (defaultEntry!2975 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144598 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2590 (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))))))))

(assert (=> b!144598 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun bm!16084 () Bool)

(assert (=> bm!16084 (= call!16085 call!16083)))

(declare-fun b!144599 () Bool)

(declare-fun e!94195 () Bool)

(assert (=> b!144599 (= e!94195 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144600 () Bool)

(declare-fun lt!75823 () Unit!4559)

(assert (=> b!144600 (= e!94201 lt!75823)))

(declare-fun lt!75818 () ListLongMap!1721)

(assert (=> b!144600 (= lt!75818 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75831 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75834 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75834 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75822 () Unit!4559)

(assert (=> b!144600 (= lt!75822 (addStillContains!98 lt!75818 lt!75831 (zeroValue!2822 newMap!16) lt!75834))))

(assert (=> b!144600 (contains!919 (+!169 lt!75818 (tuple2!2677 lt!75831 (zeroValue!2822 newMap!16))) lt!75834)))

(declare-fun lt!75816 () Unit!4559)

(assert (=> b!144600 (= lt!75816 lt!75822)))

(declare-fun lt!75825 () ListLongMap!1721)

(assert (=> b!144600 (= lt!75825 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75813 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75813 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75829 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75829 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75830 () Unit!4559)

(assert (=> b!144600 (= lt!75830 (addApplyDifferent!98 lt!75825 lt!75813 (minValue!2822 newMap!16) lt!75829))))

(assert (=> b!144600 (= (apply!122 (+!169 lt!75825 (tuple2!2677 lt!75813 (minValue!2822 newMap!16))) lt!75829) (apply!122 lt!75825 lt!75829))))

(declare-fun lt!75817 () Unit!4559)

(assert (=> b!144600 (= lt!75817 lt!75830)))

(declare-fun lt!75820 () ListLongMap!1721)

(assert (=> b!144600 (= lt!75820 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75833 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75815 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75815 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75828 () Unit!4559)

(assert (=> b!144600 (= lt!75828 (addApplyDifferent!98 lt!75820 lt!75833 (zeroValue!2822 newMap!16) lt!75815))))

(assert (=> b!144600 (= (apply!122 (+!169 lt!75820 (tuple2!2677 lt!75833 (zeroValue!2822 newMap!16))) lt!75815) (apply!122 lt!75820 lt!75815))))

(declare-fun lt!75821 () Unit!4559)

(assert (=> b!144600 (= lt!75821 lt!75828)))

(declare-fun lt!75819 () ListLongMap!1721)

(assert (=> b!144600 (= lt!75819 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75832 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75832 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75814 () (_ BitVec 64))

(assert (=> b!144600 (= lt!75814 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144600 (= lt!75823 (addApplyDifferent!98 lt!75819 lt!75832 (minValue!2822 newMap!16) lt!75814))))

(assert (=> b!144600 (= (apply!122 (+!169 lt!75819 (tuple2!2677 lt!75832 (minValue!2822 newMap!16))) lt!75814) (apply!122 lt!75819 lt!75814))))

(declare-fun b!144601 () Bool)

(declare-fun res!68806 () Bool)

(assert (=> b!144601 (=> (not res!68806) (not e!94199))))

(assert (=> b!144601 (= res!68806 e!94196)))

(declare-fun res!68804 () Bool)

(assert (=> b!144601 (=> res!68804 e!94196)))

(assert (=> b!144601 (= res!68804 (not e!94195))))

(declare-fun res!68812 () Bool)

(assert (=> b!144601 (=> (not res!68812) (not e!94195))))

(assert (=> b!144601 (= res!68812 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144602 () Bool)

(assert (=> b!144602 (= e!94192 e!94202)))

(assert (=> b!144602 (= c!27431 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144603 () Bool)

(assert (=> b!144603 (= e!94192 (+!169 call!16087 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16))))))

(declare-fun b!144604 () Bool)

(declare-fun res!68809 () Bool)

(assert (=> b!144604 (=> (not res!68809) (not e!94199))))

(assert (=> b!144604 (= res!68809 e!94200)))

(declare-fun c!27429 () Bool)

(assert (=> b!144604 (= c!27429 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!46113 c!27427) b!144603))

(assert (= (and d!46113 (not c!27427)) b!144602))

(assert (= (and b!144602 c!27431) b!144584))

(assert (= (and b!144602 (not c!27431)) b!144587))

(assert (= (and b!144587 c!27432) b!144592))

(assert (= (and b!144587 (not c!27432)) b!144595))

(assert (= (or b!144592 b!144595) bm!16079))

(assert (= (or b!144584 bm!16079) bm!16084))

(assert (= (or b!144584 b!144592) bm!16080))

(assert (= (or b!144603 bm!16084) bm!16081))

(assert (= (or b!144603 bm!16080) bm!16078))

(assert (= (and d!46113 res!68808) b!144597))

(assert (= (and d!46113 c!27428) b!144600))

(assert (= (and d!46113 (not c!27428)) b!144590))

(assert (= (and d!46113 res!68811) b!144601))

(assert (= (and b!144601 res!68812) b!144599))

(assert (= (and b!144601 (not res!68804)) b!144596))

(assert (= (and b!144596 res!68810) b!144598))

(assert (= (and b!144601 res!68806) b!144604))

(assert (= (and b!144604 c!27429) b!144589))

(assert (= (and b!144604 (not c!27429)) b!144593))

(assert (= (and b!144589 res!68805) b!144591))

(assert (= (or b!144589 b!144593) bm!16082))

(assert (= (and b!144604 res!68809) b!144585))

(assert (= (and b!144585 c!27430) b!144586))

(assert (= (and b!144585 (not c!27430)) b!144588))

(assert (= (and b!144586 res!68807) b!144594))

(assert (= (or b!144586 b!144588) bm!16083))

(declare-fun b_lambda!6465 () Bool)

(assert (=> (not b_lambda!6465) (not b!144598)))

(assert (=> b!144598 t!6379))

(declare-fun b_and!8985 () Bool)

(assert (= b_and!8981 (and (=> t!6379 result!4243) b_and!8985)))

(assert (=> b!144598 t!6381))

(declare-fun b_and!8987 () Bool)

(assert (= b_and!8983 (and (=> t!6381 result!4245) b_and!8987)))

(declare-fun m!174125 () Bool)

(assert (=> b!144594 m!174125))

(assert (=> b!144597 m!173631))

(assert (=> b!144597 m!173631))

(assert (=> b!144597 m!173633))

(declare-fun m!174127 () Bool)

(assert (=> bm!16081 m!174127))

(assert (=> b!144596 m!173631))

(assert (=> b!144596 m!173631))

(declare-fun m!174129 () Bool)

(assert (=> b!144596 m!174129))

(declare-fun m!174131 () Bool)

(assert (=> b!144591 m!174131))

(declare-fun m!174133 () Bool)

(assert (=> bm!16078 m!174133))

(declare-fun m!174135 () Bool)

(assert (=> b!144603 m!174135))

(assert (=> d!46113 m!173645))

(declare-fun m!174137 () Bool)

(assert (=> b!144600 m!174137))

(assert (=> b!144600 m!174127))

(declare-fun m!174139 () Bool)

(assert (=> b!144600 m!174139))

(declare-fun m!174141 () Bool)

(assert (=> b!144600 m!174141))

(declare-fun m!174143 () Bool)

(assert (=> b!144600 m!174143))

(declare-fun m!174145 () Bool)

(assert (=> b!144600 m!174145))

(declare-fun m!174147 () Bool)

(assert (=> b!144600 m!174147))

(assert (=> b!144600 m!173631))

(assert (=> b!144600 m!174139))

(declare-fun m!174149 () Bool)

(assert (=> b!144600 m!174149))

(assert (=> b!144600 m!174143))

(declare-fun m!174151 () Bool)

(assert (=> b!144600 m!174151))

(declare-fun m!174153 () Bool)

(assert (=> b!144600 m!174153))

(declare-fun m!174155 () Bool)

(assert (=> b!144600 m!174155))

(declare-fun m!174157 () Bool)

(assert (=> b!144600 m!174157))

(declare-fun m!174159 () Bool)

(assert (=> b!144600 m!174159))

(declare-fun m!174161 () Bool)

(assert (=> b!144600 m!174161))

(declare-fun m!174163 () Bool)

(assert (=> b!144600 m!174163))

(declare-fun m!174165 () Bool)

(assert (=> b!144600 m!174165))

(assert (=> b!144600 m!174151))

(assert (=> b!144600 m!174155))

(assert (=> b!144598 m!173631))

(declare-fun m!174167 () Bool)

(assert (=> b!144598 m!174167))

(declare-fun m!174169 () Bool)

(assert (=> b!144598 m!174169))

(assert (=> b!144598 m!173681))

(declare-fun m!174171 () Bool)

(assert (=> b!144598 m!174171))

(assert (=> b!144598 m!173631))

(assert (=> b!144598 m!174169))

(assert (=> b!144598 m!173681))

(assert (=> b!144599 m!173631))

(assert (=> b!144599 m!173631))

(assert (=> b!144599 m!173633))

(declare-fun m!174173 () Bool)

(assert (=> bm!16083 m!174173))

(declare-fun m!174175 () Bool)

(assert (=> bm!16082 m!174175))

(assert (=> b!144225 d!46113))

(declare-fun d!46115 () Bool)

(declare-fun e!94206 () Bool)

(assert (=> d!46115 e!94206))

(declare-fun res!68815 () Bool)

(assert (=> d!46115 (=> (not res!68815) (not e!94206))))

(assert (=> d!46115 (= res!68815 (and (bvsge (index!3302 lt!75532) #b00000000000000000000000000000000) (bvslt (index!3302 lt!75532) (size!2590 (_values!2958 newMap!16)))))))

(declare-fun lt!75837 () Unit!4559)

(declare-fun choose!894 (array!4901 array!4903 (_ BitVec 32) (_ BitVec 32) V!3569 V!3569 (_ BitVec 32) (_ BitVec 64) V!3569 Int) Unit!4559)

(assert (=> d!46115 (= lt!75837 (choose!894 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3302 lt!75532) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)))))

(assert (=> d!46115 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46115 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!67 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) (index!3302 lt!75532) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2975 newMap!16)) lt!75837)))

(declare-fun b!144607 () Bool)

(assert (=> b!144607 (= e!94206 (= (+!169 (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) (tuple2!2677 (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355) (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4739 newMap!16) (array!4904 (store (arr!2315 (_values!2958 newMap!16)) (index!3302 lt!75532) (ValueCellFull!1127 (get!1538 (select (arr!2315 (_values!2958 (v!3302 (underlying!482 thiss!992)))) from!355) (dynLambda!439 (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2590 (_values!2958 newMap!16))) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16))))))

(assert (= (and d!46115 res!68815) b!144607))

(assert (=> d!46115 m!173309))

(assert (=> d!46115 m!173321))

(declare-fun m!174177 () Bool)

(assert (=> d!46115 m!174177))

(assert (=> d!46115 m!173645))

(assert (=> b!144607 m!173467))

(assert (=> b!144607 m!173467))

(assert (=> b!144607 m!173927))

(assert (=> b!144607 m!173579))

(assert (=> b!144607 m!173581))

(assert (=> b!144225 d!46115))

(assert (=> b!144031 d!45953))

(declare-fun d!46117 () Bool)

(assert (=> d!46117 (= (apply!122 lt!75431 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1542 (getValueByKey!176 (toList!876 lt!75431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6086 () Bool)

(assert (= bs!6086 d!46117))

(assert (=> bs!6086 m!173779))

(assert (=> bs!6086 m!173779))

(declare-fun m!174179 () Bool)

(assert (=> bs!6086 m!174179))

(assert (=> b!144088 d!46117))

(declare-fun call!16089 () ListLongMap!1721)

(declare-fun bm!16085 () Bool)

(declare-fun call!16092 () ListLongMap!1721)

(declare-fun c!27437 () Bool)

(declare-fun c!27433 () Bool)

(declare-fun call!16090 () ListLongMap!1721)

(declare-fun call!16094 () ListLongMap!1721)

(assert (=> bm!16085 (= call!16094 (+!169 (ite c!27433 call!16090 (ite c!27437 call!16092 call!16089)) (ite (or c!27433 c!27437) (tuple2!2677 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2822 newMap!16)) (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16)))))))

(declare-fun b!144608 () Bool)

(declare-fun e!94218 () ListLongMap!1721)

(declare-fun call!16088 () ListLongMap!1721)

(assert (=> b!144608 (= e!94218 call!16088)))

(declare-fun b!144609 () Bool)

(declare-fun e!94215 () Bool)

(declare-fun e!94213 () Bool)

(assert (=> b!144609 (= e!94215 e!94213)))

(declare-fun c!27436 () Bool)

(assert (=> b!144609 (= c!27436 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144610 () Bool)

(declare-fun e!94209 () Bool)

(assert (=> b!144610 (= e!94213 e!94209)))

(declare-fun res!68819 () Bool)

(declare-fun call!16091 () Bool)

(assert (=> b!144610 (= res!68819 call!16091)))

(assert (=> b!144610 (=> (not res!68819) (not e!94209))))

(declare-fun bm!16086 () Bool)

(assert (=> bm!16086 (= call!16089 call!16092)))

(declare-fun b!144611 () Bool)

(declare-fun c!27438 () Bool)

(assert (=> b!144611 (= c!27438 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!94207 () ListLongMap!1721)

(assert (=> b!144611 (= e!94218 e!94207)))

(declare-fun b!144612 () Bool)

(assert (=> b!144612 (= e!94213 (not call!16091))))

(declare-fun d!46119 () Bool)

(assert (=> d!46119 e!94215))

(declare-fun res!68823 () Bool)

(assert (=> d!46119 (=> (not res!68823) (not e!94215))))

(assert (=> d!46119 (= res!68823 (or (bvsge #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))))

(declare-fun lt!75849 () ListLongMap!1721)

(declare-fun lt!75851 () ListLongMap!1721)

(assert (=> d!46119 (= lt!75849 lt!75851)))

(declare-fun lt!75852 () Unit!4559)

(declare-fun e!94217 () Unit!4559)

(assert (=> d!46119 (= lt!75852 e!94217)))

(declare-fun c!27434 () Bool)

(declare-fun e!94214 () Bool)

(assert (=> d!46119 (= c!27434 e!94214)))

(declare-fun res!68820 () Bool)

(assert (=> d!46119 (=> (not res!68820) (not e!94214))))

(assert (=> d!46119 (= res!68820 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun e!94208 () ListLongMap!1721)

(assert (=> d!46119 (= lt!75851 e!94208)))

(assert (=> d!46119 (= c!27433 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46119 (validMask!0 (mask!7332 newMap!16))))

(assert (=> d!46119 (= (getCurrentListMap!536 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)) lt!75849)))

(declare-fun b!144613 () Bool)

(declare-fun e!94216 () Bool)

(declare-fun e!94219 () Bool)

(assert (=> b!144613 (= e!94216 e!94219)))

(declare-fun res!68817 () Bool)

(declare-fun call!16093 () Bool)

(assert (=> b!144613 (= res!68817 call!16093)))

(assert (=> b!144613 (=> (not res!68817) (not e!94219))))

(declare-fun b!144614 () Bool)

(declare-fun Unit!4580 () Unit!4559)

(assert (=> b!144614 (= e!94217 Unit!4580)))

(declare-fun bm!16087 () Bool)

(assert (=> bm!16087 (= call!16088 call!16094)))

(declare-fun b!144615 () Bool)

(assert (=> b!144615 (= e!94219 (= (apply!122 lt!75849 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2822 newMap!16)))))

(declare-fun b!144616 () Bool)

(assert (=> b!144616 (= e!94207 call!16088)))

(declare-fun bm!16088 () Bool)

(assert (=> bm!16088 (= call!16090 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun bm!16089 () Bool)

(assert (=> bm!16089 (= call!16093 (contains!919 lt!75849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144617 () Bool)

(assert (=> b!144617 (= e!94216 (not call!16093))))

(declare-fun b!144618 () Bool)

(assert (=> b!144618 (= e!94209 (= (apply!122 lt!75849 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2822 newMap!16)))))

(declare-fun b!144619 () Bool)

(assert (=> b!144619 (= e!94207 call!16089)))

(declare-fun bm!16090 () Bool)

(assert (=> bm!16090 (= call!16091 (contains!919 lt!75849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144620 () Bool)

(declare-fun e!94212 () Bool)

(declare-fun e!94210 () Bool)

(assert (=> b!144620 (= e!94212 e!94210)))

(declare-fun res!68822 () Bool)

(assert (=> b!144620 (=> (not res!68822) (not e!94210))))

(assert (=> b!144620 (= res!68822 (contains!919 lt!75849 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!144620 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144621 () Bool)

(assert (=> b!144621 (= e!94214 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144622 () Bool)

(assert (=> b!144622 (= e!94210 (= (apply!122 lt!75849 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)) (get!1538 (select (arr!2315 (_values!2958 newMap!16)) #b00000000000000000000000000000000) (dynLambda!439 (defaultEntry!2975 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144622 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2590 (_values!2958 newMap!16))))))

(assert (=> b!144622 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun bm!16091 () Bool)

(assert (=> bm!16091 (= call!16092 call!16090)))

(declare-fun b!144623 () Bool)

(declare-fun e!94211 () Bool)

(assert (=> b!144623 (= e!94211 (validKeyInArray!0 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!144624 () Bool)

(declare-fun lt!75848 () Unit!4559)

(assert (=> b!144624 (= e!94217 lt!75848)))

(declare-fun lt!75843 () ListLongMap!1721)

(assert (=> b!144624 (= lt!75843 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75856 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75859 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75859 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75847 () Unit!4559)

(assert (=> b!144624 (= lt!75847 (addStillContains!98 lt!75843 lt!75856 (zeroValue!2822 newMap!16) lt!75859))))

(assert (=> b!144624 (contains!919 (+!169 lt!75843 (tuple2!2677 lt!75856 (zeroValue!2822 newMap!16))) lt!75859)))

(declare-fun lt!75841 () Unit!4559)

(assert (=> b!144624 (= lt!75841 lt!75847)))

(declare-fun lt!75850 () ListLongMap!1721)

(assert (=> b!144624 (= lt!75850 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75838 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75838 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75854 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75854 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75855 () Unit!4559)

(assert (=> b!144624 (= lt!75855 (addApplyDifferent!98 lt!75850 lt!75838 (minValue!2822 newMap!16) lt!75854))))

(assert (=> b!144624 (= (apply!122 (+!169 lt!75850 (tuple2!2677 lt!75838 (minValue!2822 newMap!16))) lt!75854) (apply!122 lt!75850 lt!75854))))

(declare-fun lt!75842 () Unit!4559)

(assert (=> b!144624 (= lt!75842 lt!75855)))

(declare-fun lt!75845 () ListLongMap!1721)

(assert (=> b!144624 (= lt!75845 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75858 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75840 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75840 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75853 () Unit!4559)

(assert (=> b!144624 (= lt!75853 (addApplyDifferent!98 lt!75845 lt!75858 (zeroValue!2822 newMap!16) lt!75840))))

(assert (=> b!144624 (= (apply!122 (+!169 lt!75845 (tuple2!2677 lt!75858 (zeroValue!2822 newMap!16))) lt!75840) (apply!122 lt!75845 lt!75840))))

(declare-fun lt!75846 () Unit!4559)

(assert (=> b!144624 (= lt!75846 lt!75853)))

(declare-fun lt!75844 () ListLongMap!1721)

(assert (=> b!144624 (= lt!75844 (getCurrentListMapNoExtraKeys!134 (_keys!4739 newMap!16) (_values!2958 newMap!16) (mask!7332 newMap!16) (extraKeys!2724 newMap!16) (zeroValue!2822 newMap!16) (minValue!2822 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2975 newMap!16)))))

(declare-fun lt!75857 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75857 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75839 () (_ BitVec 64))

(assert (=> b!144624 (= lt!75839 (select (arr!2314 (_keys!4739 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144624 (= lt!75848 (addApplyDifferent!98 lt!75844 lt!75857 (minValue!2822 newMap!16) lt!75839))))

(assert (=> b!144624 (= (apply!122 (+!169 lt!75844 (tuple2!2677 lt!75857 (minValue!2822 newMap!16))) lt!75839) (apply!122 lt!75844 lt!75839))))

(declare-fun b!144625 () Bool)

(declare-fun res!68818 () Bool)

(assert (=> b!144625 (=> (not res!68818) (not e!94215))))

(assert (=> b!144625 (= res!68818 e!94212)))

(declare-fun res!68816 () Bool)

(assert (=> b!144625 (=> res!68816 e!94212)))

(assert (=> b!144625 (= res!68816 (not e!94211))))

(declare-fun res!68824 () Bool)

(assert (=> b!144625 (=> (not res!68824) (not e!94211))))

(assert (=> b!144625 (= res!68824 (bvslt #b00000000000000000000000000000000 (size!2589 (_keys!4739 newMap!16))))))

(declare-fun b!144626 () Bool)

(assert (=> b!144626 (= e!94208 e!94218)))

(assert (=> b!144626 (= c!27437 (and (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!144627 () Bool)

(assert (=> b!144627 (= e!94208 (+!169 call!16094 (tuple2!2677 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2822 newMap!16))))))

(declare-fun b!144628 () Bool)

(declare-fun res!68821 () Bool)

(assert (=> b!144628 (=> (not res!68821) (not e!94215))))

(assert (=> b!144628 (= res!68821 e!94216)))

(declare-fun c!27435 () Bool)

(assert (=> b!144628 (= c!27435 (not (= (bvand (extraKeys!2724 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!46119 c!27433) b!144627))

(assert (= (and d!46119 (not c!27433)) b!144626))

(assert (= (and b!144626 c!27437) b!144608))

(assert (= (and b!144626 (not c!27437)) b!144611))

(assert (= (and b!144611 c!27438) b!144616))

(assert (= (and b!144611 (not c!27438)) b!144619))

(assert (= (or b!144616 b!144619) bm!16086))

(assert (= (or b!144608 bm!16086) bm!16091))

(assert (= (or b!144608 b!144616) bm!16087))

(assert (= (or b!144627 bm!16091) bm!16088))

(assert (= (or b!144627 bm!16087) bm!16085))

(assert (= (and d!46119 res!68820) b!144621))

(assert (= (and d!46119 c!27434) b!144624))

(assert (= (and d!46119 (not c!27434)) b!144614))

(assert (= (and d!46119 res!68823) b!144625))

(assert (= (and b!144625 res!68824) b!144623))

(assert (= (and b!144625 (not res!68816)) b!144620))

(assert (= (and b!144620 res!68822) b!144622))

(assert (= (and b!144625 res!68818) b!144628))

(assert (= (and b!144628 c!27435) b!144613))

(assert (= (and b!144628 (not c!27435)) b!144617))

(assert (= (and b!144613 res!68817) b!144615))

(assert (= (or b!144613 b!144617) bm!16089))

(assert (= (and b!144628 res!68821) b!144609))

(assert (= (and b!144609 c!27436) b!144610))

(assert (= (and b!144609 (not c!27436)) b!144612))

(assert (= (and b!144610 res!68819) b!144618))

(assert (= (or b!144610 b!144612) bm!16090))

(declare-fun b_lambda!6467 () Bool)

(assert (=> (not b_lambda!6467) (not b!144622)))

(assert (=> b!144622 t!6379))

(declare-fun b_and!8989 () Bool)

(assert (= b_and!8985 (and (=> t!6379 result!4243) b_and!8989)))

(assert (=> b!144622 t!6381))

(declare-fun b_and!8991 () Bool)

(assert (= b_and!8987 (and (=> t!6381 result!4245) b_and!8991)))

(declare-fun m!174181 () Bool)

(assert (=> b!144618 m!174181))

(assert (=> b!144621 m!173631))

(assert (=> b!144621 m!173631))

(assert (=> b!144621 m!173633))

(declare-fun m!174183 () Bool)

(assert (=> bm!16088 m!174183))

(assert (=> b!144620 m!173631))

(assert (=> b!144620 m!173631))

(declare-fun m!174185 () Bool)

(assert (=> b!144620 m!174185))

(declare-fun m!174187 () Bool)

(assert (=> b!144615 m!174187))

(declare-fun m!174189 () Bool)

(assert (=> bm!16085 m!174189))

(declare-fun m!174191 () Bool)

(assert (=> b!144627 m!174191))

(assert (=> d!46119 m!173645))

(declare-fun m!174193 () Bool)

(assert (=> b!144624 m!174193))

(assert (=> b!144624 m!174183))

(declare-fun m!174195 () Bool)

(assert (=> b!144624 m!174195))

(declare-fun m!174197 () Bool)

(assert (=> b!144624 m!174197))

(declare-fun m!174199 () Bool)

(assert (=> b!144624 m!174199))

(declare-fun m!174201 () Bool)

(assert (=> b!144624 m!174201))

(declare-fun m!174203 () Bool)

(assert (=> b!144624 m!174203))

(assert (=> b!144624 m!173631))

(assert (=> b!144624 m!174195))

(declare-fun m!174205 () Bool)

(assert (=> b!144624 m!174205))

(assert (=> b!144624 m!174199))

(declare-fun m!174207 () Bool)

(assert (=> b!144624 m!174207))

(declare-fun m!174209 () Bool)

(assert (=> b!144624 m!174209))

(declare-fun m!174211 () Bool)

(assert (=> b!144624 m!174211))

(declare-fun m!174213 () Bool)

(assert (=> b!144624 m!174213))

(declare-fun m!174215 () Bool)

(assert (=> b!144624 m!174215))

(declare-fun m!174217 () Bool)

(assert (=> b!144624 m!174217))

(declare-fun m!174219 () Bool)

(assert (=> b!144624 m!174219))

(declare-fun m!174221 () Bool)

(assert (=> b!144624 m!174221))

(assert (=> b!144624 m!174207))

(assert (=> b!144624 m!174211))

(assert (=> b!144622 m!173631))

(declare-fun m!174223 () Bool)

(assert (=> b!144622 m!174223))

(assert (=> b!144622 m!173679))

(assert (=> b!144622 m!173681))

(assert (=> b!144622 m!173683))

(assert (=> b!144622 m!173631))

(assert (=> b!144622 m!173679))

(assert (=> b!144622 m!173681))

(assert (=> b!144623 m!173631))

(assert (=> b!144623 m!173631))

(assert (=> b!144623 m!173633))

(declare-fun m!174225 () Bool)

(assert (=> bm!16090 m!174225))

(declare-fun m!174227 () Bool)

(assert (=> bm!16089 m!174227))

(assert (=> d!45959 d!46119))

(assert (=> bm!15959 d!46065))

(declare-fun d!46121 () Bool)

(assert (=> d!46121 (isDefined!130 (getValueByKey!176 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun lt!75862 () Unit!4559)

(declare-fun choose!895 (List!1749 (_ BitVec 64)) Unit!4559)

(assert (=> d!46121 (= lt!75862 (choose!895 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(declare-fun e!94222 () Bool)

(assert (=> d!46121 e!94222))

(declare-fun res!68827 () Bool)

(assert (=> d!46121 (=> (not res!68827) (not e!94222))))

(declare-fun isStrictlySorted!322 (List!1749) Bool)

(assert (=> d!46121 (= res!68827 (isStrictlySorted!322 (toList!876 lt!75328)))))

(assert (=> d!46121 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)) lt!75862)))

(declare-fun b!144631 () Bool)

(assert (=> b!144631 (= e!94222 (containsKey!180 (toList!876 lt!75328) (select (arr!2314 (_keys!4739 (v!3302 (underlying!482 thiss!992)))) from!355)))))

(assert (= (and d!46121 res!68827) b!144631))

(assert (=> d!46121 m!173309))

(assert (=> d!46121 m!173529))

(assert (=> d!46121 m!173529))

(assert (=> d!46121 m!173531))

(assert (=> d!46121 m!173309))

(declare-fun m!174229 () Bool)

(assert (=> d!46121 m!174229))

(declare-fun m!174231 () Bool)

(assert (=> d!46121 m!174231))

(assert (=> b!144631 m!173309))

(assert (=> b!144631 m!173525))

(assert (=> b!144108 d!46121))

(assert (=> b!144108 d!46101))

(assert (=> b!144108 d!46103))

(declare-fun mapIsEmpty!4897 () Bool)

(declare-fun mapRes!4897 () Bool)

(assert (=> mapIsEmpty!4897 mapRes!4897))

(declare-fun b!144633 () Bool)

(declare-fun e!94223 () Bool)

(assert (=> b!144633 (= e!94223 tp_is_empty!2941)))

(declare-fun condMapEmpty!4897 () Bool)

(declare-fun mapDefault!4897 () ValueCell!1127)

(assert (=> mapNonEmpty!4895 (= condMapEmpty!4897 (= mapRest!4895 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4897)))))

(assert (=> mapNonEmpty!4895 (= tp!11663 (and e!94223 mapRes!4897))))

(declare-fun mapNonEmpty!4897 () Bool)

(declare-fun tp!11665 () Bool)

(declare-fun e!94224 () Bool)

(assert (=> mapNonEmpty!4897 (= mapRes!4897 (and tp!11665 e!94224))))

(declare-fun mapKey!4897 () (_ BitVec 32))

(declare-fun mapValue!4897 () ValueCell!1127)

(declare-fun mapRest!4897 () (Array (_ BitVec 32) ValueCell!1127))

(assert (=> mapNonEmpty!4897 (= mapRest!4895 (store mapRest!4897 mapKey!4897 mapValue!4897))))

(declare-fun b!144632 () Bool)

(assert (=> b!144632 (= e!94224 tp_is_empty!2941)))

(assert (= (and mapNonEmpty!4895 condMapEmpty!4897) mapIsEmpty!4897))

(assert (= (and mapNonEmpty!4895 (not condMapEmpty!4897)) mapNonEmpty!4897))

(assert (= (and mapNonEmpty!4897 ((_ is ValueCellFull!1127) mapValue!4897)) b!144632))

(assert (= (and mapNonEmpty!4895 ((_ is ValueCellFull!1127) mapDefault!4897)) b!144633))

(declare-fun m!174233 () Bool)

(assert (=> mapNonEmpty!4897 m!174233))

(declare-fun mapIsEmpty!4898 () Bool)

(declare-fun mapRes!4898 () Bool)

(assert (=> mapIsEmpty!4898 mapRes!4898))

(declare-fun b!144635 () Bool)

(declare-fun e!94225 () Bool)

(assert (=> b!144635 (= e!94225 tp_is_empty!2941)))

(declare-fun condMapEmpty!4898 () Bool)

(declare-fun mapDefault!4898 () ValueCell!1127)

(assert (=> mapNonEmpty!4896 (= condMapEmpty!4898 (= mapRest!4896 ((as const (Array (_ BitVec 32) ValueCell!1127)) mapDefault!4898)))))

(assert (=> mapNonEmpty!4896 (= tp!11664 (and e!94225 mapRes!4898))))

(declare-fun mapNonEmpty!4898 () Bool)

(declare-fun tp!11666 () Bool)

(declare-fun e!94226 () Bool)

(assert (=> mapNonEmpty!4898 (= mapRes!4898 (and tp!11666 e!94226))))

(declare-fun mapRest!4898 () (Array (_ BitVec 32) ValueCell!1127))

(declare-fun mapKey!4898 () (_ BitVec 32))

(declare-fun mapValue!4898 () ValueCell!1127)

(assert (=> mapNonEmpty!4898 (= mapRest!4896 (store mapRest!4898 mapKey!4898 mapValue!4898))))

(declare-fun b!144634 () Bool)

(assert (=> b!144634 (= e!94226 tp_is_empty!2941)))

(assert (= (and mapNonEmpty!4896 condMapEmpty!4898) mapIsEmpty!4898))

(assert (= (and mapNonEmpty!4896 (not condMapEmpty!4898)) mapNonEmpty!4898))

(assert (= (and mapNonEmpty!4898 ((_ is ValueCellFull!1127) mapValue!4898)) b!144634))

(assert (= (and mapNonEmpty!4896 ((_ is ValueCellFull!1127) mapDefault!4898)) b!144635))

(declare-fun m!174235 () Bool)

(assert (=> mapNonEmpty!4898 m!174235))

(declare-fun b_lambda!6469 () Bool)

(assert (= b_lambda!6459 (or (and b!143872 b_free!3049 (= (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) (defaultEntry!2975 newMap!16))) (and b!143864 b_free!3051) b_lambda!6469)))

(declare-fun b_lambda!6471 () Bool)

(assert (= b_lambda!6461 (or (and b!143872 b_free!3049) (and b!143864 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))))) b_lambda!6471)))

(declare-fun b_lambda!6473 () Bool)

(assert (= b_lambda!6463 (or (and b!143872 b_free!3049) (and b!143864 b_free!3051 (= (defaultEntry!2975 newMap!16) (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))))) b_lambda!6473)))

(declare-fun b_lambda!6475 () Bool)

(assert (= b_lambda!6467 (or (and b!143872 b_free!3049 (= (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) (defaultEntry!2975 newMap!16))) (and b!143864 b_free!3051) b_lambda!6475)))

(declare-fun b_lambda!6477 () Bool)

(assert (= b_lambda!6457 (or (and b!143872 b_free!3049 (= (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) (defaultEntry!2975 newMap!16))) (and b!143864 b_free!3051) b_lambda!6477)))

(declare-fun b_lambda!6479 () Bool)

(assert (= b_lambda!6465 (or (and b!143872 b_free!3049 (= (defaultEntry!2975 (v!3302 (underlying!482 thiss!992))) (defaultEntry!2975 newMap!16))) (and b!143864 b_free!3051) b_lambda!6479)))

(check-sat (not b!144445) (not b!144344) (not b!144502) (not d!46071) (not b!144624) (not b!144535) (not b!144597) (not b!144540) (not b!144280) (not b!144578) (not b!144292) (not b!144621) (not d!46011) (not b!144600) (not bm!16072) (not b!144277) (not b!144549) (not b!144274) (not b_next!3051) (not b!144538) (not b!144330) (not d!46009) (not d!46113) (not b!144494) (not b!144333) (not d!45995) (not b_lambda!6477) (not d!46061) (not bm!16083) (not b!144309) (not bm!16081) (not b!144388) (not b!144556) (not b!144294) (not d!46059) (not b!144631) (not d!46109) (not d!46077) (not d!45989) (not bm!16057) (not b!144283) (not d!45991) (not b!144342) (not b!144446) (not d!46045) (not bm!16078) (not b!144486) (not bm!16040) (not b!144320) (not d!46121) (not b!144370) (not d!46087) (not b!144623) (not b!144596) (not d!46117) (not d!46083) (not bm!16088) (not b!144341) (not d!46075) (not bm!16051) (not bm!16058) (not b!144573) (not b!144575) (not d!46047) (not bm!16045) (not b!144296) (not d!46081) (not b!144603) (not b!144391) (not bm!16090) (not bm!16085) (not d!46033) (not d!46063) (not b!144351) (not b!144594) b_and!8991 (not b!144279) (not d!46057) (not b!144313) (not b!144598) (not d!46079) (not bm!16070) tp_is_empty!2941 (not b!144290) (not b!144498) (not b!144364) (not b!144260) (not mapNonEmpty!4897) (not bm!16044) (not d!46073) (not b!144288) (not b!144534) (not b!144618) (not b!144620) (not bm!16039) (not b!144580) (not b!144318) (not d!46091) (not d!46043) (not b!144561) (not b!144265) (not bm!16035) (not b!144317) (not d!45997) (not b!144583) (not b!144539) (not b_lambda!6471) (not b!144295) (not b!144482) (not b!144281) (not b!144306) (not b_lambda!6473) (not b!144552) (not b!144395) (not b_lambda!6469) (not d!45983) (not b!144390) (not b!144289) (not d!46105) (not d!46115) (not b_lambda!6479) (not bm!16076) (not d!46065) (not d!46067) (not d!46027) (not d!45987) (not bm!16077) (not b!144546) (not d!46017) (not d!46097) (not b!144258) (not b!144331) (not b!144375) (not b!144607) (not d!46107) (not b!144622) (not bm!16049) (not b!144443) (not bm!16089) (not b!144392) (not b!144489) (not b!144383) (not d!46111) (not b!144591) (not b!144442) (not bm!16046) (not b!144259) (not b!144577) (not b!144335) (not d!46053) (not b_lambda!6451) (not d!46013) (not d!46119) (not bm!16061) (not b!144312) (not d!46035) (not b!144286) (not d!46085) (not mapNonEmpty!4898) (not b!144293) (not b!144432) (not b!144346) b_and!8989 (not d!46069) (not b!144545) (not b!144627) (not b!144347) (not bm!16038) (not b!144541) (not d!46015) (not b!144507) (not b!144487) (not b!144315) (not d!46029) (not d!46023) (not bm!16082) (not b!144555) (not d!46101) (not b!144599) (not b_next!3049) (not b!144615) (not d!46031) (not b!144536) (not b!144500) (not d!46055) (not bm!16050) (not b!144389) (not d!46021) (not b!144492) (not b_lambda!6455) (not b!144501) (not b!144282) (not b!144373) (not b!144542) (not d!45985) (not b!144401) (not bm!16073) (not b!144349) (not b!144371) (not b_lambda!6475) (not b!144266) (not b!144386) (not b!144345) (not b!144508) (not b!144550))
(check-sat b_and!8989 b_and!8991 (not b_next!3049) (not b_next!3051))
