; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131798 () Bool)

(assert start!131798)

(declare-fun b!1543137 () Bool)

(declare-fun e!858712 () Bool)

(assert (=> b!1543137 (= e!858712 false)))

(declare-fun lt!665933 () Bool)

(declare-datatypes ((array!102800 0))(
  ( (array!102801 (arr!49602 (Array (_ BitVec 32) (_ BitVec 64))) (size!50152 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102800)

(declare-datatypes ((List!35907 0))(
  ( (Nil!35904) (Cons!35903 (h!37348 (_ BitVec 64)) (t!50601 List!35907)) )
))
(declare-fun arrayNoDuplicates!0 (array!102800 (_ BitVec 32) List!35907) Bool)

(assert (=> b!1543137 (= lt!665933 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35904))))

(declare-fun mapNonEmpty!58384 () Bool)

(declare-fun mapRes!58384 () Bool)

(declare-fun tp!110911 () Bool)

(declare-fun e!858713 () Bool)

(assert (=> mapNonEmpty!58384 (= mapRes!58384 (and tp!110911 e!858713))))

(declare-datatypes ((V!58825 0))(
  ( (V!58826 (val!18971 Int)) )
))
(declare-datatypes ((ValueCell!17983 0))(
  ( (ValueCellFull!17983 (v!21772 V!58825)) (EmptyCell!17983) )
))
(declare-fun mapValue!58384 () ValueCell!17983)

(declare-fun mapRest!58384 () (Array (_ BitVec 32) ValueCell!17983))

(declare-fun mapKey!58384 () (_ BitVec 32))

(declare-datatypes ((array!102802 0))(
  ( (array!102803 (arr!49603 (Array (_ BitVec 32) ValueCell!17983)) (size!50153 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102802)

(assert (=> mapNonEmpty!58384 (= (arr!49603 _values!470) (store mapRest!58384 mapKey!58384 mapValue!58384))))

(declare-fun b!1543139 () Bool)

(declare-fun res!1058843 () Bool)

(assert (=> b!1543139 (=> (not res!1058843) (not e!858712))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543139 (= res!1058843 (and (= (size!50153 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50152 _keys!618) (size!50153 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543140 () Bool)

(declare-fun e!858711 () Bool)

(declare-fun tp_is_empty!37787 () Bool)

(assert (=> b!1543140 (= e!858711 tp_is_empty!37787)))

(declare-fun b!1543141 () Bool)

(declare-fun res!1058842 () Bool)

(assert (=> b!1543141 (=> (not res!1058842) (not e!858712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102800 (_ BitVec 32)) Bool)

(assert (=> b!1543141 (= res!1058842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543138 () Bool)

(assert (=> b!1543138 (= e!858713 tp_is_empty!37787)))

(declare-fun res!1058844 () Bool)

(assert (=> start!131798 (=> (not res!1058844) (not e!858712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131798 (= res!1058844 (validMask!0 mask!926))))

(assert (=> start!131798 e!858712))

(assert (=> start!131798 true))

(declare-fun e!858710 () Bool)

(declare-fun array_inv!38593 (array!102802) Bool)

(assert (=> start!131798 (and (array_inv!38593 _values!470) e!858710)))

(declare-fun array_inv!38594 (array!102800) Bool)

(assert (=> start!131798 (array_inv!38594 _keys!618)))

(declare-fun mapIsEmpty!58384 () Bool)

(assert (=> mapIsEmpty!58384 mapRes!58384))

(declare-fun b!1543142 () Bool)

(assert (=> b!1543142 (= e!858710 (and e!858711 mapRes!58384))))

(declare-fun condMapEmpty!58384 () Bool)

(declare-fun mapDefault!58384 () ValueCell!17983)

