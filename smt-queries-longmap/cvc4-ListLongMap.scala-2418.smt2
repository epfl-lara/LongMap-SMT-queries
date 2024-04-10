; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38240 () Bool)

(assert start!38240)

(declare-fun b_free!9077 () Bool)

(declare-fun b_next!9077 () Bool)

(assert (=> start!38240 (= b_free!9077 (not b_next!9077))))

(declare-fun tp!32019 () Bool)

(declare-fun b_and!16463 () Bool)

(assert (=> start!38240 (= tp!32019 b_and!16463)))

(declare-fun res!226190 () Bool)

(declare-fun e!238839 () Bool)

(assert (=> start!38240 (=> (not res!226190) (not e!238839))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38240 (= res!226190 (validMask!0 mask!970))))

(assert (=> start!38240 e!238839))

(declare-datatypes ((V!14103 0))(
  ( (V!14104 (val!4919 Int)) )
))
(declare-datatypes ((ValueCell!4531 0))(
  ( (ValueCellFull!4531 (v!7164 V!14103)) (EmptyCell!4531) )
))
(declare-datatypes ((array!23407 0))(
  ( (array!23408 (arr!11160 (Array (_ BitVec 32) ValueCell!4531)) (size!11512 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23407)

(declare-fun e!238836 () Bool)

(declare-fun array_inv!8194 (array!23407) Bool)

(assert (=> start!38240 (and (array_inv!8194 _values!506) e!238836)))

(assert (=> start!38240 tp!32019))

(assert (=> start!38240 true))

(declare-fun tp_is_empty!9749 () Bool)

(assert (=> start!38240 tp_is_empty!9749))

(declare-datatypes ((array!23409 0))(
  ( (array!23410 (arr!11161 (Array (_ BitVec 32) (_ BitVec 64))) (size!11513 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23409)

(declare-fun array_inv!8195 (array!23409) Bool)

(assert (=> start!38240 (array_inv!8195 _keys!658)))

(declare-fun b!394582 () Bool)

(declare-fun e!238837 () Bool)

(declare-fun mapRes!16224 () Bool)

(assert (=> b!394582 (= e!238836 (and e!238837 mapRes!16224))))

(declare-fun condMapEmpty!16224 () Bool)

(declare-fun mapDefault!16224 () ValueCell!4531)

