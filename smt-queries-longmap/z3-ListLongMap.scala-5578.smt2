; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73420 () Bool)

(assert start!73420)

(declare-fun b_free!14167 () Bool)

(declare-fun b_next!14167 () Bool)

(assert (=> start!73420 (= b_free!14167 (not b_next!14167))))

(declare-fun tp!50006 () Bool)

(declare-fun b_and!23503 () Bool)

(assert (=> start!73420 (= tp!50006 b_and!23503)))

(declare-fun b!854982 () Bool)

(declare-fun res!580376 () Bool)

(declare-fun e!476847 () Bool)

(assert (=> b!854982 (=> (not res!580376) (not e!476847))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854982 (= res!580376 (validKeyInArray!0 k0!854))))

(declare-fun b!854983 () Bool)

(declare-fun e!476848 () Bool)

(declare-fun e!476853 () Bool)

(assert (=> b!854983 (= e!476848 (not e!476853))))

(declare-fun res!580379 () Bool)

(assert (=> b!854983 (=> res!580379 e!476853)))

(declare-datatypes ((array!48851 0))(
  ( (array!48852 (arr!23452 (Array (_ BitVec 32) (_ BitVec 64))) (size!23893 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48851)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854983 (= res!580379 (not (validKeyInArray!0 (select (arr!23452 _keys!868) from!1053))))))

(declare-fun e!476851 () Bool)

(assert (=> b!854983 e!476851))

(declare-fun c!92203 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854983 (= c!92203 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26785 0))(
  ( (V!26786 (val!8199 Int)) )
))
(declare-fun v!557 () V!26785)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29158 0))(
  ( (Unit!29159) )
))
(declare-fun lt!385510 () Unit!29158)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7712 0))(
  ( (ValueCellFull!7712 (v!10624 V!26785)) (EmptyCell!7712) )
))
(declare-datatypes ((array!48853 0))(
  ( (array!48854 (arr!23453 (Array (_ BitVec 32) ValueCell!7712)) (size!23894 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48853)

(declare-fun minValue!654 () V!26785)

(declare-fun zeroValue!654 () V!26785)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!402 (array!48851 array!48853 (_ BitVec 32) (_ BitVec 32) V!26785 V!26785 (_ BitVec 32) (_ BitVec 64) V!26785 (_ BitVec 32) Int) Unit!29158)

(assert (=> b!854983 (= lt!385510 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!402 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854984 () Bool)

(declare-fun res!580380 () Bool)

(assert (=> b!854984 (=> (not res!580380) (not e!476847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48851 (_ BitVec 32)) Bool)

(assert (=> b!854984 (= res!580380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854985 () Bool)

(declare-fun e!476850 () Bool)

(declare-fun tp_is_empty!16303 () Bool)

(assert (=> b!854985 (= e!476850 tp_is_empty!16303)))

(declare-fun b!854986 () Bool)

(declare-datatypes ((tuple2!10712 0))(
  ( (tuple2!10713 (_1!5367 (_ BitVec 64)) (_2!5367 V!26785)) )
))
(declare-datatypes ((List!16561 0))(
  ( (Nil!16558) (Cons!16557 (h!17694 tuple2!10712) (t!23166 List!16561)) )
))
(declare-datatypes ((ListLongMap!9483 0))(
  ( (ListLongMap!9484 (toList!4757 List!16561)) )
))
(declare-fun call!38401 () ListLongMap!9483)

(declare-fun call!38402 () ListLongMap!9483)

(assert (=> b!854986 (= e!476851 (= call!38401 call!38402))))

(declare-fun b!854987 () Bool)

(declare-fun e!476854 () Bool)

(assert (=> b!854987 (= e!476854 tp_is_empty!16303)))

(declare-fun b!854988 () Bool)

(declare-fun res!580372 () Bool)

(assert (=> b!854988 (=> (not res!580372) (not e!476847))))

(assert (=> b!854988 (= res!580372 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23893 _keys!868))))))

(declare-fun b!854989 () Bool)

(declare-fun e!476849 () Bool)

(declare-fun mapRes!26054 () Bool)

(assert (=> b!854989 (= e!476849 (and e!476850 mapRes!26054))))

(declare-fun condMapEmpty!26054 () Bool)

(declare-fun mapDefault!26054 () ValueCell!7712)

(assert (=> b!854989 (= condMapEmpty!26054 (= (arr!23453 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7712)) mapDefault!26054)))))

(declare-fun bm!38398 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2814 (array!48851 array!48853 (_ BitVec 32) (_ BitVec 32) V!26785 V!26785 (_ BitVec 32) Int) ListLongMap!9483)

(assert (=> bm!38398 (= call!38402 (getCurrentListMapNoExtraKeys!2814 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!580374 () Bool)

(assert (=> start!73420 (=> (not res!580374) (not e!476847))))

(assert (=> start!73420 (= res!580374 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23893 _keys!868))))))

(assert (=> start!73420 e!476847))

(assert (=> start!73420 tp_is_empty!16303))

(assert (=> start!73420 true))

(assert (=> start!73420 tp!50006))

(declare-fun array_inv!18640 (array!48851) Bool)

(assert (=> start!73420 (array_inv!18640 _keys!868)))

(declare-fun array_inv!18641 (array!48853) Bool)

(assert (=> start!73420 (and (array_inv!18641 _values!688) e!476849)))

(declare-fun mapIsEmpty!26054 () Bool)

(assert (=> mapIsEmpty!26054 mapRes!26054))

(declare-fun b!854990 () Bool)

(assert (=> b!854990 (= e!476853 true)))

(declare-fun lt!385508 () V!26785)

(declare-fun lt!385506 () ListLongMap!9483)

(declare-fun lt!385505 () tuple2!10712)

(declare-fun +!2199 (ListLongMap!9483 tuple2!10712) ListLongMap!9483)

(assert (=> b!854990 (= (+!2199 lt!385506 lt!385505) (+!2199 (+!2199 lt!385506 (tuple2!10713 k0!854 lt!385508)) lt!385505))))

(declare-fun lt!385509 () V!26785)

(assert (=> b!854990 (= lt!385505 (tuple2!10713 k0!854 lt!385509))))

(declare-fun lt!385512 () Unit!29158)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!323 (ListLongMap!9483 (_ BitVec 64) V!26785 V!26785) Unit!29158)

(assert (=> b!854990 (= lt!385512 (addSameAsAddTwiceSameKeyDiffValues!323 lt!385506 k0!854 lt!385508 lt!385509))))

(declare-fun lt!385514 () V!26785)

(declare-fun get!12376 (ValueCell!7712 V!26785) V!26785)

(assert (=> b!854990 (= lt!385508 (get!12376 (select (arr!23453 _values!688) from!1053) lt!385514))))

(declare-fun lt!385513 () ListLongMap!9483)

(assert (=> b!854990 (= lt!385513 (+!2199 lt!385506 (tuple2!10713 (select (arr!23452 _keys!868) from!1053) lt!385509)))))

(assert (=> b!854990 (= lt!385509 (get!12376 (select (store (arr!23453 _values!688) i!612 (ValueCellFull!7712 v!557)) from!1053) lt!385514))))

(declare-fun dynLambda!1070 (Int (_ BitVec 64)) V!26785)

(assert (=> b!854990 (= lt!385514 (dynLambda!1070 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!385511 () array!48853)

(assert (=> b!854990 (= lt!385506 (getCurrentListMapNoExtraKeys!2814 _keys!868 lt!385511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854991 () Bool)

(assert (=> b!854991 (= e!476847 e!476848)))

(declare-fun res!580377 () Bool)

(assert (=> b!854991 (=> (not res!580377) (not e!476848))))

(assert (=> b!854991 (= res!580377 (= from!1053 i!612))))

(assert (=> b!854991 (= lt!385513 (getCurrentListMapNoExtraKeys!2814 _keys!868 lt!385511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854991 (= lt!385511 (array!48854 (store (arr!23453 _values!688) i!612 (ValueCellFull!7712 v!557)) (size!23894 _values!688)))))

(declare-fun lt!385507 () ListLongMap!9483)

(assert (=> b!854991 (= lt!385507 (getCurrentListMapNoExtraKeys!2814 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854992 () Bool)

(assert (=> b!854992 (= e!476851 (= call!38401 (+!2199 call!38402 (tuple2!10713 k0!854 v!557))))))

(declare-fun b!854993 () Bool)

(declare-fun res!580378 () Bool)

(assert (=> b!854993 (=> (not res!580378) (not e!476847))))

(declare-datatypes ((List!16562 0))(
  ( (Nil!16559) (Cons!16558 (h!17695 (_ BitVec 64)) (t!23167 List!16562)) )
))
(declare-fun arrayNoDuplicates!0 (array!48851 (_ BitVec 32) List!16562) Bool)

(assert (=> b!854993 (= res!580378 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16559))))

(declare-fun b!854994 () Bool)

(declare-fun res!580373 () Bool)

(assert (=> b!854994 (=> (not res!580373) (not e!476847))))

(assert (=> b!854994 (= res!580373 (and (= (size!23894 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23893 _keys!868) (size!23894 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38399 () Bool)

(assert (=> bm!38399 (= call!38401 (getCurrentListMapNoExtraKeys!2814 _keys!868 lt!385511 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26054 () Bool)

(declare-fun tp!50005 () Bool)

(assert (=> mapNonEmpty!26054 (= mapRes!26054 (and tp!50005 e!476854))))

(declare-fun mapRest!26054 () (Array (_ BitVec 32) ValueCell!7712))

(declare-fun mapValue!26054 () ValueCell!7712)

(declare-fun mapKey!26054 () (_ BitVec 32))

(assert (=> mapNonEmpty!26054 (= (arr!23453 _values!688) (store mapRest!26054 mapKey!26054 mapValue!26054))))

(declare-fun b!854995 () Bool)

(declare-fun res!580375 () Bool)

(assert (=> b!854995 (=> (not res!580375) (not e!476847))))

(assert (=> b!854995 (= res!580375 (and (= (select (arr!23452 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854996 () Bool)

(declare-fun res!580381 () Bool)

(assert (=> b!854996 (=> (not res!580381) (not e!476847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854996 (= res!580381 (validMask!0 mask!1196))))

(assert (= (and start!73420 res!580374) b!854996))

(assert (= (and b!854996 res!580381) b!854994))

(assert (= (and b!854994 res!580373) b!854984))

(assert (= (and b!854984 res!580380) b!854993))

(assert (= (and b!854993 res!580378) b!854988))

(assert (= (and b!854988 res!580372) b!854982))

(assert (= (and b!854982 res!580376) b!854995))

(assert (= (and b!854995 res!580375) b!854991))

(assert (= (and b!854991 res!580377) b!854983))

(assert (= (and b!854983 c!92203) b!854992))

(assert (= (and b!854983 (not c!92203)) b!854986))

(assert (= (or b!854992 b!854986) bm!38399))

(assert (= (or b!854992 b!854986) bm!38398))

(assert (= (and b!854983 (not res!580379)) b!854990))

(assert (= (and b!854989 condMapEmpty!26054) mapIsEmpty!26054))

(assert (= (and b!854989 (not condMapEmpty!26054)) mapNonEmpty!26054))

(get-info :version)

(assert (= (and mapNonEmpty!26054 ((_ is ValueCellFull!7712) mapValue!26054)) b!854987))

(assert (= (and b!854989 ((_ is ValueCellFull!7712) mapDefault!26054)) b!854985))

(assert (= start!73420 b!854989))

(declare-fun b_lambda!11713 () Bool)

(assert (=> (not b_lambda!11713) (not b!854990)))

(declare-fun t!23165 () Bool)

(declare-fun tb!4461 () Bool)

(assert (=> (and start!73420 (= defaultEntry!696 defaultEntry!696) t!23165) tb!4461))

(declare-fun result!8541 () Bool)

(assert (=> tb!4461 (= result!8541 tp_is_empty!16303)))

(assert (=> b!854990 t!23165))

(declare-fun b_and!23505 () Bool)

(assert (= b_and!23503 (and (=> t!23165 result!8541) b_and!23505)))

(declare-fun m!796677 () Bool)

(assert (=> b!854993 m!796677))

(declare-fun m!796679 () Bool)

(assert (=> bm!38399 m!796679))

(declare-fun m!796681 () Bool)

(assert (=> start!73420 m!796681))

(declare-fun m!796683 () Bool)

(assert (=> start!73420 m!796683))

(declare-fun m!796685 () Bool)

(assert (=> bm!38398 m!796685))

(declare-fun m!796687 () Bool)

(assert (=> b!854984 m!796687))

(declare-fun m!796689 () Bool)

(assert (=> b!854992 m!796689))

(declare-fun m!796691 () Bool)

(assert (=> b!854996 m!796691))

(declare-fun m!796693 () Bool)

(assert (=> b!854990 m!796693))

(declare-fun m!796695 () Bool)

(assert (=> b!854990 m!796695))

(declare-fun m!796697 () Bool)

(assert (=> b!854990 m!796697))

(assert (=> b!854990 m!796697))

(declare-fun m!796699 () Bool)

(assert (=> b!854990 m!796699))

(declare-fun m!796701 () Bool)

(assert (=> b!854990 m!796701))

(declare-fun m!796703 () Bool)

(assert (=> b!854990 m!796703))

(declare-fun m!796705 () Bool)

(assert (=> b!854990 m!796705))

(declare-fun m!796707 () Bool)

(assert (=> b!854990 m!796707))

(declare-fun m!796709 () Bool)

(assert (=> b!854990 m!796709))

(assert (=> b!854990 m!796679))

(assert (=> b!854990 m!796695))

(declare-fun m!796711 () Bool)

(assert (=> b!854990 m!796711))

(assert (=> b!854990 m!796705))

(declare-fun m!796713 () Bool)

(assert (=> b!854990 m!796713))

(declare-fun m!796715 () Bool)

(assert (=> b!854990 m!796715))

(declare-fun m!796717 () Bool)

(assert (=> b!854991 m!796717))

(assert (=> b!854991 m!796715))

(declare-fun m!796719 () Bool)

(assert (=> b!854991 m!796719))

(declare-fun m!796721 () Bool)

(assert (=> b!854982 m!796721))

(declare-fun m!796723 () Bool)

(assert (=> b!854995 m!796723))

(declare-fun m!796725 () Bool)

(assert (=> mapNonEmpty!26054 m!796725))

(assert (=> b!854983 m!796707))

(assert (=> b!854983 m!796707))

(declare-fun m!796727 () Bool)

(assert (=> b!854983 m!796727))

(declare-fun m!796729 () Bool)

(assert (=> b!854983 m!796729))

(check-sat (not b!854982) (not b!854983) (not bm!38399) (not b!854992) (not b!854990) (not b_lambda!11713) (not start!73420) (not b!854996) (not b!854991) tp_is_empty!16303 b_and!23505 (not b_next!14167) (not bm!38398) (not b!854984) (not b!854993) (not mapNonEmpty!26054))
(check-sat b_and!23505 (not b_next!14167))
