; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72864 () Bool)

(assert start!72864)

(declare-fun b_free!13779 () Bool)

(declare-fun b_next!13779 () Bool)

(assert (=> start!72864 (= b_free!13779 (not b_next!13779))))

(declare-fun tp!48840 () Bool)

(declare-fun b_and!22865 () Bool)

(assert (=> start!72864 (= tp!48840 b_and!22865)))

(declare-fun mapIsEmpty!25472 () Bool)

(declare-fun mapRes!25472 () Bool)

(assert (=> mapIsEmpty!25472 mapRes!25472))

(declare-fun b!845737 () Bool)

(declare-fun res!574561 () Bool)

(declare-fun e!472098 () Bool)

(assert (=> b!845737 (=> (not res!574561) (not e!472098))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48048 0))(
  ( (array!48049 (arr!23055 (Array (_ BitVec 32) (_ BitVec 64))) (size!23495 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48048)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845737 (= res!574561 (and (= (select (arr!23055 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845738 () Bool)

(declare-fun res!574558 () Bool)

(assert (=> b!845738 (=> (not res!574558) (not e!472098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845738 (= res!574558 (validKeyInArray!0 k0!854))))

(declare-fun b!845739 () Bool)

(assert (=> b!845739 (= e!472098 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26267 0))(
  ( (V!26268 (val!8005 Int)) )
))
(declare-datatypes ((tuple2!10454 0))(
  ( (tuple2!10455 (_1!5238 (_ BitVec 64)) (_2!5238 V!26267)) )
))
(declare-datatypes ((List!16316 0))(
  ( (Nil!16313) (Cons!16312 (h!17443 tuple2!10454) (t!22687 List!16316)) )
))
(declare-datatypes ((ListLongMap!9223 0))(
  ( (ListLongMap!9224 (toList!4627 List!16316)) )
))
(declare-fun lt!381439 () ListLongMap!9223)

(declare-datatypes ((ValueCell!7518 0))(
  ( (ValueCellFull!7518 (v!10430 V!26267)) (EmptyCell!7518) )
))
(declare-datatypes ((array!48050 0))(
  ( (array!48051 (arr!23056 (Array (_ BitVec 32) ValueCell!7518)) (size!23496 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48050)

(declare-fun minValue!654 () V!26267)

(declare-fun zeroValue!654 () V!26267)

(declare-fun getCurrentListMapNoExtraKeys!2612 (array!48048 array!48050 (_ BitVec 32) (_ BitVec 32) V!26267 V!26267 (_ BitVec 32) Int) ListLongMap!9223)

(assert (=> b!845739 (= lt!381439 (getCurrentListMapNoExtraKeys!2612 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845740 () Bool)

(declare-fun e!472102 () Bool)

(declare-fun e!472100 () Bool)

(assert (=> b!845740 (= e!472102 (and e!472100 mapRes!25472))))

(declare-fun condMapEmpty!25472 () Bool)

(declare-fun mapDefault!25472 () ValueCell!7518)

(assert (=> b!845740 (= condMapEmpty!25472 (= (arr!23056 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7518)) mapDefault!25472)))))

(declare-fun b!845741 () Bool)

(declare-fun res!574559 () Bool)

(assert (=> b!845741 (=> (not res!574559) (not e!472098))))

(assert (=> b!845741 (= res!574559 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23495 _keys!868))))))

(declare-fun b!845743 () Bool)

(declare-fun res!574563 () Bool)

(assert (=> b!845743 (=> (not res!574563) (not e!472098))))

(assert (=> b!845743 (= res!574563 (and (= (size!23496 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23495 _keys!868) (size!23496 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845744 () Bool)

(declare-fun res!574560 () Bool)

(assert (=> b!845744 (=> (not res!574560) (not e!472098))))

(declare-datatypes ((List!16317 0))(
  ( (Nil!16314) (Cons!16313 (h!17444 (_ BitVec 64)) (t!22688 List!16317)) )
))
(declare-fun arrayNoDuplicates!0 (array!48048 (_ BitVec 32) List!16317) Bool)

(assert (=> b!845744 (= res!574560 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16314))))

(declare-fun b!845745 () Bool)

(declare-fun e!472099 () Bool)

(declare-fun tp_is_empty!15915 () Bool)

(assert (=> b!845745 (= e!472099 tp_is_empty!15915)))

(declare-fun b!845746 () Bool)

(declare-fun res!574565 () Bool)

(assert (=> b!845746 (=> (not res!574565) (not e!472098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48048 (_ BitVec 32)) Bool)

(assert (=> b!845746 (= res!574565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845747 () Bool)

(assert (=> b!845747 (= e!472100 tp_is_empty!15915)))

(declare-fun mapNonEmpty!25472 () Bool)

(declare-fun tp!48841 () Bool)

(assert (=> mapNonEmpty!25472 (= mapRes!25472 (and tp!48841 e!472099))))

(declare-fun mapValue!25472 () ValueCell!7518)

(declare-fun mapKey!25472 () (_ BitVec 32))

(declare-fun mapRest!25472 () (Array (_ BitVec 32) ValueCell!7518))

(assert (=> mapNonEmpty!25472 (= (arr!23056 _values!688) (store mapRest!25472 mapKey!25472 mapValue!25472))))

(declare-fun res!574564 () Bool)

(assert (=> start!72864 (=> (not res!574564) (not e!472098))))

(assert (=> start!72864 (= res!574564 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23495 _keys!868))))))

(assert (=> start!72864 e!472098))

(assert (=> start!72864 true))

(assert (=> start!72864 tp!48840))

(declare-fun array_inv!18320 (array!48048) Bool)

(assert (=> start!72864 (array_inv!18320 _keys!868)))

(declare-fun array_inv!18321 (array!48050) Bool)

(assert (=> start!72864 (and (array_inv!18321 _values!688) e!472102)))

(assert (=> start!72864 tp_is_empty!15915))

(declare-fun b!845742 () Bool)

(declare-fun res!574562 () Bool)

(assert (=> b!845742 (=> (not res!574562) (not e!472098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845742 (= res!574562 (validMask!0 mask!1196))))

(assert (= (and start!72864 res!574564) b!845742))

(assert (= (and b!845742 res!574562) b!845743))

(assert (= (and b!845743 res!574563) b!845746))

(assert (= (and b!845746 res!574565) b!845744))

(assert (= (and b!845744 res!574560) b!845741))

(assert (= (and b!845741 res!574559) b!845738))

(assert (= (and b!845738 res!574558) b!845737))

(assert (= (and b!845737 res!574561) b!845739))

(assert (= (and b!845740 condMapEmpty!25472) mapIsEmpty!25472))

(assert (= (and b!845740 (not condMapEmpty!25472)) mapNonEmpty!25472))

(get-info :version)

(assert (= (and mapNonEmpty!25472 ((_ is ValueCellFull!7518) mapValue!25472)) b!845745))

(assert (= (and b!845740 ((_ is ValueCellFull!7518) mapDefault!25472)) b!845747))

(assert (= start!72864 b!845740))

(declare-fun m!787413 () Bool)

(assert (=> b!845746 m!787413))

(declare-fun m!787415 () Bool)

(assert (=> b!845739 m!787415))

(declare-fun m!787417 () Bool)

(assert (=> b!845737 m!787417))

(declare-fun m!787419 () Bool)

(assert (=> mapNonEmpty!25472 m!787419))

(declare-fun m!787421 () Bool)

(assert (=> b!845744 m!787421))

(declare-fun m!787423 () Bool)

(assert (=> b!845742 m!787423))

(declare-fun m!787425 () Bool)

(assert (=> b!845738 m!787425))

(declare-fun m!787427 () Bool)

(assert (=> start!72864 m!787427))

(declare-fun m!787429 () Bool)

(assert (=> start!72864 m!787429))

(check-sat (not b!845744) (not mapNonEmpty!25472) b_and!22865 tp_is_empty!15915 (not b!845738) (not b!845746) (not start!72864) (not b!845742) (not b_next!13779) (not b!845739))
(check-sat b_and!22865 (not b_next!13779))
