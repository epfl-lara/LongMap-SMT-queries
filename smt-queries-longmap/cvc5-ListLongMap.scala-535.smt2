; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13438 () Bool)

(assert start!13438)

(declare-fun b!123171 () Bool)

(declare-fun b_free!2809 () Bool)

(declare-fun b_next!2809 () Bool)

(assert (=> b!123171 (= b_free!2809 (not b_next!2809))))

(declare-fun tp!10813 () Bool)

(declare-fun b_and!7563 () Bool)

(assert (=> b!123171 (= tp!10813 b_and!7563)))

(declare-fun b!123174 () Bool)

(declare-fun b_free!2811 () Bool)

(declare-fun b_next!2811 () Bool)

(assert (=> b!123174 (= b_free!2811 (not b_next!2811))))

(declare-fun tp!10814 () Bool)

(declare-fun b_and!7565 () Bool)

(assert (=> b!123174 (= tp!10814 b_and!7565)))

(declare-fun b!123161 () Bool)

(declare-fun res!59832 () Bool)

(declare-fun e!80494 () Bool)

(assert (=> b!123161 (=> (not res!59832) (not e!80494))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3409 0))(
  ( (V!3410 (val!1455 Int)) )
))
(declare-datatypes ((array!4653 0))(
  ( (array!4654 (arr!2205 (Array (_ BitVec 32) (_ BitVec 64))) (size!2467 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1067 0))(
  ( (ValueCellFull!1067 (v!3089 V!3409)) (EmptyCell!1067) )
))
(declare-datatypes ((array!4655 0))(
  ( (array!4656 (arr!2206 (Array (_ BitVec 32) ValueCell!1067)) (size!2468 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1042 0))(
  ( (LongMapFixedSize!1043 (defaultEntry!2754 Int) (mask!6992 (_ BitVec 32)) (extraKeys!2539 (_ BitVec 32)) (zeroValue!2619 V!3409) (minValue!2619 V!3409) (_size!570 (_ BitVec 32)) (_keys!4481 array!4653) (_values!2737 array!4655) (_vacant!570 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!838 0))(
  ( (Cell!839 (v!3090 LongMapFixedSize!1042)) )
))
(declare-datatypes ((LongMap!838 0))(
  ( (LongMap!839 (underlying!430 Cell!838)) )
))
(declare-fun thiss!992 () LongMap!838)

(assert (=> b!123161 (= res!59832 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2467 (_keys!4481 (v!3090 (underlying!430 thiss!992)))))))))

(declare-fun mapIsEmpty!4419 () Bool)

(declare-fun mapRes!4419 () Bool)

(assert (=> mapIsEmpty!4419 mapRes!4419))

(declare-fun mapIsEmpty!4420 () Bool)

(declare-fun mapRes!4420 () Bool)

(assert (=> mapIsEmpty!4420 mapRes!4420))

(declare-fun b!123162 () Bool)

(assert (=> b!123162 (= e!80494 (bvsge from!355 (size!2468 (_values!2737 (v!3090 (underlying!430 thiss!992))))))))

(declare-fun b!123163 () Bool)

(declare-fun e!80503 () Bool)

(declare-fun tp_is_empty!2821 () Bool)

(assert (=> b!123163 (= e!80503 tp_is_empty!2821)))

(declare-fun b!123164 () Bool)

(declare-fun res!59830 () Bool)

(assert (=> b!123164 (=> (not res!59830) (not e!80494))))

(declare-fun newMap!16 () LongMapFixedSize!1042)

(assert (=> b!123164 (= res!59830 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6992 newMap!16)) (_size!570 (v!3090 (underlying!430 thiss!992)))))))

(declare-fun b!123165 () Bool)

(declare-fun e!80506 () Bool)

(declare-fun e!80498 () Bool)

(assert (=> b!123165 (= e!80506 (and e!80498 mapRes!4419))))

(declare-fun condMapEmpty!4419 () Bool)

(declare-fun mapDefault!4419 () ValueCell!1067)

