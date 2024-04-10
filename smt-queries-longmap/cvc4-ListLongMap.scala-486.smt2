; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10518 () Bool)

(assert start!10518)

(declare-fun b!82932 () Bool)

(declare-fun b_free!2229 () Bool)

(declare-fun b_next!2229 () Bool)

(assert (=> b!82932 (= b_free!2229 (not b_next!2229))))

(declare-fun tp!8905 () Bool)

(declare-fun b_and!5055 () Bool)

(assert (=> b!82932 (= tp!8905 b_and!5055)))

(declare-fun b!82943 () Bool)

(declare-fun b_free!2231 () Bool)

(declare-fun b_next!2231 () Bool)

(assert (=> b!82943 (= b_free!2231 (not b_next!2231))))

(declare-fun tp!8903 () Bool)

(declare-fun b_and!5057 () Bool)

(assert (=> b!82943 (= tp!8903 b_and!5057)))

(declare-fun mapIsEmpty!3379 () Bool)

(declare-fun mapRes!3379 () Bool)

(assert (=> mapIsEmpty!3379 mapRes!3379))

(declare-fun b!82929 () Bool)

(declare-fun e!54168 () Bool)

(declare-fun tp_is_empty!2531 () Bool)

(assert (=> b!82929 (= e!54168 tp_is_empty!2531)))

(declare-fun b!82930 () Bool)

(declare-fun e!54173 () Bool)

(assert (=> b!82930 (= e!54173 tp_is_empty!2531)))

(declare-fun b!82931 () Bool)

(declare-fun res!42954 () Bool)

(declare-fun e!54176 () Bool)

(assert (=> b!82931 (=> (not res!42954) (not e!54176))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3021 0))(
  ( (V!3022 (val!1310 Int)) )
))
(declare-datatypes ((array!4019 0))(
  ( (array!4020 (arr!1915 (Array (_ BitVec 32) (_ BitVec 64))) (size!2158 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!922 0))(
  ( (ValueCellFull!922 (v!2631 V!3021)) (EmptyCell!922) )
))
(declare-datatypes ((array!4021 0))(
  ( (array!4022 (arr!1916 (Array (_ BitVec 32) ValueCell!922)) (size!2159 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!752 0))(
  ( (LongMapFixedSize!753 (defaultEntry!2318 Int) (mask!6336 (_ BitVec 32)) (extraKeys!2161 (_ BitVec 32)) (zeroValue!2212 V!3021) (minValue!2212 V!3021) (_size!425 (_ BitVec 32)) (_keys!3986 array!4019) (_values!2301 array!4021) (_vacant!425 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!554 0))(
  ( (Cell!555 (v!2632 LongMapFixedSize!752)) )
))
(declare-datatypes ((LongMap!554 0))(
  ( (LongMap!555 (underlying!288 Cell!554)) )
))
(declare-fun thiss!992 () LongMap!554)

(assert (=> b!82931 (= res!42954 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2158 (_keys!3986 (v!2632 (underlying!288 thiss!992)))))))))

(declare-fun e!54181 () Bool)

(declare-fun e!54180 () Bool)

(declare-fun array_inv!1185 (array!4019) Bool)

(declare-fun array_inv!1186 (array!4021) Bool)

(assert (=> b!82932 (= e!54181 (and tp!8905 tp_is_empty!2531 (array_inv!1185 (_keys!3986 (v!2632 (underlying!288 thiss!992)))) (array_inv!1186 (_values!2301 (v!2632 (underlying!288 thiss!992)))) e!54180))))

(declare-fun mapNonEmpty!3379 () Bool)

(declare-fun mapRes!3380 () Bool)

(declare-fun tp!8904 () Bool)

(declare-fun e!54174 () Bool)

(assert (=> mapNonEmpty!3379 (= mapRes!3380 (and tp!8904 e!54174))))

(declare-fun mapValue!3379 () ValueCell!922)

(declare-fun mapKey!3379 () (_ BitVec 32))

(declare-fun mapRest!3379 () (Array (_ BitVec 32) ValueCell!922))

(assert (=> mapNonEmpty!3379 (= (arr!1916 (_values!2301 (v!2632 (underlying!288 thiss!992)))) (store mapRest!3379 mapKey!3379 mapValue!3379))))

(declare-fun b!82934 () Bool)

(declare-fun e!54167 () Bool)

(assert (=> b!82934 (= e!54167 tp_is_empty!2531)))

(declare-fun b!82935 () Bool)

(declare-fun e!54175 () Bool)

(assert (=> b!82935 (= e!54175 (or (not (= (size!2159 (_values!2301 (v!2632 (underlying!288 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6336 (v!2632 (underlying!288 thiss!992)))))) (not (= (size!2158 (_keys!3986 (v!2632 (underlying!288 thiss!992)))) (size!2159 (_values!2301 (v!2632 (underlying!288 thiss!992)))))) (bvslt (mask!6336 (v!2632 (underlying!288 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2161 (v!2632 (underlying!288 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!3380 () Bool)

(assert (=> mapIsEmpty!3380 mapRes!3380))

(declare-fun b!82936 () Bool)

(assert (=> b!82936 (= e!54174 tp_is_empty!2531)))

(declare-fun b!82937 () Bool)

(declare-fun res!42959 () Bool)

(assert (=> b!82937 (=> (not res!42959) (not e!54176))))

(declare-fun newMap!16 () LongMapFixedSize!752)

(assert (=> b!82937 (= res!42959 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6336 newMap!16)) (_size!425 (v!2632 (underlying!288 thiss!992)))))))

(declare-fun b!82938 () Bool)

(declare-fun e!54169 () Bool)

(declare-fun e!54177 () Bool)

(assert (=> b!82938 (= e!54169 e!54177)))

(declare-fun res!42960 () Bool)

(assert (=> b!82938 (=> (not res!42960) (not e!54177))))

(assert (=> b!82938 (= res!42960 (and (not (= (select (arr!1915 (_keys!3986 (v!2632 (underlying!288 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1915 (_keys!3986 (v!2632 (underlying!288 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!38911 () V!3021)

(declare-fun get!1189 (ValueCell!922 V!3021) V!3021)

(declare-fun dynLambda!340 (Int (_ BitVec 64)) V!3021)

(assert (=> b!82938 (= lt!38911 (get!1189 (select (arr!1916 (_values!2301 (v!2632 (underlying!288 thiss!992)))) from!355) (dynLambda!340 (defaultEntry!2318 (v!2632 (underlying!288 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!82939 () Bool)

(declare-fun e!54166 () Bool)

(assert (=> b!82939 (= e!54166 e!54181)))

(declare-fun b!82940 () Bool)

(declare-fun e!54164 () Bool)

(assert (=> b!82940 (= e!54177 e!54164)))

(declare-fun res!42961 () Bool)

(assert (=> b!82940 (=> (not res!42961) (not e!54164))))

(declare-datatypes ((tuple2!2192 0))(
  ( (tuple2!2193 (_1!1107 Bool) (_2!1107 LongMapFixedSize!752)) )
))
(declare-fun lt!38908 () tuple2!2192)

(assert (=> b!82940 (= res!42961 (and (_1!1107 lt!38908) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!2433 0))(
  ( (Unit!2434) )
))
(declare-fun lt!38912 () Unit!2433)

(declare-fun e!54170 () Unit!2433)

(assert (=> b!82940 (= lt!38912 e!54170)))

(declare-datatypes ((tuple2!2194 0))(
  ( (tuple2!2195 (_1!1108 (_ BitVec 64)) (_2!1108 V!3021)) )
))
(declare-datatypes ((List!1518 0))(
  ( (Nil!1515) (Cons!1514 (h!2104 tuple2!2194) (t!5222 List!1518)) )
))
(declare-datatypes ((ListLongMap!1459 0))(
  ( (ListLongMap!1460 (toList!745 List!1518)) )
))
(declare-fun lt!38903 () ListLongMap!1459)

(declare-fun c!13185 () Bool)

(declare-fun contains!750 (ListLongMap!1459 (_ BitVec 64)) Bool)

(assert (=> b!82940 (= c!13185 (contains!750 lt!38903 (select (arr!1915 (_keys!3986 (v!2632 (underlying!288 thiss!992)))) from!355)))))

(declare-fun update!111 (LongMapFixedSize!752 (_ BitVec 64) V!3021) tuple2!2192)

(assert (=> b!82940 (= lt!38908 (update!111 newMap!16 (select (arr!1915 (_keys!3986 (v!2632 (underlying!288 thiss!992)))) from!355) lt!38911))))

(declare-fun b!82941 () Bool)

(declare-fun Unit!2435 () Unit!2433)

(assert (=> b!82941 (= e!54170 Unit!2435)))

(declare-fun b!82942 () Bool)

(assert (=> b!82942 (= e!54176 e!54169)))

(declare-fun res!42957 () Bool)

(assert (=> b!82942 (=> (not res!42957) (not e!54169))))

(declare-fun lt!38910 () ListLongMap!1459)

(assert (=> b!82942 (= res!42957 (= lt!38910 lt!38903))))

(declare-fun map!1185 (LongMapFixedSize!752) ListLongMap!1459)

(assert (=> b!82942 (= lt!38903 (map!1185 newMap!16))))

(declare-fun getCurrentListMap!438 (array!4019 array!4021 (_ BitVec 32) (_ BitVec 32) V!3021 V!3021 (_ BitVec 32) Int) ListLongMap!1459)

(assert (=> b!82942 (= lt!38910 (getCurrentListMap!438 (_keys!3986 (v!2632 (underlying!288 thiss!992))) (_values!2301 (v!2632 (underlying!288 thiss!992))) (mask!6336 (v!2632 (underlying!288 thiss!992))) (extraKeys!2161 (v!2632 (underlying!288 thiss!992))) (zeroValue!2212 (v!2632 (underlying!288 thiss!992))) (minValue!2212 (v!2632 (underlying!288 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2318 (v!2632 (underlying!288 thiss!992)))))))

(declare-fun e!54165 () Bool)

(declare-fun e!54172 () Bool)

(assert (=> b!82943 (= e!54165 (and tp!8903 tp_is_empty!2531 (array_inv!1185 (_keys!3986 newMap!16)) (array_inv!1186 (_values!2301 newMap!16)) e!54172))))

(declare-fun b!82944 () Bool)

(assert (=> b!82944 (= e!54180 (and e!54168 mapRes!3380))))

(declare-fun condMapEmpty!3379 () Bool)

(declare-fun mapDefault!3380 () ValueCell!922)

