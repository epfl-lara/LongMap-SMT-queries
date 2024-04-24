; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14578 () Bool)

(assert start!14578)

(declare-fun b!137940 () Bool)

(declare-fun b_free!2965 () Bool)

(declare-fun b_next!2965 () Bool)

(assert (=> b!137940 (= b_free!2965 (not b_next!2965))))

(declare-fun tp!11357 () Bool)

(declare-fun b_and!8565 () Bool)

(assert (=> b!137940 (= tp!11357 b_and!8565)))

(declare-fun b!137929 () Bool)

(declare-fun b_free!2967 () Bool)

(declare-fun b_next!2967 () Bool)

(assert (=> b!137929 (= b_free!2967 (not b_next!2967))))

(declare-fun tp!11358 () Bool)

(declare-fun b_and!8567 () Bool)

(assert (=> b!137929 (= tp!11358 b_and!8567)))

(declare-fun b!137926 () Bool)

(declare-fun e!89815 () Bool)

(declare-fun e!89812 () Bool)

(assert (=> b!137926 (= e!89815 e!89812)))

(declare-fun b!137927 () Bool)

(declare-fun e!89822 () Bool)

(declare-fun tp_is_empty!2899 () Bool)

(assert (=> b!137927 (= e!89822 tp_is_empty!2899)))

(declare-fun b!137928 () Bool)

(declare-fun e!89818 () Bool)

(declare-fun e!89816 () Bool)

(declare-fun mapRes!4727 () Bool)

(assert (=> b!137928 (= e!89818 (and e!89816 mapRes!4727))))

(declare-fun condMapEmpty!4727 () Bool)

(declare-datatypes ((V!3513 0))(
  ( (V!3514 (val!1494 Int)) )
))
(declare-datatypes ((array!4815 0))(
  ( (array!4816 (arr!2276 (Array (_ BitVec 32) (_ BitVec 64))) (size!2547 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1106 0))(
  ( (ValueCellFull!1106 (v!3241 V!3513)) (EmptyCell!1106) )
))
(declare-datatypes ((array!4817 0))(
  ( (array!4818 (arr!2277 (Array (_ BitVec 32) ValueCell!1106)) (size!2548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1120 0))(
  ( (LongMapFixedSize!1121 (defaultEntry!2912 Int) (mask!7238 (_ BitVec 32)) (extraKeys!2669 (_ BitVec 32)) (zeroValue!2763 V!3513) (minValue!2763 V!3513) (_size!609 (_ BitVec 32)) (_keys!4669 array!4815) (_values!2895 array!4817) (_vacant!609 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!908 0))(
  ( (Cell!909 (v!3242 LongMapFixedSize!1120)) )
))
(declare-datatypes ((LongMap!908 0))(
  ( (LongMap!909 (underlying!465 Cell!908)) )
))
(declare-fun thiss!992 () LongMap!908)

(declare-fun mapDefault!4728 () ValueCell!1106)

(assert (=> b!137928 (= condMapEmpty!4727 (= (arr!2277 (_values!2895 (v!3242 (underlying!465 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1106)) mapDefault!4728)))))

(declare-fun mapIsEmpty!4727 () Bool)

(assert (=> mapIsEmpty!4727 mapRes!4727))

(declare-fun mapNonEmpty!4727 () Bool)

(declare-fun tp!11356 () Bool)

(declare-fun e!89813 () Bool)

(assert (=> mapNonEmpty!4727 (= mapRes!4727 (and tp!11356 e!89813))))

(declare-fun mapRest!4727 () (Array (_ BitVec 32) ValueCell!1106))

(declare-fun mapKey!4728 () (_ BitVec 32))

(declare-fun mapValue!4727 () ValueCell!1106)

(assert (=> mapNonEmpty!4727 (= (arr!2277 (_values!2895 (v!3242 (underlying!465 thiss!992)))) (store mapRest!4727 mapKey!4728 mapValue!4727))))

(declare-fun newMap!16 () LongMapFixedSize!1120)

(declare-fun e!89811 () Bool)

(declare-fun e!89814 () Bool)

(declare-fun array_inv!1419 (array!4815) Bool)

(declare-fun array_inv!1420 (array!4817) Bool)

(assert (=> b!137929 (= e!89814 (and tp!11358 tp_is_empty!2899 (array_inv!1419 (_keys!4669 newMap!16)) (array_inv!1420 (_values!2895 newMap!16)) e!89811))))

(declare-fun mapNonEmpty!4728 () Bool)

(declare-fun mapRes!4728 () Bool)

(declare-fun tp!11355 () Bool)

(assert (=> mapNonEmpty!4728 (= mapRes!4728 (and tp!11355 e!89822))))

(declare-fun mapRest!4728 () (Array (_ BitVec 32) ValueCell!1106))

(declare-fun mapKey!4727 () (_ BitVec 32))

(declare-fun mapValue!4728 () ValueCell!1106)

(assert (=> mapNonEmpty!4728 (= (arr!2277 (_values!2895 newMap!16)) (store mapRest!4728 mapKey!4727 mapValue!4728))))

(declare-fun b!137930 () Bool)

(declare-fun e!89819 () Bool)

(assert (=> b!137930 (= e!89811 (and e!89819 mapRes!4728))))

(declare-fun condMapEmpty!4728 () Bool)

(declare-fun mapDefault!4727 () ValueCell!1106)

(assert (=> b!137930 (= condMapEmpty!4728 (= (arr!2277 (_values!2895 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1106)) mapDefault!4727)))))

(declare-fun b!137931 () Bool)

(declare-fun e!89821 () Bool)

(declare-fun e!89825 () Bool)

(assert (=> b!137931 (= e!89821 e!89825)))

(declare-fun res!66073 () Bool)

(assert (=> b!137931 (=> (not res!66073) (not e!89825))))

(declare-datatypes ((tuple2!2590 0))(
  ( (tuple2!2591 (_1!1306 (_ BitVec 64)) (_2!1306 V!3513)) )
))
(declare-datatypes ((List!1704 0))(
  ( (Nil!1701) (Cons!1700 (h!2307 tuple2!2590) (t!6216 List!1704)) )
))
(declare-datatypes ((ListLongMap!1667 0))(
  ( (ListLongMap!1668 (toList!849 List!1704)) )
))
(declare-fun lt!72154 () ListLongMap!1667)

(declare-fun lt!72155 () ListLongMap!1667)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!137931 (= res!66073 (and (= lt!72154 lt!72155) (not (= (select (arr!2276 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2276 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1411 (LongMapFixedSize!1120) ListLongMap!1667)

(assert (=> b!137931 (= lt!72155 (map!1411 newMap!16))))

(declare-fun getCurrentListMap!523 (array!4815 array!4817 (_ BitVec 32) (_ BitVec 32) V!3513 V!3513 (_ BitVec 32) Int) ListLongMap!1667)

(assert (=> b!137931 (= lt!72154 (getCurrentListMap!523 (_keys!4669 (v!3242 (underlying!465 thiss!992))) (_values!2895 (v!3242 (underlying!465 thiss!992))) (mask!7238 (v!3242 (underlying!465 thiss!992))) (extraKeys!2669 (v!3242 (underlying!465 thiss!992))) (zeroValue!2763 (v!3242 (underlying!465 thiss!992))) (minValue!2763 (v!3242 (underlying!465 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2912 (v!3242 (underlying!465 thiss!992)))))))

(declare-fun res!66071 () Bool)

(assert (=> start!14578 (=> (not res!66071) (not e!89821))))

(declare-fun valid!551 (LongMap!908) Bool)

(assert (=> start!14578 (= res!66071 (valid!551 thiss!992))))

(assert (=> start!14578 e!89821))

(assert (=> start!14578 e!89815))

(assert (=> start!14578 true))

(assert (=> start!14578 e!89814))

(declare-fun b!137932 () Bool)

(declare-fun res!66076 () Bool)

(assert (=> b!137932 (=> (not res!66076) (not e!89821))))

(assert (=> b!137932 (= res!66076 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2547 (_keys!4669 (v!3242 (underlying!465 thiss!992)))))))))

(declare-fun b!137933 () Bool)

(assert (=> b!137933 (= e!89813 tp_is_empty!2899)))

(declare-fun b!137934 () Bool)

(declare-fun e!89820 () Bool)

(assert (=> b!137934 (= e!89820 (not (or (bvsge (size!2547 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!2547 (_keys!4669 (v!3242 (underlying!465 thiss!992))))))))))

(declare-fun arrayContainsKey!0 (array!4815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137934 (arrayContainsKey!0 (_keys!4669 (v!3242 (underlying!465 thiss!992))) (select (arr!2276 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!4345 0))(
  ( (Unit!4346) )
))
(declare-fun lt!72153 () Unit!4345)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!129 (array!4815 array!4817 (_ BitVec 32) (_ BitVec 32) V!3513 V!3513 (_ BitVec 64) (_ BitVec 32) Int) Unit!4345)

(assert (=> b!137934 (= lt!72153 (lemmaListMapContainsThenArrayContainsFrom!129 (_keys!4669 (v!3242 (underlying!465 thiss!992))) (_values!2895 (v!3242 (underlying!465 thiss!992))) (mask!7238 (v!3242 (underlying!465 thiss!992))) (extraKeys!2669 (v!3242 (underlying!465 thiss!992))) (zeroValue!2763 (v!3242 (underlying!465 thiss!992))) (minValue!2763 (v!3242 (underlying!465 thiss!992))) (select (arr!2276 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2912 (v!3242 (underlying!465 thiss!992)))))))

(declare-fun b!137935 () Bool)

(declare-fun res!66075 () Bool)

(assert (=> b!137935 (=> (not res!66075) (not e!89821))))

(declare-fun valid!552 (LongMapFixedSize!1120) Bool)

(assert (=> b!137935 (= res!66075 (valid!552 newMap!16))))

(declare-fun b!137936 () Bool)

(assert (=> b!137936 (= e!89819 tp_is_empty!2899)))

(declare-fun b!137937 () Bool)

(declare-fun e!89817 () Bool)

(assert (=> b!137937 (= e!89812 e!89817)))

(declare-fun b!137938 () Bool)

(declare-fun res!66074 () Bool)

(assert (=> b!137938 (=> (not res!66074) (not e!89821))))

(assert (=> b!137938 (= res!66074 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7238 newMap!16)) (_size!609 (v!3242 (underlying!465 thiss!992)))))))

(declare-fun b!137939 () Bool)

(assert (=> b!137939 (= e!89816 tp_is_empty!2899)))

(assert (=> b!137940 (= e!89817 (and tp!11357 tp_is_empty!2899 (array_inv!1419 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) (array_inv!1420 (_values!2895 (v!3242 (underlying!465 thiss!992)))) e!89818))))

(declare-fun mapIsEmpty!4728 () Bool)

(assert (=> mapIsEmpty!4728 mapRes!4728))

(declare-fun b!137941 () Bool)

(assert (=> b!137941 (= e!89825 e!89820)))

(declare-fun res!66072 () Bool)

(assert (=> b!137941 (=> (not res!66072) (not e!89820))))

(declare-fun contains!894 (ListLongMap!1667 (_ BitVec 64)) Bool)

(assert (=> b!137941 (= res!66072 (contains!894 lt!72155 (select (arr!2276 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2592 0))(
  ( (tuple2!2593 (_1!1307 Bool) (_2!1307 LongMapFixedSize!1120)) )
))
(declare-fun lt!72152 () tuple2!2592)

(declare-fun update!202 (LongMapFixedSize!1120 (_ BitVec 64) V!3513) tuple2!2592)

(declare-fun get!1509 (ValueCell!1106 V!3513) V!3513)

(declare-fun dynLambda!432 (Int (_ BitVec 64)) V!3513)

(assert (=> b!137941 (= lt!72152 (update!202 newMap!16 (select (arr!2276 (_keys!4669 (v!3242 (underlying!465 thiss!992)))) from!355) (get!1509 (select (arr!2277 (_values!2895 (v!3242 (underlying!465 thiss!992)))) from!355) (dynLambda!432 (defaultEntry!2912 (v!3242 (underlying!465 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!14578 res!66071) b!137932))

(assert (= (and b!137932 res!66076) b!137935))

(assert (= (and b!137935 res!66075) b!137938))

(assert (= (and b!137938 res!66074) b!137931))

(assert (= (and b!137931 res!66073) b!137941))

(assert (= (and b!137941 res!66072) b!137934))

(assert (= (and b!137928 condMapEmpty!4727) mapIsEmpty!4727))

(assert (= (and b!137928 (not condMapEmpty!4727)) mapNonEmpty!4727))

(get-info :version)

(assert (= (and mapNonEmpty!4727 ((_ is ValueCellFull!1106) mapValue!4727)) b!137933))

(assert (= (and b!137928 ((_ is ValueCellFull!1106) mapDefault!4728)) b!137939))

(assert (= b!137940 b!137928))

(assert (= b!137937 b!137940))

(assert (= b!137926 b!137937))

(assert (= start!14578 b!137926))

(assert (= (and b!137930 condMapEmpty!4728) mapIsEmpty!4728))

(assert (= (and b!137930 (not condMapEmpty!4728)) mapNonEmpty!4728))

(assert (= (and mapNonEmpty!4728 ((_ is ValueCellFull!1106) mapValue!4728)) b!137927))

(assert (= (and b!137930 ((_ is ValueCellFull!1106) mapDefault!4727)) b!137936))

(assert (= b!137929 b!137930))

(assert (= start!14578 b!137929))

(declare-fun b_lambda!6193 () Bool)

(assert (=> (not b_lambda!6193) (not b!137941)))

(declare-fun t!6213 () Bool)

(declare-fun tb!2473 () Bool)

(assert (=> (and b!137940 (= (defaultEntry!2912 (v!3242 (underlying!465 thiss!992))) (defaultEntry!2912 (v!3242 (underlying!465 thiss!992)))) t!6213) tb!2473))

(declare-fun result!4069 () Bool)

(assert (=> tb!2473 (= result!4069 tp_is_empty!2899)))

(assert (=> b!137941 t!6213))

(declare-fun b_and!8569 () Bool)

(assert (= b_and!8565 (and (=> t!6213 result!4069) b_and!8569)))

(declare-fun t!6215 () Bool)

(declare-fun tb!2475 () Bool)

(assert (=> (and b!137929 (= (defaultEntry!2912 newMap!16) (defaultEntry!2912 (v!3242 (underlying!465 thiss!992)))) t!6215) tb!2475))

(declare-fun result!4073 () Bool)

(assert (= result!4073 result!4069))

(assert (=> b!137941 t!6215))

(declare-fun b_and!8571 () Bool)

(assert (= b_and!8567 (and (=> t!6215 result!4073) b_and!8571)))

(declare-fun m!165147 () Bool)

(assert (=> mapNonEmpty!4728 m!165147))

(declare-fun m!165149 () Bool)

(assert (=> start!14578 m!165149))

(declare-fun m!165151 () Bool)

(assert (=> b!137931 m!165151))

(declare-fun m!165153 () Bool)

(assert (=> b!137931 m!165153))

(declare-fun m!165155 () Bool)

(assert (=> b!137931 m!165155))

(assert (=> b!137941 m!165151))

(declare-fun m!165157 () Bool)

(assert (=> b!137941 m!165157))

(declare-fun m!165159 () Bool)

(assert (=> b!137941 m!165159))

(declare-fun m!165161 () Bool)

(assert (=> b!137941 m!165161))

(declare-fun m!165163 () Bool)

(assert (=> b!137941 m!165163))

(assert (=> b!137941 m!165151))

(assert (=> b!137941 m!165161))

(assert (=> b!137941 m!165151))

(assert (=> b!137941 m!165163))

(declare-fun m!165165 () Bool)

(assert (=> b!137941 m!165165))

(assert (=> b!137941 m!165159))

(declare-fun m!165167 () Bool)

(assert (=> b!137935 m!165167))

(declare-fun m!165169 () Bool)

(assert (=> b!137940 m!165169))

(declare-fun m!165171 () Bool)

(assert (=> b!137940 m!165171))

(declare-fun m!165173 () Bool)

(assert (=> mapNonEmpty!4727 m!165173))

(declare-fun m!165175 () Bool)

(assert (=> b!137929 m!165175))

(declare-fun m!165177 () Bool)

(assert (=> b!137929 m!165177))

(assert (=> b!137934 m!165151))

(assert (=> b!137934 m!165151))

(declare-fun m!165179 () Bool)

(assert (=> b!137934 m!165179))

(assert (=> b!137934 m!165151))

(declare-fun m!165181 () Bool)

(assert (=> b!137934 m!165181))

(check-sat (not start!14578) tp_is_empty!2899 (not b!137941) b_and!8571 (not b_next!2965) b_and!8569 (not b!137931) (not b_lambda!6193) (not b!137934) (not mapNonEmpty!4728) (not b!137935) (not mapNonEmpty!4727) (not b!137940) (not b!137929) (not b_next!2967))
(check-sat b_and!8569 b_and!8571 (not b_next!2965) (not b_next!2967))
