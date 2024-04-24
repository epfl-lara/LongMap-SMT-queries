; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33670 () Bool)

(assert start!33670)

(declare-fun b_free!6919 () Bool)

(declare-fun b_next!6919 () Bool)

(assert (=> start!33670 (= b_free!6919 (not b_next!6919))))

(declare-fun tp!24260 () Bool)

(declare-fun b_and!14113 () Bool)

(assert (=> start!33670 (= tp!24260 b_and!14113)))

(declare-fun b!334615 () Bool)

(declare-fun e!205389 () Bool)

(declare-fun tp_is_empty!6871 () Bool)

(assert (=> b!334615 (= e!205389 tp_is_empty!6871)))

(declare-fun b!334616 () Bool)

(declare-fun e!205390 () Bool)

(assert (=> b!334616 (= e!205390 (not true))))

(declare-datatypes ((array!17328 0))(
  ( (array!17329 (arr!8194 (Array (_ BitVec 32) (_ BitVec 64))) (size!8546 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17328)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334616 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10387 0))(
  ( (Unit!10388) )
))
(declare-fun lt!159582 () Unit!10387)

(declare-datatypes ((SeekEntryResult!3133 0))(
  ( (MissingZero!3133 (index!14711 (_ BitVec 32))) (Found!3133 (index!14712 (_ BitVec 32))) (Intermediate!3133 (undefined!3945 Bool) (index!14713 (_ BitVec 32)) (x!33312 (_ BitVec 32))) (Undefined!3133) (MissingVacant!3133 (index!14714 (_ BitVec 32))) )
))
(declare-fun lt!159583 () SeekEntryResult!3133)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17328 (_ BitVec 64) (_ BitVec 32)) Unit!10387)

(assert (=> b!334616 (= lt!159582 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14712 lt!159583)))))

(declare-fun b!334617 () Bool)

(declare-fun e!205387 () Bool)

(declare-fun mapRes!11703 () Bool)

(assert (=> b!334617 (= e!205387 (and e!205389 mapRes!11703))))

(declare-fun condMapEmpty!11703 () Bool)

(declare-datatypes ((V!10139 0))(
  ( (V!10140 (val!3480 Int)) )
))
(declare-datatypes ((ValueCell!3092 0))(
  ( (ValueCellFull!3092 (v!5643 V!10139)) (EmptyCell!3092) )
))
(declare-datatypes ((array!17330 0))(
  ( (array!17331 (arr!8195 (Array (_ BitVec 32) ValueCell!3092)) (size!8547 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17330)

(declare-fun mapDefault!11703 () ValueCell!3092)

(assert (=> b!334617 (= condMapEmpty!11703 (= (arr!8195 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3092)) mapDefault!11703)))))

(declare-fun res!184537 () Bool)

(declare-fun e!205391 () Bool)

(assert (=> start!33670 (=> (not res!184537) (not e!205391))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33670 (= res!184537 (validMask!0 mask!2385))))

(assert (=> start!33670 e!205391))

(assert (=> start!33670 true))

(assert (=> start!33670 tp_is_empty!6871))

(assert (=> start!33670 tp!24260))

(declare-fun array_inv!6096 (array!17330) Bool)

(assert (=> start!33670 (and (array_inv!6096 _values!1525) e!205387)))

(declare-fun array_inv!6097 (array!17328) Bool)

(assert (=> start!33670 (array_inv!6097 _keys!1895)))

(declare-fun mapIsEmpty!11703 () Bool)

(assert (=> mapIsEmpty!11703 mapRes!11703))

(declare-fun b!334618 () Bool)

(declare-fun res!184539 () Bool)

(assert (=> b!334618 (=> (not res!184539) (not e!205391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17328 (_ BitVec 32)) Bool)

(assert (=> b!334618 (= res!184539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11703 () Bool)

(declare-fun tp!24261 () Bool)

(declare-fun e!205386 () Bool)

(assert (=> mapNonEmpty!11703 (= mapRes!11703 (and tp!24261 e!205386))))

(declare-fun mapRest!11703 () (Array (_ BitVec 32) ValueCell!3092))

(declare-fun mapKey!11703 () (_ BitVec 32))

(declare-fun mapValue!11703 () ValueCell!3092)

(assert (=> mapNonEmpty!11703 (= (arr!8195 _values!1525) (store mapRest!11703 mapKey!11703 mapValue!11703))))

(declare-fun b!334619 () Bool)

(assert (=> b!334619 (= e!205391 e!205390)))

(declare-fun res!184541 () Bool)

(assert (=> b!334619 (=> (not res!184541) (not e!205390))))

(get-info :version)

(assert (=> b!334619 (= res!184541 (and ((_ is Found!3133) lt!159583) (= (select (arr!8194 _keys!1895) (index!14712 lt!159583)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17328 (_ BitVec 32)) SeekEntryResult!3133)

(assert (=> b!334619 (= lt!159583 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334620 () Bool)

(declare-fun res!184542 () Bool)

(assert (=> b!334620 (=> (not res!184542) (not e!205391))))

(declare-fun zeroValue!1467 () V!10139)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10139)

(declare-datatypes ((tuple2!4976 0))(
  ( (tuple2!4977 (_1!2499 (_ BitVec 64)) (_2!2499 V!10139)) )
))
(declare-datatypes ((List!4592 0))(
  ( (Nil!4589) (Cons!4588 (h!5444 tuple2!4976) (t!9672 List!4592)) )
))
(declare-datatypes ((ListLongMap!3891 0))(
  ( (ListLongMap!3892 (toList!1961 List!4592)) )
))
(declare-fun contains!2024 (ListLongMap!3891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1493 (array!17328 array!17330 (_ BitVec 32) (_ BitVec 32) V!10139 V!10139 (_ BitVec 32) Int) ListLongMap!3891)

(assert (=> b!334620 (= res!184542 (not (contains!2024 (getCurrentListMap!1493 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334621 () Bool)

(declare-fun res!184538 () Bool)

(assert (=> b!334621 (=> (not res!184538) (not e!205391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334621 (= res!184538 (validKeyInArray!0 k0!1348))))

(declare-fun b!334622 () Bool)

(assert (=> b!334622 (= e!205386 tp_is_empty!6871)))

(declare-fun b!334623 () Bool)

(declare-fun res!184543 () Bool)

(assert (=> b!334623 (=> (not res!184543) (not e!205391))))

(declare-datatypes ((List!4593 0))(
  ( (Nil!4590) (Cons!4589 (h!5445 (_ BitVec 64)) (t!9673 List!4593)) )
))
(declare-fun arrayNoDuplicates!0 (array!17328 (_ BitVec 32) List!4593) Bool)

(assert (=> b!334623 (= res!184543 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4590))))

(declare-fun b!334624 () Bool)

(declare-fun res!184544 () Bool)

(assert (=> b!334624 (=> (not res!184544) (not e!205390))))

(assert (=> b!334624 (= res!184544 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14712 lt!159583)))))

(declare-fun b!334625 () Bool)

(declare-fun res!184540 () Bool)

(assert (=> b!334625 (=> (not res!184540) (not e!205391))))

(assert (=> b!334625 (= res!184540 (and (= (size!8547 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8546 _keys!1895) (size!8547 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33670 res!184537) b!334625))

(assert (= (and b!334625 res!184540) b!334618))

(assert (= (and b!334618 res!184539) b!334623))

(assert (= (and b!334623 res!184543) b!334621))

(assert (= (and b!334621 res!184538) b!334620))

(assert (= (and b!334620 res!184542) b!334619))

(assert (= (and b!334619 res!184541) b!334624))

(assert (= (and b!334624 res!184544) b!334616))

(assert (= (and b!334617 condMapEmpty!11703) mapIsEmpty!11703))

(assert (= (and b!334617 (not condMapEmpty!11703)) mapNonEmpty!11703))

(assert (= (and mapNonEmpty!11703 ((_ is ValueCellFull!3092) mapValue!11703)) b!334622))

(assert (= (and b!334617 ((_ is ValueCellFull!3092) mapDefault!11703)) b!334615))

(assert (= start!33670 b!334617))

(declare-fun m!338921 () Bool)

(assert (=> start!33670 m!338921))

(declare-fun m!338923 () Bool)

(assert (=> start!33670 m!338923))

(declare-fun m!338925 () Bool)

(assert (=> start!33670 m!338925))

(declare-fun m!338927 () Bool)

(assert (=> b!334619 m!338927))

(declare-fun m!338929 () Bool)

(assert (=> b!334619 m!338929))

(declare-fun m!338931 () Bool)

(assert (=> mapNonEmpty!11703 m!338931))

(declare-fun m!338933 () Bool)

(assert (=> b!334624 m!338933))

(declare-fun m!338935 () Bool)

(assert (=> b!334620 m!338935))

(assert (=> b!334620 m!338935))

(declare-fun m!338937 () Bool)

(assert (=> b!334620 m!338937))

(declare-fun m!338939 () Bool)

(assert (=> b!334616 m!338939))

(declare-fun m!338941 () Bool)

(assert (=> b!334616 m!338941))

(declare-fun m!338943 () Bool)

(assert (=> b!334623 m!338943))

(declare-fun m!338945 () Bool)

(assert (=> b!334621 m!338945))

(declare-fun m!338947 () Bool)

(assert (=> b!334618 m!338947))

(check-sat (not b!334621) (not mapNonEmpty!11703) (not b!334624) tp_is_empty!6871 (not start!33670) b_and!14113 (not b!334623) (not b!334616) (not b!334618) (not b!334619) (not b!334620) (not b_next!6919))
(check-sat b_and!14113 (not b_next!6919))
