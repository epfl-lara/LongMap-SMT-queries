; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131792 () Bool)

(assert start!131792)

(declare-fun mapNonEmpty!58375 () Bool)

(declare-fun mapRes!58375 () Bool)

(declare-fun tp!110902 () Bool)

(declare-fun e!858665 () Bool)

(assert (=> mapNonEmpty!58375 (= mapRes!58375 (and tp!110902 e!858665))))

(declare-fun mapKey!58375 () (_ BitVec 32))

(declare-datatypes ((V!58817 0))(
  ( (V!58818 (val!18968 Int)) )
))
(declare-datatypes ((ValueCell!17980 0))(
  ( (ValueCellFull!17980 (v!21769 V!58817)) (EmptyCell!17980) )
))
(declare-datatypes ((array!102788 0))(
  ( (array!102789 (arr!49596 (Array (_ BitVec 32) ValueCell!17980)) (size!50146 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102788)

(declare-fun mapValue!58375 () ValueCell!17980)

(declare-fun mapRest!58375 () (Array (_ BitVec 32) ValueCell!17980))

(assert (=> mapNonEmpty!58375 (= (arr!49596 _values!470) (store mapRest!58375 mapKey!58375 mapValue!58375))))

(declare-fun b!1543083 () Bool)

(declare-fun res!1058817 () Bool)

(declare-fun e!858666 () Bool)

(assert (=> b!1543083 (=> (not res!1058817) (not e!858666))))

(declare-datatypes ((array!102790 0))(
  ( (array!102791 (arr!49597 (Array (_ BitVec 32) (_ BitVec 64))) (size!50147 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102790)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102790 (_ BitVec 32)) Bool)

(assert (=> b!1543083 (= res!1058817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543084 () Bool)

(declare-fun res!1058815 () Bool)

(assert (=> b!1543084 (=> (not res!1058815) (not e!858666))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543084 (= res!1058815 (and (= (size!50146 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50147 _keys!618) (size!50146 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543085 () Bool)

(assert (=> b!1543085 (= e!858666 false)))

(declare-fun lt!665924 () Bool)

(declare-datatypes ((List!35905 0))(
  ( (Nil!35902) (Cons!35901 (h!37346 (_ BitVec 64)) (t!50599 List!35905)) )
))
(declare-fun arrayNoDuplicates!0 (array!102790 (_ BitVec 32) List!35905) Bool)

(assert (=> b!1543085 (= lt!665924 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35902))))

(declare-fun mapIsEmpty!58375 () Bool)

(assert (=> mapIsEmpty!58375 mapRes!58375))

(declare-fun res!1058816 () Bool)

(assert (=> start!131792 (=> (not res!1058816) (not e!858666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131792 (= res!1058816 (validMask!0 mask!926))))

(assert (=> start!131792 e!858666))

(assert (=> start!131792 true))

(declare-fun e!858668 () Bool)

(declare-fun array_inv!38589 (array!102788) Bool)

(assert (=> start!131792 (and (array_inv!38589 _values!470) e!858668)))

(declare-fun array_inv!38590 (array!102790) Bool)

(assert (=> start!131792 (array_inv!38590 _keys!618)))

(declare-fun b!1543086 () Bool)

(declare-fun e!858667 () Bool)

(assert (=> b!1543086 (= e!858668 (and e!858667 mapRes!58375))))

(declare-fun condMapEmpty!58375 () Bool)

(declare-fun mapDefault!58375 () ValueCell!17980)

