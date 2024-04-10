; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13146 () Bool)

(assert start!13146)

(declare-fun b!115481 () Bool)

(declare-fun b_free!2701 () Bool)

(declare-fun b_next!2701 () Bool)

(assert (=> b!115481 (= b_free!2701 (not b_next!2701))))

(declare-fun tp!10468 () Bool)

(declare-fun b_and!7171 () Bool)

(assert (=> b!115481 (= tp!10468 b_and!7171)))

(declare-fun b!115487 () Bool)

(declare-fun b_free!2703 () Bool)

(declare-fun b_next!2703 () Bool)

(assert (=> b!115487 (= b_free!2703 (not b_next!2703))))

(declare-fun tp!10467 () Bool)

(declare-fun b_and!7173 () Bool)

(assert (=> b!115487 (= tp!10467 b_and!7173)))

(declare-fun b!115480 () Bool)

(declare-fun e!75316 () Bool)

(declare-fun e!75320 () Bool)

(assert (=> b!115480 (= e!75316 e!75320)))

(declare-fun mapNonEmpty!4233 () Bool)

(declare-fun mapRes!4234 () Bool)

(declare-fun tp!10465 () Bool)

(declare-fun e!75325 () Bool)

(assert (=> mapNonEmpty!4233 (= mapRes!4234 (and tp!10465 e!75325))))

(declare-datatypes ((V!3337 0))(
  ( (V!3338 (val!1428 Int)) )
))
(declare-datatypes ((ValueCell!1040 0))(
  ( (ValueCellFull!1040 (v!3025 V!3337)) (EmptyCell!1040) )
))
(declare-fun mapRest!4234 () (Array (_ BitVec 32) ValueCell!1040))

(declare-fun mapValue!4234 () ValueCell!1040)

(declare-datatypes ((array!4537 0))(
  ( (array!4538 (arr!2151 (Array (_ BitVec 32) (_ BitVec 64))) (size!2411 (_ BitVec 32))) )
))
(declare-datatypes ((array!4539 0))(
  ( (array!4540 (arr!2152 (Array (_ BitVec 32) ValueCell!1040)) (size!2412 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!988 0))(
  ( (LongMapFixedSize!989 (defaultEntry!2703 Int) (mask!6911 (_ BitVec 32)) (extraKeys!2492 (_ BitVec 32)) (zeroValue!2570 V!3337) (minValue!2570 V!3337) (_size!543 (_ BitVec 32)) (_keys!4425 array!4537) (_values!2686 array!4539) (_vacant!543 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!988)

(declare-fun mapKey!4234 () (_ BitVec 32))

(assert (=> mapNonEmpty!4233 (= (arr!2152 (_values!2686 newMap!16)) (store mapRest!4234 mapKey!4234 mapValue!4234))))

(declare-datatypes ((Cell!788 0))(
  ( (Cell!789 (v!3026 LongMapFixedSize!988)) )
))
(declare-datatypes ((LongMap!788 0))(
  ( (LongMap!789 (underlying!405 Cell!788)) )
))
(declare-fun thiss!992 () LongMap!788)

(declare-fun tp_is_empty!2767 () Bool)

(declare-fun e!75327 () Bool)

(declare-fun array_inv!1353 (array!4537) Bool)

(declare-fun array_inv!1354 (array!4539) Bool)

(assert (=> b!115481 (= e!75320 (and tp!10468 tp_is_empty!2767 (array_inv!1353 (_keys!4425 (v!3026 (underlying!405 thiss!992)))) (array_inv!1354 (_values!2686 (v!3026 (underlying!405 thiss!992)))) e!75327))))

(declare-fun b!115482 () Bool)

(declare-fun e!75321 () Bool)

(assert (=> b!115482 (= e!75321 tp_is_empty!2767)))

(declare-fun b!115483 () Bool)

(declare-fun e!75322 () Bool)

(assert (=> b!115483 (= e!75322 e!75316)))

(declare-fun b!115484 () Bool)

(declare-fun res!56663 () Bool)

(declare-fun e!75324 () Bool)

(assert (=> b!115484 (=> (not res!56663) (not e!75324))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!115484 (= res!56663 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2411 (_keys!4425 (v!3026 (underlying!405 thiss!992)))))))))

(declare-fun b!115485 () Bool)

(assert (=> b!115485 (= e!75324 false)))

(declare-datatypes ((tuple2!2520 0))(
  ( (tuple2!2521 (_1!1271 (_ BitVec 64)) (_2!1271 V!3337)) )
))
(declare-datatypes ((List!1672 0))(
  ( (Nil!1669) (Cons!1668 (h!2268 tuple2!2520) (t!5926 List!1672)) )
))
(declare-datatypes ((ListLongMap!1643 0))(
  ( (ListLongMap!1644 (toList!837 List!1672)) )
))
(declare-fun lt!60000 () ListLongMap!1643)

(declare-fun map!1345 (LongMapFixedSize!988) ListLongMap!1643)

(assert (=> b!115485 (= lt!60000 (map!1345 newMap!16))))

(declare-fun lt!59999 () ListLongMap!1643)

(declare-fun getCurrentListMap!518 (array!4537 array!4539 (_ BitVec 32) (_ BitVec 32) V!3337 V!3337 (_ BitVec 32) Int) ListLongMap!1643)

(assert (=> b!115485 (= lt!59999 (getCurrentListMap!518 (_keys!4425 (v!3026 (underlying!405 thiss!992))) (_values!2686 (v!3026 (underlying!405 thiss!992))) (mask!6911 (v!3026 (underlying!405 thiss!992))) (extraKeys!2492 (v!3026 (underlying!405 thiss!992))) (zeroValue!2570 (v!3026 (underlying!405 thiss!992))) (minValue!2570 (v!3026 (underlying!405 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2703 (v!3026 (underlying!405 thiss!992)))))))

(declare-fun b!115486 () Bool)

(declare-fun res!56662 () Bool)

(assert (=> b!115486 (=> (not res!56662) (not e!75324))))

(declare-fun valid!468 (LongMapFixedSize!988) Bool)

(assert (=> b!115486 (= res!56662 (valid!468 newMap!16))))

(declare-fun e!75326 () Bool)

(declare-fun e!75315 () Bool)

(assert (=> b!115487 (= e!75315 (and tp!10467 tp_is_empty!2767 (array_inv!1353 (_keys!4425 newMap!16)) (array_inv!1354 (_values!2686 newMap!16)) e!75326))))

(declare-fun mapNonEmpty!4234 () Bool)

(declare-fun mapRes!4233 () Bool)

(declare-fun tp!10466 () Bool)

(declare-fun e!75317 () Bool)

(assert (=> mapNonEmpty!4234 (= mapRes!4233 (and tp!10466 e!75317))))

(declare-fun mapRest!4233 () (Array (_ BitVec 32) ValueCell!1040))

(declare-fun mapKey!4233 () (_ BitVec 32))

(declare-fun mapValue!4233 () ValueCell!1040)

(assert (=> mapNonEmpty!4234 (= (arr!2152 (_values!2686 (v!3026 (underlying!405 thiss!992)))) (store mapRest!4233 mapKey!4233 mapValue!4233))))

(declare-fun res!56664 () Bool)

(assert (=> start!13146 (=> (not res!56664) (not e!75324))))

(declare-fun valid!469 (LongMap!788) Bool)

(assert (=> start!13146 (= res!56664 (valid!469 thiss!992))))

(assert (=> start!13146 e!75324))

(assert (=> start!13146 e!75322))

(assert (=> start!13146 true))

(assert (=> start!13146 e!75315))

(declare-fun mapIsEmpty!4233 () Bool)

(assert (=> mapIsEmpty!4233 mapRes!4233))

(declare-fun b!115488 () Bool)

(assert (=> b!115488 (= e!75317 tp_is_empty!2767)))

(declare-fun b!115489 () Bool)

(assert (=> b!115489 (= e!75327 (and e!75321 mapRes!4233))))

(declare-fun condMapEmpty!4233 () Bool)

(declare-fun mapDefault!4234 () ValueCell!1040)

