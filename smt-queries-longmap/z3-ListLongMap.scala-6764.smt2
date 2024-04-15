; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84862 () Bool)

(assert start!84862)

(declare-fun b!991664 () Bool)

(declare-fun res!662879 () Bool)

(declare-fun e!559336 () Bool)

(assert (=> b!991664 (=> (not res!662879) (not e!559336))))

(declare-datatypes ((array!62622 0))(
  ( (array!62623 (arr!30156 (Array (_ BitVec 32) (_ BitVec 64))) (size!30637 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62622)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62622 (_ BitVec 32)) Bool)

(assert (=> b!991664 (= res!662879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapNonEmpty!37110 () Bool)

(declare-fun mapRes!37110 () Bool)

(declare-fun tp!70182 () Bool)

(declare-fun e!559340 () Bool)

(assert (=> mapNonEmpty!37110 (= mapRes!37110 (and tp!70182 e!559340))))

(declare-datatypes ((V!36129 0))(
  ( (V!36130 (val!11730 Int)) )
))
(declare-datatypes ((ValueCell!11198 0))(
  ( (ValueCellFull!11198 (v!14306 V!36129)) (EmptyCell!11198) )
))
(declare-fun mapValue!37110 () ValueCell!11198)

(declare-fun mapRest!37110 () (Array (_ BitVec 32) ValueCell!11198))

(declare-datatypes ((array!62624 0))(
  ( (array!62625 (arr!30157 (Array (_ BitVec 32) ValueCell!11198)) (size!30638 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62624)

(declare-fun mapKey!37110 () (_ BitVec 32))

(assert (=> mapNonEmpty!37110 (= (arr!30157 _values!1551) (store mapRest!37110 mapKey!37110 mapValue!37110))))

(declare-fun b!991665 () Bool)

(declare-fun res!662881 () Bool)

(assert (=> b!991665 (=> (not res!662881) (not e!559336))))

(declare-datatypes ((List!20902 0))(
  ( (Nil!20899) (Cons!20898 (h!22060 (_ BitVec 64)) (t!29876 List!20902)) )
))
(declare-fun arrayNoDuplicates!0 (array!62622 (_ BitVec 32) List!20902) Bool)

(assert (=> b!991665 (= res!662881 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20899))))

(declare-fun mapIsEmpty!37110 () Bool)

(assert (=> mapIsEmpty!37110 mapRes!37110))

(declare-fun b!991667 () Bool)

(declare-fun e!559339 () Bool)

(declare-fun tp_is_empty!23359 () Bool)

(assert (=> b!991667 (= e!559339 tp_is_empty!23359)))

(declare-fun b!991668 () Bool)

(declare-fun res!662878 () Bool)

(assert (=> b!991668 (=> (not res!662878) (not e!559336))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991668 (= res!662878 (and (= (size!30638 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30637 _keys!1945) (size!30638 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991669 () Bool)

(declare-fun e!559337 () Bool)

(assert (=> b!991669 (= e!559337 (and e!559339 mapRes!37110))))

(declare-fun condMapEmpty!37110 () Bool)

(declare-fun mapDefault!37110 () ValueCell!11198)

(assert (=> b!991669 (= condMapEmpty!37110 (= (arr!30157 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11198)) mapDefault!37110)))))

(declare-fun res!662877 () Bool)

(assert (=> start!84862 (=> (not res!662877) (not e!559336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84862 (= res!662877 (validMask!0 mask!2471))))

(assert (=> start!84862 e!559336))

(assert (=> start!84862 true))

(declare-fun array_inv!23303 (array!62624) Bool)

(assert (=> start!84862 (and (array_inv!23303 _values!1551) e!559337)))

(declare-fun array_inv!23304 (array!62622) Bool)

(assert (=> start!84862 (array_inv!23304 _keys!1945)))

(declare-fun b!991666 () Bool)

(declare-fun res!662880 () Bool)

(assert (=> b!991666 (=> (not res!662880) (not e!559336))))

(declare-fun k0!1425 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991666 (= res!662880 (validKeyInArray!0 k0!1425))))

(declare-fun b!991670 () Bool)

(assert (=> b!991670 (= e!559340 tp_is_empty!23359)))

(declare-fun b!991671 () Bool)

(assert (=> b!991671 (= e!559336 (not (= (size!30637 _keys!1945) (bvadd #b00000000000000000000000000000001 mask!2471))))))

(assert (= (and start!84862 res!662877) b!991668))

(assert (= (and b!991668 res!662878) b!991664))

(assert (= (and b!991664 res!662879) b!991665))

(assert (= (and b!991665 res!662881) b!991666))

(assert (= (and b!991666 res!662880) b!991671))

(assert (= (and b!991669 condMapEmpty!37110) mapIsEmpty!37110))

(assert (= (and b!991669 (not condMapEmpty!37110)) mapNonEmpty!37110))

(get-info :version)

(assert (= (and mapNonEmpty!37110 ((_ is ValueCellFull!11198) mapValue!37110)) b!991670))

(assert (= (and b!991669 ((_ is ValueCellFull!11198) mapDefault!37110)) b!991667))

(assert (= start!84862 b!991669))

(declare-fun m!918919 () Bool)

(assert (=> mapNonEmpty!37110 m!918919))

(declare-fun m!918921 () Bool)

(assert (=> start!84862 m!918921))

(declare-fun m!918923 () Bool)

(assert (=> start!84862 m!918923))

(declare-fun m!918925 () Bool)

(assert (=> start!84862 m!918925))

(declare-fun m!918927 () Bool)

(assert (=> b!991664 m!918927))

(declare-fun m!918929 () Bool)

(assert (=> b!991666 m!918929))

(declare-fun m!918931 () Bool)

(assert (=> b!991665 m!918931))

(check-sat tp_is_empty!23359 (not b!991665) (not b!991664) (not start!84862) (not mapNonEmpty!37110) (not b!991666))
(check-sat)
