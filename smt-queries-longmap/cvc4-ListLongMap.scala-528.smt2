; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13200 () Bool)

(assert start!13200)

(declare-fun b!116173 () Bool)

(declare-fun b_free!2733 () Bool)

(declare-fun b_next!2733 () Bool)

(assert (=> b!116173 (= b_free!2733 (not b_next!2733))))

(declare-fun tp!10569 () Bool)

(declare-fun b_and!7231 () Bool)

(assert (=> b!116173 (= tp!10569 b_and!7231)))

(declare-fun b!116170 () Bool)

(declare-fun b_free!2735 () Bool)

(declare-fun b_next!2735 () Bool)

(assert (=> b!116170 (= b_free!2735 (not b_next!2735))))

(declare-fun tp!10568 () Bool)

(declare-fun b_and!7233 () Bool)

(assert (=> b!116170 (= tp!10568 b_and!7233)))

(declare-fun mapIsEmpty!4287 () Bool)

(declare-fun mapRes!4288 () Bool)

(assert (=> mapIsEmpty!4287 mapRes!4288))

(declare-fun b!116157 () Bool)

(declare-fun res!56939 () Bool)

(declare-fun e!75833 () Bool)

(assert (=> b!116157 (=> (not res!56939) (not e!75833))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3357 0))(
  ( (V!3358 (val!1436 Int)) )
))
(declare-datatypes ((array!4571 0))(
  ( (array!4572 (arr!2167 (Array (_ BitVec 32) (_ BitVec 64))) (size!2428 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1048 0))(
  ( (ValueCellFull!1048 (v!3041 V!3357)) (EmptyCell!1048) )
))
(declare-datatypes ((array!4573 0))(
  ( (array!4574 (arr!2168 (Array (_ BitVec 32) ValueCell!1048)) (size!2429 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1004 0))(
  ( (LongMapFixedSize!1005 (defaultEntry!2713 Int) (mask!6927 (_ BitVec 32)) (extraKeys!2502 (_ BitVec 32)) (zeroValue!2580 V!3357) (minValue!2580 V!3357) (_size!551 (_ BitVec 32)) (_keys!4436 array!4571) (_values!2696 array!4573) (_vacant!551 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!802 0))(
  ( (Cell!803 (v!3042 LongMapFixedSize!1004)) )
))
(declare-datatypes ((LongMap!802 0))(
  ( (LongMap!803 (underlying!412 Cell!802)) )
))
(declare-fun thiss!992 () LongMap!802)

(assert (=> b!116157 (= res!56939 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2428 (_keys!4436 (v!3042 (underlying!412 thiss!992)))))))))

(declare-fun res!56943 () Bool)

(assert (=> start!13200 (=> (not res!56943) (not e!75833))))

(declare-fun valid!476 (LongMap!802) Bool)

(assert (=> start!13200 (= res!56943 (valid!476 thiss!992))))

(assert (=> start!13200 e!75833))

(declare-fun e!75835 () Bool)

(assert (=> start!13200 e!75835))

(assert (=> start!13200 true))

(declare-fun e!75829 () Bool)

(assert (=> start!13200 e!75829))

(declare-fun b!116158 () Bool)

(declare-fun e!75837 () Bool)

(declare-fun tp_is_empty!2783 () Bool)

(assert (=> b!116158 (= e!75837 tp_is_empty!2783)))

(declare-fun b!116159 () Bool)

(declare-fun e!75839 () Bool)

(assert (=> b!116159 (= e!75835 e!75839)))

(declare-fun b!116160 () Bool)

(declare-fun e!75840 () Bool)

(declare-fun e!75836 () Bool)

(assert (=> b!116160 (= e!75840 (and e!75836 mapRes!4288))))

(declare-fun condMapEmpty!4287 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1004)

(declare-fun mapDefault!4287 () ValueCell!1048)

