; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39680 () Bool)

(assert start!39680)

(declare-fun b_free!9947 () Bool)

(declare-fun b_next!9947 () Bool)

(assert (=> start!39680 (= b_free!9947 (not b_next!9947))))

(declare-fun tp!35369 () Bool)

(declare-fun b_and!17603 () Bool)

(assert (=> start!39680 (= tp!35369 b_and!17603)))

(declare-fun b!426143 () Bool)

(declare-fun res!249660 () Bool)

(declare-fun e!252870 () Bool)

(assert (=> b!426143 (=> (not res!249660) (not e!252870))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426143 (= res!249660 (bvsle from!863 i!563))))

(declare-fun res!249664 () Bool)

(declare-fun e!252873 () Bool)

(assert (=> start!39680 (=> (not res!249664) (not e!252873))))

(declare-datatypes ((array!26037 0))(
  ( (array!26038 (arr!12468 (Array (_ BitVec 32) (_ BitVec 64))) (size!12820 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26037)

(assert (=> start!39680 (= res!249664 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12820 _keys!709))))))

(assert (=> start!39680 e!252873))

(declare-fun tp_is_empty!11099 () Bool)

(assert (=> start!39680 tp_is_empty!11099))

(assert (=> start!39680 tp!35369))

(assert (=> start!39680 true))

(declare-datatypes ((V!15903 0))(
  ( (V!15904 (val!5594 Int)) )
))
(declare-datatypes ((ValueCell!5206 0))(
  ( (ValueCellFull!5206 (v!7841 V!15903)) (EmptyCell!5206) )
))
(declare-datatypes ((array!26039 0))(
  ( (array!26040 (arr!12469 (Array (_ BitVec 32) ValueCell!5206)) (size!12821 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26039)

(declare-fun e!252872 () Bool)

(declare-fun array_inv!9086 (array!26039) Bool)

(assert (=> start!39680 (and (array_inv!9086 _values!549) e!252872)))

(declare-fun array_inv!9087 (array!26037) Bool)

(assert (=> start!39680 (array_inv!9087 _keys!709)))

(declare-fun b!426144 () Bool)

(declare-fun e!252874 () Bool)

(assert (=> b!426144 (= e!252874 tp_is_empty!11099)))

(declare-fun b!426145 () Bool)

(declare-fun e!252871 () Bool)

(declare-fun mapRes!18270 () Bool)

(assert (=> b!426145 (= e!252872 (and e!252871 mapRes!18270))))

(declare-fun condMapEmpty!18270 () Bool)

(declare-fun mapDefault!18270 () ValueCell!5206)

