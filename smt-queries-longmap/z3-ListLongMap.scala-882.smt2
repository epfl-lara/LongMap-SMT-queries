; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20392 () Bool)

(assert start!20392)

(declare-fun b_free!5047 () Bool)

(declare-fun b_next!5047 () Bool)

(assert (=> start!20392 (= b_free!5047 (not b_next!5047))))

(declare-fun tp!18172 () Bool)

(declare-fun b_and!11767 () Bool)

(assert (=> start!20392 (= tp!18172 b_and!11767)))

(declare-fun b!201327 () Bool)

(declare-fun res!96186 () Bool)

(declare-fun e!131940 () Bool)

(assert (=> b!201327 (=> (not res!96186) (not e!131940))))

(declare-datatypes ((array!9023 0))(
  ( (array!9024 (arr!4261 (Array (_ BitVec 32) (_ BitVec 64))) (size!4587 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9023)

(declare-datatypes ((List!2673 0))(
  ( (Nil!2670) (Cons!2669 (h!3311 (_ BitVec 64)) (t!7595 List!2673)) )
))
(declare-fun arrayNoDuplicates!0 (array!9023 (_ BitVec 32) List!2673) Bool)

(assert (=> b!201327 (= res!96186 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2670))))

(declare-fun mapNonEmpty!8423 () Bool)

(declare-fun mapRes!8423 () Bool)

(declare-fun tp!18173 () Bool)

(declare-fun e!131941 () Bool)

(assert (=> mapNonEmpty!8423 (= mapRes!8423 (and tp!18173 e!131941))))

(declare-datatypes ((V!6185 0))(
  ( (V!6186 (val!2496 Int)) )
))
(declare-datatypes ((ValueCell!2108 0))(
  ( (ValueCellFull!2108 (v!4460 V!6185)) (EmptyCell!2108) )
))
(declare-datatypes ((array!9025 0))(
  ( (array!9026 (arr!4262 (Array (_ BitVec 32) ValueCell!2108)) (size!4588 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9025)

(declare-fun mapKey!8423 () (_ BitVec 32))

(declare-fun mapValue!8423 () ValueCell!2108)

(declare-fun mapRest!8423 () (Array (_ BitVec 32) ValueCell!2108))

(assert (=> mapNonEmpty!8423 (= (arr!4262 _values!649) (store mapRest!8423 mapKey!8423 mapValue!8423))))

(declare-fun b!201328 () Bool)

(declare-fun e!131945 () Bool)

(assert (=> b!201328 (= e!131940 (not e!131945))))

(declare-fun res!96190 () Bool)

(assert (=> b!201328 (=> res!96190 e!131945)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201328 (= res!96190 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6185)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3754 0))(
  ( (tuple2!3755 (_1!1888 (_ BitVec 64)) (_2!1888 V!6185)) )
))
(declare-datatypes ((List!2674 0))(
  ( (Nil!2671) (Cons!2670 (h!3312 tuple2!3754) (t!7596 List!2674)) )
))
(declare-datatypes ((ListLongMap!2657 0))(
  ( (ListLongMap!2658 (toList!1344 List!2674)) )
))
(declare-fun lt!100243 () ListLongMap!2657)

(declare-fun minValue!615 () V!6185)

(declare-fun getCurrentListMap!906 (array!9023 array!9025 (_ BitVec 32) (_ BitVec 32) V!6185 V!6185 (_ BitVec 32) Int) ListLongMap!2657)

(assert (=> b!201328 (= lt!100243 (getCurrentListMap!906 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100241 () array!9025)

(declare-fun lt!100247 () ListLongMap!2657)

(assert (=> b!201328 (= lt!100247 (getCurrentListMap!906 _keys!825 lt!100241 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100235 () ListLongMap!2657)

(declare-fun lt!100240 () ListLongMap!2657)

(assert (=> b!201328 (and (= lt!100235 lt!100240) (= lt!100240 lt!100235))))

(declare-fun lt!100244 () ListLongMap!2657)

(declare-fun lt!100246 () tuple2!3754)

(declare-fun +!393 (ListLongMap!2657 tuple2!3754) ListLongMap!2657)

(assert (=> b!201328 (= lt!100240 (+!393 lt!100244 lt!100246))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6185)

(assert (=> b!201328 (= lt!100246 (tuple2!3755 k0!843 v!520))))

(declare-datatypes ((Unit!6038 0))(
  ( (Unit!6039) )
))
(declare-fun lt!100238 () Unit!6038)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!65 (array!9023 array!9025 (_ BitVec 32) (_ BitVec 32) V!6185 V!6185 (_ BitVec 32) (_ BitVec 64) V!6185 (_ BitVec 32) Int) Unit!6038)

(assert (=> b!201328 (= lt!100238 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!65 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!316 (array!9023 array!9025 (_ BitVec 32) (_ BitVec 32) V!6185 V!6185 (_ BitVec 32) Int) ListLongMap!2657)

(assert (=> b!201328 (= lt!100235 (getCurrentListMapNoExtraKeys!316 _keys!825 lt!100241 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201328 (= lt!100241 (array!9026 (store (arr!4262 _values!649) i!601 (ValueCellFull!2108 v!520)) (size!4588 _values!649)))))

(assert (=> b!201328 (= lt!100244 (getCurrentListMapNoExtraKeys!316 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201329 () Bool)

(declare-fun res!96188 () Bool)

(assert (=> b!201329 (=> (not res!96188) (not e!131940))))

(assert (=> b!201329 (= res!96188 (= (select (arr!4261 _keys!825) i!601) k0!843))))

(declare-fun b!201330 () Bool)

(declare-fun e!131944 () Bool)

(declare-fun tp_is_empty!4903 () Bool)

(assert (=> b!201330 (= e!131944 tp_is_empty!4903)))

(declare-fun b!201331 () Bool)

(assert (=> b!201331 (= e!131941 tp_is_empty!4903)))

(declare-fun b!201332 () Bool)

(declare-fun res!96187 () Bool)

(assert (=> b!201332 (=> (not res!96187) (not e!131940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9023 (_ BitVec 32)) Bool)

(assert (=> b!201332 (= res!96187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!96185 () Bool)

(assert (=> start!20392 (=> (not res!96185) (not e!131940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20392 (= res!96185 (validMask!0 mask!1149))))

(assert (=> start!20392 e!131940))

(declare-fun e!131942 () Bool)

(declare-fun array_inv!2789 (array!9025) Bool)

(assert (=> start!20392 (and (array_inv!2789 _values!649) e!131942)))

(assert (=> start!20392 true))

(assert (=> start!20392 tp_is_empty!4903))

(declare-fun array_inv!2790 (array!9023) Bool)

(assert (=> start!20392 (array_inv!2790 _keys!825)))

(assert (=> start!20392 tp!18172))

(declare-fun mapIsEmpty!8423 () Bool)

(assert (=> mapIsEmpty!8423 mapRes!8423))

(declare-fun b!201333 () Bool)

(declare-fun res!96189 () Bool)

(assert (=> b!201333 (=> (not res!96189) (not e!131940))))

(assert (=> b!201333 (= res!96189 (and (= (size!4588 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4587 _keys!825) (size!4588 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201334 () Bool)

(declare-fun e!131946 () Bool)

(assert (=> b!201334 (= e!131946 true)))

(declare-fun lt!100245 () ListLongMap!2657)

(declare-fun lt!100249 () ListLongMap!2657)

(declare-fun lt!100237 () tuple2!3754)

(assert (=> b!201334 (= (+!393 lt!100245 lt!100237) (+!393 lt!100249 lt!100246))))

(declare-fun lt!100248 () Unit!6038)

(declare-fun lt!100236 () ListLongMap!2657)

(declare-fun addCommutativeForDiffKeys!102 (ListLongMap!2657 (_ BitVec 64) V!6185 (_ BitVec 64) V!6185) Unit!6038)

(assert (=> b!201334 (= lt!100248 (addCommutativeForDiffKeys!102 lt!100236 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201335 () Bool)

(assert (=> b!201335 (= e!131942 (and e!131944 mapRes!8423))))

(declare-fun condMapEmpty!8423 () Bool)

(declare-fun mapDefault!8423 () ValueCell!2108)

(assert (=> b!201335 (= condMapEmpty!8423 (= (arr!4262 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2108)) mapDefault!8423)))))

(declare-fun b!201336 () Bool)

(declare-fun res!96184 () Bool)

(assert (=> b!201336 (=> (not res!96184) (not e!131940))))

(assert (=> b!201336 (= res!96184 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4587 _keys!825))))))

(declare-fun b!201337 () Bool)

(assert (=> b!201337 (= e!131945 e!131946)))

(declare-fun res!96183 () Bool)

(assert (=> b!201337 (=> res!96183 e!131946)))

(assert (=> b!201337 (= res!96183 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100250 () ListLongMap!2657)

(assert (=> b!201337 (= lt!100250 lt!100245)))

(assert (=> b!201337 (= lt!100245 (+!393 lt!100236 lt!100246))))

(declare-fun lt!100242 () Unit!6038)

(assert (=> b!201337 (= lt!100242 (addCommutativeForDiffKeys!102 lt!100244 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201337 (= lt!100247 (+!393 lt!100250 lt!100237))))

(declare-fun lt!100239 () tuple2!3754)

(assert (=> b!201337 (= lt!100250 (+!393 lt!100240 lt!100239))))

(assert (=> b!201337 (= lt!100243 lt!100249)))

(assert (=> b!201337 (= lt!100249 (+!393 lt!100236 lt!100237))))

(assert (=> b!201337 (= lt!100236 (+!393 lt!100244 lt!100239))))

(assert (=> b!201337 (= lt!100247 (+!393 (+!393 lt!100235 lt!100239) lt!100237))))

(assert (=> b!201337 (= lt!100237 (tuple2!3755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201337 (= lt!100239 (tuple2!3755 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201338 () Bool)

(declare-fun res!96191 () Bool)

(assert (=> b!201338 (=> (not res!96191) (not e!131940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201338 (= res!96191 (validKeyInArray!0 k0!843))))

(assert (= (and start!20392 res!96185) b!201333))

(assert (= (and b!201333 res!96189) b!201332))

(assert (= (and b!201332 res!96187) b!201327))

(assert (= (and b!201327 res!96186) b!201336))

(assert (= (and b!201336 res!96184) b!201338))

(assert (= (and b!201338 res!96191) b!201329))

(assert (= (and b!201329 res!96188) b!201328))

(assert (= (and b!201328 (not res!96190)) b!201337))

(assert (= (and b!201337 (not res!96183)) b!201334))

(assert (= (and b!201335 condMapEmpty!8423) mapIsEmpty!8423))

(assert (= (and b!201335 (not condMapEmpty!8423)) mapNonEmpty!8423))

(get-info :version)

(assert (= (and mapNonEmpty!8423 ((_ is ValueCellFull!2108) mapValue!8423)) b!201331))

(assert (= (and b!201335 ((_ is ValueCellFull!2108) mapDefault!8423)) b!201330))

(assert (= start!20392 b!201335))

(declare-fun m!227799 () Bool)

(assert (=> b!201329 m!227799))

(declare-fun m!227801 () Bool)

(assert (=> b!201327 m!227801))

(declare-fun m!227803 () Bool)

(assert (=> start!20392 m!227803))

(declare-fun m!227805 () Bool)

(assert (=> start!20392 m!227805))

(declare-fun m!227807 () Bool)

(assert (=> start!20392 m!227807))

(declare-fun m!227809 () Bool)

(assert (=> b!201332 m!227809))

(declare-fun m!227811 () Bool)

(assert (=> b!201328 m!227811))

(declare-fun m!227813 () Bool)

(assert (=> b!201328 m!227813))

(declare-fun m!227815 () Bool)

(assert (=> b!201328 m!227815))

(declare-fun m!227817 () Bool)

(assert (=> b!201328 m!227817))

(declare-fun m!227819 () Bool)

(assert (=> b!201328 m!227819))

(declare-fun m!227821 () Bool)

(assert (=> b!201328 m!227821))

(declare-fun m!227823 () Bool)

(assert (=> b!201328 m!227823))

(declare-fun m!227825 () Bool)

(assert (=> b!201334 m!227825))

(declare-fun m!227827 () Bool)

(assert (=> b!201334 m!227827))

(declare-fun m!227829 () Bool)

(assert (=> b!201334 m!227829))

(declare-fun m!227831 () Bool)

(assert (=> b!201338 m!227831))

(declare-fun m!227833 () Bool)

(assert (=> b!201337 m!227833))

(declare-fun m!227835 () Bool)

(assert (=> b!201337 m!227835))

(declare-fun m!227837 () Bool)

(assert (=> b!201337 m!227837))

(declare-fun m!227839 () Bool)

(assert (=> b!201337 m!227839))

(declare-fun m!227841 () Bool)

(assert (=> b!201337 m!227841))

(declare-fun m!227843 () Bool)

(assert (=> b!201337 m!227843))

(declare-fun m!227845 () Bool)

(assert (=> b!201337 m!227845))

(assert (=> b!201337 m!227841))

(declare-fun m!227847 () Bool)

(assert (=> b!201337 m!227847))

(declare-fun m!227849 () Bool)

(assert (=> mapNonEmpty!8423 m!227849))

(check-sat (not b_next!5047) (not b!201327) tp_is_empty!4903 (not start!20392) b_and!11767 (not b!201328) (not b!201337) (not b!201338) (not mapNonEmpty!8423) (not b!201332) (not b!201334))
(check-sat b_and!11767 (not b_next!5047))
