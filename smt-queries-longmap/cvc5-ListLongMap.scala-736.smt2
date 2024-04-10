; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17168 () Bool)

(assert start!17168)

(declare-fun b!172445 () Bool)

(declare-fun b_free!4255 () Bool)

(declare-fun b_next!4255 () Bool)

(assert (=> b!172445 (= b_free!4255 (not b_next!4255))))

(declare-fun tp!15412 () Bool)

(declare-fun b_and!10695 () Bool)

(assert (=> b!172445 (= tp!15412 b_and!10695)))

(declare-fun b!172439 () Bool)

(declare-fun res!81881 () Bool)

(declare-fun e!113827 () Bool)

(assert (=> b!172439 (=> (not res!81881) (not e!113827))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172439 (= res!81881 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172440 () Bool)

(declare-datatypes ((V!5017 0))(
  ( (V!5018 (val!2058 Int)) )
))
(declare-datatypes ((ValueCell!1670 0))(
  ( (ValueCellFull!1670 (v!3926 V!5017)) (EmptyCell!1670) )
))
(declare-datatypes ((array!7175 0))(
  ( (array!7176 (arr!3411 (Array (_ BitVec 32) (_ BitVec 64))) (size!3708 (_ BitVec 32))) )
))
(declare-datatypes ((array!7177 0))(
  ( (array!7178 (arr!3412 (Array (_ BitVec 32) ValueCell!1670)) (size!3709 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2248 0))(
  ( (LongMapFixedSize!2249 (defaultEntry!3570 Int) (mask!8415 (_ BitVec 32)) (extraKeys!3309 (_ BitVec 32)) (zeroValue!3411 V!5017) (minValue!3413 V!5017) (_size!1173 (_ BitVec 32)) (_keys!5407 array!7175) (_values!3553 array!7177) (_vacant!1173 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2248)

(assert (=> b!172440 (= e!113827 (and (= (size!3709 (_values!3553 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8415 thiss!1248))) (= (size!3708 (_keys!5407 thiss!1248)) (size!3709 (_values!3553 thiss!1248))) (bvslt (mask!8415 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6850 () Bool)

(declare-fun mapRes!6850 () Bool)

(declare-fun tp!15411 () Bool)

(declare-fun e!113826 () Bool)

(assert (=> mapNonEmpty!6850 (= mapRes!6850 (and tp!15411 e!113826))))

(declare-fun mapRest!6850 () (Array (_ BitVec 32) ValueCell!1670))

(declare-fun mapValue!6850 () ValueCell!1670)

(declare-fun mapKey!6850 () (_ BitVec 32))

(assert (=> mapNonEmpty!6850 (= (arr!3412 (_values!3553 thiss!1248)) (store mapRest!6850 mapKey!6850 mapValue!6850))))

(declare-fun b!172441 () Bool)

(declare-fun e!113823 () Bool)

(declare-fun e!113825 () Bool)

(assert (=> b!172441 (= e!113823 (and e!113825 mapRes!6850))))

(declare-fun condMapEmpty!6850 () Bool)

(declare-fun mapDefault!6850 () ValueCell!1670)

