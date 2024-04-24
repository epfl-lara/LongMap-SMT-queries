; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35550 () Bool)

(assert start!35550)

(declare-fun b!356440 () Bool)

(declare-fun res!197822 () Bool)

(declare-fun e!218388 () Bool)

(assert (=> b!356440 (=> (not res!197822) (not e!218388))))

(declare-datatypes ((array!19588 0))(
  ( (array!19589 (arr!9287 (Array (_ BitVec 32) (_ BitVec 64))) (size!9639 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19588)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19588 (_ BitVec 32)) Bool)

(assert (=> b!356440 (= res!197822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356441 () Bool)

(declare-fun e!218392 () Bool)

(declare-fun tp_is_empty!8017 () Bool)

(assert (=> b!356441 (= e!218392 tp_is_empty!8017)))

(declare-fun mapNonEmpty!13533 () Bool)

(declare-fun mapRes!13533 () Bool)

(declare-fun tp!27510 () Bool)

(declare-fun e!218389 () Bool)

(assert (=> mapNonEmpty!13533 (= mapRes!13533 (and tp!27510 e!218389))))

(declare-datatypes ((V!11667 0))(
  ( (V!11668 (val!4053 Int)) )
))
(declare-datatypes ((ValueCell!3665 0))(
  ( (ValueCellFull!3665 (v!6248 V!11667)) (EmptyCell!3665) )
))
(declare-fun mapValue!13533 () ValueCell!3665)

(declare-fun mapKey!13533 () (_ BitVec 32))

(declare-datatypes ((array!19590 0))(
  ( (array!19591 (arr!9288 (Array (_ BitVec 32) ValueCell!3665)) (size!9640 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19590)

(declare-fun mapRest!13533 () (Array (_ BitVec 32) ValueCell!3665))

(assert (=> mapNonEmpty!13533 (= (arr!9288 _values!1208) (store mapRest!13533 mapKey!13533 mapValue!13533))))

(declare-fun b!356442 () Bool)

(declare-fun res!197821 () Bool)

(assert (=> b!356442 (=> (not res!197821) (not e!218388))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356442 (= res!197821 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356443 () Bool)

(declare-fun e!218390 () Bool)

(assert (=> b!356443 (= e!218390 (and e!218392 mapRes!13533))))

(declare-fun condMapEmpty!13533 () Bool)

(declare-fun mapDefault!13533 () ValueCell!3665)

(assert (=> b!356443 (= condMapEmpty!13533 (= (arr!9288 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3665)) mapDefault!13533)))))

(declare-fun b!356444 () Bool)

(assert (=> b!356444 (= e!218389 tp_is_empty!8017)))

(declare-fun b!356445 () Bool)

(assert (=> b!356445 (= e!218388 (not true))))

(assert (=> b!356445 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11667)

(declare-datatypes ((Unit!10959 0))(
  ( (Unit!10960) )
))
(declare-fun lt!165959 () Unit!10959)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11667)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!8 (array!19588 array!19590 (_ BitVec 32) (_ BitVec 32) V!11667 V!11667 (_ BitVec 64) (_ BitVec 32)) Unit!10959)

(assert (=> b!356445 (= lt!165959 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!8 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356446 () Bool)

(declare-fun res!197820 () Bool)

(assert (=> b!356446 (=> (not res!197820) (not e!218388))))

(assert (=> b!356446 (= res!197820 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9639 _keys!1456))))))

(declare-fun b!356447 () Bool)

(declare-fun res!197818 () Bool)

(assert (=> b!356447 (=> (not res!197818) (not e!218388))))

(assert (=> b!356447 (= res!197818 (not (= (select (arr!9287 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356448 () Bool)

(declare-fun res!197823 () Bool)

(assert (=> b!356448 (=> (not res!197823) (not e!218388))))

(declare-datatypes ((List!5279 0))(
  ( (Nil!5276) (Cons!5275 (h!6131 (_ BitVec 64)) (t!10421 List!5279)) )
))
(declare-fun arrayNoDuplicates!0 (array!19588 (_ BitVec 32) List!5279) Bool)

(assert (=> b!356448 (= res!197823 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5276))))

(declare-fun b!356449 () Bool)

(declare-fun res!197819 () Bool)

(assert (=> b!356449 (=> (not res!197819) (not e!218388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356449 (= res!197819 (validKeyInArray!0 k0!1077))))

(declare-fun res!197817 () Bool)

(assert (=> start!35550 (=> (not res!197817) (not e!218388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35550 (= res!197817 (validMask!0 mask!1842))))

(assert (=> start!35550 e!218388))

(assert (=> start!35550 tp_is_empty!8017))

(assert (=> start!35550 true))

(declare-fun array_inv!6866 (array!19588) Bool)

(assert (=> start!35550 (array_inv!6866 _keys!1456)))

(declare-fun array_inv!6867 (array!19590) Bool)

(assert (=> start!35550 (and (array_inv!6867 _values!1208) e!218390)))

(declare-fun mapIsEmpty!13533 () Bool)

(assert (=> mapIsEmpty!13533 mapRes!13533))

(declare-fun b!356450 () Bool)

(declare-fun res!197824 () Bool)

(assert (=> b!356450 (=> (not res!197824) (not e!218388))))

(assert (=> b!356450 (= res!197824 (and (= (size!9640 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9639 _keys!1456) (size!9640 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35550 res!197817) b!356450))

(assert (= (and b!356450 res!197824) b!356440))

(assert (= (and b!356440 res!197822) b!356448))

(assert (= (and b!356448 res!197823) b!356449))

(assert (= (and b!356449 res!197819) b!356446))

(assert (= (and b!356446 res!197820) b!356442))

(assert (= (and b!356442 res!197821) b!356447))

(assert (= (and b!356447 res!197818) b!356445))

(assert (= (and b!356443 condMapEmpty!13533) mapIsEmpty!13533))

(assert (= (and b!356443 (not condMapEmpty!13533)) mapNonEmpty!13533))

(get-info :version)

(assert (= (and mapNonEmpty!13533 ((_ is ValueCellFull!3665) mapValue!13533)) b!356444))

(assert (= (and b!356443 ((_ is ValueCellFull!3665) mapDefault!13533)) b!356441))

(assert (= start!35550 b!356443))

(declare-fun m!355095 () Bool)

(assert (=> b!356440 m!355095))

(declare-fun m!355097 () Bool)

(assert (=> b!356448 m!355097))

(declare-fun m!355099 () Bool)

(assert (=> b!356442 m!355099))

(declare-fun m!355101 () Bool)

(assert (=> mapNonEmpty!13533 m!355101))

(declare-fun m!355103 () Bool)

(assert (=> b!356445 m!355103))

(declare-fun m!355105 () Bool)

(assert (=> b!356445 m!355105))

(declare-fun m!355107 () Bool)

(assert (=> b!356449 m!355107))

(declare-fun m!355109 () Bool)

(assert (=> start!35550 m!355109))

(declare-fun m!355111 () Bool)

(assert (=> start!35550 m!355111))

(declare-fun m!355113 () Bool)

(assert (=> start!35550 m!355113))

(declare-fun m!355115 () Bool)

(assert (=> b!356447 m!355115))

(check-sat (not b!356442) (not b!356440) (not start!35550) tp_is_empty!8017 (not mapNonEmpty!13533) (not b!356449) (not b!356445) (not b!356448))
(check-sat)
