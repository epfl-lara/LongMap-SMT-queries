; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35802 () Bool)

(assert start!35802)

(declare-fun b!359512 () Bool)

(declare-fun res!199854 () Bool)

(declare-fun e!220219 () Bool)

(assert (=> b!359512 (=> (not res!199854) (not e!220219))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!359512 (= res!199854 (validKeyInArray!0 k0!1077))))

(declare-fun b!359513 () Bool)

(assert (=> b!359513 (= e!220219 (not true))))

(declare-datatypes ((array!20065 0))(
  ( (array!20066 (arr!9526 (Array (_ BitVec 32) (_ BitVec 64))) (size!9879 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20065)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!359513 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12003 0))(
  ( (V!12004 (val!4179 Int)) )
))
(declare-fun minValue!1150 () V!12003)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3791 0))(
  ( (ValueCellFull!3791 (v!6367 V!12003)) (EmptyCell!3791) )
))
(declare-datatypes ((array!20067 0))(
  ( (array!20068 (arr!9527 (Array (_ BitVec 32) ValueCell!3791)) (size!9880 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20067)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12003)

(declare-datatypes ((Unit!11042 0))(
  ( (Unit!11043) )
))
(declare-fun lt!166156 () Unit!11042)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!44 (array!20065 array!20067 (_ BitVec 32) (_ BitVec 32) V!12003 V!12003 (_ BitVec 64) (_ BitVec 32)) Unit!11042)

(assert (=> b!359513 (= lt!166156 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!44 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!359514 () Bool)

(declare-fun res!199856 () Bool)

(assert (=> b!359514 (=> (not res!199856) (not e!220219))))

(assert (=> b!359514 (= res!199856 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9879 _keys!1456))))))

(declare-fun b!359515 () Bool)

(declare-fun res!199855 () Bool)

(assert (=> b!359515 (=> (not res!199855) (not e!220219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20065 (_ BitVec 32)) Bool)

(assert (=> b!359515 (= res!199855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359516 () Bool)

(declare-fun res!199857 () Bool)

(assert (=> b!359516 (=> (not res!199857) (not e!220219))))

(assert (=> b!359516 (= res!199857 (and (= (size!9880 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9879 _keys!1456) (size!9880 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359518 () Bool)

(declare-fun res!199852 () Bool)

(assert (=> b!359518 (=> (not res!199852) (not e!220219))))

(assert (=> b!359518 (= res!199852 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!359519 () Bool)

(declare-fun res!199858 () Bool)

(assert (=> b!359519 (=> (not res!199858) (not e!220219))))

(assert (=> b!359519 (= res!199858 (not (= (select (arr!9526 _keys!1456) from!1805) k0!1077)))))

(declare-fun mapIsEmpty!13911 () Bool)

(declare-fun mapRes!13911 () Bool)

(assert (=> mapIsEmpty!13911 mapRes!13911))

(declare-fun mapNonEmpty!13911 () Bool)

(declare-fun tp!27978 () Bool)

(declare-fun e!220221 () Bool)

(assert (=> mapNonEmpty!13911 (= mapRes!13911 (and tp!27978 e!220221))))

(declare-fun mapRest!13911 () (Array (_ BitVec 32) ValueCell!3791))

(declare-fun mapKey!13911 () (_ BitVec 32))

(declare-fun mapValue!13911 () ValueCell!3791)

(assert (=> mapNonEmpty!13911 (= (arr!9527 _values!1208) (store mapRest!13911 mapKey!13911 mapValue!13911))))

(declare-fun b!359520 () Bool)

(declare-fun tp_is_empty!8269 () Bool)

(assert (=> b!359520 (= e!220221 tp_is_empty!8269)))

(declare-fun b!359521 () Bool)

(declare-fun e!220218 () Bool)

(assert (=> b!359521 (= e!220218 tp_is_empty!8269)))

(declare-fun b!359522 () Bool)

(declare-fun e!220217 () Bool)

(assert (=> b!359522 (= e!220217 (and e!220218 mapRes!13911))))

(declare-fun condMapEmpty!13911 () Bool)

(declare-fun mapDefault!13911 () ValueCell!3791)

(assert (=> b!359522 (= condMapEmpty!13911 (= (arr!9527 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3791)) mapDefault!13911)))))

(declare-fun b!359517 () Bool)

(declare-fun res!199851 () Bool)

(assert (=> b!359517 (=> (not res!199851) (not e!220219))))

(declare-datatypes ((List!5443 0))(
  ( (Nil!5440) (Cons!5439 (h!6295 (_ BitVec 64)) (t!10584 List!5443)) )
))
(declare-fun arrayNoDuplicates!0 (array!20065 (_ BitVec 32) List!5443) Bool)

(assert (=> b!359517 (= res!199851 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5440))))

(declare-fun res!199853 () Bool)

(assert (=> start!35802 (=> (not res!199853) (not e!220219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35802 (= res!199853 (validMask!0 mask!1842))))

(assert (=> start!35802 e!220219))

(assert (=> start!35802 tp_is_empty!8269))

(assert (=> start!35802 true))

(declare-fun array_inv!7026 (array!20065) Bool)

(assert (=> start!35802 (array_inv!7026 _keys!1456)))

(declare-fun array_inv!7027 (array!20067) Bool)

(assert (=> start!35802 (and (array_inv!7027 _values!1208) e!220217)))

(assert (= (and start!35802 res!199853) b!359516))

(assert (= (and b!359516 res!199857) b!359515))

(assert (= (and b!359515 res!199855) b!359517))

(assert (= (and b!359517 res!199851) b!359512))

(assert (= (and b!359512 res!199854) b!359514))

(assert (= (and b!359514 res!199856) b!359518))

(assert (= (and b!359518 res!199852) b!359519))

(assert (= (and b!359519 res!199858) b!359513))

(assert (= (and b!359522 condMapEmpty!13911) mapIsEmpty!13911))

(assert (= (and b!359522 (not condMapEmpty!13911)) mapNonEmpty!13911))

(get-info :version)

(assert (= (and mapNonEmpty!13911 ((_ is ValueCellFull!3791) mapValue!13911)) b!359520))

(assert (= (and b!359522 ((_ is ValueCellFull!3791) mapDefault!13911)) b!359521))

(assert (= start!35802 b!359522))

(declare-fun m!356439 () Bool)

(assert (=> b!359513 m!356439))

(declare-fun m!356441 () Bool)

(assert (=> b!359513 m!356441))

(declare-fun m!356443 () Bool)

(assert (=> mapNonEmpty!13911 m!356443))

(declare-fun m!356445 () Bool)

(assert (=> b!359519 m!356445))

(declare-fun m!356447 () Bool)

(assert (=> start!35802 m!356447))

(declare-fun m!356449 () Bool)

(assert (=> start!35802 m!356449))

(declare-fun m!356451 () Bool)

(assert (=> start!35802 m!356451))

(declare-fun m!356453 () Bool)

(assert (=> b!359518 m!356453))

(declare-fun m!356455 () Bool)

(assert (=> b!359512 m!356455))

(declare-fun m!356457 () Bool)

(assert (=> b!359515 m!356457))

(declare-fun m!356459 () Bool)

(assert (=> b!359517 m!356459))

(check-sat (not b!359517) (not b!359513) (not b!359512) (not b!359518) (not start!35802) tp_is_empty!8269 (not b!359515) (not mapNonEmpty!13911))
(check-sat)
