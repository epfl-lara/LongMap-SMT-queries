; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3706 () Bool)

(assert start!3706)

(declare-fun b!25902 () Bool)

(declare-fun e!16798 () Bool)

(declare-fun e!16799 () Bool)

(declare-fun mapRes!1093 () Bool)

(assert (=> b!25902 (= e!16798 (and e!16799 mapRes!1093))))

(declare-fun condMapEmpty!1093 () Bool)

(declare-datatypes ((V!1235 0))(
  ( (V!1236 (val!555 Int)) )
))
(declare-datatypes ((ValueCell!329 0))(
  ( (ValueCellFull!329 (v!1640 V!1235)) (EmptyCell!329) )
))
(declare-datatypes ((array!1357 0))(
  ( (array!1358 (arr!639 (Array (_ BitVec 32) ValueCell!329)) (size!740 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1357)

(declare-fun mapDefault!1093 () ValueCell!329)

