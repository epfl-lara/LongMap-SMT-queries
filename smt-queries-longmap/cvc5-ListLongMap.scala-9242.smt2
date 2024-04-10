; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110800 () Bool)

(assert start!110800)

(declare-fun b_free!29635 () Bool)

(declare-fun b_next!29635 () Bool)

(assert (=> start!110800 (= b_free!29635 (not b_next!29635))))

(declare-fun tp!104227 () Bool)

(declare-fun b_and!47843 () Bool)

(assert (=> start!110800 (= tp!104227 b_and!47843)))

(declare-fun mapIsEmpty!54676 () Bool)

(declare-fun mapRes!54676 () Bool)

(assert (=> mapIsEmpty!54676 mapRes!54676))

(declare-fun b!1311407 () Bool)

(declare-fun e!748127 () Bool)

(declare-fun tp_is_empty!35365 () Bool)

(assert (=> b!1311407 (= e!748127 tp_is_empty!35365)))

(declare-fun res!870595 () Bool)

(declare-fun e!748125 () Bool)

(assert (=> start!110800 (=> (not res!870595) (not e!748125))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110800 (= res!870595 (validMask!0 mask!2040))))

(assert (=> start!110800 e!748125))

(assert (=> start!110800 tp!104227))

(declare-datatypes ((array!87718 0))(
  ( (array!87719 (arr!42339 (Array (_ BitVec 32) (_ BitVec 64))) (size!42889 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87718)

(declare-fun array_inv!31993 (array!87718) Bool)

(assert (=> start!110800 (array_inv!31993 _keys!1628)))

(assert (=> start!110800 true))

(assert (=> start!110800 tp_is_empty!35365))

(declare-datatypes ((V!52257 0))(
  ( (V!52258 (val!17757 Int)) )
))
(declare-datatypes ((ValueCell!16784 0))(
  ( (ValueCellFull!16784 (v!20384 V!52257)) (EmptyCell!16784) )
))
(declare-datatypes ((array!87720 0))(
  ( (array!87721 (arr!42340 (Array (_ BitVec 32) ValueCell!16784)) (size!42890 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87720)

(declare-fun e!748124 () Bool)

(declare-fun array_inv!31994 (array!87720) Bool)

(assert (=> start!110800 (and (array_inv!31994 _values!1354) e!748124)))

(declare-fun b!1311408 () Bool)

(declare-fun res!870597 () Bool)

(assert (=> b!1311408 (=> (not res!870597) (not e!748125))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1311408 (= res!870597 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42889 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311409 () Bool)

(declare-fun res!870594 () Bool)

(assert (=> b!1311409 (=> (not res!870594) (not e!748125))))

(declare-datatypes ((List!30025 0))(
  ( (Nil!30022) (Cons!30021 (h!31230 (_ BitVec 64)) (t!43631 List!30025)) )
))
(declare-fun arrayNoDuplicates!0 (array!87718 (_ BitVec 32) List!30025) Bool)

(assert (=> b!1311409 (= res!870594 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30022))))

(declare-fun b!1311410 () Bool)

(declare-fun e!748123 () Bool)

(assert (=> b!1311410 (= e!748124 (and e!748123 mapRes!54676))))

(declare-fun condMapEmpty!54676 () Bool)

(declare-fun mapDefault!54676 () ValueCell!16784)

