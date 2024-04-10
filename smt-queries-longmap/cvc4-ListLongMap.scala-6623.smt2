; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83714 () Bool)

(assert start!83714)

(declare-fun b!977536 () Bool)

(declare-fun e!551103 () Bool)

(declare-fun e!551104 () Bool)

(declare-fun mapRes!35804 () Bool)

(assert (=> b!977536 (= e!551103 (and e!551104 mapRes!35804))))

(declare-fun condMapEmpty!35804 () Bool)

(declare-datatypes ((V!35005 0))(
  ( (V!35006 (val!11309 Int)) )
))
(declare-datatypes ((ValueCell!10777 0))(
  ( (ValueCellFull!10777 (v!13871 V!35005)) (EmptyCell!10777) )
))
(declare-datatypes ((array!61065 0))(
  ( (array!61066 (arr!29390 (Array (_ BitVec 32) ValueCell!10777)) (size!29869 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61065)

(declare-fun mapDefault!35804 () ValueCell!10777)

