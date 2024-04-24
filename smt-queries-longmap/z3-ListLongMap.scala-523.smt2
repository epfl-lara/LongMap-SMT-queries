; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13132 () Bool)

(assert start!13132)

(declare-fun b!115022 () Bool)

(declare-fun b_free!2665 () Bool)

(declare-fun b_next!2665 () Bool)

(assert (=> b!115022 (= b_free!2665 (not b_next!2665))))

(declare-fun tp!10359 () Bool)

(declare-fun b_and!7129 () Bool)

(assert (=> b!115022 (= tp!10359 b_and!7129)))

(declare-fun b!115030 () Bool)

(declare-fun b_free!2667 () Bool)

(declare-fun b_next!2667 () Bool)

(assert (=> b!115030 (= b_free!2667 (not b_next!2667))))

(declare-fun tp!10358 () Bool)

(declare-fun b_and!7131 () Bool)

(assert (=> b!115030 (= tp!10358 b_and!7131)))

(declare-fun b!115021 () Bool)

(declare-fun e!74922 () Bool)

(declare-fun tp_is_empty!2749 () Bool)

(assert (=> b!115021 (= e!74922 tp_is_empty!2749)))

(declare-fun mapNonEmpty!4179 () Bool)

(declare-fun mapRes!4179 () Bool)

(declare-fun tp!10360 () Bool)

(declare-fun e!74928 () Bool)

(assert (=> mapNonEmpty!4179 (= mapRes!4179 (and tp!10360 e!74928))))

(declare-datatypes ((V!3313 0))(
  ( (V!3314 (val!1419 Int)) )
))
(declare-datatypes ((ValueCell!1031 0))(
  ( (ValueCellFull!1031 (v!3009 V!3313)) (EmptyCell!1031) )
))
(declare-fun mapRest!4180 () (Array (_ BitVec 32) ValueCell!1031))

(declare-datatypes ((array!4487 0))(
  ( (array!4488 (arr!2126 (Array (_ BitVec 32) (_ BitVec 64))) (size!2386 (_ BitVec 32))) )
))
(declare-datatypes ((array!4489 0))(
  ( (array!4490 (arr!2127 (Array (_ BitVec 32) ValueCell!1031)) (size!2387 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!970 0))(
  ( (LongMapFixedSize!971 (defaultEntry!2694 Int) (mask!6896 (_ BitVec 32)) (extraKeys!2483 (_ BitVec 32)) (zeroValue!2561 V!3313) (minValue!2561 V!3313) (_size!534 (_ BitVec 32)) (_keys!4416 array!4487) (_values!2677 array!4489) (_vacant!534 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!970)

(declare-fun mapValue!4180 () ValueCell!1031)

(declare-fun mapKey!4180 () (_ BitVec 32))

(assert (=> mapNonEmpty!4179 (= (arr!2127 (_values!2677 newMap!16)) (store mapRest!4180 mapKey!4180 mapValue!4180))))

(declare-datatypes ((Cell!772 0))(
  ( (Cell!773 (v!3010 LongMapFixedSize!970)) )
))
(declare-datatypes ((LongMap!772 0))(
  ( (LongMap!773 (underlying!397 Cell!772)) )
))
(declare-fun thiss!992 () LongMap!772)

(declare-fun e!74930 () Bool)

(declare-fun e!74926 () Bool)

(declare-fun array_inv!1323 (array!4487) Bool)

(declare-fun array_inv!1324 (array!4489) Bool)

(assert (=> b!115022 (= e!74926 (and tp!10359 tp_is_empty!2749 (array_inv!1323 (_keys!4416 (v!3010 (underlying!397 thiss!992)))) (array_inv!1324 (_values!2677 (v!3010 (underlying!397 thiss!992)))) e!74930))))

(declare-fun b!115023 () Bool)

(declare-fun e!74925 () Bool)

(declare-fun e!74918 () Bool)

(assert (=> b!115023 (= e!74925 e!74918)))

(declare-fun b!115024 () Bool)

(declare-fun e!74924 () Bool)

(declare-fun e!74927 () Bool)

(assert (=> b!115024 (= e!74924 (and e!74927 mapRes!4179))))

(declare-fun condMapEmpty!4180 () Bool)

(declare-fun mapDefault!4180 () ValueCell!1031)

(assert (=> b!115024 (= condMapEmpty!4180 (= (arr!2127 (_values!2677 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1031)) mapDefault!4180)))))

(declare-fun b!115025 () Bool)

(declare-fun res!56516 () Bool)

(declare-fun e!74919 () Bool)

(assert (=> b!115025 (=> (not res!56516) (not e!74919))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!115025 (= res!56516 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2386 (_keys!4416 (v!3010 (underlying!397 thiss!992)))))))))

(declare-fun mapNonEmpty!4180 () Bool)

(declare-fun mapRes!4180 () Bool)

(declare-fun tp!10357 () Bool)

(assert (=> mapNonEmpty!4180 (= mapRes!4180 (and tp!10357 e!74922))))

(declare-fun mapValue!4179 () ValueCell!1031)

(declare-fun mapKey!4179 () (_ BitVec 32))

(declare-fun mapRest!4179 () (Array (_ BitVec 32) ValueCell!1031))

(assert (=> mapNonEmpty!4180 (= (arr!2127 (_values!2677 (v!3010 (underlying!397 thiss!992)))) (store mapRest!4179 mapKey!4179 mapValue!4179))))

(declare-fun mapIsEmpty!4179 () Bool)

(assert (=> mapIsEmpty!4179 mapRes!4179))

(declare-fun b!115026 () Bool)

(assert (=> b!115026 (= e!74919 false)))

(declare-datatypes ((tuple2!2460 0))(
  ( (tuple2!2461 (_1!1241 (_ BitVec 64)) (_2!1241 V!3313)) )
))
(declare-datatypes ((List!1646 0))(
  ( (Nil!1643) (Cons!1642 (h!2242 tuple2!2460) (t!5896 List!1646)) )
))
(declare-datatypes ((ListLongMap!1587 0))(
  ( (ListLongMap!1588 (toList!809 List!1646)) )
))
(declare-fun lt!59907 () ListLongMap!1587)

(declare-fun map!1328 (LongMapFixedSize!970) ListLongMap!1587)

(assert (=> b!115026 (= lt!59907 (map!1328 newMap!16))))

(declare-fun lt!59906 () ListLongMap!1587)

(declare-fun getCurrentListMap!490 (array!4487 array!4489 (_ BitVec 32) (_ BitVec 32) V!3313 V!3313 (_ BitVec 32) Int) ListLongMap!1587)

(assert (=> b!115026 (= lt!59906 (getCurrentListMap!490 (_keys!4416 (v!3010 (underlying!397 thiss!992))) (_values!2677 (v!3010 (underlying!397 thiss!992))) (mask!6896 (v!3010 (underlying!397 thiss!992))) (extraKeys!2483 (v!3010 (underlying!397 thiss!992))) (zeroValue!2561 (v!3010 (underlying!397 thiss!992))) (minValue!2561 (v!3010 (underlying!397 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2694 (v!3010 (underlying!397 thiss!992)))))))

(declare-fun b!115027 () Bool)

(assert (=> b!115027 (= e!74918 e!74926)))

(declare-fun b!115028 () Bool)

(assert (=> b!115028 (= e!74927 tp_is_empty!2749)))

(declare-fun b!115029 () Bool)

(declare-fun res!56515 () Bool)

(assert (=> b!115029 (=> (not res!56515) (not e!74919))))

(assert (=> b!115029 (= res!56515 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6896 newMap!16)) (_size!534 (v!3010 (underlying!397 thiss!992)))))))

(declare-fun mapIsEmpty!4180 () Bool)

(assert (=> mapIsEmpty!4180 mapRes!4180))

(declare-fun e!74923 () Bool)

(assert (=> b!115030 (= e!74923 (and tp!10358 tp_is_empty!2749 (array_inv!1323 (_keys!4416 newMap!16)) (array_inv!1324 (_values!2677 newMap!16)) e!74924))))

(declare-fun res!56513 () Bool)

(assert (=> start!13132 (=> (not res!56513) (not e!74919))))

(declare-fun valid!463 (LongMap!772) Bool)

(assert (=> start!13132 (= res!56513 (valid!463 thiss!992))))

(assert (=> start!13132 e!74919))

(assert (=> start!13132 e!74925))

(assert (=> start!13132 true))

(assert (=> start!13132 e!74923))

(declare-fun b!115031 () Bool)

(declare-fun e!74920 () Bool)

(assert (=> b!115031 (= e!74920 tp_is_empty!2749)))

(declare-fun b!115032 () Bool)

(assert (=> b!115032 (= e!74930 (and e!74920 mapRes!4180))))

(declare-fun condMapEmpty!4179 () Bool)

(declare-fun mapDefault!4179 () ValueCell!1031)

(assert (=> b!115032 (= condMapEmpty!4179 (= (arr!2127 (_values!2677 (v!3010 (underlying!397 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1031)) mapDefault!4179)))))

(declare-fun b!115033 () Bool)

(assert (=> b!115033 (= e!74928 tp_is_empty!2749)))

(declare-fun b!115034 () Bool)

(declare-fun res!56514 () Bool)

(assert (=> b!115034 (=> (not res!56514) (not e!74919))))

(declare-fun valid!464 (LongMapFixedSize!970) Bool)

(assert (=> b!115034 (= res!56514 (valid!464 newMap!16))))

(assert (= (and start!13132 res!56513) b!115025))

(assert (= (and b!115025 res!56516) b!115034))

(assert (= (and b!115034 res!56514) b!115029))

(assert (= (and b!115029 res!56515) b!115026))

(assert (= (and b!115032 condMapEmpty!4179) mapIsEmpty!4180))

(assert (= (and b!115032 (not condMapEmpty!4179)) mapNonEmpty!4180))

(get-info :version)

(assert (= (and mapNonEmpty!4180 ((_ is ValueCellFull!1031) mapValue!4179)) b!115021))

(assert (= (and b!115032 ((_ is ValueCellFull!1031) mapDefault!4179)) b!115031))

(assert (= b!115022 b!115032))

(assert (= b!115027 b!115022))

(assert (= b!115023 b!115027))

(assert (= start!13132 b!115023))

(assert (= (and b!115024 condMapEmpty!4180) mapIsEmpty!4179))

(assert (= (and b!115024 (not condMapEmpty!4180)) mapNonEmpty!4179))

(assert (= (and mapNonEmpty!4179 ((_ is ValueCellFull!1031) mapValue!4180)) b!115033))

(assert (= (and b!115024 ((_ is ValueCellFull!1031) mapDefault!4180)) b!115028))

(assert (= b!115030 b!115024))

(assert (= start!13132 b!115030))

(declare-fun m!131223 () Bool)

(assert (=> mapNonEmpty!4179 m!131223))

(declare-fun m!131225 () Bool)

(assert (=> b!115030 m!131225))

(declare-fun m!131227 () Bool)

(assert (=> b!115030 m!131227))

(declare-fun m!131229 () Bool)

(assert (=> start!13132 m!131229))

(declare-fun m!131231 () Bool)

(assert (=> mapNonEmpty!4180 m!131231))

(declare-fun m!131233 () Bool)

(assert (=> b!115034 m!131233))

(declare-fun m!131235 () Bool)

(assert (=> b!115026 m!131235))

(declare-fun m!131237 () Bool)

(assert (=> b!115026 m!131237))

(declare-fun m!131239 () Bool)

(assert (=> b!115022 m!131239))

(declare-fun m!131241 () Bool)

(assert (=> b!115022 m!131241))

(check-sat (not mapNonEmpty!4180) (not start!13132) b_and!7129 (not b!115026) (not b!115030) (not b!115034) tp_is_empty!2749 (not mapNonEmpty!4179) (not b!115022) (not b_next!2665) (not b_next!2667) b_and!7131)
(check-sat b_and!7129 b_and!7131 (not b_next!2665) (not b_next!2667))
