; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15258 () Bool)

(assert start!15258)

(declare-fun b!147165 () Bool)

(declare-fun b_free!3149 () Bool)

(declare-fun b_next!3149 () Bool)

(assert (=> b!147165 (= b_free!3149 (not b_next!3149))))

(declare-fun tp!11956 () Bool)

(declare-fun b_and!9235 () Bool)

(assert (=> b!147165 (= tp!11956 b_and!9235)))

(declare-fun b!147164 () Bool)

(declare-fun b_free!3151 () Bool)

(declare-fun b_next!3151 () Bool)

(assert (=> b!147164 (= b_free!3151 (not b_next!3151))))

(declare-fun tp!11954 () Bool)

(declare-fun b_and!9237 () Bool)

(assert (=> b!147164 (= tp!11954 b_and!9237)))

(declare-fun b!147158 () Bool)

(declare-datatypes ((Unit!4650 0))(
  ( (Unit!4651) )
))
(declare-fun e!96094 () Unit!4650)

(declare-fun Unit!4652 () Unit!4650)

(assert (=> b!147158 (= e!96094 Unit!4652)))

(declare-fun b!147159 () Bool)

(declare-fun e!96082 () Bool)

(declare-fun e!96081 () Bool)

(declare-fun mapRes!5049 () Bool)

(assert (=> b!147159 (= e!96082 (and e!96081 mapRes!5049))))

(declare-fun condMapEmpty!5050 () Bool)

(declare-datatypes ((V!3635 0))(
  ( (V!3636 (val!1540 Int)) )
))
(declare-datatypes ((array!5029 0))(
  ( (array!5030 (arr!2375 (Array (_ BitVec 32) (_ BitVec 64))) (size!2651 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1152 0))(
  ( (ValueCellFull!1152 (v!3371 V!3635)) (EmptyCell!1152) )
))
(declare-datatypes ((array!5031 0))(
  ( (array!5032 (arr!2376 (Array (_ BitVec 32) ValueCell!1152)) (size!2652 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1212 0))(
  ( (LongMapFixedSize!1213 (defaultEntry!3025 Int) (mask!7407 (_ BitVec 32)) (extraKeys!2770 (_ BitVec 32)) (zeroValue!2870 V!3635) (minValue!2870 V!3635) (_size!655 (_ BitVec 32)) (_keys!4794 array!5029) (_values!3008 array!5031) (_vacant!655 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!994 0))(
  ( (Cell!995 (v!3372 LongMapFixedSize!1212)) )
))
(declare-datatypes ((LongMap!994 0))(
  ( (LongMap!995 (underlying!508 Cell!994)) )
))
(declare-fun thiss!992 () LongMap!994)

(declare-fun mapDefault!5049 () ValueCell!1152)

(assert (=> b!147159 (= condMapEmpty!5050 (= (arr!2376 (_values!3008 (v!3372 (underlying!508 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1152)) mapDefault!5049)))))

(declare-fun b!147160 () Bool)

(declare-fun res!69953 () Bool)

(declare-fun e!96083 () Bool)

(assert (=> b!147160 (=> (not res!69953) (not e!96083))))

(declare-fun newMap!16 () LongMapFixedSize!1212)

(declare-fun valid!592 (LongMapFixedSize!1212) Bool)

(assert (=> b!147160 (= res!69953 (valid!592 newMap!16))))

(declare-fun b!147161 () Bool)

(declare-fun e!96084 () Bool)

(assert (=> b!147161 (= e!96084 false)))

(declare-datatypes ((tuple2!2782 0))(
  ( (tuple2!2783 (_1!1402 (_ BitVec 64)) (_2!1402 V!3635)) )
))
(declare-datatypes ((List!1787 0))(
  ( (Nil!1784) (Cons!1783 (h!2391 tuple2!2782) (t!6520 List!1787)) )
))
(declare-datatypes ((ListLongMap!1789 0))(
  ( (ListLongMap!1790 (toList!910 List!1787)) )
))
(declare-fun lt!77657 () ListLongMap!1789)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!156 (array!5029 array!5031 (_ BitVec 32) (_ BitVec 32) V!3635 V!3635 (_ BitVec 32) Int) ListLongMap!1789)

(assert (=> b!147161 (= lt!77657 (getCurrentListMapNoExtraKeys!156 (_keys!4794 (v!3372 (underlying!508 thiss!992))) (_values!3008 (v!3372 (underlying!508 thiss!992))) (mask!7407 (v!3372 (underlying!508 thiss!992))) (extraKeys!2770 (v!3372 (underlying!508 thiss!992))) (zeroValue!2870 (v!3372 (underlying!508 thiss!992))) (minValue!2870 (v!3372 (underlying!508 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3025 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun b!147162 () Bool)

(declare-fun e!96080 () Bool)

(declare-fun e!96095 () Bool)

(assert (=> b!147162 (= e!96080 e!96095)))

(declare-fun b!147163 () Bool)

(declare-fun e!96090 () Bool)

(assert (=> b!147163 (= e!96090 e!96080)))

(declare-fun tp_is_empty!2991 () Bool)

(declare-fun e!96091 () Bool)

(declare-fun e!96085 () Bool)

(declare-fun array_inv!1493 (array!5029) Bool)

(declare-fun array_inv!1494 (array!5031) Bool)

(assert (=> b!147164 (= e!96085 (and tp!11954 tp_is_empty!2991 (array_inv!1493 (_keys!4794 newMap!16)) (array_inv!1494 (_values!3008 newMap!16)) e!96091))))

(assert (=> b!147165 (= e!96095 (and tp!11956 tp_is_empty!2991 (array_inv!1493 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) (array_inv!1494 (_values!3008 (v!3372 (underlying!508 thiss!992)))) e!96082))))

(declare-fun b!147166 () Bool)

(declare-fun e!96089 () Bool)

(assert (=> b!147166 (= e!96089 tp_is_empty!2991)))

(declare-fun b!147167 () Bool)

(declare-fun Unit!4653 () Unit!4650)

(assert (=> b!147167 (= e!96094 Unit!4653)))

(declare-fun lt!77655 () Unit!4650)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!157 (array!5029 array!5031 (_ BitVec 32) (_ BitVec 32) V!3635 V!3635 (_ BitVec 64) (_ BitVec 32) Int) Unit!4650)

(assert (=> b!147167 (= lt!77655 (lemmaListMapContainsThenArrayContainsFrom!157 (_keys!4794 (v!3372 (underlying!508 thiss!992))) (_values!3008 (v!3372 (underlying!508 thiss!992))) (mask!7407 (v!3372 (underlying!508 thiss!992))) (extraKeys!2770 (v!3372 (underlying!508 thiss!992))) (zeroValue!2870 (v!3372 (underlying!508 thiss!992))) (minValue!2870 (v!3372 (underlying!508 thiss!992))) (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3025 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147167 (arrayContainsKey!0 (_keys!4794 (v!3372 (underlying!508 thiss!992))) (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77654 () Unit!4650)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5029 (_ BitVec 32) (_ BitVec 32)) Unit!4650)

(assert (=> b!147167 (= lt!77654 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4794 (v!3372 (underlying!508 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1788 0))(
  ( (Nil!1785) (Cons!1784 (h!2392 (_ BitVec 64)) (t!6521 List!1788)) )
))
(declare-fun arrayNoDuplicates!0 (array!5029 (_ BitVec 32) List!1788) Bool)

(assert (=> b!147167 (arrayNoDuplicates!0 (_keys!4794 (v!3372 (underlying!508 thiss!992))) from!355 Nil!1785)))

(declare-fun lt!77652 () Unit!4650)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5029 (_ BitVec 32) (_ BitVec 64) List!1788) Unit!4650)

(assert (=> b!147167 (= lt!77652 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4794 (v!3372 (underlying!508 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355) (Cons!1784 (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355) Nil!1785)))))

(assert (=> b!147167 false))

(declare-fun b!147168 () Bool)

(declare-fun res!69956 () Bool)

(assert (=> b!147168 (=> (not res!69956) (not e!96083))))

(assert (=> b!147168 (= res!69956 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7407 newMap!16)) (_size!655 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun res!69952 () Bool)

(assert (=> start!15258 (=> (not res!69952) (not e!96083))))

(declare-fun valid!593 (LongMap!994) Bool)

(assert (=> start!15258 (= res!69952 (valid!593 thiss!992))))

(assert (=> start!15258 e!96083))

(assert (=> start!15258 e!96090))

(assert (=> start!15258 true))

(assert (=> start!15258 e!96085))

(declare-fun b!147169 () Bool)

(declare-fun e!96087 () Bool)

(declare-fun mapRes!5050 () Bool)

(assert (=> b!147169 (= e!96091 (and e!96087 mapRes!5050))))

(declare-fun condMapEmpty!5049 () Bool)

(declare-fun mapDefault!5050 () ValueCell!1152)

(assert (=> b!147169 (= condMapEmpty!5049 (= (arr!2376 (_values!3008 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1152)) mapDefault!5050)))))

(declare-fun b!147170 () Bool)

(declare-fun e!96086 () Bool)

(assert (=> b!147170 (= e!96086 tp_is_empty!2991)))

(declare-fun mapNonEmpty!5049 () Bool)

(declare-fun tp!11955 () Bool)

(assert (=> mapNonEmpty!5049 (= mapRes!5049 (and tp!11955 e!96086))))

(declare-fun mapValue!5050 () ValueCell!1152)

(declare-fun mapRest!5049 () (Array (_ BitVec 32) ValueCell!1152))

(declare-fun mapKey!5049 () (_ BitVec 32))

(assert (=> mapNonEmpty!5049 (= (arr!2376 (_values!3008 (v!3372 (underlying!508 thiss!992)))) (store mapRest!5049 mapKey!5049 mapValue!5050))))

(declare-fun mapIsEmpty!5049 () Bool)

(assert (=> mapIsEmpty!5049 mapRes!5049))

(declare-fun b!147171 () Bool)

(assert (=> b!147171 (= e!96087 tp_is_empty!2991)))

(declare-fun mapIsEmpty!5050 () Bool)

(assert (=> mapIsEmpty!5050 mapRes!5050))

(declare-fun b!147172 () Bool)

(declare-fun e!96092 () Bool)

(assert (=> b!147172 (= e!96083 e!96092)))

(declare-fun res!69955 () Bool)

(assert (=> b!147172 (=> (not res!69955) (not e!96092))))

(declare-fun lt!77656 () ListLongMap!1789)

(declare-fun lt!77653 () ListLongMap!1789)

(assert (=> b!147172 (= res!69955 (and (= lt!77653 lt!77656) (not (= (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1480 (LongMapFixedSize!1212) ListLongMap!1789)

(assert (=> b!147172 (= lt!77656 (map!1480 newMap!16))))

(declare-fun getCurrentListMap!578 (array!5029 array!5031 (_ BitVec 32) (_ BitVec 32) V!3635 V!3635 (_ BitVec 32) Int) ListLongMap!1789)

(assert (=> b!147172 (= lt!77653 (getCurrentListMap!578 (_keys!4794 (v!3372 (underlying!508 thiss!992))) (_values!3008 (v!3372 (underlying!508 thiss!992))) (mask!7407 (v!3372 (underlying!508 thiss!992))) (extraKeys!2770 (v!3372 (underlying!508 thiss!992))) (zeroValue!2870 (v!3372 (underlying!508 thiss!992))) (minValue!2870 (v!3372 (underlying!508 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3025 (v!3372 (underlying!508 thiss!992)))))))

(declare-fun mapNonEmpty!5050 () Bool)

(declare-fun tp!11953 () Bool)

(assert (=> mapNonEmpty!5050 (= mapRes!5050 (and tp!11953 e!96089))))

(declare-fun mapValue!5049 () ValueCell!1152)

(declare-fun mapKey!5050 () (_ BitVec 32))

(declare-fun mapRest!5050 () (Array (_ BitVec 32) ValueCell!1152))

(assert (=> mapNonEmpty!5050 (= (arr!2376 (_values!3008 newMap!16)) (store mapRest!5050 mapKey!5050 mapValue!5049))))

(declare-fun b!147173 () Bool)

(assert (=> b!147173 (= e!96081 tp_is_empty!2991)))

(declare-fun b!147174 () Bool)

(assert (=> b!147174 (= e!96092 e!96084)))

(declare-fun res!69957 () Bool)

(assert (=> b!147174 (=> (not res!69957) (not e!96084))))

(declare-datatypes ((tuple2!2784 0))(
  ( (tuple2!2785 (_1!1403 Bool) (_2!1403 LongMapFixedSize!1212)) )
))
(declare-fun lt!77659 () tuple2!2784)

(assert (=> b!147174 (= res!69957 (and (_1!1403 lt!77659) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77658 () Unit!4650)

(assert (=> b!147174 (= lt!77658 e!96094)))

(declare-fun c!27758 () Bool)

(declare-fun contains!957 (ListLongMap!1789 (_ BitVec 64)) Bool)

(assert (=> b!147174 (= c!27758 (contains!957 lt!77656 (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355)))))

(declare-fun update!230 (LongMapFixedSize!1212 (_ BitVec 64) V!3635) tuple2!2784)

(declare-fun get!1584 (ValueCell!1152 V!3635) V!3635)

(declare-fun dynLambda!462 (Int (_ BitVec 64)) V!3635)

(assert (=> b!147174 (= lt!77659 (update!230 newMap!16 (select (arr!2375 (_keys!4794 (v!3372 (underlying!508 thiss!992)))) from!355) (get!1584 (select (arr!2376 (_values!3008 (v!3372 (underlying!508 thiss!992)))) from!355) (dynLambda!462 (defaultEntry!3025 (v!3372 (underlying!508 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!147175 () Bool)

(declare-fun res!69954 () Bool)

(assert (=> b!147175 (=> (not res!69954) (not e!96083))))

(assert (=> b!147175 (= res!69954 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2651 (_keys!4794 (v!3372 (underlying!508 thiss!992)))))))))

(assert (= (and start!15258 res!69952) b!147175))

(assert (= (and b!147175 res!69954) b!147160))

(assert (= (and b!147160 res!69953) b!147168))

(assert (= (and b!147168 res!69956) b!147172))

(assert (= (and b!147172 res!69955) b!147174))

(assert (= (and b!147174 c!27758) b!147167))

(assert (= (and b!147174 (not c!27758)) b!147158))

(assert (= (and b!147174 res!69957) b!147161))

(assert (= (and b!147159 condMapEmpty!5050) mapIsEmpty!5049))

(assert (= (and b!147159 (not condMapEmpty!5050)) mapNonEmpty!5049))

(get-info :version)

(assert (= (and mapNonEmpty!5049 ((_ is ValueCellFull!1152) mapValue!5050)) b!147170))

(assert (= (and b!147159 ((_ is ValueCellFull!1152) mapDefault!5049)) b!147173))

(assert (= b!147165 b!147159))

(assert (= b!147162 b!147165))

(assert (= b!147163 b!147162))

(assert (= start!15258 b!147163))

(assert (= (and b!147169 condMapEmpty!5049) mapIsEmpty!5050))

(assert (= (and b!147169 (not condMapEmpty!5049)) mapNonEmpty!5050))

(assert (= (and mapNonEmpty!5050 ((_ is ValueCellFull!1152) mapValue!5049)) b!147166))

(assert (= (and b!147169 ((_ is ValueCellFull!1152) mapDefault!5050)) b!147171))

(assert (= b!147164 b!147169))

(assert (= start!15258 b!147164))

(declare-fun b_lambda!6589 () Bool)

(assert (=> (not b_lambda!6589) (not b!147174)))

(declare-fun t!6517 () Bool)

(declare-fun tb!2693 () Bool)

(assert (=> (and b!147165 (= (defaultEntry!3025 (v!3372 (underlying!508 thiss!992))) (defaultEntry!3025 (v!3372 (underlying!508 thiss!992)))) t!6517) tb!2693))

(declare-fun result!4397 () Bool)

(assert (=> tb!2693 (= result!4397 tp_is_empty!2991)))

(assert (=> b!147174 t!6517))

(declare-fun b_and!9239 () Bool)

(assert (= b_and!9235 (and (=> t!6517 result!4397) b_and!9239)))

(declare-fun t!6519 () Bool)

(declare-fun tb!2695 () Bool)

(assert (=> (and b!147164 (= (defaultEntry!3025 newMap!16) (defaultEntry!3025 (v!3372 (underlying!508 thiss!992)))) t!6519) tb!2695))

(declare-fun result!4401 () Bool)

(assert (= result!4401 result!4397))

(assert (=> b!147174 t!6519))

(declare-fun b_and!9241 () Bool)

(assert (= b_and!9237 (and (=> t!6519 result!4401) b_and!9241)))

(declare-fun m!176973 () Bool)

(assert (=> mapNonEmpty!5050 m!176973))

(declare-fun m!176975 () Bool)

(assert (=> b!147160 m!176975))

(declare-fun m!176977 () Bool)

(assert (=> b!147161 m!176977))

(declare-fun m!176979 () Bool)

(assert (=> b!147167 m!176979))

(declare-fun m!176981 () Bool)

(assert (=> b!147167 m!176981))

(declare-fun m!176983 () Bool)

(assert (=> b!147167 m!176983))

(declare-fun m!176985 () Bool)

(assert (=> b!147167 m!176985))

(assert (=> b!147167 m!176983))

(assert (=> b!147167 m!176983))

(declare-fun m!176987 () Bool)

(assert (=> b!147167 m!176987))

(assert (=> b!147167 m!176983))

(declare-fun m!176989 () Bool)

(assert (=> b!147167 m!176989))

(declare-fun m!176991 () Bool)

(assert (=> b!147164 m!176991))

(declare-fun m!176993 () Bool)

(assert (=> b!147164 m!176993))

(assert (=> b!147172 m!176983))

(declare-fun m!176995 () Bool)

(assert (=> b!147172 m!176995))

(declare-fun m!176997 () Bool)

(assert (=> b!147172 m!176997))

(declare-fun m!176999 () Bool)

(assert (=> start!15258 m!176999))

(declare-fun m!177001 () Bool)

(assert (=> b!147174 m!177001))

(declare-fun m!177003 () Bool)

(assert (=> b!147174 m!177003))

(declare-fun m!177005 () Bool)

(assert (=> b!147174 m!177005))

(assert (=> b!147174 m!176983))

(assert (=> b!147174 m!176983))

(assert (=> b!147174 m!177005))

(declare-fun m!177007 () Bool)

(assert (=> b!147174 m!177007))

(assert (=> b!147174 m!177001))

(assert (=> b!147174 m!177003))

(assert (=> b!147174 m!176983))

(declare-fun m!177009 () Bool)

(assert (=> b!147174 m!177009))

(declare-fun m!177011 () Bool)

(assert (=> b!147165 m!177011))

(declare-fun m!177013 () Bool)

(assert (=> b!147165 m!177013))

(declare-fun m!177015 () Bool)

(assert (=> mapNonEmpty!5049 m!177015))

(check-sat b_and!9241 (not b_next!3151) (not b_next!3149) (not b!147167) (not b!147174) (not b!147160) (not b!147164) (not b!147165) (not start!15258) b_and!9239 (not mapNonEmpty!5050) (not b!147161) tp_is_empty!2991 (not b_lambda!6589) (not b!147172) (not mapNonEmpty!5049))
(check-sat b_and!9239 b_and!9241 (not b_next!3149) (not b_next!3151))
