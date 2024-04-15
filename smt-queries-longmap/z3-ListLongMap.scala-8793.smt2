; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106982 () Bool)

(assert start!106982)

(declare-fun b!1268473 () Bool)

(declare-fun e!722839 () Bool)

(declare-fun e!722836 () Bool)

(declare-fun mapRes!50587 () Bool)

(assert (=> b!1268473 (= e!722839 (and e!722836 mapRes!50587))))

(declare-fun condMapEmpty!50587 () Bool)

(declare-datatypes ((V!48755 0))(
  ( (V!48756 (val!16410 Int)) )
))
(declare-datatypes ((ValueCell!15482 0))(
  ( (ValueCellFull!15482 (v!19046 V!48755)) (EmptyCell!15482) )
))
(declare-datatypes ((array!82535 0))(
  ( (array!82536 (arr!39805 (Array (_ BitVec 32) ValueCell!15482)) (size!40343 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82535)

(declare-fun mapDefault!50587 () ValueCell!15482)

(assert (=> b!1268473 (= condMapEmpty!50587 (= (arr!39805 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15482)) mapDefault!50587)))))

(declare-fun b!1268474 () Bool)

(declare-fun tp_is_empty!32671 () Bool)

(assert (=> b!1268474 (= e!722836 tp_is_empty!32671)))

(declare-fun res!844272 () Bool)

(declare-fun e!722837 () Bool)

(assert (=> start!106982 (=> (not res!844272) (not e!722837))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106982 (= res!844272 (validMask!0 mask!1730))))

(assert (=> start!106982 e!722837))

(declare-fun array_inv!30453 (array!82535) Bool)

(assert (=> start!106982 (and (array_inv!30453 _values!1134) e!722839)))

(assert (=> start!106982 true))

(declare-datatypes ((array!82537 0))(
  ( (array!82538 (arr!39806 (Array (_ BitVec 32) (_ BitVec 64))) (size!40344 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82537)

(declare-fun array_inv!30454 (array!82537) Bool)

(assert (=> start!106982 (array_inv!30454 _keys!1364)))

(declare-fun mapNonEmpty!50587 () Bool)

(declare-fun tp!96767 () Bool)

(declare-fun e!722835 () Bool)

(assert (=> mapNonEmpty!50587 (= mapRes!50587 (and tp!96767 e!722835))))

(declare-fun mapRest!50587 () (Array (_ BitVec 32) ValueCell!15482))

(declare-fun mapValue!50587 () ValueCell!15482)

(declare-fun mapKey!50587 () (_ BitVec 32))

(assert (=> mapNonEmpty!50587 (= (arr!39805 _values!1134) (store mapRest!50587 mapKey!50587 mapValue!50587))))

(declare-fun b!1268475 () Bool)

(declare-fun res!844274 () Bool)

(assert (=> b!1268475 (=> (not res!844274) (not e!722837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82537 (_ BitVec 32)) Bool)

(assert (=> b!1268475 (= res!844274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268476 () Bool)

(assert (=> b!1268476 (= e!722835 tp_is_empty!32671)))

(declare-fun b!1268477 () Bool)

(assert (=> b!1268477 (= e!722837 false)))

(declare-fun lt!574265 () Bool)

(declare-datatypes ((List!28470 0))(
  ( (Nil!28467) (Cons!28466 (h!29675 (_ BitVec 64)) (t!41991 List!28470)) )
))
(declare-fun arrayNoDuplicates!0 (array!82537 (_ BitVec 32) List!28470) Bool)

(assert (=> b!1268477 (= lt!574265 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28467))))

(declare-fun mapIsEmpty!50587 () Bool)

(assert (=> mapIsEmpty!50587 mapRes!50587))

(declare-fun b!1268478 () Bool)

(declare-fun res!844273 () Bool)

(assert (=> b!1268478 (=> (not res!844273) (not e!722837))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268478 (= res!844273 (and (= (size!40343 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40344 _keys!1364) (size!40343 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!106982 res!844272) b!1268478))

(assert (= (and b!1268478 res!844273) b!1268475))

(assert (= (and b!1268475 res!844274) b!1268477))

(assert (= (and b!1268473 condMapEmpty!50587) mapIsEmpty!50587))

(assert (= (and b!1268473 (not condMapEmpty!50587)) mapNonEmpty!50587))

(get-info :version)

(assert (= (and mapNonEmpty!50587 ((_ is ValueCellFull!15482) mapValue!50587)) b!1268476))

(assert (= (and b!1268473 ((_ is ValueCellFull!15482) mapDefault!50587)) b!1268474))

(assert (= start!106982 b!1268473))

(declare-fun m!1166847 () Bool)

(assert (=> start!106982 m!1166847))

(declare-fun m!1166849 () Bool)

(assert (=> start!106982 m!1166849))

(declare-fun m!1166851 () Bool)

(assert (=> start!106982 m!1166851))

(declare-fun m!1166853 () Bool)

(assert (=> mapNonEmpty!50587 m!1166853))

(declare-fun m!1166855 () Bool)

(assert (=> b!1268475 m!1166855))

(declare-fun m!1166857 () Bool)

(assert (=> b!1268477 m!1166857))

(check-sat (not start!106982) (not mapNonEmpty!50587) (not b!1268477) tp_is_empty!32671 (not b!1268475))
(check-sat)
