; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13132 () Bool)

(assert start!13132)

(declare-fun b!114995 () Bool)

(declare-fun b_free!2665 () Bool)

(declare-fun b_next!2665 () Bool)

(assert (=> b!114995 (= b_free!2665 (not b_next!2665))))

(declare-fun tp!10358 () Bool)

(declare-fun b_and!7121 () Bool)

(assert (=> b!114995 (= tp!10358 b_and!7121)))

(declare-fun b!114998 () Bool)

(declare-fun b_free!2667 () Bool)

(declare-fun b_next!2667 () Bool)

(assert (=> b!114998 (= b_free!2667 (not b_next!2667))))

(declare-fun tp!10359 () Bool)

(declare-fun b_and!7123 () Bool)

(assert (=> b!114998 (= tp!10359 b_and!7123)))

(declare-fun b!114985 () Bool)

(declare-fun res!56490 () Bool)

(declare-fun e!74895 () Bool)

(assert (=> b!114985 (=> (not res!56490) (not e!74895))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3313 0))(
  ( (V!3314 (val!1419 Int)) )
))
(declare-datatypes ((array!4481 0))(
  ( (array!4482 (arr!2122 (Array (_ BitVec 32) (_ BitVec 64))) (size!2383 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1031 0))(
  ( (ValueCellFull!1031 (v!2999 V!3313)) (EmptyCell!1031) )
))
(declare-datatypes ((array!4483 0))(
  ( (array!4484 (arr!2123 (Array (_ BitVec 32) ValueCell!1031)) (size!2384 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!970 0))(
  ( (LongMapFixedSize!971 (defaultEntry!2694 Int) (mask!6895 (_ BitVec 32)) (extraKeys!2483 (_ BitVec 32)) (zeroValue!2561 V!3313) (minValue!2561 V!3313) (_size!534 (_ BitVec 32)) (_keys!4415 array!4481) (_values!2677 array!4483) (_vacant!534 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!758 0))(
  ( (Cell!759 (v!3000 LongMapFixedSize!970)) )
))
(declare-datatypes ((LongMap!758 0))(
  ( (LongMap!759 (underlying!390 Cell!758)) )
))
(declare-fun thiss!992 () LongMap!758)

(assert (=> b!114985 (= res!56490 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2383 (_keys!4415 (v!3000 (underlying!390 thiss!992)))))))))

(declare-fun b!114986 () Bool)

(declare-fun res!56488 () Bool)

(assert (=> b!114986 (=> (not res!56488) (not e!74895))))

(declare-fun newMap!16 () LongMapFixedSize!970)

(assert (=> b!114986 (= res!56488 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6895 newMap!16)) (_size!534 (v!3000 (underlying!390 thiss!992)))))))

(declare-fun res!56489 () Bool)

(assert (=> start!13132 (=> (not res!56489) (not e!74895))))

(declare-fun valid!459 (LongMap!758) Bool)

(assert (=> start!13132 (= res!56489 (valid!459 thiss!992))))

(assert (=> start!13132 e!74895))

(declare-fun e!74904 () Bool)

(assert (=> start!13132 e!74904))

(assert (=> start!13132 true))

(declare-fun e!74892 () Bool)

(assert (=> start!13132 e!74892))

(declare-fun b!114987 () Bool)

(declare-fun e!74898 () Bool)

(declare-fun e!74903 () Bool)

(assert (=> b!114987 (= e!74898 e!74903)))

(declare-fun b!114988 () Bool)

(declare-fun e!74899 () Bool)

(declare-fun tp_is_empty!2749 () Bool)

(assert (=> b!114988 (= e!74899 tp_is_empty!2749)))

(declare-fun b!114989 () Bool)

(assert (=> b!114989 (= e!74904 e!74898)))

(declare-fun mapNonEmpty!4179 () Bool)

(declare-fun mapRes!4180 () Bool)

(declare-fun tp!10357 () Bool)

(declare-fun e!74896 () Bool)

(assert (=> mapNonEmpty!4179 (= mapRes!4180 (and tp!10357 e!74896))))

(declare-fun mapRest!4180 () (Array (_ BitVec 32) ValueCell!1031))

(declare-fun mapKey!4179 () (_ BitVec 32))

(declare-fun mapValue!4180 () ValueCell!1031)

(assert (=> mapNonEmpty!4179 (= (arr!2123 (_values!2677 (v!3000 (underlying!390 thiss!992)))) (store mapRest!4180 mapKey!4179 mapValue!4180))))

(declare-fun b!114990 () Bool)

(declare-fun res!56487 () Bool)

(assert (=> b!114990 (=> (not res!56487) (not e!74895))))

(declare-fun valid!460 (LongMapFixedSize!970) Bool)

(assert (=> b!114990 (= res!56487 (valid!460 newMap!16))))

(declare-fun mapNonEmpty!4180 () Bool)

(declare-fun mapRes!4179 () Bool)

(declare-fun tp!10360 () Bool)

(declare-fun e!74897 () Bool)

(assert (=> mapNonEmpty!4180 (= mapRes!4179 (and tp!10360 e!74897))))

(declare-fun mapRest!4179 () (Array (_ BitVec 32) ValueCell!1031))

(declare-fun mapKey!4180 () (_ BitVec 32))

(declare-fun mapValue!4179 () ValueCell!1031)

(assert (=> mapNonEmpty!4180 (= (arr!2123 (_values!2677 newMap!16)) (store mapRest!4179 mapKey!4180 mapValue!4179))))

(declare-fun b!114991 () Bool)

(assert (=> b!114991 (= e!74897 tp_is_empty!2749)))

(declare-fun mapIsEmpty!4179 () Bool)

(assert (=> mapIsEmpty!4179 mapRes!4180))

(declare-fun b!114992 () Bool)

(assert (=> b!114992 (= e!74896 tp_is_empty!2749)))

(declare-fun b!114993 () Bool)

(declare-fun e!74902 () Bool)

(assert (=> b!114993 (= e!74902 (and e!74899 mapRes!4179))))

(declare-fun condMapEmpty!4179 () Bool)

(declare-fun mapDefault!4180 () ValueCell!1031)

(assert (=> b!114993 (= condMapEmpty!4179 (= (arr!2123 (_values!2677 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1031)) mapDefault!4180)))))

(declare-fun b!114994 () Bool)

(declare-fun e!74900 () Bool)

(declare-fun e!74894 () Bool)

(assert (=> b!114994 (= e!74900 (and e!74894 mapRes!4180))))

(declare-fun condMapEmpty!4180 () Bool)

(declare-fun mapDefault!4179 () ValueCell!1031)

(assert (=> b!114994 (= condMapEmpty!4180 (= (arr!2123 (_values!2677 (v!3000 (underlying!390 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1031)) mapDefault!4179)))))

(declare-fun array_inv!1345 (array!4481) Bool)

(declare-fun array_inv!1346 (array!4483) Bool)

(assert (=> b!114995 (= e!74903 (and tp!10358 tp_is_empty!2749 (array_inv!1345 (_keys!4415 (v!3000 (underlying!390 thiss!992)))) (array_inv!1346 (_values!2677 (v!3000 (underlying!390 thiss!992)))) e!74900))))

(declare-fun b!114996 () Bool)

(assert (=> b!114996 (= e!74894 tp_is_empty!2749)))

(declare-fun b!114997 () Bool)

(assert (=> b!114997 (= e!74895 false)))

(declare-datatypes ((tuple2!2468 0))(
  ( (tuple2!2469 (_1!1245 (_ BitVec 64)) (_2!1245 V!3313)) )
))
(declare-datatypes ((List!1658 0))(
  ( (Nil!1655) (Cons!1654 (h!2254 tuple2!2468) (t!5907 List!1658)) )
))
(declare-datatypes ((ListLongMap!1593 0))(
  ( (ListLongMap!1594 (toList!812 List!1658)) )
))
(declare-fun lt!59864 () ListLongMap!1593)

(declare-fun map!1313 (LongMapFixedSize!970) ListLongMap!1593)

(assert (=> b!114997 (= lt!59864 (map!1313 newMap!16))))

(declare-fun lt!59865 () ListLongMap!1593)

(declare-fun getCurrentListMap!483 (array!4481 array!4483 (_ BitVec 32) (_ BitVec 32) V!3313 V!3313 (_ BitVec 32) Int) ListLongMap!1593)

(assert (=> b!114997 (= lt!59865 (getCurrentListMap!483 (_keys!4415 (v!3000 (underlying!390 thiss!992))) (_values!2677 (v!3000 (underlying!390 thiss!992))) (mask!6895 (v!3000 (underlying!390 thiss!992))) (extraKeys!2483 (v!3000 (underlying!390 thiss!992))) (zeroValue!2561 (v!3000 (underlying!390 thiss!992))) (minValue!2561 (v!3000 (underlying!390 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2694 (v!3000 (underlying!390 thiss!992)))))))

(declare-fun mapIsEmpty!4180 () Bool)

(assert (=> mapIsEmpty!4180 mapRes!4179))

(assert (=> b!114998 (= e!74892 (and tp!10359 tp_is_empty!2749 (array_inv!1345 (_keys!4415 newMap!16)) (array_inv!1346 (_values!2677 newMap!16)) e!74902))))

(assert (= (and start!13132 res!56489) b!114985))

(assert (= (and b!114985 res!56490) b!114990))

(assert (= (and b!114990 res!56487) b!114986))

(assert (= (and b!114986 res!56488) b!114997))

(assert (= (and b!114994 condMapEmpty!4180) mapIsEmpty!4179))

(assert (= (and b!114994 (not condMapEmpty!4180)) mapNonEmpty!4179))

(get-info :version)

(assert (= (and mapNonEmpty!4179 ((_ is ValueCellFull!1031) mapValue!4180)) b!114992))

(assert (= (and b!114994 ((_ is ValueCellFull!1031) mapDefault!4179)) b!114996))

(assert (= b!114995 b!114994))

(assert (= b!114987 b!114995))

(assert (= b!114989 b!114987))

(assert (= start!13132 b!114989))

(assert (= (and b!114993 condMapEmpty!4179) mapIsEmpty!4180))

(assert (= (and b!114993 (not condMapEmpty!4179)) mapNonEmpty!4180))

(assert (= (and mapNonEmpty!4180 ((_ is ValueCellFull!1031) mapValue!4179)) b!114991))

(assert (= (and b!114993 ((_ is ValueCellFull!1031) mapDefault!4180)) b!114988))

(assert (= b!114998 b!114993))

(assert (= start!13132 b!114998))

(declare-fun m!131061 () Bool)

(assert (=> b!114990 m!131061))

(declare-fun m!131063 () Bool)

(assert (=> b!114995 m!131063))

(declare-fun m!131065 () Bool)

(assert (=> b!114995 m!131065))

(declare-fun m!131067 () Bool)

(assert (=> b!114998 m!131067))

(declare-fun m!131069 () Bool)

(assert (=> b!114998 m!131069))

(declare-fun m!131071 () Bool)

(assert (=> start!13132 m!131071))

(declare-fun m!131073 () Bool)

(assert (=> b!114997 m!131073))

(declare-fun m!131075 () Bool)

(assert (=> b!114997 m!131075))

(declare-fun m!131077 () Bool)

(assert (=> mapNonEmpty!4180 m!131077))

(declare-fun m!131079 () Bool)

(assert (=> mapNonEmpty!4179 m!131079))

(check-sat (not start!13132) b_and!7123 (not b!114990) (not b_next!2665) b_and!7121 (not mapNonEmpty!4180) (not b_next!2667) tp_is_empty!2749 (not b!114997) (not b!114998) (not b!114995) (not mapNonEmpty!4179))
(check-sat b_and!7121 b_and!7123 (not b_next!2665) (not b_next!2667))
