; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110542 () Bool)

(assert start!110542)

(declare-fun b_free!29377 () Bool)

(declare-fun b_next!29377 () Bool)

(assert (=> start!110542 (= b_free!29377 (not b_next!29377))))

(declare-fun tp!103453 () Bool)

(declare-fun b_and!47585 () Bool)

(assert (=> start!110542 (= tp!103453 b_and!47585)))

(declare-fun mapIsEmpty!54289 () Bool)

(declare-fun mapRes!54289 () Bool)

(assert (=> mapIsEmpty!54289 mapRes!54289))

(declare-fun b!1307663 () Bool)

(declare-fun res!868010 () Bool)

(declare-fun e!746191 () Bool)

(assert (=> b!1307663 (=> (not res!868010) (not e!746191))))

(declare-datatypes ((array!87214 0))(
  ( (array!87215 (arr!42087 (Array (_ BitVec 32) (_ BitVec 64))) (size!42637 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87214)

(declare-datatypes ((List!29834 0))(
  ( (Nil!29831) (Cons!29830 (h!31039 (_ BitVec 64)) (t!43440 List!29834)) )
))
(declare-fun arrayNoDuplicates!0 (array!87214 (_ BitVec 32) List!29834) Bool)

(assert (=> b!1307663 (= res!868010 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29831))))

(declare-fun b!1307664 () Bool)

(declare-fun e!746192 () Bool)

(declare-fun e!746190 () Bool)

(assert (=> b!1307664 (= e!746192 (and e!746190 mapRes!54289))))

(declare-fun condMapEmpty!54289 () Bool)

(declare-datatypes ((V!51913 0))(
  ( (V!51914 (val!17628 Int)) )
))
(declare-datatypes ((ValueCell!16655 0))(
  ( (ValueCellFull!16655 (v!20255 V!51913)) (EmptyCell!16655) )
))
(declare-datatypes ((array!87216 0))(
  ( (array!87217 (arr!42088 (Array (_ BitVec 32) ValueCell!16655)) (size!42638 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87216)

(declare-fun mapDefault!54289 () ValueCell!16655)

