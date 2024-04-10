; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9918 () Bool)

(assert start!9918)

(declare-fun b!75059 () Bool)

(declare-fun b_free!2133 () Bool)

(declare-fun b_next!2133 () Bool)

(assert (=> b!75059 (= b_free!2133 (not b_next!2133))))

(declare-fun tp!8585 () Bool)

(declare-fun b_and!4599 () Bool)

(assert (=> b!75059 (= tp!8585 b_and!4599)))

(declare-fun b!75064 () Bool)

(declare-fun b_free!2135 () Bool)

(declare-fun b_next!2135 () Bool)

(assert (=> b!75064 (= b_free!2135 (not b_next!2135))))

(declare-fun tp!8584 () Bool)

(declare-fun b_and!4601 () Bool)

(assert (=> b!75064 (= tp!8584 b_and!4601)))

(declare-fun b!75057 () Bool)

(declare-datatypes ((Unit!2161 0))(
  ( (Unit!2162) )
))
(declare-fun e!49071 () Unit!2161)

(declare-fun Unit!2163 () Unit!2161)

(assert (=> b!75057 (= e!49071 Unit!2163)))

(declare-fun lt!33849 () Unit!2161)

(declare-datatypes ((V!2957 0))(
  ( (V!2958 (val!1286 Int)) )
))
(declare-datatypes ((array!3913 0))(
  ( (array!3914 (arr!1867 (Array (_ BitVec 32) (_ BitVec 64))) (size!2106 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!898 0))(
  ( (ValueCellFull!898 (v!2547 V!2957)) (EmptyCell!898) )
))
(declare-datatypes ((array!3915 0))(
  ( (array!3916 (arr!1868 (Array (_ BitVec 32) ValueCell!898)) (size!2107 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!704 0))(
  ( (LongMapFixedSize!705 (defaultEntry!2235 Int) (mask!6212 (_ BitVec 32)) (extraKeys!2090 (_ BitVec 32)) (zeroValue!2135 V!2957) (minValue!2135 V!2957) (_size!401 (_ BitVec 32)) (_keys!3891 array!3913) (_values!2218 array!3915) (_vacant!401 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!506 0))(
  ( (Cell!507 (v!2548 LongMapFixedSize!704)) )
))
(declare-datatypes ((LongMap!506 0))(
  ( (LongMap!507 (underlying!264 Cell!506)) )
))
(declare-fun thiss!992 () LongMap!506)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!52 (array!3913 array!3915 (_ BitVec 32) (_ BitVec 32) V!2957 V!2957 (_ BitVec 64) (_ BitVec 32) Int) Unit!2161)

(assert (=> b!75057 (= lt!33849 (lemmaListMapContainsThenArrayContainsFrom!52 (_keys!3891 (v!2548 (underlying!264 thiss!992))) (_values!2218 (v!2548 (underlying!264 thiss!992))) (mask!6212 (v!2548 (underlying!264 thiss!992))) (extraKeys!2090 (v!2548 (underlying!264 thiss!992))) (zeroValue!2135 (v!2548 (underlying!264 thiss!992))) (minValue!2135 (v!2548 (underlying!264 thiss!992))) (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2235 (v!2548 (underlying!264 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!75057 (arrayContainsKey!0 (_keys!3891 (v!2548 (underlying!264 thiss!992))) (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!33844 () Unit!2161)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3913 (_ BitVec 32) (_ BitVec 32)) Unit!2161)

(assert (=> b!75057 (= lt!33844 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3891 (v!2548 (underlying!264 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1484 0))(
  ( (Nil!1481) (Cons!1480 (h!2068 (_ BitVec 64)) (t!5066 List!1484)) )
))
(declare-fun arrayNoDuplicates!0 (array!3913 (_ BitVec 32) List!1484) Bool)

(assert (=> b!75057 (arrayNoDuplicates!0 (_keys!3891 (v!2548 (underlying!264 thiss!992))) from!355 Nil!1481)))

(declare-fun lt!33847 () Unit!2161)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3913 (_ BitVec 32) (_ BitVec 64) List!1484) Unit!2161)

(assert (=> b!75057 (= lt!33847 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3891 (v!2548 (underlying!264 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) (Cons!1480 (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) Nil!1481)))))

(assert (=> b!75057 false))

(declare-fun b!75058 () Bool)

(declare-fun e!49065 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3913 (_ BitVec 32)) Bool)

(assert (=> b!75058 (= e!49065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3891 (v!2548 (underlying!264 thiss!992))) (mask!6212 (v!2548 (underlying!264 thiss!992)))))))

(declare-fun e!49064 () Bool)

(declare-fun tp_is_empty!2483 () Bool)

(declare-fun e!49073 () Bool)

(declare-fun array_inv!1153 (array!3913) Bool)

(declare-fun array_inv!1154 (array!3915) Bool)

(assert (=> b!75059 (= e!49064 (and tp!8585 tp_is_empty!2483 (array_inv!1153 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) (array_inv!1154 (_values!2218 (v!2548 (underlying!264 thiss!992)))) e!49073))))

(declare-fun b!75061 () Bool)

(declare-fun e!49067 () Bool)

(declare-fun e!49069 () Bool)

(assert (=> b!75061 (= e!49067 e!49069)))

(declare-fun res!39629 () Bool)

(assert (=> b!75061 (=> (not res!39629) (not e!49069))))

(declare-datatypes ((tuple2!2134 0))(
  ( (tuple2!2135 (_1!1078 (_ BitVec 64)) (_2!1078 V!2957)) )
))
(declare-datatypes ((List!1485 0))(
  ( (Nil!1482) (Cons!1481 (h!2069 tuple2!2134) (t!5067 List!1485)) )
))
(declare-datatypes ((ListLongMap!1425 0))(
  ( (ListLongMap!1426 (toList!728 List!1485)) )
))
(declare-fun lt!33842 () ListLongMap!1425)

(declare-fun lt!33850 () ListLongMap!1425)

(assert (=> b!75061 (= res!39629 (= lt!33842 lt!33850))))

(declare-fun newMap!16 () LongMapFixedSize!704)

(declare-fun map!1156 (LongMapFixedSize!704) ListLongMap!1425)

(assert (=> b!75061 (= lt!33850 (map!1156 newMap!16))))

(declare-fun getCurrentListMap!425 (array!3913 array!3915 (_ BitVec 32) (_ BitVec 32) V!2957 V!2957 (_ BitVec 32) Int) ListLongMap!1425)

(assert (=> b!75061 (= lt!33842 (getCurrentListMap!425 (_keys!3891 (v!2548 (underlying!264 thiss!992))) (_values!2218 (v!2548 (underlying!264 thiss!992))) (mask!6212 (v!2548 (underlying!264 thiss!992))) (extraKeys!2090 (v!2548 (underlying!264 thiss!992))) (zeroValue!2135 (v!2548 (underlying!264 thiss!992))) (minValue!2135 (v!2548 (underlying!264 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2235 (v!2548 (underlying!264 thiss!992)))))))

(declare-fun b!75062 () Bool)

(declare-fun res!39631 () Bool)

(assert (=> b!75062 (=> (not res!39631) (not e!49067))))

(declare-fun valid!295 (LongMapFixedSize!704) Bool)

(assert (=> b!75062 (= res!39631 (valid!295 newMap!16))))

(declare-fun b!75063 () Bool)

(declare-fun e!49078 () Bool)

(declare-fun e!49072 () Bool)

(assert (=> b!75063 (= e!49078 e!49072)))

(declare-fun e!49079 () Bool)

(declare-fun e!49077 () Bool)

(assert (=> b!75064 (= e!49077 (and tp!8584 tp_is_empty!2483 (array_inv!1153 (_keys!3891 newMap!16)) (array_inv!1154 (_values!2218 newMap!16)) e!49079))))

(declare-fun b!75065 () Bool)

(declare-fun e!49070 () Bool)

(assert (=> b!75065 (= e!49069 e!49070)))

(declare-fun res!39633 () Bool)

(assert (=> b!75065 (=> (not res!39633) (not e!49070))))

(assert (=> b!75065 (= res!39633 (and (not (= (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!33846 () V!2957)

(declare-fun get!1147 (ValueCell!898 V!2957) V!2957)

(declare-fun dynLambda!328 (Int (_ BitVec 64)) V!2957)

(assert (=> b!75065 (= lt!33846 (get!1147 (select (arr!1868 (_values!2218 (v!2548 (underlying!264 thiss!992)))) from!355) (dynLambda!328 (defaultEntry!2235 (v!2548 (underlying!264 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!75066 () Bool)

(declare-fun e!49076 () Bool)

(assert (=> b!75066 (= e!49076 (not e!49065))))

(declare-fun res!39626 () Bool)

(assert (=> b!75066 (=> res!39626 e!49065)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!75066 (= res!39626 (not (validMask!0 (mask!6212 (v!2548 (underlying!264 thiss!992))))))))

(declare-fun lt!33845 () ListLongMap!1425)

(declare-fun lt!33843 () tuple2!2134)

(declare-fun lt!33839 () tuple2!2134)

(declare-fun +!97 (ListLongMap!1425 tuple2!2134) ListLongMap!1425)

(assert (=> b!75066 (= (+!97 (+!97 lt!33845 lt!33843) lt!33839) (+!97 (+!97 lt!33845 lt!33839) lt!33843))))

(assert (=> b!75066 (= lt!33839 (tuple2!2135 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2135 (v!2548 (underlying!264 thiss!992)))))))

(assert (=> b!75066 (= lt!33843 (tuple2!2135 (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) lt!33846))))

(declare-fun lt!33841 () Unit!2161)

(declare-fun addCommutativeForDiffKeys!16 (ListLongMap!1425 (_ BitVec 64) V!2957 (_ BitVec 64) V!2957) Unit!2161)

(assert (=> b!75066 (= lt!33841 (addCommutativeForDiffKeys!16 lt!33845 (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) lt!33846 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2135 (v!2548 (underlying!264 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!62 (array!3913 array!3915 (_ BitVec 32) (_ BitVec 32) V!2957 V!2957 (_ BitVec 32) Int) ListLongMap!1425)

(assert (=> b!75066 (= lt!33845 (getCurrentListMapNoExtraKeys!62 (_keys!3891 (v!2548 (underlying!264 thiss!992))) (_values!2218 (v!2548 (underlying!264 thiss!992))) (mask!6212 (v!2548 (underlying!264 thiss!992))) (extraKeys!2090 (v!2548 (underlying!264 thiss!992))) (zeroValue!2135 (v!2548 (underlying!264 thiss!992))) (minValue!2135 (v!2548 (underlying!264 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2235 (v!2548 (underlying!264 thiss!992)))))))

(declare-fun b!75067 () Bool)

(declare-fun res!39627 () Bool)

(assert (=> b!75067 (=> res!39627 e!49065)))

(assert (=> b!75067 (= res!39627 (or (not (= (size!2107 (_values!2218 (v!2548 (underlying!264 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6212 (v!2548 (underlying!264 thiss!992)))))) (not (= (size!2106 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) (size!2107 (_values!2218 (v!2548 (underlying!264 thiss!992)))))) (bvslt (mask!6212 (v!2548 (underlying!264 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2090 (v!2548 (underlying!264 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2090 (v!2548 (underlying!264 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!3203 () Bool)

(declare-fun mapRes!3204 () Bool)

(assert (=> mapIsEmpty!3203 mapRes!3204))

(declare-fun mapNonEmpty!3203 () Bool)

(declare-fun mapRes!3203 () Bool)

(declare-fun tp!8583 () Bool)

(declare-fun e!49068 () Bool)

(assert (=> mapNonEmpty!3203 (= mapRes!3203 (and tp!8583 e!49068))))

(declare-fun mapRest!3204 () (Array (_ BitVec 32) ValueCell!898))

(declare-fun mapValue!3204 () ValueCell!898)

(declare-fun mapKey!3204 () (_ BitVec 32))

(assert (=> mapNonEmpty!3203 (= (arr!1868 (_values!2218 newMap!16)) (store mapRest!3204 mapKey!3204 mapValue!3204))))

(declare-fun res!39628 () Bool)

(assert (=> start!9918 (=> (not res!39628) (not e!49067))))

(declare-fun valid!296 (LongMap!506) Bool)

(assert (=> start!9918 (= res!39628 (valid!296 thiss!992))))

(assert (=> start!9918 e!49067))

(assert (=> start!9918 e!49078))

(assert (=> start!9918 true))

(assert (=> start!9918 e!49077))

(declare-fun b!75060 () Bool)

(declare-fun e!49066 () Bool)

(assert (=> b!75060 (= e!49066 tp_is_empty!2483)))

(declare-fun b!75068 () Bool)

(declare-fun res!39634 () Bool)

(assert (=> b!75068 (=> (not res!39634) (not e!49067))))

(assert (=> b!75068 (= res!39634 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2106 (_keys!3891 (v!2548 (underlying!264 thiss!992)))))))))

(declare-fun b!75069 () Bool)

(assert (=> b!75069 (= e!49070 e!49076)))

(declare-fun res!39632 () Bool)

(assert (=> b!75069 (=> (not res!39632) (not e!49076))))

(declare-datatypes ((tuple2!2136 0))(
  ( (tuple2!2137 (_1!1079 Bool) (_2!1079 LongMapFixedSize!704)) )
))
(declare-fun lt!33840 () tuple2!2136)

(assert (=> b!75069 (= res!39632 (and (_1!1079 lt!33840) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!33848 () Unit!2161)

(assert (=> b!75069 (= lt!33848 e!49071)))

(declare-fun c!11342 () Bool)

(declare-fun contains!728 (ListLongMap!1425 (_ BitVec 64)) Bool)

(assert (=> b!75069 (= c!11342 (contains!728 lt!33850 (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355)))))

(declare-fun update!99 (LongMapFixedSize!704 (_ BitVec 64) V!2957) tuple2!2136)

(assert (=> b!75069 (= lt!33840 (update!99 newMap!16 (select (arr!1867 (_keys!3891 (v!2548 (underlying!264 thiss!992)))) from!355) lt!33846))))

(declare-fun b!75070 () Bool)

(assert (=> b!75070 (= e!49072 e!49064)))

(declare-fun mapIsEmpty!3204 () Bool)

(assert (=> mapIsEmpty!3204 mapRes!3203))

(declare-fun b!75071 () Bool)

(declare-fun e!49075 () Bool)

(assert (=> b!75071 (= e!49075 tp_is_empty!2483)))

(declare-fun b!75072 () Bool)

(declare-fun Unit!2164 () Unit!2161)

(assert (=> b!75072 (= e!49071 Unit!2164)))

(declare-fun b!75073 () Bool)

(assert (=> b!75073 (= e!49079 (and e!49066 mapRes!3203))))

(declare-fun condMapEmpty!3203 () Bool)

(declare-fun mapDefault!3203 () ValueCell!898)

