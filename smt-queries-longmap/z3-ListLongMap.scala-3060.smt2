; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43204 () Bool)

(assert start!43204)

(declare-fun b!478822 () Bool)

(declare-fun e!281598 () Bool)

(declare-fun e!281596 () Bool)

(declare-fun mapRes!22084 () Bool)

(assert (=> b!478822 (= e!281598 (and e!281596 mapRes!22084))))

(declare-fun condMapEmpty!22084 () Bool)

(declare-datatypes ((V!19195 0))(
  ( (V!19196 (val!6844 Int)) )
))
(declare-datatypes ((ValueCell!6435 0))(
  ( (ValueCellFull!6435 (v!9133 V!19195)) (EmptyCell!6435) )
))
(declare-datatypes ((array!30863 0))(
  ( (array!30864 (arr!14839 (Array (_ BitVec 32) ValueCell!6435)) (size!15197 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30863)

(declare-fun mapDefault!22084 () ValueCell!6435)

(assert (=> b!478822 (= condMapEmpty!22084 (= (arr!14839 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6435)) mapDefault!22084)))))

(declare-fun mapIsEmpty!22084 () Bool)

(assert (=> mapIsEmpty!22084 mapRes!22084))

(declare-fun res!285658 () Bool)

(declare-fun e!281595 () Bool)

(assert (=> start!43204 (=> (not res!285658) (not e!281595))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43204 (= res!285658 (validMask!0 mask!2352))))

(assert (=> start!43204 e!281595))

(assert (=> start!43204 true))

(declare-fun array_inv!10704 (array!30863) Bool)

(assert (=> start!43204 (and (array_inv!10704 _values!1516) e!281598)))

(declare-datatypes ((array!30865 0))(
  ( (array!30866 (arr!14840 (Array (_ BitVec 32) (_ BitVec 64))) (size!15198 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30865)

(declare-fun array_inv!10705 (array!30865) Bool)

(assert (=> start!43204 (array_inv!10705 _keys!1874)))

(declare-fun b!478823 () Bool)

(declare-fun res!285660 () Bool)

(assert (=> b!478823 (=> (not res!285660) (not e!281595))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478823 (= res!285660 (and (= (size!15197 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15198 _keys!1874) (size!15197 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478824 () Bool)

(assert (=> b!478824 (= e!281595 false)))

(declare-fun lt!217774 () Bool)

(declare-datatypes ((List!9070 0))(
  ( (Nil!9067) (Cons!9066 (h!9922 (_ BitVec 64)) (t!15276 List!9070)) )
))
(declare-fun arrayNoDuplicates!0 (array!30865 (_ BitVec 32) List!9070) Bool)

(assert (=> b!478824 (= lt!217774 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9067))))

(declare-fun b!478825 () Bool)

(declare-fun tp_is_empty!13593 () Bool)

(assert (=> b!478825 (= e!281596 tp_is_empty!13593)))

(declare-fun mapNonEmpty!22084 () Bool)

(declare-fun tp!42559 () Bool)

(declare-fun e!281597 () Bool)

(assert (=> mapNonEmpty!22084 (= mapRes!22084 (and tp!42559 e!281597))))

(declare-fun mapRest!22084 () (Array (_ BitVec 32) ValueCell!6435))

(declare-fun mapKey!22084 () (_ BitVec 32))

(declare-fun mapValue!22084 () ValueCell!6435)

(assert (=> mapNonEmpty!22084 (= (arr!14839 _values!1516) (store mapRest!22084 mapKey!22084 mapValue!22084))))

(declare-fun b!478826 () Bool)

(declare-fun res!285659 () Bool)

(assert (=> b!478826 (=> (not res!285659) (not e!281595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30865 (_ BitVec 32)) Bool)

(assert (=> b!478826 (= res!285659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478827 () Bool)

(assert (=> b!478827 (= e!281597 tp_is_empty!13593)))

(assert (= (and start!43204 res!285658) b!478823))

(assert (= (and b!478823 res!285660) b!478826))

(assert (= (and b!478826 res!285659) b!478824))

(assert (= (and b!478822 condMapEmpty!22084) mapIsEmpty!22084))

(assert (= (and b!478822 (not condMapEmpty!22084)) mapNonEmpty!22084))

(get-info :version)

(assert (= (and mapNonEmpty!22084 ((_ is ValueCellFull!6435) mapValue!22084)) b!478827))

(assert (= (and b!478822 ((_ is ValueCellFull!6435) mapDefault!22084)) b!478825))

(assert (= start!43204 b!478822))

(declare-fun m!460961 () Bool)

(assert (=> start!43204 m!460961))

(declare-fun m!460963 () Bool)

(assert (=> start!43204 m!460963))

(declare-fun m!460965 () Bool)

(assert (=> start!43204 m!460965))

(declare-fun m!460967 () Bool)

(assert (=> b!478824 m!460967))

(declare-fun m!460969 () Bool)

(assert (=> mapNonEmpty!22084 m!460969))

(declare-fun m!460971 () Bool)

(assert (=> b!478826 m!460971))

(check-sat tp_is_empty!13593 (not b!478826) (not start!43204) (not b!478824) (not mapNonEmpty!22084))
(check-sat)
