; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43206 () Bool)

(assert start!43206)

(declare-fun b!478695 () Bool)

(declare-fun res!285602 () Bool)

(declare-fun e!281540 () Bool)

(assert (=> b!478695 (=> (not res!285602) (not e!281540))))

(declare-datatypes ((array!30885 0))(
  ( (array!30886 (arr!14850 (Array (_ BitVec 32) (_ BitVec 64))) (size!15209 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30885)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30885 (_ BitVec 32)) Bool)

(assert (=> b!478695 (= res!285602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478696 () Bool)

(assert (=> b!478696 (= e!281540 false)))

(declare-fun lt!217564 () Bool)

(declare-datatypes ((List!9119 0))(
  ( (Nil!9116) (Cons!9115 (h!9971 (_ BitVec 64)) (t!15316 List!9119)) )
))
(declare-fun arrayNoDuplicates!0 (array!30885 (_ BitVec 32) List!9119) Bool)

(assert (=> b!478696 (= lt!217564 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9116))))

(declare-fun b!478697 () Bool)

(declare-fun res!285603 () Bool)

(assert (=> b!478697 (=> (not res!285603) (not e!281540))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19217 0))(
  ( (V!19218 (val!6852 Int)) )
))
(declare-datatypes ((ValueCell!6443 0))(
  ( (ValueCellFull!6443 (v!9135 V!19217)) (EmptyCell!6443) )
))
(declare-datatypes ((array!30887 0))(
  ( (array!30888 (arr!14851 (Array (_ BitVec 32) ValueCell!6443)) (size!15210 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30887)

(assert (=> b!478697 (= res!285603 (and (= (size!15210 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15209 _keys!1874) (size!15210 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285601 () Bool)

(assert (=> start!43206 (=> (not res!285601) (not e!281540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43206 (= res!285601 (validMask!0 mask!2352))))

(assert (=> start!43206 e!281540))

(assert (=> start!43206 true))

(declare-fun e!281541 () Bool)

(declare-fun array_inv!10804 (array!30887) Bool)

(assert (=> start!43206 (and (array_inv!10804 _values!1516) e!281541)))

(declare-fun array_inv!10805 (array!30885) Bool)

(assert (=> start!43206 (array_inv!10805 _keys!1874)))

(declare-fun mapIsEmpty!22108 () Bool)

(declare-fun mapRes!22108 () Bool)

(assert (=> mapIsEmpty!22108 mapRes!22108))

(declare-fun b!478698 () Bool)

(declare-fun e!281543 () Bool)

(assert (=> b!478698 (= e!281541 (and e!281543 mapRes!22108))))

(declare-fun condMapEmpty!22108 () Bool)

(declare-fun mapDefault!22108 () ValueCell!6443)

(assert (=> b!478698 (= condMapEmpty!22108 (= (arr!14851 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6443)) mapDefault!22108)))))

(declare-fun b!478699 () Bool)

(declare-fun e!281542 () Bool)

(declare-fun tp_is_empty!13609 () Bool)

(assert (=> b!478699 (= e!281542 tp_is_empty!13609)))

(declare-fun b!478700 () Bool)

(assert (=> b!478700 (= e!281543 tp_is_empty!13609)))

(declare-fun mapNonEmpty!22108 () Bool)

(declare-fun tp!42583 () Bool)

(assert (=> mapNonEmpty!22108 (= mapRes!22108 (and tp!42583 e!281542))))

(declare-fun mapRest!22108 () (Array (_ BitVec 32) ValueCell!6443))

(declare-fun mapKey!22108 () (_ BitVec 32))

(declare-fun mapValue!22108 () ValueCell!6443)

(assert (=> mapNonEmpty!22108 (= (arr!14851 _values!1516) (store mapRest!22108 mapKey!22108 mapValue!22108))))

(assert (= (and start!43206 res!285601) b!478697))

(assert (= (and b!478697 res!285603) b!478695))

(assert (= (and b!478695 res!285602) b!478696))

(assert (= (and b!478698 condMapEmpty!22108) mapIsEmpty!22108))

(assert (= (and b!478698 (not condMapEmpty!22108)) mapNonEmpty!22108))

(get-info :version)

(assert (= (and mapNonEmpty!22108 ((_ is ValueCellFull!6443) mapValue!22108)) b!478699))

(assert (= (and b!478698 ((_ is ValueCellFull!6443) mapDefault!22108)) b!478700))

(assert (= start!43206 b!478698))

(declare-fun m!460323 () Bool)

(assert (=> b!478695 m!460323))

(declare-fun m!460325 () Bool)

(assert (=> b!478696 m!460325))

(declare-fun m!460327 () Bool)

(assert (=> start!43206 m!460327))

(declare-fun m!460329 () Bool)

(assert (=> start!43206 m!460329))

(declare-fun m!460331 () Bool)

(assert (=> start!43206 m!460331))

(declare-fun m!460333 () Bool)

(assert (=> mapNonEmpty!22108 m!460333))

(check-sat (not mapNonEmpty!22108) tp_is_empty!13609 (not start!43206) (not b!478696) (not b!478695))
(check-sat)
