; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110534 () Bool)

(assert start!110534)

(declare-fun b_free!29369 () Bool)

(declare-fun b_next!29369 () Bool)

(assert (=> start!110534 (= b_free!29369 (not b_next!29369))))

(declare-fun tp!103429 () Bool)

(declare-fun b_and!47577 () Bool)

(assert (=> start!110534 (= tp!103429 b_and!47577)))

(declare-fun b!1307567 () Bool)

(declare-fun e!746128 () Bool)

(declare-fun tp_is_empty!35099 () Bool)

(assert (=> b!1307567 (= e!746128 tp_is_empty!35099)))

(declare-fun b!1307568 () Bool)

(declare-fun res!867951 () Bool)

(declare-fun e!746129 () Bool)

(assert (=> b!1307568 (=> (not res!867951) (not e!746129))))

(declare-datatypes ((array!87198 0))(
  ( (array!87199 (arr!42079 (Array (_ BitVec 32) (_ BitVec 64))) (size!42629 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87198)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87198 (_ BitVec 32)) Bool)

(assert (=> b!1307568 (= res!867951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307569 () Bool)

(declare-fun e!746130 () Bool)

(declare-fun mapRes!54277 () Bool)

(assert (=> b!1307569 (= e!746130 (and e!746128 mapRes!54277))))

(declare-fun condMapEmpty!54277 () Bool)

(declare-datatypes ((V!51901 0))(
  ( (V!51902 (val!17624 Int)) )
))
(declare-datatypes ((ValueCell!16651 0))(
  ( (ValueCellFull!16651 (v!20251 V!51901)) (EmptyCell!16651) )
))
(declare-datatypes ((array!87200 0))(
  ( (array!87201 (arr!42080 (Array (_ BitVec 32) ValueCell!16651)) (size!42630 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87200)

(declare-fun mapDefault!54277 () ValueCell!16651)

