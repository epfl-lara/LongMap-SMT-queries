; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8572 () Bool)

(assert start!8572)

(declare-fun b!58826 () Bool)

(declare-fun b_free!1965 () Bool)

(declare-fun b_next!1965 () Bool)

(assert (=> b!58826 (= b_free!1965 (not b_next!1965))))

(declare-fun tp!8007 () Bool)

(declare-fun b_and!3559 () Bool)

(assert (=> b!58826 (= tp!8007 b_and!3559)))

(declare-fun b!58824 () Bool)

(declare-fun b_free!1967 () Bool)

(declare-fun b_next!1967 () Bool)

(assert (=> b!58824 (= b_free!1967 (not b_next!1967))))

(declare-fun tp!8010 () Bool)

(declare-fun b_and!3561 () Bool)

(assert (=> b!58824 (= tp!8010 b_and!3561)))

(declare-fun b!58822 () Bool)

(declare-fun e!38724 () Bool)

(declare-fun e!38728 () Bool)

(declare-fun mapRes!2879 () Bool)

(assert (=> b!58822 (= e!38724 (and e!38728 mapRes!2879))))

(declare-fun condMapEmpty!2879 () Bool)

(declare-datatypes ((V!2845 0))(
  ( (V!2846 (val!1244 Int)) )
))
(declare-datatypes ((array!3725 0))(
  ( (array!3726 (arr!1783 (Array (_ BitVec 32) (_ BitVec 64))) (size!2013 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!856 0))(
  ( (ValueCellFull!856 (v!2384 V!2845)) (EmptyCell!856) )
))
(declare-datatypes ((array!3727 0))(
  ( (array!3728 (arr!1784 (Array (_ BitVec 32) ValueCell!856)) (size!2014 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!620 0))(
  ( (LongMapFixedSize!621 (defaultEntry!2044 Int) (mask!5928 (_ BitVec 32)) (extraKeys!1931 (_ BitVec 32)) (zeroValue!1960 V!2845) (minValue!1960 V!2845) (_size!359 (_ BitVec 32)) (_keys!3668 array!3725) (_values!2027 array!3727) (_vacant!359 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!620)

(declare-fun mapDefault!2879 () ValueCell!856)

