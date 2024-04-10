; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15206 () Bool)

(assert start!15206)

(declare-fun b!146293 () Bool)

(declare-fun b_free!3117 () Bool)

(declare-fun b_next!3117 () Bool)

(assert (=> b!146293 (= b_free!3117 (not b_next!3117))))

(declare-fun tp!11853 () Bool)

(declare-fun b_and!9151 () Bool)

(assert (=> b!146293 (= tp!11853 b_and!9151)))

(declare-fun b!146309 () Bool)

(declare-fun b_free!3119 () Bool)

(declare-fun b_next!3119 () Bool)

(assert (=> b!146309 (= b_free!3119 (not b_next!3119))))

(declare-fun tp!11855 () Bool)

(declare-fun b_and!9153 () Bool)

(assert (=> b!146309 (= tp!11855 b_and!9153)))

(declare-fun b!146291 () Bool)

(declare-fun e!95441 () Bool)

(declare-fun e!95434 () Bool)

(declare-fun mapRes!4998 () Bool)

(assert (=> b!146291 (= e!95441 (and e!95434 mapRes!4998))))

(declare-fun condMapEmpty!4998 () Bool)

(declare-datatypes ((V!3613 0))(
  ( (V!3614 (val!1532 Int)) )
))
(declare-datatypes ((array!4995 0))(
  ( (array!4996 (arr!2359 (Array (_ BitVec 32) (_ BitVec 64))) (size!2635 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1144 0))(
  ( (ValueCellFull!1144 (v!3354 V!3613)) (EmptyCell!1144) )
))
(declare-datatypes ((array!4997 0))(
  ( (array!4998 (arr!2360 (Array (_ BitVec 32) ValueCell!1144)) (size!2636 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1196 0))(
  ( (LongMapFixedSize!1197 (defaultEntry!3014 Int) (mask!7390 (_ BitVec 32)) (extraKeys!2759 (_ BitVec 32)) (zeroValue!2859 V!3613) (minValue!2859 V!3613) (_size!647 (_ BitVec 32)) (_keys!4783 array!4995) (_values!2997 array!4997) (_vacant!647 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1196)

(declare-fun mapDefault!4998 () ValueCell!1144)

