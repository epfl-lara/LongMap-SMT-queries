; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35562 () Bool)

(assert start!35562)

(declare-fun b!356638 () Bool)

(declare-fun e!218479 () Bool)

(assert (=> b!356638 (= e!218479 (not true))))

(declare-datatypes ((array!19610 0))(
  ( (array!19611 (arr!9298 (Array (_ BitVec 32) (_ BitVec 64))) (size!9650 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19610)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356638 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!11683 0))(
  ( (V!11684 (val!4059 Int)) )
))
(declare-fun minValue!1150 () V!11683)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!10967 0))(
  ( (Unit!10968) )
))
(declare-fun lt!165977 () Unit!10967)

(declare-datatypes ((ValueCell!3671 0))(
  ( (ValueCellFull!3671 (v!6254 V!11683)) (EmptyCell!3671) )
))
(declare-datatypes ((array!19612 0))(
  ( (array!19613 (arr!9299 (Array (_ BitVec 32) ValueCell!3671)) (size!9651 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19612)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11683)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!12 (array!19610 array!19612 (_ BitVec 32) (_ BitVec 32) V!11683 V!11683 (_ BitVec 64) (_ BitVec 32)) Unit!10967)

(assert (=> b!356638 (= lt!165977 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!12 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13551 () Bool)

(declare-fun mapRes!13551 () Bool)

(declare-fun tp!27528 () Bool)

(declare-fun e!218482 () Bool)

(assert (=> mapNonEmpty!13551 (= mapRes!13551 (and tp!27528 e!218482))))

(declare-fun mapKey!13551 () (_ BitVec 32))

(declare-fun mapRest!13551 () (Array (_ BitVec 32) ValueCell!3671))

(declare-fun mapValue!13551 () ValueCell!3671)

(assert (=> mapNonEmpty!13551 (= (arr!9299 _values!1208) (store mapRest!13551 mapKey!13551 mapValue!13551))))

(declare-fun b!356639 () Bool)

(declare-fun res!197964 () Bool)

(assert (=> b!356639 (=> (not res!197964) (not e!218479))))

(assert (=> b!356639 (= res!197964 (not (= (select (arr!9298 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356640 () Bool)

(declare-fun e!218480 () Bool)

(declare-fun e!218478 () Bool)

(assert (=> b!356640 (= e!218480 (and e!218478 mapRes!13551))))

(declare-fun condMapEmpty!13551 () Bool)

(declare-fun mapDefault!13551 () ValueCell!3671)

(assert (=> b!356640 (= condMapEmpty!13551 (= (arr!9299 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3671)) mapDefault!13551)))))

(declare-fun b!356641 () Bool)

(declare-fun tp_is_empty!8029 () Bool)

(assert (=> b!356641 (= e!218482 tp_is_empty!8029)))

(declare-fun b!356642 () Bool)

(declare-fun res!197962 () Bool)

(assert (=> b!356642 (=> (not res!197962) (not e!218479))))

(assert (=> b!356642 (= res!197962 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9650 _keys!1456))))))

(declare-fun mapIsEmpty!13551 () Bool)

(assert (=> mapIsEmpty!13551 mapRes!13551))

(declare-fun b!356644 () Bool)

(declare-fun res!197968 () Bool)

(assert (=> b!356644 (=> (not res!197968) (not e!218479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356644 (= res!197968 (validKeyInArray!0 k0!1077))))

(declare-fun b!356645 () Bool)

(declare-fun res!197966 () Bool)

(assert (=> b!356645 (=> (not res!197966) (not e!218479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19610 (_ BitVec 32)) Bool)

(assert (=> b!356645 (= res!197966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356646 () Bool)

(assert (=> b!356646 (= e!218478 tp_is_empty!8029)))

(declare-fun res!197963 () Bool)

(assert (=> start!35562 (=> (not res!197963) (not e!218479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35562 (= res!197963 (validMask!0 mask!1842))))

(assert (=> start!35562 e!218479))

(assert (=> start!35562 tp_is_empty!8029))

(assert (=> start!35562 true))

(declare-fun array_inv!6872 (array!19610) Bool)

(assert (=> start!35562 (array_inv!6872 _keys!1456)))

(declare-fun array_inv!6873 (array!19612) Bool)

(assert (=> start!35562 (and (array_inv!6873 _values!1208) e!218480)))

(declare-fun b!356643 () Bool)

(declare-fun res!197961 () Bool)

(assert (=> b!356643 (=> (not res!197961) (not e!218479))))

(assert (=> b!356643 (= res!197961 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356647 () Bool)

(declare-fun res!197965 () Bool)

(assert (=> b!356647 (=> (not res!197965) (not e!218479))))

(assert (=> b!356647 (= res!197965 (and (= (size!9651 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9650 _keys!1456) (size!9651 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356648 () Bool)

(declare-fun res!197967 () Bool)

(assert (=> b!356648 (=> (not res!197967) (not e!218479))))

(declare-datatypes ((List!5283 0))(
  ( (Nil!5280) (Cons!5279 (h!6135 (_ BitVec 64)) (t!10425 List!5283)) )
))
(declare-fun arrayNoDuplicates!0 (array!19610 (_ BitVec 32) List!5283) Bool)

(assert (=> b!356648 (= res!197967 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5280))))

(assert (= (and start!35562 res!197963) b!356647))

(assert (= (and b!356647 res!197965) b!356645))

(assert (= (and b!356645 res!197966) b!356648))

(assert (= (and b!356648 res!197967) b!356644))

(assert (= (and b!356644 res!197968) b!356642))

(assert (= (and b!356642 res!197962) b!356643))

(assert (= (and b!356643 res!197961) b!356639))

(assert (= (and b!356639 res!197964) b!356638))

(assert (= (and b!356640 condMapEmpty!13551) mapIsEmpty!13551))

(assert (= (and b!356640 (not condMapEmpty!13551)) mapNonEmpty!13551))

(get-info :version)

(assert (= (and mapNonEmpty!13551 ((_ is ValueCellFull!3671) mapValue!13551)) b!356641))

(assert (= (and b!356640 ((_ is ValueCellFull!3671) mapDefault!13551)) b!356646))

(assert (= start!35562 b!356640))

(declare-fun m!355227 () Bool)

(assert (=> mapNonEmpty!13551 m!355227))

(declare-fun m!355229 () Bool)

(assert (=> b!356643 m!355229))

(declare-fun m!355231 () Bool)

(assert (=> b!356645 m!355231))

(declare-fun m!355233 () Bool)

(assert (=> b!356639 m!355233))

(declare-fun m!355235 () Bool)

(assert (=> b!356644 m!355235))

(declare-fun m!355237 () Bool)

(assert (=> b!356638 m!355237))

(declare-fun m!355239 () Bool)

(assert (=> b!356638 m!355239))

(declare-fun m!355241 () Bool)

(assert (=> start!35562 m!355241))

(declare-fun m!355243 () Bool)

(assert (=> start!35562 m!355243))

(declare-fun m!355245 () Bool)

(assert (=> start!35562 m!355245))

(declare-fun m!355247 () Bool)

(assert (=> b!356648 m!355247))

(check-sat tp_is_empty!8029 (not b!356638) (not mapNonEmpty!13551) (not b!356643) (not b!356645) (not b!356648) (not start!35562) (not b!356644))
(check-sat)
