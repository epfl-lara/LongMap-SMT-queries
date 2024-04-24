; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9918 () Bool)

(assert start!9918)

(declare-fun b!74909 () Bool)

(declare-fun b_free!2125 () Bool)

(declare-fun b_next!2125 () Bool)

(assert (=> b!74909 (= b_free!2125 (not b_next!2125))))

(declare-fun tp!8559 () Bool)

(declare-fun b_and!4585 () Bool)

(assert (=> b!74909 (= tp!8559 b_and!4585)))

(declare-fun b!74910 () Bool)

(declare-fun b_free!2127 () Bool)

(declare-fun b_next!2127 () Bool)

(assert (=> b!74910 (= b_free!2127 (not b_next!2127))))

(declare-fun tp!8562 () Bool)

(declare-fun b_and!4587 () Bool)

(assert (=> b!74910 (= tp!8562 b_and!4587)))

(declare-datatypes ((V!2953 0))(
  ( (V!2954 (val!1284 Int)) )
))
(declare-datatypes ((array!3891 0))(
  ( (array!3892 (arr!1856 (Array (_ BitVec 32) (_ BitVec 64))) (size!2095 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!896 0))(
  ( (ValueCellFull!896 (v!2547 V!2953)) (EmptyCell!896) )
))
(declare-datatypes ((array!3893 0))(
  ( (array!3894 (arr!1857 (Array (_ BitVec 32) ValueCell!896)) (size!2096 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!700 0))(
  ( (LongMapFixedSize!701 (defaultEntry!2233 Int) (mask!6210 (_ BitVec 32)) (extraKeys!2088 (_ BitVec 32)) (zeroValue!2133 V!2953) (minValue!2133 V!2953) (_size!399 (_ BitVec 32)) (_keys!3889 array!3891) (_values!2216 array!3893) (_vacant!399 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!508 0))(
  ( (Cell!509 (v!2548 LongMapFixedSize!700)) )
))
(declare-datatypes ((LongMap!508 0))(
  ( (LongMap!509 (underlying!265 Cell!508)) )
))
(declare-fun thiss!992 () LongMap!508)

(declare-fun e!48957 () Bool)

(declare-fun tp_is_empty!2479 () Bool)

(declare-fun e!48940 () Bool)

(declare-fun array_inv!1141 (array!3891) Bool)

(declare-fun array_inv!1142 (array!3893) Bool)

(assert (=> b!74909 (= e!48940 (and tp!8559 tp_is_empty!2479 (array_inv!1141 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (array_inv!1142 (_values!2216 (v!2548 (underlying!265 thiss!992)))) e!48957))))

(declare-fun b!74911 () Bool)

(declare-fun e!48942 () Bool)

(assert (=> b!74911 (= e!48942 tp_is_empty!2479)))

(declare-fun b!74912 () Bool)

(declare-fun e!48956 () Bool)

(declare-fun e!48943 () Bool)

(assert (=> b!74912 (= e!48956 e!48943)))

(declare-fun b!74913 () Bool)

(declare-fun e!48944 () Bool)

(assert (=> b!74913 (= e!48944 tp_is_empty!2479)))

(declare-fun b!74914 () Bool)

(declare-fun res!39570 () Bool)

(declare-fun e!48946 () Bool)

(assert (=> b!74914 (=> (not res!39570) (not e!48946))))

(declare-fun newMap!16 () LongMapFixedSize!700)

(declare-fun valid!309 (LongMapFixedSize!700) Bool)

(assert (=> b!74914 (= res!39570 (valid!309 newMap!16))))

(declare-fun b!74915 () Bool)

(declare-fun res!39569 () Bool)

(assert (=> b!74915 (=> (not res!39569) (not e!48946))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!74915 (= res!39569 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun mapNonEmpty!3191 () Bool)

(declare-fun mapRes!3192 () Bool)

(declare-fun tp!8561 () Bool)

(assert (=> mapNonEmpty!3191 (= mapRes!3192 (and tp!8561 e!48942))))

(declare-fun mapRest!3191 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapKey!3192 () (_ BitVec 32))

(declare-fun mapValue!3191 () ValueCell!896)

(assert (=> mapNonEmpty!3191 (= (arr!1857 (_values!2216 newMap!16)) (store mapRest!3191 mapKey!3192 mapValue!3191))))

(declare-fun b!74916 () Bool)

(declare-fun e!48949 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3891 (_ BitVec 32)) Bool)

(assert (=> b!74916 (= e!48949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!74917 () Bool)

(declare-fun e!48953 () Bool)

(assert (=> b!74917 (= e!48953 tp_is_empty!2479)))

(declare-fun b!74918 () Bool)

(assert (=> b!74918 (= e!48943 e!48940)))

(declare-fun b!74919 () Bool)

(declare-fun e!48955 () Bool)

(assert (=> b!74919 (= e!48955 (not e!48949))))

(declare-fun res!39565 () Bool)

(assert (=> b!74919 (=> res!39565 e!48949)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!74919 (= res!39565 (not (validMask!0 (mask!6210 (v!2548 (underlying!265 thiss!992))))))))

(declare-datatypes ((tuple2!2128 0))(
  ( (tuple2!2129 (_1!1075 (_ BitVec 64)) (_2!1075 V!2953)) )
))
(declare-datatypes ((List!1478 0))(
  ( (Nil!1475) (Cons!1474 (h!2062 tuple2!2128) (t!5048 List!1478)) )
))
(declare-datatypes ((ListLongMap!1407 0))(
  ( (ListLongMap!1408 (toList!719 List!1478)) )
))
(declare-fun lt!33762 () ListLongMap!1407)

(declare-fun lt!33758 () tuple2!2128)

(declare-fun lt!33761 () tuple2!2128)

(declare-fun +!95 (ListLongMap!1407 tuple2!2128) ListLongMap!1407)

(assert (=> b!74919 (= (+!95 (+!95 lt!33762 lt!33758) lt!33761) (+!95 (+!95 lt!33762 lt!33761) lt!33758))))

(assert (=> b!74919 (= lt!33761 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun lt!33768 () V!2953)

(assert (=> b!74919 (= lt!33758 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))

(declare-datatypes ((Unit!2157 0))(
  ( (Unit!2158) )
))
(declare-fun lt!33760 () Unit!2157)

(declare-fun addCommutativeForDiffKeys!15 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64) V!2953) Unit!2157)

(assert (=> b!74919 (= lt!33760 (addCommutativeForDiffKeys!15 lt!33762 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!60 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) ListLongMap!1407)

(assert (=> b!74919 (= lt!33762 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!74920 () Bool)

(declare-fun e!48947 () Bool)

(assert (=> b!74920 (= e!48947 e!48955)))

(declare-fun res!39566 () Bool)

(assert (=> b!74920 (=> (not res!39566) (not e!48955))))

(declare-datatypes ((tuple2!2130 0))(
  ( (tuple2!2131 (_1!1076 Bool) (_2!1076 LongMapFixedSize!700)) )
))
(declare-fun lt!33766 () tuple2!2130)

(assert (=> b!74920 (= res!39566 (and (_1!1076 lt!33766) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!33765 () Unit!2157)

(declare-fun e!48954 () Unit!2157)

(assert (=> b!74920 (= lt!33765 e!48954)))

(declare-fun lt!33764 () ListLongMap!1407)

(declare-fun c!11332 () Bool)

(declare-fun contains!723 (ListLongMap!1407 (_ BitVec 64)) Bool)

(assert (=> b!74920 (= c!11332 (contains!723 lt!33764 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun update!111 (LongMapFixedSize!700 (_ BitVec 64) V!2953) tuple2!2130)

(assert (=> b!74920 (= lt!33766 (update!111 newMap!16 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))

(declare-fun mapIsEmpty!3191 () Bool)

(declare-fun mapRes!3191 () Bool)

(assert (=> mapIsEmpty!3191 mapRes!3191))

(declare-fun res!39564 () Bool)

(assert (=> start!9918 (=> (not res!39564) (not e!48946))))

(declare-fun valid!310 (LongMap!508) Bool)

(assert (=> start!9918 (= res!39564 (valid!310 thiss!992))))

(assert (=> start!9918 e!48946))

(assert (=> start!9918 e!48956))

(assert (=> start!9918 true))

(declare-fun e!48950 () Bool)

(assert (=> start!9918 e!48950))

(declare-fun e!48948 () Bool)

(assert (=> b!74910 (= e!48950 (and tp!8562 tp_is_empty!2479 (array_inv!1141 (_keys!3889 newMap!16)) (array_inv!1142 (_values!2216 newMap!16)) e!48948))))

(declare-fun b!74921 () Bool)

(assert (=> b!74921 (= e!48948 (and e!48944 mapRes!3192))))

(declare-fun condMapEmpty!3191 () Bool)

(declare-fun mapDefault!3191 () ValueCell!896)

(assert (=> b!74921 (= condMapEmpty!3191 (= (arr!1857 (_values!2216 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3191)))))

(declare-fun b!74922 () Bool)

(declare-fun e!48941 () Bool)

(assert (=> b!74922 (= e!48946 e!48941)))

(declare-fun res!39562 () Bool)

(assert (=> b!74922 (=> (not res!39562) (not e!48941))))

(declare-fun lt!33767 () ListLongMap!1407)

(assert (=> b!74922 (= res!39562 (= lt!33767 lt!33764))))

(declare-fun map!1164 (LongMapFixedSize!700) ListLongMap!1407)

(assert (=> b!74922 (= lt!33764 (map!1164 newMap!16))))

(declare-fun getCurrentListMap!416 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) ListLongMap!1407)

(assert (=> b!74922 (= lt!33767 (getCurrentListMap!416 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!74923 () Bool)

(assert (=> b!74923 (= e!48941 e!48947)))

(declare-fun res!39568 () Bool)

(assert (=> b!74923 (=> (not res!39568) (not e!48947))))

(assert (=> b!74923 (= res!39568 (and (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1156 (ValueCell!896 V!2953) V!2953)

(declare-fun dynLambda!331 (Int (_ BitVec 64)) V!2953)

(assert (=> b!74923 (= lt!33768 (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!74924 () Bool)

(assert (=> b!74924 (= e!48957 (and e!48953 mapRes!3191))))

(declare-fun condMapEmpty!3192 () Bool)

(declare-fun mapDefault!3192 () ValueCell!896)

(assert (=> b!74924 (= condMapEmpty!3192 (= (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3192)))))

(declare-fun b!74925 () Bool)

(declare-fun res!39567 () Bool)

(assert (=> b!74925 (=> (not res!39567) (not e!48946))))

(assert (=> b!74925 (= res!39567 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6210 newMap!16)) (_size!399 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun mapNonEmpty!3192 () Bool)

(declare-fun tp!8560 () Bool)

(declare-fun e!48951 () Bool)

(assert (=> mapNonEmpty!3192 (= mapRes!3191 (and tp!8560 e!48951))))

(declare-fun mapValue!3192 () ValueCell!896)

(declare-fun mapKey!3191 () (_ BitVec 32))

(declare-fun mapRest!3192 () (Array (_ BitVec 32) ValueCell!896))

(assert (=> mapNonEmpty!3192 (= (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (store mapRest!3192 mapKey!3191 mapValue!3192))))

(declare-fun b!74926 () Bool)

(declare-fun Unit!2159 () Unit!2157)

(assert (=> b!74926 (= e!48954 Unit!2159)))

(declare-fun mapIsEmpty!3192 () Bool)

(assert (=> mapIsEmpty!3192 mapRes!3192))

(declare-fun b!74927 () Bool)

(assert (=> b!74927 (= e!48951 tp_is_empty!2479)))

(declare-fun b!74928 () Bool)

(declare-fun Unit!2160 () Unit!2157)

(assert (=> b!74928 (= e!48954 Unit!2160)))

(declare-fun lt!33757 () Unit!2157)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!46 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) (_ BitVec 32) Int) Unit!2157)

(assert (=> b!74928 (= lt!33757 (lemmaListMapContainsThenArrayContainsFrom!46 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!74928 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!33763 () Unit!2157)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3891 (_ BitVec 32) (_ BitVec 32)) Unit!2157)

(assert (=> b!74928 (= lt!33763 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1479 0))(
  ( (Nil!1476) (Cons!1475 (h!2063 (_ BitVec 64)) (t!5049 List!1479)) )
))
(declare-fun arrayNoDuplicates!0 (array!3891 (_ BitVec 32) List!1479) Bool)

(assert (=> b!74928 (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) from!355 Nil!1476)))

(declare-fun lt!33759 () Unit!2157)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3891 (_ BitVec 32) (_ BitVec 64) List!1479) Unit!2157)

(assert (=> b!74928 (= lt!33759 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476)))))

(assert (=> b!74928 false))

(declare-fun b!74929 () Bool)

(declare-fun res!39563 () Bool)

(assert (=> b!74929 (=> res!39563 e!48949)))

(assert (=> b!74929 (= res!39563 (or (not (= (size!2096 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6210 (v!2548 (underlying!265 thiss!992)))))) (not (= (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (size!2096 (_values!2216 (v!2548 (underlying!265 thiss!992)))))) (bvslt (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000011)))))

(assert (= (and start!9918 res!39564) b!74915))

(assert (= (and b!74915 res!39569) b!74914))

(assert (= (and b!74914 res!39570) b!74925))

(assert (= (and b!74925 res!39567) b!74922))

(assert (= (and b!74922 res!39562) b!74923))

(assert (= (and b!74923 res!39568) b!74920))

(assert (= (and b!74920 c!11332) b!74928))

(assert (= (and b!74920 (not c!11332)) b!74926))

(assert (= (and b!74920 res!39566) b!74919))

(assert (= (and b!74919 (not res!39565)) b!74929))

(assert (= (and b!74929 (not res!39563)) b!74916))

(assert (= (and b!74924 condMapEmpty!3192) mapIsEmpty!3191))

(assert (= (and b!74924 (not condMapEmpty!3192)) mapNonEmpty!3192))

(get-info :version)

(assert (= (and mapNonEmpty!3192 ((_ is ValueCellFull!896) mapValue!3192)) b!74927))

(assert (= (and b!74924 ((_ is ValueCellFull!896) mapDefault!3192)) b!74917))

(assert (= b!74909 b!74924))

(assert (= b!74918 b!74909))

(assert (= b!74912 b!74918))

(assert (= start!9918 b!74912))

(assert (= (and b!74921 condMapEmpty!3191) mapIsEmpty!3192))

(assert (= (and b!74921 (not condMapEmpty!3191)) mapNonEmpty!3191))

(assert (= (and mapNonEmpty!3191 ((_ is ValueCellFull!896) mapValue!3191)) b!74911))

(assert (= (and b!74921 ((_ is ValueCellFull!896) mapDefault!3191)) b!74913))

(assert (= b!74910 b!74921))

(assert (= start!9918 b!74910))

(declare-fun b_lambda!3377 () Bool)

(assert (=> (not b_lambda!3377) (not b!74923)))

(declare-fun t!5045 () Bool)

(declare-fun tb!1541 () Bool)

(assert (=> (and b!74909 (= (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))) t!5045) tb!1541))

(declare-fun result!2697 () Bool)

(assert (=> tb!1541 (= result!2697 tp_is_empty!2479)))

(assert (=> b!74923 t!5045))

(declare-fun b_and!4589 () Bool)

(assert (= b_and!4585 (and (=> t!5045 result!2697) b_and!4589)))

(declare-fun tb!1543 () Bool)

(declare-fun t!5047 () Bool)

(assert (=> (and b!74910 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))) t!5047) tb!1543))

(declare-fun result!2701 () Bool)

(assert (= result!2701 result!2697))

(assert (=> b!74923 t!5047))

(declare-fun b_and!4591 () Bool)

(assert (= b_and!4587 (and (=> t!5047 result!2701) b_and!4591)))

(declare-fun m!74477 () Bool)

(assert (=> b!74923 m!74477))

(declare-fun m!74479 () Bool)

(assert (=> b!74923 m!74479))

(declare-fun m!74481 () Bool)

(assert (=> b!74923 m!74481))

(assert (=> b!74923 m!74479))

(assert (=> b!74923 m!74481))

(declare-fun m!74483 () Bool)

(assert (=> b!74923 m!74483))

(declare-fun m!74485 () Bool)

(assert (=> b!74916 m!74485))

(declare-fun m!74487 () Bool)

(assert (=> b!74910 m!74487))

(declare-fun m!74489 () Bool)

(assert (=> b!74910 m!74489))

(declare-fun m!74491 () Bool)

(assert (=> start!9918 m!74491))

(declare-fun m!74493 () Bool)

(assert (=> b!74922 m!74493))

(declare-fun m!74495 () Bool)

(assert (=> b!74922 m!74495))

(declare-fun m!74497 () Bool)

(assert (=> b!74914 m!74497))

(assert (=> b!74920 m!74477))

(assert (=> b!74920 m!74477))

(declare-fun m!74499 () Bool)

(assert (=> b!74920 m!74499))

(assert (=> b!74920 m!74477))

(declare-fun m!74501 () Bool)

(assert (=> b!74920 m!74501))

(declare-fun m!74503 () Bool)

(assert (=> b!74928 m!74503))

(declare-fun m!74505 () Bool)

(assert (=> b!74928 m!74505))

(assert (=> b!74928 m!74477))

(declare-fun m!74507 () Bool)

(assert (=> b!74928 m!74507))

(assert (=> b!74928 m!74477))

(assert (=> b!74928 m!74477))

(declare-fun m!74509 () Bool)

(assert (=> b!74928 m!74509))

(assert (=> b!74928 m!74477))

(declare-fun m!74511 () Bool)

(assert (=> b!74928 m!74511))

(declare-fun m!74513 () Bool)

(assert (=> mapNonEmpty!3192 m!74513))

(declare-fun m!74515 () Bool)

(assert (=> b!74909 m!74515))

(declare-fun m!74517 () Bool)

(assert (=> b!74909 m!74517))

(declare-fun m!74519 () Bool)

(assert (=> mapNonEmpty!3191 m!74519))

(declare-fun m!74521 () Bool)

(assert (=> b!74919 m!74521))

(declare-fun m!74523 () Bool)

(assert (=> b!74919 m!74523))

(declare-fun m!74525 () Bool)

(assert (=> b!74919 m!74525))

(declare-fun m!74527 () Bool)

(assert (=> b!74919 m!74527))

(declare-fun m!74529 () Bool)

(assert (=> b!74919 m!74529))

(assert (=> b!74919 m!74477))

(declare-fun m!74531 () Bool)

(assert (=> b!74919 m!74531))

(assert (=> b!74919 m!74477))

(declare-fun m!74533 () Bool)

(assert (=> b!74919 m!74533))

(assert (=> b!74919 m!74521))

(assert (=> b!74919 m!74525))

(check-sat (not b!74910) (not b_next!2125) tp_is_empty!2479 (not b!74922) b_and!4591 (not b_lambda!3377) (not mapNonEmpty!3192) (not start!9918) (not b!74919) (not b!74916) (not b_next!2127) (not b!74928) (not b!74923) (not mapNonEmpty!3191) (not b!74920) b_and!4589 (not b!74909) (not b!74914))
(check-sat b_and!4589 b_and!4591 (not b_next!2125) (not b_next!2127))
(get-model)

(declare-fun b_lambda!3383 () Bool)

(assert (= b_lambda!3377 (or (and b!74909 b_free!2125) (and b!74910 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))) b_lambda!3383)))

(check-sat (not b!74910) (not b_next!2125) tp_is_empty!2479 (not b!74922) b_and!4591 (not mapNonEmpty!3192) (not start!9918) (not b_lambda!3383) (not b!74919) (not b!74916) (not b_next!2127) (not b!74928) (not b!74923) (not mapNonEmpty!3191) (not b!74920) b_and!4589 (not b!74909) (not b!74914))
(check-sat b_and!4589 b_and!4591 (not b_next!2125) (not b_next!2127))
(get-model)

(declare-fun d!17861 () Bool)

(assert (=> d!17861 (= (array_inv!1141 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvsge (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!74909 d!17861))

(declare-fun d!17863 () Bool)

(assert (=> d!17863 (= (array_inv!1142 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvsge (size!2096 (_values!2216 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!74909 d!17863))

(declare-fun d!17865 () Bool)

(declare-fun c!11341 () Bool)

(assert (=> d!17865 (= c!11341 ((_ is ValueCellFull!896) (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun e!49068 () V!2953)

(assert (=> d!17865 (= (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49068)))

(declare-fun b!75066 () Bool)

(declare-fun get!1157 (ValueCell!896 V!2953) V!2953)

(assert (=> b!75066 (= e!49068 (get!1157 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75067 () Bool)

(declare-fun get!1158 (ValueCell!896 V!2953) V!2953)

(assert (=> b!75067 (= e!49068 (get!1158 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17865 c!11341) b!75066))

(assert (= (and d!17865 (not c!11341)) b!75067))

(assert (=> b!75066 m!74479))

(assert (=> b!75066 m!74481))

(declare-fun m!74651 () Bool)

(assert (=> b!75066 m!74651))

(assert (=> b!75067 m!74479))

(assert (=> b!75067 m!74481))

(declare-fun m!74653 () Bool)

(assert (=> b!75067 m!74653))

(assert (=> b!74923 d!17865))

(declare-fun d!17867 () Bool)

(declare-fun res!39631 () Bool)

(declare-fun e!49071 () Bool)

(assert (=> d!17867 (=> (not res!39631) (not e!49071))))

(declare-fun simpleValid!52 (LongMapFixedSize!700) Bool)

(assert (=> d!17867 (= res!39631 (simpleValid!52 newMap!16))))

(assert (=> d!17867 (= (valid!309 newMap!16) e!49071)))

(declare-fun b!75074 () Bool)

(declare-fun res!39632 () Bool)

(assert (=> b!75074 (=> (not res!39632) (not e!49071))))

(declare-fun arrayCountValidKeys!0 (array!3891 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!75074 (= res!39632 (= (arrayCountValidKeys!0 (_keys!3889 newMap!16) #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) (_size!399 newMap!16)))))

(declare-fun b!75075 () Bool)

(declare-fun res!39633 () Bool)

(assert (=> b!75075 (=> (not res!39633) (not e!49071))))

(assert (=> b!75075 (= res!39633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(declare-fun b!75076 () Bool)

(assert (=> b!75076 (= e!49071 (arrayNoDuplicates!0 (_keys!3889 newMap!16) #b00000000000000000000000000000000 Nil!1476))))

(assert (= (and d!17867 res!39631) b!75074))

(assert (= (and b!75074 res!39632) b!75075))

(assert (= (and b!75075 res!39633) b!75076))

(declare-fun m!74655 () Bool)

(assert (=> d!17867 m!74655))

(declare-fun m!74657 () Bool)

(assert (=> b!75074 m!74657))

(declare-fun m!74659 () Bool)

(assert (=> b!75075 m!74659))

(declare-fun m!74661 () Bool)

(assert (=> b!75076 m!74661))

(assert (=> b!74914 d!17867))

(declare-fun d!17869 () Bool)

(assert (=> d!17869 (= (map!1164 newMap!16) (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun bs!3242 () Bool)

(assert (= bs!3242 d!17869))

(declare-fun m!74663 () Bool)

(assert (=> bs!3242 m!74663))

(assert (=> b!74922 d!17869))

(declare-fun b!75119 () Bool)

(declare-fun e!49108 () ListLongMap!1407)

(declare-fun call!6640 () ListLongMap!1407)

(assert (=> b!75119 (= e!49108 (+!95 call!6640 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75120 () Bool)

(declare-fun e!49107 () Bool)

(declare-fun e!49100 () Bool)

(assert (=> b!75120 (= e!49107 e!49100)))

(declare-fun c!11356 () Bool)

(assert (=> b!75120 (= c!11356 (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75121 () Bool)

(declare-fun e!49105 () Unit!2157)

(declare-fun Unit!2161 () Unit!2157)

(assert (=> b!75121 (= e!49105 Unit!2161)))

(declare-fun b!75122 () Bool)

(declare-fun res!39653 () Bool)

(assert (=> b!75122 (=> (not res!39653) (not e!49107))))

(declare-fun e!49099 () Bool)

(assert (=> b!75122 (= res!39653 e!49099)))

(declare-fun res!39656 () Bool)

(assert (=> b!75122 (=> res!39656 e!49099)))

(declare-fun e!49098 () Bool)

(assert (=> b!75122 (= res!39656 (not e!49098))))

(declare-fun res!39660 () Bool)

(assert (=> b!75122 (=> (not res!39660) (not e!49098))))

(assert (=> b!75122 (= res!39660 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75123 () Bool)

(declare-fun e!49103 () Bool)

(declare-fun lt!33886 () ListLongMap!1407)

(declare-fun apply!76 (ListLongMap!1407 (_ BitVec 64)) V!2953)

(assert (=> b!75123 (= e!49103 (= (apply!76 lt!33886 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75124 () Bool)

(declare-fun e!49102 () ListLongMap!1407)

(declare-fun call!6644 () ListLongMap!1407)

(assert (=> b!75124 (= e!49102 call!6644)))

(declare-fun b!75125 () Bool)

(declare-fun e!49101 () Bool)

(declare-fun call!6643 () Bool)

(assert (=> b!75125 (= e!49101 (not call!6643))))

(declare-fun b!75126 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!75126 (= e!49098 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75127 () Bool)

(declare-fun e!49110 () Bool)

(assert (=> b!75127 (= e!49110 (= (apply!76 lt!33886 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75128 () Bool)

(declare-fun lt!33887 () Unit!2157)

(assert (=> b!75128 (= e!49105 lt!33887)))

(declare-fun lt!33898 () ListLongMap!1407)

(assert (=> b!75128 (= lt!33898 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun lt!33900 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33900 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33892 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33892 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33894 () Unit!2157)

(declare-fun addStillContains!52 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2157)

(assert (=> b!75128 (= lt!33894 (addStillContains!52 lt!33898 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33892))))

(assert (=> b!75128 (contains!723 (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33892)))

(declare-fun lt!33888 () Unit!2157)

(assert (=> b!75128 (= lt!33888 lt!33894)))

(declare-fun lt!33895 () ListLongMap!1407)

(assert (=> b!75128 (= lt!33895 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun lt!33901 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33901 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33891 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33891 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33890 () Unit!2157)

(declare-fun addApplyDifferent!52 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2157)

(assert (=> b!75128 (= lt!33890 (addApplyDifferent!52 lt!33895 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33891))))

(assert (=> b!75128 (= (apply!76 (+!95 lt!33895 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33891) (apply!76 lt!33895 lt!33891))))

(declare-fun lt!33889 () Unit!2157)

(assert (=> b!75128 (= lt!33889 lt!33890)))

(declare-fun lt!33904 () ListLongMap!1407)

(assert (=> b!75128 (= lt!33904 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun lt!33906 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33905 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33905 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!33902 () Unit!2157)

(assert (=> b!75128 (= lt!33902 (addApplyDifferent!52 lt!33904 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33905))))

(assert (=> b!75128 (= (apply!76 (+!95 lt!33904 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33905) (apply!76 lt!33904 lt!33905))))

(declare-fun lt!33896 () Unit!2157)

(assert (=> b!75128 (= lt!33896 lt!33902)))

(declare-fun lt!33897 () ListLongMap!1407)

(assert (=> b!75128 (= lt!33897 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun lt!33903 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33903 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!33899 () (_ BitVec 64))

(assert (=> b!75128 (= lt!33899 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!75128 (= lt!33887 (addApplyDifferent!52 lt!33897 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33899))))

(assert (=> b!75128 (= (apply!76 (+!95 lt!33897 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33899) (apply!76 lt!33897 lt!33899))))

(declare-fun bm!6635 () Bool)

(declare-fun call!6642 () ListLongMap!1407)

(declare-fun call!6641 () ListLongMap!1407)

(assert (=> bm!6635 (= call!6642 call!6641)))

(declare-fun b!75129 () Bool)

(assert (=> b!75129 (= e!49108 e!49102)))

(declare-fun c!11357 () Bool)

(assert (=> b!75129 (= c!11357 (and (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75130 () Bool)

(assert (=> b!75130 (= e!49101 e!49103)))

(declare-fun res!39652 () Bool)

(assert (=> b!75130 (= res!39652 call!6643)))

(assert (=> b!75130 (=> (not res!39652) (not e!49103))))

(declare-fun b!75131 () Bool)

(declare-fun call!6639 () Bool)

(assert (=> b!75131 (= e!49100 (not call!6639))))

(declare-fun bm!6637 () Bool)

(assert (=> bm!6637 (= call!6644 call!6640)))

(declare-fun bm!6638 () Bool)

(declare-fun call!6638 () ListLongMap!1407)

(assert (=> bm!6638 (= call!6638 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75132 () Bool)

(assert (=> b!75132 (= e!49100 e!49110)))

(declare-fun res!39659 () Bool)

(assert (=> b!75132 (= res!39659 call!6639)))

(assert (=> b!75132 (=> (not res!39659) (not e!49110))))

(declare-fun b!75133 () Bool)

(declare-fun e!49104 () ListLongMap!1407)

(assert (=> b!75133 (= e!49104 call!6642)))

(declare-fun b!75134 () Bool)

(declare-fun e!49109 () Bool)

(assert (=> b!75134 (= e!49099 e!49109)))

(declare-fun res!39657 () Bool)

(assert (=> b!75134 (=> (not res!39657) (not e!49109))))

(assert (=> b!75134 (= res!39657 (contains!723 lt!33886 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75134 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75135 () Bool)

(declare-fun e!49106 () Bool)

(assert (=> b!75135 (= e!49106 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!6639 () Bool)

(assert (=> bm!6639 (= call!6641 call!6638)))

(declare-fun bm!6640 () Bool)

(assert (=> bm!6640 (= call!6639 (contains!723 lt!33886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75136 () Bool)

(declare-fun res!39654 () Bool)

(assert (=> b!75136 (=> (not res!39654) (not e!49107))))

(assert (=> b!75136 (= res!39654 e!49101)))

(declare-fun c!11355 () Bool)

(assert (=> b!75136 (= c!11355 (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6636 () Bool)

(assert (=> bm!6636 (= call!6643 (contains!723 lt!33886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!17871 () Bool)

(assert (=> d!17871 e!49107))

(declare-fun res!39655 () Bool)

(assert (=> d!17871 (=> (not res!39655) (not e!49107))))

(assert (=> d!17871 (= res!39655 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun lt!33885 () ListLongMap!1407)

(assert (=> d!17871 (= lt!33886 lt!33885)))

(declare-fun lt!33893 () Unit!2157)

(assert (=> d!17871 (= lt!33893 e!49105)))

(declare-fun c!11358 () Bool)

(assert (=> d!17871 (= c!11358 e!49106)))

(declare-fun res!39658 () Bool)

(assert (=> d!17871 (=> (not res!39658) (not e!49106))))

(assert (=> d!17871 (= res!39658 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> d!17871 (= lt!33885 e!49108)))

(declare-fun c!11354 () Bool)

(assert (=> d!17871 (= c!11354 (and (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17871 (validMask!0 (mask!6210 (v!2548 (underlying!265 thiss!992))))))

(assert (=> d!17871 (= (getCurrentListMap!416 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))) lt!33886)))

(declare-fun b!75137 () Bool)

(declare-fun c!11359 () Bool)

(assert (=> b!75137 (= c!11359 (and (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75137 (= e!49102 e!49104)))

(declare-fun b!75138 () Bool)

(assert (=> b!75138 (= e!49104 call!6644)))

(declare-fun bm!6641 () Bool)

(assert (=> bm!6641 (= call!6640 (+!95 (ite c!11354 call!6638 (ite c!11357 call!6641 call!6642)) (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun b!75139 () Bool)

(assert (=> b!75139 (= e!49109 (= (apply!76 lt!33886 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2096 (_values!2216 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> b!75139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!17871 c!11354) b!75119))

(assert (= (and d!17871 (not c!11354)) b!75129))

(assert (= (and b!75129 c!11357) b!75124))

(assert (= (and b!75129 (not c!11357)) b!75137))

(assert (= (and b!75137 c!11359) b!75138))

(assert (= (and b!75137 (not c!11359)) b!75133))

(assert (= (or b!75138 b!75133) bm!6635))

(assert (= (or b!75124 bm!6635) bm!6639))

(assert (= (or b!75124 b!75138) bm!6637))

(assert (= (or b!75119 bm!6639) bm!6638))

(assert (= (or b!75119 bm!6637) bm!6641))

(assert (= (and d!17871 res!39658) b!75135))

(assert (= (and d!17871 c!11358) b!75128))

(assert (= (and d!17871 (not c!11358)) b!75121))

(assert (= (and d!17871 res!39655) b!75122))

(assert (= (and b!75122 res!39660) b!75126))

(assert (= (and b!75122 (not res!39656)) b!75134))

(assert (= (and b!75134 res!39657) b!75139))

(assert (= (and b!75122 res!39653) b!75136))

(assert (= (and b!75136 c!11355) b!75130))

(assert (= (and b!75136 (not c!11355)) b!75125))

(assert (= (and b!75130 res!39652) b!75123))

(assert (= (or b!75130 b!75125) bm!6636))

(assert (= (and b!75136 res!39654) b!75120))

(assert (= (and b!75120 c!11356) b!75132))

(assert (= (and b!75120 (not c!11356)) b!75131))

(assert (= (and b!75132 res!39659) b!75127))

(assert (= (or b!75132 b!75131) bm!6640))

(declare-fun b_lambda!3385 () Bool)

(assert (=> (not b_lambda!3385) (not b!75139)))

(assert (=> b!75139 t!5045))

(declare-fun b_and!4609 () Bool)

(assert (= b_and!4589 (and (=> t!5045 result!2697) b_and!4609)))

(assert (=> b!75139 t!5047))

(declare-fun b_and!4611 () Bool)

(assert (= b_and!4591 (and (=> t!5047 result!2701) b_and!4611)))

(declare-fun m!74665 () Bool)

(assert (=> bm!6636 m!74665))

(assert (=> d!17871 m!74529))

(declare-fun m!74667 () Bool)

(assert (=> b!75127 m!74667))

(declare-fun m!74669 () Bool)

(assert (=> b!75134 m!74669))

(assert (=> b!75134 m!74669))

(declare-fun m!74671 () Bool)

(assert (=> b!75134 m!74671))

(declare-fun m!74673 () Bool)

(assert (=> b!75123 m!74673))

(assert (=> b!75135 m!74669))

(assert (=> b!75135 m!74669))

(declare-fun m!74675 () Bool)

(assert (=> b!75135 m!74675))

(assert (=> b!75139 m!74669))

(declare-fun m!74677 () Bool)

(assert (=> b!75139 m!74677))

(assert (=> b!75139 m!74669))

(declare-fun m!74679 () Bool)

(assert (=> b!75139 m!74679))

(assert (=> b!75139 m!74677))

(assert (=> b!75139 m!74481))

(declare-fun m!74681 () Bool)

(assert (=> b!75139 m!74681))

(assert (=> b!75139 m!74481))

(declare-fun m!74683 () Bool)

(assert (=> bm!6641 m!74683))

(declare-fun m!74685 () Bool)

(assert (=> b!75128 m!74685))

(declare-fun m!74687 () Bool)

(assert (=> b!75128 m!74687))

(declare-fun m!74689 () Bool)

(assert (=> b!75128 m!74689))

(declare-fun m!74691 () Bool)

(assert (=> b!75128 m!74691))

(declare-fun m!74693 () Bool)

(assert (=> b!75128 m!74693))

(declare-fun m!74695 () Bool)

(assert (=> b!75128 m!74695))

(declare-fun m!74697 () Bool)

(assert (=> b!75128 m!74697))

(assert (=> b!75128 m!74533))

(declare-fun m!74699 () Bool)

(assert (=> b!75128 m!74699))

(declare-fun m!74701 () Bool)

(assert (=> b!75128 m!74701))

(declare-fun m!74703 () Bool)

(assert (=> b!75128 m!74703))

(declare-fun m!74705 () Bool)

(assert (=> b!75128 m!74705))

(declare-fun m!74707 () Bool)

(assert (=> b!75128 m!74707))

(assert (=> b!75128 m!74669))

(assert (=> b!75128 m!74687))

(assert (=> b!75128 m!74707))

(declare-fun m!74709 () Bool)

(assert (=> b!75128 m!74709))

(declare-fun m!74711 () Bool)

(assert (=> b!75128 m!74711))

(assert (=> b!75128 m!74685))

(declare-fun m!74713 () Bool)

(assert (=> b!75128 m!74713))

(assert (=> b!75128 m!74701))

(assert (=> b!75126 m!74669))

(assert (=> b!75126 m!74669))

(assert (=> b!75126 m!74675))

(declare-fun m!74715 () Bool)

(assert (=> b!75119 m!74715))

(declare-fun m!74717 () Bool)

(assert (=> bm!6640 m!74717))

(assert (=> bm!6638 m!74533))

(assert (=> b!74922 d!17871))

(declare-fun d!17873 () Bool)

(declare-fun e!49115 () Bool)

(assert (=> d!17873 e!49115))

(declare-fun res!39663 () Bool)

(assert (=> d!17873 (=> res!39663 e!49115)))

(declare-fun lt!33916 () Bool)

(assert (=> d!17873 (= res!39663 (not lt!33916))))

(declare-fun lt!33918 () Bool)

(assert (=> d!17873 (= lt!33916 lt!33918)))

(declare-fun lt!33917 () Unit!2157)

(declare-fun e!49116 () Unit!2157)

(assert (=> d!17873 (= lt!33917 e!49116)))

(declare-fun c!11362 () Bool)

(assert (=> d!17873 (= c!11362 lt!33918)))

(declare-fun containsKey!138 (List!1478 (_ BitVec 64)) Bool)

(assert (=> d!17873 (= lt!33918 (containsKey!138 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> d!17873 (= (contains!723 lt!33764 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) lt!33916)))

(declare-fun b!75146 () Bool)

(declare-fun lt!33915 () Unit!2157)

(assert (=> b!75146 (= e!49116 lt!33915)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!86 (List!1478 (_ BitVec 64)) Unit!2157)

(assert (=> b!75146 (= lt!33915 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-datatypes ((Option!141 0))(
  ( (Some!140 (v!2554 V!2953)) (None!139) )
))
(declare-fun isDefined!87 (Option!141) Bool)

(declare-fun getValueByKey!135 (List!1478 (_ BitVec 64)) Option!141)

(assert (=> b!75146 (isDefined!87 (getValueByKey!135 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75147 () Bool)

(declare-fun Unit!2162 () Unit!2157)

(assert (=> b!75147 (= e!49116 Unit!2162)))

(declare-fun b!75148 () Bool)

(assert (=> b!75148 (= e!49115 (isDefined!87 (getValueByKey!135 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))))

(assert (= (and d!17873 c!11362) b!75146))

(assert (= (and d!17873 (not c!11362)) b!75147))

(assert (= (and d!17873 (not res!39663)) b!75148))

(assert (=> d!17873 m!74477))

(declare-fun m!74719 () Bool)

(assert (=> d!17873 m!74719))

(assert (=> b!75146 m!74477))

(declare-fun m!74721 () Bool)

(assert (=> b!75146 m!74721))

(assert (=> b!75146 m!74477))

(declare-fun m!74723 () Bool)

(assert (=> b!75146 m!74723))

(assert (=> b!75146 m!74723))

(declare-fun m!74725 () Bool)

(assert (=> b!75146 m!74725))

(assert (=> b!75148 m!74477))

(assert (=> b!75148 m!74723))

(assert (=> b!75148 m!74723))

(assert (=> b!75148 m!74725))

(assert (=> b!74920 d!17873))

(declare-fun b!75233 () Bool)

(declare-fun res!39700 () Bool)

(declare-datatypes ((SeekEntryResult!231 0))(
  ( (MissingZero!231 (index!3056 (_ BitVec 32))) (Found!231 (index!3057 (_ BitVec 32))) (Intermediate!231 (undefined!1043 Bool) (index!3058 (_ BitVec 32)) (x!11291 (_ BitVec 32))) (Undefined!231) (MissingVacant!231 (index!3059 (_ BitVec 32))) )
))
(declare-fun lt!33973 () SeekEntryResult!231)

(assert (=> b!75233 (= res!39700 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3059 lt!33973)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49174 () Bool)

(assert (=> b!75233 (=> (not res!39700) (not e!49174))))

(declare-fun c!11401 () Bool)

(declare-fun bm!6690 () Bool)

(declare-fun c!11392 () Bool)

(declare-fun c!11398 () Bool)

(declare-fun c!11393 () Bool)

(declare-fun call!6702 () Bool)

(declare-fun lt!33987 () SeekEntryResult!231)

(declare-fun lt!33997 () SeekEntryResult!231)

(declare-fun lt!33999 () SeekEntryResult!231)

(declare-fun c!11404 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!6690 (= call!6702 (inRange!0 (ite c!11392 (ite c!11401 (index!3057 lt!33997) (ite c!11393 (index!3056 lt!33973) (index!3059 lt!33973))) (ite c!11404 (index!3057 lt!33987) (ite c!11398 (index!3056 lt!33999) (index!3059 lt!33999)))) (mask!6210 newMap!16)))))

(declare-fun b!75234 () Bool)

(declare-fun lt!33998 () Unit!2157)

(declare-fun e!49164 () Unit!2157)

(assert (=> b!75234 (= lt!33998 e!49164)))

(declare-fun call!6701 () Bool)

(assert (=> b!75234 (= c!11401 call!6701)))

(declare-fun e!49172 () tuple2!2130)

(assert (=> b!75234 (= e!49172 (tuple2!2131 false newMap!16))))

(declare-fun b!75235 () Bool)

(declare-fun lt!33974 () Unit!2157)

(declare-fun lt!33981 () Unit!2157)

(assert (=> b!75235 (= lt!33974 lt!33981)))

(declare-fun call!6706 () ListLongMap!1407)

(declare-fun call!6695 () ListLongMap!1407)

(assert (=> b!75235 (= call!6706 call!6695)))

(declare-fun lt!33986 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!25 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2157)

(assert (=> b!75235 (= lt!33981 (lemmaChangeZeroKeyThenAddPairToListMap!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) lt!33986 (zeroValue!2133 newMap!16) lt!33768 (minValue!2133 newMap!16) (defaultEntry!2233 newMap!16)))))

(assert (=> b!75235 (= lt!33986 (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!49169 () tuple2!2130)

(assert (=> b!75235 (= e!49169 (tuple2!2131 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6210 newMap!16) (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) lt!33768 (minValue!2133 newMap!16) (_size!399 newMap!16) (_keys!3889 newMap!16) (_values!2216 newMap!16) (_vacant!399 newMap!16))))))

(declare-fun bm!6691 () Bool)

(declare-fun c!11403 () Bool)

(assert (=> bm!6691 (= c!11403 c!11392)))

(declare-fun e!49173 () ListLongMap!1407)

(assert (=> bm!6691 (= call!6701 (contains!723 e!49173 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75236 () Bool)

(declare-fun res!39703 () Bool)

(assert (=> b!75236 (= res!39703 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3059 lt!33999)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49171 () Bool)

(assert (=> b!75236 (=> (not res!39703) (not e!49171))))

(declare-fun bm!6692 () Bool)

(declare-fun call!6694 () ListLongMap!1407)

(assert (=> bm!6692 (= call!6706 call!6694)))

(declare-fun bm!6693 () Bool)

(declare-fun c!11399 () Bool)

(declare-fun c!11400 () Bool)

(declare-fun e!49165 () ListLongMap!1407)

(assert (=> bm!6693 (= call!6694 (+!95 e!49165 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(declare-fun c!11397 () Bool)

(assert (=> bm!6693 (= c!11397 c!11400)))

(declare-fun bm!6694 () Bool)

(declare-fun call!6693 () ListLongMap!1407)

(declare-fun lt!33983 () tuple2!2130)

(assert (=> bm!6694 (= call!6693 (map!1164 (_2!1076 lt!33983)))))

(declare-fun b!75237 () Bool)

(declare-fun e!49167 () Bool)

(assert (=> b!75237 (= e!49167 ((_ is Undefined!231) lt!33999))))

(declare-fun b!75238 () Bool)

(declare-fun e!49170 () Bool)

(assert (=> b!75238 (= e!49170 ((_ is Undefined!231) lt!33973))))

(declare-fun b!75239 () Bool)

(declare-fun Unit!2163 () Unit!2157)

(assert (=> b!75239 (= e!49164 Unit!2163)))

(declare-fun lt!33990 () Unit!2157)

(declare-fun call!6700 () Unit!2157)

(assert (=> b!75239 (= lt!33990 call!6700)))

(declare-fun call!6705 () SeekEntryResult!231)

(assert (=> b!75239 (= lt!33997 call!6705)))

(declare-fun res!39701 () Bool)

(assert (=> b!75239 (= res!39701 ((_ is Found!231) lt!33997))))

(declare-fun e!49179 () Bool)

(assert (=> b!75239 (=> (not res!39701) (not e!49179))))

(assert (=> b!75239 e!49179))

(declare-fun lt!33993 () Unit!2157)

(assert (=> b!75239 (= lt!33993 lt!33990)))

(assert (=> b!75239 false))

(declare-fun bm!6695 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2157)

(assert (=> bm!6695 (= call!6700 (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(declare-fun b!75240 () Bool)

(declare-fun e!49168 () Unit!2157)

(declare-fun Unit!2164 () Unit!2157)

(assert (=> b!75240 (= e!49168 Unit!2164)))

(declare-fun lt!33989 () Unit!2157)

(declare-fun call!6715 () Unit!2157)

(assert (=> b!75240 (= lt!33989 call!6715)))

(declare-fun call!6704 () SeekEntryResult!231)

(assert (=> b!75240 (= lt!33999 call!6704)))

(assert (=> b!75240 (= c!11398 ((_ is MissingZero!231) lt!33999))))

(declare-fun e!49181 () Bool)

(assert (=> b!75240 e!49181))

(declare-fun lt!33991 () Unit!2157)

(assert (=> b!75240 (= lt!33991 lt!33989)))

(assert (=> b!75240 false))

(declare-fun b!75241 () Bool)

(declare-fun lt!33976 () Unit!2157)

(declare-fun lt!33988 () Unit!2157)

(assert (=> b!75241 (= lt!33976 lt!33988)))

(assert (=> b!75241 (= call!6706 call!6695)))

(declare-fun lt!33992 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2157)

(assert (=> b!75241 (= lt!33988 (lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) lt!33992 (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) lt!33768 (defaultEntry!2233 newMap!16)))))

(assert (=> b!75241 (= lt!33992 (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!75241 (= e!49169 (tuple2!2131 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6210 newMap!16) (bvor (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) (zeroValue!2133 newMap!16) lt!33768 (_size!399 newMap!16) (_keys!3889 newMap!16) (_values!2216 newMap!16) (_vacant!399 newMap!16))))))

(declare-fun b!75242 () Bool)

(declare-fun e!49177 () tuple2!2130)

(declare-fun e!49182 () tuple2!2130)

(assert (=> b!75242 (= e!49177 e!49182)))

(declare-fun c!11402 () Bool)

(declare-fun lt!33994 () SeekEntryResult!231)

(assert (=> b!75242 (= c!11402 ((_ is MissingZero!231) lt!33994))))

(declare-fun b!75243 () Bool)

(assert (=> b!75243 (= e!49167 e!49171)))

(declare-fun res!39696 () Bool)

(declare-fun call!6716 () Bool)

(assert (=> b!75243 (= res!39696 call!6716)))

(assert (=> b!75243 (=> (not res!39696) (not e!49171))))

(declare-fun bm!6696 () Bool)

(declare-fun lt!33977 () array!3893)

(declare-fun call!6703 () ListLongMap!1407)

(assert (=> bm!6696 (= call!6703 (getCurrentListMap!416 (_keys!3889 newMap!16) (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun bm!6697 () Bool)

(declare-fun call!6707 () SeekEntryResult!231)

(assert (=> bm!6697 (= call!6704 call!6707)))

(declare-fun bm!6698 () Bool)

(declare-fun call!6710 () Bool)

(declare-fun call!6698 () Bool)

(assert (=> bm!6698 (= call!6710 call!6698)))

(declare-fun b!75244 () Bool)

(declare-fun lt!33978 () Unit!2157)

(assert (=> b!75244 (= e!49164 lt!33978)))

(assert (=> b!75244 (= lt!33978 call!6715)))

(assert (=> b!75244 (= lt!33973 call!6705)))

(assert (=> b!75244 (= c!11393 ((_ is MissingZero!231) lt!33973))))

(declare-fun e!49162 () Bool)

(assert (=> b!75244 e!49162))

(declare-fun c!11395 () Bool)

(declare-fun bm!6699 () Bool)

(declare-fun call!6712 () tuple2!2130)

(declare-fun updateHelperNewKey!25 (LongMapFixedSize!700 (_ BitVec 64) V!2953 (_ BitVec 32)) tuple2!2130)

(assert (=> bm!6699 (= call!6712 (updateHelperNewKey!25 newMap!16 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994))))))

(declare-fun bm!6700 () Bool)

(declare-fun call!6708 () Bool)

(declare-fun call!6699 () Bool)

(assert (=> bm!6700 (= call!6708 call!6699)))

(declare-fun b!75245 () Bool)

(declare-fun lt!33975 () Unit!2157)

(assert (=> b!75245 (= e!49168 lt!33975)))

(assert (=> b!75245 (= lt!33975 call!6700)))

(assert (=> b!75245 (= lt!33987 call!6704)))

(declare-fun res!39695 () Bool)

(assert (=> b!75245 (= res!39695 ((_ is Found!231) lt!33987))))

(declare-fun e!49178 () Bool)

(assert (=> b!75245 (=> (not res!39695) (not e!49178))))

(assert (=> b!75245 e!49178))

(declare-fun bm!6701 () Bool)

(declare-fun call!6713 () Bool)

(assert (=> bm!6701 (= call!6713 call!6699)))

(declare-fun b!75246 () Bool)

(declare-fun res!39692 () Bool)

(declare-fun call!6697 () Bool)

(assert (=> b!75246 (= res!39692 call!6697)))

(assert (=> b!75246 (=> (not res!39692) (not e!49178))))

(declare-fun bm!6702 () Bool)

(declare-fun call!6714 () ListLongMap!1407)

(assert (=> bm!6702 (= call!6714 call!6703)))

(declare-fun bm!6703 () Bool)

(declare-fun call!6709 () ListLongMap!1407)

(assert (=> bm!6703 (= call!6709 (map!1164 newMap!16))))

(declare-fun b!75247 () Bool)

(declare-fun lt!33979 () Unit!2157)

(declare-fun lt!33985 () Unit!2157)

(assert (=> b!75247 (= lt!33979 lt!33985)))

(assert (=> b!75247 (contains!723 call!6714 (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33994)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!85 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) Unit!2157)

(assert (=> b!75247 (= lt!33985 (lemmaValidKeyInArrayIsInListMap!85 (_keys!3889 newMap!16) lt!33977 (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3057 lt!33994) (defaultEntry!2233 newMap!16)))))

(assert (=> b!75247 (= lt!33977 (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16))))))

(declare-fun lt!33980 () Unit!2157)

(declare-fun lt!33995 () Unit!2157)

(assert (=> b!75247 (= lt!33980 lt!33995)))

(declare-fun call!6711 () ListLongMap!1407)

(assert (=> b!75247 (= call!6694 call!6711)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) (_ BitVec 64) V!2953 Int) Unit!2157)

(assert (=> b!75247 (= lt!33995 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3057 lt!33994) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!33984 () Unit!2157)

(assert (=> b!75247 (= lt!33984 e!49168)))

(assert (=> b!75247 (= c!11404 call!6701)))

(assert (=> b!75247 (= e!49182 (tuple2!2131 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (_size!399 newMap!16) (_keys!3889 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16))) (_vacant!399 newMap!16))))))

(declare-fun bm!6704 () Bool)

(assert (=> bm!6704 (= call!6716 call!6697)))

(declare-fun bm!6705 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3891 (_ BitVec 32)) SeekEntryResult!231)

(assert (=> bm!6705 (= call!6707 (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(declare-fun b!75248 () Bool)

(declare-fun e!49176 () Bool)

(assert (=> b!75248 (= e!49176 (not call!6708))))

(declare-fun b!75249 () Bool)

(declare-fun lt!33982 () tuple2!2130)

(assert (=> b!75249 (= e!49177 (tuple2!2131 (_1!1076 lt!33982) (_2!1076 lt!33982)))))

(assert (=> b!75249 (= lt!33982 call!6712)))

(declare-fun b!75250 () Bool)

(assert (=> b!75250 (= e!49179 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33997)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75251 () Bool)

(assert (=> b!75251 (= e!49174 (not call!6708))))

(declare-fun b!75252 () Bool)

(declare-fun e!49180 () Bool)

(assert (=> b!75252 (= e!49180 (not call!6713))))

(declare-fun b!75253 () Bool)

(declare-fun c!11394 () Bool)

(assert (=> b!75253 (= c!11394 ((_ is MissingVacant!231) lt!33973))))

(assert (=> b!75253 (= e!49162 e!49170)))

(declare-fun bm!6706 () Bool)

(assert (=> bm!6706 (= call!6697 call!6702)))

(declare-fun b!75254 () Bool)

(declare-fun e!49163 () tuple2!2130)

(assert (=> b!75254 (= e!49163 e!49169)))

(assert (=> b!75254 (= c!11399 (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75255 () Bool)

(declare-fun e!49166 () Bool)

(assert (=> b!75255 (= e!49166 (= call!6693 (+!95 call!6709 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(declare-fun b!75256 () Bool)

(assert (=> b!75256 (= e!49163 e!49172)))

(assert (=> b!75256 (= lt!33994 (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(assert (=> b!75256 (= c!11392 ((_ is Undefined!231) lt!33994))))

(declare-fun b!75257 () Bool)

(assert (=> b!75257 (= e!49170 e!49174)))

(declare-fun res!39698 () Bool)

(assert (=> b!75257 (= res!39698 call!6710)))

(assert (=> b!75257 (=> (not res!39698) (not e!49174))))

(declare-fun b!75258 () Bool)

(declare-fun res!39697 () Bool)

(assert (=> b!75258 (=> (not res!39697) (not e!49180))))

(assert (=> b!75258 (= res!39697 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3056 lt!33999)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75259 () Bool)

(assert (=> b!75259 (= e!49173 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75260 () Bool)

(declare-fun lt!33996 () tuple2!2130)

(assert (=> b!75260 (= lt!33996 call!6712)))

(assert (=> b!75260 (= e!49182 (tuple2!2131 (_1!1076 lt!33996) (_2!1076 lt!33996)))))

(declare-fun bm!6707 () Bool)

(assert (=> bm!6707 (= call!6699 (arrayContainsKey!0 (_keys!3889 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!75261 () Bool)

(declare-fun call!6696 () ListLongMap!1407)

(assert (=> b!75261 (= e!49165 call!6696)))

(declare-fun b!75262 () Bool)

(declare-fun e!49175 () Bool)

(assert (=> b!75262 (= e!49175 (= call!6693 call!6709))))

(declare-fun b!75263 () Bool)

(declare-fun c!11396 () Bool)

(assert (=> b!75263 (= c!11396 ((_ is MissingVacant!231) lt!33999))))

(assert (=> b!75263 (= e!49181 e!49167)))

(declare-fun b!75264 () Bool)

(declare-fun e!49161 () Bool)

(assert (=> b!75264 (= e!49161 e!49175)))

(declare-fun c!11391 () Bool)

(assert (=> b!75264 (= c!11391 (_1!1076 lt!33983))))

(declare-fun b!75265 () Bool)

(declare-fun res!39702 () Bool)

(assert (=> b!75265 (= res!39702 call!6698)))

(assert (=> b!75265 (=> (not res!39702) (not e!49179))))

(declare-fun b!75266 () Bool)

(assert (=> b!75266 (= e!49178 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33987)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75267 () Bool)

(assert (=> b!75267 (= e!49171 (not call!6713))))

(declare-fun bm!6708 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2157)

(assert (=> bm!6708 (= call!6715 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(declare-fun d!17875 () Bool)

(assert (=> d!17875 e!49161))

(declare-fun res!39699 () Bool)

(assert (=> d!17875 (=> (not res!39699) (not e!49161))))

(assert (=> d!17875 (= res!39699 (valid!309 (_2!1076 lt!33983)))))

(assert (=> d!17875 (= lt!33983 e!49163)))

(assert (=> d!17875 (= c!11400 (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvneg (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))))

(assert (=> d!17875 (valid!309 newMap!16)))

(assert (=> d!17875 (= (update!111 newMap!16 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768) lt!33983)))

(declare-fun bm!6709 () Bool)

(assert (=> bm!6709 (= call!6711 (getCurrentListMap!416 (_keys!3889 newMap!16) (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))) (mask!6210 newMap!16) (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun bm!6710 () Bool)

(assert (=> bm!6710 (= call!6695 call!6711)))

(declare-fun b!75268 () Bool)

(assert (=> b!75268 (= e!49173 call!6714)))

(declare-fun b!75269 () Bool)

(assert (=> b!75269 (= c!11395 ((_ is MissingVacant!231) lt!33994))))

(assert (=> b!75269 (= e!49172 e!49177)))

(declare-fun bm!6711 () Bool)

(assert (=> bm!6711 (= call!6705 call!6707)))

(declare-fun b!75270 () Bool)

(assert (=> b!75270 (= e!49165 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75271 () Bool)

(declare-fun res!39694 () Bool)

(assert (=> b!75271 (=> (not res!39694) (not e!49176))))

(assert (=> b!75271 (= res!39694 call!6710)))

(assert (=> b!75271 (= e!49162 e!49176)))

(declare-fun bm!6712 () Bool)

(assert (=> bm!6712 (= call!6696 call!6703)))

(declare-fun b!75272 () Bool)

(declare-fun res!39693 () Bool)

(assert (=> b!75272 (=> (not res!39693) (not e!49176))))

(assert (=> b!75272 (= res!39693 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3056 lt!33973)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!6713 () Bool)

(assert (=> bm!6713 (= call!6698 call!6702)))

(declare-fun b!75273 () Bool)

(declare-fun res!39704 () Bool)

(assert (=> b!75273 (=> (not res!39704) (not e!49180))))

(assert (=> b!75273 (= res!39704 call!6716)))

(assert (=> b!75273 (= e!49181 e!49180)))

(declare-fun b!75274 () Bool)

(assert (=> b!75274 (= e!49175 e!49166)))

(declare-fun res!39705 () Bool)

(assert (=> b!75274 (= res!39705 (contains!723 call!6693 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> b!75274 (=> (not res!39705) (not e!49166))))

(assert (= (and d!17875 c!11400) b!75254))

(assert (= (and d!17875 (not c!11400)) b!75256))

(assert (= (and b!75254 c!11399) b!75235))

(assert (= (and b!75254 (not c!11399)) b!75241))

(assert (= (or b!75235 b!75241) bm!6710))

(assert (= (or b!75235 b!75241) bm!6712))

(assert (= (or b!75235 b!75241) bm!6692))

(assert (= (and b!75256 c!11392) b!75234))

(assert (= (and b!75256 (not c!11392)) b!75269))

(assert (= (and b!75234 c!11401) b!75239))

(assert (= (and b!75234 (not c!11401)) b!75244))

(assert (= (and b!75239 res!39701) b!75265))

(assert (= (and b!75265 res!39702) b!75250))

(assert (= (and b!75244 c!11393) b!75271))

(assert (= (and b!75244 (not c!11393)) b!75253))

(assert (= (and b!75271 res!39694) b!75272))

(assert (= (and b!75272 res!39693) b!75248))

(assert (= (and b!75253 c!11394) b!75257))

(assert (= (and b!75253 (not c!11394)) b!75238))

(assert (= (and b!75257 res!39698) b!75233))

(assert (= (and b!75233 res!39700) b!75251))

(assert (= (or b!75271 b!75257) bm!6698))

(assert (= (or b!75248 b!75251) bm!6700))

(assert (= (or b!75265 bm!6698) bm!6713))

(assert (= (or b!75239 b!75244) bm!6711))

(assert (= (and b!75269 c!11395) b!75249))

(assert (= (and b!75269 (not c!11395)) b!75242))

(assert (= (and b!75242 c!11402) b!75260))

(assert (= (and b!75242 (not c!11402)) b!75247))

(assert (= (and b!75247 c!11404) b!75245))

(assert (= (and b!75247 (not c!11404)) b!75240))

(assert (= (and b!75245 res!39695) b!75246))

(assert (= (and b!75246 res!39692) b!75266))

(assert (= (and b!75240 c!11398) b!75273))

(assert (= (and b!75240 (not c!11398)) b!75263))

(assert (= (and b!75273 res!39704) b!75258))

(assert (= (and b!75258 res!39697) b!75252))

(assert (= (and b!75263 c!11396) b!75243))

(assert (= (and b!75263 (not c!11396)) b!75237))

(assert (= (and b!75243 res!39696) b!75236))

(assert (= (and b!75236 res!39703) b!75267))

(assert (= (or b!75273 b!75243) bm!6704))

(assert (= (or b!75252 b!75267) bm!6701))

(assert (= (or b!75246 bm!6704) bm!6706))

(assert (= (or b!75245 b!75240) bm!6697))

(assert (= (or b!75249 b!75260) bm!6699))

(assert (= (or b!75234 b!75247) bm!6702))

(assert (= (or b!75244 b!75240) bm!6708))

(assert (= (or bm!6711 bm!6697) bm!6705))

(assert (= (or b!75239 b!75245) bm!6695))

(assert (= (or bm!6713 bm!6706) bm!6690))

(assert (= (or bm!6700 bm!6701) bm!6707))

(assert (= (or b!75234 b!75247) bm!6691))

(assert (= (and bm!6691 c!11403) b!75268))

(assert (= (and bm!6691 (not c!11403)) b!75259))

(assert (= (or bm!6710 b!75247) bm!6709))

(assert (= (or bm!6712 bm!6702) bm!6696))

(assert (= (or bm!6692 b!75247) bm!6693))

(assert (= (and bm!6693 c!11397) b!75261))

(assert (= (and bm!6693 (not c!11397)) b!75270))

(assert (= (and d!17875 res!39699) b!75264))

(assert (= (and b!75264 c!11391) b!75274))

(assert (= (and b!75264 (not c!11391)) b!75262))

(assert (= (and b!75274 res!39705) b!75255))

(assert (= (or b!75274 b!75255 b!75262) bm!6694))

(assert (= (or b!75255 b!75262) bm!6703))

(assert (=> b!75274 m!74477))

(declare-fun m!74727 () Bool)

(assert (=> b!75274 m!74727))

(declare-fun m!74729 () Bool)

(assert (=> bm!6693 m!74729))

(assert (=> bm!6707 m!74477))

(declare-fun m!74731 () Bool)

(assert (=> bm!6707 m!74731))

(assert (=> b!75270 m!74663))

(declare-fun m!74733 () Bool)

(assert (=> bm!6709 m!74733))

(declare-fun m!74735 () Bool)

(assert (=> bm!6709 m!74735))

(assert (=> bm!6703 m!74493))

(declare-fun m!74737 () Bool)

(assert (=> bm!6690 m!74737))

(declare-fun m!74739 () Bool)

(assert (=> b!75258 m!74739))

(assert (=> bm!6708 m!74477))

(declare-fun m!74741 () Bool)

(assert (=> bm!6708 m!74741))

(assert (=> b!75259 m!74663))

(declare-fun m!74743 () Bool)

(assert (=> b!75250 m!74743))

(declare-fun m!74745 () Bool)

(assert (=> b!75241 m!74745))

(declare-fun m!74747 () Bool)

(assert (=> b!75236 m!74747))

(declare-fun m!74749 () Bool)

(assert (=> d!17875 m!74749))

(assert (=> d!17875 m!74497))

(declare-fun m!74751 () Bool)

(assert (=> b!75235 m!74751))

(assert (=> b!75256 m!74477))

(declare-fun m!74753 () Bool)

(assert (=> b!75256 m!74753))

(declare-fun m!74755 () Bool)

(assert (=> bm!6694 m!74755))

(declare-fun m!74757 () Bool)

(assert (=> b!75233 m!74757))

(declare-fun m!74759 () Bool)

(assert (=> b!75272 m!74759))

(assert (=> bm!6695 m!74477))

(declare-fun m!74761 () Bool)

(assert (=> bm!6695 m!74761))

(assert (=> bm!6705 m!74477))

(assert (=> bm!6705 m!74753))

(declare-fun m!74763 () Bool)

(assert (=> b!75266 m!74763))

(assert (=> b!75247 m!74733))

(declare-fun m!74765 () Bool)

(assert (=> b!75247 m!74765))

(declare-fun m!74767 () Bool)

(assert (=> b!75247 m!74767))

(declare-fun m!74769 () Bool)

(assert (=> b!75247 m!74769))

(assert (=> b!75247 m!74477))

(declare-fun m!74771 () Bool)

(assert (=> b!75247 m!74771))

(assert (=> b!75247 m!74765))

(declare-fun m!74773 () Bool)

(assert (=> b!75255 m!74773))

(assert (=> bm!6691 m!74477))

(declare-fun m!74775 () Bool)

(assert (=> bm!6691 m!74775))

(declare-fun m!74777 () Bool)

(assert (=> bm!6696 m!74777))

(assert (=> bm!6699 m!74477))

(declare-fun m!74779 () Bool)

(assert (=> bm!6699 m!74779))

(assert (=> b!74920 d!17875))

(declare-fun d!17877 () Bool)

(assert (=> d!17877 (= (array_inv!1141 (_keys!3889 newMap!16)) (bvsge (size!2095 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!74910 d!17877))

(declare-fun d!17879 () Bool)

(assert (=> d!17879 (= (array_inv!1142 (_values!2216 newMap!16)) (bvsge (size!2096 (_values!2216 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!74910 d!17879))

(declare-fun d!17881 () Bool)

(declare-fun e!49185 () Bool)

(assert (=> d!17881 e!49185))

(declare-fun res!39711 () Bool)

(assert (=> d!17881 (=> (not res!39711) (not e!49185))))

(declare-fun lt!34011 () ListLongMap!1407)

(assert (=> d!17881 (= res!39711 (contains!723 lt!34011 (_1!1075 lt!33761)))))

(declare-fun lt!34009 () List!1478)

(assert (=> d!17881 (= lt!34011 (ListLongMap!1408 lt!34009))))

(declare-fun lt!34008 () Unit!2157)

(declare-fun lt!34010 () Unit!2157)

(assert (=> d!17881 (= lt!34008 lt!34010)))

(assert (=> d!17881 (= (getValueByKey!135 lt!34009 (_1!1075 lt!33761)) (Some!140 (_2!1075 lt!33761)))))

(declare-fun lemmaContainsTupThenGetReturnValue!52 (List!1478 (_ BitVec 64) V!2953) Unit!2157)

(assert (=> d!17881 (= lt!34010 (lemmaContainsTupThenGetReturnValue!52 lt!34009 (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(declare-fun insertStrictlySorted!55 (List!1478 (_ BitVec 64) V!2953) List!1478)

(assert (=> d!17881 (= lt!34009 (insertStrictlySorted!55 (toList!719 lt!33762) (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(assert (=> d!17881 (= (+!95 lt!33762 lt!33761) lt!34011)))

(declare-fun b!75279 () Bool)

(declare-fun res!39710 () Bool)

(assert (=> b!75279 (=> (not res!39710) (not e!49185))))

(assert (=> b!75279 (= res!39710 (= (getValueByKey!135 (toList!719 lt!34011) (_1!1075 lt!33761)) (Some!140 (_2!1075 lt!33761))))))

(declare-fun b!75280 () Bool)

(declare-fun contains!724 (List!1478 tuple2!2128) Bool)

(assert (=> b!75280 (= e!49185 (contains!724 (toList!719 lt!34011) lt!33761))))

(assert (= (and d!17881 res!39711) b!75279))

(assert (= (and b!75279 res!39710) b!75280))

(declare-fun m!74781 () Bool)

(assert (=> d!17881 m!74781))

(declare-fun m!74783 () Bool)

(assert (=> d!17881 m!74783))

(declare-fun m!74785 () Bool)

(assert (=> d!17881 m!74785))

(declare-fun m!74787 () Bool)

(assert (=> d!17881 m!74787))

(declare-fun m!74789 () Bool)

(assert (=> b!75279 m!74789))

(declare-fun m!74791 () Bool)

(assert (=> b!75280 m!74791))

(assert (=> b!74919 d!17881))

(declare-fun d!17883 () Bool)

(declare-fun e!49186 () Bool)

(assert (=> d!17883 e!49186))

(declare-fun res!39713 () Bool)

(assert (=> d!17883 (=> (not res!39713) (not e!49186))))

(declare-fun lt!34015 () ListLongMap!1407)

(assert (=> d!17883 (= res!39713 (contains!723 lt!34015 (_1!1075 lt!33761)))))

(declare-fun lt!34013 () List!1478)

(assert (=> d!17883 (= lt!34015 (ListLongMap!1408 lt!34013))))

(declare-fun lt!34012 () Unit!2157)

(declare-fun lt!34014 () Unit!2157)

(assert (=> d!17883 (= lt!34012 lt!34014)))

(assert (=> d!17883 (= (getValueByKey!135 lt!34013 (_1!1075 lt!33761)) (Some!140 (_2!1075 lt!33761)))))

(assert (=> d!17883 (= lt!34014 (lemmaContainsTupThenGetReturnValue!52 lt!34013 (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(assert (=> d!17883 (= lt!34013 (insertStrictlySorted!55 (toList!719 (+!95 lt!33762 lt!33758)) (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(assert (=> d!17883 (= (+!95 (+!95 lt!33762 lt!33758) lt!33761) lt!34015)))

(declare-fun b!75281 () Bool)

(declare-fun res!39712 () Bool)

(assert (=> b!75281 (=> (not res!39712) (not e!49186))))

(assert (=> b!75281 (= res!39712 (= (getValueByKey!135 (toList!719 lt!34015) (_1!1075 lt!33761)) (Some!140 (_2!1075 lt!33761))))))

(declare-fun b!75282 () Bool)

(assert (=> b!75282 (= e!49186 (contains!724 (toList!719 lt!34015) lt!33761))))

(assert (= (and d!17883 res!39713) b!75281))

(assert (= (and b!75281 res!39712) b!75282))

(declare-fun m!74793 () Bool)

(assert (=> d!17883 m!74793))

(declare-fun m!74795 () Bool)

(assert (=> d!17883 m!74795))

(declare-fun m!74797 () Bool)

(assert (=> d!17883 m!74797))

(declare-fun m!74799 () Bool)

(assert (=> d!17883 m!74799))

(declare-fun m!74801 () Bool)

(assert (=> b!75281 m!74801))

(declare-fun m!74803 () Bool)

(assert (=> b!75282 m!74803))

(assert (=> b!74919 d!17883))

(declare-fun b!75307 () Bool)

(declare-fun e!49207 () ListLongMap!1407)

(declare-fun call!6719 () ListLongMap!1407)

(assert (=> b!75307 (= e!49207 call!6719)))

(declare-fun b!75308 () Bool)

(declare-fun e!49205 () Bool)

(declare-fun lt!34030 () ListLongMap!1407)

(declare-fun isEmpty!325 (ListLongMap!1407) Bool)

(assert (=> b!75308 (= e!49205 (isEmpty!325 lt!34030))))

(declare-fun b!75309 () Bool)

(assert (=> b!75309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> b!75309 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2096 (_values!2216 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun e!49201 () Bool)

(assert (=> b!75309 (= e!49201 (= (apply!76 lt!34030 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!75310 () Bool)

(declare-fun e!49203 () Bool)

(declare-fun e!49202 () Bool)

(assert (=> b!75310 (= e!49203 e!49202)))

(declare-fun c!11415 () Bool)

(declare-fun e!49206 () Bool)

(assert (=> b!75310 (= c!11415 e!49206)))

(declare-fun res!39725 () Bool)

(assert (=> b!75310 (=> (not res!39725) (not e!49206))))

(assert (=> b!75310 (= res!39725 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75311 () Bool)

(assert (=> b!75311 (= e!49202 e!49201)))

(assert (=> b!75311 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun res!39722 () Bool)

(assert (=> b!75311 (= res!39722 (contains!723 lt!34030 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75311 (=> (not res!39722) (not e!49201))))

(declare-fun b!75312 () Bool)

(declare-fun e!49204 () ListLongMap!1407)

(assert (=> b!75312 (= e!49204 (ListLongMap!1408 Nil!1475))))

(declare-fun b!75313 () Bool)

(declare-fun res!39723 () Bool)

(assert (=> b!75313 (=> (not res!39723) (not e!49203))))

(assert (=> b!75313 (= res!39723 (not (contains!723 lt!34030 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!17885 () Bool)

(assert (=> d!17885 e!49203))

(declare-fun res!39724 () Bool)

(assert (=> d!17885 (=> (not res!39724) (not e!49203))))

(assert (=> d!17885 (= res!39724 (not (contains!723 lt!34030 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17885 (= lt!34030 e!49204)))

(declare-fun c!11413 () Bool)

(assert (=> d!17885 (= c!11413 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> d!17885 (validMask!0 (mask!6210 (v!2548 (underlying!265 thiss!992))))))

(assert (=> d!17885 (= (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))) lt!34030)))

(declare-fun b!75314 () Bool)

(assert (=> b!75314 (= e!49206 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75314 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!75315 () Bool)

(assert (=> b!75315 (= e!49202 e!49205)))

(declare-fun c!11414 () Bool)

(assert (=> b!75315 (= c!11414 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun bm!6716 () Bool)

(assert (=> bm!6716 (= call!6719 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75316 () Bool)

(assert (=> b!75316 (= e!49205 (= lt!34030 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75317 () Bool)

(assert (=> b!75317 (= e!49204 e!49207)))

(declare-fun c!11416 () Bool)

(assert (=> b!75317 (= c!11416 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75318 () Bool)

(declare-fun lt!34033 () Unit!2157)

(declare-fun lt!34034 () Unit!2157)

(assert (=> b!75318 (= lt!34033 lt!34034)))

(declare-fun lt!34036 () V!2953)

(declare-fun lt!34031 () (_ BitVec 64))

(declare-fun lt!34035 () (_ BitVec 64))

(declare-fun lt!34032 () ListLongMap!1407)

(assert (=> b!75318 (not (contains!723 (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036)) lt!34031))))

(declare-fun addStillNotContains!27 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2157)

(assert (=> b!75318 (= lt!34034 (addStillNotContains!27 lt!34032 lt!34035 lt!34036 lt!34031))))

(assert (=> b!75318 (= lt!34031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!75318 (= lt!34036 (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75318 (= lt!34035 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!75318 (= lt!34032 call!6719)))

(assert (=> b!75318 (= e!49207 (+!95 call!6719 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!17885 c!11413) b!75312))

(assert (= (and d!17885 (not c!11413)) b!75317))

(assert (= (and b!75317 c!11416) b!75318))

(assert (= (and b!75317 (not c!11416)) b!75307))

(assert (= (or b!75318 b!75307) bm!6716))

(assert (= (and d!17885 res!39724) b!75313))

(assert (= (and b!75313 res!39723) b!75310))

(assert (= (and b!75310 res!39725) b!75314))

(assert (= (and b!75310 c!11415) b!75311))

(assert (= (and b!75310 (not c!11415)) b!75315))

(assert (= (and b!75311 res!39722) b!75309))

(assert (= (and b!75315 c!11414) b!75316))

(assert (= (and b!75315 (not c!11414)) b!75308))

(declare-fun b_lambda!3387 () Bool)

(assert (=> (not b_lambda!3387) (not b!75309)))

(assert (=> b!75309 t!5045))

(declare-fun b_and!4613 () Bool)

(assert (= b_and!4609 (and (=> t!5045 result!2697) b_and!4613)))

(assert (=> b!75309 t!5047))

(declare-fun b_and!4615 () Bool)

(assert (= b_and!4611 (and (=> t!5047 result!2701) b_and!4615)))

(declare-fun b_lambda!3389 () Bool)

(assert (=> (not b_lambda!3389) (not b!75318)))

(assert (=> b!75318 t!5045))

(declare-fun b_and!4617 () Bool)

(assert (= b_and!4613 (and (=> t!5045 result!2697) b_and!4617)))

(assert (=> b!75318 t!5047))

(declare-fun b_and!4619 () Bool)

(assert (= b_and!4615 (and (=> t!5047 result!2701) b_and!4619)))

(declare-fun m!74805 () Bool)

(assert (=> b!75308 m!74805))

(assert (=> b!75309 m!74669))

(assert (=> b!75309 m!74669))

(declare-fun m!74807 () Bool)

(assert (=> b!75309 m!74807))

(assert (=> b!75309 m!74677))

(assert (=> b!75309 m!74481))

(assert (=> b!75309 m!74681))

(assert (=> b!75309 m!74677))

(assert (=> b!75309 m!74481))

(assert (=> b!75318 m!74669))

(declare-fun m!74809 () Bool)

(assert (=> b!75318 m!74809))

(declare-fun m!74811 () Bool)

(assert (=> b!75318 m!74811))

(assert (=> b!75318 m!74677))

(assert (=> b!75318 m!74481))

(assert (=> b!75318 m!74681))

(declare-fun m!74813 () Bool)

(assert (=> b!75318 m!74813))

(declare-fun m!74815 () Bool)

(assert (=> b!75318 m!74815))

(assert (=> b!75318 m!74813))

(assert (=> b!75318 m!74677))

(assert (=> b!75318 m!74481))

(declare-fun m!74817 () Bool)

(assert (=> b!75313 m!74817))

(assert (=> b!75317 m!74669))

(assert (=> b!75317 m!74669))

(assert (=> b!75317 m!74675))

(assert (=> b!75311 m!74669))

(assert (=> b!75311 m!74669))

(declare-fun m!74819 () Bool)

(assert (=> b!75311 m!74819))

(declare-fun m!74821 () Bool)

(assert (=> d!17885 m!74821))

(assert (=> d!17885 m!74529))

(declare-fun m!74823 () Bool)

(assert (=> bm!6716 m!74823))

(assert (=> b!75314 m!74669))

(assert (=> b!75314 m!74669))

(assert (=> b!75314 m!74675))

(assert (=> b!75316 m!74823))

(assert (=> b!74919 d!17885))

(declare-fun d!17887 () Bool)

(assert (=> d!17887 (= (+!95 (+!95 lt!33762 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (+!95 (+!95 lt!33762 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))

(declare-fun lt!34039 () Unit!2157)

(declare-fun choose!432 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64) V!2953) Unit!2157)

(assert (=> d!17887 (= lt!34039 (choose!432 lt!33762 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))

(assert (=> d!17887 (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17887 (= (addCommutativeForDiffKeys!15 lt!33762 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) lt!34039)))

(declare-fun bs!3243 () Bool)

(assert (= bs!3243 d!17887))

(declare-fun m!74825 () Bool)

(assert (=> bs!3243 m!74825))

(declare-fun m!74827 () Bool)

(assert (=> bs!3243 m!74827))

(assert (=> bs!3243 m!74825))

(declare-fun m!74829 () Bool)

(assert (=> bs!3243 m!74829))

(declare-fun m!74831 () Bool)

(assert (=> bs!3243 m!74831))

(assert (=> bs!3243 m!74829))

(assert (=> bs!3243 m!74477))

(declare-fun m!74833 () Bool)

(assert (=> bs!3243 m!74833))

(assert (=> b!74919 d!17887))

(declare-fun d!17889 () Bool)

(declare-fun e!49208 () Bool)

(assert (=> d!17889 e!49208))

(declare-fun res!39727 () Bool)

(assert (=> d!17889 (=> (not res!39727) (not e!49208))))

(declare-fun lt!34043 () ListLongMap!1407)

(assert (=> d!17889 (= res!39727 (contains!723 lt!34043 (_1!1075 lt!33758)))))

(declare-fun lt!34041 () List!1478)

(assert (=> d!17889 (= lt!34043 (ListLongMap!1408 lt!34041))))

(declare-fun lt!34040 () Unit!2157)

(declare-fun lt!34042 () Unit!2157)

(assert (=> d!17889 (= lt!34040 lt!34042)))

(assert (=> d!17889 (= (getValueByKey!135 lt!34041 (_1!1075 lt!33758)) (Some!140 (_2!1075 lt!33758)))))

(assert (=> d!17889 (= lt!34042 (lemmaContainsTupThenGetReturnValue!52 lt!34041 (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(assert (=> d!17889 (= lt!34041 (insertStrictlySorted!55 (toList!719 lt!33762) (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(assert (=> d!17889 (= (+!95 lt!33762 lt!33758) lt!34043)))

(declare-fun b!75319 () Bool)

(declare-fun res!39726 () Bool)

(assert (=> b!75319 (=> (not res!39726) (not e!49208))))

(assert (=> b!75319 (= res!39726 (= (getValueByKey!135 (toList!719 lt!34043) (_1!1075 lt!33758)) (Some!140 (_2!1075 lt!33758))))))

(declare-fun b!75320 () Bool)

(assert (=> b!75320 (= e!49208 (contains!724 (toList!719 lt!34043) lt!33758))))

(assert (= (and d!17889 res!39727) b!75319))

(assert (= (and b!75319 res!39726) b!75320))

(declare-fun m!74835 () Bool)

(assert (=> d!17889 m!74835))

(declare-fun m!74837 () Bool)

(assert (=> d!17889 m!74837))

(declare-fun m!74839 () Bool)

(assert (=> d!17889 m!74839))

(declare-fun m!74841 () Bool)

(assert (=> d!17889 m!74841))

(declare-fun m!74843 () Bool)

(assert (=> b!75319 m!74843))

(declare-fun m!74845 () Bool)

(assert (=> b!75320 m!74845))

(assert (=> b!74919 d!17889))

(declare-fun d!17891 () Bool)

(declare-fun e!49209 () Bool)

(assert (=> d!17891 e!49209))

(declare-fun res!39729 () Bool)

(assert (=> d!17891 (=> (not res!39729) (not e!49209))))

(declare-fun lt!34047 () ListLongMap!1407)

(assert (=> d!17891 (= res!39729 (contains!723 lt!34047 (_1!1075 lt!33758)))))

(declare-fun lt!34045 () List!1478)

(assert (=> d!17891 (= lt!34047 (ListLongMap!1408 lt!34045))))

(declare-fun lt!34044 () Unit!2157)

(declare-fun lt!34046 () Unit!2157)

(assert (=> d!17891 (= lt!34044 lt!34046)))

(assert (=> d!17891 (= (getValueByKey!135 lt!34045 (_1!1075 lt!33758)) (Some!140 (_2!1075 lt!33758)))))

(assert (=> d!17891 (= lt!34046 (lemmaContainsTupThenGetReturnValue!52 lt!34045 (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(assert (=> d!17891 (= lt!34045 (insertStrictlySorted!55 (toList!719 (+!95 lt!33762 lt!33761)) (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(assert (=> d!17891 (= (+!95 (+!95 lt!33762 lt!33761) lt!33758) lt!34047)))

(declare-fun b!75321 () Bool)

(declare-fun res!39728 () Bool)

(assert (=> b!75321 (=> (not res!39728) (not e!49209))))

(assert (=> b!75321 (= res!39728 (= (getValueByKey!135 (toList!719 lt!34047) (_1!1075 lt!33758)) (Some!140 (_2!1075 lt!33758))))))

(declare-fun b!75322 () Bool)

(assert (=> b!75322 (= e!49209 (contains!724 (toList!719 lt!34047) lt!33758))))

(assert (= (and d!17891 res!39729) b!75321))

(assert (= (and b!75321 res!39728) b!75322))

(declare-fun m!74847 () Bool)

(assert (=> d!17891 m!74847))

(declare-fun m!74849 () Bool)

(assert (=> d!17891 m!74849))

(declare-fun m!74851 () Bool)

(assert (=> d!17891 m!74851))

(declare-fun m!74853 () Bool)

(assert (=> d!17891 m!74853))

(declare-fun m!74855 () Bool)

(assert (=> b!75321 m!74855))

(declare-fun m!74857 () Bool)

(assert (=> b!75322 m!74857))

(assert (=> b!74919 d!17891))

(declare-fun d!17893 () Bool)

(assert (=> d!17893 (= (validMask!0 (mask!6210 (v!2548 (underlying!265 thiss!992)))) (and (or (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000001111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000011111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000001111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000011111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000001111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000011111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000001111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000011111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000000111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000001111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000011111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000000111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000001111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000011111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000000111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000001111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000011111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000000111111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000001111111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000011111111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00000111111111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00001111111111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00011111111111111111111111111111) (= (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6210 (v!2548 (underlying!265 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!74919 d!17893))

(declare-fun bm!6719 () Bool)

(declare-fun call!6722 () Bool)

(assert (=> bm!6719 (= call!6722 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75332 () Bool)

(declare-fun e!49216 () Bool)

(declare-fun e!49217 () Bool)

(assert (=> b!75332 (= e!49216 e!49217)))

(declare-fun lt!34055 () (_ BitVec 64))

(assert (=> b!75332 (= lt!34055 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!34054 () Unit!2157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3891 (_ BitVec 64) (_ BitVec 32)) Unit!2157)

(assert (=> b!75332 (= lt!34054 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34055 #b00000000000000000000000000000000))))

(assert (=> b!75332 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34055 #b00000000000000000000000000000000)))

(declare-fun lt!34056 () Unit!2157)

(assert (=> b!75332 (= lt!34056 lt!34054)))

(declare-fun res!39735 () Bool)

(assert (=> b!75332 (= res!39735 (= (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))) (Found!231 #b00000000000000000000000000000000)))))

(assert (=> b!75332 (=> (not res!39735) (not e!49217))))

(declare-fun b!75333 () Bool)

(assert (=> b!75333 (= e!49217 call!6722)))

(declare-fun b!75334 () Bool)

(assert (=> b!75334 (= e!49216 call!6722)))

(declare-fun b!75331 () Bool)

(declare-fun e!49218 () Bool)

(assert (=> b!75331 (= e!49218 e!49216)))

(declare-fun c!11419 () Bool)

(assert (=> b!75331 (= c!11419 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!17895 () Bool)

(declare-fun res!39734 () Bool)

(assert (=> d!17895 (=> res!39734 e!49218)))

(assert (=> d!17895 (= res!39734 (bvsge #b00000000000000000000000000000000 (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> d!17895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))) e!49218)))

(assert (= (and d!17895 (not res!39734)) b!75331))

(assert (= (and b!75331 c!11419) b!75332))

(assert (= (and b!75331 (not c!11419)) b!75334))

(assert (= (and b!75332 res!39735) b!75333))

(assert (= (or b!75333 b!75334) bm!6719))

(declare-fun m!74859 () Bool)

(assert (=> bm!6719 m!74859))

(declare-fun m!74861 () Bool)

(assert (=> b!75332 m!74861))

(declare-fun m!74863 () Bool)

(assert (=> b!75332 m!74863))

(declare-fun m!74865 () Bool)

(assert (=> b!75332 m!74865))

(assert (=> b!75332 m!74861))

(declare-fun m!74867 () Bool)

(assert (=> b!75332 m!74867))

(assert (=> b!75331 m!74861))

(assert (=> b!75331 m!74861))

(declare-fun m!74869 () Bool)

(assert (=> b!75331 m!74869))

(assert (=> b!74916 d!17895))

(declare-fun d!17897 () Bool)

(assert (=> d!17897 (not (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!34059 () Unit!2157)

(declare-fun choose!68 (array!3891 (_ BitVec 32) (_ BitVec 64) List!1479) Unit!2157)

(assert (=> d!17897 (= lt!34059 (choose!68 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476)))))

(assert (=> d!17897 (bvslt (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!17897 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476)) lt!34059)))

(declare-fun bs!3244 () Bool)

(assert (= bs!3244 d!17897))

(assert (=> bs!3244 m!74477))

(assert (=> bs!3244 m!74509))

(assert (=> bs!3244 m!74477))

(declare-fun m!74871 () Bool)

(assert (=> bs!3244 m!74871))

(assert (=> b!74928 d!17897))

(declare-fun d!17899 () Bool)

(assert (=> d!17899 (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) from!355 Nil!1476)))

(declare-fun lt!34062 () Unit!2157)

(declare-fun choose!39 (array!3891 (_ BitVec 32) (_ BitVec 32)) Unit!2157)

(assert (=> d!17899 (= lt!34062 (choose!39 (_keys!3889 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!17899 (bvslt (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!17899 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000 from!355) lt!34062)))

(declare-fun bs!3245 () Bool)

(assert (= bs!3245 d!17899))

(assert (=> bs!3245 m!74505))

(declare-fun m!74873 () Bool)

(assert (=> bs!3245 m!74873))

(assert (=> b!74928 d!17899))

(declare-fun d!17901 () Bool)

(declare-fun res!39740 () Bool)

(declare-fun e!49223 () Bool)

(assert (=> d!17901 (=> res!39740 e!49223)))

(assert (=> d!17901 (= res!39740 (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> d!17901 (= (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!49223)))

(declare-fun b!75339 () Bool)

(declare-fun e!49224 () Bool)

(assert (=> b!75339 (= e!49223 e!49224)))

(declare-fun res!39741 () Bool)

(assert (=> b!75339 (=> (not res!39741) (not e!49224))))

(assert (=> b!75339 (= res!39741 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75340 () Bool)

(assert (=> b!75340 (= e!49224 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!17901 (not res!39740)) b!75339))

(assert (= (and b!75339 res!39741) b!75340))

(assert (=> d!17901 m!74669))

(assert (=> b!75340 m!74477))

(declare-fun m!74875 () Bool)

(assert (=> b!75340 m!74875))

(assert (=> b!74928 d!17901))

(declare-fun d!17903 () Bool)

(declare-fun e!49227 () Bool)

(assert (=> d!17903 e!49227))

(declare-fun c!11422 () Bool)

(assert (=> d!17903 (= c!11422 (and (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!34065 () Unit!2157)

(declare-fun choose!433 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) (_ BitVec 32) Int) Unit!2157)

(assert (=> d!17903 (= lt!34065 (choose!433 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(assert (=> d!17903 (validMask!0 (mask!6210 (v!2548 (underlying!265 thiss!992))))))

(assert (=> d!17903 (= (lemmaListMapContainsThenArrayContainsFrom!46 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))) lt!34065)))

(declare-fun b!75345 () Bool)

(assert (=> b!75345 (= e!49227 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!75346 () Bool)

(assert (=> b!75346 (= e!49227 (ite (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!17903 c!11422) b!75345))

(assert (= (and d!17903 (not c!11422)) b!75346))

(assert (=> d!17903 m!74477))

(declare-fun m!74877 () Bool)

(assert (=> d!17903 m!74877))

(assert (=> d!17903 m!74529))

(assert (=> b!75345 m!74477))

(assert (=> b!75345 m!74509))

(assert (=> b!74928 d!17903))

(declare-fun b!75357 () Bool)

(declare-fun e!49236 () Bool)

(declare-fun call!6725 () Bool)

(assert (=> b!75357 (= e!49236 call!6725)))

(declare-fun d!17905 () Bool)

(declare-fun res!39749 () Bool)

(declare-fun e!49238 () Bool)

(assert (=> d!17905 (=> res!39749 e!49238)))

(assert (=> d!17905 (= res!39749 (bvsge from!355 (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> d!17905 (= (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) from!355 Nil!1476) e!49238)))

(declare-fun b!75358 () Bool)

(assert (=> b!75358 (= e!49236 call!6725)))

(declare-fun b!75359 () Bool)

(declare-fun e!49239 () Bool)

(declare-fun contains!725 (List!1479 (_ BitVec 64)) Bool)

(assert (=> b!75359 (= e!49239 (contains!725 Nil!1476 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun bm!6722 () Bool)

(declare-fun c!11425 () Bool)

(assert (=> bm!6722 (= call!6725 (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11425 (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476) Nil!1476)))))

(declare-fun b!75360 () Bool)

(declare-fun e!49237 () Bool)

(assert (=> b!75360 (= e!49238 e!49237)))

(declare-fun res!39750 () Bool)

(assert (=> b!75360 (=> (not res!39750) (not e!49237))))

(assert (=> b!75360 (= res!39750 (not e!49239))))

(declare-fun res!39748 () Bool)

(assert (=> b!75360 (=> (not res!39748) (not e!49239))))

(assert (=> b!75360 (= res!39748 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75361 () Bool)

(assert (=> b!75361 (= e!49237 e!49236)))

(assert (=> b!75361 (= c!11425 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (= (and d!17905 (not res!39749)) b!75360))

(assert (= (and b!75360 res!39748) b!75359))

(assert (= (and b!75360 res!39750) b!75361))

(assert (= (and b!75361 c!11425) b!75357))

(assert (= (and b!75361 (not c!11425)) b!75358))

(assert (= (or b!75357 b!75358) bm!6722))

(assert (=> b!75359 m!74477))

(assert (=> b!75359 m!74477))

(declare-fun m!74879 () Bool)

(assert (=> b!75359 m!74879))

(assert (=> bm!6722 m!74477))

(declare-fun m!74881 () Bool)

(assert (=> bm!6722 m!74881))

(assert (=> b!75360 m!74477))

(assert (=> b!75360 m!74477))

(declare-fun m!74883 () Bool)

(assert (=> b!75360 m!74883))

(assert (=> b!75361 m!74477))

(assert (=> b!75361 m!74477))

(assert (=> b!75361 m!74883))

(assert (=> b!74928 d!17905))

(declare-fun d!17907 () Bool)

(assert (=> d!17907 (= (valid!310 thiss!992) (valid!309 (v!2548 (underlying!265 thiss!992))))))

(declare-fun bs!3246 () Bool)

(assert (= bs!3246 d!17907))

(declare-fun m!74885 () Bool)

(assert (=> bs!3246 m!74885))

(assert (=> start!9918 d!17907))

(declare-fun condMapEmpty!3207 () Bool)

(declare-fun mapDefault!3207 () ValueCell!896)

(assert (=> mapNonEmpty!3191 (= condMapEmpty!3207 (= mapRest!3191 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3207)))))

(declare-fun e!49245 () Bool)

(declare-fun mapRes!3207 () Bool)

(assert (=> mapNonEmpty!3191 (= tp!8561 (and e!49245 mapRes!3207))))

(declare-fun mapNonEmpty!3207 () Bool)

(declare-fun tp!8589 () Bool)

(declare-fun e!49244 () Bool)

(assert (=> mapNonEmpty!3207 (= mapRes!3207 (and tp!8589 e!49244))))

(declare-fun mapValue!3207 () ValueCell!896)

(declare-fun mapKey!3207 () (_ BitVec 32))

(declare-fun mapRest!3207 () (Array (_ BitVec 32) ValueCell!896))

(assert (=> mapNonEmpty!3207 (= mapRest!3191 (store mapRest!3207 mapKey!3207 mapValue!3207))))

(declare-fun b!75369 () Bool)

(assert (=> b!75369 (= e!49245 tp_is_empty!2479)))

(declare-fun b!75368 () Bool)

(assert (=> b!75368 (= e!49244 tp_is_empty!2479)))

(declare-fun mapIsEmpty!3207 () Bool)

(assert (=> mapIsEmpty!3207 mapRes!3207))

(assert (= (and mapNonEmpty!3191 condMapEmpty!3207) mapIsEmpty!3207))

(assert (= (and mapNonEmpty!3191 (not condMapEmpty!3207)) mapNonEmpty!3207))

(assert (= (and mapNonEmpty!3207 ((_ is ValueCellFull!896) mapValue!3207)) b!75368))

(assert (= (and mapNonEmpty!3191 ((_ is ValueCellFull!896) mapDefault!3207)) b!75369))

(declare-fun m!74887 () Bool)

(assert (=> mapNonEmpty!3207 m!74887))

(declare-fun condMapEmpty!3208 () Bool)

(declare-fun mapDefault!3208 () ValueCell!896)

(assert (=> mapNonEmpty!3192 (= condMapEmpty!3208 (= mapRest!3192 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3208)))))

(declare-fun e!49247 () Bool)

(declare-fun mapRes!3208 () Bool)

(assert (=> mapNonEmpty!3192 (= tp!8560 (and e!49247 mapRes!3208))))

(declare-fun mapNonEmpty!3208 () Bool)

(declare-fun tp!8590 () Bool)

(declare-fun e!49246 () Bool)

(assert (=> mapNonEmpty!3208 (= mapRes!3208 (and tp!8590 e!49246))))

(declare-fun mapValue!3208 () ValueCell!896)

(declare-fun mapKey!3208 () (_ BitVec 32))

(declare-fun mapRest!3208 () (Array (_ BitVec 32) ValueCell!896))

(assert (=> mapNonEmpty!3208 (= mapRest!3192 (store mapRest!3208 mapKey!3208 mapValue!3208))))

(declare-fun b!75371 () Bool)

(assert (=> b!75371 (= e!49247 tp_is_empty!2479)))

(declare-fun b!75370 () Bool)

(assert (=> b!75370 (= e!49246 tp_is_empty!2479)))

(declare-fun mapIsEmpty!3208 () Bool)

(assert (=> mapIsEmpty!3208 mapRes!3208))

(assert (= (and mapNonEmpty!3192 condMapEmpty!3208) mapIsEmpty!3208))

(assert (= (and mapNonEmpty!3192 (not condMapEmpty!3208)) mapNonEmpty!3208))

(assert (= (and mapNonEmpty!3208 ((_ is ValueCellFull!896) mapValue!3208)) b!75370))

(assert (= (and mapNonEmpty!3192 ((_ is ValueCellFull!896) mapDefault!3208)) b!75371))

(declare-fun m!74889 () Bool)

(assert (=> mapNonEmpty!3208 m!74889))

(declare-fun b_lambda!3391 () Bool)

(assert (= b_lambda!3385 (or (and b!74909 b_free!2125) (and b!74910 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))) b_lambda!3391)))

(declare-fun b_lambda!3393 () Bool)

(assert (= b_lambda!3387 (or (and b!74909 b_free!2125) (and b!74910 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))) b_lambda!3393)))

(declare-fun b_lambda!3395 () Bool)

(assert (= b_lambda!3389 (or (and b!74909 b_free!2125) (and b!74910 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))) b_lambda!3395)))

(check-sat (not b_lambda!3391) (not b!75274) (not b!75311) (not b!75360) (not bm!6690) b_and!4619 (not b!75309) (not mapNonEmpty!3207) (not d!17883) (not bm!6691) (not b!75235) (not bm!6693) (not b!75361) (not b!75321) (not b!75279) (not b!75345) (not b!75331) (not d!17889) (not b!75134) (not b!75076) (not b!75074) (not d!17873) (not d!17881) (not b!75332) (not b!75247) (not b_next!2125) (not bm!6708) tp_is_empty!2479 (not mapNonEmpty!3208) (not d!17867) (not d!17871) (not bm!6707) (not b!75066) (not b!75135) (not b!75316) (not bm!6696) (not d!17891) (not b!75123) (not d!17875) (not bm!6703) (not bm!6695) (not b!75319) (not d!17907) (not bm!6640) (not d!17903) (not b!75119) (not b!75318) (not b!75359) (not d!17885) (not b!75282) (not b!75308) (not d!17887) (not b!75128) (not bm!6705) b_and!4617 (not b!75259) (not b!75255) (not bm!6719) (not bm!6716) (not b!75314) (not d!17869) (not b_lambda!3383) (not b!75148) (not b!75127) (not d!17899) (not b!75075) (not bm!6694) (not bm!6636) (not b!75146) (not bm!6641) (not b_next!2127) (not b!75270) (not b!75322) (not b_lambda!3395) (not b!75139) (not b!75281) (not b!75126) (not b_lambda!3393) (not b!75313) (not bm!6709) (not b!75241) (not d!17897) (not bm!6722) (not b!75320) (not b!75067) (not b!75280) (not b!75317) (not b!75256) (not bm!6699) (not bm!6638) (not b!75340))
(check-sat b_and!4617 b_and!4619 (not b_next!2125) (not b_next!2127))
(get-model)

(declare-fun call!6735 () Bool)

(declare-fun bm!6731 () Bool)

(assert (=> bm!6731 (= call!6735 (arrayContainsKey!0 (_keys!3889 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!75406 () Bool)

(declare-fun e!49270 () Unit!2157)

(declare-fun Unit!2165 () Unit!2157)

(assert (=> b!75406 (= e!49270 Unit!2165)))

(declare-fun lt!34132 () Unit!2157)

(declare-fun lemmaArrayContainsKeyThenInListMap!14 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) (_ BitVec 32) Int) Unit!2157)

(assert (=> b!75406 (= lt!34132 (lemmaArrayContainsKeyThenInListMap!14 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(assert (=> b!75406 (contains!723 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))

(declare-fun lt!34138 () Unit!2157)

(assert (=> b!75406 (= lt!34138 lt!34132)))

(assert (=> b!75406 false))

(declare-fun b!75407 () Bool)

(declare-fun e!49268 () Bool)

(assert (=> b!75407 (= e!49268 (not call!6735))))

(declare-fun b!75408 () Bool)

(declare-fun c!11435 () Bool)

(declare-fun lt!34141 () SeekEntryResult!231)

(assert (=> b!75408 (= c!11435 ((_ is MissingVacant!231) lt!34141))))

(declare-fun e!49271 () Bool)

(declare-fun e!49265 () Bool)

(assert (=> b!75408 (= e!49271 e!49265)))

(declare-fun b!75409 () Bool)

(declare-fun lt!34126 () tuple2!2130)

(declare-fun e!49267 () Bool)

(assert (=> b!75409 (= e!49267 (= (map!1164 (_2!1076 lt!34126)) (+!95 (map!1164 newMap!16) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(declare-fun b!75410 () Bool)

(assert (=> b!75410 (= e!49265 ((_ is Undefined!231) lt!34141))))

(declare-fun b!75411 () Bool)

(declare-fun res!39775 () Bool)

(assert (=> b!75411 (=> (not res!39775) (not e!49267))))

(assert (=> b!75411 (= res!39775 (contains!723 (map!1164 (_2!1076 lt!34126)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75412 () Bool)

(declare-fun Unit!2166 () Unit!2157)

(assert (=> b!75412 (= e!49270 Unit!2166)))

(declare-fun d!17909 () Bool)

(assert (=> d!17909 e!49267))

(declare-fun res!39771 () Bool)

(assert (=> d!17909 (=> (not res!39771) (not e!49267))))

(assert (=> d!17909 (= res!39771 (_1!1076 lt!34126))))

(assert (=> d!17909 (= lt!34126 (tuple2!2131 true (LongMapFixedSize!701 (defaultEntry!2233 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (bvadd (_size!399 newMap!16) #b00000000000000000000000000000001) (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16))) (_vacant!399 newMap!16))))))

(declare-fun lt!34139 () Unit!2157)

(declare-fun lt!34154 () Unit!2157)

(assert (=> d!17909 (= lt!34139 lt!34154)))

(declare-fun lt!34128 () array!3891)

(declare-fun lt!34145 () array!3893)

(assert (=> d!17909 (contains!723 (getCurrentListMap!416 lt!34128 lt!34145 (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994))))))

(assert (=> d!17909 (= lt!34154 (lemmaValidKeyInArrayIsInListMap!85 lt!34128 lt!34145 (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (defaultEntry!2233 newMap!16)))))

(assert (=> d!17909 (= lt!34145 (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16))))))

(assert (=> d!17909 (= lt!34128 (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))))))

(declare-fun lt!34131 () Unit!2157)

(declare-fun lt!34155 () Unit!2157)

(assert (=> d!17909 (= lt!34131 lt!34155)))

(declare-fun lt!34142 () array!3891)

(assert (=> d!17909 (= (arrayCountValidKeys!0 lt!34142 (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (bvadd (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3891 (_ BitVec 32)) Unit!2157)

(assert (=> d!17909 (= lt!34155 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!34142 (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994))))))

(assert (=> d!17909 (= lt!34142 (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))))))

(declare-fun lt!34135 () Unit!2157)

(declare-fun lt!34140 () Unit!2157)

(assert (=> d!17909 (= lt!34135 lt!34140)))

(declare-fun lt!34153 () array!3891)

(assert (=> d!17909 (arrayContainsKey!0 lt!34153 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!17909 (= lt!34140 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!34153 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994))))))

(assert (=> d!17909 (= lt!34153 (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))))))

(declare-fun lt!34146 () Unit!2157)

(declare-fun lt!34144 () Unit!2157)

(assert (=> d!17909 (= lt!34146 lt!34144)))

(assert (=> d!17909 (= (+!95 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (getCurrentListMap!416 (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16))) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!14 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) (_ BitVec 64) V!2953 Int) Unit!2157)

(assert (=> d!17909 (= lt!34144 (lemmaAddValidKeyToArrayThenAddPairToListMap!14 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34129 () Unit!2157)

(declare-fun lt!34149 () Unit!2157)

(assert (=> d!17909 (= lt!34129 lt!34149)))

(assert (=> d!17909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))) (mask!6210 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3891 (_ BitVec 32) (_ BitVec 32)) Unit!2157)

(assert (=> d!17909 (= lt!34149 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (mask!6210 newMap!16)))))

(declare-fun lt!34147 () Unit!2157)

(declare-fun lt!34150 () Unit!2157)

(assert (=> d!17909 (= lt!34147 lt!34150)))

(assert (=> d!17909 (= (arrayCountValidKeys!0 (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))) #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3889 newMap!16) #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3891 (_ BitVec 32) (_ BitVec 64)) Unit!2157)

(assert (=> d!17909 (= lt!34150 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3889 newMap!16) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun lt!34133 () Unit!2157)

(declare-fun lt!34137 () Unit!2157)

(assert (=> d!17909 (= lt!34133 lt!34137)))

(declare-fun lt!34152 () List!1479)

(declare-fun lt!34151 () (_ BitVec 32))

(assert (=> d!17909 (arrayNoDuplicates!0 (array!3892 (store (arr!1856 (_keys!3889 newMap!16)) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (size!2095 (_keys!3889 newMap!16))) lt!34151 lt!34152)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3891 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1479) Unit!2157)

(assert (=> d!17909 (= lt!34137 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3889 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994)) lt!34151 lt!34152))))

(assert (=> d!17909 (= lt!34152 Nil!1476)))

(assert (=> d!17909 (= lt!34151 #b00000000000000000000000000000000)))

(declare-fun lt!34130 () Unit!2157)

(assert (=> d!17909 (= lt!34130 e!49270)))

(declare-fun c!11437 () Bool)

(assert (=> d!17909 (= c!11437 (arrayContainsKey!0 (_keys!3889 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!34127 () Unit!2157)

(declare-fun e!49269 () Unit!2157)

(assert (=> d!17909 (= lt!34127 e!49269)))

(declare-fun c!11434 () Bool)

(assert (=> d!17909 (= c!11434 (contains!723 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> d!17909 (valid!309 newMap!16)))

(assert (=> d!17909 (= (updateHelperNewKey!25 newMap!16 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 (ite c!11395 (index!3059 lt!33994) (index!3056 lt!33994))) lt!34126)))

(declare-fun bm!6732 () Bool)

(declare-fun call!6736 () SeekEntryResult!231)

(assert (=> bm!6732 (= call!6736 (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(declare-fun b!75413 () Bool)

(assert (=> b!75413 (= e!49265 e!49268)))

(declare-fun res!39770 () Bool)

(declare-fun call!6734 () Bool)

(assert (=> b!75413 (= res!39770 call!6734)))

(assert (=> b!75413 (=> (not res!39770) (not e!49268))))

(declare-fun b!75414 () Bool)

(declare-fun e!49266 () Bool)

(assert (=> b!75414 (= e!49266 (not call!6735))))

(declare-fun b!75415 () Bool)

(declare-fun res!39772 () Bool)

(assert (=> b!75415 (= res!39772 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3059 lt!34141)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75415 (=> (not res!39772) (not e!49268))))

(declare-fun b!75416 () Bool)

(declare-fun res!39769 () Bool)

(assert (=> b!75416 (=> (not res!39769) (not e!49267))))

(assert (=> b!75416 (= res!39769 (valid!309 (_2!1076 lt!34126)))))

(declare-fun b!75417 () Bool)

(declare-fun res!39776 () Bool)

(assert (=> b!75417 (=> (not res!39776) (not e!49266))))

(assert (=> b!75417 (= res!39776 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3056 lt!34141)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!11436 () Bool)

(declare-fun bm!6733 () Bool)

(declare-fun call!6737 () Bool)

(declare-fun lt!34134 () SeekEntryResult!231)

(assert (=> bm!6733 (= call!6737 (inRange!0 (ite c!11434 (index!3057 lt!34134) (ite c!11436 (index!3056 lt!34141) (index!3059 lt!34141))) (mask!6210 newMap!16)))))

(declare-fun b!75418 () Bool)

(declare-fun e!49264 () Bool)

(assert (=> b!75418 (= e!49264 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!34134)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75419 () Bool)

(declare-fun lt!34136 () Unit!2157)

(assert (=> b!75419 (= e!49269 lt!34136)))

(assert (=> b!75419 (= lt!34136 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(assert (=> b!75419 (= lt!34141 call!6736)))

(assert (=> b!75419 (= c!11436 ((_ is MissingZero!231) lt!34141))))

(assert (=> b!75419 e!49271))

(declare-fun b!75420 () Bool)

(declare-fun Unit!2167 () Unit!2157)

(assert (=> b!75420 (= e!49269 Unit!2167)))

(declare-fun lt!34148 () Unit!2157)

(assert (=> b!75420 (= lt!34148 (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(assert (=> b!75420 (= lt!34134 call!6736)))

(declare-fun res!39777 () Bool)

(assert (=> b!75420 (= res!39777 ((_ is Found!231) lt!34134))))

(assert (=> b!75420 (=> (not res!39777) (not e!49264))))

(assert (=> b!75420 e!49264))

(declare-fun lt!34143 () Unit!2157)

(assert (=> b!75420 (= lt!34143 lt!34148)))

(assert (=> b!75420 false))

(declare-fun bm!6734 () Bool)

(assert (=> bm!6734 (= call!6734 call!6737)))

(declare-fun b!75421 () Bool)

(declare-fun res!39773 () Bool)

(assert (=> b!75421 (=> (not res!39773) (not e!49266))))

(assert (=> b!75421 (= res!39773 call!6734)))

(assert (=> b!75421 (= e!49271 e!49266)))

(declare-fun b!75422 () Bool)

(declare-fun res!39774 () Bool)

(assert (=> b!75422 (= res!39774 call!6737)))

(assert (=> b!75422 (=> (not res!39774) (not e!49264))))

(assert (= (and d!17909 c!11434) b!75420))

(assert (= (and d!17909 (not c!11434)) b!75419))

(assert (= (and b!75420 res!39777) b!75422))

(assert (= (and b!75422 res!39774) b!75418))

(assert (= (and b!75419 c!11436) b!75421))

(assert (= (and b!75419 (not c!11436)) b!75408))

(assert (= (and b!75421 res!39773) b!75417))

(assert (= (and b!75417 res!39776) b!75414))

(assert (= (and b!75408 c!11435) b!75413))

(assert (= (and b!75408 (not c!11435)) b!75410))

(assert (= (and b!75413 res!39770) b!75415))

(assert (= (and b!75415 res!39772) b!75407))

(assert (= (or b!75421 b!75413) bm!6734))

(assert (= (or b!75414 b!75407) bm!6731))

(assert (= (or b!75422 bm!6734) bm!6733))

(assert (= (or b!75420 b!75419) bm!6732))

(assert (= (and d!17909 c!11437) b!75406))

(assert (= (and d!17909 (not c!11437)) b!75412))

(assert (= (and d!17909 res!39771) b!75416))

(assert (= (and b!75416 res!39769) b!75411))

(assert (= (and b!75411 res!39775) b!75409))

(assert (=> bm!6732 m!74477))

(assert (=> bm!6732 m!74753))

(assert (=> b!75406 m!74477))

(declare-fun m!74891 () Bool)

(assert (=> b!75406 m!74891))

(assert (=> b!75406 m!74663))

(assert (=> b!75406 m!74663))

(assert (=> b!75406 m!74477))

(declare-fun m!74893 () Bool)

(assert (=> b!75406 m!74893))

(assert (=> b!75419 m!74477))

(assert (=> b!75419 m!74741))

(declare-fun m!74895 () Bool)

(assert (=> b!75415 m!74895))

(declare-fun m!74897 () Bool)

(assert (=> b!75416 m!74897))

(declare-fun m!74899 () Bool)

(assert (=> bm!6733 m!74899))

(declare-fun m!74901 () Bool)

(assert (=> b!75417 m!74901))

(declare-fun m!74903 () Bool)

(assert (=> b!75411 m!74903))

(assert (=> b!75411 m!74903))

(assert (=> b!75411 m!74477))

(declare-fun m!74905 () Bool)

(assert (=> b!75411 m!74905))

(declare-fun m!74907 () Bool)

(assert (=> b!75418 m!74907))

(assert (=> b!75409 m!74903))

(assert (=> b!75409 m!74493))

(assert (=> b!75409 m!74493))

(declare-fun m!74909 () Bool)

(assert (=> b!75409 m!74909))

(assert (=> b!75420 m!74477))

(assert (=> b!75420 m!74761))

(declare-fun m!74911 () Bool)

(assert (=> d!17909 m!74911))

(assert (=> d!17909 m!74477))

(declare-fun m!74913 () Bool)

(assert (=> d!17909 m!74913))

(assert (=> d!17909 m!74663))

(assert (=> d!17909 m!74477))

(assert (=> d!17909 m!74893))

(declare-fun m!74915 () Bool)

(assert (=> d!17909 m!74915))

(declare-fun m!74917 () Bool)

(assert (=> d!17909 m!74917))

(assert (=> d!17909 m!74477))

(declare-fun m!74919 () Bool)

(assert (=> d!17909 m!74919))

(assert (=> d!17909 m!74911))

(declare-fun m!74921 () Bool)

(assert (=> d!17909 m!74921))

(declare-fun m!74923 () Bool)

(assert (=> d!17909 m!74923))

(declare-fun m!74925 () Bool)

(assert (=> d!17909 m!74925))

(assert (=> d!17909 m!74663))

(declare-fun m!74927 () Bool)

(assert (=> d!17909 m!74927))

(assert (=> d!17909 m!74657))

(assert (=> d!17909 m!74477))

(declare-fun m!74929 () Bool)

(assert (=> d!17909 m!74929))

(assert (=> d!17909 m!74497))

(declare-fun m!74931 () Bool)

(assert (=> d!17909 m!74931))

(declare-fun m!74933 () Bool)

(assert (=> d!17909 m!74933))

(assert (=> d!17909 m!74477))

(declare-fun m!74935 () Bool)

(assert (=> d!17909 m!74935))

(assert (=> d!17909 m!74477))

(assert (=> d!17909 m!74731))

(assert (=> d!17909 m!74477))

(declare-fun m!74937 () Bool)

(assert (=> d!17909 m!74937))

(assert (=> d!17909 m!74663))

(declare-fun m!74939 () Bool)

(assert (=> d!17909 m!74939))

(assert (=> d!17909 m!74921))

(assert (=> d!17909 m!74477))

(declare-fun m!74941 () Bool)

(assert (=> d!17909 m!74941))

(declare-fun m!74943 () Bool)

(assert (=> d!17909 m!74943))

(declare-fun m!74945 () Bool)

(assert (=> d!17909 m!74945))

(declare-fun m!74947 () Bool)

(assert (=> d!17909 m!74947))

(assert (=> bm!6731 m!74477))

(assert (=> bm!6731 m!74731))

(assert (=> bm!6699 d!17909))

(declare-fun d!17911 () Bool)

(declare-fun e!49272 () Bool)

(assert (=> d!17911 e!49272))

(declare-fun res!39778 () Bool)

(assert (=> d!17911 (=> res!39778 e!49272)))

(declare-fun lt!34157 () Bool)

(assert (=> d!17911 (= res!39778 (not lt!34157))))

(declare-fun lt!34159 () Bool)

(assert (=> d!17911 (= lt!34157 lt!34159)))

(declare-fun lt!34158 () Unit!2157)

(declare-fun e!49273 () Unit!2157)

(assert (=> d!17911 (= lt!34158 e!49273)))

(declare-fun c!11438 () Bool)

(assert (=> d!17911 (= c!11438 lt!34159)))

(assert (=> d!17911 (= lt!34159 (containsKey!138 (toList!719 lt!34030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17911 (= (contains!723 lt!34030 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34157)))

(declare-fun b!75423 () Bool)

(declare-fun lt!34156 () Unit!2157)

(assert (=> b!75423 (= e!49273 lt!34156)))

(assert (=> b!75423 (= lt!34156 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!34030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75423 (isDefined!87 (getValueByKey!135 (toList!719 lt!34030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75424 () Bool)

(declare-fun Unit!2168 () Unit!2157)

(assert (=> b!75424 (= e!49273 Unit!2168)))

(declare-fun b!75425 () Bool)

(assert (=> b!75425 (= e!49272 (isDefined!87 (getValueByKey!135 (toList!719 lt!34030) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17911 c!11438) b!75423))

(assert (= (and d!17911 (not c!11438)) b!75424))

(assert (= (and d!17911 (not res!39778)) b!75425))

(declare-fun m!74949 () Bool)

(assert (=> d!17911 m!74949))

(declare-fun m!74951 () Bool)

(assert (=> b!75423 m!74951))

(declare-fun m!74953 () Bool)

(assert (=> b!75423 m!74953))

(assert (=> b!75423 m!74953))

(declare-fun m!74955 () Bool)

(assert (=> b!75423 m!74955))

(assert (=> b!75425 m!74953))

(assert (=> b!75425 m!74953))

(assert (=> b!75425 m!74955))

(assert (=> d!17885 d!17911))

(assert (=> d!17885 d!17893))

(declare-fun d!17913 () Bool)

(declare-fun e!49274 () Bool)

(assert (=> d!17913 e!49274))

(declare-fun res!39779 () Bool)

(assert (=> d!17913 (=> res!39779 e!49274)))

(declare-fun lt!34161 () Bool)

(assert (=> d!17913 (= res!39779 (not lt!34161))))

(declare-fun lt!34163 () Bool)

(assert (=> d!17913 (= lt!34161 lt!34163)))

(declare-fun lt!34162 () Unit!2157)

(declare-fun e!49275 () Unit!2157)

(assert (=> d!17913 (= lt!34162 e!49275)))

(declare-fun c!11439 () Bool)

(assert (=> d!17913 (= c!11439 lt!34163)))

(assert (=> d!17913 (= lt!34163 (containsKey!138 (toList!719 call!6693) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> d!17913 (= (contains!723 call!6693 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) lt!34161)))

(declare-fun b!75426 () Bool)

(declare-fun lt!34160 () Unit!2157)

(assert (=> b!75426 (= e!49275 lt!34160)))

(assert (=> b!75426 (= lt!34160 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 call!6693) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> b!75426 (isDefined!87 (getValueByKey!135 (toList!719 call!6693) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75427 () Bool)

(declare-fun Unit!2169 () Unit!2157)

(assert (=> b!75427 (= e!49275 Unit!2169)))

(declare-fun b!75428 () Bool)

(assert (=> b!75428 (= e!49274 (isDefined!87 (getValueByKey!135 (toList!719 call!6693) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))))

(assert (= (and d!17913 c!11439) b!75426))

(assert (= (and d!17913 (not c!11439)) b!75427))

(assert (= (and d!17913 (not res!39779)) b!75428))

(assert (=> d!17913 m!74477))

(declare-fun m!74957 () Bool)

(assert (=> d!17913 m!74957))

(assert (=> b!75426 m!74477))

(declare-fun m!74959 () Bool)

(assert (=> b!75426 m!74959))

(assert (=> b!75426 m!74477))

(declare-fun m!74961 () Bool)

(assert (=> b!75426 m!74961))

(assert (=> b!75426 m!74961))

(declare-fun m!74963 () Bool)

(assert (=> b!75426 m!74963))

(assert (=> b!75428 m!74477))

(assert (=> b!75428 m!74961))

(assert (=> b!75428 m!74961))

(assert (=> b!75428 m!74963))

(assert (=> b!75274 d!17913))

(declare-fun d!17915 () Bool)

(declare-fun get!1159 (Option!141) V!2953)

(assert (=> d!17915 (= (apply!76 lt!33886 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1159 (getValueByKey!135 (toList!719 lt!33886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3247 () Bool)

(assert (= bs!3247 d!17915))

(declare-fun m!74965 () Bool)

(assert (=> bs!3247 m!74965))

(assert (=> bs!3247 m!74965))

(declare-fun m!74967 () Bool)

(assert (=> bs!3247 m!74967))

(assert (=> b!75123 d!17915))

(declare-fun d!17917 () Bool)

(assert (=> d!17917 (= (apply!76 lt!34030 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1159 (getValueByKey!135 (toList!719 lt!34030) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3248 () Bool)

(assert (= bs!3248 d!17917))

(assert (=> bs!3248 m!74669))

(declare-fun m!74969 () Bool)

(assert (=> bs!3248 m!74969))

(assert (=> bs!3248 m!74969))

(declare-fun m!74971 () Bool)

(assert (=> bs!3248 m!74971))

(assert (=> b!75309 d!17917))

(declare-fun d!17919 () Bool)

(declare-fun c!11440 () Bool)

(assert (=> d!17919 (= c!11440 ((_ is ValueCellFull!896) (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!49276 () V!2953)

(assert (=> d!17919 (= (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!49276)))

(declare-fun b!75429 () Bool)

(assert (=> b!75429 (= e!49276 (get!1157 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75430 () Bool)

(assert (=> b!75430 (= e!49276 (get!1158 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17919 c!11440) b!75429))

(assert (= (and d!17919 (not c!11440)) b!75430))

(assert (=> b!75429 m!74677))

(assert (=> b!75429 m!74481))

(declare-fun m!74973 () Bool)

(assert (=> b!75429 m!74973))

(assert (=> b!75430 m!74677))

(assert (=> b!75430 m!74481))

(declare-fun m!74975 () Bool)

(assert (=> b!75430 m!74975))

(assert (=> b!75309 d!17919))

(declare-fun d!17921 () Bool)

(declare-fun e!49277 () Bool)

(assert (=> d!17921 e!49277))

(declare-fun res!39780 () Bool)

(assert (=> d!17921 (=> res!39780 e!49277)))

(declare-fun lt!34165 () Bool)

(assert (=> d!17921 (= res!39780 (not lt!34165))))

(declare-fun lt!34167 () Bool)

(assert (=> d!17921 (= lt!34165 lt!34167)))

(declare-fun lt!34166 () Unit!2157)

(declare-fun e!49278 () Unit!2157)

(assert (=> d!17921 (= lt!34166 e!49278)))

(declare-fun c!11441 () Bool)

(assert (=> d!17921 (= c!11441 lt!34167)))

(assert (=> d!17921 (= lt!34167 (containsKey!138 (toList!719 e!49173) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> d!17921 (= (contains!723 e!49173 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) lt!34165)))

(declare-fun b!75431 () Bool)

(declare-fun lt!34164 () Unit!2157)

(assert (=> b!75431 (= e!49278 lt!34164)))

(assert (=> b!75431 (= lt!34164 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 e!49173) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> b!75431 (isDefined!87 (getValueByKey!135 (toList!719 e!49173) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75432 () Bool)

(declare-fun Unit!2170 () Unit!2157)

(assert (=> b!75432 (= e!49278 Unit!2170)))

(declare-fun b!75433 () Bool)

(assert (=> b!75433 (= e!49277 (isDefined!87 (getValueByKey!135 (toList!719 e!49173) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))))

(assert (= (and d!17921 c!11441) b!75431))

(assert (= (and d!17921 (not c!11441)) b!75432))

(assert (= (and d!17921 (not res!39780)) b!75433))

(assert (=> d!17921 m!74477))

(declare-fun m!74977 () Bool)

(assert (=> d!17921 m!74977))

(assert (=> b!75431 m!74477))

(declare-fun m!74979 () Bool)

(assert (=> b!75431 m!74979))

(assert (=> b!75431 m!74477))

(declare-fun m!74981 () Bool)

(assert (=> b!75431 m!74981))

(assert (=> b!75431 m!74981))

(declare-fun m!74983 () Bool)

(assert (=> b!75431 m!74983))

(assert (=> b!75433 m!74477))

(assert (=> b!75433 m!74981))

(assert (=> b!75433 m!74981))

(assert (=> b!75433 m!74983))

(assert (=> bm!6691 d!17921))

(declare-fun d!17923 () Bool)

(assert (=> d!17923 (= (apply!76 lt!33886 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1159 (getValueByKey!135 (toList!719 lt!33886) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3249 () Bool)

(assert (= bs!3249 d!17923))

(assert (=> bs!3249 m!74669))

(declare-fun m!74985 () Bool)

(assert (=> bs!3249 m!74985))

(assert (=> bs!3249 m!74985))

(declare-fun m!74987 () Bool)

(assert (=> bs!3249 m!74987))

(assert (=> b!75139 d!17923))

(assert (=> b!75139 d!17919))

(declare-fun d!17925 () Bool)

(assert (=> d!17925 (= (+!95 (+!95 lt!33762 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (+!95 (+!95 lt!33762 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))

(assert (=> d!17925 true))

(declare-fun _$28!124 () Unit!2157)

(assert (=> d!17925 (= (choose!432 lt!33762 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) _$28!124)))

(declare-fun bs!3250 () Bool)

(assert (= bs!3250 d!17925))

(assert (=> bs!3250 m!74829))

(assert (=> bs!3250 m!74829))

(assert (=> bs!3250 m!74831))

(assert (=> bs!3250 m!74825))

(assert (=> bs!3250 m!74825))

(assert (=> bs!3250 m!74827))

(assert (=> d!17887 d!17925))

(declare-fun d!17927 () Bool)

(declare-fun e!49279 () Bool)

(assert (=> d!17927 e!49279))

(declare-fun res!39782 () Bool)

(assert (=> d!17927 (=> (not res!39782) (not e!49279))))

(declare-fun lt!34171 () ListLongMap!1407)

(assert (=> d!17927 (= res!39782 (contains!723 lt!34171 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(declare-fun lt!34169 () List!1478)

(assert (=> d!17927 (= lt!34171 (ListLongMap!1408 lt!34169))))

(declare-fun lt!34168 () Unit!2157)

(declare-fun lt!34170 () Unit!2157)

(assert (=> d!17927 (= lt!34168 lt!34170)))

(assert (=> d!17927 (= (getValueByKey!135 lt!34169 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!17927 (= lt!34170 (lemmaContainsTupThenGetReturnValue!52 lt!34169 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!17927 (= lt!34169 (insertStrictlySorted!55 (toList!719 (+!95 lt!33762 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!17927 (= (+!95 (+!95 lt!33762 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) lt!34171)))

(declare-fun b!75434 () Bool)

(declare-fun res!39781 () Bool)

(assert (=> b!75434 (=> (not res!39781) (not e!49279))))

(assert (=> b!75434 (= res!39781 (= (getValueByKey!135 (toList!719 lt!34171) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))))

(declare-fun b!75435 () Bool)

(assert (=> b!75435 (= e!49279 (contains!724 (toList!719 lt!34171) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))

(assert (= (and d!17927 res!39782) b!75434))

(assert (= (and b!75434 res!39781) b!75435))

(declare-fun m!74989 () Bool)

(assert (=> d!17927 m!74989))

(declare-fun m!74991 () Bool)

(assert (=> d!17927 m!74991))

(declare-fun m!74993 () Bool)

(assert (=> d!17927 m!74993))

(declare-fun m!74995 () Bool)

(assert (=> d!17927 m!74995))

(declare-fun m!74997 () Bool)

(assert (=> b!75434 m!74997))

(declare-fun m!74999 () Bool)

(assert (=> b!75435 m!74999))

(assert (=> d!17887 d!17927))

(declare-fun d!17929 () Bool)

(declare-fun e!49280 () Bool)

(assert (=> d!17929 e!49280))

(declare-fun res!39784 () Bool)

(assert (=> d!17929 (=> (not res!39784) (not e!49280))))

(declare-fun lt!34175 () ListLongMap!1407)

(assert (=> d!17929 (= res!39784 (contains!723 lt!34175 (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun lt!34173 () List!1478)

(assert (=> d!17929 (= lt!34175 (ListLongMap!1408 lt!34173))))

(declare-fun lt!34172 () Unit!2157)

(declare-fun lt!34174 () Unit!2157)

(assert (=> d!17929 (= lt!34172 lt!34174)))

(assert (=> d!17929 (= (getValueByKey!135 lt!34173 (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17929 (= lt!34174 (lemmaContainsTupThenGetReturnValue!52 lt!34173 (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17929 (= lt!34173 (insertStrictlySorted!55 (toList!719 (+!95 lt!33762 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17929 (= (+!95 (+!95 lt!33762 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!34175)))

(declare-fun b!75436 () Bool)

(declare-fun res!39783 () Bool)

(assert (=> b!75436 (=> (not res!39783) (not e!49280))))

(assert (=> b!75436 (= res!39783 (= (getValueByKey!135 (toList!719 lt!34175) (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun b!75437 () Bool)

(assert (=> b!75437 (= e!49280 (contains!724 (toList!719 lt!34175) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!17929 res!39784) b!75436))

(assert (= (and b!75436 res!39783) b!75437))

(declare-fun m!75001 () Bool)

(assert (=> d!17929 m!75001))

(declare-fun m!75003 () Bool)

(assert (=> d!17929 m!75003))

(declare-fun m!75005 () Bool)

(assert (=> d!17929 m!75005))

(declare-fun m!75007 () Bool)

(assert (=> d!17929 m!75007))

(declare-fun m!75009 () Bool)

(assert (=> b!75436 m!75009))

(declare-fun m!75011 () Bool)

(assert (=> b!75437 m!75011))

(assert (=> d!17887 d!17929))

(declare-fun d!17931 () Bool)

(declare-fun e!49281 () Bool)

(assert (=> d!17931 e!49281))

(declare-fun res!39786 () Bool)

(assert (=> d!17931 (=> (not res!39786) (not e!49281))))

(declare-fun lt!34179 () ListLongMap!1407)

(assert (=> d!17931 (= res!39786 (contains!723 lt!34179 (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun lt!34177 () List!1478)

(assert (=> d!17931 (= lt!34179 (ListLongMap!1408 lt!34177))))

(declare-fun lt!34176 () Unit!2157)

(declare-fun lt!34178 () Unit!2157)

(assert (=> d!17931 (= lt!34176 lt!34178)))

(assert (=> d!17931 (= (getValueByKey!135 lt!34177 (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17931 (= lt!34178 (lemmaContainsTupThenGetReturnValue!52 lt!34177 (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17931 (= lt!34177 (insertStrictlySorted!55 (toList!719 lt!33762) (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17931 (= (+!95 lt!33762 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!34179)))

(declare-fun b!75438 () Bool)

(declare-fun res!39785 () Bool)

(assert (=> b!75438 (=> (not res!39785) (not e!49281))))

(assert (=> b!75438 (= res!39785 (= (getValueByKey!135 (toList!719 lt!34179) (_1!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun b!75439 () Bool)

(assert (=> b!75439 (= e!49281 (contains!724 (toList!719 lt!34179) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!17931 res!39786) b!75438))

(assert (= (and b!75438 res!39785) b!75439))

(declare-fun m!75013 () Bool)

(assert (=> d!17931 m!75013))

(declare-fun m!75015 () Bool)

(assert (=> d!17931 m!75015))

(declare-fun m!75017 () Bool)

(assert (=> d!17931 m!75017))

(declare-fun m!75019 () Bool)

(assert (=> d!17931 m!75019))

(declare-fun m!75021 () Bool)

(assert (=> b!75438 m!75021))

(declare-fun m!75023 () Bool)

(assert (=> b!75439 m!75023))

(assert (=> d!17887 d!17931))

(declare-fun d!17933 () Bool)

(declare-fun e!49282 () Bool)

(assert (=> d!17933 e!49282))

(declare-fun res!39788 () Bool)

(assert (=> d!17933 (=> (not res!39788) (not e!49282))))

(declare-fun lt!34183 () ListLongMap!1407)

(assert (=> d!17933 (= res!39788 (contains!723 lt!34183 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(declare-fun lt!34181 () List!1478)

(assert (=> d!17933 (= lt!34183 (ListLongMap!1408 lt!34181))))

(declare-fun lt!34180 () Unit!2157)

(declare-fun lt!34182 () Unit!2157)

(assert (=> d!17933 (= lt!34180 lt!34182)))

(assert (=> d!17933 (= (getValueByKey!135 lt!34181 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!17933 (= lt!34182 (lemmaContainsTupThenGetReturnValue!52 lt!34181 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!17933 (= lt!34181 (insertStrictlySorted!55 (toList!719 lt!33762) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!17933 (= (+!95 lt!33762 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) lt!34183)))

(declare-fun b!75440 () Bool)

(declare-fun res!39787 () Bool)

(assert (=> b!75440 (=> (not res!39787) (not e!49282))))

(assert (=> b!75440 (= res!39787 (= (getValueByKey!135 (toList!719 lt!34183) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))))

(declare-fun b!75441 () Bool)

(assert (=> b!75441 (= e!49282 (contains!724 (toList!719 lt!34183) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))

(assert (= (and d!17933 res!39788) b!75440))

(assert (= (and b!75440 res!39787) b!75441))

(declare-fun m!75025 () Bool)

(assert (=> d!17933 m!75025))

(declare-fun m!75027 () Bool)

(assert (=> d!17933 m!75027))

(declare-fun m!75029 () Bool)

(assert (=> d!17933 m!75029))

(declare-fun m!75031 () Bool)

(assert (=> d!17933 m!75031))

(declare-fun m!75033 () Bool)

(assert (=> b!75440 m!75033))

(declare-fun m!75035 () Bool)

(assert (=> b!75441 m!75035))

(assert (=> d!17887 d!17933))

(declare-fun d!17935 () Bool)

(declare-fun e!49283 () Bool)

(assert (=> d!17935 e!49283))

(declare-fun res!39789 () Bool)

(assert (=> d!17935 (=> res!39789 e!49283)))

(declare-fun lt!34185 () Bool)

(assert (=> d!17935 (= res!39789 (not lt!34185))))

(declare-fun lt!34187 () Bool)

(assert (=> d!17935 (= lt!34185 lt!34187)))

(declare-fun lt!34186 () Unit!2157)

(declare-fun e!49284 () Unit!2157)

(assert (=> d!17935 (= lt!34186 e!49284)))

(declare-fun c!11442 () Bool)

(assert (=> d!17935 (= c!11442 lt!34187)))

(assert (=> d!17935 (= lt!34187 (containsKey!138 (toList!719 lt!34030) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!17935 (= (contains!723 lt!34030 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34185)))

(declare-fun b!75442 () Bool)

(declare-fun lt!34184 () Unit!2157)

(assert (=> b!75442 (= e!49284 lt!34184)))

(assert (=> b!75442 (= lt!34184 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!34030) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75442 (isDefined!87 (getValueByKey!135 (toList!719 lt!34030) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75443 () Bool)

(declare-fun Unit!2171 () Unit!2157)

(assert (=> b!75443 (= e!49284 Unit!2171)))

(declare-fun b!75444 () Bool)

(assert (=> b!75444 (= e!49283 (isDefined!87 (getValueByKey!135 (toList!719 lt!34030) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!17935 c!11442) b!75442))

(assert (= (and d!17935 (not c!11442)) b!75443))

(assert (= (and d!17935 (not res!39789)) b!75444))

(assert (=> d!17935 m!74669))

(declare-fun m!75037 () Bool)

(assert (=> d!17935 m!75037))

(assert (=> b!75442 m!74669))

(declare-fun m!75039 () Bool)

(assert (=> b!75442 m!75039))

(assert (=> b!75442 m!74669))

(assert (=> b!75442 m!74969))

(assert (=> b!75442 m!74969))

(declare-fun m!75041 () Bool)

(assert (=> b!75442 m!75041))

(assert (=> b!75444 m!74669))

(assert (=> b!75444 m!74969))

(assert (=> b!75444 m!74969))

(assert (=> b!75444 m!75041))

(assert (=> b!75311 d!17935))

(declare-fun b!75453 () Bool)

(declare-fun e!49289 () Option!141)

(assert (=> b!75453 (= e!49289 (Some!140 (_2!1075 (h!2062 (toList!719 lt!34011)))))))

(declare-fun d!17937 () Bool)

(declare-fun c!11447 () Bool)

(assert (=> d!17937 (= c!11447 (and ((_ is Cons!1474) (toList!719 lt!34011)) (= (_1!1075 (h!2062 (toList!719 lt!34011))) (_1!1075 lt!33761))))))

(assert (=> d!17937 (= (getValueByKey!135 (toList!719 lt!34011) (_1!1075 lt!33761)) e!49289)))

(declare-fun b!75456 () Bool)

(declare-fun e!49290 () Option!141)

(assert (=> b!75456 (= e!49290 None!139)))

(declare-fun b!75454 () Bool)

(assert (=> b!75454 (= e!49289 e!49290)))

(declare-fun c!11448 () Bool)

(assert (=> b!75454 (= c!11448 (and ((_ is Cons!1474) (toList!719 lt!34011)) (not (= (_1!1075 (h!2062 (toList!719 lt!34011))) (_1!1075 lt!33761)))))))

(declare-fun b!75455 () Bool)

(assert (=> b!75455 (= e!49290 (getValueByKey!135 (t!5048 (toList!719 lt!34011)) (_1!1075 lt!33761)))))

(assert (= (and d!17937 c!11447) b!75453))

(assert (= (and d!17937 (not c!11447)) b!75454))

(assert (= (and b!75454 c!11448) b!75455))

(assert (= (and b!75454 (not c!11448)) b!75456))

(declare-fun m!75043 () Bool)

(assert (=> b!75455 m!75043))

(assert (=> b!75279 d!17937))

(assert (=> bm!6703 d!17869))

(declare-fun d!17939 () Bool)

(declare-fun res!39790 () Bool)

(declare-fun e!49291 () Bool)

(assert (=> d!17939 (=> (not res!39790) (not e!49291))))

(assert (=> d!17939 (= res!39790 (simpleValid!52 (_2!1076 lt!33983)))))

(assert (=> d!17939 (= (valid!309 (_2!1076 lt!33983)) e!49291)))

(declare-fun b!75457 () Bool)

(declare-fun res!39791 () Bool)

(assert (=> b!75457 (=> (not res!39791) (not e!49291))))

(assert (=> b!75457 (= res!39791 (= (arrayCountValidKeys!0 (_keys!3889 (_2!1076 lt!33983)) #b00000000000000000000000000000000 (size!2095 (_keys!3889 (_2!1076 lt!33983)))) (_size!399 (_2!1076 lt!33983))))))

(declare-fun b!75458 () Bool)

(declare-fun res!39792 () Bool)

(assert (=> b!75458 (=> (not res!39792) (not e!49291))))

(assert (=> b!75458 (= res!39792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3889 (_2!1076 lt!33983)) (mask!6210 (_2!1076 lt!33983))))))

(declare-fun b!75459 () Bool)

(assert (=> b!75459 (= e!49291 (arrayNoDuplicates!0 (_keys!3889 (_2!1076 lt!33983)) #b00000000000000000000000000000000 Nil!1476))))

(assert (= (and d!17939 res!39790) b!75457))

(assert (= (and b!75457 res!39791) b!75458))

(assert (= (and b!75458 res!39792) b!75459))

(declare-fun m!75045 () Bool)

(assert (=> d!17939 m!75045))

(declare-fun m!75047 () Bool)

(assert (=> b!75457 m!75047))

(declare-fun m!75049 () Bool)

(assert (=> b!75458 m!75049))

(declare-fun m!75051 () Bool)

(assert (=> b!75459 m!75051))

(assert (=> d!17875 d!17939))

(assert (=> d!17875 d!17867))

(declare-fun d!17941 () Bool)

(assert (=> d!17941 (= (apply!76 lt!33886 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1159 (getValueByKey!135 (toList!719 lt!33886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3251 () Bool)

(assert (= bs!3251 d!17941))

(declare-fun m!75053 () Bool)

(assert (=> bs!3251 m!75053))

(assert (=> bs!3251 m!75053))

(declare-fun m!75055 () Bool)

(assert (=> bs!3251 m!75055))

(assert (=> b!75127 d!17941))

(declare-fun d!17943 () Bool)

(declare-fun e!49292 () Bool)

(assert (=> d!17943 e!49292))

(declare-fun res!39793 () Bool)

(assert (=> d!17943 (=> res!39793 e!49292)))

(declare-fun lt!34189 () Bool)

(assert (=> d!17943 (= res!39793 (not lt!34189))))

(declare-fun lt!34191 () Bool)

(assert (=> d!17943 (= lt!34189 lt!34191)))

(declare-fun lt!34190 () Unit!2157)

(declare-fun e!49293 () Unit!2157)

(assert (=> d!17943 (= lt!34190 e!49293)))

(declare-fun c!11449 () Bool)

(assert (=> d!17943 (= c!11449 lt!34191)))

(assert (=> d!17943 (= lt!34191 (containsKey!138 (toList!719 lt!34043) (_1!1075 lt!33758)))))

(assert (=> d!17943 (= (contains!723 lt!34043 (_1!1075 lt!33758)) lt!34189)))

(declare-fun b!75460 () Bool)

(declare-fun lt!34188 () Unit!2157)

(assert (=> b!75460 (= e!49293 lt!34188)))

(assert (=> b!75460 (= lt!34188 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!34043) (_1!1075 lt!33758)))))

(assert (=> b!75460 (isDefined!87 (getValueByKey!135 (toList!719 lt!34043) (_1!1075 lt!33758)))))

(declare-fun b!75461 () Bool)

(declare-fun Unit!2172 () Unit!2157)

(assert (=> b!75461 (= e!49293 Unit!2172)))

(declare-fun b!75462 () Bool)

(assert (=> b!75462 (= e!49292 (isDefined!87 (getValueByKey!135 (toList!719 lt!34043) (_1!1075 lt!33758))))))

(assert (= (and d!17943 c!11449) b!75460))

(assert (= (and d!17943 (not c!11449)) b!75461))

(assert (= (and d!17943 (not res!39793)) b!75462))

(declare-fun m!75057 () Bool)

(assert (=> d!17943 m!75057))

(declare-fun m!75059 () Bool)

(assert (=> b!75460 m!75059))

(assert (=> b!75460 m!74843))

(assert (=> b!75460 m!74843))

(declare-fun m!75061 () Bool)

(assert (=> b!75460 m!75061))

(assert (=> b!75462 m!74843))

(assert (=> b!75462 m!74843))

(assert (=> b!75462 m!75061))

(assert (=> d!17889 d!17943))

(declare-fun b!75463 () Bool)

(declare-fun e!49294 () Option!141)

(assert (=> b!75463 (= e!49294 (Some!140 (_2!1075 (h!2062 lt!34041))))))

(declare-fun d!17945 () Bool)

(declare-fun c!11450 () Bool)

(assert (=> d!17945 (= c!11450 (and ((_ is Cons!1474) lt!34041) (= (_1!1075 (h!2062 lt!34041)) (_1!1075 lt!33758))))))

(assert (=> d!17945 (= (getValueByKey!135 lt!34041 (_1!1075 lt!33758)) e!49294)))

(declare-fun b!75466 () Bool)

(declare-fun e!49295 () Option!141)

(assert (=> b!75466 (= e!49295 None!139)))

(declare-fun b!75464 () Bool)

(assert (=> b!75464 (= e!49294 e!49295)))

(declare-fun c!11451 () Bool)

(assert (=> b!75464 (= c!11451 (and ((_ is Cons!1474) lt!34041) (not (= (_1!1075 (h!2062 lt!34041)) (_1!1075 lt!33758)))))))

(declare-fun b!75465 () Bool)

(assert (=> b!75465 (= e!49295 (getValueByKey!135 (t!5048 lt!34041) (_1!1075 lt!33758)))))

(assert (= (and d!17945 c!11450) b!75463))

(assert (= (and d!17945 (not c!11450)) b!75464))

(assert (= (and b!75464 c!11451) b!75465))

(assert (= (and b!75464 (not c!11451)) b!75466))

(declare-fun m!75063 () Bool)

(assert (=> b!75465 m!75063))

(assert (=> d!17889 d!17945))

(declare-fun d!17947 () Bool)

(assert (=> d!17947 (= (getValueByKey!135 lt!34041 (_1!1075 lt!33758)) (Some!140 (_2!1075 lt!33758)))))

(declare-fun lt!34194 () Unit!2157)

(declare-fun choose!434 (List!1478 (_ BitVec 64) V!2953) Unit!2157)

(assert (=> d!17947 (= lt!34194 (choose!434 lt!34041 (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(declare-fun e!49298 () Bool)

(assert (=> d!17947 e!49298))

(declare-fun res!39798 () Bool)

(assert (=> d!17947 (=> (not res!39798) (not e!49298))))

(declare-fun isStrictlySorted!280 (List!1478) Bool)

(assert (=> d!17947 (= res!39798 (isStrictlySorted!280 lt!34041))))

(assert (=> d!17947 (= (lemmaContainsTupThenGetReturnValue!52 lt!34041 (_1!1075 lt!33758) (_2!1075 lt!33758)) lt!34194)))

(declare-fun b!75471 () Bool)

(declare-fun res!39799 () Bool)

(assert (=> b!75471 (=> (not res!39799) (not e!49298))))

(assert (=> b!75471 (= res!39799 (containsKey!138 lt!34041 (_1!1075 lt!33758)))))

(declare-fun b!75472 () Bool)

(assert (=> b!75472 (= e!49298 (contains!724 lt!34041 (tuple2!2129 (_1!1075 lt!33758) (_2!1075 lt!33758))))))

(assert (= (and d!17947 res!39798) b!75471))

(assert (= (and b!75471 res!39799) b!75472))

(assert (=> d!17947 m!74837))

(declare-fun m!75065 () Bool)

(assert (=> d!17947 m!75065))

(declare-fun m!75067 () Bool)

(assert (=> d!17947 m!75067))

(declare-fun m!75069 () Bool)

(assert (=> b!75471 m!75069))

(declare-fun m!75071 () Bool)

(assert (=> b!75472 m!75071))

(assert (=> d!17889 d!17947))

(declare-fun c!11463 () Bool)

(declare-fun e!49312 () List!1478)

(declare-fun b!75493 () Bool)

(declare-fun c!11462 () Bool)

(assert (=> b!75493 (= e!49312 (ite c!11463 (t!5048 (toList!719 lt!33762)) (ite c!11462 (Cons!1474 (h!2062 (toList!719 lt!33762)) (t!5048 (toList!719 lt!33762))) Nil!1475)))))

(declare-fun bm!6741 () Bool)

(declare-fun c!11461 () Bool)

(declare-fun call!6745 () List!1478)

(declare-fun $colon$colon!66 (List!1478 tuple2!2128) List!1478)

(assert (=> bm!6741 (= call!6745 ($colon$colon!66 e!49312 (ite c!11461 (h!2062 (toList!719 lt!33762)) (tuple2!2129 (_1!1075 lt!33758) (_2!1075 lt!33758)))))))

(declare-fun c!11460 () Bool)

(assert (=> bm!6741 (= c!11460 c!11461)))

(declare-fun b!75495 () Bool)

(declare-fun e!49309 () List!1478)

(assert (=> b!75495 (= e!49309 call!6745)))

(declare-fun b!75496 () Bool)

(declare-fun e!49310 () List!1478)

(declare-fun call!6744 () List!1478)

(assert (=> b!75496 (= e!49310 call!6744)))

(declare-fun b!75497 () Bool)

(assert (=> b!75497 (= c!11462 (and ((_ is Cons!1474) (toList!719 lt!33762)) (bvsgt (_1!1075 (h!2062 (toList!719 lt!33762))) (_1!1075 lt!33758))))))

(declare-fun e!49313 () List!1478)

(assert (=> b!75497 (= e!49313 e!49310)))

(declare-fun b!75498 () Bool)

(declare-fun res!39805 () Bool)

(declare-fun e!49311 () Bool)

(assert (=> b!75498 (=> (not res!39805) (not e!49311))))

(declare-fun lt!34197 () List!1478)

(assert (=> b!75498 (= res!39805 (containsKey!138 lt!34197 (_1!1075 lt!33758)))))

(declare-fun d!17949 () Bool)

(assert (=> d!17949 e!49311))

(declare-fun res!39804 () Bool)

(assert (=> d!17949 (=> (not res!39804) (not e!49311))))

(assert (=> d!17949 (= res!39804 (isStrictlySorted!280 lt!34197))))

(assert (=> d!17949 (= lt!34197 e!49309)))

(assert (=> d!17949 (= c!11461 (and ((_ is Cons!1474) (toList!719 lt!33762)) (bvslt (_1!1075 (h!2062 (toList!719 lt!33762))) (_1!1075 lt!33758))))))

(assert (=> d!17949 (isStrictlySorted!280 (toList!719 lt!33762))))

(assert (=> d!17949 (= (insertStrictlySorted!55 (toList!719 lt!33762) (_1!1075 lt!33758) (_2!1075 lt!33758)) lt!34197)))

(declare-fun b!75494 () Bool)

(declare-fun call!6746 () List!1478)

(assert (=> b!75494 (= e!49313 call!6746)))

(declare-fun b!75499 () Bool)

(assert (=> b!75499 (= e!49311 (contains!724 lt!34197 (tuple2!2129 (_1!1075 lt!33758) (_2!1075 lt!33758))))))

(declare-fun bm!6742 () Bool)

(assert (=> bm!6742 (= call!6746 call!6745)))

(declare-fun b!75500 () Bool)

(assert (=> b!75500 (= e!49312 (insertStrictlySorted!55 (t!5048 (toList!719 lt!33762)) (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(declare-fun bm!6743 () Bool)

(assert (=> bm!6743 (= call!6744 call!6746)))

(declare-fun b!75501 () Bool)

(assert (=> b!75501 (= e!49310 call!6744)))

(declare-fun b!75502 () Bool)

(assert (=> b!75502 (= e!49309 e!49313)))

(assert (=> b!75502 (= c!11463 (and ((_ is Cons!1474) (toList!719 lt!33762)) (= (_1!1075 (h!2062 (toList!719 lt!33762))) (_1!1075 lt!33758))))))

(assert (= (and d!17949 c!11461) b!75495))

(assert (= (and d!17949 (not c!11461)) b!75502))

(assert (= (and b!75502 c!11463) b!75494))

(assert (= (and b!75502 (not c!11463)) b!75497))

(assert (= (and b!75497 c!11462) b!75496))

(assert (= (and b!75497 (not c!11462)) b!75501))

(assert (= (or b!75496 b!75501) bm!6743))

(assert (= (or b!75494 bm!6743) bm!6742))

(assert (= (or b!75495 bm!6742) bm!6741))

(assert (= (and bm!6741 c!11460) b!75500))

(assert (= (and bm!6741 (not c!11460)) b!75493))

(assert (= (and d!17949 res!39804) b!75498))

(assert (= (and b!75498 res!39805) b!75499))

(declare-fun m!75073 () Bool)

(assert (=> b!75499 m!75073))

(declare-fun m!75075 () Bool)

(assert (=> b!75500 m!75075))

(declare-fun m!75077 () Bool)

(assert (=> bm!6741 m!75077))

(declare-fun m!75079 () Bool)

(assert (=> b!75498 m!75079))

(declare-fun m!75081 () Bool)

(assert (=> d!17949 m!75081))

(declare-fun m!75083 () Bool)

(assert (=> d!17949 m!75083))

(assert (=> d!17889 d!17949))

(declare-fun d!17951 () Bool)

(declare-fun e!49314 () Bool)

(assert (=> d!17951 e!49314))

(declare-fun res!39806 () Bool)

(assert (=> d!17951 (=> res!39806 e!49314)))

(declare-fun lt!34199 () Bool)

(assert (=> d!17951 (= res!39806 (not lt!34199))))

(declare-fun lt!34201 () Bool)

(assert (=> d!17951 (= lt!34199 lt!34201)))

(declare-fun lt!34200 () Unit!2157)

(declare-fun e!49315 () Unit!2157)

(assert (=> d!17951 (= lt!34200 e!49315)))

(declare-fun c!11464 () Bool)

(assert (=> d!17951 (= c!11464 lt!34201)))

(assert (=> d!17951 (= lt!34201 (containsKey!138 (toList!719 lt!34030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17951 (= (contains!723 lt!34030 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34199)))

(declare-fun b!75503 () Bool)

(declare-fun lt!34198 () Unit!2157)

(assert (=> b!75503 (= e!49315 lt!34198)))

(assert (=> b!75503 (= lt!34198 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!34030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75503 (isDefined!87 (getValueByKey!135 (toList!719 lt!34030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75504 () Bool)

(declare-fun Unit!2173 () Unit!2157)

(assert (=> b!75504 (= e!49315 Unit!2173)))

(declare-fun b!75505 () Bool)

(assert (=> b!75505 (= e!49314 (isDefined!87 (getValueByKey!135 (toList!719 lt!34030) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!17951 c!11464) b!75503))

(assert (= (and d!17951 (not c!11464)) b!75504))

(assert (= (and d!17951 (not res!39806)) b!75505))

(declare-fun m!75085 () Bool)

(assert (=> d!17951 m!75085))

(declare-fun m!75087 () Bool)

(assert (=> b!75503 m!75087))

(declare-fun m!75089 () Bool)

(assert (=> b!75503 m!75089))

(assert (=> b!75503 m!75089))

(declare-fun m!75091 () Bool)

(assert (=> b!75503 m!75091))

(assert (=> b!75505 m!75089))

(assert (=> b!75505 m!75089))

(assert (=> b!75505 m!75091))

(assert (=> b!75313 d!17951))

(declare-fun b!75506 () Bool)

(declare-fun e!49316 () Option!141)

(assert (=> b!75506 (= e!49316 (Some!140 (_2!1075 (h!2062 (toList!719 lt!34015)))))))

(declare-fun d!17953 () Bool)

(declare-fun c!11465 () Bool)

(assert (=> d!17953 (= c!11465 (and ((_ is Cons!1474) (toList!719 lt!34015)) (= (_1!1075 (h!2062 (toList!719 lt!34015))) (_1!1075 lt!33761))))))

(assert (=> d!17953 (= (getValueByKey!135 (toList!719 lt!34015) (_1!1075 lt!33761)) e!49316)))

(declare-fun b!75509 () Bool)

(declare-fun e!49317 () Option!141)

(assert (=> b!75509 (= e!49317 None!139)))

(declare-fun b!75507 () Bool)

(assert (=> b!75507 (= e!49316 e!49317)))

(declare-fun c!11466 () Bool)

(assert (=> b!75507 (= c!11466 (and ((_ is Cons!1474) (toList!719 lt!34015)) (not (= (_1!1075 (h!2062 (toList!719 lt!34015))) (_1!1075 lt!33761)))))))

(declare-fun b!75508 () Bool)

(assert (=> b!75508 (= e!49317 (getValueByKey!135 (t!5048 (toList!719 lt!34015)) (_1!1075 lt!33761)))))

(assert (= (and d!17953 c!11465) b!75506))

(assert (= (and d!17953 (not c!11465)) b!75507))

(assert (= (and b!75507 c!11466) b!75508))

(assert (= (and b!75507 (not c!11466)) b!75509))

(declare-fun m!75093 () Bool)

(assert (=> b!75508 m!75093))

(assert (=> b!75281 d!17953))

(declare-fun d!17955 () Bool)

(declare-fun e!49318 () Bool)

(assert (=> d!17955 e!49318))

(declare-fun res!39807 () Bool)

(assert (=> d!17955 (=> res!39807 e!49318)))

(declare-fun lt!34203 () Bool)

(assert (=> d!17955 (= res!39807 (not lt!34203))))

(declare-fun lt!34205 () Bool)

(assert (=> d!17955 (= lt!34203 lt!34205)))

(declare-fun lt!34204 () Unit!2157)

(declare-fun e!49319 () Unit!2157)

(assert (=> d!17955 (= lt!34204 e!49319)))

(declare-fun c!11467 () Bool)

(assert (=> d!17955 (= c!11467 lt!34205)))

(assert (=> d!17955 (= lt!34205 (containsKey!138 (toList!719 lt!34047) (_1!1075 lt!33758)))))

(assert (=> d!17955 (= (contains!723 lt!34047 (_1!1075 lt!33758)) lt!34203)))

(declare-fun b!75510 () Bool)

(declare-fun lt!34202 () Unit!2157)

(assert (=> b!75510 (= e!49319 lt!34202)))

(assert (=> b!75510 (= lt!34202 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!34047) (_1!1075 lt!33758)))))

(assert (=> b!75510 (isDefined!87 (getValueByKey!135 (toList!719 lt!34047) (_1!1075 lt!33758)))))

(declare-fun b!75511 () Bool)

(declare-fun Unit!2174 () Unit!2157)

(assert (=> b!75511 (= e!49319 Unit!2174)))

(declare-fun b!75512 () Bool)

(assert (=> b!75512 (= e!49318 (isDefined!87 (getValueByKey!135 (toList!719 lt!34047) (_1!1075 lt!33758))))))

(assert (= (and d!17955 c!11467) b!75510))

(assert (= (and d!17955 (not c!11467)) b!75511))

(assert (= (and d!17955 (not res!39807)) b!75512))

(declare-fun m!75095 () Bool)

(assert (=> d!17955 m!75095))

(declare-fun m!75097 () Bool)

(assert (=> b!75510 m!75097))

(assert (=> b!75510 m!74855))

(assert (=> b!75510 m!74855))

(declare-fun m!75099 () Bool)

(assert (=> b!75510 m!75099))

(assert (=> b!75512 m!74855))

(assert (=> b!75512 m!74855))

(assert (=> b!75512 m!75099))

(assert (=> d!17891 d!17955))

(declare-fun b!75513 () Bool)

(declare-fun e!49320 () Option!141)

(assert (=> b!75513 (= e!49320 (Some!140 (_2!1075 (h!2062 lt!34045))))))

(declare-fun d!17957 () Bool)

(declare-fun c!11468 () Bool)

(assert (=> d!17957 (= c!11468 (and ((_ is Cons!1474) lt!34045) (= (_1!1075 (h!2062 lt!34045)) (_1!1075 lt!33758))))))

(assert (=> d!17957 (= (getValueByKey!135 lt!34045 (_1!1075 lt!33758)) e!49320)))

(declare-fun b!75516 () Bool)

(declare-fun e!49321 () Option!141)

(assert (=> b!75516 (= e!49321 None!139)))

(declare-fun b!75514 () Bool)

(assert (=> b!75514 (= e!49320 e!49321)))

(declare-fun c!11469 () Bool)

(assert (=> b!75514 (= c!11469 (and ((_ is Cons!1474) lt!34045) (not (= (_1!1075 (h!2062 lt!34045)) (_1!1075 lt!33758)))))))

(declare-fun b!75515 () Bool)

(assert (=> b!75515 (= e!49321 (getValueByKey!135 (t!5048 lt!34045) (_1!1075 lt!33758)))))

(assert (= (and d!17957 c!11468) b!75513))

(assert (= (and d!17957 (not c!11468)) b!75514))

(assert (= (and b!75514 c!11469) b!75515))

(assert (= (and b!75514 (not c!11469)) b!75516))

(declare-fun m!75101 () Bool)

(assert (=> b!75515 m!75101))

(assert (=> d!17891 d!17957))

(declare-fun d!17959 () Bool)

(assert (=> d!17959 (= (getValueByKey!135 lt!34045 (_1!1075 lt!33758)) (Some!140 (_2!1075 lt!33758)))))

(declare-fun lt!34206 () Unit!2157)

(assert (=> d!17959 (= lt!34206 (choose!434 lt!34045 (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(declare-fun e!49322 () Bool)

(assert (=> d!17959 e!49322))

(declare-fun res!39808 () Bool)

(assert (=> d!17959 (=> (not res!39808) (not e!49322))))

(assert (=> d!17959 (= res!39808 (isStrictlySorted!280 lt!34045))))

(assert (=> d!17959 (= (lemmaContainsTupThenGetReturnValue!52 lt!34045 (_1!1075 lt!33758) (_2!1075 lt!33758)) lt!34206)))

(declare-fun b!75517 () Bool)

(declare-fun res!39809 () Bool)

(assert (=> b!75517 (=> (not res!39809) (not e!49322))))

(assert (=> b!75517 (= res!39809 (containsKey!138 lt!34045 (_1!1075 lt!33758)))))

(declare-fun b!75518 () Bool)

(assert (=> b!75518 (= e!49322 (contains!724 lt!34045 (tuple2!2129 (_1!1075 lt!33758) (_2!1075 lt!33758))))))

(assert (= (and d!17959 res!39808) b!75517))

(assert (= (and b!75517 res!39809) b!75518))

(assert (=> d!17959 m!74849))

(declare-fun m!75103 () Bool)

(assert (=> d!17959 m!75103))

(declare-fun m!75105 () Bool)

(assert (=> d!17959 m!75105))

(declare-fun m!75107 () Bool)

(assert (=> b!75517 m!75107))

(declare-fun m!75109 () Bool)

(assert (=> b!75518 m!75109))

(assert (=> d!17891 d!17959))

(declare-fun c!11472 () Bool)

(declare-fun b!75519 () Bool)

(declare-fun c!11473 () Bool)

(declare-fun e!49326 () List!1478)

(assert (=> b!75519 (= e!49326 (ite c!11473 (t!5048 (toList!719 (+!95 lt!33762 lt!33761))) (ite c!11472 (Cons!1474 (h!2062 (toList!719 (+!95 lt!33762 lt!33761))) (t!5048 (toList!719 (+!95 lt!33762 lt!33761)))) Nil!1475)))))

(declare-fun call!6748 () List!1478)

(declare-fun c!11471 () Bool)

(declare-fun bm!6744 () Bool)

(assert (=> bm!6744 (= call!6748 ($colon$colon!66 e!49326 (ite c!11471 (h!2062 (toList!719 (+!95 lt!33762 lt!33761))) (tuple2!2129 (_1!1075 lt!33758) (_2!1075 lt!33758)))))))

(declare-fun c!11470 () Bool)

(assert (=> bm!6744 (= c!11470 c!11471)))

(declare-fun b!75521 () Bool)

(declare-fun e!49323 () List!1478)

(assert (=> b!75521 (= e!49323 call!6748)))

(declare-fun b!75522 () Bool)

(declare-fun e!49324 () List!1478)

(declare-fun call!6747 () List!1478)

(assert (=> b!75522 (= e!49324 call!6747)))

(declare-fun b!75523 () Bool)

(assert (=> b!75523 (= c!11472 (and ((_ is Cons!1474) (toList!719 (+!95 lt!33762 lt!33761))) (bvsgt (_1!1075 (h!2062 (toList!719 (+!95 lt!33762 lt!33761)))) (_1!1075 lt!33758))))))

(declare-fun e!49327 () List!1478)

(assert (=> b!75523 (= e!49327 e!49324)))

(declare-fun b!75524 () Bool)

(declare-fun res!39811 () Bool)

(declare-fun e!49325 () Bool)

(assert (=> b!75524 (=> (not res!39811) (not e!49325))))

(declare-fun lt!34207 () List!1478)

(assert (=> b!75524 (= res!39811 (containsKey!138 lt!34207 (_1!1075 lt!33758)))))

(declare-fun d!17961 () Bool)

(assert (=> d!17961 e!49325))

(declare-fun res!39810 () Bool)

(assert (=> d!17961 (=> (not res!39810) (not e!49325))))

(assert (=> d!17961 (= res!39810 (isStrictlySorted!280 lt!34207))))

(assert (=> d!17961 (= lt!34207 e!49323)))

(assert (=> d!17961 (= c!11471 (and ((_ is Cons!1474) (toList!719 (+!95 lt!33762 lt!33761))) (bvslt (_1!1075 (h!2062 (toList!719 (+!95 lt!33762 lt!33761)))) (_1!1075 lt!33758))))))

(assert (=> d!17961 (isStrictlySorted!280 (toList!719 (+!95 lt!33762 lt!33761)))))

(assert (=> d!17961 (= (insertStrictlySorted!55 (toList!719 (+!95 lt!33762 lt!33761)) (_1!1075 lt!33758) (_2!1075 lt!33758)) lt!34207)))

(declare-fun b!75520 () Bool)

(declare-fun call!6749 () List!1478)

(assert (=> b!75520 (= e!49327 call!6749)))

(declare-fun b!75525 () Bool)

(assert (=> b!75525 (= e!49325 (contains!724 lt!34207 (tuple2!2129 (_1!1075 lt!33758) (_2!1075 lt!33758))))))

(declare-fun bm!6745 () Bool)

(assert (=> bm!6745 (= call!6749 call!6748)))

(declare-fun b!75526 () Bool)

(assert (=> b!75526 (= e!49326 (insertStrictlySorted!55 (t!5048 (toList!719 (+!95 lt!33762 lt!33761))) (_1!1075 lt!33758) (_2!1075 lt!33758)))))

(declare-fun bm!6746 () Bool)

(assert (=> bm!6746 (= call!6747 call!6749)))

(declare-fun b!75527 () Bool)

(assert (=> b!75527 (= e!49324 call!6747)))

(declare-fun b!75528 () Bool)

(assert (=> b!75528 (= e!49323 e!49327)))

(assert (=> b!75528 (= c!11473 (and ((_ is Cons!1474) (toList!719 (+!95 lt!33762 lt!33761))) (= (_1!1075 (h!2062 (toList!719 (+!95 lt!33762 lt!33761)))) (_1!1075 lt!33758))))))

(assert (= (and d!17961 c!11471) b!75521))

(assert (= (and d!17961 (not c!11471)) b!75528))

(assert (= (and b!75528 c!11473) b!75520))

(assert (= (and b!75528 (not c!11473)) b!75523))

(assert (= (and b!75523 c!11472) b!75522))

(assert (= (and b!75523 (not c!11472)) b!75527))

(assert (= (or b!75522 b!75527) bm!6746))

(assert (= (or b!75520 bm!6746) bm!6745))

(assert (= (or b!75521 bm!6745) bm!6744))

(assert (= (and bm!6744 c!11470) b!75526))

(assert (= (and bm!6744 (not c!11470)) b!75519))

(assert (= (and d!17961 res!39810) b!75524))

(assert (= (and b!75524 res!39811) b!75525))

(declare-fun m!75111 () Bool)

(assert (=> b!75525 m!75111))

(declare-fun m!75113 () Bool)

(assert (=> b!75526 m!75113))

(declare-fun m!75115 () Bool)

(assert (=> bm!6744 m!75115))

(declare-fun m!75117 () Bool)

(assert (=> b!75524 m!75117))

(declare-fun m!75119 () Bool)

(assert (=> d!17961 m!75119))

(declare-fun m!75121 () Bool)

(assert (=> d!17961 m!75121))

(assert (=> d!17891 d!17961))

(declare-fun d!17963 () Bool)

(assert (=> d!17963 (= (map!1164 (_2!1076 lt!33983)) (getCurrentListMap!416 (_keys!3889 (_2!1076 lt!33983)) (_values!2216 (_2!1076 lt!33983)) (mask!6210 (_2!1076 lt!33983)) (extraKeys!2088 (_2!1076 lt!33983)) (zeroValue!2133 (_2!1076 lt!33983)) (minValue!2133 (_2!1076 lt!33983)) #b00000000000000000000000000000000 (defaultEntry!2233 (_2!1076 lt!33983))))))

(declare-fun bs!3252 () Bool)

(assert (= bs!3252 d!17963))

(declare-fun m!75123 () Bool)

(assert (=> bs!3252 m!75123))

(assert (=> bm!6694 d!17963))

(declare-fun b!75529 () Bool)

(declare-fun e!49338 () ListLongMap!1407)

(declare-fun call!6752 () ListLongMap!1407)

(assert (=> b!75529 (= e!49338 (+!95 call!6752 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16))))))

(declare-fun b!75530 () Bool)

(declare-fun e!49337 () Bool)

(declare-fun e!49330 () Bool)

(assert (=> b!75530 (= e!49337 e!49330)))

(declare-fun c!11476 () Bool)

(assert (=> b!75530 (= c!11476 (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75531 () Bool)

(declare-fun e!49335 () Unit!2157)

(declare-fun Unit!2175 () Unit!2157)

(assert (=> b!75531 (= e!49335 Unit!2175)))

(declare-fun b!75532 () Bool)

(declare-fun res!39813 () Bool)

(assert (=> b!75532 (=> (not res!39813) (not e!49337))))

(declare-fun e!49329 () Bool)

(assert (=> b!75532 (= res!39813 e!49329)))

(declare-fun res!39816 () Bool)

(assert (=> b!75532 (=> res!39816 e!49329)))

(declare-fun e!49328 () Bool)

(assert (=> b!75532 (= res!39816 (not e!49328))))

(declare-fun res!39820 () Bool)

(assert (=> b!75532 (=> (not res!39820) (not e!49328))))

(assert (=> b!75532 (= res!39820 (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75533 () Bool)

(declare-fun e!49333 () Bool)

(declare-fun lt!34209 () ListLongMap!1407)

(assert (=> b!75533 (= e!49333 (= (apply!76 lt!34209 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2133 newMap!16)))))

(declare-fun b!75534 () Bool)

(declare-fun e!49332 () ListLongMap!1407)

(declare-fun call!6756 () ListLongMap!1407)

(assert (=> b!75534 (= e!49332 call!6756)))

(declare-fun b!75535 () Bool)

(declare-fun e!49331 () Bool)

(declare-fun call!6755 () Bool)

(assert (=> b!75535 (= e!49331 (not call!6755))))

(declare-fun b!75536 () Bool)

(assert (=> b!75536 (= e!49328 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75537 () Bool)

(declare-fun e!49340 () Bool)

(assert (=> b!75537 (= e!49340 (= (apply!76 lt!34209 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2133 newMap!16)))))

(declare-fun b!75538 () Bool)

(declare-fun lt!34210 () Unit!2157)

(assert (=> b!75538 (= e!49335 lt!34210)))

(declare-fun lt!34221 () ListLongMap!1407)

(assert (=> b!75538 (= lt!34221 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34223 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34223 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34215 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34215 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34217 () Unit!2157)

(assert (=> b!75538 (= lt!34217 (addStillContains!52 lt!34221 lt!34223 (zeroValue!2133 newMap!16) lt!34215))))

(assert (=> b!75538 (contains!723 (+!95 lt!34221 (tuple2!2129 lt!34223 (zeroValue!2133 newMap!16))) lt!34215)))

(declare-fun lt!34211 () Unit!2157)

(assert (=> b!75538 (= lt!34211 lt!34217)))

(declare-fun lt!34218 () ListLongMap!1407)

(assert (=> b!75538 (= lt!34218 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34224 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34224 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34214 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34214 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34213 () Unit!2157)

(assert (=> b!75538 (= lt!34213 (addApplyDifferent!52 lt!34218 lt!34224 (minValue!2133 newMap!16) lt!34214))))

(assert (=> b!75538 (= (apply!76 (+!95 lt!34218 (tuple2!2129 lt!34224 (minValue!2133 newMap!16))) lt!34214) (apply!76 lt!34218 lt!34214))))

(declare-fun lt!34212 () Unit!2157)

(assert (=> b!75538 (= lt!34212 lt!34213)))

(declare-fun lt!34227 () ListLongMap!1407)

(assert (=> b!75538 (= lt!34227 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34229 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34228 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34228 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34225 () Unit!2157)

(assert (=> b!75538 (= lt!34225 (addApplyDifferent!52 lt!34227 lt!34229 (zeroValue!2133 newMap!16) lt!34228))))

(assert (=> b!75538 (= (apply!76 (+!95 lt!34227 (tuple2!2129 lt!34229 (zeroValue!2133 newMap!16))) lt!34228) (apply!76 lt!34227 lt!34228))))

(declare-fun lt!34219 () Unit!2157)

(assert (=> b!75538 (= lt!34219 lt!34225)))

(declare-fun lt!34220 () ListLongMap!1407)

(assert (=> b!75538 (= lt!34220 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34226 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34226 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34222 () (_ BitVec 64))

(assert (=> b!75538 (= lt!34222 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75538 (= lt!34210 (addApplyDifferent!52 lt!34220 lt!34226 (minValue!2133 newMap!16) lt!34222))))

(assert (=> b!75538 (= (apply!76 (+!95 lt!34220 (tuple2!2129 lt!34226 (minValue!2133 newMap!16))) lt!34222) (apply!76 lt!34220 lt!34222))))

(declare-fun bm!6747 () Bool)

(declare-fun call!6754 () ListLongMap!1407)

(declare-fun call!6753 () ListLongMap!1407)

(assert (=> bm!6747 (= call!6754 call!6753)))

(declare-fun b!75539 () Bool)

(assert (=> b!75539 (= e!49338 e!49332)))

(declare-fun c!11477 () Bool)

(assert (=> b!75539 (= c!11477 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75540 () Bool)

(assert (=> b!75540 (= e!49331 e!49333)))

(declare-fun res!39812 () Bool)

(assert (=> b!75540 (= res!39812 call!6755)))

(assert (=> b!75540 (=> (not res!39812) (not e!49333))))

(declare-fun b!75541 () Bool)

(declare-fun call!6751 () Bool)

(assert (=> b!75541 (= e!49330 (not call!6751))))

(declare-fun bm!6749 () Bool)

(assert (=> bm!6749 (= call!6756 call!6752)))

(declare-fun bm!6750 () Bool)

(declare-fun call!6750 () ListLongMap!1407)

(assert (=> bm!6750 (= call!6750 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75542 () Bool)

(assert (=> b!75542 (= e!49330 e!49340)))

(declare-fun res!39819 () Bool)

(assert (=> b!75542 (= res!39819 call!6751)))

(assert (=> b!75542 (=> (not res!39819) (not e!49340))))

(declare-fun b!75543 () Bool)

(declare-fun e!49334 () ListLongMap!1407)

(assert (=> b!75543 (= e!49334 call!6754)))

(declare-fun b!75544 () Bool)

(declare-fun e!49339 () Bool)

(assert (=> b!75544 (= e!49329 e!49339)))

(declare-fun res!39817 () Bool)

(assert (=> b!75544 (=> (not res!39817) (not e!49339))))

(assert (=> b!75544 (= res!39817 (contains!723 lt!34209 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75545 () Bool)

(declare-fun e!49336 () Bool)

(assert (=> b!75545 (= e!49336 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6751 () Bool)

(assert (=> bm!6751 (= call!6753 call!6750)))

(declare-fun bm!6752 () Bool)

(assert (=> bm!6752 (= call!6751 (contains!723 lt!34209 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75546 () Bool)

(declare-fun res!39814 () Bool)

(assert (=> b!75546 (=> (not res!39814) (not e!49337))))

(assert (=> b!75546 (= res!39814 e!49331)))

(declare-fun c!11475 () Bool)

(assert (=> b!75546 (= c!11475 (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6748 () Bool)

(assert (=> bm!6748 (= call!6755 (contains!723 lt!34209 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!17965 () Bool)

(assert (=> d!17965 e!49337))

(declare-fun res!39815 () Bool)

(assert (=> d!17965 (=> (not res!39815) (not e!49337))))

(assert (=> d!17965 (= res!39815 (or (bvsge #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))))

(declare-fun lt!34208 () ListLongMap!1407)

(assert (=> d!17965 (= lt!34209 lt!34208)))

(declare-fun lt!34216 () Unit!2157)

(assert (=> d!17965 (= lt!34216 e!49335)))

(declare-fun c!11478 () Bool)

(assert (=> d!17965 (= c!11478 e!49336)))

(declare-fun res!39818 () Bool)

(assert (=> d!17965 (=> (not res!39818) (not e!49336))))

(assert (=> d!17965 (= res!39818 (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (=> d!17965 (= lt!34208 e!49338)))

(declare-fun c!11474 () Bool)

(assert (=> d!17965 (= c!11474 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17965 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!17965 (= (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) lt!34209)))

(declare-fun b!75547 () Bool)

(declare-fun c!11479 () Bool)

(assert (=> b!75547 (= c!11479 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75547 (= e!49332 e!49334)))

(declare-fun b!75548 () Bool)

(assert (=> b!75548 (= e!49334 call!6756)))

(declare-fun bm!6753 () Bool)

(assert (=> bm!6753 (= call!6752 (+!95 (ite c!11474 call!6750 (ite c!11477 call!6753 call!6754)) (ite (or c!11474 c!11477) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 newMap!16)) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16)))))))

(declare-fun b!75549 () Bool)

(assert (=> b!75549 (= e!49339 (= (apply!76 lt!34209 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)) (get!1156 (select (arr!1857 (_values!2216 newMap!16)) #b00000000000000000000000000000000) (dynLambda!331 (defaultEntry!2233 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2096 (_values!2216 newMap!16))))))

(assert (=> b!75549 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (= (and d!17965 c!11474) b!75529))

(assert (= (and d!17965 (not c!11474)) b!75539))

(assert (= (and b!75539 c!11477) b!75534))

(assert (= (and b!75539 (not c!11477)) b!75547))

(assert (= (and b!75547 c!11479) b!75548))

(assert (= (and b!75547 (not c!11479)) b!75543))

(assert (= (or b!75548 b!75543) bm!6747))

(assert (= (or b!75534 bm!6747) bm!6751))

(assert (= (or b!75534 b!75548) bm!6749))

(assert (= (or b!75529 bm!6751) bm!6750))

(assert (= (or b!75529 bm!6749) bm!6753))

(assert (= (and d!17965 res!39818) b!75545))

(assert (= (and d!17965 c!11478) b!75538))

(assert (= (and d!17965 (not c!11478)) b!75531))

(assert (= (and d!17965 res!39815) b!75532))

(assert (= (and b!75532 res!39820) b!75536))

(assert (= (and b!75532 (not res!39816)) b!75544))

(assert (= (and b!75544 res!39817) b!75549))

(assert (= (and b!75532 res!39813) b!75546))

(assert (= (and b!75546 c!11475) b!75540))

(assert (= (and b!75546 (not c!11475)) b!75535))

(assert (= (and b!75540 res!39812) b!75533))

(assert (= (or b!75540 b!75535) bm!6748))

(assert (= (and b!75546 res!39814) b!75530))

(assert (= (and b!75530 c!11476) b!75542))

(assert (= (and b!75530 (not c!11476)) b!75541))

(assert (= (and b!75542 res!39819) b!75537))

(assert (= (or b!75542 b!75541) bm!6752))

(declare-fun b_lambda!3397 () Bool)

(assert (=> (not b_lambda!3397) (not b!75549)))

(declare-fun tb!1553 () Bool)

(declare-fun t!5060 () Bool)

(assert (=> (and b!74909 (= (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) (defaultEntry!2233 newMap!16)) t!5060) tb!1553))

(declare-fun result!2717 () Bool)

(assert (=> tb!1553 (= result!2717 tp_is_empty!2479)))

(assert (=> b!75549 t!5060))

(declare-fun b_and!4621 () Bool)

(assert (= b_and!4617 (and (=> t!5060 result!2717) b_and!4621)))

(declare-fun t!5062 () Bool)

(declare-fun tb!1555 () Bool)

(assert (=> (and b!74910 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 newMap!16)) t!5062) tb!1555))

(declare-fun result!2719 () Bool)

(assert (= result!2719 result!2717))

(assert (=> b!75549 t!5062))

(declare-fun b_and!4623 () Bool)

(assert (= b_and!4619 (and (=> t!5062 result!2719) b_and!4623)))

(declare-fun m!75125 () Bool)

(assert (=> bm!6748 m!75125))

(declare-fun m!75127 () Bool)

(assert (=> d!17965 m!75127))

(declare-fun m!75129 () Bool)

(assert (=> b!75537 m!75129))

(declare-fun m!75131 () Bool)

(assert (=> b!75544 m!75131))

(assert (=> b!75544 m!75131))

(declare-fun m!75133 () Bool)

(assert (=> b!75544 m!75133))

(declare-fun m!75135 () Bool)

(assert (=> b!75533 m!75135))

(assert (=> b!75545 m!75131))

(assert (=> b!75545 m!75131))

(declare-fun m!75137 () Bool)

(assert (=> b!75545 m!75137))

(assert (=> b!75549 m!75131))

(declare-fun m!75139 () Bool)

(assert (=> b!75549 m!75139))

(assert (=> b!75549 m!75131))

(declare-fun m!75141 () Bool)

(assert (=> b!75549 m!75141))

(assert (=> b!75549 m!75139))

(declare-fun m!75143 () Bool)

(assert (=> b!75549 m!75143))

(declare-fun m!75145 () Bool)

(assert (=> b!75549 m!75145))

(assert (=> b!75549 m!75143))

(declare-fun m!75147 () Bool)

(assert (=> bm!6753 m!75147))

(declare-fun m!75149 () Bool)

(assert (=> b!75538 m!75149))

(declare-fun m!75151 () Bool)

(assert (=> b!75538 m!75151))

(declare-fun m!75153 () Bool)

(assert (=> b!75538 m!75153))

(declare-fun m!75155 () Bool)

(assert (=> b!75538 m!75155))

(declare-fun m!75157 () Bool)

(assert (=> b!75538 m!75157))

(declare-fun m!75159 () Bool)

(assert (=> b!75538 m!75159))

(declare-fun m!75161 () Bool)

(assert (=> b!75538 m!75161))

(declare-fun m!75163 () Bool)

(assert (=> b!75538 m!75163))

(declare-fun m!75165 () Bool)

(assert (=> b!75538 m!75165))

(declare-fun m!75167 () Bool)

(assert (=> b!75538 m!75167))

(declare-fun m!75169 () Bool)

(assert (=> b!75538 m!75169))

(declare-fun m!75171 () Bool)

(assert (=> b!75538 m!75171))

(declare-fun m!75173 () Bool)

(assert (=> b!75538 m!75173))

(assert (=> b!75538 m!75131))

(assert (=> b!75538 m!75151))

(assert (=> b!75538 m!75173))

(declare-fun m!75175 () Bool)

(assert (=> b!75538 m!75175))

(declare-fun m!75177 () Bool)

(assert (=> b!75538 m!75177))

(assert (=> b!75538 m!75149))

(declare-fun m!75179 () Bool)

(assert (=> b!75538 m!75179))

(assert (=> b!75538 m!75167))

(assert (=> b!75536 m!75131))

(assert (=> b!75536 m!75131))

(assert (=> b!75536 m!75137))

(declare-fun m!75181 () Bool)

(assert (=> b!75529 m!75181))

(declare-fun m!75183 () Bool)

(assert (=> bm!6752 m!75183))

(assert (=> bm!6750 m!75163))

(assert (=> d!17869 d!17965))

(declare-fun b!75550 () Bool)

(declare-fun e!49347 () ListLongMap!1407)

(declare-fun call!6757 () ListLongMap!1407)

(assert (=> b!75550 (= e!49347 call!6757)))

(declare-fun b!75551 () Bool)

(declare-fun e!49345 () Bool)

(declare-fun lt!34230 () ListLongMap!1407)

(assert (=> b!75551 (= e!49345 (isEmpty!325 lt!34230))))

(declare-fun b!75552 () Bool)

(assert (=> b!75552 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> b!75552 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2096 (_values!2216 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun e!49341 () Bool)

(assert (=> b!75552 (= e!49341 (= (apply!76 lt!34230 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!75553 () Bool)

(declare-fun e!49343 () Bool)

(declare-fun e!49342 () Bool)

(assert (=> b!75553 (= e!49343 e!49342)))

(declare-fun c!11482 () Bool)

(declare-fun e!49346 () Bool)

(assert (=> b!75553 (= c!11482 e!49346)))

(declare-fun res!39824 () Bool)

(assert (=> b!75553 (=> (not res!39824) (not e!49346))))

(assert (=> b!75553 (= res!39824 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75554 () Bool)

(assert (=> b!75554 (= e!49342 e!49341)))

(assert (=> b!75554 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun res!39821 () Bool)

(assert (=> b!75554 (= res!39821 (contains!723 lt!34230 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!75554 (=> (not res!39821) (not e!49341))))

(declare-fun b!75555 () Bool)

(declare-fun e!49344 () ListLongMap!1407)

(assert (=> b!75555 (= e!49344 (ListLongMap!1408 Nil!1475))))

(declare-fun b!75556 () Bool)

(declare-fun res!39822 () Bool)

(assert (=> b!75556 (=> (not res!39822) (not e!49343))))

(assert (=> b!75556 (= res!39822 (not (contains!723 lt!34230 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!17967 () Bool)

(assert (=> d!17967 e!49343))

(declare-fun res!39823 () Bool)

(assert (=> d!17967 (=> (not res!39823) (not e!49343))))

(assert (=> d!17967 (= res!39823 (not (contains!723 lt!34230 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17967 (= lt!34230 e!49344)))

(declare-fun c!11480 () Bool)

(assert (=> d!17967 (= c!11480 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> d!17967 (validMask!0 (mask!6210 (v!2548 (underlying!265 thiss!992))))))

(assert (=> d!17967 (= (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))) lt!34230)))

(declare-fun b!75557 () Bool)

(assert (=> b!75557 (= e!49346 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!75557 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!75558 () Bool)

(assert (=> b!75558 (= e!49342 e!49345)))

(declare-fun c!11481 () Bool)

(assert (=> b!75558 (= c!11481 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun bm!6754 () Bool)

(assert (=> bm!6754 (= call!6757 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75559 () Bool)

(assert (=> b!75559 (= e!49345 (= lt!34230 (getCurrentListMapNoExtraKeys!60 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75560 () Bool)

(assert (=> b!75560 (= e!49344 e!49347)))

(declare-fun c!11483 () Bool)

(assert (=> b!75560 (= c!11483 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75561 () Bool)

(declare-fun lt!34233 () Unit!2157)

(declare-fun lt!34234 () Unit!2157)

(assert (=> b!75561 (= lt!34233 lt!34234)))

(declare-fun lt!34235 () (_ BitVec 64))

(declare-fun lt!34231 () (_ BitVec 64))

(declare-fun lt!34236 () V!2953)

(declare-fun lt!34232 () ListLongMap!1407)

(assert (=> b!75561 (not (contains!723 (+!95 lt!34232 (tuple2!2129 lt!34235 lt!34236)) lt!34231))))

(assert (=> b!75561 (= lt!34234 (addStillNotContains!27 lt!34232 lt!34235 lt!34236 lt!34231))))

(assert (=> b!75561 (= lt!34231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!75561 (= lt!34236 (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75561 (= lt!34235 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!75561 (= lt!34232 call!6757)))

(assert (=> b!75561 (= e!49347 (+!95 call!6757 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!17967 c!11480) b!75555))

(assert (= (and d!17967 (not c!11480)) b!75560))

(assert (= (and b!75560 c!11483) b!75561))

(assert (= (and b!75560 (not c!11483)) b!75550))

(assert (= (or b!75561 b!75550) bm!6754))

(assert (= (and d!17967 res!39823) b!75556))

(assert (= (and b!75556 res!39822) b!75553))

(assert (= (and b!75553 res!39824) b!75557))

(assert (= (and b!75553 c!11482) b!75554))

(assert (= (and b!75553 (not c!11482)) b!75558))

(assert (= (and b!75554 res!39821) b!75552))

(assert (= (and b!75558 c!11481) b!75559))

(assert (= (and b!75558 (not c!11481)) b!75551))

(declare-fun b_lambda!3399 () Bool)

(assert (=> (not b_lambda!3399) (not b!75552)))

(assert (=> b!75552 t!5045))

(declare-fun b_and!4625 () Bool)

(assert (= b_and!4621 (and (=> t!5045 result!2697) b_and!4625)))

(assert (=> b!75552 t!5047))

(declare-fun b_and!4627 () Bool)

(assert (= b_and!4623 (and (=> t!5047 result!2701) b_and!4627)))

(declare-fun b_lambda!3401 () Bool)

(assert (=> (not b_lambda!3401) (not b!75561)))

(assert (=> b!75561 t!5045))

(declare-fun b_and!4629 () Bool)

(assert (= b_and!4625 (and (=> t!5045 result!2697) b_and!4629)))

(assert (=> b!75561 t!5047))

(declare-fun b_and!4631 () Bool)

(assert (= b_and!4627 (and (=> t!5047 result!2701) b_and!4631)))

(declare-fun m!75185 () Bool)

(assert (=> b!75551 m!75185))

(declare-fun m!75187 () Bool)

(assert (=> b!75552 m!75187))

(assert (=> b!75552 m!75187))

(declare-fun m!75189 () Bool)

(assert (=> b!75552 m!75189))

(declare-fun m!75191 () Bool)

(assert (=> b!75552 m!75191))

(assert (=> b!75552 m!74481))

(declare-fun m!75193 () Bool)

(assert (=> b!75552 m!75193))

(assert (=> b!75552 m!75191))

(assert (=> b!75552 m!74481))

(assert (=> b!75561 m!75187))

(declare-fun m!75195 () Bool)

(assert (=> b!75561 m!75195))

(declare-fun m!75197 () Bool)

(assert (=> b!75561 m!75197))

(assert (=> b!75561 m!75191))

(assert (=> b!75561 m!74481))

(assert (=> b!75561 m!75193))

(declare-fun m!75199 () Bool)

(assert (=> b!75561 m!75199))

(declare-fun m!75201 () Bool)

(assert (=> b!75561 m!75201))

(assert (=> b!75561 m!75199))

(assert (=> b!75561 m!75191))

(assert (=> b!75561 m!74481))

(declare-fun m!75203 () Bool)

(assert (=> b!75556 m!75203))

(assert (=> b!75560 m!75187))

(assert (=> b!75560 m!75187))

(declare-fun m!75205 () Bool)

(assert (=> b!75560 m!75205))

(assert (=> b!75554 m!75187))

(assert (=> b!75554 m!75187))

(declare-fun m!75207 () Bool)

(assert (=> b!75554 m!75207))

(declare-fun m!75209 () Bool)

(assert (=> d!17967 m!75209))

(assert (=> d!17967 m!74529))

(declare-fun m!75211 () Bool)

(assert (=> bm!6754 m!75211))

(assert (=> b!75557 m!75187))

(assert (=> b!75557 m!75187))

(assert (=> b!75557 m!75205))

(assert (=> b!75559 m!75211))

(assert (=> bm!6716 d!17967))

(declare-fun b!75578 () Bool)

(declare-fun res!39833 () Bool)

(declare-fun e!49358 () Bool)

(assert (=> b!75578 (=> (not res!39833) (not e!49358))))

(declare-fun lt!34241 () SeekEntryResult!231)

(assert (=> b!75578 (= res!39833 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3059 lt!34241)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75578 (and (bvsge (index!3059 lt!34241) #b00000000000000000000000000000000) (bvslt (index!3059 lt!34241) (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75579 () Bool)

(declare-fun e!49356 () Bool)

(assert (=> b!75579 (= e!49356 ((_ is Undefined!231) lt!34241))))

(declare-fun b!75580 () Bool)

(assert (=> b!75580 (and (bvsge (index!3056 lt!34241) #b00000000000000000000000000000000) (bvslt (index!3056 lt!34241) (size!2095 (_keys!3889 newMap!16))))))

(declare-fun res!39836 () Bool)

(assert (=> b!75580 (= res!39836 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3056 lt!34241)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!49359 () Bool)

(assert (=> b!75580 (=> (not res!39836) (not e!49359))))

(declare-fun b!75581 () Bool)

(declare-fun e!49357 () Bool)

(assert (=> b!75581 (= e!49357 e!49356)))

(declare-fun c!11489 () Bool)

(assert (=> b!75581 (= c!11489 ((_ is MissingVacant!231) lt!34241))))

(declare-fun d!17969 () Bool)

(assert (=> d!17969 e!49357))

(declare-fun c!11488 () Bool)

(assert (=> d!17969 (= c!11488 ((_ is MissingZero!231) lt!34241))))

(assert (=> d!17969 (= lt!34241 (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(declare-fun lt!34242 () Unit!2157)

(declare-fun choose!435 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2157)

(assert (=> d!17969 (= lt!34242 (choose!435 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(assert (=> d!17969 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!17969 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)) lt!34242)))

(declare-fun call!6763 () Bool)

(declare-fun bm!6759 () Bool)

(assert (=> bm!6759 (= call!6763 (inRange!0 (ite c!11488 (index!3056 lt!34241) (index!3059 lt!34241)) (mask!6210 newMap!16)))))

(declare-fun b!75582 () Bool)

(declare-fun call!6762 () Bool)

(assert (=> b!75582 (= e!49358 (not call!6762))))

(declare-fun bm!6760 () Bool)

(assert (=> bm!6760 (= call!6762 (arrayContainsKey!0 (_keys!3889 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!75583 () Bool)

(assert (=> b!75583 (= e!49357 e!49359)))

(declare-fun res!39834 () Bool)

(assert (=> b!75583 (= res!39834 call!6763)))

(assert (=> b!75583 (=> (not res!39834) (not e!49359))))

(declare-fun b!75584 () Bool)

(declare-fun res!39835 () Bool)

(assert (=> b!75584 (=> (not res!39835) (not e!49358))))

(assert (=> b!75584 (= res!39835 call!6763)))

(assert (=> b!75584 (= e!49356 e!49358)))

(declare-fun b!75585 () Bool)

(assert (=> b!75585 (= e!49359 (not call!6762))))

(assert (= (and d!17969 c!11488) b!75583))

(assert (= (and d!17969 (not c!11488)) b!75581))

(assert (= (and b!75583 res!39834) b!75580))

(assert (= (and b!75580 res!39836) b!75585))

(assert (= (and b!75581 c!11489) b!75584))

(assert (= (and b!75581 (not c!11489)) b!75579))

(assert (= (and b!75584 res!39835) b!75578))

(assert (= (and b!75578 res!39833) b!75582))

(assert (= (or b!75583 b!75584) bm!6759))

(assert (= (or b!75585 b!75582) bm!6760))

(declare-fun m!75213 () Bool)

(assert (=> b!75580 m!75213))

(declare-fun m!75215 () Bool)

(assert (=> b!75578 m!75215))

(assert (=> d!17969 m!74477))

(assert (=> d!17969 m!74753))

(assert (=> d!17969 m!74477))

(declare-fun m!75217 () Bool)

(assert (=> d!17969 m!75217))

(assert (=> d!17969 m!75127))

(assert (=> bm!6760 m!74477))

(assert (=> bm!6760 m!74731))

(declare-fun m!75219 () Bool)

(assert (=> bm!6759 m!75219))

(assert (=> bm!6708 d!17969))

(declare-fun d!17971 () Bool)

(assert (=> d!17971 (= (get!1157 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2547 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> b!75066 d!17971))

(declare-fun d!17973 () Bool)

(assert (=> d!17973 (= (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75317 d!17973))

(declare-fun d!17975 () Bool)

(declare-fun lt!34245 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!80 (List!1478) (InoxSet tuple2!2128))

(assert (=> d!17975 (= lt!34245 (select (content!80 (toList!719 lt!34043)) lt!33758))))

(declare-fun e!49364 () Bool)

(assert (=> d!17975 (= lt!34245 e!49364)))

(declare-fun res!39842 () Bool)

(assert (=> d!17975 (=> (not res!39842) (not e!49364))))

(assert (=> d!17975 (= res!39842 ((_ is Cons!1474) (toList!719 lt!34043)))))

(assert (=> d!17975 (= (contains!724 (toList!719 lt!34043) lt!33758) lt!34245)))

(declare-fun b!75590 () Bool)

(declare-fun e!49365 () Bool)

(assert (=> b!75590 (= e!49364 e!49365)))

(declare-fun res!39841 () Bool)

(assert (=> b!75590 (=> res!39841 e!49365)))

(assert (=> b!75590 (= res!39841 (= (h!2062 (toList!719 lt!34043)) lt!33758))))

(declare-fun b!75591 () Bool)

(assert (=> b!75591 (= e!49365 (contains!724 (t!5048 (toList!719 lt!34043)) lt!33758))))

(assert (= (and d!17975 res!39842) b!75590))

(assert (= (and b!75590 (not res!39841)) b!75591))

(declare-fun m!75221 () Bool)

(assert (=> d!17975 m!75221))

(declare-fun m!75223 () Bool)

(assert (=> d!17975 m!75223))

(declare-fun m!75225 () Bool)

(assert (=> b!75591 m!75225))

(assert (=> b!75320 d!17975))

(declare-fun d!17977 () Bool)

(assert (=> d!17977 (isDefined!87 (getValueByKey!135 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun lt!34248 () Unit!2157)

(declare-fun choose!436 (List!1478 (_ BitVec 64)) Unit!2157)

(assert (=> d!17977 (= lt!34248 (choose!436 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun e!49368 () Bool)

(assert (=> d!17977 e!49368))

(declare-fun res!39845 () Bool)

(assert (=> d!17977 (=> (not res!39845) (not e!49368))))

(assert (=> d!17977 (= res!39845 (isStrictlySorted!280 (toList!719 lt!33764)))))

(assert (=> d!17977 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) lt!34248)))

(declare-fun b!75594 () Bool)

(assert (=> b!75594 (= e!49368 (containsKey!138 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (= (and d!17977 res!39845) b!75594))

(assert (=> d!17977 m!74477))

(assert (=> d!17977 m!74723))

(assert (=> d!17977 m!74723))

(assert (=> d!17977 m!74725))

(assert (=> d!17977 m!74477))

(declare-fun m!75227 () Bool)

(assert (=> d!17977 m!75227))

(declare-fun m!75229 () Bool)

(assert (=> d!17977 m!75229))

(assert (=> b!75594 m!74477))

(assert (=> b!75594 m!74719))

(assert (=> b!75146 d!17977))

(declare-fun d!17979 () Bool)

(declare-fun isEmpty!326 (Option!141) Bool)

(assert (=> d!17979 (= (isDefined!87 (getValueByKey!135 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))) (not (isEmpty!326 (getValueByKey!135 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))))

(declare-fun bs!3253 () Bool)

(assert (= bs!3253 d!17979))

(assert (=> bs!3253 m!74723))

(declare-fun m!75231 () Bool)

(assert (=> bs!3253 m!75231))

(assert (=> b!75146 d!17979))

(declare-fun b!75595 () Bool)

(declare-fun e!49369 () Option!141)

(assert (=> b!75595 (= e!49369 (Some!140 (_2!1075 (h!2062 (toList!719 lt!33764)))))))

(declare-fun d!17981 () Bool)

(declare-fun c!11490 () Bool)

(assert (=> d!17981 (= c!11490 (and ((_ is Cons!1474) (toList!719 lt!33764)) (= (_1!1075 (h!2062 (toList!719 lt!33764))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))))

(assert (=> d!17981 (= (getValueByKey!135 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) e!49369)))

(declare-fun b!75598 () Bool)

(declare-fun e!49370 () Option!141)

(assert (=> b!75598 (= e!49370 None!139)))

(declare-fun b!75596 () Bool)

(assert (=> b!75596 (= e!49369 e!49370)))

(declare-fun c!11491 () Bool)

(assert (=> b!75596 (= c!11491 (and ((_ is Cons!1474) (toList!719 lt!33764)) (not (= (_1!1075 (h!2062 (toList!719 lt!33764))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))))

(declare-fun b!75597 () Bool)

(assert (=> b!75597 (= e!49370 (getValueByKey!135 (t!5048 (toList!719 lt!33764)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (= (and d!17981 c!11490) b!75595))

(assert (= (and d!17981 (not c!11490)) b!75596))

(assert (= (and b!75596 c!11491) b!75597))

(assert (= (and b!75596 (not c!11491)) b!75598))

(assert (=> b!75597 m!74477))

(declare-fun m!75233 () Bool)

(assert (=> b!75597 m!75233))

(assert (=> b!75146 d!17981))

(assert (=> b!75270 d!17965))

(declare-fun d!17983 () Bool)

(declare-fun e!49371 () Bool)

(assert (=> d!17983 e!49371))

(declare-fun res!39846 () Bool)

(assert (=> d!17983 (=> res!39846 e!49371)))

(declare-fun lt!34250 () Bool)

(assert (=> d!17983 (= res!39846 (not lt!34250))))

(declare-fun lt!34252 () Bool)

(assert (=> d!17983 (= lt!34250 lt!34252)))

(declare-fun lt!34251 () Unit!2157)

(declare-fun e!49372 () Unit!2157)

(assert (=> d!17983 (= lt!34251 e!49372)))

(declare-fun c!11492 () Bool)

(assert (=> d!17983 (= c!11492 lt!34252)))

(assert (=> d!17983 (= lt!34252 (containsKey!138 (toList!719 lt!33886) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!17983 (= (contains!723 lt!33886 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!34250)))

(declare-fun b!75599 () Bool)

(declare-fun lt!34249 () Unit!2157)

(assert (=> b!75599 (= e!49372 lt!34249)))

(assert (=> b!75599 (= lt!34249 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!33886) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!75599 (isDefined!87 (getValueByKey!135 (toList!719 lt!33886) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!75600 () Bool)

(declare-fun Unit!2176 () Unit!2157)

(assert (=> b!75600 (= e!49372 Unit!2176)))

(declare-fun b!75601 () Bool)

(assert (=> b!75601 (= e!49371 (isDefined!87 (getValueByKey!135 (toList!719 lt!33886) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!17983 c!11492) b!75599))

(assert (= (and d!17983 (not c!11492)) b!75600))

(assert (= (and d!17983 (not res!39846)) b!75601))

(assert (=> d!17983 m!74669))

(declare-fun m!75235 () Bool)

(assert (=> d!17983 m!75235))

(assert (=> b!75599 m!74669))

(declare-fun m!75237 () Bool)

(assert (=> b!75599 m!75237))

(assert (=> b!75599 m!74669))

(assert (=> b!75599 m!74985))

(assert (=> b!75599 m!74985))

(declare-fun m!75239 () Bool)

(assert (=> b!75599 m!75239))

(assert (=> b!75601 m!74669))

(assert (=> b!75601 m!74985))

(assert (=> b!75601 m!74985))

(assert (=> b!75601 m!75239))

(assert (=> b!75134 d!17983))

(declare-fun d!17985 () Bool)

(declare-fun lt!34253 () Bool)

(assert (=> d!17985 (= lt!34253 (select (content!80 (toList!719 lt!34047)) lt!33758))))

(declare-fun e!49373 () Bool)

(assert (=> d!17985 (= lt!34253 e!49373)))

(declare-fun res!39848 () Bool)

(assert (=> d!17985 (=> (not res!39848) (not e!49373))))

(assert (=> d!17985 (= res!39848 ((_ is Cons!1474) (toList!719 lt!34047)))))

(assert (=> d!17985 (= (contains!724 (toList!719 lt!34047) lt!33758) lt!34253)))

(declare-fun b!75602 () Bool)

(declare-fun e!49374 () Bool)

(assert (=> b!75602 (= e!49373 e!49374)))

(declare-fun res!39847 () Bool)

(assert (=> b!75602 (=> res!39847 e!49374)))

(assert (=> b!75602 (= res!39847 (= (h!2062 (toList!719 lt!34047)) lt!33758))))

(declare-fun b!75603 () Bool)

(assert (=> b!75603 (= e!49374 (contains!724 (t!5048 (toList!719 lt!34047)) lt!33758))))

(assert (= (and d!17985 res!39848) b!75602))

(assert (= (and b!75602 (not res!39847)) b!75603))

(declare-fun m!75241 () Bool)

(assert (=> d!17985 m!75241))

(declare-fun m!75243 () Bool)

(assert (=> d!17985 m!75243))

(declare-fun m!75245 () Bool)

(assert (=> b!75603 m!75245))

(assert (=> b!75322 d!17985))

(declare-fun b!75604 () Bool)

(declare-fun e!49385 () ListLongMap!1407)

(declare-fun call!6766 () ListLongMap!1407)

(assert (=> b!75604 (= e!49385 (+!95 call!6766 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16))))))

(declare-fun b!75605 () Bool)

(declare-fun e!49384 () Bool)

(declare-fun e!49377 () Bool)

(assert (=> b!75605 (= e!49384 e!49377)))

(declare-fun c!11495 () Bool)

(assert (=> b!75605 (= c!11495 (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75606 () Bool)

(declare-fun e!49382 () Unit!2157)

(declare-fun Unit!2177 () Unit!2157)

(assert (=> b!75606 (= e!49382 Unit!2177)))

(declare-fun b!75607 () Bool)

(declare-fun res!39850 () Bool)

(assert (=> b!75607 (=> (not res!39850) (not e!49384))))

(declare-fun e!49376 () Bool)

(assert (=> b!75607 (= res!39850 e!49376)))

(declare-fun res!39853 () Bool)

(assert (=> b!75607 (=> res!39853 e!49376)))

(declare-fun e!49375 () Bool)

(assert (=> b!75607 (= res!39853 (not e!49375))))

(declare-fun res!39857 () Bool)

(assert (=> b!75607 (=> (not res!39857) (not e!49375))))

(assert (=> b!75607 (= res!39857 (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75608 () Bool)

(declare-fun e!49380 () Bool)

(declare-fun lt!34255 () ListLongMap!1407)

(assert (=> b!75608 (= e!49380 (= (apply!76 lt!34255 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2133 newMap!16)))))

(declare-fun b!75609 () Bool)

(declare-fun e!49379 () ListLongMap!1407)

(declare-fun call!6770 () ListLongMap!1407)

(assert (=> b!75609 (= e!49379 call!6770)))

(declare-fun b!75610 () Bool)

(declare-fun e!49378 () Bool)

(declare-fun call!6769 () Bool)

(assert (=> b!75610 (= e!49378 (not call!6769))))

(declare-fun b!75611 () Bool)

(assert (=> b!75611 (= e!49375 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75612 () Bool)

(declare-fun e!49387 () Bool)

(assert (=> b!75612 (= e!49387 (= (apply!76 lt!34255 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2133 newMap!16)))))

(declare-fun b!75613 () Bool)

(declare-fun lt!34256 () Unit!2157)

(assert (=> b!75613 (= e!49382 lt!34256)))

(declare-fun lt!34267 () ListLongMap!1407)

(assert (=> b!75613 (= lt!34267 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34269 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34269 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34261 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34261 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34263 () Unit!2157)

(assert (=> b!75613 (= lt!34263 (addStillContains!52 lt!34267 lt!34269 (zeroValue!2133 newMap!16) lt!34261))))

(assert (=> b!75613 (contains!723 (+!95 lt!34267 (tuple2!2129 lt!34269 (zeroValue!2133 newMap!16))) lt!34261)))

(declare-fun lt!34257 () Unit!2157)

(assert (=> b!75613 (= lt!34257 lt!34263)))

(declare-fun lt!34264 () ListLongMap!1407)

(assert (=> b!75613 (= lt!34264 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34270 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34270 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34260 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34260 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34259 () Unit!2157)

(assert (=> b!75613 (= lt!34259 (addApplyDifferent!52 lt!34264 lt!34270 (minValue!2133 newMap!16) lt!34260))))

(assert (=> b!75613 (= (apply!76 (+!95 lt!34264 (tuple2!2129 lt!34270 (minValue!2133 newMap!16))) lt!34260) (apply!76 lt!34264 lt!34260))))

(declare-fun lt!34258 () Unit!2157)

(assert (=> b!75613 (= lt!34258 lt!34259)))

(declare-fun lt!34273 () ListLongMap!1407)

(assert (=> b!75613 (= lt!34273 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34275 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34275 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34274 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34274 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34271 () Unit!2157)

(assert (=> b!75613 (= lt!34271 (addApplyDifferent!52 lt!34273 lt!34275 (zeroValue!2133 newMap!16) lt!34274))))

(assert (=> b!75613 (= (apply!76 (+!95 lt!34273 (tuple2!2129 lt!34275 (zeroValue!2133 newMap!16))) lt!34274) (apply!76 lt!34273 lt!34274))))

(declare-fun lt!34265 () Unit!2157)

(assert (=> b!75613 (= lt!34265 lt!34271)))

(declare-fun lt!34266 () ListLongMap!1407)

(assert (=> b!75613 (= lt!34266 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34272 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34272 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34268 () (_ BitVec 64))

(assert (=> b!75613 (= lt!34268 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75613 (= lt!34256 (addApplyDifferent!52 lt!34266 lt!34272 (minValue!2133 newMap!16) lt!34268))))

(assert (=> b!75613 (= (apply!76 (+!95 lt!34266 (tuple2!2129 lt!34272 (minValue!2133 newMap!16))) lt!34268) (apply!76 lt!34266 lt!34268))))

(declare-fun bm!6761 () Bool)

(declare-fun call!6768 () ListLongMap!1407)

(declare-fun call!6767 () ListLongMap!1407)

(assert (=> bm!6761 (= call!6768 call!6767)))

(declare-fun b!75614 () Bool)

(assert (=> b!75614 (= e!49385 e!49379)))

(declare-fun c!11496 () Bool)

(assert (=> b!75614 (= c!11496 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75615 () Bool)

(assert (=> b!75615 (= e!49378 e!49380)))

(declare-fun res!39849 () Bool)

(assert (=> b!75615 (= res!39849 call!6769)))

(assert (=> b!75615 (=> (not res!39849) (not e!49380))))

(declare-fun b!75616 () Bool)

(declare-fun call!6765 () Bool)

(assert (=> b!75616 (= e!49377 (not call!6765))))

(declare-fun bm!6763 () Bool)

(assert (=> bm!6763 (= call!6770 call!6766)))

(declare-fun bm!6764 () Bool)

(declare-fun call!6764 () ListLongMap!1407)

(assert (=> bm!6764 (= call!6764 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75617 () Bool)

(assert (=> b!75617 (= e!49377 e!49387)))

(declare-fun res!39856 () Bool)

(assert (=> b!75617 (= res!39856 call!6765)))

(assert (=> b!75617 (=> (not res!39856) (not e!49387))))

(declare-fun b!75618 () Bool)

(declare-fun e!49381 () ListLongMap!1407)

(assert (=> b!75618 (= e!49381 call!6768)))

(declare-fun b!75619 () Bool)

(declare-fun e!49386 () Bool)

(assert (=> b!75619 (= e!49376 e!49386)))

(declare-fun res!39854 () Bool)

(assert (=> b!75619 (=> (not res!39854) (not e!49386))))

(assert (=> b!75619 (= res!39854 (contains!723 lt!34255 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75619 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75620 () Bool)

(declare-fun e!49383 () Bool)

(assert (=> b!75620 (= e!49383 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6765 () Bool)

(assert (=> bm!6765 (= call!6767 call!6764)))

(declare-fun bm!6766 () Bool)

(assert (=> bm!6766 (= call!6765 (contains!723 lt!34255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75621 () Bool)

(declare-fun res!39851 () Bool)

(assert (=> b!75621 (=> (not res!39851) (not e!49384))))

(assert (=> b!75621 (= res!39851 e!49378)))

(declare-fun c!11494 () Bool)

(assert (=> b!75621 (= c!11494 (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6762 () Bool)

(assert (=> bm!6762 (= call!6769 (contains!723 lt!34255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!17987 () Bool)

(assert (=> d!17987 e!49384))

(declare-fun res!39852 () Bool)

(assert (=> d!17987 (=> (not res!39852) (not e!49384))))

(assert (=> d!17987 (= res!39852 (or (bvsge #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))))

(declare-fun lt!34254 () ListLongMap!1407)

(assert (=> d!17987 (= lt!34255 lt!34254)))

(declare-fun lt!34262 () Unit!2157)

(assert (=> d!17987 (= lt!34262 e!49382)))

(declare-fun c!11497 () Bool)

(assert (=> d!17987 (= c!11497 e!49383)))

(declare-fun res!39855 () Bool)

(assert (=> d!17987 (=> (not res!39855) (not e!49383))))

(assert (=> d!17987 (= res!39855 (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (=> d!17987 (= lt!34254 e!49385)))

(declare-fun c!11493 () Bool)

(assert (=> d!17987 (= c!11493 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!17987 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!17987 (= (getCurrentListMap!416 (_keys!3889 newMap!16) (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) lt!34255)))

(declare-fun b!75622 () Bool)

(declare-fun c!11498 () Bool)

(assert (=> b!75622 (= c!11498 (and (not (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75622 (= e!49379 e!49381)))

(declare-fun b!75623 () Bool)

(assert (=> b!75623 (= e!49381 call!6770)))

(declare-fun bm!6767 () Bool)

(assert (=> bm!6767 (= call!6766 (+!95 (ite c!11493 call!6764 (ite c!11496 call!6767 call!6768)) (ite (or c!11493 c!11496) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 newMap!16)) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 newMap!16)))))))

(declare-fun b!75624 () Bool)

(assert (=> b!75624 (= e!49386 (= (apply!76 lt!34255 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)) (get!1156 (select (arr!1857 (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977)) #b00000000000000000000000000000000) (dynLambda!331 (defaultEntry!2233 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2096 (ite (or c!11400 c!11392) (_values!2216 newMap!16) lt!33977))))))

(assert (=> b!75624 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (= (and d!17987 c!11493) b!75604))

(assert (= (and d!17987 (not c!11493)) b!75614))

(assert (= (and b!75614 c!11496) b!75609))

(assert (= (and b!75614 (not c!11496)) b!75622))

(assert (= (and b!75622 c!11498) b!75623))

(assert (= (and b!75622 (not c!11498)) b!75618))

(assert (= (or b!75623 b!75618) bm!6761))

(assert (= (or b!75609 bm!6761) bm!6765))

(assert (= (or b!75609 b!75623) bm!6763))

(assert (= (or b!75604 bm!6765) bm!6764))

(assert (= (or b!75604 bm!6763) bm!6767))

(assert (= (and d!17987 res!39855) b!75620))

(assert (= (and d!17987 c!11497) b!75613))

(assert (= (and d!17987 (not c!11497)) b!75606))

(assert (= (and d!17987 res!39852) b!75607))

(assert (= (and b!75607 res!39857) b!75611))

(assert (= (and b!75607 (not res!39853)) b!75619))

(assert (= (and b!75619 res!39854) b!75624))

(assert (= (and b!75607 res!39850) b!75621))

(assert (= (and b!75621 c!11494) b!75615))

(assert (= (and b!75621 (not c!11494)) b!75610))

(assert (= (and b!75615 res!39849) b!75608))

(assert (= (or b!75615 b!75610) bm!6762))

(assert (= (and b!75621 res!39851) b!75605))

(assert (= (and b!75605 c!11495) b!75617))

(assert (= (and b!75605 (not c!11495)) b!75616))

(assert (= (and b!75617 res!39856) b!75612))

(assert (= (or b!75617 b!75616) bm!6766))

(declare-fun b_lambda!3403 () Bool)

(assert (=> (not b_lambda!3403) (not b!75624)))

(assert (=> b!75624 t!5060))

(declare-fun b_and!4633 () Bool)

(assert (= b_and!4629 (and (=> t!5060 result!2717) b_and!4633)))

(assert (=> b!75624 t!5062))

(declare-fun b_and!4635 () Bool)

(assert (= b_and!4631 (and (=> t!5062 result!2719) b_and!4635)))

(declare-fun m!75247 () Bool)

(assert (=> bm!6762 m!75247))

(assert (=> d!17987 m!75127))

(declare-fun m!75249 () Bool)

(assert (=> b!75612 m!75249))

(assert (=> b!75619 m!75131))

(assert (=> b!75619 m!75131))

(declare-fun m!75251 () Bool)

(assert (=> b!75619 m!75251))

(declare-fun m!75253 () Bool)

(assert (=> b!75608 m!75253))

(assert (=> b!75620 m!75131))

(assert (=> b!75620 m!75131))

(assert (=> b!75620 m!75137))

(assert (=> b!75624 m!75131))

(declare-fun m!75255 () Bool)

(assert (=> b!75624 m!75255))

(assert (=> b!75624 m!75131))

(declare-fun m!75257 () Bool)

(assert (=> b!75624 m!75257))

(assert (=> b!75624 m!75255))

(assert (=> b!75624 m!75143))

(declare-fun m!75259 () Bool)

(assert (=> b!75624 m!75259))

(assert (=> b!75624 m!75143))

(declare-fun m!75261 () Bool)

(assert (=> bm!6767 m!75261))

(declare-fun m!75263 () Bool)

(assert (=> b!75613 m!75263))

(declare-fun m!75265 () Bool)

(assert (=> b!75613 m!75265))

(declare-fun m!75267 () Bool)

(assert (=> b!75613 m!75267))

(declare-fun m!75269 () Bool)

(assert (=> b!75613 m!75269))

(declare-fun m!75271 () Bool)

(assert (=> b!75613 m!75271))

(declare-fun m!75273 () Bool)

(assert (=> b!75613 m!75273))

(declare-fun m!75275 () Bool)

(assert (=> b!75613 m!75275))

(declare-fun m!75277 () Bool)

(assert (=> b!75613 m!75277))

(declare-fun m!75279 () Bool)

(assert (=> b!75613 m!75279))

(declare-fun m!75281 () Bool)

(assert (=> b!75613 m!75281))

(declare-fun m!75283 () Bool)

(assert (=> b!75613 m!75283))

(declare-fun m!75285 () Bool)

(assert (=> b!75613 m!75285))

(declare-fun m!75287 () Bool)

(assert (=> b!75613 m!75287))

(assert (=> b!75613 m!75131))

(assert (=> b!75613 m!75265))

(assert (=> b!75613 m!75287))

(declare-fun m!75289 () Bool)

(assert (=> b!75613 m!75289))

(declare-fun m!75291 () Bool)

(assert (=> b!75613 m!75291))

(assert (=> b!75613 m!75263))

(declare-fun m!75293 () Bool)

(assert (=> b!75613 m!75293))

(assert (=> b!75613 m!75281))

(assert (=> b!75611 m!75131))

(assert (=> b!75611 m!75131))

(assert (=> b!75611 m!75137))

(declare-fun m!75295 () Bool)

(assert (=> b!75604 m!75295))

(declare-fun m!75297 () Bool)

(assert (=> bm!6766 m!75297))

(assert (=> bm!6764 m!75277))

(assert (=> bm!6696 d!17987))

(declare-fun bm!6768 () Bool)

(declare-fun call!6771 () Bool)

(assert (=> bm!6768 (= call!6771 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75626 () Bool)

(declare-fun e!49388 () Bool)

(declare-fun e!49389 () Bool)

(assert (=> b!75626 (= e!49388 e!49389)))

(declare-fun lt!34277 () (_ BitVec 64))

(assert (=> b!75626 (= lt!34277 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!34276 () Unit!2157)

(assert (=> b!75626 (= lt!34276 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34277 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!75626 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34277 #b00000000000000000000000000000000)))

(declare-fun lt!34278 () Unit!2157)

(assert (=> b!75626 (= lt!34278 lt!34276)))

(declare-fun res!39859 () Bool)

(assert (=> b!75626 (= res!39859 (= (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))) (Found!231 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!75626 (=> (not res!39859) (not e!49389))))

(declare-fun b!75627 () Bool)

(assert (=> b!75627 (= e!49389 call!6771)))

(declare-fun b!75628 () Bool)

(assert (=> b!75628 (= e!49388 call!6771)))

(declare-fun b!75625 () Bool)

(declare-fun e!49390 () Bool)

(assert (=> b!75625 (= e!49390 e!49388)))

(declare-fun c!11499 () Bool)

(assert (=> b!75625 (= c!11499 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!17989 () Bool)

(declare-fun res!39858 () Bool)

(assert (=> d!17989 (=> res!39858 e!49390)))

(assert (=> d!17989 (= res!39858 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> d!17989 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))) e!49390)))

(assert (= (and d!17989 (not res!39858)) b!75625))

(assert (= (and b!75625 c!11499) b!75626))

(assert (= (and b!75625 (not c!11499)) b!75628))

(assert (= (and b!75626 res!39859) b!75627))

(assert (= (or b!75627 b!75628) bm!6768))

(declare-fun m!75299 () Bool)

(assert (=> bm!6768 m!75299))

(declare-fun m!75301 () Bool)

(assert (=> b!75626 m!75301))

(declare-fun m!75303 () Bool)

(assert (=> b!75626 m!75303))

(declare-fun m!75305 () Bool)

(assert (=> b!75626 m!75305))

(assert (=> b!75626 m!75301))

(declare-fun m!75307 () Bool)

(assert (=> b!75626 m!75307))

(assert (=> b!75625 m!75301))

(assert (=> b!75625 m!75301))

(declare-fun m!75309 () Bool)

(assert (=> b!75625 m!75309))

(assert (=> bm!6719 d!17989))

(declare-fun d!17991 () Bool)

(declare-fun lt!34281 () Bool)

(declare-fun content!81 (List!1479) (InoxSet (_ BitVec 64)))

(assert (=> d!17991 (= lt!34281 (select (content!81 Nil!1476) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun e!49396 () Bool)

(assert (=> d!17991 (= lt!34281 e!49396)))

(declare-fun res!39864 () Bool)

(assert (=> d!17991 (=> (not res!39864) (not e!49396))))

(assert (=> d!17991 (= res!39864 ((_ is Cons!1475) Nil!1476))))

(assert (=> d!17991 (= (contains!725 Nil!1476 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) lt!34281)))

(declare-fun b!75633 () Bool)

(declare-fun e!49395 () Bool)

(assert (=> b!75633 (= e!49396 e!49395)))

(declare-fun res!39865 () Bool)

(assert (=> b!75633 (=> res!39865 e!49395)))

(assert (=> b!75633 (= res!39865 (= (h!2063 Nil!1476) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75634 () Bool)

(assert (=> b!75634 (= e!49395 (contains!725 (t!5049 Nil!1476) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (= (and d!17991 res!39864) b!75633))

(assert (= (and b!75633 (not res!39865)) b!75634))

(declare-fun m!75311 () Bool)

(assert (=> d!17991 m!75311))

(assert (=> d!17991 m!74477))

(declare-fun m!75313 () Bool)

(assert (=> d!17991 m!75313))

(assert (=> b!75634 m!74477))

(declare-fun m!75315 () Bool)

(assert (=> b!75634 m!75315))

(assert (=> b!75359 d!17991))

(declare-fun b!75647 () Bool)

(declare-fun e!49404 () SeekEntryResult!231)

(declare-fun lt!34289 () SeekEntryResult!231)

(assert (=> b!75647 (= e!49404 (Found!231 (index!3058 lt!34289)))))

(declare-fun e!49405 () SeekEntryResult!231)

(declare-fun b!75649 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3891 (_ BitVec 32)) SeekEntryResult!231)

(assert (=> b!75649 (= e!49405 (seekKeyOrZeroReturnVacant!0 (x!11291 lt!34289) (index!3058 lt!34289) (index!3058 lt!34289) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(declare-fun b!75650 () Bool)

(declare-fun e!49403 () SeekEntryResult!231)

(assert (=> b!75650 (= e!49403 e!49404)))

(declare-fun lt!34290 () (_ BitVec 64))

(assert (=> b!75650 (= lt!34290 (select (arr!1856 (_keys!3889 newMap!16)) (index!3058 lt!34289)))))

(declare-fun c!11506 () Bool)

(assert (=> b!75650 (= c!11506 (= lt!34290 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(declare-fun b!75651 () Bool)

(assert (=> b!75651 (= e!49403 Undefined!231)))

(declare-fun b!75652 () Bool)

(assert (=> b!75652 (= e!49405 (MissingZero!231 (index!3058 lt!34289)))))

(declare-fun lt!34288 () SeekEntryResult!231)

(declare-fun d!17993 () Bool)

(assert (=> d!17993 (and (or ((_ is Undefined!231) lt!34288) (not ((_ is Found!231) lt!34288)) (and (bvsge (index!3057 lt!34288) #b00000000000000000000000000000000) (bvslt (index!3057 lt!34288) (size!2095 (_keys!3889 newMap!16))))) (or ((_ is Undefined!231) lt!34288) ((_ is Found!231) lt!34288) (not ((_ is MissingZero!231) lt!34288)) (and (bvsge (index!3056 lt!34288) #b00000000000000000000000000000000) (bvslt (index!3056 lt!34288) (size!2095 (_keys!3889 newMap!16))))) (or ((_ is Undefined!231) lt!34288) ((_ is Found!231) lt!34288) ((_ is MissingZero!231) lt!34288) (not ((_ is MissingVacant!231) lt!34288)) (and (bvsge (index!3059 lt!34288) #b00000000000000000000000000000000) (bvslt (index!3059 lt!34288) (size!2095 (_keys!3889 newMap!16))))) (or ((_ is Undefined!231) lt!34288) (ite ((_ is Found!231) lt!34288) (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!34288)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (ite ((_ is MissingZero!231) lt!34288) (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3056 lt!34288)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!231) lt!34288) (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3059 lt!34288)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!17993 (= lt!34288 e!49403)))

(declare-fun c!11507 () Bool)

(assert (=> d!17993 (= c!11507 (and ((_ is Intermediate!231) lt!34289) (undefined!1043 lt!34289)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3891 (_ BitVec 32)) SeekEntryResult!231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!17993 (= lt!34289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (mask!6210 newMap!16)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(assert (=> d!17993 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!17993 (= (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)) lt!34288)))

(declare-fun b!75648 () Bool)

(declare-fun c!11508 () Bool)

(assert (=> b!75648 (= c!11508 (= lt!34290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75648 (= e!49404 e!49405)))

(assert (= (and d!17993 c!11507) b!75651))

(assert (= (and d!17993 (not c!11507)) b!75650))

(assert (= (and b!75650 c!11506) b!75647))

(assert (= (and b!75650 (not c!11506)) b!75648))

(assert (= (and b!75648 c!11508) b!75652))

(assert (= (and b!75648 (not c!11508)) b!75649))

(assert (=> b!75649 m!74477))

(declare-fun m!75317 () Bool)

(assert (=> b!75649 m!75317))

(declare-fun m!75319 () Bool)

(assert (=> b!75650 m!75319))

(declare-fun m!75321 () Bool)

(assert (=> d!17993 m!75321))

(assert (=> d!17993 m!74477))

(declare-fun m!75323 () Bool)

(assert (=> d!17993 m!75323))

(declare-fun m!75325 () Bool)

(assert (=> d!17993 m!75325))

(assert (=> d!17993 m!75127))

(declare-fun m!75327 () Bool)

(assert (=> d!17993 m!75327))

(assert (=> d!17993 m!74477))

(assert (=> d!17993 m!75321))

(declare-fun m!75329 () Bool)

(assert (=> d!17993 m!75329))

(assert (=> b!75256 d!17993))

(assert (=> b!75148 d!17979))

(assert (=> b!75148 d!17981))

(declare-fun b!75661 () Bool)

(declare-fun e!49410 () (_ BitVec 32))

(assert (=> b!75661 (= e!49410 #b00000000000000000000000000000000)))

(declare-fun bm!6771 () Bool)

(declare-fun call!6774 () (_ BitVec 32))

(assert (=> bm!6771 (= call!6774 (arrayCountValidKeys!0 (_keys!3889 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75662 () Bool)

(declare-fun e!49411 () (_ BitVec 32))

(assert (=> b!75662 (= e!49410 e!49411)))

(declare-fun c!11514 () Bool)

(assert (=> b!75662 (= c!11514 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75663 () Bool)

(assert (=> b!75663 (= e!49411 call!6774)))

(declare-fun d!17995 () Bool)

(declare-fun lt!34293 () (_ BitVec 32))

(assert (=> d!17995 (and (bvsge lt!34293 #b00000000000000000000000000000000) (bvsle lt!34293 (bvsub (size!2095 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!17995 (= lt!34293 e!49410)))

(declare-fun c!11513 () Bool)

(assert (=> d!17995 (= c!11513 (bvsge #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (=> d!17995 (and (bvsle #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2095 (_keys!3889 newMap!16)) (size!2095 (_keys!3889 newMap!16))))))

(assert (=> d!17995 (= (arrayCountValidKeys!0 (_keys!3889 newMap!16) #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) lt!34293)))

(declare-fun b!75664 () Bool)

(assert (=> b!75664 (= e!49411 (bvadd #b00000000000000000000000000000001 call!6774))))

(assert (= (and d!17995 c!11513) b!75661))

(assert (= (and d!17995 (not c!11513)) b!75662))

(assert (= (and b!75662 c!11514) b!75664))

(assert (= (and b!75662 (not c!11514)) b!75663))

(assert (= (or b!75664 b!75663) bm!6771))

(declare-fun m!75331 () Bool)

(assert (=> bm!6771 m!75331))

(assert (=> b!75662 m!75131))

(assert (=> b!75662 m!75131))

(assert (=> b!75662 m!75137))

(assert (=> b!75074 d!17995))

(declare-fun d!17997 () Bool)

(declare-fun e!49412 () Bool)

(assert (=> d!17997 e!49412))

(declare-fun res!39867 () Bool)

(assert (=> d!17997 (=> (not res!39867) (not e!49412))))

(declare-fun lt!34297 () ListLongMap!1407)

(assert (=> d!17997 (= res!39867 (contains!723 lt!34297 (_1!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun lt!34295 () List!1478)

(assert (=> d!17997 (= lt!34297 (ListLongMap!1408 lt!34295))))

(declare-fun lt!34294 () Unit!2157)

(declare-fun lt!34296 () Unit!2157)

(assert (=> d!17997 (= lt!34294 lt!34296)))

(assert (=> d!17997 (= (getValueByKey!135 lt!34295 (_1!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17997 (= lt!34296 (lemmaContainsTupThenGetReturnValue!52 lt!34295 (_1!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17997 (= lt!34295 (insertStrictlySorted!55 (toList!719 call!6640) (_1!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!17997 (= (+!95 call!6640 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!34297)))

(declare-fun b!75665 () Bool)

(declare-fun res!39866 () Bool)

(assert (=> b!75665 (=> (not res!39866) (not e!49412))))

(assert (=> b!75665 (= res!39866 (= (getValueByKey!135 (toList!719 lt!34297) (_1!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun b!75666 () Bool)

(assert (=> b!75666 (= e!49412 (contains!724 (toList!719 lt!34297) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!17997 res!39867) b!75665))

(assert (= (and b!75665 res!39866) b!75666))

(declare-fun m!75333 () Bool)

(assert (=> d!17997 m!75333))

(declare-fun m!75335 () Bool)

(assert (=> d!17997 m!75335))

(declare-fun m!75337 () Bool)

(assert (=> d!17997 m!75337))

(declare-fun m!75339 () Bool)

(assert (=> d!17997 m!75339))

(declare-fun m!75341 () Bool)

(assert (=> b!75665 m!75341))

(declare-fun m!75343 () Bool)

(assert (=> b!75666 m!75343))

(assert (=> b!75119 d!17997))

(declare-fun b!75667 () Bool)

(declare-fun e!49413 () Bool)

(declare-fun call!6775 () Bool)

(assert (=> b!75667 (= e!49413 call!6775)))

(declare-fun d!17999 () Bool)

(declare-fun res!39869 () Bool)

(declare-fun e!49415 () Bool)

(assert (=> d!17999 (=> res!39869 e!49415)))

(assert (=> d!17999 (= res!39869 (bvsge #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (=> d!17999 (= (arrayNoDuplicates!0 (_keys!3889 newMap!16) #b00000000000000000000000000000000 Nil!1476) e!49415)))

(declare-fun b!75668 () Bool)

(assert (=> b!75668 (= e!49413 call!6775)))

(declare-fun b!75669 () Bool)

(declare-fun e!49416 () Bool)

(assert (=> b!75669 (= e!49416 (contains!725 Nil!1476 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6772 () Bool)

(declare-fun c!11515 () Bool)

(assert (=> bm!6772 (= call!6775 (arrayNoDuplicates!0 (_keys!3889 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!11515 (Cons!1475 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000) Nil!1476) Nil!1476)))))

(declare-fun b!75670 () Bool)

(declare-fun e!49414 () Bool)

(assert (=> b!75670 (= e!49415 e!49414)))

(declare-fun res!39870 () Bool)

(assert (=> b!75670 (=> (not res!39870) (not e!49414))))

(assert (=> b!75670 (= res!39870 (not e!49416))))

(declare-fun res!39868 () Bool)

(assert (=> b!75670 (=> (not res!39868) (not e!49416))))

(assert (=> b!75670 (= res!39868 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!75671 () Bool)

(assert (=> b!75671 (= e!49414 e!49413)))

(assert (=> b!75671 (= c!11515 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!17999 (not res!39869)) b!75670))

(assert (= (and b!75670 res!39868) b!75669))

(assert (= (and b!75670 res!39870) b!75671))

(assert (= (and b!75671 c!11515) b!75667))

(assert (= (and b!75671 (not c!11515)) b!75668))

(assert (= (or b!75667 b!75668) bm!6772))

(assert (=> b!75669 m!75131))

(assert (=> b!75669 m!75131))

(declare-fun m!75345 () Bool)

(assert (=> b!75669 m!75345))

(assert (=> bm!6772 m!75131))

(declare-fun m!75347 () Bool)

(assert (=> bm!6772 m!75347))

(assert (=> b!75670 m!75131))

(assert (=> b!75670 m!75131))

(assert (=> b!75670 m!75137))

(assert (=> b!75671 m!75131))

(assert (=> b!75671 m!75131))

(assert (=> b!75671 m!75137))

(assert (=> b!75076 d!17999))

(declare-fun d!18001 () Bool)

(assert (=> d!18001 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34055 #b00000000000000000000000000000000)))

(declare-fun lt!34300 () Unit!2157)

(declare-fun choose!13 (array!3891 (_ BitVec 64) (_ BitVec 32)) Unit!2157)

(assert (=> d!18001 (= lt!34300 (choose!13 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34055 #b00000000000000000000000000000000))))

(assert (=> d!18001 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!18001 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34055 #b00000000000000000000000000000000) lt!34300)))

(declare-fun bs!3254 () Bool)

(assert (= bs!3254 d!18001))

(assert (=> bs!3254 m!74865))

(declare-fun m!75349 () Bool)

(assert (=> bs!3254 m!75349))

(assert (=> b!75332 d!18001))

(declare-fun d!18003 () Bool)

(declare-fun res!39871 () Bool)

(declare-fun e!49417 () Bool)

(assert (=> d!18003 (=> res!39871 e!49417)))

(assert (=> d!18003 (= res!39871 (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) lt!34055))))

(assert (=> d!18003 (= (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34055 #b00000000000000000000000000000000) e!49417)))

(declare-fun b!75672 () Bool)

(declare-fun e!49418 () Bool)

(assert (=> b!75672 (= e!49417 e!49418)))

(declare-fun res!39872 () Bool)

(assert (=> b!75672 (=> (not res!39872) (not e!49418))))

(assert (=> b!75672 (= res!39872 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75673 () Bool)

(assert (=> b!75673 (= e!49418 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) lt!34055 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18003 (not res!39871)) b!75672))

(assert (= (and b!75672 res!39872) b!75673))

(assert (=> d!18003 m!74861))

(declare-fun m!75351 () Bool)

(assert (=> b!75673 m!75351))

(assert (=> b!75332 d!18003))

(declare-fun b!75674 () Bool)

(declare-fun e!49420 () SeekEntryResult!231)

(declare-fun lt!34302 () SeekEntryResult!231)

(assert (=> b!75674 (= e!49420 (Found!231 (index!3058 lt!34302)))))

(declare-fun b!75676 () Bool)

(declare-fun e!49421 () SeekEntryResult!231)

(assert (=> b!75676 (= e!49421 (seekKeyOrZeroReturnVacant!0 (x!11291 lt!34302) (index!3058 lt!34302) (index!3058 lt!34302) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75677 () Bool)

(declare-fun e!49419 () SeekEntryResult!231)

(assert (=> b!75677 (= e!49419 e!49420)))

(declare-fun lt!34303 () (_ BitVec 64))

(assert (=> b!75677 (= lt!34303 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (index!3058 lt!34302)))))

(declare-fun c!11516 () Bool)

(assert (=> b!75677 (= c!11516 (= lt!34303 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!75678 () Bool)

(assert (=> b!75678 (= e!49419 Undefined!231)))

(declare-fun b!75679 () Bool)

(assert (=> b!75679 (= e!49421 (MissingZero!231 (index!3058 lt!34302)))))

(declare-fun d!18005 () Bool)

(declare-fun lt!34301 () SeekEntryResult!231)

(assert (=> d!18005 (and (or ((_ is Undefined!231) lt!34301) (not ((_ is Found!231) lt!34301)) (and (bvsge (index!3057 lt!34301) #b00000000000000000000000000000000) (bvslt (index!3057 lt!34301) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))) (or ((_ is Undefined!231) lt!34301) ((_ is Found!231) lt!34301) (not ((_ is MissingZero!231) lt!34301)) (and (bvsge (index!3056 lt!34301) #b00000000000000000000000000000000) (bvslt (index!3056 lt!34301) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))) (or ((_ is Undefined!231) lt!34301) ((_ is Found!231) lt!34301) ((_ is MissingZero!231) lt!34301) (not ((_ is MissingVacant!231) lt!34301)) (and (bvsge (index!3059 lt!34301) #b00000000000000000000000000000000) (bvslt (index!3059 lt!34301) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))) (or ((_ is Undefined!231) lt!34301) (ite ((_ is Found!231) lt!34301) (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (index!3057 lt!34301)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!231) lt!34301) (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (index!3056 lt!34301)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!231) lt!34301) (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (index!3059 lt!34301)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18005 (= lt!34301 e!49419)))

(declare-fun c!11517 () Bool)

(assert (=> d!18005 (= c!11517 (and ((_ is Intermediate!231) lt!34302) (undefined!1043 lt!34302)))))

(assert (=> d!18005 (= lt!34302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) (mask!6210 (v!2548 (underlying!265 thiss!992)))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))))))

(assert (=> d!18005 (validMask!0 (mask!6210 (v!2548 (underlying!265 thiss!992))))))

(assert (=> d!18005 (= (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))) lt!34301)))

(declare-fun b!75675 () Bool)

(declare-fun c!11518 () Bool)

(assert (=> b!75675 (= c!11518 (= lt!34303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75675 (= e!49420 e!49421)))

(assert (= (and d!18005 c!11517) b!75678))

(assert (= (and d!18005 (not c!11517)) b!75677))

(assert (= (and b!75677 c!11516) b!75674))

(assert (= (and b!75677 (not c!11516)) b!75675))

(assert (= (and b!75675 c!11518) b!75679))

(assert (= (and b!75675 (not c!11518)) b!75676))

(assert (=> b!75676 m!74861))

(declare-fun m!75353 () Bool)

(assert (=> b!75676 m!75353))

(declare-fun m!75355 () Bool)

(assert (=> b!75677 m!75355))

(declare-fun m!75357 () Bool)

(assert (=> d!18005 m!75357))

(assert (=> d!18005 m!74861))

(declare-fun m!75359 () Bool)

(assert (=> d!18005 m!75359))

(declare-fun m!75361 () Bool)

(assert (=> d!18005 m!75361))

(assert (=> d!18005 m!74529))

(declare-fun m!75363 () Bool)

(assert (=> d!18005 m!75363))

(assert (=> d!18005 m!74861))

(assert (=> d!18005 m!75357))

(declare-fun m!75365 () Bool)

(assert (=> d!18005 m!75365))

(assert (=> b!75332 d!18005))

(declare-fun d!18007 () Bool)

(assert (=> d!18007 (= (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) (and (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75360 d!18007))

(declare-fun d!18009 () Bool)

(declare-fun e!49422 () Bool)

(assert (=> d!18009 e!49422))

(declare-fun res!39873 () Bool)

(assert (=> d!18009 (=> res!39873 e!49422)))

(declare-fun lt!34305 () Bool)

(assert (=> d!18009 (= res!39873 (not lt!34305))))

(declare-fun lt!34307 () Bool)

(assert (=> d!18009 (= lt!34305 lt!34307)))

(declare-fun lt!34306 () Unit!2157)

(declare-fun e!49423 () Unit!2157)

(assert (=> d!18009 (= lt!34306 e!49423)))

(declare-fun c!11519 () Bool)

(assert (=> d!18009 (= c!11519 lt!34307)))

(assert (=> d!18009 (= lt!34307 (containsKey!138 (toList!719 lt!34015) (_1!1075 lt!33761)))))

(assert (=> d!18009 (= (contains!723 lt!34015 (_1!1075 lt!33761)) lt!34305)))

(declare-fun b!75680 () Bool)

(declare-fun lt!34304 () Unit!2157)

(assert (=> b!75680 (= e!49423 lt!34304)))

(assert (=> b!75680 (= lt!34304 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!34015) (_1!1075 lt!33761)))))

(assert (=> b!75680 (isDefined!87 (getValueByKey!135 (toList!719 lt!34015) (_1!1075 lt!33761)))))

(declare-fun b!75681 () Bool)

(declare-fun Unit!2178 () Unit!2157)

(assert (=> b!75681 (= e!49423 Unit!2178)))

(declare-fun b!75682 () Bool)

(assert (=> b!75682 (= e!49422 (isDefined!87 (getValueByKey!135 (toList!719 lt!34015) (_1!1075 lt!33761))))))

(assert (= (and d!18009 c!11519) b!75680))

(assert (= (and d!18009 (not c!11519)) b!75681))

(assert (= (and d!18009 (not res!39873)) b!75682))

(declare-fun m!75367 () Bool)

(assert (=> d!18009 m!75367))

(declare-fun m!75369 () Bool)

(assert (=> b!75680 m!75369))

(assert (=> b!75680 m!74801))

(assert (=> b!75680 m!74801))

(declare-fun m!75371 () Bool)

(assert (=> b!75680 m!75371))

(assert (=> b!75682 m!74801))

(assert (=> b!75682 m!74801))

(assert (=> b!75682 m!75371))

(assert (=> d!17883 d!18009))

(declare-fun b!75683 () Bool)

(declare-fun e!49424 () Option!141)

(assert (=> b!75683 (= e!49424 (Some!140 (_2!1075 (h!2062 lt!34013))))))

(declare-fun d!18011 () Bool)

(declare-fun c!11520 () Bool)

(assert (=> d!18011 (= c!11520 (and ((_ is Cons!1474) lt!34013) (= (_1!1075 (h!2062 lt!34013)) (_1!1075 lt!33761))))))

(assert (=> d!18011 (= (getValueByKey!135 lt!34013 (_1!1075 lt!33761)) e!49424)))

(declare-fun b!75686 () Bool)

(declare-fun e!49425 () Option!141)

(assert (=> b!75686 (= e!49425 None!139)))

(declare-fun b!75684 () Bool)

(assert (=> b!75684 (= e!49424 e!49425)))

(declare-fun c!11521 () Bool)

(assert (=> b!75684 (= c!11521 (and ((_ is Cons!1474) lt!34013) (not (= (_1!1075 (h!2062 lt!34013)) (_1!1075 lt!33761)))))))

(declare-fun b!75685 () Bool)

(assert (=> b!75685 (= e!49425 (getValueByKey!135 (t!5048 lt!34013) (_1!1075 lt!33761)))))

(assert (= (and d!18011 c!11520) b!75683))

(assert (= (and d!18011 (not c!11520)) b!75684))

(assert (= (and b!75684 c!11521) b!75685))

(assert (= (and b!75684 (not c!11521)) b!75686))

(declare-fun m!75373 () Bool)

(assert (=> b!75685 m!75373))

(assert (=> d!17883 d!18011))

(declare-fun d!18013 () Bool)

(assert (=> d!18013 (= (getValueByKey!135 lt!34013 (_1!1075 lt!33761)) (Some!140 (_2!1075 lt!33761)))))

(declare-fun lt!34308 () Unit!2157)

(assert (=> d!18013 (= lt!34308 (choose!434 lt!34013 (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(declare-fun e!49426 () Bool)

(assert (=> d!18013 e!49426))

(declare-fun res!39874 () Bool)

(assert (=> d!18013 (=> (not res!39874) (not e!49426))))

(assert (=> d!18013 (= res!39874 (isStrictlySorted!280 lt!34013))))

(assert (=> d!18013 (= (lemmaContainsTupThenGetReturnValue!52 lt!34013 (_1!1075 lt!33761) (_2!1075 lt!33761)) lt!34308)))

(declare-fun b!75687 () Bool)

(declare-fun res!39875 () Bool)

(assert (=> b!75687 (=> (not res!39875) (not e!49426))))

(assert (=> b!75687 (= res!39875 (containsKey!138 lt!34013 (_1!1075 lt!33761)))))

(declare-fun b!75688 () Bool)

(assert (=> b!75688 (= e!49426 (contains!724 lt!34013 (tuple2!2129 (_1!1075 lt!33761) (_2!1075 lt!33761))))))

(assert (= (and d!18013 res!39874) b!75687))

(assert (= (and b!75687 res!39875) b!75688))

(assert (=> d!18013 m!74795))

(declare-fun m!75375 () Bool)

(assert (=> d!18013 m!75375))

(declare-fun m!75377 () Bool)

(assert (=> d!18013 m!75377))

(declare-fun m!75379 () Bool)

(assert (=> b!75687 m!75379))

(declare-fun m!75381 () Bool)

(assert (=> b!75688 m!75381))

(assert (=> d!17883 d!18013))

(declare-fun e!49430 () List!1478)

(declare-fun b!75689 () Bool)

(declare-fun c!11525 () Bool)

(declare-fun c!11524 () Bool)

(assert (=> b!75689 (= e!49430 (ite c!11525 (t!5048 (toList!719 (+!95 lt!33762 lt!33758))) (ite c!11524 (Cons!1474 (h!2062 (toList!719 (+!95 lt!33762 lt!33758))) (t!5048 (toList!719 (+!95 lt!33762 lt!33758)))) Nil!1475)))))

(declare-fun bm!6773 () Bool)

(declare-fun call!6777 () List!1478)

(declare-fun c!11523 () Bool)

(assert (=> bm!6773 (= call!6777 ($colon$colon!66 e!49430 (ite c!11523 (h!2062 (toList!719 (+!95 lt!33762 lt!33758))) (tuple2!2129 (_1!1075 lt!33761) (_2!1075 lt!33761)))))))

(declare-fun c!11522 () Bool)

(assert (=> bm!6773 (= c!11522 c!11523)))

(declare-fun b!75691 () Bool)

(declare-fun e!49427 () List!1478)

(assert (=> b!75691 (= e!49427 call!6777)))

(declare-fun b!75692 () Bool)

(declare-fun e!49428 () List!1478)

(declare-fun call!6776 () List!1478)

(assert (=> b!75692 (= e!49428 call!6776)))

(declare-fun b!75693 () Bool)

(assert (=> b!75693 (= c!11524 (and ((_ is Cons!1474) (toList!719 (+!95 lt!33762 lt!33758))) (bvsgt (_1!1075 (h!2062 (toList!719 (+!95 lt!33762 lt!33758)))) (_1!1075 lt!33761))))))

(declare-fun e!49431 () List!1478)

(assert (=> b!75693 (= e!49431 e!49428)))

(declare-fun b!75694 () Bool)

(declare-fun res!39877 () Bool)

(declare-fun e!49429 () Bool)

(assert (=> b!75694 (=> (not res!39877) (not e!49429))))

(declare-fun lt!34309 () List!1478)

(assert (=> b!75694 (= res!39877 (containsKey!138 lt!34309 (_1!1075 lt!33761)))))

(declare-fun d!18015 () Bool)

(assert (=> d!18015 e!49429))

(declare-fun res!39876 () Bool)

(assert (=> d!18015 (=> (not res!39876) (not e!49429))))

(assert (=> d!18015 (= res!39876 (isStrictlySorted!280 lt!34309))))

(assert (=> d!18015 (= lt!34309 e!49427)))

(assert (=> d!18015 (= c!11523 (and ((_ is Cons!1474) (toList!719 (+!95 lt!33762 lt!33758))) (bvslt (_1!1075 (h!2062 (toList!719 (+!95 lt!33762 lt!33758)))) (_1!1075 lt!33761))))))

(assert (=> d!18015 (isStrictlySorted!280 (toList!719 (+!95 lt!33762 lt!33758)))))

(assert (=> d!18015 (= (insertStrictlySorted!55 (toList!719 (+!95 lt!33762 lt!33758)) (_1!1075 lt!33761) (_2!1075 lt!33761)) lt!34309)))

(declare-fun b!75690 () Bool)

(declare-fun call!6778 () List!1478)

(assert (=> b!75690 (= e!49431 call!6778)))

(declare-fun b!75695 () Bool)

(assert (=> b!75695 (= e!49429 (contains!724 lt!34309 (tuple2!2129 (_1!1075 lt!33761) (_2!1075 lt!33761))))))

(declare-fun bm!6774 () Bool)

(assert (=> bm!6774 (= call!6778 call!6777)))

(declare-fun b!75696 () Bool)

(assert (=> b!75696 (= e!49430 (insertStrictlySorted!55 (t!5048 (toList!719 (+!95 lt!33762 lt!33758))) (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(declare-fun bm!6775 () Bool)

(assert (=> bm!6775 (= call!6776 call!6778)))

(declare-fun b!75697 () Bool)

(assert (=> b!75697 (= e!49428 call!6776)))

(declare-fun b!75698 () Bool)

(assert (=> b!75698 (= e!49427 e!49431)))

(assert (=> b!75698 (= c!11525 (and ((_ is Cons!1474) (toList!719 (+!95 lt!33762 lt!33758))) (= (_1!1075 (h!2062 (toList!719 (+!95 lt!33762 lt!33758)))) (_1!1075 lt!33761))))))

(assert (= (and d!18015 c!11523) b!75691))

(assert (= (and d!18015 (not c!11523)) b!75698))

(assert (= (and b!75698 c!11525) b!75690))

(assert (= (and b!75698 (not c!11525)) b!75693))

(assert (= (and b!75693 c!11524) b!75692))

(assert (= (and b!75693 (not c!11524)) b!75697))

(assert (= (or b!75692 b!75697) bm!6775))

(assert (= (or b!75690 bm!6775) bm!6774))

(assert (= (or b!75691 bm!6774) bm!6773))

(assert (= (and bm!6773 c!11522) b!75696))

(assert (= (and bm!6773 (not c!11522)) b!75689))

(assert (= (and d!18015 res!39876) b!75694))

(assert (= (and b!75694 res!39877) b!75695))

(declare-fun m!75383 () Bool)

(assert (=> b!75695 m!75383))

(declare-fun m!75385 () Bool)

(assert (=> b!75696 m!75385))

(declare-fun m!75387 () Bool)

(assert (=> bm!6773 m!75387))

(declare-fun m!75389 () Bool)

(assert (=> b!75694 m!75389))

(declare-fun m!75391 () Bool)

(assert (=> d!18015 m!75391))

(declare-fun m!75393 () Bool)

(assert (=> d!18015 m!75393))

(assert (=> d!17883 d!18015))

(declare-fun d!18017 () Bool)

(declare-fun e!49432 () Bool)

(assert (=> d!18017 e!49432))

(declare-fun res!39878 () Bool)

(assert (=> d!18017 (=> res!39878 e!49432)))

(declare-fun lt!34311 () Bool)

(assert (=> d!18017 (= res!39878 (not lt!34311))))

(declare-fun lt!34313 () Bool)

(assert (=> d!18017 (= lt!34311 lt!34313)))

(declare-fun lt!34312 () Unit!2157)

(declare-fun e!49433 () Unit!2157)

(assert (=> d!18017 (= lt!34312 e!49433)))

(declare-fun c!11526 () Bool)

(assert (=> d!18017 (= c!11526 lt!34313)))

(assert (=> d!18017 (= lt!34313 (containsKey!138 (toList!719 lt!33886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18017 (= (contains!723 lt!33886 #b1000000000000000000000000000000000000000000000000000000000000000) lt!34311)))

(declare-fun b!75699 () Bool)

(declare-fun lt!34310 () Unit!2157)

(assert (=> b!75699 (= e!49433 lt!34310)))

(assert (=> b!75699 (= lt!34310 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!33886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75699 (isDefined!87 (getValueByKey!135 (toList!719 lt!33886) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75700 () Bool)

(declare-fun Unit!2179 () Unit!2157)

(assert (=> b!75700 (= e!49433 Unit!2179)))

(declare-fun b!75701 () Bool)

(assert (=> b!75701 (= e!49432 (isDefined!87 (getValueByKey!135 (toList!719 lt!33886) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18017 c!11526) b!75699))

(assert (= (and d!18017 (not c!11526)) b!75700))

(assert (= (and d!18017 (not res!39878)) b!75701))

(declare-fun m!75395 () Bool)

(assert (=> d!18017 m!75395))

(declare-fun m!75397 () Bool)

(assert (=> b!75699 m!75397))

(assert (=> b!75699 m!75053))

(assert (=> b!75699 m!75053))

(declare-fun m!75399 () Bool)

(assert (=> b!75699 m!75399))

(assert (=> b!75701 m!75053))

(assert (=> b!75701 m!75053))

(assert (=> b!75701 m!75399))

(assert (=> bm!6640 d!18017))

(declare-fun d!18019 () Bool)

(declare-fun res!39879 () Bool)

(declare-fun e!49434 () Bool)

(assert (=> d!18019 (=> res!39879 e!49434)))

(assert (=> d!18019 (= res!39879 (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> d!18019 (= (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!49434)))

(declare-fun b!75702 () Bool)

(declare-fun e!49435 () Bool)

(assert (=> b!75702 (= e!49434 e!49435)))

(declare-fun res!39880 () Bool)

(assert (=> b!75702 (=> (not res!39880) (not e!49435))))

(assert (=> b!75702 (= res!39880 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(declare-fun b!75703 () Bool)

(assert (=> b!75703 (= e!49435 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!18019 (not res!39879)) b!75702))

(assert (= (and b!75702 res!39880) b!75703))

(assert (=> d!18019 m!75187))

(assert (=> b!75703 m!74477))

(declare-fun m!75401 () Bool)

(assert (=> b!75703 m!75401))

(assert (=> b!75340 d!18019))

(assert (=> b!75259 d!17965))

(declare-fun d!18021 () Bool)

(assert (=> d!18021 (= (inRange!0 (ite c!11392 (ite c!11401 (index!3057 lt!33997) (ite c!11393 (index!3056 lt!33973) (index!3059 lt!33973))) (ite c!11404 (index!3057 lt!33987) (ite c!11398 (index!3056 lt!33999) (index!3059 lt!33999)))) (mask!6210 newMap!16)) (and (bvsge (ite c!11392 (ite c!11401 (index!3057 lt!33997) (ite c!11393 (index!3056 lt!33973) (index!3059 lt!33973))) (ite c!11404 (index!3057 lt!33987) (ite c!11398 (index!3056 lt!33999) (index!3059 lt!33999)))) #b00000000000000000000000000000000) (bvslt (ite c!11392 (ite c!11401 (index!3057 lt!33997) (ite c!11393 (index!3056 lt!33973) (index!3059 lt!33973))) (ite c!11404 (index!3057 lt!33987) (ite c!11398 (index!3056 lt!33999) (index!3059 lt!33999)))) (bvadd (mask!6210 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!6690 d!18021))

(declare-fun d!18023 () Bool)

(declare-fun isEmpty!327 (List!1478) Bool)

(assert (=> d!18023 (= (isEmpty!325 lt!34030) (isEmpty!327 (toList!719 lt!34030)))))

(declare-fun bs!3255 () Bool)

(assert (= bs!3255 d!18023))

(declare-fun m!75403 () Bool)

(assert (=> bs!3255 m!75403))

(assert (=> b!75308 d!18023))

(declare-fun d!18025 () Bool)

(declare-fun res!39881 () Bool)

(declare-fun e!49436 () Bool)

(assert (=> d!18025 (=> res!39881 e!49436)))

(assert (=> d!18025 (= res!39881 (= (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> d!18025 (= (arrayContainsKey!0 (_keys!3889 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b00000000000000000000000000000000) e!49436)))

(declare-fun b!75704 () Bool)

(declare-fun e!49437 () Bool)

(assert (=> b!75704 (= e!49436 e!49437)))

(declare-fun res!39882 () Bool)

(assert (=> b!75704 (=> (not res!39882) (not e!49437))))

(assert (=> b!75704 (= res!39882 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75705 () Bool)

(assert (=> b!75705 (= e!49437 (arrayContainsKey!0 (_keys!3889 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!18025 (not res!39881)) b!75704))

(assert (= (and b!75704 res!39882) b!75705))

(assert (=> d!18025 m!75131))

(assert (=> b!75705 m!74477))

(declare-fun m!75405 () Bool)

(assert (=> b!75705 m!75405))

(assert (=> bm!6707 d!18025))

(declare-fun d!18027 () Bool)

(declare-fun res!39887 () Bool)

(declare-fun e!49442 () Bool)

(assert (=> d!18027 (=> res!39887 e!49442)))

(assert (=> d!18027 (= res!39887 (and ((_ is Cons!1474) (toList!719 lt!33764)) (= (_1!1075 (h!2062 (toList!719 lt!33764))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))))

(assert (=> d!18027 (= (containsKey!138 (toList!719 lt!33764) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)) e!49442)))

(declare-fun b!75710 () Bool)

(declare-fun e!49443 () Bool)

(assert (=> b!75710 (= e!49442 e!49443)))

(declare-fun res!39888 () Bool)

(assert (=> b!75710 (=> (not res!39888) (not e!49443))))

(assert (=> b!75710 (= res!39888 (and (or (not ((_ is Cons!1474) (toList!719 lt!33764))) (bvsle (_1!1075 (h!2062 (toList!719 lt!33764))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))) ((_ is Cons!1474) (toList!719 lt!33764)) (bvslt (_1!1075 (h!2062 (toList!719 lt!33764))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355))))))

(declare-fun b!75711 () Bool)

(assert (=> b!75711 (= e!49443 (containsKey!138 (t!5048 (toList!719 lt!33764)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (= (and d!18027 (not res!39887)) b!75710))

(assert (= (and b!75710 res!39888) b!75711))

(assert (=> b!75711 m!74477))

(declare-fun m!75407 () Bool)

(assert (=> b!75711 m!75407))

(assert (=> d!17873 d!18027))

(declare-fun d!18029 () Bool)

(assert (=> d!18029 (= (+!95 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) lt!33986 lt!33768 (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34316 () Unit!2157)

(declare-fun choose!437 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2157)

(assert (=> d!18029 (= lt!34316 (choose!437 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) lt!33986 (zeroValue!2133 newMap!16) lt!33768 (minValue!2133 newMap!16) (defaultEntry!2233 newMap!16)))))

(assert (=> d!18029 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!18029 (= (lemmaChangeZeroKeyThenAddPairToListMap!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) lt!33986 (zeroValue!2133 newMap!16) lt!33768 (minValue!2133 newMap!16) (defaultEntry!2233 newMap!16)) lt!34316)))

(declare-fun bs!3256 () Bool)

(assert (= bs!3256 d!18029))

(assert (=> bs!3256 m!75127))

(assert (=> bs!3256 m!74663))

(declare-fun m!75409 () Bool)

(assert (=> bs!3256 m!75409))

(declare-fun m!75411 () Bool)

(assert (=> bs!3256 m!75411))

(declare-fun m!75413 () Bool)

(assert (=> bs!3256 m!75413))

(assert (=> bs!3256 m!74663))

(assert (=> b!75235 d!18029))

(declare-fun d!18031 () Bool)

(declare-fun e!49444 () Bool)

(assert (=> d!18031 e!49444))

(declare-fun res!39890 () Bool)

(assert (=> d!18031 (=> (not res!39890) (not e!49444))))

(declare-fun lt!34320 () ListLongMap!1407)

(assert (=> d!18031 (= res!39890 (contains!723 lt!34320 (_1!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun lt!34318 () List!1478)

(assert (=> d!18031 (= lt!34320 (ListLongMap!1408 lt!34318))))

(declare-fun lt!34317 () Unit!2157)

(declare-fun lt!34319 () Unit!2157)

(assert (=> d!18031 (= lt!34317 lt!34319)))

(assert (=> d!18031 (= (getValueByKey!135 lt!34318 (_1!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))) (Some!140 (_2!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(assert (=> d!18031 (= lt!34319 (lemmaContainsTupThenGetReturnValue!52 lt!34318 (_1!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (_2!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(assert (=> d!18031 (= lt!34318 (insertStrictlySorted!55 (toList!719 (ite c!11354 call!6638 (ite c!11357 call!6641 call!6642))) (_1!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (_2!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(assert (=> d!18031 (= (+!95 (ite c!11354 call!6638 (ite c!11357 call!6641 call!6642)) (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!34320)))

(declare-fun b!75712 () Bool)

(declare-fun res!39889 () Bool)

(assert (=> b!75712 (=> (not res!39889) (not e!49444))))

(assert (=> b!75712 (= res!39889 (= (getValueByKey!135 (toList!719 lt!34320) (_1!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))) (Some!140 (_2!1075 (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))))

(declare-fun b!75713 () Bool)

(assert (=> b!75713 (= e!49444 (contains!724 (toList!719 lt!34320) (ite (or c!11354 c!11357) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (= (and d!18031 res!39890) b!75712))

(assert (= (and b!75712 res!39889) b!75713))

(declare-fun m!75415 () Bool)

(assert (=> d!18031 m!75415))

(declare-fun m!75417 () Bool)

(assert (=> d!18031 m!75417))

(declare-fun m!75419 () Bool)

(assert (=> d!18031 m!75419))

(declare-fun m!75421 () Bool)

(assert (=> d!18031 m!75421))

(declare-fun m!75423 () Bool)

(assert (=> b!75712 m!75423))

(declare-fun m!75425 () Bool)

(assert (=> b!75713 m!75425))

(assert (=> bm!6641 d!18031))

(declare-fun d!18033 () Bool)

(declare-fun e!49447 () Bool)

(assert (=> d!18033 e!49447))

(declare-fun c!11529 () Bool)

(assert (=> d!18033 (= c!11529 (and (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!18033 true))

(declare-fun _$29!93 () Unit!2157)

(assert (=> d!18033 (= (choose!433 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (_values!2216 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992))) (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) (minValue!2133 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992)))) _$29!93)))

(declare-fun b!75718 () Bool)

(assert (=> b!75718 (= e!49447 (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!75719 () Bool)

(assert (=> b!75719 (= e!49447 (ite (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2088 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!18033 c!11529) b!75718))

(assert (= (and d!18033 (not c!11529)) b!75719))

(assert (=> b!75718 m!74477))

(assert (=> b!75718 m!74509))

(assert (=> d!17903 d!18033))

(assert (=> d!17903 d!17893))

(assert (=> b!75126 d!17973))

(declare-fun d!18035 () Bool)

(declare-fun lt!34321 () Bool)

(assert (=> d!18035 (= lt!34321 (select (content!80 (toList!719 lt!34011)) lt!33761))))

(declare-fun e!49448 () Bool)

(assert (=> d!18035 (= lt!34321 e!49448)))

(declare-fun res!39892 () Bool)

(assert (=> d!18035 (=> (not res!39892) (not e!49448))))

(assert (=> d!18035 (= res!39892 ((_ is Cons!1474) (toList!719 lt!34011)))))

(assert (=> d!18035 (= (contains!724 (toList!719 lt!34011) lt!33761) lt!34321)))

(declare-fun b!75720 () Bool)

(declare-fun e!49449 () Bool)

(assert (=> b!75720 (= e!49448 e!49449)))

(declare-fun res!39891 () Bool)

(assert (=> b!75720 (=> res!39891 e!49449)))

(assert (=> b!75720 (= res!39891 (= (h!2062 (toList!719 lt!34011)) lt!33761))))

(declare-fun b!75721 () Bool)

(assert (=> b!75721 (= e!49449 (contains!724 (t!5048 (toList!719 lt!34011)) lt!33761))))

(assert (= (and d!18035 res!39892) b!75720))

(assert (= (and b!75720 (not res!39891)) b!75721))

(declare-fun m!75427 () Bool)

(assert (=> d!18035 m!75427))

(declare-fun m!75429 () Bool)

(assert (=> d!18035 m!75429))

(declare-fun m!75431 () Bool)

(assert (=> b!75721 m!75431))

(assert (=> b!75280 d!18035))

(declare-fun d!18037 () Bool)

(declare-fun e!49450 () Bool)

(assert (=> d!18037 e!49450))

(declare-fun res!39893 () Bool)

(assert (=> d!18037 (=> res!39893 e!49450)))

(declare-fun lt!34323 () Bool)

(assert (=> d!18037 (= res!39893 (not lt!34323))))

(declare-fun lt!34325 () Bool)

(assert (=> d!18037 (= lt!34323 lt!34325)))

(declare-fun lt!34324 () Unit!2157)

(declare-fun e!49451 () Unit!2157)

(assert (=> d!18037 (= lt!34324 e!49451)))

(declare-fun c!11530 () Bool)

(assert (=> d!18037 (= c!11530 lt!34325)))

(assert (=> d!18037 (= lt!34325 (containsKey!138 (toList!719 call!6714) (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33994))))))

(assert (=> d!18037 (= (contains!723 call!6714 (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33994))) lt!34323)))

(declare-fun b!75722 () Bool)

(declare-fun lt!34322 () Unit!2157)

(assert (=> b!75722 (= e!49451 lt!34322)))

(assert (=> b!75722 (= lt!34322 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 call!6714) (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33994))))))

(assert (=> b!75722 (isDefined!87 (getValueByKey!135 (toList!719 call!6714) (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33994))))))

(declare-fun b!75723 () Bool)

(declare-fun Unit!2180 () Unit!2157)

(assert (=> b!75723 (= e!49451 Unit!2180)))

(declare-fun b!75724 () Bool)

(assert (=> b!75724 (= e!49450 (isDefined!87 (getValueByKey!135 (toList!719 call!6714) (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33994)))))))

(assert (= (and d!18037 c!11530) b!75722))

(assert (= (and d!18037 (not c!11530)) b!75723))

(assert (= (and d!18037 (not res!39893)) b!75724))

(assert (=> d!18037 m!74765))

(declare-fun m!75433 () Bool)

(assert (=> d!18037 m!75433))

(assert (=> b!75722 m!74765))

(declare-fun m!75435 () Bool)

(assert (=> b!75722 m!75435))

(assert (=> b!75722 m!74765))

(declare-fun m!75437 () Bool)

(assert (=> b!75722 m!75437))

(assert (=> b!75722 m!75437))

(declare-fun m!75439 () Bool)

(assert (=> b!75722 m!75439))

(assert (=> b!75724 m!74765))

(assert (=> b!75724 m!75437))

(assert (=> b!75724 m!75437))

(assert (=> b!75724 m!75439))

(assert (=> b!75247 d!18037))

(declare-fun d!18039 () Bool)

(declare-fun e!49454 () Bool)

(assert (=> d!18039 e!49454))

(declare-fun res!39896 () Bool)

(assert (=> d!18039 (=> (not res!39896) (not e!49454))))

(assert (=> d!18039 (= res!39896 (and (bvsge (index!3057 lt!33994) #b00000000000000000000000000000000) (bvslt (index!3057 lt!33994) (size!2095 (_keys!3889 newMap!16)))))))

(declare-fun lt!34328 () Unit!2157)

(declare-fun choose!438 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) Int) Unit!2157)

(assert (=> d!18039 (= lt!34328 (choose!438 (_keys!3889 newMap!16) lt!33977 (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3057 lt!33994) (defaultEntry!2233 newMap!16)))))

(assert (=> d!18039 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!18039 (= (lemmaValidKeyInArrayIsInListMap!85 (_keys!3889 newMap!16) lt!33977 (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3057 lt!33994) (defaultEntry!2233 newMap!16)) lt!34328)))

(declare-fun b!75727 () Bool)

(assert (=> b!75727 (= e!49454 (contains!723 (getCurrentListMap!416 (_keys!3889 newMap!16) lt!33977 (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!33994))))))

(assert (= (and d!18039 res!39896) b!75727))

(declare-fun m!75441 () Bool)

(assert (=> d!18039 m!75441))

(assert (=> d!18039 m!75127))

(declare-fun m!75443 () Bool)

(assert (=> b!75727 m!75443))

(assert (=> b!75727 m!74765))

(assert (=> b!75727 m!75443))

(assert (=> b!75727 m!74765))

(declare-fun m!75445 () Bool)

(assert (=> b!75727 m!75445))

(assert (=> b!75247 d!18039))

(declare-fun d!18041 () Bool)

(declare-fun e!49457 () Bool)

(assert (=> d!18041 e!49457))

(declare-fun res!39899 () Bool)

(assert (=> d!18041 (=> (not res!39899) (not e!49457))))

(assert (=> d!18041 (= res!39899 (and (bvsge (index!3057 lt!33994) #b00000000000000000000000000000000) (bvslt (index!3057 lt!33994) (size!2096 (_values!2216 newMap!16)))))))

(declare-fun lt!34331 () Unit!2157)

(declare-fun choose!439 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 32) (_ BitVec 64) V!2953 Int) Unit!2157)

(assert (=> d!18041 (= lt!34331 (choose!439 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3057 lt!33994) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 (defaultEntry!2233 newMap!16)))))

(assert (=> d!18041 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!18041 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (index!3057 lt!33994) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768 (defaultEntry!2233 newMap!16)) lt!34331)))

(declare-fun b!75730 () Bool)

(assert (=> b!75730 (= e!49457 (= (+!95 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (getCurrentListMap!416 (_keys!3889 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16))) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16))))))

(assert (= (and d!18041 res!39899) b!75730))

(assert (=> d!18041 m!74477))

(declare-fun m!75447 () Bool)

(assert (=> d!18041 m!75447))

(assert (=> d!18041 m!75127))

(assert (=> b!75730 m!74663))

(assert (=> b!75730 m!74663))

(assert (=> b!75730 m!74927))

(assert (=> b!75730 m!74733))

(declare-fun m!75449 () Bool)

(assert (=> b!75730 m!75449))

(assert (=> b!75247 d!18041))

(declare-fun d!18043 () Bool)

(declare-fun res!39900 () Bool)

(declare-fun e!49458 () Bool)

(assert (=> d!18043 (=> (not res!39900) (not e!49458))))

(assert (=> d!18043 (= res!39900 (simpleValid!52 (v!2548 (underlying!265 thiss!992))))))

(assert (=> d!18043 (= (valid!309 (v!2548 (underlying!265 thiss!992))) e!49458)))

(declare-fun b!75731 () Bool)

(declare-fun res!39901 () Bool)

(assert (=> b!75731 (=> (not res!39901) (not e!49458))))

(assert (=> b!75731 (= res!39901 (= (arrayCountValidKeys!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000 (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))) (_size!399 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75732 () Bool)

(declare-fun res!39902 () Bool)

(assert (=> b!75732 (=> (not res!39902) (not e!49458))))

(assert (=> b!75732 (= res!39902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (mask!6210 (v!2548 (underlying!265 thiss!992)))))))

(declare-fun b!75733 () Bool)

(assert (=> b!75733 (= e!49458 (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000 Nil!1476))))

(assert (= (and d!18043 res!39900) b!75731))

(assert (= (and b!75731 res!39901) b!75732))

(assert (= (and b!75732 res!39902) b!75733))

(declare-fun m!75451 () Bool)

(assert (=> d!18043 m!75451))

(declare-fun m!75453 () Bool)

(assert (=> b!75731 m!75453))

(assert (=> b!75732 m!74485))

(declare-fun m!75455 () Bool)

(assert (=> b!75733 m!75455))

(assert (=> d!17907 d!18043))

(assert (=> d!17899 d!17905))

(declare-fun d!18045 () Bool)

(assert (=> d!18045 (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) from!355 Nil!1476)))

(assert (=> d!18045 true))

(declare-fun _$71!99 () Unit!2157)

(assert (=> d!18045 (= (choose!39 (_keys!3889 (v!2548 (underlying!265 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!99)))

(declare-fun bs!3257 () Bool)

(assert (= bs!3257 d!18045))

(assert (=> bs!3257 m!74505))

(assert (=> d!17899 d!18045))

(declare-fun d!18047 () Bool)

(declare-fun e!49459 () Bool)

(assert (=> d!18047 e!49459))

(declare-fun res!39904 () Bool)

(assert (=> d!18047 (=> (not res!39904) (not e!49459))))

(declare-fun lt!34335 () ListLongMap!1407)

(assert (=> d!18047 (= res!39904 (contains!723 lt!34335 (_1!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))))

(declare-fun lt!34333 () List!1478)

(assert (=> d!18047 (= lt!34335 (ListLongMap!1408 lt!34333))))

(declare-fun lt!34332 () Unit!2157)

(declare-fun lt!34334 () Unit!2157)

(assert (=> d!18047 (= lt!34332 lt!34334)))

(assert (=> d!18047 (= (getValueByKey!135 lt!34333 (_1!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))) (Some!140 (_2!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))))

(assert (=> d!18047 (= lt!34334 (lemmaContainsTupThenGetReturnValue!52 lt!34333 (_1!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (_2!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))))

(assert (=> d!18047 (= lt!34333 (insertStrictlySorted!55 (toList!719 e!49165) (_1!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (_2!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))))

(assert (=> d!18047 (= (+!95 e!49165 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) lt!34335)))

(declare-fun b!75734 () Bool)

(declare-fun res!39903 () Bool)

(assert (=> b!75734 (=> (not res!39903) (not e!49459))))

(assert (=> b!75734 (= res!39903 (= (getValueByKey!135 (toList!719 lt!34335) (_1!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))) (Some!140 (_2!1075 (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))))

(declare-fun b!75735 () Bool)

(assert (=> b!75735 (= e!49459 (contains!724 (toList!719 lt!34335) (ite c!11400 (ite c!11399 (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 lt!33768) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (= (and d!18047 res!39904) b!75734))

(assert (= (and b!75734 res!39903) b!75735))

(declare-fun m!75457 () Bool)

(assert (=> d!18047 m!75457))

(declare-fun m!75459 () Bool)

(assert (=> d!18047 m!75459))

(declare-fun m!75461 () Bool)

(assert (=> d!18047 m!75461))

(declare-fun m!75463 () Bool)

(assert (=> d!18047 m!75463))

(declare-fun m!75465 () Bool)

(assert (=> b!75734 m!75465))

(declare-fun m!75467 () Bool)

(assert (=> b!75735 m!75467))

(assert (=> bm!6693 d!18047))

(assert (=> bm!6705 d!17993))

(declare-fun d!18049 () Bool)

(assert (=> d!18049 (= (apply!76 (+!95 lt!33897 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33899) (apply!76 lt!33897 lt!33899))))

(declare-fun lt!34338 () Unit!2157)

(declare-fun choose!440 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2157)

(assert (=> d!18049 (= lt!34338 (choose!440 lt!33897 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33899))))

(declare-fun e!49462 () Bool)

(assert (=> d!18049 e!49462))

(declare-fun res!39907 () Bool)

(assert (=> d!18049 (=> (not res!39907) (not e!49462))))

(assert (=> d!18049 (= res!39907 (contains!723 lt!33897 lt!33899))))

(assert (=> d!18049 (= (addApplyDifferent!52 lt!33897 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33899) lt!34338)))

(declare-fun b!75739 () Bool)

(assert (=> b!75739 (= e!49462 (not (= lt!33899 lt!33903)))))

(assert (= (and d!18049 res!39907) b!75739))

(assert (=> d!18049 m!74687))

(assert (=> d!18049 m!74689))

(assert (=> d!18049 m!74693))

(declare-fun m!75469 () Bool)

(assert (=> d!18049 m!75469))

(declare-fun m!75471 () Bool)

(assert (=> d!18049 m!75471))

(assert (=> d!18049 m!74687))

(assert (=> b!75128 d!18049))

(declare-fun d!18051 () Bool)

(assert (=> d!18051 (= (apply!76 lt!33897 lt!33899) (get!1159 (getValueByKey!135 (toList!719 lt!33897) lt!33899)))))

(declare-fun bs!3258 () Bool)

(assert (= bs!3258 d!18051))

(declare-fun m!75473 () Bool)

(assert (=> bs!3258 m!75473))

(assert (=> bs!3258 m!75473))

(declare-fun m!75475 () Bool)

(assert (=> bs!3258 m!75475))

(assert (=> b!75128 d!18051))

(declare-fun d!18053 () Bool)

(assert (=> d!18053 (= (apply!76 (+!95 lt!33895 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33891) (apply!76 lt!33895 lt!33891))))

(declare-fun lt!34339 () Unit!2157)

(assert (=> d!18053 (= lt!34339 (choose!440 lt!33895 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33891))))

(declare-fun e!49463 () Bool)

(assert (=> d!18053 e!49463))

(declare-fun res!39908 () Bool)

(assert (=> d!18053 (=> (not res!39908) (not e!49463))))

(assert (=> d!18053 (= res!39908 (contains!723 lt!33895 lt!33891))))

(assert (=> d!18053 (= (addApplyDifferent!52 lt!33895 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33891) lt!34339)))

(declare-fun b!75740 () Bool)

(assert (=> b!75740 (= e!49463 (not (= lt!33891 lt!33901)))))

(assert (= (and d!18053 res!39908) b!75740))

(assert (=> d!18053 m!74707))

(assert (=> d!18053 m!74709))

(assert (=> d!18053 m!74695))

(declare-fun m!75477 () Bool)

(assert (=> d!18053 m!75477))

(declare-fun m!75479 () Bool)

(assert (=> d!18053 m!75479))

(assert (=> d!18053 m!74707))

(assert (=> b!75128 d!18053))

(declare-fun d!18055 () Bool)

(declare-fun e!49464 () Bool)

(assert (=> d!18055 e!49464))

(declare-fun res!39910 () Bool)

(assert (=> d!18055 (=> (not res!39910) (not e!49464))))

(declare-fun lt!34343 () ListLongMap!1407)

(assert (=> d!18055 (= res!39910 (contains!723 lt!34343 (_1!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun lt!34341 () List!1478)

(assert (=> d!18055 (= lt!34343 (ListLongMap!1408 lt!34341))))

(declare-fun lt!34340 () Unit!2157)

(declare-fun lt!34342 () Unit!2157)

(assert (=> d!18055 (= lt!34340 lt!34342)))

(assert (=> d!18055 (= (getValueByKey!135 lt!34341 (_1!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18055 (= lt!34342 (lemmaContainsTupThenGetReturnValue!52 lt!34341 (_1!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18055 (= lt!34341 (insertStrictlySorted!55 (toList!719 lt!33895) (_1!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18055 (= (+!95 lt!33895 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!34343)))

(declare-fun b!75741 () Bool)

(declare-fun res!39909 () Bool)

(assert (=> b!75741 (=> (not res!39909) (not e!49464))))

(assert (=> b!75741 (= res!39909 (= (getValueByKey!135 (toList!719 lt!34343) (_1!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun b!75742 () Bool)

(assert (=> b!75742 (= e!49464 (contains!724 (toList!719 lt!34343) (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!18055 res!39910) b!75741))

(assert (= (and b!75741 res!39909) b!75742))

(declare-fun m!75481 () Bool)

(assert (=> d!18055 m!75481))

(declare-fun m!75483 () Bool)

(assert (=> d!18055 m!75483))

(declare-fun m!75485 () Bool)

(assert (=> d!18055 m!75485))

(declare-fun m!75487 () Bool)

(assert (=> d!18055 m!75487))

(declare-fun m!75489 () Bool)

(assert (=> b!75741 m!75489))

(declare-fun m!75491 () Bool)

(assert (=> b!75742 m!75491))

(assert (=> b!75128 d!18055))

(assert (=> b!75128 d!17885))

(declare-fun d!18057 () Bool)

(assert (=> d!18057 (= (apply!76 lt!33895 lt!33891) (get!1159 (getValueByKey!135 (toList!719 lt!33895) lt!33891)))))

(declare-fun bs!3259 () Bool)

(assert (= bs!3259 d!18057))

(declare-fun m!75493 () Bool)

(assert (=> bs!3259 m!75493))

(assert (=> bs!3259 m!75493))

(declare-fun m!75495 () Bool)

(assert (=> bs!3259 m!75495))

(assert (=> b!75128 d!18057))

(declare-fun d!18059 () Bool)

(declare-fun e!49465 () Bool)

(assert (=> d!18059 e!49465))

(declare-fun res!39912 () Bool)

(assert (=> d!18059 (=> (not res!39912) (not e!49465))))

(declare-fun lt!34347 () ListLongMap!1407)

(assert (=> d!18059 (= res!39912 (contains!723 lt!34347 (_1!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun lt!34345 () List!1478)

(assert (=> d!18059 (= lt!34347 (ListLongMap!1408 lt!34345))))

(declare-fun lt!34344 () Unit!2157)

(declare-fun lt!34346 () Unit!2157)

(assert (=> d!18059 (= lt!34344 lt!34346)))

(assert (=> d!18059 (= (getValueByKey!135 lt!34345 (_1!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18059 (= lt!34346 (lemmaContainsTupThenGetReturnValue!52 lt!34345 (_1!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18059 (= lt!34345 (insertStrictlySorted!55 (toList!719 lt!33898) (_1!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18059 (= (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!34347)))

(declare-fun b!75743 () Bool)

(declare-fun res!39911 () Bool)

(assert (=> b!75743 (=> (not res!39911) (not e!49465))))

(assert (=> b!75743 (= res!39911 (= (getValueByKey!135 (toList!719 lt!34347) (_1!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun b!75744 () Bool)

(assert (=> b!75744 (= e!49465 (contains!724 (toList!719 lt!34347) (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!18059 res!39912) b!75743))

(assert (= (and b!75743 res!39911) b!75744))

(declare-fun m!75497 () Bool)

(assert (=> d!18059 m!75497))

(declare-fun m!75499 () Bool)

(assert (=> d!18059 m!75499))

(declare-fun m!75501 () Bool)

(assert (=> d!18059 m!75501))

(declare-fun m!75503 () Bool)

(assert (=> d!18059 m!75503))

(declare-fun m!75505 () Bool)

(assert (=> b!75743 m!75505))

(declare-fun m!75507 () Bool)

(assert (=> b!75744 m!75507))

(assert (=> b!75128 d!18059))

(declare-fun d!18061 () Bool)

(declare-fun e!49466 () Bool)

(assert (=> d!18061 e!49466))

(declare-fun res!39913 () Bool)

(assert (=> d!18061 (=> res!39913 e!49466)))

(declare-fun lt!34349 () Bool)

(assert (=> d!18061 (= res!39913 (not lt!34349))))

(declare-fun lt!34351 () Bool)

(assert (=> d!18061 (= lt!34349 lt!34351)))

(declare-fun lt!34350 () Unit!2157)

(declare-fun e!49467 () Unit!2157)

(assert (=> d!18061 (= lt!34350 e!49467)))

(declare-fun c!11531 () Bool)

(assert (=> d!18061 (= c!11531 lt!34351)))

(assert (=> d!18061 (= lt!34351 (containsKey!138 (toList!719 (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!33892))))

(assert (=> d!18061 (= (contains!723 (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33892) lt!34349)))

(declare-fun b!75745 () Bool)

(declare-fun lt!34348 () Unit!2157)

(assert (=> b!75745 (= e!49467 lt!34348)))

(assert (=> b!75745 (= lt!34348 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!33892))))

(assert (=> b!75745 (isDefined!87 (getValueByKey!135 (toList!719 (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!33892))))

(declare-fun b!75746 () Bool)

(declare-fun Unit!2181 () Unit!2157)

(assert (=> b!75746 (= e!49467 Unit!2181)))

(declare-fun b!75747 () Bool)

(assert (=> b!75747 (= e!49466 (isDefined!87 (getValueByKey!135 (toList!719 (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!33892)))))

(assert (= (and d!18061 c!11531) b!75745))

(assert (= (and d!18061 (not c!11531)) b!75746))

(assert (= (and d!18061 (not res!39913)) b!75747))

(declare-fun m!75509 () Bool)

(assert (=> d!18061 m!75509))

(declare-fun m!75511 () Bool)

(assert (=> b!75745 m!75511))

(declare-fun m!75513 () Bool)

(assert (=> b!75745 m!75513))

(assert (=> b!75745 m!75513))

(declare-fun m!75515 () Bool)

(assert (=> b!75745 m!75515))

(assert (=> b!75747 m!75513))

(assert (=> b!75747 m!75513))

(assert (=> b!75747 m!75515))

(assert (=> b!75128 d!18061))

(declare-fun d!18063 () Bool)

(declare-fun e!49468 () Bool)

(assert (=> d!18063 e!49468))

(declare-fun res!39915 () Bool)

(assert (=> d!18063 (=> (not res!39915) (not e!49468))))

(declare-fun lt!34355 () ListLongMap!1407)

(assert (=> d!18063 (= res!39915 (contains!723 lt!34355 (_1!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun lt!34353 () List!1478)

(assert (=> d!18063 (= lt!34355 (ListLongMap!1408 lt!34353))))

(declare-fun lt!34352 () Unit!2157)

(declare-fun lt!34354 () Unit!2157)

(assert (=> d!18063 (= lt!34352 lt!34354)))

(assert (=> d!18063 (= (getValueByKey!135 lt!34353 (_1!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18063 (= lt!34354 (lemmaContainsTupThenGetReturnValue!52 lt!34353 (_1!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18063 (= lt!34353 (insertStrictlySorted!55 (toList!719 lt!33897) (_1!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18063 (= (+!95 lt!33897 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!34355)))

(declare-fun b!75748 () Bool)

(declare-fun res!39914 () Bool)

(assert (=> b!75748 (=> (not res!39914) (not e!49468))))

(assert (=> b!75748 (= res!39914 (= (getValueByKey!135 (toList!719 lt!34355) (_1!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun b!75749 () Bool)

(assert (=> b!75749 (= e!49468 (contains!724 (toList!719 lt!34355) (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!18063 res!39915) b!75748))

(assert (= (and b!75748 res!39914) b!75749))

(declare-fun m!75517 () Bool)

(assert (=> d!18063 m!75517))

(declare-fun m!75519 () Bool)

(assert (=> d!18063 m!75519))

(declare-fun m!75521 () Bool)

(assert (=> d!18063 m!75521))

(declare-fun m!75523 () Bool)

(assert (=> d!18063 m!75523))

(declare-fun m!75525 () Bool)

(assert (=> b!75748 m!75525))

(declare-fun m!75527 () Bool)

(assert (=> b!75749 m!75527))

(assert (=> b!75128 d!18063))

(declare-fun d!18065 () Bool)

(assert (=> d!18065 (= (apply!76 lt!33904 lt!33905) (get!1159 (getValueByKey!135 (toList!719 lt!33904) lt!33905)))))

(declare-fun bs!3260 () Bool)

(assert (= bs!3260 d!18065))

(declare-fun m!75529 () Bool)

(assert (=> bs!3260 m!75529))

(assert (=> bs!3260 m!75529))

(declare-fun m!75531 () Bool)

(assert (=> bs!3260 m!75531))

(assert (=> b!75128 d!18065))

(declare-fun d!18067 () Bool)

(assert (=> d!18067 (= (apply!76 (+!95 lt!33904 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33905) (get!1159 (getValueByKey!135 (toList!719 (+!95 lt!33904 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!33905)))))

(declare-fun bs!3261 () Bool)

(assert (= bs!3261 d!18067))

(declare-fun m!75533 () Bool)

(assert (=> bs!3261 m!75533))

(assert (=> bs!3261 m!75533))

(declare-fun m!75535 () Bool)

(assert (=> bs!3261 m!75535))

(assert (=> b!75128 d!18067))

(declare-fun d!18069 () Bool)

(assert (=> d!18069 (= (apply!76 (+!95 lt!33904 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33905) (apply!76 lt!33904 lt!33905))))

(declare-fun lt!34356 () Unit!2157)

(assert (=> d!18069 (= lt!34356 (choose!440 lt!33904 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33905))))

(declare-fun e!49469 () Bool)

(assert (=> d!18069 e!49469))

(declare-fun res!39916 () Bool)

(assert (=> d!18069 (=> (not res!39916) (not e!49469))))

(assert (=> d!18069 (= res!39916 (contains!723 lt!33904 lt!33905))))

(assert (=> d!18069 (= (addApplyDifferent!52 lt!33904 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33905) lt!34356)))

(declare-fun b!75750 () Bool)

(assert (=> b!75750 (= e!49469 (not (= lt!33905 lt!33906)))))

(assert (= (and d!18069 res!39916) b!75750))

(assert (=> d!18069 m!74701))

(assert (=> d!18069 m!74703))

(assert (=> d!18069 m!74711))

(declare-fun m!75537 () Bool)

(assert (=> d!18069 m!75537))

(declare-fun m!75539 () Bool)

(assert (=> d!18069 m!75539))

(assert (=> d!18069 m!74701))

(assert (=> b!75128 d!18069))

(declare-fun d!18071 () Bool)

(assert (=> d!18071 (= (apply!76 (+!95 lt!33897 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33899) (get!1159 (getValueByKey!135 (toList!719 (+!95 lt!33897 (tuple2!2129 lt!33903 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!33899)))))

(declare-fun bs!3262 () Bool)

(assert (= bs!3262 d!18071))

(declare-fun m!75541 () Bool)

(assert (=> bs!3262 m!75541))

(assert (=> bs!3262 m!75541))

(declare-fun m!75543 () Bool)

(assert (=> bs!3262 m!75543))

(assert (=> b!75128 d!18071))

(declare-fun d!18073 () Bool)

(assert (=> d!18073 (contains!723 (+!95 lt!33898 (tuple2!2129 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33892)))

(declare-fun lt!34359 () Unit!2157)

(declare-fun choose!441 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2157)

(assert (=> d!18073 (= lt!34359 (choose!441 lt!33898 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33892))))

(assert (=> d!18073 (contains!723 lt!33898 lt!33892)))

(assert (=> d!18073 (= (addStillContains!52 lt!33898 lt!33900 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))) lt!33892) lt!34359)))

(declare-fun bs!3263 () Bool)

(assert (= bs!3263 d!18073))

(assert (=> bs!3263 m!74685))

(assert (=> bs!3263 m!74685))

(assert (=> bs!3263 m!74713))

(declare-fun m!75545 () Bool)

(assert (=> bs!3263 m!75545))

(declare-fun m!75547 () Bool)

(assert (=> bs!3263 m!75547))

(assert (=> b!75128 d!18073))

(declare-fun d!18075 () Bool)

(declare-fun e!49470 () Bool)

(assert (=> d!18075 e!49470))

(declare-fun res!39918 () Bool)

(assert (=> d!18075 (=> (not res!39918) (not e!49470))))

(declare-fun lt!34363 () ListLongMap!1407)

(assert (=> d!18075 (= res!39918 (contains!723 lt!34363 (_1!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(declare-fun lt!34361 () List!1478)

(assert (=> d!18075 (= lt!34363 (ListLongMap!1408 lt!34361))))

(declare-fun lt!34360 () Unit!2157)

(declare-fun lt!34362 () Unit!2157)

(assert (=> d!18075 (= lt!34360 lt!34362)))

(assert (=> d!18075 (= (getValueByKey!135 lt!34361 (_1!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18075 (= lt!34362 (lemmaContainsTupThenGetReturnValue!52 lt!34361 (_1!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18075 (= lt!34361 (insertStrictlySorted!55 (toList!719 lt!33904) (_1!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) (_2!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))))))

(assert (=> d!18075 (= (+!95 lt!33904 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!34363)))

(declare-fun b!75752 () Bool)

(declare-fun res!39917 () Bool)

(assert (=> b!75752 (=> (not res!39917) (not e!49470))))

(assert (=> b!75752 (= res!39917 (= (getValueByKey!135 (toList!719 lt!34363) (_1!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992)))))) (Some!140 (_2!1075 (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))))

(declare-fun b!75753 () Bool)

(assert (=> b!75753 (= e!49470 (contains!724 (toList!719 lt!34363) (tuple2!2129 lt!33906 (zeroValue!2133 (v!2548 (underlying!265 thiss!992))))))))

(assert (= (and d!18075 res!39918) b!75752))

(assert (= (and b!75752 res!39917) b!75753))

(declare-fun m!75549 () Bool)

(assert (=> d!18075 m!75549))

(declare-fun m!75551 () Bool)

(assert (=> d!18075 m!75551))

(declare-fun m!75553 () Bool)

(assert (=> d!18075 m!75553))

(declare-fun m!75555 () Bool)

(assert (=> d!18075 m!75555))

(declare-fun m!75557 () Bool)

(assert (=> b!75752 m!75557))

(declare-fun m!75559 () Bool)

(assert (=> b!75753 m!75559))

(assert (=> b!75128 d!18075))

(declare-fun d!18077 () Bool)

(assert (=> d!18077 (= (apply!76 (+!95 lt!33895 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992))))) lt!33891) (get!1159 (getValueByKey!135 (toList!719 (+!95 lt!33895 (tuple2!2129 lt!33901 (minValue!2133 (v!2548 (underlying!265 thiss!992)))))) lt!33891)))))

(declare-fun bs!3264 () Bool)

(assert (= bs!3264 d!18077))

(declare-fun m!75561 () Bool)

(assert (=> bs!3264 m!75561))

(assert (=> bs!3264 m!75561))

(declare-fun m!75563 () Bool)

(assert (=> bs!3264 m!75563))

(assert (=> b!75128 d!18077))

(assert (=> b!75345 d!17901))

(assert (=> b!75314 d!17973))

(declare-fun d!18079 () Bool)

(declare-fun lt!34364 () Bool)

(assert (=> d!18079 (= lt!34364 (select (content!80 (toList!719 lt!34015)) lt!33761))))

(declare-fun e!49471 () Bool)

(assert (=> d!18079 (= lt!34364 e!49471)))

(declare-fun res!39920 () Bool)

(assert (=> d!18079 (=> (not res!39920) (not e!49471))))

(assert (=> d!18079 (= res!39920 ((_ is Cons!1474) (toList!719 lt!34015)))))

(assert (=> d!18079 (= (contains!724 (toList!719 lt!34015) lt!33761) lt!34364)))

(declare-fun b!75754 () Bool)

(declare-fun e!49472 () Bool)

(assert (=> b!75754 (= e!49471 e!49472)))

(declare-fun res!39919 () Bool)

(assert (=> b!75754 (=> res!39919 e!49472)))

(assert (=> b!75754 (= res!39919 (= (h!2062 (toList!719 lt!34015)) lt!33761))))

(declare-fun b!75755 () Bool)

(assert (=> b!75755 (= e!49472 (contains!724 (t!5048 (toList!719 lt!34015)) lt!33761))))

(assert (= (and d!18079 res!39920) b!75754))

(assert (= (and b!75754 (not res!39919)) b!75755))

(declare-fun m!75565 () Bool)

(assert (=> d!18079 m!75565))

(declare-fun m!75567 () Bool)

(assert (=> d!18079 m!75567))

(declare-fun m!75569 () Bool)

(assert (=> b!75755 m!75569))

(assert (=> b!75282 d!18079))

(declare-fun d!18081 () Bool)

(declare-fun e!49473 () Bool)

(assert (=> d!18081 e!49473))

(declare-fun res!39921 () Bool)

(assert (=> d!18081 (=> res!39921 e!49473)))

(declare-fun lt!34366 () Bool)

(assert (=> d!18081 (= res!39921 (not lt!34366))))

(declare-fun lt!34368 () Bool)

(assert (=> d!18081 (= lt!34366 lt!34368)))

(declare-fun lt!34367 () Unit!2157)

(declare-fun e!49474 () Unit!2157)

(assert (=> d!18081 (= lt!34367 e!49474)))

(declare-fun c!11532 () Bool)

(assert (=> d!18081 (= c!11532 lt!34368)))

(assert (=> d!18081 (= lt!34368 (containsKey!138 (toList!719 lt!33886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18081 (= (contains!723 lt!33886 #b0000000000000000000000000000000000000000000000000000000000000000) lt!34366)))

(declare-fun b!75756 () Bool)

(declare-fun lt!34365 () Unit!2157)

(assert (=> b!75756 (= e!49474 lt!34365)))

(assert (=> b!75756 (= lt!34365 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!33886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75756 (isDefined!87 (getValueByKey!135 (toList!719 lt!33886) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75757 () Bool)

(declare-fun Unit!2182 () Unit!2157)

(assert (=> b!75757 (= e!49474 Unit!2182)))

(declare-fun b!75758 () Bool)

(assert (=> b!75758 (= e!49473 (isDefined!87 (getValueByKey!135 (toList!719 lt!33886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!18081 c!11532) b!75756))

(assert (= (and d!18081 (not c!11532)) b!75757))

(assert (= (and d!18081 (not res!39921)) b!75758))

(declare-fun m!75571 () Bool)

(assert (=> d!18081 m!75571))

(declare-fun m!75573 () Bool)

(assert (=> b!75756 m!75573))

(assert (=> b!75756 m!74965))

(assert (=> b!75756 m!74965))

(declare-fun m!75575 () Bool)

(assert (=> b!75756 m!75575))

(assert (=> b!75758 m!74965))

(assert (=> b!75758 m!74965))

(assert (=> b!75758 m!75575))

(assert (=> bm!6636 d!18081))

(assert (=> b!75316 d!17967))

(declare-fun b!75759 () Bool)

(declare-fun e!49485 () ListLongMap!1407)

(declare-fun call!6781 () ListLongMap!1407)

(assert (=> b!75759 (= e!49485 (+!95 call!6781 (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)))))))

(declare-fun b!75760 () Bool)

(declare-fun e!49484 () Bool)

(declare-fun e!49477 () Bool)

(assert (=> b!75760 (= e!49484 e!49477)))

(declare-fun c!11535 () Bool)

(assert (=> b!75760 (= c!11535 (not (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75761 () Bool)

(declare-fun e!49482 () Unit!2157)

(declare-fun Unit!2183 () Unit!2157)

(assert (=> b!75761 (= e!49482 Unit!2183)))

(declare-fun b!75762 () Bool)

(declare-fun res!39923 () Bool)

(assert (=> b!75762 (=> (not res!39923) (not e!49484))))

(declare-fun e!49476 () Bool)

(assert (=> b!75762 (= res!39923 e!49476)))

(declare-fun res!39926 () Bool)

(assert (=> b!75762 (=> res!39926 e!49476)))

(declare-fun e!49475 () Bool)

(assert (=> b!75762 (= res!39926 (not e!49475))))

(declare-fun res!39930 () Bool)

(assert (=> b!75762 (=> (not res!39930) (not e!49475))))

(assert (=> b!75762 (= res!39930 (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(declare-fun e!49480 () Bool)

(declare-fun lt!34370 () ListLongMap!1407)

(declare-fun b!75763 () Bool)

(assert (=> b!75763 (= e!49480 (= (apply!76 lt!34370 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16))))))

(declare-fun b!75764 () Bool)

(declare-fun e!49479 () ListLongMap!1407)

(declare-fun call!6785 () ListLongMap!1407)

(assert (=> b!75764 (= e!49479 call!6785)))

(declare-fun b!75765 () Bool)

(declare-fun e!49478 () Bool)

(declare-fun call!6784 () Bool)

(assert (=> b!75765 (= e!49478 (not call!6784))))

(declare-fun b!75766 () Bool)

(assert (=> b!75766 (= e!49475 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!49487 () Bool)

(declare-fun b!75767 () Bool)

(assert (=> b!75767 (= e!49487 (= (apply!76 lt!34370 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16))))))

(declare-fun b!75768 () Bool)

(declare-fun lt!34371 () Unit!2157)

(assert (=> b!75768 (= e!49482 lt!34371)))

(declare-fun lt!34382 () ListLongMap!1407)

(assert (=> b!75768 (= lt!34382 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))) (mask!6210 newMap!16) (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34384 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34376 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34376 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34378 () Unit!2157)

(assert (=> b!75768 (= lt!34378 (addStillContains!52 lt!34382 lt!34384 (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) lt!34376))))

(assert (=> b!75768 (contains!723 (+!95 lt!34382 (tuple2!2129 lt!34384 (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)))) lt!34376)))

(declare-fun lt!34372 () Unit!2157)

(assert (=> b!75768 (= lt!34372 lt!34378)))

(declare-fun lt!34379 () ListLongMap!1407)

(assert (=> b!75768 (= lt!34379 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))) (mask!6210 newMap!16) (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34385 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34375 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34375 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34374 () Unit!2157)

(assert (=> b!75768 (= lt!34374 (addApplyDifferent!52 lt!34379 lt!34385 (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) lt!34375))))

(assert (=> b!75768 (= (apply!76 (+!95 lt!34379 (tuple2!2129 lt!34385 (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)))) lt!34375) (apply!76 lt!34379 lt!34375))))

(declare-fun lt!34373 () Unit!2157)

(assert (=> b!75768 (= lt!34373 lt!34374)))

(declare-fun lt!34388 () ListLongMap!1407)

(assert (=> b!75768 (= lt!34388 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))) (mask!6210 newMap!16) (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34390 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34389 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34389 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34386 () Unit!2157)

(assert (=> b!75768 (= lt!34386 (addApplyDifferent!52 lt!34388 lt!34390 (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) lt!34389))))

(assert (=> b!75768 (= (apply!76 (+!95 lt!34388 (tuple2!2129 lt!34390 (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)))) lt!34389) (apply!76 lt!34388 lt!34389))))

(declare-fun lt!34380 () Unit!2157)

(assert (=> b!75768 (= lt!34380 lt!34386)))

(declare-fun lt!34381 () ListLongMap!1407)

(assert (=> b!75768 (= lt!34381 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))) (mask!6210 newMap!16) (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34387 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34387 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!34383 () (_ BitVec 64))

(assert (=> b!75768 (= lt!34383 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!75768 (= lt!34371 (addApplyDifferent!52 lt!34381 lt!34387 (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) lt!34383))))

(assert (=> b!75768 (= (apply!76 (+!95 lt!34381 (tuple2!2129 lt!34387 (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)))) lt!34383) (apply!76 lt!34381 lt!34383))))

(declare-fun bm!6776 () Bool)

(declare-fun call!6783 () ListLongMap!1407)

(declare-fun call!6782 () ListLongMap!1407)

(assert (=> bm!6776 (= call!6783 call!6782)))

(declare-fun b!75769 () Bool)

(assert (=> b!75769 (= e!49485 e!49479)))

(declare-fun c!11536 () Bool)

(assert (=> b!75769 (= c!11536 (and (not (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!75770 () Bool)

(assert (=> b!75770 (= e!49478 e!49480)))

(declare-fun res!39922 () Bool)

(assert (=> b!75770 (= res!39922 call!6784)))

(assert (=> b!75770 (=> (not res!39922) (not e!49480))))

(declare-fun b!75771 () Bool)

(declare-fun call!6780 () Bool)

(assert (=> b!75771 (= e!49477 (not call!6780))))

(declare-fun bm!6778 () Bool)

(assert (=> bm!6778 (= call!6785 call!6781)))

(declare-fun call!6779 () ListLongMap!1407)

(declare-fun bm!6779 () Bool)

(assert (=> bm!6779 (= call!6779 (getCurrentListMapNoExtraKeys!60 (_keys!3889 newMap!16) (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))) (mask!6210 newMap!16) (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun b!75772 () Bool)

(assert (=> b!75772 (= e!49477 e!49487)))

(declare-fun res!39929 () Bool)

(assert (=> b!75772 (= res!39929 call!6780)))

(assert (=> b!75772 (=> (not res!39929) (not e!49487))))

(declare-fun b!75773 () Bool)

(declare-fun e!49481 () ListLongMap!1407)

(assert (=> b!75773 (= e!49481 call!6783)))

(declare-fun b!75774 () Bool)

(declare-fun e!49486 () Bool)

(assert (=> b!75774 (= e!49476 e!49486)))

(declare-fun res!39927 () Bool)

(assert (=> b!75774 (=> (not res!39927) (not e!49486))))

(assert (=> b!75774 (= res!39927 (contains!723 lt!34370 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!75774 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(declare-fun b!75775 () Bool)

(declare-fun e!49483 () Bool)

(assert (=> b!75775 (= e!49483 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!6780 () Bool)

(assert (=> bm!6780 (= call!6782 call!6779)))

(declare-fun bm!6781 () Bool)

(assert (=> bm!6781 (= call!6780 (contains!723 lt!34370 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!75776 () Bool)

(declare-fun res!39924 () Bool)

(assert (=> b!75776 (=> (not res!39924) (not e!49484))))

(assert (=> b!75776 (= res!39924 e!49478)))

(declare-fun c!11534 () Bool)

(assert (=> b!75776 (= c!11534 (not (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!6777 () Bool)

(assert (=> bm!6777 (= call!6784 (contains!723 lt!34370 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!18083 () Bool)

(assert (=> d!18083 e!49484))

(declare-fun res!39925 () Bool)

(assert (=> d!18083 (=> (not res!39925) (not e!49484))))

(assert (=> d!18083 (= res!39925 (or (bvsge #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))))

(declare-fun lt!34369 () ListLongMap!1407)

(assert (=> d!18083 (= lt!34370 lt!34369)))

(declare-fun lt!34377 () Unit!2157)

(assert (=> d!18083 (= lt!34377 e!49482)))

(declare-fun c!11537 () Bool)

(assert (=> d!18083 (= c!11537 e!49483)))

(declare-fun res!39928 () Bool)

(assert (=> d!18083 (=> (not res!39928) (not e!49483))))

(assert (=> d!18083 (= res!39928 (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (=> d!18083 (= lt!34369 e!49485)))

(declare-fun c!11533 () Bool)

(assert (=> d!18083 (= c!11533 (and (not (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!18083 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!18083 (= (getCurrentListMap!416 (_keys!3889 newMap!16) (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))) (mask!6210 newMap!16) (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16)) (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) lt!34370)))

(declare-fun c!11538 () Bool)

(declare-fun b!75777 () Bool)

(assert (=> b!75777 (= c!11538 (and (not (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!11400 (ite c!11399 lt!33986 lt!33992) (extraKeys!2088 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!75777 (= e!49479 e!49481)))

(declare-fun b!75778 () Bool)

(assert (=> b!75778 (= e!49481 call!6785)))

(declare-fun bm!6782 () Bool)

(assert (=> bm!6782 (= call!6781 (+!95 (ite c!11533 call!6779 (ite c!11536 call!6782 call!6783)) (ite (or c!11533 c!11536) (tuple2!2129 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!11400 c!11399) lt!33768 (zeroValue!2133 newMap!16))) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!11400 (ite c!11399 (minValue!2133 newMap!16) lt!33768) (minValue!2133 newMap!16))))))))

(declare-fun b!75779 () Bool)

(assert (=> b!75779 (= e!49486 (= (apply!76 lt!34370 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)) (get!1156 (select (arr!1857 (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!331 (defaultEntry!2233 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2096 (ite c!11400 (_values!2216 newMap!16) (array!3894 (store (arr!1857 (_values!2216 newMap!16)) (index!3057 lt!33994) (ValueCellFull!896 lt!33768)) (size!2096 (_values!2216 newMap!16)))))))))

(assert (=> b!75779 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (= (and d!18083 c!11533) b!75759))

(assert (= (and d!18083 (not c!11533)) b!75769))

(assert (= (and b!75769 c!11536) b!75764))

(assert (= (and b!75769 (not c!11536)) b!75777))

(assert (= (and b!75777 c!11538) b!75778))

(assert (= (and b!75777 (not c!11538)) b!75773))

(assert (= (or b!75778 b!75773) bm!6776))

(assert (= (or b!75764 bm!6776) bm!6780))

(assert (= (or b!75764 b!75778) bm!6778))

(assert (= (or b!75759 bm!6780) bm!6779))

(assert (= (or b!75759 bm!6778) bm!6782))

(assert (= (and d!18083 res!39928) b!75775))

(assert (= (and d!18083 c!11537) b!75768))

(assert (= (and d!18083 (not c!11537)) b!75761))

(assert (= (and d!18083 res!39925) b!75762))

(assert (= (and b!75762 res!39930) b!75766))

(assert (= (and b!75762 (not res!39926)) b!75774))

(assert (= (and b!75774 res!39927) b!75779))

(assert (= (and b!75762 res!39923) b!75776))

(assert (= (and b!75776 c!11534) b!75770))

(assert (= (and b!75776 (not c!11534)) b!75765))

(assert (= (and b!75770 res!39922) b!75763))

(assert (= (or b!75770 b!75765) bm!6777))

(assert (= (and b!75776 res!39924) b!75760))

(assert (= (and b!75760 c!11535) b!75772))

(assert (= (and b!75760 (not c!11535)) b!75771))

(assert (= (and b!75772 res!39929) b!75767))

(assert (= (or b!75772 b!75771) bm!6781))

(declare-fun b_lambda!3405 () Bool)

(assert (=> (not b_lambda!3405) (not b!75779)))

(assert (=> b!75779 t!5060))

(declare-fun b_and!4637 () Bool)

(assert (= b_and!4633 (and (=> t!5060 result!2717) b_and!4637)))

(assert (=> b!75779 t!5062))

(declare-fun b_and!4639 () Bool)

(assert (= b_and!4635 (and (=> t!5062 result!2719) b_and!4639)))

(declare-fun m!75577 () Bool)

(assert (=> bm!6777 m!75577))

(assert (=> d!18083 m!75127))

(declare-fun m!75579 () Bool)

(assert (=> b!75767 m!75579))

(assert (=> b!75774 m!75131))

(assert (=> b!75774 m!75131))

(declare-fun m!75581 () Bool)

(assert (=> b!75774 m!75581))

(declare-fun m!75583 () Bool)

(assert (=> b!75763 m!75583))

(assert (=> b!75775 m!75131))

(assert (=> b!75775 m!75131))

(assert (=> b!75775 m!75137))

(assert (=> b!75779 m!75131))

(declare-fun m!75585 () Bool)

(assert (=> b!75779 m!75585))

(assert (=> b!75779 m!75131))

(declare-fun m!75587 () Bool)

(assert (=> b!75779 m!75587))

(assert (=> b!75779 m!75585))

(assert (=> b!75779 m!75143))

(declare-fun m!75589 () Bool)

(assert (=> b!75779 m!75589))

(assert (=> b!75779 m!75143))

(declare-fun m!75591 () Bool)

(assert (=> bm!6782 m!75591))

(declare-fun m!75593 () Bool)

(assert (=> b!75768 m!75593))

(declare-fun m!75595 () Bool)

(assert (=> b!75768 m!75595))

(declare-fun m!75597 () Bool)

(assert (=> b!75768 m!75597))

(declare-fun m!75599 () Bool)

(assert (=> b!75768 m!75599))

(declare-fun m!75601 () Bool)

(assert (=> b!75768 m!75601))

(declare-fun m!75603 () Bool)

(assert (=> b!75768 m!75603))

(declare-fun m!75605 () Bool)

(assert (=> b!75768 m!75605))

(declare-fun m!75607 () Bool)

(assert (=> b!75768 m!75607))

(declare-fun m!75609 () Bool)

(assert (=> b!75768 m!75609))

(declare-fun m!75611 () Bool)

(assert (=> b!75768 m!75611))

(declare-fun m!75613 () Bool)

(assert (=> b!75768 m!75613))

(declare-fun m!75615 () Bool)

(assert (=> b!75768 m!75615))

(declare-fun m!75617 () Bool)

(assert (=> b!75768 m!75617))

(assert (=> b!75768 m!75131))

(assert (=> b!75768 m!75595))

(assert (=> b!75768 m!75617))

(declare-fun m!75619 () Bool)

(assert (=> b!75768 m!75619))

(declare-fun m!75621 () Bool)

(assert (=> b!75768 m!75621))

(assert (=> b!75768 m!75593))

(declare-fun m!75623 () Bool)

(assert (=> b!75768 m!75623))

(assert (=> b!75768 m!75611))

(assert (=> b!75766 m!75131))

(assert (=> b!75766 m!75131))

(assert (=> b!75766 m!75137))

(declare-fun m!75625 () Bool)

(assert (=> b!75759 m!75625))

(declare-fun m!75627 () Bool)

(assert (=> bm!6781 m!75627))

(assert (=> bm!6779 m!75607))

(assert (=> bm!6709 d!18083))

(declare-fun d!18085 () Bool)

(declare-fun e!49490 () Bool)

(assert (=> d!18085 e!49490))

(declare-fun res!39936 () Bool)

(assert (=> d!18085 (=> (not res!39936) (not e!49490))))

(declare-fun lt!34396 () SeekEntryResult!231)

(assert (=> d!18085 (= res!39936 ((_ is Found!231) lt!34396))))

(assert (=> d!18085 (= lt!34396 (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(declare-fun lt!34395 () Unit!2157)

(declare-fun choose!442 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 (_ BitVec 64) Int) Unit!2157)

(assert (=> d!18085 (= lt!34395 (choose!442 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)))))

(assert (=> d!18085 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!18085 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (defaultEntry!2233 newMap!16)) lt!34395)))

(declare-fun b!75784 () Bool)

(declare-fun res!39935 () Bool)

(assert (=> b!75784 (=> (not res!39935) (not e!49490))))

(assert (=> b!75784 (= res!39935 (inRange!0 (index!3057 lt!34396) (mask!6210 newMap!16)))))

(declare-fun b!75785 () Bool)

(assert (=> b!75785 (= e!49490 (= (select (arr!1856 (_keys!3889 newMap!16)) (index!3057 lt!34396)) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355)))))

(assert (=> b!75785 (and (bvsge (index!3057 lt!34396) #b00000000000000000000000000000000) (bvslt (index!3057 lt!34396) (size!2095 (_keys!3889 newMap!16))))))

(assert (= (and d!18085 res!39936) b!75784))

(assert (= (and b!75784 res!39935) b!75785))

(assert (=> d!18085 m!74477))

(assert (=> d!18085 m!74753))

(assert (=> d!18085 m!74477))

(declare-fun m!75629 () Bool)

(assert (=> d!18085 m!75629))

(assert (=> d!18085 m!75127))

(declare-fun m!75631 () Bool)

(assert (=> b!75784 m!75631))

(declare-fun m!75633 () Bool)

(assert (=> b!75785 m!75633))

(assert (=> bm!6695 d!18085))

(declare-fun d!18087 () Bool)

(assert (=> d!18087 (= (get!1158 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) from!355) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!75067 d!18087))

(assert (=> b!75318 d!17919))

(declare-fun d!18089 () Bool)

(assert (=> d!18089 (not (contains!723 (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036)) lt!34031))))

(declare-fun lt!34399 () Unit!2157)

(declare-fun choose!443 (ListLongMap!1407 (_ BitVec 64) V!2953 (_ BitVec 64)) Unit!2157)

(assert (=> d!18089 (= lt!34399 (choose!443 lt!34032 lt!34035 lt!34036 lt!34031))))

(declare-fun e!49493 () Bool)

(assert (=> d!18089 e!49493))

(declare-fun res!39939 () Bool)

(assert (=> d!18089 (=> (not res!39939) (not e!49493))))

(assert (=> d!18089 (= res!39939 (not (contains!723 lt!34032 lt!34031)))))

(assert (=> d!18089 (= (addStillNotContains!27 lt!34032 lt!34035 lt!34036 lt!34031) lt!34399)))

(declare-fun b!75789 () Bool)

(assert (=> b!75789 (= e!49493 (not (= lt!34035 lt!34031)))))

(assert (= (and d!18089 res!39939) b!75789))

(assert (=> d!18089 m!74813))

(assert (=> d!18089 m!74813))

(assert (=> d!18089 m!74815))

(declare-fun m!75635 () Bool)

(assert (=> d!18089 m!75635))

(declare-fun m!75637 () Bool)

(assert (=> d!18089 m!75637))

(assert (=> b!75318 d!18089))

(declare-fun d!18091 () Bool)

(declare-fun e!49494 () Bool)

(assert (=> d!18091 e!49494))

(declare-fun res!39941 () Bool)

(assert (=> d!18091 (=> (not res!39941) (not e!49494))))

(declare-fun lt!34403 () ListLongMap!1407)

(assert (=> d!18091 (= res!39941 (contains!723 lt!34403 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!34401 () List!1478)

(assert (=> d!18091 (= lt!34403 (ListLongMap!1408 lt!34401))))

(declare-fun lt!34400 () Unit!2157)

(declare-fun lt!34402 () Unit!2157)

(assert (=> d!18091 (= lt!34400 lt!34402)))

(assert (=> d!18091 (= (getValueByKey!135 lt!34401 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18091 (= lt!34402 (lemmaContainsTupThenGetReturnValue!52 lt!34401 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18091 (= lt!34401 (insertStrictlySorted!55 (toList!719 call!6719) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!18091 (= (+!95 call!6719 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!34403)))

(declare-fun b!75790 () Bool)

(declare-fun res!39940 () Bool)

(assert (=> b!75790 (=> (not res!39940) (not e!49494))))

(assert (=> b!75790 (= res!39940 (= (getValueByKey!135 (toList!719 lt!34403) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!75791 () Bool)

(assert (=> b!75791 (= e!49494 (contains!724 (toList!719 lt!34403) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1156 (select (arr!1857 (_values!2216 (v!2548 (underlying!265 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!331 (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!18091 res!39941) b!75790))

(assert (= (and b!75790 res!39940) b!75791))

(declare-fun m!75639 () Bool)

(assert (=> d!18091 m!75639))

(declare-fun m!75641 () Bool)

(assert (=> d!18091 m!75641))

(declare-fun m!75643 () Bool)

(assert (=> d!18091 m!75643))

(declare-fun m!75645 () Bool)

(assert (=> d!18091 m!75645))

(declare-fun m!75647 () Bool)

(assert (=> b!75790 m!75647))

(declare-fun m!75649 () Bool)

(assert (=> b!75791 m!75649))

(assert (=> b!75318 d!18091))

(declare-fun d!18093 () Bool)

(declare-fun e!49495 () Bool)

(assert (=> d!18093 e!49495))

(declare-fun res!39943 () Bool)

(assert (=> d!18093 (=> (not res!39943) (not e!49495))))

(declare-fun lt!34407 () ListLongMap!1407)

(assert (=> d!18093 (= res!39943 (contains!723 lt!34407 (_1!1075 (tuple2!2129 lt!34035 lt!34036))))))

(declare-fun lt!34405 () List!1478)

(assert (=> d!18093 (= lt!34407 (ListLongMap!1408 lt!34405))))

(declare-fun lt!34404 () Unit!2157)

(declare-fun lt!34406 () Unit!2157)

(assert (=> d!18093 (= lt!34404 lt!34406)))

(assert (=> d!18093 (= (getValueByKey!135 lt!34405 (_1!1075 (tuple2!2129 lt!34035 lt!34036))) (Some!140 (_2!1075 (tuple2!2129 lt!34035 lt!34036))))))

(assert (=> d!18093 (= lt!34406 (lemmaContainsTupThenGetReturnValue!52 lt!34405 (_1!1075 (tuple2!2129 lt!34035 lt!34036)) (_2!1075 (tuple2!2129 lt!34035 lt!34036))))))

(assert (=> d!18093 (= lt!34405 (insertStrictlySorted!55 (toList!719 lt!34032) (_1!1075 (tuple2!2129 lt!34035 lt!34036)) (_2!1075 (tuple2!2129 lt!34035 lt!34036))))))

(assert (=> d!18093 (= (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036)) lt!34407)))

(declare-fun b!75792 () Bool)

(declare-fun res!39942 () Bool)

(assert (=> b!75792 (=> (not res!39942) (not e!49495))))

(assert (=> b!75792 (= res!39942 (= (getValueByKey!135 (toList!719 lt!34407) (_1!1075 (tuple2!2129 lt!34035 lt!34036))) (Some!140 (_2!1075 (tuple2!2129 lt!34035 lt!34036)))))))

(declare-fun b!75793 () Bool)

(assert (=> b!75793 (= e!49495 (contains!724 (toList!719 lt!34407) (tuple2!2129 lt!34035 lt!34036)))))

(assert (= (and d!18093 res!39943) b!75792))

(assert (= (and b!75792 res!39942) b!75793))

(declare-fun m!75651 () Bool)

(assert (=> d!18093 m!75651))

(declare-fun m!75653 () Bool)

(assert (=> d!18093 m!75653))

(declare-fun m!75655 () Bool)

(assert (=> d!18093 m!75655))

(declare-fun m!75657 () Bool)

(assert (=> d!18093 m!75657))

(declare-fun m!75659 () Bool)

(assert (=> b!75792 m!75659))

(declare-fun m!75661 () Bool)

(assert (=> b!75793 m!75661))

(assert (=> b!75318 d!18093))

(declare-fun d!18095 () Bool)

(declare-fun e!49496 () Bool)

(assert (=> d!18095 e!49496))

(declare-fun res!39944 () Bool)

(assert (=> d!18095 (=> res!39944 e!49496)))

(declare-fun lt!34409 () Bool)

(assert (=> d!18095 (= res!39944 (not lt!34409))))

(declare-fun lt!34411 () Bool)

(assert (=> d!18095 (= lt!34409 lt!34411)))

(declare-fun lt!34410 () Unit!2157)

(declare-fun e!49497 () Unit!2157)

(assert (=> d!18095 (= lt!34410 e!49497)))

(declare-fun c!11539 () Bool)

(assert (=> d!18095 (= c!11539 lt!34411)))

(assert (=> d!18095 (= lt!34411 (containsKey!138 (toList!719 (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036))) lt!34031))))

(assert (=> d!18095 (= (contains!723 (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036)) lt!34031) lt!34409)))

(declare-fun b!75794 () Bool)

(declare-fun lt!34408 () Unit!2157)

(assert (=> b!75794 (= e!49497 lt!34408)))

(assert (=> b!75794 (= lt!34408 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036))) lt!34031))))

(assert (=> b!75794 (isDefined!87 (getValueByKey!135 (toList!719 (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036))) lt!34031))))

(declare-fun b!75795 () Bool)

(declare-fun Unit!2184 () Unit!2157)

(assert (=> b!75795 (= e!49497 Unit!2184)))

(declare-fun b!75796 () Bool)

(assert (=> b!75796 (= e!49496 (isDefined!87 (getValueByKey!135 (toList!719 (+!95 lt!34032 (tuple2!2129 lt!34035 lt!34036))) lt!34031)))))

(assert (= (and d!18095 c!11539) b!75794))

(assert (= (and d!18095 (not c!11539)) b!75795))

(assert (= (and d!18095 (not res!39944)) b!75796))

(declare-fun m!75663 () Bool)

(assert (=> d!18095 m!75663))

(declare-fun m!75665 () Bool)

(assert (=> b!75794 m!75665))

(declare-fun m!75667 () Bool)

(assert (=> b!75794 m!75667))

(assert (=> b!75794 m!75667))

(declare-fun m!75669 () Bool)

(assert (=> b!75794 m!75669))

(assert (=> b!75796 m!75667))

(assert (=> b!75796 m!75667))

(assert (=> b!75796 m!75669))

(assert (=> b!75318 d!18095))

(declare-fun d!18097 () Bool)

(assert (=> d!18097 (= (+!95 (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)) (tuple2!2129 #b1000000000000000000000000000000000000000000000000000000000000000 lt!33768)) (getCurrentListMap!416 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) lt!33992 (zeroValue!2133 newMap!16) lt!33768 #b00000000000000000000000000000000 (defaultEntry!2233 newMap!16)))))

(declare-fun lt!34414 () Unit!2157)

(declare-fun choose!444 (array!3891 array!3893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2953 V!2953 V!2953 Int) Unit!2157)

(assert (=> d!18097 (= lt!34414 (choose!444 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) lt!33992 (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) lt!33768 (defaultEntry!2233 newMap!16)))))

(assert (=> d!18097 (validMask!0 (mask!6210 newMap!16))))

(assert (=> d!18097 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!25 (_keys!3889 newMap!16) (_values!2216 newMap!16) (mask!6210 newMap!16) (extraKeys!2088 newMap!16) lt!33992 (zeroValue!2133 newMap!16) (minValue!2133 newMap!16) lt!33768 (defaultEntry!2233 newMap!16)) lt!34414)))

(declare-fun bs!3265 () Bool)

(assert (= bs!3265 d!18097))

(declare-fun m!75671 () Bool)

(assert (=> bs!3265 m!75671))

(assert (=> bs!3265 m!75127))

(assert (=> bs!3265 m!74663))

(declare-fun m!75673 () Bool)

(assert (=> bs!3265 m!75673))

(assert (=> bs!3265 m!74663))

(declare-fun m!75675 () Bool)

(assert (=> bs!3265 m!75675))

(assert (=> b!75241 d!18097))

(assert (=> bm!6638 d!17885))

(assert (=> d!17897 d!17901))

(declare-fun d!18099 () Bool)

(assert (=> d!18099 (not (arrayContainsKey!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!18099 true))

(declare-fun _$68!58 () Unit!2157)

(assert (=> d!18099 (= (choose!68 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476)) _$68!58)))

(declare-fun bs!3266 () Bool)

(assert (= bs!3266 d!18099))

(assert (=> bs!3266 m!74477))

(assert (=> bs!3266 m!74509))

(assert (=> d!17897 d!18099))

(declare-fun b!75797 () Bool)

(declare-fun e!49498 () Option!141)

(assert (=> b!75797 (= e!49498 (Some!140 (_2!1075 (h!2062 (toList!719 lt!34043)))))))

(declare-fun d!18101 () Bool)

(declare-fun c!11540 () Bool)

(assert (=> d!18101 (= c!11540 (and ((_ is Cons!1474) (toList!719 lt!34043)) (= (_1!1075 (h!2062 (toList!719 lt!34043))) (_1!1075 lt!33758))))))

(assert (=> d!18101 (= (getValueByKey!135 (toList!719 lt!34043) (_1!1075 lt!33758)) e!49498)))

(declare-fun b!75800 () Bool)

(declare-fun e!49499 () Option!141)

(assert (=> b!75800 (= e!49499 None!139)))

(declare-fun b!75798 () Bool)

(assert (=> b!75798 (= e!49498 e!49499)))

(declare-fun c!11541 () Bool)

(assert (=> b!75798 (= c!11541 (and ((_ is Cons!1474) (toList!719 lt!34043)) (not (= (_1!1075 (h!2062 (toList!719 lt!34043))) (_1!1075 lt!33758)))))))

(declare-fun b!75799 () Bool)

(assert (=> b!75799 (= e!49499 (getValueByKey!135 (t!5048 (toList!719 lt!34043)) (_1!1075 lt!33758)))))

(assert (= (and d!18101 c!11540) b!75797))

(assert (= (and d!18101 (not c!11540)) b!75798))

(assert (= (and b!75798 c!11541) b!75799))

(assert (= (and b!75798 (not c!11541)) b!75800))

(declare-fun m!75677 () Bool)

(assert (=> b!75799 m!75677))

(assert (=> b!75319 d!18101))

(declare-fun b!75801 () Bool)

(declare-fun e!49500 () Option!141)

(assert (=> b!75801 (= e!49500 (Some!140 (_2!1075 (h!2062 (toList!719 lt!34047)))))))

(declare-fun d!18103 () Bool)

(declare-fun c!11542 () Bool)

(assert (=> d!18103 (= c!11542 (and ((_ is Cons!1474) (toList!719 lt!34047)) (= (_1!1075 (h!2062 (toList!719 lt!34047))) (_1!1075 lt!33758))))))

(assert (=> d!18103 (= (getValueByKey!135 (toList!719 lt!34047) (_1!1075 lt!33758)) e!49500)))

(declare-fun b!75804 () Bool)

(declare-fun e!49501 () Option!141)

(assert (=> b!75804 (= e!49501 None!139)))

(declare-fun b!75802 () Bool)

(assert (=> b!75802 (= e!49500 e!49501)))

(declare-fun c!11543 () Bool)

(assert (=> b!75802 (= c!11543 (and ((_ is Cons!1474) (toList!719 lt!34047)) (not (= (_1!1075 (h!2062 (toList!719 lt!34047))) (_1!1075 lt!33758)))))))

(declare-fun b!75803 () Bool)

(assert (=> b!75803 (= e!49501 (getValueByKey!135 (t!5048 (toList!719 lt!34047)) (_1!1075 lt!33758)))))

(assert (= (and d!18103 c!11542) b!75801))

(assert (= (and d!18103 (not c!11542)) b!75802))

(assert (= (and b!75802 c!11543) b!75803))

(assert (= (and b!75802 (not c!11543)) b!75804))

(declare-fun m!75679 () Bool)

(assert (=> b!75803 m!75679))

(assert (=> b!75321 d!18103))

(declare-fun d!18105 () Bool)

(declare-fun res!39953 () Bool)

(declare-fun e!49504 () Bool)

(assert (=> d!18105 (=> (not res!39953) (not e!49504))))

(assert (=> d!18105 (= res!39953 (validMask!0 (mask!6210 newMap!16)))))

(assert (=> d!18105 (= (simpleValid!52 newMap!16) e!49504)))

(declare-fun b!75816 () Bool)

(assert (=> b!75816 (= e!49504 (and (bvsge (extraKeys!2088 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2088 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!399 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!75815 () Bool)

(declare-fun res!39955 () Bool)

(assert (=> b!75815 (=> (not res!39955) (not e!49504))))

(declare-fun size!2101 (LongMapFixedSize!700) (_ BitVec 32))

(assert (=> b!75815 (= res!39955 (= (size!2101 newMap!16) (bvadd (_size!399 newMap!16) (bvsdiv (bvadd (extraKeys!2088 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!75814 () Bool)

(declare-fun res!39956 () Bool)

(assert (=> b!75814 (=> (not res!39956) (not e!49504))))

(assert (=> b!75814 (= res!39956 (bvsge (size!2101 newMap!16) (_size!399 newMap!16)))))

(declare-fun b!75813 () Bool)

(declare-fun res!39954 () Bool)

(assert (=> b!75813 (=> (not res!39954) (not e!49504))))

(assert (=> b!75813 (= res!39954 (and (= (size!2096 (_values!2216 newMap!16)) (bvadd (mask!6210 newMap!16) #b00000000000000000000000000000001)) (= (size!2095 (_keys!3889 newMap!16)) (size!2096 (_values!2216 newMap!16))) (bvsge (_size!399 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!399 newMap!16) (bvadd (mask!6210 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!18105 res!39953) b!75813))

(assert (= (and b!75813 res!39954) b!75814))

(assert (= (and b!75814 res!39956) b!75815))

(assert (= (and b!75815 res!39955) b!75816))

(assert (=> d!18105 m!75127))

(declare-fun m!75681 () Bool)

(assert (=> b!75815 m!75681))

(assert (=> b!75814 m!75681))

(assert (=> d!17867 d!18105))

(assert (=> d!17871 d!17893))

(declare-fun d!18107 () Bool)

(declare-fun e!49505 () Bool)

(assert (=> d!18107 e!49505))

(declare-fun res!39958 () Bool)

(assert (=> d!18107 (=> (not res!39958) (not e!49505))))

(declare-fun lt!34418 () ListLongMap!1407)

(assert (=> d!18107 (= res!39958 (contains!723 lt!34418 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(declare-fun lt!34416 () List!1478)

(assert (=> d!18107 (= lt!34418 (ListLongMap!1408 lt!34416))))

(declare-fun lt!34415 () Unit!2157)

(declare-fun lt!34417 () Unit!2157)

(assert (=> d!18107 (= lt!34415 lt!34417)))

(assert (=> d!18107 (= (getValueByKey!135 lt!34416 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!18107 (= lt!34417 (lemmaContainsTupThenGetReturnValue!52 lt!34416 (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!18107 (= lt!34416 (insertStrictlySorted!55 (toList!719 call!6709) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))))))

(assert (=> d!18107 (= (+!95 call!6709 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)) lt!34418)))

(declare-fun b!75817 () Bool)

(declare-fun res!39957 () Bool)

(assert (=> b!75817 (=> (not res!39957) (not e!49505))))

(assert (=> b!75817 (= res!39957 (= (getValueByKey!135 (toList!719 lt!34418) (_1!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768))) (Some!140 (_2!1075 (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))))

(declare-fun b!75818 () Bool)

(assert (=> b!75818 (= e!49505 (contains!724 (toList!719 lt!34418) (tuple2!2129 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) lt!33768)))))

(assert (= (and d!18107 res!39958) b!75817))

(assert (= (and b!75817 res!39957) b!75818))

(declare-fun m!75683 () Bool)

(assert (=> d!18107 m!75683))

(declare-fun m!75685 () Bool)

(assert (=> d!18107 m!75685))

(declare-fun m!75687 () Bool)

(assert (=> d!18107 m!75687))

(declare-fun m!75689 () Bool)

(assert (=> d!18107 m!75689))

(declare-fun m!75691 () Bool)

(assert (=> b!75817 m!75691))

(declare-fun m!75693 () Bool)

(assert (=> b!75818 m!75693))

(assert (=> b!75255 d!18107))

(assert (=> b!75135 d!17973))

(declare-fun b!75819 () Bool)

(declare-fun e!49506 () Bool)

(declare-fun call!6786 () Bool)

(assert (=> b!75819 (= e!49506 call!6786)))

(declare-fun d!18109 () Bool)

(declare-fun res!39960 () Bool)

(declare-fun e!49508 () Bool)

(assert (=> d!18109 (=> res!39960 e!49508)))

(assert (=> d!18109 (= res!39960 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2095 (_keys!3889 (v!2548 (underlying!265 thiss!992))))))))

(assert (=> d!18109 (= (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!11425 (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476) Nil!1476)) e!49508)))

(declare-fun b!75820 () Bool)

(assert (=> b!75820 (= e!49506 call!6786)))

(declare-fun e!49509 () Bool)

(declare-fun b!75821 () Bool)

(assert (=> b!75821 (= e!49509 (contains!725 (ite c!11425 (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476) Nil!1476) (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun c!11544 () Bool)

(declare-fun bm!6783 () Bool)

(assert (=> bm!6783 (= call!6786 (arrayNoDuplicates!0 (_keys!3889 (v!2548 (underlying!265 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!11544 (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!11425 (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476) Nil!1476)) (ite c!11425 (Cons!1475 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) from!355) Nil!1476) Nil!1476))))))

(declare-fun b!75822 () Bool)

(declare-fun e!49507 () Bool)

(assert (=> b!75822 (= e!49508 e!49507)))

(declare-fun res!39961 () Bool)

(assert (=> b!75822 (=> (not res!39961) (not e!49507))))

(assert (=> b!75822 (= res!39961 (not e!49509))))

(declare-fun res!39959 () Bool)

(assert (=> b!75822 (=> (not res!39959) (not e!49509))))

(assert (=> b!75822 (= res!39959 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!75823 () Bool)

(assert (=> b!75823 (= e!49507 e!49506)))

(assert (=> b!75823 (= c!11544 (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!18109 (not res!39960)) b!75822))

(assert (= (and b!75822 res!39959) b!75821))

(assert (= (and b!75822 res!39961) b!75823))

(assert (= (and b!75823 c!11544) b!75819))

(assert (= (and b!75823 (not c!11544)) b!75820))

(assert (= (or b!75819 b!75820) bm!6783))

(declare-fun m!75695 () Bool)

(assert (=> b!75821 m!75695))

(assert (=> b!75821 m!75695))

(declare-fun m!75697 () Bool)

(assert (=> b!75821 m!75697))

(assert (=> bm!6783 m!75695))

(declare-fun m!75699 () Bool)

(assert (=> bm!6783 m!75699))

(assert (=> b!75822 m!75695))

(assert (=> b!75822 m!75695))

(declare-fun m!75701 () Bool)

(assert (=> b!75822 m!75701))

(assert (=> b!75823 m!75695))

(assert (=> b!75823 m!75695))

(assert (=> b!75823 m!75701))

(assert (=> bm!6722 d!18109))

(declare-fun bm!6784 () Bool)

(declare-fun call!6787 () Bool)

(assert (=> bm!6784 (= call!6787 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3889 newMap!16) (mask!6210 newMap!16)))))

(declare-fun b!75825 () Bool)

(declare-fun e!49510 () Bool)

(declare-fun e!49511 () Bool)

(assert (=> b!75825 (= e!49510 e!49511)))

(declare-fun lt!34420 () (_ BitVec 64))

(assert (=> b!75825 (= lt!34420 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!34419 () Unit!2157)

(assert (=> b!75825 (= lt!34419 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3889 newMap!16) lt!34420 #b00000000000000000000000000000000))))

(assert (=> b!75825 (arrayContainsKey!0 (_keys!3889 newMap!16) lt!34420 #b00000000000000000000000000000000)))

(declare-fun lt!34421 () Unit!2157)

(assert (=> b!75825 (= lt!34421 lt!34419)))

(declare-fun res!39963 () Bool)

(assert (=> b!75825 (= res!39963 (= (seekEntryOrOpen!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000) (_keys!3889 newMap!16) (mask!6210 newMap!16)) (Found!231 #b00000000000000000000000000000000)))))

(assert (=> b!75825 (=> (not res!39963) (not e!49511))))

(declare-fun b!75826 () Bool)

(assert (=> b!75826 (= e!49511 call!6787)))

(declare-fun b!75827 () Bool)

(assert (=> b!75827 (= e!49510 call!6787)))

(declare-fun b!75824 () Bool)

(declare-fun e!49512 () Bool)

(assert (=> b!75824 (= e!49512 e!49510)))

(declare-fun c!11545 () Bool)

(assert (=> b!75824 (= c!11545 (validKeyInArray!0 (select (arr!1856 (_keys!3889 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!18111 () Bool)

(declare-fun res!39962 () Bool)

(assert (=> d!18111 (=> res!39962 e!49512)))

(assert (=> d!18111 (= res!39962 (bvsge #b00000000000000000000000000000000 (size!2095 (_keys!3889 newMap!16))))))

(assert (=> d!18111 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3889 newMap!16) (mask!6210 newMap!16)) e!49512)))

(assert (= (and d!18111 (not res!39962)) b!75824))

(assert (= (and b!75824 c!11545) b!75825))

(assert (= (and b!75824 (not c!11545)) b!75827))

(assert (= (and b!75825 res!39963) b!75826))

(assert (= (or b!75826 b!75827) bm!6784))

(declare-fun m!75703 () Bool)

(assert (=> bm!6784 m!75703))

(assert (=> b!75825 m!75131))

(declare-fun m!75705 () Bool)

(assert (=> b!75825 m!75705))

(declare-fun m!75707 () Bool)

(assert (=> b!75825 m!75707))

(assert (=> b!75825 m!75131))

(declare-fun m!75709 () Bool)

(assert (=> b!75825 m!75709))

(assert (=> b!75824 m!75131))

(assert (=> b!75824 m!75131))

(assert (=> b!75824 m!75137))

(assert (=> b!75075 d!18111))

(declare-fun d!18113 () Bool)

(declare-fun e!49513 () Bool)

(assert (=> d!18113 e!49513))

(declare-fun res!39964 () Bool)

(assert (=> d!18113 (=> res!39964 e!49513)))

(declare-fun lt!34423 () Bool)

(assert (=> d!18113 (= res!39964 (not lt!34423))))

(declare-fun lt!34425 () Bool)

(assert (=> d!18113 (= lt!34423 lt!34425)))

(declare-fun lt!34424 () Unit!2157)

(declare-fun e!49514 () Unit!2157)

(assert (=> d!18113 (= lt!34424 e!49514)))

(declare-fun c!11546 () Bool)

(assert (=> d!18113 (= c!11546 lt!34425)))

(assert (=> d!18113 (= lt!34425 (containsKey!138 (toList!719 lt!34011) (_1!1075 lt!33761)))))

(assert (=> d!18113 (= (contains!723 lt!34011 (_1!1075 lt!33761)) lt!34423)))

(declare-fun b!75828 () Bool)

(declare-fun lt!34422 () Unit!2157)

(assert (=> b!75828 (= e!49514 lt!34422)))

(assert (=> b!75828 (= lt!34422 (lemmaContainsKeyImpliesGetValueByKeyDefined!86 (toList!719 lt!34011) (_1!1075 lt!33761)))))

(assert (=> b!75828 (isDefined!87 (getValueByKey!135 (toList!719 lt!34011) (_1!1075 lt!33761)))))

(declare-fun b!75829 () Bool)

(declare-fun Unit!2185 () Unit!2157)

(assert (=> b!75829 (= e!49514 Unit!2185)))

(declare-fun b!75830 () Bool)

(assert (=> b!75830 (= e!49513 (isDefined!87 (getValueByKey!135 (toList!719 lt!34011) (_1!1075 lt!33761))))))

(assert (= (and d!18113 c!11546) b!75828))

(assert (= (and d!18113 (not c!11546)) b!75829))

(assert (= (and d!18113 (not res!39964)) b!75830))

(declare-fun m!75711 () Bool)

(assert (=> d!18113 m!75711))

(declare-fun m!75713 () Bool)

(assert (=> b!75828 m!75713))

(assert (=> b!75828 m!74789))

(assert (=> b!75828 m!74789))

(declare-fun m!75715 () Bool)

(assert (=> b!75828 m!75715))

(assert (=> b!75830 m!74789))

(assert (=> b!75830 m!74789))

(assert (=> b!75830 m!75715))

(assert (=> d!17881 d!18113))

(declare-fun b!75831 () Bool)

(declare-fun e!49515 () Option!141)

(assert (=> b!75831 (= e!49515 (Some!140 (_2!1075 (h!2062 lt!34009))))))

(declare-fun d!18115 () Bool)

(declare-fun c!11547 () Bool)

(assert (=> d!18115 (= c!11547 (and ((_ is Cons!1474) lt!34009) (= (_1!1075 (h!2062 lt!34009)) (_1!1075 lt!33761))))))

(assert (=> d!18115 (= (getValueByKey!135 lt!34009 (_1!1075 lt!33761)) e!49515)))

(declare-fun b!75834 () Bool)

(declare-fun e!49516 () Option!141)

(assert (=> b!75834 (= e!49516 None!139)))

(declare-fun b!75832 () Bool)

(assert (=> b!75832 (= e!49515 e!49516)))

(declare-fun c!11548 () Bool)

(assert (=> b!75832 (= c!11548 (and ((_ is Cons!1474) lt!34009) (not (= (_1!1075 (h!2062 lt!34009)) (_1!1075 lt!33761)))))))

(declare-fun b!75833 () Bool)

(assert (=> b!75833 (= e!49516 (getValueByKey!135 (t!5048 lt!34009) (_1!1075 lt!33761)))))

(assert (= (and d!18115 c!11547) b!75831))

(assert (= (and d!18115 (not c!11547)) b!75832))

(assert (= (and b!75832 c!11548) b!75833))

(assert (= (and b!75832 (not c!11548)) b!75834))

(declare-fun m!75717 () Bool)

(assert (=> b!75833 m!75717))

(assert (=> d!17881 d!18115))

(declare-fun d!18117 () Bool)

(assert (=> d!18117 (= (getValueByKey!135 lt!34009 (_1!1075 lt!33761)) (Some!140 (_2!1075 lt!33761)))))

(declare-fun lt!34426 () Unit!2157)

(assert (=> d!18117 (= lt!34426 (choose!434 lt!34009 (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(declare-fun e!49517 () Bool)

(assert (=> d!18117 e!49517))

(declare-fun res!39965 () Bool)

(assert (=> d!18117 (=> (not res!39965) (not e!49517))))

(assert (=> d!18117 (= res!39965 (isStrictlySorted!280 lt!34009))))

(assert (=> d!18117 (= (lemmaContainsTupThenGetReturnValue!52 lt!34009 (_1!1075 lt!33761) (_2!1075 lt!33761)) lt!34426)))

(declare-fun b!75835 () Bool)

(declare-fun res!39966 () Bool)

(assert (=> b!75835 (=> (not res!39966) (not e!49517))))

(assert (=> b!75835 (= res!39966 (containsKey!138 lt!34009 (_1!1075 lt!33761)))))

(declare-fun b!75836 () Bool)

(assert (=> b!75836 (= e!49517 (contains!724 lt!34009 (tuple2!2129 (_1!1075 lt!33761) (_2!1075 lt!33761))))))

(assert (= (and d!18117 res!39965) b!75835))

(assert (= (and b!75835 res!39966) b!75836))

(assert (=> d!18117 m!74783))

(declare-fun m!75719 () Bool)

(assert (=> d!18117 m!75719))

(declare-fun m!75721 () Bool)

(assert (=> d!18117 m!75721))

(declare-fun m!75723 () Bool)

(assert (=> b!75835 m!75723))

(declare-fun m!75725 () Bool)

(assert (=> b!75836 m!75725))

(assert (=> d!17881 d!18117))

(declare-fun c!11551 () Bool)

(declare-fun e!49521 () List!1478)

(declare-fun b!75837 () Bool)

(declare-fun c!11552 () Bool)

(assert (=> b!75837 (= e!49521 (ite c!11552 (t!5048 (toList!719 lt!33762)) (ite c!11551 (Cons!1474 (h!2062 (toList!719 lt!33762)) (t!5048 (toList!719 lt!33762))) Nil!1475)))))

(declare-fun call!6789 () List!1478)

(declare-fun c!11550 () Bool)

(declare-fun bm!6785 () Bool)

(assert (=> bm!6785 (= call!6789 ($colon$colon!66 e!49521 (ite c!11550 (h!2062 (toList!719 lt!33762)) (tuple2!2129 (_1!1075 lt!33761) (_2!1075 lt!33761)))))))

(declare-fun c!11549 () Bool)

(assert (=> bm!6785 (= c!11549 c!11550)))

(declare-fun b!75839 () Bool)

(declare-fun e!49518 () List!1478)

(assert (=> b!75839 (= e!49518 call!6789)))

(declare-fun b!75840 () Bool)

(declare-fun e!49519 () List!1478)

(declare-fun call!6788 () List!1478)

(assert (=> b!75840 (= e!49519 call!6788)))

(declare-fun b!75841 () Bool)

(assert (=> b!75841 (= c!11551 (and ((_ is Cons!1474) (toList!719 lt!33762)) (bvsgt (_1!1075 (h!2062 (toList!719 lt!33762))) (_1!1075 lt!33761))))))

(declare-fun e!49522 () List!1478)

(assert (=> b!75841 (= e!49522 e!49519)))

(declare-fun b!75842 () Bool)

(declare-fun res!39968 () Bool)

(declare-fun e!49520 () Bool)

(assert (=> b!75842 (=> (not res!39968) (not e!49520))))

(declare-fun lt!34427 () List!1478)

(assert (=> b!75842 (= res!39968 (containsKey!138 lt!34427 (_1!1075 lt!33761)))))

(declare-fun d!18119 () Bool)

(assert (=> d!18119 e!49520))

(declare-fun res!39967 () Bool)

(assert (=> d!18119 (=> (not res!39967) (not e!49520))))

(assert (=> d!18119 (= res!39967 (isStrictlySorted!280 lt!34427))))

(assert (=> d!18119 (= lt!34427 e!49518)))

(assert (=> d!18119 (= c!11550 (and ((_ is Cons!1474) (toList!719 lt!33762)) (bvslt (_1!1075 (h!2062 (toList!719 lt!33762))) (_1!1075 lt!33761))))))

(assert (=> d!18119 (isStrictlySorted!280 (toList!719 lt!33762))))

(assert (=> d!18119 (= (insertStrictlySorted!55 (toList!719 lt!33762) (_1!1075 lt!33761) (_2!1075 lt!33761)) lt!34427)))

(declare-fun b!75838 () Bool)

(declare-fun call!6790 () List!1478)

(assert (=> b!75838 (= e!49522 call!6790)))

(declare-fun b!75843 () Bool)

(assert (=> b!75843 (= e!49520 (contains!724 lt!34427 (tuple2!2129 (_1!1075 lt!33761) (_2!1075 lt!33761))))))

(declare-fun bm!6786 () Bool)

(assert (=> bm!6786 (= call!6790 call!6789)))

(declare-fun b!75844 () Bool)

(assert (=> b!75844 (= e!49521 (insertStrictlySorted!55 (t!5048 (toList!719 lt!33762)) (_1!1075 lt!33761) (_2!1075 lt!33761)))))

(declare-fun bm!6787 () Bool)

(assert (=> bm!6787 (= call!6788 call!6790)))

(declare-fun b!75845 () Bool)

(assert (=> b!75845 (= e!49519 call!6788)))

(declare-fun b!75846 () Bool)

(assert (=> b!75846 (= e!49518 e!49522)))

(assert (=> b!75846 (= c!11552 (and ((_ is Cons!1474) (toList!719 lt!33762)) (= (_1!1075 (h!2062 (toList!719 lt!33762))) (_1!1075 lt!33761))))))

(assert (= (and d!18119 c!11550) b!75839))

(assert (= (and d!18119 (not c!11550)) b!75846))

(assert (= (and b!75846 c!11552) b!75838))

(assert (= (and b!75846 (not c!11552)) b!75841))

(assert (= (and b!75841 c!11551) b!75840))

(assert (= (and b!75841 (not c!11551)) b!75845))

(assert (= (or b!75840 b!75845) bm!6787))

(assert (= (or b!75838 bm!6787) bm!6786))

(assert (= (or b!75839 bm!6786) bm!6785))

(assert (= (and bm!6785 c!11549) b!75844))

(assert (= (and bm!6785 (not c!11549)) b!75837))

(assert (= (and d!18119 res!39967) b!75842))

(assert (= (and b!75842 res!39968) b!75843))

(declare-fun m!75727 () Bool)

(assert (=> b!75843 m!75727))

(declare-fun m!75729 () Bool)

(assert (=> b!75844 m!75729))

(declare-fun m!75731 () Bool)

(assert (=> bm!6785 m!75731))

(declare-fun m!75733 () Bool)

(assert (=> b!75842 m!75733))

(declare-fun m!75735 () Bool)

(assert (=> d!18119 m!75735))

(assert (=> d!18119 m!75083))

(assert (=> d!17881 d!18119))

(declare-fun d!18121 () Bool)

(assert (=> d!18121 (= (validKeyInArray!0 (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1856 (_keys!3889 (v!2548 (underlying!265 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!75331 d!18121))

(assert (=> b!75361 d!18007))

(declare-fun condMapEmpty!3209 () Bool)

(declare-fun mapDefault!3209 () ValueCell!896)

(assert (=> mapNonEmpty!3208 (= condMapEmpty!3209 (= mapRest!3208 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3209)))))

(declare-fun e!49524 () Bool)

(declare-fun mapRes!3209 () Bool)

(assert (=> mapNonEmpty!3208 (= tp!8590 (and e!49524 mapRes!3209))))

(declare-fun mapNonEmpty!3209 () Bool)

(declare-fun tp!8591 () Bool)

(declare-fun e!49523 () Bool)

(assert (=> mapNonEmpty!3209 (= mapRes!3209 (and tp!8591 e!49523))))

(declare-fun mapKey!3209 () (_ BitVec 32))

(declare-fun mapRest!3209 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapValue!3209 () ValueCell!896)

(assert (=> mapNonEmpty!3209 (= mapRest!3208 (store mapRest!3209 mapKey!3209 mapValue!3209))))

(declare-fun b!75848 () Bool)

(assert (=> b!75848 (= e!49524 tp_is_empty!2479)))

(declare-fun b!75847 () Bool)

(assert (=> b!75847 (= e!49523 tp_is_empty!2479)))

(declare-fun mapIsEmpty!3209 () Bool)

(assert (=> mapIsEmpty!3209 mapRes!3209))

(assert (= (and mapNonEmpty!3208 condMapEmpty!3209) mapIsEmpty!3209))

(assert (= (and mapNonEmpty!3208 (not condMapEmpty!3209)) mapNonEmpty!3209))

(assert (= (and mapNonEmpty!3209 ((_ is ValueCellFull!896) mapValue!3209)) b!75847))

(assert (= (and mapNonEmpty!3208 ((_ is ValueCellFull!896) mapDefault!3209)) b!75848))

(declare-fun m!75737 () Bool)

(assert (=> mapNonEmpty!3209 m!75737))

(declare-fun condMapEmpty!3210 () Bool)

(declare-fun mapDefault!3210 () ValueCell!896)

(assert (=> mapNonEmpty!3207 (= condMapEmpty!3210 (= mapRest!3207 ((as const (Array (_ BitVec 32) ValueCell!896)) mapDefault!3210)))))

(declare-fun e!49526 () Bool)

(declare-fun mapRes!3210 () Bool)

(assert (=> mapNonEmpty!3207 (= tp!8589 (and e!49526 mapRes!3210))))

(declare-fun mapNonEmpty!3210 () Bool)

(declare-fun tp!8592 () Bool)

(declare-fun e!49525 () Bool)

(assert (=> mapNonEmpty!3210 (= mapRes!3210 (and tp!8592 e!49525))))

(declare-fun mapRest!3210 () (Array (_ BitVec 32) ValueCell!896))

(declare-fun mapValue!3210 () ValueCell!896)

(declare-fun mapKey!3210 () (_ BitVec 32))

(assert (=> mapNonEmpty!3210 (= mapRest!3207 (store mapRest!3210 mapKey!3210 mapValue!3210))))

(declare-fun b!75850 () Bool)

(assert (=> b!75850 (= e!49526 tp_is_empty!2479)))

(declare-fun b!75849 () Bool)

(assert (=> b!75849 (= e!49525 tp_is_empty!2479)))

(declare-fun mapIsEmpty!3210 () Bool)

(assert (=> mapIsEmpty!3210 mapRes!3210))

(assert (= (and mapNonEmpty!3207 condMapEmpty!3210) mapIsEmpty!3210))

(assert (= (and mapNonEmpty!3207 (not condMapEmpty!3210)) mapNonEmpty!3210))

(assert (= (and mapNonEmpty!3210 ((_ is ValueCellFull!896) mapValue!3210)) b!75849))

(assert (= (and mapNonEmpty!3207 ((_ is ValueCellFull!896) mapDefault!3210)) b!75850))

(declare-fun m!75739 () Bool)

(assert (=> mapNonEmpty!3210 m!75739))

(declare-fun b_lambda!3407 () Bool)

(assert (= b_lambda!3401 (or (and b!74909 b_free!2125) (and b!74910 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))) b_lambda!3407)))

(declare-fun b_lambda!3409 () Bool)

(assert (= b_lambda!3405 (or (and b!74909 b_free!2125 (= (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) (defaultEntry!2233 newMap!16))) (and b!74910 b_free!2127) b_lambda!3409)))

(declare-fun b_lambda!3411 () Bool)

(assert (= b_lambda!3399 (or (and b!74909 b_free!2125) (and b!74910 b_free!2127 (= (defaultEntry!2233 newMap!16) (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))))) b_lambda!3411)))

(declare-fun b_lambda!3413 () Bool)

(assert (= b_lambda!3403 (or (and b!74909 b_free!2125 (= (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) (defaultEntry!2233 newMap!16))) (and b!74910 b_free!2127) b_lambda!3413)))

(declare-fun b_lambda!3415 () Bool)

(assert (= b_lambda!3397 (or (and b!74909 b_free!2125 (= (defaultEntry!2233 (v!2548 (underlying!265 thiss!992))) (defaultEntry!2233 newMap!16))) (and b!74910 b_free!2127) b_lambda!3415)))

(check-sat (not bm!6781) (not b!75733) (not b!75510) (not b!75732) (not d!17935) (not d!18035) (not d!17951) (not b!75775) (not b!75685) (not b!75821) (not b!75680) (not b!75712) (not b!75436) (not d!17987) (not d!17985) (not b!75671) (not b!75552) (not b_lambda!3391) (not b!75425) (not b!75471) (not d!18055) (not b!75498) (not d!17933) (not b!75731) (not b!75818) (not d!18043) (not b!75419) (not b!75669) (not d!17979) (not bm!6744) (not d!17965) (not d!17991) (not b!75703) (not d!18085) (not b!75843) (not d!18065) (not b!75437) (not b!75599) (not b!75696) (not b!75594) (not b!75524) (not d!18113) (not d!18063) (not b!75604) (not b!75817) (not b!75525) (not d!17993) (not d!18119) (not b_next!2125) tp_is_empty!2479 (not bm!6731) (not b!75705) (not d!18099) (not b!75430) (not bm!6779) (not b!75701) (not d!18091) (not bm!6748) (not d!17961) (not b!75784) (not d!18023) (not b!75515) (not d!17975) (not b!75825) (not d!17929) (not b!75763) (not b!75608) (not bm!6759) (not b!75673) (not d!18017) (not b!75591) (not b!75554) (not b!75718) (not b!75695) (not b!75624) (not b_lambda!3413) (not b!75665) (not b!75814) (not b!75774) (not d!18097) (not b!75518) (not d!18029) (not b!75440) (not bm!6766) (not b!75747) (not b!75803) (not d!18089) (not b!75713) (not bm!6764) (not bm!6762) (not d!17921) (not b!75687) (not d!18059) (not b!75561) (not b!75815) (not d!18077) (not b!75544) (not d!17969) (not d!18083) (not b!75721) (not b!75792) (not b!75455) (not bm!6785) (not b!75730) (not d!17923) (not b!75694) (not b!75722) (not d!17927) (not b!75457) (not d!18117) (not bm!6784) (not b!75742) (not b!75836) (not d!18001) (not bm!6752) (not b!75508) (not bm!6750) (not b!75822) (not b_lambda!3415) (not b!75409) (not b!75533) (not b!75835) (not b!75529) (not b!75799) (not b!75766) (not b!75559) (not b!75411) (not b!75790) (not bm!6773) (not b!75612) (not b!75711) (not d!17967) (not d!17939) (not d!17917) (not d!18069) (not b_lambda!3407) (not d!17911) (not d!18075) (not b_lambda!3411) (not b!75597) (not b!75779) (not b!75557) (not b!75442) (not d!18047) (not b_lambda!3409) (not mapNonEmpty!3210) (not b!75426) (not b!75649) (not bm!6768) (not d!18053) (not b!75823) (not d!17959) (not b!75429) (not b!75465) (not d!18057) (not d!18105) (not b!75549) (not b!75758) (not bm!6783) (not d!18041) (not b!75748) (not b_lambda!3383) (not b!75462) (not bm!6772) (not b!75753) (not b!75416) (not d!17963) (not d!18005) (not b!75517) (not bm!6732) (not b!75791) (not b!75505) (not d!17915) (not b!75536) (not b!75842) (not b!75459) (not b!75613) b_and!4637 (not d!17913) (not b!75472) (not b!75406) (not b!75759) (not d!18107) (not b!75611) (not b!75824) (not b!75745) (not b!75537) (not b_next!2127) (not b!75433) (not b!75749) (not b!75793) (not b!75752) (not b!75833) (not b!75796) (not b!75434) (not d!17931) (not b!75526) (not bm!6753) (not b!75670) (not b!75438) (not b!75428) (not b!75603) (not d!18073) (not d!17943) (not b!75601) (not d!18039) (not bm!6771) (not b!75844) (not bm!6760) (not d!18081) (not b!75431) (not d!17997) (not b_lambda!3395) (not d!18093) (not b!75724) (not b!75512) (not d!17947) (not mapNonEmpty!3209) (not b!75755) (not b_lambda!3393) (not bm!6754) (not b!75500) (not b!75620) (not d!18009) (not d!18095) (not b!75767) (not b!75458) (not b!75734) (not d!18079) (not bm!6767) (not b!75551) (not b!75626) (not b!75435) (not d!18071) (not d!17949) (not d!18031) (not d!18013) (not b!75735) (not bm!6733) (not b!75441) (not d!17925) (not b!75666) (not b!75423) (not d!18049) (not bm!6777) (not b!75460) (not d!17941) (not b!75743) (not b!75699) (not b!75828) (not bm!6741) (not b!75830) (not b!75560) (not b!75676) (not b!75756) (not b!75768) (not d!18061) (not d!18067) (not b!75688) (not d!17977) (not b!75744) b_and!4639 (not b!75625) (not b!75682) (not b!75556) (not b!75444) (not b!75741) (not b!75545) (not b!75794) (not d!18037) (not b!75619) (not d!17909) (not b!75727) (not b!75503) (not b!75538) (not b!75439) (not bm!6782) (not d!18051) (not d!18045) (not d!17955) (not d!18015) (not b!75499) (not d!17983) (not b!75634) (not b!75420) (not b!75662))
(check-sat b_and!4637 b_and!4639 (not b_next!2125) (not b_next!2127))
