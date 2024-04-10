; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131716 () Bool)

(assert start!131716)

(declare-fun b!1542399 () Bool)

(declare-fun e!858096 () Bool)

(declare-fun tp_is_empty!37705 () Bool)

(assert (=> b!1542399 (= e!858096 tp_is_empty!37705)))

(declare-fun res!1058475 () Bool)

(declare-fun e!858097 () Bool)

(assert (=> start!131716 (=> (not res!1058475) (not e!858097))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131716 (= res!1058475 (validMask!0 mask!926))))

(assert (=> start!131716 e!858097))

(assert (=> start!131716 true))

(declare-datatypes ((V!58717 0))(
  ( (V!58718 (val!18930 Int)) )
))
(declare-datatypes ((ValueCell!17942 0))(
  ( (ValueCellFull!17942 (v!21731 V!58717)) (EmptyCell!17942) )
))
(declare-datatypes ((array!102640 0))(
  ( (array!102641 (arr!49522 (Array (_ BitVec 32) ValueCell!17942)) (size!50072 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102640)

(declare-fun e!858098 () Bool)

(declare-fun array_inv!38531 (array!102640) Bool)

(assert (=> start!131716 (and (array_inv!38531 _values!470) e!858098)))

(declare-datatypes ((array!102642 0))(
  ( (array!102643 (arr!49523 (Array (_ BitVec 32) (_ BitVec 64))) (size!50073 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102642)

(declare-fun array_inv!38532 (array!102642) Bool)

(assert (=> start!131716 (array_inv!38532 _keys!618)))

(declare-fun mapNonEmpty!58261 () Bool)

(declare-fun mapRes!58261 () Bool)

(declare-fun tp!110788 () Bool)

(declare-fun e!858099 () Bool)

(assert (=> mapNonEmpty!58261 (= mapRes!58261 (and tp!110788 e!858099))))

(declare-fun mapKey!58261 () (_ BitVec 32))

(declare-fun mapValue!58261 () ValueCell!17942)

(declare-fun mapRest!58261 () (Array (_ BitVec 32) ValueCell!17942))

(assert (=> mapNonEmpty!58261 (= (arr!49522 _values!470) (store mapRest!58261 mapKey!58261 mapValue!58261))))

(declare-fun mapIsEmpty!58261 () Bool)

(assert (=> mapIsEmpty!58261 mapRes!58261))

(declare-fun b!1542400 () Bool)

(assert (=> b!1542400 (= e!858097 false)))

(declare-fun lt!665810 () Bool)

(declare-datatypes ((List!35874 0))(
  ( (Nil!35871) (Cons!35870 (h!37315 (_ BitVec 64)) (t!50568 List!35874)) )
))
(declare-fun arrayNoDuplicates!0 (array!102642 (_ BitVec 32) List!35874) Bool)

(assert (=> b!1542400 (= lt!665810 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35871))))

(declare-fun b!1542401 () Bool)

(declare-fun res!1058473 () Bool)

(assert (=> b!1542401 (=> (not res!1058473) (not e!858097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102642 (_ BitVec 32)) Bool)

(assert (=> b!1542401 (= res!1058473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542402 () Bool)

(assert (=> b!1542402 (= e!858098 (and e!858096 mapRes!58261))))

(declare-fun condMapEmpty!58261 () Bool)

(declare-fun mapDefault!58261 () ValueCell!17942)

