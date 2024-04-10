; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20662 () Bool)

(assert start!20662)

(declare-fun b_free!5321 () Bool)

(declare-fun b_next!5321 () Bool)

(assert (=> start!20662 (= b_free!5321 (not b_next!5321))))

(declare-fun tp!18994 () Bool)

(declare-fun b_and!12067 () Bool)

(assert (=> start!20662 (= tp!18994 b_and!12067)))

(declare-fun b!206424 () Bool)

(declare-fun res!100002 () Bool)

(declare-fun e!134918 () Bool)

(assert (=> b!206424 (=> (not res!100002) (not e!134918))))

(declare-datatypes ((array!9565 0))(
  ( (array!9566 (arr!4533 (Array (_ BitVec 32) (_ BitVec 64))) (size!4858 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9565)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9565 (_ BitVec 32)) Bool)

(assert (=> b!206424 (= res!100002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206425 () Bool)

(declare-fun e!134922 () Bool)

(declare-fun tp_is_empty!5177 () Bool)

(assert (=> b!206425 (= e!134922 tp_is_empty!5177)))

(declare-fun b!206426 () Bool)

(declare-fun e!134923 () Bool)

(declare-fun mapRes!8834 () Bool)

(assert (=> b!206426 (= e!134923 (and e!134922 mapRes!8834))))

(declare-fun condMapEmpty!8834 () Bool)

(declare-datatypes ((V!6549 0))(
  ( (V!6550 (val!2633 Int)) )
))
(declare-datatypes ((ValueCell!2245 0))(
  ( (ValueCellFull!2245 (v!4603 V!6549)) (EmptyCell!2245) )
))
(declare-datatypes ((array!9567 0))(
  ( (array!9568 (arr!4534 (Array (_ BitVec 32) ValueCell!2245)) (size!4859 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9567)

(declare-fun mapDefault!8834 () ValueCell!2245)

