; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110770 () Bool)

(assert start!110770)

(declare-fun b_free!29605 () Bool)

(declare-fun b_next!29605 () Bool)

(assert (=> start!110770 (= b_free!29605 (not b_next!29605))))

(declare-fun tp!104137 () Bool)

(declare-fun b_and!47813 () Bool)

(assert (=> start!110770 (= tp!104137 b_and!47813)))

(declare-fun b!1311047 () Bool)

(declare-fun e!747902 () Bool)

(declare-fun tp_is_empty!35335 () Bool)

(assert (=> b!1311047 (= e!747902 tp_is_empty!35335)))

(declare-fun b!1311048 () Bool)

(declare-fun res!870370 () Bool)

(declare-fun e!747898 () Bool)

(assert (=> b!1311048 (=> (not res!870370) (not e!747898))))

(declare-datatypes ((array!87658 0))(
  ( (array!87659 (arr!42309 (Array (_ BitVec 32) (_ BitVec 64))) (size!42859 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87658)

(declare-datatypes ((List!30004 0))(
  ( (Nil!30001) (Cons!30000 (h!31209 (_ BitVec 64)) (t!43610 List!30004)) )
))
(declare-fun arrayNoDuplicates!0 (array!87658 (_ BitVec 32) List!30004) Bool)

(assert (=> b!1311048 (= res!870370 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30001))))

(declare-fun b!1311049 () Bool)

(declare-fun e!747899 () Bool)

(declare-fun mapRes!54631 () Bool)

(assert (=> b!1311049 (= e!747899 (and e!747902 mapRes!54631))))

(declare-fun condMapEmpty!54631 () Bool)

(declare-datatypes ((V!52217 0))(
  ( (V!52218 (val!17742 Int)) )
))
(declare-datatypes ((ValueCell!16769 0))(
  ( (ValueCellFull!16769 (v!20369 V!52217)) (EmptyCell!16769) )
))
(declare-datatypes ((array!87660 0))(
  ( (array!87661 (arr!42310 (Array (_ BitVec 32) ValueCell!16769)) (size!42860 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87660)

(declare-fun mapDefault!54631 () ValueCell!16769)

