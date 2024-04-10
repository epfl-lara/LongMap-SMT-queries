; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14882 () Bool)

(assert start!14882)

(declare-fun b!143053 () Bool)

(declare-fun b_free!3041 () Bool)

(declare-fun b_next!3041 () Bool)

(assert (=> b!143053 (= b_free!3041 (not b_next!3041))))

(declare-fun tp!11604 () Bool)

(declare-fun b_and!8915 () Bool)

(assert (=> b!143053 (= tp!11604 b_and!8915)))

(declare-fun b!143045 () Bool)

(declare-fun b_free!3043 () Bool)

(declare-fun b_next!3043 () Bool)

(assert (=> b!143045 (= b_free!3043 (not b_next!3043))))

(declare-fun tp!11606 () Bool)

(declare-fun b_and!8917 () Bool)

(assert (=> b!143045 (= tp!11606 b_and!8917)))

(declare-fun b!143037 () Bool)

(declare-fun e!93219 () Bool)

(declare-fun e!93218 () Bool)

(assert (=> b!143037 (= e!93219 e!93218)))

(declare-fun b!143038 () Bool)

(declare-fun e!93222 () Bool)

(assert (=> b!143038 (= e!93218 e!93222)))

(declare-fun b!143040 () Bool)

(declare-fun e!93221 () Bool)

(declare-fun tp_is_empty!2937 () Bool)

(assert (=> b!143040 (= e!93221 tp_is_empty!2937)))

(declare-fun b!143041 () Bool)

(declare-fun e!93225 () Bool)

(assert (=> b!143041 (= e!93225 tp_is_empty!2937)))

(declare-fun mapNonEmpty!4861 () Bool)

(declare-fun mapRes!4861 () Bool)

(declare-fun tp!11605 () Bool)

(assert (=> mapNonEmpty!4861 (= mapRes!4861 (and tp!11605 e!93225))))

(declare-datatypes ((V!3563 0))(
  ( (V!3564 (val!1513 Int)) )
))
(declare-datatypes ((array!4911 0))(
  ( (array!4912 (arr!2321 (Array (_ BitVec 32) (_ BitVec 64))) (size!2594 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1125 0))(
  ( (ValueCellFull!1125 (v!3296 V!3563)) (EmptyCell!1125) )
))
(declare-datatypes ((array!4913 0))(
  ( (array!4914 (arr!2322 (Array (_ BitVec 32) ValueCell!1125)) (size!2595 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1158 0))(
  ( (LongMapFixedSize!1159 (defaultEntry!2963 Int) (mask!7315 (_ BitVec 32)) (extraKeys!2714 (_ BitVec 32)) (zeroValue!2811 V!3563) (minValue!2811 V!3563) (_size!628 (_ BitVec 32)) (_keys!4726 array!4911) (_values!2946 array!4913) (_vacant!628 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!944 0))(
  ( (Cell!945 (v!3297 LongMapFixedSize!1158)) )
))
(declare-datatypes ((LongMap!944 0))(
  ( (LongMap!945 (underlying!483 Cell!944)) )
))
(declare-fun thiss!992 () LongMap!944)

(declare-fun mapKey!4862 () (_ BitVec 32))

(declare-fun mapRest!4861 () (Array (_ BitVec 32) ValueCell!1125))

(declare-fun mapValue!4861 () ValueCell!1125)

(assert (=> mapNonEmpty!4861 (= (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (store mapRest!4861 mapKey!4862 mapValue!4861))))

(declare-fun b!143042 () Bool)

(declare-fun e!93223 () Bool)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((List!1749 0))(
  ( (Nil!1746) (Cons!1745 (h!2353 (_ BitVec 64)) (t!6362 List!1749)) )
))
(declare-fun noDuplicate!51 (List!1749) Bool)

(assert (=> b!143042 (= e!93223 (noDuplicate!51 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746)))))

(declare-fun mapNonEmpty!4862 () Bool)

(declare-fun mapRes!4862 () Bool)

(declare-fun tp!11603 () Bool)

(assert (=> mapNonEmpty!4862 (= mapRes!4862 (and tp!11603 e!93221))))

(declare-fun mapValue!4862 () ValueCell!1125)

(declare-fun newMap!16 () LongMapFixedSize!1158)

(declare-fun mapKey!4861 () (_ BitVec 32))

(declare-fun mapRest!4862 () (Array (_ BitVec 32) ValueCell!1125))

(assert (=> mapNonEmpty!4862 (= (arr!2322 (_values!2946 newMap!16)) (store mapRest!4862 mapKey!4861 mapValue!4862))))

(declare-fun b!143043 () Bool)

(declare-fun res!68161 () Bool)

(declare-fun e!93228 () Bool)

(assert (=> b!143043 (=> (not res!68161) (not e!93228))))

(assert (=> b!143043 (= res!68161 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7315 newMap!16)) (_size!628 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun b!143044 () Bool)

(declare-fun e!93230 () Bool)

(declare-fun e!93227 () Bool)

(assert (=> b!143044 (= e!93230 e!93227)))

(declare-fun res!68165 () Bool)

(assert (=> b!143044 (=> (not res!68165) (not e!93227))))

(declare-datatypes ((tuple2!2706 0))(
  ( (tuple2!2707 (_1!1364 (_ BitVec 64)) (_2!1364 V!3563)) )
))
(declare-datatypes ((List!1750 0))(
  ( (Nil!1747) (Cons!1746 (h!2354 tuple2!2706) (t!6363 List!1750)) )
))
(declare-datatypes ((ListLongMap!1749 0))(
  ( (ListLongMap!1750 (toList!890 List!1750)) )
))
(declare-fun lt!74887 () ListLongMap!1749)

(declare-fun contains!927 (ListLongMap!1749 (_ BitVec 64)) Bool)

(assert (=> b!143044 (= res!68165 (contains!927 lt!74887 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2708 0))(
  ( (tuple2!2709 (_1!1365 Bool) (_2!1365 LongMapFixedSize!1158)) )
))
(declare-fun lt!74885 () tuple2!2708)

(declare-fun update!213 (LongMapFixedSize!1158 (_ BitVec 64) V!3563) tuple2!2708)

(declare-fun get!1535 (ValueCell!1125 V!3563) V!3563)

(declare-fun dynLambda!444 (Int (_ BitVec 64)) V!3563)

(assert (=> b!143044 (= lt!74885 (update!213 newMap!16 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!93220 () Bool)

(declare-fun e!93226 () Bool)

(declare-fun array_inv!1457 (array!4911) Bool)

(declare-fun array_inv!1458 (array!4913) Bool)

(assert (=> b!143045 (= e!93226 (and tp!11606 tp_is_empty!2937 (array_inv!1457 (_keys!4726 newMap!16)) (array_inv!1458 (_values!2946 newMap!16)) e!93220))))

(declare-fun b!143046 () Bool)

(assert (=> b!143046 (= e!93228 e!93230)))

(declare-fun res!68160 () Bool)

(assert (=> b!143046 (=> (not res!68160) (not e!93230))))

(declare-fun lt!74884 () ListLongMap!1749)

(assert (=> b!143046 (= res!68160 (and (= lt!74884 lt!74887) (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1445 (LongMapFixedSize!1158) ListLongMap!1749)

(assert (=> b!143046 (= lt!74887 (map!1445 newMap!16))))

(declare-fun getCurrentListMap!562 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 32) Int) ListLongMap!1749)

(assert (=> b!143046 (= lt!74884 (getCurrentListMap!562 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun b!143039 () Bool)

(declare-fun res!68162 () Bool)

(assert (=> b!143039 (=> (not res!68162) (not e!93228))))

(declare-fun valid!559 (LongMapFixedSize!1158) Bool)

(assert (=> b!143039 (= res!68162 (valid!559 newMap!16))))

(declare-fun res!68164 () Bool)

(assert (=> start!14882 (=> (not res!68164) (not e!93228))))

(declare-fun valid!560 (LongMap!944) Bool)

(assert (=> start!14882 (= res!68164 (valid!560 thiss!992))))

(assert (=> start!14882 e!93228))

(assert (=> start!14882 e!93219))

(assert (=> start!14882 true))

(assert (=> start!14882 e!93226))

(declare-fun mapIsEmpty!4861 () Bool)

(assert (=> mapIsEmpty!4861 mapRes!4861))

(declare-fun mapIsEmpty!4862 () Bool)

(assert (=> mapIsEmpty!4862 mapRes!4862))

(declare-fun b!143047 () Bool)

(declare-fun e!93231 () Bool)

(declare-fun e!93229 () Bool)

(assert (=> b!143047 (= e!93231 (and e!93229 mapRes!4861))))

(declare-fun condMapEmpty!4861 () Bool)

(declare-fun mapDefault!4862 () ValueCell!1125)

(assert (=> b!143047 (= condMapEmpty!4861 (= (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1125)) mapDefault!4862)))))

(declare-fun b!143048 () Bool)

(declare-fun e!93233 () Bool)

(assert (=> b!143048 (= e!93220 (and e!93233 mapRes!4862))))

(declare-fun condMapEmpty!4862 () Bool)

(declare-fun mapDefault!4861 () ValueCell!1125)

(assert (=> b!143048 (= condMapEmpty!4862 (= (arr!2322 (_values!2946 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1125)) mapDefault!4861)))))

(declare-fun b!143049 () Bool)

(declare-fun res!68159 () Bool)

(assert (=> b!143049 (=> (not res!68159) (not e!93228))))

(assert (=> b!143049 (= res!68159 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun b!143050 () Bool)

(assert (=> b!143050 (= e!93229 tp_is_empty!2937)))

(declare-fun b!143051 () Bool)

(assert (=> b!143051 (= e!93233 tp_is_empty!2937)))

(declare-fun b!143052 () Bool)

(assert (=> b!143052 (= e!93227 (not e!93223))))

(declare-fun res!68163 () Bool)

(assert (=> b!143052 (=> res!68163 e!93223)))

(assert (=> b!143052 (= res!68163 (or (bvsge (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun arrayNoDuplicates!0 (array!4911 (_ BitVec 32) List!1749) Bool)

(assert (=> b!143052 (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) from!355 Nil!1746)))

(declare-datatypes ((Unit!4535 0))(
  ( (Unit!4536) )
))
(declare-fun lt!74886 () Unit!4535)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4911 (_ BitVec 32) (_ BitVec 32)) Unit!4535)

(assert (=> b!143052 (= lt!74886 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143052 (arrayContainsKey!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!74883 () Unit!4535)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!141 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 64) (_ BitVec 32) Int) Unit!4535)

(assert (=> b!143052 (= lt!74883 (lemmaListMapContainsThenArrayContainsFrom!141 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(assert (=> b!143053 (= e!93222 (and tp!11604 tp_is_empty!2937 (array_inv!1457 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (array_inv!1458 (_values!2946 (v!3297 (underlying!483 thiss!992)))) e!93231))))

(assert (= (and start!14882 res!68164) b!143049))

(assert (= (and b!143049 res!68159) b!143039))

(assert (= (and b!143039 res!68162) b!143043))

(assert (= (and b!143043 res!68161) b!143046))

(assert (= (and b!143046 res!68160) b!143044))

(assert (= (and b!143044 res!68165) b!143052))

(assert (= (and b!143052 (not res!68163)) b!143042))

(assert (= (and b!143047 condMapEmpty!4861) mapIsEmpty!4861))

(assert (= (and b!143047 (not condMapEmpty!4861)) mapNonEmpty!4861))

(get-info :version)

(assert (= (and mapNonEmpty!4861 ((_ is ValueCellFull!1125) mapValue!4861)) b!143041))

(assert (= (and b!143047 ((_ is ValueCellFull!1125) mapDefault!4862)) b!143050))

(assert (= b!143053 b!143047))

(assert (= b!143038 b!143053))

(assert (= b!143037 b!143038))

(assert (= start!14882 b!143037))

(assert (= (and b!143048 condMapEmpty!4862) mapIsEmpty!4862))

(assert (= (and b!143048 (not condMapEmpty!4862)) mapNonEmpty!4862))

(assert (= (and mapNonEmpty!4862 ((_ is ValueCellFull!1125) mapValue!4862)) b!143040))

(assert (= (and b!143048 ((_ is ValueCellFull!1125) mapDefault!4861)) b!143051))

(assert (= b!143045 b!143048))

(assert (= start!14882 b!143045))

(declare-fun b_lambda!6421 () Bool)

(assert (=> (not b_lambda!6421) (not b!143044)))

(declare-fun t!6359 () Bool)

(declare-fun tb!2573 () Bool)

(assert (=> (and b!143053 (= (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))) t!6359) tb!2573))

(declare-fun result!4213 () Bool)

(assert (=> tb!2573 (= result!4213 tp_is_empty!2937)))

(assert (=> b!143044 t!6359))

(declare-fun b_and!8919 () Bool)

(assert (= b_and!8915 (and (=> t!6359 result!4213) b_and!8919)))

(declare-fun t!6361 () Bool)

(declare-fun tb!2575 () Bool)

(assert (=> (and b!143045 (= (defaultEntry!2963 newMap!16) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))) t!6361) tb!2575))

(declare-fun result!4217 () Bool)

(assert (= result!4217 result!4213))

(assert (=> b!143044 t!6361))

(declare-fun b_and!8921 () Bool)

(assert (= b_and!8917 (and (=> t!6361 result!4217) b_and!8921)))

(declare-fun m!172669 () Bool)

(assert (=> mapNonEmpty!4861 m!172669))

(declare-fun m!172671 () Bool)

(assert (=> b!143045 m!172671))

(declare-fun m!172673 () Bool)

(assert (=> b!143045 m!172673))

(declare-fun m!172675 () Bool)

(assert (=> b!143046 m!172675))

(declare-fun m!172677 () Bool)

(assert (=> b!143046 m!172677))

(declare-fun m!172679 () Bool)

(assert (=> b!143046 m!172679))

(declare-fun m!172681 () Bool)

(assert (=> b!143044 m!172681))

(declare-fun m!172683 () Bool)

(assert (=> b!143044 m!172683))

(declare-fun m!172685 () Bool)

(assert (=> b!143044 m!172685))

(assert (=> b!143044 m!172675))

(assert (=> b!143044 m!172683))

(assert (=> b!143044 m!172675))

(declare-fun m!172687 () Bool)

(assert (=> b!143044 m!172687))

(assert (=> b!143044 m!172675))

(assert (=> b!143044 m!172685))

(declare-fun m!172689 () Bool)

(assert (=> b!143044 m!172689))

(assert (=> b!143044 m!172681))

(declare-fun m!172691 () Bool)

(assert (=> b!143052 m!172691))

(declare-fun m!172693 () Bool)

(assert (=> b!143052 m!172693))

(assert (=> b!143052 m!172675))

(declare-fun m!172695 () Bool)

(assert (=> b!143052 m!172695))

(assert (=> b!143052 m!172675))

(assert (=> b!143052 m!172675))

(declare-fun m!172697 () Bool)

(assert (=> b!143052 m!172697))

(declare-fun m!172699 () Bool)

(assert (=> mapNonEmpty!4862 m!172699))

(declare-fun m!172701 () Bool)

(assert (=> b!143039 m!172701))

(declare-fun m!172703 () Bool)

(assert (=> start!14882 m!172703))

(assert (=> b!143042 m!172675))

(declare-fun m!172705 () Bool)

(assert (=> b!143042 m!172705))

(declare-fun m!172707 () Bool)

(assert (=> b!143053 m!172707))

(declare-fun m!172709 () Bool)

(assert (=> b!143053 m!172709))

(check-sat (not b!143052) tp_is_empty!2937 (not b_next!3043) b_and!8919 (not b_next!3041) b_and!8921 (not start!14882) (not b!143042) (not mapNonEmpty!4862) (not b!143044) (not b!143046) (not b!143053) (not mapNonEmpty!4861) (not b!143045) (not b_lambda!6421) (not b!143039))
(check-sat b_and!8919 b_and!8921 (not b_next!3041) (not b_next!3043))
(get-model)

(declare-fun b_lambda!6425 () Bool)

(assert (= b_lambda!6421 (or (and b!143053 b_free!3041) (and b!143045 b_free!3043 (= (defaultEntry!2963 newMap!16) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))))) b_lambda!6425)))

(check-sat (not b!143052) tp_is_empty!2937 (not b_next!3043) b_and!8919 (not b_next!3041) b_and!8921 (not start!14882) (not b!143042) (not mapNonEmpty!4862) (not b!143044) (not b!143039) (not b!143046) (not b!143053) (not mapNonEmpty!4861) (not b!143045) (not b_lambda!6425))
(check-sat b_and!8919 b_and!8921 (not b_next!3041) (not b_next!3043))
(get-model)

(declare-fun d!45747 () Bool)

(declare-fun res!68193 () Bool)

(declare-fun e!93284 () Bool)

(assert (=> d!45747 (=> (not res!68193) (not e!93284))))

(declare-fun simpleValid!97 (LongMapFixedSize!1158) Bool)

(assert (=> d!45747 (= res!68193 (simpleValid!97 newMap!16))))

(assert (=> d!45747 (= (valid!559 newMap!16) e!93284)))

(declare-fun b!143115 () Bool)

(declare-fun res!68194 () Bool)

(assert (=> b!143115 (=> (not res!68194) (not e!93284))))

(declare-fun arrayCountValidKeys!0 (array!4911 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!143115 (= res!68194 (= (arrayCountValidKeys!0 (_keys!4726 newMap!16) #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) (_size!628 newMap!16)))))

(declare-fun b!143116 () Bool)

(declare-fun res!68195 () Bool)

(assert (=> b!143116 (=> (not res!68195) (not e!93284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4911 (_ BitVec 32)) Bool)

(assert (=> b!143116 (= res!68195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(declare-fun b!143117 () Bool)

(assert (=> b!143117 (= e!93284 (arrayNoDuplicates!0 (_keys!4726 newMap!16) #b00000000000000000000000000000000 Nil!1746))))

(assert (= (and d!45747 res!68193) b!143115))

(assert (= (and b!143115 res!68194) b!143116))

(assert (= (and b!143116 res!68195) b!143117))

(declare-fun m!172753 () Bool)

(assert (=> d!45747 m!172753))

(declare-fun m!172755 () Bool)

(assert (=> b!143115 m!172755))

(declare-fun m!172757 () Bool)

(assert (=> b!143116 m!172757))

(declare-fun m!172759 () Bool)

(assert (=> b!143117 m!172759))

(assert (=> b!143039 d!45747))

(declare-fun d!45749 () Bool)

(declare-fun res!68202 () Bool)

(declare-fun e!93294 () Bool)

(assert (=> d!45749 (=> res!68202 e!93294)))

(assert (=> d!45749 (= res!68202 (bvsge from!355 (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(assert (=> d!45749 (= (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) from!355 Nil!1746) e!93294)))

(declare-fun call!15796 () Bool)

(declare-fun bm!15793 () Bool)

(declare-fun c!27062 () Bool)

(assert (=> bm!15793 (= call!15796 (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27062 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746) Nil!1746)))))

(declare-fun b!143128 () Bool)

(declare-fun e!93295 () Bool)

(assert (=> b!143128 (= e!93295 call!15796)))

(declare-fun b!143129 () Bool)

(declare-fun e!93293 () Bool)

(assert (=> b!143129 (= e!93293 e!93295)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!143129 (= c!27062 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143130 () Bool)

(assert (=> b!143130 (= e!93295 call!15796)))

(declare-fun b!143131 () Bool)

(declare-fun e!93296 () Bool)

(declare-fun contains!928 (List!1749 (_ BitVec 64)) Bool)

(assert (=> b!143131 (= e!93296 (contains!928 Nil!1746 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143132 () Bool)

(assert (=> b!143132 (= e!93294 e!93293)))

(declare-fun res!68204 () Bool)

(assert (=> b!143132 (=> (not res!68204) (not e!93293))))

(assert (=> b!143132 (= res!68204 (not e!93296))))

(declare-fun res!68203 () Bool)

(assert (=> b!143132 (=> (not res!68203) (not e!93296))))

(assert (=> b!143132 (= res!68203 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (= (and d!45749 (not res!68202)) b!143132))

(assert (= (and b!143132 res!68203) b!143131))

(assert (= (and b!143132 res!68204) b!143129))

(assert (= (and b!143129 c!27062) b!143130))

(assert (= (and b!143129 (not c!27062)) b!143128))

(assert (= (or b!143130 b!143128) bm!15793))

(assert (=> bm!15793 m!172675))

(declare-fun m!172761 () Bool)

(assert (=> bm!15793 m!172761))

(assert (=> b!143129 m!172675))

(assert (=> b!143129 m!172675))

(declare-fun m!172763 () Bool)

(assert (=> b!143129 m!172763))

(assert (=> b!143131 m!172675))

(assert (=> b!143131 m!172675))

(declare-fun m!172765 () Bool)

(assert (=> b!143131 m!172765))

(assert (=> b!143132 m!172675))

(assert (=> b!143132 m!172675))

(assert (=> b!143132 m!172763))

(assert (=> b!143052 d!45749))

(declare-fun d!45751 () Bool)

(assert (=> d!45751 (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) from!355 Nil!1746)))

(declare-fun lt!74905 () Unit!4535)

(declare-fun choose!39 (array!4911 (_ BitVec 32) (_ BitVec 32)) Unit!4535)

(assert (=> d!45751 (= lt!74905 (choose!39 (_keys!4726 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!45751 (bvslt (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!45751 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000000 from!355) lt!74905)))

(declare-fun bs!6061 () Bool)

(assert (= bs!6061 d!45751))

(assert (=> bs!6061 m!172693))

(declare-fun m!172767 () Bool)

(assert (=> bs!6061 m!172767))

(assert (=> b!143052 d!45751))

(declare-fun d!45753 () Bool)

(declare-fun res!68209 () Bool)

(declare-fun e!93301 () Bool)

(assert (=> d!45753 (=> res!68209 e!93301)))

(assert (=> d!45753 (= res!68209 (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> d!45753 (= (arrayContainsKey!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!93301)))

(declare-fun b!143137 () Bool)

(declare-fun e!93302 () Bool)

(assert (=> b!143137 (= e!93301 e!93302)))

(declare-fun res!68210 () Bool)

(assert (=> b!143137 (=> (not res!68210) (not e!93302))))

(assert (=> b!143137 (= res!68210 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun b!143138 () Bool)

(assert (=> b!143138 (= e!93302 (arrayContainsKey!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!45753 (not res!68209)) b!143137))

(assert (= (and b!143137 res!68210) b!143138))

(declare-fun m!172769 () Bool)

(assert (=> d!45753 m!172769))

(assert (=> b!143138 m!172675))

(declare-fun m!172771 () Bool)

(assert (=> b!143138 m!172771))

(assert (=> b!143052 d!45753))

(declare-fun d!45755 () Bool)

(declare-fun e!93305 () Bool)

(assert (=> d!45755 e!93305))

(declare-fun c!27065 () Bool)

(assert (=> d!45755 (= c!27065 (and (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!74908 () Unit!4535)

(declare-fun choose!869 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 64) (_ BitVec 32) Int) Unit!4535)

(assert (=> d!45755 (= lt!74908 (choose!869 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!45755 (validMask!0 (mask!7315 (v!3297 (underlying!483 thiss!992))))))

(assert (=> d!45755 (= (lemmaListMapContainsThenArrayContainsFrom!141 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))) lt!74908)))

(declare-fun b!143143 () Bool)

(assert (=> b!143143 (= e!93305 (arrayContainsKey!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!143144 () Bool)

(assert (=> b!143144 (= e!93305 (ite (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45755 c!27065) b!143143))

(assert (= (and d!45755 (not c!27065)) b!143144))

(assert (=> d!45755 m!172675))

(declare-fun m!172773 () Bool)

(assert (=> d!45755 m!172773))

(declare-fun m!172775 () Bool)

(assert (=> d!45755 m!172775))

(assert (=> b!143143 m!172675))

(assert (=> b!143143 m!172697))

(assert (=> b!143052 d!45755))

(declare-fun d!45757 () Bool)

(declare-fun e!93311 () Bool)

(assert (=> d!45757 e!93311))

(declare-fun res!68213 () Bool)

(assert (=> d!45757 (=> res!68213 e!93311)))

(declare-fun lt!74918 () Bool)

(assert (=> d!45757 (= res!68213 (not lt!74918))))

(declare-fun lt!74919 () Bool)

(assert (=> d!45757 (= lt!74918 lt!74919)))

(declare-fun lt!74920 () Unit!4535)

(declare-fun e!93310 () Unit!4535)

(assert (=> d!45757 (= lt!74920 e!93310)))

(declare-fun c!27068 () Bool)

(assert (=> d!45757 (= c!27068 lt!74919)))

(declare-fun containsKey!181 (List!1750 (_ BitVec 64)) Bool)

(assert (=> d!45757 (= lt!74919 (containsKey!181 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> d!45757 (= (contains!927 lt!74887 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) lt!74918)))

(declare-fun b!143151 () Bool)

(declare-fun lt!74917 () Unit!4535)

(assert (=> b!143151 (= e!93310 lt!74917)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!129 (List!1750 (_ BitVec 64)) Unit!4535)

(assert (=> b!143151 (= lt!74917 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-datatypes ((Option!183 0))(
  ( (Some!182 (v!3301 V!3563)) (None!181) )
))
(declare-fun isDefined!130 (Option!183) Bool)

(declare-fun getValueByKey!177 (List!1750 (_ BitVec 64)) Option!183)

(assert (=> b!143151 (isDefined!130 (getValueByKey!177 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143152 () Bool)

(declare-fun Unit!4539 () Unit!4535)

(assert (=> b!143152 (= e!93310 Unit!4539)))

(declare-fun b!143153 () Bool)

(assert (=> b!143153 (= e!93311 (isDefined!130 (getValueByKey!177 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))))

(assert (= (and d!45757 c!27068) b!143151))

(assert (= (and d!45757 (not c!27068)) b!143152))

(assert (= (and d!45757 (not res!68213)) b!143153))

(assert (=> d!45757 m!172675))

(declare-fun m!172777 () Bool)

(assert (=> d!45757 m!172777))

(assert (=> b!143151 m!172675))

(declare-fun m!172779 () Bool)

(assert (=> b!143151 m!172779))

(assert (=> b!143151 m!172675))

(declare-fun m!172781 () Bool)

(assert (=> b!143151 m!172781))

(assert (=> b!143151 m!172781))

(declare-fun m!172783 () Bool)

(assert (=> b!143151 m!172783))

(assert (=> b!143153 m!172675))

(assert (=> b!143153 m!172781))

(assert (=> b!143153 m!172781))

(assert (=> b!143153 m!172783))

(assert (=> b!143044 d!45757))

(declare-fun b!143230 () Bool)

(declare-datatypes ((SeekEntryResult!280 0))(
  ( (MissingZero!280 (index!3284 (_ BitVec 32))) (Found!280 (index!3285 (_ BitVec 32))) (Intermediate!280 (undefined!1092 Bool) (index!3286 (_ BitVec 32)) (x!16334 (_ BitVec 32))) (Undefined!280) (MissingVacant!280 (index!3287 (_ BitVec 32))) )
))
(declare-fun lt!74994 () SeekEntryResult!280)

(declare-fun e!93359 () Bool)

(assert (=> b!143230 (= e!93359 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74994)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143231 () Bool)

(declare-fun c!27097 () Bool)

(declare-fun lt!74998 () SeekEntryResult!280)

(assert (=> b!143231 (= c!27097 ((_ is MissingVacant!280) lt!74998))))

(declare-fun e!93363 () tuple2!2708)

(declare-fun e!93369 () tuple2!2708)

(assert (=> b!143231 (= e!93363 e!93369)))

(declare-fun bm!15842 () Bool)

(declare-fun call!15850 () ListLongMap!1749)

(declare-fun call!15859 () ListLongMap!1749)

(assert (=> bm!15842 (= call!15850 call!15859)))

(declare-fun b!143232 () Bool)

(declare-fun e!93360 () Bool)

(declare-fun lt!74976 () SeekEntryResult!280)

(assert (=> b!143232 (= e!93360 ((_ is Undefined!280) lt!74976))))

(declare-fun bm!15843 () Bool)

(declare-fun call!15860 () Bool)

(declare-fun call!15848 () Bool)

(assert (=> bm!15843 (= call!15860 call!15848)))

(declare-fun b!143233 () Bool)

(declare-fun lt!74988 () Unit!4535)

(declare-fun lt!74999 () Unit!4535)

(assert (=> b!143233 (= lt!74988 lt!74999)))

(declare-fun call!15845 () ListLongMap!1749)

(declare-fun call!15855 () ListLongMap!1749)

(assert (=> b!143233 (= call!15845 call!15855)))

(declare-fun lt!74978 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!66 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 V!3563 Int) Unit!4535)

(assert (=> b!143233 (= lt!74999 (lemmaChangeZeroKeyThenAddPairToListMap!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) lt!74978 (zeroValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2811 newMap!16) (defaultEntry!2963 newMap!16)))))

(assert (=> b!143233 (= lt!74978 (bvor (extraKeys!2714 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!93352 () tuple2!2708)

(assert (=> b!143233 (= e!93352 (tuple2!2709 true (LongMapFixedSize!1159 (defaultEntry!2963 newMap!16) (mask!7315 newMap!16) (bvor (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2811 newMap!16) (_size!628 newMap!16) (_keys!4726 newMap!16) (_values!2946 newMap!16) (_vacant!628 newMap!16))))))

(declare-fun b!143234 () Bool)

(declare-fun res!68243 () Bool)

(assert (=> b!143234 (= res!68243 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3287 lt!74976)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93354 () Bool)

(assert (=> b!143234 (=> (not res!68243) (not e!93354))))

(declare-fun b!143235 () Bool)

(declare-fun lt!74995 () Unit!4535)

(declare-fun lt!74990 () Unit!4535)

(assert (=> b!143235 (= lt!74995 lt!74990)))

(assert (=> b!143235 (= call!15845 call!15850)))

(declare-fun lt!74977 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 V!3563 Int) Unit!4535)

(assert (=> b!143235 (= lt!74990 (lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) lt!74977 (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2963 newMap!16)))))

(assert (=> b!143235 (= lt!74977 (bvor (extraKeys!2714 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!143235 (= e!93352 (tuple2!2709 true (LongMapFixedSize!1159 (defaultEntry!2963 newMap!16) (mask!7315 newMap!16) (bvor (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) (zeroValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!628 newMap!16) (_keys!4726 newMap!16) (_values!2946 newMap!16) (_vacant!628 newMap!16))))))

(declare-fun b!143236 () Bool)

(declare-fun res!68245 () Bool)

(declare-fun call!15849 () Bool)

(assert (=> b!143236 (= res!68245 call!15849)))

(declare-fun e!93371 () Bool)

(assert (=> b!143236 (=> (not res!68245) (not e!93371))))

(declare-fun b!143237 () Bool)

(declare-fun e!93355 () tuple2!2708)

(assert (=> b!143237 (= e!93369 e!93355)))

(declare-fun c!27102 () Bool)

(assert (=> b!143237 (= c!27102 ((_ is MissingZero!280) lt!74998))))

(declare-fun bm!15844 () Bool)

(declare-fun call!15861 () SeekEntryResult!280)

(declare-fun call!15846 () SeekEntryResult!280)

(assert (=> bm!15844 (= call!15861 call!15846)))

(declare-fun b!143238 () Bool)

(declare-fun res!68249 () Bool)

(declare-fun e!93353 () Bool)

(assert (=> b!143238 (=> (not res!68249) (not e!93353))))

(declare-fun call!15854 () Bool)

(assert (=> b!143238 (= res!68249 call!15854)))

(declare-fun e!93361 () Bool)

(assert (=> b!143238 (= e!93361 e!93353)))

(declare-fun b!143239 () Bool)

(declare-fun e!93358 () tuple2!2708)

(assert (=> b!143239 (= e!93358 e!93352)))

(declare-fun c!27099 () Bool)

(assert (=> b!143239 (= c!27099 (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143240 () Bool)

(declare-fun res!68244 () Bool)

(assert (=> b!143240 (= res!68244 call!15860)))

(assert (=> b!143240 (=> (not res!68244) (not e!93359))))

(declare-fun bm!15845 () Bool)

(declare-fun call!15857 () ListLongMap!1749)

(assert (=> bm!15845 (= call!15855 call!15857)))

(declare-fun b!143241 () Bool)

(declare-fun e!93370 () Bool)

(declare-fun e!93357 () Bool)

(assert (=> b!143241 (= e!93370 e!93357)))

(declare-fun res!68253 () Bool)

(declare-fun call!15864 () ListLongMap!1749)

(assert (=> b!143241 (= res!68253 (contains!927 call!15864 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> b!143241 (=> (not res!68253) (not e!93357))))

(declare-fun b!143242 () Bool)

(declare-fun e!93366 () Bool)

(declare-fun lt!74991 () SeekEntryResult!280)

(assert (=> b!143242 (= e!93366 ((_ is Undefined!280) lt!74991))))

(declare-fun bm!15846 () Bool)

(declare-fun c!27104 () Bool)

(declare-fun call!15858 () ListLongMap!1749)

(declare-fun +!180 (ListLongMap!1749 tuple2!2706) ListLongMap!1749)

(assert (=> bm!15846 (= call!15858 (+!180 (ite c!27104 (ite c!27099 call!15850 call!15855) call!15857) (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!143243 () Bool)

(declare-fun c!27094 () Bool)

(assert (=> b!143243 (= c!27094 ((_ is MissingVacant!280) lt!74991))))

(declare-fun e!93364 () Bool)

(assert (=> b!143243 (= e!93364 e!93366)))

(declare-fun bm!15847 () Bool)

(assert (=> bm!15847 (= call!15845 call!15858)))

(declare-fun bm!15848 () Bool)

(declare-fun call!15853 () Bool)

(assert (=> bm!15848 (= call!15853 call!15860)))

(declare-fun b!143244 () Bool)

(declare-fun lt!74981 () tuple2!2708)

(declare-fun call!15856 () tuple2!2708)

(assert (=> b!143244 (= lt!74981 call!15856)))

(assert (=> b!143244 (= e!93355 (tuple2!2709 (_1!1365 lt!74981) (_2!1365 lt!74981)))))

(declare-fun b!143245 () Bool)

(declare-fun e!93362 () Unit!4535)

(declare-fun Unit!4540 () Unit!4535)

(assert (=> b!143245 (= e!93362 Unit!4540)))

(declare-fun lt!74979 () Unit!4535)

(declare-fun call!15851 () Unit!4535)

(assert (=> b!143245 (= lt!74979 call!15851)))

(assert (=> b!143245 (= lt!74991 call!15861)))

(declare-fun c!27096 () Bool)

(assert (=> b!143245 (= c!27096 ((_ is MissingZero!280) lt!74991))))

(assert (=> b!143245 e!93364))

(declare-fun lt!75001 () Unit!4535)

(assert (=> b!143245 (= lt!75001 lt!74979)))

(assert (=> b!143245 false))

(declare-fun b!143246 () Bool)

(declare-fun call!15865 () ListLongMap!1749)

(assert (=> b!143246 (= e!93357 (= call!15864 (+!180 call!15865 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!143247 () Bool)

(declare-fun call!15862 () Bool)

(assert (=> b!143247 (= e!93354 (not call!15862))))

(declare-fun c!27103 () Bool)

(declare-fun lt!74982 () tuple2!2708)

(declare-fun bm!15849 () Bool)

(assert (=> bm!15849 (= call!15865 (map!1445 (ite c!27103 newMap!16 (_2!1365 lt!74982))))))

(declare-fun call!15866 () Bool)

(declare-fun call!15847 () ListLongMap!1749)

(declare-fun c!27100 () Bool)

(declare-fun bm!15850 () Bool)

(assert (=> bm!15850 (= call!15866 (contains!927 call!15847 (ite c!27100 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74998)))))))

(declare-fun bm!15851 () Bool)

(assert (=> bm!15851 (= call!15847 call!15859)))

(declare-fun b!143248 () Bool)

(assert (=> b!143248 (= e!93353 (not call!15862))))

(declare-fun b!143249 () Bool)

(declare-fun res!68254 () Bool)

(assert (=> b!143249 (=> (not res!68254) (not e!93353))))

(assert (=> b!143249 (= res!68254 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3284 lt!74976)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15852 () Bool)

(assert (=> bm!15852 (= call!15854 call!15849)))

(declare-fun b!143250 () Bool)

(declare-fun e!93367 () Bool)

(declare-fun call!15852 () Bool)

(assert (=> b!143250 (= e!93367 (not call!15852))))

(declare-fun b!143251 () Bool)

(declare-fun res!68246 () Bool)

(assert (=> b!143251 (= res!68246 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3287 lt!74991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93356 () Bool)

(assert (=> b!143251 (=> (not res!68246) (not e!93356))))

(declare-fun b!143252 () Bool)

(declare-fun lt!75000 () Unit!4535)

(declare-fun lt!74989 () Unit!4535)

(assert (=> b!143252 (= lt!75000 lt!74989)))

(assert (=> b!143252 call!15866))

(declare-fun lt!74985 () array!4913)

(declare-fun lemmaValidKeyInArrayIsInListMap!127 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 32) Int) Unit!4535)

(assert (=> b!143252 (= lt!74989 (lemmaValidKeyInArrayIsInListMap!127 (_keys!4726 newMap!16) lt!74985 (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (index!3285 lt!74998) (defaultEntry!2963 newMap!16)))))

(assert (=> b!143252 (= lt!74985 (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))))))

(declare-fun lt!74975 () Unit!4535)

(declare-fun lt!74984 () Unit!4535)

(assert (=> b!143252 (= lt!74975 lt!74984)))

(assert (=> b!143252 (= call!15858 (getCurrentListMap!562 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 32) (_ BitVec 64) V!3563 Int) Unit!4535)

(assert (=> b!143252 (= lt!74984 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (index!3285 lt!74998) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2963 newMap!16)))))

(declare-fun lt!74983 () Unit!4535)

(assert (=> b!143252 (= lt!74983 e!93362)))

(declare-fun c!27098 () Bool)

(assert (=> b!143252 (= c!27098 (contains!927 call!15857 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> b!143252 (= e!93355 (tuple2!2709 true (LongMapFixedSize!1159 (defaultEntry!2963 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (_size!628 newMap!16) (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (_vacant!628 newMap!16))))))

(declare-fun b!143253 () Bool)

(declare-fun res!68248 () Bool)

(assert (=> b!143253 (=> (not res!68248) (not e!93367))))

(assert (=> b!143253 (= res!68248 call!15853)))

(assert (=> b!143253 (= e!93364 e!93367)))

(declare-fun b!143254 () Bool)

(declare-fun res!68247 () Bool)

(assert (=> b!143254 (=> (not res!68247) (not e!93367))))

(assert (=> b!143254 (= res!68247 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3284 lt!74991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!15853 () Bool)

(declare-fun call!15863 () Bool)

(assert (=> bm!15853 (= call!15852 call!15863)))

(declare-fun lt!74996 () SeekEntryResult!280)

(declare-fun b!143255 () Bool)

(assert (=> b!143255 (= e!93371 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74996)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun bm!15854 () Bool)

(assert (=> bm!15854 (= call!15863 (arrayContainsKey!0 (_keys!4726 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!15855 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 64) Int) Unit!4535)

(assert (=> bm!15855 (= call!15851 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)))))

(declare-fun b!143256 () Bool)

(declare-fun e!93368 () Unit!4535)

(declare-fun Unit!4541 () Unit!4535)

(assert (=> b!143256 (= e!93368 Unit!4541)))

(declare-fun lt!74992 () Unit!4535)

(declare-fun call!15867 () Unit!4535)

(assert (=> b!143256 (= lt!74992 call!15867)))

(declare-fun call!15868 () SeekEntryResult!280)

(assert (=> b!143256 (= lt!74996 call!15868)))

(declare-fun res!68252 () Bool)

(assert (=> b!143256 (= res!68252 ((_ is Found!280) lt!74996))))

(assert (=> b!143256 (=> (not res!68252) (not e!93371))))

(assert (=> b!143256 e!93371))

(declare-fun lt!74986 () Unit!4535)

(assert (=> b!143256 (= lt!74986 lt!74992)))

(assert (=> b!143256 false))

(declare-fun bm!15856 () Bool)

(assert (=> bm!15856 (= call!15864 (map!1445 (ite c!27103 (_2!1365 lt!74982) newMap!16)))))

(declare-fun bm!15857 () Bool)

(declare-fun updateHelperNewKey!66 (LongMapFixedSize!1158 (_ BitVec 64) V!3563 (_ BitVec 32)) tuple2!2708)

(assert (=> bm!15857 (= call!15856 (updateHelperNewKey!66 newMap!16 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998))))))

(declare-fun bm!15858 () Bool)

(assert (=> bm!15858 (= call!15859 (getCurrentListMap!562 (_keys!4726 newMap!16) (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985) (mask!7315 newMap!16) (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) (zeroValue!2811 newMap!16) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun bm!15859 () Bool)

(declare-fun c!27095 () Bool)

(declare-fun c!27101 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!15859 (= call!15848 (inRange!0 (ite c!27100 (ite c!27095 (index!3285 lt!74996) (ite c!27101 (index!3284 lt!74976) (index!3287 lt!74976))) (ite c!27098 (index!3285 lt!74994) (ite c!27096 (index!3284 lt!74991) (index!3287 lt!74991)))) (mask!7315 newMap!16)))))

(declare-fun b!143257 () Bool)

(declare-fun e!93365 () Bool)

(assert (=> b!143257 (= e!93365 e!93370)))

(assert (=> b!143257 (= c!27103 (_1!1365 lt!74982))))

(declare-fun b!143258 () Bool)

(declare-fun lt!74987 () tuple2!2708)

(assert (=> b!143258 (= e!93369 (tuple2!2709 (_1!1365 lt!74987) (_2!1365 lt!74987)))))

(assert (=> b!143258 (= lt!74987 call!15856)))

(declare-fun b!143259 () Bool)

(assert (=> b!143259 (= e!93356 (not call!15852))))

(declare-fun b!143260 () Bool)

(declare-fun lt!74997 () Unit!4535)

(assert (=> b!143260 (= e!93362 lt!74997)))

(assert (=> b!143260 (= lt!74997 call!15867)))

(assert (=> b!143260 (= lt!74994 call!15861)))

(declare-fun res!68251 () Bool)

(assert (=> b!143260 (= res!68251 ((_ is Found!280) lt!74994))))

(assert (=> b!143260 (=> (not res!68251) (not e!93359))))

(assert (=> b!143260 e!93359))

(declare-fun b!143261 () Bool)

(assert (=> b!143261 (= e!93360 e!93354)))

(declare-fun res!68250 () Bool)

(assert (=> b!143261 (= res!68250 call!15854)))

(assert (=> b!143261 (=> (not res!68250) (not e!93354))))

(declare-fun bm!15860 () Bool)

(assert (=> bm!15860 (= call!15862 call!15863)))

(declare-fun b!143262 () Bool)

(declare-fun lt!74980 () Unit!4535)

(assert (=> b!143262 (= e!93368 lt!74980)))

(assert (=> b!143262 (= lt!74980 call!15851)))

(assert (=> b!143262 (= lt!74976 call!15868)))

(assert (=> b!143262 (= c!27101 ((_ is MissingZero!280) lt!74976))))

(assert (=> b!143262 e!93361))

(declare-fun b!143263 () Bool)

(declare-fun lt!74993 () Unit!4535)

(assert (=> b!143263 (= lt!74993 e!93368)))

(assert (=> b!143263 (= c!27095 call!15866)))

(assert (=> b!143263 (= e!93363 (tuple2!2709 false newMap!16))))

(declare-fun b!143264 () Bool)

(assert (=> b!143264 (= e!93358 e!93363)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4911 (_ BitVec 32)) SeekEntryResult!280)

(assert (=> b!143264 (= lt!74998 (seekEntryOrOpen!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(assert (=> b!143264 (= c!27100 ((_ is Undefined!280) lt!74998))))

(declare-fun bm!15861 () Bool)

(assert (=> bm!15861 (= call!15846 (seekEntryOrOpen!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(declare-fun b!143265 () Bool)

(assert (=> b!143265 (= e!93366 e!93356)))

(declare-fun res!68255 () Bool)

(assert (=> b!143265 (= res!68255 call!15853)))

(assert (=> b!143265 (=> (not res!68255) (not e!93356))))

(declare-fun b!143266 () Bool)

(assert (=> b!143266 (= e!93370 (= call!15865 call!15864))))

(declare-fun bm!15862 () Bool)

(assert (=> bm!15862 (= call!15868 call!15846)))

(declare-fun d!45759 () Bool)

(assert (=> d!45759 e!93365))

(declare-fun res!68242 () Bool)

(assert (=> d!45759 (=> (not res!68242) (not e!93365))))

(assert (=> d!45759 (= res!68242 (valid!559 (_2!1365 lt!74982)))))

(assert (=> d!45759 (= lt!74982 e!93358)))

(assert (=> d!45759 (= c!27104 (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvneg (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))))

(assert (=> d!45759 (valid!559 newMap!16)))

(assert (=> d!45759 (= (update!213 newMap!16 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!74982)))

(declare-fun b!143267 () Bool)

(declare-fun c!27093 () Bool)

(assert (=> b!143267 (= c!27093 ((_ is MissingVacant!280) lt!74976))))

(assert (=> b!143267 (= e!93361 e!93360)))

(declare-fun bm!15863 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 64) Int) Unit!4535)

(assert (=> bm!15863 (= call!15867 (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)))))

(declare-fun bm!15864 () Bool)

(assert (=> bm!15864 (= call!15857 (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun bm!15865 () Bool)

(assert (=> bm!15865 (= call!15849 call!15848)))

(assert (= (and d!45759 c!27104) b!143239))

(assert (= (and d!45759 (not c!27104)) b!143264))

(assert (= (and b!143239 c!27099) b!143233))

(assert (= (and b!143239 (not c!27099)) b!143235))

(assert (= (or b!143233 b!143235) bm!15845))

(assert (= (or b!143233 b!143235) bm!15842))

(assert (= (or b!143233 b!143235) bm!15847))

(assert (= (and b!143264 c!27100) b!143263))

(assert (= (and b!143264 (not c!27100)) b!143231))

(assert (= (and b!143263 c!27095) b!143256))

(assert (= (and b!143263 (not c!27095)) b!143262))

(assert (= (and b!143256 res!68252) b!143236))

(assert (= (and b!143236 res!68245) b!143255))

(assert (= (and b!143262 c!27101) b!143238))

(assert (= (and b!143262 (not c!27101)) b!143267))

(assert (= (and b!143238 res!68249) b!143249))

(assert (= (and b!143249 res!68254) b!143248))

(assert (= (and b!143267 c!27093) b!143261))

(assert (= (and b!143267 (not c!27093)) b!143232))

(assert (= (and b!143261 res!68250) b!143234))

(assert (= (and b!143234 res!68243) b!143247))

(assert (= (or b!143238 b!143261) bm!15852))

(assert (= (or b!143248 b!143247) bm!15860))

(assert (= (or b!143236 bm!15852) bm!15865))

(assert (= (or b!143256 b!143262) bm!15862))

(assert (= (and b!143231 c!27097) b!143258))

(assert (= (and b!143231 (not c!27097)) b!143237))

(assert (= (and b!143237 c!27102) b!143244))

(assert (= (and b!143237 (not c!27102)) b!143252))

(assert (= (and b!143252 c!27098) b!143260))

(assert (= (and b!143252 (not c!27098)) b!143245))

(assert (= (and b!143260 res!68251) b!143240))

(assert (= (and b!143240 res!68244) b!143230))

(assert (= (and b!143245 c!27096) b!143253))

(assert (= (and b!143245 (not c!27096)) b!143243))

(assert (= (and b!143253 res!68248) b!143254))

(assert (= (and b!143254 res!68247) b!143250))

(assert (= (and b!143243 c!27094) b!143265))

(assert (= (and b!143243 (not c!27094)) b!143242))

(assert (= (and b!143265 res!68255) b!143251))

(assert (= (and b!143251 res!68246) b!143259))

(assert (= (or b!143253 b!143265) bm!15848))

(assert (= (or b!143250 b!143259) bm!15853))

(assert (= (or b!143240 bm!15848) bm!15843))

(assert (= (or b!143260 b!143245) bm!15844))

(assert (= (or b!143258 b!143244) bm!15857))

(assert (= (or bm!15860 bm!15853) bm!15854))

(assert (= (or b!143262 b!143245) bm!15855))

(assert (= (or b!143256 b!143260) bm!15863))

(assert (= (or b!143263 b!143252) bm!15851))

(assert (= (or bm!15862 bm!15844) bm!15861))

(assert (= (or bm!15865 bm!15843) bm!15859))

(assert (= (or b!143263 b!143252) bm!15850))

(assert (= (or bm!15845 b!143252) bm!15864))

(assert (= (or bm!15842 bm!15851) bm!15858))

(assert (= (or bm!15847 b!143252) bm!15846))

(assert (= (and d!45759 res!68242) b!143257))

(assert (= (and b!143257 c!27103) b!143241))

(assert (= (and b!143257 (not c!27103)) b!143266))

(assert (= (and b!143241 res!68253) b!143246))

(assert (= (or b!143246 b!143266) bm!15849))

(assert (= (or b!143241 b!143246 b!143266) bm!15856))

(assert (=> bm!15855 m!172675))

(declare-fun m!172785 () Bool)

(assert (=> bm!15855 m!172785))

(declare-fun m!172787 () Bool)

(assert (=> d!45759 m!172787))

(assert (=> d!45759 m!172701))

(declare-fun m!172789 () Bool)

(assert (=> bm!15856 m!172789))

(declare-fun m!172791 () Bool)

(assert (=> b!143251 m!172791))

(assert (=> b!143264 m!172675))

(declare-fun m!172793 () Bool)

(assert (=> b!143264 m!172793))

(declare-fun m!172795 () Bool)

(assert (=> b!143255 m!172795))

(declare-fun m!172797 () Bool)

(assert (=> b!143254 m!172797))

(declare-fun m!172799 () Bool)

(assert (=> b!143252 m!172799))

(assert (=> b!143252 m!172675))

(assert (=> b!143252 m!172685))

(declare-fun m!172801 () Bool)

(assert (=> b!143252 m!172801))

(declare-fun m!172803 () Bool)

(assert (=> b!143252 m!172803))

(assert (=> b!143252 m!172675))

(declare-fun m!172805 () Bool)

(assert (=> b!143252 m!172805))

(declare-fun m!172807 () Bool)

(assert (=> b!143252 m!172807))

(declare-fun m!172809 () Bool)

(assert (=> b!143246 m!172809))

(assert (=> b!143233 m!172685))

(declare-fun m!172811 () Bool)

(assert (=> b!143233 m!172811))

(declare-fun m!172813 () Bool)

(assert (=> bm!15864 m!172813))

(declare-fun m!172815 () Bool)

(assert (=> bm!15849 m!172815))

(declare-fun m!172817 () Bool)

(assert (=> b!143249 m!172817))

(declare-fun m!172819 () Bool)

(assert (=> bm!15846 m!172819))

(assert (=> b!143235 m!172685))

(declare-fun m!172821 () Bool)

(assert (=> b!143235 m!172821))

(declare-fun m!172823 () Bool)

(assert (=> b!143230 m!172823))

(assert (=> bm!15863 m!172675))

(declare-fun m!172825 () Bool)

(assert (=> bm!15863 m!172825))

(assert (=> bm!15854 m!172675))

(declare-fun m!172827 () Bool)

(assert (=> bm!15854 m!172827))

(declare-fun m!172829 () Bool)

(assert (=> bm!15859 m!172829))

(declare-fun m!172831 () Bool)

(assert (=> bm!15858 m!172831))

(assert (=> b!143241 m!172675))

(declare-fun m!172833 () Bool)

(assert (=> b!143241 m!172833))

(assert (=> bm!15861 m!172675))

(assert (=> bm!15861 m!172793))

(declare-fun m!172835 () Bool)

(assert (=> b!143234 m!172835))

(declare-fun m!172837 () Bool)

(assert (=> bm!15850 m!172837))

(declare-fun m!172839 () Bool)

(assert (=> bm!15850 m!172839))

(assert (=> bm!15857 m!172675))

(assert (=> bm!15857 m!172685))

(declare-fun m!172841 () Bool)

(assert (=> bm!15857 m!172841))

(assert (=> b!143044 d!45759))

(declare-fun d!45761 () Bool)

(declare-fun c!27107 () Bool)

(assert (=> d!45761 (= c!27107 ((_ is ValueCellFull!1125) (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun e!93374 () V!3563)

(assert (=> d!45761 (= (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93374)))

(declare-fun b!143272 () Bool)

(declare-fun get!1536 (ValueCell!1125 V!3563) V!3563)

(assert (=> b!143272 (= e!93374 (get!1536 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143273 () Bool)

(declare-fun get!1537 (ValueCell!1125 V!3563) V!3563)

(assert (=> b!143273 (= e!93374 (get!1537 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45761 c!27107) b!143272))

(assert (= (and d!45761 (not c!27107)) b!143273))

(assert (=> b!143272 m!172681))

(assert (=> b!143272 m!172683))

(declare-fun m!172843 () Bool)

(assert (=> b!143272 m!172843))

(assert (=> b!143273 m!172681))

(assert (=> b!143273 m!172683))

(declare-fun m!172845 () Bool)

(assert (=> b!143273 m!172845))

(assert (=> b!143044 d!45761))

(declare-fun d!45763 () Bool)

(assert (=> d!45763 (= (array_inv!1457 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvsge (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143053 d!45763))

(declare-fun d!45765 () Bool)

(assert (=> d!45765 (= (array_inv!1458 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvsge (size!2595 (_values!2946 (v!3297 (underlying!483 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!143053 d!45765))

(declare-fun d!45767 () Bool)

(assert (=> d!45767 (= (valid!560 thiss!992) (valid!559 (v!3297 (underlying!483 thiss!992))))))

(declare-fun bs!6062 () Bool)

(assert (= bs!6062 d!45767))

(declare-fun m!172847 () Bool)

(assert (=> bs!6062 m!172847))

(assert (=> start!14882 d!45767))

(declare-fun d!45769 () Bool)

(assert (=> d!45769 (= (array_inv!1457 (_keys!4726 newMap!16)) (bvsge (size!2594 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143045 d!45769))

(declare-fun d!45771 () Bool)

(assert (=> d!45771 (= (array_inv!1458 (_values!2946 newMap!16)) (bvsge (size!2595 (_values!2946 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143045 d!45771))

(declare-fun d!45773 () Bool)

(assert (=> d!45773 (= (map!1445 newMap!16) (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun bs!6063 () Bool)

(assert (= bs!6063 d!45773))

(declare-fun m!172849 () Bool)

(assert (=> bs!6063 m!172849))

(assert (=> b!143046 d!45773))

(declare-fun bm!15880 () Bool)

(declare-fun call!15886 () ListLongMap!1749)

(declare-fun getCurrentListMapNoExtraKeys!146 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 32) Int) ListLongMap!1749)

(assert (=> bm!15880 (= call!15886 (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun b!143316 () Bool)

(declare-fun e!93411 () ListLongMap!1749)

(declare-fun call!15887 () ListLongMap!1749)

(assert (=> b!143316 (= e!93411 call!15887)))

(declare-fun b!143317 () Bool)

(declare-fun e!93401 () Bool)

(declare-fun e!93403 () Bool)

(assert (=> b!143317 (= e!93401 e!93403)))

(declare-fun c!27124 () Bool)

(assert (=> b!143317 (= c!27124 (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143318 () Bool)

(declare-fun e!93410 () Bool)

(declare-fun e!93404 () Bool)

(assert (=> b!143318 (= e!93410 e!93404)))

(declare-fun res!68280 () Bool)

(assert (=> b!143318 (=> (not res!68280) (not e!93404))))

(declare-fun lt!75064 () ListLongMap!1749)

(assert (=> b!143318 (= res!68280 (contains!927 lt!75064 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143318 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun bm!15881 () Bool)

(declare-fun call!15885 () ListLongMap!1749)

(declare-fun call!15884 () ListLongMap!1749)

(assert (=> bm!15881 (= call!15885 call!15884)))

(declare-fun d!45775 () Bool)

(assert (=> d!45775 e!93401))

(declare-fun res!68275 () Bool)

(assert (=> d!45775 (=> (not res!68275) (not e!93401))))

(assert (=> d!45775 (= res!68275 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))))

(declare-fun lt!75055 () ListLongMap!1749)

(assert (=> d!45775 (= lt!75064 lt!75055)))

(declare-fun lt!75061 () Unit!4535)

(declare-fun e!93409 () Unit!4535)

(assert (=> d!45775 (= lt!75061 e!93409)))

(declare-fun c!27120 () Bool)

(declare-fun e!93407 () Bool)

(assert (=> d!45775 (= c!27120 e!93407)))

(declare-fun res!68282 () Bool)

(assert (=> d!45775 (=> (not res!68282) (not e!93407))))

(assert (=> d!45775 (= res!68282 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun e!93412 () ListLongMap!1749)

(assert (=> d!45775 (= lt!75055 e!93412)))

(declare-fun c!27123 () Bool)

(assert (=> d!45775 (= c!27123 (and (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45775 (validMask!0 (mask!7315 (v!3297 (underlying!483 thiss!992))))))

(assert (=> d!45775 (= (getCurrentListMap!562 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))) lt!75064)))

(declare-fun b!143319 () Bool)

(declare-fun e!93405 () Bool)

(declare-fun call!15889 () Bool)

(assert (=> b!143319 (= e!93405 (not call!15889))))

(declare-fun b!143320 () Bool)

(declare-fun e!93408 () Bool)

(assert (=> b!143320 (= e!93405 e!93408)))

(declare-fun res!68279 () Bool)

(assert (=> b!143320 (= res!68279 call!15889)))

(assert (=> b!143320 (=> (not res!68279) (not e!93408))))

(declare-fun b!143321 () Bool)

(declare-fun e!93402 () ListLongMap!1749)

(assert (=> b!143321 (= e!93402 call!15885)))

(declare-fun b!143322 () Bool)

(declare-fun e!93406 () Bool)

(assert (=> b!143322 (= e!93403 e!93406)))

(declare-fun res!68274 () Bool)

(declare-fun call!15888 () Bool)

(assert (=> b!143322 (= res!68274 call!15888)))

(assert (=> b!143322 (=> (not res!68274) (not e!93406))))

(declare-fun b!143323 () Bool)

(assert (=> b!143323 (= e!93403 (not call!15888))))

(declare-fun b!143324 () Bool)

(declare-fun Unit!4542 () Unit!4535)

(assert (=> b!143324 (= e!93409 Unit!4542)))

(declare-fun bm!15882 () Bool)

(declare-fun call!15883 () ListLongMap!1749)

(assert (=> bm!15882 (= call!15887 call!15883)))

(declare-fun b!143325 () Bool)

(assert (=> b!143325 (= e!93412 e!93402)))

(declare-fun c!27125 () Bool)

(assert (=> b!143325 (= c!27125 (and (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15883 () Bool)

(assert (=> bm!15883 (= call!15884 (+!180 (ite c!27123 call!15886 (ite c!27125 call!15883 call!15887)) (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun b!143326 () Bool)

(declare-fun apply!121 (ListLongMap!1749 (_ BitVec 64)) V!3563)

(assert (=> b!143326 (= e!93408 (= (apply!121 lt!75064 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun bm!15884 () Bool)

(assert (=> bm!15884 (= call!15889 (contains!927 lt!75064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143327 () Bool)

(declare-fun res!68278 () Bool)

(assert (=> b!143327 (=> (not res!68278) (not e!93401))))

(assert (=> b!143327 (= res!68278 e!93410)))

(declare-fun res!68281 () Bool)

(assert (=> b!143327 (=> res!68281 e!93410)))

(declare-fun e!93413 () Bool)

(assert (=> b!143327 (= res!68281 (not e!93413))))

(declare-fun res!68276 () Bool)

(assert (=> b!143327 (=> (not res!68276) (not e!93413))))

(assert (=> b!143327 (= res!68276 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun b!143328 () Bool)

(assert (=> b!143328 (= e!93413 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143329 () Bool)

(declare-fun c!27122 () Bool)

(assert (=> b!143329 (= c!27122 (and (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143329 (= e!93402 e!93411)))

(declare-fun b!143330 () Bool)

(assert (=> b!143330 (= e!93412 (+!180 call!15884 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun b!143331 () Bool)

(assert (=> b!143331 (= e!93406 (= (apply!121 lt!75064 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun b!143332 () Bool)

(assert (=> b!143332 (= e!93407 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143333 () Bool)

(assert (=> b!143333 (= e!93404 (= (apply!121 lt!75064 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143333 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2595 (_values!2946 (v!3297 (underlying!483 thiss!992))))))))

(assert (=> b!143333 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun bm!15885 () Bool)

(assert (=> bm!15885 (= call!15883 call!15886)))

(declare-fun b!143334 () Bool)

(assert (=> b!143334 (= e!93411 call!15885)))

(declare-fun bm!15886 () Bool)

(assert (=> bm!15886 (= call!15888 (contains!927 lt!75064 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143335 () Bool)

(declare-fun lt!75058 () Unit!4535)

(assert (=> b!143335 (= e!93409 lt!75058)))

(declare-fun lt!75052 () ListLongMap!1749)

(assert (=> b!143335 (= lt!75052 (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun lt!75051 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75048 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75048 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75056 () Unit!4535)

(declare-fun addStillContains!97 (ListLongMap!1749 (_ BitVec 64) V!3563 (_ BitVec 64)) Unit!4535)

(assert (=> b!143335 (= lt!75056 (addStillContains!97 lt!75052 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75048))))

(assert (=> b!143335 (contains!927 (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75048)))

(declare-fun lt!75057 () Unit!4535)

(assert (=> b!143335 (= lt!75057 lt!75056)))

(declare-fun lt!75065 () ListLongMap!1749)

(assert (=> b!143335 (= lt!75065 (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun lt!75062 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75062 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75050 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75050 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75063 () Unit!4535)

(declare-fun addApplyDifferent!97 (ListLongMap!1749 (_ BitVec 64) V!3563 (_ BitVec 64)) Unit!4535)

(assert (=> b!143335 (= lt!75063 (addApplyDifferent!97 lt!75065 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75050))))

(assert (=> b!143335 (= (apply!121 (+!180 lt!75065 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75050) (apply!121 lt!75065 lt!75050))))

(declare-fun lt!75047 () Unit!4535)

(assert (=> b!143335 (= lt!75047 lt!75063)))

(declare-fun lt!75066 () ListLongMap!1749)

(assert (=> b!143335 (= lt!75066 (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun lt!75046 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75049 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75049 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!75053 () Unit!4535)

(assert (=> b!143335 (= lt!75053 (addApplyDifferent!97 lt!75066 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75049))))

(assert (=> b!143335 (= (apply!121 (+!180 lt!75066 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75049) (apply!121 lt!75066 lt!75049))))

(declare-fun lt!75060 () Unit!4535)

(assert (=> b!143335 (= lt!75060 lt!75053)))

(declare-fun lt!75059 () ListLongMap!1749)

(assert (=> b!143335 (= lt!75059 (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun lt!75054 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75054 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75067 () (_ BitVec 64))

(assert (=> b!143335 (= lt!75067 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!143335 (= lt!75058 (addApplyDifferent!97 lt!75059 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75067))))

(assert (=> b!143335 (= (apply!121 (+!180 lt!75059 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75067) (apply!121 lt!75059 lt!75067))))

(declare-fun b!143336 () Bool)

(declare-fun res!68277 () Bool)

(assert (=> b!143336 (=> (not res!68277) (not e!93401))))

(assert (=> b!143336 (= res!68277 e!93405)))

(declare-fun c!27121 () Bool)

(assert (=> b!143336 (= c!27121 (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!45775 c!27123) b!143330))

(assert (= (and d!45775 (not c!27123)) b!143325))

(assert (= (and b!143325 c!27125) b!143321))

(assert (= (and b!143325 (not c!27125)) b!143329))

(assert (= (and b!143329 c!27122) b!143334))

(assert (= (and b!143329 (not c!27122)) b!143316))

(assert (= (or b!143334 b!143316) bm!15882))

(assert (= (or b!143321 bm!15882) bm!15885))

(assert (= (or b!143321 b!143334) bm!15881))

(assert (= (or b!143330 bm!15885) bm!15880))

(assert (= (or b!143330 bm!15881) bm!15883))

(assert (= (and d!45775 res!68282) b!143332))

(assert (= (and d!45775 c!27120) b!143335))

(assert (= (and d!45775 (not c!27120)) b!143324))

(assert (= (and d!45775 res!68275) b!143327))

(assert (= (and b!143327 res!68276) b!143328))

(assert (= (and b!143327 (not res!68281)) b!143318))

(assert (= (and b!143318 res!68280) b!143333))

(assert (= (and b!143327 res!68278) b!143336))

(assert (= (and b!143336 c!27121) b!143320))

(assert (= (and b!143336 (not c!27121)) b!143319))

(assert (= (and b!143320 res!68279) b!143326))

(assert (= (or b!143320 b!143319) bm!15884))

(assert (= (and b!143336 res!68277) b!143317))

(assert (= (and b!143317 c!27124) b!143322))

(assert (= (and b!143317 (not c!27124)) b!143323))

(assert (= (and b!143322 res!68274) b!143331))

(assert (= (or b!143322 b!143323) bm!15886))

(declare-fun b_lambda!6427 () Bool)

(assert (=> (not b_lambda!6427) (not b!143333)))

(assert (=> b!143333 t!6359))

(declare-fun b_and!8931 () Bool)

(assert (= b_and!8919 (and (=> t!6359 result!4213) b_and!8931)))

(assert (=> b!143333 t!6361))

(declare-fun b_and!8933 () Bool)

(assert (= b_and!8921 (and (=> t!6361 result!4217) b_and!8933)))

(assert (=> d!45775 m!172775))

(declare-fun m!172851 () Bool)

(assert (=> bm!15883 m!172851))

(declare-fun m!172853 () Bool)

(assert (=> b!143330 m!172853))

(declare-fun m!172855 () Bool)

(assert (=> bm!15880 m!172855))

(declare-fun m!172857 () Bool)

(assert (=> b!143335 m!172857))

(declare-fun m!172859 () Bool)

(assert (=> b!143335 m!172859))

(declare-fun m!172861 () Bool)

(assert (=> b!143335 m!172861))

(declare-fun m!172863 () Bool)

(assert (=> b!143335 m!172863))

(assert (=> b!143335 m!172863))

(declare-fun m!172865 () Bool)

(assert (=> b!143335 m!172865))

(declare-fun m!172867 () Bool)

(assert (=> b!143335 m!172867))

(declare-fun m!172869 () Bool)

(assert (=> b!143335 m!172869))

(assert (=> b!143335 m!172769))

(declare-fun m!172871 () Bool)

(assert (=> b!143335 m!172871))

(declare-fun m!172873 () Bool)

(assert (=> b!143335 m!172873))

(assert (=> b!143335 m!172859))

(declare-fun m!172875 () Bool)

(assert (=> b!143335 m!172875))

(assert (=> b!143335 m!172855))

(declare-fun m!172877 () Bool)

(assert (=> b!143335 m!172877))

(declare-fun m!172879 () Bool)

(assert (=> b!143335 m!172879))

(declare-fun m!172881 () Bool)

(assert (=> b!143335 m!172881))

(assert (=> b!143335 m!172857))

(declare-fun m!172883 () Bool)

(assert (=> b!143335 m!172883))

(declare-fun m!172885 () Bool)

(assert (=> b!143335 m!172885))

(assert (=> b!143335 m!172879))

(declare-fun m!172887 () Bool)

(assert (=> b!143326 m!172887))

(declare-fun m!172889 () Bool)

(assert (=> b!143331 m!172889))

(assert (=> b!143318 m!172769))

(assert (=> b!143318 m!172769))

(declare-fun m!172891 () Bool)

(assert (=> b!143318 m!172891))

(declare-fun m!172893 () Bool)

(assert (=> bm!15884 m!172893))

(assert (=> b!143333 m!172769))

(declare-fun m!172895 () Bool)

(assert (=> b!143333 m!172895))

(declare-fun m!172897 () Bool)

(assert (=> b!143333 m!172897))

(assert (=> b!143333 m!172683))

(declare-fun m!172899 () Bool)

(assert (=> b!143333 m!172899))

(assert (=> b!143333 m!172683))

(assert (=> b!143333 m!172769))

(assert (=> b!143333 m!172897))

(assert (=> b!143328 m!172769))

(assert (=> b!143328 m!172769))

(declare-fun m!172901 () Bool)

(assert (=> b!143328 m!172901))

(assert (=> b!143332 m!172769))

(assert (=> b!143332 m!172769))

(assert (=> b!143332 m!172901))

(declare-fun m!172903 () Bool)

(assert (=> bm!15886 m!172903))

(assert (=> b!143046 d!45775))

(declare-fun d!45777 () Bool)

(declare-fun res!68287 () Bool)

(declare-fun e!93418 () Bool)

(assert (=> d!45777 (=> res!68287 e!93418)))

(assert (=> d!45777 (= res!68287 ((_ is Nil!1746) (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746)))))

(assert (=> d!45777 (= (noDuplicate!51 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746)) e!93418)))

(declare-fun b!143341 () Bool)

(declare-fun e!93419 () Bool)

(assert (=> b!143341 (= e!93418 e!93419)))

(declare-fun res!68288 () Bool)

(assert (=> b!143341 (=> (not res!68288) (not e!93419))))

(assert (=> b!143341 (= res!68288 (not (contains!928 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746)) (h!2353 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746)))))))

(declare-fun b!143342 () Bool)

(assert (=> b!143342 (= e!93419 (noDuplicate!51 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))))))

(assert (= (and d!45777 (not res!68287)) b!143341))

(assert (= (and b!143341 res!68288) b!143342))

(declare-fun m!172905 () Bool)

(assert (=> b!143341 m!172905))

(declare-fun m!172907 () Bool)

(assert (=> b!143342 m!172907))

(assert (=> b!143042 d!45777))

(declare-fun b!143349 () Bool)

(declare-fun e!93425 () Bool)

(assert (=> b!143349 (= e!93425 tp_is_empty!2937)))

(declare-fun mapIsEmpty!4871 () Bool)

(declare-fun mapRes!4871 () Bool)

(assert (=> mapIsEmpty!4871 mapRes!4871))

(declare-fun mapNonEmpty!4871 () Bool)

(declare-fun tp!11621 () Bool)

(assert (=> mapNonEmpty!4871 (= mapRes!4871 (and tp!11621 e!93425))))

(declare-fun mapKey!4871 () (_ BitVec 32))

(declare-fun mapValue!4871 () ValueCell!1125)

(declare-fun mapRest!4871 () (Array (_ BitVec 32) ValueCell!1125))

(assert (=> mapNonEmpty!4871 (= mapRest!4861 (store mapRest!4871 mapKey!4871 mapValue!4871))))

(declare-fun b!143350 () Bool)

(declare-fun e!93424 () Bool)

(assert (=> b!143350 (= e!93424 tp_is_empty!2937)))

(declare-fun condMapEmpty!4871 () Bool)

(declare-fun mapDefault!4871 () ValueCell!1125)

(assert (=> mapNonEmpty!4861 (= condMapEmpty!4871 (= mapRest!4861 ((as const (Array (_ BitVec 32) ValueCell!1125)) mapDefault!4871)))))

(assert (=> mapNonEmpty!4861 (= tp!11605 (and e!93424 mapRes!4871))))

(assert (= (and mapNonEmpty!4861 condMapEmpty!4871) mapIsEmpty!4871))

(assert (= (and mapNonEmpty!4861 (not condMapEmpty!4871)) mapNonEmpty!4871))

(assert (= (and mapNonEmpty!4871 ((_ is ValueCellFull!1125) mapValue!4871)) b!143349))

(assert (= (and mapNonEmpty!4861 ((_ is ValueCellFull!1125) mapDefault!4871)) b!143350))

(declare-fun m!172909 () Bool)

(assert (=> mapNonEmpty!4871 m!172909))

(declare-fun b!143351 () Bool)

(declare-fun e!93427 () Bool)

(assert (=> b!143351 (= e!93427 tp_is_empty!2937)))

(declare-fun mapIsEmpty!4872 () Bool)

(declare-fun mapRes!4872 () Bool)

(assert (=> mapIsEmpty!4872 mapRes!4872))

(declare-fun mapNonEmpty!4872 () Bool)

(declare-fun tp!11622 () Bool)

(assert (=> mapNonEmpty!4872 (= mapRes!4872 (and tp!11622 e!93427))))

(declare-fun mapRest!4872 () (Array (_ BitVec 32) ValueCell!1125))

(declare-fun mapKey!4872 () (_ BitVec 32))

(declare-fun mapValue!4872 () ValueCell!1125)

(assert (=> mapNonEmpty!4872 (= mapRest!4862 (store mapRest!4872 mapKey!4872 mapValue!4872))))

(declare-fun b!143352 () Bool)

(declare-fun e!93426 () Bool)

(assert (=> b!143352 (= e!93426 tp_is_empty!2937)))

(declare-fun condMapEmpty!4872 () Bool)

(declare-fun mapDefault!4872 () ValueCell!1125)

(assert (=> mapNonEmpty!4862 (= condMapEmpty!4872 (= mapRest!4862 ((as const (Array (_ BitVec 32) ValueCell!1125)) mapDefault!4872)))))

(assert (=> mapNonEmpty!4862 (= tp!11603 (and e!93426 mapRes!4872))))

(assert (= (and mapNonEmpty!4862 condMapEmpty!4872) mapIsEmpty!4872))

(assert (= (and mapNonEmpty!4862 (not condMapEmpty!4872)) mapNonEmpty!4872))

(assert (= (and mapNonEmpty!4872 ((_ is ValueCellFull!1125) mapValue!4872)) b!143351))

(assert (= (and mapNonEmpty!4862 ((_ is ValueCellFull!1125) mapDefault!4872)) b!143352))

(declare-fun m!172911 () Bool)

(assert (=> mapNonEmpty!4872 m!172911))

(declare-fun b_lambda!6429 () Bool)

(assert (= b_lambda!6427 (or (and b!143053 b_free!3041) (and b!143045 b_free!3043 (= (defaultEntry!2963 newMap!16) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))))) b_lambda!6429)))

(check-sat (not b!143332) (not d!45755) (not b!143151) (not b!143138) (not bm!15886) (not b!143116) (not d!45747) (not b!143318) (not d!45775) b_and!8931 (not b!143233) (not b!143131) (not b!143335) tp_is_empty!2937 (not d!45773) (not d!45759) (not b_next!3043) (not b!143341) (not bm!15855) (not b_next!3041) (not b!143328) (not bm!15863) (not b!143129) (not d!45757) (not bm!15861) (not b!143252) (not bm!15880) (not bm!15883) (not mapNonEmpty!4871) (not b!143241) (not bm!15793) (not d!45767) (not bm!15858) (not b_lambda!6429) (not bm!15864) (not b!143333) (not b!143115) (not b!143117) (not bm!15884) b_and!8933 (not b!143143) (not b!143235) (not b!143326) (not b!143264) (not b!143331) (not d!45751) (not bm!15859) (not bm!15857) (not b!143153) (not b!143330) (not mapNonEmpty!4872) (not b!143132) (not b!143342) (not b!143246) (not bm!15849) (not bm!15850) (not bm!15846) (not b!143273) (not b!143272) (not bm!15856) (not b_lambda!6425) (not bm!15854))
(check-sat b_and!8931 b_and!8933 (not b_next!3041) (not b_next!3043))
(get-model)

(declare-fun d!45779 () Bool)

(declare-fun lt!75070 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!139 (List!1749) (InoxSet (_ BitVec 64)))

(assert (=> d!45779 (= lt!75070 (select (content!139 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))) (h!2353 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))))))

(declare-fun e!93432 () Bool)

(assert (=> d!45779 (= lt!75070 e!93432)))

(declare-fun res!68293 () Bool)

(assert (=> d!45779 (=> (not res!68293) (not e!93432))))

(assert (=> d!45779 (= res!68293 ((_ is Cons!1745) (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))))))

(assert (=> d!45779 (= (contains!928 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746)) (h!2353 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))) lt!75070)))

(declare-fun b!143357 () Bool)

(declare-fun e!93433 () Bool)

(assert (=> b!143357 (= e!93432 e!93433)))

(declare-fun res!68294 () Bool)

(assert (=> b!143357 (=> res!68294 e!93433)))

(assert (=> b!143357 (= res!68294 (= (h!2353 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))) (h!2353 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))))))

(declare-fun b!143358 () Bool)

(assert (=> b!143358 (= e!93433 (contains!928 (t!6362 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))) (h!2353 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))))))

(assert (= (and d!45779 res!68293) b!143357))

(assert (= (and b!143357 (not res!68294)) b!143358))

(declare-fun m!172913 () Bool)

(assert (=> d!45779 m!172913))

(declare-fun m!172915 () Bool)

(assert (=> d!45779 m!172915))

(declare-fun m!172917 () Bool)

(assert (=> b!143358 m!172917))

(assert (=> b!143341 d!45779))

(declare-fun d!45781 () Bool)

(assert (=> d!45781 (= (get!1536 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3296 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> b!143272 d!45781))

(declare-fun b!143371 () Bool)

(declare-fun e!93441 () SeekEntryResult!280)

(declare-fun e!93442 () SeekEntryResult!280)

(assert (=> b!143371 (= e!93441 e!93442)))

(declare-fun lt!75079 () (_ BitVec 64))

(declare-fun lt!75078 () SeekEntryResult!280)

(assert (=> b!143371 (= lt!75079 (select (arr!2321 (_keys!4726 newMap!16)) (index!3286 lt!75078)))))

(declare-fun c!27133 () Bool)

(assert (=> b!143371 (= c!27133 (= lt!75079 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143372 () Bool)

(assert (=> b!143372 (= e!93441 Undefined!280)))

(declare-fun b!143373 () Bool)

(declare-fun c!27134 () Bool)

(assert (=> b!143373 (= c!27134 (= lt!75079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93440 () SeekEntryResult!280)

(assert (=> b!143373 (= e!93442 e!93440)))

(declare-fun b!143374 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4911 (_ BitVec 32)) SeekEntryResult!280)

(assert (=> b!143374 (= e!93440 (seekKeyOrZeroReturnVacant!0 (x!16334 lt!75078) (index!3286 lt!75078) (index!3286 lt!75078) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(declare-fun d!45783 () Bool)

(declare-fun lt!75077 () SeekEntryResult!280)

(assert (=> d!45783 (and (or ((_ is Undefined!280) lt!75077) (not ((_ is Found!280) lt!75077)) (and (bvsge (index!3285 lt!75077) #b00000000000000000000000000000000) (bvslt (index!3285 lt!75077) (size!2594 (_keys!4726 newMap!16))))) (or ((_ is Undefined!280) lt!75077) ((_ is Found!280) lt!75077) (not ((_ is MissingZero!280) lt!75077)) (and (bvsge (index!3284 lt!75077) #b00000000000000000000000000000000) (bvslt (index!3284 lt!75077) (size!2594 (_keys!4726 newMap!16))))) (or ((_ is Undefined!280) lt!75077) ((_ is Found!280) lt!75077) ((_ is MissingZero!280) lt!75077) (not ((_ is MissingVacant!280) lt!75077)) (and (bvsge (index!3287 lt!75077) #b00000000000000000000000000000000) (bvslt (index!3287 lt!75077) (size!2594 (_keys!4726 newMap!16))))) (or ((_ is Undefined!280) lt!75077) (ite ((_ is Found!280) lt!75077) (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!75077)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (ite ((_ is MissingZero!280) lt!75077) (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3284 lt!75077)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!280) lt!75077) (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3287 lt!75077)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45783 (= lt!75077 e!93441)))

(declare-fun c!27132 () Bool)

(assert (=> d!45783 (= c!27132 (and ((_ is Intermediate!280) lt!75078) (undefined!1092 lt!75078)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4911 (_ BitVec 32)) SeekEntryResult!280)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!45783 (= lt!75078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (mask!7315 newMap!16)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(assert (=> d!45783 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45783 (= (seekEntryOrOpen!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)) lt!75077)))

(declare-fun b!143375 () Bool)

(assert (=> b!143375 (= e!93442 (Found!280 (index!3286 lt!75078)))))

(declare-fun b!143376 () Bool)

(assert (=> b!143376 (= e!93440 (MissingZero!280 (index!3286 lt!75078)))))

(assert (= (and d!45783 c!27132) b!143372))

(assert (= (and d!45783 (not c!27132)) b!143371))

(assert (= (and b!143371 c!27133) b!143375))

(assert (= (and b!143371 (not c!27133)) b!143373))

(assert (= (and b!143373 c!27134) b!143376))

(assert (= (and b!143373 (not c!27134)) b!143374))

(declare-fun m!172919 () Bool)

(assert (=> b!143371 m!172919))

(assert (=> b!143374 m!172675))

(declare-fun m!172921 () Bool)

(assert (=> b!143374 m!172921))

(declare-fun m!172923 () Bool)

(assert (=> d!45783 m!172923))

(assert (=> d!45783 m!172675))

(declare-fun m!172925 () Bool)

(assert (=> d!45783 m!172925))

(assert (=> d!45783 m!172675))

(assert (=> d!45783 m!172923))

(declare-fun m!172927 () Bool)

(assert (=> d!45783 m!172927))

(declare-fun m!172929 () Bool)

(assert (=> d!45783 m!172929))

(declare-fun m!172931 () Bool)

(assert (=> d!45783 m!172931))

(declare-fun m!172933 () Bool)

(assert (=> d!45783 m!172933))

(assert (=> bm!15861 d!45783))

(declare-fun b!143385 () Bool)

(declare-fun e!93451 () Bool)

(declare-fun call!15892 () Bool)

(assert (=> b!143385 (= e!93451 call!15892)))

(declare-fun b!143386 () Bool)

(declare-fun e!93450 () Bool)

(assert (=> b!143386 (= e!93450 e!93451)))

(declare-fun lt!75088 () (_ BitVec 64))

(assert (=> b!143386 (= lt!75088 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75086 () Unit!4535)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4911 (_ BitVec 64) (_ BitVec 32)) Unit!4535)

(assert (=> b!143386 (= lt!75086 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4726 newMap!16) lt!75088 #b00000000000000000000000000000000))))

(assert (=> b!143386 (arrayContainsKey!0 (_keys!4726 newMap!16) lt!75088 #b00000000000000000000000000000000)))

(declare-fun lt!75087 () Unit!4535)

(assert (=> b!143386 (= lt!75087 lt!75086)))

(declare-fun res!68300 () Bool)

(assert (=> b!143386 (= res!68300 (= (seekEntryOrOpen!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000) (_keys!4726 newMap!16) (mask!7315 newMap!16)) (Found!280 #b00000000000000000000000000000000)))))

(assert (=> b!143386 (=> (not res!68300) (not e!93451))))

(declare-fun d!45785 () Bool)

(declare-fun res!68299 () Bool)

(declare-fun e!93449 () Bool)

(assert (=> d!45785 (=> res!68299 e!93449)))

(assert (=> d!45785 (= res!68299 (bvsge #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(assert (=> d!45785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4726 newMap!16) (mask!7315 newMap!16)) e!93449)))

(declare-fun b!143387 () Bool)

(assert (=> b!143387 (= e!93450 call!15892)))

(declare-fun b!143388 () Bool)

(assert (=> b!143388 (= e!93449 e!93450)))

(declare-fun c!27137 () Bool)

(assert (=> b!143388 (= c!27137 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!15889 () Bool)

(assert (=> bm!15889 (= call!15892 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(assert (= (and d!45785 (not res!68299)) b!143388))

(assert (= (and b!143388 c!27137) b!143386))

(assert (= (and b!143388 (not c!27137)) b!143387))

(assert (= (and b!143386 res!68300) b!143385))

(assert (= (or b!143385 b!143387) bm!15889))

(declare-fun m!172935 () Bool)

(assert (=> b!143386 m!172935))

(declare-fun m!172937 () Bool)

(assert (=> b!143386 m!172937))

(declare-fun m!172939 () Bool)

(assert (=> b!143386 m!172939))

(assert (=> b!143386 m!172935))

(declare-fun m!172941 () Bool)

(assert (=> b!143386 m!172941))

(assert (=> b!143388 m!172935))

(assert (=> b!143388 m!172935))

(declare-fun m!172943 () Bool)

(assert (=> b!143388 m!172943))

(declare-fun m!172945 () Bool)

(assert (=> bm!15889 m!172945))

(assert (=> b!143116 d!45785))

(declare-fun d!45787 () Bool)

(declare-fun e!93453 () Bool)

(assert (=> d!45787 e!93453))

(declare-fun res!68301 () Bool)

(assert (=> d!45787 (=> res!68301 e!93453)))

(declare-fun lt!75090 () Bool)

(assert (=> d!45787 (= res!68301 (not lt!75090))))

(declare-fun lt!75091 () Bool)

(assert (=> d!45787 (= lt!75090 lt!75091)))

(declare-fun lt!75092 () Unit!4535)

(declare-fun e!93452 () Unit!4535)

(assert (=> d!45787 (= lt!75092 e!93452)))

(declare-fun c!27138 () Bool)

(assert (=> d!45787 (= c!27138 lt!75091)))

(assert (=> d!45787 (= lt!75091 (containsKey!181 (toList!890 lt!75064) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45787 (= (contains!927 lt!75064 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75090)))

(declare-fun b!143389 () Bool)

(declare-fun lt!75089 () Unit!4535)

(assert (=> b!143389 (= e!93452 lt!75089)))

(assert (=> b!143389 (= lt!75089 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 lt!75064) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143389 (isDefined!130 (getValueByKey!177 (toList!890 lt!75064) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143390 () Bool)

(declare-fun Unit!4543 () Unit!4535)

(assert (=> b!143390 (= e!93452 Unit!4543)))

(declare-fun b!143391 () Bool)

(assert (=> b!143391 (= e!93453 (isDefined!130 (getValueByKey!177 (toList!890 lt!75064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45787 c!27138) b!143389))

(assert (= (and d!45787 (not c!27138)) b!143390))

(assert (= (and d!45787 (not res!68301)) b!143391))

(declare-fun m!172947 () Bool)

(assert (=> d!45787 m!172947))

(declare-fun m!172949 () Bool)

(assert (=> b!143389 m!172949))

(declare-fun m!172951 () Bool)

(assert (=> b!143389 m!172951))

(assert (=> b!143389 m!172951))

(declare-fun m!172953 () Bool)

(assert (=> b!143389 m!172953))

(assert (=> b!143391 m!172951))

(assert (=> b!143391 m!172951))

(assert (=> b!143391 m!172953))

(assert (=> bm!15886 d!45787))

(declare-fun d!45789 () Bool)

(declare-fun e!93456 () Bool)

(assert (=> d!45789 e!93456))

(declare-fun res!68306 () Bool)

(assert (=> d!45789 (=> (not res!68306) (not e!93456))))

(declare-fun lt!75104 () ListLongMap!1749)

(assert (=> d!45789 (= res!68306 (contains!927 lt!75104 (_1!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun lt!75103 () List!1750)

(assert (=> d!45789 (= lt!75104 (ListLongMap!1750 lt!75103))))

(declare-fun lt!75101 () Unit!4535)

(declare-fun lt!75102 () Unit!4535)

(assert (=> d!45789 (= lt!75101 lt!75102)))

(assert (=> d!45789 (= (getValueByKey!177 lt!75103 (_1!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!91 (List!1750 (_ BitVec 64) V!3563) Unit!4535)

(assert (=> d!45789 (= lt!75102 (lemmaContainsTupThenGetReturnValue!91 lt!75103 (_1!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun insertStrictlySorted!94 (List!1750 (_ BitVec 64) V!3563) List!1750)

(assert (=> d!45789 (= lt!75103 (insertStrictlySorted!94 (toList!890 call!15884) (_1!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45789 (= (+!180 call!15884 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75104)))

(declare-fun b!143396 () Bool)

(declare-fun res!68307 () Bool)

(assert (=> b!143396 (=> (not res!68307) (not e!93456))))

(assert (=> b!143396 (= res!68307 (= (getValueByKey!177 (toList!890 lt!75104) (_1!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(declare-fun b!143397 () Bool)

(declare-fun contains!929 (List!1750 tuple2!2706) Bool)

(assert (=> b!143397 (= e!93456 (contains!929 (toList!890 lt!75104) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))

(assert (= (and d!45789 res!68306) b!143396))

(assert (= (and b!143396 res!68307) b!143397))

(declare-fun m!172955 () Bool)

(assert (=> d!45789 m!172955))

(declare-fun m!172957 () Bool)

(assert (=> d!45789 m!172957))

(declare-fun m!172959 () Bool)

(assert (=> d!45789 m!172959))

(declare-fun m!172961 () Bool)

(assert (=> d!45789 m!172961))

(declare-fun m!172963 () Bool)

(assert (=> b!143396 m!172963))

(declare-fun m!172965 () Bool)

(assert (=> b!143397 m!172965))

(assert (=> b!143330 d!45789))

(declare-fun d!45791 () Bool)

(assert (=> d!45791 (= (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (and (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143132 d!45791))

(declare-fun d!45793 () Bool)

(declare-fun e!93457 () Bool)

(assert (=> d!45793 e!93457))

(declare-fun res!68308 () Bool)

(assert (=> d!45793 (=> (not res!68308) (not e!93457))))

(declare-fun lt!75108 () ListLongMap!1749)

(assert (=> d!45793 (= res!68308 (contains!927 lt!75108 (_1!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!75107 () List!1750)

(assert (=> d!45793 (= lt!75108 (ListLongMap!1750 lt!75107))))

(declare-fun lt!75105 () Unit!4535)

(declare-fun lt!75106 () Unit!4535)

(assert (=> d!45793 (= lt!75105 lt!75106)))

(assert (=> d!45793 (= (getValueByKey!177 lt!75107 (_1!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!182 (_2!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45793 (= lt!75106 (lemmaContainsTupThenGetReturnValue!91 lt!75107 (_1!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45793 (= lt!75107 (insertStrictlySorted!94 (toList!890 call!15865) (_1!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!45793 (= (+!180 call!15865 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!75108)))

(declare-fun b!143398 () Bool)

(declare-fun res!68309 () Bool)

(assert (=> b!143398 (=> (not res!68309) (not e!93457))))

(assert (=> b!143398 (= res!68309 (= (getValueByKey!177 (toList!890 lt!75108) (_1!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!182 (_2!1364 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!143399 () Bool)

(assert (=> b!143399 (= e!93457 (contains!929 (toList!890 lt!75108) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!45793 res!68308) b!143398))

(assert (= (and b!143398 res!68309) b!143399))

(declare-fun m!172967 () Bool)

(assert (=> d!45793 m!172967))

(declare-fun m!172969 () Bool)

(assert (=> d!45793 m!172969))

(declare-fun m!172971 () Bool)

(assert (=> d!45793 m!172971))

(declare-fun m!172973 () Bool)

(assert (=> d!45793 m!172973))

(declare-fun m!172975 () Bool)

(assert (=> b!143398 m!172975))

(declare-fun m!172977 () Bool)

(assert (=> b!143399 m!172977))

(assert (=> b!143246 d!45793))

(declare-fun d!45795 () Bool)

(assert (=> d!45795 (= (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143328 d!45795))

(declare-fun d!45797 () Bool)

(assert (=> d!45797 (= (inRange!0 (ite c!27100 (ite c!27095 (index!3285 lt!74996) (ite c!27101 (index!3284 lt!74976) (index!3287 lt!74976))) (ite c!27098 (index!3285 lt!74994) (ite c!27096 (index!3284 lt!74991) (index!3287 lt!74991)))) (mask!7315 newMap!16)) (and (bvsge (ite c!27100 (ite c!27095 (index!3285 lt!74996) (ite c!27101 (index!3284 lt!74976) (index!3287 lt!74976))) (ite c!27098 (index!3285 lt!74994) (ite c!27096 (index!3284 lt!74991) (index!3287 lt!74991)))) #b00000000000000000000000000000000) (bvslt (ite c!27100 (ite c!27095 (index!3285 lt!74996) (ite c!27101 (index!3284 lt!74976) (index!3287 lt!74976))) (ite c!27098 (index!3285 lt!74994) (ite c!27096 (index!3284 lt!74991) (index!3287 lt!74991)))) (bvadd (mask!7315 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!15859 d!45797))

(declare-fun d!45799 () Bool)

(declare-fun res!68310 () Bool)

(declare-fun e!93458 () Bool)

(assert (=> d!45799 (=> res!68310 e!93458)))

(assert (=> d!45799 (= res!68310 (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> d!45799 (= (arrayContainsKey!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!93458)))

(declare-fun b!143400 () Bool)

(declare-fun e!93459 () Bool)

(assert (=> b!143400 (= e!93458 e!93459)))

(declare-fun res!68311 () Bool)

(assert (=> b!143400 (=> (not res!68311) (not e!93459))))

(assert (=> b!143400 (= res!68311 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun b!143401 () Bool)

(assert (=> b!143401 (= e!93459 (arrayContainsKey!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!45799 (not res!68310)) b!143400))

(assert (= (and b!143400 res!68311) b!143401))

(declare-fun m!172979 () Bool)

(assert (=> d!45799 m!172979))

(assert (=> b!143401 m!172675))

(declare-fun m!172981 () Bool)

(assert (=> b!143401 m!172981))

(assert (=> b!143138 d!45799))

(declare-fun b!143410 () Bool)

(declare-fun res!68321 () Bool)

(declare-fun e!93462 () Bool)

(assert (=> b!143410 (=> (not res!68321) (not e!93462))))

(assert (=> b!143410 (= res!68321 (and (= (size!2595 (_values!2946 newMap!16)) (bvadd (mask!7315 newMap!16) #b00000000000000000000000000000001)) (= (size!2594 (_keys!4726 newMap!16)) (size!2595 (_values!2946 newMap!16))) (bvsge (_size!628 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!628 newMap!16) (bvadd (mask!7315 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!45801 () Bool)

(declare-fun res!68323 () Bool)

(assert (=> d!45801 (=> (not res!68323) (not e!93462))))

(assert (=> d!45801 (= res!68323 (validMask!0 (mask!7315 newMap!16)))))

(assert (=> d!45801 (= (simpleValid!97 newMap!16) e!93462)))

(declare-fun b!143413 () Bool)

(assert (=> b!143413 (= e!93462 (and (bvsge (extraKeys!2714 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2714 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!628 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!143412 () Bool)

(declare-fun res!68320 () Bool)

(assert (=> b!143412 (=> (not res!68320) (not e!93462))))

(declare-fun size!2598 (LongMapFixedSize!1158) (_ BitVec 32))

(assert (=> b!143412 (= res!68320 (= (size!2598 newMap!16) (bvadd (_size!628 newMap!16) (bvsdiv (bvadd (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!143411 () Bool)

(declare-fun res!68322 () Bool)

(assert (=> b!143411 (=> (not res!68322) (not e!93462))))

(assert (=> b!143411 (= res!68322 (bvsge (size!2598 newMap!16) (_size!628 newMap!16)))))

(assert (= (and d!45801 res!68323) b!143410))

(assert (= (and b!143410 res!68321) b!143411))

(assert (= (and b!143411 res!68322) b!143412))

(assert (= (and b!143412 res!68320) b!143413))

(assert (=> d!45801 m!172933))

(declare-fun m!172983 () Bool)

(assert (=> b!143412 m!172983))

(assert (=> b!143411 m!172983))

(assert (=> d!45747 d!45801))

(declare-fun d!45803 () Bool)

(declare-fun res!68328 () Bool)

(declare-fun e!93467 () Bool)

(assert (=> d!45803 (=> res!68328 e!93467)))

(assert (=> d!45803 (= res!68328 (and ((_ is Cons!1746) (toList!890 lt!74887)) (= (_1!1364 (h!2354 (toList!890 lt!74887))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))))

(assert (=> d!45803 (= (containsKey!181 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) e!93467)))

(declare-fun b!143418 () Bool)

(declare-fun e!93468 () Bool)

(assert (=> b!143418 (= e!93467 e!93468)))

(declare-fun res!68329 () Bool)

(assert (=> b!143418 (=> (not res!68329) (not e!93468))))

(assert (=> b!143418 (= res!68329 (and (or (not ((_ is Cons!1746) (toList!890 lt!74887))) (bvsle (_1!1364 (h!2354 (toList!890 lt!74887))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))) ((_ is Cons!1746) (toList!890 lt!74887)) (bvslt (_1!1364 (h!2354 (toList!890 lt!74887))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))))

(declare-fun b!143419 () Bool)

(assert (=> b!143419 (= e!93468 (containsKey!181 (t!6363 (toList!890 lt!74887)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (= (and d!45803 (not res!68328)) b!143418))

(assert (= (and b!143418 res!68329) b!143419))

(assert (=> b!143419 m!172675))

(declare-fun m!172985 () Bool)

(assert (=> b!143419 m!172985))

(assert (=> d!45757 d!45803))

(declare-fun b!143444 () Bool)

(declare-fun lt!75123 () Unit!4535)

(declare-fun lt!75128 () Unit!4535)

(assert (=> b!143444 (= lt!75123 lt!75128)))

(declare-fun lt!75125 () V!3563)

(declare-fun lt!75126 () (_ BitVec 64))

(declare-fun lt!75129 () (_ BitVec 64))

(declare-fun lt!75124 () ListLongMap!1749)

(assert (=> b!143444 (not (contains!927 (+!180 lt!75124 (tuple2!2707 lt!75126 lt!75125)) lt!75129))))

(declare-fun addStillNotContains!65 (ListLongMap!1749 (_ BitVec 64) V!3563 (_ BitVec 64)) Unit!4535)

(assert (=> b!143444 (= lt!75128 (addStillNotContains!65 lt!75124 lt!75126 lt!75125 lt!75129))))

(assert (=> b!143444 (= lt!75129 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!143444 (= lt!75125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143444 (= lt!75126 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!15895 () ListLongMap!1749)

(assert (=> b!143444 (= lt!75124 call!15895)))

(declare-fun e!93487 () ListLongMap!1749)

(assert (=> b!143444 (= e!93487 (+!180 call!15895 (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!143445 () Bool)

(declare-fun e!93489 () Bool)

(declare-fun e!93485 () Bool)

(assert (=> b!143445 (= e!93489 e!93485)))

(assert (=> b!143445 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun lt!75127 () ListLongMap!1749)

(declare-fun res!68339 () Bool)

(assert (=> b!143445 (= res!68339 (contains!927 lt!75127 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143445 (=> (not res!68339) (not e!93485))))

(declare-fun b!143446 () Bool)

(declare-fun res!68338 () Bool)

(declare-fun e!93484 () Bool)

(assert (=> b!143446 (=> (not res!68338) (not e!93484))))

(assert (=> b!143446 (= res!68338 (not (contains!927 lt!75127 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!45805 () Bool)

(assert (=> d!45805 e!93484))

(declare-fun res!68341 () Bool)

(assert (=> d!45805 (=> (not res!68341) (not e!93484))))

(assert (=> d!45805 (= res!68341 (not (contains!927 lt!75127 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!93483 () ListLongMap!1749)

(assert (=> d!45805 (= lt!75127 e!93483)))

(declare-fun c!27148 () Bool)

(assert (=> d!45805 (= c!27148 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(assert (=> d!45805 (validMask!0 (mask!7315 (v!3297 (underlying!483 thiss!992))))))

(assert (=> d!45805 (= (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))) lt!75127)))

(declare-fun b!143447 () Bool)

(declare-fun e!93488 () Bool)

(declare-fun isEmpty!420 (ListLongMap!1749) Bool)

(assert (=> b!143447 (= e!93488 (isEmpty!420 lt!75127))))

(declare-fun b!143448 () Bool)

(declare-fun e!93486 () Bool)

(assert (=> b!143448 (= e!93486 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143448 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!143449 () Bool)

(assert (=> b!143449 (= e!93487 call!15895)))

(declare-fun bm!15892 () Bool)

(assert (=> bm!15892 (= call!15895 (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun b!143450 () Bool)

(assert (=> b!143450 (= e!93488 (= lt!75127 (getCurrentListMapNoExtraKeys!146 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun b!143451 () Bool)

(assert (=> b!143451 (= e!93483 e!93487)))

(declare-fun c!27150 () Bool)

(assert (=> b!143451 (= c!27150 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143452 () Bool)

(assert (=> b!143452 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(assert (=> b!143452 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2595 (_values!2946 (v!3297 (underlying!483 thiss!992))))))))

(assert (=> b!143452 (= e!93485 (= (apply!121 lt!75127 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!143453 () Bool)

(assert (=> b!143453 (= e!93489 e!93488)))

(declare-fun c!27149 () Bool)

(assert (=> b!143453 (= c!27149 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun b!143454 () Bool)

(assert (=> b!143454 (= e!93484 e!93489)))

(declare-fun c!27147 () Bool)

(assert (=> b!143454 (= c!27147 e!93486)))

(declare-fun res!68340 () Bool)

(assert (=> b!143454 (=> (not res!68340) (not e!93486))))

(assert (=> b!143454 (= res!68340 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(declare-fun b!143455 () Bool)

(assert (=> b!143455 (= e!93483 (ListLongMap!1750 Nil!1747))))

(assert (= (and d!45805 c!27148) b!143455))

(assert (= (and d!45805 (not c!27148)) b!143451))

(assert (= (and b!143451 c!27150) b!143444))

(assert (= (and b!143451 (not c!27150)) b!143449))

(assert (= (or b!143444 b!143449) bm!15892))

(assert (= (and d!45805 res!68341) b!143446))

(assert (= (and b!143446 res!68338) b!143454))

(assert (= (and b!143454 res!68340) b!143448))

(assert (= (and b!143454 c!27147) b!143445))

(assert (= (and b!143454 (not c!27147)) b!143453))

(assert (= (and b!143445 res!68339) b!143452))

(assert (= (and b!143453 c!27149) b!143450))

(assert (= (and b!143453 (not c!27149)) b!143447))

(declare-fun b_lambda!6431 () Bool)

(assert (=> (not b_lambda!6431) (not b!143444)))

(assert (=> b!143444 t!6359))

(declare-fun b_and!8935 () Bool)

(assert (= b_and!8931 (and (=> t!6359 result!4213) b_and!8935)))

(assert (=> b!143444 t!6361))

(declare-fun b_and!8937 () Bool)

(assert (= b_and!8933 (and (=> t!6361 result!4217) b_and!8937)))

(declare-fun b_lambda!6433 () Bool)

(assert (=> (not b_lambda!6433) (not b!143452)))

(assert (=> b!143452 t!6359))

(declare-fun b_and!8939 () Bool)

(assert (= b_and!8935 (and (=> t!6359 result!4213) b_and!8939)))

(assert (=> b!143452 t!6361))

(declare-fun b_and!8941 () Bool)

(assert (= b_and!8937 (and (=> t!6361 result!4217) b_and!8941)))

(assert (=> b!143444 m!172683))

(assert (=> b!143444 m!172897))

(declare-fun m!172987 () Bool)

(assert (=> b!143444 m!172987))

(declare-fun m!172989 () Bool)

(assert (=> b!143444 m!172989))

(assert (=> b!143444 m!172897))

(assert (=> b!143444 m!172683))

(assert (=> b!143444 m!172899))

(assert (=> b!143444 m!172989))

(declare-fun m!172991 () Bool)

(assert (=> b!143444 m!172991))

(assert (=> b!143444 m!172769))

(declare-fun m!172993 () Bool)

(assert (=> b!143444 m!172993))

(assert (=> b!143451 m!172769))

(assert (=> b!143451 m!172769))

(assert (=> b!143451 m!172901))

(assert (=> b!143452 m!172769))

(assert (=> b!143452 m!172683))

(assert (=> b!143452 m!172897))

(assert (=> b!143452 m!172683))

(assert (=> b!143452 m!172899))

(assert (=> b!143452 m!172897))

(assert (=> b!143452 m!172769))

(declare-fun m!172995 () Bool)

(assert (=> b!143452 m!172995))

(declare-fun m!172997 () Bool)

(assert (=> bm!15892 m!172997))

(assert (=> b!143448 m!172769))

(assert (=> b!143448 m!172769))

(assert (=> b!143448 m!172901))

(declare-fun m!172999 () Bool)

(assert (=> b!143447 m!172999))

(assert (=> b!143445 m!172769))

(assert (=> b!143445 m!172769))

(declare-fun m!173001 () Bool)

(assert (=> b!143445 m!173001))

(assert (=> b!143450 m!172997))

(declare-fun m!173003 () Bool)

(assert (=> b!143446 m!173003))

(declare-fun m!173005 () Bool)

(assert (=> d!45805 m!173005))

(assert (=> d!45805 m!172775))

(assert (=> bm!15880 d!45805))

(assert (=> b!143332 d!45795))

(declare-fun d!45807 () Bool)

(declare-fun res!68342 () Bool)

(declare-fun e!93490 () Bool)

(assert (=> d!45807 (=> (not res!68342) (not e!93490))))

(assert (=> d!45807 (= res!68342 (simpleValid!97 (v!3297 (underlying!483 thiss!992))))))

(assert (=> d!45807 (= (valid!559 (v!3297 (underlying!483 thiss!992))) e!93490)))

(declare-fun b!143456 () Bool)

(declare-fun res!68343 () Bool)

(assert (=> b!143456 (=> (not res!68343) (not e!93490))))

(assert (=> b!143456 (= res!68343 (= (arrayCountValidKeys!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000000 (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))) (_size!628 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun b!143457 () Bool)

(declare-fun res!68344 () Bool)

(assert (=> b!143457 (=> (not res!68344) (not e!93490))))

(assert (=> b!143457 (= res!68344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992)))))))

(declare-fun b!143458 () Bool)

(assert (=> b!143458 (= e!93490 (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000000 Nil!1746))))

(assert (= (and d!45807 res!68342) b!143456))

(assert (= (and b!143456 res!68343) b!143457))

(assert (= (and b!143457 res!68344) b!143458))

(declare-fun m!173007 () Bool)

(assert (=> d!45807 m!173007))

(declare-fun m!173009 () Bool)

(assert (=> b!143456 m!173009))

(declare-fun m!173011 () Bool)

(assert (=> b!143457 m!173011))

(declare-fun m!173013 () Bool)

(assert (=> b!143458 m!173013))

(assert (=> d!45767 d!45807))

(declare-fun d!45809 () Bool)

(assert (=> d!45809 (= (map!1445 (ite c!27103 newMap!16 (_2!1365 lt!74982))) (getCurrentListMap!562 (_keys!4726 (ite c!27103 newMap!16 (_2!1365 lt!74982))) (_values!2946 (ite c!27103 newMap!16 (_2!1365 lt!74982))) (mask!7315 (ite c!27103 newMap!16 (_2!1365 lt!74982))) (extraKeys!2714 (ite c!27103 newMap!16 (_2!1365 lt!74982))) (zeroValue!2811 (ite c!27103 newMap!16 (_2!1365 lt!74982))) (minValue!2811 (ite c!27103 newMap!16 (_2!1365 lt!74982))) #b00000000000000000000000000000000 (defaultEntry!2963 (ite c!27103 newMap!16 (_2!1365 lt!74982)))))))

(declare-fun bs!6064 () Bool)

(assert (= bs!6064 d!45809))

(declare-fun m!173015 () Bool)

(assert (=> bs!6064 m!173015))

(assert (=> bm!15849 d!45809))

(declare-fun d!45811 () Bool)

(declare-fun res!68345 () Bool)

(declare-fun e!93492 () Bool)

(assert (=> d!45811 (=> res!68345 e!93492)))

(assert (=> d!45811 (= res!68345 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2594 (_keys!4726 (v!3297 (underlying!483 thiss!992))))))))

(assert (=> d!45811 (= (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27062 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746) Nil!1746)) e!93492)))

(declare-fun call!15896 () Bool)

(declare-fun bm!15893 () Bool)

(declare-fun c!27151 () Bool)

(assert (=> bm!15893 (= call!15896 (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27151 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27062 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746) Nil!1746)) (ite c!27062 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746) Nil!1746))))))

(declare-fun b!143459 () Bool)

(declare-fun e!93493 () Bool)

(assert (=> b!143459 (= e!93493 call!15896)))

(declare-fun b!143460 () Bool)

(declare-fun e!93491 () Bool)

(assert (=> b!143460 (= e!93491 e!93493)))

(assert (=> b!143460 (= c!27151 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!143461 () Bool)

(assert (=> b!143461 (= e!93493 call!15896)))

(declare-fun e!93494 () Bool)

(declare-fun b!143462 () Bool)

(assert (=> b!143462 (= e!93494 (contains!928 (ite c!27062 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746) Nil!1746) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!143463 () Bool)

(assert (=> b!143463 (= e!93492 e!93491)))

(declare-fun res!68347 () Bool)

(assert (=> b!143463 (=> (not res!68347) (not e!93491))))

(assert (=> b!143463 (= res!68347 (not e!93494))))

(declare-fun res!68346 () Bool)

(assert (=> b!143463 (=> (not res!68346) (not e!93494))))

(assert (=> b!143463 (= res!68346 (validKeyInArray!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!45811 (not res!68345)) b!143463))

(assert (= (and b!143463 res!68346) b!143462))

(assert (= (and b!143463 res!68347) b!143460))

(assert (= (and b!143460 c!27151) b!143461))

(assert (= (and b!143460 (not c!27151)) b!143459))

(assert (= (or b!143461 b!143459) bm!15893))

(declare-fun m!173017 () Bool)

(assert (=> bm!15893 m!173017))

(declare-fun m!173019 () Bool)

(assert (=> bm!15893 m!173019))

(assert (=> b!143460 m!173017))

(assert (=> b!143460 m!173017))

(declare-fun m!173021 () Bool)

(assert (=> b!143460 m!173021))

(assert (=> b!143462 m!173017))

(assert (=> b!143462 m!173017))

(declare-fun m!173023 () Bool)

(assert (=> b!143462 m!173023))

(assert (=> b!143463 m!173017))

(assert (=> b!143463 m!173017))

(assert (=> b!143463 m!173021))

(assert (=> bm!15793 d!45811))

(declare-fun b!143480 () Bool)

(declare-fun e!93503 () Bool)

(declare-fun call!15901 () Bool)

(assert (=> b!143480 (= e!93503 (not call!15901))))

(declare-fun b!143481 () Bool)

(declare-fun res!68356 () Bool)

(assert (=> b!143481 (=> (not res!68356) (not e!93503))))

(declare-fun lt!75135 () SeekEntryResult!280)

(assert (=> b!143481 (= res!68356 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3287 lt!75135)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143481 (and (bvsge (index!3287 lt!75135) #b00000000000000000000000000000000) (bvslt (index!3287 lt!75135) (size!2594 (_keys!4726 newMap!16))))))

(declare-fun b!143482 () Bool)

(declare-fun e!93505 () Bool)

(assert (=> b!143482 (= e!93505 (not call!15901))))

(declare-fun b!143483 () Bool)

(assert (=> b!143483 (and (bvsge (index!3284 lt!75135) #b00000000000000000000000000000000) (bvslt (index!3284 lt!75135) (size!2594 (_keys!4726 newMap!16))))))

(declare-fun res!68358 () Bool)

(assert (=> b!143483 (= res!68358 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3284 lt!75135)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143483 (=> (not res!68358) (not e!93505))))

(declare-fun bm!15898 () Bool)

(assert (=> bm!15898 (= call!15901 (arrayContainsKey!0 (_keys!4726 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!15899 () Bool)

(declare-fun call!15902 () Bool)

(declare-fun c!27157 () Bool)

(assert (=> bm!15899 (= call!15902 (inRange!0 (ite c!27157 (index!3284 lt!75135) (index!3287 lt!75135)) (mask!7315 newMap!16)))))

(declare-fun b!143484 () Bool)

(declare-fun e!93506 () Bool)

(assert (=> b!143484 (= e!93506 ((_ is Undefined!280) lt!75135))))

(declare-fun b!143485 () Bool)

(declare-fun e!93504 () Bool)

(assert (=> b!143485 (= e!93504 e!93506)))

(declare-fun c!27156 () Bool)

(assert (=> b!143485 (= c!27156 ((_ is MissingVacant!280) lt!75135))))

(declare-fun d!45813 () Bool)

(assert (=> d!45813 e!93504))

(assert (=> d!45813 (= c!27157 ((_ is MissingZero!280) lt!75135))))

(assert (=> d!45813 (= lt!75135 (seekEntryOrOpen!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(declare-fun lt!75134 () Unit!4535)

(declare-fun choose!870 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 64) Int) Unit!4535)

(assert (=> d!45813 (= lt!75134 (choose!870 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)))))

(assert (=> d!45813 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45813 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)) lt!75134)))

(declare-fun b!143486 () Bool)

(declare-fun res!68357 () Bool)

(assert (=> b!143486 (=> (not res!68357) (not e!93503))))

(assert (=> b!143486 (= res!68357 call!15902)))

(assert (=> b!143486 (= e!93506 e!93503)))

(declare-fun b!143487 () Bool)

(assert (=> b!143487 (= e!93504 e!93505)))

(declare-fun res!68359 () Bool)

(assert (=> b!143487 (= res!68359 call!15902)))

(assert (=> b!143487 (=> (not res!68359) (not e!93505))))

(assert (= (and d!45813 c!27157) b!143487))

(assert (= (and d!45813 (not c!27157)) b!143485))

(assert (= (and b!143487 res!68359) b!143483))

(assert (= (and b!143483 res!68358) b!143482))

(assert (= (and b!143485 c!27156) b!143486))

(assert (= (and b!143485 (not c!27156)) b!143484))

(assert (= (and b!143486 res!68357) b!143481))

(assert (= (and b!143481 res!68356) b!143480))

(assert (= (or b!143487 b!143486) bm!15899))

(assert (= (or b!143482 b!143480) bm!15898))

(declare-fun m!173025 () Bool)

(assert (=> b!143481 m!173025))

(declare-fun m!173027 () Bool)

(assert (=> b!143483 m!173027))

(declare-fun m!173029 () Bool)

(assert (=> bm!15899 m!173029))

(assert (=> d!45813 m!172675))

(assert (=> d!45813 m!172793))

(assert (=> d!45813 m!172675))

(declare-fun m!173031 () Bool)

(assert (=> d!45813 m!173031))

(assert (=> d!45813 m!172933))

(assert (=> bm!15898 m!172675))

(assert (=> bm!15898 m!172827))

(assert (=> bm!15855 d!45813))

(declare-fun call!15906 () ListLongMap!1749)

(declare-fun bm!15900 () Bool)

(assert (=> bm!15900 (= call!15906 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun b!143488 () Bool)

(declare-fun e!93517 () ListLongMap!1749)

(declare-fun call!15907 () ListLongMap!1749)

(assert (=> b!143488 (= e!93517 call!15907)))

(declare-fun b!143489 () Bool)

(declare-fun e!93507 () Bool)

(declare-fun e!93509 () Bool)

(assert (=> b!143489 (= e!93507 e!93509)))

(declare-fun c!27162 () Bool)

(assert (=> b!143489 (= c!27162 (not (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143490 () Bool)

(declare-fun e!93516 () Bool)

(declare-fun e!93510 () Bool)

(assert (=> b!143490 (= e!93516 e!93510)))

(declare-fun res!68366 () Bool)

(assert (=> b!143490 (=> (not res!68366) (not e!93510))))

(declare-fun lt!75154 () ListLongMap!1749)

(assert (=> b!143490 (= res!68366 (contains!927 lt!75154 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15901 () Bool)

(declare-fun call!15905 () ListLongMap!1749)

(declare-fun call!15904 () ListLongMap!1749)

(assert (=> bm!15901 (= call!15905 call!15904)))

(declare-fun d!45815 () Bool)

(assert (=> d!45815 e!93507))

(declare-fun res!68361 () Bool)

(assert (=> d!45815 (=> (not res!68361) (not e!93507))))

(assert (=> d!45815 (= res!68361 (or (bvsge #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))))

(declare-fun lt!75145 () ListLongMap!1749)

(assert (=> d!45815 (= lt!75154 lt!75145)))

(declare-fun lt!75151 () Unit!4535)

(declare-fun e!93515 () Unit!4535)

(assert (=> d!45815 (= lt!75151 e!93515)))

(declare-fun c!27158 () Bool)

(declare-fun e!93513 () Bool)

(assert (=> d!45815 (= c!27158 e!93513)))

(declare-fun res!68368 () Bool)

(assert (=> d!45815 (=> (not res!68368) (not e!93513))))

(assert (=> d!45815 (= res!68368 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun e!93518 () ListLongMap!1749)

(assert (=> d!45815 (= lt!75145 e!93518)))

(declare-fun c!27161 () Bool)

(assert (=> d!45815 (= c!27161 (and (not (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45815 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45815 (= (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) lt!75154)))

(declare-fun b!143491 () Bool)

(declare-fun e!93511 () Bool)

(declare-fun call!15909 () Bool)

(assert (=> b!143491 (= e!93511 (not call!15909))))

(declare-fun b!143492 () Bool)

(declare-fun e!93514 () Bool)

(assert (=> b!143492 (= e!93511 e!93514)))

(declare-fun res!68365 () Bool)

(assert (=> b!143492 (= res!68365 call!15909)))

(assert (=> b!143492 (=> (not res!68365) (not e!93514))))

(declare-fun b!143493 () Bool)

(declare-fun e!93508 () ListLongMap!1749)

(assert (=> b!143493 (= e!93508 call!15905)))

(declare-fun b!143494 () Bool)

(declare-fun e!93512 () Bool)

(assert (=> b!143494 (= e!93509 e!93512)))

(declare-fun res!68360 () Bool)

(declare-fun call!15908 () Bool)

(assert (=> b!143494 (= res!68360 call!15908)))

(assert (=> b!143494 (=> (not res!68360) (not e!93512))))

(declare-fun b!143495 () Bool)

(assert (=> b!143495 (= e!93509 (not call!15908))))

(declare-fun b!143496 () Bool)

(declare-fun Unit!4544 () Unit!4535)

(assert (=> b!143496 (= e!93515 Unit!4544)))

(declare-fun bm!15902 () Bool)

(declare-fun call!15903 () ListLongMap!1749)

(assert (=> bm!15902 (= call!15907 call!15903)))

(declare-fun b!143497 () Bool)

(assert (=> b!143497 (= e!93518 e!93508)))

(declare-fun c!27163 () Bool)

(assert (=> b!143497 (= c!27163 (and (not (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15903 () Bool)

(assert (=> bm!15903 (= call!15904 (+!180 (ite c!27161 call!15906 (ite c!27163 call!15903 call!15907)) (ite (or c!27161 c!27163) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 newMap!16)))))))

(declare-fun b!143498 () Bool)

(assert (=> b!143498 (= e!93514 (= (apply!121 lt!75154 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16))))))

(declare-fun bm!15904 () Bool)

(assert (=> bm!15904 (= call!15909 (contains!927 lt!75154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143499 () Bool)

(declare-fun res!68364 () Bool)

(assert (=> b!143499 (=> (not res!68364) (not e!93507))))

(assert (=> b!143499 (= res!68364 e!93516)))

(declare-fun res!68367 () Bool)

(assert (=> b!143499 (=> res!68367 e!93516)))

(declare-fun e!93519 () Bool)

(assert (=> b!143499 (= res!68367 (not e!93519))))

(declare-fun res!68362 () Bool)

(assert (=> b!143499 (=> (not res!68362) (not e!93519))))

(assert (=> b!143499 (= res!68362 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun b!143500 () Bool)

(assert (=> b!143500 (= e!93519 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!27160 () Bool)

(declare-fun b!143501 () Bool)

(assert (=> b!143501 (= c!27160 (and (not (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143501 (= e!93508 e!93517)))

(declare-fun b!143502 () Bool)

(assert (=> b!143502 (= e!93518 (+!180 call!15904 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 newMap!16))))))

(declare-fun b!143503 () Bool)

(assert (=> b!143503 (= e!93512 (= (apply!121 lt!75154 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2811 newMap!16)))))

(declare-fun b!143504 () Bool)

(assert (=> b!143504 (= e!93513 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143505 () Bool)

(assert (=> b!143505 (= e!93510 (= (apply!121 lt!75154 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)) (get!1535 (select (arr!2322 (_values!2946 newMap!16)) #b00000000000000000000000000000000) (dynLambda!444 (defaultEntry!2963 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2595 (_values!2946 newMap!16))))))

(assert (=> b!143505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15905 () Bool)

(assert (=> bm!15905 (= call!15903 call!15906)))

(declare-fun b!143506 () Bool)

(assert (=> b!143506 (= e!93517 call!15905)))

(declare-fun bm!15906 () Bool)

(assert (=> bm!15906 (= call!15908 (contains!927 lt!75154 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143507 () Bool)

(declare-fun lt!75148 () Unit!4535)

(assert (=> b!143507 (= e!93515 lt!75148)))

(declare-fun lt!75142 () ListLongMap!1749)

(assert (=> b!143507 (= lt!75142 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75141 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75141 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75138 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75138 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75146 () Unit!4535)

(assert (=> b!143507 (= lt!75146 (addStillContains!97 lt!75142 lt!75141 (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) lt!75138))))

(assert (=> b!143507 (contains!927 (+!180 lt!75142 (tuple2!2707 lt!75141 (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)))) lt!75138)))

(declare-fun lt!75147 () Unit!4535)

(assert (=> b!143507 (= lt!75147 lt!75146)))

(declare-fun lt!75155 () ListLongMap!1749)

(assert (=> b!143507 (= lt!75155 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75152 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75140 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75140 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75153 () Unit!4535)

(assert (=> b!143507 (= lt!75153 (addApplyDifferent!97 lt!75155 lt!75152 (minValue!2811 newMap!16) lt!75140))))

(assert (=> b!143507 (= (apply!121 (+!180 lt!75155 (tuple2!2707 lt!75152 (minValue!2811 newMap!16))) lt!75140) (apply!121 lt!75155 lt!75140))))

(declare-fun lt!75137 () Unit!4535)

(assert (=> b!143507 (= lt!75137 lt!75153)))

(declare-fun lt!75156 () ListLongMap!1749)

(assert (=> b!143507 (= lt!75156 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75136 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75136 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75139 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75139 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75143 () Unit!4535)

(assert (=> b!143507 (= lt!75143 (addApplyDifferent!97 lt!75156 lt!75136 (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) lt!75139))))

(assert (=> b!143507 (= (apply!121 (+!180 lt!75156 (tuple2!2707 lt!75136 (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)))) lt!75139) (apply!121 lt!75156 lt!75139))))

(declare-fun lt!75150 () Unit!4535)

(assert (=> b!143507 (= lt!75150 lt!75143)))

(declare-fun lt!75149 () ListLongMap!1749)

(assert (=> b!143507 (= lt!75149 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) (ite (and c!27104 c!27099) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2811 newMap!16)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75144 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75144 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75157 () (_ BitVec 64))

(assert (=> b!143507 (= lt!75157 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143507 (= lt!75148 (addApplyDifferent!97 lt!75149 lt!75144 (minValue!2811 newMap!16) lt!75157))))

(assert (=> b!143507 (= (apply!121 (+!180 lt!75149 (tuple2!2707 lt!75144 (minValue!2811 newMap!16))) lt!75157) (apply!121 lt!75149 lt!75157))))

(declare-fun b!143508 () Bool)

(declare-fun res!68363 () Bool)

(assert (=> b!143508 (=> (not res!68363) (not e!93507))))

(assert (=> b!143508 (= res!68363 e!93511)))

(declare-fun c!27159 () Bool)

(assert (=> b!143508 (= c!27159 (not (= (bvand (ite (and c!27104 c!27099) lt!74978 (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!45815 c!27161) b!143502))

(assert (= (and d!45815 (not c!27161)) b!143497))

(assert (= (and b!143497 c!27163) b!143493))

(assert (= (and b!143497 (not c!27163)) b!143501))

(assert (= (and b!143501 c!27160) b!143506))

(assert (= (and b!143501 (not c!27160)) b!143488))

(assert (= (or b!143506 b!143488) bm!15902))

(assert (= (or b!143493 bm!15902) bm!15905))

(assert (= (or b!143493 b!143506) bm!15901))

(assert (= (or b!143502 bm!15905) bm!15900))

(assert (= (or b!143502 bm!15901) bm!15903))

(assert (= (and d!45815 res!68368) b!143504))

(assert (= (and d!45815 c!27158) b!143507))

(assert (= (and d!45815 (not c!27158)) b!143496))

(assert (= (and d!45815 res!68361) b!143499))

(assert (= (and b!143499 res!68362) b!143500))

(assert (= (and b!143499 (not res!68367)) b!143490))

(assert (= (and b!143490 res!68366) b!143505))

(assert (= (and b!143499 res!68364) b!143508))

(assert (= (and b!143508 c!27159) b!143492))

(assert (= (and b!143508 (not c!27159)) b!143491))

(assert (= (and b!143492 res!68365) b!143498))

(assert (= (or b!143492 b!143491) bm!15904))

(assert (= (and b!143508 res!68363) b!143489))

(assert (= (and b!143489 c!27162) b!143494))

(assert (= (and b!143489 (not c!27162)) b!143495))

(assert (= (and b!143494 res!68360) b!143503))

(assert (= (or b!143494 b!143495) bm!15906))

(declare-fun b_lambda!6435 () Bool)

(assert (=> (not b_lambda!6435) (not b!143505)))

(declare-fun t!6370 () Bool)

(declare-fun tb!2581 () Bool)

(assert (=> (and b!143053 (= (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) (defaultEntry!2963 newMap!16)) t!6370) tb!2581))

(declare-fun result!4227 () Bool)

(assert (=> tb!2581 (= result!4227 tp_is_empty!2937)))

(assert (=> b!143505 t!6370))

(declare-fun b_and!8943 () Bool)

(assert (= b_and!8939 (and (=> t!6370 result!4227) b_and!8943)))

(declare-fun t!6372 () Bool)

(declare-fun tb!2583 () Bool)

(assert (=> (and b!143045 (= (defaultEntry!2963 newMap!16) (defaultEntry!2963 newMap!16)) t!6372) tb!2583))

(declare-fun result!4229 () Bool)

(assert (= result!4229 result!4227))

(assert (=> b!143505 t!6372))

(declare-fun b_and!8945 () Bool)

(assert (= b_and!8941 (and (=> t!6372 result!4229) b_and!8945)))

(assert (=> d!45815 m!172933))

(declare-fun m!173033 () Bool)

(assert (=> bm!15903 m!173033))

(declare-fun m!173035 () Bool)

(assert (=> b!143502 m!173035))

(declare-fun m!173037 () Bool)

(assert (=> bm!15900 m!173037))

(declare-fun m!173039 () Bool)

(assert (=> b!143507 m!173039))

(declare-fun m!173041 () Bool)

(assert (=> b!143507 m!173041))

(declare-fun m!173043 () Bool)

(assert (=> b!143507 m!173043))

(declare-fun m!173045 () Bool)

(assert (=> b!143507 m!173045))

(assert (=> b!143507 m!173045))

(declare-fun m!173047 () Bool)

(assert (=> b!143507 m!173047))

(declare-fun m!173049 () Bool)

(assert (=> b!143507 m!173049))

(declare-fun m!173051 () Bool)

(assert (=> b!143507 m!173051))

(assert (=> b!143507 m!172935))

(declare-fun m!173053 () Bool)

(assert (=> b!143507 m!173053))

(declare-fun m!173055 () Bool)

(assert (=> b!143507 m!173055))

(assert (=> b!143507 m!173041))

(declare-fun m!173057 () Bool)

(assert (=> b!143507 m!173057))

(assert (=> b!143507 m!173037))

(declare-fun m!173059 () Bool)

(assert (=> b!143507 m!173059))

(declare-fun m!173061 () Bool)

(assert (=> b!143507 m!173061))

(declare-fun m!173063 () Bool)

(assert (=> b!143507 m!173063))

(assert (=> b!143507 m!173039))

(declare-fun m!173065 () Bool)

(assert (=> b!143507 m!173065))

(declare-fun m!173067 () Bool)

(assert (=> b!143507 m!173067))

(assert (=> b!143507 m!173061))

(declare-fun m!173069 () Bool)

(assert (=> b!143498 m!173069))

(declare-fun m!173071 () Bool)

(assert (=> b!143503 m!173071))

(assert (=> b!143490 m!172935))

(assert (=> b!143490 m!172935))

(declare-fun m!173073 () Bool)

(assert (=> b!143490 m!173073))

(declare-fun m!173075 () Bool)

(assert (=> bm!15904 m!173075))

(assert (=> b!143505 m!172935))

(declare-fun m!173077 () Bool)

(assert (=> b!143505 m!173077))

(declare-fun m!173079 () Bool)

(assert (=> b!143505 m!173079))

(declare-fun m!173081 () Bool)

(assert (=> b!143505 m!173081))

(declare-fun m!173083 () Bool)

(assert (=> b!143505 m!173083))

(assert (=> b!143505 m!173081))

(assert (=> b!143505 m!172935))

(assert (=> b!143505 m!173079))

(assert (=> b!143500 m!172935))

(assert (=> b!143500 m!172935))

(assert (=> b!143500 m!172943))

(assert (=> b!143504 m!172935))

(assert (=> b!143504 m!172935))

(assert (=> b!143504 m!172943))

(declare-fun m!173085 () Bool)

(assert (=> bm!15906 m!173085))

(assert (=> bm!15864 d!45815))

(declare-fun d!45817 () Bool)

(declare-fun isEmpty!421 (Option!183) Bool)

(assert (=> d!45817 (= (isDefined!130 (getValueByKey!177 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))) (not (isEmpty!421 (getValueByKey!177 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))))

(declare-fun bs!6065 () Bool)

(assert (= bs!6065 d!45817))

(assert (=> bs!6065 m!172781))

(declare-fun m!173087 () Bool)

(assert (=> bs!6065 m!173087))

(assert (=> b!143153 d!45817))

(declare-fun b!143520 () Bool)

(declare-fun e!93525 () Option!183)

(assert (=> b!143520 (= e!93525 None!181)))

(declare-fun b!143518 () Bool)

(declare-fun e!93524 () Option!183)

(assert (=> b!143518 (= e!93524 e!93525)))

(declare-fun c!27169 () Bool)

(assert (=> b!143518 (= c!27169 (and ((_ is Cons!1746) (toList!890 lt!74887)) (not (= (_1!1364 (h!2354 (toList!890 lt!74887))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))))

(declare-fun d!45819 () Bool)

(declare-fun c!27168 () Bool)

(assert (=> d!45819 (= c!27168 (and ((_ is Cons!1746) (toList!890 lt!74887)) (= (_1!1364 (h!2354 (toList!890 lt!74887))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))))

(assert (=> d!45819 (= (getValueByKey!177 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) e!93524)))

(declare-fun b!143519 () Bool)

(assert (=> b!143519 (= e!93525 (getValueByKey!177 (t!6363 (toList!890 lt!74887)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143517 () Bool)

(assert (=> b!143517 (= e!93524 (Some!182 (_2!1364 (h!2354 (toList!890 lt!74887)))))))

(assert (= (and d!45819 c!27168) b!143517))

(assert (= (and d!45819 (not c!27168)) b!143518))

(assert (= (and b!143518 c!27169) b!143519))

(assert (= (and b!143518 (not c!27169)) b!143520))

(assert (=> b!143519 m!172675))

(declare-fun m!173089 () Bool)

(assert (=> b!143519 m!173089))

(assert (=> b!143153 d!45819))

(declare-fun call!15913 () ListLongMap!1749)

(declare-fun bm!15907 () Bool)

(assert (=> bm!15907 (= call!15913 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985) (mask!7315 newMap!16) (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) (zeroValue!2811 newMap!16) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun b!143521 () Bool)

(declare-fun e!93536 () ListLongMap!1749)

(declare-fun call!15914 () ListLongMap!1749)

(assert (=> b!143521 (= e!93536 call!15914)))

(declare-fun b!143522 () Bool)

(declare-fun e!93526 () Bool)

(declare-fun e!93528 () Bool)

(assert (=> b!143522 (= e!93526 e!93528)))

(declare-fun c!27174 () Bool)

(assert (=> b!143522 (= c!27174 (not (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143523 () Bool)

(declare-fun e!93535 () Bool)

(declare-fun e!93529 () Bool)

(assert (=> b!143523 (= e!93535 e!93529)))

(declare-fun res!68375 () Bool)

(assert (=> b!143523 (=> (not res!68375) (not e!93529))))

(declare-fun lt!75176 () ListLongMap!1749)

(assert (=> b!143523 (= res!68375 (contains!927 lt!75176 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15908 () Bool)

(declare-fun call!15912 () ListLongMap!1749)

(declare-fun call!15911 () ListLongMap!1749)

(assert (=> bm!15908 (= call!15912 call!15911)))

(declare-fun d!45821 () Bool)

(assert (=> d!45821 e!93526))

(declare-fun res!68370 () Bool)

(assert (=> d!45821 (=> (not res!68370) (not e!93526))))

(assert (=> d!45821 (= res!68370 (or (bvsge #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))))

(declare-fun lt!75167 () ListLongMap!1749)

(assert (=> d!45821 (= lt!75176 lt!75167)))

(declare-fun lt!75173 () Unit!4535)

(declare-fun e!93534 () Unit!4535)

(assert (=> d!45821 (= lt!75173 e!93534)))

(declare-fun c!27170 () Bool)

(declare-fun e!93532 () Bool)

(assert (=> d!45821 (= c!27170 e!93532)))

(declare-fun res!68377 () Bool)

(assert (=> d!45821 (=> (not res!68377) (not e!93532))))

(assert (=> d!45821 (= res!68377 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun e!93537 () ListLongMap!1749)

(assert (=> d!45821 (= lt!75167 e!93537)))

(declare-fun c!27173 () Bool)

(assert (=> d!45821 (= c!27173 (and (not (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45821 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45821 (= (getCurrentListMap!562 (_keys!4726 newMap!16) (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985) (mask!7315 newMap!16) (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) (zeroValue!2811 newMap!16) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) lt!75176)))

(declare-fun b!143524 () Bool)

(declare-fun e!93530 () Bool)

(declare-fun call!15916 () Bool)

(assert (=> b!143524 (= e!93530 (not call!15916))))

(declare-fun b!143525 () Bool)

(declare-fun e!93533 () Bool)

(assert (=> b!143525 (= e!93530 e!93533)))

(declare-fun res!68374 () Bool)

(assert (=> b!143525 (= res!68374 call!15916)))

(assert (=> b!143525 (=> (not res!68374) (not e!93533))))

(declare-fun b!143526 () Bool)

(declare-fun e!93527 () ListLongMap!1749)

(assert (=> b!143526 (= e!93527 call!15912)))

(declare-fun b!143527 () Bool)

(declare-fun e!93531 () Bool)

(assert (=> b!143527 (= e!93528 e!93531)))

(declare-fun res!68369 () Bool)

(declare-fun call!15915 () Bool)

(assert (=> b!143527 (= res!68369 call!15915)))

(assert (=> b!143527 (=> (not res!68369) (not e!93531))))

(declare-fun b!143528 () Bool)

(assert (=> b!143528 (= e!93528 (not call!15915))))

(declare-fun b!143529 () Bool)

(declare-fun Unit!4545 () Unit!4535)

(assert (=> b!143529 (= e!93534 Unit!4545)))

(declare-fun bm!15909 () Bool)

(declare-fun call!15910 () ListLongMap!1749)

(assert (=> bm!15909 (= call!15914 call!15910)))

(declare-fun b!143530 () Bool)

(assert (=> b!143530 (= e!93537 e!93527)))

(declare-fun c!27175 () Bool)

(assert (=> b!143530 (= c!27175 (and (not (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15910 () Bool)

(assert (=> bm!15910 (= call!15911 (+!180 (ite c!27173 call!15913 (ite c!27175 call!15910 call!15914)) (ite (or c!27173 c!27175) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 newMap!16)) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16))))))))

(declare-fun b!143531 () Bool)

(assert (=> b!143531 (= e!93533 (= (apply!121 lt!75176 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2811 newMap!16)))))

(declare-fun bm!15911 () Bool)

(assert (=> bm!15911 (= call!15916 (contains!927 lt!75176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143532 () Bool)

(declare-fun res!68373 () Bool)

(assert (=> b!143532 (=> (not res!68373) (not e!93526))))

(assert (=> b!143532 (= res!68373 e!93535)))

(declare-fun res!68376 () Bool)

(assert (=> b!143532 (=> res!68376 e!93535)))

(declare-fun e!93538 () Bool)

(assert (=> b!143532 (= res!68376 (not e!93538))))

(declare-fun res!68371 () Bool)

(assert (=> b!143532 (=> (not res!68371) (not e!93538))))

(assert (=> b!143532 (= res!68371 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun b!143533 () Bool)

(assert (=> b!143533 (= e!93538 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun c!27172 () Bool)

(declare-fun b!143534 () Bool)

(assert (=> b!143534 (= c!27172 (and (not (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143534 (= e!93527 e!93536)))

(declare-fun b!143535 () Bool)

(assert (=> b!143535 (= e!93537 (+!180 call!15911 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)))))))

(declare-fun b!143536 () Bool)

(assert (=> b!143536 (= e!93531 (= (apply!121 lt!75176 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16))))))

(declare-fun b!143537 () Bool)

(assert (=> b!143537 (= e!93532 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143538 () Bool)

(assert (=> b!143538 (= e!93529 (= (apply!121 lt!75176 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)) (get!1535 (select (arr!2322 (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985)) #b00000000000000000000000000000000) (dynLambda!444 (defaultEntry!2963 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2595 (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985))))))

(assert (=> b!143538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15912 () Bool)

(assert (=> bm!15912 (= call!15910 call!15913)))

(declare-fun b!143539 () Bool)

(assert (=> b!143539 (= e!93536 call!15912)))

(declare-fun bm!15913 () Bool)

(assert (=> bm!15913 (= call!15915 (contains!927 lt!75176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143540 () Bool)

(declare-fun lt!75170 () Unit!4535)

(assert (=> b!143540 (= e!93534 lt!75170)))

(declare-fun lt!75164 () ListLongMap!1749)

(assert (=> b!143540 (= lt!75164 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985) (mask!7315 newMap!16) (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) (zeroValue!2811 newMap!16) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75163 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75160 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75160 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75168 () Unit!4535)

(assert (=> b!143540 (= lt!75168 (addStillContains!97 lt!75164 lt!75163 (zeroValue!2811 newMap!16) lt!75160))))

(assert (=> b!143540 (contains!927 (+!180 lt!75164 (tuple2!2707 lt!75163 (zeroValue!2811 newMap!16))) lt!75160)))

(declare-fun lt!75169 () Unit!4535)

(assert (=> b!143540 (= lt!75169 lt!75168)))

(declare-fun lt!75177 () ListLongMap!1749)

(assert (=> b!143540 (= lt!75177 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985) (mask!7315 newMap!16) (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) (zeroValue!2811 newMap!16) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75174 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75174 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75162 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75162 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75175 () Unit!4535)

(assert (=> b!143540 (= lt!75175 (addApplyDifferent!97 lt!75177 lt!75174 (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) lt!75162))))

(assert (=> b!143540 (= (apply!121 (+!180 lt!75177 (tuple2!2707 lt!75174 (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)))) lt!75162) (apply!121 lt!75177 lt!75162))))

(declare-fun lt!75159 () Unit!4535)

(assert (=> b!143540 (= lt!75159 lt!75175)))

(declare-fun lt!75178 () ListLongMap!1749)

(assert (=> b!143540 (= lt!75178 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985) (mask!7315 newMap!16) (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) (zeroValue!2811 newMap!16) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75158 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75161 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75161 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75165 () Unit!4535)

(assert (=> b!143540 (= lt!75165 (addApplyDifferent!97 lt!75178 lt!75158 (zeroValue!2811 newMap!16) lt!75161))))

(assert (=> b!143540 (= (apply!121 (+!180 lt!75178 (tuple2!2707 lt!75158 (zeroValue!2811 newMap!16))) lt!75161) (apply!121 lt!75178 lt!75161))))

(declare-fun lt!75172 () Unit!4535)

(assert (=> b!143540 (= lt!75172 lt!75165)))

(declare-fun lt!75171 () ListLongMap!1749)

(assert (=> b!143540 (= lt!75171 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (ite (or c!27104 c!27100) (_values!2946 newMap!16) lt!74985) (mask!7315 newMap!16) (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) (zeroValue!2811 newMap!16) (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75166 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75166 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75179 () (_ BitVec 64))

(assert (=> b!143540 (= lt!75179 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143540 (= lt!75170 (addApplyDifferent!97 lt!75171 lt!75166 (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)) lt!75179))))

(assert (=> b!143540 (= (apply!121 (+!180 lt!75171 (tuple2!2707 lt!75166 (ite c!27104 (ite c!27099 (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2811 newMap!16)))) lt!75179) (apply!121 lt!75171 lt!75179))))

(declare-fun b!143541 () Bool)

(declare-fun res!68372 () Bool)

(assert (=> b!143541 (=> (not res!68372) (not e!93526))))

(assert (=> b!143541 (= res!68372 e!93530)))

(declare-fun c!27171 () Bool)

(assert (=> b!143541 (= c!27171 (not (= (bvand (ite c!27104 (ite c!27099 (extraKeys!2714 newMap!16) lt!74977) (extraKeys!2714 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!45821 c!27173) b!143535))

(assert (= (and d!45821 (not c!27173)) b!143530))

(assert (= (and b!143530 c!27175) b!143526))

(assert (= (and b!143530 (not c!27175)) b!143534))

(assert (= (and b!143534 c!27172) b!143539))

(assert (= (and b!143534 (not c!27172)) b!143521))

(assert (= (or b!143539 b!143521) bm!15909))

(assert (= (or b!143526 bm!15909) bm!15912))

(assert (= (or b!143526 b!143539) bm!15908))

(assert (= (or b!143535 bm!15912) bm!15907))

(assert (= (or b!143535 bm!15908) bm!15910))

(assert (= (and d!45821 res!68377) b!143537))

(assert (= (and d!45821 c!27170) b!143540))

(assert (= (and d!45821 (not c!27170)) b!143529))

(assert (= (and d!45821 res!68370) b!143532))

(assert (= (and b!143532 res!68371) b!143533))

(assert (= (and b!143532 (not res!68376)) b!143523))

(assert (= (and b!143523 res!68375) b!143538))

(assert (= (and b!143532 res!68373) b!143541))

(assert (= (and b!143541 c!27171) b!143525))

(assert (= (and b!143541 (not c!27171)) b!143524))

(assert (= (and b!143525 res!68374) b!143531))

(assert (= (or b!143525 b!143524) bm!15911))

(assert (= (and b!143541 res!68372) b!143522))

(assert (= (and b!143522 c!27174) b!143527))

(assert (= (and b!143522 (not c!27174)) b!143528))

(assert (= (and b!143527 res!68369) b!143536))

(assert (= (or b!143527 b!143528) bm!15913))

(declare-fun b_lambda!6437 () Bool)

(assert (=> (not b_lambda!6437) (not b!143538)))

(assert (=> b!143538 t!6370))

(declare-fun b_and!8947 () Bool)

(assert (= b_and!8943 (and (=> t!6370 result!4227) b_and!8947)))

(assert (=> b!143538 t!6372))

(declare-fun b_and!8949 () Bool)

(assert (= b_and!8945 (and (=> t!6372 result!4229) b_and!8949)))

(assert (=> d!45821 m!172933))

(declare-fun m!173091 () Bool)

(assert (=> bm!15910 m!173091))

(declare-fun m!173093 () Bool)

(assert (=> b!143535 m!173093))

(declare-fun m!173095 () Bool)

(assert (=> bm!15907 m!173095))

(declare-fun m!173097 () Bool)

(assert (=> b!143540 m!173097))

(declare-fun m!173099 () Bool)

(assert (=> b!143540 m!173099))

(declare-fun m!173101 () Bool)

(assert (=> b!143540 m!173101))

(declare-fun m!173103 () Bool)

(assert (=> b!143540 m!173103))

(assert (=> b!143540 m!173103))

(declare-fun m!173105 () Bool)

(assert (=> b!143540 m!173105))

(declare-fun m!173107 () Bool)

(assert (=> b!143540 m!173107))

(declare-fun m!173109 () Bool)

(assert (=> b!143540 m!173109))

(assert (=> b!143540 m!172935))

(declare-fun m!173111 () Bool)

(assert (=> b!143540 m!173111))

(declare-fun m!173113 () Bool)

(assert (=> b!143540 m!173113))

(assert (=> b!143540 m!173099))

(declare-fun m!173115 () Bool)

(assert (=> b!143540 m!173115))

(assert (=> b!143540 m!173095))

(declare-fun m!173117 () Bool)

(assert (=> b!143540 m!173117))

(declare-fun m!173119 () Bool)

(assert (=> b!143540 m!173119))

(declare-fun m!173121 () Bool)

(assert (=> b!143540 m!173121))

(assert (=> b!143540 m!173097))

(declare-fun m!173123 () Bool)

(assert (=> b!143540 m!173123))

(declare-fun m!173125 () Bool)

(assert (=> b!143540 m!173125))

(assert (=> b!143540 m!173119))

(declare-fun m!173127 () Bool)

(assert (=> b!143531 m!173127))

(declare-fun m!173129 () Bool)

(assert (=> b!143536 m!173129))

(assert (=> b!143523 m!172935))

(assert (=> b!143523 m!172935))

(declare-fun m!173131 () Bool)

(assert (=> b!143523 m!173131))

(declare-fun m!173133 () Bool)

(assert (=> bm!15911 m!173133))

(assert (=> b!143538 m!172935))

(declare-fun m!173135 () Bool)

(assert (=> b!143538 m!173135))

(declare-fun m!173137 () Bool)

(assert (=> b!143538 m!173137))

(assert (=> b!143538 m!173081))

(declare-fun m!173139 () Bool)

(assert (=> b!143538 m!173139))

(assert (=> b!143538 m!173081))

(assert (=> b!143538 m!172935))

(assert (=> b!143538 m!173137))

(assert (=> b!143533 m!172935))

(assert (=> b!143533 m!172935))

(assert (=> b!143533 m!172943))

(assert (=> b!143537 m!172935))

(assert (=> b!143537 m!172935))

(assert (=> b!143537 m!172943))

(declare-fun m!173141 () Bool)

(assert (=> bm!15913 m!173141))

(assert (=> bm!15858 d!45821))

(declare-fun d!45823 () Bool)

(declare-fun get!1538 (Option!183) V!3563)

(assert (=> d!45823 (= (apply!121 lt!75064 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1538 (getValueByKey!177 (toList!890 lt!75064) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6066 () Bool)

(assert (= bs!6066 d!45823))

(declare-fun m!173143 () Bool)

(assert (=> bs!6066 m!173143))

(assert (=> bs!6066 m!173143))

(declare-fun m!173145 () Bool)

(assert (=> bs!6066 m!173145))

(assert (=> b!143326 d!45823))

(declare-fun d!45825 () Bool)

(assert (=> d!45825 (= (map!1445 (ite c!27103 (_2!1365 lt!74982) newMap!16)) (getCurrentListMap!562 (_keys!4726 (ite c!27103 (_2!1365 lt!74982) newMap!16)) (_values!2946 (ite c!27103 (_2!1365 lt!74982) newMap!16)) (mask!7315 (ite c!27103 (_2!1365 lt!74982) newMap!16)) (extraKeys!2714 (ite c!27103 (_2!1365 lt!74982) newMap!16)) (zeroValue!2811 (ite c!27103 (_2!1365 lt!74982) newMap!16)) (minValue!2811 (ite c!27103 (_2!1365 lt!74982) newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2963 (ite c!27103 (_2!1365 lt!74982) newMap!16))))))

(declare-fun bs!6067 () Bool)

(assert (= bs!6067 d!45825))

(declare-fun m!173147 () Bool)

(assert (=> bs!6067 m!173147))

(assert (=> bm!15856 d!45825))

(assert (=> b!143143 d!45753))

(declare-fun d!45827 () Bool)

(declare-fun e!93541 () Bool)

(assert (=> d!45827 e!93541))

(declare-fun res!68380 () Bool)

(assert (=> d!45827 (=> (not res!68380) (not e!93541))))

(assert (=> d!45827 (= res!68380 (and (bvsge (index!3285 lt!74998) #b00000000000000000000000000000000) (bvslt (index!3285 lt!74998) (size!2594 (_keys!4726 newMap!16)))))))

(declare-fun lt!75182 () Unit!4535)

(declare-fun choose!871 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 32) Int) Unit!4535)

(assert (=> d!45827 (= lt!75182 (choose!871 (_keys!4726 newMap!16) lt!74985 (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (index!3285 lt!74998) (defaultEntry!2963 newMap!16)))))

(assert (=> d!45827 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45827 (= (lemmaValidKeyInArrayIsInListMap!127 (_keys!4726 newMap!16) lt!74985 (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (index!3285 lt!74998) (defaultEntry!2963 newMap!16)) lt!75182)))

(declare-fun b!143544 () Bool)

(assert (=> b!143544 (= e!93541 (contains!927 (getCurrentListMap!562 (_keys!4726 newMap!16) lt!74985 (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74998))))))

(assert (= (and d!45827 res!68380) b!143544))

(declare-fun m!173149 () Bool)

(assert (=> d!45827 m!173149))

(assert (=> d!45827 m!172933))

(declare-fun m!173151 () Bool)

(assert (=> b!143544 m!173151))

(assert (=> b!143544 m!172837))

(assert (=> b!143544 m!173151))

(assert (=> b!143544 m!172837))

(declare-fun m!173153 () Bool)

(assert (=> b!143544 m!173153))

(assert (=> b!143252 d!45827))

(declare-fun bm!15914 () Bool)

(declare-fun call!15920 () ListLongMap!1749)

(assert (=> bm!15914 (= call!15920 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun b!143545 () Bool)

(declare-fun e!93552 () ListLongMap!1749)

(declare-fun call!15921 () ListLongMap!1749)

(assert (=> b!143545 (= e!93552 call!15921)))

(declare-fun b!143546 () Bool)

(declare-fun e!93542 () Bool)

(declare-fun e!93544 () Bool)

(assert (=> b!143546 (= e!93542 e!93544)))

(declare-fun c!27180 () Bool)

(assert (=> b!143546 (= c!27180 (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143547 () Bool)

(declare-fun e!93551 () Bool)

(declare-fun e!93545 () Bool)

(assert (=> b!143547 (= e!93551 e!93545)))

(declare-fun res!68387 () Bool)

(assert (=> b!143547 (=> (not res!68387) (not e!93545))))

(declare-fun lt!75201 () ListLongMap!1749)

(assert (=> b!143547 (= res!68387 (contains!927 lt!75201 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143547 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15915 () Bool)

(declare-fun call!15919 () ListLongMap!1749)

(declare-fun call!15918 () ListLongMap!1749)

(assert (=> bm!15915 (= call!15919 call!15918)))

(declare-fun d!45829 () Bool)

(assert (=> d!45829 e!93542))

(declare-fun res!68382 () Bool)

(assert (=> d!45829 (=> (not res!68382) (not e!93542))))

(assert (=> d!45829 (= res!68382 (or (bvsge #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))))

(declare-fun lt!75192 () ListLongMap!1749)

(assert (=> d!45829 (= lt!75201 lt!75192)))

(declare-fun lt!75198 () Unit!4535)

(declare-fun e!93550 () Unit!4535)

(assert (=> d!45829 (= lt!75198 e!93550)))

(declare-fun c!27176 () Bool)

(declare-fun e!93548 () Bool)

(assert (=> d!45829 (= c!27176 e!93548)))

(declare-fun res!68389 () Bool)

(assert (=> d!45829 (=> (not res!68389) (not e!93548))))

(assert (=> d!45829 (= res!68389 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun e!93553 () ListLongMap!1749)

(assert (=> d!45829 (= lt!75192 e!93553)))

(declare-fun c!27179 () Bool)

(assert (=> d!45829 (= c!27179 (and (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45829 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45829 (= (getCurrentListMap!562 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) lt!75201)))

(declare-fun b!143548 () Bool)

(declare-fun e!93546 () Bool)

(declare-fun call!15923 () Bool)

(assert (=> b!143548 (= e!93546 (not call!15923))))

(declare-fun b!143549 () Bool)

(declare-fun e!93549 () Bool)

(assert (=> b!143549 (= e!93546 e!93549)))

(declare-fun res!68386 () Bool)

(assert (=> b!143549 (= res!68386 call!15923)))

(assert (=> b!143549 (=> (not res!68386) (not e!93549))))

(declare-fun b!143550 () Bool)

(declare-fun e!93543 () ListLongMap!1749)

(assert (=> b!143550 (= e!93543 call!15919)))

(declare-fun b!143551 () Bool)

(declare-fun e!93547 () Bool)

(assert (=> b!143551 (= e!93544 e!93547)))

(declare-fun res!68381 () Bool)

(declare-fun call!15922 () Bool)

(assert (=> b!143551 (= res!68381 call!15922)))

(assert (=> b!143551 (=> (not res!68381) (not e!93547))))

(declare-fun b!143552 () Bool)

(assert (=> b!143552 (= e!93544 (not call!15922))))

(declare-fun b!143553 () Bool)

(declare-fun Unit!4546 () Unit!4535)

(assert (=> b!143553 (= e!93550 Unit!4546)))

(declare-fun bm!15916 () Bool)

(declare-fun call!15917 () ListLongMap!1749)

(assert (=> bm!15916 (= call!15921 call!15917)))

(declare-fun b!143554 () Bool)

(assert (=> b!143554 (= e!93553 e!93543)))

(declare-fun c!27181 () Bool)

(assert (=> b!143554 (= c!27181 (and (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15917 () Bool)

(assert (=> bm!15917 (= call!15918 (+!180 (ite c!27179 call!15920 (ite c!27181 call!15917 call!15921)) (ite (or c!27179 c!27181) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 newMap!16)) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 newMap!16)))))))

(declare-fun b!143555 () Bool)

(assert (=> b!143555 (= e!93549 (= (apply!121 lt!75201 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2811 newMap!16)))))

(declare-fun bm!15918 () Bool)

(assert (=> bm!15918 (= call!15923 (contains!927 lt!75201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143556 () Bool)

(declare-fun res!68385 () Bool)

(assert (=> b!143556 (=> (not res!68385) (not e!93542))))

(assert (=> b!143556 (= res!68385 e!93551)))

(declare-fun res!68388 () Bool)

(assert (=> b!143556 (=> res!68388 e!93551)))

(declare-fun e!93554 () Bool)

(assert (=> b!143556 (= res!68388 (not e!93554))))

(declare-fun res!68383 () Bool)

(assert (=> b!143556 (=> (not res!68383) (not e!93554))))

(assert (=> b!143556 (= res!68383 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun b!143557 () Bool)

(assert (=> b!143557 (= e!93554 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143558 () Bool)

(declare-fun c!27178 () Bool)

(assert (=> b!143558 (= c!27178 (and (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143558 (= e!93543 e!93552)))

(declare-fun b!143559 () Bool)

(assert (=> b!143559 (= e!93553 (+!180 call!15918 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 newMap!16))))))

(declare-fun b!143560 () Bool)

(assert (=> b!143560 (= e!93547 (= (apply!121 lt!75201 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2811 newMap!16)))))

(declare-fun b!143561 () Bool)

(assert (=> b!143561 (= e!93548 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143562 () Bool)

(assert (=> b!143562 (= e!93545 (= (apply!121 lt!75201 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)) (get!1535 (select (arr!2322 (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!444 (defaultEntry!2963 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143562 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2595 (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))))))))

(assert (=> b!143562 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15919 () Bool)

(assert (=> bm!15919 (= call!15917 call!15920)))

(declare-fun b!143563 () Bool)

(assert (=> b!143563 (= e!93552 call!15919)))

(declare-fun bm!15920 () Bool)

(assert (=> bm!15920 (= call!15922 (contains!927 lt!75201 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143564 () Bool)

(declare-fun lt!75195 () Unit!4535)

(assert (=> b!143564 (= e!93550 lt!75195)))

(declare-fun lt!75189 () ListLongMap!1749)

(assert (=> b!143564 (= lt!75189 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75188 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75185 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75185 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75193 () Unit!4535)

(assert (=> b!143564 (= lt!75193 (addStillContains!97 lt!75189 lt!75188 (zeroValue!2811 newMap!16) lt!75185))))

(assert (=> b!143564 (contains!927 (+!180 lt!75189 (tuple2!2707 lt!75188 (zeroValue!2811 newMap!16))) lt!75185)))

(declare-fun lt!75194 () Unit!4535)

(assert (=> b!143564 (= lt!75194 lt!75193)))

(declare-fun lt!75202 () ListLongMap!1749)

(assert (=> b!143564 (= lt!75202 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75199 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75199 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75187 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75187 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75200 () Unit!4535)

(assert (=> b!143564 (= lt!75200 (addApplyDifferent!97 lt!75202 lt!75199 (minValue!2811 newMap!16) lt!75187))))

(assert (=> b!143564 (= (apply!121 (+!180 lt!75202 (tuple2!2707 lt!75199 (minValue!2811 newMap!16))) lt!75187) (apply!121 lt!75202 lt!75187))))

(declare-fun lt!75184 () Unit!4535)

(assert (=> b!143564 (= lt!75184 lt!75200)))

(declare-fun lt!75203 () ListLongMap!1749)

(assert (=> b!143564 (= lt!75203 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75183 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75186 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75186 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75190 () Unit!4535)

(assert (=> b!143564 (= lt!75190 (addApplyDifferent!97 lt!75203 lt!75183 (zeroValue!2811 newMap!16) lt!75186))))

(assert (=> b!143564 (= (apply!121 (+!180 lt!75203 (tuple2!2707 lt!75183 (zeroValue!2811 newMap!16))) lt!75186) (apply!121 lt!75203 lt!75186))))

(declare-fun lt!75197 () Unit!4535)

(assert (=> b!143564 (= lt!75197 lt!75190)))

(declare-fun lt!75196 () ListLongMap!1749)

(assert (=> b!143564 (= lt!75196 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75191 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75191 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75204 () (_ BitVec 64))

(assert (=> b!143564 (= lt!75204 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143564 (= lt!75195 (addApplyDifferent!97 lt!75196 lt!75191 (minValue!2811 newMap!16) lt!75204))))

(assert (=> b!143564 (= (apply!121 (+!180 lt!75196 (tuple2!2707 lt!75191 (minValue!2811 newMap!16))) lt!75204) (apply!121 lt!75196 lt!75204))))

(declare-fun b!143565 () Bool)

(declare-fun res!68384 () Bool)

(assert (=> b!143565 (=> (not res!68384) (not e!93542))))

(assert (=> b!143565 (= res!68384 e!93546)))

(declare-fun c!27177 () Bool)

(assert (=> b!143565 (= c!27177 (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!45829 c!27179) b!143559))

(assert (= (and d!45829 (not c!27179)) b!143554))

(assert (= (and b!143554 c!27181) b!143550))

(assert (= (and b!143554 (not c!27181)) b!143558))

(assert (= (and b!143558 c!27178) b!143563))

(assert (= (and b!143558 (not c!27178)) b!143545))

(assert (= (or b!143563 b!143545) bm!15916))

(assert (= (or b!143550 bm!15916) bm!15919))

(assert (= (or b!143550 b!143563) bm!15915))

(assert (= (or b!143559 bm!15919) bm!15914))

(assert (= (or b!143559 bm!15915) bm!15917))

(assert (= (and d!45829 res!68389) b!143561))

(assert (= (and d!45829 c!27176) b!143564))

(assert (= (and d!45829 (not c!27176)) b!143553))

(assert (= (and d!45829 res!68382) b!143556))

(assert (= (and b!143556 res!68383) b!143557))

(assert (= (and b!143556 (not res!68388)) b!143547))

(assert (= (and b!143547 res!68387) b!143562))

(assert (= (and b!143556 res!68385) b!143565))

(assert (= (and b!143565 c!27177) b!143549))

(assert (= (and b!143565 (not c!27177)) b!143548))

(assert (= (and b!143549 res!68386) b!143555))

(assert (= (or b!143549 b!143548) bm!15918))

(assert (= (and b!143565 res!68384) b!143546))

(assert (= (and b!143546 c!27180) b!143551))

(assert (= (and b!143546 (not c!27180)) b!143552))

(assert (= (and b!143551 res!68381) b!143560))

(assert (= (or b!143551 b!143552) bm!15920))

(declare-fun b_lambda!6439 () Bool)

(assert (=> (not b_lambda!6439) (not b!143562)))

(assert (=> b!143562 t!6370))

(declare-fun b_and!8951 () Bool)

(assert (= b_and!8947 (and (=> t!6370 result!4227) b_and!8951)))

(assert (=> b!143562 t!6372))

(declare-fun b_and!8953 () Bool)

(assert (= b_and!8949 (and (=> t!6372 result!4229) b_and!8953)))

(assert (=> d!45829 m!172933))

(declare-fun m!173155 () Bool)

(assert (=> bm!15917 m!173155))

(declare-fun m!173157 () Bool)

(assert (=> b!143559 m!173157))

(declare-fun m!173159 () Bool)

(assert (=> bm!15914 m!173159))

(declare-fun m!173161 () Bool)

(assert (=> b!143564 m!173161))

(declare-fun m!173163 () Bool)

(assert (=> b!143564 m!173163))

(declare-fun m!173165 () Bool)

(assert (=> b!143564 m!173165))

(declare-fun m!173167 () Bool)

(assert (=> b!143564 m!173167))

(assert (=> b!143564 m!173167))

(declare-fun m!173169 () Bool)

(assert (=> b!143564 m!173169))

(declare-fun m!173171 () Bool)

(assert (=> b!143564 m!173171))

(declare-fun m!173173 () Bool)

(assert (=> b!143564 m!173173))

(assert (=> b!143564 m!172935))

(declare-fun m!173175 () Bool)

(assert (=> b!143564 m!173175))

(declare-fun m!173177 () Bool)

(assert (=> b!143564 m!173177))

(assert (=> b!143564 m!173163))

(declare-fun m!173179 () Bool)

(assert (=> b!143564 m!173179))

(assert (=> b!143564 m!173159))

(declare-fun m!173181 () Bool)

(assert (=> b!143564 m!173181))

(declare-fun m!173183 () Bool)

(assert (=> b!143564 m!173183))

(declare-fun m!173185 () Bool)

(assert (=> b!143564 m!173185))

(assert (=> b!143564 m!173161))

(declare-fun m!173187 () Bool)

(assert (=> b!143564 m!173187))

(declare-fun m!173189 () Bool)

(assert (=> b!143564 m!173189))

(assert (=> b!143564 m!173183))

(declare-fun m!173191 () Bool)

(assert (=> b!143555 m!173191))

(declare-fun m!173193 () Bool)

(assert (=> b!143560 m!173193))

(assert (=> b!143547 m!172935))

(assert (=> b!143547 m!172935))

(declare-fun m!173195 () Bool)

(assert (=> b!143547 m!173195))

(declare-fun m!173197 () Bool)

(assert (=> bm!15918 m!173197))

(assert (=> b!143562 m!172935))

(declare-fun m!173199 () Bool)

(assert (=> b!143562 m!173199))

(declare-fun m!173201 () Bool)

(assert (=> b!143562 m!173201))

(assert (=> b!143562 m!173081))

(declare-fun m!173203 () Bool)

(assert (=> b!143562 m!173203))

(assert (=> b!143562 m!173081))

(assert (=> b!143562 m!172935))

(assert (=> b!143562 m!173201))

(assert (=> b!143557 m!172935))

(assert (=> b!143557 m!172935))

(assert (=> b!143557 m!172943))

(assert (=> b!143561 m!172935))

(assert (=> b!143561 m!172935))

(assert (=> b!143561 m!172943))

(declare-fun m!173205 () Bool)

(assert (=> bm!15920 m!173205))

(assert (=> b!143252 d!45829))

(declare-fun d!45831 () Bool)

(declare-fun e!93557 () Bool)

(assert (=> d!45831 e!93557))

(declare-fun res!68392 () Bool)

(assert (=> d!45831 (=> (not res!68392) (not e!93557))))

(assert (=> d!45831 (= res!68392 (and (bvsge (index!3285 lt!74998) #b00000000000000000000000000000000) (bvslt (index!3285 lt!74998) (size!2595 (_values!2946 newMap!16)))))))

(declare-fun lt!75207 () Unit!4535)

(declare-fun choose!872 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 32) (_ BitVec 64) V!3563 Int) Unit!4535)

(assert (=> d!45831 (= lt!75207 (choose!872 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (index!3285 lt!74998) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2963 newMap!16)))))

(assert (=> d!45831 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45831 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (index!3285 lt!74998) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2963 newMap!16)) lt!75207)))

(declare-fun b!143568 () Bool)

(assert (=> b!143568 (= e!93557 (= (+!180 (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!562 (_keys!4726 newMap!16) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (index!3285 lt!74998) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16))))))

(assert (= (and d!45831 res!68392) b!143568))

(assert (=> d!45831 m!172675))

(assert (=> d!45831 m!172685))

(declare-fun m!173207 () Bool)

(assert (=> d!45831 m!173207))

(assert (=> d!45831 m!172933))

(assert (=> b!143568 m!172849))

(assert (=> b!143568 m!172849))

(declare-fun m!173209 () Bool)

(assert (=> b!143568 m!173209))

(assert (=> b!143568 m!172799))

(assert (=> b!143568 m!172807))

(assert (=> b!143252 d!45831))

(declare-fun d!45833 () Bool)

(declare-fun e!93559 () Bool)

(assert (=> d!45833 e!93559))

(declare-fun res!68393 () Bool)

(assert (=> d!45833 (=> res!68393 e!93559)))

(declare-fun lt!75209 () Bool)

(assert (=> d!45833 (= res!68393 (not lt!75209))))

(declare-fun lt!75210 () Bool)

(assert (=> d!45833 (= lt!75209 lt!75210)))

(declare-fun lt!75211 () Unit!4535)

(declare-fun e!93558 () Unit!4535)

(assert (=> d!45833 (= lt!75211 e!93558)))

(declare-fun c!27182 () Bool)

(assert (=> d!45833 (= c!27182 lt!75210)))

(assert (=> d!45833 (= lt!75210 (containsKey!181 (toList!890 call!15857) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> d!45833 (= (contains!927 call!15857 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) lt!75209)))

(declare-fun b!143569 () Bool)

(declare-fun lt!75208 () Unit!4535)

(assert (=> b!143569 (= e!93558 lt!75208)))

(assert (=> b!143569 (= lt!75208 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 call!15857) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> b!143569 (isDefined!130 (getValueByKey!177 (toList!890 call!15857) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143570 () Bool)

(declare-fun Unit!4547 () Unit!4535)

(assert (=> b!143570 (= e!93558 Unit!4547)))

(declare-fun b!143571 () Bool)

(assert (=> b!143571 (= e!93559 (isDefined!130 (getValueByKey!177 (toList!890 call!15857) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))))

(assert (= (and d!45833 c!27182) b!143569))

(assert (= (and d!45833 (not c!27182)) b!143570))

(assert (= (and d!45833 (not res!68393)) b!143571))

(assert (=> d!45833 m!172675))

(declare-fun m!173211 () Bool)

(assert (=> d!45833 m!173211))

(assert (=> b!143569 m!172675))

(declare-fun m!173213 () Bool)

(assert (=> b!143569 m!173213))

(assert (=> b!143569 m!172675))

(declare-fun m!173215 () Bool)

(assert (=> b!143569 m!173215))

(assert (=> b!143569 m!173215))

(declare-fun m!173217 () Bool)

(assert (=> b!143569 m!173217))

(assert (=> b!143571 m!172675))

(assert (=> b!143571 m!173215))

(assert (=> b!143571 m!173215))

(assert (=> b!143571 m!173217))

(assert (=> b!143252 d!45833))

(declare-fun d!45835 () Bool)

(declare-fun e!93562 () Bool)

(assert (=> d!45835 e!93562))

(declare-fun c!27185 () Bool)

(assert (=> d!45835 (= c!27185 (and (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!45835 true))

(declare-fun _$29!168 () Unit!4535)

(assert (=> d!45835 (= (choose!869 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (_values!2946 (v!3297 (underlying!483 thiss!992))) (mask!7315 (v!3297 (underlying!483 thiss!992))) (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) (minValue!2811 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992)))) _$29!168)))

(declare-fun b!143576 () Bool)

(assert (=> b!143576 (= e!93562 (arrayContainsKey!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!143577 () Bool)

(assert (=> b!143577 (= e!93562 (ite (= (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2714 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!45835 c!27185) b!143576))

(assert (= (and d!45835 (not c!27185)) b!143577))

(assert (=> b!143576 m!172675))

(assert (=> b!143576 m!172697))

(assert (=> d!45755 d!45835))

(declare-fun d!45837 () Bool)

(assert (=> d!45837 (= (validMask!0 (mask!7315 (v!3297 (underlying!483 thiss!992)))) (and (or (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000001111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000011111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000001111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000011111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000001111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000011111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000001111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000011111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000000111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000001111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000011111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000000111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000001111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000011111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000000111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000001111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000011111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000000111111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000001111111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000011111111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00000111111111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00001111111111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00011111111111111111111111111111) (= (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7315 (v!3297 (underlying!483 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!45755 d!45837))

(assert (=> d!45751 d!45749))

(declare-fun d!45839 () Bool)

(assert (=> d!45839 (arrayNoDuplicates!0 (_keys!4726 (v!3297 (underlying!483 thiss!992))) from!355 Nil!1746)))

(assert (=> d!45839 true))

(declare-fun _$71!168 () Unit!4535)

(assert (=> d!45839 (= (choose!39 (_keys!4726 (v!3297 (underlying!483 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!168)))

(declare-fun bs!6068 () Bool)

(assert (= bs!6068 d!45839))

(assert (=> bs!6068 m!172693))

(assert (=> d!45751 d!45839))

(declare-fun bm!15921 () Bool)

(declare-fun call!15927 () ListLongMap!1749)

(assert (=> bm!15921 (= call!15927 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun b!143578 () Bool)

(declare-fun e!93573 () ListLongMap!1749)

(declare-fun call!15928 () ListLongMap!1749)

(assert (=> b!143578 (= e!93573 call!15928)))

(declare-fun b!143579 () Bool)

(declare-fun e!93563 () Bool)

(declare-fun e!93565 () Bool)

(assert (=> b!143579 (= e!93563 e!93565)))

(declare-fun c!27190 () Bool)

(assert (=> b!143579 (= c!27190 (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!143580 () Bool)

(declare-fun e!93572 () Bool)

(declare-fun e!93566 () Bool)

(assert (=> b!143580 (= e!93572 e!93566)))

(declare-fun res!68400 () Bool)

(assert (=> b!143580 (=> (not res!68400) (not e!93566))))

(declare-fun lt!75230 () ListLongMap!1749)

(assert (=> b!143580 (= res!68400 (contains!927 lt!75230 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!143580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15922 () Bool)

(declare-fun call!15926 () ListLongMap!1749)

(declare-fun call!15925 () ListLongMap!1749)

(assert (=> bm!15922 (= call!15926 call!15925)))

(declare-fun d!45841 () Bool)

(assert (=> d!45841 e!93563))

(declare-fun res!68395 () Bool)

(assert (=> d!45841 (=> (not res!68395) (not e!93563))))

(assert (=> d!45841 (= res!68395 (or (bvsge #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))))

(declare-fun lt!75221 () ListLongMap!1749)

(assert (=> d!45841 (= lt!75230 lt!75221)))

(declare-fun lt!75227 () Unit!4535)

(declare-fun e!93571 () Unit!4535)

(assert (=> d!45841 (= lt!75227 e!93571)))

(declare-fun c!27186 () Bool)

(declare-fun e!93569 () Bool)

(assert (=> d!45841 (= c!27186 e!93569)))

(declare-fun res!68402 () Bool)

(assert (=> d!45841 (=> (not res!68402) (not e!93569))))

(assert (=> d!45841 (= res!68402 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun e!93574 () ListLongMap!1749)

(assert (=> d!45841 (= lt!75221 e!93574)))

(declare-fun c!27189 () Bool)

(assert (=> d!45841 (= c!27189 (and (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!45841 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45841 (= (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) lt!75230)))

(declare-fun b!143581 () Bool)

(declare-fun e!93567 () Bool)

(declare-fun call!15930 () Bool)

(assert (=> b!143581 (= e!93567 (not call!15930))))

(declare-fun b!143582 () Bool)

(declare-fun e!93570 () Bool)

(assert (=> b!143582 (= e!93567 e!93570)))

(declare-fun res!68399 () Bool)

(assert (=> b!143582 (= res!68399 call!15930)))

(assert (=> b!143582 (=> (not res!68399) (not e!93570))))

(declare-fun b!143583 () Bool)

(declare-fun e!93564 () ListLongMap!1749)

(assert (=> b!143583 (= e!93564 call!15926)))

(declare-fun b!143584 () Bool)

(declare-fun e!93568 () Bool)

(assert (=> b!143584 (= e!93565 e!93568)))

(declare-fun res!68394 () Bool)

(declare-fun call!15929 () Bool)

(assert (=> b!143584 (= res!68394 call!15929)))

(assert (=> b!143584 (=> (not res!68394) (not e!93568))))

(declare-fun b!143585 () Bool)

(assert (=> b!143585 (= e!93565 (not call!15929))))

(declare-fun b!143586 () Bool)

(declare-fun Unit!4548 () Unit!4535)

(assert (=> b!143586 (= e!93571 Unit!4548)))

(declare-fun bm!15923 () Bool)

(declare-fun call!15924 () ListLongMap!1749)

(assert (=> bm!15923 (= call!15928 call!15924)))

(declare-fun b!143587 () Bool)

(assert (=> b!143587 (= e!93574 e!93564)))

(declare-fun c!27191 () Bool)

(assert (=> b!143587 (= c!27191 (and (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!15924 () Bool)

(assert (=> bm!15924 (= call!15925 (+!180 (ite c!27189 call!15927 (ite c!27191 call!15924 call!15928)) (ite (or c!27189 c!27191) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 newMap!16)) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 newMap!16)))))))

(declare-fun b!143588 () Bool)

(assert (=> b!143588 (= e!93570 (= (apply!121 lt!75230 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2811 newMap!16)))))

(declare-fun bm!15925 () Bool)

(assert (=> bm!15925 (= call!15930 (contains!927 lt!75230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143589 () Bool)

(declare-fun res!68398 () Bool)

(assert (=> b!143589 (=> (not res!68398) (not e!93563))))

(assert (=> b!143589 (= res!68398 e!93572)))

(declare-fun res!68401 () Bool)

(assert (=> b!143589 (=> res!68401 e!93572)))

(declare-fun e!93575 () Bool)

(assert (=> b!143589 (= res!68401 (not e!93575))))

(declare-fun res!68396 () Bool)

(assert (=> b!143589 (=> (not res!68396) (not e!93575))))

(assert (=> b!143589 (= res!68396 (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun b!143590 () Bool)

(assert (=> b!143590 (= e!93575 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143591 () Bool)

(declare-fun c!27188 () Bool)

(assert (=> b!143591 (= c!27188 (and (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!143591 (= e!93564 e!93573)))

(declare-fun b!143592 () Bool)

(assert (=> b!143592 (= e!93574 (+!180 call!15925 (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 newMap!16))))))

(declare-fun b!143593 () Bool)

(assert (=> b!143593 (= e!93568 (= (apply!121 lt!75230 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2811 newMap!16)))))

(declare-fun b!143594 () Bool)

(assert (=> b!143594 (= e!93569 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143595 () Bool)

(assert (=> b!143595 (= e!93566 (= (apply!121 lt!75230 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)) (get!1535 (select (arr!2322 (_values!2946 newMap!16)) #b00000000000000000000000000000000) (dynLambda!444 (defaultEntry!2963 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!143595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2595 (_values!2946 newMap!16))))))

(assert (=> b!143595 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(declare-fun bm!15926 () Bool)

(assert (=> bm!15926 (= call!15924 call!15927)))

(declare-fun b!143596 () Bool)

(assert (=> b!143596 (= e!93573 call!15926)))

(declare-fun bm!15927 () Bool)

(assert (=> bm!15927 (= call!15929 (contains!927 lt!75230 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143597 () Bool)

(declare-fun lt!75224 () Unit!4535)

(assert (=> b!143597 (= e!93571 lt!75224)))

(declare-fun lt!75218 () ListLongMap!1749)

(assert (=> b!143597 (= lt!75218 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75217 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75217 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75214 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75214 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75222 () Unit!4535)

(assert (=> b!143597 (= lt!75222 (addStillContains!97 lt!75218 lt!75217 (zeroValue!2811 newMap!16) lt!75214))))

(assert (=> b!143597 (contains!927 (+!180 lt!75218 (tuple2!2707 lt!75217 (zeroValue!2811 newMap!16))) lt!75214)))

(declare-fun lt!75223 () Unit!4535)

(assert (=> b!143597 (= lt!75223 lt!75222)))

(declare-fun lt!75231 () ListLongMap!1749)

(assert (=> b!143597 (= lt!75231 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75228 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75228 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75216 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75216 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75229 () Unit!4535)

(assert (=> b!143597 (= lt!75229 (addApplyDifferent!97 lt!75231 lt!75228 (minValue!2811 newMap!16) lt!75216))))

(assert (=> b!143597 (= (apply!121 (+!180 lt!75231 (tuple2!2707 lt!75228 (minValue!2811 newMap!16))) lt!75216) (apply!121 lt!75231 lt!75216))))

(declare-fun lt!75213 () Unit!4535)

(assert (=> b!143597 (= lt!75213 lt!75229)))

(declare-fun lt!75232 () ListLongMap!1749)

(assert (=> b!143597 (= lt!75232 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75212 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75212 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75215 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75215 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!75219 () Unit!4535)

(assert (=> b!143597 (= lt!75219 (addApplyDifferent!97 lt!75232 lt!75212 (zeroValue!2811 newMap!16) lt!75215))))

(assert (=> b!143597 (= (apply!121 (+!180 lt!75232 (tuple2!2707 lt!75212 (zeroValue!2811 newMap!16))) lt!75215) (apply!121 lt!75232 lt!75215))))

(declare-fun lt!75226 () Unit!4535)

(assert (=> b!143597 (= lt!75226 lt!75219)))

(declare-fun lt!75225 () ListLongMap!1749)

(assert (=> b!143597 (= lt!75225 (getCurrentListMapNoExtraKeys!146 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75220 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75220 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!75233 () (_ BitVec 64))

(assert (=> b!143597 (= lt!75233 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!143597 (= lt!75224 (addApplyDifferent!97 lt!75225 lt!75220 (minValue!2811 newMap!16) lt!75233))))

(assert (=> b!143597 (= (apply!121 (+!180 lt!75225 (tuple2!2707 lt!75220 (minValue!2811 newMap!16))) lt!75233) (apply!121 lt!75225 lt!75233))))

(declare-fun b!143598 () Bool)

(declare-fun res!68397 () Bool)

(assert (=> b!143598 (=> (not res!68397) (not e!93563))))

(assert (=> b!143598 (= res!68397 e!93567)))

(declare-fun c!27187 () Bool)

(assert (=> b!143598 (= c!27187 (not (= (bvand (extraKeys!2714 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!45841 c!27189) b!143592))

(assert (= (and d!45841 (not c!27189)) b!143587))

(assert (= (and b!143587 c!27191) b!143583))

(assert (= (and b!143587 (not c!27191)) b!143591))

(assert (= (and b!143591 c!27188) b!143596))

(assert (= (and b!143591 (not c!27188)) b!143578))

(assert (= (or b!143596 b!143578) bm!15923))

(assert (= (or b!143583 bm!15923) bm!15926))

(assert (= (or b!143583 b!143596) bm!15922))

(assert (= (or b!143592 bm!15926) bm!15921))

(assert (= (or b!143592 bm!15922) bm!15924))

(assert (= (and d!45841 res!68402) b!143594))

(assert (= (and d!45841 c!27186) b!143597))

(assert (= (and d!45841 (not c!27186)) b!143586))

(assert (= (and d!45841 res!68395) b!143589))

(assert (= (and b!143589 res!68396) b!143590))

(assert (= (and b!143589 (not res!68401)) b!143580))

(assert (= (and b!143580 res!68400) b!143595))

(assert (= (and b!143589 res!68398) b!143598))

(assert (= (and b!143598 c!27187) b!143582))

(assert (= (and b!143598 (not c!27187)) b!143581))

(assert (= (and b!143582 res!68399) b!143588))

(assert (= (or b!143582 b!143581) bm!15925))

(assert (= (and b!143598 res!68397) b!143579))

(assert (= (and b!143579 c!27190) b!143584))

(assert (= (and b!143579 (not c!27190)) b!143585))

(assert (= (and b!143584 res!68394) b!143593))

(assert (= (or b!143584 b!143585) bm!15927))

(declare-fun b_lambda!6441 () Bool)

(assert (=> (not b_lambda!6441) (not b!143595)))

(assert (=> b!143595 t!6370))

(declare-fun b_and!8955 () Bool)

(assert (= b_and!8951 (and (=> t!6370 result!4227) b_and!8955)))

(assert (=> b!143595 t!6372))

(declare-fun b_and!8957 () Bool)

(assert (= b_and!8953 (and (=> t!6372 result!4229) b_and!8957)))

(assert (=> d!45841 m!172933))

(declare-fun m!173219 () Bool)

(assert (=> bm!15924 m!173219))

(declare-fun m!173221 () Bool)

(assert (=> b!143592 m!173221))

(declare-fun m!173223 () Bool)

(assert (=> bm!15921 m!173223))

(declare-fun m!173225 () Bool)

(assert (=> b!143597 m!173225))

(declare-fun m!173227 () Bool)

(assert (=> b!143597 m!173227))

(declare-fun m!173229 () Bool)

(assert (=> b!143597 m!173229))

(declare-fun m!173231 () Bool)

(assert (=> b!143597 m!173231))

(assert (=> b!143597 m!173231))

(declare-fun m!173233 () Bool)

(assert (=> b!143597 m!173233))

(declare-fun m!173235 () Bool)

(assert (=> b!143597 m!173235))

(declare-fun m!173237 () Bool)

(assert (=> b!143597 m!173237))

(assert (=> b!143597 m!172935))

(declare-fun m!173239 () Bool)

(assert (=> b!143597 m!173239))

(declare-fun m!173241 () Bool)

(assert (=> b!143597 m!173241))

(assert (=> b!143597 m!173227))

(declare-fun m!173243 () Bool)

(assert (=> b!143597 m!173243))

(assert (=> b!143597 m!173223))

(declare-fun m!173245 () Bool)

(assert (=> b!143597 m!173245))

(declare-fun m!173247 () Bool)

(assert (=> b!143597 m!173247))

(declare-fun m!173249 () Bool)

(assert (=> b!143597 m!173249))

(assert (=> b!143597 m!173225))

(declare-fun m!173251 () Bool)

(assert (=> b!143597 m!173251))

(declare-fun m!173253 () Bool)

(assert (=> b!143597 m!173253))

(assert (=> b!143597 m!173247))

(declare-fun m!173255 () Bool)

(assert (=> b!143588 m!173255))

(declare-fun m!173257 () Bool)

(assert (=> b!143593 m!173257))

(assert (=> b!143580 m!172935))

(assert (=> b!143580 m!172935))

(declare-fun m!173259 () Bool)

(assert (=> b!143580 m!173259))

(declare-fun m!173261 () Bool)

(assert (=> bm!15925 m!173261))

(assert (=> b!143595 m!172935))

(declare-fun m!173263 () Bool)

(assert (=> b!143595 m!173263))

(assert (=> b!143595 m!173079))

(assert (=> b!143595 m!173081))

(assert (=> b!143595 m!173083))

(assert (=> b!143595 m!173081))

(assert (=> b!143595 m!172935))

(assert (=> b!143595 m!173079))

(assert (=> b!143590 m!172935))

(assert (=> b!143590 m!172935))

(assert (=> b!143590 m!172943))

(assert (=> b!143594 m!172935))

(assert (=> b!143594 m!172935))

(assert (=> b!143594 m!172943))

(declare-fun m!173265 () Bool)

(assert (=> bm!15927 m!173265))

(assert (=> d!45773 d!45841))

(declare-fun d!45843 () Bool)

(assert (=> d!45843 (isDefined!130 (getValueByKey!177 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun lt!75236 () Unit!4535)

(declare-fun choose!873 (List!1750 (_ BitVec 64)) Unit!4535)

(assert (=> d!45843 (= lt!75236 (choose!873 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun e!93578 () Bool)

(assert (=> d!45843 e!93578))

(declare-fun res!68405 () Bool)

(assert (=> d!45843 (=> (not res!68405) (not e!93578))))

(declare-fun isStrictlySorted!326 (List!1750) Bool)

(assert (=> d!45843 (= res!68405 (isStrictlySorted!326 (toList!890 lt!74887)))))

(assert (=> d!45843 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) lt!75236)))

(declare-fun b!143601 () Bool)

(assert (=> b!143601 (= e!93578 (containsKey!181 (toList!890 lt!74887) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (= (and d!45843 res!68405) b!143601))

(assert (=> d!45843 m!172675))

(assert (=> d!45843 m!172781))

(assert (=> d!45843 m!172781))

(assert (=> d!45843 m!172783))

(assert (=> d!45843 m!172675))

(declare-fun m!173267 () Bool)

(assert (=> d!45843 m!173267))

(declare-fun m!173269 () Bool)

(assert (=> d!45843 m!173269))

(assert (=> b!143601 m!172675))

(assert (=> b!143601 m!172777))

(assert (=> b!143151 d!45843))

(assert (=> b!143151 d!45817))

(assert (=> b!143151 d!45819))

(declare-fun d!45845 () Bool)

(declare-fun e!93580 () Bool)

(assert (=> d!45845 e!93580))

(declare-fun res!68406 () Bool)

(assert (=> d!45845 (=> res!68406 e!93580)))

(declare-fun lt!75238 () Bool)

(assert (=> d!45845 (= res!68406 (not lt!75238))))

(declare-fun lt!75239 () Bool)

(assert (=> d!45845 (= lt!75238 lt!75239)))

(declare-fun lt!75240 () Unit!4535)

(declare-fun e!93579 () Unit!4535)

(assert (=> d!45845 (= lt!75240 e!93579)))

(declare-fun c!27192 () Bool)

(assert (=> d!45845 (= c!27192 lt!75239)))

(assert (=> d!45845 (= lt!75239 (containsKey!181 (toList!890 lt!75064) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!45845 (= (contains!927 lt!75064 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!75238)))

(declare-fun b!143602 () Bool)

(declare-fun lt!75237 () Unit!4535)

(assert (=> b!143602 (= e!93579 lt!75237)))

(assert (=> b!143602 (= lt!75237 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 lt!75064) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!143602 (isDefined!130 (getValueByKey!177 (toList!890 lt!75064) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!143603 () Bool)

(declare-fun Unit!4549 () Unit!4535)

(assert (=> b!143603 (= e!93579 Unit!4549)))

(declare-fun b!143604 () Bool)

(assert (=> b!143604 (= e!93580 (isDefined!130 (getValueByKey!177 (toList!890 lt!75064) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!45845 c!27192) b!143602))

(assert (= (and d!45845 (not c!27192)) b!143603))

(assert (= (and d!45845 (not res!68406)) b!143604))

(assert (=> d!45845 m!172769))

(declare-fun m!173271 () Bool)

(assert (=> d!45845 m!173271))

(assert (=> b!143602 m!172769))

(declare-fun m!173273 () Bool)

(assert (=> b!143602 m!173273))

(assert (=> b!143602 m!172769))

(declare-fun m!173275 () Bool)

(assert (=> b!143602 m!173275))

(assert (=> b!143602 m!173275))

(declare-fun m!173277 () Bool)

(assert (=> b!143602 m!173277))

(assert (=> b!143604 m!172769))

(assert (=> b!143604 m!173275))

(assert (=> b!143604 m!173275))

(assert (=> b!143604 m!173277))

(assert (=> b!143318 d!45845))

(declare-fun d!45847 () Bool)

(assert (=> d!45847 (= (+!180 (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) lt!74977 (zeroValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75243 () Unit!4535)

(declare-fun choose!874 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 V!3563 Int) Unit!4535)

(assert (=> d!45847 (= lt!75243 (choose!874 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) lt!74977 (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2963 newMap!16)))))

(assert (=> d!45847 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45847 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) lt!74977 (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2963 newMap!16)) lt!75243)))

(declare-fun bs!6069 () Bool)

(assert (= bs!6069 d!45847))

(assert (=> bs!6069 m!172685))

(declare-fun m!173279 () Bool)

(assert (=> bs!6069 m!173279))

(assert (=> bs!6069 m!172849))

(declare-fun m!173281 () Bool)

(assert (=> bs!6069 m!173281))

(assert (=> bs!6069 m!172685))

(declare-fun m!173283 () Bool)

(assert (=> bs!6069 m!173283))

(assert (=> bs!6069 m!172849))

(assert (=> bs!6069 m!172933))

(assert (=> b!143235 d!45847))

(declare-fun d!45849 () Bool)

(assert (=> d!45849 (= (apply!121 lt!75064 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1538 (getValueByKey!177 (toList!890 lt!75064) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6070 () Bool)

(assert (= bs!6070 d!45849))

(assert (=> bs!6070 m!172769))

(assert (=> bs!6070 m!173275))

(assert (=> bs!6070 m!173275))

(declare-fun m!173285 () Bool)

(assert (=> bs!6070 m!173285))

(assert (=> b!143333 d!45849))

(declare-fun d!45851 () Bool)

(declare-fun c!27193 () Bool)

(assert (=> d!45851 (= c!27193 ((_ is ValueCellFull!1125) (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!93581 () V!3563)

(assert (=> d!45851 (= (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!93581)))

(declare-fun b!143605 () Bool)

(assert (=> b!143605 (= e!93581 (get!1536 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!143606 () Bool)

(assert (=> b!143606 (= e!93581 (get!1537 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45851 c!27193) b!143605))

(assert (= (and d!45851 (not c!27193)) b!143606))

(assert (=> b!143605 m!172897))

(assert (=> b!143605 m!172683))

(declare-fun m!173287 () Bool)

(assert (=> b!143605 m!173287))

(assert (=> b!143606 m!172897))

(assert (=> b!143606 m!172683))

(declare-fun m!173289 () Bool)

(assert (=> b!143606 m!173289))

(assert (=> b!143333 d!45851))

(declare-fun bm!15930 () Bool)

(declare-fun call!15933 () (_ BitVec 32))

(assert (=> bm!15930 (= call!15933 (arrayCountValidKeys!0 (_keys!4726 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2594 (_keys!4726 newMap!16))))))

(declare-fun d!45853 () Bool)

(declare-fun lt!75246 () (_ BitVec 32))

(assert (=> d!45853 (and (bvsge lt!75246 #b00000000000000000000000000000000) (bvsle lt!75246 (bvsub (size!2594 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!93587 () (_ BitVec 32))

(assert (=> d!45853 (= lt!75246 e!93587)))

(declare-fun c!27199 () Bool)

(assert (=> d!45853 (= c!27199 (bvsge #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(assert (=> d!45853 (and (bvsle #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2594 (_keys!4726 newMap!16)) (size!2594 (_keys!4726 newMap!16))))))

(assert (=> d!45853 (= (arrayCountValidKeys!0 (_keys!4726 newMap!16) #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) lt!75246)))

(declare-fun b!143615 () Bool)

(declare-fun e!93586 () (_ BitVec 32))

(assert (=> b!143615 (= e!93587 e!93586)))

(declare-fun c!27198 () Bool)

(assert (=> b!143615 (= c!27198 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143616 () Bool)

(assert (=> b!143616 (= e!93587 #b00000000000000000000000000000000)))

(declare-fun b!143617 () Bool)

(assert (=> b!143617 (= e!93586 call!15933)))

(declare-fun b!143618 () Bool)

(assert (=> b!143618 (= e!93586 (bvadd #b00000000000000000000000000000001 call!15933))))

(assert (= (and d!45853 c!27199) b!143616))

(assert (= (and d!45853 (not c!27199)) b!143615))

(assert (= (and b!143615 c!27198) b!143618))

(assert (= (and b!143615 (not c!27198)) b!143617))

(assert (= (or b!143618 b!143617) bm!15930))

(declare-fun m!173291 () Bool)

(assert (=> bm!15930 m!173291))

(assert (=> b!143615 m!172935))

(assert (=> b!143615 m!172935))

(assert (=> b!143615 m!172943))

(assert (=> b!143115 d!45853))

(declare-fun d!45855 () Bool)

(declare-fun e!93588 () Bool)

(assert (=> d!45855 e!93588))

(declare-fun res!68407 () Bool)

(assert (=> d!45855 (=> (not res!68407) (not e!93588))))

(declare-fun lt!75250 () ListLongMap!1749)

(assert (=> d!45855 (= res!68407 (contains!927 lt!75250 (_1!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun lt!75249 () List!1750)

(assert (=> d!45855 (= lt!75250 (ListLongMap!1750 lt!75249))))

(declare-fun lt!75247 () Unit!4535)

(declare-fun lt!75248 () Unit!4535)

(assert (=> d!45855 (= lt!75247 lt!75248)))

(assert (=> d!45855 (= (getValueByKey!177 lt!75249 (_1!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45855 (= lt!75248 (lemmaContainsTupThenGetReturnValue!91 lt!75249 (_1!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45855 (= lt!75249 (insertStrictlySorted!94 (toList!890 lt!75052) (_1!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45855 (= (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75250)))

(declare-fun b!143619 () Bool)

(declare-fun res!68408 () Bool)

(assert (=> b!143619 (=> (not res!68408) (not e!93588))))

(assert (=> b!143619 (= res!68408 (= (getValueByKey!177 (toList!890 lt!75250) (_1!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(declare-fun b!143620 () Bool)

(assert (=> b!143620 (= e!93588 (contains!929 (toList!890 lt!75250) (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))))))

(assert (= (and d!45855 res!68407) b!143619))

(assert (= (and b!143619 res!68408) b!143620))

(declare-fun m!173293 () Bool)

(assert (=> d!45855 m!173293))

(declare-fun m!173295 () Bool)

(assert (=> d!45855 m!173295))

(declare-fun m!173297 () Bool)

(assert (=> d!45855 m!173297))

(declare-fun m!173299 () Bool)

(assert (=> d!45855 m!173299))

(declare-fun m!173301 () Bool)

(assert (=> b!143619 m!173301))

(declare-fun m!173303 () Bool)

(assert (=> b!143620 m!173303))

(assert (=> b!143335 d!45855))

(declare-fun d!45857 () Bool)

(assert (=> d!45857 (= (apply!121 (+!180 lt!75066 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75049) (get!1538 (getValueByKey!177 (toList!890 (+!180 lt!75066 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75049)))))

(declare-fun bs!6071 () Bool)

(assert (= bs!6071 d!45857))

(declare-fun m!173305 () Bool)

(assert (=> bs!6071 m!173305))

(assert (=> bs!6071 m!173305))

(declare-fun m!173307 () Bool)

(assert (=> bs!6071 m!173307))

(assert (=> b!143335 d!45857))

(declare-fun d!45859 () Bool)

(assert (=> d!45859 (= (apply!121 (+!180 lt!75059 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75067) (apply!121 lt!75059 lt!75067))))

(declare-fun lt!75253 () Unit!4535)

(declare-fun choose!875 (ListLongMap!1749 (_ BitVec 64) V!3563 (_ BitVec 64)) Unit!4535)

(assert (=> d!45859 (= lt!75253 (choose!875 lt!75059 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75067))))

(declare-fun e!93591 () Bool)

(assert (=> d!45859 e!93591))

(declare-fun res!68411 () Bool)

(assert (=> d!45859 (=> (not res!68411) (not e!93591))))

(assert (=> d!45859 (= res!68411 (contains!927 lt!75059 lt!75067))))

(assert (=> d!45859 (= (addApplyDifferent!97 lt!75059 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75067) lt!75253)))

(declare-fun b!143624 () Bool)

(assert (=> b!143624 (= e!93591 (not (= lt!75067 lt!75054)))))

(assert (= (and d!45859 res!68411) b!143624))

(assert (=> d!45859 m!172859))

(declare-fun m!173309 () Bool)

(assert (=> d!45859 m!173309))

(declare-fun m!173311 () Bool)

(assert (=> d!45859 m!173311))

(assert (=> d!45859 m!172859))

(assert (=> d!45859 m!172875))

(assert (=> d!45859 m!172877))

(assert (=> b!143335 d!45859))

(declare-fun d!45861 () Bool)

(assert (=> d!45861 (= (apply!121 (+!180 lt!75059 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75067) (get!1538 (getValueByKey!177 (toList!890 (+!180 lt!75059 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75067)))))

(declare-fun bs!6072 () Bool)

(assert (= bs!6072 d!45861))

(declare-fun m!173313 () Bool)

(assert (=> bs!6072 m!173313))

(assert (=> bs!6072 m!173313))

(declare-fun m!173315 () Bool)

(assert (=> bs!6072 m!173315))

(assert (=> b!143335 d!45861))

(declare-fun d!45863 () Bool)

(assert (=> d!45863 (= (apply!121 lt!75065 lt!75050) (get!1538 (getValueByKey!177 (toList!890 lt!75065) lt!75050)))))

(declare-fun bs!6073 () Bool)

(assert (= bs!6073 d!45863))

(declare-fun m!173317 () Bool)

(assert (=> bs!6073 m!173317))

(assert (=> bs!6073 m!173317))

(declare-fun m!173319 () Bool)

(assert (=> bs!6073 m!173319))

(assert (=> b!143335 d!45863))

(declare-fun d!45865 () Bool)

(declare-fun e!93593 () Bool)

(assert (=> d!45865 e!93593))

(declare-fun res!68412 () Bool)

(assert (=> d!45865 (=> res!68412 e!93593)))

(declare-fun lt!75255 () Bool)

(assert (=> d!45865 (= res!68412 (not lt!75255))))

(declare-fun lt!75256 () Bool)

(assert (=> d!45865 (= lt!75255 lt!75256)))

(declare-fun lt!75257 () Unit!4535)

(declare-fun e!93592 () Unit!4535)

(assert (=> d!45865 (= lt!75257 e!93592)))

(declare-fun c!27200 () Bool)

(assert (=> d!45865 (= c!27200 lt!75256)))

(assert (=> d!45865 (= lt!75256 (containsKey!181 (toList!890 (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75048))))

(assert (=> d!45865 (= (contains!927 (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75048) lt!75255)))

(declare-fun b!143625 () Bool)

(declare-fun lt!75254 () Unit!4535)

(assert (=> b!143625 (= e!93592 lt!75254)))

(assert (=> b!143625 (= lt!75254 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75048))))

(assert (=> b!143625 (isDefined!130 (getValueByKey!177 (toList!890 (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75048))))

(declare-fun b!143626 () Bool)

(declare-fun Unit!4550 () Unit!4535)

(assert (=> b!143626 (= e!93592 Unit!4550)))

(declare-fun b!143627 () Bool)

(assert (=> b!143627 (= e!93593 (isDefined!130 (getValueByKey!177 (toList!890 (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75048)))))

(assert (= (and d!45865 c!27200) b!143625))

(assert (= (and d!45865 (not c!27200)) b!143626))

(assert (= (and d!45865 (not res!68412)) b!143627))

(declare-fun m!173321 () Bool)

(assert (=> d!45865 m!173321))

(declare-fun m!173323 () Bool)

(assert (=> b!143625 m!173323))

(declare-fun m!173325 () Bool)

(assert (=> b!143625 m!173325))

(assert (=> b!143625 m!173325))

(declare-fun m!173327 () Bool)

(assert (=> b!143625 m!173327))

(assert (=> b!143627 m!173325))

(assert (=> b!143627 m!173325))

(assert (=> b!143627 m!173327))

(assert (=> b!143335 d!45865))

(declare-fun d!45867 () Bool)

(declare-fun e!93594 () Bool)

(assert (=> d!45867 e!93594))

(declare-fun res!68413 () Bool)

(assert (=> d!45867 (=> (not res!68413) (not e!93594))))

(declare-fun lt!75261 () ListLongMap!1749)

(assert (=> d!45867 (= res!68413 (contains!927 lt!75261 (_1!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun lt!75260 () List!1750)

(assert (=> d!45867 (= lt!75261 (ListLongMap!1750 lt!75260))))

(declare-fun lt!75258 () Unit!4535)

(declare-fun lt!75259 () Unit!4535)

(assert (=> d!45867 (= lt!75258 lt!75259)))

(assert (=> d!45867 (= (getValueByKey!177 lt!75260 (_1!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45867 (= lt!75259 (lemmaContainsTupThenGetReturnValue!91 lt!75260 (_1!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45867 (= lt!75260 (insertStrictlySorted!94 (toList!890 lt!75065) (_1!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45867 (= (+!180 lt!75065 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75261)))

(declare-fun b!143628 () Bool)

(declare-fun res!68414 () Bool)

(assert (=> b!143628 (=> (not res!68414) (not e!93594))))

(assert (=> b!143628 (= res!68414 (= (getValueByKey!177 (toList!890 lt!75261) (_1!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(declare-fun b!143629 () Bool)

(assert (=> b!143629 (= e!93594 (contains!929 (toList!890 lt!75261) (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))

(assert (= (and d!45867 res!68413) b!143628))

(assert (= (and b!143628 res!68414) b!143629))

(declare-fun m!173329 () Bool)

(assert (=> d!45867 m!173329))

(declare-fun m!173331 () Bool)

(assert (=> d!45867 m!173331))

(declare-fun m!173333 () Bool)

(assert (=> d!45867 m!173333))

(declare-fun m!173335 () Bool)

(assert (=> d!45867 m!173335))

(declare-fun m!173337 () Bool)

(assert (=> b!143628 m!173337))

(declare-fun m!173339 () Bool)

(assert (=> b!143629 m!173339))

(assert (=> b!143335 d!45867))

(declare-fun d!45869 () Bool)

(assert (=> d!45869 (= (apply!121 lt!75066 lt!75049) (get!1538 (getValueByKey!177 (toList!890 lt!75066) lt!75049)))))

(declare-fun bs!6074 () Bool)

(assert (= bs!6074 d!45869))

(declare-fun m!173341 () Bool)

(assert (=> bs!6074 m!173341))

(assert (=> bs!6074 m!173341))

(declare-fun m!173343 () Bool)

(assert (=> bs!6074 m!173343))

(assert (=> b!143335 d!45869))

(declare-fun d!45871 () Bool)

(assert (=> d!45871 (= (apply!121 (+!180 lt!75065 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75050) (apply!121 lt!75065 lt!75050))))

(declare-fun lt!75262 () Unit!4535)

(assert (=> d!45871 (= lt!75262 (choose!875 lt!75065 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75050))))

(declare-fun e!93595 () Bool)

(assert (=> d!45871 e!93595))

(declare-fun res!68415 () Bool)

(assert (=> d!45871 (=> (not res!68415) (not e!93595))))

(assert (=> d!45871 (= res!68415 (contains!927 lt!75065 lt!75050))))

(assert (=> d!45871 (= (addApplyDifferent!97 lt!75065 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75050) lt!75262)))

(declare-fun b!143630 () Bool)

(assert (=> b!143630 (= e!93595 (not (= lt!75050 lt!75062)))))

(assert (= (and d!45871 res!68415) b!143630))

(assert (=> d!45871 m!172863))

(declare-fun m!173345 () Bool)

(assert (=> d!45871 m!173345))

(declare-fun m!173347 () Bool)

(assert (=> d!45871 m!173347))

(assert (=> d!45871 m!172863))

(assert (=> d!45871 m!172865))

(assert (=> d!45871 m!172871))

(assert (=> b!143335 d!45871))

(declare-fun d!45873 () Bool)

(assert (=> d!45873 (= (apply!121 lt!75059 lt!75067) (get!1538 (getValueByKey!177 (toList!890 lt!75059) lt!75067)))))

(declare-fun bs!6075 () Bool)

(assert (= bs!6075 d!45873))

(declare-fun m!173349 () Bool)

(assert (=> bs!6075 m!173349))

(assert (=> bs!6075 m!173349))

(declare-fun m!173351 () Bool)

(assert (=> bs!6075 m!173351))

(assert (=> b!143335 d!45873))

(declare-fun d!45875 () Bool)

(declare-fun e!93596 () Bool)

(assert (=> d!45875 e!93596))

(declare-fun res!68416 () Bool)

(assert (=> d!45875 (=> (not res!68416) (not e!93596))))

(declare-fun lt!75266 () ListLongMap!1749)

(assert (=> d!45875 (= res!68416 (contains!927 lt!75266 (_1!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun lt!75265 () List!1750)

(assert (=> d!45875 (= lt!75266 (ListLongMap!1750 lt!75265))))

(declare-fun lt!75263 () Unit!4535)

(declare-fun lt!75264 () Unit!4535)

(assert (=> d!45875 (= lt!75263 lt!75264)))

(assert (=> d!45875 (= (getValueByKey!177 lt!75265 (_1!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45875 (= lt!75264 (lemmaContainsTupThenGetReturnValue!91 lt!75265 (_1!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45875 (= lt!75265 (insertStrictlySorted!94 (toList!890 lt!75066) (_1!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45875 (= (+!180 lt!75066 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75266)))

(declare-fun b!143631 () Bool)

(declare-fun res!68417 () Bool)

(assert (=> b!143631 (=> (not res!68417) (not e!93596))))

(assert (=> b!143631 (= res!68417 (= (getValueByKey!177 (toList!890 lt!75266) (_1!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(declare-fun b!143632 () Bool)

(assert (=> b!143632 (= e!93596 (contains!929 (toList!890 lt!75266) (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))))))

(assert (= (and d!45875 res!68416) b!143631))

(assert (= (and b!143631 res!68417) b!143632))

(declare-fun m!173353 () Bool)

(assert (=> d!45875 m!173353))

(declare-fun m!173355 () Bool)

(assert (=> d!45875 m!173355))

(declare-fun m!173357 () Bool)

(assert (=> d!45875 m!173357))

(declare-fun m!173359 () Bool)

(assert (=> d!45875 m!173359))

(declare-fun m!173361 () Bool)

(assert (=> b!143631 m!173361))

(declare-fun m!173363 () Bool)

(assert (=> b!143632 m!173363))

(assert (=> b!143335 d!45875))

(assert (=> b!143335 d!45805))

(declare-fun d!45877 () Bool)

(assert (=> d!45877 (= (apply!121 (+!180 lt!75066 (tuple2!2707 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75049) (apply!121 lt!75066 lt!75049))))

(declare-fun lt!75267 () Unit!4535)

(assert (=> d!45877 (= lt!75267 (choose!875 lt!75066 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75049))))

(declare-fun e!93597 () Bool)

(assert (=> d!45877 e!93597))

(declare-fun res!68418 () Bool)

(assert (=> d!45877 (=> (not res!68418) (not e!93597))))

(assert (=> d!45877 (= res!68418 (contains!927 lt!75066 lt!75049))))

(assert (=> d!45877 (= (addApplyDifferent!97 lt!75066 lt!75046 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75049) lt!75267)))

(declare-fun b!143633 () Bool)

(assert (=> b!143633 (= e!93597 (not (= lt!75049 lt!75046)))))

(assert (= (and d!45877 res!68418) b!143633))

(assert (=> d!45877 m!172879))

(declare-fun m!173365 () Bool)

(assert (=> d!45877 m!173365))

(declare-fun m!173367 () Bool)

(assert (=> d!45877 m!173367))

(assert (=> d!45877 m!172879))

(assert (=> d!45877 m!172881))

(assert (=> d!45877 m!172867))

(assert (=> b!143335 d!45877))

(declare-fun d!45879 () Bool)

(assert (=> d!45879 (contains!927 (+!180 lt!75052 (tuple2!2707 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75048)))

(declare-fun lt!75270 () Unit!4535)

(declare-fun choose!876 (ListLongMap!1749 (_ BitVec 64) V!3563 (_ BitVec 64)) Unit!4535)

(assert (=> d!45879 (= lt!75270 (choose!876 lt!75052 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75048))))

(assert (=> d!45879 (contains!927 lt!75052 lt!75048)))

(assert (=> d!45879 (= (addStillContains!97 lt!75052 lt!75051 (zeroValue!2811 (v!3297 (underlying!483 thiss!992))) lt!75048) lt!75270)))

(declare-fun bs!6076 () Bool)

(assert (= bs!6076 d!45879))

(assert (=> bs!6076 m!172857))

(assert (=> bs!6076 m!172857))

(assert (=> bs!6076 m!172883))

(declare-fun m!173369 () Bool)

(assert (=> bs!6076 m!173369))

(declare-fun m!173371 () Bool)

(assert (=> bs!6076 m!173371))

(assert (=> b!143335 d!45879))

(declare-fun d!45881 () Bool)

(declare-fun e!93598 () Bool)

(assert (=> d!45881 e!93598))

(declare-fun res!68419 () Bool)

(assert (=> d!45881 (=> (not res!68419) (not e!93598))))

(declare-fun lt!75274 () ListLongMap!1749)

(assert (=> d!45881 (= res!68419 (contains!927 lt!75274 (_1!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(declare-fun lt!75273 () List!1750)

(assert (=> d!45881 (= lt!75274 (ListLongMap!1750 lt!75273))))

(declare-fun lt!75271 () Unit!4535)

(declare-fun lt!75272 () Unit!4535)

(assert (=> d!45881 (= lt!75271 lt!75272)))

(assert (=> d!45881 (= (getValueByKey!177 lt!75273 (_1!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45881 (= lt!75272 (lemmaContainsTupThenGetReturnValue!91 lt!75273 (_1!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45881 (= lt!75273 (insertStrictlySorted!94 (toList!890 lt!75059) (_1!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) (_2!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (=> d!45881 (= (+!180 lt!75059 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75274)))

(declare-fun b!143635 () Bool)

(declare-fun res!68420 () Bool)

(assert (=> b!143635 (=> (not res!68420) (not e!93598))))

(assert (=> b!143635 (= res!68420 (= (getValueByKey!177 (toList!890 lt!75274) (_1!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (Some!182 (_2!1364 (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(declare-fun b!143636 () Bool)

(assert (=> b!143636 (= e!93598 (contains!929 (toList!890 lt!75274) (tuple2!2707 lt!75054 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))

(assert (= (and d!45881 res!68419) b!143635))

(assert (= (and b!143635 res!68420) b!143636))

(declare-fun m!173373 () Bool)

(assert (=> d!45881 m!173373))

(declare-fun m!173375 () Bool)

(assert (=> d!45881 m!173375))

(declare-fun m!173377 () Bool)

(assert (=> d!45881 m!173377))

(declare-fun m!173379 () Bool)

(assert (=> d!45881 m!173379))

(declare-fun m!173381 () Bool)

(assert (=> b!143635 m!173381))

(declare-fun m!173383 () Bool)

(assert (=> b!143636 m!173383))

(assert (=> b!143335 d!45881))

(declare-fun d!45883 () Bool)

(assert (=> d!45883 (= (apply!121 (+!180 lt!75065 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992))))) lt!75050) (get!1538 (getValueByKey!177 (toList!890 (+!180 lt!75065 (tuple2!2707 lt!75062 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75050)))))

(declare-fun bs!6077 () Bool)

(assert (= bs!6077 d!45883))

(declare-fun m!173385 () Bool)

(assert (=> bs!6077 m!173385))

(assert (=> bs!6077 m!173385))

(declare-fun m!173387 () Bool)

(assert (=> bs!6077 m!173387))

(assert (=> b!143335 d!45883))

(assert (=> b!143264 d!45783))

(declare-fun d!45885 () Bool)

(declare-fun res!68421 () Bool)

(declare-fun e!93600 () Bool)

(assert (=> d!45885 (=> res!68421 e!93600)))

(assert (=> d!45885 (= res!68421 (bvsge #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))))))

(assert (=> d!45885 (= (arrayNoDuplicates!0 (_keys!4726 newMap!16) #b00000000000000000000000000000000 Nil!1746) e!93600)))

(declare-fun bm!15931 () Bool)

(declare-fun call!15934 () Bool)

(declare-fun c!27201 () Bool)

(assert (=> bm!15931 (= call!15934 (arrayNoDuplicates!0 (_keys!4726 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27201 (Cons!1745 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000) Nil!1746) Nil!1746)))))

(declare-fun b!143637 () Bool)

(declare-fun e!93601 () Bool)

(assert (=> b!143637 (= e!93601 call!15934)))

(declare-fun b!143638 () Bool)

(declare-fun e!93599 () Bool)

(assert (=> b!143638 (= e!93599 e!93601)))

(assert (=> b!143638 (= c!27201 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143639 () Bool)

(assert (=> b!143639 (= e!93601 call!15934)))

(declare-fun b!143640 () Bool)

(declare-fun e!93602 () Bool)

(assert (=> b!143640 (= e!93602 (contains!928 Nil!1746 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!143641 () Bool)

(assert (=> b!143641 (= e!93600 e!93599)))

(declare-fun res!68423 () Bool)

(assert (=> b!143641 (=> (not res!68423) (not e!93599))))

(assert (=> b!143641 (= res!68423 (not e!93602))))

(declare-fun res!68422 () Bool)

(assert (=> b!143641 (=> (not res!68422) (not e!93602))))

(assert (=> b!143641 (= res!68422 (validKeyInArray!0 (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!45885 (not res!68421)) b!143641))

(assert (= (and b!143641 res!68422) b!143640))

(assert (= (and b!143641 res!68423) b!143638))

(assert (= (and b!143638 c!27201) b!143639))

(assert (= (and b!143638 (not c!27201)) b!143637))

(assert (= (or b!143639 b!143637) bm!15931))

(assert (=> bm!15931 m!172935))

(declare-fun m!173389 () Bool)

(assert (=> bm!15931 m!173389))

(assert (=> b!143638 m!172935))

(assert (=> b!143638 m!172935))

(assert (=> b!143638 m!172943))

(assert (=> b!143640 m!172935))

(assert (=> b!143640 m!172935))

(declare-fun m!173391 () Bool)

(assert (=> b!143640 m!173391))

(assert (=> b!143641 m!172935))

(assert (=> b!143641 m!172935))

(assert (=> b!143641 m!172943))

(assert (=> b!143117 d!45885))

(declare-fun d!45887 () Bool)

(declare-fun res!68424 () Bool)

(declare-fun e!93603 () Bool)

(assert (=> d!45887 (=> res!68424 e!93603)))

(assert (=> d!45887 (= res!68424 ((_ is Nil!1746) (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))))))

(assert (=> d!45887 (= (noDuplicate!51 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))) e!93603)))

(declare-fun b!143642 () Bool)

(declare-fun e!93604 () Bool)

(assert (=> b!143642 (= e!93603 e!93604)))

(declare-fun res!68425 () Bool)

(assert (=> b!143642 (=> (not res!68425) (not e!93604))))

(assert (=> b!143642 (= res!68425 (not (contains!928 (t!6362 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))) (h!2353 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746))))))))

(declare-fun b!143643 () Bool)

(assert (=> b!143643 (= e!93604 (noDuplicate!51 (t!6362 (t!6362 (Cons!1745 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) Nil!1746)))))))

(assert (= (and d!45887 (not res!68424)) b!143642))

(assert (= (and b!143642 res!68425) b!143643))

(declare-fun m!173393 () Bool)

(assert (=> b!143642 m!173393))

(declare-fun m!173395 () Bool)

(assert (=> b!143643 m!173395))

(assert (=> b!143342 d!45887))

(declare-fun d!45889 () Bool)

(assert (=> d!45889 (= (get!1537 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143273 d!45889))

(declare-fun d!45891 () Bool)

(declare-fun lt!75275 () Bool)

(assert (=> d!45891 (= lt!75275 (select (content!139 Nil!1746) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun e!93605 () Bool)

(assert (=> d!45891 (= lt!75275 e!93605)))

(declare-fun res!68426 () Bool)

(assert (=> d!45891 (=> (not res!68426) (not e!93605))))

(assert (=> d!45891 (= res!68426 ((_ is Cons!1745) Nil!1746))))

(assert (=> d!45891 (= (contains!928 Nil!1746 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) lt!75275)))

(declare-fun b!143644 () Bool)

(declare-fun e!93606 () Bool)

(assert (=> b!143644 (= e!93605 e!93606)))

(declare-fun res!68427 () Bool)

(assert (=> b!143644 (=> res!68427 e!93606)))

(assert (=> b!143644 (= res!68427 (= (h!2353 Nil!1746) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143645 () Bool)

(assert (=> b!143645 (= e!93606 (contains!928 (t!6362 Nil!1746) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (= (and d!45891 res!68426) b!143644))

(assert (= (and b!143644 (not res!68427)) b!143645))

(declare-fun m!173397 () Bool)

(assert (=> d!45891 m!173397))

(assert (=> d!45891 m!172675))

(declare-fun m!173399 () Bool)

(assert (=> d!45891 m!173399))

(assert (=> b!143645 m!172675))

(declare-fun m!173401 () Bool)

(assert (=> b!143645 m!173401))

(assert (=> b!143131 d!45891))

(assert (=> d!45775 d!45837))

(declare-fun d!45893 () Bool)

(declare-fun res!68428 () Bool)

(declare-fun e!93607 () Bool)

(assert (=> d!45893 (=> (not res!68428) (not e!93607))))

(assert (=> d!45893 (= res!68428 (simpleValid!97 (_2!1365 lt!74982)))))

(assert (=> d!45893 (= (valid!559 (_2!1365 lt!74982)) e!93607)))

(declare-fun b!143646 () Bool)

(declare-fun res!68429 () Bool)

(assert (=> b!143646 (=> (not res!68429) (not e!93607))))

(assert (=> b!143646 (= res!68429 (= (arrayCountValidKeys!0 (_keys!4726 (_2!1365 lt!74982)) #b00000000000000000000000000000000 (size!2594 (_keys!4726 (_2!1365 lt!74982)))) (_size!628 (_2!1365 lt!74982))))))

(declare-fun b!143647 () Bool)

(declare-fun res!68430 () Bool)

(assert (=> b!143647 (=> (not res!68430) (not e!93607))))

(assert (=> b!143647 (= res!68430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4726 (_2!1365 lt!74982)) (mask!7315 (_2!1365 lt!74982))))))

(declare-fun b!143648 () Bool)

(assert (=> b!143648 (= e!93607 (arrayNoDuplicates!0 (_keys!4726 (_2!1365 lt!74982)) #b00000000000000000000000000000000 Nil!1746))))

(assert (= (and d!45893 res!68428) b!143646))

(assert (= (and b!143646 res!68429) b!143647))

(assert (= (and b!143647 res!68430) b!143648))

(declare-fun m!173403 () Bool)

(assert (=> d!45893 m!173403))

(declare-fun m!173405 () Bool)

(assert (=> b!143646 m!173405))

(declare-fun m!173407 () Bool)

(assert (=> b!143647 m!173407))

(declare-fun m!173409 () Bool)

(assert (=> b!143648 m!173409))

(assert (=> d!45759 d!45893))

(assert (=> d!45759 d!45747))

(assert (=> b!143129 d!45791))

(declare-fun d!45895 () Bool)

(assert (=> d!45895 (= (+!180 (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) lt!74978 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75278 () Unit!4535)

(declare-fun choose!877 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 V!3563 Int) Unit!4535)

(assert (=> d!45895 (= lt!75278 (choose!877 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) lt!74978 (zeroValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2811 newMap!16) (defaultEntry!2963 newMap!16)))))

(assert (=> d!45895 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45895 (= (lemmaChangeZeroKeyThenAddPairToListMap!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) lt!74978 (zeroValue!2811 newMap!16) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2811 newMap!16) (defaultEntry!2963 newMap!16)) lt!75278)))

(declare-fun bs!6078 () Bool)

(assert (= bs!6078 d!45895))

(assert (=> bs!6078 m!172849))

(declare-fun m!173411 () Bool)

(assert (=> bs!6078 m!173411))

(assert (=> bs!6078 m!172933))

(assert (=> bs!6078 m!172849))

(assert (=> bs!6078 m!172685))

(declare-fun m!173413 () Bool)

(assert (=> bs!6078 m!173413))

(assert (=> bs!6078 m!172685))

(declare-fun m!173415 () Bool)

(assert (=> bs!6078 m!173415))

(assert (=> b!143233 d!45895))

(declare-fun d!45897 () Bool)

(declare-fun e!93609 () Bool)

(assert (=> d!45897 e!93609))

(declare-fun res!68431 () Bool)

(assert (=> d!45897 (=> res!68431 e!93609)))

(declare-fun lt!75280 () Bool)

(assert (=> d!45897 (= res!68431 (not lt!75280))))

(declare-fun lt!75281 () Bool)

(assert (=> d!45897 (= lt!75280 lt!75281)))

(declare-fun lt!75282 () Unit!4535)

(declare-fun e!93608 () Unit!4535)

(assert (=> d!45897 (= lt!75282 e!93608)))

(declare-fun c!27202 () Bool)

(assert (=> d!45897 (= c!27202 lt!75281)))

(assert (=> d!45897 (= lt!75281 (containsKey!181 (toList!890 call!15847) (ite c!27100 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74998)))))))

(assert (=> d!45897 (= (contains!927 call!15847 (ite c!27100 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74998)))) lt!75280)))

(declare-fun b!143649 () Bool)

(declare-fun lt!75279 () Unit!4535)

(assert (=> b!143649 (= e!93608 lt!75279)))

(assert (=> b!143649 (= lt!75279 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 call!15847) (ite c!27100 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74998)))))))

(assert (=> b!143649 (isDefined!130 (getValueByKey!177 (toList!890 call!15847) (ite c!27100 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74998)))))))

(declare-fun b!143650 () Bool)

(declare-fun Unit!4551 () Unit!4535)

(assert (=> b!143650 (= e!93608 Unit!4551)))

(declare-fun b!143651 () Bool)

(assert (=> b!143651 (= e!93609 (isDefined!130 (getValueByKey!177 (toList!890 call!15847) (ite c!27100 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!74998))))))))

(assert (= (and d!45897 c!27202) b!143649))

(assert (= (and d!45897 (not c!27202)) b!143650))

(assert (= (and d!45897 (not res!68431)) b!143651))

(declare-fun m!173417 () Bool)

(assert (=> d!45897 m!173417))

(declare-fun m!173419 () Bool)

(assert (=> b!143649 m!173419))

(declare-fun m!173421 () Bool)

(assert (=> b!143649 m!173421))

(assert (=> b!143649 m!173421))

(declare-fun m!173423 () Bool)

(assert (=> b!143649 m!173423))

(assert (=> b!143651 m!173421))

(assert (=> b!143651 m!173421))

(assert (=> b!143651 m!173423))

(assert (=> bm!15850 d!45897))

(declare-fun d!45899 () Bool)

(assert (=> d!45899 (= (apply!121 lt!75064 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1538 (getValueByKey!177 (toList!890 lt!75064) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6079 () Bool)

(assert (= bs!6079 d!45899))

(assert (=> bs!6079 m!172951))

(assert (=> bs!6079 m!172951))

(declare-fun m!173425 () Bool)

(assert (=> bs!6079 m!173425))

(assert (=> b!143331 d!45899))

(declare-fun d!45901 () Bool)

(declare-fun e!93610 () Bool)

(assert (=> d!45901 e!93610))

(declare-fun res!68432 () Bool)

(assert (=> d!45901 (=> (not res!68432) (not e!93610))))

(declare-fun lt!75286 () ListLongMap!1749)

(assert (=> d!45901 (= res!68432 (contains!927 lt!75286 (_1!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(declare-fun lt!75285 () List!1750)

(assert (=> d!45901 (= lt!75286 (ListLongMap!1750 lt!75285))))

(declare-fun lt!75283 () Unit!4535)

(declare-fun lt!75284 () Unit!4535)

(assert (=> d!45901 (= lt!75283 lt!75284)))

(assert (=> d!45901 (= (getValueByKey!177 lt!75285 (_1!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))) (Some!182 (_2!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(assert (=> d!45901 (= lt!75284 (lemmaContainsTupThenGetReturnValue!91 lt!75285 (_1!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (_2!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(assert (=> d!45901 (= lt!75285 (insertStrictlySorted!94 (toList!890 (ite c!27123 call!15886 (ite c!27125 call!15883 call!15887))) (_1!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) (_2!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))))))

(assert (=> d!45901 (= (+!180 (ite c!27123 call!15886 (ite c!27125 call!15883 call!15887)) (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))) lt!75286)))

(declare-fun b!143652 () Bool)

(declare-fun res!68433 () Bool)

(assert (=> b!143652 (=> (not res!68433) (not e!93610))))

(assert (=> b!143652 (= res!68433 (= (getValueByKey!177 (toList!890 lt!75286) (_1!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992))))))) (Some!182 (_2!1364 (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))))

(declare-fun b!143653 () Bool)

(assert (=> b!143653 (= e!93610 (contains!929 (toList!890 lt!75286) (ite (or c!27123 c!27125) (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2811 (v!3297 (underlying!483 thiss!992)))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2811 (v!3297 (underlying!483 thiss!992)))))))))

(assert (= (and d!45901 res!68432) b!143652))

(assert (= (and b!143652 res!68433) b!143653))

(declare-fun m!173427 () Bool)

(assert (=> d!45901 m!173427))

(declare-fun m!173429 () Bool)

(assert (=> d!45901 m!173429))

(declare-fun m!173431 () Bool)

(assert (=> d!45901 m!173431))

(declare-fun m!173433 () Bool)

(assert (=> d!45901 m!173433))

(declare-fun m!173435 () Bool)

(assert (=> b!143652 m!173435))

(declare-fun m!173437 () Bool)

(assert (=> b!143653 m!173437))

(assert (=> bm!15883 d!45901))

(declare-fun d!45903 () Bool)

(declare-fun e!93611 () Bool)

(assert (=> d!45903 e!93611))

(declare-fun res!68434 () Bool)

(assert (=> d!45903 (=> (not res!68434) (not e!93611))))

(declare-fun lt!75290 () ListLongMap!1749)

(assert (=> d!45903 (= res!68434 (contains!927 lt!75290 (_1!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!75289 () List!1750)

(assert (=> d!45903 (= lt!75290 (ListLongMap!1750 lt!75289))))

(declare-fun lt!75287 () Unit!4535)

(declare-fun lt!75288 () Unit!4535)

(assert (=> d!45903 (= lt!75287 lt!75288)))

(assert (=> d!45903 (= (getValueByKey!177 lt!75289 (_1!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!182 (_2!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45903 (= lt!75288 (lemmaContainsTupThenGetReturnValue!91 lt!75289 (_1!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45903 (= lt!75289 (insertStrictlySorted!94 (toList!890 (ite c!27104 (ite c!27099 call!15850 call!15855) call!15857)) (_1!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!45903 (= (+!180 (ite c!27104 (ite c!27099 call!15850 call!15855) call!15857) (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!75290)))

(declare-fun b!143654 () Bool)

(declare-fun res!68435 () Bool)

(assert (=> b!143654 (=> (not res!68435) (not e!93611))))

(assert (=> b!143654 (= res!68435 (= (getValueByKey!177 (toList!890 lt!75290) (_1!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!182 (_2!1364 (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!143655 () Bool)

(assert (=> b!143655 (= e!93611 (contains!929 (toList!890 lt!75290) (ite c!27104 (ite c!27099 (tuple2!2707 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2707 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!45903 res!68434) b!143654))

(assert (= (and b!143654 res!68435) b!143655))

(declare-fun m!173439 () Bool)

(assert (=> d!45903 m!173439))

(declare-fun m!173441 () Bool)

(assert (=> d!45903 m!173441))

(declare-fun m!173443 () Bool)

(assert (=> d!45903 m!173443))

(declare-fun m!173445 () Bool)

(assert (=> d!45903 m!173445))

(declare-fun m!173447 () Bool)

(assert (=> b!143654 m!173447))

(declare-fun m!173449 () Bool)

(assert (=> b!143655 m!173449))

(assert (=> bm!15846 d!45903))

(declare-fun d!45905 () Bool)

(declare-fun e!93613 () Bool)

(assert (=> d!45905 e!93613))

(declare-fun res!68436 () Bool)

(assert (=> d!45905 (=> res!68436 e!93613)))

(declare-fun lt!75292 () Bool)

(assert (=> d!45905 (= res!68436 (not lt!75292))))

(declare-fun lt!75293 () Bool)

(assert (=> d!45905 (= lt!75292 lt!75293)))

(declare-fun lt!75294 () Unit!4535)

(declare-fun e!93612 () Unit!4535)

(assert (=> d!45905 (= lt!75294 e!93612)))

(declare-fun c!27203 () Bool)

(assert (=> d!45905 (= c!27203 lt!75293)))

(assert (=> d!45905 (= lt!75293 (containsKey!181 (toList!890 lt!75064) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!45905 (= (contains!927 lt!75064 #b0000000000000000000000000000000000000000000000000000000000000000) lt!75292)))

(declare-fun b!143656 () Bool)

(declare-fun lt!75291 () Unit!4535)

(assert (=> b!143656 (= e!93612 lt!75291)))

(assert (=> b!143656 (= lt!75291 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 lt!75064) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!143656 (isDefined!130 (getValueByKey!177 (toList!890 lt!75064) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143657 () Bool)

(declare-fun Unit!4552 () Unit!4535)

(assert (=> b!143657 (= e!93612 Unit!4552)))

(declare-fun b!143658 () Bool)

(assert (=> b!143658 (= e!93613 (isDefined!130 (getValueByKey!177 (toList!890 lt!75064) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!45905 c!27203) b!143656))

(assert (= (and d!45905 (not c!27203)) b!143657))

(assert (= (and d!45905 (not res!68436)) b!143658))

(declare-fun m!173451 () Bool)

(assert (=> d!45905 m!173451))

(declare-fun m!173453 () Bool)

(assert (=> b!143656 m!173453))

(assert (=> b!143656 m!173143))

(assert (=> b!143656 m!173143))

(declare-fun m!173455 () Bool)

(assert (=> b!143656 m!173455))

(assert (=> b!143658 m!173143))

(assert (=> b!143658 m!173143))

(assert (=> b!143658 m!173455))

(assert (=> bm!15884 d!45905))

(declare-fun d!45907 () Bool)

(declare-fun e!93637 () Bool)

(assert (=> d!45907 e!93637))

(declare-fun res!68462 () Bool)

(assert (=> d!45907 (=> (not res!68462) (not e!93637))))

(declare-fun lt!75365 () tuple2!2708)

(assert (=> d!45907 (= res!68462 (_1!1365 lt!75365))))

(assert (=> d!45907 (= lt!75365 (tuple2!2709 true (LongMapFixedSize!1159 (defaultEntry!2963 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (bvadd (_size!628 newMap!16) #b00000000000000000000000000000001) (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (_vacant!628 newMap!16))))))

(declare-fun lt!75366 () Unit!4535)

(declare-fun lt!75383 () Unit!4535)

(assert (=> d!45907 (= lt!75366 lt!75383)))

(declare-fun lt!75361 () array!4913)

(declare-fun lt!75375 () array!4911)

(assert (=> d!45907 (contains!927 (getCurrentListMap!562 lt!75375 lt!75361 (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (select (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998))))))

(assert (=> d!45907 (= lt!75383 (lemmaValidKeyInArrayIsInListMap!127 lt!75375 lt!75361 (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (defaultEntry!2963 newMap!16)))))

(assert (=> d!45907 (= lt!75361 (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))))))

(assert (=> d!45907 (= lt!75375 (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))))))

(declare-fun lt!75367 () Unit!4535)

(declare-fun lt!75355 () Unit!4535)

(assert (=> d!45907 (= lt!75367 lt!75355)))

(declare-fun lt!75358 () array!4911)

(assert (=> d!45907 (= (arrayCountValidKeys!0 lt!75358 (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (bvadd (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4911 (_ BitVec 32)) Unit!4535)

(assert (=> d!45907 (= lt!75355 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!75358 (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998))))))

(assert (=> d!45907 (= lt!75358 (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))))))

(declare-fun lt!75379 () Unit!4535)

(declare-fun lt!75356 () Unit!4535)

(assert (=> d!45907 (= lt!75379 lt!75356)))

(declare-fun lt!75370 () array!4911)

(assert (=> d!45907 (arrayContainsKey!0 lt!75370 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!45907 (= lt!75356 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!75370 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998))))))

(assert (=> d!45907 (= lt!75370 (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))))))

(declare-fun lt!75360 () Unit!4535)

(declare-fun lt!75359 () Unit!4535)

(assert (=> d!45907 (= lt!75360 lt!75359)))

(assert (=> d!45907 (= (+!180 (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!562 (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))) (array!4914 (store (arr!2322 (_values!2946 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (ValueCellFull!1125 (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2595 (_values!2946 newMap!16))) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!46 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 32) (_ BitVec 64) V!3563 Int) Unit!4535)

(assert (=> d!45907 (= lt!75359 (lemmaAddValidKeyToArrayThenAddPairToListMap!46 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2963 newMap!16)))))

(declare-fun lt!75369 () Unit!4535)

(declare-fun lt!75373 () Unit!4535)

(assert (=> d!45907 (= lt!75369 lt!75373)))

(assert (=> d!45907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))) (mask!7315 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4911 (_ BitVec 32) (_ BitVec 32)) Unit!4535)

(assert (=> d!45907 (= lt!75373 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (mask!7315 newMap!16)))))

(declare-fun lt!75364 () Unit!4535)

(declare-fun lt!75368 () Unit!4535)

(assert (=> d!45907 (= lt!75364 lt!75368)))

(assert (=> d!45907 (= (arrayCountValidKeys!0 (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))) #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4726 newMap!16) #b00000000000000000000000000000000 (size!2594 (_keys!4726 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4911 (_ BitVec 32) (_ BitVec 64)) Unit!4535)

(assert (=> d!45907 (= lt!75368 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4726 newMap!16) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun lt!75372 () Unit!4535)

(declare-fun lt!75381 () Unit!4535)

(assert (=> d!45907 (= lt!75372 lt!75381)))

(declare-fun lt!75371 () (_ BitVec 32))

(declare-fun lt!75363 () List!1749)

(assert (=> d!45907 (arrayNoDuplicates!0 (array!4912 (store (arr!2321 (_keys!4726 newMap!16)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) (size!2594 (_keys!4726 newMap!16))) lt!75371 lt!75363)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4911 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1749) Unit!4535)

(assert (=> d!45907 (= lt!75381 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4726 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998)) lt!75371 lt!75363))))

(assert (=> d!45907 (= lt!75363 Nil!1746)))

(assert (=> d!45907 (= lt!75371 #b00000000000000000000000000000000)))

(declare-fun lt!75377 () Unit!4535)

(declare-fun e!93630 () Unit!4535)

(assert (=> d!45907 (= lt!75377 e!93630)))

(declare-fun c!27215 () Bool)

(assert (=> d!45907 (= c!27215 (arrayContainsKey!0 (_keys!4726 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!75362 () Unit!4535)

(declare-fun e!93631 () Unit!4535)

(assert (=> d!45907 (= lt!75362 e!93631)))

(declare-fun c!27214 () Bool)

(assert (=> d!45907 (= c!27214 (contains!927 (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> d!45907 (valid!559 newMap!16)))

(assert (=> d!45907 (= (updateHelperNewKey!66 newMap!16 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27097 (index!3287 lt!74998) (index!3284 lt!74998))) lt!75365)))

(declare-fun b!143693 () Bool)

(declare-fun res!68457 () Bool)

(declare-fun e!93636 () Bool)

(assert (=> b!143693 (=> (not res!68457) (not e!93636))))

(declare-fun call!15944 () Bool)

(assert (=> b!143693 (= res!68457 call!15944)))

(declare-fun e!93633 () Bool)

(assert (=> b!143693 (= e!93633 e!93636)))

(declare-fun b!143694 () Bool)

(declare-fun Unit!4553 () Unit!4535)

(assert (=> b!143694 (= e!93630 Unit!4553)))

(declare-fun lt!75384 () SeekEntryResult!280)

(declare-fun e!93635 () Bool)

(declare-fun b!143695 () Bool)

(assert (=> b!143695 (= e!93635 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!75384)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143696 () Bool)

(declare-fun res!68455 () Bool)

(declare-fun lt!75380 () SeekEntryResult!280)

(assert (=> b!143696 (= res!68455 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3287 lt!75380)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!93634 () Bool)

(assert (=> b!143696 (=> (not res!68455) (not e!93634))))

(declare-fun call!15945 () Bool)

(declare-fun bm!15940 () Bool)

(assert (=> bm!15940 (= call!15945 (arrayContainsKey!0 (_keys!4726 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!143697 () Bool)

(declare-fun lt!75378 () Unit!4535)

(assert (=> b!143697 (= e!93631 lt!75378)))

(assert (=> b!143697 (= lt!75378 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)))))

(declare-fun call!15943 () SeekEntryResult!280)

(assert (=> b!143697 (= lt!75380 call!15943)))

(declare-fun c!27213 () Bool)

(assert (=> b!143697 (= c!27213 ((_ is MissingZero!280) lt!75380))))

(assert (=> b!143697 e!93633))

(declare-fun b!143698 () Bool)

(declare-fun res!68459 () Bool)

(assert (=> b!143698 (=> (not res!68459) (not e!93637))))

(assert (=> b!143698 (= res!68459 (contains!927 (map!1445 (_2!1365 lt!75365)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun bm!15941 () Bool)

(assert (=> bm!15941 (= call!15943 (seekEntryOrOpen!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(declare-fun bm!15942 () Bool)

(declare-fun call!15946 () Bool)

(assert (=> bm!15942 (= call!15944 call!15946)))

(declare-fun b!143699 () Bool)

(declare-fun res!68461 () Bool)

(assert (=> b!143699 (=> (not res!68461) (not e!93637))))

(assert (=> b!143699 (= res!68461 (valid!559 (_2!1365 lt!75365)))))

(declare-fun b!143700 () Bool)

(declare-fun e!93632 () Bool)

(assert (=> b!143700 (= e!93632 ((_ is Undefined!280) lt!75380))))

(declare-fun bm!15943 () Bool)

(assert (=> bm!15943 (= call!15946 (inRange!0 (ite c!27214 (index!3285 lt!75384) (ite c!27213 (index!3284 lt!75380) (index!3287 lt!75380))) (mask!7315 newMap!16)))))

(declare-fun b!143701 () Bool)

(declare-fun Unit!4554 () Unit!4535)

(assert (=> b!143701 (= e!93630 Unit!4554)))

(declare-fun lt!75357 () Unit!4535)

(declare-fun lemmaArrayContainsKeyThenInListMap!46 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 64) (_ BitVec 32) Int) Unit!4535)

(assert (=> b!143701 (= lt!75357 (lemmaArrayContainsKeyThenInListMap!46 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)))))

(assert (=> b!143701 (contains!927 (getCurrentListMap!562 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2963 newMap!16)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))

(declare-fun lt!75376 () Unit!4535)

(assert (=> b!143701 (= lt!75376 lt!75357)))

(assert (=> b!143701 false))

(declare-fun b!143702 () Bool)

(assert (=> b!143702 (= e!93636 (not call!15945))))

(declare-fun b!143703 () Bool)

(assert (=> b!143703 (= e!93632 e!93634)))

(declare-fun res!68460 () Bool)

(assert (=> b!143703 (= res!68460 call!15944)))

(assert (=> b!143703 (=> (not res!68460) (not e!93634))))

(declare-fun b!143704 () Bool)

(declare-fun res!68456 () Bool)

(assert (=> b!143704 (=> (not res!68456) (not e!93636))))

(assert (=> b!143704 (= res!68456 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3284 lt!75380)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!143705 () Bool)

(assert (=> b!143705 (= e!93634 (not call!15945))))

(declare-fun b!143706 () Bool)

(declare-fun c!27212 () Bool)

(assert (=> b!143706 (= c!27212 ((_ is MissingVacant!280) lt!75380))))

(assert (=> b!143706 (= e!93633 e!93632)))

(declare-fun b!143707 () Bool)

(declare-fun Unit!4555 () Unit!4535)

(assert (=> b!143707 (= e!93631 Unit!4555)))

(declare-fun lt!75374 () Unit!4535)

(assert (=> b!143707 (= lt!75374 (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)))))

(assert (=> b!143707 (= lt!75384 call!15943)))

(declare-fun res!68463 () Bool)

(assert (=> b!143707 (= res!68463 ((_ is Found!280) lt!75384))))

(assert (=> b!143707 (=> (not res!68463) (not e!93635))))

(assert (=> b!143707 e!93635))

(declare-fun lt!75382 () Unit!4535)

(assert (=> b!143707 (= lt!75382 lt!75374)))

(assert (=> b!143707 false))

(declare-fun b!143708 () Bool)

(assert (=> b!143708 (= e!93637 (= (map!1445 (_2!1365 lt!75365)) (+!180 (map!1445 newMap!16) (tuple2!2707 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (get!1535 (select (arr!2322 (_values!2946 (v!3297 (underlying!483 thiss!992)))) from!355) (dynLambda!444 (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!143709 () Bool)

(declare-fun res!68458 () Bool)

(assert (=> b!143709 (= res!68458 call!15946)))

(assert (=> b!143709 (=> (not res!68458) (not e!93635))))

(assert (= (and d!45907 c!27214) b!143707))

(assert (= (and d!45907 (not c!27214)) b!143697))

(assert (= (and b!143707 res!68463) b!143709))

(assert (= (and b!143709 res!68458) b!143695))

(assert (= (and b!143697 c!27213) b!143693))

(assert (= (and b!143697 (not c!27213)) b!143706))

(assert (= (and b!143693 res!68457) b!143704))

(assert (= (and b!143704 res!68456) b!143702))

(assert (= (and b!143706 c!27212) b!143703))

(assert (= (and b!143706 (not c!27212)) b!143700))

(assert (= (and b!143703 res!68460) b!143696))

(assert (= (and b!143696 res!68455) b!143705))

(assert (= (or b!143693 b!143703) bm!15942))

(assert (= (or b!143702 b!143705) bm!15940))

(assert (= (or b!143709 bm!15942) bm!15943))

(assert (= (or b!143707 b!143697) bm!15941))

(assert (= (and d!45907 c!27215) b!143701))

(assert (= (and d!45907 (not c!27215)) b!143694))

(assert (= (and d!45907 res!68462) b!143699))

(assert (= (and b!143699 res!68461) b!143698))

(assert (= (and b!143698 res!68459) b!143708))

(declare-fun m!173457 () Bool)

(assert (=> b!143698 m!173457))

(assert (=> b!143698 m!173457))

(assert (=> b!143698 m!172675))

(declare-fun m!173459 () Bool)

(assert (=> b!143698 m!173459))

(assert (=> b!143707 m!172675))

(assert (=> b!143707 m!172825))

(assert (=> b!143697 m!172675))

(assert (=> b!143697 m!172785))

(declare-fun m!173461 () Bool)

(assert (=> b!143695 m!173461))

(assert (=> b!143708 m!173457))

(assert (=> b!143708 m!172677))

(assert (=> b!143708 m!172677))

(declare-fun m!173463 () Bool)

(assert (=> b!143708 m!173463))

(declare-fun m!173465 () Bool)

(assert (=> b!143699 m!173465))

(declare-fun m!173467 () Bool)

(assert (=> b!143696 m!173467))

(assert (=> b!143701 m!172675))

(declare-fun m!173469 () Bool)

(assert (=> b!143701 m!173469))

(assert (=> b!143701 m!172849))

(assert (=> b!143701 m!172849))

(assert (=> b!143701 m!172675))

(declare-fun m!173471 () Bool)

(assert (=> b!143701 m!173471))

(assert (=> bm!15940 m!172675))

(assert (=> bm!15940 m!172827))

(assert (=> bm!15941 m!172675))

(assert (=> bm!15941 m!172793))

(declare-fun m!173473 () Bool)

(assert (=> b!143704 m!173473))

(assert (=> d!45907 m!172755))

(declare-fun m!173475 () Bool)

(assert (=> d!45907 m!173475))

(assert (=> d!45907 m!172675))

(assert (=> d!45907 m!172827))

(assert (=> d!45907 m!172675))

(declare-fun m!173477 () Bool)

(assert (=> d!45907 m!173477))

(assert (=> d!45907 m!172675))

(assert (=> d!45907 m!172685))

(declare-fun m!173479 () Bool)

(assert (=> d!45907 m!173479))

(declare-fun m!173481 () Bool)

(assert (=> d!45907 m!173481))

(declare-fun m!173483 () Bool)

(assert (=> d!45907 m!173483))

(declare-fun m!173485 () Bool)

(assert (=> d!45907 m!173485))

(declare-fun m!173487 () Bool)

(assert (=> d!45907 m!173487))

(declare-fun m!173489 () Bool)

(assert (=> d!45907 m!173489))

(assert (=> d!45907 m!172849))

(assert (=> d!45907 m!172675))

(assert (=> d!45907 m!173471))

(assert (=> d!45907 m!172849))

(assert (=> d!45907 m!172675))

(declare-fun m!173491 () Bool)

(assert (=> d!45907 m!173491))

(assert (=> d!45907 m!172675))

(declare-fun m!173493 () Bool)

(assert (=> d!45907 m!173493))

(declare-fun m!173495 () Bool)

(assert (=> d!45907 m!173495))

(declare-fun m!173497 () Bool)

(assert (=> d!45907 m!173497))

(assert (=> d!45907 m!172675))

(declare-fun m!173499 () Bool)

(assert (=> d!45907 m!173499))

(declare-fun m!173501 () Bool)

(assert (=> d!45907 m!173501))

(declare-fun m!173503 () Bool)

(assert (=> d!45907 m!173503))

(declare-fun m!173505 () Bool)

(assert (=> d!45907 m!173505))

(assert (=> d!45907 m!172675))

(declare-fun m!173507 () Bool)

(assert (=> d!45907 m!173507))

(assert (=> d!45907 m!172849))

(assert (=> d!45907 m!173209))

(assert (=> d!45907 m!173497))

(assert (=> d!45907 m!173489))

(declare-fun m!173509 () Bool)

(assert (=> d!45907 m!173509))

(assert (=> d!45907 m!172701))

(declare-fun m!173511 () Bool)

(assert (=> bm!15943 m!173511))

(assert (=> bm!15857 d!45907))

(declare-fun d!45909 () Bool)

(declare-fun res!68464 () Bool)

(declare-fun e!93638 () Bool)

(assert (=> d!45909 (=> res!68464 e!93638)))

(assert (=> d!45909 (= res!68464 (= (select (arr!2321 (_keys!4726 newMap!16)) #b00000000000000000000000000000000) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> d!45909 (= (arrayContainsKey!0 (_keys!4726 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) #b00000000000000000000000000000000) e!93638)))

(declare-fun b!143710 () Bool)

(declare-fun e!93639 () Bool)

(assert (=> b!143710 (= e!93638 e!93639)))

(declare-fun res!68465 () Bool)

(assert (=> b!143710 (=> (not res!68465) (not e!93639))))

(assert (=> b!143710 (= res!68465 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2594 (_keys!4726 newMap!16))))))

(declare-fun b!143711 () Bool)

(assert (=> b!143711 (= e!93639 (arrayContainsKey!0 (_keys!4726 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!45909 (not res!68464)) b!143710))

(assert (= (and b!143710 res!68465) b!143711))

(assert (=> d!45909 m!172935))

(assert (=> b!143711 m!172675))

(declare-fun m!173513 () Bool)

(assert (=> b!143711 m!173513))

(assert (=> bm!15854 d!45909))

(declare-fun d!45911 () Bool)

(declare-fun e!93642 () Bool)

(assert (=> d!45911 e!93642))

(declare-fun res!68471 () Bool)

(assert (=> d!45911 (=> (not res!68471) (not e!93642))))

(declare-fun lt!75390 () SeekEntryResult!280)

(assert (=> d!45911 (= res!68471 ((_ is Found!280) lt!75390))))

(assert (=> d!45911 (= lt!75390 (seekEntryOrOpen!0 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (_keys!4726 newMap!16) (mask!7315 newMap!16)))))

(declare-fun lt!75389 () Unit!4535)

(declare-fun choose!878 (array!4911 array!4913 (_ BitVec 32) (_ BitVec 32) V!3563 V!3563 (_ BitVec 64) Int) Unit!4535)

(assert (=> d!45911 (= lt!75389 (choose!878 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)))))

(assert (=> d!45911 (validMask!0 (mask!7315 newMap!16))))

(assert (=> d!45911 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!66 (_keys!4726 newMap!16) (_values!2946 newMap!16) (mask!7315 newMap!16) (extraKeys!2714 newMap!16) (zeroValue!2811 newMap!16) (minValue!2811 newMap!16) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355) (defaultEntry!2963 newMap!16)) lt!75389)))

(declare-fun b!143716 () Bool)

(declare-fun res!68470 () Bool)

(assert (=> b!143716 (=> (not res!68470) (not e!93642))))

(assert (=> b!143716 (= res!68470 (inRange!0 (index!3285 lt!75390) (mask!7315 newMap!16)))))

(declare-fun b!143717 () Bool)

(assert (=> b!143717 (= e!93642 (= (select (arr!2321 (_keys!4726 newMap!16)) (index!3285 lt!75390)) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> b!143717 (and (bvsge (index!3285 lt!75390) #b00000000000000000000000000000000) (bvslt (index!3285 lt!75390) (size!2594 (_keys!4726 newMap!16))))))

(assert (= (and d!45911 res!68471) b!143716))

(assert (= (and b!143716 res!68470) b!143717))

(assert (=> d!45911 m!172675))

(assert (=> d!45911 m!172793))

(assert (=> d!45911 m!172675))

(declare-fun m!173515 () Bool)

(assert (=> d!45911 m!173515))

(assert (=> d!45911 m!172933))

(declare-fun m!173517 () Bool)

(assert (=> b!143716 m!173517))

(declare-fun m!173519 () Bool)

(assert (=> b!143717 m!173519))

(assert (=> bm!15863 d!45911))

(declare-fun d!45913 () Bool)

(declare-fun e!93644 () Bool)

(assert (=> d!45913 e!93644))

(declare-fun res!68472 () Bool)

(assert (=> d!45913 (=> res!68472 e!93644)))

(declare-fun lt!75392 () Bool)

(assert (=> d!45913 (= res!68472 (not lt!75392))))

(declare-fun lt!75393 () Bool)

(assert (=> d!45913 (= lt!75392 lt!75393)))

(declare-fun lt!75394 () Unit!4535)

(declare-fun e!93643 () Unit!4535)

(assert (=> d!45913 (= lt!75394 e!93643)))

(declare-fun c!27216 () Bool)

(assert (=> d!45913 (= c!27216 lt!75393)))

(assert (=> d!45913 (= lt!75393 (containsKey!181 (toList!890 call!15864) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> d!45913 (= (contains!927 call!15864 (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)) lt!75392)))

(declare-fun b!143718 () Bool)

(declare-fun lt!75391 () Unit!4535)

(assert (=> b!143718 (= e!93643 lt!75391)))

(assert (=> b!143718 (= lt!75391 (lemmaContainsKeyImpliesGetValueByKeyDefined!129 (toList!890 call!15864) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(assert (=> b!143718 (isDefined!130 (getValueByKey!177 (toList!890 call!15864) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355)))))

(declare-fun b!143719 () Bool)

(declare-fun Unit!4556 () Unit!4535)

(assert (=> b!143719 (= e!93643 Unit!4556)))

(declare-fun b!143720 () Bool)

(assert (=> b!143720 (= e!93644 (isDefined!130 (getValueByKey!177 (toList!890 call!15864) (select (arr!2321 (_keys!4726 (v!3297 (underlying!483 thiss!992)))) from!355))))))

(assert (= (and d!45913 c!27216) b!143718))

(assert (= (and d!45913 (not c!27216)) b!143719))

(assert (= (and d!45913 (not res!68472)) b!143720))

(assert (=> d!45913 m!172675))

(declare-fun m!173521 () Bool)

(assert (=> d!45913 m!173521))

(assert (=> b!143718 m!172675))

(declare-fun m!173523 () Bool)

(assert (=> b!143718 m!173523))

(assert (=> b!143718 m!172675))

(declare-fun m!173525 () Bool)

(assert (=> b!143718 m!173525))

(assert (=> b!143718 m!173525))

(declare-fun m!173527 () Bool)

(assert (=> b!143718 m!173527))

(assert (=> b!143720 m!172675))

(assert (=> b!143720 m!173525))

(assert (=> b!143720 m!173525))

(assert (=> b!143720 m!173527))

(assert (=> b!143241 d!45913))

(declare-fun b!143721 () Bool)

(declare-fun e!93646 () Bool)

(assert (=> b!143721 (= e!93646 tp_is_empty!2937)))

(declare-fun mapIsEmpty!4873 () Bool)

(declare-fun mapRes!4873 () Bool)

(assert (=> mapIsEmpty!4873 mapRes!4873))

(declare-fun mapNonEmpty!4873 () Bool)

(declare-fun tp!11623 () Bool)

(assert (=> mapNonEmpty!4873 (= mapRes!4873 (and tp!11623 e!93646))))

(declare-fun mapRest!4873 () (Array (_ BitVec 32) ValueCell!1125))

(declare-fun mapValue!4873 () ValueCell!1125)

(declare-fun mapKey!4873 () (_ BitVec 32))

(assert (=> mapNonEmpty!4873 (= mapRest!4871 (store mapRest!4873 mapKey!4873 mapValue!4873))))

(declare-fun b!143722 () Bool)

(declare-fun e!93645 () Bool)

(assert (=> b!143722 (= e!93645 tp_is_empty!2937)))

(declare-fun condMapEmpty!4873 () Bool)

(declare-fun mapDefault!4873 () ValueCell!1125)

(assert (=> mapNonEmpty!4871 (= condMapEmpty!4873 (= mapRest!4871 ((as const (Array (_ BitVec 32) ValueCell!1125)) mapDefault!4873)))))

(assert (=> mapNonEmpty!4871 (= tp!11621 (and e!93645 mapRes!4873))))

(assert (= (and mapNonEmpty!4871 condMapEmpty!4873) mapIsEmpty!4873))

(assert (= (and mapNonEmpty!4871 (not condMapEmpty!4873)) mapNonEmpty!4873))

(assert (= (and mapNonEmpty!4873 ((_ is ValueCellFull!1125) mapValue!4873)) b!143721))

(assert (= (and mapNonEmpty!4871 ((_ is ValueCellFull!1125) mapDefault!4873)) b!143722))

(declare-fun m!173529 () Bool)

(assert (=> mapNonEmpty!4873 m!173529))

(declare-fun b!143723 () Bool)

(declare-fun e!93648 () Bool)

(assert (=> b!143723 (= e!93648 tp_is_empty!2937)))

(declare-fun mapIsEmpty!4874 () Bool)

(declare-fun mapRes!4874 () Bool)

(assert (=> mapIsEmpty!4874 mapRes!4874))

(declare-fun mapNonEmpty!4874 () Bool)

(declare-fun tp!11624 () Bool)

(assert (=> mapNonEmpty!4874 (= mapRes!4874 (and tp!11624 e!93648))))

(declare-fun mapKey!4874 () (_ BitVec 32))

(declare-fun mapValue!4874 () ValueCell!1125)

(declare-fun mapRest!4874 () (Array (_ BitVec 32) ValueCell!1125))

(assert (=> mapNonEmpty!4874 (= mapRest!4872 (store mapRest!4874 mapKey!4874 mapValue!4874))))

(declare-fun b!143724 () Bool)

(declare-fun e!93647 () Bool)

(assert (=> b!143724 (= e!93647 tp_is_empty!2937)))

(declare-fun condMapEmpty!4874 () Bool)

(declare-fun mapDefault!4874 () ValueCell!1125)

(assert (=> mapNonEmpty!4872 (= condMapEmpty!4874 (= mapRest!4872 ((as const (Array (_ BitVec 32) ValueCell!1125)) mapDefault!4874)))))

(assert (=> mapNonEmpty!4872 (= tp!11622 (and e!93647 mapRes!4874))))

(assert (= (and mapNonEmpty!4872 condMapEmpty!4874) mapIsEmpty!4874))

(assert (= (and mapNonEmpty!4872 (not condMapEmpty!4874)) mapNonEmpty!4874))

(assert (= (and mapNonEmpty!4874 ((_ is ValueCellFull!1125) mapValue!4874)) b!143723))

(assert (= (and mapNonEmpty!4872 ((_ is ValueCellFull!1125) mapDefault!4874)) b!143724))

(declare-fun m!173531 () Bool)

(assert (=> mapNonEmpty!4874 m!173531))

(declare-fun b_lambda!6443 () Bool)

(assert (= b_lambda!6441 (or (and b!143053 b_free!3041 (= (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) (defaultEntry!2963 newMap!16))) (and b!143045 b_free!3043) b_lambda!6443)))

(declare-fun b_lambda!6445 () Bool)

(assert (= b_lambda!6431 (or (and b!143053 b_free!3041) (and b!143045 b_free!3043 (= (defaultEntry!2963 newMap!16) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))))) b_lambda!6445)))

(declare-fun b_lambda!6447 () Bool)

(assert (= b_lambda!6437 (or (and b!143053 b_free!3041 (= (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) (defaultEntry!2963 newMap!16))) (and b!143045 b_free!3043) b_lambda!6447)))

(declare-fun b_lambda!6449 () Bool)

(assert (= b_lambda!6433 (or (and b!143053 b_free!3041) (and b!143045 b_free!3043 (= (defaultEntry!2963 newMap!16) (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))))) b_lambda!6449)))

(declare-fun b_lambda!6451 () Bool)

(assert (= b_lambda!6435 (or (and b!143053 b_free!3041 (= (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) (defaultEntry!2963 newMap!16))) (and b!143045 b_free!3043) b_lambda!6451)))

(declare-fun b_lambda!6453 () Bool)

(assert (= b_lambda!6439 (or (and b!143053 b_free!3041 (= (defaultEntry!2963 (v!3297 (underlying!483 thiss!992))) (defaultEntry!2963 newMap!16))) (and b!143045 b_free!3043) b_lambda!6453)))

(check-sat (not b!143502) (not b!143504) (not d!45893) (not bm!15903) (not b!143653) (not b!143595) (not d!45865) (not b!143708) (not b!143445) tp_is_empty!2937 (not b!143544) (not b!143503) (not b!143451) (not d!45783) (not b!143707) (not b!143533) (not bm!15889) (not d!45905) (not b!143646) (not b!143649) (not b_next!3043) (not b!143374) (not d!45899) (not d!45891) b_and!8955 (not d!45863) (not b!143538) (not b!143651) (not b!143535) (not d!45805) (not bm!15910) (not b_lambda!6443) (not b!143391) (not bm!15943) (not bm!15898) (not b_next!3041) (not b!143590) (not b!143647) (not bm!15925) (not d!45871) (not b!143620) (not b!143654) (not b!143505) (not b_lambda!6447) (not b!143625) (not b!143358) (not b!143716) (not b!143507) (not d!45847) (not d!45873) (not bm!15931) (not b!143411) (not b!143636) (not b!143457) (not b!143652) (not mapNonEmpty!4874) (not b!143619) (not b!143559) (not bm!15904) (not d!45901) (not b!143561) (not d!45861) (not bm!15893) (not b!143557) (not b!143642) (not b!143397) (not b!143571) (not b!143645) (not bm!15941) (not b!143456) (not b!143446) (not b!143605) (not bm!15899) (not d!45879) (not d!45883) (not d!45821) (not b!143604) (not b!143718) (not b!143628) (not d!45855) (not b!143450) (not b!143531) (not d!45827) (not d!45839) (not b!143697) (not b!143576) (not bm!15927) (not b!143564) (not b!143656) (not bm!15914) (not bm!15911) (not b!143458) (not b!143500) (not b!143568) (not bm!15900) (not d!45903) (not b!143444) (not b!143537) (not b!143389) (not b_lambda!6429) (not mapNonEmpty!4873) (not b!143399) (not b!143699) (not bm!15906) (not bm!15940) (not d!45801) (not b!143698) (not d!45877) (not b!143588) (not d!45895) (not d!45787) (not b!143401) (not d!45907) (not d!45881) (not b!143597) (not d!45897) b_and!8957 (not d!45911) (not b!143640) (not b!143448) (not b!143592) (not bm!15913) (not bm!15930) (not d!45793) (not b!143635) (not bm!15917) (not d!45829) (not b_lambda!6451) (not b!143388) (not b!143638) (not b!143560) (not b!143555) (not d!45913) (not b!143632) (not b!143498) (not d!45809) (not b!143641) (not bm!15918) (not b_lambda!6453) (not d!45831) (not b!143519) (not b!143463) (not b!143601) (not b!143701) (not b!143523) (not b!143540) (not d!45843) (not bm!15921) (not d!45807) (not d!45841) (not bm!15892) (not b!143631) (not b!143536) (not bm!15907) (not d!45875) (not b!143655) (not d!45825) (not d!45779) (not b!143627) (not d!45815) (not b!143562) (not b!143569) (not b_lambda!6449) (not b!143629) (not d!45849) (not b!143643) (not b_lambda!6445) (not d!45869) (not b!143593) (not b!143490) (not b!143594) (not b!143547) (not b!143462) (not b!143398) (not b!143648) (not b!143602) (not b!143580) (not b!143658) (not b!143606) (not bm!15924) (not d!45789) (not d!45859) (not b!143412) (not d!45857) (not d!45867) (not d!45845) (not d!45833) (not b!143419) (not bm!15920) (not b!143711) (not b!143720) (not b!143447) (not d!45813) (not b!143615) (not b!143452) (not b!143396) (not b_lambda!6425) (not d!45823) (not b!143460) (not b!143386) (not d!45817))
(check-sat b_and!8955 b_and!8957 (not b_next!3041) (not b_next!3043))
