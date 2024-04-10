; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110590 () Bool)

(assert start!110590)

(declare-fun b_free!29425 () Bool)

(declare-fun b_next!29425 () Bool)

(assert (=> start!110590 (= b_free!29425 (not b_next!29425))))

(declare-fun tp!103596 () Bool)

(declare-fun b_and!47633 () Bool)

(assert (=> start!110590 (= tp!103596 b_and!47633)))

(declare-fun b!1308427 () Bool)

(declare-fun res!868564 () Bool)

(declare-fun e!746548 () Bool)

(assert (=> b!1308427 (=> (not res!868564) (not e!746548))))

(declare-datatypes ((array!87308 0))(
  ( (array!87309 (arr!42134 (Array (_ BitVec 32) (_ BitVec 64))) (size!42684 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87308)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51977 0))(
  ( (V!51978 (val!17652 Int)) )
))
(declare-datatypes ((ValueCell!16679 0))(
  ( (ValueCellFull!16679 (v!20279 V!51977)) (EmptyCell!16679) )
))
(declare-datatypes ((array!87310 0))(
  ( (array!87311 (arr!42135 (Array (_ BitVec 32) ValueCell!16679)) (size!42685 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87310)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308427 (= res!868564 (and (= (size!42685 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42684 _keys!1628) (size!42685 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1308428 () Bool)

(declare-fun e!746552 () Bool)

(declare-fun tp_is_empty!35155 () Bool)

(assert (=> b!1308428 (= e!746552 tp_is_empty!35155)))

(declare-fun b!1308429 () Bool)

(declare-fun res!868558 () Bool)

(assert (=> b!1308429 (=> (not res!868558) (not e!746548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87308 (_ BitVec 32)) Bool)

(assert (=> b!1308429 (= res!868558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!868561 () Bool)

(assert (=> start!110590 (=> (not res!868561) (not e!746548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110590 (= res!868561 (validMask!0 mask!2040))))

(assert (=> start!110590 e!746548))

(assert (=> start!110590 tp!103596))

(declare-fun array_inv!31845 (array!87308) Bool)

(assert (=> start!110590 (array_inv!31845 _keys!1628)))

(assert (=> start!110590 true))

(assert (=> start!110590 tp_is_empty!35155))

(declare-fun e!746549 () Bool)

(declare-fun array_inv!31846 (array!87310) Bool)

(assert (=> start!110590 (and (array_inv!31846 _values!1354) e!746549)))

(declare-fun b!1308430 () Bool)

(declare-fun res!868563 () Bool)

(assert (=> b!1308430 (=> (not res!868563) (not e!746548))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1308430 (= res!868563 (not (= (select (arr!42134 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1308431 () Bool)

(declare-fun mapRes!54361 () Bool)

(assert (=> b!1308431 (= e!746549 (and e!746552 mapRes!54361))))

(declare-fun condMapEmpty!54361 () Bool)

(declare-fun mapDefault!54361 () ValueCell!16679)

