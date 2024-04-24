; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72712 () Bool)

(assert start!72712)

(declare-fun b_free!13729 () Bool)

(declare-fun b_next!13729 () Bool)

(assert (=> start!72712 (= b_free!13729 (not b_next!13729))))

(declare-fun tp!48286 () Bool)

(declare-fun b_and!22825 () Bool)

(assert (=> start!72712 (= tp!48286 b_and!22825)))

(declare-fun b!842930 () Bool)

(declare-fun res!572687 () Bool)

(declare-fun e!470258 () Bool)

(assert (=> b!842930 (=> (not res!572687) (not e!470258))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842930 (= res!572687 (validMask!0 mask!1196))))

(declare-fun b!842931 () Bool)

(declare-fun res!572682 () Bool)

(assert (=> b!842931 (=> (not res!572682) (not e!470258))))

(declare-datatypes ((array!47483 0))(
  ( (array!47484 (arr!22768 (Array (_ BitVec 32) (_ BitVec 64))) (size!23209 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47483)

(declare-datatypes ((List!16114 0))(
  ( (Nil!16111) (Cons!16110 (h!17247 (_ BitVec 64)) (t!22477 List!16114)) )
))
(declare-fun arrayNoDuplicates!0 (array!47483 (_ BitVec 32) List!16114) Bool)

(assert (=> b!842931 (= res!572682 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16111))))

(declare-fun b!842932 () Bool)

(assert (=> b!842932 (= e!470258 (not true))))

(declare-fun e!470259 () Bool)

(assert (=> b!842932 e!470259))

(declare-fun c!91735 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!842932 (= c!91735 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28934 0))(
  ( (Unit!28935) )
))
(declare-fun lt!381320 () Unit!28934)

(declare-datatypes ((V!25841 0))(
  ( (V!25842 (val!7845 Int)) )
))
(declare-fun v!557 () V!25841)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7358 0))(
  ( (ValueCellFull!7358 (v!10270 V!25841)) (EmptyCell!7358) )
))
(declare-datatypes ((array!47485 0))(
  ( (array!47486 (arr!22769 (Array (_ BitVec 32) ValueCell!7358)) (size!23210 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47485)

(declare-fun minValue!654 () V!25841)

(declare-fun zeroValue!654 () V!25841)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!303 (array!47483 array!47485 (_ BitVec 32) (_ BitVec 32) V!25841 V!25841 (_ BitVec 32) (_ BitVec 64) V!25841 (_ BitVec 32) Int) Unit!28934)

(assert (=> b!842932 (= lt!381320 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!303 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37462 () Bool)

(declare-datatypes ((tuple2!10344 0))(
  ( (tuple2!10345 (_1!5183 (_ BitVec 64)) (_2!5183 V!25841)) )
))
(declare-datatypes ((List!16115 0))(
  ( (Nil!16112) (Cons!16111 (h!17248 tuple2!10344) (t!22478 List!16115)) )
))
(declare-datatypes ((ListLongMap!9115 0))(
  ( (ListLongMap!9116 (toList!4573 List!16115)) )
))
(declare-fun call!37466 () ListLongMap!9115)

(declare-fun getCurrentListMapNoExtraKeys!2632 (array!47483 array!47485 (_ BitVec 32) (_ BitVec 32) V!25841 V!25841 (_ BitVec 32) Int) ListLongMap!9115)

(assert (=> bm!37462 (= call!37466 (getCurrentListMapNoExtraKeys!2632 _keys!868 (array!47486 (store (arr!22769 _values!688) i!612 (ValueCellFull!7358 v!557)) (size!23210 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37465 () ListLongMap!9115)

(declare-fun bm!37463 () Bool)

(assert (=> bm!37463 (= call!37465 (getCurrentListMapNoExtraKeys!2632 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842933 () Bool)

(declare-fun res!572689 () Bool)

(assert (=> b!842933 (=> (not res!572689) (not e!470258))))

(assert (=> b!842933 (= res!572689 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23209 _keys!868))))))

(declare-fun b!842934 () Bool)

(declare-fun res!572688 () Bool)

(assert (=> b!842934 (=> (not res!572688) (not e!470258))))

(assert (=> b!842934 (= res!572688 (and (= (size!23210 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23209 _keys!868) (size!23210 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842935 () Bool)

(declare-fun e!470257 () Bool)

(declare-fun tp_is_empty!15595 () Bool)

(assert (=> b!842935 (= e!470257 tp_is_empty!15595)))

(declare-fun b!842936 () Bool)

(declare-fun e!470260 () Bool)

(assert (=> b!842936 (= e!470260 tp_is_empty!15595)))

(declare-fun mapNonEmpty!24992 () Bool)

(declare-fun mapRes!24992 () Bool)

(declare-fun tp!48287 () Bool)

(assert (=> mapNonEmpty!24992 (= mapRes!24992 (and tp!48287 e!470257))))

(declare-fun mapValue!24992 () ValueCell!7358)

(declare-fun mapRest!24992 () (Array (_ BitVec 32) ValueCell!7358))

(declare-fun mapKey!24992 () (_ BitVec 32))

(assert (=> mapNonEmpty!24992 (= (arr!22769 _values!688) (store mapRest!24992 mapKey!24992 mapValue!24992))))

(declare-fun res!572684 () Bool)

(assert (=> start!72712 (=> (not res!572684) (not e!470258))))

(assert (=> start!72712 (= res!572684 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23209 _keys!868))))))

(assert (=> start!72712 e!470258))

(assert (=> start!72712 tp_is_empty!15595))

(assert (=> start!72712 true))

(assert (=> start!72712 tp!48286))

(declare-fun array_inv!18162 (array!47483) Bool)

(assert (=> start!72712 (array_inv!18162 _keys!868)))

(declare-fun e!470255 () Bool)

(declare-fun array_inv!18163 (array!47485) Bool)

(assert (=> start!72712 (and (array_inv!18163 _values!688) e!470255)))

(declare-fun mapIsEmpty!24992 () Bool)

(assert (=> mapIsEmpty!24992 mapRes!24992))

(declare-fun b!842937 () Bool)

(declare-fun res!572686 () Bool)

(assert (=> b!842937 (=> (not res!572686) (not e!470258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47483 (_ BitVec 32)) Bool)

(assert (=> b!842937 (= res!572686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842938 () Bool)

(declare-fun res!572685 () Bool)

(assert (=> b!842938 (=> (not res!572685) (not e!470258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842938 (= res!572685 (validKeyInArray!0 k0!854))))

(declare-fun b!842939 () Bool)

(assert (=> b!842939 (= e!470259 (= call!37466 call!37465))))

(declare-fun b!842940 () Bool)

(declare-fun res!572683 () Bool)

(assert (=> b!842940 (=> (not res!572683) (not e!470258))))

(assert (=> b!842940 (= res!572683 (and (= (select (arr!22768 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23209 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842941 () Bool)

(assert (=> b!842941 (= e!470255 (and e!470260 mapRes!24992))))

(declare-fun condMapEmpty!24992 () Bool)

(declare-fun mapDefault!24992 () ValueCell!7358)

(assert (=> b!842941 (= condMapEmpty!24992 (= (arr!22769 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7358)) mapDefault!24992)))))

(declare-fun b!842942 () Bool)

(declare-fun +!2077 (ListLongMap!9115 tuple2!10344) ListLongMap!9115)

(assert (=> b!842942 (= e!470259 (= call!37466 (+!2077 call!37465 (tuple2!10345 k0!854 v!557))))))

(assert (= (and start!72712 res!572684) b!842930))

(assert (= (and b!842930 res!572687) b!842934))

(assert (= (and b!842934 res!572688) b!842937))

(assert (= (and b!842937 res!572686) b!842931))

(assert (= (and b!842931 res!572682) b!842933))

(assert (= (and b!842933 res!572689) b!842938))

(assert (= (and b!842938 res!572685) b!842940))

(assert (= (and b!842940 res!572683) b!842932))

(assert (= (and b!842932 c!91735) b!842942))

(assert (= (and b!842932 (not c!91735)) b!842939))

(assert (= (or b!842942 b!842939) bm!37462))

(assert (= (or b!842942 b!842939) bm!37463))

(assert (= (and b!842941 condMapEmpty!24992) mapIsEmpty!24992))

(assert (= (and b!842941 (not condMapEmpty!24992)) mapNonEmpty!24992))

(get-info :version)

(assert (= (and mapNonEmpty!24992 ((_ is ValueCellFull!7358) mapValue!24992)) b!842935))

(assert (= (and b!842941 ((_ is ValueCellFull!7358) mapDefault!24992)) b!842936))

(assert (= start!72712 b!842941))

(declare-fun m!786563 () Bool)

(assert (=> bm!37463 m!786563))

(declare-fun m!786565 () Bool)

(assert (=> b!842930 m!786565))

(declare-fun m!786567 () Bool)

(assert (=> bm!37462 m!786567))

(declare-fun m!786569 () Bool)

(assert (=> bm!37462 m!786569))

(declare-fun m!786571 () Bool)

(assert (=> b!842932 m!786571))

(declare-fun m!786573 () Bool)

(assert (=> start!72712 m!786573))

(declare-fun m!786575 () Bool)

(assert (=> start!72712 m!786575))

(declare-fun m!786577 () Bool)

(assert (=> b!842942 m!786577))

(declare-fun m!786579 () Bool)

(assert (=> mapNonEmpty!24992 m!786579))

(declare-fun m!786581 () Bool)

(assert (=> b!842937 m!786581))

(declare-fun m!786583 () Bool)

(assert (=> b!842938 m!786583))

(declare-fun m!786585 () Bool)

(assert (=> b!842940 m!786585))

(declare-fun m!786587 () Bool)

(assert (=> b!842931 m!786587))

(check-sat (not bm!37463) (not b_next!13729) (not b!842930) b_and!22825 (not mapNonEmpty!24992) (not b!842931) (not start!72712) (not b!842937) (not bm!37462) (not b!842932) tp_is_empty!15595 (not b!842942) (not b!842938))
(check-sat b_and!22825 (not b_next!13729))
