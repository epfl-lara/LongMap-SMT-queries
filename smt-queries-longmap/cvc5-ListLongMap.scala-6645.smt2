; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83842 () Bool)

(assert start!83842)

(declare-fun b_free!19651 () Bool)

(declare-fun b_next!19651 () Bool)

(assert (=> start!83842 (= b_free!19651 (not b_next!19651))))

(declare-fun tp!68395 () Bool)

(declare-fun b_and!31391 () Bool)

(assert (=> start!83842 (= tp!68395 b_and!31391)))

(declare-fun mapIsEmpty!35996 () Bool)

(declare-fun mapRes!35996 () Bool)

(assert (=> mapIsEmpty!35996 mapRes!35996))

(declare-fun b!979437 () Bool)

(declare-fun res!655468 () Bool)

(declare-fun e!552114 () Bool)

(assert (=> b!979437 (=> (not res!655468) (not e!552114))))

(declare-datatypes ((array!61307 0))(
  ( (array!61308 (arr!29511 (Array (_ BitVec 32) (_ BitVec 64))) (size!29990 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61307)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979437 (= res!655468 (validKeyInArray!0 (select (arr!29511 _keys!1544) from!1932)))))

(declare-fun b!979438 () Bool)

(declare-fun e!552112 () Bool)

(declare-fun e!552110 () Bool)

(assert (=> b!979438 (= e!552112 (and e!552110 mapRes!35996))))

(declare-fun condMapEmpty!35996 () Bool)

(declare-datatypes ((V!35177 0))(
  ( (V!35178 (val!11373 Int)) )
))
(declare-datatypes ((ValueCell!10841 0))(
  ( (ValueCellFull!10841 (v!13935 V!35177)) (EmptyCell!10841) )
))
(declare-datatypes ((array!61309 0))(
  ( (array!61310 (arr!29512 (Array (_ BitVec 32) ValueCell!10841)) (size!29991 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61309)

(declare-fun mapDefault!35996 () ValueCell!10841)

