; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74248 () Bool)

(assert start!74248)

(declare-fun b_free!14989 () Bool)

(declare-fun b_next!14989 () Bool)

(assert (=> start!74248 (= b_free!14989 (not b_next!14989))))

(declare-fun tp!52481 () Bool)

(declare-fun b_and!24751 () Bool)

(assert (=> start!74248 (= tp!52481 b_and!24751)))

(declare-fun b!872425 () Bool)

(declare-fun res!592747 () Bool)

(declare-fun e!485833 () Bool)

(assert (=> b!872425 (=> (not res!592747) (not e!485833))))

(declare-datatypes ((array!50459 0))(
  ( (array!50460 (arr!24256 (Array (_ BitVec 32) (_ BitVec 64))) (size!24697 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50459)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50459 (_ BitVec 32)) Bool)

(assert (=> b!872425 (= res!592747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872426 () Bool)

(declare-fun res!592752 () Bool)

(assert (=> b!872426 (=> (not res!592752) (not e!485833))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!872426 (= res!592752 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24697 _keys!868))))))

(declare-fun mapNonEmpty!27296 () Bool)

(declare-fun mapRes!27296 () Bool)

(declare-fun tp!52480 () Bool)

(declare-fun e!485831 () Bool)

(assert (=> mapNonEmpty!27296 (= mapRes!27296 (and tp!52480 e!485831))))

(declare-fun mapKey!27296 () (_ BitVec 32))

(declare-datatypes ((V!27889 0))(
  ( (V!27890 (val!8613 Int)) )
))
(declare-datatypes ((ValueCell!8126 0))(
  ( (ValueCellFull!8126 (v!11038 V!27889)) (EmptyCell!8126) )
))
(declare-fun mapValue!27296 () ValueCell!8126)

(declare-fun mapRest!27296 () (Array (_ BitVec 32) ValueCell!8126))

(declare-datatypes ((array!50461 0))(
  ( (array!50462 (arr!24257 (Array (_ BitVec 32) ValueCell!8126)) (size!24698 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50461)

(assert (=> mapNonEmpty!27296 (= (arr!24257 _values!688) (store mapRest!27296 mapKey!27296 mapValue!27296))))

(declare-fun res!592751 () Bool)

(assert (=> start!74248 (=> (not res!592751) (not e!485833))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74248 (= res!592751 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24697 _keys!868))))))

(assert (=> start!74248 e!485833))

(declare-fun tp_is_empty!17131 () Bool)

(assert (=> start!74248 tp_is_empty!17131))

(assert (=> start!74248 true))

(assert (=> start!74248 tp!52481))

(declare-fun array_inv!19206 (array!50459) Bool)

(assert (=> start!74248 (array_inv!19206 _keys!868)))

(declare-fun e!485832 () Bool)

(declare-fun array_inv!19207 (array!50461) Bool)

(assert (=> start!74248 (and (array_inv!19207 _values!688) e!485832)))

(declare-fun mapIsEmpty!27296 () Bool)

(assert (=> mapIsEmpty!27296 mapRes!27296))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!11372 0))(
  ( (tuple2!11373 (_1!5697 (_ BitVec 64)) (_2!5697 V!27889)) )
))
(declare-datatypes ((List!17190 0))(
  ( (Nil!17187) (Cons!17186 (h!18323 tuple2!11372) (t!24219 List!17190)) )
))
(declare-datatypes ((ListLongMap!10143 0))(
  ( (ListLongMap!10144 (toList!5087 List!17190)) )
))
(declare-fun call!38492 () ListLongMap!10143)

(declare-fun call!38491 () ListLongMap!10143)

(declare-fun e!485829 () Bool)

(declare-fun b!872427 () Bool)

(declare-fun v!557 () V!27889)

(declare-fun +!2474 (ListLongMap!10143 tuple2!11372) ListLongMap!10143)

(assert (=> b!872427 (= e!485829 (= call!38492 (+!2474 call!38491 (tuple2!11373 k0!854 v!557))))))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38488 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27889)

(declare-fun zeroValue!654 () V!27889)

(declare-fun lt!395845 () array!50461)

(declare-fun getCurrentListMapNoExtraKeys!3131 (array!50459 array!50461 (_ BitVec 32) (_ BitVec 32) V!27889 V!27889 (_ BitVec 32) Int) ListLongMap!10143)

(assert (=> bm!38488 (= call!38492 (getCurrentListMapNoExtraKeys!3131 _keys!868 lt!395845 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872428 () Bool)

(declare-fun res!592745 () Bool)

(assert (=> b!872428 (=> (not res!592745) (not e!485833))))

(assert (=> b!872428 (= res!592745 (and (= (size!24698 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24697 _keys!868) (size!24698 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872429 () Bool)

(declare-fun res!592748 () Bool)

(assert (=> b!872429 (=> (not res!592748) (not e!485833))))

(declare-datatypes ((List!17191 0))(
  ( (Nil!17188) (Cons!17187 (h!18324 (_ BitVec 64)) (t!24220 List!17191)) )
))
(declare-fun arrayNoDuplicates!0 (array!50459 (_ BitVec 32) List!17191) Bool)

(assert (=> b!872429 (= res!592748 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17188))))

(declare-fun b!872430 () Bool)

(declare-fun e!485828 () Bool)

(assert (=> b!872430 (= e!485828 tp_is_empty!17131)))

(declare-fun bm!38489 () Bool)

(assert (=> bm!38489 (= call!38491 (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872431 () Bool)

(declare-fun res!592746 () Bool)

(assert (=> b!872431 (=> (not res!592746) (not e!485833))))

(assert (=> b!872431 (= res!592746 (and (= (select (arr!24256 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!872432 () Bool)

(declare-fun e!485827 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872432 (= e!485827 (not (validKeyInArray!0 (select (arr!24256 _keys!868) from!1053))))))

(assert (=> b!872432 e!485829))

(declare-fun c!92662 () Bool)

(assert (=> b!872432 (= c!92662 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29898 0))(
  ( (Unit!29899) )
))
(declare-fun lt!395846 () Unit!29898)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!645 (array!50459 array!50461 (_ BitVec 32) (_ BitVec 32) V!27889 V!27889 (_ BitVec 32) (_ BitVec 64) V!27889 (_ BitVec 32) Int) Unit!29898)

(assert (=> b!872432 (= lt!395846 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!645 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872433 () Bool)

(declare-fun res!592750 () Bool)

(assert (=> b!872433 (=> (not res!592750) (not e!485833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872433 (= res!592750 (validMask!0 mask!1196))))

(declare-fun b!872434 () Bool)

(declare-fun res!592749 () Bool)

(assert (=> b!872434 (=> (not res!592749) (not e!485833))))

(assert (=> b!872434 (= res!592749 (validKeyInArray!0 k0!854))))

(declare-fun b!872435 () Bool)

(assert (=> b!872435 (= e!485829 (= call!38492 call!38491))))

(declare-fun b!872436 () Bool)

(assert (=> b!872436 (= e!485831 tp_is_empty!17131)))

(declare-fun b!872437 () Bool)

(assert (=> b!872437 (= e!485832 (and e!485828 mapRes!27296))))

(declare-fun condMapEmpty!27296 () Bool)

(declare-fun mapDefault!27296 () ValueCell!8126)

(assert (=> b!872437 (= condMapEmpty!27296 (= (arr!24257 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8126)) mapDefault!27296)))))

(declare-fun b!872438 () Bool)

(assert (=> b!872438 (= e!485833 e!485827)))

(declare-fun res!592753 () Bool)

(assert (=> b!872438 (=> (not res!592753) (not e!485827))))

(assert (=> b!872438 (= res!592753 (= from!1053 i!612))))

(declare-fun lt!395844 () ListLongMap!10143)

(assert (=> b!872438 (= lt!395844 (getCurrentListMapNoExtraKeys!3131 _keys!868 lt!395845 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!872438 (= lt!395845 (array!50462 (store (arr!24257 _values!688) i!612 (ValueCellFull!8126 v!557)) (size!24698 _values!688)))))

(declare-fun lt!395843 () ListLongMap!10143)

(assert (=> b!872438 (= lt!395843 (getCurrentListMapNoExtraKeys!3131 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74248 res!592751) b!872433))

(assert (= (and b!872433 res!592750) b!872428))

(assert (= (and b!872428 res!592745) b!872425))

(assert (= (and b!872425 res!592747) b!872429))

(assert (= (and b!872429 res!592748) b!872426))

(assert (= (and b!872426 res!592752) b!872434))

(assert (= (and b!872434 res!592749) b!872431))

(assert (= (and b!872431 res!592746) b!872438))

(assert (= (and b!872438 res!592753) b!872432))

(assert (= (and b!872432 c!92662) b!872427))

(assert (= (and b!872432 (not c!92662)) b!872435))

(assert (= (or b!872427 b!872435) bm!38488))

(assert (= (or b!872427 b!872435) bm!38489))

(assert (= (and b!872437 condMapEmpty!27296) mapIsEmpty!27296))

(assert (= (and b!872437 (not condMapEmpty!27296)) mapNonEmpty!27296))

(get-info :version)

(assert (= (and mapNonEmpty!27296 ((_ is ValueCellFull!8126) mapValue!27296)) b!872436))

(assert (= (and b!872437 ((_ is ValueCellFull!8126) mapDefault!27296)) b!872430))

(assert (= start!74248 b!872437))

(declare-fun m!813983 () Bool)

(assert (=> bm!38488 m!813983))

(declare-fun m!813985 () Bool)

(assert (=> b!872432 m!813985))

(assert (=> b!872432 m!813985))

(declare-fun m!813987 () Bool)

(assert (=> b!872432 m!813987))

(declare-fun m!813989 () Bool)

(assert (=> b!872432 m!813989))

(declare-fun m!813991 () Bool)

(assert (=> b!872427 m!813991))

(declare-fun m!813993 () Bool)

(assert (=> start!74248 m!813993))

(declare-fun m!813995 () Bool)

(assert (=> start!74248 m!813995))

(declare-fun m!813997 () Bool)

(assert (=> bm!38489 m!813997))

(declare-fun m!813999 () Bool)

(assert (=> b!872425 m!813999))

(declare-fun m!814001 () Bool)

(assert (=> b!872433 m!814001))

(declare-fun m!814003 () Bool)

(assert (=> b!872434 m!814003))

(declare-fun m!814005 () Bool)

(assert (=> mapNonEmpty!27296 m!814005))

(declare-fun m!814007 () Bool)

(assert (=> b!872431 m!814007))

(declare-fun m!814009 () Bool)

(assert (=> b!872429 m!814009))

(declare-fun m!814011 () Bool)

(assert (=> b!872438 m!814011))

(declare-fun m!814013 () Bool)

(assert (=> b!872438 m!814013))

(declare-fun m!814015 () Bool)

(assert (=> b!872438 m!814015))

(check-sat (not b!872429) (not start!74248) (not b!872427) (not mapNonEmpty!27296) (not b!872425) (not b!872433) b_and!24751 (not bm!38489) (not b!872434) (not bm!38488) (not b!872432) (not b_next!14989) tp_is_empty!17131 (not b!872438))
(check-sat b_and!24751 (not b_next!14989))
