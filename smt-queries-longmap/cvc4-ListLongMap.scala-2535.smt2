; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39032 () Bool)

(assert start!39032)

(declare-fun b_free!9299 () Bool)

(declare-fun b_next!9299 () Bool)

(assert (=> start!39032 (= b_free!9299 (not b_next!9299))))

(declare-fun tp!33426 () Bool)

(declare-fun b_and!16685 () Bool)

(assert (=> start!39032 (= tp!33426 b_and!16685)))

(declare-fun b!409332 () Bool)

(declare-fun res!237010 () Bool)

(declare-fun e!245568 () Bool)

(assert (=> b!409332 (=> (not res!237010) (not e!245568))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409332 (= res!237010 (validKeyInArray!0 k!794))))

(declare-fun b!409333 () Bool)

(declare-fun res!237012 () Bool)

(declare-fun e!245563 () Bool)

(assert (=> b!409333 (=> (not res!237012) (not e!245563))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409333 (= res!237012 (bvsle from!863 i!563))))

(declare-fun b!409334 () Bool)

(declare-fun res!237013 () Bool)

(assert (=> b!409334 (=> (not res!237013) (not e!245568))))

(declare-datatypes ((array!24775 0))(
  ( (array!24776 (arr!11837 (Array (_ BitVec 32) (_ BitVec 64))) (size!12189 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24775)

(declare-datatypes ((List!6853 0))(
  ( (Nil!6850) (Cons!6849 (h!7705 (_ BitVec 64)) (t!12027 List!6853)) )
))
(declare-fun arrayNoDuplicates!0 (array!24775 (_ BitVec 32) List!6853) Bool)

(assert (=> b!409334 (= res!237013 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6850))))

(declare-fun b!409335 () Bool)

(assert (=> b!409335 (= e!245563 false)))

(declare-datatypes ((V!15039 0))(
  ( (V!15040 (val!5270 Int)) )
))
(declare-fun minValue!515 () V!15039)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4882 0))(
  ( (ValueCellFull!4882 (v!7517 V!15039)) (EmptyCell!4882) )
))
(declare-datatypes ((array!24777 0))(
  ( (array!24778 (arr!11838 (Array (_ BitVec 32) ValueCell!4882)) (size!12190 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24777)

(declare-fun zeroValue!515 () V!15039)

(declare-datatypes ((tuple2!6830 0))(
  ( (tuple2!6831 (_1!3426 (_ BitVec 64)) (_2!3426 V!15039)) )
))
(declare-datatypes ((List!6854 0))(
  ( (Nil!6851) (Cons!6850 (h!7706 tuple2!6830) (t!12028 List!6854)) )
))
(declare-datatypes ((ListLongMap!5743 0))(
  ( (ListLongMap!5744 (toList!2887 List!6854)) )
))
(declare-fun lt!188932 () ListLongMap!5743)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1095 (array!24775 array!24777 (_ BitVec 32) (_ BitVec 32) V!15039 V!15039 (_ BitVec 32) Int) ListLongMap!5743)

(assert (=> b!409335 (= lt!188932 (getCurrentListMapNoExtraKeys!1095 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409336 () Bool)

(declare-fun e!245564 () Bool)

(declare-fun e!245567 () Bool)

(declare-fun mapRes!17298 () Bool)

(assert (=> b!409336 (= e!245564 (and e!245567 mapRes!17298))))

(declare-fun condMapEmpty!17298 () Bool)

(declare-fun mapDefault!17298 () ValueCell!4882)

