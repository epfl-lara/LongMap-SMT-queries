; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131738 () Bool)

(assert start!131738)

(declare-fun b!1542734 () Bool)

(declare-fun e!858439 () Bool)

(declare-fun e!858440 () Bool)

(declare-fun mapRes!58369 () Bool)

(assert (=> b!1542734 (= e!858439 (and e!858440 mapRes!58369))))

(declare-fun condMapEmpty!58369 () Bool)

(declare-datatypes ((V!58813 0))(
  ( (V!58814 (val!18966 Int)) )
))
(declare-datatypes ((ValueCell!17978 0))(
  ( (ValueCellFull!17978 (v!21763 V!58813)) (EmptyCell!17978) )
))
(declare-datatypes ((array!102714 0))(
  ( (array!102715 (arr!49560 (Array (_ BitVec 32) ValueCell!17978)) (size!50112 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102714)

(declare-fun mapDefault!58369 () ValueCell!17978)

(assert (=> b!1542734 (= condMapEmpty!58369 (= (arr!49560 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17978)) mapDefault!58369)))))

(declare-fun b!1542735 () Bool)

(declare-fun res!1058669 () Bool)

(declare-fun e!858437 () Bool)

(assert (=> b!1542735 (=> (not res!1058669) (not e!858437))))

(declare-datatypes ((array!102716 0))(
  ( (array!102717 (arr!49561 (Array (_ BitVec 32) (_ BitVec 64))) (size!50113 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102716)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1542735 (= res!1058669 (and (= (size!50112 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50113 _keys!618) (size!50112 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542736 () Bool)

(assert (=> b!1542736 (= e!858437 false)))

(declare-fun lt!665632 () Bool)

(declare-datatypes ((List!35950 0))(
  ( (Nil!35947) (Cons!35946 (h!37392 (_ BitVec 64)) (t!50636 List!35950)) )
))
(declare-fun arrayNoDuplicates!0 (array!102716 (_ BitVec 32) List!35950) Bool)

(assert (=> b!1542736 (= lt!665632 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35947))))

(declare-fun b!1542737 () Bool)

(declare-fun tp_is_empty!37777 () Bool)

(assert (=> b!1542737 (= e!858440 tp_is_empty!37777)))

(declare-fun mapNonEmpty!58369 () Bool)

(declare-fun tp!110897 () Bool)

(declare-fun e!858441 () Bool)

(assert (=> mapNonEmpty!58369 (= mapRes!58369 (and tp!110897 e!858441))))

(declare-fun mapValue!58369 () ValueCell!17978)

(declare-fun mapKey!58369 () (_ BitVec 32))

(declare-fun mapRest!58369 () (Array (_ BitVec 32) ValueCell!17978))

(assert (=> mapNonEmpty!58369 (= (arr!49560 _values!470) (store mapRest!58369 mapKey!58369 mapValue!58369))))

(declare-fun b!1542738 () Bool)

(declare-fun res!1058668 () Bool)

(assert (=> b!1542738 (=> (not res!1058668) (not e!858437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102716 (_ BitVec 32)) Bool)

(assert (=> b!1542738 (= res!1058668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058670 () Bool)

(assert (=> start!131738 (=> (not res!1058670) (not e!858437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131738 (= res!1058670 (validMask!0 mask!926))))

(assert (=> start!131738 e!858437))

(assert (=> start!131738 true))

(declare-fun array_inv!38753 (array!102714) Bool)

(assert (=> start!131738 (and (array_inv!38753 _values!470) e!858439)))

(declare-fun array_inv!38754 (array!102716) Bool)

(assert (=> start!131738 (array_inv!38754 _keys!618)))

(declare-fun mapIsEmpty!58369 () Bool)

(assert (=> mapIsEmpty!58369 mapRes!58369))

(declare-fun b!1542739 () Bool)

(assert (=> b!1542739 (= e!858441 tp_is_empty!37777)))

(assert (= (and start!131738 res!1058670) b!1542735))

(assert (= (and b!1542735 res!1058669) b!1542738))

(assert (= (and b!1542738 res!1058668) b!1542736))

(assert (= (and b!1542734 condMapEmpty!58369) mapIsEmpty!58369))

(assert (= (and b!1542734 (not condMapEmpty!58369)) mapNonEmpty!58369))

(get-info :version)

(assert (= (and mapNonEmpty!58369 ((_ is ValueCellFull!17978) mapValue!58369)) b!1542739))

(assert (= (and b!1542734 ((_ is ValueCellFull!17978) mapDefault!58369)) b!1542737))

(assert (= start!131738 b!1542734))

(declare-fun m!1423593 () Bool)

(assert (=> b!1542736 m!1423593))

(declare-fun m!1423595 () Bool)

(assert (=> mapNonEmpty!58369 m!1423595))

(declare-fun m!1423597 () Bool)

(assert (=> b!1542738 m!1423597))

(declare-fun m!1423599 () Bool)

(assert (=> start!131738 m!1423599))

(declare-fun m!1423601 () Bool)

(assert (=> start!131738 m!1423601))

(declare-fun m!1423603 () Bool)

(assert (=> start!131738 m!1423603))

(check-sat (not b!1542736) (not b!1542738) (not start!131738) tp_is_empty!37777 (not mapNonEmpty!58369))
(check-sat)
