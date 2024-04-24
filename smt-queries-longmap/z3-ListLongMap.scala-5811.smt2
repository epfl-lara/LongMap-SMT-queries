; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75106 () Bool)

(assert start!75106)

(declare-fun b_free!15457 () Bool)

(declare-fun b_next!15457 () Bool)

(assert (=> start!75106 (= b_free!15457 (not b_next!15457))))

(declare-fun tp!54075 () Bool)

(declare-fun b_and!25623 () Bool)

(assert (=> start!75106 (= tp!54075 b_and!25623)))

(declare-fun b!884836 () Bool)

(declare-fun res!600858 () Bool)

(declare-fun e!492500 () Bool)

(assert (=> b!884836 (=> (not res!600858) (not e!492500))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51567 0))(
  ( (array!51568 (arr!24798 (Array (_ BitVec 32) (_ BitVec 64))) (size!25239 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51567)

(assert (=> b!884836 (= res!600858 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25239 _keys!868))))))

(declare-fun b!884837 () Bool)

(declare-fun e!492505 () Bool)

(declare-fun e!492503 () Bool)

(declare-fun mapRes!28188 () Bool)

(assert (=> b!884837 (= e!492505 (and e!492503 mapRes!28188))))

(declare-fun condMapEmpty!28188 () Bool)

(declare-datatypes ((V!28649 0))(
  ( (V!28650 (val!8898 Int)) )
))
(declare-datatypes ((ValueCell!8411 0))(
  ( (ValueCellFull!8411 (v!11367 V!28649)) (EmptyCell!8411) )
))
(declare-datatypes ((array!51569 0))(
  ( (array!51570 (arr!24799 (Array (_ BitVec 32) ValueCell!8411)) (size!25240 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51569)

(declare-fun mapDefault!28188 () ValueCell!8411)

(assert (=> b!884837 (= condMapEmpty!28188 (= (arr!24799 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8411)) mapDefault!28188)))))

(declare-fun b!884838 () Bool)

(declare-datatypes ((Unit!30155 0))(
  ( (Unit!30156) )
))
(declare-fun e!492502 () Unit!30155)

(declare-fun Unit!30157 () Unit!30155)

(assert (=> b!884838 (= e!492502 Unit!30157)))

(declare-fun b!884839 () Bool)

(declare-fun e!492507 () Bool)

(declare-fun tp_is_empty!17701 () Bool)

(assert (=> b!884839 (= e!492507 tp_is_empty!17701)))

(declare-fun b!884841 () Bool)

(assert (=> b!884841 (= e!492503 tp_is_empty!17701)))

(declare-fun b!884842 () Bool)

(declare-fun res!600851 () Bool)

(assert (=> b!884842 (=> (not res!600851) (not e!492500))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!884842 (= res!600851 (and (= (size!25240 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25239 _keys!868) (size!25240 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!884843 () Bool)

(declare-fun e!492499 () Bool)

(assert (=> b!884843 (= e!492499 (bvslt i!612 (size!25240 _values!688)))))

(declare-datatypes ((tuple2!11730 0))(
  ( (tuple2!11731 (_1!5876 (_ BitVec 64)) (_2!5876 V!28649)) )
))
(declare-fun lt!400561 () tuple2!11730)

(declare-fun lt!400568 () tuple2!11730)

(declare-datatypes ((List!17561 0))(
  ( (Nil!17558) (Cons!17557 (h!18694 tuple2!11730) (t!24812 List!17561)) )
))
(declare-datatypes ((ListLongMap!10501 0))(
  ( (ListLongMap!10502 (toList!5266 List!17561)) )
))
(declare-fun lt!400572 () ListLongMap!10501)

(declare-fun lt!400560 () ListLongMap!10501)

(declare-fun +!2578 (ListLongMap!10501 tuple2!11730) ListLongMap!10501)

(assert (=> b!884843 (= lt!400560 (+!2578 (+!2578 lt!400572 lt!400561) lt!400568))))

(declare-fun v!557 () V!28649)

(declare-fun lt!400575 () V!28649)

(declare-fun lt!400566 () Unit!30155)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!546 (ListLongMap!10501 (_ BitVec 64) V!28649 (_ BitVec 64) V!28649) Unit!30155)

(assert (=> b!884843 (= lt!400566 (addCommutativeForDiffKeys!546 lt!400572 k0!854 v!557 (select (arr!24798 _keys!868) from!1053) lt!400575))))

(declare-fun b!884844 () Bool)

(declare-fun res!600860 () Bool)

(assert (=> b!884844 (=> (not res!600860) (not e!492500))))

(declare-datatypes ((List!17562 0))(
  ( (Nil!17559) (Cons!17558 (h!18695 (_ BitVec 64)) (t!24813 List!17562)) )
))
(declare-fun arrayNoDuplicates!0 (array!51567 (_ BitVec 32) List!17562) Bool)

(assert (=> b!884844 (= res!600860 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17559))))

(declare-fun b!884845 () Bool)

(declare-fun res!600856 () Bool)

(assert (=> b!884845 (=> (not res!600856) (not e!492500))))

(assert (=> b!884845 (= res!600856 (and (= (select (arr!24798 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884846 () Bool)

(declare-fun Unit!30158 () Unit!30155)

(assert (=> b!884846 (= e!492502 Unit!30158)))

(declare-fun lt!400563 () Unit!30155)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51567 (_ BitVec 32) (_ BitVec 32)) Unit!30155)

(assert (=> b!884846 (= lt!400563 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!884846 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17559)))

(declare-fun lt!400570 () Unit!30155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30155)

(assert (=> b!884846 (= lt!400570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884846 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400571 () Unit!30155)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51567 (_ BitVec 64) (_ BitVec 32) List!17562) Unit!30155)

(assert (=> b!884846 (= lt!400571 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17559))))

(assert (=> b!884846 false))

(declare-fun mapNonEmpty!28188 () Bool)

(declare-fun tp!54074 () Bool)

(assert (=> mapNonEmpty!28188 (= mapRes!28188 (and tp!54074 e!492507))))

(declare-fun mapRest!28188 () (Array (_ BitVec 32) ValueCell!8411))

(declare-fun mapKey!28188 () (_ BitVec 32))

(declare-fun mapValue!28188 () ValueCell!8411)

(assert (=> mapNonEmpty!28188 (= (arr!24799 _values!688) (store mapRest!28188 mapKey!28188 mapValue!28188))))

(declare-fun b!884847 () Bool)

(declare-fun res!600854 () Bool)

(assert (=> b!884847 (=> (not res!600854) (not e!492500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884847 (= res!600854 (validMask!0 mask!1196))))

(declare-fun b!884848 () Bool)

(declare-fun res!600855 () Bool)

(assert (=> b!884848 (=> (not res!600855) (not e!492500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51567 (_ BitVec 32)) Bool)

(assert (=> b!884848 (= res!600855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884849 () Bool)

(declare-fun res!600857 () Bool)

(assert (=> b!884849 (=> (not res!600857) (not e!492500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884849 (= res!600857 (validKeyInArray!0 k0!854))))

(declare-fun b!884850 () Bool)

(declare-fun e!492501 () Bool)

(assert (=> b!884850 (= e!492501 e!492499)))

(declare-fun res!600859 () Bool)

(assert (=> b!884850 (=> res!600859 e!492499)))

(assert (=> b!884850 (= res!600859 (= k0!854 (select (arr!24798 _keys!868) from!1053)))))

(assert (=> b!884850 (not (= (select (arr!24798 _keys!868) from!1053) k0!854))))

(declare-fun lt!400567 () Unit!30155)

(assert (=> b!884850 (= lt!400567 e!492502)))

(declare-fun c!93373 () Bool)

(assert (=> b!884850 (= c!93373 (= (select (arr!24798 _keys!868) from!1053) k0!854))))

(declare-fun lt!400574 () ListLongMap!10501)

(assert (=> b!884850 (= lt!400574 lt!400560)))

(declare-fun lt!400569 () ListLongMap!10501)

(assert (=> b!884850 (= lt!400560 (+!2578 lt!400569 lt!400561))))

(assert (=> b!884850 (= lt!400561 (tuple2!11731 (select (arr!24798 _keys!868) from!1053) lt!400575))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!13086 (ValueCell!8411 V!28649) V!28649)

(declare-fun dynLambda!1295 (Int (_ BitVec 64)) V!28649)

(assert (=> b!884850 (= lt!400575 (get!13086 (select (arr!24799 _values!688) from!1053) (dynLambda!1295 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!600853 () Bool)

(assert (=> start!75106 (=> (not res!600853) (not e!492500))))

(assert (=> start!75106 (= res!600853 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25239 _keys!868))))))

(assert (=> start!75106 e!492500))

(assert (=> start!75106 tp_is_empty!17701))

(assert (=> start!75106 true))

(assert (=> start!75106 tp!54075))

(declare-fun array_inv!19562 (array!51567) Bool)

(assert (=> start!75106 (array_inv!19562 _keys!868)))

(declare-fun array_inv!19563 (array!51569) Bool)

(assert (=> start!75106 (and (array_inv!19563 _values!688) e!492505)))

(declare-fun b!884840 () Bool)

(declare-fun e!492504 () Bool)

(assert (=> b!884840 (= e!492504 (not e!492501))))

(declare-fun res!600850 () Bool)

(assert (=> b!884840 (=> res!600850 e!492501)))

(assert (=> b!884840 (= res!600850 (not (validKeyInArray!0 (select (arr!24798 _keys!868) from!1053))))))

(declare-fun lt!400562 () ListLongMap!10501)

(assert (=> b!884840 (= lt!400562 lt!400569)))

(assert (=> b!884840 (= lt!400569 (+!2578 lt!400572 lt!400568))))

(declare-fun lt!400565 () array!51569)

(declare-fun minValue!654 () V!28649)

(declare-fun zeroValue!654 () V!28649)

(declare-fun getCurrentListMapNoExtraKeys!3302 (array!51567 array!51569 (_ BitVec 32) (_ BitVec 32) V!28649 V!28649 (_ BitVec 32) Int) ListLongMap!10501)

(assert (=> b!884840 (= lt!400562 (getCurrentListMapNoExtraKeys!3302 _keys!868 lt!400565 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884840 (= lt!400568 (tuple2!11731 k0!854 v!557))))

(assert (=> b!884840 (= lt!400572 (getCurrentListMapNoExtraKeys!3302 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400573 () Unit!30155)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!739 (array!51567 array!51569 (_ BitVec 32) (_ BitVec 32) V!28649 V!28649 (_ BitVec 32) (_ BitVec 64) V!28649 (_ BitVec 32) Int) Unit!30155)

(assert (=> b!884840 (= lt!400573 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!739 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884851 () Bool)

(assert (=> b!884851 (= e!492500 e!492504)))

(declare-fun res!600852 () Bool)

(assert (=> b!884851 (=> (not res!600852) (not e!492504))))

(assert (=> b!884851 (= res!600852 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!884851 (= lt!400574 (getCurrentListMapNoExtraKeys!3302 _keys!868 lt!400565 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884851 (= lt!400565 (array!51570 (store (arr!24799 _values!688) i!612 (ValueCellFull!8411 v!557)) (size!25240 _values!688)))))

(declare-fun lt!400564 () ListLongMap!10501)

(assert (=> b!884851 (= lt!400564 (getCurrentListMapNoExtraKeys!3302 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!28188 () Bool)

(assert (=> mapIsEmpty!28188 mapRes!28188))

(assert (= (and start!75106 res!600853) b!884847))

(assert (= (and b!884847 res!600854) b!884842))

(assert (= (and b!884842 res!600851) b!884848))

(assert (= (and b!884848 res!600855) b!884844))

(assert (= (and b!884844 res!600860) b!884836))

(assert (= (and b!884836 res!600858) b!884849))

(assert (= (and b!884849 res!600857) b!884845))

(assert (= (and b!884845 res!600856) b!884851))

(assert (= (and b!884851 res!600852) b!884840))

(assert (= (and b!884840 (not res!600850)) b!884850))

(assert (= (and b!884850 c!93373) b!884846))

(assert (= (and b!884850 (not c!93373)) b!884838))

(assert (= (and b!884850 (not res!600859)) b!884843))

(assert (= (and b!884837 condMapEmpty!28188) mapIsEmpty!28188))

(assert (= (and b!884837 (not condMapEmpty!28188)) mapNonEmpty!28188))

(get-info :version)

(assert (= (and mapNonEmpty!28188 ((_ is ValueCellFull!8411) mapValue!28188)) b!884839))

(assert (= (and b!884837 ((_ is ValueCellFull!8411) mapDefault!28188)) b!884841))

(assert (= start!75106 b!884837))

(declare-fun b_lambda!12749 () Bool)

(assert (=> (not b_lambda!12749) (not b!884850)))

(declare-fun t!24811 () Bool)

(declare-fun tb!5107 () Bool)

(assert (=> (and start!75106 (= defaultEntry!696 defaultEntry!696) t!24811) tb!5107))

(declare-fun result!9857 () Bool)

(assert (=> tb!5107 (= result!9857 tp_is_empty!17701)))

(assert (=> b!884850 t!24811))

(declare-fun b_and!25625 () Bool)

(assert (= b_and!25623 (and (=> t!24811 result!9857) b_and!25625)))

(declare-fun m!825339 () Bool)

(assert (=> b!884847 m!825339))

(declare-fun m!825341 () Bool)

(assert (=> start!75106 m!825341))

(declare-fun m!825343 () Bool)

(assert (=> start!75106 m!825343))

(declare-fun m!825345 () Bool)

(assert (=> b!884848 m!825345))

(declare-fun m!825347 () Bool)

(assert (=> b!884844 m!825347))

(declare-fun m!825349 () Bool)

(assert (=> b!884845 m!825349))

(declare-fun m!825351 () Bool)

(assert (=> b!884843 m!825351))

(assert (=> b!884843 m!825351))

(declare-fun m!825353 () Bool)

(assert (=> b!884843 m!825353))

(declare-fun m!825355 () Bool)

(assert (=> b!884843 m!825355))

(assert (=> b!884843 m!825355))

(declare-fun m!825357 () Bool)

(assert (=> b!884843 m!825357))

(declare-fun m!825359 () Bool)

(assert (=> b!884840 m!825359))

(assert (=> b!884840 m!825355))

(declare-fun m!825361 () Bool)

(assert (=> b!884840 m!825361))

(declare-fun m!825363 () Bool)

(assert (=> b!884840 m!825363))

(declare-fun m!825365 () Bool)

(assert (=> b!884840 m!825365))

(assert (=> b!884840 m!825355))

(declare-fun m!825367 () Bool)

(assert (=> b!884840 m!825367))

(declare-fun m!825369 () Bool)

(assert (=> b!884849 m!825369))

(declare-fun m!825371 () Bool)

(assert (=> b!884851 m!825371))

(declare-fun m!825373 () Bool)

(assert (=> b!884851 m!825373))

(declare-fun m!825375 () Bool)

(assert (=> b!884851 m!825375))

(declare-fun m!825377 () Bool)

(assert (=> b!884846 m!825377))

(declare-fun m!825379 () Bool)

(assert (=> b!884846 m!825379))

(declare-fun m!825381 () Bool)

(assert (=> b!884846 m!825381))

(declare-fun m!825383 () Bool)

(assert (=> b!884846 m!825383))

(declare-fun m!825385 () Bool)

(assert (=> b!884846 m!825385))

(declare-fun m!825387 () Bool)

(assert (=> b!884850 m!825387))

(declare-fun m!825389 () Bool)

(assert (=> b!884850 m!825389))

(declare-fun m!825391 () Bool)

(assert (=> b!884850 m!825391))

(declare-fun m!825393 () Bool)

(assert (=> b!884850 m!825393))

(assert (=> b!884850 m!825389))

(assert (=> b!884850 m!825355))

(assert (=> b!884850 m!825391))

(declare-fun m!825395 () Bool)

(assert (=> mapNonEmpty!28188 m!825395))

(check-sat b_and!25625 (not b!884848) (not b_lambda!12749) (not b!884846) (not b!884851) (not mapNonEmpty!28188) (not b!884847) (not b!884849) (not b!884850) (not b!884843) (not b_next!15457) tp_is_empty!17701 (not b!884840) (not start!75106) (not b!884844))
(check-sat b_and!25625 (not b_next!15457))
