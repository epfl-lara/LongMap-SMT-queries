; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111002 () Bool)

(assert start!111002)

(declare-fun b_free!29837 () Bool)

(declare-fun b_next!29837 () Bool)

(assert (=> start!111002 (= b_free!29837 (not b_next!29837))))

(declare-fun tp!104833 () Bool)

(declare-fun b_and!48045 () Bool)

(assert (=> start!111002 (= tp!104833 b_and!48045)))

(declare-fun mapNonEmpty!54979 () Bool)

(declare-fun mapRes!54979 () Bool)

(declare-fun tp!104832 () Bool)

(declare-fun e!749641 () Bool)

(assert (=> mapNonEmpty!54979 (= mapRes!54979 (and tp!104832 e!749641))))

(declare-datatypes ((V!52525 0))(
  ( (V!52526 (val!17858 Int)) )
))
(declare-datatypes ((ValueCell!16885 0))(
  ( (ValueCellFull!16885 (v!20485 V!52525)) (EmptyCell!16885) )
))
(declare-fun mapRest!54979 () (Array (_ BitVec 32) ValueCell!16885))

(declare-fun mapValue!54979 () ValueCell!16885)

(declare-datatypes ((array!88106 0))(
  ( (array!88107 (arr!42533 (Array (_ BitVec 32) ValueCell!16885)) (size!43083 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88106)

(declare-fun mapKey!54979 () (_ BitVec 32))

(assert (=> mapNonEmpty!54979 (= (arr!42533 _values!1354) (store mapRest!54979 mapKey!54979 mapValue!54979))))

(declare-fun b!1314182 () Bool)

(declare-fun res!872461 () Bool)

(declare-fun e!749639 () Bool)

(assert (=> b!1314182 (=> (not res!872461) (not e!749639))))

(declare-datatypes ((array!88108 0))(
  ( (array!88109 (arr!42534 (Array (_ BitVec 32) (_ BitVec 64))) (size!43084 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88108)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314182 (= res!872461 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43084 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314183 () Bool)

(declare-fun e!749640 () Bool)

(declare-fun e!749638 () Bool)

(assert (=> b!1314183 (= e!749640 (and e!749638 mapRes!54979))))

(declare-fun condMapEmpty!54979 () Bool)

(declare-fun mapDefault!54979 () ValueCell!16885)

