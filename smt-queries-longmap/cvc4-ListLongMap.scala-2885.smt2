; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41444 () Bool)

(assert start!41444)

(declare-fun b_free!11123 () Bool)

(declare-fun b_next!11123 () Bool)

(assert (=> start!41444 (= b_free!11123 (not b_next!11123))))

(declare-fun tp!39363 () Bool)

(declare-fun b_and!19459 () Bool)

(assert (=> start!41444 (= tp!39363 b_and!19459)))

(declare-fun res!276902 () Bool)

(declare-fun e!270324 () Bool)

(assert (=> start!41444 (=> (not res!276902) (not e!270324))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41444 (= res!276902 (validMask!0 mask!1365))))

(assert (=> start!41444 e!270324))

(declare-fun tp_is_empty!12551 () Bool)

(assert (=> start!41444 tp_is_empty!12551))

(assert (=> start!41444 tp!39363))

(assert (=> start!41444 true))

(declare-datatypes ((array!28899 0))(
  ( (array!28900 (arr!13882 (Array (_ BitVec 32) (_ BitVec 64))) (size!14234 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28899)

(declare-fun array_inv!10034 (array!28899) Bool)

(assert (=> start!41444 (array_inv!10034 _keys!1025)))

(declare-datatypes ((V!17839 0))(
  ( (V!17840 (val!6320 Int)) )
))
(declare-datatypes ((ValueCell!5932 0))(
  ( (ValueCellFull!5932 (v!8607 V!17839)) (EmptyCell!5932) )
))
(declare-datatypes ((array!28901 0))(
  ( (array!28902 (arr!13883 (Array (_ BitVec 32) ValueCell!5932)) (size!14235 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28901)

(declare-fun e!270320 () Bool)

(declare-fun array_inv!10035 (array!28901) Bool)

(assert (=> start!41444 (and (array_inv!10035 _values!833) e!270320)))

(declare-fun b!463065 () Bool)

(declare-fun e!270323 () Bool)

(declare-fun mapRes!20500 () Bool)

(assert (=> b!463065 (= e!270320 (and e!270323 mapRes!20500))))

(declare-fun condMapEmpty!20500 () Bool)

(declare-fun mapDefault!20500 () ValueCell!5932)

