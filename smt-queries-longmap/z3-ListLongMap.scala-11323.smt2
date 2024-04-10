; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131844 () Bool)

(assert start!131844)

(declare-fun mapNonEmpty!58453 () Bool)

(declare-fun mapRes!58453 () Bool)

(declare-fun tp!110980 () Bool)

(declare-fun e!859058 () Bool)

(assert (=> mapNonEmpty!58453 (= mapRes!58453 (and tp!110980 e!859058))))

(declare-fun mapKey!58453 () (_ BitVec 32))

(declare-datatypes ((V!58887 0))(
  ( (V!58888 (val!18994 Int)) )
))
(declare-datatypes ((ValueCell!18006 0))(
  ( (ValueCellFull!18006 (v!21795 V!58887)) (EmptyCell!18006) )
))
(declare-datatypes ((array!102890 0))(
  ( (array!102891 (arr!49647 (Array (_ BitVec 32) ValueCell!18006)) (size!50197 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102890)

(declare-fun mapRest!58453 () (Array (_ BitVec 32) ValueCell!18006))

(declare-fun mapValue!58453 () ValueCell!18006)

(assert (=> mapNonEmpty!58453 (= (arr!49647 _values!470) (store mapRest!58453 mapKey!58453 mapValue!58453))))

(declare-fun b!1543551 () Bool)

(declare-fun res!1059049 () Bool)

(declare-fun e!859057 () Bool)

(assert (=> b!1543551 (=> (not res!1059049) (not e!859057))))

(declare-datatypes ((array!102892 0))(
  ( (array!102893 (arr!49648 (Array (_ BitVec 32) (_ BitVec 64))) (size!50198 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102892)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102892 (_ BitVec 32)) Bool)

(assert (=> b!1543551 (= res!1059049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58453 () Bool)

(assert (=> mapIsEmpty!58453 mapRes!58453))

(declare-fun b!1543552 () Bool)

(declare-fun e!859056 () Bool)

(declare-fun e!859059 () Bool)

(assert (=> b!1543552 (= e!859056 (and e!859059 mapRes!58453))))

(declare-fun condMapEmpty!58453 () Bool)

(declare-fun mapDefault!58453 () ValueCell!18006)

(assert (=> b!1543552 (= condMapEmpty!58453 (= (arr!49647 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18006)) mapDefault!58453)))))

(declare-fun b!1543553 () Bool)

(declare-fun tp_is_empty!37833 () Bool)

(assert (=> b!1543553 (= e!859059 tp_is_empty!37833)))

(declare-fun b!1543554 () Bool)

(assert (=> b!1543554 (= e!859058 tp_is_empty!37833)))

(declare-fun res!1059051 () Bool)

(assert (=> start!131844 (=> (not res!1059051) (not e!859057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131844 (= res!1059051 (validMask!0 mask!926))))

(assert (=> start!131844 e!859057))

(assert (=> start!131844 true))

(declare-fun array_inv!38623 (array!102890) Bool)

(assert (=> start!131844 (and (array_inv!38623 _values!470) e!859056)))

(declare-fun array_inv!38624 (array!102892) Bool)

(assert (=> start!131844 (array_inv!38624 _keys!618)))

(declare-fun b!1543555 () Bool)

(declare-fun res!1059050 () Bool)

(assert (=> b!1543555 (=> (not res!1059050) (not e!859057))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543555 (= res!1059050 (and (= (size!50197 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50198 _keys!618) (size!50197 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543556 () Bool)

(assert (=> b!1543556 (= e!859057 false)))

(declare-fun lt!666002 () Bool)

(declare-datatypes ((List!35925 0))(
  ( (Nil!35922) (Cons!35921 (h!37366 (_ BitVec 64)) (t!50619 List!35925)) )
))
(declare-fun arrayNoDuplicates!0 (array!102892 (_ BitVec 32) List!35925) Bool)

(assert (=> b!1543556 (= lt!666002 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35922))))

(assert (= (and start!131844 res!1059051) b!1543555))

(assert (= (and b!1543555 res!1059050) b!1543551))

(assert (= (and b!1543551 res!1059049) b!1543556))

(assert (= (and b!1543552 condMapEmpty!58453) mapIsEmpty!58453))

(assert (= (and b!1543552 (not condMapEmpty!58453)) mapNonEmpty!58453))

(get-info :version)

(assert (= (and mapNonEmpty!58453 ((_ is ValueCellFull!18006) mapValue!58453)) b!1543554))

(assert (= (and b!1543552 ((_ is ValueCellFull!18006) mapDefault!58453)) b!1543553))

(assert (= start!131844 b!1543552))

(declare-fun m!1424821 () Bool)

(assert (=> mapNonEmpty!58453 m!1424821))

(declare-fun m!1424823 () Bool)

(assert (=> b!1543551 m!1424823))

(declare-fun m!1424825 () Bool)

(assert (=> start!131844 m!1424825))

(declare-fun m!1424827 () Bool)

(assert (=> start!131844 m!1424827))

(declare-fun m!1424829 () Bool)

(assert (=> start!131844 m!1424829))

(declare-fun m!1424831 () Bool)

(assert (=> b!1543556 m!1424831))

(check-sat tp_is_empty!37833 (not b!1543556) (not b!1543551) (not start!131844) (not mapNonEmpty!58453))
(check-sat)
