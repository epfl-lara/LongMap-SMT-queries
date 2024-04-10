; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38144 () Bool)

(assert start!38144)

(declare-fun b_free!9025 () Bool)

(declare-fun b_next!9025 () Bool)

(assert (=> start!38144 (= b_free!9025 (not b_next!9025))))

(declare-fun tp!31857 () Bool)

(declare-fun b_and!16387 () Bool)

(assert (=> start!38144 (= tp!31857 b_and!16387)))

(declare-fun mapIsEmpty!16140 () Bool)

(declare-fun mapRes!16140 () Bool)

(assert (=> mapIsEmpty!16140 mapRes!16140))

(declare-fun b!393074 () Bool)

(declare-fun e!238014 () Bool)

(declare-fun e!238020 () Bool)

(assert (=> b!393074 (= e!238014 (and e!238020 mapRes!16140))))

(declare-fun condMapEmpty!16140 () Bool)

(declare-datatypes ((V!14035 0))(
  ( (V!14036 (val!4893 Int)) )
))
(declare-datatypes ((ValueCell!4505 0))(
  ( (ValueCellFull!4505 (v!7130 V!14035)) (EmptyCell!4505) )
))
(declare-datatypes ((array!23303 0))(
  ( (array!23304 (arr!11110 (Array (_ BitVec 32) ValueCell!4505)) (size!11462 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23303)

(declare-fun mapDefault!16140 () ValueCell!4505)

