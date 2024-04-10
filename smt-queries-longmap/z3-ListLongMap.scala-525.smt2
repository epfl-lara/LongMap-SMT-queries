; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13142 () Bool)

(assert start!13142)

(declare-fun b!115400 () Bool)

(declare-fun b_free!2693 () Bool)

(declare-fun b_next!2693 () Bool)

(assert (=> b!115400 (= b_free!2693 (not b_next!2693))))

(declare-fun tp!10441 () Bool)

(declare-fun b_and!7163 () Bool)

(assert (=> b!115400 (= tp!10441 b_and!7163)))

(declare-fun b!115408 () Bool)

(declare-fun b_free!2695 () Bool)

(declare-fun b_next!2695 () Bool)

(assert (=> b!115408 (= b_free!2695 (not b_next!2695))))

(declare-fun tp!10444 () Bool)

(declare-fun b_and!7165 () Bool)

(assert (=> b!115408 (= tp!10444 b_and!7165)))

(declare-fun b!115396 () Bool)

(declare-fun e!75248 () Bool)

(declare-fun e!75245 () Bool)

(assert (=> b!115396 (= e!75248 e!75245)))

(declare-fun b!115397 () Bool)

(declare-fun e!75239 () Bool)

(assert (=> b!115397 (= e!75239 false)))

(declare-datatypes ((V!3331 0))(
  ( (V!3332 (val!1426 Int)) )
))
(declare-datatypes ((tuple2!2516 0))(
  ( (tuple2!2517 (_1!1269 (_ BitVec 64)) (_2!1269 V!3331)) )
))
(declare-datatypes ((List!1670 0))(
  ( (Nil!1667) (Cons!1666 (h!2266 tuple2!2516) (t!5924 List!1670)) )
))
(declare-datatypes ((ListLongMap!1639 0))(
  ( (ListLongMap!1640 (toList!835 List!1670)) )
))
(declare-fun lt!59988 () ListLongMap!1639)

(declare-datatypes ((array!4529 0))(
  ( (array!4530 (arr!2147 (Array (_ BitVec 32) (_ BitVec 64))) (size!2407 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1038 0))(
  ( (ValueCellFull!1038 (v!3021 V!3331)) (EmptyCell!1038) )
))
(declare-datatypes ((array!4531 0))(
  ( (array!4532 (arr!2148 (Array (_ BitVec 32) ValueCell!1038)) (size!2408 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!984 0))(
  ( (LongMapFixedSize!985 (defaultEntry!2701 Int) (mask!6907 (_ BitVec 32)) (extraKeys!2490 (_ BitVec 32)) (zeroValue!2568 V!3331) (minValue!2568 V!3331) (_size!541 (_ BitVec 32)) (_keys!4423 array!4529) (_values!2684 array!4531) (_vacant!541 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!984)

(declare-fun map!1341 (LongMapFixedSize!984) ListLongMap!1639)

(assert (=> b!115397 (= lt!59988 (map!1341 newMap!16))))

(declare-fun lt!59987 () ListLongMap!1639)

(declare-datatypes ((Cell!784 0))(
  ( (Cell!785 (v!3022 LongMapFixedSize!984)) )
))
(declare-datatypes ((LongMap!784 0))(
  ( (LongMap!785 (underlying!403 Cell!784)) )
))
(declare-fun thiss!992 () LongMap!784)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!516 (array!4529 array!4531 (_ BitVec 32) (_ BitVec 32) V!3331 V!3331 (_ BitVec 32) Int) ListLongMap!1639)

(assert (=> b!115397 (= lt!59987 (getCurrentListMap!516 (_keys!4423 (v!3022 (underlying!403 thiss!992))) (_values!2684 (v!3022 (underlying!403 thiss!992))) (mask!6907 (v!3022 (underlying!403 thiss!992))) (extraKeys!2490 (v!3022 (underlying!403 thiss!992))) (zeroValue!2568 (v!3022 (underlying!403 thiss!992))) (minValue!2568 (v!3022 (underlying!403 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2701 (v!3022 (underlying!403 thiss!992)))))))

(declare-fun b!115398 () Bool)

(declare-fun res!56640 () Bool)

(assert (=> b!115398 (=> (not res!56640) (not e!75239))))

(assert (=> b!115398 (= res!56640 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6907 newMap!16)) (_size!541 (v!3022 (underlying!403 thiss!992)))))))

(declare-fun b!115399 () Bool)

(declare-fun e!75247 () Bool)

(declare-fun tp_is_empty!2763 () Bool)

(assert (=> b!115399 (= e!75247 tp_is_empty!2763)))

(declare-fun e!75243 () Bool)

(declare-fun e!75240 () Bool)

(declare-fun array_inv!1351 (array!4529) Bool)

(declare-fun array_inv!1352 (array!4531) Bool)

(assert (=> b!115400 (= e!75240 (and tp!10441 tp_is_empty!2763 (array_inv!1351 (_keys!4423 (v!3022 (underlying!403 thiss!992)))) (array_inv!1352 (_values!2684 (v!3022 (underlying!403 thiss!992)))) e!75243))))

(declare-fun b!115401 () Bool)

(declare-fun e!75249 () Bool)

(declare-fun e!75241 () Bool)

(declare-fun mapRes!4221 () Bool)

(assert (=> b!115401 (= e!75249 (and e!75241 mapRes!4221))))

(declare-fun condMapEmpty!4221 () Bool)

(declare-fun mapDefault!4221 () ValueCell!1038)

(assert (=> b!115401 (= condMapEmpty!4221 (= (arr!2148 (_values!2684 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1038)) mapDefault!4221)))))

(declare-fun mapNonEmpty!4221 () Bool)

(declare-fun tp!10442 () Bool)

(declare-fun e!75244 () Bool)

(assert (=> mapNonEmpty!4221 (= mapRes!4221 (and tp!10442 e!75244))))

(declare-fun mapValue!4221 () ValueCell!1038)

(declare-fun mapRest!4222 () (Array (_ BitVec 32) ValueCell!1038))

(declare-fun mapKey!4222 () (_ BitVec 32))

(assert (=> mapNonEmpty!4221 (= (arr!2148 (_values!2684 newMap!16)) (store mapRest!4222 mapKey!4222 mapValue!4221))))

(declare-fun mapIsEmpty!4221 () Bool)

(declare-fun mapRes!4222 () Bool)

(assert (=> mapIsEmpty!4221 mapRes!4222))

(declare-fun b!115402 () Bool)

(assert (=> b!115402 (= e!75244 tp_is_empty!2763)))

(declare-fun b!115403 () Bool)

(declare-fun e!75237 () Bool)

(assert (=> b!115403 (= e!75243 (and e!75237 mapRes!4222))))

(declare-fun condMapEmpty!4222 () Bool)

(declare-fun mapDefault!4222 () ValueCell!1038)

(assert (=> b!115403 (= condMapEmpty!4222 (= (arr!2148 (_values!2684 (v!3022 (underlying!403 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1038)) mapDefault!4222)))))

(declare-fun b!115404 () Bool)

(assert (=> b!115404 (= e!75237 tp_is_empty!2763)))

(declare-fun mapIsEmpty!4222 () Bool)

(assert (=> mapIsEmpty!4222 mapRes!4221))

(declare-fun b!115406 () Bool)

(assert (=> b!115406 (= e!75241 tp_is_empty!2763)))

(declare-fun b!115407 () Bool)

(declare-fun res!56639 () Bool)

(assert (=> b!115407 (=> (not res!56639) (not e!75239))))

(assert (=> b!115407 (= res!56639 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2407 (_keys!4423 (v!3022 (underlying!403 thiss!992)))))))))

(declare-fun e!75238 () Bool)

(assert (=> b!115408 (= e!75238 (and tp!10444 tp_is_empty!2763 (array_inv!1351 (_keys!4423 newMap!16)) (array_inv!1352 (_values!2684 newMap!16)) e!75249))))

(declare-fun mapNonEmpty!4222 () Bool)

(declare-fun tp!10443 () Bool)

(assert (=> mapNonEmpty!4222 (= mapRes!4222 (and tp!10443 e!75247))))

(declare-fun mapValue!4222 () ValueCell!1038)

(declare-fun mapRest!4221 () (Array (_ BitVec 32) ValueCell!1038))

(declare-fun mapKey!4221 () (_ BitVec 32))

(assert (=> mapNonEmpty!4222 (= (arr!2148 (_values!2684 (v!3022 (underlying!403 thiss!992)))) (store mapRest!4221 mapKey!4221 mapValue!4222))))

(declare-fun b!115409 () Bool)

(assert (=> b!115409 (= e!75245 e!75240)))

(declare-fun res!56641 () Bool)

(assert (=> start!13142 (=> (not res!56641) (not e!75239))))

(declare-fun valid!465 (LongMap!784) Bool)

(assert (=> start!13142 (= res!56641 (valid!465 thiss!992))))

(assert (=> start!13142 e!75239))

(assert (=> start!13142 e!75248))

(assert (=> start!13142 true))

(assert (=> start!13142 e!75238))

(declare-fun b!115405 () Bool)

(declare-fun res!56638 () Bool)

(assert (=> b!115405 (=> (not res!56638) (not e!75239))))

(declare-fun valid!466 (LongMapFixedSize!984) Bool)

(assert (=> b!115405 (= res!56638 (valid!466 newMap!16))))

(assert (= (and start!13142 res!56641) b!115407))

(assert (= (and b!115407 res!56639) b!115405))

(assert (= (and b!115405 res!56638) b!115398))

(assert (= (and b!115398 res!56640) b!115397))

(assert (= (and b!115403 condMapEmpty!4222) mapIsEmpty!4221))

(assert (= (and b!115403 (not condMapEmpty!4222)) mapNonEmpty!4222))

(get-info :version)

(assert (= (and mapNonEmpty!4222 ((_ is ValueCellFull!1038) mapValue!4222)) b!115399))

(assert (= (and b!115403 ((_ is ValueCellFull!1038) mapDefault!4222)) b!115404))

(assert (= b!115400 b!115403))

(assert (= b!115409 b!115400))

(assert (= b!115396 b!115409))

(assert (= start!13142 b!115396))

(assert (= (and b!115401 condMapEmpty!4221) mapIsEmpty!4222))

(assert (= (and b!115401 (not condMapEmpty!4221)) mapNonEmpty!4221))

(assert (= (and mapNonEmpty!4221 ((_ is ValueCellFull!1038) mapValue!4221)) b!115402))

(assert (= (and b!115401 ((_ is ValueCellFull!1038) mapDefault!4221)) b!115406))

(assert (= b!115408 b!115401))

(assert (= start!13142 b!115408))

(declare-fun m!131553 () Bool)

(assert (=> b!115408 m!131553))

(declare-fun m!131555 () Bool)

(assert (=> b!115408 m!131555))

(declare-fun m!131557 () Bool)

(assert (=> b!115397 m!131557))

(declare-fun m!131559 () Bool)

(assert (=> b!115397 m!131559))

(declare-fun m!131561 () Bool)

(assert (=> b!115400 m!131561))

(declare-fun m!131563 () Bool)

(assert (=> b!115400 m!131563))

(declare-fun m!131565 () Bool)

(assert (=> start!13142 m!131565))

(declare-fun m!131567 () Bool)

(assert (=> mapNonEmpty!4221 m!131567))

(declare-fun m!131569 () Bool)

(assert (=> b!115405 m!131569))

(declare-fun m!131571 () Bool)

(assert (=> mapNonEmpty!4222 m!131571))

(check-sat b_and!7163 (not b_next!2695) (not b_next!2693) (not b!115408) (not b!115405) (not b!115397) (not b!115400) (not mapNonEmpty!4221) b_and!7165 (not start!13142) tp_is_empty!2763 (not mapNonEmpty!4222))
(check-sat b_and!7163 b_and!7165 (not b_next!2693) (not b_next!2695))
