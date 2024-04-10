; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110948 () Bool)

(assert start!110948)

(declare-fun b_free!29783 () Bool)

(declare-fun b_next!29783 () Bool)

(assert (=> start!110948 (= b_free!29783 (not b_next!29783))))

(declare-fun tp!104671 () Bool)

(declare-fun b_and!47991 () Bool)

(assert (=> start!110948 (= tp!104671 b_and!47991)))

(declare-fun b!1313534 () Bool)

(declare-fun res!872057 () Bool)

(declare-fun e!749234 () Bool)

(assert (=> b!1313534 (=> (not res!872057) (not e!749234))))

(declare-datatypes ((array!88004 0))(
  ( (array!88005 (arr!42482 (Array (_ BitVec 32) (_ BitVec 64))) (size!43032 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88004)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313534 (= res!872057 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43032 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313535 () Bool)

(declare-fun e!749235 () Bool)

(declare-fun e!749236 () Bool)

(declare-fun mapRes!54898 () Bool)

(assert (=> b!1313535 (= e!749235 (and e!749236 mapRes!54898))))

(declare-fun condMapEmpty!54898 () Bool)

(declare-datatypes ((V!52453 0))(
  ( (V!52454 (val!17831 Int)) )
))
(declare-datatypes ((ValueCell!16858 0))(
  ( (ValueCellFull!16858 (v!20458 V!52453)) (EmptyCell!16858) )
))
(declare-datatypes ((array!88006 0))(
  ( (array!88007 (arr!42483 (Array (_ BitVec 32) ValueCell!16858)) (size!43033 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88006)

(declare-fun mapDefault!54898 () ValueCell!16858)

