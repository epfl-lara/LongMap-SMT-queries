; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10134 () Bool)

(assert start!10134)

(declare-fun b!76923 () Bool)

(declare-fun b_free!2149 () Bool)

(declare-fun b_next!2149 () Bool)

(assert (=> b!76923 (= b_free!2149 (not b_next!2149))))

(declare-fun tp!8643 () Bool)

(declare-fun b_and!4701 () Bool)

(assert (=> b!76923 (= tp!8643 b_and!4701)))

(declare-fun b!76936 () Bool)

(declare-fun b_free!2151 () Bool)

(declare-fun b_next!2151 () Bool)

(assert (=> b!76936 (= b_free!2151 (not b_next!2151))))

(declare-fun tp!8645 () Bool)

(declare-fun b_and!4703 () Bool)

(assert (=> b!76936 (= tp!8645 b_and!4703)))

(declare-fun b!76917 () Bool)

(declare-fun res!40442 () Bool)

(declare-fun e!50213 () Bool)

(assert (=> b!76917 (=> res!40442 e!50213)))

(declare-datatypes ((V!2969 0))(
  ( (V!2970 (val!1290 Int)) )
))
(declare-datatypes ((array!3919 0))(
  ( (array!3920 (arr!1868 (Array (_ BitVec 32) (_ BitVec 64))) (size!2109 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!902 0))(
  ( (ValueCellFull!902 (v!2573 V!2969)) (EmptyCell!902) )
))
(declare-datatypes ((array!3921 0))(
  ( (array!3922 (arr!1869 (Array (_ BitVec 32) ValueCell!902)) (size!2110 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!712 0))(
  ( (LongMapFixedSize!713 (defaultEntry!2259 Int) (mask!6248 (_ BitVec 32)) (extraKeys!2110 (_ BitVec 32)) (zeroValue!2157 V!2969) (minValue!2157 V!2969) (_size!405 (_ BitVec 32)) (_keys!3919 array!3919) (_values!2242 array!3921) (_vacant!405 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!520 0))(
  ( (Cell!521 (v!2574 LongMapFixedSize!712)) )
))
(declare-datatypes ((LongMap!520 0))(
  ( (LongMap!521 (underlying!271 Cell!520)) )
))
(declare-fun thiss!992 () LongMap!520)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3919 (_ BitVec 32)) Bool)

(assert (=> b!76917 (= res!40442 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3919 (v!2574 (underlying!271 thiss!992))) (mask!6248 (v!2574 (underlying!271 thiss!992))))))))

(declare-fun b!76918 () Bool)

(declare-fun e!50222 () Bool)

(declare-fun tp_is_empty!2491 () Bool)

(assert (=> b!76918 (= e!50222 tp_is_empty!2491)))

(declare-fun b!76919 () Bool)

(declare-fun e!50218 () Bool)

(declare-fun mapRes!3239 () Bool)

(assert (=> b!76919 (= e!50218 (and e!50222 mapRes!3239))))

(declare-fun condMapEmpty!3239 () Bool)

(declare-fun mapDefault!3240 () ValueCell!902)

(assert (=> b!76919 (= condMapEmpty!3239 (= (arr!1869 (_values!2242 (v!2574 (underlying!271 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!902)) mapDefault!3240)))))

(declare-fun b!76920 () Bool)

(declare-fun res!40443 () Bool)

(declare-fun e!50220 () Bool)

(assert (=> b!76920 (=> (not res!40443) (not e!50220))))

(declare-fun newMap!16 () LongMapFixedSize!712)

(declare-fun valid!315 (LongMapFixedSize!712) Bool)

(assert (=> b!76920 (= res!40443 (valid!315 newMap!16))))

(declare-fun b!76921 () Bool)

(declare-fun e!50219 () Bool)

(declare-fun e!50210 () Bool)

(assert (=> b!76921 (= e!50219 e!50210)))

(declare-fun res!40446 () Bool)

(assert (=> b!76921 (=> (not res!40446) (not e!50210))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!76921 (= res!40446 (and (not (= (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!35176 () V!2969)

(declare-fun get!1169 (ValueCell!902 V!2969) V!2969)

(declare-fun dynLambda!334 (Int (_ BitVec 64)) V!2969)

(assert (=> b!76921 (= lt!35176 (get!1169 (select (arr!1869 (_values!2242 (v!2574 (underlying!271 thiss!992)))) from!355) (dynLambda!334 (defaultEntry!2259 (v!2574 (underlying!271 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!76922 () Bool)

(declare-fun e!50207 () Bool)

(assert (=> b!76922 (= e!50210 e!50207)))

(declare-fun res!40452 () Bool)

(assert (=> b!76922 (=> (not res!40452) (not e!50207))))

(declare-datatypes ((tuple2!2140 0))(
  ( (tuple2!2141 (_1!1081 Bool) (_2!1081 LongMapFixedSize!712)) )
))
(declare-fun lt!35175 () tuple2!2140)

(assert (=> b!76922 (= res!40452 (and (_1!1081 lt!35175) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2216 0))(
  ( (Unit!2217) )
))
(declare-fun lt!35179 () Unit!2216)

(declare-fun e!50211 () Unit!2216)

(assert (=> b!76922 (= lt!35179 e!50211)))

(declare-datatypes ((tuple2!2142 0))(
  ( (tuple2!2143 (_1!1082 (_ BitVec 64)) (_2!1082 V!2969)) )
))
(declare-datatypes ((List!1484 0))(
  ( (Nil!1481) (Cons!1480 (h!2068 tuple2!2142) (t!5086 List!1484)) )
))
(declare-datatypes ((ListLongMap!1415 0))(
  ( (ListLongMap!1416 (toList!723 List!1484)) )
))
(declare-fun lt!35173 () ListLongMap!1415)

(declare-fun c!11783 () Bool)

(declare-fun contains!729 (ListLongMap!1415 (_ BitVec 64)) Bool)

(assert (=> b!76922 (= c!11783 (contains!729 lt!35173 (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355)))))

(declare-fun update!113 (LongMapFixedSize!712 (_ BitVec 64) V!2969) tuple2!2140)

(assert (=> b!76922 (= lt!35175 (update!113 newMap!16 (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) lt!35176))))

(declare-fun e!50209 () Bool)

(declare-fun array_inv!1147 (array!3919) Bool)

(declare-fun array_inv!1148 (array!3921) Bool)

(assert (=> b!76923 (= e!50209 (and tp!8643 tp_is_empty!2491 (array_inv!1147 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) (array_inv!1148 (_values!2242 (v!2574 (underlying!271 thiss!992)))) e!50218))))

(declare-fun mapNonEmpty!3239 () Bool)

(declare-fun mapRes!3240 () Bool)

(declare-fun tp!8644 () Bool)

(declare-fun e!50208 () Bool)

(assert (=> mapNonEmpty!3239 (= mapRes!3240 (and tp!8644 e!50208))))

(declare-fun mapKey!3240 () (_ BitVec 32))

(declare-fun mapValue!3239 () ValueCell!902)

(declare-fun mapRest!3240 () (Array (_ BitVec 32) ValueCell!902))

(assert (=> mapNonEmpty!3239 (= (arr!1869 (_values!2242 newMap!16)) (store mapRest!3240 mapKey!3240 mapValue!3239))))

(declare-fun b!76924 () Bool)

(assert (=> b!76924 (= e!50220 e!50219)))

(declare-fun res!40445 () Bool)

(assert (=> b!76924 (=> (not res!40445) (not e!50219))))

(declare-fun lt!35170 () ListLongMap!1415)

(assert (=> b!76924 (= res!40445 (= lt!35170 lt!35173))))

(declare-fun map!1172 (LongMapFixedSize!712) ListLongMap!1415)

(assert (=> b!76924 (= lt!35173 (map!1172 newMap!16))))

(declare-fun getCurrentListMap!420 (array!3919 array!3921 (_ BitVec 32) (_ BitVec 32) V!2969 V!2969 (_ BitVec 32) Int) ListLongMap!1415)

(assert (=> b!76924 (= lt!35170 (getCurrentListMap!420 (_keys!3919 (v!2574 (underlying!271 thiss!992))) (_values!2242 (v!2574 (underlying!271 thiss!992))) (mask!6248 (v!2574 (underlying!271 thiss!992))) (extraKeys!2110 (v!2574 (underlying!271 thiss!992))) (zeroValue!2157 (v!2574 (underlying!271 thiss!992))) (minValue!2157 (v!2574 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2259 (v!2574 (underlying!271 thiss!992)))))))

(declare-fun mapNonEmpty!3240 () Bool)

(declare-fun tp!8646 () Bool)

(declare-fun e!50212 () Bool)

(assert (=> mapNonEmpty!3240 (= mapRes!3239 (and tp!8646 e!50212))))

(declare-fun mapKey!3239 () (_ BitVec 32))

(declare-fun mapRest!3239 () (Array (_ BitVec 32) ValueCell!902))

(declare-fun mapValue!3240 () ValueCell!902)

(assert (=> mapNonEmpty!3240 (= (arr!1869 (_values!2242 (v!2574 (underlying!271 thiss!992)))) (store mapRest!3239 mapKey!3239 mapValue!3240))))

(declare-fun b!76925 () Bool)

(declare-fun res!40451 () Bool)

(assert (=> b!76925 (=> res!40451 e!50213)))

(declare-datatypes ((List!1485 0))(
  ( (Nil!1482) (Cons!1481 (h!2069 (_ BitVec 64)) (t!5087 List!1485)) )
))
(declare-fun arrayNoDuplicates!0 (array!3919 (_ BitVec 32) List!1485) Bool)

(assert (=> b!76925 (= res!40451 (not (arrayNoDuplicates!0 (_keys!3919 (v!2574 (underlying!271 thiss!992))) #b00000000000000000000000000000000 Nil!1482)))))

(declare-fun b!76926 () Bool)

(assert (=> b!76926 (= e!50212 tp_is_empty!2491)))

(declare-fun mapIsEmpty!3239 () Bool)

(assert (=> mapIsEmpty!3239 mapRes!3239))

(declare-fun b!76927 () Bool)

(declare-fun e!50214 () Bool)

(assert (=> b!76927 (= e!50214 tp_is_empty!2491)))

(declare-fun b!76928 () Bool)

(declare-fun e!50216 () Bool)

(assert (=> b!76928 (= e!50216 (and e!50214 mapRes!3240))))

(declare-fun condMapEmpty!3240 () Bool)

(declare-fun mapDefault!3239 () ValueCell!902)

(assert (=> b!76928 (= condMapEmpty!3240 (= (arr!1869 (_values!2242 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!902)) mapDefault!3239)))))

(declare-fun b!76929 () Bool)

(declare-fun Unit!2218 () Unit!2216)

(assert (=> b!76929 (= e!50211 Unit!2218)))

(declare-fun lt!35177 () Unit!2216)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!48 (array!3919 array!3921 (_ BitVec 32) (_ BitVec 32) V!2969 V!2969 (_ BitVec 64) (_ BitVec 32) Int) Unit!2216)

(assert (=> b!76929 (= lt!35177 (lemmaListMapContainsThenArrayContainsFrom!48 (_keys!3919 (v!2574 (underlying!271 thiss!992))) (_values!2242 (v!2574 (underlying!271 thiss!992))) (mask!6248 (v!2574 (underlying!271 thiss!992))) (extraKeys!2110 (v!2574 (underlying!271 thiss!992))) (zeroValue!2157 (v!2574 (underlying!271 thiss!992))) (minValue!2157 (v!2574 (underlying!271 thiss!992))) (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2259 (v!2574 (underlying!271 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!76929 (arrayContainsKey!0 (_keys!3919 (v!2574 (underlying!271 thiss!992))) (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35178 () Unit!2216)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3919 (_ BitVec 32) (_ BitVec 32)) Unit!2216)

(assert (=> b!76929 (= lt!35178 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3919 (v!2574 (underlying!271 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> b!76929 (arrayNoDuplicates!0 (_keys!3919 (v!2574 (underlying!271 thiss!992))) from!355 Nil!1482)))

(declare-fun lt!35174 () Unit!2216)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3919 (_ BitVec 32) (_ BitVec 64) List!1485) Unit!2216)

(assert (=> b!76929 (= lt!35174 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3919 (v!2574 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) (Cons!1481 (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) Nil!1482)))))

(assert (=> b!76929 false))

(declare-fun b!76930 () Bool)

(declare-fun res!40450 () Bool)

(assert (=> b!76930 (=> (not res!40450) (not e!50220))))

(assert (=> b!76930 (= res!40450 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6248 newMap!16)) (_size!405 (v!2574 (underlying!271 thiss!992)))))))

(declare-fun b!76931 () Bool)

(assert (=> b!76931 (= e!50213 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000))))

(declare-fun res!40447 () Bool)

(assert (=> start!10134 (=> (not res!40447) (not e!50220))))

(declare-fun valid!316 (LongMap!520) Bool)

(assert (=> start!10134 (= res!40447 (valid!316 thiss!992))))

(assert (=> start!10134 e!50220))

(declare-fun e!50215 () Bool)

(assert (=> start!10134 e!50215))

(assert (=> start!10134 true))

(declare-fun e!50217 () Bool)

(assert (=> start!10134 e!50217))

(declare-fun mapIsEmpty!3240 () Bool)

(assert (=> mapIsEmpty!3240 mapRes!3240))

(declare-fun b!76932 () Bool)

(declare-fun res!40444 () Bool)

(assert (=> b!76932 (=> (not res!40444) (not e!50220))))

(assert (=> b!76932 (= res!40444 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2109 (_keys!3919 (v!2574 (underlying!271 thiss!992)))))))))

(declare-fun b!76933 () Bool)

(declare-fun res!40449 () Bool)

(assert (=> b!76933 (=> res!40449 e!50213)))

(assert (=> b!76933 (= res!40449 (or (not (= (size!2110 (_values!2242 (v!2574 (underlying!271 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6248 (v!2574 (underlying!271 thiss!992)))))) (not (= (size!2109 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) (size!2110 (_values!2242 (v!2574 (underlying!271 thiss!992)))))) (bvslt (mask!6248 (v!2574 (underlying!271 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2110 (v!2574 (underlying!271 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2110 (v!2574 (underlying!271 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!76934 () Bool)

(assert (=> b!76934 (= e!50207 (not e!50213))))

(declare-fun res!40448 () Bool)

(assert (=> b!76934 (=> res!40448 e!50213)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!76934 (= res!40448 (not (validMask!0 (mask!6248 (v!2574 (underlying!271 thiss!992))))))))

(declare-fun lt!35181 () ListLongMap!1415)

(declare-fun lt!35180 () tuple2!2142)

(declare-fun lt!35172 () tuple2!2142)

(declare-fun +!97 (ListLongMap!1415 tuple2!2142) ListLongMap!1415)

(assert (=> b!76934 (= (+!97 (+!97 lt!35181 lt!35180) lt!35172) (+!97 (+!97 lt!35181 lt!35172) lt!35180))))

(assert (=> b!76934 (= lt!35172 (tuple2!2143 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2157 (v!2574 (underlying!271 thiss!992)))))))

(assert (=> b!76934 (= lt!35180 (tuple2!2143 (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) lt!35176))))

(declare-fun lt!35171 () Unit!2216)

(declare-fun addCommutativeForDiffKeys!17 (ListLongMap!1415 (_ BitVec 64) V!2969 (_ BitVec 64) V!2969) Unit!2216)

(assert (=> b!76934 (= lt!35171 (addCommutativeForDiffKeys!17 lt!35181 (select (arr!1868 (_keys!3919 (v!2574 (underlying!271 thiss!992)))) from!355) lt!35176 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2157 (v!2574 (underlying!271 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!62 (array!3919 array!3921 (_ BitVec 32) (_ BitVec 32) V!2969 V!2969 (_ BitVec 32) Int) ListLongMap!1415)

(assert (=> b!76934 (= lt!35181 (getCurrentListMapNoExtraKeys!62 (_keys!3919 (v!2574 (underlying!271 thiss!992))) (_values!2242 (v!2574 (underlying!271 thiss!992))) (mask!6248 (v!2574 (underlying!271 thiss!992))) (extraKeys!2110 (v!2574 (underlying!271 thiss!992))) (zeroValue!2157 (v!2574 (underlying!271 thiss!992))) (minValue!2157 (v!2574 (underlying!271 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2259 (v!2574 (underlying!271 thiss!992)))))))

(declare-fun b!76935 () Bool)

(assert (=> b!76935 (= e!50208 tp_is_empty!2491)))

(assert (=> b!76936 (= e!50217 (and tp!8645 tp_is_empty!2491 (array_inv!1147 (_keys!3919 newMap!16)) (array_inv!1148 (_values!2242 newMap!16)) e!50216))))

(declare-fun b!76937 () Bool)

(declare-fun e!50221 () Bool)

(assert (=> b!76937 (= e!50221 e!50209)))

(declare-fun b!76938 () Bool)

(assert (=> b!76938 (= e!50215 e!50221)))

(declare-fun b!76939 () Bool)

(declare-fun Unit!2219 () Unit!2216)

(assert (=> b!76939 (= e!50211 Unit!2219)))

(assert (= (and start!10134 res!40447) b!76932))

(assert (= (and b!76932 res!40444) b!76920))

(assert (= (and b!76920 res!40443) b!76930))

(assert (= (and b!76930 res!40450) b!76924))

(assert (= (and b!76924 res!40445) b!76921))

(assert (= (and b!76921 res!40446) b!76922))

(assert (= (and b!76922 c!11783) b!76929))

(assert (= (and b!76922 (not c!11783)) b!76939))

(assert (= (and b!76922 res!40452) b!76934))

(assert (= (and b!76934 (not res!40448)) b!76933))

(assert (= (and b!76933 (not res!40449)) b!76917))

(assert (= (and b!76917 (not res!40442)) b!76925))

(assert (= (and b!76925 (not res!40451)) b!76931))

(assert (= (and b!76919 condMapEmpty!3239) mapIsEmpty!3239))

(assert (= (and b!76919 (not condMapEmpty!3239)) mapNonEmpty!3240))

(get-info :version)

(assert (= (and mapNonEmpty!3240 ((_ is ValueCellFull!902) mapValue!3240)) b!76926))

(assert (= (and b!76919 ((_ is ValueCellFull!902) mapDefault!3240)) b!76918))

(assert (= b!76923 b!76919))

(assert (= b!76937 b!76923))

(assert (= b!76938 b!76937))

(assert (= start!10134 b!76938))

(assert (= (and b!76928 condMapEmpty!3240) mapIsEmpty!3240))

(assert (= (and b!76928 (not condMapEmpty!3240)) mapNonEmpty!3239))

(assert (= (and mapNonEmpty!3239 ((_ is ValueCellFull!902) mapValue!3239)) b!76935))

(assert (= (and b!76928 ((_ is ValueCellFull!902) mapDefault!3239)) b!76927))

(assert (= b!76936 b!76928))

(assert (= start!10134 b!76936))

(declare-fun b_lambda!3461 () Bool)

(assert (=> (not b_lambda!3461) (not b!76921)))

(declare-fun t!5083 () Bool)

(declare-fun tb!1573 () Bool)

(assert (=> (and b!76923 (= (defaultEntry!2259 (v!2574 (underlying!271 thiss!992))) (defaultEntry!2259 (v!2574 (underlying!271 thiss!992)))) t!5083) tb!1573))

(declare-fun result!2745 () Bool)

(assert (=> tb!1573 (= result!2745 tp_is_empty!2491)))

(assert (=> b!76921 t!5083))

(declare-fun b_and!4705 () Bool)

(assert (= b_and!4701 (and (=> t!5083 result!2745) b_and!4705)))

(declare-fun t!5085 () Bool)

(declare-fun tb!1575 () Bool)

(assert (=> (and b!76936 (= (defaultEntry!2259 newMap!16) (defaultEntry!2259 (v!2574 (underlying!271 thiss!992)))) t!5085) tb!1575))

(declare-fun result!2749 () Bool)

(assert (= result!2749 result!2745))

(assert (=> b!76921 t!5085))

(declare-fun b_and!4707 () Bool)

(assert (= b_and!4703 (and (=> t!5085 result!2749) b_and!4707)))

(declare-fun m!77069 () Bool)

(assert (=> b!76921 m!77069))

(declare-fun m!77071 () Bool)

(assert (=> b!76921 m!77071))

(declare-fun m!77073 () Bool)

(assert (=> b!76921 m!77073))

(assert (=> b!76921 m!77071))

(assert (=> b!76921 m!77073))

(declare-fun m!77075 () Bool)

(assert (=> b!76921 m!77075))

(declare-fun m!77077 () Bool)

(assert (=> b!76936 m!77077))

(declare-fun m!77079 () Bool)

(assert (=> b!76936 m!77079))

(declare-fun m!77081 () Bool)

(assert (=> b!76923 m!77081))

(declare-fun m!77083 () Bool)

(assert (=> b!76923 m!77083))

(declare-fun m!77085 () Bool)

(assert (=> b!76924 m!77085))

(declare-fun m!77087 () Bool)

(assert (=> b!76924 m!77087))

(declare-fun m!77089 () Bool)

(assert (=> b!76934 m!77089))

(declare-fun m!77091 () Bool)

(assert (=> b!76934 m!77091))

(declare-fun m!77093 () Bool)

(assert (=> b!76934 m!77093))

(assert (=> b!76934 m!77069))

(declare-fun m!77095 () Bool)

(assert (=> b!76934 m!77095))

(assert (=> b!76934 m!77089))

(assert (=> b!76934 m!77069))

(declare-fun m!77097 () Bool)

(assert (=> b!76934 m!77097))

(assert (=> b!76934 m!77093))

(declare-fun m!77099 () Bool)

(assert (=> b!76934 m!77099))

(declare-fun m!77101 () Bool)

(assert (=> b!76934 m!77101))

(declare-fun m!77103 () Bool)

(assert (=> b!76925 m!77103))

(declare-fun m!77105 () Bool)

(assert (=> b!76917 m!77105))

(declare-fun m!77107 () Bool)

(assert (=> start!10134 m!77107))

(declare-fun m!77109 () Bool)

(assert (=> mapNonEmpty!3240 m!77109))

(assert (=> b!76922 m!77069))

(assert (=> b!76922 m!77069))

(declare-fun m!77111 () Bool)

(assert (=> b!76922 m!77111))

(assert (=> b!76922 m!77069))

(declare-fun m!77113 () Bool)

(assert (=> b!76922 m!77113))

(declare-fun m!77115 () Bool)

(assert (=> mapNonEmpty!3239 m!77115))

(declare-fun m!77117 () Bool)

(assert (=> b!76929 m!77117))

(declare-fun m!77119 () Bool)

(assert (=> b!76929 m!77119))

(assert (=> b!76929 m!77069))

(declare-fun m!77121 () Bool)

(assert (=> b!76929 m!77121))

(assert (=> b!76929 m!77069))

(assert (=> b!76929 m!77069))

(declare-fun m!77123 () Bool)

(assert (=> b!76929 m!77123))

(assert (=> b!76929 m!77069))

(declare-fun m!77125 () Bool)

(assert (=> b!76929 m!77125))

(declare-fun m!77127 () Bool)

(assert (=> b!76920 m!77127))

(check-sat (not b!76917) b_and!4707 (not b!76921) tp_is_empty!2491 (not b!76925) (not mapNonEmpty!3240) (not b!76920) (not b_lambda!3461) (not b_next!2151) (not start!10134) (not mapNonEmpty!3239) b_and!4705 (not b!76924) (not b!76929) (not b!76923) (not b!76922) (not b!76934) (not b_next!2149) (not b!76936))
(check-sat b_and!4705 b_and!4707 (not b_next!2149) (not b_next!2151))
