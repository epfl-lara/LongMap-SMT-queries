; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13200 () Bool)

(assert start!13200)

(declare-fun b!115997 () Bool)

(declare-fun b_free!2725 () Bool)

(declare-fun b_next!2725 () Bool)

(assert (=> b!115997 (= b_free!2725 (not b_next!2725))))

(declare-fun tp!10543 () Bool)

(declare-fun b_and!7217 () Bool)

(assert (=> b!115997 (= tp!10543 b_and!7217)))

(declare-fun b!115985 () Bool)

(declare-fun b_free!2727 () Bool)

(declare-fun b_next!2727 () Bool)

(assert (=> b!115985 (= b_free!2727 (not b_next!2727))))

(declare-fun tp!10546 () Bool)

(declare-fun b_and!7219 () Bool)

(assert (=> b!115985 (= tp!10546 b_and!7219)))

(declare-fun res!56869 () Bool)

(declare-fun e!75710 () Bool)

(assert (=> start!13200 (=> (not res!56869) (not e!75710))))

(declare-datatypes ((V!3353 0))(
  ( (V!3354 (val!1434 Int)) )
))
(declare-datatypes ((array!4549 0))(
  ( (array!4550 (arr!2156 (Array (_ BitVec 32) (_ BitVec 64))) (size!2417 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1046 0))(
  ( (ValueCellFull!1046 (v!3039 V!3353)) (EmptyCell!1046) )
))
(declare-datatypes ((array!4551 0))(
  ( (array!4552 (arr!2157 (Array (_ BitVec 32) ValueCell!1046)) (size!2418 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1000 0))(
  ( (LongMapFixedSize!1001 (defaultEntry!2711 Int) (mask!6925 (_ BitVec 32)) (extraKeys!2500 (_ BitVec 32)) (zeroValue!2578 V!3353) (minValue!2578 V!3353) (_size!549 (_ BitVec 32)) (_keys!4434 array!4549) (_values!2694 array!4551) (_vacant!549 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!800 0))(
  ( (Cell!801 (v!3040 LongMapFixedSize!1000)) )
))
(declare-datatypes ((LongMap!800 0))(
  ( (LongMap!801 (underlying!411 Cell!800)) )
))
(declare-fun thiss!992 () LongMap!800)

(declare-fun valid!481 (LongMap!800) Bool)

(assert (=> start!13200 (= res!56869 (valid!481 thiss!992))))

(assert (=> start!13200 e!75710))

(declare-fun e!75708 () Bool)

(assert (=> start!13200 e!75708))

(assert (=> start!13200 true))

(declare-fun e!75703 () Bool)

(assert (=> start!13200 e!75703))

(declare-fun b!115983 () Bool)

(declare-fun res!56866 () Bool)

(assert (=> b!115983 (=> (not res!56866) (not e!75710))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!115983 (= res!56866 (and (or (= (select (arr!2156 (_keys!4434 (v!3040 (underlying!411 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2156 (_keys!4434 (v!3040 (underlying!411 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun b!115984 () Bool)

(declare-fun res!56865 () Bool)

(assert (=> b!115984 (=> (not res!56865) (not e!75710))))

(declare-fun newMap!16 () LongMapFixedSize!1000)

(declare-datatypes ((tuple2!2474 0))(
  ( (tuple2!2475 (_1!1248 (_ BitVec 64)) (_2!1248 V!3353)) )
))
(declare-datatypes ((List!1654 0))(
  ( (Nil!1651) (Cons!1650 (h!2250 tuple2!2474) (t!5912 List!1654)) )
))
(declare-datatypes ((ListLongMap!1601 0))(
  ( (ListLongMap!1602 (toList!816 List!1654)) )
))
(declare-fun getCurrentListMap!497 (array!4549 array!4551 (_ BitVec 32) (_ BitVec 32) V!3353 V!3353 (_ BitVec 32) Int) ListLongMap!1601)

(declare-fun map!1345 (LongMapFixedSize!1000) ListLongMap!1601)

(assert (=> b!115984 (= res!56865 (= (getCurrentListMap!497 (_keys!4434 (v!3040 (underlying!411 thiss!992))) (_values!2694 (v!3040 (underlying!411 thiss!992))) (mask!6925 (v!3040 (underlying!411 thiss!992))) (extraKeys!2500 (v!3040 (underlying!411 thiss!992))) (zeroValue!2578 (v!3040 (underlying!411 thiss!992))) (minValue!2578 (v!3040 (underlying!411 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2711 (v!3040 (underlying!411 thiss!992)))) (map!1345 newMap!16)))))

(declare-fun e!75705 () Bool)

(declare-fun tp_is_empty!2779 () Bool)

(declare-fun array_inv!1347 (array!4549) Bool)

(declare-fun array_inv!1348 (array!4551) Bool)

(assert (=> b!115985 (= e!75703 (and tp!10546 tp_is_empty!2779 (array_inv!1347 (_keys!4434 newMap!16)) (array_inv!1348 (_values!2694 newMap!16)) e!75705))))

(declare-fun b!115986 () Bool)

(declare-fun e!75712 () Bool)

(declare-fun e!75700 () Bool)

(declare-fun mapRes!4275 () Bool)

(assert (=> b!115986 (= e!75712 (and e!75700 mapRes!4275))))

(declare-fun condMapEmpty!4276 () Bool)

(declare-fun mapDefault!4275 () ValueCell!1046)

(assert (=> b!115986 (= condMapEmpty!4276 (= (arr!2157 (_values!2694 (v!3040 (underlying!411 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1046)) mapDefault!4275)))))

(declare-fun b!115987 () Bool)

(declare-fun e!75709 () Bool)

(assert (=> b!115987 (= e!75709 false)))

(declare-fun lt!60237 () Bool)

(declare-datatypes ((tuple2!2476 0))(
  ( (tuple2!2477 (_1!1249 Bool) (_2!1249 LongMapFixedSize!1000)) )
))
(declare-fun lt!60236 () tuple2!2476)

(declare-fun valid!482 (LongMapFixedSize!1000) Bool)

(assert (=> b!115987 (= lt!60237 (valid!482 (_2!1249 lt!60236)))))

(declare-fun b!115988 () Bool)

(declare-fun res!56864 () Bool)

(assert (=> b!115988 (=> (not res!56864) (not e!75710))))

(assert (=> b!115988 (= res!56864 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6925 newMap!16)) (_size!549 (v!3040 (underlying!411 thiss!992)))))))

(declare-fun b!115989 () Bool)

(assert (=> b!115989 (= e!75710 e!75709)))

(declare-fun res!56863 () Bool)

(assert (=> b!115989 (=> (not res!56863) (not e!75709))))

(assert (=> b!115989 (= res!56863 (_1!1249 lt!60236))))

(declare-fun repackFrom!12 (LongMap!800 LongMapFixedSize!1000 (_ BitVec 32)) tuple2!2476)

(assert (=> b!115989 (= lt!60236 (repackFrom!12 thiss!992 newMap!16 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!4275 () Bool)

(assert (=> mapIsEmpty!4275 mapRes!4275))

(declare-fun b!115990 () Bool)

(declare-fun e!75706 () Bool)

(assert (=> b!115990 (= e!75706 tp_is_empty!2779)))

(declare-fun b!115991 () Bool)

(assert (=> b!115991 (= e!75700 tp_is_empty!2779)))

(declare-fun b!115992 () Bool)

(declare-fun e!75704 () Bool)

(declare-fun mapRes!4276 () Bool)

(assert (=> b!115992 (= e!75705 (and e!75704 mapRes!4276))))

(declare-fun condMapEmpty!4275 () Bool)

(declare-fun mapDefault!4276 () ValueCell!1046)

(assert (=> b!115992 (= condMapEmpty!4275 (= (arr!2157 (_values!2694 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1046)) mapDefault!4276)))))

(declare-fun b!115993 () Bool)

(declare-fun e!75711 () Bool)

(assert (=> b!115993 (= e!75708 e!75711)))

(declare-fun mapNonEmpty!4275 () Bool)

(declare-fun tp!10544 () Bool)

(declare-fun e!75702 () Bool)

(assert (=> mapNonEmpty!4275 (= mapRes!4276 (and tp!10544 e!75702))))

(declare-fun mapRest!4275 () (Array (_ BitVec 32) ValueCell!1046))

(declare-fun mapKey!4275 () (_ BitVec 32))

(declare-fun mapValue!4276 () ValueCell!1046)

(assert (=> mapNonEmpty!4275 (= (arr!2157 (_values!2694 newMap!16)) (store mapRest!4275 mapKey!4275 mapValue!4276))))

(declare-fun b!115994 () Bool)

(declare-fun e!75699 () Bool)

(assert (=> b!115994 (= e!75711 e!75699)))

(declare-fun b!115995 () Bool)

(declare-fun res!56867 () Bool)

(assert (=> b!115995 (=> (not res!56867) (not e!75710))))

(assert (=> b!115995 (= res!56867 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2417 (_keys!4434 (v!3040 (underlying!411 thiss!992)))))))))

(declare-fun b!115996 () Bool)

(assert (=> b!115996 (= e!75704 tp_is_empty!2779)))

(declare-fun mapIsEmpty!4276 () Bool)

(assert (=> mapIsEmpty!4276 mapRes!4276))

(assert (=> b!115997 (= e!75699 (and tp!10543 tp_is_empty!2779 (array_inv!1347 (_keys!4434 (v!3040 (underlying!411 thiss!992)))) (array_inv!1348 (_values!2694 (v!3040 (underlying!411 thiss!992)))) e!75712))))

(declare-fun b!115998 () Bool)

(assert (=> b!115998 (= e!75702 tp_is_empty!2779)))

(declare-fun b!115999 () Bool)

(declare-fun res!56868 () Bool)

(assert (=> b!115999 (=> (not res!56868) (not e!75710))))

(assert (=> b!115999 (= res!56868 (valid!482 newMap!16))))

(declare-fun mapNonEmpty!4276 () Bool)

(declare-fun tp!10545 () Bool)

(assert (=> mapNonEmpty!4276 (= mapRes!4275 (and tp!10545 e!75706))))

(declare-fun mapRest!4276 () (Array (_ BitVec 32) ValueCell!1046))

(declare-fun mapKey!4276 () (_ BitVec 32))

(declare-fun mapValue!4275 () ValueCell!1046)

(assert (=> mapNonEmpty!4276 (= (arr!2157 (_values!2694 (v!3040 (underlying!411 thiss!992)))) (store mapRest!4276 mapKey!4276 mapValue!4275))))

(assert (= (and start!13200 res!56869) b!115995))

(assert (= (and b!115995 res!56867) b!115999))

(assert (= (and b!115999 res!56868) b!115988))

(assert (= (and b!115988 res!56864) b!115984))

(assert (= (and b!115984 res!56865) b!115983))

(assert (= (and b!115983 res!56866) b!115989))

(assert (= (and b!115989 res!56863) b!115987))

(assert (= (and b!115986 condMapEmpty!4276) mapIsEmpty!4275))

(assert (= (and b!115986 (not condMapEmpty!4276)) mapNonEmpty!4276))

(get-info :version)

(assert (= (and mapNonEmpty!4276 ((_ is ValueCellFull!1046) mapValue!4275)) b!115990))

(assert (= (and b!115986 ((_ is ValueCellFull!1046) mapDefault!4275)) b!115991))

(assert (= b!115997 b!115986))

(assert (= b!115994 b!115997))

(assert (= b!115993 b!115994))

(assert (= start!13200 b!115993))

(assert (= (and b!115992 condMapEmpty!4275) mapIsEmpty!4276))

(assert (= (and b!115992 (not condMapEmpty!4275)) mapNonEmpty!4275))

(assert (= (and mapNonEmpty!4275 ((_ is ValueCellFull!1046) mapValue!4276)) b!115998))

(assert (= (and b!115992 ((_ is ValueCellFull!1046) mapDefault!4276)) b!115996))

(assert (= b!115985 b!115992))

(assert (= start!13200 b!115985))

(declare-fun m!132109 () Bool)

(assert (=> b!115983 m!132109))

(declare-fun m!132111 () Bool)

(assert (=> mapNonEmpty!4275 m!132111))

(declare-fun m!132113 () Bool)

(assert (=> b!115985 m!132113))

(declare-fun m!132115 () Bool)

(assert (=> b!115985 m!132115))

(declare-fun m!132117 () Bool)

(assert (=> b!115987 m!132117))

(declare-fun m!132119 () Bool)

(assert (=> b!115999 m!132119))

(declare-fun m!132121 () Bool)

(assert (=> b!115997 m!132121))

(declare-fun m!132123 () Bool)

(assert (=> b!115997 m!132123))

(declare-fun m!132125 () Bool)

(assert (=> start!13200 m!132125))

(declare-fun m!132127 () Bool)

(assert (=> mapNonEmpty!4276 m!132127))

(declare-fun m!132129 () Bool)

(assert (=> b!115984 m!132129))

(declare-fun m!132131 () Bool)

(assert (=> b!115984 m!132131))

(declare-fun m!132133 () Bool)

(assert (=> b!115989 m!132133))

(check-sat (not b!115987) (not mapNonEmpty!4275) (not b!115997) b_and!7217 (not b_next!2725) (not b!115989) (not b!115999) (not b!115984) (not start!13200) (not b_next!2727) b_and!7219 tp_is_empty!2779 (not mapNonEmpty!4276) (not b!115985))
(check-sat b_and!7217 b_and!7219 (not b_next!2725) (not b_next!2727))
