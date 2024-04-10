; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111130 () Bool)

(assert start!111130)

(declare-fun b_free!29965 () Bool)

(declare-fun b_next!29965 () Bool)

(assert (=> start!111130 (= b_free!29965 (not b_next!29965))))

(declare-fun tp!105216 () Bool)

(declare-fun b_and!48173 () Bool)

(assert (=> start!111130 (= tp!105216 b_and!48173)))

(declare-fun b!1315790 () Bool)

(declare-fun res!873492 () Bool)

(declare-fun e!750600 () Bool)

(assert (=> b!1315790 (=> (not res!873492) (not e!750600))))

(declare-datatypes ((array!88350 0))(
  ( (array!88351 (arr!42655 (Array (_ BitVec 32) (_ BitVec 64))) (size!43205 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88350)

(declare-datatypes ((List!30260 0))(
  ( (Nil!30257) (Cons!30256 (h!31465 (_ BitVec 64)) (t!43866 List!30260)) )
))
(declare-fun arrayNoDuplicates!0 (array!88350 (_ BitVec 32) List!30260) Bool)

(assert (=> b!1315790 (= res!873492 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30257))))

(declare-fun b!1315791 () Bool)

(declare-fun e!750599 () Bool)

(declare-fun e!750602 () Bool)

(declare-fun mapRes!55171 () Bool)

(assert (=> b!1315791 (= e!750599 (and e!750602 mapRes!55171))))

(declare-fun condMapEmpty!55171 () Bool)

(declare-datatypes ((V!52697 0))(
  ( (V!52698 (val!17922 Int)) )
))
(declare-datatypes ((ValueCell!16949 0))(
  ( (ValueCellFull!16949 (v!20549 V!52697)) (EmptyCell!16949) )
))
(declare-datatypes ((array!88352 0))(
  ( (array!88353 (arr!42656 (Array (_ BitVec 32) ValueCell!16949)) (size!43206 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88352)

(declare-fun mapDefault!55171 () ValueCell!16949)

