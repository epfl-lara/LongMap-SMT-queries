; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43176 () Bool)

(assert start!43176)

(declare-fun b!478425 () Bool)

(declare-fun res!285467 () Bool)

(declare-fun e!281315 () Bool)

(assert (=> b!478425 (=> (not res!285467) (not e!281315))))

(declare-datatypes ((array!30827 0))(
  ( (array!30828 (arr!14821 (Array (_ BitVec 32) (_ BitVec 64))) (size!15180 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30827)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30827 (_ BitVec 32)) Bool)

(assert (=> b!478425 (= res!285467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478426 () Bool)

(declare-fun res!285466 () Bool)

(assert (=> b!478426 (=> (not res!285466) (not e!281315))))

(declare-datatypes ((V!19177 0))(
  ( (V!19178 (val!6837 Int)) )
))
(declare-datatypes ((ValueCell!6428 0))(
  ( (ValueCellFull!6428 (v!9120 V!19177)) (EmptyCell!6428) )
))
(declare-datatypes ((array!30829 0))(
  ( (array!30830 (arr!14822 (Array (_ BitVec 32) ValueCell!6428)) (size!15181 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30829)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478426 (= res!285466 (and (= (size!15181 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15180 _keys!1874) (size!15181 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285468 () Bool)

(assert (=> start!43176 (=> (not res!285468) (not e!281315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43176 (= res!285468 (validMask!0 mask!2352))))

(assert (=> start!43176 e!281315))

(assert (=> start!43176 true))

(declare-fun e!281319 () Bool)

(declare-fun array_inv!10780 (array!30829) Bool)

(assert (=> start!43176 (and (array_inv!10780 _values!1516) e!281319)))

(declare-fun array_inv!10781 (array!30827) Bool)

(assert (=> start!43176 (array_inv!10781 _keys!1874)))

(declare-fun mapIsEmpty!22063 () Bool)

(declare-fun mapRes!22063 () Bool)

(assert (=> mapIsEmpty!22063 mapRes!22063))

(declare-fun b!478427 () Bool)

(assert (=> b!478427 (= e!281315 false)))

(declare-fun lt!217519 () Bool)

(declare-datatypes ((List!9109 0))(
  ( (Nil!9106) (Cons!9105 (h!9961 (_ BitVec 64)) (t!15306 List!9109)) )
))
(declare-fun arrayNoDuplicates!0 (array!30827 (_ BitVec 32) List!9109) Bool)

(assert (=> b!478427 (= lt!217519 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9106))))

(declare-fun b!478428 () Bool)

(declare-fun e!281318 () Bool)

(assert (=> b!478428 (= e!281319 (and e!281318 mapRes!22063))))

(declare-fun condMapEmpty!22063 () Bool)

(declare-fun mapDefault!22063 () ValueCell!6428)

(assert (=> b!478428 (= condMapEmpty!22063 (= (arr!14822 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6428)) mapDefault!22063)))))

(declare-fun mapNonEmpty!22063 () Bool)

(declare-fun tp!42538 () Bool)

(declare-fun e!281316 () Bool)

(assert (=> mapNonEmpty!22063 (= mapRes!22063 (and tp!42538 e!281316))))

(declare-fun mapRest!22063 () (Array (_ BitVec 32) ValueCell!6428))

(declare-fun mapKey!22063 () (_ BitVec 32))

(declare-fun mapValue!22063 () ValueCell!6428)

(assert (=> mapNonEmpty!22063 (= (arr!14822 _values!1516) (store mapRest!22063 mapKey!22063 mapValue!22063))))

(declare-fun b!478429 () Bool)

(declare-fun tp_is_empty!13579 () Bool)

(assert (=> b!478429 (= e!281318 tp_is_empty!13579)))

(declare-fun b!478430 () Bool)

(assert (=> b!478430 (= e!281316 tp_is_empty!13579)))

(assert (= (and start!43176 res!285468) b!478426))

(assert (= (and b!478426 res!285466) b!478425))

(assert (= (and b!478425 res!285467) b!478427))

(assert (= (and b!478428 condMapEmpty!22063) mapIsEmpty!22063))

(assert (= (and b!478428 (not condMapEmpty!22063)) mapNonEmpty!22063))

(get-info :version)

(assert (= (and mapNonEmpty!22063 ((_ is ValueCellFull!6428) mapValue!22063)) b!478430))

(assert (= (and b!478428 ((_ is ValueCellFull!6428) mapDefault!22063)) b!478429))

(assert (= start!43176 b!478428))

(declare-fun m!460143 () Bool)

(assert (=> b!478425 m!460143))

(declare-fun m!460145 () Bool)

(assert (=> start!43176 m!460145))

(declare-fun m!460147 () Bool)

(assert (=> start!43176 m!460147))

(declare-fun m!460149 () Bool)

(assert (=> start!43176 m!460149))

(declare-fun m!460151 () Bool)

(assert (=> b!478427 m!460151))

(declare-fun m!460153 () Bool)

(assert (=> mapNonEmpty!22063 m!460153))

(check-sat tp_is_empty!13579 (not b!478425) (not start!43176) (not mapNonEmpty!22063) (not b!478427))
(check-sat)
