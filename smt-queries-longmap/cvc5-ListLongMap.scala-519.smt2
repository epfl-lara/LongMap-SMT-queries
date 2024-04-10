; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13070 () Bool)

(assert start!13070)

(declare-fun b!114139 () Bool)

(declare-fun b_free!2617 () Bool)

(declare-fun b_next!2617 () Bool)

(assert (=> b!114139 (= b_free!2617 (not b_next!2617))))

(declare-fun tp!10212 () Bool)

(declare-fun b_and!7027 () Bool)

(assert (=> b!114139 (= tp!10212 b_and!7027)))

(declare-fun b!114129 () Bool)

(declare-fun b_free!2619 () Bool)

(declare-fun b_next!2619 () Bool)

(assert (=> b!114129 (= b_free!2619 (not b_next!2619))))

(declare-fun tp!10210 () Bool)

(declare-fun b_and!7029 () Bool)

(assert (=> b!114129 (= tp!10210 b_and!7029)))

(declare-fun b!114124 () Bool)

(declare-fun e!74229 () Bool)

(declare-fun e!74227 () Bool)

(declare-fun mapRes!4104 () Bool)

(assert (=> b!114124 (= e!74229 (and e!74227 mapRes!4104))))

(declare-fun condMapEmpty!4103 () Bool)

(declare-datatypes ((V!3281 0))(
  ( (V!3282 (val!1407 Int)) )
))
(declare-datatypes ((array!4451 0))(
  ( (array!4452 (arr!2109 (Array (_ BitVec 32) (_ BitVec 64))) (size!2369 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1019 0))(
  ( (ValueCellFull!1019 (v!2981 V!3281)) (EmptyCell!1019) )
))
(declare-datatypes ((array!4453 0))(
  ( (array!4454 (arr!2110 (Array (_ BitVec 32) ValueCell!1019)) (size!2370 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!946 0))(
  ( (LongMapFixedSize!947 (defaultEntry!2679 Int) (mask!6873 (_ BitVec 32)) (extraKeys!2468 (_ BitVec 32)) (zeroValue!2546 V!3281) (minValue!2546 V!3281) (_size!522 (_ BitVec 32)) (_keys!4401 array!4451) (_values!2662 array!4453) (_vacant!522 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!746 0))(
  ( (Cell!747 (v!2982 LongMapFixedSize!946)) )
))
(declare-datatypes ((LongMap!746 0))(
  ( (LongMap!747 (underlying!384 Cell!746)) )
))
(declare-fun thiss!992 () LongMap!746)

(declare-fun mapDefault!4104 () ValueCell!1019)

