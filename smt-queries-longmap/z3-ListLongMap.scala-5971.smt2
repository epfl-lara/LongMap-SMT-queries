; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77820 () Bool)

(assert start!77820)

(declare-fun b_free!16237 () Bool)

(declare-fun b_next!16237 () Bool)

(assert (=> start!77820 (= b_free!16237 (not b_next!16237))))

(declare-fun tp!56973 () Bool)

(declare-fun b_and!26637 () Bool)

(assert (=> start!77820 (= tp!56973 b_and!26637)))

(declare-fun b!906272 () Bool)

(declare-fun e!507921 () Bool)

(declare-fun e!507926 () Bool)

(declare-fun mapRes!29695 () Bool)

(assert (=> b!906272 (= e!507921 (and e!507926 mapRes!29695))))

(declare-fun condMapEmpty!29695 () Bool)

(declare-datatypes ((V!29839 0))(
  ( (V!29840 (val!9378 Int)) )
))
(declare-datatypes ((ValueCell!8846 0))(
  ( (ValueCellFull!8846 (v!11880 V!29839)) (EmptyCell!8846) )
))
(declare-datatypes ((array!53395 0))(
  ( (array!53396 (arr!25652 (Array (_ BitVec 32) ValueCell!8846)) (size!26112 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53395)

(declare-fun mapDefault!29695 () ValueCell!8846)

(assert (=> b!906272 (= condMapEmpty!29695 (= (arr!25652 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8846)) mapDefault!29695)))))

(declare-fun mapIsEmpty!29695 () Bool)

(assert (=> mapIsEmpty!29695 mapRes!29695))

(declare-fun b!906273 () Bool)

(declare-fun res!611285 () Bool)

(declare-fun e!507927 () Bool)

(assert (=> b!906273 (=> (not res!611285) (not e!507927))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53397 0))(
  ( (array!53398 (arr!25653 (Array (_ BitVec 32) (_ BitVec 64))) (size!26113 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53397)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!906273 (= res!611285 (and (= (select (arr!25653 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!611289 () Bool)

(declare-fun e!507925 () Bool)

(assert (=> start!77820 (=> (not res!611289) (not e!507925))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77820 (= res!611289 (validMask!0 mask!1756))))

(assert (=> start!77820 e!507925))

(declare-fun array_inv!20154 (array!53395) Bool)

(assert (=> start!77820 (and (array_inv!20154 _values!1152) e!507921)))

(assert (=> start!77820 tp!56973))

(assert (=> start!77820 true))

(declare-fun tp_is_empty!18655 () Bool)

(assert (=> start!77820 tp_is_empty!18655))

(declare-fun array_inv!20155 (array!53397) Bool)

(assert (=> start!77820 (array_inv!20155 _keys!1386)))

(declare-fun b!906274 () Bool)

(declare-fun res!611286 () Bool)

(declare-fun e!507922 () Bool)

(assert (=> b!906274 (=> res!611286 e!507922)))

(declare-datatypes ((tuple2!12128 0))(
  ( (tuple2!12129 (_1!6075 (_ BitVec 64)) (_2!6075 V!29839)) )
))
(declare-datatypes ((List!17971 0))(
  ( (Nil!17968) (Cons!17967 (h!19119 tuple2!12128) (t!25372 List!17971)) )
))
(declare-datatypes ((ListLongMap!10827 0))(
  ( (ListLongMap!10828 (toList!5429 List!17971)) )
))
(declare-fun lt!408888 () ListLongMap!10827)

(declare-fun lt!408891 () V!29839)

(declare-fun apply!453 (ListLongMap!10827 (_ BitVec 64)) V!29839)

(assert (=> b!906274 (= res!611286 (not (= (apply!453 lt!408888 k0!1033) lt!408891)))))

(declare-fun mapNonEmpty!29695 () Bool)

(declare-fun tp!56974 () Bool)

(declare-fun e!507923 () Bool)

(assert (=> mapNonEmpty!29695 (= mapRes!29695 (and tp!56974 e!507923))))

(declare-fun mapRest!29695 () (Array (_ BitVec 32) ValueCell!8846))

(declare-fun mapKey!29695 () (_ BitVec 32))

(declare-fun mapValue!29695 () ValueCell!8846)

(assert (=> mapNonEmpty!29695 (= (arr!25652 _values!1152) (store mapRest!29695 mapKey!29695 mapValue!29695))))

(declare-fun b!906275 () Bool)

(declare-fun res!611290 () Bool)

(assert (=> b!906275 (=> (not res!611290) (not e!507927))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906275 (= res!611290 (inRange!0 i!717 mask!1756))))

(declare-fun b!906276 () Bool)

(assert (=> b!906276 (= e!507925 e!507927)))

(declare-fun res!611287 () Bool)

(assert (=> b!906276 (=> (not res!611287) (not e!507927))))

(declare-fun lt!408890 () ListLongMap!10827)

(declare-fun contains!4484 (ListLongMap!10827 (_ BitVec 64)) Bool)

(assert (=> b!906276 (= res!611287 (contains!4484 lt!408890 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29839)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29839)

(declare-fun getCurrentListMap!2695 (array!53397 array!53395 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 32) Int) ListLongMap!10827)

(assert (=> b!906276 (= lt!408890 (getCurrentListMap!2695 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906277 () Bool)

(declare-fun res!611293 () Bool)

(assert (=> b!906277 (=> (not res!611293) (not e!507925))))

(declare-datatypes ((List!17972 0))(
  ( (Nil!17969) (Cons!17968 (h!19120 (_ BitVec 64)) (t!25373 List!17972)) )
))
(declare-fun arrayNoDuplicates!0 (array!53397 (_ BitVec 32) List!17972) Bool)

(assert (=> b!906277 (= res!611293 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17969))))

(declare-fun b!906278 () Bool)

(declare-fun res!611291 () Bool)

(assert (=> b!906278 (=> (not res!611291) (not e!507925))))

(assert (=> b!906278 (= res!611291 (and (= (size!26112 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26113 _keys!1386) (size!26112 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906279 () Bool)

(declare-fun e!507920 () Bool)

(assert (=> b!906279 (= e!507920 e!507922)))

(declare-fun res!611284 () Bool)

(assert (=> b!906279 (=> res!611284 e!507922)))

(assert (=> b!906279 (= res!611284 (not (contains!4484 lt!408888 k0!1033)))))

(assert (=> b!906279 (= lt!408888 (getCurrentListMap!2695 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906280 () Bool)

(assert (=> b!906280 (= e!507923 tp_is_empty!18655)))

(declare-fun b!906281 () Bool)

(declare-fun res!611288 () Bool)

(assert (=> b!906281 (=> (not res!611288) (not e!507925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53397 (_ BitVec 32)) Bool)

(assert (=> b!906281 (= res!611288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906282 () Bool)

(assert (=> b!906282 (= e!507927 (not e!507920))))

(declare-fun res!611292 () Bool)

(assert (=> b!906282 (=> res!611292 e!507920)))

(assert (=> b!906282 (= res!611292 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26113 _keys!1386))))))

(declare-fun get!13487 (ValueCell!8846 V!29839) V!29839)

(declare-fun dynLambda!1343 (Int (_ BitVec 64)) V!29839)

(assert (=> b!906282 (= lt!408891 (get!13487 (select (arr!25652 _values!1152) i!717) (dynLambda!1343 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906282 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30714 0))(
  ( (Unit!30715) )
))
(declare-fun lt!408889 () Unit!30714)

(declare-fun lemmaKeyInListMapIsInArray!202 (array!53397 array!53395 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 64) Int) Unit!30714)

(assert (=> b!906282 (= lt!408889 (lemmaKeyInListMapIsInArray!202 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906283 () Bool)

(assert (=> b!906283 (= e!507926 tp_is_empty!18655)))

(declare-fun b!906284 () Bool)

(assert (=> b!906284 (= e!507922 true)))

(assert (=> b!906284 (= (apply!453 lt!408890 k0!1033) lt!408891)))

(declare-fun lt!408892 () Unit!30714)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!9 (array!53397 array!53395 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 64) V!29839 (_ BitVec 32) Int) Unit!30714)

(assert (=> b!906284 (= lt!408892 (lemmaListMapApplyFromThenApplyFromZero!9 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408891 i!717 defaultEntry!1160))))

(assert (= (and start!77820 res!611289) b!906278))

(assert (= (and b!906278 res!611291) b!906281))

(assert (= (and b!906281 res!611288) b!906277))

(assert (= (and b!906277 res!611293) b!906276))

(assert (= (and b!906276 res!611287) b!906275))

(assert (= (and b!906275 res!611290) b!906273))

(assert (= (and b!906273 res!611285) b!906282))

(assert (= (and b!906282 (not res!611292)) b!906279))

(assert (= (and b!906279 (not res!611284)) b!906274))

(assert (= (and b!906274 (not res!611286)) b!906284))

(assert (= (and b!906272 condMapEmpty!29695) mapIsEmpty!29695))

(assert (= (and b!906272 (not condMapEmpty!29695)) mapNonEmpty!29695))

(get-info :version)

(assert (= (and mapNonEmpty!29695 ((_ is ValueCellFull!8846) mapValue!29695)) b!906280))

(assert (= (and b!906272 ((_ is ValueCellFull!8846) mapDefault!29695)) b!906283))

(assert (= start!77820 b!906272))

(declare-fun b_lambda!13125 () Bool)

(assert (=> (not b_lambda!13125) (not b!906282)))

(declare-fun t!25371 () Bool)

(declare-fun tb!5251 () Bool)

(assert (=> (and start!77820 (= defaultEntry!1160 defaultEntry!1160) t!25371) tb!5251))

(declare-fun result!10305 () Bool)

(assert (=> tb!5251 (= result!10305 tp_is_empty!18655)))

(assert (=> b!906282 t!25371))

(declare-fun b_and!26639 () Bool)

(assert (= b_and!26637 (and (=> t!25371 result!10305) b_and!26639)))

(declare-fun m!842069 () Bool)

(assert (=> b!906276 m!842069))

(declare-fun m!842071 () Bool)

(assert (=> b!906276 m!842071))

(declare-fun m!842073 () Bool)

(assert (=> b!906274 m!842073))

(declare-fun m!842075 () Bool)

(assert (=> b!906275 m!842075))

(declare-fun m!842077 () Bool)

(assert (=> mapNonEmpty!29695 m!842077))

(declare-fun m!842079 () Bool)

(assert (=> b!906281 m!842079))

(declare-fun m!842081 () Bool)

(assert (=> b!906273 m!842081))

(declare-fun m!842083 () Bool)

(assert (=> b!906284 m!842083))

(declare-fun m!842085 () Bool)

(assert (=> b!906284 m!842085))

(declare-fun m!842087 () Bool)

(assert (=> b!906279 m!842087))

(declare-fun m!842089 () Bool)

(assert (=> b!906279 m!842089))

(declare-fun m!842091 () Bool)

(assert (=> b!906282 m!842091))

(declare-fun m!842093 () Bool)

(assert (=> b!906282 m!842093))

(declare-fun m!842095 () Bool)

(assert (=> b!906282 m!842095))

(declare-fun m!842097 () Bool)

(assert (=> b!906282 m!842097))

(assert (=> b!906282 m!842091))

(assert (=> b!906282 m!842095))

(declare-fun m!842099 () Bool)

(assert (=> b!906282 m!842099))

(declare-fun m!842101 () Bool)

(assert (=> b!906277 m!842101))

(declare-fun m!842103 () Bool)

(assert (=> start!77820 m!842103))

(declare-fun m!842105 () Bool)

(assert (=> start!77820 m!842105))

(declare-fun m!842107 () Bool)

(assert (=> start!77820 m!842107))

(check-sat (not b!906281) (not b!906274) (not mapNonEmpty!29695) (not b!906277) (not b!906279) (not b!906284) (not start!77820) (not b_next!16237) (not b!906275) (not b!906276) b_and!26639 (not b!906282) tp_is_empty!18655 (not b_lambda!13125))
(check-sat b_and!26639 (not b_next!16237))
