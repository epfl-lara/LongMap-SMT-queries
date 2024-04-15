; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15260 () Bool)

(assert start!15260)

(declare-fun b!147198 () Bool)

(declare-fun b_free!3145 () Bool)

(declare-fun b_next!3145 () Bool)

(assert (=> b!147198 (= b_free!3145 (not b_next!3145))))

(declare-fun tp!11943 () Bool)

(declare-fun b_and!9209 () Bool)

(assert (=> b!147198 (= tp!11943 b_and!9209)))

(declare-fun b!147200 () Bool)

(declare-fun b_free!3147 () Bool)

(declare-fun b_next!3147 () Bool)

(assert (=> b!147200 (= b_free!3147 (not b_next!3147))))

(declare-fun tp!11942 () Bool)

(declare-fun b_and!9211 () Bool)

(assert (=> b!147200 (= tp!11942 b_and!9211)))

(declare-fun b!147194 () Bool)

(declare-fun e!96073 () Bool)

(declare-fun e!96080 () Bool)

(declare-fun mapRes!5043 () Bool)

(assert (=> b!147194 (= e!96073 (and e!96080 mapRes!5043))))

(declare-fun condMapEmpty!5043 () Bool)

(declare-datatypes ((V!3633 0))(
  ( (V!3634 (val!1539 Int)) )
))
(declare-datatypes ((array!5005 0))(
  ( (array!5006 (arr!2362 (Array (_ BitVec 32) (_ BitVec 64))) (size!2639 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1151 0))(
  ( (ValueCellFull!1151 (v!3363 V!3633)) (EmptyCell!1151) )
))
(declare-datatypes ((array!5007 0))(
  ( (array!5008 (arr!2363 (Array (_ BitVec 32) ValueCell!1151)) (size!2640 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1210 0))(
  ( (LongMapFixedSize!1211 (defaultEntry!3024 Int) (mask!7405 (_ BitVec 32)) (extraKeys!2769 (_ BitVec 32)) (zeroValue!2869 V!3633) (minValue!2869 V!3633) (_size!654 (_ BitVec 32)) (_keys!4792 array!5005) (_values!3007 array!5007) (_vacant!654 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!984 0))(
  ( (Cell!985 (v!3364 LongMapFixedSize!1210)) )
))
(declare-datatypes ((LongMap!984 0))(
  ( (LongMap!985 (underlying!503 Cell!984)) )
))
(declare-fun thiss!992 () LongMap!984)

(declare-fun mapDefault!5044 () ValueCell!1151)

(assert (=> b!147194 (= condMapEmpty!5043 (= (arr!2363 (_values!3007 (v!3364 (underlying!503 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1151)) mapDefault!5044)))))

(declare-fun b!147195 () Bool)

(declare-fun res!69916 () Bool)

(declare-fun e!96081 () Bool)

(assert (=> b!147195 (=> (not res!69916) (not e!96081))))

(declare-fun newMap!16 () LongMapFixedSize!1210)

(assert (=> b!147195 (= res!69916 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7405 newMap!16)) (_size!654 (v!3364 (underlying!503 thiss!992)))))))

(declare-fun b!147196 () Bool)

(declare-fun e!96087 () Bool)

(declare-fun tp_is_empty!2989 () Bool)

(assert (=> b!147196 (= e!96087 tp_is_empty!2989)))

(declare-fun b!147197 () Bool)

(declare-fun e!96088 () Bool)

(declare-fun e!96084 () Bool)

(assert (=> b!147197 (= e!96088 e!96084)))

(declare-fun mapNonEmpty!5043 () Bool)

(declare-fun mapRes!5044 () Bool)

(declare-fun tp!11941 () Bool)

(declare-fun e!96086 () Bool)

(assert (=> mapNonEmpty!5043 (= mapRes!5044 (and tp!11941 e!96086))))

(declare-fun mapKey!5044 () (_ BitVec 32))

(declare-fun mapValue!5044 () ValueCell!1151)

(declare-fun mapRest!5044 () (Array (_ BitVec 32) ValueCell!1151))

(assert (=> mapNonEmpty!5043 (= (arr!2363 (_values!3007 newMap!16)) (store mapRest!5044 mapKey!5044 mapValue!5044))))

(declare-fun mapNonEmpty!5044 () Bool)

(declare-fun tp!11944 () Bool)

(assert (=> mapNonEmpty!5044 (= mapRes!5043 (and tp!11944 e!96087))))

(declare-fun mapKey!5043 () (_ BitVec 32))

(declare-fun mapValue!5043 () ValueCell!1151)

(declare-fun mapRest!5043 () (Array (_ BitVec 32) ValueCell!1151))

(assert (=> mapNonEmpty!5044 (= (arr!2363 (_values!3007 (v!3364 (underlying!503 thiss!992)))) (store mapRest!5043 mapKey!5043 mapValue!5043))))

(declare-fun b!147199 () Bool)

(declare-fun e!96076 () Bool)

(assert (=> b!147199 (= e!96084 e!96076)))

(declare-fun mapIsEmpty!5043 () Bool)

(assert (=> mapIsEmpty!5043 mapRes!5043))

(declare-fun e!96085 () Bool)

(declare-fun e!96074 () Bool)

(declare-fun array_inv!1513 (array!5005) Bool)

(declare-fun array_inv!1514 (array!5007) Bool)

(assert (=> b!147200 (= e!96085 (and tp!11942 tp_is_empty!2989 (array_inv!1513 (_keys!4792 newMap!16)) (array_inv!1514 (_values!3007 newMap!16)) e!96074))))

(declare-fun b!147201 () Bool)

(assert (=> b!147201 (= e!96086 tp_is_empty!2989)))

(declare-fun b!147202 () Bool)

(assert (=> b!147202 (= e!96080 tp_is_empty!2989)))

(declare-fun b!147203 () Bool)

(declare-fun res!69915 () Bool)

(assert (=> b!147203 (=> (not res!69915) (not e!96081))))

(declare-fun valid!597 (LongMapFixedSize!1210) Bool)

(assert (=> b!147203 (= res!69915 (valid!597 newMap!16))))

(declare-fun b!147204 () Bool)

(declare-fun e!96078 () Bool)

(assert (=> b!147204 (= e!96074 (and e!96078 mapRes!5044))))

(declare-fun condMapEmpty!5044 () Bool)

(declare-fun mapDefault!5043 () ValueCell!1151)

(assert (=> b!147204 (= condMapEmpty!5044 (= (arr!2363 (_values!3007 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1151)) mapDefault!5043)))))

(declare-fun b!147205 () Bool)

(declare-fun e!96083 () Bool)

(declare-fun e!96077 () Bool)

(assert (=> b!147205 (= e!96083 e!96077)))

(declare-fun res!69914 () Bool)

(assert (=> b!147205 (=> (not res!69914) (not e!96077))))

(declare-datatypes ((tuple2!2750 0))(
  ( (tuple2!2751 (_1!1386 Bool) (_2!1386 LongMapFixedSize!1210)) )
))
(declare-fun lt!77550 () tuple2!2750)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!147205 (= res!69914 (and (_1!1386 lt!77550) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!4651 0))(
  ( (Unit!4652) )
))
(declare-fun lt!77547 () Unit!4651)

(declare-fun e!96082 () Unit!4651)

(assert (=> b!147205 (= lt!77547 e!96082)))

(declare-datatypes ((tuple2!2752 0))(
  ( (tuple2!2753 (_1!1387 (_ BitVec 64)) (_2!1387 V!3633)) )
))
(declare-datatypes ((List!1784 0))(
  ( (Nil!1781) (Cons!1780 (h!2388 tuple2!2752) (t!6504 List!1784)) )
))
(declare-datatypes ((ListLongMap!1759 0))(
  ( (ListLongMap!1760 (toList!895 List!1784)) )
))
(declare-fun lt!77551 () ListLongMap!1759)

(declare-fun c!27811 () Bool)

(declare-fun contains!944 (ListLongMap!1759 (_ BitVec 64)) Bool)

(assert (=> b!147205 (= c!27811 (contains!944 lt!77551 (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355)))))

(declare-fun update!229 (LongMapFixedSize!1210 (_ BitVec 64) V!3633) tuple2!2750)

(declare-fun get!1580 (ValueCell!1151 V!3633) V!3633)

(declare-fun dynLambda!455 (Int (_ BitVec 64)) V!3633)

(assert (=> b!147205 (= lt!77550 (update!229 newMap!16 (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355) (get!1580 (select (arr!2363 (_values!3007 (v!3364 (underlying!503 thiss!992)))) from!355) (dynLambda!455 (defaultEntry!3024 (v!3364 (underlying!503 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!69919 () Bool)

(assert (=> start!15260 (=> (not res!69919) (not e!96081))))

(declare-fun valid!598 (LongMap!984) Bool)

(assert (=> start!15260 (= res!69919 (valid!598 thiss!992))))

(assert (=> start!15260 e!96081))

(assert (=> start!15260 e!96088))

(assert (=> start!15260 true))

(assert (=> start!15260 e!96085))

(assert (=> b!147198 (= e!96076 (and tp!11943 tp_is_empty!2989 (array_inv!1513 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) (array_inv!1514 (_values!3007 (v!3364 (underlying!503 thiss!992)))) e!96073))))

(declare-fun b!147206 () Bool)

(declare-fun res!69917 () Bool)

(assert (=> b!147206 (=> (not res!69917) (not e!96081))))

(assert (=> b!147206 (= res!69917 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2639 (_keys!4792 (v!3364 (underlying!503 thiss!992)))))))))

(declare-fun b!147207 () Bool)

(assert (=> b!147207 (= e!96077 false)))

(declare-fun lt!77546 () ListLongMap!1759)

(declare-fun getCurrentListMapNoExtraKeys!143 (array!5005 array!5007 (_ BitVec 32) (_ BitVec 32) V!3633 V!3633 (_ BitVec 32) Int) ListLongMap!1759)

(assert (=> b!147207 (= lt!77546 (getCurrentListMapNoExtraKeys!143 (_keys!4792 (v!3364 (underlying!503 thiss!992))) (_values!3007 (v!3364 (underlying!503 thiss!992))) (mask!7405 (v!3364 (underlying!503 thiss!992))) (extraKeys!2769 (v!3364 (underlying!503 thiss!992))) (zeroValue!2869 (v!3364 (underlying!503 thiss!992))) (minValue!2869 (v!3364 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3024 (v!3364 (underlying!503 thiss!992)))))))

(declare-fun mapIsEmpty!5044 () Bool)

(assert (=> mapIsEmpty!5044 mapRes!5044))

(declare-fun b!147208 () Bool)

(assert (=> b!147208 (= e!96078 tp_is_empty!2989)))

(declare-fun b!147209 () Bool)

(declare-fun Unit!4653 () Unit!4651)

(assert (=> b!147209 (= e!96082 Unit!4653)))

(declare-fun b!147210 () Bool)

(declare-fun Unit!4654 () Unit!4651)

(assert (=> b!147210 (= e!96082 Unit!4654)))

(declare-fun lt!77548 () Unit!4651)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!163 (array!5005 array!5007 (_ BitVec 32) (_ BitVec 32) V!3633 V!3633 (_ BitVec 64) (_ BitVec 32) Int) Unit!4651)

(assert (=> b!147210 (= lt!77548 (lemmaListMapContainsThenArrayContainsFrom!163 (_keys!4792 (v!3364 (underlying!503 thiss!992))) (_values!3007 (v!3364 (underlying!503 thiss!992))) (mask!7405 (v!3364 (underlying!503 thiss!992))) (extraKeys!2769 (v!3364 (underlying!503 thiss!992))) (zeroValue!2869 (v!3364 (underlying!503 thiss!992))) (minValue!2869 (v!3364 (underlying!503 thiss!992))) (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3024 (v!3364 (underlying!503 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147210 (arrayContainsKey!0 (_keys!4792 (v!3364 (underlying!503 thiss!992))) (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77549 () Unit!4651)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5005 (_ BitVec 32) (_ BitVec 32)) Unit!4651)

(assert (=> b!147210 (= lt!77549 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4792 (v!3364 (underlying!503 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1785 0))(
  ( (Nil!1782) (Cons!1781 (h!2389 (_ BitVec 64)) (t!6505 List!1785)) )
))
(declare-fun arrayNoDuplicates!0 (array!5005 (_ BitVec 32) List!1785) Bool)

(assert (=> b!147210 (arrayNoDuplicates!0 (_keys!4792 (v!3364 (underlying!503 thiss!992))) from!355 Nil!1782)))

(declare-fun lt!77553 () Unit!4651)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5005 (_ BitVec 32) (_ BitVec 64) List!1785) Unit!4651)

(assert (=> b!147210 (= lt!77553 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4792 (v!3364 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355) (Cons!1781 (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355) Nil!1782)))))

(assert (=> b!147210 false))

(declare-fun b!147211 () Bool)

(assert (=> b!147211 (= e!96081 e!96083)))

(declare-fun res!69918 () Bool)

(assert (=> b!147211 (=> (not res!69918) (not e!96083))))

(declare-fun lt!77552 () ListLongMap!1759)

(assert (=> b!147211 (= res!69918 (and (= lt!77552 lt!77551) (not (= (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2362 (_keys!4792 (v!3364 (underlying!503 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1462 (LongMapFixedSize!1210) ListLongMap!1759)

(assert (=> b!147211 (= lt!77551 (map!1462 newMap!16))))

(declare-fun getCurrentListMap!552 (array!5005 array!5007 (_ BitVec 32) (_ BitVec 32) V!3633 V!3633 (_ BitVec 32) Int) ListLongMap!1759)

(assert (=> b!147211 (= lt!77552 (getCurrentListMap!552 (_keys!4792 (v!3364 (underlying!503 thiss!992))) (_values!3007 (v!3364 (underlying!503 thiss!992))) (mask!7405 (v!3364 (underlying!503 thiss!992))) (extraKeys!2769 (v!3364 (underlying!503 thiss!992))) (zeroValue!2869 (v!3364 (underlying!503 thiss!992))) (minValue!2869 (v!3364 (underlying!503 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3024 (v!3364 (underlying!503 thiss!992)))))))

(assert (= (and start!15260 res!69919) b!147206))

(assert (= (and b!147206 res!69917) b!147203))

(assert (= (and b!147203 res!69915) b!147195))

(assert (= (and b!147195 res!69916) b!147211))

(assert (= (and b!147211 res!69918) b!147205))

(assert (= (and b!147205 c!27811) b!147210))

(assert (= (and b!147205 (not c!27811)) b!147209))

(assert (= (and b!147205 res!69914) b!147207))

(assert (= (and b!147194 condMapEmpty!5043) mapIsEmpty!5043))

(assert (= (and b!147194 (not condMapEmpty!5043)) mapNonEmpty!5044))

(get-info :version)

(assert (= (and mapNonEmpty!5044 ((_ is ValueCellFull!1151) mapValue!5043)) b!147196))

(assert (= (and b!147194 ((_ is ValueCellFull!1151) mapDefault!5044)) b!147202))

(assert (= b!147198 b!147194))

(assert (= b!147199 b!147198))

(assert (= b!147197 b!147199))

(assert (= start!15260 b!147197))

(assert (= (and b!147204 condMapEmpty!5044) mapIsEmpty!5044))

(assert (= (and b!147204 (not condMapEmpty!5044)) mapNonEmpty!5043))

(assert (= (and mapNonEmpty!5043 ((_ is ValueCellFull!1151) mapValue!5044)) b!147201))

(assert (= (and b!147204 ((_ is ValueCellFull!1151) mapDefault!5043)) b!147208))

(assert (= b!147200 b!147204))

(assert (= start!15260 b!147200))

(declare-fun b_lambda!6577 () Bool)

(assert (=> (not b_lambda!6577) (not b!147205)))

(declare-fun t!6501 () Bool)

(declare-fun tb!2681 () Bool)

(assert (=> (and b!147198 (= (defaultEntry!3024 (v!3364 (underlying!503 thiss!992))) (defaultEntry!3024 (v!3364 (underlying!503 thiss!992)))) t!6501) tb!2681))

(declare-fun result!4383 () Bool)

(assert (=> tb!2681 (= result!4383 tp_is_empty!2989)))

(assert (=> b!147205 t!6501))

(declare-fun b_and!9213 () Bool)

(assert (= b_and!9209 (and (=> t!6501 result!4383) b_and!9213)))

(declare-fun t!6503 () Bool)

(declare-fun tb!2683 () Bool)

(assert (=> (and b!147200 (= (defaultEntry!3024 newMap!16) (defaultEntry!3024 (v!3364 (underlying!503 thiss!992)))) t!6503) tb!2683))

(declare-fun result!4387 () Bool)

(assert (= result!4387 result!4383))

(assert (=> b!147205 t!6503))

(declare-fun b_and!9215 () Bool)

(assert (= b_and!9211 (and (=> t!6503 result!4387) b_and!9215)))

(declare-fun m!176695 () Bool)

(assert (=> mapNonEmpty!5043 m!176695))

(declare-fun m!176697 () Bool)

(assert (=> b!147211 m!176697))

(declare-fun m!176699 () Bool)

(assert (=> b!147211 m!176699))

(declare-fun m!176701 () Bool)

(assert (=> b!147211 m!176701))

(declare-fun m!176703 () Bool)

(assert (=> mapNonEmpty!5044 m!176703))

(declare-fun m!176705 () Bool)

(assert (=> start!15260 m!176705))

(declare-fun m!176707 () Bool)

(assert (=> b!147203 m!176707))

(declare-fun m!176709 () Bool)

(assert (=> b!147205 m!176709))

(declare-fun m!176711 () Bool)

(assert (=> b!147205 m!176711))

(declare-fun m!176713 () Bool)

(assert (=> b!147205 m!176713))

(assert (=> b!147205 m!176697))

(assert (=> b!147205 m!176697))

(declare-fun m!176715 () Bool)

(assert (=> b!147205 m!176715))

(assert (=> b!147205 m!176711))

(assert (=> b!147205 m!176697))

(assert (=> b!147205 m!176713))

(declare-fun m!176717 () Bool)

(assert (=> b!147205 m!176717))

(assert (=> b!147205 m!176709))

(declare-fun m!176719 () Bool)

(assert (=> b!147200 m!176719))

(declare-fun m!176721 () Bool)

(assert (=> b!147200 m!176721))

(declare-fun m!176723 () Bool)

(assert (=> b!147210 m!176723))

(declare-fun m!176725 () Bool)

(assert (=> b!147210 m!176725))

(assert (=> b!147210 m!176697))

(declare-fun m!176727 () Bool)

(assert (=> b!147210 m!176727))

(assert (=> b!147210 m!176697))

(assert (=> b!147210 m!176697))

(declare-fun m!176729 () Bool)

(assert (=> b!147210 m!176729))

(assert (=> b!147210 m!176697))

(declare-fun m!176731 () Bool)

(assert (=> b!147210 m!176731))

(declare-fun m!176733 () Bool)

(assert (=> b!147207 m!176733))

(declare-fun m!176735 () Bool)

(assert (=> b!147198 m!176735))

(declare-fun m!176737 () Bool)

(assert (=> b!147198 m!176737))

(check-sat b_and!9215 (not b_next!3147) (not b!147210) (not b!147198) (not b_lambda!6577) (not b!147211) b_and!9213 (not mapNonEmpty!5044) tp_is_empty!2989 (not b!147205) (not b_next!3145) (not b!147207) (not b!147203) (not b!147200) (not mapNonEmpty!5043) (not start!15260))
(check-sat b_and!9213 b_and!9215 (not b_next!3145) (not b_next!3147))
