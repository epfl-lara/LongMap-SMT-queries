; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131780 () Bool)

(assert start!131780)

(declare-fun mapIsEmpty!58357 () Bool)

(declare-fun mapRes!58357 () Bool)

(assert (=> mapIsEmpty!58357 mapRes!58357))

(declare-fun b!1542975 () Bool)

(declare-fun e!858577 () Bool)

(declare-fun tp_is_empty!37769 () Bool)

(assert (=> b!1542975 (= e!858577 tp_is_empty!37769)))

(declare-fun b!1542976 () Bool)

(declare-fun res!1058763 () Bool)

(declare-fun e!858575 () Bool)

(assert (=> b!1542976 (=> (not res!1058763) (not e!858575))))

(declare-datatypes ((array!102764 0))(
  ( (array!102765 (arr!49584 (Array (_ BitVec 32) (_ BitVec 64))) (size!50134 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102764)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102764 (_ BitVec 32)) Bool)

(assert (=> b!1542976 (= res!1058763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542977 () Bool)

(assert (=> b!1542977 (= e!858575 false)))

(declare-fun lt!665906 () Bool)

(declare-datatypes ((List!35899 0))(
  ( (Nil!35896) (Cons!35895 (h!37340 (_ BitVec 64)) (t!50593 List!35899)) )
))
(declare-fun arrayNoDuplicates!0 (array!102764 (_ BitVec 32) List!35899) Bool)

(assert (=> b!1542977 (= lt!665906 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35896))))

(declare-fun b!1542978 () Bool)

(declare-fun e!858579 () Bool)

(assert (=> b!1542978 (= e!858579 tp_is_empty!37769)))

(declare-fun res!1058762 () Bool)

(assert (=> start!131780 (=> (not res!1058762) (not e!858575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131780 (= res!1058762 (validMask!0 mask!926))))

(assert (=> start!131780 e!858575))

(assert (=> start!131780 true))

(declare-datatypes ((V!58801 0))(
  ( (V!58802 (val!18962 Int)) )
))
(declare-datatypes ((ValueCell!17974 0))(
  ( (ValueCellFull!17974 (v!21763 V!58801)) (EmptyCell!17974) )
))
(declare-datatypes ((array!102766 0))(
  ( (array!102767 (arr!49585 (Array (_ BitVec 32) ValueCell!17974)) (size!50135 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102766)

(declare-fun e!858578 () Bool)

(declare-fun array_inv!38581 (array!102766) Bool)

(assert (=> start!131780 (and (array_inv!38581 _values!470) e!858578)))

(declare-fun array_inv!38582 (array!102764) Bool)

(assert (=> start!131780 (array_inv!38582 _keys!618)))

(declare-fun b!1542979 () Bool)

(assert (=> b!1542979 (= e!858578 (and e!858577 mapRes!58357))))

(declare-fun condMapEmpty!58357 () Bool)

(declare-fun mapDefault!58357 () ValueCell!17974)

