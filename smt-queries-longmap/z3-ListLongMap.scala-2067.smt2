; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35556 () Bool)

(assert start!35556)

(declare-fun b!356539 () Bool)

(declare-fun res!197890 () Bool)

(declare-fun e!218436 () Bool)

(assert (=> b!356539 (=> (not res!197890) (not e!218436))))

(declare-datatypes ((array!19598 0))(
  ( (array!19599 (arr!9292 (Array (_ BitVec 32) (_ BitVec 64))) (size!9644 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19598)

(declare-datatypes ((List!5281 0))(
  ( (Nil!5278) (Cons!5277 (h!6133 (_ BitVec 64)) (t!10423 List!5281)) )
))
(declare-fun arrayNoDuplicates!0 (array!19598 (_ BitVec 32) List!5281) Bool)

(assert (=> b!356539 (= res!197890 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5278))))

(declare-fun b!356540 () Bool)

(declare-fun res!197895 () Bool)

(assert (=> b!356540 (=> (not res!197895) (not e!218436))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356540 (= res!197895 (validKeyInArray!0 k0!1077))))

(declare-fun mapIsEmpty!13542 () Bool)

(declare-fun mapRes!13542 () Bool)

(assert (=> mapIsEmpty!13542 mapRes!13542))

(declare-fun mapNonEmpty!13542 () Bool)

(declare-fun tp!27519 () Bool)

(declare-fun e!218435 () Bool)

(assert (=> mapNonEmpty!13542 (= mapRes!13542 (and tp!27519 e!218435))))

(declare-fun mapKey!13542 () (_ BitVec 32))

(declare-datatypes ((V!11675 0))(
  ( (V!11676 (val!4056 Int)) )
))
(declare-datatypes ((ValueCell!3668 0))(
  ( (ValueCellFull!3668 (v!6251 V!11675)) (EmptyCell!3668) )
))
(declare-fun mapValue!13542 () ValueCell!3668)

(declare-fun mapRest!13542 () (Array (_ BitVec 32) ValueCell!3668))

(declare-datatypes ((array!19600 0))(
  ( (array!19601 (arr!9293 (Array (_ BitVec 32) ValueCell!3668)) (size!9645 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19600)

(assert (=> mapNonEmpty!13542 (= (arr!9293 _values!1208) (store mapRest!13542 mapKey!13542 mapValue!13542))))

(declare-fun b!356542 () Bool)

(assert (=> b!356542 (= e!218436 (not true))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356542 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11675)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10963 0))(
  ( (Unit!10964) )
))
(declare-fun lt!165968 () Unit!10963)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11675)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!10 (array!19598 array!19600 (_ BitVec 32) (_ BitVec 32) V!11675 V!11675 (_ BitVec 64) (_ BitVec 32)) Unit!10963)

(assert (=> b!356542 (= lt!165968 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!10 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356543 () Bool)

(declare-fun res!197896 () Bool)

(assert (=> b!356543 (=> (not res!197896) (not e!218436))))

(assert (=> b!356543 (= res!197896 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356544 () Bool)

(declare-fun tp_is_empty!8023 () Bool)

(assert (=> b!356544 (= e!218435 tp_is_empty!8023)))

(declare-fun b!356545 () Bool)

(declare-fun e!218433 () Bool)

(declare-fun e!218434 () Bool)

(assert (=> b!356545 (= e!218433 (and e!218434 mapRes!13542))))

(declare-fun condMapEmpty!13542 () Bool)

(declare-fun mapDefault!13542 () ValueCell!3668)

(assert (=> b!356545 (= condMapEmpty!13542 (= (arr!9293 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3668)) mapDefault!13542)))))

(declare-fun b!356546 () Bool)

(declare-fun res!197892 () Bool)

(assert (=> b!356546 (=> (not res!197892) (not e!218436))))

(assert (=> b!356546 (= res!197892 (and (= (size!9645 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9644 _keys!1456) (size!9645 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356547 () Bool)

(declare-fun res!197893 () Bool)

(assert (=> b!356547 (=> (not res!197893) (not e!218436))))

(assert (=> b!356547 (= res!197893 (not (= (select (arr!9292 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356548 () Bool)

(declare-fun res!197894 () Bool)

(assert (=> b!356548 (=> (not res!197894) (not e!218436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19598 (_ BitVec 32)) Bool)

(assert (=> b!356548 (= res!197894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356549 () Bool)

(assert (=> b!356549 (= e!218434 tp_is_empty!8023)))

(declare-fun res!197891 () Bool)

(assert (=> start!35556 (=> (not res!197891) (not e!218436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35556 (= res!197891 (validMask!0 mask!1842))))

(assert (=> start!35556 e!218436))

(assert (=> start!35556 tp_is_empty!8023))

(assert (=> start!35556 true))

(declare-fun array_inv!6870 (array!19598) Bool)

(assert (=> start!35556 (array_inv!6870 _keys!1456)))

(declare-fun array_inv!6871 (array!19600) Bool)

(assert (=> start!35556 (and (array_inv!6871 _values!1208) e!218433)))

(declare-fun b!356541 () Bool)

(declare-fun res!197889 () Bool)

(assert (=> b!356541 (=> (not res!197889) (not e!218436))))

(assert (=> b!356541 (= res!197889 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9644 _keys!1456))))))

(assert (= (and start!35556 res!197891) b!356546))

(assert (= (and b!356546 res!197892) b!356548))

(assert (= (and b!356548 res!197894) b!356539))

(assert (= (and b!356539 res!197890) b!356540))

(assert (= (and b!356540 res!197895) b!356541))

(assert (= (and b!356541 res!197889) b!356543))

(assert (= (and b!356543 res!197896) b!356547))

(assert (= (and b!356547 res!197893) b!356542))

(assert (= (and b!356545 condMapEmpty!13542) mapIsEmpty!13542))

(assert (= (and b!356545 (not condMapEmpty!13542)) mapNonEmpty!13542))

(get-info :version)

(assert (= (and mapNonEmpty!13542 ((_ is ValueCellFull!3668) mapValue!13542)) b!356544))

(assert (= (and b!356545 ((_ is ValueCellFull!3668) mapDefault!13542)) b!356549))

(assert (= start!35556 b!356545))

(declare-fun m!355161 () Bool)

(assert (=> b!356540 m!355161))

(declare-fun m!355163 () Bool)

(assert (=> mapNonEmpty!13542 m!355163))

(declare-fun m!355165 () Bool)

(assert (=> b!356547 m!355165))

(declare-fun m!355167 () Bool)

(assert (=> b!356542 m!355167))

(declare-fun m!355169 () Bool)

(assert (=> b!356542 m!355169))

(declare-fun m!355171 () Bool)

(assert (=> b!356548 m!355171))

(declare-fun m!355173 () Bool)

(assert (=> b!356543 m!355173))

(declare-fun m!355175 () Bool)

(assert (=> start!35556 m!355175))

(declare-fun m!355177 () Bool)

(assert (=> start!35556 m!355177))

(declare-fun m!355179 () Bool)

(assert (=> start!35556 m!355179))

(declare-fun m!355181 () Bool)

(assert (=> b!356539 m!355181))

(check-sat (not b!356542) (not b!356540) (not mapNonEmpty!13542) (not b!356548) (not b!356543) (not start!35556) tp_is_empty!8023 (not b!356539))
(check-sat)
