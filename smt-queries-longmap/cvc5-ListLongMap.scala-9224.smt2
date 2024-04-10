; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110692 () Bool)

(assert start!110692)

(declare-fun b_free!29527 () Bool)

(declare-fun b_next!29527 () Bool)

(assert (=> start!110692 (= b_free!29527 (not b_next!29527))))

(declare-fun tp!103902 () Bool)

(declare-fun b_and!47735 () Bool)

(assert (=> start!110692 (= tp!103902 b_and!47735)))

(declare-fun b!1309831 () Bool)

(declare-fun e!747315 () Bool)

(declare-fun tp_is_empty!35257 () Bool)

(assert (=> b!1309831 (= e!747315 tp_is_empty!35257)))

(declare-fun b!1309832 () Bool)

(declare-fun res!869505 () Bool)

(declare-fun e!747317 () Bool)

(assert (=> b!1309832 (=> (not res!869505) (not e!747317))))

(declare-datatypes ((array!87504 0))(
  ( (array!87505 (arr!42232 (Array (_ BitVec 32) (_ BitVec 64))) (size!42782 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87504)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309832 (= res!869505 (not (= (select (arr!42232 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1309833 () Bool)

(declare-fun res!869503 () Bool)

(assert (=> b!1309833 (=> (not res!869503) (not e!747317))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87504 (_ BitVec 32)) Bool)

(assert (=> b!1309833 (= res!869503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309835 () Bool)

(declare-fun e!747314 () Bool)

(declare-fun mapRes!54514 () Bool)

(assert (=> b!1309835 (= e!747314 (and e!747315 mapRes!54514))))

(declare-fun condMapEmpty!54514 () Bool)

(declare-datatypes ((V!52113 0))(
  ( (V!52114 (val!17703 Int)) )
))
(declare-datatypes ((ValueCell!16730 0))(
  ( (ValueCellFull!16730 (v!20330 V!52113)) (EmptyCell!16730) )
))
(declare-datatypes ((array!87506 0))(
  ( (array!87507 (arr!42233 (Array (_ BitVec 32) ValueCell!16730)) (size!42783 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87506)

(declare-fun mapDefault!54514 () ValueCell!16730)

