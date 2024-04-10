; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83702 () Bool)

(assert start!83702)

(declare-fun b!977428 () Bool)

(declare-fun e!551016 () Bool)

(declare-fun e!551012 () Bool)

(declare-fun mapRes!35786 () Bool)

(assert (=> b!977428 (= e!551016 (and e!551012 mapRes!35786))))

(declare-fun condMapEmpty!35786 () Bool)

(declare-datatypes ((V!34989 0))(
  ( (V!34990 (val!11303 Int)) )
))
(declare-datatypes ((ValueCell!10771 0))(
  ( (ValueCellFull!10771 (v!13865 V!34989)) (EmptyCell!10771) )
))
(declare-datatypes ((array!61045 0))(
  ( (array!61046 (arr!29380 (Array (_ BitVec 32) ValueCell!10771)) (size!29859 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61045)

(declare-fun mapDefault!35786 () ValueCell!10771)

