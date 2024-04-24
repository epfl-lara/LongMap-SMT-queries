; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40010 () Bool)

(assert start!40010)

(declare-fun b_free!10291 () Bool)

(declare-fun b_next!10291 () Bool)

(assert (=> start!40010 (= b_free!10291 (not b_next!10291))))

(declare-fun tp!36401 () Bool)

(declare-fun b_and!18255 () Bool)

(assert (=> start!40010 (= tp!36401 b_and!18255)))

(declare-fun b!436173 () Bool)

(declare-fun e!257599 () Bool)

(declare-fun e!257598 () Bool)

(assert (=> b!436173 (= e!257599 e!257598)))

(declare-fun res!257125 () Bool)

(assert (=> b!436173 (=> (not res!257125) (not e!257598))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436173 (= res!257125 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((array!26712 0))(
  ( (array!26713 (arr!12805 (Array (_ BitVec 32) (_ BitVec 64))) (size!13157 (_ BitVec 32))) )
))
(declare-fun lt!201082 () array!26712)

(declare-datatypes ((V!16363 0))(
  ( (V!16364 (val!5766 Int)) )
))
(declare-fun minValue!515 () V!16363)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16363)

(declare-datatypes ((tuple2!7540 0))(
  ( (tuple2!7541 (_1!3781 (_ BitVec 64)) (_2!3781 V!16363)) )
))
(declare-datatypes ((List!7530 0))(
  ( (Nil!7527) (Cons!7526 (h!8382 tuple2!7540) (t!13262 List!7530)) )
))
(declare-datatypes ((ListLongMap!6455 0))(
  ( (ListLongMap!6456 (toList!3243 List!7530)) )
))
(declare-fun lt!201071 () ListLongMap!6455)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5378 0))(
  ( (ValueCellFull!5378 (v!8014 V!16363)) (EmptyCell!5378) )
))
(declare-datatypes ((array!26714 0))(
  ( (array!26715 (arr!12806 (Array (_ BitVec 32) ValueCell!5378)) (size!13158 (_ BitVec 32))) )
))
(declare-fun lt!201079 () array!26714)

(declare-fun getCurrentListMapNoExtraKeys!1477 (array!26712 array!26714 (_ BitVec 32) (_ BitVec 32) V!16363 V!16363 (_ BitVec 32) Int) ListLongMap!6455)

(assert (=> b!436173 (= lt!201071 (getCurrentListMapNoExtraKeys!1477 lt!201082 lt!201079 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26714)

(declare-fun v!412 () V!16363)

(assert (=> b!436173 (= lt!201079 (array!26715 (store (arr!12806 _values!549) i!563 (ValueCellFull!5378 v!412)) (size!13158 _values!549)))))

(declare-fun _keys!709 () array!26712)

(declare-fun lt!201080 () ListLongMap!6455)

(assert (=> b!436173 (= lt!201080 (getCurrentListMapNoExtraKeys!1477 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436174 () Bool)

(declare-fun res!257122 () Bool)

(declare-fun e!257593 () Bool)

(assert (=> b!436174 (=> (not res!257122) (not e!257593))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436174 (= res!257122 (validKeyInArray!0 k0!794))))

(declare-fun b!436175 () Bool)

(declare-fun res!257126 () Bool)

(assert (=> b!436175 (=> (not res!257126) (not e!257593))))

(declare-datatypes ((List!7531 0))(
  ( (Nil!7528) (Cons!7527 (h!8383 (_ BitVec 64)) (t!13263 List!7531)) )
))
(declare-fun arrayNoDuplicates!0 (array!26712 (_ BitVec 32) List!7531) Bool)

(assert (=> b!436175 (= res!257126 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7528))))

(declare-fun b!436176 () Bool)

(declare-datatypes ((Unit!12960 0))(
  ( (Unit!12961) )
))
(declare-fun e!257594 () Unit!12960)

(declare-fun Unit!12962 () Unit!12960)

(assert (=> b!436176 (= e!257594 Unit!12962)))

(declare-fun lt!201072 () Unit!12960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26712 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12960)

(assert (=> b!436176 (= lt!201072 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436176 false))

(declare-fun b!436177 () Bool)

(declare-fun e!257596 () Bool)

(assert (=> b!436177 (= e!257596 true)))

(declare-fun lt!201073 () tuple2!7540)

(declare-fun lt!201084 () ListLongMap!6455)

(declare-fun lt!201081 () tuple2!7540)

(declare-fun lt!201077 () ListLongMap!6455)

(declare-fun +!1447 (ListLongMap!6455 tuple2!7540) ListLongMap!6455)

(assert (=> b!436177 (= lt!201077 (+!1447 (+!1447 lt!201084 lt!201073) lt!201081))))

(declare-fun lt!201070 () V!16363)

(declare-fun lt!201078 () Unit!12960)

(declare-fun addCommutativeForDiffKeys!413 (ListLongMap!6455 (_ BitVec 64) V!16363 (_ BitVec 64) V!16363) Unit!12960)

(assert (=> b!436177 (= lt!201078 (addCommutativeForDiffKeys!413 lt!201084 k0!794 v!412 (select (arr!12805 _keys!709) from!863) lt!201070))))

(declare-fun res!257118 () Bool)

(assert (=> start!40010 (=> (not res!257118) (not e!257593))))

(assert (=> start!40010 (= res!257118 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13157 _keys!709))))))

(assert (=> start!40010 e!257593))

(declare-fun tp_is_empty!11443 () Bool)

(assert (=> start!40010 tp_is_empty!11443))

(assert (=> start!40010 tp!36401))

(assert (=> start!40010 true))

(declare-fun e!257597 () Bool)

(declare-fun array_inv!9368 (array!26714) Bool)

(assert (=> start!40010 (and (array_inv!9368 _values!549) e!257597)))

(declare-fun array_inv!9369 (array!26712) Bool)

(assert (=> start!40010 (array_inv!9369 _keys!709)))

(declare-fun b!436178 () Bool)

(declare-fun res!257121 () Bool)

(assert (=> b!436178 (=> (not res!257121) (not e!257593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436178 (= res!257121 (validMask!0 mask!1025))))

(declare-fun b!436179 () Bool)

(declare-fun res!257115 () Bool)

(assert (=> b!436179 (=> (not res!257115) (not e!257593))))

(declare-fun arrayContainsKey!0 (array!26712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436179 (= res!257115 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18786 () Bool)

(declare-fun mapRes!18786 () Bool)

(declare-fun tp!36402 () Bool)

(declare-fun e!257595 () Bool)

(assert (=> mapNonEmpty!18786 (= mapRes!18786 (and tp!36402 e!257595))))

(declare-fun mapKey!18786 () (_ BitVec 32))

(declare-fun mapValue!18786 () ValueCell!5378)

(declare-fun mapRest!18786 () (Array (_ BitVec 32) ValueCell!5378))

(assert (=> mapNonEmpty!18786 (= (arr!12806 _values!549) (store mapRest!18786 mapKey!18786 mapValue!18786))))

(declare-fun b!436180 () Bool)

(declare-fun e!257592 () Bool)

(assert (=> b!436180 (= e!257598 (not e!257592))))

(declare-fun res!257123 () Bool)

(assert (=> b!436180 (=> res!257123 e!257592)))

(assert (=> b!436180 (= res!257123 (not (validKeyInArray!0 (select (arr!12805 _keys!709) from!863))))))

(declare-fun lt!201083 () ListLongMap!6455)

(declare-fun lt!201074 () ListLongMap!6455)

(assert (=> b!436180 (= lt!201083 lt!201074)))

(assert (=> b!436180 (= lt!201074 (+!1447 lt!201084 lt!201081))))

(assert (=> b!436180 (= lt!201083 (getCurrentListMapNoExtraKeys!1477 lt!201082 lt!201079 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!436180 (= lt!201081 (tuple2!7541 k0!794 v!412))))

(assert (=> b!436180 (= lt!201084 (getCurrentListMapNoExtraKeys!1477 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!201076 () Unit!12960)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!608 (array!26712 array!26714 (_ BitVec 32) (_ BitVec 32) V!16363 V!16363 (_ BitVec 32) (_ BitVec 64) V!16363 (_ BitVec 32) Int) Unit!12960)

(assert (=> b!436180 (= lt!201076 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!608 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436181 () Bool)

(declare-fun res!257119 () Bool)

(assert (=> b!436181 (=> (not res!257119) (not e!257593))))

(assert (=> b!436181 (= res!257119 (and (= (size!13158 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13157 _keys!709) (size!13158 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436182 () Bool)

(declare-fun res!257113 () Bool)

(assert (=> b!436182 (=> (not res!257113) (not e!257593))))

(assert (=> b!436182 (= res!257113 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13157 _keys!709))))))

(declare-fun b!436183 () Bool)

(declare-fun res!257124 () Bool)

(assert (=> b!436183 (=> (not res!257124) (not e!257593))))

(assert (=> b!436183 (= res!257124 (or (= (select (arr!12805 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12805 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436184 () Bool)

(declare-fun res!257127 () Bool)

(assert (=> b!436184 (=> (not res!257127) (not e!257599))))

(assert (=> b!436184 (= res!257127 (arrayNoDuplicates!0 lt!201082 #b00000000000000000000000000000000 Nil!7528))))

(declare-fun b!436185 () Bool)

(declare-fun e!257590 () Bool)

(assert (=> b!436185 (= e!257590 tp_is_empty!11443)))

(declare-fun b!436186 () Bool)

(assert (=> b!436186 (= e!257597 (and e!257590 mapRes!18786))))

(declare-fun condMapEmpty!18786 () Bool)

(declare-fun mapDefault!18786 () ValueCell!5378)

(assert (=> b!436186 (= condMapEmpty!18786 (= (arr!12806 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5378)) mapDefault!18786)))))

(declare-fun b!436187 () Bool)

(declare-fun res!257114 () Bool)

(assert (=> b!436187 (=> (not res!257114) (not e!257593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26712 (_ BitVec 32)) Bool)

(assert (=> b!436187 (= res!257114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436188 () Bool)

(declare-fun Unit!12963 () Unit!12960)

(assert (=> b!436188 (= e!257594 Unit!12963)))

(declare-fun b!436189 () Bool)

(assert (=> b!436189 (= e!257595 tp_is_empty!11443)))

(declare-fun mapIsEmpty!18786 () Bool)

(assert (=> mapIsEmpty!18786 mapRes!18786))

(declare-fun b!436190 () Bool)

(assert (=> b!436190 (= e!257593 e!257599)))

(declare-fun res!257120 () Bool)

(assert (=> b!436190 (=> (not res!257120) (not e!257599))))

(assert (=> b!436190 (= res!257120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201082 mask!1025))))

(assert (=> b!436190 (= lt!201082 (array!26713 (store (arr!12805 _keys!709) i!563 k0!794) (size!13157 _keys!709)))))

(declare-fun b!436191 () Bool)

(declare-fun res!257117 () Bool)

(assert (=> b!436191 (=> (not res!257117) (not e!257599))))

(assert (=> b!436191 (= res!257117 (bvsle from!863 i!563))))

(declare-fun b!436192 () Bool)

(assert (=> b!436192 (= e!257592 e!257596)))

(declare-fun res!257116 () Bool)

(assert (=> b!436192 (=> res!257116 e!257596)))

(assert (=> b!436192 (= res!257116 (= k0!794 (select (arr!12805 _keys!709) from!863)))))

(assert (=> b!436192 (not (= (select (arr!12805 _keys!709) from!863) k0!794))))

(declare-fun lt!201075 () Unit!12960)

(assert (=> b!436192 (= lt!201075 e!257594)))

(declare-fun c!55749 () Bool)

(assert (=> b!436192 (= c!55749 (= (select (arr!12805 _keys!709) from!863) k0!794))))

(assert (=> b!436192 (= lt!201071 lt!201077)))

(assert (=> b!436192 (= lt!201077 (+!1447 lt!201074 lt!201073))))

(assert (=> b!436192 (= lt!201073 (tuple2!7541 (select (arr!12805 _keys!709) from!863) lt!201070))))

(declare-fun get!6397 (ValueCell!5378 V!16363) V!16363)

(declare-fun dynLambda!846 (Int (_ BitVec 64)) V!16363)

(assert (=> b!436192 (= lt!201070 (get!6397 (select (arr!12806 _values!549) from!863) (dynLambda!846 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40010 res!257118) b!436178))

(assert (= (and b!436178 res!257121) b!436181))

(assert (= (and b!436181 res!257119) b!436187))

(assert (= (and b!436187 res!257114) b!436175))

(assert (= (and b!436175 res!257126) b!436182))

(assert (= (and b!436182 res!257113) b!436174))

(assert (= (and b!436174 res!257122) b!436183))

(assert (= (and b!436183 res!257124) b!436179))

(assert (= (and b!436179 res!257115) b!436190))

(assert (= (and b!436190 res!257120) b!436184))

(assert (= (and b!436184 res!257127) b!436191))

(assert (= (and b!436191 res!257117) b!436173))

(assert (= (and b!436173 res!257125) b!436180))

(assert (= (and b!436180 (not res!257123)) b!436192))

(assert (= (and b!436192 c!55749) b!436176))

(assert (= (and b!436192 (not c!55749)) b!436188))

(assert (= (and b!436192 (not res!257116)) b!436177))

(assert (= (and b!436186 condMapEmpty!18786) mapIsEmpty!18786))

(assert (= (and b!436186 (not condMapEmpty!18786)) mapNonEmpty!18786))

(get-info :version)

(assert (= (and mapNonEmpty!18786 ((_ is ValueCellFull!5378) mapValue!18786)) b!436189))

(assert (= (and b!436186 ((_ is ValueCellFull!5378) mapDefault!18786)) b!436185))

(assert (= start!40010 b!436186))

(declare-fun b_lambda!9401 () Bool)

(assert (=> (not b_lambda!9401) (not b!436192)))

(declare-fun t!13261 () Bool)

(declare-fun tb!3689 () Bool)

(assert (=> (and start!40010 (= defaultEntry!557 defaultEntry!557) t!13261) tb!3689))

(declare-fun result!6913 () Bool)

(assert (=> tb!3689 (= result!6913 tp_is_empty!11443)))

(assert (=> b!436192 t!13261))

(declare-fun b_and!18257 () Bool)

(assert (= b_and!18255 (and (=> t!13261 result!6913) b_and!18257)))

(declare-fun m!424277 () Bool)

(assert (=> b!436190 m!424277))

(declare-fun m!424279 () Bool)

(assert (=> b!436190 m!424279))

(declare-fun m!424281 () Bool)

(assert (=> b!436175 m!424281))

(declare-fun m!424283 () Bool)

(assert (=> b!436179 m!424283))

(declare-fun m!424285 () Bool)

(assert (=> b!436176 m!424285))

(declare-fun m!424287 () Bool)

(assert (=> b!436180 m!424287))

(declare-fun m!424289 () Bool)

(assert (=> b!436180 m!424289))

(declare-fun m!424291 () Bool)

(assert (=> b!436180 m!424291))

(declare-fun m!424293 () Bool)

(assert (=> b!436180 m!424293))

(assert (=> b!436180 m!424287))

(declare-fun m!424295 () Bool)

(assert (=> b!436180 m!424295))

(declare-fun m!424297 () Bool)

(assert (=> b!436180 m!424297))

(declare-fun m!424299 () Bool)

(assert (=> b!436183 m!424299))

(declare-fun m!424301 () Bool)

(assert (=> start!40010 m!424301))

(declare-fun m!424303 () Bool)

(assert (=> start!40010 m!424303))

(declare-fun m!424305 () Bool)

(assert (=> b!436184 m!424305))

(declare-fun m!424307 () Bool)

(assert (=> b!436178 m!424307))

(declare-fun m!424309 () Bool)

(assert (=> b!436187 m!424309))

(declare-fun m!424311 () Bool)

(assert (=> mapNonEmpty!18786 m!424311))

(declare-fun m!424313 () Bool)

(assert (=> b!436177 m!424313))

(assert (=> b!436177 m!424313))

(declare-fun m!424315 () Bool)

(assert (=> b!436177 m!424315))

(assert (=> b!436177 m!424287))

(assert (=> b!436177 m!424287))

(declare-fun m!424317 () Bool)

(assert (=> b!436177 m!424317))

(declare-fun m!424319 () Bool)

(assert (=> b!436173 m!424319))

(declare-fun m!424321 () Bool)

(assert (=> b!436173 m!424321))

(declare-fun m!424323 () Bool)

(assert (=> b!436173 m!424323))

(assert (=> b!436192 m!424287))

(declare-fun m!424325 () Bool)

(assert (=> b!436192 m!424325))

(declare-fun m!424327 () Bool)

(assert (=> b!436192 m!424327))

(declare-fun m!424329 () Bool)

(assert (=> b!436192 m!424329))

(assert (=> b!436192 m!424327))

(assert (=> b!436192 m!424325))

(declare-fun m!424331 () Bool)

(assert (=> b!436192 m!424331))

(declare-fun m!424333 () Bool)

(assert (=> b!436174 m!424333))

(check-sat (not b!436177) (not b!436175) (not b!436174) (not mapNonEmpty!18786) (not b!436190) (not b!436179) (not start!40010) b_and!18257 (not b!436178) (not b_lambda!9401) (not b!436192) (not b!436184) (not b_next!10291) (not b!436176) tp_is_empty!11443 (not b!436187) (not b!436173) (not b!436180))
(check-sat b_and!18257 (not b_next!10291))
