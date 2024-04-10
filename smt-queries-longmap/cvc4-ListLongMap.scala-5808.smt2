; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74924 () Bool)

(assert start!74924)

(declare-fun b_free!15443 () Bool)

(declare-fun b_next!15443 () Bool)

(assert (=> start!74924 (= b_free!15443 (not b_next!15443))))

(declare-fun tp!54032 () Bool)

(declare-fun b_and!25585 () Bool)

(assert (=> start!74924 (= tp!54032 b_and!25585)))

(declare-fun b!883602 () Bool)

(declare-fun e!491750 () Bool)

(declare-fun e!491748 () Bool)

(assert (=> b!883602 (= e!491750 (not e!491748))))

(declare-fun res!600294 () Bool)

(assert (=> b!883602 (=> res!600294 e!491748)))

(declare-datatypes ((array!51500 0))(
  ( (array!51501 (arr!24769 (Array (_ BitVec 32) (_ BitVec 64))) (size!25209 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51500)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883602 (= res!600294 (not (validKeyInArray!0 (select (arr!24769 _keys!868) from!1053))))))

(declare-datatypes ((V!28629 0))(
  ( (V!28630 (val!8891 Int)) )
))
(declare-datatypes ((tuple2!11782 0))(
  ( (tuple2!11783 (_1!5902 (_ BitVec 64)) (_2!5902 V!28629)) )
))
(declare-datatypes ((List!17590 0))(
  ( (Nil!17587) (Cons!17586 (h!18717 tuple2!11782) (t!24835 List!17590)) )
))
(declare-datatypes ((ListLongMap!10551 0))(
  ( (ListLongMap!10552 (toList!5291 List!17590)) )
))
(declare-fun lt!399966 () ListLongMap!10551)

(declare-fun lt!399964 () ListLongMap!10551)

(assert (=> b!883602 (= lt!399966 lt!399964)))

(declare-fun v!557 () V!28629)

(declare-fun lt!399967 () ListLongMap!10551)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2560 (ListLongMap!10551 tuple2!11782) ListLongMap!10551)

(assert (=> b!883602 (= lt!399964 (+!2560 lt!399967 (tuple2!11783 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8404 0))(
  ( (ValueCellFull!8404 (v!11360 V!28629)) (EmptyCell!8404) )
))
(declare-datatypes ((array!51502 0))(
  ( (array!51503 (arr!24770 (Array (_ BitVec 32) ValueCell!8404)) (size!25210 (_ BitVec 32))) )
))
(declare-fun lt!399963 () array!51502)

(declare-fun minValue!654 () V!28629)

(declare-fun zeroValue!654 () V!28629)

(declare-fun getCurrentListMapNoExtraKeys!3250 (array!51500 array!51502 (_ BitVec 32) (_ BitVec 32) V!28629 V!28629 (_ BitVec 32) Int) ListLongMap!10551)

(assert (=> b!883602 (= lt!399966 (getCurrentListMapNoExtraKeys!3250 _keys!868 lt!399963 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51502)

(assert (=> b!883602 (= lt!399967 (getCurrentListMapNoExtraKeys!3250 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30150 0))(
  ( (Unit!30151) )
))
(declare-fun lt!399961 () Unit!30150)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!744 (array!51500 array!51502 (_ BitVec 32) (_ BitVec 32) V!28629 V!28629 (_ BitVec 32) (_ BitVec 64) V!28629 (_ BitVec 32) Int) Unit!30150)

(assert (=> b!883602 (= lt!399961 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!744 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883603 () Bool)

(declare-fun e!491754 () Bool)

(declare-fun tp_is_empty!17687 () Bool)

(assert (=> b!883603 (= e!491754 tp_is_empty!17687)))

(declare-fun b!883604 () Bool)

(declare-fun res!600296 () Bool)

(declare-fun e!491751 () Bool)

(assert (=> b!883604 (=> (not res!600296) (not e!491751))))

(assert (=> b!883604 (= res!600296 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25209 _keys!868))))))

(declare-fun mapNonEmpty!28167 () Bool)

(declare-fun mapRes!28167 () Bool)

(declare-fun tp!54031 () Bool)

(assert (=> mapNonEmpty!28167 (= mapRes!28167 (and tp!54031 e!491754))))

(declare-fun mapKey!28167 () (_ BitVec 32))

(declare-fun mapRest!28167 () (Array (_ BitVec 32) ValueCell!8404))

(declare-fun mapValue!28167 () ValueCell!8404)

(assert (=> mapNonEmpty!28167 (= (arr!24770 _values!688) (store mapRest!28167 mapKey!28167 mapValue!28167))))

(declare-fun b!883606 () Bool)

(declare-fun res!600300 () Bool)

(assert (=> b!883606 (=> (not res!600300) (not e!491751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51500 (_ BitVec 32)) Bool)

(assert (=> b!883606 (= res!600300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883607 () Bool)

(declare-fun res!600302 () Bool)

(assert (=> b!883607 (=> (not res!600302) (not e!491751))))

(assert (=> b!883607 (= res!600302 (and (= (size!25210 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25209 _keys!868) (size!25210 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883608 () Bool)

(declare-fun res!600295 () Bool)

(assert (=> b!883608 (=> (not res!600295) (not e!491751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883608 (= res!600295 (validMask!0 mask!1196))))

(declare-fun b!883609 () Bool)

(assert (=> b!883609 (= e!491748 (bvslt from!1053 (size!25209 _keys!868)))))

(assert (=> b!883609 (not (= (select (arr!24769 _keys!868) from!1053) k!854))))

(declare-fun lt!399958 () Unit!30150)

(declare-fun e!491752 () Unit!30150)

(assert (=> b!883609 (= lt!399958 e!491752)))

(declare-fun c!93070 () Bool)

(assert (=> b!883609 (= c!93070 (= (select (arr!24769 _keys!868) from!1053) k!854))))

(declare-fun lt!399968 () ListLongMap!10551)

(declare-fun get!13051 (ValueCell!8404 V!28629) V!28629)

(declare-fun dynLambda!1272 (Int (_ BitVec 64)) V!28629)

(assert (=> b!883609 (= lt!399968 (+!2560 lt!399964 (tuple2!11783 (select (arr!24769 _keys!868) from!1053) (get!13051 (select (arr!24770 _values!688) from!1053) (dynLambda!1272 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883610 () Bool)

(declare-fun Unit!30152 () Unit!30150)

(assert (=> b!883610 (= e!491752 Unit!30152)))

(declare-fun lt!399959 () Unit!30150)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51500 (_ BitVec 32) (_ BitVec 32)) Unit!30150)

(assert (=> b!883610 (= lt!399959 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17591 0))(
  ( (Nil!17588) (Cons!17587 (h!18718 (_ BitVec 64)) (t!24836 List!17591)) )
))
(declare-fun arrayNoDuplicates!0 (array!51500 (_ BitVec 32) List!17591) Bool)

(assert (=> b!883610 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17588)))

(declare-fun lt!399960 () Unit!30150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51500 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30150)

(assert (=> b!883610 (= lt!399960 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883610 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399965 () Unit!30150)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51500 (_ BitVec 64) (_ BitVec 32) List!17591) Unit!30150)

(assert (=> b!883610 (= lt!399965 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17588))))

(assert (=> b!883610 false))

(declare-fun mapIsEmpty!28167 () Bool)

(assert (=> mapIsEmpty!28167 mapRes!28167))

(declare-fun b!883611 () Bool)

(assert (=> b!883611 (= e!491751 e!491750)))

(declare-fun res!600303 () Bool)

(assert (=> b!883611 (=> (not res!600303) (not e!491750))))

(assert (=> b!883611 (= res!600303 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!883611 (= lt!399968 (getCurrentListMapNoExtraKeys!3250 _keys!868 lt!399963 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!883611 (= lt!399963 (array!51503 (store (arr!24770 _values!688) i!612 (ValueCellFull!8404 v!557)) (size!25210 _values!688)))))

(declare-fun lt!399962 () ListLongMap!10551)

(assert (=> b!883611 (= lt!399962 (getCurrentListMapNoExtraKeys!3250 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883612 () Bool)

(declare-fun e!491747 () Bool)

(assert (=> b!883612 (= e!491747 tp_is_empty!17687)))

(declare-fun b!883605 () Bool)

(declare-fun res!600301 () Bool)

(assert (=> b!883605 (=> (not res!600301) (not e!491751))))

(assert (=> b!883605 (= res!600301 (and (= (select (arr!24769 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!600297 () Bool)

(assert (=> start!74924 (=> (not res!600297) (not e!491751))))

(assert (=> start!74924 (= res!600297 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25209 _keys!868))))))

(assert (=> start!74924 e!491751))

(assert (=> start!74924 tp_is_empty!17687))

(assert (=> start!74924 true))

(assert (=> start!74924 tp!54032))

(declare-fun array_inv!19502 (array!51500) Bool)

(assert (=> start!74924 (array_inv!19502 _keys!868)))

(declare-fun e!491749 () Bool)

(declare-fun array_inv!19503 (array!51502) Bool)

(assert (=> start!74924 (and (array_inv!19503 _values!688) e!491749)))

(declare-fun b!883613 () Bool)

(declare-fun res!600298 () Bool)

(assert (=> b!883613 (=> (not res!600298) (not e!491751))))

(assert (=> b!883613 (= res!600298 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17588))))

(declare-fun b!883614 () Bool)

(declare-fun Unit!30153 () Unit!30150)

(assert (=> b!883614 (= e!491752 Unit!30153)))

(declare-fun b!883615 () Bool)

(declare-fun res!600299 () Bool)

(assert (=> b!883615 (=> (not res!600299) (not e!491751))))

(assert (=> b!883615 (= res!600299 (validKeyInArray!0 k!854))))

(declare-fun b!883616 () Bool)

(assert (=> b!883616 (= e!491749 (and e!491747 mapRes!28167))))

(declare-fun condMapEmpty!28167 () Bool)

(declare-fun mapDefault!28167 () ValueCell!8404)

