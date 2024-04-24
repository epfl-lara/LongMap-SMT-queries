; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8262 () Bool)

(assert start!8262)

(declare-fun b!52703 () Bool)

(declare-fun b_free!1681 () Bool)

(declare-fun b_next!1681 () Bool)

(assert (=> b!52703 (= b_free!1681 (not b_next!1681))))

(declare-fun tp!7144 () Bool)

(declare-fun b_and!2901 () Bool)

(assert (=> b!52703 (= tp!7144 b_and!2901)))

(declare-fun b!52704 () Bool)

(declare-fun b_free!1683 () Bool)

(declare-fun b_next!1683 () Bool)

(assert (=> b!52704 (= b_free!1683 (not b_next!1683))))

(declare-fun tp!7145 () Bool)

(declare-fun b_and!2903 () Bool)

(assert (=> b!52704 (= tp!7145 b_and!2903)))

(declare-fun mapIsEmpty!2441 () Bool)

(declare-fun mapRes!2441 () Bool)

(assert (=> mapIsEmpty!2441 mapRes!2441))

(declare-fun b!52698 () Bool)

(declare-fun res!29932 () Bool)

(declare-fun e!34358 () Bool)

(assert (=> b!52698 (=> (not res!29932) (not e!34358))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!2657 0))(
  ( (V!2658 (val!1173 Int)) )
))
(declare-datatypes ((array!3423 0))(
  ( (array!3424 (arr!1634 (Array (_ BitVec 32) (_ BitVec 64))) (size!1863 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!785 0))(
  ( (ValueCellFull!785 (v!2235 V!2657)) (EmptyCell!785) )
))
(declare-datatypes ((array!3425 0))(
  ( (array!3426 (arr!1635 (Array (_ BitVec 32) ValueCell!785)) (size!1864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!478 0))(
  ( (LongMapFixedSize!479 (defaultEntry!1953 Int) (mask!5782 (_ BitVec 32)) (extraKeys!1844 (_ BitVec 32)) (zeroValue!1871 V!2657) (minValue!1871 V!2657) (_size!288 (_ BitVec 32)) (_keys!3573 array!3423) (_values!1936 array!3425) (_vacant!288 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!298 0))(
  ( (Cell!299 (v!2236 LongMapFixedSize!478)) )
))
(declare-datatypes ((LongMap!298 0))(
  ( (LongMap!299 (underlying!160 Cell!298)) )
))
(declare-fun thiss!992 () LongMap!298)

(assert (=> b!52698 (= res!29932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1863 (_keys!3573 (v!2236 (underlying!160 thiss!992)))))))))

(declare-fun mapNonEmpty!2441 () Bool)

(declare-fun mapRes!2442 () Bool)

(declare-fun tp!7143 () Bool)

(declare-fun e!34357 () Bool)

(assert (=> mapNonEmpty!2441 (= mapRes!2442 (and tp!7143 e!34357))))

(declare-fun mapKey!2441 () (_ BitVec 32))

(declare-fun mapRest!2441 () (Array (_ BitVec 32) ValueCell!785))

(declare-fun mapValue!2442 () ValueCell!785)

(assert (=> mapNonEmpty!2441 (= (arr!1635 (_values!1936 (v!2236 (underlying!160 thiss!992)))) (store mapRest!2441 mapKey!2441 mapValue!2442))))

(declare-fun mapNonEmpty!2442 () Bool)

(declare-fun tp!7146 () Bool)

(declare-fun e!34348 () Bool)

(assert (=> mapNonEmpty!2442 (= mapRes!2441 (and tp!7146 e!34348))))

(declare-fun mapKey!2442 () (_ BitVec 32))

(declare-fun mapRest!2442 () (Array (_ BitVec 32) ValueCell!785))

(declare-fun newMap!16 () LongMapFixedSize!478)

(declare-fun mapValue!2441 () ValueCell!785)

(assert (=> mapNonEmpty!2442 (= (arr!1635 (_values!1936 newMap!16)) (store mapRest!2442 mapKey!2442 mapValue!2441))))

(declare-fun b!52699 () Bool)

(declare-fun res!29930 () Bool)

(declare-fun e!34354 () Bool)

(assert (=> b!52699 (=> (not res!29930) (not e!34354))))

(assert (=> b!52699 (= res!29930 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1863 (_keys!3573 (v!2236 (underlying!160 thiss!992)))))))))

(declare-fun b!52701 () Bool)

(declare-fun e!34349 () Bool)

(declare-fun tp_is_empty!2257 () Bool)

(assert (=> b!52701 (= e!34349 tp_is_empty!2257)))

(declare-fun b!52702 () Bool)

(declare-fun res!29926 () Bool)

(assert (=> b!52702 (=> (not res!29926) (not e!34354))))

(assert (=> b!52702 (= res!29926 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5782 newMap!16)) (_size!288 (v!2236 (underlying!160 thiss!992)))))))

(declare-fun e!34353 () Bool)

(declare-fun e!34351 () Bool)

(declare-fun array_inv!993 (array!3423) Bool)

(declare-fun array_inv!994 (array!3425) Bool)

(assert (=> b!52703 (= e!34353 (and tp!7144 tp_is_empty!2257 (array_inv!993 (_keys!3573 (v!2236 (underlying!160 thiss!992)))) (array_inv!994 (_values!1936 (v!2236 (underlying!160 thiss!992)))) e!34351))))

(declare-fun e!34350 () Bool)

(declare-fun e!34352 () Bool)

(assert (=> b!52704 (= e!34352 (and tp!7145 tp_is_empty!2257 (array_inv!993 (_keys!3573 newMap!16)) (array_inv!994 (_values!1936 newMap!16)) e!34350))))

(declare-fun b!52705 () Bool)

(declare-fun e!34347 () Bool)

(assert (=> b!52705 (= e!34354 e!34347)))

(declare-fun res!29925 () Bool)

(assert (=> b!52705 (=> (not res!29925) (not e!34347))))

(declare-datatypes ((tuple2!1842 0))(
  ( (tuple2!1843 (_1!932 (_ BitVec 64)) (_2!932 V!2657)) )
))
(declare-datatypes ((List!1329 0))(
  ( (Nil!1326) (Cons!1325 (h!1905 tuple2!1842) (t!4379 List!1329)) )
))
(declare-datatypes ((ListLongMap!1247 0))(
  ( (ListLongMap!1248 (toList!639 List!1329)) )
))
(declare-fun lt!21298 () ListLongMap!1247)

(declare-fun lt!21296 () ListLongMap!1247)

(assert (=> b!52705 (= res!29925 (and (= lt!21298 lt!21296) (not (= (select (arr!1634 (_keys!3573 (v!2236 (underlying!160 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1634 (_keys!3573 (v!2236 (underlying!160 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1020 (LongMapFixedSize!478) ListLongMap!1247)

(assert (=> b!52705 (= lt!21296 (map!1020 newMap!16))))

(declare-fun getCurrentListMap!346 (array!3423 array!3425 (_ BitVec 32) (_ BitVec 32) V!2657 V!2657 (_ BitVec 32) Int) ListLongMap!1247)

(assert (=> b!52705 (= lt!21298 (getCurrentListMap!346 (_keys!3573 (v!2236 (underlying!160 thiss!992))) (_values!1936 (v!2236 (underlying!160 thiss!992))) (mask!5782 (v!2236 (underlying!160 thiss!992))) (extraKeys!1844 (v!2236 (underlying!160 thiss!992))) (zeroValue!1871 (v!2236 (underlying!160 thiss!992))) (minValue!1871 (v!2236 (underlying!160 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1953 (v!2236 (underlying!160 thiss!992)))))))

(declare-fun b!52706 () Bool)

(assert (=> b!52706 (= e!34347 e!34358)))

(declare-fun res!29929 () Bool)

(assert (=> b!52706 (=> (not res!29929) (not e!34358))))

(declare-fun contains!618 (ListLongMap!1247 (_ BitVec 64)) Bool)

(assert (=> b!52706 (= res!29929 (contains!618 lt!21296 (select (arr!1634 (_keys!3573 (v!2236 (underlying!160 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1844 0))(
  ( (tuple2!1845 (_1!933 Bool) (_2!933 LongMapFixedSize!478)) )
))
(declare-fun lt!21299 () tuple2!1844)

(declare-fun update!48 (LongMapFixedSize!478 (_ BitVec 64) V!2657) tuple2!1844)

(declare-fun get!983 (ValueCell!785 V!2657) V!2657)

(declare-fun dynLambda!266 (Int (_ BitVec 64)) V!2657)

(assert (=> b!52706 (= lt!21299 (update!48 newMap!16 (select (arr!1634 (_keys!3573 (v!2236 (underlying!160 thiss!992)))) from!355) (get!983 (select (arr!1635 (_values!1936 (v!2236 (underlying!160 thiss!992)))) from!355) (dynLambda!266 (defaultEntry!1953 (v!2236 (underlying!160 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!52707 () Bool)

(declare-fun res!29927 () Bool)

(assert (=> b!52707 (=> (not res!29927) (not e!34358))))

(assert (=> b!52707 (= res!29927 (and (= (size!1864 (_values!1936 (v!2236 (underlying!160 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5782 (v!2236 (underlying!160 thiss!992))))) (= (size!1863 (_keys!3573 (v!2236 (underlying!160 thiss!992)))) (size!1864 (_values!1936 (v!2236 (underlying!160 thiss!992))))) (bvsge (mask!5782 (v!2236 (underlying!160 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1844 (v!2236 (underlying!160 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1844 (v!2236 (underlying!160 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!52708 () Bool)

(declare-fun e!34359 () Bool)

(assert (=> b!52708 (= e!34359 tp_is_empty!2257)))

(declare-fun b!52709 () Bool)

(declare-fun res!29931 () Bool)

(assert (=> b!52709 (=> (not res!29931) (not e!34358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52709 (= res!29931 (validMask!0 (mask!5782 (v!2236 (underlying!160 thiss!992)))))))

(declare-fun b!52710 () Bool)

(assert (=> b!52710 (= e!34358 false)))

(declare-fun lt!21297 () Bool)

(assert (=> b!52710 (= lt!21297 (contains!618 lt!21298 (select (arr!1634 (_keys!3573 (v!2236 (underlying!160 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!2442 () Bool)

(assert (=> mapIsEmpty!2442 mapRes!2442))

(declare-fun b!52711 () Bool)

(assert (=> b!52711 (= e!34348 tp_is_empty!2257)))

(declare-fun b!52712 () Bool)

(declare-fun res!29934 () Bool)

(assert (=> b!52712 (=> (not res!29934) (not e!34354))))

(declare-fun valid!182 (LongMapFixedSize!478) Bool)

(assert (=> b!52712 (= res!29934 (valid!182 newMap!16))))

(declare-fun res!29935 () Bool)

(assert (=> start!8262 (=> (not res!29935) (not e!34354))))

(declare-fun valid!183 (LongMap!298) Bool)

(assert (=> start!8262 (= res!29935 (valid!183 thiss!992))))

(assert (=> start!8262 e!34354))

(declare-fun e!34360 () Bool)

(assert (=> start!8262 e!34360))

(assert (=> start!8262 true))

(assert (=> start!8262 e!34352))

(declare-fun b!52700 () Bool)

(declare-fun e!34355 () Bool)

(assert (=> b!52700 (= e!34355 e!34353)))

(declare-fun b!52713 () Bool)

(assert (=> b!52713 (= e!34360 e!34355)))

(declare-fun b!52714 () Bool)

(assert (=> b!52714 (= e!34357 tp_is_empty!2257)))

(declare-fun b!52715 () Bool)

(declare-fun res!29928 () Bool)

(assert (=> b!52715 (=> (not res!29928) (not e!34358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3423 (_ BitVec 32)) Bool)

(assert (=> b!52715 (= res!29928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3573 (v!2236 (underlying!160 thiss!992))) (mask!5782 (v!2236 (underlying!160 thiss!992)))))))

(declare-fun b!52716 () Bool)

(assert (=> b!52716 (= e!34350 (and e!34359 mapRes!2441))))

(declare-fun condMapEmpty!2441 () Bool)

(declare-fun mapDefault!2442 () ValueCell!785)

(assert (=> b!52716 (= condMapEmpty!2441 (= (arr!1635 (_values!1936 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!785)) mapDefault!2442)))))

(declare-fun b!52717 () Bool)

(assert (=> b!52717 (= e!34351 (and e!34349 mapRes!2442))))

(declare-fun condMapEmpty!2442 () Bool)

(declare-fun mapDefault!2441 () ValueCell!785)

(assert (=> b!52717 (= condMapEmpty!2442 (= (arr!1635 (_values!1936 (v!2236 (underlying!160 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!785)) mapDefault!2441)))))

(declare-fun b!52718 () Bool)

(declare-fun res!29933 () Bool)

(assert (=> b!52718 (=> (not res!29933) (not e!34358))))

(declare-datatypes ((List!1330 0))(
  ( (Nil!1327) (Cons!1326 (h!1906 (_ BitVec 64)) (t!4380 List!1330)) )
))
(declare-fun arrayNoDuplicates!0 (array!3423 (_ BitVec 32) List!1330) Bool)

(assert (=> b!52718 (= res!29933 (arrayNoDuplicates!0 (_keys!3573 (v!2236 (underlying!160 thiss!992))) #b00000000000000000000000000000000 Nil!1327))))

(assert (= (and start!8262 res!29935) b!52699))

(assert (= (and b!52699 res!29930) b!52712))

(assert (= (and b!52712 res!29934) b!52702))

(assert (= (and b!52702 res!29926) b!52705))

(assert (= (and b!52705 res!29925) b!52706))

(assert (= (and b!52706 res!29929) b!52709))

(assert (= (and b!52709 res!29931) b!52707))

(assert (= (and b!52707 res!29927) b!52715))

(assert (= (and b!52715 res!29928) b!52718))

(assert (= (and b!52718 res!29933) b!52698))

(assert (= (and b!52698 res!29932) b!52710))

(assert (= (and b!52717 condMapEmpty!2442) mapIsEmpty!2442))

(assert (= (and b!52717 (not condMapEmpty!2442)) mapNonEmpty!2441))

(get-info :version)

(assert (= (and mapNonEmpty!2441 ((_ is ValueCellFull!785) mapValue!2442)) b!52714))

(assert (= (and b!52717 ((_ is ValueCellFull!785) mapDefault!2441)) b!52701))

(assert (= b!52703 b!52717))

(assert (= b!52700 b!52703))

(assert (= b!52713 b!52700))

(assert (= start!8262 b!52713))

(assert (= (and b!52716 condMapEmpty!2441) mapIsEmpty!2441))

(assert (= (and b!52716 (not condMapEmpty!2441)) mapNonEmpty!2442))

(assert (= (and mapNonEmpty!2442 ((_ is ValueCellFull!785) mapValue!2441)) b!52711))

(assert (= (and b!52716 ((_ is ValueCellFull!785) mapDefault!2442)) b!52708))

(assert (= b!52704 b!52716))

(assert (= start!8262 b!52704))

(declare-fun b_lambda!2351 () Bool)

(assert (=> (not b_lambda!2351) (not b!52706)))

(declare-fun t!4376 () Bool)

(declare-fun tb!1025 () Bool)

(assert (=> (and b!52703 (= (defaultEntry!1953 (v!2236 (underlying!160 thiss!992))) (defaultEntry!1953 (v!2236 (underlying!160 thiss!992)))) t!4376) tb!1025))

(declare-fun result!1935 () Bool)

(assert (=> tb!1025 (= result!1935 tp_is_empty!2257)))

(assert (=> b!52706 t!4376))

(declare-fun b_and!2905 () Bool)

(assert (= b_and!2901 (and (=> t!4376 result!1935) b_and!2905)))

(declare-fun tb!1027 () Bool)

(declare-fun t!4378 () Bool)

(assert (=> (and b!52704 (= (defaultEntry!1953 newMap!16) (defaultEntry!1953 (v!2236 (underlying!160 thiss!992)))) t!4378) tb!1027))

(declare-fun result!1939 () Bool)

(assert (= result!1939 result!1935))

(assert (=> b!52706 t!4378))

(declare-fun b_and!2907 () Bool)

(assert (= b_and!2903 (and (=> t!4378 result!1939) b_and!2907)))

(declare-fun m!44881 () Bool)

(assert (=> mapNonEmpty!2441 m!44881))

(declare-fun m!44883 () Bool)

(assert (=> b!52710 m!44883))

(assert (=> b!52710 m!44883))

(declare-fun m!44885 () Bool)

(assert (=> b!52710 m!44885))

(declare-fun m!44887 () Bool)

(assert (=> b!52715 m!44887))

(declare-fun m!44889 () Bool)

(assert (=> b!52704 m!44889))

(declare-fun m!44891 () Bool)

(assert (=> b!52704 m!44891))

(declare-fun m!44893 () Bool)

(assert (=> b!52712 m!44893))

(declare-fun m!44895 () Bool)

(assert (=> b!52718 m!44895))

(assert (=> b!52705 m!44883))

(declare-fun m!44897 () Bool)

(assert (=> b!52705 m!44897))

(declare-fun m!44899 () Bool)

(assert (=> b!52705 m!44899))

(declare-fun m!44901 () Bool)

(assert (=> b!52703 m!44901))

(declare-fun m!44903 () Bool)

(assert (=> b!52703 m!44903))

(declare-fun m!44905 () Bool)

(assert (=> b!52706 m!44905))

(declare-fun m!44907 () Bool)

(assert (=> b!52706 m!44907))

(declare-fun m!44909 () Bool)

(assert (=> b!52706 m!44909))

(assert (=> b!52706 m!44883))

(assert (=> b!52706 m!44907))

(assert (=> b!52706 m!44883))

(assert (=> b!52706 m!44909))

(declare-fun m!44911 () Bool)

(assert (=> b!52706 m!44911))

(assert (=> b!52706 m!44905))

(assert (=> b!52706 m!44883))

(declare-fun m!44913 () Bool)

(assert (=> b!52706 m!44913))

(declare-fun m!44915 () Bool)

(assert (=> mapNonEmpty!2442 m!44915))

(declare-fun m!44917 () Bool)

(assert (=> start!8262 m!44917))

(declare-fun m!44919 () Bool)

(assert (=> b!52709 m!44919))

(check-sat (not mapNonEmpty!2441) b_and!2907 (not start!8262) (not b!52712) tp_is_empty!2257 (not b!52718) (not b!52710) (not b!52709) (not b!52715) (not b!52704) (not b!52705) (not b!52706) (not b_next!1683) (not b!52703) (not mapNonEmpty!2442) b_and!2905 (not b_next!1681) (not b_lambda!2351))
(check-sat b_and!2905 b_and!2907 (not b_next!1681) (not b_next!1683))
