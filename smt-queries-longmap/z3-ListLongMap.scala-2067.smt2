; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35556 () Bool)

(assert start!35556)

(declare-fun b!356317 () Bool)

(declare-fun res!197770 () Bool)

(declare-fun e!218294 () Bool)

(assert (=> b!356317 (=> (not res!197770) (not e!218294))))

(declare-datatypes ((array!19603 0))(
  ( (array!19604 (arr!9295 (Array (_ BitVec 32) (_ BitVec 64))) (size!9648 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19603)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!356317 (= res!197770 (not (= (select (arr!9295 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!197766 () Bool)

(assert (=> start!35556 (=> (not res!197766) (not e!218294))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35556 (= res!197766 (validMask!0 mask!1842))))

(assert (=> start!35556 e!218294))

(declare-fun tp_is_empty!8023 () Bool)

(assert (=> start!35556 tp_is_empty!8023))

(assert (=> start!35556 true))

(declare-fun array_inv!6872 (array!19603) Bool)

(assert (=> start!35556 (array_inv!6872 _keys!1456)))

(declare-datatypes ((V!11675 0))(
  ( (V!11676 (val!4056 Int)) )
))
(declare-datatypes ((ValueCell!3668 0))(
  ( (ValueCellFull!3668 (v!6244 V!11675)) (EmptyCell!3668) )
))
(declare-datatypes ((array!19605 0))(
  ( (array!19606 (arr!9296 (Array (_ BitVec 32) ValueCell!3668)) (size!9649 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19605)

(declare-fun e!218292 () Bool)

(declare-fun array_inv!6873 (array!19605) Bool)

(assert (=> start!35556 (and (array_inv!6873 _values!1208) e!218292)))

(declare-fun mapNonEmpty!13542 () Bool)

(declare-fun mapRes!13542 () Bool)

(declare-fun tp!27519 () Bool)

(declare-fun e!218293 () Bool)

(assert (=> mapNonEmpty!13542 (= mapRes!13542 (and tp!27519 e!218293))))

(declare-fun mapValue!13542 () ValueCell!3668)

(declare-fun mapKey!13542 () (_ BitVec 32))

(declare-fun mapRest!13542 () (Array (_ BitVec 32) ValueCell!3668))

(assert (=> mapNonEmpty!13542 (= (arr!9296 _values!1208) (store mapRest!13542 mapKey!13542 mapValue!13542))))

(declare-fun b!356318 () Bool)

(assert (=> b!356318 (= e!218293 tp_is_empty!8023)))

(declare-fun b!356319 () Bool)

(declare-fun res!197764 () Bool)

(assert (=> b!356319 (=> (not res!197764) (not e!218294))))

(declare-fun arrayContainsKey!0 (array!19603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356319 (= res!197764 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356320 () Bool)

(declare-fun res!197765 () Bool)

(assert (=> b!356320 (=> (not res!197765) (not e!218294))))

(assert (=> b!356320 (= res!197765 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9648 _keys!1456))))))

(declare-fun b!356321 () Bool)

(declare-fun res!197763 () Bool)

(assert (=> b!356321 (=> (not res!197763) (not e!218294))))

(declare-datatypes ((List!5341 0))(
  ( (Nil!5338) (Cons!5337 (h!6193 (_ BitVec 64)) (t!10482 List!5341)) )
))
(declare-fun arrayNoDuplicates!0 (array!19603 (_ BitVec 32) List!5341) Bool)

(assert (=> b!356321 (= res!197763 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5338))))

(declare-fun b!356322 () Bool)

(declare-fun e!218291 () Bool)

(assert (=> b!356322 (= e!218291 tp_is_empty!8023)))

(declare-fun mapIsEmpty!13542 () Bool)

(assert (=> mapIsEmpty!13542 mapRes!13542))

(declare-fun b!356323 () Bool)

(declare-fun res!197767 () Bool)

(assert (=> b!356323 (=> (not res!197767) (not e!218294))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356323 (= res!197767 (and (= (size!9649 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9648 _keys!1456) (size!9649 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356324 () Bool)

(declare-fun res!197769 () Bool)

(assert (=> b!356324 (=> (not res!197769) (not e!218294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19603 (_ BitVec 32)) Bool)

(assert (=> b!356324 (= res!197769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356325 () Bool)

(assert (=> b!356325 (= e!218292 (and e!218291 mapRes!13542))))

(declare-fun condMapEmpty!13542 () Bool)

(declare-fun mapDefault!13542 () ValueCell!3668)

(assert (=> b!356325 (= condMapEmpty!13542 (= (arr!9296 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3668)) mapDefault!13542)))))

(declare-fun b!356326 () Bool)

(assert (=> b!356326 (= e!218294 (not true))))

(assert (=> b!356326 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11675)

(declare-datatypes ((Unit!10966 0))(
  ( (Unit!10967) )
))
(declare-fun lt!165715 () Unit!10966)

(declare-fun zeroValue!1150 () V!11675)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!10 (array!19603 array!19605 (_ BitVec 32) (_ BitVec 32) V!11675 V!11675 (_ BitVec 64) (_ BitVec 32)) Unit!10966)

(assert (=> b!356326 (= lt!165715 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!10 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356327 () Bool)

(declare-fun res!197768 () Bool)

(assert (=> b!356327 (=> (not res!197768) (not e!218294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356327 (= res!197768 (validKeyInArray!0 k0!1077))))

(assert (= (and start!35556 res!197766) b!356323))

(assert (= (and b!356323 res!197767) b!356324))

(assert (= (and b!356324 res!197769) b!356321))

(assert (= (and b!356321 res!197763) b!356327))

(assert (= (and b!356327 res!197768) b!356320))

(assert (= (and b!356320 res!197765) b!356319))

(assert (= (and b!356319 res!197764) b!356317))

(assert (= (and b!356317 res!197770) b!356326))

(assert (= (and b!356325 condMapEmpty!13542) mapIsEmpty!13542))

(assert (= (and b!356325 (not condMapEmpty!13542)) mapNonEmpty!13542))

(get-info :version)

(assert (= (and mapNonEmpty!13542 ((_ is ValueCellFull!3668) mapValue!13542)) b!356318))

(assert (= (and b!356325 ((_ is ValueCellFull!3668) mapDefault!13542)) b!356322))

(assert (= start!35556 b!356325))

(declare-fun m!354207 () Bool)

(assert (=> b!356321 m!354207))

(declare-fun m!354209 () Bool)

(assert (=> b!356317 m!354209))

(declare-fun m!354211 () Bool)

(assert (=> start!35556 m!354211))

(declare-fun m!354213 () Bool)

(assert (=> start!35556 m!354213))

(declare-fun m!354215 () Bool)

(assert (=> start!35556 m!354215))

(declare-fun m!354217 () Bool)

(assert (=> b!356319 m!354217))

(declare-fun m!354219 () Bool)

(assert (=> b!356326 m!354219))

(declare-fun m!354221 () Bool)

(assert (=> b!356326 m!354221))

(declare-fun m!354223 () Bool)

(assert (=> b!356327 m!354223))

(declare-fun m!354225 () Bool)

(assert (=> b!356324 m!354225))

(declare-fun m!354227 () Bool)

(assert (=> mapNonEmpty!13542 m!354227))

(check-sat tp_is_empty!8023 (not b!356324) (not b!356319) (not b!356327) (not mapNonEmpty!13542) (not start!35556) (not b!356326) (not b!356321))
(check-sat)
