; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82882 () Bool)

(assert start!82882)

(declare-fun b_free!19009 () Bool)

(declare-fun b_next!19009 () Bool)

(assert (=> start!82882 (= b_free!19009 (not b_next!19009))))

(declare-fun tp!66155 () Bool)

(declare-fun b_and!30497 () Bool)

(assert (=> start!82882 (= tp!66155 b_and!30497)))

(declare-fun b!966987 () Bool)

(declare-fun e!545077 () Bool)

(declare-fun e!545080 () Bool)

(declare-fun mapRes!34720 () Bool)

(assert (=> b!966987 (= e!545077 (and e!545080 mapRes!34720))))

(declare-fun condMapEmpty!34720 () Bool)

(declare-datatypes ((V!34073 0))(
  ( (V!34074 (val!10959 Int)) )
))
(declare-datatypes ((ValueCell!10427 0))(
  ( (ValueCellFull!10427 (v!13517 V!34073)) (EmptyCell!10427) )
))
(declare-datatypes ((array!59711 0))(
  ( (array!59712 (arr!28724 (Array (_ BitVec 32) ValueCell!10427)) (size!29203 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59711)

(declare-fun mapDefault!34720 () ValueCell!10427)

