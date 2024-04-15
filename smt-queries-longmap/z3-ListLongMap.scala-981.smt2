; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21188 () Bool)

(assert start!21188)

(declare-fun b_free!5635 () Bool)

(declare-fun b_next!5635 () Bool)

(assert (=> start!21188 (= b_free!5635 (not b_next!5635))))

(declare-fun tp!19976 () Bool)

(declare-fun b_and!12475 () Bool)

(assert (=> start!21188 (= tp!19976 b_and!12475)))

(declare-fun b!213253 () Bool)

(declare-fun res!104362 () Bool)

(declare-fun e!138691 () Bool)

(assert (=> b!213253 (=> (not res!104362) (not e!138691))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10187 0))(
  ( (array!10188 (arr!4833 (Array (_ BitVec 32) (_ BitVec 64))) (size!5159 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10187)

(assert (=> b!213253 (= res!104362 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5159 _keys!825))))))

(declare-fun b!213254 () Bool)

(declare-fun res!104359 () Bool)

(assert (=> b!213254 (=> (not res!104359) (not e!138691))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213254 (= res!104359 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!9344 () Bool)

(declare-fun mapRes!9344 () Bool)

(assert (=> mapIsEmpty!9344 mapRes!9344))

(declare-fun b!213255 () Bool)

(declare-fun e!138694 () Bool)

(declare-fun tp_is_empty!5497 () Bool)

(assert (=> b!213255 (= e!138694 tp_is_empty!5497)))

(declare-fun b!213256 () Bool)

(declare-fun res!104360 () Bool)

(assert (=> b!213256 (=> (not res!104360) (not e!138691))))

(declare-datatypes ((List!3100 0))(
  ( (Nil!3097) (Cons!3096 (h!3738 (_ BitVec 64)) (t!8042 List!3100)) )
))
(declare-fun arrayNoDuplicates!0 (array!10187 (_ BitVec 32) List!3100) Bool)

(assert (=> b!213256 (= res!104360 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3097))))

(declare-fun b!213257 () Bool)

(declare-fun res!104357 () Bool)

(assert (=> b!213257 (=> (not res!104357) (not e!138691))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6977 0))(
  ( (V!6978 (val!2793 Int)) )
))
(declare-datatypes ((ValueCell!2405 0))(
  ( (ValueCellFull!2405 (v!4797 V!6977)) (EmptyCell!2405) )
))
(declare-datatypes ((array!10189 0))(
  ( (array!10190 (arr!4834 (Array (_ BitVec 32) ValueCell!2405)) (size!5160 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10189)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!213257 (= res!104357 (and (= (size!5160 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5159 _keys!825) (size!5160 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun lt!110095 () Bool)

(declare-datatypes ((tuple2!4194 0))(
  ( (tuple2!4195 (_1!2108 (_ BitVec 64)) (_2!2108 V!6977)) )
))
(declare-datatypes ((List!3101 0))(
  ( (Nil!3098) (Cons!3097 (h!3739 tuple2!4194) (t!8043 List!3101)) )
))
(declare-datatypes ((ListLongMap!3097 0))(
  ( (ListLongMap!3098 (toList!1564 List!3101)) )
))
(declare-fun lt!110099 () ListLongMap!3097)

(declare-fun b!213258 () Bool)

(declare-fun lt!110094 () ListLongMap!3097)

(assert (=> b!213258 (= e!138691 (not (or (and (not lt!110095) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110095) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110095) (= lt!110094 lt!110099))))))

(assert (=> b!213258 (= lt!110095 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110097 () ListLongMap!3097)

(declare-fun zeroValue!615 () V!6977)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6977)

(declare-fun getCurrentListMap!1073 (array!10187 array!10189 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) Int) ListLongMap!3097)

(assert (=> b!213258 (= lt!110097 (getCurrentListMap!1073 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110100 () array!10189)

(assert (=> b!213258 (= lt!110094 (getCurrentListMap!1073 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110098 () ListLongMap!3097)

(assert (=> b!213258 (and (= lt!110099 lt!110098) (= lt!110098 lt!110099))))

(declare-fun lt!110093 () ListLongMap!3097)

(declare-fun v!520 () V!6977)

(declare-fun +!588 (ListLongMap!3097 tuple2!4194) ListLongMap!3097)

(assert (=> b!213258 (= lt!110098 (+!588 lt!110093 (tuple2!4195 k0!843 v!520)))))

(declare-datatypes ((Unit!6428 0))(
  ( (Unit!6429) )
))
(declare-fun lt!110096 () Unit!6428)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 (array!10187 array!10189 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) (_ BitVec 64) V!6977 (_ BitVec 32) Int) Unit!6428)

(assert (=> b!213258 (= lt!110096 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!510 (array!10187 array!10189 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) Int) ListLongMap!3097)

(assert (=> b!213258 (= lt!110099 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213258 (= lt!110100 (array!10190 (store (arr!4834 _values!649) i!601 (ValueCellFull!2405 v!520)) (size!5160 _values!649)))))

(assert (=> b!213258 (= lt!110093 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213259 () Bool)

(declare-fun e!138693 () Bool)

(assert (=> b!213259 (= e!138693 (and e!138694 mapRes!9344))))

(declare-fun condMapEmpty!9344 () Bool)

(declare-fun mapDefault!9344 () ValueCell!2405)

(assert (=> b!213259 (= condMapEmpty!9344 (= (arr!4834 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2405)) mapDefault!9344)))))

(declare-fun b!213260 () Bool)

(declare-fun e!138692 () Bool)

(assert (=> b!213260 (= e!138692 tp_is_empty!5497)))

(declare-fun b!213261 () Bool)

(declare-fun res!104358 () Bool)

(assert (=> b!213261 (=> (not res!104358) (not e!138691))))

(assert (=> b!213261 (= res!104358 (= (select (arr!4833 _keys!825) i!601) k0!843))))

(declare-fun b!213262 () Bool)

(declare-fun res!104361 () Bool)

(assert (=> b!213262 (=> (not res!104361) (not e!138691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10187 (_ BitVec 32)) Bool)

(assert (=> b!213262 (= res!104361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!9344 () Bool)

(declare-fun tp!19975 () Bool)

(assert (=> mapNonEmpty!9344 (= mapRes!9344 (and tp!19975 e!138692))))

(declare-fun mapKey!9344 () (_ BitVec 32))

(declare-fun mapRest!9344 () (Array (_ BitVec 32) ValueCell!2405))

(declare-fun mapValue!9344 () ValueCell!2405)

(assert (=> mapNonEmpty!9344 (= (arr!4834 _values!649) (store mapRest!9344 mapKey!9344 mapValue!9344))))

(declare-fun res!104356 () Bool)

(assert (=> start!21188 (=> (not res!104356) (not e!138691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21188 (= res!104356 (validMask!0 mask!1149))))

(assert (=> start!21188 e!138691))

(declare-fun array_inv!3175 (array!10189) Bool)

(assert (=> start!21188 (and (array_inv!3175 _values!649) e!138693)))

(assert (=> start!21188 true))

(assert (=> start!21188 tp_is_empty!5497))

(declare-fun array_inv!3176 (array!10187) Bool)

(assert (=> start!21188 (array_inv!3176 _keys!825)))

(assert (=> start!21188 tp!19976))

(assert (= (and start!21188 res!104356) b!213257))

(assert (= (and b!213257 res!104357) b!213262))

(assert (= (and b!213262 res!104361) b!213256))

(assert (= (and b!213256 res!104360) b!213253))

(assert (= (and b!213253 res!104362) b!213254))

(assert (= (and b!213254 res!104359) b!213261))

(assert (= (and b!213261 res!104358) b!213258))

(assert (= (and b!213259 condMapEmpty!9344) mapIsEmpty!9344))

(assert (= (and b!213259 (not condMapEmpty!9344)) mapNonEmpty!9344))

(get-info :version)

(assert (= (and mapNonEmpty!9344 ((_ is ValueCellFull!2405) mapValue!9344)) b!213260))

(assert (= (and b!213259 ((_ is ValueCellFull!2405) mapDefault!9344)) b!213255))

(assert (= start!21188 b!213259))

(declare-fun m!240659 () Bool)

(assert (=> start!21188 m!240659))

(declare-fun m!240661 () Bool)

(assert (=> start!21188 m!240661))

(declare-fun m!240663 () Bool)

(assert (=> start!21188 m!240663))

(declare-fun m!240665 () Bool)

(assert (=> b!213254 m!240665))

(declare-fun m!240667 () Bool)

(assert (=> b!213258 m!240667))

(declare-fun m!240669 () Bool)

(assert (=> b!213258 m!240669))

(declare-fun m!240671 () Bool)

(assert (=> b!213258 m!240671))

(declare-fun m!240673 () Bool)

(assert (=> b!213258 m!240673))

(declare-fun m!240675 () Bool)

(assert (=> b!213258 m!240675))

(declare-fun m!240677 () Bool)

(assert (=> b!213258 m!240677))

(declare-fun m!240679 () Bool)

(assert (=> b!213258 m!240679))

(declare-fun m!240681 () Bool)

(assert (=> b!213262 m!240681))

(declare-fun m!240683 () Bool)

(assert (=> mapNonEmpty!9344 m!240683))

(declare-fun m!240685 () Bool)

(assert (=> b!213256 m!240685))

(declare-fun m!240687 () Bool)

(assert (=> b!213261 m!240687))

(check-sat (not b!213254) (not mapNonEmpty!9344) (not start!21188) b_and!12475 (not b!213262) (not b!213258) tp_is_empty!5497 (not b_next!5635) (not b!213256))
(check-sat b_and!12475 (not b_next!5635))
(get-model)

(declare-fun b!213331 () Bool)

(declare-fun e!138733 () Bool)

(declare-fun call!20195 () Bool)

(assert (=> b!213331 (= e!138733 call!20195)))

(declare-fun d!58057 () Bool)

(declare-fun res!104409 () Bool)

(declare-fun e!138732 () Bool)

(assert (=> d!58057 (=> res!104409 e!138732)))

(assert (=> d!58057 (= res!104409 (bvsge #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> d!58057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!138732)))

(declare-fun bm!20192 () Bool)

(assert (=> bm!20192 (= call!20195 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!213332 () Bool)

(declare-fun e!138731 () Bool)

(assert (=> b!213332 (= e!138731 call!20195)))

(declare-fun b!213333 () Bool)

(assert (=> b!213333 (= e!138733 e!138731)))

(declare-fun lt!110156 () (_ BitVec 64))

(assert (=> b!213333 (= lt!110156 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110157 () Unit!6428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10187 (_ BitVec 64) (_ BitVec 32)) Unit!6428)

(assert (=> b!213333 (= lt!110157 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!110156 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!213333 (arrayContainsKey!0 _keys!825 lt!110156 #b00000000000000000000000000000000)))

(declare-fun lt!110155 () Unit!6428)

(assert (=> b!213333 (= lt!110155 lt!110157)))

(declare-fun res!104410 () Bool)

(declare-datatypes ((SeekEntryResult!715 0))(
  ( (MissingZero!715 (index!5030 (_ BitVec 32))) (Found!715 (index!5031 (_ BitVec 32))) (Intermediate!715 (undefined!1527 Bool) (index!5032 (_ BitVec 32)) (x!22246 (_ BitVec 32))) (Undefined!715) (MissingVacant!715 (index!5033 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10187 (_ BitVec 32)) SeekEntryResult!715)

(assert (=> b!213333 (= res!104410 (= (seekEntryOrOpen!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!715 #b00000000000000000000000000000000)))))

(assert (=> b!213333 (=> (not res!104410) (not e!138731))))

(declare-fun b!213334 () Bool)

(assert (=> b!213334 (= e!138732 e!138733)))

(declare-fun c!35902 () Bool)

(assert (=> b!213334 (= c!35902 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!58057 (not res!104409)) b!213334))

(assert (= (and b!213334 c!35902) b!213333))

(assert (= (and b!213334 (not c!35902)) b!213331))

(assert (= (and b!213333 res!104410) b!213332))

(assert (= (or b!213332 b!213331) bm!20192))

(declare-fun m!240749 () Bool)

(assert (=> bm!20192 m!240749))

(declare-fun m!240751 () Bool)

(assert (=> b!213333 m!240751))

(declare-fun m!240753 () Bool)

(assert (=> b!213333 m!240753))

(declare-fun m!240755 () Bool)

(assert (=> b!213333 m!240755))

(assert (=> b!213333 m!240751))

(declare-fun m!240757 () Bool)

(assert (=> b!213333 m!240757))

(assert (=> b!213334 m!240751))

(assert (=> b!213334 m!240751))

(declare-fun m!240759 () Bool)

(assert (=> b!213334 m!240759))

(assert (=> b!213262 d!58057))

(declare-fun b!213359 () Bool)

(declare-fun lt!110175 () Unit!6428)

(declare-fun lt!110178 () Unit!6428)

(assert (=> b!213359 (= lt!110175 lt!110178)))

(declare-fun lt!110173 () (_ BitVec 64))

(declare-fun lt!110174 () V!6977)

(declare-fun lt!110172 () ListLongMap!3097)

(declare-fun lt!110176 () (_ BitVec 64))

(declare-fun contains!1397 (ListLongMap!3097 (_ BitVec 64)) Bool)

(assert (=> b!213359 (not (contains!1397 (+!588 lt!110172 (tuple2!4195 lt!110176 lt!110174)) lt!110173))))

(declare-fun addStillNotContains!109 (ListLongMap!3097 (_ BitVec 64) V!6977 (_ BitVec 64)) Unit!6428)

(assert (=> b!213359 (= lt!110178 (addStillNotContains!109 lt!110172 lt!110176 lt!110174 lt!110173))))

(assert (=> b!213359 (= lt!110173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2581 (ValueCell!2405 V!6977) V!6977)

(declare-fun dynLambda!533 (Int (_ BitVec 64)) V!6977)

(assert (=> b!213359 (= lt!110174 (get!2581 (select (arr!4834 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213359 (= lt!110176 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20198 () ListLongMap!3097)

(assert (=> b!213359 (= lt!110172 call!20198)))

(declare-fun e!138748 () ListLongMap!3097)

(assert (=> b!213359 (= e!138748 (+!588 call!20198 (tuple2!4195 (select (arr!4833 _keys!825) #b00000000000000000000000000000000) (get!2581 (select (arr!4834 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213360 () Bool)

(declare-fun res!104421 () Bool)

(declare-fun e!138750 () Bool)

(assert (=> b!213360 (=> (not res!104421) (not e!138750))))

(declare-fun lt!110177 () ListLongMap!3097)

(assert (=> b!213360 (= res!104421 (not (contains!1397 lt!110177 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20195 () Bool)

(assert (=> bm!20195 (= call!20198 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58059 () Bool)

(assert (=> d!58059 e!138750))

(declare-fun res!104419 () Bool)

(assert (=> d!58059 (=> (not res!104419) (not e!138750))))

(assert (=> d!58059 (= res!104419 (not (contains!1397 lt!110177 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138752 () ListLongMap!3097)

(assert (=> d!58059 (= lt!110177 e!138752)))

(declare-fun c!35912 () Bool)

(assert (=> d!58059 (= c!35912 (bvsge #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> d!58059 (validMask!0 mask!1149)))

(assert (=> d!58059 (= (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110177)))

(declare-fun b!213361 () Bool)

(declare-fun e!138751 () Bool)

(declare-fun e!138749 () Bool)

(assert (=> b!213361 (= e!138751 e!138749)))

(declare-fun c!35914 () Bool)

(assert (=> b!213361 (= c!35914 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213362 () Bool)

(assert (=> b!213362 (= e!138749 (= lt!110177 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213363 () Bool)

(assert (=> b!213363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> b!213363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5160 _values!649)))))

(declare-fun e!138754 () Bool)

(declare-fun apply!199 (ListLongMap!3097 (_ BitVec 64)) V!6977)

(assert (=> b!213363 (= e!138754 (= (apply!199 lt!110177 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)) (get!2581 (select (arr!4834 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213364 () Bool)

(declare-fun e!138753 () Bool)

(assert (=> b!213364 (= e!138753 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213364 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213365 () Bool)

(assert (=> b!213365 (= e!138752 (ListLongMap!3098 Nil!3098))))

(declare-fun b!213366 () Bool)

(assert (=> b!213366 (= e!138752 e!138748)))

(declare-fun c!35913 () Bool)

(assert (=> b!213366 (= c!35913 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213367 () Bool)

(assert (=> b!213367 (= e!138750 e!138751)))

(declare-fun c!35911 () Bool)

(assert (=> b!213367 (= c!35911 e!138753)))

(declare-fun res!104420 () Bool)

(assert (=> b!213367 (=> (not res!104420) (not e!138753))))

(assert (=> b!213367 (= res!104420 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213368 () Bool)

(assert (=> b!213368 (= e!138751 e!138754)))

(assert (=> b!213368 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun res!104422 () Bool)

(assert (=> b!213368 (= res!104422 (contains!1397 lt!110177 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213368 (=> (not res!104422) (not e!138754))))

(declare-fun b!213369 () Bool)

(assert (=> b!213369 (= e!138748 call!20198)))

(declare-fun b!213370 () Bool)

(declare-fun isEmpty!504 (ListLongMap!3097) Bool)

(assert (=> b!213370 (= e!138749 (isEmpty!504 lt!110177))))

(assert (= (and d!58059 c!35912) b!213365))

(assert (= (and d!58059 (not c!35912)) b!213366))

(assert (= (and b!213366 c!35913) b!213359))

(assert (= (and b!213366 (not c!35913)) b!213369))

(assert (= (or b!213359 b!213369) bm!20195))

(assert (= (and d!58059 res!104419) b!213360))

(assert (= (and b!213360 res!104421) b!213367))

(assert (= (and b!213367 res!104420) b!213364))

(assert (= (and b!213367 c!35911) b!213368))

(assert (= (and b!213367 (not c!35911)) b!213361))

(assert (= (and b!213368 res!104422) b!213363))

(assert (= (and b!213361 c!35914) b!213362))

(assert (= (and b!213361 (not c!35914)) b!213370))

(declare-fun b_lambda!7761 () Bool)

(assert (=> (not b_lambda!7761) (not b!213359)))

(declare-fun t!8049 () Bool)

(declare-fun tb!2903 () Bool)

(assert (=> (and start!21188 (= defaultEntry!657 defaultEntry!657) t!8049) tb!2903))

(declare-fun result!5013 () Bool)

(assert (=> tb!2903 (= result!5013 tp_is_empty!5497)))

(assert (=> b!213359 t!8049))

(declare-fun b_and!12481 () Bool)

(assert (= b_and!12475 (and (=> t!8049 result!5013) b_and!12481)))

(declare-fun b_lambda!7763 () Bool)

(assert (=> (not b_lambda!7763) (not b!213363)))

(assert (=> b!213363 t!8049))

(declare-fun b_and!12483 () Bool)

(assert (= b_and!12481 (and (=> t!8049 result!5013) b_and!12483)))

(declare-fun m!240761 () Bool)

(assert (=> b!213362 m!240761))

(declare-fun m!240763 () Bool)

(assert (=> b!213359 m!240763))

(declare-fun m!240765 () Bool)

(assert (=> b!213359 m!240765))

(assert (=> b!213359 m!240763))

(declare-fun m!240767 () Bool)

(assert (=> b!213359 m!240767))

(declare-fun m!240769 () Bool)

(assert (=> b!213359 m!240769))

(assert (=> b!213359 m!240767))

(declare-fun m!240771 () Bool)

(assert (=> b!213359 m!240771))

(assert (=> b!213359 m!240771))

(declare-fun m!240773 () Bool)

(assert (=> b!213359 m!240773))

(declare-fun m!240775 () Bool)

(assert (=> b!213359 m!240775))

(assert (=> b!213359 m!240751))

(declare-fun m!240777 () Bool)

(assert (=> d!58059 m!240777))

(assert (=> d!58059 m!240659))

(assert (=> bm!20195 m!240761))

(assert (=> b!213363 m!240763))

(assert (=> b!213363 m!240763))

(assert (=> b!213363 m!240767))

(assert (=> b!213363 m!240769))

(assert (=> b!213363 m!240767))

(assert (=> b!213363 m!240751))

(assert (=> b!213363 m!240751))

(declare-fun m!240779 () Bool)

(assert (=> b!213363 m!240779))

(declare-fun m!240781 () Bool)

(assert (=> b!213370 m!240781))

(assert (=> b!213368 m!240751))

(assert (=> b!213368 m!240751))

(declare-fun m!240783 () Bool)

(assert (=> b!213368 m!240783))

(declare-fun m!240785 () Bool)

(assert (=> b!213360 m!240785))

(assert (=> b!213366 m!240751))

(assert (=> b!213366 m!240751))

(assert (=> b!213366 m!240759))

(assert (=> b!213364 m!240751))

(assert (=> b!213364 m!240751))

(assert (=> b!213364 m!240759))

(assert (=> b!213258 d!58059))

(declare-fun b!213373 () Bool)

(declare-fun lt!110182 () Unit!6428)

(declare-fun lt!110185 () Unit!6428)

(assert (=> b!213373 (= lt!110182 lt!110185)))

(declare-fun lt!110179 () ListLongMap!3097)

(declare-fun lt!110181 () V!6977)

(declare-fun lt!110180 () (_ BitVec 64))

(declare-fun lt!110183 () (_ BitVec 64))

(assert (=> b!213373 (not (contains!1397 (+!588 lt!110179 (tuple2!4195 lt!110183 lt!110181)) lt!110180))))

(assert (=> b!213373 (= lt!110185 (addStillNotContains!109 lt!110179 lt!110183 lt!110181 lt!110180))))

(assert (=> b!213373 (= lt!110180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!213373 (= lt!110181 (get!2581 (select (arr!4834 lt!110100) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!213373 (= lt!110183 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun call!20199 () ListLongMap!3097)

(assert (=> b!213373 (= lt!110179 call!20199)))

(declare-fun e!138755 () ListLongMap!3097)

(assert (=> b!213373 (= e!138755 (+!588 call!20199 (tuple2!4195 (select (arr!4833 _keys!825) #b00000000000000000000000000000000) (get!2581 (select (arr!4834 lt!110100) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!213374 () Bool)

(declare-fun res!104425 () Bool)

(declare-fun e!138757 () Bool)

(assert (=> b!213374 (=> (not res!104425) (not e!138757))))

(declare-fun lt!110184 () ListLongMap!3097)

(assert (=> b!213374 (= res!104425 (not (contains!1397 lt!110184 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20196 () Bool)

(assert (=> bm!20196 (= call!20199 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun d!58061 () Bool)

(assert (=> d!58061 e!138757))

(declare-fun res!104423 () Bool)

(assert (=> d!58061 (=> (not res!104423) (not e!138757))))

(assert (=> d!58061 (= res!104423 (not (contains!1397 lt!110184 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!138759 () ListLongMap!3097)

(assert (=> d!58061 (= lt!110184 e!138759)))

(declare-fun c!35916 () Bool)

(assert (=> d!58061 (= c!35916 (bvsge #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> d!58061 (validMask!0 mask!1149)))

(assert (=> d!58061 (= (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110184)))

(declare-fun b!213375 () Bool)

(declare-fun e!138758 () Bool)

(declare-fun e!138756 () Bool)

(assert (=> b!213375 (= e!138758 e!138756)))

(declare-fun c!35918 () Bool)

(assert (=> b!213375 (= c!35918 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213376 () Bool)

(assert (=> b!213376 (= e!138756 (= lt!110184 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!213377 () Bool)

(assert (=> b!213377 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> b!213377 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5160 lt!110100)))))

(declare-fun e!138761 () Bool)

(assert (=> b!213377 (= e!138761 (= (apply!199 lt!110184 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)) (get!2581 (select (arr!4834 lt!110100) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!213378 () Bool)

(declare-fun e!138760 () Bool)

(assert (=> b!213378 (= e!138760 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213378 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!213379 () Bool)

(assert (=> b!213379 (= e!138759 (ListLongMap!3098 Nil!3098))))

(declare-fun b!213380 () Bool)

(assert (=> b!213380 (= e!138759 e!138755)))

(declare-fun c!35917 () Bool)

(assert (=> b!213380 (= c!35917 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213381 () Bool)

(assert (=> b!213381 (= e!138757 e!138758)))

(declare-fun c!35915 () Bool)

(assert (=> b!213381 (= c!35915 e!138760)))

(declare-fun res!104424 () Bool)

(assert (=> b!213381 (=> (not res!104424) (not e!138760))))

(assert (=> b!213381 (= res!104424 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213382 () Bool)

(assert (=> b!213382 (= e!138758 e!138761)))

(assert (=> b!213382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun res!104426 () Bool)

(assert (=> b!213382 (= res!104426 (contains!1397 lt!110184 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213382 (=> (not res!104426) (not e!138761))))

(declare-fun b!213383 () Bool)

(assert (=> b!213383 (= e!138755 call!20199)))

(declare-fun b!213384 () Bool)

(assert (=> b!213384 (= e!138756 (isEmpty!504 lt!110184))))

(assert (= (and d!58061 c!35916) b!213379))

(assert (= (and d!58061 (not c!35916)) b!213380))

(assert (= (and b!213380 c!35917) b!213373))

(assert (= (and b!213380 (not c!35917)) b!213383))

(assert (= (or b!213373 b!213383) bm!20196))

(assert (= (and d!58061 res!104423) b!213374))

(assert (= (and b!213374 res!104425) b!213381))

(assert (= (and b!213381 res!104424) b!213378))

(assert (= (and b!213381 c!35915) b!213382))

(assert (= (and b!213381 (not c!35915)) b!213375))

(assert (= (and b!213382 res!104426) b!213377))

(assert (= (and b!213375 c!35918) b!213376))

(assert (= (and b!213375 (not c!35918)) b!213384))

(declare-fun b_lambda!7765 () Bool)

(assert (=> (not b_lambda!7765) (not b!213373)))

(assert (=> b!213373 t!8049))

(declare-fun b_and!12485 () Bool)

(assert (= b_and!12483 (and (=> t!8049 result!5013) b_and!12485)))

(declare-fun b_lambda!7767 () Bool)

(assert (=> (not b_lambda!7767) (not b!213377)))

(assert (=> b!213377 t!8049))

(declare-fun b_and!12487 () Bool)

(assert (= b_and!12485 (and (=> t!8049 result!5013) b_and!12487)))

(declare-fun m!240787 () Bool)

(assert (=> b!213376 m!240787))

(declare-fun m!240789 () Bool)

(assert (=> b!213373 m!240789))

(declare-fun m!240791 () Bool)

(assert (=> b!213373 m!240791))

(assert (=> b!213373 m!240789))

(assert (=> b!213373 m!240767))

(declare-fun m!240793 () Bool)

(assert (=> b!213373 m!240793))

(assert (=> b!213373 m!240767))

(declare-fun m!240795 () Bool)

(assert (=> b!213373 m!240795))

(assert (=> b!213373 m!240795))

(declare-fun m!240797 () Bool)

(assert (=> b!213373 m!240797))

(declare-fun m!240799 () Bool)

(assert (=> b!213373 m!240799))

(assert (=> b!213373 m!240751))

(declare-fun m!240801 () Bool)

(assert (=> d!58061 m!240801))

(assert (=> d!58061 m!240659))

(assert (=> bm!20196 m!240787))

(assert (=> b!213377 m!240789))

(assert (=> b!213377 m!240789))

(assert (=> b!213377 m!240767))

(assert (=> b!213377 m!240793))

(assert (=> b!213377 m!240767))

(assert (=> b!213377 m!240751))

(assert (=> b!213377 m!240751))

(declare-fun m!240803 () Bool)

(assert (=> b!213377 m!240803))

(declare-fun m!240805 () Bool)

(assert (=> b!213384 m!240805))

(assert (=> b!213382 m!240751))

(assert (=> b!213382 m!240751))

(declare-fun m!240807 () Bool)

(assert (=> b!213382 m!240807))

(declare-fun m!240809 () Bool)

(assert (=> b!213374 m!240809))

(assert (=> b!213380 m!240751))

(assert (=> b!213380 m!240751))

(assert (=> b!213380 m!240759))

(assert (=> b!213378 m!240751))

(assert (=> b!213378 m!240751))

(assert (=> b!213378 m!240759))

(assert (=> b!213258 d!58061))

(declare-fun b!213391 () Bool)

(declare-fun e!138767 () Bool)

(declare-fun e!138766 () Bool)

(assert (=> b!213391 (= e!138767 e!138766)))

(declare-fun c!35921 () Bool)

(assert (=> b!213391 (= c!35921 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun call!20205 () ListLongMap!3097)

(declare-fun call!20204 () ListLongMap!3097)

(declare-fun b!213392 () Bool)

(assert (=> b!213392 (= e!138766 (= call!20205 (+!588 call!20204 (tuple2!4195 k0!843 v!520))))))

(declare-fun bm!20201 () Bool)

(assert (=> bm!20201 (= call!20204 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213393 () Bool)

(assert (=> b!213393 (= e!138766 (= call!20205 call!20204))))

(declare-fun bm!20202 () Bool)

(assert (=> bm!20202 (= call!20205 (getCurrentListMapNoExtraKeys!510 _keys!825 (array!10190 (store (arr!4834 _values!649) i!601 (ValueCellFull!2405 v!520)) (size!5160 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun d!58063 () Bool)

(assert (=> d!58063 e!138767))

(declare-fun res!104429 () Bool)

(assert (=> d!58063 (=> (not res!104429) (not e!138767))))

(assert (=> d!58063 (= res!104429 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5160 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5160 _values!649))))))))

(declare-fun lt!110188 () Unit!6428)

(declare-fun choose!1090 (array!10187 array!10189 (_ BitVec 32) (_ BitVec 32) V!6977 V!6977 (_ BitVec 32) (_ BitVec 64) V!6977 (_ BitVec 32) Int) Unit!6428)

(assert (=> d!58063 (= lt!110188 (choose!1090 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!58063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> d!58063 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!234 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!110188)))

(assert (= (and d!58063 res!104429) b!213391))

(assert (= (and b!213391 c!35921) b!213392))

(assert (= (and b!213391 (not c!35921)) b!213393))

(assert (= (or b!213392 b!213393) bm!20202))

(assert (= (or b!213392 b!213393) bm!20201))

(declare-fun m!240811 () Bool)

(assert (=> b!213392 m!240811))

(assert (=> bm!20201 m!240675))

(assert (=> bm!20202 m!240667))

(declare-fun m!240813 () Bool)

(assert (=> bm!20202 m!240813))

(declare-fun m!240815 () Bool)

(assert (=> d!58063 m!240815))

(assert (=> b!213258 d!58063))

(declare-fun d!58065 () Bool)

(declare-fun e!138770 () Bool)

(assert (=> d!58065 e!138770))

(declare-fun res!104434 () Bool)

(assert (=> d!58065 (=> (not res!104434) (not e!138770))))

(declare-fun lt!110198 () ListLongMap!3097)

(assert (=> d!58065 (= res!104434 (contains!1397 lt!110198 (_1!2108 (tuple2!4195 k0!843 v!520))))))

(declare-fun lt!110200 () List!3101)

(assert (=> d!58065 (= lt!110198 (ListLongMap!3098 lt!110200))))

(declare-fun lt!110199 () Unit!6428)

(declare-fun lt!110197 () Unit!6428)

(assert (=> d!58065 (= lt!110199 lt!110197)))

(declare-datatypes ((Option!261 0))(
  ( (Some!260 (v!4803 V!6977)) (None!259) )
))
(declare-fun getValueByKey!255 (List!3101 (_ BitVec 64)) Option!261)

(assert (=> d!58065 (= (getValueByKey!255 lt!110200 (_1!2108 (tuple2!4195 k0!843 v!520))) (Some!260 (_2!2108 (tuple2!4195 k0!843 v!520))))))

(declare-fun lemmaContainsTupThenGetReturnValue!145 (List!3101 (_ BitVec 64) V!6977) Unit!6428)

(assert (=> d!58065 (= lt!110197 (lemmaContainsTupThenGetReturnValue!145 lt!110200 (_1!2108 (tuple2!4195 k0!843 v!520)) (_2!2108 (tuple2!4195 k0!843 v!520))))))

(declare-fun insertStrictlySorted!148 (List!3101 (_ BitVec 64) V!6977) List!3101)

(assert (=> d!58065 (= lt!110200 (insertStrictlySorted!148 (toList!1564 lt!110093) (_1!2108 (tuple2!4195 k0!843 v!520)) (_2!2108 (tuple2!4195 k0!843 v!520))))))

(assert (=> d!58065 (= (+!588 lt!110093 (tuple2!4195 k0!843 v!520)) lt!110198)))

(declare-fun b!213398 () Bool)

(declare-fun res!104435 () Bool)

(assert (=> b!213398 (=> (not res!104435) (not e!138770))))

(assert (=> b!213398 (= res!104435 (= (getValueByKey!255 (toList!1564 lt!110198) (_1!2108 (tuple2!4195 k0!843 v!520))) (Some!260 (_2!2108 (tuple2!4195 k0!843 v!520)))))))

(declare-fun b!213399 () Bool)

(declare-fun contains!1398 (List!3101 tuple2!4194) Bool)

(assert (=> b!213399 (= e!138770 (contains!1398 (toList!1564 lt!110198) (tuple2!4195 k0!843 v!520)))))

(assert (= (and d!58065 res!104434) b!213398))

(assert (= (and b!213398 res!104435) b!213399))

(declare-fun m!240817 () Bool)

(assert (=> d!58065 m!240817))

(declare-fun m!240819 () Bool)

(assert (=> d!58065 m!240819))

(declare-fun m!240821 () Bool)

(assert (=> d!58065 m!240821))

(declare-fun m!240823 () Bool)

(assert (=> d!58065 m!240823))

(declare-fun m!240825 () Bool)

(assert (=> b!213398 m!240825))

(declare-fun m!240827 () Bool)

(assert (=> b!213399 m!240827))

(assert (=> b!213258 d!58065))

(declare-fun b!213442 () Bool)

(declare-fun e!138805 () ListLongMap!3097)

(declare-fun call!20220 () ListLongMap!3097)

(assert (=> b!213442 (= e!138805 call!20220)))

(declare-fun b!213443 () Bool)

(declare-fun e!138802 () Bool)

(declare-fun e!138803 () Bool)

(assert (=> b!213443 (= e!138802 e!138803)))

(declare-fun c!35936 () Bool)

(assert (=> b!213443 (= c!35936 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213444 () Bool)

(declare-fun e!138800 () Bool)

(declare-fun e!138797 () Bool)

(assert (=> b!213444 (= e!138800 e!138797)))

(declare-fun res!104459 () Bool)

(declare-fun call!20225 () Bool)

(assert (=> b!213444 (= res!104459 call!20225)))

(assert (=> b!213444 (=> (not res!104459) (not e!138797))))

(declare-fun b!213445 () Bool)

(declare-fun e!138804 () Bool)

(assert (=> b!213445 (= e!138804 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213446 () Bool)

(declare-fun e!138809 () ListLongMap!3097)

(declare-fun call!20222 () ListLongMap!3097)

(assert (=> b!213446 (= e!138809 (+!588 call!20222 (tuple2!4195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213447 () Bool)

(declare-fun res!104455 () Bool)

(assert (=> b!213447 (=> (not res!104455) (not e!138802))))

(declare-fun e!138807 () Bool)

(assert (=> b!213447 (= res!104455 e!138807)))

(declare-fun res!104460 () Bool)

(assert (=> b!213447 (=> res!104460 e!138807)))

(declare-fun e!138806 () Bool)

(assert (=> b!213447 (= res!104460 (not e!138806))))

(declare-fun res!104457 () Bool)

(assert (=> b!213447 (=> (not res!104457) (not e!138806))))

(assert (=> b!213447 (= res!104457 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun lt!110258 () ListLongMap!3097)

(declare-fun b!213448 () Bool)

(declare-fun e!138801 () Bool)

(assert (=> b!213448 (= e!138801 (= (apply!199 lt!110258 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)) (get!2581 (select (arr!4834 _values!649) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5160 _values!649)))))

(assert (=> b!213448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213449 () Bool)

(assert (=> b!213449 (= e!138806 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20217 () Bool)

(declare-fun call!20221 () ListLongMap!3097)

(declare-fun call!20224 () ListLongMap!3097)

(assert (=> bm!20217 (= call!20221 call!20224)))

(declare-fun c!35937 () Bool)

(declare-fun bm!20218 () Bool)

(declare-fun call!20226 () ListLongMap!3097)

(declare-fun c!35935 () Bool)

(assert (=> bm!20218 (= call!20222 (+!588 (ite c!35935 call!20226 (ite c!35937 call!20224 call!20221)) (ite (or c!35935 c!35937) (tuple2!4195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!213450 () Bool)

(declare-fun e!138798 () ListLongMap!3097)

(assert (=> b!213450 (= e!138809 e!138798)))

(assert (=> b!213450 (= c!35937 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213451 () Bool)

(declare-fun call!20223 () Bool)

(assert (=> b!213451 (= e!138803 (not call!20223))))

(declare-fun b!213453 () Bool)

(declare-fun c!35934 () Bool)

(assert (=> b!213453 (= c!35934 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213453 (= e!138798 e!138805)))

(declare-fun bm!20219 () Bool)

(assert (=> bm!20219 (= call!20220 call!20222)))

(declare-fun bm!20220 () Bool)

(assert (=> bm!20220 (= call!20224 call!20226)))

(declare-fun bm!20221 () Bool)

(assert (=> bm!20221 (= call!20226 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213454 () Bool)

(assert (=> b!213454 (= e!138798 call!20220)))

(declare-fun b!213455 () Bool)

(declare-fun e!138808 () Bool)

(assert (=> b!213455 (= e!138808 (= (apply!199 lt!110258 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20222 () Bool)

(assert (=> bm!20222 (= call!20225 (contains!1397 lt!110258 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213456 () Bool)

(assert (=> b!213456 (= e!138807 e!138801)))

(declare-fun res!104456 () Bool)

(assert (=> b!213456 (=> (not res!104456) (not e!138801))))

(assert (=> b!213456 (= res!104456 (contains!1397 lt!110258 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213456 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213457 () Bool)

(declare-fun e!138799 () Unit!6428)

(declare-fun lt!110254 () Unit!6428)

(assert (=> b!213457 (= e!138799 lt!110254)))

(declare-fun lt!110259 () ListLongMap!3097)

(assert (=> b!213457 (= lt!110259 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110248 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110255 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110255 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110252 () Unit!6428)

(declare-fun addStillContains!175 (ListLongMap!3097 (_ BitVec 64) V!6977 (_ BitVec 64)) Unit!6428)

(assert (=> b!213457 (= lt!110252 (addStillContains!175 lt!110259 lt!110248 zeroValue!615 lt!110255))))

(assert (=> b!213457 (contains!1397 (+!588 lt!110259 (tuple2!4195 lt!110248 zeroValue!615)) lt!110255)))

(declare-fun lt!110250 () Unit!6428)

(assert (=> b!213457 (= lt!110250 lt!110252)))

(declare-fun lt!110253 () ListLongMap!3097)

(assert (=> b!213457 (= lt!110253 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110251 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110251 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110249 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110249 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110246 () Unit!6428)

(declare-fun addApplyDifferent!175 (ListLongMap!3097 (_ BitVec 64) V!6977 (_ BitVec 64)) Unit!6428)

(assert (=> b!213457 (= lt!110246 (addApplyDifferent!175 lt!110253 lt!110251 minValue!615 lt!110249))))

(assert (=> b!213457 (= (apply!199 (+!588 lt!110253 (tuple2!4195 lt!110251 minValue!615)) lt!110249) (apply!199 lt!110253 lt!110249))))

(declare-fun lt!110256 () Unit!6428)

(assert (=> b!213457 (= lt!110256 lt!110246)))

(declare-fun lt!110245 () ListLongMap!3097)

(assert (=> b!213457 (= lt!110245 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110263 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110257 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110257 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110266 () Unit!6428)

(assert (=> b!213457 (= lt!110266 (addApplyDifferent!175 lt!110245 lt!110263 zeroValue!615 lt!110257))))

(assert (=> b!213457 (= (apply!199 (+!588 lt!110245 (tuple2!4195 lt!110263 zeroValue!615)) lt!110257) (apply!199 lt!110245 lt!110257))))

(declare-fun lt!110261 () Unit!6428)

(assert (=> b!213457 (= lt!110261 lt!110266)))

(declare-fun lt!110260 () ListLongMap!3097)

(assert (=> b!213457 (= lt!110260 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110265 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110265 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110262 () (_ BitVec 64))

(assert (=> b!213457 (= lt!110262 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213457 (= lt!110254 (addApplyDifferent!175 lt!110260 lt!110265 minValue!615 lt!110262))))

(assert (=> b!213457 (= (apply!199 (+!588 lt!110260 (tuple2!4195 lt!110265 minValue!615)) lt!110262) (apply!199 lt!110260 lt!110262))))

(declare-fun b!213458 () Bool)

(assert (=> b!213458 (= e!138805 call!20221)))

(declare-fun b!213459 () Bool)

(assert (=> b!213459 (= e!138803 e!138808)))

(declare-fun res!104458 () Bool)

(assert (=> b!213459 (= res!104458 call!20223)))

(assert (=> b!213459 (=> (not res!104458) (not e!138808))))

(declare-fun b!213460 () Bool)

(assert (=> b!213460 (= e!138800 (not call!20225))))

(declare-fun b!213461 () Bool)

(assert (=> b!213461 (= e!138797 (= (apply!199 lt!110258 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213452 () Bool)

(declare-fun Unit!6434 () Unit!6428)

(assert (=> b!213452 (= e!138799 Unit!6434)))

(declare-fun d!58067 () Bool)

(assert (=> d!58067 e!138802))

(declare-fun res!104454 () Bool)

(assert (=> d!58067 (=> (not res!104454) (not e!138802))))

(assert (=> d!58067 (= res!104454 (or (bvsge #b00000000000000000000000000000000 (size!5159 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))))

(declare-fun lt!110247 () ListLongMap!3097)

(assert (=> d!58067 (= lt!110258 lt!110247)))

(declare-fun lt!110264 () Unit!6428)

(assert (=> d!58067 (= lt!110264 e!138799)))

(declare-fun c!35939 () Bool)

(assert (=> d!58067 (= c!35939 e!138804)))

(declare-fun res!104461 () Bool)

(assert (=> d!58067 (=> (not res!104461) (not e!138804))))

(assert (=> d!58067 (= res!104461 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> d!58067 (= lt!110247 e!138809)))

(assert (=> d!58067 (= c!35935 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58067 (validMask!0 mask!1149)))

(assert (=> d!58067 (= (getCurrentListMap!1073 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110258)))

(declare-fun b!213462 () Bool)

(declare-fun res!104462 () Bool)

(assert (=> b!213462 (=> (not res!104462) (not e!138802))))

(assert (=> b!213462 (= res!104462 e!138800)))

(declare-fun c!35938 () Bool)

(assert (=> b!213462 (= c!35938 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20223 () Bool)

(assert (=> bm!20223 (= call!20223 (contains!1397 lt!110258 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!58067 c!35935) b!213446))

(assert (= (and d!58067 (not c!35935)) b!213450))

(assert (= (and b!213450 c!35937) b!213454))

(assert (= (and b!213450 (not c!35937)) b!213453))

(assert (= (and b!213453 c!35934) b!213442))

(assert (= (and b!213453 (not c!35934)) b!213458))

(assert (= (or b!213442 b!213458) bm!20217))

(assert (= (or b!213454 bm!20217) bm!20220))

(assert (= (or b!213454 b!213442) bm!20219))

(assert (= (or b!213446 bm!20220) bm!20221))

(assert (= (or b!213446 bm!20219) bm!20218))

(assert (= (and d!58067 res!104461) b!213445))

(assert (= (and d!58067 c!35939) b!213457))

(assert (= (and d!58067 (not c!35939)) b!213452))

(assert (= (and d!58067 res!104454) b!213447))

(assert (= (and b!213447 res!104457) b!213449))

(assert (= (and b!213447 (not res!104460)) b!213456))

(assert (= (and b!213456 res!104456) b!213448))

(assert (= (and b!213447 res!104455) b!213462))

(assert (= (and b!213462 c!35938) b!213444))

(assert (= (and b!213462 (not c!35938)) b!213460))

(assert (= (and b!213444 res!104459) b!213461))

(assert (= (or b!213444 b!213460) bm!20222))

(assert (= (and b!213462 res!104462) b!213443))

(assert (= (and b!213443 c!35936) b!213459))

(assert (= (and b!213443 (not c!35936)) b!213451))

(assert (= (and b!213459 res!104458) b!213455))

(assert (= (or b!213459 b!213451) bm!20223))

(declare-fun b_lambda!7769 () Bool)

(assert (=> (not b_lambda!7769) (not b!213448)))

(assert (=> b!213448 t!8049))

(declare-fun b_and!12489 () Bool)

(assert (= b_and!12487 (and (=> t!8049 result!5013) b_and!12489)))

(declare-fun m!240829 () Bool)

(assert (=> b!213446 m!240829))

(assert (=> bm!20221 m!240675))

(declare-fun m!240831 () Bool)

(assert (=> bm!20222 m!240831))

(declare-fun m!240833 () Bool)

(assert (=> bm!20218 m!240833))

(assert (=> b!213449 m!240751))

(assert (=> b!213449 m!240751))

(assert (=> b!213449 m!240759))

(assert (=> d!58067 m!240659))

(assert (=> b!213456 m!240751))

(assert (=> b!213456 m!240751))

(declare-fun m!240835 () Bool)

(assert (=> b!213456 m!240835))

(declare-fun m!240837 () Bool)

(assert (=> b!213461 m!240837))

(assert (=> b!213448 m!240751))

(assert (=> b!213448 m!240767))

(assert (=> b!213448 m!240763))

(assert (=> b!213448 m!240767))

(assert (=> b!213448 m!240769))

(assert (=> b!213448 m!240751))

(declare-fun m!240839 () Bool)

(assert (=> b!213448 m!240839))

(assert (=> b!213448 m!240763))

(declare-fun m!240841 () Bool)

(assert (=> bm!20223 m!240841))

(assert (=> b!213445 m!240751))

(assert (=> b!213445 m!240751))

(assert (=> b!213445 m!240759))

(declare-fun m!240843 () Bool)

(assert (=> b!213455 m!240843))

(declare-fun m!240845 () Bool)

(assert (=> b!213457 m!240845))

(declare-fun m!240847 () Bool)

(assert (=> b!213457 m!240847))

(declare-fun m!240849 () Bool)

(assert (=> b!213457 m!240849))

(declare-fun m!240851 () Bool)

(assert (=> b!213457 m!240851))

(declare-fun m!240853 () Bool)

(assert (=> b!213457 m!240853))

(assert (=> b!213457 m!240675))

(declare-fun m!240855 () Bool)

(assert (=> b!213457 m!240855))

(assert (=> b!213457 m!240851))

(declare-fun m!240857 () Bool)

(assert (=> b!213457 m!240857))

(declare-fun m!240859 () Bool)

(assert (=> b!213457 m!240859))

(declare-fun m!240861 () Bool)

(assert (=> b!213457 m!240861))

(assert (=> b!213457 m!240751))

(declare-fun m!240863 () Bool)

(assert (=> b!213457 m!240863))

(assert (=> b!213457 m!240847))

(declare-fun m!240865 () Bool)

(assert (=> b!213457 m!240865))

(assert (=> b!213457 m!240855))

(declare-fun m!240867 () Bool)

(assert (=> b!213457 m!240867))

(declare-fun m!240869 () Bool)

(assert (=> b!213457 m!240869))

(assert (=> b!213457 m!240845))

(declare-fun m!240871 () Bool)

(assert (=> b!213457 m!240871))

(declare-fun m!240873 () Bool)

(assert (=> b!213457 m!240873))

(assert (=> b!213258 d!58067))

(declare-fun b!213463 () Bool)

(declare-fun e!138818 () ListLongMap!3097)

(declare-fun call!20227 () ListLongMap!3097)

(assert (=> b!213463 (= e!138818 call!20227)))

(declare-fun b!213464 () Bool)

(declare-fun e!138815 () Bool)

(declare-fun e!138816 () Bool)

(assert (=> b!213464 (= e!138815 e!138816)))

(declare-fun c!35942 () Bool)

(assert (=> b!213464 (= c!35942 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213465 () Bool)

(declare-fun e!138813 () Bool)

(declare-fun e!138810 () Bool)

(assert (=> b!213465 (= e!138813 e!138810)))

(declare-fun res!104468 () Bool)

(declare-fun call!20232 () Bool)

(assert (=> b!213465 (= res!104468 call!20232)))

(assert (=> b!213465 (=> (not res!104468) (not e!138810))))

(declare-fun b!213466 () Bool)

(declare-fun e!138817 () Bool)

(assert (=> b!213466 (= e!138817 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213467 () Bool)

(declare-fun e!138822 () ListLongMap!3097)

(declare-fun call!20229 () ListLongMap!3097)

(assert (=> b!213467 (= e!138822 (+!588 call!20229 (tuple2!4195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!213468 () Bool)

(declare-fun res!104464 () Bool)

(assert (=> b!213468 (=> (not res!104464) (not e!138815))))

(declare-fun e!138820 () Bool)

(assert (=> b!213468 (= res!104464 e!138820)))

(declare-fun res!104469 () Bool)

(assert (=> b!213468 (=> res!104469 e!138820)))

(declare-fun e!138819 () Bool)

(assert (=> b!213468 (= res!104469 (not e!138819))))

(declare-fun res!104466 () Bool)

(assert (=> b!213468 (=> (not res!104466) (not e!138819))))

(assert (=> b!213468 (= res!104466 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun lt!110280 () ListLongMap!3097)

(declare-fun b!213469 () Bool)

(declare-fun e!138814 () Bool)

(assert (=> b!213469 (= e!138814 (= (apply!199 lt!110280 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)) (get!2581 (select (arr!4834 lt!110100) #b00000000000000000000000000000000) (dynLambda!533 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5160 lt!110100)))))

(assert (=> b!213469 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213470 () Bool)

(assert (=> b!213470 (= e!138819 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!20224 () Bool)

(declare-fun call!20228 () ListLongMap!3097)

(declare-fun call!20231 () ListLongMap!3097)

(assert (=> bm!20224 (= call!20228 call!20231)))

(declare-fun c!35941 () Bool)

(declare-fun bm!20225 () Bool)

(declare-fun c!35943 () Bool)

(declare-fun call!20233 () ListLongMap!3097)

(assert (=> bm!20225 (= call!20229 (+!588 (ite c!35941 call!20233 (ite c!35943 call!20231 call!20228)) (ite (or c!35941 c!35943) (tuple2!4195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!213471 () Bool)

(declare-fun e!138811 () ListLongMap!3097)

(assert (=> b!213471 (= e!138822 e!138811)))

(assert (=> b!213471 (= c!35943 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!213472 () Bool)

(declare-fun call!20230 () Bool)

(assert (=> b!213472 (= e!138816 (not call!20230))))

(declare-fun b!213474 () Bool)

(declare-fun c!35940 () Bool)

(assert (=> b!213474 (= c!35940 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!213474 (= e!138811 e!138818)))

(declare-fun bm!20226 () Bool)

(assert (=> bm!20226 (= call!20227 call!20229)))

(declare-fun bm!20227 () Bool)

(assert (=> bm!20227 (= call!20231 call!20233)))

(declare-fun bm!20228 () Bool)

(assert (=> bm!20228 (= call!20233 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213475 () Bool)

(assert (=> b!213475 (= e!138811 call!20227)))

(declare-fun b!213476 () Bool)

(declare-fun e!138821 () Bool)

(assert (=> b!213476 (= e!138821 (= (apply!199 lt!110280 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun bm!20229 () Bool)

(assert (=> bm!20229 (= call!20232 (contains!1397 lt!110280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!213477 () Bool)

(assert (=> b!213477 (= e!138820 e!138814)))

(declare-fun res!104465 () Bool)

(assert (=> b!213477 (=> (not res!104465) (not e!138814))))

(assert (=> b!213477 (= res!104465 (contains!1397 lt!110280 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!213477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(declare-fun b!213478 () Bool)

(declare-fun e!138812 () Unit!6428)

(declare-fun lt!110276 () Unit!6428)

(assert (=> b!213478 (= e!138812 lt!110276)))

(declare-fun lt!110281 () ListLongMap!3097)

(assert (=> b!213478 (= lt!110281 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110270 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110277 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110277 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110274 () Unit!6428)

(assert (=> b!213478 (= lt!110274 (addStillContains!175 lt!110281 lt!110270 zeroValue!615 lt!110277))))

(assert (=> b!213478 (contains!1397 (+!588 lt!110281 (tuple2!4195 lt!110270 zeroValue!615)) lt!110277)))

(declare-fun lt!110272 () Unit!6428)

(assert (=> b!213478 (= lt!110272 lt!110274)))

(declare-fun lt!110275 () ListLongMap!3097)

(assert (=> b!213478 (= lt!110275 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110273 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110271 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110271 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110268 () Unit!6428)

(assert (=> b!213478 (= lt!110268 (addApplyDifferent!175 lt!110275 lt!110273 minValue!615 lt!110271))))

(assert (=> b!213478 (= (apply!199 (+!588 lt!110275 (tuple2!4195 lt!110273 minValue!615)) lt!110271) (apply!199 lt!110275 lt!110271))))

(declare-fun lt!110278 () Unit!6428)

(assert (=> b!213478 (= lt!110278 lt!110268)))

(declare-fun lt!110267 () ListLongMap!3097)

(assert (=> b!213478 (= lt!110267 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110285 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110279 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110279 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!110288 () Unit!6428)

(assert (=> b!213478 (= lt!110288 (addApplyDifferent!175 lt!110267 lt!110285 zeroValue!615 lt!110279))))

(assert (=> b!213478 (= (apply!199 (+!588 lt!110267 (tuple2!4195 lt!110285 zeroValue!615)) lt!110279) (apply!199 lt!110267 lt!110279))))

(declare-fun lt!110283 () Unit!6428)

(assert (=> b!213478 (= lt!110283 lt!110288)))

(declare-fun lt!110282 () ListLongMap!3097)

(assert (=> b!213478 (= lt!110282 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110287 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110287 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!110284 () (_ BitVec 64))

(assert (=> b!213478 (= lt!110284 (select (arr!4833 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!213478 (= lt!110276 (addApplyDifferent!175 lt!110282 lt!110287 minValue!615 lt!110284))))

(assert (=> b!213478 (= (apply!199 (+!588 lt!110282 (tuple2!4195 lt!110287 minValue!615)) lt!110284) (apply!199 lt!110282 lt!110284))))

(declare-fun b!213479 () Bool)

(assert (=> b!213479 (= e!138818 call!20228)))

(declare-fun b!213480 () Bool)

(assert (=> b!213480 (= e!138816 e!138821)))

(declare-fun res!104467 () Bool)

(assert (=> b!213480 (= res!104467 call!20230)))

(assert (=> b!213480 (=> (not res!104467) (not e!138821))))

(declare-fun b!213481 () Bool)

(assert (=> b!213481 (= e!138813 (not call!20232))))

(declare-fun b!213482 () Bool)

(assert (=> b!213482 (= e!138810 (= (apply!199 lt!110280 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!213473 () Bool)

(declare-fun Unit!6435 () Unit!6428)

(assert (=> b!213473 (= e!138812 Unit!6435)))

(declare-fun d!58069 () Bool)

(assert (=> d!58069 e!138815))

(declare-fun res!104463 () Bool)

(assert (=> d!58069 (=> (not res!104463) (not e!138815))))

(assert (=> d!58069 (= res!104463 (or (bvsge #b00000000000000000000000000000000 (size!5159 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))))

(declare-fun lt!110269 () ListLongMap!3097)

(assert (=> d!58069 (= lt!110280 lt!110269)))

(declare-fun lt!110286 () Unit!6428)

(assert (=> d!58069 (= lt!110286 e!138812)))

(declare-fun c!35945 () Bool)

(assert (=> d!58069 (= c!35945 e!138817)))

(declare-fun res!104470 () Bool)

(assert (=> d!58069 (=> (not res!104470) (not e!138817))))

(assert (=> d!58069 (= res!104470 (bvslt #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> d!58069 (= lt!110269 e!138822)))

(assert (=> d!58069 (= c!35941 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58069 (validMask!0 mask!1149)))

(assert (=> d!58069 (= (getCurrentListMap!1073 _keys!825 lt!110100 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!110280)))

(declare-fun b!213483 () Bool)

(declare-fun res!104471 () Bool)

(assert (=> b!213483 (=> (not res!104471) (not e!138815))))

(assert (=> b!213483 (= res!104471 e!138813)))

(declare-fun c!35944 () Bool)

(assert (=> b!213483 (= c!35944 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!20230 () Bool)

(assert (=> bm!20230 (= call!20230 (contains!1397 lt!110280 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!58069 c!35941) b!213467))

(assert (= (and d!58069 (not c!35941)) b!213471))

(assert (= (and b!213471 c!35943) b!213475))

(assert (= (and b!213471 (not c!35943)) b!213474))

(assert (= (and b!213474 c!35940) b!213463))

(assert (= (and b!213474 (not c!35940)) b!213479))

(assert (= (or b!213463 b!213479) bm!20224))

(assert (= (or b!213475 bm!20224) bm!20227))

(assert (= (or b!213475 b!213463) bm!20226))

(assert (= (or b!213467 bm!20227) bm!20228))

(assert (= (or b!213467 bm!20226) bm!20225))

(assert (= (and d!58069 res!104470) b!213466))

(assert (= (and d!58069 c!35945) b!213478))

(assert (= (and d!58069 (not c!35945)) b!213473))

(assert (= (and d!58069 res!104463) b!213468))

(assert (= (and b!213468 res!104466) b!213470))

(assert (= (and b!213468 (not res!104469)) b!213477))

(assert (= (and b!213477 res!104465) b!213469))

(assert (= (and b!213468 res!104464) b!213483))

(assert (= (and b!213483 c!35944) b!213465))

(assert (= (and b!213483 (not c!35944)) b!213481))

(assert (= (and b!213465 res!104468) b!213482))

(assert (= (or b!213465 b!213481) bm!20229))

(assert (= (and b!213483 res!104471) b!213464))

(assert (= (and b!213464 c!35942) b!213480))

(assert (= (and b!213464 (not c!35942)) b!213472))

(assert (= (and b!213480 res!104467) b!213476))

(assert (= (or b!213480 b!213472) bm!20230))

(declare-fun b_lambda!7771 () Bool)

(assert (=> (not b_lambda!7771) (not b!213469)))

(assert (=> b!213469 t!8049))

(declare-fun b_and!12491 () Bool)

(assert (= b_and!12489 (and (=> t!8049 result!5013) b_and!12491)))

(declare-fun m!240875 () Bool)

(assert (=> b!213467 m!240875))

(assert (=> bm!20228 m!240669))

(declare-fun m!240877 () Bool)

(assert (=> bm!20229 m!240877))

(declare-fun m!240879 () Bool)

(assert (=> bm!20225 m!240879))

(assert (=> b!213470 m!240751))

(assert (=> b!213470 m!240751))

(assert (=> b!213470 m!240759))

(assert (=> d!58069 m!240659))

(assert (=> b!213477 m!240751))

(assert (=> b!213477 m!240751))

(declare-fun m!240881 () Bool)

(assert (=> b!213477 m!240881))

(declare-fun m!240883 () Bool)

(assert (=> b!213482 m!240883))

(assert (=> b!213469 m!240751))

(assert (=> b!213469 m!240767))

(assert (=> b!213469 m!240789))

(assert (=> b!213469 m!240767))

(assert (=> b!213469 m!240793))

(assert (=> b!213469 m!240751))

(declare-fun m!240885 () Bool)

(assert (=> b!213469 m!240885))

(assert (=> b!213469 m!240789))

(declare-fun m!240887 () Bool)

(assert (=> bm!20230 m!240887))

(assert (=> b!213466 m!240751))

(assert (=> b!213466 m!240751))

(assert (=> b!213466 m!240759))

(declare-fun m!240889 () Bool)

(assert (=> b!213476 m!240889))

(declare-fun m!240891 () Bool)

(assert (=> b!213478 m!240891))

(declare-fun m!240893 () Bool)

(assert (=> b!213478 m!240893))

(declare-fun m!240895 () Bool)

(assert (=> b!213478 m!240895))

(declare-fun m!240897 () Bool)

(assert (=> b!213478 m!240897))

(declare-fun m!240899 () Bool)

(assert (=> b!213478 m!240899))

(assert (=> b!213478 m!240669))

(declare-fun m!240901 () Bool)

(assert (=> b!213478 m!240901))

(assert (=> b!213478 m!240897))

(declare-fun m!240903 () Bool)

(assert (=> b!213478 m!240903))

(declare-fun m!240905 () Bool)

(assert (=> b!213478 m!240905))

(declare-fun m!240907 () Bool)

(assert (=> b!213478 m!240907))

(assert (=> b!213478 m!240751))

(declare-fun m!240909 () Bool)

(assert (=> b!213478 m!240909))

(assert (=> b!213478 m!240893))

(declare-fun m!240911 () Bool)

(assert (=> b!213478 m!240911))

(assert (=> b!213478 m!240901))

(declare-fun m!240913 () Bool)

(assert (=> b!213478 m!240913))

(declare-fun m!240915 () Bool)

(assert (=> b!213478 m!240915))

(assert (=> b!213478 m!240891))

(declare-fun m!240917 () Bool)

(assert (=> b!213478 m!240917))

(declare-fun m!240919 () Bool)

(assert (=> b!213478 m!240919))

(assert (=> b!213258 d!58069))

(declare-fun d!58071 () Bool)

(assert (=> d!58071 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!213254 d!58071))

(declare-fun d!58073 () Bool)

(assert (=> d!58073 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!21188 d!58073))

(declare-fun d!58075 () Bool)

(assert (=> d!58075 (= (array_inv!3175 _values!649) (bvsge (size!5160 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!21188 d!58075))

(declare-fun d!58077 () Bool)

(assert (=> d!58077 (= (array_inv!3176 _keys!825) (bvsge (size!5159 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!21188 d!58077))

(declare-fun bm!20233 () Bool)

(declare-fun call!20236 () Bool)

(declare-fun c!35948 () Bool)

(assert (=> bm!20233 (= call!20236 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35948 (Cons!3096 (select (arr!4833 _keys!825) #b00000000000000000000000000000000) Nil!3097) Nil!3097)))))

(declare-fun b!213494 () Bool)

(declare-fun e!138833 () Bool)

(declare-fun contains!1399 (List!3100 (_ BitVec 64)) Bool)

(assert (=> b!213494 (= e!138833 (contains!1399 Nil!3097 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213495 () Bool)

(declare-fun e!138831 () Bool)

(assert (=> b!213495 (= e!138831 call!20236)))

(declare-fun d!58079 () Bool)

(declare-fun res!104478 () Bool)

(declare-fun e!138834 () Bool)

(assert (=> d!58079 (=> res!104478 e!138834)))

(assert (=> d!58079 (= res!104478 (bvsge #b00000000000000000000000000000000 (size!5159 _keys!825)))))

(assert (=> d!58079 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3097) e!138834)))

(declare-fun b!213496 () Bool)

(declare-fun e!138832 () Bool)

(assert (=> b!213496 (= e!138834 e!138832)))

(declare-fun res!104479 () Bool)

(assert (=> b!213496 (=> (not res!104479) (not e!138832))))

(assert (=> b!213496 (= res!104479 (not e!138833))))

(declare-fun res!104480 () Bool)

(assert (=> b!213496 (=> (not res!104480) (not e!138833))))

(assert (=> b!213496 (= res!104480 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213497 () Bool)

(assert (=> b!213497 (= e!138832 e!138831)))

(assert (=> b!213497 (= c!35948 (validKeyInArray!0 (select (arr!4833 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!213498 () Bool)

(assert (=> b!213498 (= e!138831 call!20236)))

(assert (= (and d!58079 (not res!104478)) b!213496))

(assert (= (and b!213496 res!104480) b!213494))

(assert (= (and b!213496 res!104479) b!213497))

(assert (= (and b!213497 c!35948) b!213495))

(assert (= (and b!213497 (not c!35948)) b!213498))

(assert (= (or b!213495 b!213498) bm!20233))

(assert (=> bm!20233 m!240751))

(declare-fun m!240921 () Bool)

(assert (=> bm!20233 m!240921))

(assert (=> b!213494 m!240751))

(assert (=> b!213494 m!240751))

(declare-fun m!240923 () Bool)

(assert (=> b!213494 m!240923))

(assert (=> b!213496 m!240751))

(assert (=> b!213496 m!240751))

(assert (=> b!213496 m!240759))

(assert (=> b!213497 m!240751))

(assert (=> b!213497 m!240751))

(assert (=> b!213497 m!240759))

(assert (=> b!213256 d!58079))

(declare-fun b!213505 () Bool)

(declare-fun e!138840 () Bool)

(assert (=> b!213505 (= e!138840 tp_is_empty!5497)))

(declare-fun mapNonEmpty!9353 () Bool)

(declare-fun mapRes!9353 () Bool)

(declare-fun tp!19991 () Bool)

(assert (=> mapNonEmpty!9353 (= mapRes!9353 (and tp!19991 e!138840))))

(declare-fun mapRest!9353 () (Array (_ BitVec 32) ValueCell!2405))

(declare-fun mapKey!9353 () (_ BitVec 32))

(declare-fun mapValue!9353 () ValueCell!2405)

(assert (=> mapNonEmpty!9353 (= mapRest!9344 (store mapRest!9353 mapKey!9353 mapValue!9353))))

(declare-fun b!213506 () Bool)

(declare-fun e!138839 () Bool)

(assert (=> b!213506 (= e!138839 tp_is_empty!5497)))

(declare-fun mapIsEmpty!9353 () Bool)

(assert (=> mapIsEmpty!9353 mapRes!9353))

(declare-fun condMapEmpty!9353 () Bool)

(declare-fun mapDefault!9353 () ValueCell!2405)

(assert (=> mapNonEmpty!9344 (= condMapEmpty!9353 (= mapRest!9344 ((as const (Array (_ BitVec 32) ValueCell!2405)) mapDefault!9353)))))

(assert (=> mapNonEmpty!9344 (= tp!19975 (and e!138839 mapRes!9353))))

(assert (= (and mapNonEmpty!9344 condMapEmpty!9353) mapIsEmpty!9353))

(assert (= (and mapNonEmpty!9344 (not condMapEmpty!9353)) mapNonEmpty!9353))

(assert (= (and mapNonEmpty!9353 ((_ is ValueCellFull!2405) mapValue!9353)) b!213505))

(assert (= (and mapNonEmpty!9344 ((_ is ValueCellFull!2405) mapDefault!9353)) b!213506))

(declare-fun m!240925 () Bool)

(assert (=> mapNonEmpty!9353 m!240925))

(declare-fun b_lambda!7773 () Bool)

(assert (= b_lambda!7763 (or (and start!21188 b_free!5635) b_lambda!7773)))

(declare-fun b_lambda!7775 () Bool)

(assert (= b_lambda!7767 (or (and start!21188 b_free!5635) b_lambda!7775)))

(declare-fun b_lambda!7777 () Bool)

(assert (= b_lambda!7771 (or (and start!21188 b_free!5635) b_lambda!7777)))

(declare-fun b_lambda!7779 () Bool)

(assert (= b_lambda!7761 (or (and start!21188 b_free!5635) b_lambda!7779)))

(declare-fun b_lambda!7781 () Bool)

(assert (= b_lambda!7765 (or (and start!21188 b_free!5635) b_lambda!7781)))

(declare-fun b_lambda!7783 () Bool)

(assert (= b_lambda!7769 (or (and start!21188 b_free!5635) b_lambda!7783)))

(check-sat (not bm!20201) (not b!213448) (not b!213478) (not d!58063) (not b!213333) (not b!213494) (not b!213392) (not bm!20229) (not b!213461) (not b!213449) (not bm!20192) (not b!213370) (not b!213382) (not b!213497) (not b!213334) (not b!213366) (not bm!20230) (not b!213384) (not b!213455) (not b!213359) (not b_lambda!7783) (not b!213466) (not d!58069) (not bm!20218) (not b!213362) (not d!58065) (not b!213456) (not b!213399) (not b!213446) (not b!213368) (not d!58061) (not mapNonEmpty!9353) tp_is_empty!5497 (not b_lambda!7775) (not b!213376) (not bm!20202) (not bm!20225) (not bm!20223) (not b!213457) (not bm!20196) (not b!213377) (not b!213476) (not b!213496) (not d!58059) (not b_lambda!7781) (not bm!20221) (not bm!20195) (not b!213380) (not b!213378) (not bm!20233) (not b!213482) (not bm!20228) (not b_lambda!7777) (not b!213445) (not b_lambda!7773) (not b!213467) (not b!213373) (not d!58067) (not b!213360) (not bm!20222) (not b!213470) b_and!12491 (not b!213374) (not b!213364) (not b_lambda!7779) (not b!213477) (not b_next!5635) (not b!213398) (not b!213363) (not b!213469))
(check-sat b_and!12491 (not b_next!5635))
