; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111122 () Bool)

(assert start!111122)

(declare-fun b_free!29957 () Bool)

(declare-fun b_next!29957 () Bool)

(assert (=> start!111122 (= b_free!29957 (not b_next!29957))))

(declare-fun tp!105193 () Bool)

(declare-fun b_and!48165 () Bool)

(assert (=> start!111122 (= tp!105193 b_and!48165)))

(declare-fun b!1315694 () Bool)

(declare-fun e!750539 () Bool)

(declare-fun e!750538 () Bool)

(declare-fun mapRes!55159 () Bool)

(assert (=> b!1315694 (= e!750539 (and e!750538 mapRes!55159))))

(declare-fun condMapEmpty!55159 () Bool)

(declare-datatypes ((V!52685 0))(
  ( (V!52686 (val!17918 Int)) )
))
(declare-datatypes ((ValueCell!16945 0))(
  ( (ValueCellFull!16945 (v!20545 V!52685)) (EmptyCell!16945) )
))
(declare-datatypes ((array!88336 0))(
  ( (array!88337 (arr!42648 (Array (_ BitVec 32) ValueCell!16945)) (size!43198 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88336)

(declare-fun mapDefault!55159 () ValueCell!16945)

