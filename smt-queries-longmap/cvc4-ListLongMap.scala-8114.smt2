; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99554 () Bool)

(assert start!99554)

(declare-fun b_free!25133 () Bool)

(declare-fun b_next!25133 () Bool)

(assert (=> start!99554 (= b_free!25133 (not b_next!25133))))

(declare-fun tp!88113 () Bool)

(declare-fun b_and!41133 () Bool)

(assert (=> start!99554 (= tp!88113 b_and!41133)))

(declare-fun b!1178165 () Bool)

(declare-fun res!782662 () Bool)

(declare-fun e!669770 () Bool)

(assert (=> b!1178165 (=> (not res!782662) (not e!669770))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178165 (= res!782662 (validKeyInArray!0 k!934))))

(declare-fun b!1178166 () Bool)

(declare-fun res!782657 () Bool)

(assert (=> b!1178166 (=> (not res!782657) (not e!669770))))

(declare-datatypes ((array!76129 0))(
  ( (array!76130 (arr!36714 (Array (_ BitVec 32) (_ BitVec 64))) (size!37250 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76129)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76129 (_ BitVec 32)) Bool)

(assert (=> b!1178166 (= res!782657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178167 () Bool)

(declare-fun e!669771 () Bool)

(declare-fun e!669780 () Bool)

(declare-fun mapRes!46322 () Bool)

(assert (=> b!1178167 (= e!669771 (and e!669780 mapRes!46322))))

(declare-fun condMapEmpty!46322 () Bool)

(declare-datatypes ((V!44677 0))(
  ( (V!44678 (val!14888 Int)) )
))
(declare-datatypes ((ValueCell!14122 0))(
  ( (ValueCellFull!14122 (v!17526 V!44677)) (EmptyCell!14122) )
))
(declare-datatypes ((array!76131 0))(
  ( (array!76132 (arr!36715 (Array (_ BitVec 32) ValueCell!14122)) (size!37251 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76131)

(declare-fun mapDefault!46322 () ValueCell!14122)

