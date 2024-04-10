; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20420 () Bool)

(assert start!20420)

(declare-fun b_free!5079 () Bool)

(declare-fun b_next!5079 () Bool)

(assert (=> start!20420 (= b_free!5079 (not b_next!5079))))

(declare-fun tp!18269 () Bool)

(declare-fun b_and!11825 () Bool)

(assert (=> start!20420 (= tp!18269 b_and!11825)))

(declare-fun b!202050 () Bool)

(declare-fun e!132377 () Bool)

(declare-fun tp_is_empty!4935 () Bool)

(assert (=> b!202050 (= e!132377 tp_is_empty!4935)))

(declare-fun b!202051 () Bool)

(declare-fun res!96712 () Bool)

(declare-fun e!132380 () Bool)

(assert (=> b!202051 (=> (not res!96712) (not e!132380))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202051 (= res!96712 (validKeyInArray!0 k0!843))))

(declare-fun b!202052 () Bool)

(declare-fun res!96713 () Bool)

(assert (=> b!202052 (=> (not res!96713) (not e!132380))))

(declare-datatypes ((array!9097 0))(
  ( (array!9098 (arr!4299 (Array (_ BitVec 32) (_ BitVec 64))) (size!4624 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9097)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9097 (_ BitVec 32)) Bool)

(assert (=> b!202052 (= res!96713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202053 () Bool)

(declare-fun e!132381 () Bool)

(assert (=> b!202053 (= e!132381 true)))

(declare-datatypes ((V!6227 0))(
  ( (V!6228 (val!2512 Int)) )
))
(declare-datatypes ((tuple2!3806 0))(
  ( (tuple2!3807 (_1!1914 (_ BitVec 64)) (_2!1914 V!6227)) )
))
(declare-datatypes ((List!2716 0))(
  ( (Nil!2713) (Cons!2712 (h!3354 tuple2!3806) (t!7647 List!2716)) )
))
(declare-datatypes ((ListLongMap!2719 0))(
  ( (ListLongMap!2720 (toList!1375 List!2716)) )
))
(declare-fun lt!101191 () ListLongMap!2719)

(declare-fun lt!101196 () tuple2!3806)

(declare-fun lt!101199 () tuple2!3806)

(declare-fun lt!101192 () ListLongMap!2719)

(declare-fun +!402 (ListLongMap!2719 tuple2!3806) ListLongMap!2719)

(assert (=> b!202053 (= (+!402 lt!101191 lt!101199) (+!402 lt!101192 lt!101196))))

(declare-fun minValue!615 () V!6227)

(declare-fun lt!101186 () ListLongMap!2719)

(declare-fun v!520 () V!6227)

(declare-datatypes ((Unit!6104 0))(
  ( (Unit!6105) )
))
(declare-fun lt!101189 () Unit!6104)

(declare-fun addCommutativeForDiffKeys!123 (ListLongMap!2719 (_ BitVec 64) V!6227 (_ BitVec 64) V!6227) Unit!6104)

(assert (=> b!202053 (= lt!101189 (addCommutativeForDiffKeys!123 lt!101186 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202054 () Bool)

(declare-fun e!132378 () Bool)

(assert (=> b!202054 (= e!132378 e!132381)))

(declare-fun res!96717 () Bool)

(assert (=> b!202054 (=> res!96717 e!132381)))

(assert (=> b!202054 (= res!96717 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101184 () ListLongMap!2719)

(assert (=> b!202054 (= lt!101184 lt!101191)))

(assert (=> b!202054 (= lt!101191 (+!402 lt!101186 lt!101196))))

(declare-fun lt!101187 () Unit!6104)

(declare-fun zeroValue!615 () V!6227)

(declare-fun lt!101190 () ListLongMap!2719)

(assert (=> b!202054 (= lt!101187 (addCommutativeForDiffKeys!123 lt!101190 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101188 () ListLongMap!2719)

(assert (=> b!202054 (= lt!101188 (+!402 lt!101184 lt!101199))))

(declare-fun lt!101194 () ListLongMap!2719)

(declare-fun lt!101193 () tuple2!3806)

(assert (=> b!202054 (= lt!101184 (+!402 lt!101194 lt!101193))))

(declare-fun lt!101197 () ListLongMap!2719)

(assert (=> b!202054 (= lt!101197 lt!101192)))

(assert (=> b!202054 (= lt!101192 (+!402 lt!101186 lt!101199))))

(assert (=> b!202054 (= lt!101186 (+!402 lt!101190 lt!101193))))

(declare-fun lt!101195 () ListLongMap!2719)

(assert (=> b!202054 (= lt!101188 (+!402 (+!402 lt!101195 lt!101193) lt!101199))))

(assert (=> b!202054 (= lt!101199 (tuple2!3807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202054 (= lt!101193 (tuple2!3807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202055 () Bool)

(declare-fun res!96715 () Bool)

(assert (=> b!202055 (=> (not res!96715) (not e!132380))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202055 (= res!96715 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4624 _keys!825))))))

(declare-fun mapNonEmpty!8471 () Bool)

(declare-fun mapRes!8471 () Bool)

(declare-fun tp!18268 () Bool)

(assert (=> mapNonEmpty!8471 (= mapRes!8471 (and tp!18268 e!132377))))

(declare-datatypes ((ValueCell!2124 0))(
  ( (ValueCellFull!2124 (v!4482 V!6227)) (EmptyCell!2124) )
))
(declare-fun mapRest!8471 () (Array (_ BitVec 32) ValueCell!2124))

(declare-datatypes ((array!9099 0))(
  ( (array!9100 (arr!4300 (Array (_ BitVec 32) ValueCell!2124)) (size!4625 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9099)

(declare-fun mapKey!8471 () (_ BitVec 32))

(declare-fun mapValue!8471 () ValueCell!2124)

(assert (=> mapNonEmpty!8471 (= (arr!4300 _values!649) (store mapRest!8471 mapKey!8471 mapValue!8471))))

(declare-fun b!202057 () Bool)

(assert (=> b!202057 (= e!132380 (not e!132378))))

(declare-fun res!96716 () Bool)

(assert (=> b!202057 (=> res!96716 e!132378)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202057 (= res!96716 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!959 (array!9097 array!9099 (_ BitVec 32) (_ BitVec 32) V!6227 V!6227 (_ BitVec 32) Int) ListLongMap!2719)

(assert (=> b!202057 (= lt!101197 (getCurrentListMap!959 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101185 () array!9099)

(assert (=> b!202057 (= lt!101188 (getCurrentListMap!959 _keys!825 lt!101185 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202057 (and (= lt!101195 lt!101194) (= lt!101194 lt!101195))))

(assert (=> b!202057 (= lt!101194 (+!402 lt!101190 lt!101196))))

(assert (=> b!202057 (= lt!101196 (tuple2!3807 k0!843 v!520))))

(declare-fun lt!101198 () Unit!6104)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!72 (array!9097 array!9099 (_ BitVec 32) (_ BitVec 32) V!6227 V!6227 (_ BitVec 32) (_ BitVec 64) V!6227 (_ BitVec 32) Int) Unit!6104)

(assert (=> b!202057 (= lt!101198 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!72 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!333 (array!9097 array!9099 (_ BitVec 32) (_ BitVec 32) V!6227 V!6227 (_ BitVec 32) Int) ListLongMap!2719)

(assert (=> b!202057 (= lt!101195 (getCurrentListMapNoExtraKeys!333 _keys!825 lt!101185 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202057 (= lt!101185 (array!9100 (store (arr!4300 _values!649) i!601 (ValueCellFull!2124 v!520)) (size!4625 _values!649)))))

(assert (=> b!202057 (= lt!101190 (getCurrentListMapNoExtraKeys!333 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202058 () Bool)

(declare-fun e!132379 () Bool)

(declare-fun e!132383 () Bool)

(assert (=> b!202058 (= e!132379 (and e!132383 mapRes!8471))))

(declare-fun condMapEmpty!8471 () Bool)

(declare-fun mapDefault!8471 () ValueCell!2124)

(assert (=> b!202058 (= condMapEmpty!8471 (= (arr!4300 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2124)) mapDefault!8471)))))

(declare-fun res!96714 () Bool)

(assert (=> start!20420 (=> (not res!96714) (not e!132380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20420 (= res!96714 (validMask!0 mask!1149))))

(assert (=> start!20420 e!132380))

(declare-fun array_inv!2837 (array!9099) Bool)

(assert (=> start!20420 (and (array_inv!2837 _values!649) e!132379)))

(assert (=> start!20420 true))

(assert (=> start!20420 tp_is_empty!4935))

(declare-fun array_inv!2838 (array!9097) Bool)

(assert (=> start!20420 (array_inv!2838 _keys!825)))

(assert (=> start!20420 tp!18269))

(declare-fun b!202056 () Bool)

(assert (=> b!202056 (= e!132383 tp_is_empty!4935)))

(declare-fun mapIsEmpty!8471 () Bool)

(assert (=> mapIsEmpty!8471 mapRes!8471))

(declare-fun b!202059 () Bool)

(declare-fun res!96711 () Bool)

(assert (=> b!202059 (=> (not res!96711) (not e!132380))))

(declare-datatypes ((List!2717 0))(
  ( (Nil!2714) (Cons!2713 (h!3355 (_ BitVec 64)) (t!7648 List!2717)) )
))
(declare-fun arrayNoDuplicates!0 (array!9097 (_ BitVec 32) List!2717) Bool)

(assert (=> b!202059 (= res!96711 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2714))))

(declare-fun b!202060 () Bool)

(declare-fun res!96718 () Bool)

(assert (=> b!202060 (=> (not res!96718) (not e!132380))))

(assert (=> b!202060 (= res!96718 (= (select (arr!4299 _keys!825) i!601) k0!843))))

(declare-fun b!202061 () Bool)

(declare-fun res!96710 () Bool)

(assert (=> b!202061 (=> (not res!96710) (not e!132380))))

(assert (=> b!202061 (= res!96710 (and (= (size!4625 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4624 _keys!825) (size!4625 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20420 res!96714) b!202061))

(assert (= (and b!202061 res!96710) b!202052))

(assert (= (and b!202052 res!96713) b!202059))

(assert (= (and b!202059 res!96711) b!202055))

(assert (= (and b!202055 res!96715) b!202051))

(assert (= (and b!202051 res!96712) b!202060))

(assert (= (and b!202060 res!96718) b!202057))

(assert (= (and b!202057 (not res!96716)) b!202054))

(assert (= (and b!202054 (not res!96717)) b!202053))

(assert (= (and b!202058 condMapEmpty!8471) mapIsEmpty!8471))

(assert (= (and b!202058 (not condMapEmpty!8471)) mapNonEmpty!8471))

(get-info :version)

(assert (= (and mapNonEmpty!8471 ((_ is ValueCellFull!2124) mapValue!8471)) b!202050))

(assert (= (and b!202058 ((_ is ValueCellFull!2124) mapDefault!8471)) b!202056))

(assert (= start!20420 b!202058))

(declare-fun m!229247 () Bool)

(assert (=> b!202059 m!229247))

(declare-fun m!229249 () Bool)

(assert (=> b!202054 m!229249))

(declare-fun m!229251 () Bool)

(assert (=> b!202054 m!229251))

(declare-fun m!229253 () Bool)

(assert (=> b!202054 m!229253))

(declare-fun m!229255 () Bool)

(assert (=> b!202054 m!229255))

(assert (=> b!202054 m!229249))

(declare-fun m!229257 () Bool)

(assert (=> b!202054 m!229257))

(declare-fun m!229259 () Bool)

(assert (=> b!202054 m!229259))

(declare-fun m!229261 () Bool)

(assert (=> b!202054 m!229261))

(declare-fun m!229263 () Bool)

(assert (=> b!202054 m!229263))

(declare-fun m!229265 () Bool)

(assert (=> b!202052 m!229265))

(declare-fun m!229267 () Bool)

(assert (=> b!202051 m!229267))

(declare-fun m!229269 () Bool)

(assert (=> b!202060 m!229269))

(declare-fun m!229271 () Bool)

(assert (=> mapNonEmpty!8471 m!229271))

(declare-fun m!229273 () Bool)

(assert (=> b!202053 m!229273))

(declare-fun m!229275 () Bool)

(assert (=> b!202053 m!229275))

(declare-fun m!229277 () Bool)

(assert (=> b!202053 m!229277))

(declare-fun m!229279 () Bool)

(assert (=> start!20420 m!229279))

(declare-fun m!229281 () Bool)

(assert (=> start!20420 m!229281))

(declare-fun m!229283 () Bool)

(assert (=> start!20420 m!229283))

(declare-fun m!229285 () Bool)

(assert (=> b!202057 m!229285))

(declare-fun m!229287 () Bool)

(assert (=> b!202057 m!229287))

(declare-fun m!229289 () Bool)

(assert (=> b!202057 m!229289))

(declare-fun m!229291 () Bool)

(assert (=> b!202057 m!229291))

(declare-fun m!229293 () Bool)

(assert (=> b!202057 m!229293))

(declare-fun m!229295 () Bool)

(assert (=> b!202057 m!229295))

(declare-fun m!229297 () Bool)

(assert (=> b!202057 m!229297))

(check-sat (not mapNonEmpty!8471) (not b!202054) b_and!11825 (not b!202057) tp_is_empty!4935 (not b!202059) (not b!202053) (not b_next!5079) (not b!202051) (not b!202052) (not start!20420))
(check-sat b_and!11825 (not b_next!5079))
