; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110986 () Bool)

(assert start!110986)

(declare-fun b_free!29821 () Bool)

(declare-fun b_next!29821 () Bool)

(assert (=> start!110986 (= b_free!29821 (not b_next!29821))))

(declare-fun tp!104785 () Bool)

(declare-fun b_and!48029 () Bool)

(assert (=> start!110986 (= tp!104785 b_and!48029)))

(declare-fun mapIsEmpty!54955 () Bool)

(declare-fun mapRes!54955 () Bool)

(assert (=> mapIsEmpty!54955 mapRes!54955))

(declare-fun b!1313990 () Bool)

(declare-fun e!749520 () Bool)

(declare-fun tp_is_empty!35551 () Bool)

(assert (=> b!1313990 (= e!749520 tp_is_empty!35551)))

(declare-fun b!1313991 () Bool)

(declare-fun res!872339 () Bool)

(declare-fun e!749519 () Bool)

(assert (=> b!1313991 (=> (not res!872339) (not e!749519))))

(declare-datatypes ((array!88074 0))(
  ( (array!88075 (arr!42517 (Array (_ BitVec 32) (_ BitVec 64))) (size!43067 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88074)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313991 (= res!872339 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43067 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313992 () Bool)

(declare-fun e!749518 () Bool)

(declare-fun e!749522 () Bool)

(assert (=> b!1313992 (= e!749518 (and e!749522 mapRes!54955))))

(declare-fun condMapEmpty!54955 () Bool)

(declare-datatypes ((V!52505 0))(
  ( (V!52506 (val!17850 Int)) )
))
(declare-datatypes ((ValueCell!16877 0))(
  ( (ValueCellFull!16877 (v!20477 V!52505)) (EmptyCell!16877) )
))
(declare-datatypes ((array!88076 0))(
  ( (array!88077 (arr!42518 (Array (_ BitVec 32) ValueCell!16877)) (size!43068 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88076)

(declare-fun mapDefault!54955 () ValueCell!16877)

