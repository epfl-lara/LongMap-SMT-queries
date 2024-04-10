; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13130 () Bool)

(assert start!13130)

(declare-fun b!115141 () Bool)

(declare-fun b_free!2669 () Bool)

(declare-fun b_next!2669 () Bool)

(assert (=> b!115141 (= b_free!2669 (not b_next!2669))))

(declare-fun tp!10370 () Bool)

(declare-fun b_and!7139 () Bool)

(assert (=> b!115141 (= tp!10370 b_and!7139)))

(declare-fun b!115138 () Bool)

(declare-fun b_free!2671 () Bool)

(declare-fun b_next!2671 () Bool)

(assert (=> b!115138 (= b_free!2671 (not b_next!2671))))

(declare-fun tp!10371 () Bool)

(declare-fun b_and!7141 () Bool)

(assert (=> b!115138 (= tp!10371 b_and!7141)))

(declare-fun b!115135 () Bool)

(declare-fun e!75009 () Bool)

(declare-fun e!75008 () Bool)

(declare-fun mapRes!4185 () Bool)

(assert (=> b!115135 (= e!75009 (and e!75008 mapRes!4185))))

(declare-fun condMapEmpty!4185 () Bool)

(declare-datatypes ((V!3315 0))(
  ( (V!3316 (val!1420 Int)) )
))
(declare-datatypes ((array!4505 0))(
  ( (array!4506 (arr!2135 (Array (_ BitVec 32) (_ BitVec 64))) (size!2395 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1032 0))(
  ( (ValueCellFull!1032 (v!3009 V!3315)) (EmptyCell!1032) )
))
(declare-datatypes ((array!4507 0))(
  ( (array!4508 (arr!2136 (Array (_ BitVec 32) ValueCell!1032)) (size!2396 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!972 0))(
  ( (LongMapFixedSize!973 (defaultEntry!2695 Int) (mask!6897 (_ BitVec 32)) (extraKeys!2484 (_ BitVec 32)) (zeroValue!2562 V!3315) (minValue!2562 V!3315) (_size!535 (_ BitVec 32)) (_keys!4417 array!4505) (_values!2678 array!4507) (_vacant!535 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!972)

(declare-fun mapDefault!4186 () ValueCell!1032)

(assert (=> b!115135 (= condMapEmpty!4185 (= (arr!2136 (_values!2678 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1032)) mapDefault!4186)))))

(declare-fun b!115136 () Bool)

(declare-fun res!56558 () Bool)

(declare-fun e!75007 () Bool)

(assert (=> b!115136 (=> (not res!56558) (not e!75007))))

(declare-fun valid!459 (LongMapFixedSize!972) Bool)

(assert (=> b!115136 (= res!56558 (valid!459 newMap!16))))

(declare-fun mapIsEmpty!4185 () Bool)

(declare-fun mapRes!4186 () Bool)

(assert (=> mapIsEmpty!4185 mapRes!4186))

(declare-fun b!115137 () Bool)

(assert (=> b!115137 (= e!75007 false)))

(declare-datatypes ((tuple2!2506 0))(
  ( (tuple2!2507 (_1!1264 (_ BitVec 64)) (_2!1264 V!3315)) )
))
(declare-datatypes ((List!1665 0))(
  ( (Nil!1662) (Cons!1661 (h!2261 tuple2!2506) (t!5919 List!1665)) )
))
(declare-datatypes ((ListLongMap!1629 0))(
  ( (ListLongMap!1630 (toList!830 List!1665)) )
))
(declare-fun lt!59970 () ListLongMap!1629)

(declare-fun map!1332 (LongMapFixedSize!972) ListLongMap!1629)

(assert (=> b!115137 (= lt!59970 (map!1332 newMap!16))))

(declare-fun lt!59969 () ListLongMap!1629)

(declare-datatypes ((Cell!772 0))(
  ( (Cell!773 (v!3010 LongMapFixedSize!972)) )
))
(declare-datatypes ((LongMap!772 0))(
  ( (LongMap!773 (underlying!397 Cell!772)) )
))
(declare-fun thiss!992 () LongMap!772)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!511 (array!4505 array!4507 (_ BitVec 32) (_ BitVec 32) V!3315 V!3315 (_ BitVec 32) Int) ListLongMap!1629)

(assert (=> b!115137 (= lt!59969 (getCurrentListMap!511 (_keys!4417 (v!3010 (underlying!397 thiss!992))) (_values!2678 (v!3010 (underlying!397 thiss!992))) (mask!6897 (v!3010 (underlying!397 thiss!992))) (extraKeys!2484 (v!3010 (underlying!397 thiss!992))) (zeroValue!2562 (v!3010 (underlying!397 thiss!992))) (minValue!2562 (v!3010 (underlying!397 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2695 (v!3010 (underlying!397 thiss!992)))))))

(declare-fun b!115139 () Bool)

(declare-fun res!56560 () Bool)

(assert (=> b!115139 (=> (not res!56560) (not e!75007))))

(assert (=> b!115139 (= res!56560 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2395 (_keys!4417 (v!3010 (underlying!397 thiss!992)))))))))

(declare-fun b!115140 () Bool)

(declare-fun e!75012 () Bool)

(declare-fun e!75003 () Bool)

(assert (=> b!115140 (= e!75012 e!75003)))

(declare-fun mapNonEmpty!4185 () Bool)

(declare-fun tp!10372 () Bool)

(declare-fun e!75014 () Bool)

(assert (=> mapNonEmpty!4185 (= mapRes!4185 (and tp!10372 e!75014))))

(declare-fun mapValue!4185 () ValueCell!1032)

(declare-fun mapRest!4185 () (Array (_ BitVec 32) ValueCell!1032))

(declare-fun mapKey!4185 () (_ BitVec 32))

(assert (=> mapNonEmpty!4185 (= (arr!2136 (_values!2678 newMap!16)) (store mapRest!4185 mapKey!4185 mapValue!4185))))

(declare-fun e!75011 () Bool)

(declare-fun e!75006 () Bool)

(declare-fun tp_is_empty!2751 () Bool)

(declare-fun array_inv!1341 (array!4505) Bool)

(declare-fun array_inv!1342 (array!4507) Bool)

(assert (=> b!115141 (= e!75011 (and tp!10370 tp_is_empty!2751 (array_inv!1341 (_keys!4417 (v!3010 (underlying!397 thiss!992)))) (array_inv!1342 (_values!2678 (v!3010 (underlying!397 thiss!992)))) e!75006))))

(declare-fun res!56557 () Bool)

(assert (=> start!13130 (=> (not res!56557) (not e!75007))))

(declare-fun valid!460 (LongMap!772) Bool)

(assert (=> start!13130 (= res!56557 (valid!460 thiss!992))))

(assert (=> start!13130 e!75007))

(assert (=> start!13130 e!75012))

(assert (=> start!13130 true))

(declare-fun e!75013 () Bool)

(assert (=> start!13130 e!75013))

(assert (=> b!115138 (= e!75013 (and tp!10371 tp_is_empty!2751 (array_inv!1341 (_keys!4417 newMap!16)) (array_inv!1342 (_values!2678 newMap!16)) e!75009))))

(declare-fun b!115142 () Bool)

(assert (=> b!115142 (= e!75008 tp_is_empty!2751)))

(declare-fun mapIsEmpty!4186 () Bool)

(assert (=> mapIsEmpty!4186 mapRes!4185))

(declare-fun b!115143 () Bool)

(assert (=> b!115143 (= e!75014 tp_is_empty!2751)))

(declare-fun b!115144 () Bool)

(assert (=> b!115144 (= e!75003 e!75011)))

(declare-fun b!115145 () Bool)

(declare-fun e!75010 () Bool)

(assert (=> b!115145 (= e!75010 tp_is_empty!2751)))

(declare-fun mapNonEmpty!4186 () Bool)

(declare-fun tp!10369 () Bool)

(assert (=> mapNonEmpty!4186 (= mapRes!4186 (and tp!10369 e!75010))))

(declare-fun mapValue!4186 () ValueCell!1032)

(declare-fun mapKey!4186 () (_ BitVec 32))

(declare-fun mapRest!4186 () (Array (_ BitVec 32) ValueCell!1032))

(assert (=> mapNonEmpty!4186 (= (arr!2136 (_values!2678 (v!3010 (underlying!397 thiss!992)))) (store mapRest!4186 mapKey!4186 mapValue!4186))))

(declare-fun b!115146 () Bool)

(declare-fun e!75005 () Bool)

(assert (=> b!115146 (= e!75006 (and e!75005 mapRes!4186))))

(declare-fun condMapEmpty!4186 () Bool)

(declare-fun mapDefault!4185 () ValueCell!1032)

(assert (=> b!115146 (= condMapEmpty!4186 (= (arr!2136 (_values!2678 (v!3010 (underlying!397 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1032)) mapDefault!4185)))))

(declare-fun b!115147 () Bool)

(declare-fun res!56559 () Bool)

(assert (=> b!115147 (=> (not res!56559) (not e!75007))))

(assert (=> b!115147 (= res!56559 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6897 newMap!16)) (_size!535 (v!3010 (underlying!397 thiss!992)))))))

(declare-fun b!115148 () Bool)

(assert (=> b!115148 (= e!75005 tp_is_empty!2751)))

(assert (= (and start!13130 res!56557) b!115139))

(assert (= (and b!115139 res!56560) b!115136))

(assert (= (and b!115136 res!56558) b!115147))

(assert (= (and b!115147 res!56559) b!115137))

(assert (= (and b!115146 condMapEmpty!4186) mapIsEmpty!4185))

(assert (= (and b!115146 (not condMapEmpty!4186)) mapNonEmpty!4186))

(get-info :version)

(assert (= (and mapNonEmpty!4186 ((_ is ValueCellFull!1032) mapValue!4186)) b!115145))

(assert (= (and b!115146 ((_ is ValueCellFull!1032) mapDefault!4185)) b!115148))

(assert (= b!115141 b!115146))

(assert (= b!115144 b!115141))

(assert (= b!115140 b!115144))

(assert (= start!13130 b!115140))

(assert (= (and b!115135 condMapEmpty!4185) mapIsEmpty!4186))

(assert (= (and b!115135 (not condMapEmpty!4185)) mapNonEmpty!4185))

(assert (= (and mapNonEmpty!4185 ((_ is ValueCellFull!1032) mapValue!4185)) b!115143))

(assert (= (and b!115135 ((_ is ValueCellFull!1032) mapDefault!4186)) b!115142))

(assert (= b!115138 b!115135))

(assert (= start!13130 b!115138))

(declare-fun m!131427 () Bool)

(assert (=> b!115141 m!131427))

(declare-fun m!131429 () Bool)

(assert (=> b!115141 m!131429))

(declare-fun m!131431 () Bool)

(assert (=> b!115138 m!131431))

(declare-fun m!131433 () Bool)

(assert (=> b!115138 m!131433))

(declare-fun m!131435 () Bool)

(assert (=> start!13130 m!131435))

(declare-fun m!131437 () Bool)

(assert (=> b!115137 m!131437))

(declare-fun m!131439 () Bool)

(assert (=> b!115137 m!131439))

(declare-fun m!131441 () Bool)

(assert (=> b!115136 m!131441))

(declare-fun m!131443 () Bool)

(assert (=> mapNonEmpty!4185 m!131443))

(declare-fun m!131445 () Bool)

(assert (=> mapNonEmpty!4186 m!131445))

(check-sat b_and!7139 (not b!115138) (not mapNonEmpty!4185) (not start!13130) (not b!115137) tp_is_empty!2751 (not b!115141) (not mapNonEmpty!4186) (not b!115136) (not b_next!2671) b_and!7141 (not b_next!2669))
(check-sat b_and!7139 b_and!7141 (not b_next!2669) (not b_next!2671))
