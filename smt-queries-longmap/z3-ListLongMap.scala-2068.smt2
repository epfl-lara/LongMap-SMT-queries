; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35562 () Bool)

(assert start!35562)

(declare-fun b!356416 () Bool)

(declare-fun res!197836 () Bool)

(declare-fun e!218337 () Bool)

(assert (=> b!356416 (=> (not res!197836) (not e!218337))))

(declare-datatypes ((array!19615 0))(
  ( (array!19616 (arr!9301 (Array (_ BitVec 32) (_ BitVec 64))) (size!9654 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19615)

(declare-datatypes ((List!5342 0))(
  ( (Nil!5339) (Cons!5338 (h!6194 (_ BitVec 64)) (t!10483 List!5342)) )
))
(declare-fun arrayNoDuplicates!0 (array!19615 (_ BitVec 32) List!5342) Bool)

(assert (=> b!356416 (= res!197836 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5339))))

(declare-fun b!356417 () Bool)

(declare-fun res!197839 () Bool)

(assert (=> b!356417 (=> (not res!197839) (not e!218337))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19615 (_ BitVec 32)) Bool)

(assert (=> b!356417 (= res!197839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13551 () Bool)

(declare-fun mapRes!13551 () Bool)

(assert (=> mapIsEmpty!13551 mapRes!13551))

(declare-fun b!356418 () Bool)

(declare-fun res!197842 () Bool)

(assert (=> b!356418 (=> (not res!197842) (not e!218337))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356418 (= res!197842 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9654 _keys!1456))))))

(declare-fun b!356419 () Bool)

(declare-fun e!218339 () Bool)

(declare-fun e!218338 () Bool)

(assert (=> b!356419 (= e!218339 (and e!218338 mapRes!13551))))

(declare-fun condMapEmpty!13551 () Bool)

(declare-datatypes ((V!11683 0))(
  ( (V!11684 (val!4059 Int)) )
))
(declare-datatypes ((ValueCell!3671 0))(
  ( (ValueCellFull!3671 (v!6247 V!11683)) (EmptyCell!3671) )
))
(declare-datatypes ((array!19617 0))(
  ( (array!19618 (arr!9302 (Array (_ BitVec 32) ValueCell!3671)) (size!9655 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19617)

(declare-fun mapDefault!13551 () ValueCell!3671)

(assert (=> b!356419 (= condMapEmpty!13551 (= (arr!9302 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3671)) mapDefault!13551)))))

(declare-fun b!356420 () Bool)

(declare-fun res!197838 () Bool)

(assert (=> b!356420 (=> (not res!197838) (not e!218337))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356420 (= res!197838 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356421 () Bool)

(declare-fun res!197841 () Bool)

(assert (=> b!356421 (=> (not res!197841) (not e!218337))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356421 (= res!197841 (and (= (size!9655 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9654 _keys!1456) (size!9655 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356422 () Bool)

(declare-fun res!197840 () Bool)

(assert (=> b!356422 (=> (not res!197840) (not e!218337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356422 (= res!197840 (validKeyInArray!0 k0!1077))))

(declare-fun b!356424 () Bool)

(declare-fun tp_is_empty!8029 () Bool)

(assert (=> b!356424 (= e!218338 tp_is_empty!8029)))

(declare-fun res!197835 () Bool)

(assert (=> start!35562 (=> (not res!197835) (not e!218337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35562 (= res!197835 (validMask!0 mask!1842))))

(assert (=> start!35562 e!218337))

(assert (=> start!35562 tp_is_empty!8029))

(assert (=> start!35562 true))

(declare-fun array_inv!6874 (array!19615) Bool)

(assert (=> start!35562 (array_inv!6874 _keys!1456)))

(declare-fun array_inv!6875 (array!19617) Bool)

(assert (=> start!35562 (and (array_inv!6875 _values!1208) e!218339)))

(declare-fun b!356423 () Bool)

(assert (=> b!356423 (= e!218337 (not true))))

(assert (=> b!356423 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11683)

(declare-datatypes ((Unit!10968 0))(
  ( (Unit!10969) )
))
(declare-fun lt!165724 () Unit!10968)

(declare-fun zeroValue!1150 () V!11683)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!11 (array!19615 array!19617 (_ BitVec 32) (_ BitVec 32) V!11683 V!11683 (_ BitVec 64) (_ BitVec 32)) Unit!10968)

(assert (=> b!356423 (= lt!165724 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!11 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13551 () Bool)

(declare-fun tp!27528 () Bool)

(declare-fun e!218340 () Bool)

(assert (=> mapNonEmpty!13551 (= mapRes!13551 (and tp!27528 e!218340))))

(declare-fun mapKey!13551 () (_ BitVec 32))

(declare-fun mapRest!13551 () (Array (_ BitVec 32) ValueCell!3671))

(declare-fun mapValue!13551 () ValueCell!3671)

(assert (=> mapNonEmpty!13551 (= (arr!9302 _values!1208) (store mapRest!13551 mapKey!13551 mapValue!13551))))

(declare-fun b!356425 () Bool)

(declare-fun res!197837 () Bool)

(assert (=> b!356425 (=> (not res!197837) (not e!218337))))

(assert (=> b!356425 (= res!197837 (not (= (select (arr!9301 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356426 () Bool)

(assert (=> b!356426 (= e!218340 tp_is_empty!8029)))

(assert (= (and start!35562 res!197835) b!356421))

(assert (= (and b!356421 res!197841) b!356417))

(assert (= (and b!356417 res!197839) b!356416))

(assert (= (and b!356416 res!197836) b!356422))

(assert (= (and b!356422 res!197840) b!356418))

(assert (= (and b!356418 res!197842) b!356420))

(assert (= (and b!356420 res!197838) b!356425))

(assert (= (and b!356425 res!197837) b!356423))

(assert (= (and b!356419 condMapEmpty!13551) mapIsEmpty!13551))

(assert (= (and b!356419 (not condMapEmpty!13551)) mapNonEmpty!13551))

(get-info :version)

(assert (= (and mapNonEmpty!13551 ((_ is ValueCellFull!3671) mapValue!13551)) b!356426))

(assert (= (and b!356419 ((_ is ValueCellFull!3671) mapDefault!13551)) b!356424))

(assert (= start!35562 b!356419))

(declare-fun m!354273 () Bool)

(assert (=> b!356425 m!354273))

(declare-fun m!354275 () Bool)

(assert (=> b!356417 m!354275))

(declare-fun m!354277 () Bool)

(assert (=> start!35562 m!354277))

(declare-fun m!354279 () Bool)

(assert (=> start!35562 m!354279))

(declare-fun m!354281 () Bool)

(assert (=> start!35562 m!354281))

(declare-fun m!354283 () Bool)

(assert (=> mapNonEmpty!13551 m!354283))

(declare-fun m!354285 () Bool)

(assert (=> b!356416 m!354285))

(declare-fun m!354287 () Bool)

(assert (=> b!356420 m!354287))

(declare-fun m!354289 () Bool)

(assert (=> b!356423 m!354289))

(declare-fun m!354291 () Bool)

(assert (=> b!356423 m!354291))

(declare-fun m!354293 () Bool)

(assert (=> b!356422 m!354293))

(check-sat (not b!356416) (not b!356417) tp_is_empty!8029 (not b!356420) (not b!356423) (not start!35562) (not mapNonEmpty!13551) (not b!356422))
(check-sat)
