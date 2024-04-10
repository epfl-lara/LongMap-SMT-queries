; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37056 () Bool)

(assert start!37056)

(declare-fun b_free!8183 () Bool)

(declare-fun b_next!8183 () Bool)

(assert (=> start!37056 (= b_free!8183 (not b_next!8183))))

(declare-fun tp!29265 () Bool)

(declare-fun b_and!15425 () Bool)

(assert (=> start!37056 (= tp!29265 b_and!15425)))

(declare-fun b!372609 () Bool)

(declare-fun e!227260 () Bool)

(declare-fun tp_is_empty!8831 () Bool)

(assert (=> b!372609 (= e!227260 tp_is_empty!8831)))

(declare-fun b!372610 () Bool)

(declare-fun res!209693 () Bool)

(declare-fun e!227261 () Bool)

(assert (=> b!372610 (=> (not res!209693) (not e!227261))))

(declare-datatypes ((array!21603 0))(
  ( (array!21604 (arr!10270 (Array (_ BitVec 32) (_ BitVec 64))) (size!10622 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21603)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372610 (= res!209693 (or (= (select (arr!10270 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10270 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372611 () Bool)

(declare-fun e!227259 () Bool)

(declare-fun e!227256 () Bool)

(declare-fun mapRes!14811 () Bool)

(assert (=> b!372611 (= e!227259 (and e!227256 mapRes!14811))))

(declare-fun condMapEmpty!14811 () Bool)

(declare-datatypes ((V!12879 0))(
  ( (V!12880 (val!4460 Int)) )
))
(declare-datatypes ((ValueCell!4072 0))(
  ( (ValueCellFull!4072 (v!6657 V!12879)) (EmptyCell!4072) )
))
(declare-datatypes ((array!21605 0))(
  ( (array!21606 (arr!10271 (Array (_ BitVec 32) ValueCell!4072)) (size!10623 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21605)

(declare-fun mapDefault!14811 () ValueCell!4072)

