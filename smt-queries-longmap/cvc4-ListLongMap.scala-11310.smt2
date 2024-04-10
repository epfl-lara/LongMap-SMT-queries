; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131768 () Bool)

(assert start!131768)

(declare-fun mapIsEmpty!58339 () Bool)

(declare-fun mapRes!58339 () Bool)

(assert (=> mapIsEmpty!58339 mapRes!58339))

(declare-fun b!1542867 () Bool)

(declare-fun e!858488 () Bool)

(assert (=> b!1542867 (= e!858488 false)))

(declare-fun lt!665888 () Bool)

(declare-datatypes ((array!102742 0))(
  ( (array!102743 (arr!49573 (Array (_ BitVec 32) (_ BitVec 64))) (size!50123 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102742)

(declare-datatypes ((List!35895 0))(
  ( (Nil!35892) (Cons!35891 (h!37336 (_ BitVec 64)) (t!50589 List!35895)) )
))
(declare-fun arrayNoDuplicates!0 (array!102742 (_ BitVec 32) List!35895) Bool)

(assert (=> b!1542867 (= lt!665888 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35892))))

(declare-fun mapNonEmpty!58339 () Bool)

(declare-fun tp!110866 () Bool)

(declare-fun e!858486 () Bool)

(assert (=> mapNonEmpty!58339 (= mapRes!58339 (and tp!110866 e!858486))))

(declare-datatypes ((V!58785 0))(
  ( (V!58786 (val!18956 Int)) )
))
(declare-datatypes ((ValueCell!17968 0))(
  ( (ValueCellFull!17968 (v!21757 V!58785)) (EmptyCell!17968) )
))
(declare-datatypes ((array!102744 0))(
  ( (array!102745 (arr!49574 (Array (_ BitVec 32) ValueCell!17968)) (size!50124 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102744)

(declare-fun mapValue!58339 () ValueCell!17968)

(declare-fun mapKey!58339 () (_ BitVec 32))

(declare-fun mapRest!58339 () (Array (_ BitVec 32) ValueCell!17968))

(assert (=> mapNonEmpty!58339 (= (arr!49574 _values!470) (store mapRest!58339 mapKey!58339 mapValue!58339))))

(declare-fun b!1542868 () Bool)

(declare-fun tp_is_empty!37757 () Bool)

(assert (=> b!1542868 (= e!858486 tp_is_empty!37757)))

(declare-fun b!1542869 () Bool)

(declare-fun res!1058709 () Bool)

(assert (=> b!1542869 (=> (not res!1058709) (not e!858488))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102742 (_ BitVec 32)) Bool)

(assert (=> b!1542869 (= res!1058709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542870 () Bool)

(declare-fun e!858489 () Bool)

(assert (=> b!1542870 (= e!858489 tp_is_empty!37757)))

(declare-fun res!1058708 () Bool)

(assert (=> start!131768 (=> (not res!1058708) (not e!858488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131768 (= res!1058708 (validMask!0 mask!926))))

(assert (=> start!131768 e!858488))

(assert (=> start!131768 true))

(declare-fun e!858487 () Bool)

(declare-fun array_inv!38573 (array!102744) Bool)

(assert (=> start!131768 (and (array_inv!38573 _values!470) e!858487)))

(declare-fun array_inv!38574 (array!102742) Bool)

(assert (=> start!131768 (array_inv!38574 _keys!618)))

(declare-fun b!1542871 () Bool)

(declare-fun res!1058707 () Bool)

(assert (=> b!1542871 (=> (not res!1058707) (not e!858488))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542871 (= res!1058707 (and (= (size!50124 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50123 _keys!618) (size!50124 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542872 () Bool)

(assert (=> b!1542872 (= e!858487 (and e!858489 mapRes!58339))))

(declare-fun condMapEmpty!58339 () Bool)

(declare-fun mapDefault!58339 () ValueCell!17968)

