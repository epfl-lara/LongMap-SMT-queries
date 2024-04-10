; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!604 () Bool)

(assert start!604)

(declare-fun b_free!77 () Bool)

(declare-fun b_next!77 () Bool)

(assert (=> start!604 (= b_free!77 (not b_next!77))))

(declare-fun tp!449 () Bool)

(declare-fun b_and!215 () Bool)

(assert (=> start!604 (= tp!449 b_and!215)))

(declare-fun b!3742 () Bool)

(declare-fun e!1878 () Bool)

(declare-fun e!1880 () Bool)

(declare-fun mapRes!191 () Bool)

(assert (=> b!3742 (= e!1878 (and e!1880 mapRes!191))))

(declare-fun condMapEmpty!191 () Bool)

(declare-datatypes ((V!383 0))(
  ( (V!384 (val!83 Int)) )
))
(declare-datatypes ((ValueCell!61 0))(
  ( (ValueCellFull!61 (v!1170 V!383)) (EmptyCell!61) )
))
(declare-datatypes ((array!247 0))(
  ( (array!248 (arr!116 (Array (_ BitVec 32) ValueCell!61)) (size!178 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!247)

(declare-fun mapDefault!191 () ValueCell!61)

