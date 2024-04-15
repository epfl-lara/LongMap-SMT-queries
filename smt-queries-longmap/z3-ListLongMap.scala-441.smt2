; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8262 () Bool)

(assert start!8262)

(declare-fun b!52692 () Bool)

(declare-fun b_free!1681 () Bool)

(declare-fun b_next!1681 () Bool)

(assert (=> b!52692 (= b_free!1681 (not b_next!1681))))

(declare-fun tp!7146 () Bool)

(declare-fun b_and!2905 () Bool)

(assert (=> b!52692 (= tp!7146 b_and!2905)))

(declare-fun b!52698 () Bool)

(declare-fun b_free!1683 () Bool)

(declare-fun b_next!1683 () Bool)

(assert (=> b!52698 (= b_free!1683 (not b_next!1683))))

(declare-fun tp!7145 () Bool)

(declare-fun b_and!2907 () Bool)

(assert (=> b!52698 (= tp!7145 b_and!2907)))

(declare-fun b!52689 () Bool)

(declare-fun e!34340 () Bool)

(declare-fun e!34349 () Bool)

(assert (=> b!52689 (= e!34340 e!34349)))

(declare-fun res!29937 () Bool)

(assert (=> b!52689 (=> (not res!29937) (not e!34349))))

(declare-datatypes ((V!2657 0))(
  ( (V!2658 (val!1173 Int)) )
))
(declare-datatypes ((tuple2!1864 0))(
  ( (tuple2!1865 (_1!943 (_ BitVec 64)) (_2!943 V!2657)) )
))
(declare-datatypes ((List!1342 0))(
  ( (Nil!1339) (Cons!1338 (h!1918 tuple2!1864) (t!4391 List!1342)) )
))
(declare-datatypes ((ListLongMap!1263 0))(
  ( (ListLongMap!1264 (toList!647 List!1342)) )
))
(declare-fun lt!21325 () ListLongMap!1263)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!21324 () ListLongMap!1263)

(declare-datatypes ((array!3417 0))(
  ( (array!3418 (arr!1630 (Array (_ BitVec 32) (_ BitVec 64))) (size!1860 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!785 0))(
  ( (ValueCellFull!785 (v!2232 V!2657)) (EmptyCell!785) )
))
(declare-datatypes ((array!3419 0))(
  ( (array!3420 (arr!1631 (Array (_ BitVec 32) ValueCell!785)) (size!1861 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!478 0))(
  ( (LongMapFixedSize!479 (defaultEntry!1953 Int) (mask!5781 (_ BitVec 32)) (extraKeys!1844 (_ BitVec 32)) (zeroValue!1871 V!2657) (minValue!1871 V!2657) (_size!288 (_ BitVec 32)) (_keys!3572 array!3417) (_values!1936 array!3419) (_vacant!288 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!298 0))(
  ( (Cell!299 (v!2233 LongMapFixedSize!478)) )
))
(declare-datatypes ((LongMap!298 0))(
  ( (LongMap!299 (underlying!160 Cell!298)) )
))
(declare-fun thiss!992 () LongMap!298)

(assert (=> b!52689 (= res!29937 (and (= lt!21324 lt!21325) (not (= (select (arr!1630 (_keys!3572 (v!2233 (underlying!160 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1630 (_keys!3572 (v!2233 (underlying!160 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!478)

(declare-fun map!1020 (LongMapFixedSize!478) ListLongMap!1263)

(assert (=> b!52689 (= lt!21325 (map!1020 newMap!16))))

(declare-fun getCurrentListMap!352 (array!3417 array!3419 (_ BitVec 32) (_ BitVec 32) V!2657 V!2657 (_ BitVec 32) Int) ListLongMap!1263)

(assert (=> b!52689 (= lt!21324 (getCurrentListMap!352 (_keys!3572 (v!2233 (underlying!160 thiss!992))) (_values!1936 (v!2233 (underlying!160 thiss!992))) (mask!5781 (v!2233 (underlying!160 thiss!992))) (extraKeys!1844 (v!2233 (underlying!160 thiss!992))) (zeroValue!1871 (v!2233 (underlying!160 thiss!992))) (minValue!1871 (v!2233 (underlying!160 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1953 (v!2233 (underlying!160 thiss!992)))))))

(declare-fun b!52691 () Bool)

(declare-fun res!29939 () Bool)

(declare-fun e!34342 () Bool)

(assert (=> b!52691 (=> (not res!29939) (not e!34342))))

(assert (=> b!52691 (= res!29939 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1860 (_keys!3572 (v!2233 (underlying!160 thiss!992)))))))))

(declare-fun mapNonEmpty!2441 () Bool)

(declare-fun mapRes!2442 () Bool)

(declare-fun tp!7143 () Bool)

(declare-fun e!34350 () Bool)

(assert (=> mapNonEmpty!2441 (= mapRes!2442 (and tp!7143 e!34350))))

(declare-fun mapValue!2442 () ValueCell!785)

(declare-fun mapRest!2441 () (Array (_ BitVec 32) ValueCell!785))

(declare-fun mapKey!2441 () (_ BitVec 32))

(assert (=> mapNonEmpty!2441 (= (arr!1631 (_values!1936 (v!2233 (underlying!160 thiss!992)))) (store mapRest!2441 mapKey!2441 mapValue!2442))))

(declare-fun e!34345 () Bool)

(declare-fun e!34343 () Bool)

(declare-fun tp_is_empty!2257 () Bool)

(declare-fun array_inv!997 (array!3417) Bool)

(declare-fun array_inv!998 (array!3419) Bool)

(assert (=> b!52692 (= e!34343 (and tp!7146 tp_is_empty!2257 (array_inv!997 (_keys!3572 (v!2233 (underlying!160 thiss!992)))) (array_inv!998 (_values!1936 (v!2233 (underlying!160 thiss!992)))) e!34345))))

(declare-fun b!52693 () Bool)

(declare-fun res!29934 () Bool)

(assert (=> b!52693 (=> (not res!29934) (not e!34340))))

(assert (=> b!52693 (= res!29934 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1860 (_keys!3572 (v!2233 (underlying!160 thiss!992)))))))))

(declare-fun b!52694 () Bool)

(declare-fun e!34354 () Bool)

(declare-fun e!34347 () Bool)

(assert (=> b!52694 (= e!34354 e!34347)))

(declare-fun mapIsEmpty!2441 () Bool)

(declare-fun mapRes!2441 () Bool)

(assert (=> mapIsEmpty!2441 mapRes!2441))

(declare-fun b!52695 () Bool)

(declare-fun res!29935 () Bool)

(assert (=> b!52695 (=> (not res!29935) (not e!34340))))

(assert (=> b!52695 (= res!29935 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5781 newMap!16)) (_size!288 (v!2233 (underlying!160 thiss!992)))))))

(declare-fun b!52696 () Bool)

(declare-fun res!29930 () Bool)

(assert (=> b!52696 (=> (not res!29930) (not e!34342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52696 (= res!29930 (validMask!0 (mask!5781 (v!2233 (underlying!160 thiss!992)))))))

(declare-fun b!52697 () Bool)

(declare-fun res!29940 () Bool)

(assert (=> b!52697 (=> (not res!29940) (not e!34342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3417 (_ BitVec 32)) Bool)

(assert (=> b!52697 (= res!29940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3572 (v!2233 (underlying!160 thiss!992))) (mask!5781 (v!2233 (underlying!160 thiss!992)))))))

(declare-fun e!34346 () Bool)

(declare-fun e!34344 () Bool)

(assert (=> b!52698 (= e!34346 (and tp!7145 tp_is_empty!2257 (array_inv!997 (_keys!3572 newMap!16)) (array_inv!998 (_values!1936 newMap!16)) e!34344))))

(declare-fun b!52699 () Bool)

(declare-fun e!34341 () Bool)

(assert (=> b!52699 (= e!34344 (and e!34341 mapRes!2441))))

(declare-fun condMapEmpty!2441 () Bool)

(declare-fun mapDefault!2442 () ValueCell!785)

(assert (=> b!52699 (= condMapEmpty!2441 (= (arr!1631 (_values!1936 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!785)) mapDefault!2442)))))

(declare-fun res!29938 () Bool)

(assert (=> start!8262 (=> (not res!29938) (not e!34340))))

(declare-fun valid!183 (LongMap!298) Bool)

(assert (=> start!8262 (= res!29938 (valid!183 thiss!992))))

(assert (=> start!8262 e!34340))

(assert (=> start!8262 e!34354))

(assert (=> start!8262 true))

(assert (=> start!8262 e!34346))

(declare-fun b!52690 () Bool)

(assert (=> b!52690 (= e!34347 e!34343)))

(declare-fun b!52700 () Bool)

(assert (=> b!52700 (= e!34349 e!34342)))

(declare-fun res!29933 () Bool)

(assert (=> b!52700 (=> (not res!29933) (not e!34342))))

(declare-fun contains!624 (ListLongMap!1263 (_ BitVec 64)) Bool)

(assert (=> b!52700 (= res!29933 (contains!624 lt!21325 (select (arr!1630 (_keys!3572 (v!2233 (underlying!160 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1866 0))(
  ( (tuple2!1867 (_1!944 Bool) (_2!944 LongMapFixedSize!478)) )
))
(declare-fun lt!21326 () tuple2!1866)

(declare-fun update!45 (LongMapFixedSize!478 (_ BitVec 64) V!2657) tuple2!1866)

(declare-fun get!983 (ValueCell!785 V!2657) V!2657)

(declare-fun dynLambda!269 (Int (_ BitVec 64)) V!2657)

(assert (=> b!52700 (= lt!21326 (update!45 newMap!16 (select (arr!1630 (_keys!3572 (v!2233 (underlying!160 thiss!992)))) from!355) (get!983 (select (arr!1631 (_values!1936 (v!2233 (underlying!160 thiss!992)))) from!355) (dynLambda!269 (defaultEntry!1953 (v!2233 (underlying!160 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!52701 () Bool)

(declare-fun res!29936 () Bool)

(assert (=> b!52701 (=> (not res!29936) (not e!34342))))

(assert (=> b!52701 (= res!29936 (and (= (size!1861 (_values!1936 (v!2233 (underlying!160 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5781 (v!2233 (underlying!160 thiss!992))))) (= (size!1860 (_keys!3572 (v!2233 (underlying!160 thiss!992)))) (size!1861 (_values!1936 (v!2233 (underlying!160 thiss!992))))) (bvsge (mask!5781 (v!2233 (underlying!160 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1844 (v!2233 (underlying!160 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1844 (v!2233 (underlying!160 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!52702 () Bool)

(assert (=> b!52702 (= e!34341 tp_is_empty!2257)))

(declare-fun mapNonEmpty!2442 () Bool)

(declare-fun tp!7144 () Bool)

(declare-fun e!34352 () Bool)

(assert (=> mapNonEmpty!2442 (= mapRes!2441 (and tp!7144 e!34352))))

(declare-fun mapValue!2441 () ValueCell!785)

(declare-fun mapRest!2442 () (Array (_ BitVec 32) ValueCell!785))

(declare-fun mapKey!2442 () (_ BitVec 32))

(assert (=> mapNonEmpty!2442 (= (arr!1631 (_values!1936 newMap!16)) (store mapRest!2442 mapKey!2442 mapValue!2441))))

(declare-fun b!52703 () Bool)

(declare-fun e!34348 () Bool)

(assert (=> b!52703 (= e!34345 (and e!34348 mapRes!2442))))

(declare-fun condMapEmpty!2442 () Bool)

(declare-fun mapDefault!2441 () ValueCell!785)

(assert (=> b!52703 (= condMapEmpty!2442 (= (arr!1631 (_values!1936 (v!2233 (underlying!160 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!785)) mapDefault!2441)))))

(declare-fun b!52704 () Bool)

(assert (=> b!52704 (= e!34342 false)))

(declare-fun lt!21323 () Bool)

(assert (=> b!52704 (= lt!21323 (contains!624 lt!21324 (select (arr!1630 (_keys!3572 (v!2233 (underlying!160 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!2442 () Bool)

(assert (=> mapIsEmpty!2442 mapRes!2442))

(declare-fun b!52705 () Bool)

(assert (=> b!52705 (= e!34348 tp_is_empty!2257)))

(declare-fun b!52706 () Bool)

(declare-fun res!29932 () Bool)

(assert (=> b!52706 (=> (not res!29932) (not e!34340))))

(declare-fun valid!184 (LongMapFixedSize!478) Bool)

(assert (=> b!52706 (= res!29932 (valid!184 newMap!16))))

(declare-fun b!52707 () Bool)

(declare-fun res!29931 () Bool)

(assert (=> b!52707 (=> (not res!29931) (not e!34342))))

(declare-datatypes ((List!1343 0))(
  ( (Nil!1340) (Cons!1339 (h!1919 (_ BitVec 64)) (t!4392 List!1343)) )
))
(declare-fun arrayNoDuplicates!0 (array!3417 (_ BitVec 32) List!1343) Bool)

(assert (=> b!52707 (= res!29931 (arrayNoDuplicates!0 (_keys!3572 (v!2233 (underlying!160 thiss!992))) #b00000000000000000000000000000000 Nil!1340))))

(declare-fun b!52708 () Bool)

(assert (=> b!52708 (= e!34350 tp_is_empty!2257)))

(declare-fun b!52709 () Bool)

(assert (=> b!52709 (= e!34352 tp_is_empty!2257)))

(assert (= (and start!8262 res!29938) b!52693))

(assert (= (and b!52693 res!29934) b!52706))

(assert (= (and b!52706 res!29932) b!52695))

(assert (= (and b!52695 res!29935) b!52689))

(assert (= (and b!52689 res!29937) b!52700))

(assert (= (and b!52700 res!29933) b!52696))

(assert (= (and b!52696 res!29930) b!52701))

(assert (= (and b!52701 res!29936) b!52697))

(assert (= (and b!52697 res!29940) b!52707))

(assert (= (and b!52707 res!29931) b!52691))

(assert (= (and b!52691 res!29939) b!52704))

(assert (= (and b!52703 condMapEmpty!2442) mapIsEmpty!2442))

(assert (= (and b!52703 (not condMapEmpty!2442)) mapNonEmpty!2441))

(get-info :version)

(assert (= (and mapNonEmpty!2441 ((_ is ValueCellFull!785) mapValue!2442)) b!52708))

(assert (= (and b!52703 ((_ is ValueCellFull!785) mapDefault!2441)) b!52705))

(assert (= b!52692 b!52703))

(assert (= b!52690 b!52692))

(assert (= b!52694 b!52690))

(assert (= start!8262 b!52694))

(assert (= (and b!52699 condMapEmpty!2441) mapIsEmpty!2441))

(assert (= (and b!52699 (not condMapEmpty!2441)) mapNonEmpty!2442))

(assert (= (and mapNonEmpty!2442 ((_ is ValueCellFull!785) mapValue!2441)) b!52709))

(assert (= (and b!52699 ((_ is ValueCellFull!785) mapDefault!2442)) b!52702))

(assert (= b!52698 b!52699))

(assert (= start!8262 b!52698))

(declare-fun b_lambda!2355 () Bool)

(assert (=> (not b_lambda!2355) (not b!52700)))

(declare-fun t!4388 () Bool)

(declare-fun tb!1025 () Bool)

(assert (=> (and b!52692 (= (defaultEntry!1953 (v!2233 (underlying!160 thiss!992))) (defaultEntry!1953 (v!2233 (underlying!160 thiss!992)))) t!4388) tb!1025))

(declare-fun result!1935 () Bool)

(assert (=> tb!1025 (= result!1935 tp_is_empty!2257)))

(assert (=> b!52700 t!4388))

(declare-fun b_and!2909 () Bool)

(assert (= b_and!2905 (and (=> t!4388 result!1935) b_and!2909)))

(declare-fun t!4390 () Bool)

(declare-fun tb!1027 () Bool)

(assert (=> (and b!52698 (= (defaultEntry!1953 newMap!16) (defaultEntry!1953 (v!2233 (underlying!160 thiss!992)))) t!4390) tb!1027))

(declare-fun result!1939 () Bool)

(assert (= result!1939 result!1935))

(assert (=> b!52700 t!4390))

(declare-fun b_and!2911 () Bool)

(assert (= b_and!2907 (and (=> t!4390 result!1939) b_and!2911)))

(declare-fun m!44923 () Bool)

(assert (=> b!52689 m!44923))

(declare-fun m!44925 () Bool)

(assert (=> b!52689 m!44925))

(declare-fun m!44927 () Bool)

(assert (=> b!52689 m!44927))

(declare-fun m!44929 () Bool)

(assert (=> b!52700 m!44929))

(declare-fun m!44931 () Bool)

(assert (=> b!52700 m!44931))

(declare-fun m!44933 () Bool)

(assert (=> b!52700 m!44933))

(assert (=> b!52700 m!44923))

(assert (=> b!52700 m!44931))

(assert (=> b!52700 m!44923))

(declare-fun m!44935 () Bool)

(assert (=> b!52700 m!44935))

(assert (=> b!52700 m!44923))

(assert (=> b!52700 m!44933))

(declare-fun m!44937 () Bool)

(assert (=> b!52700 m!44937))

(assert (=> b!52700 m!44929))

(assert (=> b!52704 m!44923))

(assert (=> b!52704 m!44923))

(declare-fun m!44939 () Bool)

(assert (=> b!52704 m!44939))

(declare-fun m!44941 () Bool)

(assert (=> mapNonEmpty!2442 m!44941))

(declare-fun m!44943 () Bool)

(assert (=> b!52692 m!44943))

(declare-fun m!44945 () Bool)

(assert (=> b!52692 m!44945))

(declare-fun m!44947 () Bool)

(assert (=> start!8262 m!44947))

(declare-fun m!44949 () Bool)

(assert (=> mapNonEmpty!2441 m!44949))

(declare-fun m!44951 () Bool)

(assert (=> b!52706 m!44951))

(declare-fun m!44953 () Bool)

(assert (=> b!52707 m!44953))

(declare-fun m!44955 () Bool)

(assert (=> b!52696 m!44955))

(declare-fun m!44957 () Bool)

(assert (=> b!52697 m!44957))

(declare-fun m!44959 () Bool)

(assert (=> b!52698 m!44959))

(declare-fun m!44961 () Bool)

(assert (=> b!52698 m!44961))

(check-sat (not b_next!1681) (not b!52697) b_and!2909 (not mapNonEmpty!2441) (not b_lambda!2355) (not b!52696) (not b!52689) (not b!52692) (not b!52707) (not mapNonEmpty!2442) (not start!8262) tp_is_empty!2257 (not b!52700) (not b!52704) (not b!52706) (not b!52698) (not b_next!1683) b_and!2911)
(check-sat b_and!2909 b_and!2911 (not b_next!1681) (not b_next!1683))
