; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13432 () Bool)

(assert start!13432)

(declare-fun b!123045 () Bool)

(declare-fun b_free!2797 () Bool)

(declare-fun b_next!2797 () Bool)

(assert (=> b!123045 (= b_free!2797 (not b_next!2797))))

(declare-fun tp!10777 () Bool)

(declare-fun b_and!7551 () Bool)

(assert (=> b!123045 (= tp!10777 b_and!7551)))

(declare-fun b!123042 () Bool)

(declare-fun b_free!2799 () Bool)

(declare-fun b_next!2799 () Bool)

(assert (=> b!123042 (= b_free!2799 (not b_next!2799))))

(declare-fun tp!10779 () Bool)

(declare-fun b_and!7553 () Bool)

(assert (=> b!123042 (= tp!10779 b_and!7553)))

(declare-fun b!123033 () Bool)

(declare-fun res!59793 () Bool)

(declare-fun e!80389 () Bool)

(assert (=> b!123033 (=> (not res!59793) (not e!80389))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3401 0))(
  ( (V!3402 (val!1452 Int)) )
))
(declare-datatypes ((array!4641 0))(
  ( (array!4642 (arr!2199 (Array (_ BitVec 32) (_ BitVec 64))) (size!2461 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1064 0))(
  ( (ValueCellFull!1064 (v!3083 V!3401)) (EmptyCell!1064) )
))
(declare-datatypes ((array!4643 0))(
  ( (array!4644 (arr!2200 (Array (_ BitVec 32) ValueCell!1064)) (size!2462 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1036 0))(
  ( (LongMapFixedSize!1037 (defaultEntry!2751 Int) (mask!6987 (_ BitVec 32)) (extraKeys!2536 (_ BitVec 32)) (zeroValue!2616 V!3401) (minValue!2616 V!3401) (_size!567 (_ BitVec 32)) (_keys!4478 array!4641) (_values!2734 array!4643) (_vacant!567 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!832 0))(
  ( (Cell!833 (v!3084 LongMapFixedSize!1036)) )
))
(declare-datatypes ((LongMap!832 0))(
  ( (LongMap!833 (underlying!427 Cell!832)) )
))
(declare-fun thiss!992 () LongMap!832)

(assert (=> b!123033 (= res!59793 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2461 (_keys!4478 (v!3084 (underlying!427 thiss!992)))))))))

(declare-fun mapNonEmpty!4401 () Bool)

(declare-fun mapRes!4402 () Bool)

(declare-fun tp!10778 () Bool)

(declare-fun e!80378 () Bool)

(assert (=> mapNonEmpty!4401 (= mapRes!4402 (and tp!10778 e!80378))))

(declare-fun mapRest!4401 () (Array (_ BitVec 32) ValueCell!1064))

(declare-fun mapKey!4401 () (_ BitVec 32))

(declare-fun mapValue!4402 () ValueCell!1064)

(assert (=> mapNonEmpty!4401 (= (arr!2200 (_values!2734 (v!3084 (underlying!427 thiss!992)))) (store mapRest!4401 mapKey!4401 mapValue!4402))))

(declare-fun b!123034 () Bool)

(declare-fun res!59792 () Bool)

(assert (=> b!123034 (=> (not res!59792) (not e!80389))))

(declare-fun newMap!16 () LongMapFixedSize!1036)

(assert (=> b!123034 (= res!59792 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6987 newMap!16)) (_size!567 (v!3084 (underlying!427 thiss!992)))))))

(declare-fun mapNonEmpty!4402 () Bool)

(declare-fun mapRes!4401 () Bool)

(declare-fun tp!10780 () Bool)

(declare-fun e!80380 () Bool)

(assert (=> mapNonEmpty!4402 (= mapRes!4401 (and tp!10780 e!80380))))

(declare-fun mapValue!4401 () ValueCell!1064)

(declare-fun mapRest!4402 () (Array (_ BitVec 32) ValueCell!1064))

(declare-fun mapKey!4402 () (_ BitVec 32))

(assert (=> mapNonEmpty!4402 (= (arr!2200 (_values!2734 newMap!16)) (store mapRest!4402 mapKey!4402 mapValue!4401))))

(declare-fun b!123035 () Bool)

(declare-fun res!59790 () Bool)

(assert (=> b!123035 (=> (not res!59790) (not e!80389))))

(declare-fun valid!492 (LongMapFixedSize!1036) Bool)

(assert (=> b!123035 (= res!59790 (valid!492 newMap!16))))

(declare-fun b!123036 () Bool)

(declare-fun e!80383 () Bool)

(declare-fun tp_is_empty!2815 () Bool)

(assert (=> b!123036 (= e!80383 tp_is_empty!2815)))

(declare-fun b!123037 () Bool)

(declare-fun e!80379 () Bool)

(declare-fun e!80387 () Bool)

(assert (=> b!123037 (= e!80379 e!80387)))

(declare-fun b!123038 () Bool)

(assert (=> b!123038 (= e!80389 false)))

(declare-datatypes ((tuple2!2558 0))(
  ( (tuple2!2559 (_1!1290 (_ BitVec 64)) (_2!1290 V!3401)) )
))
(declare-datatypes ((List!1689 0))(
  ( (Nil!1686) (Cons!1685 (h!2286 tuple2!2558) (t!5988 List!1689)) )
))
(declare-datatypes ((ListLongMap!1669 0))(
  ( (ListLongMap!1670 (toList!850 List!1689)) )
))
(declare-fun lt!63363 () ListLongMap!1669)

(declare-fun map!1374 (LongMapFixedSize!1036) ListLongMap!1669)

(assert (=> b!123038 (= lt!63363 (map!1374 newMap!16))))

(declare-fun lt!63364 () ListLongMap!1669)

(declare-fun getCurrentListMap!531 (array!4641 array!4643 (_ BitVec 32) (_ BitVec 32) V!3401 V!3401 (_ BitVec 32) Int) ListLongMap!1669)

(assert (=> b!123038 (= lt!63364 (getCurrentListMap!531 (_keys!4478 (v!3084 (underlying!427 thiss!992))) (_values!2734 (v!3084 (underlying!427 thiss!992))) (mask!6987 (v!3084 (underlying!427 thiss!992))) (extraKeys!2536 (v!3084 (underlying!427 thiss!992))) (zeroValue!2616 (v!3084 (underlying!427 thiss!992))) (minValue!2616 (v!3084 (underlying!427 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2751 (v!3084 (underlying!427 thiss!992)))))))

(declare-fun b!123039 () Bool)

(declare-fun e!80381 () Bool)

(assert (=> b!123039 (= e!80381 e!80379)))

(declare-fun b!123040 () Bool)

(declare-fun e!80377 () Bool)

(assert (=> b!123040 (= e!80377 tp_is_empty!2815)))

(declare-fun mapIsEmpty!4401 () Bool)

(assert (=> mapIsEmpty!4401 mapRes!4402))

(declare-fun mapIsEmpty!4402 () Bool)

(assert (=> mapIsEmpty!4402 mapRes!4401))

(declare-fun e!80384 () Bool)

(declare-fun e!80386 () Bool)

(declare-fun array_inv!1383 (array!4641) Bool)

(declare-fun array_inv!1384 (array!4643) Bool)

(assert (=> b!123042 (= e!80386 (and tp!10779 tp_is_empty!2815 (array_inv!1383 (_keys!4478 newMap!16)) (array_inv!1384 (_values!2734 newMap!16)) e!80384))))

(declare-fun b!123043 () Bool)

(declare-fun e!80388 () Bool)

(assert (=> b!123043 (= e!80388 (and e!80377 mapRes!4402))))

(declare-fun condMapEmpty!4402 () Bool)

(declare-fun mapDefault!4401 () ValueCell!1064)

