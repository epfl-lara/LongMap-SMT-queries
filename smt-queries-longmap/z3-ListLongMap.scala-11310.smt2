; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131714 () Bool)

(assert start!131714)

(declare-fun b!1542518 () Bool)

(declare-fun e!858259 () Bool)

(declare-fun e!858261 () Bool)

(declare-fun mapRes!58333 () Bool)

(assert (=> b!1542518 (= e!858259 (and e!858261 mapRes!58333))))

(declare-fun condMapEmpty!58333 () Bool)

(declare-datatypes ((V!58781 0))(
  ( (V!58782 (val!18954 Int)) )
))
(declare-datatypes ((ValueCell!17966 0))(
  ( (ValueCellFull!17966 (v!21751 V!58781)) (EmptyCell!17966) )
))
(declare-datatypes ((array!102670 0))(
  ( (array!102671 (arr!49538 (Array (_ BitVec 32) ValueCell!17966)) (size!50090 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102670)

(declare-fun mapDefault!58333 () ValueCell!17966)

(assert (=> b!1542518 (= condMapEmpty!58333 (= (arr!49538 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17966)) mapDefault!58333)))))

(declare-fun res!1058562 () Bool)

(declare-fun e!858260 () Bool)

(assert (=> start!131714 (=> (not res!1058562) (not e!858260))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131714 (= res!1058562 (validMask!0 mask!926))))

(assert (=> start!131714 e!858260))

(assert (=> start!131714 true))

(declare-fun array_inv!38735 (array!102670) Bool)

(assert (=> start!131714 (and (array_inv!38735 _values!470) e!858259)))

(declare-datatypes ((array!102672 0))(
  ( (array!102673 (arr!49539 (Array (_ BitVec 32) (_ BitVec 64))) (size!50091 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102672)

(declare-fun array_inv!38736 (array!102672) Bool)

(assert (=> start!131714 (array_inv!38736 _keys!618)))

(declare-fun mapIsEmpty!58333 () Bool)

(assert (=> mapIsEmpty!58333 mapRes!58333))

(declare-fun b!1542519 () Bool)

(declare-fun e!858257 () Bool)

(declare-fun tp_is_empty!37753 () Bool)

(assert (=> b!1542519 (= e!858257 tp_is_empty!37753)))

(declare-fun b!1542520 () Bool)

(declare-fun res!1058560 () Bool)

(assert (=> b!1542520 (=> (not res!1058560) (not e!858260))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542520 (= res!1058560 (and (= (size!50090 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50091 _keys!618) (size!50090 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542521 () Bool)

(declare-fun res!1058561 () Bool)

(assert (=> b!1542521 (=> (not res!1058561) (not e!858260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102672 (_ BitVec 32)) Bool)

(assert (=> b!1542521 (= res!1058561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58333 () Bool)

(declare-fun tp!110861 () Bool)

(assert (=> mapNonEmpty!58333 (= mapRes!58333 (and tp!110861 e!858257))))

(declare-fun mapValue!58333 () ValueCell!17966)

(declare-fun mapKey!58333 () (_ BitVec 32))

(declare-fun mapRest!58333 () (Array (_ BitVec 32) ValueCell!17966))

(assert (=> mapNonEmpty!58333 (= (arr!49538 _values!470) (store mapRest!58333 mapKey!58333 mapValue!58333))))

(declare-fun b!1542522 () Bool)

(assert (=> b!1542522 (= e!858260 false)))

(declare-fun lt!665596 () Bool)

(declare-datatypes ((List!35944 0))(
  ( (Nil!35941) (Cons!35940 (h!37386 (_ BitVec 64)) (t!50630 List!35944)) )
))
(declare-fun arrayNoDuplicates!0 (array!102672 (_ BitVec 32) List!35944) Bool)

(assert (=> b!1542522 (= lt!665596 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35941))))

(declare-fun b!1542523 () Bool)

(assert (=> b!1542523 (= e!858261 tp_is_empty!37753)))

(assert (= (and start!131714 res!1058562) b!1542520))

(assert (= (and b!1542520 res!1058560) b!1542521))

(assert (= (and b!1542521 res!1058561) b!1542522))

(assert (= (and b!1542518 condMapEmpty!58333) mapIsEmpty!58333))

(assert (= (and b!1542518 (not condMapEmpty!58333)) mapNonEmpty!58333))

(get-info :version)

(assert (= (and mapNonEmpty!58333 ((_ is ValueCellFull!17966) mapValue!58333)) b!1542519))

(assert (= (and b!1542518 ((_ is ValueCellFull!17966) mapDefault!58333)) b!1542523))

(assert (= start!131714 b!1542518))

(declare-fun m!1423449 () Bool)

(assert (=> start!131714 m!1423449))

(declare-fun m!1423451 () Bool)

(assert (=> start!131714 m!1423451))

(declare-fun m!1423453 () Bool)

(assert (=> start!131714 m!1423453))

(declare-fun m!1423455 () Bool)

(assert (=> b!1542521 m!1423455))

(declare-fun m!1423457 () Bool)

(assert (=> mapNonEmpty!58333 m!1423457))

(declare-fun m!1423459 () Bool)

(assert (=> b!1542522 m!1423459))

(check-sat tp_is_empty!37753 (not start!131714) (not b!1542522) (not mapNonEmpty!58333) (not b!1542521))
(check-sat)
