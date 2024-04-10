; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109634 () Bool)

(assert start!109634)

(declare-fun b_free!29123 () Bool)

(declare-fun b_next!29123 () Bool)

(assert (=> start!109634 (= b_free!29123 (not b_next!29123))))

(declare-fun tp!102487 () Bool)

(declare-fun b_and!47213 () Bool)

(assert (=> start!109634 (= tp!102487 b_and!47213)))

(declare-fun b!1298707 () Bool)

(declare-fun res!863112 () Bool)

(declare-fun e!740894 () Bool)

(assert (=> b!1298707 (=> (not res!863112) (not e!740894))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86532 0))(
  ( (array!86533 (arr!41767 (Array (_ BitVec 32) (_ BitVec 64))) (size!42317 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86532)

(assert (=> b!1298707 (= res!863112 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42317 _keys!1741))))))

(declare-fun b!1298708 () Bool)

(declare-fun res!863110 () Bool)

(assert (=> b!1298708 (=> (not res!863110) (not e!740894))))

(declare-datatypes ((List!29642 0))(
  ( (Nil!29639) (Cons!29638 (h!30847 (_ BitVec 64)) (t!43206 List!29642)) )
))
(declare-fun arrayNoDuplicates!0 (array!86532 (_ BitVec 32) List!29642) Bool)

(assert (=> b!1298708 (= res!863110 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29639))))

(declare-fun b!1298709 () Bool)

(declare-fun res!863113 () Bool)

(assert (=> b!1298709 (=> (not res!863113) (not e!740894))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86532 (_ BitVec 32)) Bool)

(assert (=> b!1298709 (= res!863113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298710 () Bool)

(declare-fun e!740897 () Bool)

(declare-fun e!740895 () Bool)

(declare-fun mapRes!53705 () Bool)

(assert (=> b!1298710 (= e!740897 (and e!740895 mapRes!53705))))

(declare-fun condMapEmpty!53705 () Bool)

(declare-datatypes ((V!51453 0))(
  ( (V!51454 (val!17456 Int)) )
))
(declare-datatypes ((ValueCell!16483 0))(
  ( (ValueCellFull!16483 (v!20059 V!51453)) (EmptyCell!16483) )
))
(declare-datatypes ((array!86534 0))(
  ( (array!86535 (arr!41768 (Array (_ BitVec 32) ValueCell!16483)) (size!42318 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86534)

(declare-fun mapDefault!53705 () ValueCell!16483)

