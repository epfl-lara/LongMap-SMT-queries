; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131762 () Bool)

(assert start!131762)

(declare-fun mapIsEmpty!58330 () Bool)

(declare-fun mapRes!58330 () Bool)

(assert (=> mapIsEmpty!58330 mapRes!58330))

(declare-fun b!1542813 () Bool)

(declare-fun e!858442 () Bool)

(declare-fun tp_is_empty!37751 () Bool)

(assert (=> b!1542813 (= e!858442 tp_is_empty!37751)))

(declare-fun b!1542814 () Bool)

(declare-fun res!1058680 () Bool)

(declare-fun e!858441 () Bool)

(assert (=> b!1542814 (=> (not res!1058680) (not e!858441))))

(declare-datatypes ((array!102730 0))(
  ( (array!102731 (arr!49567 (Array (_ BitVec 32) (_ BitVec 64))) (size!50117 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102730)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58777 0))(
  ( (V!58778 (val!18953 Int)) )
))
(declare-datatypes ((ValueCell!17965 0))(
  ( (ValueCellFull!17965 (v!21754 V!58777)) (EmptyCell!17965) )
))
(declare-datatypes ((array!102732 0))(
  ( (array!102733 (arr!49568 (Array (_ BitVec 32) ValueCell!17965)) (size!50118 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102732)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542814 (= res!1058680 (and (= (size!50118 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50117 _keys!618) (size!50118 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58330 () Bool)

(declare-fun tp!110857 () Bool)

(declare-fun e!858440 () Bool)

(assert (=> mapNonEmpty!58330 (= mapRes!58330 (and tp!110857 e!858440))))

(declare-fun mapRest!58330 () (Array (_ BitVec 32) ValueCell!17965))

(declare-fun mapKey!58330 () (_ BitVec 32))

(declare-fun mapValue!58330 () ValueCell!17965)

(assert (=> mapNonEmpty!58330 (= (arr!49568 _values!470) (store mapRest!58330 mapKey!58330 mapValue!58330))))

(declare-fun b!1542815 () Bool)

(assert (=> b!1542815 (= e!858441 false)))

(declare-fun lt!665879 () Bool)

(declare-datatypes ((List!35893 0))(
  ( (Nil!35890) (Cons!35889 (h!37334 (_ BitVec 64)) (t!50587 List!35893)) )
))
(declare-fun arrayNoDuplicates!0 (array!102730 (_ BitVec 32) List!35893) Bool)

(assert (=> b!1542815 (= lt!665879 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35890))))

(declare-fun res!1058681 () Bool)

(assert (=> start!131762 (=> (not res!1058681) (not e!858441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131762 (= res!1058681 (validMask!0 mask!926))))

(assert (=> start!131762 e!858441))

(assert (=> start!131762 true))

(declare-fun e!858443 () Bool)

(declare-fun array_inv!38567 (array!102732) Bool)

(assert (=> start!131762 (and (array_inv!38567 _values!470) e!858443)))

(declare-fun array_inv!38568 (array!102730) Bool)

(assert (=> start!131762 (array_inv!38568 _keys!618)))

(declare-fun b!1542816 () Bool)

(assert (=> b!1542816 (= e!858443 (and e!858442 mapRes!58330))))

(declare-fun condMapEmpty!58330 () Bool)

(declare-fun mapDefault!58330 () ValueCell!17965)

