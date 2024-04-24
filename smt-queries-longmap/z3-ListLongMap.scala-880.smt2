; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20380 () Bool)

(assert start!20380)

(declare-fun b_free!5035 () Bool)

(declare-fun b_next!5035 () Bool)

(assert (=> start!20380 (= b_free!5035 (not b_next!5035))))

(declare-fun tp!18136 () Bool)

(declare-fun b_and!11795 () Bool)

(assert (=> start!20380 (= tp!18136 b_and!11795)))

(declare-fun b!201306 () Bool)

(declare-fun res!96142 () Bool)

(declare-fun e!131942 () Bool)

(assert (=> b!201306 (=> (not res!96142) (not e!131942))))

(declare-datatypes ((array!9005 0))(
  ( (array!9006 (arr!4253 (Array (_ BitVec 32) (_ BitVec 64))) (size!4578 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9005)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9005 (_ BitVec 32)) Bool)

(assert (=> b!201306 (= res!96142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201307 () Bool)

(declare-fun res!96143 () Bool)

(assert (=> b!201307 (=> (not res!96143) (not e!131942))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201307 (= res!96143 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4578 _keys!825))))))

(declare-fun b!201308 () Bool)

(declare-fun res!96144 () Bool)

(assert (=> b!201308 (=> (not res!96144) (not e!131942))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201308 (= res!96144 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8405 () Bool)

(declare-fun mapRes!8405 () Bool)

(declare-fun tp!18137 () Bool)

(declare-fun e!131941 () Bool)

(assert (=> mapNonEmpty!8405 (= mapRes!8405 (and tp!18137 e!131941))))

(declare-datatypes ((V!6169 0))(
  ( (V!6170 (val!2490 Int)) )
))
(declare-datatypes ((ValueCell!2102 0))(
  ( (ValueCellFull!2102 (v!4461 V!6169)) (EmptyCell!2102) )
))
(declare-fun mapValue!8405 () ValueCell!2102)

(declare-fun mapRest!8405 () (Array (_ BitVec 32) ValueCell!2102))

(declare-datatypes ((array!9007 0))(
  ( (array!9008 (arr!4254 (Array (_ BitVec 32) ValueCell!2102)) (size!4579 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9007)

(declare-fun mapKey!8405 () (_ BitVec 32))

(assert (=> mapNonEmpty!8405 (= (arr!4254 _values!649) (store mapRest!8405 mapKey!8405 mapValue!8405))))

(declare-fun b!201309 () Bool)

(declare-fun e!131945 () Bool)

(assert (=> b!201309 (= e!131942 (not e!131945))))

(declare-fun res!96140 () Bool)

(assert (=> b!201309 (=> res!96140 e!131945)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201309 (= res!96140 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3706 0))(
  ( (tuple2!3707 (_1!1864 (_ BitVec 64)) (_2!1864 V!6169)) )
))
(declare-datatypes ((List!2618 0))(
  ( (Nil!2615) (Cons!2614 (h!3256 tuple2!3706) (t!7541 List!2618)) )
))
(declare-datatypes ((ListLongMap!2621 0))(
  ( (ListLongMap!2622 (toList!1326 List!2618)) )
))
(declare-fun lt!100193 () ListLongMap!2621)

(declare-fun zeroValue!615 () V!6169)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6169)

(declare-fun getCurrentListMap!918 (array!9005 array!9007 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) Int) ListLongMap!2621)

(assert (=> b!201309 (= lt!100193 (getCurrentListMap!918 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100191 () ListLongMap!2621)

(declare-fun lt!100195 () array!9007)

(assert (=> b!201309 (= lt!100191 (getCurrentListMap!918 _keys!825 lt!100195 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100192 () ListLongMap!2621)

(declare-fun lt!100187 () ListLongMap!2621)

(assert (=> b!201309 (and (= lt!100192 lt!100187) (= lt!100187 lt!100192))))

(declare-fun lt!100197 () ListLongMap!2621)

(declare-fun lt!100200 () tuple2!3706)

(declare-fun +!380 (ListLongMap!2621 tuple2!3706) ListLongMap!2621)

(assert (=> b!201309 (= lt!100187 (+!380 lt!100197 lt!100200))))

(declare-fun v!520 () V!6169)

(assert (=> b!201309 (= lt!100200 (tuple2!3707 k0!843 v!520))))

(declare-datatypes ((Unit!6044 0))(
  ( (Unit!6045) )
))
(declare-fun lt!100194 () Unit!6044)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!54 (array!9005 array!9007 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) (_ BitVec 64) V!6169 (_ BitVec 32) Int) Unit!6044)

(assert (=> b!201309 (= lt!100194 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!54 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!311 (array!9005 array!9007 (_ BitVec 32) (_ BitVec 32) V!6169 V!6169 (_ BitVec 32) Int) ListLongMap!2621)

(assert (=> b!201309 (= lt!100192 (getCurrentListMapNoExtraKeys!311 _keys!825 lt!100195 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201309 (= lt!100195 (array!9008 (store (arr!4254 _values!649) i!601 (ValueCellFull!2102 v!520)) (size!4579 _values!649)))))

(assert (=> b!201309 (= lt!100197 (getCurrentListMapNoExtraKeys!311 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201310 () Bool)

(declare-fun tp_is_empty!4891 () Bool)

(assert (=> b!201310 (= e!131941 tp_is_empty!4891)))

(declare-fun b!201311 () Bool)

(declare-fun e!131944 () Bool)

(assert (=> b!201311 (= e!131944 tp_is_empty!4891)))

(declare-fun b!201312 () Bool)

(declare-fun res!96145 () Bool)

(assert (=> b!201312 (=> (not res!96145) (not e!131942))))

(declare-datatypes ((List!2619 0))(
  ( (Nil!2616) (Cons!2615 (h!3257 (_ BitVec 64)) (t!7542 List!2619)) )
))
(declare-fun arrayNoDuplicates!0 (array!9005 (_ BitVec 32) List!2619) Bool)

(assert (=> b!201312 (= res!96145 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2616))))

(declare-fun mapIsEmpty!8405 () Bool)

(assert (=> mapIsEmpty!8405 mapRes!8405))

(declare-fun b!201313 () Bool)

(declare-fun res!96139 () Bool)

(assert (=> b!201313 (=> (not res!96139) (not e!131942))))

(assert (=> b!201313 (= res!96139 (and (= (size!4579 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4578 _keys!825) (size!4579 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201314 () Bool)

(declare-fun e!131943 () Bool)

(assert (=> b!201314 (= e!131945 e!131943)))

(declare-fun res!96141 () Bool)

(assert (=> b!201314 (=> res!96141 e!131943)))

(assert (=> b!201314 (= res!96141 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100201 () ListLongMap!2621)

(declare-fun lt!100199 () ListLongMap!2621)

(assert (=> b!201314 (= lt!100201 lt!100199)))

(declare-fun lt!100198 () ListLongMap!2621)

(assert (=> b!201314 (= lt!100199 (+!380 lt!100198 lt!100200))))

(declare-fun lt!100188 () Unit!6044)

(declare-fun addCommutativeForDiffKeys!103 (ListLongMap!2621 (_ BitVec 64) V!6169 (_ BitVec 64) V!6169) Unit!6044)

(assert (=> b!201314 (= lt!100188 (addCommutativeForDiffKeys!103 lt!100197 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100196 () tuple2!3706)

(assert (=> b!201314 (= lt!100191 (+!380 lt!100201 lt!100196))))

(declare-fun lt!100189 () tuple2!3706)

(assert (=> b!201314 (= lt!100201 (+!380 lt!100187 lt!100189))))

(declare-fun lt!100202 () ListLongMap!2621)

(assert (=> b!201314 (= lt!100193 lt!100202)))

(assert (=> b!201314 (= lt!100202 (+!380 lt!100198 lt!100196))))

(assert (=> b!201314 (= lt!100198 (+!380 lt!100197 lt!100189))))

(assert (=> b!201314 (= lt!100191 (+!380 (+!380 lt!100192 lt!100189) lt!100196))))

(assert (=> b!201314 (= lt!100196 (tuple2!3707 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201314 (= lt!100189 (tuple2!3707 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!96137 () Bool)

(assert (=> start!20380 (=> (not res!96137) (not e!131942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20380 (= res!96137 (validMask!0 mask!1149))))

(assert (=> start!20380 e!131942))

(declare-fun e!131939 () Bool)

(declare-fun array_inv!2771 (array!9007) Bool)

(assert (=> start!20380 (and (array_inv!2771 _values!649) e!131939)))

(assert (=> start!20380 true))

(assert (=> start!20380 tp_is_empty!4891))

(declare-fun array_inv!2772 (array!9005) Bool)

(assert (=> start!20380 (array_inv!2772 _keys!825)))

(assert (=> start!20380 tp!18136))

(declare-fun b!201305 () Bool)

(assert (=> b!201305 (= e!131939 (and e!131944 mapRes!8405))))

(declare-fun condMapEmpty!8405 () Bool)

(declare-fun mapDefault!8405 () ValueCell!2102)

(assert (=> b!201305 (= condMapEmpty!8405 (= (arr!4254 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2102)) mapDefault!8405)))))

(declare-fun b!201315 () Bool)

(assert (=> b!201315 (= e!131943 (bvsle #b00000000000000000000000000000000 (size!4578 _keys!825)))))

(assert (=> b!201315 (= (+!380 lt!100199 lt!100196) (+!380 lt!100202 lt!100200))))

(declare-fun lt!100190 () Unit!6044)

(assert (=> b!201315 (= lt!100190 (addCommutativeForDiffKeys!103 lt!100198 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201316 () Bool)

(declare-fun res!96138 () Bool)

(assert (=> b!201316 (=> (not res!96138) (not e!131942))))

(assert (=> b!201316 (= res!96138 (= (select (arr!4253 _keys!825) i!601) k0!843))))

(assert (= (and start!20380 res!96137) b!201313))

(assert (= (and b!201313 res!96139) b!201306))

(assert (= (and b!201306 res!96142) b!201312))

(assert (= (and b!201312 res!96145) b!201307))

(assert (= (and b!201307 res!96143) b!201308))

(assert (= (and b!201308 res!96144) b!201316))

(assert (= (and b!201316 res!96138) b!201309))

(assert (= (and b!201309 (not res!96140)) b!201314))

(assert (= (and b!201314 (not res!96141)) b!201315))

(assert (= (and b!201305 condMapEmpty!8405) mapIsEmpty!8405))

(assert (= (and b!201305 (not condMapEmpty!8405)) mapNonEmpty!8405))

(get-info :version)

(assert (= (and mapNonEmpty!8405 ((_ is ValueCellFull!2102) mapValue!8405)) b!201310))

(assert (= (and b!201305 ((_ is ValueCellFull!2102) mapDefault!8405)) b!201311))

(assert (= start!20380 b!201305))

(declare-fun m!228285 () Bool)

(assert (=> start!20380 m!228285))

(declare-fun m!228287 () Bool)

(assert (=> start!20380 m!228287))

(declare-fun m!228289 () Bool)

(assert (=> start!20380 m!228289))

(declare-fun m!228291 () Bool)

(assert (=> mapNonEmpty!8405 m!228291))

(declare-fun m!228293 () Bool)

(assert (=> b!201306 m!228293))

(declare-fun m!228295 () Bool)

(assert (=> b!201314 m!228295))

(declare-fun m!228297 () Bool)

(assert (=> b!201314 m!228297))

(declare-fun m!228299 () Bool)

(assert (=> b!201314 m!228299))

(declare-fun m!228301 () Bool)

(assert (=> b!201314 m!228301))

(declare-fun m!228303 () Bool)

(assert (=> b!201314 m!228303))

(declare-fun m!228305 () Bool)

(assert (=> b!201314 m!228305))

(declare-fun m!228307 () Bool)

(assert (=> b!201314 m!228307))

(assert (=> b!201314 m!228305))

(declare-fun m!228309 () Bool)

(assert (=> b!201314 m!228309))

(declare-fun m!228311 () Bool)

(assert (=> b!201312 m!228311))

(declare-fun m!228313 () Bool)

(assert (=> b!201308 m!228313))

(declare-fun m!228315 () Bool)

(assert (=> b!201315 m!228315))

(declare-fun m!228317 () Bool)

(assert (=> b!201315 m!228317))

(declare-fun m!228319 () Bool)

(assert (=> b!201315 m!228319))

(declare-fun m!228321 () Bool)

(assert (=> b!201309 m!228321))

(declare-fun m!228323 () Bool)

(assert (=> b!201309 m!228323))

(declare-fun m!228325 () Bool)

(assert (=> b!201309 m!228325))

(declare-fun m!228327 () Bool)

(assert (=> b!201309 m!228327))

(declare-fun m!228329 () Bool)

(assert (=> b!201309 m!228329))

(declare-fun m!228331 () Bool)

(assert (=> b!201309 m!228331))

(declare-fun m!228333 () Bool)

(assert (=> b!201309 m!228333))

(declare-fun m!228335 () Bool)

(assert (=> b!201316 m!228335))

(check-sat (not b_next!5035) (not b!201314) (not b!201315) (not mapNonEmpty!8405) tp_is_empty!4891 (not b!201309) (not start!20380) (not b!201306) b_and!11795 (not b!201312) (not b!201308))
(check-sat b_and!11795 (not b_next!5035))
