; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18332 () Bool)

(assert start!18332)

(declare-fun b!182008 () Bool)

(declare-fun b_free!4493 () Bool)

(declare-fun b_next!4493 () Bool)

(assert (=> b!182008 (= b_free!4493 (not b_next!4493))))

(declare-fun tp!16234 () Bool)

(declare-fun b_and!11049 () Bool)

(assert (=> b!182008 (= tp!16234 b_and!11049)))

(declare-fun e!119874 () Bool)

(declare-fun tp_is_empty!4265 () Bool)

(declare-datatypes ((V!5333 0))(
  ( (V!5334 (val!2177 Int)) )
))
(declare-datatypes ((ValueCell!1789 0))(
  ( (ValueCellFull!1789 (v!4075 V!5333)) (EmptyCell!1789) )
))
(declare-datatypes ((array!7713 0))(
  ( (array!7714 (arr!3649 (Array (_ BitVec 32) (_ BitVec 64))) (size!3960 (_ BitVec 32))) )
))
(declare-datatypes ((array!7715 0))(
  ( (array!7716 (arr!3650 (Array (_ BitVec 32) ValueCell!1789)) (size!3961 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2486 0))(
  ( (LongMapFixedSize!2487 (defaultEntry!3727 Int) (mask!8760 (_ BitVec 32)) (extraKeys!3464 (_ BitVec 32)) (zeroValue!3568 V!5333) (minValue!3568 V!5333) (_size!1292 (_ BitVec 32)) (_keys!5634 array!7713) (_values!3710 array!7715) (_vacant!1292 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2486)

(declare-fun e!119872 () Bool)

(declare-fun array_inv!2351 (array!7713) Bool)

(declare-fun array_inv!2352 (array!7715) Bool)

(assert (=> b!182008 (= e!119872 (and tp!16234 tp_is_empty!4265 (array_inv!2351 (_keys!5634 thiss!1248)) (array_inv!2352 (_values!3710 thiss!1248)) e!119874))))

(declare-fun b!182009 () Bool)

(declare-fun e!119871 () Bool)

(declare-fun mapRes!7315 () Bool)

(assert (=> b!182009 (= e!119874 (and e!119871 mapRes!7315))))

(declare-fun condMapEmpty!7315 () Bool)

(declare-fun mapDefault!7315 () ValueCell!1789)

