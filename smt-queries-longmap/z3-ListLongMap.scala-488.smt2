; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10842 () Bool)

(assert start!10842)

(declare-fun b!87608 () Bool)

(declare-fun b_free!2245 () Bool)

(declare-fun b_next!2245 () Bool)

(assert (=> b!87608 (= b_free!2245 (not b_next!2245))))

(declare-fun tp!8967 () Bool)

(declare-fun b_and!5269 () Bool)

(assert (=> b!87608 (= tp!8967 b_and!5269)))

(declare-fun b!87620 () Bool)

(declare-fun b_free!2247 () Bool)

(declare-fun b_next!2247 () Bool)

(assert (=> b!87620 (= b_free!2247 (not b_next!2247))))

(declare-fun tp!8969 () Bool)

(declare-fun b_and!5271 () Bool)

(assert (=> b!87620 (= tp!8969 b_and!5271)))

(declare-fun b!87605 () Bool)

(declare-fun e!57075 () Bool)

(declare-datatypes ((V!3033 0))(
  ( (V!3034 (val!1314 Int)) )
))
(declare-datatypes ((array!4025 0))(
  ( (array!4026 (arr!1916 (Array (_ BitVec 32) (_ BitVec 64))) (size!2161 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!926 0))(
  ( (ValueCellFull!926 (v!2663 V!3033)) (EmptyCell!926) )
))
(declare-datatypes ((array!4027 0))(
  ( (array!4028 (arr!1917 (Array (_ BitVec 32) ValueCell!926)) (size!2162 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!760 0))(
  ( (LongMapFixedSize!761 (defaultEntry!2358 Int) (mask!6396 (_ BitVec 32)) (extraKeys!2193 (_ BitVec 32)) (zeroValue!2248 V!3033) (minValue!2248 V!3033) (_size!429 (_ BitVec 32)) (_keys!4034 array!4025) (_values!2341 array!4027) (_vacant!429 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!568 0))(
  ( (Cell!569 (v!2664 LongMapFixedSize!760)) )
))
(declare-datatypes ((LongMap!568 0))(
  ( (LongMap!569 (underlying!295 Cell!568)) )
))
(declare-fun thiss!992 () LongMap!568)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4025 (_ BitVec 32)) Bool)

(assert (=> b!87605 (= e!57075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87606 () Bool)

(declare-fun e!57078 () Bool)

(declare-fun tp_is_empty!2539 () Bool)

(assert (=> b!87606 (= e!57078 tp_is_empty!2539)))

(declare-fun mapIsEmpty!3419 () Bool)

(declare-fun mapRes!3420 () Bool)

(assert (=> mapIsEmpty!3419 mapRes!3420))

(declare-fun b!87607 () Bool)

(declare-fun e!57070 () Bool)

(declare-fun e!57081 () Bool)

(assert (=> b!87607 (= e!57070 e!57081)))

(declare-fun e!57068 () Bool)

(declare-fun array_inv!1181 (array!4025) Bool)

(declare-fun array_inv!1182 (array!4027) Bool)

(assert (=> b!87608 (= e!57081 (and tp!8967 tp_is_empty!2539 (array_inv!1181 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (array_inv!1182 (_values!2341 (v!2664 (underlying!295 thiss!992)))) e!57068))))

(declare-fun res!44934 () Bool)

(declare-fun e!57083 () Bool)

(assert (=> start!10842 (=> (not res!44934) (not e!57083))))

(declare-fun valid!338 (LongMap!568) Bool)

(assert (=> start!10842 (= res!44934 (valid!338 thiss!992))))

(assert (=> start!10842 e!57083))

(declare-fun e!57071 () Bool)

(assert (=> start!10842 e!57071))

(assert (=> start!10842 true))

(declare-fun e!57069 () Bool)

(assert (=> start!10842 e!57069))

(declare-fun b!87609 () Bool)

(assert (=> b!87609 (= e!57068 (and e!57078 mapRes!3420))))

(declare-fun condMapEmpty!3420 () Bool)

(declare-fun mapDefault!3419 () ValueCell!926)

(assert (=> b!87609 (= condMapEmpty!3420 (= (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3419)))))

(declare-fun b!87610 () Bool)

(declare-datatypes ((Unit!2582 0))(
  ( (Unit!2583) )
))
(declare-fun e!57080 () Unit!2582)

(declare-fun Unit!2584 () Unit!2582)

(assert (=> b!87610 (= e!57080 Unit!2584)))

(declare-fun lt!41610 () Unit!2582)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!60 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) (_ BitVec 32) Int) Unit!2582)

(assert (=> b!87610 (= lt!41610 (lemmaListMapContainsThenArrayContainsFrom!60 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!87610 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!41608 () Unit!2582)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4025 (_ BitVec 32) (_ BitVec 32)) Unit!2582)

(assert (=> b!87610 (= lt!41608 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1511 0))(
  ( (Nil!1508) (Cons!1507 (h!2099 (_ BitVec 64)) (t!5245 List!1511)) )
))
(declare-fun arrayNoDuplicates!0 (array!4025 (_ BitVec 32) List!1511) Bool)

(assert (=> b!87610 (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) from!355 Nil!1508)))

(declare-fun lt!41613 () Unit!2582)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4025 (_ BitVec 32) (_ BitVec 64) List!1511) Unit!2582)

(assert (=> b!87610 (= lt!41613 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508)))))

(assert (=> b!87610 false))

(declare-fun b!87611 () Bool)

(declare-fun e!57067 () Bool)

(declare-fun e!57066 () Bool)

(declare-fun mapRes!3419 () Bool)

(assert (=> b!87611 (= e!57067 (and e!57066 mapRes!3419))))

(declare-fun condMapEmpty!3419 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!760)

(declare-fun mapDefault!3420 () ValueCell!926)

(assert (=> b!87611 (= condMapEmpty!3419 (= (arr!1917 (_values!2341 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3420)))))

(declare-fun b!87612 () Bool)

(declare-fun res!44926 () Bool)

(assert (=> b!87612 (=> (not res!44926) (not e!57083))))

(declare-fun valid!339 (LongMapFixedSize!760) Bool)

(assert (=> b!87612 (= res!44926 (valid!339 newMap!16))))

(declare-fun mapIsEmpty!3420 () Bool)

(assert (=> mapIsEmpty!3420 mapRes!3419))

(declare-fun b!87613 () Bool)

(declare-fun e!57076 () Bool)

(assert (=> b!87613 (= e!57083 e!57076)))

(declare-fun res!44928 () Bool)

(assert (=> b!87613 (=> (not res!44928) (not e!57076))))

(declare-datatypes ((tuple2!2192 0))(
  ( (tuple2!2193 (_1!1107 (_ BitVec 64)) (_2!1107 V!3033)) )
))
(declare-datatypes ((List!1512 0))(
  ( (Nil!1509) (Cons!1508 (h!2100 tuple2!2192) (t!5246 List!1512)) )
))
(declare-datatypes ((ListLongMap!1445 0))(
  ( (ListLongMap!1446 (toList!738 List!1512)) )
))
(declare-fun lt!41612 () ListLongMap!1445)

(declare-fun lt!41605 () ListLongMap!1445)

(assert (=> b!87613 (= res!44928 (= lt!41612 lt!41605))))

(declare-fun map!1199 (LongMapFixedSize!760) ListLongMap!1445)

(assert (=> b!87613 (= lt!41605 (map!1199 newMap!16))))

(declare-fun getCurrentListMap!431 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) ListLongMap!1445)

(assert (=> b!87613 (= lt!41612 (getCurrentListMap!431 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87614 () Bool)

(declare-fun res!44929 () Bool)

(assert (=> b!87614 (=> (not res!44929) (not e!57083))))

(assert (=> b!87614 (= res!44929 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6396 newMap!16)) (_size!429 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87615 () Bool)

(assert (=> b!87615 (= e!57071 e!57070)))

(declare-fun b!87616 () Bool)

(declare-fun e!57074 () Bool)

(assert (=> b!87616 (= e!57074 (not e!57075))))

(declare-fun res!44933 () Bool)

(assert (=> b!87616 (=> res!44933 e!57075)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!87616 (= res!44933 (not (validMask!0 (mask!6396 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun lt!41611 () tuple2!2192)

(declare-fun lt!41604 () tuple2!2192)

(declare-fun lt!41600 () ListLongMap!1445)

(declare-fun lt!41599 () ListLongMap!1445)

(declare-fun +!109 (ListLongMap!1445 tuple2!2192) ListLongMap!1445)

(assert (=> b!87616 (= (+!109 lt!41599 lt!41611) (+!109 (+!109 lt!41600 lt!41611) lt!41604))))

(assert (=> b!87616 (= lt!41611 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun lt!41609 () V!3033)

(declare-fun lt!41601 () Unit!2582)

(declare-fun addCommutativeForDiffKeys!29 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64) V!3033) Unit!2582)

(assert (=> b!87616 (= lt!41601 (addCommutativeForDiffKeys!29 lt!41600 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun lt!41607 () ListLongMap!1445)

(assert (=> b!87616 (= lt!41607 lt!41599)))

(assert (=> b!87616 (= lt!41599 (+!109 lt!41600 lt!41604))))

(declare-fun lt!41598 () ListLongMap!1445)

(declare-fun lt!41606 () tuple2!2192)

(assert (=> b!87616 (= lt!41607 (+!109 lt!41598 lt!41606))))

(declare-fun lt!41614 () ListLongMap!1445)

(assert (=> b!87616 (= lt!41600 (+!109 lt!41614 lt!41606))))

(assert (=> b!87616 (= lt!41606 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(assert (=> b!87616 (= lt!41598 (+!109 lt!41614 lt!41604))))

(assert (=> b!87616 (= lt!41604 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))

(declare-fun lt!41597 () Unit!2582)

(assert (=> b!87616 (= lt!41597 (addCommutativeForDiffKeys!29 lt!41614 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!74 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) ListLongMap!1445)

(assert (=> b!87616 (= lt!41614 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87617 () Bool)

(declare-fun e!57073 () Bool)

(assert (=> b!87617 (= e!57076 e!57073)))

(declare-fun res!44931 () Bool)

(assert (=> b!87617 (=> (not res!44931) (not e!57073))))

(assert (=> b!87617 (= res!44931 (and (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1210 (ValueCell!926 V!3033) V!3033)

(declare-fun dynLambda!345 (Int (_ BitVec 64)) V!3033)

(assert (=> b!87617 (= lt!41609 (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87618 () Bool)

(assert (=> b!87618 (= e!57073 e!57074)))

(declare-fun res!44932 () Bool)

(assert (=> b!87618 (=> (not res!44932) (not e!57074))))

(declare-datatypes ((tuple2!2194 0))(
  ( (tuple2!2195 (_1!1108 Bool) (_2!1108 LongMapFixedSize!760)) )
))
(declare-fun lt!41603 () tuple2!2194)

(assert (=> b!87618 (= res!44932 (and (_1!1108 lt!41603) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!41602 () Unit!2582)

(assert (=> b!87618 (= lt!41602 e!57080)))

(declare-fun c!14450 () Bool)

(declare-fun contains!750 (ListLongMap!1445 (_ BitVec 64)) Bool)

(assert (=> b!87618 (= c!14450 (contains!750 lt!41605 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun update!124 (LongMapFixedSize!760 (_ BitVec 64) V!3033) tuple2!2194)

(assert (=> b!87618 (= lt!41603 (update!124 newMap!16 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))

(declare-fun b!87619 () Bool)

(declare-fun Unit!2585 () Unit!2582)

(assert (=> b!87619 (= e!57080 Unit!2585)))

(declare-fun mapNonEmpty!3419 () Bool)

(declare-fun tp!8968 () Bool)

(declare-fun e!57072 () Bool)

(assert (=> mapNonEmpty!3419 (= mapRes!3419 (and tp!8968 e!57072))))

(declare-fun mapKey!3419 () (_ BitVec 32))

(declare-fun mapValue!3420 () ValueCell!926)

(declare-fun mapRest!3419 () (Array (_ BitVec 32) ValueCell!926))

(assert (=> mapNonEmpty!3419 (= (arr!1917 (_values!2341 newMap!16)) (store mapRest!3419 mapKey!3419 mapValue!3420))))

(assert (=> b!87620 (= e!57069 (and tp!8969 tp_is_empty!2539 (array_inv!1181 (_keys!4034 newMap!16)) (array_inv!1182 (_values!2341 newMap!16)) e!57067))))

(declare-fun b!87621 () Bool)

(declare-fun res!44927 () Bool)

(assert (=> b!87621 (=> res!44927 e!57075)))

(assert (=> b!87621 (= res!44927 (or (not (= (size!2162 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6396 (v!2664 (underlying!295 thiss!992)))))) (not (= (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (size!2162 (_values!2341 (v!2664 (underlying!295 thiss!992)))))) (bvslt (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!3420 () Bool)

(declare-fun tp!8970 () Bool)

(declare-fun e!57079 () Bool)

(assert (=> mapNonEmpty!3420 (= mapRes!3420 (and tp!8970 e!57079))))

(declare-fun mapKey!3420 () (_ BitVec 32))

(declare-fun mapRest!3420 () (Array (_ BitVec 32) ValueCell!926))

(declare-fun mapValue!3419 () ValueCell!926)

(assert (=> mapNonEmpty!3420 (= (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (store mapRest!3420 mapKey!3420 mapValue!3419))))

(declare-fun b!87622 () Bool)

(assert (=> b!87622 (= e!57072 tp_is_empty!2539)))

(declare-fun b!87623 () Bool)

(assert (=> b!87623 (= e!57079 tp_is_empty!2539)))

(declare-fun b!87624 () Bool)

(assert (=> b!87624 (= e!57066 tp_is_empty!2539)))

(declare-fun b!87625 () Bool)

(declare-fun res!44930 () Bool)

(assert (=> b!87625 (=> (not res!44930) (not e!57083))))

(assert (=> b!87625 (= res!44930 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992)))))))))

(assert (= (and start!10842 res!44934) b!87625))

(assert (= (and b!87625 res!44930) b!87612))

(assert (= (and b!87612 res!44926) b!87614))

(assert (= (and b!87614 res!44929) b!87613))

(assert (= (and b!87613 res!44928) b!87617))

(assert (= (and b!87617 res!44931) b!87618))

(assert (= (and b!87618 c!14450) b!87610))

(assert (= (and b!87618 (not c!14450)) b!87619))

(assert (= (and b!87618 res!44932) b!87616))

(assert (= (and b!87616 (not res!44933)) b!87621))

(assert (= (and b!87621 (not res!44927)) b!87605))

(assert (= (and b!87609 condMapEmpty!3420) mapIsEmpty!3419))

(assert (= (and b!87609 (not condMapEmpty!3420)) mapNonEmpty!3420))

(get-info :version)

(assert (= (and mapNonEmpty!3420 ((_ is ValueCellFull!926) mapValue!3419)) b!87623))

(assert (= (and b!87609 ((_ is ValueCellFull!926) mapDefault!3419)) b!87606))

(assert (= b!87608 b!87609))

(assert (= b!87607 b!87608))

(assert (= b!87615 b!87607))

(assert (= start!10842 b!87615))

(assert (= (and b!87611 condMapEmpty!3419) mapIsEmpty!3420))

(assert (= (and b!87611 (not condMapEmpty!3419)) mapNonEmpty!3419))

(assert (= (and mapNonEmpty!3419 ((_ is ValueCellFull!926) mapValue!3420)) b!87622))

(assert (= (and b!87611 ((_ is ValueCellFull!926) mapDefault!3420)) b!87624))

(assert (= b!87620 b!87611))

(assert (= start!10842 b!87620))

(declare-fun b_lambda!3887 () Bool)

(assert (=> (not b_lambda!3887) (not b!87617)))

(declare-fun t!5242 () Bool)

(declare-fun tb!1701 () Bool)

(assert (=> (and b!87608 (= (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))) t!5242) tb!1701))

(declare-fun result!2931 () Bool)

(assert (=> tb!1701 (= result!2931 tp_is_empty!2539)))

(assert (=> b!87617 t!5242))

(declare-fun b_and!5273 () Bool)

(assert (= b_and!5269 (and (=> t!5242 result!2931) b_and!5273)))

(declare-fun tb!1703 () Bool)

(declare-fun t!5244 () Bool)

(assert (=> (and b!87620 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))) t!5244) tb!1703))

(declare-fun result!2935 () Bool)

(assert (= result!2935 result!2931))

(assert (=> b!87617 t!5244))

(declare-fun b_and!5275 () Bool)

(assert (= b_and!5271 (and (=> t!5244 result!2935) b_and!5275)))

(declare-fun m!93405 () Bool)

(assert (=> b!87618 m!93405))

(assert (=> b!87618 m!93405))

(declare-fun m!93407 () Bool)

(assert (=> b!87618 m!93407))

(assert (=> b!87618 m!93405))

(declare-fun m!93409 () Bool)

(assert (=> b!87618 m!93409))

(declare-fun m!93411 () Bool)

(assert (=> b!87610 m!93411))

(declare-fun m!93413 () Bool)

(assert (=> b!87610 m!93413))

(assert (=> b!87610 m!93405))

(declare-fun m!93415 () Bool)

(assert (=> b!87610 m!93415))

(assert (=> b!87610 m!93405))

(assert (=> b!87610 m!93405))

(declare-fun m!93417 () Bool)

(assert (=> b!87610 m!93417))

(assert (=> b!87610 m!93405))

(declare-fun m!93419 () Bool)

(assert (=> b!87610 m!93419))

(declare-fun m!93421 () Bool)

(assert (=> b!87605 m!93421))

(declare-fun m!93423 () Bool)

(assert (=> mapNonEmpty!3420 m!93423))

(declare-fun m!93425 () Bool)

(assert (=> b!87616 m!93425))

(declare-fun m!93427 () Bool)

(assert (=> b!87616 m!93427))

(assert (=> b!87616 m!93425))

(declare-fun m!93429 () Bool)

(assert (=> b!87616 m!93429))

(declare-fun m!93431 () Bool)

(assert (=> b!87616 m!93431))

(assert (=> b!87616 m!93405))

(declare-fun m!93433 () Bool)

(assert (=> b!87616 m!93433))

(assert (=> b!87616 m!93405))

(declare-fun m!93435 () Bool)

(assert (=> b!87616 m!93435))

(declare-fun m!93437 () Bool)

(assert (=> b!87616 m!93437))

(assert (=> b!87616 m!93405))

(declare-fun m!93439 () Bool)

(assert (=> b!87616 m!93439))

(declare-fun m!93441 () Bool)

(assert (=> b!87616 m!93441))

(declare-fun m!93443 () Bool)

(assert (=> b!87616 m!93443))

(declare-fun m!93445 () Bool)

(assert (=> b!87616 m!93445))

(declare-fun m!93447 () Bool)

(assert (=> start!10842 m!93447))

(declare-fun m!93449 () Bool)

(assert (=> mapNonEmpty!3419 m!93449))

(assert (=> b!87617 m!93405))

(declare-fun m!93451 () Bool)

(assert (=> b!87617 m!93451))

(declare-fun m!93453 () Bool)

(assert (=> b!87617 m!93453))

(assert (=> b!87617 m!93451))

(assert (=> b!87617 m!93453))

(declare-fun m!93455 () Bool)

(assert (=> b!87617 m!93455))

(declare-fun m!93457 () Bool)

(assert (=> b!87612 m!93457))

(declare-fun m!93459 () Bool)

(assert (=> b!87613 m!93459))

(declare-fun m!93461 () Bool)

(assert (=> b!87613 m!93461))

(declare-fun m!93463 () Bool)

(assert (=> b!87620 m!93463))

(declare-fun m!93465 () Bool)

(assert (=> b!87620 m!93465))

(declare-fun m!93467 () Bool)

(assert (=> b!87608 m!93467))

(declare-fun m!93469 () Bool)

(assert (=> b!87608 m!93469))

(check-sat (not b!87610) (not b!87612) (not start!10842) (not mapNonEmpty!3420) (not b_lambda!3887) (not b!87608) (not b!87618) b_and!5275 (not b_next!2245) b_and!5273 (not mapNonEmpty!3419) (not b!87616) (not b_next!2247) (not b!87617) (not b!87613) (not b!87620) tp_is_empty!2539 (not b!87605))
(check-sat b_and!5273 b_and!5275 (not b_next!2245) (not b_next!2247))
(get-model)

(declare-fun b_lambda!3893 () Bool)

(assert (= b_lambda!3887 (or (and b!87608 b_free!2245) (and b!87620 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))) b_lambda!3893)))

(check-sat (not b!87610) (not b!87612) (not start!10842) (not mapNonEmpty!3420) (not b!87608) (not b!87618) b_and!5275 (not b_next!2245) (not b_lambda!3893) b_and!5273 (not mapNonEmpty!3419) (not b!87616) (not b_next!2247) (not b!87617) (not b!87613) (not b!87620) tp_is_empty!2539 (not b!87605))
(check-sat b_and!5273 b_and!5275 (not b_next!2245) (not b_next!2247))
(get-model)

(declare-fun d!23333 () Bool)

(assert (=> d!23333 (= (map!1199 newMap!16) (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bs!3716 () Bool)

(assert (= bs!3716 d!23333))

(declare-fun m!93603 () Bool)

(assert (=> bs!3716 m!93603))

(assert (=> b!87613 d!23333))

(declare-fun b!87800 () Bool)

(declare-fun e!57223 () Bool)

(declare-fun lt!41774 () ListLongMap!1445)

(declare-fun apply!83 (ListLongMap!1445 (_ BitVec 64)) V!3033)

(assert (=> b!87800 (= e!57223 (= (apply!83 lt!41774 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87801 () Bool)

(declare-fun c!14473 () Bool)

(assert (=> b!87801 (= c!14473 (and (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57230 () ListLongMap!1445)

(declare-fun e!57229 () ListLongMap!1445)

(assert (=> b!87801 (= e!57230 e!57229)))

(declare-fun b!87802 () Bool)

(declare-fun e!57221 () Bool)

(declare-fun e!57228 () Bool)

(assert (=> b!87802 (= e!57221 e!57228)))

(declare-fun res!45011 () Bool)

(declare-fun call!8363 () Bool)

(assert (=> b!87802 (= res!45011 call!8363)))

(assert (=> b!87802 (=> (not res!45011) (not e!57228))))

(declare-fun b!87803 () Bool)

(declare-fun e!57226 () Bool)

(declare-fun e!57222 () Bool)

(assert (=> b!87803 (= e!57226 e!57222)))

(declare-fun res!45009 () Bool)

(assert (=> b!87803 (=> (not res!45009) (not e!57222))))

(assert (=> b!87803 (= res!45009 (contains!750 lt!41774 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!87803 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!87804 () Bool)

(assert (=> b!87804 (= e!57222 (= (apply!83 lt!41774 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87804 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2162 (_values!2341 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> b!87804 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!87805 () Bool)

(declare-fun e!57225 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!87805 (= e!57225 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!87806 () Bool)

(declare-fun call!8362 () ListLongMap!1445)

(assert (=> b!87806 (= e!57229 call!8362)))

(declare-fun call!8361 () ListLongMap!1445)

(declare-fun call!8364 () ListLongMap!1445)

(declare-fun call!8365 () ListLongMap!1445)

(declare-fun c!14470 () Bool)

(declare-fun c!14474 () Bool)

(declare-fun bm!8358 () Bool)

(assert (=> bm!8358 (= call!8361 (+!109 (ite c!14470 call!8364 (ite c!14474 call!8365 call!8362)) (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun bm!8359 () Bool)

(declare-fun call!8367 () Bool)

(assert (=> bm!8359 (= call!8367 (contains!750 lt!41774 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87807 () Bool)

(declare-fun res!45015 () Bool)

(declare-fun e!57220 () Bool)

(assert (=> b!87807 (=> (not res!45015) (not e!57220))))

(assert (=> b!87807 (= res!45015 e!57226)))

(declare-fun res!45007 () Bool)

(assert (=> b!87807 (=> res!45007 e!57226)))

(declare-fun e!57224 () Bool)

(assert (=> b!87807 (= res!45007 (not e!57224))))

(declare-fun res!45012 () Bool)

(assert (=> b!87807 (=> (not res!45012) (not e!57224))))

(assert (=> b!87807 (= res!45012 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!87808 () Bool)

(declare-fun e!57218 () Unit!2582)

(declare-fun Unit!2592 () Unit!2582)

(assert (=> b!87808 (= e!57218 Unit!2592)))

(declare-fun bm!8360 () Bool)

(declare-fun call!8366 () ListLongMap!1445)

(assert (=> bm!8360 (= call!8366 call!8361)))

(declare-fun d!23335 () Bool)

(assert (=> d!23335 e!57220))

(declare-fun res!45010 () Bool)

(assert (=> d!23335 (=> (not res!45010) (not e!57220))))

(assert (=> d!23335 (= res!45010 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun lt!41775 () ListLongMap!1445)

(assert (=> d!23335 (= lt!41774 lt!41775)))

(declare-fun lt!41778 () Unit!2582)

(assert (=> d!23335 (= lt!41778 e!57218)))

(declare-fun c!14471 () Bool)

(assert (=> d!23335 (= c!14471 e!57225)))

(declare-fun res!45013 () Bool)

(assert (=> d!23335 (=> (not res!45013) (not e!57225))))

(assert (=> d!23335 (= res!45013 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun e!57219 () ListLongMap!1445)

(assert (=> d!23335 (= lt!41775 e!57219)))

(assert (=> d!23335 (= c!14470 (and (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23335 (validMask!0 (mask!6396 (v!2664 (underlying!295 thiss!992))))))

(assert (=> d!23335 (= (getCurrentListMap!431 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))) lt!41774)))

(declare-fun b!87809 () Bool)

(declare-fun e!57227 () Bool)

(assert (=> b!87809 (= e!57227 (not call!8367))))

(declare-fun b!87810 () Bool)

(assert (=> b!87810 (= e!57221 (not call!8363))))

(declare-fun b!87811 () Bool)

(assert (=> b!87811 (= e!57219 (+!109 call!8361 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!87812 () Bool)

(assert (=> b!87812 (= e!57230 call!8366)))

(declare-fun b!87813 () Bool)

(declare-fun res!45014 () Bool)

(assert (=> b!87813 (=> (not res!45014) (not e!57220))))

(assert (=> b!87813 (= res!45014 e!57221)))

(declare-fun c!14472 () Bool)

(assert (=> b!87813 (= c!14472 (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8361 () Bool)

(assert (=> bm!8361 (= call!8365 call!8364)))

(declare-fun bm!8362 () Bool)

(assert (=> bm!8362 (= call!8364 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87814 () Bool)

(declare-fun lt!41767 () Unit!2582)

(assert (=> b!87814 (= e!57218 lt!41767)))

(declare-fun lt!41786 () ListLongMap!1445)

(assert (=> b!87814 (= lt!41786 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun lt!41785 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41785 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41788 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41788 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41782 () Unit!2582)

(declare-fun addStillContains!59 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2582)

(assert (=> b!87814 (= lt!41782 (addStillContains!59 lt!41786 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41788))))

(assert (=> b!87814 (contains!750 (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41788)))

(declare-fun lt!41783 () Unit!2582)

(assert (=> b!87814 (= lt!41783 lt!41782)))

(declare-fun lt!41781 () ListLongMap!1445)

(assert (=> b!87814 (= lt!41781 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun lt!41777 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41777 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41784 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41784 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41769 () Unit!2582)

(declare-fun addApplyDifferent!59 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2582)

(assert (=> b!87814 (= lt!41769 (addApplyDifferent!59 lt!41781 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41784))))

(assert (=> b!87814 (= (apply!83 (+!109 lt!41781 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41784) (apply!83 lt!41781 lt!41784))))

(declare-fun lt!41779 () Unit!2582)

(assert (=> b!87814 (= lt!41779 lt!41769)))

(declare-fun lt!41768 () ListLongMap!1445)

(assert (=> b!87814 (= lt!41768 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun lt!41776 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41773 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41773 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41772 () Unit!2582)

(assert (=> b!87814 (= lt!41772 (addApplyDifferent!59 lt!41768 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41773))))

(assert (=> b!87814 (= (apply!83 (+!109 lt!41768 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41773) (apply!83 lt!41768 lt!41773))))

(declare-fun lt!41770 () Unit!2582)

(assert (=> b!87814 (= lt!41770 lt!41772)))

(declare-fun lt!41787 () ListLongMap!1445)

(assert (=> b!87814 (= lt!41787 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun lt!41771 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41780 () (_ BitVec 64))

(assert (=> b!87814 (= lt!41780 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!87814 (= lt!41767 (addApplyDifferent!59 lt!41787 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41780))))

(assert (=> b!87814 (= (apply!83 (+!109 lt!41787 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41780) (apply!83 lt!41787 lt!41780))))

(declare-fun b!87815 () Bool)

(assert (=> b!87815 (= e!57228 (= (apply!83 lt!41774 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87816 () Bool)

(assert (=> b!87816 (= e!57227 e!57223)))

(declare-fun res!45008 () Bool)

(assert (=> b!87816 (= res!45008 call!8367)))

(assert (=> b!87816 (=> (not res!45008) (not e!57223))))

(declare-fun b!87817 () Bool)

(assert (=> b!87817 (= e!57229 call!8366)))

(declare-fun b!87818 () Bool)

(assert (=> b!87818 (= e!57224 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!87819 () Bool)

(assert (=> b!87819 (= e!57219 e!57230)))

(assert (=> b!87819 (= c!14474 (and (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!87820 () Bool)

(assert (=> b!87820 (= e!57220 e!57227)))

(declare-fun c!14469 () Bool)

(assert (=> b!87820 (= c!14469 (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8363 () Bool)

(assert (=> bm!8363 (= call!8362 call!8365)))

(declare-fun bm!8364 () Bool)

(assert (=> bm!8364 (= call!8363 (contains!750 lt!41774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23335 c!14470) b!87811))

(assert (= (and d!23335 (not c!14470)) b!87819))

(assert (= (and b!87819 c!14474) b!87812))

(assert (= (and b!87819 (not c!14474)) b!87801))

(assert (= (and b!87801 c!14473) b!87817))

(assert (= (and b!87801 (not c!14473)) b!87806))

(assert (= (or b!87817 b!87806) bm!8363))

(assert (= (or b!87812 bm!8363) bm!8361))

(assert (= (or b!87812 b!87817) bm!8360))

(assert (= (or b!87811 bm!8361) bm!8362))

(assert (= (or b!87811 bm!8360) bm!8358))

(assert (= (and d!23335 res!45013) b!87805))

(assert (= (and d!23335 c!14471) b!87814))

(assert (= (and d!23335 (not c!14471)) b!87808))

(assert (= (and d!23335 res!45010) b!87807))

(assert (= (and b!87807 res!45012) b!87818))

(assert (= (and b!87807 (not res!45007)) b!87803))

(assert (= (and b!87803 res!45009) b!87804))

(assert (= (and b!87807 res!45015) b!87813))

(assert (= (and b!87813 c!14472) b!87802))

(assert (= (and b!87813 (not c!14472)) b!87810))

(assert (= (and b!87802 res!45011) b!87815))

(assert (= (or b!87802 b!87810) bm!8364))

(assert (= (and b!87813 res!45014) b!87820))

(assert (= (and b!87820 c!14469) b!87816))

(assert (= (and b!87820 (not c!14469)) b!87809))

(assert (= (and b!87816 res!45008) b!87800))

(assert (= (or b!87816 b!87809) bm!8359))

(declare-fun b_lambda!3895 () Bool)

(assert (=> (not b_lambda!3895) (not b!87804)))

(assert (=> b!87804 t!5242))

(declare-fun b_and!5293 () Bool)

(assert (= b_and!5273 (and (=> t!5242 result!2931) b_and!5293)))

(assert (=> b!87804 t!5244))

(declare-fun b_and!5295 () Bool)

(assert (= b_and!5275 (and (=> t!5244 result!2935) b_and!5295)))

(declare-fun m!93605 () Bool)

(assert (=> b!87800 m!93605))

(declare-fun m!93607 () Bool)

(assert (=> b!87818 m!93607))

(assert (=> b!87818 m!93607))

(declare-fun m!93609 () Bool)

(assert (=> b!87818 m!93609))

(declare-fun m!93611 () Bool)

(assert (=> b!87815 m!93611))

(declare-fun m!93613 () Bool)

(assert (=> bm!8359 m!93613))

(declare-fun m!93615 () Bool)

(assert (=> b!87811 m!93615))

(assert (=> bm!8362 m!93445))

(assert (=> b!87803 m!93607))

(assert (=> b!87803 m!93607))

(declare-fun m!93617 () Bool)

(assert (=> b!87803 m!93617))

(assert (=> d!23335 m!93441))

(declare-fun m!93619 () Bool)

(assert (=> bm!8364 m!93619))

(declare-fun m!93621 () Bool)

(assert (=> b!87804 m!93621))

(assert (=> b!87804 m!93453))

(declare-fun m!93623 () Bool)

(assert (=> b!87804 m!93623))

(assert (=> b!87804 m!93453))

(assert (=> b!87804 m!93621))

(assert (=> b!87804 m!93607))

(declare-fun m!93625 () Bool)

(assert (=> b!87804 m!93625))

(assert (=> b!87804 m!93607))

(declare-fun m!93627 () Bool)

(assert (=> bm!8358 m!93627))

(assert (=> b!87805 m!93607))

(assert (=> b!87805 m!93607))

(assert (=> b!87805 m!93609))

(declare-fun m!93629 () Bool)

(assert (=> b!87814 m!93629))

(declare-fun m!93631 () Bool)

(assert (=> b!87814 m!93631))

(declare-fun m!93633 () Bool)

(assert (=> b!87814 m!93633))

(declare-fun m!93635 () Bool)

(assert (=> b!87814 m!93635))

(declare-fun m!93637 () Bool)

(assert (=> b!87814 m!93637))

(declare-fun m!93639 () Bool)

(assert (=> b!87814 m!93639))

(declare-fun m!93641 () Bool)

(assert (=> b!87814 m!93641))

(declare-fun m!93643 () Bool)

(assert (=> b!87814 m!93643))

(declare-fun m!93645 () Bool)

(assert (=> b!87814 m!93645))

(declare-fun m!93647 () Bool)

(assert (=> b!87814 m!93647))

(declare-fun m!93649 () Bool)

(assert (=> b!87814 m!93649))

(assert (=> b!87814 m!93629))

(assert (=> b!87814 m!93637))

(assert (=> b!87814 m!93607))

(assert (=> b!87814 m!93445))

(declare-fun m!93651 () Bool)

(assert (=> b!87814 m!93651))

(assert (=> b!87814 m!93649))

(declare-fun m!93653 () Bool)

(assert (=> b!87814 m!93653))

(assert (=> b!87814 m!93633))

(declare-fun m!93655 () Bool)

(assert (=> b!87814 m!93655))

(declare-fun m!93657 () Bool)

(assert (=> b!87814 m!93657))

(assert (=> b!87613 d!23335))

(declare-fun d!23337 () Bool)

(declare-fun e!57236 () Bool)

(assert (=> d!23337 e!57236))

(declare-fun res!45018 () Bool)

(assert (=> d!23337 (=> res!45018 e!57236)))

(declare-fun lt!41797 () Bool)

(assert (=> d!23337 (= res!45018 (not lt!41797))))

(declare-fun lt!41798 () Bool)

(assert (=> d!23337 (= lt!41797 lt!41798)))

(declare-fun lt!41799 () Unit!2582)

(declare-fun e!57235 () Unit!2582)

(assert (=> d!23337 (= lt!41799 e!57235)))

(declare-fun c!14477 () Bool)

(assert (=> d!23337 (= c!14477 lt!41798)))

(declare-fun containsKey!145 (List!1512 (_ BitVec 64)) Bool)

(assert (=> d!23337 (= lt!41798 (containsKey!145 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23337 (= (contains!750 lt!41605 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) lt!41797)))

(declare-fun b!87827 () Bool)

(declare-fun lt!41800 () Unit!2582)

(assert (=> b!87827 (= e!57235 lt!41800)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!93 (List!1512 (_ BitVec 64)) Unit!2582)

(assert (=> b!87827 (= lt!41800 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-datatypes ((Option!148 0))(
  ( (Some!147 (v!2670 V!3033)) (None!146) )
))
(declare-fun isDefined!94 (Option!148) Bool)

(declare-fun getValueByKey!142 (List!1512 (_ BitVec 64)) Option!148)

(assert (=> b!87827 (isDefined!94 (getValueByKey!142 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!87828 () Bool)

(declare-fun Unit!2593 () Unit!2582)

(assert (=> b!87828 (= e!57235 Unit!2593)))

(declare-fun b!87829 () Bool)

(assert (=> b!87829 (= e!57236 (isDefined!94 (getValueByKey!142 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))))

(assert (= (and d!23337 c!14477) b!87827))

(assert (= (and d!23337 (not c!14477)) b!87828))

(assert (= (and d!23337 (not res!45018)) b!87829))

(assert (=> d!23337 m!93405))

(declare-fun m!93659 () Bool)

(assert (=> d!23337 m!93659))

(assert (=> b!87827 m!93405))

(declare-fun m!93661 () Bool)

(assert (=> b!87827 m!93661))

(assert (=> b!87827 m!93405))

(declare-fun m!93663 () Bool)

(assert (=> b!87827 m!93663))

(assert (=> b!87827 m!93663))

(declare-fun m!93665 () Bool)

(assert (=> b!87827 m!93665))

(assert (=> b!87829 m!93405))

(assert (=> b!87829 m!93663))

(assert (=> b!87829 m!93663))

(assert (=> b!87829 m!93665))

(assert (=> b!87618 d!23337))

(declare-fun b!87914 () Bool)

(declare-fun e!57300 () Bool)

(declare-fun call!8438 () Bool)

(assert (=> b!87914 (= e!57300 (not call!8438))))

(declare-fun bm!8413 () Bool)

(declare-fun call!8436 () Bool)

(assert (=> bm!8413 (= call!8436 (arrayContainsKey!0 (_keys!4034 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!87915 () Bool)

(declare-fun lt!41864 () Unit!2582)

(declare-fun lt!41875 () Unit!2582)

(assert (=> b!87915 (= lt!41864 lt!41875)))

(declare-fun call!8419 () ListLongMap!1445)

(declare-fun call!8427 () ListLongMap!1445)

(assert (=> b!87915 (= call!8419 call!8427)))

(declare-fun lt!41878 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!32 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2582)

(assert (=> b!87915 (= lt!41875 (lemmaChangeZeroKeyThenAddPairToListMap!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) lt!41878 (zeroValue!2248 newMap!16) lt!41609 (minValue!2248 newMap!16) (defaultEntry!2358 newMap!16)))))

(assert (=> b!87915 (= lt!41878 (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!57283 () tuple2!2194)

(assert (=> b!87915 (= e!57283 (tuple2!2195 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6396 newMap!16) (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) lt!41609 (minValue!2248 newMap!16) (_size!429 newMap!16) (_keys!4034 newMap!16) (_values!2341 newMap!16) (_vacant!429 newMap!16))))))

(declare-fun call!8433 () Unit!2582)

(declare-fun bm!8414 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2582)

(assert (=> bm!8414 (= call!8433 (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(declare-fun b!87916 () Bool)

(declare-fun res!45055 () Bool)

(declare-fun e!57281 () Bool)

(assert (=> b!87916 (=> (not res!45055) (not e!57281))))

(declare-datatypes ((SeekEntryResult!238 0))(
  ( (MissingZero!238 (index!3090 (_ BitVec 32))) (Found!238 (index!3091 (_ BitVec 32))) (Intermediate!238 (undefined!1050 Bool) (index!3092 (_ BitVec 32)) (x!12135 (_ BitVec 32))) (Undefined!238) (MissingVacant!238 (index!3093 (_ BitVec 32))) )
))
(declare-fun lt!41876 () SeekEntryResult!238)

(assert (=> b!87916 (= res!45055 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3090 lt!41876)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!8415 () Bool)

(declare-fun call!8434 () ListLongMap!1445)

(declare-fun call!8420 () ListLongMap!1445)

(assert (=> bm!8415 (= call!8434 call!8420)))

(declare-fun b!87917 () Bool)

(declare-fun e!57284 () ListLongMap!1445)

(declare-fun call!8428 () ListLongMap!1445)

(assert (=> b!87917 (= e!57284 call!8428)))

(declare-fun c!14513 () Bool)

(declare-fun call!8431 () tuple2!2194)

(declare-fun bm!8416 () Bool)

(declare-fun lt!41866 () SeekEntryResult!238)

(declare-fun updateHelperNewKey!32 (LongMapFixedSize!760 (_ BitVec 64) V!3033 (_ BitVec 32)) tuple2!2194)

(assert (=> bm!8416 (= call!8431 (updateHelperNewKey!32 newMap!16 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866))))))

(declare-fun b!87918 () Bool)

(declare-fun e!57291 () Bool)

(declare-fun e!57294 () Bool)

(assert (=> b!87918 (= e!57291 e!57294)))

(declare-fun res!45059 () Bool)

(declare-fun call!8416 () Bool)

(assert (=> b!87918 (= res!45059 call!8416)))

(assert (=> b!87918 (=> (not res!45059) (not e!57294))))

(declare-fun bm!8417 () Bool)

(declare-fun call!8418 () SeekEntryResult!238)

(declare-fun call!8432 () SeekEntryResult!238)

(assert (=> bm!8417 (= call!8418 call!8432)))

(declare-fun bm!8418 () Bool)

(declare-fun call!8421 () ListLongMap!1445)

(assert (=> bm!8418 (= call!8421 call!8420)))

(declare-fun b!87919 () Bool)

(declare-fun lt!41877 () tuple2!2194)

(assert (=> b!87919 (= lt!41877 call!8431)))

(declare-fun e!57289 () tuple2!2194)

(assert (=> b!87919 (= e!57289 (tuple2!2195 (_1!1108 lt!41877) (_2!1108 lt!41877)))))

(declare-fun call!8424 () Unit!2582)

(declare-fun bm!8419 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2582)

(assert (=> bm!8419 (= call!8424 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(declare-fun b!87920 () Bool)

(declare-fun e!57292 () Bool)

(assert (=> b!87920 (= e!57292 (not call!8438))))

(declare-fun b!87921 () Bool)

(declare-fun e!57299 () tuple2!2194)

(declare-fun lt!41863 () tuple2!2194)

(assert (=> b!87921 (= e!57299 (tuple2!2195 (_1!1108 lt!41863) (_2!1108 lt!41863)))))

(assert (=> b!87921 (= lt!41863 call!8431)))

(declare-fun bm!8420 () Bool)

(declare-fun call!8437 () ListLongMap!1445)

(assert (=> bm!8420 (= call!8419 call!8437)))

(declare-fun bm!8421 () Bool)

(declare-fun call!8425 () SeekEntryResult!238)

(assert (=> bm!8421 (= call!8425 call!8432)))

(declare-fun b!87922 () Bool)

(assert (=> b!87922 (= c!14513 ((_ is MissingVacant!238) lt!41866))))

(declare-fun e!57296 () tuple2!2194)

(assert (=> b!87922 (= e!57296 e!57299)))

(declare-fun bm!8422 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4025 (_ BitVec 32)) SeekEntryResult!238)

(assert (=> bm!8422 (= call!8432 (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(declare-fun b!87923 () Bool)

(declare-fun e!57288 () Unit!2582)

(declare-fun Unit!2594 () Unit!2582)

(assert (=> b!87923 (= e!57288 Unit!2594)))

(declare-fun lt!41872 () Unit!2582)

(assert (=> b!87923 (= lt!41872 call!8433)))

(declare-fun lt!41861 () SeekEntryResult!238)

(assert (=> b!87923 (= lt!41861 call!8418)))

(declare-fun res!45050 () Bool)

(assert (=> b!87923 (= res!45050 ((_ is Found!238) lt!41861))))

(declare-fun e!57286 () Bool)

(assert (=> b!87923 (=> (not res!45050) (not e!57286))))

(assert (=> b!87923 e!57286))

(declare-fun lt!41857 () Unit!2582)

(assert (=> b!87923 (= lt!41857 lt!41872)))

(assert (=> b!87923 false))

(declare-fun bm!8423 () Bool)

(assert (=> bm!8423 (= call!8427 call!8428)))

(declare-fun b!87924 () Bool)

(declare-fun lt!41858 () Unit!2582)

(declare-fun lt!41881 () Unit!2582)

(assert (=> b!87924 (= lt!41858 lt!41881)))

(declare-fun call!8422 () Bool)

(assert (=> b!87924 call!8422))

(declare-fun lt!41880 () array!4027)

(declare-fun lemmaValidKeyInArrayIsInListMap!92 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) Unit!2582)

(assert (=> b!87924 (= lt!41881 (lemmaValidKeyInArrayIsInListMap!92 (_keys!4034 newMap!16) lt!41880 (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3091 lt!41866) (defaultEntry!2358 newMap!16)))))

(assert (=> b!87924 (= lt!41880 (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16))))))

(declare-fun lt!41873 () Unit!2582)

(declare-fun lt!41871 () Unit!2582)

(assert (=> b!87924 (= lt!41873 lt!41871)))

(assert (=> b!87924 (= call!8437 call!8421)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) (_ BitVec 64) V!3033 Int) Unit!2582)

(assert (=> b!87924 (= lt!41871 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3091 lt!41866) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41862 () Unit!2582)

(declare-fun e!57301 () Unit!2582)

(assert (=> b!87924 (= lt!41862 e!57301)))

(declare-fun c!14511 () Bool)

(assert (=> b!87924 (= c!14511 (contains!750 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!87924 (= e!57289 (tuple2!2195 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (_size!429 newMap!16) (_keys!4034 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16))) (_vacant!429 newMap!16))))))

(declare-fun b!87925 () Bool)

(assert (=> b!87925 (= e!57284 call!8421)))

(declare-fun b!87926 () Bool)

(declare-fun c!14514 () Bool)

(assert (=> b!87926 (= c!14514 ((_ is MissingVacant!238) lt!41876))))

(declare-fun e!57290 () Bool)

(assert (=> b!87926 (= e!57290 e!57291)))

(declare-fun bm!8424 () Bool)

(declare-fun call!8439 () ListLongMap!1445)

(declare-fun lt!41879 () tuple2!2194)

(assert (=> bm!8424 (= call!8439 (map!1199 (_2!1108 lt!41879)))))

(declare-fun bm!8425 () Bool)

(declare-fun call!8435 () Bool)

(assert (=> bm!8425 (= call!8435 call!8436)))

(declare-fun bm!8426 () Bool)

(declare-fun call!8429 () Bool)

(declare-fun call!8417 () Bool)

(assert (=> bm!8426 (= call!8429 call!8417)))

(declare-fun b!87927 () Bool)

(declare-fun c!14515 () Bool)

(declare-fun lt!41867 () SeekEntryResult!238)

(assert (=> b!87927 (= c!14515 ((_ is MissingVacant!238) lt!41867))))

(declare-fun e!57298 () Bool)

(declare-fun e!57287 () Bool)

(assert (=> b!87927 (= e!57298 e!57287)))

(declare-fun call!8430 () ListLongMap!1445)

(declare-fun e!57302 () Bool)

(declare-fun b!87928 () Bool)

(assert (=> b!87928 (= e!57302 (= call!8439 (+!109 call!8430 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun b!87929 () Bool)

(assert (=> b!87929 (= e!57287 e!57292)))

(declare-fun res!45058 () Bool)

(declare-fun call!8423 () Bool)

(assert (=> b!87929 (= res!45058 call!8423)))

(assert (=> b!87929 (=> (not res!45058) (not e!57292))))

(declare-fun b!87930 () Bool)

(declare-fun res!45056 () Bool)

(assert (=> b!87930 (= res!45056 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3093 lt!41876)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!87930 (=> (not res!45056) (not e!57294))))

(declare-fun d!23339 () Bool)

(declare-fun e!57293 () Bool)

(assert (=> d!23339 e!57293))

(declare-fun res!45060 () Bool)

(assert (=> d!23339 (=> (not res!45060) (not e!57293))))

(assert (=> d!23339 (= res!45060 (valid!339 (_2!1108 lt!41879)))))

(declare-fun e!57295 () tuple2!2194)

(assert (=> d!23339 (= lt!41879 e!57295)))

(declare-fun c!14519 () Bool)

(assert (=> d!23339 (= c!14519 (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvneg (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))))

(assert (=> d!23339 (valid!339 newMap!16)))

(assert (=> d!23339 (= (update!124 newMap!16 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609) lt!41879)))

(declare-fun b!87931 () Bool)

(assert (=> b!87931 (= e!57286 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41861)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun bm!8427 () Bool)

(declare-fun call!8426 () Bool)

(assert (=> bm!8427 (= call!8426 call!8417)))

(declare-fun b!87932 () Bool)

(declare-fun lt!41868 () Unit!2582)

(assert (=> b!87932 (= e!57301 lt!41868)))

(assert (=> b!87932 (= lt!41868 call!8433)))

(declare-fun lt!41869 () SeekEntryResult!238)

(assert (=> b!87932 (= lt!41869 call!8425)))

(declare-fun res!45049 () Bool)

(assert (=> b!87932 (= res!45049 ((_ is Found!238) lt!41869))))

(declare-fun e!57297 () Bool)

(assert (=> b!87932 (=> (not res!45049) (not e!57297))))

(assert (=> b!87932 e!57297))

(declare-fun b!87933 () Bool)

(declare-fun e!57285 () Bool)

(assert (=> b!87933 (= e!57285 e!57302)))

(declare-fun res!45052 () Bool)

(assert (=> b!87933 (= res!45052 (contains!750 call!8439 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!87933 (=> (not res!45052) (not e!57302))))

(declare-fun bm!8428 () Bool)

(assert (=> bm!8428 (= call!8438 call!8436)))

(declare-fun b!87934 () Bool)

(declare-fun res!45053 () Bool)

(assert (=> b!87934 (= res!45053 call!8429)))

(assert (=> b!87934 (=> (not res!45053) (not e!57297))))

(declare-fun b!87935 () Bool)

(assert (=> b!87935 (= e!57291 ((_ is Undefined!238) lt!41876))))

(declare-fun b!87936 () Bool)

(declare-fun lt!41865 () Unit!2582)

(assert (=> b!87936 (= e!57288 lt!41865)))

(assert (=> b!87936 (= lt!41865 call!8424)))

(assert (=> b!87936 (= lt!41876 call!8418)))

(declare-fun c!14507 () Bool)

(assert (=> b!87936 (= c!14507 ((_ is MissingZero!238) lt!41876))))

(assert (=> b!87936 e!57290))

(declare-fun c!14506 () Bool)

(declare-fun bm!8429 () Bool)

(assert (=> bm!8429 (= call!8428 (getCurrentListMap!431 (_keys!4034 newMap!16) (ite c!14519 (_values!2341 newMap!16) lt!41880) (mask!6396 newMap!16) (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun bm!8430 () Bool)

(assert (=> bm!8430 (= call!8423 call!8429)))

(declare-fun b!87937 () Bool)

(assert (=> b!87937 (= e!57287 ((_ is Undefined!238) lt!41867))))

(declare-fun bm!8431 () Bool)

(assert (=> bm!8431 (= call!8416 call!8426)))

(declare-fun bm!8432 () Bool)

(assert (=> bm!8432 (= call!8430 (map!1199 newMap!16))))

(declare-fun b!87938 () Bool)

(declare-fun res!45051 () Bool)

(assert (=> b!87938 (=> (not res!45051) (not e!57300))))

(assert (=> b!87938 (= res!45051 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3090 lt!41867)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87939 () Bool)

(assert (=> b!87939 (= e!57293 e!57285)))

(declare-fun c!14512 () Bool)

(assert (=> b!87939 (= c!14512 (_1!1108 lt!41879))))

(declare-fun bm!8433 () Bool)

(declare-fun lt!41870 () (_ BitVec 32))

(declare-fun c!14510 () Bool)

(assert (=> bm!8433 (= call!8420 (getCurrentListMap!431 (_keys!4034 newMap!16) (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))) (mask!6396 newMap!16) (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun b!87940 () Bool)

(declare-fun Unit!2595 () Unit!2582)

(assert (=> b!87940 (= e!57301 Unit!2595)))

(declare-fun lt!41874 () Unit!2582)

(assert (=> b!87940 (= lt!41874 call!8424)))

(assert (=> b!87940 (= lt!41867 call!8425)))

(declare-fun c!14517 () Bool)

(assert (=> b!87940 (= c!14517 ((_ is MissingZero!238) lt!41867))))

(assert (=> b!87940 e!57298))

(declare-fun lt!41859 () Unit!2582)

(assert (=> b!87940 (= lt!41859 lt!41874)))

(assert (=> b!87940 false))

(declare-fun b!87941 () Bool)

(declare-fun res!45054 () Bool)

(assert (=> b!87941 (= res!45054 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3093 lt!41867)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!87941 (=> (not res!45054) (not e!57292))))

(declare-fun b!87942 () Bool)

(declare-fun e!57282 () ListLongMap!1445)

(assert (=> b!87942 (= e!57282 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun b!87943 () Bool)

(assert (=> b!87943 (= e!57297 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41869)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun bm!8434 () Bool)

(declare-fun c!14509 () Bool)

(assert (=> bm!8434 (= c!14509 c!14510)))

(assert (=> bm!8434 (= call!8422 (contains!750 e!57284 (ite c!14510 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41866)))))))

(declare-fun b!87944 () Bool)

(assert (=> b!87944 (= e!57294 (not call!8435))))

(declare-fun b!87945 () Bool)

(assert (=> b!87945 (= e!57295 e!57296)))

(assert (=> b!87945 (= lt!41866 (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(assert (=> b!87945 (= c!14510 ((_ is Undefined!238) lt!41866))))

(declare-fun b!87946 () Bool)

(declare-fun lt!41855 () Unit!2582)

(assert (=> b!87946 (= lt!41855 e!57288)))

(declare-fun c!14516 () Bool)

(assert (=> b!87946 (= c!14516 call!8422)))

(assert (=> b!87946 (= e!57296 (tuple2!2195 false newMap!16))))

(declare-fun b!87947 () Bool)

(declare-fun res!45047 () Bool)

(assert (=> b!87947 (= res!45047 call!8426)))

(assert (=> b!87947 (=> (not res!45047) (not e!57286))))

(declare-fun b!87948 () Bool)

(assert (=> b!87948 (= e!57285 (= call!8439 call!8430))))

(declare-fun b!87949 () Bool)

(assert (=> b!87949 (= e!57299 e!57289)))

(declare-fun c!14508 () Bool)

(assert (=> b!87949 (= c!14508 ((_ is MissingZero!238) lt!41866))))

(declare-fun bm!8435 () Bool)

(assert (=> bm!8435 (= call!8437 (+!109 e!57282 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun c!14518 () Bool)

(assert (=> bm!8435 (= c!14518 c!14519)))

(declare-fun b!87950 () Bool)

(assert (=> b!87950 (= e!57295 e!57283)))

(assert (=> b!87950 (= c!14506 (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!87951 () Bool)

(declare-fun res!45057 () Bool)

(assert (=> b!87951 (=> (not res!45057) (not e!57281))))

(assert (=> b!87951 (= res!45057 call!8416)))

(assert (=> b!87951 (= e!57290 e!57281)))

(declare-fun b!87952 () Bool)

(assert (=> b!87952 (= e!57282 (ite c!14506 call!8434 call!8427))))

(declare-fun b!87953 () Bool)

(declare-fun lt!41860 () Unit!2582)

(declare-fun lt!41856 () Unit!2582)

(assert (=> b!87953 (= lt!41860 lt!41856)))

(assert (=> b!87953 (= call!8419 call!8434)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2582)

(assert (=> b!87953 (= lt!41856 (lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) lt!41870 (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) lt!41609 (defaultEntry!2358 newMap!16)))))

(assert (=> b!87953 (= lt!41870 (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!87953 (= e!57283 (tuple2!2195 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6396 newMap!16) (bvor (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) (zeroValue!2248 newMap!16) lt!41609 (_size!429 newMap!16) (_keys!4034 newMap!16) (_values!2341 newMap!16) (_vacant!429 newMap!16))))))

(declare-fun b!87954 () Bool)

(declare-fun res!45048 () Bool)

(assert (=> b!87954 (=> (not res!45048) (not e!57300))))

(assert (=> b!87954 (= res!45048 call!8423)))

(assert (=> b!87954 (= e!57298 e!57300)))

(declare-fun b!87955 () Bool)

(assert (=> b!87955 (= e!57281 (not call!8435))))

(declare-fun bm!8436 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8436 (= call!8417 (inRange!0 (ite c!14510 (ite c!14516 (index!3091 lt!41861) (ite c!14507 (index!3090 lt!41876) (index!3093 lt!41876))) (ite c!14511 (index!3091 lt!41869) (ite c!14517 (index!3090 lt!41867) (index!3093 lt!41867)))) (mask!6396 newMap!16)))))

(assert (= (and d!23339 c!14519) b!87950))

(assert (= (and d!23339 (not c!14519)) b!87945))

(assert (= (and b!87950 c!14506) b!87915))

(assert (= (and b!87950 (not c!14506)) b!87953))

(assert (= (or b!87915 b!87953) bm!8415))

(assert (= (or b!87915 b!87953) bm!8423))

(assert (= (or b!87915 b!87953) bm!8420))

(assert (= (and b!87945 c!14510) b!87946))

(assert (= (and b!87945 (not c!14510)) b!87922))

(assert (= (and b!87946 c!14516) b!87923))

(assert (= (and b!87946 (not c!14516)) b!87936))

(assert (= (and b!87923 res!45050) b!87947))

(assert (= (and b!87947 res!45047) b!87931))

(assert (= (and b!87936 c!14507) b!87951))

(assert (= (and b!87936 (not c!14507)) b!87926))

(assert (= (and b!87951 res!45057) b!87916))

(assert (= (and b!87916 res!45055) b!87955))

(assert (= (and b!87926 c!14514) b!87918))

(assert (= (and b!87926 (not c!14514)) b!87935))

(assert (= (and b!87918 res!45059) b!87930))

(assert (= (and b!87930 res!45056) b!87944))

(assert (= (or b!87951 b!87918) bm!8431))

(assert (= (or b!87955 b!87944) bm!8425))

(assert (= (or b!87947 bm!8431) bm!8427))

(assert (= (or b!87923 b!87936) bm!8417))

(assert (= (and b!87922 c!14513) b!87921))

(assert (= (and b!87922 (not c!14513)) b!87949))

(assert (= (and b!87949 c!14508) b!87919))

(assert (= (and b!87949 (not c!14508)) b!87924))

(assert (= (and b!87924 c!14511) b!87932))

(assert (= (and b!87924 (not c!14511)) b!87940))

(assert (= (and b!87932 res!45049) b!87934))

(assert (= (and b!87934 res!45053) b!87943))

(assert (= (and b!87940 c!14517) b!87954))

(assert (= (and b!87940 (not c!14517)) b!87927))

(assert (= (and b!87954 res!45048) b!87938))

(assert (= (and b!87938 res!45051) b!87914))

(assert (= (and b!87927 c!14515) b!87929))

(assert (= (and b!87927 (not c!14515)) b!87937))

(assert (= (and b!87929 res!45058) b!87941))

(assert (= (and b!87941 res!45054) b!87920))

(assert (= (or b!87954 b!87929) bm!8430))

(assert (= (or b!87914 b!87920) bm!8428))

(assert (= (or b!87934 bm!8430) bm!8426))

(assert (= (or b!87932 b!87940) bm!8421))

(assert (= (or b!87921 b!87919) bm!8416))

(assert (= (or bm!8425 bm!8428) bm!8413))

(assert (= (or b!87946 b!87924) bm!8418))

(assert (= (or b!87936 b!87940) bm!8419))

(assert (= (or bm!8417 bm!8421) bm!8422))

(assert (= (or b!87923 b!87932) bm!8414))

(assert (= (or bm!8427 bm!8426) bm!8436))

(assert (= (or b!87946 b!87924) bm!8434))

(assert (= (and bm!8434 c!14509) b!87925))

(assert (= (and bm!8434 (not c!14509)) b!87917))

(assert (= (or bm!8423 b!87917) bm!8429))

(assert (= (or bm!8415 bm!8418) bm!8433))

(assert (= (or bm!8420 b!87924) bm!8435))

(assert (= (and bm!8435 c!14518) b!87952))

(assert (= (and bm!8435 (not c!14518)) b!87942))

(assert (= (and d!23339 res!45060) b!87939))

(assert (= (and b!87939 c!14512) b!87933))

(assert (= (and b!87939 (not c!14512)) b!87948))

(assert (= (and b!87933 res!45052) b!87928))

(assert (= (or b!87928 b!87948) bm!8432))

(assert (= (or b!87933 b!87928 b!87948) bm!8424))

(assert (=> bm!8419 m!93405))

(declare-fun m!93667 () Bool)

(assert (=> bm!8419 m!93667))

(declare-fun m!93669 () Bool)

(assert (=> b!87931 m!93669))

(declare-fun m!93671 () Bool)

(assert (=> b!87953 m!93671))

(assert (=> b!87933 m!93405))

(declare-fun m!93673 () Bool)

(assert (=> b!87933 m!93673))

(assert (=> bm!8416 m!93405))

(declare-fun m!93675 () Bool)

(assert (=> bm!8416 m!93675))

(assert (=> bm!8432 m!93459))

(declare-fun m!93677 () Bool)

(assert (=> b!87943 m!93677))

(declare-fun m!93679 () Bool)

(assert (=> b!87941 m!93679))

(declare-fun m!93681 () Bool)

(assert (=> bm!8435 m!93681))

(declare-fun m!93683 () Bool)

(assert (=> d!23339 m!93683))

(assert (=> d!23339 m!93457))

(declare-fun m!93685 () Bool)

(assert (=> bm!8436 m!93685))

(declare-fun m!93687 () Bool)

(assert (=> bm!8424 m!93687))

(assert (=> b!87942 m!93603))

(declare-fun m!93689 () Bool)

(assert (=> bm!8433 m!93689))

(declare-fun m!93691 () Bool)

(assert (=> bm!8433 m!93691))

(declare-fun m!93693 () Bool)

(assert (=> b!87928 m!93693))

(declare-fun m!93695 () Bool)

(assert (=> b!87915 m!93695))

(declare-fun m!93697 () Bool)

(assert (=> b!87938 m!93697))

(assert (=> bm!8422 m!93405))

(declare-fun m!93699 () Bool)

(assert (=> bm!8422 m!93699))

(assert (=> b!87945 m!93405))

(assert (=> b!87945 m!93699))

(declare-fun m!93701 () Bool)

(assert (=> b!87930 m!93701))

(assert (=> b!87924 m!93689))

(assert (=> b!87924 m!93603))

(assert (=> b!87924 m!93405))

(declare-fun m!93703 () Bool)

(assert (=> b!87924 m!93703))

(assert (=> b!87924 m!93603))

(assert (=> b!87924 m!93405))

(declare-fun m!93705 () Bool)

(assert (=> b!87924 m!93705))

(declare-fun m!93707 () Bool)

(assert (=> b!87924 m!93707))

(declare-fun m!93709 () Bool)

(assert (=> bm!8429 m!93709))

(assert (=> bm!8414 m!93405))

(declare-fun m!93711 () Bool)

(assert (=> bm!8414 m!93711))

(assert (=> bm!8413 m!93405))

(declare-fun m!93713 () Bool)

(assert (=> bm!8413 m!93713))

(declare-fun m!93715 () Bool)

(assert (=> bm!8434 m!93715))

(declare-fun m!93717 () Bool)

(assert (=> bm!8434 m!93717))

(declare-fun m!93719 () Bool)

(assert (=> b!87916 m!93719))

(assert (=> b!87618 d!23339))

(declare-fun d!23341 () Bool)

(assert (=> d!23341 (= (array_inv!1181 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvsge (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!87608 d!23341))

(declare-fun d!23343 () Bool)

(assert (=> d!23343 (= (array_inv!1182 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvsge (size!2162 (_values!2341 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!87608 d!23343))

(declare-fun d!23345 () Bool)

(assert (=> d!23345 (not (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!41884 () Unit!2582)

(declare-fun choose!68 (array!4025 (_ BitVec 32) (_ BitVec 64) List!1511) Unit!2582)

(assert (=> d!23345 (= lt!41884 (choose!68 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508)))))

(assert (=> d!23345 (bvslt (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23345 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508)) lt!41884)))

(declare-fun bs!3717 () Bool)

(assert (= bs!3717 d!23345))

(assert (=> bs!3717 m!93405))

(assert (=> bs!3717 m!93417))

(assert (=> bs!3717 m!93405))

(declare-fun m!93721 () Bool)

(assert (=> bs!3717 m!93721))

(assert (=> b!87610 d!23345))

(declare-fun d!23347 () Bool)

(assert (=> d!23347 (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) from!355 Nil!1508)))

(declare-fun lt!41887 () Unit!2582)

(declare-fun choose!39 (array!4025 (_ BitVec 32) (_ BitVec 32)) Unit!2582)

(assert (=> d!23347 (= lt!41887 (choose!39 (_keys!4034 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!23347 (bvslt (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23347 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355) lt!41887)))

(declare-fun bs!3718 () Bool)

(assert (= bs!3718 d!23347))

(assert (=> bs!3718 m!93413))

(declare-fun m!93723 () Bool)

(assert (=> bs!3718 m!93723))

(assert (=> b!87610 d!23347))

(declare-fun d!23349 () Bool)

(declare-fun res!45065 () Bool)

(declare-fun e!57307 () Bool)

(assert (=> d!23349 (=> res!45065 e!57307)))

(assert (=> d!23349 (= res!45065 (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23349 (= (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!57307)))

(declare-fun b!87960 () Bool)

(declare-fun e!57308 () Bool)

(assert (=> b!87960 (= e!57307 e!57308)))

(declare-fun res!45066 () Bool)

(assert (=> b!87960 (=> (not res!45066) (not e!57308))))

(assert (=> b!87960 (= res!45066 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!87961 () Bool)

(assert (=> b!87961 (= e!57308 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!23349 (not res!45065)) b!87960))

(assert (= (and b!87960 res!45066) b!87961))

(assert (=> d!23349 m!93607))

(assert (=> b!87961 m!93405))

(declare-fun m!93725 () Bool)

(assert (=> b!87961 m!93725))

(assert (=> b!87610 d!23349))

(declare-fun d!23351 () Bool)

(declare-fun e!57311 () Bool)

(assert (=> d!23351 e!57311))

(declare-fun c!14522 () Bool)

(assert (=> d!23351 (= c!14522 (and (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!41890 () Unit!2582)

(declare-fun choose!520 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) (_ BitVec 32) Int) Unit!2582)

(assert (=> d!23351 (= lt!41890 (choose!520 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(assert (=> d!23351 (validMask!0 (mask!6396 (v!2664 (underlying!295 thiss!992))))))

(assert (=> d!23351 (= (lemmaListMapContainsThenArrayContainsFrom!60 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))) lt!41890)))

(declare-fun b!87966 () Bool)

(assert (=> b!87966 (= e!57311 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!87967 () Bool)

(assert (=> b!87967 (= e!57311 (ite (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23351 c!14522) b!87966))

(assert (= (and d!23351 (not c!14522)) b!87967))

(assert (=> d!23351 m!93405))

(declare-fun m!93727 () Bool)

(assert (=> d!23351 m!93727))

(assert (=> d!23351 m!93441))

(assert (=> b!87966 m!93405))

(assert (=> b!87966 m!93417))

(assert (=> b!87610 d!23351))

(declare-fun b!87978 () Bool)

(declare-fun e!57320 () Bool)

(declare-fun e!57321 () Bool)

(assert (=> b!87978 (= e!57320 e!57321)))

(declare-fun c!14525 () Bool)

(assert (=> b!87978 (= c!14525 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!87979 () Bool)

(declare-fun e!57323 () Bool)

(assert (=> b!87979 (= e!57323 e!57320)))

(declare-fun res!45073 () Bool)

(assert (=> b!87979 (=> (not res!45073) (not e!57320))))

(declare-fun e!57322 () Bool)

(assert (=> b!87979 (= res!45073 (not e!57322))))

(declare-fun res!45074 () Bool)

(assert (=> b!87979 (=> (not res!45074) (not e!57322))))

(assert (=> b!87979 (= res!45074 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun bm!8439 () Bool)

(declare-fun call!8442 () Bool)

(assert (=> bm!8439 (= call!8442 (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14525 (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508) Nil!1508)))))

(declare-fun d!23353 () Bool)

(declare-fun res!45075 () Bool)

(assert (=> d!23353 (=> res!45075 e!57323)))

(assert (=> d!23353 (= res!45075 (bvsge from!355 (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> d!23353 (= (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) from!355 Nil!1508) e!57323)))

(declare-fun b!87980 () Bool)

(assert (=> b!87980 (= e!57321 call!8442)))

(declare-fun b!87981 () Bool)

(declare-fun contains!752 (List!1511 (_ BitVec 64)) Bool)

(assert (=> b!87981 (= e!57322 (contains!752 Nil!1508 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!87982 () Bool)

(assert (=> b!87982 (= e!57321 call!8442)))

(assert (= (and d!23353 (not res!45075)) b!87979))

(assert (= (and b!87979 res!45074) b!87981))

(assert (= (and b!87979 res!45073) b!87978))

(assert (= (and b!87978 c!14525) b!87982))

(assert (= (and b!87978 (not c!14525)) b!87980))

(assert (= (or b!87982 b!87980) bm!8439))

(assert (=> b!87978 m!93405))

(assert (=> b!87978 m!93405))

(declare-fun m!93729 () Bool)

(assert (=> b!87978 m!93729))

(assert (=> b!87979 m!93405))

(assert (=> b!87979 m!93405))

(assert (=> b!87979 m!93729))

(assert (=> bm!8439 m!93405))

(declare-fun m!93731 () Bool)

(assert (=> bm!8439 m!93731))

(assert (=> b!87981 m!93405))

(assert (=> b!87981 m!93405))

(declare-fun m!93733 () Bool)

(assert (=> b!87981 m!93733))

(assert (=> b!87610 d!23353))

(declare-fun d!23355 () Bool)

(declare-fun res!45080 () Bool)

(declare-fun e!57332 () Bool)

(assert (=> d!23355 (=> res!45080 e!57332)))

(assert (=> d!23355 (= res!45080 (bvsge #b00000000000000000000000000000000 (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> d!23355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))) e!57332)))

(declare-fun b!87991 () Bool)

(declare-fun e!57330 () Bool)

(declare-fun e!57331 () Bool)

(assert (=> b!87991 (= e!57330 e!57331)))

(declare-fun lt!41897 () (_ BitVec 64))

(assert (=> b!87991 (= lt!41897 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!41898 () Unit!2582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4025 (_ BitVec 64) (_ BitVec 32)) Unit!2582)

(assert (=> b!87991 (= lt!41898 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41897 #b00000000000000000000000000000000))))

(assert (=> b!87991 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41897 #b00000000000000000000000000000000)))

(declare-fun lt!41899 () Unit!2582)

(assert (=> b!87991 (= lt!41899 lt!41898)))

(declare-fun res!45081 () Bool)

(assert (=> b!87991 (= res!45081 (= (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))) (Found!238 #b00000000000000000000000000000000)))))

(assert (=> b!87991 (=> (not res!45081) (not e!57331))))

(declare-fun b!87992 () Bool)

(declare-fun call!8445 () Bool)

(assert (=> b!87992 (= e!57331 call!8445)))

(declare-fun b!87993 () Bool)

(assert (=> b!87993 (= e!57332 e!57330)))

(declare-fun c!14528 () Bool)

(assert (=> b!87993 (= c!14528 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!8442 () Bool)

(assert (=> bm!8442 (= call!8445 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!87994 () Bool)

(assert (=> b!87994 (= e!57330 call!8445)))

(assert (= (and d!23355 (not res!45080)) b!87993))

(assert (= (and b!87993 c!14528) b!87991))

(assert (= (and b!87993 (not c!14528)) b!87994))

(assert (= (and b!87991 res!45081) b!87992))

(assert (= (or b!87992 b!87994) bm!8442))

(declare-fun m!93735 () Bool)

(assert (=> b!87991 m!93735))

(declare-fun m!93737 () Bool)

(assert (=> b!87991 m!93737))

(declare-fun m!93739 () Bool)

(assert (=> b!87991 m!93739))

(assert (=> b!87991 m!93735))

(declare-fun m!93741 () Bool)

(assert (=> b!87991 m!93741))

(assert (=> b!87993 m!93735))

(assert (=> b!87993 m!93735))

(declare-fun m!93743 () Bool)

(assert (=> b!87993 m!93743))

(declare-fun m!93745 () Bool)

(assert (=> bm!8442 m!93745))

(assert (=> b!87605 d!23355))

(declare-fun d!23357 () Bool)

(assert (=> d!23357 (= (array_inv!1181 (_keys!4034 newMap!16)) (bvsge (size!2161 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!87620 d!23357))

(declare-fun d!23359 () Bool)

(assert (=> d!23359 (= (array_inv!1182 (_values!2341 newMap!16)) (bvsge (size!2162 (_values!2341 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!87620 d!23359))

(declare-fun d!23361 () Bool)

(assert (=> d!23361 (= (valid!338 thiss!992) (valid!339 (v!2664 (underlying!295 thiss!992))))))

(declare-fun bs!3719 () Bool)

(assert (= bs!3719 d!23361))

(declare-fun m!93747 () Bool)

(assert (=> bs!3719 m!93747))

(assert (=> start!10842 d!23361))

(declare-fun d!23363 () Bool)

(declare-fun c!14531 () Bool)

(assert (=> d!23363 (= c!14531 ((_ is ValueCellFull!926) (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun e!57335 () V!3033)

(assert (=> d!23363 (= (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57335)))

(declare-fun b!87999 () Bool)

(declare-fun get!1212 (ValueCell!926 V!3033) V!3033)

(assert (=> b!87999 (= e!57335 (get!1212 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88000 () Bool)

(declare-fun get!1213 (ValueCell!926 V!3033) V!3033)

(assert (=> b!88000 (= e!57335 (get!1213 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23363 c!14531) b!87999))

(assert (= (and d!23363 (not c!14531)) b!88000))

(assert (=> b!87999 m!93451))

(assert (=> b!87999 m!93453))

(declare-fun m!93749 () Bool)

(assert (=> b!87999 m!93749))

(assert (=> b!88000 m!93451))

(assert (=> b!88000 m!93453))

(declare-fun m!93751 () Bool)

(assert (=> b!88000 m!93751))

(assert (=> b!87617 d!23363))

(declare-fun d!23365 () Bool)

(declare-fun res!45088 () Bool)

(declare-fun e!57338 () Bool)

(assert (=> d!23365 (=> (not res!45088) (not e!57338))))

(declare-fun simpleValid!59 (LongMapFixedSize!760) Bool)

(assert (=> d!23365 (= res!45088 (simpleValid!59 newMap!16))))

(assert (=> d!23365 (= (valid!339 newMap!16) e!57338)))

(declare-fun b!88007 () Bool)

(declare-fun res!45089 () Bool)

(assert (=> b!88007 (=> (not res!45089) (not e!57338))))

(declare-fun arrayCountValidKeys!0 (array!4025 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!88007 (= res!45089 (= (arrayCountValidKeys!0 (_keys!4034 newMap!16) #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) (_size!429 newMap!16)))))

(declare-fun b!88008 () Bool)

(declare-fun res!45090 () Bool)

(assert (=> b!88008 (=> (not res!45090) (not e!57338))))

(assert (=> b!88008 (= res!45090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(declare-fun b!88009 () Bool)

(assert (=> b!88009 (= e!57338 (arrayNoDuplicates!0 (_keys!4034 newMap!16) #b00000000000000000000000000000000 Nil!1508))))

(assert (= (and d!23365 res!45088) b!88007))

(assert (= (and b!88007 res!45089) b!88008))

(assert (= (and b!88008 res!45090) b!88009))

(declare-fun m!93753 () Bool)

(assert (=> d!23365 m!93753))

(declare-fun m!93755 () Bool)

(assert (=> b!88007 m!93755))

(declare-fun m!93757 () Bool)

(assert (=> b!88008 m!93757))

(declare-fun m!93759 () Bool)

(assert (=> b!88009 m!93759))

(assert (=> b!87612 d!23365))

(declare-fun d!23367 () Bool)

(declare-fun e!57341 () Bool)

(assert (=> d!23367 e!57341))

(declare-fun res!45095 () Bool)

(assert (=> d!23367 (=> (not res!45095) (not e!57341))))

(declare-fun lt!41911 () ListLongMap!1445)

(assert (=> d!23367 (= res!45095 (contains!750 lt!41911 (_1!1107 lt!41611)))))

(declare-fun lt!41909 () List!1512)

(assert (=> d!23367 (= lt!41911 (ListLongMap!1446 lt!41909))))

(declare-fun lt!41910 () Unit!2582)

(declare-fun lt!41908 () Unit!2582)

(assert (=> d!23367 (= lt!41910 lt!41908)))

(assert (=> d!23367 (= (getValueByKey!142 lt!41909 (_1!1107 lt!41611)) (Some!147 (_2!1107 lt!41611)))))

(declare-fun lemmaContainsTupThenGetReturnValue!59 (List!1512 (_ BitVec 64) V!3033) Unit!2582)

(assert (=> d!23367 (= lt!41908 (lemmaContainsTupThenGetReturnValue!59 lt!41909 (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(declare-fun insertStrictlySorted!62 (List!1512 (_ BitVec 64) V!3033) List!1512)

(assert (=> d!23367 (= lt!41909 (insertStrictlySorted!62 (toList!738 lt!41600) (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(assert (=> d!23367 (= (+!109 lt!41600 lt!41611) lt!41911)))

(declare-fun b!88014 () Bool)

(declare-fun res!45096 () Bool)

(assert (=> b!88014 (=> (not res!45096) (not e!57341))))

(assert (=> b!88014 (= res!45096 (= (getValueByKey!142 (toList!738 lt!41911) (_1!1107 lt!41611)) (Some!147 (_2!1107 lt!41611))))))

(declare-fun b!88015 () Bool)

(declare-fun contains!753 (List!1512 tuple2!2192) Bool)

(assert (=> b!88015 (= e!57341 (contains!753 (toList!738 lt!41911) lt!41611))))

(assert (= (and d!23367 res!45095) b!88014))

(assert (= (and b!88014 res!45096) b!88015))

(declare-fun m!93761 () Bool)

(assert (=> d!23367 m!93761))

(declare-fun m!93763 () Bool)

(assert (=> d!23367 m!93763))

(declare-fun m!93765 () Bool)

(assert (=> d!23367 m!93765))

(declare-fun m!93767 () Bool)

(assert (=> d!23367 m!93767))

(declare-fun m!93769 () Bool)

(assert (=> b!88014 m!93769))

(declare-fun m!93771 () Bool)

(assert (=> b!88015 m!93771))

(assert (=> b!87616 d!23367))

(declare-fun d!23369 () Bool)

(assert (=> d!23369 (= (+!109 (+!109 lt!41614 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (+!109 (+!109 lt!41614 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(declare-fun lt!41914 () Unit!2582)

(declare-fun choose!521 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64) V!3033) Unit!2582)

(assert (=> d!23369 (= lt!41914 (choose!521 lt!41614 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(assert (=> d!23369 (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23369 (= (addCommutativeForDiffKeys!29 lt!41614 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) lt!41914)))

(declare-fun bs!3720 () Bool)

(assert (= bs!3720 d!23369))

(declare-fun m!93773 () Bool)

(assert (=> bs!3720 m!93773))

(declare-fun m!93775 () Bool)

(assert (=> bs!3720 m!93775))

(declare-fun m!93777 () Bool)

(assert (=> bs!3720 m!93777))

(assert (=> bs!3720 m!93775))

(assert (=> bs!3720 m!93405))

(declare-fun m!93779 () Bool)

(assert (=> bs!3720 m!93779))

(assert (=> bs!3720 m!93773))

(declare-fun m!93781 () Bool)

(assert (=> bs!3720 m!93781))

(assert (=> b!87616 d!23369))

(declare-fun d!23371 () Bool)

(declare-fun e!57342 () Bool)

(assert (=> d!23371 e!57342))

(declare-fun res!45097 () Bool)

(assert (=> d!23371 (=> (not res!45097) (not e!57342))))

(declare-fun lt!41918 () ListLongMap!1445)

(assert (=> d!23371 (= res!45097 (contains!750 lt!41918 (_1!1107 lt!41611)))))

(declare-fun lt!41916 () List!1512)

(assert (=> d!23371 (= lt!41918 (ListLongMap!1446 lt!41916))))

(declare-fun lt!41917 () Unit!2582)

(declare-fun lt!41915 () Unit!2582)

(assert (=> d!23371 (= lt!41917 lt!41915)))

(assert (=> d!23371 (= (getValueByKey!142 lt!41916 (_1!1107 lt!41611)) (Some!147 (_2!1107 lt!41611)))))

(assert (=> d!23371 (= lt!41915 (lemmaContainsTupThenGetReturnValue!59 lt!41916 (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(assert (=> d!23371 (= lt!41916 (insertStrictlySorted!62 (toList!738 lt!41599) (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(assert (=> d!23371 (= (+!109 lt!41599 lt!41611) lt!41918)))

(declare-fun b!88016 () Bool)

(declare-fun res!45098 () Bool)

(assert (=> b!88016 (=> (not res!45098) (not e!57342))))

(assert (=> b!88016 (= res!45098 (= (getValueByKey!142 (toList!738 lt!41918) (_1!1107 lt!41611)) (Some!147 (_2!1107 lt!41611))))))

(declare-fun b!88017 () Bool)

(assert (=> b!88017 (= e!57342 (contains!753 (toList!738 lt!41918) lt!41611))))

(assert (= (and d!23371 res!45097) b!88016))

(assert (= (and b!88016 res!45098) b!88017))

(declare-fun m!93783 () Bool)

(assert (=> d!23371 m!93783))

(declare-fun m!93785 () Bool)

(assert (=> d!23371 m!93785))

(declare-fun m!93787 () Bool)

(assert (=> d!23371 m!93787))

(declare-fun m!93789 () Bool)

(assert (=> d!23371 m!93789))

(declare-fun m!93791 () Bool)

(assert (=> b!88016 m!93791))

(declare-fun m!93793 () Bool)

(assert (=> b!88017 m!93793))

(assert (=> b!87616 d!23371))

(declare-fun b!88042 () Bool)

(declare-fun e!57357 () ListLongMap!1445)

(declare-fun e!57360 () ListLongMap!1445)

(assert (=> b!88042 (= e!57357 e!57360)))

(declare-fun c!14542 () Bool)

(assert (=> b!88042 (= c!14542 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88043 () Bool)

(declare-fun e!57358 () Bool)

(declare-fun lt!41935 () ListLongMap!1445)

(declare-fun isEmpty!344 (ListLongMap!1445) Bool)

(assert (=> b!88043 (= e!57358 (isEmpty!344 lt!41935))))

(declare-fun b!88044 () Bool)

(declare-fun lt!41934 () Unit!2582)

(declare-fun lt!41933 () Unit!2582)

(assert (=> b!88044 (= lt!41934 lt!41933)))

(declare-fun lt!41938 () V!3033)

(declare-fun lt!41939 () (_ BitVec 64))

(declare-fun lt!41937 () ListLongMap!1445)

(declare-fun lt!41936 () (_ BitVec 64))

(assert (=> b!88044 (not (contains!750 (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938)) lt!41939))))

(declare-fun addStillNotContains!34 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2582)

(assert (=> b!88044 (= lt!41933 (addStillNotContains!34 lt!41937 lt!41936 lt!41938 lt!41939))))

(assert (=> b!88044 (= lt!41939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88044 (= lt!41938 (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88044 (= lt!41936 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!8448 () ListLongMap!1445)

(assert (=> b!88044 (= lt!41937 call!8448)))

(assert (=> b!88044 (= e!57360 (+!109 call!8448 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!88045 () Bool)

(assert (=> b!88045 (= e!57357 (ListLongMap!1446 Nil!1509))))

(declare-fun bm!8445 () Bool)

(assert (=> bm!8445 (= call!8448 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!88046 () Bool)

(assert (=> b!88046 (= e!57360 call!8448)))

(declare-fun b!88047 () Bool)

(assert (=> b!88047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> b!88047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2162 (_values!2341 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun e!57359 () Bool)

(assert (=> b!88047 (= e!57359 (= (apply!83 lt!41935 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!23373 () Bool)

(declare-fun e!57362 () Bool)

(assert (=> d!23373 e!57362))

(declare-fun res!45109 () Bool)

(assert (=> d!23373 (=> (not res!45109) (not e!57362))))

(assert (=> d!23373 (= res!45109 (not (contains!750 lt!41935 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23373 (= lt!41935 e!57357)))

(declare-fun c!14541 () Bool)

(assert (=> d!23373 (= c!14541 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> d!23373 (validMask!0 (mask!6396 (v!2664 (underlying!295 thiss!992))))))

(assert (=> d!23373 (= (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))) lt!41935)))

(declare-fun b!88048 () Bool)

(declare-fun e!57361 () Bool)

(assert (=> b!88048 (= e!57362 e!57361)))

(declare-fun c!14540 () Bool)

(declare-fun e!57363 () Bool)

(assert (=> b!88048 (= c!14540 e!57363)))

(declare-fun res!45108 () Bool)

(assert (=> b!88048 (=> (not res!45108) (not e!57363))))

(assert (=> b!88048 (= res!45108 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88049 () Bool)

(assert (=> b!88049 (= e!57363 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88049 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!88050 () Bool)

(assert (=> b!88050 (= e!57361 e!57358)))

(declare-fun c!14543 () Bool)

(assert (=> b!88050 (= c!14543 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88051 () Bool)

(assert (=> b!88051 (= e!57358 (= lt!41935 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88052 () Bool)

(declare-fun res!45107 () Bool)

(assert (=> b!88052 (=> (not res!45107) (not e!57362))))

(assert (=> b!88052 (= res!45107 (not (contains!750 lt!41935 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88053 () Bool)

(assert (=> b!88053 (= e!57361 e!57359)))

(assert (=> b!88053 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun res!45110 () Bool)

(assert (=> b!88053 (= res!45110 (contains!750 lt!41935 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88053 (=> (not res!45110) (not e!57359))))

(assert (= (and d!23373 c!14541) b!88045))

(assert (= (and d!23373 (not c!14541)) b!88042))

(assert (= (and b!88042 c!14542) b!88044))

(assert (= (and b!88042 (not c!14542)) b!88046))

(assert (= (or b!88044 b!88046) bm!8445))

(assert (= (and d!23373 res!45109) b!88052))

(assert (= (and b!88052 res!45107) b!88048))

(assert (= (and b!88048 res!45108) b!88049))

(assert (= (and b!88048 c!14540) b!88053))

(assert (= (and b!88048 (not c!14540)) b!88050))

(assert (= (and b!88053 res!45110) b!88047))

(assert (= (and b!88050 c!14543) b!88051))

(assert (= (and b!88050 (not c!14543)) b!88043))

(declare-fun b_lambda!3897 () Bool)

(assert (=> (not b_lambda!3897) (not b!88044)))

(assert (=> b!88044 t!5242))

(declare-fun b_and!5297 () Bool)

(assert (= b_and!5293 (and (=> t!5242 result!2931) b_and!5297)))

(assert (=> b!88044 t!5244))

(declare-fun b_and!5299 () Bool)

(assert (= b_and!5295 (and (=> t!5244 result!2935) b_and!5299)))

(declare-fun b_lambda!3899 () Bool)

(assert (=> (not b_lambda!3899) (not b!88047)))

(assert (=> b!88047 t!5242))

(declare-fun b_and!5301 () Bool)

(assert (= b_and!5297 (and (=> t!5242 result!2931) b_and!5301)))

(assert (=> b!88047 t!5244))

(declare-fun b_and!5303 () Bool)

(assert (= b_and!5299 (and (=> t!5244 result!2935) b_and!5303)))

(declare-fun m!93795 () Bool)

(assert (=> b!88051 m!93795))

(assert (=> bm!8445 m!93795))

(assert (=> b!88047 m!93607))

(assert (=> b!88047 m!93453))

(assert (=> b!88047 m!93621))

(assert (=> b!88047 m!93607))

(declare-fun m!93797 () Bool)

(assert (=> b!88047 m!93797))

(assert (=> b!88047 m!93621))

(assert (=> b!88047 m!93453))

(assert (=> b!88047 m!93623))

(assert (=> b!88049 m!93607))

(assert (=> b!88049 m!93607))

(assert (=> b!88049 m!93609))

(assert (=> b!88042 m!93607))

(assert (=> b!88042 m!93607))

(assert (=> b!88042 m!93609))

(declare-fun m!93799 () Bool)

(assert (=> b!88043 m!93799))

(assert (=> b!88053 m!93607))

(assert (=> b!88053 m!93607))

(declare-fun m!93801 () Bool)

(assert (=> b!88053 m!93801))

(declare-fun m!93803 () Bool)

(assert (=> b!88052 m!93803))

(declare-fun m!93805 () Bool)

(assert (=> b!88044 m!93805))

(assert (=> b!88044 m!93607))

(assert (=> b!88044 m!93453))

(assert (=> b!88044 m!93621))

(declare-fun m!93807 () Bool)

(assert (=> b!88044 m!93807))

(assert (=> b!88044 m!93807))

(declare-fun m!93809 () Bool)

(assert (=> b!88044 m!93809))

(declare-fun m!93811 () Bool)

(assert (=> b!88044 m!93811))

(assert (=> b!88044 m!93621))

(assert (=> b!88044 m!93453))

(assert (=> b!88044 m!93623))

(declare-fun m!93813 () Bool)

(assert (=> d!23373 m!93813))

(assert (=> d!23373 m!93441))

(assert (=> b!87616 d!23373))

(declare-fun d!23375 () Bool)

(declare-fun e!57364 () Bool)

(assert (=> d!23375 e!57364))

(declare-fun res!45111 () Bool)

(assert (=> d!23375 (=> (not res!45111) (not e!57364))))

(declare-fun lt!41943 () ListLongMap!1445)

(assert (=> d!23375 (= res!45111 (contains!750 lt!41943 (_1!1107 lt!41606)))))

(declare-fun lt!41941 () List!1512)

(assert (=> d!23375 (= lt!41943 (ListLongMap!1446 lt!41941))))

(declare-fun lt!41942 () Unit!2582)

(declare-fun lt!41940 () Unit!2582)

(assert (=> d!23375 (= lt!41942 lt!41940)))

(assert (=> d!23375 (= (getValueByKey!142 lt!41941 (_1!1107 lt!41606)) (Some!147 (_2!1107 lt!41606)))))

(assert (=> d!23375 (= lt!41940 (lemmaContainsTupThenGetReturnValue!59 lt!41941 (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(assert (=> d!23375 (= lt!41941 (insertStrictlySorted!62 (toList!738 lt!41598) (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(assert (=> d!23375 (= (+!109 lt!41598 lt!41606) lt!41943)))

(declare-fun b!88054 () Bool)

(declare-fun res!45112 () Bool)

(assert (=> b!88054 (=> (not res!45112) (not e!57364))))

(assert (=> b!88054 (= res!45112 (= (getValueByKey!142 (toList!738 lt!41943) (_1!1107 lt!41606)) (Some!147 (_2!1107 lt!41606))))))

(declare-fun b!88055 () Bool)

(assert (=> b!88055 (= e!57364 (contains!753 (toList!738 lt!41943) lt!41606))))

(assert (= (and d!23375 res!45111) b!88054))

(assert (= (and b!88054 res!45112) b!88055))

(declare-fun m!93815 () Bool)

(assert (=> d!23375 m!93815))

(declare-fun m!93817 () Bool)

(assert (=> d!23375 m!93817))

(declare-fun m!93819 () Bool)

(assert (=> d!23375 m!93819))

(declare-fun m!93821 () Bool)

(assert (=> d!23375 m!93821))

(declare-fun m!93823 () Bool)

(assert (=> b!88054 m!93823))

(declare-fun m!93825 () Bool)

(assert (=> b!88055 m!93825))

(assert (=> b!87616 d!23375))

(declare-fun d!23377 () Bool)

(declare-fun e!57365 () Bool)

(assert (=> d!23377 e!57365))

(declare-fun res!45113 () Bool)

(assert (=> d!23377 (=> (not res!45113) (not e!57365))))

(declare-fun lt!41947 () ListLongMap!1445)

(assert (=> d!23377 (= res!45113 (contains!750 lt!41947 (_1!1107 lt!41604)))))

(declare-fun lt!41945 () List!1512)

(assert (=> d!23377 (= lt!41947 (ListLongMap!1446 lt!41945))))

(declare-fun lt!41946 () Unit!2582)

(declare-fun lt!41944 () Unit!2582)

(assert (=> d!23377 (= lt!41946 lt!41944)))

(assert (=> d!23377 (= (getValueByKey!142 lt!41945 (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604)))))

(assert (=> d!23377 (= lt!41944 (lemmaContainsTupThenGetReturnValue!59 lt!41945 (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(assert (=> d!23377 (= lt!41945 (insertStrictlySorted!62 (toList!738 (+!109 lt!41600 lt!41611)) (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(assert (=> d!23377 (= (+!109 (+!109 lt!41600 lt!41611) lt!41604) lt!41947)))

(declare-fun b!88056 () Bool)

(declare-fun res!45114 () Bool)

(assert (=> b!88056 (=> (not res!45114) (not e!57365))))

(assert (=> b!88056 (= res!45114 (= (getValueByKey!142 (toList!738 lt!41947) (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604))))))

(declare-fun b!88057 () Bool)

(assert (=> b!88057 (= e!57365 (contains!753 (toList!738 lt!41947) lt!41604))))

(assert (= (and d!23377 res!45113) b!88056))

(assert (= (and b!88056 res!45114) b!88057))

(declare-fun m!93827 () Bool)

(assert (=> d!23377 m!93827))

(declare-fun m!93829 () Bool)

(assert (=> d!23377 m!93829))

(declare-fun m!93831 () Bool)

(assert (=> d!23377 m!93831))

(declare-fun m!93833 () Bool)

(assert (=> d!23377 m!93833))

(declare-fun m!93835 () Bool)

(assert (=> b!88056 m!93835))

(declare-fun m!93837 () Bool)

(assert (=> b!88057 m!93837))

(assert (=> b!87616 d!23377))

(declare-fun d!23379 () Bool)

(assert (=> d!23379 (= (+!109 (+!109 lt!41600 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (+!109 (+!109 lt!41600 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(declare-fun lt!41948 () Unit!2582)

(assert (=> d!23379 (= lt!41948 (choose!521 lt!41600 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))

(assert (=> d!23379 (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23379 (= (addCommutativeForDiffKeys!29 lt!41600 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))) lt!41948)))

(declare-fun bs!3721 () Bool)

(assert (= bs!3721 d!23379))

(declare-fun m!93839 () Bool)

(assert (=> bs!3721 m!93839))

(declare-fun m!93841 () Bool)

(assert (=> bs!3721 m!93841))

(declare-fun m!93843 () Bool)

(assert (=> bs!3721 m!93843))

(assert (=> bs!3721 m!93841))

(assert (=> bs!3721 m!93405))

(declare-fun m!93845 () Bool)

(assert (=> bs!3721 m!93845))

(assert (=> bs!3721 m!93839))

(declare-fun m!93847 () Bool)

(assert (=> bs!3721 m!93847))

(assert (=> b!87616 d!23379))

(declare-fun d!23381 () Bool)

(declare-fun e!57366 () Bool)

(assert (=> d!23381 e!57366))

(declare-fun res!45115 () Bool)

(assert (=> d!23381 (=> (not res!45115) (not e!57366))))

(declare-fun lt!41952 () ListLongMap!1445)

(assert (=> d!23381 (= res!45115 (contains!750 lt!41952 (_1!1107 lt!41604)))))

(declare-fun lt!41950 () List!1512)

(assert (=> d!23381 (= lt!41952 (ListLongMap!1446 lt!41950))))

(declare-fun lt!41951 () Unit!2582)

(declare-fun lt!41949 () Unit!2582)

(assert (=> d!23381 (= lt!41951 lt!41949)))

(assert (=> d!23381 (= (getValueByKey!142 lt!41950 (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604)))))

(assert (=> d!23381 (= lt!41949 (lemmaContainsTupThenGetReturnValue!59 lt!41950 (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(assert (=> d!23381 (= lt!41950 (insertStrictlySorted!62 (toList!738 lt!41600) (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(assert (=> d!23381 (= (+!109 lt!41600 lt!41604) lt!41952)))

(declare-fun b!88058 () Bool)

(declare-fun res!45116 () Bool)

(assert (=> b!88058 (=> (not res!45116) (not e!57366))))

(assert (=> b!88058 (= res!45116 (= (getValueByKey!142 (toList!738 lt!41952) (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604))))))

(declare-fun b!88059 () Bool)

(assert (=> b!88059 (= e!57366 (contains!753 (toList!738 lt!41952) lt!41604))))

(assert (= (and d!23381 res!45115) b!88058))

(assert (= (and b!88058 res!45116) b!88059))

(declare-fun m!93849 () Bool)

(assert (=> d!23381 m!93849))

(declare-fun m!93851 () Bool)

(assert (=> d!23381 m!93851))

(declare-fun m!93853 () Bool)

(assert (=> d!23381 m!93853))

(declare-fun m!93855 () Bool)

(assert (=> d!23381 m!93855))

(declare-fun m!93857 () Bool)

(assert (=> b!88058 m!93857))

(declare-fun m!93859 () Bool)

(assert (=> b!88059 m!93859))

(assert (=> b!87616 d!23381))

(declare-fun d!23383 () Bool)

(assert (=> d!23383 (= (validMask!0 (mask!6396 (v!2664 (underlying!295 thiss!992)))) (and (or (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000001111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000011111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000001111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000011111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000001111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000011111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000001111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000011111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000000111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000001111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000011111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000000111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000001111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000011111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000000111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000001111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000011111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000000111111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000001111111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000011111111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00000111111111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00001111111111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00011111111111111111111111111111) (= (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6396 (v!2664 (underlying!295 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!87616 d!23383))

(declare-fun d!23385 () Bool)

(declare-fun e!57367 () Bool)

(assert (=> d!23385 e!57367))

(declare-fun res!45117 () Bool)

(assert (=> d!23385 (=> (not res!45117) (not e!57367))))

(declare-fun lt!41956 () ListLongMap!1445)

(assert (=> d!23385 (= res!45117 (contains!750 lt!41956 (_1!1107 lt!41606)))))

(declare-fun lt!41954 () List!1512)

(assert (=> d!23385 (= lt!41956 (ListLongMap!1446 lt!41954))))

(declare-fun lt!41955 () Unit!2582)

(declare-fun lt!41953 () Unit!2582)

(assert (=> d!23385 (= lt!41955 lt!41953)))

(assert (=> d!23385 (= (getValueByKey!142 lt!41954 (_1!1107 lt!41606)) (Some!147 (_2!1107 lt!41606)))))

(assert (=> d!23385 (= lt!41953 (lemmaContainsTupThenGetReturnValue!59 lt!41954 (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(assert (=> d!23385 (= lt!41954 (insertStrictlySorted!62 (toList!738 lt!41614) (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(assert (=> d!23385 (= (+!109 lt!41614 lt!41606) lt!41956)))

(declare-fun b!88060 () Bool)

(declare-fun res!45118 () Bool)

(assert (=> b!88060 (=> (not res!45118) (not e!57367))))

(assert (=> b!88060 (= res!45118 (= (getValueByKey!142 (toList!738 lt!41956) (_1!1107 lt!41606)) (Some!147 (_2!1107 lt!41606))))))

(declare-fun b!88061 () Bool)

(assert (=> b!88061 (= e!57367 (contains!753 (toList!738 lt!41956) lt!41606))))

(assert (= (and d!23385 res!45117) b!88060))

(assert (= (and b!88060 res!45118) b!88061))

(declare-fun m!93861 () Bool)

(assert (=> d!23385 m!93861))

(declare-fun m!93863 () Bool)

(assert (=> d!23385 m!93863))

(declare-fun m!93865 () Bool)

(assert (=> d!23385 m!93865))

(declare-fun m!93867 () Bool)

(assert (=> d!23385 m!93867))

(declare-fun m!93869 () Bool)

(assert (=> b!88060 m!93869))

(declare-fun m!93871 () Bool)

(assert (=> b!88061 m!93871))

(assert (=> b!87616 d!23385))

(declare-fun d!23387 () Bool)

(declare-fun e!57368 () Bool)

(assert (=> d!23387 e!57368))

(declare-fun res!45119 () Bool)

(assert (=> d!23387 (=> (not res!45119) (not e!57368))))

(declare-fun lt!41960 () ListLongMap!1445)

(assert (=> d!23387 (= res!45119 (contains!750 lt!41960 (_1!1107 lt!41604)))))

(declare-fun lt!41958 () List!1512)

(assert (=> d!23387 (= lt!41960 (ListLongMap!1446 lt!41958))))

(declare-fun lt!41959 () Unit!2582)

(declare-fun lt!41957 () Unit!2582)

(assert (=> d!23387 (= lt!41959 lt!41957)))

(assert (=> d!23387 (= (getValueByKey!142 lt!41958 (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604)))))

(assert (=> d!23387 (= lt!41957 (lemmaContainsTupThenGetReturnValue!59 lt!41958 (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(assert (=> d!23387 (= lt!41958 (insertStrictlySorted!62 (toList!738 lt!41614) (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(assert (=> d!23387 (= (+!109 lt!41614 lt!41604) lt!41960)))

(declare-fun b!88062 () Bool)

(declare-fun res!45120 () Bool)

(assert (=> b!88062 (=> (not res!45120) (not e!57368))))

(assert (=> b!88062 (= res!45120 (= (getValueByKey!142 (toList!738 lt!41960) (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604))))))

(declare-fun b!88063 () Bool)

(assert (=> b!88063 (= e!57368 (contains!753 (toList!738 lt!41960) lt!41604))))

(assert (= (and d!23387 res!45119) b!88062))

(assert (= (and b!88062 res!45120) b!88063))

(declare-fun m!93873 () Bool)

(assert (=> d!23387 m!93873))

(declare-fun m!93875 () Bool)

(assert (=> d!23387 m!93875))

(declare-fun m!93877 () Bool)

(assert (=> d!23387 m!93877))

(declare-fun m!93879 () Bool)

(assert (=> d!23387 m!93879))

(declare-fun m!93881 () Bool)

(assert (=> b!88062 m!93881))

(declare-fun m!93883 () Bool)

(assert (=> b!88063 m!93883))

(assert (=> b!87616 d!23387))

(declare-fun b!88071 () Bool)

(declare-fun e!57374 () Bool)

(assert (=> b!88071 (= e!57374 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3435 () Bool)

(declare-fun mapRes!3435 () Bool)

(declare-fun tp!8997 () Bool)

(declare-fun e!57373 () Bool)

(assert (=> mapNonEmpty!3435 (= mapRes!3435 (and tp!8997 e!57373))))

(declare-fun mapKey!3435 () (_ BitVec 32))

(declare-fun mapValue!3435 () ValueCell!926)

(declare-fun mapRest!3435 () (Array (_ BitVec 32) ValueCell!926))

(assert (=> mapNonEmpty!3435 (= mapRest!3420 (store mapRest!3435 mapKey!3435 mapValue!3435))))

(declare-fun b!88070 () Bool)

(assert (=> b!88070 (= e!57373 tp_is_empty!2539)))

(declare-fun mapIsEmpty!3435 () Bool)

(assert (=> mapIsEmpty!3435 mapRes!3435))

(declare-fun condMapEmpty!3435 () Bool)

(declare-fun mapDefault!3435 () ValueCell!926)

(assert (=> mapNonEmpty!3420 (= condMapEmpty!3435 (= mapRest!3420 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3435)))))

(assert (=> mapNonEmpty!3420 (= tp!8970 (and e!57374 mapRes!3435))))

(assert (= (and mapNonEmpty!3420 condMapEmpty!3435) mapIsEmpty!3435))

(assert (= (and mapNonEmpty!3420 (not condMapEmpty!3435)) mapNonEmpty!3435))

(assert (= (and mapNonEmpty!3435 ((_ is ValueCellFull!926) mapValue!3435)) b!88070))

(assert (= (and mapNonEmpty!3420 ((_ is ValueCellFull!926) mapDefault!3435)) b!88071))

(declare-fun m!93885 () Bool)

(assert (=> mapNonEmpty!3435 m!93885))

(declare-fun b!88073 () Bool)

(declare-fun e!57376 () Bool)

(assert (=> b!88073 (= e!57376 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3436 () Bool)

(declare-fun mapRes!3436 () Bool)

(declare-fun tp!8998 () Bool)

(declare-fun e!57375 () Bool)

(assert (=> mapNonEmpty!3436 (= mapRes!3436 (and tp!8998 e!57375))))

(declare-fun mapValue!3436 () ValueCell!926)

(declare-fun mapKey!3436 () (_ BitVec 32))

(declare-fun mapRest!3436 () (Array (_ BitVec 32) ValueCell!926))

(assert (=> mapNonEmpty!3436 (= mapRest!3419 (store mapRest!3436 mapKey!3436 mapValue!3436))))

(declare-fun b!88072 () Bool)

(assert (=> b!88072 (= e!57375 tp_is_empty!2539)))

(declare-fun mapIsEmpty!3436 () Bool)

(assert (=> mapIsEmpty!3436 mapRes!3436))

(declare-fun condMapEmpty!3436 () Bool)

(declare-fun mapDefault!3436 () ValueCell!926)

(assert (=> mapNonEmpty!3419 (= condMapEmpty!3436 (= mapRest!3419 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3436)))))

(assert (=> mapNonEmpty!3419 (= tp!8968 (and e!57376 mapRes!3436))))

(assert (= (and mapNonEmpty!3419 condMapEmpty!3436) mapIsEmpty!3436))

(assert (= (and mapNonEmpty!3419 (not condMapEmpty!3436)) mapNonEmpty!3436))

(assert (= (and mapNonEmpty!3436 ((_ is ValueCellFull!926) mapValue!3436)) b!88072))

(assert (= (and mapNonEmpty!3419 ((_ is ValueCellFull!926) mapDefault!3436)) b!88073))

(declare-fun m!93887 () Bool)

(assert (=> mapNonEmpty!3436 m!93887))

(declare-fun b_lambda!3901 () Bool)

(assert (= b_lambda!3895 (or (and b!87608 b_free!2245) (and b!87620 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))) b_lambda!3901)))

(declare-fun b_lambda!3903 () Bool)

(assert (= b_lambda!3899 (or (and b!87608 b_free!2245) (and b!87620 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))) b_lambda!3903)))

(declare-fun b_lambda!3905 () Bool)

(assert (= b_lambda!3897 (or (and b!87608 b_free!2245) (and b!87620 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))) b_lambda!3905)))

(check-sat (not b!87999) (not b!88009) (not b!88000) (not bm!8413) (not b!87953) (not bm!8416) (not bm!8422) (not b!88017) (not d!23375) (not b!88049) (not b!87942) (not mapNonEmpty!3435) (not bm!8358) (not b!88059) (not b!88008) (not b!87818) (not d!23373) (not mapNonEmpty!3436) (not b!87815) (not b!88053) (not bm!8442) (not b!88056) (not d!23335) (not b!88043) (not b!88047) (not bm!8435) (not b!88054) (not b!87928) (not b!88014) (not d!23337) (not bm!8445) (not b!88055) (not d!23345) (not b!87811) (not b!88061) (not d!23385) (not d!23387) (not b!88015) (not b!88052) (not bm!8364) (not b!87915) (not b!88051) (not bm!8436) (not bm!8434) (not d!23381) (not b!87961) (not b!88060) (not b!87945) (not bm!8359) (not d!23371) (not b!88044) (not b_lambda!3901) (not b!87803) (not b!87829) (not bm!8432) (not b!88042) (not b!87981) (not bm!8362) b_and!5301 (not b!87800) (not bm!8433) (not b!88007) (not b_lambda!3903) (not bm!8439) (not bm!8429) (not b!87993) (not d!23361) (not d!23339) (not d!23369) (not bm!8414) (not b!88016) (not b!87966) (not d!23365) (not d!23377) (not b_next!2247) b_and!5303 (not b!87991) (not b!87978) (not b!87827) (not bm!8419) (not bm!8424) (not b!87979) (not b_lambda!3905) (not b_next!2245) (not b_lambda!3893) (not b!88063) (not b!88062) (not b!87804) (not d!23379) (not b!87933) (not b!88058) (not b!87924) (not d!23367) (not d!23351) (not b!88057) (not b!87805) (not d!23333) (not b!87814) (not d!23347) tp_is_empty!2539)
(check-sat b_and!5301 b_and!5303 (not b_next!2245) (not b_next!2247))
(get-model)

(declare-fun d!23389 () Bool)

(declare-fun res!45121 () Bool)

(declare-fun e!57377 () Bool)

(assert (=> d!23389 (=> res!45121 e!57377)))

(assert (=> d!23389 (= res!45121 (= (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23389 (= (arrayContainsKey!0 (_keys!4034 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000) e!57377)))

(declare-fun b!88074 () Bool)

(declare-fun e!57378 () Bool)

(assert (=> b!88074 (= e!57377 e!57378)))

(declare-fun res!45122 () Bool)

(assert (=> b!88074 (=> (not res!45122) (not e!57378))))

(assert (=> b!88074 (= res!45122 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88075 () Bool)

(assert (=> b!88075 (= e!57378 (arrayContainsKey!0 (_keys!4034 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23389 (not res!45121)) b!88074))

(assert (= (and b!88074 res!45122) b!88075))

(declare-fun m!93889 () Bool)

(assert (=> d!23389 m!93889))

(assert (=> b!88075 m!93405))

(declare-fun m!93891 () Bool)

(assert (=> b!88075 m!93891))

(assert (=> bm!8413 d!23389))

(declare-fun d!23391 () Bool)

(declare-fun lt!41963 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!92 (List!1512) (InoxSet tuple2!2192))

(assert (=> d!23391 (= lt!41963 (select (content!92 (toList!738 lt!41960)) lt!41604))))

(declare-fun e!57384 () Bool)

(assert (=> d!23391 (= lt!41963 e!57384)))

(declare-fun res!45127 () Bool)

(assert (=> d!23391 (=> (not res!45127) (not e!57384))))

(assert (=> d!23391 (= res!45127 ((_ is Cons!1508) (toList!738 lt!41960)))))

(assert (=> d!23391 (= (contains!753 (toList!738 lt!41960) lt!41604) lt!41963)))

(declare-fun b!88080 () Bool)

(declare-fun e!57383 () Bool)

(assert (=> b!88080 (= e!57384 e!57383)))

(declare-fun res!45128 () Bool)

(assert (=> b!88080 (=> res!45128 e!57383)))

(assert (=> b!88080 (= res!45128 (= (h!2100 (toList!738 lt!41960)) lt!41604))))

(declare-fun b!88081 () Bool)

(assert (=> b!88081 (= e!57383 (contains!753 (t!5246 (toList!738 lt!41960)) lt!41604))))

(assert (= (and d!23391 res!45127) b!88080))

(assert (= (and b!88080 (not res!45128)) b!88081))

(declare-fun m!93893 () Bool)

(assert (=> d!23391 m!93893))

(declare-fun m!93895 () Bool)

(assert (=> d!23391 m!93895))

(declare-fun m!93897 () Bool)

(assert (=> b!88081 m!93897))

(assert (=> b!88063 d!23391))

(declare-fun d!23393 () Bool)

(assert (=> d!23393 (= (get!1212 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2663 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!87999 d!23393))

(declare-fun d!23395 () Bool)

(declare-fun e!57385 () Bool)

(assert (=> d!23395 e!57385))

(declare-fun res!45129 () Bool)

(assert (=> d!23395 (=> (not res!45129) (not e!57385))))

(declare-fun lt!41967 () ListLongMap!1445)

(assert (=> d!23395 (= res!45129 (contains!750 lt!41967 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun lt!41965 () List!1512)

(assert (=> d!23395 (= lt!41967 (ListLongMap!1446 lt!41965))))

(declare-fun lt!41966 () Unit!2582)

(declare-fun lt!41964 () Unit!2582)

(assert (=> d!23395 (= lt!41966 lt!41964)))

(assert (=> d!23395 (= (getValueByKey!142 lt!41965 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23395 (= lt!41964 (lemmaContainsTupThenGetReturnValue!59 lt!41965 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23395 (= lt!41965 (insertStrictlySorted!62 (toList!738 (+!109 lt!41614 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23395 (= (+!109 (+!109 lt!41614 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) lt!41967)))

(declare-fun b!88082 () Bool)

(declare-fun res!45130 () Bool)

(assert (=> b!88082 (=> (not res!45130) (not e!57385))))

(assert (=> b!88082 (= res!45130 (= (getValueByKey!142 (toList!738 lt!41967) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(declare-fun b!88083 () Bool)

(assert (=> b!88083 (= e!57385 (contains!753 (toList!738 lt!41967) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(assert (= (and d!23395 res!45129) b!88082))

(assert (= (and b!88082 res!45130) b!88083))

(declare-fun m!93899 () Bool)

(assert (=> d!23395 m!93899))

(declare-fun m!93901 () Bool)

(assert (=> d!23395 m!93901))

(declare-fun m!93903 () Bool)

(assert (=> d!23395 m!93903))

(declare-fun m!93905 () Bool)

(assert (=> d!23395 m!93905))

(declare-fun m!93907 () Bool)

(assert (=> b!88082 m!93907))

(declare-fun m!93909 () Bool)

(assert (=> b!88083 m!93909))

(assert (=> d!23369 d!23395))

(declare-fun d!23397 () Bool)

(assert (=> d!23397 (= (+!109 (+!109 lt!41614 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (+!109 (+!109 lt!41614 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(assert (=> d!23397 true))

(declare-fun _$28!146 () Unit!2582)

(assert (=> d!23397 (= (choose!521 lt!41614 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) _$28!146)))

(declare-fun bs!3722 () Bool)

(assert (= bs!3722 d!23397))

(assert (=> bs!3722 m!93773))

(assert (=> bs!3722 m!93773))

(assert (=> bs!3722 m!93781))

(assert (=> bs!3722 m!93775))

(assert (=> bs!3722 m!93775))

(assert (=> bs!3722 m!93777))

(assert (=> d!23369 d!23397))

(declare-fun d!23399 () Bool)

(declare-fun e!57386 () Bool)

(assert (=> d!23399 e!57386))

(declare-fun res!45131 () Bool)

(assert (=> d!23399 (=> (not res!45131) (not e!57386))))

(declare-fun lt!41971 () ListLongMap!1445)

(assert (=> d!23399 (= res!45131 (contains!750 lt!41971 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun lt!41969 () List!1512)

(assert (=> d!23399 (= lt!41971 (ListLongMap!1446 lt!41969))))

(declare-fun lt!41970 () Unit!2582)

(declare-fun lt!41968 () Unit!2582)

(assert (=> d!23399 (= lt!41970 lt!41968)))

(assert (=> d!23399 (= (getValueByKey!142 lt!41969 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23399 (= lt!41968 (lemmaContainsTupThenGetReturnValue!59 lt!41969 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23399 (= lt!41969 (insertStrictlySorted!62 (toList!738 lt!41614) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23399 (= (+!109 lt!41614 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) lt!41971)))

(declare-fun b!88084 () Bool)

(declare-fun res!45132 () Bool)

(assert (=> b!88084 (=> (not res!45132) (not e!57386))))

(assert (=> b!88084 (= res!45132 (= (getValueByKey!142 (toList!738 lt!41971) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(declare-fun b!88085 () Bool)

(assert (=> b!88085 (= e!57386 (contains!753 (toList!738 lt!41971) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(assert (= (and d!23399 res!45131) b!88084))

(assert (= (and b!88084 res!45132) b!88085))

(declare-fun m!93911 () Bool)

(assert (=> d!23399 m!93911))

(declare-fun m!93913 () Bool)

(assert (=> d!23399 m!93913))

(declare-fun m!93915 () Bool)

(assert (=> d!23399 m!93915))

(declare-fun m!93917 () Bool)

(assert (=> d!23399 m!93917))

(declare-fun m!93919 () Bool)

(assert (=> b!88084 m!93919))

(declare-fun m!93921 () Bool)

(assert (=> b!88085 m!93921))

(assert (=> d!23369 d!23399))

(declare-fun d!23401 () Bool)

(declare-fun e!57387 () Bool)

(assert (=> d!23401 e!57387))

(declare-fun res!45133 () Bool)

(assert (=> d!23401 (=> (not res!45133) (not e!57387))))

(declare-fun lt!41975 () ListLongMap!1445)

(assert (=> d!23401 (= res!45133 (contains!750 lt!41975 (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!41973 () List!1512)

(assert (=> d!23401 (= lt!41975 (ListLongMap!1446 lt!41973))))

(declare-fun lt!41974 () Unit!2582)

(declare-fun lt!41972 () Unit!2582)

(assert (=> d!23401 (= lt!41974 lt!41972)))

(assert (=> d!23401 (= (getValueByKey!142 lt!41973 (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23401 (= lt!41972 (lemmaContainsTupThenGetReturnValue!59 lt!41973 (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23401 (= lt!41973 (insertStrictlySorted!62 (toList!738 (+!109 lt!41614 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23401 (= (+!109 (+!109 lt!41614 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41975)))

(declare-fun b!88086 () Bool)

(declare-fun res!45134 () Bool)

(assert (=> b!88086 (=> (not res!45134) (not e!57387))))

(assert (=> b!88086 (= res!45134 (= (getValueByKey!142 (toList!738 lt!41975) (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88087 () Bool)

(assert (=> b!88087 (= e!57387 (contains!753 (toList!738 lt!41975) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23401 res!45133) b!88086))

(assert (= (and b!88086 res!45134) b!88087))

(declare-fun m!93923 () Bool)

(assert (=> d!23401 m!93923))

(declare-fun m!93925 () Bool)

(assert (=> d!23401 m!93925))

(declare-fun m!93927 () Bool)

(assert (=> d!23401 m!93927))

(declare-fun m!93929 () Bool)

(assert (=> d!23401 m!93929))

(declare-fun m!93931 () Bool)

(assert (=> b!88086 m!93931))

(declare-fun m!93933 () Bool)

(assert (=> b!88087 m!93933))

(assert (=> d!23369 d!23401))

(declare-fun d!23403 () Bool)

(declare-fun e!57388 () Bool)

(assert (=> d!23403 e!57388))

(declare-fun res!45135 () Bool)

(assert (=> d!23403 (=> (not res!45135) (not e!57388))))

(declare-fun lt!41979 () ListLongMap!1445)

(assert (=> d!23403 (= res!45135 (contains!750 lt!41979 (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!41977 () List!1512)

(assert (=> d!23403 (= lt!41979 (ListLongMap!1446 lt!41977))))

(declare-fun lt!41978 () Unit!2582)

(declare-fun lt!41976 () Unit!2582)

(assert (=> d!23403 (= lt!41978 lt!41976)))

(assert (=> d!23403 (= (getValueByKey!142 lt!41977 (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23403 (= lt!41976 (lemmaContainsTupThenGetReturnValue!59 lt!41977 (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23403 (= lt!41977 (insertStrictlySorted!62 (toList!738 lt!41614) (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23403 (= (+!109 lt!41614 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41979)))

(declare-fun b!88088 () Bool)

(declare-fun res!45136 () Bool)

(assert (=> b!88088 (=> (not res!45136) (not e!57388))))

(assert (=> b!88088 (= res!45136 (= (getValueByKey!142 (toList!738 lt!41979) (_1!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88089 () Bool)

(assert (=> b!88089 (= e!57388 (contains!753 (toList!738 lt!41979) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23403 res!45135) b!88088))

(assert (= (and b!88088 res!45136) b!88089))

(declare-fun m!93935 () Bool)

(assert (=> d!23403 m!93935))

(declare-fun m!93937 () Bool)

(assert (=> d!23403 m!93937))

(declare-fun m!93939 () Bool)

(assert (=> d!23403 m!93939))

(declare-fun m!93941 () Bool)

(assert (=> d!23403 m!93941))

(declare-fun m!93943 () Bool)

(assert (=> b!88088 m!93943))

(declare-fun m!93945 () Bool)

(assert (=> b!88089 m!93945))

(assert (=> d!23369 d!23403))

(declare-fun d!23405 () Bool)

(declare-fun res!45137 () Bool)

(declare-fun e!57391 () Bool)

(assert (=> d!23405 (=> res!45137 e!57391)))

(assert (=> d!23405 (= res!45137 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> d!23405 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))) e!57391)))

(declare-fun b!88090 () Bool)

(declare-fun e!57389 () Bool)

(declare-fun e!57390 () Bool)

(assert (=> b!88090 (= e!57389 e!57390)))

(declare-fun lt!41980 () (_ BitVec 64))

(assert (=> b!88090 (= lt!41980 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!41981 () Unit!2582)

(assert (=> b!88090 (= lt!41981 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41980 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!88090 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41980 #b00000000000000000000000000000000)))

(declare-fun lt!41982 () Unit!2582)

(assert (=> b!88090 (= lt!41982 lt!41981)))

(declare-fun res!45138 () Bool)

(assert (=> b!88090 (= res!45138 (= (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))) (Found!238 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!88090 (=> (not res!45138) (not e!57390))))

(declare-fun b!88091 () Bool)

(declare-fun call!8449 () Bool)

(assert (=> b!88091 (= e!57390 call!8449)))

(declare-fun b!88092 () Bool)

(assert (=> b!88092 (= e!57391 e!57389)))

(declare-fun c!14544 () Bool)

(assert (=> b!88092 (= c!14544 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!8446 () Bool)

(assert (=> bm!8446 (= call!8449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!88093 () Bool)

(assert (=> b!88093 (= e!57389 call!8449)))

(assert (= (and d!23405 (not res!45137)) b!88092))

(assert (= (and b!88092 c!14544) b!88090))

(assert (= (and b!88092 (not c!14544)) b!88093))

(assert (= (and b!88090 res!45138) b!88091))

(assert (= (or b!88091 b!88093) bm!8446))

(declare-fun m!93947 () Bool)

(assert (=> b!88090 m!93947))

(declare-fun m!93949 () Bool)

(assert (=> b!88090 m!93949))

(declare-fun m!93951 () Bool)

(assert (=> b!88090 m!93951))

(assert (=> b!88090 m!93947))

(declare-fun m!93953 () Bool)

(assert (=> b!88090 m!93953))

(assert (=> b!88092 m!93947))

(assert (=> b!88092 m!93947))

(declare-fun m!93955 () Bool)

(assert (=> b!88092 m!93955))

(declare-fun m!93957 () Bool)

(assert (=> bm!8446 m!93957))

(assert (=> bm!8442 d!23405))

(declare-fun d!23407 () Bool)

(declare-fun e!57393 () Bool)

(assert (=> d!23407 e!57393))

(declare-fun res!45139 () Bool)

(assert (=> d!23407 (=> res!45139 e!57393)))

(declare-fun lt!41983 () Bool)

(assert (=> d!23407 (= res!45139 (not lt!41983))))

(declare-fun lt!41984 () Bool)

(assert (=> d!23407 (= lt!41983 lt!41984)))

(declare-fun lt!41985 () Unit!2582)

(declare-fun e!57392 () Unit!2582)

(assert (=> d!23407 (= lt!41985 e!57392)))

(declare-fun c!14545 () Bool)

(assert (=> d!23407 (= c!14545 lt!41984)))

(assert (=> d!23407 (= lt!41984 (containsKey!145 (toList!738 lt!41774) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23407 (= (contains!750 lt!41774 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!41983)))

(declare-fun b!88094 () Bool)

(declare-fun lt!41986 () Unit!2582)

(assert (=> b!88094 (= e!57392 lt!41986)))

(assert (=> b!88094 (= lt!41986 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41774) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88094 (isDefined!94 (getValueByKey!142 (toList!738 lt!41774) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88095 () Bool)

(declare-fun Unit!2596 () Unit!2582)

(assert (=> b!88095 (= e!57392 Unit!2596)))

(declare-fun b!88096 () Bool)

(assert (=> b!88096 (= e!57393 (isDefined!94 (getValueByKey!142 (toList!738 lt!41774) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23407 c!14545) b!88094))

(assert (= (and d!23407 (not c!14545)) b!88095))

(assert (= (and d!23407 (not res!45139)) b!88096))

(assert (=> d!23407 m!93607))

(declare-fun m!93959 () Bool)

(assert (=> d!23407 m!93959))

(assert (=> b!88094 m!93607))

(declare-fun m!93961 () Bool)

(assert (=> b!88094 m!93961))

(assert (=> b!88094 m!93607))

(declare-fun m!93963 () Bool)

(assert (=> b!88094 m!93963))

(assert (=> b!88094 m!93963))

(declare-fun m!93965 () Bool)

(assert (=> b!88094 m!93965))

(assert (=> b!88096 m!93607))

(assert (=> b!88096 m!93963))

(assert (=> b!88096 m!93963))

(assert (=> b!88096 m!93965))

(assert (=> b!87803 d!23407))

(assert (=> d!23345 d!23349))

(declare-fun d!23409 () Bool)

(assert (=> d!23409 (not (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!23409 true))

(declare-fun _$68!76 () Unit!2582)

(assert (=> d!23409 (= (choose!68 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508)) _$68!76)))

(declare-fun bs!3723 () Bool)

(assert (= bs!3723 d!23409))

(assert (=> bs!3723 m!93405))

(assert (=> bs!3723 m!93417))

(assert (=> d!23345 d!23409))

(declare-fun d!23411 () Bool)

(declare-fun e!57396 () Bool)

(assert (=> d!23411 e!57396))

(declare-fun res!45144 () Bool)

(assert (=> d!23411 (=> (not res!45144) (not e!57396))))

(declare-fun lt!41991 () SeekEntryResult!238)

(assert (=> d!23411 (= res!45144 ((_ is Found!238) lt!41991))))

(assert (=> d!23411 (= lt!41991 (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(declare-fun lt!41992 () Unit!2582)

(declare-fun choose!522 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2582)

(assert (=> d!23411 (= lt!41992 (choose!522 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23411 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23411 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)) lt!41992)))

(declare-fun b!88101 () Bool)

(declare-fun res!45145 () Bool)

(assert (=> b!88101 (=> (not res!45145) (not e!57396))))

(assert (=> b!88101 (= res!45145 (inRange!0 (index!3091 lt!41991) (mask!6396 newMap!16)))))

(declare-fun b!88102 () Bool)

(assert (=> b!88102 (= e!57396 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41991)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!88102 (and (bvsge (index!3091 lt!41991) #b00000000000000000000000000000000) (bvslt (index!3091 lt!41991) (size!2161 (_keys!4034 newMap!16))))))

(assert (= (and d!23411 res!45144) b!88101))

(assert (= (and b!88101 res!45145) b!88102))

(assert (=> d!23411 m!93405))

(assert (=> d!23411 m!93699))

(assert (=> d!23411 m!93405))

(declare-fun m!93967 () Bool)

(assert (=> d!23411 m!93967))

(declare-fun m!93969 () Bool)

(assert (=> d!23411 m!93969))

(declare-fun m!93971 () Bool)

(assert (=> b!88101 m!93971))

(declare-fun m!93973 () Bool)

(assert (=> b!88102 m!93973))

(assert (=> bm!8414 d!23411))

(declare-fun d!23413 () Bool)

(assert (=> d!23413 (= (map!1199 (_2!1108 lt!41879)) (getCurrentListMap!431 (_keys!4034 (_2!1108 lt!41879)) (_values!2341 (_2!1108 lt!41879)) (mask!6396 (_2!1108 lt!41879)) (extraKeys!2193 (_2!1108 lt!41879)) (zeroValue!2248 (_2!1108 lt!41879)) (minValue!2248 (_2!1108 lt!41879)) #b00000000000000000000000000000000 (defaultEntry!2358 (_2!1108 lt!41879))))))

(declare-fun bs!3724 () Bool)

(assert (= bs!3724 d!23413))

(declare-fun m!93975 () Bool)

(assert (=> bs!3724 m!93975))

(assert (=> bm!8424 d!23413))

(declare-fun d!23415 () Bool)

(declare-fun res!45150 () Bool)

(declare-fun e!57401 () Bool)

(assert (=> d!23415 (=> res!45150 e!57401)))

(assert (=> d!23415 (= res!45150 (and ((_ is Cons!1508) (toList!738 lt!41605)) (= (_1!1107 (h!2100 (toList!738 lt!41605))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))))

(assert (=> d!23415 (= (containsKey!145 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) e!57401)))

(declare-fun b!88107 () Bool)

(declare-fun e!57402 () Bool)

(assert (=> b!88107 (= e!57401 e!57402)))

(declare-fun res!45151 () Bool)

(assert (=> b!88107 (=> (not res!45151) (not e!57402))))

(assert (=> b!88107 (= res!45151 (and (or (not ((_ is Cons!1508) (toList!738 lt!41605))) (bvsle (_1!1107 (h!2100 (toList!738 lt!41605))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))) ((_ is Cons!1508) (toList!738 lt!41605)) (bvslt (_1!1107 (h!2100 (toList!738 lt!41605))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))))

(declare-fun b!88108 () Bool)

(assert (=> b!88108 (= e!57402 (containsKey!145 (t!5246 (toList!738 lt!41605)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23415 (not res!45150)) b!88107))

(assert (= (and b!88107 res!45151) b!88108))

(assert (=> b!88108 m!93405))

(declare-fun m!93977 () Bool)

(assert (=> b!88108 m!93977))

(assert (=> d!23337 d!23415))

(declare-fun d!23417 () Bool)

(assert (=> d!23417 (= (+!109 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) lt!41870 (zeroValue!2248 newMap!16) lt!41609 #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!41995 () Unit!2582)

(declare-fun choose!523 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2582)

(assert (=> d!23417 (= lt!41995 (choose!523 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) lt!41870 (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) lt!41609 (defaultEntry!2358 newMap!16)))))

(assert (=> d!23417 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23417 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) lt!41870 (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) lt!41609 (defaultEntry!2358 newMap!16)) lt!41995)))

(declare-fun bs!3725 () Bool)

(assert (= bs!3725 d!23417))

(assert (=> bs!3725 m!93603))

(assert (=> bs!3725 m!93603))

(declare-fun m!93979 () Bool)

(assert (=> bs!3725 m!93979))

(assert (=> bs!3725 m!93969))

(declare-fun m!93981 () Bool)

(assert (=> bs!3725 m!93981))

(declare-fun m!93983 () Bool)

(assert (=> bs!3725 m!93983))

(assert (=> b!87953 d!23417))

(declare-fun d!23419 () Bool)

(declare-fun lt!41996 () Bool)

(assert (=> d!23419 (= lt!41996 (select (content!92 (toList!738 lt!41947)) lt!41604))))

(declare-fun e!57404 () Bool)

(assert (=> d!23419 (= lt!41996 e!57404)))

(declare-fun res!45152 () Bool)

(assert (=> d!23419 (=> (not res!45152) (not e!57404))))

(assert (=> d!23419 (= res!45152 ((_ is Cons!1508) (toList!738 lt!41947)))))

(assert (=> d!23419 (= (contains!753 (toList!738 lt!41947) lt!41604) lt!41996)))

(declare-fun b!88109 () Bool)

(declare-fun e!57403 () Bool)

(assert (=> b!88109 (= e!57404 e!57403)))

(declare-fun res!45153 () Bool)

(assert (=> b!88109 (=> res!45153 e!57403)))

(assert (=> b!88109 (= res!45153 (= (h!2100 (toList!738 lt!41947)) lt!41604))))

(declare-fun b!88110 () Bool)

(assert (=> b!88110 (= e!57403 (contains!753 (t!5246 (toList!738 lt!41947)) lt!41604))))

(assert (= (and d!23419 res!45152) b!88109))

(assert (= (and b!88109 (not res!45153)) b!88110))

(declare-fun m!93985 () Bool)

(assert (=> d!23419 m!93985))

(declare-fun m!93987 () Bool)

(assert (=> d!23419 m!93987))

(declare-fun m!93989 () Bool)

(assert (=> b!88110 m!93989))

(assert (=> b!88057 d!23419))

(declare-fun d!23421 () Bool)

(declare-fun res!45154 () Bool)

(declare-fun e!57405 () Bool)

(assert (=> d!23421 (=> (not res!45154) (not e!57405))))

(assert (=> d!23421 (= res!45154 (simpleValid!59 (v!2664 (underlying!295 thiss!992))))))

(assert (=> d!23421 (= (valid!339 (v!2664 (underlying!295 thiss!992))) e!57405)))

(declare-fun b!88111 () Bool)

(declare-fun res!45155 () Bool)

(assert (=> b!88111 (=> (not res!45155) (not e!57405))))

(assert (=> b!88111 (= res!45155 (= (arrayCountValidKeys!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000 (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))) (_size!429 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!88112 () Bool)

(declare-fun res!45156 () Bool)

(assert (=> b!88112 (=> (not res!45156) (not e!57405))))

(assert (=> b!88112 (= res!45156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!88113 () Bool)

(assert (=> b!88113 (= e!57405 (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000 Nil!1508))))

(assert (= (and d!23421 res!45154) b!88111))

(assert (= (and b!88111 res!45155) b!88112))

(assert (= (and b!88112 res!45156) b!88113))

(declare-fun m!93991 () Bool)

(assert (=> d!23421 m!93991))

(declare-fun m!93993 () Bool)

(assert (=> b!88111 m!93993))

(assert (=> b!88112 m!93421))

(declare-fun m!93995 () Bool)

(assert (=> b!88113 m!93995))

(assert (=> d!23361 d!23421))

(declare-fun d!23423 () Bool)

(declare-fun lt!41997 () Bool)

(assert (=> d!23423 (= lt!41997 (select (content!92 (toList!738 lt!41956)) lt!41606))))

(declare-fun e!57407 () Bool)

(assert (=> d!23423 (= lt!41997 e!57407)))

(declare-fun res!45157 () Bool)

(assert (=> d!23423 (=> (not res!45157) (not e!57407))))

(assert (=> d!23423 (= res!45157 ((_ is Cons!1508) (toList!738 lt!41956)))))

(assert (=> d!23423 (= (contains!753 (toList!738 lt!41956) lt!41606) lt!41997)))

(declare-fun b!88114 () Bool)

(declare-fun e!57406 () Bool)

(assert (=> b!88114 (= e!57407 e!57406)))

(declare-fun res!45158 () Bool)

(assert (=> b!88114 (=> res!45158 e!57406)))

(assert (=> b!88114 (= res!45158 (= (h!2100 (toList!738 lt!41956)) lt!41606))))

(declare-fun b!88115 () Bool)

(assert (=> b!88115 (= e!57406 (contains!753 (t!5246 (toList!738 lt!41956)) lt!41606))))

(assert (= (and d!23423 res!45157) b!88114))

(assert (= (and b!88114 (not res!45158)) b!88115))

(declare-fun m!93997 () Bool)

(assert (=> d!23423 m!93997))

(declare-fun m!93999 () Bool)

(assert (=> d!23423 m!93999))

(declare-fun m!94001 () Bool)

(assert (=> b!88115 m!94001))

(assert (=> b!88061 d!23423))

(assert (=> bm!8432 d!23333))

(assert (=> bm!8362 d!23373))

(declare-fun d!23425 () Bool)

(declare-fun e!57409 () Bool)

(assert (=> d!23425 e!57409))

(declare-fun res!45159 () Bool)

(assert (=> d!23425 (=> res!45159 e!57409)))

(declare-fun lt!41998 () Bool)

(assert (=> d!23425 (= res!45159 (not lt!41998))))

(declare-fun lt!41999 () Bool)

(assert (=> d!23425 (= lt!41998 lt!41999)))

(declare-fun lt!42000 () Unit!2582)

(declare-fun e!57408 () Unit!2582)

(assert (=> d!23425 (= lt!42000 e!57408)))

(declare-fun c!14546 () Bool)

(assert (=> d!23425 (= c!14546 lt!41999)))

(assert (=> d!23425 (= lt!41999 (containsKey!145 (toList!738 lt!41935) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23425 (= (contains!750 lt!41935 #b1000000000000000000000000000000000000000000000000000000000000000) lt!41998)))

(declare-fun b!88116 () Bool)

(declare-fun lt!42001 () Unit!2582)

(assert (=> b!88116 (= e!57408 lt!42001)))

(assert (=> b!88116 (= lt!42001 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41935) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88116 (isDefined!94 (getValueByKey!142 (toList!738 lt!41935) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88117 () Bool)

(declare-fun Unit!2597 () Unit!2582)

(assert (=> b!88117 (= e!57408 Unit!2597)))

(declare-fun b!88118 () Bool)

(assert (=> b!88118 (= e!57409 (isDefined!94 (getValueByKey!142 (toList!738 lt!41935) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23425 c!14546) b!88116))

(assert (= (and d!23425 (not c!14546)) b!88117))

(assert (= (and d!23425 (not res!45159)) b!88118))

(declare-fun m!94003 () Bool)

(assert (=> d!23425 m!94003))

(declare-fun m!94005 () Bool)

(assert (=> b!88116 m!94005))

(declare-fun m!94007 () Bool)

(assert (=> b!88116 m!94007))

(assert (=> b!88116 m!94007))

(declare-fun m!94009 () Bool)

(assert (=> b!88116 m!94009))

(assert (=> b!88118 m!94007))

(assert (=> b!88118 m!94007))

(assert (=> b!88118 m!94009))

(assert (=> b!88052 d!23425))

(declare-fun b!88119 () Bool)

(declare-fun e!57415 () Bool)

(declare-fun lt!42009 () ListLongMap!1445)

(assert (=> b!88119 (= e!57415 (= (apply!83 lt!42009 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2248 newMap!16)))))

(declare-fun b!88120 () Bool)

(declare-fun c!14551 () Bool)

(assert (=> b!88120 (= c!14551 (and (not (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57422 () ListLongMap!1445)

(declare-fun e!57421 () ListLongMap!1445)

(assert (=> b!88120 (= e!57422 e!57421)))

(declare-fun b!88121 () Bool)

(declare-fun e!57413 () Bool)

(declare-fun e!57420 () Bool)

(assert (=> b!88121 (= e!57413 e!57420)))

(declare-fun res!45164 () Bool)

(declare-fun call!8452 () Bool)

(assert (=> b!88121 (= res!45164 call!8452)))

(assert (=> b!88121 (=> (not res!45164) (not e!57420))))

(declare-fun b!88122 () Bool)

(declare-fun e!57418 () Bool)

(declare-fun e!57414 () Bool)

(assert (=> b!88122 (= e!57418 e!57414)))

(declare-fun res!45162 () Bool)

(assert (=> b!88122 (=> (not res!45162) (not e!57414))))

(assert (=> b!88122 (= res!45162 (contains!750 lt!42009 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88122 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88123 () Bool)

(assert (=> b!88123 (= e!57414 (= (apply!83 lt!42009 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)) (get!1210 (select (arr!1917 (ite c!14519 (_values!2341 newMap!16) lt!41880)) #b00000000000000000000000000000000) (dynLambda!345 (defaultEntry!2358 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2162 (ite c!14519 (_values!2341 newMap!16) lt!41880))))))

(assert (=> b!88123 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88124 () Bool)

(declare-fun e!57417 () Bool)

(assert (=> b!88124 (= e!57417 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88125 () Bool)

(declare-fun call!8451 () ListLongMap!1445)

(assert (=> b!88125 (= e!57421 call!8451)))

(declare-fun bm!8447 () Bool)

(declare-fun call!8450 () ListLongMap!1445)

(declare-fun c!14548 () Bool)

(declare-fun call!8454 () ListLongMap!1445)

(declare-fun c!14552 () Bool)

(declare-fun call!8453 () ListLongMap!1445)

(assert (=> bm!8447 (= call!8450 (+!109 (ite c!14548 call!8453 (ite c!14552 call!8454 call!8451)) (ite (or c!14548 c!14552) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16)))))))

(declare-fun bm!8448 () Bool)

(declare-fun call!8456 () Bool)

(assert (=> bm!8448 (= call!8456 (contains!750 lt!42009 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88126 () Bool)

(declare-fun res!45168 () Bool)

(declare-fun e!57412 () Bool)

(assert (=> b!88126 (=> (not res!45168) (not e!57412))))

(assert (=> b!88126 (= res!45168 e!57418)))

(declare-fun res!45160 () Bool)

(assert (=> b!88126 (=> res!45160 e!57418)))

(declare-fun e!57416 () Bool)

(assert (=> b!88126 (= res!45160 (not e!57416))))

(declare-fun res!45165 () Bool)

(assert (=> b!88126 (=> (not res!45165) (not e!57416))))

(assert (=> b!88126 (= res!45165 (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88127 () Bool)

(declare-fun e!57410 () Unit!2582)

(declare-fun Unit!2598 () Unit!2582)

(assert (=> b!88127 (= e!57410 Unit!2598)))

(declare-fun bm!8449 () Bool)

(declare-fun call!8455 () ListLongMap!1445)

(assert (=> bm!8449 (= call!8455 call!8450)))

(declare-fun d!23427 () Bool)

(assert (=> d!23427 e!57412))

(declare-fun res!45163 () Bool)

(assert (=> d!23427 (=> (not res!45163) (not e!57412))))

(assert (=> d!23427 (= res!45163 (or (bvsge #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))))

(declare-fun lt!42010 () ListLongMap!1445)

(assert (=> d!23427 (= lt!42009 lt!42010)))

(declare-fun lt!42013 () Unit!2582)

(assert (=> d!23427 (= lt!42013 e!57410)))

(declare-fun c!14549 () Bool)

(assert (=> d!23427 (= c!14549 e!57417)))

(declare-fun res!45166 () Bool)

(assert (=> d!23427 (=> (not res!45166) (not e!57417))))

(assert (=> d!23427 (= res!45166 (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun e!57411 () ListLongMap!1445)

(assert (=> d!23427 (= lt!42010 e!57411)))

(assert (=> d!23427 (= c!14548 (and (not (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23427 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23427 (= (getCurrentListMap!431 (_keys!4034 newMap!16) (ite c!14519 (_values!2341 newMap!16) lt!41880) (mask!6396 newMap!16) (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) lt!42009)))

(declare-fun b!88128 () Bool)

(declare-fun e!57419 () Bool)

(assert (=> b!88128 (= e!57419 (not call!8456))))

(declare-fun b!88129 () Bool)

(assert (=> b!88129 (= e!57413 (not call!8452))))

(declare-fun b!88130 () Bool)

(assert (=> b!88130 (= e!57411 (+!109 call!8450 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16))))))

(declare-fun b!88131 () Bool)

(assert (=> b!88131 (= e!57422 call!8455)))

(declare-fun b!88132 () Bool)

(declare-fun res!45167 () Bool)

(assert (=> b!88132 (=> (not res!45167) (not e!57412))))

(assert (=> b!88132 (= res!45167 e!57413)))

(declare-fun c!14550 () Bool)

(assert (=> b!88132 (= c!14550 (not (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8450 () Bool)

(assert (=> bm!8450 (= call!8454 call!8453)))

(declare-fun bm!8451 () Bool)

(assert (=> bm!8451 (= call!8453 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite c!14519 (_values!2341 newMap!16) lt!41880) (mask!6396 newMap!16) (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun b!88133 () Bool)

(declare-fun lt!42002 () Unit!2582)

(assert (=> b!88133 (= e!57410 lt!42002)))

(declare-fun lt!42021 () ListLongMap!1445)

(assert (=> b!88133 (= lt!42021 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite c!14519 (_values!2341 newMap!16) lt!41880) (mask!6396 newMap!16) (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42020 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42020 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42023 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42023 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42017 () Unit!2582)

(assert (=> b!88133 (= lt!42017 (addStillContains!59 lt!42021 lt!42020 (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) lt!42023))))

(assert (=> b!88133 (contains!750 (+!109 lt!42021 (tuple2!2193 lt!42020 (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)))) lt!42023)))

(declare-fun lt!42018 () Unit!2582)

(assert (=> b!88133 (= lt!42018 lt!42017)))

(declare-fun lt!42016 () ListLongMap!1445)

(assert (=> b!88133 (= lt!42016 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite c!14519 (_values!2341 newMap!16) lt!41880) (mask!6396 newMap!16) (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42012 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42012 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42019 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42019 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42004 () Unit!2582)

(assert (=> b!88133 (= lt!42004 (addApplyDifferent!59 lt!42016 lt!42012 (minValue!2248 newMap!16) lt!42019))))

(assert (=> b!88133 (= (apply!83 (+!109 lt!42016 (tuple2!2193 lt!42012 (minValue!2248 newMap!16))) lt!42019) (apply!83 lt!42016 lt!42019))))

(declare-fun lt!42014 () Unit!2582)

(assert (=> b!88133 (= lt!42014 lt!42004)))

(declare-fun lt!42003 () ListLongMap!1445)

(assert (=> b!88133 (= lt!42003 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite c!14519 (_values!2341 newMap!16) lt!41880) (mask!6396 newMap!16) (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42011 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42011 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42008 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42008 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42007 () Unit!2582)

(assert (=> b!88133 (= lt!42007 (addApplyDifferent!59 lt!42003 lt!42011 (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) lt!42008))))

(assert (=> b!88133 (= (apply!83 (+!109 lt!42003 (tuple2!2193 lt!42011 (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)))) lt!42008) (apply!83 lt!42003 lt!42008))))

(declare-fun lt!42005 () Unit!2582)

(assert (=> b!88133 (= lt!42005 lt!42007)))

(declare-fun lt!42022 () ListLongMap!1445)

(assert (=> b!88133 (= lt!42022 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite c!14519 (_values!2341 newMap!16) lt!41880) (mask!6396 newMap!16) (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16)) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42006 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42006 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42015 () (_ BitVec 64))

(assert (=> b!88133 (= lt!42015 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88133 (= lt!42002 (addApplyDifferent!59 lt!42022 lt!42006 (minValue!2248 newMap!16) lt!42015))))

(assert (=> b!88133 (= (apply!83 (+!109 lt!42022 (tuple2!2193 lt!42006 (minValue!2248 newMap!16))) lt!42015) (apply!83 lt!42022 lt!42015))))

(declare-fun b!88134 () Bool)

(assert (=> b!88134 (= e!57420 (= (apply!83 lt!42009 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!14519 c!14506) lt!41609 (zeroValue!2248 newMap!16))))))

(declare-fun b!88135 () Bool)

(assert (=> b!88135 (= e!57419 e!57415)))

(declare-fun res!45161 () Bool)

(assert (=> b!88135 (= res!45161 call!8456)))

(assert (=> b!88135 (=> (not res!45161) (not e!57415))))

(declare-fun b!88136 () Bool)

(assert (=> b!88136 (= e!57421 call!8455)))

(declare-fun b!88137 () Bool)

(assert (=> b!88137 (= e!57416 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88138 () Bool)

(assert (=> b!88138 (= e!57411 e!57422)))

(assert (=> b!88138 (= c!14552 (and (not (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88139 () Bool)

(assert (=> b!88139 (= e!57412 e!57419)))

(declare-fun c!14547 () Bool)

(assert (=> b!88139 (= c!14547 (not (= (bvand (ite (and c!14519 c!14506) lt!41878 (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8452 () Bool)

(assert (=> bm!8452 (= call!8451 call!8454)))

(declare-fun bm!8453 () Bool)

(assert (=> bm!8453 (= call!8452 (contains!750 lt!42009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23427 c!14548) b!88130))

(assert (= (and d!23427 (not c!14548)) b!88138))

(assert (= (and b!88138 c!14552) b!88131))

(assert (= (and b!88138 (not c!14552)) b!88120))

(assert (= (and b!88120 c!14551) b!88136))

(assert (= (and b!88120 (not c!14551)) b!88125))

(assert (= (or b!88136 b!88125) bm!8452))

(assert (= (or b!88131 bm!8452) bm!8450))

(assert (= (or b!88131 b!88136) bm!8449))

(assert (= (or b!88130 bm!8450) bm!8451))

(assert (= (or b!88130 bm!8449) bm!8447))

(assert (= (and d!23427 res!45166) b!88124))

(assert (= (and d!23427 c!14549) b!88133))

(assert (= (and d!23427 (not c!14549)) b!88127))

(assert (= (and d!23427 res!45163) b!88126))

(assert (= (and b!88126 res!45165) b!88137))

(assert (= (and b!88126 (not res!45160)) b!88122))

(assert (= (and b!88122 res!45162) b!88123))

(assert (= (and b!88126 res!45168) b!88132))

(assert (= (and b!88132 c!14550) b!88121))

(assert (= (and b!88132 (not c!14550)) b!88129))

(assert (= (and b!88121 res!45164) b!88134))

(assert (= (or b!88121 b!88129) bm!8453))

(assert (= (and b!88132 res!45167) b!88139))

(assert (= (and b!88139 c!14547) b!88135))

(assert (= (and b!88139 (not c!14547)) b!88128))

(assert (= (and b!88135 res!45161) b!88119))

(assert (= (or b!88135 b!88128) bm!8448))

(declare-fun b_lambda!3907 () Bool)

(assert (=> (not b_lambda!3907) (not b!88123)))

(declare-fun t!5259 () Bool)

(declare-fun tb!1713 () Bool)

(assert (=> (and b!87608 (= (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) (defaultEntry!2358 newMap!16)) t!5259) tb!1713))

(declare-fun result!2951 () Bool)

(assert (=> tb!1713 (= result!2951 tp_is_empty!2539)))

(assert (=> b!88123 t!5259))

(declare-fun b_and!5305 () Bool)

(assert (= b_and!5301 (and (=> t!5259 result!2951) b_and!5305)))

(declare-fun t!5261 () Bool)

(declare-fun tb!1715 () Bool)

(assert (=> (and b!87620 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 newMap!16)) t!5261) tb!1715))

(declare-fun result!2953 () Bool)

(assert (= result!2953 result!2951))

(assert (=> b!88123 t!5261))

(declare-fun b_and!5307 () Bool)

(assert (= b_and!5303 (and (=> t!5261 result!2953) b_and!5307)))

(declare-fun m!94011 () Bool)

(assert (=> b!88119 m!94011))

(assert (=> b!88137 m!93889))

(assert (=> b!88137 m!93889))

(declare-fun m!94013 () Bool)

(assert (=> b!88137 m!94013))

(declare-fun m!94015 () Bool)

(assert (=> b!88134 m!94015))

(declare-fun m!94017 () Bool)

(assert (=> bm!8448 m!94017))

(declare-fun m!94019 () Bool)

(assert (=> b!88130 m!94019))

(declare-fun m!94021 () Bool)

(assert (=> bm!8451 m!94021))

(assert (=> b!88122 m!93889))

(assert (=> b!88122 m!93889))

(declare-fun m!94023 () Bool)

(assert (=> b!88122 m!94023))

(assert (=> d!23427 m!93969))

(declare-fun m!94025 () Bool)

(assert (=> bm!8453 m!94025))

(declare-fun m!94027 () Bool)

(assert (=> b!88123 m!94027))

(declare-fun m!94029 () Bool)

(assert (=> b!88123 m!94029))

(declare-fun m!94031 () Bool)

(assert (=> b!88123 m!94031))

(assert (=> b!88123 m!94029))

(assert (=> b!88123 m!94027))

(assert (=> b!88123 m!93889))

(declare-fun m!94033 () Bool)

(assert (=> b!88123 m!94033))

(assert (=> b!88123 m!93889))

(declare-fun m!94035 () Bool)

(assert (=> bm!8447 m!94035))

(assert (=> b!88124 m!93889))

(assert (=> b!88124 m!93889))

(assert (=> b!88124 m!94013))

(declare-fun m!94037 () Bool)

(assert (=> b!88133 m!94037))

(declare-fun m!94039 () Bool)

(assert (=> b!88133 m!94039))

(declare-fun m!94041 () Bool)

(assert (=> b!88133 m!94041))

(declare-fun m!94043 () Bool)

(assert (=> b!88133 m!94043))

(declare-fun m!94045 () Bool)

(assert (=> b!88133 m!94045))

(declare-fun m!94047 () Bool)

(assert (=> b!88133 m!94047))

(declare-fun m!94049 () Bool)

(assert (=> b!88133 m!94049))

(declare-fun m!94051 () Bool)

(assert (=> b!88133 m!94051))

(declare-fun m!94053 () Bool)

(assert (=> b!88133 m!94053))

(declare-fun m!94055 () Bool)

(assert (=> b!88133 m!94055))

(declare-fun m!94057 () Bool)

(assert (=> b!88133 m!94057))

(assert (=> b!88133 m!94037))

(assert (=> b!88133 m!94045))

(assert (=> b!88133 m!93889))

(assert (=> b!88133 m!94021))

(declare-fun m!94059 () Bool)

(assert (=> b!88133 m!94059))

(assert (=> b!88133 m!94057))

(declare-fun m!94061 () Bool)

(assert (=> b!88133 m!94061))

(assert (=> b!88133 m!94041))

(declare-fun m!94063 () Bool)

(assert (=> b!88133 m!94063))

(declare-fun m!94065 () Bool)

(assert (=> b!88133 m!94065))

(assert (=> bm!8429 d!23427))

(assert (=> d!23335 d!23383))

(declare-fun d!23429 () Bool)

(declare-fun lt!42024 () Bool)

(assert (=> d!23429 (= lt!42024 (select (content!92 (toList!738 lt!41943)) lt!41606))))

(declare-fun e!57424 () Bool)

(assert (=> d!23429 (= lt!42024 e!57424)))

(declare-fun res!45169 () Bool)

(assert (=> d!23429 (=> (not res!45169) (not e!57424))))

(assert (=> d!23429 (= res!45169 ((_ is Cons!1508) (toList!738 lt!41943)))))

(assert (=> d!23429 (= (contains!753 (toList!738 lt!41943) lt!41606) lt!42024)))

(declare-fun b!88140 () Bool)

(declare-fun e!57423 () Bool)

(assert (=> b!88140 (= e!57424 e!57423)))

(declare-fun res!45170 () Bool)

(assert (=> b!88140 (=> res!45170 e!57423)))

(assert (=> b!88140 (= res!45170 (= (h!2100 (toList!738 lt!41943)) lt!41606))))

(declare-fun b!88141 () Bool)

(assert (=> b!88141 (= e!57423 (contains!753 (t!5246 (toList!738 lt!41943)) lt!41606))))

(assert (= (and d!23429 res!45169) b!88140))

(assert (= (and b!88140 (not res!45170)) b!88141))

(declare-fun m!94067 () Bool)

(assert (=> d!23429 m!94067))

(declare-fun m!94069 () Bool)

(assert (=> d!23429 m!94069))

(declare-fun m!94071 () Bool)

(assert (=> b!88141 m!94071))

(assert (=> b!88055 d!23429))

(declare-fun b!88154 () Bool)

(declare-fun e!57433 () SeekEntryResult!238)

(declare-fun lt!42033 () SeekEntryResult!238)

(assert (=> b!88154 (= e!57433 (Found!238 (index!3092 lt!42033)))))

(declare-fun e!57431 () SeekEntryResult!238)

(declare-fun b!88155 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4025 (_ BitVec 32)) SeekEntryResult!238)

(assert (=> b!88155 (= e!57431 (seekKeyOrZeroReturnVacant!0 (x!12135 lt!42033) (index!3092 lt!42033) (index!3092 lt!42033) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(declare-fun b!88156 () Bool)

(declare-fun e!57432 () SeekEntryResult!238)

(assert (=> b!88156 (= e!57432 Undefined!238)))

(declare-fun d!23431 () Bool)

(declare-fun lt!42032 () SeekEntryResult!238)

(assert (=> d!23431 (and (or ((_ is Undefined!238) lt!42032) (not ((_ is Found!238) lt!42032)) (and (bvsge (index!3091 lt!42032) #b00000000000000000000000000000000) (bvslt (index!3091 lt!42032) (size!2161 (_keys!4034 newMap!16))))) (or ((_ is Undefined!238) lt!42032) ((_ is Found!238) lt!42032) (not ((_ is MissingZero!238) lt!42032)) (and (bvsge (index!3090 lt!42032) #b00000000000000000000000000000000) (bvslt (index!3090 lt!42032) (size!2161 (_keys!4034 newMap!16))))) (or ((_ is Undefined!238) lt!42032) ((_ is Found!238) lt!42032) ((_ is MissingZero!238) lt!42032) (not ((_ is MissingVacant!238) lt!42032)) (and (bvsge (index!3093 lt!42032) #b00000000000000000000000000000000) (bvslt (index!3093 lt!42032) (size!2161 (_keys!4034 newMap!16))))) (or ((_ is Undefined!238) lt!42032) (ite ((_ is Found!238) lt!42032) (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!42032)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (ite ((_ is MissingZero!238) lt!42032) (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3090 lt!42032)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!238) lt!42032) (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3093 lt!42032)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23431 (= lt!42032 e!57432)))

(declare-fun c!14561 () Bool)

(assert (=> d!23431 (= c!14561 (and ((_ is Intermediate!238) lt!42033) (undefined!1050 lt!42033)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4025 (_ BitVec 32)) SeekEntryResult!238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!23431 (= lt!42033 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (mask!6396 newMap!16)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(assert (=> d!23431 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23431 (= (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)) lt!42032)))

(declare-fun b!88157 () Bool)

(declare-fun c!14559 () Bool)

(declare-fun lt!42031 () (_ BitVec 64))

(assert (=> b!88157 (= c!14559 (= lt!42031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88157 (= e!57433 e!57431)))

(declare-fun b!88158 () Bool)

(assert (=> b!88158 (= e!57431 (MissingZero!238 (index!3092 lt!42033)))))

(declare-fun b!88159 () Bool)

(assert (=> b!88159 (= e!57432 e!57433)))

(assert (=> b!88159 (= lt!42031 (select (arr!1916 (_keys!4034 newMap!16)) (index!3092 lt!42033)))))

(declare-fun c!14560 () Bool)

(assert (=> b!88159 (= c!14560 (= lt!42031 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23431 c!14561) b!88156))

(assert (= (and d!23431 (not c!14561)) b!88159))

(assert (= (and b!88159 c!14560) b!88154))

(assert (= (and b!88159 (not c!14560)) b!88157))

(assert (= (and b!88157 c!14559) b!88158))

(assert (= (and b!88157 (not c!14559)) b!88155))

(assert (=> b!88155 m!93405))

(declare-fun m!94073 () Bool)

(assert (=> b!88155 m!94073))

(assert (=> d!23431 m!93405))

(declare-fun m!94075 () Bool)

(assert (=> d!23431 m!94075))

(declare-fun m!94077 () Bool)

(assert (=> d!23431 m!94077))

(declare-fun m!94079 () Bool)

(assert (=> d!23431 m!94079))

(assert (=> d!23431 m!94075))

(assert (=> d!23431 m!93405))

(declare-fun m!94081 () Bool)

(assert (=> d!23431 m!94081))

(declare-fun m!94083 () Bool)

(assert (=> d!23431 m!94083))

(assert (=> d!23431 m!93969))

(declare-fun m!94085 () Bool)

(assert (=> b!88159 m!94085))

(assert (=> bm!8422 d!23431))

(declare-fun d!23433 () Bool)

(declare-fun get!1214 (Option!148) V!3033)

(assert (=> d!23433 (= (apply!83 lt!41774 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1214 (getValueByKey!142 (toList!738 lt!41774) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3726 () Bool)

(assert (= bs!3726 d!23433))

(declare-fun m!94087 () Bool)

(assert (=> bs!3726 m!94087))

(assert (=> bs!3726 m!94087))

(declare-fun m!94089 () Bool)

(assert (=> bs!3726 m!94089))

(assert (=> b!87815 d!23433))

(declare-fun d!23435 () Bool)

(declare-fun e!57434 () Bool)

(assert (=> d!23435 e!57434))

(declare-fun res!45171 () Bool)

(assert (=> d!23435 (=> (not res!45171) (not e!57434))))

(declare-fun lt!42037 () ListLongMap!1445)

(assert (=> d!23435 (= res!45171 (contains!750 lt!42037 (_1!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(declare-fun lt!42035 () List!1512)

(assert (=> d!23435 (= lt!42037 (ListLongMap!1446 lt!42035))))

(declare-fun lt!42036 () Unit!2582)

(declare-fun lt!42034 () Unit!2582)

(assert (=> d!23435 (= lt!42036 lt!42034)))

(assert (=> d!23435 (= (getValueByKey!142 lt!42035 (_1!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))) (Some!147 (_2!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(assert (=> d!23435 (= lt!42034 (lemmaContainsTupThenGetReturnValue!59 lt!42035 (_1!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (_2!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(assert (=> d!23435 (= lt!42035 (insertStrictlySorted!62 (toList!738 e!57282) (_1!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (_2!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(assert (=> d!23435 (= (+!109 e!57282 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) lt!42037)))

(declare-fun b!88160 () Bool)

(declare-fun res!45172 () Bool)

(assert (=> b!88160 (=> (not res!45172) (not e!57434))))

(assert (=> b!88160 (= res!45172 (= (getValueByKey!142 (toList!738 lt!42037) (_1!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))) (Some!147 (_2!1107 (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))))

(declare-fun b!88161 () Bool)

(assert (=> b!88161 (= e!57434 (contains!753 (toList!738 lt!42037) (ite c!14519 (ite c!14506 (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (= (and d!23435 res!45171) b!88160))

(assert (= (and b!88160 res!45172) b!88161))

(declare-fun m!94091 () Bool)

(assert (=> d!23435 m!94091))

(declare-fun m!94093 () Bool)

(assert (=> d!23435 m!94093))

(declare-fun m!94095 () Bool)

(assert (=> d!23435 m!94095))

(declare-fun m!94097 () Bool)

(assert (=> d!23435 m!94097))

(declare-fun m!94099 () Bool)

(assert (=> b!88160 m!94099))

(declare-fun m!94101 () Bool)

(assert (=> b!88161 m!94101))

(assert (=> bm!8435 d!23435))

(declare-fun d!23437 () Bool)

(declare-fun e!57436 () Bool)

(assert (=> d!23437 e!57436))

(declare-fun res!45173 () Bool)

(assert (=> d!23437 (=> res!45173 e!57436)))

(declare-fun lt!42038 () Bool)

(assert (=> d!23437 (= res!45173 (not lt!42038))))

(declare-fun lt!42039 () Bool)

(assert (=> d!23437 (= lt!42038 lt!42039)))

(declare-fun lt!42040 () Unit!2582)

(declare-fun e!57435 () Unit!2582)

(assert (=> d!23437 (= lt!42040 e!57435)))

(declare-fun c!14562 () Bool)

(assert (=> d!23437 (= c!14562 lt!42039)))

(assert (=> d!23437 (= lt!42039 (containsKey!145 (toList!738 lt!41956) (_1!1107 lt!41606)))))

(assert (=> d!23437 (= (contains!750 lt!41956 (_1!1107 lt!41606)) lt!42038)))

(declare-fun b!88162 () Bool)

(declare-fun lt!42041 () Unit!2582)

(assert (=> b!88162 (= e!57435 lt!42041)))

(assert (=> b!88162 (= lt!42041 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41956) (_1!1107 lt!41606)))))

(assert (=> b!88162 (isDefined!94 (getValueByKey!142 (toList!738 lt!41956) (_1!1107 lt!41606)))))

(declare-fun b!88163 () Bool)

(declare-fun Unit!2599 () Unit!2582)

(assert (=> b!88163 (= e!57435 Unit!2599)))

(declare-fun b!88164 () Bool)

(assert (=> b!88164 (= e!57436 (isDefined!94 (getValueByKey!142 (toList!738 lt!41956) (_1!1107 lt!41606))))))

(assert (= (and d!23437 c!14562) b!88162))

(assert (= (and d!23437 (not c!14562)) b!88163))

(assert (= (and d!23437 (not res!45173)) b!88164))

(declare-fun m!94103 () Bool)

(assert (=> d!23437 m!94103))

(declare-fun m!94105 () Bool)

(assert (=> b!88162 m!94105))

(assert (=> b!88162 m!93869))

(assert (=> b!88162 m!93869))

(declare-fun m!94107 () Bool)

(assert (=> b!88162 m!94107))

(assert (=> b!88164 m!93869))

(assert (=> b!88164 m!93869))

(assert (=> b!88164 m!94107))

(assert (=> d!23385 d!23437))

(declare-fun b!88176 () Bool)

(declare-fun e!57442 () Option!148)

(assert (=> b!88176 (= e!57442 None!146)))

(declare-fun b!88175 () Bool)

(assert (=> b!88175 (= e!57442 (getValueByKey!142 (t!5246 lt!41954) (_1!1107 lt!41606)))))

(declare-fun b!88174 () Bool)

(declare-fun e!57441 () Option!148)

(assert (=> b!88174 (= e!57441 e!57442)))

(declare-fun c!14568 () Bool)

(assert (=> b!88174 (= c!14568 (and ((_ is Cons!1508) lt!41954) (not (= (_1!1107 (h!2100 lt!41954)) (_1!1107 lt!41606)))))))

(declare-fun b!88173 () Bool)

(assert (=> b!88173 (= e!57441 (Some!147 (_2!1107 (h!2100 lt!41954))))))

(declare-fun d!23439 () Bool)

(declare-fun c!14567 () Bool)

(assert (=> d!23439 (= c!14567 (and ((_ is Cons!1508) lt!41954) (= (_1!1107 (h!2100 lt!41954)) (_1!1107 lt!41606))))))

(assert (=> d!23439 (= (getValueByKey!142 lt!41954 (_1!1107 lt!41606)) e!57441)))

(assert (= (and d!23439 c!14567) b!88173))

(assert (= (and d!23439 (not c!14567)) b!88174))

(assert (= (and b!88174 c!14568) b!88175))

(assert (= (and b!88174 (not c!14568)) b!88176))

(declare-fun m!94109 () Bool)

(assert (=> b!88175 m!94109))

(assert (=> d!23385 d!23439))

(declare-fun d!23441 () Bool)

(assert (=> d!23441 (= (getValueByKey!142 lt!41954 (_1!1107 lt!41606)) (Some!147 (_2!1107 lt!41606)))))

(declare-fun lt!42044 () Unit!2582)

(declare-fun choose!524 (List!1512 (_ BitVec 64) V!3033) Unit!2582)

(assert (=> d!23441 (= lt!42044 (choose!524 lt!41954 (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(declare-fun e!57445 () Bool)

(assert (=> d!23441 e!57445))

(declare-fun res!45178 () Bool)

(assert (=> d!23441 (=> (not res!45178) (not e!57445))))

(declare-fun isStrictlySorted!286 (List!1512) Bool)

(assert (=> d!23441 (= res!45178 (isStrictlySorted!286 lt!41954))))

(assert (=> d!23441 (= (lemmaContainsTupThenGetReturnValue!59 lt!41954 (_1!1107 lt!41606) (_2!1107 lt!41606)) lt!42044)))

(declare-fun b!88181 () Bool)

(declare-fun res!45179 () Bool)

(assert (=> b!88181 (=> (not res!45179) (not e!57445))))

(assert (=> b!88181 (= res!45179 (containsKey!145 lt!41954 (_1!1107 lt!41606)))))

(declare-fun b!88182 () Bool)

(assert (=> b!88182 (= e!57445 (contains!753 lt!41954 (tuple2!2193 (_1!1107 lt!41606) (_2!1107 lt!41606))))))

(assert (= (and d!23441 res!45178) b!88181))

(assert (= (and b!88181 res!45179) b!88182))

(assert (=> d!23441 m!93863))

(declare-fun m!94111 () Bool)

(assert (=> d!23441 m!94111))

(declare-fun m!94113 () Bool)

(assert (=> d!23441 m!94113))

(declare-fun m!94115 () Bool)

(assert (=> b!88181 m!94115))

(declare-fun m!94117 () Bool)

(assert (=> b!88182 m!94117))

(assert (=> d!23385 d!23441))

(declare-fun b!88203 () Bool)

(declare-fun e!57457 () List!1512)

(declare-fun call!8464 () List!1512)

(assert (=> b!88203 (= e!57457 call!8464)))

(declare-fun b!88204 () Bool)

(declare-fun res!45184 () Bool)

(declare-fun e!57459 () Bool)

(assert (=> b!88204 (=> (not res!45184) (not e!57459))))

(declare-fun lt!42047 () List!1512)

(assert (=> b!88204 (= res!45184 (containsKey!145 lt!42047 (_1!1107 lt!41606)))))

(declare-fun b!88205 () Bool)

(assert (=> b!88205 (= e!57459 (contains!753 lt!42047 (tuple2!2193 (_1!1107 lt!41606) (_2!1107 lt!41606))))))

(declare-fun bm!8460 () Bool)

(declare-fun call!8463 () List!1512)

(declare-fun c!14580 () Bool)

(declare-fun e!57458 () List!1512)

(declare-fun $colon$colon!72 (List!1512 tuple2!2192) List!1512)

(assert (=> bm!8460 (= call!8463 ($colon$colon!72 e!57458 (ite c!14580 (h!2100 (toList!738 lt!41614)) (tuple2!2193 (_1!1107 lt!41606) (_2!1107 lt!41606)))))))

(declare-fun c!14577 () Bool)

(assert (=> bm!8460 (= c!14577 c!14580)))

(declare-fun b!88206 () Bool)

(declare-fun c!14579 () Bool)

(declare-fun c!14578 () Bool)

(assert (=> b!88206 (= e!57458 (ite c!14578 (t!5246 (toList!738 lt!41614)) (ite c!14579 (Cons!1508 (h!2100 (toList!738 lt!41614)) (t!5246 (toList!738 lt!41614))) Nil!1509)))))

(declare-fun b!88207 () Bool)

(assert (=> b!88207 (= e!57458 (insertStrictlySorted!62 (t!5246 (toList!738 lt!41614)) (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(declare-fun b!88208 () Bool)

(declare-fun e!57460 () List!1512)

(declare-fun e!57456 () List!1512)

(assert (=> b!88208 (= e!57460 e!57456)))

(assert (=> b!88208 (= c!14578 (and ((_ is Cons!1508) (toList!738 lt!41614)) (= (_1!1107 (h!2100 (toList!738 lt!41614))) (_1!1107 lt!41606))))))

(declare-fun b!88209 () Bool)

(declare-fun call!8465 () List!1512)

(assert (=> b!88209 (= e!57456 call!8465)))

(declare-fun bm!8462 () Bool)

(assert (=> bm!8462 (= call!8465 call!8463)))

(declare-fun b!88210 () Bool)

(assert (=> b!88210 (= c!14579 (and ((_ is Cons!1508) (toList!738 lt!41614)) (bvsgt (_1!1107 (h!2100 (toList!738 lt!41614))) (_1!1107 lt!41606))))))

(assert (=> b!88210 (= e!57456 e!57457)))

(declare-fun b!88211 () Bool)

(assert (=> b!88211 (= e!57460 call!8463)))

(declare-fun b!88212 () Bool)

(assert (=> b!88212 (= e!57457 call!8464)))

(declare-fun d!23443 () Bool)

(assert (=> d!23443 e!57459))

(declare-fun res!45185 () Bool)

(assert (=> d!23443 (=> (not res!45185) (not e!57459))))

(assert (=> d!23443 (= res!45185 (isStrictlySorted!286 lt!42047))))

(assert (=> d!23443 (= lt!42047 e!57460)))

(assert (=> d!23443 (= c!14580 (and ((_ is Cons!1508) (toList!738 lt!41614)) (bvslt (_1!1107 (h!2100 (toList!738 lt!41614))) (_1!1107 lt!41606))))))

(assert (=> d!23443 (isStrictlySorted!286 (toList!738 lt!41614))))

(assert (=> d!23443 (= (insertStrictlySorted!62 (toList!738 lt!41614) (_1!1107 lt!41606) (_2!1107 lt!41606)) lt!42047)))

(declare-fun bm!8461 () Bool)

(assert (=> bm!8461 (= call!8464 call!8465)))

(assert (= (and d!23443 c!14580) b!88211))

(assert (= (and d!23443 (not c!14580)) b!88208))

(assert (= (and b!88208 c!14578) b!88209))

(assert (= (and b!88208 (not c!14578)) b!88210))

(assert (= (and b!88210 c!14579) b!88203))

(assert (= (and b!88210 (not c!14579)) b!88212))

(assert (= (or b!88203 b!88212) bm!8461))

(assert (= (or b!88209 bm!8461) bm!8462))

(assert (= (or b!88211 bm!8462) bm!8460))

(assert (= (and bm!8460 c!14577) b!88207))

(assert (= (and bm!8460 (not c!14577)) b!88206))

(assert (= (and d!23443 res!45185) b!88204))

(assert (= (and b!88204 res!45184) b!88205))

(declare-fun m!94119 () Bool)

(assert (=> b!88204 m!94119))

(declare-fun m!94121 () Bool)

(assert (=> d!23443 m!94121))

(declare-fun m!94123 () Bool)

(assert (=> d!23443 m!94123))

(declare-fun m!94125 () Bool)

(assert (=> b!88205 m!94125))

(declare-fun m!94127 () Bool)

(assert (=> b!88207 m!94127))

(declare-fun m!94129 () Bool)

(assert (=> bm!8460 m!94129))

(assert (=> d!23385 d!23443))

(declare-fun d!23445 () Bool)

(assert (=> d!23445 (= (apply!83 lt!41935 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1214 (getValueByKey!142 (toList!738 lt!41935) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3727 () Bool)

(assert (= bs!3727 d!23445))

(assert (=> bs!3727 m!93607))

(declare-fun m!94131 () Bool)

(assert (=> bs!3727 m!94131))

(assert (=> bs!3727 m!94131))

(declare-fun m!94133 () Bool)

(assert (=> bs!3727 m!94133))

(assert (=> b!88047 d!23445))

(declare-fun d!23447 () Bool)

(declare-fun c!14581 () Bool)

(assert (=> d!23447 (= c!14581 ((_ is ValueCellFull!926) (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!57461 () V!3033)

(assert (=> d!23447 (= (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57461)))

(declare-fun b!88213 () Bool)

(assert (=> b!88213 (= e!57461 (get!1212 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88214 () Bool)

(assert (=> b!88214 (= e!57461 (get!1213 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23447 c!14581) b!88213))

(assert (= (and d!23447 (not c!14581)) b!88214))

(assert (=> b!88213 m!93621))

(assert (=> b!88213 m!93453))

(declare-fun m!94135 () Bool)

(assert (=> b!88213 m!94135))

(assert (=> b!88214 m!93621))

(assert (=> b!88214 m!93453))

(declare-fun m!94137 () Bool)

(assert (=> b!88214 m!94137))

(assert (=> b!88047 d!23447))

(declare-fun b!88218 () Bool)

(declare-fun e!57463 () Option!148)

(assert (=> b!88218 (= e!57463 None!146)))

(declare-fun b!88217 () Bool)

(assert (=> b!88217 (= e!57463 (getValueByKey!142 (t!5246 (toList!738 lt!41918)) (_1!1107 lt!41611)))))

(declare-fun b!88216 () Bool)

(declare-fun e!57462 () Option!148)

(assert (=> b!88216 (= e!57462 e!57463)))

(declare-fun c!14583 () Bool)

(assert (=> b!88216 (= c!14583 (and ((_ is Cons!1508) (toList!738 lt!41918)) (not (= (_1!1107 (h!2100 (toList!738 lt!41918))) (_1!1107 lt!41611)))))))

(declare-fun b!88215 () Bool)

(assert (=> b!88215 (= e!57462 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41918)))))))

(declare-fun d!23449 () Bool)

(declare-fun c!14582 () Bool)

(assert (=> d!23449 (= c!14582 (and ((_ is Cons!1508) (toList!738 lt!41918)) (= (_1!1107 (h!2100 (toList!738 lt!41918))) (_1!1107 lt!41611))))))

(assert (=> d!23449 (= (getValueByKey!142 (toList!738 lt!41918) (_1!1107 lt!41611)) e!57462)))

(assert (= (and d!23449 c!14582) b!88215))

(assert (= (and d!23449 (not c!14582)) b!88216))

(assert (= (and b!88216 c!14583) b!88217))

(assert (= (and b!88216 (not c!14583)) b!88218))

(declare-fun m!94139 () Bool)

(assert (=> b!88217 m!94139))

(assert (=> b!88016 d!23449))

(declare-fun d!23451 () Bool)

(declare-fun e!57464 () Bool)

(assert (=> d!23451 e!57464))

(declare-fun res!45186 () Bool)

(assert (=> d!23451 (=> (not res!45186) (not e!57464))))

(declare-fun lt!42051 () ListLongMap!1445)

(assert (=> d!23451 (= res!45186 (contains!750 lt!42051 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun lt!42049 () List!1512)

(assert (=> d!23451 (= lt!42051 (ListLongMap!1446 lt!42049))))

(declare-fun lt!42050 () Unit!2582)

(declare-fun lt!42048 () Unit!2582)

(assert (=> d!23451 (= lt!42050 lt!42048)))

(assert (=> d!23451 (= (getValueByKey!142 lt!42049 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23451 (= lt!42048 (lemmaContainsTupThenGetReturnValue!59 lt!42049 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23451 (= lt!42049 (insertStrictlySorted!62 (toList!738 (+!109 lt!41600 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23451 (= (+!109 (+!109 lt!41600 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) lt!42051)))

(declare-fun b!88219 () Bool)

(declare-fun res!45187 () Bool)

(assert (=> b!88219 (=> (not res!45187) (not e!57464))))

(assert (=> b!88219 (= res!45187 (= (getValueByKey!142 (toList!738 lt!42051) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(declare-fun b!88220 () Bool)

(assert (=> b!88220 (= e!57464 (contains!753 (toList!738 lt!42051) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(assert (= (and d!23451 res!45186) b!88219))

(assert (= (and b!88219 res!45187) b!88220))

(declare-fun m!94141 () Bool)

(assert (=> d!23451 m!94141))

(declare-fun m!94143 () Bool)

(assert (=> d!23451 m!94143))

(declare-fun m!94145 () Bool)

(assert (=> d!23451 m!94145))

(declare-fun m!94147 () Bool)

(assert (=> d!23451 m!94147))

(declare-fun m!94149 () Bool)

(assert (=> b!88219 m!94149))

(declare-fun m!94151 () Bool)

(assert (=> b!88220 m!94151))

(assert (=> d!23379 d!23451))

(declare-fun d!23453 () Bool)

(declare-fun e!57465 () Bool)

(assert (=> d!23453 e!57465))

(declare-fun res!45188 () Bool)

(assert (=> d!23453 (=> (not res!45188) (not e!57465))))

(declare-fun lt!42055 () ListLongMap!1445)

(assert (=> d!23453 (= res!45188 (contains!750 lt!42055 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!42053 () List!1512)

(assert (=> d!23453 (= lt!42055 (ListLongMap!1446 lt!42053))))

(declare-fun lt!42054 () Unit!2582)

(declare-fun lt!42052 () Unit!2582)

(assert (=> d!23453 (= lt!42054 lt!42052)))

(assert (=> d!23453 (= (getValueByKey!142 lt!42053 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23453 (= lt!42052 (lemmaContainsTupThenGetReturnValue!59 lt!42053 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23453 (= lt!42053 (insertStrictlySorted!62 (toList!738 lt!41600) (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23453 (= (+!109 lt!41600 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!42055)))

(declare-fun b!88221 () Bool)

(declare-fun res!45189 () Bool)

(assert (=> b!88221 (=> (not res!45189) (not e!57465))))

(assert (=> b!88221 (= res!45189 (= (getValueByKey!142 (toList!738 lt!42055) (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88222 () Bool)

(assert (=> b!88222 (= e!57465 (contains!753 (toList!738 lt!42055) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23453 res!45188) b!88221))

(assert (= (and b!88221 res!45189) b!88222))

(declare-fun m!94153 () Bool)

(assert (=> d!23453 m!94153))

(declare-fun m!94155 () Bool)

(assert (=> d!23453 m!94155))

(declare-fun m!94157 () Bool)

(assert (=> d!23453 m!94157))

(declare-fun m!94159 () Bool)

(assert (=> d!23453 m!94159))

(declare-fun m!94161 () Bool)

(assert (=> b!88221 m!94161))

(declare-fun m!94163 () Bool)

(assert (=> b!88222 m!94163))

(assert (=> d!23379 d!23453))

(declare-fun d!23455 () Bool)

(declare-fun e!57466 () Bool)

(assert (=> d!23455 e!57466))

(declare-fun res!45190 () Bool)

(assert (=> d!23455 (=> (not res!45190) (not e!57466))))

(declare-fun lt!42059 () ListLongMap!1445)

(assert (=> d!23455 (= res!45190 (contains!750 lt!42059 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun lt!42057 () List!1512)

(assert (=> d!23455 (= lt!42059 (ListLongMap!1446 lt!42057))))

(declare-fun lt!42058 () Unit!2582)

(declare-fun lt!42056 () Unit!2582)

(assert (=> d!23455 (= lt!42058 lt!42056)))

(assert (=> d!23455 (= (getValueByKey!142 lt!42057 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23455 (= lt!42056 (lemmaContainsTupThenGetReturnValue!59 lt!42057 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23455 (= lt!42057 (insertStrictlySorted!62 (toList!738 lt!41600) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23455 (= (+!109 lt!41600 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) lt!42059)))

(declare-fun b!88223 () Bool)

(declare-fun res!45191 () Bool)

(assert (=> b!88223 (=> (not res!45191) (not e!57466))))

(assert (=> b!88223 (= res!45191 (= (getValueByKey!142 (toList!738 lt!42059) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(declare-fun b!88224 () Bool)

(assert (=> b!88224 (= e!57466 (contains!753 (toList!738 lt!42059) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(assert (= (and d!23455 res!45190) b!88223))

(assert (= (and b!88223 res!45191) b!88224))

(declare-fun m!94165 () Bool)

(assert (=> d!23455 m!94165))

(declare-fun m!94167 () Bool)

(assert (=> d!23455 m!94167))

(declare-fun m!94169 () Bool)

(assert (=> d!23455 m!94169))

(declare-fun m!94171 () Bool)

(assert (=> d!23455 m!94171))

(declare-fun m!94173 () Bool)

(assert (=> b!88223 m!94173))

(declare-fun m!94175 () Bool)

(assert (=> b!88224 m!94175))

(assert (=> d!23379 d!23455))

(declare-fun d!23457 () Bool)

(declare-fun e!57467 () Bool)

(assert (=> d!23457 e!57467))

(declare-fun res!45192 () Bool)

(assert (=> d!23457 (=> (not res!45192) (not e!57467))))

(declare-fun lt!42063 () ListLongMap!1445)

(assert (=> d!23457 (= res!45192 (contains!750 lt!42063 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!42061 () List!1512)

(assert (=> d!23457 (= lt!42063 (ListLongMap!1446 lt!42061))))

(declare-fun lt!42062 () Unit!2582)

(declare-fun lt!42060 () Unit!2582)

(assert (=> d!23457 (= lt!42062 lt!42060)))

(assert (=> d!23457 (= (getValueByKey!142 lt!42061 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23457 (= lt!42060 (lemmaContainsTupThenGetReturnValue!59 lt!42061 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23457 (= lt!42061 (insertStrictlySorted!62 (toList!738 (+!109 lt!41600 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23457 (= (+!109 (+!109 lt!41600 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!42063)))

(declare-fun b!88225 () Bool)

(declare-fun res!45193 () Bool)

(assert (=> b!88225 (=> (not res!45193) (not e!57467))))

(assert (=> b!88225 (= res!45193 (= (getValueByKey!142 (toList!738 lt!42063) (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88226 () Bool)

(assert (=> b!88226 (= e!57467 (contains!753 (toList!738 lt!42063) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23457 res!45192) b!88225))

(assert (= (and b!88225 res!45193) b!88226))

(declare-fun m!94177 () Bool)

(assert (=> d!23457 m!94177))

(declare-fun m!94179 () Bool)

(assert (=> d!23457 m!94179))

(declare-fun m!94181 () Bool)

(assert (=> d!23457 m!94181))

(declare-fun m!94183 () Bool)

(assert (=> d!23457 m!94183))

(declare-fun m!94185 () Bool)

(assert (=> b!88225 m!94185))

(declare-fun m!94187 () Bool)

(assert (=> b!88226 m!94187))

(assert (=> d!23379 d!23457))

(declare-fun d!23459 () Bool)

(assert (=> d!23459 (= (+!109 (+!109 lt!41600 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (+!109 (+!109 lt!41600 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(assert (=> d!23459 true))

(declare-fun _$28!147 () Unit!2582)

(assert (=> d!23459 (= (choose!521 lt!41600 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))) _$28!147)))

(declare-fun bs!3728 () Bool)

(assert (= bs!3728 d!23459))

(assert (=> bs!3728 m!93839))

(assert (=> bs!3728 m!93839))

(assert (=> bs!3728 m!93847))

(assert (=> bs!3728 m!93841))

(assert (=> bs!3728 m!93841))

(assert (=> bs!3728 m!93843))

(assert (=> d!23379 d!23459))

(declare-fun d!23461 () Bool)

(declare-fun e!57469 () Bool)

(assert (=> d!23461 e!57469))

(declare-fun res!45194 () Bool)

(assert (=> d!23461 (=> res!45194 e!57469)))

(declare-fun lt!42064 () Bool)

(assert (=> d!23461 (= res!45194 (not lt!42064))))

(declare-fun lt!42065 () Bool)

(assert (=> d!23461 (= lt!42064 lt!42065)))

(declare-fun lt!42066 () Unit!2582)

(declare-fun e!57468 () Unit!2582)

(assert (=> d!23461 (= lt!42066 e!57468)))

(declare-fun c!14584 () Bool)

(assert (=> d!23461 (= c!14584 lt!42065)))

(assert (=> d!23461 (= lt!42065 (containsKey!145 (toList!738 call!8439) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23461 (= (contains!750 call!8439 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) lt!42064)))

(declare-fun b!88227 () Bool)

(declare-fun lt!42067 () Unit!2582)

(assert (=> b!88227 (= e!57468 lt!42067)))

(assert (=> b!88227 (= lt!42067 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 call!8439) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!88227 (isDefined!94 (getValueByKey!142 (toList!738 call!8439) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!88228 () Bool)

(declare-fun Unit!2600 () Unit!2582)

(assert (=> b!88228 (= e!57468 Unit!2600)))

(declare-fun b!88229 () Bool)

(assert (=> b!88229 (= e!57469 (isDefined!94 (getValueByKey!142 (toList!738 call!8439) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))))

(assert (= (and d!23461 c!14584) b!88227))

(assert (= (and d!23461 (not c!14584)) b!88228))

(assert (= (and d!23461 (not res!45194)) b!88229))

(assert (=> d!23461 m!93405))

(declare-fun m!94189 () Bool)

(assert (=> d!23461 m!94189))

(assert (=> b!88227 m!93405))

(declare-fun m!94191 () Bool)

(assert (=> b!88227 m!94191))

(assert (=> b!88227 m!93405))

(declare-fun m!94193 () Bool)

(assert (=> b!88227 m!94193))

(assert (=> b!88227 m!94193))

(declare-fun m!94195 () Bool)

(assert (=> b!88227 m!94195))

(assert (=> b!88229 m!93405))

(assert (=> b!88229 m!94193))

(assert (=> b!88229 m!94193))

(assert (=> b!88229 m!94195))

(assert (=> b!87933 d!23461))

(declare-fun d!23463 () Bool)

(declare-fun e!57471 () Bool)

(assert (=> d!23463 e!57471))

(declare-fun res!45195 () Bool)

(assert (=> d!23463 (=> res!45195 e!57471)))

(declare-fun lt!42068 () Bool)

(assert (=> d!23463 (= res!45195 (not lt!42068))))

(declare-fun lt!42069 () Bool)

(assert (=> d!23463 (= lt!42068 lt!42069)))

(declare-fun lt!42070 () Unit!2582)

(declare-fun e!57470 () Unit!2582)

(assert (=> d!23463 (= lt!42070 e!57470)))

(declare-fun c!14585 () Bool)

(assert (=> d!23463 (= c!14585 lt!42069)))

(assert (=> d!23463 (= lt!42069 (containsKey!145 (toList!738 lt!41960) (_1!1107 lt!41604)))))

(assert (=> d!23463 (= (contains!750 lt!41960 (_1!1107 lt!41604)) lt!42068)))

(declare-fun b!88230 () Bool)

(declare-fun lt!42071 () Unit!2582)

(assert (=> b!88230 (= e!57470 lt!42071)))

(assert (=> b!88230 (= lt!42071 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41960) (_1!1107 lt!41604)))))

(assert (=> b!88230 (isDefined!94 (getValueByKey!142 (toList!738 lt!41960) (_1!1107 lt!41604)))))

(declare-fun b!88231 () Bool)

(declare-fun Unit!2601 () Unit!2582)

(assert (=> b!88231 (= e!57470 Unit!2601)))

(declare-fun b!88232 () Bool)

(assert (=> b!88232 (= e!57471 (isDefined!94 (getValueByKey!142 (toList!738 lt!41960) (_1!1107 lt!41604))))))

(assert (= (and d!23463 c!14585) b!88230))

(assert (= (and d!23463 (not c!14585)) b!88231))

(assert (= (and d!23463 (not res!45195)) b!88232))

(declare-fun m!94197 () Bool)

(assert (=> d!23463 m!94197))

(declare-fun m!94199 () Bool)

(assert (=> b!88230 m!94199))

(assert (=> b!88230 m!93881))

(assert (=> b!88230 m!93881))

(declare-fun m!94201 () Bool)

(assert (=> b!88230 m!94201))

(assert (=> b!88232 m!93881))

(assert (=> b!88232 m!93881))

(assert (=> b!88232 m!94201))

(assert (=> d!23387 d!23463))

(declare-fun b!88236 () Bool)

(declare-fun e!57473 () Option!148)

(assert (=> b!88236 (= e!57473 None!146)))

(declare-fun b!88235 () Bool)

(assert (=> b!88235 (= e!57473 (getValueByKey!142 (t!5246 lt!41958) (_1!1107 lt!41604)))))

(declare-fun b!88234 () Bool)

(declare-fun e!57472 () Option!148)

(assert (=> b!88234 (= e!57472 e!57473)))

(declare-fun c!14587 () Bool)

(assert (=> b!88234 (= c!14587 (and ((_ is Cons!1508) lt!41958) (not (= (_1!1107 (h!2100 lt!41958)) (_1!1107 lt!41604)))))))

(declare-fun b!88233 () Bool)

(assert (=> b!88233 (= e!57472 (Some!147 (_2!1107 (h!2100 lt!41958))))))

(declare-fun d!23465 () Bool)

(declare-fun c!14586 () Bool)

(assert (=> d!23465 (= c!14586 (and ((_ is Cons!1508) lt!41958) (= (_1!1107 (h!2100 lt!41958)) (_1!1107 lt!41604))))))

(assert (=> d!23465 (= (getValueByKey!142 lt!41958 (_1!1107 lt!41604)) e!57472)))

(assert (= (and d!23465 c!14586) b!88233))

(assert (= (and d!23465 (not c!14586)) b!88234))

(assert (= (and b!88234 c!14587) b!88235))

(assert (= (and b!88234 (not c!14587)) b!88236))

(declare-fun m!94203 () Bool)

(assert (=> b!88235 m!94203))

(assert (=> d!23387 d!23465))

(declare-fun d!23467 () Bool)

(assert (=> d!23467 (= (getValueByKey!142 lt!41958 (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604)))))

(declare-fun lt!42072 () Unit!2582)

(assert (=> d!23467 (= lt!42072 (choose!524 lt!41958 (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(declare-fun e!57474 () Bool)

(assert (=> d!23467 e!57474))

(declare-fun res!45196 () Bool)

(assert (=> d!23467 (=> (not res!45196) (not e!57474))))

(assert (=> d!23467 (= res!45196 (isStrictlySorted!286 lt!41958))))

(assert (=> d!23467 (= (lemmaContainsTupThenGetReturnValue!59 lt!41958 (_1!1107 lt!41604) (_2!1107 lt!41604)) lt!42072)))

(declare-fun b!88237 () Bool)

(declare-fun res!45197 () Bool)

(assert (=> b!88237 (=> (not res!45197) (not e!57474))))

(assert (=> b!88237 (= res!45197 (containsKey!145 lt!41958 (_1!1107 lt!41604)))))

(declare-fun b!88238 () Bool)

(assert (=> b!88238 (= e!57474 (contains!753 lt!41958 (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604))))))

(assert (= (and d!23467 res!45196) b!88237))

(assert (= (and b!88237 res!45197) b!88238))

(assert (=> d!23467 m!93875))

(declare-fun m!94205 () Bool)

(assert (=> d!23467 m!94205))

(declare-fun m!94207 () Bool)

(assert (=> d!23467 m!94207))

(declare-fun m!94209 () Bool)

(assert (=> b!88237 m!94209))

(declare-fun m!94211 () Bool)

(assert (=> b!88238 m!94211))

(assert (=> d!23387 d!23467))

(declare-fun b!88239 () Bool)

(declare-fun e!57476 () List!1512)

(declare-fun call!8467 () List!1512)

(assert (=> b!88239 (= e!57476 call!8467)))

(declare-fun b!88240 () Bool)

(declare-fun res!45198 () Bool)

(declare-fun e!57478 () Bool)

(assert (=> b!88240 (=> (not res!45198) (not e!57478))))

(declare-fun lt!42073 () List!1512)

(assert (=> b!88240 (= res!45198 (containsKey!145 lt!42073 (_1!1107 lt!41604)))))

(declare-fun b!88241 () Bool)

(assert (=> b!88241 (= e!57478 (contains!753 lt!42073 (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604))))))

(declare-fun e!57477 () List!1512)

(declare-fun call!8466 () List!1512)

(declare-fun bm!8463 () Bool)

(declare-fun c!14591 () Bool)

(assert (=> bm!8463 (= call!8466 ($colon$colon!72 e!57477 (ite c!14591 (h!2100 (toList!738 lt!41614)) (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604)))))))

(declare-fun c!14588 () Bool)

(assert (=> bm!8463 (= c!14588 c!14591)))

(declare-fun b!88242 () Bool)

(declare-fun c!14589 () Bool)

(declare-fun c!14590 () Bool)

(assert (=> b!88242 (= e!57477 (ite c!14589 (t!5246 (toList!738 lt!41614)) (ite c!14590 (Cons!1508 (h!2100 (toList!738 lt!41614)) (t!5246 (toList!738 lt!41614))) Nil!1509)))))

(declare-fun b!88243 () Bool)

(assert (=> b!88243 (= e!57477 (insertStrictlySorted!62 (t!5246 (toList!738 lt!41614)) (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(declare-fun b!88244 () Bool)

(declare-fun e!57479 () List!1512)

(declare-fun e!57475 () List!1512)

(assert (=> b!88244 (= e!57479 e!57475)))

(assert (=> b!88244 (= c!14589 (and ((_ is Cons!1508) (toList!738 lt!41614)) (= (_1!1107 (h!2100 (toList!738 lt!41614))) (_1!1107 lt!41604))))))

(declare-fun b!88245 () Bool)

(declare-fun call!8468 () List!1512)

(assert (=> b!88245 (= e!57475 call!8468)))

(declare-fun bm!8465 () Bool)

(assert (=> bm!8465 (= call!8468 call!8466)))

(declare-fun b!88246 () Bool)

(assert (=> b!88246 (= c!14590 (and ((_ is Cons!1508) (toList!738 lt!41614)) (bvsgt (_1!1107 (h!2100 (toList!738 lt!41614))) (_1!1107 lt!41604))))))

(assert (=> b!88246 (= e!57475 e!57476)))

(declare-fun b!88247 () Bool)

(assert (=> b!88247 (= e!57479 call!8466)))

(declare-fun b!88248 () Bool)

(assert (=> b!88248 (= e!57476 call!8467)))

(declare-fun d!23469 () Bool)

(assert (=> d!23469 e!57478))

(declare-fun res!45199 () Bool)

(assert (=> d!23469 (=> (not res!45199) (not e!57478))))

(assert (=> d!23469 (= res!45199 (isStrictlySorted!286 lt!42073))))

(assert (=> d!23469 (= lt!42073 e!57479)))

(assert (=> d!23469 (= c!14591 (and ((_ is Cons!1508) (toList!738 lt!41614)) (bvslt (_1!1107 (h!2100 (toList!738 lt!41614))) (_1!1107 lt!41604))))))

(assert (=> d!23469 (isStrictlySorted!286 (toList!738 lt!41614))))

(assert (=> d!23469 (= (insertStrictlySorted!62 (toList!738 lt!41614) (_1!1107 lt!41604) (_2!1107 lt!41604)) lt!42073)))

(declare-fun bm!8464 () Bool)

(assert (=> bm!8464 (= call!8467 call!8468)))

(assert (= (and d!23469 c!14591) b!88247))

(assert (= (and d!23469 (not c!14591)) b!88244))

(assert (= (and b!88244 c!14589) b!88245))

(assert (= (and b!88244 (not c!14589)) b!88246))

(assert (= (and b!88246 c!14590) b!88239))

(assert (= (and b!88246 (not c!14590)) b!88248))

(assert (= (or b!88239 b!88248) bm!8464))

(assert (= (or b!88245 bm!8464) bm!8465))

(assert (= (or b!88247 bm!8465) bm!8463))

(assert (= (and bm!8463 c!14588) b!88243))

(assert (= (and bm!8463 (not c!14588)) b!88242))

(assert (= (and d!23469 res!45199) b!88240))

(assert (= (and b!88240 res!45198) b!88241))

(declare-fun m!94213 () Bool)

(assert (=> b!88240 m!94213))

(declare-fun m!94215 () Bool)

(assert (=> d!23469 m!94215))

(assert (=> d!23469 m!94123))

(declare-fun m!94217 () Bool)

(assert (=> b!88241 m!94217))

(declare-fun m!94219 () Bool)

(assert (=> b!88243 m!94219))

(declare-fun m!94221 () Bool)

(assert (=> bm!8463 m!94221))

(assert (=> d!23387 d!23469))

(declare-fun d!23471 () Bool)

(assert (=> d!23471 (= (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88049 d!23471))

(declare-fun d!23473 () Bool)

(declare-fun lt!42076 () (_ BitVec 32))

(assert (=> d!23473 (and (bvsge lt!42076 #b00000000000000000000000000000000) (bvsle lt!42076 (bvsub (size!2161 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!57484 () (_ BitVec 32))

(assert (=> d!23473 (= lt!42076 e!57484)))

(declare-fun c!14596 () Bool)

(assert (=> d!23473 (= c!14596 (bvsge #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(assert (=> d!23473 (and (bvsle #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2161 (_keys!4034 newMap!16)) (size!2161 (_keys!4034 newMap!16))))))

(assert (=> d!23473 (= (arrayCountValidKeys!0 (_keys!4034 newMap!16) #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) lt!42076)))

(declare-fun b!88257 () Bool)

(declare-fun e!57485 () (_ BitVec 32))

(assert (=> b!88257 (= e!57484 e!57485)))

(declare-fun c!14597 () Bool)

(assert (=> b!88257 (= c!14597 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88258 () Bool)

(declare-fun call!8471 () (_ BitVec 32))

(assert (=> b!88258 (= e!57485 (bvadd #b00000000000000000000000000000001 call!8471))))

(declare-fun b!88259 () Bool)

(assert (=> b!88259 (= e!57484 #b00000000000000000000000000000000)))

(declare-fun b!88260 () Bool)

(assert (=> b!88260 (= e!57485 call!8471)))

(declare-fun bm!8468 () Bool)

(assert (=> bm!8468 (= call!8471 (arrayCountValidKeys!0 (_keys!4034 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2161 (_keys!4034 newMap!16))))))

(assert (= (and d!23473 c!14596) b!88259))

(assert (= (and d!23473 (not c!14596)) b!88257))

(assert (= (and b!88257 c!14597) b!88258))

(assert (= (and b!88257 (not c!14597)) b!88260))

(assert (= (or b!88258 b!88260) bm!8468))

(assert (=> b!88257 m!93889))

(assert (=> b!88257 m!93889))

(assert (=> b!88257 m!94013))

(declare-fun m!94223 () Bool)

(assert (=> bm!8468 m!94223))

(assert (=> b!88007 d!23473))

(declare-fun d!23475 () Bool)

(declare-fun e!57487 () Bool)

(assert (=> d!23475 e!57487))

(declare-fun res!45200 () Bool)

(assert (=> d!23475 (=> res!45200 e!57487)))

(declare-fun lt!42077 () Bool)

(assert (=> d!23475 (= res!45200 (not lt!42077))))

(declare-fun lt!42078 () Bool)

(assert (=> d!23475 (= lt!42077 lt!42078)))

(declare-fun lt!42079 () Unit!2582)

(declare-fun e!57486 () Unit!2582)

(assert (=> d!23475 (= lt!42079 e!57486)))

(declare-fun c!14598 () Bool)

(assert (=> d!23475 (= c!14598 lt!42078)))

(assert (=> d!23475 (= lt!42078 (containsKey!145 (toList!738 lt!41943) (_1!1107 lt!41606)))))

(assert (=> d!23475 (= (contains!750 lt!41943 (_1!1107 lt!41606)) lt!42077)))

(declare-fun b!88261 () Bool)

(declare-fun lt!42080 () Unit!2582)

(assert (=> b!88261 (= e!57486 lt!42080)))

(assert (=> b!88261 (= lt!42080 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41943) (_1!1107 lt!41606)))))

(assert (=> b!88261 (isDefined!94 (getValueByKey!142 (toList!738 lt!41943) (_1!1107 lt!41606)))))

(declare-fun b!88262 () Bool)

(declare-fun Unit!2602 () Unit!2582)

(assert (=> b!88262 (= e!57486 Unit!2602)))

(declare-fun b!88263 () Bool)

(assert (=> b!88263 (= e!57487 (isDefined!94 (getValueByKey!142 (toList!738 lt!41943) (_1!1107 lt!41606))))))

(assert (= (and d!23475 c!14598) b!88261))

(assert (= (and d!23475 (not c!14598)) b!88262))

(assert (= (and d!23475 (not res!45200)) b!88263))

(declare-fun m!94225 () Bool)

(assert (=> d!23475 m!94225))

(declare-fun m!94227 () Bool)

(assert (=> b!88261 m!94227))

(assert (=> b!88261 m!93823))

(assert (=> b!88261 m!93823))

(declare-fun m!94229 () Bool)

(assert (=> b!88261 m!94229))

(assert (=> b!88263 m!93823))

(assert (=> b!88263 m!93823))

(assert (=> b!88263 m!94229))

(assert (=> d!23375 d!23475))

(declare-fun b!88267 () Bool)

(declare-fun e!57489 () Option!148)

(assert (=> b!88267 (= e!57489 None!146)))

(declare-fun b!88266 () Bool)

(assert (=> b!88266 (= e!57489 (getValueByKey!142 (t!5246 lt!41941) (_1!1107 lt!41606)))))

(declare-fun b!88265 () Bool)

(declare-fun e!57488 () Option!148)

(assert (=> b!88265 (= e!57488 e!57489)))

(declare-fun c!14600 () Bool)

(assert (=> b!88265 (= c!14600 (and ((_ is Cons!1508) lt!41941) (not (= (_1!1107 (h!2100 lt!41941)) (_1!1107 lt!41606)))))))

(declare-fun b!88264 () Bool)

(assert (=> b!88264 (= e!57488 (Some!147 (_2!1107 (h!2100 lt!41941))))))

(declare-fun d!23477 () Bool)

(declare-fun c!14599 () Bool)

(assert (=> d!23477 (= c!14599 (and ((_ is Cons!1508) lt!41941) (= (_1!1107 (h!2100 lt!41941)) (_1!1107 lt!41606))))))

(assert (=> d!23477 (= (getValueByKey!142 lt!41941 (_1!1107 lt!41606)) e!57488)))

(assert (= (and d!23477 c!14599) b!88264))

(assert (= (and d!23477 (not c!14599)) b!88265))

(assert (= (and b!88265 c!14600) b!88266))

(assert (= (and b!88265 (not c!14600)) b!88267))

(declare-fun m!94231 () Bool)

(assert (=> b!88266 m!94231))

(assert (=> d!23375 d!23477))

(declare-fun d!23479 () Bool)

(assert (=> d!23479 (= (getValueByKey!142 lt!41941 (_1!1107 lt!41606)) (Some!147 (_2!1107 lt!41606)))))

(declare-fun lt!42081 () Unit!2582)

(assert (=> d!23479 (= lt!42081 (choose!524 lt!41941 (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(declare-fun e!57490 () Bool)

(assert (=> d!23479 e!57490))

(declare-fun res!45201 () Bool)

(assert (=> d!23479 (=> (not res!45201) (not e!57490))))

(assert (=> d!23479 (= res!45201 (isStrictlySorted!286 lt!41941))))

(assert (=> d!23479 (= (lemmaContainsTupThenGetReturnValue!59 lt!41941 (_1!1107 lt!41606) (_2!1107 lt!41606)) lt!42081)))

(declare-fun b!88268 () Bool)

(declare-fun res!45202 () Bool)

(assert (=> b!88268 (=> (not res!45202) (not e!57490))))

(assert (=> b!88268 (= res!45202 (containsKey!145 lt!41941 (_1!1107 lt!41606)))))

(declare-fun b!88269 () Bool)

(assert (=> b!88269 (= e!57490 (contains!753 lt!41941 (tuple2!2193 (_1!1107 lt!41606) (_2!1107 lt!41606))))))

(assert (= (and d!23479 res!45201) b!88268))

(assert (= (and b!88268 res!45202) b!88269))

(assert (=> d!23479 m!93817))

(declare-fun m!94233 () Bool)

(assert (=> d!23479 m!94233))

(declare-fun m!94235 () Bool)

(assert (=> d!23479 m!94235))

(declare-fun m!94237 () Bool)

(assert (=> b!88268 m!94237))

(declare-fun m!94239 () Bool)

(assert (=> b!88269 m!94239))

(assert (=> d!23375 d!23479))

(declare-fun b!88270 () Bool)

(declare-fun e!57492 () List!1512)

(declare-fun call!8473 () List!1512)

(assert (=> b!88270 (= e!57492 call!8473)))

(declare-fun b!88271 () Bool)

(declare-fun res!45203 () Bool)

(declare-fun e!57494 () Bool)

(assert (=> b!88271 (=> (not res!45203) (not e!57494))))

(declare-fun lt!42082 () List!1512)

(assert (=> b!88271 (= res!45203 (containsKey!145 lt!42082 (_1!1107 lt!41606)))))

(declare-fun b!88272 () Bool)

(assert (=> b!88272 (= e!57494 (contains!753 lt!42082 (tuple2!2193 (_1!1107 lt!41606) (_2!1107 lt!41606))))))

(declare-fun bm!8469 () Bool)

(declare-fun c!14604 () Bool)

(declare-fun call!8472 () List!1512)

(declare-fun e!57493 () List!1512)

(assert (=> bm!8469 (= call!8472 ($colon$colon!72 e!57493 (ite c!14604 (h!2100 (toList!738 lt!41598)) (tuple2!2193 (_1!1107 lt!41606) (_2!1107 lt!41606)))))))

(declare-fun c!14601 () Bool)

(assert (=> bm!8469 (= c!14601 c!14604)))

(declare-fun b!88273 () Bool)

(declare-fun c!14602 () Bool)

(declare-fun c!14603 () Bool)

(assert (=> b!88273 (= e!57493 (ite c!14602 (t!5246 (toList!738 lt!41598)) (ite c!14603 (Cons!1508 (h!2100 (toList!738 lt!41598)) (t!5246 (toList!738 lt!41598))) Nil!1509)))))

(declare-fun b!88274 () Bool)

(assert (=> b!88274 (= e!57493 (insertStrictlySorted!62 (t!5246 (toList!738 lt!41598)) (_1!1107 lt!41606) (_2!1107 lt!41606)))))

(declare-fun b!88275 () Bool)

(declare-fun e!57495 () List!1512)

(declare-fun e!57491 () List!1512)

(assert (=> b!88275 (= e!57495 e!57491)))

(assert (=> b!88275 (= c!14602 (and ((_ is Cons!1508) (toList!738 lt!41598)) (= (_1!1107 (h!2100 (toList!738 lt!41598))) (_1!1107 lt!41606))))))

(declare-fun b!88276 () Bool)

(declare-fun call!8474 () List!1512)

(assert (=> b!88276 (= e!57491 call!8474)))

(declare-fun bm!8471 () Bool)

(assert (=> bm!8471 (= call!8474 call!8472)))

(declare-fun b!88277 () Bool)

(assert (=> b!88277 (= c!14603 (and ((_ is Cons!1508) (toList!738 lt!41598)) (bvsgt (_1!1107 (h!2100 (toList!738 lt!41598))) (_1!1107 lt!41606))))))

(assert (=> b!88277 (= e!57491 e!57492)))

(declare-fun b!88278 () Bool)

(assert (=> b!88278 (= e!57495 call!8472)))

(declare-fun b!88279 () Bool)

(assert (=> b!88279 (= e!57492 call!8473)))

(declare-fun d!23481 () Bool)

(assert (=> d!23481 e!57494))

(declare-fun res!45204 () Bool)

(assert (=> d!23481 (=> (not res!45204) (not e!57494))))

(assert (=> d!23481 (= res!45204 (isStrictlySorted!286 lt!42082))))

(assert (=> d!23481 (= lt!42082 e!57495)))

(assert (=> d!23481 (= c!14604 (and ((_ is Cons!1508) (toList!738 lt!41598)) (bvslt (_1!1107 (h!2100 (toList!738 lt!41598))) (_1!1107 lt!41606))))))

(assert (=> d!23481 (isStrictlySorted!286 (toList!738 lt!41598))))

(assert (=> d!23481 (= (insertStrictlySorted!62 (toList!738 lt!41598) (_1!1107 lt!41606) (_2!1107 lt!41606)) lt!42082)))

(declare-fun bm!8470 () Bool)

(assert (=> bm!8470 (= call!8473 call!8474)))

(assert (= (and d!23481 c!14604) b!88278))

(assert (= (and d!23481 (not c!14604)) b!88275))

(assert (= (and b!88275 c!14602) b!88276))

(assert (= (and b!88275 (not c!14602)) b!88277))

(assert (= (and b!88277 c!14603) b!88270))

(assert (= (and b!88277 (not c!14603)) b!88279))

(assert (= (or b!88270 b!88279) bm!8470))

(assert (= (or b!88276 bm!8470) bm!8471))

(assert (= (or b!88278 bm!8471) bm!8469))

(assert (= (and bm!8469 c!14601) b!88274))

(assert (= (and bm!8469 (not c!14601)) b!88273))

(assert (= (and d!23481 res!45204) b!88271))

(assert (= (and b!88271 res!45203) b!88272))

(declare-fun m!94241 () Bool)

(assert (=> b!88271 m!94241))

(declare-fun m!94243 () Bool)

(assert (=> d!23481 m!94243))

(declare-fun m!94245 () Bool)

(assert (=> d!23481 m!94245))

(declare-fun m!94247 () Bool)

(assert (=> b!88272 m!94247))

(declare-fun m!94249 () Bool)

(assert (=> b!88274 m!94249))

(declare-fun m!94251 () Bool)

(assert (=> bm!8469 m!94251))

(assert (=> d!23375 d!23481))

(declare-fun b!88280 () Bool)

(declare-fun e!57496 () ListLongMap!1445)

(declare-fun e!57499 () ListLongMap!1445)

(assert (=> b!88280 (= e!57496 e!57499)))

(declare-fun c!14607 () Bool)

(assert (=> b!88280 (= c!14607 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!88281 () Bool)

(declare-fun e!57497 () Bool)

(declare-fun lt!42085 () ListLongMap!1445)

(assert (=> b!88281 (= e!57497 (isEmpty!344 lt!42085))))

(declare-fun b!88282 () Bool)

(declare-fun lt!42084 () Unit!2582)

(declare-fun lt!42083 () Unit!2582)

(assert (=> b!88282 (= lt!42084 lt!42083)))

(declare-fun lt!42087 () ListLongMap!1445)

(declare-fun lt!42088 () V!3033)

(declare-fun lt!42089 () (_ BitVec 64))

(declare-fun lt!42086 () (_ BitVec 64))

(assert (=> b!88282 (not (contains!750 (+!109 lt!42087 (tuple2!2193 lt!42086 lt!42088)) lt!42089))))

(assert (=> b!88282 (= lt!42083 (addStillNotContains!34 lt!42087 lt!42086 lt!42088 lt!42089))))

(assert (=> b!88282 (= lt!42089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88282 (= lt!42088 (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88282 (= lt!42086 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!8475 () ListLongMap!1445)

(assert (=> b!88282 (= lt!42087 call!8475)))

(assert (=> b!88282 (= e!57499 (+!109 call!8475 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!88283 () Bool)

(assert (=> b!88283 (= e!57496 (ListLongMap!1446 Nil!1509))))

(declare-fun bm!8472 () Bool)

(assert (=> bm!8472 (= call!8475 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!88284 () Bool)

(assert (=> b!88284 (= e!57499 call!8475)))

(declare-fun b!88285 () Bool)

(assert (=> b!88285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> b!88285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2162 (_values!2341 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun e!57498 () Bool)

(assert (=> b!88285 (= e!57498 (= (apply!83 lt!42085 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!23483 () Bool)

(declare-fun e!57501 () Bool)

(assert (=> d!23483 e!57501))

(declare-fun res!45207 () Bool)

(assert (=> d!23483 (=> (not res!45207) (not e!57501))))

(assert (=> d!23483 (= res!45207 (not (contains!750 lt!42085 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23483 (= lt!42085 e!57496)))

(declare-fun c!14606 () Bool)

(assert (=> d!23483 (= c!14606 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> d!23483 (validMask!0 (mask!6396 (v!2664 (underlying!295 thiss!992))))))

(assert (=> d!23483 (= (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))) lt!42085)))

(declare-fun b!88286 () Bool)

(declare-fun e!57500 () Bool)

(assert (=> b!88286 (= e!57501 e!57500)))

(declare-fun c!14605 () Bool)

(declare-fun e!57502 () Bool)

(assert (=> b!88286 (= c!14605 e!57502)))

(declare-fun res!45206 () Bool)

(assert (=> b!88286 (=> (not res!45206) (not e!57502))))

(assert (=> b!88286 (= res!45206 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88287 () Bool)

(assert (=> b!88287 (= e!57502 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!88287 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!88288 () Bool)

(assert (=> b!88288 (= e!57500 e!57497)))

(declare-fun c!14608 () Bool)

(assert (=> b!88288 (= c!14608 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88289 () Bool)

(assert (=> b!88289 (= e!57497 (= lt!42085 (getCurrentListMapNoExtraKeys!74 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88290 () Bool)

(declare-fun res!45205 () Bool)

(assert (=> b!88290 (=> (not res!45205) (not e!57501))))

(assert (=> b!88290 (= res!45205 (not (contains!750 lt!42085 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88291 () Bool)

(assert (=> b!88291 (= e!57500 e!57498)))

(assert (=> b!88291 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun res!45208 () Bool)

(assert (=> b!88291 (= res!45208 (contains!750 lt!42085 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!88291 (=> (not res!45208) (not e!57498))))

(assert (= (and d!23483 c!14606) b!88283))

(assert (= (and d!23483 (not c!14606)) b!88280))

(assert (= (and b!88280 c!14607) b!88282))

(assert (= (and b!88280 (not c!14607)) b!88284))

(assert (= (or b!88282 b!88284) bm!8472))

(assert (= (and d!23483 res!45207) b!88290))

(assert (= (and b!88290 res!45205) b!88286))

(assert (= (and b!88286 res!45206) b!88287))

(assert (= (and b!88286 c!14605) b!88291))

(assert (= (and b!88286 (not c!14605)) b!88288))

(assert (= (and b!88291 res!45208) b!88285))

(assert (= (and b!88288 c!14608) b!88289))

(assert (= (and b!88288 (not c!14608)) b!88281))

(declare-fun b_lambda!3909 () Bool)

(assert (=> (not b_lambda!3909) (not b!88282)))

(assert (=> b!88282 t!5242))

(declare-fun b_and!5309 () Bool)

(assert (= b_and!5305 (and (=> t!5242 result!2931) b_and!5309)))

(assert (=> b!88282 t!5244))

(declare-fun b_and!5311 () Bool)

(assert (= b_and!5307 (and (=> t!5244 result!2935) b_and!5311)))

(declare-fun b_lambda!3911 () Bool)

(assert (=> (not b_lambda!3911) (not b!88285)))

(assert (=> b!88285 t!5242))

(declare-fun b_and!5313 () Bool)

(assert (= b_and!5309 (and (=> t!5242 result!2931) b_and!5313)))

(assert (=> b!88285 t!5244))

(declare-fun b_and!5315 () Bool)

(assert (= b_and!5311 (and (=> t!5244 result!2935) b_and!5315)))

(declare-fun m!94253 () Bool)

(assert (=> b!88289 m!94253))

(assert (=> bm!8472 m!94253))

(declare-fun m!94255 () Bool)

(assert (=> b!88285 m!94255))

(assert (=> b!88285 m!93453))

(declare-fun m!94257 () Bool)

(assert (=> b!88285 m!94257))

(assert (=> b!88285 m!94255))

(declare-fun m!94259 () Bool)

(assert (=> b!88285 m!94259))

(assert (=> b!88285 m!94257))

(assert (=> b!88285 m!93453))

(declare-fun m!94261 () Bool)

(assert (=> b!88285 m!94261))

(assert (=> b!88287 m!94255))

(assert (=> b!88287 m!94255))

(declare-fun m!94263 () Bool)

(assert (=> b!88287 m!94263))

(assert (=> b!88280 m!94255))

(assert (=> b!88280 m!94255))

(assert (=> b!88280 m!94263))

(declare-fun m!94265 () Bool)

(assert (=> b!88281 m!94265))

(assert (=> b!88291 m!94255))

(assert (=> b!88291 m!94255))

(declare-fun m!94267 () Bool)

(assert (=> b!88291 m!94267))

(declare-fun m!94269 () Bool)

(assert (=> b!88290 m!94269))

(declare-fun m!94271 () Bool)

(assert (=> b!88282 m!94271))

(assert (=> b!88282 m!94255))

(assert (=> b!88282 m!93453))

(assert (=> b!88282 m!94257))

(declare-fun m!94273 () Bool)

(assert (=> b!88282 m!94273))

(assert (=> b!88282 m!94273))

(declare-fun m!94275 () Bool)

(assert (=> b!88282 m!94275))

(declare-fun m!94277 () Bool)

(assert (=> b!88282 m!94277))

(assert (=> b!88282 m!94257))

(assert (=> b!88282 m!93453))

(assert (=> b!88282 m!94261))

(declare-fun m!94279 () Bool)

(assert (=> d!23483 m!94279))

(assert (=> d!23483 m!93441))

(assert (=> bm!8445 d!23483))

(declare-fun d!23485 () Bool)

(declare-fun res!45209 () Bool)

(declare-fun e!57503 () Bool)

(assert (=> d!23485 (=> res!45209 e!57503)))

(assert (=> d!23485 (= res!45209 (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23485 (= (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!57503)))

(declare-fun b!88292 () Bool)

(declare-fun e!57504 () Bool)

(assert (=> b!88292 (= e!57503 e!57504)))

(declare-fun res!45210 () Bool)

(assert (=> b!88292 (=> (not res!45210) (not e!57504))))

(assert (=> b!88292 (= res!45210 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88293 () Bool)

(assert (=> b!88293 (= e!57504 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!23485 (not res!45209)) b!88292))

(assert (= (and b!88292 res!45210) b!88293))

(assert (=> d!23485 m!94255))

(assert (=> b!88293 m!93405))

(declare-fun m!94281 () Bool)

(assert (=> b!88293 m!94281))

(assert (=> b!87961 d!23485))

(assert (=> b!87945 d!23431))

(declare-fun b!88294 () Bool)

(declare-fun e!57505 () Bool)

(declare-fun e!57506 () Bool)

(assert (=> b!88294 (= e!57505 e!57506)))

(declare-fun c!14609 () Bool)

(assert (=> b!88294 (= c!14609 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88295 () Bool)

(declare-fun e!57508 () Bool)

(assert (=> b!88295 (= e!57508 e!57505)))

(declare-fun res!45211 () Bool)

(assert (=> b!88295 (=> (not res!45211) (not e!57505))))

(declare-fun e!57507 () Bool)

(assert (=> b!88295 (= res!45211 (not e!57507))))

(declare-fun res!45212 () Bool)

(assert (=> b!88295 (=> (not res!45212) (not e!57507))))

(assert (=> b!88295 (= res!45212 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8473 () Bool)

(declare-fun call!8476 () Bool)

(assert (=> bm!8473 (= call!8476 (arrayNoDuplicates!0 (_keys!4034 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14609 (Cons!1507 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000) Nil!1508) Nil!1508)))))

(declare-fun d!23487 () Bool)

(declare-fun res!45213 () Bool)

(assert (=> d!23487 (=> res!45213 e!57508)))

(assert (=> d!23487 (= res!45213 (bvsge #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(assert (=> d!23487 (= (arrayNoDuplicates!0 (_keys!4034 newMap!16) #b00000000000000000000000000000000 Nil!1508) e!57508)))

(declare-fun b!88296 () Bool)

(assert (=> b!88296 (= e!57506 call!8476)))

(declare-fun b!88297 () Bool)

(assert (=> b!88297 (= e!57507 (contains!752 Nil!1508 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88298 () Bool)

(assert (=> b!88298 (= e!57506 call!8476)))

(assert (= (and d!23487 (not res!45213)) b!88295))

(assert (= (and b!88295 res!45212) b!88297))

(assert (= (and b!88295 res!45211) b!88294))

(assert (= (and b!88294 c!14609) b!88298))

(assert (= (and b!88294 (not c!14609)) b!88296))

(assert (= (or b!88298 b!88296) bm!8473))

(assert (=> b!88294 m!93889))

(assert (=> b!88294 m!93889))

(assert (=> b!88294 m!94013))

(assert (=> b!88295 m!93889))

(assert (=> b!88295 m!93889))

(assert (=> b!88295 m!94013))

(assert (=> bm!8473 m!93889))

(declare-fun m!94283 () Bool)

(assert (=> bm!8473 m!94283))

(assert (=> b!88297 m!93889))

(assert (=> b!88297 m!93889))

(declare-fun m!94285 () Bool)

(assert (=> b!88297 m!94285))

(assert (=> b!88009 d!23487))

(declare-fun d!23489 () Bool)

(declare-fun e!57510 () Bool)

(assert (=> d!23489 e!57510))

(declare-fun res!45214 () Bool)

(assert (=> d!23489 (=> res!45214 e!57510)))

(declare-fun lt!42090 () Bool)

(assert (=> d!23489 (= res!45214 (not lt!42090))))

(declare-fun lt!42091 () Bool)

(assert (=> d!23489 (= lt!42090 lt!42091)))

(declare-fun lt!42092 () Unit!2582)

(declare-fun e!57509 () Unit!2582)

(assert (=> d!23489 (= lt!42092 e!57509)))

(declare-fun c!14610 () Bool)

(assert (=> d!23489 (= c!14610 lt!42091)))

(assert (=> d!23489 (= lt!42091 (containsKey!145 (toList!738 lt!41947) (_1!1107 lt!41604)))))

(assert (=> d!23489 (= (contains!750 lt!41947 (_1!1107 lt!41604)) lt!42090)))

(declare-fun b!88299 () Bool)

(declare-fun lt!42093 () Unit!2582)

(assert (=> b!88299 (= e!57509 lt!42093)))

(assert (=> b!88299 (= lt!42093 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41947) (_1!1107 lt!41604)))))

(assert (=> b!88299 (isDefined!94 (getValueByKey!142 (toList!738 lt!41947) (_1!1107 lt!41604)))))

(declare-fun b!88300 () Bool)

(declare-fun Unit!2603 () Unit!2582)

(assert (=> b!88300 (= e!57509 Unit!2603)))

(declare-fun b!88301 () Bool)

(assert (=> b!88301 (= e!57510 (isDefined!94 (getValueByKey!142 (toList!738 lt!41947) (_1!1107 lt!41604))))))

(assert (= (and d!23489 c!14610) b!88299))

(assert (= (and d!23489 (not c!14610)) b!88300))

(assert (= (and d!23489 (not res!45214)) b!88301))

(declare-fun m!94287 () Bool)

(assert (=> d!23489 m!94287))

(declare-fun m!94289 () Bool)

(assert (=> b!88299 m!94289))

(assert (=> b!88299 m!93835))

(assert (=> b!88299 m!93835))

(declare-fun m!94291 () Bool)

(assert (=> b!88299 m!94291))

(assert (=> b!88301 m!93835))

(assert (=> b!88301 m!93835))

(assert (=> b!88301 m!94291))

(assert (=> d!23377 d!23489))

(declare-fun b!88305 () Bool)

(declare-fun e!57512 () Option!148)

(assert (=> b!88305 (= e!57512 None!146)))

(declare-fun b!88304 () Bool)

(assert (=> b!88304 (= e!57512 (getValueByKey!142 (t!5246 lt!41945) (_1!1107 lt!41604)))))

(declare-fun b!88303 () Bool)

(declare-fun e!57511 () Option!148)

(assert (=> b!88303 (= e!57511 e!57512)))

(declare-fun c!14612 () Bool)

(assert (=> b!88303 (= c!14612 (and ((_ is Cons!1508) lt!41945) (not (= (_1!1107 (h!2100 lt!41945)) (_1!1107 lt!41604)))))))

(declare-fun b!88302 () Bool)

(assert (=> b!88302 (= e!57511 (Some!147 (_2!1107 (h!2100 lt!41945))))))

(declare-fun d!23491 () Bool)

(declare-fun c!14611 () Bool)

(assert (=> d!23491 (= c!14611 (and ((_ is Cons!1508) lt!41945) (= (_1!1107 (h!2100 lt!41945)) (_1!1107 lt!41604))))))

(assert (=> d!23491 (= (getValueByKey!142 lt!41945 (_1!1107 lt!41604)) e!57511)))

(assert (= (and d!23491 c!14611) b!88302))

(assert (= (and d!23491 (not c!14611)) b!88303))

(assert (= (and b!88303 c!14612) b!88304))

(assert (= (and b!88303 (not c!14612)) b!88305))

(declare-fun m!94293 () Bool)

(assert (=> b!88304 m!94293))

(assert (=> d!23377 d!23491))

(declare-fun d!23493 () Bool)

(assert (=> d!23493 (= (getValueByKey!142 lt!41945 (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604)))))

(declare-fun lt!42094 () Unit!2582)

(assert (=> d!23493 (= lt!42094 (choose!524 lt!41945 (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(declare-fun e!57513 () Bool)

(assert (=> d!23493 e!57513))

(declare-fun res!45215 () Bool)

(assert (=> d!23493 (=> (not res!45215) (not e!57513))))

(assert (=> d!23493 (= res!45215 (isStrictlySorted!286 lt!41945))))

(assert (=> d!23493 (= (lemmaContainsTupThenGetReturnValue!59 lt!41945 (_1!1107 lt!41604) (_2!1107 lt!41604)) lt!42094)))

(declare-fun b!88306 () Bool)

(declare-fun res!45216 () Bool)

(assert (=> b!88306 (=> (not res!45216) (not e!57513))))

(assert (=> b!88306 (= res!45216 (containsKey!145 lt!41945 (_1!1107 lt!41604)))))

(declare-fun b!88307 () Bool)

(assert (=> b!88307 (= e!57513 (contains!753 lt!41945 (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604))))))

(assert (= (and d!23493 res!45215) b!88306))

(assert (= (and b!88306 res!45216) b!88307))

(assert (=> d!23493 m!93829))

(declare-fun m!94295 () Bool)

(assert (=> d!23493 m!94295))

(declare-fun m!94297 () Bool)

(assert (=> d!23493 m!94297))

(declare-fun m!94299 () Bool)

(assert (=> b!88306 m!94299))

(declare-fun m!94301 () Bool)

(assert (=> b!88307 m!94301))

(assert (=> d!23377 d!23493))

(declare-fun b!88308 () Bool)

(declare-fun e!57515 () List!1512)

(declare-fun call!8478 () List!1512)

(assert (=> b!88308 (= e!57515 call!8478)))

(declare-fun b!88309 () Bool)

(declare-fun res!45217 () Bool)

(declare-fun e!57517 () Bool)

(assert (=> b!88309 (=> (not res!45217) (not e!57517))))

(declare-fun lt!42095 () List!1512)

(assert (=> b!88309 (= res!45217 (containsKey!145 lt!42095 (_1!1107 lt!41604)))))

(declare-fun b!88310 () Bool)

(assert (=> b!88310 (= e!57517 (contains!753 lt!42095 (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604))))))

(declare-fun e!57516 () List!1512)

(declare-fun call!8477 () List!1512)

(declare-fun bm!8474 () Bool)

(declare-fun c!14616 () Bool)

(assert (=> bm!8474 (= call!8477 ($colon$colon!72 e!57516 (ite c!14616 (h!2100 (toList!738 (+!109 lt!41600 lt!41611))) (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604)))))))

(declare-fun c!14613 () Bool)

(assert (=> bm!8474 (= c!14613 c!14616)))

(declare-fun c!14614 () Bool)

(declare-fun b!88311 () Bool)

(declare-fun c!14615 () Bool)

(assert (=> b!88311 (= e!57516 (ite c!14614 (t!5246 (toList!738 (+!109 lt!41600 lt!41611))) (ite c!14615 (Cons!1508 (h!2100 (toList!738 (+!109 lt!41600 lt!41611))) (t!5246 (toList!738 (+!109 lt!41600 lt!41611)))) Nil!1509)))))

(declare-fun b!88312 () Bool)

(assert (=> b!88312 (= e!57516 (insertStrictlySorted!62 (t!5246 (toList!738 (+!109 lt!41600 lt!41611))) (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(declare-fun b!88313 () Bool)

(declare-fun e!57518 () List!1512)

(declare-fun e!57514 () List!1512)

(assert (=> b!88313 (= e!57518 e!57514)))

(assert (=> b!88313 (= c!14614 (and ((_ is Cons!1508) (toList!738 (+!109 lt!41600 lt!41611))) (= (_1!1107 (h!2100 (toList!738 (+!109 lt!41600 lt!41611)))) (_1!1107 lt!41604))))))

(declare-fun b!88314 () Bool)

(declare-fun call!8479 () List!1512)

(assert (=> b!88314 (= e!57514 call!8479)))

(declare-fun bm!8476 () Bool)

(assert (=> bm!8476 (= call!8479 call!8477)))

(declare-fun b!88315 () Bool)

(assert (=> b!88315 (= c!14615 (and ((_ is Cons!1508) (toList!738 (+!109 lt!41600 lt!41611))) (bvsgt (_1!1107 (h!2100 (toList!738 (+!109 lt!41600 lt!41611)))) (_1!1107 lt!41604))))))

(assert (=> b!88315 (= e!57514 e!57515)))

(declare-fun b!88316 () Bool)

(assert (=> b!88316 (= e!57518 call!8477)))

(declare-fun b!88317 () Bool)

(assert (=> b!88317 (= e!57515 call!8478)))

(declare-fun d!23495 () Bool)

(assert (=> d!23495 e!57517))

(declare-fun res!45218 () Bool)

(assert (=> d!23495 (=> (not res!45218) (not e!57517))))

(assert (=> d!23495 (= res!45218 (isStrictlySorted!286 lt!42095))))

(assert (=> d!23495 (= lt!42095 e!57518)))

(assert (=> d!23495 (= c!14616 (and ((_ is Cons!1508) (toList!738 (+!109 lt!41600 lt!41611))) (bvslt (_1!1107 (h!2100 (toList!738 (+!109 lt!41600 lt!41611)))) (_1!1107 lt!41604))))))

(assert (=> d!23495 (isStrictlySorted!286 (toList!738 (+!109 lt!41600 lt!41611)))))

(assert (=> d!23495 (= (insertStrictlySorted!62 (toList!738 (+!109 lt!41600 lt!41611)) (_1!1107 lt!41604) (_2!1107 lt!41604)) lt!42095)))

(declare-fun bm!8475 () Bool)

(assert (=> bm!8475 (= call!8478 call!8479)))

(assert (= (and d!23495 c!14616) b!88316))

(assert (= (and d!23495 (not c!14616)) b!88313))

(assert (= (and b!88313 c!14614) b!88314))

(assert (= (and b!88313 (not c!14614)) b!88315))

(assert (= (and b!88315 c!14615) b!88308))

(assert (= (and b!88315 (not c!14615)) b!88317))

(assert (= (or b!88308 b!88317) bm!8475))

(assert (= (or b!88314 bm!8475) bm!8476))

(assert (= (or b!88316 bm!8476) bm!8474))

(assert (= (and bm!8474 c!14613) b!88312))

(assert (= (and bm!8474 (not c!14613)) b!88311))

(assert (= (and d!23495 res!45218) b!88309))

(assert (= (and b!88309 res!45217) b!88310))

(declare-fun m!94303 () Bool)

(assert (=> b!88309 m!94303))

(declare-fun m!94305 () Bool)

(assert (=> d!23495 m!94305))

(declare-fun m!94307 () Bool)

(assert (=> d!23495 m!94307))

(declare-fun m!94309 () Bool)

(assert (=> b!88310 m!94309))

(declare-fun m!94311 () Bool)

(assert (=> b!88312 m!94311))

(declare-fun m!94313 () Bool)

(assert (=> bm!8474 m!94313))

(assert (=> d!23377 d!23495))

(declare-fun b!88318 () Bool)

(declare-fun e!57524 () Bool)

(declare-fun lt!42103 () ListLongMap!1445)

(assert (=> b!88318 (= e!57524 (= (apply!83 lt!42103 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2248 newMap!16)))))

(declare-fun b!88319 () Bool)

(declare-fun c!14621 () Bool)

(assert (=> b!88319 (= c!14621 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57531 () ListLongMap!1445)

(declare-fun e!57530 () ListLongMap!1445)

(assert (=> b!88319 (= e!57531 e!57530)))

(declare-fun b!88320 () Bool)

(declare-fun e!57522 () Bool)

(declare-fun e!57529 () Bool)

(assert (=> b!88320 (= e!57522 e!57529)))

(declare-fun res!45223 () Bool)

(declare-fun call!8482 () Bool)

(assert (=> b!88320 (= res!45223 call!8482)))

(assert (=> b!88320 (=> (not res!45223) (not e!57529))))

(declare-fun b!88321 () Bool)

(declare-fun e!57527 () Bool)

(declare-fun e!57523 () Bool)

(assert (=> b!88321 (= e!57527 e!57523)))

(declare-fun res!45221 () Bool)

(assert (=> b!88321 (=> (not res!45221) (not e!57523))))

(assert (=> b!88321 (= res!45221 (contains!750 lt!42103 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88322 () Bool)

(assert (=> b!88322 (= e!57523 (= (apply!83 lt!42103 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)) (get!1210 (select (arr!1917 (_values!2341 newMap!16)) #b00000000000000000000000000000000) (dynLambda!345 (defaultEntry!2358 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2162 (_values!2341 newMap!16))))))

(assert (=> b!88322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88323 () Bool)

(declare-fun e!57526 () Bool)

(assert (=> b!88323 (= e!57526 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88324 () Bool)

(declare-fun call!8481 () ListLongMap!1445)

(assert (=> b!88324 (= e!57530 call!8481)))

(declare-fun call!8484 () ListLongMap!1445)

(declare-fun c!14618 () Bool)

(declare-fun c!14622 () Bool)

(declare-fun call!8483 () ListLongMap!1445)

(declare-fun call!8480 () ListLongMap!1445)

(declare-fun bm!8477 () Bool)

(assert (=> bm!8477 (= call!8480 (+!109 (ite c!14618 call!8483 (ite c!14622 call!8484 call!8481)) (ite (or c!14618 c!14622) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 newMap!16)) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16)))))))

(declare-fun bm!8478 () Bool)

(declare-fun call!8486 () Bool)

(assert (=> bm!8478 (= call!8486 (contains!750 lt!42103 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88325 () Bool)

(declare-fun res!45227 () Bool)

(declare-fun e!57521 () Bool)

(assert (=> b!88325 (=> (not res!45227) (not e!57521))))

(assert (=> b!88325 (= res!45227 e!57527)))

(declare-fun res!45219 () Bool)

(assert (=> b!88325 (=> res!45219 e!57527)))

(declare-fun e!57525 () Bool)

(assert (=> b!88325 (= res!45219 (not e!57525))))

(declare-fun res!45224 () Bool)

(assert (=> b!88325 (=> (not res!45224) (not e!57525))))

(assert (=> b!88325 (= res!45224 (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88326 () Bool)

(declare-fun e!57519 () Unit!2582)

(declare-fun Unit!2604 () Unit!2582)

(assert (=> b!88326 (= e!57519 Unit!2604)))

(declare-fun bm!8479 () Bool)

(declare-fun call!8485 () ListLongMap!1445)

(assert (=> bm!8479 (= call!8485 call!8480)))

(declare-fun d!23497 () Bool)

(assert (=> d!23497 e!57521))

(declare-fun res!45222 () Bool)

(assert (=> d!23497 (=> (not res!45222) (not e!57521))))

(assert (=> d!23497 (= res!45222 (or (bvsge #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))))

(declare-fun lt!42104 () ListLongMap!1445)

(assert (=> d!23497 (= lt!42103 lt!42104)))

(declare-fun lt!42107 () Unit!2582)

(assert (=> d!23497 (= lt!42107 e!57519)))

(declare-fun c!14619 () Bool)

(assert (=> d!23497 (= c!14619 e!57526)))

(declare-fun res!45225 () Bool)

(assert (=> d!23497 (=> (not res!45225) (not e!57526))))

(assert (=> d!23497 (= res!45225 (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun e!57520 () ListLongMap!1445)

(assert (=> d!23497 (= lt!42104 e!57520)))

(assert (=> d!23497 (= c!14618 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23497 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23497 (= (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) lt!42103)))

(declare-fun b!88327 () Bool)

(declare-fun e!57528 () Bool)

(assert (=> b!88327 (= e!57528 (not call!8486))))

(declare-fun b!88328 () Bool)

(assert (=> b!88328 (= e!57522 (not call!8482))))

(declare-fun b!88329 () Bool)

(assert (=> b!88329 (= e!57520 (+!109 call!8480 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 newMap!16))))))

(declare-fun b!88330 () Bool)

(assert (=> b!88330 (= e!57531 call!8485)))

(declare-fun b!88331 () Bool)

(declare-fun res!45226 () Bool)

(assert (=> b!88331 (=> (not res!45226) (not e!57521))))

(assert (=> b!88331 (= res!45226 e!57522)))

(declare-fun c!14620 () Bool)

(assert (=> b!88331 (= c!14620 (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8480 () Bool)

(assert (=> bm!8480 (= call!8484 call!8483)))

(declare-fun bm!8481 () Bool)

(assert (=> bm!8481 (= call!8483 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun b!88332 () Bool)

(declare-fun lt!42096 () Unit!2582)

(assert (=> b!88332 (= e!57519 lt!42096)))

(declare-fun lt!42115 () ListLongMap!1445)

(assert (=> b!88332 (= lt!42115 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42114 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42117 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42117 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42111 () Unit!2582)

(assert (=> b!88332 (= lt!42111 (addStillContains!59 lt!42115 lt!42114 (zeroValue!2248 newMap!16) lt!42117))))

(assert (=> b!88332 (contains!750 (+!109 lt!42115 (tuple2!2193 lt!42114 (zeroValue!2248 newMap!16))) lt!42117)))

(declare-fun lt!42112 () Unit!2582)

(assert (=> b!88332 (= lt!42112 lt!42111)))

(declare-fun lt!42110 () ListLongMap!1445)

(assert (=> b!88332 (= lt!42110 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42106 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42106 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42113 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42113 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42098 () Unit!2582)

(assert (=> b!88332 (= lt!42098 (addApplyDifferent!59 lt!42110 lt!42106 (minValue!2248 newMap!16) lt!42113))))

(assert (=> b!88332 (= (apply!83 (+!109 lt!42110 (tuple2!2193 lt!42106 (minValue!2248 newMap!16))) lt!42113) (apply!83 lt!42110 lt!42113))))

(declare-fun lt!42108 () Unit!2582)

(assert (=> b!88332 (= lt!42108 lt!42098)))

(declare-fun lt!42097 () ListLongMap!1445)

(assert (=> b!88332 (= lt!42097 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42105 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42102 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42102 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42101 () Unit!2582)

(assert (=> b!88332 (= lt!42101 (addApplyDifferent!59 lt!42097 lt!42105 (zeroValue!2248 newMap!16) lt!42102))))

(assert (=> b!88332 (= (apply!83 (+!109 lt!42097 (tuple2!2193 lt!42105 (zeroValue!2248 newMap!16))) lt!42102) (apply!83 lt!42097 lt!42102))))

(declare-fun lt!42099 () Unit!2582)

(assert (=> b!88332 (= lt!42099 lt!42101)))

(declare-fun lt!42116 () ListLongMap!1445)

(assert (=> b!88332 (= lt!42116 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42100 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42100 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42109 () (_ BitVec 64))

(assert (=> b!88332 (= lt!42109 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88332 (= lt!42096 (addApplyDifferent!59 lt!42116 lt!42100 (minValue!2248 newMap!16) lt!42109))))

(assert (=> b!88332 (= (apply!83 (+!109 lt!42116 (tuple2!2193 lt!42100 (minValue!2248 newMap!16))) lt!42109) (apply!83 lt!42116 lt!42109))))

(declare-fun b!88333 () Bool)

(assert (=> b!88333 (= e!57529 (= (apply!83 lt!42103 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2248 newMap!16)))))

(declare-fun b!88334 () Bool)

(assert (=> b!88334 (= e!57528 e!57524)))

(declare-fun res!45220 () Bool)

(assert (=> b!88334 (= res!45220 call!8486)))

(assert (=> b!88334 (=> (not res!45220) (not e!57524))))

(declare-fun b!88335 () Bool)

(assert (=> b!88335 (= e!57530 call!8485)))

(declare-fun b!88336 () Bool)

(assert (=> b!88336 (= e!57525 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88337 () Bool)

(assert (=> b!88337 (= e!57520 e!57531)))

(assert (=> b!88337 (= c!14622 (and (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88338 () Bool)

(assert (=> b!88338 (= e!57521 e!57528)))

(declare-fun c!14617 () Bool)

(assert (=> b!88338 (= c!14617 (not (= (bvand (extraKeys!2193 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8482 () Bool)

(assert (=> bm!8482 (= call!8481 call!8484)))

(declare-fun bm!8483 () Bool)

(assert (=> bm!8483 (= call!8482 (contains!750 lt!42103 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23497 c!14618) b!88329))

(assert (= (and d!23497 (not c!14618)) b!88337))

(assert (= (and b!88337 c!14622) b!88330))

(assert (= (and b!88337 (not c!14622)) b!88319))

(assert (= (and b!88319 c!14621) b!88335))

(assert (= (and b!88319 (not c!14621)) b!88324))

(assert (= (or b!88335 b!88324) bm!8482))

(assert (= (or b!88330 bm!8482) bm!8480))

(assert (= (or b!88330 b!88335) bm!8479))

(assert (= (or b!88329 bm!8480) bm!8481))

(assert (= (or b!88329 bm!8479) bm!8477))

(assert (= (and d!23497 res!45225) b!88323))

(assert (= (and d!23497 c!14619) b!88332))

(assert (= (and d!23497 (not c!14619)) b!88326))

(assert (= (and d!23497 res!45222) b!88325))

(assert (= (and b!88325 res!45224) b!88336))

(assert (= (and b!88325 (not res!45219)) b!88321))

(assert (= (and b!88321 res!45221) b!88322))

(assert (= (and b!88325 res!45227) b!88331))

(assert (= (and b!88331 c!14620) b!88320))

(assert (= (and b!88331 (not c!14620)) b!88328))

(assert (= (and b!88320 res!45223) b!88333))

(assert (= (or b!88320 b!88328) bm!8483))

(assert (= (and b!88331 res!45226) b!88338))

(assert (= (and b!88338 c!14617) b!88334))

(assert (= (and b!88338 (not c!14617)) b!88327))

(assert (= (and b!88334 res!45220) b!88318))

(assert (= (or b!88334 b!88327) bm!8478))

(declare-fun b_lambda!3913 () Bool)

(assert (=> (not b_lambda!3913) (not b!88322)))

(assert (=> b!88322 t!5259))

(declare-fun b_and!5317 () Bool)

(assert (= b_and!5313 (and (=> t!5259 result!2951) b_and!5317)))

(assert (=> b!88322 t!5261))

(declare-fun b_and!5319 () Bool)

(assert (= b_and!5315 (and (=> t!5261 result!2953) b_and!5319)))

(declare-fun m!94315 () Bool)

(assert (=> b!88318 m!94315))

(assert (=> b!88336 m!93889))

(assert (=> b!88336 m!93889))

(assert (=> b!88336 m!94013))

(declare-fun m!94317 () Bool)

(assert (=> b!88333 m!94317))

(declare-fun m!94319 () Bool)

(assert (=> bm!8478 m!94319))

(declare-fun m!94321 () Bool)

(assert (=> b!88329 m!94321))

(declare-fun m!94323 () Bool)

(assert (=> bm!8481 m!94323))

(assert (=> b!88321 m!93889))

(assert (=> b!88321 m!93889))

(declare-fun m!94325 () Bool)

(assert (=> b!88321 m!94325))

(assert (=> d!23497 m!93969))

(declare-fun m!94327 () Bool)

(assert (=> bm!8483 m!94327))

(declare-fun m!94329 () Bool)

(assert (=> b!88322 m!94329))

(assert (=> b!88322 m!94029))

(declare-fun m!94331 () Bool)

(assert (=> b!88322 m!94331))

(assert (=> b!88322 m!94029))

(assert (=> b!88322 m!94329))

(assert (=> b!88322 m!93889))

(declare-fun m!94333 () Bool)

(assert (=> b!88322 m!94333))

(assert (=> b!88322 m!93889))

(declare-fun m!94335 () Bool)

(assert (=> bm!8477 m!94335))

(assert (=> b!88323 m!93889))

(assert (=> b!88323 m!93889))

(assert (=> b!88323 m!94013))

(declare-fun m!94337 () Bool)

(assert (=> b!88332 m!94337))

(declare-fun m!94339 () Bool)

(assert (=> b!88332 m!94339))

(declare-fun m!94341 () Bool)

(assert (=> b!88332 m!94341))

(declare-fun m!94343 () Bool)

(assert (=> b!88332 m!94343))

(declare-fun m!94345 () Bool)

(assert (=> b!88332 m!94345))

(declare-fun m!94347 () Bool)

(assert (=> b!88332 m!94347))

(declare-fun m!94349 () Bool)

(assert (=> b!88332 m!94349))

(declare-fun m!94351 () Bool)

(assert (=> b!88332 m!94351))

(declare-fun m!94353 () Bool)

(assert (=> b!88332 m!94353))

(declare-fun m!94355 () Bool)

(assert (=> b!88332 m!94355))

(declare-fun m!94357 () Bool)

(assert (=> b!88332 m!94357))

(assert (=> b!88332 m!94337))

(assert (=> b!88332 m!94345))

(assert (=> b!88332 m!93889))

(assert (=> b!88332 m!94323))

(declare-fun m!94359 () Bool)

(assert (=> b!88332 m!94359))

(assert (=> b!88332 m!94357))

(declare-fun m!94361 () Bool)

(assert (=> b!88332 m!94361))

(assert (=> b!88332 m!94341))

(declare-fun m!94363 () Bool)

(assert (=> b!88332 m!94363))

(declare-fun m!94365 () Bool)

(assert (=> b!88332 m!94365))

(assert (=> b!87942 d!23497))

(declare-fun d!23499 () Bool)

(declare-fun e!57532 () Bool)

(assert (=> d!23499 e!57532))

(declare-fun res!45228 () Bool)

(assert (=> d!23499 (=> (not res!45228) (not e!57532))))

(declare-fun lt!42121 () ListLongMap!1445)

(assert (=> d!23499 (= res!45228 (contains!750 lt!42121 (_1!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun lt!42119 () List!1512)

(assert (=> d!23499 (= lt!42121 (ListLongMap!1446 lt!42119))))

(declare-fun lt!42120 () Unit!2582)

(declare-fun lt!42118 () Unit!2582)

(assert (=> d!23499 (= lt!42120 lt!42118)))

(assert (=> d!23499 (= (getValueByKey!142 lt!42119 (_1!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))) (Some!147 (_2!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(assert (=> d!23499 (= lt!42118 (lemmaContainsTupThenGetReturnValue!59 lt!42119 (_1!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (_2!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(assert (=> d!23499 (= lt!42119 (insertStrictlySorted!62 (toList!738 (ite c!14470 call!8364 (ite c!14474 call!8365 call!8362))) (_1!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (_2!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(assert (=> d!23499 (= (+!109 (ite c!14470 call!8364 (ite c!14474 call!8365 call!8362)) (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!42121)))

(declare-fun b!88339 () Bool)

(declare-fun res!45229 () Bool)

(assert (=> b!88339 (=> (not res!45229) (not e!57532))))

(assert (=> b!88339 (= res!45229 (= (getValueByKey!142 (toList!738 lt!42121) (_1!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))) (Some!147 (_2!1107 (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))))

(declare-fun b!88340 () Bool)

(assert (=> b!88340 (= e!57532 (contains!753 (toList!738 lt!42121) (ite (or c!14470 c!14474) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (= (and d!23499 res!45228) b!88339))

(assert (= (and b!88339 res!45229) b!88340))

(declare-fun m!94367 () Bool)

(assert (=> d!23499 m!94367))

(declare-fun m!94369 () Bool)

(assert (=> d!23499 m!94369))

(declare-fun m!94371 () Bool)

(assert (=> d!23499 m!94371))

(declare-fun m!94373 () Bool)

(assert (=> d!23499 m!94373))

(declare-fun m!94375 () Bool)

(assert (=> b!88339 m!94375))

(declare-fun m!94377 () Bool)

(assert (=> b!88340 m!94377))

(assert (=> bm!8358 d!23499))

(declare-fun b!88375 () Bool)

(declare-fun res!45255 () Bool)

(declare-fun e!57553 () Bool)

(assert (=> b!88375 (=> (not res!45255) (not e!57553))))

(declare-fun lt!42186 () tuple2!2194)

(assert (=> b!88375 (= res!45255 (valid!339 (_2!1108 lt!42186)))))

(declare-fun b!88376 () Bool)

(declare-fun e!57555 () Unit!2582)

(declare-fun Unit!2605 () Unit!2582)

(assert (=> b!88376 (= e!57555 Unit!2605)))

(declare-fun lt!42209 () Unit!2582)

(assert (=> b!88376 (= lt!42209 (lemmaInListMapThenSeekEntryOrOpenFindsIt!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42183 () SeekEntryResult!238)

(declare-fun call!8496 () SeekEntryResult!238)

(assert (=> b!88376 (= lt!42183 call!8496)))

(declare-fun res!45254 () Bool)

(assert (=> b!88376 (= res!45254 ((_ is Found!238) lt!42183))))

(declare-fun e!57551 () Bool)

(assert (=> b!88376 (=> (not res!45254) (not e!57551))))

(assert (=> b!88376 e!57551))

(declare-fun lt!42198 () Unit!2582)

(assert (=> b!88376 (= lt!42198 lt!42209)))

(assert (=> b!88376 false))

(declare-fun b!88377 () Bool)

(declare-fun c!14634 () Bool)

(declare-fun lt!42193 () SeekEntryResult!238)

(assert (=> b!88377 (= c!14634 ((_ is MissingVacant!238) lt!42193))))

(declare-fun e!57550 () Bool)

(declare-fun e!57549 () Bool)

(assert (=> b!88377 (= e!57550 e!57549)))

(declare-fun d!23501 () Bool)

(assert (=> d!23501 e!57553))

(declare-fun res!45248 () Bool)

(assert (=> d!23501 (=> (not res!45248) (not e!57553))))

(assert (=> d!23501 (= res!45248 (_1!1108 lt!42186))))

(assert (=> d!23501 (= lt!42186 (tuple2!2195 true (LongMapFixedSize!761 (defaultEntry!2358 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (bvadd (_size!429 newMap!16) #b00000000000000000000000000000001) (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16))) (_vacant!429 newMap!16))))))

(declare-fun lt!42202 () Unit!2582)

(declare-fun lt!42190 () Unit!2582)

(assert (=> d!23501 (= lt!42202 lt!42190)))

(declare-fun lt!42204 () array!4027)

(declare-fun lt!42205 () array!4025)

(assert (=> d!23501 (contains!750 (getCurrentListMap!431 lt!42205 lt!42204 (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866))))))

(assert (=> d!23501 (= lt!42190 (lemmaValidKeyInArrayIsInListMap!92 lt!42205 lt!42204 (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23501 (= lt!42204 (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16))))))

(assert (=> d!23501 (= lt!42205 (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))))))

(declare-fun lt!42196 () Unit!2582)

(declare-fun lt!42210 () Unit!2582)

(assert (=> d!23501 (= lt!42196 lt!42210)))

(declare-fun lt!42200 () array!4025)

(assert (=> d!23501 (= (arrayCountValidKeys!0 lt!42200 (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (bvadd (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4025 (_ BitVec 32)) Unit!2582)

(assert (=> d!23501 (= lt!42210 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!42200 (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866))))))

(assert (=> d!23501 (= lt!42200 (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))))))

(declare-fun lt!42189 () Unit!2582)

(declare-fun lt!42207 () Unit!2582)

(assert (=> d!23501 (= lt!42189 lt!42207)))

(declare-fun lt!42188 () array!4025)

(assert (=> d!23501 (arrayContainsKey!0 lt!42188 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!23501 (= lt!42207 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!42188 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866))))))

(assert (=> d!23501 (= lt!42188 (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))))))

(declare-fun lt!42206 () Unit!2582)

(declare-fun lt!42185 () Unit!2582)

(assert (=> d!23501 (= lt!42206 lt!42185)))

(assert (=> d!23501 (= (+!109 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (getCurrentListMap!431 (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16))) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!20 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) (_ BitVec 64) V!3033 Int) Unit!2582)

(assert (=> d!23501 (= lt!42185 (lemmaAddValidKeyToArrayThenAddPairToListMap!20 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42195 () Unit!2582)

(declare-fun lt!42182 () Unit!2582)

(assert (=> d!23501 (= lt!42195 lt!42182)))

(assert (=> d!23501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))) (mask!6396 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4025 (_ BitVec 32) (_ BitVec 32)) Unit!2582)

(assert (=> d!23501 (= lt!42182 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (mask!6396 newMap!16)))))

(declare-fun lt!42197 () Unit!2582)

(declare-fun lt!42187 () Unit!2582)

(assert (=> d!23501 (= lt!42197 lt!42187)))

(assert (=> d!23501 (= (arrayCountValidKeys!0 (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))) #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4034 newMap!16) #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4025 (_ BitVec 32) (_ BitVec 64)) Unit!2582)

(assert (=> d!23501 (= lt!42187 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4034 newMap!16) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun lt!42211 () Unit!2582)

(declare-fun lt!42201 () Unit!2582)

(assert (=> d!23501 (= lt!42211 lt!42201)))

(declare-fun lt!42194 () (_ BitVec 32))

(declare-fun lt!42208 () List!1511)

(assert (=> d!23501 (arrayNoDuplicates!0 (array!4026 (store (arr!1916 (_keys!4034 newMap!16)) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (size!2161 (_keys!4034 newMap!16))) lt!42194 lt!42208)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4025 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1511) Unit!2582)

(assert (=> d!23501 (= lt!42201 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4034 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866)) lt!42194 lt!42208))))

(assert (=> d!23501 (= lt!42208 Nil!1508)))

(assert (=> d!23501 (= lt!42194 #b00000000000000000000000000000000)))

(declare-fun lt!42191 () Unit!2582)

(declare-fun e!57554 () Unit!2582)

(assert (=> d!23501 (= lt!42191 e!57554)))

(declare-fun c!14633 () Bool)

(assert (=> d!23501 (= c!14633 (arrayContainsKey!0 (_keys!4034 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!42192 () Unit!2582)

(assert (=> d!23501 (= lt!42192 e!57555)))

(declare-fun c!14631 () Bool)

(assert (=> d!23501 (= c!14631 (contains!750 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23501 (valid!339 newMap!16)))

(assert (=> d!23501 (= (updateHelperNewKey!32 newMap!16 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 (ite c!14513 (index!3093 lt!41866) (index!3090 lt!41866))) lt!42186)))

(declare-fun b!88378 () Bool)

(declare-fun res!45252 () Bool)

(declare-fun call!8498 () Bool)

(assert (=> b!88378 (= res!45252 call!8498)))

(assert (=> b!88378 (=> (not res!45252) (not e!57551))))

(declare-fun bm!8492 () Bool)

(assert (=> bm!8492 (= call!8496 (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(declare-fun b!88379 () Bool)

(declare-fun res!45250 () Bool)

(declare-fun e!57556 () Bool)

(assert (=> b!88379 (=> (not res!45250) (not e!57556))))

(assert (=> b!88379 (= res!45250 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3090 lt!42193)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88380 () Bool)

(declare-fun res!45256 () Bool)

(assert (=> b!88380 (=> (not res!45256) (not e!57556))))

(declare-fun call!8497 () Bool)

(assert (=> b!88380 (= res!45256 call!8497)))

(assert (=> b!88380 (= e!57550 e!57556)))

(declare-fun b!88381 () Bool)

(declare-fun e!57552 () Bool)

(declare-fun call!8495 () Bool)

(assert (=> b!88381 (= e!57552 (not call!8495))))

(declare-fun b!88382 () Bool)

(declare-fun res!45251 () Bool)

(assert (=> b!88382 (= res!45251 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3093 lt!42193)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88382 (=> (not res!45251) (not e!57552))))

(declare-fun b!88383 () Bool)

(declare-fun res!45249 () Bool)

(assert (=> b!88383 (=> (not res!45249) (not e!57553))))

(assert (=> b!88383 (= res!45249 (contains!750 (map!1199 (_2!1108 lt!42186)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!88384 () Bool)

(assert (=> b!88384 (= e!57551 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!42183)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun bm!8493 () Bool)

(assert (=> bm!8493 (= call!8497 call!8498)))

(declare-fun b!88385 () Bool)

(assert (=> b!88385 (= e!57549 e!57552)))

(declare-fun res!45253 () Bool)

(assert (=> b!88385 (= res!45253 call!8497)))

(assert (=> b!88385 (=> (not res!45253) (not e!57552))))

(declare-fun bm!8494 () Bool)

(assert (=> bm!8494 (= call!8495 (arrayContainsKey!0 (_keys!4034 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!88386 () Bool)

(declare-fun Unit!2606 () Unit!2582)

(assert (=> b!88386 (= e!57554 Unit!2606)))

(declare-fun b!88387 () Bool)

(assert (=> b!88387 (= e!57556 (not call!8495))))

(declare-fun b!88388 () Bool)

(assert (=> b!88388 (= e!57553 (= (map!1199 (_2!1108 lt!42186)) (+!109 (map!1199 newMap!16) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun b!88389 () Bool)

(declare-fun Unit!2607 () Unit!2582)

(assert (=> b!88389 (= e!57554 Unit!2607)))

(declare-fun lt!42203 () Unit!2582)

(declare-fun lemmaArrayContainsKeyThenInListMap!20 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) (_ BitVec 32) Int) Unit!2582)

(assert (=> b!88389 (= lt!42203 (lemmaArrayContainsKeyThenInListMap!20 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(assert (=> b!88389 (contains!750 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))

(declare-fun lt!42184 () Unit!2582)

(assert (=> b!88389 (= lt!42184 lt!42203)))

(assert (=> b!88389 false))

(declare-fun c!14632 () Bool)

(declare-fun bm!8495 () Bool)

(assert (=> bm!8495 (= call!8498 (inRange!0 (ite c!14631 (index!3091 lt!42183) (ite c!14632 (index!3090 lt!42193) (index!3093 lt!42193))) (mask!6396 newMap!16)))))

(declare-fun b!88390 () Bool)

(declare-fun lt!42199 () Unit!2582)

(assert (=> b!88390 (= e!57555 lt!42199)))

(assert (=> b!88390 (= lt!42199 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(assert (=> b!88390 (= lt!42193 call!8496)))

(assert (=> b!88390 (= c!14632 ((_ is MissingZero!238) lt!42193))))

(assert (=> b!88390 e!57550))

(declare-fun b!88391 () Bool)

(assert (=> b!88391 (= e!57549 ((_ is Undefined!238) lt!42193))))

(assert (= (and d!23501 c!14631) b!88376))

(assert (= (and d!23501 (not c!14631)) b!88390))

(assert (= (and b!88376 res!45254) b!88378))

(assert (= (and b!88378 res!45252) b!88384))

(assert (= (and b!88390 c!14632) b!88380))

(assert (= (and b!88390 (not c!14632)) b!88377))

(assert (= (and b!88380 res!45256) b!88379))

(assert (= (and b!88379 res!45250) b!88387))

(assert (= (and b!88377 c!14634) b!88385))

(assert (= (and b!88377 (not c!14634)) b!88391))

(assert (= (and b!88385 res!45253) b!88382))

(assert (= (and b!88382 res!45251) b!88381))

(assert (= (or b!88380 b!88385) bm!8493))

(assert (= (or b!88387 b!88381) bm!8494))

(assert (= (or b!88378 bm!8493) bm!8495))

(assert (= (or b!88376 b!88390) bm!8492))

(assert (= (and d!23501 c!14633) b!88389))

(assert (= (and d!23501 (not c!14633)) b!88386))

(assert (= (and d!23501 res!45248) b!88375))

(assert (= (and b!88375 res!45255) b!88383))

(assert (= (and b!88383 res!45249) b!88388))

(assert (=> d!23501 m!93405))

(declare-fun m!94379 () Bool)

(assert (=> d!23501 m!94379))

(assert (=> d!23501 m!93457))

(declare-fun m!94381 () Bool)

(assert (=> d!23501 m!94381))

(assert (=> d!23501 m!93405))

(declare-fun m!94383 () Bool)

(assert (=> d!23501 m!94383))

(assert (=> d!23501 m!93405))

(declare-fun m!94385 () Bool)

(assert (=> d!23501 m!94385))

(declare-fun m!94387 () Bool)

(assert (=> d!23501 m!94387))

(assert (=> d!23501 m!93405))

(assert (=> d!23501 m!93713))

(declare-fun m!94389 () Bool)

(assert (=> d!23501 m!94389))

(declare-fun m!94391 () Bool)

(assert (=> d!23501 m!94391))

(assert (=> d!23501 m!93755))

(assert (=> d!23501 m!93603))

(declare-fun m!94393 () Bool)

(assert (=> d!23501 m!94393))

(declare-fun m!94395 () Bool)

(assert (=> d!23501 m!94395))

(assert (=> d!23501 m!93603))

(declare-fun m!94397 () Bool)

(assert (=> d!23501 m!94397))

(assert (=> d!23501 m!93405))

(declare-fun m!94399 () Bool)

(assert (=> d!23501 m!94399))

(assert (=> d!23501 m!93603))

(assert (=> d!23501 m!93405))

(assert (=> d!23501 m!93705))

(declare-fun m!94401 () Bool)

(assert (=> d!23501 m!94401))

(assert (=> d!23501 m!93405))

(declare-fun m!94403 () Bool)

(assert (=> d!23501 m!94403))

(declare-fun m!94405 () Bool)

(assert (=> d!23501 m!94405))

(declare-fun m!94407 () Bool)

(assert (=> d!23501 m!94407))

(declare-fun m!94409 () Bool)

(assert (=> d!23501 m!94409))

(assert (=> d!23501 m!94397))

(assert (=> d!23501 m!94409))

(declare-fun m!94411 () Bool)

(assert (=> d!23501 m!94411))

(declare-fun m!94413 () Bool)

(assert (=> d!23501 m!94413))

(assert (=> d!23501 m!93405))

(declare-fun m!94415 () Bool)

(assert (=> d!23501 m!94415))

(assert (=> b!88376 m!93405))

(assert (=> b!88376 m!93711))

(declare-fun m!94417 () Bool)

(assert (=> b!88383 m!94417))

(assert (=> b!88383 m!94417))

(assert (=> b!88383 m!93405))

(declare-fun m!94419 () Bool)

(assert (=> b!88383 m!94419))

(declare-fun m!94421 () Bool)

(assert (=> b!88382 m!94421))

(declare-fun m!94423 () Bool)

(assert (=> b!88379 m!94423))

(declare-fun m!94425 () Bool)

(assert (=> bm!8495 m!94425))

(assert (=> b!88389 m!93405))

(declare-fun m!94427 () Bool)

(assert (=> b!88389 m!94427))

(assert (=> b!88389 m!93603))

(assert (=> b!88389 m!93603))

(assert (=> b!88389 m!93405))

(assert (=> b!88389 m!93705))

(declare-fun m!94429 () Bool)

(assert (=> b!88375 m!94429))

(assert (=> b!88390 m!93405))

(assert (=> b!88390 m!93667))

(assert (=> bm!8494 m!93405))

(assert (=> bm!8494 m!93713))

(declare-fun m!94431 () Bool)

(assert (=> b!88384 m!94431))

(assert (=> b!88388 m!94417))

(assert (=> b!88388 m!93459))

(assert (=> b!88388 m!93459))

(declare-fun m!94433 () Bool)

(assert (=> b!88388 m!94433))

(assert (=> bm!8492 m!93405))

(assert (=> bm!8492 m!93699))

(assert (=> bm!8416 d!23501))

(declare-fun d!23503 () Bool)

(declare-fun e!57557 () Bool)

(assert (=> d!23503 e!57557))

(declare-fun res!45257 () Bool)

(assert (=> d!23503 (=> (not res!45257) (not e!57557))))

(declare-fun lt!42215 () ListLongMap!1445)

(assert (=> d!23503 (= res!45257 (contains!750 lt!42215 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(declare-fun lt!42213 () List!1512)

(assert (=> d!23503 (= lt!42215 (ListLongMap!1446 lt!42213))))

(declare-fun lt!42214 () Unit!2582)

(declare-fun lt!42212 () Unit!2582)

(assert (=> d!23503 (= lt!42214 lt!42212)))

(assert (=> d!23503 (= (getValueByKey!142 lt!42213 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23503 (= lt!42212 (lemmaContainsTupThenGetReturnValue!59 lt!42213 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23503 (= lt!42213 (insertStrictlySorted!62 (toList!738 call!8430) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))))))

(assert (=> d!23503 (= (+!109 call!8430 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) lt!42215)))

(declare-fun b!88392 () Bool)

(declare-fun res!45258 () Bool)

(assert (=> b!88392 (=> (not res!45258) (not e!57557))))

(assert (=> b!88392 (= res!45258 (= (getValueByKey!142 (toList!738 lt!42215) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))))

(declare-fun b!88393 () Bool)

(assert (=> b!88393 (= e!57557 (contains!753 (toList!738 lt!42215) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)))))

(assert (= (and d!23503 res!45257) b!88392))

(assert (= (and b!88392 res!45258) b!88393))

(declare-fun m!94435 () Bool)

(assert (=> d!23503 m!94435))

(declare-fun m!94437 () Bool)

(assert (=> d!23503 m!94437))

(declare-fun m!94439 () Bool)

(assert (=> d!23503 m!94439))

(declare-fun m!94441 () Bool)

(assert (=> d!23503 m!94441))

(declare-fun m!94443 () Bool)

(assert (=> b!88392 m!94443))

(declare-fun m!94445 () Bool)

(assert (=> b!88393 m!94445))

(assert (=> b!87928 d!23503))

(assert (=> b!88044 d!23447))

(declare-fun d!23505 () Bool)

(declare-fun e!57559 () Bool)

(assert (=> d!23505 e!57559))

(declare-fun res!45259 () Bool)

(assert (=> d!23505 (=> res!45259 e!57559)))

(declare-fun lt!42216 () Bool)

(assert (=> d!23505 (= res!45259 (not lt!42216))))

(declare-fun lt!42217 () Bool)

(assert (=> d!23505 (= lt!42216 lt!42217)))

(declare-fun lt!42218 () Unit!2582)

(declare-fun e!57558 () Unit!2582)

(assert (=> d!23505 (= lt!42218 e!57558)))

(declare-fun c!14635 () Bool)

(assert (=> d!23505 (= c!14635 lt!42217)))

(assert (=> d!23505 (= lt!42217 (containsKey!145 (toList!738 (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938))) lt!41939))))

(assert (=> d!23505 (= (contains!750 (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938)) lt!41939) lt!42216)))

(declare-fun b!88394 () Bool)

(declare-fun lt!42219 () Unit!2582)

(assert (=> b!88394 (= e!57558 lt!42219)))

(assert (=> b!88394 (= lt!42219 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938))) lt!41939))))

(assert (=> b!88394 (isDefined!94 (getValueByKey!142 (toList!738 (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938))) lt!41939))))

(declare-fun b!88395 () Bool)

(declare-fun Unit!2608 () Unit!2582)

(assert (=> b!88395 (= e!57558 Unit!2608)))

(declare-fun b!88396 () Bool)

(assert (=> b!88396 (= e!57559 (isDefined!94 (getValueByKey!142 (toList!738 (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938))) lt!41939)))))

(assert (= (and d!23505 c!14635) b!88394))

(assert (= (and d!23505 (not c!14635)) b!88395))

(assert (= (and d!23505 (not res!45259)) b!88396))

(declare-fun m!94447 () Bool)

(assert (=> d!23505 m!94447))

(declare-fun m!94449 () Bool)

(assert (=> b!88394 m!94449))

(declare-fun m!94451 () Bool)

(assert (=> b!88394 m!94451))

(assert (=> b!88394 m!94451))

(declare-fun m!94453 () Bool)

(assert (=> b!88394 m!94453))

(assert (=> b!88396 m!94451))

(assert (=> b!88396 m!94451))

(assert (=> b!88396 m!94453))

(assert (=> b!88044 d!23505))

(declare-fun d!23507 () Bool)

(assert (=> d!23507 (not (contains!750 (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938)) lt!41939))))

(declare-fun lt!42222 () Unit!2582)

(declare-fun choose!525 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2582)

(assert (=> d!23507 (= lt!42222 (choose!525 lt!41937 lt!41936 lt!41938 lt!41939))))

(declare-fun e!57562 () Bool)

(assert (=> d!23507 e!57562))

(declare-fun res!45262 () Bool)

(assert (=> d!23507 (=> (not res!45262) (not e!57562))))

(assert (=> d!23507 (= res!45262 (not (contains!750 lt!41937 lt!41939)))))

(assert (=> d!23507 (= (addStillNotContains!34 lt!41937 lt!41936 lt!41938 lt!41939) lt!42222)))

(declare-fun b!88400 () Bool)

(assert (=> b!88400 (= e!57562 (not (= lt!41936 lt!41939)))))

(assert (= (and d!23507 res!45262) b!88400))

(assert (=> d!23507 m!93807))

(assert (=> d!23507 m!93807))

(assert (=> d!23507 m!93809))

(declare-fun m!94455 () Bool)

(assert (=> d!23507 m!94455))

(declare-fun m!94457 () Bool)

(assert (=> d!23507 m!94457))

(assert (=> b!88044 d!23507))

(declare-fun d!23509 () Bool)

(declare-fun e!57563 () Bool)

(assert (=> d!23509 e!57563))

(declare-fun res!45263 () Bool)

(assert (=> d!23509 (=> (not res!45263) (not e!57563))))

(declare-fun lt!42226 () ListLongMap!1445)

(assert (=> d!23509 (= res!45263 (contains!750 lt!42226 (_1!1107 (tuple2!2193 lt!41936 lt!41938))))))

(declare-fun lt!42224 () List!1512)

(assert (=> d!23509 (= lt!42226 (ListLongMap!1446 lt!42224))))

(declare-fun lt!42225 () Unit!2582)

(declare-fun lt!42223 () Unit!2582)

(assert (=> d!23509 (= lt!42225 lt!42223)))

(assert (=> d!23509 (= (getValueByKey!142 lt!42224 (_1!1107 (tuple2!2193 lt!41936 lt!41938))) (Some!147 (_2!1107 (tuple2!2193 lt!41936 lt!41938))))))

(assert (=> d!23509 (= lt!42223 (lemmaContainsTupThenGetReturnValue!59 lt!42224 (_1!1107 (tuple2!2193 lt!41936 lt!41938)) (_2!1107 (tuple2!2193 lt!41936 lt!41938))))))

(assert (=> d!23509 (= lt!42224 (insertStrictlySorted!62 (toList!738 lt!41937) (_1!1107 (tuple2!2193 lt!41936 lt!41938)) (_2!1107 (tuple2!2193 lt!41936 lt!41938))))))

(assert (=> d!23509 (= (+!109 lt!41937 (tuple2!2193 lt!41936 lt!41938)) lt!42226)))

(declare-fun b!88401 () Bool)

(declare-fun res!45264 () Bool)

(assert (=> b!88401 (=> (not res!45264) (not e!57563))))

(assert (=> b!88401 (= res!45264 (= (getValueByKey!142 (toList!738 lt!42226) (_1!1107 (tuple2!2193 lt!41936 lt!41938))) (Some!147 (_2!1107 (tuple2!2193 lt!41936 lt!41938)))))))

(declare-fun b!88402 () Bool)

(assert (=> b!88402 (= e!57563 (contains!753 (toList!738 lt!42226) (tuple2!2193 lt!41936 lt!41938)))))

(assert (= (and d!23509 res!45263) b!88401))

(assert (= (and b!88401 res!45264) b!88402))

(declare-fun m!94459 () Bool)

(assert (=> d!23509 m!94459))

(declare-fun m!94461 () Bool)

(assert (=> d!23509 m!94461))

(declare-fun m!94463 () Bool)

(assert (=> d!23509 m!94463))

(declare-fun m!94465 () Bool)

(assert (=> d!23509 m!94465))

(declare-fun m!94467 () Bool)

(assert (=> b!88401 m!94467))

(declare-fun m!94469 () Bool)

(assert (=> b!88402 m!94469))

(assert (=> b!88044 d!23509))

(declare-fun d!23511 () Bool)

(declare-fun e!57564 () Bool)

(assert (=> d!23511 e!57564))

(declare-fun res!45265 () Bool)

(assert (=> d!23511 (=> (not res!45265) (not e!57564))))

(declare-fun lt!42230 () ListLongMap!1445)

(assert (=> d!23511 (= res!45265 (contains!750 lt!42230 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!42228 () List!1512)

(assert (=> d!23511 (= lt!42230 (ListLongMap!1446 lt!42228))))

(declare-fun lt!42229 () Unit!2582)

(declare-fun lt!42227 () Unit!2582)

(assert (=> d!23511 (= lt!42229 lt!42227)))

(assert (=> d!23511 (= (getValueByKey!142 lt!42228 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23511 (= lt!42227 (lemmaContainsTupThenGetReturnValue!59 lt!42228 (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23511 (= lt!42228 (insertStrictlySorted!62 (toList!738 call!8448) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23511 (= (+!109 call!8448 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!42230)))

(declare-fun b!88403 () Bool)

(declare-fun res!45266 () Bool)

(assert (=> b!88403 (=> (not res!45266) (not e!57564))))

(assert (=> b!88403 (= res!45266 (= (getValueByKey!142 (toList!738 lt!42230) (_1!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!147 (_2!1107 (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!88404 () Bool)

(assert (=> b!88404 (= e!57564 (contains!753 (toList!738 lt!42230) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1210 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!23511 res!45265) b!88403))

(assert (= (and b!88403 res!45266) b!88404))

(declare-fun m!94471 () Bool)

(assert (=> d!23511 m!94471))

(declare-fun m!94473 () Bool)

(assert (=> d!23511 m!94473))

(declare-fun m!94475 () Bool)

(assert (=> d!23511 m!94475))

(declare-fun m!94477 () Bool)

(assert (=> d!23511 m!94477))

(declare-fun m!94479 () Bool)

(assert (=> b!88403 m!94479))

(declare-fun m!94481 () Bool)

(assert (=> b!88404 m!94481))

(assert (=> b!88044 d!23511))

(declare-fun d!23513 () Bool)

(declare-fun e!57566 () Bool)

(assert (=> d!23513 e!57566))

(declare-fun res!45267 () Bool)

(assert (=> d!23513 (=> res!45267 e!57566)))

(declare-fun lt!42231 () Bool)

(assert (=> d!23513 (= res!45267 (not lt!42231))))

(declare-fun lt!42232 () Bool)

(assert (=> d!23513 (= lt!42231 lt!42232)))

(declare-fun lt!42233 () Unit!2582)

(declare-fun e!57565 () Unit!2582)

(assert (=> d!23513 (= lt!42233 e!57565)))

(declare-fun c!14636 () Bool)

(assert (=> d!23513 (= c!14636 lt!42232)))

(assert (=> d!23513 (= lt!42232 (containsKey!145 (toList!738 e!57284) (ite c!14510 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41866)))))))

(assert (=> d!23513 (= (contains!750 e!57284 (ite c!14510 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41866)))) lt!42231)))

(declare-fun b!88405 () Bool)

(declare-fun lt!42234 () Unit!2582)

(assert (=> b!88405 (= e!57565 lt!42234)))

(assert (=> b!88405 (= lt!42234 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 e!57284) (ite c!14510 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41866)))))))

(assert (=> b!88405 (isDefined!94 (getValueByKey!142 (toList!738 e!57284) (ite c!14510 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41866)))))))

(declare-fun b!88406 () Bool)

(declare-fun Unit!2609 () Unit!2582)

(assert (=> b!88406 (= e!57565 Unit!2609)))

(declare-fun b!88407 () Bool)

(assert (=> b!88407 (= e!57566 (isDefined!94 (getValueByKey!142 (toList!738 e!57284) (ite c!14510 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41866))))))))

(assert (= (and d!23513 c!14636) b!88405))

(assert (= (and d!23513 (not c!14636)) b!88406))

(assert (= (and d!23513 (not res!45267)) b!88407))

(declare-fun m!94483 () Bool)

(assert (=> d!23513 m!94483))

(declare-fun m!94485 () Bool)

(assert (=> b!88405 m!94485))

(declare-fun m!94487 () Bool)

(assert (=> b!88405 m!94487))

(assert (=> b!88405 m!94487))

(declare-fun m!94489 () Bool)

(assert (=> b!88405 m!94489))

(assert (=> b!88407 m!94487))

(assert (=> b!88407 m!94487))

(assert (=> b!88407 m!94489))

(assert (=> bm!8434 d!23513))

(declare-fun b!88411 () Bool)

(declare-fun e!57568 () Option!148)

(assert (=> b!88411 (= e!57568 None!146)))

(declare-fun b!88410 () Bool)

(assert (=> b!88410 (= e!57568 (getValueByKey!142 (t!5246 (toList!738 lt!41911)) (_1!1107 lt!41611)))))

(declare-fun b!88409 () Bool)

(declare-fun e!57567 () Option!148)

(assert (=> b!88409 (= e!57567 e!57568)))

(declare-fun c!14638 () Bool)

(assert (=> b!88409 (= c!14638 (and ((_ is Cons!1508) (toList!738 lt!41911)) (not (= (_1!1107 (h!2100 (toList!738 lt!41911))) (_1!1107 lt!41611)))))))

(declare-fun b!88408 () Bool)

(assert (=> b!88408 (= e!57567 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41911)))))))

(declare-fun d!23515 () Bool)

(declare-fun c!14637 () Bool)

(assert (=> d!23515 (= c!14637 (and ((_ is Cons!1508) (toList!738 lt!41911)) (= (_1!1107 (h!2100 (toList!738 lt!41911))) (_1!1107 lt!41611))))))

(assert (=> d!23515 (= (getValueByKey!142 (toList!738 lt!41911) (_1!1107 lt!41611)) e!57567)))

(assert (= (and d!23515 c!14637) b!88408))

(assert (= (and d!23515 (not c!14637)) b!88409))

(assert (= (and b!88409 c!14638) b!88410))

(assert (= (and b!88409 (not c!14638)) b!88411))

(declare-fun m!94491 () Bool)

(assert (=> b!88410 m!94491))

(assert (=> b!88014 d!23515))

(declare-fun d!23517 () Bool)

(declare-fun e!57570 () Bool)

(assert (=> d!23517 e!57570))

(declare-fun res!45268 () Bool)

(assert (=> d!23517 (=> res!45268 e!57570)))

(declare-fun lt!42235 () Bool)

(assert (=> d!23517 (= res!45268 (not lt!42235))))

(declare-fun lt!42236 () Bool)

(assert (=> d!23517 (= lt!42235 lt!42236)))

(declare-fun lt!42237 () Unit!2582)

(declare-fun e!57569 () Unit!2582)

(assert (=> d!23517 (= lt!42237 e!57569)))

(declare-fun c!14639 () Bool)

(assert (=> d!23517 (= c!14639 lt!42236)))

(assert (=> d!23517 (= lt!42236 (containsKey!145 (toList!738 lt!41918) (_1!1107 lt!41611)))))

(assert (=> d!23517 (= (contains!750 lt!41918 (_1!1107 lt!41611)) lt!42235)))

(declare-fun b!88412 () Bool)

(declare-fun lt!42238 () Unit!2582)

(assert (=> b!88412 (= e!57569 lt!42238)))

(assert (=> b!88412 (= lt!42238 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41918) (_1!1107 lt!41611)))))

(assert (=> b!88412 (isDefined!94 (getValueByKey!142 (toList!738 lt!41918) (_1!1107 lt!41611)))))

(declare-fun b!88413 () Bool)

(declare-fun Unit!2610 () Unit!2582)

(assert (=> b!88413 (= e!57569 Unit!2610)))

(declare-fun b!88414 () Bool)

(assert (=> b!88414 (= e!57570 (isDefined!94 (getValueByKey!142 (toList!738 lt!41918) (_1!1107 lt!41611))))))

(assert (= (and d!23517 c!14639) b!88412))

(assert (= (and d!23517 (not c!14639)) b!88413))

(assert (= (and d!23517 (not res!45268)) b!88414))

(declare-fun m!94493 () Bool)

(assert (=> d!23517 m!94493))

(declare-fun m!94495 () Bool)

(assert (=> b!88412 m!94495))

(assert (=> b!88412 m!93791))

(assert (=> b!88412 m!93791))

(declare-fun m!94497 () Bool)

(assert (=> b!88412 m!94497))

(assert (=> b!88414 m!93791))

(assert (=> b!88414 m!93791))

(assert (=> b!88414 m!94497))

(assert (=> d!23371 d!23517))

(declare-fun b!88418 () Bool)

(declare-fun e!57572 () Option!148)

(assert (=> b!88418 (= e!57572 None!146)))

(declare-fun b!88417 () Bool)

(assert (=> b!88417 (= e!57572 (getValueByKey!142 (t!5246 lt!41916) (_1!1107 lt!41611)))))

(declare-fun b!88416 () Bool)

(declare-fun e!57571 () Option!148)

(assert (=> b!88416 (= e!57571 e!57572)))

(declare-fun c!14641 () Bool)

(assert (=> b!88416 (= c!14641 (and ((_ is Cons!1508) lt!41916) (not (= (_1!1107 (h!2100 lt!41916)) (_1!1107 lt!41611)))))))

(declare-fun b!88415 () Bool)

(assert (=> b!88415 (= e!57571 (Some!147 (_2!1107 (h!2100 lt!41916))))))

(declare-fun d!23519 () Bool)

(declare-fun c!14640 () Bool)

(assert (=> d!23519 (= c!14640 (and ((_ is Cons!1508) lt!41916) (= (_1!1107 (h!2100 lt!41916)) (_1!1107 lt!41611))))))

(assert (=> d!23519 (= (getValueByKey!142 lt!41916 (_1!1107 lt!41611)) e!57571)))

(assert (= (and d!23519 c!14640) b!88415))

(assert (= (and d!23519 (not c!14640)) b!88416))

(assert (= (and b!88416 c!14641) b!88417))

(assert (= (and b!88416 (not c!14641)) b!88418))

(declare-fun m!94499 () Bool)

(assert (=> b!88417 m!94499))

(assert (=> d!23371 d!23519))

(declare-fun d!23521 () Bool)

(assert (=> d!23521 (= (getValueByKey!142 lt!41916 (_1!1107 lt!41611)) (Some!147 (_2!1107 lt!41611)))))

(declare-fun lt!42239 () Unit!2582)

(assert (=> d!23521 (= lt!42239 (choose!524 lt!41916 (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(declare-fun e!57573 () Bool)

(assert (=> d!23521 e!57573))

(declare-fun res!45269 () Bool)

(assert (=> d!23521 (=> (not res!45269) (not e!57573))))

(assert (=> d!23521 (= res!45269 (isStrictlySorted!286 lt!41916))))

(assert (=> d!23521 (= (lemmaContainsTupThenGetReturnValue!59 lt!41916 (_1!1107 lt!41611) (_2!1107 lt!41611)) lt!42239)))

(declare-fun b!88419 () Bool)

(declare-fun res!45270 () Bool)

(assert (=> b!88419 (=> (not res!45270) (not e!57573))))

(assert (=> b!88419 (= res!45270 (containsKey!145 lt!41916 (_1!1107 lt!41611)))))

(declare-fun b!88420 () Bool)

(assert (=> b!88420 (= e!57573 (contains!753 lt!41916 (tuple2!2193 (_1!1107 lt!41611) (_2!1107 lt!41611))))))

(assert (= (and d!23521 res!45269) b!88419))

(assert (= (and b!88419 res!45270) b!88420))

(assert (=> d!23521 m!93785))

(declare-fun m!94501 () Bool)

(assert (=> d!23521 m!94501))

(declare-fun m!94503 () Bool)

(assert (=> d!23521 m!94503))

(declare-fun m!94505 () Bool)

(assert (=> b!88419 m!94505))

(declare-fun m!94507 () Bool)

(assert (=> b!88420 m!94507))

(assert (=> d!23371 d!23521))

(declare-fun b!88421 () Bool)

(declare-fun e!57575 () List!1512)

(declare-fun call!8500 () List!1512)

(assert (=> b!88421 (= e!57575 call!8500)))

(declare-fun b!88422 () Bool)

(declare-fun res!45271 () Bool)

(declare-fun e!57577 () Bool)

(assert (=> b!88422 (=> (not res!45271) (not e!57577))))

(declare-fun lt!42240 () List!1512)

(assert (=> b!88422 (= res!45271 (containsKey!145 lt!42240 (_1!1107 lt!41611)))))

(declare-fun b!88423 () Bool)

(assert (=> b!88423 (= e!57577 (contains!753 lt!42240 (tuple2!2193 (_1!1107 lt!41611) (_2!1107 lt!41611))))))

(declare-fun c!14645 () Bool)

(declare-fun bm!8496 () Bool)

(declare-fun e!57576 () List!1512)

(declare-fun call!8499 () List!1512)

(assert (=> bm!8496 (= call!8499 ($colon$colon!72 e!57576 (ite c!14645 (h!2100 (toList!738 lt!41599)) (tuple2!2193 (_1!1107 lt!41611) (_2!1107 lt!41611)))))))

(declare-fun c!14642 () Bool)

(assert (=> bm!8496 (= c!14642 c!14645)))

(declare-fun c!14644 () Bool)

(declare-fun b!88424 () Bool)

(declare-fun c!14643 () Bool)

(assert (=> b!88424 (= e!57576 (ite c!14643 (t!5246 (toList!738 lt!41599)) (ite c!14644 (Cons!1508 (h!2100 (toList!738 lt!41599)) (t!5246 (toList!738 lt!41599))) Nil!1509)))))

(declare-fun b!88425 () Bool)

(assert (=> b!88425 (= e!57576 (insertStrictlySorted!62 (t!5246 (toList!738 lt!41599)) (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(declare-fun b!88426 () Bool)

(declare-fun e!57578 () List!1512)

(declare-fun e!57574 () List!1512)

(assert (=> b!88426 (= e!57578 e!57574)))

(assert (=> b!88426 (= c!14643 (and ((_ is Cons!1508) (toList!738 lt!41599)) (= (_1!1107 (h!2100 (toList!738 lt!41599))) (_1!1107 lt!41611))))))

(declare-fun b!88427 () Bool)

(declare-fun call!8501 () List!1512)

(assert (=> b!88427 (= e!57574 call!8501)))

(declare-fun bm!8498 () Bool)

(assert (=> bm!8498 (= call!8501 call!8499)))

(declare-fun b!88428 () Bool)

(assert (=> b!88428 (= c!14644 (and ((_ is Cons!1508) (toList!738 lt!41599)) (bvsgt (_1!1107 (h!2100 (toList!738 lt!41599))) (_1!1107 lt!41611))))))

(assert (=> b!88428 (= e!57574 e!57575)))

(declare-fun b!88429 () Bool)

(assert (=> b!88429 (= e!57578 call!8499)))

(declare-fun b!88430 () Bool)

(assert (=> b!88430 (= e!57575 call!8500)))

(declare-fun d!23523 () Bool)

(assert (=> d!23523 e!57577))

(declare-fun res!45272 () Bool)

(assert (=> d!23523 (=> (not res!45272) (not e!57577))))

(assert (=> d!23523 (= res!45272 (isStrictlySorted!286 lt!42240))))

(assert (=> d!23523 (= lt!42240 e!57578)))

(assert (=> d!23523 (= c!14645 (and ((_ is Cons!1508) (toList!738 lt!41599)) (bvslt (_1!1107 (h!2100 (toList!738 lt!41599))) (_1!1107 lt!41611))))))

(assert (=> d!23523 (isStrictlySorted!286 (toList!738 lt!41599))))

(assert (=> d!23523 (= (insertStrictlySorted!62 (toList!738 lt!41599) (_1!1107 lt!41611) (_2!1107 lt!41611)) lt!42240)))

(declare-fun bm!8497 () Bool)

(assert (=> bm!8497 (= call!8500 call!8501)))

(assert (= (and d!23523 c!14645) b!88429))

(assert (= (and d!23523 (not c!14645)) b!88426))

(assert (= (and b!88426 c!14643) b!88427))

(assert (= (and b!88426 (not c!14643)) b!88428))

(assert (= (and b!88428 c!14644) b!88421))

(assert (= (and b!88428 (not c!14644)) b!88430))

(assert (= (or b!88421 b!88430) bm!8497))

(assert (= (or b!88427 bm!8497) bm!8498))

(assert (= (or b!88429 bm!8498) bm!8496))

(assert (= (and bm!8496 c!14642) b!88425))

(assert (= (and bm!8496 (not c!14642)) b!88424))

(assert (= (and d!23523 res!45272) b!88422))

(assert (= (and b!88422 res!45271) b!88423))

(declare-fun m!94509 () Bool)

(assert (=> b!88422 m!94509))

(declare-fun m!94511 () Bool)

(assert (=> d!23523 m!94511))

(declare-fun m!94513 () Bool)

(assert (=> d!23523 m!94513))

(declare-fun m!94515 () Bool)

(assert (=> b!88423 m!94515))

(declare-fun m!94517 () Bool)

(assert (=> b!88425 m!94517))

(declare-fun m!94519 () Bool)

(assert (=> bm!8496 m!94519))

(assert (=> d!23371 d!23523))

(assert (=> b!87805 d!23471))

(declare-fun d!23525 () Bool)

(assert (=> d!23525 (= (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) (and (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87979 d!23525))

(declare-fun d!23527 () Bool)

(declare-fun e!57580 () Bool)

(assert (=> d!23527 e!57580))

(declare-fun res!45273 () Bool)

(assert (=> d!23527 (=> res!45273 e!57580)))

(declare-fun lt!42241 () Bool)

(assert (=> d!23527 (= res!45273 (not lt!42241))))

(declare-fun lt!42242 () Bool)

(assert (=> d!23527 (= lt!42241 lt!42242)))

(declare-fun lt!42243 () Unit!2582)

(declare-fun e!57579 () Unit!2582)

(assert (=> d!23527 (= lt!42243 e!57579)))

(declare-fun c!14646 () Bool)

(assert (=> d!23527 (= c!14646 lt!42242)))

(assert (=> d!23527 (= lt!42242 (containsKey!145 (toList!738 lt!41935) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23527 (= (contains!750 lt!41935 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42241)))

(declare-fun b!88431 () Bool)

(declare-fun lt!42244 () Unit!2582)

(assert (=> b!88431 (= e!57579 lt!42244)))

(assert (=> b!88431 (= lt!42244 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41935) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88431 (isDefined!94 (getValueByKey!142 (toList!738 lt!41935) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88432 () Bool)

(declare-fun Unit!2611 () Unit!2582)

(assert (=> b!88432 (= e!57579 Unit!2611)))

(declare-fun b!88433 () Bool)

(assert (=> b!88433 (= e!57580 (isDefined!94 (getValueByKey!142 (toList!738 lt!41935) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23527 c!14646) b!88431))

(assert (= (and d!23527 (not c!14646)) b!88432))

(assert (= (and d!23527 (not res!45273)) b!88433))

(declare-fun m!94521 () Bool)

(assert (=> d!23527 m!94521))

(declare-fun m!94523 () Bool)

(assert (=> b!88431 m!94523))

(declare-fun m!94525 () Bool)

(assert (=> b!88431 m!94525))

(assert (=> b!88431 m!94525))

(declare-fun m!94527 () Bool)

(assert (=> b!88431 m!94527))

(assert (=> b!88433 m!94525))

(assert (=> b!88433 m!94525))

(assert (=> b!88433 m!94527))

(assert (=> d!23373 d!23527))

(assert (=> d!23373 d!23383))

(assert (=> b!88042 d!23471))

(declare-fun d!23529 () Bool)

(assert (=> d!23529 (= (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!87993 d!23529))

(declare-fun d!23531 () Bool)

(assert (=> d!23531 (= (inRange!0 (ite c!14510 (ite c!14516 (index!3091 lt!41861) (ite c!14507 (index!3090 lt!41876) (index!3093 lt!41876))) (ite c!14511 (index!3091 lt!41869) (ite c!14517 (index!3090 lt!41867) (index!3093 lt!41867)))) (mask!6396 newMap!16)) (and (bvsge (ite c!14510 (ite c!14516 (index!3091 lt!41861) (ite c!14507 (index!3090 lt!41876) (index!3093 lt!41876))) (ite c!14511 (index!3091 lt!41869) (ite c!14517 (index!3090 lt!41867) (index!3093 lt!41867)))) #b00000000000000000000000000000000) (bvslt (ite c!14510 (ite c!14516 (index!3091 lt!41861) (ite c!14507 (index!3090 lt!41876) (index!3093 lt!41876))) (ite c!14511 (index!3091 lt!41869) (ite c!14517 (index!3090 lt!41867) (index!3093 lt!41867)))) (bvadd (mask!6396 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!8436 d!23531))

(assert (=> b!87818 d!23471))

(declare-fun d!23533 () Bool)

(assert (=> d!23533 (= (get!1213 (select (arr!1917 (_values!2341 (v!2664 (underlying!295 thiss!992)))) from!355) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!345 (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88000 d!23533))

(declare-fun d!23535 () Bool)

(assert (=> d!23535 (= (+!109 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 lt!41609)) (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) lt!41878 lt!41609 (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42247 () Unit!2582)

(declare-fun choose!526 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 V!3033 Int) Unit!2582)

(assert (=> d!23535 (= lt!42247 (choose!526 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) lt!41878 (zeroValue!2248 newMap!16) lt!41609 (minValue!2248 newMap!16) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23535 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23535 (= (lemmaChangeZeroKeyThenAddPairToListMap!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) lt!41878 (zeroValue!2248 newMap!16) lt!41609 (minValue!2248 newMap!16) (defaultEntry!2358 newMap!16)) lt!42247)))

(declare-fun bs!3729 () Bool)

(assert (= bs!3729 d!23535))

(declare-fun m!94529 () Bool)

(assert (=> bs!3729 m!94529))

(assert (=> bs!3729 m!93969))

(declare-fun m!94531 () Bool)

(assert (=> bs!3729 m!94531))

(assert (=> bs!3729 m!93603))

(declare-fun m!94533 () Bool)

(assert (=> bs!3729 m!94533))

(assert (=> bs!3729 m!93603))

(assert (=> b!87915 d!23535))

(declare-fun d!23537 () Bool)

(assert (=> d!23537 (= (apply!83 lt!41774 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1214 (getValueByKey!142 (toList!738 lt!41774) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3730 () Bool)

(assert (= bs!3730 d!23537))

(assert (=> bs!3730 m!93607))

(assert (=> bs!3730 m!93963))

(assert (=> bs!3730 m!93963))

(declare-fun m!94535 () Bool)

(assert (=> bs!3730 m!94535))

(assert (=> b!87804 d!23537))

(assert (=> b!87804 d!23447))

(declare-fun b!88437 () Bool)

(declare-fun e!57582 () Option!148)

(assert (=> b!88437 (= e!57582 None!146)))

(declare-fun b!88436 () Bool)

(assert (=> b!88436 (= e!57582 (getValueByKey!142 (t!5246 (toList!738 lt!41956)) (_1!1107 lt!41606)))))

(declare-fun b!88435 () Bool)

(declare-fun e!57581 () Option!148)

(assert (=> b!88435 (= e!57581 e!57582)))

(declare-fun c!14648 () Bool)

(assert (=> b!88435 (= c!14648 (and ((_ is Cons!1508) (toList!738 lt!41956)) (not (= (_1!1107 (h!2100 (toList!738 lt!41956))) (_1!1107 lt!41606)))))))

(declare-fun b!88434 () Bool)

(assert (=> b!88434 (= e!57581 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41956)))))))

(declare-fun d!23539 () Bool)

(declare-fun c!14647 () Bool)

(assert (=> d!23539 (= c!14647 (and ((_ is Cons!1508) (toList!738 lt!41956)) (= (_1!1107 (h!2100 (toList!738 lt!41956))) (_1!1107 lt!41606))))))

(assert (=> d!23539 (= (getValueByKey!142 (toList!738 lt!41956) (_1!1107 lt!41606)) e!57581)))

(assert (= (and d!23539 c!14647) b!88434))

(assert (= (and d!23539 (not c!14647)) b!88435))

(assert (= (and b!88435 c!14648) b!88436))

(assert (= (and b!88435 (not c!14648)) b!88437))

(declare-fun m!94537 () Bool)

(assert (=> b!88436 m!94537))

(assert (=> b!88060 d!23539))

(declare-fun d!23541 () Bool)

(assert (=> d!23541 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41897 #b00000000000000000000000000000000)))

(declare-fun lt!42250 () Unit!2582)

(declare-fun choose!13 (array!4025 (_ BitVec 64) (_ BitVec 32)) Unit!2582)

(assert (=> d!23541 (= lt!42250 (choose!13 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41897 #b00000000000000000000000000000000))))

(assert (=> d!23541 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!23541 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41897 #b00000000000000000000000000000000) lt!42250)))

(declare-fun bs!3731 () Bool)

(assert (= bs!3731 d!23541))

(assert (=> bs!3731 m!93739))

(declare-fun m!94539 () Bool)

(assert (=> bs!3731 m!94539))

(assert (=> b!87991 d!23541))

(declare-fun d!23543 () Bool)

(declare-fun res!45274 () Bool)

(declare-fun e!57583 () Bool)

(assert (=> d!23543 (=> res!45274 e!57583)))

(assert (=> d!23543 (= res!45274 (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) lt!41897))))

(assert (=> d!23543 (= (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41897 #b00000000000000000000000000000000) e!57583)))

(declare-fun b!88438 () Bool)

(declare-fun e!57584 () Bool)

(assert (=> b!88438 (= e!57583 e!57584)))

(declare-fun res!45275 () Bool)

(assert (=> b!88438 (=> (not res!45275) (not e!57584))))

(assert (=> b!88438 (= res!45275 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(declare-fun b!88439 () Bool)

(assert (=> b!88439 (= e!57584 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) lt!41897 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23543 (not res!45274)) b!88438))

(assert (= (and b!88438 res!45275) b!88439))

(assert (=> d!23543 m!93735))

(declare-fun m!94541 () Bool)

(assert (=> b!88439 m!94541))

(assert (=> b!87991 d!23543))

(declare-fun b!88440 () Bool)

(declare-fun e!57587 () SeekEntryResult!238)

(declare-fun lt!42253 () SeekEntryResult!238)

(assert (=> b!88440 (= e!57587 (Found!238 (index!3092 lt!42253)))))

(declare-fun b!88441 () Bool)

(declare-fun e!57585 () SeekEntryResult!238)

(assert (=> b!88441 (= e!57585 (seekKeyOrZeroReturnVacant!0 (x!12135 lt!42253) (index!3092 lt!42253) (index!3092 lt!42253) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))))))

(declare-fun b!88442 () Bool)

(declare-fun e!57586 () SeekEntryResult!238)

(assert (=> b!88442 (= e!57586 Undefined!238)))

(declare-fun d!23545 () Bool)

(declare-fun lt!42252 () SeekEntryResult!238)

(assert (=> d!23545 (and (or ((_ is Undefined!238) lt!42252) (not ((_ is Found!238) lt!42252)) (and (bvsge (index!3091 lt!42252) #b00000000000000000000000000000000) (bvslt (index!3091 lt!42252) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))) (or ((_ is Undefined!238) lt!42252) ((_ is Found!238) lt!42252) (not ((_ is MissingZero!238) lt!42252)) (and (bvsge (index!3090 lt!42252) #b00000000000000000000000000000000) (bvslt (index!3090 lt!42252) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))) (or ((_ is Undefined!238) lt!42252) ((_ is Found!238) lt!42252) ((_ is MissingZero!238) lt!42252) (not ((_ is MissingVacant!238) lt!42252)) (and (bvsge (index!3093 lt!42252) #b00000000000000000000000000000000) (bvslt (index!3093 lt!42252) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))) (or ((_ is Undefined!238) lt!42252) (ite ((_ is Found!238) lt!42252) (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (index!3091 lt!42252)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!238) lt!42252) (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (index!3090 lt!42252)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!238) lt!42252) (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (index!3093 lt!42252)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23545 (= lt!42252 e!57586)))

(declare-fun c!14651 () Bool)

(assert (=> d!23545 (= c!14651 (and ((_ is Intermediate!238) lt!42253) (undefined!1050 lt!42253)))))

(assert (=> d!23545 (= lt!42253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (mask!6396 (v!2664 (underlying!295 thiss!992)))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))))))

(assert (=> d!23545 (validMask!0 (mask!6396 (v!2664 (underlying!295 thiss!992))))))

(assert (=> d!23545 (= (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000) (_keys!4034 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992)))) lt!42252)))

(declare-fun b!88443 () Bool)

(declare-fun c!14649 () Bool)

(declare-fun lt!42251 () (_ BitVec 64))

(assert (=> b!88443 (= c!14649 (= lt!42251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88443 (= e!57587 e!57585)))

(declare-fun b!88444 () Bool)

(assert (=> b!88444 (= e!57585 (MissingZero!238 (index!3092 lt!42253)))))

(declare-fun b!88445 () Bool)

(assert (=> b!88445 (= e!57586 e!57587)))

(assert (=> b!88445 (= lt!42251 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (index!3092 lt!42253)))))

(declare-fun c!14650 () Bool)

(assert (=> b!88445 (= c!14650 (= lt!42251 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23545 c!14651) b!88442))

(assert (= (and d!23545 (not c!14651)) b!88445))

(assert (= (and b!88445 c!14650) b!88440))

(assert (= (and b!88445 (not c!14650)) b!88443))

(assert (= (and b!88443 c!14649) b!88444))

(assert (= (and b!88443 (not c!14649)) b!88441))

(assert (=> b!88441 m!93735))

(declare-fun m!94543 () Bool)

(assert (=> b!88441 m!94543))

(assert (=> d!23545 m!93735))

(declare-fun m!94545 () Bool)

(assert (=> d!23545 m!94545))

(declare-fun m!94547 () Bool)

(assert (=> d!23545 m!94547))

(declare-fun m!94549 () Bool)

(assert (=> d!23545 m!94549))

(assert (=> d!23545 m!94545))

(assert (=> d!23545 m!93735))

(declare-fun m!94551 () Bool)

(assert (=> d!23545 m!94551))

(declare-fun m!94553 () Bool)

(assert (=> d!23545 m!94553))

(assert (=> d!23545 m!93441))

(declare-fun m!94555 () Bool)

(assert (=> b!88445 m!94555))

(assert (=> b!87991 d!23545))

(declare-fun d!23547 () Bool)

(assert (=> d!23547 (= (apply!83 lt!41774 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1214 (getValueByKey!142 (toList!738 lt!41774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3732 () Bool)

(assert (= bs!3732 d!23547))

(declare-fun m!94557 () Bool)

(assert (=> bs!3732 m!94557))

(assert (=> bs!3732 m!94557))

(declare-fun m!94559 () Bool)

(assert (=> bs!3732 m!94559))

(assert (=> b!87800 d!23547))

(declare-fun d!23549 () Bool)

(declare-fun e!57589 () Bool)

(assert (=> d!23549 e!57589))

(declare-fun res!45276 () Bool)

(assert (=> d!23549 (=> res!45276 e!57589)))

(declare-fun lt!42254 () Bool)

(assert (=> d!23549 (= res!45276 (not lt!42254))))

(declare-fun lt!42255 () Bool)

(assert (=> d!23549 (= lt!42254 lt!42255)))

(declare-fun lt!42256 () Unit!2582)

(declare-fun e!57588 () Unit!2582)

(assert (=> d!23549 (= lt!42256 e!57588)))

(declare-fun c!14652 () Bool)

(assert (=> d!23549 (= c!14652 lt!42255)))

(assert (=> d!23549 (= lt!42255 (containsKey!145 (toList!738 lt!41911) (_1!1107 lt!41611)))))

(assert (=> d!23549 (= (contains!750 lt!41911 (_1!1107 lt!41611)) lt!42254)))

(declare-fun b!88446 () Bool)

(declare-fun lt!42257 () Unit!2582)

(assert (=> b!88446 (= e!57588 lt!42257)))

(assert (=> b!88446 (= lt!42257 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41911) (_1!1107 lt!41611)))))

(assert (=> b!88446 (isDefined!94 (getValueByKey!142 (toList!738 lt!41911) (_1!1107 lt!41611)))))

(declare-fun b!88447 () Bool)

(declare-fun Unit!2612 () Unit!2582)

(assert (=> b!88447 (= e!57588 Unit!2612)))

(declare-fun b!88448 () Bool)

(assert (=> b!88448 (= e!57589 (isDefined!94 (getValueByKey!142 (toList!738 lt!41911) (_1!1107 lt!41611))))))

(assert (= (and d!23549 c!14652) b!88446))

(assert (= (and d!23549 (not c!14652)) b!88447))

(assert (= (and d!23549 (not res!45276)) b!88448))

(declare-fun m!94561 () Bool)

(assert (=> d!23549 m!94561))

(declare-fun m!94563 () Bool)

(assert (=> b!88446 m!94563))

(assert (=> b!88446 m!93769))

(assert (=> b!88446 m!93769))

(declare-fun m!94565 () Bool)

(assert (=> b!88446 m!94565))

(assert (=> b!88448 m!93769))

(assert (=> b!88448 m!93769))

(assert (=> b!88448 m!94565))

(assert (=> d!23367 d!23549))

(declare-fun b!88452 () Bool)

(declare-fun e!57591 () Option!148)

(assert (=> b!88452 (= e!57591 None!146)))

(declare-fun b!88451 () Bool)

(assert (=> b!88451 (= e!57591 (getValueByKey!142 (t!5246 lt!41909) (_1!1107 lt!41611)))))

(declare-fun b!88450 () Bool)

(declare-fun e!57590 () Option!148)

(assert (=> b!88450 (= e!57590 e!57591)))

(declare-fun c!14654 () Bool)

(assert (=> b!88450 (= c!14654 (and ((_ is Cons!1508) lt!41909) (not (= (_1!1107 (h!2100 lt!41909)) (_1!1107 lt!41611)))))))

(declare-fun b!88449 () Bool)

(assert (=> b!88449 (= e!57590 (Some!147 (_2!1107 (h!2100 lt!41909))))))

(declare-fun d!23551 () Bool)

(declare-fun c!14653 () Bool)

(assert (=> d!23551 (= c!14653 (and ((_ is Cons!1508) lt!41909) (= (_1!1107 (h!2100 lt!41909)) (_1!1107 lt!41611))))))

(assert (=> d!23551 (= (getValueByKey!142 lt!41909 (_1!1107 lt!41611)) e!57590)))

(assert (= (and d!23551 c!14653) b!88449))

(assert (= (and d!23551 (not c!14653)) b!88450))

(assert (= (and b!88450 c!14654) b!88451))

(assert (= (and b!88450 (not c!14654)) b!88452))

(declare-fun m!94567 () Bool)

(assert (=> b!88451 m!94567))

(assert (=> d!23367 d!23551))

(declare-fun d!23553 () Bool)

(assert (=> d!23553 (= (getValueByKey!142 lt!41909 (_1!1107 lt!41611)) (Some!147 (_2!1107 lt!41611)))))

(declare-fun lt!42258 () Unit!2582)

(assert (=> d!23553 (= lt!42258 (choose!524 lt!41909 (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(declare-fun e!57592 () Bool)

(assert (=> d!23553 e!57592))

(declare-fun res!45277 () Bool)

(assert (=> d!23553 (=> (not res!45277) (not e!57592))))

(assert (=> d!23553 (= res!45277 (isStrictlySorted!286 lt!41909))))

(assert (=> d!23553 (= (lemmaContainsTupThenGetReturnValue!59 lt!41909 (_1!1107 lt!41611) (_2!1107 lt!41611)) lt!42258)))

(declare-fun b!88453 () Bool)

(declare-fun res!45278 () Bool)

(assert (=> b!88453 (=> (not res!45278) (not e!57592))))

(assert (=> b!88453 (= res!45278 (containsKey!145 lt!41909 (_1!1107 lt!41611)))))

(declare-fun b!88454 () Bool)

(assert (=> b!88454 (= e!57592 (contains!753 lt!41909 (tuple2!2193 (_1!1107 lt!41611) (_2!1107 lt!41611))))))

(assert (= (and d!23553 res!45277) b!88453))

(assert (= (and b!88453 res!45278) b!88454))

(assert (=> d!23553 m!93763))

(declare-fun m!94569 () Bool)

(assert (=> d!23553 m!94569))

(declare-fun m!94571 () Bool)

(assert (=> d!23553 m!94571))

(declare-fun m!94573 () Bool)

(assert (=> b!88453 m!94573))

(declare-fun m!94575 () Bool)

(assert (=> b!88454 m!94575))

(assert (=> d!23367 d!23553))

(declare-fun b!88455 () Bool)

(declare-fun e!57594 () List!1512)

(declare-fun call!8503 () List!1512)

(assert (=> b!88455 (= e!57594 call!8503)))

(declare-fun b!88456 () Bool)

(declare-fun res!45279 () Bool)

(declare-fun e!57596 () Bool)

(assert (=> b!88456 (=> (not res!45279) (not e!57596))))

(declare-fun lt!42259 () List!1512)

(assert (=> b!88456 (= res!45279 (containsKey!145 lt!42259 (_1!1107 lt!41611)))))

(declare-fun b!88457 () Bool)

(assert (=> b!88457 (= e!57596 (contains!753 lt!42259 (tuple2!2193 (_1!1107 lt!41611) (_2!1107 lt!41611))))))

(declare-fun bm!8499 () Bool)

(declare-fun c!14658 () Bool)

(declare-fun call!8502 () List!1512)

(declare-fun e!57595 () List!1512)

(assert (=> bm!8499 (= call!8502 ($colon$colon!72 e!57595 (ite c!14658 (h!2100 (toList!738 lt!41600)) (tuple2!2193 (_1!1107 lt!41611) (_2!1107 lt!41611)))))))

(declare-fun c!14655 () Bool)

(assert (=> bm!8499 (= c!14655 c!14658)))

(declare-fun c!14656 () Bool)

(declare-fun c!14657 () Bool)

(declare-fun b!88458 () Bool)

(assert (=> b!88458 (= e!57595 (ite c!14656 (t!5246 (toList!738 lt!41600)) (ite c!14657 (Cons!1508 (h!2100 (toList!738 lt!41600)) (t!5246 (toList!738 lt!41600))) Nil!1509)))))

(declare-fun b!88459 () Bool)

(assert (=> b!88459 (= e!57595 (insertStrictlySorted!62 (t!5246 (toList!738 lt!41600)) (_1!1107 lt!41611) (_2!1107 lt!41611)))))

(declare-fun b!88460 () Bool)

(declare-fun e!57597 () List!1512)

(declare-fun e!57593 () List!1512)

(assert (=> b!88460 (= e!57597 e!57593)))

(assert (=> b!88460 (= c!14656 (and ((_ is Cons!1508) (toList!738 lt!41600)) (= (_1!1107 (h!2100 (toList!738 lt!41600))) (_1!1107 lt!41611))))))

(declare-fun b!88461 () Bool)

(declare-fun call!8504 () List!1512)

(assert (=> b!88461 (= e!57593 call!8504)))

(declare-fun bm!8501 () Bool)

(assert (=> bm!8501 (= call!8504 call!8502)))

(declare-fun b!88462 () Bool)

(assert (=> b!88462 (= c!14657 (and ((_ is Cons!1508) (toList!738 lt!41600)) (bvsgt (_1!1107 (h!2100 (toList!738 lt!41600))) (_1!1107 lt!41611))))))

(assert (=> b!88462 (= e!57593 e!57594)))

(declare-fun b!88463 () Bool)

(assert (=> b!88463 (= e!57597 call!8502)))

(declare-fun b!88464 () Bool)

(assert (=> b!88464 (= e!57594 call!8503)))

(declare-fun d!23555 () Bool)

(assert (=> d!23555 e!57596))

(declare-fun res!45280 () Bool)

(assert (=> d!23555 (=> (not res!45280) (not e!57596))))

(assert (=> d!23555 (= res!45280 (isStrictlySorted!286 lt!42259))))

(assert (=> d!23555 (= lt!42259 e!57597)))

(assert (=> d!23555 (= c!14658 (and ((_ is Cons!1508) (toList!738 lt!41600)) (bvslt (_1!1107 (h!2100 (toList!738 lt!41600))) (_1!1107 lt!41611))))))

(assert (=> d!23555 (isStrictlySorted!286 (toList!738 lt!41600))))

(assert (=> d!23555 (= (insertStrictlySorted!62 (toList!738 lt!41600) (_1!1107 lt!41611) (_2!1107 lt!41611)) lt!42259)))

(declare-fun bm!8500 () Bool)

(assert (=> bm!8500 (= call!8503 call!8504)))

(assert (= (and d!23555 c!14658) b!88463))

(assert (= (and d!23555 (not c!14658)) b!88460))

(assert (= (and b!88460 c!14656) b!88461))

(assert (= (and b!88460 (not c!14656)) b!88462))

(assert (= (and b!88462 c!14657) b!88455))

(assert (= (and b!88462 (not c!14657)) b!88464))

(assert (= (or b!88455 b!88464) bm!8500))

(assert (= (or b!88461 bm!8500) bm!8501))

(assert (= (or b!88463 bm!8501) bm!8499))

(assert (= (and bm!8499 c!14655) b!88459))

(assert (= (and bm!8499 (not c!14655)) b!88458))

(assert (= (and d!23555 res!45280) b!88456))

(assert (= (and b!88456 res!45279) b!88457))

(declare-fun m!94577 () Bool)

(assert (=> b!88456 m!94577))

(declare-fun m!94579 () Bool)

(assert (=> d!23555 m!94579))

(declare-fun m!94581 () Bool)

(assert (=> d!23555 m!94581))

(declare-fun m!94583 () Bool)

(assert (=> b!88457 m!94583))

(declare-fun m!94585 () Bool)

(assert (=> b!88459 m!94585))

(declare-fun m!94587 () Bool)

(assert (=> bm!8499 m!94587))

(assert (=> d!23367 d!23555))

(declare-fun d!23557 () Bool)

(declare-fun e!57600 () Bool)

(assert (=> d!23557 e!57600))

(declare-fun res!45283 () Bool)

(assert (=> d!23557 (=> (not res!45283) (not e!57600))))

(assert (=> d!23557 (= res!45283 (and (bvsge (index!3091 lt!41866) #b00000000000000000000000000000000) (bvslt (index!3091 lt!41866) (size!2161 (_keys!4034 newMap!16)))))))

(declare-fun lt!42262 () Unit!2582)

(declare-fun choose!527 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) Int) Unit!2582)

(assert (=> d!23557 (= lt!42262 (choose!527 (_keys!4034 newMap!16) lt!41880 (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3091 lt!41866) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23557 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23557 (= (lemmaValidKeyInArrayIsInListMap!92 (_keys!4034 newMap!16) lt!41880 (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3091 lt!41866) (defaultEntry!2358 newMap!16)) lt!42262)))

(declare-fun b!88467 () Bool)

(assert (=> b!88467 (= e!57600 (contains!750 (getCurrentListMap!431 (_keys!4034 newMap!16) lt!41880 (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1916 (_keys!4034 newMap!16)) (index!3091 lt!41866))))))

(assert (= (and d!23557 res!45283) b!88467))

(declare-fun m!94589 () Bool)

(assert (=> d!23557 m!94589))

(assert (=> d!23557 m!93969))

(declare-fun m!94591 () Bool)

(assert (=> b!88467 m!94591))

(assert (=> b!88467 m!93715))

(assert (=> b!88467 m!94591))

(assert (=> b!88467 m!93715))

(declare-fun m!94593 () Bool)

(assert (=> b!88467 m!94593))

(assert (=> b!87924 d!23557))

(declare-fun d!23559 () Bool)

(declare-fun e!57603 () Bool)

(assert (=> d!23559 e!57603))

(declare-fun res!45286 () Bool)

(assert (=> d!23559 (=> (not res!45286) (not e!57603))))

(assert (=> d!23559 (= res!45286 (and (bvsge (index!3091 lt!41866) #b00000000000000000000000000000000) (bvslt (index!3091 lt!41866) (size!2162 (_values!2341 newMap!16)))))))

(declare-fun lt!42265 () Unit!2582)

(declare-fun choose!528 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 32) (_ BitVec 64) V!3033 Int) Unit!2582)

(assert (=> d!23559 (= lt!42265 (choose!528 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3091 lt!41866) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 (defaultEntry!2358 newMap!16)))))

(assert (=> d!23559 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23559 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (index!3091 lt!41866) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609 (defaultEntry!2358 newMap!16)) lt!42265)))

(declare-fun b!88470 () Bool)

(assert (=> b!88470 (= e!57603 (= (+!109 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (tuple2!2193 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) lt!41609)) (getCurrentListMap!431 (_keys!4034 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16))) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16))))))

(assert (= (and d!23559 res!45286) b!88470))

(assert (=> d!23559 m!93405))

(declare-fun m!94595 () Bool)

(assert (=> d!23559 m!94595))

(assert (=> d!23559 m!93969))

(assert (=> b!88470 m!93603))

(assert (=> b!88470 m!93603))

(assert (=> b!88470 m!94393))

(assert (=> b!88470 m!93689))

(declare-fun m!94597 () Bool)

(assert (=> b!88470 m!94597))

(assert (=> b!87924 d!23559))

(declare-fun d!23561 () Bool)

(declare-fun e!57605 () Bool)

(assert (=> d!23561 e!57605))

(declare-fun res!45287 () Bool)

(assert (=> d!23561 (=> res!45287 e!57605)))

(declare-fun lt!42266 () Bool)

(assert (=> d!23561 (= res!45287 (not lt!42266))))

(declare-fun lt!42267 () Bool)

(assert (=> d!23561 (= lt!42266 lt!42267)))

(declare-fun lt!42268 () Unit!2582)

(declare-fun e!57604 () Unit!2582)

(assert (=> d!23561 (= lt!42268 e!57604)))

(declare-fun c!14659 () Bool)

(assert (=> d!23561 (= c!14659 lt!42267)))

(assert (=> d!23561 (= lt!42267 (containsKey!145 (toList!738 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> d!23561 (= (contains!750 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) lt!42266)))

(declare-fun b!88471 () Bool)

(declare-fun lt!42269 () Unit!2582)

(assert (=> b!88471 (= e!57604 lt!42269)))

(assert (=> b!88471 (= lt!42269 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (=> b!88471 (isDefined!94 (getValueByKey!142 (toList!738 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!88472 () Bool)

(declare-fun Unit!2613 () Unit!2582)

(assert (=> b!88472 (= e!57604 Unit!2613)))

(declare-fun b!88473 () Bool)

(assert (=> b!88473 (= e!57605 (isDefined!94 (getValueByKey!142 (toList!738 (getCurrentListMap!431 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))))

(assert (= (and d!23561 c!14659) b!88471))

(assert (= (and d!23561 (not c!14659)) b!88472))

(assert (= (and d!23561 (not res!45287)) b!88473))

(assert (=> d!23561 m!93405))

(declare-fun m!94599 () Bool)

(assert (=> d!23561 m!94599))

(assert (=> b!88471 m!93405))

(declare-fun m!94601 () Bool)

(assert (=> b!88471 m!94601))

(assert (=> b!88471 m!93405))

(declare-fun m!94603 () Bool)

(assert (=> b!88471 m!94603))

(assert (=> b!88471 m!94603))

(declare-fun m!94605 () Bool)

(assert (=> b!88471 m!94605))

(assert (=> b!88473 m!93405))

(assert (=> b!88473 m!94603))

(assert (=> b!88473 m!94603))

(assert (=> b!88473 m!94605))

(assert (=> b!87924 d!23561))

(assert (=> b!87924 d!23497))

(declare-fun b!88477 () Bool)

(declare-fun e!57607 () Option!148)

(assert (=> b!88477 (= e!57607 None!146)))

(declare-fun b!88476 () Bool)

(assert (=> b!88476 (= e!57607 (getValueByKey!142 (t!5246 (toList!738 lt!41960)) (_1!1107 lt!41604)))))

(declare-fun b!88475 () Bool)

(declare-fun e!57606 () Option!148)

(assert (=> b!88475 (= e!57606 e!57607)))

(declare-fun c!14661 () Bool)

(assert (=> b!88475 (= c!14661 (and ((_ is Cons!1508) (toList!738 lt!41960)) (not (= (_1!1107 (h!2100 (toList!738 lt!41960))) (_1!1107 lt!41604)))))))

(declare-fun b!88474 () Bool)

(assert (=> b!88474 (= e!57606 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41960)))))))

(declare-fun d!23563 () Bool)

(declare-fun c!14660 () Bool)

(assert (=> d!23563 (= c!14660 (and ((_ is Cons!1508) (toList!738 lt!41960)) (= (_1!1107 (h!2100 (toList!738 lt!41960))) (_1!1107 lt!41604))))))

(assert (=> d!23563 (= (getValueByKey!142 (toList!738 lt!41960) (_1!1107 lt!41604)) e!57606)))

(assert (= (and d!23563 c!14660) b!88474))

(assert (= (and d!23563 (not c!14660)) b!88475))

(assert (= (and b!88475 c!14661) b!88476))

(assert (= (and b!88475 (not c!14661)) b!88477))

(declare-fun m!94607 () Bool)

(assert (=> b!88476 m!94607))

(assert (=> b!88062 d!23563))

(assert (=> d!23347 d!23353))

(declare-fun d!23565 () Bool)

(assert (=> d!23565 (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) from!355 Nil!1508)))

(assert (=> d!23565 true))

(declare-fun _$71!117 () Unit!2582)

(assert (=> d!23565 (= (choose!39 (_keys!4034 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!117)))

(declare-fun bs!3733 () Bool)

(assert (= bs!3733 d!23565))

(assert (=> bs!3733 m!93413))

(assert (=> d!23347 d!23565))

(declare-fun b!88481 () Bool)

(declare-fun e!57609 () Option!148)

(assert (=> b!88481 (= e!57609 None!146)))

(declare-fun b!88480 () Bool)

(assert (=> b!88480 (= e!57609 (getValueByKey!142 (t!5246 (toList!738 lt!41943)) (_1!1107 lt!41606)))))

(declare-fun b!88479 () Bool)

(declare-fun e!57608 () Option!148)

(assert (=> b!88479 (= e!57608 e!57609)))

(declare-fun c!14663 () Bool)

(assert (=> b!88479 (= c!14663 (and ((_ is Cons!1508) (toList!738 lt!41943)) (not (= (_1!1107 (h!2100 (toList!738 lt!41943))) (_1!1107 lt!41606)))))))

(declare-fun b!88478 () Bool)

(assert (=> b!88478 (= e!57608 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41943)))))))

(declare-fun d!23567 () Bool)

(declare-fun c!14662 () Bool)

(assert (=> d!23567 (= c!14662 (and ((_ is Cons!1508) (toList!738 lt!41943)) (= (_1!1107 (h!2100 (toList!738 lt!41943))) (_1!1107 lt!41606))))))

(assert (=> d!23567 (= (getValueByKey!142 (toList!738 lt!41943) (_1!1107 lt!41606)) e!57608)))

(assert (= (and d!23567 c!14662) b!88478))

(assert (= (and d!23567 (not c!14662)) b!88479))

(assert (= (and b!88479 c!14663) b!88480))

(assert (= (and b!88479 (not c!14663)) b!88481))

(declare-fun m!94609 () Bool)

(assert (=> b!88480 m!94609))

(assert (=> b!88054 d!23567))

(declare-fun d!23569 () Bool)

(declare-fun e!57611 () Bool)

(assert (=> d!23569 e!57611))

(declare-fun res!45288 () Bool)

(assert (=> d!23569 (=> res!45288 e!57611)))

(declare-fun lt!42270 () Bool)

(assert (=> d!23569 (= res!45288 (not lt!42270))))

(declare-fun lt!42271 () Bool)

(assert (=> d!23569 (= lt!42270 lt!42271)))

(declare-fun lt!42272 () Unit!2582)

(declare-fun e!57610 () Unit!2582)

(assert (=> d!23569 (= lt!42272 e!57610)))

(declare-fun c!14664 () Bool)

(assert (=> d!23569 (= c!14664 lt!42271)))

(assert (=> d!23569 (= lt!42271 (containsKey!145 (toList!738 lt!41935) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23569 (= (contains!750 lt!41935 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!42270)))

(declare-fun b!88482 () Bool)

(declare-fun lt!42273 () Unit!2582)

(assert (=> b!88482 (= e!57610 lt!42273)))

(assert (=> b!88482 (= lt!42273 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41935) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88482 (isDefined!94 (getValueByKey!142 (toList!738 lt!41935) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!88483 () Bool)

(declare-fun Unit!2614 () Unit!2582)

(assert (=> b!88483 (= e!57610 Unit!2614)))

(declare-fun b!88484 () Bool)

(assert (=> b!88484 (= e!57611 (isDefined!94 (getValueByKey!142 (toList!738 lt!41935) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23569 c!14664) b!88482))

(assert (= (and d!23569 (not c!14664)) b!88483))

(assert (= (and d!23569 (not res!45288)) b!88484))

(assert (=> d!23569 m!93607))

(declare-fun m!94611 () Bool)

(assert (=> d!23569 m!94611))

(assert (=> b!88482 m!93607))

(declare-fun m!94613 () Bool)

(assert (=> b!88482 m!94613))

(assert (=> b!88482 m!93607))

(assert (=> b!88482 m!94131))

(assert (=> b!88482 m!94131))

(declare-fun m!94615 () Bool)

(assert (=> b!88482 m!94615))

(assert (=> b!88484 m!93607))

(assert (=> b!88484 m!94131))

(assert (=> b!88484 m!94131))

(assert (=> b!88484 m!94615))

(assert (=> b!88053 d!23569))

(declare-fun d!23571 () Bool)

(declare-fun isEmpty!345 (Option!148) Bool)

(assert (=> d!23571 (= (isDefined!94 (getValueByKey!142 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))) (not (isEmpty!345 (getValueByKey!142 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))))

(declare-fun bs!3734 () Bool)

(assert (= bs!3734 d!23571))

(assert (=> bs!3734 m!93663))

(declare-fun m!94617 () Bool)

(assert (=> bs!3734 m!94617))

(assert (=> b!87829 d!23571))

(declare-fun b!88488 () Bool)

(declare-fun e!57613 () Option!148)

(assert (=> b!88488 (= e!57613 None!146)))

(declare-fun b!88487 () Bool)

(assert (=> b!88487 (= e!57613 (getValueByKey!142 (t!5246 (toList!738 lt!41605)) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!88486 () Bool)

(declare-fun e!57612 () Option!148)

(assert (=> b!88486 (= e!57612 e!57613)))

(declare-fun c!14666 () Bool)

(assert (=> b!88486 (= c!14666 (and ((_ is Cons!1508) (toList!738 lt!41605)) (not (= (_1!1107 (h!2100 (toList!738 lt!41605))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))))

(declare-fun b!88485 () Bool)

(assert (=> b!88485 (= e!57612 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41605)))))))

(declare-fun c!14665 () Bool)

(declare-fun d!23573 () Bool)

(assert (=> d!23573 (= c!14665 (and ((_ is Cons!1508) (toList!738 lt!41605)) (= (_1!1107 (h!2100 (toList!738 lt!41605))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355))))))

(assert (=> d!23573 (= (getValueByKey!142 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) e!57612)))

(assert (= (and d!23573 c!14665) b!88485))

(assert (= (and d!23573 (not c!14665)) b!88486))

(assert (= (and b!88486 c!14666) b!88487))

(assert (= (and b!88486 (not c!14666)) b!88488))

(assert (=> b!88487 m!93405))

(declare-fun m!94619 () Bool)

(assert (=> b!88487 m!94619))

(assert (=> b!87829 d!23573))

(assert (=> b!87966 d!23349))

(declare-fun d!23575 () Bool)

(declare-fun e!57614 () Bool)

(assert (=> d!23575 e!57614))

(declare-fun res!45289 () Bool)

(assert (=> d!23575 (=> (not res!45289) (not e!57614))))

(declare-fun lt!42277 () ListLongMap!1445)

(assert (=> d!23575 (= res!45289 (contains!750 lt!42277 (_1!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!42275 () List!1512)

(assert (=> d!23575 (= lt!42277 (ListLongMap!1446 lt!42275))))

(declare-fun lt!42276 () Unit!2582)

(declare-fun lt!42274 () Unit!2582)

(assert (=> d!23575 (= lt!42276 lt!42274)))

(assert (=> d!23575 (= (getValueByKey!142 lt!42275 (_1!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23575 (= lt!42274 (lemmaContainsTupThenGetReturnValue!59 lt!42275 (_1!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23575 (= lt!42275 (insertStrictlySorted!62 (toList!738 lt!41787) (_1!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23575 (= (+!109 lt!41787 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!42277)))

(declare-fun b!88489 () Bool)

(declare-fun res!45290 () Bool)

(assert (=> b!88489 (=> (not res!45290) (not e!57614))))

(assert (=> b!88489 (= res!45290 (= (getValueByKey!142 (toList!738 lt!42277) (_1!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88490 () Bool)

(assert (=> b!88490 (= e!57614 (contains!753 (toList!738 lt!42277) (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23575 res!45289) b!88489))

(assert (= (and b!88489 res!45290) b!88490))

(declare-fun m!94621 () Bool)

(assert (=> d!23575 m!94621))

(declare-fun m!94623 () Bool)

(assert (=> d!23575 m!94623))

(declare-fun m!94625 () Bool)

(assert (=> d!23575 m!94625))

(declare-fun m!94627 () Bool)

(assert (=> d!23575 m!94627))

(declare-fun m!94629 () Bool)

(assert (=> b!88489 m!94629))

(declare-fun m!94631 () Bool)

(assert (=> b!88490 m!94631))

(assert (=> b!87814 d!23575))

(declare-fun d!23577 () Bool)

(declare-fun e!57615 () Bool)

(assert (=> d!23577 e!57615))

(declare-fun res!45291 () Bool)

(assert (=> d!23577 (=> (not res!45291) (not e!57615))))

(declare-fun lt!42281 () ListLongMap!1445)

(assert (=> d!23577 (= res!45291 (contains!750 lt!42281 (_1!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!42279 () List!1512)

(assert (=> d!23577 (= lt!42281 (ListLongMap!1446 lt!42279))))

(declare-fun lt!42280 () Unit!2582)

(declare-fun lt!42278 () Unit!2582)

(assert (=> d!23577 (= lt!42280 lt!42278)))

(assert (=> d!23577 (= (getValueByKey!142 lt!42279 (_1!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23577 (= lt!42278 (lemmaContainsTupThenGetReturnValue!59 lt!42279 (_1!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23577 (= lt!42279 (insertStrictlySorted!62 (toList!738 lt!41768) (_1!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23577 (= (+!109 lt!41768 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!42281)))

(declare-fun b!88491 () Bool)

(declare-fun res!45292 () Bool)

(assert (=> b!88491 (=> (not res!45292) (not e!57615))))

(assert (=> b!88491 (= res!45292 (= (getValueByKey!142 (toList!738 lt!42281) (_1!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88492 () Bool)

(assert (=> b!88492 (= e!57615 (contains!753 (toList!738 lt!42281) (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23577 res!45291) b!88491))

(assert (= (and b!88491 res!45292) b!88492))

(declare-fun m!94633 () Bool)

(assert (=> d!23577 m!94633))

(declare-fun m!94635 () Bool)

(assert (=> d!23577 m!94635))

(declare-fun m!94637 () Bool)

(assert (=> d!23577 m!94637))

(declare-fun m!94639 () Bool)

(assert (=> d!23577 m!94639))

(declare-fun m!94641 () Bool)

(assert (=> b!88491 m!94641))

(declare-fun m!94643 () Bool)

(assert (=> b!88492 m!94643))

(assert (=> b!87814 d!23577))

(declare-fun d!23579 () Bool)

(assert (=> d!23579 (= (apply!83 (+!109 lt!41768 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41773) (get!1214 (getValueByKey!142 (toList!738 (+!109 lt!41768 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!41773)))))

(declare-fun bs!3735 () Bool)

(assert (= bs!3735 d!23579))

(declare-fun m!94645 () Bool)

(assert (=> bs!3735 m!94645))

(assert (=> bs!3735 m!94645))

(declare-fun m!94647 () Bool)

(assert (=> bs!3735 m!94647))

(assert (=> b!87814 d!23579))

(assert (=> b!87814 d!23373))

(declare-fun d!23581 () Bool)

(declare-fun e!57616 () Bool)

(assert (=> d!23581 e!57616))

(declare-fun res!45293 () Bool)

(assert (=> d!23581 (=> (not res!45293) (not e!57616))))

(declare-fun lt!42285 () ListLongMap!1445)

(assert (=> d!23581 (= res!45293 (contains!750 lt!42285 (_1!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!42283 () List!1512)

(assert (=> d!23581 (= lt!42285 (ListLongMap!1446 lt!42283))))

(declare-fun lt!42284 () Unit!2582)

(declare-fun lt!42282 () Unit!2582)

(assert (=> d!23581 (= lt!42284 lt!42282)))

(assert (=> d!23581 (= (getValueByKey!142 lt!42283 (_1!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23581 (= lt!42282 (lemmaContainsTupThenGetReturnValue!59 lt!42283 (_1!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23581 (= lt!42283 (insertStrictlySorted!62 (toList!738 lt!41781) (_1!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23581 (= (+!109 lt!41781 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!42285)))

(declare-fun b!88493 () Bool)

(declare-fun res!45294 () Bool)

(assert (=> b!88493 (=> (not res!45294) (not e!57616))))

(assert (=> b!88493 (= res!45294 (= (getValueByKey!142 (toList!738 lt!42285) (_1!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88494 () Bool)

(assert (=> b!88494 (= e!57616 (contains!753 (toList!738 lt!42285) (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23581 res!45293) b!88493))

(assert (= (and b!88493 res!45294) b!88494))

(declare-fun m!94649 () Bool)

(assert (=> d!23581 m!94649))

(declare-fun m!94651 () Bool)

(assert (=> d!23581 m!94651))

(declare-fun m!94653 () Bool)

(assert (=> d!23581 m!94653))

(declare-fun m!94655 () Bool)

(assert (=> d!23581 m!94655))

(declare-fun m!94657 () Bool)

(assert (=> b!88493 m!94657))

(declare-fun m!94659 () Bool)

(assert (=> b!88494 m!94659))

(assert (=> b!87814 d!23581))

(declare-fun d!23583 () Bool)

(declare-fun e!57618 () Bool)

(assert (=> d!23583 e!57618))

(declare-fun res!45295 () Bool)

(assert (=> d!23583 (=> res!45295 e!57618)))

(declare-fun lt!42286 () Bool)

(assert (=> d!23583 (= res!45295 (not lt!42286))))

(declare-fun lt!42287 () Bool)

(assert (=> d!23583 (= lt!42286 lt!42287)))

(declare-fun lt!42288 () Unit!2582)

(declare-fun e!57617 () Unit!2582)

(assert (=> d!23583 (= lt!42288 e!57617)))

(declare-fun c!14667 () Bool)

(assert (=> d!23583 (= c!14667 lt!42287)))

(assert (=> d!23583 (= lt!42287 (containsKey!145 (toList!738 (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!41788))))

(assert (=> d!23583 (= (contains!750 (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41788) lt!42286)))

(declare-fun b!88495 () Bool)

(declare-fun lt!42289 () Unit!2582)

(assert (=> b!88495 (= e!57617 lt!42289)))

(assert (=> b!88495 (= lt!42289 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!41788))))

(assert (=> b!88495 (isDefined!94 (getValueByKey!142 (toList!738 (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!41788))))

(declare-fun b!88496 () Bool)

(declare-fun Unit!2615 () Unit!2582)

(assert (=> b!88496 (= e!57617 Unit!2615)))

(declare-fun b!88497 () Bool)

(assert (=> b!88497 (= e!57618 (isDefined!94 (getValueByKey!142 (toList!738 (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!41788)))))

(assert (= (and d!23583 c!14667) b!88495))

(assert (= (and d!23583 (not c!14667)) b!88496))

(assert (= (and d!23583 (not res!45295)) b!88497))

(declare-fun m!94661 () Bool)

(assert (=> d!23583 m!94661))

(declare-fun m!94663 () Bool)

(assert (=> b!88495 m!94663))

(declare-fun m!94665 () Bool)

(assert (=> b!88495 m!94665))

(assert (=> b!88495 m!94665))

(declare-fun m!94667 () Bool)

(assert (=> b!88495 m!94667))

(assert (=> b!88497 m!94665))

(assert (=> b!88497 m!94665))

(assert (=> b!88497 m!94667))

(assert (=> b!87814 d!23583))

(declare-fun d!23585 () Bool)

(assert (=> d!23585 (contains!750 (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41788)))

(declare-fun lt!42292 () Unit!2582)

(declare-fun choose!529 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2582)

(assert (=> d!23585 (= lt!42292 (choose!529 lt!41786 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41788))))

(assert (=> d!23585 (contains!750 lt!41786 lt!41788)))

(assert (=> d!23585 (= (addStillContains!59 lt!41786 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41788) lt!42292)))

(declare-fun bs!3736 () Bool)

(assert (= bs!3736 d!23585))

(assert (=> bs!3736 m!93637))

(assert (=> bs!3736 m!93637))

(assert (=> bs!3736 m!93639))

(declare-fun m!94669 () Bool)

(assert (=> bs!3736 m!94669))

(declare-fun m!94671 () Bool)

(assert (=> bs!3736 m!94671))

(assert (=> b!87814 d!23585))

(declare-fun d!23587 () Bool)

(assert (=> d!23587 (= (apply!83 (+!109 lt!41781 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41784) (get!1214 (getValueByKey!142 (toList!738 (+!109 lt!41781 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!41784)))))

(declare-fun bs!3737 () Bool)

(assert (= bs!3737 d!23587))

(declare-fun m!94673 () Bool)

(assert (=> bs!3737 m!94673))

(assert (=> bs!3737 m!94673))

(declare-fun m!94675 () Bool)

(assert (=> bs!3737 m!94675))

(assert (=> b!87814 d!23587))

(declare-fun d!23589 () Bool)

(assert (=> d!23589 (= (apply!83 lt!41781 lt!41784) (get!1214 (getValueByKey!142 (toList!738 lt!41781) lt!41784)))))

(declare-fun bs!3738 () Bool)

(assert (= bs!3738 d!23589))

(declare-fun m!94677 () Bool)

(assert (=> bs!3738 m!94677))

(assert (=> bs!3738 m!94677))

(declare-fun m!94679 () Bool)

(assert (=> bs!3738 m!94679))

(assert (=> b!87814 d!23589))

(declare-fun d!23591 () Bool)

(assert (=> d!23591 (= (apply!83 lt!41787 lt!41780) (get!1214 (getValueByKey!142 (toList!738 lt!41787) lt!41780)))))

(declare-fun bs!3739 () Bool)

(assert (= bs!3739 d!23591))

(declare-fun m!94681 () Bool)

(assert (=> bs!3739 m!94681))

(assert (=> bs!3739 m!94681))

(declare-fun m!94683 () Bool)

(assert (=> bs!3739 m!94683))

(assert (=> b!87814 d!23591))

(declare-fun d!23593 () Bool)

(assert (=> d!23593 (= (apply!83 (+!109 lt!41768 (tuple2!2193 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41773) (apply!83 lt!41768 lt!41773))))

(declare-fun lt!42295 () Unit!2582)

(declare-fun choose!530 (ListLongMap!1445 (_ BitVec 64) V!3033 (_ BitVec 64)) Unit!2582)

(assert (=> d!23593 (= lt!42295 (choose!530 lt!41768 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41773))))

(declare-fun e!57621 () Bool)

(assert (=> d!23593 e!57621))

(declare-fun res!45298 () Bool)

(assert (=> d!23593 (=> (not res!45298) (not e!57621))))

(assert (=> d!23593 (= res!45298 (contains!750 lt!41768 lt!41773))))

(assert (=> d!23593 (= (addApplyDifferent!59 lt!41768 lt!41776 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41773) lt!42295)))

(declare-fun b!88502 () Bool)

(assert (=> b!88502 (= e!57621 (not (= lt!41773 lt!41776)))))

(assert (= (and d!23593 res!45298) b!88502))

(assert (=> d!23593 m!93629))

(declare-fun m!94685 () Bool)

(assert (=> d!23593 m!94685))

(assert (=> d!23593 m!93629))

(assert (=> d!23593 m!93631))

(declare-fun m!94687 () Bool)

(assert (=> d!23593 m!94687))

(assert (=> d!23593 m!93647))

(assert (=> b!87814 d!23593))

(declare-fun d!23595 () Bool)

(assert (=> d!23595 (= (apply!83 (+!109 lt!41787 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41780) (apply!83 lt!41787 lt!41780))))

(declare-fun lt!42296 () Unit!2582)

(assert (=> d!23595 (= lt!42296 (choose!530 lt!41787 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41780))))

(declare-fun e!57622 () Bool)

(assert (=> d!23595 e!57622))

(declare-fun res!45299 () Bool)

(assert (=> d!23595 (=> (not res!45299) (not e!57622))))

(assert (=> d!23595 (= res!45299 (contains!750 lt!41787 lt!41780))))

(assert (=> d!23595 (= (addApplyDifferent!59 lt!41787 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41780) lt!42296)))

(declare-fun b!88503 () Bool)

(assert (=> b!88503 (= e!57622 (not (= lt!41780 lt!41771)))))

(assert (= (and d!23595 res!45299) b!88503))

(assert (=> d!23595 m!93633))

(declare-fun m!94689 () Bool)

(assert (=> d!23595 m!94689))

(assert (=> d!23595 m!93633))

(assert (=> d!23595 m!93635))

(declare-fun m!94691 () Bool)

(assert (=> d!23595 m!94691))

(assert (=> d!23595 m!93645))

(assert (=> b!87814 d!23595))

(declare-fun d!23597 () Bool)

(assert (=> d!23597 (= (apply!83 lt!41768 lt!41773) (get!1214 (getValueByKey!142 (toList!738 lt!41768) lt!41773)))))

(declare-fun bs!3740 () Bool)

(assert (= bs!3740 d!23597))

(declare-fun m!94693 () Bool)

(assert (=> bs!3740 m!94693))

(assert (=> bs!3740 m!94693))

(declare-fun m!94695 () Bool)

(assert (=> bs!3740 m!94695))

(assert (=> b!87814 d!23597))

(declare-fun d!23599 () Bool)

(assert (=> d!23599 (= (apply!83 (+!109 lt!41781 (tuple2!2193 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41784) (apply!83 lt!41781 lt!41784))))

(declare-fun lt!42297 () Unit!2582)

(assert (=> d!23599 (= lt!42297 (choose!530 lt!41781 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41784))))

(declare-fun e!57623 () Bool)

(assert (=> d!23599 e!57623))

(declare-fun res!45300 () Bool)

(assert (=> d!23599 (=> (not res!45300) (not e!57623))))

(assert (=> d!23599 (= res!45300 (contains!750 lt!41781 lt!41784))))

(assert (=> d!23599 (= (addApplyDifferent!59 lt!41781 lt!41777 (minValue!2248 (v!2664 (underlying!295 thiss!992))) lt!41784) lt!42297)))

(declare-fun b!88504 () Bool)

(assert (=> b!88504 (= e!57623 (not (= lt!41784 lt!41777)))))

(assert (= (and d!23599 res!45300) b!88504))

(assert (=> d!23599 m!93649))

(declare-fun m!94697 () Bool)

(assert (=> d!23599 m!94697))

(assert (=> d!23599 m!93649))

(assert (=> d!23599 m!93653))

(declare-fun m!94699 () Bool)

(assert (=> d!23599 m!94699))

(assert (=> d!23599 m!93643))

(assert (=> b!87814 d!23599))

(declare-fun d!23601 () Bool)

(assert (=> d!23601 (= (apply!83 (+!109 lt!41787 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!41780) (get!1214 (getValueByKey!142 (toList!738 (+!109 lt!41787 (tuple2!2193 lt!41771 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) lt!41780)))))

(declare-fun bs!3741 () Bool)

(assert (= bs!3741 d!23601))

(declare-fun m!94701 () Bool)

(assert (=> bs!3741 m!94701))

(assert (=> bs!3741 m!94701))

(declare-fun m!94703 () Bool)

(assert (=> bs!3741 m!94703))

(assert (=> b!87814 d!23601))

(declare-fun d!23603 () Bool)

(declare-fun e!57624 () Bool)

(assert (=> d!23603 e!57624))

(declare-fun res!45301 () Bool)

(assert (=> d!23603 (=> (not res!45301) (not e!57624))))

(declare-fun lt!42301 () ListLongMap!1445)

(assert (=> d!23603 (= res!45301 (contains!750 lt!42301 (_1!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!42299 () List!1512)

(assert (=> d!23603 (= lt!42301 (ListLongMap!1446 lt!42299))))

(declare-fun lt!42300 () Unit!2582)

(declare-fun lt!42298 () Unit!2582)

(assert (=> d!23603 (= lt!42300 lt!42298)))

(assert (=> d!23603 (= (getValueByKey!142 lt!42299 (_1!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23603 (= lt!42298 (lemmaContainsTupThenGetReturnValue!59 lt!42299 (_1!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23603 (= lt!42299 (insertStrictlySorted!62 (toList!738 lt!41786) (_1!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23603 (= (+!109 lt!41786 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!42301)))

(declare-fun b!88505 () Bool)

(declare-fun res!45302 () Bool)

(assert (=> b!88505 (=> (not res!45302) (not e!57624))))

(assert (=> b!88505 (= res!45302 (= (getValueByKey!142 (toList!738 lt!42301) (_1!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88506 () Bool)

(assert (=> b!88506 (= e!57624 (contains!753 (toList!738 lt!42301) (tuple2!2193 lt!41785 (zeroValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23603 res!45301) b!88505))

(assert (= (and b!88505 res!45302) b!88506))

(declare-fun m!94705 () Bool)

(assert (=> d!23603 m!94705))

(declare-fun m!94707 () Bool)

(assert (=> d!23603 m!94707))

(declare-fun m!94709 () Bool)

(assert (=> d!23603 m!94709))

(declare-fun m!94711 () Bool)

(assert (=> d!23603 m!94711))

(declare-fun m!94713 () Bool)

(assert (=> b!88505 m!94713))

(declare-fun m!94715 () Bool)

(assert (=> b!88506 m!94715))

(assert (=> b!87814 d!23603))

(declare-fun b!88510 () Bool)

(declare-fun e!57626 () Option!148)

(assert (=> b!88510 (= e!57626 None!146)))

(declare-fun b!88509 () Bool)

(assert (=> b!88509 (= e!57626 (getValueByKey!142 (t!5246 (toList!738 lt!41947)) (_1!1107 lt!41604)))))

(declare-fun b!88508 () Bool)

(declare-fun e!57625 () Option!148)

(assert (=> b!88508 (= e!57625 e!57626)))

(declare-fun c!14669 () Bool)

(assert (=> b!88508 (= c!14669 (and ((_ is Cons!1508) (toList!738 lt!41947)) (not (= (_1!1107 (h!2100 (toList!738 lt!41947))) (_1!1107 lt!41604)))))))

(declare-fun b!88507 () Bool)

(assert (=> b!88507 (= e!57625 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41947)))))))

(declare-fun d!23605 () Bool)

(declare-fun c!14668 () Bool)

(assert (=> d!23605 (= c!14668 (and ((_ is Cons!1508) (toList!738 lt!41947)) (= (_1!1107 (h!2100 (toList!738 lt!41947))) (_1!1107 lt!41604))))))

(assert (=> d!23605 (= (getValueByKey!142 (toList!738 lt!41947) (_1!1107 lt!41604)) e!57625)))

(assert (= (and d!23605 c!14668) b!88507))

(assert (= (and d!23605 (not c!14668)) b!88508))

(assert (= (and b!88508 c!14669) b!88509))

(assert (= (and b!88508 (not c!14669)) b!88510))

(declare-fun m!94717 () Bool)

(assert (=> b!88509 m!94717))

(assert (=> b!88056 d!23605))

(declare-fun d!23607 () Bool)

(declare-fun e!57629 () Bool)

(assert (=> d!23607 e!57629))

(declare-fun c!14672 () Bool)

(assert (=> d!23607 (= c!14672 (and (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23607 true))

(declare-fun _$29!111 () Unit!2582)

(assert (=> d!23607 (= (choose!520 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (_values!2341 (v!2664 (underlying!295 thiss!992))) (mask!6396 (v!2664 (underlying!295 thiss!992))) (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) (zeroValue!2248 (v!2664 (underlying!295 thiss!992))) (minValue!2248 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992)))) _$29!111)))

(declare-fun b!88515 () Bool)

(assert (=> b!88515 (= e!57629 (arrayContainsKey!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!88516 () Bool)

(assert (=> b!88516 (= e!57629 (ite (= (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2193 (v!2664 (underlying!295 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23607 c!14672) b!88515))

(assert (= (and d!23607 (not c!14672)) b!88516))

(assert (=> b!88515 m!93405))

(assert (=> b!88515 m!93417))

(assert (=> d!23351 d!23607))

(assert (=> d!23351 d!23383))

(declare-fun d!23609 () Bool)

(declare-fun lt!42302 () Bool)

(assert (=> d!23609 (= lt!42302 (select (content!92 (toList!738 lt!41952)) lt!41604))))

(declare-fun e!57631 () Bool)

(assert (=> d!23609 (= lt!42302 e!57631)))

(declare-fun res!45303 () Bool)

(assert (=> d!23609 (=> (not res!45303) (not e!57631))))

(assert (=> d!23609 (= res!45303 ((_ is Cons!1508) (toList!738 lt!41952)))))

(assert (=> d!23609 (= (contains!753 (toList!738 lt!41952) lt!41604) lt!42302)))

(declare-fun b!88517 () Bool)

(declare-fun e!57630 () Bool)

(assert (=> b!88517 (= e!57631 e!57630)))

(declare-fun res!45304 () Bool)

(assert (=> b!88517 (=> res!45304 e!57630)))

(assert (=> b!88517 (= res!45304 (= (h!2100 (toList!738 lt!41952)) lt!41604))))

(declare-fun b!88518 () Bool)

(assert (=> b!88518 (= e!57630 (contains!753 (t!5246 (toList!738 lt!41952)) lt!41604))))

(assert (= (and d!23609 res!45303) b!88517))

(assert (= (and b!88517 (not res!45304)) b!88518))

(declare-fun m!94719 () Bool)

(assert (=> d!23609 m!94719))

(declare-fun m!94721 () Bool)

(assert (=> d!23609 m!94721))

(declare-fun m!94723 () Bool)

(assert (=> b!88518 m!94723))

(assert (=> b!88059 d!23609))

(assert (=> b!88051 d!23483))

(declare-fun d!23611 () Bool)

(assert (=> d!23611 (isDefined!94 (getValueByKey!142 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun lt!42305 () Unit!2582)

(declare-fun choose!531 (List!1512 (_ BitVec 64)) Unit!2582)

(assert (=> d!23611 (= lt!42305 (choose!531 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun e!57634 () Bool)

(assert (=> d!23611 e!57634))

(declare-fun res!45307 () Bool)

(assert (=> d!23611 (=> (not res!45307) (not e!57634))))

(assert (=> d!23611 (= res!45307 (isStrictlySorted!286 (toList!738 lt!41605)))))

(assert (=> d!23611 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) lt!42305)))

(declare-fun b!88521 () Bool)

(assert (=> b!88521 (= e!57634 (containsKey!145 (toList!738 lt!41605) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23611 res!45307) b!88521))

(assert (=> d!23611 m!93405))

(assert (=> d!23611 m!93663))

(assert (=> d!23611 m!93663))

(assert (=> d!23611 m!93665))

(assert (=> d!23611 m!93405))

(declare-fun m!94725 () Bool)

(assert (=> d!23611 m!94725))

(declare-fun m!94727 () Bool)

(assert (=> d!23611 m!94727))

(assert (=> b!88521 m!93405))

(assert (=> b!88521 m!93659))

(assert (=> b!87827 d!23611))

(assert (=> b!87827 d!23571))

(assert (=> b!87827 d!23573))

(declare-fun b!88538 () Bool)

(declare-fun e!57643 () Bool)

(declare-fun e!57646 () Bool)

(assert (=> b!88538 (= e!57643 e!57646)))

(declare-fun c!14678 () Bool)

(declare-fun lt!42310 () SeekEntryResult!238)

(assert (=> b!88538 (= c!14678 ((_ is MissingVacant!238) lt!42310))))

(declare-fun b!88539 () Bool)

(declare-fun e!57644 () Bool)

(declare-fun call!8510 () Bool)

(assert (=> b!88539 (= e!57644 (not call!8510))))

(declare-fun call!8509 () Bool)

(declare-fun c!14677 () Bool)

(declare-fun bm!8506 () Bool)

(assert (=> bm!8506 (= call!8509 (inRange!0 (ite c!14677 (index!3090 lt!42310) (index!3093 lt!42310)) (mask!6396 newMap!16)))))

(declare-fun b!88540 () Bool)

(declare-fun res!45319 () Bool)

(declare-fun e!57645 () Bool)

(assert (=> b!88540 (=> (not res!45319) (not e!57645))))

(assert (=> b!88540 (= res!45319 call!8509)))

(assert (=> b!88540 (= e!57646 e!57645)))

(declare-fun d!23613 () Bool)

(assert (=> d!23613 e!57643))

(assert (=> d!23613 (= c!14677 ((_ is MissingZero!238) lt!42310))))

(assert (=> d!23613 (= lt!42310 (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(declare-fun lt!42311 () Unit!2582)

(declare-fun choose!532 (array!4025 array!4027 (_ BitVec 32) (_ BitVec 32) V!3033 V!3033 (_ BitVec 64) Int) Unit!2582)

(assert (=> d!23613 (= lt!42311 (choose!532 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)))))

(assert (=> d!23613 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23613 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!32 (_keys!4034 newMap!16) (_values!2341 newMap!16) (mask!6396 newMap!16) (extraKeys!2193 newMap!16) (zeroValue!2248 newMap!16) (minValue!2248 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) (defaultEntry!2358 newMap!16)) lt!42311)))

(declare-fun b!88541 () Bool)

(assert (=> b!88541 (= e!57645 (not call!8510))))

(declare-fun b!88542 () Bool)

(assert (=> b!88542 (= e!57646 ((_ is Undefined!238) lt!42310))))

(declare-fun bm!8507 () Bool)

(assert (=> bm!8507 (= call!8510 (arrayContainsKey!0 (_keys!4034 newMap!16) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!88543 () Bool)

(assert (=> b!88543 (= e!57643 e!57644)))

(declare-fun res!45316 () Bool)

(assert (=> b!88543 (= res!45316 call!8509)))

(assert (=> b!88543 (=> (not res!45316) (not e!57644))))

(declare-fun b!88544 () Bool)

(assert (=> b!88544 (and (bvsge (index!3090 lt!42310) #b00000000000000000000000000000000) (bvslt (index!3090 lt!42310) (size!2161 (_keys!4034 newMap!16))))))

(declare-fun res!45318 () Bool)

(assert (=> b!88544 (= res!45318 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3090 lt!42310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88544 (=> (not res!45318) (not e!57644))))

(declare-fun b!88545 () Bool)

(declare-fun res!45317 () Bool)

(assert (=> b!88545 (=> (not res!45317) (not e!57645))))

(assert (=> b!88545 (= res!45317 (= (select (arr!1916 (_keys!4034 newMap!16)) (index!3093 lt!42310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88545 (and (bvsge (index!3093 lt!42310) #b00000000000000000000000000000000) (bvslt (index!3093 lt!42310) (size!2161 (_keys!4034 newMap!16))))))

(assert (= (and d!23613 c!14677) b!88543))

(assert (= (and d!23613 (not c!14677)) b!88538))

(assert (= (and b!88543 res!45316) b!88544))

(assert (= (and b!88544 res!45318) b!88539))

(assert (= (and b!88538 c!14678) b!88540))

(assert (= (and b!88538 (not c!14678)) b!88542))

(assert (= (and b!88540 res!45319) b!88545))

(assert (= (and b!88545 res!45317) b!88541))

(assert (= (or b!88543 b!88540) bm!8506))

(assert (= (or b!88539 b!88541) bm!8507))

(declare-fun m!94729 () Bool)

(assert (=> bm!8506 m!94729))

(assert (=> d!23613 m!93405))

(assert (=> d!23613 m!93699))

(assert (=> d!23613 m!93405))

(declare-fun m!94731 () Bool)

(assert (=> d!23613 m!94731))

(assert (=> d!23613 m!93969))

(declare-fun m!94733 () Bool)

(assert (=> b!88545 m!94733))

(assert (=> bm!8507 m!93405))

(assert (=> bm!8507 m!93713))

(declare-fun m!94735 () Bool)

(assert (=> b!88544 m!94735))

(assert (=> bm!8419 d!23613))

(declare-fun d!23615 () Bool)

(declare-fun e!57647 () Bool)

(assert (=> d!23615 e!57647))

(declare-fun res!45320 () Bool)

(assert (=> d!23615 (=> (not res!45320) (not e!57647))))

(declare-fun lt!42315 () ListLongMap!1445)

(assert (=> d!23615 (= res!45320 (contains!750 lt!42315 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(declare-fun lt!42313 () List!1512)

(assert (=> d!23615 (= lt!42315 (ListLongMap!1446 lt!42313))))

(declare-fun lt!42314 () Unit!2582)

(declare-fun lt!42312 () Unit!2582)

(assert (=> d!23615 (= lt!42314 lt!42312)))

(assert (=> d!23615 (= (getValueByKey!142 lt!42313 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23615 (= lt!42312 (lemmaContainsTupThenGetReturnValue!59 lt!42313 (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23615 (= lt!42313 (insertStrictlySorted!62 (toList!738 call!8361) (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))))))

(assert (=> d!23615 (= (+!109 call!8361 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))) lt!42315)))

(declare-fun b!88546 () Bool)

(declare-fun res!45321 () Bool)

(assert (=> b!88546 (=> (not res!45321) (not e!57647))))

(assert (=> b!88546 (= res!45321 (= (getValueByKey!142 (toList!738 lt!42315) (_1!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992)))))) (Some!147 (_2!1107 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))))

(declare-fun b!88547 () Bool)

(assert (=> b!88547 (= e!57647 (contains!753 (toList!738 lt!42315) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2248 (v!2664 (underlying!295 thiss!992))))))))

(assert (= (and d!23615 res!45320) b!88546))

(assert (= (and b!88546 res!45321) b!88547))

(declare-fun m!94737 () Bool)

(assert (=> d!23615 m!94737))

(declare-fun m!94739 () Bool)

(assert (=> d!23615 m!94739))

(declare-fun m!94741 () Bool)

(assert (=> d!23615 m!94741))

(declare-fun m!94743 () Bool)

(assert (=> d!23615 m!94743))

(declare-fun m!94745 () Bool)

(assert (=> b!88546 m!94745))

(declare-fun m!94747 () Bool)

(assert (=> b!88547 m!94747))

(assert (=> b!87811 d!23615))

(declare-fun d!23617 () Bool)

(declare-fun lt!42316 () Bool)

(assert (=> d!23617 (= lt!42316 (select (content!92 (toList!738 lt!41918)) lt!41611))))

(declare-fun e!57649 () Bool)

(assert (=> d!23617 (= lt!42316 e!57649)))

(declare-fun res!45322 () Bool)

(assert (=> d!23617 (=> (not res!45322) (not e!57649))))

(assert (=> d!23617 (= res!45322 ((_ is Cons!1508) (toList!738 lt!41918)))))

(assert (=> d!23617 (= (contains!753 (toList!738 lt!41918) lt!41611) lt!42316)))

(declare-fun b!88548 () Bool)

(declare-fun e!57648 () Bool)

(assert (=> b!88548 (= e!57649 e!57648)))

(declare-fun res!45323 () Bool)

(assert (=> b!88548 (=> res!45323 e!57648)))

(assert (=> b!88548 (= res!45323 (= (h!2100 (toList!738 lt!41918)) lt!41611))))

(declare-fun b!88549 () Bool)

(assert (=> b!88549 (= e!57648 (contains!753 (t!5246 (toList!738 lt!41918)) lt!41611))))

(assert (= (and d!23617 res!45322) b!88548))

(assert (= (and b!88548 (not res!45323)) b!88549))

(declare-fun m!94749 () Bool)

(assert (=> d!23617 m!94749))

(declare-fun m!94751 () Bool)

(assert (=> d!23617 m!94751))

(declare-fun m!94753 () Bool)

(assert (=> b!88549 m!94753))

(assert (=> b!88017 d!23617))

(declare-fun b!88553 () Bool)

(declare-fun e!57651 () Option!148)

(assert (=> b!88553 (= e!57651 None!146)))

(declare-fun b!88552 () Bool)

(assert (=> b!88552 (= e!57651 (getValueByKey!142 (t!5246 (toList!738 lt!41952)) (_1!1107 lt!41604)))))

(declare-fun b!88551 () Bool)

(declare-fun e!57650 () Option!148)

(assert (=> b!88551 (= e!57650 e!57651)))

(declare-fun c!14680 () Bool)

(assert (=> b!88551 (= c!14680 (and ((_ is Cons!1508) (toList!738 lt!41952)) (not (= (_1!1107 (h!2100 (toList!738 lt!41952))) (_1!1107 lt!41604)))))))

(declare-fun b!88550 () Bool)

(assert (=> b!88550 (= e!57650 (Some!147 (_2!1107 (h!2100 (toList!738 lt!41952)))))))

(declare-fun d!23619 () Bool)

(declare-fun c!14679 () Bool)

(assert (=> d!23619 (= c!14679 (and ((_ is Cons!1508) (toList!738 lt!41952)) (= (_1!1107 (h!2100 (toList!738 lt!41952))) (_1!1107 lt!41604))))))

(assert (=> d!23619 (= (getValueByKey!142 (toList!738 lt!41952) (_1!1107 lt!41604)) e!57650)))

(assert (= (and d!23619 c!14679) b!88550))

(assert (= (and d!23619 (not c!14679)) b!88551))

(assert (= (and b!88551 c!14680) b!88552))

(assert (= (and b!88551 (not c!14680)) b!88553))

(declare-fun m!94755 () Bool)

(assert (=> b!88552 m!94755))

(assert (=> b!88058 d!23619))

(declare-fun d!23621 () Bool)

(declare-fun lt!42317 () Bool)

(assert (=> d!23621 (= lt!42317 (select (content!92 (toList!738 lt!41911)) lt!41611))))

(declare-fun e!57653 () Bool)

(assert (=> d!23621 (= lt!42317 e!57653)))

(declare-fun res!45324 () Bool)

(assert (=> d!23621 (=> (not res!45324) (not e!57653))))

(assert (=> d!23621 (= res!45324 ((_ is Cons!1508) (toList!738 lt!41911)))))

(assert (=> d!23621 (= (contains!753 (toList!738 lt!41911) lt!41611) lt!42317)))

(declare-fun b!88554 () Bool)

(declare-fun e!57652 () Bool)

(assert (=> b!88554 (= e!57653 e!57652)))

(declare-fun res!45325 () Bool)

(assert (=> b!88554 (=> res!45325 e!57652)))

(assert (=> b!88554 (= res!45325 (= (h!2100 (toList!738 lt!41911)) lt!41611))))

(declare-fun b!88555 () Bool)

(assert (=> b!88555 (= e!57652 (contains!753 (t!5246 (toList!738 lt!41911)) lt!41611))))

(assert (= (and d!23621 res!45324) b!88554))

(assert (= (and b!88554 (not res!45325)) b!88555))

(declare-fun m!94757 () Bool)

(assert (=> d!23621 m!94757))

(declare-fun m!94759 () Bool)

(assert (=> d!23621 m!94759))

(declare-fun m!94761 () Bool)

(assert (=> b!88555 m!94761))

(assert (=> b!88015 d!23621))

(assert (=> d!23333 d!23497))

(declare-fun d!23623 () Bool)

(declare-fun res!45326 () Bool)

(declare-fun e!57656 () Bool)

(assert (=> d!23623 (=> res!45326 e!57656)))

(assert (=> d!23623 (= res!45326 (bvsge #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(assert (=> d!23623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4034 newMap!16) (mask!6396 newMap!16)) e!57656)))

(declare-fun b!88556 () Bool)

(declare-fun e!57654 () Bool)

(declare-fun e!57655 () Bool)

(assert (=> b!88556 (= e!57654 e!57655)))

(declare-fun lt!42318 () (_ BitVec 64))

(assert (=> b!88556 (= lt!42318 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42319 () Unit!2582)

(assert (=> b!88556 (= lt!42319 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4034 newMap!16) lt!42318 #b00000000000000000000000000000000))))

(assert (=> b!88556 (arrayContainsKey!0 (_keys!4034 newMap!16) lt!42318 #b00000000000000000000000000000000)))

(declare-fun lt!42320 () Unit!2582)

(assert (=> b!88556 (= lt!42320 lt!42319)))

(declare-fun res!45327 () Bool)

(assert (=> b!88556 (= res!45327 (= (seekEntryOrOpen!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000) (_keys!4034 newMap!16) (mask!6396 newMap!16)) (Found!238 #b00000000000000000000000000000000)))))

(assert (=> b!88556 (=> (not res!45327) (not e!57655))))

(declare-fun b!88557 () Bool)

(declare-fun call!8511 () Bool)

(assert (=> b!88557 (= e!57655 call!8511)))

(declare-fun b!88558 () Bool)

(assert (=> b!88558 (= e!57656 e!57654)))

(declare-fun c!14681 () Bool)

(assert (=> b!88558 (= c!14681 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8508 () Bool)

(assert (=> bm!8508 (= call!8511 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4034 newMap!16) (mask!6396 newMap!16)))))

(declare-fun b!88559 () Bool)

(assert (=> b!88559 (= e!57654 call!8511)))

(assert (= (and d!23623 (not res!45326)) b!88558))

(assert (= (and b!88558 c!14681) b!88556))

(assert (= (and b!88558 (not c!14681)) b!88559))

(assert (= (and b!88556 res!45327) b!88557))

(assert (= (or b!88557 b!88559) bm!8508))

(assert (=> b!88556 m!93889))

(declare-fun m!94763 () Bool)

(assert (=> b!88556 m!94763))

(declare-fun m!94765 () Bool)

(assert (=> b!88556 m!94765))

(assert (=> b!88556 m!93889))

(declare-fun m!94767 () Bool)

(assert (=> b!88556 m!94767))

(assert (=> b!88558 m!93889))

(assert (=> b!88558 m!93889))

(assert (=> b!88558 m!94013))

(declare-fun m!94769 () Bool)

(assert (=> bm!8508 m!94769))

(assert (=> b!88008 d!23623))

(declare-fun b!88560 () Bool)

(declare-fun e!57657 () Bool)

(declare-fun e!57658 () Bool)

(assert (=> b!88560 (= e!57657 e!57658)))

(declare-fun c!14682 () Bool)

(assert (=> b!88560 (= c!14682 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!88561 () Bool)

(declare-fun e!57660 () Bool)

(assert (=> b!88561 (= e!57660 e!57657)))

(declare-fun res!45328 () Bool)

(assert (=> b!88561 (=> (not res!45328) (not e!57657))))

(declare-fun e!57659 () Bool)

(assert (=> b!88561 (= res!45328 (not e!57659))))

(declare-fun res!45329 () Bool)

(assert (=> b!88561 (=> (not res!45329) (not e!57659))))

(assert (=> b!88561 (= res!45329 (validKeyInArray!0 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!8509 () Bool)

(declare-fun call!8512 () Bool)

(assert (=> bm!8509 (= call!8512 (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14682 (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!14525 (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508) Nil!1508)) (ite c!14525 (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508) Nil!1508))))))

(declare-fun d!23625 () Bool)

(declare-fun res!45330 () Bool)

(assert (=> d!23625 (=> res!45330 e!57660)))

(assert (=> d!23625 (= res!45330 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2161 (_keys!4034 (v!2664 (underlying!295 thiss!992))))))))

(assert (=> d!23625 (= (arrayNoDuplicates!0 (_keys!4034 (v!2664 (underlying!295 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14525 (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508) Nil!1508)) e!57660)))

(declare-fun b!88562 () Bool)

(assert (=> b!88562 (= e!57658 call!8512)))

(declare-fun b!88563 () Bool)

(assert (=> b!88563 (= e!57659 (contains!752 (ite c!14525 (Cons!1507 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355) Nil!1508) Nil!1508) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!88564 () Bool)

(assert (=> b!88564 (= e!57658 call!8512)))

(assert (= (and d!23625 (not res!45330)) b!88561))

(assert (= (and b!88561 res!45329) b!88563))

(assert (= (and b!88561 res!45328) b!88560))

(assert (= (and b!88560 c!14682) b!88564))

(assert (= (and b!88560 (not c!14682)) b!88562))

(assert (= (or b!88564 b!88562) bm!8509))

(declare-fun m!94771 () Bool)

(assert (=> b!88560 m!94771))

(assert (=> b!88560 m!94771))

(declare-fun m!94773 () Bool)

(assert (=> b!88560 m!94773))

(assert (=> b!88561 m!94771))

(assert (=> b!88561 m!94771))

(assert (=> b!88561 m!94773))

(assert (=> bm!8509 m!94771))

(declare-fun m!94775 () Bool)

(assert (=> bm!8509 m!94775))

(assert (=> b!88563 m!94771))

(assert (=> b!88563 m!94771))

(declare-fun m!94777 () Bool)

(assert (=> b!88563 m!94777))

(assert (=> bm!8439 d!23625))

(declare-fun d!23627 () Bool)

(declare-fun res!45331 () Bool)

(declare-fun e!57661 () Bool)

(assert (=> d!23627 (=> (not res!45331) (not e!57661))))

(assert (=> d!23627 (= res!45331 (simpleValid!59 (_2!1108 lt!41879)))))

(assert (=> d!23627 (= (valid!339 (_2!1108 lt!41879)) e!57661)))

(declare-fun b!88565 () Bool)

(declare-fun res!45332 () Bool)

(assert (=> b!88565 (=> (not res!45332) (not e!57661))))

(assert (=> b!88565 (= res!45332 (= (arrayCountValidKeys!0 (_keys!4034 (_2!1108 lt!41879)) #b00000000000000000000000000000000 (size!2161 (_keys!4034 (_2!1108 lt!41879)))) (_size!429 (_2!1108 lt!41879))))))

(declare-fun b!88566 () Bool)

(declare-fun res!45333 () Bool)

(assert (=> b!88566 (=> (not res!45333) (not e!57661))))

(assert (=> b!88566 (= res!45333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4034 (_2!1108 lt!41879)) (mask!6396 (_2!1108 lt!41879))))))

(declare-fun b!88567 () Bool)

(assert (=> b!88567 (= e!57661 (arrayNoDuplicates!0 (_keys!4034 (_2!1108 lt!41879)) #b00000000000000000000000000000000 Nil!1508))))

(assert (= (and d!23627 res!45331) b!88565))

(assert (= (and b!88565 res!45332) b!88566))

(assert (= (and b!88566 res!45333) b!88567))

(declare-fun m!94779 () Bool)

(assert (=> d!23627 m!94779))

(declare-fun m!94781 () Bool)

(assert (=> b!88565 m!94781))

(declare-fun m!94783 () Bool)

(assert (=> b!88566 m!94783))

(declare-fun m!94785 () Bool)

(assert (=> b!88567 m!94785))

(assert (=> d!23339 d!23627))

(assert (=> d!23339 d!23365))

(declare-fun d!23629 () Bool)

(declare-fun e!57663 () Bool)

(assert (=> d!23629 e!57663))

(declare-fun res!45334 () Bool)

(assert (=> d!23629 (=> res!45334 e!57663)))

(declare-fun lt!42321 () Bool)

(assert (=> d!23629 (= res!45334 (not lt!42321))))

(declare-fun lt!42322 () Bool)

(assert (=> d!23629 (= lt!42321 lt!42322)))

(declare-fun lt!42323 () Unit!2582)

(declare-fun e!57662 () Unit!2582)

(assert (=> d!23629 (= lt!42323 e!57662)))

(declare-fun c!14683 () Bool)

(assert (=> d!23629 (= c!14683 lt!42322)))

(assert (=> d!23629 (= lt!42322 (containsKey!145 (toList!738 lt!41774) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23629 (= (contains!750 lt!41774 #b1000000000000000000000000000000000000000000000000000000000000000) lt!42321)))

(declare-fun b!88568 () Bool)

(declare-fun lt!42324 () Unit!2582)

(assert (=> b!88568 (= e!57662 lt!42324)))

(assert (=> b!88568 (= lt!42324 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41774) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88568 (isDefined!94 (getValueByKey!142 (toList!738 lt!41774) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88569 () Bool)

(declare-fun Unit!2616 () Unit!2582)

(assert (=> b!88569 (= e!57662 Unit!2616)))

(declare-fun b!88570 () Bool)

(assert (=> b!88570 (= e!57663 (isDefined!94 (getValueByKey!142 (toList!738 lt!41774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23629 c!14683) b!88568))

(assert (= (and d!23629 (not c!14683)) b!88569))

(assert (= (and d!23629 (not res!45334)) b!88570))

(declare-fun m!94787 () Bool)

(assert (=> d!23629 m!94787))

(declare-fun m!94789 () Bool)

(assert (=> b!88568 m!94789))

(assert (=> b!88568 m!94557))

(assert (=> b!88568 m!94557))

(declare-fun m!94791 () Bool)

(assert (=> b!88568 m!94791))

(assert (=> b!88570 m!94557))

(assert (=> b!88570 m!94557))

(assert (=> b!88570 m!94791))

(assert (=> bm!8359 d!23629))

(declare-fun d!23631 () Bool)

(declare-fun isEmpty!346 (List!1512) Bool)

(assert (=> d!23631 (= (isEmpty!344 lt!41935) (isEmpty!346 (toList!738 lt!41935)))))

(declare-fun bs!3742 () Bool)

(assert (= bs!3742 d!23631))

(declare-fun m!94793 () Bool)

(assert (=> bs!3742 m!94793))

(assert (=> b!88043 d!23631))

(declare-fun b!88579 () Bool)

(declare-fun res!45346 () Bool)

(declare-fun e!57666 () Bool)

(assert (=> b!88579 (=> (not res!45346) (not e!57666))))

(assert (=> b!88579 (= res!45346 (and (= (size!2162 (_values!2341 newMap!16)) (bvadd (mask!6396 newMap!16) #b00000000000000000000000000000001)) (= (size!2161 (_keys!4034 newMap!16)) (size!2162 (_values!2341 newMap!16))) (bvsge (_size!429 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!429 newMap!16) (bvadd (mask!6396 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!88582 () Bool)

(assert (=> b!88582 (= e!57666 (and (bvsge (extraKeys!2193 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2193 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!429 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!23633 () Bool)

(declare-fun res!45345 () Bool)

(assert (=> d!23633 (=> (not res!45345) (not e!57666))))

(assert (=> d!23633 (= res!45345 (validMask!0 (mask!6396 newMap!16)))))

(assert (=> d!23633 (= (simpleValid!59 newMap!16) e!57666)))

(declare-fun b!88580 () Bool)

(declare-fun res!45343 () Bool)

(assert (=> b!88580 (=> (not res!45343) (not e!57666))))

(declare-fun size!2167 (LongMapFixedSize!760) (_ BitVec 32))

(assert (=> b!88580 (= res!45343 (bvsge (size!2167 newMap!16) (_size!429 newMap!16)))))

(declare-fun b!88581 () Bool)

(declare-fun res!45344 () Bool)

(assert (=> b!88581 (=> (not res!45344) (not e!57666))))

(assert (=> b!88581 (= res!45344 (= (size!2167 newMap!16) (bvadd (_size!429 newMap!16) (bvsdiv (bvadd (extraKeys!2193 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!23633 res!45345) b!88579))

(assert (= (and b!88579 res!45346) b!88580))

(assert (= (and b!88580 res!45343) b!88581))

(assert (= (and b!88581 res!45344) b!88582))

(assert (=> d!23633 m!93969))

(declare-fun m!94795 () Bool)

(assert (=> b!88580 m!94795))

(assert (=> b!88581 m!94795))

(assert (=> d!23365 d!23633))

(declare-fun d!23635 () Bool)

(declare-fun lt!42327 () Bool)

(declare-fun content!93 (List!1511) (InoxSet (_ BitVec 64)))

(assert (=> d!23635 (= lt!42327 (select (content!93 Nil!1508) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun e!57671 () Bool)

(assert (=> d!23635 (= lt!42327 e!57671)))

(declare-fun res!45351 () Bool)

(assert (=> d!23635 (=> (not res!45351) (not e!57671))))

(assert (=> d!23635 (= res!45351 ((_ is Cons!1507) Nil!1508))))

(assert (=> d!23635 (= (contains!752 Nil!1508 (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)) lt!42327)))

(declare-fun b!88587 () Bool)

(declare-fun e!57672 () Bool)

(assert (=> b!88587 (= e!57671 e!57672)))

(declare-fun res!45352 () Bool)

(assert (=> b!88587 (=> res!45352 e!57672)))

(assert (=> b!88587 (= res!45352 (= (h!2099 Nil!1508) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(declare-fun b!88588 () Bool)

(assert (=> b!88588 (= e!57672 (contains!752 (t!5245 Nil!1508) (select (arr!1916 (_keys!4034 (v!2664 (underlying!295 thiss!992)))) from!355)))))

(assert (= (and d!23635 res!45351) b!88587))

(assert (= (and b!88587 (not res!45352)) b!88588))

(declare-fun m!94797 () Bool)

(assert (=> d!23635 m!94797))

(assert (=> d!23635 m!93405))

(declare-fun m!94799 () Bool)

(assert (=> d!23635 m!94799))

(assert (=> b!88588 m!93405))

(declare-fun m!94801 () Bool)

(assert (=> b!88588 m!94801))

(assert (=> b!87981 d!23635))

(declare-fun e!57678 () Bool)

(declare-fun b!88589 () Bool)

(declare-fun lt!42335 () ListLongMap!1445)

(assert (=> b!88589 (= e!57678 (= (apply!83 lt!42335 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16))))))

(declare-fun c!14688 () Bool)

(declare-fun b!88590 () Bool)

(assert (=> b!88590 (= c!14688 (and (not (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57685 () ListLongMap!1445)

(declare-fun e!57684 () ListLongMap!1445)

(assert (=> b!88590 (= e!57685 e!57684)))

(declare-fun b!88591 () Bool)

(declare-fun e!57676 () Bool)

(declare-fun e!57683 () Bool)

(assert (=> b!88591 (= e!57676 e!57683)))

(declare-fun res!45357 () Bool)

(declare-fun call!8515 () Bool)

(assert (=> b!88591 (= res!45357 call!8515)))

(assert (=> b!88591 (=> (not res!45357) (not e!57683))))

(declare-fun b!88592 () Bool)

(declare-fun e!57681 () Bool)

(declare-fun e!57677 () Bool)

(assert (=> b!88592 (= e!57681 e!57677)))

(declare-fun res!45355 () Bool)

(assert (=> b!88592 (=> (not res!45355) (not e!57677))))

(assert (=> b!88592 (= res!45355 (contains!750 lt!42335 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!88592 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88593 () Bool)

(assert (=> b!88593 (= e!57677 (= (apply!83 lt!42335 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)) (get!1210 (select (arr!1917 (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!345 (defaultEntry!2358 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2162 (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))))))))

(assert (=> b!88593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88594 () Bool)

(declare-fun e!57680 () Bool)

(assert (=> b!88594 (= e!57680 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88595 () Bool)

(declare-fun call!8514 () ListLongMap!1445)

(assert (=> b!88595 (= e!57684 call!8514)))

(declare-fun c!14689 () Bool)

(declare-fun call!8516 () ListLongMap!1445)

(declare-fun call!8513 () ListLongMap!1445)

(declare-fun call!8517 () ListLongMap!1445)

(declare-fun bm!8510 () Bool)

(declare-fun c!14685 () Bool)

(assert (=> bm!8510 (= call!8513 (+!109 (ite c!14685 call!8516 (ite c!14689 call!8517 call!8514)) (ite (or c!14685 c!14689) (tuple2!2193 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2248 newMap!16)) (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16))))))))

(declare-fun bm!8511 () Bool)

(declare-fun call!8519 () Bool)

(assert (=> bm!8511 (= call!8519 (contains!750 lt!42335 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88596 () Bool)

(declare-fun res!45361 () Bool)

(declare-fun e!57675 () Bool)

(assert (=> b!88596 (=> (not res!45361) (not e!57675))))

(assert (=> b!88596 (= res!45361 e!57681)))

(declare-fun res!45353 () Bool)

(assert (=> b!88596 (=> res!45353 e!57681)))

(declare-fun e!57679 () Bool)

(assert (=> b!88596 (= res!45353 (not e!57679))))

(declare-fun res!45358 () Bool)

(assert (=> b!88596 (=> (not res!45358) (not e!57679))))

(assert (=> b!88596 (= res!45358 (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun b!88597 () Bool)

(declare-fun e!57673 () Unit!2582)

(declare-fun Unit!2617 () Unit!2582)

(assert (=> b!88597 (= e!57673 Unit!2617)))

(declare-fun bm!8512 () Bool)

(declare-fun call!8518 () ListLongMap!1445)

(assert (=> bm!8512 (= call!8518 call!8513)))

(declare-fun d!23637 () Bool)

(assert (=> d!23637 e!57675))

(declare-fun res!45356 () Bool)

(assert (=> d!23637 (=> (not res!45356) (not e!57675))))

(assert (=> d!23637 (= res!45356 (or (bvsge #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))))

(declare-fun lt!42336 () ListLongMap!1445)

(assert (=> d!23637 (= lt!42335 lt!42336)))

(declare-fun lt!42339 () Unit!2582)

(assert (=> d!23637 (= lt!42339 e!57673)))

(declare-fun c!14686 () Bool)

(assert (=> d!23637 (= c!14686 e!57680)))

(declare-fun res!45359 () Bool)

(assert (=> d!23637 (=> (not res!45359) (not e!57680))))

(assert (=> d!23637 (= res!45359 (bvslt #b00000000000000000000000000000000 (size!2161 (_keys!4034 newMap!16))))))

(declare-fun e!57674 () ListLongMap!1445)

(assert (=> d!23637 (= lt!42336 e!57674)))

(assert (=> d!23637 (= c!14685 (and (not (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23637 (validMask!0 (mask!6396 newMap!16))))

(assert (=> d!23637 (= (getCurrentListMap!431 (_keys!4034 newMap!16) (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))) (mask!6396 newMap!16) (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)) lt!42335)))

(declare-fun b!88598 () Bool)

(declare-fun e!57682 () Bool)

(assert (=> b!88598 (= e!57682 (not call!8519))))

(declare-fun b!88599 () Bool)

(assert (=> b!88599 (= e!57676 (not call!8515))))

(declare-fun b!88600 () Bool)

(assert (=> b!88600 (= e!57674 (+!109 call!8513 (tuple2!2193 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)))))))

(declare-fun b!88601 () Bool)

(assert (=> b!88601 (= e!57685 call!8518)))

(declare-fun b!88602 () Bool)

(declare-fun res!45360 () Bool)

(assert (=> b!88602 (=> (not res!45360) (not e!57675))))

(assert (=> b!88602 (= res!45360 e!57676)))

(declare-fun c!14687 () Bool)

(assert (=> b!88602 (= c!14687 (not (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!8513 () Bool)

(assert (=> bm!8513 (= call!8517 call!8516)))

(declare-fun bm!8514 () Bool)

(assert (=> bm!8514 (= call!8516 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))) (mask!6396 newMap!16) (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun b!88603 () Bool)

(declare-fun lt!42328 () Unit!2582)

(assert (=> b!88603 (= e!57673 lt!42328)))

(declare-fun lt!42347 () ListLongMap!1445)

(assert (=> b!88603 (= lt!42347 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))) (mask!6396 newMap!16) (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42346 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42349 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42349 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42343 () Unit!2582)

(assert (=> b!88603 (= lt!42343 (addStillContains!59 lt!42347 lt!42346 (zeroValue!2248 newMap!16) lt!42349))))

(assert (=> b!88603 (contains!750 (+!109 lt!42347 (tuple2!2193 lt!42346 (zeroValue!2248 newMap!16))) lt!42349)))

(declare-fun lt!42344 () Unit!2582)

(assert (=> b!88603 (= lt!42344 lt!42343)))

(declare-fun lt!42342 () ListLongMap!1445)

(assert (=> b!88603 (= lt!42342 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))) (mask!6396 newMap!16) (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42338 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42338 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42345 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42345 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42330 () Unit!2582)

(assert (=> b!88603 (= lt!42330 (addApplyDifferent!59 lt!42342 lt!42338 (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) lt!42345))))

(assert (=> b!88603 (= (apply!83 (+!109 lt!42342 (tuple2!2193 lt!42338 (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)))) lt!42345) (apply!83 lt!42342 lt!42345))))

(declare-fun lt!42340 () Unit!2582)

(assert (=> b!88603 (= lt!42340 lt!42330)))

(declare-fun lt!42329 () ListLongMap!1445)

(assert (=> b!88603 (= lt!42329 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))) (mask!6396 newMap!16) (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42337 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42334 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42334 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42333 () Unit!2582)

(assert (=> b!88603 (= lt!42333 (addApplyDifferent!59 lt!42329 lt!42337 (zeroValue!2248 newMap!16) lt!42334))))

(assert (=> b!88603 (= (apply!83 (+!109 lt!42329 (tuple2!2193 lt!42337 (zeroValue!2248 newMap!16))) lt!42334) (apply!83 lt!42329 lt!42334))))

(declare-fun lt!42331 () Unit!2582)

(assert (=> b!88603 (= lt!42331 lt!42333)))

(declare-fun lt!42348 () ListLongMap!1445)

(assert (=> b!88603 (= lt!42348 (getCurrentListMapNoExtraKeys!74 (_keys!4034 newMap!16) (ite (or c!14519 c!14510) (_values!2341 newMap!16) (array!4028 (store (arr!1917 (_values!2341 newMap!16)) (index!3091 lt!41866) (ValueCellFull!926 lt!41609)) (size!2162 (_values!2341 newMap!16)))) (mask!6396 newMap!16) (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) (zeroValue!2248 newMap!16) (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2358 newMap!16)))))

(declare-fun lt!42332 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42332 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42341 () (_ BitVec 64))

(assert (=> b!88603 (= lt!42341 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88603 (= lt!42328 (addApplyDifferent!59 lt!42348 lt!42332 (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)) lt!42341))))

(assert (=> b!88603 (= (apply!83 (+!109 lt!42348 (tuple2!2193 lt!42332 (ite c!14519 (ite c!14506 (minValue!2248 newMap!16) lt!41609) (minValue!2248 newMap!16)))) lt!42341) (apply!83 lt!42348 lt!42341))))

(declare-fun b!88604 () Bool)

(assert (=> b!88604 (= e!57683 (= (apply!83 lt!42335 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2248 newMap!16)))))

(declare-fun b!88605 () Bool)

(assert (=> b!88605 (= e!57682 e!57678)))

(declare-fun res!45354 () Bool)

(assert (=> b!88605 (= res!45354 call!8519)))

(assert (=> b!88605 (=> (not res!45354) (not e!57678))))

(declare-fun b!88606 () Bool)

(assert (=> b!88606 (= e!57684 call!8518)))

(declare-fun b!88607 () Bool)

(assert (=> b!88607 (= e!57679 (validKeyInArray!0 (select (arr!1916 (_keys!4034 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!88608 () Bool)

(assert (=> b!88608 (= e!57674 e!57685)))

(assert (=> b!88608 (= c!14689 (and (not (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!88609 () Bool)

(assert (=> b!88609 (= e!57675 e!57682)))

(declare-fun c!14684 () Bool)

(assert (=> b!88609 (= c!14684 (not (= (bvand (ite c!14519 (ite c!14506 (extraKeys!2193 newMap!16) lt!41870) (extraKeys!2193 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!8515 () Bool)

(assert (=> bm!8515 (= call!8514 call!8517)))

(declare-fun bm!8516 () Bool)

(assert (=> bm!8516 (= call!8515 (contains!750 lt!42335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!23637 c!14685) b!88600))

(assert (= (and d!23637 (not c!14685)) b!88608))

(assert (= (and b!88608 c!14689) b!88601))

(assert (= (and b!88608 (not c!14689)) b!88590))

(assert (= (and b!88590 c!14688) b!88606))

(assert (= (and b!88590 (not c!14688)) b!88595))

(assert (= (or b!88606 b!88595) bm!8515))

(assert (= (or b!88601 bm!8515) bm!8513))

(assert (= (or b!88601 b!88606) bm!8512))

(assert (= (or b!88600 bm!8513) bm!8514))

(assert (= (or b!88600 bm!8512) bm!8510))

(assert (= (and d!23637 res!45359) b!88594))

(assert (= (and d!23637 c!14686) b!88603))

(assert (= (and d!23637 (not c!14686)) b!88597))

(assert (= (and d!23637 res!45356) b!88596))

(assert (= (and b!88596 res!45358) b!88607))

(assert (= (and b!88596 (not res!45353)) b!88592))

(assert (= (and b!88592 res!45355) b!88593))

(assert (= (and b!88596 res!45361) b!88602))

(assert (= (and b!88602 c!14687) b!88591))

(assert (= (and b!88602 (not c!14687)) b!88599))

(assert (= (and b!88591 res!45357) b!88604))

(assert (= (or b!88591 b!88599) bm!8516))

(assert (= (and b!88602 res!45360) b!88609))

(assert (= (and b!88609 c!14684) b!88605))

(assert (= (and b!88609 (not c!14684)) b!88598))

(assert (= (and b!88605 res!45354) b!88589))

(assert (= (or b!88605 b!88598) bm!8511))

(declare-fun b_lambda!3915 () Bool)

(assert (=> (not b_lambda!3915) (not b!88593)))

(assert (=> b!88593 t!5259))

(declare-fun b_and!5321 () Bool)

(assert (= b_and!5317 (and (=> t!5259 result!2951) b_and!5321)))

(assert (=> b!88593 t!5261))

(declare-fun b_and!5323 () Bool)

(assert (= b_and!5319 (and (=> t!5261 result!2953) b_and!5323)))

(declare-fun m!94803 () Bool)

(assert (=> b!88589 m!94803))

(assert (=> b!88607 m!93889))

(assert (=> b!88607 m!93889))

(assert (=> b!88607 m!94013))

(declare-fun m!94805 () Bool)

(assert (=> b!88604 m!94805))

(declare-fun m!94807 () Bool)

(assert (=> bm!8511 m!94807))

(declare-fun m!94809 () Bool)

(assert (=> b!88600 m!94809))

(declare-fun m!94811 () Bool)

(assert (=> bm!8514 m!94811))

(assert (=> b!88592 m!93889))

(assert (=> b!88592 m!93889))

(declare-fun m!94813 () Bool)

(assert (=> b!88592 m!94813))

(assert (=> d!23637 m!93969))

(declare-fun m!94815 () Bool)

(assert (=> bm!8516 m!94815))

(declare-fun m!94817 () Bool)

(assert (=> b!88593 m!94817))

(assert (=> b!88593 m!94029))

(declare-fun m!94819 () Bool)

(assert (=> b!88593 m!94819))

(assert (=> b!88593 m!94029))

(assert (=> b!88593 m!94817))

(assert (=> b!88593 m!93889))

(declare-fun m!94821 () Bool)

(assert (=> b!88593 m!94821))

(assert (=> b!88593 m!93889))

(declare-fun m!94823 () Bool)

(assert (=> bm!8510 m!94823))

(assert (=> b!88594 m!93889))

(assert (=> b!88594 m!93889))

(assert (=> b!88594 m!94013))

(declare-fun m!94825 () Bool)

(assert (=> b!88603 m!94825))

(declare-fun m!94827 () Bool)

(assert (=> b!88603 m!94827))

(declare-fun m!94829 () Bool)

(assert (=> b!88603 m!94829))

(declare-fun m!94831 () Bool)

(assert (=> b!88603 m!94831))

(declare-fun m!94833 () Bool)

(assert (=> b!88603 m!94833))

(declare-fun m!94835 () Bool)

(assert (=> b!88603 m!94835))

(declare-fun m!94837 () Bool)

(assert (=> b!88603 m!94837))

(declare-fun m!94839 () Bool)

(assert (=> b!88603 m!94839))

(declare-fun m!94841 () Bool)

(assert (=> b!88603 m!94841))

(declare-fun m!94843 () Bool)

(assert (=> b!88603 m!94843))

(declare-fun m!94845 () Bool)

(assert (=> b!88603 m!94845))

(assert (=> b!88603 m!94825))

(assert (=> b!88603 m!94833))

(assert (=> b!88603 m!93889))

(assert (=> b!88603 m!94811))

(declare-fun m!94847 () Bool)

(assert (=> b!88603 m!94847))

(assert (=> b!88603 m!94845))

(declare-fun m!94849 () Bool)

(assert (=> b!88603 m!94849))

(assert (=> b!88603 m!94829))

(declare-fun m!94851 () Bool)

(assert (=> b!88603 m!94851))

(declare-fun m!94853 () Bool)

(assert (=> b!88603 m!94853))

(assert (=> bm!8433 d!23637))

(assert (=> b!87978 d!23525))

(declare-fun d!23639 () Bool)

(declare-fun e!57687 () Bool)

(assert (=> d!23639 e!57687))

(declare-fun res!45362 () Bool)

(assert (=> d!23639 (=> res!45362 e!57687)))

(declare-fun lt!42350 () Bool)

(assert (=> d!23639 (= res!45362 (not lt!42350))))

(declare-fun lt!42351 () Bool)

(assert (=> d!23639 (= lt!42350 lt!42351)))

(declare-fun lt!42352 () Unit!2582)

(declare-fun e!57686 () Unit!2582)

(assert (=> d!23639 (= lt!42352 e!57686)))

(declare-fun c!14690 () Bool)

(assert (=> d!23639 (= c!14690 lt!42351)))

(assert (=> d!23639 (= lt!42351 (containsKey!145 (toList!738 lt!41774) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23639 (= (contains!750 lt!41774 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42350)))

(declare-fun b!88610 () Bool)

(declare-fun lt!42353 () Unit!2582)

(assert (=> b!88610 (= e!57686 lt!42353)))

(assert (=> b!88610 (= lt!42353 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41774) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88610 (isDefined!94 (getValueByKey!142 (toList!738 lt!41774) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88611 () Bool)

(declare-fun Unit!2618 () Unit!2582)

(assert (=> b!88611 (= e!57686 Unit!2618)))

(declare-fun b!88612 () Bool)

(assert (=> b!88612 (= e!57687 (isDefined!94 (getValueByKey!142 (toList!738 lt!41774) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23639 c!14690) b!88610))

(assert (= (and d!23639 (not c!14690)) b!88611))

(assert (= (and d!23639 (not res!45362)) b!88612))

(declare-fun m!94855 () Bool)

(assert (=> d!23639 m!94855))

(declare-fun m!94857 () Bool)

(assert (=> b!88610 m!94857))

(assert (=> b!88610 m!94087))

(assert (=> b!88610 m!94087))

(declare-fun m!94859 () Bool)

(assert (=> b!88610 m!94859))

(assert (=> b!88612 m!94087))

(assert (=> b!88612 m!94087))

(assert (=> b!88612 m!94859))

(assert (=> bm!8364 d!23639))

(declare-fun d!23641 () Bool)

(declare-fun e!57689 () Bool)

(assert (=> d!23641 e!57689))

(declare-fun res!45363 () Bool)

(assert (=> d!23641 (=> res!45363 e!57689)))

(declare-fun lt!42354 () Bool)

(assert (=> d!23641 (= res!45363 (not lt!42354))))

(declare-fun lt!42355 () Bool)

(assert (=> d!23641 (= lt!42354 lt!42355)))

(declare-fun lt!42356 () Unit!2582)

(declare-fun e!57688 () Unit!2582)

(assert (=> d!23641 (= lt!42356 e!57688)))

(declare-fun c!14691 () Bool)

(assert (=> d!23641 (= c!14691 lt!42355)))

(assert (=> d!23641 (= lt!42355 (containsKey!145 (toList!738 lt!41952) (_1!1107 lt!41604)))))

(assert (=> d!23641 (= (contains!750 lt!41952 (_1!1107 lt!41604)) lt!42354)))

(declare-fun b!88613 () Bool)

(declare-fun lt!42357 () Unit!2582)

(assert (=> b!88613 (= e!57688 lt!42357)))

(assert (=> b!88613 (= lt!42357 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!738 lt!41952) (_1!1107 lt!41604)))))

(assert (=> b!88613 (isDefined!94 (getValueByKey!142 (toList!738 lt!41952) (_1!1107 lt!41604)))))

(declare-fun b!88614 () Bool)

(declare-fun Unit!2619 () Unit!2582)

(assert (=> b!88614 (= e!57688 Unit!2619)))

(declare-fun b!88615 () Bool)

(assert (=> b!88615 (= e!57689 (isDefined!94 (getValueByKey!142 (toList!738 lt!41952) (_1!1107 lt!41604))))))

(assert (= (and d!23641 c!14691) b!88613))

(assert (= (and d!23641 (not c!14691)) b!88614))

(assert (= (and d!23641 (not res!45363)) b!88615))

(declare-fun m!94861 () Bool)

(assert (=> d!23641 m!94861))

(declare-fun m!94863 () Bool)

(assert (=> b!88613 m!94863))

(assert (=> b!88613 m!93857))

(assert (=> b!88613 m!93857))

(declare-fun m!94865 () Bool)

(assert (=> b!88613 m!94865))

(assert (=> b!88615 m!93857))

(assert (=> b!88615 m!93857))

(assert (=> b!88615 m!94865))

(assert (=> d!23381 d!23641))

(declare-fun b!88619 () Bool)

(declare-fun e!57691 () Option!148)

(assert (=> b!88619 (= e!57691 None!146)))

(declare-fun b!88618 () Bool)

(assert (=> b!88618 (= e!57691 (getValueByKey!142 (t!5246 lt!41950) (_1!1107 lt!41604)))))

(declare-fun b!88617 () Bool)

(declare-fun e!57690 () Option!148)

(assert (=> b!88617 (= e!57690 e!57691)))

(declare-fun c!14693 () Bool)

(assert (=> b!88617 (= c!14693 (and ((_ is Cons!1508) lt!41950) (not (= (_1!1107 (h!2100 lt!41950)) (_1!1107 lt!41604)))))))

(declare-fun b!88616 () Bool)

(assert (=> b!88616 (= e!57690 (Some!147 (_2!1107 (h!2100 lt!41950))))))

(declare-fun d!23643 () Bool)

(declare-fun c!14692 () Bool)

(assert (=> d!23643 (= c!14692 (and ((_ is Cons!1508) lt!41950) (= (_1!1107 (h!2100 lt!41950)) (_1!1107 lt!41604))))))

(assert (=> d!23643 (= (getValueByKey!142 lt!41950 (_1!1107 lt!41604)) e!57690)))

(assert (= (and d!23643 c!14692) b!88616))

(assert (= (and d!23643 (not c!14692)) b!88617))

(assert (= (and b!88617 c!14693) b!88618))

(assert (= (and b!88617 (not c!14693)) b!88619))

(declare-fun m!94867 () Bool)

(assert (=> b!88618 m!94867))

(assert (=> d!23381 d!23643))

(declare-fun d!23645 () Bool)

(assert (=> d!23645 (= (getValueByKey!142 lt!41950 (_1!1107 lt!41604)) (Some!147 (_2!1107 lt!41604)))))

(declare-fun lt!42358 () Unit!2582)

(assert (=> d!23645 (= lt!42358 (choose!524 lt!41950 (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(declare-fun e!57692 () Bool)

(assert (=> d!23645 e!57692))

(declare-fun res!45364 () Bool)

(assert (=> d!23645 (=> (not res!45364) (not e!57692))))

(assert (=> d!23645 (= res!45364 (isStrictlySorted!286 lt!41950))))

(assert (=> d!23645 (= (lemmaContainsTupThenGetReturnValue!59 lt!41950 (_1!1107 lt!41604) (_2!1107 lt!41604)) lt!42358)))

(declare-fun b!88620 () Bool)

(declare-fun res!45365 () Bool)

(assert (=> b!88620 (=> (not res!45365) (not e!57692))))

(assert (=> b!88620 (= res!45365 (containsKey!145 lt!41950 (_1!1107 lt!41604)))))

(declare-fun b!88621 () Bool)

(assert (=> b!88621 (= e!57692 (contains!753 lt!41950 (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604))))))

(assert (= (and d!23645 res!45364) b!88620))

(assert (= (and b!88620 res!45365) b!88621))

(assert (=> d!23645 m!93851))

(declare-fun m!94869 () Bool)

(assert (=> d!23645 m!94869))

(declare-fun m!94871 () Bool)

(assert (=> d!23645 m!94871))

(declare-fun m!94873 () Bool)

(assert (=> b!88620 m!94873))

(declare-fun m!94875 () Bool)

(assert (=> b!88621 m!94875))

(assert (=> d!23381 d!23645))

(declare-fun b!88622 () Bool)

(declare-fun e!57694 () List!1512)

(declare-fun call!8521 () List!1512)

(assert (=> b!88622 (= e!57694 call!8521)))

(declare-fun b!88623 () Bool)

(declare-fun res!45366 () Bool)

(declare-fun e!57696 () Bool)

(assert (=> b!88623 (=> (not res!45366) (not e!57696))))

(declare-fun lt!42359 () List!1512)

(assert (=> b!88623 (= res!45366 (containsKey!145 lt!42359 (_1!1107 lt!41604)))))

(declare-fun b!88624 () Bool)

(assert (=> b!88624 (= e!57696 (contains!753 lt!42359 (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604))))))

(declare-fun bm!8517 () Bool)

(declare-fun e!57695 () List!1512)

(declare-fun c!14697 () Bool)

(declare-fun call!8520 () List!1512)

(assert (=> bm!8517 (= call!8520 ($colon$colon!72 e!57695 (ite c!14697 (h!2100 (toList!738 lt!41600)) (tuple2!2193 (_1!1107 lt!41604) (_2!1107 lt!41604)))))))

(declare-fun c!14694 () Bool)

(assert (=> bm!8517 (= c!14694 c!14697)))

(declare-fun b!88625 () Bool)

(declare-fun c!14696 () Bool)

(declare-fun c!14695 () Bool)

(assert (=> b!88625 (= e!57695 (ite c!14695 (t!5246 (toList!738 lt!41600)) (ite c!14696 (Cons!1508 (h!2100 (toList!738 lt!41600)) (t!5246 (toList!738 lt!41600))) Nil!1509)))))

(declare-fun b!88626 () Bool)

(assert (=> b!88626 (= e!57695 (insertStrictlySorted!62 (t!5246 (toList!738 lt!41600)) (_1!1107 lt!41604) (_2!1107 lt!41604)))))

(declare-fun b!88627 () Bool)

(declare-fun e!57697 () List!1512)

(declare-fun e!57693 () List!1512)

(assert (=> b!88627 (= e!57697 e!57693)))

(assert (=> b!88627 (= c!14695 (and ((_ is Cons!1508) (toList!738 lt!41600)) (= (_1!1107 (h!2100 (toList!738 lt!41600))) (_1!1107 lt!41604))))))

(declare-fun b!88628 () Bool)

(declare-fun call!8522 () List!1512)

(assert (=> b!88628 (= e!57693 call!8522)))

(declare-fun bm!8519 () Bool)

(assert (=> bm!8519 (= call!8522 call!8520)))

(declare-fun b!88629 () Bool)

(assert (=> b!88629 (= c!14696 (and ((_ is Cons!1508) (toList!738 lt!41600)) (bvsgt (_1!1107 (h!2100 (toList!738 lt!41600))) (_1!1107 lt!41604))))))

(assert (=> b!88629 (= e!57693 e!57694)))

(declare-fun b!88630 () Bool)

(assert (=> b!88630 (= e!57697 call!8520)))

(declare-fun b!88631 () Bool)

(assert (=> b!88631 (= e!57694 call!8521)))

(declare-fun d!23647 () Bool)

(assert (=> d!23647 e!57696))

(declare-fun res!45367 () Bool)

(assert (=> d!23647 (=> (not res!45367) (not e!57696))))

(assert (=> d!23647 (= res!45367 (isStrictlySorted!286 lt!42359))))

(assert (=> d!23647 (= lt!42359 e!57697)))

(assert (=> d!23647 (= c!14697 (and ((_ is Cons!1508) (toList!738 lt!41600)) (bvslt (_1!1107 (h!2100 (toList!738 lt!41600))) (_1!1107 lt!41604))))))

(assert (=> d!23647 (isStrictlySorted!286 (toList!738 lt!41600))))

(assert (=> d!23647 (= (insertStrictlySorted!62 (toList!738 lt!41600) (_1!1107 lt!41604) (_2!1107 lt!41604)) lt!42359)))

(declare-fun bm!8518 () Bool)

(assert (=> bm!8518 (= call!8521 call!8522)))

(assert (= (and d!23647 c!14697) b!88630))

(assert (= (and d!23647 (not c!14697)) b!88627))

(assert (= (and b!88627 c!14695) b!88628))

(assert (= (and b!88627 (not c!14695)) b!88629))

(assert (= (and b!88629 c!14696) b!88622))

(assert (= (and b!88629 (not c!14696)) b!88631))

(assert (= (or b!88622 b!88631) bm!8518))

(assert (= (or b!88628 bm!8518) bm!8519))

(assert (= (or b!88630 bm!8519) bm!8517))

(assert (= (and bm!8517 c!14694) b!88626))

(assert (= (and bm!8517 (not c!14694)) b!88625))

(assert (= (and d!23647 res!45367) b!88623))

(assert (= (and b!88623 res!45366) b!88624))

(declare-fun m!94877 () Bool)

(assert (=> b!88623 m!94877))

(declare-fun m!94879 () Bool)

(assert (=> d!23647 m!94879))

(assert (=> d!23647 m!94581))

(declare-fun m!94881 () Bool)

(assert (=> b!88624 m!94881))

(declare-fun m!94883 () Bool)

(assert (=> b!88626 m!94883))

(declare-fun m!94885 () Bool)

(assert (=> bm!8517 m!94885))

(assert (=> d!23381 d!23647))

(declare-fun b!88633 () Bool)

(declare-fun e!57699 () Bool)

(assert (=> b!88633 (= e!57699 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3437 () Bool)

(declare-fun mapRes!3437 () Bool)

(declare-fun tp!8999 () Bool)

(declare-fun e!57698 () Bool)

(assert (=> mapNonEmpty!3437 (= mapRes!3437 (and tp!8999 e!57698))))

(declare-fun mapValue!3437 () ValueCell!926)

(declare-fun mapKey!3437 () (_ BitVec 32))

(declare-fun mapRest!3437 () (Array (_ BitVec 32) ValueCell!926))

(assert (=> mapNonEmpty!3437 (= mapRest!3436 (store mapRest!3437 mapKey!3437 mapValue!3437))))

(declare-fun b!88632 () Bool)

(assert (=> b!88632 (= e!57698 tp_is_empty!2539)))

(declare-fun mapIsEmpty!3437 () Bool)

(assert (=> mapIsEmpty!3437 mapRes!3437))

(declare-fun condMapEmpty!3437 () Bool)

(declare-fun mapDefault!3437 () ValueCell!926)

(assert (=> mapNonEmpty!3436 (= condMapEmpty!3437 (= mapRest!3436 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3437)))))

(assert (=> mapNonEmpty!3436 (= tp!8998 (and e!57699 mapRes!3437))))

(assert (= (and mapNonEmpty!3436 condMapEmpty!3437) mapIsEmpty!3437))

(assert (= (and mapNonEmpty!3436 (not condMapEmpty!3437)) mapNonEmpty!3437))

(assert (= (and mapNonEmpty!3437 ((_ is ValueCellFull!926) mapValue!3437)) b!88632))

(assert (= (and mapNonEmpty!3436 ((_ is ValueCellFull!926) mapDefault!3437)) b!88633))

(declare-fun m!94887 () Bool)

(assert (=> mapNonEmpty!3437 m!94887))

(declare-fun b!88635 () Bool)

(declare-fun e!57701 () Bool)

(assert (=> b!88635 (= e!57701 tp_is_empty!2539)))

(declare-fun mapNonEmpty!3438 () Bool)

(declare-fun mapRes!3438 () Bool)

(declare-fun tp!9000 () Bool)

(declare-fun e!57700 () Bool)

(assert (=> mapNonEmpty!3438 (= mapRes!3438 (and tp!9000 e!57700))))

(declare-fun mapValue!3438 () ValueCell!926)

(declare-fun mapKey!3438 () (_ BitVec 32))

(declare-fun mapRest!3438 () (Array (_ BitVec 32) ValueCell!926))

(assert (=> mapNonEmpty!3438 (= mapRest!3435 (store mapRest!3438 mapKey!3438 mapValue!3438))))

(declare-fun b!88634 () Bool)

(assert (=> b!88634 (= e!57700 tp_is_empty!2539)))

(declare-fun mapIsEmpty!3438 () Bool)

(assert (=> mapIsEmpty!3438 mapRes!3438))

(declare-fun condMapEmpty!3438 () Bool)

(declare-fun mapDefault!3438 () ValueCell!926)

(assert (=> mapNonEmpty!3435 (= condMapEmpty!3438 (= mapRest!3435 ((as const (Array (_ BitVec 32) ValueCell!926)) mapDefault!3438)))))

(assert (=> mapNonEmpty!3435 (= tp!8997 (and e!57701 mapRes!3438))))

(assert (= (and mapNonEmpty!3435 condMapEmpty!3438) mapIsEmpty!3438))

(assert (= (and mapNonEmpty!3435 (not condMapEmpty!3438)) mapNonEmpty!3438))

(assert (= (and mapNonEmpty!3438 ((_ is ValueCellFull!926) mapValue!3438)) b!88634))

(assert (= (and mapNonEmpty!3435 ((_ is ValueCellFull!926) mapDefault!3438)) b!88635))

(declare-fun m!94889 () Bool)

(assert (=> mapNonEmpty!3438 m!94889))

(declare-fun b_lambda!3917 () Bool)

(assert (= b_lambda!3915 (or (and b!87608 b_free!2245 (= (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) (defaultEntry!2358 newMap!16))) (and b!87620 b_free!2247) b_lambda!3917)))

(declare-fun b_lambda!3919 () Bool)

(assert (= b_lambda!3907 (or (and b!87608 b_free!2245 (= (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) (defaultEntry!2358 newMap!16))) (and b!87620 b_free!2247) b_lambda!3919)))

(declare-fun b_lambda!3921 () Bool)

(assert (= b_lambda!3913 (or (and b!87608 b_free!2245 (= (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))) (defaultEntry!2358 newMap!16))) (and b!87620 b_free!2247) b_lambda!3921)))

(declare-fun b_lambda!3923 () Bool)

(assert (= b_lambda!3909 (or (and b!87608 b_free!2245) (and b!87620 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))) b_lambda!3923)))

(declare-fun b_lambda!3925 () Bool)

(assert (= b_lambda!3911 (or (and b!87608 b_free!2245) (and b!87620 b_free!2247 (= (defaultEntry!2358 newMap!16) (defaultEntry!2358 (v!2664 (underlying!295 thiss!992))))) b_lambda!3925)))

(check-sat (not b!88422) (not b!88101) (not bm!8474) (not b!88570) (not b!88624) (not d!23557) (not b!88229) (not b!88087) (not d!23495) (not b!88096) (not b!88155) (not d!23637) (not b!88492) (not d!23443) (not d!23627) (not d!23481) (not d!23615) (not b!88299) (not d!23537) (not d!23475) (not b!88615) (not d!23425) (not b!88205) (not b!88295) (not b!88332) (not b_lambda!3925) (not b!88451) (not b!88431) (not b!88623) (not bm!8483) (not b!88613) (not bm!8448) (not b!88505) (not b!88566) (not b!88482) (not d!23553) (not b!88137) (not d!23611) (not b!88111) (not b!88414) (not d!23435) (not b!88269) (not d!23581) (not bm!8514) (not b!88489) (not d!23391) (not b!88290) (not b!88088) (not d!23609) (not d!23451) (not b!88515) (not d!23427) (not d!23545) (not d!23633) (not b!88266) (not d!23521) (not bm!8446) (not b!88620) (not d!23595) (not b!88336) (not d!23423) (not bm!8447) (not d!23635) (not d!23613) (not b!88118) (not b!88281) (not b!88494) (not b!88417) (not bm!8494) (not b!88230) (not b!88306) (not b!88227) (not b!88607) (not b!88456) (not b!88612) (not d!23429) (not b!88237) (not d!23431) (not b!88610) (not b!88471) (not b!88272) (not b!88592) (not d!23599) (not b!88402) (not bm!8510) (not b!88392) (not b!88085) (not b!88082) (not b!88401) (not b!88090) (not bm!8477) (not d!23499) (not d!23505) (not b!88285) (not d!23569) (not b!88271) (not d!23395) (not bm!8499) (not b_lambda!3921) (not b!88441) (not mapNonEmpty!3438) (not bm!8495) (not b!88618) (not d!23547) (not d!23403) (not b!88092) (not b!88448) (not d!23417) (not mapNonEmpty!3437) (not bm!8516) (not b!88089) (not b!88470) (not d!23527) (not b!88484) (not b!88323) (not b!88561) (not d!23589) (not b!88175) (not b!88261) (not b!88603) (not b!88333) (not b!88565) (not b!88318) (not bm!8507) (not b!88568) (not b!88563) (not d!23603) (not b!88134) (not b!88487) (not b!88309) (not d!23647) (not b!88555) (not b!88549) (not d!23541) (not b!88257) (not b!88083) (not b!88221) (not d!23513) (not b!88412) (not b!88164) (not b_lambda!3917) (not d!23583) (not b!88232) (not bm!8508) (not d!23441) (not b!88160) (not b!88604) (not bm!8496) (not b!88081) (not b!88162) (not b!88467) (not b_lambda!3919) (not b!88453) (not b!88403) (not b_lambda!3923) (not b!88419) (not b!88115) (not b!88223) (not b!88396) (not bm!8451) (not b!88084) (not b!88161) (not b!88241) (not b!88110) (not d!23561) (not b!88473) (not b!88556) (not b!88274) (not b!88446) (not b!88405) (not b!88086) b_and!5323 (not b!88580) (not b!88493) (not b!88075) (not b!88567) (not b!88224) (not b!88491) (not b!88108) (not d!23459) (not b!88394) (not bm!8463) (not bm!8492) (not b!88207) (not b!88480) (not b!88112) (not b!88558) (not d!23469) (not b!88222) (not b!88094) (not b!88282) (not b!88291) (not d!23437) (not b!88307) (not b!88220) (not b!88436) (not bm!8469) (not b_lambda!3901) (not b!88560) (not b!88552) (not d!23591) (not bm!8468) (not d!23511) (not d!23489) (not b!88476) (not d!23453) (not b!88141) (not b!88280) (not b!88439) (not b!88626) (not d!23629) (not d!23507) (not b!88133) (not d!23523) (not d!23601) (not d!23645) (not b!88506) (not b!88594) (not b_lambda!3903) (not b!88425) b_and!5321 (not b!88589) (not b!88243) (not bm!8506) (not b!88225) (not bm!8460) (not d!23535) (not d!23461) (not d!23575) (not bm!8511) (not d!23421) (not b!88304) (not bm!8453) (not b!88301) (not b!88581) (not d!23565) (not d!23577) (not d!23413) (not b!88219) (not b!88457) (not b!88518) (not d!23501) (not d!23555) (not bm!8473) (not bm!8517) (not b_next!2247) (not b!88497) (not b!88119) (not d!23479) (not b!88546) (not b!88116) (not b!88420) (not d!23617) (not d!23549) (not bm!8509) (not b!88339) (not d!23483) (not b!88263) (not b!88213) (not d!23497) (not b!88390) (not b!88322) (not d!23457) (not b!88124) (not b!88123) (not b!88217) (not b!88113) (not b!88204) (not b!88410) (not b!88297) (not d!23445) (not d!23397) (not b_lambda!3905) (not b!88310) (not b!88312) (not b!88340) (not d!23517) (not b!88423) (not b!88621) (not d!23579) (not b!88600) (not d!23407) (not bm!8472) (not d!23641) (not b_next!2245) (not d!23559) (not b!88407) (not b_lambda!3893) (not d!23639) (not b!88375) (not d!23571) (not b!88521) (not b!88376) (not d!23631) (not b!88509) (not d!23621) (not b!88404) (not b!88181) (not b!88235) (not b!88287) (not b!88459) (not d!23409) (not b!88454) (not b!88226) (not b!88238) (not d!23585) (not b!88383) (not b!88593) (not d!23597) (not b!88588) (not b!88214) (not bm!8481) (not d!23455) (not bm!8478) (not d!23503) (not b!88130) (not d!23419) (not b!88321) (not b!88293) (not b!88182) (not d!23399) (not b!88433) (not b!88329) (not b!88289) (not b!88122) (not b!88547) (not d!23593) (not d!23467) (not b!88389) (not d!23493) (not d!23411) (not b!88495) (not d!23433) (not d!23587) (not d!23509) tp_is_empty!2539 (not b!88268) (not b!88490) (not b!88294) (not b!88393) (not b!88388) (not b!88240) (not d!23401) (not d!23463))
(check-sat b_and!5321 b_and!5323 (not b_next!2245) (not b_next!2247))
