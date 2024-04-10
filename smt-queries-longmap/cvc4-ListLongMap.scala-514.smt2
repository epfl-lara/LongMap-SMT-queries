; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12684 () Bool)

(assert start!12684)

(declare-fun b!109762 () Bool)

(declare-fun b_free!2565 () Bool)

(declare-fun b_next!2565 () Bool)

(assert (=> b!109762 (= b_free!2565 (not b_next!2565))))

(declare-fun tp!10035 () Bool)

(declare-fun b_and!6767 () Bool)

(assert (=> b!109762 (= tp!10035 b_and!6767)))

(declare-fun b!109772 () Bool)

(declare-fun b_free!2567 () Bool)

(declare-fun b_next!2567 () Bool)

(assert (=> b!109772 (= b_free!2567 (not b_next!2567))))

(declare-fun tp!10036 () Bool)

(declare-fun b_and!6769 () Bool)

(assert (=> b!109772 (= tp!10036 b_and!6769)))

(declare-fun b!109755 () Bool)

(declare-fun e!71424 () Bool)

(declare-fun e!71438 () Bool)

(assert (=> b!109755 (= e!71424 e!71438)))

(declare-fun b!109756 () Bool)

(declare-fun res!54321 () Bool)

(declare-fun e!71432 () Bool)

(assert (=> b!109756 (=> (not res!54321) (not e!71432))))

(declare-datatypes ((V!3245 0))(
  ( (V!3246 (val!1394 Int)) )
))
(declare-datatypes ((array!4393 0))(
  ( (array!4394 (arr!2083 (Array (_ BitVec 32) (_ BitVec 64))) (size!2340 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1006 0))(
  ( (ValueCellFull!1006 (v!2931 V!3245)) (EmptyCell!1006) )
))
(declare-datatypes ((array!4395 0))(
  ( (array!4396 (arr!2084 (Array (_ BitVec 32) ValueCell!1006)) (size!2341 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!920 0))(
  ( (LongMapFixedSize!921 (defaultEntry!2628 Int) (mask!6796 (_ BitVec 32)) (extraKeys!2425 (_ BitVec 32)) (zeroValue!2499 V!3245) (minValue!2499 V!3245) (_size!509 (_ BitVec 32)) (_keys!4342 array!4393) (_values!2611 array!4395) (_vacant!509 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!920)

(declare-datatypes ((Cell!720 0))(
  ( (Cell!721 (v!2932 LongMapFixedSize!920)) )
))
(declare-datatypes ((LongMap!720 0))(
  ( (LongMap!721 (underlying!371 Cell!720)) )
))
(declare-fun thiss!992 () LongMap!720)

(assert (=> b!109756 (= res!54321 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6796 newMap!16)) (_size!509 (v!2932 (underlying!371 thiss!992)))))))

(declare-fun mapIsEmpty!4005 () Bool)

(declare-fun mapRes!4006 () Bool)

(assert (=> mapIsEmpty!4005 mapRes!4006))

(declare-fun b!109757 () Bool)

(declare-fun e!71427 () Bool)

(declare-fun tp_is_empty!2699 () Bool)

(assert (=> b!109757 (= e!71427 tp_is_empty!2699)))

(declare-fun mapNonEmpty!4005 () Bool)

(declare-fun mapRes!4005 () Bool)

(declare-fun tp!10034 () Bool)

(assert (=> mapNonEmpty!4005 (= mapRes!4005 (and tp!10034 e!71427))))

(declare-fun mapKey!4005 () (_ BitVec 32))

(declare-fun mapRest!4005 () (Array (_ BitVec 32) ValueCell!1006))

(declare-fun mapValue!4006 () ValueCell!1006)

(assert (=> mapNonEmpty!4005 (= (arr!2084 (_values!2611 newMap!16)) (store mapRest!4005 mapKey!4005 mapValue!4006))))

(declare-fun b!109758 () Bool)

(declare-fun e!71436 () Bool)

(assert (=> b!109758 (= e!71436 e!71424)))

(declare-fun b!109759 () Bool)

(declare-fun res!54326 () Bool)

(assert (=> b!109759 (=> (not res!54326) (not e!71432))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!109759 (= res!54326 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2340 (_keys!4342 (v!2932 (underlying!371 thiss!992)))))))))

(declare-fun b!109760 () Bool)

(declare-datatypes ((Unit!3407 0))(
  ( (Unit!3408) )
))
(declare-fun e!71430 () Unit!3407)

(declare-fun Unit!3409 () Unit!3407)

(assert (=> b!109760 (= e!71430 Unit!3409)))

(declare-fun b!109761 () Bool)

(declare-fun e!71441 () Bool)

(declare-fun e!71440 () Bool)

(assert (=> b!109761 (= e!71441 (and e!71440 mapRes!4005))))

(declare-fun condMapEmpty!4006 () Bool)

(declare-fun mapDefault!4005 () ValueCell!1006)

