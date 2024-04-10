; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110516 () Bool)

(assert start!110516)

(declare-fun b_free!29351 () Bool)

(declare-fun b_next!29351 () Bool)

(assert (=> start!110516 (= b_free!29351 (not b_next!29351))))

(declare-fun tp!103374 () Bool)

(declare-fun b_and!47559 () Bool)

(assert (=> start!110516 (= tp!103374 b_and!47559)))

(declare-fun b!1307351 () Bool)

(declare-fun res!867817 () Bool)

(declare-fun e!745996 () Bool)

(assert (=> b!1307351 (=> (not res!867817) (not e!745996))))

(declare-datatypes ((array!87166 0))(
  ( (array!87167 (arr!42063 (Array (_ BitVec 32) (_ BitVec 64))) (size!42613 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87166)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87166 (_ BitVec 32)) Bool)

(assert (=> b!1307351 (= res!867817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1307352 () Bool)

(declare-fun res!867816 () Bool)

(assert (=> b!1307352 (=> (not res!867816) (not e!745996))))

(declare-datatypes ((V!51877 0))(
  ( (V!51878 (val!17615 Int)) )
))
(declare-datatypes ((ValueCell!16642 0))(
  ( (ValueCellFull!16642 (v!20242 V!51877)) (EmptyCell!16642) )
))
(declare-datatypes ((array!87168 0))(
  ( (array!87169 (arr!42064 (Array (_ BitVec 32) ValueCell!16642)) (size!42614 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87168)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307352 (= res!867816 (and (= (size!42614 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42613 _keys!1628) (size!42614 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307353 () Bool)

(declare-fun res!867819 () Bool)

(assert (=> b!1307353 (=> (not res!867819) (not e!745996))))

(declare-datatypes ((List!29822 0))(
  ( (Nil!29819) (Cons!29818 (h!31027 (_ BitVec 64)) (t!43428 List!29822)) )
))
(declare-fun arrayNoDuplicates!0 (array!87166 (_ BitVec 32) List!29822) Bool)

(assert (=> b!1307353 (= res!867819 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29819))))

(declare-fun res!867815 () Bool)

(assert (=> start!110516 (=> (not res!867815) (not e!745996))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110516 (= res!867815 (validMask!0 mask!2040))))

(assert (=> start!110516 e!745996))

(assert (=> start!110516 tp!103374))

(declare-fun array_inv!31797 (array!87166) Bool)

(assert (=> start!110516 (array_inv!31797 _keys!1628)))

(assert (=> start!110516 true))

(declare-fun tp_is_empty!35081 () Bool)

(assert (=> start!110516 tp_is_empty!35081))

(declare-fun e!745994 () Bool)

(declare-fun array_inv!31798 (array!87168) Bool)

(assert (=> start!110516 (and (array_inv!31798 _values!1354) e!745994)))

(declare-fun mapIsEmpty!54250 () Bool)

(declare-fun mapRes!54250 () Bool)

(assert (=> mapIsEmpty!54250 mapRes!54250))

(declare-fun b!1307354 () Bool)

(declare-fun res!867818 () Bool)

(assert (=> b!1307354 (=> (not res!867818) (not e!745996))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307354 (= res!867818 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42613 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307355 () Bool)

(declare-fun e!745995 () Bool)

(assert (=> b!1307355 (= e!745995 tp_is_empty!35081)))

(declare-fun b!1307356 () Bool)

(assert (=> b!1307356 (= e!745994 (and e!745995 mapRes!54250))))

(declare-fun condMapEmpty!54250 () Bool)

(declare-fun mapDefault!54250 () ValueCell!16642)

