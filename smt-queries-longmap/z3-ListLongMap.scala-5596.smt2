; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73342 () Bool)

(assert start!73342)

(declare-fun b_free!14275 () Bool)

(declare-fun b_next!14275 () Bool)

(assert (=> start!73342 (= b_free!14275 (not b_next!14275))))

(declare-fun tp!50329 () Bool)

(declare-fun b_and!23605 () Bool)

(assert (=> start!73342 (= tp!50329 b_and!23605)))

(declare-fun b!855835 () Bool)

(declare-fun res!581317 () Bool)

(declare-fun e!477070 () Bool)

(assert (=> b!855835 (=> (not res!581317) (not e!477070))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49001 0))(
  ( (array!49002 (arr!23532 (Array (_ BitVec 32) (_ BitVec 64))) (size!23974 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49001)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855835 (= res!581317 (and (= (select (arr!23532 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855836 () Bool)

(declare-fun res!581318 () Bool)

(assert (=> b!855836 (=> (not res!581318) (not e!477070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855836 (= res!581318 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26216 () Bool)

(declare-fun mapRes!26216 () Bool)

(assert (=> mapIsEmpty!26216 mapRes!26216))

(declare-fun b!855837 () Bool)

(declare-fun e!477068 () Bool)

(assert (=> b!855837 (= e!477070 e!477068)))

(declare-fun res!581315 () Bool)

(assert (=> b!855837 (=> (not res!581315) (not e!477068))))

(assert (=> b!855837 (= res!581315 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!26929 0))(
  ( (V!26930 (val!8253 Int)) )
))
(declare-datatypes ((ValueCell!7766 0))(
  ( (ValueCellFull!7766 (v!10672 V!26929)) (EmptyCell!7766) )
))
(declare-datatypes ((array!49003 0))(
  ( (array!49004 (arr!23533 (Array (_ BitVec 32) ValueCell!7766)) (size!23975 (_ BitVec 32))) )
))
(declare-fun lt!385599 () array!49003)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10888 0))(
  ( (tuple2!10889 (_1!5455 (_ BitVec 64)) (_2!5455 V!26929)) )
))
(declare-datatypes ((List!16697 0))(
  ( (Nil!16694) (Cons!16693 (h!17824 tuple2!10888) (t!23329 List!16697)) )
))
(declare-datatypes ((ListLongMap!9647 0))(
  ( (ListLongMap!9648 (toList!4839 List!16697)) )
))
(declare-fun lt!385598 () ListLongMap!9647)

(declare-fun minValue!654 () V!26929)

(declare-fun zeroValue!654 () V!26929)

(declare-fun getCurrentListMapNoExtraKeys!2846 (array!49001 array!49003 (_ BitVec 32) (_ BitVec 32) V!26929 V!26929 (_ BitVec 32) Int) ListLongMap!9647)

(assert (=> b!855837 (= lt!385598 (getCurrentListMapNoExtraKeys!2846 _keys!868 lt!385599 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49003)

(declare-fun v!557 () V!26929)

(assert (=> b!855837 (= lt!385599 (array!49004 (store (arr!23533 _values!688) i!612 (ValueCellFull!7766 v!557)) (size!23975 _values!688)))))

(declare-fun lt!385601 () ListLongMap!9647)

(assert (=> b!855837 (= lt!385601 (getCurrentListMapNoExtraKeys!2846 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581319 () Bool)

(assert (=> start!73342 (=> (not res!581319) (not e!477070))))

(assert (=> start!73342 (= res!581319 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23974 _keys!868))))))

(assert (=> start!73342 e!477070))

(declare-fun tp_is_empty!16411 () Bool)

(assert (=> start!73342 tp_is_empty!16411))

(assert (=> start!73342 true))

(assert (=> start!73342 tp!50329))

(declare-fun array_inv!18712 (array!49001) Bool)

(assert (=> start!73342 (array_inv!18712 _keys!868)))

(declare-fun e!477067 () Bool)

(declare-fun array_inv!18713 (array!49003) Bool)

(assert (=> start!73342 (and (array_inv!18713 _values!688) e!477067)))

(declare-fun b!855838 () Bool)

(declare-fun res!581311 () Bool)

(assert (=> b!855838 (=> (not res!581311) (not e!477070))))

(declare-datatypes ((List!16698 0))(
  ( (Nil!16695) (Cons!16694 (h!17825 (_ BitVec 64)) (t!23330 List!16698)) )
))
(declare-fun arrayNoDuplicates!0 (array!49001 (_ BitVec 32) List!16698) Bool)

(assert (=> b!855838 (= res!581311 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16695))))

(declare-fun b!855839 () Bool)

(declare-fun e!477069 () Bool)

(assert (=> b!855839 (= e!477069 tp_is_empty!16411)))

(declare-fun b!855840 () Bool)

(declare-fun res!581312 () Bool)

(assert (=> b!855840 (=> (not res!581312) (not e!477070))))

(assert (=> b!855840 (= res!581312 (and (= (size!23975 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23974 _keys!868) (size!23975 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855841 () Bool)

(declare-fun res!581313 () Bool)

(assert (=> b!855841 (=> (not res!581313) (not e!477070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855841 (= res!581313 (validMask!0 mask!1196))))

(declare-fun b!855842 () Bool)

(declare-fun res!581314 () Bool)

(assert (=> b!855842 (=> (not res!581314) (not e!477070))))

(assert (=> b!855842 (= res!581314 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23974 _keys!868))))))

(declare-fun mapNonEmpty!26216 () Bool)

(declare-fun tp!50330 () Bool)

(assert (=> mapNonEmpty!26216 (= mapRes!26216 (and tp!50330 e!477069))))

(declare-fun mapKey!26216 () (_ BitVec 32))

(declare-fun mapValue!26216 () ValueCell!7766)

(declare-fun mapRest!26216 () (Array (_ BitVec 32) ValueCell!7766))

(assert (=> mapNonEmpty!26216 (= (arr!23533 _values!688) (store mapRest!26216 mapKey!26216 mapValue!26216))))

(declare-fun b!855843 () Bool)

(declare-fun e!477071 () Bool)

(assert (=> b!855843 (= e!477071 tp_is_empty!16411)))

(declare-fun b!855844 () Bool)

(assert (=> b!855844 (= e!477067 (and e!477071 mapRes!26216))))

(declare-fun condMapEmpty!26216 () Bool)

(declare-fun mapDefault!26216 () ValueCell!7766)

(assert (=> b!855844 (= condMapEmpty!26216 (= (arr!23533 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7766)) mapDefault!26216)))))

(declare-fun b!855845 () Bool)

(assert (=> b!855845 (= e!477068 (not true))))

(declare-fun +!2220 (ListLongMap!9647 tuple2!10888) ListLongMap!9647)

(assert (=> b!855845 (= (getCurrentListMapNoExtraKeys!2846 _keys!868 lt!385599 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2220 (getCurrentListMapNoExtraKeys!2846 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10889 k0!854 v!557)))))

(declare-datatypes ((Unit!29109 0))(
  ( (Unit!29110) )
))
(declare-fun lt!385600 () Unit!29109)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!417 (array!49001 array!49003 (_ BitVec 32) (_ BitVec 32) V!26929 V!26929 (_ BitVec 32) (_ BitVec 64) V!26929 (_ BitVec 32) Int) Unit!29109)

(assert (=> b!855845 (= lt!385600 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!417 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!855846 () Bool)

(declare-fun res!581316 () Bool)

(assert (=> b!855846 (=> (not res!581316) (not e!477070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49001 (_ BitVec 32)) Bool)

(assert (=> b!855846 (= res!581316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73342 res!581319) b!855841))

(assert (= (and b!855841 res!581313) b!855840))

(assert (= (and b!855840 res!581312) b!855846))

(assert (= (and b!855846 res!581316) b!855838))

(assert (= (and b!855838 res!581311) b!855842))

(assert (= (and b!855842 res!581314) b!855836))

(assert (= (and b!855836 res!581318) b!855835))

(assert (= (and b!855835 res!581317) b!855837))

(assert (= (and b!855837 res!581315) b!855845))

(assert (= (and b!855844 condMapEmpty!26216) mapIsEmpty!26216))

(assert (= (and b!855844 (not condMapEmpty!26216)) mapNonEmpty!26216))

(get-info :version)

(assert (= (and mapNonEmpty!26216 ((_ is ValueCellFull!7766) mapValue!26216)) b!855839))

(assert (= (and b!855844 ((_ is ValueCellFull!7766) mapDefault!26216)) b!855843))

(assert (= start!73342 b!855844))

(declare-fun m!796323 () Bool)

(assert (=> b!855841 m!796323))

(declare-fun m!796325 () Bool)

(assert (=> b!855846 m!796325))

(declare-fun m!796327 () Bool)

(assert (=> b!855837 m!796327))

(declare-fun m!796329 () Bool)

(assert (=> b!855837 m!796329))

(declare-fun m!796331 () Bool)

(assert (=> b!855837 m!796331))

(declare-fun m!796333 () Bool)

(assert (=> b!855845 m!796333))

(declare-fun m!796335 () Bool)

(assert (=> b!855845 m!796335))

(assert (=> b!855845 m!796335))

(declare-fun m!796337 () Bool)

(assert (=> b!855845 m!796337))

(declare-fun m!796339 () Bool)

(assert (=> b!855845 m!796339))

(declare-fun m!796341 () Bool)

(assert (=> b!855838 m!796341))

(declare-fun m!796343 () Bool)

(assert (=> start!73342 m!796343))

(declare-fun m!796345 () Bool)

(assert (=> start!73342 m!796345))

(declare-fun m!796347 () Bool)

(assert (=> mapNonEmpty!26216 m!796347))

(declare-fun m!796349 () Bool)

(assert (=> b!855836 m!796349))

(declare-fun m!796351 () Bool)

(assert (=> b!855835 m!796351))

(check-sat tp_is_empty!16411 (not b!855846) (not b!855837) (not b!855841) b_and!23605 (not b!855836) (not b_next!14275) (not b!855838) (not mapNonEmpty!26216) (not start!73342) (not b!855845))
(check-sat b_and!23605 (not b_next!14275))
