; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74954 () Bool)

(assert start!74954)

(declare-fun b_free!15473 () Bool)

(declare-fun b_next!15473 () Bool)

(assert (=> start!74954 (= b_free!15473 (not b_next!15473))))

(declare-fun tp!54122 () Bool)

(declare-fun b_and!25645 () Bool)

(assert (=> start!74954 (= tp!54122 b_and!25645)))

(declare-fun b!884333 () Bool)

(declare-fun e!492139 () Bool)

(declare-fun e!492137 () Bool)

(assert (=> b!884333 (= e!492139 (not e!492137))))

(declare-fun res!600780 () Bool)

(assert (=> b!884333 (=> res!600780 e!492137)))

(declare-datatypes ((array!51560 0))(
  ( (array!51561 (arr!24799 (Array (_ BitVec 32) (_ BitVec 64))) (size!25239 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51560)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884333 (= res!600780 (not (validKeyInArray!0 (select (arr!24799 _keys!868) from!1053))))))

(declare-datatypes ((V!28669 0))(
  ( (V!28670 (val!8906 Int)) )
))
(declare-datatypes ((tuple2!11810 0))(
  ( (tuple2!11811 (_1!5916 (_ BitVec 64)) (_2!5916 V!28669)) )
))
(declare-datatypes ((List!17617 0))(
  ( (Nil!17614) (Cons!17613 (h!18744 tuple2!11810) (t!24892 List!17617)) )
))
(declare-datatypes ((ListLongMap!10579 0))(
  ( (ListLongMap!10580 (toList!5305 List!17617)) )
))
(declare-fun lt!400585 () ListLongMap!10579)

(declare-fun lt!400583 () ListLongMap!10579)

(assert (=> b!884333 (= lt!400585 lt!400583)))

(declare-fun lt!400589 () ListLongMap!10579)

(declare-fun lt!400592 () tuple2!11810)

(declare-fun +!2574 (ListLongMap!10579 tuple2!11810) ListLongMap!10579)

(assert (=> b!884333 (= lt!400583 (+!2574 lt!400589 lt!400592))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8419 0))(
  ( (ValueCellFull!8419 (v!11375 V!28669)) (EmptyCell!8419) )
))
(declare-datatypes ((array!51562 0))(
  ( (array!51563 (arr!24800 (Array (_ BitVec 32) ValueCell!8419)) (size!25240 (_ BitVec 32))) )
))
(declare-fun lt!400594 () array!51562)

(declare-fun minValue!654 () V!28669)

(declare-fun zeroValue!654 () V!28669)

(declare-fun getCurrentListMapNoExtraKeys!3264 (array!51560 array!51562 (_ BitVec 32) (_ BitVec 32) V!28669 V!28669 (_ BitVec 32) Int) ListLongMap!10579)

(assert (=> b!884333 (= lt!400585 (getCurrentListMapNoExtraKeys!3264 _keys!868 lt!400594 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun v!557 () V!28669)

(assert (=> b!884333 (= lt!400592 (tuple2!11811 k!854 v!557))))

(declare-fun _values!688 () array!51562)

(assert (=> b!884333 (= lt!400589 (getCurrentListMapNoExtraKeys!3264 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30202 0))(
  ( (Unit!30203) )
))
(declare-fun lt!400597 () Unit!30202)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!757 (array!51560 array!51562 (_ BitVec 32) (_ BitVec 32) V!28669 V!28669 (_ BitVec 32) (_ BitVec 64) V!28669 (_ BitVec 32) Int) Unit!30202)

(assert (=> b!884333 (= lt!400597 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!757 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884334 () Bool)

(declare-fun res!600773 () Bool)

(declare-fun e!492140 () Bool)

(assert (=> b!884334 (=> (not res!600773) (not e!492140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884334 (= res!600773 (validMask!0 mask!1196))))

(declare-fun b!884336 () Bool)

(declare-fun e!492133 () Unit!30202)

(declare-fun Unit!30204 () Unit!30202)

(assert (=> b!884336 (= e!492133 Unit!30204)))

(declare-fun b!884337 () Bool)

(declare-fun res!600772 () Bool)

(assert (=> b!884337 (=> (not res!600772) (not e!492140))))

(assert (=> b!884337 (= res!600772 (validKeyInArray!0 k!854))))

(declare-fun b!884338 () Bool)

(declare-fun res!600776 () Bool)

(assert (=> b!884338 (=> (not res!600776) (not e!492140))))

(assert (=> b!884338 (= res!600776 (and (= (size!25240 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25239 _keys!868) (size!25240 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884339 () Bool)

(declare-fun res!600770 () Bool)

(assert (=> b!884339 (=> (not res!600770) (not e!492140))))

(declare-datatypes ((List!17618 0))(
  ( (Nil!17615) (Cons!17614 (h!18745 (_ BitVec 64)) (t!24893 List!17618)) )
))
(declare-fun arrayNoDuplicates!0 (array!51560 (_ BitVec 32) List!17618) Bool)

(assert (=> b!884339 (= res!600770 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17615))))

(declare-fun res!600778 () Bool)

(assert (=> start!74954 (=> (not res!600778) (not e!492140))))

(assert (=> start!74954 (= res!600778 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25239 _keys!868))))))

(assert (=> start!74954 e!492140))

(declare-fun tp_is_empty!17717 () Bool)

(assert (=> start!74954 tp_is_empty!17717))

(assert (=> start!74954 true))

(assert (=> start!74954 tp!54122))

(declare-fun array_inv!19524 (array!51560) Bool)

(assert (=> start!74954 (array_inv!19524 _keys!868)))

(declare-fun e!492135 () Bool)

(declare-fun array_inv!19525 (array!51562) Bool)

(assert (=> start!74954 (and (array_inv!19525 _values!688) e!492135)))

(declare-fun b!884335 () Bool)

(declare-fun res!600774 () Bool)

(assert (=> b!884335 (=> (not res!600774) (not e!492140))))

(assert (=> b!884335 (= res!600774 (and (= (select (arr!24799 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!28212 () Bool)

(declare-fun mapRes!28212 () Bool)

(assert (=> mapIsEmpty!28212 mapRes!28212))

(declare-fun mapNonEmpty!28212 () Bool)

(declare-fun tp!54121 () Bool)

(declare-fun e!492141 () Bool)

(assert (=> mapNonEmpty!28212 (= mapRes!28212 (and tp!54121 e!492141))))

(declare-fun mapRest!28212 () (Array (_ BitVec 32) ValueCell!8419))

(declare-fun mapKey!28212 () (_ BitVec 32))

(declare-fun mapValue!28212 () ValueCell!8419)

(assert (=> mapNonEmpty!28212 (= (arr!24800 _values!688) (store mapRest!28212 mapKey!28212 mapValue!28212))))

(declare-fun b!884340 () Bool)

(declare-fun e!492138 () Bool)

(assert (=> b!884340 (= e!492137 e!492138)))

(declare-fun res!600771 () Bool)

(assert (=> b!884340 (=> res!600771 e!492138)))

(assert (=> b!884340 (= res!600771 (= k!854 (select (arr!24799 _keys!868) from!1053)))))

(assert (=> b!884340 (not (= (select (arr!24799 _keys!868) from!1053) k!854))))

(declare-fun lt!400591 () Unit!30202)

(assert (=> b!884340 (= lt!400591 e!492133)))

(declare-fun c!93115 () Bool)

(assert (=> b!884340 (= c!93115 (= (select (arr!24799 _keys!868) from!1053) k!854))))

(declare-fun lt!400588 () ListLongMap!10579)

(declare-fun lt!400587 () ListLongMap!10579)

(assert (=> b!884340 (= lt!400588 lt!400587)))

(declare-fun lt!400586 () tuple2!11810)

(assert (=> b!884340 (= lt!400587 (+!2574 lt!400583 lt!400586))))

(declare-fun lt!400584 () V!28669)

(assert (=> b!884340 (= lt!400586 (tuple2!11811 (select (arr!24799 _keys!868) from!1053) lt!400584))))

(declare-fun get!13073 (ValueCell!8419 V!28669) V!28669)

(declare-fun dynLambda!1284 (Int (_ BitVec 64)) V!28669)

(assert (=> b!884340 (= lt!400584 (get!13073 (select (arr!24800 _values!688) from!1053) (dynLambda!1284 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884341 () Bool)

(declare-fun Unit!30205 () Unit!30202)

(assert (=> b!884341 (= e!492133 Unit!30205)))

(declare-fun lt!400595 () Unit!30202)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51560 (_ BitVec 32) (_ BitVec 32)) Unit!30202)

(assert (=> b!884341 (= lt!400595 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!884341 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17615)))

(declare-fun lt!400593 () Unit!30202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51560 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30202)

(assert (=> b!884341 (= lt!400593 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884341 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400598 () Unit!30202)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51560 (_ BitVec 64) (_ BitVec 32) List!17618) Unit!30202)

(assert (=> b!884341 (= lt!400598 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17615))))

(assert (=> b!884341 false))

(declare-fun b!884342 () Bool)

(assert (=> b!884342 (= e!492141 tp_is_empty!17717)))

(declare-fun b!884343 () Bool)

(declare-fun res!600777 () Bool)

(assert (=> b!884343 (=> (not res!600777) (not e!492140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51560 (_ BitVec 32)) Bool)

(assert (=> b!884343 (= res!600777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884344 () Bool)

(declare-fun e!492134 () Bool)

(assert (=> b!884344 (= e!492135 (and e!492134 mapRes!28212))))

(declare-fun condMapEmpty!28212 () Bool)

(declare-fun mapDefault!28212 () ValueCell!8419)

