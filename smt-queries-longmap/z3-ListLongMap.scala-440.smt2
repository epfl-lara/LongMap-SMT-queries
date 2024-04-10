; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8254 () Bool)

(assert start!8254)

(declare-fun b!52645 () Bool)

(declare-fun b_free!1673 () Bool)

(declare-fun b_next!1673 () Bool)

(assert (=> b!52645 (= b_free!1673 (not b_next!1673))))

(declare-fun tp!7120 () Bool)

(declare-fun b_and!2887 () Bool)

(assert (=> b!52645 (= tp!7120 b_and!2887)))

(declare-fun b!52636 () Bool)

(declare-fun b_free!1675 () Bool)

(declare-fun b_next!1675 () Bool)

(assert (=> b!52636 (= b_free!1675 (not b_next!1675))))

(declare-fun tp!7119 () Bool)

(declare-fun b_and!2889 () Bool)

(assert (=> b!52636 (= tp!7119 b_and!2889)))

(declare-fun b!52625 () Bool)

(declare-fun e!34307 () Bool)

(declare-fun tp_is_empty!2253 () Bool)

(assert (=> b!52625 (= e!34307 tp_is_empty!2253)))

(declare-fun b!52626 () Bool)

(declare-fun e!34295 () Bool)

(declare-fun e!34300 () Bool)

(assert (=> b!52626 (= e!34295 e!34300)))

(declare-fun res!29890 () Bool)

(assert (=> b!52626 (=> (not res!29890) (not e!34300))))

(declare-datatypes ((V!2651 0))(
  ( (V!2652 (val!1171 Int)) )
))
(declare-datatypes ((array!3429 0))(
  ( (array!3430 (arr!1637 (Array (_ BitVec 32) (_ BitVec 64))) (size!1866 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!783 0))(
  ( (ValueCellFull!783 (v!2231 V!2651)) (EmptyCell!783) )
))
(declare-datatypes ((array!3431 0))(
  ( (array!3432 (arr!1638 (Array (_ BitVec 32) ValueCell!783)) (size!1867 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!474 0))(
  ( (LongMapFixedSize!475 (defaultEntry!1951 Int) (mask!5778 (_ BitVec 32)) (extraKeys!1842 (_ BitVec 32)) (zeroValue!1869 V!2651) (minValue!1869 V!2651) (_size!286 (_ BitVec 32)) (_keys!3571 array!3429) (_values!1934 array!3431) (_vacant!286 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!296 0))(
  ( (Cell!297 (v!2232 LongMapFixedSize!474)) )
))
(declare-datatypes ((LongMap!296 0))(
  ( (LongMap!297 (underlying!159 Cell!296)) )
))
(declare-fun thiss!992 () LongMap!296)

(declare-datatypes ((tuple2!1852 0))(
  ( (tuple2!1853 (_1!937 (_ BitVec 64)) (_2!937 V!2651)) )
))
(declare-datatypes ((List!1342 0))(
  ( (Nil!1339) (Cons!1338 (h!1918 tuple2!1852) (t!4384 List!1342)) )
))
(declare-datatypes ((ListLongMap!1267 0))(
  ( (ListLongMap!1268 (toList!649 List!1342)) )
))
(declare-fun lt!21318 () ListLongMap!1267)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!625 (ListLongMap!1267 (_ BitVec 64)) Bool)

(assert (=> b!52626 (= res!29890 (contains!625 lt!21318 (select (arr!1637 (_keys!3571 (v!2232 (underlying!159 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1854 0))(
  ( (tuple2!1855 (_1!938 Bool) (_2!938 LongMapFixedSize!474)) )
))
(declare-fun lt!21317 () tuple2!1854)

(declare-fun newMap!16 () LongMapFixedSize!474)

(declare-fun update!37 (LongMapFixedSize!474 (_ BitVec 64) V!2651) tuple2!1854)

(declare-fun get!977 (ValueCell!783 V!2651) V!2651)

(declare-fun dynLambda!268 (Int (_ BitVec 64)) V!2651)

(assert (=> b!52626 (= lt!21317 (update!37 newMap!16 (select (arr!1637 (_keys!3571 (v!2232 (underlying!159 thiss!992)))) from!355) (get!977 (select (arr!1638 (_values!1934 (v!2232 (underlying!159 thiss!992)))) from!355) (dynLambda!268 (defaultEntry!1951 (v!2232 (underlying!159 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!52627 () Bool)

(assert (=> b!52627 (= e!34300 false)))

(declare-fun lt!21315 () ListLongMap!1267)

(declare-fun lt!21316 () Bool)

(assert (=> b!52627 (= lt!21316 (contains!625 lt!21315 (select (arr!1637 (_keys!3571 (v!2232 (underlying!159 thiss!992)))) from!355)))))

(declare-fun b!52628 () Bool)

(declare-fun e!34306 () Bool)

(declare-fun e!34294 () Bool)

(declare-fun mapRes!2430 () Bool)

(assert (=> b!52628 (= e!34306 (and e!34294 mapRes!2430))))

(declare-fun condMapEmpty!2430 () Bool)

(declare-fun mapDefault!2430 () ValueCell!783)

(assert (=> b!52628 (= condMapEmpty!2430 (= (arr!1638 (_values!1934 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!783)) mapDefault!2430)))))

(declare-fun b!52629 () Bool)

(declare-fun res!29892 () Bool)

(assert (=> b!52629 (=> (not res!29892) (not e!34300))))

(declare-datatypes ((List!1343 0))(
  ( (Nil!1340) (Cons!1339 (h!1919 (_ BitVec 64)) (t!4385 List!1343)) )
))
(declare-fun arrayNoDuplicates!0 (array!3429 (_ BitVec 32) List!1343) Bool)

(assert (=> b!52629 (= res!29892 (arrayNoDuplicates!0 (_keys!3571 (v!2232 (underlying!159 thiss!992))) #b00000000000000000000000000000000 Nil!1340))))

(declare-fun mapNonEmpty!2429 () Bool)

(declare-fun tp!7122 () Bool)

(declare-fun e!34304 () Bool)

(assert (=> mapNonEmpty!2429 (= mapRes!2430 (and tp!7122 e!34304))))

(declare-fun mapValue!2429 () ValueCell!783)

(declare-fun mapRest!2429 () (Array (_ BitVec 32) ValueCell!783))

(declare-fun mapKey!2429 () (_ BitVec 32))

(assert (=> mapNonEmpty!2429 (= (arr!1638 (_values!1934 newMap!16)) (store mapRest!2429 mapKey!2429 mapValue!2429))))

(declare-fun b!52630 () Bool)

(declare-fun res!29885 () Bool)

(declare-fun e!34297 () Bool)

(assert (=> b!52630 (=> (not res!29885) (not e!34297))))

(assert (=> b!52630 (= res!29885 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5778 newMap!16)) (_size!286 (v!2232 (underlying!159 thiss!992)))))))

(declare-fun b!52631 () Bool)

(declare-fun res!29887 () Bool)

(assert (=> b!52631 (=> (not res!29887) (not e!34300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3429 (_ BitVec 32)) Bool)

(assert (=> b!52631 (= res!29887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3571 (v!2232 (underlying!159 thiss!992))) (mask!5778 (v!2232 (underlying!159 thiss!992)))))))

(declare-fun b!52632 () Bool)

(declare-fun e!34293 () Bool)

(declare-fun e!34305 () Bool)

(assert (=> b!52632 (= e!34293 e!34305)))

(declare-fun mapIsEmpty!2429 () Bool)

(declare-fun mapRes!2429 () Bool)

(assert (=> mapIsEmpty!2429 mapRes!2429))

(declare-fun b!52633 () Bool)

(assert (=> b!52633 (= e!34304 tp_is_empty!2253)))

(declare-fun b!52634 () Bool)

(declare-fun res!29886 () Bool)

(assert (=> b!52634 (=> (not res!29886) (not e!34297))))

(declare-fun valid!173 (LongMapFixedSize!474) Bool)

(assert (=> b!52634 (= res!29886 (valid!173 newMap!16))))

(declare-fun b!52635 () Bool)

(declare-fun res!29894 () Bool)

(assert (=> b!52635 (=> (not res!29894) (not e!34300))))

(assert (=> b!52635 (= res!29894 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1866 (_keys!3571 (v!2232 (underlying!159 thiss!992)))))))))

(declare-fun e!34303 () Bool)

(declare-fun array_inv!1011 (array!3429) Bool)

(declare-fun array_inv!1012 (array!3431) Bool)

(assert (=> b!52636 (= e!34303 (and tp!7119 tp_is_empty!2253 (array_inv!1011 (_keys!3571 newMap!16)) (array_inv!1012 (_values!1934 newMap!16)) e!34306))))

(declare-fun b!52637 () Bool)

(declare-fun res!29893 () Bool)

(assert (=> b!52637 (=> (not res!29893) (not e!34300))))

(assert (=> b!52637 (= res!29893 (and (= (size!1867 (_values!1934 (v!2232 (underlying!159 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5778 (v!2232 (underlying!159 thiss!992))))) (= (size!1866 (_keys!3571 (v!2232 (underlying!159 thiss!992)))) (size!1867 (_values!1934 (v!2232 (underlying!159 thiss!992))))) (bvsge (mask!5778 (v!2232 (underlying!159 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1842 (v!2232 (underlying!159 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1842 (v!2232 (underlying!159 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2430 () Bool)

(assert (=> mapIsEmpty!2430 mapRes!2430))

(declare-fun mapNonEmpty!2430 () Bool)

(declare-fun tp!7121 () Bool)

(assert (=> mapNonEmpty!2430 (= mapRes!2429 (and tp!7121 e!34307))))

(declare-fun mapKey!2430 () (_ BitVec 32))

(declare-fun mapValue!2430 () ValueCell!783)

(declare-fun mapRest!2430 () (Array (_ BitVec 32) ValueCell!783))

(assert (=> mapNonEmpty!2430 (= (arr!1638 (_values!1934 (v!2232 (underlying!159 thiss!992)))) (store mapRest!2430 mapKey!2430 mapValue!2430))))

(declare-fun b!52638 () Bool)

(assert (=> b!52638 (= e!34297 e!34295)))

(declare-fun res!29889 () Bool)

(assert (=> b!52638 (=> (not res!29889) (not e!34295))))

(assert (=> b!52638 (= res!29889 (and (= lt!21315 lt!21318) (not (= (select (arr!1637 (_keys!3571 (v!2232 (underlying!159 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1637 (_keys!3571 (v!2232 (underlying!159 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1017 (LongMapFixedSize!474) ListLongMap!1267)

(assert (=> b!52638 (= lt!21318 (map!1017 newMap!16))))

(declare-fun getCurrentListMap!362 (array!3429 array!3431 (_ BitVec 32) (_ BitVec 32) V!2651 V!2651 (_ BitVec 32) Int) ListLongMap!1267)

(assert (=> b!52638 (= lt!21315 (getCurrentListMap!362 (_keys!3571 (v!2232 (underlying!159 thiss!992))) (_values!1934 (v!2232 (underlying!159 thiss!992))) (mask!5778 (v!2232 (underlying!159 thiss!992))) (extraKeys!1842 (v!2232 (underlying!159 thiss!992))) (zeroValue!1869 (v!2232 (underlying!159 thiss!992))) (minValue!1869 (v!2232 (underlying!159 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1951 (v!2232 (underlying!159 thiss!992)))))))

(declare-fun b!52639 () Bool)

(declare-fun res!29888 () Bool)

(assert (=> b!52639 (=> (not res!29888) (not e!34300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!52639 (= res!29888 (validMask!0 (mask!5778 (v!2232 (underlying!159 thiss!992)))))))

(declare-fun b!52640 () Bool)

(assert (=> b!52640 (= e!34294 tp_is_empty!2253)))

(declare-fun b!52641 () Bool)

(declare-fun e!34296 () Bool)

(assert (=> b!52641 (= e!34296 tp_is_empty!2253)))

(declare-fun res!29891 () Bool)

(assert (=> start!8254 (=> (not res!29891) (not e!34297))))

(declare-fun valid!174 (LongMap!296) Bool)

(assert (=> start!8254 (= res!29891 (valid!174 thiss!992))))

(assert (=> start!8254 e!34297))

(assert (=> start!8254 e!34293))

(assert (=> start!8254 true))

(assert (=> start!8254 e!34303))

(declare-fun b!52642 () Bool)

(declare-fun res!29884 () Bool)

(assert (=> b!52642 (=> (not res!29884) (not e!34297))))

(assert (=> b!52642 (= res!29884 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1866 (_keys!3571 (v!2232 (underlying!159 thiss!992)))))))))

(declare-fun b!52643 () Bool)

(declare-fun e!34302 () Bool)

(assert (=> b!52643 (= e!34305 e!34302)))

(declare-fun b!52644 () Bool)

(declare-fun e!34298 () Bool)

(assert (=> b!52644 (= e!34298 (and e!34296 mapRes!2429))))

(declare-fun condMapEmpty!2429 () Bool)

(declare-fun mapDefault!2429 () ValueCell!783)

(assert (=> b!52644 (= condMapEmpty!2429 (= (arr!1638 (_values!1934 (v!2232 (underlying!159 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!783)) mapDefault!2429)))))

(assert (=> b!52645 (= e!34302 (and tp!7120 tp_is_empty!2253 (array_inv!1011 (_keys!3571 (v!2232 (underlying!159 thiss!992)))) (array_inv!1012 (_values!1934 (v!2232 (underlying!159 thiss!992)))) e!34298))))

(assert (= (and start!8254 res!29891) b!52642))

(assert (= (and b!52642 res!29884) b!52634))

(assert (= (and b!52634 res!29886) b!52630))

(assert (= (and b!52630 res!29885) b!52638))

(assert (= (and b!52638 res!29889) b!52626))

(assert (= (and b!52626 res!29890) b!52639))

(assert (= (and b!52639 res!29888) b!52637))

(assert (= (and b!52637 res!29893) b!52631))

(assert (= (and b!52631 res!29887) b!52629))

(assert (= (and b!52629 res!29892) b!52635))

(assert (= (and b!52635 res!29894) b!52627))

(assert (= (and b!52644 condMapEmpty!2429) mapIsEmpty!2429))

(assert (= (and b!52644 (not condMapEmpty!2429)) mapNonEmpty!2430))

(get-info :version)

(assert (= (and mapNonEmpty!2430 ((_ is ValueCellFull!783) mapValue!2430)) b!52625))

(assert (= (and b!52644 ((_ is ValueCellFull!783) mapDefault!2429)) b!52641))

(assert (= b!52645 b!52644))

(assert (= b!52643 b!52645))

(assert (= b!52632 b!52643))

(assert (= start!8254 b!52632))

(assert (= (and b!52628 condMapEmpty!2430) mapIsEmpty!2430))

(assert (= (and b!52628 (not condMapEmpty!2430)) mapNonEmpty!2429))

(assert (= (and mapNonEmpty!2429 ((_ is ValueCellFull!783) mapValue!2429)) b!52633))

(assert (= (and b!52628 ((_ is ValueCellFull!783) mapDefault!2430)) b!52640))

(assert (= b!52636 b!52628))

(assert (= start!8254 b!52636))

(declare-fun b_lambda!2347 () Bool)

(assert (=> (not b_lambda!2347) (not b!52626)))

(declare-fun t!4381 () Bool)

(declare-fun tb!1017 () Bool)

(assert (=> (and b!52645 (= (defaultEntry!1951 (v!2232 (underlying!159 thiss!992))) (defaultEntry!1951 (v!2232 (underlying!159 thiss!992)))) t!4381) tb!1017))

(declare-fun result!1923 () Bool)

(assert (=> tb!1017 (= result!1923 tp_is_empty!2253)))

(assert (=> b!52626 t!4381))

(declare-fun b_and!2891 () Bool)

(assert (= b_and!2887 (and (=> t!4381 result!1923) b_and!2891)))

(declare-fun tb!1019 () Bool)

(declare-fun t!4383 () Bool)

(assert (=> (and b!52636 (= (defaultEntry!1951 newMap!16) (defaultEntry!1951 (v!2232 (underlying!159 thiss!992)))) t!4383) tb!1019))

(declare-fun result!1927 () Bool)

(assert (= result!1927 result!1923))

(assert (=> b!52626 t!4383))

(declare-fun b_and!2893 () Bool)

(assert (= b_and!2889 (and (=> t!4383 result!1927) b_and!2893)))

(declare-fun m!44925 () Bool)

(assert (=> b!52634 m!44925))

(declare-fun m!44927 () Bool)

(assert (=> mapNonEmpty!2430 m!44927))

(declare-fun m!44929 () Bool)

(assert (=> b!52627 m!44929))

(assert (=> b!52627 m!44929))

(declare-fun m!44931 () Bool)

(assert (=> b!52627 m!44931))

(declare-fun m!44933 () Bool)

(assert (=> b!52631 m!44933))

(declare-fun m!44935 () Bool)

(assert (=> b!52639 m!44935))

(declare-fun m!44937 () Bool)

(assert (=> b!52626 m!44937))

(declare-fun m!44939 () Bool)

(assert (=> b!52626 m!44939))

(declare-fun m!44941 () Bool)

(assert (=> b!52626 m!44941))

(assert (=> b!52626 m!44929))

(assert (=> b!52626 m!44939))

(assert (=> b!52626 m!44929))

(declare-fun m!44943 () Bool)

(assert (=> b!52626 m!44943))

(assert (=> b!52626 m!44929))

(assert (=> b!52626 m!44941))

(declare-fun m!44945 () Bool)

(assert (=> b!52626 m!44945))

(assert (=> b!52626 m!44937))

(declare-fun m!44947 () Bool)

(assert (=> b!52645 m!44947))

(declare-fun m!44949 () Bool)

(assert (=> b!52645 m!44949))

(declare-fun m!44951 () Bool)

(assert (=> b!52629 m!44951))

(assert (=> b!52638 m!44929))

(declare-fun m!44953 () Bool)

(assert (=> b!52638 m!44953))

(declare-fun m!44955 () Bool)

(assert (=> b!52638 m!44955))

(declare-fun m!44957 () Bool)

(assert (=> b!52636 m!44957))

(declare-fun m!44959 () Bool)

(assert (=> b!52636 m!44959))

(declare-fun m!44961 () Bool)

(assert (=> start!8254 m!44961))

(declare-fun m!44963 () Bool)

(assert (=> mapNonEmpty!2429 m!44963))

(check-sat b_and!2891 tp_is_empty!2253 (not b!52627) (not b!52645) (not b!52639) (not b!52626) (not b!52638) (not b!52629) (not mapNonEmpty!2429) (not b_next!1673) (not start!8254) (not b_lambda!2347) b_and!2893 (not mapNonEmpty!2430) (not b!52636) (not b!52631) (not b_next!1675) (not b!52634))
(check-sat b_and!2891 b_and!2893 (not b_next!1673) (not b_next!1675))
