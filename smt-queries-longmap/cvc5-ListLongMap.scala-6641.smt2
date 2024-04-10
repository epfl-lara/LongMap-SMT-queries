; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83818 () Bool)

(assert start!83818)

(declare-fun b_free!19627 () Bool)

(declare-fun b_next!19627 () Bool)

(assert (=> start!83818 (= b_free!19627 (not b_next!19627))))

(declare-fun tp!68323 () Bool)

(declare-fun b_and!31343 () Bool)

(assert (=> start!83818 (= tp!68323 b_and!31343)))

(declare-fun b!979016 () Bool)

(declare-fun e!551895 () Bool)

(declare-fun e!551896 () Bool)

(declare-fun mapRes!35960 () Bool)

(assert (=> b!979016 (= e!551895 (and e!551896 mapRes!35960))))

(declare-fun condMapEmpty!35960 () Bool)

(declare-datatypes ((V!35145 0))(
  ( (V!35146 (val!11361 Int)) )
))
(declare-datatypes ((ValueCell!10829 0))(
  ( (ValueCellFull!10829 (v!13923 V!35145)) (EmptyCell!10829) )
))
(declare-datatypes ((array!61265 0))(
  ( (array!61266 (arr!29490 (Array (_ BitVec 32) ValueCell!10829)) (size!29969 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61265)

(declare-fun mapDefault!35960 () ValueCell!10829)

