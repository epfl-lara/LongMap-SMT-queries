; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13138 () Bool)

(assert start!13138)

(declare-fun b!115116 () Bool)

(declare-fun b_free!2677 () Bool)

(declare-fun b_next!2677 () Bool)

(assert (=> b!115116 (= b_free!2677 (not b_next!2677))))

(declare-fun tp!10396 () Bool)

(declare-fun b_and!7133 () Bool)

(assert (=> b!115116 (= tp!10396 b_and!7133)))

(declare-fun b!115119 () Bool)

(declare-fun b_free!2679 () Bool)

(declare-fun b_next!2679 () Bool)

(assert (=> b!115119 (= b_free!2679 (not b_next!2679))))

(declare-fun tp!10394 () Bool)

(declare-fun b_and!7135 () Bool)

(assert (=> b!115119 (= tp!10394 b_and!7135)))

(declare-fun mapIsEmpty!4197 () Bool)

(declare-fun mapRes!4197 () Bool)

(assert (=> mapIsEmpty!4197 mapRes!4197))

(declare-fun b!115114 () Bool)

(declare-fun res!56529 () Bool)

(declare-fun e!75021 () Bool)

(assert (=> b!115114 (=> (not res!56529) (not e!75021))))

(declare-datatypes ((V!3321 0))(
  ( (V!3322 (val!1422 Int)) )
))
(declare-datatypes ((array!4493 0))(
  ( (array!4494 (arr!2128 (Array (_ BitVec 32) (_ BitVec 64))) (size!2389 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1034 0))(
  ( (ValueCellFull!1034 (v!3005 V!3321)) (EmptyCell!1034) )
))
(declare-datatypes ((array!4495 0))(
  ( (array!4496 (arr!2129 (Array (_ BitVec 32) ValueCell!1034)) (size!2390 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!976 0))(
  ( (LongMapFixedSize!977 (defaultEntry!2697 Int) (mask!6900 (_ BitVec 32)) (extraKeys!2486 (_ BitVec 32)) (zeroValue!2564 V!3321) (minValue!2564 V!3321) (_size!537 (_ BitVec 32)) (_keys!4418 array!4493) (_values!2680 array!4495) (_vacant!537 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!764 0))(
  ( (Cell!765 (v!3006 LongMapFixedSize!976)) )
))
(declare-datatypes ((LongMap!764 0))(
  ( (LongMap!765 (underlying!393 Cell!764)) )
))
(declare-fun thiss!992 () LongMap!764)

(declare-fun newMap!16 () LongMapFixedSize!976)

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2474 0))(
  ( (tuple2!2475 (_1!1248 (_ BitVec 64)) (_2!1248 V!3321)) )
))
(declare-datatypes ((List!1661 0))(
  ( (Nil!1658) (Cons!1657 (h!2257 tuple2!2474) (t!5910 List!1661)) )
))
(declare-datatypes ((ListLongMap!1599 0))(
  ( (ListLongMap!1600 (toList!815 List!1661)) )
))
(declare-fun getCurrentListMap!486 (array!4493 array!4495 (_ BitVec 32) (_ BitVec 32) V!3321 V!3321 (_ BitVec 32) Int) ListLongMap!1599)

(declare-fun map!1318 (LongMapFixedSize!976) ListLongMap!1599)

(assert (=> b!115114 (= res!56529 (= (getCurrentListMap!486 (_keys!4418 (v!3006 (underlying!393 thiss!992))) (_values!2680 (v!3006 (underlying!393 thiss!992))) (mask!6900 (v!3006 (underlying!393 thiss!992))) (extraKeys!2486 (v!3006 (underlying!393 thiss!992))) (zeroValue!2564 (v!3006 (underlying!393 thiss!992))) (minValue!2564 (v!3006 (underlying!393 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2697 (v!3006 (underlying!393 thiss!992)))) (map!1318 newMap!16)))))

(declare-fun b!115115 () Bool)

(declare-fun e!75018 () Bool)

(declare-fun e!75016 () Bool)

(assert (=> b!115115 (= e!75018 (and e!75016 mapRes!4197))))

(declare-fun condMapEmpty!4197 () Bool)

(declare-fun mapDefault!4197 () ValueCell!1034)

(assert (=> b!115115 (= condMapEmpty!4197 (= (arr!2129 (_values!2680 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1034)) mapDefault!4197)))))

(declare-fun e!75015 () Bool)

(declare-fun e!75009 () Bool)

(declare-fun tp_is_empty!2755 () Bool)

(declare-fun array_inv!1349 (array!4493) Bool)

(declare-fun array_inv!1350 (array!4495) Bool)

(assert (=> b!115116 (= e!75009 (and tp!10396 tp_is_empty!2755 (array_inv!1349 (_keys!4418 (v!3006 (underlying!393 thiss!992)))) (array_inv!1350 (_values!2680 (v!3006 (underlying!393 thiss!992)))) e!75015))))

(declare-fun b!115117 () Bool)

(declare-fun res!56525 () Bool)

(assert (=> b!115117 (=> (not res!56525) (not e!75021))))

(declare-fun valid!464 (LongMapFixedSize!976) Bool)

(assert (=> b!115117 (= res!56525 (valid!464 newMap!16))))

(declare-fun b!115118 () Bool)

(declare-fun e!75020 () Bool)

(assert (=> b!115118 (= e!75020 tp_is_empty!2755)))

(declare-fun e!75012 () Bool)

(assert (=> b!115119 (= e!75012 (and tp!10394 tp_is_empty!2755 (array_inv!1349 (_keys!4418 newMap!16)) (array_inv!1350 (_values!2680 newMap!16)) e!75018))))

(declare-fun mapIsEmpty!4198 () Bool)

(declare-fun mapRes!4198 () Bool)

(assert (=> mapIsEmpty!4198 mapRes!4198))

(declare-fun b!115120 () Bool)

(declare-fun e!75014 () Bool)

(assert (=> b!115120 (= e!75014 tp_is_empty!2755)))

(declare-fun res!56527 () Bool)

(assert (=> start!13138 (=> (not res!56527) (not e!75021))))

(declare-fun valid!465 (LongMap!764) Bool)

(assert (=> start!13138 (= res!56527 (valid!465 thiss!992))))

(assert (=> start!13138 e!75021))

(declare-fun e!75017 () Bool)

(assert (=> start!13138 e!75017))

(assert (=> start!13138 true))

(assert (=> start!13138 e!75012))

(declare-fun b!115113 () Bool)

(declare-fun e!75019 () Bool)

(assert (=> b!115113 (= e!75017 e!75019)))

(declare-fun b!115121 () Bool)

(assert (=> b!115121 (= e!75016 tp_is_empty!2755)))

(declare-fun mapNonEmpty!4197 () Bool)

(declare-fun tp!10395 () Bool)

(assert (=> mapNonEmpty!4197 (= mapRes!4198 (and tp!10395 e!75020))))

(declare-fun mapRest!4197 () (Array (_ BitVec 32) ValueCell!1034))

(declare-fun mapValue!4198 () ValueCell!1034)

(declare-fun mapKey!4197 () (_ BitVec 32))

(assert (=> mapNonEmpty!4197 (= (arr!2129 (_values!2680 (v!3006 (underlying!393 thiss!992)))) (store mapRest!4197 mapKey!4197 mapValue!4198))))

(declare-fun b!115122 () Bool)

(assert (=> b!115122 (= e!75019 e!75009)))

(declare-fun b!115123 () Bool)

(declare-fun e!75011 () Bool)

(assert (=> b!115123 (= e!75015 (and e!75011 mapRes!4198))))

(declare-fun condMapEmpty!4198 () Bool)

(declare-fun mapDefault!4198 () ValueCell!1034)

(assert (=> b!115123 (= condMapEmpty!4198 (= (arr!2129 (_values!2680 (v!3006 (underlying!393 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1034)) mapDefault!4198)))))

(declare-fun b!115124 () Bool)

(assert (=> b!115124 (= e!75011 tp_is_empty!2755)))

(declare-fun b!115125 () Bool)

(declare-fun res!56526 () Bool)

(assert (=> b!115125 (=> (not res!56526) (not e!75021))))

(assert (=> b!115125 (= res!56526 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2389 (_keys!4418 (v!3006 (underlying!393 thiss!992)))))))))

(declare-fun b!115126 () Bool)

(declare-fun res!56528 () Bool)

(assert (=> b!115126 (=> (not res!56528) (not e!75021))))

(assert (=> b!115126 (= res!56528 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6900 newMap!16)) (_size!537 (v!3006 (underlying!393 thiss!992)))))))

(declare-fun mapNonEmpty!4198 () Bool)

(declare-fun tp!10393 () Bool)

(assert (=> mapNonEmpty!4198 (= mapRes!4197 (and tp!10393 e!75014))))

(declare-fun mapRest!4198 () (Array (_ BitVec 32) ValueCell!1034))

(declare-fun mapKey!4198 () (_ BitVec 32))

(declare-fun mapValue!4197 () ValueCell!1034)

(assert (=> mapNonEmpty!4198 (= (arr!2129 (_values!2680 newMap!16)) (store mapRest!4198 mapKey!4198 mapValue!4197))))

(declare-fun b!115127 () Bool)

(assert (=> b!115127 (= e!75021 (and (or (= (select (arr!2128 (_keys!4418 (v!3006 (underlying!393 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2128 (_keys!4418 (v!3006 (underlying!393 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!355 #b00000000000000000000000000000000) (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2389 (_keys!4418 (v!3006 (underlying!393 thiss!992)))))))))

(assert (= (and start!13138 res!56527) b!115125))

(assert (= (and b!115125 res!56526) b!115117))

(assert (= (and b!115117 res!56525) b!115126))

(assert (= (and b!115126 res!56528) b!115114))

(assert (= (and b!115114 res!56529) b!115127))

(assert (= (and b!115123 condMapEmpty!4198) mapIsEmpty!4198))

(assert (= (and b!115123 (not condMapEmpty!4198)) mapNonEmpty!4197))

(get-info :version)

(assert (= (and mapNonEmpty!4197 ((_ is ValueCellFull!1034) mapValue!4198)) b!115118))

(assert (= (and b!115123 ((_ is ValueCellFull!1034) mapDefault!4198)) b!115124))

(assert (= b!115116 b!115123))

(assert (= b!115122 b!115116))

(assert (= b!115113 b!115122))

(assert (= start!13138 b!115113))

(assert (= (and b!115115 condMapEmpty!4197) mapIsEmpty!4197))

(assert (= (and b!115115 (not condMapEmpty!4197)) mapNonEmpty!4198))

(assert (= (and mapNonEmpty!4198 ((_ is ValueCellFull!1034) mapValue!4197)) b!115120))

(assert (= (and b!115115 ((_ is ValueCellFull!1034) mapDefault!4197)) b!115121))

(assert (= b!115119 b!115115))

(assert (= start!13138 b!115119))

(declare-fun m!131121 () Bool)

(assert (=> start!13138 m!131121))

(declare-fun m!131123 () Bool)

(assert (=> b!115116 m!131123))

(declare-fun m!131125 () Bool)

(assert (=> b!115116 m!131125))

(declare-fun m!131127 () Bool)

(assert (=> b!115119 m!131127))

(declare-fun m!131129 () Bool)

(assert (=> b!115119 m!131129))

(declare-fun m!131131 () Bool)

(assert (=> b!115127 m!131131))

(declare-fun m!131133 () Bool)

(assert (=> mapNonEmpty!4197 m!131133))

(declare-fun m!131135 () Bool)

(assert (=> mapNonEmpty!4198 m!131135))

(declare-fun m!131137 () Bool)

(assert (=> b!115117 m!131137))

(declare-fun m!131139 () Bool)

(assert (=> b!115114 m!131139))

(declare-fun m!131141 () Bool)

(assert (=> b!115114 m!131141))

(check-sat (not mapNonEmpty!4198) b_and!7135 (not start!13138) (not b_next!2677) (not mapNonEmpty!4197) (not b!115114) (not b!115117) (not b_next!2679) (not b!115116) b_and!7133 tp_is_empty!2755 (not b!115119))
(check-sat b_and!7133 b_and!7135 (not b_next!2677) (not b_next!2679))
