; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13222 () Bool)

(assert start!13222)

(declare-fun b!116497 () Bool)

(declare-fun b_free!2749 () Bool)

(declare-fun b_next!2749 () Bool)

(assert (=> b!116497 (= b_free!2749 (not b_next!2749))))

(declare-fun tp!10620 () Bool)

(declare-fun b_and!7255 () Bool)

(assert (=> b!116497 (= tp!10620 b_and!7255)))

(declare-fun b!116504 () Bool)

(declare-fun b_free!2751 () Bool)

(declare-fun b_next!2751 () Bool)

(assert (=> b!116504 (= b_free!2751 (not b_next!2751))))

(declare-fun tp!10619 () Bool)

(declare-fun b_and!7257 () Bool)

(assert (=> b!116504 (= tp!10619 b_and!7257)))

(declare-fun b!116496 () Bool)

(declare-fun res!57072 () Bool)

(declare-fun e!76075 () Bool)

(assert (=> b!116496 (=> (not res!57072) (not e!76075))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3369 0))(
  ( (V!3370 (val!1440 Int)) )
))
(declare-datatypes ((array!4589 0))(
  ( (array!4590 (arr!2175 (Array (_ BitVec 32) (_ BitVec 64))) (size!2436 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1052 0))(
  ( (ValueCellFull!1052 (v!3049 V!3369)) (EmptyCell!1052) )
))
(declare-datatypes ((array!4591 0))(
  ( (array!4592 (arr!2176 (Array (_ BitVec 32) ValueCell!1052)) (size!2437 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1012 0))(
  ( (LongMapFixedSize!1013 (defaultEntry!2718 Int) (mask!6936 (_ BitVec 32)) (extraKeys!2507 (_ BitVec 32)) (zeroValue!2585 V!3369) (minValue!2585 V!3369) (_size!555 (_ BitVec 32)) (_keys!4441 array!4589) (_values!2701 array!4591) (_vacant!555 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!810 0))(
  ( (Cell!811 (v!3050 LongMapFixedSize!1012)) )
))
(declare-datatypes ((LongMap!810 0))(
  ( (LongMap!811 (underlying!416 Cell!810)) )
))
(declare-fun thiss!992 () LongMap!810)

(assert (=> b!116496 (= res!57072 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2436 (_keys!4441 (v!3050 (underlying!416 thiss!992)))))))))

(declare-fun e!76077 () Bool)

(declare-fun e!76076 () Bool)

(declare-fun tp_is_empty!2791 () Bool)

(declare-fun array_inv!1369 (array!4589) Bool)

(declare-fun array_inv!1370 (array!4591) Bool)

(assert (=> b!116497 (= e!76077 (and tp!10620 tp_is_empty!2791 (array_inv!1369 (_keys!4441 (v!3050 (underlying!416 thiss!992)))) (array_inv!1370 (_values!2701 (v!3050 (underlying!416 thiss!992)))) e!76076))))

(declare-fun b!116498 () Bool)

(declare-fun e!76078 () Bool)

(assert (=> b!116498 (= e!76078 tp_is_empty!2791)))

(declare-fun b!116499 () Bool)

(declare-fun mapRes!4316 () Bool)

(assert (=> b!116499 (= e!76076 (and e!76078 mapRes!4316))))

(declare-fun condMapEmpty!4315 () Bool)

(declare-fun mapDefault!4315 () ValueCell!1052)

