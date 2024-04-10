; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110488 () Bool)

(assert start!110488)

(declare-fun b_free!29323 () Bool)

(declare-fun b_next!29323 () Bool)

(assert (=> start!110488 (= b_free!29323 (not b_next!29323))))

(declare-fun tp!103291 () Bool)

(declare-fun b_and!47531 () Bool)

(assert (=> start!110488 (= tp!103291 b_and!47531)))

(declare-fun b!1307015 () Bool)

(declare-fun res!867608 () Bool)

(declare-fun e!745784 () Bool)

(assert (=> b!1307015 (=> (not res!867608) (not e!745784))))

(declare-datatypes ((array!87112 0))(
  ( (array!87113 (arr!42036 (Array (_ BitVec 32) (_ BitVec 64))) (size!42586 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87112)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307015 (= res!867608 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42586 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307017 () Bool)

(declare-fun e!745785 () Bool)

(declare-fun tp_is_empty!35053 () Bool)

(assert (=> b!1307017 (= e!745785 tp_is_empty!35053)))

(declare-fun mapIsEmpty!54208 () Bool)

(declare-fun mapRes!54208 () Bool)

(assert (=> mapIsEmpty!54208 mapRes!54208))

(declare-fun b!1307018 () Bool)

(declare-fun e!745786 () Bool)

(assert (=> b!1307018 (= e!745786 (and e!745785 mapRes!54208))))

(declare-fun condMapEmpty!54208 () Bool)

(declare-datatypes ((V!51841 0))(
  ( (V!51842 (val!17601 Int)) )
))
(declare-datatypes ((ValueCell!16628 0))(
  ( (ValueCellFull!16628 (v!20228 V!51841)) (EmptyCell!16628) )
))
(declare-datatypes ((array!87114 0))(
  ( (array!87115 (arr!42037 (Array (_ BitVec 32) ValueCell!16628)) (size!42587 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87114)

(declare-fun mapDefault!54208 () ValueCell!16628)

