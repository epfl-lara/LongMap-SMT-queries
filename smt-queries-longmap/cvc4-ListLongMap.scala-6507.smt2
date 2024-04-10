; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82886 () Bool)

(assert start!82886)

(declare-fun b_free!19013 () Bool)

(declare-fun b_next!19013 () Bool)

(assert (=> start!82886 (= b_free!19013 (not b_next!19013))))

(declare-fun tp!66167 () Bool)

(declare-fun b_and!30501 () Bool)

(assert (=> start!82886 (= tp!66167 b_and!30501)))

(declare-fun res!647333 () Bool)

(declare-fun e!545110 () Bool)

(assert (=> start!82886 (=> (not res!647333) (not e!545110))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82886 (= res!647333 (validMask!0 mask!2110))))

(assert (=> start!82886 e!545110))

(assert (=> start!82886 true))

(declare-datatypes ((V!34077 0))(
  ( (V!34078 (val!10961 Int)) )
))
(declare-datatypes ((ValueCell!10429 0))(
  ( (ValueCellFull!10429 (v!13519 V!34077)) (EmptyCell!10429) )
))
(declare-datatypes ((array!59717 0))(
  ( (array!59718 (arr!28727 (Array (_ BitVec 32) ValueCell!10429)) (size!29206 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59717)

(declare-fun e!545108 () Bool)

(declare-fun array_inv!22249 (array!59717) Bool)

(assert (=> start!82886 (and (array_inv!22249 _values!1400) e!545108)))

(declare-datatypes ((array!59719 0))(
  ( (array!59720 (arr!28728 (Array (_ BitVec 32) (_ BitVec 64))) (size!29207 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59719)

(declare-fun array_inv!22250 (array!59719) Bool)

(assert (=> start!82886 (array_inv!22250 _keys!1686)))

(assert (=> start!82886 tp!66167))

(declare-fun tp_is_empty!21821 () Bool)

(assert (=> start!82886 tp_is_empty!21821))

(declare-fun b!967053 () Bool)

(declare-fun e!545111 () Bool)

(declare-fun mapRes!34726 () Bool)

(assert (=> b!967053 (= e!545108 (and e!545111 mapRes!34726))))

(declare-fun condMapEmpty!34726 () Bool)

(declare-fun mapDefault!34726 () ValueCell!10429)

