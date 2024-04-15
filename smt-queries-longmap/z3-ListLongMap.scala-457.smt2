; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8358 () Bool)

(assert start!8358)

(declare-fun b!55639 () Bool)

(declare-fun b_free!1873 () Bool)

(declare-fun b_next!1873 () Bool)

(assert (=> b!55639 (= b_free!1873 (not b_next!1873))))

(declare-fun tp!7719 () Bool)

(declare-fun b_and!3289 () Bool)

(assert (=> b!55639 (= tp!7719 b_and!3289)))

(declare-fun b!55638 () Bool)

(declare-fun b_free!1875 () Bool)

(declare-fun b_next!1875 () Bool)

(assert (=> b!55638 (= b_free!1875 (not b_next!1875))))

(declare-fun tp!7722 () Bool)

(declare-fun b_and!3291 () Bool)

(assert (=> b!55638 (= tp!7722 b_and!3291)))

(declare-fun b!55629 () Bool)

(declare-fun e!36570 () Bool)

(declare-fun e!36574 () Bool)

(assert (=> b!55629 (= e!36570 e!36574)))

(declare-fun res!31335 () Bool)

(assert (=> b!55629 (=> (not res!31335) (not e!36574))))

(declare-datatypes ((V!2785 0))(
  ( (V!2786 (val!1221 Int)) )
))
(declare-datatypes ((tuple2!1990 0))(
  ( (tuple2!1991 (_1!1006 (_ BitVec 64)) (_2!1006 V!2785)) )
))
(declare-datatypes ((List!1407 0))(
  ( (Nil!1404) (Cons!1403 (h!1983 tuple2!1990) (t!4648 List!1407)) )
))
(declare-datatypes ((ListLongMap!1331 0))(
  ( (ListLongMap!1332 (toList!681 List!1407)) )
))
(declare-fun lt!22010 () ListLongMap!1331)

(declare-datatypes ((array!3609 0))(
  ( (array!3610 (arr!1726 (Array (_ BitVec 32) (_ BitVec 64))) (size!1956 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!833 0))(
  ( (ValueCellFull!833 (v!2323 V!2785)) (EmptyCell!833) )
))
(declare-datatypes ((array!3611 0))(
  ( (array!3612 (arr!1727 (Array (_ BitVec 32) ValueCell!833)) (size!1957 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!574 0))(
  ( (LongMapFixedSize!575 (defaultEntry!2001 Int) (mask!5861 (_ BitVec 32)) (extraKeys!1892 (_ BitVec 32)) (zeroValue!1919 V!2785) (minValue!1919 V!2785) (_size!336 (_ BitVec 32)) (_keys!3620 array!3609) (_values!1984 array!3611) (_vacant!336 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!384 0))(
  ( (Cell!385 (v!2324 LongMapFixedSize!574)) )
))
(declare-datatypes ((LongMap!384 0))(
  ( (LongMap!385 (underlying!203 Cell!384)) )
))
(declare-fun thiss!992 () LongMap!384)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!659 (ListLongMap!1331 (_ BitVec 64)) Bool)

(assert (=> b!55629 (= res!31335 (contains!659 lt!22010 (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1992 0))(
  ( (tuple2!1993 (_1!1007 Bool) (_2!1007 LongMapFixedSize!574)) )
))
(declare-fun lt!22005 () tuple2!1992)

(declare-fun newMap!16 () LongMapFixedSize!574)

(declare-fun update!74 (LongMapFixedSize!574 (_ BitVec 64) V!2785) tuple2!1992)

(declare-fun get!1044 (ValueCell!833 V!2785) V!2785)

(declare-fun dynLambda!298 (Int (_ BitVec 64)) V!2785)

(assert (=> b!55629 (= lt!22005 (update!74 newMap!16 (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355) (get!1044 (select (arr!1727 (_values!1984 (v!2324 (underlying!203 thiss!992)))) from!355) (dynLambda!298 (defaultEntry!2001 (v!2324 (underlying!203 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55631 () Bool)

(declare-fun res!31342 () Bool)

(declare-fun e!36567 () Bool)

(assert (=> b!55631 (=> (not res!31342) (not e!36567))))

(assert (=> b!55631 (= res!31342 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5861 newMap!16)) (_size!336 (v!2324 (underlying!203 thiss!992)))))))

(declare-fun b!55632 () Bool)

(declare-fun e!36576 () Bool)

(declare-fun tp_is_empty!2353 () Bool)

(assert (=> b!55632 (= e!36576 tp_is_empty!2353)))

(declare-fun b!55633 () Bool)

(assert (=> b!55633 (= e!36567 e!36570)))

(declare-fun res!31336 () Bool)

(assert (=> b!55633 (=> (not res!31336) (not e!36570))))

(declare-fun lt!22009 () ListLongMap!1331)

(assert (=> b!55633 (= res!31336 (and (= lt!22009 lt!22010) (not (= (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1079 (LongMapFixedSize!574) ListLongMap!1331)

(assert (=> b!55633 (= lt!22010 (map!1079 newMap!16))))

(declare-fun getCurrentListMap!379 (array!3609 array!3611 (_ BitVec 32) (_ BitVec 32) V!2785 V!2785 (_ BitVec 32) Int) ListLongMap!1331)

(assert (=> b!55633 (= lt!22009 (getCurrentListMap!379 (_keys!3620 (v!2324 (underlying!203 thiss!992))) (_values!1984 (v!2324 (underlying!203 thiss!992))) (mask!5861 (v!2324 (underlying!203 thiss!992))) (extraKeys!1892 (v!2324 (underlying!203 thiss!992))) (zeroValue!1919 (v!2324 (underlying!203 thiss!992))) (minValue!1919 (v!2324 (underlying!203 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2001 (v!2324 (underlying!203 thiss!992)))))))

(declare-fun b!55634 () Bool)

(declare-fun res!31344 () Bool)

(declare-fun e!36579 () Bool)

(assert (=> b!55634 (=> res!31344 e!36579)))

(declare-datatypes ((List!1408 0))(
  ( (Nil!1405) (Cons!1404 (h!1984 (_ BitVec 64)) (t!4649 List!1408)) )
))
(declare-fun lt!22004 () List!1408)

(declare-fun contains!660 (List!1408 (_ BitVec 64)) Bool)

(assert (=> b!55634 (= res!31344 (contains!660 lt!22004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55635 () Bool)

(declare-fun e!36573 () Bool)

(assert (=> b!55635 (= e!36573 tp_is_empty!2353)))

(declare-fun b!55636 () Bool)

(declare-fun e!36578 () Bool)

(assert (=> b!55636 (= e!36578 tp_is_empty!2353)))

(declare-fun b!55637 () Bool)

(declare-fun e!36580 () Bool)

(declare-fun mapRes!2730 () Bool)

(assert (=> b!55637 (= e!36580 (and e!36576 mapRes!2730))))

(declare-fun condMapEmpty!2730 () Bool)

(declare-fun mapDefault!2729 () ValueCell!833)

(assert (=> b!55637 (= condMapEmpty!2730 (= (arr!1727 (_values!1984 (v!2324 (underlying!203 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!833)) mapDefault!2729)))))

(declare-fun e!36571 () Bool)

(declare-fun e!36566 () Bool)

(declare-fun array_inv!1063 (array!3609) Bool)

(declare-fun array_inv!1064 (array!3611) Bool)

(assert (=> b!55638 (= e!36571 (and tp!7722 tp_is_empty!2353 (array_inv!1063 (_keys!3620 newMap!16)) (array_inv!1064 (_values!1984 newMap!16)) e!36566))))

(declare-fun e!36568 () Bool)

(assert (=> b!55639 (= e!36568 (and tp!7719 tp_is_empty!2353 (array_inv!1063 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) (array_inv!1064 (_values!1984 (v!2324 (underlying!203 thiss!992)))) e!36580))))

(declare-fun res!31338 () Bool)

(assert (=> start!8358 (=> (not res!31338) (not e!36567))))

(declare-fun valid!230 (LongMap!384) Bool)

(assert (=> start!8358 (= res!31338 (valid!230 thiss!992))))

(assert (=> start!8358 e!36567))

(declare-fun e!36565 () Bool)

(assert (=> start!8358 e!36565))

(assert (=> start!8358 true))

(assert (=> start!8358 e!36571))

(declare-fun b!55630 () Bool)

(declare-fun res!31341 () Bool)

(assert (=> b!55630 (=> res!31341 e!36579)))

(declare-fun arrayNoDuplicates!0 (array!3609 (_ BitVec 32) List!1408) Bool)

(assert (=> b!55630 (= res!31341 (not (arrayNoDuplicates!0 (_keys!3620 (v!2324 (underlying!203 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22004)))))

(declare-fun b!55640 () Bool)

(declare-fun res!31337 () Bool)

(assert (=> b!55640 (=> (not res!31337) (not e!36567))))

(assert (=> b!55640 (= res!31337 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1956 (_keys!3620 (v!2324 (underlying!203 thiss!992)))))))))

(declare-fun mapNonEmpty!2729 () Bool)

(declare-fun tp!7721 () Bool)

(assert (=> mapNonEmpty!2729 (= mapRes!2730 (and tp!7721 e!36573))))

(declare-fun mapRest!2729 () (Array (_ BitVec 32) ValueCell!833))

(declare-fun mapKey!2730 () (_ BitVec 32))

(declare-fun mapValue!2729 () ValueCell!833)

(assert (=> mapNonEmpty!2729 (= (arr!1727 (_values!1984 (v!2324 (underlying!203 thiss!992)))) (store mapRest!2729 mapKey!2730 mapValue!2729))))

(declare-fun b!55641 () Bool)

(declare-fun e!36572 () Bool)

(assert (=> b!55641 (= e!36572 e!36568)))

(declare-fun b!55642 () Bool)

(declare-fun res!31340 () Bool)

(assert (=> b!55642 (=> res!31340 e!36579)))

(assert (=> b!55642 (= res!31340 (contains!660 lt!22004 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55643 () Bool)

(declare-fun mapRes!2729 () Bool)

(assert (=> b!55643 (= e!36566 (and e!36578 mapRes!2729))))

(declare-fun condMapEmpty!2729 () Bool)

(declare-fun mapDefault!2730 () ValueCell!833)

(assert (=> b!55643 (= condMapEmpty!2729 (= (arr!1727 (_values!1984 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!833)) mapDefault!2730)))))

(declare-fun b!55644 () Bool)

(assert (=> b!55644 (= e!36565 e!36572)))

(declare-fun b!55645 () Bool)

(assert (=> b!55645 (= e!36579 true)))

(declare-fun lt!22008 () Bool)

(assert (=> b!55645 (= lt!22008 (contains!660 lt!22004 (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355)))))

(declare-fun mapNonEmpty!2730 () Bool)

(declare-fun tp!7720 () Bool)

(declare-fun e!36569 () Bool)

(assert (=> mapNonEmpty!2730 (= mapRes!2729 (and tp!7720 e!36569))))

(declare-fun mapValue!2730 () ValueCell!833)

(declare-fun mapRest!2730 () (Array (_ BitVec 32) ValueCell!833))

(declare-fun mapKey!2729 () (_ BitVec 32))

(assert (=> mapNonEmpty!2730 (= (arr!1727 (_values!1984 newMap!16)) (store mapRest!2730 mapKey!2729 mapValue!2730))))

(declare-fun mapIsEmpty!2729 () Bool)

(assert (=> mapIsEmpty!2729 mapRes!2729))

(declare-fun mapIsEmpty!2730 () Bool)

(assert (=> mapIsEmpty!2730 mapRes!2730))

(declare-fun b!55646 () Bool)

(assert (=> b!55646 (= e!36569 tp_is_empty!2353)))

(declare-fun b!55647 () Bool)

(declare-fun res!31334 () Bool)

(assert (=> b!55647 (=> (not res!31334) (not e!36567))))

(declare-fun valid!231 (LongMapFixedSize!574) Bool)

(assert (=> b!55647 (= res!31334 (valid!231 newMap!16))))

(declare-fun b!55648 () Bool)

(declare-fun res!31339 () Bool)

(assert (=> b!55648 (=> res!31339 e!36579)))

(declare-fun noDuplicate!43 (List!1408) Bool)

(assert (=> b!55648 (= res!31339 (not (noDuplicate!43 lt!22004)))))

(declare-fun b!55649 () Bool)

(assert (=> b!55649 (= e!36574 (not e!36579))))

(declare-fun res!31343 () Bool)

(assert (=> b!55649 (=> res!31343 e!36579)))

(assert (=> b!55649 (= res!31343 (or (bvsge (size!1956 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1956 (_keys!3620 (v!2324 (underlying!203 thiss!992)))))))))

(assert (=> b!55649 (= lt!22004 (Cons!1404 (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355) Nil!1405))))

(assert (=> b!55649 (arrayNoDuplicates!0 (_keys!3620 (v!2324 (underlying!203 thiss!992))) from!355 Nil!1405)))

(declare-datatypes ((Unit!1454 0))(
  ( (Unit!1455) )
))
(declare-fun lt!22006 () Unit!1454)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3609 (_ BitVec 32) (_ BitVec 32)) Unit!1454)

(assert (=> b!55649 (= lt!22006 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3620 (v!2324 (underlying!203 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55649 (arrayContainsKey!0 (_keys!3620 (v!2324 (underlying!203 thiss!992))) (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22007 () Unit!1454)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!14 (array!3609 array!3611 (_ BitVec 32) (_ BitVec 32) V!2785 V!2785 (_ BitVec 64) (_ BitVec 32) Int) Unit!1454)

(assert (=> b!55649 (= lt!22007 (lemmaListMapContainsThenArrayContainsFrom!14 (_keys!3620 (v!2324 (underlying!203 thiss!992))) (_values!1984 (v!2324 (underlying!203 thiss!992))) (mask!5861 (v!2324 (underlying!203 thiss!992))) (extraKeys!1892 (v!2324 (underlying!203 thiss!992))) (zeroValue!1919 (v!2324 (underlying!203 thiss!992))) (minValue!1919 (v!2324 (underlying!203 thiss!992))) (select (arr!1726 (_keys!3620 (v!2324 (underlying!203 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2001 (v!2324 (underlying!203 thiss!992)))))))

(assert (= (and start!8358 res!31338) b!55640))

(assert (= (and b!55640 res!31337) b!55647))

(assert (= (and b!55647 res!31334) b!55631))

(assert (= (and b!55631 res!31342) b!55633))

(assert (= (and b!55633 res!31336) b!55629))

(assert (= (and b!55629 res!31335) b!55649))

(assert (= (and b!55649 (not res!31343)) b!55648))

(assert (= (and b!55648 (not res!31339)) b!55634))

(assert (= (and b!55634 (not res!31344)) b!55642))

(assert (= (and b!55642 (not res!31340)) b!55630))

(assert (= (and b!55630 (not res!31341)) b!55645))

(assert (= (and b!55637 condMapEmpty!2730) mapIsEmpty!2730))

(assert (= (and b!55637 (not condMapEmpty!2730)) mapNonEmpty!2729))

(get-info :version)

(assert (= (and mapNonEmpty!2729 ((_ is ValueCellFull!833) mapValue!2729)) b!55635))

(assert (= (and b!55637 ((_ is ValueCellFull!833) mapDefault!2729)) b!55632))

(assert (= b!55639 b!55637))

(assert (= b!55641 b!55639))

(assert (= b!55644 b!55641))

(assert (= start!8358 b!55644))

(assert (= (and b!55643 condMapEmpty!2729) mapIsEmpty!2729))

(assert (= (and b!55643 (not condMapEmpty!2729)) mapNonEmpty!2730))

(assert (= (and mapNonEmpty!2730 ((_ is ValueCellFull!833) mapValue!2730)) b!55646))

(assert (= (and b!55643 ((_ is ValueCellFull!833) mapDefault!2730)) b!55636))

(assert (= b!55638 b!55643))

(assert (= start!8358 b!55638))

(declare-fun b_lambda!2451 () Bool)

(assert (=> (not b_lambda!2451) (not b!55629)))

(declare-fun t!4645 () Bool)

(declare-fun tb!1217 () Bool)

(assert (=> (and b!55639 (= (defaultEntry!2001 (v!2324 (underlying!203 thiss!992))) (defaultEntry!2001 (v!2324 (underlying!203 thiss!992)))) t!4645) tb!1217))

(declare-fun result!2223 () Bool)

(assert (=> tb!1217 (= result!2223 tp_is_empty!2353)))

(assert (=> b!55629 t!4645))

(declare-fun b_and!3293 () Bool)

(assert (= b_and!3289 (and (=> t!4645 result!2223) b_and!3293)))

(declare-fun tb!1219 () Bool)

(declare-fun t!4647 () Bool)

(assert (=> (and b!55638 (= (defaultEntry!2001 newMap!16) (defaultEntry!2001 (v!2324 (underlying!203 thiss!992)))) t!4647) tb!1219))

(declare-fun result!2227 () Bool)

(assert (= result!2227 result!2223))

(assert (=> b!55629 t!4647))

(declare-fun b_and!3295 () Bool)

(assert (= b_and!3291 (and (=> t!4647 result!2227) b_and!3295)))

(declare-fun m!46873 () Bool)

(assert (=> b!55645 m!46873))

(assert (=> b!55645 m!46873))

(declare-fun m!46875 () Bool)

(assert (=> b!55645 m!46875))

(declare-fun m!46877 () Bool)

(assert (=> b!55638 m!46877))

(declare-fun m!46879 () Bool)

(assert (=> b!55638 m!46879))

(declare-fun m!46881 () Bool)

(assert (=> start!8358 m!46881))

(declare-fun m!46883 () Bool)

(assert (=> b!55642 m!46883))

(declare-fun m!46885 () Bool)

(assert (=> b!55630 m!46885))

(declare-fun m!46887 () Bool)

(assert (=> b!55629 m!46887))

(declare-fun m!46889 () Bool)

(assert (=> b!55629 m!46889))

(declare-fun m!46891 () Bool)

(assert (=> b!55629 m!46891))

(assert (=> b!55629 m!46873))

(assert (=> b!55629 m!46889))

(assert (=> b!55629 m!46873))

(declare-fun m!46893 () Bool)

(assert (=> b!55629 m!46893))

(assert (=> b!55629 m!46873))

(assert (=> b!55629 m!46891))

(declare-fun m!46895 () Bool)

(assert (=> b!55629 m!46895))

(assert (=> b!55629 m!46887))

(declare-fun m!46897 () Bool)

(assert (=> b!55649 m!46897))

(declare-fun m!46899 () Bool)

(assert (=> b!55649 m!46899))

(assert (=> b!55649 m!46873))

(declare-fun m!46901 () Bool)

(assert (=> b!55649 m!46901))

(assert (=> b!55649 m!46873))

(assert (=> b!55649 m!46873))

(declare-fun m!46903 () Bool)

(assert (=> b!55649 m!46903))

(assert (=> b!55633 m!46873))

(declare-fun m!46905 () Bool)

(assert (=> b!55633 m!46905))

(declare-fun m!46907 () Bool)

(assert (=> b!55633 m!46907))

(declare-fun m!46909 () Bool)

(assert (=> b!55639 m!46909))

(declare-fun m!46911 () Bool)

(assert (=> b!55639 m!46911))

(declare-fun m!46913 () Bool)

(assert (=> mapNonEmpty!2730 m!46913))

(declare-fun m!46915 () Bool)

(assert (=> b!55648 m!46915))

(declare-fun m!46917 () Bool)

(assert (=> b!55647 m!46917))

(declare-fun m!46919 () Bool)

(assert (=> b!55634 m!46919))

(declare-fun m!46921 () Bool)

(assert (=> mapNonEmpty!2729 m!46921))

(check-sat (not start!8358) (not mapNonEmpty!2730) (not b!55639) (not b!55649) (not b!55630) (not b!55647) (not b!55645) (not b!55642) b_and!3293 (not b_next!1875) (not b_lambda!2451) (not mapNonEmpty!2729) (not b!55638) tp_is_empty!2353 (not b_next!1873) (not b!55648) (not b!55629) b_and!3295 (not b!55634) (not b!55633))
(check-sat b_and!3293 b_and!3295 (not b_next!1873) (not b_next!1875))
