; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13152 () Bool)

(assert start!13152)

(declare-fun b!115620 () Bool)

(declare-fun b_free!2713 () Bool)

(declare-fun b_next!2713 () Bool)

(assert (=> b!115620 (= b_free!2713 (not b_next!2713))))

(declare-fun tp!10504 () Bool)

(declare-fun b_and!7183 () Bool)

(assert (=> b!115620 (= tp!10504 b_and!7183)))

(declare-fun b!115610 () Bool)

(declare-fun b_free!2715 () Bool)

(declare-fun b_next!2715 () Bool)

(assert (=> b!115610 (= b_free!2715 (not b_next!2715))))

(declare-fun tp!10501 () Bool)

(declare-fun b_and!7185 () Bool)

(assert (=> b!115610 (= tp!10501 b_and!7185)))

(declare-fun b!115608 () Bool)

(declare-fun e!75440 () Bool)

(declare-fun e!75439 () Bool)

(declare-fun mapRes!4252 () Bool)

(assert (=> b!115608 (= e!75440 (and e!75439 mapRes!4252))))

(declare-fun condMapEmpty!4252 () Bool)

(declare-datatypes ((V!3345 0))(
  ( (V!3346 (val!1431 Int)) )
))
(declare-datatypes ((array!4549 0))(
  ( (array!4550 (arr!2157 (Array (_ BitVec 32) (_ BitVec 64))) (size!2417 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1043 0))(
  ( (ValueCellFull!1043 (v!3031 V!3345)) (EmptyCell!1043) )
))
(declare-datatypes ((array!4551 0))(
  ( (array!4552 (arr!2158 (Array (_ BitVec 32) ValueCell!1043)) (size!2418 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!994 0))(
  ( (LongMapFixedSize!995 (defaultEntry!2706 Int) (mask!6916 (_ BitVec 32)) (extraKeys!2495 (_ BitVec 32)) (zeroValue!2573 V!3345) (minValue!2573 V!3345) (_size!546 (_ BitVec 32)) (_keys!4428 array!4549) (_values!2689 array!4551) (_vacant!546 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!994)

(declare-fun mapDefault!4252 () ValueCell!1043)

