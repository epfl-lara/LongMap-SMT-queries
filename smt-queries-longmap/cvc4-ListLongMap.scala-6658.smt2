; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83924 () Bool)

(assert start!83924)

(declare-fun b!980827 () Bool)

(declare-fun e!552840 () Bool)

(declare-fun e!552843 () Bool)

(declare-fun mapRes!36119 () Bool)

(assert (=> b!980827 (= e!552840 (and e!552843 mapRes!36119))))

(declare-fun condMapEmpty!36119 () Bool)

(declare-datatypes ((V!35285 0))(
  ( (V!35286 (val!11414 Int)) )
))
(declare-datatypes ((ValueCell!10882 0))(
  ( (ValueCellFull!10882 (v!13976 V!35285)) (EmptyCell!10882) )
))
(declare-datatypes ((array!61459 0))(
  ( (array!61460 (arr!29587 (Array (_ BitVec 32) ValueCell!10882)) (size!30066 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61459)

(declare-fun mapDefault!36119 () ValueCell!10882)

