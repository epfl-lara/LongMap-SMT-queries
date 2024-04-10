; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39894 () Bool)

(assert start!39894)

(declare-fun b_free!10161 () Bool)

(declare-fun b_next!10161 () Bool)

(assert (=> start!39894 (= b_free!10161 (not b_next!10161))))

(declare-fun tp!36011 () Bool)

(declare-fun b_and!17981 () Bool)

(assert (=> start!39894 (= tp!36011 b_and!17981)))

(declare-fun b!432192 () Bool)

(declare-fun e!255672 () Bool)

(declare-fun e!255680 () Bool)

(assert (=> b!432192 (= e!255672 e!255680)))

(declare-fun res!254198 () Bool)

(assert (=> b!432192 (=> res!254198 e!255680)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26459 0))(
  ( (array!26460 (arr!12679 (Array (_ BitVec 32) (_ BitVec 64))) (size!13031 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26459)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!432192 (= res!254198 (= k0!794 (select (arr!12679 _keys!709) from!863)))))

(assert (=> b!432192 (not (= (select (arr!12679 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12759 0))(
  ( (Unit!12760) )
))
(declare-fun lt!198127 () Unit!12759)

(declare-fun e!255678 () Unit!12759)

(assert (=> b!432192 (= lt!198127 e!255678)))

(declare-fun c!55577 () Bool)

(assert (=> b!432192 (= c!55577 (= (select (arr!12679 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16189 0))(
  ( (V!16190 (val!5701 Int)) )
))
(declare-datatypes ((tuple2!7522 0))(
  ( (tuple2!7523 (_1!3772 (_ BitVec 64)) (_2!3772 V!16189)) )
))
(declare-datatypes ((List!7537 0))(
  ( (Nil!7534) (Cons!7533 (h!8389 tuple2!7522) (t!13147 List!7537)) )
))
(declare-datatypes ((ListLongMap!6435 0))(
  ( (ListLongMap!6436 (toList!3233 List!7537)) )
))
(declare-fun lt!198134 () ListLongMap!6435)

(declare-fun lt!198136 () ListLongMap!6435)

(assert (=> b!432192 (= lt!198134 lt!198136)))

(declare-fun lt!198138 () ListLongMap!6435)

(declare-fun lt!198133 () tuple2!7522)

(declare-fun +!1381 (ListLongMap!6435 tuple2!7522) ListLongMap!6435)

(assert (=> b!432192 (= lt!198136 (+!1381 lt!198138 lt!198133))))

(declare-fun lt!198131 () V!16189)

(assert (=> b!432192 (= lt!198133 (tuple2!7523 (select (arr!12679 _keys!709) from!863) lt!198131))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5313 0))(
  ( (ValueCellFull!5313 (v!7948 V!16189)) (EmptyCell!5313) )
))
(declare-datatypes ((array!26461 0))(
  ( (array!26462 (arr!12680 (Array (_ BitVec 32) ValueCell!5313)) (size!13032 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26461)

(declare-fun get!6303 (ValueCell!5313 V!16189) V!16189)

(declare-fun dynLambda!802 (Int (_ BitVec 64)) V!16189)

(assert (=> b!432192 (= lt!198131 (get!6303 (select (arr!12680 _values!549) from!863) (dynLambda!802 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432193 () Bool)

(declare-fun res!254201 () Bool)

(declare-fun e!255676 () Bool)

(assert (=> b!432193 (=> (not res!254201) (not e!255676))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432193 (= res!254201 (and (= (size!13032 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13031 _keys!709) (size!13032 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432194 () Bool)

(declare-fun res!254193 () Bool)

(assert (=> b!432194 (=> (not res!254193) (not e!255676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26459 (_ BitVec 32)) Bool)

(assert (=> b!432194 (= res!254193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432195 () Bool)

(declare-fun e!255674 () Bool)

(declare-fun tp_is_empty!11313 () Bool)

(assert (=> b!432195 (= e!255674 tp_is_empty!11313)))

(declare-fun b!432196 () Bool)

(declare-fun e!255681 () Bool)

(assert (=> b!432196 (= e!255681 tp_is_empty!11313)))

(declare-fun mapNonEmpty!18591 () Bool)

(declare-fun mapRes!18591 () Bool)

(declare-fun tp!36012 () Bool)

(assert (=> mapNonEmpty!18591 (= mapRes!18591 (and tp!36012 e!255674))))

(declare-fun mapKey!18591 () (_ BitVec 32))

(declare-fun mapValue!18591 () ValueCell!5313)

(declare-fun mapRest!18591 () (Array (_ BitVec 32) ValueCell!5313))

(assert (=> mapNonEmpty!18591 (= (arr!12680 _values!549) (store mapRest!18591 mapKey!18591 mapValue!18591))))

(declare-fun b!432197 () Bool)

(declare-fun res!254204 () Bool)

(assert (=> b!432197 (=> (not res!254204) (not e!255676))))

(declare-fun arrayContainsKey!0 (array!26459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432197 (= res!254204 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432198 () Bool)

(declare-fun res!254194 () Bool)

(assert (=> b!432198 (=> (not res!254194) (not e!255676))))

(declare-datatypes ((List!7538 0))(
  ( (Nil!7535) (Cons!7534 (h!8390 (_ BitVec 64)) (t!13148 List!7538)) )
))
(declare-fun arrayNoDuplicates!0 (array!26459 (_ BitVec 32) List!7538) Bool)

(assert (=> b!432198 (= res!254194 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7535))))

(declare-fun b!432199 () Bool)

(declare-fun res!254192 () Bool)

(assert (=> b!432199 (=> (not res!254192) (not e!255676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432199 (= res!254192 (validKeyInArray!0 k0!794))))

(declare-fun b!432200 () Bool)

(declare-fun res!254202 () Bool)

(assert (=> b!432200 (=> (not res!254202) (not e!255676))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432200 (= res!254202 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13031 _keys!709))))))

(declare-fun b!432201 () Bool)

(declare-fun Unit!12761 () Unit!12759)

(assert (=> b!432201 (= e!255678 Unit!12761)))

(declare-fun b!432202 () Bool)

(assert (=> b!432202 (= e!255680 true)))

(declare-fun lt!198132 () ListLongMap!6435)

(declare-fun lt!198140 () tuple2!7522)

(assert (=> b!432202 (= lt!198136 (+!1381 (+!1381 lt!198132 lt!198133) lt!198140))))

(declare-fun v!412 () V!16189)

(declare-fun lt!198130 () Unit!12759)

(declare-fun addCommutativeForDiffKeys!371 (ListLongMap!6435 (_ BitVec 64) V!16189 (_ BitVec 64) V!16189) Unit!12759)

(assert (=> b!432202 (= lt!198130 (addCommutativeForDiffKeys!371 lt!198132 k0!794 v!412 (select (arr!12679 _keys!709) from!863) lt!198131))))

(declare-fun b!432203 () Bool)

(declare-fun res!254200 () Bool)

(assert (=> b!432203 (=> (not res!254200) (not e!255676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432203 (= res!254200 (validMask!0 mask!1025))))

(declare-fun b!432204 () Bool)

(declare-fun Unit!12762 () Unit!12759)

(assert (=> b!432204 (= e!255678 Unit!12762)))

(declare-fun lt!198129 () Unit!12759)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12759)

(assert (=> b!432204 (= lt!198129 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432204 false))

(declare-fun res!254197 () Bool)

(assert (=> start!39894 (=> (not res!254197) (not e!255676))))

(assert (=> start!39894 (= res!254197 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13031 _keys!709))))))

(assert (=> start!39894 e!255676))

(assert (=> start!39894 tp_is_empty!11313))

(assert (=> start!39894 tp!36011))

(assert (=> start!39894 true))

(declare-fun e!255679 () Bool)

(declare-fun array_inv!9224 (array!26461) Bool)

(assert (=> start!39894 (and (array_inv!9224 _values!549) e!255679)))

(declare-fun array_inv!9225 (array!26459) Bool)

(assert (=> start!39894 (array_inv!9225 _keys!709)))

(declare-fun b!432205 () Bool)

(declare-fun res!254199 () Bool)

(declare-fun e!255675 () Bool)

(assert (=> b!432205 (=> (not res!254199) (not e!255675))))

(assert (=> b!432205 (= res!254199 (bvsle from!863 i!563))))

(declare-fun b!432206 () Bool)

(declare-fun res!254203 () Bool)

(assert (=> b!432206 (=> (not res!254203) (not e!255676))))

(assert (=> b!432206 (= res!254203 (or (= (select (arr!12679 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12679 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432207 () Bool)

(assert (=> b!432207 (= e!255676 e!255675)))

(declare-fun res!254195 () Bool)

(assert (=> b!432207 (=> (not res!254195) (not e!255675))))

(declare-fun lt!198139 () array!26459)

(assert (=> b!432207 (= res!254195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198139 mask!1025))))

(assert (=> b!432207 (= lt!198139 (array!26460 (store (arr!12679 _keys!709) i!563 k0!794) (size!13031 _keys!709)))))

(declare-fun b!432208 () Bool)

(declare-fun e!255673 () Bool)

(assert (=> b!432208 (= e!255673 (not e!255672))))

(declare-fun res!254196 () Bool)

(assert (=> b!432208 (=> res!254196 e!255672)))

(assert (=> b!432208 (= res!254196 (not (validKeyInArray!0 (select (arr!12679 _keys!709) from!863))))))

(declare-fun lt!198135 () ListLongMap!6435)

(assert (=> b!432208 (= lt!198135 lt!198138)))

(assert (=> b!432208 (= lt!198138 (+!1381 lt!198132 lt!198140))))

(declare-fun lt!198126 () array!26461)

(declare-fun minValue!515 () V!16189)

(declare-fun zeroValue!515 () V!16189)

(declare-fun getCurrentListMapNoExtraKeys!1431 (array!26459 array!26461 (_ BitVec 32) (_ BitVec 32) V!16189 V!16189 (_ BitVec 32) Int) ListLongMap!6435)

(assert (=> b!432208 (= lt!198135 (getCurrentListMapNoExtraKeys!1431 lt!198139 lt!198126 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432208 (= lt!198140 (tuple2!7523 k0!794 v!412))))

(assert (=> b!432208 (= lt!198132 (getCurrentListMapNoExtraKeys!1431 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198137 () Unit!12759)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!566 (array!26459 array!26461 (_ BitVec 32) (_ BitVec 32) V!16189 V!16189 (_ BitVec 32) (_ BitVec 64) V!16189 (_ BitVec 32) Int) Unit!12759)

(assert (=> b!432208 (= lt!198137 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!566 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432209 () Bool)

(assert (=> b!432209 (= e!255675 e!255673)))

(declare-fun res!254191 () Bool)

(assert (=> b!432209 (=> (not res!254191) (not e!255673))))

(assert (=> b!432209 (= res!254191 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!432209 (= lt!198134 (getCurrentListMapNoExtraKeys!1431 lt!198139 lt!198126 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432209 (= lt!198126 (array!26462 (store (arr!12680 _values!549) i!563 (ValueCellFull!5313 v!412)) (size!13032 _values!549)))))

(declare-fun lt!198128 () ListLongMap!6435)

(assert (=> b!432209 (= lt!198128 (getCurrentListMapNoExtraKeys!1431 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432210 () Bool)

(assert (=> b!432210 (= e!255679 (and e!255681 mapRes!18591))))

(declare-fun condMapEmpty!18591 () Bool)

(declare-fun mapDefault!18591 () ValueCell!5313)

(assert (=> b!432210 (= condMapEmpty!18591 (= (arr!12680 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5313)) mapDefault!18591)))))

(declare-fun b!432211 () Bool)

(declare-fun res!254205 () Bool)

(assert (=> b!432211 (=> (not res!254205) (not e!255675))))

(assert (=> b!432211 (= res!254205 (arrayNoDuplicates!0 lt!198139 #b00000000000000000000000000000000 Nil!7535))))

(declare-fun mapIsEmpty!18591 () Bool)

(assert (=> mapIsEmpty!18591 mapRes!18591))

(assert (= (and start!39894 res!254197) b!432203))

(assert (= (and b!432203 res!254200) b!432193))

(assert (= (and b!432193 res!254201) b!432194))

(assert (= (and b!432194 res!254193) b!432198))

(assert (= (and b!432198 res!254194) b!432200))

(assert (= (and b!432200 res!254202) b!432199))

(assert (= (and b!432199 res!254192) b!432206))

(assert (= (and b!432206 res!254203) b!432197))

(assert (= (and b!432197 res!254204) b!432207))

(assert (= (and b!432207 res!254195) b!432211))

(assert (= (and b!432211 res!254205) b!432205))

(assert (= (and b!432205 res!254199) b!432209))

(assert (= (and b!432209 res!254191) b!432208))

(assert (= (and b!432208 (not res!254196)) b!432192))

(assert (= (and b!432192 c!55577) b!432204))

(assert (= (and b!432192 (not c!55577)) b!432201))

(assert (= (and b!432192 (not res!254198)) b!432202))

(assert (= (and b!432210 condMapEmpty!18591) mapIsEmpty!18591))

(assert (= (and b!432210 (not condMapEmpty!18591)) mapNonEmpty!18591))

(get-info :version)

(assert (= (and mapNonEmpty!18591 ((_ is ValueCellFull!5313) mapValue!18591)) b!432195))

(assert (= (and b!432210 ((_ is ValueCellFull!5313) mapDefault!18591)) b!432196))

(assert (= start!39894 b!432210))

(declare-fun b_lambda!9249 () Bool)

(assert (=> (not b_lambda!9249) (not b!432192)))

(declare-fun t!13146 () Bool)

(declare-fun tb!3567 () Bool)

(assert (=> (and start!39894 (= defaultEntry!557 defaultEntry!557) t!13146) tb!3567))

(declare-fun result!6661 () Bool)

(assert (=> tb!3567 (= result!6661 tp_is_empty!11313)))

(assert (=> b!432192 t!13146))

(declare-fun b_and!17983 () Bool)

(assert (= b_and!17981 (and (=> t!13146 result!6661) b_and!17983)))

(declare-fun m!420289 () Bool)

(assert (=> b!432197 m!420289))

(declare-fun m!420291 () Bool)

(assert (=> b!432192 m!420291))

(declare-fun m!420293 () Bool)

(assert (=> b!432192 m!420293))

(declare-fun m!420295 () Bool)

(assert (=> b!432192 m!420295))

(declare-fun m!420297 () Bool)

(assert (=> b!432192 m!420297))

(assert (=> b!432192 m!420297))

(assert (=> b!432192 m!420293))

(declare-fun m!420299 () Bool)

(assert (=> b!432192 m!420299))

(declare-fun m!420301 () Bool)

(assert (=> b!432194 m!420301))

(declare-fun m!420303 () Bool)

(assert (=> b!432206 m!420303))

(declare-fun m!420305 () Bool)

(assert (=> mapNonEmpty!18591 m!420305))

(declare-fun m!420307 () Bool)

(assert (=> b!432207 m!420307))

(declare-fun m!420309 () Bool)

(assert (=> b!432207 m!420309))

(declare-fun m!420311 () Bool)

(assert (=> b!432211 m!420311))

(declare-fun m!420313 () Bool)

(assert (=> b!432204 m!420313))

(declare-fun m!420315 () Bool)

(assert (=> b!432209 m!420315))

(declare-fun m!420317 () Bool)

(assert (=> b!432209 m!420317))

(declare-fun m!420319 () Bool)

(assert (=> b!432209 m!420319))

(declare-fun m!420321 () Bool)

(assert (=> b!432199 m!420321))

(assert (=> b!432208 m!420291))

(declare-fun m!420323 () Bool)

(assert (=> b!432208 m!420323))

(declare-fun m!420325 () Bool)

(assert (=> b!432208 m!420325))

(assert (=> b!432208 m!420291))

(declare-fun m!420327 () Bool)

(assert (=> b!432208 m!420327))

(declare-fun m!420329 () Bool)

(assert (=> b!432208 m!420329))

(declare-fun m!420331 () Bool)

(assert (=> b!432208 m!420331))

(declare-fun m!420333 () Bool)

(assert (=> b!432203 m!420333))

(declare-fun m!420335 () Bool)

(assert (=> b!432202 m!420335))

(assert (=> b!432202 m!420335))

(declare-fun m!420337 () Bool)

(assert (=> b!432202 m!420337))

(assert (=> b!432202 m!420291))

(assert (=> b!432202 m!420291))

(declare-fun m!420339 () Bool)

(assert (=> b!432202 m!420339))

(declare-fun m!420341 () Bool)

(assert (=> b!432198 m!420341))

(declare-fun m!420343 () Bool)

(assert (=> start!39894 m!420343))

(declare-fun m!420345 () Bool)

(assert (=> start!39894 m!420345))

(check-sat (not b!432197) (not b!432203) (not b_lambda!9249) tp_is_empty!11313 (not b!432198) (not b!432204) (not b!432192) (not b!432208) b_and!17983 (not b!432209) (not b!432202) (not start!39894) (not b!432207) (not b!432199) (not b_next!10161) (not b!432211) (not b!432194) (not mapNonEmpty!18591))
(check-sat b_and!17983 (not b_next!10161))
