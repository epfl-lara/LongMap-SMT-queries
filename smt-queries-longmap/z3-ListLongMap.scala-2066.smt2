; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35550 () Bool)

(assert start!35550)

(declare-fun res!197691 () Bool)

(declare-fun e!218250 () Bool)

(assert (=> start!35550 (=> (not res!197691) (not e!218250))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35550 (= res!197691 (validMask!0 mask!1842))))

(assert (=> start!35550 e!218250))

(declare-fun tp_is_empty!8017 () Bool)

(assert (=> start!35550 tp_is_empty!8017))

(assert (=> start!35550 true))

(declare-datatypes ((array!19591 0))(
  ( (array!19592 (arr!9289 (Array (_ BitVec 32) (_ BitVec 64))) (size!9642 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19591)

(declare-fun array_inv!6868 (array!19591) Bool)

(assert (=> start!35550 (array_inv!6868 _keys!1456)))

(declare-datatypes ((V!11667 0))(
  ( (V!11668 (val!4053 Int)) )
))
(declare-datatypes ((ValueCell!3665 0))(
  ( (ValueCellFull!3665 (v!6241 V!11667)) (EmptyCell!3665) )
))
(declare-datatypes ((array!19593 0))(
  ( (array!19594 (arr!9290 (Array (_ BitVec 32) ValueCell!3665)) (size!9643 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19593)

(declare-fun e!218247 () Bool)

(declare-fun array_inv!6869 (array!19593) Bool)

(assert (=> start!35550 (and (array_inv!6869 _values!1208) e!218247)))

(declare-fun b!356218 () Bool)

(declare-fun e!218249 () Bool)

(assert (=> b!356218 (= e!218249 tp_is_empty!8017)))

(declare-fun b!356219 () Bool)

(declare-fun res!197693 () Bool)

(assert (=> b!356219 (=> (not res!197693) (not e!218250))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356219 (= res!197693 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9642 _keys!1456))))))

(declare-fun b!356220 () Bool)

(declare-fun res!197698 () Bool)

(assert (=> b!356220 (=> (not res!197698) (not e!218250))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356220 (= res!197698 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356221 () Bool)

(declare-fun res!197694 () Bool)

(assert (=> b!356221 (=> (not res!197694) (not e!218250))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356221 (= res!197694 (and (= (size!9643 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9642 _keys!1456) (size!9643 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13533 () Bool)

(declare-fun mapRes!13533 () Bool)

(declare-fun tp!27510 () Bool)

(assert (=> mapNonEmpty!13533 (= mapRes!13533 (and tp!27510 e!218249))))

(declare-fun mapValue!13533 () ValueCell!3665)

(declare-fun mapKey!13533 () (_ BitVec 32))

(declare-fun mapRest!13533 () (Array (_ BitVec 32) ValueCell!3665))

(assert (=> mapNonEmpty!13533 (= (arr!9290 _values!1208) (store mapRest!13533 mapKey!13533 mapValue!13533))))

(declare-fun b!356222 () Bool)

(declare-fun res!197695 () Bool)

(assert (=> b!356222 (=> (not res!197695) (not e!218250))))

(assert (=> b!356222 (= res!197695 (not (= (select (arr!9289 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13533 () Bool)

(assert (=> mapIsEmpty!13533 mapRes!13533))

(declare-fun b!356223 () Bool)

(declare-fun res!197692 () Bool)

(assert (=> b!356223 (=> (not res!197692) (not e!218250))))

(declare-datatypes ((List!5338 0))(
  ( (Nil!5335) (Cons!5334 (h!6190 (_ BitVec 64)) (t!10479 List!5338)) )
))
(declare-fun arrayNoDuplicates!0 (array!19591 (_ BitVec 32) List!5338) Bool)

(assert (=> b!356223 (= res!197692 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5335))))

(declare-fun b!356224 () Bool)

(declare-fun res!197696 () Bool)

(assert (=> b!356224 (=> (not res!197696) (not e!218250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19591 (_ BitVec 32)) Bool)

(assert (=> b!356224 (= res!197696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356225 () Bool)

(declare-fun res!197697 () Bool)

(assert (=> b!356225 (=> (not res!197697) (not e!218250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356225 (= res!197697 (validKeyInArray!0 k0!1077))))

(declare-fun b!356226 () Bool)

(assert (=> b!356226 (= e!218250 (not true))))

(assert (=> b!356226 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11667)

(declare-fun zeroValue!1150 () V!11667)

(declare-datatypes ((Unit!10962 0))(
  ( (Unit!10963) )
))
(declare-fun lt!165706 () Unit!10962)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!8 (array!19591 array!19593 (_ BitVec 32) (_ BitVec 32) V!11667 V!11667 (_ BitVec 64) (_ BitVec 32)) Unit!10962)

(assert (=> b!356226 (= lt!165706 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!8 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356227 () Bool)

(declare-fun e!218246 () Bool)

(assert (=> b!356227 (= e!218247 (and e!218246 mapRes!13533))))

(declare-fun condMapEmpty!13533 () Bool)

(declare-fun mapDefault!13533 () ValueCell!3665)

(assert (=> b!356227 (= condMapEmpty!13533 (= (arr!9290 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3665)) mapDefault!13533)))))

(declare-fun b!356228 () Bool)

(assert (=> b!356228 (= e!218246 tp_is_empty!8017)))

(assert (= (and start!35550 res!197691) b!356221))

(assert (= (and b!356221 res!197694) b!356224))

(assert (= (and b!356224 res!197696) b!356223))

(assert (= (and b!356223 res!197692) b!356225))

(assert (= (and b!356225 res!197697) b!356219))

(assert (= (and b!356219 res!197693) b!356220))

(assert (= (and b!356220 res!197698) b!356222))

(assert (= (and b!356222 res!197695) b!356226))

(assert (= (and b!356227 condMapEmpty!13533) mapIsEmpty!13533))

(assert (= (and b!356227 (not condMapEmpty!13533)) mapNonEmpty!13533))

(get-info :version)

(assert (= (and mapNonEmpty!13533 ((_ is ValueCellFull!3665) mapValue!13533)) b!356218))

(assert (= (and b!356227 ((_ is ValueCellFull!3665) mapDefault!13533)) b!356228))

(assert (= start!35550 b!356227))

(declare-fun m!354141 () Bool)

(assert (=> b!356222 m!354141))

(declare-fun m!354143 () Bool)

(assert (=> b!356220 m!354143))

(declare-fun m!354145 () Bool)

(assert (=> b!356226 m!354145))

(declare-fun m!354147 () Bool)

(assert (=> b!356226 m!354147))

(declare-fun m!354149 () Bool)

(assert (=> b!356225 m!354149))

(declare-fun m!354151 () Bool)

(assert (=> b!356224 m!354151))

(declare-fun m!354153 () Bool)

(assert (=> start!35550 m!354153))

(declare-fun m!354155 () Bool)

(assert (=> start!35550 m!354155))

(declare-fun m!354157 () Bool)

(assert (=> start!35550 m!354157))

(declare-fun m!354159 () Bool)

(assert (=> b!356223 m!354159))

(declare-fun m!354161 () Bool)

(assert (=> mapNonEmpty!13533 m!354161))

(check-sat (not b!356225) (not start!35550) (not b!356220) (not b!356223) (not b!356226) (not b!356224) tp_is_empty!8017 (not mapNonEmpty!13533))
(check-sat)
