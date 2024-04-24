; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11110 () Bool)

(assert start!11110)

(declare-fun b!90658 () Bool)

(declare-fun b_free!2305 () Bool)

(declare-fun b_next!2305 () Bool)

(assert (=> b!90658 (= b_free!2305 (not b_next!2305))))

(declare-fun tp!9166 () Bool)

(declare-fun b_and!5469 () Bool)

(assert (=> b!90658 (= tp!9166 b_and!5469)))

(declare-fun b!90667 () Bool)

(declare-fun b_free!2307 () Bool)

(declare-fun b_next!2307 () Bool)

(assert (=> b!90667 (= b_free!2307 (not b_next!2307))))

(declare-fun tp!9163 () Bool)

(declare-fun b_and!5471 () Bool)

(assert (=> b!90667 (= tp!9163 b_and!5471)))

(declare-fun b!90653 () Bool)

(declare-fun e!59080 () Bool)

(declare-fun e!59087 () Bool)

(assert (=> b!90653 (= e!59080 e!59087)))

(declare-fun b!90654 () Bool)

(declare-fun e!59088 () Bool)

(declare-fun tp_is_empty!2569 () Bool)

(assert (=> b!90654 (= e!59088 tp_is_empty!2569)))

(declare-fun b!90655 () Bool)

(declare-fun e!59072 () Bool)

(declare-fun e!59082 () Bool)

(assert (=> b!90655 (= e!59072 e!59082)))

(declare-fun res!46229 () Bool)

(assert (=> b!90655 (=> (not res!46229) (not e!59082))))

(declare-datatypes ((V!3073 0))(
  ( (V!3074 (val!1329 Int)) )
))
(declare-datatypes ((tuple2!2226 0))(
  ( (tuple2!2227 (_1!1124 (_ BitVec 64)) (_2!1124 V!3073)) )
))
(declare-datatypes ((List!1528 0))(
  ( (Nil!1525) (Cons!1524 (h!2116 tuple2!2226) (t!5330 List!1528)) )
))
(declare-datatypes ((ListLongMap!1463 0))(
  ( (ListLongMap!1464 (toList!747 List!1528)) )
))
(declare-fun lt!43965 () ListLongMap!1463)

(declare-fun lt!43968 () ListLongMap!1463)

(assert (=> b!90655 (= res!46229 (= lt!43965 lt!43968))))

(declare-datatypes ((array!4091 0))(
  ( (array!4092 (arr!1946 (Array (_ BitVec 32) (_ BitVec 64))) (size!2193 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!941 0))(
  ( (ValueCellFull!941 (v!2708 V!3073)) (EmptyCell!941) )
))
(declare-datatypes ((array!4093 0))(
  ( (array!4094 (arr!1947 (Array (_ BitVec 32) ValueCell!941)) (size!2194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!790 0))(
  ( (LongMapFixedSize!791 (defaultEntry!2396 Int) (mask!6452 (_ BitVec 32)) (extraKeys!2227 (_ BitVec 32)) (zeroValue!2284 V!3073) (minValue!2284 V!3073) (_size!444 (_ BitVec 32)) (_keys!4076 array!4091) (_values!2379 array!4093) (_vacant!444 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!790)

(declare-fun map!1215 (LongMapFixedSize!790) ListLongMap!1463)

(assert (=> b!90655 (= lt!43968 (map!1215 newMap!16))))

(declare-datatypes ((Cell!596 0))(
  ( (Cell!597 (v!2709 LongMapFixedSize!790)) )
))
(declare-datatypes ((LongMap!596 0))(
  ( (LongMap!597 (underlying!309 Cell!596)) )
))
(declare-fun thiss!992 () LongMap!596)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!437 (array!4091 array!4093 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 32) Int) ListLongMap!1463)

(assert (=> b!90655 (= lt!43965 (getCurrentListMap!437 (_keys!4076 (v!2709 (underlying!309 thiss!992))) (_values!2379 (v!2709 (underlying!309 thiss!992))) (mask!6452 (v!2709 (underlying!309 thiss!992))) (extraKeys!2227 (v!2709 (underlying!309 thiss!992))) (zeroValue!2284 (v!2709 (underlying!309 thiss!992))) (minValue!2284 (v!2709 (underlying!309 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2709 (underlying!309 thiss!992)))))))

(declare-fun mapIsEmpty!3525 () Bool)

(declare-fun mapRes!3526 () Bool)

(assert (=> mapIsEmpty!3525 mapRes!3526))

(declare-fun b!90656 () Bool)

(declare-fun res!46230 () Bool)

(assert (=> b!90656 (=> (not res!46230) (not e!59072))))

(assert (=> b!90656 (= res!46230 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2193 (_keys!4076 (v!2709 (underlying!309 thiss!992)))))))))

(declare-fun b!90657 () Bool)

(declare-fun e!59079 () Bool)

(declare-fun e!59075 () Bool)

(assert (=> b!90657 (= e!59079 (not e!59075))))

(declare-fun res!46224 () Bool)

(assert (=> b!90657 (=> res!46224 e!59075)))

(declare-datatypes ((tuple2!2228 0))(
  ( (tuple2!2229 (_1!1125 Bool) (_2!1125 LongMapFixedSize!790)) )
))
(declare-fun lt!43952 () tuple2!2228)

(assert (=> b!90657 (= res!46224 (not (= (getCurrentListMap!437 (_keys!4076 (v!2709 (underlying!309 thiss!992))) (_values!2379 (v!2709 (underlying!309 thiss!992))) (mask!6452 (v!2709 (underlying!309 thiss!992))) (extraKeys!2227 (v!2709 (underlying!309 thiss!992))) (zeroValue!2284 (v!2709 (underlying!309 thiss!992))) (minValue!2284 (v!2709 (underlying!309 thiss!992))) from!355 (defaultEntry!2396 (v!2709 (underlying!309 thiss!992)))) (map!1215 (_2!1125 lt!43952)))))))

(declare-fun lt!43951 () ListLongMap!1463)

(declare-fun lt!43959 () tuple2!2226)

(declare-fun lt!43967 () ListLongMap!1463)

(declare-fun lt!43962 () tuple2!2226)

(declare-fun +!116 (ListLongMap!1463 tuple2!2226) ListLongMap!1463)

(assert (=> b!90657 (= (+!116 lt!43967 lt!43962) (+!116 (+!116 lt!43951 lt!43962) lt!43959))))

(assert (=> b!90657 (= lt!43962 (tuple2!2227 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2284 (v!2709 (underlying!309 thiss!992)))))))

(declare-fun lt!43957 () V!3073)

(declare-datatypes ((Unit!2679 0))(
  ( (Unit!2680) )
))
(declare-fun lt!43963 () Unit!2679)

(declare-fun addCommutativeForDiffKeys!36 (ListLongMap!1463 (_ BitVec 64) V!3073 (_ BitVec 64) V!3073) Unit!2679)

(assert (=> b!90657 (= lt!43963 (addCommutativeForDiffKeys!36 lt!43951 (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) lt!43957 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2284 (v!2709 (underlying!309 thiss!992)))))))

(declare-fun lt!43956 () ListLongMap!1463)

(assert (=> b!90657 (= lt!43956 lt!43967)))

(assert (=> b!90657 (= lt!43967 (+!116 lt!43951 lt!43959))))

(declare-fun lt!43961 () ListLongMap!1463)

(declare-fun lt!43953 () tuple2!2226)

(assert (=> b!90657 (= lt!43956 (+!116 lt!43961 lt!43953))))

(declare-fun lt!43955 () ListLongMap!1463)

(assert (=> b!90657 (= lt!43951 (+!116 lt!43955 lt!43953))))

(assert (=> b!90657 (= lt!43953 (tuple2!2227 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2284 (v!2709 (underlying!309 thiss!992)))))))

(assert (=> b!90657 (= lt!43961 (+!116 lt!43955 lt!43959))))

(assert (=> b!90657 (= lt!43959 (tuple2!2227 (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) lt!43957))))

(declare-fun lt!43966 () Unit!2679)

(assert (=> b!90657 (= lt!43966 (addCommutativeForDiffKeys!36 lt!43955 (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) lt!43957 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2284 (v!2709 (underlying!309 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!81 (array!4091 array!4093 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 32) Int) ListLongMap!1463)

(assert (=> b!90657 (= lt!43955 (getCurrentListMapNoExtraKeys!81 (_keys!4076 (v!2709 (underlying!309 thiss!992))) (_values!2379 (v!2709 (underlying!309 thiss!992))) (mask!6452 (v!2709 (underlying!309 thiss!992))) (extraKeys!2227 (v!2709 (underlying!309 thiss!992))) (zeroValue!2284 (v!2709 (underlying!309 thiss!992))) (minValue!2284 (v!2709 (underlying!309 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2709 (underlying!309 thiss!992)))))))

(declare-fun e!59089 () Bool)

(declare-fun array_inv!1195 (array!4091) Bool)

(declare-fun array_inv!1196 (array!4093) Bool)

(assert (=> b!90658 (= e!59087 (and tp!9166 tp_is_empty!2569 (array_inv!1195 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) (array_inv!1196 (_values!2379 (v!2709 (underlying!309 thiss!992)))) e!59089))))

(declare-fun b!90659 () Bool)

(declare-fun e!59085 () Bool)

(assert (=> b!90659 (= e!59085 tp_is_empty!2569)))

(declare-fun b!90660 () Bool)

(declare-fun e!59084 () Unit!2679)

(declare-fun Unit!2681 () Unit!2679)

(assert (=> b!90660 (= e!59084 Unit!2681)))

(declare-fun lt!43964 () Unit!2679)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!68 (array!4091 array!4093 (_ BitVec 32) (_ BitVec 32) V!3073 V!3073 (_ BitVec 64) (_ BitVec 32) Int) Unit!2679)

(assert (=> b!90660 (= lt!43964 (lemmaListMapContainsThenArrayContainsFrom!68 (_keys!4076 (v!2709 (underlying!309 thiss!992))) (_values!2379 (v!2709 (underlying!309 thiss!992))) (mask!6452 (v!2709 (underlying!309 thiss!992))) (extraKeys!2227 (v!2709 (underlying!309 thiss!992))) (zeroValue!2284 (v!2709 (underlying!309 thiss!992))) (minValue!2284 (v!2709 (underlying!309 thiss!992))) (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2396 (v!2709 (underlying!309 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90660 (arrayContainsKey!0 (_keys!4076 (v!2709 (underlying!309 thiss!992))) (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!43960 () Unit!2679)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4091 (_ BitVec 32) (_ BitVec 32)) Unit!2679)

(assert (=> b!90660 (= lt!43960 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4076 (v!2709 (underlying!309 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1529 0))(
  ( (Nil!1526) (Cons!1525 (h!2117 (_ BitVec 64)) (t!5331 List!1529)) )
))
(declare-fun arrayNoDuplicates!0 (array!4091 (_ BitVec 32) List!1529) Bool)

(assert (=> b!90660 (arrayNoDuplicates!0 (_keys!4076 (v!2709 (underlying!309 thiss!992))) from!355 Nil!1526)))

(declare-fun lt!43958 () Unit!2679)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4091 (_ BitVec 32) (_ BitVec 64) List!1529) Unit!2679)

(assert (=> b!90660 (= lt!43958 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4076 (v!2709 (underlying!309 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) (Cons!1525 (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) Nil!1526)))))

(assert (=> b!90660 false))

(declare-fun mapNonEmpty!3526 () Bool)

(declare-fun mapRes!3525 () Bool)

(declare-fun tp!9165 () Bool)

(declare-fun e!59076 () Bool)

(assert (=> mapNonEmpty!3526 (= mapRes!3525 (and tp!9165 e!59076))))

(declare-fun mapRest!3525 () (Array (_ BitVec 32) ValueCell!941))

(declare-fun mapKey!3526 () (_ BitVec 32))

(declare-fun mapValue!3525 () ValueCell!941)

(assert (=> mapNonEmpty!3526 (= (arr!1947 (_values!2379 newMap!16)) (store mapRest!3525 mapKey!3526 mapValue!3525))))

(declare-fun b!90661 () Bool)

(declare-fun e!59086 () Bool)

(assert (=> b!90661 (= e!59086 e!59079)))

(declare-fun res!46227 () Bool)

(assert (=> b!90661 (=> (not res!46227) (not e!59079))))

(assert (=> b!90661 (= res!46227 (and (_1!1125 lt!43952) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!43954 () Unit!2679)

(assert (=> b!90661 (= lt!43954 e!59084)))

(declare-fun c!15063 () Bool)

(declare-fun contains!764 (ListLongMap!1463 (_ BitVec 64)) Bool)

(assert (=> b!90661 (= c!15063 (contains!764 lt!43968 (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355)))))

(declare-fun update!132 (LongMapFixedSize!790 (_ BitVec 64) V!3073) tuple2!2228)

(assert (=> b!90661 (= lt!43952 (update!132 newMap!16 (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) lt!43957))))

(declare-fun b!90662 () Bool)

(assert (=> b!90662 (= e!59076 tp_is_empty!2569)))

(declare-fun b!90663 () Bool)

(declare-fun res!46226 () Bool)

(assert (=> b!90663 (=> (not res!46226) (not e!59072))))

(declare-fun valid!355 (LongMapFixedSize!790) Bool)

(assert (=> b!90663 (= res!46226 (valid!355 newMap!16))))

(declare-fun b!90664 () Bool)

(declare-fun e!59074 () Bool)

(assert (=> b!90664 (= e!59074 tp_is_empty!2569)))

(declare-fun b!90665 () Bool)

(declare-fun e!59081 () Bool)

(assert (=> b!90665 (= e!59081 (and e!59074 mapRes!3525))))

(declare-fun condMapEmpty!3526 () Bool)

(declare-fun mapDefault!3525 () ValueCell!941)

(assert (=> b!90665 (= condMapEmpty!3526 (= (arr!1947 (_values!2379 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!941)) mapDefault!3525)))))

(declare-fun b!90666 () Bool)

(assert (=> b!90666 (= e!59075 (bvslt (bvsub from!355 #b00000000000000000000000000000001) (size!2193 (_keys!4076 (v!2709 (underlying!309 thiss!992))))))))

(declare-fun e!59073 () Bool)

(assert (=> b!90667 (= e!59073 (and tp!9163 tp_is_empty!2569 (array_inv!1195 (_keys!4076 newMap!16)) (array_inv!1196 (_values!2379 newMap!16)) e!59081))))

(declare-fun b!90668 () Bool)

(assert (=> b!90668 (= e!59082 e!59086)))

(declare-fun res!46231 () Bool)

(assert (=> b!90668 (=> (not res!46231) (not e!59086))))

(assert (=> b!90668 (= res!46231 (and (not (= (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1946 (_keys!4076 (v!2709 (underlying!309 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1236 (ValueCell!941 V!3073) V!3073)

(declare-fun dynLambda!353 (Int (_ BitVec 64)) V!3073)

(assert (=> b!90668 (= lt!43957 (get!1236 (select (arr!1947 (_values!2379 (v!2709 (underlying!309 thiss!992)))) from!355) (dynLambda!353 (defaultEntry!2396 (v!2709 (underlying!309 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!90669 () Bool)

(assert (=> b!90669 (= e!59089 (and e!59085 mapRes!3526))))

(declare-fun condMapEmpty!3525 () Bool)

(declare-fun mapDefault!3526 () ValueCell!941)

(assert (=> b!90669 (= condMapEmpty!3525 (= (arr!1947 (_values!2379 (v!2709 (underlying!309 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!941)) mapDefault!3526)))))

(declare-fun b!90670 () Bool)

(declare-fun res!46225 () Bool)

(assert (=> b!90670 (=> (not res!46225) (not e!59072))))

(assert (=> b!90670 (= res!46225 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6452 newMap!16)) (_size!444 (v!2709 (underlying!309 thiss!992)))))))

(declare-fun mapIsEmpty!3526 () Bool)

(assert (=> mapIsEmpty!3526 mapRes!3525))

(declare-fun mapNonEmpty!3525 () Bool)

(declare-fun tp!9164 () Bool)

(assert (=> mapNonEmpty!3525 (= mapRes!3526 (and tp!9164 e!59088))))

(declare-fun mapKey!3525 () (_ BitVec 32))

(declare-fun mapRest!3526 () (Array (_ BitVec 32) ValueCell!941))

(declare-fun mapValue!3526 () ValueCell!941)

(assert (=> mapNonEmpty!3525 (= (arr!1947 (_values!2379 (v!2709 (underlying!309 thiss!992)))) (store mapRest!3526 mapKey!3525 mapValue!3526))))

(declare-fun res!46228 () Bool)

(assert (=> start!11110 (=> (not res!46228) (not e!59072))))

(declare-fun valid!356 (LongMap!596) Bool)

(assert (=> start!11110 (= res!46228 (valid!356 thiss!992))))

(assert (=> start!11110 e!59072))

(declare-fun e!59083 () Bool)

(assert (=> start!11110 e!59083))

(assert (=> start!11110 true))

(assert (=> start!11110 e!59073))

(declare-fun b!90671 () Bool)

(assert (=> b!90671 (= e!59083 e!59080)))

(declare-fun b!90672 () Bool)

(declare-fun Unit!2682 () Unit!2679)

(assert (=> b!90672 (= e!59084 Unit!2682)))

(assert (= (and start!11110 res!46228) b!90656))

(assert (= (and b!90656 res!46230) b!90663))

(assert (= (and b!90663 res!46226) b!90670))

(assert (= (and b!90670 res!46225) b!90655))

(assert (= (and b!90655 res!46229) b!90668))

(assert (= (and b!90668 res!46231) b!90661))

(assert (= (and b!90661 c!15063) b!90660))

(assert (= (and b!90661 (not c!15063)) b!90672))

(assert (= (and b!90661 res!46227) b!90657))

(assert (= (and b!90657 (not res!46224)) b!90666))

(assert (= (and b!90669 condMapEmpty!3525) mapIsEmpty!3525))

(assert (= (and b!90669 (not condMapEmpty!3525)) mapNonEmpty!3525))

(get-info :version)

(assert (= (and mapNonEmpty!3525 ((_ is ValueCellFull!941) mapValue!3526)) b!90654))

(assert (= (and b!90669 ((_ is ValueCellFull!941) mapDefault!3526)) b!90659))

(assert (= b!90658 b!90669))

(assert (= b!90653 b!90658))

(assert (= b!90671 b!90653))

(assert (= start!11110 b!90671))

(assert (= (and b!90665 condMapEmpty!3526) mapIsEmpty!3526))

(assert (= (and b!90665 (not condMapEmpty!3526)) mapNonEmpty!3526))

(assert (= (and mapNonEmpty!3526 ((_ is ValueCellFull!941) mapValue!3525)) b!90662))

(assert (= (and b!90665 ((_ is ValueCellFull!941) mapDefault!3525)) b!90664))

(assert (= b!90667 b!90665))

(assert (= start!11110 b!90667))

(declare-fun b_lambda!4003 () Bool)

(assert (=> (not b_lambda!4003) (not b!90668)))

(declare-fun t!5327 () Bool)

(declare-fun tb!1769 () Bool)

(assert (=> (and b!90658 (= (defaultEntry!2396 (v!2709 (underlying!309 thiss!992))) (defaultEntry!2396 (v!2709 (underlying!309 thiss!992)))) t!5327) tb!1769))

(declare-fun result!3035 () Bool)

(assert (=> tb!1769 (= result!3035 tp_is_empty!2569)))

(assert (=> b!90668 t!5327))

(declare-fun b_and!5473 () Bool)

(assert (= b_and!5469 (and (=> t!5327 result!3035) b_and!5473)))

(declare-fun tb!1771 () Bool)

(declare-fun t!5329 () Bool)

(assert (=> (and b!90667 (= (defaultEntry!2396 newMap!16) (defaultEntry!2396 (v!2709 (underlying!309 thiss!992)))) t!5329) tb!1771))

(declare-fun result!3039 () Bool)

(assert (= result!3039 result!3035))

(assert (=> b!90668 t!5329))

(declare-fun b_and!5475 () Bool)

(assert (= b_and!5471 (and (=> t!5329 result!3039) b_and!5475)))

(declare-fun m!97321 () Bool)

(assert (=> b!90663 m!97321))

(declare-fun m!97323 () Bool)

(assert (=> b!90661 m!97323))

(assert (=> b!90661 m!97323))

(declare-fun m!97325 () Bool)

(assert (=> b!90661 m!97325))

(assert (=> b!90661 m!97323))

(declare-fun m!97327 () Bool)

(assert (=> b!90661 m!97327))

(declare-fun m!97329 () Bool)

(assert (=> mapNonEmpty!3525 m!97329))

(declare-fun m!97331 () Bool)

(assert (=> start!11110 m!97331))

(declare-fun m!97333 () Bool)

(assert (=> b!90667 m!97333))

(declare-fun m!97335 () Bool)

(assert (=> b!90667 m!97335))

(declare-fun m!97337 () Bool)

(assert (=> b!90658 m!97337))

(declare-fun m!97339 () Bool)

(assert (=> b!90658 m!97339))

(declare-fun m!97341 () Bool)

(assert (=> b!90660 m!97341))

(declare-fun m!97343 () Bool)

(assert (=> b!90660 m!97343))

(assert (=> b!90660 m!97323))

(declare-fun m!97345 () Bool)

(assert (=> b!90660 m!97345))

(assert (=> b!90660 m!97323))

(assert (=> b!90660 m!97323))

(declare-fun m!97347 () Bool)

(assert (=> b!90660 m!97347))

(assert (=> b!90660 m!97323))

(declare-fun m!97349 () Bool)

(assert (=> b!90660 m!97349))

(declare-fun m!97351 () Bool)

(assert (=> b!90655 m!97351))

(declare-fun m!97353 () Bool)

(assert (=> b!90655 m!97353))

(declare-fun m!97355 () Bool)

(assert (=> b!90657 m!97355))

(declare-fun m!97357 () Bool)

(assert (=> b!90657 m!97357))

(declare-fun m!97359 () Bool)

(assert (=> b!90657 m!97359))

(assert (=> b!90657 m!97323))

(declare-fun m!97361 () Bool)

(assert (=> b!90657 m!97361))

(assert (=> b!90657 m!97357))

(declare-fun m!97363 () Bool)

(assert (=> b!90657 m!97363))

(assert (=> b!90657 m!97323))

(assert (=> b!90657 m!97323))

(declare-fun m!97365 () Bool)

(assert (=> b!90657 m!97365))

(declare-fun m!97367 () Bool)

(assert (=> b!90657 m!97367))

(declare-fun m!97369 () Bool)

(assert (=> b!90657 m!97369))

(declare-fun m!97371 () Bool)

(assert (=> b!90657 m!97371))

(declare-fun m!97373 () Bool)

(assert (=> b!90657 m!97373))

(declare-fun m!97375 () Bool)

(assert (=> b!90657 m!97375))

(declare-fun m!97377 () Bool)

(assert (=> b!90657 m!97377))

(assert (=> b!90668 m!97323))

(declare-fun m!97379 () Bool)

(assert (=> b!90668 m!97379))

(declare-fun m!97381 () Bool)

(assert (=> b!90668 m!97381))

(assert (=> b!90668 m!97379))

(assert (=> b!90668 m!97381))

(declare-fun m!97383 () Bool)

(assert (=> b!90668 m!97383))

(declare-fun m!97385 () Bool)

(assert (=> mapNonEmpty!3526 m!97385))

(check-sat (not b!90655) b_and!5473 (not b!90658) (not start!11110) (not mapNonEmpty!3526) b_and!5475 (not b!90660) (not b_lambda!4003) (not b_next!2307) (not b!90663) (not b!90657) (not b!90667) (not b_next!2305) (not b!90668) tp_is_empty!2569 (not mapNonEmpty!3525) (not b!90661))
(check-sat b_and!5473 b_and!5475 (not b_next!2305) (not b_next!2307))
