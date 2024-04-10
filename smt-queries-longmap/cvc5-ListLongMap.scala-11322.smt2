; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131836 () Bool)

(assert start!131836)

(declare-fun b!1543479 () Bool)

(declare-fun res!1059013 () Bool)

(declare-fun e!858995 () Bool)

(assert (=> b!1543479 (=> (not res!1059013) (not e!858995))))

(declare-datatypes ((array!102874 0))(
  ( (array!102875 (arr!49639 (Array (_ BitVec 32) (_ BitVec 64))) (size!50189 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102874)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102874 (_ BitVec 32)) Bool)

(assert (=> b!1543479 (= res!1059013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543480 () Bool)

(declare-fun e!858999 () Bool)

(declare-fun tp_is_empty!37825 () Bool)

(assert (=> b!1543480 (= e!858999 tp_is_empty!37825)))

(declare-fun res!1059014 () Bool)

(assert (=> start!131836 (=> (not res!1059014) (not e!858995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131836 (= res!1059014 (validMask!0 mask!926))))

(assert (=> start!131836 e!858995))

(assert (=> start!131836 true))

(declare-datatypes ((V!58877 0))(
  ( (V!58878 (val!18990 Int)) )
))
(declare-datatypes ((ValueCell!18002 0))(
  ( (ValueCellFull!18002 (v!21791 V!58877)) (EmptyCell!18002) )
))
(declare-datatypes ((array!102876 0))(
  ( (array!102877 (arr!49640 (Array (_ BitVec 32) ValueCell!18002)) (size!50190 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102876)

(declare-fun e!858996 () Bool)

(declare-fun array_inv!38617 (array!102876) Bool)

(assert (=> start!131836 (and (array_inv!38617 _values!470) e!858996)))

(declare-fun array_inv!38618 (array!102874) Bool)

(assert (=> start!131836 (array_inv!38618 _keys!618)))

(declare-fun mapNonEmpty!58441 () Bool)

(declare-fun mapRes!58441 () Bool)

(declare-fun tp!110968 () Bool)

(declare-fun e!858997 () Bool)

(assert (=> mapNonEmpty!58441 (= mapRes!58441 (and tp!110968 e!858997))))

(declare-fun mapValue!58441 () ValueCell!18002)

(declare-fun mapRest!58441 () (Array (_ BitVec 32) ValueCell!18002))

(declare-fun mapKey!58441 () (_ BitVec 32))

(assert (=> mapNonEmpty!58441 (= (arr!49640 _values!470) (store mapRest!58441 mapKey!58441 mapValue!58441))))

(declare-fun mapIsEmpty!58441 () Bool)

(assert (=> mapIsEmpty!58441 mapRes!58441))

(declare-fun b!1543481 () Bool)

(assert (=> b!1543481 (= e!858997 tp_is_empty!37825)))

(declare-fun b!1543482 () Bool)

(assert (=> b!1543482 (= e!858996 (and e!858999 mapRes!58441))))

(declare-fun condMapEmpty!58441 () Bool)

(declare-fun mapDefault!58441 () ValueCell!18002)

