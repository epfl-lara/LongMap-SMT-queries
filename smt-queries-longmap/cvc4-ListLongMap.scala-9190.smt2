; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110492 () Bool)

(assert start!110492)

(declare-fun b_free!29327 () Bool)

(declare-fun b_next!29327 () Bool)

(assert (=> start!110492 (= b_free!29327 (not b_next!29327))))

(declare-fun tp!103303 () Bool)

(declare-fun b_and!47535 () Bool)

(assert (=> start!110492 (= tp!103303 b_and!47535)))

(declare-fun b!1307063 () Bool)

(declare-fun res!867636 () Bool)

(declare-fun e!745815 () Bool)

(assert (=> b!1307063 (=> (not res!867636) (not e!745815))))

(declare-datatypes ((array!87120 0))(
  ( (array!87121 (arr!42040 (Array (_ BitVec 32) (_ BitVec 64))) (size!42590 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87120)

(declare-datatypes ((List!29808 0))(
  ( (Nil!29805) (Cons!29804 (h!31013 (_ BitVec 64)) (t!43414 List!29808)) )
))
(declare-fun arrayNoDuplicates!0 (array!87120 (_ BitVec 32) List!29808) Bool)

(assert (=> b!1307063 (= res!867636 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29805))))

(declare-fun b!1307064 () Bool)

(declare-fun e!745813 () Bool)

(declare-fun tp_is_empty!35057 () Bool)

(assert (=> b!1307064 (= e!745813 tp_is_empty!35057)))

(declare-fun mapIsEmpty!54214 () Bool)

(declare-fun mapRes!54214 () Bool)

(assert (=> mapIsEmpty!54214 mapRes!54214))

(declare-fun b!1307065 () Bool)

(declare-fun res!867635 () Bool)

(assert (=> b!1307065 (=> (not res!867635) (not e!745815))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307065 (= res!867635 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42590 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307066 () Bool)

(declare-fun e!745817 () Bool)

(assert (=> b!1307066 (= e!745817 (and e!745813 mapRes!54214))))

(declare-fun condMapEmpty!54214 () Bool)

(declare-datatypes ((V!51845 0))(
  ( (V!51846 (val!17603 Int)) )
))
(declare-datatypes ((ValueCell!16630 0))(
  ( (ValueCellFull!16630 (v!20230 V!51845)) (EmptyCell!16630) )
))
(declare-datatypes ((array!87122 0))(
  ( (array!87123 (arr!42041 (Array (_ BitVec 32) ValueCell!16630)) (size!42591 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87122)

(declare-fun mapDefault!54214 () ValueCell!16630)

