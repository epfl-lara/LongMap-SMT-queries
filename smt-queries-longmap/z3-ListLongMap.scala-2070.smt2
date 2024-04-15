; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35574 () Bool)

(assert start!35574)

(declare-fun b!356614 () Bool)

(declare-fun e!218429 () Bool)

(assert (=> b!356614 (= e!218429 (not true))))

(declare-datatypes ((array!19639 0))(
  ( (array!19640 (arr!9313 (Array (_ BitVec 32) (_ BitVec 64))) (size!9666 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19639)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356614 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11699 0))(
  ( (V!11700 (val!4065 Int)) )
))
(declare-fun minValue!1150 () V!11699)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10976 0))(
  ( (Unit!10977) )
))
(declare-fun lt!165742 () Unit!10976)

(declare-datatypes ((ValueCell!3677 0))(
  ( (ValueCellFull!3677 (v!6253 V!11699)) (EmptyCell!3677) )
))
(declare-datatypes ((array!19641 0))(
  ( (array!19642 (arr!9314 (Array (_ BitVec 32) ValueCell!3677)) (size!9667 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19641)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11699)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!15 (array!19639 array!19641 (_ BitVec 32) (_ BitVec 32) V!11699 V!11699 (_ BitVec 64) (_ BitVec 32)) Unit!10976)

(assert (=> b!356614 (= lt!165742 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!15 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356615 () Bool)

(declare-fun e!218428 () Bool)

(declare-fun tp_is_empty!8041 () Bool)

(assert (=> b!356615 (= e!218428 tp_is_empty!8041)))

(declare-fun b!356616 () Bool)

(declare-fun res!197979 () Bool)

(assert (=> b!356616 (=> (not res!197979) (not e!218429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356616 (= res!197979 (validKeyInArray!0 k0!1077))))

(declare-fun b!356617 () Bool)

(declare-fun res!197982 () Bool)

(assert (=> b!356617 (=> (not res!197982) (not e!218429))))

(declare-datatypes ((List!5346 0))(
  ( (Nil!5343) (Cons!5342 (h!6198 (_ BitVec 64)) (t!10487 List!5346)) )
))
(declare-fun arrayNoDuplicates!0 (array!19639 (_ BitVec 32) List!5346) Bool)

(assert (=> b!356617 (= res!197982 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5343))))

(declare-fun mapIsEmpty!13569 () Bool)

(declare-fun mapRes!13569 () Bool)

(assert (=> mapIsEmpty!13569 mapRes!13569))

(declare-fun mapNonEmpty!13569 () Bool)

(declare-fun tp!27546 () Bool)

(assert (=> mapNonEmpty!13569 (= mapRes!13569 (and tp!27546 e!218428))))

(declare-fun mapValue!13569 () ValueCell!3677)

(declare-fun mapKey!13569 () (_ BitVec 32))

(declare-fun mapRest!13569 () (Array (_ BitVec 32) ValueCell!3677))

(assert (=> mapNonEmpty!13569 (= (arr!9314 _values!1208) (store mapRest!13569 mapKey!13569 mapValue!13569))))

(declare-fun b!356618 () Bool)

(declare-fun e!218430 () Bool)

(declare-fun e!218426 () Bool)

(assert (=> b!356618 (= e!218430 (and e!218426 mapRes!13569))))

(declare-fun condMapEmpty!13569 () Bool)

(declare-fun mapDefault!13569 () ValueCell!3677)

(assert (=> b!356618 (= condMapEmpty!13569 (= (arr!9314 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3677)) mapDefault!13569)))))

(declare-fun res!197981 () Bool)

(assert (=> start!35574 (=> (not res!197981) (not e!218429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35574 (= res!197981 (validMask!0 mask!1842))))

(assert (=> start!35574 e!218429))

(assert (=> start!35574 tp_is_empty!8041))

(assert (=> start!35574 true))

(declare-fun array_inv!6880 (array!19639) Bool)

(assert (=> start!35574 (array_inv!6880 _keys!1456)))

(declare-fun array_inv!6881 (array!19641) Bool)

(assert (=> start!35574 (and (array_inv!6881 _values!1208) e!218430)))

(declare-fun b!356619 () Bool)

(assert (=> b!356619 (= e!218426 tp_is_empty!8041)))

(declare-fun b!356620 () Bool)

(declare-fun res!197984 () Bool)

(assert (=> b!356620 (=> (not res!197984) (not e!218429))))

(assert (=> b!356620 (= res!197984 (not (= (select (arr!9313 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356621 () Bool)

(declare-fun res!197980 () Bool)

(assert (=> b!356621 (=> (not res!197980) (not e!218429))))

(assert (=> b!356621 (= res!197980 (and (= (size!9667 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9666 _keys!1456) (size!9667 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356622 () Bool)

(declare-fun res!197985 () Bool)

(assert (=> b!356622 (=> (not res!197985) (not e!218429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19639 (_ BitVec 32)) Bool)

(assert (=> b!356622 (= res!197985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356623 () Bool)

(declare-fun res!197986 () Bool)

(assert (=> b!356623 (=> (not res!197986) (not e!218429))))

(assert (=> b!356623 (= res!197986 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9666 _keys!1456))))))

(declare-fun b!356624 () Bool)

(declare-fun res!197983 () Bool)

(assert (=> b!356624 (=> (not res!197983) (not e!218429))))

(assert (=> b!356624 (= res!197983 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(assert (= (and start!35574 res!197981) b!356621))

(assert (= (and b!356621 res!197980) b!356622))

(assert (= (and b!356622 res!197985) b!356617))

(assert (= (and b!356617 res!197982) b!356616))

(assert (= (and b!356616 res!197979) b!356623))

(assert (= (and b!356623 res!197986) b!356624))

(assert (= (and b!356624 res!197983) b!356620))

(assert (= (and b!356620 res!197984) b!356614))

(assert (= (and b!356618 condMapEmpty!13569) mapIsEmpty!13569))

(assert (= (and b!356618 (not condMapEmpty!13569)) mapNonEmpty!13569))

(get-info :version)

(assert (= (and mapNonEmpty!13569 ((_ is ValueCellFull!3677) mapValue!13569)) b!356615))

(assert (= (and b!356618 ((_ is ValueCellFull!3677) mapDefault!13569)) b!356619))

(assert (= start!35574 b!356618))

(declare-fun m!354405 () Bool)

(assert (=> b!356617 m!354405))

(declare-fun m!354407 () Bool)

(assert (=> mapNonEmpty!13569 m!354407))

(declare-fun m!354409 () Bool)

(assert (=> b!356616 m!354409))

(declare-fun m!354411 () Bool)

(assert (=> b!356614 m!354411))

(declare-fun m!354413 () Bool)

(assert (=> b!356614 m!354413))

(declare-fun m!354415 () Bool)

(assert (=> b!356620 m!354415))

(declare-fun m!354417 () Bool)

(assert (=> start!35574 m!354417))

(declare-fun m!354419 () Bool)

(assert (=> start!35574 m!354419))

(declare-fun m!354421 () Bool)

(assert (=> start!35574 m!354421))

(declare-fun m!354423 () Bool)

(assert (=> b!356622 m!354423))

(declare-fun m!354425 () Bool)

(assert (=> b!356624 m!354425))

(check-sat (not start!35574) (not b!356614) (not b!356622) (not mapNonEmpty!13569) (not b!356616) (not b!356617) tp_is_empty!8041 (not b!356624))
(check-sat)
