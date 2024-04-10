; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20704 () Bool)

(assert start!20704)

(declare-fun b_free!5363 () Bool)

(declare-fun b_next!5363 () Bool)

(assert (=> start!20704 (= b_free!5363 (not b_next!5363))))

(declare-fun tp!19120 () Bool)

(declare-fun b_and!12109 () Bool)

(assert (=> start!20704 (= tp!19120 b_and!12109)))

(declare-fun b!207056 () Bool)

(declare-fun res!100438 () Bool)

(declare-fun e!135238 () Bool)

(assert (=> b!207056 (=> (not res!100438) (not e!135238))))

(declare-datatypes ((array!9647 0))(
  ( (array!9648 (arr!4574 (Array (_ BitVec 32) (_ BitVec 64))) (size!4899 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9647)

(declare-datatypes ((List!2920 0))(
  ( (Nil!2917) (Cons!2916 (h!3558 (_ BitVec 64)) (t!7851 List!2920)) )
))
(declare-fun arrayNoDuplicates!0 (array!9647 (_ BitVec 32) List!2920) Bool)

(assert (=> b!207056 (= res!100438 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2917))))

(declare-fun b!207057 () Bool)

(declare-fun e!135239 () Bool)

(declare-fun tp_is_empty!5219 () Bool)

(assert (=> b!207057 (= e!135239 tp_is_empty!5219)))

(declare-fun res!100442 () Bool)

(assert (=> start!20704 (=> (not res!100442) (not e!135238))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20704 (= res!100442 (validMask!0 mask!1149))))

(assert (=> start!20704 e!135238))

(declare-datatypes ((V!6605 0))(
  ( (V!6606 (val!2654 Int)) )
))
(declare-datatypes ((ValueCell!2266 0))(
  ( (ValueCellFull!2266 (v!4624 V!6605)) (EmptyCell!2266) )
))
(declare-datatypes ((array!9649 0))(
  ( (array!9650 (arr!4575 (Array (_ BitVec 32) ValueCell!2266)) (size!4900 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9649)

(declare-fun e!135235 () Bool)

(declare-fun array_inv!3027 (array!9649) Bool)

(assert (=> start!20704 (and (array_inv!3027 _values!649) e!135235)))

(assert (=> start!20704 true))

(assert (=> start!20704 tp_is_empty!5219))

(declare-fun array_inv!3028 (array!9647) Bool)

(assert (=> start!20704 (array_inv!3028 _keys!825)))

(assert (=> start!20704 tp!19120))

(declare-fun b!207058 () Bool)

(declare-fun mapRes!8897 () Bool)

(assert (=> b!207058 (= e!135235 (and e!135239 mapRes!8897))))

(declare-fun condMapEmpty!8897 () Bool)

(declare-fun mapDefault!8897 () ValueCell!2266)

