; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83716 () Bool)

(assert start!83716)

(declare-fun b!977554 () Bool)

(declare-fun e!551119 () Bool)

(declare-fun e!551120 () Bool)

(declare-fun mapRes!35807 () Bool)

(assert (=> b!977554 (= e!551119 (and e!551120 mapRes!35807))))

(declare-fun condMapEmpty!35807 () Bool)

(declare-datatypes ((V!35009 0))(
  ( (V!35010 (val!11310 Int)) )
))
(declare-datatypes ((ValueCell!10778 0))(
  ( (ValueCellFull!10778 (v!13872 V!35009)) (EmptyCell!10778) )
))
(declare-datatypes ((array!61067 0))(
  ( (array!61068 (arr!29391 (Array (_ BitVec 32) ValueCell!10778)) (size!29870 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61067)

(declare-fun mapDefault!35807 () ValueCell!10778)

